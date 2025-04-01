--
-- SPDX-FileCopyrightText: (c) 2023-2025 Ring Zero Desenvolvimento de Software LTDA
-- SPDX-License-Identifier: MIT OR GPL-2.0-only
--

local device = require("device")
local chardev = {}

-- No-operation function to use as default for open and release
local function nop() end

-- Create a new character device with default values for open and release
function chardev.new(t)
    -- If t is a string, convert it to a table with name field
    if type(t) == "string" then
        t = {name = t}
    end
    
    -- Ensure t is a table
    t = t or {}
    
    -- Set default values for open and release if not provided
    t.open = t.open or nop
    t.release = t.release or nop
    
    -- Call the original device.new function
    return device.new(t)
end

return chardev
