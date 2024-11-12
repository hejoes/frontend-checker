# Frontend Endpoint Availability Checker

- `Bash` script that continuously (every 1s) checks the endpoint availability.
  - 🟢 Green: Successful (1xx-3xx)
  - 🔴 Red: Error (4xx, 5xx)

## Purpose

Some use cases:

- Kubernetes cluster upgrades & components maintenance
- Rolling deployments
- Application changes
- DNS, CNI changes
