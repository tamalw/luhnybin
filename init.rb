#!/usr/bin/env ruby

require_relative 'lib/luhnybin'

$stdin.each do |test|
  filtered_text = Luhnybin.filter(test)
  begin
    puts filtered_text
    $stdout.flush
  rescue Errno::EPIPE
    break
  end
end
