class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :destroy, :update]

  def index
    @quotes = Quote.all
  end

  def show; end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.create(quote_params)

    if @quote.save
      redirect_to quotes_path, notice: "quote was created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy

    redirect_to quotes_path, notice: "quote was deleted"
  end

  def edit; end

  def update 
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: "quote was updated"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def quote_params 
    params.require(:quote).permit(:name)
  end

  def set_quote
    @quote = Quote.find(params[:id])
  end
end
