BOOL SiriUIDeviceIsPad()
{
  void *v0;
  BOOL v1;

  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  v1 = [v0 userInterfaceIdiom] == 1;

  return v1;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_2231FE5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKTextBalloonViewClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!ChatKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __ChatKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_26469F190;
    uint64_t v5 = 0;
    ChatKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ChatKitLibraryCore_frameworkLibrary) {
    __getCKTextBalloonViewClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CKTextBalloonView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKTextBalloonViewClass_block_invoke_cold_2();
  }
  getCKTextBalloonViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ChatKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ChatKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_223201B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSearchUICardViewControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSearchUICardViewControllerClass_softClass;
  uint64_t v7 = getSearchUICardViewControllerClass_softClass;
  if (!getSearchUICardViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSearchUICardViewControllerClass_block_invoke;
    v3[3] = &unk_26469F170;
    v3[4] = &v4;
    __getSearchUICardViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_223201DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_223202EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id a37)
{
  objc_destroyWeak(v38);
  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a37);
  _Unwind_Resume(a1);
}

void sub_22320348C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_223204714(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

Class __getAPUICardServiceClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AppPredictionUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __AppPredictionUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26469F330;
    uint64_t v5 = 0;
    AppPredictionUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppPredictionUILibraryCore_frameworkLibrary) {
    __getAPUICardServiceClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("APUICardService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAPUICardServiceClass_block_invoke_cold_2();
  }
  getAPUICardServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppPredictionUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppPredictionUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSearchUICardViewControllerClass_block_invoke(uint64_t a1)
{
  SearchUILibrary();
  Class result = objc_getClass("SearchUICardViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSearchUICardViewControllerClass_block_invoke_cold_1();
  }
  getSearchUICardViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void SearchUILibrary()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0[0] = 0;
  if (!SearchUILibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x263EF8330];
    v0[2] = (void *)3221225472;
    v0[3] = __SearchUILibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_26469F348;
    uint64_t v2 = 0;
    SearchUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SearchUILibraryCore_frameworkLibrary) {
    SearchUILibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __SearchUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SearchUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSearchUIBackgroundColorViewClass_block_invoke(uint64_t a1)
{
  SearchUILibrary();
  Class result = objc_getClass("SearchUIBackgroundColorView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSearchUIBackgroundColorViewClass_block_invoke_cold_1();
  }
  getSearchUIBackgroundColorViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22320B028(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_223210188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 152), 8);
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

void sub_223210894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2232116A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_223211B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSASSystemStateClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SiriActivationLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SiriActivationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26469F510;
    uint64_t v5 = 0;
    SiriActivationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SiriActivationLibraryCore_frameworkLibrary) {
    __getSASSystemStateClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SASSystemState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSASSystemStateClass_block_invoke_cold_2();
  }
  getSASSystemStateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SiriActivationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SiriActivationLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getVTPreferencesClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!VoiceTriggerLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __VoiceTriggerLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26469F528;
    uint64_t v5 = 0;
    VoiceTriggerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!VoiceTriggerLibraryCore_frameworkLibrary) {
    __getVTPreferencesClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("VTPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVTPreferencesClass_block_invoke_cold_2();
  }
  getVTPreferencesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VoiceTriggerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VoiceTriggerLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAnalyticsSendEventLazySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __CoreAnalyticsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26469F540;
    uint64_t v6 = 0;
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary) {
    __getAnalyticsSendEventLazySymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "AnalyticsSendEventLazy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAnalyticsSendEventLazySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreAnalyticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreAnalyticsLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_223218B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22321BBD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SiriUIViewModeToSISchemaSiriPresentationType(uint64_t a1)
{
  if ((unint64_t)(a1 - 4) > 4) {
    return 0;
  }
  else {
    return dword_22323E788[a1 - 4];
  }
}

void sub_22321F638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22321F964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
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

void sub_22321FF14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2232203E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_223220A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_223220D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_223224F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id getSearchUIBackgroundColorViewClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSearchUIBackgroundColorViewClass_softClass_0;
  uint64_t v7 = getSearchUIBackgroundColorViewClass_softClass_0;
  if (!getSearchUIBackgroundColorViewClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSearchUIBackgroundColorViewClass_block_invoke_0;
    v3[3] = &unk_26469F170;
    v3[4] = &v4;
    __getSearchUIBackgroundColorViewClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2232267A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSearchUIBackgroundColorViewClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SearchUILibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SearchUILibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26469F910;
    uint64_t v5 = 0;
    SearchUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!SearchUILibraryCore_frameworkLibrary_0) {
    __getSearchUIBackgroundColorViewClass_block_invoke_cold_1_0(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SearchUIBackgroundColorView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSearchUIBackgroundColorViewClass_block_invoke_cold_2();
  }
  getSearchUIBackgroundColorViewClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SearchUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SearchUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

id SiriUIDismissalReasonStringFromReason(uint64_t a1)
{
  if (SiriUIDismissalReasonStringFromReason_onceToken != -1) {
    dispatch_once(&SiriUIDismissalReasonStringFromReason_onceToken, &__block_literal_global_9);
  }
  uint64_t v2 = (void *)SiriUIDismissalReasonStringFromReason_reasonStrings;
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1];
  long long v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

void __SiriUIDismissalReasonStringFromReason_block_invoke()
{
  v3[6] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26D657F68;
  v2[1] = &unk_26D657F80;
  v3[0] = @"User";
  v3[1] = @"System";
  v2[2] = &unk_26D657F98;
  v2[3] = &unk_26D657FB0;
  v3[2] = @"IdleTimer";
  v3[3] = @"IncomingPhoneCall";
  v2[4] = &unk_26D657FC8;
  v2[5] = &unk_26D657FE0;
  v3[4] = @"PunchOut";
  void v3[5] = @"Unknown";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:6];
  id v1 = (void *)SiriUIDismissalReasonStringFromReason_reasonStrings;
  SiriUIDismissalReasonStringFromReason_reasonStrings = v0;
}

BOOL SiriUISystemLanguageIsRTL()
{
  uint64_t v0 = (void *)MEMORY[0x263EFF960];
  id v1 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v2 = [v1 objectForKey:*MEMORY[0x263EFF508]];
  BOOL v3 = [v0 characterDirectionForLanguage:v2] == 2;

  return v3;
}

BOOL SiriLanguageIsRTL()
{
  uint64_t v0 = [MEMORY[0x263F285A0] sharedPreferences];
  if ([v0 assistantLanguageForceRTL])
  {
    BOOL v1 = 1;
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263EFF960];
    BOOL v3 = [MEMORY[0x263F285A0] sharedPreferences];
    long long v4 = [v3 languageCode];
    BOOL v1 = [v2 characterDirectionForLanguage:v4] == 2;
  }
  return v1;
}

void SiriUIBlockExecuteMonitored(void *a1, void *a2)
{
  BOOL v3 = a1;
  id v4 = a2;
  if (v3) {
    v3[2](v3);
  }
}

void sub_223229D44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, long long a11, long long a12, long long a13, long long a14, uint64_t a15, char a16)
{
  if (a2 == 1)
  {
    id v17 = objc_begin_catch(exception_object);
    id v18 = objc_alloc_init(MEMORY[0x263F089D8]);
    v26 = [v17 reason];
    [v18 appendFormat:@"Exception raised while executing monitored block: %@\n"];

    a13 = 0u;
    a14 = 0u;
    a11 = 0u;
    a12 = 0u;
    uint64_t v19 = [v17 callStackSymbols];
    uint64_t v20 = [v19 countByEnumeratingWithState:&a11 objects:&a16 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)a12;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)a12 != v21) {
            objc_enumerationMutation(v19);
          }
          [v18 appendFormat:@"%@\n"];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&a11 objects:&a16 count:16];
      }
      while (v20);
    }

    LoadCrashSupportIfNecessary();
    v23 = (void (*)(uint64_t, uint64_t, id))SiriUISimulateCrash;
    if (SiriUISimulateCrash)
    {
      uint64_t v24 = getpid();
      v23(v24, 2327501518, v18);
    }
    v25 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      SiriUIBlockExecuteMonitored_cold_1((uint64_t)v18, v25);
    }
    if (v16) {
      (*(void (**)(uint64_t))(v16 + 16))(v16);
    }

    objc_end_catch();
    JUMPOUT(0x223229D00);
  }
  _Unwind_Resume(exception_object);
}

void LoadCrashSupportIfNecessary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (!LoadCrashSupportIfNecessary___CrashReportHandle)
  {
    uint64_t v0 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport" fileSystemRepresentation], 1);
    LoadCrashSupportIfNecessary___CrashReportHandle = (uint64_t)v0;
    if (v0)
    {
      SiriUISimulateCrash = dlsym(v0, "SimulateCrash");
    }
    else
    {
      BOOL v1 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v2 = 136315138;
        BOOL v3 = "LoadCrashSupportIfNecessary";
        _os_log_impl(&dword_2231EF000, v1, OS_LOG_TYPE_DEFAULT, "%s Unable to load CrashReporterSupport framework.", (uint8_t *)&v2, 0xCu);
      }
    }
  }
}

void SiriUIInvokeOnMainQueue(void *a1)
{
  BOOL v1 = a1;
  if (v1)
  {
    block = v1;
    if ([MEMORY[0x263F08B88] isMainThread]) {
      block[2]();
    }
    else {
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    BOOL v1 = block;
  }
}

double SiriUIUtteranceWidthForAvailableWidthAndInsets(double a1, double a2, double a3, double a4, double a5)
{
  return fmax(ceil(a1 - a3 - a5), 0.0);
}

CGFloat SiriUIRectForLabelWithDistanceFromTopToBaseline(void *a1, CGFloat a2, double a3, double a4, double a5)
{
  id v8 = a1;
  [v8 frame];
  CGFloat v10 = v9;
  objc_msgSend(v8, "sizeThatFits:", a4, a5);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  v17.origin.x = a2;
  v17.origin.y = v10;
  v17.size.width = v12;
  v17.size.height = v14;
  CGRectGetHeight(v17);
  uint64_t v15 = [v8 font];

  [v15 descender];
  return a2;
}

CGFloat SiriUIRectForLabelWithDistanceFromBottomToBaseline(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9 = a1;
  [v9 frame];
  CGFloat v11 = v10;
  objc_msgSend(v9, "sizeThatFits:", a4, a5);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  CGRectGetHeight(v19);
  v20.origin.x = a2;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  CGRectGetHeight(v20);
  uint64_t v16 = [v9 font];

  [v16 descender];
  CGRect v17 = [MEMORY[0x263F1C920] mainScreen];
  [v17 scale];

  return a2;
}

void SiriUIAspectFitSizeInSizeWithScale(double a1, double a2, double a3, double a4, double a5)
{
  if (a1 > 0.0 && a2 > 0.0 && a5 <= 2.22044605e-16)
  {
    uint64_t v5 = [MEMORY[0x263F1C920] mainScreen];
    [v5 scale];
  }
}

BOOL SiriUIDeviceIsPhone()
{
  uint64_t v0 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 0;

  return v1;
}

BOOL SiriUIDeviceIsPod()
{
  uint64_t v0 = (const void *)MGCopyAnswer();
  BOOL v1 = CFEqual(v0, @"iPod") != 0;
  CFRelease(v0);
  return v1;
}

uint64_t SiriUIIsLargePhoneLayout()
{
  uint64_t v0 = +[SiriUIDeviceInfo sharedInstance];
  int v1 = [v0 isLargeFormatPhone];

  if (v1) {
    return SiriUIDeviceIsZoomed() ^ 1;
  }
  else {
    return 0;
  }
}

uint64_t SiriUIDeviceIsZoomed()
{
  uint64_t v0 = +[SiriUIDeviceInfo sharedInstance];
  uint64_t v1 = [v0 isDeviceZoomed];

  return v1;
}

BOOL SiriUIDeviceIsSmallPhone()
{
  uint64_t v0 = [MEMORY[0x263F1C920] mainScreen];
  [v0 _referenceBounds];
  CGFloat v2 = v1;
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;

  v10.origin.x = v2;
  v10.origin.y = v4;
  v10.size.width = v6;
  v10.size.height = v8;
  return CGRectGetWidth(v10) <= 320.0;
}

BOOL SiriUIDeviceIsLargeFormatPad()
{
  uint64_t v0 = [MEMORY[0x263F1C920] mainScreen];
  [v0 _referenceBounds];
  CGFloat v2 = v1;
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;

  v10.origin.x = v2;
  v10.origin.y = v4;
  v10.size.width = v6;
  v10.size.height = v8;
  if (CGRectGetWidth(v10) < 1024.0) {
    return 0;
  }
  v11.origin.x = v2;
  v11.origin.y = v4;
  v11.size.width = v6;
  v11.size.height = v8;
  return CGRectGetHeight(v11) >= 1366.0;
}

BOOL SiriUIIsExtendedWidth()
{
  BOOL result = SiriUIDeviceIsLargeFormatPad();
  if (result) {
    return !SiriUIIsCompactWidth();
  }
  return result;
}

BOOL SiriUIIsCompactWidth()
{
  uint64_t v0 = [MEMORY[0x263F1C408] sharedApplication];
  objc_msgSend(v0, "siriui_applicationFrame");
  CGFloat v2 = v1;
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;

  if (SiriUIIsLargePhoneLayout())
  {
    v16.origin.x = v2;
    v16.origin.y = v4;
    v16.size.width = v6;
    v16.size.height = v8;
    double Width = CGRectGetWidth(v16);
    v17.origin.x = v2;
    v17.origin.y = v4;
    v17.size.width = v6;
    v17.size.height = v8;
    return Width < CGRectGetHeight(v17);
  }
  else
  {
    if (SiriUIDeviceIsPad())
    {
      v18.origin.x = v2;
      v18.origin.y = v4;
      v18.size.width = v6;
      v18.size.height = v8;
      BOOL v11 = CGRectGetWidth(v18) <= 374.0;
    }
    else
    {
      BOOL v11 = 0;
    }
    double v12 = [MEMORY[0x263F1C408] sharedApplication];
    CGFloat v13 = [v12 keyWindow];
    double v14 = [v13 traitCollection];

    uint64_t v10 = [v14 horizontalSizeClass] == 1 || v11;
  }
  return v10;
}

uint64_t SiriUIIsAllOrientationsSupported()
{
  uint64_t v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 1) {
    return 1;
  }
  return SiriUIIsLargePhoneLayout();
}

BOOL SiriUIIsCompactHeight()
{
  uint64_t v0 = [MEMORY[0x263F1C920] mainScreen];
  uint64_t v1 = [v0 traitCollection];

  BOOL v2 = [v1 verticalSizeClass] == 1;
  return v2;
}

BOOL SiriUIAllowsLandscape()
{
  return (SiriUIIsLargePhoneLayout() & 1) != 0 || !SiriUIIsCompactWidth();
}

uint64_t SiriUIDeviceShouldFreezeAura()
{
  uint64_t v0 = +[SiriUIDeviceInfo sharedInstance];
  uint64_t v1 = [v0 deviceShouldFreezeAura];

  return v1;
}

uint64_t SiriUIDeviceShouldUseFrozenBackdropSnapshot()
{
  uint64_t v0 = +[SiriUIDeviceInfo sharedInstance];
  uint64_t v1 = [v0 deviceShouldUseFrozenBackdropSnapshot];

  return v1;
}

uint64_t SiriUIDeviceShouldDeferFlamesView()
{
  uint64_t v0 = +[SiriUIDeviceInfo sharedInstance];
  uint64_t v1 = [v0 deviceShouldDeferFlamesView];

  return v1;
}

uint64_t SiriUIDeviceHasSideButton()
{
  if (SiriUIDeviceHasSideButton_onceToken != -1) {
    dispatch_once(&SiriUIDeviceHasSideButton_onceToken, &__block_literal_global_152);
  }
  return SiriUIDeviceHasSideButton_hasSideButton;
}

uint64_t __SiriUIDeviceHasSideButton_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  SiriUIDeviceHasSideButton_hasSideButton = result == 2;
  return result;
}

uint64_t SiriUIDisableAlternativesFeature()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.alternatives"];
  uint64_t v1 = [v0 objectForKey:@"SiriUIAlternativesDisabledKey"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

uint64_t SiriUIShowSpeechAlternativeScore()
{
  if (AFIsCustomerInstallOrPPT()) {
    return 0;
  }
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.alternatives"];
  uint64_t v2 = [v1 objectForKey:@"SiriUIAlternativesShowScoreKey"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

uint64_t SiriLanguageSemanticContentAttribute()
{
  if (SiriLanguageIsRTL()) {
    return 4;
  }
  else {
    return 3;
  }
}

uint64_t SiriUISystemLanguageSemanticContentAttribute()
{
  if (SiriUISystemLanguageIsRTL()) {
    return 4;
  }
  else {
    return 3;
  }
}

uint64_t SiriLanguageTextAlignmentLeft()
{
  if (SiriLanguageIsRTL()) {
    return 2;
  }
  else {
    return 0;
  }
}

uint64_t SiriLanguageTextAlignmentRight()
{
  if (SiriLanguageIsRTL()) {
    return 0;
  }
  else {
    return 2;
  }
}

uint64_t SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets()
{
  return 1;
}

uint64_t SiriUIIsTextInputEnabled()
{
  return MEMORY[0x270F0EED0]();
}

uint64_t SiriUIIsHTTForTextInputEnabled()
{
  uint64_t v0 = [MEMORY[0x263F75488] sharedInstance];
  uint64_t v1 = [v0 isHoldToTalkForTextInputEnabled];

  return v1;
}

uint64_t SiriUIIsStreamingDictationEnabled()
{
  uint64_t v0 = [MEMORY[0x263F75488] sharedInstance];
  uint64_t v1 = [v0 isStreamingDictationEnabled];

  return v1;
}

uint64_t SiriUISafeForLockScreen()
{
  uint64_t v0 = [MEMORY[0x263F75488] sharedInstance];
  uint64_t v1 = [v0 isSiriSafeForLockScreen];

  return v1;
}

void SiriUISyncCachedPreferences()
{
  id v0 = [MEMORY[0x263F75488] sharedInstance];
  [v0 updatePreferences];
}

__CFString *SiriUINSStringFromSiriUIViewMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 4) > 4) {
    return @"SiriUIViewModeNone";
  }
  else {
    return off_26469F998[a1 - 4];
  }
}

uint64_t SiriUIIsValidPoint(double a1, double a2)
{
  double v2 = fabs(a1);
  BOOL v3 = v2 < INFINITY;
  if (v2 > INFINITY) {
    BOOL v3 = 1;
  }
  double v4 = fabs(a2);
  BOOL v5 = v4 < INFINITY;
  if (v4 > INFINITY) {
    BOOL v5 = 1;
  }
  return v5 & v3;
}

double SiriUITextHyphenationFactor()
{
  id v0 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v1 = [v0 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v1);

  double result = 0.0;
  if (IsAccessibilityCategory) {
    return 0.5;
  }
  return result;
}

double SiriUIMapRectMakeWithZoomLevel(CLLocationDegrees a1, CLLocationDegrees a2, double a3)
{
  double v5 = a3 * 3000.0 * MEMORY[0x223CB0DA0]();
  v7.latitude = a1;
  v7.longitude = a2;
  return MKMapPointForCoordinate(v7).x - v5 * 0.5;
}

id SiriUIMapRegionFromMapRect(double a1, double a2, double a3, double a4)
{
  id v8 = objc_alloc_init(MEMORY[0x263F67920]);
  v14.x = a1;
  v14.y = a2 + a4 * 0.5;
  [v8 setWestLng:MKCoordinateForMapPoint(v14).longitude];
  v15.x = a1 + a3;
  v15.y = a2 + a4 * 0.5;
  [v8 setEastLng:MKCoordinateForMapPoint(v15).longitude];
  double v9 = a1 + a3 * 0.5;
  v16.x = v9;
  v16.y = a2;
  CLLocationCoordinate2D v10 = MKCoordinateForMapPoint(v16);
  objc_msgSend(v8, "setNorthLat:", v10.latitude, v10.longitude);
  v17.y = a2 + a4;
  v17.x = v9;
  CLLocationCoordinate2D v11 = MKCoordinateForMapPoint(v17);
  objc_msgSend(v8, "setSouthLat:", v11.latitude, v11.longitude);
  return v8;
}

BOOL SiriUIAceViewHasButtons(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v3 = [v1 allConfirmationOptions];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v2 = 0;
          goto LABEL_9;
        }
        uint64_t v5 = [v1 confirmationOptions];
        double v4 = (void *)v5;
        goto LABEL_8;
      }
      BOOL v3 = [v1 items];
    }
    double v4 = v3;
    uint64_t v5 = [v3 count];
LABEL_8:
    BOOL v2 = v5 != 0;

    goto LABEL_9;
  }
  BOOL v2 = 1;
LABEL_9:

  return v2;
}

void sub_22322B4DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSearchUIDefaultBrowserAppIconImageClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SearchUILibraryCore_frameworkLibrary_1)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SearchUILibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26469F980;
    uint64_t v5 = 0;
    SearchUILibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!SearchUILibraryCore_frameworkLibrary_1) {
    __getSearchUIDefaultBrowserAppIconImageClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SearchUIDefaultBrowserAppIconImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSearchUIDefaultBrowserAppIconImageClass_block_invoke_cold_2();
  }
  getSearchUIDefaultBrowserAppIconImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SearchUILibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  SearchUILibraryCore_frameworkLibrary_1 = result;
  return result;
}

__CFString *SiriUIPresentationStateGetName(unint64_t a1)
{
  if (a1 < 7) {
    return off_26469F9F0[a1];
  }
  BOOL v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    SiriUIPresentationStateGetName_cold_1(a1, v3);
  }
  return 0;
}

void sub_22322DCEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_22322E074(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22322E6AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22323072C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_223233FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class __getSUICKPEntryPointClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SearchUICardKitProviderSupportLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SearchUICardKitProviderSupportLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26469FB98;
    uint64_t v5 = 0;
    SearchUICardKitProviderSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SearchUICardKitProviderSupportLibraryCore_frameworkLibrary) {
    __getSUICKPEntryPointClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SUICKPEntryPoint");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSUICKPEntryPointClass_block_invoke_cold_2();
  }
  getSUICKPEntryPointClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SearchUICardKitProviderSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SearchUICardKitProviderSupportLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getINUICKPEntryPointClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!IntentsUICardKitProviderSupportLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __IntentsUICardKitProviderSupportLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26469FBB0;
    uint64_t v5 = 0;
    IntentsUICardKitProviderSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IntentsUICardKitProviderSupportLibraryCore_frameworkLibrary) {
    __getINUICKPEntryPointClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("INUICKPEntryPoint");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getINUICKPEntryPointClass_block_invoke_cold_2();
  }
  getINUICKPEntryPointClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __IntentsUICardKitProviderSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IntentsUICardKitProviderSupportLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getVSUICKPEntryPointClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!VoiceShortcutsUICardKitProviderSupportLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __VoiceShortcutsUICardKitProviderSupportLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26469FBC8;
    uint64_t v5 = 0;
    VoiceShortcutsUICardKitProviderSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!VoiceShortcutsUICardKitProviderSupportLibraryCore_frameworkLibrary) {
    __getVSUICKPEntryPointClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("VSUICKPEntryPoint");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVSUICKPEntryPointClass_block_invoke_cold_2();
  }
  getVSUICKPEntryPointClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VoiceShortcutsUICardKitProviderSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VoiceShortcutsUICardKitProviderSupportLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSCKPProviderClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SiriUICardKitProviderSupportLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SiriUICardKitProviderSupportLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26469FBE0;
    uint64_t v5 = 0;
    SiriUICardKitProviderSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SiriUICardKitProviderSupportLibraryCore_frameworkLibrary) {
    __getSCKPProviderClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SCKPProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSCKPProviderClass_block_invoke_cold_2();
  }
  getSCKPProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SiriUICardKitProviderSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SiriUICardKitProviderSupportLibraryCore_frameworkLibrary = result;
  return result;
}

void __getCKTextBalloonViewClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *ChatKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SiriUIMessageContentTemplateView.m", 17, @"%s", *a1);

  __break(1u);
}

void __getCKTextBalloonViewClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getCKTextBalloonViewClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SiriUIMessageContentTemplateView.m", 18, @"Unable to find class %s", "CKTextBalloonView");

  __break(1u);
}

void __getAPUICardServiceClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *AppPredictionUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SiriUICardSnippetViewController.m", 106, @"%s", *a1);

  __break(1u);
}

void __getAPUICardServiceClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getAPUICardServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SiriUICardSnippetViewController.m", 107, @"Unable to find class %s", "APUICardService");

  __break(1u);
}

void __getSearchUICardViewControllerClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSearchUICardViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SiriUICardSnippetViewController.m", 98, @"Unable to find class %s", "SearchUICardViewController");

  __break(1u);
}

void SearchUILibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *SearchUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SiriUICardSnippetViewController.m", 97, @"%s", *a1);

  __break(1u);
}

void __getSearchUIBackgroundColorViewClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSearchUIBackgroundColorViewClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SiriUICardSnippetViewController.m", 99, @"Unable to find class %s", "SearchUIBackgroundColorView");

  __break(1u);
}

void __getSASSystemStateClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *SiriActivationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SiriUICarDNDUseSiriHeaderViewController.m", 35, @"%s", *a1);

  __break(1u);
}

void __getSASSystemStateClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSASSystemStateClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SiriUICarDNDUseSiriHeaderViewController.m", 36, @"Unable to find class %s", "SASSystemState");

  __break(1u);
}

void __getVTPreferencesClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *VoiceTriggerLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SiriUICarDNDUseSiriHeaderViewController.m", 47, @"%s", *a1);

  __break(1u);
}

void __getVTPreferencesClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getVTPreferencesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SiriUICarDNDUseSiriHeaderViewController.m", 48, @"Unable to find class %s", "VTPreferences");

  __break(1u);
}

void __getAnalyticsSendEventLazySymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *CoreAnalyticsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SiriUICarDNDUseSiriHeaderViewController.m", 29, @"%s", *a1);

  __break(1u);
}

void __getSearchUIBackgroundColorViewClass_block_invoke_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *SearchUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SiriUICardSnippetView.m", 17, @"%s", *a1);

  __break(1u);
}

void __getSearchUIBackgroundColorViewClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSearchUIBackgroundColorViewClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SiriUICardSnippetView.m", 18, @"Unable to find class %s", "SearchUIBackgroundColorView");

  __break(1u);
}

void SiriUIBlockExecuteMonitored_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  BOOL v3 = "SiriUIBlockExecuteMonitored";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2231EF000, a2, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v2, 0x16u);
}

void __getSearchUIDefaultBrowserAppIconImageClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *SearchUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SiriUIUtilities.m", 41, @"%s", *a1);

  __break(1u);
}

void __getSearchUIDefaultBrowserAppIconImageClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSearchUIDefaultBrowserAppIconImageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SiriUIUtilities.m", 42, @"Unable to find class %s", "SearchUIDefaultBrowserAppIconImage");

  __break(1u);
}

void SiriUIPresentationStateGetName_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  BOOL v3 = "SiriUIPresentationStateGetName";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2231EF000, a2, OS_LOG_TYPE_ERROR, "%s Unknown SiriUIPresentationState %li", (uint8_t *)&v2, 0x16u);
}

void __getSUICKPEntryPointClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *SearchUICardKitProviderSupportLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SiriUICardProviderRegistry.m", 27, @"%s", *a1);

  __break(1u);
}

void __getSUICKPEntryPointClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSUICKPEntryPointClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SiriUICardProviderRegistry.m", 28, @"Unable to find class %s", "SUICKPEntryPoint");

  __break(1u);
}

void __getINUICKPEntryPointClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *IntentsUICardKitProviderSupportLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SiriUICardProviderRegistry.m", 24, @"%s", *a1);

  __break(1u);
}

void __getINUICKPEntryPointClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getINUICKPEntryPointClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SiriUICardProviderRegistry.m", 25, @"Unable to find class %s", "INUICKPEntryPoint");

  __break(1u);
}

void __getVSUICKPEntryPointClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *VoiceShortcutsUICardKitProviderSupportLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SiriUICardProviderRegistry.m", 33, @"%s", *a1);

  __break(1u);
}

void __getVSUICKPEntryPointClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getVSUICKPEntryPointClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SiriUICardProviderRegistry.m", 34, @"Unable to find class %s", "VSUICKPEntryPoint");

  __break(1u);
}

void __getSCKPProviderClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *SiriUICardKitProviderSupportLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SiriUICardProviderRegistry.m", 30, @"%s", *a1);

  __break(1u);
}

void __getSCKPProviderClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSCKPProviderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SiriUICardProviderRegistry.m", 31, @"Unable to find class %s", "SCKPProvider");

  __break(1u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x270F0B6B0]();
}

uint64_t AFAnalyticsContextCreateWithError()
{
  return MEMORY[0x270F0EBF8]();
}

uint64_t AFAnalyticsEventTypeGetName()
{
  return MEMORY[0x270F0EC20]();
}

uint64_t AFAssistantRestricted()
{
  return MEMORY[0x270F0EC38]();
}

uint64_t AFIsCustomerInstallOrPPT()
{
  return MEMORY[0x270F0EDB0]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x270F0EDD0]();
}

uint64_t AFLogDirectory()
{
  return MEMORY[0x270F0EE08]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6740](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateIncremental(CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5020](options);
}

CGImageSourceStatus CGImageSourceGetStatus(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5058](isrc);
}

void CGImageSourceUpdateData(CGImageSourceRef isrc, CFDataRef data, BOOL final)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x270EE7EF8](retstr, start, duration);
}

uint64_t INIntentSlotValueTransformToLocation()
{
  return MEMORY[0x270EF5240]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

CLLocationCoordinate2D MKCoordinateForMapPoint(MKMapPoint mapPoint)
{
  MEMORY[0x270EF58A8]((__n128)mapPoint, *(__n128 *)&mapPoint.y);
  result.longitude = v2;
  result.latitude = v1;
  return result;
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MEMORY[0x270EF58C8]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.y = v2;
  result.x = v1;
  return result;
}

double MKMapPointsPerMeterAtLatitude(CLLocationDegrees latitude)
{
  MEMORY[0x270EF58D0](latitude);
  return result;
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x270EF2BF8]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F055F0](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x270F05620](target, flags);
}

uint64_t SFFeedbackListenerRegister()
{
  return MEMORY[0x270F5CEC8]();
}

uint64_t SFFeedbackNotify()
{
  return MEMORY[0x270F5CED0]();
}

uint64_t SRUIFPopulateSendCommandWithInstrumentationTurn()
{
  return MEMORY[0x270F72868]();
}

uint64_t SiriSharedUIDeviceIsPad()
{
  return MEMORY[0x270F71078]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x270F05EE8]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F05F20]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x270F05F28]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x270F05F80]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x270F05FB8]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F05FC8](category);
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x270F05FF0]();
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

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x270F061E0]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x270F061F0]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x270F061F8]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x270F06208]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x270F06210]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x270F06218]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x270F06248]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F06270]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x270F062A8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
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

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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