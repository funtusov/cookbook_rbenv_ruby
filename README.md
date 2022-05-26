# rbenv_ruby

This cookbook does a clean install of rbenv via homebrew and the specified (or latest stable, by default) ruby version.

## Usage

```
# Install latest ruby
chef-client -z -o rbenv_ruby


# Install specified ruby version

# Create a json config file:
# {
#   "rbenv_ruby": {
#    "ruby_version": "3.0.4"
#  }
# }

chef-client -z -o rbenv_ruby -j path_to_config.json
```