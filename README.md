## Sandbox

Creating this repository as a sandbox for developing with AWS Cloud services.

![example workflow](https://github.com/teaglebuilt/aws/actions/workflows/main.yaml/badge.svg)


## Instructions

1. Clone Repository

2. Give permissions to run file `run.sh` - `chmod +x run.sh`
  - Optional:
    ```
    export run=./run.sh
    ```

3. Start aws `docker-compose up` or `run up`

4. Generate infrastructure `run create`
  - Creates `sns.yaml`

5. Verify infrastructure `run sns list-topics`