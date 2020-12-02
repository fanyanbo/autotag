#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

if [ $# -eq 0 ];
then
    echo '请输入tag名称！！！'
    exit
fi

# DATEPATTERN="^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$"
DATEPATTERN="^final_v[1-9]\.[0-9]\.[0-9]$"
if [[ "$1" =~ $DATEPATTERN ]]; then :
else
echo "date format is invalid!"
exit;
fi

rm -rf dist

mkdir dist
cd dist
touch a.txt
echo 'test111' > a.txt

# 生成静态文件
#npm run docs:build

# 进入生成的文件夹
# cd docs/.vuepress/dist

cd -

git tag $1

git push -f origin $1



