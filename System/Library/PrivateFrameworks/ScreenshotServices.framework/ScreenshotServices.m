void sub_21ECF1424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVKCImageAnalyzerClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getVKCImageAnalyzerClass_softClass;
  uint64_t v7 = getVKCImageAnalyzerClass_softClass;
  if (!getVKCImageAnalyzerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getVKCImageAnalyzerClass_block_invoke;
    v3[3] = &unk_2644ED6B8;
    v3[4] = &v4;
    __getVKCImageAnalyzerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21ECF1514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVKSelectableBarButtonItemClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VKSelectableBarButtonItem");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVKSelectableBarButtonItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVKSelectableBarButtonItemClass_block_invoke_cold_1();
    VisionKitCoreLibrary();
  }
}

void VisionKitCoreLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!VisionKitCoreLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __VisionKitCoreLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2644ED6D8;
    uint64_t v3 = 0;
    VisionKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!VisionKitCoreLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __VisionKitCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VisionKitCoreLibraryCore_frameworkLibrary = result;
  return result;
}

double __getVKImageAnalysisBarButtonItemClass_block_invoke(uint64_t a1)
{
  VisionKitCoreLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VKImageAnalysisBarButtonItem");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVKImageAnalysisBarButtonItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getVKImageAnalysisBarButtonItemClass_block_invoke_cold_1();
    return __getVKCImageAnalyzerClass_block_invoke(v3);
  }
  return result;
}

double __getVKCImageAnalyzerClass_block_invoke(uint64_t a1)
{
  VisionKitCoreLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VKCImageAnalyzer");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVKCImageAnalyzerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVKCImageAnalyzerClass_block_invoke_cold_1();
    return SSLargestSizeWithinSizeWithAspectRatio(v3, v4, v5);
  }
  return result;
}

double SSLargestSizeWithinSizeWithAspectRatio(double result, double a2, double a3)
{
  double v3 = result / a3;
  double v4 = a2 * a3;
  if (v3 > a2 && v4 <= result) {
    return v4;
  }
  return result;
}

double SSizeToFitSizeInAspectRatioOfSize(double a1, double a2, double a3, double a4)
{
  double v4 = a1 / a2;
  double v5 = a3 / v4;
  double result = a4 * v4;
  if (v5 <= a4 || result > a3) {
    return a3;
  }
  return result;
}

double SSAspectRatioFromSize(double a1, double a2)
{
  return a1 / a2;
}

BOOL SSFloatEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.001;
}

BOOL SSPointEqualToPoint(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 0.001;
  return vabdd_f64(a2, a4) < 0.001 && v4;
}

BOOL SSSizeEqualToSize(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 0.001;
  return vabdd_f64(a2, a4) < 0.001 && v4;
}

BOOL SSRectEqualToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL result = 0;
  if (vabdd_f64(a1, a5) < 0.001 && vabdd_f64(a2, a6) < 0.001)
  {
    BOOL v9 = vabdd_f64(a3, a7) < 0.001;
    return vabdd_f64(a4, a8) < 0.001 && v9;
  }
  return result;
}

BOOL SSEdgeInsetsEqualToEdgeInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return vabdd_f64(a1, a5) < 0.001
      && vabdd_f64(a2, a6) < 0.001
      && vabdd_f64(a4, a8) < 0.001
      && vabdd_f64(a3, a7) < 0.001;
}

CGFloat SSInsetsOfRectInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGFloat v18 = a2 - a6;
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  CGRectGetMaxX(v19);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  CGRectGetMaxX(v20);
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  CGRectGetMaxY(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  CGRectGetMaxY(v22);
  return v18;
}

double SSRoundSizeToScale()
{
  UIRoundToScale();
  double v1 = v0;
  UIRoundToScale();
  return v1;
}

double SSRoundRectToScale()
{
  UIRoundToScale();
  double v1 = v0;
  UIRoundToScale();
  UIRoundToScale();
  UIRoundToScale();
  return v1;
}

BOOL SSRectEdgeIsHorizontal(uint64_t a1)
{
  return a1 == 1 || a1 == 4;
}

BOOL SSRectEdgeIsVertical(uint64_t a1)
{
  return a1 == 2 || a1 == 8;
}

double SSSubRectForRectWithUnitRect(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a3 * a5;
}

double SSFloorPoint(double a1)
{
  return floor(a1);
}

double SSFloorSize(double a1)
{
  return floor(a1);
}

double SSFloorRect(double a1)
{
  return floor(a1);
}

double SSRectSubtractingRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double v11 = a1;
  CGRect v42 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  CGFloat x = v42.origin.x;
  CGFloat y = v42.origin.y;
  CGFloat width = v42.size.width;
  CGFloat height = v42.size.height;
  if (!CGRectIsNull(v42))
  {
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v43);
    v44.origin.CGFloat x = v11;
    v44.origin.CGFloat y = a2;
    v44.size.CGFloat width = a3;
    v44.size.CGFloat height = a4;
    double MinY = CGRectGetMinY(v44);
    v45.origin.CGFloat x = v11;
    v45.origin.CGFloat y = a2;
    v45.size.CGFloat width = a3;
    v45.size.CGFloat height = a4;
    double v37 = CGRectGetMaxY(v45);
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    double v38 = v37 - CGRectGetMaxY(v46);
    v47.origin.CGFloat x = v11;
    v47.origin.CGFloat y = a2;
    v47.size.CGFloat width = a3;
    v47.size.CGFloat height = a4;
    double v33 = v38 * CGRectGetWidth(v47);
    CGFloat v36 = height;
    CGFloat v39 = x;
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    double v16 = CGRectGetMinY(v48);
    v49.origin.CGFloat x = v11;
    v49.origin.CGFloat y = a2;
    v49.size.CGFloat width = a3;
    v49.size.CGFloat height = a4;
    double v17 = v16 - CGRectGetMinY(v49);
    v50.origin.CGFloat x = v11;
    v50.origin.CGFloat y = a2;
    v50.size.CGFloat width = a3;
    v50.size.CGFloat height = a4;
    double v18 = v17 * CGRectGetWidth(v50);
    double v19 = v33;
    if (v18 <= v33)
    {
      double v35 = MaxY - MinY;
      CGRectEdge v21 = CGRectMinYEdge;
    }
    else
    {
      v51.origin.CGFloat x = v11;
      v51.origin.CGFloat y = a2;
      v51.size.CGFloat width = a3;
      v51.size.CGFloat height = a4;
      double v20 = CGRectGetMaxY(v51);
      v52.size.CGFloat height = v36;
      v52.origin.CGFloat x = v39;
      v52.origin.CGFloat y = y;
      v52.size.CGFloat width = width;
      double v35 = v20 - CGRectGetMinY(v52);
      CGRectEdge v21 = CGRectMaxYEdge;
      double v19 = v18;
    }
    v53.origin.CGFloat x = v11;
    v53.origin.CGFloat y = a2;
    v53.size.CGFloat width = a3;
    v53.size.CGFloat height = a4;
    double MaxX = CGRectGetMaxX(v53);
    v54.size.CGFloat height = v36;
    v54.origin.CGFloat x = v39;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = width;
    double v23 = MaxX - CGRectGetMaxX(v54);
    v55.origin.CGFloat x = v11;
    v55.origin.CGFloat y = a2;
    v55.size.CGFloat width = a3;
    v55.size.CGFloat height = a4;
    double v24 = v23 * CGRectGetHeight(v55);
    if (v24 > v19)
    {
      v56.size.CGFloat height = v36;
      v56.origin.CGFloat x = v39;
      v56.origin.CGFloat y = y;
      v56.size.CGFloat width = width;
      double v25 = CGRectGetMaxX(v56);
      v57.origin.CGFloat x = v11;
      v57.origin.CGFloat y = a2;
      v57.size.CGFloat width = a3;
      v57.size.CGFloat height = a4;
      CGRectEdge v21 = CGRectMinXEdge;
      double v35 = v25 - CGRectGetMinX(v57);
      double v19 = v24;
    }
    v58.size.CGFloat height = v36;
    v58.origin.CGFloat x = v39;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = width;
    double MinX = CGRectGetMinX(v58);
    v59.origin.CGFloat x = v11;
    v59.origin.CGFloat y = a2;
    v59.size.CGFloat width = a3;
    v59.size.CGFloat height = a4;
    double v27 = MinX - CGRectGetMinX(v59);
    v60.origin.CGFloat x = v11;
    v60.origin.CGFloat y = a2;
    v60.size.CGFloat width = a3;
    v60.size.CGFloat height = a4;
    CGFloat v28 = CGRectGetHeight(v60);
    double v29 = v35;
    if (v27 * v28 > v19)
    {
      v61.origin.CGFloat x = v11;
      v61.origin.CGFloat y = a2;
      v61.size.CGFloat width = a3;
      v61.size.CGFloat height = a4;
      double v30 = CGRectGetMaxX(v61);
      v62.size.CGFloat height = v36;
      v62.origin.CGFloat x = v39;
      v62.origin.CGFloat y = y;
      v62.size.CGFloat width = width;
      double v29 = v30 - CGRectGetMinX(v62);
      CGRectEdge v21 = CGRectMaxXEdge;
    }
    memset(&remainder, 0, sizeof(remainder));
    memset(&slice, 0, sizeof(slice));
    v63.origin.CGFloat x = v11;
    v63.origin.CGFloat y = a2;
    v63.size.CGFloat width = a3;
    v63.size.CGFloat height = a4;
    CGRectDivide(v63, &slice, &remainder, v29, v21);
    return remainder.origin.x;
  }
  return v11;
}

BOOL SSRectIsValid(double a1, double a2, double a3, double a4)
{
  BOOL result = 0;
  if (fabs(a1) != INFINITY)
  {
    double v5 = fabs(a3);
    if (fabs(a2) != INFINITY && v5 != INFINITY) {
      return fabs(a4) != INFINITY;
    }
  }
  return result;
}

void sub_21ECF27D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RecapLibraryCore()
{
  if (!RecapLibraryCore_frameworkLibrary) {
    RecapLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  return RecapLibraryCore_frameworkLibrary;
}

uint64_t __RecapLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RecapLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

Class __getRCPMovieClass_block_invoke(uint64_t a1)
{
  if (!RecapLibraryCore())
  {
    double v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("RCPMovie");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRCPMovieClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    BOOL v4 = (void *)__getRCPMovieClass_block_invoke_cold_1();
    return (Class)+[SSUIServiceRequest entitlement];
  }
  return result;
}

void sub_21ECF3658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_21ECF3AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21ECF4174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

id _SSSignpostLog()
{
  if (_SSSignpostLog_onceToken != -1) {
    dispatch_once(&_SSSignpostLog_onceToken, &__block_literal_global_0);
  }
  double v0 = (void *)_SSSignpostLog____SSSignpostLog;
  return v0;
}

void sub_21ECF4EB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21ECF55D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void *__getMAImageCaptioningSetCaptionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!MediaAccessibilityLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __MediaAccessibilityLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2644EDA38;
    uint64_t v7 = 0;
    MediaAccessibilityLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    double v3 = (void *)v5[0];
    long long v2 = (void *)MediaAccessibilityLibraryCore_frameworkLibrary;
    if (MediaAccessibilityLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      double v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  long long v2 = (void *)MediaAccessibilityLibraryCore_frameworkLibrary;
LABEL_5:
  Class result = dlsym(v2, "MAImageCaptioningSetCaption");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMAImageCaptioningSetCaptionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MediaAccessibilityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaAccessibilityLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1, uint64_t a2)
{
  return a2;
}

id getUMUserManagerClass()
{
  uint64_t v4 = 0;
  SEL v5 = &v4;
  uint64_t v6 = 0x2050000000;
  double v0 = (void *)getUMUserManagerClass_softClass;
  uint64_t v7 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getUMUserManagerClass_block_invoke;
    v3[3] = &unk_2644ED6B8;
    v3[4] = &v4;
    __getUMUserManagerClass_block_invoke((uint64_t)v3);
    double v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21ECF7224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __ManagedConfigurationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2644EDA50;
    uint64_t v6 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("MCProfileConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getMCProfileConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMCProfileConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ManagedConfigurationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ManagedConfigurationLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __MobileKeyBagLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2644EDA68;
    uint64_t v7 = 0;
    MobileKeyBagLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    double v3 = (void *)v5[0];
    long long v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
    if (MobileKeyBagLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      double v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  long long v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileKeyBagLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

Class __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __UserManagementLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2644EDA80;
    uint64_t v6 = 0;
    UserManagementLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!UserManagementLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("UMUserManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getUMUserManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getUMUserManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UserManagementLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UserManagementLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __SetupAssistantLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2644EDA98;
    uint64_t v7 = 0;
    SetupAssistantLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    double v3 = (void *)v5[0];
    long long v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
    if (SetupAssistantLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      double v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  long long v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "BYSetupAssistantNeedsToRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantNeedsToRunSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_21ECF891C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21ECF8AD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t SSCGImageFromSSImageSurface(void *a1)
{
  [a1 backingSurface];
  return _UICreateCGImageFromIOSurfaceWithOptions();
}

id SSCGImageBackedImageFromImage(void *a1)
{
  id v1 = a1;
  if ([v1 ioSurface])
  {
    long long v2 = (const void *)_UICreateCGImageFromIOSurfaceWithOptions();
    id v3 = objc_alloc(MEMORY[0x263F1C6B0]);
    [v1 scale];
    id v5 = (id)objc_msgSend(v3, "initWithCGImage:scale:orientation:", v2, objc_msgSend(v1, "imageOrientation"), v4);
    CFRelease(v2);
  }
  else
  {
    id v5 = v1;
  }

  return v5;
}

void __SSVellumOpacityControlKnobImage_block_invoke()
{
  id v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:", 14.0, 14.0);
  uint64_t v0 = [v2 imageWithActions:&__block_literal_global_38];
  id v1 = (void *)__SSVellumOpacityControlKnobImage;
  __SSVellumOpacityControlKnobImage = v0;
}

void __SSVellumOpacityControlKnobImage_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F1C550];
  id v3 = a2;
  double v4 = [v2 whiteColor];
  [v4 set];

  id v5 = (CGContext *)[v3 CGContext];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  double v8 = 14.0;
  double v9 = 14.0;
  CGContextFillEllipseInRect(v5, *(CGRect *)&v6);
}

void sub_21ECFBB6C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t CarKitLibraryCore()
{
  if (!CarKitLibraryCore_frameworkLibrary) {
    CarKitLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  return CarKitLibraryCore_frameworkLibrary;
}

uint64_t __CarKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CarKitLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

Class __getCARSessionStatusClass_block_invoke(uint64_t a1)
{
  CarKitLibraryCore();
  Class result = objc_getClass("CARSessionStatus");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCARSessionStatusClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21ECFDD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21ED0044C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21ED02444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_21ED0258C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21ED02928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RecapLibraryCore_0()
{
  if (!RecapLibraryCore_frameworkLibrary_0) {
    RecapLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return RecapLibraryCore_frameworkLibrary_0;
}

uint64_t __RecapLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  RecapLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void __getRCPRecorderConfigClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RCPRecorderConfig");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRCPRecorderConfigClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getRCPRecorderConfigClass_block_invoke_cold_1();
    RecapLibrary();
  }
}

void RecapLibrary()
{
  if (!RecapLibraryCore_0())
  {
    uint64_t v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getRCPEventStreamRecorderClass_block_invoke(uint64_t a1)
{
  RecapLibrary();
  Class result = objc_getClass("RCPEventStreamRecorder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRCPEventStreamRecorderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getRCPEventStreamRecorderClass_block_invoke_cold_1();
    return (Class)__getRCPScreenRecorderClass_block_invoke(v3);
  }
  return result;
}

Class __getRCPScreenRecorderClass_block_invoke(uint64_t a1)
{
  RecapLibrary();
  Class result = objc_getClass("RCPScreenRecorder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRCPScreenRecorderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getRCPScreenRecorderClass_block_invoke_cold_1();
    return (Class)__getRCPMovieClass_block_invoke_0(v3);
  }
  return result;
}

Class __getRCPMovieClass_block_invoke_0(uint64_t a1)
{
  RecapLibrary();
  Class result = objc_getClass("RCPMovie");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRCPMovieClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getRCPMovieClass_block_invoke_cold_1();
    return (Class)__getTFBetaApplicationProxyClass_block_invoke(v3);
  }
  return result;
}

Class __getTFBetaApplicationProxyClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!TestFlightCoreLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __TestFlightCoreLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2644EDF60;
    uint64_t v6 = 0;
    TestFlightCoreLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!TestFlightCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("TFBetaApplicationProxy");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getTFBetaApplicationProxyClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getTFBetaApplicationProxyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __TestFlightCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TestFlightCoreLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getAudioServicesPlaySystemSoundSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!AudioToolboxLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __AudioToolboxLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2644EDF78;
    uint64_t v7 = 0;
    AudioToolboxLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)AudioToolboxLibraryCore_frameworkLibrary;
    if (AudioToolboxLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)AudioToolboxLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "AudioServicesPlaySystemSound");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAudioServicesPlaySystemSoundSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AudioToolboxLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AudioToolboxLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getSBUIGetUserAgentSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!SpringBoardUILibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __SpringBoardUILibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2644EDF90;
    uint64_t v7 = 0;
    SpringBoardUILibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)SpringBoardUILibraryCore_frameworkLibrary;
    if (SpringBoardUILibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)SpringBoardUILibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "SBUIGetUserAgent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBUIGetUserAgentSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardUILibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void SSApplyDebuggingCustomizationsToViewIfAppropriate(void *a1, void *a2, double a3)
{
  id v12 = a1;
  id v5 = a2;
  if (_SSIsRemoteViewControllerDebuggingEnabled())
  {
    long long v6 = [v12 layer];
    [v6 setBorderWidth:a3];

    uint64_t v7 = [v12 layer];
    id v8 = v5;
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

    id v9 = objc_alloc_init(MEMORY[0x263F1CB60]);
    double v10 = a3 * 4.0;
    objc_msgSend(v9, "setFrame:", 0.0, 0.0, v10, v10);
    objc_msgSend(v9, "setCenter:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    double v11 = [v9 layer];
    [v11 setCornerRadius:v10 * 0.5];

    [v9 setBackgroundColor:v8];
    [v12 addSubview:v9];
  }
}

id _SSUserDefaults()
{
  if (_SSUserDefaults_onceToken != -1) {
    dispatch_once(&_SSUserDefaults_onceToken, &__block_literal_global_9);
  }
  uint64_t v0 = (void *)_SSUserDefaults_result;
  return v0;
}

uint64_t _SSUserDefaultsBooleanForKeyWithNODefault(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _SSUserDefaults();
  uint64_t v3 = [v2 BOOLForKey:v1];

  return v3;
}

double _SSUserDefaultsCGFloatForKeyWith0Default(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _SSUserDefaults();
  uint64_t v3 = [v2 valueForKey:v1];

  [v3 floatValue];
  double v5 = v4;

  return v5;
}

uint64_t _SSUserDefaultsNSIntegerForKeyWith0Default(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _SSUserDefaults();
  uint64_t v3 = [v2 valueForKey:v1];

  uint64_t v4 = [v3 integerValue];
  return v4;
}

uint64_t _SSIsRemoteViewControllerDebuggingEnabled()
{
  return _SSUserDefaultsBooleanForKeyWithNODefault(@"SSDebugRemoteViewControllers");
}

uint64_t _SSIsViewSnapshotDebuggingEnabled()
{
  return _SSUserDefaultsBooleanForKeyWithNODefault(@"SSDebugViewSnapshotting");
}

uint64_t _SSShouldHomeButtonDismiss()
{
  return _SSUserDefaultsBooleanForKeyWithNODefault(@"SSShouldHomeButtonDismiss");
}

uint64_t _SSIsScreenshotManagerDebuggingEnabled()
{
  return _SSUserDefaultsBooleanForKeyWithNODefault(@"SSDebugScreenshotManager");
}

uint64_t _SSEnableVellumExport()
{
  if (_SSEnableVellumExport_onceToken != -1) {
    dispatch_once(&_SSEnableVellumExport_onceToken, &__block_literal_global_18);
  }
  return _SSEnableVellumExport___SSEnableVellumExport;
}

uint64_t _SSShouldIgnoreAbilityCheck()
{
  if (_SSShouldIgnoreAbilityCheck_onceToken != -1) {
    dispatch_once(&_SSShouldIgnoreAbilityCheck_onceToken, &__block_literal_global_26);
  }
  return _SSShouldIgnoreAbilityCheck___SSShouldIgnoreAbilityCheck;
}

uint64_t _SSEnableContinuousScreenCaptureForBugFiling()
{
  if (_SSEnableContinuousScreenCaptureForBugFiling_onceToken != -1) {
    dispatch_once(&_SSEnableContinuousScreenCaptureForBugFiling_onceToken, &__block_literal_global_31);
  }
  return _SSEnableContinuousScreenCaptureForBugFiling___SSEnableContinuousScreenCaptureForBugFiling;
}

uint64_t _SSScreenshotsInQuickNoteEnabled()
{
  if (_SSScreenshotsInQuickNoteEnabled_onceToken != -1) {
    dispatch_once(&_SSScreenshotsInQuickNoteEnabled_onceToken, &__block_literal_global_33);
  }
  return _SSScreenshotsInQuickNoteEnabled___SSScreenshotsInQuickNoteEnabled;
}

uint64_t _SSGetLastUsedFullPageScreenshotShareAsOption()
{
  return _SSUserDefaultsNSIntegerForKeyWith0Default(@"SSLastUsedFullPageScreenshotShareAsOption");
}

void _SSSetLastUsedFullPageScreenshotShareAsOption(uint64_t a1)
{
  _SSUserDefaults();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setInteger:a1 forKey:@"SSLastUsedFullPageScreenshotShareAsOption"];
}

uint64_t _SSGetAnnotationModePreference()
{
  return _SSUserDefaultsBooleanForKeyWithNODefault(@"SSAnnotationModePreference");
}

void _SSSetAnnotationModePreference(uint64_t a1)
{
  _SSUserDefaults();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setBool:a1 forKey:@"SSAnnotationModePreference"];
}

uint64_t _SSLinksInPhotosEnabled()
{
  if (_SSLinksInPhotosEnabled_onceToken != -1) {
    dispatch_once(&_SSLinksInPhotosEnabled_onceToken, &__block_literal_global_43);
  }
  return _SSLinksInPhotosEnabled___SSLinksInPhotosEnabled;
}

uint64_t _SSQuickActionsEnabled()
{
  if (_SSQuickActionsEnabled_onceToken != -1) {
    dispatch_once(&_SSQuickActionsEnabled_onceToken, &__block_literal_global_46);
  }
  return _SSQuickActionsEnabled_sQuickActionsEnabled;
}

uint64_t _SSRemoveBackgroundEnabled()
{
  if (_SSRemoveBackgroundEnabled_onceToken != -1) {
    dispatch_once(&_SSRemoveBackgroundEnabled_onceToken, &__block_literal_global_50);
  }
  return _SSRemoveBackgroundEnabled_sRemoveBackgroundEnabled;
}

uint64_t __getVKSelectableBarButtonItemClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVKImageAnalysisBarButtonItemClass_block_invoke_cold_1(v0);
}

uint64_t __getVKImageAnalysisBarButtonItemClass_block_invoke_cold_1()
{
  return __getVKCImageAnalyzerClass_block_invoke_cold_1();
}

uint64_t __getVKCImageAnalyzerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getRCPMovieClass_block_invoke_cold_1(v0);
}

uint64_t __getRCPMovieClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[SSScreenshotAssetManagerPhotoLibraryBackend imageDataFromImage:withProperties:](v0);
}

uint64_t __getMCProfileConnectionClass_block_invoke_cold_1()
{
  return __getUMUserManagerClass_block_invoke_cold_1();
}

uint64_t __getUMUserManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __73__SSScreenshotsWindow__prepareRemoteViewControllerWithCompletionHandler___block_invoke_cold_1(v0);
}

uint64_t __getRCPRecorderConfigClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getRCPEventStreamRecorderClass_block_invoke_cold_1(v0);
}

uint64_t __getRCPEventStreamRecorderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getRCPScreenRecorderClass_block_invoke_cold_1(v0);
}

uint64_t __getRCPScreenRecorderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getTFBetaApplicationProxyClass_block_invoke_cold_1(v0);
}

uint64_t __getTFBetaApplicationProxyClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SSRemoteAlertHandleProvider remoteAlertHandle:didInvalidateWithError:](v0);
}

uint64_t BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F10700]();
}

uint64_t BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  return MEMORY[0x270F108F0]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x270F10940]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x270F10948]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

void CGImageRelease(CGImageRef image)
{
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x270EF4C38](aSurface);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x270EF4E38](xobj);
}

uint64_t IOSurfaceSetOwnership()
{
  return MEMORY[0x270EF4E58]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t PHImageDataFromImageAsScreenshot()
{
  return MEMORY[0x270EFA2D0]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x270F05F28]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x270F061F0]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x270F06218]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x270F06260]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UICreateCGImageFromIOSurfaceWithOptions()
{
  return MEMORY[0x270F06340]();
}

uint64_t _UIRenderDisplay()
{
  return MEMORY[0x270F06390]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}