local wezterm = require("wezterm")
local platform = require("utils.platform")()
local backdrops = require("utils.backdrops")
local act = wezterm.action

local mod = {}

if platform.is_mac then
    mod.SUPER = "SUPER"
    mod.SUPER_REV = "SUPER|CTRL"
elseif platform.is_win then
    mod.SUPER = "CTRL"
    mod.SUPER_REV = "CTRL|ALT"
elseif platform.is_linux then
    mod.SUPER = "CTRL"
    mod.SUPER_REV = "CTRL|ALT"
end

local keys = {
    -- misc/useful --
    { key = "F2", mods = "NONE", action = act.ActivateCommandPalette },
    { key = "F3", mods = "NONE", action = act.ShowLauncher },
    { key = "F4", mods = "NONE", action = act.ShowLauncherArgs({ flags = "FUZZY|TABS" }) },
    {
        key = "F5",
        mods = "NONE",
        action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
    },
    -- toggle fullscreen
    { key = "F11", mods = mod.SUPER, action = act.ToggleFullScreen },
    { key = "F12", mods = mod.SUPER, action = act.ShowDebugOverlay },
    { key = "f", mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = "" }) },
    {
        key = "u",
        mods = mod.SUPER,
        action = wezterm.action.QuickSelectArgs({
            label = "open url",
            patterns = {
                "https?://\\S+",
            },
            action = wezterm.action_callback(function(window, pane)
                local url = window:get_selection_text_for_pane(pane)
                wezterm.log_info("opening: " .. url)
                wezterm.open_with(url)
            end),
        }),
    },

    -- copy/paste --
    { key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
    { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },

    -- tabs --
    -- tabs: spawn+close
    { key = "t", mods = mod.SUPER, action = act.SpawnTab("DefaultDomain") },
    { key = "q", mods = mod.SUPER_REV, action = act.CloseCurrentTab({ confirm = false }) },

    -- tabs: navigation
    { key = "[", mods = mod.SUPER, action = act.ActivateTabRelative(-1) },
    { key = "]", mods = mod.SUPER, action = act.ActivateTabRelative(1) },
    { key = "PageUp", mods = mod.SUPER, action = act.ActivateTabRelative(-1) },
    { key = "PageDown", mods = mod.SUPER, action = act.ActivateTabRelative(1) },
    { key = "[", mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
    { key = "]", mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },

    -- window --
    -- spawn windows
    { key = "n", mods = mod.SUPER_REV, action = act.SpawnWindow },

    -- background controls --
    {
        key = "r",
        mods = mod.SUPER,
        action = wezterm.action_callback(function(window, _pane)
            backdrops:random(window)
        end),
    },
    {
        key = [[,]],
        mods = mod.SUPER,
        action = wezterm.action_callback(function(window, _pane)
            backdrops:cycle_back(window)
        end),
    },
    {
        key = [[.]],
        mods = mod.SUPER,
        action = wezterm.action_callback(function(window, _pane)
            backdrops:cycle_forward(window)
        end),
    },

    -- panes --
    -- panes: split panes
    {
        key = [[/]],
        mods = mod.SUPER_REV,
        action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
        key = [[\]],
        mods = mod.SUPER_REV,
        action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },

    -- panes: zoom+close pane
    { key = "Enter", mods = mod.SUPER, action = act.TogglePaneZoomState },
    { key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = false }) },

    -- panes: navigation
    {
        key = "p",
        mods = mod.SUPER,
        action = act.PaneSelect({ alphabet = "1234567890", mode = "Activate" }),
    },

    -- resize panes
    {
        key = "p",
        mods = mod.SUPER_REV,
        action = act.ActivateKeyTable({
            name = "resize_pane",
            one_shot = false,
            timemout_miliseconds = 1000,
        }),
    },
}

local key_tables = {
    resize_pane = {
        { key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
        { key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
        { key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
        { key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
        { key = "Escape", action = "PopKeyTable" },
        { key = "q", action = "PopKeyTable" },
    },
}

local mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = mod.SUPER,
        action = act.OpenLinkAtMouseCursor,
    },
}

return {
    disable_default_key_bindings = true,
    keys = keys,
    key_tables = key_tables,
    mouse_bindings = mouse_bindings,
}
