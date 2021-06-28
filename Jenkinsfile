pipeline{
  agent any
  
  environment{
    F_NAME= 'Ram'
    L_NAME= 'Bahadur'
    NEW_VERSION= '1.0.3'
  }
  
  parameters{
    string (name: 'User', defaultValue: 'Nabin', description: 'This is for Dev env')
    choice (name: 'Version', choices: ['1.0.0', '1.0.1', '1.0.3'], description: 'Version choices')
  }
  
  
  stages{
    stage ("Dev"){
      when{
        expression{
          NEW_VERSION == params.Version
        }
      }
      steps{
        echo 'This is dev stage'
        echo "Owner of this stage is :${F_NAME} ${L_NAME}"
        echo "Version: ${NEW_VERSION}"
      }
    }
    
    
    stage ("Terraform Init"){
      steps{
        withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS Terra User', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
            sh 'terraform init'
          }
      }
    }
    
    
    stage ("Terraform Plan"){
      steps{
       withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS Terra User', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
            sh 'terraform plan'
          }
        }
    }
    
    
    stage ("Terraform Apply"){
      steps{
        withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS Terra User', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
            sh 'terraform apply -auto-approve'
          }
        }
    }
    
    
    
    
  }
}
