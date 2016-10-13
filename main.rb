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

# MINE
require 'rubygems'
require 'sinatra'
require 'sendgrid-ruby'

$menu = [
	{:page => 'Home', :href => '/', :title => 'Home'},
	{page: 'Login', href: '/login', title: 'Login'},
	{page: 'Contact', href: '/contact', title: 'Contact'},
	{page: 'Images', href: '/images', title: 'Staff'}
]

get '/' do
	@favs = ['Jeremy_Snepar.jpg','Furniture-Couch.png','Furniture-Dining Room Set.png','Furniture-Bedroom Set.png']
	erb :home
end

get '/login' do
	erb :login
end

get '/contact' do
	erb :contact
end

post '/contact' do
	# From Address & To Address -> SendGrid::Email
	# Subject -> String
	# Content -> SendGrid::Content
	# Actual Email -> SendGrid::Mail
	# Mail ( from, subject, to content )
	mail = SendGrid::Mail.new(
		SendGrid::Email.new(email: "hunderta@yahoo.com"),
		"Thanks for contacting ABC Inc!",
		SendGrid::Email.new(email: params[:email]),
		SendGrid::Content.new(type: 'text/plain', value: <<-EMAILCONTENTS
			Thanks for letting us know how you feel.

			Our team will be in contact with you shortly. For your records here's a copy of the feedback we received:
---------------------------------------------------
			#{params[:message]}

EMAILCONTENTS
		)
		)
	sg = SendGrid::API.new( api_key: ENV['SENDGRID_API_KEY'])

	response = sg.client.mail._('send').post(request_body: mail.to_json)

	puts response.status_code
	puts response.request_body
	puts response.headers

	@title = "Contact ABC Inc"
	@msg = "Thanks for your submission"
	erb :contact
end

# $pics = [
# 	{'Jeremy_Snepar.jpg','Jeremy Snepar'
# 	},{'Bill_Glass.jpg','Bill Glass'},{'Cam_Crews.jpg','Cam Crews'},{'Erinn Beresford.png','Erinn Beresford'},{'Mike_Miller.jpg','Mike Miller'},{'Sam_Lubin.jpg','Sam Lubin'},{'Krystal_Kaplan.jpg','Krystal Kaplan'},{'Stephanie_Nacho_Mathison.jpg','Stephanie Nacho Mathison'},'Charles_Snepar.jpg','Charles Snepar'
# 	]

get '/images' do
  # @favs = ['Jeremy_Snepar.jpg','Bill_Glass.jpg','Cam_Crews.jpg','Erinn Beresford.png','Mike_Miller.jpg','Sam_Lubin.jpg','Krystal_Kaplan.jpg','Stephanie_Nacho_Mathison.jpg', 'Charles_Snepar.jpg']
	erb :images
end




