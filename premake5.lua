project "ImGui"
	kind "StaticLib"
	language "C++"
    staticruntime "On"
	cppdialect "C++20"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_tables.cpp",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp"
	}

	filter "system:windows"
		systemversion "latest"

	filter "system:linux"
		pic "On"
		systemversion "latest"

		filter "configurations:Debug"
        defines "QK_DEBUG" 
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "QK_RELEASE"
        runtime "Release"
        symbols "On"
        optimize "On"

    filter "configurations:Dist"
        defines "QK_DIST"
        runtime "Release"
        symbols "Off"
        optimize "Full"
