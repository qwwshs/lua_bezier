package = 'bezier'
version = "0.1-2"
source = {
   url = "https://github.com/qwwshs/lua_bezier/archive/refs/tags/stb.zip"
}
description = {
   homepage = "https://github.com/qwwshs/lua_bezier/",
    license = "Unlicense license"
}
build = {
   type = "builtin",
   modules = {
      bezier = "bezier.lua"
   }
}
