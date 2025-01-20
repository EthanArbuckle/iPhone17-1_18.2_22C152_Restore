uint64_t NCWidgetVisibilityPreferencesChanged(uint64_t a1, void *a2)
{
  return [a2 _widgetVisibilityPreferencesChanged];
}

id WGWidgetVisibilityManagerFirstPartyAvocadoBlackList()
{
  if (WGWidgetVisibilityManagerFirstPartyAvocadoBlackList_onceToken != -1) {
    dispatch_once(&WGWidgetVisibilityManagerFirstPartyAvocadoBlackList_onceToken, &__block_literal_global);
  }
  v0 = (void *)WGWidgetVisibilityManagerFirstPartyAvocadoBlackList_avocadoBlackList;
  return v0;
}

uint64_t NCXPCConnectionIsFromContainingAppOrWidgetWithIdentifier(void *a1, void *a2)
{
  id v3 = a2;
  [a1 processIdentifier];
  v4 = BSBundleIDForPID();
  if ([v4 isEqual:v3])
  {
    uint64_t v5 = 1;
  }
  else
  {
    v6 = WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v3);
    uint64_t v5 = [v4 isEqual:v6];
  }
  return v5;
}

id WGContainingBundleIdentifierForWidgetWithBundleIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    v2 = WGContainingBundleProxyForWidgetWithBundleIdentifer((uint64_t)v1);
    id v3 = [v2 bundleIdentifier];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id WGContainingBundleProxyForWidgetWithBundleIdentifer(uint64_t a1)
{
  id v1 = [MEMORY[0x263F018C0] pluginKitProxyForIdentifier:a1];
  v2 = [v1 containingBundle];

  return v2;
}

void sub_222E4B8B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromWGWidgetPinningTeachingAnimationViewState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"none";
  }
  else {
    return off_2646764B8[a1 - 1];
  }
}

void sub_222E4CA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222E4D594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
}

void __WGWidgetVisibilityManagerFirstPartyAvocadoBlackList_block_invoke()
{
  v0 = (void *)WGWidgetVisibilityManagerFirstPartyAvocadoBlackList_avocadoBlackList;
  WGWidgetVisibilityManagerFirstPartyAvocadoBlackList_avocadoBlackList = (uint64_t)&unk_26D5D4E88;
}

double _WGMainScreenScale()
{
  if (_WGMainScreenScale_onceToken != -1) {
    dispatch_once(&_WGMainScreenScale_onceToken, &__block_literal_global_0);
  }
  return *(double *)&_WGMainScreenScale___mainScreenScale;
}

uint64_t _WGGraphicsQuality()
{
  if (_WGGraphicsQuality_onceToken != -1) {
    dispatch_once(&_WGGraphicsQuality_onceToken, &__block_literal_global_8);
  }
  return _WGGraphicsQuality___graphicsQuality;
}

uint64_t _WGSupportsMetal()
{
  if (_WGSupportsMetal_onceToken != -1) {
    dispatch_once(&_WGSupportsMetal_onceToken, &__block_literal_global_14);
  }
  return _WGSupportsMetal___supportsMetal;
}

uint64_t _WGSupportsASTC()
{
  if (_WGSupportsASTC_onceToken != -1) {
    dispatch_once(&_WGSupportsASTC_onceToken, &__block_literal_global_19);
  }
  return _WGSupportsASTC___supportsASTC;
}

__CFString *WGStringForAppearState(unsigned int a1)
{
  if (a1 > 3) {
    return @"[Invalid]";
  }
  else {
    return off_2646765B0[a1];
  }
}

__CFString *WGStringFromUserInterfaceStyle(unint64_t a1)
{
  if (a1 > 2) {
    return @"[Unknown]";
  }
  else {
    return off_2646765D0[a1];
  }
}

id WGSafeCast(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id WGCachedNSHomeDirectory()
{
  if (WGCachedNSHomeDirectory_onceToken != -1) {
    dispatch_once(&WGCachedNSHomeDirectory_onceToken, &__block_literal_global_51);
  }
  v0 = (void *)WGCachedNSHomeDirectory___homeDir;
  return v0;
}

uint64_t __WGCachedNSHomeDirectory_block_invoke()
{
  WGCachedNSHomeDirectory___homeDir = NSHomeDirectory();
  return MEMORY[0x270F9A758]();
}

id WGCachesPathForSandboxPath(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    WGCachedNSHomeDirectory();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v2 = [v1 stringByAppendingPathComponent:@"Library/Caches"];

  return v2;
}

void WGEnsureDirectoryExistsAtPath(void *a1)
{
  id v3 = a1;
  int v1 = mkdir((const char *)[v3 fileSystemRepresentation], 0x1FFu);
  if (v1 && (v1 != -1 || *__error() != 17))
  {
    id v2 = [MEMORY[0x263F08850] defaultManager];
    [v2 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];
  }
}

id WGWidgetsFrameworkBundle()
{
  if (WGWidgetsFrameworkBundle___once != -1) {
    dispatch_once(&WGWidgetsFrameworkBundle___once, &__block_literal_global_57);
  }
  v0 = (void *)WGWidgetsFrameworkBundle___bundle;
  return v0;
}

uint64_t __WGWidgetsFrameworkBundle_block_invoke()
{
  WGWidgetsFrameworkBundle___bundle = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.widgets"];
  return MEMORY[0x270F9A758]();
}

double WGConvertDampingRatioResponseToMassStiffnessDamping(void *a1, double *a2, double *a3, double result, double a5)
{
  double v5 = 6.28318531 / a5;
  if (a1) {
    *a1 = 0x3FF0000000000000;
  }
  double v6 = v5 * v5;
  if (a2) {
    *a2 = v6;
  }
  if (a3)
  {
    double v7 = sqrt(v6);
    result = (v7 + v7) * result;
    *a3 = result;
  }
  return result;
}

void WGConvertTensionAndFrictionToDampingRatioResponseAndSettlingDuration(double *a1, double *a2, void *a3, double a4, double a5)
{
  double v10 = sqrt(a4);
  if (v10 + v10 < a5)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "void WGConvertTensionAndFrictionToDampingRatioResponseAndSettlingDuration(CGFloat, CGFloat, CGFloat *, CGFloat *, NSTimeInterval *)");
    [v12 handleFailureInFunction:v13, @"WGUtilities.m", 139, @"CA doesn't handle overdamped springs, these parameters are bad. Tension: %.2f Friction: %.2f", *(void *)&a4, *(void *)&a5 file lineNumber description];
  }
  id v14 = [MEMORY[0x263F15890] animation];
  [v14 setMass:1.0];
  [v14 setStiffness:a4];
  [v14 setDamping:a5];
  [v14 settlingDuration];
  if (a1) {
    *a1 = a5 / (v10 + v10);
  }
  if (a2) {
    *a2 = 6.28318531 / v10;
  }
  if (a3) {
    *a3 = v11;
  }
}

NSObject *_WGIsQueueSuspended(NSObject *result)
{
  if (result) {
    return (dispatch_queue_get_specific(result, "_WGQueueIsSuspended") != 0);
  }
  return result;
}

uint64_t _WGSuspendQueue(void *a1)
{
  int v1 = a1;
  if (v1)
  {
    object = v1;
    if (!dispatch_queue_get_specific(v1, "_WGQueueIsSuspended"))
    {
      dispatch_suspend(object);
      dispatch_queue_set_specific(object, "_WGQueueIsSuspended", (void *)1, 0);
    }
  }
  return MEMORY[0x270F9A790]();
}

uint64_t _WGResumeQueue(void *a1)
{
  int v1 = a1;
  if (v1)
  {
    object = v1;
    if (dispatch_queue_get_specific(v1, "_WGQueueIsSuspended"))
    {
      dispatch_resume(object);
      dispatch_queue_set_specific(object, "_WGQueueIsSuspended", 0, 0);
    }
  }
  return MEMORY[0x270F9A790]();
}

uint64_t _WGDataSourceIsEqualToDataSource(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  double v5 = v4;
  uint64_t v6 = 0;
  if (v3 && v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v7 = [v3 dataSourceIdentifier];
      v8 = [v5 dataSourceIdentifier];
      uint64_t v6 = [v7 isEqual:v8];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

void sub_222E505B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222E50838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void WGWidgetPersistentStateResetHasContent(void *a1)
{
  WGPersistedStateURLForWidgetWithBundleIdentifier(a1, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  int v1 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithContentsOfURL:");
  id v2 = [v1 objectForKey:@"SBWidgetViewControllerHasContentKey"];

  if (v2)
  {
    [v1 removeObjectForKey:@"SBWidgetViewControllerHasContentKey"];
    [v1 writeToURL:v3 atomically:1];
  }
}

void sub_222E544F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222E552A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222E56124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_222E584E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_222E58B44(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
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

void sub_222E59284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222E59350(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222E5A838(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_222E5ABA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

__CFString *WGStringFromWidgetLifeCycleSequenceState(unint64_t a1)
{
  if (a1 > 6) {
    return @"[Invalid]";
  }
  else {
    return off_264676AF8[a1];
  }
}

id WGApplicationIdentifierForWidgetWithBundleIdentifier(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F018C0];
  id v2 = a1;
  id v3 = [v1 pluginKitProxyForIdentifier:v2];
  int v4 = [v2 hasPrefix:@"com.apple."];

  if (v4)
  {
    double v5 = [v3 objectForInfoDictionaryKey:@"NCWidgetAssociatedApplicationIdentifier" ofClass:objc_opt_class()];
  }
  else
  {
    double v5 = 0;
  }
  if ([v5 length])
  {
    id v6 = v5;
  }
  else
  {
    double v7 = [v3 containingBundle];
    id v6 = [v7 bundleIdentifier];
  }
  return v6;
}

uint64_t WGIsBundleWithIdentifierFirstParty(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"com.apple."];
}

id WGContainingBundleCachePathForWidgetWithContainingBundleIdentifier(uint64_t a1, void *a2, int a3)
{
  double v5 = (void *)MEMORY[0x263F01868];
  id v6 = a2;
  double v7 = [v5 applicationProxyForIdentifier:a1];
  v8 = [v7 dataContainerURL];
  uint64_t v9 = [v8 path];
  uint64_t v10 = WGCachesPathForSandboxPath(v9);

  uint64_t v11 = [v10 stringByAppendingPathComponent:@"com.apple.notificationcenter"];
  v12 = [v11 stringByAppendingPathComponent:v6];

  if (a3) {
    WGEnsureDirectoryExistsAtPath(v12);
  }

  return v12;
}

id WGWidgetCachePathForWidgetWithBundleIdentifier(uint64_t a1, void *a2, int a3)
{
  double v5 = (void *)MEMORY[0x263F018C0];
  id v6 = a2;
  double v7 = [v5 pluginKitProxyForIdentifier:a1];
  v8 = [v7 dataContainerURL];
  uint64_t v9 = [v8 path];
  uint64_t v10 = WGCachesPathForSandboxPath(v9);

  uint64_t v11 = [v10 stringByAppendingPathComponent:@"com.apple.notificationcenter"];
  v12 = [v11 stringByAppendingPathComponent:v6];

  if (a3) {
    WGEnsureDirectoryExistsAtPath(v12);
  }

  return v12;
}

BOOL _WGIsSystemVersionSameOrAfterSystemVersion(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = [v3 length]
    && [v4 length]
    && (unint64_t)[v3 compare:v4 options:64] < 2;

  return v5;
}

BOOL WGIsWidgetWithBundleIdentifierBuiltOnOrAfterSystemVersion(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = (void *)MEMORY[0x263F01868];
  id v6 = WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v3);
  double v7 = [v5 applicationProxyForIdentifier:v6];

  v8 = [v7 sdkVersion];
  if (![v8 length] && objc_msgSend(v3, "hasPrefix:", @"com.apple."))
  {
    uint64_t v9 = +[WGWidgetInfo _productVersion];

    v8 = (void *)v9;
  }
  BOOL v10 = _WGIsSystemVersionSameOrAfterSystemVersion(v8, v4);

  return v10;
}

uint64_t WGIsBundleWithIdentifierInternal(void *a1)
{
  id v1 = a1;
  if (WGIsBundleWithIdentifierInternal_onceToken != -1) {
    dispatch_once(&WGIsBundleWithIdentifierInternal_onceToken, &__block_literal_global_2);
  }
  if (WGIsBundleWithIdentifierInternal___isInternalInstall && [v1 length])
  {
    id v2 = [MEMORY[0x263F01888] bundleProxyForIdentifier:v1];
    id v3 = [v2 bundleURL];
    id v4 = [v3 path];
    BOOL v5 = [v4 pathComponents];
    uint64_t v6 = [v5 containsObject:@"AppleInternal"];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __WGIsBundleWithIdentifierInternal_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  WGIsBundleWithIdentifierInternal___isInternalInstall = result;
  return result;
}

uint64_t WGIsWidgetWithBundleIdentifierInternal(uint64_t a1)
{
  id v1 = WGContainingBundleProxyForWidgetWithBundleIdentifer(a1);
  id v2 = [v1 bundleIdentifier];
  uint64_t v3 = WGIsBundleWithIdentifierInternal(v2);

  return v3;
}

uint64_t WGIsWidgetWithBundleIdentifierWantsTop(void *a1)
{
  id v1 = a1;
  if ([v1 hasPrefix:@"com.apple."]) {
    uint64_t v2 = _WGBoolValueForInfoDictionaryKey((uint64_t)v1, @"NCWidgetWantsTop");
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t _WGBoolValueForInfoDictionaryKey(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F01888];
  id v4 = a2;
  BOOL v5 = [v3 bundleProxyForIdentifier:a1];
  uint64_t v6 = [v5 objectForInfoDictionaryKey:v4 ofClass:objc_opt_class()];

  uint64_t v7 = [v6 BOOLValue];
  return v7;
}

id WGPlugInBundleIdentifiersForContainingBundleIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v1];
  if (v2)
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    BOOL v10 = __Block_byref_object_copy__1;
    uint64_t v11 = __Block_byref_object_dispose__1;
    id v12 = [MEMORY[0x263EFF980] array];
    uint64_t v3 = [v2 plugInKitPlugins];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __WGPlugInBundleIdentifiersForContainingBundleIdentifier_block_invoke;
    v6[3] = &unk_264676B60;
    v6[4] = &v7;
    [v3 enumerateObjectsUsingBlock:v6];

    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_222E5E354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __WGPlugInBundleIdentifiersForContainingBundleIdentifier_block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 bundleIdentifier];
  if ([v3 length]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

void sub_222E5F498(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_222E5F744(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_222E61350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222E633F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222E63A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id smoothDecelerationAnimation(double a1)
{
  uint64_t v2 = objc_opt_new();
  double v5 = 0.0;
  double v6 = 0.0;
  double v4 = 0.0;
  WGConvertDampingRatioResponseToMassStiffnessDamping(&v6, &v5, &v4, 1.0, 0.8);
  [v2 setMass:v6];
  [v2 setStiffness:v5];
  [v2 setDamping:v4];
  [v2 durationForEpsilon:1.17549435e-38];
  objc_msgSend(v2, "setDuration:");
  [v2 setInitialVelocity:a1];
  return v2;
}

void sub_222E666EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_222E66D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v5, OS_LOG_TYPE_DEBUG, a4, v4, 0xCu);
}

void sub_222E6A7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_222E6B894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222E6C964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222E6CD48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222E6D9F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
}

void sub_222E6E7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void WGTodayViewArchiveSave(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  id v7 = a3;
  v8 = v7;
  if (v6)
  {
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v5];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __WGTodayViewArchiveSave_block_invoke;
    v11[3] = &unk_2646770E8;
    id v12 = v9;
    id v13 = v8;
    id v10 = v9;
    dispatch_async(v6, v11);
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __WGTodayViewArchiveSave_block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [@"~/Library/SpringBoard/TodayViewArchive.plist" stringByExpandingTildeInPath];
  id v3 = [*(id *)(a1 + 32) objectForKey:@"Known"];
  double v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 allObjects];
    [v5 setObject:v6 forKey:@"Known"];
  }
  id v7 = [*(id *)(a1 + 32) objectForKey:@"Penalized"];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = [v7 allObjects];
    [v9 setObject:v10 forKey:@"Penalized"];
  }
  uint64_t v11 = [*(id *)(a1 + 32) objectForKey:@"FavoriteGroup"];
  if (v11) {
    [*(id *)(a1 + 32) setObject:v11 forKey:@"FavoriteGroup"];
  }
  uint64_t v12 = [*(id *)(a1 + 32) writeToFile:v2 atomically:1];
  if (v12)
  {
    id v13 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v16 = *MEMORY[0x263F080A8];
    v17[0] = *MEMORY[0x263F080B0];
    id v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    [v13 setAttributes:v14 ofItemAtPath:v2 error:0];
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v15, v12);
  }
}

void WGTodayViewArchiveMigrateArchiveFromLegacy()
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFF9A0];
  id v1 = [@"~/Library/SpringBoard/TodayViewArchive.plist" stringByExpandingTildeInPath];
  id v2 = [v0 dictionaryWithContentsOfFile:v1];

  if (!v2)
  {
    id v3 = BBSavedChronologicalSectionOrder();
    double v4 = BBSavedSectionInfo();
    if ([v3 count] && objc_msgSend(v4, "count"))
    {
      id v5 = [@"~/Library/SpringBoard/KnownWidgets.plist" stringByExpandingTildeInPath];
      uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithContentsOfFile:v5];
      id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v7 = [MEMORY[0x263EFF980] array];
      v8 = [MEMORY[0x263F1C5C0] currentDevice];
      [v8 userInterfaceIdiom];

      WGTodayViewArchiveSetOrderedIdentifiersInGroup(v2, v3, @"TodayGroup", 0);
      uint64_t v9 = WGTodayViewArchiveGetOrderedIdentifiersInGroup(v2, @"TodayGroup");
      id v10 = WGTodayViewArchiveGetOrderedIdentifiersInGroup(v2, @"WidgetGroup");
      uint64_t v11 = [v9 arrayByAddingObjectsFromArray:v10];
      uint64_t v12 = [v6 arrayByAddingObjectsFromArray:v11];

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v23;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v13);
            }
            WGTodayViewArchiveSetKnownForIdentifier(v2, *(void **)(*((void *)&v22 + 1) + 8 * v17++), 0);
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v15);
      }

      if ([v7 count]) {
        [v2 setObject:v7 forKey:@"DefaultEnabled"];
      }
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __WGTodayViewArchiveMigrateArchiveFromLegacy_block_invoke;
      v19[3] = &unk_264677110;
      id v20 = v4;
      id v21 = v5;
      id v18 = v5;
      WGTodayViewArchiveSave(v2, MEMORY[0x263EF83A0], v19);
    }
    else
    {
      id v2 = 0;
    }
  }
}

void WGTodayViewArchiveSetOrderedIdentifiersInGroup(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v7 && v8 && _WGTodayViewArchiveIsValidGroupKey(v9))
  {
    [v7 setObject:v8 forKey:v9];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          WGTodayViewArchiveSetKnownForIdentifier(v7, *(void **)(*((void *)&v16 + 1) + 8 * v15++), 0);
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }

    if (v10) {
      WGTodayViewArchiveSave(v7, v10, 0);
    }
  }
}

id WGTodayViewArchiveGetOrderedIdentifiersInGroup(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (!v3
    || !_WGTodayViewArchiveIsValidGroupKey(v4)
    || ([v3 objectForKey:v5], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v6 = [MEMORY[0x263EFF8C0] array];
  }

  return v6;
}

void WGTodayViewArchiveSetKnownForIdentifier(void *a1, void *a2, void *a3)
{
  id v8 = a1;
  id v5 = a2;
  id v6 = a3;
  if (v8 && [v5 length])
  {
    id v7 = [v8 objectForKey:@"Known"];
    if (!v7)
    {
      id v7 = [MEMORY[0x263EFF9C0] set];
      [v8 setObject:v7 forKey:@"Known"];
    }
    [v7 addObject:v5];
    if (v6) {
      WGTodayViewArchiveSave(v8, v6, 0);
    }
  }
}

void __WGTodayViewArchiveMigrateArchiveFromLegacy_block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    BBRemoveSavedChronologicalSectionInfo();
    id v3 = [MEMORY[0x263F08850] defaultManager];
    [v3 removeItemAtPath:*(void *)(a1 + 40) error:0];
  }
}

id WGTodayViewArchiveGetArchive(void *a1, void *a2)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v65 = a1;
  id v64 = a2;
  id v3 = NSDictionary;
  id v4 = [@"~/Library/SpringBoard/TodayViewArchive.plist" stringByExpandingTildeInPath];
  v67 = [v3 dictionaryWithContentsOfFile:v4];

  if (v67)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v63 = [v67 objectForKey:@"Known"];
    if (v63)
    {
      id v6 = [MEMORY[0x263EFF9C0] setWithArray:v63];
      [v5 setObject:v6 forKey:@"Known"];
    }
    v62 = [v67 objectForKey:@"Penalized"];
    if (v62)
    {
      id v7 = [MEMORY[0x263EFF9C0] setWithArray:v62];
      [v5 setObject:v7 forKey:@"Penalized"];
    }
    id v8 = [v67 objectForKey:@"DisplayMode"];
    v59 = v8;
    if (v8)
    {
      id v9 = (void *)[v8 mutableCopy];
      [v5 setObject:v9 forKey:@"DisplayMode"];
    }
    v58 = [v67 objectForKey:@"TodayGroup"];
    if (v58) {
      [v5 setObject:v58 forKey:@"TodayGroup"];
    }
    v57 = [v67 objectForKey:@"WidgetGroup"];
    if (v57) {
      [v5 setObject:v57 forKey:@"WidgetGroup"];
    }
    v56 = [v67 objectForKey:@"DefaultEnabled"];
    if (v56) {
      objc_msgSend(v65, "addObjectsFromArray:");
    }
    v55 = [v67 objectForKey:@"FavoriteGroup"];
    if (v55) {
      [v5 setObject:v55 forKey:@"FavoriteGroup"];
    }
    id v10 = [MEMORY[0x263F1C5C0] currentDevice];
    [v10 userInterfaceIdiom];
    id v11 = v5;
    id v12 = v65;
    id v13 = v64;
    uint64_t v14 = v13;
    if (v11)
    {
      uint64_t v15 = [v11 objectForKey:@"WidgetGroup"];

      if (v15)
      {
        long long v16 = [v11 objectForKey:@"TodayGroup"];
        long long v17 = v16;
        if (v16) {
          id v18 = (id)[v16 mutableCopy];
        }
        else {
          id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
        }
        long long v23 = v18;
        long long v24 = [v11 objectForKey:@"WidgetGroup"];
        if ([v24 count]) {
          [v23 addObjectsFromArray:v24];
        }
        WGTodayViewArchiveSetOrderedIdentifiersInGroup(v11, v23, @"TodayGroup", 0);
        [v11 removeObjectForKey:@"WidgetGroup"];

        WGTodayViewArchiveSave(v11, v14, 0);
      }

      id v25 = v11;
      id v26 = v12;
      id v27 = v14;
      uint64_t v76 = 0;
      v77 = &v76;
      uint64_t v78 = 0x2020000000;
      char v79 = 0;
      v28 = WGTodayViewArchiveGetOrderedIdentifiersInGroup(v25, @"TodayGroup");
      v29 = (void *)[v28 mutableCopy];
      v80[0] = MEMORY[0x263EF8330];
      v80[1] = 3221225472;
      v80[2] = ___WGTodayViewArchiveMigrateWidgetIdentifiers_block_invoke;
      v80[3] = &unk_264677138;
      id v81 = &unk_26D5D4F90;
      v84 = &v76;
      id v30 = v29;
      id v82 = v30;
      id v83 = v26;
      [v28 enumerateObjectsUsingBlock:v80];
      if (*((unsigned char *)v77 + 24)) {
        WGTodayViewArchiveSetOrderedIdentifiersInGroup(v25, v30, @"TodayGroup", v27);
      }

      _Block_object_dispose(&v76, 8);
    }
    else
    {

      id v21 = v12;
      id v22 = v14;
    }

    id v66 = v11;
    id v61 = v12;
    id v31 = v14;
    if (v11)
    {
      id v53 = v31;
      v54 = (void *)[v61 copy];
      v32 = [MEMORY[0x263F1C5C0] currentDevice];
      v60 = _WGTodayViewArchiveGetDefaultArchiveForIdiom([v32 userInterfaceIdiom]);

      v33 = _WGTodayViewArchiveGetEnabledIdentifiers(v60);
      v34 = (void *)[v33 mutableCopy];

      v35 = [v66 objectForKey:@"Known"];
      v36 = [v35 allObjects];

      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v37 = v36;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v68 objects:&v76 count:16];
      if (v38)
      {
        uint64_t v39 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v69 != v39) {
              objc_enumerationMutation(v37);
            }
            [v34 removeObject:*(void *)(*((void *)&v68 + 1) + 8 * i)];
          }
          uint64_t v38 = [v37 countByEnumeratingWithState:&v68 objects:&v76 count:16];
        }
        while (v38);
      }

      if ([v34 count])
      {
        [v61 unionSet:v34];
        int v52 = [v54 isEqualToSet:v61];
        BOOL v51 = _WGTodayViewArchiveMigrateOrderForNewDefaultWidgetsInGroup(v60, v66, v34, @"TodayGroup");
        BOOL v50 = _WGTodayViewArchiveMigrateOrderForNewDefaultWidgetsInGroup(v60, v66, v34, @"WidgetGroup");
        id v41 = v60;
        id v42 = v66;
        id v43 = v34;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        int v44 = 0;
        uint64_t v45 = [v43 countByEnumeratingWithState:&v72 objects:v80 count:16];
        if (v45)
        {
          uint64_t v46 = *(void *)v73;
          do
          {
            for (uint64_t j = 0; j != v45; ++j)
            {
              if (*(void *)v73 != v46) {
                objc_enumerationMutation(v43);
              }
              v48 = *(void **)(*((void *)&v72 + 1) + 8 * j);
              if (WGTodayViewArchiveGetDisplayModeForIdentifier(v41, v48) == 1)
              {
                WGTodayViewArchiveSetDisplayModeForIdentifier(v42, v48, 1, 0);
                int v44 = 1;
              }
            }
            uint64_t v45 = [v43 countByEnumeratingWithState:&v72 objects:v80 count:16];
          }
          while (v45);
        }

        if ((v44 | v50 | v51 | v52 ^ 1)) {
          WGTodayViewArchiveSave(v42, v53, 0);
        }
      }

      id v31 = v53;
    }
  }
  else
  {
    long long v19 = [MEMORY[0x263F1C5C0] currentDevice];
    _WGTodayViewArchiveGetDefaultArchiveForIdiom([v19 userInterfaceIdiom]);
    id v66 = (id)objc_claimAutoreleasedReturnValue();

    id v20 = _WGTodayViewArchiveGetEnabledIdentifiers(v66);
    if (v20) {
      [v65 unionSet:v20];
    }
    WGTodayViewArchiveSave(v66, v64, 0);
  }
  return v66;
}

void sub_222E7090C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

id _WGTodayViewArchiveGetDefaultArchiveForIdiom(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF9A0] dictionary];
  id v3 = @"DefaultTodayViewArchive~ipad";
  if (a1 != 1) {
    id v3 = 0;
  }
  if (!a1) {
    id v3 = @"DefaultTodayViewArchive~iphone";
  }
  id v4 = v3;
  if ([(__CFString *)v4 length])
  {
    id v5 = WGWidgetsFrameworkBundle();
    id v6 = [v5 pathForResource:v4 ofType:@"plist"];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:v6];

      id v2 = (void *)v7;
    }
  }
  return v2;
}

id _WGTodayViewArchiveGetEnabledIdentifiers(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v3 = [v1 objectForKey:@"TodayGroup"];
  if (v3) {
    [v2 addObjectsFromArray:v3];
  }
  id v4 = [v1 objectForKey:@"WidgetGroup"];
  if (v4) {
    [v2 addObjectsFromArray:v4];
  }

  return v2;
}

uint64_t _WGTodayViewArchiveIsValidGroupKey(void *a1)
{
  id v1 = a1;
  if (([v1 isEqual:@"TodayGroup"] & 1) != 0
    || ([v1 isEqual:@"WidgetGroup"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqual:@"FavoriteGroup"];
  }

  return v2;
}

void _WGTodayViewArchiveRemoveFromOrderedIdentifiersInGroup(void *a1, void *a2, void *a3, void *a4)
{
  id v12 = a1;
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v12 && [v7 length])
  {
    id v10 = [v12 objectForKey:v8];
    if ([v10 containsObject:v7])
    {
      id v11 = (void *)[v10 mutableCopy];
      [v11 removeObject:v7];
      WGTodayViewArchiveSetOrderedIdentifiersInGroup(v12, v11, v8, v9);
    }
  }
}

void WGTodayViewArchiveRemoveFromOrderedIdentifiers(void *a1, void *a2, void *a3)
{
  id v7 = a1;
  id v5 = a2;
  id v6 = a3;
  if (v7 && [v5 length])
  {
    _WGTodayViewArchiveRemoveFromOrderedIdentifiersInGroup(v7, v5, @"TodayGroup", v6);
    _WGTodayViewArchiveRemoveFromOrderedIdentifiersInGroup(v7, v5, @"WidgetGroup", v6);
  }
}

uint64_t WGTodayViewArchiveGetKnownForIdentifier(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 objectForKey:@"Known"];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

void WGTodayViewArchiveSetPenalizedForIdentifier(void *a1, void *a2, void *a3)
{
  id v8 = a1;
  id v5 = a2;
  id v6 = a3;
  if (v8 && [v5 length])
  {
    id v7 = [v8 objectForKey:@"Penalized"];
    if (!v7)
    {
      id v7 = [MEMORY[0x263EFF9C0] set];
      [v8 setObject:v7 forKey:@"Penalized"];
    }
    [v7 addObject:v5];
    if (v6) {
      WGTodayViewArchiveSave(v8, v6, 0);
    }
  }
}

uint64_t WGTodayViewArchiveGetPenalizedForIdentifier(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 objectForKey:@"Penalized"];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

void WGTodayViewArchiveSetDisplayModeForIdentifier(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v11 = a1;
  id v7 = a2;
  id v8 = a4;
  if (v11 && [v7 length])
  {
    id v9 = [v11 objectForKey:@"DisplayMode"];
    if (!v9)
    {
      id v9 = [MEMORY[0x263EFF9A0] dictionary];
      [v11 setObject:v9 forKey:@"DisplayMode"];
    }
    id v10 = [NSNumber numberWithInteger:a3];
    [v9 setObject:v10 forKey:v7];

    if (v8) {
      WGTodayViewArchiveSave(v11, v8, 0);
    }
  }
}

uint64_t WGTodayViewArchiveGetDisplayModeForIdentifier(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 objectForKey:@"DisplayMode"];
  uint64_t v5 = [v4 objectForKey:v3];

  uint64_t v6 = [v5 integerValue];
  return v6;
}

BOOL _WGTodayViewArchiveMigrateOrderForNewDefaultWidgetsInGroup(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = [MEMORY[0x263EFF980] array];
  id v12 = WGTodayViewArchiveGetOrderedIdentifiersInGroup(v7, v10);
  if ([v12 count])
  {
    id v23 = v7;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if ([v9 containsObject:v18]) {
            [v11 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v15);
    }

    long long v19 = [MEMORY[0x263EFF980] array];
    id v20 = WGTodayViewArchiveGetOrderedIdentifiersInGroup(v8, v10);
    if ([v20 count]) {
      [v19 addObjectsFromArray:v20];
    }
    id v7 = v23;
    if ([v11 count]) {
      [v19 addObjectsFromArray:v11];
    }
    WGTodayViewArchiveSetOrderedIdentifiersInGroup(v8, v19, v10, 0);
  }
  BOOL v21 = [v11 count] != 0;

  return v21;
}

void sub_222E736FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void WGRegisterWidgetsLogging()
{
  if (WGRegisterWidgetsLogging_onceToken != -1) {
    dispatch_once(&WGRegisterWidgetsLogging_onceToken, &__block_literal_global_6);
  }
}

uint64_t __WGRegisterWidgetsLogging_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)WGLogSubsystem, "Widgets");
  uint64_t v1 = WGLogWidgets;
  WGLogWidgets = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t WGWidgetListSettingsFullCarousel()
{
  return 5;
}

uint64_t WGWidgetListSettingsTopCarousel()
{
  return 1;
}

BOOL WGWidgetListSettingsEqualsToWidgetListSettings(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v4 = (((unsigned __int16)a4 ^ (unsigned __int16)a2) & 0x101) == 0 && ((a4 ^ a2) & 0x10000) == 0;
  return a1 == a3 && v4;
}

void sub_222E7473C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  uint64_t v18 = v16;
  objc_destroyWeak(v18);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

id WGPersistedStateURLForWidgetWithBundleIdentifier(void *a1, int a2)
{
  id v3 = a1;
  if ([v3 length])
  {
    BOOL v4 = WGWidgetCachePathForWidgetWithBundleIdentifier((uint64_t)v3, @"State", a2);
    uint64_t v5 = [NSString stringWithFormat:@"%@-state", v3];
    uint64_t v6 = [v4 stringByAppendingPathComponent:v5];
    id v7 = [v6 stringByAppendingPathExtension:@"plist"];

    if ([v7 length])
    {
      id v8 = [NSURL fileURLWithPath:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void sub_222E74D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *WGShortStringFromLayoutMode(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4) {
    return @"[Unknown]";
  }
  else {
    return off_2646772B0[a1 + 1];
  }
}

__CFString *WGStringFromLayoutMode(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4)
  {
    id v3 = @"[Unknown]";
  }
  else
  {
    objc_msgSend(@"WGModalLayoutMode", "stringByAppendingString:", off_2646772B0[a1 + 1], v1);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

void sub_222E75E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_222E7603C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_222E76A3C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_222E77480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WGRoundToMainScreenScale()
{
  _WGMainScreenScale();
  return BSFloatRoundForScale();
}

uint64_t WGRectRoundForMainScreenScale(double a1, double a2, double a3, double a4)
{
  v8.n128_u64[0] = _WGMainScreenScale();
  v9.n128_f64[0] = a1;
  v10.n128_f64[0] = a2;
  v11.n128_f64[0] = a3;
  v12.n128_f64[0] = a4;
  return MEMORY[0x270F108D0](v9, v10, v11, v12, v8);
}

double WGMainScreenReferenceBounds()
{
  if (WGMainScreenReferenceBounds_onceToken != -1) {
    dispatch_once(&WGMainScreenReferenceBounds_onceToken, &__block_literal_global_9);
  }
  return *(double *)&WGMainScreenReferenceBounds___mainScreenReferenceBounds_0;
}

void __WGMainScreenReferenceBounds_block_invoke()
{
  os_log_t v0 = [MEMORY[0x263F1C920] mainScreen];
  [v0 _referenceBounds];
  WGMainScreenReferenceBounds___mainScreenReferenceBounds_0 = v1;
  WGMainScreenReferenceBounds___mainScreenReferenceBounds_1 = v2;
  WGMainScreenReferenceBounds___mainScreenReferenceBounds_2 = v3;
  WGMainScreenReferenceBounds___mainScreenReferenceBounds_3 = v4;

  *(void *)&v8.origin.x = WGMainScreenReferenceBounds___mainScreenReferenceBounds_0;
  *(void *)&v8.origin.y = WGMainScreenReferenceBounds___mainScreenReferenceBounds_1;
  *(void *)&v8.size.width = WGMainScreenReferenceBounds___mainScreenReferenceBounds_2;
  *(void *)&v8.size.height = WGMainScreenReferenceBounds___mainScreenReferenceBounds_3;
  if (CGRectIsEmpty(v8))
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"CGRect WGMainScreenReferenceBounds(void)_block_invoke"];
    [v6 handleFailureInFunction:v5 file:@"WGGeometry.m" lineNumber:28 description:@"Failed to initialize main screen reference bounds!"];
  }
}

void sub_222E7988C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t _HandleKeybagLockStatusChanged(uint64_t a1, void *a2)
{
  return [a2 _lockedStateDidChange];
}

void sub_222E7C9D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void InvalidateQueue(void *a1)
{
  if (a1)
  {
    dispatch_queue_t queue = a1;
    SuspendQueueIfNecessary(queue);
    dispatch_queue_set_specific(queue, "_WGWidgetViewControllerQueueIsValidTag", 0, 0);
    ResumeQueueIfNecessary(queue);
  }
}

void sub_222E7E554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
}

void sub_222E7ECF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
}

uint64_t QueueName(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (![v3 length])
  {
    __n128 v10 = [MEMORY[0x263F08690] currentHandler];
    __n128 v11 = objc_msgSend(NSString, "stringWithUTF8String:", "const char *QueueName(NSString *__strong, NSString *__strong)");
    [v10 handleFailureInFunction:v11, @"WGWidgetHostingViewController.m", 622, @"Invalid parameter not satisfying: %@", @"[queueName length] > 0" file lineNumber description];
  }
  id v5 = v3;
  id v6 = v5;
  if ([v4 length])
  {
    id v6 = [v5 stringByAppendingFormat:@".%@", v4];
  }
  id v7 = v6;
  uint64_t v8 = [v7 UTF8String];

  return v8;
}

NSObject *NewSerialQueue(char *label)
{
  if (!label)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    id v5 = [NSString stringWithUTF8String:"dispatch_queue_t NewSerialQueue(const char *)"];
    [v4 handleFailureInFunction:v5, @"WGWidgetHostingViewController.m", 631, @"Invalid parameter not satisfying: %@", @"name" file lineNumber description];
  }
  uint64_t v2 = dispatch_queue_create(label, 0);
  dispatch_queue_set_specific(v2, "_WGWidgetViewControllerQueueIsValidTag", (void *)1, 0);
  return v2;
}

void sub_222E80190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a11);
  _Unwind_Resume(a1);
}

void sub_222E807EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_222E80F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void ValidateQueue(void *a1)
{
  if (a1)
  {
    dispatch_queue_t queue = a1;
    SuspendQueueIfNecessary(queue);
    dispatch_queue_set_specific(queue, "_WGWidgetViewControllerQueueIsValidTag", (void *)1, 0);
    ResumeQueueIfNecessary(queue);
  }
}

void sub_222E81DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose((const void *)(v47 - 240), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x223CAA850](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

uint64_t SuspendQueueIfNecessary(void *a1)
{
  uint64_t v1 = a1;
  if (v1)
  {
    dispatch_queue_t queue = v1;
    if (!dispatch_queue_get_specific(v1, "_WGWidgetViewControllerQueueIsSuspendedTag"))
    {
      dispatch_queue_set_specific(queue, "_WGWidgetViewControllerQueueIsSuspendedTag", (void *)1, 0);
      dispatch_suspend(queue);
    }
  }
  return MEMORY[0x270F9A790]();
}

uint64_t ResumeQueueIfNecessary(void *a1)
{
  uint64_t v1 = a1;
  if (v1)
  {
    dispatch_queue_t queue = v1;
    if (dispatch_queue_get_specific(v1, "_WGWidgetViewControllerQueueIsSuspendedTag"))
    {
      dispatch_queue_set_specific(queue, "_WGWidgetViewControllerQueueIsSuspendedTag", 0, 0);
      dispatch_resume(queue);
    }
  }
  return MEMORY[0x270F9A790]();
}

void sub_222E84480(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_222E84C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
}

void sub_222E85EAC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_222E8618C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_222E86EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

void sub_222E87EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222E88C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
}

void sub_222E893B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222E89E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
}

void sub_222E8A5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

void sub_222E8AAFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_222E8B878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id location)
{
}

void sub_222E8C174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
}

void sub_222E8F0B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_222E8F29C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __DispatchBlockForRequest_block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  specific = dispatch_queue_get_specific(*(dispatch_queue_t *)(a1 + 32), "_WGWidgetViewControllerQueueIsValidTag");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!specific)
  {
    id v4 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      id v6 = [WeakRetained widgetIdentifier];
      id v7 = [WeakRetained _containerIdentifier];
      uint64_t v8 = (void *)MEMORY[0x223CAA850](*(void *)(a1 + 56));
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138544642;
      id v13 = v6;
      __int16 v14 = 2050;
      id v15 = WeakRetained;
      __int16 v16 = 2114;
      uint64_t v17 = v7;
      __int16 v18 = 2114;
      long long v19 = v8;
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      __int16 v22 = 2114;
      uint64_t v23 = v10;
      _os_log_impl(&dword_222E49000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Queue is no longer valid (request:%{public}@, queue:%{public}@, "
        "description:%{public}@)",
        (uint8_t *)&v12,
        0x3Eu);
    }
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, id, void, BOOL))(v11 + 16))(v11, WeakRetained, *(void *)(a1 + 48), specific != 0);
  }
}

void __DispatchBlockForRequest_block_invoke_783(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_7(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x270F0B6B0]();
}

uint64_t ADClientPushValueForDistributionKey()
{
  return MEMORY[0x270F0B6C8]();
}

uint64_t BBRemoveSavedChronologicalSectionInfo()
{
  return MEMORY[0x270F12900]();
}

uint64_t BBSavedChronologicalSectionOrder()
{
  return MEMORY[0x270F12908]();
}

uint64_t BBSavedSectionInfo()
{
  return MEMORY[0x270F12910]();
}

uint64_t BSBundleIDForPID()
{
  return MEMORY[0x270F106D8]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x270F10758]();
}

uint64_t BSDispatchQueueAssertNotMain()
{
  return MEMORY[0x270F10768]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x270F10778]();
}

uint64_t BSFloatCeilForScale()
{
  return MEMORY[0x270F107E0]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x270F107E8]();
}

uint64_t BSFloatFloorForScale()
{
  return MEMORY[0x270F107F0]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x270F10808]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x270F10810]();
}

uint64_t BSFloatLessThanFloat()
{
  return MEMORY[0x270F10818]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x270F10828]();
}

uint64_t BSIntervalMap()
{
  return MEMORY[0x270F10850]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x270F108D8]();
}

uint64_t BSRunLoopPerformAfterCACommit()
{
  return MEMORY[0x270F108E0]();
}

uint64_t BSUIConstrainValueToIntervalWithRubberBand()
{
  return MEMORY[0x270F109B0]();
}

uint64_t BSXPCConnectionHasEntitlement()
{
  return MEMORY[0x270F10990]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x270EE5970](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextFillPath(CGContextRef c)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x270EE6858]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7050](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t MGCancelNotifications()
{
  return MEMORY[0x270F95F88]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x270F95FB0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x270F96018]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x270F96030]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBEventsRegister()
{
  return MEMORY[0x270F4AE28]();
}

uint64_t MKBEventsUnregister()
{
  return MEMORY[0x270F4AE30]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

uint64_t NCStringFromWidgetDisplayMode()
{
  return MEMORY[0x270EF96A8]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x270EF2BF8]();
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

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x270F05EB8](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

uint64_t StocksAttributionString()
{
  return MEMORY[0x270F77520]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x270F061F8]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x270F06210]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x270F06220]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x270F06248]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F06258]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x270F06268]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x270F06280]();
}

uint64_t WAAttributionString()
{
  return MEMORY[0x270F84A98]();
}

uint64_t _BSUI_Private_IsN84()
{
  return MEMORY[0x270F109C0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIContentSizeCategoryIsAccessibilityContentSizeCategory()
{
  return MEMORY[0x270F06338]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x270ED9480](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

void objc_removeAssociatedObjects(id object)
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

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}