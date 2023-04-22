local animation = script:WaitForChild("Animation")
local humanoid = script.Parent:WaitForChild("Humanoid")
local humanoidAnimation = humanoid:LoadAnimation(animation)
humanoidAnimation:Play()