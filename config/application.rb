require_relative "boot"

require "rails/all"

require 'dotenv'
Dotenv.load
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Taski
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.

  


    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

ShopifyAPI::Context.setup(
  # These values are required but not actually used for private apps
  api_key: "DUMMY_VALUE",
  host_name: "DUMMY_VALUE",
  scope: 'read_products',
  private_shop: ENV['private_shop'],
  api_secret_key:  ENV['api_secret_key'],  # Note that this is actually the admin token, not the api secret key

  #session_storage: ShopifyAPI::Auth::FileSessionStorage.new, # This is only to be used for testing, more information in session docs
  is_embedded: false, # Set to true if you are building an embedded app
  is_private: true, # Set to true if you are building a private app
  api_version: "2023-10" # The vesion of the API you would like to use
)
