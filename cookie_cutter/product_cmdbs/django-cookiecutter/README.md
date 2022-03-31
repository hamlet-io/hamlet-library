# Django Cookie Cutter

This template is for the creation of an AWS based Django deployment. It includes all of the components required for a produciton level deployment of Django 

- Web ECS Service for front end
- Worker ECS Service for celery processing
- Task ECS Task Definition for Django management
- Postgres based RDS instance
- Cloudfront S3 distribution for static content
- Redis for queue management between web and worker
- HTTPS offloading load balancer for web

The template will create a single environment. If you want more you will need too add them manually.
