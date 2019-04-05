class BandsController < ApplicationController
    def index 
        @bands=Band.all
       
    end  

    def new 
        render :new
    end  

    def show 
        @band=Band.find_by(id: params[:id])
        
    end 

    def create 
        @band=Band.new(band_params)
        if @band.save 
            redirect_to band_url(@band) # '/bands/1'
        else  
            flash.now[:errors]=@band.errors.full_messages
            render :new
        end  
    end  

    def edit 
        render :edit
    end 

    def update 
        @band=Band.find_by(id: params[:id])
        @band.update(band_params)
    end  
     
    def destroy 
        @band=Band.find_by(name: params[name]) 
    
    end 

    private
    def band_params 
        params.require(:band).permit(:name)
    end 
end
