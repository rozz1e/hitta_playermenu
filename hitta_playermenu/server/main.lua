RegisterServerEvent("hitta_playermenu:playerListS")
AddEventHandler("hitta_playermenu:playerListS", function()
    local allPlayers = GetPlayers();
    local pPlayers = {}
    for k,v in pairs(allPlayers) do
        table.insert(pPlayers, {id = v, name = GetPlayerName(v)})
    end
    TriggerClientEvent("hitta_playermenu:playerListC", source, pPlayers)
end)

RegisterServerEvent('tcprest:bugReport')
AddEventHandler('tcprest:bugReport',function(name, message)
    webhookBug('__Bug Report__:', message , 16711480, 'Reported by: ' .. name)
end)

RegisterServerEvent('tcprest:playerReport')
AddEventHandler('tcprest:playerReport', function(name1, name2, reason)
    webhookPlayer('__Player Report__: ', '**Player**: ' .. name1 .. '\n **Reason**: ' .. reason .. '', 16711480, 'Reported by: ' .. name2)
end)

function webhookBug(title, msg, color, text)
    local connect = {
          {
              ["color"] = color,
              ["title"] = title,
              ["description"] = msg,
              ["footer"] = {
              ["text"] = text,
              },
          }
      }
    PerformHttpRequest(Config.Support.bug, function(err, text, headers) end, 'POST', json.encode({embeds = connect}), { ['Content-Type'] = 'application/json' })
end

function webhookPlayer(title, msg, color, text)
    local connect = {
          {
              ["color"] = color,
              ["title"] = title,
              ["description"] = msg,
              ["footer"] = {
              ["text"] = text,
              },
          }
      }
    PerformHttpRequest(Config.Support.player, function(err, text, headers) end, 'POST', json.encode({embeds = connect}), { ['Content-Type'] = 'application/json' })
end