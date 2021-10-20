require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'create' do
  it 'successfully creates a new user' do
      user = User.create(
        name: "test", 
        email: "test@test.com", 
        password: "test",
        password_confirmation: "test"
        )
      expect(user).to be_valid
      expect(user.errors.full_messages).to be_empty
    end
    it 'password should match' do
      user = User.create(
        name: "test", 
        email: "test@test.com", 
        password: "test",
        password_confirmation: "test1"
        )
      expect(user.password).to_not be_equal(user.password_confirmation)
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
end
end