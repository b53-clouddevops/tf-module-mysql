# This is going to inject the MySQL Schema
resource "null_resource" "schema" {

  provisioner "local-exec" {
        command = <<EOF
        cd /tmp 
        curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
        unzip -o mysql.zip 
        cd mysql-main 
        mysql -h ${aws_db_instance.mysql5.address} -uadmin1 -p RoboShop1 < shipping.sql
        EOF
    }
}