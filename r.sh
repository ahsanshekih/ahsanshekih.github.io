#!/bin/sh -e


# Phone numbers
MY_NUMBER='+447397006033'
HER_NUMBER='+447925050333'

REASONS=(
  'Working hard'
  'Gotta ship this feature'
  'Someone fucked the system again'
)
rand=$[ $RANDOM % ${#REASONS[@]} ]

RANDOM_REASON=${REASONS[$rand]}
MESSAGE="Late at work. "$RANDOM_REASON

# Send a text message
RESPONSE=`curl -fSs -u "$AC1f3efe8cce99cd91d0f1e55a16f74edd:$4795e16db192cf6a745f8ccdc550bd9a" \
  -d "From=$MY_NUMBER" -d "To=$HER_NUMBER" -d "Body=$MESSAGE" \
  "https://api.twilio.com/2010-04-01/Accounts/$AC1f3efe8cce99cd91d0f1e55a16f74edd/Messages"`

# Log errors
if [ $? -gt 0 ]; then
  echo "Failed to send SMS: $RESPONSE"
  exit 1
fi
