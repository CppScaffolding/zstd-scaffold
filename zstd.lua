-- scaffold geniefile for zstd

zstd_script = path.getabsolute(path.getdirectory(_SCRIPT))
zstd_root = path.join(zstd_script, "zstd")

zstd_includedirs = {
	path.join(zstd_script, "config"),
	zstd_root,
}

zstd_libdirs = {}
zstd_links = {}
zstd_defines = {}

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

project "zstd"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		zstd_includedirs,
	}

	defines {}

	files {
		path.join(zstd_script, "config", "**.h"),
		path.join(zstd_root, "**.h"),
		path.join(zstd_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
