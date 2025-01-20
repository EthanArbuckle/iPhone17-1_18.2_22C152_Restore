void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id OUTLINED_FUNCTION_0_2(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t CallDirectoryLog()
{
  if (CallDirectoryLog_onceToken != -1) {
    dispatch_once(&CallDirectoryLog_onceToken, &__block_literal_global);
  }
  return CallDirectoryLog_sLog;
}

os_log_t __CallDirectoryLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.TelephonySettings", "CallDirectory");
  CallDirectoryLog_sLog = (uint64_t)result;
  return result;
}

void sub_1E4DD8484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPSSimStatusCacheClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SettingsCellularLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SettingsCellularLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6EB2218;
    uint64_t v6 = 0;
    SettingsCellularLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!SettingsCellularLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("PSSimStatusCache");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getPSSimStatusCacheClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPSSimStatusCacheClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SettingsCellularLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SettingsCellularLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E4DDD294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1E4DDD3DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _handleLLExtensionsChangedNotification(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = a3;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "Handling %@", (uint8_t *)&v6, 0xCu);
  }

  if (a2) {
    [a2 _updateExtensions];
  }
}

void sub_1E4DDE5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4DE00A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4DE27D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1E4DE2A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TPSLog()
{
  if (TPSLog_onceToken != -1) {
    dispatch_once(&TPSLog_onceToken, &__block_literal_global_3);
  }
  return TPSLog_sLog;
}

os_log_t __TPSLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.TelephonyPreferences", "default");
  TPSLog_sLog = (uint64_t)result;
  return result;
}

__CFString *TPSLocalizedPhoneNumberString(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = CFPhoneNumberCreate();
  if (!v5 || (int v6 = (const void *)v5, String = (__CFString *)CFPhoneNumberCreateString(), CFRelease(v6), !String)) {
    String = &stru_1F40BEF98;
  }
  uint64_t v8 = TPSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = v3;
    __int16 v12 = 2112;
    v13 = String;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, "Localized '%@' to '%@' using ISO country code '%@'.", (uint8_t *)&v10, 0x20u);
  }

  return String;
}

__CFString *TPSNormalizedPhoneNumberString(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = CFPhoneNumberCreate();
  if (!v5 || (int v6 = (const void *)v5, String = (__CFString *)CFPhoneNumberCreateString(), CFRelease(v6), !String)) {
    String = &stru_1F40BEF98;
  }
  uint64_t v8 = TPSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = v3;
    __int16 v12 = 2112;
    v13 = String;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, "Normalized '%@' to '%@' using ISO country code '%@'.", (uint8_t *)&v10, 0x20u);
  }

  return String;
}

uint64_t CTCallingLineIdRestrictionValueForState(uint64_t a1)
{
  if (a1 == 2) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 3;
  }
  if (a1 == 1) {
    return 0;
  }
  else {
    return v1;
  }
}

uint64_t TPSCallingLineIdRestrictionStateForValue(int a1)
{
  if (a1) {
    return 2 * (a1 == 1);
  }
  else {
    return 1;
  }
}

JSValueRef provisioningDone(JSContextRef ctx, int a2, JSValueRef value)
{
  if (!value) {
    goto LABEL_6;
  }
  uint64_t v5 = (OpaqueJSClass *)CloudCallingWebViewController_controllerClass;
  if (!CloudCallingWebViewController_controllerClass)
  {
    uint64_t v5 = JSClassCreate(&CloudCallingWebViewController_classDefinition);
    CloudCallingWebViewController_controllerClass = (uint64_t)v5;
  }
  if (JSValueIsObjectOfClass(ctx, value, v5))
  {
    int v6 = JSObjectGetPrivate(value);
    uint64_t v7 = WebThreadMakeNSInvocation();
    WebThreadCallDelegate();

    JSValueRef Undefined = JSValueMakeUndefined(ctx);
    return Undefined;
  }
  else
  {
LABEL_6:
    return JSValueMakeUndefined(ctx);
  }
}

JSValueRef provisioningCanceled(JSContextRef ctx, int a2, JSValueRef value)
{
  if (!value) {
    goto LABEL_6;
  }
  uint64_t v5 = (OpaqueJSClass *)CloudCallingWebViewController_controllerClass;
  if (!CloudCallingWebViewController_controllerClass)
  {
    uint64_t v5 = JSClassCreate(&CloudCallingWebViewController_classDefinition);
    CloudCallingWebViewController_controllerClass = (uint64_t)v5;
  }
  if (JSValueIsObjectOfClass(ctx, value, v5))
  {
    int v6 = JSObjectGetPrivate(value);
    uint64_t v7 = WebThreadMakeNSInvocation();
    WebThreadCallDelegate();

    JSValueRef Undefined = JSValueMakeUndefined(ctx);
    return Undefined;
  }
  else
  {
LABEL_6:
    return JSValueMakeUndefined(ctx);
  }
}

void sub_1E4DEF6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4DEF820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getOBPrivacyLinkControllerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("OBPrivacyLinkController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getOBPrivacyLinkControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getOBPrivacyLinkControllerClass_block_invoke_cold_1();
    OnBoardingKitLibrary();
  }
}

void OnBoardingKitLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __OnBoardingKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6EB2608;
    uint64_t v3 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __OnBoardingKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary = result;
  return result;
}

TPSSetCallWaitingRequest *__getOBPrivacyPresenterClass_block_invoke(uint64_t a1)
{
  OnBoardingKitLibrary();
  uint64_t result = (TPSSetCallWaitingRequest *)objc_getClass("OBPrivacyPresenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getOBPrivacyPresenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (TPSSetCallWaitingRequest *)__getOBPrivacyPresenterClass_block_invoke_cold_1();
    return [(TPSSetCallWaitingRequest *)v3 initWithSubscriptionContext:v5];
  }
  return result;
}

void sub_1E4DF1E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4DF2238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4DF2660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1E4DF2C24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

__CFString *TPSStringForCTSuppServicesEventType(unsigned int a1)
{
  if (a1 > 6) {
    return 0;
  }
  else {
    return off_1E6EB2710[a1];
  }
}

__CFString *TPSStringForCTSuppServicesSettingsType(unsigned int a1)
{
  if (a1 > 0xB) {
    return 0;
  }
  else {
    return off_1E6EB2748[a1];
  }
}

__CFString *TPSStringForCTCallForwardingReason(unsigned int a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return off_1E6EB27A8[a1];
  }
}

__CFString *TPSStringForCTCallingLineIdRestrictionValue(unsigned int a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_1E6EB27D8[a1];
  }
}

uint64_t TPSCallForwardingLog()
{
  if (TPSCallForwardingLog_onceToken != -1) {
    dispatch_once(&TPSCallForwardingLog_onceToken, &__block_literal_global_5);
  }
  return TPSCallForwardingLog_sLog;
}

os_log_t __TPSCallForwardingLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.TelephonySettings", "CallForwarding");
  TPSCallForwardingLog_sLog = (uint64_t)result;
  return result;
}

void sub_1E4DF67D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4DF696C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1E4DF6E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4DF72D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4DF7884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPSSimStatusCacheClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SettingsCellularLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SettingsCellularLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6EB2890;
    uint64_t v6 = 0;
    SettingsCellularLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SettingsCellularLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("PSSimStatusCache");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getPSSimStatusCacheClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPSSimStatusCacheClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SettingsCellularLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SettingsCellularLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1E4DF86BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

void sub_1E4DF9598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4DF98DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1E4DF9E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4DFA248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4DFF03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

uint64_t sub_1E4E0161C()
{
  uint64_t result = sub_1E4E0C618();
  qword_1EAE982F8 = result;
  return result;
}

id static LiveLookupManagerProxy.LLExtensionsChangedNotification.getter()
{
  if (qword_1EAE982F0 != -1) {
    swift_once();
  }
  v0 = (void *)qword_1EAE982F8;
  return v0;
}

uint64_t LiveLookupManagerProxy.extensions()()
{
  swift_beginAccess();
  swift_retain();
  uint64_t v0 = sub_1E4E0C278();
  swift_release();
  return v0;
}

id LiveLookupManagerProxy.extensionName(_:)(void *a1)
{
  id result = objc_msgSend(a1, sel_identifier);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_1E4E0C538();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id LiveLookupManagerProxy.extensionEnabled(_:)(void *a1)
{
  return objc_msgSend(a1, sel_isEnabled);
}

uint64_t LiveLookupManagerProxy.set(enabled:for:)(char a1, uint64_t a2)
{
  *(void *)(v3 + 40) = a2;
  *(void *)(v3 + 48) = v2;
  *(unsigned char *)(v3 + 80) = a1;
  return MEMORY[0x1F4188298](sub_1E4E0195C, 0, 0);
}

uint64_t sub_1E4E0195C()
{
  unsigned int v1 = (void *)(*(void *)(v0 + 48) + OBJC_IVAR___LiveLookupManagerProxy_manager);
  swift_beginAccess();
  *(void *)(v0 + 56) = *v1;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))((int)*MEMORY[0x1E4F2F2E8] + MEMORY[0x1E4F2F2E8]);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  void *v2 = v0;
  v2[1] = sub_1E4E01A44;
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 80);
  return v6(v4, v3);
}

uint64_t sub_1E4E01A44()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1E4E01B80, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1E4E01B80()
{
  swift_release();
  unsigned int v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E4E01D68(char a1, void *a2, void *aBlock, void *a4)
{
  *(void *)(v4 + 40) = a2;
  *(void *)(v4 + 48) = a4;
  *(unsigned char *)(v4 + 88) = a1;
  *(void *)(v4 + 56) = _Block_copy(aBlock);
  id v7 = a2;
  id v8 = a4;
  return MEMORY[0x1F4188298](sub_1E4E01DF8, 0, 0);
}

uint64_t sub_1E4E01DF8()
{
  unsigned int v1 = (void *)(*(void *)(v0 + 48) + OBJC_IVAR___LiveLookupManagerProxy_manager);
  swift_beginAccess();
  *(void *)(v0 + 64) = *v1;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))((int)*MEMORY[0x1E4F2F2E8] + MEMORY[0x1E4F2F2E8]);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  void *v2 = v0;
  v2[1] = sub_1E4E01EE0;
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 88);
  return v6(v4, v3);
}

uint64_t sub_1E4E01EE0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1E4E02050, 0, 0);
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 56);
    uint64_t v5 = *(void **)(v2 + 40);
    uint64_t v4 = *(void **)(v2 + 48);
    swift_release();

    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    _Block_release(*(const void **)(v2 + 56));
    uint64_t v6 = *(uint64_t (**)(void))(v2 + 8);
    return v6();
  }
}

uint64_t sub_1E4E02050()
{
  unsigned int v1 = *(void **)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v4 = *(void **)(v0 + 40);
  uint64_t v3 = *(void **)(v0 + 48);
  swift_release();

  uint64_t v5 = (void *)sub_1E4E0C1E8();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);

  _Block_release(*(const void **)(v0 + 56));
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

Swift::Void __swiftcall LiveLookupManagerProxy.set(prioritizedExtensionIdentifiers:)(Swift::OpaquePointer prioritizedExtensionIdentifiers)
{
}

id LiveLookupManagerProxy.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id LiveLookupManagerProxy.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR___LiveLookupManagerProxy_manager;
  sub_1E4E0C2A8();
  uint64_t v3 = v0;
  *(void *)&v0[v2] = sub_1E4E0C298();

  v5.receiver = v3;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

id LiveLookupManagerProxy.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LiveLookupManagerProxy()
{
  return self;
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

uint64_t sub_1E4E023D4()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E4E0241C()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = *(void **)(v0 + 32);
  objc_super v5 = *(void **)(v0 + 40);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1E4E024E0;
  uint64_t v7 = (uint64_t (*)(char, void *, void *, void *))((char *)&dword_1EAE98068 + dword_1EAE98068);
  return v7(v2, v3, v4, v5);
}

uint64_t sub_1E4E024E0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1E4E025D4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1E4E02E08;
  return v6();
}

uint64_t sub_1E4E026A4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  objc_super v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *objc_super v5 = v1;
  v5[1] = sub_1E4E02E08;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EAE98078 + dword_1EAE98078);
  return v6(v2, v3, v4);
}

uint64_t sub_1E4E02764(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  objc_super v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *objc_super v5 = v4;
  v5[1] = sub_1E4E02E08;
  return v7();
}

uint64_t objectdestroy_6Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E4E02874(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1E4E02E08;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EAE98088 + dword_1EAE98088);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1E4E02940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E4E0C5B8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1E4E0C5A8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1E4E02AE4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1E4E0C598();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1E4E02AE4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98060);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E4E02B44(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1E4E02C20;
  return v6(a1);
}

uint64_t sub_1E4E02C20()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1E4E02D18()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E4E02D50(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E4E024E0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EAE98098 + dword_1EAE98098);
  return v6(a1, v4);
}

uint64_t type metadata accessor for ExtensionObserver()
{
  return self;
}

uint64_t sub_1E4E02E30()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E4E02E68(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 88) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E4E02EB0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1E4E02F04()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E4E02F3C(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 96) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E4E02F84())()
{
  return j__swift_endAccess;
}

uint64_t sub_1E4E02FDC@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_1E4E03028(v1 + 104, a1);
}

uint64_t sub_1E4E03028(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE980A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4E03090(uint64_t a1)
{
  swift_beginAccess();
  sub_1E4E030E4(a1, v1 + 104);
  return swift_endAccess();
}

uint64_t sub_1E4E030E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE980A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1E4E0314C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1E4E031A0@<X0>(void *a1@<X8>)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F19188]), sel_init);
  uint64_t result = sub_1E4E04A28(0, &qword_1EAE980B0);
  a1[3] = result;
  a1[4] = &off_1F40BEEB0;
  *a1 = v2;
  return result;
}

uint64_t sub_1E4E0320C(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_1E4E0324C(a1);
  return v2;
}

uint64_t sub_1E4E0324C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x1E4FBC870];
  *(void *)(v1 + 16) = MEMORY[0x1E4FBC870];
  type metadata accessor for ExtensionObserver();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v7 = sub_1E4E0C1D8();
  uint64_t v9 = v8;

  *(void *)(v2 + 72) = v7;
  *(void *)(v2 + 80) = v9;
  *(void *)(v2 + 88) = v4;
  *(void *)(v2 + 96) = v4;
  *(_OWORD *)(v2 + 104) = 0u;
  *(_OWORD *)(v2 + 120) = 0u;
  *(void *)(v2 + 136) = 0;
  sub_1E4E0553C(a1, v2 + 24);
  type metadata accessor for LiveLookupManagerProxy();
  *(void *)(v2 + 64) = LiveLookupManagerProxy.__allocating_init()();
  sub_1E4E0C558();
  uint64_t v10 = (__CFString *)sub_1E4E0C528();
  swift_bridgeObjectRelease();
  id v11 = CFNotificationCenterGetDarwinNotifyCenter();
  swift_retain();
  CFNotificationCenterAddObserver(v11, (const void *)v2, (CFNotificationCallback)sub_1E4E039A4, v10, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  __int16 v12 = (void *)sub_1E4E0C618();
  sub_1E4E0C538();

  v13 = (__CFString *)sub_1E4E0C528();
  swift_bridgeObjectRelease();
  __int16 v14 = CFNotificationCenterGetDarwinNotifyCenter();
  swift_retain();
  CFNotificationCenterAddObserver(v14, (const void *)v2, (CFNotificationCallback)sub_1E4E039A8, v13, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

uint64_t sub_1E4E03448()
{
  uint64_t v1 = sub_1E4E03BC4();
  (*(void (**)(uint64_t))(*(void *)v0 + 344))(v1);
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v0 + 320);
  return v2();
}

uint64_t sub_1E4E034D0()
{
  sub_1E4E04A28(0, &qword_1EAE980B8);
  uint64_t v0 = (void *)sub_1E4E0C5F8();
  uint64_t v1 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_1E4E0408C;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E4E03960;
  aBlock[3] = &block_descriptor;
  uint64_t v2 = _Block_copy(aBlock);
  swift_release();
  uint64_t v3 = sub_1E4E0C518();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790]();
  id v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4E0C508();
  uint64_t v7 = sub_1E4E0C4F8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1E4E043C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE980C8);
  sub_1E4E04414();
  sub_1E4E0C638();
  MEMORY[0x1E4E8E5F0](0, v6, v10, v2);
  _Block_release(v2);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1E4E03760(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v18 = a2;
  uint64_t v4 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    id v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1E4E04A64(&v17, v12, v13);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1E4E038E0(uint64_t a1)
{
  uint64_t result = sub_1E4E055A0(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  uint64_t v5 = sub_1E4E05640(result, v3, 0, a1);
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_1E4E03960(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1E4E039AC(uint64_t result, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    unint64_t v7 = (void *)result;
    type metadata accessor for ExtensionObserver();
    swift_unknownObjectRetain();
    id v8 = v7;
    id v9 = a3;
    id v10 = a5;
    uint64_t v11 = swift_dynamicCastClass();
    if (v11) {
      (*(void (**)(void))(*(void *)v11 + 312))();
    }

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1E4E03AC8()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = MEMORY[0x1E4FBC870];
  sub_1E4E0553C(v0 + 24, (uint64_t)v7);
  uint64_t v2 = v8;
  uint64_t v3 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = v0;
  uint64_t v5 = *(void (**)(id (*)(unint64_t, id), uint64_t, uint64_t, uint64_t))(v3 + 8);
  swift_retain();
  swift_retain();
  v5(sub_1E4E04574, v4, v2, v3);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return swift_release();
}

uint64_t sub_1E4E03BC4()
{
  uint64_t v1 = v0;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v39 = MEMORY[0x1E4FBC870];
  id v2 = *(id *)(v0 + 64);
  unint64_t v3 = LiveLookupManagerProxy.extensions()();

  if (v3 >> 62) {
    goto LABEL_19;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  for (i = &off_1E4E10000; v4; i = &off_1E4E10000)
  {
    uint64_t v37 = v1;
    unint64_t v6 = v3 & 0xC000000000000001;
    uint64_t v7 = 4;
    uint64_t v8 = &selRef_selectionMode;
    while (1)
    {
      id v9 = v6 ? (id)MEMORY[0x1E4E8E660](v7 - 4, v3) : *(id *)(v3 + 8 * v7);
      id v10 = v9;
      uint64_t v1 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      if ([v9 v8[452]])
      {
        id v11 = objc_msgSend(v10, sel_identifier);
        if (v11)
        {
          sub_1E4E0C538();

          id v11 = (id)sub_1E4E0C528();
          swift_bridgeObjectRelease();
        }
        uint64_t v12 = self;
        id v38 = 0;
        id v13 = objc_msgSend(v12, sel_extensionWithIdentifier_error_, v11, &v38);

        id v14 = v38;
        if (!v13)
        {
          id v25 = v38;
          v26 = (void *)sub_1E4E0C1F8(v14);

          swift_willThrow();
          swift_bridgeObjectRelease();
          sub_1E4E0C5C8();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE980D8);
          uint64_t v27 = swift_allocObject();
          i = &off_1E4E10000;
          *(_OWORD *)(v27 + 16) = xmmword_1E4E10750;
          swift_getErrorValue();
          uint64_t v28 = sub_1E4E0C6D8();
          uint64_t v30 = v29;
          *(void *)(v27 + 56) = MEMORY[0x1E4FBB1A0];
          *(void *)(v27 + 64) = sub_1E4E04C14();
          *(void *)(v27 + 32) = v28;
          *(void *)(v27 + 40) = v30;
          sub_1E4E04A28(0, &qword_1EAE980F0);
          v31 = (void *)sub_1E4E0C628();
          sub_1E4E0C2D8();
          swift_bridgeObjectRelease();

          uint64_t v1 = v37;
          goto LABEL_21;
        }
        uint64_t v15 = v4;
        unint64_t v16 = v6;
        unint64_t v17 = v3;
        uint64_t v18 = v8;
        id v19 = v38;
        id v20 = objc_msgSend(v13, sel_localizedContainingAppName);
        if (!v20) {
          __break(1u);
        }
        v21 = v20;
        uint64_t v22 = sub_1E4E0C538();
        uint64_t v24 = v23;

        sub_1E4E04A64((uint64_t *)&v38, v22, v24);
        swift_bridgeObjectRelease();
        uint64_t v8 = v18;
        unint64_t v3 = v17;
        unint64_t v6 = v16;
        uint64_t v4 = v15;
        uint64_t v1 = v7 - 3;
      }
      else
      {
      }
      ++v7;
      if (v1 == v4)
      {
        swift_bridgeObjectRelease();
        uint64_t v1 = v37;
        i = &off_1E4E10000;
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1E4E0C698();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
LABEL_21:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE980D8);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = *((_OWORD *)i + 117);
  uint64_t v33 = v39;
  *(void *)(v32 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE980E0);
  *(void *)(v32 + 64) = sub_1E4E049D8();
  *(void *)(v32 + 32) = v33;
  sub_1E4E04A28(0, &qword_1EAE980F0);
  swift_bridgeObjectRetain();
  v34 = (void *)sub_1E4E0C628();
  sub_1E4E0C5E8();
  sub_1E4E0C2D8();
  swift_bridgeObjectRelease();

  uint64_t v35 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 264))(v33);
  return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 320))(v35);
}

uint64_t sub_1E4E04054()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E4E0408C()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = (*(uint64_t (**)(void))(*(void *)result + 232))();
    uint64_t v3 = (*(uint64_t (**)(void))(*v1 + 256))();
    v1[2] = sub_1E4E03760(v3, v2);
    swift_bridgeObjectRelease();
    uint64_t v4 = v1[2];
    uint64_t v5 = *(void *)(v4 + 16);
    if (v5 == 1)
    {
      uint64_t v11 = sub_1E4E038E0(v4);
      if (v12)
      {
LABEL_8:
        uint64_t v8 = v11;
        uint64_t v10 = v12;
LABEL_9:
        v1[9] = v8;
        v1[10] = v10;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE980D8);
        uint64_t v13 = swift_allocObject();
        *(_OWORD *)(v13 + 16) = xmmword_1E4E10750;
        *(void *)(v13 + 56) = MEMORY[0x1E4FBB1A0];
        *(void *)(v13 + 64) = sub_1E4E04C14();
        *(void *)(v13 + 32) = v8;
        *(void *)(v13 + 40) = v10;
        sub_1E4E04A28(0, &qword_1EAE980F0);
        swift_bridgeObjectRetain();
        id v14 = (void *)sub_1E4E0C628();
        sub_1E4E0C5E8();
        sub_1E4E0C2D8();

        uint64_t v15 = swift_bridgeObjectRelease();
        (*(void (**)(void *__return_ptr, uint64_t))(*v1 + 280))(v21, v15);
        if (v21[3])
        {
          sub_1E4E0553C((uint64_t)v21, (uint64_t)v18);
          sub_1E4E04910((uint64_t)v21);
          uint64_t v16 = v19;
          uint64_t v17 = v20;
          __swift_project_boxed_opaque_existential_1(v18, v19);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 8))(v8, v10, v16, v17);
          swift_release();
          swift_bridgeObjectRelease();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_release();
          return sub_1E4E04910((uint64_t)v21);
        }
      }
      __break(1u);
    }
    else if (!v5)
    {
      type metadata accessor for ExtensionObserver();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
      uint64_t v8 = sub_1E4E0C1D8();
      uint64_t v10 = v9;

      goto LABEL_9;
    }
    v21[0] = v5;
    uint64_t v11 = sub_1E4E0C6A8();
    goto LABEL_8;
  }
  return result;
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

unint64_t sub_1E4E043C8()
{
  unint64_t result = qword_1EAE980C0;
  if (!qword_1EAE980C0)
  {
    sub_1E4E0C4F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE980C0);
  }
  return result;
}

unint64_t sub_1E4E04414()
{
  unint64_t result = qword_1EAE980D0;
  if (!qword_1EAE980D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE980C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE980D0);
  }
  return result;
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

uint64_t sub_1E4E044B8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1E4E04534()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id sub_1E4E04574(unint64_t a1, id a2)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 24);
  if (a2)
  {
    id v7 = a2;
    sub_1E4E0C5C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE980D8);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1E4E10750;
    swift_getErrorValue();
    uint64_t v9 = sub_1E4E0C6D8();
    uint64_t v11 = v10;
    *(void *)(v8 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v8 + 64) = sub_1E4E04C14();
    *(void *)(v8 + 32) = v9;
    *(void *)(v8 + 40) = v11;
    sub_1E4E04A28(0, &qword_1EAE980F0);
    uint64_t v12 = (void *)sub_1E4E0C628();
    sub_1E4E0C2D8();

    swift_bridgeObjectRelease();
  }
  uint64_t v30 = (uint64_t *)(v4 + 16);
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v29 = v5;
  if (a1 >> 62)
  {
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1E4E0C698();
    if (v13) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
  uint64_t v13 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v13)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v5 = v29;
LABEL_19:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE980D8);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_1E4E10750;
    swift_beginAccess();
    uint64_t v24 = *v30;
    *(void *)(v23 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE980E0);
    *(void *)(v23 + 64) = sub_1E4E049D8();
    *(void *)(v23 + 32) = v24;
    sub_1E4E04A28(0, &qword_1EAE980F0);
    swift_bridgeObjectRetain();
    id v25 = (void *)sub_1E4E0C628();
    sub_1E4E0C5E8();
    sub_1E4E0C2D8();

    swift_bridgeObjectRelease();
    swift_beginAccess();
    v26 = *(uint64_t (**)(uint64_t))(*(void *)v5 + 240);
    uint64_t v27 = swift_bridgeObjectRetain();
    uint64_t v28 = v26(v27);
    return (id)(*(uint64_t (**)(uint64_t))(*(void *)v5 + 320))(v28);
  }
LABEL_6:
  uint64_t v14 = 4;
  while (1)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v15 = (id)MEMORY[0x1E4E8E660](v14 - 4, a1);
    }
    else {
      id v15 = *(id *)(a1 + 8 * v14);
    }
    uint64_t v16 = v15;
    uint64_t v17 = v14 - 3;
    if (__OFADD__(v14 - 4, 1))
    {
      __break(1u);
      goto LABEL_17;
    }
    if (objc_msgSend(v15, sel_state) == (id)4) {
      break;
    }

LABEL_8:
    ++v14;
    if (v17 == v13) {
      goto LABEL_18;
    }
  }
  id result = objc_msgSend(v16, sel_localizedContainingAppName);
  if (result)
  {
    uint64_t v19 = result;
    uint64_t v20 = sub_1E4E0C538();
    uint64_t v22 = v21;

    swift_beginAccess();
    sub_1E4E04A64(&v31, v20, v22);
    swift_endAccess();

    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t sub_1E4E04910(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE980A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E4E04970()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E4E04910(v0 + 104);
  return MEMORY[0x1F4186488](v0, 144, 7);
}

unint64_t sub_1E4E049D8()
{
  unint64_t result = qword_1EAE980E8;
  if (!qword_1EAE980E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE980E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE980E8);
  }
  return result;
}

uint64_t sub_1E4E04A28(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1E4E04A64(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1E4E0C6E8();
  swift_bridgeObjectRetain();
  sub_1E4E0C548();
  uint64_t v8 = sub_1E4E0C6F8();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1E4E0C6B8() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1E4E0C6B8() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1E4E04F3C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t sub_1E4E04C14()
{
  unint64_t result = qword_1EAE980F8;
  if (!qword_1EAE980F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE980F8);
  }
  return result;
}

uint64_t sub_1E4E04C5C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98100);
  uint64_t v3 = sub_1E4E0C658();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_1E4E0C6E8();
      sub_1E4E0C548();
      uint64_t result = sub_1E4E0C6F8();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1E4E04F3C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1E4E04C5C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_1E4E050D8();
      goto LABEL_22;
    }
    sub_1E4E0528C();
  }
  uint64_t v11 = *v4;
  sub_1E4E0C6E8();
  sub_1E4E0C548();
  uint64_t result = sub_1E4E0C6F8();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1E4E0C6B8(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1E4E0C6C8();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_1E4E0C6B8();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_1E4E050D8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98100);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1E4E0C648();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1E4E0528C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98100);
  uint64_t v3 = sub_1E4E0C658();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1E4E0C6E8();
    swift_bridgeObjectRetain();
    sub_1E4E0C548();
    uint64_t result = sub_1E4E0C6F8();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1E4E0553C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1E4E055A0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1E4E05640(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 48) + 16 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_1E4E05698(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  v6[4] = a1;
  v6[5] = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_1E4E0574C;
  v6[3] = &block_descriptor_0;
  uint64_t v4 = _Block_copy(v6);
  swift_retain();
  objc_msgSend(v3, sel_extensionsWithCompletionHandler_, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_1E4E0574C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  char v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_1E4E057F8();
    uint64_t v4 = sub_1E4E0C588();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_1E4E057F8()
{
  unint64_t result = qword_1EAE98108;
  if (!qword_1EAE98108)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAE98108);
  }
  return result;
}

unint64_t DefaultSpamFilterSettingsProvider.id.getter()
{
  return 0xD000000000000025;
}

uint64_t type metadata accessor for DefaultSpamFilterSettingsProvider()
{
  uint64_t result = qword_1EAE984B0;
  if (!qword_1EAE984B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t DefaultSpamFilterSettingsProvider.localizedTitle.getter()
{
  swift_getKeyPath();
  sub_1E4E07524(&qword_1EAE98110, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterSettingsProvider);
  sub_1E4E0C218();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1E4E05964@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1E4E07524(&qword_1EAE98110, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterSettingsProvider);
  sub_1E4E0C218();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  *a2 = *(void *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E4E05A24()
{
  return swift_bridgeObjectRelease();
}

uint64_t DefaultSpamFilterSettingsProvider.localizedTitle.setter()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4E05BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4E05C48()
{
  return sub_1E4E05BE4(v0[2], v0[3], v0[4]);
}

void (*DefaultSpamFilterSettingsProvider.localizedTitle.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC20TelephonyPreferences33DefaultSpamFilterSettingsProvider___observationRegistrar;
  *uint64_t v3 = v1;
  v3[5] = sub_1E4E07524(&qword_1EAE98110, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterSettingsProvider);
  sub_1E4E0C218();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_1E4E0C238();
  swift_release();
  swift_beginAccess();
  return sub_1E4E05DA0;
}

void sub_1E4E05DA0(void **a1)
{
}

uint64_t DefaultSpamFilterSettingsProvider.localizedDetail.getter()
{
  swift_getKeyPath();
  sub_1E4E07524(&qword_1EAE98110, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterSettingsProvider);
  sub_1E4E0C218();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1E4E05E70@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1E4E07524(&qword_1EAE98110, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterSettingsProvider);
  sub_1E4E0C218();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 40);
  *a2 = *(void *)(v3 + 32);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E4E05F30()
{
  return swift_bridgeObjectRelease();
}

uint64_t DefaultSpamFilterSettingsProvider.localizedDetail.setter()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4E060F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 32) = a2;
  *(void *)(a1 + 40) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4E06154()
{
  return sub_1E4E060F0(v0[2], v0[3], v0[4]);
}

void (*DefaultSpamFilterSettingsProvider.localizedDetail.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC20TelephonyPreferences33DefaultSpamFilterSettingsProvider___observationRegistrar;
  *uint64_t v3 = v1;
  v3[5] = sub_1E4E07524(&qword_1EAE98110, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterSettingsProvider);
  sub_1E4E0C218();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_1E4E0C238();
  swift_release();
  swift_beginAccess();
  return sub_1E4E062AC;
}

void sub_1E4E062AC(void **a1)
{
}

uint64_t DefaultSpamFilterSettingsProvider.localizedNavigationTitle.getter()
{
  swift_getKeyPath();
  sub_1E4E07524(&qword_1EAE98110, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterSettingsProvider);
  sub_1E4E0C218();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1E4E0637C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1E4E07524(&qword_1EAE98110, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterSettingsProvider);
  sub_1E4E0C218();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 56);
  *a2 = *(void *)(v3 + 48);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E4E0643C()
{
  return swift_bridgeObjectRelease();
}

uint64_t DefaultSpamFilterSettingsProvider.localizedNavigationTitle.setter()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4E065FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 48) = a2;
  *(void *)(a1 + 56) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4E06660()
{
  return sub_1E4E065FC(v0[2], v0[3], v0[4]);
}

void (*DefaultSpamFilterSettingsProvider.localizedNavigationTitle.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC20TelephonyPreferences33DefaultSpamFilterSettingsProvider___observationRegistrar;
  *uint64_t v3 = v1;
  v3[5] = sub_1E4E07524(&qword_1EAE98110, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterSettingsProvider);
  sub_1E4E0C218();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_1E4E0C238();
  swift_release();
  swift_beginAccess();
  return sub_1E4E067B8;
}

void sub_1E4E067B8(void **a1)
{
}

void sub_1E4E067C4(void **a1)
{
  uint64_t v1 = *a1;
  swift_endAccess();
  *uint64_t v1 = v1[3];
  swift_getKeyPath();
  sub_1E4E0C228();
  swift_release();
  free(v1);
}

uint64_t sub_1E4E06840()
{
  return swift_retain();
}

uint64_t sub_1E4E068E4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1E4E07524(&qword_1EAE98110, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterSettingsProvider);
  sub_1E4E0C218();
  swift_release();
  *a2 = *(void *)(v3 + 64);
  return swift_retain();
}

uint64_t sub_1E4E06990()
{
  return swift_release();
}

uint64_t DefaultSpamFilterSettingsProvider.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  DefaultSpamFilterSettingsProvider.init()();
  return v0;
}

void *DefaultSpamFilterSettingsProvider.init()()
{
  uint64_t v1 = v0;
  uint64_t v22 = *v0;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v5 = sub_1E4E0C1D8();
  uint64_t v7 = v6;

  v1[2] = v5;
  v1[3] = v7;
  id v8 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v9 = sub_1E4E0C1D8();
  uint64_t v11 = v10;

  v1[4] = v9;
  v1[5] = v11;
  id v12 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v13 = sub_1E4E0C1D8();
  uint64_t v15 = v14;

  void v1[6] = v13;
  v1[7] = v15;
  sub_1E4E0C248();
  type metadata accessor for ExtensionObserver();
  sub_1E4E031A0(v23);
  v1[8] = sub_1E4E0320C((uint64_t)v23);
  swift_getKeyPath();
  v23[0] = v1;
  sub_1E4E07524(&qword_1EAE98110, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterSettingsProvider);
  sub_1E4E0C218();
  swift_release();
  uint64_t v16 = v1[8];
  v23[3] = v22;
  v23[4] = &off_1F40BEEE8;
  v23[0] = v1;
  unint64_t v17 = *(void (**)(void *))(*(void *)v16 + 288);
  swift_retain();
  swift_retain();
  v17(v23);
  swift_release();
  swift_getKeyPath();
  v23[0] = v1;
  sub_1E4E0C218();
  swift_release();
  int64_t v18 = *(void (**)(uint64_t))(*(void *)v1[8] + 312);
  uint64_t v19 = swift_retain();
  v18(v19);
  swift_release();
  id v20 = objc_msgSend(self, sel_defaultCenter, 0xE000000000000000);
  objc_msgSend(v20, sel_addObserver_selector_name_object_, v1, sel_updateExtensions, *MEMORY[0x1E4FB2730], 0);

  return v1;
}

char *DefaultSpamFilterSettingsProvider.deinit()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  uint64_t v2 = CFNotificationCenterGetDarwinNotifyCenter();
  swift_retain();
  CFNotificationCenterRemoveEveryObserver(v2, v0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = &v0[OBJC_IVAR____TtC20TelephonyPreferences33DefaultSpamFilterSettingsProvider___observationRegistrar];
  uint64_t v4 = sub_1E4E0C258();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t DefaultSpamFilterSettingsProvider.__deallocating_deinit()
{
  DefaultSpamFilterSettingsProvider.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1E4E07098()
{
  return sub_1E4E07524(&qword_1EAE98118, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterSettingsProvider);
}

uint64_t sub_1E4E070E0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1E4E070FC()
{
  return 0xD000000000000025;
}

uint64_t sub_1E4E07118()
{
  return sub_1E4E0C2C8() & 1;
}

uint64_t sub_1E4E07134()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_1E4E07524(&qword_1EAE98110, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterSettingsProvider);
  sub_1E4E0C218();
  swift_release();
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1E4E071F8()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_1E4E07524(&qword_1EAE98110, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterSettingsProvider);
  sub_1E4E0C218();
  swift_release();
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 32);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1E4E072BC()
{
  return sub_1E4E0C2B8();
}

uint64_t sub_1E4E072D8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4E073C8()
{
  return MEMORY[0x1E4FBB1B0];
}

void sub_1E4E073D4(void *a1@<X8>)
{
  *a1 = 0xD000000000000025;
  a1[1] = 0x80000001E4E12BC0;
}

uint64_t sub_1E4E073F4()
{
  return type metadata accessor for DefaultSpamFilterSettingsProvider();
}

uint64_t sub_1E4E073FC()
{
  uint64_t result = sub_1E4E0C258();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for DefaultSpamFilterSettingsProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DefaultSpamFilterSettingsProvider);
}

uint64_t dispatch thunk of DefaultSpamFilterSettingsProvider.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_1E4E074DC()
{
  return sub_1E4E07524((unint64_t *)&unk_1EAE98120, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterView);
}

uint64_t sub_1E4E07524(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1E4E0756C()
{
  *(void *)(*(void *)(v0 + 16) + 64) = *(void *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_1E4E075A8()
{
  return sub_1E4E06154();
}

uint64_t sub_1E4E075C0()
{
  return sub_1E4E06660();
}

uint64_t sub_1E4E075D8()
{
  return sub_1E4E05C48();
}

uint64_t sub_1E4E075F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98130);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4E0A9D4(v2, (uint64_t)v5, &qword_1EAE98130);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_1E4E0AB0C((uint64_t)v5, a1, &qword_1EAE98150);
  }
  os_log_type_t v7 = sub_1E4E0C5D8();
  id v8 = sub_1E4E0C3F8();
  if (os_log_type_enabled(v8, v7))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v16 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    *(void *)(v9 + 4) = sub_1E4E0AA38(0xD00000000000001BLL, 0x80000001E4E12DA0, &v16);
    _os_log_impl(&dword_1E4DD4000, v8, v7, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E4E8F050](v10, -1, -1);
    MEMORY[0x1E4E8F050](v9, -1, -1);
  }

  uint64_t v11 = sub_1E4E0C358();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v14 = (char *)&v15 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4E0C348();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_1E4E0784C()
{
  return sub_1E4E0C328();
}

uint64_t sub_1E4E07870(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98150);
  MEMORY[0x1F4188790]();
  sub_1E4E0A9D4(a1, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1EAE98150);
  return sub_1E4E0C338();
}

uint64_t type metadata accessor for DefaultSpamFilterSettingsController(uint64_t a1)
{
  return sub_1E4E08660(a1, (uint64_t *)&unk_1EAE98650);
}

uint64_t sub_1E4E07924(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98148);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98150);
  MEMORY[0x1F4188790]();
  os_log_type_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4E075F0((uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v7, 1, v2) == 1) {
    return sub_1E4E0A978((uint64_t)v7, &qword_1EAE98150);
  }
  sub_1E4E0AB0C((uint64_t)v7, (uint64_t)v5, &qword_1EAE98148);
  uint64_t v9 = sub_1E4E0C4E8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E4E8E4A0](v2);
  char v13 = sub_1E4E0C4D8();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  objc_msgSend(a1, sel_setEditing_animated_, v13 & 1, 1);
  return sub_1E4E0A978((uint64_t)v5, &qword_1EAE98148);
}

uint64_t sub_1E4E07B5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV20TelephonyPreferences35DefaultSpamFilterSettingsController11Coordinator_parent;
  swift_beginAccess();
  return sub_1E4E07BB0(v3, a1);
}

uint64_t sub_1E4E07BB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DefaultSpamFilterSettingsController(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4E07C14(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV20TelephonyPreferences35DefaultSpamFilterSettingsController11Coordinator_parent;
  swift_beginAccess();
  sub_1E4E07C70(a1, v3);
  return swift_endAccess();
}

uint64_t sub_1E4E07C70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DefaultSpamFilterSettingsController(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1E4E07CD4())()
{
  return j__swift_endAccess;
}

id sub_1E4E07D30(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  sub_1E4E07BB0(a1, (uint64_t)v3 + OBJC_IVAR____TtCV20TelephonyPreferences35DefaultSpamFilterSettingsController11Coordinator_parent);
  v6.receiver = v3;
  v6.super_class = v1;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  sub_1E4E07DA4(a1);
  return v4;
}

uint64_t sub_1E4E07DA4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DefaultSpamFilterSettingsController(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for DefaultSpamFilterSettingsController.Coordinator(uint64_t a1)
{
  return sub_1E4E08660(a1, (uint64_t *)&unk_1EAE98660);
}

uint64_t sub_1E4E07E20(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for DefaultSpamFilterSettingsController(0) - 8;
  uint64_t v5 = MEMORY[0x1F4188790]();
  os_log_type_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x58))(v5);
  id v8 = &v7[*(int *)(v4 + 28)];
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *((void *)v8 + 1);
  LOBYTE(v8) = v8[16];
  uint64_t v13 = v9;
  uint64_t v14 = v10;
  char v15 = (char)v8;
  v12[7] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98138);
  sub_1E4E0C4C8();
  return sub_1E4E07DA4((uint64_t)v7);
}

id sub_1E4E08064()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DefaultSpamFilterSettingsController.Coordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1E4E080AC()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)DefaultSpamFilterListController), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98140);
  sub_1E4E0C3E8();
  objc_msgSend(v0, sel_setDelegate_, v2);

  return v0;
}

uint64_t sub_1E4E08128()
{
  return sub_1E4E0C368();
}

uint64_t sub_1E4E08140()
{
  return sub_1E4E0C378();
}

uint64_t sub_1E4E08158@<X0>(void *a1@<X8>)
{
  MEMORY[0x1F4188790]();
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4E07BB0(v1, (uint64_t)v4);
  uint64_t v5 = (objc_class *)type metadata accessor for DefaultSpamFilterSettingsController.Coordinator(0);
  id v6 = objc_allocWithZone(v5);
  sub_1E4E07BB0((uint64_t)v4, (uint64_t)v6 + OBJC_IVAR____TtCV20TelephonyPreferences35DefaultSpamFilterSettingsController11Coordinator_parent);
  v9.receiver = v6;
  v9.super_class = v5;
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  uint64_t result = sub_1E4E07DA4((uint64_t)v4);
  *a1 = v7;
  return result;
}

uint64_t sub_1E4E0821C()
{
  return sub_1E4E0C388();
}

uint64_t sub_1E4E08250()
{
  return sub_1E4E0C3B8();
}

uint64_t sub_1E4E08268()
{
  return sub_1E4E0C3A8();
}

uint64_t sub_1E4E08280()
{
  return sub_1E4E0C3D8();
}

uint64_t sub_1E4E082F4()
{
  return sub_1E4E0C398();
}

void sub_1E4E08368()
{
}

uint64_t sub_1E4E083AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DefaultSpamFilterSettingsController(0);
  MEMORY[0x1F4188790]();
  id v6 = (uint64_t *)&v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98160);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v10 = &v23[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = (char *)(v1 + *(int *)(type metadata accessor for DefaultSpamFilterView(0) + 20));
  char v12 = *v11;
  uint64_t v13 = *((void *)v11 + 1);
  char v25 = v12;
  uint64_t v26 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98168);
  sub_1E4E0C4A8();
  uint64_t v14 = v27;
  unint64_t v15 = v28;
  char v16 = v29;
  *id v6 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98130);
  swift_storeEnumTagMultiPayload();
  unint64_t v17 = (char *)v6 + *(int *)(v4 + 20);
  *(void *)unint64_t v17 = v14;
  *((void *)v17 + 1) = v15;
  v17[16] = v16;
  uint64_t v24 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98170);
  sub_1E4E0A934(&qword_1EAE98178);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE98180);
  unint64_t v19 = sub_1E4E08AC8();
  uint64_t v27 = v18;
  unint64_t v28 = v19;
  swift_getOpaqueTypeConformance2();
  sub_1E4E0C478();
  sub_1E4E07DA4((uint64_t)v6);
  uint64_t v20 = sub_1E4E0C318();
  LOBYTE(v4) = sub_1E4E0C408();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v8 + 16))(a1, v10, v7);
  uint64_t v21 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE98198) + 36);
  *(void *)uint64_t v21 = v20;
  *(unsigned char *)(v21 + 8) = v4;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t type metadata accessor for DefaultSpamFilterView(uint64_t a1)
{
  return sub_1E4E08660(a1, (uint64_t *)&unk_1EAE98670);
}

uint64_t sub_1E4E08660(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E4E08698@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98170);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v31 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98180);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1E4E0C2F8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4E0C2E8();
  uint64_t v14 = (char *)(a1 + *(int *)(type metadata accessor for DefaultSpamFilterView(0) + 20));
  char v15 = *v14;
  uint64_t v16 = *((void *)v14 + 1);
  char v32 = v15;
  uint64_t v33 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98168);
  sub_1E4E0C498();
  if (v34) {
    double v17 = 1.0;
  }
  else {
    double v17 = 0.0;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v13, v10);
  *(double *)&v9[*(int *)(v7 + 36)] = v17;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98150);
  MEMORY[0x1F4188790]();
  unint64_t v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4E075F0((uint64_t)v19);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98148);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v19, 1, v20) == 1)
  {
    sub_1E4E0A978((uint64_t)v19, &qword_1EAE98150);
LABEL_8:
    sub_1E4E0C418();
    goto LABEL_9;
  }
  uint64_t v21 = sub_1E4E0C4E8();
  uint64_t v29 = a2;
  uint64_t v30 = v4;
  uint64_t v22 = v5;
  uint64_t v23 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790]();
  char v25 = (char *)&v29 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E4E8E4A0](v20);
  sub_1E4E0A978((uint64_t)v19, &qword_1EAE98148);
  char v26 = sub_1E4E0C4D8();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v21);
  uint64_t v5 = v22;
  a2 = v29;
  uint64_t v4 = v30;
  if ((v26 & 1) == 0) {
    goto LABEL_8;
  }
  sub_1E4E0C428();
LABEL_9:
  sub_1E4E08AC8();
  uint64_t v27 = v31;
  sub_1E4E0C458();
  sub_1E4E0A978((uint64_t)v9, &qword_1EAE98180);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v27, v4);
}

uint64_t sub_1E4E08AC0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4E08698(*(void *)(v1 + 16), a1);
}

unint64_t sub_1E4E08AC8()
{
  unint64_t result = qword_1EAE98188;
  if (!qword_1EAE98188)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE98180);
    sub_1E4E08B38();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE98188);
  }
  return result;
}

unint64_t sub_1E4E08B38()
{
  unint64_t result = qword_1EAE98190;
  if (!qword_1EAE98190)
  {
    sub_1E4E0C2F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE98190);
  }
  return result;
}

uint64_t _s20TelephonyPreferences33DefaultSpamFilterSettingsProviderC7contentQrvg_0@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98130);
  swift_storeEnumTagMultiPayload();
  uint64_t v2 = (char *)a1 + *(int *)(type metadata accessor for DefaultSpamFilterView(0) + 20);
  uint64_t result = sub_1E4E0C488();
  char *v2 = v4;
  *((void *)v2 + 1) = v5;
  return result;
}

uint64_t sub_1E4E08C10()
{
  return sub_1E4E0A934(&qword_1EAE98178);
}

uint64_t sub_1E4E08C44()
{
  return MEMORY[0x1E4F3F160];
}

uint64_t sub_1E4E08C50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E4E08C6C()
{
  return sub_1E4E0C438();
}

uint64_t sub_1E4E08C84()
{
  return sub_1E4E0C448();
}

uint64_t sub_1E4E08C9C()
{
  return sub_1E4E0C468();
}

uint64_t *sub_1E4E08CBC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  char v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    char v4 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98130);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98148);
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98150);
        memcpy(v4, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        uint64_t v11 = a2[1];
        *char v4 = *a2;
        v4[1] = v11;
        uint64_t v12 = *(int *)(v7 + 32);
        uint64_t v20 = (char *)a2 + v12;
        uint64_t v21 = (char *)v4 + v12;
        uint64_t v13 = sub_1E4E0C4E8();
        unint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
        swift_retain();
        swift_retain();
        v19(v21, v20, v13);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
      }
    }
    else
    {
      *char v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = *(int *)(a3 + 20);
    char v15 = (char *)v4 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)char v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    v15[16] = v16[16];
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_1E4E08F04(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98130);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98148);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2))
    {
      swift_release();
      swift_release();
      uint64_t v3 = a1 + *(int *)(v2 + 32);
      uint64_t v4 = sub_1E4E0C4E8();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  return swift_release();
}

void *sub_1E4E09018(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98130);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98148);
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98150);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      uint64_t v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      uint64_t v10 = *(int *)(v6 + 32);
      uint64_t v18 = (char *)a2 + v10;
      unint64_t v19 = (char *)a1 + v10;
      uint64_t v11 = sub_1E4E0C4E8();
      uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
      swift_retain();
      swift_retain();
      v17(v19, v18, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = v15;
  v13[16] = v14[16];
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_1E4E09214(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1E4E0A978((uint64_t)a1, &qword_1EAE98130);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98130);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98148);
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98150);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        *a1 = *a2;
        a1[1] = a2[1];
        uint64_t v9 = *(int *)(v6 + 32);
        uint64_t v16 = (char *)a2 + v9;
        uint64_t v17 = (char *)a1 + v9;
        uint64_t v10 = sub_1E4E0C4E8();
        uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
        swift_retain();
        swift_retain();
        v15(v17, v16, v10);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  swift_retain();
  swift_release();
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_retain();
  swift_release();
  v12[16] = v13[16];
  return a1;
}

void *sub_1E4E0944C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98130);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98148);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98150);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      uint64_t v11 = *(int *)(v7 + 32);
      uint64_t v12 = (char *)a1 + v11;
      uint64_t v13 = (char *)a2 + v11;
      uint64_t v14 = sub_1E4E0C4E8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v15 = *(int *)(a3 + 20);
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  v16[16] = v17[16];
  return a1;
}

void *sub_1E4E09618(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1E4E0A978((uint64_t)a1, &qword_1EAE98130);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98130);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98148);
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98150);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        uint64_t v10 = a2[1];
        *a1 = *a2;
        a1[1] = v10;
        uint64_t v11 = *(int *)(v7 + 32);
        uint64_t v12 = (char *)a1 + v11;
        uint64_t v13 = (char *)a2 + v11;
        uint64_t v14 = sub_1E4E0C4E8();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v15 = *(int *)(a3 + 20);
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  *(void *)((char *)a1 + v15) = *(void *)v17;
  swift_release();
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_release();
  v16[16] = v17[16];
  return a1;
}

uint64_t sub_1E4E09814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E4E09828);
}

uint64_t sub_1E4E09828(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98158);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1E4E098F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E4E09904);
}

uint64_t sub_1E4E09904(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98158);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

void sub_1E4E099C8()
{
}

void sub_1E4E099D4()
{
  if (!qword_1EAE981A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE98150);
    unint64_t v0 = sub_1E4E0C308();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAE981A8);
    }
  }
}

uint64_t sub_1E4E09A30()
{
  return type metadata accessor for DefaultSpamFilterSettingsController.Coordinator(0);
}

uint64_t sub_1E4E09A38()
{
  uint64_t result = type metadata accessor for DefaultSpamFilterSettingsController(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1E4E09AC8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98130);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98148);
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98150);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        uint64_t v11 = a2[1];
        *a1 = *a2;
        a1[1] = v11;
        uint64_t v12 = *(int *)(v7 + 32);
        unint64_t v19 = (char *)a2 + v12;
        uint64_t v20 = (char *)a1 + v12;
        uint64_t v13 = sub_1E4E0C4E8();
        uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
        swift_retain();
        swift_retain();
        v18(v20, v19, v13);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = *(int *)(a3 + 20);
    uint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    *uint64_t v15 = *v16;
    *((void *)v15 + 1) = *((void *)v16 + 1);
  }
  swift_retain();
  return a1;
}

uint64_t sub_1E4E09D08(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98130);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98148);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2))
    {
      swift_release();
      swift_release();
      uint64_t v3 = a1 + *(int *)(v2 + 32);
      uint64_t v4 = sub_1E4E0C4E8();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
    }
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

void *sub_1E4E09E14(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98130);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98148);
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98150);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      uint64_t v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      uint64_t v10 = *(int *)(v6 + 32);
      uint64_t v17 = (char *)a2 + v10;
      uint64_t v18 = (char *)a1 + v10;
      uint64_t v11 = sub_1E4E0C4E8();
      uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
      swift_retain();
      swift_retain();
      v16(v18, v17, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  char *v13 = *v14;
  *((void *)v13 + 1) = *((void *)v14 + 1);
  swift_retain();
  return a1;
}

void *sub_1E4E0A008(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1E4E0A978((uint64_t)a1, &qword_1EAE98130);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98130);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98148);
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98150);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        *a1 = *a2;
        a1[1] = a2[1];
        uint64_t v9 = *(int *)(v6 + 32);
        uint64_t v16 = (char *)a2 + v9;
        uint64_t v17 = (char *)a1 + v9;
        uint64_t v10 = sub_1E4E0C4E8();
        uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
        swift_retain();
        swift_retain();
        v15(v17, v16, v10);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  *uint64_t v12 = *v13;
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_retain();
  swift_release();
  return a1;
}

void *sub_1E4E0A228(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98130);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98148);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98150);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      uint64_t v11 = *(int *)(v7 + 32);
      uint64_t v12 = (char *)a1 + v11;
      uint64_t v13 = (char *)a2 + v11;
      uint64_t v14 = sub_1E4E0C4E8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_1E4E0A3E4(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1E4E0A978((uint64_t)a1, &qword_1EAE98130);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98130);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98148);
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98150);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        uint64_t v10 = a2[1];
        *a1 = *a2;
        a1[1] = v10;
        uint64_t v11 = *(int *)(v7 + 32);
        uint64_t v12 = (char *)a1 + v11;
        uint64_t v13 = (char *)a2 + v11;
        uint64_t v14 = sub_1E4E0C4E8();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v15 = *(int *)(a3 + 20);
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  *uint64_t v16 = *v17;
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_release();
  return a1;
}

uint64_t sub_1E4E0A5D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E4E0A5E4);
}

uint64_t sub_1E4E0A5E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98158);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_1E4E0A6B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E4E0A6CC);
}

uint64_t sub_1E4E0A6CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98158);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

void sub_1E4E0A790()
{
}

void sub_1E4E0A79C()
{
  sub_1E4E099D4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_1E4E0A830()
{
  unint64_t result = qword_1EAE98210;
  if (!qword_1EAE98210)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EAE98198);
    type metadata accessor for DefaultSpamFilterSettingsController(255);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE98170);
    sub_1E4E0A934(&qword_1EAE98178);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE98180);
    sub_1E4E08AC8();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE98210);
  }
  return result;
}

uint64_t sub_1E4E0A934(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for DefaultSpamFilterSettingsController(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1E4E0A978(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1E4E0A9D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1E4E0AA38(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_1E4E0AB70(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1E4E0AC70((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1E4E0AC70((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1E4E0AB0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_1E4E0AB70(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_1E4E0ACCC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_1E4E0C688();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1E4E0AC70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1E4E0ACCC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1E4E0AD64(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1E4E0AE68(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_1E4E0AE68((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1E4E0AD64(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_1E4E0AE00(v2, 0);
      uint64_t result = sub_1E4E0C668();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_1E4E0C568();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1E4E0AE00(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE98220);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1E4E0AE68(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE98220);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t __getPSSimStatusCacheClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[PHBrandedCallingSwitchSpecifier getBrandedCallingEnabled](v0);
}

uint64_t __getOBPrivacyLinkControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getOBPrivacyPresenterClass_block_invoke_cold_1(v0);
}

uint64_t __getOBPrivacyPresenterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __53__TPSSubscriberTelephonyController_changePIN_newPin___block_invoke_cold_1(v0);
}

uint64_t sub_1E4E0C1D8()
{
  return off_1F40E3F50();
}

uint64_t sub_1E4E0C1E8()
{
  return (*(uint64_t (**)(void))&aReuseidentifie[16])();
}

#error "1E4E0C204: call analysis failed (funcsize=3)"

uint64_t sub_1E4E0C208()
{
  return MEMORY[0x1F4187530]();
}

uint64_t sub_1E4E0C218()
{
  return MEMORY[0x1F4187548]();
}

uint64_t sub_1E4E0C228()
{
  return MEMORY[0x1F4187558]();
}

uint64_t sub_1E4E0C238()
{
  return MEMORY[0x1F4187560]();
}

uint64_t sub_1E4E0C248()
{
  return MEMORY[0x1F4187570]();
}

uint64_t sub_1E4E0C258()
{
  return MEMORY[0x1F4187580]();
}

uint64_t sub_1E4E0C268()
{
  return off_1F40E9648();
}

uint64_t sub_1E4E0C278()
{
  return sel_setUnloading_();
}

uint64_t sub_1E4E0C288()
{
  return (*(&sel_setUnloading_ + 1))();
}

#error "1E4E0C2A4: call analysis failed (funcsize=3)"

uint64_t sub_1E4E0C2A8()
{
  return sel_subscriptionISOCountryCode();
}

uint64_t sub_1E4E0C2B8()
{
  return MEMORY[0x1F41173F8]();
}

uint64_t sub_1E4E0C2C8()
{
  return MEMORY[0x1F4117408]();
}

uint64_t sub_1E4E0C2D8()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1E4E0C2E8()
{
  return MEMORY[0x1F40F7E98]();
}

uint64_t sub_1E4E0C2F8()
{
  return MEMORY[0x1F40F7EA8]();
}

uint64_t sub_1E4E0C308()
{
  return MEMORY[0x1F40F80A8]();
}

uint64_t sub_1E4E0C318()
{
  return MEMORY[0x1F40F8C50]();
}

uint64_t sub_1E4E0C328()
{
  return MEMORY[0x1F40F95F0]();
}

uint64_t sub_1E4E0C338()
{
  return MEMORY[0x1F40F9600]();
}

uint64_t sub_1E4E0C348()
{
  return MEMORY[0x1F40F96C0]();
}

uint64_t sub_1E4E0C358()
{
  return MEMORY[0x1F40F96D0]();
}

uint64_t sub_1E4E0C368()
{
  return MEMORY[0x1F40FAAF8]();
}

uint64_t sub_1E4E0C378()
{
  return MEMORY[0x1F40FAB10]();
}

uint64_t sub_1E4E0C388()
{
  return MEMORY[0x1F40FAB20]();
}

uint64_t sub_1E4E0C398()
{
  return MEMORY[0x1F40FAB30]();
}

uint64_t sub_1E4E0C3A8()
{
  return MEMORY[0x1F40FAB40]();
}

uint64_t sub_1E4E0C3B8()
{
  return MEMORY[0x1F40FAB50]();
}

uint64_t sub_1E4E0C3C8()
{
  return MEMORY[0x1F40FAB60]();
}

uint64_t sub_1E4E0C3D8()
{
  return MEMORY[0x1F40FAB68]();
}

uint64_t sub_1E4E0C3E8()
{
  return MEMORY[0x1F40FACF8]();
}

uint64_t sub_1E4E0C3F8()
{
  return MEMORY[0x1F40FAD70]();
}

uint64_t sub_1E4E0C408()
{
  return MEMORY[0x1F40FADC8]();
}

uint64_t sub_1E4E0C418()
{
  return MEMORY[0x1F40FAFE8]();
}

uint64_t sub_1E4E0C428()
{
  return MEMORY[0x1F40FAFF8]();
}

uint64_t sub_1E4E0C438()
{
  return MEMORY[0x1F40FB5C8]();
}

uint64_t sub_1E4E0C448()
{
  return MEMORY[0x1F40FB5E0]();
}

uint64_t sub_1E4E0C458()
{
  return MEMORY[0x1F40FB640]();
}

uint64_t sub_1E4E0C468()
{
  return MEMORY[0x1F40FB928]();
}

uint64_t sub_1E4E0C478()
{
  return MEMORY[0x1F40FC118]();
}

uint64_t sub_1E4E0C488()
{
  return MEMORY[0x1F40FC6E8]();
}

uint64_t sub_1E4E0C498()
{
  return MEMORY[0x1F40FC6F8]();
}

uint64_t sub_1E4E0C4A8()
{
  return MEMORY[0x1F40FC720]();
}

uint64_t sub_1E4E0C4B8()
{
  return MEMORY[0x1F40FC908]();
}

uint64_t sub_1E4E0C4C8()
{
  return MEMORY[0x1F40FC918]();
}

uint64_t sub_1E4E0C4D8()
{
  return MEMORY[0x1F40FCAF0]();
}

uint64_t sub_1E4E0C4E8()
{
  return MEMORY[0x1F40FCB00]();
}

uint64_t sub_1E4E0C4F8()
{
  return MEMORY[0x1F4186CB8]();
}

uint64_t sub_1E4E0C508()
{
  return MEMORY[0x1F4186D00]();
}

uint64_t sub_1E4E0C518()
{
  return MEMORY[0x1F4186D68]();
}

uint64_t sub_1E4E0C528()
{
  return (*(uint64_t (**)(void))&stru_1F40E6180.align)();
}

uint64_t sub_1E4E0C538()
{
  return ((uint64_t (*)(void))stru_1F40E61C0.type)();
}

uint64_t sub_1E4E0C548()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1E4E0C558()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1E4E0C568()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1E4E0C578()
{
  return stru_1F40E6340();
}

uint64_t sub_1E4E0C588()
{
  return ((uint64_t (*)(void))stru_1F40E6360.name)();
}

uint64_t sub_1E4E0C598()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1E4E0C5A8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1E4E0C5B8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1E4E0C5C8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1E4E0C5D8()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1E4E0C5E8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1E4E0C5F8()
{
  return MEMORY[0x1F41870B0]();
}

uint64_t sub_1E4E0C608()
{
  return MEMORY[0x1F41870E8]();
}

uint64_t sub_1E4E0C618()
{
  return (*(&sel_subscriptionISOCountryCode + 1))();
}

uint64_t sub_1E4E0C628()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1E4E0C638()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1E4E0C648()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1E4E0C658()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1E4E0C668()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1E4E0C678()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1E4E0C688()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1E4E0C698()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1E4E0C6A8()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1E4E0C6B8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1E4E0C6C8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1E4E0C6D8()
{
  return aSetreusedcell();
}

uint64_t sub_1E4E0C6E8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1E4E0C6F8()
{
  return MEMORY[0x1F4185EF8]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)(*(uint64_t (**)(void))&aTCNVUrlcomplet[32])();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1F4114220]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1F4114228]();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)aNsmutablearray(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return OBJC_IVAR___PSListController__reusesCells(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)aEditabletextco(theString);
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x1F4109338]();
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)aTUigesturereco(descriptor, matrix, size);
}

uint64_t CTFontDescriptorCreateForUIType()
{
  return (*(uint64_t (**)(void))&aActingparentge[24])();
}

uint64_t CTFontRemoveFromCaches()
{
  return off_1F40DF660();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)aAction(attrString);
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  off_1F40DF7C8(line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

JSClassRef JSClassCreate(const JSClassDefinition *definition)
{
  return (JSClassRef)(*(uint64_t (**)(const JSClassDefinition *))&sel_setSIMStatus_[8])(definition);
}

void *__cdecl JSObjectGetPrivate(JSObjectRef object)
{
  return (void *)(*(uint64_t (**)(JSObjectRef))&sel_changePIN_newPin_completion_[16])(object);
}

JSObjectRef JSObjectMake(JSContextRef ctx, JSClassRef jsClass, void *data)
{
  return (JSObjectRef)(*(uint64_t (**)(JSContextRef, JSClassRef, void *))&sel_fetchSIMPasscodeLockEnabledWithCompletion_[32])(ctx, jsClass, data);
}

void JSObjectSetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef value, JSPropertyAttributes attributes, JSValueRef *exception)
{
}

JSStringRef JSStringCreateWithCFString(CFStringRef string)
{
  return (JSStringRef)(*(uint64_t (**)(CFStringRef))&sel_getSIMPasscodeLockEnabledValue[16])(string);
}

BOOL JSValueIsObjectOfClass(JSContextRef ctx, JSValueRef value, JSClassRef jsClass)
{
  return (*(uint64_t (**)(JSContextRef, JSValueRef, JSClassRef))&sel_getSIMPasscodeRemainingAttemptsValueWithError_[24])(ctx, value, jsClass);
}

JSValueRef JSValueMakeUndefined(JSContextRef ctx)
{
  return (JSValueRef)(*(uint64_t (**)(JSContextRef))&sel_getSIMStatusWithError_[8])(ctx);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)off_1F40E7280(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)unk_1F40E72A0(range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)off_1F40E72B0(aSelector);
}

uint64_t TUStringKeyForNetwork()
{
  return MEMORY[0x1F4163AD0]();
}

uint64_t UIPhoneNumberSuggestionForString()
{
  return MEMORY[0x1F4166DE0]();
}

uint64_t WebThreadCallDelegate()
{
  return MEMORY[0x1F4176B88]();
}

uint64_t WebThreadMakeNSInvocation()
{
  return MEMORY[0x1F4176BC0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return sel_isProxy();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)aSeractivitysta(attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)((uint64_t (*)(const char *, dispatch_queue_attr_t))*(&aSeractivitysta + 1))(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return sel_isEditing(when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)(*(uint64_t (**)(size_t))&a32081624_3[8])(__size);
}

size_t malloc_size(const void *ptr)
{
  return (*(uint64_t (**)(const void *))&aSetcaretselect[8])(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)(*(uint64_t (**)(size_t, malloc_type_id_t))&aSetcaretselect[32])(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)(*(uint64_t (**)(void *, const void *, size_t))&aSelectedrangew[16])(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)(*(uint64_t (**)(void *, const void *, size_t))&aRangeofparagra[16])(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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
  return (os_log_t)off_1F40CD360(subsystem, category);
}

#error "1E4E0CE34: call analysis failed (funcsize=3)"

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return off_1F40CD5E8();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t uset_close()
{
  return MEMORY[0x1F41806D0]();
}

uint64_t uset_containsAllCodePoints()
{
  return MEMORY[0x1F41806E8]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1F4180720]();
}