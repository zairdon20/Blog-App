class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warning, :success, :messages, :notice, :alert
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :authorized, only: [:auto_login]
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :posts_counter, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
