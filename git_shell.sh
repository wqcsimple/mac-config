#! /bin/bash

commit_message="update";

if test -z "$1"
then
    read dataOne
else
    dataOne=$1
fi

case ${dataOne} in
  1)
    exit
  ;;
  2)
    tag="1.0.1"
    tag_list=$(git tag --sort version:refname)
    OLD_IFS="$IFS"
    IFS=" "
    arr=($tag_list)
    IFS="$OLD_IFS"
    tag_length=0;
    for s in ${arr[@]}
    do
        tag_length=`expr ${tag_length} + 1`
    done
    # 判断是否有打过tag
    hundreds=0 # 百位数字
    if test $[tag_length] -gt 0
    then
        num=${tag_length}

        if [ ${num} -ge 1000 ]
        then
            hundreds=`expr ${num} / 1000`
        fi
        num=`expr ${num} % 1000 + 1`
        tag="1.${hundreds}.${num}"
    fi

    echo "push tag: ${tag}"
    git tag ${tag} && git push origin ${tag}
    exit
  ;;
  *)
    commit_message=${dataOne};
  ;;
esac

branch_list=$(git branch | grep '*')
current_branch=${branch_list:2}

git status && git add -A && git commit -m "${commit_message}" && git push origin ${current_branch}