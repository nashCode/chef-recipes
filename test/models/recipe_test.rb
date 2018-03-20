require 'test_helper'
class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create!(chefname: "jose", email: "jose@example.com")
    @recipe = @chef.recipes.build( name: "Vegetable", description: "Great vegatable recipe")
  end

  test "recipes without chef should be in valid" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  test "Recipe shold be valid" do
    assert @recipe.valid?
  end

  test "Name shold be resent" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "description shold be resent" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end

  test "description shouldn't less than 5 characters "do
    @recipe.description = "a" * 3
    assert_not @recipe.valid?
  end

  test "description should't more than 500 characters" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end

end
