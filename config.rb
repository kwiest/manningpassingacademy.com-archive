###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

page 'page/*', layout: :page
page 'dvd', layout: false

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
helpers do
  def year
    2019
  end

  def overnight_tuition
    750
  end

  def day_tuition
    550
  end

  def start_date
    Date.parse '2019-06-27'
  end

  def end_date
    Date.parse '2019-06-30'
  end

  def balance_due_date
    Date.parse '2019-05-01'
  end

  def drop_from_roster_date
    Date.parse '2019-06-01'
  end

  def refund_date
    Date.parse '2019-08-01'
  end

  def online_registration_link
    'https://campregistrationsystems.com/manning-passing-academy/2019-manning-passing-academy'
  end

  def confirmation_link
    'https://campregistrationsystems.com/manning-passing-academy/2019-manning-passing-academy/confirmation'
  end

  def online_shuttle_link
    'https://campregistrationsystems.com/manning-passing-academy/2019-mpa-shuttle'
  end

  def womens_clinic_date
    Date.parse '2019-06-26'
  end

  def womens_clinic_online_registration_link
    "https://campregistrationsystems.com/manning-passing-academy/2019-ladies-clinic"
  end

  def womens_clinic_confirmation_link
    "https://campregistrationsystems.com/manning-passing-academy/2019-ladies-clinic/confirmation"
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

activate :directory_indexes

# activate :asset_host, host: 'https://d2ddt8dkfbm0fn.cloudfront.net'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  activate :cdn do |provider|
    provider.cloudflare = {
      client_api_key: ENV['CLOUDFLARE_CLIENT_API_KEY'],
      email: ENV['CLOUDFLARE_EMAIL'],
      zone: ENV['CLOUDFLARE_ZONE_ID'],
      base_urls: [
        'https://manningpassingacademy.com'
      ]
    }
    provider.after_build = false
  end
end
