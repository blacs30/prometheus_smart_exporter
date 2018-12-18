#! /bin/sh
if ! pgrep -qf prometheus_smart_exporter; then
echo "Starting smart exporter now"

smart_exporter_helper -vvv --socket-path /var/run/smart_export.sock &

prometheus_smart_exporter -v --device-db /mnt/jails/tools/check_smartdb.json --attr-mapping /mnt/jails/tools/attribute_mapping.json  -a 0.0.0.0 /var/run/smart_export.sock &
fi
exit 0
