class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if (@user.save)
      render json: @user, status: 200
    else
      render json: {error: @user.errors.messages}, status: 400
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end