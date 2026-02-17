#!/usr/bin/env bash
# bash scripts/gen_demonstration_pnpp.sh 10

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../../../../" && pwd)"

num_episodes="${1:-10}"
root_dir="${REPO_ROOT}/compute/src/compute/models/dp3/3D-Diffusion-Policy/data/"
cam_id="${CAM_ID:-cam1}"

uv run --project "${REPO_ROOT}/compute" \
  python "${REPO_ROOT}/compute/src/compute/data_loader/gen_deonstration_expert.py" \
  --num_episodes "${num_episodes}" \
  --root_dir "${root_dir}" \
  --cam_id "${cam_id}" \
  --shape "sphere" \
  --num_points 1024
