id soft_BPSCellHightlightColor()
{
  void (*v0)(void);
  void *v1;
  void *v2;
  _Unwind_Exception *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  uint64_t vars8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (void (*)(void))getBPSCellHightlightColorSymbolLoc_ptr;
  v8 = getBPSCellHightlightColorSymbolLoc_ptr;
  if (!getBPSCellHightlightColorSymbolLoc_ptr)
  {
    v1 = (void *)BridgePreferencesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "BPSCellHightlightColor");
    getBPSCellHightlightColorSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    v0 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)soft_BPSCellHightlightColor_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = v0();

  return v2;
}

id soft_BPSTextColor()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void (*)(void))getBPSTextColorSymbolLoc_ptr;
  v8 = getBPSTextColorSymbolLoc_ptr;
  if (!getBPSTextColorSymbolLoc_ptr)
  {
    v1 = (void *)BridgePreferencesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "BPSTextColor");
    getBPSTextColorSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    v0 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)soft_BPSCellHightlightColor_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = v0();

  return v2;
}

id soft_BPSDetailTextColor()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void (*)(void))getBPSDetailTextColorSymbolLoc_ptr;
  v8 = getBPSDetailTextColorSymbolLoc_ptr;
  if (!getBPSDetailTextColorSymbolLoc_ptr)
  {
    v1 = (void *)BridgePreferencesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "BPSDetailTextColor");
    getBPSDetailTextColorSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    v0 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)soft_BPSCellHightlightColor_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = v0();

  return v2;
}

void *__getBPSCellHightlightColorSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BridgePreferencesLibrary();
  result = dlsym(v2, "BPSCellHightlightColor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBPSCellHightlightColorSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t BridgePreferencesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!BridgePreferencesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __BridgePreferencesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264B98EF0;
    uint64_t v5 = 0;
    BridgePreferencesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = BridgePreferencesLibraryCore_frameworkLibrary;
  v1 = (void *)v3[0];
  if (!BridgePreferencesLibraryCore_frameworkLibrary)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __BridgePreferencesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BridgePreferencesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getBPSTextColorSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BridgePreferencesLibrary();
  uint64_t result = dlsym(v2, "BPSTextColor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBPSTextColorSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBPSDetailTextColorSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BridgePreferencesLibrary();
  uint64_t result = dlsym(v2, "BPSDetailTextColor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBPSDetailTextColorSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBPSBridgeTintColorSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BridgePreferencesLibrary();
  uint64_t result = dlsym(v2, "BPSBridgeTintColor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBPSBridgeTintColorSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getNNMKEmailAddressTokenKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getNNMKEmailAddressTokenKeySymbolLoc_ptr;
  uint64_t v8 = getNNMKEmailAddressTokenKeySymbolLoc_ptr;
  if (!getNNMKEmailAddressTokenKeySymbolLoc_ptr)
  {
    v1 = (void *)NanoMailKitServerLibrary();
    v6[3] = (uint64_t)dlsym(v1, "NNMKEmailAddressTokenKey");
    getNNMKEmailAddressTokenKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    long long v4 = (_Unwind_Exception *)soft_BPSCellHightlightColor_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getNanoMailCloudNotificationsEnabledKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getNanoMailCloudNotificationsEnabledKeySymbolLoc_ptr;
  uint64_t v8 = getNanoMailCloudNotificationsEnabledKeySymbolLoc_ptr;
  if (!getNanoMailCloudNotificationsEnabledKeySymbolLoc_ptr)
  {
    v1 = (void *)NanoMailKitServerLibrary();
    v6[3] = (uint64_t)dlsym(v1, "NanoMailCloudNotificationsEnabledKey");
    getNanoMailCloudNotificationsEnabledKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    long long v4 = (_Unwind_Exception *)soft_BPSCellHightlightColor_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

void sub_2309ED238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2309ED6C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  _Block_object_dispose((const void *)(v22 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2309EDDE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getNNMKURLRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getNNMKURLRequestClass_softClass;
  uint64_t v7 = getNNMKURLRequestClass_softClass;
  if (!getNNMKURLRequestClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getNNMKURLRequestClass_block_invoke;
    v3[3] = &unk_264B98ED0;
    v3[4] = &v4;
    __getNNMKURLRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_2309EDEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2309EE0C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void *__getNNMKEmailAddressTokenKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)NanoMailKitServerLibrary();
  uint64_t result = dlsym(v2, "NNMKEmailAddressTokenKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNNMKEmailAddressTokenKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoMailKitServerLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!NanoMailKitServerLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __NanoMailKitServerLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264B99048;
    uint64_t v5 = 0;
    NanoMailKitServerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = NanoMailKitServerLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!NanoMailKitServerLibraryCore_frameworkLibrary)
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

uint64_t __NanoMailKitServerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoMailKitServerLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getNanoMailCloudNotificationsEnabledKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)NanoMailKitServerLibrary();
  uint64_t result = dlsym(v2, "NanoMailCloudNotificationsEnabledKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNanoMailCloudNotificationsEnabledKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBPSNanoBulletinSubsectionIdSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BridgePreferencesLibrary_0();
  uint64_t result = dlsym(v2, "BPSNanoBulletinSubsectionId");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBPSNanoBulletinSubsectionIdSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t BridgePreferencesLibrary_0()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!BridgePreferencesLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __BridgePreferencesLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264B99060;
    uint64_t v5 = 0;
    BridgePreferencesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = BridgePreferencesLibraryCore_frameworkLibrary_0;
  id v1 = (void *)v3[0];
  if (!BridgePreferencesLibraryCore_frameworkLibrary_0)
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

uint64_t __BridgePreferencesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  BridgePreferencesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getBPSNanoBulletinShowsAlertsSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BridgePreferencesLibrary_0();
  uint64_t result = dlsym(v2, "BPSNanoBulletinShowsAlerts");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBPSNanoBulletinShowsAlertsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNNMKPCCEmailAddressKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)NanoMailKitServerLibrary();
  uint64_t result = dlsym(v2, "NNMKPCCEmailAddressKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNNMKPCCEmailAddressKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSLGoogleAuthControllerClass_block_invoke(uint64_t a1)
{
  NanoMailKitServerLibrary();
  Class result = objc_getClass("SLGoogleAuthController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSLGoogleAuthControllerClass_block_invoke_cold_1();
  }
  getSLGoogleAuthControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNNMKURLRequestClass_block_invoke(uint64_t a1)
{
  NanoMailKitServerLibrary();
  Class result = objc_getClass("NNMKURLRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getNNMKURLRequestClass_block_invoke_cold_1();
  }
  getNNMKURLRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void nnmk_setupLoggingSubsystems()
{
  if (nnmk_setupLoggingSubsystems_onceToken != -1) {
    dispatch_once(&nnmk_setupLoggingSubsystems_onceToken, &__block_literal_global);
  }
}

uint64_t __nnmk_setupLoggingSubsystems_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.NanoMail", "General");
  id v1 = (void *)__logCategories;
  __logCategories = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.NanoMail", "Notification");
  v3 = (void *)qword_26870A258;
  qword_26870A258 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.NanoMail", "Sync");
  uint64_t v5 = (void *)qword_26870A250;
  qword_26870A250 = (uint64_t)v4;

  qword_26870A260 = (uint64_t)os_log_create("com.apple.NanoMail", "Standalone");

  return MEMORY[0x270F9A758]();
}

void sub_2309EF600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMailAccountEmailAddressesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!MessageLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __MessageLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_264B99098;
    uint64_t v7 = 0;
    MessageLibraryCore_frameworkLibrary = _sl_dlopen();
    v3 = (void *)v5[0];
    os_log_t v2 = (void *)MessageLibraryCore_frameworkLibrary;
    if (MessageLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  os_log_t v2 = (void *)MessageLibraryCore_frameworkLibrary;
LABEL_5:
  Class result = dlsym(v2, "MailAccountEmailAddresses");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMailAccountEmailAddressesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MessageLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MessageLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getNNMKAccountClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!NanoMailKitServerLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __NanoMailKitServerLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264B990B0;
    uint64_t v5 = 0;
    NanoMailKitServerLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!NanoMailKitServerLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
LABEL_8:
      __getNNMKAccountClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("NNMKAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getNNMKAccountClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoMailKitServerLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  NanoMailKitServerLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_2309F069C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2309F0B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2309F1AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2309F1D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t soft_BPSCellHightlightColor_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __104__NMCUICloudNotificationAccountDataSource_handleAccountAuthenication_viewController_stateUpdateHandler___block_invoke_3_cold_1(v0);
}

void __getSLGoogleAuthControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getNNMKURLRequestClass_block_invoke_cold_1(v0);
}

void __getNNMKURLRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getNNMKAccountClass_block_invoke_cold_1(v0);
}

void __getNNMKAccountClass_block_invoke_cold_1()
{
  uint64_t v0 = (objc_class *)abort_report_np();
  NSStringFromClass(v0);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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