class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.create(user_params)
    # @user.save    might have done the password validation
    # if params[:user][:password] == params[:user][:password_confirmation]
    if @user.save
      session[:user_id] = @user.id
    else 
      redirect_to controller: 'users', action: 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
