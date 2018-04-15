--MENUBAR 
MainMenuBarLeftEndCap:Hide() --Hides left gargoyle
MainMenuBarRightEndCap:Hide() --Hides right
MainMenuBar:SetScale(0.7) --scale down the bar
MainMenuBar:SetAlpha(0.7) --70% visible

--PLAYER & TARGET frames
PlayerFrame:SetScale(1.1); --increase size 10%
PlayerFrame:ClearAllPoints();
PlayerFrame:SetPoint("CENTER",UIParent,-250,-220); --Sets position x, y
PlayerFrame:SetUserPlaced(true);

TargetFrame:SetScale(1.1); --increase size 10%
TargetFrame:ClearAllPoints();
TargetFrame:SetPoint("CENTER",UIParent,250,-220); --Sets position x, y
TargetFrame:SetUserPlaced(true);

--Esconde objetivos se estiver em raid
local f = CreateFrame("FRAME");
f:RegisterEvent("PLAYER_ENTERING_WORLD"); --Event that fires on loadingscreens
f:SetScript("OnEvent", function(self, event, ...)
	if IsInRaid() then --if player is in raid hides objective tracker else shows it
		ObjectiveTrackerFrame:Hide();
	else
		ObjectiveTrackerFrame:Show();
	end
end)