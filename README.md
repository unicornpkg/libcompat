# libcompat
Compatibility library that provides a standard CraftOS-compatibile library (`stdlib`) on different systems such as Phoenix and Recrafted.

## Usage
```lua
local stdlib = require("libcompat")
stdlib.http.get("https://example.com")
print(stdlib.settings.get("somerandom.setting"))
```

## Changes
- `os.loadAPI` and `os.unloadAPI` are always omitted, regardless of system, due to the issues outlined [here](https://tweaked.cc/module/os.html#v:loadAPI).
