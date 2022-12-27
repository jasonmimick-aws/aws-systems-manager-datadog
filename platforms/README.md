# AWS System Manager support for Datadog on multiple platforms.

Here you find folders which map to the supported Datadog agent
[platforms](https://docs.datadoghq.com/agent/). 
There is a folder for each supported platform. 

## Getting Started

There is an automated script to generate a template README and SSM document for
your new platform. You can use the instructions below to run the script or read
detailed manual steps below. The automation only supports Bash at this time,
please choose accordingly depending on your development system.

### Automation
- Navigate to `./platforms` in your shell. 
- Replace `PLATFORM_NAME` with your new platform and run this command. (Only
    BASH supported at this time.)  
```
./support-new-platform-bash-helper.sh PLATFORM_NAME
```
- Edit the new SSM document 

### Manual Steps

This README defines the manual steps required support a new AWS System Manager
document which installs the Datadog agent.

* Create a new folder under `/platforms` for your platform. Use lowercase and
    hyphenate multiple words. For example `amazon-linux`.
* Copy `./TEMPLATE_PLATFORM_README.md` into your new platform 
folder as `README.md`

    ```
    cp ./TEMPLATE_PLATFORM_README.md ./${PLATFORM_NAME}/README.md
    ```
* Update your readme as per notes in the TEMPLATE_PLATFORM_README.md. 
* Copy `aws-ssm-install-datadog-agent-TEMPLATE.yaml` into your platform folder replacing `TEMPLATE` with your `PLATFORM_NAME`.
* Edit template
* Create your SSM document:
    ```
    aws ssm create-document \
    --content file://PLATFORM_NAME/aws-ssm-install-datadog-agent-PLATFORM_NAME.yaml \
    --name "AWSSystemsManager-DatadogAgent-PLATFORM_NAME" \
    --document-type "Command" \
    --document-format YAML \
    ```
* Test - __TODO__ Add some testing, validation steps. 



## Enter your _PLATFORM_NAME_

* Maintain build status - :white_check_mark:, :x:, or use your imagination.
Keep it updated.
* Enter contact information for maintainer

## Link to Datadog installation documentation

## Notes

## Roadmap
