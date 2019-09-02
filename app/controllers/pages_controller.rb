class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  after_action :after_login

  def after_login
    current_user.ip = @client_ip
    current_user.last = @last
    current_user.save
  end
  def index
    @client_ip = remote_ip()
  end
end
