class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end 

  def show
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

  def destroy
    @ingredient.destroy
    redirect_to :index
  end

  private
   
    def ingredient_params
      params[:ingredient].permit(:name)
    end

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end 

end
