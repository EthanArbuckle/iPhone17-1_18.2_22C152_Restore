uint64_t TLLogToneManagement()
{
  if (_TLLogInitialize__TLLogInitializationOnceToken != -1) {
    dispatch_once(&_TLLogInitialize__TLLogInitializationOnceToken, &__block_literal_global_8);
  }
  return _TLLogToneManagementHandle;
}

__CFString *NSStringFromTLAlertType(unint64_t a1)
{
  if (a1 > 0x1D)
  {
    v2 = @"????";
  }
  else
  {
    v2 = _TLAlertTypeDescriptions[a1];
  }
  return v2;
}

void sub_1DB938378(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

id getNPSDomainAccessorClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getNPSDomainAccessorClass_softClass;
  uint64_t v7 = getNPSDomainAccessorClass_softClass;
  if (!getNPSDomainAccessorClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getNPSDomainAccessorClass_block_invoke;
    v3[3] = &unk_1E6C210C8;
    v3[4] = &v4;
    __getNPSDomainAccessorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1DB938470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _TLToneManagerHandleTonePreferencesDidChangeNotification(uint64_t a1, void *a2)
{
  id v2 = a2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___TLToneManagerHandleTonePreferencesDidChangeNotification_block_invoke;
  v4[3] = &unk_1E6C20D60;
  id v5 = v2;
  id v3 = v2;
  [v3 _performBlockInAccessQueue:v4];
}

uint64_t _TLToneManagerHandleWatchAlertPrefersSalientNotificationPreferenceDidChangeLocallyNotification(uint64_t a1, void *a2)
{
  return [a2 _handleWatchPrefersSalientNotificationDidChange];
}

void _TLToneManagerHandleWatchAlertPrefersSalientNotificationPreferenceDidChangeRemotelyNotification(uint64_t a1, void *a2)
{
  _TLToneManagerHandleTonePreferencesDidChangeNotification(a1, a2);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"_TLAlertWatchPrefersSalientNotificationPreferenceDidChangeLocallyNotification", 0, 0, 1u);
}

void _TLToneManagerHandleDeviceRingtonesChangedNotification(uint64_t a1, void *a2)
{
  id v2 = a2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___TLToneManagerHandleDeviceRingtonesChangedNotification_block_invoke;
  v4[3] = &unk_1E6C20D60;
  id v5 = v2;
  id v3 = v2;
  [v3 _performBlockInAccessQueue:v4];
}

void sub_1DB938808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1DB938DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB939754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB9398A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB93A644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

id getSSDownloadFileManifestClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSSDownloadFileManifestClass_softClass;
  uint64_t v7 = getSSDownloadFileManifestClass_softClass;
  if (!getSSDownloadFileManifestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSSDownloadFileManifestClass_block_invoke;
    v3[3] = &unk_1E6C210C8;
    v3[4] = &v4;
    __getSSDownloadFileManifestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1DB93A804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB93AAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DB93B658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB93CDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB93D030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB93D408(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DB93D700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB93FBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB940018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1DB9406D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DB9408DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB940E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB9411D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB9416EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB941994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB942558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB942FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB944D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB945DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB94643C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB946958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1DB946ED8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void __getNPSDomainAccessorClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("NPSDomainAccessor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNPSDomainAccessorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNPSDomainAccessorClass_block_invoke_cold_1();
    NanoPreferencesSyncLibrary();
  }
}

void NanoPreferencesSyncLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __NanoPreferencesSyncLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6C210E8;
    uint64_t v3 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __NanoPreferencesSyncLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoPreferencesSyncLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSSDownloadFileManifestClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!StoreServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __StoreServicesLibraryCore_block_invoke;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6C21100;
    uint64_t v6 = 0;
    StoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!StoreServicesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("SSDownloadFileManifest");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getSSDownloadFileManifestClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSSDownloadFileManifestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __StoreServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  StoreServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getMPPlaybackArchiveClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __MediaPlayerLibraryCore_block_invoke;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6C21118;
    uint64_t v6 = 0;
    MediaPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!MediaPlayerLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("MPPlaybackArchive");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getMPPlaybackArchiveClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMPPlaybackArchiveClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MediaPlayerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaPlayerLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getNPSManagerClass_block_invoke(uint64_t a1)
{
  NanoPreferencesSyncLibrary();
  Class result = objc_getClass("NPSManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNPSManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getNPSManagerClass_block_invoke_cold_1();
    return (Class)__getTCCAccessPreflightSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getTCCAccessPreflightSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)TCCLibrary();
  Class result = dlsym(v2, "TCCAccessPreflight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getTCCAccessPreflightSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t TCCLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!TCCLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __TCCLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6C21130;
    uint64_t v5 = 0;
    TCCLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = TCCLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!TCCLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __TCCLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TCCLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkTCCServiceMediaLibrarySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)TCCLibrary();
  uint64_t result = dlsym(v2, "kTCCServiceMediaLibrary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkTCCServiceMediaLibrarySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1DB947C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB948098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void _TLAttentionAwarenessEffectAudioTapInitialize(const opaqueMTAudioProcessingTap *a1, void *a2, void **a3)
{
  *a3 = a2;
}

void _TLAttentionAwarenessEffectAudioTapFinalize(const opaqueMTAudioProcessingTap *a1)
{
  soft_MTAudioProcessingTapGetStorage(a1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v2 effectCoordinator];
  [v1 _unprepareAudioProcessingWithEffectAudioTapContext:v2];
  [v1 _finalizeAudioProcessingWithEffectAudioTapContext:v2];
}

void sub_1DB94819C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _TLAttentionAwarenessEffectAudioTapPrepare(const opaqueMTAudioProcessingTap *a1, uint64_t a2, const AudioStreamBasicDescription *a3)
{
  soft_MTAudioProcessingTapGetStorage(a1);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v6 effectCoordinator];
  [v5 _prepareAudioProcessingWithEffectAudioTapContext:v6 maximumNumberOfFrames:a2 processingFormat:a3];
}

void sub_1DB948230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _TLAttentionAwarenessEffectAudioTapUnprepare(const opaqueMTAudioProcessingTap *a1)
{
  uint64_t v1 = TLLogPlayback();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    _TLAttentionAwarenessEffectAudioTapUnprepare(v1);
  }
}

void _TLAttentionAwarenessEffectAudioTapProcess(const opaqueMTAudioProcessingTap *a1, uint64_t a2, unsigned int a3, AudioBufferList *a4, uint64_t *a5, unsigned int *a6)
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v11 = (uint64_t (*)(const opaqueMTAudioProcessingTap *, uint64_t, AudioBufferList *, unsigned int *, void, uint64_t *))getMTAudioProcessingTapGetSourceAudioSymbolLoc(void)::ptr;
  v21 = getMTAudioProcessingTapGetSourceAudioSymbolLoc(void)::ptr;
  if (!getMTAudioProcessingTapGetSourceAudioSymbolLoc(void)::ptr)
  {
    uint64_t v12 = (void *)MediaToolboxLibrary();
    v19[3] = (uint64_t)dlsym(v12, "MTAudioProcessingTapGetSourceAudio");
    getMTAudioProcessingTapGetSourceAudioSymbolLoc(void)::ptr = (_UNKNOWN *)v19[3];
    uint64_t v11 = (uint64_t (*)(const opaqueMTAudioProcessingTap *, uint64_t, AudioBufferList *, unsigned int *, void, uint64_t *))v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v11)
  {
    v17 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();

    _Unwind_Resume(v17);
  }
  int v13 = v11(a1, a2, a4, a6, 0, a5);
  if (v13)
  {
    int v14 = v13;
    uint64_t v15 = TLLogPlayback();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      _TLAttentionAwarenessEffectAudioTapProcess(v14, v15);
    }
  }
  else
  {
    uint64_t v15 = soft_MTAudioProcessingTapGetStorage(a1);
    uint64_t v16 = [v15 effectCoordinator];
    [v16 _processAudioWithEffectAudioTapContext:v15 bufferList:a4 numberOfFramesRequested:a2 numberOfFramesToProcess:*(unsigned int *)a5];
  }
}

void sub_1DB9485E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB948764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB948894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB948940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB9489E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DB948BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *___ZL38getMTAudioProcessingTapCreateSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = (void *)MediaToolboxLibrary();
  uint64_t result = dlsym(v2, "MTAudioProcessingTapCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMTAudioProcessingTapCreateSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MediaToolboxLibrary(void)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MediaToolboxLibraryCore(char **)::frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = ___ZL23MediaToolboxLibraryCorePPc_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6C21190;
    uint64_t v5 = 0;
    MediaToolboxLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = MediaToolboxLibraryCore(char **)::frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!MediaToolboxLibraryCore(char **)::frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t ___ZL23MediaToolboxLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaToolboxLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

uint64_t soft_MTAudioProcessingTapGetStorage(const opaqueMTAudioProcessingTap *a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  id v2 = (uint64_t (*)(const opaqueMTAudioProcessingTap *))getMTAudioProcessingTapGetStorageSymbolLoc(void)::ptr;
  uint64_t v9 = getMTAudioProcessingTapGetStorageSymbolLoc(void)::ptr;
  if (!getMTAudioProcessingTapGetStorageSymbolLoc(void)::ptr)
  {
    uint64_t v3 = (void *)MediaToolboxLibrary();
    v7[3] = (uint64_t)dlsym(v3, "MTAudioProcessingTapGetStorage");
    getMTAudioProcessingTapGetStorageSymbolLoc(void)::ptr = (_UNKNOWN *)v7[3];
    id v2 = (uint64_t (*)(const opaqueMTAudioProcessingTap *))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    uint64_t v5 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2(a1);
}

void *___ZL42getMTAudioProcessingTapGetStorageSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = (void *)MediaToolboxLibrary();
  uint64_t result = dlsym(v2, "MTAudioProcessingTapGetStorage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMTAudioProcessingTapGetStorageSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *___ZL46getMTAudioProcessingTapGetSourceAudioSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = (void *)MediaToolboxLibrary();
  uint64_t result = dlsym(v2, "MTAudioProcessingTapGetSourceAudio");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMTAudioProcessingTapGetSourceAudioSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void sub_1DB9491B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromTLAlertPlaybackCompletionType(unint64_t a1)
{
  if (a1 > 5)
  {
    id v2 = @"????";
  }
  else
  {
    id v2 = _TLAlertPlaybackCompletionTypeDescriptions[a1];
  }
  return v2;
}

uint64_t TLAlertPlaybackCompletionTypeFromString(void *a1)
{
  uint64_t v2 = 0;
  do
  {
    char v3 = [a1 isEqualToString:_TLAlertPlaybackCompletionTypeDescriptions[v2]];
    uint64_t v4 = v2 + 1;
    if (v3) {
      break;
    }
  }
  while (v2++ != 5);
  return v4 - 1;
}

void sub_1DB94D7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromTLAlertTargetDevice(unint64_t a1)
{
  if (a1 > 1)
  {
    uint64_t v2 = @"????";
  }
  else
  {
    uint64_t v2 = _TLAlertTargetDeviceDescriptions[a1];
  }
  return v2;
}

uint64_t TLAlertTargetDeviceFromString(void *a1)
{
  char v2 = 0;
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = v3;
    char v5 = v2;
    int v6 = [a1 isEqualToString:_TLAlertTargetDeviceDescriptions[v3]];
    if (v6) {
      break;
    }
    char v2 = 1;
    uint64_t v3 = 1;
  }
  while ((v5 & 1) == 0);
  if (v6) {
    return v4;
  }
  else {
    return 0;
  }
}

__CFString *_TLAlertTargetDeviceGetHumanReadableDescription(unint64_t a1)
{
  if (a1 > 1)
  {
    char v2 = 0;
  }
  else
  {
    char v2 = _TLAlertTargetDeviceHumanReadableDescriptions[a1];
  }
  return v2;
}

void sub_1DB94EF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

id getSSDownloadKindRingtone()
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getSSDownloadKindRingtoneSymbolLoc_ptr;
  uint64_t v8 = getSSDownloadKindRingtoneSymbolLoc_ptr;
  if (!getSSDownloadKindRingtoneSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)StoreServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "SSDownloadKindRingtone");
    getSSDownloadKindRingtoneSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  char v2 = *v0;

  return v2;
}

id getSSDownloadKindTone()
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getSSDownloadKindToneSymbolLoc_ptr;
  uint64_t v8 = getSSDownloadKindToneSymbolLoc_ptr;
  if (!getSSDownloadKindToneSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)StoreServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "SSDownloadKindTone");
    getSSDownloadKindToneSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  char v2 = *v0;

  return v2;
}

id getSSAccountStoreChangedNotification()
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getSSAccountStoreChangedNotificationSymbolLoc_ptr;
  uint64_t v8 = getSSAccountStoreChangedNotificationSymbolLoc_ptr;
  if (!getSSAccountStoreChangedNotificationSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)StoreServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "SSAccountStoreChangedNotification");
    getSSAccountStoreChangedNotificationSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  char v2 = *v0;

  return v2;
}

id getSSAccountStoreClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSSAccountStoreClass_softClass;
  uint64_t v7 = getSSAccountStoreClass_softClass;
  if (!getSSAccountStoreClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSSAccountStoreClass_block_invoke;
    v3[3] = &unk_1E6C210C8;
    v3[4] = &v4;
    __getSSAccountStoreClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1DB94F430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB94F658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1DB950604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB950B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB9510E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1DB951BA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 176));
  _Unwind_Resume(a1);
}

Class __getSSDownloadManagerOptionsClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary();
  Class result = objc_getClass("SSDownloadManagerOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSDownloadManagerOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSSDownloadManagerOptionsClass_block_invoke_cold_1();
    return (Class)StoreServicesLibrary();
  }
  return result;
}

uint64_t StoreServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!StoreServicesLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __StoreServicesLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6C213F0;
    uint64_t v5 = 0;
    StoreServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = StoreServicesLibraryCore_frameworkLibrary_0;
  id v1 = (void *)v3[0];
  if (!StoreServicesLibraryCore_frameworkLibrary_0)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __StoreServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  StoreServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getSSDownloadKindRingtoneSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadKindRingtone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadKindRingtoneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadKindToneSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadKindTone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadKindToneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadExternalPropertyBytesDownloaded");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadExternalPropertyPercentCompleteSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadExternalPropertyPercentComplete");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadExternalPropertyPolicySizeLimit");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadExternalPropertyRentalInformationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadExternalPropertyRentalInformation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void *__getSSDownloadPropertyClientBundleIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyClientBundleIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyDownloadPhaseSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyDownloadPhase");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyEncodedErrorDataSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyEncodedErrorData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyIsRestoreSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyIsRestore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyIsRestoreSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyKindSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyKind");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyKindSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyReasonSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyReason");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyReasonSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyStoreItemIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyStoreItemIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyTitleSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyTitle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyTitleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyHandlerIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyHandlerID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyHandlerIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyCollectionNameSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyCollectionName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyCollectionNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyArtistNameSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyArtistName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyArtistNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyGenreSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyGenre");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyGenreSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyDurationInMillisecondsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  uint64_t result = dlsym(v2, "SSDownloadPropertyDurationInMilliseconds");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyDurationInMillisecondsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSSDownloadManagerClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary();
  Class result = objc_getClass("SSDownloadManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSDownloadManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSSDownloadManagerClass_block_invoke_cold_1();
    return (Class)__getSSPurchaseManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getSSPurchaseManagerClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary();
  Class result = objc_getClass("SSPurchaseManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSPurchaseManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSSPurchaseManagerClass_block_invoke_cold_1();
    return (Class)__getSSAccountStoreChangedNotificationSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getSSAccountStoreChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  Class result = dlsym(v2, "SSAccountStoreChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSAccountStoreChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSSAccountStoreClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary();
  Class result = objc_getClass("SSAccountStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSAccountStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSSAccountStoreClass_block_invoke_cold_1();
    return (Class)__getSSItemKindToneSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getSSItemKindToneSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  Class result = dlsym(v2, "SSItemKindTone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSItemKindToneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSItemKindRingtoneSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  Class result = dlsym(v2, "SSItemKindRingtone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSItemKindRingtoneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSItemStoreFrontURLForItemKindSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  Class result = dlsym(v2, "SSItemStoreFrontURLForItemKind");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSItemStoreFrontURLForItemKindSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUIApplicationClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __UIKitLibraryCore_block_invoke;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6C21408;
    uint64_t v6 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!UIKitLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("UIApplication");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getUIApplicationClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getUIApplicationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSSTonePurchaseClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary();
  Class result = objc_getClass("SSTonePurchase");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSTonePurchaseClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSSTonePurchaseClass_block_invoke_cold_1();
    return (Class)__getSSItemToneStyleRingtoneSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getSSItemToneStyleRingtoneSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  Class result = dlsym(v2, "SSItemToneStyleRingtone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSItemToneStyleRingtoneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSItemToneStyleTextToneSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  Class result = dlsym(v2, "SSItemToneStyleTextTone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSItemToneStyleTextToneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPropertyIsRedownloadSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  Class result = dlsym(v2, "SSDownloadPropertyIsRedownload");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyIsRedownloadSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSSMutableURLRequestPropertiesClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary();
  Class result = objc_getClass("SSMutableURLRequestProperties");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSMutableURLRequestPropertiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSSMutableURLRequestPropertiesClass_block_invoke_cold_1();
    return (Class)__getSSDownloadPhaseFinishedSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getSSDownloadPhaseFinishedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  Class result = dlsym(v2, "SSDownloadPhaseFinished");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhaseFinishedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPhaseFailedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  Class result = dlsym(v2, "SSDownloadPhaseFailed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhaseFailedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSDownloadPhaseCanceledSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  Class result = dlsym(v2, "SSDownloadPhaseCanceled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPhaseCanceledSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSSDownloadClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary();
  Class result = objc_getClass("SSDownload");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSDownloadClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSSDownloadClass_block_invoke_cold_1();
    return (Class)__getSSDownloadPropertyIsStoreDownloadSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getSSDownloadPropertyIsStoreDownloadSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary();
  Class result = dlsym(v2, "SSDownloadPropertyIsStoreDownload");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDownloadPropertyIsStoreDownloadSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t TLAlertTypeFromString(void *a1)
{
  uint64_t v2 = 0;
  while (([a1 isEqualToString:_TLAlertTypeDescriptions[v2]] & 1) == 0)
  {
    if (++v2 == 30) {
      return 0;
    }
  }
  return v2;
}

__CFString *_TLAlertTypeGetHumanReadableDescription(unint64_t a1)
{
  if (a1 > 0x1D)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = _TLAlertTypeHumanReadableDescriptions[a1];
  }
  return v2;
}

void _TLAlertTypeValidateConsistencyOfEnumeration()
{
  if (_TLAlertTypeValidateConsistencyOfEnumeration__TLAlertTypeValidateConsistencyOfEnumerationOnceToken != -1) {
    dispatch_once(&_TLAlertTypeValidateConsistencyOfEnumeration__TLAlertTypeValidateConsistencyOfEnumerationOnceToken, &__block_literal_global_2);
  }
}

void sub_1DB953A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v15 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  uint64_t v18 = va_arg(va2, void);
  uint64_t v19 = va_arg(va2, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

void sub_1DB953E84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _TLVibrationManagerHandleUserGeneratedVibrationsDidChangeNotification(uint64_t a1, void *a2)
{
  id v2 = a2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___TLVibrationManagerHandleUserGeneratedVibrationsDidChangeNotification_block_invoke;
  v4[3] = &unk_1E6C20D60;
  id v5 = v2;
  id v3 = v2;
  [v3 _performBlockInAccessQueue:v4];
}

uint64_t _TLVibrationManagerHandleVibrationPreferencesDidChangeNotification(uint64_t a1, void *a2)
{
  return [a2 _handleVibrationPreferencesDidChangeNotificationForPreferencesKinds:3 atInitiativeOfVibrationManager:0];
}

uint64_t _TLVibrationManagerHandleVibrateOnRingOrSilentDidChangeNotification(uint64_t a1, void *a2)
{
  return [a2 _handleVibrateOnRingOrSilentDidChangeNotification];
}

void sub_1DB9541E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DB9544AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB9564F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_1DB9569AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB957450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB957754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB957F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getNPSDomainAccessorClass_0()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getNPSDomainAccessorClass_softClass_0;
  uint64_t v7 = getNPSDomainAccessorClass_softClass_0;
  if (!getNPSDomainAccessorClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getNPSDomainAccessorClass_block_invoke_0;
    v3[3] = &unk_1E6C210C8;
    v3[4] = &v4;
    __getNPSDomainAccessorClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1DB958058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB95849C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB958AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB959368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB95967C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DB959998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void __getNPSDomainAccessorClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("NPSDomainAccessor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNPSDomainAccessorClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNPSDomainAccessorClass_block_invoke_cold_1();
    NanoPreferencesSyncLibrary_0();
  }
}

void NanoPreferencesSyncLibrary_0()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __NanoPreferencesSyncLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6C21990;
    uint64_t v3 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary_0)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __NanoPreferencesSyncLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  NanoPreferencesSyncLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getNPSManagerClass_block_invoke_0(uint64_t a1)
{
  NanoPreferencesSyncLibrary_0();
  Class result = objc_getClass("NPSManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNPSManagerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getNPSManagerClass_block_invoke_cold_1();
    return (Class)___TLVibrationManagerHandleUserGeneratedVibrationsDidChangeNotification_block_invoke(v3);
  }
  return result;
}

unint64_t TLAttentionAwarenessEffectParametersMake(float a1)
{
  return (unint64_t)LODWORD(a1) << 32;
}

void sub_1DB95B5A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
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

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

BOOL _TLVibrationPatternIsValidNumberWithPossibleExpectedTypeEncodings(void *a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, char *__s2, uint64_t a10)
{
  id v11 = a1;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v13 = 0;
  if (a2 && (isKindOfClass & 1) != 0)
  {
    uint64_t v14 = (const char *)[v11 objCType];
    if (!strcmp(v14, a2))
    {
      BOOL v13 = 1;
    }
    else
    {
      uint64_t v19 = (const char **)&a10;
      uint64_t v15 = __s2;
      if (__s2)
      {
        do
        {
          int v16 = strcmp(v14, v15);
          BOOL v13 = v16 == 0;
          if (!v16) {
            break;
          }
          uint64_t v17 = v19++;
          uint64_t v15 = *v17;
        }
        while (*v17);
      }
      else
      {
        BOOL v13 = 0;
      }
    }
  }

  return v13;
}

void sub_1DB961458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
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

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1DB964680(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1DB965E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNACAlertProxyClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!NanoAudioControlLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __NanoAudioControlLibraryCore_block_invoke;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6C21C08;
    uint64_t v6 = 0;
    NanoAudioControlLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!NanoAudioControlLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("NACAlertProxy");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getNACAlertProxyClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getNACAlertProxyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoAudioControlLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoAudioControlLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t TLLogGeneral()
{
  if (_TLLogInitialize__TLLogInitializationOnceToken != -1) {
    dispatch_once(&_TLLogInitialize__TLLogInitializationOnceToken, &__block_literal_global_8);
  }
  return _TLLogGeneralHandle;
}

uint64_t TLLogPlayback()
{
  if (_TLLogInitialize__TLLogInitializationOnceToken != -1) {
    dispatch_once(&_TLLogInitialize__TLLogInitializationOnceToken, &__block_literal_global_8);
  }
  return _TLLogPlaybackHandle;
}

uint64_t TLLogVibrationManagement()
{
  if (_TLLogInitialize__TLLogInitializationOnceToken != -1) {
    dispatch_once(&_TLLogInitialize__TLLogInitializationOnceToken, &__block_literal_global_8);
  }
  return _TLLogVibrationManagementHandle;
}

id getSSDeviceAvailableItemKindsChangedNotification()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getSSDeviceAvailableItemKindsChangedNotificationSymbolLoc_ptr;
  uint64_t v8 = getSSDeviceAvailableItemKindsChangedNotificationSymbolLoc_ptr;
  if (!getSSDeviceAvailableItemKindsChangedNotificationSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)StoreServicesLibrary_0();
    v6[3] = (uint64_t)dlsym(v1, "SSDeviceAvailableItemKindsChangedNotification");
    getSSDeviceAvailableItemKindsChangedNotificationSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_1DB967210(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1DB967730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getNRPairedDeviceRegistryClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getNRPairedDeviceRegistryClass_softClass;
  uint64_t v7 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v3[3] = &unk_1E6C210C8;
    v3[4] = &v4;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1DB96781C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSSDeviceAvailableItemKindsChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary_0();
  uint64_t result = dlsym(v2, "SSDeviceAvailableItemKindsChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSDeviceAvailableItemKindsChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

uint64_t StoreServicesLibrary_0()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!StoreServicesLibraryCore_frameworkLibrary_1)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __StoreServicesLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6C21C98;
    uint64_t v5 = 0;
    StoreServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = StoreServicesLibraryCore_frameworkLibrary_1;
  id v1 = (void *)v3[0];
  if (!StoreServicesLibraryCore_frameworkLibrary_1)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __StoreServicesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  StoreServicesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getSSDeviceClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary_0();
  Class result = objc_getClass("SSDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSDeviceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSSDeviceClass_block_invoke_cold_1();
    return (Class)__getSSItemKindRingtoneSymbolLoc_block_invoke_0(v3);
  }
  return result;
}

void *__getSSItemKindRingtoneSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary_0();
  Class result = dlsym(v2, "SSItemKindRingtone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSItemKindRingtoneSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSSItemKindToneSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)StoreServicesLibrary_0();
  Class result = dlsym(v2, "SSItemKindTone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSItemKindToneSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  NanoRegistryLibrary();
  Class result = objc_getClass("NRPairedDeviceRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNRPairedDeviceRegistryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNRPairedDeviceRegistryClass_block_invoke_cold_1();
    return (Class)NanoRegistryLibrary();
  }
  return result;
}

uint64_t NanoRegistryLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __NanoRegistryLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6C21CB0;
    uint64_t v5 = 0;
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = NanoRegistryLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __NanoRegistryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoRegistryLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getNRDevicePropertyNameSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRDevicePropertyName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertyNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DB9684B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

id getAWAttentionAwarenessConfigurationClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAWAttentionAwarenessConfigurationClass_softClass;
  uint64_t v7 = getAWAttentionAwarenessConfigurationClass_softClass;
  if (!getAWAttentionAwarenessConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAWAttentionAwarenessConfigurationClass_block_invoke;
    v3[3] = &unk_1E6C210C8;
    v3[4] = &v4;
    __getAWAttentionAwarenessConfigurationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1DB968598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB968844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
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

void sub_1DB9694C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __getAWAttentionAwarenessConfigurationClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AWAttentionAwarenessConfiguration");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAWAttentionAwarenessConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAWAttentionAwarenessConfigurationClass_block_invoke_cold_1();
    AttentionAwarenessLibrary();
  }
}

void AttentionAwarenessLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!AttentionAwarenessLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __AttentionAwarenessLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6C21D68;
    uint64_t v3 = 0;
    AttentionAwarenessLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!AttentionAwarenessLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AttentionAwarenessLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AttentionAwarenessLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAWAttentionAwarenessClientClass_block_invoke(uint64_t a1)
{
  AttentionAwarenessLibrary();
  Class result = objc_getClass("AWAttentionAwarenessClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAWAttentionAwarenessClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAWAttentionAwarenessClientClass_block_invoke_cold_1();
    return (Class)OUTLINED_FUNCTION_2_1(v3);
  }
  return result;
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1DB96ABA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_1DB96B4B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB96BA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1DB96BC48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *__getMKBDeviceFormattedForContentProtectionSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MobileKeyBagLibrary();
  Class result = dlsym(v2, "MKBDeviceFormattedForContentProtection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceFormattedForContentProtectionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MobileKeyBagLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __MobileKeyBagLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6C21FA8;
    uint64_t v5 = 0;
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = MobileKeyBagLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileKeyBagLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_1DB96C664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB96CC48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromTLToneImportStatusCode(unint64_t a1)
{
  if (a1 > 2)
  {
    long long v2 = @"????";
  }
  else
  {
    long long v2 = _TLToneImportStatusCodeDescriptions[a1];
  }
  return v2;
}

uint64_t TLToneImportStatusCodeFromString(void *a1)
{
  uint64_t v2 = 0;
  while (([a1 isEqualToString:_TLToneImportStatusCodeDescriptions[v2]] & 1) == 0)
  {
    if (++v2 == 3) {
      return 0;
    }
  }
  return v2;
}

void sub_1DB96D9B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB96DAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

__CFString *NSStringFromTLAlertOverridePolicy(unint64_t a1)
{
  if (a1 > 1)
  {
    uint64_t v2 = @"????";
  }
  else
  {
    uint64_t v2 = _TLAlertOverridePolicyDescriptions[a1];
  }
  return v2;
}

uint64_t TLAlertOverridePolicyFromString(void *a1)
{
  char v2 = 0;
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = v3;
    char v5 = v2;
    int v6 = [a1 isEqualToString:_TLAlertOverridePolicyDescriptions[v3]];
    if (v6) {
      break;
    }
    char v2 = 1;
    uint64_t v3 = 1;
  }
  while ((v5 & 1) == 0);
  if (v6) {
    return v4;
  }
  else {
    return 0;
  }
}

__CFString *NSStringFromTLWatchAlertPolicy(unint64_t a1)
{
  if (a1 > 3)
  {
    char v2 = @"????";
  }
  else
  {
    char v2 = _TLWatchAlertPolicyDescriptions[a1];
  }
  return v2;
}

uint64_t TLWatchAlertPolicyFromString(void *a1)
{
  uint64_t v2 = 0;
  while (([a1 isEqualToString:_TLWatchAlertPolicyDescriptions[v2]] & 1) == 0)
  {
    if (++v2 == 4) {
      return 0;
    }
  }
  return v2;
}

void sub_1DB96FD34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB96FF28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
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

void sub_1DB970188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB97032C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB9704EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB970DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB972BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getUIBackgroundTaskInvalid()
{
  uint64_t v4 = 0;
  char v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getUIBackgroundTaskInvalidSymbolLoc_ptr;
  uint64_t v7 = getUIBackgroundTaskInvalidSymbolLoc_ptr;
  if (!getUIBackgroundTaskInvalidSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)UIKitLibrary();
    v5[3] = (uint64_t)dlsym(v1, "UIBackgroundTaskInvalid");
    getUIBackgroundTaskInvalidSymbolLoc_ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

void sub_1DB97355C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1DB973E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB9753AC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t soft_CMTimeMakeWithSeconds(double a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t, double))getCMTimeMakeWithSecondsSymbolLoc_ptr;
  uint64_t v9 = getCMTimeMakeWithSecondsSymbolLoc_ptr;
  if (!getCMTimeMakeWithSecondsSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)CoreMediaLibrary();
    v7[3] = (uint64_t)dlsym(v3, "CMTimeMakeWithSeconds");
    getCMTimeMakeWithSecondsSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    uint64_t v2 = (uint64_t (*)(uint64_t, double))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    char v5 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2(600, a1);
}

void sub_1DB977000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB9797A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIApplicationClass_block_invoke_0(uint64_t a1)
{
  UIKitLibrary();
  Class result = objc_getClass("UIApplication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUIApplicationClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getUIApplicationClass_block_invoke_cold_1();
    return (Class)UIKitLibrary();
  }
  return result;
}

uint64_t UIKitLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __UIKitLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6C22180;
    uint64_t v5 = 0;
    UIKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = UIKitLibraryCore_frameworkLibrary_0;
  uint64_t v1 = (void *)v3[0];
  if (!UIKitLibraryCore_frameworkLibrary_0)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __UIKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getUIBackgroundTaskInvalidSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary();
  uint64_t result = dlsym(v2, "UIBackgroundTaskInvalid");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIBackgroundTaskInvalidSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCMTimeCompareSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreMediaLibrary();
  uint64_t result = dlsym(v2, "CMTimeCompare");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCMTimeCompareSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreMediaLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreMediaLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CoreMediaLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6C22198;
    uint64_t v5 = 0;
    CoreMediaLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CoreMediaLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!CoreMediaLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __CoreMediaLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreMediaLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getCMTimeMakeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreMediaLibrary();
  uint64_t result = dlsym(v2, "CMTimeMake");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCMTimeMakeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMPMediaPropertyPredicateClass_block_invoke(uint64_t a1)
{
  MediaPlayerLibrary();
  Class result = objc_getClass("MPMediaPropertyPredicate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMPMediaPropertyPredicateClass_block_invoke_cold_1();
  }
  getMPMediaPropertyPredicateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MediaPlayerLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MediaPlayerLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __MediaPlayerLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6C221B0;
    uint64_t v5 = 0;
    MediaPlayerLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = MediaPlayerLibraryCore_frameworkLibrary_0;
  uint64_t v1 = (void *)v3[0];
  if (!MediaPlayerLibraryCore_frameworkLibrary_0)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __MediaPlayerLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  MediaPlayerLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getMPMediaItemPropertyPersistentIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaPlayerLibrary();
  uint64_t result = dlsym(v2, "MPMediaItemPropertyPersistentID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMPMediaItemPropertyPersistentIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMPMediaQueryClass_block_invoke(uint64_t a1)
{
  MediaPlayerLibrary();
  Class result = objc_getClass("MPMediaQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMPMediaQueryClass_block_invoke_cold_1();
  }
  getMPMediaQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMPMediaItemPropertyFilePathSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MediaPlayerLibrary();
  Class result = dlsym(v2, "MPMediaItemPropertyFilePath");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMPMediaItemPropertyFilePathSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCMTimeGetSecondsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreMediaLibrary();
  Class result = dlsym(v2, "CMTimeGetSeconds");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCMTimeGetSecondsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCMTimeMakeWithSecondsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreMediaLibrary();
  Class result = dlsym(v2, "CMTimeMakeWithSeconds");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCMTimeMakeWithSecondsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCMTimeZeroSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreMediaLibrary();
  Class result = dlsym(v2, "kCMTimeZero");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCMTimeZeroSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id TLLocalizedString(void *a1)
{
  id v1 = a1;
  if (TLLocalizedString__TLLocalizedStringBundleOnceToken != -1) {
    dispatch_once(&TLLocalizedString__TLLocalizedStringBundleOnceToken, &__block_literal_global_16);
  }
  uint64_t v2 = [(id)TLLocalizedString__TLLocalizedStringBundle localizedStringForKey:v1 value:&stru_1F35F7550 table:@"TL"];
  uint64_t v3 = v2;
  if ((!v2 || [v2 isEqualToString:v1]) && _os_feature_enabled_impl())
  {
    uint64_t v4 = [(id)TLLocalizedString__TLLocalizedStringBundle localizedStringForKey:v1 value:&stru_1F35F7550 table:@"TL-EncoreInfinitum"];

    uint64_t v3 = (void *)v4;
  }

  return v3;
}

uint64_t __TLLocalizedString_block_invoke()
{
  TLLocalizedString__TLLocalizedStringBundle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  return MEMORY[0x1F41817F8]();
}

uint64_t __getNPSDomainAccessorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSSDownloadFileManifestClass_block_invoke_cold_1(v0);
}

uint64_t __getSSDownloadFileManifestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMPPlaybackArchiveClass_block_invoke_cold_1(v0);
}

uint64_t __getMPPlaybackArchiveClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getNPSManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getNPSManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return _TLAttentionAwarenessEffectAudioTapUnprepare(v0);
}

void _TLAttentionAwarenessEffectAudioTapUnprepare(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1DB936000, log, OS_LOG_TYPE_DEBUG, "TLAttentionAwarenessEffectCoordinator: MTAudioProcessingTap unprepare called.", v1, 2u);
}

void _TLAttentionAwarenessEffectAudioTapProcess(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DB936000, a2, OS_LOG_TYPE_ERROR, "TLAttentionAwarenessEffectCoordinator: Encountered error with code %d upon getting source audio.", (uint8_t *)v2, 8u);
}

uint64_t __getSSDownloadManagerOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSSDownloadManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getSSDownloadManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSSPurchaseManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getSSPurchaseManagerClass_block_invoke_cold_1()
{
  return __getSSAccountStoreClass_block_invoke_cold_1();
}

uint64_t __getSSAccountStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getUIApplicationClass_block_invoke_cold_1(v0);
}

uint64_t __getUIApplicationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSSTonePurchaseClass_block_invoke_cold_1(v0);
}

uint64_t __getSSTonePurchaseClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSSMutableURLRequestPropertiesClass_block_invoke_cold_1(v0);
}

uint64_t __getSSMutableURLRequestPropertiesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSSDownloadClass_block_invoke_cold_1(v0);
}

uint64_t __getSSDownloadClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_cold_1(v0);
}

uint64_t __getNACAlertProxyClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSSDeviceClass_block_invoke_cold_1(v0);
}

uint64_t __getSSDeviceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getNRPairedDeviceRegistryClass_block_invoke_cold_1(v0);
}

uint64_t __getNRPairedDeviceRegistryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[TLAttentionAwarenessObserver _beginPollingForAttention](v0);
}

uint64_t __getAWAttentionAwarenessConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAWAttentionAwarenessClientClass_block_invoke_cold_1(v0);
}

uint64_t __getAWAttentionAwarenessClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[TLContentProtectionStateObserver _cancelFirstUnlockNotifyToken](v0);
}

void __getMPMediaPropertyPredicateClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPMediaQueryClass_block_invoke_cold_1(v0);
}

void __getMPMediaQueryClass_block_invoke_cold_1()
{
}

uint64_t AudioServicesCreateSystemSoundIDWithOptions()
{
  return MEMORY[0x1F40D4E18]();
}

OSStatus AudioServicesDisposeSystemSoundID(SystemSoundID inSystemSoundID)
{
  return MEMORY[0x1F40D4E28](*(void *)&inSystemSoundID);
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x1F40D4E48]();
}

uint64_t AudioServicesStopSystemSound()
{
  return MEMORY[0x1F40D4E70]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7EC0](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t CPSystemRootDirectory()
{
  return MEMORY[0x1F4109900]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
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
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
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

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1F40CC160](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}