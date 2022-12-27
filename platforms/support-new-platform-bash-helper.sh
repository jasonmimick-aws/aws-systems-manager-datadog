#!/usr/bin/env bash

set -eou pipefail

set -x

PLATFORM="${1}"
# TODO/ fail if no PLATFORM
echo "Attempting setup for platform '${PLATFORM}'."


if [ -d "${PLATFORM}" ];
then
    echo "${PLATFORM} directory exists. Please consult the documentation and choose a different platform name."
    exit 1
else
	echo "${PLATFORM} directory does not exist. OK to proceed."
fi

SSM_TEMPLATE_NAME_PATTERN="aws-ssm-install-datadog-agent"
SSM_TEMPLATE="${2:-${SSM_TEMPLATE_NAME_PATTERN}-TEMPLATE.yaml}"

NEW_SSM_PLATFORM_DOCUMENT="${SSM_TEMPLATE_NAME_PATTERN}-${PLATFORM}.yaml"
README="${3:-./TEMPLATE_PLATFORM_README.md}"

echo "SSM_TEMPLATE_NAME_PATTERN=${SSM_TEMPLATE_NAME_PATTERN}"
echo "NEW_SSM_PLATFORM_DOCUMENT=${NEW_SSM_PLATFORM_DOCUMENT}"
echo "SSM_TEMPLATE=${SSM_TEMPLATE}"


mkdir "${PLATFORM}"
cp "${SSM_TEMPLATE}" "${PLATFORM}/${NEW_SSM_PLATFORM_DOCUMENT}"
cp "${README}" "${PLATFORM}/NEW_README.md"
sed "s/_PLATFORM-NAME_/${PLATFORM}/g" "${PLATFORM}/NEW_README.md" > "${PLATFORM}/README.md"
rm "${PLATFORM}/NEW_README.md"




