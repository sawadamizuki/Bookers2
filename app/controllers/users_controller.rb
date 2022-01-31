class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.find_by(id: 1)
  end



  def index
    @user = User.all
    @book_new = Book.new

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(usre_params)
    redirect_to users_path, notice: "You have updated user successfully."
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end


