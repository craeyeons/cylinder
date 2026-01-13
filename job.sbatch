#!/bin/bash
#SBATCH --job-name=pinn_gpu
#SBATCH --partition=gpu-long
#SBATCH --gres="gpu:h100-96:1"
#SBATCH --time=24:00:00
#SBATCH --mem=16G
#SBATCH --cpus-per-task=4
#SBATCH --output=slurm_%j.out
#SBATCH --error=slurm_%j.err

# --- Safety & diagnostics ---
set -e
echo "Job started on $(hostname)"
echo "Time: $(date)"

# --- Activate virtual environment ---
source ~/cylinder/.venv/bin/activate

# --- Verify GPU availability ---
nvidia-smi

# --- Run your program ---
python main.py

echo "Job finished at $(date)"