# Local LLM Agent Setup

This project provides an automated, hardware-aware workflow for deploying Local Large Language Models (LLMs) on macOS. It profiles your system and recommends the best models based on your RAM, CPU, and specific use cases (Coding, Chat, or Vision).

Based on the tutorial by **[Web3nity](https://www.youtube.com/@Web3nity)**.
Inspired by this video: [https://youtu.be/9_uJOuxbzq0](https://youtu.be/9_uJOuxbzq0)

## Features
- **Auto-Profiling:** Automatically detects CPU architecture (Intel vs. Apple Silicon) and RAM.
- **Smart Selection:** Recommends models that won't crash your system (OOM protection).
- **Intent-Based Ranking:** Prioritizes models based on whether you need Coding, General Chat, or Vision capabilities.
- **Seamless Deployment:** Supports Ollama and LM Studio.

## Quick Start

1. **Clone this workspace:**
   ```bash
   mkdir -p ~/Developer/local-llm
   cd ~/Developer/local-llm
   # Copy rules.md, skills.md, and check_hardware.sh into this folder
   ```

2. **Run Gemini CLI in this folder:**
   Simply call your Gemini CLI agent and say:
   > "Download model" or "Check my hardware"

3. **Follow the dialogue:**
   The agent will run the profile, ask for your intent, and provide a ranked list of compatible models.

## Files
- `rules.md`: Global constraints, hardware-to-model mapping, and security rules.
- `skills.md`: Technical instructions for the agent on how to execute profiling and deployment.
- `check_hardware.sh`: A shell script that performs the actual system scan.

## Security
- This project **never** stores API keys or secrets.
- Always load your `HF_TOKEN` via environment variables.

## Optional: Enhance with Hugging Face Token

To unlock faster download speeds and access restricted models (like Llama-3), you can provide a Hugging Face Access Token.

1. **Get your token:** Create a "Read" token at [huggingface.co/settings/tokens](https://huggingface.co/settings/tokens).
2. **Usage:** Set the `HF_TOKEN` environment variable in your shell or provide it when prompted by the agent.
3. **Why?** Authenticated requests are prioritized by Hugging Face's servers, which can significantly reduce download times for large model files.

---
*Created with ❤️ for the Local LLM Community.*
