-- package geniefile for zstd

zstd_script = path.getabsolute(path.getdirectory(_SCRIPT))
zstd_root = path.join(zstd_script, "zstd")

zstd_includedirs = {
	zstd_root,
	path.join(zstd_root, "lib"),
}

zstd_defines = {
	--"ZSTD_LEGACY_SUPPORT=5",
}
zstd_libdirs = {}
zstd_links = {}

----
return {
	_add_includedirs = function()
		includedirs { zstd_includedirs }
	end,

	_add_defines = function()
		defines { zstd_defines }
	end,

	_add_libdirs = function()
		libdirs { zstd_libdirs }
	end,

	_add_external_links = function()
		links { zstd_links }
	end,

	_add_self_links = function()
		links { "zstd" }
	end,

	_create_projects = function()

	group "thirdparty"
	project "zstd"
		kind "StaticLib"
		language "C"
		flags {}

		configuration {}

		includedirs {
			zstd_includedirs,
			path.join(zstd_root, "lib", "common"),
			path.join(zstd_root, "lib", "compress"),
			path.join(zstd_root, "lib", "decompress"),
			path.join(zstd_root, "lib", "dictBuilder"),
			path.join(zstd_root, "lib", "legacy"),
		}

		defines {
			zstd_defines,
			'XXH_NAMESPACE=ZSTD_',
			'ZSTD_LEGACY_SUPPORT=0',
			'BACKTRACE_ENABLE=0',

			'ZSTD_MULTITHREAD',
		}

		files {
			path.join(zstd_root, "**.h"),
			path.join(zstd_root, "lib", "common", "*.c"),
			path.join(zstd_root, "lib", "compress", "*.c"),
			path.join(zstd_root, "lib", "decompress", "*.c"),
			path.join(zstd_root, "lib", "dictBuilder", "*.c"),

			path.join(zstd_root, "lib", "deprecated", "*.c"),
			--path.join(zstd_root, "lib", "legacy", "*.c"),
		}

	build_c11()

	---
	end, -- _create_projects()
}

---
