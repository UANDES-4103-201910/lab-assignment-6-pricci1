class RegistrationsController < ApplicationController
  def new
		@user = User.new
  end

  def create
    @user = User.new(user_params)
		if @user.save
			flash[:success] = "User created successfuly"
			redirect_to '/'
		else
			render 'new'
		end
  end

  private

  def user_params
    params.require(:registrations).permit(:email, :name, :last_name,
                                           :password, :phone)
  end
end
