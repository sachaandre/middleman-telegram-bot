require "middleman-core"

::Middleman::Extensions.register :middlemanTelegramBot do
  require "middleman-telegram-bot/extension"
  TelegramBot
end
