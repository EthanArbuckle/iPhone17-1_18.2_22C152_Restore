void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void __encodePathElementIntoData(void *a1, int *a2)
{
  id v3 = a1;
  int v13 = *a2;
  [v3 appendBytes:&v13 length:4];
  uint64_t v4 = *a2;
  if (v4 > 3) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = dword_18FB78DB0[v4];
  }
  unsigned int v12 = v5;
  [v3 appendBytes:&v12 length:4];
  if (v12)
  {
    uint64_t v6 = 0;
    for (unint64_t i = 0; i < v12; ++i)
    {
      float v8 = *(double *)(*((void *)a2 + 1) + v6);
      float v11 = v8;
      [v3 appendBytes:&v11 length:4];
      float v9 = *(double *)(*((void *)a2 + 1) + v6 + 8);
      float v10 = v9;
      [v3 appendBytes:&v10 length:4];
      v6 += 16;
    }
  }
}

id PSLogCommon()
{
  if (PSLogCommon_onceToken != -1) {
    dispatch_once(&PSLogCommon_onceToken, &__block_literal_global);
  }
  v0 = (void *)PSLogCommon___logObj;
  return v0;
}

uint64_t __PSLogCommon_block_invoke()
{
  PSLogCommon___logObj = (uint64_t)os_log_create("com.apple.PointerUI", "Common");
  return MEMORY[0x1F41817F8]();
}

id PSLogAutohide()
{
  if (PSLogAutohide_onceToken != -1) {
    dispatch_once(&PSLogAutohide_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)PSLogAutohide___logObj;
  return v0;
}

uint64_t __PSLogAutohide_block_invoke()
{
  PSLogAutohide___logObj = (uint64_t)os_log_create("com.apple.PointerUI", "Autohide");
  return MEMORY[0x1F41817F8]();
}

id PSLogMaterial()
{
  if (PSLogMaterial_onceToken != -1) {
    dispatch_once(&PSLogMaterial_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)PSLogMaterial___logObj;
  return v0;
}

uint64_t __PSLogMaterial_block_invoke()
{
  PSLogMaterial___logObj = (uint64_t)os_log_create("com.apple.PointerUI", "Material");
  return MEMORY[0x1F41817F8]();
}

id PSLogTransform()
{
  if (PSLogTransform_onceToken != -1) {
    dispatch_once(&PSLogTransform_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)PSLogTransform___logObj;
  return v0;
}

uint64_t __PSLogTransform_block_invoke()
{
  PSLogTransform___logObj = (uint64_t)os_log_create("com.apple.PointerUI", "Transform");
  return MEMORY[0x1F41817F8]();
}

id PSLogClipping()
{
  if (PSLogClipping_onceToken != -1) {
    dispatch_once(&PSLogClipping_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)PSLogClipping___logObj;
  return v0;
}

uint64_t __PSLogClipping_block_invoke()
{
  PSLogClipping___logObj = (uint64_t)os_log_create("com.apple.PointerUI", "Clipping");
  return MEMORY[0x1F41817F8]();
}

void sub_18FB70B08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
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

void sub_18FB7115C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18FB714E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18FB719BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18FB71FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FB72514(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18FB72A48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18FB74848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  objc_destroyWeak(v27);
  objc_destroyWeak((id *)(v28 - 112));
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18FB74E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  objc_destroyWeak(v27);
  objc_destroyWeak((id *)(v28 - 112));
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18FB7527C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18FB75800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18FB75D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FB760A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_18FB76664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

id PSPointerVibrantColorMatrixForLuminance(uint64_t a1)
{
  int v2 = _AXSPointerIncreasedContrastEnabled();
  if (a1 == 2)
  {
    if (v2) {
      uint64_t v3 = &xmmword_18FB78E08;
    }
    else {
      uint64_t v3 = &xmmword_18FB78E58;
    }
  }
  else if (v2)
  {
    uint64_t v3 = &xmmword_18FB78EA8;
  }
  else
  {
    uint64_t v3 = &xmmword_18FB78EF8;
  }
  long long v4 = v3[3];
  v8[2] = v3[2];
  v8[3] = v4;
  v8[4] = v3[4];
  long long v5 = v3[1];
  v8[0] = *v3;
  v8[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v8];
  return v6;
}

void PSIntensityForLuminanceAndUsage(uint64_t a1, uint64_t a2)
{
  int v4 = _AXSPointerIncreasedContrastEnabled();
  switch(a2)
  {
    case 1:
      long long v5 = _PSPointerSettingsInstance();
      [v5 materialAlphaDot];
      goto LABEL_9;
    case 2:
      long long v5 = _PSPointerSettingsInstance();
      [v5 materialAlphaIBeam];
      goto LABEL_9;
    case 3:
      int v6 = v4;
      v7 = _PSPointerSettingsInstance();
      long long v5 = v7;
      if (a1 == 1)
      {
        if (v6) {
          [v7 materialAlphaSmallItemDarkHighContrast];
        }
        else {
          [v7 materialAlphaSmallItemDark];
        }
      }
      else
      {
        [v7 materialAlphaSmallItemLight];
      }
LABEL_9:

      break;
    default:
      return;
  }
}

id _PSPointerSettingsInstance()
{
  if (_PSPointerSettingsInstance___onceToken != -1) {
    dispatch_once(&_PSPointerSettingsInstance___onceToken, &__block_literal_global_1);
  }
  v0 = (void *)_PSPointerSettingsInstance___psPointerSettings;
  return v0;
}

id PSContentOverlayVibrantColorMatrixForLuminance(uint64_t a1)
{
  if (a1 == 2) {
    v1 = &xmmword_18FB78F48;
  }
  else {
    v1 = &xmmword_18FB78F98;
  }
  long long v2 = v1[3];
  v6[2] = v1[2];
  v6[3] = v2;
  v6[4] = v1[4];
  long long v3 = v1[1];
  v6[0] = *v1;
  v6[1] = v3;
  int v4 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v6];
  return v4;
}

double PSContentOverlayIntensityForLuminanceAndUsage(uint64_t a1, uint64_t a2)
{
  double result = 0.9;
  if (a2 != 1) {
    return 0.5;
  }
  return result;
}

__CFString *PSPointerAutohideReasonToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"PSPointerAutohideReasonUnknown";
  }
  else {
    return off_1E5667EC0[a1 - 1];
  }
}

__CFString *PSPointerForceVisibleReasonToString(uint64_t a1)
{
  if (a1) {
    return @"PSPointerForceVisibleReasonSystemComponentRequest";
  }
  else {
    return @"PSPointerForceVisibleReasonUnknown";
  }
}

__CFString *PSPointerClientInteractionStateToString(uint64_t a1)
{
  v1 = @"PSPointerClientInteractionStateHighVelocity";
  if (!a1) {
    v1 = @"PSPointerClientInteractionStateDisabled";
  }
  if (a1 == 1) {
    return @"PSPointerClientInteractionStateEnabled";
  }
  else {
    return v1;
  }
}

__CFString *PSPointerVisibilityStateToString(uint64_t a1)
{
  if (a1) {
    return @"PSPointerVisibilityStateVisible";
  }
  else {
    return @"PSPointerVisibilityStateHidden";
  }
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1F410C2B8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1F410C328]();
}

uint64_t BSRectEqualToRect()
{
  return MEMORY[0x1F410C530]();
}

uint64_t BSStringFromCGPoint()
{
  return MEMORY[0x1F410C658]();
}

uint64_t BSStringFromCGRect()
{
  return MEMORY[0x1F410C660]();
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB010](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

BOOL CGPathEqualToPath(CGPathRef path1, CGPathRef path2)
{
  return MEMORY[0x1F40DB0C8](path1, path2);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x1F40DB0D0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGPathGetNumberOfPoints()
{
  return MEMORY[0x1F40DB0E8]();
}

uint64_t CGPathIsEllipse()
{
  return MEMORY[0x1F40DB110]();
}

uint64_t CGPathIsRoundedRect()
{
  return MEMORY[0x1F40DB150]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t _AXSPointerIncreasedContrastEnabled()
{
  return MEMORY[0x1F4178E00]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}