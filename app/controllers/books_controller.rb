class BooksController < ApplicationController

  before_action :set_book, only: %i[show edit update destroy]
  before_action :set_selects, only: %i[new edit create update]

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)

  end

  def new
    @book = Book.new
  end

  def show
  end

  def edit
  end

  def update

    respond_to do |format|
      if @book.update(book_params)
        format.html {redirect_to @book, notice: "Libro editado"}
      else
        format.html {render :edit}
      end
    end
  end

  def create
    @book = Book.create(book_params)
    respond_to do |format|
      if @book.save
        format.html {redirect_to @book, notice: "Libro guardado exitosamente"}
      else
        format.html {render :new}
      end
    end

  end

  def destroy
    @book.destroy
    redirect_to root_path, notice: 'libro borrado exitosamente.'
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :status, :borrowing_date, :return_date)
  end
  def set_book
     @book = Book.find(params[:id])
  end
  def set_selects
    @statuses = Book.statuses.keys
  end


end
