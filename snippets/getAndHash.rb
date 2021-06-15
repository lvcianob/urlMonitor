#! /usr/bin/env ruby

require 'net/http'
require 'digest'
require 'uri'

unless ARGV.length != 1
  uri = URI(ARGV[0])
  
  if ! ['http', 'https'].include?(uri.scheme)
    puts "ERROR: protocol should be HTTP/HTTPS"
    exit
  end

  puts "Making GET request to #{uri}"
  requestResult = Net::HTTP.get(uri)

  hash = Digest::SHA256.hexdigest requestResult
  puts "#{uri} contents hash is #{hash}"

  exit
end

puts "ERROR: an URL is needed as argument"
