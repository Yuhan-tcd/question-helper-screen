# Question Helper Screen

在 Mac 上框选题目截图，通过已登录的 Codex CLI 获取简短答案。支持任意学科的题目；也可以导入课程资料，供回答时参考。

## 准备

- macOS、Python 3.10 或更新版本
- 已安装 [Codex CLI](https://developers.openai.com/codex/cli/)
- 使用 ChatGPT 账号运行 `codex login`，并用 `codex login status` 确认已登录

在此文件夹打开终端，安装 Python 依赖：

```sh
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements.txt
```

## 运行

在终端运行：

```sh
.venv/bin/python ic_chatgpt_hotkey.py
```

也可以在终端运行 `zsh ic_chatgpt.command`；若要双击启动，先运行 `chmod +x ic_chatgpt.command`。首次使用全局快捷键时，请在 macOS 的“系统设置 → 隐私与安全性 → 辅助功能”中允许终端访问。

- 按 **Command + Shift + K**，然后拖动鼠标框选题目。
- 也可以在终端按 **Enter** 触发截图。
- 在终端输入 `q` 并回车退出。

脚本会将截图交给 Codex CLI，并只显示最终答案。如果截图或题目条件不足，会显示无法确定或不确定原因。答案仍需自行核对。

## 导入课程资料（可选）

```sh
.venv/bin/python import_course_material.py --course deep_learning "/path/to/lecture.pptx" "/path/to/notes.pdf"
```

支持 PDF、PPTX、DOCX、TXT、Markdown；旧版 PPT 需要先安装 LibreOffice。导入器提取可搜索文字，保存原文件与文本索引到 `course_materials/`。扫描 PDF、图片中的文字与公式不会被识别；导入时会提示相关情况。

`course_materials/` 已由 `.gitignore` 排除，避免课程资料进入公开仓库。请不要将个人资料、受版权保护的讲义或 API 密钥手动上传。

## 费用与连接

程序使用已登录的 Codex CLI，不读取 API Key。实际可用模型与使用额度以你的 ChatGPT/Codex 账号为准。网络连接是回答题目所必需的。
