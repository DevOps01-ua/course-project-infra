terraform {
  backend "s3" {
    bucket = "course-project-develop-tfstate-bucket"
    key    = "boostrap/tfstate"
    region = "eu-central-1"
    dynamodb_table = "develop-course-projectterraform-state-lock-dynamo"
  }
}
