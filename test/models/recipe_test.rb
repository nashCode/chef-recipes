require 'test_helper'
class RecipeTest < ActiveSupport::TestCase
  def setup
    @recipe = Recipe.new( name: "Vegetable", description: "Great vegatable recipe")
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
