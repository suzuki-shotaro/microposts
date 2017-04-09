class UsersController < ApplicationController
  before_action :check_user, only: [:edit, :update]
  before_action :set_params, only: [:show, :edit, :update]
  
  def show #追加
   @user = User.find(params[:id])
  end
  
  def new
  @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user #ここを修正
    else
      render 'new'
    end
  end
  
  def edit
  end 
  
  def update
    if @user.update(user_params)
      #保存に成功した場合はトップページへリダイレクト
      redirect_to @user , notice: '基本情報を編集しました'
    else
      #保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  private
  
  def set_params
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation, :location)
  end
  
  def check_user
    @user = User.find(params[:id])
  end
end
