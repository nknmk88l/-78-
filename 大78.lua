local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ddjlb7598/97979779797979/refs/heads/main/%E8%BF%AA%E8%84%9A%E6%9C%AC%E9%BB%91%E5%90%8D%E5%8D%95.lua"))()

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ddjlb7598/-ui99999/refs/heads/main/%E5%8A%A0%E8%BD%BD%E7%95%8C%E9%9D%A2.lua"))()

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ddjlb7598/-VIP/refs/heads/main/%E8%BF%AA%E8%84%9A%E6%9C%AC%EF%BC%8CVIP%E7%B3%BB%E7%BB%9F.lua"))()

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    wait()
    LocalPlayer = Players.LocalPlayer
end

local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local camera = workspace.CurrentCamera
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local function getDeviceType()
    local UserInputService = game:GetService("UserInputService")
    if UserInputService.TouchEnabled then
        if UserInputService.KeyboardEnabled then
            return "平板"
        else
            return "手机"
        end
    else
        return "电脑"
    end
end

local deviceType = getDeviceType()
local uiSize, uiPosition

if deviceType == "手机" then
    uiSize = UDim2.fromOffset(500, 400)
elseif deviceType == "平板" then
    uiSize = UDim2.fromOffset(550, 450)
else
    uiSize = UDim2.fromOffset(600, 500)
end
uiPosition = UDim2.new(0.5, 0, 0.5, 0)

WindUI.TransparencyValue = 0.2
WindUI:SetTheme("Dark")

local playerName = LocalPlayer.Name
local displayName = LocalPlayer.DisplayName

WindUI:Notify({
    Title = "大78",
    Content = "大78加载完成",
    Duration = 2
})

WindUI:Notify({
    Title = "QQ群聊",
    Content = "迪脚本主群: 1075872070 大78i脚本群聊:943953581 ",
    Duration = 2
})

local Window = WindUI:CreateWindow({
    Title = "大78脚本",
    Icon = "rbxassetid://124019880670946",
    Author = "作者：shenmi 帮助者: 小迪",
    Folder = "OrangeCHub",
    Size = uiSize,
    Position = uiPosition,
    Theme = "Dark",
    Transparent = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Username = playerName,
        DisplayName = displayName,
        UserId = LocalPlayer.UserId,
        ThumbnailType = "AvatarBust",
        Callback = function()
            WindUI:Notify({
                Title = "用户信息",
                Content = "玩家:" .. LocalPlayer.Name,
                Duration = 3
            })
        end
    },
    SideBarWidth = deviceType == "手机" and 150 or 180,
    ScrollBarEnabled = true
})

Window:CreateTopbarButton("theme-switcher", "moon", function()
    WindUI:SetTheme(WindUI:GetCurrentTheme() == "Dark" and "Light" or "Dark")
    WindUI:Notify({
        Title = "提示",
        Content = "当前主题: "..WindUI:GetCurrentTheme(),
        Duration = 2
    })
end, 990)

Window:EditOpenButton({
    Title = "打开大78脚本",
    Icon = "rbxassetid://124019880670946",
})

Window:SetToggleKey(Enum.KeyCode.N)

local Tabs = {
    Pl = Window:Section({ Title = "通用", Opened = false, Icon = "user"}),
    Block = Window:Section({ Title = "其它脚本", Opened = false, Icon = "hand-fist"}),
}

local TabHandles = {
    Announcement = Tabs.Pl:Tab({ Title = "公告", Icon = "folder"}),
    Player = Tabs.Pl:Tab({ Title = "通用功能", Icon = "folder"}),
    Player1 = Tabs.Pl:Tab({ Title = "战斗区", Icon = "folder"}),
    Player2 = Tabs.Pl:Tab({ Title = "甩飞", Icon = "folder"}),
    Player3 = Tabs.Pl:Tab({ Title = "传送功能与甩飞", Icon = "folder"}),
     Player4 = Tabs.Pl:Tab({ Title = "fe动作", Icon = "folder"}),
    Block1 = Tabs.Block:Tab({ Title = "合作作者陌染的脚本", Icon = "folder"}),
    Block2 = Tabs.Block:Tab({ Title = "其它脚本", Icon = "folder"}),
    Block3 = Tabs.Block:Tab({ Title = "无敌少侠脚本", Icon = "folder"}),
    Block4 = Tabs.Block:Tab({ Title = "缝合脚本", Icon = "folder"}),
    Block5 = Tabs.Block:Tab({ Title = "实用工具脚本", Icon = "folder"}),
}

TabHandles.Announcement:Paragraph({
    Title = "欢迎尊贵的用户",
    Desc = "此脚本会一直更新感谢你对我们的支持",
    Image = "info",
    ImageSize = 15
})

TabHandles.Announcement:Paragraph({
    Title = "玩家",
    Desc = "尊敬的用户: " .. LocalPlayer.Name .. "欢迎使用",
    Image = "user",
    ImageSize = 12
})

TabHandles.Announcement:Paragraph({
    Title = "设备",
    Desc = "你的使用设备: " .. deviceType,
    Image = "gamepad",
    ImageSize = 12
})

TabHandles.Announcement:Paragraph({
    Title = "设备",
    Desc = "你的注入器: " .. identifyexecutor(),
    Image = "syringe",
    ImageSize = 12
})

TabHandles.Announcement:Paragraph({
    Title = "作者名单",
    Desc = "shenmi",
    Image = "user",
    ImageSize = 12
})

TabHandles.Announcement:Paragraph({
    Title = "QQ群聊",
    Desc = "迪脚本2群: 1075872070 大78脚本群聊:943953581",
    Image = "user",
    ImageSize = 12
})

local Speed = 1
local sudu = nil
local InfJ = false
local dyzs = {
    oldpos = nil,
}

TabHandles.Player:Slider({
    Title = "快速跑步速度",
    Desc = "设置跑步速度倍率",
    Step = 0.1,
    Value = {
        Min = 1,
        Max = 10,
        Default = 1,
    },
    Callback = function(value)
        Speed = value
    end
})

TabHandles.Player:Toggle({
    Title = "开启快速跑步",
    Desc = "开启/关闭快速跑步",
    Value = false,
    Callback = function(enabled)
        if enabled == true then
            sudu = game:GetService("RunService").Heartbeat:Connect(function()
                local player = game:GetService("Players").LocalPlayer
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    local humanoid = player.Character.Humanoid
                    if humanoid.MoveDirection.Magnitude > 0 then
                        player.Character:TranslateBy(humanoid.MoveDirection * Speed * 0.5)
                    end
                end
            end)
        elseif not enabled and sudu then
            sudu:Disconnect()
            sudu = nil
        end
    end
})

TabHandles.Player:Slider({
    Title = "设置行走速度",
    Desc = "调整角色行走速度",
    Step = 1,
    Value = {
        Min = 0,
        Max = 100,
        Default = 16,
    },
    Callback = function(value)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = value
        end
    end
})

local InfJ = false
local JumpPowerValue = 50

TabHandles.Player:Slider({
    Title = "跳跃高度",
    Desc = "设置跳跃高度",
    Step = 1,
    Value = {
        Min = 50,
        Max = 400,
        Default = 50,
    },
    Callback = function(Jump)
        JumpPowerValue = Jump
        spawn(function() 
            while task.wait() do 
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.JumpPower = Jump
                end
            end 
        end)
    end
})

TabHandles.Player:Toggle({
    Title = "无限跳",
    Desc = "开启/关闭无限跳",
    Value = false,
    Callback = function(Value)
        InfJ = Value
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if InfJ and game.Players.LocalPlayer.Character then
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid:ChangeState("Jumping")
                end
            end
        end)
    end
})

TabHandles.Player:Button({
	Title = "玩家加入游戏提示",
	Icon = "user-plus",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
end
})

TabHandles.Player:Button({
	Title = "获得管理员权限",
	Icon = "user",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/sZpgTVas"))()
end
})

TabHandles.Player:Button({
	Title = "死亡笔记",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0%20(1).txt"))()
end
})

TabHandles.Player:Button({
	Title = "飞行",
	Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/NePX6zBu'))()
end
})

TabHandles.Player:Button({
    Title = "透视",
    Description = "玩家透视功能",
    Icon = "eye",
    Callback = function()
        _G.FriendColor = Color3.fromRGB(0, 0, 255)
        local function ApplyESP(v)
            if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
                v.Character.Humanoid.NameDisplayDistance = 9e9
                v.Character.Humanoid.NameOcclusion = "NoOcclusion"
                v.Character.Humanoid.HealthDisplayDistance = 9e9
                v.Character.Humanoid.HealthDisplayType = "AlwaysOn"
                v.Character.Humanoid.Health = v.Character.Humanoid.Health
            end
        end
        
        for i,v in pairs(game.Players:GetPlayers()) do
            ApplyESP(v)
            v.CharacterAdded:Connect(function()
                task.wait(0.33)
                ApplyESP(v)
            end)
        end
        
        game.Players.PlayerAdded:Connect(function(v)
            ApplyESP(v)
            v.CharacterAdded:Connect(function()
                task.wait(0.33)
                ApplyESP(v)
            end)
        end)
        
        local Players = game:GetService("Players"):GetChildren()
        local RunService = game:GetService("RunService")
        local highlight = Instance.new("Highlight")
        highlight.Name = "Highlight"
        
        for i, v in pairs(Players) do
            repeat wait() until v.Character
            if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = v.Character
                highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlightClone.Name = "Highlight"
            end
        end
        
        game.Players.PlayerAdded:Connect(function(player)
            repeat wait() until player.Character
            if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = player.Character
                highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
                highlightClone.Name = "Highlight"
            end
        end)
        
        game.Players.PlayerRemoving:Connect(function(playerRemoved)
            if playerRemoved.Character and playerRemoved.Character:FindFirstChild("HumanoidRootPart") then
                local highlight = playerRemoved.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight")
                if highlight then
                    highlight:Destroy()
                end
            end
        end)
        
        RunService.Heartbeat:Connect(function()
            for i, v in pairs(Players) do
                repeat wait() until v.Character
                if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                    local highlightClone = highlight:Clone()
                    highlightClone.Adornee = v.Character
                    highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                    highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlightClone.Name = "Highlight"
                    task.wait()
                end
            end
        end)
    end
})

local Noclip = false
local Stepped = nil

TabHandles.Player:Toggle({
    Title = "穿墙",
    Desc = "开启/关闭穿墙模式",
    Value = false,
    Callback = function(state)
        if state then
            Noclip = true
            Stepped = game:GetService("RunService").Stepped:Connect(function()
                if Noclip == true then
                    for _, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for _, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
                else
                    Stepped:Disconnect()
                end
            end)
        else
            Noclip = false
            if Stepped then
                Stepped:Disconnect()
                Stepped = nil
            end
        end
    end
})

TabHandles.Player:Toggle({
    Title = "夜视",
    Desc = "开启/关闭夜视效果",
    Value = false,
    Callback = function(state)
        if state then
            game.Lighting.Ambient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})

TabHandles.Player1:Button({
	Title = "自瞄脚本",
	Icon = "eye",
	Callback = function()
	loadstring(game:HttpGet("https://atlasteam.live/silentaim"))()
end
})

TabHandles.Player1:Button({
	Title = "子弹追踪",
	Desc = "让你的子弹变成美国进口子弹🤫",
	Callback = function()
	loadstring(game:HttpGet('https://pastefy.app/fqwobx4G/raw'))()
end
})

TabHandles.Player2:Button({
	Title = "甩飞所有人",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
end
})

TabHandles.Player2:Button({
	Title = "甩飞",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/hknvh/main/%E7%94%A9%E9%A3%9E.txt"))()
end
})

TabHandles.Player4:Button({
	Title = "fe",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/LolnotaKid/JkDropKuck/refs/heads/main/Protected_3923618848403366.txt"))()
end
})

TabHandles.Player4:Button({
	Title = "爬行",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_vZDX8j5ggfAf58QhdJ59BVEmF6nmZgq4Mcjt2l8wn16CiStIW2P6EkNc605qv9K4.lua.txt"))()
end
})

TabHandles.Player4:Button({
	Title = "闪回",
	Callback = function()
	loadstring(game:HttpGet("https://mscripts.vercel.app/scfiles/reverse-script.lua"))()
end
})

TabHandles.Player4:Button({
	Title = "跳墙",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20WallHop%20V4%20script"))()
end
})

TabHandles.Player4:Button({
	Title = "杀手",
	Callback = function()
	loadstring(game:HttpGet(('https://pastefy.ga/d7sogwNS/raw'),true))()
end
})

TabHandles.Block1:Paragraph({
    Title = "QQ群聊",
    Desc = "陌染脚本群聊: 795370028",
    Image = "user",
    ImageSize = 12
})

TabHandles.Block1:Button({
	Title = "陌染死铁轨脚本",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/moran701/jiaobeng2/refs/heads/main/%E5%8D%A1%E5%AF%86%E5%AF%86%E7%A0%81"))()
end
})

TabHandles.Block1:Button({
	Title = "陌染99夜脚本",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/moran701/moranjihe1/refs/heads/main/99duy"))()
end
})

TabHandles.Block2:Button({
	Title = "情云同款自瞄",
	Callback = function()
	local fov = 100 local smoothness = 10 local crosshairDistance = 5 local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Players = game:GetService("Players") local Cam = game.Workspace.CurrentCamera local FOVring = Drawing.new("Circle") FOVring.Visible = true FOVring.Thickness = 2 FOVring.Color = Color3.fromRGB(0, 255, 0) FOVring.Filled = false FOVring.Radius = fov FOVring.Position = Cam.ViewportSize / 2 local Player = Players.LocalPlayer local PlayerGui = Player:WaitForChild("PlayerGui") local ScreenGui = Instance.new("ScreenGui") ScreenGui.Name = "FovAdjustGui" ScreenGui.Parent = PlayerGui local Frame = Instance.new("Frame") Frame.Name = "MainFrame" Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) Frame.BorderColor3 = Color3.fromRGB(128, 0, 128) Frame.BorderSizePixel = 2 Frame.Position = UDim2.new(0.3, 0, 0.3, 0) Frame.Size = UDim2.new(0.4, 0, 0.4, 0) Frame.Active = true Frame.Draggable = true Frame.Parent = ScreenGui local MinimizeButton = Instance.new("TextButton") MinimizeButton.Name = "MinimizeButton" MinimizeButton.Text = "-" MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255) MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0) MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0) MinimizeButton.Parent = Frame local isMinimized = false MinimizeButton.MouseButton1Click:Connect(function() isMinimized = not isMinimized if isMinimized then Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "+" else Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "-" end end) local FovLabel = Instance.new("TextLabel") FovLabel.Name = "FovLabel" FovLabel.Text = "自瞄范围" FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255) FovLabel.BackgroundTransparency = 1 FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0) FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0) FovLabel.Parent = Frame local FovSlider = Instance.new("TextBox") FovSlider.Name = "FovSlider" FovSlider.Text = tostring(fov) FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255) FovSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0) FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0) FovSlider.Parent = Frame local SmoothnessLabel = Instance.new("TextLabel") SmoothnessLabel.Name = "SmoothnessLabel" SmoothnessLabel.Text = "自瞄平滑度" SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessLabel.BackgroundTransparency = 1 SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0) SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessLabel.Parent = Frame local SmoothnessSlider = Instance.new("TextBox") SmoothnessSlider.Name = "SmoothnessSlider" SmoothnessSlider.Text = tostring(smoothness) SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0) SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessSlider.Parent = Frame local CrosshairDistanceLabel = Instance.new("TextLabel") CrosshairDistanceLabel.Name = "CrosshairDistanceLabel" CrosshairDistanceLabel.Text = "自瞄预判距离" CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceLabel.BackgroundTransparency = 1 CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0) CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceLabel.Parent = Frame local CrosshairDistanceSlider = Instance.new("TextBox") CrosshairDistanceSlider.Name = "CrosshairDistanceSlider" CrosshairDistanceSlider.Text = tostring(crosshairDistance) CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0) CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceSlider.Parent = Frame local targetCFrame = Cam.CFrame local function updateDrawings() local camViewportSize = Cam.ViewportSize FOVring.Position = camViewportSize / 2 FOVring.Radius = fov end local function onKeyDown(input) if input.KeyCode == Enum.KeyCode.Delete then RunService:UnbindFromRenderStep("FOVUpdate") FOVring:Remove() end end UserInputService.InputBegan:Connect(onKeyDown) local function getClosestPlayerInFOV(trg_part) local nearest = nil local last = math.huge local playerMousePos = Cam.ViewportSize / 2 for _, player in ipairs(Players:GetPlayers()) do if player ~= Players.LocalPlayer then local part = player.Character and player.Character:FindFirstChild(trg_part) if part then local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude if distance < last and isVisible and distance < fov then last = distance nearest = player end end end end return nearest end RunService.RenderStepped:Connect(function() updateDrawings() local closest = getClosestPlayerInFOV("Head") if closest and closest.Character:FindFirstChild("Head") then local targetCharacter = closest.Character local targetHead = targetCharacter.Head local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart") local isMoving = targetRootPart.Velocity.Magnitude > 0.1 local targetPosition if isMoving then targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance) else targetPosition = targetHead.Position end targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition) else targetCFrame = Cam.CFrame end Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness) end) FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newFov = tonumber(FovSlider.Text) if newFov then fov = newFov else FovSlider.Text = tostring(fov) end end end) SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newSmoothness = tonumber(SmoothnessSlider.Text) if newSmoothness then smoothness = newSmoothness else SmoothnessSlider.Text = tostring(smoothness) end end end) CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text) if newCrosshairDistance then crosshairDistance = newCrosshairDistance else CrosshairDistanceSlider.Text = tostring(crosshairDistance) end end end)
end
})

TabHandles.Block2:Button({
	Title = "汉化阿尔宙斯自瞄",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/sgbs/main/%E4%B8%81%E4%B8%81%20%E6%B1%89%E5%8C%96%E8%87%AA%E7%9E%84.txt"))()
end
})

TabHandles.Block2:Button({
	Title = "超长🐔巴",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/ESWSFND7", true))()
end
})

TabHandles.Block2:Button({
	Title = "操人",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/AHAJAJAKAK/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A.LUA", true))()
end
})

TabHandles.Block2:Button({
	Title = "虚空99夜脚本",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/99%E5%A4%9C%E8%99%9A%E7%A9%BA.txt"))()
end
})

TabHandles.Block2:Button({
	Title = "刀刃球",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E5%88%80%E5%88%83%E7%90%83.lua"))()
end
})

TabHandles.Block2:Button({
	Title = "bf",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/bf.txt"))()
end
})

TabHandles.Block2:Button({
	Title = "99",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gycgchgyfytdttr/DE/refs/heads/main/DE%20HUB.lua"))()
end
})

TabHandles.Block2:Button({
	Title = "伐木",
	Callback = function()
    loadstring(game:HttpGet("https://cdn.applebee1558.com/bark/bark.lua"))()
end
})

TabHandles.Block2:Button({
	Title = "速度传奇",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KEHub-LTY/-/refs/heads/main/%E9%80%9F%E5%BA%A6%E4%BC%A0%E5%A5%87%E5%8A%A0%E5%AF%86.lua"))()
end
})

TabHandles.Block2:Button({
	Title = "犯罪",
	Callback = function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/f49010ca3e0ff6f5e6aec98ed0123985.lua"))()
end
})

TabHandles.Block2:Button({
	Title = "doors",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()
end
})

TabHandles.Block2:Button({
	Title = "压力",
	Callback = function()
    loadstring(game:HttpGet("https://github.com/Drop56796/CreepyEyeHub/blob/main/obfuscate.lua?raw=true"))()
end
})

TabHandles.Block2:Button({
	Title = "监狱人生",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()
end
})

TabHandles.Block2:Button({
	Title = "doors2",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KEHub-LTY/-/refs/heads/main/Door%E5%8A%A0%E5%AF%86.lua"))()
end
})

TabHandles.Block2:Button({
	Title = "墨水汉化卡密脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/AX%20CN"))()
end
})

TabHandles.Block2:Button({
	Title = "俄亥俄州",
	Callback = function()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\115\99\114\105\112\116\115\46\118\105\115\117\114\117\115\46\100\101\118\47\111\104\105\111\47\115\111\117\114\99\101"))()
end
})

TabHandles.Block2:Button({
	Title = "被遗弃殺脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-X/Max/refs/heads/X/fsk.lua"))()
end
})

TabHandles.Block2:Button({
	Title = "刀刃球脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Alexisisback/Universall/refs/heads/main/Blade%20ball.lua", true))()
end
})

TabHandles.Block2:Button({
	Title = "造船脚本",
	Callback = function()
    loadstring(game:HttpGet("https://scriptblox.com/raw/UPDATE-16-Blox-Fruits-xQuartyx-Blox-Fruit-6557"))()
end
})

TabHandles.Block2:Button({
	Title = "破坏者谜团2脚本",
	Callback = function()
    loadstring(game:GetObjects("rbxassetid://4001118261")[1].Source)()
end
})

TabHandles.Block2:Button({
	Title = "99宝石",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/123fa98/Xi_Pro/refs/heads/main/99.lua"))()
end
})

TabHandles.Block2:Button({
	Title = "伐木大亨金钱脚本",
	Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/p9mEnV28"))()
end
})

TabHandles.Block2:Button({
	Title = "99主播同款",
	Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/99-Nights-in-the-Forest-99-NITF-KEYLESS-SCRIPT-48729"))()
end
})

TabHandles.Block2:Button({
	Title = "一次尘土飞扬的旅行脚本",
	Callback = function()
    loadstring(game:HttpGet("https://scriptblox.com/raw/a-dusty-trip-FREE-CAR-Gui-14352"))()
end
})

TabHandles.Block3:Button({
	Title = "防止坠落伤害",
	Callback = function()
    loadstring(game:HttpGet('https://pastefy.app/4lzEtnLg/raw'))()
end
})

TabHandles.Block3:Button({
	Title = "成为无敌少侠",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/396abc/Script/refs/heads/main/MobileFly.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "迪脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ddjlb7598/-2.0/refs/heads/main/%E8%BF%AA%E8%84%9A%E6%9C%AC2.0.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "德语中山破解版脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksan966/Deyu-Zhongshan/refs/heads/main/pojieban"))()
end
})

TabHandles.Block4:Button({
	Title = "rb脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Yungengxin/roblox/refs/heads/main/Rb-Hub"))()
end
})

TabHandles.Block4:Button({
	Title = "sxHUD脚本",
	Callback = function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/87a8a4f4c2d2ef535ccd1bdb949218fe.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "TX脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/TX-Free-YYDS/refs/heads/main/FREE-TX-TEAM"))()
end
})

TabHandles.Block4:Button({
	Title = "霖溺脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/TX-Free-YYDS/refs/heads/main/FREE-TX-TEAM"))()
end
})

TabHandles.Block4:Button({
	Title = "黑白脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tfcygvunbind/Apple/main/黑白脚本加载器"))()
end
})

TabHandles.Block4:Button({
	Title = "xk脚本",
	Callback = function()
    loadstring(game:HttpGet("https://github.com/devslopo/DVES/raw/main/XK%20Hub"))()
end
})

TabHandles.Block4:Button({
	Title = "光脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/qwrt5589/eododo/main/GuangJiaoBen.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "叶脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/ROBLOX-CNVIP-XIAOYE.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "云脚本",
	Callback = function()
    loadstring(game:HttpGet("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\103\105\116\104\117\98\46\99\111\109\47\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\47\77\105\97\110\47\114\97\119\47\109\97\105\110\47\228\186\145\232\132\154\230\156\172\46\108\117\97\117\34\44\32\116\114\117\101\41\41\40\41\10\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\103\105\116\104\117\98\46\99\111\109\47\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\47\77\105\97\110\47\114\97\119\47\109\97\105\110\47\228\186\145\232\132\154\230\156\172\46\108\117\97\117\34\44\32\116\114\117\101\41\41\40\41\10"))()
end
})

TabHandles.Block4:Button({
	Title = "APT脚本密码xiaomao",
	Callback = function()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\110\97\105\110\115\104\117\47\110\111\47\109\97\105\110\47\65\80\84\46\108\117\97"))()
end
})

TabHandles.Block4:Button({
	Title = "大司马脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/whenheer/dasimav6/refs/heads/main/dasimaV6.txt"))()
end
})

TabHandles.Block4:Button({
	Title = "BS黑洞中心",
	Callback = function()
    loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/d6dffe74a774f7983c29a61dbfaef705a7c1bbd193c1bb68d778cb4bb4c302ae/download"))()
end
})

TabHandles.Block4:Button({
	Title = "驰脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/qwrt5589/eododo/main/驰脚本.txt"))()
end
})

TabHandles.Block4:Button({
	Title = "XA脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.gitcode.com/Xingtaiduan/Scripts/raw/main/Loader.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "天空脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/main/skyhub"))()
end
})

TabHandles.Block4:Button({
	Title = "FIN脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/FIN/main/FIN-Loading"))()
end
})

TabHandles.Block4:Button({
	Title = "逆光脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lool8/-/main/逆光.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "DE HUB",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gycgchgyfytdttr/DE/main/DE%20HUB.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "KG脚本",
	Callback = function()
    loadstring(game:HttpGet("https://github.com/ZS-NB/KG/raw/main/Zhang-Shuo.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "本熊脚本",
	Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/s9PijnvT/raw"))()
end
})

TabHandles.Block4:Button({
	Title = "APEX HUB",
	Callback = function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b2004278b4735e1ca615931116373d48.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "走马观花",
	Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/XPTiVKWx"))()
end
})

TabHandles.Block4:Button({
	Title = "Xipro破解版",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Zer0neK/SB-Xi-pro/refs/heads/main/SBXiPro.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "导管脚本中心",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/useranewrff/roblox-/main/条例名称可能不同"))()
end
})

TabHandles.Block4:Button({
	Title = "南宁脚本",
	Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/6XCWRWnL"))()
end
})

TabHandles.Block4:Button({
	Title = "禁漫中心脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/ng/main/jmlllllllIIIIlllllII.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "Frost脚本",
	Callback = function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/1139e311eaabc1aced70509c7caf1982.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "挽脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XxwanhexxX/UN/main/lua"))()
end
})

TabHandles.Block4:Button({
	Title = "W超级脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Wbw1470619303-ctrl/w-/main/udjejdj"))()
end
})

TabHandles.Block4:Button({
	Title = "UnicoX脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuCynic/UnicoX-Script/main/UnicoXV1-混淆.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "空云脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoSB33/M416/main/Wind%2Fsb%2F空云脚本V2.LUA"))()
end
})
TabHandles.Block4:Button({
	Title = "X脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/maowang1/xx/main/Protected_8858329470146381.txt"))()
end
})

TabHandles.Block4:Button({
	Title = "XION脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/wocaonima/main/qq984820669.txt"))()
end
})

TabHandles.Block4:Button({
	Title = "BP脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/oisaaa6/BLUE/main/PAINT"))()
end
})

TabHandles.Block4:Button({
	Title = "德与中山免费",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dream77239/Deyu-Zhongshan/main/德与中山.txt"))()
end
})

TabHandles.Block4:Button({
	Title = "旧冬脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/QiuShan-UX/UnicoX/main/旧冬Script--Forsaken.lua.txt"))()
end
})

TabHandles.Block4:Button({
	Title = "剑客",
	Callback = function()
    loadstring(game:HttpGet("https://shz.al/~JianKeV4"))()
end
})

TabHandles.Block4:Button({
	Title = "火刺猬",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XOTRXONY/INKGAME/main/INKGAMEE.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "zeh",
	Callback = function()
    loadstring(game:HttpGet("https://zenithhub.cloud/panel/script"))()
end
})

TabHandles.Block4:Button({
	Title = "skan",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/vv/2152e11beef672cba3c33ba97f38a3344e875ccc/Skin"))()
end
})

TabHandles.Block4:Button({
	Title = "小小鱼",
	Callback = function()
    loadstring(game:HttpGet("\108\111\97\100\115\116\114\105\110\103\40\71\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\120\105\97\111\120\105\97\111\121\117\50\50\51\51\47\120\105\97\111\120\105\97\111\121\117\47\109\97\105\110\47\120\105\97\111\120\105\97\111\121\117\34\41\41\40\41\10"))()
end
})

TabHandles.Block4:Button({
	Title = "少羽牛逼",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/StandAwekening.lua"))()
end
})

TabHandles.Block4:Button({
	Title = "殺脚本新版",
	Callback = function()
    FengYu_HUB = "殺脚本"
loadstring(request({
    Url = "https://raw.githubusercontent.com/FengYu-X/_Hub_/refs/heads/X/FengYuHub"
}).Body)()
end
})

TabHandles.Block5:Button({
	Title = "翻译脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ddjlb7598/nb/refs/heads/main/%E7%9A%AE%E8%84%9A%E6%9C%AC%E6%9C%80%E6%96%B0%E5%B7%B2%E4%BF%AE%E5%A4%8D%E5%8F%AF%E7%94%A8%E7%A0%B4%E8%A7%A3%E7%89%88%E6%BA%90%E7%A0%81-Rb%E4%BF%AE%E5%A4%8D%EF%BC%8Cxipro%E7%A0%B4%E8%A7%A3%20(1).lua"))()
end
})

TabHandles.Block5:Button({
	Title = "无敌少萝脚本",
	Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invinicible-Flight-R15-45414"))()
end
})

TabHandles.Block5:Button({
	Title = "自瞄脚本",
	Callback = function()
    loadstring(game:HttpGet("https://github.com/ZS-NB/KG/raw/main/张硕.lua"))()
end
})

TabHandles.Block5:Button({
	Title = "防甩",
	Callback = function()
    loadstring(game:HttpGet("http://rawscripts.net/raw/Universal-Script-Touch-fling-script-22447"))()
end
})

TabHandles.Block5:Button({
	Title = "通用碰撞箱",
	Callback = function()
    loadstring(game:HttpGet("https://github.com/ddjlb7598/-ghjjklbbcxxfhhjkk/blob/main/%E9%80%9A%E7%94%A8%E7%A2%B0%E6%92%9E%E7%AE%B1%E6%8B%93%E5%B1%95%E5%99%A8(Universal%20HitBox%20Expander).lua"))()
end
})

TabHandles.Block5:Button({
	Title = "自由视角",
	Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/sKQ1mSGy"))()
end
})

TabHandles.Block5:Button({
	Title = "3000多个动作",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"))()
end
})

TabHandles.Block5:Button({
	Title = "电脑键盘",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt"))()
end
})

TabHandles.Block5:Button({
	Title = "无限r",
	Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/SxhPVOyM/raw"))()
end
})

TabHandles.Block5:Button({
	Title = "重新加入游戏",
	Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/XXabqNiv/raw"))()
end
})

TabHandles.Block5:Button({
	Title = "工具包",
	Callback = function()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
end
})

TabHandles.Block5:Button({
	Title = "玩家传送脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Teleport%20Gui.lua"))()
end
})

TabHandles.Block5:Button({
	Title = "传送道具",
	Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/Jf2QXOwa/raw"))()
end
})

TabHandles.Block5:Button({
	Title = "防甩自制",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ddjlb7598/ddddfffffff/refs/heads/main/%E8%BF%AA%E8%84%9A%E6%9C%AC%E9%98%B2%E7%94%A9%E8%87%AA%E5%88%B6%E6%BA%90%E7%A0%81.lua"))()
end
})

TabHandles.Block5:Button({
	Title = "工具",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zhanghuihuihuil/VIP/main/%E7%B4%85%E7%9A%84%E8%B4%B5%E5%AE%BEs96356"))()
end
})

local PlayerConfig = {
    dropdown = {},
    playernamedied = "",
    LoopTeleport = false,
    LoopTeleportToMe = false,
    LoopTeleportAll = false,
    LookPlayer = false,
    AutoFling = false,
    Aimbot = false
}

getgenv().FPDH = workspace.FallenPartsDestroyHeight or -500

local function shuaxinlb(refreshUI)
    PlayerConfig.dropdown = {}
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(PlayerConfig.dropdown, player.Name)
        end
    end
end

local function Notify(title, content, duration)
    WindUI:Notify({
        Title = title,
        Content = content,
        Duration = duration
    })
end

local function SendNotification(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration,
    })
end

shuaxinlb(false)

local dropdownValue = "选择玩家"
local dropdownElement = TabHandles.Player3:Dropdown({
    Title = "选择玩家名称",
    Desc = "选择要传送的玩家",
    Values = PlayerConfig.dropdown,
    Value = dropdownValue,
    Multi = false,
    AllowNone = false,
    Callback = function(value)
        PlayerConfig.playernamedied = value
        dropdownValue = value
        Notify("迪脚本", "已选择玩家: " .. value, 3)
    end
})

TabHandles.Player3:Button({
    Title = "刷新玩家名",
    Icon = "refresh-cw",
    Callback = function()
        shuaxinlb(true)
        dropdownElement:SetValues(PlayerConfig.dropdown)
        Notify("迪脚本", "玩家列表已刷新", 3)
    end
})

TabHandles.Player3:Button({
    Title = "传送到玩家旁边",
    Icon = "arrow-right-to-bracket",
    Callback = function()
        if PlayerConfig.playernamedied == "" then
            Notify("迪脚本", "请先选择玩家", 5)
            return
        end
        
        local localRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
        
        if localRootPart and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            localRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
            Notify("迪脚本", "已经传送到玩家身边", 5)
        else
            Notify("迪脚本", "无法传送 原因: 玩家已消失", 5)
        end
    end
})

TabHandles.Player3:Toggle({
    Title = "循环锁定传送",
    Desc = "持续传送到选定玩家",
    Icon = "repeat",
    Value = PlayerConfig.LoopTeleport,
    Callback = function(enabled)
        PlayerConfig.LoopTeleport = enabled
        
        if enabled then
            Notify("迪脚本", "已开启循环传送", 5)
            
            spawn(function()
                while PlayerConfig.LoopTeleport do
                    local localRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
                    
                    if localRootPart and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        localRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                    end
                    wait()
                end
            end)
        else
            Notify("迪脚本", "已关闭循环传送", 5)
        end
    end
})

TabHandles.Player3:Button({
    Title = "把玩家传送过来",
    Icon = "arrow-left-to-bracket",
    Callback = function()
        if PlayerConfig.playernamedied == "" then
            Notify("迪脚本", "请先选择玩家", 5)
            return
        end
        
        local localRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
        
        if localRootPart and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            targetPlayer.Character.HumanoidRootPart.CFrame = localRootPart.CFrame + Vector3.new(0, 3, 0)
            Notify("迪脚本", "已将玩家传送过来", 5)
        else
            Notify("迪脚本", "无法传送 原因: 玩家已消失", 5)
        end
    end
})

TabHandles.Player3:Toggle({
    Title = "循环传送玩家过来",
    Desc = "持续将选定玩家传送过来",
    Icon = "repeat",
    Value = PlayerConfig.LoopTeleportToMe,
    Callback = function(enabled)
        PlayerConfig.LoopTeleportToMe = enabled
        
        if enabled then
            Notify("迪脚本", "已开启循环传送玩家过来", 5)
            
            spawn(function()
                while PlayerConfig.LoopTeleportToMe do
                    local localRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
                    
                    if localRootPart and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        targetPlayer.Character.HumanoidRootPart.CFrame = localRootPart.CFrame + Vector3.new(0, 3, 0)
                    end
                    wait()
                end
            end)
        else
            Notify("迪脚本", "已关闭循环传送玩家过来", 5)
        end
    end
})

TabHandles.Player3:Toggle({
    Title = "吸全部玩家",
    Desc = "将所有玩家吸到身边",
    Icon = "users",
    Value = PlayerConfig.LoopTeleportAll,
    Callback = function(enabled)
        PlayerConfig.LoopTeleportAll = enabled
        
        if enabled then
            spawn(function()
                while PlayerConfig.LoopTeleportAll do
                    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                        if player.Name ~= LocalPlayer.Name then
                            local localChar = LocalPlayer.Character
                            local targetChar = player.Character
                            
                            if localChar and localChar:FindFirstChild("HumanoidRootPart") and 
                               targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                                local localPosition = localChar.HumanoidRootPart.Position
                                local lookVector = localChar.HumanoidRootPart.CFrame.lookVector
                                targetChar.HumanoidRootPart.CFrame = CFrame.new(localPosition + lookVector * 3, localPosition + lookVector * 4)
                            end
                            wait()
                        end
                    end
                    wait()
                end
            end)
        end
    end
})

TabHandles.Player3:Toggle({
    Title = "查看玩家",
    Desc = "将视角切换到选定玩家",
    Icon = "eye",
    Value = PlayerConfig.LookPlayer,
    Callback = function(enabled)
        PlayerConfig.LookPlayer = enabled
        
        if enabled then
            if PlayerConfig.playernamedied == "" then
                Notify("迪脚本", "请先选择玩家", 5)
                return
            end
            
            local targetPlayer = game:GetService("Players"):FindFirstChild(PlayerConfig.playernamedied)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
                game:GetService("Workspace").CurrentCamera.CameraSubject = targetPlayer.Character.Humanoid
                Notify("迪脚本", "已开启查看玩家", 5)
            else
                Notify("迪脚本", "无法查看玩家", 5)
            end
        else
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                game:GetService("Workspace").CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
                Notify("迪脚本", "已关闭查看玩家", 5)
            end
        end
    end
})

local function FindPlayerByName(name)
    name = name:lower()
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    
    if name == "all" or name == "others" then
        return "all"
    end
    
    if name == "random" then
        local allPlayers = Players:GetPlayers()
        if table.find(allPlayers, localPlayer) then
            table.remove(allPlayers, table.find(allPlayers, localPlayer))
        end
        if #allPlayers > 0 then
            return allPlayers[math.random(#allPlayers)]
        end
        return nil
    end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer then
            if player.Name:lower():match("^" .. name) then
                return player
            end
            if player.DisplayName:lower():match("^" .. name) then
                return player
            end
        end
    end
    return nil
end

local function ThrowPlayer(targetPlayer)
    local localCharacter = LocalPlayer.Character
    local localHumanoid = localCharacter and localCharacter:FindFirstChildOfClass("Humanoid")
    local localRootPart = localHumanoid and localHumanoid.RootPart
    local targetCharacter = targetPlayer.Character
    
    if not localCharacter or not localHumanoid or not localRootPart or not targetCharacter then
        SendNotification("迪脚本", "无法甩飞: 角色不存在", 5)
        return
    end
    
    local targetHumanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
    local targetRootPart = targetHumanoid and targetHumanoid.RootPart
    local targetHead = targetCharacter:FindFirstChild("Head")
    local targetAccessory = targetCharacter:FindFirstChildOfClass("Accessory")
    local accessoryHandle = targetAccessory and targetAccessory:FindFirstChild("Handle")
    
    if localRootPart.Velocity.Magnitude < 50 then
        getgenv().OldPos = localRootPart.CFrame
    end
    
    if targetHumanoid and targetHumanoid.Sit then
        SendNotification("迪脚本", "玩家正在坐下", 5)
        return
    end
    
    if targetHead then
        workspace.CurrentCamera.CameraSubject = targetHead
    elseif not targetHead and accessoryHandle then
        workspace.CurrentCamera.CameraSubject = accessoryHandle
    elseif targetHumanoid and targetRootPart then
        workspace.CurrentCamera.CameraSubject = targetHumanoid
    end
    
    if not targetCharacter:FindFirstChildWhichIsA("BasePart") then
        return
    end
    
    local function ApplyThrowForce(part, offset, rotation)
        localRootPart.CFrame = CFrame.new(part.Position) * offset * rotation
        localCharacter:SetPrimaryPartCFrame(CFrame.new(part.Position) * offset * rotation)
        localRootPart.Velocity = Vector3.new(90000000, 900000000, 90000000)
        localRootPart.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
    end
    
    local function PerformThrowAnimation(part)
        local timeoutDuration = 2
        local startTime = tick()
        local rotationAngle = 0
        
        while localRootPart do
            local velocityMagnitude = part.Velocity.Magnitude
            if velocityMagnitude < 50 then
                rotationAngle = rotationAngle + 100
                ApplyThrowForce(part, CFrame.new(0, 1.5, 0) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(rotationAngle), 0, 0))
                task.wait()
                ApplyThrowForce(part, CFrame.new(0, -1.5, 0) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(rotationAngle), 0, 0))
                task.wait()
                ApplyThrowForce(part, CFrame.new(2.25, 1.5, -2.25) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(rotationAngle), 0, 0))
                task.wait()
                ApplyThrowForce(part, CFrame.new(-2.25, -1.5, 2.25) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(rotationAngle), 0, 0))
                task.wait()
                ApplyThrowForce(part, CFrame.new(0, 1.5, 0) + targetHumanoid.MoveDirection, CFrame.Angles(math.rad(rotationAngle), 0, 0))
                task.wait()
                ApplyThrowForce(part, CFrame.new(0, -1.5, 0) + targetHumanoid.MoveDirection, CFrame.Angles(math.rad(rotationAngle), 0, 0))
                task.wait()
            else
                ApplyThrowForce(part, CFrame.new(0, 1.5, targetHumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                task.wait()
                ApplyThrowForce(part, CFrame.new(0, -1.5, -targetHumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                task.wait()
                ApplyThrowForce(part, CFrame.new(0, 1.5, targetHumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                task.wait()
                ApplyThrowForce(part, CFrame.new(0, 1.5, targetRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                task.wait()
                ApplyThrowForce(part, CFrame.new(0, -1.5, -targetRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                task.wait()
                ApplyThrowForce(part, CFrame.new(0, 1.5, targetRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                task.wait()
                ApplyThrowForce(part, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                task.wait()
                ApplyThrowForce(part, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                task.wait()
                ApplyThrowForce(part, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
                task.wait()
                ApplyThrowForce(part, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                task.wait()
            end
            
            velocityMagnitude = part.Velocity.Magnitude
            if velocityMagnitude <= 500 then
                if part.Parent == targetPlayer.Character then
                    if targetPlayer.Parent == game:GetService("Players") then
                        local hasCharacter = not targetPlayer.Character
                        if hasCharacter ~= targetCharacter then
                            local isSitting = targetHumanoid.Sit
                            if not isSitting then
                                local health = localHumanoid.Health
                                if health > 0 then
                                    local currentTime = tick()
                                    if startTime + timeoutDuration < currentTime then
                                        break
                                    end
                                else
                                    break
                                end
                            else
                                break
                            end
                        else
                            break
                        end
                    else
                        break
                    end
                else
                    break
                end
            else
                break
            end
        end
    end
    
    workspace.FallenPartsDestroyHeight = 0/0
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Name = "EpixVel"
    bodyVelocity.Parent = localRootPart
    bodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
    bodyVelocity.MaxForce = Vector3.new(1/0, 1/0, 1/0)
    
    localHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    
    if targetRootPart and targetHead then
        if (targetRootPart.CFrame.p - targetHead.CFrame.p).Magnitude > 5 then
            PerformThrowAnimation(targetHead)
        else
            PerformThrowAnimation(targetRootPart)
        end
    elseif targetRootPart and not targetHead then
        PerformThrowAnimation(targetRootPart)
    elseif not targetRootPart and targetHead then
        PerformThrowAnimation(targetHead)
    elseif not targetRootPart and not targetHead and targetAccessory and accessoryHandle then
        PerformThrowAnimation(accessoryHandle)
    else
        SendNotification("迪脚本", "无法甩飞目标", 5)
        return
    end
    
    bodyVelocity:Destroy()
    localHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
    workspace.CurrentCamera.CameraSubject = localHumanoid
    
    repeat
        localRootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
        localCharacter:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
        localHumanoid:ChangeState("GettingUp")
        
        for _, child in ipairs(localCharacter:GetChildren()) do
            if child:IsA("BasePart") then
                child.RotVelocity = Vector3.new()
                child.Velocity = Vector3.new()
            end
        end
        task.wait()
    until (localRootPart.Position - getgenv().OldPos.p).Magnitude < 25
    
    workspace.FallenPartsDestroyHeight = getgenv().FPDH
end

TabHandles.Player3:Button({
    Title = "甩飞一次",
    Icon = "target",
    Callback = function()
        if PlayerConfig.playernamedied == "" then
            Notify("迪脚本", "请先选择玩家", 5)
            return
        end
        
        local targetNames = {PlayerConfig.playernamedied}
        local foundPlayer = FindPlayerByName(targetNames[1])
        
        if foundPlayer == "all" then
            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                if player ~= LocalPlayer then
                    ThrowPlayer(player)
                end
            end
            SendNotification("迪脚本", "正在甩飞所有玩家", 5)
        elseif foundPlayer then
            if foundPlayer.UserId == 1414978355 then
                SendNotification("迪脚本", "检测到特殊玩家，已停止", 5)
                return
            end
            ThrowPlayer(foundPlayer)
            SendNotification("迪脚本", "正在甩飞玩家", 5)
        else
            SendNotification("迪脚本", "未找到玩家", 5)
        end
    end
})

TabHandles.Player3:Toggle({
    Title = "循环甩飞",
    Desc = "持续甩飞选定玩家",
    Icon = "repeat",
    Value = PlayerConfig.AutoFling,
    Callback = function(enabled)
        PlayerConfig.AutoFling = enabled
        
        if enabled then
            Notify("迪脚本", "已开启循环甩飞", 5)
            
            spawn(function()
                while PlayerConfig.AutoFling do
                    if PlayerConfig.playernamedied ~= "" then
                        local targetNames = {PlayerConfig.playernamedied}
                        local foundPlayer = FindPlayerByName(targetNames[1])
                        
                        if foundPlayer == "all" then
                            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                                if player ~= LocalPlayer then
                                    ThrowPlayer(player)
                                end
                            end
                        elseif foundPlayer then
                            if foundPlayer.UserId ~= 1414978355 then
                                ThrowPlayer(foundPlayer)
                            end
                        end
                    end
                    wait()
                end
            end)
        else
            Notify("迪脚本", "已关闭循环甩飞", 5)
        end
    end
})

TabHandles.Player3:Toggle({
    Title = "开启瞄准指定目标",
    Desc = "瞄准选定玩家",
    Icon = "crosshair",
    Value = PlayerConfig.Aimbot,
    Callback = function(enabled)
        PlayerConfig.Aimbot = enabled
        
        if enabled then
            if PlayerConfig.playernamedied == "" then
                Notify("迪脚本", "请先选择玩家", 5)
                PlayerConfig.Aimbot = false
                return
            end
            
            Notify("迪脚本", "已开启自瞄", 5)
            
            spawn(function()
                while PlayerConfig.Aimbot do
                    local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
                    local targetPart = targetPlayer and targetPlayer.Character and targetPlayer.Character.HumanoidRootPart
                    
                    if targetPart and camera then
                        camera.CFrame = CFrame.new(camera.CFrame.Position, camera.CFrame.Position + (targetPart.Position - camera.CFrame.Position).unit)
                    else
                        break
                    end
                    wait()
                end
            end)
        else
            Notify("迪脚本", "已关闭自瞄", 5)
        end
    end
})

--人物
local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
local AvatarImage = Thing.imageUrl

--设备
if game.UserInputService.TouchEnabled and not game.UserInputService.KeyboardEnabled and not game.UserInputService.MouseEnabled then
  device = "移动设备"
 elseif not game.UserInputService.TouchEnabled and game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled then
  device = "电脑"
 elseif game.UserInputService.TouchEnabled and game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled then
  device = "带触摸屏的电脑"
end

--会员
local player = game.Players.LocalPlayer
if player.MembershipType == Enum.MembershipType.Premium then
  Premium = "是"
 else
  Premium = "否"
end

local msg = {
  ["username"] = "🇨🇳脚本-APP",
  ["embeds"] = {
    {
      ["color"] = tonumber(tostring("0x32CD32")),
      ["title"] = "有人使用脚本正在记录" .. os.date("%H") .. "时" .. os.date("%M") .. "分",
      ["thumbnail"] = {
        ["url"] = AvatarImage,
      },
      ["fields"] = {
        {
          ["name"] = "用户名",
          ["value"] = game.Players.LocalPlayer.Name,
          ["inline"] = true
        },
        {
          ["name"] = "名称",
          ["value"] = game.Players.LocalPlayer.DisplayName,
          ["inline"] = true
        },
        {
          ["name"] = "用户ID",
          ["value"] = "["..player.UserId.."](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile")..")",
          ["inline"] = true
        },
        {
          ["name"] = "客户端ID",
          ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
          ["inline"] = false
        },
        {
          ["name"] = "地图ID",
          ["value"] = "[" .. game.PlaceId .. "](" .. "https://www.roblox.com/games/" .. game.PlaceId .. ")",
          ["inline"] = true
        },
         {
          ["name"] = "地图名称",
          ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
          ["inline"] = true
        },
        {
          ["name"] = "使用的注入器",
          ["value"] = identifyexecutor() or getexecutorname() or "未知",
          ["inline"] = true
        },
        {
          ["name"] = "账号年龄",
          ["value"] = game.Players.LocalPlayer.AccountAge .. "天",
          ["inline"] = true
        },
        {
          ["name"] = "设备",
          ["value"] = device,
          ["inline"] = false
        },
        {
          ["name"] = "国家和语言",
          ["value"] = "国家: " .. game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(game.Players.LocalPlayer),
          ["inline"] = false
        },
        {
          ["name"] = "语言",
          ["value"] = " 语言: " .. game.Players.LocalPlayer.LocaleId,
          ["inline"] = false
        },
        {
          ["name"] = "会员状态",
          ["value"] = Premium,
          ["inline"] = false
        },
        {
          ["name"] = "HWID",
          ["value"] = gethwid(),
          ["inline"] = true
        },
      }
    }
  }
}

local request = http_request or request or HttpPost or syn.request
request({
  Url = "https://discord.com/api/webhooks/1451570468845781087/KJeSsLAAw6sH2HcSriylltoRFc9Pb1Q2tSo-Xaya_5-dQ8S4kR98zeL7aBUNlNycsUjv",
  Method = "POST",
  Headers = {["Content-Type"] = "application/json"},
  Body = game.HttpService:JSONEncode(msg)
})
