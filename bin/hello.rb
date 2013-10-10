#!/usr/bin/env ruby
require 'logger'
require 'daemons'

# Logger setting
log_file_path = File.extended_path('log/hello.log')

# Daemons option setting
options = {}
options[:ARGV] = ARGV
options[:dir_mode] = :normal
options[:dir] = 'tmp'
options[:log_dir] = 'log'
options[:log_mode] = 'hello_daemons.log'
options[:mode] = :exec

Daemons.run_proc 'hello', options do
  logger = Logger.new(log_file_path)
  logger.debug('Logging start')
  loop do
    logger.debug('Loop continued')
    sleep(2)
  end
end
