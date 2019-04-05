class ApplicationController < ActionController::Base
    helper_method :current_user, :log_in_user, :logged_in, :log_out!
    def current_user 
        @current_user||=User.find_by(session_token: session[:session_token])
    end 

    def logged_in? 
        !!current_user
    end 

    def log_in_user!(user)
        session[:session_token]=user.reset_session_token! 
    end 

    def log_out!(user)
        user.session_token=nil 
    end 

    #  private

    # def user_params 
    #     params.require(:user).permit(:username,:password)
    # end 
end
