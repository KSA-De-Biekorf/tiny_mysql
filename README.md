# TinyMysql

Tiny MySQL clinet dependent on [mysql](https://dev.mysql.com/doc/refman/5.7/en/mysql.html) command.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tiny_mysql'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tiny_mysql

## Usage

```ruby
require 'pp'

mysql = TinyMysql.new(username: 'scott', password: 'tiger', database: 'mysql')

pp mysql.query('show tables')
# => [{"Tables_in_mysql"=>"columns_priv"},
#     {"Tables_in_mysql"=>"db"},
#     {"Tables_in_mysql"=>"event"},
#     ...
