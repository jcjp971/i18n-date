require "date"
require "i18n"
require "i18n/date/version"

module I18n
  module Date
    module_function

    def strptime(string, format = nil, locale: I18n.config.locale)
      format ||= :default
      format = I18n.t(format, scope: "date.formats", locale: locale) if format.is_a?(Symbol)
      ::Date.strptime(unlocalize_date_string(string, locale), format)
    end

    def unlocalize_date_string(string, locale = nil)
      locale ||= I18n.config.locale
      I18n.enforce_available_locales!(locale)
      CONVERTIONS.reduce(string) do |s, (type, replacements)|
        map = I18n.t(type, scope: "date", locale: locale)
              .zip(replacements)
              .to_h
              .tap { |h| h.delete(nil) }
        s.gsub(/\b(#{map.keys.join("|")})\b/) { |match| map[match] }
      end
    end

    CONVERTIONS = {
      month_names: ::Date::MONTHNAMES,
      abbr_month_names: ::Date::ABBR_MONTHNAMES,
      day_names: ::Date::DAYNAMES,
      abbr_day_names: ::Date::ABBR_DAYNAMES
    }
  end
end
