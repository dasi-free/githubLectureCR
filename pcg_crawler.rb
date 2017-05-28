# -*- coding: utf-8 -*-
require "rubygems"
require 'nokogiri'
require 'open-uri'
require 'kconv'
require 'pp'

# PCGのクロールを軽くしてみる

url = ""
doc = Nokogiri::HTML.parse(open(url))
result = doc.xpath('//')