#!/bin/bash
while true; do
  cd /root/aqua-fl

  /usr/bin/python3 edgebox_node.py >> edgebox_loop.log 2>&1

  if [ -f /root/aqua-fl/edgebox_autoencoder_model.json ]; then
    /usr/bin/python3 edgebox_autoencoder.py infer >> edgebox_autoencoder.log 2>&1
  fi

  if [ -f /root/aqua-fl/edgebox_site_autoencoder.py ]; then
    /usr/bin/python3 edgebox_site_autoencoder.py >> edgebox_site.log 2>&1
  fi

  if [ -f /root/aqua-fl/edgebox_db_sync.py ]; then
    /usr/bin/python3 edgebox_db_sync.py >> edgebox_db.log 2>&1
  fi

  sleep 10
done
