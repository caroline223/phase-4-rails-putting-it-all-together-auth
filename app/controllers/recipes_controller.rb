class RecipesController < ApplicationController

    def index
       recipes = Recipe.all 
       render json: recipes, status: :created 
    end

    def create
        recipe = @current_user.recipes.create!(recipe_params)
        if recipe.valid?
            render json: recipe, status: :created
        else
            render json: {error: "Not authorized"}, status: :unauthorized
        end
    end

    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end

end
