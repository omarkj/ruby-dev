execute "createuser -U postgres -s vagrant" do
  creates "/home/vagrant/.psql_vagrant_user_created"
  user    "postgres"
end
