name "webserver"
description "Web Server Role"
run_list "recipe[apache]","recipe[my_company]"
default_attributes ({
	"company" => "Devops Training"
})
