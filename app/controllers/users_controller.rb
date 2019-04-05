class UsersController < ApplicationController
    def new 
        render :new 
    end 

    def show 
        @user=User.find_by(id: params[:id])
        render :show
    end

    def create 
        @user=User.new(user_params)
        if @user.save 
            redirect_to user_url(@user)
            #redirct to logged_in page? which link?
            #Users should be logged in immediately after they sign up
        else  
           flash.now[:errors]=@user.errors.full_messages
            render :new 
        end 
    end  

    private

    def user_params 
        params.require(:user).permit(:email,:password)
    end 
end
