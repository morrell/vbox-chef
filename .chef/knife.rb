current_dir = File.dirname(__FILE__)
log_level                 :info
log_location              STDOUT
node_name                 "chefadmin"
client_key                "#{current_dir}/chef-admin.pem"
chef_server_url           "https://chef.foobar.local/organizations/foobar"
cookbook_path             ["#{current_dir}/../cookbooks"]