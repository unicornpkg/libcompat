local std = {}

local function fake_loadapi(_)
  error("os.loadAPI and os.unloadAPI were specifically omitted from libcompat due to various issues. Please use require() instead.")
end

local function is_recrafted()
  if pcall(require, "rc") then
    return true
  else
    return false
  end
end

local function is_phoenix()
  if pcall(require, "craftos") then
    return true
  else
    return false
  end
end

local function is_other()
  if not _G.fs and not _G.http then
    return true
  else
    return false
  end
end

if is_phoenix() then
  std = require("craftos")
elseif is_recrafted() then
  std = _G
  for name, func in pairs(require("rc")) do
    std.os[name] = func
  end
  std.os.loadAPI = unsupported_function("os.loadAPI")
elseif is_other() then
  error("Unsupported system detected.")
else
  std = _G -- Assume this is stock CraftOS
end

std.os.loadAPI = fake_loadapi
std.os.unloadAPI = fake_loadapi

return std
