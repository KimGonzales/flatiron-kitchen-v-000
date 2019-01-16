class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end 

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
  end

  def update
    @ingredient.update(ingredient_params)

    if @ingredient.save
      redirect_to ingredients_path
    else
      render :edit
    end
  end

  private
   def ingredient_params
    params[:ingredient].permit(:name)
   end

  def delete
    @ingredient = Ingredient.find_by(id: params[:id])
  end

end
