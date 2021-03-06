class UsersController < ApplicationController
  before_action :set_user, only: [:show,  :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def followings
   @user = User.find(params[:id])
   @followings = @user.following_users
  end

  def followers
   @user = User.find(params[:id])
   @followers = @user.follower_users
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def destroy
    @micropost = current_user.microposts.find_by(id: params[:id])
    return redirect_to root_url if @micropost.nil?
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
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
  end
 
    
  def edit
  end
 
  def update
    if @user.update(user_params)
      redirect_to @user 
    else
      render 'edit'
    end
  end
  
 
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :age)
  end
  
  
  def correct_user
    if current_user != @user
      redirect_to root_url  , notice: '不正な操作のためトップページに移動しました'
    end
  end
end