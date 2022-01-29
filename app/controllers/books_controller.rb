class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book= Book.new(book_params)
    @book.user_id = current_user.id
     if @book.save
       redirect_to book_path(@book), notice: "You have created book successfully."
     else
       @book = Book.all
       @user = current_user
       render :index

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
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to users_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to user_path(@book.id), notice: "You have updated book successfully."
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
