#!/bin/bash

if [ $# -eq 0 ]; then
    echo "请输入要查询的内容作为参数。"
    exit 1
fi

query="$1"
text=$(curl -s "cheat.sh/$query")

# 初始化临时变量
linshi=""

# 使用sed过滤ANSI转义码，并遍历文本的每一行
while IFS= read -r line; do
    # 使用sed去掉ANSI转义码
    clean_line=$(echo "$line" | sed -r "s/\x1B\[[0-9;]*[mK]//g")

    # 检查是否包含#字符
    if [[ $clean_line == *#* ]]; then
        # 如果包含#字符，则将该行添加到linshi变量中，并翻译
        linshi="$linshi$clean_line"
        translated_line=$(trans -b :zh "${linshi}")
        echo "$translated_line"
        # 清空linshi变量以准备下一行
        linshi=""
    else
        # 如果不包含#字符，则直接打印原始行
        echo "$clean_line"
    fi
done <<< "$text"

# 如果文本的最后一行包含#字符，需要在循环外再次处理
if [[ -n $linshi ]]; then
    translated_line=$(trans -b :zh "${linshi}")
    echo "$translated_line"
fi
