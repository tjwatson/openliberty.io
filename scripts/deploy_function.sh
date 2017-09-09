#!/bin/bash
function pushApp {
  cf push "${CF_APP}" --no-start --hostname openliberty-test
  cf set-env "${CF_APP}" PAT "${PAT}"
  if [[ -z $CURRENT_STATE ]]
  then
    cf bind-service "${CF_APP}" "${AVAILABILITY_SERVICE}"
  fi
  cf start "${CF_APP}"
  cf set-env "${CF_APP}" LAST_DEPLOY_NUMBER "${BUILD_NUMBER}"
}
