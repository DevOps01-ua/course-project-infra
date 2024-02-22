####
#S3
###
resource "aws_s3_bucket" "state_bucket" {
  bucket = "${var.project_name}-${var.environment}-tfstate-bucket"

  tags = {
    Name        = "terraform state bucket"
    Environment = "${var.environment}"
  }
}

#########
#DynamoDB
#########
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "${var.environment}-${var.project_name}terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 10
  write_capacity = 10

  attribute {
    name = "LockID"
    type = "S"
  }
}
