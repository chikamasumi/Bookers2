class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'index'
    end
  end

  def index
    @books = Book.all
    @book = Book.new()
    @user = current_user
    
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
  end
  
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
