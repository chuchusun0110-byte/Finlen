# 开始使用

1. 阅读根目录 `README.md`，了解功能、架构与运行方式。
2. 查看 `docs/assets/demo-dashboard.png` 和系统架构图。
3. 按 `docs/DEMO_GUIDE.md` 启动后端并完成一轮完整请求。
4. 运行自动化测试和评测脚本，检查主要工作流。
5. 通过 `docs/PRD.md`、`docs/ARCHITECTURE.md` 和 `docs/LIMITATIONS.md` 了解设计与边界。

最小验证命令：

```bash
pip install -r requirements.txt
python -m unittest discover -s tests -v
python scripts/evaluate.py
uvicorn app.main:app --reload
```

