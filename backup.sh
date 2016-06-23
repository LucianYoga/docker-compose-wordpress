#!/bin/bash

set -x

source env.development                                                            && \
docker-compose -f docker-compose.yml -f docker-compose.backup.yml run --rm backup    \
  tar cvf /backup/wordpress.tar /usr/src/wordpress                                && \
docker-compose -f docker-compose.yml -f docker-compose.backup.yml run --rm backup    \
  tar cvf /backup/mysql.tar /var/lib/mysql                                        && \
                                                                                     \
source env.aws                                                                    && \
docker-compose -f docker-compose.s3_uploader.yml run --rm s3_uploader

if [ '0' == $? ]; then RESULT='OK'; else RESULT='WTF'; fi

source env.mailgun && \
curl -s --user "api:$MAILGUN_API_KEY" \
     https://api.mailgun.net/v3/$MAILGUN_DOMAIN/messages \
     -F from="$MAILGUN_FROM" \
     -F to="$MAILGUN_TO" \
     -F subject="Wordpress Backup Status: $RESULT" \
     -F text="$RESULT"
