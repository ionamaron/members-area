class UsersController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  skip_before_action :require_admin, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params) 
      if @user.save 
        session[:user_id] = @user.id 
        redirect_to '/songs' 
      else 
        redirect_to '/signup' 
      end 
  end
  
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
