class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    #  if user = User.authenticate_with_credentials(params[:email], params[:password])

    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      # '/', [:products, :index]
      # redirect_to root_path
      redirect_to '/'
    else
      # If user's login doesn't work, send them back to the login form.
      # '/login'
   
      redirect_to :controller => 'products', :action => 'index'
    end
  end


  def destroy
    session[:user_id] = nil
    # '/login'
    # redirect_to [:users, :index]
    redirect_to '/login'
  end
end