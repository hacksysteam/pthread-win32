function(get_target_arch out)
  if(CMAKE_SYSTEM_PROCESSOR)
    set(_processor "${CMAKE_SYSTEM_PROCESSOR}")
  elseif(CMAKE_HOST_SYSTEM_PROCESSOR)
    set(_processor "${CMAKE_HOST_SYSTEM_PROCESSOR}")
  elseif(UNIX AND NOT APPLE)
    # Fallback to uname for Unix-like systems
    execute_process(
      COMMAND uname -m OUTPUT_VARIABLE _uname_processor OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    set(_processor "${_uname_processor}")
  else()
    set(_processor "unknown")
  endif()

  if(_processor MATCHES "^(arm|ARM)")
    set(${out} "ARM" PARENT_SCOPE)
  elseif(_processor MATCHES "^(aarch64|AARCH64|arm64|ARM64)")
    set(${out} "ARM64" PARENT_SCOPE)
  elseif(_processor MATCHES "^(x86_64|X86_64|amd64|AMD64)")
    set(${out} "x86_64" PARENT_SCOPE)
  elseif(_processor MATCHES "^(x86|X86|i386|I386|i686|I686)")
    set(${out} "x86" PARENT_SCOPE)
  else()
    set(${out} "unknown" PARENT_SCOPE)
  endif()
endfunction()
