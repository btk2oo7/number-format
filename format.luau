--!strict

local module = {}

----------------------------------------------------------------------------------------------------

local places = { "", "K", "M", "B", "T", "Qa" } --add as many as you want

----------------------------------------------------------------------------------------------------

function module:format(x: number): string
	local str = tostring(math.floor(x))
	local z = (((#str - 1) // 3) + 1)
	if z > #places then
		local a = string.reverse(str)
		local b = ""
		local c = 0
		for i = 1, z - 1 do
			b = b .. string.sub(a, (i*3)-2, (i*3)) .. ","
			c = i * 3
		end
		return string.reverse(b .. string.sub(str, 1, #str-c))
	end
	local y = x / (10 ^ (#str - ((#str - 1) % 3) - 1))
	return tostring(math.round(y * 100) / 100) .. places[z]
end

----------------------------------------------------------------------------------------------------

return module
