#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if node.environment == "development"
artifact_dir = node['tomcat']['s3_webapp_development']
elsif node.environment == "production"
artifact_dir = node['tomcat']['s3_webapp_production']


puts "Artifact Dir : #{artifact_dir}"

execute "remove_old_jar"
  user "root"
  cwd "/usr/local/tomcat7/webapps"
  command "rm -rf com.webdemo.war"
end   

execute "get_tomcat_war" do
  user "root"
  group "root"
  cwd  "/usr/local/tomcat7/webapps"
  command "s3cmd get -f #{node['tomcat']['s3_webapp_path']}/#{artifact_dir}/com.webdemo.war"
 end
