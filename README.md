# 🌐 ravn-webapps

Lanzadores universales de aplicaciones web (`.desktop`), iconos normalizados en estándar XDG hicolor y ejecutor de runtime agnóstico (`ravn-launch-webapp`) para la estación de trabajo **RaVN** sobre Arch Linux.

---

## 🎯 Propósito

Este repositorio desacopla completamente las aplicaciones web del fork de Omarchy y de dotfiles locales de usuario:
1. **Disponibilidad Multiusuario:** Se instalan en `/usr/share/applications/` y `/usr/share/icons/`, quedando inmediatamente visibles para cualquier usuario del sistema (`omarchy`, `niri`, `nyxuri`, etc.).
2. **Independencia de Upstream:** Al extraerse de `fo-omarchy`, se eliminan de raíz los conflictos de `git rebase` contra upstream (`quattro`).
3. **Lanzador Agnóstico (`ravn-launch-webapp`):** Detecta automáticamente el navegador Chromium instalado (`google-chrome`, `brave`, `edge`, `chromium`) y ejecuta en modo app (`--app=<url>`) con soporte de aislamiento de cgroups en Wayland vía `uwsm-app`.

---

## 📦 Instalación

### Vía Pacman (Recomendado)
Distribuido mediante el repositorio personal de pacman:
```bash
sudo pacman -S ravn-webapps
```

### Desde el Código Fuente
```bash
make install DESTDIR=/
```

---

## 📄 Licencia

MIT License — Roberto Flores.
