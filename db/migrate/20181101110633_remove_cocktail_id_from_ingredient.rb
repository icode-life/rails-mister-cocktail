class RemoveCocktailIdFromIngredient < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :cocktail_id
  end
end
