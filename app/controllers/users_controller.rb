class UsersController < ApplicationController


  def index
  end
  
  def show
    @user = User.find(params[:id])
    @user_songs = current_user.songs
  end 


  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def edit
    @user = User.find(params[:id])
  end 


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to(:action => 'show', :id => @user.id)
    else
      render('index')
    end
  end 

  def destroy
    project = Users.find(params[:id]).destroy
    redirect_to '/'
  end 

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
