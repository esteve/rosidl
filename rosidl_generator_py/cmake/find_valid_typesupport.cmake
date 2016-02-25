macro(rosidl_generator_py_find_valid_typesupport)
  # TODO(esteve): force opensplice and connext C type supports only, uncomment
  # the following line when all typesupport implementations are ported to C
  #get_rmw_typesupport(_typesupport_impls ${rmw_implementation})
  set(_typesupport_impls "")
  foreach(_extension IN LISTS AMENT_EXTENSIONS_rosidl_generate_interfaces)
    string(REPLACE ":" ";" _extension_list "${_extension}")
    list(LENGTH _extension_list _length)
    if(NOT _length EQUAL 2)
      message(FATAL_ERROR "ament_execute_extensions(${extension_point}) "
        "registered extension '${_extension}' can not be split into package "
        "name and cmake filename")
    endif()
    list(GET _extension_list 0 _pkg_name)
    list(GET _extension_list 1 _cmake_filename)
    if("${_pkg_name} " STREQUAL "rosidl_typesupport_opensplice_c ")
      list(APPEND _typesupport_impls "rosidl_typesupport_opensplice_c")
    endif()
    if("${_pkg_name} " STREQUAL "rosidl_typesupport_connext_c ")
      list(APPEND _typesupport_impls "rosidl_typesupport_connext_c")
    endif()
  endforeach()
endmacro()
