class DosesController < ApplicationController
  def new
    # we need @cocktail and @ingredient in our `simple_form_for`
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.find(params[:ingredient_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)

    # we need `cocktail_id` and 'ingredient_id' to associate review with corresponding cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])

    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
