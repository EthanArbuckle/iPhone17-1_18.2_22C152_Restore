void sub_23797C454(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23797CFB0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id UAFGetLogCategory(void **a1)
{
  if (UAFGetLogCategory_once != -1) {
    dispatch_once(&UAFGetLogCategory_once, &__block_literal_global_16);
  }
  v2 = *a1;

  return v2;
}

void __UAFGetLogCategory_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)[@"com.apple.UnifiedAssetFramework" UTF8String], "UAFTrialClient");
  uint64_t v1 = (void *)UAFLogContextTrialCategory;
  UAFLogContextTrialCategory = (uint64_t)v0;

  os_log_t v2 = os_log_create((const char *)[@"com.apple.UnifiedAssetFramework" UTF8String], "UAFAssetUtilities");
  v3 = (void *)UAFLogContextAssetUtilities;
  UAFLogContextAssetUtilities = (uint64_t)v2;

  os_log_t v4 = os_log_create((const char *)[@"com.apple.UnifiedAssetFramework" UTF8String], "Configuration");
  v5 = (void *)UAFLogContextConfiguration;
  UAFLogContextConfiguration = (uint64_t)v4;

  os_log_t v6 = os_log_create((const char *)[@"com.apple.UnifiedAssetFramework" UTF8String], "Client");
  v7 = (void *)UAFLogContextClient;
  UAFLogContextClient = (uint64_t)v6;

  os_log_t v8 = os_log_create((const char *)[@"com.apple.UnifiedAssetFramework" UTF8String], "Storage");
  v9 = (void *)UAFLogContextStorage;
  UAFLogContextStorage = (uint64_t)v8;

  os_log_t v10 = os_log_create((const char *)[@"com.apple.UnifiedAssetFramework" UTF8String], "XPCActivity");
  v11 = (void *)UAFLogContextXPCActivity;
  UAFLogContextXPCActivity = (uint64_t)v10;

  os_log_t v12 = os_log_create((const char *)[@"com.apple.UnifiedAssetFramework" UTF8String], "XPCService");
  v13 = (void *)UAFLogContextXPCService;
  UAFLogContextXPCService = (uint64_t)v12;

  os_log_t v14 = os_log_create((const char *)[@"com.apple.UnifiedAssetFramework" UTF8String], "UAFInstrumentation");
  v15 = (void *)UAFLogContextInstrumentation;
  UAFLogContextInstrumentation = (uint64_t)v14;

  os_log_t v16 = os_log_create((const char *)[@"com.apple.UnifiedAssetFramework" UTF8String], "Subscription");
  v17 = (void *)UAFLogContextSubscription;
  UAFLogContextSubscription = (uint64_t)v16;

  os_log_t v18 = os_log_create((const char *)[@"com.apple.UnifiedAssetFramework" UTF8String], "LargeMessage");
  v19 = (void *)UAFLogContextLargeMessage;
  UAFLogContextLargeMessage = (uint64_t)v18;

  os_log_t v20 = os_log_create((const char *)[@"com.apple.UnifiedAssetFramework" UTF8String], "MAConfig");
  v21 = (void *)UAFLogContextMAConfig;
  UAFLogContextMAConfig = (uint64_t)v20;

  os_log_t v22 = os_log_create((const char *)[@"com.apple.UnifiedAssetFramework" UTF8String], "UAFTool");
  v23 = (void *)UAFLogContextUAFTool;
  UAFLogContextUAFTool = (uint64_t)v22;
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

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
}

void sub_237988290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_237988C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id a46)
{
}

void sub_23798B8E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23798C018(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23798CEE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23798D0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23798D1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23798D410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23798D694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *UAFSubscriptionDownloadStatusDescription(unint64_t a1)
{
  if (a1 > 7) {
    return @"unknown status";
  }
  else {
    return off_264CEB598[a1];
  }
}

void sub_237990144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237995F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _AFPreferencesDidChangeCallback(uint64_t a1, void *a2)
{
  [a2 _assistantPreferencesUpdate];

  return [a2 _assistantLanguageUpdate];
}

id getkAFPreferencesDidChangeDarwinNotification()
{
  uint64_t v5 = 0;
  os_log_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  os_log_t v0 = (void **)getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr;
  uint64_t v8 = getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr;
  if (!getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)AssistantServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kAFPreferencesDidChangeDarwinNotification");
    getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr = v6[3];
    os_log_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    os_log_t v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  os_log_t v2 = *v0;

  return v2;
}

uint64_t _AFLanguageDidChangeCallback(uint64_t a1, void *a2)
{
  return [a2 _assistantLanguageUpdate];
}

id getAFLanguageCodeDidChangeDarwinNotification()
{
  uint64_t v5 = 0;
  os_log_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  os_log_t v0 = (void **)getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr;
  uint64_t v8 = getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr;
  if (!getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)AssistantServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFLanguageCodeDidChangeDarwinNotification");
    getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr = v6[3];
    os_log_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    os_log_t v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  os_log_t v2 = *v0;

  return v2;
}

uint64_t _SiriXAssetDidChangeCallback(uint64_t a1, void *a2)
{
  return [a2 refreshUnderstandingOnDeviceAssetsAvailableAsync];
}

id getAFSiriXAssetDidChangeDarwinNotification()
{
  uint64_t v5 = 0;
  os_log_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  os_log_t v0 = (void **)getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr;
  uint64_t v8 = getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr;
  if (!getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)AssistantServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFSiriXAssetDidChangeDarwinNotification");
    getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr = v6[3];
    os_log_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    os_log_t v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  os_log_t v2 = *v0;

  return v2;
}

uint64_t _UAFAssetStatusDidChangeCallback(uint64_t a1, void *a2)
{
  return [a2 refreshUAFAssetStatusAsync];
}

void sub_237996ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_23799731C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_237997594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23799771C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_237997E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2379984A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_237998948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_237998BA4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_237998EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_23799900C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_2379993DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

void sub_237999734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_237999E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_23799A22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23799A330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  result = dlsym(v2, "kAFPreferencesDidChangeDarwinNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AssistantServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __AssistantServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264CEAD78;
    uint64_t v5 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v1 = (void *)v3[0];
    uint64_t v0 = AssistantServicesLibraryCore_frameworkLibrary;
    if (AssistantServicesLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      uint64_t v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return AssistantServicesLibraryCore_frameworkLibrary;
}

uint64_t __AssistantServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  uint64_t result = dlsym(v2, "AFLanguageCodeDidChangeDarwinNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  uint64_t result = dlsym(v2, "AFSiriXAssetDidChangeDarwinNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAFSettingsConnectionClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFSettingsConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAFSettingsConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)abort_report_np();
    return (Class)+[UAFConfiguration autoAssetFeatureEnabled:v5];
  }
  return result;
}

void UAFRegisterXPCActivities()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)*MEMORY[0x263EF8188];
  uint64_t v1 = UAFGetLogCategory((void **)&UAFLogContextXPCActivity);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "_RegisterPeriodicUAFSubscriptionActivity";
    _os_log_impl(&dword_23797A000, v1, OS_LOG_TYPE_DEFAULT, "%s XPC: Registering the Periodic UAF Subscription XPC Activity", (uint8_t *)&v8, 0xCu);
  }

  _RegisterXPCActivity("com.apple.siri.xpc_activity.uaf-subscription-maintenance", v0, &__block_literal_global, &__block_literal_global_271);
  BOOL v2 = +[UAFCommonUtilities isInexpensiveNetworkAvailable];
  BOOL v3 = +[UAFCommonUtilities isGameModeEnabled];
  SEL v4 = UAFGetLogCategory((void **)&UAFLogContextXPCActivity);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v2 || v3)
  {
    if (v5)
    {
      int v8 = 136315650;
      v9 = "UAFRegisterXPCActivities";
      __int16 v10 = 1024;
      BOOL v11 = v2;
      __int16 v12 = 1024;
      BOOL v13 = v3;
      _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s Scheduling on-boot activity for next opportunity: Inexpensive network availability: %d, GameMode: %d", (uint8_t *)&v8, 0x18u);
    }

    uint64_t v6 = UAFGetLogCategory((void **)&UAFLogContextXPCActivity);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315138;
      v9 = "_RegisterOnBootUAFActivity";
      _os_log_debug_impl(&dword_23797A000, v6, OS_LOG_TYPE_DEBUG, "%s XPC: Registering the On Boot UAF XPC Activity", (uint8_t *)&v8, 0xCu);
    }

    _RegisterXPCActivity("com.apple.siri.xpc_activity.uaf-on-boot", v0, &__block_literal_global_291, &__block_literal_global_293);
  }
  else
  {
    if (v5)
    {
      int v8 = 136315138;
      v9 = "UAFRegisterXPCActivities";
      _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s Inexpensive network available and game mode disabled, skipping on-boot activity registration", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = UAFGetLogCategory((void **)&UAFLogContextXPCActivity);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    v9 = "_RegisterPostUpgradeUAFActivity";
    _os_log_debug_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEBUG, "%s XPC: Registering the Post-Upgrade UAF XPC Activity", (uint8_t *)&v8, 0xCu);
  }

  _RegisterXPCActivity("com.apple.siri.xpc_activity.uaf-post-upgrade", v0, &__block_literal_global_296, &__block_literal_global_298);
}

void _RegisterXPCActivity(const char *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    __int16 v10 = [NSString stringWithUTF8String:a1];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = ___RegisterXPCActivity_block_invoke;
    handler[3] = &unk_264CEB010;
    id v14 = v9;
    id v15 = v8;
    id v13 = v10;
    id v11 = v10;
    xpc_activity_register(a1, v7, handler);
  }
  else
  {
    xpc_activity_unregister(a1);
  }
}

void sub_23799E25C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_2379A24D0(_Unwind_Exception *a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t AFSiriXAssetDidChangeCallback(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return [a2 updateSiriAssetAvailabilityForObserver];
  }
  return result;
}

id getAFSiriXAssetDidChangeDarwinNotification_0()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr_0;
  uint64_t v8 = getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr_0;
  if (!getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr_0)
  {
    uint64_t v1 = (void *)AssistantServicesLibrary_0();
    v6[3] = (uint64_t)dlsym(v1, "AFSiriXAssetDidChangeDarwinNotification");
    getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    SEL v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  BOOL v2 = *v0;

  return v2;
}

void sub_2379A4F88(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_2379A58E4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2379A5D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_2379A5E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2379A6420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_2379A7214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a35);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_2379A79A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void *__getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_block_invoke_0(uint64_t a1)
{
  BOOL v2 = (void *)AssistantServicesLibrary_0();
  uint64_t result = dlsym(v2, "AFSiriXAssetDidChangeDarwinNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFSiriXAssetDidChangeDarwinNotificationSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AssistantServicesLibrary_0()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __AssistantServicesLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264CEB4F0;
    uint64_t v5 = 0;
    AssistantServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v1 = (void *)v3[0];
    uint64_t v0 = AssistantServicesLibraryCore_frameworkLibrary_0;
    if (AssistantServicesLibraryCore_frameworkLibrary_0)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      uint64_t v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return AssistantServicesLibraryCore_frameworkLibrary_0;
}

uint64_t __AssistantServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

NSString *__getAFSettingsConnectionClass_block_invoke_0(uint64_t a1)
{
  AssistantServicesLibrary_0();
  uint64_t result = (NSString *)objc_getClass("AFSettingsConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAFSettingsConnectionClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (UAFAssetSetMetadata *)abort_report_np();
    return [(UAFAssetSetMetadata *)v3 minOSVersion];
  }
  return result;
}

void sub_2379A9924(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getAFPreferencesClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAFPreferencesClass_softClass;
  uint64_t v7 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFPreferencesClass_block_invoke;
    v3[3] = &unk_264CEAD58;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_2379AA0D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getGMAvailabilityWrapperClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_26AF0B9D8;
  uint64_t v7 = qword_26AF0B9D8;
  if (!qword_26AF0B9D8)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getGMAvailabilityWrapperClass_block_invoke;
    v3[3] = &unk_264CEAD58;
    v3[4] = &v4;
    __getGMAvailabilityWrapperClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_2379AAB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibrary_1();
  Class result = objc_getClass("AFPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAFPreferencesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)AssistantServicesLibrary_1();
  }
  return result;
}

uint64_t AssistantServicesLibrary_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary_1)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __AssistantServicesLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264CEB658;
    uint64_t v5 = 0;
    AssistantServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = AssistantServicesLibraryCore_frameworkLibrary_1;
    if (AssistantServicesLibraryCore_frameworkLibrary_1)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return AssistantServicesLibraryCore_frameworkLibrary_1;
}

uint64_t __AssistantServicesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getAFDeviceSupportsSAESymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)AssistantServicesLibrary_1();
  uint64_t result = dlsym(v2, "AFDeviceSupportsSAE");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFDeviceSupportsSAESymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFDeviceSupportsSiriUODSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)AssistantServicesLibrary_1();
  uint64_t result = dlsym(v2, "AFDeviceSupportsSiriUOD");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFDeviceSupportsSiriUODSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFShouldRunAsrOnServerForUODSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)AssistantServicesLibrary_1();
  uint64_t result = dlsym(v2, "AFShouldRunAsrOnServerForUOD");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFShouldRunAsrOnServerForUODSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFUODStatusSupportedFullSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)AssistantServicesLibrary_1();
  uint64_t result = dlsym(v2, "AFUODStatusSupportedFull");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFUODStatusSupportedFullSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFUODStatusSupportedHybridSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)AssistantServicesLibrary_1();
  uint64_t result = dlsym(v2, "AFUODStatusSupportedHybrid");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFUODStatusSupportedHybridSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFIsTop13LocaleSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)AssistantServicesLibrary_1();
  uint64_t result = dlsym(v2, "AFIsTop13Locale");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFIsTop13LocaleSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFUODAttentionRequiredSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)AssistantServicesLibrary_1();
  uint64_t result = dlsym(v2, "AFUODAttentionRequired");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFUODAttentionRequiredSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getGMAvailabilityWrapperClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!qword_26AF0B9E0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __GenerativeModelsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264CEB670;
    uint64_t v6 = 0;
    qword_26AF0B9E0 = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
    if (!qword_26AF0B9E0)
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
    Class result = objc_getClass("GMAvailabilityWrapper");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_26AF0B9D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __GenerativeModelsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_26AF0B9E0 = result;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_2379AF8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _AFLanguageDidChangeCallback_0(uint64_t a1, void *a2)
{
  return [a2 _assistantGMSAvailabilityUpdate];
}

id getAFLanguageCodeDidChangeDarwinNotification_0()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr_0;
  uint64_t v8 = getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr_0;
  if (!getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr_0)
  {
    id v1 = (void *)AssistantServicesLibrary_2();
    v6[3] = (uint64_t)dlsym(v1, "AFLanguageCodeDidChangeDarwinNotification");
    getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  BOOL v2 = *v0;

  return v2;
}

uint64_t _AFPreferencesDidChangeCallback_0(uint64_t a1, void *a2)
{
  return [a2 _assistantPreferencesUpdate];
}

id getkAFPreferencesDidChangeDarwinNotification_0()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr_0;
  uint64_t v8 = getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr_0;
  if (!getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr_0)
  {
    id v1 = (void *)AssistantServicesLibrary_2();
    v6[3] = (uint64_t)dlsym(v1, "kAFPreferencesDidChangeDarwinNotification");
    getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  BOOL v2 = *v0;

  return v2;
}

uint64_t _LanguageChangedCallback(uint64_t a1, void *a2)
{
  return [a2 _systemLanguageUpdate];
}

uint64_t _GMSAvailabilityDidChangeCallback(uint64_t a1, void *a2)
{
  return [a2 _assistantGMSAvailabilityUpdate];
}

void sub_2379B0A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_block_invoke_0(uint64_t a1)
{
  BOOL v2 = (void *)AssistantServicesLibrary_2();
  uint64_t result = dlsym(v2, "AFLanguageCodeDidChangeDarwinNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFLanguageCodeDidChangeDarwinNotificationSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t AssistantServicesLibrary_2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary_2)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __AssistantServicesLibraryCore_block_invoke_2;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264CEB840;
    uint64_t v5 = 0;
    AssistantServicesLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = AssistantServicesLibraryCore_frameworkLibrary_2;
    if (AssistantServicesLibraryCore_frameworkLibrary_2)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return AssistantServicesLibraryCore_frameworkLibrary_2;
}

uint64_t __AssistantServicesLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void *__getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_block_invoke_0(uint64_t a1)
{
  BOOL v2 = (void *)AssistantServicesLibrary_2();
  uint64_t result = dlsym(v2, "kAFPreferencesDidChangeDarwinNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAFPreferencesDidChangeDarwinNotificationSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void sub_2379B49D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke_0(uint64_t a1)
{
  AssistantServicesLibrary_3();
  Class result = objc_getClass("AFPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)AssistantServicesLibrary_3();
  }
  return result;
}

uint64_t AssistantServicesLibrary_3()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary_3)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __AssistantServicesLibraryCore_block_invoke_3;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264CEB868;
    uint64_t v5 = 0;
    AssistantServicesLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = AssistantServicesLibraryCore_frameworkLibrary_3;
    if (AssistantServicesLibraryCore_frameworkLibrary_3)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return AssistantServicesLibraryCore_frameworkLibrary_3;
}

uint64_t __AssistantServicesLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary_3 = result;
  return result;
}

void *__getAFOfflineDictationStatusHighQualityKeySymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)AssistantServicesLibrary_3();
  uint64_t result = dlsym(v2, "AFOfflineDictationStatusHighQualityKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_26AF0BA00 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFOfflineDictationStatusInstalledKeySymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)AssistantServicesLibrary_3();
  uint64_t result = dlsym(v2, "AFOfflineDictationStatusInstalledKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_26AF0BA08 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id _ProjectToNamespacesMapping()
{
  v3[4] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26EAA0EB8;
  v2[1] = &unk_26EAA0F78;
  v3[0] = &unk_26EAA1080;
  v3[1] = &unk_26EAA1098;
  v2[2] = &unk_26EAA0FA8;
  v2[3] = &unk_26EAA0FD8;
  v3[2] = &unk_26EAA10B0;
  v3[3] = &unk_26EAA10C8;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4];

  return v0;
}

uint64_t levelHasValidPath(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1;
  if (!v1) {
    goto LABEL_14;
  }
  int v3 = [v1 levelOneOfCase];
  switch(v3)
  {
    case 0:
      goto LABEL_14;
    case 100:
      uint64_t v8 = [v2 fileValue];
      if (!v8) {
        goto LABEL_14;
      }
      uint64_t v5 = (void *)v8;
      uint64_t v6 = [v2 fileValue];
      if ([v6 hasPath])
      {
        uint64_t v7 = [v2 fileValue];
LABEL_11:
        id v9 = v7;
        __int16 v10 = [v7 path];
        uint64_t v11 = [v10 length];

        if (v11) {
          break;
        }
LABEL_14:
        uint64_t v12 = 0;
        goto LABEL_15;
      }
LABEL_13:

      goto LABEL_14;
    case 101:
      uint64_t v4 = [v2 directoryValue];
      if (!v4) {
        goto LABEL_14;
      }
      uint64_t v5 = (void *)v4;
      uint64_t v6 = [v2 directoryValue];
      if ([v6 hasPath])
      {
        uint64_t v7 = [v2 directoryValue];
        goto LABEL_11;
      }
      goto LABEL_13;
  }
  uint64_t v12 = 1;
LABEL_15:

  return v12;
}

id newFactorLevelWithLevel(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_opt_new();
  if ([v3 hasFactor])
  {
    uint64_t v6 = [v3 factor];
    [v5 setFactor:v6];
  }
  if (v4) {
    [v5 setLevel:v4];
  }
  else {
    [v5 setHasLevel:0];
  }

  return v5;
}

id factorLevelsFromAssets(void *a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v37 = a2;
  id v38 = [MEMORY[0x263EFF980] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if ([v9 state] == 6)
        {
          __int16 v10 = objc_opt_new();
          id v11 = v9;
          id v12 = v37;
          id v13 = objc_opt_new();
          [v13 setNamespaceName:v12];
          uint64_t v14 = [MEMORY[0x263F80EA8] namespaceIdFromName:v12];

          [v13 setNamespaceId:v14];
          id v15 = [v11 attributes];

          uint64_t v16 = [v15 objectForKeyedSubscript:@"Factor"];
          [v13 setName:v16];

          [v13 setType:101];
          [v13 setHasAlias:0];
          objc_msgSend(v13, "setHasId_p:", 0);
          [v10 setFactor:v13];

          id v17 = v11;
          os_log_t v18 = objc_opt_new();
          v19 = objc_opt_new();
          [v18 setDirectoryValue:v19];

          os_log_t v20 = [v17 getLocalFileUrl];
          v21 = [v20 path];
          os_log_t v22 = [v18 directoryValue];
          [v22 setPath:v21];

          v23 = [v18 directoryValue];
          [v23 setIsOnDemand:0];

          v24 = objc_opt_new();
          v25 = [v18 directoryValue];
          [v25 setAsset:v24];

          v26 = [v17 assetId];
          v27 = [v18 directoryValue];
          uint64_t v28 = [v27 asset];
          [(id)v28 setAssetId:v26];

          v29 = objc_opt_new();
          [v18 setMetadata:v29];

          v30 = [v17 attributes];
          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __levelFromAsset_block_invoke;
          v43[3] = &unk_264CEB780;
          id v31 = v18;
          id v44 = v31;
          [v30 enumerateKeysAndObjectsUsingBlock:v43];

          v32 = [v31 metadata];
          v33 = [v32 objectForKeyedSubscript:@"isRoot"];
          LOBYTE(v2_Block_object_dispose(&location, 8) = [v33 BOOLValue];

          if ((v28 & 1) == 0)
          {
            v34 = [v31 metadata];
            if ([v17 wasPreinstalled]) {
              uint64_t v35 = @"YES";
            }
            else {
              uint64_t v35 = @"NO";
            }
            [v34 setObject:v35 forKey:@"preinstalled"];
          }
          [v10 setLevel:v31];

          [v38 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v6);
  }

  return v38;
}

void sub_2379B7FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void createError(void *a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08320];
    v9[0] = a2;
    id v4 = NSDictionary;
    id v5 = a2;
    uint64_t v6 = [v4 dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v7 = [v3 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v6];

    *a1 = v7;
  }
}

void __levelFromAsset_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = *(void **)(a1 + 32);
      id v8 = v5;
      id v9 = [v7 metadata];
      [v9 setObject:v8 forKey:v6];
    }
  }
  else
  {
    id v6 = 0;
  }
}

void sub_2379B9FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t upgradeBlocks_block_invoke()
{
  return 1;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_2379BC208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2379BC58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2379BC864(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_2379BD7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2379BDCB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2379BE0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2379BEF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2379BF6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2379BFE50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2379C11B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_2379C237C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2379C267C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2379C2D90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_2379C34B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2379C3B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_2379C47FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2379C6444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2379C6688(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2379C70B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMorphunAssetsClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_26AF0BB00;
  uint64_t v7 = qword_26AF0BB00;
  if (!qword_26AF0BB00)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getMorphunAssetsClass_block_invoke;
    v3[3] = &unk_264CEAD58;
    v3[4] = &v4;
    __getMorphunAssetsClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_2379C8E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMorphunAssetsClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!qword_26AF0BB08)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __MorphunAssetsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264CEC088;
    uint64_t v6 = 0;
    qword_26AF0BB08 = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
    if (!qword_26AF0BB08)
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
    Class result = objc_getClass("MorphunAssets");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_26AF0BB00 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MorphunAssetsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_26AF0BB08 = result;
  return result;
}

UAFAutoBugCapture *UAFFaultCapture(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[UAFAutoBugCapture captureWithType:a2 subType:a3 context:a4 logCategory:a1];
}

id _MapTrialProjectsToNamespacesFromConfig()
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v0 = +[UAFConfigurationManager defaultManager];
  [v0 getAllAssetSets];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v38;
    uint64_t v26 = *(void *)v38;
    v27 = v0;
    do
    {
      uint64_t v4 = 0;
      uint64_t v29 = v2;
      do
      {
        if (*(void *)v38 != v3) {
          objc_enumerationMutation(obj);
        }
        long long v5 = *(void **)(*((void *)&v37 + 1) + 8 * v4);
        uint64_t v6 = [v5 name];
        uint64_t v7 = [v0 getAssetSet:v6];

        if ([v7 isTrialAvailable])
        {
          id v8 = (void *)MEMORY[0x263F80EB8];
          uint64_t v9 = [v5 trialProject];
          unsigned int v10 = [v8 projectIdFromName:v9];

          if (v10)
          {
            unsigned int v31 = v10;
            v32 = v7;
            id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            id v12 = [v5 assets];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v34;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v34 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  id v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                  os_log_t v18 = [v17 trialNamespace];

                  if (v18)
                  {
                    v19 = (void *)MEMORY[0x263F80EA8];
                    os_log_t v20 = [v17 trialNamespace];
                    uint64_t v21 = [v19 namespaceIdFromName:v20];

                    os_log_t v22 = [NSNumber numberWithUnsignedInt:v21];
                    [v11 addObject:v22];
                  }
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
              }
              while (v14);
            }

            v23 = [v11 allObjects];
            v24 = [NSNumber numberWithUnsignedInt:v31];
            [v28 setObject:v23 forKeyedSubscript:v24];

            uint64_t v3 = v26;
            uint64_t v0 = v27;
            uint64_t v2 = v29;
            uint64_t v7 = v32;
          }
        }

        ++v4;
      }
      while (v4 != v2);
      uint64_t v2 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v2);
  }

  return v28;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_2379DCEA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MAGetPallasAudience()
{
  return MEMORY[0x270F4A8E8]();
}

uint64_t MAGetPallasUrlForType()
{
  return MEMORY[0x270F4A8F0]();
}

uint64_t MASetPallasAudienceForType()
{
  return MEMORY[0x270F4A910]();
}

uint64_t MASetPallasUrlForType()
{
  return MEMORY[0x270F4A918]();
}

uint64_t MAStringForMAOperationResult()
{
  return MEMORY[0x270F4A938]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

uint64_t TRIProject_ProjectId_IsValidValue()
{
  return MEMORY[0x270F80720]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x270EE55F8]();
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

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
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

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x270ED9D38](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint64_t nw_path_create_default_evaluator()
{
  return MEMORY[0x270EF87D8]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x270EF8808]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x270EF8810]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x270EF8840]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x270EF89B8](path);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x270F9B4A8](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x270F9B538](a1, *(void *)&ms);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B550](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x270F9B560](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x270F9B660](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B678](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

char *__cdecl sqlite3_vmprintf(const char *a1, va_list a2)
{
  return (char *)MEMORY[0x270F9B8E8](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x270EDBCA8](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCF0](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}