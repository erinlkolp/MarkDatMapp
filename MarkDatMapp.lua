-- create a frame to hold the map
local MyAddonFrame = CreateFrame("FRAME", "MyAddonFrame", WorldMapFrame)
MyAddonFrame:SetAllPoints()

-- create a button to mark coordinates
local MyButton = CreateFrame("Button", "MyButton", MyAddonFrame, "UIPanelButtonTemplate")
MyButton:SetText("Mark Location")
MyButton:SetWidth(100)
MyButton:SetHeight(25)
MyButton:SetPoint("CENTER", MyAddonFrame, "CENTER", 0, -50)

-- set the function to be called when the button is clicked
MyButton:SetScript("OnClick", function()
    -- local x, y = GetPlayerMapPosition("player")
    -- C_Map.SetUserWaypoint(x, y)

    -- local mapID = C_Map.GetBestMapForUnit("player")

    local mapID = C_Map.GetBestMapForUnit("player")

    if C_Map.CanSetUserWaypointOnMap(mapID) then
        local pos = C_Map.GetPlayerMapPosition(mapID, "player")
	local mapPoint = UiMapPoint.CreateFromVector2D(mapID, pos)
	C_Map.SetUserWaypoint(mapPoint)
    else
	print("Cannot set waypoints on this map")
    end
end)
