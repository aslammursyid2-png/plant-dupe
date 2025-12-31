-- PRANK HUB 😈
local player = game.Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 360, 0, 200)
frame.Position = UDim2.new(0.5, -180, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0.25,0)
title.BackgroundTransparency = 1
title.Text = "🔥 FREE SCRIPT HUB 🔥"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,170,0)

local desc = Instance.new("TextLabel", frame)
desc.Position = UDim2.new(0.05,0,0.3,0)
desc.Size = UDim2.new(0.9,0,0.2,0)
desc.BackgroundTransparency = 1
desc.Text = "Universal | No Key | Anti Ban"
desc.TextScaled = true
desc.TextColor3 = Color3.fromRGB(200,200,200)

local button = Instance.new("TextButton", frame)
button.Position = UDim2.new(0.15,0,0.6,0)
button.Size = UDim2.new(0.7,0,0.25,0)
button.Text = "INJECT"
button.TextScaled = true
button.BackgroundColor3 = Color3.fromRGB(50,50,50)
button.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", button).CornerRadius = UDim.new(0, 12)

button.MouseButton1Click:Connect(function()
	button.Text = "KENA PRANK 🤡"
	button.BackgroundColor3 = Color3.fromRGB(150,0,0)

	desc.Text = "KENA PRANK MAKANYA JANGAN SCRIPT"
	desc.TextColor3 = Color3.fromRGB(255,0,0)
	desc.TextScaled = true
end)
