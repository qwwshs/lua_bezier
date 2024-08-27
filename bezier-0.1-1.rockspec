package = 'bezier'
version = "0.1-1"
source = {
    url = "https://github.com/qwwshs/lua_bezier",
    tag = "v0.1" 
}
description = {
    summary = "Bezier",
    detailed = "This is a bezier function where you can get a bezier of any order.",
    homepage = "https://github.com/qwwshs/lua_bezier",
    license = "Unlicense license"
}
dependencies = {
    "lua >= 5.1"
}
build = {
    type = "builtin",
    modules = {
        ["my_module"] = "bezier.lua"
    }
}
