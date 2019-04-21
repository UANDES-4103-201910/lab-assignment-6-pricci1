class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.password == params[:session][:password]
			log_in user
			debugger
			redirect_to user
		else
			flash.now[:danger] = 'Invalid email and/or password'
			render 'new'
		end
	end

	def destroy
		session.delete(:user_id)
		@current_user = nil
	end
end
