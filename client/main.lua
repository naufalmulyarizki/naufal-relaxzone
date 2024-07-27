if Config.FrameWork == 'ESX' then
    ESX = exports[Config.Core]:getSharedObject()
elseif Config.FrameWork == 'QBCORE' then
    local QBCore = exports[Config.Core]:GetCoreObject()
else
    print('You have to fill in the qbcore or esx framework ')
end

if Config.Healing then
    if #Config.Healing > 0 then
        for index, data in pairs(Config.Healing) do
            local function onEnterMelamun(self)
                lib.showTextUI('Relax Zone', {
                    position = "left-center",
                    icon = 'person',
                })
            end

            local function onExitMelamun(self)
                if Config.FrameWork == 'ESX' then
                    ESX.ShowNotification('You are out of the relax zone', 'error')
                    lib.hideTextUI()
                elseif Config.FrameWork == 'QBCORE' then
                    QBCore.Functions.Notify("You are out of the relax zone", "error")
                    lib.hideTextUI()
                else
                    print('You have to fill in the qbcore or esx framework ')
                end
            end

            local function insideMelamun(self)
                if Config.FrameWork == 'ESX' then
                    TriggerEvent('esx_status:remove', 'stress', data.JumlahStress)
                    Wait(data.WaitTick)
                elseif Config.FrameWork == 'QBCORE' then
                    TriggerServerEvent('hud:server:RelieveStress', data.JumlahStress)
                    Wait(data.WaitTick)
                else
                    print('You have to fill in the qbcore or esx framework ')
                end
            end

            if data.useblip then
                local blip = AddBlipForCoord(data.blip.coords.x, data.blip.coords.y, data.blip.coords.z)
                SetBlipSprite(blip, data.blip.sprite)
                SetBlipScale(blip, data.blip.scale)
                SetBlipColour(blip, data.blip.color)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName('STRING')
                AddTextComponentSubstringPlayerName(data.blip.name)
                EndTextCommandSetBlipName(blip)
            end

            zoneHealing = lib.zones.poly({
                points = data.points,
                thickness = data.thickness,
                debug = data.debug,
                inside = insideMelamun,
                onEnter = onEnterMelamun,
                onExit = onExitMelamun
            })
        end
    end
end