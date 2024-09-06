# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Creating a book', type: :feature do
  scenario 'user adds a new book successfully' do
    visit new_book_path

    fill_in 'book_title', with: 'Macbeth'
    fill_in 'book_author', with: 'William Shakespeare'
    fill_in 'book_price', with: 50
    select '2021', from: 'book_published_date_1i'
    select 'February', from: 'book_published_date_2i'
    select '15', from: 'book_published_date_3i'
    click_button 'Create Book'

    expect(page).to have_content('Book was successfully created.')
  end

  scenario 'user fails to add a new book with a blank title' do
    visit new_book_path

    fill_in 'book_title', with: ''
    fill_in 'book_author', with: 'William Shakespeare'
    fill_in 'book_price', with: 50
    select '2021', from: 'book_published_date_1i'
    select 'February', from: 'book_published_date_2i'
    select '15', from: 'book_published_date_3i'
    click_on 'Create Book'

    expect(page).to have_content('Error creating book.')
  end

  scenario 'user fails to add a new book with a blank author' do
    visit new_book_path

    fill_in 'book_title', with: 'Macbeth'
    fill_in 'book_author', with: ''
    fill_in 'book_price', with: 50
    select '2021', from: 'book_published_date_1i'
    select 'February', from: 'book_published_date_2i'
    select '15', from: 'book_published_date_3i'
    click_on 'Create Book'

    expect(page).to have_content('Error creating book.')
  end

  scenario 'user fails to add a new book with a non-numeric price' do
    visit new_book_path

    fill_in 'book_title', with: 'Macbeth'
    fill_in 'book_author', with: 'William Shakespeare'
    fill_in 'book_price', with: 'fifty dollars'
    select '2021', from: 'book_published_date_1i'
    select 'February', from: 'book_published_date_2i'
    select '15', from: 'book_published_date_3i'
    click_button 'Create Book'

    expect(page).to have_content('Error creating book.')
  end

  scenario 'user fails to add a new book with a negative price' do
    visit new_book_path

    fill_in 'book_title', with: 'Macbeth'
    fill_in 'book_author', with: 'William Shakespeare'
    fill_in 'book_price', with: -1
    select '2021', from: 'book_published_date_1i'
    select 'February', from: 'book_published_date_2i'
    select '15', from: 'book_published_date_3i'
    click_button 'Create Book'

    expect(page).to have_content('Error creating book.')
  end
end
