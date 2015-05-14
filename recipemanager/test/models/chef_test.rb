require 'test_helper' 

class ChefTest < ActiveSupport::TestCase 

  def setup 
    @chef = Chef.new(name: "John", email: "john@example.com")
  end 

  test "chef should be valid" do 
    assert @chef.valid? 
  end 

  test "chef name should be present" do 
    @chef.name = " "
    assert_not @chef.valid? 
  end 

  test "chef name should not be too long" do 
    @chef.name = 'a' * 41
    assert_not @chef.valid?
  end

  test "chef name should not be too short" do 
    @chef.name = 'ab' 
    assert_not @chef.valid? 
  end 

  test "email must be present" do 
    @chef.email = " " 
    assert_not @chef.valid? 
  end 

  test "email length should be within bounds" do 
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid? 
  end 
 
  test "email adderss should be unique" do 
    dup_chef = @chef.dup 
    dup_chef.email = @chef.email.upcase
    @chef.save 
    assert_not dup_chef.valid? 
  end 

  test "email validation should accept valid addresses" do 
    valid_addresses = %w[user@eee.com R_TDD-DS@ee.hello.org user@example.com first.last@eeem.au laura+joe@monk.cm]
    valid_addresses.each do |email|
      @chef.email = email
      assert @chef.valid?, '#{email.inspect} should be valid'
    end  
  end 

  test "email vaildation should reject invalid addresses" do 
    invalid_addresses = %w[uwer@example,com uuse_ee.org user.name@examle aa@ssdf-com]
    invalid_addresses.each do |email|
      @chef.email = email
      assert_not @chef.valid?, '#{email.inspect} should be invalid' 
    end 
  end

end 