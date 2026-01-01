# Flappy Bird Clone - Setup Instructions

## Prerequisites
- Install Godot Engine 4.x from https://godotengine.org/download

## Setup Steps

1. **Open Godot and import this project**
   - Open Godot Project Manager
   - Click "Import"
   - Browse to this directory and select the `project.godot` file
   - Select Vulkan renderer for best compatibility
   - Click "Import & Open"

2. **Setup in Godot**
   - Go to Project → Project Settings → General → AutoLoad
   - Add `scripts/game_manager.gd` as autoload with name "GameManager"

4. **Configure Main Scene**
   - Go to Project → Project Settings → Application → Run
   - Set Main Scene to `scenes/main.tscn`

5. **Run the game**
   - Click Play (F5) or click the play button in the top right

## Controls
- **Space or Click**: Make the bird jump
- Game automatically scrolls and generates pipes
- Try to pass through the gaps without hitting the pipes!

## Customization

### Adjust Difficulty
Edit `scripts/pipe.gd`:
- `spawn_interval`: Time between pipes (lower = harder)
- `pipe_gap`: Size of gap between pipes (smaller = harder)

Edit `scripts/player.gd`:
- `gravity`: How fast the bird falls
- `jump_force`: How high the bird jumps

### Colors & Appearance
- Edit scene files (.tscn) in Godot editor to change colors
- Add sprites by importing images and assigning them to ColorRect nodes

## Game Features
✓ Realistic physics with gravity and jumping
✓ Random pipe generation
✓ Score tracking
✓ High score saving
✓ Game over detection
✓ Smooth animations

Enjoy your Flappy Bird clone!
