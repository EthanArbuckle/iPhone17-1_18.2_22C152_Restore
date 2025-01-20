id wqa_services_log()
{
  void *v0;
  uint64_t vars8;

  if (wqa_services_log_onceToken != -1) {
    dispatch_once(&wqa_services_log_onceToken, &__block_literal_global);
  }
  v0 = (void *)wqa_services_log___logger;

  return v0;
}

uint64_t __wqa_services_log_block_invoke()
{
  wqa_services_log___logger = (uint64_t)os_log_create("com.apple.WatchQuickActions", "services");

  return MEMORY[0x270F9A758]();
}

id wqa_client_log()
{
  if (wqa_client_log_onceToken != -1) {
    dispatch_once(&wqa_client_log_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)wqa_client_log___logger;

  return v0;
}

uint64_t __wqa_client_log_block_invoke()
{
  wqa_client_log___logger = (uint64_t)os_log_create("com.apple.WatchQuickActions", "client");

  return MEMORY[0x270F9A758]();
}

id wqa_server_log()
{
  if (wqa_server_log_onceToken != -1) {
    dispatch_once(&wqa_server_log_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)wqa_server_log___logger;

  return v0;
}

uint64_t __wqa_server_log_block_invoke()
{
  wqa_server_log___logger = (uint64_t)os_log_create("com.apple.WatchQuickActions", "server");

  return MEMORY[0x270F9A758]();
}

id wqa_input_log()
{
  if (wqa_input_log_onceToken != -1) {
    dispatch_once(&wqa_input_log_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)wqa_input_log___logger;

  return v0;
}

uint64_t __wqa_input_log_block_invoke()
{
  wqa_input_log___logger = (uint64_t)os_log_create("com.apple.WatchQuickActions", "input");

  return MEMORY[0x270F9A758]();
}

id wqa_feedback_log()
{
  if (wqa_feedback_log_onceToken != -1) {
    dispatch_once(&wqa_feedback_log_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)wqa_feedback_log___logger;

  return v0;
}

uint64_t __wqa_feedback_log_block_invoke()
{
  wqa_feedback_log___logger = (uint64_t)os_log_create("com.apple.WatchQuickActions", "feedback");

  return MEMORY[0x270F9A758]();
}

id wqa_overlay_log()
{
  if (wqa_overlay_log_onceToken != -1) {
    dispatch_once(&wqa_overlay_log_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)wqa_overlay_log___logger;

  return v0;
}

uint64_t __wqa_overlay_log_block_invoke()
{
  wqa_overlay_log___logger = (uint64_t)os_log_create("com.apple.WatchQuickActions", "overlay");

  return MEMORY[0x270F9A758]();
}

void wqa_dump_call_stack(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if (_os_feature_enabled_impl())
  {
    v5 = wqa_services_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v3;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_239BF6000, v5, OS_LOG_TYPE_INFO, "[dump call stack] reason='%@', params=%@", buf, 0x16u);
    }
    id v13 = v3;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = [MEMORY[0x263F08B88] callStackSymbols];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v12 = wqa_services_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v20 = v11;
            _os_log_impl(&dword_239BF6000, v12, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    id v3 = v13;
  }
}

id getWatchControlSettingsClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getWatchControlSettingsClass_softClass;
  uint64_t v7 = getWatchControlSettingsClass_softClass;
  if (!getWatchControlSettingsClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getWatchControlSettingsClass_block_invoke;
    v3[3] = &unk_264DB8298;
    v3[4] = &v4;
    __getWatchControlSettingsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_239BF8804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t updateGestureSettings()
{
  return AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t WatchControlSettingsLibraryCore()
{
  if (!WatchControlSettingsLibraryCore_frameworkLibrary) {
    WatchControlSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return WatchControlSettingsLibraryCore_frameworkLibrary;
}

uint64_t __WatchControlSettingsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WatchControlSettingsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getWatchControlSettingsClass_block_invoke(uint64_t a1)
{
  WatchControlSettingsLibrary();
  Class result = objc_getClass("WatchControlSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getWatchControlSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getWatchControlSettingsClass_block_invoke_cold_1();
    return (Class)WatchControlSettingsLibrary();
  }
  return result;
}

uint64_t WatchControlSettingsLibrary()
{
  uint64_t v0 = WatchControlSettingsLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t __updateGestureSettings_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateGestureSettings];
}

void *__getkWatchControlReceivedActivationGestureDidChangeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)WatchControlSettingsLibrary();
  Class result = dlsym(v2, "kWatchControlReceivedActivationGestureDidChange");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkWatchControlReceivedActivationGestureDidChangeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

void *__getkWatchControlInputSourcesRequireFocusRingDidChangeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)WatchControlSettingsLibrary();
  Class result = dlsym(v2, "kWatchControlInputSourcesRequireFocusRingDidChange");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkWatchControlInputSourcesRequireFocusRingDidChangeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

void *__getWCGreyEventNoneSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)WatchControlSettingsLibrary();
  Class result = dlsym(v2, "WCGreyEventNone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWCGreyEventNoneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id WQADefaultTintColor()
{
  if (WQADefaultTintColor_onceToken != -1) {
    dispatch_once(&WQADefaultTintColor_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)WQADefaultTintColor_DefaultTintColor;

  return v0;
}

uint64_t __WQADefaultTintColor_block_invoke()
{
  WQADefaultTintColor_DefaultTintColor = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];

  return MEMORY[0x270F9A758]();
}

double WQADefaultShapeLineWidth()
{
  return 3.0;
}

double WQADefaultOpacity()
{
  int v0 = _AXSEnhanceBackgroundContrastEnabled();
  double result = 0.97;
  if (v0) {
    return 1.0;
  }
  return result;
}

double WQADefaultBannerBorderWidth()
{
  return 1.5;
}

void sub_239BFE758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_239BFEF14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_239BFF3D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a31, 8);
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

void sub_239BFF758(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_239BFFA8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_239C000C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WQAErrorForErrorCode(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  switch(a1)
  {
    case -1005:
      v2 = @"app not in foreground";
      break;
    case -1004:
      v2 = @"no quick action found for identifier";
      break;
    case -1003:
      v2 = @"no feedback available";
      break;
    case -1002:
      v2 = @"missing service handler";
      break;
    case -1001:
      v2 = @"unexpected payload";
      break;
    case -1000:
      v2 = @"no activation callback";
      break;
    default:
      v2 = @"unknown error";
      if (a1 == -100) {
        v2 = @"quick actions not enabled";
      }
      break;
  }
  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = v2;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v3 errorWithDomain:@"com.apple.WatchQuickActions.ErrorDomain" code:a1 userInfo:v4];

  return v5;
}

void sub_239C00864(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_239C00B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_239C011C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_239C013FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXUIClientClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AccessibilityUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __AccessibilityUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264DB8488;
    uint64_t v5 = 0;
    AccessibilityUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AccessibilityUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getAXUIClientClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AXUIClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getAXUIClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUILibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t __getWatchControlSettingsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[WatchQuickActionsServices localService](v0);
}

void __getAXUIClientClass_block_invoke_cold_1()
{
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x270F09138]();
}

uint64_t AXLogIDS()
{
  return MEMORY[0x270F09310]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x270F09428]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F09430]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09440]();
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

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
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

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F05E98]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t _AXSEnhanceBackgroundContrastEnabled()
{
  return MEMORY[0x270F90738]();
}

uint64_t _AXSFullKeyboardAccessFocusRingEnabled()
{
  return MEMORY[0x270F90760]();
}

uint64_t _AXSReduceMotionEnabled()
{
  return MEMORY[0x270F90998]();
}

uint64_t _AXSWatchControlEnabled()
{
  return MEMORY[0x270F90BE8]();
}

uint64_t _AXSWatchQuickActionBannerAppearance()
{
  return MEMORY[0x270F90BF8]();
}

uint64_t _AXSWatchQuickActionsEnabled()
{
  return MEMORY[0x270F90C00]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}