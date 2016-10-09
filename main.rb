# Assignment:

# Choose or create a fictitious business to
# build a full-featured website for in
# Sinatra.

# Site requirements:

# • At least 4 separate pages
# • Use photographs
# • JavaScript for interaction
# • Should have the option to contact the
#   business using the SendGrid (or
#   Mandrill) API to send an e-mail to the
#   business owner (wait until we go over
#   this in class to implement it).
#   Feel free to get incredibly creative!
require 'sinatra'

get '/' do
  @menu = [
    {:page => 'Home', :href => '/'},
    {page: 'Login', href: '/login'},
    {page: 'Contact', href: '/views/contact'},
    {page: 'Images', href: '/images'}
  ]
	erb :home
end

get '/views/login' do
	erb :login
end

get '/views/contact' do
	erb :contact
end

get '/views/images' do
  @favs = ['Jeremy_Snepar.jpg','Bill_Glass.jpg','Cam_Crews.jpg','Mike_Miller.jpg','Sam_Lubin.jpg','Krystal_Kaplan.jpg']
	erb :images
end

