local TeleportService = game:GetService("TeleportService")

local DESTINATION_PLACE_ID = 13123862455

local teleportingPlayers = {}
local teleportPart = script.Parent

local function setCharacterState(character, state)
    local humanoid = character.Humanoid

    if state == "teleporting" then
        humanoid.WalkSpeed = 0
        humanoid.JumpPower = 0
    elseif state == "reset" then
        local humanoidRootPart = humanoid.RootPart
        humanoidRootPart.Position = Vector3.new(0, 2 + humanoid.HipHeight, 0)
        humanoid.WalkSpeed = 16
        humanoid.JumpPower = 50
    end
end

local function teleportPlayer(playerToTeleport)
    teleportingPlayers[playerToTeleport] = true
    local connection
    connection = TeleportService.TeleportInitFailed:Connect(function(player, teleportResult, errorMessage)
        if playerToTeleport == player then
            if teleportResult ~= Enum.TeleportResult.IsTeleporting then
                connection:Disconnect()
                setCharacterState(playerToTeleport.Character, "reset")
            end
            teleportingPlayers[player] = nil
        end
    end)
    TeleportService:Teleport(DESTINATION_PLACE_ID, playerToTeleport, "Blue Arena")
end

local function onPartTouch(otherPart)
    local player = game.Players:GetPlayerFromCharacter(otherPart.Parent)

    if player and not teleportingPlayers[player] then
        -- Teleport player
        setCharacterState(player.Character, "teleporting")
        teleportPlayer(player)
    end
end
teleportPart.Touched:Connect(onPartTouch)