#!/bin/bash

# Copyright 2014 TowerData
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

API_KEY="API KEY"

HOST="api.towerdata.com"
BASEPATH="/v5/td"
TIMEOUT=2

function queryByEmails
{
  emails=$1                   # Array of string emails
  
  urlConcat=""
  for ((i=0; i<${#emails[@]}; i++)) {
    urlConcat=$urlConcat`buildUrl ${emails[i]}`" "
  }
  
  response=`curl -s -A 'TowerDataApi/bash/1.0' -m $TIMEOUT $urlConcat`
  echo $response
}

function buildUrl
{
  email=$1                    # String email
  showAvailable=${2-false}    # Boolean specifying whether or not to report that RapLeaf has data for additional fields
  
  url="https://"$HOST$BASEPATH"?api_key="$API_KEY"&email="$email
  
  echo $url
}

