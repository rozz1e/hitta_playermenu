RESET = function()
    SetTimecycleModifier()
    ClearTimecycleModifier()
    ClearExtraTimecycleModifier()
end

LOW = function()
    local ped = PlayerPedId()
    SetTimecycleModifier('yell_tunnel_nodirect')
    ClearAllBrokenGlass()
    ClearAllHelpMessages()
    LeaderboardsReadClearAll()
    ClearBrief()
    ClearGpsFlags()
    ClearPrints()
    ClearSmallPrints()
    ClearReplayStats()
    LeaderboardsClearCacheData()
    ClearFocus()
    ClearHdArea()
    ClearPedBloodDamage(ped)
    ClearPedWetness(ped)
    ClearPedEnvDirt(ped)
    ResetPedVisibleDamage(ped)
    ClearOverrideWeather()
    DisableScreenblurFade()
    SetRainLevel(0.0)
    SetWindSpeed(0.0)
end

VERYLOW = function()
    local ped = PlayerPedId()
    SetTimecycleModifier('exile1_plane')
    ClearAllBrokenGlass()
    ClearAllHelpMessages()
    LeaderboardsReadClearAll()
    ClearBrief()
    ClearGpsFlags()
    ClearPrints()
    ClearSmallPrints()
    ClearReplayStats()
    LeaderboardsClearCacheData()
    ClearFocus()
    ClearHdArea()
    ClearPedBloodDamage(ped)
    ClearPedWetness(ped)
    ClearPedEnvDirt(ped)
    ResetPedVisibleDamage(ped)
    ClearOverrideWeather()
    DisableScreenblurFade()
    SetRainLevel(0.0)
    SetWindSpeed(0.0)
end

POTATO = function()
    local ped = PlayerPedId()
    SetTimecycleModifier('HicksbarNEW')
    ClearAllBrokenGlass()
    ClearAllHelpMessages()
    LeaderboardsReadClearAll()
    ClearBrief()
    ClearGpsFlags()
    ClearPrints()
    ClearSmallPrints()
    ClearReplayStats()
    LeaderboardsClearCacheData()
    ClearFocus()
    ClearHdArea()
    ClearPedBloodDamage(ped)
    ClearPedWetness(ped)
    ClearPedEnvDirt(ped)
    ResetPedVisibleDamage(ped)
    ClearOverrideWeather()
    DisableScreenblurFade()
    SetRainLevel(0.0)
    SetWindSpeed(0.0)
end

DrawAdvancedText = function(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end

DrawWatermark = function(x,y ,w,h, text, r,g,b,a,font)
    SetTextColour(r, g, b, a)
    SetTextFont(font)
    SetTextScale(Config.Watermark.scale.x, Config.Watermark.scale.y)
    SetTextWrap(0.0, 1.0)
    SetTextCentre(false)
    if Config.Watermark.outline then 
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

ToggleClock = function()
    local timeZone = 'am'
    if GetClockHours() > 12 then 
        timeZone = 'pm'
    end

    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped)
    local class = GetVehicleClass(vehicle)
	local InVehicle = IsPedInAnyVehicle(ped)
	local vehicleRunning = GetIsVehicleEngineRunning(vehicle)

    SetTextFont(6)
    SetTextProportional(0)
    SetTextScale(0.4, 0.4)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(2, 2, 0, 0, 0)
    SetTextEdge(0, 0, 0, 0, 205)
    SetTextDropShadow()
    SetTextOutline()
    DrawRect(0.13046, 0.885, 0.05, 0.03, 0, 0, 0, 205)
    SetTextEntry("STRING")
    AddTextComponentString(GetClockHours() .. ":" .. GetClockMinutes().. timeZone)
    DrawText(0.116, 0.8715)
end

KeyboardInput = function(TextEntry, ExampleText, MaxStringLength, IsNumber)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end
    
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult() 
        Citizen.Wait(500) 
        if IsNumber then
            result = tonumber(result)
        end
        return result 
    else
        Citizen.Wait(500)
        return nil 
    end
end