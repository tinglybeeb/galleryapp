class ApplicationController < ActionController::Base

	# Define the following 2 methods as helper methods that can be used in child classes
	helper_method :current_user, :logged_in?


	# Gets and stores the logged in user object from the database (so any controller can use it later)
	def current_user
		# if session contains a user_id (we logged in and session isn't destroyed/user_id isn't removed)
    # And if there isn't a value for @current_user (we haven't assigned it a value). 
    	# ^ This is to minimise redundant database queries if we've already returned the user.
    # Then return the user object
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    byebug
	end

	# Used to segment functionality based on logged in / logged out
	def logged_in?
		# Converts the returned value for current_user into a boolean
		# This returns true if current_user object exists. Vice versa
		!!current_user
	end

	# Handles error messages & redirecting for logged-out users who try to access logged-in features
	def require_user
		if !logged_in?
			flash[:danger] = "Please log in first"
			redirect_to login_path
		end
	end

end
