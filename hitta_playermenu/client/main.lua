local MainMenu = RageUI.CreateMenu('Player Menu', 'Your toolbox', 1320, 80)
local fpsMenu = RageUI.CreateSubMenu(MainMenu, 'FPS', 'Increase your fps', 1320, 80)
local hudMenu = RageUI.CreateSubMenu(MainMenu, 'HUD', 'Edit your hud', 1320, 80)
local supportMenu  = RageUI.CreateSubMenu(MainMenu, 'Support', 'Ask for help', 1320, 80)
local creditsMenu  = RageUI.CreateSubMenu(MainMenu, 'Credits', 'Thankssss', 1320, 80)
local playersMenu  = RageUI.CreateSubMenu(MainMenu, 'Players', 'See whos online', 1320, 80)


local playerId = PlayerId()
local getID = GetPlayerServerId(playerId)
local getName = GetPlayerName(playerId)
local SpeedoMeter = true;
local FuelBar = true;
local Clock = true;
local Watermark = true;
local ShowIDs = false;
local reportProcessed = false;
self = {
    playersList = {},
}


function RageUI.PoolMenus:Menu()
    MainMenu:IsVisible(function(Items)
        Items:AddSeparator('Name: '.. getName ..'')
        Items:AddSeparator('ID: '.. getID ..'')

        if Config.Menu.fpsMenu then
            Items:AddButton('FPS', 'Increase your fps', { IsDisabled = false, RightLabel = '→→→' }, function(onSelected)
            end, fpsMenu)
        end

        if Config.Menu.hudMenu then
            Items:AddButton('Hud', 'Edit your hud', { IsDisabled = false, RightLabel = '→→→' }, function(onSelected)
            end, hudMenu)
        end

        if Config.Menu.supportMenu then
            Items:AddButton('Support', 'Ask for help', { IsDisabled = false, RightLabel = '→→→' }, function(onSelected)
            end, supportMenu)
        end

        if Config.Menu.playersMenu then
            Items:AddButton('Players', 'See whos online', { IsDisabled = false, RightLabel = '→→→' }, function(onSelected)
                if (onSelected) then
                    TriggerServerEvent('hitta_playermenu:playerListS')
                end
            end, playersMenu)
        end

        Items:AddSeparator()

        Items:AddButton('Credits', 'wtff is thisss??', { IsDisabled = false, RightLabel = '→→→' }, function(onSelected)
        end, creditsMenu)

    end, function()
    end)

    fpsMenu:IsVisible(function(Items)
        Items:AddButton('Reset', 'Resets to default', { IsDisabled = false, RightLabel = '→→→' }, function(onSelected)
            if (onSelected) then
                RESET()
            end
        end)

        Items:AddButton('Low', 'Turns off lighting system', { IsDisabled = false, RightLabel = '→→→' }, function(onSelected)
            if (onSelected) then
                LOW()
            end
        end)

        Items:AddButton('Very Low', 'Reduces rendering for fps boost', { IsDisabled = false, RightLabel = '→→→' }, function(onSelected)
            if (onSelected) then
                VERYLOW()
            end
        end)

        Items:AddButton('Potato', 'Are you playing on nintendo?', { IsDisabled = false, RightLabel = '→→→' }, function(onSelected)
            if (onSelected) then
                POTATO()
            end
        end)
    end, function()
    end)

    hudMenu:IsVisible(function(Items)
		Items:CheckBox('Enable Speedometer', nil, SpeedoMeter, { Style = 1 }, function(onSelected, IsSpeedoMeter)
			if (onSelected) then
				SpeedoMeter = IsSpeedoMeter
			end
		end)

		Items:CheckBox('Enable Fuel', nil, FuelBar, { Style = 1 }, function(onSelected, IsFuelBar)
			if (onSelected) then
				FuelBar = IsFuelBar
			end
		end)

		Items:CheckBox('Enable Clock', nil, Clock, { Style = 1 }, function(onSelected, IsClock)
			if (onSelected) then
				Clock = IsClock
			end
		end)

        Items:CheckBox('Enable Watermark', nil, Watermark, { Style = 1 }, function(onSelected, IsWatermark)
			if (onSelected) then
				Watermark = IsWatermark
			end
		end)
        
    end, function()
    end)

	supportMenu:IsVisible(function(Items)

        Items:AddButton('Report a Bug', 'Report a Bug that you know about', { IsDisabled = false, RightLabel = '→→→' }, function(onSelected)
            if (onSelected) then
                reportProcessed = false
                local bugresults = KeyboardInput('Report a Bug:', '', 200, false)
                if bugresults and bugresults ~= "" then
                    local playerName = anonymous == 1 and 'Anonymous' or GetPlayerName(PlayerId())
                    TriggerServerEvent('tcprest:bugReport', playerName, bugresults)
                    reportProcessed = true
                end
            end
        end)

        Items:AddButton('Report a Player', 'Report a Player that broke the rules', { IsDisabled = false, RightLabel = '→→→' }, function(onSelected)
            if (onSelected) then
                reportProcessed = false
                local nameResults = KeyboardInput("Enter Player Name or ID:", "", 20, false)
                local reasonResults = KeyboardInput("Enter Reason: ", "", 200, false)

                if nameResults and nameResults ~= "" then
                    local playerName = anonymous == 1 and 'Anonymous' or GetPlayerName(PlayerId())
                    TriggerServerEvent('tcprest:playerReport', nameResults, playerName, reasonResults)
                    reportProcessed = true
                end
            end
        end)


    end, function()
    end)

    creditsMenu:IsVisible(function(Items)

        Items:AddButton('maybe k4 soon? | HiTTA', nil, { IsDisabled = false }, function()
        end)

        Items:AddButton('K4 | tcprestt', 'For the support sytem', { IsDisabled = false }, function()
        end)


    end, function()
    end)

    playersMenu:IsVisible(function(Items)
     
        for k, v in pairs(GetActivePlayers()) do
            Items:AddButton("["..GetPlayerServerId(v).."] - "..GetPlayerName(v), nil, { IsDisabled = false }, function()
            end)
        end

    end, function()
    end)
    
end

local kmh = 0
local fuel = 0

CreateThread(function()
    if Config.Hud then
		while true do
			local sleep = 0

			local playerPed = PlayerPedId()
			local vehicle = GetVehiclePedIsIn(playerPed)
			local speed = GetEntitySpeed(vehicle)
        	local class = GetVehicleClass(vehicle)
			local InVehicle = IsPedInAnyVehicle(playerPed)
			kmh = tostring(math.ceil(speed * 3.6))

			if SpeedoMeter then
				if InVehicle and (class ~= 13) then
        			DrawRect(0.04, 0.9555, 0.05, 0.026, 0, 0, 0, 205)
        			DrawAdvancedText(0.140, 0.955, 0.005, 0.0028, 0.5, kmh, 255, 255, 255, 255, 6, 1)
        			DrawAdvancedText(0.110, 0.960, 0.005, 0.0028, 0.43, 'KM/H:', 255, 255, 255, 255, 6, 1)
				end
			end

			if FuelBar then
				if InVehicle and (class ~= 13) then
                    fuel = (math.ceil(GetVehicleFuelLevel(vehicle)))
                        
                    DrawRect(0.04, 0.931, 0.05, 0.024, 0, 0, 0, 205)
                    DrawAdvancedText(0.110, 0.933, 0.005, 0.0028, 0.43, 'Fuel: ', 255, 255, 255, 255, 6, 1)
        			DrawAdvancedText(0.1345, 0.933, 0.005, 0.0028, 0.43, fuel .. '~w~%', 255, 255, 255, 255, 6, 1)
       			end
			end

            if Clock then
                ToggleClock()
            end

            if Config.Watermark.enabled then
                if Watermark then
                    DrawWatermark(Config.Watermark.pos.x, Config.Watermark.pos.y, 0.005, 0.0028, Config.Watermark.text, Config.Watermark.colour.r, Config.Watermark.colour.g, Config.Watermark.colour.b, Config.Watermark.colour.a, Config.Watermark.font)
                end
            end

        	Wait(sleep)
    	end
    end
end)

RegisterCommand('playermenu', function()
    RageUI.Visible(MainMenu, not RageUI.Visible(MainMenu))
end)

RegisterKeyMapping('playermenu', 'Player Menu', 'keyboard', Config.Key)

RegisterNetEvent("hitta_playermenu:playerListC")
AddEventHandler("hitta_playermenu:playerListC", function(list)
    self.playersList = list
end)
