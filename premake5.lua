project "GLFW"
    kind "StaticLib"
    language "C"

	targetdir ("bin/" .. output_directory .. "/%{prj.name}")
    objdir ("bin-int/" .. output_directory .. "/%{prj.name}")

	files {
        "include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/glfw_config.h",
		"src/context.c",
		"src/input.c",
		"src/monitor.c",
		"src/init.c",
		"src/vulkan.c",
		"src/window.c",
		"src/platform.c",
		"src/null_init.c",
		"src/null_monitor.c",
		"src/null_window.c",
		"src/null_joystick.c"
    }

	filter "system:windows"
        systemversion "latest"
        staticruntime "On"

        files {
            "src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c",
			"src/win32_module.c"
        }

		defines { 
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
		}

    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"