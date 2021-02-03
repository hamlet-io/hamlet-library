# hamlet-library

A library of standard infrastructure components that we use in Hamlet

## Hamlet Deploy Plugins

These plugins extend the [hamlet deploy](https://hamlet.io) engine to support different deployment models

### Official Plugins

These are maintained by the hamlet team and are included in the docker distribution

- [AWS](https://github.com/hamlet-io/engine-plugin-aws)

    CloudFormation based Deployments to Amazon Web Services

- [Azure](https://github.com/hamlet-io/engine-plugin-azure)

    Azure Resource Manager based deployments to Microsoft Azure

- [Diagrams](https://github.com/hamlet-io/engine-plugin-diagrams)

    Infrastructure diagram generation based on [Diagrams](https://diagrams.mingrammer.com/)

### Community Plugins

These are community plugins which generally implement modules based on the official plugins

- [Cloudfront Authorization @Edge](https://github.com/hamlet-io/cloudfront-authorization-at-edge)

    Adds Cognito Authorization to Cloudfront Distributions using Lambda@Edge. Plugin is available under `hamlet/cfcognito`

- [Github IDP for Cognito](https://github.com/gs-gs/github-idp)

    Creates an OIDC shim for Github oAuth Apps which is compatible with Cognito Federated Identities for userpools. Plugin is available under `hamlet/githubidp`

- [Cogntio Auth for QuickSight](https://github.com/hamlet-io/aws-cognito-quicksight-auth)

    Provides access through a single page app portal into AWS QuickSight using Cognito authentication. Plugin is available under `hamlet/cognitoqs`

- [S3 Support](https://github.com/hamlet-io/lambda-s3-support)

    Utilities or managing S3 Buckets with hamlet deployment module. Plugin is available under `hamlet/s3support`

## Jenkins

### Shared Libraries

A collection of [Shared Libraries](https://www.jenkins.io/doc/book/pipeline/shared-libraries/) we use in Hamlet

- [Hamlet Shared Library](https://github.com/hamlet-io/jenkins-shared-library)

    A collection of standard steps that you can use in Jenkins pipelines to work with hamlet-deploy

- [Hamlet Streams Shared Library](https://github.com/hamlet-io/jenkins-streams-shared-library)

    A release process built on top of the functions available in hamlet-deploy
