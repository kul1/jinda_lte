module Jindalte 
  class InstallGenerator < Rails::Generators::Base
    desc "Install jinda adminlte theme to existing Jinda app "
    def self.source_root
      File.dirname(__FILE__) + "/templates"
    end

    def setup_app
      inside("app/views/layouts") { run "mv application.haml application.haml.bak" }
      inside("app/views/layouts") { run "mv lte lte.bak" }
      inside("app/assets") { run "mv javascripts javascripts.bak" }
      inside("app/assets") { run "mv stylesheets stylesheets.bak" }
      inside("app/jinda") { run "mv index.mm index.mm.bak"}

      directory "app/assets/lte/dist/img"
      directory "app/views/adminltes"
      directory "app/views/layouts/lte"

    end

    def copy_theme
      copy_file "application.js","app/assets/javascripts/application.js"
      copy_file "jindalte.js","app/assets/javascripts/jindalte.js"
      copy_file "application.scss","app/assets/stylesheets/application.scss"
      copy_file "jindalte.css","app/assets/stylesheets/jindalte.css"
      copy_file "application.haml","app/views/layouts/application.haml"
      copy_file "adminltes_controller.rb","app/controllers/adminltes_controller.rb"
      copy_file "index.mm","app/jinda/index.mm"
    end

    def finish        
      puts "----------------------------------------\n"
      puts "                                        \n"
      puts "AdminLTE 2.4 theme installation finished\n"
      puts "                                        \n"
      puts "----------------------------------------\n"
    end
  end
end

