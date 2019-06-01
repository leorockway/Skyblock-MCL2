-- Freeze water source
minetest.register_abm({
    label = "Water freezing",
    nodenames = {"mcl_core:water_source"},
    interval = 16,
    chance = 8,
    action = function(pos, node)
    local x = pos.x
    local y = pos.y
    local z = pos.z
    local pos_above = {x = x, y = y + 1, z = z}
    local water_positions_check = {}
    water_positions_check[1] = {x = x + 1, y = y, z = z}
    water_positions_check[2]= {x = x - 1, y = y, z = z}
    water_positions_check[3] = {x = x, y = y, z = z + 1}
    water_positions_check[4] = {x = x, y = y , z = z - 1}
    local water_match = 0
    if minetest.get_node_light(pos, 0) <= 12 then
        for i = 1,4,1 do
            if string.match(minetest.get_node(water_positions_check[i]).name, "water") then
                water_match = water_match + 1
            end
        end
        if water_match ~= 4 then
            local exposed = minetest.get_node_light(pos_above, 0.5)
            print(exposed)
            if  exposed == 15 then
                minetest.set_node(pos, {name = "mcl_core:ice"})
            end
        end
    end
end
})
