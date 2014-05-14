namespace :sphinx do
  desc "Setup sphinx"

  desc "Setup sphinx configuration for this application"
  task :setup, roles: :web do
    template "sphinx_init.erb", "/tmp/sphinx"
    run "#{sudo} mv /tmp/sphinx /etc/init.d/#{application}_sphinx"
    run "#{sudo} chmod +x /etc/init.d/#{application}_sphinx"
    run "#{sudo} update-rc.d #{application}_sphinx defaults"
  end
  # after "deploy:setup", "nginx:setup"
  
  %w[start stop reindex].each do |command|
    desc "#{command} sphinx"
    task command, roles: :web do
      run "/etc/init.d/#{application}_sphinx #{command}"
    end
  end
end