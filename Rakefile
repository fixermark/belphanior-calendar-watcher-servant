require 'rubygems'
require 'rake'
require 'rake/gempackagetask'
require 'rake/testtask'

gemspec = Gem::Specification.new do |s|
  s.name = %q{belphanior-calendar-watcher}
  s.version = "0.0.1"
  s.authors = ["Mark T. Tomczak"]
  s.email = %q{belphanior+calendar-watcher@fixermark.com}
  s.summary = %q{Watches for events and notifies a servant when events occur.}
  s.description = <<-EOF
    Watches a specified iCal-format calendar for events. When the time
    for an event comes, sends the name of the event to a servant that
    supports the "commandable" role
    (http://belphanior.net/roles/commandable/v1).

    For example, say you have an iCal at www.foo.com/calendar that has an entry
    named "wake me up" at 10AM today. If you have a servant at 127.0.0.1:3000
    that supports "commandable" and understands the "wake me up" command,
    you could run the calendar_watcher_servant with a servant_config file
    that looks as follows:
    {
      "ip":"127.0.0.1",
      "port":"4000",
      "calendar url":"http://www.foo.com/calendar"
      "servant url":"http://127.0.0.1:3000"
      "update seconds":"60"
    }

    With this configuration, the calendar watcher servant will check the
    calendar every 60 seconds for new events. When it checks after 10AM,
    it will discover the "wake me up" event and send it to the servant at
    127.0.0.1:3000.
  EOF
  s.licenses = [ "http://www.apache.org/licenses/LICENSE-2.0.txt" ]
  s.files = [ "LICENSE",
              "lib/belphanior/servant/calendar_watcher/calendar_watcher.rb",
              "bin/calendar-watcher-servant" ]
  s.add_dependency("ri_cal", ">= 0.8")  # https://github.com/rubyredrick/ri_cal/
  s.add_dependency("belphanior-servant", ">= 0.0.1")
  s.test_files = Dir.glob('lib/belphanior/servant/calendar_watcher/test/tc_*.rb')
end

desc "Run basic tests"
Rake::TestTask::new "test" do |t|
  t.pattern = "lib/belphanior/servant/calendar_watcher/test/tc*.rb"
  t.verbose = true
  t.warning = true
end

desc "Launch the servant (for testing)"
task :servant do |t|
  sh "bin/calendar-watcher-servant"
end

desc "Create gem package."
Rake::GemPackageTask.new(gemspec) do |p|
end
