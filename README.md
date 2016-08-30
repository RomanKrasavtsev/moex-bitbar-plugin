## MOEX
Plugin for [BitBar](https://github.com/matryer/bitbar).
The Russian Ruble exchange rates from Moscow Exchange.

Sign mode
![BitBar Example showing MOEX plugin](https://raw.github.com/romankrasavtsev/moex-bitbar-plugin/master/moex_sign.png)

Emoji mode
![BitBar Example showing MOEX plugin](https://raw.github.com/romankrasavtsev/moex-bitbar-plugin/master/moex_emoji.png)

### Supported currencies:
 - USD - United States dollar - 🇺🇸
 - EUR - Euro 🇪🇺
 - CHF - Swiss franc - 🇨🇭
 - JPY - Japanese yen - 🇯🇵
 - CNY - Chinese yuan - 🇨🇳
 - CAD - Canadian dollar - 🇨🇦
 - TRY - Turkish lira - 🇹🇷

### How to use
 - Install ruby
 - Install gem [nokogiri](http://www.nokogiri.org/tutorials/installing_nokogiri.html)
 - Drop moex.1m.rb file into your BitBar plugins folder
 - Make sure it's executable (in Terminal, do chmod +x moex.1m.rb)
 - Edit moex.1m.rb and add your currencies
 - Choose emoji or sign mode (emoji = true / false)
