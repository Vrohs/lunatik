--
-- SPDX-FileCopyrightText: (c) 2023-2025 Ring Zero Desenvolvimento de Software LTDA
-- SPDX-License-Identifier: MIT OR GPL-2.0-only
--

local device = require("device")
local linux = require("linux")
local chardev = {}

local function nop() end
local s = linux.stat

function chardev.new(t)
    if type(t) == "string" then
        t = {name = t}
    end

    t = t or {}
    t.open = t.open or nop
    t.release = t.release or nop
    t.mode = t.mode or s.IRUGO

    return device.new(t)
end

return chardev
