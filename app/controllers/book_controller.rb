class BookController < ApplicationController
  def list
  	@book  = Book.all
  end
   
  def show
  	@book = Book.find(params[:id])
  end
   
  def new
  	@book = Book.new
  	@subject  = Subject.all
  end
   
  def create
  	@book  = Book.new(book_params)
  	if @book.save
  		redirect_to :action => "list"
  	else
  		@subject = Subject.all
  		render :action => "new"
  	end
  end

  def book_params
  	params.require(:books).permit(:title, :price, :subject_id, :description)
   
  def edit
  	@book = Book.find(params[:id])
  	@subject = Subject.all
  end
   
  def update
  	@book = Book.find(params[:id])
  	if Book.update_attributes(book_param)
  		redirect_to :action => "show", :id => @book
  	else
  		@subject = Subject.all
  		render :action => "edit"
  	end
  end

  def book_param
	params.require(:book).permit(:title, :price, :subject_id, :description)
	end
   
  def delete
  	Book.find(params[:id]).destroy
  	redirect_to :action => "list"
  end

  def show_subjects
  	@subject = Subject.find(params[:id])
  end

end
