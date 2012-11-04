require 'rubygems'
require 'rake'
require 'rake/gempackagetask'
require 'rake/testtask'
# TODO(mtomczak): Temporary hack while I figure out gem paths
$: << File.dirname(__FILE__)+"/lib"
Gem.path << File.dirname(__FILE__)

gemspec = Gem::Specification.new do |s|
  s.name = %q{belphanior-calendar-watcher}
  s.version = "0.0.1"
  s.authors = ["Mark T. Tomczak"]
  s.email = %q{iam+belphanior-calendar-watcher@fixermark.com}
  s.summary = %q{Watches for events and notifies a servant when events occur.}
  s.add_dependency("ri_cal", ">= 0.8")  # https://github.com/rubyredrick/ri_cal/
  s.description =  %q{Watches a specified iCal calendar for events. When the time
                      for an event comes, runs the event on a specified servant.}
  s.files = [ "lib/belphanior/servant/calendar_watcher/calendar_watcher.rb",
              "bin/calendar-watcher-servant" ]
  s.test_files = Dir.glob('lib/belphanior/servant/calendar_watcher/test/tc_*.rb')
end


# desc "Run basic tests"
# Rake::TestTask::new "test" do |t|
#   t.pattern = "lib/belphanior/servant/timer/test/tc*.rb"
#   t.verbose = true
#   t.warning = true
# end

desc "Launch the servant (for testing)"
task :servant do |t|
  sh "bin/calendar-watcher-servant"
end

desc "Create gem package."
Rake::GemPackageTask.new(gemspec) do |p|
end
