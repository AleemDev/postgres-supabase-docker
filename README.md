# postgres-supabase-docker
A production-ready local database boilerplate built with PostgreSQL and Supabase, fully containerized via Docker and orchestrated through the Supabase CLI as a local dev dependency.

## Project Overview

This repository provides a self-contained, isolated local database environment that emulates the Supabase production platform. It spins up an integrated stack of backend microservices—including the core PostgreSQL database, authentication, and a visual management dashboard—without requiring any database software to be installed directly on the host machine.
Tech Stack

* Database Engine: PostgreSQL.

* Backend-as-a-Service (BaaS): Supabase (GoTrue Auth, PostgREST APIs, Realtime).

* Orchestration: Docker & Docker Compose.

* Tooling: Supabase CLI & Make.

## Core Architecture & Configuration

* Configuration Source of Truth: The root supabase/ directory holds the config.toml environment settings, timestamped SQL migrations/, and a seed.sql script that automatically inserts repeatable test data whenever the environment boots or resets.

* Containerized Microservices: The local CLI acts as a manager, pulling pre-built Docker images (rather than compiling raw source code) and networking roughly 10 interdependent microservices in the background. This includes a local API Gateway on port 8000 and the Supabase Studio visual dashboard on port 54323.

* Automated Makefile Orchestration: A Makefile is configured to conditionally sequence the environment (e.g., make dev), checking if the setup is initialized before safely spinning up the Supabase containers alongside any other full-stack microservices on the shared Docker host network.

* Serverless Connection Pooling: The setup is pre-configured to utilize Supavisor in transaction mode (port 6543), simulating edge-compatible connection pooling to prevent connection exhaustion from serverless backend functions.