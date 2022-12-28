require_relative './tiny_mysql/version'
require 'open3'

class TinyMysql
  attr_reader :mysql_command
  attr_reader :defaults_extra_file
  attr_reader :host
  attr_reader :port
  attr_reader :username
  attr_reader :database

  def initialize(options = {})
    @mysql_command = options[:mysql_command] || 'mysql'
    @defaults_extra_file = options[:defaults_extra_file]
    @host = options[:host] || 'localhost' unless @defaults_extra_file
    @port = options[:port]
    @username = options[:username] || 'root' unless @defaults_extra_file
    @password = options[:password]
    @database = options[:database]
  end

  def query(sql)
    out, err, status = Open3.capture3(*cmd_with_args, :stdin_data => sql)
    status.success? or raise err
    parse(out)
  end

  private

  def cmd_with_args
    list = []
    list << {'MYSQL_PWD' => @password} if @password
    list << @mysql_command
    list << "--defaults-extra-file=#{@defaults_extra_file}" if @defaults_extra_file
    list << '-h' << @host if @host
    list << '-P' << @port if @port
    list << '-u' << @username if @username
    list << @database if @database
    list
  end

  def parse(out)
    out = out.split("\n")
    columns = (out.shift || '').split("\t")

    out.map do |row|
      Hash[columns.zip(row.split("\t"))]
    end
  end
end
