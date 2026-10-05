-- GAKTAU GABUT HUB v2 - Wide + Minimize
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

local fly = false
local infJump = false
local noClip = false
local antiAFK = false
local fullbright = false
local speed = 50

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GakTauGabutHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 350, 0, 480)
Frame.Position = UDim2.new(0.5, -175, 0.5, -240)
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

local BgImage = Instance.new("ImageLabel")
BgImage.Size = UDim2.new(1, 0, 1, 0)
BgImage.BackgroundTransparency = 1
BgImage.Image = "rbxassetid://95222951382845"
BgImage.ImageTransparency = 0.85
BgImage.ScaleType = Enum.ScaleType.Crop
BgImage.Parent = Frame

local UICornerBg = Instance.new("UICorner")
UICornerBg.CornerRadius = UDim.new(0, 12)
UICornerBg.Parent = BgImage

local Judul = Instance.new("TextLabel")
Judul.Size = UDim2.new(1, 0, 0, 55)
Judul.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
Judul.BorderSizePixel = 0
Judul.Text = "👑 GAKTAU GABUT"
Judul.TextColor3 = Color3.fromRGB(255, 255, 255)
Judul.TextScaled = true
Judul.Font = Enum.Font.GothamBold
Judul.Parent = Frame

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 12)
UICorner2.Parent = Judul

-- Tombol X (tutup)
local BtnX = Instance.new("TextButton")
BtnX.Size = UDim2.new(0, 35, 0, 35)
BtnX.Position = UDim2.new(1, -45, 0, 10)
BtnX.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
BtnX.BorderSizePixel = 0
BtnX.Text = "X"
BtnX.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnX.TextScaled = true
BtnX.Font = Enum.Font.GothamBold
BtnX.Parent = Frame
local cX = Instance.new("UICorner")
cX.CornerRadius = UDim.new(0, 6)
cX.Parent = BtnXlocal Sub = Instance.new("TextLabel")
Sub.Size = UDim2.new(1, 0, 0, 25)
Sub.Position = UDim2.new(0, 0, 0, 55)
Sub.BackgroundTransparency = 1
Sub.Text = "by: Faizzz"
Sub.TextColor3 = Color3.fromRGB(0, 150, 255)
Sub.TextScaled = true
Sub.Font = Enum.Font.Gotham
Sub.Parent = Frame

local function bikinTombol(nama, posY, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 32)
    btn.Position = UDim2.new(0.05, 0, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
    btn.BorderSizePixel = 0
    btn.Text = nama
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = Frame
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local Kat1 = Instance.new("TextLabel")
Kat1.Size = UDim2.new(0.9, 0, 0, 20)
Kat1.Position = UDim2.new(0.05, 0, 0, 85)
Kat1.BackgroundTransparency = 1
Kat1.Text = "🏃 MOVEMENT"
Kat1.TextColor3 = Color3.fromRGB(0, 150, 255)
Kat1.TextScaled = true
Kat1.Font = Enum.Font.GothamBold
Kat1.TextXAlignment = Enum.TextXAlignment.Left
Kat1.Parent = Frame

local BtnFly = bikinTombol("Fly: OFF", 110, function()
    fly = not fly
    BtnFly.Text = "Fly: " .. (fly and "ON" or "OFF")
    BtnFly.BackgroundColor3 = fly and Color3.fromRGB(0, 100, 255) or Color3.fromRGB(20, 20, 40)
end)

local BtnJump = bikinTombol("Infinite Jump: OFF", 147, function()
    infJump = not infJump
    BtnJump.Text = "Infinite Jump: " .. (infJump and "ON" or "OFF")
    BtnJump.BackgroundColor3 = infJump and Color3.fromRGB(0, 100, 255) or Color3.fromRGB(20, 20, 40)
end)

local BtnNoclip = bikinTombol("No Clip: OFF", 184, function()
    noClip = not noClip
    BtnNoclip.Text = "No Clip: " .. (noClip and "ON" or "OFF")
    BtnNoclip.BackgroundColor3 = noClip and Color3.fromRGB(0, 100, 255) or Color3.fromRGB(20, 20, 40)
end)

local Kat2 = Instance.new("TextLabel")
Kat2.Size = UDim2.new(0.9, 0, 0, 20)
Kat2.Position = UDim2.new(0.05, 0, 0, 225)
Kat2.BackgroundTransparency = 1
Kat2.Text = "👁️ VISUAL"
Kat2.TextColor3 = Color3.fromRGB(0, 150, 255)
Kat2.TextScaled = true
Kat2.Font = Enum.Font.GothamBold
Kat2.TextXAlignment = Enum.TextXAlignment.Left
Kat2.Parent = Frame

local BtnBright = bikinTombol("Fullbright: OFF", 250, function()
    fullbright = not fullbright
    BtnBright.Text = "Fullbright: " .. (fullbright and "ON" or "OFF")
    BtnBright.BackgroundColor3 = fullbright and Color3.fromRGB(0, 100, 255) or Color3.fromRGB(20, 20, 40)
    Lighting.Brightness = fullbright and 3 or 1
    Lighting.ClockTime = fullbright and 12 or 14
end)local Kat3 = Instance.new("TextLabel")
Kat3.Size = UDim2.new(0.9, 0, 0, 20)
Kat3.Position = UDim2.new(0.05, 0, 0, 290)
Kat3.BackgroundTransparency = 1
Kat3.Text = "🎮 PLAYER"
Kat3.TextColor3 = Color3.fromRGB(0, 150, 255)
Kat3.TextScaled = true
Kat3.Font = Enum.Font.GothamBold
Kat3.TextXAlignment = Enum.TextXAlignment.Left
Kat3.Parent = Frame

local BtnAFK = bikinTombol("Anti AFK: OFF", 315, function()
    antiAFK = not antiAFK
    BtnAFK.Text = "Anti AFK: " .. (antiAFK and "ON" or "OFF")
    BtnAFK.BackgroundColor3 = antiAFK and Color3.fromRGB(0, 100, 255) or Color3.fromRGB(20, 20, 40)
end)

local BtnSpeed = bikinTombol("Speed: 50", 352, function()
    if speed == 50 then speed = 100
    elseif speed == 100 then speed = 150
    elseif speed == 150 then speed = 200
    else speed = 50 end
    humanoid.WalkSpeed = speed
    BtnSpeed.Text = "Speed: " .. speed
end)

-- Tombol TUTUP (di dalam frame)
local BtnClose = Instance.new("TextButton")
BtnClose.Size = UDim2.new(0.9, 0, 0, 35)
BtnClose.Position = UDim2.new(0.05, 0, 1, -45)
BtnClose.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
BtnClose.BorderSizePixel = 0
BtnClose.Text = "❌ TUTUP"
BtnClose.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnClose.TextScaled = true
BtnClose.Font = Enum.Font.GothamBold
BtnClose.Parent = Frame
local cClose = Instance.new("UICorner")
cClose.CornerRadius = UDim.new(0, 6)
cClose.Parent = BtnClose

-- Tombol buka lagi (muncul kalau di-minimize)
local BtnOpen = Instance.new("TextButton")
BtnOpen.Size = UDim2.new(0, 60, 0, 60)
BtnOpen.Position = UDim2.new(0, 20, 0.5, -30)
BtnOpen.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
BtnOpen.BorderSizePixel = 0
BtnOpen.Text = "👑"
BtnOpen.TextScaled = true
BtnOpen.Font = Enum.Font.GothamBold
BtnOpen.Parent = ScreenGui
BtnOpen.Visible = false
local cOpen = Instance.new("UICorner")
cOpen.CornerRadius = UDim.new(0, 30)
cOpen.Parent = BtnOpen

-- Fungsi tombol X (hide)
BtnX.MouseButton1Click:Connect(function()
    Frame.Visible = false
    BtnOpen.Visible = true
end)

-- Fungsi tombol TUTUP (destroy)
BtnClose.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Fungsi tombol buka lagi
BtnOpen.MouseButton1Click:Connect(function()
    Frame.Visible = true
    BtnOpen.Visible = false
end)

-- Loop fitur
RunService.Heartbeat:Connect(function()
    if not char or not char.Parent then return end
    if fly then hrp.Velocity = Vector3.new(0, 50, 0) end
    if infJump and UIS:IsKeyDown(Enum.KeyCode.Space) then humanoid.Jump = true end
    if noClip then
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "GAKTAU GABUT HUB",
    Text = "Script berhasil dimuat!",
    Duration = 3
})
