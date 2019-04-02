#alias aws=~/aws.sh
#HTTP_PROXY=http://username:password@a.b.c.d:n
#HTTPS_PROXY=http://username:password@w.x.y.z:m

export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=us-east-1
#sa-east-1
#us-east-1

docker run -it --rm \
-v /c:/c \
--env AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
--env AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
--env AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
frkr/ecs-cli
