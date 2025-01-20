uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

id PSUILogForCategory(unint64_t a1)
{
  if (a1 >= 4) {
    PSUILogForCategory_cold_1();
  }
  if (PSUILogForCategory_loggingToken != -1) {
    dispatch_once(&PSUILogForCategory_loggingToken, &__block_literal_global_7);
  }
  v2 = (void *)PSUILogForCategory_logObjects[a1];
  return v2;
}

uint64_t __PSUILogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.SettingsAndCoreApps.PreferencesUI", "Base");
  v1 = (void *)PSUILogForCategory_logObjects;
  PSUILogForCategory_logObjects = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.SettingsAndCoreApps.PreferencesUI", "Passcode");
  v3 = (void *)qword_26AC32E68;
  qword_26AC32E68 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.SettingsAndCoreApps.PreferencesUI", "Data Migrator");
  v5 = (void *)qword_26AC32E70;
  qword_26AC32E70 = (uint64_t)v4;

  qword_26AC32E78 = (uint64_t)os_log_create("com.apple.SettingsAndCoreApps.PreferencesUI", "Signposts");
  return MEMORY[0x270F9A758]();
}

Class __getPKPaymentWebServiceClass_block_invoke(uint64_t a1)
{
  PassKitCoreLibrary();
  Class result = objc_getClass("PKPaymentWebService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPaymentWebServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPKPaymentWebServiceClass_block_invoke_cold_1();
    return (Class)__getPKPaymentRegistrationUtilitiesClass_block_invoke(v3);
  }
  return result;
}

void __getPKPaymentRegistrationUtilitiesClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PKPaymentRegistrationUtilities");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPaymentRegistrationUtilitiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPKPaymentRegistrationUtilitiesClass_block_invoke_cold_1();
    PassKitCoreLibrary();
  }
}

void PassKitCoreLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __PassKitCoreLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264E95A28;
    uint64_t v3 = 0;
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  os_log_t v0 = (void *)v1[0];
  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    os_log_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

void sub_23D33EE6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_23D33EF3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23D33F1F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D33FD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D340494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getEREyeReliefClientClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!EyeReliefLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __EyeReliefLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264E95440;
    uint64_t v6 = 0;
    EyeReliefLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!EyeReliefLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("EREyeReliefClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getEREyeReliefClientClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getEREyeReliefClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __EyeReliefLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  EyeReliefLibraryCore_frameworkLibrary = result;
  return result;
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

void __credentialSetWithPasscodeCredential_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:a2 length:a3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  int v9 = aks_verify_password(0, (const char *)[*(id *)(a1 + 32) UTF8String], objc_msgSend(*(id *)(a1 + 32), "length"), a2, a3);
  if (v9)
  {
    int v10 = v9;
    v11 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __credentialSetWithPasscodeCredential_block_invoke_cold_1(v10, v11);
    }
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_23D341A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D341EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D34205C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23D342B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D3439F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D34402C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D344B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D346998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D346C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getLAContextClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __LocalAuthenticationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264E95688;
    uint64_t v6 = 0;
    LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("LAContext");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getLAContextClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getLAContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LocalAuthenticationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LocalAuthenticationLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_23D347B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D348298(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_23D348760(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_23D3496E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D349A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D34A6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D34AE34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23D34B9EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_23D34C0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getLAContextClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!LocalAuthenticationLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __LocalAuthenticationLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264E95830;
    uint64_t v6 = 0;
    LocalAuthenticationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!LocalAuthenticationLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("LAContext");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getLAContextClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getLAContextClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LocalAuthenticationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  LocalAuthenticationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getBYFlowSkipControllerClass_block_invoke(uint64_t a1)
{
  SetupAssistantLibrary();
  Class result = objc_getClass("BYFlowSkipController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBYFlowSkipControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBYFlowSkipControllerClass_block_invoke_cold_1();
    return (Class)SetupAssistantLibrary();
  }
  return result;
}

uint64_t SetupAssistantLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __SetupAssistantLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264E95848;
    uint64_t v5 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = SetupAssistantLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!SetupAssistantLibraryCore_frameworkLibrary)
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

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getBYFlowSkipIdentifierTouchIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SetupAssistantLibrary();
  uint64_t result = dlsym(v2, "BYFlowSkipIdentifierTouchID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYFlowSkipIdentifierTouchIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_23D34D2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D34D6A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23D34DA44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D34E514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D34E718(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23D34ECF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D34FEE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_23D350DEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

Class __getBFFStyleClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SetupAssistantUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __SetupAssistantUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264E95A10;
    uint64_t v6 = 0;
    SetupAssistantUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SetupAssistantUILibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("BFFStyle");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getBFFStyleClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getBFFStyleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SetupAssistantUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPKWalletVisibilityClass_block_invoke(uint64_t a1)
{
  PassKitCoreLibrary();
  Class result = objc_getClass("PKWalletVisibility");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKWalletVisibilityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPKWalletVisibilityClass_block_invoke_cold_1();
    return (Class)__PassKitCoreLibraryCore_block_invoke();
  }
  return result;
}

uint64_t __PassKitCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_23D352884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_23D3532D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D353AFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23D353F04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23D354260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D355CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D35634C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_23D356FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
}

void sub_23D357604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D357954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D358248(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_23D3585A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D359478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D3597EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D359BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

void sub_23D35A22C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_23D35A8EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, id *a13)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v15);
  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak((id *)(v16 - 112));
  _Unwind_Resume(a1);
}

void sub_23D35A944()
{
}

uint64_t apple_numbers_changed_notification(uint64_t a1, void *a2)
{
  return [a2 updateGracePeriodSpecifier];
}

void dtoStatusChangedNotification(uint64_t a1, void *a2)
{
  uint64_t v3 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v5 = 0;
    _os_log_impl(&dword_23D33A000, v3, OS_LOG_TYPE_DEFAULT, "DTO: Received notification: Changed arm/overall state", v5, 2u);
  }

  if (a2)
  {
    [a2 handleDTOStatusChanged];
  }
  else
  {
    uint64_t v4 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      dtoStatusChangedNotification_cold_1();
    }
  }
}

void sub_23D35CDA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id getAFPreferencesClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAFPreferencesClass_softClass;
  uint64_t v7 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAFPreferencesClass_block_invoke;
    v3[3] = &unk_264E95420;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23D35D2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getLockdownModeManagerClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getLockdownModeManagerClass_softClass;
  uint64_t v7 = getLockdownModeManagerClass_softClass;
  if (!getLockdownModeManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getLockdownModeManagerClass_block_invoke;
    v3[3] = &unk_264E95420;
    v3[4] = &v4;
    __getLockdownModeManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23D35FAA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D35FFC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v9 - 112));
  _Unwind_Resume(a1);
}

void sub_23D361E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getHMHomeManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!HomeKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __HomeKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264E960A0;
    uint64_t v5 = 0;
    HomeKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!HomeKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getHMHomeManagerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("HMHomeManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getHMHomeManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HomeKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HomeKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAKAppleIDAuthenticationInAppContextClass_block_invoke(uint64_t a1)
{
  AuthKitLibrary();
  Class result = objc_getClass("AKAppleIDAuthenticationInAppContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1();
  }
  getAKAppleIDAuthenticationInAppContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void AuthKitLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __AuthKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264E960B8;
    uint64_t v3 = 0;
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AuthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AuthKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAKAppleIDAuthenticationControllerClass_block_invoke(uint64_t a1)
{
  AuthKitLibrary();
  Class result = objc_getClass("AKAppleIDAuthenticationController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1();
  }
  getAKAppleIDAuthenticationControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __AssistantServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264E960D0;
    uint64_t v5 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AssistantServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getAFPreferencesClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AFPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getAFPreferencesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getLockdownModeManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!LockdownModeLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __LockdownModeLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264E960E8;
    uint64_t v5 = 0;
    LockdownModeLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!LockdownModeLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getLockdownModeManagerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("LockdownModeManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getLockdownModeManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LockdownModeLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LockdownModeLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __NanoRegistryLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264E96100;
    uint64_t v5 = 0;
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!NanoRegistryLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getNRPairedDeviceRegistryClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("NRPairedDeviceRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getNRPairedDeviceRegistryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoRegistryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoRegistryLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSFUnlockManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SharingLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SharingLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264E96118;
    uint64_t v5 = 0;
    SharingLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SharingLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getSFUnlockManagerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("SFUnlockManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getSFUnlockManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SharingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SharingLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getIDSDefaultPairedDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!IDSLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __IDSLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_264E96130;
    uint64_t v7 = 0;
    IDSLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    long long v2 = (void *)IDSLibraryCore_frameworkLibrary;
    if (IDSLibraryCore_frameworkLibrary)
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
  long long v2 = (void *)IDSLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "IDSDefaultPairedDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIDSDefaultPairedDeviceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __IDSLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IDSLibraryCore_frameworkLibrary = result;
  return result;
}

id PSUI_LocalizedStringForPearlPeriocular(void *a1)
{
  id v1 = a1;
  long long v2 = PSPreferencesFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Pearl-Periocular"];

  return v3;
}

id PSUI_LocalizedStringForPasscodePeriocular(void *a1)
{
  id v1 = a1;
  long long v2 = PSUI_BundleForPreferencesUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Passcode-Periocular"];

  return v3;
}

id PSUI_BundleForPreferencesUIFramework()
{
  if (PSUI_BundleForPreferencesUIFramework_onceToken != -1) {
    dispatch_once(&PSUI_BundleForPreferencesUIFramework_onceToken, &__block_literal_global_6);
  }
  uint64_t v0 = (void *)PSUI_BundleForPreferencesUIFramework__preferencesUIFrameworkBundle;
  return v0;
}

id PSUI_LocalizedStringForPasscodeLock(void *a1)
{
  id v1 = a1;
  long long v2 = PSUI_BundleForPreferencesUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Passcode Lock"];

  return v3;
}

id PSUI_LocalizedStringForTouchID(void *a1)
{
  id v1 = a1;
  long long v2 = PSUI_BundleForPreferencesUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"TouchID_Strings"];

  return v3;
}

id PSUI_LocalizedStringForPasscodeDimpleKey(void *a1)
{
  id v1 = a1;
  long long v2 = PSUI_BundleForPreferencesUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"PasscodeLock-DimpleKey"];

  return v3;
}

id PSUI_RebrandedKeyForAppleID(void *a1)
{
  id v1 = a1;
  if (([v1 containsString:@"REBRAND"] & 1) != 0 || (_os_feature_enabled_impl() & 1) == 0)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = [v1 stringByAppendingString:@"_REBRAND"];
  }
  uint64_t v3 = v2;

  return v3;
}

id sub_23D363C4C(void *a1, uint64_t a2, double a3)
{
  uint64_t v6 = sub_23D368410();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23D368430();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(a1, sel_specifier);
  if (result)
  {
    uint64_t v43 = a2;
    id v44 = result;
    id result = objc_msgSend(a1, sel_specifier);
    if (!result)
    {
      __break(1u);
      return result;
    }
    v15 = result;
    id v16 = objc_msgSend(result, sel_target);

    uint64_t v41 = v10;
    uint64_t v42 = v7;
    uint64_t v40 = v11;
    if (v16)
    {
      self;
      v17 = (void *)swift_dynamicCastObjCClass();
      if (v17)
      {
        id v39 = v17;
        id v18 = objc_msgSend(v17, sel_navigationItem);
LABEL_8:
        id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
        v20 = self;
        v21 = (void *)sub_23D368460();
        id v22 = objc_msgSend(v20, sel_preferredFontForTextStyle_, v21);

        objc_msgSend(v19, sel_setFont_, v22);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268C08520);
        uint64_t inited = swift_initStackObject();
        v24 = (void **)MEMORY[0x263F81500];
        *(_OWORD *)(inited + 16) = xmmword_23D36A9A0;
        v25 = *v24;
        *(void *)(inited + 32) = *v24;
        v26 = self;
        id v27 = v19;
        swift_bridgeObjectRetain();
        id v28 = v25;
        id v29 = objc_msgSend(v26, sel_labelColor);
        id v30 = objc_msgSend(v29, sel_colorWithAlphaComponent_, a3);

        *(void *)(inited + 64) = sub_23D365A10(0, &qword_268C08528);
        *(void *)(inited + 40) = v30;
        sub_23D364264(inited, &qword_268C08558, &qword_268C08560, (uint64_t (*)(uint64_t))sub_23D364E68);
        id v31 = objc_allocWithZone(MEMORY[0x263F086A0]);
        v32 = (void *)sub_23D368460();
        swift_bridgeObjectRelease();
        type metadata accessor for Key(0);
        sub_23D3659C8(&qword_268C08530, type metadata accessor for Key);
        v33 = (void *)sub_23D368450();
        swift_bridgeObjectRelease();
        id v34 = objc_msgSend(v31, sel_initWithString_attributes_, v32, v33);

        objc_msgSend(v27, sel_setAttributedText_, v34);
        sub_23D365A10(0, &qword_268C08538);
        v35 = (void *)sub_23D3684D0();
        uint64_t v36 = swift_allocObject();
        *(void *)(v36 + 16) = v18;
        *(void *)(v36 + 24) = v27;
        aBlock[4] = sub_23D365A8C;
        aBlock[5] = v36;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_23D364394;
        aBlock[3] = &block_descriptor;
        v37 = _Block_copy(aBlock);
        id v38 = v18;
        swift_release();
        sub_23D368420();
        aBlock[0] = MEMORY[0x263F8EE78];
        sub_23D3659C8(&qword_268C08540, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268C08548);
        sub_23D365AC0(&qword_268C08550, &qword_268C08548);
        sub_23D3684F0();
        MEMORY[0x23ECFDDC0](0, v13, v9, v37);

        _Block_release(v37);
        (*(void (**)(char *, uint64_t))(v42 + 8))(v9, v6);
        return (id)(*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v13, v41);
      }
      swift_unknownObjectRelease();
    }
    id v18 = 0;
    id v39 = 0;
    goto LABEL_8;
  }
  return result;
}

unint64_t sub_23D364264(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = sub_23D368500();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23D365B04(v11, (uint64_t)&v18, a3);
    uint64_t v12 = v18;
    unint64_t result = a4(v18);
    if (v14) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v8[6] + 8 * result) = v12;
    unint64_t result = (unint64_t)sub_23D36595C(&v19, (_OWORD *)(v8[7] + 32 * result));
    uint64_t v15 = v8[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_23D364394(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_23D3643D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23D3684B0();
  sub_23D3684B0();
  sub_23D3684B0();
  sub_23D3684B0();
  sub_23D3684B0();
  swift_retain();
  return MEMORY[0x270F5D0D8](a1, a2, a3, a4, a9, a10, a11, a12, sub_23D364508, 0);
}

void sub_23D364508()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_sharedApplication);
  uint64_t v2 = (void *)sub_23D3683D0();
  unsigned int v3 = objc_msgSend(v1, sel_canOpenURL_, v2);

  if (v3)
  {
    id v4 = objc_msgSend(v0, sel_sharedApplication);
    uint64_t v5 = (void *)sub_23D3683D0();
    sub_23D364264(MEMORY[0x263F8EE78], &qword_268C08510, &qword_268C08518, (uint64_t (*)(uint64_t))sub_23D364E68);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_23D3659C8(&qword_268C08508, type metadata accessor for OpenExternalURLOptionsKey);
    id v6 = (id)sub_23D368450();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_openURL_options_completionHandler_, v5, v6, 0);
  }
}

id sub_23D364700(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    uint64_t v10 = (void *)sub_23D368460();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  id v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  id v12 = v11;
  if (v12) {

  }
  return v12;
}

id sub_23D364900()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PasscodePlacardCell()
{
  return self;
}

uint64_t sub_23D36495C(uint64_t a1, uint64_t a2)
{
  return sub_23D364ADC(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_23D364980(uint64_t a1, uint64_t a2)
{
  return sub_23D364ADC(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_23D3649A0(uint64_t a1, id *a2)
{
  uint64_t result = sub_23D368470();
  *a2 = 0;
  return result;
}

uint64_t sub_23D364A18(uint64_t a1, id *a2)
{
  char v3 = sub_23D368480();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23D364A98@<X0>(uint64_t *a1@<X8>)
{
  sub_23D368490();
  uint64_t v2 = sub_23D368460();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23D364ADC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_23D368490();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23D364B20()
{
  sub_23D368490();
  sub_23D3684A0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23D364B74()
{
  sub_23D368490();
  sub_23D368530();
  sub_23D3684A0();
  uint64_t v0 = sub_23D368540();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23D364BEC()
{
  uint64_t v0 = sub_23D368490();
  uint64_t v2 = v1;
  if (v0 == sub_23D368490() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_23D368520();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23D364C7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23D368490();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23D364CA8(uint64_t a1)
{
  uint64_t v2 = sub_23D3659C8(&qword_268C08530, type metadata accessor for Key);
  uint64_t v3 = sub_23D3659C8(&qword_268C085A8, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_23D364D64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_23D368460();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23D364DAC(uint64_t a1)
{
  uint64_t v2 = sub_23D3659C8(&qword_268C08508, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_23D3659C8((unint64_t *)&unk_268C085B0, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

unint64_t sub_23D364E68(uint64_t a1)
{
  sub_23D368490();
  sub_23D368530();
  sub_23D3684A0();
  uint64_t v2 = sub_23D368540();
  swift_bridgeObjectRelease();
  return sub_23D364EFC(a1, v2);
}

unint64_t sub_23D364EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_23D368490();
    uint64_t v8 = v7;
    if (v6 == sub_23D368490() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_23D368520();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_23D368490();
          uint64_t v15 = v14;
          if (v13 == sub_23D368490() && v15 == v16) {
            break;
          }
          char v18 = sub_23D368520();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_23D365074()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C084E8);
  uint64_t v48 = *(void *)(v2 - 8);
  uint64_t v49 = v2;
  MEMORY[0x270FA5388]();
  v47 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v0, sel_setSelectionStyle_, 0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  unint64_t v5 = self;
  id v6 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata);
  unint64_t v7 = 0xD000000000000021;
  uint64_t v41 = (id (*)(double))0x800000023D36E280;
  id v45 = (id)sub_23D3683C0();
  uint64_t v46 = v8;

  if (PSIsPearlAvailable())
  {
    id v9 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata);
    unint64_t v10 = 0xD00000000000001ELL;
    uint64_t v11 = sub_23D3683C0();
    uint64_t v13 = v12;

    id v14 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v41 = (id (*)(double))0x800000023D36E280;
    uint64_t v43 = sub_23D3683C0();
    uint64_t v44 = v15;

    id v16 = objc_msgSend(self, sel_currentDevice);
    id v17 = objc_msgSend(v16, sel_userInterfaceIdiom);

    if (v17) {
      unint64_t v18 = 0x800000023D36E4B0;
    }
    else {
      unint64_t v18 = 0x800000023D36E4E0;
    }
    long long v19 = "com.apple.graphic-icon.face-id";
  }
  else
  {
    int v20 = PSSupportsMesa();
    id v21 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata);
    if (v20)
    {
      unint64_t v10 = 0xD00000000000001FLL;
      uint64_t v11 = sub_23D3683C0();
      uint64_t v13 = v22;

      id v23 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata);
      uint64_t v41 = (id (*)(double))0x800000023D36E280;
      uint64_t v43 = sub_23D3683C0();
      uint64_t v44 = v24;

      id v25 = objc_msgSend(self, sel_currentDevice);
      id v26 = objc_msgSend(v25, sel_userInterfaceIdiom);

      if (v26) {
        unint64_t v18 = 0x800000023D36E3E0;
      }
      else {
        unint64_t v18 = 0x800000023D36E410;
      }
      unint64_t v7 = 0xD000000000000021;
      long long v19 = "com.apple.graphic-icon.touch-id";
    }
    else
    {
      uint64_t v11 = sub_23D3683C0();
      uint64_t v13 = v27;

      id v28 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata);
      uint64_t v41 = (id (*)(double))0x800000023D36E280;
      uint64_t v43 = sub_23D3683C0();
      uint64_t v44 = v29;

      id v30 = objc_msgSend(self, sel_currentDevice);
      id v31 = objc_msgSend(v30, sel_userInterfaceIdiom);

      if (v31) {
        unint64_t v7 = 0xD000000000000021;
      }
      else {
        unint64_t v7 = 0xD000000000000020;
      }
      if (v31) {
        unint64_t v18 = 0x800000023D36E310;
      }
      else {
        unint64_t v18 = 0x800000023D36E340;
      }
      unint64_t v10 = 0xD00000000000001FLL;
      long long v19 = "com.apple.graphic-icon.passcode";
    }
  }
  unint64_t v32 = (unint64_t)(v19 - 32) | 0x8000000000000000;
  v33 = (void *)swift_allocObject();
  v33[2] = v1;
  v33[3] = v11;
  v33[4] = v13;
  uint64_t v34 = MEMORY[0x270FA5388]();
  *(&v43 - 12) = v11;
  *(&v43 - 11) = v13;
  v35 = v1;
  uint64_t v36 = v44;
  *(&v43 - 10) = v43;
  *(&v43 - 9) = v36;
  uint64_t v37 = v46;
  *(&v43 - 8) = (uint64_t)v45;
  *(&v43 - 7) = v37;
  *(&v43 - 6) = v7;
  *(&v43 - 5) = v18;
  *(&v43 - 4) = v10;
  *(&v43 - 3) = v32;
  uint64_t v41 = sub_23D365850;
  uint64_t v42 = v34;
  id v45 = v35;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C084F0);
  sub_23D365AC0(&qword_268C084F8, &qword_268C084F0);
  id v38 = v47;
  sub_23D3683F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23D368400();
  uint64_t v39 = v49;
  v50[3] = v49;
  v50[4] = sub_23D365AC0(&qword_268C08500, &qword_268C084E8);
  __swift_allocate_boxed_opaque_existential_1(v50);
  sub_23D3683E0();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v38, v39);
  MEMORY[0x23ECFDDA0](v50);
  return swift_release();
}

uint64_t sub_23D365810()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

id sub_23D365850(double a1)
{
  return sub_23D363C4C(*(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_23D36585C()
{
  return sub_23D3643D8(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8], v0[9], v0[10], v0[11], v0[12], v0[13]);
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

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

_OWORD *sub_23D36595C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for Key(uint64_t a1)
{
}

void sub_23D365980(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_23D3659C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23D365A10(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23D365A4C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_23D365A8C()
{
  id result = *(id *)(v0 + 16);
  if (result) {
    return objc_msgSend(result, sel_setTitleView_, *(void *)(v0 + 24));
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

uint64_t sub_23D365AC0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23D365B04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23D365B68()
{
  return sub_23D3659C8(&qword_268C08578, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_23D365BB0()
{
  return sub_23D3659C8(&qword_268C08580, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_23D365BF8()
{
  return sub_23D3659C8(&qword_268C08588, type metadata accessor for Key);
}

uint64_t sub_23D365C40()
{
  return sub_23D3659C8(&qword_268C08590, type metadata accessor for Key);
}

uint64_t sub_23D365C88()
{
  return sub_23D3659C8(&qword_268C08598, type metadata accessor for Key);
}

uint64_t sub_23D365CD0()
{
  return sub_23D3659C8(&qword_268C085A0, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_23D365D20()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t get_aks_client_connection()
{
  if (get_aks_client_dispatch_queue_onceToken != -1) {
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_173);
  }
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_152);
  uint64_t result = get_aks_client_connection_connection;
  if (!get_aks_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return get_aks_client_connection_connection;
  }
  return result;
}

void __get_aks_client_connection_block_invoke()
{
  if (!get_aks_client_connection_connection) {
    get_aks_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
}

dispatch_queue_t __get_aks_client_dispatch_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("aks-client-queue", 0);
  get_aks_client_dispatch_queue_connection_queue = (uint64_t)result;
  return result;
}

uint64_t _copy_aks_client_connection(char *path, const char *a2)
{
  kern_return_t v7;
  CFDictionaryRef v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;

  connect = 0;
  mach_port_t v3 = *MEMORY[0x263F0EC90];
  io_service_t v4 = IORegistryEntryFromPath(*MEMORY[0x263F0EC90], path);
  uint64_t v5 = (task_port_t *)MEMORY[0x263EF8960];
  if (!v4 || (io_object_t v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x263EF8960], 0, &connect), IOObjectRelease(v6), v7))
  {
    uint64_t v8 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      unint64_t v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }
  dispatch_queue_t result = connect;
  if (connect)
  {
    uint64_t v12 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    dispatch_queue_t result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t _aks_verify_password(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  input[4] = *MEMORY[0x263EF8340];
  uint64_t v9 = 3758097084;
  id v21 = 0;
  int v20 = 0;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v16 = aks_client_connection;
    if (a2) {
      id v17 = a2;
    }
    else {
      id v17 = "";
    }
    aks_pack_data((char **)&v21, (unsigned int *)&v20, 2, v11, v12, v13, v14, v15, (uint64_t)v17);
    if (v21)
    {
      input[0] = a1;
      input[1] = a6;
      input[2] = (uint64_t)v21;
      input[3] = v20;
      uint64_t v9 = IOConnectCallMethod(v16, 0x2Au, input, 4u, 0, 0, 0, 0, 0, 0);
      unint64_t v18 = v21;
    }
    else
    {
      unint64_t v18 = 0;
      uint64_t v9 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_verify_password", ":", 1807, "", 0, "", "");
    unint64_t v18 = 0;
  }
  free(v18);
  return v9;
}

uint64_t aks_verify_password(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _aks_verify_password(a1, a2, a3, a4, a5, 0);
}

char *aks_copy_packed_data(_DWORD *a1, const void *a2, int a3)
{
  mach_port_t v3 = (char *)(a1 + 1);
  if (a2)
  {
    *a1 = a3;
    memcpy(a1 + 1, a2, a3);
    v3 += a3;
    int v5 = -a3;
    size_t v6 = -a3 & 3;
    if ((v5 & 3) != 0)
    {
      int __s = 0;
      memset_s(&__s, 4uLL, 0, 4uLL);
      memcpy(v3, &__s, v6);
      v3 += v6;
    }
  }
  else
  {
    *a1 = 0;
  }
  return v3;
}

char *aks_pack_data(char **a1, unsigned int *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v21 = &a9;
  unsigned int v12 = 4;
  if (a3)
  {
    int v13 = a3;
    do
    {
      uint64_t v14 = v21;
      v21 += 2;
      v12 += *((_DWORD *)v14 + 2) + (-*((_DWORD *)v14 + 2) & 3) + 4;
      --v13;
    }
    while (v13);
  }
  dispatch_queue_t result = (char *)calloc(1uLL, v12);
  mach_port_t v16 = result;
  uint64_t v22 = (const void **)&a9;
  int v17 = 0;
  if (a3)
  {
    uint64_t v18 = 4;
    do
    {
      long long v19 = v22;
      int v20 = *v22;
      v22 += 2;
      dispatch_queue_t result = aks_copy_packed_data(&v16[v18], v20, *((_DWORD *)v19 + 2));
      uint64_t v18 = result - v16;
      ++v17;
    }
    while (a3 != v17);
  }
  *(_DWORD *)mach_port_t v16 = v17;
  *a1 = v16;
  *a2 = v12;
  return result;
}

uint64_t __getEREyeReliefClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __credentialSetWithPasscodeCredential_block_invoke_cold_1(v0);
}

void __credentialSetWithPasscodeCredential_block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_23D33A000, a2, OS_LOG_TYPE_ERROR, "Could not ask verify password: %d", (uint8_t *)v2, 8u);
}

uint64_t __getLAContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[PSUITouchIDPasscodeController authContext](v0);
}

uint64_t __getBYFlowSkipControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __46__PSUIBiometricController_deleteGlobalAuthACL__block_invoke_2_cold_1(v0);
}

uint64_t __getBFFStyleClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPKWalletVisibilityClass_block_invoke_cold_1(v0);
}

uint64_t __getPKWalletVisibilityClass_block_invoke_cold_1()
{
  return __getPKPaymentRegistrationUtilitiesClass_block_invoke_cold_1();
}

uint64_t __getPKPaymentRegistrationUtilitiesClass_block_invoke_cold_1()
{
  return __getPKPaymentWebServiceClass_block_invoke_cold_1();
}

uint64_t __getPKPaymentWebServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[PSUIBiometrics init](v0);
}

void dtoStatusChangedNotification_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "DTO: Received notification: Changed arm/overall state but have no observer", v2, v3, v4, v5, v6);
}

void __getHMHomeManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1(v0);
}

void __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1(v0);
}

void __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAFPreferencesClass_block_invoke_cold_1(v0);
}

void __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getLockdownModeManagerClass_block_invoke_cold_1(v0);
}

void __getLockdownModeManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getNRPairedDeviceRegistryClass_block_invoke_cold_1(v0);
}

void __getNRPairedDeviceRegistryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getSFUnlockManagerClass_block_invoke_cold_1(v0);
}

void __getSFUnlockManagerClass_block_invoke_cold_1()
{
}

void PSUILogForCategory_cold_1()
{
}

uint64_t sub_23D3683C0()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_23D3683D0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_23D3683E0()
{
  return MEMORY[0x270F01E18]();
}

uint64_t sub_23D3683F0()
{
  return MEMORY[0x270F01E28]();
}

uint64_t sub_23D368400()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_23D368410()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_23D368420()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_23D368430()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_23D368450()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23D368460()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23D368470()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_23D368480()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_23D368490()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23D3684A0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23D3684B0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23D3684C0()
{
  return MEMORY[0x270F824A0]();
}

uint64_t sub_23D3684D0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_23D3684E0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_23D3684F0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23D368500()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23D368520()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23D368530()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23D368540()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t ACMContextCreate()
{
  return MEMORY[0x270F55180]();
}

uint64_t ACMContextDelete()
{
  return MEMORY[0x270F55188]();
}

uint64_t ACMContextGetExternalForm()
{
  return MEMORY[0x270F55190]();
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
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

uint64_t PKIsUSBRestrictedModeDisabledByMobileAsset()
{
  return MEMORY[0x270F551B0]();
}

uint64_t PKNearFieldRadioIsAvailable()
{
  return MEMORY[0x270F51DF8]();
}

uint64_t PSAuthorizationTokenForPasscode()
{
  return MEMORY[0x270F551D8]();
}

uint64_t PSHasStockholmPass()
{
  return MEMORY[0x270F55210]();
}

uint64_t PSIsBundleIDHiddenDueToRestrictions()
{
  return MEMORY[0x270F55218]();
}

uint64_t PSIsPearlAvailable()
{
  return MEMORY[0x270F55248]();
}

uint64_t PSIsPearlInterlocked()
{
  return MEMORY[0x270F55250]();
}

uint64_t PSJoinedCDPCircleAccount()
{
  return MEMORY[0x270F55270]();
}

uint64_t PSKeychainSyncGetStatus()
{
  return MEMORY[0x270F55278]();
}

uint64_t PSLocalizableMesaStringForKey()
{
  return MEMORY[0x270F55290]();
}

uint64_t PSLocalizablePearlStringForKey()
{
  return MEMORY[0x270F55298]();
}

uint64_t PSLocalizableStockholmStringForKey()
{
  return MEMORY[0x270F552A0]();
}

uint64_t PSPointImageOfColor()
{
  return MEMORY[0x270F552B8]();
}

uint64_t PSPreferencesFrameworkBundle()
{
  return MEMORY[0x270F552C0]();
}

uint64_t PSPreferencesUIFrameworkBundle()
{
  return MEMORY[0x270F552C8]();
}

uint64_t PSSupportsMesa()
{
  return MEMORY[0x270F55310]();
}

uint64_t PSUsedByHSA2Account()
{
  return MEMORY[0x270F55340]();
}

uint64_t PSUsedByManagedAccount()
{
  return MEMORY[0x270F55348]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x270F5D188]();
}

uint64_t SOSCCRemoveThisDeviceFromCircle()
{
  return MEMORY[0x270EFD468]();
}

uint64_t SecPasswordIsPasswordWeak2()
{
  return MEMORY[0x270EFDAF8]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x270F795C0]();
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  return MEMORY[0x270F905E0]();
}

uint64_t _AXSGetUSBRMDisablers()
{
  return MEMORY[0x270F90778]();
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

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

int fls(int a1)
{
  return MEMORY[0x270ED99A8](*(void *)&a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x270EF87E8]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x270EF8810]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x270EF8A08]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
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

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

void syslog(int a1, const char *a2, ...)
{
}