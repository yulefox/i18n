#!/usr/bin/env lua

-- author: Fox (yulefox at gmail.com)
-- date: Mon Feb 27 19:21:23 CST 2012

-- usage: an argument with one of the following values is optional:
-- 1) en_US
-- 2) zh_CN
-- 3) zh_TW

local M = require "i18n"
local L = M.get

if arg[1] then
    M.set({
        lang = arg[1]
    })
end

print(L('hello') .. ", " .. L('world'))

