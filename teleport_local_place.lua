--[[

Roblox's default 'TeleportService' only supports teleporting players from one Place to another.
This script moves a player from one position directly to another position in the same Place.

When player touches Gate1, she is directly moved to Gate2 which is in the same Place.
Create a new Script under Gate1 (which is a Part)

--]]

local Gate1 = script.Parent
local debounce = false

local function LocalTeleport(touchedPart)
    if debounce then return end

    local touchedParent = touchedPart.Parent
    local humanoidRootPart = touchedParent:FindFirstChild("HumanoidRootPart")
    
    -- If HumanoidRootPart is found we know Gate1 is touched by a player
    if humanoidRootPart then
        debounce = true
        -- Get Gate2's position (assuming Gate2 is directly under Workspace)
        local pos = game.Workspace.Gate2.Position
        -- Move player over by directly setting the CFrame field.
        -- Change x position a bit so player doesn't collide with Gate2
        humanoidRootPart.CFrame = CFrame.new(pos.X + 3, pos.Y, pos.Z)
        
        wait(2)
        debounce = false
    end
end

Gate1.Touched:Connect(LocalTeleport)
