#!/usr/bin/env ruby

# <bitbar.title>The Russian Ruble exchange rates</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Roman Krasavtsev</bitbar.author>
# <bitbar.author.github>romankrasavtsev</bitbar.author.github>
# <bitbar.desc>The Russian Ruble exchange rates from Moscow Exchange</bitbar.desc>
# <bitbar.dependencies>ruby</bitbar.dependencies>

require "nokogiri"
require "open-uri"

def get_exchange_rate *currencies
  result_string = ""

  currencies.each do |currency|
    pair, sign = get_pair_sign currency

    if pair
      rate = Nokogiri::HTML(open("http://moex.com/ru/derivatives/currency-rate.aspx?currency=#{pair}"))
        .css("#ctl00_PageContent_tbxCurrentRate b")
        .to_s.gsub(/<b>/, "").gsub(/<\/b>/, "")
        .gsub(/Текущее значение:  /, "")
        .slice /\d+,\d./
    else
      rate = "Unknown sign"
    end

    result_string += "#{sign} #{rate}  "
  end

  result_string
end

def get_pair_sign currency
  case currency
  when "USD"
    pair, sign = ["USD_RUB", "$"]
  when "EUR"
    pair, sign = ["EUR_RUB", "€"]
  when "CHF"
    pair, sign = ["CHF_RUB", "Fr"]
  when "JPY"
    pair, sign = ["JPY_RUB", "J¥"]
  when "CNY"
    pair, sign = ["CNY_RUB", "C¥"]
  when "CAD"
    pair, sign = ["CAD_RUB", "C$"]
  when "TRY"
    pair, sign = ["TRY_RUB", "₺"]
  else
    pair, sign = [nil, ""]
  end
end

# Supported currencies:
# USD - United States dollar
# EUR - Euro
# CHF - Swiss franc
# JPY - Japanese yen
# CNY - Chinese yuan
# CAD - Canadian dollar
# TRY - Turkish lira

puts get_exchange_rate "USD", "EUR", "CAD"
