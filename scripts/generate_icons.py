#!/usr/bin/env python3
"""
Genera y normaliza los iconos hicolor a partir de los archivos en icons/src/.
"""
import os, glob, re, shutil, subprocess

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC_DIR = os.path.join(REPO_ROOT, "icons", "src")
DST_256 = os.path.join(REPO_ROOT, "icons", "hicolor", "256x256", "apps")
DST_48 = os.path.join(REPO_ROOT, "icons", "hicolor", "48x48", "apps")
DST_SCALABLE = os.path.join(REPO_ROOT, "icons", "hicolor", "scalable", "apps")

os.makedirs(DST_256, exist_ok=True)
os.makedirs(DST_48, exist_ok=True)
os.makedirs(DST_SCALABLE, exist_ok=True)

for icon in glob.glob(f"{SRC_DIR}/*"):
    fname = os.path.basename(icon)
    base, ext = os.path.splitext(fname)
    icon_id = re.sub(r"[^a-zA-Z0-9]+", "-", base).lower().strip("-")
    if ext.lower() == ".svg":
        shutil.copy2(icon, os.path.join(DST_SCALABLE, f"{icon_id}.svg"))
    else:
        cmd256 = ["magick", icon, "-thumbnail", "256x256", "-background", "transparent", "-gravity", "center", "-extent", "256x256", f"PNG32:{DST_256}/{icon_id}.png"]
        subprocess.run(cmd256, check=True)
        cmd48 = ["magick", icon, "-thumbnail", "48x48", "-background", "transparent", "-gravity", "center", "-extent", "48x48", f"PNG32:{DST_48}/{icon_id}.png"]
        subprocess.run(cmd48, check=True)

print("Icons normalized successfully.")
