class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def index

  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def is_user_logged_in?
    logged_in = !current_user.nil?
    if logged_in then true else redirect_to root_path end
  end
end
