class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new()
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new()
  end

  def edit
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
