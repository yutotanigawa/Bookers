class BooksController < ApplicationController

  def index
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])

  end

  def create

  	book = Book.new(book_params)
  	if book.save
  		flash[:notice] = "Book was successfully created."
  	   redirect_to book_path(book.id)
  	else
  		render book_path
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book)
  end

  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
