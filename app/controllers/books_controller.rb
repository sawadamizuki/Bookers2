class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book= Book.new(book_params)
     if @book.save
       redirect_to '/books'
     else
       render :show
     end
  end

  def index
    @book = Book.all
    @user = current_user

  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
  end

  def edit
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.permit(:title, :body, :user_id)
  end
end
