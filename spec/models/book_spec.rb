require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with all valid attributes" do
    book = Book.new(title: "Macbeth", author: "William Shakespeare", price: 50, published_date: "2021-02-15")
    expect(book).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(title: nil, author: "William Shakespeare", price: 50, published_date: "2021-02-15")
    expect(book).not_to be_valid
  end

  it "is invalid without an author" do
    book = Book.new(title: "Macbeth", author: nil, price: 50, published_date: "2021-02-15")
    expect(book).not_to be_valid
  end

  it "is invalid without a price" do
    book = Book.new(title: "Macbeth", author: "William Shakespeare", price: nil, published_date: "2021-02-15")
    expect(book).not_to be_valid
  end

  it "is invalid with a non-numerical price" do
    book = Book.new(title: "Macbeth", author: "William Shakespeare", price: "fifty dollars", published_date: "2021-02-15")
    expect(book).not_to be_valid
  end

  it "is invalid with a negative price" do
    book = Book.new(title: "Macbeth", author: "William Shakespeare", price: -1, published_date: "2021-02-15")
    expect(book).not_to be_valid
  end

  it "is invalid without a published date" do
    book = Book.new(title: "Macbeth", author: "William Shakespeare", price: 50, published_date: nil)
    expect(book).not_to be_valid
  end
end
