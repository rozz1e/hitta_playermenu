Config = {}

Config.Key = 'F1' -- key to open player menu
Config.Hud = true -- enable or disable hud ui (if false hudMenu will be useless)

Config.Menu = { -- enable or disable certain menus
    fpsMenu = true,
    hudMenu = true,
    supportMenu = true,
    playersMenu = true
}

Config.Watermark = {
    enabled = true, -- should there be a watermark?
    text = 'INSERT_TEXT', -- watermark text
    outline = false, -- should the text have a black outline?
    font = 4, -- text font
    colour = {r = 255, g = 255, b = 255, a = 255}, -- text colour
    scale = {x = 0.4, y = 0.4}, -- text scale
    pos = {x = 0.005, y = 0.001} -- text position
}

Config.Support = {
    bug = 'INSERT_WEBHOOK', -- discord webhook to send bug reports
    player = 'INSERT_WEBHOOK' -- discord webhook to send player reports
}