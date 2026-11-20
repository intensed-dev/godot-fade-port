# FADE Port — Development Notes

## Project identity

**godot-fade-port is the official Godot port of FADE by Frokyte Games, made by
the same creators at Frokyte Central.**

FADE Engine itself is proprietary. This repository is not a publication of the
engine's source code and does not attempt to reproduce or redistribute its
proprietary implementation. It is a Godot addon and editor theme that brings
selected FADE design language and workflows into the Godot editor.

The goal is to make Godot feel a little more like FADE while remaining a native
Godot project addon that users can install without replacing their engine.

## Implemented

- Added the Godot editor addon at `addons/fade_editor/`.
- Registered a custom `EditorInspectorPlugin` for `Node3D` objects.
- Added a three-column XYZ editor for `position`, `rotation_degrees`, and
  `scale`, with field dimensions that preserve Godot default typography.
- Added red, green, and blue axis labels.
- Reworked the editor theme around Unreal Engine's dark charcoal surfaces,
  blue selection accents, and clearer panel separation.
- Set Roboto as the preferred system font while leaving all font sizes at
  Godot defaults. Systems without Roboto installed use Godot/system fallback fonts.
- Added editor-shell style overrides through Godot's `EditorStyles` theme type,
  alongside the regular Control theme types.
- Added a GitHub Actions release workflow. The user has confirmed that the
  workflow succeeds and that the downloaded addon and theme were installed and
  tested in a separate project.

## Design direction

The Unreal Engine editor is the primary visual reference. The port should
translate its design language into Godot rather than imitate every pixel:

- Charcoal surfaces with subtle elevation differences.
- Thin borders and clear separation between docked panels.
- Blue active, focused, and selected states.
- Roboto as the preferred typeface while preserving Godot default font sizes.
- Compact controls with enough height and spacing to remain legible.
- A clearer hierarchy in the Inspector and Scene Tree.

The custom theme is an override layer on top of Godot's editor theme. Some
editor areas may still use built-in or editor-specific drawing paths and need
separate investigation.

## Release package layout

The release archive is deliberately structured for direct installation:

```text
FADE-Godot-vX.Y.Z.zip
└── fade_editor/
    ├── plugin.cfg
    ├── plugin.gd
    ├── inspector/
    └── themes/
        └── fade-dark.tres
```

Users extract the archive and move the resulting `fade_editor` folder directly
into their Godot project's `res://addons/` directory. The final project path
must be `res://addons/fade_editor/plugin.cfg`.

The theme ships inside the same folder as the addon so the release is a single,
self-contained download. The repository's `addons/` folder is the source of
truth for the release package.

## Known limitations

- The theme cannot freely rearrange Godot's dock layout or replace the viewport.
- Some editor-specific controls may not inherit standard Control theme items.
- Editor menus, toolbars, scene tree rows, filesystem entries, and inspector
  sections still need screenshot-based comparison against the Unreal reference.
- The theme must be tested at different editor scaling settings and on different
  display densities.
- No automated visual regression test currently exists.

## Next steps

1. Validate the redesigned theme in Godot 4.6.x.
2. Capture before/after screenshots at the same editor scale and window size.
3. Inspect the main toolbar, scene tree, FileSystem, Inspector, tabs, menus, and
   bottom panel against the Unreal reference images.
4. Add dedicated theme items only where the screenshot comparison shows a real
   gap.
5. Add custom Inspector section headers and property layouts where native
   controls cannot achieve the desired hierarchy.
6. Add a small demo project and visual regression screenshots.
7. Publish a new tagged release after the redesigned theme has been tested.

## Installation

1. Copy the `addons/fade_editor` directory into your Godot project's
   `res://addons/` directory.
2. Open **Project → Project Settings → Plugins**.
3. Enable **FADE Editor**.
4. Open **Editor → Editor Settings → Interface → Theme** and select
   `res://addons/fade_editor/themes/fade-dark.tres` as the custom editor theme.

The editor theme is separate from the project runtime theme.

## Validation status

The previous release workflow, addon installation, and theme selection have
been confirmed by the project maintainer in a separate test project. The
redesigned theme in this branch still requires validation in a running Godot
4.6.x editor. Do not mark the redesign as tested until that check is complete.
