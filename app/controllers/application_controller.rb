class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def remote_ip
    if Rails.env.production?
      request.remote_ip
    else
      Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
    end
  end
  def last
    Time.now
  end
end
