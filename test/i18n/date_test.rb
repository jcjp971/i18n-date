require "test_helper"
require "rails_i18n"

class I18n::DateTest < Minitest::Test
  def setup
    I18n.enforce_available_locales = false
    load_rails_18n_locales
  end

  def load_rails_18n_locales
    app = Class.new(Rails::Application)
    app.config.active_support.deprecation = :log
    app.config.eager_load = false
    app.initialize!
  end

  def test_that_it_has_a_version_number
    refute_nil ::I18n::Date::VERSION
  end

  def test_it_parses_dates_using_current_locale
    I18n.with_locale(:da) do
      date = I18n::Date.strptime("23. maj 2001", :long)
      assert_equal Date.new(2001, 5, 23), date
    end
  end

  def test_it_parses_dates_using_specified_locale
    refute_equal :da, I18n.config.locale
    date = I18n::Date.strptime("23. maj 2001", :long, locale: :da)
    assert_equal Date.new(2001, 5, 23), date
  end
end
