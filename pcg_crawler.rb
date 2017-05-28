# -*- coding: utf-8 -*-
require "rubygems"
require 'nokogiri'
require 'open-uri'
require 'kconv'
require 'pp'

# PCGのクロールを軽くしてみる

url = "http://www.pokemon-card.com/card-search/details.php/card/33468/regu/all"
doc = Nokogiri::HTML.parse(open(url))
name = doc.xpath('//html/body/div/div[1]/section[1]/h1').text

p name