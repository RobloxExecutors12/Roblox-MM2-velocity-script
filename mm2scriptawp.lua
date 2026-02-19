
require("zxcmodule")
ded.Write = nil
ded.Read = nil

local ultimate                          = {}
local me          			            = LocalPlayer()



local MetaPlayer                        = FindMetaTable("Player")

local TraceHull                         = util.TraceHull    
local TraceLine                         = util.TraceLine









surface.CreateFont( "veranda", { font = "Verdana", size = 12, antialias = true, outline = false } )
surface.CreateFont( "veranda_s", { font = "Verdana", size = 12, antialias = false, shadow = true } )
surface.CreateFont( "veranda_scr", { font = "Verdana", size = ScreenScale( 9 ), antialias = false, outline = true } )
-- Logo fonts for glowing title
surface.CreateFont( "logo_glow", { font = "Verdana", size = ScreenScale( 14 ), weight = 900, antialias = true } )
surface.CreateFont( "logo_main", { font = "Verdana", size = ScreenScale( 14 ), weight = 900, antialias = true } )
-- Clean logo font (no glow)
surface.CreateFont( "logo_clean", { font = "Open Sans", size = ScreenScale( 12 ), weight = 800, antialias = true } )
-- Nickname font (slightly larger)
surface.CreateFont( "nick_font", { font = "Verdana", size = 16, weight = 600, antialias = true } )

surface.CreateFont( "saddamhussein", { font = "Open Sans", size = 64, weight = 1000 } )

ultimate.Colors = {}

for i = 0,255 do  
    ultimate.Colors[i] = Color( i, i, i )
end



ultimate.Colors["Red"] = Color( 255, 0, 0, 255 )

ultimate.accent = Color( 255, 255, 255 )
function GradientFill(x, y, w, h, color1, color2, horizontal)
    local r1, g1, b1, a1 = color1.r, color1.g, color1.b, color1.a
    local r2, g2, b2, a2 = color2.r, color2.g, color2.b, color2.a
    for i = 0, (horizontal and w or h) do
        local t = i / (horizontal and w or h)
        local r = r1 + (r2 - r1) * t
        local g = g1 + (g2 - g1) * t
        local b = b1 + (b2 - b1) * t
        local a = a1 + (a2 - a1) * t
        surface.SetDrawColor(r, g, b, a)
        if horizontal then
            surface.DrawLine(x + i, y, x + i, y + h)
        else
            surface.DrawLine(x, y + i, x + w, y + i)
        end
    end
end













local theme = {
    ["Frame background"] = Color( 31, 31, 31 ),
    ["Frame foreground"] = Color( 45, 45, 45 ),
    ["Frame title"] = Color( 150, 150, 150 ),
}

local pLocalPlayer = LocalPlayer()

local screenWidth = ScrW()
local screenHeight = ScrH()

local traceResult = {}
local traceStruct = { output = traceResult }

local flTickInterval = engine.TickInterval()

surface.CreateFont( "DermaSmall", {	
    font = "Arial", 
    antialias = true,
    size = 17
} )










ultimate.cached = {}

ultimate.Materials = {}


ultimate.Materials["Gradient"] = Material("gui/gradient_up", "noclamp smooth")
ultimate.Materials["Gradient down"] = Material("gui/gradient_down", "noclamp smooth")
ultimate.Materials["Gradient right"] = Material("gui/gradient", "noclamp smooth")
ultimate.Materials["Alpha grid"] = Material("gui/alpha_grid.png", "noclamp smooth")
ultimate.Materials["Blur"] = Material("pp/blurscreen")
ultimate.blur = Material("pp/blurscreen")


ultimate.presets = {}
ultimate.cfg = { vars = {}, binds = {}, colors = {} }

ultimate.cfg.vars["Enable aimbot"]              = false
ultimate.cfg.binds["Aim on key"]                = 0

ultimate.cfg.vars["Silent aim"]                 = true
ultimate.cfg.vars["pSilent"]                    = false

ultimate.cfg.vars["Auto reload"]                = false
ultimate.cfg.vars["Auto fire"]                  = false
ultimate.cfg.vars["Rapid fire"]                 = false
ultimate.cfg.vars["Alt Rapid fire"]             = false
ultimate.cfg.vars["Bullet time"]                = false

ultimate.cfg.vars["Nospread"]                   = false
ultimate.cfg.vars["Force seed"]                 = false
ultimate.cfg.vars["Wait for seed"]              = false
ultimate.cfg.vars["Norecoil"]                   = false
ultimate.cfg.vars["Try Predict"]                = false

ultimate.cfg.vars["Extrapolation"]              = false
ultimate.cfg.vars["last update"]                = false
ultimate.cfg.vars["TPOSE"]                      = false
ultimate.cfg.vars["Bone fix"]                   = false
ultimate.cfg.vars["Update Client Anim fix"]     = false
ultimate.cfg.vars["Wait for simulation"]    = false
ultimate.cfg.vars["Disable interpolation"]      = true
ultimate.cfg.vars["Disable Sequence interpolation"] = false

ultimate.cfg.vars["Target selection"]           = 2 
ultimate.cfg.vars["Ignores-Friends"]            = false
ultimate.cfg.vars["Enable Priority List"]       = false
ultimate.cfg.vars["Ignores-Steam friends"]      = false
ultimate.cfg.vars["Ignores-Teammates"]          = false
ultimate.cfg.vars["Ignores-Admins"]             = false
ultimate.cfg.vars["Ignores-Bots"]               = false
ultimate.cfg.vars["Ignores-Frozen"]             = false
ultimate.cfg.vars["Ignores-Nodraw"]             = false
ultimate.cfg.vars["Ignores-Nocliping"]          = false
ultimate.cfg.vars["Ignores-God time"]           = false
ultimate.cfg.vars["Ignores-Head unhitable"]     = false
ultimate.cfg.vars["Ignores-Driver"]             = false
ultimate.cfg.vars["Wallz"]                      = false

ultimate.cfg.vars["Max targets"]                = 0
ultimate.cfg.vars["Max distance"]               = 50000

ultimate.cfg.vars["Hitbox selection"]           = 1
ultimate.cfg.vars["Hitscan"]                    = false
ultimate.cfg.vars["Hitscan groups-Head"]        = false
ultimate.cfg.vars["Hitscan groups-Chest"]       = false
ultimate.cfg.vars["Hitscan groups-Stomach"]     = false
ultimate.cfg.vars["Hitscan groups-Arms"]        = false
ultimate.cfg.vars["Hitscan groups-Legs"]        = false
ultimate.cfg.vars["Hitscan groups-Generic"]     = false
ultimate.cfg.vars["Hitscan mode"]               = 1
ultimate.cfg.vars["Multipoint"]                 = false
ultimate.cfg.vars["Multipoint scale min"]           = 0.5
ultimate.cfg.vars["Multipoint scale max"]           = 0.8
ultimate.cfg.vars["Multipoint groups-Head"]     = false
ultimate.cfg.vars["Multipoint groups-Chest"]    = false
ultimate.cfg.vars["Multipoint groups-Stomach"]  = false
ultimate.cfg.vars["Multipoint groups-Arms"]     = false
ultimate.cfg.vars["Multipoint groups-Legs"]     = false
ultimate.cfg.vars["Multipoint groups-Generic"]  = false

ultimate.cfg.vars["Adjust tickcount"]           = false
ultimate.cfg.vars["Gun switch"]                 = false
ultimate.cfg.vars["Auto detonator"]             = false
ultimate.cfg.vars["AutoD distance"]             = 96

ultimate.cfg.vars["Backtrack"]                  = false
ultimate.cfg.vars["Always backtrack"]           = false
ultimate.cfg.vars["Backtrack mode"]             = 1
ultimate.cfg.vars["Sampling interval"]          = 0
ultimate.cfg.vars["Backtrack time"]             = 200

ultimate.cfg.vars["Aimbot smoothing"]           = false
ultimate.cfg.vars["Smoothing"]                  = 0.05

ultimate.cfg.vars["Fov limit"]                  = false
ultimate.cfg.vars["Fov dynamic"]                = false
ultimate.cfg.vars["Aimbot FOV"]                 = 30
ultimate.cfg.vars["Show FOV"]                   = false
ultimate.cfg.colors["Show FOV"]                 = "255 255 0 255"

ultimate.cfg.vars["FOV Rainbow"]                = false
ultimate.cfg.vars["Snapline Rainbow"]           = false

ultimate.cfg.vars["Aimbot snapline"]                   = false
ultimate.cfg.colors["Aimbot snapline"]                 = "255 128 0 255"
ultimate.cfg.vars["Aimbot marker"]                   = false
ultimate.cfg.colors["Aimbot marker"]                 = "255 255 255 255"

ultimate.cfg.vars["Box Wall"]   = false
ultimate.cfg.vars["Kill effect"]   = false
ultimate.cfg.vars.localkillfeed   = false
ultimate.cfg.vars["HitLog"]  = false



ultimate.cfg.vars["Trigger bot"]                = false
ultimate.cfg.binds["Trigger bot"]               = 0

ultimate.cfg.vars["Crossbow prediction"]        = false

ultimate.cfg.vars["Simulation limit"]           = 4

ultimate.cfg.vars["Baim low health"]            = false
ultimate.cfg.vars["Baim health"]                = 65

ultimate.cfg.vars["Auto Heal"]             = false

ultimate.cfg.vars["Knifebot"]                   = false
ultimate.cfg.vars["Knifebot mode"]              = 1
ultimate.presets["Knifebot mode"] = { "Damage", "Fast", "Fatal" }

ultimate.cfg.vars["Knifebot Range"]             = false
ultimate.cfg.colors["Knifebot Range Color"]     = "255 255 255"

ultimate.cfg.vars["Facestab"]                   = false

ultimate.cfg.vars["SMG Grenade"]        = false
ultimate.cfg.vars["AR2 Predict"] = false
ultimate.cfg.vars["Custom predict"] = false
ultimate.cfg.vars["Custom predict strength"] = 1.0
ultimate.cfg.vars["Custom predict mode"] = 1 -- 1 = velocity, 2 = acceleration, 3 = hybrid
ultimate.cfg.vars["Custom predict gravity"] = true
ultimate.cfg.vars["Custom predict debug"] = false
-- Я ебал эти все предикты










// Resolver 

ultimate.cfg.vars["Resolver mode"] = 1
ultimate.presets["Resolver mode"] = { "Basic", "Advanced", "Full", "Jitter" }
ultimate.cfg.vars["Yaw mode"] = 1
ultimate.cfg.vars["Pitch resolver"] = false
ultimate.cfg.vars["Taunt resolver"] = false




ultimate.cfg.vars["Invert first shot"] = false
ultimate.cfg.vars["Resolver max misses"] = 2


// Tickbase 
ultimate.cfg.vars["Tickbase shift"] = false
ultimate.cfg.vars["Wait for unlag"] = false

ultimate.cfg.vars["Fakelag comp"] = 2
ultimate.cfg.vars["LagCompensation"] = false


ultimate.cfg.vars["Skip fire tick"] = false
ultimate.cfg.vars["Double tap"] = false
ultimate.cfg.vars["Dodge projectiles"] = false
ultimate.cfg.vars["Passive recharge"] = false

ultimate.cfg.vars["Auto recharge"] = false
ultimate.cfg.vars["Wait for charge"] = false
ultimate.cfg.vars["Warp on peek"] = false

ultimate.cfg.vars["Charge ticks"] = 48
ultimate.cfg.vars["Shift ticks"] = 48
ultimate.cfg.binds["Tickbase shift"] = 0
ultimate.cfg.binds["Auto recharge"] = 0


ultimate.cfg.vars["Anti aim"]                   = false
ultimate.cfg.vars["Yaw randomisation"]          = false


ultimate.cfg.vars["Custom real"]                = 75
ultimate.cfg.vars["Custom fake"]                = 180
ultimate.cfg.vars["Custom pitch"]               = 89
ultimate.cfg.vars["Spin speed"]                 = 30
ultimate.cfg.vars["LBY min delta"]              = 100
ultimate.cfg.vars["LBY break delta"]            = 120
ultimate.cfg.vars["Sin delta"]                  = 89
ultimate.cfg.vars["Sin add"]                    = 11
ultimate.cfg.vars["Jitter delta"]               = 45


ultimate.cfg.vars["Yaw base"]                   = 1
ultimate.presets["Yaw base"] = { "Viewangles", "At targets" }
ultimate.cfg.vars["Yaw"]                        = 1
ultimate.presets["Yaw"] = { 
    "Backward", "Fake Forward", "Legit Delta",
    "Sideways", "Half Sideways",
    "Fake Spin", "LBY", "LBY Breaker",
    "Sin Sway", "Pendulum Sway", "Lag Sway",
    "Fake Jitter", "Kappa Jitter", "Abu Jitter",
    "Satanic Spin", "Custom",
    "Spinbot", "Randomizer", "Side jitter"
}
ultimate.cfg.vars["Pitch"]                      = 1
ultimate.presets["Pitch"] = { 
    "Down", "Up", "Zero", 
    "Fake down", "Fake fake down", 
    "Fake jitter","Fake down break", "Kizaru", 
    "Fake zero", "Fake Up jitter",
    "Up jitter", "Flicker +Up", "Fucker Flicker +Up",
    "Legit", "Random pitch", "Pitch desync", "Custom"
}
ultimate.cfg.vars["Edge"]                       = 1

ultimate.cfg.binds["Anti aim"]                   = 0






ultimate.cfg.vars["Antiaim material"] = 1
ultimate.cfg.vars["Antiaim fullbright"] = false
ultimate.cfg.colors["Real chams"] = "128 128 255 255"

// Anim breakers 


ultimate.cfg.vars["Taunt spam 1"] = false
ultimate.cfg.vars["Taunt 1"] = 1
ultimate.cfg.vars["Taunt 1 act"] = 1
ultimate.cfg.vars["Taunt 1 speed"] = 1.0
ultimate.cfg.vars["Taunt spam 2"] = false
ultimate.cfg.vars["Taunt 2"] = 1

ultimate.cfg.vars["Handjob"] = false
ultimate.cfg.vars["Handjob mode"] = 1


ultimate.cfg.vars["Micromovement"] = false
ultimate.cfg.vars["On shot aa"] = false
ultimate.cfg.vars["Freestanding"] = false
ultimate.cfg.binds["freestand"] = 0
ultimate.cfg.vars["Inverter"] = false
ultimate.cfg.binds["Inverter"] = 0
ultimate.cfg.vars["Edge Aware"] = false
ultimate.cfg.vars["Anti aim chams"] = false
ultimate.cfg.vars["Brute Force"] = false
ultimate.cfg.vars["Hitbox Matrix"] = false
ultimate.cfg.vars["Danger Zone ESP"] = false

ultimate.cfg.vars["Angle arrows"] = false





ultimate.cfg.vars["Free standing"] = false
ultimate.cfg.vars["Dancer"] = false
    ultimate.cfg.vars["Dance"] = 1
    ultimate.cfg.vars["Arm breaker"] = false
    ultimate.cfg.vars["Arm breaker mode"] = 1
    ultimate.cfg.vars["Fake duck"] = false
    ultimate.cfg.vars["Fake duck mode"] = 1
    ultimate.cfg.vars["Fake walk"] = false
    ultimate.cfg.vars["Crimwalk"] = false

    ultimate.cfg.vars["Air crouch"] = false
    ultimate.cfg.vars["Air crouch mode"] = 1

// fake lag
ultimate.cfg.vars["Fake lag"] = false

ultimate.cfg.vars["Fake lag options-Disable on ladder"] = false
ultimate.cfg.vars["Fake lag options-Disable in attack"] = false
ultimate.cfg.vars["Fake lag options-On peek"] = false
ultimate.cfg.vars["Fake lag options-Randomise"] = false

ultimate.cfg.vars["Lag mode"] = 1

ultimate.cfg.vars["Lag limit"] = 1
ultimate.cfg.vars["Lag randomisation"] = 1

ultimate.cfg.vars["Fake duck"] = false
ultimate.cfg.binds["Fake duck"] = 0

ultimate.cfg.vars["Air lag duck"] = false
ultimate.cfg.vars["Jesus lag"] = false



ultimate.cfg.vars["Allah fly"] = false

    
// Sequence manip
ultimate.cfg.vars["Sequence manip"] = false
ultimate.cfg.vars["OutSequence"] = 500
ultimate.cfg.binds["Sequence manip"] = 0
ultimate.cfg.vars["Sequence min random"] = false
ultimate.cfg.vars["Sequence min"] = 1

ultimate.cfg.binds["Animation freezer"] = 0
ultimate.cfg.vars["Animation freezer"] = false

ultimate.cfg.vars["Freeze on peek"] = false

ultimate.cfg.vars["Allah walk"] = false
ultimate.cfg.binds["allahwalk"] = 0

// Animfix 

ultimate.cfg.vars["Interpolation-Disable interpolation"] = false
ultimate.cfg.vars["Interpolation-Fast sequences"] = false





    // ESP
    ultimate.cfg.vars["Bounding box"] = false



// Movement
ultimate.cfg.vars["Bhop"] = false
ultimate.cfg.vars["Sprint"] = false
ultimate.cfg.vars["Safe hop"] = false
ultimate.cfg.vars["Edge jump"] = false
ultimate.cfg.vars["Air duck"] = false

ultimate.cfg.vars["Air strafer"] = false
ultimate.cfg.vars["Strafe mode"] = 1
ultimate.cfg.vars["Ground strafer"] = false
ultimate.cfg.vars["Fast stop"] = false
ultimate.cfg.vars["Z Hop"] = false
ultimate.cfg.binds["Z Hop"] = 0


ultimate.cfg.vars["Water jump"] = false

ultimate.cfg.vars["Auto peak"] = false
ultimate.cfg.binds["Auto peak"] = 0
ultimate.cfg.vars["Auto peak tp"] = false

ultimate.cfg.vars["Circle strafe"] = false
ultimate.cfg.binds["Circle strafe"] = 0
ultimate.cfg.vars["CStrafe ticks"] = 64
ultimate.cfg.vars["CStrafe angle step"] = 1
ultimate.cfg.vars["CStrafe angle max step"] = 10
ultimate.cfg.vars["CStrafe ground diff"] = 10

ultimate.cfg.vars["Cvar name"] = ""
ultimate.cfg.vars["Cvar int"] = "1"
ultimate.cfg.vars["Cvar str"] = ""
ultimate.cfg.vars["Cvar mode"] = 1
ultimate.cfg.vars["Cvar flag"] = 1

ultimate.cfg.vars["Net Convar"] = ""
ultimate.cfg.vars["Net Convar str"] = ""
ultimate.cfg.vars["Net Convar int"] = 1
ultimate.cfg.vars["Net Convar mode"] = 1

ultimate.cfg.vars["Name Convar"] = ""
ultimate.cfg.vars["Disconnect reason"] = "VAC banned from secure server"
ultimate.cfg.vars["Name stealer"] = false
ultimate.cfg.vars["Auto reconnect"] = false

ultimate.cfg.vars["Chat spammer"]       = false
ultimate.cfg.vars["Hook Admin"]     = false
ultimate.cfg.vars["Chat mode"]          = 1
ultimate.cfg.vars["Chat group"]         = 1
ultimate.cfg.vars["Chat delay"]         = 1

ultimate.cfg.vars["Killsay"]            = false
ultimate.cfg.vars["Killsay mode"]          = 1
ultimate.cfg.vars["Killsay group"]         = 1

ultimate.cfg.vars["Cheat Advert"] = false
ultimate.cfg.vars["Cheat Advert mode"] = 1
ultimate.cfg.vars["Cheat Advert group"] = 1
ultimate.cfg.vars["Cheat Advert function"] = 1

ultimate.cfg.vars["Death say"]          = false
ultimate.cfg.vars["Death say mode"]        = 1
ultimate.cfg.vars["Death say group"]       = 1

ultimate.cfg.vars["Retry on handcuff"] = false

// FTPToPos abuse xd )))
ultimate.cfg.vars["FSpec Teleport"] = false
ultimate.cfg.binds["FSpec Teleport"] = 0

ultimate.cfg.vars["FSpec Masskill"] = false
ultimate.cfg.binds["FSpec Masskill"] = 0

ultimate.cfg.vars["FSpec ClickTP"] = false
ultimate.cfg.binds["FSpec ClickTP"] = 0

ultimate.cfg.vars["FSpec Velocity"] = false
ultimate.cfg.binds["FSpec Velocity"] = 0

// Player visuals 
ultimate.cfg.vars["Player Line"]    = false
ultimate.cfg.vars["Player Hat"]    = false
ultimate.cfg.vars["Player Hitbox"] = false

ultimate.cfg.vars["Box esp"]                    = false
ultimate.cfg.vars["Dormant ESP"]                 = false
ultimate.cfg.vars["Box style"]                  = 1
ultimate.cfg.vars["Show Priority"]  = false
ultimate.cfg.vars["Priority box"]  = false
ultimate.cfg.vars["Show Priority pos"] = 1

ultimate.cfg.vars["Sight lines"]        = false

ultimate.cfg.vars["ESP Font"]                  = 1

ultimate.cfg.vars["Box gradient"]   = false

ultimate.cfg.colors["Box esp"]      = "255 0 255 255"
ultimate.cfg.colors["Box gradient"] = "0 255 255 255"

ultimate.cfg.vars["Box team color"] = false
ultimate.cfg.vars["Box rainbow"] = false

ultimate.cfg.vars["Name"] = false
ultimate.cfg.vars["Name pos"] = 1
ultimate.cfg.vars["Lines"] = false

ultimate.cfg.vars["Mark"] = false
ultimate.cfg.vars["Mark pos"] = 1
ultimate.cfg.vars["Usergroup"] = false
ultimate.cfg.vars["Usergroup pos"] = 1

ultimate.cfg.vars["Team"] = false
ultimate.cfg.vars["Team pos"] = 1


ultimate.cfg.vars["Health"] = false
ultimate.cfg.vars["Health bar"] = false
ultimate.cfg.vars["Health bar gradient"] = false
ultimate.cfg.vars["Health pos"] = 4
ultimate.cfg.colors["Health"] = "0 255 0 255"
ultimate.cfg.colors["Health bar gradient"] = "255 45 0 255"

ultimate.cfg.vars["Hitbox on shoot"] = false
ultimate.cfg.colors["Hitbox Chams Color"] = "255 255 255 255"
ultimate.cfg.vars["Velocity Indicator"] = false

ultimate.cfg.vars["Armor"] = false
ultimate.cfg.vars["Armor bar"] = false
ultimate.cfg.vars["Armor bar gradient"] = false
ultimate.cfg.vars["Armor pos"] = 4
ultimate.cfg.colors["Armor"] = "0 150 255 255"
ultimate.cfg.colors["Armor bar gradient"] = "72 255 72 255"

ultimate.cfg.vars["DarkRP Money"] = false
ultimate.cfg.vars["Money pos"] = 1

ultimate.cfg.vars["Weapon"] = false
ultimate.cfg.vars["Weapon pos"] = 1

ultimate.cfg.vars["Show ammo"] = false
ultimate.cfg.vars["Weapon printname"] = false
ultimate.cfg.vars["Show reload"] = false 

ultimate.cfg.vars["Break LC"] = false
ultimate.cfg.vars["Break LC pos"] = 1

ultimate.cfg.vars["Simtime updated"] = false
ultimate.cfg.vars["Simtime pos"] = 1

ultimate.cfg.colors["Skeleton"] = "255 255 255 255"
ultimate.cfg.vars["Skeleton"] = false

ultimate.cfg.vars["Player flags"] = false
ultimate.cfg.vars["Hitbox"] = false
ultimate.cfg.colors["Hitbox"] = "255 255 255 255"

ultimate.cfg.vars["Indicators"] = false
ultimate.cfg.vars["Player Tracker"] = false
ultimate.cfg.vars["Admin List"] = false
ultimate.cfg.vars["AW Indicator"] = false



// Chams
ultimate.cfg.vars["Visible chams"] = false
ultimate.cfg.vars["Visible chams w"] = false
ultimate.cfg.vars["Visible mat"] = 1
ultimate.cfg.colors["Visible chams"] = "0 255 255 255"

ultimate.cfg.vars["inVisible chams"] = false
ultimate.cfg.vars["inVisible chams w"] = false
ultimate.cfg.vars["inVisible mat"] = 1
ultimate.cfg.colors["inVisible chams"] = "255 255 0 255"

ultimate.cfg.vars["Supress lighting"] = false

ultimate.cfg.vars["Self chams"] = false
ultimate.cfg.vars["Self chams w"] = false
ultimate.cfg.vars["Self mat"] = 1
ultimate.cfg.colors["Self chams"] = "255 0 255 255"

ultimate.cfg.vars["Supress self lighting"] = false

ultimate.cfg.vars["Show records"] = false

ultimate.cfg.vars["Backtrack chams"] = false
ultimate.cfg.vars["Backtrack material"] = 1
ultimate.cfg.vars["Backtrack fullbright"] = false
ultimate.cfg.colors["Backtrack chams"] = "255 128 255 255"
ultimate.cfg.vars["Backtrack skeleton"] = false
ultimate.cfg.vars["OOF Arrows"] = false
ultimate.cfg.vars["OOF Style"] = 1

ultimate.cfg.vars["qmenu unlock"] = false



ultimate.cfg.vars["On screen logs"] = false

-- Чекбокс для Rust Tickbase Indicator
ultimate.cfg.vars["Rust Tickbase Indicator"] = false

ultimate.cfg.colors["On screen logs"] = "69 255 69 255"
ultimate.cfg.colors["Miss lagcomp"] = "69 69 255 255"
ultimate.cfg.colors["Miss spread"] = "255 255 69 255"
ultimate.cfg.colors["Miss fail"] = "255 69 69 255"

ultimate.cfg.vars["Entity chams"] = false
ultimate.cfg.vars["Entity material"] = 1
ultimate.cfg.vars["Entity fullbright"] = false
ultimate.cfg.colors["Entity chams"] = "255 89 89 255"

ultimate.cfg.vars["Player outline"] = false
ultimate.cfg.vars["Entity outline"] = false
ultimate.cfg.colors["Player outline"] = "45 255 86 255"
ultimate.cfg.colors["Entity outline"] = "255 86 45 255"

ultimate.cfg.vars["Outline style"] = 1 

ultimate.cfg.vars["ESP Distance"] = 3500

// Entity Esp
ultimate.cfg.binds["Ent add"] = 0
ultimate.cfg.vars["Ent box"] = false
ultimate.cfg.vars["Ent box style"] = 1
ultimate.cfg.vars["Ent class"] = false
ultimate.cfg.vars["Ent ESP Distance"] = 3500

ultimate.cfg.vars["Fresnel minimum illum"] = 0
ultimate.cfg.vars["Fresnel maximum illum"] = 1
ultimate.cfg.vars["Fresnel exponent"] = 1

// Hitmarker
ultimate.cfg.vars["Hitmarker"] = false
ultimate.cfg.vars["Hit particles"] = false
ultimate.cfg.vars["Hitnumbers"] = false

ultimate.cfg.vars["Hitsound"] = false
ultimate.cfg.vars["Killsound"] = false

ultimate.cfg.vars["Hitsound str"] = "phx/hmetal1.wav"
ultimate.cfg.vars["Killsound str"] = "ambient/levels/canals/windchime2.wav"

ultimate.cfg.vars["Warning!"] = false

ultimate.cfg.colors["Hit particles"] = "255 128 235 255"
ultimate.cfg.colors["Hitmarker"] = "255 155 25 255"
ultimate.cfg.colors["Hitnumbers"] = "255 255 255 255"
ultimate.cfg.colors["Hitnumbers krit"] = "255 35 35 255"

// Name hide / visual misc

ultimate.cfg.vars["Hide name"] = false
ultimate.cfg.vars["Custom name"] = "Your mom"
ultimate.cfg.vars["Disable sensivity adjustment"] = false
ultimate.cfg.vars["Screengrab image"] = false


// Visuals 
ultimate.cfg.vars["Tickbase indicator"] = false
ultimate.cfg.vars["Spectator list"] = false
ultimate.cfg.vars["WaterMark"] = false
ultimate.cfg.vars["KeyBind List"] = false
ultimate.cfg.colors["KeyBind List"] = "0 0 0 255"
ultimate.cfg.vars["Notifications"] = true
ultimate.cfg.vars["Crosshair"] = false
ultimate.cfg.colors["Crosshair"] = "255 0 0 255"
ultimate.cfg.vars["crossstyle"] = 1
ultimate.cfg.vars["Auto Distance"]   = false


ultimate.cfg.vars["Killsound"] = false

// World 
ultimate.cfg.vars["Custom sky"] = GetConVar("sv_skyname"):GetString()
ultimate.cfg.vars["Sky color"] = false 
ultimate.cfg.colors["Sky color"] = "145 185 245 255"
ultimate.cfg.vars["Wall color"] = false 
-- Default wall color set to pink
ultimate.cfg.colors["Wall color"] = "255 105 180 255"
ultimate.cfg.vars["Fullbright"] = false 
ultimate.cfg.vars["Fullbright mode"] = 1
ultimate.cfg.binds["Fullbright"] = 0
ultimate.cfg.vars["Disable shadows"] = false
ultimate.cfg.vars["FogChanger"] = false
ultimate.cfg.colors["FogChanger"] = "255 255 255 255"
ultimate.cfg.vars["FogStart"] = 1500
ultimate.cfg.vars["FogEnd"] = 3000
ultimate.cfg.vars["Color Modify"] = false
ultimate.cfg.vars["Color Modify Brightness"] = 0
ultimate.cfg.vars["Color Modify Contrast"] = 1
ultimate.cfg.vars["Color Modify Saturation"] = 3
ultimate.cfg.vars["Color Modify Add Red"] = 0
ultimate.cfg.vars["Color Modify Add Green"] = 0
ultimate.cfg.vars["Color Modify Add Blue"] = 0
ultimate.cfg.vars["Color Modify Mul Red"] = 0
ultimate.cfg.vars["Color Modify Mul Green"] = 0
ultimate.cfg.vars["Color Modify Mul Blue"] = 0
ultimate.cfg.vars["Rain effect"] = false
ultimate.cfg.vars["Snow effect"] = false
ultimate.cfg.vars["Rain area"] = 1000
ultimate.cfg.vars["Rain particles"] = 500
ultimate.cfg.vars["Snow area"] = 1000
ultimate.cfg.vars["Snow particles"] = 500

// Effects
ultimate.cfg.vars["Bullet tracers"] = false 
ultimate.cfg.colors["Bullet tracers"] = "255 0 0 255"
ultimate.cfg.vars["Bullet tracers material"] = "effects/blueblacklargebeam" 
ultimate.cfg.vars["Tracers die time"] = 5 
ultimate.cfg.vars["Bullet tracers muzzle"] = false 

// View 
ultimate.cfg.vars["Third person"] = false
ultimate.cfg.binds["Third person"] = 0
ultimate.cfg.vars["Third person collision"] = false
ultimate.cfg.vars["Third person smoothing"] = false
ultimate.cfg.vars["Third person distance"] = 150

ultimate.cfg.vars["Free camera"] = false
ultimate.cfg.binds["Free camera"] = 0
ultimate.cfg.vars["Free camera speed"] = 25
ultimate.cfg.vars["Ghetto free cam"] = false

ultimate.cfg.vars["Override view"] = true

ultimate.cfg.vars["Fov override"] = GetConVarNumber("fov_desired")

ultimate.cfg.vars["Aspect ratio"] = 0

ultimate.cfg.vars["Viewmodel changer"] = false

ultimate.cfg.vars["Viewmodel fov"] = GetConVar("viewmodel_fov"):GetInt()

ultimate.cfg.vars["Viewmodel chams"] = false
ultimate.cfg.colors["Viewmodel chams"] = "75 95 128 255"
ultimate.cfg.vars["Viewmodel chams type"] = 1
ultimate.cfg.vars["Viewmodel chams rainbow"] = false
ultimate.cfg.vars["Fullbright viewmodel"] = false

ultimate.cfg.vars["chams_hand"] = false
ultimate.cfg.colors["chams_hand"] = "75 95 128 255"
ultimate.cfg.vars["chams_hand_mat"] = 1
ultimate.cfg.vars["fullbright hands"] = false

ultimate.cfg.vars["Viewmodel manip"] = false
ultimate.cfg.vars["Viewmodel x"] = 0
ultimate.cfg.vars["Viewmodel y"] = 0
ultimate.cfg.vars["Viewmodel z"] = 0
ultimate.cfg.vars["Viewmodel r"] = 0
ultimate.cfg.vars["Viewmodel p"] = 0
ultimate.cfg.vars["Viewmodel ya"] = 0

ultimate.cfg.vars["Modelchanger"]   = false
ultimate.cfg.vars["Modelchanger model"] = 1
ultimate.cfg.vars["Player_modelchanger"] = false
ultimate.cfg.vars["Player_modelchanger_agent"] = 1

ultimate.cfg.vars["Ghost follower"] = false
ultimate.cfg.vars["GFID"] = "SteamID"

// Misc

ultimate.cfg.vars["Use spam"] = false
ultimate.cfg.vars["Flashlight spam"] = false
ultimate.cfg.vars["Auto GTA"] = false
ultimate.cfg.vars["Camera spam"] = false
ultimate.cfg.vars["Fast lockpick"] = false
ultimate.cfg.vars["sboxcrasher"] = false


// Troll

ultimate.cfg.vars["Trollbot"] = false
ultimate.cfg.vars["Trollbot target"] = ""
ultimate.cfg.vars["Trollbot mode"] = 1
ultimate.cfg.vars["Troll Delay"] = 1


// Config


ultimate.cfg.vars["Config name"] = "new"
ultimate.cfg.vars["Selected config"] = 1
ultimate.cfg.vars["Menu Snow"]      = false
ultimate.cfg.vars["Behind Menu Snow"]   = true
ultimate.cfg.vars["Behind Menu Web"]     = false
ultimate.cfg.vars["Menu Confetti"] = false
ultimate.cfg.vars["Menu Music"] = false
ultimate.cfg.vars["MenuMusicVolume"] = 50
ultimate.cfg.vars["MenuMusicPath"] = "sound/ultimate_menu_music.mp3"
ultimate.cfg.vars["Behind Menu Dim"] = false
ultimate.cfg.vars["Menu Dim Alpha"] = 180
ultimate.cfg.vars["Behind Menu Blur"] = false
ultimate.cfg.vars["Menu Blur Strength"] = 4

ultimate.cfg.vars["OBS Friendly Mode"] = false
ultimate.cfg.vars["Menu Background Enabled"] = false
ultimate.cfg.vars["MenuBackgroundPath"] = ""
ultimate.cfg.vars["Menu Background Fit"] = 1
ultimate.cfg.vars["Menu Background Parallax"] = false
ultimate.cfg.vars["Menu Parallax Strength"] = 15
ultimate.cfg.vars["Menu Particle Density"] = 1.0
ultimate.cfg.vars["Menu GPU Budget"] = 1.0
ultimate.cfg.vars["Menu Music Loop"] = true
ultimate.cfg.vars["Menu Music Pause On Close"] = false
ultimate.cfg.vars["Menu Music Fade On Toggle"] = true
ultimate.cfg.vars["Menu Music Fade Time"] = 1.0

ultimate.cfg.vars["Menu Vignette"] = false
ultimate.cfg.vars["Menu Vignette Strength"] = 100
ultimate.cfg.vars["Menu Tint"] = false
ultimate.cfg.vars["Menu Tint R"] = 0
ultimate.cfg.vars["Menu Tint G"] = 0
ultimate.cfg.vars["Menu Tint B"] = 0
ultimate.cfg.vars["Menu Tint A"] = 0
ultimate.cfg.vars["Menu Noise"] = false
ultimate.cfg.vars["Menu Noise Strength"] = 0

ultimate.cfg.friends = {}
ultimate.cfg.ents = {}

do 
    local maxshift = GetConVar("sv_maxusrcmdprocessticks"):GetInt() - 1
    local tickrate = tostring(math.Round(1 / flTickInterval))

	RunConsoleCommand("cl_cmdrate", tickrate)
	RunConsoleCommand("cl_updaterate", tickrate)

	RunConsoleCommand("cl_interp", "0")
	RunConsoleCommand("cl_interp_ratio", "0")

    ultimate.cfg.vars["Shift ticks"] = maxshift
    ultimate.cfg.vars["Charge ticks"] = maxshift
    
    ded.SetInterpolation( true )
    ded.SetSequenceInterpolation( true )
    ded.EnableAnimFix( false )
end




/*
    Miss / Hit logs
*/

ultimate.onScreenLogs = {}
ultimate.firedShots = 0
ultimate.HitLogsWhite = Color( 225, 225, 225 )
ultimate.MissReasons = {
    [ 1 ] =     { str = "spread", var = "Miss spread" },
    [ 2 ] =     { str = "occlusion", var = "Miss spread" },
    [ 3 ] =     { str = "desync", var = "Miss lagcomp" },
    [ 4 ] =     { str = "lagcomp", var = "Miss lagcomp" },
    [ 5 ] =     { str = "resolver", var = "Miss fail" },
}

 





// Config save / load

if not file.Exists( "data/sosiski", "GAME" ) then 
    file.CreateDir("sosiski") 
end

if not file.Exists( "sosiski/default.txt", "DATA" ) then 
    file.Write( "sosiski/default.txt", util.TableToJSON( ultimate.cfg, false ) ) 
end


ultimate.cfgTable = {}

function ultimate.fillConfigTable()
    local ftbl = file.Find("sosiski/*.txt", "DATA")
    ultimate.cfgTable = {}

    if not ftbl or #ftbl == 0 then return end

    for i = 1, #ftbl do
        local str = ftbl[i] 
        local len = string.len(str)
        local f = string.sub(str, 1, len - 4) -- Remove .txt extension

        ultimate.cfgTable[#ultimate.cfgTable + 1] = f
    end
end

ultimate.fillConfigTable()

function ultimate.SaveConfig()
    local tojs = util.TableToJSON(ultimate.cfg, false)
    local str = ultimate.cfgTable[ultimate.cfg.vars["Selected config"]]

    if str then
        file.Write("sosiski/" .. str .. ".txt", tojs)
    else
        print("Error: Selected config not found.")
    end
end

function ultimate.LoadConfig()
    local str = ultimate.cfgTable[ultimate.cfg.vars["Selected config"]]
    //print(ultimate.cfg.vars["Selected config"])

    if not str or not file.Exists("sosiski/" .. str .. ".txt", "DATA") then
        print("Error: Config file not found.")
        return
    end

    local read = file.Read("sosiski/" .. str .. ".txt", "DATA")
    local totbl = util.JSONToTable(read)
    if not totbl then
        print("Error: Failed to parse config file.")
        return
    end

    local ConfigName = ultimate.cfg.vars["Config name"]
    local SelectedConfig = ultimate.cfg.vars["Selected config"]

    for k, v in pairs(totbl) do
        for key, value in pairs(v) do
            local tbl = ultimate.cfg
            
            if k == "vars" then
                tbl = ultimate.cfg.vars
            elseif k == "colors" then
                tbl = ultimate.cfg.colors
            elseif k == "binds" then
                tbl = ultimate.cfg.binds
            elseif k == "binds" then
                tbl = ultimate.cfg.binds
            elseif k == "friends" then
                tbl = ultimate.cfg.friends
            elseif k == "ents" then
                tbl = ultimate.cfg.ents
            end
            
            tbl[key] = value 
        end
    end

    ultimate.cfg.vars["Config name"] = ConfigName
    ultimate.cfg.vars["Selected config"] = SelectedConfig

    ded.SetInterpolation(ultimate.cfg.vars["Disable interpolation"])
    ded.SetSequenceInterpolation(ultimate.cfg.vars["Disable Sequence interpolation"])
    local pendingEnableAnimFix = false
    local pendingEnableBoneFix = false

    ded.SetMaxShift(ultimate.cfg.vars["Charge ticks"])
    ded.SetMinShift(ultimate.cfg.vars["Shift ticks"])
    ded.EnableTickbaseShifting(ultimate.cfg.vars["Tickbase shift"])
end

function ultimate.CreateConfig()
    local str = ultimate.cfg.vars["Config name"]

    if str then
        file.Write("sosiski/" .. str .. ".txt", "")
        ultimate.fillConfigTable()
        ultimate.initTab("Config")
    else
        print("Error: Config name not specified.")
    end
end

function ultimate.DeleteConfig()
    local selectedConfigId = ultimate.cfg.vars["Selected config"]
    local str = ultimate.cfgTable[selectedConfigId]

    if str then
        file.Delete("sosiski/" .. str .. ".txt")

        table.remove(ultimate.cfgTable, selectedConfigId)

        if #ultimate.cfgTable > 0 then
            ultimate.cfg.vars["Selected config"] = 1
        else
            ultimate.cfg.vars["Selected config"] = nil
        end

        ultimate.fillConfigTable()
        ultimate.initTab("Config")
    else
        print("Error: Selected config not found.")
    end
end


function ultimate.TIME_TO_TICKS(time)
	return math.floor(0.5 + time / flTickInterval)
end

function ultimate.TICKS_TO_TIME(ticks)
    return flTickInterval * ticks
end

function ultimate.ROUND_TO_TICK(time)
    return ultimate.TICKS_TO_TIME(ultimate.TIME_TO_TICKS(time))
end














local Utility = {}

function Utility.TimeToTicks( flTime )
    return math.floor( 0.5 + flTime / flTickInterval )
end

/*
    Materials 
*/

ultimate.chamsMaterials = {
    "Flat", 
    "Wireframe",
    "Selfillum",
    "Selfillum additive",
    "Metallic",
    "Glass",
    "Glowing glass"
}


/*
    Detours 
*/
do
    local PLAYER = FindMetaTable( "Player" )

    local Name_     = PLAYER.Name
    local Nick_     = PLAYER.Nick
    local GetName_  = PLAYER.GetName

    function PLAYER:Name()

        if ultimate.cfg.vars["Hide name"] and self == pLocalPlayer then
            return ultimate.cfg.vars["Custom name"]
        end

        return Name_( self )
    end

    function PLAYER:Nick()

        if ultimate.cfg.vars["Hide name"] and self == pLocalPlayer then
            return ultimate.cfg.vars["Custom name"]
        end

        return Nick_( self )
    end

    function PLAYER:GetName()

        if ultimate.cfg.vars["Hide name"] and self == pLocalPlayer then
            return ultimate.cfg.vars["Custom name"]
        end

        return GetName_( self )
    end
end









ultimate.ui = {}

ultimate.validsnd = false 


ultimate.activetab = "Aimbot"
ultimate.multicombo = false


ultimate.hint = false
ultimate.hintText = ""
ultimate.hintX = 0
ultimate.hintY = 0

do
    StoredCursorPos = {}

    function RememberCursorPosition()

        local x, y = input.GetCursorPos()

        if ( x == 0 && y == 0 ) then return end

        StoredCursorPos.x, StoredCursorPos.y = x, y

    end

    function RestoreCursorPosition()

        if ( !StoredCursorPos.x || !StoredCursorPos.y ) then return end
        input.SetCursorPos( StoredCursorPos.x, StoredCursorPos.y )

    end
end

do
    local PANEL = {}

    local function LerpColor(frac, from, to)
        if not from or not to then return from or to end
        return Color(
            Lerp(frac, from.r or 255, to.r or 255),
            Lerp(frac, from.g or 255, to.g or 255),
            Lerp(frac, from.b or 255, to.b or 255),
            Lerp(frac, from.a or 255, to.a or 255)
        )
    end

    PANEL.FadeTime = 0
    PANEL.Animations = {}

    function PANEL:Init()
        self:SetFocusTopLevel(true)
        self:SetSize(1000, 700)
        self:SetPaintBackgroundEnabled(false)
        self:SetPaintBorderEnabled(false)
        self:DockPadding(0, 60, 0, 0)
        self:MakePopup()
        self:Center(true)

        -- Стартовый звук при загрузке интерфейса (один раз за сессию)
        if ultimate and not ultimate._playedStartupSound then
            surface.PlaySound("3dmeagle.wav")
            ultimate._playedStartupSound = true
        end

        self:SetAlpha(0)
        self:SetSize(0, 800)
        self.Animations.FadeIn = Derma_Anim("FadeIn", self, function(p, anim, delta, data)
            p:SetAlpha(delta * 255)
            p:SetSize(1000, 700 * delta)
            if delta == 1 then
                p:Center()
            end
        end)
        self.Animations.FadeIn:Start(0.3)

        PANEL.TopPanel = self:Add("DPanel")
        PANEL.TopPanel:SetPos(0, 0)
        PANEL.TopPanel:SetSize(1000, 60)
        PANEL.TopPanel.lineProgress = 0
        function PANEL.TopPanel:Paint(w, h)
            -- Градиентная шапка
            local grad = Material("vgui/gradient-u")
            surface.SetMaterial(grad)
            surface.SetDrawColor(40, 40, 60, 255)
            surface.DrawTexturedRect(0, 0, w, h)
            -- Лого/надпись (чистый стиль)
            local text = "voidhook tusha1tes edition卐"
            surface.SetFont("logo_clean")
            local tw, th = surface.GetTextSize(text)
            local maxWidth = w - 40
            if tw > maxWidth then
                -- если слишком длинно, просто отрисуем как есть (шрифт фиксированный)
                tw = maxWidth
            end
            local x = 18
            local y = 10
            -- Чистый нейтральный текст
            local tc = ultimate.Colors[210]
            surface.SetTextColor(tc.r, tc.g, tc.b, 255)

            -- Крутящийся знак бесконечности перед логотипом (лемниската Бернулли)
            do
                local cx = x + 10 -- центр символа по X
                local cy = y + th * 0.55 -- центр символа по Y
                -- Классическая форма: лемниската Бернулли с равномерной толстой линией
                -- Небольшая широтная компрессия по X
                local size = math.max(9, math.min(18, th * 0.53))
                local a = size
                local steps = 256 -- больше сегментов для плавности
                local stroke = 3.5 -- толщина линии
                local rot = CurTime() * 180 -- градусов/сек
                local rotRad = math.rad(rot % 360)

                local function rot2(px, py)
                    local cr, sr = math.cos(rotRad), math.sin(rotRad)
                    return cx + px * cr - py * sr, cy + px * sr + py * cr
                end

                surface.SetDrawColor(tc.r, tc.g, tc.b, 245)
                -- Сначала вычислим точки кривой и сглаженные нормали для каждого узла,
                -- потом нарисуем непрерывную полосу (triangle strip) — выглядит как единое целое.
                local pts = {}
                for i = 0, steps do
                    local t = -math.pi + (i / steps) * (2 * math.pi)
                    local s, c = math.sin(t), math.cos(t)
                    local d = 1 + s * s
                    local px = (a * (c / d)) * 0.78
                    local py =  a * (s * c / d)
                    local rx, ry = rot2(px, py)
                    pts[i] = { x = rx, y = ry }
                end

                local normals = {}
                for i = 0, steps do
                    local iPrev = (i - 1 + (steps+1)) % (steps+1)
                    local iNext = (i + 1) % (steps+1)
                    local p0, p1 = pts[iPrev], pts[iNext]
                    local tx, ty = p1.x - p0.x, p1.y - p0.y -- аппрокс. касательная
                    local len = math.sqrt(tx*tx + ty*ty)
                    if len < 1e-6 then len = 1e-6 end
                    -- нормаль влево от касательной (перпендикуляр)
                    local nx, ny = -ty/len, tx/len
                    normals[i] = { x = nx, y = ny }
                end

                local half = stroke * 0.5
                for i = 0, steps-1 do
                    local pA, pB = pts[i], pts[i+1]
                    local nA, nB = normals[i], normals[i+1]

                    -- усредняем нормали в стыке, чтобы не было "зубцов"
                    local nAx, nAy = nA.x, nA.y
                    local nBx, nBy = nB.x, nB.y
                    local nMx, nMy = nAx + nBx, nAy + nBy
                    local nMl = math.sqrt(nMx*nMx + nMy*nMy)
                    if nMl > 1e-6 then
                        nMx, nMy = nMx/nMl, nMy/nMl
                    else
                        nMx, nMy = nAx, nAy
                    end

                    -- корректируем масштаб, чтобы толщина оставалась постоянной при повороте
                    local dotA = nAx*nMx + nAy*nMy
                    if math.abs(dotA) < 0.2 then dotA = 0.2 end
                    local scale = half / dotA

                    local aL = { x = pA.x + nMx * scale, y = pA.y + nMy * scale }
                    local aR = { x = pA.x - nMx * scale, y = pA.y - nMy * scale }

                    -- для B пересчитаем с его усреднённой нормалью относительно следующей точки
                    local nNx, nNy = nB.x, nB.y
                    local iNext2 = (i + 2) % (steps+1)
                    local nNext = normals[iNext2] or nB
                    local nnx, nny = nNx + nNext.x, nNy + nNext.y
                    local nnl = math.sqrt(nnx*nnx + nny*nny)
                    if nnl > 1e-6 then nnx, nny = nnx/nnl, nny/nnl else nnx, nny = nNx, nNy end
                    local dotB = (nBx*nnx + nBy*nny)
                    if math.abs(dotB) < 0.2 then dotB = 0.2 end
                    local scaleB = half / dotB
                    local bL = { x = pB.x + nnx * scaleB, y = pB.y + nny * scaleB }
                    local bR = { x = pB.x - nnx * scaleB, y = pB.y - nny * scaleB }

                    surface.DrawPoly({ aL, aR, bR })
                    surface.DrawPoly({ aL, bR, bL })
                end

                -- Фиксированный отступ для текста
                x = x + 34
            end

            surface.SetTextPos(x, y)
            surface.DrawText(text)
        end
        -- надпись убрана

        PANEL.LeftPanel = self:Add("DPanel")
        PANEL.LeftPanel:Dock(LEFT)
        PANEL.LeftPanel:SetWide(180)
        PANEL.LeftPanel:DockMargin(0, 0, 0, 0)
        function PANEL.LeftPanel:Paint(w, h)
            -- Градиентная боковая панель
            local grad = Material("vgui/gradient-l")
            surface.SetMaterial(grad)
            surface.SetDrawColor(60, 60, 80, 255)
            surface.DrawTexturedRect(0, 0, w, h)
            -- надпись убрана
        end
    end

    function PANEL:Think()
        for name, anim in pairs(self.Animations) do
            if anim:Active() then
                anim:Run()
            end
        end

        local x,y = input.GetCursorPos()
        local mousex = math.Clamp(x, 1, ScrW() - 1)
        local mousey = math.Clamp(y, 1, ScrH() - 1)

        if self.Dragging then
            local x = mousex - self.Dragging[1]
            local y = mousey - self.Dragging[2]
            self:SetPos(x, y)
        end

        self:SetCursor("arrow")

        if not self.Animations.ColorChange or not self.Animations.ColorChange:Active() then
            local target_color = HSVToColor((CurTime() * 20) % 360, 0.5, 1) or Color(255,255,255)
            target_color.r = math.Clamp(target_color.r, 120, 255)
            target_color.g = math.Clamp(target_color.g, 120, 255)
            target_color.b = math.Clamp(target_color.b, 120, 255)
            if not ultimate.accent then ultimate.accent = target_color end
            self.Animations.ColorChange = Derma_Anim("ColorChange", self, function(p, anim, delta, data)
                if ultimate.accent and target_color then
                    ultimate.accent = LerpColor(delta, ultimate.accent, target_color)
                end
            end)
            self.Animations.ColorChange:Start(0.8)
        end
    end

    function PANEL:IsActive()
        if ( self:HasFocus() ) then return true end
        if ( vgui.FocusedHasParent( self ) ) then return true end
        return false
    end

    function PANEL:OnMousePressed()
        local x,y = input.GetCursorPos()
        local screenX, screenY = self:LocalToScreen( 0, 0 )
        if (  y < ( screenY + 850 ) ) then
            self.Dragging = { x - self.x, y - self.y }
            self:MouseCapture( true )
            return
        end
    end

    function PANEL:OnMouseReleased()
        self.Dragging = nil
        self.Sizing = nil
        self:MouseCapture( false )  
    end

    function PANEL:Paint(w, h)
        -- Основной фон: плавный градиент и тень
        local grad = Material("vgui/gradient-d")
        surface.SetMaterial(grad)
        surface.SetDrawColor(30, 30, 40, 240)
        surface.DrawTexturedRect(0, 0, w, h)
        draw.RoundedBox(24, 0, 0, w, h, Color(30,30,40,220))
        -- Тень
        surface.SetDrawColor(0,0,0,60)
        surface.DrawRect(8, 8, w-16, h-16)

        -- Ник и аватар
        local ply = LocalPlayer()
        if IsValid(ply) then
            local nick = ply:Nick()
            surface.SetFont("veranda_s")
            local tw, th = surface.GetTextSize(nick)
            surface.SetTextColor(ultimate.accent or Color(200,200,255))
            surface.SetTextPos(w - tw - 60, 18)
            surface.DrawText(nick)
            if not IsValid(self.AvatarImage) then
                self.AvatarImage = vgui.Create("AvatarImage", self)
                self.AvatarImage:SetSize(32, 32)
                self.AvatarImage:SetPlayer(ply, 64)
            end
            self.AvatarImage:SetPos(w - 40, 10)
        end

    -- ...логотип и подпись убраны...
    end

    function PANEL:GetTopPanel()
        return PANEL.TopPanel
    end
    function PANEL:GetLeftPanel()
        return PANEL.LeftPanel
    end

    vgui.Register( "UFrame", PANEL, "EditablePanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock(FILL)
        local vbar = self.VBar
        vbar:SetWide(3)
        vbar.Paint = nil
        vbar.btnUp.Paint = nil
        vbar.btnDown.Paint = nil
        function vbar.btnGrip:Paint(w, h)
            draw.RoundedBox(12, 0, 0, w, h, Color(80,80,120,120))
        end
    end

    function PANEL:Paint(w, h)
        -- Фон только для левых вкладок
        if self:GetParent() and self:GetParent():GetWide() <= 200 then
            draw.RoundedBox(16, 0, 0, w, h, Color(40,40,60,180))
        end
    end

    function PANEL:OnMousePressed()
        ultimate.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        ultimate.frame:OnMouseReleased()
    end

    vgui.Register("UScroll", PANEL, "DScrollPanel")
end

do
    local PANEL = {}

    function PANEL:Init()
        self.ItemPanel = vgui.Create( "DPanel", self )
        self.ItemPanel:Dock( FILL )
        self.ItemPanel:DockMargin( 3, 23, 3, 3 )

        self.ItemPanel.Paint = nil

        function self.ItemPanel:OnMousePressed()
            ultimate.frame:OnMousePressed()
        end
    
        function self.ItemPanel:OnMouseReleased()
            ultimate.frame:OnMouseReleased()
        end
    end

    function PANEL:Paint( w, h )
        -- Современный дизайн панелей настроек
        -- Не подсвечивать панель по совпадению имени с активной вкладкой
        local isActive = false
        -- Отключаем подсветку при наведении полностью
        local hovered = false
        -- Градиент
        local grad = Material("vgui/gradient-u")
        surface.SetMaterial(grad)
        if isActive then
            surface.SetDrawColor(120,120,180,255)
        elseif hovered then
            surface.SetDrawColor(80,80,120,220)
        else
            surface.SetDrawColor(40,40,60,200)
        end
        surface.DrawTexturedRect(0, 0, w, h)
        -- Закруглённые углы
        draw.RoundedBox(10, 0, 0, w, h, Color(0,0,0,40))
        -- Тонкая светлая линия снизу для активной
        if isActive then
            surface.SetDrawColor(160,160,220,180)
            surface.DrawRect(0, h-2, w, 2)
        end
        -- Текст
        surface.SetFont("veranda") -- меньше размер
        surface.SetTextColor(Color(80,80,120,180)) -- темнее и прозрачнее
        local tw, th = surface.GetTextSize(self.txt)
        surface.SetTextPos(10, 6)
        surface.DrawText(self.txt)
    end

    function PANEL:OnMousePressed()
        ultimate.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        ultimate.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end
    
    vgui.Register( "UPanel", PANEL, "Panel" )
end

do
    local PANEL = {}

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[ 54 ] )
        surface.DrawRect( 0, 0, w, h )
    end
    
    vgui.Register( "UPaintedPanel", PANEL, "Panel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( TOP )
        self:DockMargin( 4, 4, 4, 0 )
        self:SetTall( 18 )
    end

    function PANEL:Paint( w, h )
        
    end
    
    vgui.Register( "UCBPanel", PANEL, "DPanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self.Label:SetFont("DermaSmall")
        self.Label:SetTextColor(ultimate.Colors[165])

        self.Button:SetSize(32, 18)
        self.Button:SetCursor("hand")

        function self.Button:Paint(w, h)
            local v = self:GetChecked()
            local hovered = self:IsHovered()

            -- smooth hover factor
            self._hoverFrac = Lerp(FrameTime() * 10, self._hoverFrac or 0, hovered and 1 or 0)

            -- helpers
            local function brighten(c, add, a)
                return Color(math.min(255, c.r + add), math.min(255, c.g + add), math.min(255, c.b + add), a)
            end

            -- Toggle switch background (oval)
            local baseOff = ultimate.Colors[32]
            local baseOn  = ultimate.Colors[54]
            local add = 8 * (self._hoverFrac or 0)
            local bg = v and brighten(baseOn, add, 220 + 10 * (self._hoverFrac or 0))
                           or brighten(baseOff, add, 200 + 10 * (self._hoverFrac or 0))
            draw.RoundedBox(h/2, 0, 0, w, h, bg)

            -- subtle rounded highlight overlay (no square outline)
            if (self._hoverFrac or 0) > 0.01 then
                local ha = 8 * (self._hoverFrac or 0)
                draw.RoundedBox(h/2, 0, 0, w, h, Color(255,255,255, ha))
            end

            -- Knob animation and color
            if not self.knobAnim then self.knobAnim = v and 1 or 0 end
            self.knobAnim = Lerp(FrameTime() * 12, self.knobAnim, v and 1 or 0)
            local knobSize = h-6 -- keep knob size constant to avoid jumpy feel
            local knobX = 3 + (w - knobSize - 6) * self.knobAnim
            local knobOff = ultimate.Colors[120]
            local knobOn  = ultimate.Colors[210]
            local kadd = 8 * (self._hoverFrac or 0)
            local kc = v and brighten(knobOn, kadd, 255) or brighten(knobOff, kadd, 230)
            -- soft halo behind knob
            if (self._hoverFrac or 0) > 0.01 then
                draw.RoundedBox(knobSize/2, knobX-1, 2, knobSize+2, knobSize+2, Color(255,255,255, 4 * (self._hoverFrac or 0)))
            end
            draw.RoundedBox(knobSize/2, knobX, 3, knobSize, knobSize, kc)
        end
    end

    function PANEL:PerformLayout()

        local x = self.m_iIndent || 0
    
        self.Button:SetSize( 32, 18 )
        self.Button:SetPos( x, math.floor( ( self:GetTall() - self.Button:GetTall() ) / 2 ) )
    
        self.Label:SizeToContents()
        self.Label:SetPos( x + self.Button:GetWide() + 9, math.floor( ( self:GetTall() - self.Label:GetTall() ) / 2 ) )
    
    end
    
    vgui.Register( "UCheckboxLabel", PANEL, "DCheckBoxLabel" )
end

do
    local PANEL = {}
    AccessorFunc(PANEL, "Value", "Value")
    AccessorFunc(PANEL, "SlideX", "SlideX")
    AccessorFunc(PANEL, "Min", "Min")
    AccessorFunc(PANEL, "Decimals", "Decimals")
    AccessorFunc(PANEL, "Max", "Max")
    AccessorFunc(PANEL, "Dragging", "Dragging")
    
    function PANEL:Init()
        self:SetMouseInputEnabled(true)
    
        self.Min = 0
        self.Max = 1
        self.SlideX = 0
        self.Decimals = 0
    
        self:SetValue(self.Min)
        self:SetSlideX(0)

        self:SetTall(18)
        -- Для звука при изменении значения
        self._lastSoundValue = self.Min
        self._soundStep = 1 -- для Decimals=0; пересчитаем динамически при изменении Decimals
        -- Для эффекта "скроллинга" при перетаскивании по движению курсора
        self._lastSoundX = 0
        self._scrollSoundStep = 0.02 -- играть тик каждые 2% ширины слайдера
    end
    
    function PANEL:OnCursorMoved(x, y)
        if !self.Dragging then return end
    
        local w, h = self:GetSize()
    
        x = math.Clamp(x, 0, w) / w
        y = math.Clamp(y, 0, h) / h
    
        local value = self.Min + (self.Max - self.Min) * x
        value = math.Round(value, self:GetDecimals())
    
        self:SetValue(value)
        self:SetSlideX(x)
    
        self:OnValueChanged(value)
    
        -- Тик во время перетаскивания: по смещению курсора
        if math.abs(x - (self._lastSoundX or 0)) >= (self._scrollSoundStep or 0.02) then
            surface.PlaySound("ui/buttonrollover.wav")
            self._lastSoundX = x
        end
    
        self:InvalidateLayout()
    end
    
    function PANEL:OnMousePressed(mcode)
        self:SetDragging(true)
        self:MouseCapture(true)
    
        local x, y = self:CursorPos()
        self:OnCursorMoved(x, y)
    end
    
    function PANEL:OnMouseReleased(mcode)
        self:SetDragging(false)
        self:MouseCapture(false)
        -- Завершение перетаскивания — клик-саунд
        surface.PlaySound("ui/buttonclickrelease.wav")
    end
    
    function PANEL:OnValueChanged(value)
        -- Дебаунс по шагу значения: играем звук, когда значение изменилось на шаг и более
        local decimals = self.GetDecimals and self:GetDecimals() or 0
        local step = math.max(1, 10 ^ (-decimals))
        -- если диапазон меньше шага (например, 0..1 с decimals=0), fallback на 0.05
        if (self.Max - self.Min) < step then
            step = 0.05
        end
        self._soundStep = step

        if self._lastSoundValue == nil or math.abs(value - self._lastSoundValue) >= step then
            surface.PlaySound("ui/buttonrollover.wav")
            self._lastSoundValue = value
        end
    end

    function PANEL:Paint(w,h)
        local slide = math.Clamp(self:GetSlideX() or 0, 0, 1)
        -- Track
        local base = ultimate.Colors[32]
        local fill = ultimate.Colors[54]
        local trackH = 6
        local trackY = math.floor((h - trackH) * 0.5)
        draw.RoundedBox( trackH/2, 1, trackY, w-2, trackH, Color(base.r, base.g, base.b, 180) )

        -- Fill
        local fillW = math.max(0, math.floor((w-2) * slide))
        if fillW > 0 then
            draw.RoundedBox( trackH/2, 1, trackY, fillW, trackH, Color(fill.r, fill.g, fill.b, 220) )
        end

        -- Knob
        local hover = self:IsHovered() or self:GetDragging()
        local kR = hover and 6 or 5
        local kX = 1 + fillW
        kX = math.Clamp(kX, 1 + kR, w - 1 - kR)
        local kY = math.floor(h * 0.5)

        -- shadow
        surface.SetDrawColor(0,0,0,120)
        draw.RoundedBox( kR, kX - kR, kY - kR + 1, kR*2, kR*2, Color(0,0,0,80) )

        local kc = ultimate.Colors[80]
        draw.RoundedBox( kR, kX - kR, kY - kR, kR*2, kR*2, Color(kc.r, kc.g, kc.b, hover and 255 or 230) )
    end
    
    vgui.Register("USlider", PANEL, "Panel")
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock(TOP)
        self:DockMargin(4,4,4,0)

        self:SetTextColor(ultimate.Colors[165])
        self:SetFont("DermaSmall")
    end

    function PANEL:Paint(w,h)
        if self:IsHovered() then
            surface.SetDrawColor(ultimate.Colors[35])
            surface.DrawRect(0, 0, w, h)
        end

        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)    
    end

    vgui.Register( "UButton", PANEL, "DButton" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock(TOP)
        self:DockMargin(1,1,1,0)

        self:SetTextColor(ultimate.Colors[245])
        self:SetFont("DermaSmall")
    end

    function PANEL:Paint(w,h)
        if self:IsHovered() then
            surface.SetDrawColor(ultimate.Colors[35])
            surface.DrawRect(0, 0, w, h)
        end
    end

    vgui.Register( "UESPPButton", PANEL, "DButton" )
end
do
    local PANEL = {}

    function PANEL:Init()
        self:SetTall(20)
        self.DropButton.Paint = nil
    end

    function PANEL:Paint(w,h)
        surface.SetDrawColor(ultimate.Colors[25])
        surface.DrawRect(0,0,w,h)
    
        surface.SetDrawColor(ultimate.Colors[32])
        surface.DrawRect(w-25,0,25,25)
    
        surface.SetTextColor(ultimate.Colors[222])
        surface.SetTextPos(w-20,20/2-15/2)
        surface.SetFont("DermaSmall")
        surface.DrawText("▼")

        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h)
    end

    function PANEL:OpenMenu( pControlOpener )
    

        if ( pControlOpener && pControlOpener == self.TextEntry ) then
            return
        end
    
        -- Don't do anything if there aren't any options..
        if ( #self.Choices == 0 ) then return end
    
        -- If the menu still exists and hasn't been deleted
        -- then just close it and don't open a new one.
        if ( IsValid( self.Menu ) ) then
            self.Menu:Remove()
            self.Menu = nil
        end
    
        -- If we have a modal parent at some level, we gotta parent to that or our menu items are not gonna be selectable
        local parent = self
        while ( IsValid( parent ) && !parent:IsModal() ) do
            parent = parent:GetParent()
        end
    
        self.Menu = DermaMenu( false, parent )

        function self.Menu:Paint(w,h)
            local r = 6
            local bg = ultimate.Colors[24]
            local ol = ultimate.Colors[54]
            -- shadow
            surface.SetDrawColor(0,0,0,80)
            surface.DrawRect(3,3,w, h)
            -- body
            draw.RoundedBox(r, 0, 0, w, h, bg)
            surface.SetDrawColor(ol)
            surface.DrawOutlinedRect(0,0,w,h)
            surface.SetDrawColor(ol.r,ol.g,ol.b,60)
            surface.DrawOutlinedRect(0,0,w,h,2)
        end

        local combo = self
        local total = #self.Choices
        for k, v in pairs( self.Choices ) do
            local option = self.Menu:AddOption( v, function() combo:ChooseOption( v, k ) end )
            option.txt = option:GetText()
            option:SetText("")
            option:SetTall(22)
            option.IsFirst = (k == 1)
            option.IsLast  = (k == total)

            function option:Paint(w,h)
                local hovered = self:IsHovered()
                -- selection check against outer combo text to avoid nil Owner
                local selected = (self.txt or option.txt) == combo:GetText()

                local bg = hovered and ultimate.Colors[32] or ultimate.Colors[28]
                local r = 6
                draw.RoundedBoxEx(r, 1, 1, w-2, h-2, bg, self.IsFirst, self.IsLast, self.IsLast, self.IsFirst)

                -- left accent for hover/selected
                local acc = ultimate.Colors[80]
                local accA = selected and 200 or (hovered and 160 or 0)
                if accA > 0 then
                    surface.SetDrawColor(acc.r, acc.g, acc.b, accA)
                    surface.DrawRect(2, 2, 3, h-4)
                end

                -- text
                surface.SetTextColor(ultimate.Colors[165])
                surface.SetTextPos( 10, 4 ) 
                surface.DrawText( option.txt ) 

                -- checkmark for selected
                if selected then
                    local cx = w - 12
                    local cy = h/2
                    surface.SetDrawColor(ultimate.Colors[165])
                    surface.DrawLine(cx-4, cy, cx-1, cy+3)
                    surface.DrawLine(cx-1, cy+3, cx+4, cy-3)
                end
            end   

            if ( self.Spacers[ k ] ) then
                self.Menu:AddSpacer()
            end
        end

    
        local x, y = self:LocalToScreen( 0, self:GetTall() )
    
        self.Menu:SetMinimumWidth( self:GetWide() )
        self.Menu:Open( x, y, false, self )

        -- Animate open: fade in, grow height, slight slide
        self.Menu:PerformLayout()
        local fullW, fullH = self.Menu:GetWide(), self.Menu:GetTall()
        self.Menu:SetAlpha(0)
        self.Menu:SetTall(1)
        self.Menu:SetPos(x, y - 4)
        self.Menu:AlphaTo(255, 0.12, 0)
        self.Menu:SizeTo(fullW, fullH, 0.12, 0, -1)
        self.Menu:MoveTo(x, y, 0.12, 0, -1)
    
        self:OnMenuOpened( self.Menu )
    
    end
    
    function PANEL:PerformLayout(s)
        self:SetTextColor(ultimate.Colors[165])
        self:SetFont("DermaSmall")
        self:SetTextInset(10,0)
        self:SetTall(22)
    end

    function PANEL:Paint(w,h)
        local opened  = (self.Menu and self.Menu:IsVisible())
        local hovered = self:IsHovered() or opened

        -- Animations
        self._hover = Lerp(FrameTime()*12, self._hover or 0, hovered and 1 or 0)
        self._open  = Lerp(FrameTime()*12, self._open  or 0, opened and 1 or 0)

        -- Colors
        local baseC   = ultimate.Colors[26]
        local hoverC  = ultimate.Colors[42]
        local outline = ultimate.Colors[54]
        local acc     = ultimate.Colors[80]

        local r = 6
        local br = Color(
            baseC.r + (hoverC.r - baseC.r) * self._hover,
            baseC.g + (hoverC.g - baseC.g) * self._hover,
            baseC.b + (hoverC.b - baseC.b) * self._hover,
            235
        )

        -- Background
        draw.RoundedBox(r, 0, 0, w, h, br)

        -- Top highlight and bottom shadow for depth
        surface.SetDrawColor(255,255,255,20)
        surface.DrawRect(1, 1, w-2, 1)
        surface.SetDrawColor(0,0,0,35)
        surface.DrawRect(1, h-2, w-2, 1)

        -- Accent stripe on the left (animated width)
        local accW = 2 + math.floor(4 * self._hover)
        surface.SetDrawColor(acc.r, acc.g, acc.b, 180)
        surface.DrawRect(1, 1, accW, h-2)

        -- Right arrow container with divider
        local aw = 22
        local rc = Color( math.max(0, br.r-8), math.max(0, br.g-8), math.max(0, br.b-8), 240 )
        draw.RoundedBoxEx(r, w-aw, 0, aw, h, rc, false, true, false, true)
        surface.SetDrawColor(outline)
        surface.DrawLine(w-aw, 1, w-aw, h-1)

        -- Rounded outline/glow (no square corners)
        local olpha = 200 + math.floor(55 * self._open)
        draw.RoundedBox(r, 0, 0, w, h, Color(outline.r, outline.g, outline.b, olpha))
        draw.RoundedBox(r, 1, 1, w-2, h-2, br)
        draw.RoundedBox(r, 0, 0, w, h, Color(outline.r, outline.g, outline.b, 80))
        draw.RoundedBox(r, 2, 2, w-4, h-4, br)

        -- Arrow (rotates when opened)
        local ax = w - math.floor(aw/2)
        local ay = math.floor(h * 0.5)
        local off = math.floor(2 * (1 - self._open))
        surface.SetDrawColor(ultimate.Colors[165])
        if self._open > 0.5 then
            -- Up chevron
            surface.DrawPoly({
                {x = ax - 5, y = ay + 1},
                {x = ax,     y = ay - 4},
                {x = ax + 5, y = ay + 1},
            })
        else
            -- Down chevron
            surface.DrawPoly({
                {x = ax - 5, y = ay - 2 + off},
                {x = ax,     y = ay + 3 + off},
                {x = ax + 5, y = ay - 2 + off},
            })
        end
    end

    vgui.Register( "UComboBox", PANEL, "DComboBox" )
end




do
    local PANEL = {}

    AccessorFunc( PANEL, "m_iSelectedNumber", "SelectedNumber" )

    function PANEL:Init()

        self:SetSelectedNumber( 0 )
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall( 18 )
        self:SetWide( 75 )
    end

    function PANEL:UpdateText()

        local str = input.GetKeyName( self:GetSelectedNumber() )
        if ( !str ) then str = "" end

        str = language.GetPhrase( str )

        self:SetText( "["..str.."]" )
        self:SetTextColor(ultimate.Colors[202])
        self:SetFont("DermaSmall")
    end

    function PANEL:Paint(w,h)
        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)
    end

    function PANEL:DoClick()

        self:SetText( "PRESS A KEY" )
        input.StartKeyTrapping()
        self.Trapping = true

    end

    function PANEL:DoRightClick()

        self:SetText( "[]" )
        self:SetValue( 0 )

    end

    function PANEL:SetSelectedNumber( iNum )

        self.m_iSelectedNumber = iNum
        self:UpdateText()
        self:OnChange( iNum )

    end

    function PANEL:Think()

        if ( input.IsKeyTrapping() && self.Trapping ) then

            local code = input.CheckKeyTrapping()
            if ( code ) then

                if ( code == KEY_ESCAPE ) then

                    self:SetValue( self:GetSelectedNumber() )

                else

                    self:SetValue( code )

                end

                self.Trapping = false

            end

        end

    end

    function PANEL:SetValue( iNumValue )

        self:SetSelectedNumber( iNumValue )

    end

    function PANEL:GetValue()

        return self:GetSelectedNumber()

    end

    function PANEL:OnChange()
    end

    vgui.Register( "UBinder", PANEL, "DButton" )
end

do
    local PANEL = {}

    PANEL.Color = Color(255,255,255,255)

    function PANEL:Init()
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall(18)
        self:SetWide(18)
        
        self:SetText("")
    end

    function PANEL:Paint(w,h)
        if self.Color.a < 255 then
            surface.SetDrawColor( ultimate.Colors[255] )
            surface.SetMaterial( ultimate.Materials["Alpha grid"] )
            surface.DrawTexturedRect( 0, 0, w, h )
        end

        surface.SetDrawColor(self.Color)
        surface.DrawRect(0,0,w,h)
    end

    vgui.Register( "UCPicker", PANEL, "DButton" )
end

do
    local PANEL = {}

    PANEL.lifeTime = 0

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[ 25 ] )
        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    function PANEL:Init()
        self:RequestFocus()
        self:MakePopup()
    end

    function PANEL:Think()
        if self.lifeTime < 15 then self.lifeTime = self.lifeTime + 1 end

        if not self:HasFocus() and self.lifeTime >= 14 then
            self:Remove()
        end
    end

    vgui.Register( "ULifeTimeBase", PANEL, "EditablePanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:SetSize(200,200)
    end 

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[ 25 ] )
        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    vgui.Register( "UColorPanel", PANEL, "ULifeTimeBase" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( FILL )
        self:DockPadding(5, 5, 5, 5)
        self:SetPalette( false )
        self:SetWangs( false )
    end

    vgui.Register( "UColorMixer", PANEL, "DColorMixer" )
end

do
    local PANEL = {}

    AccessorFunc( PANEL, "m_bDirty", "Dirty", FORCE_BOOL )
    AccessorFunc( PANEL, "m_bSortable", "Sortable", FORCE_BOOL )

    AccessorFunc( PANEL, "m_iHeaderHeight", "HeaderHeight" )
    AccessorFunc( PANEL, "m_iDataHeight", "DataHeight" )

    AccessorFunc( PANEL, "m_bMultiSelect", "MultiSelect" )
    AccessorFunc( PANEL, "m_bHideHeaders", "HideHeaders" )

    function PANEL:Init()
        self:SetSortable( true )
        self:SetMouseInputEnabled( true )
        self:SetMultiSelect( true )
        self:SetHideHeaders( false )

        self:SetPaintBackground( true )
        self:SetHeaderHeight( 16 )
        self:SetDataHeight( 17 )

        self.Columns = {}

        self.Lines = {}
        self.Sorted = {}

        self:SetDirty( true )

        self.pnlCanvas = vgui.Create( "Panel", self )

        self.VBar = vgui.Create( "DVScrollBar", self )
        self.VBar:SetZPos( 20 )
    end

    function PANEL:DisableScrollbar()

        if ( IsValid( self.VBar ) ) then
            self.VBar:Remove()
        end

        self.VBar = nil

    end

    function PANEL:GetLines()
        return self.Lines
    end

    function PANEL:GetInnerTall()
        return self:GetCanvas():GetTall()
    end

    function PANEL:GetCanvas()
        return self.pnlCanvas
    end

    function PANEL:AddColumn( strName, iPosition )

        if ( iPosition ) then
            if ( iPosition <= 0 ) then
                ErrorNoHaltWithStack( "Attempted to insert column at invalid position ", iPosition )
                return
            end
        
            if ( IsValid( self.Columns[ iPosition ] ) ) then
                ErrorNoHaltWithStack( "Attempted to insert duplicate column." )
                return
            end
        end

        local pColumn = nil

        if ( self.m_bSortable ) then
            pColumn = vgui.Create( "DListView_Column", self )
        else
            pColumn = vgui.Create( "DListView_ColumnPlain", self )
        end

        pColumn:SetName( strName )
        pColumn:SetZPos( 10 )

        if ( iPosition ) then

            table.insert( self.Columns, iPosition, pColumn )

            local i = 1
            for id, pnl in pairs( self.Columns ) do
                pnl:SetColumnID( i )
                i = i + 1
            end

        else

            local ID = table.insert( self.Columns, pColumn )
            pColumn:SetColumnID( ID )

        end

        self:InvalidateLayout()

        return pColumn

    end

    function PANEL:RemoveLine( LineID )

        local Line = self:GetLine( LineID )
        local SelectedID = self:GetSortedID( LineID )

        self.Lines[ LineID ] = nil
        table.remove( self.Sorted, SelectedID )

        self:SetDirty( true )
        self:InvalidateLayout()

        Line:Remove()

    end

    function PANEL:ColumnWidth( i )

        local ctrl = self.Columns[ i ]
        if ( !ctrl ) then return 0 end

        return ctrl:GetWide()

    end

    function PANEL:FixColumnsLayout()

        local NumColumns = table.Count( self.Columns )
        if ( NumColumns == 0 ) then return end

        local AllWidth = 0
        for k, Column in pairs( self.Columns ) do
            AllWidth = AllWidth + math.ceil( Column:GetWide() )
        end

        local ChangeRequired = self.pnlCanvas:GetWide() - AllWidth
        local ChangePerColumn = math.floor( ChangeRequired / NumColumns )
        local Remainder = ChangeRequired - ( ChangePerColumn * NumColumns )

        for k, Column in pairs( self.Columns ) do

            local TargetWidth = math.ceil( Column:GetWide() ) + ChangePerColumn
            Remainder = Remainder + ( TargetWidth - Column:SetWidth( TargetWidth ) )

        end

        local TotalMaxWidth = 0

        -- If there's a remainder, try to palm it off on the other panels, equally
        while ( Remainder != 0 ) do

            local PerPanel = math.floor( Remainder / NumColumns )

            for k, Column in pairs( self.Columns ) do

                Remainder = math.Approach( Remainder, 0, PerPanel )

                local TargetWidth = math.ceil( Column:GetWide() ) + PerPanel
                Remainder = Remainder + ( TargetWidth - Column:SetWidth( TargetWidth ) )

                if ( Remainder == 0 ) then break end

                TotalMaxWidth = TotalMaxWidth + math.ceil( Column:GetMaxWidth() )

            end

            -- Total max width of all the columns is less than the width of the DListView, abort!
            if ( TotalMaxWidth < self.pnlCanvas:GetWide() ) then break end

            Remainder = math.Approach( Remainder, 0, 1 )

        end

        -- Set the positions of the resized columns
        local x = 0
        for k, Column in pairs( self.Columns ) do

            Column.x = x
            x = x + math.ceil( Column:GetWide() )

            Column:SetTall( math.ceil( self:GetHeaderHeight() ) )
            Column:SetVisible( !self:GetHideHeaders() )

        end

    end
    function PANEL:PerformLayout()

        -- Do Scrollbar
        local Wide = self:GetWide()
        local YPos = 0

        if ( IsValid( self.VBar ) ) then

            self.VBar:SetPos( self:GetWide() - 16, 0 )
            self.VBar:SetSize( 16, self:GetTall() )
            self.VBar:SetUp( self.VBar:GetTall() - self:GetHeaderHeight(), self.pnlCanvas:GetTall() )
            YPos = self.VBar:GetOffset()

            if ( self.VBar.Enabled ) then Wide = Wide - 16 end

        end

        if ( self.m_bHideHeaders ) then
            self.pnlCanvas:SetPos( 0, YPos )
        else
            self.pnlCanvas:SetPos( 0, YPos + self:GetHeaderHeight() )
        end

        self.pnlCanvas:SetSize( Wide, self.pnlCanvas:GetTall() )

        self:FixColumnsLayout()

        --
        -- If the data is dirty, re-layout
        --
        if ( self:GetDirty() ) then

            self:SetDirty( false )
            local y = self:DataLayout()
            self.pnlCanvas:SetTall( y )

            -- Layout again, since stuff has changed..
            self:InvalidateLayout( true )

        end

    end

    function PANEL:OnScrollbarAppear()

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:OnRequestResize( SizingColumn, iSize )

        -- Find the column to the right of this one
        local Passed = false
        local RightColumn = nil
        for k, Column in pairs( self.Columns ) do

            if ( Passed ) then
                RightColumn = Column
                break
            end

            if ( SizingColumn == Column ) then Passed = true end

        end

        -- Alter the size of the column on the right too, slightly
        if ( RightColumn ) then

            local SizeChange = SizingColumn:GetWide() - iSize
            RightColumn:SetWide( RightColumn:GetWide() + SizeChange )

        end

        SizingColumn:SetWide( iSize )
        self:SetDirty( true )

        -- Invalidating will munge all the columns about and make it right
        self:InvalidateLayout()

    end

    function PANEL:DataLayout()

        local y = 0
        local h = self.m_iDataHeight

        local alt = false
        for k, Line in ipairs( self.Sorted ) do

            if ( !Line:IsVisible() ) then continue end

            Line:SetPos( 1, y )
            Line:SetSize( self:GetWide() - 2, h )
            Line:DataLayout( self )

            Line:SetAltLine( alt )
            alt = !alt

            y = y + Line:GetTall()

        end

        return y

    end

    PANEL.Cur = true
    function PANEL:AddLine( ... )

        self.Cur = not self.Cur

        self:SetDirty( true )
        self:InvalidateLayout()

        local Line = vgui.Create( "DListView_Line", self.pnlCanvas )
        local c = self.Cur and 48 or 32

        function Line:Paint( w, h )
            
            surface.SetDrawColor( c, c, c )
            surface.DrawRect( 0, 0, w, h )
        end

        local ID = table.insert( self.Lines, Line )

        Line:SetListView( self )
        Line:SetID( ID )

        -- This assures that there will be an entry for every column
        for k, v in pairs( self.Columns ) do
            Line:SetColumnText( k, "" )
        end

        for k, v in pairs( {...} ) do
            Line:SetColumnText( k, v )
        end

        -- Make appear at the bottom of the sorted list
        local SortID = table.insert( self.Sorted, Line )

        if ( SortID % 2 == 1 ) then
            Line:SetAltLine( true )
        end

        return Line

    end

    function PANEL:OnMouseWheeled( dlta )

        if ( !IsValid( self.VBar ) ) then return end

        return self.VBar:OnMouseWheeled( dlta )

    end

    function PANEL:ClearSelection( dlta )

        for k, Line in pairs( self.Lines ) do
            Line:SetSelected( false )
        end

    end

    function PANEL:GetSelectedLine()

        for k, Line in pairs( self.Lines ) do
            if ( Line:IsSelected() ) then return k, Line end
        end

    end

    function PANEL:GetLine( id )

        return self.Lines[ id ]

    end

    function PANEL:GetSortedID( line )

        for k, v in pairs( self.Sorted ) do

            if ( v:GetID() == line ) then return k end

        end

    end

    function PANEL:OnClickLine( Line, bClear )

        local bMultiSelect = self:GetMultiSelect()
        if ( !bMultiSelect && !bClear ) then return end

        --
        -- Control, multi select
        --
        if ( bMultiSelect && input.IsKeyDown( KEY_LCONTROL ) ) then
            bClear = false
        end

        --
        -- Shift block select
        --
        if ( bMultiSelect && input.IsKeyDown( KEY_LSHIFT ) ) then

            local Selected = self:GetSortedID( self:GetSelectedLine() )
            if ( Selected ) then

                local LineID = self:GetSortedID( Line:GetID() )

                local First = math.min( Selected, LineID )
                local Last = math.max( Selected, LineID )

                -- Fire off OnRowSelected for each non selected row
                for id = First, Last do
                    local line = self.Sorted[ id ]
                    if ( !line:IsLineSelected() ) then self:OnRowSelected( line:GetID(), line ) end
                    line:SetSelected( true )
                end

                -- Clear the selection and select only the required rows
                if ( bClear ) then self:ClearSelection() end

                for id = First, Last do
                    local line = self.Sorted[ id ]
                    line:SetSelected( true )
                end

                return

            end

        end

        --
        -- Check for double click
        --
        if ( Line:IsSelected() && Line.m_fClickTime && ( !bMultiSelect || bClear ) ) then

            local fTimeDistance = SysTime() - Line.m_fClickTime

            if ( fTimeDistance < 0.3 ) then
                self:DoDoubleClick( Line:GetID(), Line )
                return
            end

        end

        --
        -- If it's a new mouse click, or this isn't
        -- multiselect we clear the selection
        --
        if ( !bMultiSelect || bClear ) then
            self:ClearSelection()
        end

        if ( Line:IsSelected() ) then return end

        Line:SetSelected( true )
        Line.m_fClickTime = SysTime()

        self:OnRowSelected( Line:GetID(), Line )

    end

    function PANEL:SortByColumns( c1, d1, c2, d2, c3, d3, c4, d4 )

        table.Copy( self.Sorted, self.Lines )

        table.sort( self.Sorted, function( a, b )

            if ( !IsValid( a ) ) then return true end
            if ( !IsValid( b ) ) then return false end

            if ( c1 && a:GetColumnText( c1 ) != b:GetColumnText( c1 ) ) then
                if ( d1 ) then a, b = b, a end
                return a:GetColumnText( c1 ) < b:GetColumnText( c1 )
            end

            if ( c2 && a:GetColumnText( c2 ) != b:GetColumnText( c2 ) ) then
                if ( d2 ) then a, b = b, a end
                return a:GetColumnText( c2 ) < b:GetColumnText( c2 )
            end

            if ( c3 && a:GetColumnText( c3 ) != b:GetColumnText( c3 ) ) then
                if ( d3 ) then a, b = b, a end
                return a:GetColumnText( c3 ) < b:GetColumnText( c3 )
            end

            if ( c4 && a:GetColumnText( c4 ) != b:GetColumnText( c4 ) ) then
                if ( d4 ) then a, b = b, a end
                return a:GetColumnText( c4 ) < b:GetColumnText( c4 )
            end

            return true
        end )

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:SortByColumn( ColumnID, Desc )

        table.Copy( self.Sorted, self.Lines )

        table.sort( self.Sorted, function( a, b )

            if ( Desc ) then
                a, b = b, a
            end

            local aval = a:GetSortValue( ColumnID ) || a:GetColumnText( ColumnID )
            local bval = b:GetSortValue( ColumnID ) || b:GetColumnText( ColumnID )

            -- Maintain nicer sorting for numbers
            if ( isnumber( aval ) && isnumber( bval ) ) then return aval < bval end

            return tostring( aval ) < tostring( bval )

        end )

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:SelectItem( Item )

        if ( !Item ) then return end

        Item:SetSelected( true )
        self:OnRowSelected( Item:GetID(), Item )

    end

    function PANEL:SelectFirstItem()

        self:ClearSelection()
        self:SelectItem( self.Sorted[ 1 ] )

    end

    function PANEL:DoDoubleClick( LineID, Line )

        -- For Override

    end

    function PANEL:OnRowSelected( LineID, Line )

        -- For Override

    end

    function PANEL:OnRowRightClick( LineID, Line )

        -- For Override

    end

    function PANEL:Clear()

        for k, v in pairs( self.Lines ) do
            v:Remove()
        end

        self.Lines = {}
        self.Sorted = {}

        self:SetDirty( true )

    end

    function PANEL:GetSelected()

        local ret = {}

        for k, v in pairs( self.Lines ) do
            if ( v:IsLineSelected() ) then
                table.insert( ret, v )
            end
        end

        return ret

    end

    function PANEL:SizeToContents()

        self:SetHeight( self.pnlCanvas:GetTall() + self:GetHeaderHeight() )

    end

    vgui.Register( "UListView", PANEL, "DPanel" )
end


do
    local PANEL = {}

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[24] )
        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    vgui.Register( "USettingsPanel", PANEL, "ULifeTimeBase" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall( 20 )
        self:SetWide( 20 )
        self:SetText( "" )
        self._hover = 0
    end

    function PANEL:PerformLayout(w,h)
        self:SetTall( 20 )
        self:SetWide( 20 )
    end

    function PANEL:Paint(w,h)
        local hovered = self:IsHovered()
        self._hover = Lerp(FrameTime()*12, self._hover or 0, hovered and 1 or 0)
        self._press = Lerp(FrameTime()*12, self._press or 0, self.Depressed and 1 or 0)

        local base   = ultimate.Colors[28]
        local hoverC = ultimate.Colors[42]
        local outline= ultimate.Colors[54]
        local accent = ultimate.Colors[80]
        -- dynamic accent-fill body (restored)
        local r = 6
        local lerpBg = Color(
            base.r + (accent.r - base.r) * self._hover,
            base.g + (accent.g - base.g) * self._hover,
            base.b + (accent.b - base.b) * self._hover,
            225
        )
        draw.RoundedBox(r, 0, 0, w, h, lerpBg)

        -- inner inset for depth
        draw.RoundedBox(r, 1, 1, w-2, h-2, Color(0,0,0, 14))
        draw.RoundedBox(r, 2, 2, w-4, h-4, lerpBg)

        -- border brightens on hover
        local oA = 90 + math.floor(130 * self._hover)
        surface.SetDrawColor(outline.r, outline.g, outline.b, oA)
        surface.DrawOutlinedRect(0,0,w,h,1)

        -- press overlay (subtle)
        if self._press > 0.01 then
            draw.RoundedBox(r, 1, 1, w-2, h-2, Color(0,0,0, 50 * self._press))
        end

        -- three horizontal lines (hamburger), invert on strong hover
        local cx = math.floor(w*0.5)
        local cy = math.floor(h*0.5) + math.floor(self._press)
        local inv = self._hover > 0.5
        local lineCol = inv and Color(20,20,20, 235) or ultimate.Colors[165]
        surface.SetDrawColor(lineCol)
        local lineW, lineH = 10, 1
        local startX = cx - math.floor(lineW/2)
        draw.RoundedBox(1, startX,     cy-5, lineW, lineH, lineCol)
        draw.RoundedBox(1, startX,     cy-1, lineW, lineH, lineCol)
        draw.RoundedBox(1, startX,     cy+3, lineW, lineH, lineCol)
   end

    vgui.Register( "USPanelButton", PANEL, "UButton" )
end

do
    local PANEL = {}

    function PANEL:Init()

        self.ButtonPanel = vgui.Create( "DPanel", self )
        self.ButtonPanel:Dock( TOP )
        self.ButtonPanel:DockMargin(3,3,3,2)
        self.ButtonPanel:SetTall(18)

        self.ItemPanel = vgui.Create( "DPanel", self )
        self.ItemPanel:Dock( FILL )
        self.ItemPanel:DockMargin( 3, 0, 3, 3 )

        self.ButtonPanel.Paint = nil
        self.ItemPanel.Paint = nil

        self.ActiveTab = "NIL"

        function self.ItemPanel:OnMousePressed()
            ultimate.frame:OnMousePressed()
        end
    
        function self.ItemPanel:OnMouseReleased()
            ultimate.frame:OnMouseReleased()
        end
    end

    function PANEL:Paint( w, h )
    surface.SetDrawColor( ultimate.Colors[54] )
    surface.DrawOutlinedRect( 0, 0, w, h, 1 )

    -- Верхняя область для заголовка
    local headerH = 28
    draw.RoundedBox(6, 0, 0, w, headerH, Color(30,30,40,180))
    surface.SetFont( "veranda_scr" )
    surface.SetTextColor( Color(180,180,220) )
    -- Строго левый верхний угол, без центрирования
    surface.SetTextPos(4, 0)
    surface.DrawText(self.txt)

    -- линия под заголовком
    surface.SetDrawColor( ultimate.Colors[54] )
    surface.DrawRect( 6, headerH-2, w - 12, 1 )
    end

    function PANEL:OnMousePressed()
        ultimate.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        ultimate.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end

    function PANEL:GetButtonPanel()
        return self.ButtonPanel
    end

    vgui.Register( "UButtonBarPanel", PANEL, "Panel" )
end




// GUI FUNCS

ultimate.ui.ColorWindow = false
ultimate.ui.SettingsPan = false
ultimate.ui.MultiComboP = false
function ultimate.ui.RemovePanel( pan )
    if not pan then return end 

    pan:Remove()
    pan = false
end

function ultimate.ui.Binder( cfg, par )
    local b = vgui.Create( "UBinder", par )
    b:SetValue( ultimate.cfg.binds[ cfg ] )

    function b:OnChange()
        ultimate.cfg.binds[ cfg ] = b:GetValue()
    end

    return b
end

function ultimate.ui.ColorPicker( cfg, par, onChange )
    local b = vgui.Create( "UCPicker", par )

    function b:DoClick()
        local x, y = self:LocalToScreen( 0, self:GetTall() )

        ultimate.ui.RemovePanel( ultimate.ui.ColorWindow )

        ultimate.ui.ColorWindow = vgui.Create( "UColorPanel" )
        ultimate.ui.ColorWindow:SetPos( x+25, y-100 )

        local c = vgui.Create( "UColorMixer", ultimate.ui.ColorWindow )
        c:SetColor( string.ToColor( ultimate.cfg.colors[cfg] ) )

        c.HSV.Knob:SetSize( 5, 5 )

        function c.HSV.Knob:Paint( w, h )
            surface.SetDrawColor( b.Color )
            surface.DrawRect( 0, 0, w, h )

            surface.SetDrawColor( ultimate.Colors[165] )
            surface.DrawOutlinedRect( 0, 0, w, h, 1 )
        end

        function c:ValueChanged( col )
            b.Color = col 
            ultimate.cfg.colors[cfg] = tostring(col.r) .. " " .. tostring(col.g) .. " " .. tostring(col.b) .. " " .. tostring(col.a)
            if onChange then onChange( col ) end
        end

    end

    b.Color = string.ToColor( ultimate.cfg.colors[cfg] )
end

function ultimate.ui.SPanel( func, p )
    local b = vgui.Create( "USPanelButton", p )

    function b:DoClick()
        local mx, my = input.GetCursorPos()

        ultimate.ui.RemovePanel( ultimate.ui.SettingsPan )

        local sx, sy = mx + 25, my - 10
        ultimate.ui.SettingsPan = vgui.Create( "USettingsPanel" )
        local pan = ultimate.ui.SettingsPan

        -- prepare for animation: start slightly higher and transparent
        pan:SetAlpha( 0 )
        pan:SetPos( sx, sy - 8 )

        -- populate contents
        func()

        -- animate to final position and opacity
        pan:MoveTo( sx, sy, 0.18, 0, 0.3 )
        pan:AlphaTo( 255, 0.18, 0 )
    end
end

function ultimate.ui.Label( pan, str, postCreate )
    local p = vgui.Create( "UCBPanel", pan )

    local lbl = vgui.Create( "DLabel", p )
    lbl:SetText( str )
    lbl:SetFont( "DermaSmall" )
    lbl:SetTextColor( ultimate.Colors[165] )
    lbl:Dock( LEFT )
    lbl:DockMargin( 4, 2, 4, 0 )
    lbl:SizeToContents()

    if postCreate then postCreate( p ) end
end
    
function ultimate.ui.CheckBox( par, lbl, cfg, hint, bind, color, spanel, onToggle, postCreate )
    local p = vgui.Create( "UCBPanel", par )

    local c = vgui.Create( "UCheckboxLabel", p )
    c:SetText( lbl )
    c:SetPos( 0, 0 )
    c:SetValue( ultimate.cfg.vars[cfg] )

    function c:OnChange( bval )
        ultimate.cfg.vars[cfg] = bval

        if onToggle then onToggle(bval) end

        -- play subtle UI sound on toggle
        if bval then
            surface.PlaySound("buttons/button14.wav")
        else
            surface.PlaySound("buttons/button9.wav")
        end
    end

    if postCreate then postCreate( p ) end

    if bind then ultimate.ui.Binder( cfg, p ) end
    if color then ultimate.ui.ColorPicker( cfg, p ) end
    if spanel then ultimate.ui.SPanel( spanel, p ) end

    if hint then
        function c.Label:Paint()
            if self:IsHovered() then
                local x, y = input.GetCursorPos()

                ultimate.hint = true
                ultimate.hintText = hint
                ultimate.hintX = x + 45
                ultimate.hintY = y - 5
            end
        end
    end
end

function ultimate.ui.Slider( p, str, cfg, min, max, dec, onChange )
    local pan = vgui.Create( "DPanel", p )
    pan:Dock( TOP )
    pan:DockMargin( 4, 2, 4, 0 )
    pan:SetTall( 20 )

    function pan:Paint( w, h )
        surface.SetFont("DermaSmall")

    local s = tostring(ultimate.cfg.vars[cfg] or "")
    local tw, th = surface.GetTextSize(s)
        
        surface.SetTextColor( ultimate.Colors[165] )

        surface.SetTextPos( 2, 4 ) 
    surface.DrawText( tostring(str or "") ) 

    surface.SetTextPos( w - tw - 2, 4 ) 
    surface.DrawText( tostring(ultimate.cfg.vars[cfg] or "") ) 
    end

    local c = vgui.Create( "USlider", p )
    c:Dock( TOP )
    c:DockMargin( 4, 2, 4, 0 )
    c:SetTall(18)
    c:SetMax( max )
    c:SetMin( min )
    c:SetDecimals( dec )

    c:SetValue( ultimate.cfg.vars[cfg] )

    local value, min, max = c:GetValue(), c:GetMin(), c:GetMax()

    value = tonumber(value) or 0
    min = tonumber(min) or 0
    max = tonumber(max) or 1
    c:SetSlideX((value - min) / (max - min))

    function c:OnValueChanged( val )
        ultimate.cfg.vars[cfg] = val

        if onChange then onChange(val) end
    end
end

function ultimate.ui.Button( str, func, p ) 
    local b = vgui.Create( "UButton", p )
    b:SetText( str )

    -- subtle hover animation
    b:SetAlpha( 230 )
    function b:OnCursorEntered()
        self:AlphaTo( 255, 0.12, 0 )
        surface.PlaySound("buttons/lightswitch2.wav")
    end
    function b:OnCursorExited()
        self:AlphaTo( 230, 0.12, 0 )
    end

    function b:DoClick()
        surface.PlaySound("buttons/button14.wav")
        func()
    end
end

function ultimate.ui.TextEntry( str, cfg, pan, chars, postCreate )
    local lbl = vgui.Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,2,4,0)
    lbl:SetText(str)
    lbl:SetFont("DermaSmall")
    lbl:SetColor(ultimate.Colors[165])

    local p = vgui.Create("DPanel",pan)
    p:SetTall(25)
    p:Dock(TOP)
    p:DockMargin(4,2,4,0)

    p.Paint = function(s,w,h)
        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h)
    end
	
	local txt = vgui.Create("DTextEntry",p)
	txt:Dock(FILL)
	txt:DockMargin(4,4,4,4) 
	txt:IsMultiline( false )
	txt:SetMaximumCharCount(chars)
	txt:SetPlaceholderText(str)
	txt:SetFont( "DermaSmall" )
    txt:SetPaintBackground(false)
    txt:SetTextColor(ultimate.Colors[165])

	if ultimate.cfg.vars[cfg] != nil and ultimate.cfg.vars[cfg] != "" then
		txt:SetValue(ultimate.cfg.vars[cfg])
	end

	function txt.Think()
		if txt:IsEditing() then return end
        if ultimate.cfg.vars[cfg] == txt:GetValue() then return end

		ultimate.cfg.vars[cfg] = txt:GetValue()
	end 

	function txt.OnValueChange()
		ultimate.cfg.vars[cfg] = txt:GetValue()
	end

    if postCreate then postCreate(p) end
end

function ultimate.ui.dropdownButton( str, v, p, a )
    local b = p:Add("DButton")
    b:Dock(TOP)
    b:SetTall(20)
    b:DockMargin(2,2,2,0)
    b:SetText("")
    
    function b:Paint(w,h)
        if self:IsHovered() then 
            surface.SetDrawColor( ultimate.Colors[ 32 ] )
            surface.DrawRect( 1, 1, w - 2, h - 2 )
        end

        surface.SetTextColor(ultimate.Colors[165])

        if ultimate.cfg.vars[str.."-"..v] then
            surface.SetTextColor(ultimate.Colors[235]) 
        end

        surface.SetTextPos(5,3)
        surface.SetFont("DermaSmall")
        surface.DrawText(v)
    end

    function b:DoClick()
        ultimate.cfg.vars[str.."-"..v] = not ultimate.cfg.vars[str.."-"..v] 
    end
end

function ultimate.ui.MultiCombo( pan, str, choices )
    local lbl = vgui.Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("DermaSmall")
    lbl:SetColor(ultimate.Colors[165])

    local d = vgui.Create("DButton",pan)
    d:Dock(TOP)
    d:DockMargin(4,1,4,0)
    d:SetTall(20)
    d:SetText("")
    
    d.preview = {}

    function d:Paint(w,h)
        local preview = ""

        for k, v in pairs(choices) do
            if ultimate.cfg.vars[str.."-"..v] == true and (d.preview[v] == false or d.preview[v] == nil) and not table.HasValue(d.preview, v) then
                table.insert(d.preview,v) 
            elseif ultimate.cfg.vars[str.."-"..v] == false and (d.preview[v] == true or d.preview[v] == nil) and table.HasValue(d.preview, v) then
                table.RemoveByValue(d.preview,v)
            elseif d.preview[v] == false then 
                table.RemoveByValue(d.preview,v)
            end
        end

        preview = table.concat(d.preview,", ")

        surface.SetDrawColor(ultimate.Colors[25])
        surface.DrawRect(0,0,w,h)
    
        surface.SetTextColor(ultimate.Colors[165])
        surface.SetTextPos(8,20/2-15/2)
        surface.SetFont("DermaSmall")
        surface.DrawText(preview)
    
        surface.SetDrawColor(ultimate.Colors[32])
        surface.DrawRect(w-25,0,25,25)
    
        surface.SetTextColor(ultimate.Colors[165])
        surface.SetTextPos(w-20,20/2-15/2)
        surface.SetFont("DermaSmall")
        surface.DrawText("▼")

        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)
    end

    function d:DoClick()
        local x,y = self:LocalToScreen( 0, self:GetTall() )

        ultimate.ui.RemovePanel( ultimate.ui.MultiComboP )

        local ctoh = #choices
    
        ultimate.ui.MultiComboP = vgui.Create( "ULifeTimeBase" )
        ultimate.ui.MultiComboP:SetPos( x, y - 1 )
        ultimate.ui.MultiComboP:SetSize( 243, ctoh * 22 + 2 )
    
        for k, v in pairs(choices) do
            ultimate.ui.dropdownButton( str, v, ultimate.ui.MultiComboP, d.preview )
        end
    end
end

function ultimate.ui.ComboBox( pan, str, cfg, choices )
    local lbl = vgui.Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("DermaSmall")
    lbl:SetColor(ultimate.Colors[165])

    local dropdown = vgui.Create("UComboBox",pan)
    dropdown:Dock(TOP)
    dropdown:DockMargin(4,1,4,0)
    
    if ultimate.presets[ cfg ] then
        choices = ultimate.presets[ cfg ]
    end 
    
    for k, v in ipairs( choices ) do
        dropdown:AddChoice( v )
    end
    
    dropdown:SetSortItems(false)

    if ultimate.cfg.vars[cfg] <= #choices then
        dropdown:ChooseOptionID(ultimate.cfg.vars[cfg])
    else
        dropdown:ChooseOptionID(1)
    end

    function dropdown:OnSelect(index, value, data)
        ultimate.cfg.vars[cfg] = index
    end

    return lbl, dropdown
end

function ultimate.ui.InitMT( p, postCreate )
    p.ItemPanel:Remove()

    p.ItemPanel = vgui.Create( "DPanel", p )
    p.ItemPanel:Dock( FILL )
    p.ItemPanel:DockMargin( 3, 0, 3, 3 )

    p.ItemPanel.Paint = nil

    if postCreate then postCreate( p.ItemPanel ) end
end

function ultimate.ui.MTButton( p, str, postCreate )
    surface.SetFont("DermaSmall")
    local w, h = surface.GetTextSize(str)

    local fw = w + 5

    local tx, ty = fw/2 - w/2, 18 / 2-h / 2 - 1

    local b = p:GetButtonPanel():Add("DButton")
    b:Dock(RIGHT)
    b:DockMargin(2,0,2,1)
    b:SetWide(fw)
    b:SetText("")
    
    function b:DoClick()
        p.ActiveTab = str
        ultimate.ui.InitMT( p, postCreate )
    end

    function b:Paint(width,height)
        if p.ActiveTab == str then
            surface.SetTextColor(235,235,235,255)
        else
            surface.SetTextColor(165,165,165,255)
        end
        
        surface.DrawRect(0,0,width,height)

        surface.SetFont("DermaSmall")
        surface.SetTextPos(tx,ty)
        surface.DrawText(str)
    end

    p.ActiveTab = str
    ultimate.ui.InitMT( p, postCreate )
end

ultimate.pty = { 5, 5, 5 }
do
    local xt = { 
        [1] = 5,
        [2] = 267,
        [3] = 529
    }

    function ultimate.itemPanel( str, tbl, h )
        local p = vgui.Create( "UPanel", ultimate.scrollpanel )
        p:SetPos( xt[tbl], ultimate.pty[tbl] )
        p:SetSize( 257, h )
        p.txt = str

        -- slide and fade-in
        local ox, oy = p:GetPos()
        p:SetAlpha( 0 )
        p:SetPos( ox, oy - 6 )
        p:MoveTo( ox, oy, 0.16, 0, 0.3 )
        p:AlphaTo( 255, 0.16, 0 )

        ultimate.pty[ tbl ] = ultimate.pty[ tbl ] + h + 5

        return p
    end

    function ultimate.itemPanelB( str, tbl, h, buttonsFunc )
        local p = vgui.Create( "UButtonBarPanel", ultimate.scrollpanel )
        p:SetPos( xt[tbl], ultimate.pty[tbl] )
        p:SetSize( 257, h )
        p.txt = str

        -- slide and fade-in
        local ox, oy = p:GetPos()
        p:SetAlpha( 0 )
        p:SetPos( ox, oy - 6 )
        p:MoveTo( ox, oy, 0.16, 0, 0.3 )
        p:AlphaTo( 255, 0.16, 0 )

        if buttonsFunc then buttonsFunc( p ) end

        ultimate.pty[ tbl ] = ultimate.pty[ tbl ] + h + 5

        return p
    end

end

/*
    Drag n drop 
*/

ultimate.espposes = {"Up","Down","Right","Left"}
ultimate.espelements = {"Name pos", "Show Priority pos", "Usergroup pos","Health pos","Armor pos","Money pos","Weapon pos","Team pos","Break LC pos","Simtime pos"}
ultimate.lastdrag = ""
ultimate.esppans = {}

ultimate.esppansposes = {
    [1] = {
        x = 85,
        y = 0,
    },
    [2] = {
        x = 85,
        y = 250,
    },
    [3] = {
        x = 170,
        y = 125,
    },
    [4] = {
        x = 0,
        y = 125,
    },
}

for i = 1, 4 do
    ultimate.esppans[i] = {}
end

function ultimate.DoDrop( self, panels, bDoDrop, Command, x, y )
    if ( bDoDrop ) then
        local newpos = self.pos
        
        for i = 1, #panels do
            local v = panels[i]

            ultimate.cfg.vars[ v:GetText() ] = newpos
            v:SetParent( self )
        end
    end
end
    
ultimate.spfuncs = {}

// PANEL CREATION

ultimate.frame = vgui.Create("UFrame")
ultimate.scrollpanel = vgui.Create("UScroll",ultimate.frame)

-- subtle fade-in for the root frame
if IsValid( ultimate.frame ) then
    ultimate.frame:SetAlpha( 0 )
    timer.Simple( 0, function()
        if IsValid( ultimate.frame ) then
            ultimate.frame:AlphaTo( 255, 0.2, 0 )
        end
    end )
end

ultimate.tabs = {}

// Aimbot

ultimate.spfuncs[30] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Force seed", "Force seed" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Wait for seed", "Wait for seed" )

    
end

ultimate.spfuncs[32] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Max simulation time", "Crossbow max simtime", 1, 10, 2 )

end
function ultimate.tabs.Aimbot()

    local p = ultimate.itemPanel("Main",1,180):GetItemPanel()

    ultimate.ui.CheckBox( p, "Enable Aimbot", "Enable aimbot", false, false, false, false, false, function( p ) ultimate.ui.Binder( "Aim on key", p ) end )
    ultimate.ui.CheckBox( p, "Auto fire", "Auto fire", "Automatically fires when targets can be damaged.", false, false, ultimate.spfuncs[2] )
    ultimate.ui.CheckBox( p, "Auto reload", "Auto reload", "Automatically reloads weapon when clip is empty." )
    ultimate.ui.CheckBox( p, "Silent aim", "Silent aim" )
    ultimate.ui.CheckBox( p, "pSilent", "pSilent", "Make aim completely invisible." )
    ultimate.ui.CheckBox( p, "Knife bot", "Knifebot", false, false, false, ultimate.spfuncs[3] )

    local p = ultimate.itemPanel("Legit",1,100):GetItemPanel()

    ultimate.ui.CheckBox( p, "Aimbot smoothing", "Aimbot smoothing", false, false, false, ultimate.spfuncs[4] )
    ultimate.ui.CheckBox( p, "Fov limit", "Fov limit", false, false, false, ultimate.spfuncs[5] )
    ultimate.ui.CheckBox( p, "Triggerbot", "Trigger bot", false, true )

    local p = ultimate.itemPanel( "Visualisation", 1, 230 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "FOV Circle", "Show FOV", false, false, true, ultimate.spfuncs[911] )
    ultimate.ui.CheckBox( p, "Snapline", "Aimbot snapline", false, false, true, ultimate.spfuncs[912] )
    ultimate.ui.CheckBox( p, "Marker", "Aimbot marker", false, false, true ) 
    ultimate.ui.CheckBox( p, "Box Wall", "Box Wall" )
    ultimate.ui.CheckBox( p, "Kill Effect", "Kill effect" )
    ultimate.ui.CheckBox( p, "Kill Feed", "localkillfeed" )
    ultimate.ui.CheckBox( p, "Hit Log", "HitLog" )
    ultimate.ui.CheckBox( p, "Knifebot Range", "Knifebot Range" )

    local p = ultimate.itemPanel( "Accuracy", 2, 100 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "NoRecoil", "Norecoil" )
    ultimate.ui.CheckBox( p, "NoSpread", "Nospread", "Supported HL2, M9K, FAS2, CW2, SWB", false, false, ultimate.spfuncs[30] )
    ultimate.ui.CheckBox( p, "Try Predict Position", "Try Predict", "WIP")

    local p = ultimate.itemPanel( "Prediction", 2, 250 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Crossbow predict", "Crossbow prediction" )
    ultimate.ui.Slider( p, "Simulation limit", "Simulation limit", 1, 10, 2 )
    ultimate.ui.CheckBox( p, "Smg grenade prediction", "SMG Grenade" )
    ultimate.ui.CheckBox( p, "AR2 Orb Predict", "AR2 Predict" )
    ultimate.ui.CheckBox( p, "Custom predict", "Custom predict", "Предсказание на основе скорости противника" )
    ultimate.ui.Slider( p, "Predict strength", "Custom predict strength", 0.1, 3.0, 1 )
    ultimate.ui.CheckBox( p, "Use gravity", "Custom predict gravity", "Учитывать гравитацию для баллистики" )
    ultimate.ui.CheckBox( p, "Debug visualize", "Custom predict debug", "Показывать линии предикта" )

    local p = ultimate.itemPanel( "Misc", 2, 135 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Auto detonator", "Auto detonator" )
    ultimate.ui.Slider( p, "Detonation distance", "AutoD distance", 16, 128, 0 )
    ultimate.ui.CheckBox( p, "Auto heal", "Auto Heal" )

    local p = ultimate.itemPanel( "Target selection", 3, 265 ):GetItemPanel()

    ultimate.ui.ComboBox( p, "Target selection", "Target selection", { "Distance", "FOV" } )
    ultimate.ui.MultiCombo( p, "Ignores", { "Friends", "Steam friends", "Teammates", "Driver", "Head unhitable", "God time", "Nocliping", "Nodraw", "Frozen", "Bots", "Admins" } )
    ultimate.ui.CheckBox( p, "Auto Wall", "Wallz" ) 
    ultimate.ui.Slider( p, "Max targets", "Max targets", 0, 10, 0 )
    ultimate.ui.Slider( p, "Max distance", "Max distance", 0, 50000, 0 )
    ultimate.ui.CheckBox( p, "Priority List", "Enable Priority List")
    ultimate.ui.CheckBox( p, "Auto Distance", "Auto Distance", "Useful for knifes, birkin and cs:go knifes" )

    local p = ultimate.itemPanel( "Hitbox selection", 3, 280 ):GetItemPanel()

    ultimate.ui.ComboBox( p, "Hitbox selection", "Hitbox selection", { "Head", "Chest", "Stomach" } )
    ultimate.ui.CheckBox( p, "Hitscan", "Hitscan" ) 
    //ultimate.ui.ComboBox( p, "Hitscan mode", { "Damage", "Safety", "Scale" }, "Hitscan mode" )
    ultimate.ui.MultiCombo( p, "Hitscan groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
    ultimate.ui.CheckBox( p, "Multipoint", "Multipoint" ) 
    ultimate.ui.MultiCombo( p, "Multipoint groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
    ultimate.ui.Slider( p, "Multipoint scale min", "Multipoint scale min", 0.5, 1, 1 )
    ultimate.ui.Slider( p, "Multipoint scale max", "Multipoint scale max", 0.5, 1, 1 )
end



ultimate.spfuncs[22] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Lag limit","Lag limit",1,23,0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Random min","Lag randomisation",1,23,0 )
    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Lag mode", "Lag mode", {"Static","Adaptive","Hybrid"})
    ultimate.ui.MultiCombo( ultimate.ui.SettingsPan, "Fake lag options", {"Disable on ladder","Disable in attack","Randomise","On peek"} )
end

ultimate.spfuncs[2229] = function()
    ultimate.ui.SettingsPan:SetSize(250, 90)


    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Resolver mode","Resolver mode", { "Basic","Advanced","Full","Jitter"})

end

ultimate.spfuncs[36] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)
    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "Antiaim material", ultimate.chamsMaterials)
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Antiaim fullbright" )
end 

function ultimate.tabs.Rage()
    local p = ultimate.itemPanel( "Angles", 1, 270 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Enable Anti-Aim", "Anti aim", false, true )
    ultimate.ui.CheckBox( p, "Inverter", "Inverter", false, true )
    ultimate.ui.CheckBox( p, "Edge Aware", "Edge Aware", "Работает только когда стоишь у края!" )
    ultimate.ui.ComboBox( p, "Yaw base", "Yaw base" )
    ultimate.ui.ComboBox( p, "Yaw", "Yaw" )
    ultimate.ui.ComboBox( p, "Pitch", "Pitch" )
    ultimate.ui.ComboBox( p, "Edge", "Edge", { "Disabled", "Hide", "Show", "Jitter" } )

    local p = ultimate.itemPanel( "Tweaks", 1, 145 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "On shot aa", "On shot aa" )
    ultimate.ui.CheckBox( p, "Yaw randomisation", "Yaw randomisation" )
    ultimate.ui.CheckBox( p, "Freestanding", "Freestanding" )
    ultimate.ui.CheckBox( p, "Micromovement", "Micromovement" )
    ultimate.ui.CheckBox( p, "Anti Brute-Force", "Brute Force" )

    local p = ultimate.itemPanel( "Custom angles", 1, 400 ):GetItemPanel()

    ultimate.ui.Slider( p, "Custom real","Custom real", -180, 180, 0 )
    ultimate.ui.Slider( p, "Custom fake","Custom fake", -180, 180, 0 )
    ultimate.ui.Slider( p, "Custom pitch","Custom pitch", -360, 360, 0 )
    ultimate.ui.Slider( p, "Spin speed","Spin speed", -50, 50, 0 )
    ultimate.ui.Slider( p, "Min Lby Delta","LBY min delta", 0, 360, 0 )
    ultimate.ui.Slider( p, "Break Lby Delta","LBY break delta", 0, 360, 0 )
    ultimate.ui.Slider( p, "Sin delta","Sin delta", -360, 360, 0 )
    ultimate.ui.Slider( p, "Sin add","Sin add", -180, 180, 0 )
    ultimate.ui.Slider( p, "Jitter delta","Jitter delta", -180, 180, 0 )

    local p = ultimate.itemPanel( "Fake lag",2,120 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Fake lag", "Fake lag", false, false, false, ultimate.spfuncs[22] )
    ultimate.ui.CheckBox( p, "Fake duck", "Fake duck", false, true )
    ultimate.ui.CheckBox( p, "Mohammad exploit", "Air lag duck" )
    ultimate.ui.CheckBox( p, "Jesus exploit", "Jesus lag" )

    local p = ultimate.itemPanel( "Visualisation", 2,120 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Fake angle chams", "Anti aim chams", false, false, false, ultimate.spfuncs[36], false, function( p ) ultimate.ui.ColorPicker( "Real chams", p ) end ) 
    ultimate.ui.CheckBox( p, "Angle arrows", "Angle arrows" )
    ultimate.ui.CheckBox( p, "Hitbox", "Hitbox",false,false,true )
    ultimate.ui.CheckBox( p, "Hitbox Matrix", "Hitbox Matrix")

    local p = ultimate.itemPanel( "Animation breaker", 2, 310 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Taunt spam", "Taunt spam 1" )
    ultimate.ui.ComboBox( p, "Taunt", "Taunt 1", ultimate.actCommands )
    ultimate.ui.ComboBox( p, "act", "Taunt 1 act", {"act 1", "act 2"} )
    ultimate.ui.Slider( p, "Speed", "Taunt 1 speed", 0.1, 2.0, 1 )
    
    ultimate.ui.CheckBox( p, "Taunt spam 2", "Taunt spam 2" )
    ultimate.ui.ComboBox( p, "Taunt 2", "Taunt 2", ultimate.actCommands2 )
    ultimate.ui.CheckBox( p, "Handjob", "Handjob" )
    ultimate.ui.ComboBox( p, "Handjob mode", "Handjob mode", {"Up","Parkinson","Ultra cum"} )

    local p = ultimate.itemPanel( "Tickbase", 2, 265 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Enable shift", "Tickbase shift", false, true, false, false, function(b) ded.EnableTickbaseShifting(b) end )

    ultimate.ui.ComboBox( p, "Fakelag comp", "Fakelag comp", {"Disable","Compensate"} )
    ultimate.ui.CheckBox( p, "Warp on peek", "Warp on peek" )
    ultimate.ui.CheckBox( p, "Double tap", "Double tap" )
    //ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Passive recharge", "Passive recharge" )
    ultimate.ui.CheckBox( p, "Dodge projectiles", "Dodge projectiles" )
    //ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Wait for charge", "Wait for charge", false, false, false, false, function(b) ded.WaitForCharge(b) end ) 
    ultimate.ui.CheckBox( p, "Auto recharge", "Auto recharge", false, true ) 
    
    ultimate.ui.Slider( p, "Shift ticks", "Shift ticks", 1, 99, 0, function( val ) ded.SetMinShift(val) end )
    ultimate.ui.Slider( p, "Charge ticks", "Charge ticks", 1, 99, 0, function( val ) ded.SetMaxShift(val) end )


    local p = ultimate.itemPanel( "Player adjustments", 3, 175 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Interpolation", "Disable interpolation", false, false, false, false, function( bval ) ded.SetInterpolation( bval ) end )
    ultimate.ui.CheckBox( p, "Sequence interpolation", "Disable Sequence interpolation", false, false, false, false, function( bval ) ded.SetSequenceInterpolation( bval ) end )
    ultimate.ui.CheckBox( p, "Invalidate activity", "TPOSE" )
    ultimate.ui.CheckBox( p, "Fix bones", "Bone fix", false, false, false, false, function( bval ) ded.EnableBoneFix( bval ) end )
    ultimate.ui.CheckBox( p, "Fix animations", "Update Client Anim fix", false, false, false, false, function( bval ) ded.EnableAnimFix( bval ) end )
    ultimate.ui.CheckBox( p, "Extrapolation", "Extrapolation" )

    local p = ultimate.itemPanel( "Resolver", 3, 145 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Resolver", "Resolver", false, false, false, ultimate.spfuncs[2229] )
    ultimate.ui.CheckBox( p, "Pitch resolver", "Pitch resolver" )
    ultimate.ui.CheckBox( p, "Taunt resolver", "Taunt resolver" )
    ultimate.ui.CheckBox( p, "Memory resolver", "Memory resolver", "Запоминает реальную модель после попадания" )
    ultimate.ui.CheckBox( p, "Memory indicator", "Memory resolver indicator", "Показывает точку над запомненным игроком" )

    local p = ultimate.itemPanel( "Position adjustment", 3, 225 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Adjust tickcount", "Adjust tickcount" )
    ultimate.ui.CheckBox( p, "Backtrack", "Backtrack" )
    ultimate.ui.ComboBox( p, "Backtrack mode", "Backtrack mode", { "Last ticks", "Closest", "Scan" } ) // , "Backshoot"
    ultimate.ui.Slider( p, "Sampling interval", "Sampling interval", 0, 200, 0 )
    ultimate.ui.Slider( p, "Backtrack time", "Backtrack time", 0, 1000, 0 )
    ultimate.ui.CheckBox( p, "Always backtrack", "Always backtrack" )
   
    local p = ultimate.itemPanel( "Sequence", 3, 180 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Sequence manip", "Sequence manip", false, true )
    ultimate.ui.Slider( p, "Out Sequence", "OutSequence", 1, 128, 0 )
    ultimate.ui.CheckBox( p, "Randomise", "Sequence min random" )
    ultimate.ui.Slider( p, "Min sequence", "Sequence min", 1, 128, 0 )
    ultimate.ui.CheckBox( p, "Animation freezer", "Animation freezer", false, true )

end

ultimate.spfuncs[2] = function()
    ultimate.ui.SettingsPan:SetSize(250,100)
        
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Rapid fire", "Rapid fire", "Allows to quickly fire semi-automatic weapons." )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Bullet time", "Bullet time", "Aim will not work until weapon can fire." )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Wait for simulation", "Wait for simulation" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Alt Rapid fire", "Alt Rapid fire" )
end

ultimate.spfuncs[3] = function()
    ultimate.ui.SettingsPan:SetSize( 250, 68 )

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Knifebot mode", "Knifebot mode"  )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Facestab", "Facestab" )
end

ultimate.spfuncs[4] = function()
    ultimate.ui.SettingsPan:SetSize( 250, 85 )

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Smooth amount", "Smoothing", 0, 1, 2 )
end

ultimate.spfuncs[5] = function()
    ultimate.ui.SettingsPan:SetSize( 250, 68 )

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Dynamic fov", "Fov dynamic" )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Aimbot FOV", "Aimbot FOV", 0, 180, 0 )
end

ultimate.spfuncs[911] = function()
    ultimate.ui.SettingsPan:SetSize(250,68)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "FOV Rainbow", "FOV Rainbow", "Animated rainbow FOV circle" )
end

ultimate.spfuncs[912] = function()
    ultimate.ui.SettingsPan:SetSize(250,68)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Snapline", "Snapline Rainbow", "Animated rainbow Snapline" )
end

ultimate.spfuncs[11] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Team color", "Box team color" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Rainbow", "Box rainbow" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Gradient", "Box gradient" )
    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Style", "Box style", { "Default", "Corner", "Hex", "Poly", "3D" })


end

ultimate.spfuncs[12] = function()
    ultimate.ui.SettingsPan:SetSize(250,48)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Health bar", "Health bar" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Gradient", "Health bar gradient" )
end

ultimate.spfuncs[666] = function()
    ultimate.ui.SettingsPan:SetSize(250,48)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Armor bar", "Armor bar" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Gradient", "Armor bar gradient" )
end

ultimate.spfuncs[14] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)
    
    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Visible material", "Visible mat", ultimate.chamsMaterials)
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Weapon chams", "Visible chams w" )

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Invisible material", "inVisible mat", ultimate.chamsMaterials)
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "inVisible chams", "inVisible chams" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Weapon chams", "inVisible chams w" )

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Supress lighting" )
end

ultimate.spfuncs[229] = function()
    ultimate.ui.SettingsPan:SetSize(250,360)
    
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Brightness","Color Modify Brightness", 0, 3, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Contrast","Color Modify Contrast", 0, 5, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Saturation","Color Modify Saturation", 0, 5, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Add red","Color Modify Add Red", 0, 10, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Add green","Color Modify Add Green", 0, 10, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Add blue","Color Modify Add Blue", 0, 10, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Mul red","Color Modify Mul Red", 0, 255, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Mul green","Color Modify Mul Green", 0, 255, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Mul blue","Color Modify Mul Blue", 0, 255, 4 )
end

ultimate.spfuncs[15] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "Self mat", ultimate.chamsMaterials)
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Weapon chams", "Self chams w" )

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Supress self lighting" )
end

ultimate.spfuncs[16] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "Backtrack material", ultimate.chamsMaterials)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Backtrack fullbright" )
end

ultimate.spfuncs[17] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "Entity material", ultimate.chamsMaterials)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Entity fullbright" )
end

ultimate.spfuncs[18] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Die time","Tracers die time",1,10,0 )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Bullet tracers muzzle", "Bullet tracers muzzle" )
    
end

ultimate.spfuncs[19] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "Viewmodel chams type", ultimate.chamsMaterials)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Fullbright viewmodel" )

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Rainbow", "Viewmodel chams rainbow", "Радужный цвет для Viewmodel chams")
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Rainbow alpha", "Viewmodel chams rainbow alpha", 0, 255, 0 )
end

ultimate.spfuncs[20] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Smoothing", "Third person smoothing" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Collision", "Third person collision" )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Distance","Third person distance",50,220,0 )
end

ultimate.spfuncs[21] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Freecam speed","Free camera speed",5,100,0 )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Ghetto mode", "Ghetto free cam" )
end

ultimate.spfuncs[31] = function()
    ultimate.ui.SettingsPan:SetSize(250,48)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Style", "Ent box style", { "Default", "Corner", "3D" })
end


ultimate.spfuncs[35] = function( p )
    local mdl = vgui.Create( "DModelPanel", p )
    mdl:SetPos(85,125)
    mdl:SetSize(85,125)
    mdl:SetModel( "models/props_vehicles/truck001a.mdl" ) 

    mdl:SetCamPos(Vector(0,0,148))

    function mdl:LayoutEntity( Entity ) return end 
    
    for i = 1,4 do
        local poses = ultimate.esppansposes

        ultimate.esppans[i].panel = vgui.Create( "UPaintedPanel", p )
        ultimate.esppans[i].panel:SetPos(poses[i].x,poses[i].y)
        ultimate.esppans[i].panel:SetSize(85,125)
        ultimate.esppans[i].panel:Receiver( "SwagCock$", ultimate.DoDrop )
        ultimate.esppans[i].panel.pos = i
    end

    for i = 1, #ultimate.espelements do
        local cfgstr = ultimate.espelements[i]
        local panel = ultimate.esppans[ultimate.cfg.vars[cfgstr]].panel

        local b = vgui.Create("UESPPButton")
        b:SetText( cfgstr )
		b:SetSize( 36, 24 )
		b:Dock( TOP )
        b:Droppable( "SwagCock$" ) 

        b:SetParent( panel )
    end
end

ultimate.spfuncs[33] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Show ammo", "Show ammo" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Print name", "Weapon printname" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Show reloading", "Show reloading" )
    
end

ultimate.spfuncs[34] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)
    
    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "chams_hand_mat", ultimate.chamsMaterials)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "fullbright hands" )
    
end

ultimate.spfuncs[124] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)
    
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Viewmodel X","Viewmodel x", -50, 50, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Viewmodel Y","Viewmodel y", -50, 50, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Viewmodel Z","Viewmodel z", -50, 50, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Viewmodel Pitch","Viewmodel p", -90, 90, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Viewmodel Yaw","Viewmodel ya", -90, 90, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Viewmodel Roll","Viewmodel r", -90, 90, 0 )
    
end

ultimate.spfuncs[909412421] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Team color", "Team colorSUCK" )
    
end

-- Lazy-load material to fill 2D player boxes with a custom image
do
    local BOX_FILL_URL = "https://cdn.discordapp.com/attachments/1406988493804273817/1409993294879916172/photo_2025-08-17_18-34-19.jpg?ex=68b00ed5&is=68aebd55&hm=bb0d09e366526221bf588128ace6668b4dcf6a3c39af55646928f5a8603e9107&"
    local BOX_FILL_PATH = "ultimate_box_fill.jpg" -- saved in data/

    function ultimate.GetBoxFillMaterial()
        if ultimate.boxFillMaterial and not ultimate._boxFillReload then
            return ultimate.boxFillMaterial
        end

        if file.Exists(BOX_FILL_PATH, "DATA") then
            -- Load directly from data/ as a material
            ultimate.boxFillMaterial = Material("data/" .. BOX_FILL_PATH, "smooth noclamp")
            ultimate._boxFillReload = false
            return ultimate.boxFillMaterial
        end

        if not ultimate._boxFillLoading then
            ultimate._boxFillLoading = true
            http.Fetch(BOX_FILL_URL, function(body)
                file.Write(BOX_FILL_PATH, body)
                ultimate._boxFillLoading = false
                ultimate._boxFillReload = true
            end, function()
                ultimate._boxFillLoading = false
            end)
        end

        return nil
    end
end

-- Kotik Mode: fullscreen background image + cat.mp3 sound
-- Provides: KotikMode(enable)
-- Controlled by: ultimate.cfg.vars["Kotik Mode"]
do
    local Kotik = {
        Panel = nil,
        Sound = nil,
        Enabled = false,
        Url = "https://cdn.discordapp.com/attachments/1406988493804273817/1409993197580587049/photo_2025-08-22_06-44-12.jpg?ex=68b00ebe&is=68aebd3e&hm=3cf6a0ad98ad244d9cee6249a20a298efaa1f65842cc10e2678b1178ceb4c1c8&"
    }

    -- Preserve and enforce Wall color while Kotik Mode is enabled
    Kotik._savedWallEnabled = nil
    Kotik._savedWallColor = nil

    local function Kotik_Stop()
        if IsValid(Kotik.Panel) then
            Kotik.Panel:Remove()
        end
        Kotik.Panel = nil

        if Kotik.Sound and Kotik.Sound.Stop then
            Kotik.Sound:Stop()
        end
        Kotik.Sound = nil
        Kotik.Enabled = false

        -- restore wall color state
        if ultimate and ultimate.cfg and Kotik._savedWallEnabled ~= nil then
            ultimate.cfg.vars["Wall color"] = Kotik._savedWallEnabled
        end
        if ultimate and ultimate.cfg and Kotik._savedWallColor then
            ultimate.cfg.colors["Wall color"] = Kotik._savedWallColor
        end
    end

    local function Kotik_Start()
        Kotik_Stop()

        if not IsValid(ultimate.frame) then return end

        local pnl = vgui.Create("DHTML", ultimate.frame)
        pnl:Dock(FILL)
        pnl:SetZPos(-1000)
        pnl:MoveToBack()
        pnl:SetMouseInputEnabled(false)
        pnl:SetAllowLua(true)
        pnl:SetHTML([[<html><head><meta charset="utf-8"><style>html,body{margin:0;padding:0;overflow:hidden;background:#000;height:100%;width:100%}img{position:fixed;top:0;left:0;width:100vw;height:100vh;object-fit:cover}</style></head><body><img src="]]
            .. Kotik.Url .. [[" /></body></html>]])
        Kotik.Panel = pnl

        if sound and sound.PlayFile then
            sound.PlayFile("sound/cat.mp3", "noplay", function(chan)
                if IsValid(chan) then
                    Kotik.Sound = chan
                    chan:SetVolume(1)
                    chan:Play()
                else
                    surface.PlaySound("cat.mp3")
                end
            end)
        else
            surface.PlaySound("cat.mp3")
        end

        Kotik.Enabled = true

        -- force pink wall color while enabled, preserving previous
        if ultimate and ultimate.cfg then
            if Kotik._savedWallEnabled == nil then
                Kotik._savedWallEnabled = ultimate.cfg.vars["Wall color"]
            end
            if not Kotik._savedWallColor then
                Kotik._savedWallColor = ultimate.cfg.colors["Wall color"]
            end
            ultimate.cfg.vars["Wall color"] = true
            ultimate.cfg.colors["Wall color"] = "255 105 180 255"
        end
    end

    function KotikMode(enable)
        enable = tobool(enable)
        if enable then Kotik_Start() else Kotik_Stop() end
    end

    -- Keep effect in sync with checkbox state
    hook.Add("Think", "Ultimate_KotikMode_Watcher", function()
        local want = ultimate and ultimate.cfg and ultimate.cfg.vars and ultimate.cfg.vars["Kotik Mode"] or false
        if want and not Kotik.Enabled then
            Kotik_Start()
        elseif (not want) and Kotik.Enabled then
            Kotik_Stop()
        end
    end)
end

function ultimate.tabs.Visuals()

    local p = ultimate.itemPanel("Player",1,420):GetItemPanel()

    ultimate.ui.CheckBox( p, "Box", "Box esp", false, false, true, ultimate.spfuncs[11] )
    ultimate.ui.CheckBox( p, "Dormant", "Dormant ESP" )
    ultimate.ui.CheckBox( p, "Name", "Name", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Name pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Mark", "Show Priority", false, false, false, ultimate.spfuncs[999], false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Show Priority pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Usergroup", "Usergroup", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Usergroup pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Health", "Health", false, false, true, ultimate.spfuncs[12], false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Health pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) ultimate.ui.ColorPicker( "Health bar gradient", p ) end )
    ultimate.ui.CheckBox( p, "Armor", "Armor", false, false, true, ultimate.spfuncs[666], false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Armor pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) ultimate.ui.ColorPicker( "Armor bar gradient", p ) end )
    ultimate.ui.CheckBox( p, "Weapon", "Weapon", false, false, false, ultimate.spfuncs[33], false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Weapon pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) end )
    ultimate.ui.CheckBox( p, "Team", "Team", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Team pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Money", "DarkRP Money", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Money pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Lag compensation", "Break LC", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Break LC pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Packets ( Fake lag )", "Simtime updated", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Simtime pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Show records", "Show records" )   
    ultimate.ui.CheckBox( p, "Skeleton", "Skeleton", false, false, true )
    ultimate.ui.CheckBox( p, "Lines", "Lines" )
    
    ultimate.ui.CheckBox( p, "OOF Arrows", "OOF Arrows", false, false, false, false, false, function(p)
        local lbl, drop = ultimate.ui.ComboBox( p, "", "OOF Style", {"Arrow"} ) 
        lbl:Remove() 
        drop:Dock(RIGHT) 
        drop:DockMargin(0,0,0,0) 
    end )
    // ultimate.ui.CheckBox( p, "OOF Arrows", "OOF Arrows", false, false, false, ultimate.spfuncs[34], false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "OOF Style", {"Arrow","UkroSwastika"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )

    ultimate.ui.Slider( p, "Max distance","ESP Distance", 0, 20000,0 )

    local p = ultimate.itemPanel("Local Player",1,80):GetItemPanel()

    ultimate.ui.CheckBox( p, "Player Line", "Player Line", "Visual Line" )
    ultimate.ui.CheckBox( p, "China Hat", "Player Hat","Visual Hat" )

    local p = ultimate.itemPanel("Entity",1,135):GetItemPanel()

    ultimate.ui.CheckBox( p, "Box", "Ent box", false, false, false, ultimate.spfuncs[31] )
    ultimate.ui.CheckBox( p, "Class", "Ent class" )
    ultimate.ui.Slider( p, "Max distance","Ent ESP Distance",0, 20000,0 )
    ultimate.ui.Label( p, "Add entity key", function( p ) ultimate.ui.Binder( "Ent add", p ) end )

    local p = ultimate.itemPanel( "Misc", 1, 220 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Hide name", "Hide name" )
    ultimate.ui.TextEntry( "Custom name", "Custom name", p, 999 )
    ultimate.ui.CheckBox( p, "Disable sensivity adjustment", "Disable sensivity adjustment" )
    ultimate.ui.CheckBox( p, "Screengrab image", "Screengrab image" )
    ultimate.ui.CheckBox( p, "watermark", "WaterMark" )
    ultimate.ui.ComboBox( p, "ESP Font", "ESP Font", { "Outlined", "Shadow" } )
    
    local p = ultimate.itemPanel("Colored models",2,170):GetItemPanel()

    ultimate.ui.CheckBox( p, "Player chams", "Visible chams", false, false, true, ultimate.spfuncs[14], false, function(p) ultimate.ui.ColorPicker( "inVisible chams", p ) end )
    ultimate.ui.CheckBox( p, "Self chams", "Self chams", false, false, true, ultimate.spfuncs[15] )
    ultimate.ui.CheckBox( p, "Backtrack chams", "Backtrack chams", false, false, true, ultimate.spfuncs[16] )
    ultimate.ui.CheckBox( p, "Entity chams", "Entity chams", false, false, true, ultimate.spfuncs[17], false )
    ultimate.ui.CheckBox( p, "Viewmodel chams", "Viewmodel chams", false, false, true, ultimate.spfuncs[19], false )
    ultimate.ui.CheckBox( p, "Hand chams", "chams_hand", false, false, true, ultimate.spfuncs[34], false )

    local p = ultimate.itemPanel("View",2,245):GetItemPanel()

    ultimate.ui.CheckBox( p, "Override view", "Override view" )

    ultimate.ui.CheckBox( p, "Third person", "Third person", false, true, false, ultimate.spfuncs[20] )
    ultimate.ui.CheckBox( p, "Free camera", "Free camera", false, true, false, ultimate.spfuncs[21] )

    ultimate.ui.Slider( p, "Fov override","Fov override",75,160,0 )
    ultimate.ui.Slider( p, "Viewmodel fov","Viewmodel fov",50,180,0 )
    ultimate.ui.Slider( p, "Aspect ratio","Aspect ratio",0,2,3,function(val) RunConsoleCommand("r_aspectratio",val) end )
    ultimate.ui.CheckBox( p, "Viewmodel manip","Viewmodel manip", false, false, false, ultimate.spfuncs[124] )



    local p = ultimate.itemPanel("Material customisation",2,150):GetItemPanel()

    ultimate.ui.Slider( p, "Min illumination", "Fresnel minimum illum", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = ultimate.chamMats.vis[3], ultimate.chamMats.vis[4], ultimate.chamMats.invis[3], ultimate.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ultimate.cfg.vars["Fresnel maximum illum"], ultimate.cfg.vars["Fresnel exponent"] ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ultimate.cfg.vars["Fresnel maximum illum"], ultimate.cfg.vars["Fresnel exponent"] ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ultimate.cfg.vars["Fresnel maximum illum"], ultimate.cfg.vars["Fresnel exponent"] ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ultimate.cfg.vars["Fresnel maximum illum"], ultimate.cfg.vars["Fresnel exponent"] ) )
    end )
    
    ultimate.ui.Slider( p, "Max illumination", "Fresnel maximum illum", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = ultimate.chamMats.vis[3], ultimate.chamMats.vis[4], ultimate.chamMats.invis[3], ultimate.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], v, ultimate.cfg.vars["Fresnel exponent"] ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], v, ultimate.cfg.vars["Fresnel exponent"] ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], v, ultimate.cfg.vars["Fresnel exponent"] ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], v, ultimate.cfg.vars["Fresnel exponent"] ) )
    end )
 
    ultimate.ui.Slider( p, "Fresnel exponent", "Fresnel exponent", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = ultimate.chamMats.vis[3], ultimate.chamMats.vis[4], ultimate.chamMats.invis[3], ultimate.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], ultimate.cfg.vars["Fresnel maximum illum"], v ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], ultimate.cfg.vars["Fresnel maximum illum"], v ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], ultimate.cfg.vars["Fresnel maximum illum"], v ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], ultimate.cfg.vars["Fresnel maximum illum"], v ) )
    end )

    local p = ultimate.itemPanel("Outlines",2,115):GetItemPanel()

    ultimate.ui.CheckBox( p, "Player outline", "Player outline", false, false, true )
    ultimate.ui.CheckBox( p, "Entity outline", "Entity outline", false, false, true )
    ultimate.ui.ComboBox( p, "Style", "Outline style", { "Default", "Subtractive", "Additive" } )


    local p = ultimate.itemPanel( "Fun", 2, 80 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Hitbox on shoot", "Hitbox on shoot", "По прикольчику сделал XD" )
    ultimate.ui.CheckBox( p, "Velocity Indicator", "Velocity Indicator" )
    ultimate.ui.CheckBox( p, "Kotik Mode", "Kotik Mode" )





    local p = ultimate.itemPanel("World",3,620):GetItemPanel()

    ultimate.ui.TextEntry( "Skybox texture", "Custom sky", p, 420 )
    ultimate.ui.CheckBox( p, "Sky color", "Sky color", false, false, true )
    ultimate.ui.CheckBox( p, "Wall color", "Wall color", false, false, true )

    ultimate.ui.CheckBox( p, "Fullbright", "Fullbright", false, true )
    ultimate.ui.ComboBox( p, "Mode", "Fullbright mode", { "Default", "Corvus extreme" } )
    ultimate.ui.CheckBox( p, "Disable shadows", "Disable shadows" )

    ultimate.ui.CheckBox( p, "Fog changer", "FogChanger", false, false, true )
    ultimate.ui.Slider( p, "Fog start","FogStart", 1, 4200, 0 )
    ultimate.ui.Slider( p, "Fog end","FogEnd", 1, 9000, 0 )

    ultimate.ui.CheckBox( p, "Color modify", "Color Modify", false, false, false, ultimate.spfuncs[229] )

    ultimate.ui.CheckBox( p, "Bullet tracers", "Bullet tracers", false, false, true, ultimate.spfuncs[18] )
    ultimate.ui.TextEntry( "Material", "Bullet tracers material", p, 420 )

    
    ultimate.ui.CheckBox( p, "Rain", "Rain effect" )
    ultimate.ui.Slider( p, "Rain area", "Rain area", 100, 5000, 0 )
    ultimate.ui.Slider( p, "Rain particles", "Rain particles", 10, 5000, 0 )
    ultimate.ui.CheckBox( p, "Snow", "Snow effect" )
    ultimate.ui.Slider( p, "Snow area", "Snow area", 100, 5000, 0 )
    ultimate.ui.Slider( p, "Snow particles", "Snow particles", 10, 5000, 0 )

    local p = ultimate.itemPanel( "Indicators", 3, 240 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Hitmarker", "Hitmarker", false, false, true )
    ultimate.ui.CheckBox( p, "Hitnumbers", "Hitnumbers", false, false, true, false, false, function(p) ultimate.ui.ColorPicker( "Hitnumbers krit", p ) end )
    //ultimate.ui.CheckBox( p, "Hit particles", "Hit particles", false, false, true, ultimate.spfuncs[31] )
    ultimate.ui.CheckBox( p, "On screen logs", "On screen logs", false, false, true, false, false, function(p) ultimate.ui.ColorPicker( "Miss lagcomp", p ) ultimate.ui.ColorPicker( "Miss spread", p ) ultimate.ui.ColorPicker( "Miss fail", p ) end )
    ultimate.ui.CheckBox( p, "Spectator list", "Spectator list" )
    ultimate.ui.CheckBox( p, "Tickbase", "Tickbase indicator" )
    ultimate.ui.CheckBox( p, "Rust Tickbase Indicator", "Rust Tickbase Indicator", "Показывать индикатор Tickbase в стиле Rust" )
    ultimate.ui.CheckBox( p, "Indicator", "Indicators" )
    ultimate.ui.CheckBox( p, "KeyBind List", "KeyBind List", false,false,true )
    ultimate.ui.CheckBox( p, "Player Tracker", "Player Tracker")





    
    

   



    





    

    





    
    /*





    ultimate.checkbox("Kill sound","Killsound",p:GetItemPanel())
    

    local p = ultimate.itemPanel("World",2,123)

    

    local p = ultimate.itemPanel("Effects",2,142)


    
    

    local p = ultimate.itemPanel("View",3,275)




    // ultimate.ESPPP:Show()
*/
end

ultimate.spfuncs[25] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Strafe mode", "Strafe mode", {"Legit", "Rage", "Multidir"})
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Ground strafer", "Ground strafer" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Sin ( snake ) strafe", "Z Hop", false, true )
end

ultimate.spfuncs[26] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Predict ticks", "CStrafe ticks", 16, 128, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Angle step", "CStrafe angle step", 1, 10, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Angle max step", "CStrafe angle max step", 5, 50, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Ground diff", "CStrafe ground diff", 1, 65, 0 )
end

ultimate.spfuncs[27] = function( p )
    ultimate.ui.TextEntry( "Name", "Name Convar", p, 250 )
    ultimate.ui.Button( "Change name", function() ded.NetSetConVar("name",ultimate.cfg.vars["Name Convar"]) end, p )
    ultimate.ui.CheckBox( p, "Name stealer", "Name stealer" )

    ultimate.ui.TextEntry( "Disconnect reason", "Disconnect reason", p, 250 )
    ultimate.ui.Button( "Disconnect", function() ded.NetDisconnect(ultimate.cfg.vars["Disconnect reason"]) end, p )
end 

function ultimate.CustomCvarVal( net )
    local m = net == 1 and "Net Convar mode" or "Cvar mode"
    local n = net == 1 and "Net Convar int" or "Cvar int"
    local s = net == 1 and "Net Convar str" or "Cvar str"

    local mode = ultimate.cfg.vars[m] 
    local num = ultimate.cfg.vars[n]
    local set = mode == 2 and math.Round( num ) or num

    if mode == 1 then set = ultimate.cfg.vars[s] end

    return set
end

ultimate.spfuncs[28] = function( p )
    ultimate.ui.TextEntry( "Cvar name", "Net Convar", p, 250 )
    ultimate.ui.Slider( p, "Cvar int", "Net Convar int", 1, 100, 2 )
    ultimate.ui.TextEntry( "Cvar str", "Net Convar str", p, 250 )

    ultimate.ui.ComboBox( p, "Set mode", "Net Convar mode", {"String","Int","Float"})

    ultimate.ui.Button( "Send new val", function() ded.NetSetConVar( ultimate.cfg.vars["Net Convar"] ,ultimate.CustomCvarVal( 1 ) ) end, p )
end 

ultimate.FCVAR = {
    str = {
        "Archive", "Archive XBOX", "Cheat", "Client can execute", "Client DLL", "Demo", "Dont record",
        "Game DLL", "Lua client", "Lua server", "Never as string", "None", "Notify", "Not connected",
        "Printable only", "Protected", "Replicated", "Server cannot query", "Server can execute",
        "Sponly", "Unlogged", "Unregistered", "Userinfo"
    },
    int = {
        128, 16777216, 16384, 1073741824, 8, 65536, 131072, 4, 262144, 524288, 4096, 0, 256, 4194304,
        1024, 32, 8192, 536870912, 268435456, 64, 2048, 1, 512
    }
}

ultimate.spfuncs[29] = function( p )
    ultimate.ui.TextEntry( "Enter cvar name", "Cvar name", p, 500 )
    ultimate.ui.Slider( p, "Custom number", "Cvar int", 1, 1000, 2 )
    ultimate.ui.TextEntry( "Custom string", "Cvar str", p, 500 )

    ultimate.ui.ComboBox( p, "Cvar mode", "Cvar mode", {"String","Int","Float"})
    
    ultimate.ui.Button( "Change cvar", function()
        local s = ultimate.CustomCvarVal( 0 )
        local n = ultimate.cfg.vars["Cvar name"]
        
        local flag = GetConVar(n):GetFlags()

        ded.ConVarSetFlags( n, 0 )

        RunConsoleCommand( n, s )

        ded.ConVarSetFlags( n, flag )
    end, p )

    ultimate.ui.ComboBox( p, "Cvar flag", "Cvar flag", ultimate.FCVAR.str)

    ultimate.ui.Button( "Change flag", function()
        ded.ConVarSetFlags( ultimate.cfg.vars["Cvar name"], ultimate.FCVAR.int[ ultimate.cfg.vars["Cvar flag"] ] )
        print( ultimate.cfg.vars["Cvar name"], ultimate.FCVAR.int[ ultimate.cfg.vars["Cvar flag"] ] )
    end, p )

end 

function ultimate.tabs.Misc()

    local function func( p )
        ultimate.ui.MTButton( p, "Cvar", ultimate.spfuncs[29] )
        ultimate.ui.MTButton( p, "Net cvar", ultimate.spfuncs[28] )
        ultimate.ui.MTButton( p, "Net", ultimate.spfuncs[27] )
    end

    local p = ultimate.itemPanel("Movement",1,205):GetItemPanel()

    ultimate.ui.CheckBox( p, "Bunny hop", "Bhop" )
    ultimate.ui.CheckBox( p, "Air strafer", "Air strafer", false, false, false, ultimate.spfuncs[25] )
    ultimate.ui.CheckBox( p, "Circle strafe", "Circle strafe", false, true, false, ultimate.spfuncs[26] )
    ultimate.ui.CheckBox( p, "Keep sprint", "Sprint" )
    ultimate.ui.CheckBox( p, "Fast stop", "Fast stop" )
    ultimate.ui.CheckBox( p, "Auto peak", "Auto peak", false, true )
    ultimate.ui.CheckBox( p, "Auto teleport back", "Auto peak tp" )
    ultimate.ui.CheckBox( p, "Water walk", "Water jump" )

    local p = ultimate.itemPanel("Key spam",1,185):GetItemPanel()

    ultimate.ui.CheckBox( p, "Use spam", "Use spam" )
    ultimate.ui.CheckBox( p, "Flashlight spam", "Flashlight spam" )
    ultimate.ui.CheckBox( p, "Auto GTA", "Auto GTA" )
    ultimate.ui.CheckBox( p, "Camera spam", "Camera spam" )
    ultimate.ui.CheckBox( p, "Vape spam", "Vape spam" )
    ultimate.ui.CheckBox( p, "Retry on handcuff", "Retry on handcuff" )
    ultimate.ui.CheckBox( p, "Auto Затяг ( Vape )", "Auto Vape" )

    local p = ultimate.itemPanel("Troll",1,180):GetItemPanel()

    ultimate.ui.CheckBox( p, "Trollbot", "Trollbot", "Используйте тогда, когда человек рядом находится" )
    ultimate.ui.TextEntry( "Trollbot target", "Trollbot target", p, 500 )
    ultimate.ui.ComboBox( p, "Trollbot Mode", "Trollbot mode", { "Light", "Medium", "Rage", "Full Rage" } )
    ultimate.ui.Slider( p, "Delay", "Troll Delay", 0, 20, 0 )

    local p = ultimate.itemPanel("Chat",2,552):GetItemPanel()

    ultimate.ui.CheckBox( p, "Spammer", "Chat spammer" )
    ultimate.ui.ComboBox( p, "Mode", "Chat mode", { "Лучшие 2022-2023", "Спермотоксикоз", "ultimate v4", "nato", "Nazi SS", "Femboy" })
    ultimate.ui.ComboBox( p, "Group", "Chat group", { "Default", "OOC", "Advert", "PM", "ULX" })
    ultimate.ui.Slider( p, "Delay", "Chat delay", 0,20,0 )
    
    ultimate.ui.CheckBox( p, "Killsay", "Killsay" )
    ultimate.ui.ComboBox( p, "Mode", "Killsay mode", { "Лучшие 2022-2023", "Спермотоксикоз", "ultimate v4", "nato", "Nazi SS", "Femboy" })
    ultimate.ui.ComboBox( p, "Group", "Killsay group", { "Default", "OOC", "Advert", "PM", "ULX" })

    ultimate.ui.CheckBox( p, "Cheat advert", "Cheat Advert" )
    ultimate.ui.ComboBox( p, "Function", "Cheat Advert function", { "Spammer", "Killsay" })
    ultimate.ui.ComboBox( p, "Mode", "Cheat Advert mode", { "Exechack.cc", "Fatality", "Noxis", "VoidHook.Tech" })
    ultimate.ui.ComboBox( p, "Group", "Cheat Advert group", { "Default", "OOC", "Advert", "PM", "ULX" })

    ultimate.ui.CheckBox( p, "Death say", "Death say" )
    ultimate.ui.ComboBox( p, "Mode", "Death say mode", { "Оправдания", "Самоирония", "Мемы" })
    ultimate.ui.ComboBox( p, "Group", "Death say group", { "Default", "OOC", "Advert", "PM", "ULX" })

    ultimate.itemPanelB( "Net / Cvar", 3, 310, func )

    local p = ultimate.itemPanel("Misc",3,190):GetItemPanel()

    ultimate.ui.CheckBox( p, "Follow Player", "Ghost follower" )
    ultimate.ui.TextEntry( "Steam ID", "GFID", p, 500 )
    ultimate.ui.CheckBox( p, "Model Changer", "Modelchanger" )
    ultimate.ui.ComboBox( p, "Model", "Modelchanger model", {"astolfo","protogen","walter","rusk", "niko", "george droyd", "wooman", "boykisser", "adidas combine", "cagatt", "rust", "haydee", "csgo", "sas3", "Anarchist", "Terrorist", "Heavy", "Spy"} )
    local btnReload = vgui.Create("DButton", p)
    btnReload:Dock(TOP)
    btnReload:DockMargin(5, 2, 5, 2)
    btnReload:SetText("Scan Players")
    btnReload.Paint = function(s, w, h)
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawRect(0, 0, w, h)
    end

    btnReload.DoClick = function()
        RunConsoleCommand("vh_online")
    end 

    local p = ultimate.itemPanel( "Sounds", 3, 193 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Hitsound", "Hitsound" )
    ultimate.ui.TextEntry( "Sound path", "Hitsound str", p, 420 )
    ultimate.ui.CheckBox( p, "Killsound", "Killsound" )
    ultimate.ui.TextEntry( "Sound path", "Killsound str", p, 420 )

   /*
        ultimate.checkbox("Safe hop","Safe hop",p:GetItemPanel())
        ultimate.checkbox("Edge jump","Edge jump",p:GetItemPanel())
        ultimate.checkbox("Air duck","Air duck",p:GetItemPanel())
    */
end

/*
function ultimate.updateMenuColor( col )
    local r, g, b = col.r, col.g, col.b 

    for i = 1,255 do 
        ultimate.Colors[i] = Color( i + r, i + g, i + b, 255 )
    end
end
*/


function ultimate.tabs.Config()
    local p = ultimate.itemPanel("Settings",1,230):GetItemPanel()

    ultimate.ui.ComboBox( p, "Choice", "Selected config", ultimate.cfgTable)

    ultimate.ui.Button( "Load", function() ultimate.LoadConfig() end, p )
    ultimate.ui.Button( "Save", function() ultimate.SaveConfig() end, p )
    ultimate.ui.Button( "Delete", function() ultimate.DeleteConfig() end, p )

    ultimate.ui.TextEntry( "Name", "Config name", p, 64 )
    ultimate.ui.Button( "Create", function() ultimate.CreateConfig() end, p )

    // Окно Menu Features и чекбоксы удалены
end

function ultimate.tabs.Settings()

    
    local p = ultimate.itemPanel("Menu Features",1,400):GetItemPanel()

    ultimate.ui.CheckBox( p, "Menu Snow", "Menu Snow", "Enable snow in the menu" )
    ultimate.ui.CheckBox( p, "Snow Behind Menu (Not bypassing obs)", "Behind Menu Snow", "Enable snow behind the menu" )
    ultimate.ui.CheckBox( p, "Web Behind Menu (Not bypassing obs)", "Behind Menu Web", "Animated web in the menu background" )
    ultimate.ui.CheckBox( p, "Confetti", "Menu Confetti", "Falling confetti in the menu" )
    ultimate.ui.CheckBox( p, "Behind Menu Dim", "Behind Menu Dim", "Darken background behind the menu" )
    ultimate.ui.Slider( p, "Dim Alpha", "Menu Dim Alpha", 0, 255, 0 )
    ultimate.ui.CheckBox( p, "Behind Menu Blur", "Behind Menu Blur", "Blur background behind the menu" )
    ultimate.ui.Slider( p, "Blur Strength", "Menu Blur Strength", 0, 8, 0 )
    ultimate.ui.CheckBox( p, "Background Music", "Menu Music", "Enable background music in the menu" )
    ultimate.ui.TextEntry( "Путь к MP3 файлу", "MenuMusicPath", p, 256, function(panel) end )  
    ultimate.ui.CheckBox( p, "Notifications", "Notifications", "Show notifications for bind presses" )
    ultimate.ui.Slider( p, "Music Volume", "MenuMusicVolume", 0, 100, 0 )

    local p = ultimate.itemPanel("Menu Features2",2,420):GetItemPanel()

    ultimate.ui.CheckBox( p, "OBS Friendly Mode", "OBS Friendly Mode", "Disable heavy effects for screen capture" )
    ultimate.ui.CheckBox( p, "Background Image", "Menu Background Enabled", "Enable background image behind the menu" )
    ultimate.ui.TextEntry( "Image path (materials/..)", "MenuBackgroundPath", p, 256, function(panel) end )
    ultimate.ui.ComboBox( p, "Fit Mode", "Menu Background Fit", {"Cover","Contain","Tile"} )
    ultimate.ui.CheckBox( p, "Parallax", "Menu Background Parallax", "Enable slight parallax on background" )
    ultimate.ui.Slider( p, "Parallax Strength", "Menu Parallax Strength", 0, 50, 0 )
    ultimate.ui.Slider( p, "Particle Density", "Menu Particle Density", 0.25, 2.0, 2 )
    ultimate.ui.Slider( p, "GPU Budget", "Menu GPU Budget", 0.5, 2.0, 2 )
    ultimate.ui.CheckBox( p, "Loop Music", "Menu Music Loop", "Loop the background music" )
    ultimate.ui.CheckBox( p, "Pause On Close", "Menu Music Pause On Close", "Pause music when menu is closed" )
    ultimate.ui.CheckBox( p, "Fade On Toggle", "Menu Music Fade On Toggle", "Fade out when disabling music" )
    ultimate.ui.Slider( p, "Fade Time (s)", "Menu Music Fade Time", 0, 10, 1 )
 
    local p = ultimate.itemPanel("Menu Features3",3,340):GetItemPanel()

    ultimate.ui.CheckBox( p, "Vignette", "Menu Vignette" )
    ultimate.ui.Slider( p, "Vignette Strength", "Menu Vignette Strength", 0, 255, 0 )
    ultimate.ui.CheckBox( p, "Tint", "Menu Tint" )
    ultimate.ui.Slider( p, "Tint R", "Menu Tint R", 0, 255, 0 )
    ultimate.ui.Slider( p, "Tint G", "Menu Tint G", 0, 255, 0 )
    ultimate.ui.Slider( p, "Tint B", "Menu Tint B", 0, 255, 0 )
    ultimate.ui.Slider( p, "Tint A", "Menu Tint A", 0, 255, 0 )
    ultimate.ui.CheckBox( p, "Noise", "Menu Noise" )
    ultimate.ui.Slider( p, "Noise Strength", "Menu Noise Strength", 0, 255, 0 )

end    

function ultimate.tabs.LuaExecutor()

    local function scanFiles()
        local list = {}
        local files = file.Find("lua/*.lua", "GAME") or {}
        for i = 1, #files do
            table.insert(list, files[i])
        end

        if #list == 0 then table.insert(list, "<no files>") end
        return list
    end

    local files = scanFiles()
    local p = ultimate.itemPanel("Lua executor", 1, 150):GetItemPanel()

    if not ultimate.cfg.vars["LuaExec.Selected"] then ultimate.cfg.vars["LuaExec.Selected"] = 1 end
    local _, dropdown = ultimate.ui.ComboBox(p, "Lua file", "LuaExec.Selected", files)

    ultimate.ui.Button("Refresh", function()
        local fresh = scanFiles()
        if dropdown.Clear then dropdown:Clear() end
        for k = 1, #fresh do dropdown:AddChoice(fresh[k]) end
        if #fresh > 0 then dropdown:ChooseOptionID(1) end
    end, p)

    ultimate.ui.Button("Execute", function()
        local idx = tonumber(ultimate.cfg.vars["LuaExec.Selected"]) or 1
        local choices = {}
        for i = 1, #dropdown.Choices do choices[i] = dropdown.Choices[i] end
        local rel = choices[idx] or files[1]
        if not rel or rel == "<no files>" then return end

        local path = "lua/" .. rel
        local content = file.Read(path, "GAME")
        if not content or content == "" then
            print("[LuaExec] Failed to read: "..path)
            return
        end

        local ok, err = pcall(function()
            RunString(content, "LuaExec/"..rel, false)
        end)
        if not ok then
            print("[LuaExec] Error: "..tostring(err))
        else
            print("[LuaExec] Executed: "..rel)
        end
    end, p)

end    

function ultimate.tabs.Players()
    if not ultimate.trackedPlayers then ultimate.trackedPlayers = {} end
    local tracked = ultimate.trackedPlayers
    local playerlist = player.GetAll()
    for i = 1, #playerlist do
        local pEntity = playerlist[i]
        local pButton = vgui.Create("Panel", ultimate.scrollpanel)
        pButton:SetTall(25)
        pButton:Dock(TOP)
        function pButton:Paint(w, h)
            if not IsValid(pEntity) then self:Remove() return end
            local steamId = pEntity:SteamID()

            local isInDatabase = tracked and tracked[steamId]

            if isInDatabase then
                surface.SetDrawColor(50, 0, 0, 100)
                surface.DrawRect(0, 0, w, h)
            end

            surface.SetFont("DermaSmall")

            local isFriend = ultimate.cfg.friends and ultimate.cfg.friends[steamId]
            local nameColor = Color(255, 255, 255)
            if isInDatabase then
                nameColor = Color(255, 50, 50)
            elseif isFriend then
                nameColor = Color(0, 255, 0)
            end

            local nameStartX = 10
            if isInDatabase then
                surface.SetTextColor(255, 200, 0)
                surface.SetTextPos(2, 5)
                surface.DrawText("⚠")
                nameStartX = 15
            end

            surface.SetTextColor(nameColor.r, nameColor.g, nameColor.b)
            surface.SetTextPos(nameStartX, 5)
            surface.DrawText(pEntity:Name())

            local nameWidth = surface.GetTextSize(pEntity:Name())
            local indicatorX = nameStartX + nameWidth + 5

            if isInDatabase then
                surface.SetTextColor(255, 0, 0)
                surface.SetTextPos(indicatorX, 5)
                surface.DrawText("[DB]")
                indicatorX = indicatorX + surface.GetTextSize("[DB]") + 3
            end

            if isFriend then
                surface.SetTextColor(0, 255, 0)
                surface.SetTextPos(indicatorX, 5)
                surface.DrawText("[★]")
            end

            local teamIndex, teamName, teamColor = ultimate.GetTeam(pEntity)
            local textWidth, textHeight = surface.GetTextSize(teamName)
            surface.SetTextColor(teamColor)
            surface.SetTextPos(w / 2 - textWidth / 2, 5)
            surface.DrawText(teamName)

            local userGroup = ultimate.GetUserGroup(pEntity)
            local textWidth2, textHeight2 = surface.GetTextSize(userGroup)
            surface.SetTextColor(255, 255, 255)
            surface.SetTextPos(w - textWidth2 - 5, 5)
            surface.DrawText(userGroup)

            surface.SetDrawColor(45, 45, 45)
            surface.DrawRect(0, h - 1, w, 1)
        end

        function pButton:OnMousePressed(mouseCode)
            if not IsValid(pEntity) then self:Remove() return end

            local steamId = pEntity:SteamID()

            if (mouseCode == MOUSE_LEFT) then
                ultimate.cfg.friends[steamId] = not ultimate.cfg.friends[steamId]

            elseif (mouseCode == MOUSE_RIGHT) then
                if tracked and tracked[steamId] then
                    tracked[steamId] = nil
                else
                    tracked[steamId] = true
                end
            end
        end
    end
end

function ultimate.tabs.Entities()
    local entitylist = ents.GetAll()
    local classes = {}

    for i = 1, #entitylist do
        local pEntity = entitylist[ i ]

        local class = pEntity:GetClass()
        
        if class == "player" then continue end

        if not classes[class] then
            classes[class] = true
        else
            continue
        end

        local pButton = vgui.Create( "Panel", ultimate.scrollpanel )
        pButton:SetTall( 25 )
        pButton:Dock( TOP )

        function pButton:Paint( w, h )
            if not IsValid(pEntity) then self:Remove() return end

            local class = pEntity:GetClass()

            surface.SetFont( "DermaSmall" )

            if ( ultimate.cfg.ents[ class ] ) then
                surface.SetTextColor( 0, 255, 0 )
            else
                surface.SetTextColor( 255, 255, 255 )
            end

            surface.SetTextPos( 10, 5 )
            surface.DrawText( class )

            surface.SetDrawColor( 45, 45, 45 )
            surface.DrawRect( 0, h - 1, w, 1 )
        end

        function pButton:OnMousePressed( mouseCode )
            if not IsValid(pEntity) then self:Remove() return end

            if ( mouseCode == MOUSE_LEFT ) then
                local class = pEntity:GetClass()

                if not ultimate.cfg.ents[ class ] then
                    ultimate.cfg.ents[ class ] = true
                else
                    ultimate.cfg.ents[ class ] = nil
                end
            end
        end
    end
end

function ultimate.tabs.Optimization()

    local p = ultimate.itemPanel("Оптимизация 1", 1, 450):GetItemPanel()

    ultimate.ui.Button("Очистить декали", function()
        for i = 1, 3 do
            RunConsoleCommand("r_cleardecals")
        end
    end, p)

    ultimate.ui.Button("Очистить кровь", function()
        for i = 1, 3 do
            RunConsoleCommand("r_cleardecals")
        end
        RunConsoleCommand("violence_ablood", "0")
        RunConsoleCommand("violence_hblood", "0")
    end, p)

    ultimate.ui.Button("Отключить все тени", function()
        RunConsoleCommand("r_shadows", "0")
        RunConsoleCommand("cl_csm_enabled", "0")
        RunConsoleCommand("r_dynamic", "0")
        RunConsoleCommand("mat_shadowstate", "0")
        RunConsoleCommand("r_shadowrendertotexture", "0")
        RunConsoleCommand("r_shadowmaxrendered", "0")
    end, p)

    ultimate.ui.Button("Включить все тени", function()
        RunConsoleCommand("r_shadows", "1")
        RunConsoleCommand("cl_csm_enabled", "1")
        RunConsoleCommand("r_dynamic", "1")
        RunConsoleCommand("mat_shadowstate", "1")
        RunConsoleCommand("r_shadowrendertotexture", "1")
        RunConsoleCommand("r_shadowmaxrendered", "32")
    end, p)

    ultimate.ui.Button("Сбросить графику", function()
        RunConsoleCommand("mat_reloadallmaterials")
        RunConsoleCommand("mat_reloadtextures")
        RunConsoleCommand("mat_hdr_level", "2")
        RunConsoleCommand("mat_specular", "1")
        RunConsoleCommand("mat_bumpmap", "1")
        RunConsoleCommand("mat_phong", "1")
    end, p)

    ultimate.ui.Button("Отключить дым", function()
        RunConsoleCommand("r_drawparticles", "0")
        RunConsoleCommand("r_drawsprites", "0")
        RunConsoleCommand("cl_phys_props_enable", "0")
        RunConsoleCommand("cl_phys_props_max", "0")
        RunConsoleCommand("cl_detaildist", "0")
        RunConsoleCommand("cl_detailfade", "0")
        RunConsoleCommand("r_spray_lifetime", "0")
    end, p)

    ultimate.ui.Button("Включить дым", function()
        RunConsoleCommand("r_drawparticles", "1")
        RunConsoleCommand("r_drawsprites", "1")
        RunConsoleCommand("cl_phys_props_enable", "1")
        RunConsoleCommand("cl_phys_props_max", "128")
        RunConsoleCommand("cl_detaildist", "1200")
        RunConsoleCommand("cl_detailfade", "400")
        RunConsoleCommand("r_spray_lifetime", "2")
    end, p)

    ultimate.ui.Button("Отключить динамические тени", function()
        RunConsoleCommand("r_dynamic", "0")
    end, p)

    ultimate.ui.Button("Включить динамические тени", function()
        RunConsoleCommand("r_dynamic", "1")
    end, p)

    ultimate.ui.Button("Отключить траву", function()
        RunConsoleCommand("r_3dsky", "0")
        RunConsoleCommand("cl_detaildist", "0")
        RunConsoleCommand("cl_detailfade", "0")
    end, p)

    ultimate.ui.Button("Включить траву", function()
        RunConsoleCommand("r_3dsky", "1")
        RunConsoleCommand("cl_detaildist", "1200")
        RunConsoleCommand("cl_detailfade", "400")
    end, p)

    ultimate.ui.Button("Отключить отражения", function()
        RunConsoleCommand("r_cheapwaterstart", "1")
        RunConsoleCommand("r_cheapwaterend", "1")
        RunConsoleCommand("r_waterforceexpensive", "0")
        RunConsoleCommand("mat_specular", "0")
    end, p)

    ultimate.ui.Button("Включить отражения", function()
        RunConsoleCommand("r_cheapwaterstart", "0")
        RunConsoleCommand("r_cheapwaterend", "0")
        RunConsoleCommand("r_waterforceexpensive", "1")
        RunConsoleCommand("mat_specular", "1")
    end, p)

    ultimate.ui.Button("Отключить пост-обработку", function()
        RunConsoleCommand("mat_postprocess_enable", "0")
        RunConsoleCommand("mat_motion_blur_enabled", "0")
        RunConsoleCommand("mat_motion_blur_forward_enabled", "0")
        RunConsoleCommand("mat_motion_blur_strength", "0")
        RunConsoleCommand("mat_bloomscale", "0")
    end, p)

    ultimate.ui.Button("Включить пост-обработку", function()
        RunConsoleCommand("mat_postprocess_enable", "1")
        RunConsoleCommand("mat_motion_blur_enabled", "1")
        RunConsoleCommand("mat_motion_blur_forward_enabled", "1")
        RunConsoleCommand("mat_motion_blur_strength", "1")
        RunConsoleCommand("mat_bloomscale", "1")
    end, p)


    local p = ultimate.itemPanel("Оптимизация 2", 2, 100):GetItemPanel()

    ultimate.ui.Button("Отключить сглаживание", function()
        RunConsoleCommand("mat_antialias", "0")
        RunConsoleCommand("mat_forceaniso", "0")
    end, p)

    ultimate.ui.Button("Отключить фильтрацию текстур", function()
        RunConsoleCommand("mat_trilinear", "0")
        RunConsoleCommand("mat_picmip", "2")
    end, p)


    local p = ultimate.itemPanel("Оптимизация 3", 3, 110):GetItemPanel()

    ultimate.ui.Button("Максимальная оптимизация (FPS Boost)", function()
        RunConsoleCommand("mat_specular", "0")
        RunConsoleCommand("mat_bumpmap", "0")
        RunConsoleCommand("mat_phong", "0")
        RunConsoleCommand("mat_hdr_level", "0")
        RunConsoleCommand("r_shadows", "0")
        RunConsoleCommand("cl_csm_enabled", "0")
        RunConsoleCommand("r_dynamic", "0")
        RunConsoleCommand("r_drawparticles", "0")
        RunConsoleCommand("r_drawsprites", "0")
        RunConsoleCommand("r_3dsky", "0")
        RunConsoleCommand("cl_detaildist", "0")
        RunConsoleCommand("cl_detailfade", "0")
        RunConsoleCommand("mat_postprocess_enable", "0")
        RunConsoleCommand("mat_motion_blur_enabled", "0")
        RunConsoleCommand("mat_bloomscale", "0")
        RunConsoleCommand("r_waterforceexpensive", "0")
        RunConsoleCommand("r_cheapwaterstart", "1")
        RunConsoleCommand("r_cheapwaterend", "1")
        RunConsoleCommand("r_shadowrendertotexture", "0")
        RunConsoleCommand("r_shadowmaxrendered", "0")
        RunConsoleCommand("r_spray_lifetime", "0")
        RunConsoleCommand("violence_ablood", "0")
        RunConsoleCommand("violence_hblood", "0")
        RunConsoleCommand("mat_antialias", "0")
        RunConsoleCommand("mat_forceaniso", "0")
        RunConsoleCommand("mat_trilinear", "0")
        RunConsoleCommand("mat_picmip", "2")
    end, p)

    ultimate.ui.Button("Сбросить оптимизацию (по умолчанию)", function()
        RunConsoleCommand("mat_specular", "1")
        RunConsoleCommand("mat_bumpmap", "1")
        RunConsoleCommand("mat_phong", "1")
        RunConsoleCommand("mat_hdr_level", "2")
        RunConsoleCommand("r_shadows", "1")
        RunConsoleCommand("cl_csm_enabled", "1")
        RunConsoleCommand("r_dynamic", "1")
        RunConsoleCommand("r_drawparticles", "1")
        RunConsoleCommand("r_drawsprites", "1")
        RunConsoleCommand("r_3dsky", "1")
        RunConsoleCommand("cl_detaildist", "1200")
        RunConsoleCommand("cl_detailfade", "400")
        RunConsoleCommand("mat_postprocess_enable", "1")
        RunConsoleCommand("mat_motion_blur_enabled", "1")
        RunConsoleCommand("mat_bloomscale", "1")
        RunConsoleCommand("r_waterforceexpensive", "1")
        RunConsoleCommand("r_cheapwaterstart", "0")
        RunConsoleCommand("r_cheapwaterend", "0")
        RunConsoleCommand("r_shadowrendertotexture", "1")
        RunConsoleCommand("r_shadowmaxrendered", "32")
        RunConsoleCommand("r_spray_lifetime", "2")
        RunConsoleCommand("violence_ablood", "1")
        RunConsoleCommand("violence_hblood", "1")
        RunConsoleCommand("mat_antialias", "1")
        RunConsoleCommand("mat_forceaniso", "4")
        RunConsoleCommand("mat_trilinear", "1")
        RunConsoleCommand("mat_picmip", "0")
    end, p)
end



ultimate.ttable = {}

ultimate.ttable["Aimbot"]   = ultimate.tabs.Aimbot
ultimate.ttable["Rage"]     = ultimate.tabs.Rage
ultimate.ttable["Visuals"]  = ultimate.tabs.Visuals
ultimate.ttable["Misc"]     = ultimate.tabs.Misc
ultimate.ttable["Config"] = ultimate.tabs.Config
ultimate.ttable["Settings"] = ultimate.tabs.Settings
ultimate.ttable["Players"]  = ultimate.tabs.Players
ultimate.ttable["Entities"]  = ultimate.tabs.Entities
ultimate.ttable["Optimization"]  = ultimate.tabs.Optimization
ultimate.ttable["Lua executor"]  = ultimate.tabs.LuaExecutor


function ultimate.initTab(tab)
    if ultimate.scrollpanel != nil then ultimate.scrollpanel:Remove() end

    ultimate.scrollpanel = vgui.Create("UScroll",ultimate.frame)

    ultimate.pty = { 5, 5, 5 }
    // ultimate.ESPPP:Hide()
    ultimate.ttable[tostring(tab)]()
end

function ultimate.tabButton(tab,par) 
    surface.SetFont("DermaSmall")
    local textWidth, textHeight = surface.GetTextSize(tab)

    local buttonHeight = math.max(28, textHeight + 10)

    local b = par:Add("DButton")
    b:Dock(TOP)
    b:DockMargin(4,4,4,0)
    b:SetTall(buttonHeight)
    b:SetText("")
    b:SetCursor("hand")
    
    function b:DoClick()
        ultimate.activetab = tab
        ultimate.initTab(tab)
    end

    function b:Paint(width,height)
        -- animations
        local dt = FrameTime()
        self._hover = self._hover or 0
        self._active = self._active or 0
        local isActive = ultimate.activetab == tab or self.Depressed or self:IsDown()
        self._hover = Lerp(dt * 12, self._hover, self:IsHovered() and 1 or 0)
        self._active = Lerp(dt * 14, self._active, isActive and 1 or 0)

        local function mix(c1, c2, t)
            return Color(
                c1.r + (c2.r - c1.r) * t,
                c1.g + (c2.g - c1.g) * t,
                c1.b + (c2.b - c1.b) * t,
                (c1.a or 255) + ((c2.a or 255) - (c1.a or 255)) * t
            )
        end

        local baseC   = ultimate.Colors[30]
        local hoverC  = ultimate.Colors[40]
        local activeC = ultimate.Colors[54]

        local bg = mix(baseC, hoverC, self._hover)
        bg = mix(bg, activeC, self._active)

        -- background (rounded)
        draw.RoundedBox(6, 0, 0, width, height, bg)
        -- outline
        surface.SetDrawColor(0, 0, 0, 90)
        surface.DrawOutlinedRect(0, 0, width, height, 1)

        -- left accent stripe (animates on hover/active) - match menu palette
        local c = ultimate.Colors[80]
        local accent = Color(c.r, c.g, c.b, 200)
        local stripeW = 3 + 3 * math.max(self._hover, self._active)
        surface.SetDrawColor(accent)
        surface.DrawRect(0, 0, stripeW, height)

        -- text
        surface.SetFont("DermaSmall")
        local tx = (width - textWidth) * 0.5
        local ty = (height - textHeight) * 0.5 - 1
        local tr = Lerp(self._active, Lerp(self._hover, 200, 225), 245)
        surface.SetTextColor(tr, tr, tr, 255)
        surface.SetTextPos(tx, ty)
        surface.DrawText(tab)
    end
end

ultimate.tabButton( "Aimbot",        ultimate.frame:GetLeftPanel() ) 
ultimate.tabButton( "Rage",          ultimate.frame:GetLeftPanel() ) 
ultimate.tabButton( "Visuals",       ultimate.frame:GetLeftPanel() ) 
ultimate.tabButton( "Misc",          ultimate.frame:GetLeftPanel() ) 
ultimate.tabButton( "Config",        ultimate.frame:GetLeftPanel() )
ultimate.tabButton( "Settings",      ultimate.frame:GetLeftPanel() ) 
ultimate.tabButton( "Players",       ultimate.frame:GetLeftPanel() ) 
ultimate.tabButton( "Entities",      ultimate.frame:GetLeftPanel() )
ultimate.tabButton( "Optimization",      ultimate.frame:GetLeftPanel() )
ultimate.tabButton( "Lua executor",  ultimate.frame:GetLeftPanel() )


ultimate.ttable["Aimbot"]()

// Input 

function ultimate.IsKeyDown( key )
    if key >= 107 then
        return input.IsMouseDown( key )
    end

    return input.IsKeyDown( key )
end

/*
    Create Move start
*/

// cm stuff

ultimate.target             = false  
ultimate.aimingrn           = false 

ultimate.targetVector       = Vector()
ultimate.predictedVector    = Vector()
ultimate.backtrackVector    = Vector()
ultimate.nullVec            = Vector() * -1

ultimate.SilentAngle        = pLocalPlayer:EyeAngles()

ultimate.SkipCommand        = false
ultimate.SendPacket         = true

ultimate.traceStruct        = { mask = MASK_SHOT, filter = pLocalPlayer }
ultimate.badSweps           = { ["gmod_camera"] = true, ["manhack_welder"] = true, ["weapon_medkit"] = true, ["gmod_tool"] = true, ["weapon_physgun"] = true, ["weapon_physcannon"] = true, ["weapon_bugbait"] = true, }
ultimate.badSeqs            = { [ACT_VM_RELOAD] = true, [ACT_VM_RELOAD_SILENCED] = true, [ACT_VM_RELOAD_DEPLOYED] = true, [ACT_VM_RELOAD_IDLE] = true, [ACT_VM_RELOAD_EMPTY] = true, [ACT_VM_RELOADEMPTY] = true, [ACT_VM_RELOAD_M203] = true, [ACT_VM_RELOAD_INSERT] = true, [ACT_VM_RELOAD_INSERT_PULL] = true, [ACT_VM_RELOAD_END] = true, [ACT_VM_RELOAD_END_EMPTY] = true, [ACT_VM_RELOAD_INSERT_EMPTY] = true, [ACT_VM_RELOAD2] = true }
ultimate.cones              = {}
ultimate.parsedbones        = {}

ultimate.swbNormal          = bit.bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER)
ultimate.swbWall            = bit.bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX)
ultimate.swbPen             = {[MAT_SAND] = 0.5, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2}
ultimate.swbShit            = { ["swb_knife"] = true, ["swb_knife_m"] = true }

ultimate.m9kPenetration     = { ["SniperPenetratedRound"] = 20, ["pistol"] = 9, ["357"] = 12, ["smg1"] = 14, ["ar2"] = 16, ["buckshot"] = 5, ["slam"] = 5, ["AirboatGun"] = 17, }
ultimate.m9kMaxRicochet     = { ["SniperPenetratedRound"] = 10, ["pistol"] = 2, ["357"] = 5, ["smg1"] = 4, ["ar2"] = 5, ["buckshot"] = 0, ["slam"] = 0, ["AirboatGun"] = 9, }
ultimate.m9kCanRicochet     = { ["SniperPenetratedRound"] = true, ["pistol"] = true, ["buckshot"] = true, ["slam"] = true }
ultimate.m9kPenMaterial     = { [MAT_GLASS] = true, [MAT_PLASTIC] = true, [MAT_WOOD] = true, [MAT_FLESH] = true, [MAT_ALIENFLESH] = true }

ultimate.activeWeapon       = false 
ultimate.activeWeaponClass  = false 
ultimate.moveType           = pLocalPlayer:GetMoveType() 

ultimate.backtracktick      = 0

function ultimate.AutoWall( dir, plyTarget )
	if not ultimate.activeWeapon or ultimate.swbShit[ ultimate.activeWeaponClass ] then return false end 

	local eyePos = pLocalPlayer:EyePos()
	
	local function SWBAutowall()

        ultimate.traceStruct.start = eyePos
        ultimate.traceStruct.endpos = eyePos + dir * ultimate.activeWeapon.PenetrativeRange
        ultimate.traceStruct.filter = pLocalPlayer
        ultimate.traceStruct.mask = ultimate.swbNormal

		local trEnter = TraceLine( ultimate.traceStruct )
		if not (trEnter.Hit and not trEnter.HitSky) then return false end

		local dot = -dir:Dot(trEnter.HitNormal)
		if not (ultimate.activeWeapon.CanPenetrate and dot > 0.26) then return false end

        local matMul = ( ultimate.swbPen[trEnter.MatType] or 1 )
        local maxPenDist = ultimate.activeWeapon.PenStr * matMul * ultimate.activeWeapon.PenMod

        ultimate.traceStruct.start = trEnter.HitPos
        ultimate.traceStruct.endpos = trEnter.HitPos + dir * maxPenDist
        ultimate.traceStruct.filter = pLocalPlayer
        ultimate.traceStruct.mask = ultimate.swbWall

        local trExit = TraceLine( ultimate.traceStruct )
        if trExit.StartSolid or trExit.Fraction >= 1 then return false end

        local thickness = trExit.HitPos:Distance(trEnter.HitPos)
        if thickness <= 0 or thickness > maxPenDist then return false end

        ultimate.traceStruct.start = trExit.HitPos
        ultimate.traceStruct.endpos = trExit.HitPos + dir * 32768
        ultimate.traceStruct.filter = pLocalPlayer
        ultimate.traceStruct.mask = MASK_SHOT

        local trAfter = TraceLine( ultimate.traceStruct )
        if trAfter.Entity ~= plyTarget then return false end

        local dmg = (ultimate.activeWeapon.Primary and ultimate.activeWeapon.Primary.Damage) or ultimate.activeWeapon.Damage or 10
        local severity = 1
        if trEnter.MatType == MAT_CONCRETE or trEnter.MatType == MAT_METAL then
            severity = 3.3
        elseif trEnter.MatType == MAT_WOOD or trEnter.MatType == MAT_PLASTIC or trEnter.MatType == MAT_GLASS then
            severity = 1.25
        end
        local remaining = maxPenDist - thickness
        if remaining <= 0 then return false end

        local damageAfter = dmg / severity
        if damageAfter <= 1 then return false end

        if ultimate.cfg.vars["Ignores-Head unhitable"] then
            return trAfter.HitGroup == 1 and damageAfter > 1
        end
        return damageAfter > 1
	end
	
	local function M9KAutowall()
        local penetrate_cvar = GetConVar( "M9KDisablePenetration" )
        if IsValid(penetrate_cvar) then
            if ( penetrate_cvar:GetBool() ) then
                return false 
            end
        end

		if !ultimate.activeWeapon.Penetration then
			return false
		end

        ultimate.traceStruct.start = eyePos
        ultimate.traceStruct.endpos = eyePos + dir * 32768
        ultimate.traceStruct.filter = pLocalPlayer
        ultimate.traceStruct.mask = MASK_SHOT

		local trEnter = TraceLine( ultimate.traceStruct )
        if not (trEnter.Hit and not trEnter.HitSky) then return false end
        if trEnter.Entity == plyTarget then return false end

        local maxPenetration    = 14
        if ultimate.m9kPenetration[ ultimate.activeWeapon.Primary.Ammo ] then
            maxPenetration = ultimate.m9kPenetration[ ultimate.activeWeapon.Primary.Ammo ]
        end
        if maxPenetration <= 0 then return false end

        local penDir = trEnter.Normal * maxPenetration
        if ultimate.m9kPenMaterial[ trEnter.MatType ] then
            penDir = trEnter.Normal * ( maxPenetration * 2 )
        end

        ultimate.traceStruct.start = trEnter.HitPos + penDir
        ultimate.traceStruct.endpos = trEnter.HitPos
        ultimate.traceStruct.filter = pLocalPlayer
        ultimate.traceStruct.mask = MASK_SHOT
        local trExit = TraceLine( ultimate.traceStruct )
        if trExit.StartSolid or trExit.Fraction >= 1 then return false end

        local thickness = trExit.HitPos:Distance(trEnter.HitPos)
        if thickness <= 0 then return false end

        ultimate.traceStruct.start = trExit.HitPos
        ultimate.traceStruct.endpos = trExit.HitPos + dir * 32768
        ultimate.traceStruct.filter = pLocalPlayer
        ultimate.traceStruct.mask = MASK_SHOT
        local penTrace = TraceLine( ultimate.traceStruct )
        if penTrace.Entity ~= plyTarget then return false end

        local baseDamage = (ultimate.activeWeapon.Primary and ultimate.activeWeapon.Primary.Damage) or ultimate.activeWeapon.Damage or 10
        local damageMulti = 0.5
        if ultimate.activeWeapon.Primary and ultimate.activeWeapon.Primary.Ammo == "SniperPenetratedRound" then
            damageMulti = 1
        elseif trEnter.MatType == MAT_CONCRETE or trEnter.MatType == MAT_METAL then
            damageMulti = 0.3
        elseif trEnter.MatType == MAT_WOOD or trEnter.MatType == MAT_PLASTIC or trEnter.MatType == MAT_GLASS then
            damageMulti = 0.8
        elseif trEnter.MatType == MAT_FLESH or trEnter.MatType == MAT_ALIENFLESH then
            damageMulti = 0.9
        end

        local expectedDamage = baseDamage * damageMulti
        if expectedDamage <= 1 then return false end

        if ultimate.cfg.vars["Ignores-Head unhitable"] then
            return penTrace.HitGroup == 1 and expectedDamage > 1
        end
        return expectedDamage > 1
	end

    if string.StartsWith( ultimate.activeWeaponClass, "m9k_" ) or string.StartsWith( ultimate.activeWeaponClass, "bender_" ) then
		return M9KAutowall()
	elseif string.StartsWith( ultimate.activeWeaponClass, "swb_" ) then
		return SWBAutowall()
	end
	
	return false
end


function ultimate.VisibleCheck( who, where, predticks, awalldir )
    local start = pLocalPlayer:EyePos()

    if predticks then start = start + ( pLocalPlayer:GetVelocity() * flTickInterval ) * predticks end

    ultimate.traceStruct.start = start
	ultimate.traceStruct.endpos = where
	ultimate.traceStruct.mask = MASK_SHOT
    ultimate.traceStruct.filter = pLocalPlayer

    local tr = TraceLine( ultimate.traceStruct )

    local canhit = tr.Entity == who or tr.Fraction == 1

    if !canhit and awalldir and ultimate.cfg.vars["Wallz"] then 
        return ultimate.AutoWall( awalldir, who )
    end

    if ultimate.cfg.vars["Ignores-Head unhitable"] and tr.HitGroup != 1 then return false end

    return canhit
end

ultimate.flServerTime = 0
function ultimate.CanShoot( cmd )
	if not ultimate.activeWeapon then return false end
	local seq = ultimate.activeWeapon:GetSequence()

    if ultimate.cfg.binds["Aim on key"] != 0 and not ultimate.IsKeyDown( ultimate.cfg.binds["Aim on key"] ) then
        return false
    end

	if ultimate.badSweps[ ultimate.activeWeaponClass ] then
		return false
	end

    if ultimate.moveType == MOVETYPE_NOCLIP then
        return false
    end

    if ultimate.cfg.vars["Auto fire"] and cmd:KeyDown(IN_ATTACK) then
        return false
    end

	if ultimate.cfg.vars["Bullet time"] and ultimate.activeWeapon:GetNextPrimaryFire() >= ultimate.flServerTime then
		return false
	end

    // print(ded.GetRandomSeed( cmd ))
    if ultimate.cfg.vars["Wait for seed"] and ded.GetRandomSeed( cmd ) != 134 then
        return false 
    end

	return ultimate.activeWeapon:Clip1() != 0 and !ultimate.badSeqs[ seq ] 
end 

function ultimate.Spread( cmd, ang, spread )
	if not ultimate.activeWeapon or not ultimate.cones[ ultimate.activeWeaponClass ] then return ang end

	local dir = ded.PredictSpread( cmd, ang, spread )

	local newangle = ang + dir:Angle()
	newangle:Normalize()

	return newangle
end

/*
    Nospread 
*/
 
ultimate.CustomSpread = {}

function ultimate.CustomSpread.swb(cmd, ang)
    local weapon = ultimate.activeWeapon
    local ply = pLocalPlayer
    if not IsValid(weapon) or not IsValid(ply) then return ang end

    local isJumpShift = (ply.KeyDown and ply:KeyDown(IN_JUMP)) and (ply.KeyDown and ply:KeyDown(IN_SPEED))
    if isJumpShift then
        return ang
    end

    local tick = (engine and engine.TickInterval and engine.TickInterval()) or 0.015
    local aimFov = (ultimate.cfg.vars and ultimate.cfg.vars["Aim FOV"]) or 180
    local standVelThreshold = 5

    local vel = (ply.GetPredictedVelocity and ply:GetPredictedVelocity() or ply:GetVelocity()):Length()
    local crouched = ply:Crouching()
    local aiming = weapon.dt and weapon.dt.State == SWB_AIMING

    local baseHip = weapon.HipSpread or 0.02
    local baseAim = weapon.meSpread or baseHip
    local cone = aiming and baseAim or baseHip

    local exp = weapon.Owner and weapon.Owner.Expertise
    if exp then
        if aiming and exp["steadyme"] then
            cone = cone * (1 - (exp["steadyme"].val or 0) * 0.0015)
        elseif (not aiming) and exp["wepprof"] then
            cone = cone * (1 - (exp["wepprof"].val or 0) * 0.0015)
        end
    end

    if crouched then
        cone = cone * (aiming and 0.1 or 0.05)
    end

    local baseVelMod = 0.001
    local velMod = baseVelMod + (vel / 10000) * (weapon.VelocitySensitivity or 1)
    if aiming then
        velMod = velMod * (weapon.meMobilitySpreadMod or 1)
    end

    ply.LastView = ply.LastView or ang:Forward()
    local diff = (ang:Forward() - ply.LastView):Length()
    ply.ViewAff = Lerp(0.25, ply.ViewAff or 0, diff * 0.5)
    ply.LastView = ang:Forward()

    local addSpread = weapon.AddSpread or 0
    cone = math.Clamp(cone + velMod + (ply.ViewAff or 0) + addSpread, 0, (weapon.MaxSpreadInc or 0.08) + 0.09)

    weapon.CurCone = cone
    weapon.BaseCone = cone - velMod - (ply.ViewAff or 0) - addSpread

    if CurTime() > (weapon.SpreadWait or 0) then
        weapon.AddSpread = math.max(addSpread - 0.005 * (weapon.AddSpreadSpeed or 1), 0)
        weapon.AddSpreadSpeed = math.Clamp((weapon.AddSpreadSpeed or 0) + 0.05, 0, 1)
    end

    if crouched then cone = cone * 0.1 end

    if weapon.Stamina and weapon.Stamina < 0.5 then
        cone = cone * (1.1 + (0.5 - weapon.Stamina))
    end

    if vel < standVelThreshold then
        cone = cone * 0.95
    end

    local bestAim, bestDelta
    do
        local shootPos = ply:GetShootPos()
        for _, v in ipairs(player.GetAll()) do
            if not (IsValid(v) and v ~= ply and v:Alive() and v:Team() ~= ply:Team()) then goto cont end

            local preferred = {
                (ultimate.cfg.vars and ultimate.cfg.vars["Hitbox Selection"]) or "ValveBiped.Bip01_Head1",
                "ValveBiped.Bip01_Neck1",
                "ValveBiped.Bip01_Spine2"
            }
            local pos
            for _, hb in ipairs(preferred) do
                local b = v:LookupBone(hb)
                if b then
                    local p = v:GetBonePosition(b)
                    if p and p ~= vector_origin then
                        pos = p
                        break
                    end
                end
            end
            if not pos then pos = v:EyePos() end

            local vvel = v.GetVelocity and v:GetVelocity() or Vector(0, 0, 0)
            local shooterVel = ply.GetVelocity and ply:GetVelocity() or Vector(0, 0, 0)
            local relVel = vvel - shooterVel
            local distSqr = pos:DistToSqr(shootPos)
            local dist = distSqr > 0 and math.sqrt(distSqr) or 0
            local cfg = ultimate.cfg and ultimate.cfg.vars or nil
            local cfgVel = cfg and cfg["Bullet Velocity"] or nil
            local muzzleVel = cfgVel or weapon.BulletVelocity or weapon.ProjectileVelocity or 3200
            local predMul = cfg and cfg["Predict Aggressiveness"] or 1.0
            local maxLead = cfg and cfg["Predict Max Lead"] or 0.4
            local pingFactor = cfg and cfg["Predict Ping Factor"] or 0.5
            local leadTime = muzzleVel > 0 and (dist / muzzleVel) or 0
            local ping = (ply.Ping and ply:Ping() or 0) / 1000
            leadTime = leadTime + math.min(ping * pingFactor, 0.15)
            leadTime = math.Clamp(leadTime * predMul, 0, maxLead)
            pos = pos + relVel * leadTime

            local tr = util.TraceLine({
                start = shootPos,
                endpos = pos,
                filter = { ply, weapon },
                mask = MASK_SHOT
            })
            if tr.Hit and tr.Entity ~= v then
                local dir = (pos - shootPos):GetNormalized()
                local aimAng = dir:Angle()
                local right, up = aimAng:Right(), aimAng:Up()
                local foundVisible = false
                local radii = {3, 6, 9}
                for _, r in ipairs(radii) do
                    for i = 0, 3 do
                        local ang = i * (math.pi / 2)
                        local offset = right * (math.cos(ang) * r) + up * (math.sin(ang) * r)
                        local p2 = pos + offset
                        local tr2 = util.TraceLine({
                            start = shootPos,
                            endpos = p2,
                            filter = { ply, weapon },
                            mask = MASK_SHOT
                        })
                        if not tr2.Hit or tr2.Entity == v then
                            pos = p2
                            foundVisible = true
                            break
                        end
                    end
                    if foundVisible then break end
                end
                if not foundVisible then goto cont end
            end

            local aimAng = (pos - shootPos):Angle()
            local delta = math.abs(math.AngleDifference(ang.yaw, aimAng.yaw)) + math.abs(math.AngleDifference(ang.pitch, aimAng.pitch))
            if (not bestDelta or delta < bestDelta) and delta < aimFov then
                bestDelta = delta
                bestAim = aimAng
            end
            ::cont::
        end
    end

    local baseAim = ang
    if bestAim then
        baseAim = bestAim
    end

    local cnum = cmd:CommandNumber()
    if not cnum or cnum == 0 then
        cnum = math.floor((CurTime() * 1000) % 2147483647)
    end
    math.randomseed(cnum)
    local spreadX = math.Rand(-cone, cone)
    local spreadY = math.Rand(-cone, cone)
    local spreadAng = Angle(spreadX * 25, spreadY * 25, 0)

    return baseAim - spreadAng
end

function ultimate.CustomSpread.cw( cmd, ang )
    local cone = ultimate.activeWeapon.CurCone
    if !cone then return ang end

    math.randomseed( cmd:CommandNumber() )
    return ang - Angle( math.Rand(-cone, cone), math.Rand(-cone, cone), 0 ) * 25
end
function ultimate.CustomSpread.fas2( cmd, ang )
    math.randomseed( CurTime() )

    local dir = Angle( math.Rand( -ultimate.activeWeapon.CurCone, ultimate.activeWeapon.CurCone ), math.Rand( -ultimate.activeWeapon.CurCone, ultimate.activeWeapon.CurCone ), 0 ) * 25
    local dir2 = dir 
            
    if ultimate.activeWeapon.ClumpSpread and ultimate.activeWeapon.ClumpSpread > 0 then
        dir2 = dir + Vector( math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * ultimate.activeWeapon.ClumpSpread
    end

    return ang - dir2
end

function ultimate.CustomSpread.tfa( cmd, ang )

    
    return ang
end

function ultimate.CustomSpread.mg( cmd, ang )
    /*
    local pWeapon = ultimate.activeWeapon

    local flCone = pWeapon:GetCone()

    math.randomseed( pWeapon.Cone.Seed + pWeapon:Clip1() + pWeapon:Ammo1() )

    local flSpread = math.Rand( -flCone, flCone ) * 1000

    if ( flSpread < -flCone ) then
        flSpread = -flCone
    elseif ( flSpread > flCone ) then
        flSpread = flCone
    end

    flSpread = flSpread * 0.1

    local vSpread = Vector( 1, -flSpread, flSpread )
    local newAngle = ang + vSpread:Angle()
    newAngle:Normalize()

    return newAngle
    */
end

/*
local function Zc(self, bd)
    local cd = self:GetCone()
    Xc(self.Cone.Seed + self:Clip1() + self:Ammo1())
    local dd = Wc(-cd, cd) * 1000
    if (dd < -cd) then
        dd = -cd
    elseif (dd > cd) then
        dd = cd
    end
    dd = dd * 0.1
    Yc.x = dd
    Yc.y = -dd
    local ed = self.Bullet
    self:FireBullets(
        {
            Attacker = bd,
            Src = bd:EyePos(),
            Dir = (bd:EyeAngles() + bd:GetViewPunchAngles()):Forward(),
            Spread = Yc,
            Num = ed.NumBullets,
            Distance = (ed.Range * 100) / 2.54,
            Tracer = ed.Tracer and 1 or 0,
            Callback = function(fd, gd, hd)
            end
        }
    )
end
*/

ultimate.SpreadComps = {}

ultimate.SpreadComps["swb"]     = ultimate.CustomSpread.swb
ultimate.SpreadComps["cw"]      = ultimate.CustomSpread.cw
ultimate.SpreadComps["fas2"]    = ultimate.CustomSpread.fas2
ultimate.SpreadComps["tfa"]     = ultimate.CustomSpread.tfa
--ultimate.SpreadComps["mg"]     = ultimate.CustomSpread.mg








function ultimate.NoSpread(cmd, ang)
    if not ultimate.activeWeapon or ultimate.swbShit[ ultimate.activeWeaponClass ] then return ang end
    local base = string.Split( ultimate.activeWeaponClass, "_" )[ 1 ]

    if ultimate.SpreadComps[ base ] then
        ang = ultimate.SpreadComps[ base ]( cmd, ang )
    elseif ultimate.cones[ ultimate.activeWeaponClass ] then
        local spread = ultimate.cones[ ultimate.activeWeaponClass ]
        return ultimate.Spread( cmd, ang, spread ) 
    end

    return ang
end

function ultimate.NoRecoil( ang )  
	if ultimate.activeWeaponClass == "weapon_pistol" or string.StartsWith( ultimate.activeWeaponClass,"m9k_" ) or string.StartsWith( ultimate.activeWeaponClass,"bb_" ) or string.StartsWith( ultimate.activeWeaponClass,"unclen8_" ) then
		return ang
	else
	    ang = ang - pLocalPlayer:GetViewPunchAngles()
    end

	return ang
end

/*
ultimate.ui.ComboBox( p, "Hitscan mode", { "Damage", "Safety", "Scale" }, "Hitscan mode" )

*/

function ultimate.ParseBones( ply, bone )
    local mdl = ply:GetModel()

    if ultimate.parsedbones[ mdl ] and ultimate.parsedbones[ mdl ][ bone ] then 
        return ultimate.parsedbones[ mdl ][ bone ]
    end

    if not ultimate.parsedbones[ mdl ] then
        ultimate.parsedbones[ mdl ] = {}
    end
        
    local set = ply:GetHitboxSet()
    local bonecount = ply:GetBoneCount()

    for i = 0, bonecount - 1 do 
		local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

		if bone == group then
			ultimate.parsedbones[ mdl ][ bone ] = i

            return i
        end
	end

    for i = 0, bonecount - 1 do 
        local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

        if bone > 1 and group == 0 then
            ultimate.parsedbones[ mdl ][ bone ] = i

            return i
        end
    end

    return 0
end

function ultimate.MultipointGroupCheck( group )
    if group == 1 and not ultimate.cfg.vars["Multipoint groups-Head"] then return false end
    if group == 2 and not ultimate.cfg.vars["Multipoint groups-Chest"] then return false end
    if group == 3 and not ultimate.cfg.vars["Multipoint groups-Stomach"] then return false end
    if group == 4 or group == 5 and not ultimate.cfg.vars["Multipoint groups-Arms"] then return false end
    if group == 6 or group == 7 and not ultimate.cfg.vars["Multipoint groups-Legs"] then return false end
    if group == 0 and not ultimate.cfg.vars["Multipoint groups-Generic"] then return false end

    return true 
end

function ultimate.GetBones( ply )
    local scaleMin = ultimate.cfg.vars["Multipoint scale min"] or 0.5
    local scaleMax = ultimate.cfg.vars["Multipoint scale max"] or 0.9
    local pos = ply:LocalToWorld(ply:OBBCenter())
    local set = ply:GetHitboxSet()

    if ultimate.cfg.vars["Hitscan"] then
        local set = ply:GetHitboxSet()
        local bonecount = ply:GetBoneCount()

        pos = {}

        for i = 0, bonecount - 1 do 
            local group = ply:GetHitBoxHitGroup( i, set )

            if group == nil then continue end

            if group == 1 and not ultimate.cfg.vars["Hitscan groups-Head"] then continue end
            if group == 2 and not ultimate.cfg.vars["Hitscan groups-Chest"] then continue end
            if group == 3 and not ultimate.cfg.vars["Hitscan groups-Stomach"] then continue end
            if group == 4 or group == 5 and not ultimate.cfg.vars["Hitscan groups-Arms"] then continue end
            if group == 6 or group == 7 and not ultimate.cfg.vars["Hitscan groups-Legs"] then continue end
            if group == 0 and not ultimate.cfg.vars["Hitscan groups-Generic"] then continue end

            pos[ #pos + 1 ] = { bone = i, hitgroup = group }
        end

        if not pos or not istable( pos ) then return end

        local valid = {}

        for i = 1, #pos do
            local bone = pos[ i ].bone
            local hitboxbone = ply:GetHitBoxBone( bone, set )

            if hitboxbone == nil then 
                continue 
            end 

            local mins, maxs = ply:GetHitBoxBounds( bone, set )

            if not mins or not maxs then 
                continue
            end 

            local bonepos, ang = ply:GetBonePosition( hitboxbone )
            
            local scaleMin = ultimate.cfg.vars["Multipoint scale min"] or 0.5
            local scaleMax = ultimate.cfg.vars["Multipoint scale max"] or 0.9

            if ultimate.cfg.vars["Multipoint"] and ultimate.MultipointGroupCheck(pos[i].hitgroup) then
                local points = {
                    ((mins + maxs) * 0.5),
                    Vector(mins.x, mins.y, mins.z),
                    Vector(mins.x, maxs.y, mins.z),
                    Vector(maxs.x, maxs.y, mins.z),
                    Vector(maxs.x, mins.y, mins.z),
                    Vector(maxs.x, maxs.y, maxs.z),
                    Vector(mins.x, maxs.y, maxs.z),
                    Vector(mins.x, mins.y, maxs.z),
                    Vector(maxs.x, mins.y, maxs.z)
                }

                for i = 1, #points do
                    points[i]:Rotate(ang)
                    points[i] = points[i] + bonepos

                    if i == 1 then continue end

                    local interpScale = Lerp((i - 1) / (#points - 1), scaleMin, scaleMax)
                    points[i] = ((points[i] - points[1]) * interpScale) + points[1]

                    valid[#valid + 1] = points[i]
                end
            end

            mins:Rotate( ang )
            maxs:Rotate( ang )

            valid[ #valid + 1 ] = bonepos + ( ( mins + maxs ) * 0.5 )
        end

        return valid
    else
        local bone = ultimate.ParseBones( ply, ultimate.cfg.vars["Hitbox selection"] ) 

        local hitboxbone = ply:GetHitBoxBone( bone, set )

        if hitboxbone == nil then 
            return { pos }  
        end 

        local mins, maxs = ply:GetHitBoxBounds( bone, set )

        if not mins or not maxs then 
            return { pos } 
        end 

        local bonepos, ang = ply:GetBonePosition( hitboxbone )  

        if ultimate.cfg.vars["Multipoint"] then
            local scaleMin = ultimate.cfg.vars["Multipoint scale min"] or 0.5
            local scaleMax = ultimate.cfg.vars["Multipoint scale max"] or 0.9

            local points = {
                ((mins + maxs) * 0.5),
                Vector(mins.x, mins.y, mins.z),
                Vector(mins.x, maxs.y, mins.z),
                Vector(maxs.x, maxs.y, mins.z),
                Vector(maxs.x, mins.y, mins.z),
                Vector(maxs.x, maxs.y, maxs.z),
                Vector(mins.x, maxs.y, maxs.z),
                Vector(mins.x, mins.y, maxs.z),
                Vector(maxs.x, mins.y, maxs.z)
            }

            for i = 1, #points do
                points[i]:Rotate(ang)
                points[i] = points[i] + bonepos

                if i == 1 then continue end

                local t = (i - 1) / (#points - 1)
                local interpScale = Lerp(t, scaleMin, scaleMax)

                points[i] = ((points[i] - points[1]) * interpScale) + points[1]
            end

            return points
        else
            mins:Rotate(ang)
            maxs:Rotate(ang)

            pos = bonepos + ( ( mins + maxs ) * 0.5 )
        end
    end

    return { pos }
end

function ultimate.GetSortedPlayers(mode, selfpred, plypred, vischeck)
    local players   = player.GetAll()
    local eyepos    = pLocalPlayer:EyePos()
    local valid     = {}
    local priority  = {}

    if selfpred then
        eyepos = eyepos + (pLocalPlayer:GetVelocity() * flTickInterval) * selfpred
    end

    local iTeamLocal = ultimate.GetTeam(pLocalPlayer)

    local function IsTargetInFov(target)
        if not IsValid(target) then return false end

        local bone = ultimate.GetBones(target)[1]
        if not bone then return false end

        local angToTarget = (bone - pLocalPlayer:GetShootPos()):Angle()
        local view = pLocalPlayer:EyeAngles()

        local yawDiff = math.AngleDifference(view.yaw, angToTarget.yaw)
        local pitchDiff = math.AngleDifference(view.pitch, angToTarget.pitch)
        local fov = math.abs(yawDiff) + math.abs(pitchDiff)
        local maxFov = 180
        
        return fov <= maxFov
    end

    for i = 1, #players do
        local v = players[i]
        if v == pLocalPlayer then continue end
        if not v:Alive() or (v:IsDormant() and not ultimate.cfg.vars["Dormant ESP"]) then continue end

        if ultimate.cfg.vars["Ignores-Bots"] and v:IsBot() then continue end
        if ultimate.cfg.vars["Ignores-Friends"] and ultimate.cfg.friends[v:SteamID()] then continue end
        if ultimate.cfg.vars["Ignores-Steam friends"] and v:GetFriendStatus() == "friend" then continue end
        if ultimate.cfg.vars["Ignores-Admins"] and v:IsAdmin() then continue end
        if ultimate.cfg.vars["Ignores-Frozen"] and v:IsFlagSet(FL_FROZEN) then continue end
        if ultimate.cfg.vars["Ignores-Nodraw"] and v:IsEffectActive(EF_NODRAW) then continue end
        if ultimate.cfg.vars["Ignores-God time"] and (type(v.HasGodMode) == "function" and v:HasGodMode()) then continue end
        if ultimate.cfg.vars["Ignores-Driver"] and v:InVehicle() then continue end
        local iTeamEnemy = ultimate.GetTeam(v)
        local st = v:Team()
        if st == TEAM_SPECTATOR or (ultimate.cfg.vars["Ignores-Teammates"] and iTeamLocal == iTeamEnemy) then continue end
        if ultimate.cfg.vars["Ignores-Nocliping"] and v:GetMoveType() == MOVETYPE_NOCLIP then continue end

        if vischeck then
            local bone = ultimate.GetBones(v)[1]
            if bone then
                local dir = pLocalPlayer:GetShootPos() - bone
                dir:Normalize()

                if not ultimate.VisibleCheck(v, bone, selfpred, dir) then
                    continue
                end
            end
        end

        local pos = v:GetPos()
        if plypred then
            pos = pos + (v:GetVelocity() * flTickInterval) * plypred
        end

        local entry = { v, pos }

        if ultimate.cfg.vars["Enable Priority List"] and ultimate.trackedPlayers and ultimate.trackedPlayers[v:SteamID()] then
            table.insert(priority, entry)
        else
            table.insert(valid, entry)
        end
    end

    local function sortTargets(tbl)
        if mode == 1 then
            table.sort(tbl, function(a, b)
                return (a[2] - eyepos):LengthSqr() < (b[2] - eyepos):LengthSqr()
            end)
        elseif mode == 2 then
            table.sort(tbl, function(a, b)
                local aScr, bScr = a[2]:ToScreen(), b[2]:ToScreen()
                local aDist = ((screenWidth * 0.5) - aScr.x)^2 + ((screenHeight * 0.5) - aScr.y)^2
                local bDist = ((screenWidth * 0.5) - bScr.x)^2 + ((screenHeight * 0.5) - bScr.y)^2
                return aDist < bDist
            end)
        end
    end

    sortTargets(priority)
    sortTargets(valid)

    if ultimate.cfg.vars["Enable Priority List"] then
        if #priority > 0 then
            ultimate.target = priority[1][1]
            return priority
        else
            return nil
        end
    else
        for i = 1, #valid do
            priority[#priority + 1] = valid[i]
        end

        if #priority == 0 then return end

        ultimate.target = priority[1][1]
        return priority
    end
end


function ultimate.IsTickHittable( ply, cmd, tick )
    if ded.GetLatency(0) > 1 then return false end

    local serverArriveTick = ultimate.flServerTime + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - ultimate.btrecords[ ply ][ tick ].simulationtime

    if diff > ultimate.cfg.vars["Backtrack time"] / 1000 then return false end

    return true
end

function ultimate.FindBacktrack( cmd, ply )
    local ticks = #ultimate.btrecords[ ply ]
    local canhit = {}

    for i = 1, ticks do
        if ultimate.IsTickHittable( ply, cmd, i ) then
            canhit[ #canhit + 1 ] = i
        end
    end

    return canhit
end

function ultimate.FindFirstHittableTicks( ply, cmd )
    local tickcount = #ultimate.btrecords[ ply ]

    if !tickcount then return 1 end

    for i = 1, tickcount do
        if ultimate.IsTickHittable( ply, cmd, i ) then
            return i
        end
    end
end

do
    local lastdist, lasttick = 1337, 1

    function ultimate.FindClosestHittableTicks( ply, cmd )
        local mypos = pLocalPlayer:EyePos()
        local records = ultimate.btrecords[ ply ]
        local firstticks = ultimate.FindFirstHittableTicks( ply, cmd )
        local tickcount = #records

        if !tickcount or !firstticks then return 1 end

        lastdist = math.huge
    
        for i = 1, tickcount - firstticks do
            local mt = i + firstticks

            if ( records[ mt ].aimpos ):DistToSqr( mypos ) < lastdist then
                lastdist = ( records[ mt ].aimpos ):DistToSqr( mypos )
                lasttick = mt
            end
        end

        return lasttick
    end
end
function ultimate.SelectTarget( cmd )
    local plys = ultimate.GetSortedPlayers( ultimate.cfg.vars["Target selection"] )
    ultimate.target     = false


    if !plys then return end 

    local maxplys       = ultimate.cfg.vars["Max targets"]
    local curplys       = #plys

    if maxplys != 0 and curplys > maxplys then
        curplys = maxplys
    end

    local vEyePos = pLocalPlayer:EyePos()

    local aimAng
    for i = 1, curplys do
		local ply = plys[i][1]

        local iMaxDistance = ultimate.cfg.vars[ "Max distance" ]
        local iDistance = vEyePos:DistToSqr( ply:EyePos() )

        if ( iMaxDistance ~= 0 and iDistance > ( iMaxDistance * iMaxDistance ) ) then
            continue 
        end
        






        if not ultimate.cfg.vars["Always backtrack"] then
            local bones = ultimate.GetBones( ply )

            for o = 1, #bones do
                local bone = bones[o]
                aimAng = ( bone - pLocalPlayer:EyePos() ):Angle()

                if ultimate.VisibleCheck( ply, bone, nil, aimAng:Forward() ) then 
                    ultimate.target = ply
                    return ply, bone, aimAng, false, 0
                end
            end
        elseif ultimate.cfg.vars["Extrapolation"] and ultimate.predicted[ ply ] then
            if not ultimate.predicted[ ply ].pos then return end

            aimAng = ( ultimate.predicted[ ply ].pos - pLocalPlayer:EyePos() ):Angle()

            ultimate.traceStruct.start = pLocalPlayer:EyePos()
            ultimate.traceStruct.endpos = ultimate.predicted[ ply ].pos
            ultimate.traceStruct.filter = pLocalPlayer
            ultimate.traceStruct.mask = MASK_SHOT

            local tr = TraceLine( ultimate.traceStruct )

            if !tr.Hit or tr.Entity == ply then
                ultimate.target = ply
                return ply, ultimate.predicted[ ply ].pos, aimAng, false, 0
            end
        end

        if ultimate.cfg.vars["Backtrack"] then
            local ticks = ultimate.FindBacktrack( cmd, ply )

            if ultimate.btrecords[ ply ] and not ply.break_lc then 
                local ts = 0 
                
                if ultimate.cfg.vars["Backtrack mode"] == 3 then
                    for p = 1, #ticks do
                        if not ultimate.btrecords[ ply ][ p ] then continue end

                        aimAng = ( ultimate.btrecords[ ply ][ p ].aimpos - pLocalPlayer:EyePos() ):Angle()

                        ultimate.traceStruct.start = pLocalPlayer:EyePos()
                        ultimate.traceStruct.endpos = ultimate.btrecords[ ply ][ p ].aimpos
                        ultimate.traceStruct.filter = pLocalPlayer
                        ultimate.traceStruct.mask = MASK_SHOT

                        local tr = TraceLine( ultimate.traceStruct )

                        if !tr.Hit or tr.Entity == ply then
                            ultimate.target = ply
                            ultimate.backtracktick = p

                            return ply, ultimate.btrecords[ ply ][ p ].aimpos, aimAng, true, p
                        end
                    end
                end

                if ultimate.cfg.vars["Backtrack mode"] == 3 then return end

                if ultimate.cfg.vars["Backtrack mode"] == 1 then
                    ts = ultimate.FindFirstHittableTicks( ply, cmd )
                elseif ultimate.cfg.vars["Backtrack mode"] == 2 then
                    ts = ultimate.FindClosestHittableTicks( ply, cmd )
                end

                if not ultimate.btrecords[ ply ][ ts ] then return end

                aimAng = ( ultimate.btrecords[ ply ][ ts ].aimpos - pLocalPlayer:EyePos() ):Angle()

                ultimate.traceStruct.start = pLocalPlayer:EyePos()
                ultimate.traceStruct.endpos = ultimate.btrecords[ ply ][ ts ].aimpos
                ultimate.traceStruct.filter = pLocalPlayer
                ultimate.traceStruct.mask = MASK_SHOT

                local tr = TraceLine( ultimate.traceStruct )

                if !tr.Hit or tr.Entity == ply then
                    ultimate.target = ply
                    ultimate.backtracktick = ts

                    return ply, ultimate.btrecords[ ply ][ ts ].aimpos, aimAng, true, ts
                end
            end
        end
	end
end

function ultimate.IsMovementKeysDown( cmd )

    if cmd:KeyDown( IN_MOVERIGHT ) then
        return true 
    end 
    
    if cmd:KeyDown( IN_MOVELEFT ) then
        return true 
    end 

    if cmd:KeyDown( IN_FORWARD ) then
        return true 
    end 

    if cmd:KeyDown( IN_BACK ) then
        return true 
    end 

    return false
end

function ultimate.MovementFix( cmd, wish_yaw )

	local pitch = math.NormalizeAngle( cmd:GetViewAngles().x )
	local inverted = -1
	
	if ( pitch > 89 || pitch < -89 ) then
		inverted = 1
	end

	local ang_diff = math.rad( math.NormalizeAngle( ( cmd:GetViewAngles().y - wish_yaw ) * inverted ) )

	local forwardmove = cmd:GetForwardMove()
	local sidemove = cmd:GetSideMove()

	local new_forwardmove = forwardmove * -math.cos( ang_diff ) * inverted + sidemove * math.sin( ang_diff )
	local new_sidemove = forwardmove * math.sin( ang_diff ) * inverted + sidemove * math.cos( ang_diff )

	cmd:SetForwardMove( new_forwardmove )
	cmd:SetSideMove( new_sidemove )
end

function ultimate.DoSilentAngleUpdate( UserCmd )
    local pWeapon = pLocalPlayer:GetActiveWeapon()

    if ( IsValid( pWeapon ) ) then
        if ( pWeapon.FreezeMovement and pWeapon:FreezeMovement() ) then 
            return 
        end

        local bIsInUse = UserCmd:KeyDown( IN_USE ) or pLocalPlayer:KeyDown(IN_USE)

        if ( pWeapon:GetClass() == "weapon_physgun" and IsValid( pWeapon:GetInternalVariable( "m_hGrabbedEntity" ) ) and bIsInUse ) then 
            return 
        end
    end

    local mYaw = GetConVar( "m_yaw" ):GetFloat()
    local mPitch = GetConVar( "m_pitch" ):GetFloat()

    local silentAngle = ultimate.SilentAngle

    silentAngle.x = math.Clamp( silentAngle.x + UserCmd:GetMouseY() * mPitch, -89, 89 )
    silentAngle.y = silentAngle.y + UserCmd:GetMouseX() * -mYaw
    silentAngle.r = 0
    
    silentAngle:Normalize()

    return silentAngle
end





















// Knife bot ( Etot zaichik knifer )

ultimate.knifes = {}

ultimate.knifes[1] = {
    str = "csgo_",

    canbackstab = true,

    leftdmg = 25,
    leftdmgb = 90,
    leftdist = 64*64,

    rightdmg = 65,
    rightdmgb = 180,
    rightdist = 48*48,
}

ultimate.knifes[2] = {
    str = "swb_",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 50*50,

    rightdmg = 40,
    rightdmgb = 40,
    rightdist = 50*50,
}

ultimate.knifes[3] = {
    str = "weapon_crowba",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 75*75,

    rightdmg = 10,
    rightdmgb = 10,
    rightdist = 75*75,
}

ultimate.knifes[4] = {
    str = "knife_",

    canbackstab = true,

    leftdmg = 25,
    leftdmgb = 90,
    leftdist = 64*64,

    rightdmg = 65,
    rightdmgb = 180,
    rightdist = 48*48,
}

ultimate.knifes[5] = {
    str = "umb_",

    canbackstab = false,

    leftdmg = 1000,
    leftdmgb = 1000,
    leftdist = 300*300,

    rightdmg = 1000,
    rightdmgb = 1000,
    rightdist = 300*300,
}

function ultimate:EntityFaceBack( ent )
    local angle = pLocalPlayer:GetAngles().y - ent:GetAngles().y

    if angle < -180 then angle = 360 + angle end

    if angle <= 90 and angle >= -90 then return true end

    return false
end

function ultimate.CanStab(ent, pos, health)
    local mypos = pLocalPlayer:GetShootPos()
    local tbl = ultimate.knifes[1]
    local wc = pLocalPlayer:GetActiveWeapon():GetClass()
    local canuse = false

    for i = 1, #ultimate.knifes do
        if string.StartsWith(wc, ultimate.knifes[i].str) then
            canuse = true
            tbl = ultimate.knifes[i]
            break
        end
    end

    if not canuse then return false, false end

    if ultimate.canBacktrack(ent) and ultimate.btrecords[ent][ultimate.backtracktick] then
        pos = ultimate.btrecords[ent][ultimate.backtracktick].aimpos
    end

    local backstab = tbl.canbackstab and ultimate:EntityFaceBack(ent) or false
    local dist = mypos:DistToSqr(pos)

    local tr = util.TraceLine({
        start = mypos,
        endpos = pos,
        filter = {pLocalPlayer, pLocalPlayer:GetActiveWeapon()},
        mask = MASK_SHOT
    })

    if tr.Hit and tr.Entity ~= ent then
        return false, false
    end

    local aimDir = pLocalPlayer:GetAimVector()
    local toTarget = (pos - mypos):GetNormalized()
    local dot = aimDir:Dot(toTarget)
    if dot < 0.85 then
        return false, false
    end

    local mode = ultimate.cfg.vars["Knifebot mode"] or 1

    local can_left, can_right

    if mode == 1 then
        can_left = dist < tbl.leftdist and ((backstab and tbl.leftdmgb > 0) or tbl.leftdmg > 0)
        can_right = dist < tbl.rightdist and ((backstab and tbl.rightdmgb > 0) or tbl.rightdmg > 0)
    elseif mode == 2 then
        can_left = dist < tbl.leftdist and tbl.leftdmg > 0
        can_right = dist < tbl.rightdist and tbl.rightdmg > 0
    elseif mode == 3 then
        can_left = dist < tbl.leftdist and ((backstab and tbl.leftdmgb >= health) or tbl.leftdmg >= health)
        can_right = dist < tbl.rightdist and ((backstab and tbl.rightdmgb >= health) or tbl.rightdmg >= health)
    else
        can_left = dist < tbl.leftdist and ((backstab and tbl.leftdmgb > 0) or tbl.leftdmg > 0)
        can_right = dist < tbl.rightdist and ((backstab and tbl.rightdmgb > 0) or tbl.rightdmg > 0)
    end

    if can_left and can_right then
        if tbl.rightdist <= tbl.leftdist then
            return true, true
        else
            return true, false
        end
    elseif can_right then
        return true, true
    elseif can_left then
        return true, false
    end

    return false, false
end

// Crossbow prediction 

function ultimate.CrossbowPred(cmd)
    if not ultimate.CanShoot(cmd) then return end

    local plys = ultimate.GetSortedPlayers(ultimate.cfg.vars["Target selection"])
    if not plys then return end

    for idx = 1, #plys do
        local ply = plys[idx][1]
        if not IsValid(ply) or not ply:Alive() then continue end

        local eyePos = pLocalPlayer:EyePos()
        local plyCenter = ply:OBBCenter()
        local targetPos = ply:GetPos() + plyCenter

        local velocity = 3500
        local gravity = GetConVar("sv_gravity"):GetFloat()

        local distance = eyePos:Distance(targetPos)
        local travelTime = distance / velocity

        local latency = ded.GetLatency(0) + ded.GetLatency(1)
        local simTime = latency + travelTime

        if simTime > ultimate.cfg.vars["Simulation limit"] then continue end

        ded.StartSimulation(ply:EntIndex())

        for t = 1, ultimate.TIME_TO_TICKS(simTime) do
            ded.SimulateTick()
        end

        local data = ded.GetSimulationData()
        ded.FinishSimulation()

        local predictedPos = data.m_vecAbsOrigin + plyCenter

        distance = eyePos:Distance(predictedPos)
        travelTime = distance / velocity

        local ticks = ultimate.TIME_TO_TICKS(travelTime)
        local gravityDrop = (gravity * 0.05) * flTickInterval * ticks
        predictedPos.z = predictedPos.z - gravityDrop

        local aimAngle = (predictedPos - eyePos):Angle()
        aimAngle:Normalize()

        debugoverlay.Line(eyePos, predictedPos, 0.1, color_white, true)

        cmd:SetViewAngles(aimAngle)
        break
    end
end

// Propkill aimbot

ultimate.grabbingEnt = false 

function ultimate.DrawPhysgunBeam( ply, wep, e, tar, bone, hitpos )
    if ply != pLocalPlayer then return end 

    ultimate.grabbingEnt = IsValid( tar ) and tar or false
end
ultimate.predictedPoint = {}
function ultimate.PropAim( cmd )
    if not ultimate.grabbingEnt or not IsValid( ultimate.grabbingEnt ) or not cmd:KeyDown( IN_ATTACK ) then return end

    local plys = ultimate.GetSortedPlayers( ultimate.cfg.vars["Target selection"] )
    ultimate.target = false
    ultimate.targetVector = false

    if !plys then return end

    for i = 1, #plys do
        local ply           = plys[i][1]

        local eyePos        = pLocalPlayer:EyePos() 

        local plyPos        = ply:GetPos()
        local plyVel        = ply:GetVelocity()
        local plyCenter     = ply:OBBCenter()
        local plySpeed      = plyVel:Length()
        //local plyPred       = plyPos + plyVel * flTickInterval

        local propPos       = ultimate.grabbingEnt:GetPos()
        local propVel       = ultimate.grabbingEnt:GetVelocity()
        local propSpeed     = propVel:Length()

        local distance      = plyPos:Distance( propPos )
        local plydist       = plyPos:Distance( eyePos )

        if plydist >= 4096 then continue end

        local travelTime    = distance / propSpeed
        //local predTime      = ( ded.GetLatency( 0 ) + ded.GetLatency( 1 ) ) + travelTime

        if travelTime > ultimate.cfg.vars["Simulation limit"] then continue end // predTime

        // Prediction

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, ultimate.TIME_TO_TICKS( travelTime ) do // predTime
            ded.SimulateTick()
        end

        local data          = ded.GetSimulationData()
        local aimPos        = data.m_vecAbsOrigin + plyCenter

        distance            = aimPos:Distance( propPos )
        travelTime          = distance / propSpeed

        ded.FinishSimulation()

        // Mouse wheel shit

        local deltaDistance = plydist - distance
        local scrollDelta = -deltaDistance

        // Aim

        local aimAng        = ( aimPos - pLocalPlayer:EyePos() ):Angle()
        aimAng:Normalize()

        cmd:SetMouseWheel( scrollDelta ) 
        cmd:SetViewAngles( aimAng )

        /* Method 1
        local scrollDelta = 0

        if distance == 0 then
            scrollDelta = 0
        elseif propSpeed > plySpeed then
            scrollDelta = - ( distance / propSpeed )
        else
            scrollDelta = distance / plySpeed
        end
        */


        /*



        
        local predticks = ultimate.TIME_TO_TICKS( ded.GetLatency(0) + ded.GetLatency(1) ) + 1

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, predticks do
            ded.SimulateTick()
        end

        local data = ded.GetSimulationData()

        pos = data.m_vecAbsOrigin + ply:OBBCenter()

        ded.FinishSimulation()

        local dist = pos:DistToSqr( pLocalPlayer:EyePos() )

        local clr = dist < 16777216 and Color( 0, 255, 0 ) or Color( 255, 0, 0 )

        debugoverlay.Line( pos, ultimate.grabbingEnt:GetPos(), 0.1, clr, true )
        debugoverlay.Box( pos - ply:OBBCenter(), ply:OBBMins(), ply:OBBMaxs(), 0.1, Color( 255, 15, 15, 32 ) )

        if dist >= 16777216 then continue end

        local aimAng = ( pos - pLocalPlayer:EyePos() ):Angle()
        local ppd = ultimate.grabbingEnt:GetPos():DistToSqr( pos )

        local cd = ultimate.cfg.vars["PA thrower dist"]
        if ppd < ( cd * cd ) and ultimate.cfg.vars["PA thrower"] then
            cmd:RemoveKey( IN_ATTACK )
        end

        local bmd = math.sqrt( dist - ppd )

        if ( dist - ppd ) < 0 then bmd = 0 end 

        local scrollDelta = math.ceil( bmd > 0 and -ppd or ppd )

        if scrollDelta > 5000 then
            scrollDelta = 5000
        elseif scrollDelta < -5000 then
            scrollDelta = -5000
        end

        print( "SDelta", scrollDelta, "BMD", bmd, "PPD", ppd )

        cmd:SetMouseWheel( scrollDelta )
        cmd:SetViewAngles( aimAng )
        */
    end
end

function ultimate.LagCompensation(cmd)
    local ply = ultimate.SelectTarget(cmd)
    local ping = ply:Ping()

    local compensationAmount = ping * 0.001 


    local serverTime = GetServerTime()
    local compensatedTime = serverTime - compensationAmount
end

function ultimate.Aim(cmd)
    ultimate.AntiAim(cmd)

    if ultimate.SendPacket then
        ultimate.fakeAngles.angle = cmd:GetViewAngles()
        ultimate.fakeAngles.movex = pLocalPlayer:GetPoseParameter("move_x")
        ultimate.fakeAngles.movey = pLocalPlayer:GetPoseParameter("move_y")

        local layers = {}

        for i = 0, 13 do
            if pLocalPlayer:IsValidLayer(i) then
                layers[i] = {
                    cycle = pLocalPlayer:GetLayerCycle(i),
                    sequence = pLocalPlayer:GetLayerSequence(i),
                    weight = pLocalPlayer:GetLayerWeight(i)
                }
            end
        end

        ultimate.fakeAngles.origin = pLocalPlayer:GetNetworkOrigin()
        ultimate.fakeAngles.seq = pLocalPlayer:GetSequence()
        ultimate.fakeAngles.cycle = pLocalPlayer:GetCycle()
    else
        ultimate.realAngle = cmd:GetViewAngles()
    end

    if ultimate.SendPacket then
        ultimate.lastRealYaw = yourYaw
        ultimate.chokedTicks = 0
    else
        ultimate.lastFakeYaw = yourYaw
        ultimate.chokedTicks = (ultimate.chokedTicks or 0) + 1
    end

    local ply, bone, aimang, backtracking, bttick = ultimate.SelectTarget(cmd)

    ultimate.targetVector = bone 

    if not aimang then return end

    aimang:Normalize()  

    if not ultimate.cfg.vars["Enable aimbot"] or not ply then return end


    local targetTime = ded.GetSimulationTime( ply:EntIndex() )
    local timeOffset = ded.GetServerTime(cmd) - targetTime

    /*local targetTime = ded.GetSimulationTime( ply:EntIndex() )
    local timeOffset = ded.GetServerTime(cmd) - targetTime

    local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - targetTime

    if diff > 1 and ultimate.cfg.vars["Adjust tickcount"] then return end*/

    local oldangs = Angle(aimang)

    if ultimate.cfg.vars["Always backtrack"] and not backtracking then return end

    if ultimate.cfg.vars["Fov limit"] then
        local fov = ultimate.cfg.vars["Aimbot FOV"]

		local view = ultimate.cfg.vars["Silent aim"] and ultimate.SilentAngle or cmd:GetViewAngles()
		local ang = aimang - view

		ang:Normalize()

		ang = math.sqrt(ang.x * ang.x + ang.y * ang.y)

        if ang > fov then
            ultimate.targetVector = false
		    return 
        end
    end

    if not ultimate.CanShoot(cmd) then return end

    if ( ultimate.cfg.vars["Wait for simulation"] and ( ply:GetVelocity():Length() ~= 0 and not ply.simtime_updated ) ) then
        return 
    end

    if not ultimate.cfg.vars["Aimbot smoothing"] and ultimate.SkipCommand then return end

    ultimate.aimingrn = true

    /*if ultimate.cfg.vars["LagCompensation"] and ultimate.target ~= nil then
        local lagCompensationTime = ded.GetRealTime() 
        ultimate.target:SetNWFloat("LagCompensation", lagCompensationTime)
    end*/

    if ultimate.cfg.vars["NoAimLag"] and ultimate.targetVector ~= nil then
        ultimate.targetVector = ply:LagCompensation(false)
    end

    // Knife bot 
    local altfire = false
    local canstab, rightstab = ultimate.CanStab( ply, bone, ply:Health() )

    if ultimate.cfg.vars["Knifebot"] and canstab then
        altfire = rightstab
    elseif ultimate.cfg.vars["Knifebot"] and not canstab then
        return 
    end

    local oldAimAng = aimang
    local finalAngle = aimang

    if ultimate.cfg.vars["Norecoil"] then
        finalAngle = ultimate.NoRecoil(finalAngle)
    end

    if ultimate.cfg.vars["Force seed"] then
        //ded.ForceSeed( cmd )
    end

    if ultimate.cfg.vars["Nospread"] then
        finalAngle = ultimate.NoSpread(cmd,finalAngle)
    end

    if ultimate.cfg.vars["Try Predict"] then
        ang = ultimate.TryPredict(cmd, ang)
    end
    if ultimate.cfg.vars["Custom predict"] then
        finalAngle = ultimate.CustomPredict(cmd, finalAngle)
    end

    if ultimate.cfg.vars["On shot aa"] then
        finalAngle.p = -finalAngle.p - 180
        finalAngle.y = finalAngle.y + 180
    end

    // Не делайте ничего тут, просто оставьте как есть, может быть пригодится
    if ultimate.cfg.vars["TF2 Predict"] and IsValid(me) and IsValid(ply) and ply:Alive() and ply ~= me then
        local weapon = me:GetActiveWeapon()
        if not IsValid(weapon) then return end

        local class = weapon:GetClass()
        local tf2Params = {
            ["weapon_directhit"] =           {speed = 1980, gravity = 0,   offset = Vector(23.5, 8, -5), projectile = true, fireDelay = 0.8},
            ["weapon_quadball"] =            {speed = 900,  gravity = 300, offset = Vector(23.5, 8, -5), projectile = true, fireDelay = 0.8},
            ["weapon_lochnload"] =           {speed = 1440, gravity = 300, offset = Vector(23.5, 8, -5), projectile = true, fireDelay = 0.8},
            ["weapon_q1_rl"] =               {speed = 1600, gravity = 200, offset = Vector(23.5, 8, -5), projectile = true, fireDelay = 0.8},
            ["weapon_pipebomblauncher"] =    {speed = 900,  gravity = 400, offset = Vector(16, 8, -6),  projectile = true, fireDelay = 0.6},
            ["weapon_stickybomblauncher"] =  {speed = 800,  gravity = 500, offset = Vector(16, 8, -6),  projectile = true, fireDelay = 0.6},
        }

        local params = tf2Params[class]
        if not params then return end

        local latency = (ded.GetLatency and (ded.GetLatency(0) + ded.GetLatency(1)) or 0.1) + (GetConVar("cl_interp"):GetFloat() or 0.015)
        latency = math.Clamp(latency, 0.03, 0.3)

        local headBone = ply:LookupBone("ValveBiped.Bip01_Head1") or ply:LookupBone("bip_head")
        local targetPos = headBone and ply:GetBonePosition(headBone) or (ply:GetPos() + Vector(0, 0, 40))
        local velocity = ply:GetVelocity()

        local eyePos = me:EyePos()
        local forward, right, up = me:GetForward(), me:GetRight(), me:GetUp()
        local shootPos = eyePos + forward * params.offset.x + right * params.offset.y + up * params.offset.z

        local bestPos, bestTime = targetPos, latency

        if params.projectile then
            local step, maxTime = 0.015, 2.0
            for t = step, maxTime, step do
                local pred = targetPos + velocity * t
                if not ply:IsOnGround() then
                    pred.z = pred.z - 0.5 * params.gravity * t * t
                end
                local dist = shootPos:Distance(pred)
                local timeEstimate = dist / params.speed
                if math.abs(timeEstimate - t) < step * 1.2 then
                    bestPos = pred
                    bestTime = t
                    break
                end
            end
        else
            bestPos = targetPos + velocity * latency
            if not ply:IsOnGround() then
                bestPos.z = bestPos.z - 0.5 * 800 * latency * latency
            end
        end

        local visible, tracePos = false, bestPos
        for i = 1, 5 do
            local tr = util.TraceLine({
                start = shootPos,
                endpos = tracePos,
                filter = {me, ply},
                mask = MASK_SHOT
            })
            if not tr.Hit or tr.Entity == ply then
                visible = true
                break
            end
            tracePos.z = tracePos.z - 3
        end

        if not visible then return end

        if headBone then
            local headPos = ply:GetBonePosition(headBone)
            if headPos and shootPos:Distance(headPos) < shootPos:Distance(bestPos) * 1.05 then
                bestPos = headPos + velocity * bestTime
            end
        end

        local aimAngle = (bestPos - eyePos):Angle()
        aimAngle:Normalize()

        local dist = shootPos:Distance(bestPos)
        local smoothing = math.Clamp(dist / 2500, 0.03, 0.12)
        finalAngle = finalAngle and LerpAngle(smoothing, finalAngle, aimAngle) or aimAngle

        if visible and weapon:Clip1() > 0 and weapon:GetNextPrimaryFire() <= CurTime() then
            RunConsoleCommand("+attack")
            timer.Simple(params.fireDelay * 0.1, function()
                if IsValid(me) and IsValid(weapon) then
                    RunConsoleCommand("-attack")
                end
            end)
        end

    end
    if ultimate.cfg.vars["SMG Grenade"] then
        local function PredictSMGGrenadePos(ent, predictionTime)
            if not IsValid(ent) then return nil end

            local tickInterval = engine.TickInterval()
            local steps = math.floor(predictionTime / tickInterval)

            local pos = ent:GetPos()
            local vel = ent:GetVelocity()

            local gravity = GetConVar("sv_gravity") and GetConVar("sv_gravity"):GetFloat() or 600
            local drag = 0.98

            for i = 1, steps do
                vel.z = vel.z - gravity * tickInterval
                vel = vel * drag
                pos = pos + vel * tickInterval
            end
            return pos
        end

        local lastFireTime = 0
        local FIRE_DELAY = 2.0

        hook.Add("Think", "SMGGrenadePredictionAndFireControl", function()
            if not ultimate.cfg.vars["SMG Grenade Prediction"] then return end

            local ply = LocalPlayer()
            if not IsValid(ply) then return end

            local weapon = ply:GetActiveWeapon()
            if not IsValid(weapon) or weapon:GetClass() ~= "weapon_smg1" then
                return
            end

            local curTime = CurTime()

            local leftDown = input.IsMouseDown(MOUSE_LEFT)
            local rightDown = input.IsMouseDown(MOUSE_RIGHT)

            if leftDown then
                ply:ConCommand("-attack")
                return
            end

            if not rightDown then return end

            if curTime - lastFireTime < FIRE_DELAY then
                ply:ConCommand("-attack2")
                return
            end

            if rightDown and curTime - lastFireTime >= FIRE_DELAY then
                lastFireTime = curTime
            end

            for _, ent in pairs(ents.FindByClass("grenade_smg1")) do
                if ent:GetOwner() == ply then
                    local predPos = PredictSMGGrenadePos(ent, 0.3)
                    if predPos then
                        ent:SetRenderOrigin(predPos)
                    else
                        ent:SetRenderOrigin(nil)
                    end
                end
            end
        end)
    end

 
  




    
    if ultimate.cfg.vars["Facestab"] then
        local angles = ply:EyeAngles()

        finalAngle.y = angles.y
        finalAngle.p = angles.p

        altfire = true
    end

    if ultimate.cfg.vars["Aimbot smoothing"] then
        local va = cmd:GetViewAngles()
        va.r = 0

        local rat = ultimate.cfg.vars["Smoothing"] * 100
        local ret = LerpAngle( FrameTime()*rat, va, finalAngle )
        
        finalAngle = ret
    end

    if ultimate.cfg.vars["Facestab"] then
        cmd:SetViewAngles( finalAngle )
        ded.SetContextVector( cmd, oldAimAng:Forward(), true )
    elseif ultimate.cfg.vars["pSilent"] then
        ded.SetContextVector( cmd, finalAngle:Forward(), true )
    else
        cmd:SetViewAngles( finalAngle )
    end

    if backtracking then
        targetTime = ultimate.btrecords[ply][bttick].simulationtime
        timeOffset = ultimate.flServerTime - targetTime

        serverArriveTick = ultimate.flServerTime + ded.GetLatency(0) + ded.GetLatency(1)
        diff = serverArriveTick - ultimate.btrecords[ply][bttick].simulationtime

        if diff < 0.2 then
            ded.NetSetConVar("cl_interpolate","0")
            ded.NetSetConVar("cl_interp","0")
            local tick = ultimate.TIME_TO_TICKS(targetTime)
            ded.SetCommandTick(cmd, tick)
        else
            ded.NetSetConVar("cl_interpolate","1")
            ded.NetSetConVar("cl_interp",tostring(ultimate.flServerTime - targetTime))
            local tick = ultimate.TIME_TO_TICKS(ultimate.flServerTime)
            ded.SetCommandTick(cmd, tick - 1)
        end
    elseif ( ultimate.cfg.vars["Adjust tickcount"] and ply.simtime_updated ) then
        local flSimulationTime = ded.GetSimulationTime( ply:EntIndex() )
        local iTickCount = ultimate.TIME_TO_TICKS( flSimulationTime )

        ded.NetSetConVar( "cl_interpolate", "0" )
        ded.NetSetConVar( "cl_interp", "0" )

        ded.SetCommandTick( cmd, iTickCount )
    end

    if ultimate.cfg.vars["Auto fire"] then
        if string.StartsWith( ultimate.activeWeaponClass, "m9k_" ) then
            cmd:RemoveKey( IN_SPEED )
        end

        ultimate.SendPacket = true
        pLocalPlayer.simtime_updated = true

        if ultimate.cfg.vars["Resolver"] and ply then
    -- Если игрок уже зарезолвен Memory Resolver'ом - не увеличиваем счетчик выстрелов
    if not (ultimate.cfg.vars["Memory resolver"] and ply.memoryResolved) then
        ply.aimshots = (ply.aimshots or 0) + 1
    end
end

        local isAutomatic = true

        if ultimate.activeWeapon.Primary then
            isAutomatic = ultimate.activeWeapon.Primary.Automatic
        else
            if class == "weapon_pistol" then
                isAutomatic = false
            end
        end

        if altfire or ( ultimate.cfg.vars["Alt Rapid fire"] and cmd:CommandNumber() % 2 == 0 ) then
            cmd:AddKey(IN_ATTACK2)
        else
            if isAutomatic or ( ultimate.cfg.vars["Rapid fire"] and cmd:CommandNumber() % 2 == 0 ) then
                cmd:AddKey(IN_ATTACK)
            end
        end

        ultimate.SkipCommand = true 
    end
end

function ultimate.autoReload(cmd)
    if !ultimate.cfg.vars["Auto reload"] then return end

	local wep = pLocalPlayer:GetActiveWeapon()

	if IsValid(wep) then
		if wep.Primary then
			if wep:Clip1() == 0 and wep:GetMaxClip1() > 0 and pLocalPlayer:GetAmmoCount(wep:GetPrimaryAmmoType()) > 0 then
				cmd:AddKey(IN_RELOAD)
			end
		end
	end
end

// adaptive Cstrafe

ultimate.last_ground_pos = 0
ultimate.cstrafe_dir = 0

function ultimate.PredictVelocity( velocity, viewangles, dir, maxspeed, accel )

	local forward = viewangles:Forward()
	local right = viewangles:Right()
	
	local fmove = 0
	local smove = ( dir == 1 ) && -10000 || 10000
	
	forward.z = 0
	right.z = 0
	
	forward:Normalize()
	right:Normalize()

	local wishdir = Vector( forward.x*fmove + right.x*smove, forward.y*fmove + right.y*smove, 0 )
	local wishspeed = wishdir:Length()
	
	wishdir:Normalize()
	
	if ( wishspeed != 0 && wishspeed > maxspeed ) then
		wishspeed = maxspeed
	end
	
	local wishspd = wishspeed
	
	if ( wishspd > 30 ) then
		wishspd = 30
	end
	
	local currentspeed = velocity:Dot( wishdir )
	local addspeed = wishspd - currentspeed
	
	if ( addspeed <= 0 ) then
		return velocity
	end
	
	local accelspeed = accel * wishspeed * flTickInterval
	
	if ( accelspeed > addspeed ) then
		accelspeed = addspeed
	end
	
	return velocity + ( wishdir * accelspeed )

end
    
function ultimate.PredictMovement( viewangles, dir, angle )

	local pm

	local sv_airaccelerate = GetConVarNumber( "sv_airaccelerate" )
	local sv_gravity = GetConVarNumber( "sv_gravity" )
	local maxspeed = pLocalPlayer:GetMaxSpeed()
	local jump_power = pLocalPlayer:GetJumpPower()

	local origin = pLocalPlayer:GetNetworkOrigin()
	local velocity = pLocalPlayer:GetAbsVelocity()
	
	local mins = pLocalPlayer:OBBMins()
	local maxs = pLocalPlayer:OBBMaxs()

    local pticks = math.Round(ultimate.cfg.vars["CStrafe ticks"])
	
	local on_ground = pLocalPlayer:IsFlagSet( FL_ONGROUND )
	
	for i = 1, pticks do

		viewangles.y = math.NormalizeAngle( math.deg( math.atan2( velocity.y, velocity.x ) ) + angle )

		velocity.z = velocity.z - ( sv_gravity * flTickInterval * 0.5 )

		if ( on_ground ) then
		
			velocity.z = jump_power
			velocity.z = velocity.z - ( sv_gravity * flTickInterval * 0.5 )
			
		end

		velocity = ultimate.PredictVelocity( velocity, viewangles, dir, maxspeed, sv_airaccelerate )
		
		local endpos = origin + ( velocity * flTickInterval )

		pm = TraceHull( {
			start = origin,
			endpos = endpos,
			filter = pLocalPlayer,
			maxs = maxs,
			mins = mins,
			mask = MASK_PLAYERSOLID
		} )
		
		if ( ( pm.Fraction != 1 && pm.HitNormal.z <= 0.9 ) || pm.AllSolid || pm.StartSolid ) then
			return false
		end
		
		if ( pm.Fraction != 1 ) then
		
			local time_left = flTickInterval

			for j = 1, 2 do
			
				time_left = time_left - ( time_left * pm.Fraction )

				local dot = velocity:Dot( pm.HitNormal )
				
				velocity = velocity - ( pm.HitNormal * dot )

				dot = velocity:Dot( pm.HitNormal )

				if ( dot < 0 ) then
					velocity = velocity - ( pm.HitNormal * dot )
				end

				endpos = pm.HitPos + ( velocity * time_left )

				pm = TraceHull( {
					start = pm.HitPos,
					endpos = endpos,
					filter = pLocalPlayer,
					maxs = maxs,
					mins = mins,
					mask = MASK_PLAYERSOLID
				} )

				if ( pm.Fraction == 1 || pm.AllSolid || pm.StartSolid ) then
					break
				end
			
			end
			
		end
		
		origin = pm.HitPos
		
		if ( ( ultimate.last_ground_pos - origin.z ) > math.Round(ultimate.cfg.vars["CStrafe ground diff"]) ) then
			return false
		end
		
		pm = TraceHull( {
			start =  Vector( origin.x, origin.y, origin.z + 2 ),
			endpos = Vector( origin.x, origin.y, origin.z - 1 ),
			filter = pLocalPlayer,
			maxs = Vector( maxs.x, maxs.y, maxs.z * 0.5 ),
			mins = mins,
			mask = MASK_PLAYERSOLID
		} )
		
		on_ground = ( ( pm.Fraction < 1 || pm.AllSolid || pm.StartSolid ) && pm.HitNormal.z >= 0.7 )
		
		velocity.z = velocity.z - ( sv_gravity * flTickInterval * 0.5 )
		
		if ( on_ground ) then
			velocity.z = 0
		end


	end

	return true

end


function ultimate.CircleStrafe(cmd)
    local cstrafe_angle_step = math.Round(ultimate.cfg.vars["CStrafe angle step"])
    local cstrafe_angle_maxstep = math.Round(ultimate.cfg.vars["CStrafe angle max step"])
    local cstrafe_dir = ultimate.cstrafe_dir or 1

    local angle = 0

    for i = 1, 2 do
        angle = 0
        local path_found = false
        local step = (cstrafe_dir == 1) and cstrafe_angle_step or -cstrafe_angle_step

        while true do
            if cstrafe_dir == 1 then
                if angle > cstrafe_angle_maxstep then
                    break
                end
            else
                if angle < -cstrafe_angle_maxstep then
                    break
                end
            end

            if ultimate.PredictMovement(cmd:GetViewAngles(), cstrafe_dir, angle) then
                path_found = true
                break
            end

            angle = angle + step
        end

        if path_found then
            break
        end

        if cstrafe_dir == 1 then
            cstrafe_dir = 0
        else
            cstrafe_dir = 1
        end
    end

    ultimate.cstrafe_dir = cstrafe_dir

    local velocity = pLocalPlayer:GetAbsVelocity()
    local viewangles = cmd:GetViewAngles()

    local wish_yaw = math.NormalizeAngle(math.deg(math.atan2(velocity.y, velocity.x)) + angle)

    cmd:SetSideMove((cstrafe_dir == 1) and -10000 or 10000)
    ultimate.MovementFix(cmd, wish_yaw)
    
end

do
    local ztick = 0
    local prev_yaw = 0
    local old_yaw = 0.0

    function ultimate.AutoStrafe( cmd )
        ztick = ztick + 1

        if ( ultimate.IsKeyDown(ultimate.cfg.binds["Circle strafe"]) and ultimate.cfg.vars["Circle strafe"] ) then
        
            ultimate.CircleStrafe( cmd )
    
        elseif ( ultimate.IsKeyDown(ultimate.cfg.binds["Z Hop"]) and ultimate.cfg.vars["Z Hop"] ) then
            local handler = ztick / 3.14
            
            cmd:SetSideMove( 5000 * math.sin(handler) )
   
        elseif ultimate.cfg.vars["Air strafer"] and ultimate.cfg.vars["Strafe mode"] == 3 then
    
            local get_velocity_degree = function(velocity)
                local tmp = math.deg(math.atan(30.0 / velocity))
                    
                if (tmp > 90.0) then
                    return 90.0
                elseif (tmp < 0.0) then
                    return 0.0
                else
                    return tmp
                end
            end
    
            local M_RADPI = 57.295779513082
            local side_speed = 10000
            local velocity = pLocalPlayer:GetVelocity()
            velocity.z = 0.0
    
            local forwardmove = cmd:GetForwardMove()
            local sidemove = cmd:GetSideMove()
    
            if (!forwardmove || !sidemove) then
                return
            end
    
            if(velocity:Length2D() <= 15.0 && !(forwardmove != 0 || sidemove != 0)) then
                return
            end
    
            local flip = cmd:TickCount() % 2 == 0
    
            local turn_direction_modifier = flip && 1.0 || -1.0
            local viewangles = Angle(ultimate.SilentAngle.x, ultimate.SilentAngle.y, ultimate.SilentAngle.z)
    
            if (forwardmove || sidemove) then
                cmd:SetForwardMove(0)
                cmd:SetSideMove(0)
    
                local turn_angle = math.atan2(-sidemove, forwardmove)
                viewangles.y = viewangles.y + (turn_angle * M_RADPI)
            elseif (forwardmove) then
                cmd:SetForwardMove(0)
            end
    
            local strafe_angle = math.deg(math.atan(15 / velocity:Length2D()))
    
            if (strafe_angle > 90) then
                strafe_angle = 90
            elseif (strafe_angle < 0) then
                strafe_angle = 0
            end
    
            local temp = Vector(0, viewangles.y - old_yaw, 0)
            temp.y = math.NormalizeAngle(temp.y)
    
            local yaw_delta = temp.y
            old_yaw = viewangles.y
    
            local abs_yaw_delta = math.abs(yaw_delta)
    
            if (abs_yaw_delta <= strafe_angle || abs_yaw_delta >= 30) then
                local velocity_angles = velocity:Angle()
    
                temp = Vector(0, viewangles.y - velocity_angles.y, 0)
                temp.y = math.NormalizeAngle(temp.y)
    
                local velocityangle_yawdelta = temp.y
                local velocity_degree = get_velocity_degree(velocity:Length2D() * 128)
    
                if (velocityangle_yawdelta <= velocity_degree || velocity:Length2D() <= 15) then
                    if (-velocity_degree <= velocityangle_yawdelta || velocity:Length2D() <= 15) then
                        viewangles.y = viewangles.y + (strafe_angle * turn_direction_modifier)
                        cmd:SetSideMove(side_speed * turn_direction_modifier)
                    else
                        viewangles.y = velocity_angles.y - velocity_degree
                        cmd:SetSideMove(side_speed)
                    end
                else
                    viewangles.y = velocity_angles.y + velocity_degree
                    cmd:SetSideMove(-side_speed)
                end
            elseif (yaw_delta > 0) then
                cmd:SetSideMove(-side_speed)
            elseif (yaw_delta < 0) then
                cmd:SetSideMove(side_speed)
            end
    
            local move = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), 0)
            local speed = move:Length()
    
            local angles_move = move:Angle()
    
            local normalized_x = math.modf(ultimate.SilentAngle.x + 180, 360) - 180
            local normalized_y = math.modf(ultimate.SilentAngle.y + 180, 360) - 180
    
            local yaw = math.rad(normalized_y - viewangles.y + angles_move.y)
    
            if (normalized_x >= 90 || normalized_x <= -90 || ultimate.SilentAngle.x >= 90 && ultimate.SilentAngle.x <= 200 || ultimate.SilentAngle.x <= -90 && ultimate.SilentAngle.x <= 200) then
                cmd:SetForwardMove(-math.cos(yaw) * speed)
            else
                cmd:SetForwardMove(math.cos(yaw) * speed)
            end
    
            cmd:SetSideMove(math.sin(yaw) * speed)

        elseif ultimate.cfg.vars["Air strafer"] and ultimate.cfg.vars["Strafe mode"] == 2 then
            cmd:SetForwardMove(0)

            if pLocalPlayer:IsFlagSet( FL_ONGROUND ) then
                cmd:SetForwardMove(10000)
            else
                cmd:SetForwardMove(5850 / pLocalPlayer:GetVelocity():Length2D())
                cmd:SetSideMove((cmd:CommandNumber() % 2 == 0) && -400 || 400)
            end

            /*

local ang_diff = math.NormalizeAngle( ultimate.SilentAngle.y - prev_yaw )
            
            if ( math.abs( ang_diff ) > 0 ) then
            
                if ( ang_diff > 0 ) then
                    cmd:SetSideMove( -10000 )
                else
                    cmd:SetSideMove( 10000 )
                end
            
            else
            
                local vel = pLocalPlayer:GetAbsVelocity()
                local vel_yaw = math.NormalizeAngle( math.deg( math.atan2( vel.y, vel.x ) ) )
                local vel_yaw_diff = math.NormalizeAngle( ultimate.SilentAngle.y - vel_yaw )
                
                if ( vel_yaw_diff > 0 ) then
                    cmd:SetSideMove( -10000 )
                else
                    cmd:SetSideMove( 10000 )
                end
    
                local viewangles = cmd:GetViewAngles() //ultimate.SilentAngle //Angle( ultimate.SilentAngle.x, ultimate.SilentAngle.y, 0 )
                viewangles.y = vel_yaw
                cmd:SetViewAngles( viewangles )
                
            end
    
            prev_yaw = ultimate.SilentAngle.y
            */
            
            
        end
    end
end

/*
    Anti aim

*/

ultimate.aatarget = nil

function ultimate.PredictedPos(ply)
    return ply:GetPos() + ply:GetVelocity() * flTickInterval
end

function ultimate.PredictedEyePos()
    return pLocalPlayer:EyePos() + pLocalPlayer:GetVelocity() * flTickInterval
end

function ultimate.GetBaseYaw()
    if not IsValid( ultimate.aatarget ) or ultimate.cfg.vars["Yaw base"] != 2 then
        return ultimate.SilentAngle.y
    end

    return math.NormalizeAngle( (ultimate.PredictedPos(ultimate.aatarget) - ultimate.PredictedEyePos()):Angle().y )
end

function ultimate.Freestand(cmd)
    if not IsValid(ultimate.aatarget) then return false end

    local ply = pLocalPlayer
    local target = ultimate.aatarget
    local headBone = ply:LookupBone("ValveBiped.Bip01_Head1")
    if not headBone then return false end

    local headPos = ply:GetBonePosition(headBone)
    local eyePos = target:EyePos()
    if not headPos or not eyePos then return false end

    local selfPos = ply:GetShootPos()
    local offsetDist = 30

    local angles = {
        left = (headPos + Angle(0, 90, 0):Forward() * offsetDist),
        right = (headPos + Angle(0, -90, 0):Forward() * offsetDist)
    }

    local function TraceSide(pos)
        local tr = util.TraceLine({
            start = eyePos + target:GetVelocity() * flTickInterval * 4,
            endpos = pos,
            filter = {target, ply}
        })
        return tr.Fraction
    end

    local leftFraction = TraceSide(angles.left)
    local rightFraction = TraceSide(angles.right)

    if leftFraction < rightFraction then
        return true, -60, 60 
    elseif rightFraction < leftFraction then
        return true, 60, -60
    else
        return false
    end
end


ultimate.realAngle = pLocalPlayer:EyeAngles()
ultimate.inverted = false
ultimate.oldYaw = 0
ultimate.SwaySide = 1

local baseyaw = 0

ultimate.CalcYaw = {
    -- 1. Backward
    [1] = function(cmd)
        if not baseyaw then return 0 end
        return baseyaw - 178
    end,

    -- 2. Fake Forward
    [2] = function(cmd)
        if not baseyaw then return 0 end
        return ultimate.SendPacket and baseyaw or baseyaw + 178
    end,

    -- 3. Legit Delta
    [3] = function(cmd)
        if not baseyaw then return 0 end
        return ultimate.SendPacket and baseyaw or baseyaw + (ultimate.inverted and 43 or -43)
    end,

    -- 4. Sideways
    [4] = function(cmd)
        if not baseyaw then return 0 end
        local delta = ultimate.inverted and 89 or -89
        return baseyaw - (ultimate.SendPacket and delta or -delta)
    end,

    -- 5. Half Sideways
    [5] = function(cmd)
        if not baseyaw then return 0 end
        local delta = ultimate.inverted and 89 or -89
        return baseyaw - (ultimate.SendPacket and delta or 178)
    end,

    -- 6. Fake Spin
    [6] = function(cmd)
        if not baseyaw then return 0 end
        local spin_speed = ultimate.cfg.vars and ultimate.cfg.vars["Spin speed"] or 30
        local add = math.NormalizeAngle(CurTime() * spin_speed * 10)
        if ultimate.inverted then
            return ultimate.SendPacket and (baseyaw - 178) or add
        else
            return ultimate.SendPacket and add or (baseyaw - 178)
        end
    end,

    -- 7. LBY
    [7] = function(cmd)
        if not pLocalPlayer or not ded or not ded.GetCurrentLowerBodyYaw then return 0 end
        return ded.GetCurrentLowerBodyYaw(pLocalPlayer:EntIndex()) + (ultimate.SendPacket and 180 or 0)
    end,

    -- 8. LBY Breaker
    [8] = function(cmd)
        if not baseyaw or not pLocalPlayer or not ded then return 0 end
        local yaw = baseyaw - 178
        if pLocalPlayer:GetVelocity():Length2D() > 1 then
            yaw = ded.GetCurrentLowerBodyYaw(pLocalPlayer:EntIndex()) + (ultimate.SendPacket and 180 or 0)
        elseif not ultimate.SendPacket then
            local side = ultimate.inverted and -1 or 1
            local lbyTarget = ded.GetTargetLowerBodyYaw and ded.GetTargetLowerBodyYaw(pLocalPlayer:EntIndex()) or 0
            if math.abs(math.NormalizeAngle(lbyTarget - (ultimate.oldYaw or 0))) < (ultimate.cfg.vars and ultimate.cfg.vars["LBY min delta"] or 100) then
                yaw = math.NormalizeAngle((ultimate.oldYaw or 0) + (ultimate.cfg.vars and ultimate.cfg.vars["LBY break delta"] or 120) * side)
            else
                yaw = math.NormalizeAngle(ded.GetCurrentLowerBodyYaw(pLocalPlayer:EntIndex()) - 44 * side)
            end
        end
        return yaw
    end,

    -- 9. Sin Sway
    [9] = function(cmd)
        if not baseyaw then return 0 end
        local add = ultimate.cfg.vars and ultimate.cfg.vars["Sin add"] or 11
        local sin = math.sin(CurTime()) * (ultimate.cfg.vars and ultimate.cfg.vars["Sin delta"] or 89)
        return ultimate.SendPacket and baseyaw + sin + add or baseyaw - sin - add
    end,

    -- 10. Pendulum Sway
    [10] = function(cmd)
        if not baseyaw then return 0 end
        local ct = CurTime()
        local delta = ultimate.cfg.vars and ultimate.cfg.vars["Sin delta"] or 89
        local ct1 = (ct % 0.9)
        local ct2 = (ct % 2)
        local x1 = ct2 * math.sin(ct1)
        local y1 = ct2 * -1 * math.cos(ct1)
        local x2 = x1 + ct1 * math.sin(ct2)
        local y2 = y1 - ct1 * math.cos(ct2)
        local sin = ultimate.SendPacket and x2 * delta or y2 * delta
        return baseyaw + sin
    end,

    -- 11. Lag Sway
    [11] = function(cmd)
        if not baseyaw then return 0 end
        local swaySpeed = ((ultimate.fakeLagTicks or 0) + 1) / 12 * math.pi
        local swayAmount = math.sin(CurTime() * swaySpeed) * 45
        return (baseyaw - 180) + 55 * (ultimate.SwaySide or 1) + swayAmount * (ultimate.SwaySide or 1) * -1
    end,

    -- 12. Fake Jitter
    [12] = function(cmd)
        if not baseyaw then return 0 end
        local delta = ultimate.cfg.vars and ultimate.cfg.vars["Jitter delta"] or 45
        local a = ultimate.SendPacket and baseyaw - 178 or baseyaw - 178 + math.random(-delta, delta)
        local b = ultimate.SendPacket and baseyaw - 178 + math.random(-delta, delta) or baseyaw - 178
        return ultimate.inverted and a or b
    end,

    -- 13. Kappa Jitter
    [13] = function(cmd)
        if not baseyaw then return 0 end
        local delta = ultimate.cfg.vars and ultimate.cfg.vars["Jitter delta"] or 45
        local a = ultimate.SendPacket and baseyaw - 178 or baseyaw + (delta * (ultimate.SwaySide or 1))
        local b = ultimate.SendPacket and baseyaw + (delta * (ultimate.SwaySide or 1)) or baseyaw - 178
        return ultimate.inverted and a or b
    end,

    -- 14. Abu Jitter
    [14] = function(cmd)
        if not baseyaw then return 0 end
        local ctjit = math.sin(CurTime() * 30) * 25
        return ctjit + (ultimate.SendPacket and baseyaw - 160 * (ultimate.SwaySide or 1) or baseyaw - 160 * -(ultimate.SwaySide or 1))
    end,

    -- 15. Satanic Spin
    [15] = function(cmd)
        if not baseyaw then return 0 end
        local side = ultimate.inverted and 1 or -1
        local satanicvalue = math.sin(CurTime() * 666) * 666
        return math.NormalizeAngle(ultimate.SendPacket and satanicvalue * side or satanicvalue * -side)
    end,

    -- 16. Custom
    [16] = function(cmd)
        if not baseyaw then return 0 end
        return ultimate.SendPacket and baseyaw + (ultimate.cfg.vars and ultimate.cfg.vars["Custom real"] or 75) or baseyaw + (ultimate.cfg.vars and ultimate.cfg.vars["Custom fake"] or 180)
    end,

    -- 17. Spinbot
    [17] = function(cmd)
        if not baseyaw then return 0 end
        local speed = ultimate.cfg.vars and ultimate.cfg.vars["Spin speed"] or 30
        local spin = math.NormalizeAngle(CurTime() * speed * 30)
        return spin
    end,

    -- 18. Randomizer
    [18] = function(cmd)
        if not baseyaw then return 0 end
        return baseyaw + math.random(-180, 180)
    end,
    -- 19 Side jitter
    [19] = function(cmd)
        local jitter = math.random(-25, 25)
        return baseyaw + (ultimate.SendPacket and -90 + jitter or 90 - jitter)
    end


} 








do
    local pitch, yaw = 0, 0 

    local pitches = { 
        [1] = 89,
        [2] = -89,
        [3] = 0,
        [4] = -180,
        [5] = 180,
    }







 






    local mm_side = false
    local side = false
    local pitchflip = false

    local side = 1

    local function CalcPitch()
        local cfg = ultimate.cfg.vars["Pitch"]
        local x = 0

        if cfg <= 5 then return pitches[cfg] end

        if ultimate.SendPacket then
            pitchflip = not pitchflip
        end
        
        if cfg == 6 then
            x = pitchflip and 180 or -180
        elseif cfg == 7 then
            x = pitchflip and -180 or 271
        elseif cfg == 7 then
            x = ultimate.SendPacket and 89 or -180
        elseif cfg == 8 then
            x = math.random(-180,95) and math.random(177,180)
        elseif cfg == 9 then
            x = math.random(-180,-55) and math.random(180,55)
        elseif cfg == 10 then
            x = math.random(180,95) and math.random(-180,-95)
        elseif cfg == 11 then
            x = math.random(-180,-95) and math.random(166,179+2)
        elseif cfg == 12 then
            x = math.random(-180,-115) and math.random(177,179+2)
        elseif cfg == 13 then
            x = pitchflip and -180 or 271
        elseif cfg == 14 then
            if IsValid(pLocalPlayer) then
                local pitch = pLocalPlayer:EyeAngles().x
                if pitch > 89 then
                    x = 89
                elseif pitch < -89 then
                    x = -89
                else
                    x = pitch
                end
            end
        elseif cfg == 15 then
            x = math.random(-89, 89)
        elseif cfg == 16 then
            x = ultimate.SendPacket and 89 or -89
        elseif cfg == 17 then    
            x = ultimate.cfg.vars["Custom pitch"]
        end

        return x
    end

    /*




        elseif cfg == 7 then
            
        elseif cfg == 8 then
            
        elseif cfg == 9 then
            local sin = math.sin( CurTime() ) * 89
            y = ultimate.SendPacket and baseyaw + sin or baseyaw - sin
        elseif cfg == 10 then
            local side = ded.GetPreviousTick() % 2 == 1

            y = ultimate.SendPacket and baseyaw - 180 or baseyaw + ( side and -89 or 89 )    
        elseif cfg == 11 then

        elseif cfg == 12 then
            y = baseyaw + ( ultimate.SendPacket && ultimate.cfg.vars["Custom fake"] || ultimate.cfg.vars["Custom real"] )
        end

"Backward", 
        "Fake forward", 
        "Sideways", 
        "Half sideways", 
        "Fake spin", 
        "LBY", 
        "Kappa", 
        "Sway",
        "VDiff",
        "القضيب الطويل",
        "Lisp",
        "Custom",
if ultimate.cfg.vars["Jitter"] == 2 and ultimate.SendPacket then
            local r = math.random(-45,45)
            local lbydiff = ded.GetTargetLBY(pLocalPlayer:EntIndex()) - ded.GetCurrentLBY(pLocalPlayer:EntIndex())

            if y + r > ded.GetTargetLBY(pLocalPlayer:EntIndex()) then
                y = y + math.random(-lbydiff,lbydiff)
            else
                y = y + r
            end
             
        elseif ultimate.cfg.vars["Jitter"] == 3 and ultimate.SendPacket then
            y = y + math.random(ded.GetCurrentLBY(pLocalPlayer:EntIndex()),ded.GetTargetLBY(pLocalPlayer:EntIndex()))
        end

        */
    
    local function micromovement(cmd)
        if !ultimate.cfg.vars["Micromovement"] then return end
        if !pLocalPlayer:Alive() then return end
        if !pLocalPlayer:IsFlagSet( FL_ONGROUND ) then return end
        if cmd:KeyDown(IN_BACK) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) then return end

        cmd:SetSideMove(mm_side and -15.0 or 15.0)
        mm_side = !mm_side
    end

    local function aacheck(cmd)
        if !ultimate.cfg.vars["Anti aim"] then return false end
        if cmd:KeyDown(IN_ATTACK) then return false end
        if cmd:KeyDown(IN_USE) then return false end
        if ultimate.moveType == MOVETYPE_LADDER then return false end
        if ultimate.moveType == MOVETYPE_NOCLIP then return false end

        if ultimate.cfg.binds["Anti aim"] != 0 and not ultimate.IsKeyDown(ultimate.cfg.binds["Anti aim"]) then
            return false
        end

        return true 
    end

    function ultimate.AntiAim(cmd)
        local freestandsucc, freestandsafe, freestandunsafe 

        if ultimate.cfg.vars["Freestanding"] then
            freestandsucc, freestandsafe, freestandunsafe = ultimate.Freestand(cmd)
        end

        if ultimate.SendPacket then
            ultimate.SwaySide = ultimate.SwaySide * -1 
        end

        baseyaw = ultimate.GetBaseYaw()
        pitch = CalcPitch()
        yaw = ultimate.CalcYaw[ultimate.cfg.vars["Yaw"] ](cmd)

        if ultimate.cfg.vars["Yaw randomisation"] then
            yaw = yaw + math.random( -0.9, 0.9 ) 
        end 

        if freestandsucc then
            yaw = ultimate.SendPacket and freestandunsafe or freestandsafe
        end

        if aacheck(cmd) then
            local pyAngle = Angle(pitch,yaw,0)

            micromovement(cmd)

            cmd:SetViewAngles(pyAngle)
            ultimate.oldYaw = pyAngle.y
        end
    end
end

/*
    Fake lag  
*/
ultimate.fakeLagTicks = 0
ultimate.fakeLagfactor = 0
ultimate.chokedTicks = 0

ultimate.peeked = false 
ultimate.peeking = false 

function ultimate.FakeLagOnPeek()
    ultimate.fakeLagTicks = 21 - ultimate.chokedTicks - 1 

    if ultimate.chokedTicks >= 20 then
        ultimate.peeked = true
		ultimate.peeking = false
		ultimate.SendPacket = true
        pLocalPlayer.simtime_updated = true
		return
    end
end

function ultimate.WarpOnPeek()
	ded.StartShifting( true )

	ultimate.peeked = true
	ultimate.peeking = false
end

function ultimate.CheckPeeking()
	local plys

	for extr = 1, 8 do
        plys = ultimate.GetSortedPlayers( 1, extr, 1, true ) 
		if plys then break end
	end

	if plys and !ultimate.peeking and !ultimate.peeked then
		ultimate.peeking = true
		ultimate.peeked = false
	elseif !plys then
		ultimate.peeking = false
		ultimate.peeked = false
	end

	if ultimate.peeking and !ultimate.peeked then
		if !ded.GetIsShifting() and ded.GetCurrentCharge() >= ultimate.cfg.vars["Shift ticks"] and ultimate.cfg.vars["Warp on peek"] then
			ultimate.WarpOnPeek()
        elseif ultimate.cfg.vars["Freeze on peek"] then
            ded.SetOutSequenceNr( ded.GetOutSequenceNr() + ultimate.maxFreezeTicks - 1 ) 
		//elseif ultimate.cfg.vars["Fake lag options-On peek"] then
		//	ultimate.FakeLagOnPeek()
		end
	end
end




do
    
    local function shouldlag(cmd)
        if not ultimate.cfg.vars["Fake lag"] then return false end
        if not pLocalPlayer:Alive() then return false end
        if ultimate.cfg.vars["Fakelag comp"] == 1 and ded.GetCurrentCharge() > 0 then return false end
        if ultimate.cfg.vars["Fake lag options-Disable on ladder"] and ultimate.moveType == MOVETYPE_LADDER then return false end
        if ultimate.cfg.vars["Fake lag options-Disable in attack"] and cmd:KeyDown(IN_ATTACK) then return false end

        if ultimate.cfg.vars["Allah fly"] and not pLocalPlayer:IsFlagSet( FL_ONGROUND ) then
            return false
        end

        return true
    end

    function ultimate.FakeLag(cmd)
        local factor = math.Round(ultimate.cfg.vars["Lag limit"])

        if ultimate.cfg.vars["Fake lag options-Randomise"] then 
            factor =  math.random(ultimate.cfg.vars["Lag randomisation"],factor) 
        end

        local velocity = pLocalPlayer:GetVelocity():Length2D()
        local pertick = velocity * flTickInterval
        local adaptive_factor = math.Clamp(math.ceil(64 / pertick),1,factor)

        if ultimate.cfg.vars["Lag mode"] == 1 or ultimate.cfg.vars["Lag mode"] == 3 then
            ultimate.fakeLagfactor = factor
        elseif ultimate.cfg.vars["Lag mode"] == 2 then
            ultimate.fakeLagfactor = adaptive_factor
        end

        if ultimate.cfg.vars["Allah walk"] and pLocalPlayer:IsFlagSet( FL_ONGROUND ) and ultimate.IsKeyDown(ultimate.cfg.binds["allahwalk"]) then
            ultimate.fakeLagfactor = 21
        end

        //if ultimate.cfg.vars["Fakelag comp"] == 2 and ded.GetCurrentCharge() > 0 then 
        //    local nfactor = ultimate.fakeLagfactor - ded.GetMaxShiftTicks() - 1
        //    ultimate.fakeLagfactor = math.Clamp( nfactor, 0, 21 )
        //end

        if shouldlag(cmd) then
            ultimate.SendPacket = false

            if ultimate.fakeLagTicks <= 0 then
                ultimate.fakeLagTicks = ultimate.fakeLagfactor
                ultimate.SendPacket = true
                pLocalPlayer.simtime_updated = true

                if IsValid(pLocalPlayer) then
                    pLocalPlayer:InvalidateBoneCache()
                    pLocalPlayer:SetupBones()
                end
            else
                ultimate.fakeLagTicks = ultimate.fakeLagTicks - 1
            end
        else
            if ultimate.fakeLagfactor > 0 then
                ultimate.fakeLagfactor = 0
            end
            ultimate.SendPacket = true
            pLocalPlayer.simtime_updated = true

            if IsValid(pLocalPlayer) then
                pLocalPlayer:InvalidateBoneCache()
                pLocalPlayer:SetupBones()
            end
        end
    end
end

function ultimate.ClampMovementSpeed(cmd, speed)
	local final_speed = speed;

	local squirt = math.sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

	if (squirt > speed) then
		local squirt2 = math.sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

		local cock1 = cmd:GetForwardMove() / squirt2;
		local cock2 = cmd:GetSideMove() / squirt2;

		local Velocity = pLocalPlayer:GetVelocity():Length2D();

		if (final_speed + 1.0 <= Velocity) then
			cmd:SetForwardMove(0)
			cmd:SetSideMove(0)
		else
			cmd:SetForwardMove(cock1 * final_speed)
			cmd:SetSideMove(cock2 * final_speed)
        end
    end
end

function ultimate.FastWalk( cmd )
    if not ultimate.cfg.vars["Ground strafer"] then return end 
    if math.abs(cmd:GetSideMove()) > 1 or math.abs(cmd:GetForwardMove()) < 1 then return end 
    if not pLocalPlayer:IsFlagSet( FL_ONGROUND ) then return end

    if ultimate.moveType == MOVETYPE_NOCLIP or ultimate.moveType == MOVETYPE_LADDER then return end

    local waterLevel = pLocalPlayer:WaterLevel()

    if waterLevel >= 2 then return end
    
	cmd:SetSideMove(cmd:CommandNumber() % 2 == 0 and -5250 or 5250)
end

function ultimate.validMoveType()
    return ultimate.moveType != MOVETYPE_LADDER and ultimate.moveType != MOVETYPE_NOCLIP and ultimate.moveType != MOVETYPE_OBSERVER 
end

function ultimate.isMoving(cmd)
    if not cmd then
        return false
    end

    return ultimate.hoppin or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_BACK) and not cmd:KeyDown(IN_JUMP)
end

function ultimate.Stop(cmd)
    if ultimate.validMoveType() and pLocalPlayer:IsFlagSet( FL_ONGROUND ) then

        local moving = ultimate.isMoving(cmd)

        if not moving then

            local vel = pLocalPlayer:GetVelocity()
            local dir = vel:Angle()
                
            dir.yaw = ultimate.SilentAngle.y - dir.yaw
                
            local newmove = dir:Forward() * vel:Length2D()
        
            cmd:SetForwardMove(0 - newmove.x)
            cmd:SetSideMove(0 - newmove.y)

        end

    end
end

// Slidewalk 

function ultimate.SlideWalk( cmd )
    local ticksToStop = ultimate.fakeLagfactor





end








// Auto peak 

ultimate.startedPeeking = false 
ultimate.needToMoveBack = false
ultimate.startPeekPosition = Vector(0,0,0)

function ultimate.MoveTo( cmd, pos )
    local ang = ( pos - pLocalPlayer:GetPos() ):Angle().y

    cmd:SetForwardMove(1000)
    cmd:SetSideMove(0)

    cmd:AddKey(IN_SPEED)

    ultimate.MovementFix( cmd, ang )
end

function ultimate.checkAutopeak( cmd )
    if ultimate.startedPeeking and cmd:KeyDown(IN_ATTACK) then 
        ultimate.needToMoveBack = true
    elseif !ultimate.startedPeeking and !cmd:KeyDown(IN_ATTACK) then
        ultimate.needToMoveBack = false
    end  
end

do
    local colorA = Color( 235, 75, 75 )
    local colorB = Color( 75, 235, 75 )

    local apmat = Material( "gui/npc.png" )

    local nullangle = Angle(0,0,0)

    function ultimate.drawAutopeak()
        local col = ultimate.needToMoveBack and colorA or colorB
    
        cam.Start3D2D( ultimate.startPeekPosition, nullangle, 0.5 )
            cam.IgnoreZ( true )

            surface.SetDrawColor( col )
            surface.SetMaterial( apmat )
            surface.DrawTexturedRect( -32, -32, 64, 64 )

            cam.IgnoreZ( false )
        cam.End3D2D()
    end
end

function ultimate.autopeakThink()
    if ultimate.IsKeyDown(ultimate.cfg.binds["Auto peak"]) then
        if not ultimate.startedPeeking then
            ultimate.startPeekPosition = pLocalPlayer:GetPos()     
        end

        ultimate.startedPeeking = true
    else
        ultimate.startedPeeking = false
    end
end








// Sequence Manipulation 

ultimate.freezedTicks = 0
ultimate.maxFreezeTicks = math.Round( 1 / flTickInterval ) 
function ultimate.AnimationFreezer()
    if not ultimate.IsKeyDown( ultimate.cfg.binds["Animation freezer"] ) then return end

    if ultimate.freezedTicks < ultimate.maxFreezeTicks then
        ded.SetOutSequenceNr( ded.GetOutSequenceNr() + ultimate.maxFreezeTicks - 1 ) 

        ultimate.freezedTicks = ultimate.freezedTicks + 1
    else
        ultimate.freezedTicks = 0
    end
end

ultimate.seqshit = false
function ultimate.SequenceShit(cmd)
    if not ultimate.cfg.vars["Sequence manip"] or not ultimate.IsKeyDown(ultimate.cfg.binds["Sequence manip"]) then
        
        if ultimate.seqshit then
            ultimate.seqshit = false 
        end

        return 
    end

    local amt = ultimate.cfg.vars["Sequence min random"] and math.random(ultimate.cfg.vars["Sequence min"],ultimate.cfg.vars["OutSequence"]) or ultimate.cfg.vars["OutSequence"] 

    ultimate.seqshit = true
    ultimate.SendPacket = true
    ded.SetOutSequenceNr(ded.GetOutSequenceNr() + amt)
end

// Handjob ( arm breaker )
 
function ultimate.PerformHandjob( cmd )
    local mode = ultimate.cfg.vars["Handjob mode"]
    local shouldjerk = true

    if mode == 2 then
        shouldjerk = (cmd:CommandNumber() % 12) >= 6
    elseif mode == 3 then
        shouldjerk = math.random(0, 1) == 0 
    end

    ded.SetTyping(cmd, shouldjerk)
end   
  

// create move hook 

ultimate.norf = {
    ["laserjetpack"] = true,
    ["weapon_physgun"] = true,
}

ultimate.vapecd = false
ultimate.tyaga = 0
ultimate.maxvape = ultimate.TIME_TO_TICKS(5)
ultimate.hoppin = false
local ic = false

ultimate.slams = {}

function ultimate.OnEntityCreated(ent)
    if ent:GetClass() == "npc_satchel" and ent:GetOwner() == pLocalPlayer then 
        ultimate.slams[ #ultimate.slams + 1 ] = ent
    end
end





local bWasOnGround = false 
function ultimate.CreateMove(cmd)
    ultimate.DoSilentAngleUpdate( cmd )

    ultimate.aimingrn = false

    //if ( ded.GetChokedPackets() > 14 ) then ded.SetChokedPackets( 14 ) end

    if cmd:CommandNumber() == 0 then 
        return 
    end

    ultimate.flServerTime = ded.GetServerTime( cmd )

    //if ded.GetIsShifting() then ultimate.shiftedTicks = ultimate.shiftedTicks + 1 end

    local w = pLocalPlayer:GetActiveWeapon()
    ultimate.activeWeapon       = IsValid( w ) and w or false
    ultimate.activeWeaponClass  = IsValid( w ) and w:GetClass() or false 
    ultimate.moveType           = pLocalPlayer:GetMoveType() 

    //if ultimate.cfg.vars["Passive recharge"] and ded.GetCurrentCharge() < ded.GetMaxShiftTicks() and not pLocalPlayer:Alive() then
    //    ded.SetReloadKeyPressed( true )
    //end


    if ultimate.cfg.vars["Silent aim"] then cmd:SetViewAngles(ultimate.SilentAngle) end

    //if ded.GetIsShifting() then
        //  ded.AdjustTickbase()
    //    print("shifting")
    //end

    if ultimate.cfg.vars["Flashlight spam"] and input.IsKeyDown( KEY_F ) then
        cmd:SetImpulse(100)
    end

    if ultimate.cfg.vars["Auto Vape"] then
        if cmd:KeyDown( IN_ATTACK ) then
            if ultimate.tyaga >= ultimate.maxvape then
                cmd:RemoveKey( IN_ATTACK )
                ultimate.tyaga = 0
            elseif ultimate.tyaga < ultimate.maxvape then
                ultimate.tyaga = ultimate.tyaga + 1 
            end
        else
            ultimate.tyaga = 0
        end
    end

    if ultimate.cfg.vars["Keypad Cracker"] then
        local function SafeNetStart(name)
            if not util or not util.NetworkIDToString then return false end
            for i = 1, 2048 do
                if util.NetworkIDToString(i) == name then
                    net.Start(name)
                    return true
                end
            end
            return false
        end

        local activeKeypad = nil
        local currentPIN = {[0] = "1", [1] = "1", [2] = "1", [3] = "1"}
        local lastCrackTime = 0

        net.Receive("KeypadCracker_OtvetkaEpt", function()
            if not IsValid(activeKeypad) then return end

            local result = net.ReadTable()
            if not result then return end

            for k, v in pairs(result) do
                if v[1] == true then continue end
                if v[2] == ">" then
                    currentPIN[k] = tostring((tonumber(currentPIN[k]) + 1) % 10)
                elseif v[2] == "<" then
                    currentPIN[k] = tostring((tonumber(currentPIN[k]) - 1) % 10)
                end
            end

            if SafeNetStart("KeypadCracker_HackerEpt") then
                net.WriteTable(currentPIN)
                net.SendToServer()

                chat.AddText(Color(0, 255, 0), "[Ultimate Cracker] Попытка: ",
                    Color(255, 255, 255), currentPIN[0] .. currentPIN[1] .. currentPIN[2] .. currentPIN[3])
            end
        end)    
    end    

    if ultimate.cfg.vars["Auto Heal"] then
        local me = LocalPlayer()
        if not me:Alive() then return end

        local health = me:Health()
        local maxHealth = me:GetMaxHealth()
        local weapon = me:GetActiveWeapon()

        local healthThreshold = ultimate.cfg.vars["Health threshold"] or 50
        if health >= maxHealth or health > healthThreshold then return end


        local enemyNearby = false
        for _, ply in ipairs(player.GetAll()) do
            if ply == me or not ply:Alive() then continue end

            if ultimate.cfg.vars["Enable Priority List"] then
                local isFriend = ultimate.cfg.friends[ply:SteamID()]
                if isFriend then continue end
            end

            local distance = me:GetPos():Distance(ply:GetPos())
            if distance < ultimate.cfg.vars["ESP Distance"] then
                enemyNearby = true
                break
            end
        end

        if enemyNearby then
            if me.LastWeapon and me.LastWeapon:IsValid() then
                me:SelectWeapon(me.LastWeapon:GetClass())
            end
            return
        end

        local medkitClass = "weapon_medkit"
        local activeWeapon = weapon and weapon:IsValid() and weapon:GetClass() or ""

        if activeWeapon ~= medkitClass then
            for _, invWep in ipairs(me:GetWeapons()) do
                if invWep and invWep:IsValid() and invWep:GetClass() == medkitClass then
                    me.LastWeapon = weapon
                    me:SelectWeapon(medkitClass)
                    break
                end
            end
            return
        end

        if activeWeapon == medkitClass and health < maxHealth then
            me:ConCommand("+attack")
            timer.Simple(0.1, function()
                me:ConCommand("-attack")
            end)
        end
    end

    if ultimate.vapecd then 
        ultimate.vapecd = false 
        cmd:RemoveKey( IN_ATTACK2 ) 
    elseif ultimate.cfg.vars["Vape spam"] and ultimate.activeWeapon and not ultimate.vapecd and string.StartsWith( ultimate.activeWeaponClass, "weapon_vape" ) then
        cmd:AddKey( IN_ATTACK2 )
        ultimate.vapecd = true
    end   

    if ultimate.cfg.vars["Handjob"] then
        ultimate.PerformHandjob( cmd )
    end 

    //if ultimate.cfg.vars["Fake latency"] then
    //    local amt = ultimate.cfg.vars["Max latency"]
    //    ded.SetInSequenceNr(ded.GetInSequenceNr() - amt)
    //end

    if ultimate.SkipCommand then 
        cmd:RemoveKey( IN_ATTACK ) 
    
        ultimate.SkipCommand = !ultimate.SkipCommand 
    end

    if ( pLocalPlayer:IsFlagSet( FL_ONGROUND ) ) then
		ultimate.last_ground_pos = pLocalPlayer:GetNetworkOrigin().z
	end

    if ultimate.cfg.vars["Animation freezer"] then ultimate.AnimationFreezer() end
    
	ultimate.SequenceShit(cmd)

    if not ultimate.seqshit then
        ultimate.FakeLag(cmd)

        if ultimate.cfg.vars["Allah walk"] and pLocalPlayer:IsFlagSet( FL_ONGROUND ) and ultimate.IsKeyDown(ultimate.cfg.binds["allahwalk"]) then
            
            if ultimate.fakeLagTicks != 20 then
                ultimate.ClampMovementSpeed(cmd, 0)
            else
                ultimate.ClampMovementSpeed(cmd, pLocalPlayer:GetWalkSpeed())
            end

            //if(ultimate.fakeLagTicks <= 20) then
            //    ultimate.ClampMovementSpeed(cmd, 0)
            //    ultimate.Stop(cmd)
                //pLocalPlayer:SetPoseParameter("move_x", 0)
	            //pLocalPlayer:SetPoseParameter("move_y", 0)
            //else
             //   ultimate.ClampMovementSpeed(cmd, pLocalPlayer:GetWalkSpeed())
            //end

            --print(ultimate.fakeLagTicks,pLocalPlayer:GetVelocity():Length2D())
        end
    end

    if ultimate.cfg.vars["Fake lag options-On peek"] or ultimate.cfg.vars["Warp on peek"] or ultimate.cfg.vars["Freeze on peek"] then
        ultimate.CheckPeeking()
    end
    
    // Movement
    
    ultimate.FastWalk( cmd )

    if ultimate.cfg.vars["Sprint"] then cmd:AddKey(IN_SPEED) end

    ultimate.hoppin = false

    if pLocalPlayer:GetMoveType() != MOVETYPE_NOCLIP and pLocalPlayer:GetMoveType() != MOVETYPE_LADDER and pLocalPlayer:GetMoveType() != MOVETYPE_OBSERVER then
        if ( cmd:KeyDown( IN_JUMP ) ) then
            local bIsOnGround = pLocalPlayer:IsFlagSet( FL_ONGROUND )

            if ( not bIsOnGround or bWasOnGround ) then
                cmd:RemoveKey( IN_JUMP )

                bWasOnGround = false 

                if ( not bWasOnGround ) then
                    ultimate.AutoStrafe( cmd )
                end
            else
                bWasOnGround = true
            end

            ultimate.hoppin = true
        end
    end
    
	if ultimate.cfg.vars["Fast stop"] then
        ultimate.Stop(cmd)
    end

    if ultimate.cfg.vars["Water jump"] and pLocalPlayer:WaterLevel() > 1 then
        cmd:AddKey( IN_JUMP )

    elseif ultimate.cfg.vars["Jesus lag"] and ultimate.SendPacket and pLocalPlayer:WaterLevel() == 1 then
        cmd:AddKey( IN_DUCK )
    end  

    if ultimate.cfg.vars["Fake duck"] and ultimate.IsKeyDown(ultimate.cfg.binds["Fake duck"]) then
        if ultimate.fakeLagTicks > (ultimate.fakeLagfactor / 2) then
            cmd:AddKey(IN_DUCK)
        else
            cmd:RemoveKey(IN_DUCK)
        end
    end

    ultimate.targetVector = false

    ded.StartPrediction(cmd)
        local wish_yaw = ultimate.SilentAngle.y 

        if ( ultimate.IsKeyDown(ultimate.cfg.binds["Circle strafe"]) and ultimate.cfg.vars["Circle strafe"] ) then
            wish_yaw = cmd:GetViewAngles().y
        end

        if ultimate.cfg.vars["Crossbow prediction"] and ultimate.activeWeaponClass == "weapon_crossbow" then
            ultimate.CrossbowPred( cmd )
        elseif ultimate.cfg.vars["Prop aimbot"] then
            ultimate.PropAim(cmd)
        else
            ultimate.Aim(cmd)
        end    
        
        if ultimate.cfg.vars["Silent aim"] then
            ultimate.MovementFix( cmd, wish_yaw )
        end

    ded.FinishPrediction()

    if ultimate.cfg.vars["Trigger bot"] and ultimate.IsKeyDown( ultimate.cfg.binds["Trigger bot"] ) then
        local tr = pLocalPlayer:GetEyeTrace().Entity 
        
        if tr and tr:IsPlayer() then
            cmd:AddKey( IN_ATTACK )
        end
    end

    if ultimate.cfg.vars["Double tap"] and ultimate.cfg.vars["Tickbase shift"] and cmd:KeyDown( IN_ATTACK ) then
        //ultimate.shiftedTicks = 0
        ded.StartShifting( true )
    end

    if ultimate.cfg.vars["Auto detonator"] and #ultimate.slams > 0 then
        local d = ultimate.cfg.vars["AutoD distance"]
        d = d * d 

        local plys = player.GetAll()

        for jjj = 1, #plys do
            if plys[ jjj ] == pLocalPlayer then continue end
            
            for k, v in pairs(ultimate.slams) do
                if not IsValid(v) then ultimate.slams[k] = nil continue end
    
                local pos = v:GetPos()
    
                if pos:DistToSqr( plys[ jjj ]:GetPos() + plys[ jjj ]:GetVelocity() * ( flTickInterval * 4 ) ) < d then
                    cmd:AddKey( IN_ATTACK2 )
                    break
                end
            end
        end
    end

    if ultimate.cfg.vars["Auto peak"] then
        local ppos = ultimate.startPeekPosition
        local pposd = pLocalPlayer:GetPos():DistToSqr(ppos)

        if ultimate.needToMoveBack and pposd < 1024 then //or ultimate.IsMovementKeysDown( cmd )
            ultimate.needToMoveBack = false
        end

        if ultimate.startedPeeking then
            //if not ultimate.IsMovementKeysDown( cmd ) then
            //    ultimate.needToMoveBack = true
            //end

            if ultimate.needToMoveBack then
                ultimate.MoveTo( cmd, ppos )

                if ultimate.cfg.vars["Auto peak tp"] and ultimate.cfg.vars["Tickbase shift"] then
                    //ultimate.shiftedTicks = 0
                    ded.StartShifting( true )
                end
            end
        end

        ultimate.checkAutopeak( cmd )
    end

    ultimate.autoReload(cmd)

    if ultimate.cfg.vars["Use spam"] then
        if cmd:KeyDown(IN_USE) then
            cmd:RemoveKey(IN_USE)
        else
            cmd:AddKey(IN_USE)
        end
    end

    if ultimate.cfg.vars["Auto GTA"] then
        local tr = pLocalPlayer:GetEyeTrace().Entity

        if IsValid( tr ) and tr:IsVehicle() then
            cmd:AddKey(IN_USE)
        end
    end

    if ultimate.cfg.vars["Ghost follower"] then
        local tar = player.GetBySteamID( ultimate.cfg.vars["GFID"] )

        if IsValid( tar ) then 
            local tang = ( tar:GetPos() - pLocalPlayer:EyePos() ):Angle()

            cmd:ClearMovement()
            cmd:ClearButtons()

            cmd:SetForwardMove( 10000 )
            cmd:SetSideMove(0)

            cmd:AddKey(IN_SPEED)

            cmd:SetViewAngles( tang )
            ultimate.MovementFix( cmd, tang.y )
        end
    end

    if ultimate.cfg.vars["Trollbot"] then
        local trollTargetInput = ultimate.cfg.vars["Trollbot target"]
        local target
        if trollTargetInput == "LocalPlayer" then
            target = LocalPlayer()
        else
            target = player.GetBySteamID(trollTargetInput)
        end
        if IsValid(target) then
            if not ultimate._trollbot_nextmsg then ultimate._trollbot_nextmsg = 0 end
            if CurTime() > ultimate._trollbot_nextmsg then
                local mode = tonumber(ultimate.cfg.vars["Trollbot mode"]) or 1
                local trolltbl = ultimate.trollmsg[mode] or ultimate.trollmsg[1]
                local msg = trolltbl[math.random(1, #trolltbl)] or ""
                if msg:find("%%s") then
                    msg = msg:format(target:Nick())
                else
                    msg = target:Nick() .. " " .. msg
                end
                RunConsoleCommand("say", msg)
                local delay = tonumber(ultimate.cfg.vars["Troll Delay"]) or 1
                ultimate._trollbot_nextmsg = CurTime() + delay
            end
        end
    end

    if ultimate.cfg.vars["Air lag duck"] and ultimate.SendPacket then
        local startPosUnducked = pLocalPlayer:GetPos()
        local isDucking = bit.band(pLocalPlayer:GetFlags(), FL_DUCKING) != 0
        if isDucking then
            startPosUnducked.z = startPosUnducked.z - (72 - 36)
        end

        ded.StartSimulation( pLocalPlayer:EntIndex() )

        local shouldduck = true 

        for i = 1, 4 do
            ded.SimulateTick()

            local simData = ded.GetSimulationData()

            local maxs = pLocalPlayer:OBBMaxs()
            maxs.z = 72 

            if isDucking then
                simData.m_vecAbsOrigin.z = simData.m_vecAbsOrigin.z - (72 - 36)
            end

            local trace = TraceHull({
                start = startPosUnducked,
                endpos = simData.m_vecAbsOrigin,
                mins = pLocalPlayer:OBBMins(),
                maxs = maxs,
                filter = pLocalPlayer,
                mask = MASK_PLAYERSOLID
            })

            if pLocalPlayer:IsOnGround() and trace.Hit then
                shouldduck = false 
                break
            end
        end

        ded.FinishSimulation()

        if shouldduck and !pLocalPlayer:IsFlagSet( FL_ONGROUND ) then 
            cmd:AddKey( IN_DUCK )   
        end
    end

    if ultimate.fcenabled then
        cmd:ClearMovement()
        cmd:ClearButtons()

        cmd:SetViewAngles(ultimate.fcangles)
    end

    /*if ultimate.cfg.vars["Dodge projectiles"] and ded.GetCurrentCharge() >= ded.GetMaxShiftTicks() and not ded.GetIsShifting() then
        local entitys = ents.GetAll()

        for i = 1, #entitys do
            local v = entitys[ i ]

            if v:GetClass() != "crossbow_bolt" then continue end 

            local mypos = pLocalPlayer:GetPos() + pLocalPlayer:GetVelocity() * flTickInterval 
            local entpos = v:GetPos() + ( v:GetAngles():Forward() * 3500 ) * flTickInterval

            if mypos:DistToSqr( entpos ) > 320 then
                cmd:ClearMovement()
                cmd:ClearButtons()

                cmd:AddKey( IN_SPEED )
                cmd:SetSideMove( 10000 )
                ded.StartShifting( true )
            end
        end
    end*/

    if ultimate.SendPacket then
        ultimate.chokedTicks = 0 
    else
        ultimate.chokedTicks = ultimate.chokedTicks + 1
    end

    if not ultimate.cfg.vars["Silent aim"] then ultimate.SilentAngle = cmd:GetViewAngles() end

    ded.SetBSendPacket( ultimate.SendPacket )
end 
 
/* 
    Render Scene / Anti screengrab 
*/
ultimate.UnSafeFrame = false
ultimate.renderTarget = GetRenderTarget( "YaPidoras" .. os.time(), screenWidth, screenHeight )
do
    local oldsky, oldskycolor, oldwallcolor = ultimate.cfg.vars["Custom sky"], ultimate.cfg.vars["Sky color"], ultimate.cfg.vars["Wall color"]
    local oldskyclr, oldwallclr = ultimate.cfg.colors["Sky color"], ultimate.cfg.colors["Wall color"]

    local worldcollerp = string.ToColor( ultimate.cfg.colors["Wall color"] )
    local worldmats = Entity( 0 ):GetMaterials()

    local origsky = GetConVar("sv_skyname"):GetString()
    local tsides = {"lf", "ft", "rt", "bk", "dn", "up"}
    local skymat = {}

    for i = 1, 6 do 
        skymat[i] = Material("skybox/" .. origsky .. tsides[i]) 
    end

    local function setSkyboxTexture( skyname )
        for i = 1, 6 do
            local t = Material("skybox/" .. skyname .. tsides[i]):GetTexture("$basetexture")
            skymat[i]:SetTexture("$basetexture", t)
        end
    end

    local function setSkyColor( setcolor )
        local cfg = string.ToColor( ultimate.cfg.colors["Sky color"] )
        local vector = setcolor and Vector( cfg.r/255, cfg.g/255, cfg.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, 6 do
            skymat[i]:SetVector( "$color", vector )
        end
    end

    local function setWallColor( setcolor )
        local cfg = string.ToColor( ultimate.cfg.colors["Wall color"] )
        worldcollerp = ultimate.ColorLerp( worldcollerp, cfg )
        local vector = setcolor and Vector( worldcollerp.r/255, worldcollerp.g/255, worldcollerp.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, #worldmats do
            local value = worldmats[i]

            Material( value ):SetVector( "$color", vector )
            Material( value ):SetFloat( "$alpha", setcolor and (cfg.a / 255) or 255 )
        end
    end

    function ultimate.RenderScene()

        local newname, newcolor, newcolor2 = ultimate.cfg.vars["Custom sky"], ultimate.cfg.vars["Sky color"], ultimate.cfg.vars["Wall color"]
        local newskyclr, newwallclr = ultimate.cfg.colors["Sky color"],ultimate.cfg.colors["Wall color"]
        
        if newskyclr != oldskyclr or newcolor != oldskycolor then
            setSkyColor( newcolor )

            oldskyclr = newskyclr
            oldskycolor = newcolor
        end

        if newwallclr != tostring( worldcollerp ) or newcolor2 != oldwallcolor then
            setWallColor( newcolor2 )

            oldwallcolor = newcolor2
        end

        if newname != oldsky then
            setSkyboxTexture( newname )
            oldsky = newname
        end

        // Esp shit

        if ( !gui.IsConsoleVisible() && !gui.IsGameUIVisible() ) || ultimate.UnSafeFrame then
            local view = {
                x = 0,
                y = 0,
                w = screenWidth,
                h = screenHeight,
                dopostprocess = true,
                origin = vOrigin,
                angles = vAngle,
                fov = vFOV,
                drawhud = true,
                drawmonitors = true,
                drawviewmodel = true
            }
         
            render.RenderView( view )
            render.CopyTexture( nil, ultimate.renderTarget )
         
            cam.Start2D()
                hook.Run( "Ungrabbable2D" )
            cam.End2D()

            cam.Start3D()
                hook.Run( "Ungrabbable3D" )
            cam.End3D()
    
            render.SetRenderTarget( ultimate.renderTarget )
         
            return true
        end
    end

end

function ultimate.PreScreenGrab()
    if ultimate.UnSafeFrame then return end
	ultimate.UnSafeFrame = true
 
	render.Clear( 0, 0, 0, 255, true, true )
	render.RenderView( {
		origin = pLocalPlayer:EyePos(),
		angles = pLocalPlayer:EyeAngles(),
		x = 0,
		y = 0,
		w = screenWidth,
		h = screenHeight,
		dopostprocess = true,
		drawhud = true,
		drawmonitors = true,
		drawviewmodel = true
	} )
 
	ultimate.UnSafeFrame = false
end

ultimate.prikol = Material( "a/prikol" ):GetTexture( "$basetexture" ) //  Material( file.Read( "prikol.png", "DATA" ) )

function render.Capture( data )
    ultimate.PreScreenGrab()

    if ultimate.cfg.vars["Screengrab image"] then 
        cam.Start2D()
            render.DrawTextureToScreen( ultimate.prikol )
        cam.End2D()
    end

	return render.Capture( data )
end

function _G.render.Capture( data )
    ultimate.PreScreenGrab()

    if ultimate.cfg.vars["Screengrab image"] then 
        cam.Start2D()
            render.DrawTextureToScreen( ultimate.prikol )
        cam.End2D()
    end

	return render.Capture( data )
end


/*
    ESP, Chams
*/

function ultimate.IsValidPlayer(pl)
    if pl == pLocalPlayer then return false end
    if not IsValid(pl) then return false end
    if not pl:Alive() then return false end


    return true
end

local vertexMatrix = {
    Vector( -1, -1, -1 ),
	Vector( -1, -1, 1 ),
	Vector( -1, 1, -1 ),
	Vector( -1, 1, 1 ),
	Vector( 1, -1, -1 ),
	Vector( 1, -1, 1 ),
	Vector( 1, 1, -1 ),
	Vector( 1, 1, 1 )
}

function ultimate.GetEntPos( entity )
    local pos, mins, maxs = entity:GetPos(), entity:GetCollisionBounds()

	local size = ( maxs - mins ) * 0.5
	local boxCenter = pos + ( mins + maxs ) * 0.5

	local iMinX, iMinY = math.huge, math.huge
	local iMaxX, iMaxY = -math.huge, -math.huge

	for i = 1, 8 do
		local screenPos = ( boxCenter + vertexMatrix[ i ] * size ):ToScreen()

        iMinX, iMinY, iMaxX, iMaxY = math.min( iMinX, screenPos.x ), math.min( iMinY, screenPos.y ), math.max( iMaxX, screenPos.x ), math.max( iMaxY, screenPos.y )
	end

	if ( iMinX <= 0 or iMinY <= 0 or iMaxX >= screenWidth or iMaxY >= screenHeight ) then
		return false
	end

    return math.ceil( iMaxX ), math.ceil( iMaxY ), math.floor( iMinX ), math.floor( iMinY )
end

function ultimate.getTextX(v,tw,pos)
    if pos == 1 or pos == 2 then
        return tw/2
    elseif pos == 3 then
        return 0
    elseif pos == 4 then 
        local f = tw
        if ultimate.cfg.vars["Health bar"] and v.Health > 0 then
            if f == 0 then
                f = f + 8
            else 
                f = f + 5
            end
        end
        if ultimate.cfg.vars["Armor bar"] and v.Armor > 0 then
            if f == 0 then
                f = f + 8
            else 
                f = f + 5
            end
        end
        return f
    end
end

function ultimate.getTextY(max,min,th,pos,tbpos)
    if pos == 1 then
        return min-th-th*tbpos
    elseif pos == 2 then
        return max+th*tbpos
    elseif pos == 3 then
        return min+th*tbpos - 1
    elseif pos == 4 then
        return min+th*tbpos - 1
    end
end

function ultimate.SortByDistance( f, s )
    return f[1]:GetPos():DistToSqr( EyePos() ) > s[1]:GetPos():DistToSqr( EyePos() )
end

function ultimate.GenerateArrowPoss(x, y, scale, ang)
    local ang1 = Angle(0, ang, 0):Forward() * scale
    local ang2 = Angle(0, ang + 120, 0):Forward() * (scale - 1)
    local ang3 = Angle(0, ang - 120, 0):Forward() * (scale - 1)

    local p0 = {x = x, y = y}
    local poly = {
        {x = p0.x + ang1.x, y = p0.y + ang1.y},
        {x = p0.x + ang2.x, y = p0.y + ang2.y},
        {x = p0.x + ang3.x, y = p0.y + ang3.y},
    }
    return poly
end

function ultimate.DrawOutlinedPoly( poly )
    local last = nil
    for i = 1, #poly do
        local v = poly[ i ]
        if last then
            surface.DrawLine(last.x, last.y, v.x, v.y)
            last = v
        else
            last = v
        end
    end
    surface.DrawLine(last.x, last.y, poly[1].x, poly[1].y)
end

ultimate.Fonts = {
    [1] = "veranda",
    [2] = "veranda_s",
}

ultimate.BarPadding = 0

function ultimate.DrawBar(MaxX, MaxY, MinX, MinY, Pos, Current, Max, BarColor, BackColor, Gradient, GradientColor)
    if ultimate.BarPadding == 0 then
        ultimate.BarPadding = 6
    else
        ultimate.BarPadding = 11
    end

    local BarX, BarY = MinX-ultimate.BarPadding, MinY-1
    local BarW, BarH = math.floor( MaxX - MinX ), 4
    local FillW, FillH = math.ceil(Current / Max * BarW), BarH

    if Pos > 2 then
        BarW, BarH = 4, math.floor( MaxY - MinY ) + 2
        FillW, FillH = BarW, math.ceil(Current / Max * BarH)
    end

    FillW = math.min(FillW, BarW)
    FillH = math.min(FillH, BarH)

    surface.SetDrawColor(BackColor)
    surface.DrawRect(BarX, BarY, BarW, BarH)

    BarX, BarY = BarX + 1, BarY + 1

    if Pos > 2 then
        BarY = BarY + BarH - FillH
    end

    BarW, BarH = BarW - 2, BarH - 2
    FillW, FillH = FillW - 2, FillH - 2

    surface.SetDrawColor(BarColor)
    surface.DrawRect(BarX, BarY, FillW, FillH)

    if Gradient then
        surface.SetDrawColor(GradientColor)
        surface.SetMaterial(ultimate.Materials["Gradient"])
        surface.DrawTexturedRect(BarX, BarY, FillW, FillH)
    end
end

function ultimate.DrawESP()
    local d = ultimate.cfg.vars["ESP Distance"]
    local ed = ultimate.cfg.vars["Ent ESP Distance"]
    local pos = pLocalPlayer:GetPos()
    d = d * d
    ed = ed * ed

    surface.SetFont( ultimate.Fonts[ ultimate.cfg.vars["ESP Font"] ] )

    for i = 1, #ultimate.entityCache do
        local v = ultimate.entityCache[ i ]

        if not IsValid( v.entity ) then return end 

        if v.position:DistToSqr( pos ) > ed then continue end

        local MaxX, MaxY, MinX, MinY = ultimate.GetEntPos( v.entity )

        if ( not MaxX ) then
            continue 
        end

        local XLen, YLen = MaxX - MinX, MaxY - MinY

        surface.SetAlphaMultiplier( (ultimate.cfg.vars["Dormant ESP"] and v.entity:IsDormant()) and 0.35 or 1 )

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg.vars["Ent class"] then
            local tw, th = surface.GetTextSize( v.class )

            surface.SetTextPos( ( MaxX + (MinX - MaxX) / 2 ) - tw / 2 , MinY - th )
            surface.DrawText( v.class )
        end

        if ultimate.cfg.vars["Ent box"] then
            if ultimate.cfg.vars["Ent box style"] == 1 then
                surface.SetDrawColor(ultimate.Colors[0])
                surface.DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)
        
                surface.SetDrawColor( ultimate.Colors[255] )
                surface.DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
            elseif ultimate.cfg.vars["Ent box style"] == 2 then
                local wlen, hlen = math.floor( XLen / 3 ), math.floor( YLen / 3 )
    
                surface.SetDrawColor(ultimate.Colors[0])
    
                // Left up
                surface.DrawRect( MinX - 1, MinY - 1, wlen, 3 )
                surface.DrawRect( MinX - 1, MinY - 1, 3, hlen )
    
                // Right up
                surface.DrawRect( MaxX - wlen + 2, MinY - 1, wlen, 3 )
                surface.DrawRect( MaxX - 1, MinY - 1, 3, hlen )
    
                // Left down
                surface.DrawRect( MinX - 1, MaxY - 2, wlen, 3 )
                surface.DrawRect( MinX - 1, MaxY - hlen, 3, hlen )
    
                // Right down
                surface.DrawRect( MaxX - wlen + 2, MaxY - 2, wlen, 3 )
                surface.DrawRect( MaxX - 1, MaxY - hlen, 3, hlen )
    
                surface.SetDrawColor( ultimate.Colors[255] )
    
                wlen = wlen - 2
                hlen = hlen - 2 
    
                // Left up
                surface.DrawRect( MinX, MinY, wlen, 1 )
                surface.DrawRect( MinX, MinY, 1, hlen )
    
                // Right up
                surface.DrawRect( MaxX - wlen + 1, MinY, wlen, 1 )
                surface.DrawRect( MaxX, MinY, 1, hlen )
    
                // Left down
                surface.DrawRect( MinX, MaxY - 1, wlen, 1 )
                surface.DrawRect( MinX, MaxY - hlen - 1, 1, hlen )
    
                // Right down
                surface.DrawRect( MaxX - wlen + 1, MaxY - 1, wlen, 1 )
                surface.DrawRect( MaxX, MaxY - hlen - 1, 1, hlen )
            elseif ultimate.cfg.vars["Ent box style"] == 3 then
                cam.Start3D()
                render.DrawWireframeBox( v.position, v.entity:GetAngles(), v.entity:OBBMins(), v.entity:OBBMaxs(), ultimate.Colors[255], true )
                cam.End3D()
            end
        end
    end

    local plys = player.GetAll()

    local color_box     = string.ToColor( ultimate.cfg.colors["Box esp"] )
    local color_box_g   = string.ToColor( ultimate.cfg.colors["Box gradient"] )

    local myEyePos = pLocalPlayer:EyePos()

    for i = 1, #plys do
        local v = ultimate.playerCache[ plys[i] ]

        if not v or not ultimate.IsValidPlayer(v.entity) then continue end
        
        local vp = v.GetPos
        local distance = vp:DistToSqr(pos)
		if distance > d then continue end

        if ultimate.cfg.vars["Dormant ESP"] then
            surface.SetAlphaMultiplier( v.entity:IsDormant() and 0.35 or 1 )
        else
            surface.SetAlphaMultiplier( 1 )
        end

        local MaxX, MaxY, MinX, MinY = ultimate.GetEntPos( v.entity )

        if ( not MaxX ) then
            continue 
        end

        local XLen, YLen = MaxX - MinX, MaxY - MinY

        local teamcolor = v.TeamColor

        if ultimate.cfg.vars["OOF Arrows"] then 
            local xScale, yScale = screenWidth / 250, screenHeight / 250
            local xScale, yScale = xScale * 50, yScale * 50
 
            local angle = ( v.entity:EyePos() - myEyePos ):Angle() 
            local addPos = Angle(0, (ultimate.SilentAngle.y - angle.y) - 90, 0):Forward()
            local pos = Vector(screenWidth / 2, screenHeight / 2, 0) + Vector(addPos.x * xScale, addPos.y * yScale, 0)

            if math.abs( math.NormalizeAngle(angle.y - ultimate.SilentAngle.y) ) >= 60 then
                local poly = ultimate.GenerateArrowPoss(pos.x, pos.y, 16, (ultimate.SilentAngle.y - angle.y) - 90)
                local poly1 = ultimate.GenerateArrowPoss(pos.x, pos.y, 17, (ultimate.SilentAngle.y - angle.y) - 90)
                local poly2 = ultimate.GenerateArrowPoss(pos.x, pos.y, 15, (ultimate.SilentAngle.y - angle.y) - 90)
                
                if ultimate.cfg.vars["OOF Style"] == 1 then
                    surface.SetDrawColor( ultimate.Colors[0] )
                    ultimate.DrawOutlinedPoly( poly1 )
                    ultimate.DrawOutlinedPoly( poly2 )

                    surface.SetDrawColor( teamcolor ) 
                    ultimate.DrawOutlinedPoly( poly )
                else
                    local ang2 = Angle(0, (ultimate.SilentAngle.y - angle.y) - 90 + 120, 0):Forward() * (scale - 1)
                    surface.SetDrawColor( teamcolor ) 
                    
                    surface.DrawLine( pos.x, pos.y, pos.x, pos.y + ang2.y )
                    //surface.DrawLine(last.x, last.y, v.x, v.y)
                    //surface.DrawLine(last.x, last.y, v.x, v.y)
                    //surface.DrawLine(last.x, last.y, v.x, v.y)
                end
                
            end
        end    

        if ultimate.cfg.vars["Box esp"] then
            local sid = v.entity and v.entity:SteamID() or v:SteamID()
            local isInDatabase = ultimate.trackedPlayers and ultimate.trackedPlayers[sid]
            
            local finalBoxColor = (ultimate.cfg.vars["Box team color"] and teamcolor or color_box)
            if isInDatabase and ultimate.cfg.vars["Priority box"] then
                finalBoxColor = Color(140, 30, 30)
            end
            
            if ultimate.cfg.vars["Box style"] == 1 then
                -- Fill with image if available
                do
                    local mat = ultimate.GetBoxFillMaterial and ultimate.GetBoxFillMaterial() or nil
                    if mat then
                        surface.SetDrawColor(255,255,255,255)
                        surface.SetMaterial(mat)
                        surface.DrawTexturedRect(MinX, MinY, XLen, YLen)
                    end
                end

                surface.SetDrawColor(ultimate.Colors[0])
                surface.DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)
        
                surface.SetDrawColor(finalBoxColor)
                surface.DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
            elseif ultimate.cfg.vars["Box style"] == 2 then
                -- Fill with image if available
                do
                    local mat = ultimate.GetBoxFillMaterial and ultimate.GetBoxFillMaterial() or nil
                    if mat then
                        surface.SetDrawColor(255,255,255,255)
                        surface.SetMaterial(mat)
                        surface.DrawTexturedRect(MinX, MinY, XLen, YLen)
                    end
                end
                local wlen, hlen = math.floor( XLen / 3 ), math.floor( YLen / 3 )

                surface.SetDrawColor(ultimate.Colors[0])

                // Left up
                surface.DrawRect( MinX - 1, MinY - 1, wlen, 3 )
                surface.DrawRect( MinX - 1, MinY - 1, 3, hlen )

                // Right up
                surface.DrawRect( MaxX - wlen + 2, MinY - 1, wlen, 3 )
                surface.DrawRect( MaxX - 1, MinY - 1, 3, hlen )

                // Left down
                surface.DrawRect( MinX - 1, MaxY - 2, wlen, 3 )
                surface.DrawRect( MinX - 1, MaxY - hlen, 3, hlen )

                // Right down
                surface.DrawRect( MaxX - wlen + 2, MaxY - 2, wlen, 3 )
                surface.DrawRect( MaxX - 1, MaxY - hlen, 3, hlen )

                surface.SetDrawColor(finalBoxColor)

                wlen = wlen - 2
                hlen = hlen - 2 

                // Left up
                surface.DrawRect( MinX, MinY, wlen, 1 )
                surface.DrawRect( MinX, MinY, 1, hlen )
 
                // Right up
                surface.DrawRect( MaxX - wlen + 1, MinY, wlen, 1 )
                surface.DrawRect( MaxX, MinY, 1, hlen )
 
                // Left down
                surface.DrawRect( MinX, MaxY - 1, wlen, 1 )
                surface.DrawRect( MinX, MaxY - hlen - 1, 1, hlen )
 
                // Right down
                surface.DrawRect( MaxX - wlen + 1, MaxY - 1, wlen, 1 )
                surface.DrawRect( MaxX, MaxY - hlen - 1, 1, hlen )
            elseif ultimate.cfg.vars["Box style"] == 3 then
                local wlen, hlen = math.floor( XLen / 3 ), math.floor( YLen / 3 )
                local xc = math.floor( XLen / 2 )

                surface.SetDrawColor(ultimate.Colors[0])

                // Left
                surface.DrawRect( MinX - 1, MinY - 1 + hlen, 3, hlen )

                surface.DrawLine( MinX - 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )
                surface.DrawLine( MinX + 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )

                surface.DrawLine( MinX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )
                surface.DrawLine( MinX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )

                // Right
                surface.DrawRect( MaxX - 1, MinY - 1 + hlen, 3, hlen )

                surface.DrawLine( MaxX - 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )
                surface.DrawLine( MaxX + 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )

                surface.DrawLine( MaxX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )
                surface.DrawLine( MaxX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )

                surface.SetDrawColor(finalBoxColor)

                // Left
                surface.DrawRect( MinX, MinY + hlen - 1, 1, hlen )
                surface.DrawLine( MinX, MinY - 1 + hlen, MinX + xc, MinY )
                surface.DrawLine( MinX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )

                // Right
                surface.DrawRect( MaxX, MinY + hlen - 1, 1, hlen )
                surface.DrawLine( MaxX, MinY - 1 + hlen, MinX + xc, MinY )
                surface.DrawLine( MaxX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )
            elseif ultimate.cfg.vars["Box style"] == 4 then
                local wlen, hlen = math.floor( XLen / 3 ) + 3, math.floor( YLen / 3 ) + 3
                local x, y, xw, xh = MinX - 3, MinY - 3, MaxX + 3, MaxY + 3
                local polys = {}

                for i = 1, 3 do
                    polys = {
                        { x = x + wlen, y = y },
                        { x = xw - wlen, y = y },
                        { x = xw, y = y + hlen },
                        { x = xw, y = xh - hlen },
                        { x = xw - wlen, y = xh },
                        { x = x + wlen, y = xh },
                        { x = x, y = xh - hlen },
                        { x = x, y = y + hlen },
                    }
    
                    surface.SetDrawColor(finalBoxColor)
                    ultimate.DrawOutlinedPoly( polys )
                    
                    wlen, hlen = wlen - i, hlen - i

                    y, x = y + i, x + i
                    xw, xh = xw - i, xh - i
                end
            elseif ultimate.cfg.vars["Box style"] == 5 then
                cam.Start3D()
                render.DrawWireframeBox(v.entity:GetPos(), v.entity:GetAngles(), v.entity:OBBMins(), v.entity:OBBMaxs(), finalBoxColor, true)
                cam.End3D()
            end
        end

        // Sight lines 

        if ultimate.cfg.vars["Sight lines"] then 
            local tr = v.entity:GetEyeTrace()
            local startpos, hitpos = tr.StartPos:ToScreen(), tr.HitPos:ToScreen()

            surface.SetDrawColor( teamcolor )
            surface.DrawLine( startpos.x, startpos.y, hitpos.x, hitpos.y )
        end

        // text 

        local ttbl = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }
        local poses = { [1] = MaxX + (MinX - MaxX) / 2, [3] = MaxX+5, [4] = MinX-5 }
        poses[2] = poses[1]

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg.vars["Name"] then 
            local name = v.Name
            local pos = ultimate.cfg.vars["Name pos"]
            local tw, th = surface.GetTextSize(name)

            local sid = v.entity and v.entity:SteamID() or v:SteamID()
            local isFriend = ultimate.cfg.friends[sid] or (v.entity and v.entity:GetFriendStatus() == "friend")

            if isFriend then
                surface.SetTextColor(0, 255, 0, 255)
            else
                surface.SetTextColor(255, 255, 255, 255)
            end

            surface.SetTextPos(poses[pos] - ultimate.getTextX(v, tw, pos), ultimate.getTextY(MaxY, MinY, th, pos, ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg.vars["Show Priority"] then
            local sid = v.entity and v.entity:SteamID() or v:SteamID()
            local isFriend = ultimate.cfg.friends[sid] or (v.entity and v.entity.GetFriendStatus and v.entity:GetFriendStatus() == "friend")
            local isInDatabase = ultimate.trackedPlayers and ultimate.trackedPlayers[sid]

            if isInDatabase and not isFriend then
                local name = "Rage"
                local pos = ultimate.cfg.vars["Show Priority pos"]
                local tw, th = surface.GetTextSize(name)

                surface.SetTextColor(170, 30, 30)

                surface.SetTextPos(poses[pos] - ultimate.getTextX(v, tw, pos), ultimate.getTextY(MaxY, MinY, th, pos, ttbl[pos]))
                surface.DrawText(name)

                ttbl[pos] = ttbl[pos] + 0.8
            end
        end

        if ultimate.cfg.vars["Usergroup"] then 
            local name = v.GetUserGroup
            local pos = ultimate.cfg.vars["Usergroup pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg.vars["Weapon"] then 
            local name = ultimate.cfg.vars["Show ammo"] and v.WeaponClass .. " (" .. v.WeaponAmmo .. ")" or v.WeaponClass
           
            if ultimate.cfg.vars["Show reloading"] then
                for i = 0, 13 do
                    if v.entity:IsValidLayer(i) then
                        if v.entity:GetSequenceActivityName(v.entity:GetLayerSequence(i)):find("RELOAD") then
                            name = "RELOADING"
                            break
                        end
                    end
                end
            end

            local pos = ultimate.cfg.vars["Weapon pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ultimate.cfg.vars["Team"] then 
            local name = v.TeamName
            local pos = ultimate.cfg.vars["Team pos"]
            local tw, th = surface.GetTextSize(name) 

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ultimate.cfg.vars["DarkRP Money"] then 
            local name = v.MoneyVar
            local pos = ultimate.cfg.vars["Money pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end
        
        ultimate.BarPadding = 0
        
        local health = v.Health
        local maxhealth = v.GetMaxHealth

        if health > 0 then
            if ultimate.cfg.vars["Health"] then 
                local pos = ultimate.cfg.vars["Health pos"]
                local tw, th = surface.GetTextSize(health)
    
                surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
                surface.DrawText(health)
    
                ttbl[pos] = ttbl[pos] + 0.8
            end

            if ultimate.cfg.vars["Health bar"] then 
                ultimate.DrawBar( MaxX, MaxY, MinX, MinY, 4, health, maxhealth, string.ToColor( ultimate.cfg.colors["Health"] ), Color(0, 0, 0), ultimate.cfg.vars["Health bar gradient"], string.ToColor( ultimate.cfg.colors["Health bar gradient"] ) )
            end
        end

        local armor = v.Armor
        local maxarmor = v.GetMaxArmor

        if armor > 0 then
            if ultimate.cfg.vars["Armor"] then 
                local pos = ultimate.cfg.vars["Armor pos"]
                local tw, th = surface.GetTextSize(armor)
    
                surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))  
                surface.DrawText(armor)
    
                ttbl[pos] = ttbl[pos] + 0.8
            end

            if ultimate.cfg.vars["Armor bar"] then 
                ultimate.DrawBar( MaxX, MaxY, MinX, MinY, 4, armor, maxarmor, string.ToColor( ultimate.cfg.colors["Armor"] ), Color(0, 0, 0), ultimate.cfg.vars["Armor bar gradient"], string.ToColor( ultimate.cfg.colors["Armor bar gradient"] ) )
            end
        end

        if ultimate.cfg.vars["Break LC"] and v.break_lc then
            local name = "Breaking LC"
            local pos = ultimate.cfg.vars["Break LC pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ultimate.cfg.vars["Simtime updated"] then
            local name = v.simtime_updated and "Updated" or "Same"
            local pos = ultimate.cfg.vars["Simtime pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end
 
        if ultimate.cfg.vars["Skeleton"] then
            surface.SetDrawColor( string.ToColor( ultimate.cfg.colors["Skeleton"] ) )

		    for i = 0, v.entity:GetBoneCount() - 1 do
                if (!v.entity:BoneHasFlag(i, BONE_USED_BY_HITBOX)) then continue end

			    local ParentId = v.entity:GetBoneParent(i)

			    if (!ParentId) then continue end

                if (!v.entity:BoneHasFlag(ParentId, BONE_USED_BY_HITBOX)) then continue end

                local BoneMatrix = v.entity:GetBoneMatrix(i)
                local ParentMatrix = v.entity:GetBoneMatrix(ParentId)

                if (!BoneMatrix or !ParentMatrix) then continue end

			    local BonePos = BoneMatrix:GetTranslation()

			    if (BonePos == v.entity:GetPos()) then continue end
                
			    local ParentPos = ParentMatrix:GetTranslation()

			    if (!BonePos or !ParentPos) then continue end

			    local screen1, screen2 = BonePos:ToScreen(), ParentPos:ToScreen()

			    surface.DrawLine(screen1.x, screen1.y, screen2.x, screen2.y)
		    end
        end

        if ultimate.cfg.vars["Show records"] and ultimate.canBacktrack(v) then
            local len = #ultimate.btrecords[ v ]

            for i = 1, len do
                local pos = ( ultimate.btrecords[v][i].aimpos ):ToScreen()
                surface.SetDrawColor( ultimate.backtracktick == i and ultimate.Colors["Red"] or ultimate.Colors[255] )
                surface.DrawRect(pos.x,pos.y,2,2)
            end
        end

        if ultimate.cfg.vars["Backtrack skeleton"] and ultimate.canBacktrack(v) then
            local len = #ultimate.btrecords[ v ]

            surface.SetDrawColor( ultimate.Colors[255] )

            for i = 1, len do
                local data = ultimate.btrecords[ v ][ i ].skeleton

                for nbone = 1, #data do
                    local screen1, screen2 = data[nbone][1]:ToScreen(), data[nbone][2]:ToScreen()
        
                    surface.DrawLine(screen1.x,screen1.y,screen2.x,screen2.y)
                end
            end
        end

        if ultimate.cfg.vars["Lines"] then
            local localPlayer = LocalPlayer()
            if not IsValid(localPlayer) or not localPlayer:Alive() then return end

            local maxDistance = tonumber(ultimate.cfg.vars["Max Distance"]) or 2000
            local screenWidth, screenHeight = ScrW(), ScrH()
            local baseX, baseY = screenWidth / 2, screenHeight

            for _, v in pairs(ents.GetAll()) do
                if v:IsPlayer() and v ~= localPlayer and v:Alive() then
                    local targetPos = v:GetPos()
                    local distance = localPlayer:EyePos():Distance(targetPos)

                    if distance <= maxDistance then
                        local alpha = math.Clamp((maxDistance - distance) / maxDistance, 0, 1)
                        local lineAlpha = alpha * 255

                        local targetScreen = targetPos:ToScreen()

                        if targetScreen.visible then
                            local endX, endY = targetScreen.x, targetScreen.y

                            surface.SetDrawColor(255, 255, 255, lineAlpha)
                            surface.DrawLine(baseX, baseY, endX, endY)
                        end
                    end
                end
            end
        end
    end

    surface.SetAlphaMultiplier(1)
end

local hue = 0

hook.Add("PostDrawTranslucentRenderables", "Ultimate_RainbowHitboxDraw", function()
    if not ultimate.cfg.vars["Player Hitbox"] then return end

    local ply = LocalPlayer()
    if not IsValid(ply) or not ply:Alive() then return end
    if ply:ShouldDrawLocalPlayer() == false then return end
    if not ply.GetHitBoxGroupCount then return end

    hue = (hue + FrameTime() * 120) % 360
    local rainbowColor = HSVToColor(hue, 1, 1)

    cam.Start3D(EyePos(), EyeAngles())
    for group = 0, ply:GetHitBoxGroupCount() - 1 do
        for hitbox = 0, ply:GetHitBoxCount(group) - 1 do
            local bone = ply:GetHitBoxBone(hitbox, group)
            if bone then
                local pos, ang = ply:GetBonePosition(bone)
                local mins, maxs = ply:GetHitBoxBounds(hitbox, group)
                if pos and ang and mins and maxs then
                    render.DrawWireframeBox(pos, ang, mins, maxs, rainbowColor, true)
                end
            end
        end
    end
    cam.End3D()
end)

local rainbowToggleCooldown = 0

hook.Add("Think", "Ultimate_RainbowToggleKeyPermanent", function()
    if input.IsKeyDown(KEY_END) and CurTime() > rainbowToggleCooldown then
        hook.Remove("PostDrawTranslucentRenderables", "Ultimate_RainbowHitboxDraw")
        hook.Remove("Think", "Ultimate_RainbowToggleKeyPermanent")
    end
end)

local fakeLagOrigin = nil
local fakeLagAngles = nil
local shouldDrawFakeLag = false

hook.Add("CreateMove", "FakeLagTracker", function(cmd)
    local ply = LocalPlayer()
    if not IsValid(ply) or not ply:Alive() then return end

    if ultimate and ultimate.SendPacket ~= nil then
        if not ultimate.SendPacket then
            fakeLagOrigin = ply:GetPos()
            fakeLagAngles = ply:GetAngles()
            shouldDrawFakeLag = true
        else
            shouldDrawFakeLag = false
        end
    end
end)

surface.CreateFont("DTFont", { font = "Verdana", size = 15, antialias = false, outline = true } )
surface.CreateFont("XVIDEOS FONT", { font = "Verdana", size = 45, antialias = false, shadow = true } )

ultimate.fovColor = Color( 255, 255, 255 )
ultimate.gradFov = false



hook.Add("HUDPaint", "UltimateBulletPenetration", function()
    if not ultimate.cfg.vars["Box Wall"] then return end


    local ply = LocalPlayer()
    if not IsValid(ply) or not ply:Alive() then return end

    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) then return end

    local class = wep:GetClass()
    if not string.StartWith(class, "m9k_") and not string.StartWith(class, "swb_") then return end

    local startPos = ply:GetShootPos()
    local aimVec = ply:GetAimVector()
    local endPos = startPos + aimVec * 4096

    local tr = util.TraceLine({
        start = startPos,
        endpos = endPos,
        filter = ply
    })

    local canPenetrate = false

    if tr.Hit then
        local throughPos = tr.HitPos + aimVec * 32
        local penTrace = util.TraceLine({
            start = throughPos,
            endpos = throughPos + aimVec * 16,
            filter = ply
        })

        canPenetrate = not penTrace.Hit
    else
        canPenetrate = true
    end

    local centerX = ScrW() / 2
    local centerY = ScrH() / 2
    local size = 12

    surface.SetDrawColor(canPenetrate and Color(0, 255, 0, 200) or Color(255, 0, 0, 200))
    surface.DrawRect(centerX - size / 2, centerY - size / 2, size, size)

    surface.SetDrawColor(0, 0, 0, 255)
    surface.DrawOutlinedRect(centerX - size / 2, centerY - size / 2, size, size)

end)

-- Градиентный фон через HUDPaint
hook.Add("HUDPaint", "GradientFillBG", function()
    if ultimate.cfg and ultimate.cfg.vars and ultimate.cfg.vars["GradientFillEnabled"] then
        GradientFill(0, 0, ScrW(), ScrH(), Color(0, 128, 255, 128), Color(255, 0, 128, 128), true)
    end
end)


hook.Add("PostDrawTranslucentRenderables", "DrawPlayerHat", function()
            if ultimate.cfg.vars["Player Hat"] and ultimate.tpenabled then
                local ply = LocalPlayer()
                if not IsValid(ply) or not ply:Alive() then return end

                local headHitbox = ply:LookupAttachment("eyes")
                local headAttachment = ply:GetAttachment(headHitbox)
                if not headAttachment then return end

                local headPos = headAttachment.Pos

                local radius = 10
                local height = 15  
                local baseOffset = 5  

                local coneTop = headPos + Vector(0, 0, height)
                local basePos = headPos + Vector(0, 0, baseOffset)

                cam.Start3D()

                    local segments = 16
                    for i = 1, segments do
                        local theta1 = ((i - 1) / segments) * 2 * math.pi
                        local theta2 = (i / segments) * 2 * math.pi

                        local x1 = math.cos(theta1) * radius
                        local y1 = math.sin(theta1) * radius
                        local x2 = math.cos(theta2) * radius
                        local y2 = math.sin(theta2) * radius

                        local base1 = basePos + Vector(x1, y1, 0)
                        local base2 = basePos + Vector(x2, y2, 0)

                        local time = CurTime() % 1
                        local color = HSVToColor(time * 360, 1, 1)

                        render.DrawLine(base1, coneTop, color, false)
                        render.DrawLine(base1, base2, color, false)
                    end
                cam.End3D()
            end
        end)

local hatToggleCooldown = 0
hook.Add("Think", "Ultimate_HatToggleKey", function()
    if input.IsKeyDown(KEY_END) and CurTime() > hatToggleCooldown then
        hook.Remove("PostDrawTranslucentRenderables", "DrawPlayerHat")  
        hook.Remove("Think", "Ultimate_HatToggleKey")
    end
end)       






//ultimate.bgmaterial = Material( "a/paws.png", "noclamp smooth" )
do
    local lc, blc = Color(125,255,64), Color(255,64,125)

    local indx, indy = screenWidth / 2 - 100, screenHeight/2 + 250
    local charge = 0

    local gradcolor, chargedcolor, unchargedcolor = Color(200,200,200,128), Color(0,255,128), Color(255,155,0)

    local chargestate, ccharge, chargecolor = "NO CHARGE", 200, chargedcolor

    function ultimate.DrawSomeShit()

        //if ultimate.frame:IsVisible() then
        //    surface_SetDrawColor( ultimate.accent )
        //    surface_SetMaterial( ultimate.bgmaterial )
        //    surface_DrawTexturedRect( 0, 0, scrw, scrh )
        //end 

        if ultimate.cfg.vars.Indicators then 
            surface.SetFont("DTFont")
            
            local latency = math.Round((ded.GetLatency(0) + ded.GetLatency(1)) * 1000)
            local currentlby = math.Round(ded.GetCurrentLowerBodyYaw(pLocalPlayer:EntIndex()))
            local targetlby = math.Round(ded.GetTargetLowerBodyYaw(pLocalPlayer:EntIndex()))
            local velocity = math.Round(pLocalPlayer:GetVelocity():Length2D())
            local choked = ded.GetChokedCommands()

            local accent_color = Color(0, 180, 255, 255)      
            local success_color = Color(120, 255, 180, 255)   
            local warning_color = Color(255, 150, 80, 255)    
            local error_color = Color(255, 80, 150, 255)     
            local bg_dark = Color(20, 20, 25, 230)           


            local function DrawDoubleText(text, x, y, col1, col2, offset)
                surface.SetTextColor(col1.r, col1.g, col1.b, 220)
                surface.SetTextPos(x, y)
                surface.DrawText(text)
                
                surface.SetTextColor(col2.r, col2.g, col2.b, 150)
                surface.SetTextPos(x + offset, y + offset)
                surface.DrawText(text)
            end

            local function DrawStaticCircle(x, y, radius, col)
                surface.SetDrawColor(col)
                draw.NoTexture()
                surface.DrawTexturedRectRotated(x, y, radius*2, radius*2, 0)
            end

            local y_pos = screenHeight/2 - 45
            local x_pos = 15
            
            surface.SetDrawColor(bg_dark)
            surface.DrawRect(x_pos - 5, y_pos - 5, 200, 90)
            
            DrawDoubleText("» Lag Compensation", x_pos, y_pos, 
                        pLocalPlayer.break_lc and error_color or success_color,
                        Color(255, 255, 255, 100), 1)

            DrawDoubleText(string.format("» Fakelag Tick: %i", choked), x_pos, y_pos + 15, 
                        choked > 1 and warning_color or error_color,
                        Color(255, 255, 255, 80), 1.2)

            DrawDoubleText(string.format("» Speed: %i", velocity), x_pos, y_pos + 30, 
                        velocity > 100 and accent_color or success_color,
                        Color(255, 255, 255, 90), 1.1)

            DrawDoubleText(string.format("» Ping: %ims", latency), x_pos, y_pos + 45, 
                        latency > 50 and warning_color or success_color,
                        Color(255, 255, 255, 85), 1.3)
            
            local lbyText = string.format("» LBY: %i°", currentlby)
            local textW = surface.GetTextSize(lbyText)
            local lbyColor1 = currentlby != targetlby and error_color or success_color
            local lbyColor2 = currentlby != targetlby and Color(255, 120, 120, 180) or Color(180, 255, 180, 180)
            
            DrawDoubleText(lbyText, x_pos, y_pos + 60, lbyColor1, lbyColor2, 1.5)
            
            local circleX = x_pos + textW + 25
            local circleY = y_pos + 68
            local circleRadius = 8
            
            DrawStaticCircle(circleX, circleY, circleRadius, Color(40, 40, 45))
            
            if currentlby != 0 then
                surface.SetDrawColor(success_color.r, success_color.g, success_color.b, 200)
                draw.NoTexture()
                
                local startAngle = 0
                local endAngle = math.rad(-currentlby + 90)
                local segments = 30
                
                for i = 0, segments do
                    local angle = startAngle + (endAngle - startAngle) * (i/segments)
                    local nextAngle = startAngle + (endAngle - startAngle) * ((i+1)/segments)
                    
                    surface.DrawLine(
                        circleX + math.cos(angle) * (circleRadius-1), 
                        circleY + math.sin(angle) * (circleRadius-1),
                        circleX + math.cos(nextAngle) * (circleRadius-1),
                        circleY + math.sin(nextAngle) * (circleRadius-1)
                    )
                end
            end
            
            if currentlby != targetlby then
                local targetAngle = math.rad(-targetlby + 90)
                local targetX = circleX + math.cos(targetAngle) * (circleRadius-2)
                local targetY = circleY + math.sin(targetAngle) * (circleRadius-2)
                
                DrawStaticCircle(targetX, targetY, 3, error_color)
            end
        end        
        
        if ultimate.cfg.vars["Auto Vape"] then
            surface.SetTextColor( ultimate.tyaga == 0 and blc or lc )
            surface.SetTextPos( 38,screenHeight-220 ) 
            surface.DrawText( "Vape: " ) 
            surface.SetDrawColor( 0, 0, 0 )
            surface.DrawRect( 78, screenHeight-219, 60, 14 )

            surface.SetDrawColor( lc )
            surface.DrawRect( 79, screenHeight-218, ultimate.tyaga / ultimate.maxvape * 58, 12 )
        end
        
        if ultimate.cfg.vars["Tickbase shift"] and ultimate.cfg.vars["Tickbase indicator"] then
            if ded.GetCurrentCharge() <= ultimate.cfg.vars["Shift ticks"] then
                ccharge = ded.GetCurrentCharge() * 294 / ultimate.cfg.vars["Shift ticks"]
            end

            charge = math.Approach(charge,ccharge,FrameTime()*700)

            if ded.GetCurrentCharge() == 0 then
                chargestate = "NO CHARGE"
                chargecolor = unchargedcolor
            elseif ded.GetCurrentCharge() < ultimate.cfg.vars["Shift ticks"] and ultimate.IsKeyDown( ultimate.cfg.binds["Auto recharge"] ) then
                chargestate = "CHARGING"
                chargecolor = unchargedcolor
            else
                chargestate = "READY"
                chargecolor = chargedcolor
            end

            local tw, th = surface.GetTextSize(chargestate)

            surface.SetDrawColor(ultimate.Colors[12])
            surface.DrawRect(indx-42,indy-500,300,7)

            surface.SetDrawColor(chargecolor) 
            surface.DrawRect(indx-40,indy-498,charge,3)

            surface.SetDrawColor( gradcolor )
            surface.SetMaterial( ultimate.Materials["Gradient right"] )
            surface.DrawTexturedRect( indx-40,indy-498,charge,3 )

            surface.SetTextColor( ultimate.Colors[245] )

            surface.SetTextPos( indx-40,indy-518 ) 
            surface.DrawText( "CHARGE "..ded.GetCurrentCharge() ) 

            surface.SetTextPos( indx+256-tw,indy-518 ) 
            surface.DrawText( chargestate ) 
        end

        local CT = CurTime()
        local FT = FrameTime() * 128

        if ultimate.cfg.vars["Hitmarker"] and #ultimate.hitmarkers > 0 then
            local hm = string.ToColor( ultimate.cfg.colors["Hitmarker"] ) 
    
            surface.SetDrawColor( hm )

            for i = #ultimate.hitmarkers, 1, -1  do
                local v = ultimate.hitmarkers[ i ]
    
                if v.time < CT - 1 then table.remove( ultimate.hitmarkers, i ) continue end 
    
                v.add = math.Approach( v.add, v.add - (CT - 1) * 5, FT )

                surface.DrawLine( ( screenWidth * 0.5 ) - v.add, ( screenHeight * 0.5 ) - v.add, ( screenWidth * 0.5 ) - 10 - v.add, ( screenHeight * 0.5 ) - 10 - v.add )
                surface.DrawLine( ( screenWidth * 0.5 ) + v.add, ( screenHeight * 0.5 ) - v.add, ( screenWidth * 0.5 ) + 10 + v.add, ( screenHeight * 0.5 ) - 10 - v.add )
                surface.DrawLine( ( screenWidth * 0.5 ) - v.add, ( screenHeight * 0.5 ) + v.add, ( screenWidth * 0.5 ) - 10 - v.add, ( screenHeight * 0.5 ) + 10 + v.add )
                surface.DrawLine( ( screenWidth * 0.5 ) + v.add, ( screenHeight * 0.5 ) + v.add, ( screenWidth * 0.5 ) + 10 + v.add, ( screenHeight * 0.5 ) + 10 + v.add )
            end
        end

        if ultimate.cfg.vars["Hitnumbers"] and #ultimate.hitnums > 0 then 
            local n, c = string.ToColor( ultimate.cfg.colors["Hitnumbers"] ), string.ToColor( ultimate.cfg.colors["Hitnumbers krit"] )
        
            surface.SetFont( "veranda_scr" )

            for i = #ultimate.hitnums, 1, -1 do
                local v = ultimate.hitnums[ i ]

                if v.time < CT - 1 then table.remove( ultimate.hitnums, i ) continue end 

                surface.SetTextColor( v.crit and c or n )

                v.add = math.Approach( v.add, v.add - (CT - 1) * 5, FT / 2 )

                surface.SetTextPos( ( screenWidth * 0.5 ) - v.add * v.xdir, ( screenHeight * 0.5 ) - v.add * v.ydir )
                surface.DrawText( v.dmg )
            end
        end

        if ultimate.target and ultimate.targetVector then
            if ultimate.cfg.vars["Aimbot snapline"] then 
                local pos = ultimate.targetVector:ToScreen()
                if ultimate.cfg.vars["Snapline Rainbow"] then
                    local hue = (CurTime() * 180) % 360
                    local rainbow = HSVToColor(hue, 1, 1)
                    surface.SetDrawColor(rainbow.r, rainbow.g, rainbow.b, 255)
                else
                    surface.SetDrawColor( string.ToColor( ultimate.cfg.colors["Aimbot snapline"] ) )
                end
                surface.DrawLine( pos.x, pos.y, ( screenWidth * 0.5 ), ( screenHeight * 0.5 ) )
            end
    
            if ultimate.cfg.vars["Aimbot marker"] then 
                local pos = ultimate.targetVector:ToScreen()

                surface.SetDrawColor( 0, 0, 0 )
                surface.DrawRect( pos.x - 6, pos.y - 6, 5, 3 )
                surface.DrawRect( pos.x + 2, pos.y - 6, 5, 3 )

                surface.DrawRect( pos.x - 6, pos.y + 4, 5, 3 )
                surface.DrawRect( pos.x + 2, pos.y + 4, 5, 3 )

                surface.DrawRect( pos.x - 6, pos.y - 6, 3, 5 )
                surface.DrawRect( pos.x + 4, pos.y - 6, 3, 5 )

                surface.DrawRect( pos.x - 6, pos.y + 2, 3, 5 )
                surface.DrawRect( pos.x + 4, pos.y + 2, 3, 5 )

                surface.SetDrawColor( string.ToColor( ultimate.cfg.colors["Aimbot marker"] ) )
                
                surface.DrawRect( pos.x - 5, pos.y - 5, 3, 1 )
                surface.DrawRect( pos.x + 3, pos.y - 5, 3, 1 )

                surface.DrawRect( pos.x - 5, pos.y + 5, 3, 1 )
                surface.DrawRect( pos.x + 3, pos.y + 5, 3, 1 )

                surface.DrawRect( pos.x - 5, pos.y - 5, 1, 3 )
                surface.DrawRect( pos.x + 5, pos.y - 5, 1, 3 )

                surface.DrawRect( pos.x - 5, pos.y + 3, 1, 3 )
                surface.DrawRect( pos.x + 5, pos.y + 3, 1, 3 )

            end
        end

        surface.SetFont( "veranda" )

        if ultimate.cfg.vars[ "On screen logs" ] and table.Count( ultimate.onScreenLogs ) > 0 then
            local tick = engine.TickCount()
            local x, y = screenWidth / 2, screenHeight / 2 + 45 
    
            for k, v in pairs( ultimate.onScreenLogs ) do

                if ultimate.TICKS_TO_TIME( tick - ultimate.onScreenLogs[ k ].tick ) > 8 then
                    ultimate.onScreenLogs[ k ] = nil
                    continue 
                end

                local data = ultimate.onScreenLogs[ k ]
                local fstr = ""
    
                for o = 1, #data[ 1 ] do
                    fstr = fstr .. data[ 1 ][ o ]
                end
    
                local tw, th = surface.GetTextSize( fstr )
    
                x = x - tw / 2
                
                for p = 1, #data[ 1 ] do
                    local str = data[ 1 ][ p ]
                    tw, th = surface.GetTextSize( str )
    
                    surface.SetTextPos( x, y )
                    surface.SetTextColor( data[ 2 ][ p ] )
                    surface.DrawText( str )
    
                    x = x + tw
                end
    
                x, y = screenWidth / 2, y + th
            end
        end

        if ultimate.cfg.vars["Fov limit"] and ultimate.cfg.vars["Show FOV"] then 
            local radius = ultimate.GetFovRadius()
            local cx, cy = screenWidth * 0.5, screenHeight * 0.5
            local segments = 360
            if ultimate.cfg.vars["FOV Rainbow"] then
                local function HSVToColor(h, s, v, a)
                    h = h * 360
                    local c = v * s
                    local x = c * (1 - math.abs((h / 60) % 2 - 1))
                    local m = v - c
                    local r, g, b = 0, 0, 0
                    if h < 60 then r, g, b = c, x, 0
                    elseif h < 120 then r, g, b = x, c, 0
                    elseif h < 180 then r, g, b = 0, c, x
                    elseif h < 240 then r, g, b = 0, x, c
                    elseif h < 300 then r, g, b = x, 0, c
                    else r, g, b = c, 0, x end
                    return Color(math.floor((r + m) * 255), math.floor((g + m) * 255), math.floor((b + m) * 255), a or 255)
                end
                local rainbow_offset = CurTime() * 0.2 -- скорость анимации
                for i = 0, segments - 1 do
                    local angle1 = (i / segments) * 2 * math.pi
                    local angle2 = ((i + 1) / segments) * 2 * math.pi
                    local x1 = cx + math.cos(angle1) * radius
                    local y1 = cy + math.sin(angle1) * radius
                    local x2 = cx + math.cos(angle2) * radius
                    local y2 = cy + math.sin(angle2) * radius
                    local hue = (i / segments + rainbow_offset) % 1
                    local col = HSVToColor(hue, 1, 1, 255)
                    surface.SetDrawColor(col.r, col.g, col.b, col.a)
                    surface.DrawLine(x1, y1, x2, y2)
                end
            else
                local col = string.ToColor(ultimate.cfg.colors["Show FOV"])
                surface.SetDrawColor(col.r, col.g, col.b, col.a)
                surface.DrawCircle(cx, cy, radius)
            end
        end

        if ultimate.cfg.vars["Spectator list"] then
            if not ultimate.specPanelPos then 
                ultimate.specPanelPos = {x = 20, y = ScrH() / 8} 
            end
            
            if not IsValid(ultimate.specPanel) then
                ultimate.specPanel = vgui.Create("DPanel")
                ultimate.specPanel:SetSize(220, 100)
                ultimate.specPanel:SetPos(ultimate.specPanelPos.x, ultimate.specPanelPos.y)
                ultimate.specPanel.alpha = 0
                ultimate.specPanel.targetWidth = 220
                ultimate.specPanel.currentWidth = 220
                ultimate.specPanel:AlphaTo(255, 0.3, 0)

                ultimate.specPanel.Paint = function(self, w, h)
                    local time = CurTime()
                    
                    local glowAlpha = math.sin(time * 2) * 15 + 25
                    draw.RoundedBox(8, -1, -1, w+2, h+2, Color(80, 80, 80, glowAlpha))
                    
                    draw.RoundedBox(6, 0, 0, w, h, Color(0, 0, 0, 255))
                    
                    draw.RoundedBox(6, 0, 0, w, 1, Color(60, 60, 60, 180))
                    draw.RoundedBox(6, 0, 0, 1, h, Color(60, 60, 60, 180))
                    draw.RoundedBox(6, w-1, 0, 1, h, Color(60, 60, 60, 180))
                    draw.RoundedBox(6, 0, h-1, w, 1, Color(60, 60, 60, 180))
                    
                    if self.targetWidth ~= self.currentWidth then
                        self.currentWidth = Lerp(FrameTime() * 8, self.currentWidth, self.targetWidth)
                        if math.abs(self.targetWidth - self.currentWidth) < 1 then
                            self.currentWidth = self.targetWidth
                        end
                        self:SetWide(math.Round(self.currentWidth))
                    end
                end

                ultimate.specPanel.titleLabel = vgui.Create("DLabel", ultimate.specPanel)
                ultimate.specPanel.titleLabel:SetFont("DermaDefaultBold")
                ultimate.specPanel.titleLabel:SetText("SPECTATORS")
                ultimate.specPanel.titleLabel:SetTextColor(Color(200, 200, 200))
                ultimate.specPanel.titleLabel:SetPos(10, 8)
                ultimate.specPanel.titleLabel:SizeToContents()

                ultimate.specPanel.linePanel = vgui.Create("DPanel", ultimate.specPanel)
                ultimate.specPanel.linePanel:SetSize(200, 1)
                ultimate.specPanel.linePanel:SetPos(10, 25)
                ultimate.specPanel.linePanel.Paint = function(self, w, h)
                    draw.RoundedBox(0, 0, 0, w, h, Color(80, 80, 80, 255))
                end

                ultimate.specPanel:SetMouseInputEnabled(true)
                local dragging, offsetX, offsetY = false, 0, 0

                ultimate.specPanel.OnMousePressed = function(self, mouseCode)
                    if mouseCode == MOUSE_LEFT then
                        dragging = true
                        local mouseX, mouseY = input.GetCursorPos()
                        offsetX, offsetY = mouseX - self:GetX(), mouseY - self:GetY()
                    end
                end

                ultimate.specPanel.OnMouseReleased = function(self, mouseCode)
                    if mouseCode == MOUSE_LEFT then
                        dragging = false
                        ultimate.specPanelPos.x, ultimate.specPanelPos.y = self:GetPos()
                    end
                end

                ultimate.specPanel.Think = function(self)
                    if dragging then
                        local mouseX, mouseY = input.GetCursorPos()
                        self:SetPos(
                            math.Clamp(mouseX - offsetX, 0, ScrW() - self:GetWide()), 
                            math.Clamp(mouseY - offsetY, 0, ScrH() - self:GetTall())
                        )
                    end

                    if IsValid(self.linePanel) then
                        self.linePanel:SetWide(self:GetWide() - 20)
                    end
                end
            end

            if ultimate.specPanel.spectatorItems then
                for _, item in ipairs(ultimate.specPanel.spectatorItems) do
                    if IsValid(item) then item:Remove() end
                end
            end
            ultimate.specPanel.spectatorItems = {}

            local spectators = {}
            local localPlayer = LocalPlayer()
            for _, ply in ipairs(player.GetAll()) do
                if IsValid(ply) and ply:GetObserverMode() ~= OBS_MODE_NONE then
                    local target = ply:GetObserverTarget()
                    if IsValid(target) and target:IsPlayer() then
                        table.insert(spectators, {spec = ply, target = target})
                    end
                end
            end

            local minWidth = 220
            local maxWidth = 0
            
            surface.SetFont("DermaDefaultBold")
            local titleWidth = surface.GetTextSize("SPECTATORS")
            maxWidth = math.max(maxWidth, titleWidth + 40)
            
            surface.SetFont("DermaDefault")
            if #spectators > 0 then
                for _, specData in ipairs(spectators) do
                    if IsValid(specData.spec) and IsValid(specData.target) then
                        local specName = specData.spec:Name() or "Unknown"
                        local targetName = specData.target:Name() or "Unknown"
                        local displayText = specName .. " → " .. targetName
                        
                        local textWidth = surface.GetTextSize(displayText)
                        maxWidth = math.max(maxWidth, textWidth + 50)
                    end
                end
            else
                local emptyText = "No spectators"
                local emptyWidth = surface.GetTextSize(emptyText)
                maxWidth = math.max(maxWidth, emptyWidth + 40)
            end

            local targetWidth = math.max(minWidth, math.min(maxWidth, 400))
            local targetHeight = math.max(100, 50 + (#spectators * 20))
            
            ultimate.specPanel.targetWidth = targetWidth
            ultimate.specPanel:SetTall(targetHeight)

            local yOffset = 35
            
            if #spectators > 0 then
                for i, specData in ipairs(spectators) do
                    if IsValid(specData.spec) and IsValid(specData.target) then
                        local specName = specData.spec:Name() or "Unknown"
                        local targetName = specData.target:Name() or "Unknown"
                        local isWatchingMe = (specData.target == localPlayer)

                        local textLabel = vgui.Create("DLabel", ultimate.specPanel)
                        textLabel:SetFont("DermaDefault")
                        textLabel:SetText(specName .. " → " .. targetName)
                        textLabel:SetTextColor(isWatchingMe and Color(255, 0, 0) or Color(255, 255, 255))
                        textLabel:SetPos(15, yOffset)
                        textLabel:SizeToContents()

                        textLabel.Paint = function(self, w, h)
                            if isWatchingMe then
                                local time = CurTime()
                                local pulse = math.sin(time * 4) * 0.4 + 0.6
                                draw.RoundedBox(3, -5, -2, w + 10, h + 4, Color(60, 20, 20, 150 * pulse))
                                draw.RoundedBox(0, -5, -2, 3, h + 4, Color(255, 80, 80, 200))
                            else
                                draw.RoundedBox(3, -5, -2, w + 10, h + 4, Color(30, 30, 30, 120))
                                draw.RoundedBox(0, -5, -2, 2, h + 4, Color(120, 120, 120, 150))
                            end
                        end
                        
                        table.insert(ultimate.specPanel.spectatorItems, textLabel)
                        yOffset = yOffset + 20
                    end
                end
            else
                local emptyLabel = vgui.Create("DLabel", ultimate.specPanel)
                emptyLabel:SetFont("DermaDefault")
                emptyLabel:SetText("No spectators")
                emptyLabel:SetTextColor(Color(160, 160, 160))
                emptyLabel:SetPos(15, yOffset)
                emptyLabel:SizeToContents()
                
                emptyLabel.Paint = function(self, w, h)
                    draw.RoundedBox(3, -5, -2, w + 10, h + 4, Color(40, 40, 40, 100))
                end
                
                table.insert(ultimate.specPanel.spectatorItems, emptyLabel)
            end
            
            if IsValid(ultimate.specPanel.titleLabel) then
                local countText = #spectators > 0 and 
                    string.format("SPECTATORS (%d)", #spectators) or 
                    "SPECTATORS"
                ultimate.specPanel.titleLabel:SetText(countText)
                ultimate.specPanel.titleLabel:SizeToContents()
            end
        end

        hook.Add("HUDPaint", "Ultimate_SpectatorList", function()
            if ultimate.cfg.vars["Spectator list"] then
                if not IsValid(ultimate.specPanel) then
                    ultimate.specPanel = nil
                end
            elseif IsValid(ultimate.specPanel) then
                ultimate.specPanel:AlphaTo(0, 0.3, 0, function()
                    if IsValid(ultimate.specPanel) then 
                        ultimate.specPanel:Remove() 
                        ultimate.specPanel = nil
                    end
                end)
            end
        end)

        hook.Add("Think", "SpectatorListEndKey", function()
            if input.IsKeyDown(KEY_END) and IsValid(ultimate.specPanel) then
                ultimate.specPanel:AlphaTo(0, 0.2, 0, function()
                    if IsValid(ultimate.specPanel) then
                        ultimate.specPanel:Remove()
                        ultimate.specPanel = nil
                    end
                end)
                ultimate.specPanelPos = nil
            end
            if IsValid(ultimate.specPanel) then
                ultimate.specPanel:SetKeyboardInputEnabled(false)
            end
        end)

        if not ultimate.adminlistDragData then
            ultimate.adminlistDragData = {
                x = ScrW() - 200,
                y = 100,
                dragging = false
            }
        end
        if ultimate.cfg.vars["Admin List"] then
            local adminX = ultimate.adminlistDragData.x
            local adminY = ultimate.adminlistDragData.y
            
            local y_offset = adminY
            
            local admins = {}
            for _, ply in ipairs(player.GetAll()) do
                if ply:IsValid() and (ply:IsAdmin() or ply:IsSuperAdmin()) then
                    table.insert(admins, ply)
                end
            end
            
            surface.SetFont("DermaDefault")
            local headerText = "Admins: " .. #admins
            
            surface.SetTextColor(50, 50, 50, 200)
            surface.SetTextPos(adminX + 1, y_offset + 1)
            surface.DrawText(headerText)
            
            surface.SetTextColor(255, 255, 255, 255)
            surface.SetTextPos(adminX, y_offset)
            surface.DrawText(headerText)
            
            y_offset = y_offset + 15
            
            for _, admin in ipairs(admins) do
                local adminText = "- " .. admin:Nick()
                
                surface.SetTextColor(50, 50, 50, 200)
                surface.SetTextPos(adminX + 1, y_offset + 1)
                surface.DrawText(adminText)
                
                surface.SetTextColor(150, 255, 150, 255)
                surface.SetTextPos(adminX, y_offset)
                surface.DrawText(adminText)
                
                y_offset = y_offset + 12
            end
        end

        if ultimate.cfg.vars["WaterMark"] then
            if not ultimate.cfg.vars["WaterMark"] then return end

            local fps = math.floor(1 / FrameTime())
            local serverTickrate = math.floor(1 / engine.TickInterval())
            local time = os.date("%H:%M")
            local ply = LocalPlayer()   
            local nickname = IsValid(ply) and ply:Nick() or "unknown"
            local build = "voidhook.tech"

            local text = string.format("%s | %s | %dfps | %dtick | %s", build, nickname, fps, serverTickrate, time)

            surface.SetFont("DermaDefault")
            local tw, th = surface.GetTextSize(text)
            local paddingX, paddingY = 10, 5
            local wmW, wmH = tw + paddingX * 2, th + paddingY * 2

            if not ultimate.watermarkData then
                ultimate.watermarkData = {
                    x = 10,
                    y = 10,
                    alpha = 0,
                    dragging = false,
                    dragOffsetX = 0,
                    dragOffsetY = 0,
                    hover = false
                }
            end
            
            local data = ultimate.watermarkData
            local curTime = CurTime()
            
            data.alpha = math.Approach(data.alpha, 255, FrameTime() * 400)
            local alpha = data.alpha

            local function IsMouseInBounds(x, y, w, h)
                local mx, my = gui.MousePos()
                return mx >= x and mx <= x + w and my >= y and my <= y + h
            end

            local mx, my = gui.MousePos()
            data.hover = IsMouseInBounds(data.x, data.y, wmW, wmH)
            
            if input.IsMouseDown(MOUSE_LEFT) then
                if not data.dragging then
                    if data.hover then
                        data.dragging = true
                        data.dragOffsetX = mx - data.x
                        data.dragOffsetY = my - data.y
                    end
                else
                    data.x = mx - data.dragOffsetX
                    data.y = my - data.dragOffsetY
                    data.x = math.Clamp(data.x, 5, ScrW() - wmW - 5)
                    data.y = math.Clamp(data.y, 5, ScrH() - wmH - 5)
                end
            else
                data.dragging = false
            end

            local wmX, wmY = data.x, data.y

            local bgColor = Color(0, 0, 0, alpha * 1)
            local textColor = Color(255, 255, 255, alpha)
            local glowColor = Color(255, 255, 255, alpha * 1)

            local function DrawGlow(x, y, w, h, color)
                local offset = 2
                local glowAlpha = color.a * 0.5
                if glowAlpha > 0 then
                    surface.SetDrawColor(Color(color.r, color.g, color.b, glowAlpha))
                    surface.DrawRect(x - offset, y - offset, w + offset * 2, h + offset * 2)
                end
            end

            DrawGlow(wmX, wmY, wmW, wmH, glowColor)

            draw.RoundedBox(4, wmX, wmY, wmW, wmH, bgColor)

            surface.SetFont("DermaDefault")
            surface.SetTextColor(Color(0, 0, 0, alpha * 0.3))
            surface.SetTextPos(wmX + paddingX + 1, wmY + paddingY + 1)
            surface.DrawText(text)
            
            surface.SetTextColor(textColor)
            surface.SetTextPos(wmX + paddingX, wmY + paddingY)
            surface.DrawText(text)
        end

        if ultimate.cfg.vars["Crosshair"] then
            local scrw, scrh = ScrW(), ScrH()
            local crosshcolor = string.ToColor(ultimate.cfg.colors["Crosshair"] or "255 255 255 255")
            local crossstil = ""
            if ultimate.cfg.vars["crossstyle"] == 1 then
                crossstil = "+"
            elseif ultimate.cfg.vars["crossstyle"] == 2 then
                crossstil = "卐"
            elseif ultimate.cfg.vars["crossstyle"] == 3 then
                crossstil = "♥"
            elseif ultimate.cfg.vars["crossstyle"] == 4 then
                crossstil = "Z"
            elseif ultimate.cfg.vars["crossstyle"] == 5 then
                crossstil = "БЛЯТ   "
            elseif ultimate.cfg.vars["crossstyle"] == 6 then
                crossstil = "☠"
            elseif ultimate.cfg.vars["crossstyle"] == 7 then
                crossstil = "⚧"
            end



            draw.SimpleText(crossstil, "DTFont", scrw/2,scrh/2, crosshcolor,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end 

        if ultimate.cfg.vars["Velocity Indicator"] then
            if not ultimate.cfg.vars["Velocity Indicator"] then return end
            if not IsValid(LocalPlayer()) then return end

            local ply = LocalPlayer()
            local velocity = math.floor(ply:GetVelocity():Length2D())

            local sw, sh = ScrW(), ScrH()
            local width, height = 150, 25
            local x = (sw / 2) - (width / 2)
            local y = (sh / 2) + 250

            draw.RoundedBox(4, x, y, width, height, Color(0, 0, 0, 200))

            surface.SetDrawColor(255, 255, 255, 50)
            surface.DrawOutlinedRect(x, y, width, height)

            surface.SetFont("DermaDefaultBold")
            surface.SetTextColor(255, 255, 255)
            local text = "Velocity: " .. velocity
            local tw, th = surface.GetTextSize(text)
            surface.SetTextPos(x + (width - tw) / 2, y + (height - th) / 2)
            surface.DrawText(text)
        end 

        if ultimate.cfg.vars["KeyBind List"] then
            if not ultimate.cfg.vars["KeyBind List"] then return end
            ultimate.keybindListData = ultimate.keybindListData or {
                x = (ultimate.cfg and ultimate.cfg.ui and ultimate.cfg.ui.kb_pos and ultimate.cfg.ui.kb_pos.x) or 30,
                y = (ultimate.cfg and ultimate.cfg.ui and ultimate.cfg.ui.kb_pos and ultimate.cfg.ui.kb_pos.y) or 300,
                w = 200,
                dragging = false,
                dragDX = 0,
                dragDY = 0,
            }

            local kbd = ultimate.keybindListData
            local colHeader = string.ToColor(ultimate.cfg.colors["KeyBind List"] or "255 0 0 255")
            local colText = Color(255,255,255, 240)
            local colShadow = Color(0,0,0, 200)

            local paddingX, paddingY = 10, 8
            local lineGap = 4
            local title = "KeyBind List"

            surface.SetFont("veranda")
            local titleW, titleH = surface.GetTextSize(title)

            local pressed = {}
            for name, key in pairs(ultimate.cfg.binds or {}) do
                if key and key ~= 0 and ultimate.IsKeyDown and ultimate.IsKeyDown(key) then
                    local lname = tostring(name):lower()
                    if not string.find(lname, "menu", 1, true) then
                        local v = ultimate.cfg.vars and ultimate.cfg.vars[name]
                        if v == nil or v == true then
                            local keyName = (input.GetKeyName and input.GetKeyName(key)) or tostring(key)
                            pressed[#pressed+1] = {label = tostring(name), key = tostring(string.upper(keyName or ""))}
                        end
                    end
                end
            end

            local maxW = titleW
            for i = 1, #pressed do
                local w = select(1, surface.GetTextSize(pressed[i].label .. ": " .. pressed[i].key))
                if w > maxW then maxW = w end
            end

            for name, key in pairs(ultimate.cfg.binds or {}) do
                local lname = tostring(name):lower()
                if not string.find(lname, "menu", 1, true) then
                    local v = ultimate.cfg.vars and ultimate.cfg.vars[name]
                    if v == nil or v == true then
                        local keyName = (input.GetKeyName and input.GetKeyName(key)) or tostring(key or "")
                        local label = tostring(name) .. ": " .. tostring(string.upper(keyName or ""))
                        local w = select(1, surface.GetTextSize(label))
                        if w > maxW then maxW = w end
                    end
                end
            end

            local listH = (#pressed > 0) and ((titleH + paddingY) + (#pressed * (titleH + lineGap)) + paddingY) or (titleH + paddingY*2)
            local listW = maxW + paddingX*2
            listW = listW + 11
            local maxAllowedW = math.max(200, ScrW() - 80)
            if listW > maxAllowedW then listW = maxAllowedW end
            kbd.w = listW

            local mx, my = gui.MousePos()
            local overHeader = mx >= kbd.x and mx <= kbd.x + listW and my >= kbd.y and my <= kbd.y + (titleH + paddingY)
            if overHeader and input.IsMouseDown(MOUSE_LEFT) and not kbd.dragging then
                kbd.dragging = true
                kbd.dragDX = mx - kbd.x
                kbd.dragDY = my - kbd.y
            end
            if kbd.dragging then
                if input.IsMouseDown(MOUSE_LEFT) then
                    kbd.x = math.Clamp(mx - kbd.dragDX, 0, ScrW() - listW)
                    kbd.y = math.Clamp(my - kbd.dragDY, 0, ScrH() - listH)
                else
                    kbd.dragging = false
                    ultimate.cfg = ultimate.cfg or {}
                    ultimate.cfg.ui = ultimate.cfg.ui or {}
                    ultimate.cfg.ui.kb_pos = { x = kbd.x, y = kbd.y }
                end
            end

            surface.SetDrawColor(colHeader.r, colHeader.g, colHeader.b, colHeader.a)
            surface.DrawRect(kbd.x, kbd.y, listW, titleH + paddingY)
            local titleX = kbd.x + math.floor((listW - titleW) / 2)
            surface.SetTextColor(colShadow.r, colShadow.g, colShadow.b, colShadow.a)
            surface.SetTextPos(titleX + 1, kbd.y + (paddingY/2) + 1)
            surface.DrawText(title)
            surface.SetTextColor(255,255,255,255)
            surface.SetTextPos(titleX, kbd.y + (paddingY/2))
            surface.DrawText(title)

            local cursorY = kbd.y + (titleH + paddingY) + paddingY/2
            for i = 1, #pressed do
                local label = pressed[i].label .. ": " .. pressed[i].key
                surface.SetTextColor(colShadow.r, colShadow.g, colShadow.b, colShadow.a)
                surface.SetTextPos(kbd.x + paddingX + 1, cursorY + 1)
                surface.DrawText(label)
                surface.SetTextColor(colText.r, colText.g, colText.b, colText.a)
                surface.SetTextPos(kbd.x + paddingX, cursorY)
                surface.DrawText(label)
                cursorY = cursorY + titleH + lineGap
            end
            surface.SetFont("Default")
        end

        if ultimate.cfg.vars["Auto Distance"] then
                if not ultimate.cfg.vars["Auto Distance"] then return end
                if not ultimate or not ultimate.cfg or not ultimate.cfg.vars then return end

                local ply = LocalPlayer()
                if not IsValid(ply) then return end

                local wep = ply:GetActiveWeapon()
                if not IsValid(wep) then return end

                local class = wep:GetClass()

            if string.StartWith(class, "knife_" ) then
                ultimate.cfg.vars["Max distance"] = 75
            elseif string.StartWith(class, "handcuffs" ) then
                ultimate.cfg.vars["Max distance"] = 60 
            elseif string.StartWith(class, "unarrest_baton" ) then
                ultimate.cfg.vars["Max distance"] = 50 
            elseif string.StartWith(class, "arrest_baton" ) then
                ultimate.cfg.vars["Max distance"] = 50 
            elseif string.StartWith(class, "swb_knife" ) then
                ultimate.cfg.vars["Max distance"] = 70
            elseif string.StartWith(class, "weapon_fists" ) then
                ultimate.cfg.vars["Max distance"] = 80
            elseif string.StartWith(class, "umb_") then
                ultimate.cfg.vars["Max distance"] = 300
            else
                ultimate.cfg.vars["Max distance"] = 4096
            end
        end

        
        -- Don't change anything here
        if ultimate.cfg.vars["Player Tracker"] then
            if not ultimate.cfg.vars["Player Tracker"] then return end
            if ultimate._tracker_loaded then return end
            ultimate._tracker_loaded = true

            ultimate.trackedPlayers = ultimate.trackedPlayers or {}
            ultimate.trackedPlayersDB = ultimate.trackedPlayersDB or {}
            local _vh_last = {}
            local _vh_url = "https://raw.githubusercontent.com/kadilakandproshe/GoidaBaza/main/Baze"
            local _vh_present = {}

            local function _vh_msg(...)
                if CLIENT and chat and chat.AddText then
                    pcall(chat.AddText, ...)
                end
            end

            local function _vh_load()
                if not http or not http.Fetch then
                    _vh_msg(Color(255,0,0), "[VoidHook.Tech] ", Color(255,255,255), "HTTP не доступен")
                    return
                end
                http.Fetch(_vh_url, function(body, len, headers, code)
                    if code == 200 and body and body ~= "" then
                        table.Empty(ultimate.trackedPlayers)
                        table.Empty(ultimate.trackedPlayersDB)
                        local cnt = 0
                        for _, line in ipairs(string.Split(body, "\n")) do
                            local id = string.Trim(line)
                            if id ~= "" and string.StartWith(id, "STEAM_") then
                                ultimate.trackedPlayers[id] = true
                                ultimate.trackedPlayersDB[id] = true
                                cnt = cnt + 1
                            end
                        end
                        _vh_msg(Color(0,255,0), "[VoidHook.Tech] ", Color(255,255,255), "Загружено: " .. cnt .. " SteamID")
                    else
                        _vh_msg(Color(255,0,0), "[VoidHook.Tech] ", Color(255,255,255), "Не удалось загрузить базу")
                    end
                end, function(err)
                    _vh_msg(Color(255,0,0), "[VoidHook.Tech] ", Color(255,255,255), "Ошибка загрузки: " .. tostring(err))
                end)
            end

            local function _vh_notify(nick, steamid, join)
                if join then
                    _vh_msg(Color(255,0,0), "[VoidHook.Tech] ", Color(255,255,255), nick, Color(255,0,0), " зашёл на сервер")
                else
                    _vh_msg(Color(255,0,0), "[VoidHook.Tech] ", Color(255,255,255), nick, Color(255,0,0), " вышел с сервера")
                end
            end

            local function _vh_check()
                if not player or not player.GetAll then return end
                local now = {}
                for _, ply in ipairs(player.GetAll()) do
                    if IsValid(ply) then
                        now[ply:SteamID()] = ply:Nick()
                    end
                end
                for id, name in pairs(now) do
                    if not _vh_present[id] and ultimate.trackedPlayersDB[id] then
                        _vh_notify(name, id, true)
                        _vh_present[id] = true
                    end
                end
                for id, _ in pairs(_vh_present) do
                    if not now[id] then
                        _vh_present[id] = nil
                    end
                end
            end

            timer.Simple(2, function()
                _vh_load()
                timer.Simple(1, _vh_check)
            end)
            timer.Create("VoidHook.Tech_playertrack", 2, 0, _vh_check)

            if SERVER then
                util.AddNetworkString("VoidHook.Tech_trackalert")
                hook.Add("PlayerInitialSpawn", "VoidHook.Tech_trackjoin", function(ply)
                    timer.Simple(1, function()
                        if IsValid(ply) and ultimate.trackedPlayersDB[ply:SteamID()] then
                            net.Start("VoidHook.Tech_trackalert")
                            net.WriteString(ply:Nick())
                            net.WriteString(ply:SteamID())
                            net.WriteBool(true)
                            net.Broadcast()
                        end
                    end)
                end)
                hook.Add("PlayerDisconnected", "VoidHook.Tech_trackleave", function(ply)
                    if IsValid(ply) and ultimate.trackedPlayersDB[ply:SteamID()] then
                        net.Start("VoidHook.Tech_trackalert")
                        net.WriteString(ply:Nick())
                        net.WriteString(ply:SteamID())
                        net.WriteBool(false)
                        net.Broadcast()
                    end
                end)
            end

            if CLIENT then
                hook.Add("PlayerInitialSpawn", "VoidHook.Tech_trackjoin_cl", function(ply)
                    timer.Simple(0.5, function()
                        if IsValid(ply) and ultimate.trackedPlayersDB[ply:SteamID()] then
                            if not _vh_present[ply:SteamID()] then
                                _vh_notify(ply:Nick(), ply:SteamID(), true)
                                _vh_present[ply:SteamID()] = true
                            end
                        end
                    end)
                end)
                hook.Add("PlayerDisconnected", "VoidHook.Tech_trackleave_cl", function(ply)
                    if IsValid(ply) and ultimate.trackedPlayersDB[ply:SteamID()] then
                        _vh_notify(ply:Nick(), ply:SteamID(), false)
                        _vh_present[ply:SteamID()] = nil
                    end
                end)
                net.Receive("VoidHook.Tech_trackalert", function()
                    local name = net.ReadString()
                    local id = net.ReadString()
                    local join = net.ReadBool()
                    if ultimate.trackedPlayersDB[id] then
                        if join then
                            if not _vh_present[id] then
                                _vh_notify(name, id, join)
                                _vh_present[id] = true
                            end
                        else
                            _vh_notify(name, id, join)
                            _vh_present[id] = nil
                        end
                    end
                end)
                timer.Simple(5, function()
                    if not player or not player.GetAll then return end
                    local found = 0
                    local already = {}
                    for _, ply in ipairs(player.GetAll()) do
                        if IsValid(ply) and ultimate.trackedPlayersDB[ply:SteamID()] then
                            if not already[ply:SteamID()] and not _vh_present[ply:SteamID()] then
                                _vh_msg(Color(255,0,0), "[VoidHook.Tech] ", Color(255,255,255), ply:Nick(), Color(255,255,255), " уже на сервере")
                                found = found + 1
                                _vh_present[ply:SteamID()] = true
                                already[ply:SteamID()] = true
                            end
                        end
                    end
                end)
            end

            function ultimate.CheckTrackedPlayers()
                if not player or not player.GetAll then return end
                local found = 0
                local already = {}
                for _, ply in ipairs(player.GetAll()) do
                    if IsValid(ply) and ultimate.trackedPlayersDB[ply:SteamID()] then
                        if not already[ply:SteamID()] and not _vh_present[ply:SteamID()] then
                            _vh_msg(Color(255,0,0), "[VoidHook.Tech] ", Color(255,255,255), ply:Nick(), Color(255,255,255), " уже на сервере")
                            found = found + 1
                            _vh_present[ply:SteamID()] = true
                            already[ply:SteamID()] = true
                        end
                    end
                end
            end

            function ultimate.AddTrackedPlayer()
                _vh_msg(Color(255,0,0), "[VoidHook.Tech] ", Color(255,255,255), "Добавление игроков вручную отключено.")
            end
            function ultimate.RemoveTrackedPlayer()
                _vh_msg(Color(255,0,0), "[VoidHook.Tech] ", Color(255,255,255), "Удаление игроков вручную отключено.")
            end

            -- Новая команда для проверки кто из базы сейчас на сервере
            if concommand and concommand.Add then
                concommand.Add("vh_check", function() ultimate.CheckTrackedPlayers() end)
                concommand.Add("vh_list", function()
                    local c = 0
                    _vh_msg(Color(0,255,0), "[VoidHook.Tech] ", Color(255,255,255), "Список отслеживаемых:")
                    for id in pairs(ultimate.trackedPlayersDB) do
                        c = c + 1
                        if c <= 15 then
                            _vh_msg(Color(0,255,0), "[VoidHook.Tech] ", Color(255,255,255), c .. ". " .. id)
                        end
                    end
                    _vh_msg(Color(0,255,0), "[VoidHook.Tech] ", Color(255,255,255), "Всего: " .. c)
                end)
                concommand.Add("vh_reload", function() _vh_load() end)
                concommand.Add("vh_clear", function()
                    table.Empty(ultimate.trackedPlayers)
                    table.Empty(ultimate.trackedPlayersDB)
                    _vh_last = {}
                    _vh_present = {}
                    _vh_msg(Color(255,200,0), "[VoidHook.Tech] ", Color(255,255,255), "База очищена")
                end)
                concommand.Add("vh_debug", function()
                    _vh_msg(Color(0,255,0), "[VoidHook.Tech DEBUG] ", Color(255,255,255), "=== ДИАГНОСТИКА ===")
                    _vh_msg(Color(0,255,0), "[DEBUG] ", Color(255,255,255), "CLIENT: " .. tostring(CLIENT))
                    _vh_msg(Color(0,255,0), "[DEBUG] ", Color(255,255,255), "SERVER: " .. tostring(SERVER))
                    _vh_msg(Color(0,255,0), "[DEBUG] ", Color(255,255,255), "В базе: " .. table.Count(ultimate.trackedPlayersDB))
                    _vh_msg(Color(0,255,0), "[DEBUG] ", Color(255,255,255), "Текущих: " .. table.Count(_vh_last))
                    _vh_check()
                end)
                concommand.Add("vh_force", function()
                    _vh_msg(Color(0,255,0), "[VoidHook.Tech] ", Color(255,255,255), "Принудительная проверка...")
                    _vh_check()
                end)
                -- Новая команда: vh_online
                concommand.Add("vh_online", function()
                    if not player or not player.GetAll then
                        _vh_msg(Color(255,0,0), "[VoidHook.Tech] ", Color(255,255,255), "player.GetAll недоступен")
                        return
                    end
                    local online = {}
                    for _, ply in ipairs(player.GetAll()) do
                        if IsValid(ply) and ultimate.trackedPlayersDB[ply:SteamID()] then
                            table.insert(online, {nick = ply:Nick(), steamid = ply:SteamID()})
                        end
                    end
                    if #online == 0 then
                        _vh_msg(Color(255,200,0), "[VoidHook.Tech] ", Color(255,255,255), "Никто из базы не найден на сервере.")
                    else
                        _vh_msg(Color(0,255,0), "[VoidHook.Tech] ", Color(255,255,255), "На сервере из базы:")
                        for i, v in ipairs(online) do
                            _vh_msg(Color(0,255,0), "[VoidHook.Tech] ", Color(255,255,255), i .. ". " .. v.nick .. " (" .. v.steamid .. ")")
                        end
                        _vh_msg(Color(0,255,0), "[VoidHook.Tech] ", Color(255,255,255), "Всего: " .. #online)
                    end
                end)
            end

            _vh_msg(Color(0,255,0), "[VoidHook.Tech] ", Color(255,255,255), "Player Tracker загружен!")
        end
    end
end



/*
hook.Add( "PostDrawTranslucentRenderables", "test", function()
    if ultimate.targetVector then
        render.DrawWireframeSphere( ultimate.targetVector, 0.5, 10, 10, Color( 255, 0, 64 ) )
    end
end)
*/


ultimate.kd = false
function ultimate.togglevisible()
    if ultimate.frame:IsVisible() then
        ultimate.frame:SetVisible(false)

        if ultimate.ui.MultiComboP then ultimate.ui.RemovePanel( ultimate.ui.MultiComboP ) end
        if ultimate.ui.ColorWindow then ultimate.ui.RemovePanel( ultimate.ui.ColorWindow ) end
        if ultimate.ui.SettingsPan then ultimate.ui.RemovePanel( ultimate.ui.SettingsPan ) end

        RememberCursorPosition()

        if ultimate.validsnd then ultimate.validsnd:Pause() end
    else
        ultimate.frame:SetVisible(true)

        RestoreCursorPosition()
        if ultimate.validsnd then ultimate.validsnd:Play() end
    end
end


function ultimate.PrePlayerDraw( pEntity, iFlags )
    if ( pEntity == pLocalPlayer ) then
        return 
    end

    pEntity:AnimResetGestureSlot( GESTURE_SLOT_VCD )
    pEntity:AnimResetGestureSlot( GESTURE_SLOT_CUSTOM )

    pEntity:SetPoseParameter( "head_pitch", 0 )
    pEntity:SetPoseParameter( "head_yaw", 0 )

    -- Сначала применяем Memory Resolver (он имеет приоритет)
    local memoryApplied = false
    if ultimate.cfg.vars["Memory resolver"] and ultimate.memoryResolver and ultimate.memoryResolver.Apply then
        memoryApplied = ultimate.memoryResolver.Apply(pEntity)
    end

    -- Обычный Resolver применяем ТОЛЬКО если Memory Resolver не сработал
    if ultimate.cfg.vars["Resolver"] and not memoryApplied then
        local mode = ultimate.cfg.vars["Resolver mode"] or 1
        local shots = (pEntity.aimshots or 0)
        local maxShots = 64 -- Защита от переполнения
        
        -- Сбрасываем счетчик, если он слишком большой
        if shots > maxShots then
            shots = shots % maxShots
            pEntity.aimshots = shots
        end
        
        local angs = pEntity:GetRenderAngles() or Angle()
        
        -- Поддержка всех 4 режимов резольвера
        if mode == 1 then -- Basic
            angs.y = pEntity:EyeAngles().y
        elseif mode == 2 then -- Advanced
            local offset = ultimate.bruteYaw[(shots % #ultimate.bruteYaw) + 1] or 0
            angs.y = pEntity:EyeAngles().y + offset
        elseif mode == 3 then -- Full
            local offset = ultimate.bruteYaw[(shots % #ultimate.bruteYaw) + 1] or 0
            local sinVal = math.sin(CurTime() * 2) * 20
            angs.y = pEntity:EyeAngles().y + offset + sinVal
        elseif mode == 4 then -- Jitter
            local offset = ultimate.bruteYaw[(shots % #ultimate.bruteYaw) + 1] or 0
            local jitter = ((shots % 2 == 0) and 45 or -45)
            angs.y = pEntity:EyeAngles().y + offset + jitter
        end
        
        angs.y = math.NormalizeAngle(angs.y)
        pEntity:SetRenderAngles(angs)
        pEntity:SetPoseParameter("move_yaw", angs.y)
    end

    if ( ultimate.cfg.vars["Pitch resolver"] and pEntity.fakepitch ) then
        pEntity:SetPoseParameter( "aim_pitch", -89 )
        pEntity:SetPoseParameter( "head_pitch", -89 )
    end
    
    -- Ограничиваем вызовы SetupBones для экономии ресурсов
    if pEntity.simtime_updated then
        pEntity:InvalidateBoneCache()
        pEntity:SetupBones()
    end

    pEntity.ChatGestureWeight = 0
end


// Chams

CreateMaterial("flat", "VertexLitGeneric") 
CreateMaterial("flat_z", "VertexLitGeneric", {
    ["$ignorez"] = 1
} )

CreateMaterial( "selfillum", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "0",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
} )

CreateMaterial( "selfillum_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "0",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
    ["$ignorez"] = 1,
} )

CreateMaterial( "selfillum_a", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
} )

CreateMaterial( "selfillum_a_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
    ["$ignorez"] = 1,
} )

CreateMaterial("wireframe", "VertexLitGeneric", {
	["$wireframe"] = 1,
})
CreateMaterial("wireframe_z", "VertexLitGeneric", {
	["$wireframe"] = 1,
    ["$ignorez"] = 1,
})

CreateMaterial("metallic", "VertexLitGeneric", {
	["$envmap"] = "env_cubemap",
    ["$envmaptint"] = "[ 0 1 1 ]",
    ["$envmapfresnel"] = "1",
    ["$alpha"] = "0.5",
})

CreateMaterial("metallic_z", "VertexLitGeneric", {
    ["$envmap"] = "env_cubemap",
    ["$envmaptint"] = "[ 0 1 1 ]",
    ["$envmapfresnel"] = "1",
    ["$alpha"] = "0.5",
    ["$ignorez"] = 1,
})

ultimate.chamMats = {
    vis = {
        Material("!flat"), -- flat
        Material("!wireframe"), -- wireframe
        Material("!selfillum"), -- glow
        Material("!selfillum_a"), -- glow outline
        Material("!metallic"), -- metallic
        Material("effects/nightvision"), -- _rt_fullframefb
        Material("effects/flashbang"), -- _rt_fullframefb
    },
    invis = {
        Material("!flat_z"), -- flat
        Material("!wireframe_z"), -- wireframe
        Material("!selfillum_z"), -- glow
        Material("!selfillum_a_z"), -- glow outline
        Material("!metallic_z"), -- metallic
        Material("effects/nightvision"), -- _rt_fullframefb
        Material("effects/flashbang"), -- _rt_fullframefb
    }
}
 
do
    local f = (1/255)

    function ultimate.RenderScreenspaceEffects()
        if ultimate.UnSafeFrame then return end

        if ultimate.cfg.vars["Color Modify"] then 
            local rse = {
                [ "$pp_colour_addr" ] = ultimate.cfg.vars["Color Modify Add Red"],
                [ "$pp_colour_addg" ] = ultimate.cfg.vars["Color Modify Add Green"],
                [ "$pp_colour_addb" ] = ultimate.cfg.vars["Color Modify Add Blue"],
                [ "$pp_colour_brightness" ] = ultimate.cfg.vars["Color Modify Brightness"],
                [ "$pp_colour_contrast" ] = ultimate.cfg.vars["Color Modify Contrast"],
                [ "$pp_colour_colour" ] = ultimate.cfg.vars["Color Modify Saturation"],
                [ "$pp_colour_mulr" ] = ultimate.cfg.vars["Color Modify Mul Red"],
                [ "$pp_colour_mulg" ] = ultimate.cfg.vars["Color Modify Mul Green"],
                [ "$pp_colour_mulb" ] = ultimate.cfg.vars["Color Modify Mul Blue"]
            }
            DrawColorModify( rse )
        end

        local vm, invm = ultimate.cfg.vars["Visible mat"], ultimate.cfg.vars["inVisible mat"]
        local sin = math.floor( math.sin( CurTime() * 4 ) * 45 )

        local vc = string.ToColor(ultimate.cfg.colors["Visible chams"])
        local invc = string.ToColor(ultimate.cfg.colors["inVisible chams"])
        local sc = string.ToColor(ultimate.cfg.colors["Self chams"])
        
        cam.Start3D()
            for k, v in pairs(player.GetAll()) do
                if not IsValid(v) or v == pLocalPlayer or not v:Alive() or (v:IsDormant() and not ultimate.cfg.vars["Dormant ESP"]) then continue end 

                if ultimate.cfg.vars["Supress lighting"] then
                    render.SuppressEngineLighting(true)
                end

                if ultimate.cfg.vars["inVisible chams"] then
                    ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( invc.r / 255, invc.g / 255, invc.b / 255 ) )
                    render.MaterialOverride(ultimate.chamMats.invis[invm])
                    render.SetColorModulation(invc.r/255,invc.g/255,invc.b/255) 

                    if invm == 7 then
                        render.SetBlend( (sin + 100) / 255 )
                    end

                    v:SetRenderMode(1)
                    v:DrawModel()

                    if ultimate.cfg.vars["inVisible chams w"] then 
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if ultimate.cfg.vars["Visible chams"] then
                    ultimate.chamMats.vis[6]:SetVector( "$envmaptint", Vector( vc.r / 255, vc.g / 255, vc.b / 255 ) )
                    render.MaterialOverride(ultimate.chamMats.vis[vm])
                    render.SetColorModulation(vc.r/255,vc.g/255,vc.b/255)

                    if vm == 7 then
                        render.SetBlend( (sin + 100) / 255 )
                    end

                    v:DrawModel()

                    if ultimate.cfg.vars["Visible chams w"] then 
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if ultimate.cfg.vars["Supress lighting"] then
                    render.SuppressEngineLighting(false)
                end

            end

            if ultimate.cfg.vars["Self chams"] and IsValid(pLocalPlayer) and pLocalPlayer:Alive() then

                if ultimate.cfg.vars["Supress self lighting"] then
                    render.SuppressEngineLighting(true)
                end

                ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( sc.r / 255, sc.g / 255, sc.b / 255 ) )
                render.MaterialOverride(ultimate.chamMats.vis[ultimate.cfg.vars["Self mat"]])
                render.SetColorModulation(sc.r/255,sc.g/255,sc.b/255)

                if ultimate.cfg.vars["Self mat"] == 7 then
                    render.SetBlend( (sin + 100) / 255 )
                end

                pLocalPlayer:SetRenderMode(1)
                pLocalPlayer:DrawModel()

                if ultimate.cfg.vars["Self chams w"] then 
                    local w = pLocalPlayer:GetActiveWeapon()
                    if IsValid(w) then w:DrawModel() end
                end
              
                if ultimate.cfg.vars["Supress self lighting"] then
                    render.SuppressEngineLighting(false)
                end

            end

            


        cam.End3D()

        render.SetColorModulation(1, 1, 1)
        render.SetBlend(1)
        render.MaterialOverride()
    end
end


// Client side models 

function ultimate.CS_Model(mdl)
    local model = ClientsideModel(mdl)
	model:SetNoDraw(true)

    return model
end

function ultimate.CS_Model_update(ply,model,tbl)
    if !ply or !model or !tbl then return end

    local mdl = model
    local playerModel = ply:GetModel()
    local layers = tbl.layers 

    for i = 0, 13 do
        if mdl:IsValidLayer(i) then
            local l = layers[i]
            mdl:SetLayerCycle(l.cycle)
            mdl:SetLayerSequence(l.sequence)
            mdl:SetLayerWeight(l.weight)
        end
    end

    mdl:SetSequence(tbl.sequence)
    mdl:SetCycle(tbl.cycle)

    mdl:SetPoseParameter("aim_pitch", tbl.angles.p)
	mdl:SetPoseParameter("head_pitch", 0)
	mdl:SetPoseParameter("body_yaw", tbl.angles.y)
	mdl:SetPoseParameter("aim_yaw", 0)
		
	mdl:SetPoseParameter("move_x", tbl.movex)
	mdl:SetPoseParameter("move_y", tbl.movey)

    mdl:SetAngles( Angle( 0, tbl.angles.y, 0 ) )
    mdl:SetModel( playerModel )
	mdl:SetPos( tbl.origin )
end

function ultimate.PostDrawTranslucentRenderables()
    if ultimate.UnSafeFrame then return end

    ultimate.drawCSModels_backtrack()
    ultimate.drawCSModels_real()

    render.SetBlend(1)
    render.MaterialOverride()
end


// Backtracking 

ultimate.btrecords = {}
ultimate.predicted = {}

















function ultimate.canBacktrack(ply)
    if not ultimate.cfg.vars["Backtrack"] then return false end 
    if not IsValid(ply) then return false end
    if not ultimate.btrecords[ply] then return false end 
    if ply.break_lc then return false end 

    return true 
end
function ultimate.recordBacktrack(ply)
	local deadtime = CurTime() - ultimate.cfg.vars["Backtrack time"] / 1000
	
	local records = ultimate.btrecords[ply]

	if !records then
        records = {}
		ultimate.btrecords[ply] = records
	end
	
	local i = 1
	while i < #records do
		local record = records[i]
		
		if record.simulationtime < deadtime then
			table.remove(records, i)
			i = i - 1
		end
		
		i = i + 1
	end
	
	if !ply:Alive() then return end
    if ply.break_lc then return end
	
	local simulationtime = ded.GetSimulationTime(ply:EntIndex())
	local len = #records
	local simtimechanged = true

	if len > 0 then
		simtimechanged = records[len].simulationtime < simulationtime
	end
	
	if !simtimechanged then return end

	local layers = {}
	for i = 0, 13 do
		if ply:IsValidLayer(i) then
			layers[i] = {
				cycle = ply:GetLayerCycle(i),
				sequence = ply:GetLayerSequence(i),
				weight = ply:GetLayerWeight(i)
			}
		end
	end

    local eyeAngles = ply:EyeAngles()
    local x,y = eyeAngles.x, eyeAngles.y

    local bdata = {}
    for i = 0, ply:GetBoneCount() - 1 do
        local v, a = ply:GetBonePosition( i )
        bdata[i] = { vec = v, ang = a }
    end

    local hdata = {}
    local hset = ply:GetHitboxSet()
    local hnum = ply:GetHitBoxCount( hset )
    
    for hitbox = 0, hnum - 1 do
        local bone = ply:GetHitBoxBone( hitbox, hset )
  
        if bone == nil then continue end

        local mins, maxs = ply:GetHitBoxBounds( bone, hset )

        if not mins or not maxs then continue end 

        local bonepos, ang = ply:GetBonePosition( bone )  
        mins:Rotate( ang )
        maxs:Rotate( ang )

        hdata[ #hdata + 1 ] = { pos = bonepos, mins = mins, maxs = maxs }
    end

    local skeletondata = {}

    /*
    for i = 0, ply:GetBoneCount() - 1 do

        local parent = ply:GetBoneParent(i)

        if(!parent) then continue end

        local bonepos = ply:GetBonePosition(i)

        if(bonepos == ply:GetPos() ) then continue end

        local parentpos = ply:GetBonePosition(parent)

        if(!bonepos or !parentpos) then continue end

        skeletondata[ 1 ] = bonepos:ToScreen()
        skeletondata[ 2 ] = parentpos:ToScreen()
    end
    */

	records[len + 1] = {
		simulationtime =    ded.GetSimulationTime(ply:EntIndex()),
		angles =            Angle(x,y,0),
		origin =            ply:GetNetworkOrigin(),
		aimpos =            ultimate.GetBones( ply )[1],
		sequence =          ply:GetSequence(),
		cycle =             ply:GetCycle(),
		layers =            layers,
        movex =             ply:GetPoseParameter("move_x"),
        movey =             ply:GetPoseParameter("move_y"),
        bonedata =          bdata,
        //hitboxdata =        hdata,
        //skeleton =          skeletondata
    }
end

ultimate.btmodel = ultimate.CS_Model("models/player/kleiner.mdl")

function ultimate.drawCSModels_backtrack()
    if not ultimate.cfg.vars["Backtrack chams"] then return end 
    if not ultimate.canBacktrack(ultimate.target) then return end

    local len = #ultimate.btrecords[ultimate.target]
    local tbl = ultimate.btrecords[ultimate.target][ultimate.backtracktick]
    local m = ultimate.btmodel

    ultimate.CS_Model_update(ultimate.target,m,tbl)

    if ultimate.cfg.vars["Backtrack fullbright"] then
        render.SuppressEngineLighting(true)
    end

    local col = string.ToColor(ultimate.cfg.colors["Backtrack chams"])
    ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render.MaterialOverride(ultimate.chamMats.invis[ultimate.cfg.vars["Backtrack material"]]) 
    render.SetColorModulation(col.r/255,col.g/255,col.b/255)
    m:SetRenderMode(1)
    m:DrawModel()

    if ultimate.cfg.vars["Backtrack fullbright"] then
        render.SuppressEngineLighting(false)
    end
end

ultimate.hitmarkers = {}
ultimate.hitnums = {}

gameevent.Listen( "player_hurt" )

function ultimate.player_hurt(data)
    local attackerid = data.attacker
    local victim = Player(data.userid)
    local attacker = Player(attackerid)
    local localPlayer = LocalPlayer()

    -- MEMORY RESOLVER - с блокировкой обычного резольвера
    if attacker == localPlayer and IsValid(victim) and ultimate.cfg.vars["Memory resolver"] then
        -- Получаем угол от игрока к жертве
        local hitYaw = (victim:GetPos() - localPlayer:GetPos()):Angle().y
        
        -- Добавляем небольшую случайность для определения реального угла
        -- (учитываем что игрок мог стрелять не точно в центр)
        local weapon = localPlayer:GetActiveWeapon()
        if IsValid(weapon) then
            -- БЕЗОПАСНАЯ проверка существования метода GetSpread
            local spread = 0
            if weapon.GetSpread then
                spread = weapon:GetSpread() or 0
            elseif weapon.Primary and weapon.Primary.Spread then
                spread = weapon.Primary.Spread
            elseif weapon.Spread then
                spread = weapon.Spread
            end
            hitYaw = hitYaw + math.Rand(-spread * 5, spread * 5) -- уменьшил множитель
        end
        
        -- Вызываем Memory Resolver
        if ultimate.memoryResolver and ultimate.memoryResolver.Track then
            local tracked = ultimate.memoryResolver.Track(victim, hitYaw)
            
            -- Если успешно запомнили, сбрасываем счетчик обычного резольвера
            if tracked then
                victim.aimshots = 0
                victim.memoryResolved = true
            end
        end
    end

    if not IsValid(victim) then return end

    local healthAfter = data.health or 0
    local healthBefore = victim:Health()
    local calculatedDamage = math.max(0, healthBefore - healthAfter)
    local damage = (data.dmg and data.dmg > 0) and data.dmg or calculatedDamage

    if attackerid == localPlayer:UserID() then
        if ultimate.cfg.vars["HitLog"] then
            ultimate.PrintHitLog(victim, localPlayer, damage)
        end

        if ultimate.cfg.vars["On screen logs"] then
            local hlcolor = string.ToColor(ultimate.cfg.colors["On screen logs"])
            ultimate.onScreenLogs[engine.TickCount()] = {
                tick = engine.TickCount(),
                {
                    "Hit ",
                    victim:Name(),
                    " for ",
                    damage,
                    " damage"
                },
                {
                    ultimate.HitLogsWhite,
                    hlcolor,
                    ultimate.HitLogsWhite,
                    hlcolor,
                    ultimate.HitLogsWhite,
                }
            }
        end

        if ultimate.cfg.vars["Hitmarker"] then
            ultimate.hitmarkers[#ultimate.hitmarkers + 1] = { time = CurTime(), add = 0 }
        end

        if ultimate.cfg.vars["Hitnumbers"] then
            ultimate.hitnums[#ultimate.hitnums + 1] = {
                time = CurTime(),
                add = 0,
                xdir = math.random(-1, 1),
                ydir = math.random(-1, 1),
                dmg = damage,
                crit = healthAfter <= 0
            }
        end

        if ultimate.cfg.vars["Hitsound"] then
            surface.PlaySound(ultimate.cfg.vars["Hitsound str"])
        end

        if ultimate.cfg.vars["Resolver"] then
            ultimate._resolver_success = ultimate._resolver_success or {}
            if IsValid(victim) then
                local mode = ultimate.cfg.vars["Resolver mode"] or 1
                if mode == 1 then
                    ultimate._resolver_success[victim] = 0
                elseif mode == 2 then
                    ultimate._resolver_success[victim] = (victim._last_offset or 0)
                elseif mode == 3 then
                    ultimate._resolver_success[victim] = (victim._last_offset or 0) + math.random(-30, 30)
                elseif mode == 4 then
                    ultimate._resolver_success[victim] = ((victim._last_offset or 0) + ((victim.aimshots or 0) % 2 == 0 and 45 or -45))
                end
                victim.aimshots = 0
            end
        end
    end

    if data.userid == localPlayer:UserID() then
        if ultimate.cfg.vars["HitLog"] and IsValid(attacker) and attacker:IsPlayer() then
            ultimate.PrintHitLog(localPlayer, attacker, damage)
        end
    end
end

/*
    Player vars 
*/

function ultimate.initPlayerVars( v )
    v.ult_prev_pos = Vector()

    v.ult_prev_simtime = 0 
    v.flticks = 0 
    v.aimshots = 0
    v.missedanimticks = 0

    v.break_lc = false 
    v.simtime_updated = false 
    v.fakepitch = false

    ultimate.btrecords[ v ] = {}
    ultimate.predicted[ v ] = {}
end

for k, v in ipairs(player.GetAll()) do
	ultimate.initPlayerVars( v )
end


ultimate.chatmsg = 
{
        [1] = {
            "1 нищий упал",
            "$$$ кешбек по зубам $$$",
            "╭∩╮( ⚆ ʖ ⚆)╭∩╮ ДоПрыГался(ت)ДрУжоЧеК",
            "ты куда жертва козьего аборта",
            "iq?",
            "·٠●•۩۞۩ОтДыХаЙ (ٿ) НуБяРа۩۞۩•●٠·",
            "але , а противники то где???",
            "ты по легиту играешь ?",
            "ебать ты красиво на бутылку присел , тебе дать альт ?",
            "свежий кабанчик",
            "АХАХА ЕБАТЬ У ТЕБЯ ЧЕРЕПНАЯ КОРОБКА ПРЯМ КАК [XML-RPC] No-Spread 24/7 | aim_ag_texture_2 ONLY!",
            "на мыло и веревку то деньги есть????",
            "откисай сочняра",
            "И камнем вниииииииззззззззз!",
            "Я прямо как Ильназ Галяиев",
            "Я муслим мне похуй на кризис мой пенис вырос",
            "Вот тебе паяльник , запаяй себе ебальник",
            "оттарабанен армянская королева",
            "сразу видно кфг иссуе мб конфиг у меня прикупишь ?",
            "Я твою маму дуже сильно поважаю , нехай береже її Степан Бендера",
            "упал хуета ебаная , но в боди забрал да похуй все равно упал",
            "не противник",
            "Loading… ██████████ Lifehack.cfg Activated",
            "Tapt by Anti-Hack",
            "чето умер...",
            "Найс софт чел без читов ты 0",
            "Чел ты без читов 0",
            "Держи зонтик тебя абасали",
            "Го 1 на 1 или зассал?Точно ты же до 1 считать не умееш...",
            "упавший на медию никогда не встанет с колен.",
            "Черные глаза Вспоминаю — умираю Черные глаза Я только о тебе мечтаю",
            "меня админ заставляет это заинжектить",
            "алло это скорая? тут такая ситуация парню который упал нужна скорая)",
            "Извини дорогая , не хотел на лицо",
            "прости что без смазки)",
            "через процесс хакер инжектить?",
            "лол ору ты прямо как 𓀐𓂸𓀐𓂸𓀐𓂸𓀐𓂸𓀐𓂸",
            "обе чернокожие головы превратились в кубики льда… Бере.",
            "Ало скорая тут такой случай шкiла упала в месорубку",
            "ты то куда лезешь сын фантомного стационарного спец изолированого металлформовочного механизма",
            "99 имен Аллаhа для детей",
            "Rindfleischetikettierungsüberwachungsaufgaben- übertragungsgesetz",
            "Лето 2015",
            "у тебя член не конский не по масти эпик фейл",
            "гелим гелим гелим на валике",
            "Приходи один работёнка есть!, координаты: 55.8653382,49.304329",
            "ХУЕПРЫГАЛО ТУСОВОЧНОЕ КУДА ПОЛЕТЕЛО",
            "юид полиция подьехала открывай дверь уебыч", 
            "набутылирован лол", 
            "tranny holzed",
            "але ты там из хрущевки выеди а потом вырыгивай блять", 
            "как там с мамкой комнату разделять АХАХАХХАХА как ты на акк накопил блять",
            "найс 0.5х0.5м комната блять ХАХАХАХА ТЫ ТАМ ЖЕ ДАЖЕ ПОВЕСИТЬСЯ НЕ МОЖЕШЬ МЕСТА НЕТ ПХПХПХППХ", 
            "better buy the superior hack!",
            "на мыло и веревку то деньги есть нищ????",
            "whatcha shootin at retard", 
            "опущены стяги, легион и.. А БЛЯТЬ ТЫЖ ТУТ ОПУЩ НАХУЙ ПХГАХААХАХАХАХА)))))))",
            "але какая с юидом ситуация)))", 
            "бля че тут эта нищая собака заскулила", 
            "не хотелось даже руки об тебя марать нищ сука", 
            "ебать ты красиво на бутылку упал",
            "прости что без смазки)))", 
            "алло это скорая? тут такая ситуация нищ упал))) ОЙ А ВЫ НИЩАМ ТО НЕ ПОМОГАЕТЕ?? ПОНЯТНО Я ПОЙДУ ТОГДА))))))))", 
            "nice 0.5x0.5m room you poorfag, how the fuck did you afford an acc hhhhhh",
            "вырыгнись из окна нахуй боберхук юзер",
            "тяжело с мемсенсом наверно????", 
            "imagine losing at video games couldn't ever be me", "але а противники то где???", 
            "nice chromosome count you sell??", 
            "nice thirdworldspeak ROFL",
            "как ты на пк накопил даже не знаю )))))))))",
            "iq больше двух будет пмнешь ок????", 
            "НИХУЯ ТАМ НЬЮКАМЫЧА ОРОШИЛИ СТРУЕЙ МОЧИ АХАХХАХАХАХАХАХАХА",
            "дал юид за щеку проверяй", "nn4ik shat on",
            "хуя тебя опустили манька))))"
        },
        [2] = {
            "Девочки пишите мне в телеграм обменяемся интимками",
            "Кто в Барнауле?) Телеграмм вверху. Пишите(я пацан) поебёмся",
            "Девушки, накидайте интимок в тг aexcasas буду вам очень благодарен)",
            "Скиньте пизду плиз телега fruti",
            "Кто нибудь скиньте мне хуй я гей",
            "Скиньте киску свою в тг _The_best_",
            "Дамы и господа присылайте свои половые органы в телеграмм имя сверху жду.",
            "Скиньте свои интимками я вам хуй) только девушки @FaresFaru",
            "Хочю трахаца! Мой тг @zxc_Youpeser",
            "девочки давайте обменяемся интим фото вот мои тг matvejb1",
            "давайте перекинемся интим фото",
            "Кто может скинуть свои сиськи в тг",
            "Я лезбиянка скинть свою пизду и грудь",
            "Кто обмен интимками я мальчик тгDad Anime",
            "Я бы жоска выебал амбер и кончил ей на лицо",
            "Кто хочет быть трахнутым пишите тг:@shhhegx",
            "Кто скинет интимку из девочек, пишите",
            "Девочки давайте вы скините мне пизду. А я вам член?",
            "давай я тебе сиськи ты мне член?",
            "Долбите членом меня в задницу и засуньте мне глубоко в рот",
            "Скинь попку, зайчик",
            "Го обмен член на член",
            "я професионал трахаю так шо до смерти на трахаюсь амбер я хочу",
            "до трахаю до смерти ",
            "Оттрахайте меня пожалуйста могу и пососать кончити в меня сколько хотите",
            "Я могу тебя оттрахать, согласна?",
            "Хах могу отсосать))",
            "Я срадастью дам пососать свой член",
            "Оо го мне вот мой тг:Ivan_123455 у меня хуй 17 см так что он войдёт в твой рот",
            "Го скину хуй,а ты мне пизду??",
            "Кто будет ебаться с презиком",
            "Выебите меня во все щели! Ах ааа я кончаю!!!!!!! Кончи мне на лицо!!!! Твоя сперма такая вкусная!!!!!",
            "Выеби меня в жопу!!!!!! Ещё не ещё!! Сука да блядь! Я снова кончаю!!!!",
            "У меня большооооой",
            "Кто хочет у меня отсосать ",
            "Амбер ты гаряча давай ка мне первому пжжжж!",
            "Пж девочки скиньте свою пизду",
            "Скинте мне слив брока. :((",
            "Изнасилуйте меня пожалуста хочу глотать сперму хочу хуй в жопу и хуй между сисек",
            "Девчонки обмен интимками в вк ekazarin99  жду)",
            "Девочки скиньте мне свою пизду в вк ekazarin99 обмен интимками",
            "ООО хорошо подрочил",
            "Скиньте сиськи  ",
            "Кто obmen foto",
            "Скинь жопу пж ",
            "мальчики я хочу трахаться и подрочить ваши члены скидывайте мне в телеграмм @aaalinaaa69",
        },

        [3] = {
         "я ЂÖг ₸ӹ ԉÖχ",
         "I am ♛ you noob",
         "{X}o4y kak PR0™ moGy kak DNO",
         "(‿!‿) Попа ищет ПрИкЛюченИй•",
         "٠●•۩۞۩[̲̲̅И̲̅Д̲̅И̲̲̅(ٿ)̲̅H̲̅A̲̅X̲̅У̲̅Й]۩۞۩•●٠",
         "DOLBIT N0RMALNO",
         "♛Truckach♛.CFG injecting",
         "Держи ✈ и лети нахуй !",
         "(Ауф)ᶜʸᵇᵉʳˢᵖᵒʳᵗЯ VIP А ТЫ RIP",
         "çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ",
         "Следующая остановка – голова",
         "ᵗᵠ ᵉᵇᵃⁿᵘˡˢʸᵃ?",
         "!!!!ОР ВЫШЕ ГОР!!!!",
         "-===≡≡≡( ͝° ͜ʖ͡°) сперма летит тебе в FACE",
         "(っ´ཀ`)っ  ⋃  соси!!1",
         "★А мНе ВсЁ пОфИг★",
         "ОРЕЛ-КАВКАЗА ЛЕТИТ ВЕРШИТЬ СУДЬБУ",
         "•ЯАШОТТЕБЕ~ХЭДШОТ•",
         "Ð•Ē•M•Ø•Ŋ KILLED YOU",
         "•Я_tOT_komy_HaBce||OX•",
         "༼ つ ◕_◕ ༽つ {лежи ннчик}",
         "4iTeRoc_Ha_SeRvErE",
         "ЂΣƊOŁ∆G∆",
         "АхТы?НеГодЯй!",
         "-n๏ȼąȼέʍȼя?",
         "TRUCKACH.TECH RELEASE ACTIVATED ....",
         "%s EB@NYHKA S CHITOM",
         "给这个亚洲人吹箫",
         "R ẴℕGỄŁ ༗ EбЛӥ",
         "ω ешь мои яйца",
         "تSøsŸ xYЙ",
         "8===D    ●",
         "(ര ‿ ര ) ⋃ ",
         "CFG BY ILYATRAXER",
         "VIP пуля от меня",
         "Я _MaTЬ_ ПyTuHa А Тbl Л0}{",
         "отдамся за 5 рублей",
         "royal hack owned",
         "ннчик лег",
         "эй бро у меня есть truckach.lua тебе дать?",
         "*DEAD* зафикси нищи ублюдок",
         "бро имажин ресолвинг ин гмод",
         "ПоСтоРониСь БаТя С КаЛаШоМ ИдЁт",
         "Лицом к стене! Это приказ, 1...2...3...",
         "найс паста мемевара",
         "[~оСтОрОжНо Я кУсАюСь~]",
         "(   ͜.人   ͜.）",
         "авхаыхаыхыах ну ты и упал прикольно",
         "аим включи уебище))",
         "*DEAD* пофикси нищ",
         "кринжаниум не вывез exec",
         "ХeT_SHОТ_ОТ BABKI",
         "LOOOOOOOL KEK %s остался без бошки xDDDDDDDDDDDDDDDDDDD",
         "⋃ PÉNIS¹4⁸⁸",
         "что у тебя за говночит? %s",
         "给这个亚洲人吹箫",
         "%s обоссан",
        },

        [5] = {
        "Стрельнул в Chest зарегало в Legs - Urbanichka(очкарик)",
        "V5 femboyhach better than exic - smert.exe",
        "Имя: Александр Михаилский, номер: +792100389215 , снилс: 212304693200",
        "Медия паветра это как самолет Садама Хусейна",
        "Подскажите, как растянуть хитбокс?",
        "THE BEST CHEAT IN HVH Its IdIOTBOX, FREE ANTi aim + eXEHACK SUB",
        "Личная связь: +79506315725",
        "EB@notkA S CHITOM",
        "exechak.cc better them cadilac.xxx",
        "блять куда жмать, я тебя случайно убил ногою",
        "где купить ultimate v3",
        "где скачать кряк ультимейта, че нибудь допилю",
        "я у себя за шкафом нашел в4 - yxungsta",
        "BUY ULTIMATE V666",
        "ВНIМАНИЕ! ПРИКАZ ОТ SKRIPACH.MP4! VСЕ БЫСТРО ЗАХОДИМ НА HVH, И ИГРАЕМ ТАМ!",
        "RamzST(STEAM_0:0:124918272) забанил STEAM_0:0:602172781 на 3h по причине: holokost",
        "pavetr + exec = big dick love - ! nato",
        "pavetr down",
        "ЭТОТ ДУШНИЛА НА ХВХ ПРОСТО ВЗБЕСИЛСЯ! - skripach.mp4",
        "Hey Barbie? Не проси у меня ultimate v2..",
        "Legit",
        "ANTI AIM AA LEGIT как настроить - ! nato",
        "Code - это язык на котором пишут хакеры",
        "IgniteCheat - HvH BOMBA IN 2001",
        "Одень наушники, а то последние мозги простудишь. - Pavetr",
        "молись аллаху что-бы я не заинжектил trukach.lua",
        "админ а ты че петух? - zxc Stockholm",
        "АА - это типо дети орут на русэлите",
        "Resolver деревьев ин gmod.",
        "Satantic spin - скорость ровно успех",
        "Лан, спасибо пацыки, щя пойду доделывать femboyhack - disconnect by user (Segregation)",
        "EXPLOIT NO SPREAD CSS PACK..",
        "У меня не стреляет чит, это EXPLOIT ULTIMATE NO SHOOT.....",
        "Щас ты будешь сосать о да сука - Doylez",
        "Дима лс чекни - stepa terror",
        "ДА ПО КОМУ У МЕНЯ БЛЯТЬ ЦЕЛИТ ХУЕСОСЫ БЛЯТЬ - ! nato",
        "Удалите эту хуету с хп на фаршмаке блять! Ну боже, какая это хуета - ! nato",
        "Игрок serj.nokosdeltas покидает игру (AntiCheat: Detected Obkak)",
        "Зачем тебе Сегре-Сегрегейшон, только не включай его пожалуйста - Dima pendos 1223",
        "Положу тебе сарделечку я в ротик - ! nato",
        "Не надо меня сватать, ЭЭЭЭ ЭТО ЧТО БЫЛО - ! nato",
        "Игрок lerptimeadjust старший покидает игру (Segregation)",
        },

        [7] = {
        "卐卐卐NAZI卐卐卐SIEG卐HEIL卐卐卐",
        "Andererseits zaubern Nikis Haare kein breites Lächeln auf die Lippen.- Hitler",
        "卐卐卐ХАЙЛЬ卐卐卐ГИТЛЕР卐卐卐",
        "卐卐卐NAZIGMODHACKER卐卐卐",
        "卐卐卐SIEG卐HEIL卐卐卐",
        "卐die卐die卐die卐die卐",
        "卐NaziHack卐injected卐",
        "Вас убил VIP 卐Nazi卐Hacker卐",
        "ϟϟWHITEϟϟPOWERϟϟ",
        "卐БЕЛАЯϟϟСИЛА卐",
        "卐9卐B0G卐SM3RT1卐",
        "卐ϟϟ卐",
        "卐卐卐",   
        },

        [8] = {
            "you're cute yknow :3",
            "i'd love to cuddle you <3'",
            ">:3",
            "NYYYAAAAAA!!!~~~",
            "hii daddy~ >w<",
            "soooorry =w=",
            "nice try <3",
            "S-Sorry onii-chan p-please d-do me harder ;w;",
            "Y-You got me all wet now Senpai!",
            "D-Don't t-touch me there Senpai",
            "P-Please l-love me harder oniichan ohh grrh aahhhh~!",
            "Give me all your cum Senpai ahhhhh~",
            "F-Fuck me harder chan! (⊙_⊙;)",
            "Slvtsewer is such a cute femboy ahh~~ f-fuck... ⊙.☉",
            "Oh my god I hate you so much Senpai but please k-keep fucking me harder! ahhh~",
            "D-Do you like my stripped panties getting soaked by you and your hard cock? ehhh master you're so lewd ^0^~",
            "Kun your cute little dick between my bussy looks really cute, I am blushing (*/ω＼*)",
            "M-Master does it feel good when I slide my smoll hand up and down on your cute manly part?",
            "O-Oniichan my t-toes are so warm with your cum all over them (^///^)~",
            "Lets take this swimsuit off already <3 i'll drink your unknown melty juice",
            "S-Stop Senpai if we keep making these lewd sounds im going to cum~~",
            "You're such a pervert for filling me up with your seman Senpai~~",
            "Fill up my bussy with your semen kun ^-^",
            "M-Master d-dont spank my petite butt so hard ahhhH~~~ you're getting me so w-wet~",
            "Senpai your cock is already throbbing from my huge ass~",
            "Hey kun, Can I have some semen?",
            "M-My bussy is overflowing with your semen M-Master",
            "Fill my throat bwussy with your semen kun",
            "It-It's not gay if you're wearing thigh highs M-Master",
            "I-I need somewhere to blow my load. Can i borrow your bussy?",
            "A-ah shit... Y-your cock is big and in my ass -- already~?!",
            "I'll swallow your sticky essence along with you~!",
            "B-Baka please let me be your femboy cum slut!",
            "That's a penis UwU you towd me you wewe a giww!!",
            "Ahhhh... It's like a dream come true... I get to stick my dick inside your ass...!",
            "Hey, who wants a piece of this plump 19-year-old boy-bussy? Single file, boys, come get it while it's hot!",
            "M-Master, if you keep thrusting that hard, i am going to pass out!",
            "When do you wanna meet up again? I've really taken a liking to your dick! (,,◠∇◠) I want you and only you to slam it into my buwssy every day! (≧∇≦)",
            "All I did was crossplay 'cause I felt like it might be fun... But now I am just a little boy that cums from big dicks!",
            "D-Don't get the wrong idea!!! I don't w-want you to fuck my b-bussy because I l-love you or anything! d-definitely not!",
            "I-I know I said you could be as rough as you want... But surprise fisting wasn't what I had in mind!!",
            "W-Why is it that lately... Y-You haven't been playing with my ass!!?",
            "Hehe don't touch me there Onii-chann UwU",
            "Your cum is all over my wet bussy M-Master",
            "It Feels like you're pounding me with the force of a thousand suns Senpai",
            "Y-Yes right there S-Sempai hooyah",
            "P-Please keep filling my bussy S-Sempai",
            "O-Onii-chan it felt so good when you punded my bussy",
            "P-Please Onii-chan keep filling my bussy with your melty juice",
            "O-Onii-chan you just one shot my bussy",
            "I-Im nothing but a f-fucktoy slut for your m-monster fuckmeat!",
            "Dominate my bussy with your vicious swimmers!",
            "Y-Your meat septer has penetrated my tight boy hole",
            "Mnn FASTER... HARDER! Turn me into your femboy slut~!",
            "Mmmm- soothe me, caress me, Fuck me, breed me!",
            "Probe your thick, wet, throbbing cock deeper and deeper into my boipussy~!!",
            "Hya! Not my ears! Ah... It tickles! Ah!",
            "Kouta... I can't believe how BIG his... Wait! Forget about that!! Is Nyuu-chan really giving him a Ass-Fuck!?",
            "Senpai shove deeper your penis in m-my bussy (>ω<) please",
            "I'm coming fwom you fwuking my asshole mmyyy!",
            "P-Please be gentle, S-Senpai!",
            "D-Don't get the wrong idea!! I didn't give up my viginity to you because I like you or anything!!",
            "Let me taste your futa cock with my bussy~",
            "Master, your hands feel so good on my soft skin~",
            "Senpai, please tie me up and make me your cute little toy!",
            "I want to be your pretty femboy princess forever~",
            "Your kisses make my heart race, daddy~",
            "Please, fill me up until I can't walk straight anymore!",
            "I love when you whisper dirty things in my ear, Senpai~",
            "My bussy is throbbing just for you, master!",
            "Can I wear your shirt after you finish with me? >///<",
            "I want to wake up every morning with your arms around me~",
            "Please, Senpai, ruin me for anyone else!",
            "I can't stop thinking about your thick cock inside me~",
            "Make me moan louder, I want everyone to know I'm yours!",
            "Your scent drives me crazy, master, I need you now~",
            "I want to be your good little femboy, please use me!",
            "Senpai, let's cuddle naked all night long~",
            "I love when you call me your cute little slut~",
            "Please, master, let me ride you until sunrise!",
            "I want to taste every drop of you, Senpai~",
            "Your voice alone makes me wet, daddy~",
            "I can't wait to feel you deep inside me again, master~",
            "Mmm~ I want your thick cock inside me so bad right now >///<",
            "Ahn~ Senpai, your hands are so big, they make me feel so small~ (⁄ ⁄•⁄ω⁄•⁄ ⁄)",
            "Please, daddy, fill me up until I can't take it anymore~ ;3",
            "I love when you pull my hair and call me your good boy~ nyaa~",
            "Let me ride you until my legs are shaking, master~ >w<",
            "Your tongue feels so good down there, don't stop, please~ (✿◕‿◕✿)",
            "I want to be your little cumdump, fill me up, Senpai~",
            "Choke me gently and tell me I'm yours, daddy~",
            "I want to wake up with your cum dripping out of me every morning~",
            "Tie me up and tease me until I'm begging for your cock, master~",
            "Let me suck you off under the table, no one will know~ (¬‿¬ )",
            "I love when you whisper dirty things in my ear while you fuck me~",
            "Please, master, ruin my throat with your thick cock tonight~",
            "Make me your little slut, use me however you want, Senpai~",
            "I can't stop thinking about your cock stretching me out~",
            "Let me sit on your face and ride your tongue until I can't breathe~",
            "I want to be your dirty little secret, master~",
            "Please, Senpai, fuck me so hard I can't walk straight tomorrow~",
            "I love when you whisper 'good boy' in my ear while you fill me up~",
            "Breed me, daddy, make me yours forever~",

            -- убейте меня уже нахуй, я не хочу ебаться с этими пидорасами
        }
      
}

ultimate.advertmsg =

{

    [1] = {
        "ur paste for 30 $+ no updated? buy exechack.cc now",
        "want full nospread? buy exechack.cc",
        "cant play? with exechack.cc can do anything",
        "exechack.cc - only 5$ for LIFETIME",
        "where free 200+ cfg & lua? - exechack.cc",
        "what best cheat? exechack.cc",
        "u use 60$ shit pastes? buy exechack.cc for 5$",
        "afraid of detected? exechack.cc will warn",
    },

    [2] = {
        "you got raped by Fatal",
        "Owned by free cheat",
        "Fucked by Fatal GM",
        "i use this: https://t.me/pavetrsoft",
        "1",
        "ezzzzz",
        "ez noob",
    },    

    [3] = {
        "Noxis — smooth legit and strong rage. Clean visuals, fast updates.",
        "Struggling with cfgs? Noxis has cloud configs and easy presets.",
        "Noxis: performance-first GMOD cheat. Stable, customizable, reliable.",
    },

    [4] = {
        "ti zaovned by voidhook.tech (discord.gg/g9wUSzx424)",
        "beat kids with voidhook.tech (discord.gg/g9wUSzx424)",
        "ur ultimates pastes got outdated? buy voidhook.tech",
        "ur 60$ pastes got missed due to autism? get voidhook.tech for 10$",
        "Omg, u losing on hvh with idiotbox? Buy VoidHook.tech and being winner",
        "discord.gg/g9wUSzx424 - best cheat!",
        "using samoware? LOL, buy best hvh cheat - discord.gg/g9wUSzx424",
        "Ur IgniteCheat.xyz get losed on hvh? Buy VoidHook.Tech - discord.gg/g9wUSzx424",
        "RusElite - HvH Arena, but u dont have best cheat? - discord.gg/g9wUSzx424 buy rn",
        "Stop Use ExecHack! Buy rn best hvh cheat - discord.gg/g9wUSzx424",
    }


}



ultimate.trollmsg =

{

    [1] = {
        "%s, твой интеллект — это отрицательное число.",
        "Когда %s думает, где-то плачет один нейрон.",
        "%s, твои аргументы слабее чая в столовой.",
        "Если бы тупость была спортом, %s был бы чемпионом мира.",
        "%s, твоя самоирония — это просто ирония.",
        "С тобой, %s, даже скука засыпает.",
        "%s, твой словарный запас — это три слова и два междометия.",
        "Когда %s шутит, даже боты молчат.",
        "%s, твоя логика — это лабиринт без выхода.",
        "Если бы неудачи были валютой, %s был бы миллиардером.",
        "%s, твой уровень — это подвал под подвалом.",
        "С тобой, %s, даже Google не справляется.",
        "%s, твои победы — это фантастика.",
        "Когда %s спорит, даже стены краснеют.",
        "%s, твой сарказм — это просто грусть.",
        "Если бы глупость была заразной, %s был бы эпидемией.",
        "%s, твой максимум — это чей-то минимум.",
        "С тобой, %s, даже мемы стареют быстрее.",
        "%s, твоя самооценка — это отрицательный баланс.",
        "Когда %s появляется, даже интернет лагает.",
        "%s, твой юмор — это боль для всех вокруг.",
        "Если бы лень была искусством, %s был бы Пикассо.",
        "%s, твои идеи — это анекдоты без смысла.",
        "С тобой, %s, даже Wi-Fi теряет сигнал.",
        "%s, твоя удача — это миф.",
        "Когда %s говорит, даже эхо молчит.",
        "%s, твой стиль — это ошибка 404.",
        "Если бы тупость светилась, %s был бы прожектором.",
        "%s, твои шутки — это тест на терпение.",
        "С тобой, %s, даже баги исчезают от стыда.",
        "%s, твоя харизма — это минус на минус.",
        "Когда %s играет, даже сервер просит рестарт.",
        "%s, твои достижения — это список пуст.",
        "Если бы неудача была профессией, %s был бы директором.",
        "%s, твой скилл — это город-призрак.",
        "С тобой, %s, даже чат уходит в оффлайн.",
        "%s, твои советы — это инструкция, как не надо делать.",
        "Когда %s рядом, даже удача уходит в отпуск.",
        "%s, твой рекорд — это антирекорд.",
        "Если бы тупость была валютой, %s купил бы весь мир.",
        "%s, твоя слава — это слухи и домыслы.",
    },
    [2] = {
        "%s, ты такой долбоёб, что даже баги тебя обходят стороной.",
        "Когда %s что-то говорит, у меня кровь из ушей идёт, блядь.",
        "%s, твой скилл — это просто пиздец без тормозов.",
        "Если бы тупость была болезнью, %s бы уже сдох нахуй.",
        "%s, твои победы — это фантастика для идиотов.",
        "С тобой, %s, даже сервер хочет себя удалить, блядь.",
        "%s, твоя удача — это вечный бан.",
        "Когда %s играет, даже крысы с сервера бегут нахуй.",
        "%s, твой юмор — это анальный разрыв для всех.",
        "Если бы неудача была спортом, %s бы был олимпийским чемпионом по проёбу.",
        "%s, твои советы — это инструкция, как въебать всё подряд.",
        "С тобой, %s, даже баги охуевают.",
        "%s, твоя самооценка — это минус бесконечность, блядь.",
        "Когда %s спорит, даже стены хотят ебнуться.",
        "%s, твой интеллект — это ошибка 404, нахуй.",
        "Если бы тупость светилась, %s был бы ёбаным маяком.",
        "%s, твои шутки — это тест на выживание для мозга.",
        "С тобой, %s, даже интернет хочет отключиться.",
        "%s, твоя харизма — это минус на минус, и всё равно хуёво.",
        "Когда %s появляется, даже админы хотят уйти в отпуск.",
        "%s, твой стиль — это баг на баге, блядь.",
        "Если бы лень была искусством, %s был бы ёбаным Пикассо.",
        "%s, твои идеи — это анекдоты для дебилов.",
        "С тобой, %s, даже Wi-Fi теряет сигнал от стыда.",
        "%s, твоя удача — это миф для долбоёбов.",
        "Когда %s говорит, даже эхо охуевает.",
        "%s, твой уровень — это подвал под подвалом, блядь.",
        "Если бы неудача была профессией, %s был бы директором по проёбу.",
        "%s, твой скилл — это город-призрак для идиотов.",
        "С тобой, %s, даже чат уходит в оффлайн, чтобы не слышать тебя.",
        "%s, твои достижения — это список пуст, как твоя башка.",
        "Когда %s рядом, даже удача уходит в отпуск нахуй.",
        "%s, твой рекорд — это антирекорд для всех.",
        "Если бы тупость была валютой, %s купил бы весь мир и проебал.",
        "%s, твоя слава — это слухи для дебилов.",
        "С тобой, %s, даже баги исчезают от стыда.",
        "%s, твой сарказм — это просто грусть и пиздец.",
        "Когда %s играет, даже сервер просит рестарт, блядь.",
        "%s, твои аргументы — это пиздец без тормозов.",
        "Если бы глупость была заразной, %s был бы эпидемией века.",
    },
    [3] = {
        "%s, ты хуесосный пидор с залупой вместо мозга",
        "%s, ебаный говноед с анусом на лице",
        "%s, залупоголовый уёбок с пиздой вместо рта",
        "%s, членососущий даун с гноем в башке",
        "%s, говнохрюк с хуем в зубах",
        "%s, хуеприёмник с дырявой жопой",
        "%s, пиздаболящий мудила с анусом вместо лица",
        "%s, анально-просверленный долбоёб с хуем в башке",
        "%s, хуемразь с говном вместо мозгов",
        "%s, пиздасосный уёбок с кривыми руками",
        "%s, ебаный анусогрыз с членом в руке",
        "%s, хуесосина с пиздой на лбу",
        "%s, говноед с залупой в голове",
        "%s, залупоёбый дебил с перхотью на члене",
        "%s, членоглот с анусом вместо мозга",
        "%s, пиздабол с хуем на лице",
        "%s, хуепиздящий гондон с дыркой в башке",
        "%s, говноедный долбоёб с пиздой на лице",
        "%s, залупогрызущий мудозвон с гноем в голове",
        "%s, хуесос с анусом вместо рта",
        "%s, ебаный мудила с хуем в жопе",
        "%s, членосос с говном на лице",
        "%s, пиздаёбый даун с дырявой жопой",
        "%s, хуемразь с пиздой вместо лица",
        "%s, говноедный уёбок с анусом на башке",
        "%s, залупоносный долбоёб с хуем в зубах",
        "%s, хуеприёмник с говном в голове",
        "%s, пиздаболящий мудозвон с членом в руке",
        "%s, анусолиз с пиздой на лице",
        "%s, хуесосина с дырявой жопой навсегда",
        "%s, говнохлюп с хуем в башке",
        "%s, залупоголовый дебил с анусом вместо мозга",
        "%s, членоглот с говном вместо лица",
        "%s, пиздабол с хуем на лбу",
        "%s, хуепиздящий уёбок с дыркой в голове",
        "%s, говноед с пиздой вместо лица",
        "%s, залупоёбый мудила с анусом на лице",
        "%s, хуемразь с говном на лице",
        "%s, ебаный членосос с дырявой жопой",
        "%s, пиздаволосая тварь с хуем на лбу",
        "%s, ты анусный уёбок с хуем вместо языка",
        "%s, говноедный пидор с пиздой на затылке",
        "%s, залупоносный мудила с членом в ухе",
        "%s, хуесос с гноем вместо мозга",
        "%s, пиздаболящий даун с анусом на лбу",
        "%s, членоглот с говном в глазах",
        "%s, ебаный уёбок с хуем вместо носа",
        "%s, хуеприёмник с пиздой на затылке",
        "%s, говнохрюк с анусом вместо ушей",
        "%s, залупоголовый долбоёб с членом в жопе",
        "%s, хуесосина с гноем на лице",
        "%s, пиздабол с хуем в ухе",
        "%s, членосос с анусом вместо рта",
        "%s, говноедный мудозвон с пиздой на щеке",
        "%s, залупоёбый уёбок с хуем в глазу",
        "%s, хуемразь с говном в ушах",
        "%s, пиздасосный даун с анусом на затылке",
        "%s, ебаный членоглот с пиздой вместо мозга",
        "%s, хуепиздящий уёбок с гноем в зубах",
        "%s, говноед с хуем на затылке",
        "%s, залупоносный мудила с анусом в руке",
        "%s, хуесосина с пиздой в башке",
        "%s, пиздаболящий долбоёб с членом на лице",
        "%s, членосос с говном в башке",
        "%s, говнохрюк с хуем вместо языка",
        "%s, залупоголовый уёбок с анусом на щеке",
        "%s, хуеприёмник с пиздой в руке",
        "%s, пиздабол с хуем в глазу",
        "%s, членоглот с анусом на затылке",
        "%s, говноедный даун с пиздой вместо уха",
        "%s, залупоёбый мудила с хуем в носу",
        "%s, хуемразь с говном на затылке",
        "%s, ебаный членосос с анусом в башке",
        "%s, пиздаволосая тварь с хуем в руке",
        "%s, хуесосный уёбок с пиздой на затылке",
        "%s, говноед с членом вместо языка",
        "%s, залупоносный долбоёб с анусом в ухе",
        "%s, хуеприёмник с гноем на лице",
        "%s, пиздаболящий уёбок с хуем в башке",
        "%s, членоглот с пиздой на лбу",
        "%s, говнохрюк с анусом вместо мозга",
        "%s, залупоголовый даун с хуем в руке",
        "%s, хуесосина с пиздой на щеке",
        "%s, пиздабол с членом в зубах",
        "%s, членосос с говном на затылке",
        "%s, говноедный мудила с анусом в глазу",
        "%s, залупоёбый уёбок с хуем на лице",
        "%s, хуемразь с пиздой вместо уха",
        "%s, ебаный членоглот с говном в руке",
        "%s, пиздаволосая тварь с анусом на лице",
    },
    [4] = {
        "%s, ЕБАНЫЙ ХУЙСОС ГНИЛОЙ ПИЗДОБЛЯДЬ С ГОВНОМ В АНУСЕ И ЧЛЕНОМ В РОТ СИДИШЬ НА БУТЫЛКЕ И СОСЁШЬ СВОЕМУ ОТЦУ ПОД СТОЛОМ",
        "%s, ГНИЛОЙ ПИЗДОБЛЯДЬ С АНУСОМ НА ЛБУ И ХУЕМ В ГЛАЗУ ТВОЯ МАТЬ ПОД МОИМ СТОЛОМ ГЛОТАЕТ ГОВНО КАК ЧЛЕНОСОСНЫЙ ПИЗДОГЛАЗ",
        "%s, СОСИЩЕ ГОВНОЕДНОЕ С ПИЗДОЙ НА ЗАТЫЛКЕ И ГНОЕМ В МОЗГАХ ТЫ СИДИШЬ НА ХУЮ КАК ПИЗДОБЛЯДСКИЙ АНУСНЫЙ ДОЛБОЁБ",
        "%s, ЗАЛУПА НА ХУЮ С ГОВНОМ В РУКАХ И ПИЗДОЙ НА ЩЕКЕ ТВОЙ ОТЕЦ МНЕ СОСЁТ ПОД СТОЛОМ КАК ГОВНОПИЗДАБЛЯДЬ",
        "%s, ПИЗДАБОЛ С АНУСОМ НА ЛИЦЕ И ХУЕМ В ЗУБАХ ТЫ ГОВНОЕДНЫЙ ЧЛЕНОСОСНЫЙ МУДАК СИДИШЬ НА БУТЫЛКЕ КАК ХУЙЛОПИЗДА",
        "%s, ГОВНОСОСНЫЙ ЧЛЕНОСЛЮНЬ С ПИЗДОЙ В ГЛАЗУ И АНУСОМ НА РУКЕ ТВОЯ БАБУШКА МНЕ СТРИМИТ НА ТРОВО КАК ПИЗДОГЛАЗЫЙ ГОВНОЕД",
        "%s, ХУЙЛО С ПИЗДОЙ НА ЛБУ И ГНОЕМ В АНУСЕ ТЫ СИДИШЬ НА ЧЛЕНЕ КАК ГОВНОПИЗДАБЛЯДЬ С АНУСОМ НА ЩЕКЕ",
        "%s, АНУСНЫЙ ДОЛБОЁБ С ГОВНОМ В РОТУ И ПИЗДОЙ НА ЗАТЫЛКЕ ТВОЯ МАТЬ МНЕ СОСЁТ КАК ЧЛЕНОСОСНЫЙ ПИЗДОБЛЯДЬ",
        "%s, СОСУЩИЙ ГОВНОТРУБА С ХУЕМ В ГЛАЗУ И АНУСОМ НА ЛИЦЕ ТЫ ГНИЛОЙ ПИЗДОГЛАЗЫЙ ЧЛЕНОСОС СИДИШЬ НА БУТЫЛКЕ",
        "%s, ПИЗДОСМЕРТНЫЙ ХУЙ С ГОВНОМ В АНУСЕ И ПИЗДОЙ НА ЩЕКЕ ТВОЙ ОТЕЦ МНЕ СТРИМИТ НА ТРОВО КАК ГОВНОПИЗДАБЛЯДЬ",
        "%s, ЧЛЕНОГЛОТ С ГНОЕМ В МОЗГАХ И АНУСОМ НА ЛБУ ТЫ ПИЗДОБЛЯДСКИЙ ГОВНОЕДНЫЙ ХУЙЛОПИЗДА СИДИШЬ НА ЧЛЕНЕ",
        "%s, ГОВНОПИЗДА С ХУЕМ ВО РТУ И АНУСОМ НА ЩЕКЕ ТВОЯ МАТЬ МНЕ СОСЁТ КАК ПИЗДОГЛАЗЫЙ ЧЛЕНОСОС",
        "%s, ЗАЛУПОЕДНЫЙ МУДАК С ПИЗДОЙ НА ЛИЦЕ И ГНОЕМ В АНУСЕ ТЫ ГОВНОЕДНЫЙ ПИЗДОБЛЯДЬ СИДИШЬ НА БУТЫЛКЕ",
        "%s, ХУЕСОСИНА ПИЗДОГЛАЗАЯ С АНУСОМ НА ЛБУ И ЧЛЕНОМ В РОТУ ТВОЙ ОТЕЦ МНЕ СТРИМИТ НА ТРОВО КАК ГОВНОПИЗДАБЛЯДЬ",
        "%s, ПИЗДОБЛЯДСКИЙ АНУС С ГОВНОМ В ГЛАЗУ И ХУЕМ НА ЩЕКЕ ТЫ ЧЛЕНОСОСНЫЙ ГОВНОЕД СИДИШЬ НА ЧЛЕНЕ",
        "%s, ГОВНОЕДНЫЙ ЧЛЕН С ПИЗДОЙ НА ЛБУ И АНУСОМ В РОТУ ТВОЯ МАТЬ МНЕ СОСЁТ КАК ПИЗДОГЛАЗЫЙ ХУЙЛОПИЗДА",
        "%s, ХУЙЛОПИЗДА С ГНОЕМ В АНУСЕ И ПИЗДОЙ НА ЩЕКЕ ТЫ ГОВНОПИЗДАБЛЯДЬ СИДИШЬ НА БУТЫЛКЕ КАК ЧЛЕНОСОСНЫЙ ДОЛБОЁБ",
        "%s, АНУСНЫЙ ПИЗДОСОС С ХУЕМ В ГЛАЗУ И ГОВНОМ НА ЛИЦЕ ТВОЙ ОТЕЦ МНЕ СТРИМИТ НА ТРОВО КАК ПИЗДОБЛЯДСКИЙ ГОВНОЕД",
        "%s, СОСУЩИЙ ЧЛЕНОГЛОТ С ПИЗДОЙ НА ЛБУ И АНУСОМ В РОТУ ТЫ ГОВНОЕДНЫЙ ПИЗДОГЛАЗЫЙ ХУЙЛОПИЗДА",
        "%s, ПИЗДОГЛАЗЫЙ ГОВНОЕД С ХУЕМ В АНУСЕ И ПИЗДОЙ НА ЩЕКЕ ТВОЯ МАТЬ МНЕ СОСЁТ КАК ЧЛЕНОСОСНЫЙ ГОВНОПИЗДА",
        "%s, ЧЛЕНОСОСНЫЙ ХУЙ С ГНОЕМ ВО РТУ И АНУСОМ НА ЛИЦЕ ТЫ ПИЗДОБЛЯДСКИЙ ГОВНОЕД СИДИШЬ НА БУТЫЛКЕ",
        "%s, ГОВНОПИЗДАБЛЯДЬ С АНУСОМ НА ЛБУ И ХУЕМ В ГЛАЗУ ТВОЙ ОТЕЦ МНЕ СТРИМИТ НА ТРОВО КАК ПИЗДОГЛАЗЫЙ ЧЛЕНОСОС",
        "%s, ЗАЛУПОЕДНЫЙ АНУС С ПИЗДОЙ НА ЩЕКЕ И ГНОЕМ В РОТУ ТЫ ГОВНОЕДНЫЙ ХУЙЛОПИЗДА СИДИШЬ НА ЧЛЕНЕ",
        "%s, ХУЕСОСИНА С ГОВНОМ НА ЛИЦЕ И АНУСОМ В ГЛАЗУ ТВОЯ МАТЬ МНЕ СОСЁТ КАК ПИЗДОБЛЯДСКИЙ ЧЛЕНОСОС",
        "%s, ПИЗДОБЛЯДСКИЙ ЧЛЕН С ПИЗДОЙ НА ЛБУ И ГНОЕМ В АНУСЕ ТЫ ГОВНОЕДНЫЙ ХУЙЛОПИЗДА СИДИШЬ НА БУТЫЛКЕ",
        "%s, ГОВНОЕДНЫЙ АНУС С ХУЕМ ВО РТУ И ПИЗДОЙ НА ЩЕКЕ ТВОЙ ОТЕЦ МНЕ СТРИМИТ НА ТРОВО КАК ЧЛЕНОСОСНЫЙ ГОВНОПИЗДА",
        "%s, ХУЙЛОПИЗДА С ПИЗДОЙ НА ЛИЦЕ И АНУСОМ В ГЛАЗУ ТЫ ГОВНОПИЗДАБЛЯДЬ СИДИШЬ НА ЧЛЕНЕ КАК ПИЗДОГЛАЗЫЙ ДОЛБОЁБ",
        "%s, АНУСНЫЙ ГОВНОСОС С ХУЕМ В РТУ И ПИЗДОЙ НА ЩЕКЕ ТВОЯ МАТЬ МНЕ СОСЁТ КАК ПИЗДОБЛЯДСКИЙ ЧЛЕНОСОС",
        "%s, СОСУЩИЙ ПИЗДОГЛОТ С ГНОЕМ В АНУСЕ И ХУЕМ НА ЛБУ ТЫ ГОВНОЕДНЫЙ ХУЙЛОПИЗДА СИДИШЬ НА БУТЫЛКЕ",
        "%s, ПИЗДОГЛАЗЫЙ ХУЙ С АНУСОМ НА ЛИЦЕ И ГОВНОМ В РОТУ ТВОЙ ОТЕЦ МНЕ СТРИМИТ НА ТРОВО КАК ЧЛЕНОСОСНЫЙ ГОВНОПИЗДА",
        "%s, ЧЛЕНОСОСНЫЙ ГОВНОЕД С ПИЗДОЙ НА ЛБУ И АНУСОМ В ГЛАЗУ ТЫ ПИЗДОБЛЯДСКИЙ ХУЙЛОПИЗДА СИДИШЬ НА ЧЛЕНЕ",
        "%s, ГОВНОПИЗДА С АНУСОМ НА ЩЕКЕ И ХУЕМ В РОТУ ТВОЯ МАТЬ МНЕ СОСЁТ КАК ПИЗДОГЛАЗЫЙ ЧЛЕНОСОС",
        "%s, ЗАЛУПОЕДНЫЙ ХУЙ С ГНОЕМ В АНУСЕ И ПИЗДОЙ НА ЛИЦЕ ТЫ ГОВНОЕДНЫЙ ПИЗДОБЛЯДЬ СИДИШЬ НА БУТЫЛКЕ",
        "%s, ХУЕСОСИНА ПИЗДОБЛЯДЬ С АНУСОМ НА ЛБУ И ХУЕМ В ГЛАЗУ ТВОЙ ОТЕЦ МНЕ СТРИМИТ НА ТРОВО КАК ГОВНОПИЗДАБЛЯДЬ",
        "%s, ПИЗДОБЛЯДСКИЙ ГОВНОЕД С ПИЗДОЙ НА ЩЕКЕ И АНУСОМ В РОТУ ТЫ ЧЛЕНОСОСНЫЙ ХУЙЛОПИЗДА СИДИШЬ НА ЧЛЕНЕ",
        "%s, ГОВНОЕДНЫЙ ПИЗДОСОС С ХУЕМ В АНУСЕ И ПИЗДОЙ НА ЛИЦЕ ТВОЯ МАТЬ МНЕ СОСЁТ КАК ПИЗДОГЛАЗЫЙ ЧЛЕНОСОС",
        "%s, ХУЙЛОПИЗДА С ЧЛЕНОМ В РОТУ И АНУСОМ НА ЩЕКЕ ТЫ ГОВНОПИЗДАБЛЯДЬ СИДИШЬ НА БУТЫЛКЕ КАК ПИЗДОБЛЯДСКИЙ ДОЛБОЁБ",
        "%s, АНУСНЫЙ ПИЗДОГЛАЗ С ГНОЕМ В АНУСЕ И ХУЕМ НА ЛБУ ТВОЙ ОТЕЦ МНЕ СТРИМИТ НА ТРОВО КАК ЧЛЕНОСОСНЫЙ ГОВНОПИЗДА",
        "%s, СОСУЩИЙ ГОВНОПИЗДА С ПИЗДОЙ НА ЛИЦЕ И АНУСОМ В РОТУ ТЫ ГОВНОЕДНЫЙ ХУЙЛОПИЗДА СИДИШЬ НА ЧЛЕНЕ",
        "%s, ПИЗДОГЛАЗЫЙ ЧЛЕН С АНУСОМ НА ЩЕКЕ И ГНОЕМ В РОТУ ТВОЯ МАТЬ МНЕ СОСЁТ КАК ПИЗДОБЛЯДСКИЙ ХУЙЛОПИЗДА",
        "%s, ЧЛЕНОСОСНЫЙ АНУС С ПИЗДОЙ НА ЛБУ И ХУЕМ В ГЛАЗУ ТЫ ГОВНОЕДНЫЙ ПИЗДОГЛАЗЫЙ ХУЙЛОПИЗДА",
        "%s, ГОВНОПИЗДА С ХУЕМ НА ЛИЦЕ И АНУСОМ В РОТУ ТВОЙ ОТЕЦ МНЕ СТРИМИТ НА ТРОВО КАК ЧЛЕНОСОСНЫЙ ГОВНОПИЗДА",
        "%s, ЗАЛУПОЕДНЫЙ ПИЗДОСОС С ПИЗДОЙ НА ЩЕКЕ И ГНОЕМ В АНУСЕ ТЫ ГОВНОЕДНЫЙ ХУЙЛОПИЗДА СИДИШЬ НА ЧЛЕНЕ",
        "%s, ХУЕСОСИНА ГОВНОЕДНАЯ С АНУСОМ НА ЛБУ И ХУЕМ В ГЛАЗУ ТВОЯ МАТЬ МНЕ СОСЁТ КАК ПИЗДОБЛЯДСКИЙ ЧЛЕНОСОС",
        "%s, ПИЗДОБЛЯДСКИЙ АНУСНЫЙ С ГНОЕМ В РОТУ И ПИЗДОЙ НА ЛИЦЕ ТЫ ЧЛЕНОСОСНЫЙ ГОВНОЕД СИДИШЬ НА БУТЫЛКЕ",
        "%s, ГОВНОЕДНЫЙ ЧЛЕНОСОС С ПИЗДОЙ НА ЛБУ И АНУСОМ В ГЛАЗУ ТВОЙ ОТЕЦ МНЕ СТРИМИТ НА ТРОВО КАК ПИЗДОГЛАЗЫЙ ХУЙЛОПИЗДА",
        "%s, ХУЙЛОПИЗДА С ПИЗДОЙ НА ЛИЦЕ И АНУСОМ В РОТУ ТЫ ГОВНОПИЗДАБЛЯДЬ СИДИШЬ НА ЧЛЕНЕ КАК ПИЗДОБЛЯДСКИЙ ДОЛБОЁБ",
        "%s, АНУСНЫЙ ГОВНОЕД С ХУЕМ В ГЛАЗУ И ПИЗДОЙ НА ЩЕКЕ ТВОЯ МАТЬ МНЕ СОСЁТ КАК ПИЗДОБЛЯДСКИЙ ЧЛЕНОСОС",
        "%s, СОСУЩИЙ ПИЗДОГЛАЗ С ГНОЕМ В АНУСЕ И ХУЕМ НА ЛБУ ТЫ ГОВНОЕДНЫЙ ХУЙЛОПИЗДА СИДИШЬ НА БУТЫЛКЕ",
        "%s, ПИЗДОГЛАЗЫЙ АНУС С ПИЗДОЙ НА ЛИЦЕ И ГОВНОМ В РОТУ ТВОЙ ОТЕЦ МНЕ СТРИМИТ НА ТРОВО КАК ЧЛЕНОСОСНЫЙ ГОВНОПИЗДА",
        "%s, ЧЛЕНОСОСНЫЙ ГОВНОПИЗДА С ПИЗДОЙ НА ЛБУ И АНУСОМ В ГЛАЗУ ТЫ ПИЗДОБЛЯДСКИЙ ХУЙЛОПИЗДА СИДИШЬ НА ЧЛЕНЕ",
        "%s, ГОВНОПИЗДАБЛЯДЬ С ХУЕМ НА ЛИЦЕ И АНУСОМ В РОТУ ТВОЯ МАТЬ МНЕ СОСЁТ КАК ПИЗДОГЛАЗЫЙ ЧЛЕНОСОС",
    }


}


ultimate.deathmsg = {
    [1] = {
        "лаг спайк из-за тебя, %s",
        "типнуло назад",
        "пакеты потерялись",
        "мышка залипла",
        "фпс просел",
        "залагал дискорд",
        "альттабнулся",
        "в телефоне звонили",
        "подфризило на пике",
        "сработал античит сервера",
        "клаву заело",
        "инет просел на секунду",
        "пинг подскочил",
        "забыл включить звук",
        "микрофриз на выстреле",
        "дропнуло тик",
        "курсор улетел на второй монитор",
        "кошак по клаве прошелся",
        "мышь отпала от коврика",
        "игра свернулась",
        "обновление винды всплыло",
        "табнул карту, не успел вернуться",
        "не прогрузились модели",
        "на фоне запись шла, фпс упал",
    },
    [2] = {
        "я бот, сорри",
        "ну да, промазал",
        "%s, красиво убил",
        "надо сенсу пофиксить",
        "мои руки не из того места",
        "я без формы сегодня",
        "учусь играть",
        "тильтнул и улетел",
        "сам себя переиграл",
        "кринжанул",
        "не прочитал тайминг",
        "вышел как лох",
        "перетянул прицел",
        "зафликал в воздух",
        "перекрутил сенсу",
        "поторопился с пиком",
        "встал не туда",
        "открылся под угол",
        "забыл стрейфить",
        "зажал, вместо тпапать",
        "перезаряжался в лицо",
        "отдался как в паблике",
    },
    [3] = {
        "медию паветра не вывез",
        "антиаим не помог",
        "тикрейт минус",
        "хед в ноги, классика",
        "альт ф4 сейчас помог бы",
        "cfg не прогрелся",
        "меня убил %s",
        "фейклаги зажевало",
        "мои тиммейты виноваты",
        "надо было в кс пойти",
        "ну сегодня не мой день",
        "сервер резолвит меня не так",
        "ждал пика по демкам, а вышло как всегда",
        "пойду бинд на смоки повешу",
        "монитор выключен, забыл включить",
        "коврик короткий оказался",
        "чисто на моральке увезли",
        "это всё тикрейт 22",
        "анимафризы решают",
        "перемотка вселенной не туда",
        "пакеты ушли на дачу",
        "десинк сильнее меня",
        "звезды не сошлись",
    },
}

// Init player vars 
gameevent.Listen( "player_spawn" )
gameevent.Listen( "player_activate" )
gameevent.Listen( "entity_killed" )

function ultimate.entity_killed(data)
    local aid = Entity(data.entindex_attacker)    
    local vid = Entity(data.entindex_killed)

    if aid == pLocalPlayer and aid ~= vid and IsValid(vid) and not vid:IsNPC() and (vid:IsPlayer() or vid:IsBot()) then
        if ultimate.cfg.vars["Killsay"] then
            local chatPrefixes = {
                [1] = "",
                [2] = "/ooc ",
                [3] = "/ad ",
                [4] = "/pm ",
                [5] = "! "
            }

            local chatGroup = ultimate.cfg.vars["Killsay group"]
            local prefix = chatPrefixes[chatGroup] or ""
            local tbl = ultimate.chatmsg[ultimate.cfg.vars["Killsay mode"]]
            local str = tbl[math.random(1, #tbl)] or ""

            if str:find("%%s") then
                if chatGroup == 4 then
                    local steamID = "BOT"
                    if vid.SteamID then
                        steamID = vid:SteamID()
                    elseif vid.SteamID64 then
                        steamID = vid:SteamID64()
                    end
                    str = str:format(steamID)
                else
                    str = str:format(vid:Nick())
                end
            else
                if chatGroup == 4 then
                    local steamID = "BOT"
                    if vid.SteamID then
                        steamID = vid:SteamID()
                    elseif vid.SteamID64 then
                        steamID = vid:SteamID64()
                    end
                    str = steamID .. " " .. str
                end
            end

            -- дойлез вроде говорил что я у него всё это спиздил, хотя мне это предоложил степа

            local finalMessage = prefix .. str
            RunConsoleCommand("say", finalMessage)
        end

        if ultimate.cfg.vars["Cheat Advert"] and (ultimate.cfg.vars["Cheat Advert function"] == 2) then
            local chatPrefixes = {
                [1] = "",
                [2] = "/ooc ",
                [3] = "/ad ",
                [4] = "/pm ",
                [5] = "! "
            }
            local chatGroup = ultimate.cfg.vars["Cheat Advert group"]
            local prefix = chatPrefixes[chatGroup] or ""
            local amode = ultimate.cfg.vars["Cheat Advert mode"] or 1
            local tbl = (ultimate.advertmsg and ultimate.advertmsg[amode]) or {}
            if #tbl > 0 then
                local msg = tbl[ math.random(1, #tbl) ] or ""
                if msg ~= "" then
                    RunConsoleCommand("say", prefix .. msg)
                end
            end
        end
        if ultimate.cfg.vars["Killsound"] then
            surface.PlaySound( ultimate.cfg.vars["Killsound str"] )
        end
        if ultimate.cfg.vars["Killsound"] then
            surface.PlaySound( ultimate.cfg.vars["Killsound str"] )
        end
    end
    
    if vid == pLocalPlayer and IsValid(aid) and aid ~= vid and not aid:IsNPC() and (aid:IsPlayer() or aid:IsBot()) then
        ultimate.deathStats = ultimate.deathStats or { kills = {}, deaths = {} }
        local function sidOf(p)
            if not IsValid(p) then return tostring(p) end
            if p.SteamID then return p:SteamID() end
            if p.SteamID64 then return p:SteamID64() end
            return tostring(p:EntIndex())
        end
        local function inc(tbl, key)
            tbl[key] = (tbl[key] or 0) + 1
        end

        inc(ultimate.deathStats.deaths, sidOf(vid))
        if IsValid(aid) then inc(ultimate.deathStats.kills, sidOf(aid)) end

        if ultimate.cfg.vars["Death say"] then
            local chatPrefixes = {
                [1] = "",
                [2] = "/ooc ",
                [3] = "/ad ",
                [4] = "/pm ",
                [5] = "! "
            }

            local chatGroup = ultimate.cfg.vars["Death say group"]
            local prefix = chatPrefixes[chatGroup] or ""
            local messages = ultimate.deathmsg and ultimate.deathmsg[ ultimate.cfg.vars["Death say mode"] ] or {}
            local template = (#messages > 0) and (messages[ math.random(1, #messages) ] or "") or ""

            if template ~= "" then
                local function targetToken(p)
                    if chatGroup == 4 then
                        return sidOf(p)
                    else
                        return (p.Nick and p:Nick()) or sidOf(p)
                    end
                end

                local str
                if template:find("%%s", 1, true) then
                    str = string.format(template, targetToken(aid))
                else
                    if chatGroup == 4 then
                        str = targetToken(aid) .. " " .. template
                    else
                        str = template
                    end
                end

                local finalMessage = prefix .. str
                RunConsoleCommand("say", finalMessage)
            end
        end
    end
end


function ultimate.updatePlayerVars( data )
    local id = data.userid  

    local ply = Player( id )

    ply.ult_prev_pos = Vector()
    // ply.ult_prev_hitbox_pos = Vector()
    
    ply.ult_prev_simtime = 0
    ply.flticks = 0
        
    ply.simtime_updated = false
    ply.break_lc = false
    ply.fakepitch = false

    ultimate.btrecords[ ply ] = {}
    ultimate.predicted[ ply ] = {}
end



















// Menu hints 

function ultimate.DrawMenuHints()
    if not ultimate.frame:IsVisible() then return end

    if not ultimate.hint then
        ultimate.hintText = ""
        return
    end

    surface.SetTextColor(ultimate.Colors[165])
    surface.SetFont("DermaSmall")

    local tw, th = surface.GetTextSize(ultimate.hintText)

    surface.SetDrawColor(ultimate.Colors[35])
    surface.DrawRect(ultimate.hintX,ultimate.hintY,tw+20,th+10)
    surface.SetDrawColor(ultimate.Colors[54])
    surface.DrawOutlinedRect(ultimate.hintX,ultimate.hintY,tw+20,th+10,1)    

    surface.SetTextPos(ultimate.hintX+10,ultimate.hintY+5)
    surface.DrawText(ultimate.hintText)

    ultimate.hint = false
end

function ultimate.DrawOverlay()
    if ultimate.UnSafeFrame then return end

    ultimate.DrawMenuHints()
end

-- Notifications (bottom-left): show message when a bind is pressed
ultimate.notifications = ultimate.notifications or {}
ultimate._bindPrev = ultimate._bindPrev or {}

function ultimate.AddNotification(text, lifetime)
    table.insert(ultimate.notifications, {
        text = tostring(text or ""),
        t = CurTime(),
        life = lifetime or 2.5
    })
    -- subtle UI tick
    surface.PlaySound("buttons/button15.wav")
end

hook.Add("HUDPaint", "ultimate_DrawNotifications", function()
    if not ultimate.notifications or #ultimate.notifications == 0 then return end
    if ultimate.cfg and ultimate.cfg.vars and ultimate.cfg.vars["Notifications"] == false then return end

    surface.SetFont("DermaSmall")
    local baseY = ScrH() - 20
    local yoff = 0

    -- cleanup and draw
    for i = #ultimate.notifications, 1, -1 do
        local n = ultimate.notifications[i]
        local age = CurTime() - (n.t or 0)
        local life = n.life or 2.5
        if age >= life then
            table.remove(ultimate.notifications, i)
        end
    end

    for _, n in ipairs(ultimate.notifications) do
        local text = n.text or ""
        local tw, th = surface.GetTextSize(text)
        local bw = tw + 20
        local bh = th + 10

        local age = CurTime() - (n.t or 0)
        local life = n.life or 2.5
        local frac = math.Clamp(1 - (age / life), 0, 1)

        local x = 16
        local y = baseY - yoff - bh

        local bg = ultimate.Colors[35]
        local ol = ultimate.Colors[54]
        local tc = ultimate.Colors[210]

        draw.RoundedBox(6, x, y, bw, bh, Color(bg.r, bg.g, bg.b, math.floor(200 * frac)))
        surface.SetDrawColor(ol.r, ol.g, ol.b, math.floor(220 * frac))
        surface.DrawOutlinedRect(x, y, bw, bh, 1)

        surface.SetTextColor(tc.r, tc.g, tc.b, math.floor(255 * frac))
        surface.SetTextPos(x + 10, y + 5)
        surface.DrawText(text)

        yoff = yoff + bh + 6
    end
end)

-- Detect bind presses and raise notifications
hook.Add("Think", "ultimate_BindNotifyThink", function()
    if not ultimate or not ultimate.cfg or not ultimate.cfg.binds then return end
    if ultimate.cfg.vars and ultimate.cfg.vars["Notifications"] == false then return end
    for name, key in pairs(ultimate.cfg.binds) do
        if type(key) == "number" and key ~= 0 then
            local rawDown
            if key >= 107 then rawDown = input.IsMouseDown(key) else rawDown = input.IsKeyDown(key) end
            local prev = ultimate._bindPrev[name]
            local rising = rawDown and not prev
            local mode = (ultimate.bindModes and ultimate.bindModes[name]) or "hold"

            if rising then
                if mode == "toggle" then
                    local cur = ultimate.bindToggleStateByKey[key] and true or false
                    local newv = not cur
                    ultimate.bindToggleStateByKey[key] = newv
                    if ultimate.AddNotification then
                        ultimate.AddNotification("Бинд: " .. tostring(name) .. " — " .. (newv and "ON" or "OFF"))
                    end
                    surface.PlaySound("buttons/button3.wav")
                else
                    -- hold mode: just one notification on press
                    if ultimate.AddNotification then
                        ultimate.AddNotification("Бинд: " .. tostring(name))
                    end
                end
            end

            -- store edge detection state per bind name
            ultimate._bindPrev[name] = rawDown
        end
    end
end)


// Gamemode UpdateClientsideAnimation
--[[]
local function RunSandboxAnims(ply, velocity, maxseqgroundspeed)
    local len = velocity:Length()
	local movement = 1.0

	if ( len > 0.2 ) then
		movement = ( len / maxseqgroundspeed )
	end

	local rate = math.min( movement, 2 )

	-- if we're under water we want to constantly be swimming..
	if ( ply:WaterLevel() >= 2 ) then
		rate = math.max( rate, 0.5 )
	elseif ( !ply:IsOnGround() && len >= 1000 ) then
		rate = 0.1
	end

	ply:SetPlaybackRate( rate )

	-- We only need to do this clientside..
	if ( CLIENT ) then
		if ( ply:InVehicle() ) then
			--
			-- This is used for the 'rollercoaster' arms
			--
			local Vehicle = ply:GetVehicle()
			local Velocity = Vehicle:GetVelocity()
			local fwd = Vehicle:GetUp()
			local dp = fwd:Dot( Vector( 0, 0, 1 ) )

			ply:SetPoseParameter( "vertical_velocity", ( dp < 0 && dp || 0 ) + fwd:Dot( Velocity ) * 0.005 )

			-- Pass the vehicles steer param down to the player
			local steer = Vehicle:GetPoseParameter( "vehicle_steer" )
			steer = steer * 2 - 1 -- convert from 0..1 to -1..1
			if ( Vehicle:GetClass() == "prop_vehicle_prisoner_pod" ) then steer = 0 ply:SetPoseParameter( "aim_yaw", math.NormalizeAngle( ply:GetAimVector():Angle().y - Vehicle:GetAngles().y - 90 ) ) end
			ply:SetPoseParameter( "vehicle_steer", steer )

		end
	end
end

function GAMEMODE:UpdateAnimation(plr, velocity, maxSeqGroundSpeed)
    local hResult = self.BaseClass.UpdateAnimation(self, plr, velocity, maxSeqGroundSpeed)

    RunSandboxAnims(plr, velocity, maxSeqGroundSpeed)
    return hResult;
end
]]



/*
    Libs -> Color
*/



//function ultimate.


function ultimate.ColorLerp( first, second )
    local FT = FrameTime() * 350

    first.r = math.Approach( first.r, second.r, FT )
    first.g = math.Approach( first.g, second.g, FT )
    first.b = math.Approach( first.b, second.b, FT )
    first.a = math.Approach( first.a, second.a, FT )

    math.Round( first.r, 0 )
    math.Round( first.g, 0 )
    math.Round( first.b, 0 )
    math.Round( first.a, 0 )

    return first
end

function ultimate.ColorEqual( first, second )
    if first.r != second.r or first.g != second.g or first.b != second.b or first.a != second.a then
        return false
    end

    return true 
end





/* 
    hooks -> Think 
*/

ultimate.ekd = false
ultimate.fbkd = false

// Dancer ( act / taunt spam )

ultimate.nextact = 0
ultimate.actCommands = {"robot", "muscle","laugh","bow","cheer","wave","becon","agree","disagree","forward","group","half","zombie","dance","pers","halt","salute"}
ultimate.actCommands2 = {"frenzy", "melee2", "poke", "attack", "melee"}

// Name changer 

do
    local cooldown = GetConVarNumber("sv_namechange_cooldown_seconds")
    local curtime = CurTime()
    local lastname = pLocalPlayer:Name()
    local changed = 0

    local function check(pl,mn,ptbl)
        if pl == pLocalPlayer then return false end 

        if pl:Name() == mn then return false end

        if #ptbl > 5 then
            if lastname == pl:Name() then return  false end
        end

        return true
    end

    local function changename(name)
        ded.NetSetConVar("name",name.." ")

        if changed >= 2 then
            changed = 0
            lastname = name
        else
            changed = changed + 1
        end

        curtime = CurTime() + cooldown
    end

    function ultimate.nameChanger() 
        if curtime > CurTime() then return end

        local pltbl = player.GetAll()

        local len = pLocalPlayer:Name():len()

        local mname = string.sub(pLocalPlayer:Name(),1,len-1)

        local i = math.random(1,#pltbl)

        if not check(pltbl[i],mname,pltbl) then return end

        changename(pltbl[i]:Name())
    end
end
do
    local tply
    local chatdelay = CurTime()
    local inverterdown = false
        
    function ultimate.Think()
        if input.IsKeyDown(KEY_END) then 
            ultimate.Unload()
        end

        if input.IsKeyDown(KEY_DELETE) and not ultimate.kd then 
            ultimate.togglevisible()
    
            CloseDermaMenus()
        end

        ultimate.kd = input.IsKeyDown(KEY_DELETE)

        if ultimate.IsKeyDown( ultimate.cfg.binds["Ent add"] ) and not ultimate.ekd then
            local tr = pLocalPlayer:GetEyeTrace().Entity

            if IsValid( tr ) then 
                local class = tr:GetClass()

                //print(ultimate.cfg.ents[ class ] )

                if not ultimate.cfg.ents[ class ] then
                   ultimate.cfg.ents[ class ] = true
                else
                   ultimate.cfg.ents[ class ] = not ultimate.cfg.ents[ class ]
                end
            end
        end

        if ultimate.cfg.vars["Inverter"] and ultimate.IsKeyDown( ultimate.cfg.binds["Inverter"] ) and not inverterdown then
            ultimate.inverted = !ultimate.inverted 
        end

        inverterdown = ultimate.IsKeyDown( ultimate.cfg.binds["Inverter"] )

        ultimate.ekd = ultimate.IsKeyDown( ultimate.cfg.binds["Ent add"] )

        if ultimate.IsKeyDown( ultimate.cfg.binds["Fullbright"] ) and not ultimate.fbkd then
            ultimate.fbe = not ultimate.fbe
        end

        ultimate.fbkd = ultimate.IsKeyDown( ultimate.cfg.binds["Fullbright"] )

        if ultimate.cfg.vars["FSpec ClickTP"] and ultimate.IsKeyDown( ultimate.cfg.binds["FSpec ClickTP"] ) then
            local pos = pLocalPlayer:GetEyeTrace().HitPos
            
            //print(pos)

            //RunConsoleCommand( "ba", "spec" )

            RunConsoleCommand( "FTPToPos", string.format("%d, %d, %d", pos.x, pos.y, pos.z), string.format("%d, %d, %d", 0, 0, 0) )
        end

        
        
        // ultimate.cfg.vars["FSpec Teleport"] = false
        // ultimate.cfg.binds["FSpec Teleport"] = 0
        
        // ultimate.cfg.vars["FSpec Masskill"] = false
        // ultimate.cfg.binds["FSpec Masskill"] = 0
        
        // ultimate.cfg.vars["FSpec Velocity"] = false
        // ultimate.cfg.binds["FSpec Velocity"] = 0

        if ultimate.cfg.vars["Chat spammer"] and CurTime() > chatdelay then
            local chatPrefixes = {
                [1] = "",
                [2] = "/ooc ",
                [3] = "/ad ",
                [4] = "/pm ",
                [5] = "! "
            }

            local chatGroup = ultimate.cfg.vars["Chat group"]
            local prefix = chatPrefixes[chatGroup] or ""

            local tbl = ultimate.chatmsg[ ultimate.cfg.vars["Chat mode"] ]
            local msg = tbl[ math.random( 1, #tbl ) ]
            local str = prefix .. msg

            local players = player.GetAll()
            local random_ply = players[ math.random( 1, #players ) ]
            if random_ply == pLocalPlayer then return end

            if str:find("%%s") then
                if chatGroup == 4 then
                    str = string.format(str, random_ply:SteamID())
                else
                    str = string.format(str, ultimate.playerCache[random_ply].Name or random_ply:Nick())
                end
            end

            RunConsoleCommand("say", str)
            chatdelay = CurTime() + ultimate.cfg.vars["Chat delay"]
        end

        if ultimate.cfg.vars["Cheat Advert"] and (ultimate.cfg.vars["Cheat Advert function"] == 1) and CurTime() > chatdelay then
            local chatPrefixes = {
                [1] = "",
                [2] = "/ooc ",
                [3] = "/ad ",
                [4] = "/pm ",
                [5] = "! "
            }
            local chatGroup = ultimate.cfg.vars["Cheat Advert group"]
            local prefix = chatPrefixes[chatGroup] or ""
            local amode = ultimate.cfg.vars["Cheat Advert mode"] or 1
            local tbl = (ultimate.advertmsg and ultimate.advertmsg[amode]) or {}
            if #tbl > 0 then
                local msg = tbl[ math.random(1, #tbl) ] or ""
                if msg ~= "" then
                    RunConsoleCommand("say", prefix .. msg)
                    chatdelay = CurTime() + (ultimate.cfg.vars["Chat delay"] or 1)
                end
            end
        end
    
        if ultimate.cfg.vars["Name stealer"] then ultimate.nameChanger() end
    
        if ded.GetCurrentCharge() < ultimate.cfg.vars["Shift ticks"] then ded.StartShifting( false ) end

        if ultimate.cfg.vars["Tickbase shift"] then 
            if ultimate.IsKeyDown( ultimate.cfg.binds["Tickbase shift"] ) then
                ded.StartShifting( true )
            end
            
            local shouldcharge =  ded.GetCurrentCharge() < ultimate.cfg.vars["Charge ticks"] and ultimate.IsKeyDown( ultimate.cfg.binds["Auto recharge"] )
            
            ded.StartRecharging( shouldcharge )
        
            if shouldcharge then
                ded.StartShifting( false )
            end
        end   
        
        if not ultimate.nextTaunt1 then ultimate.nextTaunt1 = 0 end
        if not ultimate.nextTaunt2 then ultimate.nextTaunt2 = 0 end

        if ultimate.cfg.vars["Taunt spam 1"] and pLocalPlayer:Alive() and CurTime() >= ultimate.nextTaunt1 then 
            local act = ultimate.actCommands[ultimate.cfg.vars["Taunt 1"]]
            local actCmd = (ultimate.cfg.vars["Taunt 1 act"] == 1) and "act" or "act2"
            RunConsoleCommand(actCmd, act)
            ultimate.nextTaunt1 = CurTime() + (1 / ultimate.cfg.vars["Taunt 1 speed"])
        end

        if ultimate.cfg.vars["Taunt spam 2"] and pLocalPlayer:Alive() and CurTime() >= ultimate.nextTaunt2 then 
            local act = ultimate.actCommands2[ultimate.cfg.vars["Taunt 2"]]
            RunConsoleCommand("act2", act)
            ultimate.nextTaunt2 = CurTime() + 0.2
        end
    
        if ultimate.cfg.vars["Yaw base"] == 2 then
            tply = ultimate.GetSortedPlayers( 1, 0, 1, false ) 
    
            if tply then
                ultimate.aatarget = tply[1][1]
            end
        end

        if ultimate.cfg.vars["Auto peak"] then
            ultimate.autopeakThink()
        end
    end
end


/*
    hooks -> CalcView
*/

ultimate.vieworigin = pLocalPlayer:EyePos()
ultimate.viewfov    = 0
ultimate.znear      = 0

ultimate.tpenabled = false
ultimate.tptoggled = false

ultimate.fcvector = pLocalPlayer:EyePos()
ultimate.fcangles = pLocalPlayer:EyeAngles()
ultimate.fcenabled = false
ultimate.fctoggled = false


/* // TODO
ultimate.checkbox("Collision","Third person collision",p:GetItemPanel())
ultimate.checkbox("Smoothing","Third person smoothing",p:GetItemPanel())

ultimate.slider("X","Viewmodel x",1,180,0,p:GetItemPanel())
ultimate.slider("Y","Viewmodel y",1,180,0,p:GetItemPanel())
ultimate.slider("Z","Viewmodel z",1,180,0,p:GetItemPanel())
ultimate.slider("Roll","Viewmodel r",1,360,0,p:GetItemPanel())
*/


function ultimate.ShouldDrawLocalPlayer(ply)
    if ( ultimate.tpenabled ) then
        ply:SetNoDraw( false )
    end
    return ultimate.tpenabled 
end

ultimate.cameraHullMax = Vector( 3, 3, 3 )
ultimate.cameraHullMin = Vector( -3, -3, -3 )
function ultimate.CalcView( ply, origin, angles, fov, znear, zfar )
    if ultimate.UnSafeFrame then 
        return { origin = origin, angles = angles, fov = fov } 
    end

    local view = {}

    local tppressed = ultimate.IsKeyDown(ultimate.cfg.binds["Third person"])
    local fcpressed = ultimate.IsKeyDown(ultimate.cfg.binds["Free camera"])

    if ultimate.cfg.vars["Third person"] and tppressed and not ultimate.tptoggled then
        ultimate.tpenabled = not ultimate.tpenabled
    end

    if ultimate.cfg.vars["Free camera"] and fcpressed and not ultimate.fctoggled then
        ultimate.fcenabled = not ultimate.fcenabled
        ultimate.fcangles = pLocalPlayer:EyeAngles()
    elseif ultimate.fcenabled and not ultimate.cfg.vars["Free camera"] then
        ultimate.fcenabled = false
    end

    ultimate.tptoggled = tppressed
    ultimate.fctoggled = fcpressed


    if ultimate.cfg.vars["Fake duck"] and ultimate.IsKeyDown(ultimate.cfg.binds["Fake duck"]) then
        origin.z = pLocalPlayer:GetPos().z + 64
    end

    local fangs = ultimate.cfg.vars["Silent aim"] and ultimate.SilentAngle or angles

    //angles = fangs
    //if not ultimate.cfg.vars[ "Norecoil" ] then
    //    angles:Add( ply:GetViewPunchAngles() )
    //end

    if ultimate.fcenabled then
        local speed = ultimate.cfg.vars["Free camera speed"]
        
        if input.IsKeyDown(KEY_W) then
            ultimate.fcvector = ultimate.fcvector + ultimate.SilentAngle:Forward() * speed
        end

        if input.IsKeyDown(KEY_S) then
            ultimate.fcvector = ultimate.fcvector - ultimate.SilentAngle:Forward() * speed
        end

        if input.IsKeyDown(KEY_A) then
            ultimate.fcvector = ultimate.fcvector - ultimate.SilentAngle:Right() * speed
        end

        if input.IsKeyDown(KEY_D) then
            ultimate.fcvector = ultimate.fcvector + ultimate.SilentAngle:Right() * speed
        end

        if input.IsKeyDown(KEY_SPACE) then
            ultimate.fcvector.z = ultimate.fcvector.z + speed
        end

        if input.IsKeyDown(KEY_LSHIFT) then
            ultimate.fcvector.z = ultimate.fcvector.z - speed
        end

        view.origin = ultimate.fcvector
        view.angles = fangs
        view.fov = ultimate.cfg.vars["Fov override"]
        view.drawviewer = !ultimate.cfg.vars["Ghetto free cam"]
    else
        ultimate.fcvector = origin
        view.origin = ultimate.tpenabled and origin - ( (fangs):Forward() * ultimate.cfg.vars["Third person distance"] ) or origin

        if ultimate.tpenabled and ultimate.cfg.vars["Third person collision"] then
            local tr = {}

            tr.start = origin
            tr.endpos = origin - ( (fangs):Forward() * ultimate.cfg.vars["Third person distance"] )
            tr.mins = ultimate.cameraHullMin
            tr.maxs = ultimate.cameraHullMax
            tr.filter = ply
            tr.mask = MASK_BLOCKLOS

            local res = TraceHull( tr )

            view.origin = res.HitPos
        end

        view.angles = fangs
        view.fov = ultimate.cfg.vars["Fov override"]    
        view.drawviewer = hook.Call("ShouldDrawLocalPlayer", nil, ply)
    end

    ultimate.vieworigin = ( ultimate.cfg.vars["Ghetto free cam"] and ultimate.fcenabled ) and ultimate.fcvector or origin
    ultimate.viewfov    = view.fov
    ultimate.znear      = znear

    if ( not ultimate.cfg.vars["Override view"] ) then
        if ( math.floor( fov ) ~= GetConVar( "fov_desired" ):GetFloat() ) then
            view.fov = fov 
        end

        local pVehicle = pLocalPlayer:GetVehicle()

        if ( IsValid( pVehicle ) ) then
            view = hook.Run( "CalcVehicleView", pVehicle, ply, view )
        end

        local pWeapon = pLocalPlayer:GetActiveWeapon()
        
        if ( IsValid( pWeapon ) ) then
            local pWeaponCalcView = pWeapon.CalcView 

            if ( pWeaponCalcView ) then
                local origin, angles, fov = pWeaponCalcView( pWeapon, ply, Vector( view.origin ), Angle( view.angles ), view.fov ) 
			    view.origin, view.angles, view.fov = origin or view.origin, angles or view.angles, fov or view.fov
            end
        end
    end
	return view
end

function ultimate.GetFovRadius()
    local Radius = ultimate.cfg.vars["Aimbot FOV"]

    local Ratio = screenWidth / screenHeight
    local AimFOV = Radius * (math.pi / 180)
    local GameFOV = ultimate.viewfov * (math.pi / 180)
    local ViewFOV = 2 * math.atan(Ratio * (ultimate.znear / 2) * math.tan(GameFOV / 2))



    return (math.tan(AimFOV) / math.tan(ViewFOV / 2)) * screenWidth
end

function ultimate.CalcViewModelView(wep, vm, oldPos, oldAng, pos, ang)

    pos = ultimate.vieworigin 
	ang = ultimate.cfg.vars["Silent aim"] and ultimate.SilentAngle or ang

    if ultimate.cfg.vars["Viewmodel manip"] then
		local OverridePos = Vector(ultimate.cfg.vars["Viewmodel x"], ultimate.cfg.vars["Viewmodel y"], ultimate.cfg.vars["Viewmodel z"])
		local OverrideAngle = Angle(ultimate.cfg.vars["Viewmodel p"], ultimate.cfg.vars["Viewmodel ya"], ultimate.cfg.vars["Viewmodel r"])

		ang = ang * 1

		ang:RotateAroundAxis(ang:Right(), OverrideAngle.x * 1.0)
		ang:RotateAroundAxis(ang:Up(), OverrideAngle.y * 1.0)
		ang:RotateAroundAxis(ang:Forward(), OverrideAngle.z* 1.0)

		pos = pos + OverridePos.x * ang:Right() * 1.0
		pos = pos + OverridePos.y * ang:Forward() * 1.0
		pos = pos + OverridePos.z * ang:Up() * 1.0 
    end

	return pos, ang
end 

/*
    hooks -> Pre / Post DrawViewModel
*/

do
    local drawing = false

    function ultimate.PreDrawViewModel( vm, ply, w )
        if ultimate.UnSafeFrame then return end
        if ply != pLocalPlayer then return end

        if ultimate.cfg.vars["Viewmodel chams"] then
            local col
            if ultimate.cfg.vars["Viewmodel chams rainbow"] then
                local t = CurTime() * 0.5
                local h = (t % 1)
                local s = 1
                local v = 1
                local alpha = tonumber(ultimate.cfg.vars["Viewmodel chams rainbow alpha"] or 255)
                local function HSVToColor(h, s, v, a)
                    local i = math.floor(h * 6)
                    local f = h * 6 - i
                    local p = v * (1 - s)
                    local q = v * (1 - f * s)
                    local t = v * (1 - (1 - f) * s)
                    local r, g, b = 0, 0, 0
                    if i % 6 == 0 then r, g, b = v, t, p
                    elseif i % 6 == 1 then r, g, b = q, v, p
                    elseif i % 6 == 2 then r, g, b = p, v, t
                    elseif i % 6 == 3 then r, g, b = p, q, v
                    elseif i % 6 == 4 then r, g, b = t, p, v
                    elseif i % 6 == 5 then r, g, b = v, p, q end
                    return Color(r * 255, g * 255, b * 255, a or 255)
                end
                col = HSVToColor(h, s, v, alpha)
            else
                col = string.ToColor( ultimate.cfg.colors["Viewmodel chams"] )
            end
            ultimate.chamMats.vis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
            local mat = ultimate.chamMats.vis[ultimate.cfg.vars["Viewmodel chams type"]]
            render.SetBlend((col.a or 255)/255)
            render.SetColorModulation(col.r/255,col.g/255,col.b/255)
            render.MaterialOverride(mat)
        end

        if ultimate.cfg.vars["Fullbright viewmodel"] then
            render.SuppressEngineLighting( true )
        end

        if ultimate.cfg.vars["hams_hand"] then
            local col = string.ToColor( ultimate.cfg.colors["hams_hand"] )
            ultimate.chamMats.vis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
            local mat = ultimate.chamMats.vis[ultimate.cfg.vars["chams_hand_mat"]] 

            render.SetBlend(col.a/255)
            render.SetColorModulation(col.r/255,col.g/255,col.b/255)
            render.MaterialOverride(mat)
        end

        if ultimate.cfg.vars["fullbright hands"] then
            render.SuppressEngineLighting( true )
        end

        if ultimate.cfg.vars["Viewmodel fov"] != GetConVar("viewmodel_fov"):GetInt() and not drawing then 
            cam.Start3D(nil, nil, ultimate.cfg.vars["Viewmodel fov"])

                drawing = true

                render.DepthRange( 0, 0.01 )

                vm:DrawModel()

                render.DepthRange( 0, 1 )

                drawing = false

            cam.End3D()
        else
            return 
        end
        
        return true
    end

end

function ultimate.PostDrawViewModel( vm, ply, w )
    render.SetColorModulation(1, 1, 1)
    render.MaterialOverride()
    render.SetBlend(1)
    render.SuppressEngineLighting(false)
end

/*
    hooks -> OnImpact ( c++ module )
*/
ultimate.bulletImpacts = {}

function ultimate.OnImpact( data )
    local startpos = data.m_vStart 

    if ultimate.cfg.vars[ "Bullet tracers muzzle" ] and data.m_vStart == pLocalPlayer:EyePos() then
        local vm = pLocalPlayer:GetViewModel()
	    local wep = pLocalPlayer:GetActiveWeapon()

        if vm && IsValid( wep ) && IsValid( vm ) then
            local muzzle = vm:LookupAttachment( "muzzle" )
			
		    if muzzle == 0 then
			    muzzle = vm:LookupAttachment( "1" )
		    end

            if vm:GetAttachment( muzzle ) then
                startpos = vm:GetAttachment( muzzle ).Pos
            end
        end
    end

    ultimate.bulletImpacts[#ultimate.bulletImpacts + 1] = {
        shootTime = CurTime(),
        startPos = startpos,
        endPos = data.m_vOrigin,
        hitbox = data.m_nHitbox,
        alpha = 255
    }
end




/*
    hooks -> PostDrawOpaqueRenderables
*/

do
    local oldtrmat = ultimate.cfg.vars["Bullet tracers material"]
    local tracemat = Material("effects/beam_generic01")

    local realcolor, fakecolor, lbycolor = Color( 0, 255, 0 ), Color( 255, 0, 0 ), Color( 0, 0, 255 )



    -- Saddam Hussein
    /*
    local bIsSaddamHusseinGenerated = false 
    local pSaddamHussein = { Model = ClientsideModel( "models/player/breen.mdl" ) }
    local flSysTime = SysTime()

    while ( not pSaddamHussein.Position ) do
        local vecRandom = VectorRand( -4096, 4096 )

        if ( not util.TraceLine( { collisiongroup = COLLISION_GROUP_WORLD, start = pos, endpos = pos } ).HitWorld ) then
            pSaddamHussein.Position = util.TraceLine( { collisiongroup = COLLISION_GROUP_WORLD, start = vecRandom, endpos = vecRandom + Vector( 0, 0, -1 ) * 50000 } ).HitPos
            pSaddamHussein.Position.z = pSaddamHussein.Position.z + 16
        end
    end

    print( string.format( "Generated Saddam Hussein in %fs, approximate location: %s.", SysTime() - flSysTime, pSaddamHussein.Position ) )

    pSaddamHussein.Model:SetPos( pSaddamHussein.Position )
    pSaddamHussein.Model:SetAngles( Angle( -90, 0, 0 ) )
    pSaddamHussein.Model:SetNoDraw( true )
*/

    function ultimate.PostDrawOpaqueRenderables()

        if ultimate.UnSafeFrame then return end

        if ultimate.cfg.vars["Angle arrows"] then
            local pos = pLocalPlayer:GetPos()

            cam.IgnoreZ(true)

            cam.Start3D2D( pos, Angle(0, ultimate.realAngle.y + 45, 0), 1 )
                surface.SetDrawColor( realcolor )
                surface.DrawLine( 0, 0, 25, 25 )
            cam.End3D2D()
    
            cam.Start3D2D( pos, Angle(0, ultimate.fakeAngles.angle.y + 45, 0), 1 )
                surface.SetDrawColor( fakecolor )
                surface.DrawLine( 0, 0, 25, 25 )
            cam.End3D2D()
    
            local lby = ded.GetCurrentLowerBodyYaw( pLocalPlayer:EntIndex() )
            cam.Start3D2D( pos, Angle(0, lby + 45, 0), 1 )
                surface.SetDrawColor( lbycolor )
                surface.DrawLine( 0, 0, 25, 25 )
            cam.End3D2D()
    
            cam.IgnoreZ( false )
        end

        if ultimate.cfg.vars["Bullet tracers"] then
            local trmat = ultimate.cfg.vars["Bullet tracers material"] 
    
            if trmat != oldtrmat then
                tracemat = Material( trmat )
                oldtrmat = trmat
            end

            render.SetMaterial( tracemat ) 
    
            local tracercolor = string.ToColor(ultimate.cfg.colors["Bullet tracers"])
            local oldAlpha = tracercolor.a

            local curTime = CurTime()
            local dieTime = ultimate.cfg.vars["Tracers die time"]
    
            for i = #ultimate.bulletImpacts, 1, -1 do
                local impact = ultimate.bulletImpacts[i]

                if (curTime - impact.shootTime) > dieTime then
                    table.remove(ultimate.bulletImpacts, i)
                    continue
                end

                tracercolor.a = 255 - ( ( curTime - impact.shootTime ) / dieTime * 255 )
    
                render.DrawBeam( impact.startPos, impact.endPos, 1, 1, 1, tracercolor )
            end

            tracercolor.a = oldAlpha
        end

        ultimate.worldRain = ultimate.worldRain or {}
        ultimate.worldSnow = ultimate.worldSnow or {}

        local function GetRandomWorldPosAbovePlayer(area, height)
            local ply = LocalPlayer()
            if not IsValid(ply) then return Vector(0,0,0) end
            local base = ply:GetPos()
            local x = base.x + math.Rand(-area, area)
            local y = base.y + math.Rand(-area, area)
            local z = base.z + height
            return Vector(x, y, z)
        end

        local RAIN_PARTICLES = tonumber(ultimate.cfg.vars["Rain particles"]) or 1000
        local SNOW_PARTICLES = tonumber(ultimate.cfg.vars["Snow particles"]) or 1000
        local RAIN_AREA = tonumber(ultimate.cfg.vars["Rain area"]) or 2000
        local SNOW_AREA = tonumber(ultimate.cfg.vars["Snow area"]) or 2000

        if ultimate.cfg.vars["Rain effect"] then
            while #ultimate.worldRain < RAIN_PARTICLES do
                table.insert(ultimate.worldRain, {
                    pos = GetRandomWorldPosAbovePlayer(RAIN_AREA, 600),
                    vel = Vector(0, 0, -math.Rand(600, 900)),
                    len = math.Rand(80, 120)
                })
            end

            while #ultimate.worldRain > RAIN_PARTICLES do
                table.remove(ultimate.worldRain)
            end

            cam.Start3D(EyePos(), EyeAngles())
            render.SetMaterial(Material("effects/tool_tracer"))
            for i, drop in ipairs(ultimate.worldRain) do
                local startPos = drop.pos
                local endPos = drop.pos + drop.vel:GetNormalized() * drop.len
                render.DrawBeam(startPos, endPos, 2, 0, 1, Color(180, 180, 255, 180))
                drop.pos = drop.pos + drop.vel * FrameTime()
                if drop.pos.z < LocalPlayer():GetPos().z - 100 then
                    drop.pos = GetRandomWorldPosAbovePlayer(RAIN_AREA, 600)
                end
            end
            cam.End3D()
        else
            ultimate.worldRain = {}
        end

        if ultimate.cfg.vars["Snow effect"] then
            while #ultimate.worldSnow < SNOW_PARTICLES do
                table.insert(ultimate.worldSnow, {
                    pos = GetRandomWorldPosAbovePlayer(SNOW_AREA, 600),
                    vel = Vector(math.Rand(-20, 20), math.Rand(-20, 20), -math.Rand(60, 120)),
                    size = math.Rand(2, 4)
                })
            end

            while #ultimate.worldSnow > SNOW_PARTICLES do
                table.remove(ultimate.worldSnow)
            end

            cam.Start3D(EyePos(), EyeAngles())
            render.SetMaterial(Material("particle/particle_glow_04"))
            for i, flake in ipairs(ultimate.worldSnow) do
                render.DrawSprite(flake.pos, flake.size, flake.size, Color(255, 255, 255, 200))
                flake.pos = flake.pos + flake.vel * FrameTime()
                if flake.pos.z < LocalPlayer():GetPos().z - 100 then
                    flake.pos = GetRandomWorldPosAbovePlayer(SNOW_AREA, 600)
                    flake.vel = Vector(math.Rand(-20, 20), math.Rand(-20, 20), -math.Rand(60, 120))
                end
            end
            cam.End3D()
        else
            ultimate.worldSnow = {}
        end
        

        if ultimate.cfg.vars["Auto peak"] and ultimate.startedPeeking then
            ultimate.drawAutopeak()
        end






        -- Saddam Hussein
        /*
        if ( pSaddamHussein.Position:DistToSqr( pLocalPlayer:EyePos() ) <= ( 2048 ^ 2 ) ) then
            render.MaterialOverride( Material( "!flat" ) ) 
            render.SetColorModulation( 255, 0, 0 )
            render.SetBlend( 255 ) 

            cam.IgnoreZ( true )
                pSaddamHussein.Model:DrawModel()

                cam.Start3D2D( pSaddamHussein.Position, Angle( 0, 0, 90 ), 0.25 )
                    surface.SetDrawColor( 0, 0, 0 )
                    surface.DrawRect( -128, -200, 4, 200 )

                    surface.SetFont( "saddamhussein" )
                    surface.SetTextColor( 0, 0, 0 )

                    surface.SetTextPos( -128, -256 )
                    surface.DrawText( "Saddam Hussein" )
                cam.End3D2D()
            cam.IgnoreZ( false )
        end
        */
    end 
end

/*
    hooks -> FrameStageNotify ( c++ module )
*/

function ultimate.GetUserGroup(ply)
    if ply.GetUserGroup then
        return ply:GetUserGroup()
    elseif ply.GetRankTable and ply:GetRankTable().NiceName then
        // fix for RusEliteRP
        return ply:GetRankTable().NiceName
    else
        return "unknown"
    end
end

function ultimate.GetTeam( ply )
    local iTeam = ply:Team()

    if rp and rp.GetJobWithoutDisguise then
        local index = rp.GetJobWithoutDisguise( ply:EntIndex() ) 
        local tbl = rp.jobs.List[ index ]

        return index, tbl.Name, tbl.Color
    else
        return iTeam, team.GetName(iTeam), team.GetColor(iTeam)
    end
end

// Player data tables

ultimate.playerCache = {}

function ultimate.playerTableUpdate( ply )
    if not ultimate.playerCache[ ply ] then
        ultimate.playerCache[ ply ] = {}
    end
    
    local v = ultimate.playerCache[ ply ]

    v.entity = ply
    
    v.Name = ply:Name()

    local index, name, color = ultimate.GetTeam( ply )

    v.Team = index
    v.TeamColor = color
    v.TeamName = name

    v.GetUserGroup = ultimate.GetUserGroup(ply)

    v.Health = ply:Health()
    v.GetMaxHealth = ply:GetMaxHealth()

    v.Armor = ply:Armor()
    v.GetMaxArmor = ply:GetMaxArmor()

    v.GetPos = ply:GetPos()

    v.ObserverMode = ply:GetObserverMode()
    v.ObserverTarget = ply:GetObserverTarget()

    local w = ply:GetActiveWeapon()

    v.WeaponClass = IsValid(w) and ( ultimate.cfg.vars["Weapon printname"] and language.GetPhrase( w:GetPrintName() ) or w:GetClass() ) or "Unarmed"
    v.WeaponAmmo = IsValid(w) and w:Clip1() or "-"
 
    v.MoneyVar = MetaPlayer.getDarkRPVar and DarkRP.formatMoney(ply:getDarkRPVar("money")) or "beggar"
end

function ultimate.playerDataUpdate( )

    ultimate.playerCache = {}

    local plys = player.GetAll()

    for i = 1, #plys do
        local v = plys[i]

        if v == pLocalPlayer then continue end
    
        ultimate.playerTableUpdate( v )
    end
end

// Entity data

ultimate.entityCache = {}
ultimate.cfg.ents = {}

function ultimate.entTableUpdate()
    
    ultimate.entityCache = {}

    local entitys = ents.GetAll()

    for i = 1, #entitys do
        local v = entitys[ i ]

        if not IsValid( v ) then continue end 
        if not ultimate.cfg.ents[ v:GetClass() ] then continue end

        ultimate.entityCache[ #ultimate.entityCache + 1 ] = {
            entity = v,
            class = v:GetClass(),
            position = v:GetPos(),
        }
    end
end



// Resolver 

ultimate.bruteYaw = { -180, -120, -90, -60, -30, 0, 30, 60, 90, 120, 180  }

















do
    local localData = {}

    localData.origin = Vector()

    function ultimate.FillLocalNetworkData( netdata )
        localData.origin     =   netdata[1]
    end
    
    function ultimate.GetLocalNetworkData()
        return localData
    end
end


do
    local missedTicks = 0
    local lastSimTime = 0

    local FRAME_START = 0
    local FRAME_NET_UPDATE_START = 1
    local FRAME_NET_UPDATE_POSTDATAUPDATE_START = 2
    local FRAME_NET_UPDATE_POSTDATAUPDATE_END = 3
    local FRAME_NET_UPDATE_END = 4
    local FRAME_RENDER_START = 5
    local FRAME_RENDER_END = 6

    function ultimate.PreFrameStageNotify( stage )
        local plys = player.GetAll()

        if stage == FRAME_NET_UPDATE_POSTDATAUPDATE_END then

            ultimate.entTableUpdate()

            plys = player.GetAll()

            local orig = pLocalPlayer:GetNetworkOrigin()

            local data = {}

            data[1] = orig      // last networked origin

            ultimate.FillLocalNetworkData( data )

            for i = 1, #plys do
                local v = plys[i]

                //if !v.ult_prev_pos then continue end

                local cur_simtime = ded.GetSimulationTime(v:EntIndex())
                local cur_pos = v:GetNetworkOrigin()

                //v.ult_cur_pos = cur_pos

                if not v.ult_prev_simtime then
                    v.ult_prev_simtime = cur_simtime
                    v.ult_prev_pos = cur_pos
                    // v.ult_prev_hitbox_pos = cur_pos
                    v.flticks = 0
                    v.missedanimticks = 0
                    v.simtime_updated = false 
                    v.break_lc = false

                    ultimate.btrecords[ v ] = {}
                    ultimate.predicted[ v ] = {}

                    v.aimshots = 0
                    v.fakepitch = v:EyeAngles().p > 90

                elseif v.ult_prev_simtime != cur_simtime then
                    local flticks = ultimate.TIME_TO_TICKS(cur_simtime-v.ult_prev_simtime)

                    // print(v,flticks )

                    ded.SetMissedTicks( flticks )
                    ded.AllowAnimationUpdate( true )

                    v.flticks = math.Clamp(flticks,1,24)

                    v.ult_prev_simtime = cur_simtime

                    v.break_lc = cur_pos:DistToSqr(v.ult_prev_pos) > 4096

                    //if v.ult_prev_pos != v.ult_cur_pos then
                    v.ult_prev_pos = cur_pos

                    // v.ult_prev_hitbox_pos = ultimate.getHitbox(v)
                    //end 
                    v.fakepitch = v:EyeAngles().p > 90

                    v.simtime_updated = true
                else
                    v.simtime_updated = false
                end

                if ultimate.canBacktrack(v) and v != pLocalPlayer and v.simtime_updated then
                    ultimate.recordBacktrack(v)
                end

                if v.break_lc then
                    ultimate.btrecords[ v ] = {}
                end
                
                /*
                if ultimate.cfg and ultimate.cfg.vars["Extrapolation"] then
                    for _, v in ipairs(player.GetAll()) do
                        if v == pLocalPlayer then continue end
                        if not IsValid(v) or v:Health() <= 0 or v:IsDormant() then continue end

                        local entIndex = v:EntIndex()
                        if not entIndex or entIndex <= 0 then continue end

                        local origin = v.GetNetworkOrigin and v:GetNetworkOrigin()
                        local velocity = v.GetVelocity and v:GetVelocity()
                        local simTime = v.GetSimulationTime and v:GetSimulationTime()

                        if not (origin and velocity and simTime) then continue end

                        local latency = 0.1
                        if ded and ded.GetLatency then
                            latency = math.max(0.01, (ded:GetLatency(0) or 0) + (ded:GetLatency(1) or 0))
                        end

                        local extrapMultiplier = 1.5
                        local predictionTime = latency * extrapMultiplier

                        local curTime = CurTime()

                        ultimate._simdata = ultimate._simdata or {}
                        local data = ultimate._simdata[v] or {
                            simtime = simTime,
                            pos = origin,
                            vel = velocity,
                            time = curTime
                        }

                        local predictedPos

                        if simTime > data.simtime then
                            local delta = simTime - data.simtime
                            local accel = (velocity - (data.vel or velocity)) / math.max(delta, 0.001)
                            local futureVel = velocity + accel * predictionTime
                            local gravity = Vector(0, 0, -600)
                            local gravVec = gravity * predictionTime * predictionTime * 0.5

                            predictedPos = origin + futureVel * predictionTime + gravVec

                            data.simtime = simTime
                            data.pos = origin
                            data.vel = velocity
                        else
                            local delta = curTime - data.time
                            local accel = (velocity - (data.vel or velocity)) / math.max(delta, 0.001)
                            local predVel = (data.vel or velocity) + accel * predictionTime
                            local gravVec = Vector(0, 0, -600) * predictionTime * predictionTime * 0.5

                            predictedPos = data.pos + predVel * predictionTime + gravVec
                        end

                        data.time = curTime
                        ultimate._simdata[v] = data

                        ultimate.predicted_last = ultimate.predicted_last or {}
                        local prev = ultimate.predicted_last[v] or origin
                        local lerpFrac = math.Clamp(FrameTime() * 16, 0, 1)
                        local smooth = LerpVector(lerpFrac, prev, predictedPos)

                        if v.SetRenderOrigin then
                            v:SetRenderOrigin(smooth)
                        end

                        if v.InvalidateBoneCache then v:InvalidateBoneCache() end
                        if v.SetupBones then v:SetupBones() end

                        local bones = ultimate.GetBones and ultimate.GetBones(v)
                        local hitPos = bones and bones[1] or smooth

                        ultimate.predicted = ultimate.predicted or {}
                        ultimate.predicted[v] = {
                            pos = hitPos,
                            tick = ultimate.TIME_TO_TICKS and ultimate.TIME_TO_TICKS(curTime + predictionTime) or 0,
                            vel = velocity
                        }

                        if v.SetupBones and v.GetBoneMatrix then
                            local boneData = {}
                            v:SetupBones()
                            for i = 0, v:GetBoneCount() - 1 do
                                local mat = v:GetBoneMatrix(i)
                                if mat then
                                    boneData[i] = {
                                        pos = mat:GetTranslation(),
                                        ang = mat:GetAngles()
                                    }
                                end
                            end
                            ultimate.predicted[v].bones = boneData
                        end

                        ultimate.predicted_last[v] = predictedPos
                    end
                end
                */

                if ultimate.cfg.vars["Extrapolation"] and v and v:IsValid() and v ~= LocalPlayer() then
                    local latency_in = ded.GetLatency and ded.GetLatency(0) or 0
                    local latency_out = ded.GetLatency and ded.GetLatency(1) or 0
                    local interp = GetConVar("cl_interp") and GetConVar("cl_interp"):GetFloat() or 0.015
                    local interp_ratio = GetConVar("cl_interp_ratio") and GetConVar("cl_interp_ratio"):GetFloat() or 1
                    local update_rate = GetConVar("cl_updaterate") and GetConVar("cl_updaterate"):GetFloat() or 66
                    local tick_rate = GetConVar("sv_fps") and GetConVar("sv_fps"):GetFloat() or 66
                    local tick_interval = 1 / tick_rate
                    local actual_interp = math.max(interp, interp_ratio / update_rate)
                    local localPlayer = LocalPlayer()

                    local dist = localPlayer and localPlayer:IsValid() and isvector(localPlayer:EyePos()) and v:GetNetworkOrigin() and localPlayer:EyePos():Distance(v:GetNetworkOrigin()) or 0
                    local predTime = dist > 1000 and math.min(latency_in + latency_out + actual_interp, 0.05) or math.min(latency_in + latency_out + actual_interp, 0.08)

                    local targetPos = v:GetNetworkOrigin() or v:GetPos() or Vector(0, 0, 0)
                    local targetVel = v:GetVelocity() or Vector(0, 0, 0)
                    if not isvector(targetPos) or not isvector(targetVel) then
                        v:SetRenderOrigin(targetPos)
                        return
                    end

                    v.extrapData = v.extrapData or {
                        positions = {},
                        velocities = {},
                        fakeLagLevel = 0,
                        lastUpdate = 0,
                        avgAccel = Vector(0, 0, 0),
                        hitAdjustment = Vector(0, 0, 0)
                    }

                    local data = v.extrapData
                    local curTime = CurTime()

                    table.insert(data.positions, targetPos)
                    table.insert(data.velocities, targetVel)
                    if #data.positions > 15 then table.remove(data.positions, 1) end
                    if #data.velocities > 15 then table.remove(data.velocities, 1) end

                    local predictedPos = targetPos
                    local isOnGround = v:IsOnGround() or false

                    if #data.positions >= 5 then
                        local pos1 = data.positions[#data.positions]
                        local pos2 = data.positions[#data.positions - 1]
                        local vel1 = data.velocities[#data.velocities]
                        local vel2 = data.velocities[#data.velocities - 1]

                        local deltaTime = math.max(curTime - data.lastUpdate, 0.001)
                        local accel = (vel1 - vel2) / deltaTime
                        data.avgAccel = (data.avgAccel * 0.9) + (accel * 0.1)

                        local speedDiff = (vel1 - vel2):Length()
                        if speedDiff > 400 or accel:Length() > 1200 or (pos1 - pos2):Length() > 500 then
                            data.fakeLagLevel = math.min(data.fakeLagLevel + 0.2, 1)
                        else
                            data.fakeLagLevel = math.max(data.fakeLagLevel - 0.2, 0)
                        end

                        if data.fakeLagLevel > 0.6 then
                            local avgVel = Vector(0, 0, 0)
                            local count = 0
                            for i = math.max(1, #data.velocities - 8), #data.velocities do
                                avgVel = avgVel + data.velocities[i]
                                count = count + 1
                            end
                            avgVel = count > 0 and avgVel / count or targetVel
                            local compensation = 0.5 + (data.fakeLagLevel * 0.5)
                            predictedPos = targetPos + (avgVel * compensation + targetVel * (1 - compensation)) * predTime
                        else
                            predictedPos = targetPos + targetVel * predTime + 0.5 * data.avgAccel * predTime * predTime
                        end

                        if localPlayer and localPlayer:IsValid() then
                            local eyePos = localPlayer:EyePos()
                            if isvector(eyePos) then
                                local aimDir = (predictedPos - eyePos):GetNormalized()
                                local adjustmentFactor = dist > 1000 and 0.02 or 0.05
                                local adjustment = (predictedPos - (eyePos + aimDir * dist)) * adjustmentFactor
                                data.hitAdjustment = (data.hitAdjustment * 0.95) + (adjustment * 0.05)
                                predictedPos = predictedPos - data.hitAdjustment

                                if dist > 1000 then
                                    local bulletSpeed = 2500
                                    local travelTime = dist / bulletSpeed
                                    predictedPos = predictedPos + targetVel * travelTime
                                end
                            end
                        end
                    else
                        predictedPos = targetPos + targetVel * predTime
                    end

                    if not isOnGround then
                        local gravity = 800 * tick_interval
                        predictedPos.z = predictedPos.z - 0.5 * gravity * predTime * predTime
                    else
                        targetVel = targetVel * 0.85
                    end

                    local trace = util.TraceHull({
                        start = targetPos,
                        endpos = predictedPos,
                        mins = v:OBBMins() or Vector(-16, -16, 0),
                        maxs = v:OBBMaxs() or Vector(16, 16, 72),
                        filter = v,
                        mask = MASK_PLAYERSOLID
                    })
                    if trace and trace.Hit and trace.Fraction < 1 then
                        predictedPos = LerpVector(trace.Fraction * 0.95, targetPos, predictedPos)
                    end

                    local contents = util.PointContents(predictedPos)
                    if bit.band(contents, CONTENTS_SOLID) ~= 0 or predictedPos.z < -6000 or predictedPos.z > 10000 then
                        predictedPos = targetPos
                    end

                    data.lastUpdate = curTime
                    v:SetRenderOrigin(predictedPos)

                    if ultimate and ultimate.predicted then
                        ultimate.predicted[v] = {
                            pos = predictedPos + Vector(0, 0, 40),
                            originalPos = targetPos,
                            velocity = targetVel,
                            tick = math.floor(curTime / tick_interval),
                            confidence = math.Clamp(1 - data.fakeLagLevel, 0.7, 1),
                            valid = trace and trace.Fraction >= 1 and (predictedPos - targetPos):Length() < 200,
                            distance = dist,
                            lastUpdate = curTime,
                            health = v:Health() or 100,
                            isOnGround = isOnGround,
                            speed = targetVel:Length(),
                            latency = predTime
                        }
                    end
                else
                    if v and v:IsValid() then
                        v:SetRenderOrigin(v:GetNetworkOrigin() or v:GetPos() or Vector(0, 0, 0))
                    end
                end
            end    
        elseif stage == FRAME_RENDER_START then
            plys = player.GetAll()

            for i = 1, #plys do
                local v = plys[i]

                if v == pLocalPlayer then continue end
            end
        end
    end
end

    
function ultimate.PostFrameStageNotify( stage ) 
    if stage == 3 then
        ultimate.playerDataUpdate()

        /*local playerlist = player.GetAll()

        for i = 1, #playerlist do
            local pEntity = playerlist[ i ]

            local iEntIndex = pEntity:EntIndex()
            local pTable = pEntity:GetTable()

            -- Simulation time 
            local flSimulationTime = ded.GetSimulationTime( iEntIndex )

            pTable.iChokedCommands = Utility.TimeToTicks( flSimulationTime - pTable.flSimulationTime )
            pTable.bIsSimulated = flSimulationTime ~= pTable.flSimulationTime
            pTable.flSimulationTime = flSimulationTime    
        end*/
    end
end

/*
    hooks -> ShouldUpdateAnimation ( cpp )
*/

ultimate.fakeAngles = {
    angle = pLocalPlayer:EyeAngles(),
    movex = 0,
    movey = 0,
    layers = {},
    seq = 0,
    cycle = 0,
    origin = pLocalPlayer:GetPos(),
}

function ultimate.UpdateAnimation( v )
    v:InvalidateBoneCache()
end

function ultimate.ShouldUpdateAnimation( entIndex ) 
    local ent = Entity( entIndex )

    if not ent.simtime_updated then return end

    ded.SetMissedTicks( ent.flticks )
    ded.AllowAnimationUpdate( true )
end

// AA shit
ultimate.realModel = ultimate.CS_Model( pLocalPlayer:GetModel() )
ultimate.fakeModel = ultimate.CS_Model( pLocalPlayer:GetModel() )

ultimate.newModel = pLocalPlayer:GetModel()

function ultimate.drawCSModels_real()
    if not ultimate.cfg.vars["Anti aim chams"] or not ultimate.tpenabled then 
        return 
    end 
    if not pLocalPlayer:Alive() then 
        return 
    end

    local mymodel = pLocalPlayer:GetModel()

    if ultimate.newModel != mymodel then
        ultimate.CS_Model( mymodel )
        ultimate.newModel = mymodel
    end

    local tbl = {
        layers = ultimate.fakeAngles.layers,
        angles = ultimate.fakeAngles.angle,
        sequence = ultimate.fakeAngles.seq,
        cycle = ultimate.fakeAngles.cycle,
        origin = ultimate.fakeAngles.origin,
        movex = ultimate.fakeAngles.movex,
        movey = ultimate.fakeAngles.movey,
    }

    ultimate.CS_Model_update( pLocalPlayer, ultimate.realModel, tbl )

    if ultimate.cfg.vars["Antiaim fullbright"] then
        render.SuppressEngineLighting(true)
    end

    local col = string.ToColor(ultimate.cfg.colors["Real chams"])
    ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render.MaterialOverride(ultimate.chamMats.invis[ultimate.cfg.vars["Antiaim material"]]) 
    render.SetColorModulation(col.r/255,col.g/255,col.b/255)
    render.SetBlend(col.a/255) 
    ultimate.realModel:SetRenderMode(1)
    ultimate.realModel:DrawModel()

    if ultimate.cfg.vars["Antiaim fullbright"] then
        render.SuppressEngineLighting(false)
    end
end


/*
    hooks -> PostDrawEffects
*/
do
    /*
            

    */

    local CopyMat		= Material("pp/copy")
    local AddMat		= Material( "pp/add" )
    local SubMat	= Material( "pp/sub" )
    local OutlineMat	= CreateMaterial("OutlineMat","UnlitGeneric",{["$ignorez"] = 1,["$alphatest"] = 1})

    local outline_mats = {
        [1] = OutlineMat,
        [2] = SubMat,
        [3] = AddMat,
        [4] = GradMat,
        [5] = BloomMat,
    }

    local subclear = {
        [2] = true,
        //[4] = true,
    }
    
    ultimate.cfg.vars["Player outline"] = false
    ultimate.cfg.vars["Entity outline"] = false
    ultimate.cfg.colors["Player outline"] = "45 255 86 255"
    ultimate.cfg.colors["Entity outline"] = "255 86 45 255"

    local StoreTexture	= render.GetScreenEffectTexture(0)
    local DrawTexture	= render.GetScreenEffectTexture(1)

    function ultimate.RenderOutline()
        local renderEnts = {}

        if ultimate.cfg.vars["Player outline"] then
            local plys = player.GetAll()

            for i = 1, #plys do 
                local v = plys[ i ]

                if not IsValid( v ) or v == pLocalPlayer or not v:Alive() or (v:IsDormant() and not ultimate.cfg.vars["Dormant ESP"]) then continue end

                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if ultimate.cfg.vars["Entity outline"] then
            for i = 1, #ultimate.entityCache do
                local v = ultimate.entityCache[ i ].entity 

                if not IsValid( v ) or (v:IsDormant() and not ultimate.cfg.vars["Dormant ESP"]) then continue end
        
                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if #renderEnts == 0 then return end

        local scene = render.GetRenderTarget()
        render.CopyRenderTargetToTexture(StoreTexture)
        
        if subclear[ ultimate.cfg.vars["Outline style"] ] then
            render.Clear( 255, 255, 255, 255, true, true )
        else
            render.Clear( 0, 0, 0, 0, true, true )
        end

        render.SetStencilEnable(true)
            cam.IgnoreZ(true)
            render.SuppressEngineLighting(true)
        
            render.SetStencilWriteMask(255)
            render.SetStencilTestMask(255)
            
            render.SetStencilCompareFunction(STENCIL_ALWAYS)
            render.SetStencilFailOperation(STENCIL_KEEP)
            render.SetStencilZFailOperation(STENCIL_REPLACE)
            render.SetStencilPassOperation(STENCIL_REPLACE)
            
            cam.Start3D()
                for i = 1, #renderEnts do 
                    render.SetStencilReferenceValue( i )

                    renderEnts[i]:DrawModel()
                end
            cam.End3D()
            
            render.SetStencilCompareFunction(STENCIL_EQUAL)
            
            cam.Start2D()
                for i = 1, #renderEnts do 
                    local c = renderEnts[i]:IsPlayer() and string.ToColor( ultimate.cfg.colors["Player outline"] ) or string.ToColor( ultimate.cfg.colors["Entity outline"] ) 

				    render.SetStencilReferenceValue( i )

                    surface.SetDrawColor( c )
                    surface.DrawRect( 0, 0, screenWidth, screenHeight )

                    // surface_SimpleTexturedRect( 0, 0, screenWidth, screenHeight, string.ToColor( ultimate.cfg.colors["Health bar gradient"] ) , ultimate.Materials["Gradient"] )
                end
            cam.End2D()
            
            render.SuppressEngineLighting(false)
            cam.IgnoreZ(false)
        render.SetStencilEnable(false)
        
        render.CopyRenderTargetToTexture(DrawTexture)

        if ultimate.cfg.vars["Outline style"] > 1 then 
            render.BlurRenderTarget( DrawTexture, 1, 1, 1 )
        end

        render.SetRenderTarget(scene)
        CopyMat:SetTexture("$basetexture",StoreTexture)
        render.SetMaterial(CopyMat)
        render.DrawScreenQuad()
        
        render.SetStencilEnable(true)
            render.SetStencilReferenceValue(0)
            render.SetStencilCompareFunction(STENCIL_EQUAL)
            
            local mat = outline_mats[ ultimate.cfg.vars["Outline style"] ]

            mat:SetTexture( "$basetexture", DrawTexture )
            render.SetMaterial( mat )
            
            for x=-1,1 do
                for y=-1,1 do
                    if x==0 and x==0 then continue end
                    
                    render.DrawScreenQuadEx(x,y,screenWidth,screenHeight)
                end
            end
        render.SetStencilEnable(false)
    end
end

hook.Add("PrePlayerDraw",  "WIP", function()
	for k, v in ipairs(player.GetAll()) do
        if ultimate.cfg.vars["Modelchanger"] then
            LocalPlayer():InvalidateBoneCache()
			LocalPlayer():SetSequence(LocalPlayer():GetSequence())
            local state = LocalPlayer():GetPredictable()
            LocalPlayer():SetPredictable(not state)
            LocalPlayer():SetPredictable(state)
            if ultimate.cfg.vars["Modelchanger model"] == 1 then
                LocalPlayer():SetModel("models/cyanblue/fate_extella_link/astolfo/astolfo.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 2 then
                LocalPlayer():SetModel("models/squids_pms/ocs/xani_protogen/xani_pm.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 3 then
                LocalPlayer():SetModel("models/walter/playermodels/walter.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 4 then
                LocalPlayer():SetModel("models/survivors/survivor_mechanic.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 5 then
                LocalPlayer():SetModel("models/ray/nikoo/nikopm.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 6 then
                LocalPlayer():SetModel("models/player/floyd/georgedroyd.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 7 then
                LocalPlayer():SetModel("models/jazzmcfly/bgs/bgs.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 8 then
                LocalPlayer():SetModel("models/boykisser/boykisser.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 9 then   
                LocalPlayer():SetModel("models/adidas_combine/playermodel/adidas_combine.mdl")       
            elseif ultimate.cfg.vars["Modelchanger model"] == 10 then   
                LocalPlayer():SetModel("models/cagatt/cagatt/cagatt.mdl")    
            elseif ultimate.cfg.vars["Modelchanger model"] == 11 then   
                LocalPlayer():SetModel("models/player/darky_m/rust/hazmat.mdl")  
            elseif ultimate.cfg.vars["Modelchanger model"] == 12 then
                LocalPlayer():SetModel("models/creepychimera/haydee_redux/haydee_redux.mdl")      
            elseif ultimate.cfg.vars["Modelchanger model"] == 13 then
                LocalPlayer():SetModel("models/player/csgo/ricksaw/g_st6_varianti.mdl")       
            elseif ultimate.cfg.vars["Modelchanger model"] == 14 then
                LocalPlayer():SetModel("models/csgosas3pm.mdl") 
            elseif ultimate.cfg.vars["Modelchanger model"] == 15 then
                LocalPlayer():SetModel("models/csgoanarchist4pm.mdl")    
            elseif ultimate.cfg.vars["Modelchanger model"] == 16 then
                LocalPlayer():SetModel("models/player/arctic.mdl")  
            elseif ultimate.cfg.vars["Modelchanger model"] == 17 then
                LocalPlayer():SetModel("models/player/team/fortress/acres_heavy_pm.mdl") 
            elseif ultimate.cfg.vars["Modelchanger model"] == 18 then
                LocalPlayer():SetModel("models/player/team/fortress/acres_spy_pm.mdl") 
            end
            LocalPlayer():SetupBones()
        end
    end	
end)
function ultimate.PostDrawEffects()
    if ultimate.UnSafeFrame then return end
    if not ultimate.cfg.vars["Player outline"] and not ultimate.cfg.vars["Entity outline"] then return end

    ultimate.RenderOutline()
end
    
function ultimate.AdjustMouseSensitivity( defaultSensivity )
    return ultimate.cfg.vars["Disable sensivity adjustment"] and 0 or nil
end

ultimate.fbe = false

function ultimate.PreRender()
    if ultimate.cfg.vars["Fullbright"] and ultimate.fbe then
        render.SetLightingMode( ultimate.cfg.vars["Fullbright mode"] )
    end
end

function ultimate.GetMotionBlurValues()
    render.SetLightingMode( 0 )
end

ded.ConVarSetFlags( "mat_fullbright", 0 )
ded.ConVarSetFlags( "r_aspectratio", 0 )
ded.ConVarSetFlags( "cl_showhitboxes", 0 )

function GAMEMODE:CreateMove( cmd ) return true end
function GAMEMODE:CalcView( view )  return true end
function GAMEMODE:ShouldDrawLocal() return true end

GAMEMODE["EntityFireBullets"] = function( self, p, data ) 
    if not ultimate.activeWeapon then return end

    local tick = engine.TickCount()
    if ultimate.cfg.vars[ "On screen logs" ] and data.Src == pLocalPlayer:EyePos() and ultimate.aimingrn and ultimate.target and not ultimate.onScreenLogs[ tick ] and IsFirstTimePredicted() then
        local reason = 1
        
        local tr = {}
        tr.filter = pLocalPlayer 
        tr.start = data.Src 
        tr.endpos = data.Src + data.Dir * 13337
        tr.mask = MASK_SHOT

        tr = TraceLine( tr )

        if ultimate.target.break_lc then
            reason = 4
        elseif ded.GetLatency( 0 ) > 0.2 then
            reason = 3
        elseif tr.StartSolid or tr.Hit and tr.Entity != ultimate.target then
            reason = 2
        end
        
        local hlcolor = string.ToColor( ultimate.cfg.colors[ ultimate.MissReasons[ reason ].var ] )
        local data = {
            tick = tick,
            { "Shot at ", ultimate.target:Name(), " missed due to ", ultimate.MissReasons[ reason ].str, },
            { ultimate.HitLogsWhite, hlcolor, ultimate.HitLogsWhite, hlcolor, }
        }
            
        ultimate.onScreenLogs[ tick ] = data
    end
 
    local spread = data.Spread * -1
    
	if ultimate.cones[ ultimate.activeWeaponClass ] == spread or spread == ultimate.nullVec then return end

    ultimate.cones[ ultimate.activeWeaponClass ] = spread;
end

local playerTrail = {}

local function UpdatePlayerTrail()
    local ply = LocalPlayer()

    if ply:IsValid() then
        if ply:Alive() then
            table.insert(playerTrail, ply:GetPos())

            while #playerTrail > 100 do
                table.remove(playerTrail, 1)
            end
        else
            playerTrail = {}
        end
    end
end

hook.Add("Think", "UpdatePlayerTrail", UpdatePlayerTrail)

local function DrawPlayerTrail()
    if ultimate.cfg.vars["Player Line"] then
        for i = 1, #playerTrail - 1 do
            local startPos = playerTrail[i] + Vector(0, 0, 10)
            local endPos = playerTrail[i + 1] + Vector(0, 0, 10)

            local t = i / #playerTrail

            local hue = Lerp(t, 300, 0)
            local color = HSVToColor(hue, 1, 1)

            render.DrawLine(startPos, endPos, color, true)
        end
    end
end

hook.Add("PostDrawTranslucentRenderables", "DrawPlayerTrail", DrawPlayerTrail)

local trailToggleCooldown = 0

hook.Add("Think", "Ultimate_TrailRemoveKey", function()
    if input.IsKeyDown(KEY_END) and CurTime() > trailToggleCooldown then
        hook.Remove("Think", "UpdatePlayerTrail")
        hook.Remove("PostDrawTranslucentRenderables", "DrawPlayerTrail")
        hook.Remove("Think", "Ultimate_TrailRemoveKey")
        trailToggleCooldown = CurTime() + 0.5
    end
end)

--[[
    --rgb лента блять аххахаха
local function DrawPlayerTrail()

    if ultimate.cfg.vars["test"] then

        for i = 1, #playerTrail - 1 do
            local startPos = playerTrail[i] + Vector(0, 0, 10)
            local endPos = playerTrail[i + 1] + Vector(0, 0, 10)

            local color = Color(math.random(0, 255), math.random(0, 255), math.random(0, 255))

            render.DrawLine(startPos, endPos, color, true)
        end
    end
end
--]]


gameevent.Listen("entity_killed")
local skokubil = 0
hook.Add("entity_killed", "killeventss", function(data)

    if ultimate.cfg.vars["Kill effect"] then
        local victim = Entity(data.entindex_killed)
        local attacker = Entity(data.entindex_attacker)

        if attacker == LocalPlayer() and attacker ~= victim and (victim:IsPlayer() or victim:IsBot()) then 

            do
                local vPoint = LocalPlayer():GetPos()
                local effectdata = EffectData()
                effectdata:SetOrigin(vPoint)
                effectdata:SetStart(vPoint)
                util.Effect("VortDispel", effectdata)
            end

            do
                local vpos = victim:GetPos()
                local effectdata = EffectData()
                if victim:LookupBone("ValveBiped.Bip01_Head1") == nil then
                    effectdata:SetOrigin(vpos)
                else
                    effectdata:SetOrigin(victim:GetBonePosition(victim:LookupBone("ValveBiped.Bip01_Head1")))
                end
                effectdata:SetMagnitude(5)
                effectdata:SetScale(3)
                util.Effect("ElectricSpark", effectdata)
            end
        end
    end

    if ultimate.cfg.vars.localkillfeed then
        local victim = Entity(data.entindex_killed)
        local attacker = Entity(data.entindex_attacker)

        if not IsValid(victim) or not IsValid(attacker) then return end
        if not me or not me:IsValid() then return end

        if attacker == me and victim ~= me and (victim:IsPlayer() or victim:IsBot()) then
            skokubil = skokubil + 1
            chat.AddText(Color(0, 0, 0), "[Killfeed] ", Color(255, 0, 0), "You killed ",
                Color(255, 255, 255), victim:Name(), Color(255, 255, 255), "")
        end

        if victim == me and attacker ~= me and (attacker:IsPlayer() or attacker:IsBot()) then
            chat.AddText(Color(0, 0, 0), "[Killfeed] ", Color(255, 0, 0), attacker:Name(),
                Color(255, 255, 255), " killed you")
        end
    end 
end)




function ultimate.SetupWorldFog()
    if not ultimate.cfg.vars[ "FogChanger" ] then return end 

    local color = string.ToColor(ultimate.cfg.colors["FogChanger"])
    

    render.FogMode( MATERIAL_FOG_LINEAR )
    render.FogColor( color.r, color.g, color.b )
    render.FogStart( ultimate.cfg.vars[ "FogStart" ] )
    render.FogEnd( ultimate.cfg.vars[ "FogEnd" ] ) 
    render.FogMaxDensity( color.a / 255 )
    
    return true 
end

function ultimate.SetupSkyboxFog( SkyboxSize )
    if not ultimate.cfg.vars[ "FogChanger" ] then return end 

    local color = string.ToColor(ultimate.cfg.colors["FogChanger"])

    render.FogMode( MATERIAL_FOG_LINEAR )
    render.FogColor( color.r, color.g, color.b )
    render.FogStart( ultimate.cfg.vars[ "FogStart" ] * SkyboxSize )
    render.FogEnd( ultimate.cfg.vars[ "FogEnd" ] * SkyboxSize ) 
    render.FogMaxDensity( color.a / 255 )
    
    return true 
end

function ultimate.CalcMainActivity(ply, velocity)
    if ultimate.cfg.vars["TPOSE"] and ply ~= LocalPlayer() and not ultimate.cfg.friends[ply:SteamID()] then
        return -1, -1
    end
end

function ultimate.PrintHitLog(victim, attacker, damage)
    local localPlayer = LocalPlayer()

    if attacker == localPlayer then
        chat.AddText(
            Color(255, 0, 0), "[Hit Log] ",
            Color(255, 255, 255), "Hit ",
            Color(255, 0, 0), victim:Name(),
            Color(255, 255, 255), " at ",
            Color(255, 255, 255), tostring(damage),
            Color(255, 255, 255), "!"
        )
    elseif victim == localPlayer then
        chat.AddText(
            Color(255, 0, 0), "[Hit Log] ",
            Color(255, 0, 0), attacker:Name(),
            Color(255, 255, 255), " hitted you at ",
            Color(255, 255, 255), tostring(damage),
            Color(255, 255, 255), "!"
        )
    end
end

function ultimate.DrawFakeModelHitboxes()
    if not ultimate.cfg.vars["Hitbox"] then return end
    if not IsValid(ultimate.fakeModel) then return end
    if not pLocalPlayer:Alive() then return end
    if ultimate.hideHitboxes then return end 
    if not pLocalPlayer:ShouldDrawLocalPlayer() then return end
    
    local mymodel = pLocalPlayer:GetModel()
    if ultimate.newModel != mymodel then
        ultimate.fakeModel = ultimate.CS_Model(mymodel)
        ultimate.newModel = mymodel
    end

    local tbl = {
        layers = ultimate.fakeAngles.layers,
        angles = ultimate.fakeAngles.angle,
        sequence = ultimate.fakeAngles.seq,
        cycle = ultimate.fakeAngles.cycle,
        origin = ultimate.fakeAngles.origin,
        movex = ultimate.fakeAngles.movex,
        movey = ultimate.fakeAngles.movey,
    }
    ultimate.CS_Model_update(pLocalPlayer, ultimate.fakeModel, tbl)

    if ultimate.fakeModel:GetHitBoxGroupCount() != nil then
        cam.Start3D(EyePos(), EyeAngles())
            for group = 0, ultimate.fakeModel:GetHitBoxGroupCount() - 1 do 
                for hitbox = 0, ultimate.fakeModel:GetHitBoxCount(group) - 1 do
                    local bone = ultimate.fakeModel:GetHitBoxBone(hitbox, group)
                    if not bone then continue end
                    
                    local pos, ang = ultimate.fakeModel:GetBonePosition(bone)
                    if not pos then continue end
                    
                    local mins, maxs = ultimate.fakeModel:GetHitBoxBounds(hitbox, group)
                    render.DrawWireframeBox(
                        pos, 
                        ang, 
                        mins, 
                        maxs, 
                        string.ToColor(ultimate.cfg.colors["Hitbox"]), 
                        true
                    )
                end
            end
        cam.End3D()
    end
end

function initialize_player_data(entIndex)
    ultimate.player_data = ultimate.player_data or {}
    ultimate.player_data[entIndex] = ultimate.player_data[entIndex] or {
        last_angles = {},
        brute_stage = 0,
        shots_fired = 0,
        last_lby = 0
    }
end

function ultimate.TryPredict(cmd, ang)
    local ply = pLocalPlayer
    local weapon = ultimate.activeWeapon
    if not IsValid(ply) or not IsValid(weapon) then return ang end

    local shootPos = ply:GetShootPos()
    local bestTarget, bestDelta, bestAim = nil, math.huge, nil

    local bulletSpeed = weapon.BulletSpeed or weapon.speed or (weapon.Primary and weapon.Primary.BulletSpeed) or 9999
    local gravity = weapon.BulletGravity or weapon.gravity or (weapon.Primary and weapon.Primary.BulletGravity) or 600
    local isHitscan = bulletSpeed >= 9000
    local ping = (ply.Ping and ply:Ping() or 0) / 1000

    local hitboxBone
    local hitboxSelect = ultimate.cfg.vars["Hitbox selection"] or 1
    if hitboxSelect == 1 then hitboxBone = "ValveBiped.Bip01_Head1"
    elseif hitboxSelect == 2 then hitboxBone = "ValveBiped.Bip01_Spine2"
    elseif hitboxSelect == 3 then hitboxBone = "ValveBiped.Bip01_Pelvis"
    else hitboxBone = "ValveBiped.Bip01_Head1" end

    local entities = {}
    for _, v in ipairs(player.GetAll()) do
        if v ~= ply and v:Alive() and v:Team() ~= ply:Team() and not v:IsDormant() then
            table.insert(entities, v)
        end
    end

    for _, v in ipairs(entities) do
        local bone = v:LookupBone(hitboxBone) or 0
        local pos = v.GetBonePosition and v:GetBonePosition(bone) or v:EyePos()
        local vel = v.GetVelocity and v:GetVelocity() or Vector(0,0,0)

        v.lastVel = v.lastVel or vel
        local accel = (vel - v.lastVel) / math.max(FrameTime(), 0.01)
        v.lastVel = vel

        local dist = shootPos:Distance(pos)
        local flightTime = isHitscan and 0 or dist / bulletSpeed

        local totalTime = ping + flightTime
        local predictedPos = pos + vel * totalTime + 0.5 * accel * (totalTime ^ 2)
        if not isHitscan then
            predictedPos = predictedPos - Vector(0, 0, 0.5 * gravity * (flightTime ^ 2))
        end

        if v.lastPredPos then
            predictedPos = LerpVector(0.8, v.lastPredPos, predictedPos)
        end
        v.lastPredPos = predictedPos

        local steps = math.max(5, math.floor(dist / 200))
        local stepTime = flightTime / steps
        local prevPos = shootPos
        for i = 1, steps do
            local t = stepTime * i
            local stepPos = pos + vel * (ping + t) + 0.5 * accel * ((ping + t) ^ 2)
            if not isHitscan then
                stepPos = stepPos - Vector(0, 0, 0.5 * gravity * (t ^ 2))
            end

            prevPos = stepPos
        end

        local tr = util.TraceLine({
            start = shootPos,
            endpos = predictedPos,
            filter = ply
        })
        if tr.Hit and tr.Entity ~= v then
            predictedPos = tr.HitPos
        end

        local aimAng = (predictedPos - shootPos):Angle()
        aimAng:Normalize()
        local delta = math.abs(math.AngleDifference(ang.yaw, aimAng.yaw)) +
                      math.abs(math.AngleDifference(ang.pitch, aimAng.pitch))

        if delta < bestDelta then
            bestTarget, bestDelta, bestAim = v, delta, aimAng
        end
    end

    if bestTarget and bestAim then
        ang = bestAim
    end

    return ang
end

-- Custom Predict - предсказание на основе скорости противника
function ultimate.CustomPredict(cmd, ang)
    if not ultimate.cfg.vars["Custom predict"] then return ang end
    if not ultimate.target or not IsValid(ultimate.target) then return ang end
    
    local ply = ultimate.target
    local weapon = ultimate.activeWeapon
    if not IsValid(weapon) then return ang end
    
    -- Получаем скорость полета снаряда
    local projectileSpeed = 3500 -- скорость по умолчанию для арбалета
    
    -- Пытаемся определить реальную скорость оружия
    if weapon.BulletSpeed then
        projectileSpeed = weapon.BulletSpeed
    elseif weapon.Primary and weapon.Primary.BulletSpeed then
        projectileSpeed = weapon.Primary.BulletSpeed
    elseif weapon.Velocity then
        projectileSpeed = weapon.Velocity
    elseif weapon:GetClass() == "weapon_crossbow" then
        projectileSpeed = 3500
    elseif weapon:GetClass() == "weapon_rpg" then
        projectileSpeed = 1800
    elseif weapon:GetClass() == "weapon_physcannon" then
        projectileSpeed = 2500
    end
    
    -- Получаем позиции
    local myPos = pLocalPlayer:EyePos()
    local targetPos = ply:EyePos()
    local targetVel = ply:GetVelocity()
    local distance = myPos:Distance(targetPos)
    
    -- Сила предикта (из слайдера)
    local strength = ultimate.cfg.vars["Custom predict strength"] or 1.0
    
    -- Время полета пули/снаряда
    local flightTime = distance / projectileSpeed
    
    -- Простое предсказание на основе скорости
    local predictedPos = targetPos + targetVel * flightTime * strength
    
    -- Учет гравитации для баллистики (опционально)
    if ultimate.cfg.vars["Custom predict gravity"] then
        local gravity = GetConVar("sv_gravity"):GetFloat() or 600
        local drop = 0.5 * gravity * flightTime * flightTime
        predictedPos.z = predictedPos.z - drop
    end
    
    -- Визуализация для отладки (можно отключить)
    if ultimate.cfg.vars["Custom predict debug"] then
        debugoverlay.Line(myPos, predictedPos, 0.1, Color(255, 0, 255), true)
        debugoverlay.Sphere(predictedPos, 5, 0.1, Color(255, 0, 255), true)
    end
    
    -- Новый угол прицеливания
    local newAng = (predictedPos - myPos):Angle()
    newAng:Normalize()
    
    return newAng
end

hook.Add("PostDrawOpaqueRenderables", "ultimate_DrawFakeHitboxes", ultimate.DrawFakeModelHitboxes)

hook.Add("Think", "Ultimate_HideHitboxesKey", function()
    if input.IsKeyDown(KEY_END) then
        if not ultimate.hideKeyPressed then
            ultimate.hideHitboxes = not ultimate.hideHitboxes
            ultimate.hideKeyPressed = true
        end
    else
        ultimate.hideKeyPressed = false
    end
end)

net.Receive("rp.police.SetLocalHandcuff", function()
    if not ultimate.cfg.vars["Retry on handcuff"] then return end
    
    RunConsoleCommand("retry")
end)

ultimate.HitboxDrawList = ultimate.HitboxDrawList or {}

hook.Add("EntityFireBullets", "Ultimate_CaptureHitboxes", function(attacker, data)
    if not ultimate.cfg.vars["Hitbox on shoot"] then return end
    if not IsValid(attacker) or attacker ~= LocalPlayer() then return end

    local tr = util.TraceLine({
        start = data.Src,
        endpos = data.Src + data.Dir * 4096,
        filter = attacker
    })

    local target = tr.Entity
    if not IsValid(target) or not target:IsPlayer() then return end

    local hitboxes = {}
    local hitboxSet = target:GetHitboxSet()

    for group = 0, target:GetHitBoxGroupCount() - 1 do
        for hitbox = 0, target:GetHitBoxCount(group) - 1 do
            local bone = target:GetHitBoxBone(hitbox, group)
            if not bone then continue end

            local pos, ang = target:GetBonePosition(bone)
            local mins, maxs = target:GetHitBoxBounds(hitbox, group)

            local size = maxs - mins
            if (size.x < 4 and size.y < 4 and size.z < 4) then continue end

            if pos and ang and mins and maxs then
                table.insert(hitboxes, {
                    pos = pos,
                    ang = ang,
                    mins = mins,
                    maxs = maxs
                })
            end
        end
    end

    table.insert(ultimate.HitboxDrawList, {
        time = CurTime(),
        duration = 3,
        boxes = hitboxes
    })
end)




hook.Add("PostDrawTranslucentRenderables", "Ultimate_DrawCapturedHitboxes", function()
    if not ultimate.cfg.vars["Hitbox on shoot"] then return end
    cam.Start3D(EyePos(), EyeAngles())

    local now = CurTime()
    local color = Color(255, 255, 255, 255)

    for i = #ultimate.HitboxDrawList, 1, -1 do
        local data = ultimate.HitboxDrawList[i]

        if now - data.time > data.duration then
            table.remove(ultimate.HitboxDrawList, i)
        else
            for _, box in ipairs(data.boxes) do
                render.DrawWireframeBox(box.pos, box.ang, box.mins, box.maxs, color, true)
            end
        end
    end

    cam.End3D()
end)
hook.Add("PostDrawTranslucentRenderables", "DrawKnifebotRange", function()
    if ultimate.cfg.vars["Knifebot Range"] then
        local ply = LocalPlayer()
        if not IsValid(ply) or not ply:Alive() then return end

        local pelvisBone = ply:LookupBone("ValveBiped.Bip01_Pelvis")
        local centerPos = ply:GetPos() + Vector(0, 0, 15)
        
        if pelvisBone then
            centerPos = ply:GetBonePosition(pelvisBone) or centerPos
        end

        local radius = 48
        local segments = 32
        
        local color = ultimate.cfg.colors and ultimate.cfg.colors["Knifebot Range Color"]
        if not color then
            local time = CurTime() % 1
            color = HSVToColor(time * 360, 1, 1)
        end

        cam.Start3D()
            for i = 1, segments do
                local theta1 = ((i - 1) / segments) * 2 * math.pi
                local theta2 = (i / segments) * 2 * math.pi

                local x1 = math.cos(theta1) * radius
                local y1 = math.sin(theta1) * radius
                local x2 = math.cos(theta2) * radius
                local y2 = math.sin(theta2) * radius

                local pos1 = centerPos + Vector(x1, y1, 0)
                local pos2 = centerPos + Vector(x2, y2, 0)

                render.DrawLine(pos1, pos2, color, false)
            end
        cam.End3D()
    end
end)


hook.Add("Think", "Ultimate_AutoWarn_v2", function()
    if not ultimate.cfg.vars["AutoWarn"] then return end

    ultimate.autoWarn = ultimate.autoWarn or { players = {} }

    for _, ply in ipairs(player.GetAll()) do
        if not IsValid(ply) or not ply:Alive() or ply:IsBot() then continue end

        local now = CurTime()
        local pos = ply:GetPos()
        local vel = ply:GetVelocity():Length2D()
        local ang = ply:EyeAngles()
        local pitch, yaw = ang.p, ang.y
        local eyeTrace = ply:GetEyeTrace()
        local target = eyeTrace.Entity

        local data = ultimate.autoWarn.players[ply] or {
            lastPitch = pitch,
            lastYaw = yaw,
            pitchViolations = 0,
            yawViolations = 0,
            lastPos = pos,
            lastVel = vel,
            posStableTime = now,
            lastJump = 0,
            jumpCount = 0,
            velGrow = 0,
            aimSnaps = 0,
            snapStart = 0,
            flags = {}
        }

        local pitchDelta = math.abs(pitch - data.lastPitch)
        local yawDelta = math.abs(yaw - data.lastYaw)

        if pitch < -88 or pitch > 88 then
            if pitchDelta > 45 then
                data.pitchViolations = data.pitchViolations + 1
            end
        else
            data.pitchViolations = math.max(0, data.pitchViolations - 1)
        end

        if yawDelta > 90 then
            data.yawViolations = data.yawViolations + 1
        else
            data.yawViolations = math.max(0, data.yawViolations - 1)
        end

        if data.pitchViolations >= 5 and not data.flags["antiaim"] then
            chat.AddText(Color(255, 100, 100), "[Auto Warn] "..ply:Nick().." подозревается в использовании anti-aim (pitch violations)")
            data.flags["antiaim"] = true
        end

        if data.yawViolations >= 5 and not data.flags["yaw_desync"] then
            chat.AddText(Color(200, 100, 255), "[Auto Warn] "..ply:Nick().." подозревается в использовании fake yaw / jitter")
            data.flags["yaw_desync"] = true
        end

        data.lastPitch = pitch
        data.lastYaw = yaw

        local dist = pos:Distance(data.lastPos)
        if dist > 5 then
            data.posStableTime = now
        end

        if now - data.posStableTime > 0.6 and dist > 300 and not data.flags["fakelag"] then
            chat.AddText(Color(255, 0, 255), "[Auto Warn] "..ply:Nick().." совершил аномальное перемещение ("..math.Round(dist)..")")
            data.flags["fakelag"] = true
        end

        data.lastPos = pos


        if ply:KeyDown(IN_JUMP) and ply:IsOnGround() then
            local jumpDelta = now - data.lastJump
            data.lastJump = now

            if jumpDelta > 0.07 and jumpDelta < 0.25 then
                data.jumpCount = data.jumpCount + 1
                if vel > data.lastVel then
                    data.velGrow = data.velGrow + 1
                else
                    data.velGrow = 0
                end
            else
                data.jumpCount = 0
                data.velGrow = 0
            end
        end

        if data.jumpCount >= 5 and data.velGrow >= 4 and not data.flags["bhop"] then
            chat.AddText(Color(255, 255, 0), "[Auto Warn] "..ply:Nick().." возможно использует bhop ("..data.jumpCount.." прыжков подряд)")
            data.flags["bhop"] = true
        end

        data.lastVel = vel

        local angleDelta = ang - Angle(data.lastPitch, data.lastYaw, 0)
        local yawSnap = math.abs(angleDelta.y)
        local pitchSnap = math.abs(angleDelta.p)

        if (yawSnap + pitchSnap > 45) and IsValid(target) and target:IsPlayer() then
            if data.snapStart == 0 then
                data.snapStart = now
                data.aimSnaps = 1
            elseif now - data.snapStart < 1 then
                data.aimSnaps = data.aimSnaps + 1
            else
                data.snapStart = now
                data.aimSnaps = 1
            end
        else
            data.aimSnaps = math.max(0, data.aimSnaps - 1)
        end

        if data.aimSnaps >= 3 and not data.flags["aimbot"] then
            chat.AddText(Color(0, 255, 100), "[Auto Warn] "..ply:Nick().." подозревается в использовании аимбота (snap aim)")
            data.flags["aimbot"] = true
        end

        ultimate.autoWarn.players[ply] = data
    end
end)


hook.Add("Think", "UltimateAntiBruteForce", function()
    if not ultimate.cfg.vars["Brute Force"] then return end

    local ply = LocalPlayer()
    if not IsValid(ply) or not ply:Alive() then return end

    local angleDesync = Angle(
        math.Rand(-89, 89),
        math.Rand(-180, 180),
        0
    )

    ply:SetEyeAngles(angleDesync)

    ply:SetRenderAngles(angleDesync)

    for i = 0, ply:GetBoneCount() - 1 do
        local mat = ply:GetBoneMatrix(i)
        if mat then
            local pos = mat:GetTranslation()
            local ang = mat:GetAngles()

            ang:RotateAroundAxis(Vector(0,0,1), math.Rand(-90, 90))
            pos = pos + VectorRand() * 8

            mat:SetTranslation(pos)
            mat:SetAngles(ang)
            ply:SetBoneMatrix(i, mat)
        end
    end
end)



timer.Create("EdgeYawScan", 0.2, 0, function()
    if not ultimate.cfg.vars["Anti aim"] then return end
    if not ultimate.cfg.vars["Edge Aware"] then return end
    if ultimate.cfg.vars["Yaw"] ~= 16 then return end

    local ply = LocalPlayer()
    if not ply:Alive() then return end

    local origin = ply:GetPos() + Vector(0, 0, 5)
    local bestYaw = nil
    local maxFreeFall = 0

    for angle = 0, 359, 15 do
        local rad = math.rad(angle)
        local dir = Vector(math.cos(rad), math.sin(rad), 0)
        local traceStart = origin
        local traceEnd = origin + dir * 60 + Vector(0, 0, -80)

        local tr = util.TraceLine({
            start = traceStart,
            endpos = traceEnd,
            filter = ply
        })

        if not tr.Hit then
            local fallTrace = util.TraceLine({
                start = traceStart + dir * 60,
                endpos = traceStart + dir * 60 + Vector(0, 0, -300),
                filter = ply
            })

            local fallDistance = fallTrace.HitPos:DistToSqr(traceStart + dir * 60)
            if fallDistance > maxFreeFall then
                maxFreeFall = fallDistance
                bestYaw = angle
            end
        end
    end

    if bestYaw then
        ultimate.cfg.vars["Custom fake"] = bestYaw
        ultimate.cfg.vars["Custom real"] = (bestYaw + 180) % 360
    end
end)


local MENU_SNOW_COUNT = 120
local MENU_SNOW_PARTICLES = {}

local function InitMenuSnow()
    MENU_SNOW_PARTICLES = {}
    for i = 1, MENU_SNOW_COUNT do
        MENU_SNOW_PARTICLES[i] = {
            x = math.random(0, ultimate.frame:GetWide()),
            y = math.random(0, ultimate.frame:GetTall()),
            speed = math.Rand(10, 18) / 10,
            size = math.random(2, 5),
            offset = math.Rand(0, 10),
            alpha = math.random(120, 255)
        }
    end
end

local function UpdateMenuSnowBounds()
    for i, flake in ipairs(MENU_SNOW_PARTICLES) do
        if flake.x > ultimate.frame:GetWide() then
            flake.x = math.random(0, ultimate.frame:GetWide())
        end
        if flake.y > ultimate.frame:GetTall() then
            flake.y = math.random(0, ultimate.frame:GetTall())
        end
    end
end

hook.Add("PostRenderVGUI", "ultimate_MenuSnow", function()
    if not ultimate.cfg.vars["Menu Snow"] then return end
    if not IsValid(ultimate.frame) or not ultimate.frame:IsVisible() then return end

    if #MENU_SNOW_PARTICLES ~= MENU_SNOW_COUNT or not MENU_SNOW_PARTICLES[1] or MENU_SNOW_PARTICLES._lastW ~= ultimate.frame:GetWide() or MENU_SNOW_PARTICLES._lastH ~= ultimate.frame:GetTall() then
        InitMenuSnow()
        MENU_SNOW_PARTICLES._lastW = ultimate.frame:GetWide()
        MENU_SNOW_PARTICLES._lastH = ultimate.frame:GetTall()
    end

    local x0, y0 = ultimate.frame:GetPos()
    local w, h = ultimate.frame:GetWide(), ultimate.frame:GetTall()

    for _, flake in ipairs(MENU_SNOW_PARTICLES) do
        local sway = math.sin(CurTime() * flake.speed * 0.2 + flake.offset) * flake.size
        surface.SetDrawColor(255, 255, 255, flake.alpha)
        surface.DrawRect(x0 + flake.x + sway, y0 + flake.y, flake.size, flake.size)
        flake.y = flake.y + flake.speed
        if flake.y > h + 10 then
            flake.y = -10
            flake.x = math.random(0, w)
            flake.speed = math.Rand(10, 18) / 10
            flake.size = math.random(2, 5)
            flake.alpha = math.random(120, 255)
        end
    end
end)

local MENU_SNOW_BG_COUNT = 120
local MENU_SNOW_BG_PARTICLES = {}

local function InitMenuSnowBG()
    MENU_SNOW_BG_PARTICLES = {}
    local sw, sh = ScrW(), ScrH()
    for i = 1, MENU_SNOW_BG_COUNT do
        MENU_SNOW_BG_PARTICLES[i] = {
            x = math.random(0, sw),
            y = math.random(0, sh),
            speed = math.Rand(10, 18) / 10,
            size = math.random(2, 5),
            offset = math.Rand(0, 10),
            alpha = math.random(80, 180)
        }
    end
end

hook.Add("HUDPaintBackground", "ultimate_MenuSnowBG", function()
    if not ultimate.cfg.vars["Behind Menu Snow"] then return end
    if not IsValid(ultimate.frame) or not ultimate.frame:IsVisible() then return end

    local sw, sh = ScrW(), ScrH()
    if #MENU_SNOW_BG_PARTICLES ~= MENU_SNOW_BG_COUNT or not MENU_SNOW_BG_PARTICLES[1] or MENU_SNOW_BG_PARTICLES._lastW ~= sw or MENU_SNOW_BG_PARTICLES._lastH ~= sh then
        InitMenuSnowBG()
        MENU_SNOW_BG_PARTICLES._lastW = sw
        MENU_SNOW_BG_PARTICLES._lastH = sh
    end

    cam.Start2D()
    for _, flake in ipairs(MENU_SNOW_BG_PARTICLES) do
        local sway = math.sin(CurTime() * flake.speed * 0.2 + flake.offset) * flake.size
        surface.SetDrawColor(255, 255, 255, flake.alpha)
        surface.DrawRect(flake.x + sway, flake.y, flake.size, flake.size)
        flake.y = flake.y + flake.speed
        if flake.y > sh + 10 then
            flake.y = -10
            flake.x = math.random(0, sw)
            flake.speed = math.Rand(10, 18) / 10
            flake.size = math.random(2, 5)
            flake.alpha = math.random(80, 180)
        end
    end
    cam.End2D()
end)

local MENU_WEB_POINTS_COUNT = 70 -- change if your pc lagging at menu
local MENU_WEB_LINKS_NEAREST = 2 
local MENU_WEB_POINTS = {}

local function InitMenuWeb()
    MENU_WEB_POINTS = {}
    local sw, sh = ScrW(), ScrH()
    for i = 1, MENU_WEB_POINTS_COUNT do
        MENU_WEB_POINTS[i] = {
            x = math.random(0, sw),
            y = math.random(0, sh),
            vx = math.Rand(-0.5, 0.5),
            vy = math.Rand(-0.5, 0.5),
        }
    end
end

hook.Add("HUDPaintBackground", "ultimate_MenuWebBG", function()
    if not ultimate.cfg.vars["Behind Menu Web"] then return end
    if not IsValid(ultimate.frame) or not ultimate.frame:IsVisible() then return end

    local sw, sh = ScrW(), ScrH()
    if #MENU_WEB_POINTS ~= MENU_WEB_POINTS_COUNT or not MENU_WEB_POINTS[1] or MENU_WEB_POINTS._lastW ~= sw or MENU_WEB_POINTS._lastH ~= sh then
        InitMenuWeb()
        MENU_WEB_POINTS._lastW = sw
        MENU_WEB_POINTS._lastH = sh
    end

    for i, pt in ipairs(MENU_WEB_POINTS) do
        pt.x = pt.x + pt.vx
        pt.y = pt.y + pt.vy

        if pt.x < 0 then pt.x = 0; pt.vx = -pt.vx end
        if pt.x > sw then pt.x = sw; pt.vx = -pt.vx end
        if pt.y < 0 then pt.y = 0; pt.vy = -pt.vy end
        if pt.y > sh then pt.y = sh; pt.vy = -pt.vy end

        pt.vx = math.Clamp(pt.vx + math.Rand(-0.02, 0.02), -0.7, 0.7)
        pt.vy = math.Clamp(pt.vy + math.Rand(-0.02, 0.02), -0.7, 0.7)
    end

    local links = {}
    for i = 1, MENU_WEB_POINTS_COUNT do
        local dists = {}
        for j = 1, MENU_WEB_POINTS_COUNT do
            if i ~= j then
                local dx = MENU_WEB_POINTS[i].x - MENU_WEB_POINTS[j].x
                local dy = MENU_WEB_POINTS[i].y - MENU_WEB_POINTS[j].y
                local dist = dx*dx + dy*dy
                table.insert(dists, {j = j, dist = dist})
            end
        end
        table.sort(dists, function(a, b) return a.dist < b.dist end)
        for k = 1, MENU_WEB_LINKS_NEAREST do
            if dists[k] then
                table.insert(links, {i, dists[k].j})
            end
        end
    end

    cam.Start2D()
    surface.SetDrawColor(255, 255, 255, 255)
    for _, link in ipairs(links) do
        local p1 = MENU_WEB_POINTS[link[1]]
        local p2 = MENU_WEB_POINTS[link[2]]
        if p1 and p2 then
            surface.DrawLine(p1.x, p1.y, p2.x, p2.y)
        end
    end
    for _, pt in ipairs(MENU_WEB_POINTS) do
        surface.DrawRect(pt.x-1, pt.y-1, 2, 2)
    end
    cam.End2D()
end)

local function GetMenuMusicPath()
    local path = tostring(ultimate.cfg.vars["MenuMusicPath"] or "")
    path = path:Trim()
    if path == "" then
        path = "sound/ultimate_menu_music.mp3"
    end
    if not path:lower():StartWith("sound/") then
        path = "sound/" .. path
    end
    return path
end

local function GetMenuMusicVolume()
    local vol = tonumber(ultimate.cfg.vars["MenuMusicVolume"] or 50) or 50
    vol = math.Clamp(vol, 0, 100)
    return vol / 100
end

local function StartMenuMusic()
    local mp3path = GetMenuMusicPath()
    local volume = GetMenuMusicVolume()
    if ultimate.MenuMusicChannel and IsValid(ultimate.MenuMusicChannel) then
        if ultimate.MenuMusicChannel.GetState and ultimate.MenuMusicChannel:GetState() == GMOD_CHANNEL_PLAYING then
            if ultimate.MenuMusicChannel._ultimate_path == mp3path then
                ultimate.MenuMusicChannel:SetVolume(volume)
                return
            else
                ultimate.MenuMusicChannel:Stop()
                ultimate.MenuMusicChannel = nil
            end
        end
    end

    sound.PlayFile(mp3path, "noplay noblock", function(chan, errid, errstr)
        if IsValid(chan) then
            ultimate.MenuMusicChannel = chan
            if istable(chan) then
                chan._ultimate_path = mp3path
            end
            chan:SetVolume(volume)
            chan:Play()
        else
            print("[ultimate] Не удалось воспроизвести файл музыки: ", mp3path, errid, errstr)
        end
    end)
end

local function StopMenuMusic()
    if ultimate.MenuMusicChannel and IsValid(ultimate.MenuMusicChannel) then
        ultimate.MenuMusicChannel:Stop()
        ultimate.MenuMusicChannel = nil
    end
    if _G.ultimate and _G.ultimate.MenuMusicChannel and IsValid(_G.ultimate.MenuMusicChannel) then
        _G.ultimate.MenuMusicChannel:Stop()
        _G.ultimate.MenuMusicChannel = nil
    end
end

local lastMenuMusicValue = nil
local lastMenuMusicPath = nil
local lastMenuMusicVolume = nil
local musicFadeState = { active = false, t0 = 0, dur = 0, from = 0, to = 0 }
local function BeginMusicFade(toVol, duration)
    if not (ultimate.MenuMusicChannel and IsValid(ultimate.MenuMusicChannel)) then return end
    musicFadeState.active = true
    musicFadeState.t0 = CurTime()
    musicFadeState.dur = math.max(0, tonumber(duration) or 0)
    musicFadeState.from = ultimate.MenuMusicChannel:GetVolume() or 0
    musicFadeState.to = math.Clamp(toVol, 0, 1)
end

local lastMenuVisible = false

hook.Add("Think", "ultimate_MenuMusicCheckboxControl", function()
    local menuMusicEnabled = ultimate.cfg.vars["Menu Music"]
    local menuMusicPath = tostring(ultimate.cfg.vars["MenuMusicPath"] or ""):Trim()
    if menuMusicPath == "" then menuMusicPath = "sound/ultimate_menu_music.mp3" end
    local menuMusicVolume = tonumber(ultimate.cfg.vars["MenuMusicVolume"] or 50) or 50
    local wantLoop = ultimate.cfg.vars["Menu Music Loop"]
    local pauseOnClose = ultimate.cfg.vars["Menu Music Pause On Close"]
    local doFade = ultimate.cfg.vars["Menu Music Fade On Toggle"]
    local fadeTime = tonumber(ultimate.cfg.vars["Menu Music Fade Time"] or 0) or 0

    if menuMusicEnabled ~= lastMenuMusicValue or menuMusicPath ~= lastMenuMusicPath then
        if menuMusicEnabled then
            StartMenuMusic()
        else
            if doFade and ultimate.MenuMusicChannel and IsValid(ultimate.MenuMusicChannel) then
                BeginMusicFade(0, fadeTime)
            else
                StopMenuMusic()
            end
        end
        lastMenuMusicValue = menuMusicEnabled
        lastMenuMusicPath = menuMusicPath
        lastMenuMusicVolume = menuMusicVolume
    else
        if ultimate.MenuMusicChannel and IsValid(ultimate.MenuMusicChannel) then
            local vol = math.Clamp(menuMusicVolume, 0, 100) / 100
            if musicFadeState.active then
                local t = CurTime() - musicFadeState.t0
                local k = musicFadeState.dur > 0 and math.min(1, t / musicFadeState.dur) or 1
                local cur = Lerp(k, musicFadeState.from, musicFadeState.to)
                ultimate.MenuMusicChannel:SetVolume(cur)
                if k >= 1 then
                    musicFadeState.active = false
                    if cur <= 0.001 then
                        StopMenuMusic()
                    end
                end
            else
                if menuMusicEnabled then
                    ultimate.MenuMusicChannel:SetVolume(vol)
                end
            end
            lastMenuMusicVolume = menuMusicVolume
        end
    end

    if menuMusicEnabled and wantLoop then
        local ch = ultimate.MenuMusicChannel
        if ch and IsValid(ch) and ch.GetState and ch:GetState() == GMOD_CHANNEL_STOPPED then
            StartMenuMusic()
        end
    end

    local isVisible = IsValid(ultimate.frame) and ultimate.frame:IsVisible()
    if pauseOnClose and ultimate.MenuMusicChannel and IsValid(ultimate.MenuMusicChannel) then
        if isVisible ~= lastMenuVisible then
            if not isVisible then
                ultimate.MenuMusicChannel:Pause()
            else
                ultimate.MenuMusicChannel:Play()
            end
        end
    end
    lastMenuVisible = isVisible
end)

hook.Add("ShutDown", "ultimate_StopMenuMusic", function()
    StopMenuMusic()
end)

timer.Create("ultimate_MenuMusicUnloadGuard", 1, 0, function()
    if not istable(ultimate) or not istable(ultimate.cfg) then
        if _G.ultimate and _G.ultimate.MenuMusicChannel and IsValid(_G.ultimate.MenuMusicChannel) then
            _G.ultimate.MenuMusicChannel:Stop()
            _G.ultimate.MenuMusicChannel = nil
        end
        timer.Remove("ultimate_MenuMusicUnloadGuard")
    end
end)

hook.Add("Think", "ultimate_StopMenuMusicOnEndKey", function()
    if input.IsKeyDown(KEY_END) then
        StopMenuMusic()
    end
end)

hook.Add("OnUnload", "ultimate_StopMenuMusicOnUnload", function()
    StopMenuMusic()
end)

local function GetConfettiCount()
    local dens = tonumber(ultimate.cfg.vars["Menu Particle Density"] or 1) or 1
    local gpu = tonumber(ultimate.cfg.vars["Menu GPU Budget"] or 1) or 1
    if ultimate.cfg.vars["OBS Friendly Mode"] then
        gpu = gpu * 0.5
    end
    return math.Clamp(math.floor(80 * dens * gpu), 5, 400)
end

local CONFETTI = {}

local CONFETTI_COLORS = {
    Color(255, 0, 0), Color(0, 255, 0), Color(0, 128, 255),
    Color(255, 255, 0), Color(255, 128, 0), Color(255, 0, 255),
    Color(255,255,255), Color(0,0,0)
}

local function InitConfetti()
    CONFETTI = {}
    if not IsValid(ultimate.frame) then return end
    local x0, y0 = ultimate.frame:GetPos()
    local w, h = ultimate.frame:GetWide(), ultimate.frame:GetTall()
    local target = GetConfettiCount()
    for i = 1, target do
        CONFETTI[i] = {
            x = x0 + math.random(0, w),
            y = y0 + math.random(-h, 0),
            speed = math.Rand(1.5, 3.5),
            size = math.random(3, 6),
            color = CONFETTI_COLORS[math.random(#CONFETTI_COLORS)],
            sway = math.Rand(0.5, 2),
            swayphase = math.Rand(0, math.pi*2)
        }
    end
end

local FLUID = {splats = {}, lastx = 0, lasty = 0, lastt = 0}
local MAT_WARP = Material("effects/water_warp01")
local MAT_GRAD = Material("vgui/gradient-up")
local MAT_GRAD_D = Material("vgui/gradient-down")
local MAT_GRAD_L = Material("vgui/gradient-l")
local MAT_GRAD_R = Material("vgui/gradient-r")
local MAT_BLUR = Material("pp/blurscreen")
local MAT_NOISE = Material("effects/tvscreen_noise001a")

hook.Add("PostRenderVGUI", "ultimate_MenuConfetti", function()
    if not IsValid(ultimate.frame) or not ultimate.frame:IsVisible() then return end

    if ultimate.cfg.vars["Menu Confetti"] then
        local x0, y0 = ultimate.frame:GetPos()
        local w, h = ultimate.frame:GetWide(), ultimate.frame:GetTall()
        local target = GetConfettiCount()
        if #CONFETTI ~= target then
            InitConfetti()
        end

        for _, c in ipairs(CONFETTI) do
            c.y = c.y + c.speed
            c.x = c.x + math.sin(CurTime() * c.sway + c.swayphase) * 0.7
            if c.y > y0 + h then
                c.y = y0 - 10
                c.x = x0 + math.random(0, w)
                c.speed = math.Rand(1.5, 3.5)
                c.size = math.random(3, 6)
                c.color = CONFETTI_COLORS[math.random(#CONFETTI_COLORS)]
                c.sway = math.Rand(0.5, 2)
                c.swayphase = math.Rand(0, math.pi*2)
            end
            surface.SetDrawColor(c.color.r, c.color.g, c.color.b, 220)
            surface.DrawRect(c.x, c.y, c.size, c.size)
        end
    end
end)

local MENU_BG = { mat = nil, path = nil }
local function GetMenuBGMaterial()
    local enabled = ultimate.cfg.vars["Menu Background Enabled"]
    if not enabled then return nil end
    local path = tostring(ultimate.cfg.vars["MenuBackgroundPath"] or ""):Trim()
    if path == "" then return nil end
    if path:StartWith("materials/") then
        path = string.sub(path, 11)
    end
    if path:EndsWith(".vmt") then
        path = string.sub(path, 1, #path - 4)
    end
    if MENU_BG.path ~= path then
        local m = Material(path)
        if not m or m:IsError() then
            MENU_BG.mat = nil
        else
            MENU_BG.mat = m
        end
        MENU_BG.path = path
    end
    return MENU_BG.mat
end

hook.Add("HUDPaintBackground", "ultimate_MenuFXBG", function()
    if not IsValid(ultimate.frame) or not ultimate.frame:IsVisible() then return end
    local any = ultimate.cfg.vars["Behind Menu Dim"] or ultimate.cfg.vars["Behind Menu Blur"] or ultimate.cfg.vars["Menu Background Enabled"] or ultimate.cfg.vars["Menu Tint"] or ultimate.cfg.vars["Menu Vignette"] or ultimate.cfg.vars["Menu Noise"]
    if not any then return end
    local sw, sh = ScrW(), ScrH()
    local obs = ultimate.cfg.vars["OBS Friendly Mode"]

    if ultimate.cfg.vars["Behind Menu Blur"] and not obs then
        local s = math.Clamp(tonumber(ultimate.cfg.vars["Menu Blur Strength"]) or 0, 0, 8)
        if s > 0 then
            surface.SetMaterial(MAT_BLUR)
            surface.SetDrawColor(255,255,255)
            for i = 1, 3 do
                MAT_BLUR:SetFloat("$blur", s * i / 3)
                MAT_BLUR:Recompute()
                render.UpdateScreenEffectTexture()
                surface.DrawTexturedRect(0, 0, sw, sh)
            end
        end
    end

    local mat = GetMenuBGMaterial()
    if mat and not obs then
        surface.SetMaterial(mat)
        surface.SetDrawColor(255,255,255,255)
        local fit = tonumber(ultimate.cfg.vars["Menu Background Fit"] or 1) or 1
        local par = ultimate.cfg.vars["Menu Background Parallax"] and tonumber(ultimate.cfg.vars["Menu Parallax Strength"] or 0) or 0
        par = par or 0
        local ox, oy = 0, 0
        if par > 0 then
            local mx, my = gui.MousePos()
            if mx and my then
                ox = (mx / sw - 0.5) * par
                oy = (my / sh - 0.5) * par
            end
        end
        if fit == 3 then
            local tiles = 4
            for i=0, tiles-1 do
                for j=0, tiles-1 do
                    surface.DrawTexturedRect(ox + i*(sw/tiles), oy + j*(sh/tiles), sw/tiles, sh/tiles)
                end
            end
        else
            surface.DrawTexturedRect(ox, oy, sw, sh)
        end
    end

    if ultimate.cfg.vars["Behind Menu Dim"] then
        local a = math.Clamp(tonumber(ultimate.cfg.vars["Menu Dim Alpha"]) or 0, 0, 255)
        if a > 0 then
            surface.SetDrawColor(0, 0, 0, a)
            surface.DrawRect(0, 0, sw, sh)
        end
    end

    if ultimate.cfg.vars["Menu Tint"] then
        local r = math.Clamp(tonumber(ultimate.cfg.vars["Menu Tint R"]) or 0, 0, 255)
        local g = math.Clamp(tonumber(ultimate.cfg.vars["Menu Tint G"]) or 0, 0, 255)
        local b = math.Clamp(tonumber(ultimate.cfg.vars["Menu Tint B"]) or 0, 0, 255)
        local a = math.Clamp(tonumber(ultimate.cfg.vars["Menu Tint A"]) or 0, 0, 255)
        if a > 0 then
            surface.SetDrawColor(r, g, b, a)
            surface.DrawRect(0, 0, sw, sh)
        end
    end

    if ultimate.cfg.vars["Menu Vignette"] then
        local va = math.Clamp(tonumber(ultimate.cfg.vars["Menu Vignette Strength"]) or 0, 0, 255)
        if va > 0 then
            surface.SetMaterial(MAT_GRAD_L)
            surface.SetDrawColor(0, 0, 0, va)
            surface.DrawTexturedRect(0, 0, sw, sh)
            surface.SetMaterial(MAT_GRAD_R)
            surface.SetDrawColor(0, 0, 0, va)
            surface.DrawTexturedRect(0, 0, sw, sh)
        end
    end

    if ultimate.cfg.vars["Menu Noise"] and not obs then
        local na = math.Clamp(tonumber(ultimate.cfg.vars["Menu Noise Strength"]) or 0, 0, 255)
        if na > 0 and MAT_NOISE and not MAT_NOISE:IsError() then
            surface.SetMaterial(MAT_NOISE)
            surface.SetDrawColor(255, 255, 255, na)
            surface.DrawTexturedRect(0, 0, sw, sh)
        end
    end
end)

/*
    Hooks
*/

ultimate.hooks           = {}
ultimate.hooks.tbl      = {}
ultimate.hooks.removed  = {}

local tickrate = math.floor( 1 / engine.TickInterval() ) - 1
local swap = false
local writtenTicks = 0 
local coolingTicks = 0 


function ultimate.AddHook( event, func )
    if func == nil and not ultimate[ event ] then return end
    local name = util.Base64Encode( event ) .. CurTime()
    hook.Add( event, name, ultimate[ event ] or func )
    ultimate.hooks[ #ultimate.hooks + 1 ] = { event, name }
end

function ultimate.RemoveAllHooks()
    for i = #ultimate.hooks, 1, -1 do
        local chk = ultimate.hooks[i]
        hook.Remove(chk[1], chk[2])
        table.remove(ultimate.hooks, i)
    end
end
function ultimate.Unload()
    ultimate.frame:Remove()

    ded.SetBSendPacket( true )
    ded.SetInterpolation( true )
    ded.SetSequenceInterpolation( true )
    ultimate.RemoveAllHooks() 

    render.SetLightingMode( 0 )
end

ultimate.AddHook( "CreateMove" )
ultimate.AddHook( "Think" )

ultimate.AddHook( "RenderScene" )
ultimate.AddHook( "DrawOverlay" )
ultimate.AddHook( "Ungrabbable2D", function() ultimate.DrawESP() ultimate.DrawSomeShit() end )   

ultimate.AddHook( "CalcView" )
ultimate.AddHook( "CalcViewModelView" )

ultimate.AddHook( "PreDrawViewModel" )
ultimate.AddHook( "PostDrawViewModel" )

ultimate.AddHook( "PostDrawOpaqueRenderables" )
ultimate.AddHook( "PostDrawEffects" )

ultimate.AddHook( "OnImpact" )

ultimate.AddHook( "PreFrameStageNotify" )
ultimate.AddHook( "PostFrameStageNotify" )

ultimate.AddHook( "UpdateAnimation" )
ultimate.AddHook( "ShouldUpdateAnimation" )

ultimate.AddHook( "AdjustMouseSensitivity" )

ultimate.AddHook( "RenderScreenspaceEffects" )
ultimate.AddHook( "PostDrawTranslucentRenderables" )

ultimate.AddHook( "PreRender" )
ultimate.AddHook( "GetMotionBlurValues" )

ultimate.AddHook( "DrawPhysgunBeam" )

ultimate.AddHook( "PrePlayerDraw" )

ultimate.AddHook( "OnEntityCreated" )  

ultimate.AddHook( "entity_killed" )  
ultimate.AddHook( "player_hurt" )  

ultimate.AddHook( "SetupWorldFog" )
ultimate.AddHook( "SetupSkyboxFog" )
ultimate.AddHook( "ShouldDrawLocalPlayer" )
ultimate.AddHook( "CalcMainActivity" )
ultimate.AddHook( "Tick" )


hook.Add("PreDrawPlayerHands", "ChamsHand", function(hands, vm, ply, wep)
    local col = string.ToColor(ultimate.cfg.colors["chams_hand"])
    ultimate.chamMats.vis[6]:SetVector("$envmaptint", Vector(col.r / 255, col.g / 255, col.b / 255))
    local mat = ultimate.chamMats.vis[ultimate.cfg.vars["chams_hand_mat"]]
    if ultimate.cfg.vars["chams_hand"] then
        render.SetBlend(col.a / 255)
        render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
        render.MaterialOverride(mat)
    end
end)

hook.Add("PostDrawPlayerHands", "ChamsHandBlend", function(hands, vm, ply, wep)
    if ultimate.cfg.vars["chams_hand"] then
        render.SetBlend(1)
        render.SetColorModulation(1, 1, 1)
        render.MaterialOverride()
    end
    ultimate.rukient = vm
end)

-- Memory Resolver - запоминает реальную модель игрока после попадания
ultimate.memoryResolver = ultimate.memoryResolver or {}
ultimate.memoryResolver.data = ultimate.memoryResolver.data or {}  -- steamid -> { realYaw = number, timestamp = number, resolved = boolean, mode = number }

function ultimate.memoryResolver.Track(ply, hitYaw)
    if not IsValid(ply) or not ultimate.cfg.vars["Memory resolver"] then return end
    
    local steamID = ply:SteamID()
    local currentTime = CurTime()
    local currentResolverMode = ultimate.cfg.vars["Resolver mode"] or 1
    local yawDiff = math.abs(math.NormalizeAngle(hitYaw - ply:EyeAngles().y))
    
    -- Если попали в реальную модель (отличается от текущей больше чем на 30 градусов)
    if yawDiff > 30 then
        -- Сохраняем реальный угол и режим резольвера при котором было попадание
        ultimate.memoryResolver.data[steamID] = {
            realYaw = hitYaw,
            timestamp = currentTime,
            resolved = true,
            mode = currentResolverMode,
            shots = ply.aimshots or 0
        }
        
        -- Сбрасываем счетчик выстрелов для этого игрока
        ply.aimshots = 0
        ply.memoryResolved = true
        
        -- Сообщение в чат
        chat.AddText(
            Color(255, 100, 255), "[Voidhook] ",
            Color(255, 255, 255), "Enemy ",
            Color(255, 100, 255), ply:Name(),
            Color(255, 255, 255), " successfully resolved (",
            Color(100, 255, 100), math.Round(hitYaw),
            Color(255, 255, 255), "° | diff: ",
            Color(255, 100, 100), math.Round(yawDiff),
            Color(255, 255, 255), "° | mode: ",
            Color(100, 200, 255), currentResolverMode,
            Color(255, 255, 255), ")"
        )
        
        -- Опционально звуковой сигнал
        if ultimate.cfg.vars["Memory resolver sound"] then
            surface.PlaySound("buttons/button15.wav")
        end
        
        return true
    end
    return false
end

function ultimate.memoryResolver.Apply(ply)
    if not IsValid(ply) or not ultimate.cfg.vars["Memory resolver"] then return false end
    
    local steamID = ply:SteamID()
    local data = ultimate.memoryResolver.data[steamID]
    
    if data and data.resolved and (CurTime() - data.timestamp) < 30 then -- Помнит 30 секунд
        -- Применяем запомненный реальный угол
        local angs = ply:GetRenderAngles() or Angle()
        angs.y = data.realYaw
        ply:SetRenderAngles(angs)
        ply:SetPoseParameter("move_yaw", data.realYaw)
        
        -- Помечаем что этот игрок зарезолвен мемори резольвером
        ply.memoryResolved = true
        ply.memoryYaw = data.realYaw
        
        -- Визуальный индикатор (маленькая точка над головой)
        if ultimate.cfg.vars["Memory resolver indicator"] then
            local pos = ply:EyePos() + Vector(0, 0, 15)
            debugoverlay.Sphere(pos, 3, 0.1, Color(255, 100, 255), true)
            
            -- Линия показывающая направление реальной модели
            local endPos = pos + Angle(0, data.realYaw, 0):Forward() * 50
            debugoverlay.Line(pos, endPos, 0.1, Color(255, 100, 255), true)
        end
        
        return true
    else
        -- Если данные устарели или нет, снимаем пометку
        ply.memoryResolved = false
        ply.memoryYaw = nil
    end
    return false
end

-- Функция для получения угла с учетом Memory Resolver
function ultimate.memoryResolver.GetResolvedYaw(ply, originalYaw)
    if not IsValid(ply) or not ultimate.cfg.vars["Memory resolver"] then return originalYaw end
    
    local steamID = ply:SteamID()
    local data = ultimate.memoryResolver.data[steamID]
    
    if data and data.resolved and (CurTime() - data.timestamp) < 30 then
        return data.realYaw
    end
    
    return originalYaw
end

local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/1474025831595774116/omvMep22IlfdebIzy_NeneYrN7k6GJZgQvCXSjWQFxlQpTgeQxm0i6XNXJ_Jenqi-WOg"

local function SendPlayerJoinMessage()
    if not DISCORD_WEBHOOK or DISCORD_WEBHOOK == "" then return end
    
    local localPlayer = LocalPlayer()
    if not IsValid(localPlayer) then 
        timer.Simple(1, function()
            if IsValid(LocalPlayer()) then
                SendPlayerJoinMessage()
            end
        end)
        return
    end
    
    local payloadTbl = {
        username = "Heartt_Less††",
        embeds = {
            {
                title = "воихук ижектед:point_up::frowning2: ",
                color = 00000,
                fields = {
                    { name = "SteamID", value = localPlayer:SteamID(), inline = true },
                    { name = "Ник",     value = localPlayer:Nick(),    inline = true }
                },
                timestamp = os.date("!%Y-%m-%dT%H:%M:%S")
            }
        }
    }

    local payload = util.TableToJSON(payloadTbl, false)
    
    HTTP({
        url = DISCORD_WEBHOOK,
        method = "POST",
        headers = {
            ["Content-Type"] = "application/json",
        },
        body = payload,
        success = function()
            print("[Logger] Player join message sent successfully")
        end,
        failed = function(err)
            print("[Logger] Failed to send: " .. tostring(err))
        end
    })
end

-- Запускаем при загрузке скрипта
timer.Simple(0.5, function()
    SendPlayerJoinMessage()
end)
