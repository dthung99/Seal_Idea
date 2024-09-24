# Seal Idea

This is the source code for the [Seal Idea website](https://sealidea.com/).

## Project Structure
- `backend`: Source code for the Spring Boot back-end application.
- `frontend`: Source code for the React front-end application.
- `postgre_queries`: SQL queries for the PostgreSQL database.
- `.github/workflows`: CI/CD pipeline configuration files.

## Technologies Used
- **Database**: PostgreSQL (deployed on AWS RDS)
- **Back-end**: Spring Boot (Java), containerized and deployed on AWS EC2
- **Front-end**: React (JavaScript), containerized and deployed on AWS EC2

## Deployment
The server code and containerization steps can be found in the `backend` and `frontend` directories. The database queries are located in the `postgre_queries` directory.

The project includes two CI/CD pipelines configured using GitHub Actions, which can be found in the `.github/workflows` directory. These pipelines are responsible for building and deploying the containerized applications to AWS.

The PostgreSQL database is hosted on AWS RDS, and the Spring Boot back-end and React front-end applications are containerized and deployed on two different ports on AWS EC2 instances.
