#!/bin/zsh -il
script_dir="${0:A:h}"
if [[ -x "$script_dir/.venv/bin/python" ]]; then
  python_cmd="$script_dir/.venv/bin/python"
else
  python_cmd="$(command -v python3)"
fi
if [[ -z "$python_cmd" ]]; then
  echo "未找到 Python 3。"
  read -r "reply?按回车关闭此窗口…"
  exit 1
fi
"$python_cmd" "$script_dir/ic_chatgpt_hotkey.py"
result=$?
echo
if [[ $result -ne 0 ]]; then
  echo "启动失败。请检查上面的提示。"
fi
read -r "reply?按回车关闭此窗口…"
exit $result
