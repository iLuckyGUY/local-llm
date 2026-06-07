# Skill Manifest for Local LLM Agent

## Skill 1: Automated Guided Selection
The agent must follow this logic when the user says "download model":
1. **System Check:** Run `./check_hardware.sh`.
2. **Analysis:** Match RAM and CPU results against `rules.md`.
3. **Intent Discovery:** Ask the user: "What is your main goal? (e.g., Coding, General Chat, or Vision/Images)".
4. **Ranking:**
   - If **Text/General**: Recommend Llama-3.x or Qwen2.5.
   - If **Vision**: Recommend Llama-3.2-Vision.
   - If **Coding**: Recommend Qwen2.5-Coder.
5. **Presentation:** Provide a numbered list with:
   - Name & Size
   - Why it fits the hardware
   - Why it fits the intent

## Skill 2: Ollama Deployment
When the user selects Ollama as the target backend:
1. Search Hugging Face or the Ollama registry for the best-matched model tag based on `rules.md`.
2. Check if the Ollama daemon is running. If not, trigger it or alert the user.
3. Execute the installation command:
   ```bash
   ollama run <selected_model_tag>
   ```

4. Perform a quick verification ping to ensure the model responds via CLI.

## Skill 3: LM Studio Deployment

When the user selects LM Studio as the target backend:

1. Search Hugging Face specifically for compatible `.gguf` files.
2. Select the optimal quant filename (defaulting to `*Q4_K_M.gguf`).
3. Download the file into the standard LM Studio local cache directory:
* **Path:** `$HOME/.cache/lm-studio/models/<publisher>/<model_name>/`


4. Print a user-facing notification: *"Download complete. Please open LM Studio and select <model_name> from the top menu."*
