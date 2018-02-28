require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chefname: "Jose", email: "jose@havk.com")
  end

  test "Shoul be valid" do
    assert @chef.valid?
  end

  test "sold be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end

  test "Chef name could be unless than 30 characters" do
    @chef.chefname = "a" * 31
    assert_not @chef.valid?
  end

  test "Email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end

  test "email could not be to long "  do
    @chef.email = "a" * 245 + "@example.com"
    assert_not @chef.valid?
  end


  test "email sould accept correct format" do
    valid_emails = %w[mai1@hit.com mai2@hit.com mai3@hit.com mai4@hit.com]
    valid_emails.each do |valids|
      @chef.email = valids
      assert @chef.valid?, "#{valids.inspect} should be valid"
    end
  end

  test "Shd reject invalid email adrresses"do
    invalid_emails = %w[mail1.com, mail2@site, mail3@site,com]
    invalid_emails.each do |invalids|
      @chef.email = invalids
      assert_not @chef.valid?, "#{invalids.inspect} should be valid"
    end
  end

  test "email shold be uniqueand insensitive" do
    duplicate_chef = @chef.dup
    duplicate_chef.email = @chef.email.upcase
    @chef.save
    assert_not duplicate_chef.valid?
  end

  test "email sould be lower case before hitting db" do
    mixed_email = "JhON@Example.Com"
    @chef.email = mixed_email
    @chef.save
    assert_equal mixed_email.downcase, @chef.reload.email
  end

end
