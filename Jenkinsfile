pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/henryJosephCalaniA/jmeter-performance-create-users.git'
            }
        }


        stage('Build JMeter Image') {
            steps {
                sh '''
                docker build -t jmeter-suite .
                '''
            }
        }


        stage('Run Performance Test') {
            steps {
                sh '''
                docker run --rm \
                -v $(pwd)/results:/tests/results \
                jmeter-suite \
                -n \
                -t /tests/Users_TestPlan.jmx \
                -l /tests/results/result.jtl \
                -e \
                -o /tests/results/report
                '''
            }
        }


        stage('Publish Report') {
            steps {
                archiveArtifacts artifacts: 'results/report/**'
            }
        }
    }
}
