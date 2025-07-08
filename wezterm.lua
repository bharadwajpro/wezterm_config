local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.font = wezterm.font("JetBrainsMonoNL Nerd Font Mono")
config.font_size = 24
config.color_scheme = "tokyonight"

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.enable_scroll_bar = true
config.native_macos_fullscreen_mode = true

config.keys = {
	{
		key = "d",
		mods = "CMD",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "D",
		mods = "CMD|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "CMD",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "R",
		mods = "CMD|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = act.callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "F",
		mods = "CMD|SHIFT",
		action = act.ToggleFullScreen,
	},
	{
		key = "LeftArrow",
		mods = "CMD|SHIFT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CMD|SHIFT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CMD|SHIFT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CMD|SHIFT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "H",
		mods = "CMD|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "CMD|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "K",
		mods = "CMD|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "L",
		mods = "CMD|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "X",
		mods = "CMD|SHIFT",
		action = act.ActivateCopyMode,
	},
	{
		key = "Z",
		mods = "CMD|SHIFT",
		action = act.TogglePaneZoomState,
	},
}

return config
