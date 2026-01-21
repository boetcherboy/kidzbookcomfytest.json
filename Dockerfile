# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail comfyui_zenid@1.0.0 --mode remote

# download models into comfyui
RUN comfy model download --url https://huggingface.co/OreX/ControlNet/resolve/main/control_instant_id_sdxl.safetensors --relative-path models/controlnet --filename control_instant_id_sdxl.safetensors
RUN comfy model download --url https://huggingface.co/SlooshStic/ip-adapter-instant-id-sdxl/resolve/main/ip-adapter.bin --relative-path models/ipadapter --filename ip-adapter_instant_id_sdxl.bin
RUN comfy model download --url https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors --relative-path models/checkpoints --filename sd_xl_base_1.0.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
