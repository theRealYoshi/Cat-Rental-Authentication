class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Success!"
      login!(@user)
      redirect_to user_url(@current_user)
    else
      flash.now[:errors] = @user.errors.full.messages
      render :new
    end

  end

  def show
    render :show
  end

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
