-- A slightly altered version of catppucchin nord
local nord = {
    rosewater = "#f5e0dc",
    flamingo = "#f2cdcd",
    pink = "#f5c2e7",
    mauve = "#cba6f7",
    maroon = "#eba0ac",
    peach = "#D08770",
    teal = "#8FBCBB",
    sky = "#89dceb",
    sapphire = "#74c7ec",
    lavender = "#b4befe",
    text = "#D8DEE9",
    subtext1 = "#bac2de",
    subtext0 = "#a6adc8",
    overlay2 = "#9399b2",
    overlay1 = "#7f849c",
    overlay0 = "#616E88",
    surface2 = "#4C566A",
    surface1 = "#434C5E",
    surface0 = "#3B4252",
    base = "#2E3440",
    mantle = "#181825",
    crust = "#11111b",
    black = "#3B4252",
    red = "#BF616A",
    green = "#A3BE8C",
    yellow = "#EBCB8B",
    blue = "#81A1C1",
    magenta = "#B48EAD",
    cyan = "#88C0D0",
    white = "#E5E9F0",
}

local colorscheme = {
    foreground = nord.text,
    background = nord.base,
    cursor_bg = nord.rosewater,
    cursor_border = nord.rosewater,
    cursor_fg = nord.crust,
    selection_bg = nord.surface2,
    selection_fg = nord.text,
    ansi = {
        "#3b4252", -- black
        "#bf616a", -- red
        "#a3be8c", -- green
        "#ebcb8b", -- yellow
        "#81a1c1", -- blue
        "#b48ead", -- magenta/purple
        "#88c0d0", -- cyan
        "#e5e9f0", -- white
    },
    brights = {
        "#4c566a", -- black
        "#bf616a", -- red
        "#a3be8c", -- green
        "#ebcb8b", -- yellow
        "#81a1c1", -- blue
        "#b48ead", -- magenta/purple
        "#8fbcbb", -- cyan
        "#eceff4", -- white
    },
    tab_bar = {
        background = "rgba(0, 0, 0, 0.4)",
        active_tab = {
            bg_color = nord.surface2,
            fg_color = nord.text,
        },
        inactive_tab = {
            bg_color = nord.surface0,
            fg_color = nord.subtext1,
        },
        inactive_tab_hover = {
            bg_color = nord.surface0,
            fg_color = nord.text,
        },
        new_tab = {
            bg_color = nord.base,
            fg_color = nord.text,
        },
        new_tab_hover = {
            bg_color = nord.mantle,
            fg_color = nord.text,
            italic = true,
        },
    },
    visual_bell = nord.surface0,
    indexed = {
        [16] = nord.peach,
        [17] = nord.rosewater,
    },
    scrollbar_thumb = nord.surface2,
    split = nord.overlay0,
    compose_cursor = nord.flamingo, -- nightbuild only
}

return colorscheme
