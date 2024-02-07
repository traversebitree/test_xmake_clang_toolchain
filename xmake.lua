add_rules("mode.debug", "mode.release")
add_requires("llvm")
add_toolchains("@llvm")

target("static_mylib")
set_kind("static")
add_files("mylib/mylib.cpp")
add_headerfiles("mylib/mylib.hpp")
add_includedirs("mylib", { public = true })

target("static_main") -- success
set_kind("binary")
add_files("static_test_src/static_main.cpp")
add_deps("static_mylib")

target("dynamic_mylib")
set_kind("shared")
add_files("mylib/mylib.cpp")
add_headerfiles("mylib/mylib.hpp")
add_includedirs("mylib", { public = true })
add_rules("utils.symbols.export_all", { export_classes = true })

target("dynamic_main") -- failed with error [error: clang++: error: no such file or directory: '/def:build\.gens\dynamic_mylib\windows\x64\release\rules\symbols\export_all.def']
set_kind("binary")
add_files("dynamic_test_src/dynamic_main.cpp")
add_deps("dynamic_mylib")
