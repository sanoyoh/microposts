class UsersController < ApplicationController
  before_action :set_message, only: [:edit, :update]
  def show 
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end 
  
  def create
    @user = User.new(user_params)
    if @user.save
        flash[:sucess]= "Welcome to the Sample App!"
        redirect_to @user 
    else
      render 'new'
    end
    
  def edit
   @user = User.find(params[:id])
  end
 
  def update
    if @message.update(message_params)
  end
 end
 
  private

   def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
   end
  end
 end