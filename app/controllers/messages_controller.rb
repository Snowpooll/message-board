class MessagesController < ApplicationController
  
  before_action  :set_messge,only: [:edit,:update, :destroy]
  def index
    @message = Message.new
    #Messages をすべて取得
    @messages = Message.all
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
     redirect_to root_path, notice: 'メッセージを保存しました'
    else
      # メッセージが保存できない場合
      @messages = Message.all
      flash[:alert] = "メッセージの保存に失敗しました"
      render 'index'
    end
  end
  
  def edit
  end

  def update
    if @message.update(message_params)
      #保存に成功したらトップページへリダイレクト
      redirect_to root_path ,notice: 'メッセージを保存しました'
    else
      #保存に失敗した場合編集画面に
      render 'edit'
    end
  end
  
  def destroy
    @message.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end

  
  private
  def message_params
    params.require(:message).permit(:name,:body)
  end
  
  def set_messge 
    @message = Message.find(params[:id])
  end
end
