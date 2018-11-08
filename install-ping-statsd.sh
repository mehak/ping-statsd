# TODO: Confirm this all works

# Make the ping-statsd user
useradd -d /opt/ping-statsd -M -s /sbin/nologin ping-statsd

# Get ping-statsd
git clone https://github.com/mehak/ping-statsd.git

# compile it
cd ping-statsd
crystal build ping-statsd

# Assuming no errors
cd ..
cp -r ping-statsd /opt/
chown -R ping-statsd:ping-statsd /opt/ping-statsd

# Install the serivce file
cp /opt/ping-statsd/ping-statsd.service /etc/systemd/system/ping-statsd.service
