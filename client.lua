local function notify(notificationData)
    if notificationData.template then 
        local template = notificationData.template
        if template == 'success' then
            notificationData.sound = 'success'
            notificationData.title = "Success"
            notificationData.icon = "fa-solid fa-check"
            notificationData.mainColor = "rgb(54, 255, 70)"
        elseif template == 'error' then
            notificationData.sound = 'error'
            notificationData.title = "Error"
            notificationData.icon = "fa-solid fa-xmark"
            notificationData.mainColor = "rgb(255, 54, 54)"
        elseif template == 'warning' then
            notificationData.sound = 'warning'
            notificationData.title = "Warning"
            notificationData.icon = "fa-solid fa-triangle-exclamation"
            notificationData.mainColor = "rgb(255, 141, 48)"
        elseif template == 'info' then
            notificationData.sound = 'info'
            notificationData.title = "Info"
            notificationData.icon = "fa-solid fa-info"
            notificationData.mainColor = "rgb(79, 126, 255)"
        end
    end 
    if notificationData.sound == 'success' then 
        PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1)
    elseif notificationData.sound == 'error' then
        PlaySoundFrontend(-1, "Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset", 1)
    elseif notificationData.sound == 'warning' then
        PlaySoundFrontend(-1, "CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", 1)
    elseif notificationData.sound == 'info' then
        PlaySoundFrontend(-1, "Click", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
    end
    SendNUIMessage({ notification = notificationData })
end

exports('showNotification', notify)

Wait(100)
notify({template = 'success', message = 'success'})
Wait(1000)
notify({template = 'error', message = 'error'})
Wait(1000)
notify({template = 'warning', message = 'warning'})
Wait(1000)
notify({template = 'info', message = 'info'})
Wait(1000)
notify({template = 'none', title = "Custom", icon = "fa-solid fa-user", mainColor = "rgb(240, 4, 75)", duration = 10000, message = 'You made it to the <span style="color: rgb(79, 126, 255);">top</span> of the building. Find <span style="color: rgb(255, 0, 0)">Spiderman</span> and he will give you a job.'})

RegisterCommand('notify', function(source, args)
    notify({template = 'info', message = table.concat(args, ' ')})
end)

AddEventHandler('fnbar-updatecolors', function(colors) -- https://github.com/fnbar0/fnbar-hud
    SendNUIMessage({ updatedColors = colors })
end)
