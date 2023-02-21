export BACKEND_IP=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].PublicIpAddress' --filters "Name=tag:project,Values=udapeople" --output text)
export API_URL="http://${BACKEND_IP}:3030"
echo "${API_URL}"
if curl "${API_URL}/api/status" | grep "ok"
then
    return 0
else
    return 1
fi