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
