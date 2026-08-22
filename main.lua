-- 🏰 Castillo Velocidad — Script para Delta
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character, Humanoid

local function UpdateChar()
    character = player.Character or player.CharacterAdded:Wait()
    Humanoid = character:WaitForChild("Humanoid")
end
UpdateChar()
player.CharacterAdded:Connect(UpdateChar)

local VelOn, Speed = false, 32
game:GetService("UserInputService").InputBegan:Connect(function(i,g)
    if g then return end
    if i.KeyCode == Enum.KeyCode.V then VelOn = not VelOn end
end)

RunService.Heartbeat:Connect(function()
    if not Humanoid then return end
    Humanoid.WalkSpeed = VelOn and Speed or 16
end)

print("✅ Cargado — V = velocidad")
