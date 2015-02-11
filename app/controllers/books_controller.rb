class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(task_params)
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.delete
    redirect to books_path
  end


private

  def book_params
    params.require(:book).permit(:author, :title, :description)
  end

end
