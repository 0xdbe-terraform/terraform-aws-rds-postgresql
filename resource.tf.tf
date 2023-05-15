resource "random_integer" "suffix" {
  min     = 1
  max     = 999
}

resource "random_password" "admin" {
  length           = 30
  special          = true
  override_special = "/_%?!#()-[]<>,;*@="
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
}

resource "aws_db_instance" "main" {
  allocated_storage    = 20
  db_name              = "${var.application_name}0${format("%000d",random_integer.suffix.result)}"
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = "db.t4g.micro"
  username             = var.application_name
  password             = random_password.admin.result
  publicly_accessible  = true
  skip_final_snapshot  = true
  storage_type         = "gp3"
}