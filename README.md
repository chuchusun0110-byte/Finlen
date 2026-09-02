# FinLens 3.0

FinLens 是一个可审计的多智能体金融研究 Copilot。系统将资料检索、财务计算、回答生成和事实校验拆分为独立工作流，并在结果中保留证据、工具输出和执行轨迹。

![FinLens 产品界面](docs/assets/demo-dashboard.png)

## 核心能力

- 混合检索：BM25、向量召回、RRF 融合和相邻页增强。
- 财务工具：指标查询、增长率计算和异常变化识别。
- 多智能体编排：Research 与 Financial 并行执行，Synthesis 汇总结果。
- 独立校验：Verifier 检查引用编号和数值依据，失败时触发一次修订。
- 对话上下文：基于 `thread_id` 保存短期会话状态。
- 安全控制：识别提示词注入，并限制无依据的投资建议与目标价输出。
- 可观测性：返回路由、检索、工具调用、校验及修订轨迹。

## 系统架构

![FinLens 系统架构](docs/assets/finlens-system-architecture.png)

主流程：

```text
Guardrail → Supervisor → Research Agent ┐
                       → Financial Agent ├→ Synthesis → Verifier → Finalize
                                        ┘                 └→ Revision（最多一次）
```

Supervisor 使用确定性规则进行路由。Research Agent 负责证据检索，Financial Agent 负责结构化计算，Verifier 独立检查答案是否有引用和数值支持。各子图通过明确的数据结构交接状态。

## 快速运行

环境要求：Python 3.11+、Node.js 20+。

### 后端

```bash
python -m venv .venv
# Windows: .venv\Scripts\activate
# macOS/Linux: source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```

访问 `http://127.0.0.1:8000`。首次运行会创建本地数据库。未配置模型密钥时，系统使用证据优先的离线回退模式。

### 展示页面

```bash
npm install
npm run dev
```

访问 `http://localhost:3000`。该页面用于呈现产品界面；完整 Agent 能力由 Python 后端提供。

### 测试与评测

```bash
python -m unittest discover -s tests -v
python scripts/evaluate.py
```

## 文档

- [产品需求](docs/PRD.md)
- [系统架构](docs/ARCHITECTURE.md)
- [运行与演示](docs/DEMO_GUIDE.md)
- [评测说明](docs/EVALUATION.md)
- [数据与能力边界](docs/LIMITATIONS.md)
- [目录说明](docs/PROJECT_STRUCTURE.md)

## 数据说明

仓库中的公司、财务报告和评测问题均为虚构演示数据，仅用于验证系统流程，不构成投资建议。真实场景需要接入授权数据源，并完善权限、隐私、审计和合规机制。

