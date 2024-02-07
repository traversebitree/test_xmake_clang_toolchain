add_rules("mode.debug", "mode.release")
add_toolchains("@clang")

target("dynamic_mylib")
set_kind("shared")
add_files("mylib/mylib.cpp")
add_headerfiles("mylib/mylib.hpp")
add_includedirs("mylib", { public = true })
add_rules("utils.symbols.export_all", { export_classes = true })

target("main") -- failed with error []
set_kind("binary")
add_files("main.cpp")
add_deps("dynamic_mylib")
