echo [all] > inventory.txt

aws ec2 describe-instances \
    --query 'Reservations[*].Instances[*].PublicIpAddress' \
    --filters "Name=tag:project,Values=udapeople" \
    --output text >> inventory.txt
