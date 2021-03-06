#!/bin/bash

####################################################
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
####################################################

CREATE_SP_SCRIPT="create-service-principal-2.0.sh"

docker run -it \
    -v ${DIR}/${CREATE_SP_SCRIPT}:/usr/scripts/${CREATE_SP_SCRIPT} \
    azuresdk/azure-cli-python /bin/bash -c "/usr/scripts/${CREATE_SP_SCRIPT}"
