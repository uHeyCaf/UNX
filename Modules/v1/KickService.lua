return {
	CallKick = function(_, a, b, c)
		local d = game:GetService("CoreGui")
		local e = game:GetService("Players")
		local f = game:GetService("TweenService")
		local g = game:GetService("RunService")
		local h = game:GetService("Lighting")
		local i = d:WaitForChild("RobloxPromptGui"):WaitForChild("promptOverlay")
		local j = workspace.CurrentCamera
		local k = e.LocalPlayer

		for _, l in ipairs(d:GetChildren()) do
			if l ~= d:FindFirstChild("RobloxPromptGui") then
				pcall(function() l:Destroy() end)
			end
		end

		local m = k:FindFirstChild("PlayerGui")
		if m then
			for _, n in ipairs(m:GetChildren()) do
				pcall(function() n:Destroy() end)
			end
		end

		g.RenderStepped:Wait()

		pcall(function()
			j.CameraType = Enum.CameraType.Scriptable
			j.CFrame = CFrame.new(1e9, 1e9, 1e9)
		end)

		pcall(function()
			i:FindFirstChild("UNXKickFrame"):Destroy()
			i:FindFirstChild("UNXInputBlocker"):Destroy()
		end)

		pcall(function()
			if h:FindFirstChild("UNXBlur") then
				h.UNXBlur:Destroy()
			end
		end)

		local o = Instance.new("BlurEffect")
		o.Name = "UNXBlur"
		o.Size = 24
		o.Parent = h

		local p = Instance.new("TextButton")
		p.Name = "UNXInputBlocker"
		p.Size = UDim2.new(1, 0, 1, 0)
		p.Position = UDim2.new(0, 0, 0, 0)
		p.BackgroundTransparency = 1
		p.Text = ""
		p.AutoButtonColor = false
		p.ZIndex = 1
		p.Parent = i

		local q = Instance.new("Frame")
		q.Name = "UNXKickFrame"
		q.Size = UDim2.new(0.6, 0, 0.58, 0)
		q.Position = UDim2.new(0.5, 0, 0.5, 0)
		q.AnchorPoint = Vector2.new(0.5, 0.5)
		q.BackgroundColor3 = Color3.fromRGB(0, 2, 39)
		q.BorderSizePixel = 0
		q.ZIndex = 2
		q.ClipsDescendants = true
		q.Parent = i

		local r = Instance.new("UIScale")
		r.Scale = 0
		r.Parent = q

		f:Create(r, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Scale = 0.8
		}):Play()

		local s = Instance.new("UIListLayout")
		s.Padding = UDim.new(0, 10)
		s.HorizontalAlignment = Enum.HorizontalAlignment.Center
		s.VerticalAlignment = Enum.VerticalAlignment.Center
		s.SortOrder = Enum.SortOrder.LayoutOrder
		s.Parent = q

		local t = Instance.new("TextLabel")
		t.Text = a or "UNXHub | Disconnected"
		t.Size = UDim2.new(1, -40, 0, 40)
		t.Position = UDim2.new(0, 0, 0, -20)
		t.BackgroundTransparency = 1
		t.TextColor3 = Color3.new(1, 1, 1)
		t.Font = Enum.Font.SourceSansBold
		t.TextScaled = true
		t.ZIndex = 3
		t.LayoutOrder = 1
		t.Parent = q

		local u = Instance.new("Frame")
		u.Size = UDim2.new(1, -40, 0, 1)
		u.BackgroundColor3 = Color3.fromRGB(0, 4, 67)
		u.BorderSizePixel = 0
		u.ZIndex = 3
		u.LayoutOrder = 2
		u.Parent = q

		local v = Instance.new("TextLabel")
		v.Text = (b or "Você foi desconectado") .. "\n(Error Code: " .. tostring(c or 1) .. ")"
		v.Size = UDim2.new(1, -40, 0, 70)
		v.BackgroundTransparency = 1
		v.TextColor3 = Color3.new(1, 1, 1)
		v.TextWrapped = true
		v.TextYAlignment = Enum.TextYAlignment.Center
		v.TextXAlignment = Enum.TextXAlignment.Center
		v.Font = Enum.Font.SourceSansLight
		v.TextScaled = true
		v.ZIndex = 3
		v.LayoutOrder = 3
		v.Parent = q

		local w = Instance.new("TextButton")
		w.Size = UDim2.new(0.5, 0, 0, 40)
		w.BackgroundColor3 = Color3.fromRGB(0, 4, 67)
		w.Text = "Quit"
		w.TextColor3 = Color3.new(1, 1, 1)
		w.Font = Enum.Font.SourceSansLight
		w.TextScaled = true
		w.ZIndex = 3
		w.LayoutOrder = 4
		w.Parent = q

		local x = Instance.new("UICorner")
		x.CornerRadius = UDim.new(0, 8)
		x.Parent = w

		w.MouseButton1Click:Connect(function()
			game:Shutdown()
		end)
	end
}