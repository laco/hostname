#!/bin/sh

HOSTNAME=`hostname`
VERSION=${VERSION:-v1}
cat > /usr/share/nginx/html/index.html <<EOF
<html>
<head>
<title>This page is on $HOSTNAME and is version $VERSION</title>
</head><body>
<h1>THIS IS HOST $HOSTNAME</h1>
<h2>And we're running version: $VERSION</h2>
</body>
</html>
EOF

mkdir /usr/share/nginx/html/healthz /usr/share/nginx/html/hostname /usr/share/nginx/html/version
cat > /usr/share/nginx/html/hostname/index.html <<EOF
$HOSTNAME -- $VERSION
EOF
cat > /usr/share/nginx/html/version/index.html <<EOF
$VERSION
EOF
chmod 777 /usr/share/nginx/html/healthz
cat > /usr/share/nginx/html/healthz/index.html <<EOF
healthy
EOF

nginx -g "daemon off;"

