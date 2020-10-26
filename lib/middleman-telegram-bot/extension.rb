# Require core library
require 'middleman-core'

# Extension namespace
class TelegramBot < ::Middleman::Extension
  option :token, nil, 'Define the Telegram bot token'
  option :channel, nil, 'Define the Telegram channel you\'ll interract with'

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super
    # Needed libs
    require 'telegram/bot'
    require 'open-uri'
    @token = option.token
    @channel = option.channel
  end

  def sendHello
    if @token != nil && @channel != nil
      Telegram::Bot::Client.run(@token) do |bot|
        bot.api.send_message(chat_id: @channel, text: "Bonjour le salon ! (Ceci est un test)")
      end
    else
      puts "Token or destination channel missing ! Can't send message"
    end
  end


  # helpers do
  #   def a_helper
  #   end
  # end
end
