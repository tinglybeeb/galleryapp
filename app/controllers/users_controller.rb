class UsersController < ApplicationController

	# HTTP GET: Render the sign up page (views/users/new.html.erb)
	# Creates a new instance object from the User class (no parameters yet)
	def new
		@user = User.new
	end

	# HTTP POST: Creates a new user in the database
	def create
		@user = User.new(user_params)
		if @user.save

			# save the user's id into the session. So current_user (application controller) can find the right user from the session object.
			session[:user_id] = @user.id
			byebug
			flash[:success] = "Welcome, #{@user.username}!"
			redirect_to artpieces_path
		else
			render 'new'
		end
	end

	# HTTP GET: Renders the edit user profile page

	# HTTP POST: Updates the current (logged-in) user's profile


	private

		def user_params
			params.require(:user).permit(:username, :email, :password)
		end

end