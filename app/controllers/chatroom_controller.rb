class ChatroomController < ApplicationController
  before_action :require_user

  def index
    # render :text => @messages.inspect
    # puts @messages.inspect
    # return
    @message = Message.new
    @messages = Message.all
    # Rails.logger.debug("My Messages: #{@messages.inspect}")
  end
end
