#!/bin/bash
python3 -m alembic upgrade head
if [ $? == 0 ]; then
    exec gunicorn -k uvicorn.workers.UvicornWorker -b 0.0.0.0:5000 --forwarded-allow-ips="*" --log-level INFO api.main:app
fi
echo 'Alembic db upgrade failed...'
exit 1
