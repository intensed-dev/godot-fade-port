# godot-fade-port

**The official Godot port of FADE by Frokyte Games, made by the same creators
at Frokyte Central.**

FADE Engine itself is proprietary. This repository is a Godot addon and editor
theme that brings selected FADE styling and workflow ideas into Godot. It does
not distribute FADE Engine source code.

## Current status

Early development prototype:
- Godot editor addon
- Custom XYZ inspector fields for selected `Node3D` transform properties
- Unreal-inspired dark editor theme redesign with Roboto typography and Godot-default font sizing (work in progress)
- GitHub Actions workflow for packaging tagged releases

## Install

1. Download the ZIP attached to a GitHub Release.
2. Extract it. The archive contains a `fade_editor/` folder at its root.
3. Move that folder directly into your Godot project's `res://addons/`
   directory.
4. Enable **FADE Editor** under **Project → Project Settings → Plugins**.

The resulting path should be
`res://addons/fade_editor/plugin.cfg`.

The theme is included in the same addon folder at
`res://addons/fade_editor/themes/fade-dark.tres`. To use it as the editor's
custom theme, select it under **Editor → Editor Settings → Interface → Theme**.
It is still an early theme and does not yet restyle every editor panel.

## Development

See [DEVELOPMENT.md](DEVELOPMENT.md) for the project identity, implementation
status, release packaging structure, known gaps, and roadmap.
