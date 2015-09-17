

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )

    if user.nil?
      render json: "Credentials were wrong"
    else
      user.reset_session_token!
      flash[:notice] = "Welcome back #{user.user_name}"
      login!(user)
      ### might have to put this above render

      redirect_to cats_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
