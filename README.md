# Rules of the Moment

A top-down arcade survival game where the rules of play change every 7-9 seconds with increasing difficulty.

## Game Overview

Top-down arcade survival. The rules of play change every 7–9 seconds (inverted controls, ice, gravity drift, constant motion, frozen enemies, deadly walls, screen wrap). A 3-second warning shows the next rule. Five levels, each a survive-N-seconds goal, plus Endless mode. Controls: move (WASD/arrows/left stick), dash (Space/Shift/A), pause (P/Esc). A narrator called **the Clerk** announces each rule change in one short line.

## Theme

Everything is temporary

## Core Gameplay

- Five levels with increasing difficulty
- Rules change approximately every 7–9 seconds 
- 3-second warning shows upcoming rule
- Various rules with gameplay modifiers:
  * NORMAL - Standard conditions
  * INVERTED - Controls inverted  
  * SLIPPERY - Low friction
  * GRAVITY UP - Gravity direction reversed
  * CAN'T STOP - Player can't stop moving
  * ENEMIES FROZEN - Enemies frozen in place
  * WALLS KILL - Edges kill player
  * WRAP AROUND - Player wraps around screen edges

## Controls

- **Move**: WASD or Arrow Keys
- **Dash**: Space, Shift, or A  
- **Pause**: P or Escape
- **Restart**: Space when game over
- **Fullscreen**: F11

## Build Instructions

### Requirements

- C99 compiler (GCC)
- raylib 5.x development libraries
- X11 development libraries (for graphics)

### Building

```bash
make clean
make
```

The executable will be created at `build/rotm`

### Running

```bash
./build/rotm
```

## Game State

- **Menu**: Start game and access settings
- **Playing**: Active gameplay 
- **Paused**: Game paused by player
- **Ending**: Player defeated or completed level  

## Systems Implemented (M1)

✅ Playable raylib window  
✅ Player movement with WASD/arrow keys  
✅ Arena boundary collisions  
✅ Enemy systems  
✅ Collision detection and death  
✅ Restart functionality  
✅ Basic HUD elements  
✅ Game state management  
✅ Pause functionality  
✅ Deterministic seed support  

## Known Limitations

This is the M1 implementation. Full features including:
- Audio system (M2) 
- Cutscene system (M3)
- All 9 scenes (S01-S09)
- Endings (S07, S08A, S08B)
- True ending persistence
- Rule stacking
- Telemetry
- Bot testing  

Are still being implemented in subsequent milestones.

## License

This project is licensed under the MIT License - see the LICENSE file for details.