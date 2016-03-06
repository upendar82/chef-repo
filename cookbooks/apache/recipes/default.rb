#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
## Install Apache


package_name = "apache2"
service_name = "apache2"
document_root = "/var/www"



if node["platform"] == "centos"
	package_name = "httpd"
	service_name = "httpd"
	document_root = "/var/www/html"
end



## Install Apache

package package_name do
        action :install
end

## Start the service
### Enable the service at reboot

service service_name do
        action [:start, :enable]
end

## copy index.html for home page

template "#{document_root}/index.html" do
        source "index.html.erb"
        mode "0644"
end
