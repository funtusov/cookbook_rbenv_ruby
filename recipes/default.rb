#
# Cookbook:: rbenv_ruby
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

homebrew_package ['rbenv', 'ruby-build'] do
  action :remove
end

execute "remove all previous rbenv versions" do
  command "rm -rf ~/.rbenv"
end

homebrew_package ['rbenv', 'ruby-build'] do
  action :install
end

execute 'init rbenv' do
  command %{
  	if [[ $(cat ~/.zshrc | grep rbenv) ]]; then
		    echo "rbenv already present in zshrc, skipping"
		else
		    echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc
		    source ~/.zshrc
		fi
  }
end

ruby_version = node.normal['rbenv_ruby']['ruby_version']

if ruby_version == 'latest' or ruby_version == {}
	ruby_version = shell_out("rbenv install -l | grep -v - | tail -1").stdout
end

execute "installing ruby #{ruby_version}" do
  command "rbenv install #{ruby_version}"
  returns [0, 1]
end

execute "activating ruby #{ruby_version}" do
  command "rbenv global #{ruby_version}"
end
