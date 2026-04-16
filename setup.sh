#!/bin/bash
set -e

echo "→ Installing openclaw..."
npm install -g openclaw

echo "→ Linking config..."
mkdir -p ~/.openclaw
ln -sf "$HOME/dotfiles/openclaw/openclaw.json" ~/.openclaw/openclaw.json

echo "→ Creating .env from example..."
cp "$HOME/dotfiles/openclaw/.env.example" ~/.openclaw/.env
echo "Fill in ~/.openclaw/.env with real values, then press enter to continue..."
read -r

echo "→ Loading secrets..."
set -a && source ~/.openclaw/.env && set +a

echo "→ Adding to shell profile..."
echo 'set -a && source ~/.openclaw/.env && set +a' >> ~/.bashrc

echo "→ Validating..."
openclaw doctor --fix

echo "→ Starting gateway..."
openclaw gateway start

echo "→ Linking workspace files..."
mkdir -p ~/.openclaw/workspace
for f in AGENTS.md SOUL.md USER.md TOOLS.md HEARTBEAT.md; do
  if [ -f "$HOME/dotfiles/openclaw/workspace/$f" ]; then
    ln -sf "$HOME/dotfiles/openclaw/workspace/$f" "$HOME/.openclaw/workspace/$f"
  fi
done

echo "Done."
