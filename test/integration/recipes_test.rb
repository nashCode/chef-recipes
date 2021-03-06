require 'test_helper'
class RecipesTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chefname: "Jose Manuel", email: "jose@example.com")
    @recipe = Recipe.create(name: "vegetable saute", description: "great vegetable saute", chef: @chef)
    @recipe2 = @chef.recipes.build(name: "Chiken saute", description: "great chiken dish")
    @recipe2.save
  end

  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end

  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end
end
