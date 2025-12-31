-- ACak Upgrade Pack (1 fitur per pack)
local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

-- ===== SOUND (Pack 3) =====
local clickSound = Instance.new("Sound", gui)
clickSound.SoundId = "rbxassetid://12221967" -- click
clickSound.Volume = 1

-- ===== PANEL 1 =====
local frame1 = Instance.new("Frame", gui)
frame1.Size = UDim2.new(0, 360, 0, 200)
frame1.Position = UDim2.new(0.5, -180, 0.5, -100)
frame1.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame1.Active = true
frame1.Draggable = true
frame1.BackgroundTransparency = 1 -- for fade
Instance.new("UICorner", frame1).CornerRadius = UDim.new(0,14)

local title1 = Instance.new("TextLabel", frame1)
title1.Size = UDim2.new(1,0,0.3,0)
title1.BackgroundTransparency = 1
title1.Text = "DUPE PLANT"
title1.TextScaled = true
title1.TextColor3 = Color3.fromRGB(0,255,0)

local injectBtn = Instance.new("TextButton", frame1)
injectBtn.Size = UDim2.new(0.7,0,0.3,0)
injectBtn.Position = UDim2.new(0.15,0,0.55,0)
injectBtn.Text = "INJECT"
injectBtn.TextScaled = true
injectBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
injectBtn.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", injectBtn).CornerRadius = UDim.new(0,12)

-- ===== PANEL 2 =====
local frame2 = Instance.new("Frame", gui)
frame2.Size = UDim2.new(0, 420, 0, 260)
frame2.Position = UDim2.new(0.5, -210, 0.5, -130)
frame2.BackgroundColor3 = Color3.fromRGB(15,15,15)
frame2.Visible = false
frame2.Active = true
frame2.Draggable = true
frame2.BackgroundTransparency = 1
Instance.new("UICorner", frame2).CornerRadius = UDim.new(0,14)

local title2 = Instance.new("TextLabel", frame2)
title2.Size = UDim2.new(1,0,0.22,0)
title2.BackgroundTransparency = 1
title2.Text = "DUPE PLANT"
title2.TextScaled = true
title2.TextColor3 = Color3.fromRGB(0,255,0)

local warn = Instance.new("TextLabel", frame2)
warn.Position = UDim2.new(0.1,0,0.28,0)
warn.Size = UDim2.new(0.8,0,0.18,0)
warn.BackgroundTransparency = 1
warn.Text = "peringatan harus memegang plant"
warn.TextScaled = true
warn.TextColor3 = Color3.fromRGB(255,0,0)

local dupeBtn = Instance.new("TextButton", frame2)
dupeBtn.Position = UDim2.new(0.1,0,0.52,0)
dupeBtn.Size = UDim2.new(0.3,0,0.22,0)
dupeBtn.Text = "DUPE"
dupeBtn.TextScaled = true
dupeBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
dupeBtn.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", dupeBtn).CornerRadius = UDim.new(0,10)

-- ===== Loading Bar (Pack 2) =====
local barBg = Instance.new("Frame", frame2)
barBg.Position = UDim2.new(0.45,0,0.58,0)
barBg.Size = UDim2.new(0.45,0,0.14,0)
barBg.BackgroundColor3 = Color3.fromRGB(40,40,40)
Instance.new("UICorner", barBg).CornerRadius = UDim.new(0,8)

local bar = Instance.new("Frame", barBg)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(0,200,0)
Instance.new("UICorner", bar).CornerRadius = UDim.new(0,8)

local status = Instance.new("TextLabel", frame2)
status.Position = UDim2.new(0,0,0.78,0)
status.Size = UDim2.new(1,0,0.18,0)
status.BackgroundTransparency = 1
status.Text = ""
status.TextScaled = true
status.TextColor3 = Color3.fromRGB(255,255,0)

-- ===== Animasi muncul (Pack 1) =====
local function popIn(frame)
	frame.Visible = true
	frame.BackgroundTransparency = 1
	frame.Size = frame.Size - UDim2.new(0,40,0,40)
	local t1 = TweenService:Create(frame, TweenInfo.new(0.25), {
		BackgroundTransparency = 0,
		Size = frame.Size + UDim2.new(0,40,0,40)
	})
	t1:Play()
end

popIn(frame1)

-- ===== EVENTS =====
injectBtn.MouseButton1Click:Connect(function()
	clickSound:Play()
	frame1.Visible = false
	popIn(frame2)
end)

dupeBtn.MouseButton1Click:Connect(function()
	clickSound:Play()
	bar.Size = UDim2.new(0,0,1,0)
	status.Text = "Processing..."
	for i=1,100 do
		bar.Size = UDim2.new(i/100,0,1,0)
		task.wait(0.03)
	end

	-- Pack 4: Fake success
	status.Text = "DUPE SUCCESS"
	status.TextColor3 = Color3.fromRGB(0,255,0)

	-- Pack 5: Kick delay
	task.wait(3)
	player:Kick("dupe plantg")
end)
