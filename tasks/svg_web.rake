VERSION = '2009-08-20-B'
 
namespace :svg_web do
  desc 'Install the SvgWeb scripts into the public/javascripts directory of this application'
  task :install => ['svg_web:add_or_replace_svg_web']
 
  desc 'Update the SvgWeb scripts installed at public/javascripts/svg_web for this application'
  task :update => ['svg_web:add_or_replace_svg_web']
 
  task :add_or_replace_svg_web do
    require 'fileutils'
    dest = "#{RAILS_ROOT}/public/javascripts/svg_web"
    if File.exists?(dest)
      # upgrade
      begin
        puts "Removing directory #{dest}..."
        FileUtils.rm_rf dest
        puts "Recreating directory #{dest}..."
        FileUtils.mkdir_p dest
        puts "Installing SvgWeb version #{VERSION} to #{dest}..."
        FileUtils.cp_r "#{RAILS_ROOT}/vendor/plugins/svg_web/public/javascripts/svg_web/.", dest
        puts "Successfully updated SvgWeb to version #{VERSION}."
      rescue
        puts "ERROR: Problem updating SvgWeb. Please manually copy "
        puts "#{RAILS_ROOT}/vendor/plugins/svg_web/public/javascripts/svg_web"
        puts "to"
        puts "#{dest}"
      end
    else
      # install
      begin
        puts "Creating directory #{dest}..."
        FileUtils.mkdir_p dest
        puts "Installing SvgWeb version #{VERSION} to #{dest}..."
        FileUtils.cp_r "#{RAILS_ROOT}/vendor/plugins/svg_web/public/javascripts/svg_web/.", dest
        puts "Successfully installed SvgWeb version #{VERSION}."
      rescue
        puts "ERROR: Problem installing SvgWeb. Please manually copy "
        puts "#{RAILS_ROOT}/vendor/plugins/svg_web/public/javascripts/svg_web"
        puts "to"
        puts "#{dest}"
      end
    end
  end
end
