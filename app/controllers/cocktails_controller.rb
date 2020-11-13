class CocktailsController < ApplicationController
  before_action :set_cocktail, only: :show
  # GET "cocktails"
  # GET "cocktails" from json
  def index
    @cocktails = Cocktail.all
  end

  # GET /cocktails/1
  # GET /cocktails/1.json
  def show
    @doses = @cocktail.doses
  end
  # GET /cocktails/new

  def new
    @cocktail = Cocktail.new
  end
  # GET /cocktails/1/edit

  # def edit
  # end

  # POST /cocktails
  # POST /cocktails.json
  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
    # respond_to do |format|
    #   if @cocktail.save
    #     format.html { redirect_to @cocktail, notice: 'Cocktail was successfully created.' }
    #     format.json { render :show, status: :created, location: @cocktail }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @cocktail.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
