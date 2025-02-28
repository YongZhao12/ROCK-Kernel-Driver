dnl #
dnl # commit 0529a1d385b9ce6cd7498d180f720eeb3f755980
dnl # drm/dp_mst: Add DSC enablement helpers to DRM
dnl #
AC_DEFUN([AC_AMDGPU_DRM_DP_MST_ATOMIC_ENABLE_DSC], [
	AC_KERNEL_DO_BACKGROUND([
		AC_KERNEL_TRY_COMPILE_SYMBOL([
			#if defined(HAVE_DRM_DISPLAY_DRM_DP_MST_HELPER_H)
			#include <drm/display/drm_dp_mst_helper.h>
			#elif defined(HAVE_DRM_DP_DRM_DP_MST_HELPER_H)
			#include <drm/dp/drm_dp_mst_helper.h>
			#else
			#include <drm/drm_dp_mst_helper.h>
			#endif
		], [
			drm_dp_mst_atomic_enable_dsc(NULL, NULL, 0, 0, false);
		], [drm_dp_mst_atomic_enable_dsc], [drivers/gpu/drm/drm_dp_mst_topology.c], [
			AC_DEFINE(HAVE_DRM_DP_MST_ATOMIC_ENABLE_DSC, 1,
				[drm_dp_mst_atomic_enable_dsc() is available])
		])
	])
])
