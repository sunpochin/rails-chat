class SessionsController < ApplicationController
  before_action :logged_in_detect, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      # sign_in user
      # redirect_back_or user
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to root_path
      # redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to login_path
  end


  private 
  
  def logged_in_detect
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end



end
