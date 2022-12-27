# aws-systems-manager-datadog
_Prototype AWS Systems Manager support for Datadog_

:warning:
:construction:
Working repo to build out AWS System Manager support for Datadog.

## Goals

:round_pushpin: SSM Documents to install the Datadog agent on EC2.

:round_pushpin: SSM Documents to install the Datadog integration.

## Open Questions

- Installing the overall Datadog integration into an account should also be
    supported? What are the gaps between the overall account/regional activation
    and additional dedicated platform support?
    - I've already started adding support for installing a dedicated agent
    into different platorms, ec2, and then eventually containerizer
    environments, but this requirement needs customer validation.
- How will the RBAC on this work? Will it integration with Control Tower and
    Account Factory?
- What is the best implementation format? Should we shift to CloudFormation
    templates rather than SSM docs (or support both)?
- How can we best test MGN?
-



