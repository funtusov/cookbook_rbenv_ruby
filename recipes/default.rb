#
# Cookbook:: rbenv_ruby
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

homebrew_package ['rbenv', 'ruby-build'] do
  action :install
end

execute 'init rbenv' do
  command 'rbenv init - zsh'
end

execute 'install latest ruby' do
  command 'rbenv install $(rbenv install -l | grep -v - | tail -1)'
end
