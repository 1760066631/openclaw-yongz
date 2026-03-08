# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Cameras

- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH

- home-server → 192.168.1.100, user: admin

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

### Node / Vue CLI

- 这台机器上 `vue ui` 在 `nvm use 14` 时可用。
- 切到 `node v25.2.1` 后，当前环境里没有全局 `@vue/cli`，会出现 `zsh: command not found: vue`。
- 遇到 `vue ui` 启动不了时，优先检查 `node -v` / `nvm current`，再判断是不是切换 Node 版本导致全局 CLI 丢失。

Add whatever helps you do your job. This is your cheat sheet.
