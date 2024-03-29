require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rdoc/task'
require 'rubygems/package_task'

spec = Gem::Specification.new do |s|
  s.name = %q{belphanior-calendar-watcher-servant}
  s.version = "0.0.1"
  s.authors = ["Mark T. Tomczak"]
  s.email = %q{belphanior+calendar-watcher@fixermark.com}
  s.summary = %q{Watches for events and notifies a servant when events occur.}
  s.description = IO.read("README")
  s.homepage = "http://belphanior.net"
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

# This task actually builds the gem. We also regenerate a static
# .gemspec file, which is useful if something (i.e. GitHub) will
# be automatically building a gem for this project. If you're not
# using GitHub, edit as appropriate.
#
# To publish your gem online, install the 'gemcutter' gem; Read more
# about that here: http://gemcutter.org/pages/gem_docs
Gem::PackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Build the gemspec file #{spec.name}.gemspec"
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end

# If you don't want to generate the .gemspec file, just remove this line. Reasons
# why you might want to generate a gemspec:
#  - using bundler with a git source
#  - building the gem without rake (i.e. gem build blah.gemspec)
#  - maybe others?
task :package => :gemspec

# Generate documentation
Rake::RDocTask.new do |rd|
  rd.main = "README"
  rd.rdoc_files.include("README", "lib/**/*.rb")
  rd.rdoc_dir = "rdoc"
end

desc 'Clear out RDoc and generated packages'
task :clean => [:clobber_rdoc, :clobber_package] do
  rm "#{spec.name}.gemspec"
end
