class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		sign_in user
      flash[:success] = "Welcome to the sample app"
  		redirect_to user
  	else
  		flash[:danger] = 'Invalid E-mail/password combination'
  		render "new"
  	end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
