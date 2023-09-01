# libcompat
Compatibility library that provides a standard CraftOS-compatibile library (`stdlib`) on different systems such as Phoenix and Recrafted.

## Usage
```lua
local stdlib = require("libcompat")
stdlib.http.get("https://example.com")
print(stdlib.settings.get("somerandom.setting"))
```
