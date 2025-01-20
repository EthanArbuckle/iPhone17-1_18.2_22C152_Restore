uint64_t UISIndexForFontWeight(double a1)
{
  uint64_t result;

  for (result = 0; result != 9; ++result)
  {
    if (*(double *)(MEMORY[0x1E4F24478] + 8 * result) > a1) {
      break;
    }
  }
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

uint64_t _UISVisibilityEnvironmentForSceneIdentityTokenString(uint64_t a1)
{
  return [NSString stringWithFormat:@"UIScene:%@", a1];
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_191AC0FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_191AC12C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL isEqual(const void *a1, const void *a2)
{
  return CFEqual(a1, a2) != 0;
}

id _UISStateServiceLogger()
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = ___UISCreateLoggerIfNeeded_block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &_UISStateServiceLogger_logging;
  v2[5] = "stateService";
  if (_UISStateServiceLogger_logging != -1) {
    dispatch_once(&_UISStateServiceLogger_logging, v2);
  }
  v0 = (void *)qword_1E92E0618;
  return v0;
}

void sub_191AC2F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double UISColorLuminance(CGColor *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  ColorSpace = CGColorGetColorSpace(a1);
  CFStringRef Name = CGColorSpaceGetName(ColorSpace);
  Components = CGColorGetComponents(a1);
  if (CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DC88]) || CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DBE0]))
  {
    double v5 = *Components * 0.222495198 + Components[1] * 0.716895044;
    double v6 = Components[2];
LABEL_4:
    double v7 = v5 + v6 * 0.0606097579;
    return fmin(fmax(v7, 0.0), 1.0);
  }
  if (CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DC98]) || CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DBE8]))
  {
    uint64_t v10 = 0;
    v11.f64[0] = NAN;
    v11.f64[1] = NAN;
    int8x16_t v12 = (int8x16_t)vnegq_f64(v11);
    int8x16_t v14 = v12;
    do
    {
      *(CGFloat *)v9.i64 = Components[v10];
      double v13 = fabs(*(double *)v9.i64);
      if (v13 >= 0.04045)
      {
        int8x16_t v15 = v9;
        v11.f64[0] = pow(v13 * 0.947867 + 0.0521327, 2.4);
        int8x16_t v12 = v14;
        int8x16_t v9 = v15;
      }
      else
      {
        v11.f64[0] = v13 * 0.0773994;
      }
      float64x2_t v11 = (float64x2_t)vbslq_s8(v12, (int8x16_t)v11, v9);
      *(double *)((char *)&v16 + v10 * 8) = v11.f64[0];
      ++v10;
    }
    while (v10 != 3);
    double v5 = v16 * 0.222495198 + v17 * 0.716895044;
    double v6 = v18;
    goto LABEL_4;
  }
  UISCreateCachedColorTransform((__CFString *)*MEMORY[0x1E4F1DC20]);
  if (CGColorTransformConvertColorComponents()) {
    double v7 = v17;
  }
  else {
    double v7 = 0.0;
  }
  CGColorTransformRelease();
  return fmin(fmax(v7, 0.0), 1.0);
}

void *UISCreateCachedColorTransform(__CFString *key)
{
  if (UISCreateCachedColorTransform_onceToken != -1) {
    dispatch_once(&UISCreateCachedColorTransform_onceToken, &__block_literal_global_3);
  }
  value_out = 0;
  if (cache_get_and_retain((cache_t *)UISCreateCachedColorTransform_colorTransformCache, key, &value_out))
  {
    v2 = CGColorSpaceCreateWithName(key);
    v3 = (void *)MEMORY[0x192FE0D80](v2, 0);
    value_out = v3;
    if (v3) {
      cache_set_and_retain((cache_t *)UISCreateCachedColorTransform_colorTransformCache, key, v3, 0);
    }
    CGColorSpaceRelease(v2);
    v4 = value_out;
    if (value_out) {
      goto LABEL_7;
    }
  }
  else
  {
    v4 = (void *)CGColorTransformRetain();
    value_out = v4;
    if (v4)
    {
LABEL_7:
      cache_release_value((cache_t *)UISCreateCachedColorTransform_colorTransformCache, v4);
      return value_out;
    }
  }
  return 0;
}

void sub_191AC3FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFTypeRef retain1(const void *a1, void *a2)
{
  CFTypeRef result = CFRetain(a1);
  *a2 = result;
  return result;
}

void _UISSetSystemReferenceAngleDataSource(void *a1)
{
  id v1 = a1;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = [NSString stringWithUTF8String:"void _UISSetSystemReferenceAngleDataSource(id<_UISSystemReferenceAngleDataSource>  _Nonnull __strong)"];
    [v3 handleFailureInFunction:v4 file:@"UISSystemReferenceAngle.m" lineNumber:53 description:@"Must be called from the main thread."];
  }
  v2 = (void *)__datasource;
  __datasource = (uint64_t)v1;
}

uint64_t __UISCreateCachedColorTransform_block_invoke()
{
  cache_create("com.apple.UIKitServices.colorTransform", &_block_invoke_attrs, (cache_t **)&UISCreateCachedColorTransform_colorTransformCache);
  uint64_t v0 = UISCreateCachedColorTransform_colorTransformCache;
  return MEMORY[0x1F40CA640](v0, 8);
}

void sub_191AC5860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_191AC6020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_191AC6198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id UISSecureControlServiceInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE29EFB8];
  id v1 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE29F018];
  [v0 setInterface:v1 forSelector:sel_getSizeToolWithReply_ argumentIndex:0 ofReply:1];

  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE299740];
  [v0 setInterface:v2 forSelector:sel_getSlotMachineWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

id UISSecureControlServiceSharedRemoteInterface()
{
  if (_MergedGlobals_3 != -1) {
    dispatch_once(&_MergedGlobals_3, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)qword_1EB288800;
  return v0;
}

void __UISSecureControlServiceSharedRemoteInterface_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F29268]);
  id v4 = (id)[v0 initWithServiceName:UISSecureControlServiceName];
  id v1 = UISSecureControlServiceInterface();
  [v4 setRemoteObjectInterface:v1];

  [v4 resume];
  uint64_t v2 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_59];
  v3 = (void *)qword_1EB288800;
  qword_1EB288800 = v2;
}

uint64_t _UISVisibilityEnvironmentForUIHostedWindowContextID(uint64_t a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"UIHostedWindow:%x", a1);
}

void UISCalloutBarFontSize(unint64_t a1)
{
  if (a1 >= 4)
  {
    if (_MergedGlobals_4 != -1) {
      dispatch_once(&_MergedGlobals_4, &__block_literal_global_2);
    }
    if (qword_1EB288818 != a1)
    {
      if (a1 >= 8) {
        uint64_t v2 = 8;
      }
      else {
        uint64_t v2 = a1;
      }
      UISGetFontContentSizeCategory(v2);
      v3 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
      id v4 = (void *)CTFontDescriptorCopyAttribute(v3, (CFStringRef)*MEMORY[0x1E4F245F0]);
      [v4 doubleValue];
      uint64_t v6 = v5;

      CFRelease(v3);
      UISCalloutBarFontSize_lastSizeCategoryFontSize = v6;
      qword_1EB288818 = a1;
    }
  }
}

void __UISCalloutBarFontSize_block_invoke()
{
  id v0 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  id v1 = (void *)CTFontDescriptorCopyAttribute(v0, (CFStringRef)*MEMORY[0x1E4F245F0]);
  [v1 doubleValue];
  uint64_t v3 = v2;

  CFRelease(v0);
  qword_1EB288810 = v3;
}

uint64_t UISSlotMachineInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE299740];
}

BOOL UISUserInterfaceStyleModeValueIsAutomatic(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFDLL) == 100;
}

BOOL UISUserInterfaceStyleModeOverridesEqual(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

BOOL UISUserInterfaceStyleModeSchedulesEqual(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

id _UISUserInterfaceStyleModeUserDefaults()
{
  if (qword_1EB288828 != -1) {
    dispatch_once(&qword_1EB288828, &__block_literal_global_3);
  }
  id v0 = (void *)_MergedGlobals_5;
  return v0;
}

void sub_191ACB6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getUNNotificationDefaultActionIdentifierSymbolLoc_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!qword_1EB288838)
  {
    v5[1] = (void *)MEMORY[0x1E4F143A8];
    v5[2] = (void *)3221225472;
    v5[3] = __UserNotificationsLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E5735280;
    uint64_t v7 = 0;
    qword_1EB288838 = _sl_dlopen();
  }
  uint64_t v2 = (void *)qword_1EB288838;
  if (!qword_1EB288838)
  {
    a1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *UserNotificationsLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"UISNotificationResponseAction.m", 18, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  CFTypeRef result = dlsym(v2, "UNNotificationDefaultActionIdentifier");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  _MergedGlobals_6 = *(void *)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t __UserNotificationsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB288838 = result;
  return result;
}

void sub_191ACC4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAPSConnectionClass_block_invoke(uint64_t a1)
{
  ApplePushServiceLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("APSConnection");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getAPSConnectionClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UISApplicationStateService.m", 25, @"Unable to find class %s", "APSConnection");

    __break(1u);
  }
}

void *ApplePushServiceLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ApplePushServiceLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __ApplePushServiceLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5735330;
    uint64_t v6 = 0;
    ApplePushServiceLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v0 = (void *)ApplePushServiceLibraryCore_frameworkLibrary;
  if (!ApplePushServiceLibraryCore_frameworkLibrary)
  {
    id v0 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *ApplePushServiceLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"UISApplicationStateService.m", 24, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __ApplePushServiceLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ApplePushServiceLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAPSEnvironmentProductionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = ApplePushServiceLibrary();
  uint64_t result = dlsym(v2, "APSEnvironmentProduction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB288848 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __DuetActivitySchedulerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB288858 = result;
  return result;
}

void sub_191ACE7F4(_Unwind_Exception *a1)
{
}

id getCKShareMetadataClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)_MergedGlobals_9;
  uint64_t v7 = _MergedGlobals_9;
  if (!_MergedGlobals_9)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCKShareMetadataClass_block_invoke;
    v3[3] = &unk_1E5735260;
    v3[4] = &v4;
    __getCKShareMetadataClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_191ACE93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKShareMetadataClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!qword_1EB288878)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __CloudKitLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E57353F8;
    uint64_t v8 = 0;
    qword_1EB288878 = _sl_dlopen();
  }
  if (!qword_1EB288878)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *CloudKitLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"UISHandleCloudKitShareAction.m", 19, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("CKShareMetadata");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"Class getCKShareMetadataClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"UISHandleCloudKitShareAction.m", 20, @"Unable to find class %s", "CKShareMetadata");

LABEL_10:
    __break(1u);
  }
  _MergedGlobals_9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB288878 = result;
  return result;
}

uint64_t UISGetFontContentSizeCategory(uint64_t result)
{
  switch(result)
  {
    case 0:
      id v1 = (uint64_t *)MEMORY[0x1E4F24460];
      goto LABEL_14;
    case 1:
      id v1 = (uint64_t *)MEMORY[0x1E4F24450];
      goto LABEL_14;
    case 2:
      id v1 = (uint64_t *)MEMORY[0x1E4F24448];
      goto LABEL_14;
    case 3:
      id v1 = (uint64_t *)MEMORY[0x1E4F24440];
      goto LABEL_14;
    case 4:
      id v1 = (uint64_t *)MEMORY[0x1E4F24458];
      goto LABEL_14;
    case 5:
      id v1 = (uint64_t *)MEMORY[0x1E4F24468];
      goto LABEL_14;
    case 6:
      id v1 = (uint64_t *)MEMORY[0x1E4F24470];
      goto LABEL_14;
    case 7:
      id v1 = (uint64_t *)MEMORY[0x1E4F24420];
      goto LABEL_14;
    case 8:
      id v1 = (uint64_t *)MEMORY[0x1E4F24418];
      goto LABEL_14;
    case 9:
      id v1 = (uint64_t *)MEMORY[0x1E4F24428];
      goto LABEL_14;
    case 10:
      id v1 = (uint64_t *)MEMORY[0x1E4F24430];
      goto LABEL_14;
    case 11:
      id v1 = (uint64_t *)MEMORY[0x1E4F24438];
LABEL_14:
      uint64_t result = *v1;
      break;
    default:
      return result;
  }
  return result;
}

double UISFontWeightForIndex(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1E4F24478] + 8 * a1 - 8;
  if (a1 > 9 || a1 == 0) {
    uint64_t v1 = MEMORY[0x1E4F246C0];
  }
  return *(double *)v1;
}

void sub_191AD1F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 152));
  _Unwind_Resume(a1);
}

void sub_191AD25E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _UISTouchAuthenticationTelemetryReportRecord(void *a1)
{
}

void _UISTouchAuthenticationTelemetryReportRecordWithDuration(void *a1, int a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  if (!v3)
  {
    int8x16_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    double v13 = objc_msgSend(NSString, "stringWithUTF8String:", "void _UISTouchAuthenticationTelemetryReportRecordWithDuration(_UISTouchAuthenticationRecord * _Nonnull __strong, BOOL)");
    [v12 handleFailureInFunction:v13, @"_UISTouchAuthenticationTelemetry.m", 90, @"Invalid parameter not satisfying: %@", @"record" file lineNumber description];
  }
  id v4 = [v3 hostBundleId];
  if (os_variant_has_internal_diagnostics())
  {

LABEL_9:
    uint64_t v14 = -[_UISTouchAuthenticationRecord analyticsPayloadWithDuration:]((uint64_t)v3, a2);
    id v8 = v14;
    AnalyticsSendEventLazy();

    goto LABEL_10;
  }
  if (qword_1EB2888A8 != -1) {
    dispatch_once(&qword_1EB2888A8, &__block_literal_global_9);
  }
  v17.tv_seCC_SHA256_CTX c = 0;
  *(void *)&v17.tv_useCC_SHA256_CTX c = 0;
  memset(&v16, 0, sizeof(v16));
  gettimeofday(&v17, 0);
  localtime_r(&v17.tv_sec, &v16);
  int data = v16.tm_yday + 366 * v16.tm_year;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, &unk_1EB2888B8, 0x10u);
  CC_SHA256_Update(&c, &data, 4u);
  if (v4)
  {
    long long v5 = (const char *)[v4 UTF8String];
    CC_LONG v6 = strlen(v5);
    CC_SHA256_Update(&c, v5, v6);
  }
  CC_SHA256_Final(md, &c);
  unsigned int v7 = *(unsigned __int16 *)md >> 1;

  if (v7 <= 0xCCC) {
    goto LABEL_9;
  }
LABEL_10:
  if (qword_1EB2888B0 != -1) {
    dispatch_once(&qword_1EB2888B0, &__block_literal_global_22);
  }
  if (_MergedGlobals_12)
  {
    uint64_t v9 = _UISViewServiceTouchAuthenticationTelemetry();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = @"NO";
      if (v3 && v3[65]) {
        uint64_t v10 = @"YES";
      }
      float64x2_t v11 = -[_UISTouchAuthenticationRecord analyticsPayloadWithDuration:]((uint64_t)v3, a2);
      c.count[0] = 138543618;
      *(void *)&c.count[1] = v10;
      LOWORD(c.hash[1]) = 2114;
      *(void *)((char *)&c.hash[1] + 2) = v11;
      _os_log_impl(&dword_191ABF000, v9, OS_LOG_TYPE_DEFAULT, "Dispatching record (authentiCC_SHA256_CTX c = %{public}@) to analytics with payload: %{public}@", (uint8_t *)&c, 0x16u);
    }
  }
}

CGImageRef UISCreateImageFromDrawing(void *a1, unint64_t a2, CGFloat a3)
{
  id v5 = a1;
  [v5 drawingSize];
  double v8 = v7;
  double v9 = v6;
  if (v7 <= 0.0 || v6 <= 0.0)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = objc_msgSend(NSString, "stringWithUTF8String:", "CGImageRef  _Nonnull UISCreateImageFromDrawing(__strong id<UISDrawing> _Nonnull, CGFloat, UISDisplayRange)");
    [v20 handleFailureInFunction:v21, @"UISDrawing.m", 17, @"Invalid parameter not satisfying: %@", @"size.width > 0.0 && size.height > 0.0" file lineNumber description];
  }
  if (a3 <= 0.0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = objc_msgSend(NSString, "stringWithUTF8String:", "CGImageRef  _Nonnull UISCreateImageFromDrawing(__strong id<UISDrawing> _Nonnull, CGFloat, UISDisplayRange)");
    [v22 handleFailureInFunction:v23, @"UISDrawing.m", 18, @"Invalid parameter not satisfying: %@", @"scale > 0.0" file lineNumber description];
  }
  if (a2 >= 3)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    v25 = objc_msgSend(NSString, "stringWithUTF8String:", "CGImageRef  _Nonnull UISCreateImageFromDrawing(__strong id<UISDrawing> _Nonnull, CGFloat, UISDisplayRange)");
    [v24 handleFailureInFunction:v25, @"UISDrawing.m", 19, @"Invalid parameter not satisfying: %@", @"range <= UISDisplayRangeLast" file lineNumber description];
  }
  size_t v10 = vcvtpd_u64_f64(v8 * a3);
  size_t v11 = vcvtpd_u64_f64(v9 * a3);
  if (a2 > 2)
  {
    int8x16_t v15 = 0;
    size_t v13 = 0;
    uint32_t v14 = 0;
  }
  else
  {
    int8x16_t v12 = (CFStringRef *)qword_1E5735588[a2];
    size_t v13 = qword_191AE26F0[a2];
    uint32_t v14 = dword_191AE2720[a2];
    int8x16_t v15 = CGColorSpaceCreateWithName(*v12);
  }
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  timeval v17 = CGBitmapContextCreate(0, v10, v11, v13, AlignedBytesPerRow, v15, v14);
  if (!v17)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    v27 = objc_msgSend(NSString, "stringWithUTF8String:", "CGImageRef  _Nonnull UISCreateImageFromDrawing(__strong id<UISDrawing> _Nonnull, CGFloat, UISDisplayRange)");
    [v26 handleFailureInFunction:v27, @"UISDrawing.m", 57, @"Invalid parameter not satisfying: %@", @"imageContext" file lineNumber description];
  }
  CGColorSpaceRelease(v15);
  CGContextTranslateCTM(v17, 0.0, (double)v11);
  CGContextScaleCTM(v17, a3, -a3);
  CGContextGetCTM(&v30, v17);
  CGContextSetBaseCTM();
  objc_msgSend(v5, "drawInContext:atPoint:", v17, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  CGImageRef Image = CGBitmapContextCreateImage(v17);
  if (!Image)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = objc_msgSend(NSString, "stringWithUTF8String:", "CGImageRef  _Nonnull UISCreateImageFromDrawing(__strong id<UISDrawing> _Nonnull, CGFloat, UISDisplayRange)");
    [v28 handleFailureInFunction:v29, @"UISDrawing.m", 68, @"Invalid parameter not satisfying: %@", @"image" file lineNumber description];
  }
  CGContextRelease(v17);
  return Image;
}

void sub_191AD45EC(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  if (a2 == 2)
  {
    id v12 = objc_begin_catch(a1);
    NSLog(&cfstr_SExceptionDeco_0.isa);

    objc_end_catch();
    JUMPOUT(0x191AD457CLL);
  }
  objc_begin_catch(a1);
  JUMPOUT(0x191AD4580);
}

void sub_191AD466C()
{
  if (v0) {
    JUMPOUT(0x191AD4674);
  }
  JUMPOUT(0x191AD4678);
}

void sub_191AD485C(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  if (a2 == 2)
  {
    id v12 = objc_begin_catch(a1);
    NSLog(&cfstr_SExceptionDeco_0.isa);

    objc_end_catch();
    JUMPOUT(0x191AD47E8);
  }
  objc_begin_catch(a1);
  JUMPOUT(0x191AD47ECLL);
}

void sub_191AD48DC()
{
  if (v0) {
    JUMPOUT(0x191AD48E4);
  }
  JUMPOUT(0x191AD48E8);
}

void sub_191AD4DF4(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  if (a2 == 2)
  {
    id v12 = objc_begin_catch(a1);
    NSLog(&cfstr_SExceptionDeco_1.isa);

    objc_end_catch();
    JUMPOUT(0x191AD4D84);
  }
  objc_begin_catch(a1);
  JUMPOUT(0x191AD4D88);
}

void sub_191AD502C(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  if (a2 == 2)
  {
    id v12 = objc_begin_catch(a1);
    NSLog(&cfstr_SExceptionDeco_2.isa);

    objc_end_catch();
    JUMPOUT(0x191AD4FBCLL);
  }
  objc_begin_catch(a1);
  JUMPOUT(0x191AD4FC0);
}

void __getINIntentClass_block_invoke(uint64_t a1)
{
  IntentsLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("INIntent");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getINIntentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getINIntentClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UISIntentForwardingAction.m", 22, @"Unable to find class %s", "INIntent");

    __break(1u);
  }
}

void IntentsLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!IntentsLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __IntentsLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E57355F0;
    uint64_t v5 = 0;
    IntentsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IntentsLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *IntentsLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"UISIntentForwardingAction.m", 21, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  int v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __IntentsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IntentsLibraryCore_frameworkLibrary = result;
  return result;
}

void __getINIntentForwardingActionClass_block_invoke(uint64_t a1)
{
  IntentsLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("INIntentForwardingAction");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getINIntentForwardingActionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getINIntentForwardingActionClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UISIntentForwardingAction.m", 24, @"Unable to find class %s", "INIntentForwardingAction");

    __break(1u);
  }
}

void __getINIntentResponseClass_block_invoke(uint64_t a1)
{
  IntentsLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("INIntentResponse");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getINIntentResponseClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getINIntentResponseClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UISIntentForwardingAction.m", 23, @"Unable to find class %s", "INIntentResponse");

    __break(1u);
  }
}

void __getINIntentForwardingActionResponseClass_block_invoke(uint64_t a1)
{
  IntentsLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("INIntentForwardingActionResponse");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getINIntentForwardingActionResponseClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getINIntentForwardingActionResponseClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UISIntentForwardingAction.m", 25, @"Unable to find class %s", "INIntentForwardingActionResponse");

    __break(1u);
  }
}

uint64_t UISSystemReferenceAngleModeForContextID(uint64_t a1)
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"UISSystemReferenceAngleMode UISSystemReferenceAngleModeForContextID(uint32_t)"];
    [v4 handleFailureInFunction:v5 file:@"UISSystemReferenceAngle.m" lineNumber:43 description:@"Must be called from the main thread."];
  }
  uint64_t v2 = (void *)__datasource;
  return [v2 _systemReferenceAngleModeForContextID:a1];
}

uint64_t UISSystemReferenceAngleForContextID(uint64_t a1)
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"CGFloat UISSystemReferenceAngleForContextID(uint32_t)"];
    [v4 handleFailureInFunction:v5 file:@"UISSystemReferenceAngle.m" lineNumber:48 description:@"Must be called from the main thread."];
  }
  uint64_t v2 = (void *)__datasource;
  return [v2 _systemReferenceAngleForContextID:a1];
}

__CFString *_UISStringForSystemReferenceAngleMode(uint64_t a1)
{
  uint64_t v1 = @"Unknown";
  if (a1 == 2) {
    uint64_t v1 = @"Defined";
  }
  if (a1 == 1) {
    return @"Undefined";
  }
  else {
    return v1;
  }
}

id getSBSApplicationShortcutItemClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  int v0 = (void *)_MergedGlobals_13;
  uint64_t v7 = _MergedGlobals_13;
  if (!_MergedGlobals_13)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSBSApplicationShortcutItemClass_block_invoke;
    v3[3] = &unk_1E5735260;
    v3[4] = &v4;
    __getSBSApplicationShortcutItemClass_block_invoke((uint64_t)v3);
    int v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_191AD7E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_191AD7FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSBSApplicationShortcutItemClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!qword_1EB2888D0)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __SpringBoardServicesLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5735660;
    uint64_t v8 = 0;
    qword_1EB2888D0 = _sl_dlopen();
  }
  if (!qword_1EB2888D0)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *SpringBoardServicesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"UISHandleApplicationShortcutAction.m", 21, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("SBSApplicationShortcutItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getSBSApplicationShortcutItemClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"UISHandleApplicationShortcutAction.m", 23, @"Unable to find class %s", "SBSApplicationShortcutItem");

LABEL_10:
    __break(1u);
  }
  _MergedGlobals_13 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB2888D0 = result;
  return result;
}

Class __getUIApplicationShortcutItemClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!qword_1EB2888E0)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __UIKitCoreLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5735678;
    uint64_t v8 = 0;
    qword_1EB2888E0 = _sl_dlopen();
  }
  if (!qword_1EB2888E0)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *UIKitCoreLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"UISHandleApplicationShortcutAction.m", 16, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("UIApplicationShortcutItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getUIApplicationShortcutItemClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"UISHandleApplicationShortcutAction.m", 18, @"Unable to find class %s", "UIApplicationShortcutItem");

LABEL_10:
    __break(1u);
  }
  qword_1EB2888D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UIKitCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB2888E0 = result;
  return result;
}

__CFString *UISLocalizedStringForSecureName(unsigned int a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = HIWORD(a1);
  if (HIWORD(a1))
  {
    uint64_t v5 = @"System/Library/PrivateFrameworks/UIKitServices.framework";
    if (v4 != 1) {
      uint64_t v5 = 0;
    }
    if (v4 == 2) {
      uint64_t v6 = @"System/Library/Frameworks/CoreLocationUI.framework";
    }
    else {
      uint64_t v6 = v5;
    }
    long long v7 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:"/" isDirectory:1 relativeToURL:0];
    uint64_t v9 = [v7 fileURLWithPath:v6 isDirectory:1 relativeToURL:v8];

    size_t v10 = [MEMORY[0x1E4F28B50] bundleWithURL:v9];
    size_t v11 = [&unk_1EE2958B0 objectAtIndexedSubscript:HIWORD(a1)];
    id v12 = [v11 objectAtIndexedSubscript:(unsigned __int16)a1];

    size_t v13 = [v10 localizedStringForKey:v12 value:v12 table:0 localization:v3];
  }
  else
  {
    size_t v13 = &stru_1EE28C550;
  }

  return v13;
}

__CFString *NSStringForUISScenePlacementType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7) {
    return @"<none>";
  }
  else {
    return off_1E57356D8[a1 - 1];
  }
}

uint64_t UISGetColorSRGBComponents(CGColor *a1, uint64_t a2)
{
  Components = CGColorGetComponents(a1);
  ColorSpace = CGColorGetColorSpace(a1);
  CFStringRef Name = CGColorSpaceGetName(ColorSpace);
  uint64_t result = CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DC98]);
  if (result
    || (uint64_t v8 = (__CFString *)*MEMORY[0x1E4F1DBE8], result = CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DBE8]), result))
  {
    for (uint64_t i = 0; i != 3; ++i)
      *(CGFloat *)(a2 + i * _Block_object_dispose(&a9, 8) = Components[i];
    *(CGFloat *)(a2 + 24) = Components[3];
  }
  else
  {
    UISCreateCachedColorTransform(v8);
    if (CGColorTransformConvertColorComponents())
    {
      *(CGFloat *)(a2 + 24) = Components[CGColorGetNumberOfComponents(a1) - 1];
    }
    else
    {
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
    }
    return CGColorTransformRelease();
  }
  return result;
}

uint64_t UISIsColorInDisplayP3Gamut(CGColor *a1)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  Components = CGColorGetComponents(a1);
  ColorSpace = CGColorGetColorSpace(a1);
  CFStringRef Name = CGColorSpaceGetName(ColorSpace);
  if (CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DC98]) || CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DC88])) {
    return 1;
  }
  if ((CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DBE8]) || CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DBE0]))
    && *Components >= 0.0
    && *Components <= 1.001)
  {
    unint64_t v5 = 0;
    while (v5 != 2)
    {
      unint64_t v6 = v5;
      double v7 = Components[v5 + 1];
      if (v7 >= 0.0)
      {
        ++v5;
        if (v7 <= 1.001) {
          continue;
        }
      }
      if (v6 > 1) {
        return 1;
      }
      goto LABEL_12;
    }
    return 1;
  }
LABEL_12:
  if (CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DB90]) || CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DC70])) {
    return 1;
  }
  size_t v10 = (__CFString *)*MEMORY[0x1E4F1DBB0];
  if ((CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DBB0]) || CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DBC8]))
    && *Components >= 0.0
    && *Components <= 1.001)
  {
    unint64_t v11 = 0;
    while (v11 != 2)
    {
      unint64_t v12 = v11;
      double v13 = Components[v11 + 1];
      if (v13 >= 0.0)
      {
        ++v11;
        if (v13 <= 1.001) {
          continue;
        }
      }
      if (v12 > 1) {
        return 1;
      }
      goto LABEL_25;
    }
    return 1;
  }
LABEL_25:
  UISCreateCachedColorTransform(v10);
  BOOL v8 = 0;
  if (CGColorTransformConvertColorComponents())
  {
    BOOL v8 = 0;
    if (v17 >= 0.0 && v17 <= 1.001)
    {
      unint64_t v14 = 0;
      do
      {
        unint64_t v15 = v14;
        if (v14 == 2) {
          break;
        }
        double v16 = *(double *)&v18[v14];
        if (v16 < 0.0) {
          break;
        }
        ++v14;
      }
      while (v16 <= 1.001);
      BOOL v8 = v15 > 1;
    }
  }
  CGColorTransformRelease();
  return v8;
}

CGColorRef UISCreateColorWithLuminance(CGColor *a1, double a2, CGFloat a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  ColorSpace = CGColorGetColorSpace(a1);
  size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
  BOOL v8 = CGColorGetComponents(a1);
  CFStringRef Name = CGColorSpaceGetName(ColorSpace);
  size_t v10 = (const void *)*MEMORY[0x1E4F1DC88];
  uint64_t v11 = CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DC88]);
  if (v11
    || (v12 = (__CFString *)*MEMORY[0x1E4F1DBE0], uint64_t v11 = CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DBE0]), v11))
  {
    for (uint64_t i = 0; i != 3; ++i)
      components[i] = v8[i];
  }
  else
  {
    uint64_t v11 = CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DC98]);
    if (v11 || (uint64_t v11 = CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DBE8]), v11))
    {
      uint64_t v26 = 0;
      v27.f64[0] = NAN;
      v27.f64[1] = NAN;
      int8x16_t v28 = (int8x16_t)vnegq_f64(v27);
      int8x16_t v38 = v28;
      do
      {
        *(CGFloat *)v25.i64 = v8[v26];
        double v29 = fabs(*(double *)v25.i64);
        if (v29 >= 0.04045)
        {
          int8x16_t v39 = v25;
          v27.f64[0] = pow(v29 * 0.947867 + 0.0521327, 2.4);
          int8x16_t v28 = v38;
          int8x16_t v25 = v39;
        }
        else
        {
          v27.f64[0] = v29 * 0.0773994;
        }
        float64x2_t v27 = (float64x2_t)vbslq_s8(v28, (int8x16_t)v27, v25);
        components[v26++] = v27.f64[0];
      }
      while (v26 != 3);
    }
    else
    {
      UISCreateCachedColorTransform(v12);
      CGColorTransformConvertColorComponents();
      uint64_t v11 = CGColorTransformRelease();
    }
  }
  double v14 = fmin(fmax(components[0] * 0.222495198 + components[1] * 0.716895044 + v41 * 0.0606097579, 0.0), 1.0);
  if (v14 <= a2)
  {
    if (v14 >= a2) {
      return CGColorCreateCopyWithAlpha(a1, a3);
    }
    uint64_t v17 = 0;
    double v18 = (a2 + -1.0) / (v14 + -1.0);
    do
    {
      components[v17] = 1.0 - v18 + v18 * components[v17];
      ++v17;
    }
    while (v17 != 3);
  }
  else
  {
    uint64_t v15 = 0;
    double v16 = a2 / v14;
    do
    {
      components[v15] = v16 * components[v15];
      ++v15;
    }
    while (v15 != 3);
  }
  MEMORY[0x1F4188790](v11);
  uint64_t v20 = (double *)((char *)v38.i64 - ((v19 + 23) & 0xFFFFFFFFFFFFFFF0));
  v21 = (__CFString *)CGColorSpaceGetName(ColorSpace);
  if (CFEqual(v21, v10)
    || (CFStringRef v22 = (const __CFString *)*MEMORY[0x1E4F1DBE0], CFEqual(v21, (CFTypeRef)*MEMORY[0x1E4F1DBE0])))
  {
    *(_OWORD *)uint64_t v20 = *(_OWORD *)components;
    v20[2] = v41;
  }
  else if (CFEqual(v21, (CFTypeRef)*MEMORY[0x1E4F1DC98]) || CFEqual(v21, (CFTypeRef)*MEMORY[0x1E4F1DBE8]))
  {
    uint64_t v31 = 0;
    v32.f64[0] = NAN;
    v32.f64[1] = NAN;
    int8x16_t v33 = (int8x16_t)vnegq_f64(v32);
    int8x16_t v38 = v33;
    do
    {
      *(CGFloat *)v30.i64 = components[v31];
      double v34 = fabs(*(double *)v30.i64);
      if (v34 >= 0.0031308)
      {
        int8x16_t v39 = v30;
        v32.f64[0] = pow(v34 * 1.13712, 0.416667);
        int8x16_t v33 = v38;
        int8x16_t v30 = v39;
        v32.f64[0] = v32.f64[0] + -0.055;
      }
      else
      {
        v32.f64[0] = v34 * 12.92;
      }
      float64x2_t v32 = (float64x2_t)vbslq_s8(v33, (int8x16_t)v32, v30);
      v20[v31++] = v32.f64[0];
    }
    while (v31 != 3);
  }
  else
  {
    if (v21) {
      UISCreateCachedColorTransform(v21);
    }
    else {
      MEMORY[0x192FE0D80](ColorSpace, 0);
    }
    v35 = CGColorSpaceCreateWithName(v22);
    int v36 = CGColorTransformConvertColorComponents();
    CGColorTransformRelease();
    CGColorSpaceRelease(v35);
    if (!v36)
    {
      CGFloat v42 = a3;
      v37 = CGColorSpaceCreateWithName(v22);
      CGColorRef v23 = CGColorCreate(v37, components);
      CGColorSpaceRelease(v37);
      return v23;
    }
  }
  v20[NumberOfComponents] = a3;
  return CGColorCreate(ColorSpace, v20);
}

Class __getCADisplayClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!qword_1EB288920)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __QuartzCoreLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5735760;
    uint64_t v8 = 0;
    qword_1EB288920 = _sl_dlopen();
  }
  if (!qword_1EB288920)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    unsigned int v4 = [NSString stringWithUTF8String:"void *QuartzCoreLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"UISDisplayContext.m", 20, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("CADisplay");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v5 = [NSString stringWithUTF8String:"Class getCADisplayClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"UISDisplayContext.m", 21, @"Unable to find class %s", "CADisplay");

LABEL_10:
    __break(1u);
  }
  _MergedGlobals_16 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __QuartzCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB288920 = result;
  return result;
}

void sub_191ADBE14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getFBProcessManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!qword_1EB288940)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __FrontBoardLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5735890;
    uint64_t v8 = 0;
    qword_1EB288940 = _sl_dlopen();
  }
  if (!qword_1EB288940)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    unsigned int v4 = [NSString stringWithUTF8String:"void *FrontBoardLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"UISApplicationSupportService.m", 31, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("FBProcessManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v5 = [NSString stringWithUTF8String:"Class getFBProcessManagerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"UISApplicationSupportService.m", 32, @"Unable to find class %s", "FBProcessManager");

LABEL_10:
    __break(1u);
  }
  qword_1EB288938 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FrontBoardLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB288940 = result;
  return result;
}

id _UISSlotMachineServiceLogger()
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = ___UISCreateLoggerIfNeeded_block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &_UISSlotMachineServiceLogger_logging;
  v2[5] = "slotMachineService";
  if (_UISSlotMachineServiceLogger_logging != -1) {
    dispatch_once(&_UISSlotMachineServiceLogger_logging, v2);
  }
  int v0 = (void *)qword_1E92E0640;
  return v0;
}

id _UISUserInterfaceStyleModeServiceLogger()
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = ___UISCreateLoggerIfNeeded_block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &_UISUserInterfaceStyleModeServiceLogger_logging;
  v2[5] = "userInterfaceStyleModeService";
  if (_UISUserInterfaceStyleModeServiceLogger_logging != -1) {
    dispatch_once(&_UISUserInterfaceStyleModeServiceLogger_logging, v2);
  }
  int v0 = (void *)qword_1E92E0650;
  return v0;
}

id _UISViewServiceHitTestLogger()
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = ___UISCreateLoggerIfNeeded_block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &_UISViewServiceHitTestLogger_logging;
  v2[5] = "viewServiceHitTest";
  if (_UISViewServiceHitTestLogger_logging != -1) {
    dispatch_once(&_UISViewServiceHitTestLogger_logging, v2);
  }
  int v0 = (void *)qword_1E92E0600;
  return v0;
}

id _UISViewServiceTouchAuthenticationTelemetry()
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = ___UISCreateLoggerIfNeeded_block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &_UISViewServiceTouchAuthenticationTelemetry_logging;
  v2[5] = "viewServiceTouchAuthenticationTelemetry";
  if (_UISViewServiceTouchAuthenticationTelemetry_logging != -1) {
    dispatch_once(&_UISViewServiceTouchAuthenticationTelemetry_logging, v2);
  }
  int v0 = (void *)qword_1E92E0660;
  return v0;
}

void sub_191ADDE64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _UISNearlyEqual(double a1, double a2)
{
  BOOL v2 = ((*(uint64_t *)&a1 >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ *(void *)&a1)
     - ((*(uint64_t *)&a2 >> 63) & 0x7FFFFFFFFFFFFFFFuLL ^ *(void *)&a2) < 0xB;
  if (a1 <= a2) {
    BOOL v2 = ((*(uint64_t *)&a2 >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ *(void *)&a2)
  }
       - ((*(uint64_t *)&a1 >> 63) & 0x7FFFFFFFFFFFFFFFuLL ^ *(void *)&a1) < 0xB;
  return a1 == a2 || v2;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<double>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a1);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F4119FE0]();
}

uint64_t BSDeserializeCGFloatFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F4119FF0]();
}

uint64_t BSDeserializeCGRectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F4119FF8]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1F411A020]();
}

uint64_t BSDispatchQueueAssertNot()
{
  return MEMORY[0x1F411A030]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1F411A038]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F411A060]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1F411A078]();
}

uint64_t BSLogCommon()
{
  return MEMORY[0x1F411A0B8]();
}

uint64_t BSSelfTaskHasEntitlement()
{
  return MEMORY[0x1F411A0F0]();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x1F411A0F8]();
}

uint64_t BSSerializeCGFloatToXPCDictionaryWithKey()
{
  return MEMORY[0x1F411A108]();
}

uint64_t BSSerializeCGRectToXPCDictionaryWithKey()
{
  return MEMORY[0x1F411A110]();
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40F4CE8](retstr, t);
}

BOOL CATransform3DIsAffine(CATransform3D *t)
{
  return MEMORY[0x1F40F4D00](t);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7110]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1F40D7240](alloc, str, attributes);
}

CFAttributedStringRef CFAttributedStringCreateWithSubstring(CFAllocatorRef alloc, CFAttributedStringRef aStr, CFRange range)
{
  return (CFAttributedStringRef)MEMORY[0x1F40D7260](alloc, aStr, range.location, range.length);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x1F40D7298](aStr);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1F40D7448](bundle);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return (CGAffineTransformComponents *)MEMORY[0x1F40D9798](retstr, transform);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1F40D9890]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D9988](color, alpha);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1F40D99D0](color1, color2);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x1F40D9A08](colorName);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9BE8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

uint64_t CGColorTransformConvertColorComponents()
{
  return MEMORY[0x1F40D9C98]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1F40D9CA8]();
}

uint64_t CGColorTransformRelease()
{
  return MEMORY[0x1F40D9CB8]();
}

uint64_t CGColorTransformRetain()
{
  return MEMORY[0x1F40D9CC0]();
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1F40DA0D8]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

uint64_t CGContextSetFontRenderingStyle()
{
  return MEMORY[0x1F40DA148]();
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1F40DA3A0]();
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0B0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

uint64_t CGPathCreateWithUnevenCornersRoundedRect()
{
  return MEMORY[0x1F40DB0C0]();
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB178](path);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1F40DF378](descriptor, matrix, size);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1F40DF3A8](descriptor, attribute);
}

uint64_t CTFontDescriptorCreateWithTextStyleAndAttributes()
{
  return MEMORY[0x1F40DF428]();
}

uint64_t CTFontDescriptorGetTextStyleSize()
{
  return MEMORY[0x1F40DF448]();
}

uint64_t CTFontGetAscentForSystemFontOfSize()
{
  return MEMORY[0x1F40DF4B0]();
}

uint64_t CTFontGetDescentForSystemFontOfSize()
{
  return MEMORY[0x1F40DF4E8]();
}

void CTFrameDraw(CTFrameRef frame, CGContextRef context)
{
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x1F40DF6B8](frame);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x1F40DF6E0](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1F40DF6E8](attrString);
}

uint64_t CTLineCreateFromLineWithOffset()
{
  return MEMORY[0x1F40DF758]();
}

CTLineRef CTLineCreateJustifiedLine(CTLineRef line, CGFloat justificationFactor, double justificationWidth)
{
  return (CTLineRef)MEMORY[0x1F40DF768](line, justificationFactor, justificationWidth);
}

uint64_t CTLineCreateTruncatedLineWithTokenHandler()
{
  return MEMORY[0x1F40DF788]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

uint64_t CTLineCreateWithString()
{
  return MEMORY[0x1F40DF7A0]();
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

uint64_t CTLineGetDefaultBounds()
{
  return MEMORY[0x1F40DF7D0]();
}

double CTLineGetPenOffsetForFlush(CTLineRef line, CGFloat flushFactor, double flushWidth)
{
  MEMORY[0x1F40DF7F8](line, flushFactor, flushWidth);
  return result;
}

CFRange CTLineGetStringRange(CTLineRef line)
{
  CFIndex v1 = MEMORY[0x1F40DF810](line);
  result.length = v2;
  result.location = v1;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x1F40DF820](line, ascent, descent, leading);
  return result;
}

uint64_t CTLineIsRightToLeft()
{
  return MEMORY[0x1F40DF838]();
}

uint64_t CTLineSuggestClusterBreakWithOffset()
{
  return MEMORY[0x1F40DF840]();
}

uint64_t CTLineSuggestLineBreakWithOffset()
{
  return MEMORY[0x1F40DF850]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1F417CE10]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1F40D8C30]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int cache_create(const char *name, const cache_attributes_t *attrs, cache_t **cache_out)
{
  return MEMORY[0x1F40CA5A8](name, attrs, cache_out);
}

int cache_get_and_retain(cache_t *cache, void *key, void **value_out)
{
  return MEMORY[0x1F40CA5C0](cache, key, value_out);
}

int cache_release_value(cache_t *cache, void *value)
{
  return MEMORY[0x1F40CA610](cache, value);
}

int cache_set_and_retain(cache_t *cache, void *key, void *value, cache_cost_t cost)
{
  return MEMORY[0x1F40CA630](cache, key, value, cost);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x1F40CC630](__x, __y);
  return result;
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x1F4181A90](a1, a2);
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

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEE68](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}