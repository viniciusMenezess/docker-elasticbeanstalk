resource "aws_elastic_beanstalk_application" "beanstalkApplication" {
  name        = var.nome
  description = var.description
}

resource "aws_elastic_beanstalk_environment" "beanstalkEnvironment" {
  name                = var.ambiente
  application         = aws_elastic_beanstalk_application.beanstalkApplication.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.7 running Docker"

 setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.maquina
  }

 setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max
  }
 
 setting {
    namespace = "aws:autoscaling:lauchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_ec2_profile.name
  }


}
