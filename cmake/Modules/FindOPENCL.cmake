# For OpenCL LTE Scanner (https://github.com/JiaoXianjun/LTE-Cell-Scanner)
# Xianjun Jiao (putaoshu@msn.com)

# - Find OpenCL
# Find the native OpenCL includes and library
# This module defines
#  OPENCL_INCLUDE_DIR, where to find cl.h, etc.
#  OPENCL_LIBRARIES, the libraries needed to use OpenCL.
#  OPENCL_FOUND, If false, do not try to use OpenCL.

find_path(OPENCL_INCLUDE_DIR CL/cl.h
	/usr/include
	opt/intel/intel-opencl-1.2-6.0.0.1049/opencl-1.2-sdk-6.0.0.1049/include
	/opt/AMDAPPSDK-3.0/include
	/opt/AMDAPP/include/
	/usr/local/include
	/usr/local/cuda/include/
	NO_DEFAULT_PATH
)

find_library(OPENCL_LIBRARY libOpenCL.so
	/usr/lib64
	/usr/lib/x86_64-linux-gnu
	/opt/intel/intel-opencl-1.2-6.0.0.1049/opencl-1.2-6.0.0.1049/lib64
	/opt/AMDAPPSDK-3.0/lib/x86_64/sdk
	/opt/AMDAPP/lib/x86_64
	/usr/lib
	/usr/local/lib
	NO_DEFAULT_PATH
)

if(OPENCL_LIBRARY AND OPENCL_INCLUDE_DIR)
	set(OPENCL_LIBRARIES ${OPENCL_LIBRARY})
	set(OPENCL_FOUND "YES")
else(OPENCL_LIBRARY AND OPENCL_INCLUDE_DIR)
	set(OPENCL_FOUND "NO")
	message(STATUS "OPENCL LIB not found.")
endif(OPENCL_LIBRARY AND OPENCL_INCLUDE_DIR)

if(OPENCL_FOUND)
	if(NOT OPENCL_FIND_QUIETLY)
		message(STATUS "Found OpenCL LIB: ${OPENCL_LIBRARIES}")
	endif(NOT OPENCL_FIND_QUIETLY)
else(OPENCL_FOUND)
	if(OPENCL_FIND_REQUIRED)
		message(FATAL_ERROR "Could not find OpenCL library")
	endif(OPENCL_FIND_REQUIRED)
endif(OPENCL_FOUND)

# Deprecated declarations.
get_filename_component(NATIVE_OPENCL_LIB_PATH ${OPENCL_LIBRARY} PATH)

mark_as_advanced(
	OPENCL_LIBRARY
	OPENCL_INCLUDE_DIR
)
