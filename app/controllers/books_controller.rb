class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book_new= Book.new(book_params)
    @book_new.user_id = current_user.id
     if @book_new.save
       redirect_to book_path(@book_new), notice: "You have created book successfully."
     else
       @book = Book.all
       @user = current_user
       render :index
     end
  end

  def index
    @book = Book.page(params[:page]).reverse_order
    @user = current_user
    @book_new = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @book_new = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to book_path(@book)
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to user_path(current_user), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
