class BooksController < ApplicationController
    before_action :set_genre
    before_action :set_book, only: [:show, :edit, :update, :destroy]
  
    # GET /genres/1/books
    def index
      # Access all books for the genre
      @books = @genre.books
    end
    
    # GET /genres/1/books/2
    def show
    end
    
    # GET /genres/1/books/new
    def new
      # Associate a book object with the genre
      @book = @genre.books.build
    end
    
    # POST /genres/1/books
    def create
      # Build a new book associated with the genre
      @book = @genre.books.build(book_params)
      
      if @book.save
        # Save the book successfully and redirect
        redirect_to genre_book_path(@genre, @book)
      else
        # Render the new template with errors
        render :new
      end
    end
    
    # GET /genres/1/books/2/edit
    def edit
    end
    
    # PUT /genres/1/books/2
    def update
      if @book.update(book_params)
        # Save the book successfully
        redirect_to genre_book_path(@genre, @book)
      else
        render :edit
      end
    end
    
    # DELETE /genres/1/books/2
   
     
  
    def destroy
        @book.destroy
        respond_to do |format|
          format.html { redirect_to genre_book_path(@genre), notice: 'Book was successfully deleted.' }
          format.json { head :no_content }
        end
      end

    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:genre_id])
    end
  
    def set_book
      @book = @genre.books.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :synopsis, :details)
    end
  end
  