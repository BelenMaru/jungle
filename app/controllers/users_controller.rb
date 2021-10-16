# app/controllers/users_controller.rb

class UsersController < ApplicationController

  def new
    end

    def create
      user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      # '/'
      redirect_to root_path
    else
      # '/signup'
      redirect_to [:users, :new]
    end   

end

private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end