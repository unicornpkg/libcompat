local std = {}

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
  std = require("rc")
  std.fs = _G.fs
  std.http = _G.http
elseif is_other() then
  error("Unsupported system detected.")
else
  std = _G -- Assume this is stock CraftOS
end
  

return std
