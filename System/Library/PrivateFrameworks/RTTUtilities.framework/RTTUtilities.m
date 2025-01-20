void sub_21FEAC16C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10)
{
  id *v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  uint64_t v15;

  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v15 - 128));
  _Unwind_Resume(a1);
}

void sub_21FEAD9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_21FEAE14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FEAE928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FEAF6A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    if (![MEMORY[0x263F472B0] isInternalInstall])
    {
      v10 = AXLogRTT();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __39__RTTController_handleDatabaseRequest___block_invoke_cold_1();
      }

      objc_end_catch();
      JUMPOUT(0x21FEAF034);
    }
    objc_exception_throw(v9);
  }
  _Unwind_Resume(exception_object);
}

void sub_21FEB06FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXUIClientClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AccessibilityUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AccessibilityUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264540270;
    uint64_t v6 = 0;
    AccessibilityUILibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!AccessibilityUILibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("AXUIClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getAXUIClientClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
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

void __getSFSpeechRecognizerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SFSpeechRecognizer");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFSpeechRecognizerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSFSpeechRecognizerClass_block_invoke_cold_1();
    SpeechLibrary();
  }
}

void SpeechLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!SpeechLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __SpeechLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2645402A8;
    uint64_t v3 = 0;
    SpeechLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!SpeechLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __SpeechLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpeechLibraryCore_frameworkLibrary = result;
  return result;
}

void __getSFSpeechURLRecognitionRequestClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SFSpeechURLRecognitionRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFSpeechURLRecognitionRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSFSpeechURLRecognitionRequestClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0();
  }
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id accessibilityRTTUtilitiesBundle()
{
  v0 = (void *)accessibilityRTTUtilitiesBundle_AXBundle;
  if (!accessibilityRTTUtilitiesBundle_AXBundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v2 = (void *)accessibilityRTTUtilitiesBundle_AXBundle;
    accessibilityRTTUtilitiesBundle_AXBundle = v1;

    v0 = (void *)accessibilityRTTUtilitiesBundle_AXBundle;
  }

  return v0;
}

id ttyLocString(void *a1)
{
  id v1 = a1;
  long long v2 = accessibilityRTTUtilitiesBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:v1 table:@"TTYSupport"];

  return v3;
}

id ttyLocStringAndLocale(void *a1, void *a2)
{
  id v3 = a1;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v5 = a2;
  uint64_t v6 = accessibilityRTTUtilitiesBundle();
  CFURLRef v7 = [v6 bundleURL];
  CFBundleRef v8 = CFBundleCreate(v4, v7);

  uint64_t v9 = (void *)CFBundleCopyLocalizedStringForLocalization();
  if ([v9 isEqualToString:v3])
  {
    uint64_t v10 = ttyLocString(v3);

    uint64_t v9 = (void *)v10;
  }
  if (v8) {
    CFRelease(v8);
  }

  return v9;
}

void sub_21FEB1E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FEB20C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void transportMethodDidChange()
{
  id v0 = +[RTTTelephonyUtilities sharedUtilityProvider];
  [v0 headphoneStateChangedNotification:0];
}

void sub_21FEB38F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FEB3A1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FEB4348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FEB46E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_21FEB48F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FEB52F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FEB5A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FEB94EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_21FEBADF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FEBB6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void destructor(id a1)
{
  if (a1) {
}
  }

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_21FEBDFB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_21FEBF334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_21FEBF800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FEBFC30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

Class __getAXSpringBoardServerClass_block_invoke(uint64_t a1)
{
  AccessibilityUtilitiesLibrary();
  Class result = objc_getClass("AXSpringBoardServer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAXSpringBoardServerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAXSpringBoardServerClass_block_invoke_cold_1();
    return (Class)AccessibilityUtilitiesLibrary();
  }
  return result;
}

uint64_t AccessibilityUtilitiesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __AccessibilityUtilitiesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2645407D8;
    uint64_t v5 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AccessibilityUtilitiesLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
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

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAXInCallServiceNameSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AccessibilityUtilitiesLibrary();
  uint64_t result = dlsym(v2, "AXInCallServiceName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXInCallServiceNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void RTTSetDownlinkMute(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v2 = [MEMORY[0x263F544E0] sharedAVSystemController];
  id v3 = [NSNumber numberWithBool:a1];
  uint64_t v4 = *MEMORY[0x263F54378];
  id v7 = 0;
  [v2 setAttribute:v3 forKey:v4 error:&v7];
  id v5 = v7;

  uint64_t v6 = AXLogRTT();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v9 = a1;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_21FEA9000, v6, OS_LOG_TYPE_INFO, "Toggled downlink mute: %d - err: %@", buf, 0x12u);
  }
}

void RTTRequestNotificationAuthorization()
{
  uint64_t v0 = +[RTTSettings sharedInstance];
  char v1 = [v0 showsRTTNotifications];

  if (v1)
  {
    RTTNotificationCenter();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 requestAuthorizationWithOptions:32 completionHandler:&__block_literal_global_4];
  }
  else
  {
    long long v2 = AXLogRTT();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FEA9000, v2, OS_LOG_TYPE_INFO, "Not requesting user notification permission because feature is user disabled", buf, 2u);
    }
  }
}

id RTTNotificationCenter()
{
  if (RTTNotificationCenter_onceToken != -1) {
    dispatch_once(&RTTNotificationCenter_onceToken, &__block_literal_global_11);
  }
  uint64_t v0 = (void *)RTTNotificationCenter_rttNotificationCenter;

  return v0;
}

void __RTTRequestNotificationAuthorization_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Requested authorization to show notification: %d %@", (uint8_t *)v6, 0x12u);
  }
}

void RTTGenerateUserNotificationForContact(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = +[RTTSettings sharedInstance];
  char v12 = [v11 showsRTTNotifications];

  if (v12)
  {
    v13 = (void *)UtteranceCoalescer;
    if (!UtteranceCoalescer)
    {
      id v14 = objc_alloc_init(MEMORY[0x263F21398]);
      v15 = (void *)UtteranceCoalescer;
      UtteranceCoalescer = (uint64_t)v14;

      [(id)UtteranceCoalescer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
      v13 = (void *)UtteranceCoalescer;
    }
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __RTTGenerateUserNotificationForContact_block_invoke;
    v17[3] = &unk_264540818;
    v18 = v7;
    id v19 = v8;
    id v20 = v9;
    id v21 = v10;
    [v13 afterDelay:v17 processBlock:5.0];

    v16 = v18;
  }
  else
  {
    v16 = AXLogRTT();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FEA9000, v16, OS_LOG_TYPE_INFO, "Not generating user notification because feature is user disabled", buf, 2u);
    }
  }
}

void __RTTGenerateUserNotificationForContact_block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  char v1 = *(void **)(a1 + 40);
  long long v2 = *(void **)(a1 + 48);
  id v3 = *(void **)(a1 + 56);
  id v4 = *(id *)(a1 + 32);
  id v5 = v1;
  id v6 = v2;
  id v7 = v3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v8 = (void *)getUNMutableNotificationContentClass_softClass;
  uint64_t v26 = getUNMutableNotificationContentClass_softClass;
  if (!getUNMutableNotificationContentClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v30 = __getUNMutableNotificationContentClass_block_invoke;
    v31 = &unk_264540250;
    v32 = &v23;
    __getUNMutableNotificationContentClass_block_invoke((uint64_t)&buf);
    id v8 = (void *)v24[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v23, 8);
  id v10 = objc_opt_new();
  id v11 = objc_msgSend(v6, "text", v23);
  [v10 setBody:v11];

  [v10 setCategoryIdentifier:@"com.apple.RTTNotifications.message"];
  [v10 setTitle:v4];
  [v10 setThreadIdentifier:v7];
  char v12 = [NSURL faceTimeShowInCallUIURL];
  [v10 setDefaultActionURL:v12];

  [v10 setShouldSuppressDefaultAction:0];
  [v10 setShouldAuthenticateDefaultAction:0];
  v13 = [MEMORY[0x263EFF910] date];
  id v14 = [v13 dateByAddingTimeInterval:3600.0];
  [v10 setExpirationDate:v14];

  v27 = @"CallUID";
  id v28 = v7;
  v15 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  [v10 setUserInfo:v15];

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  v16 = (void *)getUNNotificationRequestClass_softClass;
  uint64_t v26 = getUNNotificationRequestClass_softClass;
  if (!getUNNotificationRequestClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v30 = __getUNNotificationRequestClass_block_invoke;
    v31 = &unk_264540250;
    v32 = &v23;
    __getUNNotificationRequestClass_block_invoke((uint64_t)&buf);
    v16 = (void *)v24[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v23, 8);
  v18 = objc_msgSend(MEMORY[0x263F08C38], "UUID", v23);
  id v19 = [v18 UUIDString];
  id v20 = [v17 requestWithIdentifier:v19 content:v10 trigger:0];

  id v21 = AXLogRTT();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v20;
    _os_log_impl(&dword_21FEA9000, v21, OS_LOG_TYPE_INFO, "Posting local notification: %@", (uint8_t *)&buf, 0xCu);
  }

  v22 = RTTNotificationCenter();
  [v22 addNotificationRequest:v20 withCompletionHandler:&__block_literal_global_32];
}

void sub_21FEC1DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void RTTRemoveUserNotifications(void *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v18 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v2 = RTTNotificationCenter();
  id v3 = [v2 deliveredNotifications];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v9 = [v8 request];
        id v10 = [v9 content];
        id v11 = [v10 threadIdentifier];
        int v12 = [v11 isEqualToString:v1];

        if (v12)
        {
          v13 = [v8 request];
          id v14 = [v13 identifier];
          [v18 addObject:v14];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v5);
  }

  v15 = AXLogRTT();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [v18 count];
    *(_DWORD *)long long buf = 134218242;
    uint64_t v24 = v16;
    __int16 v25 = 2112;
    id v26 = v1;
    _os_log_impl(&dword_21FEA9000, v15, OS_LOG_TYPE_INFO, "Removing %lu RTT notifications for call %@", buf, 0x16u);
  }

  id v17 = RTTNotificationCenter();
  [v17 removeDeliveredNotificationsWithIdentifiers:v18];
}

void __RTTNotificationCenter_block_invoke()
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  uint64_t v0 = (void *)getUNUserNotificationCenterClass_softClass;
  uint64_t v17 = getUNUserNotificationCenterClass_softClass;
  if (!getUNUserNotificationCenterClass_softClass)
  {
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    id v11 = __getUNUserNotificationCenterClass_block_invoke;
    int v12 = &unk_264540250;
    v13 = &v14;
    __getUNUserNotificationCenterClass_block_invoke((uint64_t)&v9);
    uint64_t v0 = (void *)v15[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v14, 8);
  uint64_t v2 = [[v1 alloc] initWithBundleIdentifier:@"com.apple.RTTNotifications"];
  id v3 = (void *)RTTNotificationCenter_rttNotificationCenter;
  RTTNotificationCenter_rttNotificationCenter = v2;

  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  uint64_t v4 = (void *)getUNNotificationCategoryClass_softClass;
  uint64_t v17 = getUNNotificationCategoryClass_softClass;
  if (!getUNNotificationCategoryClass_softClass)
  {
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    id v11 = __getUNNotificationCategoryClass_block_invoke;
    int v12 = &unk_264540250;
    v13 = &v14;
    __getUNNotificationCategoryClass_block_invoke((uint64_t)&v9);
    uint64_t v4 = (void *)v15[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v14, 8);
  uint64_t v6 = [v5 categoryWithIdentifier:@"com.apple.RTTNotifications.message" actions:MEMORY[0x263EFFA68] intentIdentifiers:MEMORY[0x263EFFA68] options:0];
  id v7 = (void *)RTTNotificationCenter_rttNotificationCenter;
  id v8 = [MEMORY[0x263EFFA08] setWithObject:v6];
  [v7 setNotificationCategories:v8];
}

void sub_21FEC21D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getUNUserNotificationCenterClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("UNUserNotificationCenter");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUNUserNotificationCenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getUNUserNotificationCenterClass_block_invoke_cold_1();
    UserNotificationsLibrary();
  }
}

void UserNotificationsLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!UserNotificationsLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __UserNotificationsLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264540838;
    uint64_t v3 = 0;
    UserNotificationsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!UserNotificationsLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __UserNotificationsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UserNotificationsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getUNNotificationCategoryClass_block_invoke(uint64_t a1)
{
  UserNotificationsLibrary();
  Class result = objc_getClass("UNNotificationCategory");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUNNotificationCategoryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getUNNotificationCategoryClass_block_invoke_cold_1();
    return (Class)___RTTSendUserNotification_block_invoke(v3);
  }
  return result;
}

Class __getUNMutableNotificationContentClass_block_invoke(uint64_t a1)
{
  UserNotificationsLibrary();
  Class result = objc_getClass("UNMutableNotificationContent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUNMutableNotificationContentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getUNMutableNotificationContentClass_block_invoke_cold_1();
    return (Class)__getUNNotificationRequestClass_block_invoke(v3);
  }
  return result;
}

RTTTranscriptionController *__getUNNotificationRequestClass_block_invoke(uint64_t a1)
{
  UserNotificationsLibrary();
  Class result = (RTTTranscriptionController *)objc_getClass("UNNotificationRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUNNotificationRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (RTTTranscriptionController *)__getUNNotificationRequestClass_block_invoke_cold_1();
    return [(RTTTranscriptionController *)v3 initWithDelegate:v5];
  }
  return result;
}

void sub_21FEC2730(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getAXLTLiveTranscriptionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!LiveTranscriptionLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __LiveTranscriptionLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264540898;
    uint64_t v6 = 0;
    LiveTranscriptionLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!LiveTranscriptionLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("AXLTLiveTranscription");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getAXLTLiveTranscriptionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAXLTLiveTranscriptionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LiveTranscriptionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LiveTranscriptionLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_21FEC3440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
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

void sub_21FEC3778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FEC3C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_21FEC4340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_21FEC4798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FEC4C10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_21FEC4F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&a9, 8) = a1;
}

void AccessibilitySettingsChangedOnCompanion()
{
  v6[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = AXLogRTT();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v5 = 0;
    _os_log_impl(&dword_21FEA9000, v0, OS_LOG_TYPE_INFO, "Settings changed on companion", v5, 2u);
  }

  v6[0] = kAXSTTYSoftwareEnabledPreference;
  v6[1] = kAXSTTYPreferredRelayNumberPreference;
  _DWORD v6[2] = kAXSTTYShouldBeRealtimePreference;
  v6[3] = @"TTYCannedResponsesPreference";
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  [v1 enumerateObjectsUsingBlock:&__block_literal_global_382];
  long long v2 = AXLogRTT();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v5 = 0;
    _os_log_impl(&dword_21FEA9000, v2, OS_LOG_TYPE_INFO, "Posting transport changed because accessibility settings on companion changed", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AXTTYPreferredTransportMethodChangedNotification", 0, 0, 1u);
  SEL v4 = +[RTTTelephonyUtilities sharedUtilityProvider];
  [v4 currentPreferredTransportMethod];
}

void sub_21FEC61D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _axSettingsHandlePreferenceChanged(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = +[RTTSettings sharedInstance];
  [v4 _handlePreferenceChanged:a3];
}

void sub_21FEC80C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void __AccessibilitySettingsChangedOnCompanion_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[RTTSettings sharedInstance];
  name = [v3 _notificationForPreferenceKey:v2];

  if (name)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
  }
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t AXTTYTextStreamToken()
{
  return [NSString stringWithUTF8String:*MEMORY[0x263F03518]];
}

uint64_t AXTTYIsTextHeldForRTTCall()
{
  return [NSString stringWithUTF8String:*MEMORY[0x263F03508]];
}

void sub_21FEC94B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FEC98CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
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

void sub_21FECA4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __getAXUIClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSFSpeechRecognizerClass_block_invoke_cold_1(v0);
}

uint64_t __getSFSpeechRecognizerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSFSpeechURLRecognitionRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getSFSpeechURLRecognitionRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[RTTTelephonyUtilities phoneNumberForContext:](v0);
}

uint64_t __getAXSpringBoardServerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getUNUserNotificationCenterClass_block_invoke_cold_1(v0);
}

uint64_t __getUNUserNotificationCenterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getUNNotificationCategoryClass_block_invoke_cold_1(v0);
}

uint64_t __getUNNotificationCategoryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___RTTSendUserNotification_block_invoke_cold_1(v0);
}

uint64_t __getUNMutableNotificationContentClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getUNNotificationRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getUNNotificationRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[RTTTranscriptionController startTranscribingForCallUUID:](v0);
}

uint64_t __getAXLTLiveTranscriptionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[RTTDatabaseManager conversationForCallUID:](v0);
}

uint64_t AXLogRTT()
{
  return MEMORY[0x270F09358]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x270F09428]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F09430]();
}

uint64_t AXProcessIsAxctl()
{
  return MEMORY[0x270F09488]();
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x270EE4580]();
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x270F905B0]();
}

uint64_t _AXSInUnitTestMode()
{
  return MEMORY[0x270F90870]();
}

uint64_t _AXSIsNonUIBuild()
{
  return MEMORY[0x270F908A0]();
}

uint64_t _AXSSoftwareTTYSetEnabled()
{
  return MEMORY[0x270F90AD0]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
}

void _Block_object_dispose(const void *a1, const int a2)
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x270ED9310]();
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

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x270ED9480](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
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

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x270ED9D28](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}