void sub_20C2662BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20C2667E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C266AA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *ICClassAndProtocolCast(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v9 = a1;
  if (a1)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    v13 = &a9;
    if (a3)
    {
      while (1)
      {
        v11 = v13++;
        if (([v9 conformsToProtocol:*v11] & 1) == 0) {
          break;
        }
        if (!--a3) {
          return v9;
        }
      }
      return 0;
    }
  }
  return v9;
}

void *ICProtocolCast(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  if ([a2 conformsToProtocol:a1]) {
    return a2;
  }
  return 0;
}

__CFString *ICInternalPreferencesChangedNotification()
{
  if (ICIsSandboxModeEnabled()) {
    v0 = @"com.apple.mobilenotesdebug.internalprefschanged";
  }
  else {
    v0 = @"com.apple.mobilenotes.internalprefschanged";
  }
  return v0;
}

void sub_20C267284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Block_object_dispose((const void *)(v29 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20C2675AC(_Unwind_Exception *a1)
{
  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20C267DBC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20C268554(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL ICInternalSettingsGetBundleBoolSettingValue(void *a1)
{
  uint64_t v1 = a1;
  v2 = ICNotesAppBundleIdentifier();
  CFPreferencesAppSynchronize(v2);
  v3 = ICNotesAppBundleIdentifier();
  CFStringRef v4 = (const __CFString *)NSUserName();
  CFBooleanRef v5 = (const __CFBoolean *)CFPreferencesCopyValue(v1, v3, v4, (CFStringRef)*MEMORY[0x263EFFE50]);
  if (v5)
  {
    CFBooleanRef v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFBooleanGetTypeID())
    {
      BOOL v8 = CFBooleanGetValue(v6) != 0;
    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:"__objc_no", "BOOL ICInternalSettingsGetBundleBoolSettingValue(NSString *__strong)", 1, 0, @"Unexpected type id for internal setting %@", v1 functionName simulateCrash showAlert format];
      BOOL v8 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

__CFString *ICGroupContainerIdentifier()
{
  if (ICIsSandboxModeEnabled()) {
    v0 = @"group.com.apple.notesdebug";
  }
  else {
    v0 = @"group.com.apple.notes";
  }
  return v0;
}

__CFString *ICNotesAppBundleIdentifier()
{
  if (ICIsSandboxModeEnabled()) {
    v0 = @"com.apple.mobilenotesdebug";
  }
  else {
    v0 = @"com.apple.mobilenotes";
  }
  return v0;
}

uint64_t ICCheckedDynamicCast(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    +[ICAssert handleFailedAssertWithCondition:"src == ((void *)0) || result != ((void *)0)", "id ICCheckedDynamicCast(Class, id<NSObject>)", 1, 0, @"Unexpected object type in checked dynamic cast %@ expects %@", objc_opt_class(), a1 functionName simulateCrash showAlert format];
    return 0;
  }
  return v2;
}

uint64_t ICIsSandboxModeEnabled()
{
  if ((_ICDidInquireSandboxModeEnabled & 1) == 0) {
    _ICDidInquireSandboxModeEnabled = 1;
  }
  return _ICIsSandboxModeEnabled;
}

void sub_20C269D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C26A244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ICDynamicCast(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (objc_opt_isKindOfClass()) {
    return a2;
  }
  return 0;
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_20C26A65C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  UserManagementLibrary();
  Class result = objc_getClass("UMUserManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUMUserManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getUMUserManagerClass_block_invoke_cold_1();
    return __getUMUserManagerClass_block_invoke_0(v3);
  }
  return result;
}

Class __getUMUserManagerClass_block_invoke_0(uint64_t a1)
{
  UserManagementLibrary_0();
  Class result = objc_getClass("UMUserManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUMUserManagerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getUMUserManagerClass_block_invoke_cold_1();
    return (Class)UserManagementLibrary(v3);
  }
  return result;
}

void UserManagementLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __UserManagementLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2640CD388;
    uint64_t v3 = 0;
    UserManagementLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

void UserManagementLibrary_0()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!UserManagementLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __UserManagementLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2640CDAD0;
    uint64_t v3 = 0;
    UserManagementLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!UserManagementLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

__CFString *ICTestHostBundleIdentifier()
{
  return @"com.apple.mobilenotes.TestHost";
}

uint64_t TSDPointHasNaNComponents()
{
  return 0;
}

uint64_t ICInternalSettingsIsAudioTranscriptionEnabled()
{
  if (ICInternalSettingsIsAudioTranscriptionEnabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsAudioTranscriptionEnabled_onceToken, &__block_literal_global_211);
  }
  return ICInternalSettingsIsAudioTranscriptionEnabled_isEnabled;
}

void __ICInternalSettingsIsCollapsibleSectionsEnabled_block_invoke()
{
  if (+[ICDeviceSupport isRunningUnitTests])
  {
    ICInternalSettingsIsCollapsibleSectionsEnabled_isEnabled = 1;
  }
  else
  {
    id v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
    if ([v1 BOOLForKey:@"EnableCollapsibleSections"]) {
      char v0 = 1;
    }
    else {
      char v0 = _os_feature_enabled_impl();
    }
    ICInternalSettingsIsCollapsibleSectionsEnabled_isEnabled = v0;
  }
}

void __ICInternalSettingsIsTextKit2Enabled_block_invoke()
{
  if (+[ICDeviceSupport isRunningUnitTests])
  {
    ICInternalSettingsIsTextKit2Enabled_isEnabled = 1;
  }
  else
  {
    id v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
    if ([v1 BOOLForKey:@"EnableTextKit2"]) {
      char v0 = 1;
    }
    else {
      char v0 = _os_feature_enabled_impl();
    }
    ICInternalSettingsIsTextKit2Enabled_isEnabled = v0;
  }
}

__CFString *ICSharedFrameworkBundleIdentifier()
{
  return @"com.apple.NotesShared";
}

uint64_t ICInternalSettingsDefaultToPaperKitAttachments()
{
  char v0 = +[ICAppGroupDefaults sharedAppGroupDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"DefaultToPaperKitAttachments"];

  return v1;
}

uint64_t TSUDeviceRGBColorSpace()
{
  if (TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
    dispatch_once(&TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_29);
  }
  return TSUDeviceRGBColorSpace_sDeviceRGBColorSpace;
}

uint64_t ICInternalSettingsIsViewProviderCacheDisabled()
{
  if (ICInternalSettingsIsViewProviderCacheDisabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsViewProviderCacheDisabled_onceToken, &__block_literal_global_234);
  }
  return ICInternalSettingsIsViewProviderCacheDisabled_isEnabled;
}

uint64_t ICInternalSettingsIsMathEnabled()
{
  if (ICInternalSettingsIsMathEnabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsMathEnabled_onceToken, &__block_literal_global_237);
  }
  return ICInternalSettingsIsMathEnabled_isEnabled;
}

uint64_t dispatchMainAfterDelay(void *a1, double a2)
{
  id v3 = a1;
  if (v3)
  {
    dispatch_block_t block = v3;
    if (a2 == 0.0)
    {
      dispatch_async(MEMORY[0x263EF83A0], v3);
    }
    else
    {
      dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
      dispatch_after(v4, MEMORY[0x263EF83A0], block);
    }
  }
  return MEMORY[0x270F9A758]();
}

void performBlockOnMainThreadAndWait(void *a1)
{
  dispatch_block_t block = a1;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v1 = block;
    if (!block) {
      goto LABEL_7;
    }
    block[2]();
  }
  else
  {
    uint64_t v1 = block;
    if (!block) {
      goto LABEL_7;
    }
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
  uint64_t v1 = block;
LABEL_7:
}

void performBlockOnMainThread(void *a1)
{
  dispatch_block_t block = a1;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v1 = block;
    if (!block) {
      goto LABEL_7;
    }
    block[2]();
  }
  else
  {
    uint64_t v1 = block;
    if (!block) {
      goto LABEL_7;
    }
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  uint64_t v1 = block;
LABEL_7:
}

uint64_t ICInternalSettingsIsTextKit2Enabled()
{
  if (ICInternalSettingsIsTextKit2Enabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsTextKit2Enabled_onceToken, &__block_literal_global_11);
  }
  return ICInternalSettingsIsTextKit2Enabled_isEnabled;
}

void sub_20C26BE4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_20C26C110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20C26C7C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_20C26CA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ICInternalSettingsIsCollapsibleSectionsEnabled()
{
  if (ICInternalSettingsIsCollapsibleSectionsEnabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsCollapsibleSectionsEnabled_onceToken, &__block_literal_global_226);
  }
  return ICInternalSettingsIsCollapsibleSectionsEnabled_isEnabled;
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

uint64_t ICUseCoreDataCoreSpotlightIntegration()
{
  if (ICUseCoreDataCoreSpotlightIntegration_onceToken != -1) {
    dispatch_once(&ICUseCoreDataCoreSpotlightIntegration_onceToken, &__block_literal_global_17);
  }
  return useCoreSpotlightCoreDataIntegration;
}

uint64_t ICDebugModeEnabled()
{
  char v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v1 = [v0 BOOLForKey:@"DebugModeEnabled"];

  if (v1) {
    return 1;
  }
  id v3 = CPSharedResourcesDirectory();
  dispatch_time_t v4 = [v3 stringByAppendingString:@"/Library/Notes/"];

  CFBooleanRef v5 = [MEMORY[0x263F08850] defaultManager];
  CFBooleanRef v6 = [v4 stringByAppendingPathComponent:@"DebugModeEnabled"];
  uint64_t v7 = [v5 fileExistsAtPath:v6];

  return v7;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t ICVerboseSearchLogging()
{
  if (ICVerboseSearchLogging_onceToken != -1) {
    dispatch_once(&ICVerboseSearchLogging_onceToken, &__block_literal_global_9);
  }
  return verboseSearchLogging;
}

void sub_20C270400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t ICLaunchConfigurationEnvironmentWithString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PurplePerformanceTesting"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"UserInterfaceTesting"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id ICKeyPathFromSelectors(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  v15 = (const char **)&a9;
  while (a1)
  {
    v11 = NSStringFromSelector(a1);
    [v10 addObject:v11];
    v12 = v15++;
    a1 = *v12;
  }
  v13 = [v10 componentsJoinedByString:@"."];

  return v13;
}

uint64_t TSDPointHasInfComponents(double a1, double a2)
{
  BOOL v2 = fabs(a1) == INFINITY;
  return fabs(a2) == INFINITY || v2;
}

BOOL TSDNearlyEqualRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL result = 0;
  if (vabdd_f64(a1, a5) < 0.01 && vabdd_f64(a2, a6) < 0.01)
  {
    BOOL v9 = vabdd_f64(a3, a7) < 0.01;
    return vabdd_f64(a4, a8) < 0.01 && v9;
  }
  return result;
}

void sub_20C270F04(void *a1, uint64_t a2)
{
  -[NSObject(IC) ic_removeObserver:forKeyPath:context:](a1, a2, v2);
  JUMPOUT(0x20C270EECLL);
}

uint64_t TSDRectHasNaNComponents()
{
  return 0;
}

void sub_20C271078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t TSDRectHasInfComponents(double a1, double a2, double a3, double a4)
{
  double v4 = fabs(a3);
  if (fabs(a4) == INFINITY || v4 == INFINITY) {
    return 1;
  }
  BOOL v7 = fabs(a1) == INFINITY;
  return fabs(a2) == INFINITY || v7;
}

__CFString *ICUIFrameworkBundleIdentifier()
{
  return @"com.apple.NotesUI";
}

uint64_t ICInternalSettingsIsOnenessUnlockEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t ICInternalSettingsIsAsyncFindEnabled()
{
  return _os_feature_enabled_impl();
}

CGColorSpaceRef __TSUDeviceRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceRGB();
  TSUDeviceRGBColorSpace_sDeviceRGBColorSpace = (uint64_t)result;
  return result;
}

uint64_t ICInternalSettingsIsNotesMathEnabled()
{
  if (ICInternalSettingsIsMathEnabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsMathEnabled_onceToken, &__block_literal_global_237);
  }
  return ICInternalSettingsIsMathEnabled_isEnabled;
}

void __ICUseCoreDataCoreSpotlightIntegration_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  useCoreSpotlightCoreDataIntegration = [v0 BOOLForKey:@"internalSettings.useCDCSI"];
}

void __ICInternalSettingsIsViewProviderCacheDisabled_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  ICInternalSettingsIsViewProviderCacheDisabled_isEnabled = [v0 BOOLForKey:@"DisableViewProviderCache"];
}

void __ICVerboseSearchLogging_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  verboseSearchLogging = [v0 BOOLForKey:@"internalSettings.search.verboseSearchLogging"];
}

uint64_t ICInternalSettingsIsSelectionStateTrackingEnabled()
{
  int v0 = _os_feature_enabled_impl();
  id v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v2 = [v1 BOOLForKey:@"EnableSelectionStateTracking"] | v0;

  return v2;
}

uint64_t ICInternalSettingsIsEmphasisEnabled()
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  id v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v2 = [v1 BOOLForKey:@"EnableEmphasis"];

  return v2;
}

uint64_t ICInternalSettingsIsScrubbingEnabled()
{
  if (ICInternalSettingsIsMathEnabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsMathEnabled_onceToken, &__block_literal_global_237);
  }
  if (!ICInternalSettingsIsMathEnabled_isEnabled) {
    return 0;
  }
  return _os_feature_enabled_impl();
}

uint64_t ICInternalSettingsIsGraphingEnabled()
{
  if (ICInternalSettingsIsMathEnabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsMathEnabled_onceToken, &__block_literal_global_237);
  }
  if (!ICInternalSettingsIsMathEnabled_isEnabled || !ICInternalSettingsIsPaperKitMathEnabled()) {
    return 0;
  }
  return _os_feature_enabled_impl();
}

uint64_t ICInternalSettingsIsPaperKitMathEnabled()
{
  if (ICInternalSettingsIsMathEnabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsMathEnabled_onceToken, &__block_literal_global_237);
  }
  if (!ICInternalSettingsIsMathEnabled_isEnabled) {
    return 0;
  }
  return _os_feature_enabled_impl();
}

void __ICInternalSettingsIsAudioTranscriptionEnabled_block_invoke()
{
  id v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
  if ([v1 BOOLForKey:@"EnableAudioTranscription"]) {
    char v0 = 1;
  }
  else {
    char v0 = _os_feature_enabled_impl();
  }
  ICInternalSettingsIsAudioTranscriptionEnabled_isEnabled = v0;
}

void __ICInternalSettingsIsMathEnabled_block_invoke()
{
  if (_os_feature_enabled_impl())
  {
    ICInternalSettingsIsMathEnabled_isEnabled = 1;
  }
  else
  {
    id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
    ICInternalSettingsIsMathEnabled_isEnabled = [v0 BOOLForKey:@"EnableMath"];
  }
}

uint64_t objectdestroy_5Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

id ICStringFromCGColor(CGColor *a1)
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  ColorSpace = CGColorGetColorSpace(a1);
  double v4 = (__CFString *)CGColorSpaceCopyName(ColorSpace);
  if (v4)
  {
    [v2 addObject:v4];
    size_t NumberOfComponents = CGColorGetNumberOfComponents(a1);
    Components = CGColorGetComponents(a1);
    if (NumberOfComponents)
    {
      BOOL v7 = Components;
      do
      {
        uint64_t v8 = *(void *)v7++;
        BOOL v9 = objc_msgSend(NSString, "stringWithFormat:", @"%.10f", v8);
        [v2 addObject:v9];

        --NumberOfComponents;
      }
      while (NumberOfComponents);
    }
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      ICStringFromCGColor_cold_1();
    }
  }
  if ([v2 count])
  {
    v11 = [v2 componentsJoinedByString:@";"];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

CGColorRef ICCGColorCreateWithString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 componentsSeparatedByString:@";"];
  uint64_t v3 = (void *)[v2 mutableCopy];

  if ([v3 count])
  {
    double v4 = [v3 firstObject];
    [v3 removeObjectAtIndex:0];
    CGColorSpaceRef v5 = CGColorSpaceCreateWithName(v4);
    if (v5)
    {
      CFBooleanRef v6 = v5;
      if ([v3 count])
      {
        uint64_t v7 = CGColorSpaceGetNumberOfComponents(v6) + 1;
        if ([v3 count] == v7)
        {
          uint64_t v8 = (CGFloat *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
          if (v7)
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              uint64_t v10 = [v3 objectAtIndexedSubscript:i];
              [v10 doubleValue];
              v8[i] = v11;
            }
          }
          CGColorRef v12 = CGColorCreate(v6, v8);
          free(v8);
          goto LABEL_22;
        }
        v15 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          ICCGColorCreateWithString_cold_4(v3, v7, v15);
        }
      }
      else
      {
        v14 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          ICCGColorCreateWithString_cold_3();
        }
      }
      CGColorRef v12 = 0;
LABEL_22:
      CGColorSpaceRelease(v6);
      goto LABEL_23;
    }
    v13 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      ICCGColorCreateWithString_cold_2();
    }
  }
  else
  {
    double v4 = (__CFString *)os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      ICCGColorCreateWithString_cold_1();
    }
  }
  CGColorRef v12 = 0;
LABEL_23:

  return v12;
}

CGColorRef ICCGColorCopyInverse(CGColor *a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  Components = CGColorGetComponents(a1);
  CGColorGetNumberOfComponents(a1);
  MEMORY[0x270FA5388]();
  CGColorSpaceRef v5 = (const CGFloat *)((char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v7 = (double *)Components;
    uint64_t v8 = (double *)v5;
    do
    {
      double v9 = *v7++;
      *v8++ = 1.0 - v9;
      --v6;
    }
    while (v6);
  }
  v5[v3] = Components[v3];
  ColorSpace = CGColorGetColorSpace(a1);
  return CGColorCreate(ColorSpace, v5);
}

uint64_t ICCGColorEquivalentToColor(CGColor *a1, CGColor *a2)
{
  if (!((unint64_t)a1 | (unint64_t)a2)) {
    return 1;
  }
  uint64_t v3 = 0;
  if (!a1 || !a2) {
    return v3;
  }
  CGColorGetColorSpace(a1);
  CGColorGetColorSpace(a2);
  if (CGColorSpaceEqualToColorSpace())
  {
    if (!CGColorEqualToColor(a1, a2))
    {
      size_t NumberOfComponents = CGColorGetNumberOfComponents(a1);
      if (NumberOfComponents != CGColorGetNumberOfComponents(a2)) {
        return 0;
      }
      Components = CGColorGetComponents(a1);
      CGFloat v11 = CGColorGetComponents(a2);
      if (NumberOfComponents)
      {
        size_t v12 = NumberOfComponents - 1;
        do
        {
          double v13 = *Components++;
          double v14 = v13;
          double v15 = *v11++;
          double v16 = vabdd_f64(v14, v15);
          BOOL v18 = v12-- != 0;
          uint64_t v3 = v16 < 0.00999999978;
        }
        while (v16 < 0.00999999978 && v18);
        return v3;
      }
    }
    return 1;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(DeviceRGB, kCGRenderingIntentDefault, a1, 0);
  uint64_t v8 = CGColorCreateCopyByMatchingToColorSpace(DeviceRGB, kCGRenderingIntentDefault, a2, 0);
  CGColorGetColorSpace(CopyByMatchingToColorSpace);
  CGColorGetColorSpace(v8);
  uint64_t v3 = 0;
  if (CGColorSpaceEqualToColorSpace()) {
    uint64_t v3 = ICCGColorEquivalentToColor(CopyByMatchingToColorSpace, v8);
  }
  CGColorSpaceRelease(DeviceRGB);
  CGColorRelease(CopyByMatchingToColorSpace);
  CGColorRelease(v8);
  return v3;
}

id ICDataFromCGImage(CGImage *a1, const __CFString *a2, void *a3)
{
  CFDictionaryRef v5 = a3;
  uint64_t v6 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
  uint64_t v7 = CGImageDestinationCreateWithData(v6, a2, 1uLL, 0);
  if (v7)
  {
    uint64_t v8 = v7;
    CGImageDestinationAddImage(v7, a1, v5);
    if (CGImageDestinationFinalize(v8))
    {
      CFRelease(v8);
      double v9 = (void *)[(__CFData *)v6 copy];
      goto LABEL_11;
    }
    CGFloat v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      ICDataFromCGImage_cold_2((uint64_t)a2, v11);
    }

    CFRelease(v8);
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      ICDataFromCGImage_cold_1(v10);
    }
  }
  double v9 = 0;
LABEL_11:

  return v9;
}

id ICJPEGDataFromCGImage(CGImage *a1)
{
  uint64_t v2 = [(id)*MEMORY[0x263F1DB40] identifier];
  uint64_t v3 = ICDataFromCGImage(a1, v2, 0);

  return v3;
}

id ICPNGDataFromCGImage(CGImage *a1)
{
  uint64_t v2 = [(id)*MEMORY[0x263F1DC08] identifier];
  uint64_t v3 = ICDataFromCGImage(a1, v2, 0);

  return v3;
}

void sub_20C273D0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20C274BD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
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

void sub_20C274D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_20C274FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  objc_sync_exit(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_20C2752FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_20C2753C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __UserManagementLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UserManagementLibraryCore_frameworkLibrary = result;
  return result;
}

UTType *__getUMUserPersonaAttributesClass_block_invoke(uint64_t a1)
{
  UserManagementLibrary();
  uint64_t result = (UTType *)objc_getClass("UMUserPersonaAttributes");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUMUserPersonaAttributesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getUMUserPersonaAttributesClass_block_invoke_cold_1();
    return +[ICArchive universalTypeIdentifier];
  }
  return result;
}

void sub_20C277CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C278468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

void sub_20C27941C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C27970C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C279A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Block_object_dispose((const void *)(v34 - 120), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_20C27B934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void *ICSpecificCast(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  if ([a2 isMemberOfClass:a1]) {
    return a2;
  }
  return 0;
}

CFTypeRef ICCFTypeCast(uint64_t a1, CFTypeRef cf)
{
  if (!cf) {
    return 0;
  }
  if (CFGetTypeID(cf) == a1) {
    return cf;
  }
  return 0;
}

void *ICCheckedProtocolCast(Protocol *a1, void *a2)
{
  if (!a1) {
    +[ICAssert handleFailedAssertWithCondition:"protocol" functionName:"id ICCheckedProtocolCast(Protocol *, id<NSObject>)" simulateCrash:1 showAlert:0 format:@"Protocol is nil"];
  }
  if (a2 && ([a2 conformsToProtocol:a1] & 1) == 0)
  {
    uint64_t v4 = objc_opt_class();
    if (a1) {
      Name = protocol_getName(a1);
    }
    else {
      Name = "<No protocol supplied>";
    }
    +[ICAssert handleFailedAssertWithCondition:"src == ((void *)0) || result != ((void *)0)", "id ICCheckedProtocolCast(Protocol *, id<NSObject>)", 1, 0, @"Unexpected object type in checked protocol cast %@ expects %s", v4, Name functionName simulateCrash showAlert format];
    return 0;
  }
  return a2;
}

void sub_20C27C6C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t ICInternalSettingsIsTracingEnabled()
{
  if (ICInternalSettingsIsTracingEnabled_predicate != -1) {
    dispatch_once(&ICInternalSettingsIsTracingEnabled_predicate, &__block_literal_global_7);
  }
  return ICInternalSettingsIsTracingEnabled_ICInternalSettingsTraceEnabled;
}

void __ICInternalSettingsIsTracingEnabled_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  ICInternalSettingsIsTracingEnabled_ICInternalSettingsTraceEnabled = [v0 BOOLForKey:@"internalSettings.traceEnabled"];
}

id ICGenericError()
{
  id v0 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.notes" code:-1 userInfo:0];
  return v0;
}

uint64_t ICRectEdgeAtIndex(unint64_t a1)
{
  if (a1 >= 4) {
    +[ICAssert handleFailedAssertWithCondition:"index < 4", "ICRectEdge ICRectEdgeAtIndex(NSUInteger)", 1, 0, @"Invalid edge index %lu", a1 functionName simulateCrash showAlert format];
  }
  if (a1 <= 3) {
    return (1 << a1);
  }
  else {
    return 0;
  }
}

uint64_t ICRectEdgeToIndex(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 8 && ((0x8Bu >> v1)) {
    return qword_20C2B7C40[v1];
  }
  +[ICAssert handleFailedAssertWithCondition:"__objc_no", "NSUInteger ICRectEdgeToIndex(ICRectEdge)", 1, 0, @"Invalid edge %lu", a1 functionName simulateCrash showAlert format];
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t ICStringFromRect(double a1, double a2, double a3, double a4)
{
  return [NSString stringWithFormat:@"{%.02f, %.02f} {%.02f, %.02f}", *(void *)&a1, *(void *)&a2, *(void *)&a3, *(void *)&a4];
}

__CFString *ICImportGroupContainerIdentifier()
{
  if (ICIsSandboxModeEnabled()) {
    id v0 = @"group.com.apple.notesdebug.import";
  }
  else {
    id v0 = @"group.com.apple.notes.import";
  }
  return v0;
}

__CFString *ICSupportFrameworkBundleIdentifier()
{
  return @"com.apple.NotesSupport";
}

__CFString *ICHTMLFrameworkBundleIdentifier()
{
  return @"com.apple.Notes";
}

id ICDataStoreServiceBundleIdentifier()
{
  id v0 = NSString;
  uint64_t v1 = ICNotesAppBundleIdentifier();
  uint64_t v2 = [v0 stringWithFormat:@"%@.datastore", v1];

  return v2;
}

id ICIntentsExtensionBundleIdentifier()
{
  id v0 = NSString;
  uint64_t v1 = ICNotesAppBundleIdentifier();
  uint64_t v2 = [v0 stringWithFormat:@"%@.IntentsExtension", v1];

  return v2;
}

id ICSharingExtensionBundleIdentifier()
{
  id v0 = NSString;
  uint64_t v1 = ICNotesAppBundleIdentifier();
  uint64_t v2 = [v0 stringWithFormat:@"%@.SharingExtension", v1];

  return v2;
}

id ICQuickLookExtensionBundleIdentifier()
{
  id v0 = NSString;
  uint64_t v1 = ICNotesAppBundleIdentifier();
  uint64_t v2 = [v0 stringWithFormat:@"%@.QuickLookExtension", v1];

  return v2;
}

id ICEditorExtensionBundleIdentifier()
{
  id v0 = NSString;
  uint64_t v1 = ICNotesAppBundleIdentifier();
  uint64_t v2 = [v0 stringWithFormat:@"%@.EditorExtension", v1];

  return v2;
}

__CFString *ICSystemPaperViewServiceBundleIdentifier()
{
  return @"com.apple.SystemPaperViewService";
}

id getPHPhotoLibraryClass()
{
  uint64_t v4 = 0;
  CFDictionaryRef v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getPHPhotoLibraryClass_softClass;
  uint64_t v7 = getPHPhotoLibraryClass_softClass;
  if (!getPHPhotoLibraryClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPHPhotoLibraryClass_block_invoke;
    v3[3] = &unk_2640CD368;
    v3[4] = &v4;
    __getPHPhotoLibraryClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20C27F4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPHPhotoLibraryClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __PhotosLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2640CD630;
    uint64_t v6 = 0;
    PhotosLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!PhotosLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("PHPhotoLibrary");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getPHPhotoLibraryClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPHPhotoLibraryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PhotosLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_20C2806D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_20C28139C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20C281634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSYItemIndexingManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SynapseLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __SynapseLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2640CD700;
    uint64_t v6 = 0;
    SynapseLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SynapseLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("SYItemIndexingManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getSYItemIndexingManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSYItemIndexingManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SynapseLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SynapseLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t ICInternalSettingsIsAlexandriaEnabled()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v1 = +[ICArchive userDefaultsKey];
  uint64_t v2 = [v0 BOOLForKey:v1];

  return v2;
}

uint64_t ICInternalSettingsIsAlexandriaDemoModeEnabled()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v1 = +[ICArchive demoModeUserDefaultsKey];
  uint64_t v2 = [v0 BOOLForKey:v1];

  return v2;
}

uint64_t ICInternalSettingsIsSystemPaperEnabled()
{
  int v0 = MGGetSInt32Answer();
  if (v0 == 3) {
    return 1;
  }
  if ((v0 - 1) > 1) {
    return 0;
  }
  return _os_feature_enabled_impl();
}

uint64_t ICInternalSettingsDefaultToPaperKitPDFsAndScans()
{
  uint64_t result = ICInternalSettingsIsPDFsInNotesEnabled();
  if (result)
  {
    id v1 = +[ICAppGroupDefaults sharedAppGroupDefaults];
    uint64_t v2 = [v1 BOOLForKey:@"DefaultToPaperKitPDFsAndScans"];

    return v2;
  }
  return result;
}

uint64_t ICInternalSettingsIsPDFsInNotesEnabled()
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  int v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"ICUseLegacyPDFAttachments"] ^ 1;

  return v1;
}

uint64_t ICInternalSettingsIsMentionNotificationsDisabled()
{
  int v0 = +[ICAppGroupDefaults sharedAppGroupDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"internalSettings.disableMentionNotifications"];

  return v1;
}

uint64_t ICInternalSettingsIsPageViewControllerCrashWorkaroundDisabled()
{
  int v0 = +[ICAppGroupDefaults sharedAppGroupDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"DisablePageViewControllerCrashWorkaround"];

  return v1;
}

uint64_t ICInternalSettingsSmartFoldersCanIncludeRecentlyDeletedNotes()
{
  int v0 = +[ICAppGroupDefaults sharedAppGroupDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"internalSettings.smartFoldersCanIncludeRecentlyDeletedNotes"];

  return v1;
}

uint64_t ICInternalSettingsIsLockedNotesV1NeoEnabled()
{
  if (+[ICDeviceSupport isRunningUnitTests]) {
    return 1;
  }
  uint64_t v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
  if ([v1 BOOLForKey:@"EnableLockedNotesV1Neo"]) {
    uint64_t v0 = 1;
  }
  else {
    uint64_t v0 = _os_feature_enabled_impl();
  }

  return v0;
}

uint64_t ICInternalSettingsIsSpotlightSearchSuggestionsEnabled()
{
  uint64_t v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  if ([v0 BOOLForKey:@"SpotlightSearchSuggestions"]) {
    uint64_t v1 = 1;
  }
  else {
    uint64_t v1 = _os_feature_enabled_impl();
  }

  return v1;
}

uint64_t ICInternalSettingsIsFCSReportAConcernEnabled()
{
  if (ICInternalSettingsIsFCSReportAConcernEnabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsFCSReportAConcernEnabled_onceToken, &__block_literal_global_214);
  }
  return ICInternalSettingsIsFCSReportAConcernEnabled_isEnabled;
}

void __ICInternalSettingsIsFCSReportAConcernEnabled_block_invoke()
{
  id v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
  if ([v1 BOOLForKey:@"Enable FCS Report a Concern"])
  {
    char v0 = 1;
  }
  else if (+[ICUtilities isSeedInstall])
  {
    char v0 = 0;
  }
  else
  {
    char v0 = !+[ICUtilities isInternalInstall];
  }
  ICInternalSettingsIsFCSReportAConcernEnabled_isEnabled = v0;
}

uint64_t ICInternalSettingsIsCallRecordingEnabled()
{
  if (ICInternalSettingsIsAudioTranscriptionEnabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsAudioTranscriptionEnabled_onceToken, &__block_literal_global_211);
  }
  if (!ICInternalSettingsIsAudioTranscriptionEnabled_isEnabled) {
    return 0;
  }
  return _os_feature_enabled_impl();
}

uint64_t ICInternalSettingsIsAudioKeyPointsEnabled()
{
  if (ICInternalSettingsIsAudioKeyPointsEnabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsAudioKeyPointsEnabled_onceToken, &__block_literal_global_219);
  }
  return ICInternalSettingsIsAudioKeyPointsEnabled_isEnabled;
}

void __ICInternalSettingsIsAudioKeyPointsEnabled_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  ICInternalSettingsIsAudioKeyPointsEnabled_isEnabled = [v0 BOOLForKey:@"EnableKeyPointsForAudio"];
}

uint64_t ICInternalSettingsIsAudioMastihaEnabled()
{
  if (ICInternalSettingsIsAudioMastihaEnabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsAudioMastihaEnabled_onceToken, &__block_literal_global_221);
  }
  return ICInternalSettingsIsAudioMastihaEnabled_isEnabled;
}

void __ICInternalSettingsIsAudioMastihaEnabled_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  ICInternalSettingsIsAudioMastihaEnabled_isEnabled = [v0 BOOLForKey:@"EnableMastihaForAudio"];
}

uint64_t ICInternalSettingsIsBlockQuoteEnabled()
{
  if (ICInternalSettingsIsBlockQuoteEnabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsBlockQuoteEnabled_onceToken, &__block_literal_global_223);
  }
  return ICInternalSettingsIsBlockQuoteEnabled_isEnabled;
}

void __ICInternalSettingsIsBlockQuoteEnabled_block_invoke()
{
  id v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
  if ([v1 BOOLForKey:@"EnableBlockQuote"]) {
    char v0 = 1;
  }
  else {
    char v0 = _os_feature_enabled_impl();
  }
  ICInternalSettingsIsBlockQuoteEnabled_isEnabled = v0;
}

uint64_t ICInternalSettingsIsNewNoteAcceleratorEnabled()
{
  char v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"EnableNewNoteAccelerator"];

  return v1;
}

uint64_t ICInternalSettingsIsSpotlightInstantAnswersEnabled()
{
  char v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"EnableSpotlightInstantAnswers"];

  return v1;
}

uint64_t ICInternalSettingsIsFindPDFsEnabled()
{
  uint64_t result = _os_feature_enabled_impl();
  if (result)
  {
    return _os_feature_enabled_impl();
  }
  return result;
}

uint64_t ICInternalSettingsIsLinkConversionEnabled()
{
  if (ICInternalSettingsIsLinkConversionEnabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsLinkConversionEnabled_onceToken, &__block_literal_global_231);
  }
  return ICInternalSettingsIsLinkConversionEnabled_isEnabled;
}

void __ICInternalSettingsIsLinkConversionEnabled_block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  char v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = @"EnableLinkConversion";
  v4[0] = MEMORY[0x263EFFA88];
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  [v0 registerDefaults:v1];

  if (+[ICDeviceSupport isRunningUnitTests])
  {
    ICInternalSettingsIsLinkConversionEnabled_isEnabled = 1;
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    ICInternalSettingsIsLinkConversionEnabled_isEnabled = [v2 BOOLForKey:@"EnableLinkConversion"];
  }
}

uint64_t ICInternalSettingsIsGreyParrotEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t ICInternalSettingsIsMathDebugHighlightingEnabled()
{
  if (ICInternalSettingsIsMathDebugHighlightingEnabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsMathDebugHighlightingEnabled_onceToken, &__block_literal_global_240);
  }
  return ICInternalSettingsIsMathDebugHighlightingEnabled_isEnabled;
}

void __ICInternalSettingsIsMathDebugHighlightingEnabled_block_invoke()
{
  if (ICInternalSettingsIsMathEnabled_onceToken != -1) {
    dispatch_once(&ICInternalSettingsIsMathEnabled_onceToken, &__block_literal_global_237);
  }
  if (ICInternalSettingsIsMathEnabled_isEnabled)
  {
    id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
    ICInternalSettingsIsMathDebugHighlightingEnabled_isEnabled = [v0 BOOLForKey:@"EnableMathDebugHighlighting"];
  }
  else
  {
    ICInternalSettingsIsMathDebugHighlightingEnabled_isEnabled = 0;
  }
}

uint64_t ICInternalSettingsShouldPreserveImportedCallRecordingData()
{
  if (ICInternalSettingsShouldPreserveImportedCallRecordingData_onceToken != -1) {
    dispatch_once(&ICInternalSettingsShouldPreserveImportedCallRecordingData_onceToken, &__block_literal_global_246);
  }
  return ICInternalSettingsShouldPreserveImportedCallRecordingData_isEnabled;
}

void __ICInternalSettingsShouldPreserveImportedCallRecordingData_block_invoke()
{
  if (ICInternalSettingsIsCallRecordingEnabled())
  {
    id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
    ICInternalSettingsShouldPreserveImportedCallRecordingData_isEnabled = [v0 BOOLForKey:@"PreserveImportedCallRecordingData"];
  }
  else
  {
    ICInternalSettingsShouldPreserveImportedCallRecordingData_isEnabled = 0;
  }
}

uint64_t ICInternalSettingsShouldDisableTranscriptPostProcessing()
{
  if (ICInternalSettingsShouldDisableTranscriptPostProcessing_onceToken != -1) {
    dispatch_once(&ICInternalSettingsShouldDisableTranscriptPostProcessing_onceToken, &__block_literal_global_248);
  }
  return ICInternalSettingsShouldDisableTranscriptPostProcessing_isEnabled;
}

void __ICInternalSettingsShouldDisableTranscriptPostProcessing_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  ICInternalSettingsShouldDisableTranscriptPostProcessing_isEnabled = [v0 BOOLForKey:@"DisableTranscriptPostProcessing"];
}

uint64_t ICInternalSettingsShouldPostProcessOnlyTranscriptParagraphs()
{
  if (ICInternalSettingsShouldPostProcessOnlyTranscriptParagraphs_onceToken != -1) {
    dispatch_once(&ICInternalSettingsShouldPostProcessOnlyTranscriptParagraphs_onceToken, &__block_literal_global_250);
  }
  return ICInternalSettingsShouldPostProcessOnlyTranscriptParagraphs_isEnabled;
}

void __ICInternalSettingsShouldPostProcessOnlyTranscriptParagraphs_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  ICInternalSettingsShouldPostProcessOnlyTranscriptParagraphs_isEnabled = [v0 BOOLForKey:@"PostProcessOnlyTranscriptParagraphs"];
}

uint64_t ICInternalSettingsDisableGASRAvailabilityCheck()
{
  if (ICInternalSettingsDisableGASRAvailabilityCheck_onceToken != -1) {
    dispatch_once(&ICInternalSettingsDisableGASRAvailabilityCheck_onceToken, &__block_literal_global_252);
  }
  return ICInternalSettingsDisableGASRAvailabilityCheck_isEnabled;
}

void __ICInternalSettingsDisableGASRAvailabilityCheck_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  ICInternalSettingsDisableGASRAvailabilityCheck_isEnabled = [v0 BOOLForKey:@"DisableGASRAvailabilityCheck"];
}

uint64_t ICInternalSettingsIsGenerationToolEnabled()
{
  if (+[ICDeviceSupport isRunningUnitTests]) {
    return 1;
  }
  uint64_t result = _os_feature_enabled_impl();
  if (result)
  {
    return _os_feature_enabled_impl();
  }
  return result;
}

uint64_t ICInternalSettingsShouldShowImageGenerationUI()
{
  uint64_t result = ICInternalSettingsIsGenerationToolEnabled();
  if (result)
  {
    if (ICInternalSettingsShouldShowImageGenerationUI_onceToken != -1) {
      dispatch_once(&ICInternalSettingsShouldShowImageGenerationUI_onceToken, &__block_literal_global_255);
    }
    uint64_t v1 = (void *)ICInternalSettingsShouldShowImageGenerationUI_imageGenerationController;
    return [v1 shouldShowImageGenerationUI];
  }
  return result;
}

uint64_t __ICInternalSettingsShouldShowImageGenerationUI_block_invoke()
{
  ICInternalSettingsShouldShowImageGenerationUI_imageGenerationController = (uint64_t)objc_alloc_init(NSClassFromString(&cfstr_Pkimagegenerat.isa));
  return MEMORY[0x270F9A758]();
}

uint64_t ICInternalSettingsIsAppleAccountBrandingEnabled()
{
  return _os_feature_enabled_impl();
}

__CFString *NSStringFromICLaunchConfigurationEnvironment(uint64_t a1)
{
  uint64_t v1 = @"Default";
  if (a1 == 1) {
    uint64_t v1 = @"PurplePerformanceTesting";
  }
  if (a1 == 2) {
    return @"UserInterfaceTesting";
  }
  else {
    return v1;
  }
}

id ICUnlocalizedString(void *a1)
{
  id v1 = a1;
  return v1;
}

void sub_20C283848(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20C2838C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20C283934(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20C2839D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20C283A74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20C283B30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20C284564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
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

void sub_20C284714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C285C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C286108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

__CFString *NSStringFromNotesVersion(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      uint64_t result = @"Fall2015";
      break;
    case 1:
      uint64_t result = @"Fall2016";
      break;
    case 2:
      uint64_t result = @"Fall2017";
      break;
    case 3:
      uint64_t result = @"Fall2018";
      break;
    case 4:
      uint64_t result = @"Fall2019";
      break;
    case 5:
      uint64_t result = @"Fall2020";
      break;
    case 6:
      uint64_t result = @"Spring2021";
      break;
    case 7:
      uint64_t result = @"Fall2021";
      break;
    case 8:
      uint64_t result = @"Spring2022";
      break;
    case 9:
      uint64_t result = @"Fall2022";
      break;
    case 10:
      uint64_t result = @"Fall2022B";
      break;
    case 11:
      uint64_t result = @"Winter2022";
      break;
    case 12:
      uint64_t result = @"Spring2023";
      break;
    case 13:
      uint64_t result = @"Fall2023";
      break;
    case 14:
      uint64_t result = @"Spring2024";
      break;
    case 15:
      uint64_t result = @"Fall2024";
      break;
    default:
      if (a1 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t result = @"Unknown";
      }
      else {
        uint64_t result = @"Before2015";
      }
      break;
  }
  return result;
}

uint64_t __UserManagementLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  UserManagementLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getUMUserPersonaAttributesClass_block_invoke_0(uint64_t a1)
{
  UserManagementLibrary_0();
  Class result = objc_getClass("UMUserPersonaAttributes");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUMUserPersonaAttributesClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getUMUserPersonaAttributesClass_block_invoke_cold_1();
    return (Class)OUTLINED_FUNCTION_3(v3);
  }
  return result;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_20C286EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
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

void ReachabilityCallback(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (void *)MEMORY[0x263F08A00];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 postNotificationName:kReachabilityChangedNotification object:v4];
}

uint64_t ICReindexAlertEnabled()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"reindexingAlertEnabled"];

  return v1;
}

void ICEnableSandboxMode()
{
  if (_ICDidInquireSandboxModeEnabled == 1)
  {
    id v0 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
      ICEnableSandboxMode_cold_1(v0);
    }
  }
  else if (_ICIsSandboxModeEnabled == 1)
  {
    id v0 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
      ICEnableSandboxMode_cold_2(v0);
    }
  }
  else
  {
    _ICIsSandboxModeEnabled = 1;
    id v0 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_20C263000, v0, OS_LOG_TYPE_INFO, "Enabled sandbox mode", v1, 2u);
    }
  }
}

__CFString *ICSearchableIndexName()
{
  if (ICIsSandboxModeEnabled()) {
    id v0 = @"NotesDebug";
  }
  else {
    id v0 = @"Notes";
  }
  return v0;
}

void sub_20C28976C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_20C289C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20C289E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_20C28A18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C28A90C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20C28B290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20C28B880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20C28C25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_20C28C4D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20C28C5E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

__CFString *ICSettingsBundleID()
{
  if (ICIsSandboxModeEnabled()) {
    return @"com.apple.mobilenotesdebug";
  }
  else {
    return @"com.apple.mobilenotes";
  }
}

uint64_t ICHashWithHashKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  size_t v12 = &a9;
  if (!a1) {
    return 1;
  }
  uint64_t v9 = a1;
  uint64_t result = 1;
  do
  {
    uint64_t result = v9 - result + 32 * result;
    CGFloat v11 = (uint64_t *)v12;
    v12 += 8;
    uint64_t v9 = *v11;
  }
  while (v9);
  return result;
}

uint64_t ICHashWithArray(void *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = [v3 hash];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = objc_opt_class();
          size_t v12 = ICCheckedDynamicCast(v11, (uint64_t)v10);
          uint64_t v13 = ICHashWithArray();
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = objc_opt_class();
            size_t v12 = ICCheckedDynamicCast(v14, (uint64_t)v10);
            uint64_t v13 = ICHashWithDictionary(v12);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v15 = objc_opt_class();
              size_t v12 = ICCheckedDynamicCast(v15, (uint64_t)v10);
              uint64_t v13 = ICHashWithSet(v12);
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v16 = objc_opt_class();
                size_t v12 = ICCheckedDynamicCast(v16, (uint64_t)v10);
                uint64_t v13 = ICHashWithOrderedSet(v12);
              }
              else
              {
                uint64_t v17 = objc_msgSend(v10, "hash", (void)v19);
                if (v17) {
                  goto LABEL_17;
                }
                size_t v12 = [MEMORY[0x263EFF9D0] null];
                uint64_t v13 = [v12 hash];
              }
            }
          }
        }
        uint64_t v17 = v13;

LABEL_17:
        uint64_t v4 = v17 + 31 * v4;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v4;
}

uint64_t ICHashWithDictionary(void *a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = [v3 hash];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = v1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v29);
        id v12 = v10;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = objc_opt_class();
          uint64_t v14 = ICCheckedDynamicCast(v13, (uint64_t)v12);
          uint64_t v15 = ICHashWithArray();
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v16 = objc_opt_class();
            uint64_t v14 = ICCheckedDynamicCast(v16, (uint64_t)v12);
            uint64_t v15 = ICHashWithDictionary();
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v17 = objc_opt_class();
              uint64_t v14 = ICCheckedDynamicCast(v17, (uint64_t)v12);
              uint64_t v15 = ICHashWithSet(v14);
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v18 = objc_opt_class();
                uint64_t v14 = ICCheckedDynamicCast(v18, (uint64_t)v12);
                uint64_t v15 = ICHashWithOrderedSet(v14);
              }
              else
              {
                uint64_t v19 = [v12 hash];
                if (v19) {
                  goto LABEL_17;
                }
                uint64_t v14 = [MEMORY[0x263EFF9D0] null];
                uint64_t v15 = [v14 hash];
              }
            }
          }
        }
        uint64_t v19 = v15;

LABEL_17:
        id v20 = v11;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v21 = objc_opt_class();
          long long v22 = ICCheckedDynamicCast(v21, (uint64_t)v20);
          uint64_t v23 = ICHashWithArray();
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v24 = objc_opt_class();
            long long v22 = ICCheckedDynamicCast(v24, (uint64_t)v20);
            uint64_t v23 = ICHashWithDictionary();
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v25 = objc_opt_class();
              long long v22 = ICCheckedDynamicCast(v25, (uint64_t)v20);
              uint64_t v23 = ICHashWithSet(v22);
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v26 = objc_opt_class();
                long long v22 = ICCheckedDynamicCast(v26, (uint64_t)v20);
                uint64_t v23 = ICHashWithOrderedSet(v22);
              }
              else
              {
                uint64_t v27 = [v20 hash];
                if (v27) {
                  goto LABEL_28;
                }
                long long v22 = [MEMORY[0x263EFF9D0] null];
                uint64_t v23 = [v22 hash];
              }
            }
          }
        }
        uint64_t v27 = v23;

LABEL_28:
        v4 += 31 * v19 + v27;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }

  return v4;
}

uint64_t ICHashWithSet(void *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = [v3 hash];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = objc_opt_class();
          id v12 = ICCheckedDynamicCast(v11, (uint64_t)v10);
          uint64_t v13 = ICHashWithArray();
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = objc_opt_class();
            id v12 = ICCheckedDynamicCast(v14, (uint64_t)v10);
            uint64_t v13 = ICHashWithDictionary();
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v15 = objc_opt_class();
              id v12 = ICCheckedDynamicCast(v15, (uint64_t)v10);
              uint64_t v13 = ICHashWithSet();
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v16 = objc_opt_class();
                id v12 = ICCheckedDynamicCast(v16, (uint64_t)v10);
                uint64_t v13 = ICHashWithOrderedSet(v12);
              }
              else
              {
                uint64_t v17 = objc_msgSend(v10, "hash", (void)v19);
                if (v17) {
                  goto LABEL_17;
                }
                id v12 = [MEMORY[0x263EFF9D0] null];
                uint64_t v13 = [v12 hash];
              }
            }
          }
        }
        uint64_t v17 = v13;

LABEL_17:
        v4 += v17;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v4;
}

uint64_t ICHashWithOrderedSet(void *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = [v3 hash];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = objc_opt_class();
          id v12 = ICCheckedDynamicCast(v11, (uint64_t)v10);
          uint64_t v13 = ICHashWithArray();
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = objc_opt_class();
            id v12 = ICCheckedDynamicCast(v14, (uint64_t)v10);
            uint64_t v13 = ICHashWithDictionary();
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v15 = objc_opt_class();
              id v12 = ICCheckedDynamicCast(v15, (uint64_t)v10);
              uint64_t v13 = ICHashWithSet();
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v16 = objc_opt_class();
                id v12 = ICCheckedDynamicCast(v16, (uint64_t)v10);
                uint64_t v13 = ICHashWithOrderedSet();
              }
              else
              {
                uint64_t v17 = objc_msgSend(v10, "hash", (void)v19);
                if (v17) {
                  goto LABEL_17;
                }
                id v12 = [MEMORY[0x263EFF9D0] null];
                uint64_t v13 = [v12 hash];
              }
            }
          }
        }
        uint64_t v17 = v13;

LABEL_17:
        uint64_t v4 = v17 + 31 * v4;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v4;
}

id catchingException(void *a1)
{
  id v1 = a1;
  v1[2]();

  return 0;
}

void sub_20C28F4A0(void *a1)
{
  id v1 = objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x20C28F47CLL);
}

void sub_20C28FA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCHSTimelineControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!ChronoServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    void v4[2] = 3221225472;
    v4[3] = __ChronoServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2640CDF18;
    uint64_t v6 = 0;
    ChronoServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!ChronoServicesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("CHSTimelineController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getCHSTimelineControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCHSTimelineControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ChronoServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ChronoServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_20C29092C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_20C290DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20C290E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20C290EE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20C290F5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20C290FF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20C291154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20C2912D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20C291368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20C2914B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__7(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void sub_20C2915AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20C291628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20C291798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20C29189C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C291A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_20C291AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20C291C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_20C291DA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20C291EE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20C29208C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20C2921A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20C29226C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20C29581C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  objc_destroyWeak(v22);
  _Block_object_dispose(&a22, 8);
  objc_destroyWeak((id *)(v23 - 56));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_20C295AD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__14(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void sub_20C296F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C299F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_20C29A988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_20C29AC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C29AE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double TSDOffsetForEdgeOfFrame(int a1, double a2, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 0:
      double result = CGRectGetMinX(*(CGRect *)&a2);
      break;
    case 1:
      double result = CGRectGetMidX(*(CGRect *)&a2);
      break;
    case 2:
      double result = CGRectGetMaxX(*(CGRect *)&a2);
      break;
    case 3:
      double result = CGRectGetMinY(*(CGRect *)&a2);
      break;
    case 4:
      double result = CGRectGetMidY(*(CGRect *)&a2);
      break;
    case 5:
      double result = CGRectGetMaxY(*(CGRect *)&a2);
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

double TSDRectWithCenterAndSize(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

double TSDRectWithPoints(double a1, double a2, double a3)
{
  if (a1 >= a3) {
    return a3;
  }
  else {
    return a1;
  }
}

double TSDRectWithSize()
{
  return 0.0;
}

double TSDRectWithSizeAlignedToRect(int a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v17.size.height = a4;
  v17.size.double width = a3;
  v17.origin.double x = 0.0;
  v17.origin.y = 0.0;
  CGRect v18 = CGRectStandardize(v17);
  double x = v18.origin.x;
  double width = v18.size.width;
  v18.origin.double x = a5;
  v18.origin.y = a6;
  v18.size.double width = a7;
  v18.size.height = a8;
  if (!CGRectIsNull(v18))
  {
    switch(a1)
    {
      case 3:
        v20.origin.double x = a5;
        v20.origin.y = a6;
        v20.size.double width = a7;
        v20.size.height = a8;
        double x = CGRectGetMaxX(v20) - width;
        break;
      case 2:
        v21.origin.double x = a5;
        v21.origin.y = a6;
        v21.size.double width = a7;
        v21.size.height = a8;
        double x = CGRectGetMidX(v21) + width * -0.5;
        break;
      case 1:
        v19.origin.double x = a5;
        v19.origin.y = a6;
        v19.size.double width = a7;
        v19.size.height = a8;
        double x = CGRectGetMinX(v19);
        break;
    }
    switch(a2)
    {
      case 3:
        v23.origin.double x = a5;
        v23.origin.y = a6;
        v23.size.double width = a7;
        v23.size.height = a8;
        CGRectGetMaxY(v23);
        break;
      case 2:
        v24.origin.double x = a5;
        v24.origin.y = a6;
        v24.size.double width = a7;
        v24.size.height = a8;
        CGRectGetMidY(v24);
        break;
      case 1:
        v22.origin.double x = a5;
        v22.origin.y = a6;
        v22.size.double width = a7;
        v22.size.height = a8;
        CGRectGetMinY(v22);
        break;
    }
  }
  return x;
}

BOOL TSDNearlyEqualPoints(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 0.01;
  return vabdd_f64(a2, a4) < 0.01 && v4;
}

BOOL TSDNearlyEqualSizes(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 0.01;
  return vabdd_f64(a2, a4) < 0.01 && v4;
}

BOOL TSDNearlyEqualSizesWithThreshold(double a1, double a2, double a3, double a4, double a5)
{
  BOOL v5 = vabdd_f64(a1, a3) < a5;
  return vabdd_f64(a2, a4) < a5 && v5;
}

BOOL TSDNearlyEqualTransforms(double *a1, double *a2)
{
  return vabdd_f64(*a1, *a2) < 0.000000001
      && vabdd_f64(a1[1], a2[1]) < 0.000000001
      && vabdd_f64(a1[2], a2[2]) < 0.000000001
      && vabdd_f64(a1[3], a2[3]) < 0.000000001
      && vabdd_f64(a1[4], a2[4]) < 0.000000001
      && vabdd_f64(a1[5], a2[5]) < 0.000000001;
}

BOOL TSDNearlyContainsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v18 = CGRectInset(*(CGRect *)&a1, -0.01, -0.01);
  double v12 = a5;
  double v13 = a6;
  double v14 = a7;
  double v15 = a8;
  return CGRectContainsRect(v18, *(CGRect *)&v12);
}

BOOL TSDCollinearPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return fabs((a3 - a1) * (a6 - a2) - (a4 - a2) * (a5 - a1)) < 8.90029543e-308;
}

BOOL TSDNearlyCollinearPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a3 - a1;
  return (v6 * (a6 - a2) - (a4 - a2) * (a5 - a1)) * (v6 * (a6 - a2) - (a4 - a2) * (a5 - a1)) < ((a4 - a2) * (a4 - a2)
                                                                                              + v6 * v6)
                                                                                             * 0.0001
                                                                                             * ((a6 - a2) * (a6 - a2)
                                                                                              + (a5 - a1) * (a5 - a1));
}

double TSDDistanceSquared(double a1, double a2, double a3, double a4)
{
  return (a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3);
}

BOOL TSDRectsOverlapVertically(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v22.origin.double x = a5;
  v22.origin.y = a6;
  v22.size.double width = a7;
  v22.size.height = a8;
  double v16 = CGRectGetMinX(v22);
  v23.origin.double x = a1;
  v23.origin.y = a2;
  v23.size.double width = a3;
  v23.size.height = a4;
  double MaxX = CGRectGetMaxX(v23);
  v24.origin.double x = a5;
  v24.origin.y = a6;
  v24.size.double width = a7;
  v24.size.height = a8;
  double v18 = CGRectGetMaxX(v24);
  if (MinX <= v16) {
    return MaxX >= v16;
  }
  else {
    return v18 >= MinX;
  }
}

BOOL TSDRectsOverlapHorizontally(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinY = CGRectGetMinY(*(CGRect *)&a1);
  v22.origin.double x = a5;
  v22.origin.y = a6;
  v22.size.double width = a7;
  v22.size.height = a8;
  double v16 = CGRectGetMinY(v22);
  v23.origin.double x = a1;
  v23.origin.y = a2;
  v23.size.double width = a3;
  v23.size.height = a4;
  double MaxY = CGRectGetMaxY(v23);
  v24.origin.double x = a5;
  v24.origin.y = a6;
  v24.size.double width = a7;
  v24.size.height = a8;
  double v18 = CGRectGetMaxY(v24);
  if (MinY <= v16) {
    return MaxY >= v16;
  }
  else {
    return v18 >= MinY;
  }
}

uint64_t TSDLineIntersectsRect(CGFloat a1, CGFloat a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v12 = a4;
  double v13 = a3;
  while (1)
  {
    uint64_t v16 = p_ComputeOutcode(a1, a2, a5, a6, a7, a8);
    uint64_t v17 = p_ComputeOutcode(v13, v12, a5, a6, a7, a8);
    uint64_t result = 1;
    if (!v16 || !v17) {
      break;
    }
    if ((v17 & v16) != 0) {
      return 0;
    }
    double v19 = (v13 + a1) * 0.5;
    double v20 = (v12 + a2) * 0.5;
    int v21 = TSDLineIntersectsRect(1, a1, a2, v19, v20, a5, a6, a7, a8);
    a1 = v19;
    a2 = v20;
    double v13 = a3;
    double v12 = a4;
    if (v21) {
      return 1;
    }
  }
  return result;
}

uint64_t p_ComputeOutcode(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v14.origin.double x = a3;
  v14.origin.y = a4;
  v14.size.double width = a5;
  v14.size.height = a6;
  if (a2 <= CGRectGetMaxY(v14))
  {
    v15.origin.double x = a3;
    v15.origin.y = a4;
    v15.size.double width = a5;
    v15.size.height = a6;
    if (a2 < CGRectGetMinY(v15)) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 1;
  }
  v16.origin.double x = a3;
  v16.origin.y = a4;
  v16.size.double width = a5;
  v16.size.height = a6;
  if (a1 > CGRectGetMaxX(v16)) {
    return v12 | 4;
  }
  v17.origin.double x = a3;
  v17.origin.y = a4;
  v17.size.double width = a5;
  v17.size.height = a6;
  if (a1 < CGRectGetMinX(v17)) {
    return v12 | 8;
  }
  else {
    return v12;
  }
}

double TSDAveragePoints(double a1, double a2, double a3)
{
  return (a1 + a3) * 0.5;
}

double TSDNearestPointOnInfiniteLineToPoint(double *a1, double a2, double a3)
{
  double v3 = a1[1];
  double v4 = a1[2] - *a1;
  double v5 = a1[3] - v3;
  double v6 = 1.0 / sqrt(v5 * v5 + v4 * v4);
  return *a1 + v4 * v6 * ((a3 - v3) * (v5 * v6) + (a2 - *a1) * (v4 * v6));
}

double TSDNormalizePoint(double a1, double a2)
{
  return a1 * (1.0 / sqrt(a2 * a2 + a1 * a1));
}

double TSDSubtractPoints(double a1, double a2, double a3)
{
  return a1 - a3;
}

double TSDDotPoints(double a1, double a2, double a3, double a4)
{
  return a2 * a4 + a1 * a3;
}

double TSDAddPoints(double a1, double a2, double a3)
{
  return a1 + a3;
}

double TSDMultiplyPointScalar(double a1, double a2, double a3)
{
  return a1 * a3;
}

BOOL TSDSizeIsEmpty(double a1, double a2)
{
  return a2 == 0.0 || a1 == 0.0;
}

double TSDSizeWithMaxArea(double result, double a2, double a3, double a4)
{
  if (result * a2 <= a3 * a4) {
    return a3;
  }
  return result;
}

double TSDUnionRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v8 = a7 <= 0.0;
  if (a8 > 0.0) {
    BOOL v8 = 0;
  }
  if (a3 > 0.0 || a4 > 0.0)
  {
    if (v8)
    {
      return a1;
    }
    else if (a1 < a5)
    {
      return a1;
    }
  }
  else if (v8)
  {
    return *MEMORY[0x263F001A8];
  }
  return a5;
}

double TSDHorizontalSpacingRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v31.origin.double x = a5;
  v31.origin.y = a6;
  v31.size.double width = a7;
  CGFloat v24 = a7;
  v31.size.height = a8;
  double v29 = fmax(MinX, CGRectGetMinX(v31));
  v32.origin.double x = a1;
  v32.origin.y = a2;
  v32.size.double width = a3;
  v32.size.height = a4;
  double MaxX = CGRectGetMaxX(v32);
  v33.origin.double x = a5;
  v33.origin.y = a6;
  v33.size.double width = a7;
  v33.size.height = a8;
  double v27 = fmin(MaxX, CGRectGetMaxX(v33));
  v34.origin.double x = a1;
  v34.origin.y = a2;
  v34.size.double width = a3;
  v34.size.height = a4;
  double MaxY = CGRectGetMaxY(v34);
  v35.origin.double x = a5;
  v35.origin.y = a6;
  v35.size.double width = v24;
  v35.size.height = a8;
  double v16 = fmin(MaxY, CGRectGetMaxY(v35));
  v36.origin.double x = a1;
  v36.origin.y = a2;
  v36.size.double width = a3;
  v36.size.height = a4;
  double MinY = CGRectGetMinY(v36);
  v37.origin.double x = a5;
  v37.origin.y = a6;
  v37.size.double width = v24;
  v37.size.height = a8;
  double v18 = fmax(MinY, CGRectGetMinY(v37));
  double v19 = v29;
  double v21 = v18 - v16;
  double v22 = v16;
  double v20 = v27 - v29;
  *(void *)&double result = (unint64_t)CGRectStandardize(*(CGRect *)&v19);
  return result;
}

double TSDVerticalSpacingRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  v31.origin.double x = a5;
  v31.origin.y = a6;
  v31.size.double width = a7;
  CGFloat v24 = a7;
  v31.size.height = a8;
  double v29 = fmin(MaxX, CGRectGetMaxX(v31));
  v32.origin.double x = a1;
  v32.origin.y = a2;
  v32.size.double width = a3;
  v32.size.height = a4;
  double MinX = CGRectGetMinX(v32);
  v33.origin.double x = a5;
  v33.origin.y = a6;
  v33.size.double width = a7;
  v33.size.height = a8;
  double v27 = fmax(MinX, CGRectGetMinX(v33));
  v34.origin.double x = a1;
  v34.origin.y = a2;
  v34.size.double width = a3;
  v34.size.height = a4;
  double MinY = CGRectGetMinY(v34);
  v35.origin.double x = a5;
  v35.origin.y = a6;
  v35.size.double width = v24;
  v35.size.height = a8;
  double v16 = fmax(MinY, CGRectGetMinY(v35));
  v36.origin.double x = a1;
  v36.origin.y = a2;
  v36.size.double width = a3;
  v36.size.height = a4;
  double MaxY = CGRectGetMaxY(v36);
  v37.origin.double x = a5;
  v37.origin.y = a6;
  v37.size.double width = v24;
  v37.size.height = a8;
  double v18 = fmin(MaxY, CGRectGetMaxY(v37));
  double v19 = v29;
  double v21 = v18 - v16;
  double v22 = v16;
  double v20 = v27 - v29;
  *(void *)&double result = (unint64_t)CGRectStandardize(*(CGRect *)&v19);
  return result;
}

BOOL TSDIntersectsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (a1 < a5) {
    BOOL result = a1 + a3 > a5;
  }
  else {
    BOOL result = a5 + a7 > a1;
  }
  if (a2 >= a6)
  {
    if (a6 + a8 > a2) {
      return result;
    }
    return 0;
  }
  if (a2 + a4 <= a6) {
    return 0;
  }
  return result;
}

BOOL TSDPointInRectInclusive(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a3 + a5;
  return a1 >= a3 && a1 <= v6 && a2 >= a4 && a2 <= a4 + a6;
}

double TSDAddSizes(double a1, double a2, double a3)
{
  return a1 + a3;
}

double TSDSubtractSizes(double a1, double a2, double a3)
{
  return a1 - a3;
}

double TSDMultiplyPointBySize(double a1, double a2, double a3)
{
  return a1 * a3;
}

double TSDMultiplySizeScalar(double a1, double a2, double a3)
{
  return a1 * a3;
}

double TSDMultiplyRectScalar(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v9 = a1;
  if (!CGRectIsInfinite(*(CGRect *)&a1))
  {
    v11.origin.double x = v9;
    v11.origin.y = a2;
    v11.size.double width = a3;
    v11.size.height = a4;
    if (!CGRectIsNull(v11)) {
      return v9 * a5;
    }
  }
  return v9;
}

double TSDFlooredPoint(double a1)
{
  return floor(a1);
}

double TSDPointLength(double a1, double a2)
{
  return sqrt(a2 * a2 + a1 * a1);
}

double TSDPointSquaredLength(double a1, double a2)
{
  return a2 * a2 + a1 * a1;
}

double TSDDistance(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

double TSDOrthogonalDistance(double a1, double a2, double a3, double a4)
{
  double v4 = a1 - a3;
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  double v5 = a2 - a4;
  if (v5 < 0.0) {
    double v5 = -v5;
  }
  return v4 + v5;
}

void TSDDistanceToRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v16.origin.double x = a3;
  v16.origin.y = a4;
  v16.size.double width = a5;
  v16.size.height = a6;
  if (a1 < CGRectGetMinX(v16))
  {
    v17.origin.double x = a3;
    v17.origin.y = a4;
    v17.size.double width = a5;
    v17.size.height = a6;
    if (a2 < CGRectGetMinY(v17))
    {
      v18.origin.double x = a3;
      v18.origin.y = a4;
      v18.size.double width = a5;
      v18.size.height = a6;
      CGRectGetMinX(v18);
LABEL_7:
      v22.origin.double x = a3;
      v22.origin.y = a4;
      v22.size.double width = a5;
      v22.size.height = a6;
      CGRectGetMinY(v22);
      return;
    }
    v23.origin.double x = a3;
    v23.origin.y = a4;
    v23.size.double width = a5;
    v23.size.height = a6;
    double MaxY = CGRectGetMaxY(v23);
    v24.origin.double x = a3;
    v24.origin.y = a4;
    v24.size.double width = a5;
    v24.size.height = a6;
    CGRectGetMinX(v24);
    if (a2 <= MaxY) {
      return;
    }
LABEL_13:
    v28.origin.double x = a3;
    v28.origin.y = a4;
    v28.size.double width = a5;
    v28.size.height = a6;
    CGRectGetMaxY(v28);
    return;
  }
  v19.origin.double x = a3;
  v19.origin.y = a4;
  v19.size.double width = a5;
  v19.size.height = a6;
  double MaxX = CGRectGetMaxX(v19);
  v20.origin.double x = a3;
  v20.origin.y = a4;
  v20.size.double width = a5;
  v20.size.height = a6;
  double MinY = CGRectGetMinY(v20);
  if (a1 <= MaxX)
  {
    if (a2 >= MinY)
    {
      v29.origin.double x = a3;
      v29.origin.y = a4;
      v29.size.double width = a5;
      v29.size.height = a6;
      if (a2 > CGRectGetMaxY(v29))
      {
        v30.origin.double x = a3;
        v30.origin.y = a4;
        v30.size.double width = a5;
        v30.size.height = a6;
        CGRectGetMaxY(v30);
      }
    }
    else
    {
      v25.origin.double x = a3;
      v25.origin.y = a4;
      v25.size.double width = a5;
      v25.size.height = a6;
      CGRectGetMinY(v25);
    }
    return;
  }
  if (a2 < MinY)
  {
    v21.origin.double x = a3;
    v21.origin.y = a4;
    v21.size.double width = a5;
    v21.size.height = a6;
    CGRectGetMaxX(v21);
    goto LABEL_7;
  }
  v26.origin.double x = a3;
  v26.origin.y = a4;
  v26.size.double width = a5;
  v26.size.height = a6;
  double v15 = CGRectGetMaxY(v26);
  v27.origin.double x = a3;
  v27.origin.y = a4;
  v27.size.double width = a5;
  v27.size.height = a6;
  CGRectGetMaxX(v27);
  if (a2 > v15) {
    goto LABEL_13;
  }
}

double TSDDistanceToRectFromRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v23.origin.double x = a1;
  v23.origin.y = a2;
  v23.size.double width = a3;
  v23.size.height = a4;
  double MidY = CGRectGetMidY(v23);
  double v16 = TSUClamp(MidX, a5, a5 + a7);
  double v17 = TSUClamp(MidY, a6, a6 + a8);
  double v18 = TSUClamp(v16, a1, a1 + a3);
  double v19 = TSUClamp(v17, a2, a2 + a4);
  return sqrt((v17 - v19) * (v17 - v19) + (v16 - v18) * (v16 - v18));
}

double TSDClampPointInRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v9 = TSUClamp(a1, a3, a3 + a5);
  TSUClamp(a2, a4, a4 + a6);
  return v9;
}

double TSDCenterOfRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.y = a2;
  v10.size.double width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

BOOL TSDPercentRectInsideRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v9 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  return CGRectEqualToRect(v9, *MEMORY[0x263F001A0]);
}

double TSDRectGetMaxPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.y = a2;
  v10.size.double width = a3;
  v10.size.height = a4;
  CGRectGetMaxY(v10);
  return MaxX;
}

double TSDComplexMultiplyPoint(double a1, double a2, double a3, double a4)
{
  return a1 * a3 - a2 * a4;
}

double TSDCrossPoints(double a1, double a2, double a3, double a4)
{
  return a2 * a3 - a1 * a4;
}

double TSDGrowRectToPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  if (!CGRectIsNull(*(CGRect *)&a1))
  {
    v13.origin.double x = a1;
    v13.origin.y = a2;
    v13.size.double width = a3;
    v13.size.height = a4;
    double MinX = CGRectGetMinX(v13);
    if (MinX >= a5) {
      double v11 = a5;
    }
    else {
      double v11 = MinX;
    }
    v14.origin.double x = a1;
    v14.origin.y = a2;
    v14.size.double width = a3;
    v14.size.height = a4;
    CGRectGetMaxX(v14);
    v15.origin.double x = a1;
    v15.origin.y = a2;
    v15.size.double width = a3;
    v15.size.height = a4;
    CGRectGetMinY(v15);
    v16.origin.double x = a1;
    v16.origin.y = a2;
    v16.size.double width = a3;
    v16.size.height = a4;
    CGRectGetMaxY(v16);
    return v11;
  }
  return a5;
}

double TSDFlipRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRectGetMidY(*(CGRect *)&a1);
  v14.origin.double x = a5;
  v14.origin.y = a6;
  v14.size.double width = a7;
  v14.size.height = a8;
  CGRectGetMidY(v14);
  return a1;
}

double TSDCenterRectOverRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v26.origin.double x = a5;
  v26.origin.y = a6;
  v26.size.double width = a7;
  v26.size.height = a8;
  double MidX = CGRectGetMidX(v26);
  v27.origin.double x = a5;
  v27.origin.y = a6;
  v27.size.double width = a7;
  v27.size.height = a8;
  double MidY = CGRectGetMidY(v27);
  v28.origin.double x = a1;
  v28.origin.y = a2;
  v28.size.double width = a3;
  v28.size.height = a4;
  double v17 = CGRectGetMidX(v28);
  v29.origin.double x = a1;
  v29.origin.y = a2;
  v29.size.double width = a3;
  v29.size.height = a4;
  double v18 = MidY - CGRectGetMidY(v29);
  CGFloat v19 = a1;
  CGFloat v20 = a2;
  CGFloat v21 = a3;
  CGFloat v22 = a4;
  *(void *)&double result = (unint64_t)CGRectOffset(*(CGRect *)&v19, MidX - v17, v18);
  return result;
}

BOOL TSDRectIsFinite(double a1, double a2, double a3, double a4)
{
  BOOL result = 0;
  if (fabs(a1) != INFINITY && fabs(a2) != INFINITY && fabs(a3) != INFINITY)
  {
    double v5 = fabs(a4);
    return v5 > INFINITY || v5 < INFINITY;
  }
  return result;
}

void TSDRectDivide(CGRect *a1, CGRect *a2, CGRectEdge a3, double a4, double a5, double a6, double a7, CGFloat a8)
{
  memset(v8, 0, sizeof(v8));
  if (!a1) {
    a1 = (CGRect *)v8;
  }
  if (!a2) {
    a2 = (CGRect *)v8;
  }
  CGRectDivide(*(CGRect *)&a4, a1, a2, a8, a3);
}

uint64_t TSDGetCanvasSpaceCorners(uint64_t a1, _OWORD *a2, _OWORD *a3, _OWORD *a4, _OWORD *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  v53[2] = *(double *)MEMORY[0x263EF8340];
  long long v18 = *(_OWORD *)(a1 + 16);
  float64x2_t v46 = *(float64x2_t *)a1;
  long long v47 = v18;
  long long v48 = *(_OWORD *)(a1 + 32);
  TSDTransformedCornersOfRect(&v46, &v49, &v51, &v52, v53, a6, a7, a8, a9);
  v54.origin.double x = a6;
  v54.origin.y = a7;
  v54.size.double width = a8;
  v54.size.height = a9;
  double MidX = CGRectGetMidX(v54);
  v55.origin.double x = a6;
  v55.origin.y = a7;
  v55.size.double width = a8;
  v55.size.height = a9;
  CGFloat MidY = CGRectGetMidY(v55);
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  double v23 = *(double *)(a1 + 32) + MidY * *(double *)(a1 + 16) + *(double *)a1 * MidX;
  double v24 = 1000000.0;
  double v25 = *(double *)(a1 + 40) + MidY * *(double *)(a1 + 24) + *(double *)(a1 + 8) * MidX;
  CGRect v26 = (double *)&v50;
  do
  {
    long double v27 = atan2(*v26 - v25, *(v26 - 1) - v23);
    double v28 = fmod(v27 * 57.2957795, 360.0);
    if (v28 < 0.0) {
      double v28 = v28 + 360.0;
    }
    if (v28 == 0.0) {
      double v29 = 225.0;
    }
    else {
      double v29 = 360.0 - v28 + -135.0;
    }
    double v30 = fabs(v29);
    if (v30 < v24)
    {
      uint64_t v21 = v22;
      double v24 = v30;
    }
    ++v22;
    v26 += 2;
  }
  while (v22 != 4);
  *a2 = *((_OWORD *)&v49 + v21);
  uint64_t v31 = (v21 + 2) & 3;
  if (v21 + 2 <= 0) {
    uint64_t v31 = -(-(v21 + 2) & 3);
  }
  *a4 = *((_OWORD *)&v49 + v31);
  long long v32 = *(_OWORD *)(a1 + 16);
  float64x2_t v46 = *(float64x2_t *)a1;
  long long v47 = v32;
  long long v48 = *(_OWORD *)(a1 + 32);
  BOOL v33 = TSDIsTransformFlipped(v46.f64);
  uint64_t v34 = v21 + 3;
  if (v33) {
    uint64_t v35 = v21 + 1;
  }
  else {
    uint64_t v35 = v21 + 3;
  }
  uint64_t v36 = v35 & 3;
  if (!v33) {
    uint64_t v34 = v21 + 1;
  }
  uint64_t v38 = -v35;
  BOOL v37 = v38 < 0;
  uint64_t v39 = v38 & 3;
  if (v37) {
    uint64_t v40 = v36;
  }
  else {
    uint64_t v40 = -v39;
  }
  *a5 = *((_OWORD *)&v49 + v40);
  uint64_t v41 = v34 & 3;
  uint64_t v42 = -v34;
  BOOL v37 = v42 < 0;
  uint64_t v43 = v42 & 3;
  if (v37) {
    uint64_t v44 = v41;
  }
  else {
    uint64_t v44 = -v43;
  }
  *a3 = *((_OWORD *)&v49 + v44);
  return v21;
}

double TSDAngleFromDelta(long double a1, long double a2)
{
  return atan2(a2, a1);
}

void TSDNormalizeAngleInDegrees(long double a1)
{
}

double TSDInterpolatePoints(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

double TSDMixPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

uint64_t TSDMixBOOLs(uint64_t result, unsigned int a2, double a3)
{
  if (a3 > 0.5) {
    return a2;
  }
  else {
    return result;
  }
}

double TSDMixFloats(double a1, double a2, double a3)
{
  return a2 * a3 + a1 * (1.0 - a3);
}

void TSDMixAnglesInDegrees(long double a1, long double a2, double a3)
{
  double v5 = fmod(a1, 360.0);
  if (v5 < 0.0) {
    double v5 = v5 + 360.0;
  }
  if (v5 == 0.0) {
    double v6 = 0.0;
  }
  else {
    double v6 = v5;
  }
  double v7 = fmod(a2, 360.0);
  if (v7 < 0.0) {
    double v7 = v7 + 360.0;
  }
  if (v7 == 0.0) {
    double v7 = 0.0;
  }
  if (vabdd_f64(v7, v6) > 180.0)
  {
    if (v6 <= v7) {
      double v7 = v7 + -360.0;
    }
    else {
      double v7 = v7 + 360.0;
    }
  }
  fmod(v7 * a3 + v6 * (1.0 - a3), 360.0);
}

double TSDMixAnglesInRadians(double a1, double a2, double a3)
{
  TSDMixAnglesInDegrees(a1 * 57.2957795, a2 * 57.2957795, a3);
  return v3 * 0.0174532925;
}

double TSDMixSizes(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

double TSDMixRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a5 * a9 + a1 * (1.0 - a9);
}

double TSDSizeWithMaxSize(double result, double a2, double a3)
{
  if (result >= a3) {
    return a3;
  }
  return result;
}

double TSDClipRectToMaxY(double a1, double a2, double a3, double a4)
{
  return a1;
}

double TSDClipRectToMinY(double a1, double a2, double a3, double a4)
{
  return a1;
}

double TSDTranslatedRectMaximizingOverlapWithRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v36.origin.double x = a5;
  v36.origin.y = a6;
  v36.size.double width = a7;
  v36.size.height = a8;
  double MaxX = CGRectGetMaxX(v36);
  double v34 = a1;
  v37.origin.double x = a1;
  v37.origin.y = a2;
  v37.size.double width = a3;
  v37.size.height = a4;
  if (MaxX > CGRectGetMaxX(v37))
  {
    v38.origin.double x = a5;
    v38.origin.y = a6;
    v38.size.double width = a7;
    v38.size.height = a8;
    double MinX = CGRectGetMinX(v38);
    v39.origin.double x = a1;
    v39.origin.y = a2;
    v39.size.double width = a3;
    v39.size.height = a4;
    if (MinX > CGRectGetMinX(v39))
    {
      v40.origin.double x = a5;
      v40.origin.y = a6;
      v40.size.double width = a7;
      v40.size.height = a8;
      double v29 = CGRectGetMaxX(v40);
      v41.origin.double x = a1;
      v41.origin.y = a2;
      v41.size.double width = a3;
      v41.size.height = a4;
      double v30 = v29 - CGRectGetMaxX(v41);
      v42.origin.double x = a5;
      v42.origin.y = a6;
      v42.size.double width = a7;
      v42.size.height = a8;
      double v28 = CGRectGetMinX(v42);
      v43.origin.double x = a1;
      v43.origin.y = a2;
      v43.size.double width = a3;
      v43.size.height = a4;
      double v17 = v28 - CGRectGetMinX(v43);
      if (v30 < v17) {
        double v17 = v30;
      }
      double v18 = a1 + v17;
LABEL_11:
      double v34 = v18;
      goto LABEL_12;
    }
  }
  v44.origin.double x = a5;
  v44.origin.y = a6;
  v44.size.double width = a7;
  v44.size.height = a8;
  double v19 = CGRectGetMinX(v44);
  v45.origin.double x = a1;
  v45.origin.y = a2;
  v45.size.double width = a3;
  v45.size.height = a4;
  if (v19 < CGRectGetMinX(v45))
  {
    v46.origin.double x = a5;
    v46.origin.y = a6;
    v46.size.double width = a7;
    v46.size.height = a8;
    double v20 = CGRectGetMaxX(v46);
    v47.origin.double x = a1;
    v47.origin.y = a2;
    v47.size.double width = a3;
    v47.size.height = a4;
    if (v20 < CGRectGetMaxX(v47))
    {
      v48.origin.double x = a1;
      v48.origin.y = a2;
      v48.size.double width = a3;
      v48.size.height = a4;
      double v31 = CGRectGetMinX(v48);
      v49.origin.double x = a5;
      v49.origin.y = a6;
      v49.size.double width = a7;
      v49.size.height = a8;
      double v32 = v31 - CGRectGetMinX(v49);
      v50.origin.double x = a1;
      v50.origin.y = a2;
      v50.size.double width = a3;
      v50.size.height = a4;
      double v21 = CGRectGetMaxX(v50);
      v51.origin.double x = a5;
      v51.origin.y = a6;
      v51.size.double width = a7;
      v51.size.height = a8;
      double v22 = v21 - CGRectGetMaxX(v51);
      if (v32 < v22) {
        double v22 = v32;
      }
      double v18 = a1 - v22;
      goto LABEL_11;
    }
  }
LABEL_12:
  v52.origin.double x = a5;
  v52.origin.y = a6;
  v52.size.double width = a7;
  v52.size.height = a8;
  double MaxY = CGRectGetMaxY(v52);
  v53.origin.double x = a1;
  v53.origin.y = a2;
  v53.size.double width = a3;
  v53.size.height = a4;
  if (MaxY <= CGRectGetMaxY(v53)) {
    goto LABEL_15;
  }
  v54.origin.double x = a5;
  v54.origin.y = a6;
  v54.size.double width = a7;
  v54.size.height = a8;
  double MinY = CGRectGetMinY(v54);
  v55.origin.double x = a1;
  v55.origin.y = a2;
  v55.size.double width = a3;
  v55.size.height = a4;
  if (MinY <= CGRectGetMinY(v55))
  {
LABEL_15:
    v60.origin.double x = a5;
    v60.origin.y = a6;
    v60.size.double width = a7;
    v60.size.height = a8;
    double v25 = CGRectGetMinY(v60);
    v61.origin.double x = a1;
    v61.origin.y = a2;
    v61.size.double width = a3;
    v61.size.height = a4;
    if (v25 < CGRectGetMinY(v61))
    {
      v62.origin.double x = a5;
      v62.origin.y = a6;
      v62.size.double width = a7;
      v62.size.height = a8;
      double v26 = CGRectGetMaxY(v62);
      v63.origin.double x = a1;
      v63.origin.y = a2;
      v63.size.double width = a3;
      v63.size.height = a4;
      if (v26 < CGRectGetMaxY(v63))
      {
        v64.origin.double x = a1;
        v64.origin.y = a2;
        v64.size.double width = a3;
        v64.size.height = a4;
        CGRectGetMinY(v64);
        v65.origin.double x = a5;
        v65.origin.y = a6;
        v65.size.double width = a7;
        v65.size.height = a8;
        CGRectGetMinY(v65);
        v66.origin.double x = a1;
        v66.origin.y = a2;
        v66.size.double width = a3;
        v66.size.height = a4;
        CGRectGetMaxY(v66);
        v67.origin.double x = a5;
        v67.origin.y = a6;
        v67.size.double width = a7;
        v67.size.height = a8;
        CGRectGetMaxY(v67);
      }
    }
  }
  else
  {
    v56.origin.double x = a5;
    v56.origin.y = a6;
    v56.size.double width = a7;
    v56.size.height = a8;
    CGRectGetMaxY(v56);
    v57.origin.double x = a1;
    v57.origin.y = a2;
    v57.size.double width = a3;
    v57.size.height = a4;
    CGRectGetMaxY(v57);
    v58.origin.double x = a5;
    v58.origin.y = a6;
    v58.size.double width = a7;
    v58.size.height = a8;
    CGRectGetMinY(v58);
    v59.origin.double x = a1;
    v59.origin.y = a2;
    v59.size.double width = a3;
    v59.size.height = a4;
    CGRectGetMinY(v59);
  }
  return v34;
}

double TSDOriginRotate(double *a1, double a2, double a3)
{
  __double2 v5 = __sincos_stret(a3);
  double result = v5.__sinval * a2;
  *a1 = v5.__cosval * a2;
  a1[1] = v5.__sinval * a2;
  return result;
}

double TSDNiceAngleFromDelta(long double a1, long double a2)
{
  if (a2 != 0.0) {
    return atan2(a2, a1);
  }
  double result = 3.14159265;
  if (a1 >= 0.0) {
    return 0.0;
  }
  return result;
}

double TSDDeltaFromAngle(double a1)
{
  if (a1 == 0.0) {
    return 1.0;
  }
  return __sincos_stret(a1).__cosval;
}

double TSDShiftConstrainDelta(long double a1, long double a2)
{
  long double v4 = atan2(a2, a1);
  return sqrt(a2 * a2 + a1 * a1)
       * __sincos_stret((double)(int)((v4 + 6.28318531) / 0.785398163 + 0.5) * 0.785398163).__cosval;
}

double TSDShiftConstrainDeltaToAngle(double a1, double a2, double a3)
{
  return __sincos_stret(a3).__cosval * sqrt(a2 * a2 + a1 * a1);
}

double TSDRotatePoint90Degrees(int a1, double a2, double a3)
{
  if (a1) {
    return -a3;
  }
  else {
    return a3;
  }
}

void TSDNormalizeSignedDifferenceAngleInDegrees(double a1, double a2)
{
}

double TSDNormalizeDifferenceAngleInDegrees(double a1, double a2)
{
  double v2 = fmod(a1 - a2, 360.0);
  if (v2 > 180.0) {
    double v2 = v2 + -360.0;
  }
  if (v2 < -180.0) {
    double v2 = v2 + 360.0;
  }
  return fabs(v2);
}

void TSDNormalizeAngleInRadians(long double a1)
{
}

void TSDNormalizeAngleAboutZeroInRadians(double a1)
{
}

double TSDDeltaApplyAffineTransform(float64x2_t *a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a3), *a1, a2)), vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], *(double *)(MEMORY[0x263F00148] + 8)), *a1, *MEMORY[0x263F00148])));
  return result;
}

void TSDDistanceBetweenAnglesInRadians(long double a1, long double a2)
{
}

double TSDAngleBetweenPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a3 - a1;
  double v7 = a4 - a2;
  double v8 = 1.0 / sqrt(v7 * v7 + v6 * v6);
  double v9 = a5 - a1;
  double v10 = a6 - a2;
  double v11 = 1.0 / sqrt(v10 * v10 + v9 * v9);
  return acos(v7 * v8 * (v10 * v11) + v6 * v8 * (v9 * v11));
}

double TSDRotationFromTransform(uint64_t a1)
{
  return atan2(*(long double *)(a1 + 8), *(long double *)(a1 + 24));
}

double TSDNormalizedPointInRect(double a1, double a2, double a3, double a4, double a5)
{
  return (a1 - a3) / a5;
}

double TSDPointFromNormalizedRect(double a1, double a2, double a3, double a4, double a5)
{
  return a3 + a1 * a5;
}

void TSDRectFromNormalizedSubrect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v12.origin.double x = a5;
  v12.origin.y = a6;
  v12.size.double width = a7;
  v12.size.height = a8;
  CGRectGetMaxX(v12);
  v13.origin.double x = a5;
  v13.origin.y = a6;
  v13.size.double width = a7;
  v13.size.height = a8;
  CGRectGetMaxY(v13);
}

void TSDNormalizedSubrectInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRectGetMaxX(*(CGRect *)&a1);
  v8.origin.double x = a1;
  v8.origin.y = a2;
  v8.size.double width = a3;
  v8.size.height = a4;
  CGRectGetMaxY(v8);
}

double TSDRectSubtractingRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
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

double TSDRectWithTopRightPoint(double a1, double a2, double a3)
{
  return a3 - a1;
}

double TSDRectWithBottomRightPoint(double a1, double a2, double a3)
{
  return a3 - a1;
}

double TSDRectWithTopLeftPoint(double a1, double a2, double a3)
{
  return a3;
}

double TSDRectWithBottomLeftPoint(double a1, double a2, double a3)
{
  return a3;
}

double TSDSizeWithAspectRatio(int a1, double result, double a3, double a4, double a5)
{
  BOOL v5 = result == a4 && a3 == a5;
  if (!v5 && a4 != 0.0 && a5 != 0.0 && a4 != 3.40282347e38 && a5 != 3.40282347e38)
  {
    if (a1)
    {
      double v6 = sqrt(a5 * a5 + a4 * a4);
      return a4 / v6 * (a3 * (a5 / v6) + result * (a4 / v6));
    }
    else if (vabdd_f64(result, a4) < 0.01)
    {
      return a3 * a4 / a5;
    }
  }
  return result;
}

double TSDSizeExpandedToMatchAspectRatio(double result, double a2, double a3, double a4)
{
  BOOL v4 = result != a3;
  if (a2 != a4) {
    BOOL v4 = 1;
  }
  BOOL v5 = a3 <= 0.0 || !v4;
  if (!v5 && a4 > 0.0)
  {
    double v6 = a3 / a4;
    if (v6 > result / a2) {
      return a2 * v6;
    }
  }
  return result;
}

double TSDScaleSizeWithinSize(double a1, double a2, double a3, double a4)
{
  if (a1 / a2 < a3 / a4) {
    return a1 * (a4 / a2);
  }
  return a3;
}

double TSDShrinkSizeToFitInSize(double result, double a2, double a3, double a4)
{
  if (result <= a3)
  {
    BOOL v4 = a2 == a4;
    BOOL v5 = a2 < a4;
  }
  else
  {
    BOOL v4 = 0;
    BOOL v5 = 0;
  }
  if (!v5 && !v4)
  {
    if (result / a2 <= a3 / a4)
    {
      if (result / a2 < a3 / a4) {
        return result * (a4 / a2);
      }
      else {
        return a3;
      }
    }
    else
    {
      return a3;
    }
  }
  return result;
}

double TSDFitOrFillSizeInSize(int a1, double a2, double a3, double a4, double a5)
{
  double v5 = a4 / a2;
  double v6 = a5 / a3;
  if (v5 >= v6) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  if (v5 >= v6) {
    double v5 = v6;
  }
  if (a1) {
    double v5 = v7;
  }
  return a2 * v5;
}

double TSDFitOrFillSizeInRect(int a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  double v11 = a6 / a2;
  if (a6 / a2 >= a7 / a3) {
    double v12 = a6 / a2;
  }
  else {
    double v12 = a7 / a3;
  }
  if (a6 / a2 >= a7 / a3) {
    double v11 = a7 / a3;
  }
  if (a1) {
    double v13 = v12;
  }
  else {
    double v13 = v11;
  }
  return TSDCenterRectOverRect(0.0, 0.0, a2 * v13, a3 * v13, a4, a5, a6, a7);
}

void TSDScaleRectAroundPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7)
{
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, -a5, -a6);
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, a7, a7);
  memset(&v16, 0, sizeof(v16));
  CGAffineTransform t1 = v18;
  CGAffineTransform t2 = v17;
  CGAffineTransformConcat(&v15, &t1, &t2);
  CGAffineTransform t1 = v18;
  CGAffineTransformInvert(&v12, &t1);
  CGAffineTransformConcat(&v16, &v15, &v12);
  CGAffineTransform t1 = v16;
  v19.origin.CGFloat x = a1;
  v19.origin.CGFloat y = a2;
  v19.size.CGFloat width = a3;
  v19.size.CGFloat height = a4;
  CGRectApplyAffineTransform(v19, &t1);
}

void TSDScaledRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  double MidY = CGRectGetMidY(v13);
  TSDScaleRectAroundPoint(a1, a2, a3, a4, MidX, MidY, a5);
}

void TSDVisibleUnscaledRectForNewScale(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7, double a8)
{
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeScale(&v19, a7, a7);
  memset(&v18, 0, sizeof(v18));
  CGAffineTransform v17 = v19;
  CGAffineTransformInvert(&v18, &v17);
  CGAffineTransform v17 = v18;
  v20.origin.CGFloat x = a1;
  v20.origin.CGFloat y = a2;
  v20.size.CGFloat width = a3;
  v20.size.CGFloat height = a4;
  CGRect v21 = CGRectApplyAffineTransform(v20, &v17);
  float64x2_t v14 = vaddq_f64(*(float64x2_t *)&v18.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v18.c, a6), *(float64x2_t *)&v18.a, a5));
  TSDScaleRectAroundPoint(v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, v14.f64[0], v14.f64[1], a7 / a8);
}

double TSDRectWithInverseNormalizedRect(double a1, double a2, double a3)
{
  return -a1 / a3;
}

double TSDRectByExpandingBoundingRectToContentRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, double a10, double a11, double a12)
{
  double v25 = a1 + a5 * a3;
  v36.origin.CGFloat x = a5;
  v36.origin.CGFloat y = a6;
  v36.size.CGFloat width = a7;
  v36.size.CGFloat height = a8;
  double MaxX = CGRectGetMaxX(v36);
  v37.origin.CGFloat x = a5;
  v37.origin.CGFloat y = a6;
  v37.size.CGFloat width = a7;
  v37.size.CGFloat height = a8;
  CGRectGetMaxY(v37);
  double v26 = a1 + MaxX * a3;
  if (v25 >= v26) {
    double v27 = a1 + MaxX * a3;
  }
  else {
    double v27 = v25;
  }
  if (v25 >= v26) {
    double v26 = v25;
  }
  double v35 = v27;
  double v28 = v26 - v27;
  double v29 = -a9 / a11 * (v26 - v27);
  v38.origin.CGFloat x = -a9 / a11;
  v38.origin.CGFloat y = -a10 / a12;
  v38.size.CGFloat width = 1.0 / a11;
  v38.size.CGFloat height = 1.0 / a12;
  double v30 = CGRectGetMaxX(v38);
  v39.origin.CGFloat x = -a9 / a11;
  v39.origin.CGFloat y = -a10 / a12;
  v39.size.CGFloat width = 1.0 / a11;
  v39.size.CGFloat height = 1.0 / a12;
  CGRectGetMaxY(v39);
  if (v29 >= v30 * v28) {
    double v31 = v30 * v28;
  }
  else {
    double v31 = v29;
  }
  return v35 + v31;
}

double TSDClampRectToRect(double a1, double a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double v23 = a5 + a7;
  double v15 = TSUClamp(a1, a5, a5 + a7);
  double v21 = a6;
  double v22 = a6 + a8;
  TSUClamp(a2, a6, a6 + a8);
  v24.origin.CGFloat x = a1;
  v24.origin.CGFloat y = a2;
  v24.size.CGFloat width = a3;
  v24.size.CGFloat height = a4;
  double MaxX = CGRectGetMaxX(v24);
  v25.origin.CGFloat x = a1;
  v25.origin.CGFloat y = a2;
  v25.size.CGFloat width = a3;
  v25.size.CGFloat height = a4;
  double MaxY = CGRectGetMaxY(v25);
  double v18 = TSUClamp(MaxX, a5, v23);
  TSUClamp(MaxY, v21, v22);
  if (v15 >= v18) {
    return v18;
  }
  else {
    return v15;
  }
}

double TSDAliasRound(double a1)
{
  double v1 = floor(a1);
  double v2 = a1 - v1;
  double result = ceil(a1);
  if (v2 < 0.49) {
    return v1;
  }
  return result;
}

double TSDAliasRoundedPoint(double a1)
{
  double v1 = floor(a1);
  double v2 = a1 - v1;
  double result = ceil(a1);
  if (v2 < 0.49) {
    return v1;
  }
  return result;
}

double TSDRoundForScale(double a1, double a2)
{
  return TSURound(a1 * a2) / a2;
}

double TSDRoundedPoint(double a1, double a2)
{
  double v3 = TSURound(a1);
  TSURound(a2);
  return v3;
}

double TSDRoundedPointForScale(double a1, double a2, double a3)
{
  double v4 = a2 * a3;
  double v5 = TSURound(a1 * a3);
  TSURound(v4);
  return 1.0 / a3 * v5;
}

double TSDRoundedSize(double a1, double a2)
{
  double v3 = TSURound(a1);
  TSURound(a2);
  return v3;
}

double TSDCeilSize(double a1)
{
  return ceil(a1);
}

double TSDRoundedRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return TSDRoundedRectForScale(a1, a2, a3, a4, 1.0);
}

double TSDRoundedRectForScale(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v8 = a1;
  if (a5 != 0.0 && !CGRectIsNull(*(CGRect *)&a1))
  {
    v23.origin.CGFloat x = TSDMultiplyRectScalar(v8, a2, a3, a4, a5);
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
    double MinX = CGRectGetMinX(v23);
    double v15 = TSURound(MinX);
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v24);
    double v17 = TSURound(MinY);
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v25);
    CGFloat v19 = TSURound(MaxX) - v15;
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v26);
    double v21 = TSURound(MaxY);
    return TSDMultiplyRectScalar(v15, v17, v19, v21 - v17, 1.0 / a5);
  }
  return v8;
}

double TSDAliasRoundedRectForScale(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v8 = a1;
  if (a5 != 0.0 && !CGRectIsNull(*(CGRect *)&a1))
  {
    v34.origin.CGFloat x = TSDMultiplyRectScalar(v8, a2, a3, a4, a5);
    CGFloat x = v34.origin.x;
    CGFloat y = v34.origin.y;
    CGFloat width = v34.size.width;
    CGFloat height = v34.size.height;
    double MinX = CGRectGetMinX(v34);
    double v15 = floor(MinX);
    double v16 = MinX - v15;
    double v17 = ceil(MinX);
    if (v16 >= 0.49) {
      double v18 = v17;
    }
    else {
      double v18 = v15;
    }
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v35);
    double v20 = floor(MinY);
    double v21 = MinY - v20;
    double v22 = ceil(MinY);
    if (v21 >= 0.49) {
      CGFloat v23 = v22;
    }
    else {
      CGFloat v23 = v20;
    }
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v36);
    double v25 = floor(MaxX);
    double v26 = MaxX - v25;
    double v27 = ceil(MaxX);
    if (v26 < 0.49) {
      double v27 = v25;
    }
    double v33 = v27 - v18;
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v37);
    double v29 = floor(MaxY);
    double v30 = MaxY - v29;
    double v31 = ceil(MaxY);
    if (v30 < 0.49) {
      double v31 = v29;
    }
    return TSDMultiplyRectScalar(v18, v23, v33, v31 - v23, 1.0 / a5);
  }
  return v8;
}

double TSDRoundedMinX(double a1, double a2, double a3, double a4)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  return TSURound(MinX);
}

double TSDRoundedMidX(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v8 = TSURound(a1);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  double MaxX = CGRectGetMaxX(v13);
  double v10 = (v8 + TSURound(MaxX)) * 0.5;
  return TSURound(v10);
}

double TSDRoundedMaxX(double a1, double a2, double a3, double a4)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  return TSURound(MaxX);
}

double TSDRoundedMinY(double a1, double a2, double a3, double a4)
{
  double MinY = CGRectGetMinY(*(CGRect *)&a1);
  return TSURound(MinY);
}

double TSDRoundedMidY(CGFloat a1, double a2, CGFloat a3, CGFloat a4)
{
  double v8 = TSURound(a2);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  double MaxY = CGRectGetMaxY(v13);
  double v10 = (v8 + TSURound(MaxY)) * 0.5;
  return TSURound(v10);
}

double TSDRoundedMaxY(double a1, double a2, double a3, double a4)
{
  double MaxY = CGRectGetMaxY(*(CGRect *)&a1);
  return TSURound(MaxY);
}

double TSDFloorForScale(double a1, double a2)
{
  return TSURound(a1 * a2) / a2;
}

uint64_t TSDSizeHasNaNComponents()
{
  return 0;
}

uint64_t TSDTransformHasNaNComponents()
{
  return 0;
}

uint64_t TSDSizeHasInfComponents(double a1, double a2)
{
  BOOL v2 = fabs(a2) == INFINITY;
  return fabs(a1) == INFINITY || v2;
}

double TSDSanitizeRect(double result)
{
  double v1 = fabs(result);
  if (v1 >= INFINITY) {
    double v2 = 0.0;
  }
  else {
    double v2 = result;
  }
  if (v1 <= INFINITY) {
    return v2;
  }
  return result;
}

double TSDSanitizePoint(double result)
{
  double v1 = fabs(result);
  if (v1 >= INFINITY) {
    double v2 = 0.0;
  }
  else {
    double v2 = result;
  }
  if (v1 <= INFINITY) {
    return v2;
  }
  return result;
}

double TSDSanitizeSize(double result)
{
  double v1 = fabs(result);
  if (v1 >= INFINITY) {
    double v2 = 0.0;
  }
  else {
    double v2 = result;
  }
  if (v1 <= INFINITY) {
    return v2;
  }
  return result;
}

BOOL TSDTransformsDifferOnlyByTranslation(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

CGPath *TSDCreatePathFromTransformedRect(const CGAffineTransform *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  Mutable = CGPathCreateMutable();
  v12.origin.CGFloat x = a2;
  v12.origin.CGFloat y = a3;
  v12.size.CGFloat width = a4;
  v12.size.CGFloat height = a5;
  CGPathAddRect(Mutable, a1, v12);
  return Mutable;
}

float64x2_t TSDTransformedCornersOfRect(float64x2_t *a1, double *a2, double *a3, double *a4, double *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  CGFloat MinX = CGRectGetMinX(*(CGRect *)&a6);
  v23.origin.CGFloat x = a6;
  v23.origin.CGFloat y = a7;
  v23.size.CGFloat width = a8;
  v23.size.CGFloat height = a9;
  CGFloat MinY = CGRectGetMinY(v23);
  v24.origin.CGFloat x = a6;
  v24.origin.CGFloat y = a7;
  v24.size.CGFloat width = a8;
  v24.size.CGFloat height = a9;
  CGFloat MaxX = CGRectGetMaxX(v24);
  v25.origin.CGFloat x = a6;
  v25.origin.CGFloat y = a7;
  v25.size.CGFloat width = a8;
  v25.size.CGFloat height = a9;
  CGFloat MaxY = CGRectGetMaxY(v25);
  *a2 = MinX;
  a2[1] = MinY;
  *a3 = MinX;
  a3[1] = MaxY;
  *a4 = MaxX;
  a4[1] = MaxY;
  *a5 = MaxX;
  a5[1] = MinY;
  *(float64x2_t *)a2 = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a2[1]), *a1, *a2));
  *(float64x2_t *)a3 = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a3[1]), *a1, *a3));
  *(float64x2_t *)a4 = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a4[1]), *a1, *a4));
  float64x2_t result = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a5[1]), *a1, *a5));
  *(float64x2_t *)a5 = result;
  return result;
}

CGAffineTransform *TSDAffineTransformShear@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>)
{
  t1.a = 1.0;
  t1.b = a3;
  t1.c = a4;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&t1.d = _Q0;
  t1.tCGFloat y = 1.0;
  long long v9 = a1[1];
  *(_OWORD *)&v11.a = *a1;
  *(_OWORD *)&v11.c = v9;
  *(_OWORD *)&v11.tCGFloat x = a1[2];
  return CGAffineTransformConcat(a2, &t1, &v11);
}

long double TSDTransformAngle(double *a1)
{
  double v2 = *a1;
  double v1 = a1[1];
  if (v1 * a1[2] - *a1 * a1[3] > 0.0)
  {
    double v2 = -v2;
    double v1 = -v1;
  }
  return atan2(v1, v2) * 57.2957795;
}

BOOL TSDIsTransformFlipped(double *a1)
{
  return a1[2] * a1[1] - *a1 * a1[3] > 0.0;
}

double TSDTransformScale(double *a1)
{
  return sqrt(a1[1] * a1[1] + *a1 * *a1);
}

double TSDTransformIsValid(double *a1)
{
  double v1 = fabs(*a1 * a1[3] - a1[1] * a1[2]);
  double result = 0.0;
  if (v1 >= 0.001 && v1 != INFINITY && fabs(a1[4]) != INFINITY)
  {
    double v3 = fabs(a1[5]);
    BOOL v4 = v3 < INFINITY;
    BOOL v5 = v3 <= INFINITY;
    double result = 0.0;
    if (v4) {
      double result = 1.0;
    }
    if (!v5) {
      return 1.0;
    }
  }
  return result;
}

double TSDTransformXYScale(double *a1)
{
  return sqrt(a1[1] * a1[1] + *a1 * *a1);
}

CGAffineTransform *TSDTransformNormalizeScale@<X0>(uint64_t a1@<X0>, CGAffineTransform *a2@<X8>)
{
  CGFloat v2 = 1.0 / sqrt(*(double *)(a1 + 8) * *(double *)(a1 + 8) + *(double *)a1 * *(double *)a1);
  CGFloat v3 = 1.0 / sqrt(*(double *)(a1 + 24) * *(double *)(a1 + 24) + *(double *)(a1 + 16) * *(double *)(a1 + 16));
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v6.a = *(_OWORD *)a1;
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&v6.tCGFloat x = *(_OWORD *)(a1 + 32);
  return CGAffineTransformScale(a2, &v6, v2, v3);
}

BOOL TSDIsTransformAxisAlignedWithObjectSize(double *a1, double a2, double a3)
{
  double v3 = 1.0 / (a2 * 0.5);
  double v4 = 1.0 / (a3 * 0.5);
  if (v3 >= v4) {
    double v3 = v4;
  }
  double v5 = fabs(a1[3]);
  if (fabs(*a1) < v3 && v5 < v3) {
    return 1;
  }
  if (fabs(a1[1]) >= v3) {
    return 0;
  }
  return fabs(a1[2]) < v3;
}

BOOL TSDIsTransformAxisAlignedWithThreshold(double *a1, double a2)
{
  if (fabs(*a1) < a2 && fabs(a1[3]) < a2) {
    return 1;
  }
  if (fabs(a1[1]) >= a2) {
    return 0;
  }
  return fabs(a1[2]) < a2;
}

BOOL TSDIsTransformAxisAligned(double *a1)
{
  if (fabs(*a1) < 1.0e-12 && fabs(a1[3]) < 1.0e-12) {
    return 1;
  }
  if (fabs(a1[1]) >= 1.0e-12) {
    return 0;
  }
  return fabs(a1[2]) < 1.0e-12;
}

BOOL TSDIsTransformAxisAlignedUnflipped(double *a1)
{
  return fabs(a1[1]) < 1.0e-12 && fabs(a1[2]) < 1.0e-12 && *a1 >= 0.0 && a1[3] >= 0.0;
}

CGAffineTransform *TSDAffineTransformForFlips@<X0>(CGAffineTransform *result@<X0>, int a2@<W1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  uint64_t v13 = MEMORY[0x263F000D0];
  long long v14 = *MEMORY[0x263F000D0];
  long long v15 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)a3 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a3 + 16) = v15;
  long long v16 = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a3 + 32) = v16;
  if (result)
  {
    long long v31 = v15;
    long long v32 = v14;
    CGFloat v17 = a4;
    CGFloat v18 = a5;
    long long v30 = v16;
    CGFloat v19 = a6;
    double MinX = CGRectGetMinX(*(CGRect *)(&a7 - 3));
    v35.origin.CGFloat x = a4;
    v35.origin.CGFloat y = a5;
    v35.size.CGFloat width = a6;
    v35.size.CGFloat height = a7;
    CGFloat MaxX = CGRectGetMaxX(v35);
    *(_OWORD *)&v34.a = v32;
    *(_OWORD *)&v34.c = v31;
    *(_OWORD *)&v34.tCGFloat x = v30;
    CGAffineTransformTranslate((CGAffineTransform *)a3, &v34, MinX + MaxX, 0.0);
    long long v22 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v33.a = *(_OWORD *)a3;
    *(_OWORD *)&v33.c = v22;
    *(_OWORD *)&v33.tCGFloat x = *(_OWORD *)(a3 + 32);
    double result = CGAffineTransformScale(&v34, &v33, -1.0, 1.0);
    long long v23 = *(_OWORD *)&v34.c;
    *(_OWORD *)a3 = *(_OWORD *)&v34.a;
    *(_OWORD *)(a3 + 16) = v23;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v34.tx;
  }
  if (a2)
  {
    v36.origin.CGFloat x = a4;
    v36.origin.CGFloat y = a5;
    v36.size.CGFloat width = a6;
    v36.size.CGFloat height = a7;
    double MinY = CGRectGetMinY(v36);
    v37.origin.CGFloat x = a4;
    v37.origin.CGFloat y = a5;
    v37.size.CGFloat width = a6;
    v37.size.CGFloat height = a7;
    CGFloat MaxY = CGRectGetMaxY(v37);
    long long v26 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v33.a = *(_OWORD *)a3;
    *(_OWORD *)&v33.c = v26;
    *(_OWORD *)&v33.tCGFloat x = *(_OWORD *)(a3 + 32);
    CGAffineTransformTranslate(&v34, &v33, 0.0, MinY + MaxY);
    long long v27 = *(_OWORD *)&v34.c;
    *(_OWORD *)a3 = *(_OWORD *)&v34.a;
    *(_OWORD *)(a3 + 16) = v27;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v34.tx;
    long long v28 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v33.a = *(_OWORD *)a3;
    *(_OWORD *)&v33.c = v28;
    *(_OWORD *)&v33.tCGFloat x = *(_OWORD *)(a3 + 32);
    double result = CGAffineTransformScale(&v34, &v33, 1.0, -1.0);
    long long v29 = *(_OWORD *)&v34.c;
    *(_OWORD *)a3 = *(_OWORD *)&v34.a;
    *(_OWORD *)(a3 + 16) = v29;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v34.tx;
  }
  return result;
}

CGAffineTransform *TSDTransformFromTransformSpace@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  long long v6 = a2[1];
  *(_OWORD *)&v10.a = *a2;
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tCGFloat x = a2[2];
  CGAffineTransformInvert(&t1, &v10);
  long long v7 = a1[1];
  *(_OWORD *)&v10.a = *a1;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tCGFloat x = a1[2];
  CGAffineTransformConcat(&v12, &t1, &v10);
  long long v8 = a2[1];
  *(_OWORD *)&v10.a = *a2;
  *(_OWORD *)&v10.c = v8;
  *(_OWORD *)&v10.tCGFloat x = a2[2];
  return CGAffineTransformConcat(a3, &v12, &v10);
}

CGAffineTransform *TSDTransformInTransformSpace@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  long long v5 = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tCGFloat x = a2[2];
  long long v6 = a1[1];
  *(_OWORD *)&t2.a = *a1;
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tCGFloat x = a1[2];
  CGAffineTransformConcat(&v12, &t1, &t2);
  long long v7 = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = v7;
  *(_OWORD *)&t1.tCGFloat x = a2[2];
  CGAffineTransformInvert(&v9, &t1);
  return CGAffineTransformConcat(a3, &v12, &v9);
}

CGAffineTransform *TSDTransformConvertForNewOrigin@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>)
{
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeTranslation(&v14, -a3, -a4);
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeTranslation(&v13, a3, a4);
  CGAffineTransform t1 = v13;
  long long v8 = a1[1];
  *(_OWORD *)&v10.a = *a1;
  *(_OWORD *)&v10.c = v8;
  *(_OWORD *)&v10.tCGFloat x = a1[2];
  CGAffineTransformConcat(&v12, &t1, &v10);
  CGAffineTransform t1 = v14;
  return CGAffineTransformConcat(a2, &v12, &t1);
}

CGAffineTransform *TSDTransformMakeFree@<X0>(int a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, CGFloat a7@<D4>, double a8@<D5>, double a9@<D6>, double a10@<D7>)
{
  double v18 = TSDDistance(a3, a4, a5, a6);
  CGFloat v38 = a7;
  double v19 = TSDDistance(a7, a8, a9, a10);
  if (v18 < 0.0001 || v19 < 0.0001)
  {
    return CGAffineTransformMakeTranslation((CGAffineTransform *)a2, a7 - a3, a8 - a4);
  }
  else
  {
    sCGFloat x = v19 / v18;
    double v20 = TSDSubtractPoints(a3, a4, a5);
    double v22 = TSDAngleFromDelta(v20, v21);
    double v23 = TSDSubtractPoints(a7, a8, a9);
    double v25 = TSDAngleFromDelta(v23, v24);
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    CGAffineTransformMakeTranslation((CGAffineTransform *)a2, -a3, -a4);
    CGAffineTransformMakeRotation(&t2, -v22);
    long long v26 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v26;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&v44, &t1, &t2);
    long long v27 = *(_OWORD *)&v44.c;
    *(_OWORD *)a2 = *(_OWORD *)&v44.a;
    *(_OWORD *)(a2 + 16) = v27;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
    double v28 = 1.0;
    if (!a1) {
      double v28 = sx;
    }
    CGAffineTransformMakeScale(&v41, sx, v28);
    long long v29 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v29;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&v44, &t1, &v41);
    long long v30 = *(_OWORD *)&v44.c;
    *(_OWORD *)a2 = *(_OWORD *)&v44.a;
    *(_OWORD *)(a2 + 16) = v30;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
    CGAffineTransformMakeRotation(&v40, v25);
    long long v31 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v31;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&v44, &t1, &v40);
    long long v32 = *(_OWORD *)&v44.c;
    *(_OWORD *)a2 = *(_OWORD *)&v44.a;
    *(_OWORD *)(a2 + 16) = v32;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
    CGAffineTransformMakeTranslation(&v39, v38, a8);
    long long v33 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v33;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a2 + 32);
    double result = CGAffineTransformConcat(&v44, &t1, &v39);
    long long v35 = *(_OWORD *)&v44.c;
    *(_OWORD *)a2 = *(_OWORD *)&v44.a;
    *(_OWORD *)(a2 + 16) = v35;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
  }
  return result;
}

CGFloat TSDTransformMakeAxisAligned@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>, double a10, double a11, double a12)
{
  double v19 = TSDDistance(a2, a3, a4, a5);
  double v20 = TSDDistance(a6, a7, a8, a9);
  if (v19 < 0.0001 || v20 < 0.0001)
  {
    CGAffineTransformMakeTranslation((CGAffineTransform *)a1, a6 - a2, a7 - a3);
  }
  else
  {
    double v21 = v20 / v19;
    if (v21 >= a10)
    {
      if (v21 > a11) {
        double v21 = a11 + (v21 - a11) * a12;
      }
    }
    else
    {
      double v21 = (v21 - a10) * a12 * 0.5 + a10;
    }
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    CGAffineTransformMakeTranslation((CGAffineTransform *)a1, (a2 + a4) * -0.5, (a3 + a5) * -0.5);
    CGAffineTransformMakeScale(&t2, v21, v21);
    long long v23 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a1;
    *(_OWORD *)&t1.c = v23;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a1 + 32);
    CGAffineTransformConcat(&v32, &t1, &t2);
    long long v24 = *(_OWORD *)&v32.c;
    *(_OWORD *)a1 = *(_OWORD *)&v32.a;
    *(_OWORD *)(a1 + 16) = v24;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)&v32.tx;
    CGAffineTransformMakeTranslation(&v29, (a6 + a8) * 0.5, (a7 + a9) * 0.5);
    long long v25 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a1;
    *(_OWORD *)&t1.c = v25;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a1 + 32);
    CGAffineTransformConcat(&v32, &t1, &v29);
    long long v26 = *(_OWORD *)&v32.c;
    *(_OWORD *)a1 = *(_OWORD *)&v32.a;
    *(_OWORD *)(a1 + 16) = v26;
    CGFloat result = v32.tx;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)&v32.tx;
  }
  return result;
}

CGFloat TSDTransformConvertingRectToRect@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D2>, double a4@<D3>, double a5@<D4>, double a6@<D5>, double a7@<D6>, double a8@<D7>)
{
  return TSDTransformConvertingRectToRectAtPercent(a1, a2, a3, a4, a5, a6, a7, a8, 1.0);
}

CGFloat TSDTransformConvertingRectToRectAtPercent@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D2>, double a4@<D3>, double a5@<D4>, double a6@<D5>, double a7@<D6>, double a8@<D7>, double a9)
{
  double v14 = TSDSubtractPoints(a5, a6, a2);
  double v15 = a7 / a3;
  double v16 = a8 / a4;
  double v18 = TSDMultiplyPointScalar(v14, v17, a9);
  CGFloat v20 = v19;
  double v21 = TSDMixSizes(1.0, 1.0, v15, v16, a9);
  CGFloat v23 = v22;
  uint64_t v24 = MEMORY[0x263F000D0];
  long long v25 = *MEMORY[0x263F000D0];
  long long v26 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)a1 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a1 + 16) = v26;
  long long v27 = *(_OWORD *)(v24 + 32);
  *(_OWORD *)(a1 + 32) = v27;
  *(_OWORD *)&v32.a = v25;
  *(_OWORD *)&v32.c = v26;
  *(_OWORD *)&v32.tCGFloat x = v27;
  CGAffineTransformTranslate((CGAffineTransform *)a1, &v32, v18, v20);
  long long v28 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v31.a = *(_OWORD *)a1;
  *(_OWORD *)&v31.c = v28;
  *(_OWORD *)&v31.tCGFloat x = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v32, &v31, v21, v23);
  long long v29 = *(_OWORD *)&v32.c;
  *(_OWORD *)a1 = *(_OWORD *)&v32.a;
  *(_OWORD *)(a1 + 16) = v29;
  CGFloat result = v32.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v32.tx;
  return result;
}

double TSD_CGAffineTransformDecompose(uint64_t a1, uint64_t a2)
{
  double v4 = *(double *)(a1 + 8);
  double v5 = *(double *)(a1 + 16);
  double v6 = *(double *)(a1 + 24);
  double v7 = sqrt(v4 * v4 + *(double *)a1 * *(double *)a1);
  double v8 = sqrt(v6 * v6 + v5 * v5);
  double v9 = *(double *)a1 * v6 - v5 * v4;
  double v10 = -v8;
  double v11 = -v7;
  if (*(double *)a1 < v6) {
    double v10 = v8;
  }
  else {
    double v11 = v7;
  }
  if (v9 < 0.0) {
    double v12 = v11;
  }
  else {
    double v12 = v7;
  }
  if (v9 < 0.0) {
    double v13 = v10;
  }
  else {
    double v13 = v8;
  }
  long long v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v20.a = *(_OWORD *)a1;
  *(_OWORD *)&v20.c = v14;
  *(_OWORD *)&v20.tCGFloat x = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v21, &v20, 1.0 / v12, 1.0 / v13);
  long long v15 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v15;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  double v16 = atan2(*(long double *)(a1 + 8), *(long double *)a1);
  long long v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v20.a = *(_OWORD *)a1;
  *(_OWORD *)&v20.c = v17;
  *(_OWORD *)&v20.tCGFloat x = *(_OWORD *)(a1 + 32);
  CGAffineTransformRotate(&v21, &v20, -v16);
  long long v18 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v18;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  *(double *)a2 = v12;
  *(double *)(a2 + 8) = v13;
  *(double *)(a2 + 16) = v16;
  *(void *)(a2 + 24) = *(void *)a1;
  *(void *)(a2 + 32) = *(void *)(a1 + 8);
  *(void *)(a2 + 40) = *(void *)(a1 + 16);
  *(void *)(a2 + 48) = *(void *)(a1 + 24);
  *(void *)(a2 + 56) = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 64) = result;
  return result;
}

CGFloat TSD_CGAffineTransformCompose@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v4 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 16) = v4;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 56);
  CGFloat v5 = *(double *)(a1 + 16);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v13.a = *(_OWORD *)a2;
  *(_OWORD *)&v13.c = v6;
  *(_OWORD *)&v13.tCGFloat x = *(_OWORD *)(a2 + 32);
  CGAffineTransformRotate((CGAffineTransform *)a2, &v13, v5);
  CGFloat v7 = *(double *)a1;
  CGFloat v8 = *(double *)(a1 + 8);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v12.a = *(_OWORD *)a2;
  *(_OWORD *)&v12.c = v9;
  *(_OWORD *)&v12.tCGFloat x = *(_OWORD *)(a2 + 32);
  CGAffineTransformScale(&v13, &v12, v7, v8);
  long long v10 = *(_OWORD *)&v13.c;
  *(_OWORD *)a2 = *(_OWORD *)&v13.a;
  *(_OWORD *)(a2 + 16) = v10;
  CGFloat result = v13.tx;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v13.tx;
  return result;
}

double TSDTransformDecompose(_OWORD *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  v16[9] = *MEMORY[0x263EF8340];
  long long v11 = a1[1];
  v15[0] = *a1;
  v15[1] = v11;
  v15[2] = a1[2];
  TSD_CGAffineTransformDecompose((uint64_t)v15, (uint64_t)v16);
  uint64_t v12 = v16[2];
  *a2 = v16[7];
  *a3 = v16[8];
  *a4 = v12;
  double result = *(double *)v16;
  uint64_t v14 = v16[1];
  *a5 = v16[0];
  *a6 = v14;
  return result;
}

uint64_t TSDTransform3DDecompose(_OWORD *a1, CGFloat *a2, CGFloat *a3, CGFloat *a4, CGFloat *a5, CGFloat *a6)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v12 = a1[5];
  *(_OWORD *)&v26.m31 = a1[4];
  *(_OWORD *)&v26.m33 = v12;
  long long v13 = a1[7];
  *(_OWORD *)&v26.m41 = a1[6];
  *(_OWORD *)&v26.m43 = v13;
  long long v14 = a1[1];
  *(_OWORD *)&v26.m11 = *a1;
  *(_OWORD *)&v26.CGFloat m13 = v14;
  long long v15 = a1[3];
  *(_OWORD *)&v26.m21 = a1[2];
  *(_OWORD *)&v26.m23 = v15;
  uint64_t v16 = MEMORY[0x210547120](&v26);
  if (v16)
  {
    memset(&v24, 0, sizeof(v24));
    long long v17 = a1[5];
    *(_OWORD *)&v26.m31 = a1[4];
    *(_OWORD *)&v26.m33 = v17;
    long long v18 = a1[7];
    *(_OWORD *)&v26.m41 = a1[6];
    *(_OWORD *)&v26.m43 = v18;
    long long v19 = a1[1];
    *(_OWORD *)&v26.m11 = *a1;
    *(_OWORD *)&v26.CGFloat m13 = v19;
    long long v20 = a1[3];
    *(_OWORD *)&v26.m21 = a1[2];
    *(_OWORD *)&v26.m23 = v20;
    CATransform3DGetAffineTransform(&v24, &v26);
    CGAffineTransform v25 = v24;
    TSD_CGAffineTransformDecompose((uint64_t)&v25, (uint64_t)&v26);
    CGFloat m13 = v26.m13;
    *a2 = v26.m24;
    *a3 = v26.m31;
    *a4 = m13;
    CGFloat m12 = v26.m12;
    *a5 = v26.m11;
    *a6 = m12;
  }
  return v16;
}

void TSDTransformMixAffineTransforms(long long *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v7 = a1[1];
  long long v16 = *a1;
  v17[0] = v7;
  v17[1] = a1[2];
  TSD_CGAffineTransformDecompose((uint64_t)&v16, (uint64_t)&v18);
  long long v8 = a2[1];
  v15[0] = *a2;
  v15[1] = v8;
  v15[2] = a2[2];
  TSD_CGAffineTransformDecompose((uint64_t)v15, (uint64_t)&v16);
  if ((v18 >= 0.0 || *((double *)&v16 + 1) >= 0.0) && (v19 >= 0.0 || *(double *)&v16 >= 0.0))
  {
    double v9 = __x;
  }
  else
  {
    double v18 = -v18;
    double v19 = -v19;
    double v9 = __x + dbl_20C2B7E00[__x < 0.0];
  }
  double v10 = fmod(v9, 6.28318531);
  __CGFloat x = v10;
  double v11 = fmod(*(long double *)v17, 6.28318531);
  *(double *)long long v17 = v11;
  if (vabdd_f64(v10, v11) > 3.14159265)
  {
    BOOL v12 = v10 <= v11;
    if (v10 > v11) {
      double v11 = v10;
    }
    long long v13 = (double *)&v16;
    if (!v12) {
      long long v13 = &v18;
    }
    v13[2] = v11 + -6.28318531;
  }
  for (uint64_t i = 0; i != 72; i += 8)
    *(double *)((char *)&v18 + i) = *(double *)((char *)&v18 + i)
                                  + (*(double *)((char *)&v17[-1] + i) - *(double *)((char *)&v18 + i)) * a4;
  TSD_CGAffineTransformCompose((uint64_t)&v18, a3);
}

BOOL TSDTransform3DNearlyEqualToTransform(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[5];
  v12[4] = a1[4];
  v12[5] = v2;
  long long v3 = a1[7];
  v12[6] = a1[6];
  v12[7] = v3;
  long long v4 = a1[1];
  v12[0] = *a1;
  v12[1] = v4;
  long long v5 = a1[3];
  void v12[2] = a1[2];
  v12[3] = v5;
  long long v6 = a2[5];
  v11[4] = a2[4];
  v11[5] = v6;
  long long v7 = a2[7];
  v11[6] = a2[6];
  v11[7] = v7;
  long long v8 = a2[1];
  v11[0] = *a2;
  v11[1] = v8;
  long long v9 = a2[3];
  v11[2] = a2[2];
  v11[3] = v9;
  return TSDTransform3DNearlyEqualToTransformWithTolerance((double *)v12, (double *)v11, 0.01);
}

BOOL TSDTransform3DNearlyEqualToTransformWithTolerance(double *a1, double *a2, double a3)
{
  return vabdd_f64(*a1, *a2) < a3
      && vabdd_f64(a1[1], a2[1]) < a3
      && vabdd_f64(a1[2], a2[2]) < a3
      && vabdd_f64(a1[3], a2[3]) < a3
      && vabdd_f64(a1[4], a2[4]) < a3
      && vabdd_f64(a1[5], a2[5]) < a3
      && vabdd_f64(a1[6], a2[6]) < a3
      && vabdd_f64(a1[7], a2[7]) < a3
      && vabdd_f64(a1[8], a2[8]) < a3
      && vabdd_f64(a1[9], a2[9]) < a3
      && vabdd_f64(a1[10], a2[10]) < a3
      && vabdd_f64(a1[11], a2[11]) < a3
      && vabdd_f64(a1[12], a2[12]) < a3
      && vabdd_f64(a1[13], a2[13]) < a3
      && vabdd_f64(a1[14], a2[14]) < a3
      && vabdd_f64(a1[15], a2[15]) < a3;
}

uint64_t TSUDeviceCMYKColorSpace()
{
  if (TSUDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce != -1) {
    dispatch_once(&TSUDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce, &__block_literal_global_2);
  }
  return TSUDeviceCMYKColorSpace_sDeviceCMYKColorSpace;
}

CGColorSpaceRef __TSUDeviceCMYKColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceCMYK();
  TSUDeviceCMYKColorSpace_sDeviceCMYKColorSpace = (uint64_t)result;
  return result;
}

uint64_t TSUDeviceGrayColorSpace()
{
  if (TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce[0] != -1) {
    dispatch_once(TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_4);
  }
  return TSUDeviceGrayColorSpace_sDeviceGrayColorSpace;
}

CGColorSpaceRef __TSUDeviceGrayColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceGray();
  TSUDeviceGrayColorSpace_sDeviceGrayColorSpace = (uint64_t)result;
  return result;
}

CGColorRef TSUCGColorCreateDeviceRGB(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  if (TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
    dispatch_once(&TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_29);
  }
  return CGColorCreate((CGColorSpaceRef)TSUDeviceRGBColorSpace_sDeviceRGBColorSpace, components);
}

CGColorRef TSUCGColorCreateDeviceGray(CGFloat a1, CGFloat a2)
{
  components[2] = *(CGFloat *)MEMORY[0x263EF8340];
  components[0] = a1;
  components[1] = a2;
  if (TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce[0] != -1) {
    dispatch_once(TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_4);
  }
  return CGColorCreate((CGColorSpaceRef)TSUDeviceGrayColorSpace_sDeviceGrayColorSpace, components);
}

CGPatternRef TSUCGPatternCreateWithImageAndTransform(CGImage *a1, long long *a2)
{
  CGImageRetain(a1);
  CGFloat v4 = *MEMORY[0x263F00148];
  CGFloat v5 = *(double *)(MEMORY[0x263F00148] + 8);
  size_t Width = CGImageGetWidth(a1);
  size_t Height = CGImageGetHeight(a1);
  if (a2)
  {
    long long v8 = a2[1];
    long long v13 = *a2;
    long long v14 = v8;
    long long v9 = a2[2];
  }
  else
  {
    long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v13 = *MEMORY[0x263F000D0];
    long long v14 = v10;
    long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  }
  long long v15 = v9;
  v16.size.CGFloat height = (double)Height;
  v16.size.CGFloat width = (double)Width;
  *(_OWORD *)&v12.a = v13;
  *(_OWORD *)&v12.c = v14;
  *(_OWORD *)&v12.tCGFloat x = v9;
  v16.origin.CGFloat x = v4;
  v16.origin.CGFloat y = v5;
  return CGPatternCreate(a1, v16, &v12, (double)Width, v16.size.height, kCGPatternTilingConstantSpacing, 1, &TSUCGPatternCreateWithImageAndTransform_sCallbacks);
}

void TSUDrawImageAtOriginInContext(CGImage *a1, CGContext *a2)
{
  uint64_t v4 = *MEMORY[0x263F00148];
  uint64_t v5 = *(void *)(MEMORY[0x263F00148] + 8);
  double Width = (double)CGImageGetWidth(a1);
  double Height = (double)CGImageGetHeight(a1);
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  double v10 = Width;
  CGContextDrawImage(a2, *(CGRect *)&v8, a1);
}

CGColorRef TSUCGColorCreatePatternWithImageAndTransform(CGImage *a1, long long *a2)
{
  v6[1] = *(CGFloat *)MEMORY[0x263EF8340];
  long long v2 = TSUCGPatternCreateWithImageAndTransform(a1, a2);
  Pattern = CGColorSpaceCreatePattern(0);
  v6[0] = 1.0;
  CGColorRef v4 = CGColorCreateWithPattern(Pattern, v2, v6);
  CGColorSpaceRelease(Pattern);
  CGPatternRelease(v2);
  return v4;
}

CGColorRef TSUCGColorCreatePatternWithImage(CGImage *a1)
{
  return TSUCGColorCreatePatternWithImageAndTransform(a1, 0);
}

uint64_t TSUHSBFromCGColorRef(CGColor *a1, double *a2, double *a3, double *a4, CGFloat *a5)
{
  *a5 = 0.0;
  *a4 = 0.0;
  *a3 = 0.0;
  *a2 = 0.0;
  ColorSpace = CGColorGetColorSpace(a1);
  if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB || CGColorGetNumberOfComponents(a1) != 4) {
    return 0;
  }
  *a5 = CGColorGetAlpha(a1);
  Components = CGColorGetComponents(a1);
  TSURGBToHSB(a2, a3, a4, *Components, Components[1], Components[2]);
  return 1;
}

double TSURGBToHSB(double *a1, double *a2, double *a3, double a4, double a5, double a6)
{
  if (a4 < a5 || a4 < a6)
  {
    if (a5 >= a4) {
      double v7 = a4;
    }
    else {
      double v7 = a5;
    }
    if (a4 >= a6) {
      double v8 = a6;
    }
    else {
      double v8 = a4;
    }
    BOOL v9 = a5 < a4 || a5 < a6;
    if (v9) {
      double v10 = a6;
    }
    else {
      double v10 = a5;
    }
    if (v9) {
      double v11 = v7;
    }
    else {
      double v11 = v8;
    }
  }
  else
  {
    if (a5 >= a6) {
      double v11 = a6;
    }
    else {
      double v11 = a5;
    }
    double v10 = a4;
  }
  double v12 = 0.0;
  if (v10 <= 0.0)
  {
    double v14 = 0.0;
  }
  else
  {
    double v13 = v10 - v11;
    double v14 = (v10 - v11) / v10;
    if (v14 != 0.0)
    {
      double v15 = (v10 - a5) / v13;
      double v16 = (v10 - a6) / v13;
      if (v10 == a4)
      {
        if (v11 == a5) {
          double v12 = v16 + 5.0;
        }
        else {
          double v12 = 1.0 - v15;
        }
      }
      else
      {
        BOOL v18 = v10 == a5;
        double v19 = (v10 - a4) / v13;
        if (v18)
        {
          if (v11 == a6) {
            double v12 = v19 + 1.0;
          }
          else {
            double v12 = 3.0 - v16;
          }
        }
        else if (v11 == a4)
        {
          double v12 = v15 + 3.0;
        }
        else
        {
          double v12 = 5.0 - v19;
        }
      }
    }
  }
  *a3 = v10;
  double result = v12 / 6.0;
  *a1 = v12 / 6.0;
  *a2 = v14;
  return result;
}

double *TSUHSBToRGB(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  double v6 = a4 * 6.0;
  BOOL v7 = a4 == 1.0;
  double v8 = 0.0;
  if (!v7) {
    double v8 = v6;
  }
  uint64_t v9 = (uint64_t)v8;
  double v10 = v8 - (double)(uint64_t)v8;
  double v11 = (1.0 - a5) * a6;
  double v12 = (1.0 - a5 * v10) * a6;
  double v13 = (1.0 - a5 * (1.0 - v10)) * a6;
  double v14 = a6;
  double v15 = v13;
  switch(v9)
  {
    case 0:
      goto LABEL_10;
    case 1:
      double v14 = v12;
      double v15 = a6;
      goto LABEL_10;
    case 2:
      double v14 = v11;
      double v15 = a6;
      double v11 = v13;
      goto LABEL_10;
    case 3:
      double v14 = v11;
      double v15 = v12;
      goto LABEL_8;
    case 4:
      double v14 = v13;
      double v15 = v11;
LABEL_8:
      double v11 = a6;
      goto LABEL_10;
    case 5:
      double v14 = a6;
      double v15 = v11;
      double v11 = v12;
LABEL_10:
      *double result = v14;
      *a2 = v15;
      *a3 = v11;
      break;
    default:
      return result;
  }
  return result;
}

double TSUCMYKToRGB(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7)
{
  *a1 = 1.0 - fmin(a7 + a4 * (1.0 - a7), 1.0);
  *a2 = 1.0 - fmin(a7 + a5 * (1.0 - a7), 1.0);
  double result = 1.0 - fmin(a7 + a6 * (1.0 - a7), 1.0);
  *a3 = result;
  return result;
}

uint64_t TSUColorIsBlack(CGColor *a1)
{
  ColorSpace = CGColorGetColorSpace(a1);
  uint64_t Model = CGColorSpaceGetModel(ColorSpace);
  Components = CGColorGetComponents(a1);
  switch((int)Model)
  {
    case 0:
      double v6 = *Components;
      goto LABEL_8;
    case 1:
      if (*Components != 0.0 || Components[1] != 0.0) {
        goto LABEL_3;
      }
      double v6 = Components[2];
LABEL_8:
      BOOL v7 = v6 == 0.0;
LABEL_10:
      uint64_t result = v7;
      break;
    case 2:
      BOOL v7 = Components[3] == 1.0;
      goto LABEL_10;
    case 3:
    case 4:
    case 5:
      NSLog(&cfstr_Tsucolorisblac.isa, Model, a1);
      goto LABEL_3;
    default:
LABEL_3:
      uint64_t result = 0;
      break;
  }
  return result;
}

CGFloat TSUColorLightness(CGColor *a1)
{
  ColorSpace = CGColorGetColorSpace(a1);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  switch(Model)
  {
    case kCGColorSpaceModelMonochrome:
      return *CGColorGetComponents(a1);
    case kCGColorSpaceModelCMYK:
      Components = CGColorGetComponents(a1);
      double v8 = Components[3];
      double v9 = 1.0 - fmin(v8 + *Components * (1.0 - v8), 1.0);
      double v10 = 1.0 - fmin(v8 + Components[1] * (1.0 - v8), 1.0);
      double v11 = 1.0 - fmin(v8 + Components[2] * (1.0 - v8), 1.0);
      double v5 = fmax(fmax(v9, v10), v11) + fmin(fmin(v9, v10), v11);
      return v5 * 0.5;
    case kCGColorSpaceModelRGB:
      CGColorRef v4 = CGColorGetComponents(a1);
      double v5 = fmax(fmax(*v4, v4[1]), v4[2]) + fmin(fmin(*v4, v4[1]), v4[2]);
      return v5 * 0.5;
  }
  NSLog(&cfstr_WarningTesting.isa);
  return 0.0;
}

CGContext *TSUCreateRGBABitmapContext(int a1, double a2, CGFloat a3, CGFloat a4)
{
  if (TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
    dispatch_once(&TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_29);
  }
  double v8 = CGBitmapContextCreate(0, (unint64_t)(a2 * a4), (unint64_t)(a3 * a4), 8uLL, (4 * (unint64_t)(a2 * a4) + 31) & 0xFFFFFFFFFFFFFFE0, (CGColorSpaceRef)TSUDeviceRGBColorSpace_sDeviceRGBColorSpace, 0x2002u);
  CGAffineTransformMakeScale(&transform, a4, a4);
  CGContextConcatCTM(v8, &transform);
  if (a1)
  {
    CGContextTranslateCTM(v8, 0.0, a3);
    CGAffineTransformMakeScale(&v10, 1.0, -1.0);
    CGContextConcatCTM(v8, &v10);
  }
  return v8;
}

unint64_t TSUBitmapGetAlignedBytesPerRow(uint64_t a1)
{
  return (a1 + 31) & 0xFFFFFFFFFFFFFFE0;
}

CGColorRef TSUCreateCheckerBoardColor(CGColor *a1, CGColor *a2, CGFloat a3, CGFloat a4)
{
  double v8 = a3 + a3;
  double v9 = a4 + a4;
  CGAffineTransform v10 = TSUCreateRGBABitmapContext(0, a3 + a3, a4 + a4, 1.0);
  if (!v10) {
    return 0;
  }
  double v11 = v10;
  CGContextSetFillColorWithColor(v10, a1);
  v15.origin.CGFloat x = 0.0;
  v15.origin.CGFloat y = 0.0;
  v15.size.CGFloat width = v8;
  v15.size.CGFloat height = v9;
  CGContextFillRect(v11, v15);
  CGContextSetFillColorWithColor(v11, a2);
  v16.origin.CGFloat x = 0.0;
  v16.origin.CGFloat y = 0.0;
  v16.size.CGFloat width = a3;
  v16.size.CGFloat height = a4;
  CGContextFillRect(v11, v16);
  v17.origin.CGFloat x = a3;
  v17.origin.CGFloat y = a4;
  v17.size.CGFloat width = a3;
  v17.size.CGFloat height = a4;
  CGContextFillRect(v11, v17);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  if (!Image) {
    return 0;
  }
  CGColorRef PatternWithImageAndTransform = TSUCGColorCreatePatternWithImageAndTransform(Image, 0);
  CGImageRelease(Image);
  return PatternWithImageAndTransform;
}

double TSURound(double a1)
{
  return round(a1);
}

double TSUFractionalPart(double a1)
{
  BOOL v1 = a1 <= 0.0;
  double v2 = -(-a1 - floor(-a1));
  double result = a1 - floor(a1);
  if (v1) {
    return v2;
  }
  return result;
}

double TSUClamp(double a1, double a2, double a3)
{
  if (a1 >= a2)
  {
    a2 = a1;
    if (a1 > a3) {
      return a3;
    }
  }
  return a2;
}

uint64_t TSUClampInt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >= a3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = a1;
  }
  if (a1 >= a2) {
    return v3;
  }
  else {
    return a2;
  }
}

uint64_t TSUClampRange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a1 + a2;
  if (a1 >= a3 + a4) {
    unint64_t v5 = a3 + a4;
  }
  else {
    unint64_t v5 = a1;
  }
  if (a1 < a3) {
    unint64_t v5 = a3;
  }
  if (v4 >= a3 + a4) {
    unint64_t v6 = a3 + a4;
  }
  else {
    unint64_t v6 = a1 + a2;
  }
  if (v4 >= a3) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = a3;
  }
  if (v5 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v5;
  }
  if (a1 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v8 = a3 + a4;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v8;
  }
}

BOOL TSURangeEnclosesRange(NSRange range2, NSRange range1)
{
  if (range2.location == 0x7FFFFFFFFFFFFFFFLL || range1.location == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  NSUInteger length = range1.length;
  range1.NSUInteger length = range2.length;
  NSUInteger location = range2.location;
  if (length)
  {
    v7.NSUInteger location = range1.location;
    v7.NSUInteger length = length;
    range1.NSUInteger location = location;
    return NSIntersectionRange(v7, range1).length == length;
  }
  else
  {
    BOOL v6 = range1.location <= range2.location + range2.length;
    if (range1.location < range2.location) {
      BOOL v6 = 0;
    }
    if (range2.length) {
      return v6;
    }
    else {
      return range2.location == range1.location;
    }
  }
}

double TSUMix(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double TSUReverseSquare(double a1)
{
  return 1.0 - (1.0 - a1) * (1.0 - a1);
}

long double TSUSineMap(double a1)
{
  return (sin(a1 * 3.14159265 + -1.57079633) + 1.0) * 0.5;
}

id Date.isToday.getter()
{
  id v0 = (void *)sub_20C2B2630();
  id v1 = objc_msgSend(v0, sel_ic_isToday);

  return v1;
}

id Date.isYesterday.getter()
{
  id v0 = (void *)sub_20C2B2630();
  id v1 = objc_msgSend(v0, sel_ic_isYesterday);

  return v1;
}

void Date.shortFormattedDate.getter()
{
}

void Date.shortFormattedDateForAccessibility.getter()
{
}

void Date.briefFormattedDate.getter()
{
}

void Date.briefFormattedDateForAccessibility.getter()
{
}

void Date.localDateWithSeconds.getter()
{
}

void sub_20C2A15A8(SEL *a1)
{
  double v2 = (void *)sub_20C2B2630();
  id v3 = [v2 *a1];

  if (v3)
  {
    sub_20C2B2840();
  }
  else
  {
    __break(1u);
  }
}

uint64_t Date.truncated.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20C2A1638((SEL *)&selRef_ic_truncated, a1);
}

uint64_t Date.startOfDay.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20C2A1638((SEL *)&selRef_ic_startOfDay, a1);
}

uint64_t Date.endOfDay.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20C2A1638((SEL *)&selRef_ic_endOfDay, a1);
}

uint64_t sub_20C2A1638@<X0>(SEL *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (void *)sub_20C2B2630();
  id v5 = [v4 *a1];

  __swift_instantiateConcreteTypeFromMangledName(&qword_26AA91598);
  MEMORY[0x270FA5388]();
  NSRange v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v5)
  {
    uint64_t v8 = sub_20C2B2650();
    uint64_t v9 = *(void *)(v8 - 8);
    MEMORY[0x270FA5388]();
    double v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_20C2B2640();

    double v12 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v12(v7, v11, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
    if (result != 1) {
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v12)(a2, v7, v8);
    }
  }
  else
  {
    uint64_t v14 = sub_20C2B2650();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v7, 1, 1, v14);
  }
  __break(1u);
  return result;
}

id Date.isEarlier(than:)(uint64_t a1)
{
  return sub_20C2A1858(a1, (SEL *)&selRef_ic_isEarlierThanDate_);
}

id Date.isLater(than:)(uint64_t a1)
{
  return sub_20C2A1858(a1, (SEL *)&selRef_ic_isLaterThanDate_);
}

id Date.isSameDay(as:)(uint64_t a1)
{
  return sub_20C2A1858(a1, (SEL *)&selRef_ic_isSameDayAsDate_);
}

id sub_20C2A1858(uint64_t a1, SEL *a2)
{
  id v3 = (void *)sub_20C2B2630();
  uint64_t v4 = (void *)sub_20C2B2630();
  id v5 = objc_msgSend(v3, *a2, v4);

  return v5;
}

uint64_t Date.numberOfDays(from:)()
{
  id v0 = (void *)sub_20C2B2630();
  id v1 = (void *)sub_20C2B2630();
  unint64_t v2 = (unint64_t)objc_msgSend(v0, sel_ic_numberOfDaysFromDate_, v1);

  if ((v2 & 0x8000000000000000) == 0) {
    return v2;
  }
  uint64_t result = sub_20C2B2AE0();
  __break(1u);
  return result;
}

void Date.briefFormattedDateForSiri(forAccessibility:inLocale:)(char a1)
{
  unint64_t v2 = (void *)sub_20C2B2630();
  id v3 = (void *)sub_20C2B2690();
  id v4 = objc_msgSend(v2, sel_ic_briefFormattedDateForSiriLocale_forAccessibility_, v3, a1 & 1);

  if (v4)
  {
    sub_20C2B2840();
  }
  else
  {
    __break(1u);
  }
}

uint64_t Date.init(date:)@<X0>(char *a1@<X8>)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  id v3 = (void *)sub_20C2B2830();
  objc_msgSend(v2, sel_setDateFormat_, v3);

  id v4 = (void *)sub_20C2B2830();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_dateFromString_, v4);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26AA91598);
  MEMORY[0x270FA5388]();
  NSRange v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v5)
  {

    uint64_t v8 = sub_20C2B2650();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
    goto LABEL_5;
  }
  uint64_t v16 = (uint64_t)&v16;
  CGRect v17 = a1;
  uint64_t v8 = sub_20C2B2650();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  double v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C2B2640();

  double v12 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v12(v7, v11, v8);
  double v13 = *(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56);
  v13(v7, 0, 1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    a1 = v17;
LABEL_5:
    sub_20C2A1D08((uint64_t)v7);
    sub_20C2B2650();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(a1, 1, 1, v8);
  }
  uint64_t v15 = v17;
  v12(v17, v7, v8);
  return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v13)(v15, 0, 1, v8);
}

uint64_t sub_20C2A1D08(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AA91598);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_20C2A1D8C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_20C2A1DAC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
}

void sub_20C2A1DE8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t WeakRef.ref.getter()
{
  swift_beginAccess();
  return MEMORY[0x210548760](v0 + 16);
}

uint64_t WeakRef.ref.setter()
{
  return swift_unknownObjectRelease();
}

void (*WeakRef.ref.modify(void *a1))(void **a1, char a2)
{
  char v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_beginAccess();
  v3[3] = MEMORY[0x210548760](v1 + 16);
  return sub_20C2A1F44;
}

void sub_20C2A1F44(void **a1, char a2)
{
  char v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t WeakRef.__allocating_init(_:)()
{
  swift_allocObject();
  uint64_t v0 = sub_20C2A2320();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t WeakRef.init(_:)()
{
  uint64_t v0 = sub_20C2A2320();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t WeakRef.deinit()
{
  swift_unknownObjectWeakDestroy();
  return v0;
}

uint64_t WeakRef.__deallocating_deinit()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t static WeakRef<>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x210548760](v3);
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x210548760](a2 + 16);
  if (!v4)
  {
    if (!v5)
    {
      char v6 = 1;
      return v6 & 1;
    }
    goto LABEL_5;
  }
  if (!v5)
  {
LABEL_5:
    swift_unknownObjectRelease();
    char v6 = 0;
    return v6 & 1;
  }
  swift_unknownObjectRetain();
  char v6 = sub_20C2B2820();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v6 & 1;
}

uint64_t sub_20C2A2190(uint64_t *a1, uint64_t *a2)
{
  return static WeakRef<>.== infix(_:_:)(*a1, *a2);
}

uint64_t WeakRef<>.hash(into:)()
{
  swift_beginAccess();
  MEMORY[0x210548760](v0 + 16);
  sub_20C2B2A30();
  sub_20C2B2A40();
  return swift_unknownObjectRelease();
}

uint64_t WeakRef<>.hashValue.getter()
{
  return sub_20C2B2B60();
}

uint64_t sub_20C2A2288()
{
  return WeakRef<>.hashValue.getter();
}

uint64_t sub_20C2A22B0()
{
  return WeakRef<>.hash(into:)();
}

uint64_t sub_20C2A22D8()
{
  return sub_20C2B2B60();
}

uint64_t sub_20C2A2320()
{
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return v0;
}

uint64_t sub_20C2A2380()
{
  return swift_getWitnessTable();
}

uint64_t sub_20C2A23C8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x210548760](v3);
  *a2 = result;
  return result;
}

uint64_t sub_20C2A2418()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_20C2A2468()
{
  return 8;
}

void *sub_20C2A2474(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_20C2A2484()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for WeakRef()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for WeakRef(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WeakRef);
}

uint64_t dispatch thunk of WeakRef.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_20C2A250C()
{
  uint64_t v0 = sub_20C2B27B0();
  __swift_allocate_value_buffer(v0, qword_26AA91668);
  __swift_project_value_buffer(v0, (uint64_t)qword_26AA91668);
  return sub_20C2B27A0();
}

uint64_t GMSAvailability.available.getter()
{
  return *v0;
}

uint64_t GMSAvailability.available.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*GMSAvailability.available.modify())()
{
  return nullsub_1;
}

uint64_t GMSAvailability.availabilityInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for GMSAvailability() + 20);
  return sub_20C2A2654(v3, a1);
}

uint64_t type metadata accessor for GMSAvailability()
{
  uint64_t result = qword_26AA916A8;
  if (!qword_26AA916A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20C2A2654(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6450);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t GMSAvailability.availabilityInfo.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for GMSAvailability() + 20);
  return sub_20C2A2700(a1, v3);
}

uint64_t sub_20C2A2700(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6450);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*GMSAvailability.availabilityInfo.modify())()
{
  return nullsub_1;
}

id sub_20C2A27B0()
{
  id result = objc_msgSend(objc_allocWithZone((Class)ICModelAvailabilityManager), sel_init);
  qword_26AA91698 = (uint64_t)result;
  return result;
}

void __swiftcall ICModelAvailabilityManager.init()(ICModelAvailabilityManager *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

id static ICModelAvailabilityManager.shared.getter()
{
  if (qword_26AA91770 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = (void *)qword_26AA91698;
  return v0;
}

void static ICModelAvailabilityManager.shared.setter(uint64_t a1)
{
  if (qword_26AA91770 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = (void *)qword_26AA91698;
  qword_26AA91698 = a1;
}

uint64_t (*static ICModelAvailabilityManager.shared.modify())()
{
  if (qword_26AA91770 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t ICModelAvailabilityManager.generalASRAvailabilityWasGenerated.getter()
{
  id v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___ICModelAvailabilityManager_generalASRAvailabilityWasGenerated);
  swift_beginAccess();
  return *v1;
}

uint64_t ICModelAvailabilityManager.generalASRAvailabilityWasGenerated.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___ICModelAvailabilityManager_generalASRAvailabilityWasGenerated);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*ICModelAvailabilityManager.generalASRAvailabilityWasGenerated.modify())()
{
  return j__swift_endAccess;
}

uint64_t ICModelAvailabilityManager.supportsCallRecording.getter()
{
  return TUCallRecordingActivatable();
}

uint64_t ICModelAvailabilityManager.supportsCallTranscription.getter()
{
  return TUCallTranscriptionSupported();
}

uint64_t ICModelAvailabilityManager.supportsGreymatter.getter()
{
  sub_20C2B2A10();
  return v1;
}

uint64_t sub_20C2A2CD0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for GMSAvailability();
  uint64_t result = MEMORY[0x270FA5388](v4 - 8);
  NSRange v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = OBJC_IVAR___ICModelAvailabilityManager_cachedSupportsGreymatter;
  int v9 = *(unsigned __int8 *)(a1 + OBJC_IVAR___ICModelAvailabilityManager_cachedSupportsGreymatter);
  if (v9 == 2)
  {
    ICModelAvailabilityManager.gmsAvailability.getter(v7);
    char v10 = *v7;
    uint64_t result = sub_20C2A6610((uint64_t)v7);
    *(unsigned char *)(a1 + v8) = v10;
  }
  else
  {
    char v10 = v9 & 1;
  }
  *a2 = v10;
  return result;
}

uint64_t sub_20C2A2D8C@<X0>(unsigned char *a1@<X8>)
{
  return sub_20C2A2CD0(*(void *)(v1 + 16), a1);
}

uint64_t ICModelAvailabilityManager.gmsAvailability.getter@<X0>(unsigned char *a1@<X8>)
{
  CGRect v63 = a1;
  uint64_t v1 = sub_20C2B2730();
  uint64_t v62 = *(void *)(v1 - 8);
  uint64_t v2 = *(void *)(v62 + 64);
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v3 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = sub_20C2B2780();
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  NSRange v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_20C2B2750();
  uint64_t v9 = *(void *)(v8 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C2B2740();
  sub_20C2B2770();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_20C2B2760();
  uint64_t v12 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  double v13 = (char *)&v56 - v3;
  uint64_t v14 = v1;
  uint64_t v15 = v62;
  MEMORY[0x270FA5388](v12);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))((char *)&v56 - v3, (char *)&v56 - v3, v14);
  int v16 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))((char *)&v56 - v3, v14);
  if (MEMORY[0x263F40FA0] && v16 == *MEMORY[0x263F40FA0])
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))((char *)&v56 - v3, v14);
    uint64_t v17 = sub_20C2B2700();
    CGRect v61 = &v56;
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v19 = *(void *)(v18 + 64);
    MEMORY[0x270FA5388](v17);
    unint64_t v20 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v21 = (char *)&v56 - v20;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))((char *)&v56 - v20, (char *)&v56 - v3, v17);
    if (qword_26AA91680 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_20C2B27B0();
    uint64_t v23 = __swift_project_value_buffer(v22, (uint64_t)qword_26AA91668);
    CGRect v60 = &v56;
    MEMORY[0x270FA5388](v23);
    CGAffineTransform v24 = (char *)&v56 - v20;
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))((char *)&v56 - v20, (char *)&v56 - v20, v17);
    CGAffineTransform v25 = sub_20C2B2790();
    os_log_type_t v26 = sub_20C2B29D0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v58 = swift_slowAlloc();
      uint64_t v65 = v58;
      uint64_t v59 = v14;
      *(_DWORD *)uint64_t v27 = 136315138;
      CGRect v56 = v27 + 4;
      CGRect v57 = v27;
      uint64_t v28 = sub_20C2B26F0();
      uint64_t v64 = sub_20C2A5088(v28, v29, &v65);
      uint64_t v14 = v59;
      sub_20C2B2A60();
      swift_bridgeObjectRelease();
      long long v30 = *(void (**)(char *, uint64_t))(v18 + 8);
      v30(v24, v17);
      CGAffineTransform v31 = "gms restricted: %s";
LABEL_13:
      os_log_type_t v39 = v26;
      CGAffineTransform v40 = v57;
      _os_log_impl(&dword_20C263000, v25, v39, v31, v57, 0xCu);
      uint64_t v41 = v58;
      swift_arrayDestroy();
      MEMORY[0x2105486A0](v41, -1, -1);
      MEMORY[0x2105486A0](v40, -1, -1);

      v30(v21, v17);
LABEL_23:
      uint64_t v53 = type metadata accessor for GMSAvailability();
      CGRect v54 = v63;
      CGRect v55 = &v63[*(int *)(v53 + 20)];
      (*(void (**)(unsigned char *, char *, uint64_t))(v15 + 32))(v55, v13, v14);
      uint64_t result = (*(uint64_t (**)(unsigned char *, void, uint64_t, uint64_t))(v15 + 56))(v55, 0, 1, v14);
      *CGRect v54 = 0;
      return result;
    }
    goto LABEL_22;
  }
  if (MEMORY[0x263F40FB0] && v16 == *MEMORY[0x263F40FB0])
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))((char *)&v56 - v3, v14);
    uint64_t v17 = sub_20C2B2720();
    CGRect v61 = &v56;
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v32 = *(void *)(v18 + 64);
    MEMORY[0x270FA5388](v17);
    unint64_t v33 = (v32 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v21 = (char *)&v56 - v33;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))((char *)&v56 - v33, (char *)&v56 - v3, v17);
    if (qword_26AA91680 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_20C2B27B0();
    uint64_t v35 = __swift_project_value_buffer(v34, (uint64_t)qword_26AA91668);
    CGRect v60 = &v56;
    MEMORY[0x270FA5388](v35);
    CGAffineTransform v24 = (char *)&v56 - v33;
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))((char *)&v56 - v33, (char *)&v56 - v33, v17);
    CGAffineTransform v25 = sub_20C2B2790();
    os_log_type_t v26 = sub_20C2B29D0();
    if (os_log_type_enabled(v25, v26))
    {
      CGRect v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v58 = swift_slowAlloc();
      uint64_t v65 = v58;
      uint64_t v59 = v14;
      *(_DWORD *)CGRect v36 = 136315138;
      CGRect v56 = v36 + 4;
      CGRect v57 = v36;
      uint64_t v37 = sub_20C2B2710();
      uint64_t v64 = sub_20C2A5088(v37, v38, &v65);
      uint64_t v14 = v59;
      sub_20C2B2A60();
      swift_bridgeObjectRelease();
      long long v30 = *(void (**)(char *, uint64_t))(v18 + 8);
      v30(v24, v17);
      CGAffineTransform v31 = "gms not available: %s";
      goto LABEL_13;
    }
LABEL_22:

    CGRect v52 = *(void (**)(char *, uint64_t))(v18 + 8);
    v52(v24, v17);
    v52(v21, v17);
    goto LABEL_23;
  }
  if (MEMORY[0x263F41148] && v16 == *MEMORY[0x263F41148])
  {
    if (qword_26AA91680 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_20C2B27B0();
    __swift_project_value_buffer(v42, (uint64_t)qword_26AA91668);
    CGRect v43 = sub_20C2B2790();
    os_log_type_t v44 = sub_20C2B29D0();
    if (os_log_type_enabled(v43, v44))
    {
      CGRect v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)CGRect v45 = 0;
      _os_log_impl(&dword_20C263000, v43, v44, "gms available", v45, 2u);
      MEMORY[0x2105486A0](v45, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v15 + 8))(v13, v14);
    uint64_t v46 = type metadata accessor for GMSAvailability();
    CGRect v47 = v63;
    uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(&v63[*(int *)(v46 + 20)], 1, 1, v14);
    *CGRect v47 = 1;
  }
  else
  {
    uint64_t v49 = type metadata accessor for GMSAvailability();
    CGRect v50 = v63;
    CGRect v51 = &v63[*(int *)(v49 + 20)];
    (*(void (**)(unsigned char *, char *, uint64_t))(v15 + 32))(v51, v13, v14);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v15 + 56))(v51, 0, 1, v14);
    *CGRect v50 = 0;
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))((char *)&v56 - v3, v14);
  }
  return result;
}

uint64_t ICModelAvailabilityManager.supportsGeneralASR.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___ICModelAvailabilityManager__generalASRAvailable);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 20));
  sub_20C2A3838((unsigned char *)(v1 + 16), &v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 20));
  uint64_t v2 = v4;
  swift_release();
  return v2;
}

unsigned char *sub_20C2A3838@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t ICModelAvailabilityManager.determineASRAvailability()()
{
  *(void *)(v1 + 168) = v0;
  return MEMORY[0x270FA2498](sub_20C2A3864, 0, 0);
}

uint64_t sub_20C2A3864()
{
  uint64_t v19 = v0;
  if (ICInternalSettingsDisableGASRAvailabilityCheck())
  {
    uint64_t v1 = *(void *)(v0[21] + OBJC_IVAR___ICModelAvailabilityManager__generalASRAvailable);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 20));
    sub_20C2A6684((unsigned char *)(v1 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 20));
    swift_release();
    uint64_t v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
  else
  {
    uint64_t v2 = sub_20C2B26E0();
    v0[22] = v2;
    uint64_t v3 = *(void *)(v2 - 8);
    v0[23] = v3;
    uint64_t v4 = swift_task_alloc();
    v0[24] = v4;
    sub_20C2B26A0();
    if (qword_26AA91680 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_20C2B27B0();
    v0[25] = __swift_project_value_buffer(v5, (uint64_t)qword_26AA91668);
    uint64_t v6 = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v6, v4, v2);
    NSRange v7 = sub_20C2B2790();
    os_log_type_t v8 = sub_20C2B29D0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = v17;
      *(_DWORD *)uint64_t v9 = 136315138;
      uint64_t v10 = sub_20C2B2660();
      v0[19] = sub_20C2A5088(v10, v11, &v18);
      sub_20C2B2A60();
      swift_bridgeObjectRelease();
      uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
      v12(v6, v2);
      _os_log_impl(&dword_20C263000, v7, v8, "Current locale is %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2105486A0](v17, -1, -1);
      MEMORY[0x2105486A0](v9, -1, -1);
    }
    else
    {
      uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
      v12(v6, v2);
    }

    v0[26] = v12;
    swift_task_dealloc();
    double v13 = self;
    v0[2] = v0;
    v0[7] = v0 + 18;
    v0[3] = sub_20C2A3C64;
    uint64_t v14 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_20C2A4428;
    v0[13] = &block_descriptor;
    v0[14] = v14;
    objc_msgSend(v13, sel_supportedLanguagesForTaskHint_completion_, 1009, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
}

uint64_t sub_20C2A3C64()
{
  return MEMORY[0x270FA2498](sub_20C2A3D44, 0, 0);
}

uint64_t sub_20C2A3D44()
{
  uint64_t v49 = v0;
  uint64_t v1 = *(void **)(v0 + 144);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_20C2B2790();
  os_log_type_t v3 = sub_20C2B29D0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v48 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v6 = swift_bridgeObjectRetain();
    uint64_t v7 = MEMORY[0x210546E50](v6, MEMORY[0x263F8D310]);
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 160) = sub_20C2A5088(v7, v9, &v48);
    sub_20C2B2A60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_20C263000, v2, v3, "Supported languages are %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2105486A0](v5, -1, -1);
    MEMORY[0x2105486A0](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  id v10 = *(id *)(v0 + 168);
  unint64_t v11 = sub_20C2B2790();
  os_log_type_t v12 = sub_20C2B29D0();
  if (os_log_type_enabled(v11, v12))
  {
    double v13 = *(void **)(v0 + 168);
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 67109120;
    *(_DWORD *)(v0 + 216) = objc_msgSend(v13, sel_supportsCallTranscription);
    sub_20C2B2A60();

    _os_log_impl(&dword_20C263000, v11, v12, "Supports call transcription: %{BOOL}d", v14, 8u);
    MEMORY[0x2105486A0](v14, -1, -1);
    uint64_t v15 = *(NSObject **)(v0 + 168);
  }
  else
  {

    uint64_t v15 = *(NSObject **)(v0 + 168);
    unint64_t v11 = v15;
  }

  int v16 = v15;
  uint64_t v17 = sub_20C2B2790();
  os_log_type_t v18 = sub_20C2B29D0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = *(void **)(v0 + 168);
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 67109120;
    *(_DWORD *)(v0 + 220) = objc_msgSend(v19, sel_supportsCallRecording);
    sub_20C2B2A60();

    _os_log_impl(&dword_20C263000, v17, v18, "Supports call recording: %{BOOL}d", v20, 8u);
    MEMORY[0x2105486A0](v20, -1, -1);
  }
  else
  {

    uint64_t v17 = *(NSObject **)(v0 + 168);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_2676C5FF8);
  uint64_t v21 = swift_task_alloc();
  uint64_t v22 = sub_20C2B26C0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = swift_task_alloc();
  sub_20C2B26D0();
  sub_20C2B26B0();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v22);
  uint64_t v25 = sub_20C2B2680();
  uint64_t v26 = *(void *)(v25 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v21, 1, v25) == 1)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    sub_20C2A6468(v21, &qword_2676C5FF8);
    swift_task_dealloc();
LABEL_19:
    CGRect v43 = sub_20C2B2790();
    os_log_type_t v44 = sub_20C2B29D0();
    if (os_log_type_enabled(v43, v44))
    {
      CGRect v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)CGRect v45 = 0;
      _os_log_impl(&dword_20C263000, v43, v44, "gasr unsupported", v45, 2u);
      MEMORY[0x2105486A0](v45, -1, -1);
    }
    uint64_t v46 = *(void *)(v0 + 168);

    uint64_t v47 = *(void *)(v46 + OBJC_IVAR___ICModelAvailabilityManager__generalASRAvailable);
    uint64_t v35 = (os_unfair_lock_s *)(v47 + 20);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v47 + 20));
    sub_20C2A4560((unsigned char *)(v47 + 16));
    goto LABEL_16;
  }
  uint64_t v27 = sub_20C2B2670();
  uint64_t v29 = v28;
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v21, v25);
  swift_task_dealloc();
  swift_task_dealloc();
  LOBYTE(v27) = sub_20C2A448C(v27, v29, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v27 & 1) == 0) {
    goto LABEL_19;
  }
  long long v30 = sub_20C2B2790();
  os_log_type_t v31 = sub_20C2B29D0();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v32 = 0;
    _os_log_impl(&dword_20C263000, v30, v31, "gasr supported", v32, 2u);
    MEMORY[0x2105486A0](v32, -1, -1);
  }
  uint64_t v33 = *(void *)(v0 + 168);

  uint64_t v34 = *(void *)(v33 + OBJC_IVAR___ICModelAvailabilityManager__generalASRAvailable);
  uint64_t v35 = (os_unfair_lock_s *)(v34 + 20);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v34 + 20));
  sub_20C2A4554((unsigned char *)(v34 + 16));
LABEL_16:
  CGRect v36 = *(void (**)(uint64_t, uint64_t))(v0 + 208);
  uint64_t v37 = *(void *)(v0 + 192);
  uint64_t v39 = *(void *)(v0 + 168);
  uint64_t v38 = *(void *)(v0 + 176);
  os_unfair_lock_unlock(v35);
  swift_release();
  v36(v37, v38);
  CGAffineTransform v40 = (unsigned char *)(v39 + OBJC_IVAR___ICModelAvailabilityManager_generalASRAvailabilityWasGenerated);
  swift_beginAccess();
  *CGAffineTransform v40 = 1;
  swift_task_dealloc();
  uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
  return v41();
}

uint64_t sub_20C2A4428(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v1 + 64) + 40) = sub_20C2B28A0();
  return MEMORY[0x270FA2400](v1);
}

uint64_t sub_20C2A448C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_20C2B2B40();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  unint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_20C2B2B40() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

unsigned char *sub_20C2A4554(unsigned char *result)
{
  *uint64_t result = 1;
  return result;
}

unsigned char *sub_20C2A4560(unsigned char *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_20C2A46D0(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_20C2A4794;
  v5[21] = v4;
  return MEMORY[0x270FA2498](sub_20C2A3864, 0, 0);
}

uint64_t sub_20C2A4794()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  uint64_t v2 = *(void **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

id ICModelAvailabilityManager.init()()
{
  v0[OBJC_IVAR___ICModelAvailabilityManager_generalASRAvailabilityWasGenerated] = 0;
  v0[OBJC_IVAR___ICModelAvailabilityManager_cachedSupportsGreymatter] = 2;
  uint64_t v1 = OBJC_IVAR___ICModelAvailabilityManager_queue;
  sub_20C2A60B8(0, &qword_26AA91690);
  uint64_t v2 = sub_20C2B29F0();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = v0;
  sub_20C2B29E0();
  uint64_t v4 = sub_20C2B27D0();
  MEMORY[0x270FA5388](v4 - 8);
  sub_20C2B27C0();
  uint64_t v5 = sub_20C2B2A00();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, void))(v7 + 104))((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F128]);
  *(void *)&v0[v1] = sub_20C2B2A20();
  uint64_t v8 = OBJC_IVAR___ICModelAvailabilityManager__generalASRAvailable;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AA916A0);
  uint64_t v9 = swift_allocObject();
  *(_DWORD *)(v9 + 20) = 0;
  *(unsigned char *)(v9 + 16) = 0;
  *(void *)&v3[v8] = v9;

  v11.receiver = v3;
  v11.super_class = (Class)ICModelAvailabilityManager;
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t sub_20C2A4B70(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_20C2A66A0;
  return v6();
}

uint64_t sub_20C2A4C3C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_20C2A66A0;
  return v7();
}

uint64_t sub_20C2A4D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20C2B2960();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_20C2B2950();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_20C2A6468(a1, &qword_2676C6058);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20C2B2920();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_20C2A4EB4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_20C2A4F90;
  return v6(a1);
}

uint64_t sub_20C2A4F90()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_20C2A5088(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_20C2A515C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_20C2A65B4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_20C2A65B4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_20C2A515C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_20C2B2A70();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_20C2A5318(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_20C2B2AD0();
  if (!v8)
  {
    sub_20C2B2AE0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_20C2B2B00();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_20C2A5318(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_20C2A53B0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_20C2A5590(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_20C2A5590(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_20C2A53B0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_20C2A5528(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_20C2B2AA0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_20C2B2AE0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_20C2B2850();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_20C2B2B00();
    __break(1u);
LABEL_14:
    uint64_t result = sub_20C2B2AE0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_20C2A5528(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6068);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  void v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_20C2A5590(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6068);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  double v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_20C2B2B00();
  __break(1u);
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for GMSAvailability(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    uint64_t *v3 = *a2;
    unint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    unint64_t v6 = (char *)a1 + v5;
    int64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_20C2B2730();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6450);
      memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t destroy for GMSAvailability(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_20C2B2730();
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v2, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(v2, v3);
  }
  return result;
}

unsigned char *initializeWithCopy for GMSAvailability(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_20C2B2730();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6450);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

unsigned char *assignWithCopy for GMSAvailability(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_20C2B2730();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v5, 1, v7);
  int v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6450);
    memcpy(v5, v6, *(void *)(*(void *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

unsigned char *initializeWithTake for GMSAvailability(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_20C2B2730();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6450);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

unsigned char *assignWithTake for GMSAvailability(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_20C2B2730();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v5, 1, v7);
  int v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 40))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6450);
    memcpy(v5, v6, *(void *)(*(void *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v5, v6, v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for GMSAvailability(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20C2A5E44);
}

uint64_t sub_20C2A5E44(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *a1;
    BOOL v5 = v4 >= 2;
    int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5) {
      return (v6 + 1);
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6450);
    int v11 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    double v13 = &a1[*(int *)(a3 + 20)];
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for GMSAvailability(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20C2A5F0C);
}

unsigned char *sub_20C2A5F0C(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  BOOL v5 = result;
  if (a3 == 254)
  {
    *uint64_t result = a2 + 1;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6450);
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_20C2A5FB4()
{
  sub_20C2A604C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_20C2A604C()
{
  if (!qword_26AA916B8[0])
  {
    sub_20C2B2730();
    unint64_t v0 = sub_20C2B2A30();
    if (!v1) {
      atomic_store(v0, qword_26AA916B8);
    }
  }
}

uint64_t type metadata accessor for ICModelAvailabilityManager(uint64_t a1)
{
  return sub_20C2A60B8(a1, &qword_2676C6480);
}

uint64_t sub_20C2A60B8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_20C2A60F4()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20C2A6134()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *unsigned int v4 = v1;
  v4[1] = sub_20C2A66A0;
  BOOL v5 = (uint64_t (*)(const void *, void *))&aH0[*(int *)aH0];
  return v5(v2, v3);
}

uint64_t sub_20C2A61E4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  unsigned int v4 = (int *)v0[4];
  BOOL v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *BOOL v5 = v1;
  v5[1] = sub_20C2A66A0;
  int v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2676C6498 + dword_2676C6498);
  return v6(v2, v3, v4);
}

uint64_t sub_20C2A62A8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  int v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_20C2A6374;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2676C64A8 + dword_2676C64A8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_20C2A6374()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_20C2A6468(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_20C2A64C4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20C2A64FC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_20C2A6374;
  int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2676C64B8 + dword_2676C64B8);
  return v6(a1, v4);
}

uint64_t sub_20C2A65B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_20C2A6610(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GMSAvailability();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20C2A666C@<X0>(unsigned char *a1@<X8>)
{
  return sub_20C2A2D8C(a1);
}

unsigned char *sub_20C2A6684(unsigned char *a1)
{
  return sub_20C2A4554(a1);
}

uint64_t NSComparisonResult.init<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (sub_20C2B2800())
  {
    int v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8);
    v6(a2, a3);
    v6(a1, a3);
    return -1;
  }
  else
  {
    char v8 = sub_20C2B27F0();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8);
    v9(a2, a3);
    v9(a1, a3);
    return v8 & 1;
  }
}

uint64_t AsyncPriorityQueue.basePriority.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_basePriority;
  uint64_t v4 = sub_20C2B2960();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t AsyncPriorityQueue.__allocating_init(basePriority:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v2 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork) = MEMORY[0x263F8EE78];
  *(void *)(v2 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_workerTask) = 0;
  uint64_t v3 = v2 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_basePriority;
  uint64_t v4 = sub_20C2B2960();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t AsyncPriorityQueue.init(basePriority:)(uint64_t a1)
{
  swift_defaultActor_initialize();
  *(void *)(v1 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork) = MEMORY[0x263F8EE78];
  *(void *)(v1 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_workerTask) = 0;
  uint64_t v3 = v1 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_basePriority;
  uint64_t v4 = sub_20C2B2960();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v1;
}

uint64_t AsyncPriorityQueue.enqueue(priority:operation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  uint64_t v8 = v7 - 8;
  uint64_t v9 = *(void *)(v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v25 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6040);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  int v16 = &v14[*(int *)(v8 + 32)];
  uint64_t v17 = sub_20C2B2960();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v16, a1, v17);
  os_log_type_t v18 = &v14[*(int *)(v8 + 28)];
  *(void *)os_log_type_t v18 = a2;
  *((void *)v18 + 1) = a3;
  sub_20C2A6BCC((uint64_t)v14, (uint64_t)v12);
  uint64_t v19 = (unint64_t *)(v3 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork);
  swift_beginAccess();
  uint64_t v20 = *v19;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v19 = v20;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v20 = sub_20C2A8E8C(0, *(void *)(v20 + 16) + 1, 1, v20);
    *uint64_t v19 = v20;
  }
  unint64_t v23 = *(void *)(v20 + 16);
  unint64_t v22 = *(void *)(v20 + 24);
  if (v23 >= v22 >> 1)
  {
    uint64_t v20 = sub_20C2A8E8C(v22 > 1, v23 + 1, 1, v20);
    *uint64_t v19 = v20;
  }
  *(void *)(v20 + 16) = v23 + 1;
  sub_20C2A90F4((uint64_t)v12, v20+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v23);
  sub_20C2A7174(v19);
  swift_endAccess();
  sub_20C2A7220();
  return sub_20C2A9158((uint64_t)v14);
}

uint64_t type metadata accessor for AsyncPriorityQueue.WorkItem(uint64_t a1)
{
  return sub_20C2A91D4(a1, (uint64_t *)&unk_2676C6010);
}

uint64_t sub_20C2A6BCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t AsyncPriorityQueue.enqueueAndWait(priority:operation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  void v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_20C2A6C54, v3, 0);
}

uint64_t sub_20C2A6C54()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 16);
  sub_20C2AB970(&qword_2676C6020, (void (*)(uint64_t))type metadata accessor for AsyncPriorityQueue);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  long long v4 = *(_OWORD *)(v0 + 24);
  *(void *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v4;
  *(void *)(v3 + 40) = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_20C2A6D90;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_20C2A6D90()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 40);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20C2A6EBC, v1, 0);
}

uint64_t sub_20C2A6EBC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20C2A6ED0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  uint64_t v11 = v10 - 8;
  uint64_t v29 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  int v16 = (char *)&v28 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6040);
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v16, a1, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v16, 0, 1, v17);
  uint64_t v19 = &v16[*(int *)(v11 + 32)];
  uint64_t v20 = sub_20C2B2960();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v19, a5, v20);
  uint64_t v21 = &v16[*(int *)(v11 + 28)];
  *(void *)uint64_t v21 = a3;
  *((void *)v21 + 1) = a4;
  sub_20C2A6BCC((uint64_t)v16, (uint64_t)v14);
  unint64_t v22 = (unint64_t *)(a2 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork);
  swift_beginAccess();
  uint64_t v23 = *v22;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v22 = v23;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v23 = sub_20C2A8E8C(0, *(void *)(v23 + 16) + 1, 1, v23);
    *unint64_t v22 = v23;
  }
  unint64_t v26 = *(void *)(v23 + 16);
  unint64_t v25 = *(void *)(v23 + 24);
  if (v26 >= v25 >> 1)
  {
    uint64_t v23 = sub_20C2A8E8C(v25 > 1, v26 + 1, 1, v23);
    *unint64_t v22 = v23;
  }
  *(void *)(v23 + 16) = v26 + 1;
  sub_20C2A90F4((uint64_t)v14, v23+ ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80))+ *(void *)(v29 + 72) * v26);
  sub_20C2A7174(v22);
  swift_endAccess();
  sub_20C2A7220();
  return sub_20C2A9158((uint64_t)v16);
}

uint64_t sub_20C2A7174(unint64_t *a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for AsyncPriorityQueue.WorkItem(0) - 8);
  unint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v3 = sub_20C2AB61C(v3);
  }
  uint64_t v4 = *(void *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_20C2AA30C(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_20C2A7220()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6058);
  uint64_t result = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_workerTask;
  if (!*(void *)(v0 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_workerTask))
  {
    uint64_t v6 = v0 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork;
    uint64_t result = swift_beginAccess();
    if (*(void *)(*(void *)v6 + 16))
    {
      uint64_t v7 = v0 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_basePriority;
      uint64_t v8 = sub_20C2B2960();
      uint64_t v9 = *(void *)(v8 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v4, v7, v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v4, 0, 1, v8);
      uint64_t v10 = sub_20C2AB970(&qword_2676C6020, (void (*)(uint64_t))type metadata accessor for AsyncPriorityQueue);
      uint64_t v11 = (void *)swift_allocObject();
      v11[2] = v0;
      v11[3] = v10;
      v11[4] = v0;
      swift_retain_n();
      *(void *)(v0 + v5) = sub_20C2A877C((uint64_t)v4, (uint64_t)&unk_2676C64D8, (uint64_t)v11);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_20C2A7404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_20C2A7424, a4, 0);
}

uint64_t sub_20C2A7424()
{
  sub_20C2AB970(&qword_2676C6020, (void (*)(uint64_t))type metadata accessor for AsyncPriorityQueue);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  void *v1 = v0;
  v1[1] = sub_20C2A7520;
  return MEMORY[0x270FA2320]();
}

uint64_t sub_20C2A7520()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20C2A7630, v1, 0);
}

uint64_t sub_20C2A7630()
{
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_workerTask) = 0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_20C2A76A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[15] = a2;
  v3[16] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6048);
  v3[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6058);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  uint64_t v5 = sub_20C2B2960();
  v3[20] = v5;
  v3[21] = *(void *)(v5 - 8);
  v3[22] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  v3[23] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[24] = v7;
  v3[25] = *(void *)(v7 + 64);
  v3[26] = swift_task_alloc();
  v3[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_20C2A7848, a3, 0);
}

uint64_t sub_20C2A7848()
{
  uint64_t v1 = *(void *)(v0 + 128) + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork;
  uint64_t v2 = OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_basePriority;
  *(void *)(v0 + 224) = OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork;
  *(void *)(v0 + 232) = v2;
  swift_beginAccess();
  if (*(void *)(*(void *)v1 + 16) && (sub_20C2B2980() & 1) == 0)
  {
    uint64_t v5 = *(void *)(v0 + 128) + *(void *)(v0 + 224);
    swift_beginAccess();
    if (!*(void *)(*(void *)v5 + 16))
    {
      __break(1u);
      return MEMORY[0x270FA2000]();
    }
    uint64_t v6 = *(void *)(v0 + 216);
    uint64_t v7 = *(void *)(v0 + 184);
    uint64_t v8 = *(void *)(v0 + 168);
    uint64_t v9 = *(unsigned __int8 *)(*(void *)(v0 + 192) + 80);
    uint64_t v43 = (v9 + 32) & ~v9;
    sub_20C2A6BCC(*(void *)v5 + v43, v6);
    sub_20C2AB788(0, 1);
    swift_endAccess();
    uint64_t v10 = v6 + *(int *)(v7 + 24);
    sub_20C2AB970(&qword_2676C6038, MEMORY[0x263F8F520]);
    char v11 = sub_20C2B2810();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    if (v11)
    {
      uint64_t v13 = *(void *)(v0 + 176);
      uint64_t v14 = *(void *)(v0 + 160);
      uint64_t v15 = v10;
    }
    else
    {
      uint64_t v13 = *(void *)(v0 + 176);
      uint64_t v14 = *(void *)(v0 + 160);
      uint64_t v15 = *(void *)(v0 + 128) + *(void *)(v0 + 232);
    }
    v12(v13, v15, v14);
    uint64_t v17 = *(void *)(v0 + 208);
    uint64_t v16 = *(void *)(v0 + 216);
    uint64_t v18 = *(void *)(v0 + 168);
    uint64_t v20 = *(void *)(v0 + 152);
    uint64_t v19 = *(void *)(v0 + 160);
    v12(v20, *(void *)(v0 + 176), v19);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v20, 0, 1, v19);
    sub_20C2A6BCC(v16, v17);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = 0;
    *(void *)(v21 + 24) = 0;
    sub_20C2A90F4(v17, v21 + v43);
    if (swift_taskGroup_addPending())
    {
      uint64_t v22 = *(void *)(v0 + 160);
      uint64_t v23 = *(void *)(v0 + 168);
      uint64_t v24 = *(void *)(v0 + 144);
      sub_20C2ABC20(*(void *)(v0 + 152), v24, &qword_2676C6058);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v24, 1, v22) == 1)
      {
        sub_20C2A6468(*(void *)(v0 + 144), &qword_2676C6058);
      }
      else
      {
        uint64_t v33 = *(void *)(v0 + 160);
        uint64_t v34 = *(void *)(v0 + 168);
        uint64_t v35 = *(void *)(v0 + 144);
        sub_20C2B2950();
        (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v33);
      }
      if (*(void *)(v21 + 16))
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v36 = sub_20C2B2920();
        uint64_t v38 = v37;
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v36 = 0;
        uint64_t v38 = 0;
      }
      uint64_t v39 = **(void **)(v0 + 120);
      uint64_t v40 = swift_allocObject();
      *(void *)(v40 + 16) = &unk_2676C6508;
      *(void *)(v40 + 24) = v21;
      uint64_t v41 = v38 | v36;
      if (v38 | v36)
      {
        uint64_t v41 = v0 + 16;
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0;
        *(void *)(v0 + 32) = v36;
        *(void *)(v0 + 40) = v38;
      }
      uint64_t v31 = *(void *)(v0 + 152);
      *(void *)(v0 + 96) = 1;
      *(void *)(v0 + 104) = v41;
      *(void *)(v0 + 112) = v39;
      swift_task_create();
      swift_release();
      uint64_t v32 = &qword_2676C6058;
    }
    else
    {
      uint64_t v25 = *(void *)(v0 + 216);
      uint64_t v26 = *(void *)(v0 + 152);
      uint64_t v27 = *(void *)(v0 + 136);
      swift_release();
      sub_20C2A6468(v26, &qword_2676C6058);
      sub_20C2ABC20(v25, v27, &qword_2676C6048);
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6040);
      uint64_t v29 = *(void *)(v28 - 8);
      int v30 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28);
      uint64_t v31 = *(void *)(v0 + 136);
      if (v30 != 1)
      {
        sub_20C2B2930();
        (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v31, v28);
        goto LABEL_24;
      }
      uint64_t v32 = &qword_2676C6048;
    }
    sub_20C2A6468(v31, v32);
LABEL_24:
    uint64_t v42 = (void *)swift_task_alloc();
    *(void *)(v0 + 240) = v42;
    *uint64_t v42 = v0;
    v42[1] = sub_20C2A7D9C;
    return MEMORY[0x270FA2000]();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_20C2A7D9C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 128);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20C2A7EAC, v1, 0);
}

uint64_t sub_20C2A7EAC()
{
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 128);
  (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 160));
  sub_20C2A9158(v2);
  if (*(void *)(*(void *)(v3 + v1) + 16) && (sub_20C2B2980() & 1) == 0)
  {
    uint64_t v6 = *(void *)(v0 + 128) + *(void *)(v0 + 224);
    swift_beginAccess();
    if (!*(void *)(*(void *)v6 + 16))
    {
      __break(1u);
      return MEMORY[0x270FA2000]();
    }
    uint64_t v7 = *(void *)(v0 + 216);
    uint64_t v8 = *(void *)(v0 + 184);
    uint64_t v9 = *(void *)(v0 + 168);
    uint64_t v10 = *(unsigned __int8 *)(*(void *)(v0 + 192) + 80);
    uint64_t v44 = (v10 + 32) & ~v10;
    sub_20C2A6BCC(*(void *)v6 + v44, v7);
    sub_20C2AB788(0, 1);
    swift_endAccess();
    uint64_t v11 = v7 + *(int *)(v8 + 24);
    sub_20C2AB970(&qword_2676C6038, MEMORY[0x263F8F520]);
    char v12 = sub_20C2B2810();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
    if (v12)
    {
      uint64_t v14 = *(void *)(v0 + 176);
      uint64_t v15 = *(void *)(v0 + 160);
      uint64_t v16 = v11;
    }
    else
    {
      uint64_t v14 = *(void *)(v0 + 176);
      uint64_t v15 = *(void *)(v0 + 160);
      uint64_t v16 = *(void *)(v0 + 128) + *(void *)(v0 + 232);
    }
    v13(v14, v16, v15);
    uint64_t v18 = *(void *)(v0 + 208);
    uint64_t v17 = *(void *)(v0 + 216);
    uint64_t v19 = *(void *)(v0 + 168);
    uint64_t v21 = *(void *)(v0 + 152);
    uint64_t v20 = *(void *)(v0 + 160);
    v13(v21, *(void *)(v0 + 176), v20);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v21, 0, 1, v20);
    sub_20C2A6BCC(v17, v18);
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = 0;
    *(void *)(v22 + 24) = 0;
    sub_20C2A90F4(v18, v22 + v44);
    if (swift_taskGroup_addPending())
    {
      uint64_t v23 = *(void *)(v0 + 160);
      uint64_t v24 = *(void *)(v0 + 168);
      uint64_t v25 = *(void *)(v0 + 144);
      sub_20C2ABC20(*(void *)(v0 + 152), v25, &qword_2676C6058);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v25, 1, v23) == 1)
      {
        sub_20C2A6468(*(void *)(v0 + 144), &qword_2676C6058);
      }
      else
      {
        uint64_t v34 = *(void *)(v0 + 160);
        uint64_t v35 = *(void *)(v0 + 168);
        uint64_t v36 = *(void *)(v0 + 144);
        sub_20C2B2950();
        (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v34);
      }
      if (*(void *)(v22 + 16))
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v37 = sub_20C2B2920();
        uint64_t v39 = v38;
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v37 = 0;
        uint64_t v39 = 0;
      }
      uint64_t v40 = **(void **)(v0 + 120);
      uint64_t v41 = swift_allocObject();
      *(void *)(v41 + 16) = &unk_2676C6508;
      *(void *)(v41 + 24) = v22;
      uint64_t v42 = v39 | v37;
      if (v39 | v37)
      {
        uint64_t v42 = v0 + 16;
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0;
        *(void *)(v0 + 32) = v37;
        *(void *)(v0 + 40) = v39;
      }
      uint64_t v32 = *(void *)(v0 + 152);
      *(void *)(v0 + 96) = 1;
      *(void *)(v0 + 104) = v42;
      *(void *)(v0 + 112) = v40;
      swift_task_create();
      swift_release();
      uint64_t v33 = &qword_2676C6058;
    }
    else
    {
      uint64_t v26 = *(void *)(v0 + 216);
      uint64_t v27 = *(void *)(v0 + 152);
      uint64_t v28 = *(void *)(v0 + 136);
      swift_release();
      sub_20C2A6468(v27, &qword_2676C6058);
      sub_20C2ABC20(v26, v28, &qword_2676C6048);
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6040);
      uint64_t v30 = *(void *)(v29 - 8);
      int v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29);
      uint64_t v32 = *(void *)(v0 + 136);
      if (v31 != 1)
      {
        sub_20C2B2930();
        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v32, v29);
        goto LABEL_24;
      }
      uint64_t v33 = &qword_2676C6048;
    }
    sub_20C2A6468(v32, v33);
LABEL_24:
    uint64_t v43 = (void *)swift_task_alloc();
    *(void *)(v0 + 240) = v43;
    *uint64_t v43 = v0;
    v43[1] = sub_20C2A7D9C;
    return MEMORY[0x270FA2000]();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_20C2A83F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6048);
  *(void *)(v3 + 24) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_20C2A848C, 0, 0);
}

uint64_t sub_20C2A848C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (void *)(v1 + *(int *)(type metadata accessor for AsyncPriorityQueue.WorkItem(0) + 20));
  uint64_t v5 = (uint64_t (*)(void))(*v2 + *(int *)*v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v3;
  void *v3 = v0;
  v3[1] = sub_20C2A8568;
  return v5();
}

uint64_t sub_20C2A8568()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20C2A8664, 0, 0);
}

uint64_t sub_20C2A8664()
{
  uint64_t v1 = v0[3];
  sub_20C2ABC20(v0[2], v1, &qword_2676C6048);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6040);
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = v0[3];
  if (v4 == 1)
  {
    sub_20C2A6468(v0[3], &qword_2676C6048);
  }
  else
  {
    sub_20C2B2930();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
  }
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_20C2A877C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20C2B2960();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_20C2B2950();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_20C2A6468(a1, &qword_2676C6058);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20C2B2920();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

Swift::Void __swiftcall AsyncPriorityQueue.cancel()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6048);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v0 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_workerTask))
  {
    swift_retain();
    sub_20C2B2970();
    swift_release();
  }
  uint64_t v8 = (uint64_t *)(v0 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = *(void *)(*v8 + 16);
  if (v10)
  {
    v15[1] = *v8;
    uint64_t v16 = v8;
    uint64_t v11 = v9 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v12 = *(void *)(v5 + 72);
    swift_bridgeObjectRetain();
    do
    {
      sub_20C2A6BCC(v11, (uint64_t)v7);
      sub_20C2ABC20((uint64_t)v7, (uint64_t)v3, &qword_2676C6048);
      sub_20C2A9158((uint64_t)v7);
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6040);
      uint64_t v14 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v3, 1, v13) == 1)
      {
        sub_20C2A6468((uint64_t)v3, &qword_2676C6048);
      }
      else
      {
        sub_20C2B2930();
        (*(void (**)(char *, uint64_t))(v14 + 8))(v3, v13);
      }
      v11 += v12;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
    uint64_t v8 = v16;
  }
  uint64_t *v8 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
}

uint64_t AsyncPriorityQueue.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_basePriority;
  uint64_t v2 = sub_20C2B2960();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t AsyncPriorityQueue.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_basePriority;
  uint64_t v2 = sub_20C2B2960();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t AsyncPriorityQueue.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_20C2A8CD8()
{
  return v0;
}

uint64_t sub_20C2A8CE4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_20C2ABD6C;
  return v6(a1);
}

uint64_t sub_20C2A8DC0(int *a1)
{
  uint64_t v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_20C2A4F90;
  return v4();
}

uint64_t sub_20C2A8E8C(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6060);
  uint64_t v10 = *(void *)(type metadata accessor for AsyncPriorityQueue.WorkItem(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_20C2B2AE0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for AsyncPriorityQueue.WorkItem(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_20C2AB630(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_20C2A90F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20C2A9158(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for AsyncPriorityQueue(uint64_t a1)
{
  return sub_20C2A91D4(a1, (uint64_t *)&unk_2676C6028);
}

uint64_t sub_20C2A91D4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20C2A920C(uint64_t a1)
{
  return sub_20C2A6ED0(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_20C2A9218()
{
  return type metadata accessor for AsyncPriorityQueue(0);
}

uint64_t sub_20C2A9220()
{
  uint64_t result = sub_20C2B2960();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for AsyncPriorityQueue(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AsyncPriorityQueue);
}

uint64_t dispatch thunk of AsyncPriorityQueue.__allocating_init(basePriority:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t *sub_20C2A9300(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6040);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6048);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (uint64_t *)((char *)a1 + v11);
    size_t v14 = (uint64_t *)((char *)a2 + v11);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = (char *)a1 + v12;
    unint64_t v17 = (char *)a2 + v12;
    uint64_t v18 = sub_20C2B2960();
    uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
    swift_retain();
    v19(v16, v17, v18);
  }
  return a1;
}

uint64_t sub_20C2A94DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6040);
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  swift_release();
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = sub_20C2B2960();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

char *sub_20C2A95F0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6040);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6048);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = &a1[v9];
  uint64_t v12 = &a2[v9];
  uint64_t v13 = *((void *)v12 + 1);
  *(void *)uint64_t v11 = *(void *)v12;
  *((void *)v11 + 1) = v13;
  size_t v14 = &a1[v10];
  uint64_t v15 = &a2[v10];
  uint64_t v16 = sub_20C2B2960();
  unint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
  swift_retain();
  v17(v14, v15, v16);
  return a1;
}

char *sub_20C2A977C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6040);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6048);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  size_t v14 = &a2[v12];
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = v15;
  swift_retain();
  swift_release();
  uint64_t v16 = *(int *)(a3 + 24);
  unint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = sub_20C2B2960();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

char *sub_20C2A996C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6040);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6048);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  int v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_20C2B2960();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

char *sub_20C2A9ADC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6040);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6048);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  swift_release();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = &a1[v12];
  size_t v14 = &a2[v12];
  uint64_t v15 = sub_20C2B2960();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_20C2A9CC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20C2A9CD4);
}

uint64_t sub_20C2A9CD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6048);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_20C2B2960();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_20C2A9E04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20C2A9E18);
}

uint64_t sub_20C2A9E18(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6048);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_20C2B2960();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_20C2A9F48()
{
  sub_20C2AA01C();
  if (v0 <= 0x3F)
  {
    sub_20C2B2960();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_20C2AA01C()
{
  if (!qword_2676C6050)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2676C6040);
    unint64_t v0 = sub_20C2B2A30();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2676C6050);
    }
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_20C2AA0C0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_20C2AA100()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_20C2A6374;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_20C2A7424, v2, 0);
}

uint64_t sub_20C2AA1A8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_20C2A66A0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2676C64E0 + dword_2676C64E0);
  return v6(a1, v4);
}

uint64_t sub_20C2AA260(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_20C2A66A0;
  return sub_20C2A76A0(a1, a2, v2);
}

uint64_t sub_20C2AA30C(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v137 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  uint64_t v131 = *(void *)(v137 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v137);
  uint64_t v128 = (uint64_t)&v123 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v138 = (uint64_t)&v123 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v134 = (uint64_t)&v123 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v133 = (uint64_t)&v123 - v10;
  uint64_t v11 = a1[1];
  uint64_t result = sub_20C2B2B10();
  if (result >= v11)
  {
    if (v11 < 0) {
      goto LABEL_140;
    }
    if (v11) {
      return sub_20C2AACF4(0, v11, 1, a1);
    }
    return result;
  }
  if (v11 >= 0) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v11 + 1;
  }
  if (v11 < -1) {
    goto LABEL_148;
  }
  uint64_t v125 = result;
  if (v11 < 2)
  {
    unint64_t v17 = (char *)MEMORY[0x263F8EE78];
    unint64_t v130 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v131 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v131 + 80));
    uint64_t v124 = MEMORY[0x263F8EE78];
    if (v11 != 1)
    {
      unint64_t v19 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_106:
      if (v19 >= 2)
      {
        uint64_t v116 = *a1;
        do
        {
          unint64_t v117 = v19 - 2;
          if (v19 < 2) {
            goto LABEL_135;
          }
          if (!v116) {
            goto LABEL_147;
          }
          v118 = v17;
          uint64_t v119 = *(void *)&v17[16 * v117 + 32];
          uint64_t v120 = *(void *)&v17[16 * v19 + 24];
          sub_20C2AAF4C(v116 + *(void *)(v131 + 72) * v119, v116 + *(void *)(v131 + 72) * *(void *)&v17[16 * v19 + 16], v116 + *(void *)(v131 + 72) * v120, v130);
          if (v2) {
            break;
          }
          if (v120 < v119) {
            goto LABEL_136;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v118 = sub_20C2AB608((uint64_t)v17);
          }
          if (v117 >= *((void *)v118 + 2)) {
            goto LABEL_137;
          }
          v121 = &v118[16 * v117 + 32];
          *(void *)v121 = v119;
          *((void *)v121 + 1) = v120;
          unint64_t v122 = *((void *)v118 + 2);
          if (v19 > v122) {
            goto LABEL_138;
          }
          memmove(&v118[16 * v19 + 16], &v118[16 * v19 + 32], 16 * (v122 - v19));
          *((void *)v118 + 2) = v122 - 1;
          unint64_t v19 = v122 - 1;
          unint64_t v17 = v118;
        }
        while (v122 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
      *(void *)(v124 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v14 = v13 >> 1;
    uint64_t v15 = sub_20C2B28E0();
    *(void *)(v15 + 16) = v14;
    uint64_t v16 = *(unsigned __int8 *)(v131 + 80);
    uint64_t v124 = v15;
    unint64_t v130 = v15 + ((v16 + 32) & ~v16);
  }
  uint64_t v18 = 0;
  unint64_t v17 = (char *)MEMORY[0x263F8EE78];
  v136 = a1;
  while (1)
  {
    uint64_t v20 = v18;
    uint64_t v21 = v18 + 1;
    if (v18 + 1 >= v11)
    {
      uint64_t v38 = v18 + 1;
      goto LABEL_58;
    }
    uint64_t v126 = v2;
    uint64_t v22 = *a1;
    uint64_t v23 = *(void *)(v131 + 72);
    uint64_t v24 = v133;
    sub_20C2A6BCC(*a1 + v23 * v21, v133);
    uint64_t v25 = v22 + v23 * v20;
    uint64_t v129 = v20;
    uint64_t v26 = v134;
    sub_20C2A6BCC(v25, v134);
    LODWORD(v135) = sub_20C2B2940();
    uint64_t v27 = v26;
    uint64_t v20 = v129;
    sub_20C2A9158(v27);
    sub_20C2A9158(v24);
    uint64_t v28 = v20 + 2;
    uint64_t v139 = v23;
    uint64_t v132 = v22;
    if (v20 + 2 >= v11)
    {
      uint64_t v31 = v20 + 2;
      uint64_t v37 = v23;
      if ((v135 & 1) == 0) {
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v29 = v23 * v21;
      uint64_t v30 = v22;
      uint64_t v31 = v28;
      uint64_t v32 = v23 * v28;
      do
      {
        uint64_t v33 = v11;
        uint64_t v34 = v133;
        sub_20C2A6BCC(v30 + v32, v133);
        uint64_t v35 = v134;
        sub_20C2A6BCC(v30 + v29, v134);
        int v36 = sub_20C2B2940();
        sub_20C2A9158(v35);
        sub_20C2A9158(v34);
        if ((v135 ^ v36))
        {
          a1 = v136;
          uint64_t v20 = v129;
          uint64_t v11 = v33;
          uint64_t v37 = v139;
          if ((v135 & 1) == 0) {
            goto LABEL_37;
          }
          goto LABEL_24;
        }
        uint64_t v37 = v139;
        v30 += v139;
        ++v31;
        uint64_t v11 = v33;
      }
      while (v33 != v31);
      uint64_t v31 = v33;
      a1 = v136;
      uint64_t v20 = v129;
      if ((v135 & 1) == 0)
      {
LABEL_37:
        uint64_t v38 = v31;
        break;
      }
    }
LABEL_24:
    if (v31 < v20) {
      goto LABEL_141;
    }
    uint64_t v38 = v31;
    if (v20 >= v31) {
      break;
    }
    uint64_t v135 = v11;
    v123 = v17;
    uint64_t v39 = 0;
    uint64_t v40 = v20;
    uint64_t v41 = v37 * (v31 - 1);
    uint64_t v42 = v31 * v37;
    uint64_t v43 = v40;
    uint64_t v44 = v40 * v37;
    uint64_t v45 = v132;
    do
    {
      if (v43 != v38 + v39 - 1)
      {
        if (!v45) {
          goto LABEL_146;
        }
        sub_20C2A90F4(v45 + v44, v128);
        if (v44 < v41 || v45 + v44 >= (unint64_t)(v45 + v42))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v44 != v41)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        sub_20C2A90F4(v128, v45 + v41);
        a1 = v136;
        uint64_t v38 = v31;
        uint64_t v37 = v139;
      }
      ++v43;
      --v39;
      v41 -= v37;
      v42 -= v37;
      v44 += v37;
    }
    while (v43 < v38 + v39);
    unint64_t v17 = v123;
    uint64_t v2 = v126;
    uint64_t v20 = v129;
    uint64_t v11 = v135;
    if (v38 < v135) {
      goto LABEL_41;
    }
LABEL_58:
    if (v38 < v20) {
      goto LABEL_134;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v135 = v38;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      unint64_t v17 = sub_20C2AB3CC(0, *((void *)v17 + 2) + 1, 1, v17);
    }
    unint64_t v65 = *((void *)v17 + 2);
    unint64_t v64 = *((void *)v17 + 3);
    unint64_t v19 = v65 + 1;
    if (v65 >= v64 >> 1) {
      unint64_t v17 = sub_20C2AB3CC((char *)(v64 > 1), v65 + 1, 1, v17);
    }
    *((void *)v17 + 2) = v19;
    CGRect v66 = v17 + 32;
    CGRect v67 = &v17[16 * v65 + 32];
    uint64_t v68 = v135;
    *(void *)CGRect v67 = v20;
    *((void *)v67 + 1) = v68;
    if (v65)
    {
      while (1)
      {
        unint64_t v69 = v19 - 1;
        if (v19 >= 4)
        {
          v74 = &v66[16 * v19];
          uint64_t v75 = *((void *)v74 - 8);
          uint64_t v76 = *((void *)v74 - 7);
          BOOL v80 = __OFSUB__(v76, v75);
          uint64_t v77 = v76 - v75;
          if (v80) {
            goto LABEL_123;
          }
          uint64_t v79 = *((void *)v74 - 6);
          uint64_t v78 = *((void *)v74 - 5);
          BOOL v80 = __OFSUB__(v78, v79);
          uint64_t v72 = v78 - v79;
          char v73 = v80;
          if (v80) {
            goto LABEL_124;
          }
          unint64_t v81 = v19 - 2;
          v82 = &v66[16 * v19 - 32];
          uint64_t v84 = *(void *)v82;
          uint64_t v83 = *((void *)v82 + 1);
          BOOL v80 = __OFSUB__(v83, v84);
          uint64_t v85 = v83 - v84;
          if (v80) {
            goto LABEL_126;
          }
          BOOL v80 = __OFADD__(v72, v85);
          uint64_t v86 = v72 + v85;
          if (v80) {
            goto LABEL_129;
          }
          if (v86 >= v77)
          {
            v104 = &v66[16 * v69];
            uint64_t v106 = *(void *)v104;
            uint64_t v105 = *((void *)v104 + 1);
            BOOL v80 = __OFSUB__(v105, v106);
            uint64_t v107 = v105 - v106;
            if (v80) {
              goto LABEL_133;
            }
            BOOL v97 = v72 < v107;
            goto LABEL_95;
          }
        }
        else
        {
          if (v19 != 3)
          {
            uint64_t v98 = *((void *)v17 + 4);
            uint64_t v99 = *((void *)v17 + 5);
            BOOL v80 = __OFSUB__(v99, v98);
            uint64_t v91 = v99 - v98;
            char v92 = v80;
            goto LABEL_89;
          }
          uint64_t v71 = *((void *)v17 + 4);
          uint64_t v70 = *((void *)v17 + 5);
          BOOL v80 = __OFSUB__(v70, v71);
          uint64_t v72 = v70 - v71;
          char v73 = v80;
        }
        if (v73) {
          goto LABEL_125;
        }
        unint64_t v81 = v19 - 2;
        v87 = &v66[16 * v19 - 32];
        uint64_t v89 = *(void *)v87;
        uint64_t v88 = *((void *)v87 + 1);
        BOOL v90 = __OFSUB__(v88, v89);
        uint64_t v91 = v88 - v89;
        char v92 = v90;
        if (v90) {
          goto LABEL_128;
        }
        v93 = &v66[16 * v69];
        uint64_t v95 = *(void *)v93;
        uint64_t v94 = *((void *)v93 + 1);
        BOOL v80 = __OFSUB__(v94, v95);
        uint64_t v96 = v94 - v95;
        if (v80) {
          goto LABEL_131;
        }
        if (__OFADD__(v91, v96)) {
          goto LABEL_132;
        }
        if (v91 + v96 >= v72)
        {
          BOOL v97 = v72 < v96;
LABEL_95:
          if (v97) {
            unint64_t v69 = v81;
          }
          goto LABEL_97;
        }
LABEL_89:
        if (v92) {
          goto LABEL_127;
        }
        v100 = &v66[16 * v69];
        uint64_t v102 = *(void *)v100;
        uint64_t v101 = *((void *)v100 + 1);
        BOOL v80 = __OFSUB__(v101, v102);
        uint64_t v103 = v101 - v102;
        if (v80) {
          goto LABEL_130;
        }
        if (v103 < v91) {
          goto LABEL_14;
        }
LABEL_97:
        unint64_t v108 = v69 - 1;
        if (v69 - 1 >= v19)
        {
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
          goto LABEL_143;
        }
        uint64_t v109 = *a1;
        if (!*a1) {
          goto LABEL_145;
        }
        v110 = v17;
        v111 = &v66[16 * v108];
        uint64_t v112 = *(void *)v111;
        v113 = &v66[16 * v69];
        uint64_t v114 = *((void *)v113 + 1);
        sub_20C2AAF4C(v109 + *(void *)(v131 + 72) * *(void *)v111, v109 + *(void *)(v131 + 72) * *(void *)v113, v109 + *(void *)(v131 + 72) * v114, v130);
        if (v2) {
          goto LABEL_117;
        }
        if (v114 < v112) {
          goto LABEL_120;
        }
        if (v69 > *((void *)v110 + 2)) {
          goto LABEL_121;
        }
        *(void *)v111 = v112;
        *(void *)&v66[16 * v108 + 8] = v114;
        unint64_t v115 = *((void *)v110 + 2);
        if (v69 >= v115) {
          goto LABEL_122;
        }
        unint64_t v17 = v110;
        unint64_t v19 = v115 - 1;
        memmove(&v66[16 * v69], v113 + 16, 16 * (v115 - 1 - v69));
        *((void *)v110 + 2) = v115 - 1;
        a1 = v136;
        if (v115 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v19 = 1;
LABEL_14:
    uint64_t v11 = a1[1];
    uint64_t v18 = v135;
    if (v135 >= v11) {
      goto LABEL_106;
    }
  }
  uint64_t v2 = v126;
  if (v38 >= v11) {
    goto LABEL_58;
  }
LABEL_41:
  if (__OFSUB__(v38, v20)) {
    goto LABEL_139;
  }
  if (v38 - v20 >= v125) {
    goto LABEL_58;
  }
  if (__OFADD__(v20, v125)) {
    goto LABEL_142;
  }
  if (v20 + v125 >= v11) {
    uint64_t v46 = v11;
  }
  else {
    uint64_t v46 = v20 + v125;
  }
  if (v46 >= v20)
  {
    if (v38 != v46)
    {
      uint64_t v129 = v20;
      v123 = v17;
      uint64_t v126 = v2;
      uint64_t v127 = v46;
      uint64_t v47 = *(void *)(v131 + 72);
      uint64_t v48 = v47 * (v38 - 1);
      uint64_t v132 = v47;
      uint64_t v49 = v38 * v47;
      do
      {
        uint64_t v51 = 0;
        uint64_t v52 = v129;
        uint64_t v135 = v38;
        while (1)
        {
          uint64_t v139 = v52;
          uint64_t v53 = *a1;
          uint64_t v54 = v49;
          uint64_t v55 = v49 + v51 + *a1;
          CGRect v56 = a1;
          uint64_t v57 = v133;
          sub_20C2A6BCC(v55, v133);
          uint64_t v58 = v48;
          uint64_t v59 = v48 + v51 + v53;
          uint64_t v60 = v134;
          sub_20C2A6BCC(v59, v134);
          LOBYTE(v53) = sub_20C2B2940();
          sub_20C2A9158(v60);
          sub_20C2A9158(v57);
          if ((v53 & 1) == 0) {
            break;
          }
          uint64_t v61 = *v56;
          if (!*v56) {
            goto LABEL_144;
          }
          uint64_t v49 = v54;
          uint64_t v48 = v58;
          uint64_t v62 = v61 + v58 + v51;
          sub_20C2A90F4(v61 + v54 + v51, v138);
          swift_arrayInitWithTakeFrontToBack();
          sub_20C2A90F4(v138, v62);
          v51 -= v132;
          uint64_t v52 = v139 + 1;
          uint64_t v50 = v135;
          a1 = v136;
          if (v135 == v139 + 1) {
            goto LABEL_51;
          }
        }
        uint64_t v50 = v135;
        a1 = v56;
        uint64_t v48 = v58;
        uint64_t v49 = v54;
LABEL_51:
        uint64_t v38 = v50 + 1;
        v48 += v132;
        v49 += v132;
      }
      while (v38 != v127);
      uint64_t v38 = v127;
      uint64_t v2 = v126;
      unint64_t v17 = v123;
      uint64_t v20 = v129;
    }
    goto LABEL_58;
  }
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  uint64_t result = sub_20C2B2AE0();
  __break(1u);
  return result;
}

uint64_t sub_20C2AACF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v24 = a1;
  uint64_t v27 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  uint64_t v7 = MEMORY[0x270FA5388](v27);
  uint64_t v28 = (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v22 - v10;
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v26 = a3;
  uint64_t v23 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v30 = v16 * (v26 - 1);
    uint64_t v25 = v16;
    uint64_t v29 = v16 * v26;
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v18 = v24;
    while (1)
    {
      uint64_t v19 = *a4;
      sub_20C2A6BCC(v29 + v17 + *a4, (uint64_t)v15);
      sub_20C2A6BCC(v30 + v17 + v19, (uint64_t)v11);
      LOBYTE(v19) = sub_20C2B2940();
      sub_20C2A9158((uint64_t)v11);
      uint64_t result = sub_20C2A9158((uint64_t)v15);
      if ((v19 & 1) == 0)
      {
LABEL_4:
        v30 += v25;
        v29 += v25;
        if (++v26 == v23) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v20 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v21 = v20 + v30 + v17;
      sub_20C2A90F4(v20 + v29 + v17, v28);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_20C2A90F4(v28, v21);
      v17 -= v25;
      if (v26 == ++v18) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_20C2AAF4C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v36 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  uint64_t v8 = MEMORY[0x270FA5388](v36);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v34 - v11;
  uint64_t v14 = *(void *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_61;
  }
  int64_t v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_62;
  }
  uint64_t v16 = (uint64_t)(a2 - a1) / v14;
  unint64_t v39 = a1;
  unint64_t v38 = a4;
  uint64_t v17 = v15 / v14;
  if (v16 >= v15 / v14)
  {
    if ((v17 & 0x8000000000000000) == 0)
    {
      uint64_t v19 = v17 * v14;
      if (a4 < a2 || a2 + v19 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v26 = a4 + v19;
      unint64_t v37 = a4 + v19;
      unint64_t v39 = a2;
      unint64_t v35 = a1;
      if (v19 >= 1 && a1 < a2)
      {
        uint64_t v28 = -v14;
        do
        {
          unint64_t v29 = a3 + v28;
          sub_20C2A6BCC(v26 + v28, (uint64_t)v12);
          unint64_t v30 = a2 + v28;
          sub_20C2A6BCC(a2 + v28, (uint64_t)v10);
          char v31 = sub_20C2B2940();
          sub_20C2A9158((uint64_t)v10);
          sub_20C2A9158((uint64_t)v12);
          if (v31)
          {
            if (a3 < a2 || v29 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v39 += v28;
          }
          else
          {
            unint64_t v32 = v37;
            v37 += v28;
            if (a3 < v32 || v29 >= v32)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v32)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v30 = a2;
          }
          unint64_t v26 = v37;
          if (v37 <= a4) {
            break;
          }
          a2 = v30;
          a3 += v28;
        }
        while (v30 > v35);
      }
      goto LABEL_59;
    }
  }
  else if ((v16 & 0x8000000000000000) == 0)
  {
    uint64_t v18 = v16 * v14;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v20 = a4 + v18;
    unint64_t v37 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        sub_20C2A6BCC(a2, (uint64_t)v12);
        sub_20C2A6BCC(a4, (uint64_t)v10);
        char v22 = sub_20C2B2940();
        sub_20C2A9158((uint64_t)v10);
        sub_20C2A9158((uint64_t)v12);
        unint64_t v23 = v39;
        if (v22)
        {
          unint64_t v24 = a2 + v14;
          if (v39 < a2 || v39 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v39 == a2)
          {
            unint64_t v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v25 = v38 + v14;
          if (v39 < v38 || v39 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v39 != v38)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v38 = v25;
          unint64_t v24 = a2;
        }
        unint64_t v39 = v23 + v14;
        a4 = v38;
        if (v38 >= v20) {
          break;
        }
        a2 = v24;
      }
      while (v24 < a3);
    }
LABEL_59:
    sub_20C2AB4C8(&v39, &v38, (uint64_t *)&v37);
    return 1;
  }
LABEL_63:
  uint64_t result = sub_20C2B2B00();
  __break(1u);
  return result;
}

char *sub_20C2AB3CC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6520);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_20C2AB4C8(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_20C2B2B00();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_20C2AB608(uint64_t a1)
{
  return sub_20C2AB3CC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_20C2AB61C(unint64_t a1)
{
  return sub_20C2A8E8C(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_20C2AB630(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for AsyncPriorityQueue.WorkItem(0) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_20C2B2B00();
  __break(1u);
  return result;
}

uint64_t sub_20C2AB788(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_20C2A8E8C(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(type metadata accessor for AsyncPriorityQueue.WorkItem(0) - 8);
  unint64_t v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * a1;
  unint64_t v16 = v13 + v14 * a1;
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)(v4 + 16);
  uint64_t v19 = v18 - a2;
  if (__OFSUB__(v18, a2)) {
    goto LABEL_31;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v21 = *(void *)(v4 + 16);
    BOOL v22 = __OFADD__(v21, v8);
    uint64_t v23 = v21 - v7;
    if (!v22)
    {
      *(void *)(v4 + 16) = v23;
LABEL_25:
      unint64_t *v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t result = sub_20C2B2B00();
  __break(1u);
  return result;
}

uint64_t sub_20C2AB970(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20C2AB9B8()
{
  uint64_t v1 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6040);
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  swift_release();
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 24);
  uint64_t v8 = sub_20C2B2960();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_20C2ABB40()
{
  uint64_t v2 = *(void *)(type metadata accessor for AsyncPriorityQueue.WorkItem(0) - 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_20C2A66A0;
  return sub_20C2A83F8(v3, v4, v5);
}

uint64_t sub_20C2ABC20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_20C2ABC84()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20C2ABCBC()
{
  uint64_t v2 = *(int **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_20C2A6374;
  uint64_t v4 = (uint64_t (*)(int *))((char *)&dword_2676C6510 + dword_2676C6510);
  return v4(v2);
}

uint64_t NSAttributedString.range.getter()
{
  objc_msgSend(v0, sel_ic_range);
  id v1 = objc_msgSend(v0, sel_string);
  sub_20C2B2840();

  uint64_t v2 = sub_20C2B29C0();
  char v4 = v3;
  uint64_t result = swift_bridgeObjectRelease();
  if ((v4 & 1) == 0) {
    return v2;
  }
  __break(1u);
  return result;
}

uint64_t NSAttributedString.componentRanges(separatedBy:in:)(uint64_t a1, uint64_t a2, id a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_20C2AC000;
  *(void *)(v13 + 24) = v12;
  aBlock[4] = sub_20C2AC05C;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20C2AC088;
  aBlock[3] = &block_descriptor_0;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  if (a5)
  {
    a3 = objc_msgSend(v6, sel_ic_range);
    a4 = v15;
  }
  id v16 = objc_msgSend(v6, sel_ic_componentRangesSeparatedByPredicate_inRange_, v14, a3, a4);
  _Block_release(v14);
  sub_20C2AC0D4();
  unint64_t v17 = sub_20C2B28A0();

  uint64_t v18 = sub_20C2AC114(v17);
  swift_release();
  swift_bridgeObjectRelease();
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0) {
    return v18;
  }
  __break(1u);
  return result;
}

uint64_t sub_20C2ABFF0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20C2AC000(uint64_t a1, unsigned __int16 a2)
{
  if ((a2 & 0xF800) == 0xD800) {
    return 0;
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(a1, a2) & 1;
  }
}

uint64_t sub_20C2AC04C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20C2AC05C()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_20C2AC088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 32))(a2, a3) & 1;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_20C2AC0D4()
{
  unint64_t result = qword_2676C6528;
  if (!qword_2676C6528)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2676C6528);
  }
  return result;
}

uint64_t sub_20C2AC114(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    if (!v2) {
      return v3;
    }
    uint64_t v14 = MEMORY[0x263F8EE78];
    uint64_t result = sub_20C2AC310(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v5 = 0;
    uint64_t v3 = v14;
    while (v2 != v5)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x210547060](v5, a1);
      }
      else {
        id v6 = *(id *)(a1 + 8 * v5 + 32);
      }
      uint64_t v7 = v6;
      id v8 = objc_msgSend(v6, sel_rangeValue);
      uint64_t v10 = v9;

      unint64_t v12 = *(void *)(v14 + 16);
      unint64_t v11 = *(void *)(v14 + 24);
      if (v12 >= v11 >> 1) {
        sub_20C2AC310(v11 > 1, v12 + 1, 1);
      }
      ++v5;
      *(void *)(v14 + 16) = v12 + 1;
      uint64_t v13 = v14 + 16 * v12;
      *(void *)(v13 + 32) = v8;
      *(void *)(v13 + 40) = v10;
      if (v2 == v5) {
        return v3;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_20C2B2AF0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

id NSAttributedString.range(byTrimmingCharactersIn:in:)(uint64_t a1, id a2, uint64_t a3, char a4)
{
  id v8 = (void *)sub_20C2B2620();
  if (a4)
  {
    a2 = objc_msgSend(v4, sel_ic_range);
    a3 = v9;
  }
  id v10 = objc_msgSend(v4, sel_ic_rangeByTrimmingCharactersInSet_inRange_, v8, a2, a3);

  return v10;
}

uint64_t sub_20C2AC310(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_20C2AC330(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_20C2AC330(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676C6530);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_20C2B2B00();
  __break(1u);
  return result;
}

uint64_t Sequence.sorted<A>(by:comparator:)()
{
  return sub_20C2B2890();
}

uint64_t sub_20C2AC4DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, char *), uint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(*MEMORY[0x263F8EA20] + *a5 + 8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  id v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v16 - v11;
  swift_getAtKeyPath();
  swift_getAtKeyPath();
  char v13 = a3(v12, v10);
  uint64_t v14 = *(void (**)(char *, uint64_t))(v7 + 8);
  v14(v10, v6);
  v14(v12, v6);
  return v13 & 1;
}

uint64_t sub_20C2AC664(uint64_t a1, uint64_t a2)
{
  return sub_20C2AC4DC(a1, a2, *(uint64_t (**)(char *, char *))(v2 + 40), *(void *)(v2 + 48), *(void **)(v2 + 56)) & 1;
}

uint64_t Sequence.sorted<A>(by:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(*MEMORY[0x263F8EA20] + *a1 + 8);
  uint64_t v6[2] = a2;
  v6[3] = v4;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = v4;
  v6[10] = a2;
  v6[11] = a3;
  v6[12] = a4;
  v6[13] = sub_20C2AC740;
  v6[14] = v6;
  v6[15] = a1;
  return sub_20C2B2890();
}

uint64_t sub_20C2AC740()
{
  return sub_20C2B2800() & 1;
}

uint64_t Sequence.removingNils<A>()()
{
  return sub_20C2B2870();
}

uint64_t sub_20C2AC7CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_20C2B2A30();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t Sequence.count(where:)(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3, char *a4)
{
  unint64_t v35 = a1;
  uint64_t v36 = a2;
  unint64_t v37 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v32 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v8 = (char *)&v30 - v7;
  uint64_t v9 = sub_20C2B2A30();
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v30 - v11;
  uint64_t v13 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = swift_getAssociatedTypeWitness();
  uint64_t v31 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v30 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v38, a3);
  sub_20C2B2860();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  unint64_t v37 = v18;
  uint64_t v38 = v16;
  uint64_t v34 = AssociatedConformanceWitness;
  sub_20C2B2A50();
  uint64_t v20 = v32;
  uint64_t v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48);
  if (v33(v12, 1, AssociatedTypeWitness) == 1)
  {
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v23 = *(void *)(v20 + 32);
    uint64_t v22 = v20 + 32;
    uint64_t v32 = v23;
    unint64_t v24 = (void (**)(char *, uint64_t))(v22 - 24);
    while (1)
    {
      uint64_t v25 = v22;
      ((void (*)(char *, char *, uint64_t))v32)(v8, v12, AssociatedTypeWitness);
      char v26 = v35(v8);
      if (v4) {
        break;
      }
      char v27 = v26;
      (*v24)(v8, AssociatedTypeWitness);
      if ((v27 & 1) != 0 && __OFADD__(v21++, 1))
      {
        __break(1u);
        break;
      }
      sub_20C2B2A50();
      uint64_t v22 = v25;
      if (v33(v12, 1, AssociatedTypeWitness) == 1) {
        goto LABEL_11;
      }
    }
    (*v24)(v8, AssociatedTypeWitness);
  }
LABEL_11:
  (*(void (**)(char *, uint64_t))(v31 + 8))(v37, v38);
  return v21;
}

uint64_t Sequence<>.uniqued()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = sub_20C2B28D0();
  if (MEMORY[0x210546EB0](v12, AssociatedTypeWitness)) {
    uint64_t v13 = sub_20C2ACF08(v12, AssociatedTypeWitness, a3);
  }
  else {
    uint64_t v13 = MEMORY[0x263F8EE88];
  }
  swift_bridgeObjectRelease();
  uint64_t v18 = v13;
  uint64_t v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v4, a1);
  MEMORY[0x270FA5388](v14);
  *(&v17 - 4) = a1;
  *(&v17 - 3) = a2;
  *(&v17 - 2) = a3;
  *(&v17 - 1) = (uint64_t)&v18;
  uint64_t v15 = sub_20C2B2880();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_20C2ACDA8(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v11 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1, AssociatedTypeWitness);
  sub_20C2B29B0();
  char v9 = sub_20C2B29A0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, AssociatedTypeWitness);
  return v9 & 1;
}

uint64_t sub_20C2ACF08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  char v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v51 = (char *)&v39 - v11;
  uint64_t v40 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v39 - v14;
  if (MEMORY[0x210546EA0](v13))
  {
    sub_20C2B2A90();
    uint64_t v16 = sub_20C2B2A80();
  }
  else
  {
    uint64_t v16 = MEMORY[0x263F8EE88];
  }
  uint64_t v44 = MEMORY[0x210546EB0](v5, a2);
  if (!v44) {
    return v16;
  }
  uint64_t v17 = 0;
  uint64_t v49 = (void (**)(char *, uint64_t *, uint64_t))(v6 + 16);
  uint64_t v50 = v16 + 56;
  uint64_t v46 = v6 + 32;
  uint64_t v48 = (void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v41 = v6;
  uint64_t v42 = v5;
  uint64_t v43 = v15;
  while (1)
  {
    char v18 = sub_20C2B28F0();
    sub_20C2B28C0();
    if (v18)
    {
      uint64_t v19 = *(void (**)(char *, uint64_t *, uint64_t))(v6 + 16);
      v19(v15, (uint64_t *)(v5+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v17), a2);
      BOOL v20 = __OFADD__(v17, 1);
      uint64_t v21 = v17 + 1;
      if (v20) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t result = sub_20C2B2AB0();
      if (v40 != 8) {
        goto LABEL_23;
      }
      uint64_t v52 = result;
      uint64_t v19 = *v49;
      (*v49)(v15, &v52, a2);
      swift_unknownObjectRelease();
      BOOL v20 = __OFADD__(v17, 1);
      uint64_t v21 = v17 + 1;
      if (v20)
      {
LABEL_20:
        __break(1u);
        return v16;
      }
    }
    uint64_t v47 = v21;
    uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v45(v51, v15, a2);
    uint64_t v22 = sub_20C2B27E0();
    uint64_t v23 = v16;
    uint64_t v24 = -1 << *(unsigned char *)(v16 + 32);
    unint64_t v25 = v22 & ~v24;
    unint64_t v26 = v25 >> 6;
    uint64_t v27 = *(void *)(v50 + 8 * (v25 >> 6));
    uint64_t v28 = 1 << v25;
    uint64_t v29 = *(void *)(v6 + 72);
    if (((1 << v25) & v27) != 0)
    {
      uint64_t v30 = ~v24;
      do
      {
        v19(v9, (uint64_t *)(*(void *)(v23 + 48) + v29 * v25), a2);
        uint64_t v31 = a3;
        char v32 = sub_20C2B2820();
        uint64_t v33 = *v48;
        (*v48)(v9, a2);
        if (v32)
        {
          v33(v51, a2);
          a3 = v31;
          uint64_t v6 = v41;
          uint64_t v5 = v42;
          uint64_t v16 = v23;
          goto LABEL_7;
        }
        unint64_t v25 = (v25 + 1) & v30;
        unint64_t v26 = v25 >> 6;
        uint64_t v27 = *(void *)(v50 + 8 * (v25 >> 6));
        uint64_t v28 = 1 << v25;
        a3 = v31;
      }
      while ((v27 & (1 << v25)) != 0);
      uint64_t v6 = v41;
      uint64_t v5 = v42;
    }
    uint64_t v34 = v51;
    *(void *)(v50 + 8 * v26) = v28 | v27;
    unint64_t v35 = *(void *)(v23 + 48) + v29 * v25;
    uint64_t v16 = v23;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v45)(v35, v34, a2);
    uint64_t v37 = *(void *)(v23 + 16);
    BOOL v20 = __OFADD__(v37, 1);
    uint64_t v38 = v37 + 1;
    if (v20) {
      break;
    }
    *(void *)(v23 + 16) = v38;
LABEL_7:
    uint64_t v15 = v43;
    uint64_t v17 = v47;
    if (v47 == v44) {
      return v16;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_20C2AD2C4(uint64_t a1)
{
  return sub_20C2ACDA8(a1) & 1;
}

void ICStringFromCGColor_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "Could not get color space name from color %@", v2, v3, v4, v5, v6);
}

void ICCGColorCreateWithString_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "No strings from color string: %@", v2, v3, v4, v5, v6);
}

void ICCGColorCreateWithString_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "No color space from color string: %@", v2, v3, v4, v5, v6);
}

void ICCGColorCreateWithString_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "No component count in color string: %@", v2, v3, v4, v5, v6);
}

void ICCGColorCreateWithString_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [a1 count];
  OUTLINED_FUNCTION_1();
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_20C263000, a3, OS_LOG_TYPE_ERROR, "Color string component count (%zu) is different from the expected count for the color space (%zu) plus the alpha component", v5, 0x16u);
}

void ICDataFromCGImage_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20C263000, log, OS_LOG_TYPE_ERROR, "Failed to create CGImageDestinationRef", v1, 2u);
}

void ICDataFromCGImage_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "NSData *ICDataFromCGImage(CGImageRef, CFStringRef, NSDictionary *__strong)";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_20C263000, a2, OS_LOG_TYPE_ERROR, "%s -- Failed to finalize image with type '%@'.", (uint8_t *)&v2, 0x16u);
}

uint64_t __getUMUserManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getUMUserPersonaAttributesClass_block_invoke_cold_1(v0);
}

uint64_t __getUMUserPersonaAttributesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:](v0);
}

uint64_t __getPHPhotoLibraryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ICIndexItemsOperation main](v0);
}

void __getSYItemIndexingManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __71__ICLocalization_localizedFrameworkStringForKey_value_table_allowSiri___block_invoke_cold_1(v0);
}

void ICEnableSandboxMode_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_20C263000, log, OS_LOG_TYPE_FAULT, "Trying to enable sandbox mode after checking sandbox state — ignoring to prevent inconsistent app state", v1, 2u);
}

void ICEnableSandboxMode_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_20C263000, log, OS_LOG_TYPE_FAULT, "Trying to enable sandbox mode even though it's already enabled — ignoring", v1, 2u);
}

void __getCHSTimelineControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[NSData(Gzip) ic_gzipInflate](v0);
}

uint64_t sub_20C2B2620()
{
  return MEMORY[0x270EEE160]();
}

uint64_t sub_20C2B2630()
{
  return MEMORY[0x270EF0990]();
}

uint64_t sub_20C2B2640()
{
  return MEMORY[0x270EF0BB0]();
}

uint64_t sub_20C2B2650()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_20C2B2660()
{
  return MEMORY[0x270EF0D88]();
}

uint64_t sub_20C2B2670()
{
  return MEMORY[0x270EF0DB0]();
}

uint64_t sub_20C2B2680()
{
  return MEMORY[0x270EF0DD0]();
}

uint64_t sub_20C2B2690()
{
  return MEMORY[0x270EF0EE8]();
}

uint64_t sub_20C2B26A0()
{
  return MEMORY[0x270EF0FA8]();
}

uint64_t sub_20C2B26B0()
{
  return MEMORY[0x270EF1010]();
}

uint64_t sub_20C2B26C0()
{
  return MEMORY[0x270EF1068]();
}

uint64_t sub_20C2B26D0()
{
  return MEMORY[0x270EF1088]();
}

uint64_t sub_20C2B26E0()
{
  return MEMORY[0x270EF10B0]();
}

uint64_t sub_20C2B26F0()
{
  return MEMORY[0x270F2F878]();
}

uint64_t sub_20C2B2700()
{
  return MEMORY[0x270F2F8A8]();
}

uint64_t sub_20C2B2710()
{
  return MEMORY[0x270F2F8D0]();
}

uint64_t sub_20C2B2720()
{
  return MEMORY[0x270F2F908]();
}

uint64_t sub_20C2B2730()
{
  return MEMORY[0x270F2F940]();
}

uint64_t sub_20C2B2740()
{
  return MEMORY[0x270F2F968]();
}

uint64_t sub_20C2B2750()
{
  return MEMORY[0x270F2F988]();
}

uint64_t sub_20C2B2760()
{
  return MEMORY[0x270F2F9B0]();
}

uint64_t sub_20C2B2770()
{
  return MEMORY[0x270F2FA80]();
}

uint64_t sub_20C2B2780()
{
  return MEMORY[0x270F2FAA0]();
}

uint64_t sub_20C2B2790()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_20C2B27A0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_20C2B27B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_20C2B27C0()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_20C2B27D0()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_20C2B27E0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_20C2B27F0()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_20C2B2800()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_20C2B2810()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_20C2B2820()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_20C2B2830()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_20C2B2840()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_20C2B2850()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_20C2B2860()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_20C2B2870()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_20C2B2880()
{
  return MEMORY[0x270F9D990]();
}

uint64_t sub_20C2B2890()
{
  return MEMORY[0x270F9D9B0]();
}

uint64_t sub_20C2B28A0()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_20C2B28B0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_20C2B28C0()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_20C2B28D0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_20C2B28E0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_20C2B28F0()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_20C2B2900()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_20C2B2910()
{
  return MEMORY[0x270F9DCB0]();
}

uint64_t sub_20C2B2920()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_20C2B2930()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_20C2B2940()
{
  return MEMORY[0x270FA1EC8]();
}

uint64_t sub_20C2B2950()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_20C2B2960()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_20C2B2970()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_20C2B2980()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_20C2B29A0()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_20C2B29B0()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_20C2B29C0()
{
  return MEMORY[0x270EF1D58]();
}

uint64_t sub_20C2B29D0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_20C2B29E0()
{
  return MEMORY[0x270FA0C40]();
}

uint64_t sub_20C2B29F0()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_20C2B2A00()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_20C2B2A10()
{
  return MEMORY[0x270FA0D80]();
}

uint64_t sub_20C2B2A20()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_20C2B2A30()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_20C2B2A40()
{
  return MEMORY[0x270F9E3D0]();
}

uint64_t sub_20C2B2A50()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_20C2B2A60()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_20C2B2A70()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_20C2B2A80()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_20C2B2A90()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_20C2B2AA0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_20C2B2AB0()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_20C2B2AC0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_20C2B2AD0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_20C2B2AE0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_20C2B2AF0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_20C2B2B00()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_20C2B2B10()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_20C2B2B40()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_20C2B2B50()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_20C2B2B60()
{
  return MEMORY[0x270F9FC90]();
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x270EFB908](retstr, t);
}

BOOL CATransform3DIsAffine(CATransform3D *t)
{
  return MEMORY[0x270EFB920](t);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AD8](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AE0](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7AE8](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x270EE4A48](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
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

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x270EE5B60](a1, *(void *)&intent, color, options);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B90](space, pattern, components);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x270EE5B98](color1, color2);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x270EE5BC0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

void CGColorRelease(CGColorRef color)
{
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x270EE5C38](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C50]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C90](baseSpace);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x270EE5CC0]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D08](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D18](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
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

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGPatternRef CGPatternCreate(void *info, CGRect bounds, CGAffineTransform *matrix, CGFloat xStep, CGFloat yStep, CGPatternTiling tiling, BOOL isColored, const CGPatternCallbacks *callbacks)
{
  return (CGPatternRef)MEMORY[0x270EE7110](info, matrix, *(void *)&tiling, isColored, callbacks, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height, xStep, yStep);
}

void CGPatternRelease(CGPatternRef pattern)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
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

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x270EE7288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x270F95FD0]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x270F96010]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C58](range1.location, range1.length, range2.location, range2.length);
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x270EF2C70]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F055F0](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F05600](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x270F05620](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x270F05628](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x270F05630](target, callout, context);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x270F05640](target, runLoop, runLoopMode);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

uint64_t TUCallRecordingActivatable()
{
  return MEMORY[0x270F7CB20]();
}

uint64_t TUCallTranscriptionSupported()
{
  return MEMORY[0x270F7CB28]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
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

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

uint64_t archive_entry_copy_stat()
{
  return MEMORY[0x270F97D18]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x270F97D48]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x270F97D78]();
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x270F97D88]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x270F97DF0]();
}

uint64_t archive_entry_set_symlink()
{
  return MEMORY[0x270F97E10]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x270F97E58]();
}

uint64_t archive_read_close()
{
  return MEMORY[0x270F97E78]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x270F97E88]();
}

uint64_t archive_read_finish()
{
  return MEMORY[0x270F97ED8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x270F97EF0]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x270F97EF8]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x270F97F20]();
}

uint64_t archive_read_support_compression_all()
{
  return MEMORY[0x270F97F48]();
}

uint64_t archive_read_support_format_all()
{
  return MEMORY[0x270F97F68]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x270F97FA8]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x270F97FB0]();
}

uint64_t archive_write_data_block()
{
  return MEMORY[0x270F97FB8]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x270F97FC0]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x270F97FD0]();
}

uint64_t archive_write_finish()
{
  return MEMORY[0x270F97FD8]();
}

uint64_t archive_write_finish_entry()
{
  return MEMORY[0x270F97FE0]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x270F97FF0]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x270F97FF8]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x270F98018]();
}

uint64_t archive_write_set_compression_bzip2()
{
  return MEMORY[0x270F98028]();
}

uint64_t archive_write_set_compression_none()
{
  return MEMORY[0x270F98038]();
}

uint64_t archive_write_set_format_pax()
{
  return MEMORY[0x270F98070]();
}

uint64_t archive_write_set_format_zip()
{
  return MEMORY[0x270F98088]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B0](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void exit(int a1)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x270F9C740](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x270F9AAD0](p);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFC8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x270EDAFD0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_tryrdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFE0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x270EDB138](a1, a2, a3);
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_taskGroup_addPending()
{
  return MEMORY[0x270FA2448]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}