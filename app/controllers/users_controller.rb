class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @book = Book.new()
  end

  def show
    @user = User.find(params[:id])
    @books = @user.book(params[:page]).reverse_order

  end

  private
  def book_params
    params.require(:book).permit(:name, :introduction, :image)
  end
end
