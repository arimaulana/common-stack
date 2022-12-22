#!/bin/bash
echo "sleeping for 10 seconds"
sleep 10

echo initiate_replica.sh time now: `date +"%T" `
mongosh --host common-mongodb:27017 <<EOF
  var cfg = {
    "_id": "rs0",
    "version": 1,
    "members": [
      {
        "_id": 0,
        "host": "common-mongodb:27017",
        "priority": 2
      }
    ]
  };
  rs.initiate(cfg);
EOF

# #!/bin/bash

# set -e

# echo "Starting replica set initialize"
# until mongo --host common-mongodb:27017 --eval "print(\waited for connection\")"
# do
#     sleep 2
# done
# echo "Connection finished"
# echo "Creating replica set"
# mongo --host common-mongodb:27017 <<EOF
# rs.initiate(
#     {
#         _id : 'rs0',
#         members: [
#             {
#                 "_id": 0,
#                 "host": "common-mongodb:27017",
#                 "priority": 2
#             },
#             {
#                 "_id": 1,
#                 "host": "common-mongodb2:27017",
#                 "priority": 0
#             }
#         ]
#     }
# )
# EOF
# echo "replica set created"
