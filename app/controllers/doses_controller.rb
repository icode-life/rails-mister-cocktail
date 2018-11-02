class DosesController < ApplicationController
  before_action :find_dose, only: [:destroy]

  def index
    @dose = Dose.all
  end

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.delete
    @cocktail = Cocktail.find(params[:cocktail_id])
    redirect_to new_cocktail_dose_path(@cocktail)
  end

  private

  def find_dose
    @dose = Dose.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
