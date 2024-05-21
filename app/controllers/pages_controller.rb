class PagesController < ApplicationController
  def contact
  end

  def about
  end

  def home
    @title = 'this is my fancy new page'
    Rails.logger.info 'Index view accessed'
    session = ShopifyAPI::Auth::Session.new(shop: ENV['private_shop'],
    access_token: ENV['api_secret_key'])
    ShopifyAPI::Context.activate_session(session)
    test_session = ShopifyAPI::Context.active_session
    data = ShopifyAPI::Product.all( session: test_session)
    # Rails.logger.info data
    @data = data
  end
end
