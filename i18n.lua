#!/usr/bin/env lua

-- author: Fox (yulefox at gmail.com)
-- date: Mon Feb 27 16:29:12 CST 2012

-- module: i18n
module("i18n", package.seeall)

local locale = {
    default_lang = "en_US",     -- default language, READ ONLY
    dir = "locale",             -- parent directory of locale resources
    lang = "",                  -- locale language
    pkg = {},                   -- table contains locale message strings
}

-- load message strings of specific language
local locale_load = function()
    local pkg_name = locale.dir .. "." .. locale.lang .. ".messages"
    local pkg = require(pkg_name)
    return pkg.messages
end

-- set locale configuration
function set(t)
    for k, v in pairs(t) do
        if k == "lang" or k == "dir" then
            locale[k] = v
        elseif k == "default_lang" or k == "pkg" then
            print("LOCALE_CONFIG: item `" .. k .. "` is read ONLY.")
        else
            print("LOCALE_CONFIG: item `" .. k .. "` is NOT recognized.")
        end
    end
    locale.pkg = locale_load()
end

-- get mapping string of specific locale configuration
function get(k)
    return locale.pkg[k] or k
end

