class TagCloudController < ApplicationController
  def index
    #We're changing this!
  end
  
  def show
    if LoginConcern.user(params[:user_id]).is_signed_in
      render Tag.find(params[:id]).count
    else
      redirect_to_root
    end
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
    
  end
end
