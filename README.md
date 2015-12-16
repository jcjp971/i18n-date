# I18n::Date

Parse date formats using locale info from I18n.

Specifically using the default keys from Rails' I18n settings, which includes both information about date formats as well as day and month names.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "i18n-date"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install i18n-date

## Usage

Make sure you have Rails I18n locale files loaded. You might want to use the [Rails Locale Data Repository](https://github.com/svenfuchs/rails-i18n)

    ```ruby
    I18n.config.locale = :da
    date = I18n::Date.strptime("23. februar 2001", :long)
    # or
    date = I18n::Date.strptime("23 februari 2001", :long, locale: :sv)
    ```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/karnov/i18n-date.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
