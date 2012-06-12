# Calendar watcher
require 'rubygems'
require 'ri_cal'
require 'net/https'

module Belphanior
  module Servant
    module CalendarWatcher
      class CalendarWatcher
        attr_accessor :calendar_url
        def initialize(calendar_url)
          @calendar_url = calendar_url
        end
        # Retrieve all events that happened between start_time and end_time,
        #  which are DateTime objects.
        # Returns: Array of strings which are event names for events between
        #  start_time and end_time
        def get_events_between_times(start_time, end_time)
          filtered_events = []
          calendar = get_calendar
          events = calendar.events
          events.each do |event|
            event.occurrences(:overlapping =>
              [start_time, end_time]).each do |occurrence|
                if occurrence.dtstart >= start_time then
                  puts "Event occurred:"
                  puts occurrence.summary
                  puts "Time:"
                  puts occurrence.dtstart
                  filtered_events << (occurrence.summary)
                end
            end
          end
          filtered_events
        end

        # Retrieves the calendar from the server.
        def get_calendar
          uri = URI(@calendar_url)
          http_session = Net::HTTP.new(uri.host, uri.port)
          http_session.use_ssl=true
          http_session.verify_mode = OpenSSL::SSL::VERIFY_NONE

          request = Net::HTTP::Get.new(uri.request_uri)
          response = http_session.request(request)
          (RiCal.parse_string(response.body))[0]
        end
      end
    end
  end
end
