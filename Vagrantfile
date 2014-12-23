# -*- mode: ruby -*-

# Dir to sync to the Virtualbox
SYNC = [["#{ENV['RIP_SYNC']}", "/home/vagrant/synced"]]

Vagrant.configure("2") do |config|
  # This is for Work stuff, use Ubuntu 10.04
  config.vm.box = "chef/ubuntu-10.04"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Setup ssh forwarding for repos
  config.ssh.forward_agent = true
  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  # Setup sync dirs
  SYNC.each do |dir|
    config.vm.synced_folder(dir.first, dir.last)
  end

  # Run chef solo
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "postgresql::default"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "redisio::default"
    chef.add_recipe "redisio::enable"
    chef.add_recipe "redisio::install"
    chef.add_recipe "rubies::default"
    chef.add_recipe "setup-psql::default"
    chef.log_level = "debug"
    chef.json = {
      "postgresql" => {
        "password" => {
          "postgres" => "123456"
        },
        "pg_hba" => [{"comment" => "# Allow all local",
                       "type" => "local",
                       "db" => "all",
                       "user" => "all",
                       "addr" => nil,
                       "method" => "trust"},
                     {"comment" => "# Allow all ipv4",
                       "type" => "host",
                       "db" => "all",
                       "user" => "all",
                       "addr" => "0.0.0.0/0",
                       "method" => "trust"},
                     {"comment" => "# Allow all ipv6",
                       "type" => "host",
                       "db" => "all",
                       "user" => "all",
                       "addr" => "::1/128",
                       "method" => "trust"}
                    ],
        "version" => "9.3",
        "enable_pgdg_apt" => true,
        "initdb_locale" => "en_US",
        "server" => {
          "config_change_notify" => :reload
        }
      },
      "rubies" => {
        "install_bundler" => true,
        "list" => [ 'ruby 1.9.3-p545'
                    # ,'ruby 2.1.1'
                  ]
      },
      "chruby_install" => {
        "default_ruby" => "1.9.3-p545"
      }
    }
  end

end
