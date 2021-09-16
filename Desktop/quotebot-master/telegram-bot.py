from telegram.ext import Updater, CommandHandler

from random import randint
import quotes
import logging
from telegram.ext import Updater, CommandHandler, MessageHandler, Filters
import os
PORT = int(os.environ.get('PORT', 5000))

def start(bot, update):
    update.message.reply_text("Приветик, Милашечка моя. \nЯ создал для тебя бота, поэтому если захотите дозу комплиментов - тыкайте кнопочку \nВаш обаяшка *чмок* :)\n /quote")

def quote(bot, update):
    i = randint(0, len(quotes.quotes)-1)
    update.message.reply_text(quotes.quotes[i])

def main():
    # Create Updater object and attach dispatcher to it
    updater = Updater('1996681647:AAH5rcTMoIDc6XShl9BErXBVEQBa5WLHWdc')
    dispatcher = updater.dispatcher
    print("Bot started")

    # Add command handler to dispatcher
    start_handler = CommandHandler('start',start)
    dispatcher.add_handler(start_handler)

    quote_handler = CommandHandler('quote',quote)
    dispatcher.add_handler(quote_handler)

    # Start the bot
    updater.start_polling()

    # Run the bot until you press Ctrl-C
    # Start the Bot
    updater.start_webhook(listen="0.0.0.0",
                          port=int(PORT),
                          url_path=TOKEN)
    updater.bot.setWebhook('https://vast-lake-09747.herokuapp.com/' + TOKEN)

    # Run the bot until you press Ctrl-C or the process receives SIGINT,
    # SIGTERM or SIGABRT. This should be used most of the time, since
    # start_polling() is non-blocking and will stop the bot gracefully.
    updater.idle()


if __name__ == '__main__':
    main()