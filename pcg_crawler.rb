# -*- coding: utf-8 -*-
require "rubygems"
require 'nokogiri'
require 'open-uri'
require 'kconv'
require 'pp'

# PCGのクロールを軽くしてみる

# doc = Nokogiri::HTML.parse(open(url))
# = doc.xpath('/').text

url = "http://www.pokemon-card.com/card-search/details.php/card/33468/regu/all"
# url = "http://www.pokemon-card.com/card-search/details.php/card/33476/regu/all"
doc = Nokogiri::HTML.parse(open(url))
name = doc.xpath('//html/body/div/div[1]/section[1]/h1').text
p name

card_type = doc.xpath('//html/body/div/div[1]/section[1]/div/div[2]/div/div[1]/div/div[1]/span').text
card_type.gsub!(" ","")
p card_type

hp = doc.xpath('//html/body/div/div[1]/section[1]/div/div[2]/div/div[1]/div/div[2]/span[2]').text
p hp

poke_type = doc.xpath('//html/body/div/div[1]/section[1]/div/div[2]/div/div[1]/div/div[2]/span[4]')[0]["class"]
# p poke_type
poke_type.gsub!(/(.?icon.?)/,"" )
p poke_type

text_type = doc.xpath('//html/body/div/div[1]/section[1]/div/div[2]/div/h2[1]').text
p text_type

if text_type=="特性"
	tokusei_name = doc.xpath('//html/body/div/div[1]/section[1]/div/div[2]/div/h4[1]/text()').text
	p tokusei_name

	tokusei_effect = doc.xpath('//html/body/div/div[1]/section[1]/div/div[2]/div/p[1]').text
	p tokusei_effect
end