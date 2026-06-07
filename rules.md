# Global Rules for Local LLM Agent

## 1. Security & Authentication
- NEVER hardcode API tokens or private keys inside scripts or prompts.
- Load the Hugging Face token from the environment variable `$HF_TOKEN` or look into `~/.cache/huggingface/token`.
- Load SSH credentials from the standard `$HOME/.ssh/` directory if secure cloning is required.

## 2. Hardware-Aware Model Selection Constraints
Before suggesting or downloading any model, enforce strict parameter size limits based on system RAM to avoid Out-Of-Memory (OOM) crashes:
- **RAM < 16 GB:** Strictly choose **1B to 3B** parameter models (e.g., Qwen2.5-3B, Llama-3.2-3B).
- **RAM 16 GB to 32 GB:** Choose **7B to 9B** parameter models (e.g., Llama-3-8B, Gemma-2-9B).
- **RAM > 32 GB:** Allow heavier models (**14B to 32B+**).

## 3. Platform-Specific Optimization Rules
- **Apple Silicon (ARM64, M-Series):** High-priority target. Utilize GGUF format with standard quants (`Q4_K_M` or `Q8_0`) to take advantage of Unified Memory speed.
- **Intel Architecture (x86_64):** Rely on aggressive quantization (`Q4_K_S` or `Q3_K_M`) because execution runs primarily on CPU/RAM with lower bandwidth. Keep models strictly under 8B to maintain acceptable generation speed.

## 4. Model Use-Case Priority (Ranking Logic)
When suggesting models, rank them based on primary user intent:
- **Text/Code (Logic):** Prioritize models with high benchmark scores in reasoning (e.g., Qwen2.5, Llama-3.1).
- **Creative/Vision (Multimodal):** Prioritize models with "Vision" or "VL" tags (e.g., Llama-3.2-Vision, Qwen2-VL).
- **Speed/Chat:** Prioritize smaller quants or distilled versions for instant response.

## 5. Execution Workflow
1. Run `./check_hardware.sh` to profile host hardware.
2. Cross-reference detected specs with the RAM constraints.
3. Ask user for primary intent (Text vs. Image/Vision).
4. Present top 3-5 recommended models with brief explanations.
5. Execute download via [Ollama] or [LM Studio] based on choice.
