void __SYIsMailApp_block_invoke()
{
  void *v0;
  id v1;
  uint64_t vars8;

  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  SYIsMailApp___result = [v0 isEqualToString:@"com.apple.mobilemail"];
}

uint64_t SYIsMailApp()
{
  if (SYIsMailApp___onceToken != -1) {
    dispatch_once(&SYIsMailApp___onceToken, &__block_literal_global_3);
  }
  return SYIsMailApp___result;
}

void sub_1C2C627A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1C2C62AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1C2C634E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1C2C63754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2C63AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _localUIApplicationIsExtension()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  v0 = (uint64_t (*)(void))get_UIApplicationIsExtensionSymbolLoc_ptr;
  v6 = get_UIApplicationIsExtensionSymbolLoc_ptr;
  if (!get_UIApplicationIsExtensionSymbolLoc_ptr)
  {
    v1 = (void *)UIKitLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "_UIApplicationIsExtension");
    get_UIApplicationIsExtensionSymbolLoc_ptr = (_UNKNOWN *)v4[3];
    v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    _localUIApplicationIsExtension_cold_1();
  }
  return v0();
}

void sub_1C2C63BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2C63D58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL SYIsLinkableUserActivity(void *a1)
{
  id v1 = a1;
  v2 = [v1 activityType];
  if ([v2 length])
  {
    uint64_t v3 = [v1 activityType];
    if ([v3 isEqualToString:@"com.apple.notes.activity.edit-note"])
    {
      BOOL v4 = 0;
    }
    else
    {
      uint64_t v5 = [v1 webpageURL];
      if (v5)
      {
        BOOL v4 = 1;
      }
      else
      {
        v6 = [v1 canonicalURL];
        if (v6)
        {
          BOOL v4 = 1;
        }
        else
        {
          uint64_t v7 = [v1 persistentIdentifier];
          if ([v7 length])
          {
            BOOL v4 = 1;
          }
          else
          {
            v8 = [v1 targetContentIdentifier];
            BOOL v4 = [v8 length] != 0;
          }
        }
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

Class __getUIApplicationClass_block_invoke(uint64_t a1)
{
  UIKitLibrary();
  Class result = objc_getClass("UIApplication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUIApplicationClass_block_invoke_cold_1();
  }
  getUIApplicationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUIApplicationClass_block_invoke_0(uint64_t a1)
{
  UIKitLibrary_0();
  Class result = objc_getClass("UIApplication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUIApplicationClass_block_invoke_cold_1_0();
  }
  getUIApplicationClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C2C64584(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1C2C646E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1C2C64958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t UIKitLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary_0)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __UIKitLibraryCore_block_invoke_0;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E6463A00;
    uint64_t v4 = 0;
    UIKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = UIKitLibraryCore_frameworkLibrary_0;
  if (!UIKitLibraryCore_frameworkLibrary_0) {
    UIKitLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t UIKitLibrary_0()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary_2)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __UIKitLibraryCore_block_invoke_2;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E6464868;
    uint64_t v4 = 0;
    UIKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  uint64_t v0 = UIKitLibraryCore_frameworkLibrary_2;
  if (!UIKitLibraryCore_frameworkLibrary_2) {
    UIKitLibrary_cold_1_0(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

id getUAUserActivityClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getUAUserActivityClass_softClass;
  uint64_t v7 = getUAUserActivityClass_softClass;
  if (!getUAUserActivityClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getUAUserActivityClass_block_invoke;
    v3[3] = &unk_1E64635F8;
    v3[4] = &v4;
    __getUAUserActivityClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C2C64D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUAUserActivityClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!UserActivityLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __UserActivityLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6464810;
    uint64_t v5 = 0;
    UserActivityLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!UserActivityLibraryCore_frameworkLibrary_0) {
    __getUAUserActivityClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("UAUserActivity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUAUserActivityClass_block_invoke_cold_2();
  }
  getUAUserActivityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUAUserActivityClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!UserActivityLibraryCore_frameworkLibrary_1)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __UserActivityLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6464850;
    uint64_t v5 = 0;
    UserActivityLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!UserActivityLibraryCore_frameworkLibrary_1) {
    __getUAUserActivityClass_block_invoke_cold_1_0(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("UAUserActivity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUAUserActivityClass_block_invoke_cold_2_0();
  }
  getUAUserActivityClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SYIsReturnToSenderEnabled()
{
  return MEMORY[0x1F40C9FB0]("Synapse", "ReturnToSender");
}

uint64_t SYIsQuickNoteOnPhoneEnabled()
{
  return MEMORY[0x1F40C9FB0]("PencilAndPaper", "QNOnPhone");
}

uint64_t SYIsBacklinkingSupportedForDevice()
{
  int v0 = MGGetSInt32Answer();
  if (v0 == 9 || v0 == 3)
  {
    return +[SYFeatureEligibility supportsQuickNote];
  }
  else if (v0 == 1 {
         && +[SYFeatureEligibility supportsQuickNote])
  }
  {
    return SYIsQuickNoteOnPhoneEnabled();
  }
  else
  {
    return 0;
  }
}

void sub_1C2C65DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Block_object_dispose((const void *)(v16 - 80), 8);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke(uint64_t a1)
{
  FrontBoardServicesLibrary();
  Class result = objc_getClass("FBSDisplayLayoutMonitorConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke_cold_1();
  }
  getFBSDisplayLayoutMonitorConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke_0(uint64_t a1)
{
  FrontBoardServicesLibrary_0();
  Class result = objc_getClass("FBSDisplayLayoutMonitorConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke_cold_1_0();
  }
  getFBSDisplayLayoutMonitorConfigurationClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getFBSDisplayLayoutMonitorClass_block_invoke(uint64_t a1)
{
  FrontBoardServicesLibrary();
  Class result = objc_getClass("FBSDisplayLayoutMonitor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFBSDisplayLayoutMonitorClass_block_invoke_cold_1();
  }
  getFBSDisplayLayoutMonitorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getFBSDisplayLayoutMonitorClass_block_invoke_0(uint64_t a1)
{
  FrontBoardServicesLibrary_0();
  Class result = objc_getClass("FBSDisplayLayoutMonitor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFBSDisplayLayoutMonitorClass_block_invoke_cold_1_0();
  }
  getFBSDisplayLayoutMonitorClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void FrontBoardServicesLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __FrontBoardServicesLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E6463DF8;
    uint64_t v2 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!FrontBoardServicesLibraryCore_frameworkLibrary) {
    FrontBoardServicesLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

void FrontBoardServicesLibrary_0()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary_1)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __FrontBoardServicesLibraryCore_block_invoke_1;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E64648A8;
    uint64_t v2 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!FrontBoardServicesLibraryCore_frameworkLibrary_1) {
    FrontBoardServicesLibrary_cold_1_0(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

void sub_1C2C667F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2C66B3C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1C2C67184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLPMetadataProviderClass_block_invoke(uint64_t a1)
{
  LinkPresentationLibrary();
  Class result = objc_getClass("LPMetadataProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLPMetadataProviderClass_block_invoke_cold_1();
  }
  getLPMetadataProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void LinkPresentationLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!LinkPresentationLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __LinkPresentationLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E6463618;
    uint64_t v2 = 0;
    LinkPresentationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!LinkPresentationLibraryCore_frameworkLibrary) {
    LinkPresentationLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __LinkPresentationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LinkPresentationLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getLPLinkMetadataClass_block_invoke(uint64_t a1)
{
  LinkPresentationLibrary();
  Class result = objc_getClass("LPLinkMetadata");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLPLinkMetadataClass_block_invoke_cold_1();
  }
  getLPLinkMetadataClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUIImageClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __UIKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6463650;
    uint64_t v5 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!UIKitLibraryCore_frameworkLibrary) {
    __getUIImageClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("UIImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUIImageClass_block_invoke_cold_2();
  }
  getUIImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getLPImageClass_block_invoke(uint64_t a1)
{
  LinkPresentationLibrary();
  Class result = objc_getClass("LPImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLPImageClass_block_invoke_cold_1();
  }
  getLPImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1C2C68DB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1C2C6A2F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C2C6A570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C2C6AB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1C2C6BE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2C6BFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2C6C3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __SYScreenScale_block_invoke()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2050000000;
  int v0 = (void *)getUIScreenClass_softClass;
  uint64_t v8 = getUIScreenClass_softClass;
  if (!getUIScreenClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getUIScreenClass_block_invoke;
    v4[3] = &unk_1E64635F8;
    v4[4] = &v5;
    __getUIScreenClass_block_invoke((uint64_t)v4);
    int v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  uint64_t v2 = [v1 mainScreen];
  [v2 scale];
  SYScreenScale___scale = v3;
}

void sub_1C2C6C658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIScreenClass_block_invoke(uint64_t a1)
{
  UIKitLibrary();
  Class result = objc_getClass("UIScreen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUIScreenClass_block_invoke_cold_1();
  }
  getUIScreenClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UIKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void __SYIsRTL_block_invoke()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  int v0 = (void *)getUIApplicationClass_softClass;
  uint64_t v7 = getUIApplicationClass_softClass;
  if (!getUIApplicationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getUIApplicationClass_block_invoke;
    v3[3] = &unk_1E64635F8;
    v3[4] = &v4;
    __getUIApplicationClass_block_invoke((uint64_t)v3);
    int v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  uint64_t v2 = [v1 sharedApplication];
  SYIsRTL___isRTL = [v2 userInterfaceLayoutDirection] == 1;
}

void sub_1C2C6C81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNAvatarImageRendererSettingsClass_block_invoke(uint64_t a1)
{
  ContactsUILibrary();
  Class result = objc_getClass("CNAvatarImageRendererSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNAvatarImageRendererSettingsClass_block_invoke_cold_1();
  }
  getCNAvatarImageRendererSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ContactsUILibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __ContactsUILibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E6463A18;
    uint64_t v2 = 0;
    ContactsUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ContactsUILibraryCore_frameworkLibrary) {
    ContactsUILibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __ContactsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCNAvatarImageRendererClass_block_invoke(uint64_t a1)
{
  ContactsUILibrary();
  Class result = objc_getClass("CNAvatarImageRenderer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNAvatarImageRendererClass_block_invoke_cold_1();
  }
  getCNAvatarImageRendererClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNAvatarImageRenderingScopeClass_block_invoke(uint64_t a1)
{
  ContactsUILibrary();
  Class result = objc_getClass("CNAvatarImageRenderingScope");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNAvatarImageRenderingScopeClass_block_invoke_cold_1();
  }
  getCNAvatarImageRenderingScopeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getUIImagePNGRepresentationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary();
  Class result = dlsym(v2, "UIImagePNGRepresentation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIImagePNGRepresentationSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C2C6CB88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C2C6CC28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C2C6CCA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C2C6CD2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C2C6CDD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C2C6CE80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C2C6CF78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C2C6D180(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C2C6D27C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C2C6D944(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1C2C6DD78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2C6EFC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2C6F184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C2C70A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
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

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id SYNotesUserDefaults()
{
  int v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobilenotes"];
  return v0;
}

BOOL SYIsPhone()
{
  return MGGetSInt32Answer() - 1 < 2;
}

uint64_t SYIsQuickNoteAvailable()
{
  id v6 = 0;
  int v0 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.mobilenotes" allowPlaceholder:1 error:&v6];
  id v1 = v6;
  if (v1)
  {
    uint64_t v2 = os_log_create("com.apple.synapse", "");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      SYIsQuickNoteAvailable_cold_1((uint64_t)v1, v2);
    }
  }
  uint64_t v3 = [v0 applicationState];
  uint64_t v4 = [v3 isInstalled];

  return v4;
}

uint64_t SYIsMailBundleId(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.mobilemail"];
}

uint64_t SYIsPreviewApp()
{
  if (SYIsPreviewApp___onceToken != -1) {
    dispatch_once(&SYIsPreviewApp___onceToken, &__block_literal_global_74);
  }
  return SYIsPreviewApp___result;
}

void __SYIsPreviewApp_block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  int v0 = [v1 bundleIdentifier];
  SYIsPreviewApp___Class result = [v0 isEqualToString:@"com.apple.Preview"];
}

uint64_t SYIsiWorkApp()
{
  if (SYIsiWorkApp___onceToken != -1) {
    dispatch_once(&SYIsiWorkApp___onceToken, &__block_literal_global_79);
  }
  return SYIsiWorkApp___result;
}

void __SYIsiWorkApp_block_invoke()
{
  int v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v2 = [v0 bundleIdentifier];

  if (([v2 isEqualToString:@"com.apple.iWork.Pages"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.iWork.Numbers"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.iWork.Keynote"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.Pages"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.Numbers"] & 1) != 0)
  {
    char v1 = 1;
  }
  else
  {
    char v1 = [v2 isEqualToString:@"com.apple.Keynote"];
  }
  SYIsiWorkApp___Class result = v1;
}

uint64_t SYPBContentItemReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 24;
          goto LABEL_28;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_28;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 48;
          goto LABEL_28;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 56;
          goto LABEL_28;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_28;
        case 9u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 64;
          goto LABEL_28;
        case 0xAu:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 40;
LABEL_28:
          v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 0xBu:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 72) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_39;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          uint64_t v23 = 0;
          goto LABEL_41;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v23 = 0;
      }
LABEL_41:
      *(void *)(a1 + 8) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1C2C72E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2C73B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C2C74214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Block_object_dispose((const void *)(v16 - 96), 8);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _SYHandleRemoteCurrentActivityChange(uint64_t a1, void *a2)
{
  uint64_t v3 = os_log_create("com.apple.synapse", "LinkableItemFinder");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1C2C5F000, v3, OS_LOG_TYPE_INFO, "Handle remote user activity change", v5, 2u);
  }

  return [a2 handleRemoteCurrentActivityDidChange];
}

void sub_1C2C74EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2C7535C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void sub_1C2C754A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __FrontBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FrontBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getUAUserActivityProxyClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!UserActivityLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __UserActivityLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6463E10;
    uint64_t v5 = 0;
    UserActivityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!UserActivityLibraryCore_frameworkLibrary) {
    __getUAUserActivityProxyClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("UAUserActivityProxy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUAUserActivityProxyClass_block_invoke_cold_2();
  }
  getUAUserActivityProxyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UserActivityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UserActivityLibraryCore_frameworkLibrary = result;
  return result;
}

SYNotesActivationContext *SYActivationContextForUserActivity(void *a1)
{
  id v1 = a1;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqual:@"com.apple.springboard"];

  if ((v4 & 1) == 0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __SYActivationContextForUserActivity_block_invoke;
    v10[3] = &unk_1E6463EF0;
    v10[4] = &v15;
    v10[5] = &v11;
    uint64_t v5 = (void (**)(void))MEMORY[0x1C8769940](v10);
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v5[2](v5);
    }
    else {
      dispatch_sync(MEMORY[0x1E4F14428], v5);
    }
  }
  uint64_t v6 = [v1 _createUserActivityDataWithSaving:0 options:MEMORY[0x1E4F1CC08] error:0];
  uint64_t v7 = [SYNotesActivationContext alloc];
  char v8 = [(SYNotesActivationContext *)v7 initWithUserActivityData:v6 contextID:*((unsigned int *)v12 + 6) renderID:v16[3]];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v8;
}

void sub_1C2C76828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void __SYActivationContextForUserActivity_block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v2 = (void *)getUIWindowClass_softClass;
  uint64_t v13 = getUIWindowClass_softClass;
  if (!getUIWindowClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getUIWindowClass_block_invoke;
    v9[3] = &unk_1E64635F8;
    v9[4] = &v10;
    __getUIWindowClass_block_invoke((uint64_t)v9);
    id v2 = (void *)v11[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v10, 8);
  char v4 = [v3 _applicationKeyWindow];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 layer];
    uint64_t v7 = CALayerGetContext();

    char v8 = [v7 layer];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CALayerGetRenderId();

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 contextId];
  }
}

void sub_1C2C76BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIWindowClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary_1)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __UIKitLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6463F10;
    uint64_t v5 = 0;
    UIKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!UIKitLibraryCore_frameworkLibrary_1) {
    __getUIWindowClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("UIWindow");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUIWindowClass_block_invoke_cold_2();
  }
  getUIWindowClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UIKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

id SYFormatErrorMalformed()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  int v0 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v5[0] = @"Data format is corrupted or malformed.";
  id v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  id v2 = [v0 errorWithDomain:@"com.apple.synapse" code:-122 userInfo:v1];

  return v2;
}

__CFString *SYDescriptionForBacklinkMonitorOperationState(unint64_t a1)
{
  if (a1 > 3) {
    return &stru_1F1E16740;
  }
  else {
    return off_1E6463FA0[a1];
  }
}

void sub_1C2C79738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C2C7AF30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1C2C7B420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1C2C7C684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
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

void sub_1C2C7F350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1C2C7FE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSBSSystemNotesPresentationConfigurationClass_block_invoke(uint64_t a1)
{
  SpringBoardServicesLibrary();
  Class result = objc_getClass("SBSSystemNotesPresentationConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSBSSystemNotesPresentationConfigurationClass_block_invoke_cold_1();
  }
  getSBSSystemNotesPresentationConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void SpringBoardServicesLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __SpringBoardServicesLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E6464380;
    uint64_t v2 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpringBoardServicesLibraryCore_frameworkLibrary) {
    SpringBoardServicesLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __SpringBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSBSSystemNotesPresentationHandleClass_block_invoke(uint64_t a1)
{
  SpringBoardServicesLibrary();
  Class result = objc_getClass("SBSSystemNotesPresentationHandle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSBSSystemNotesPresentationHandleClass_block_invoke_cold_1();
  }
  getSBSSystemNotesPresentationHandleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C2C80738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
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

void sub_1C2C80C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1C2C81044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1C2C81844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFBSOpenApplicationOptionKeyActivateSuspendedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary_0)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __FrontBoardServicesLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E6464468;
    uint64_t v6 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v2 = (void *)FrontBoardServicesLibraryCore_frameworkLibrary_0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary_0) {
    __getFBSOpenApplicationOptionKeyActivateSuspendedSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  Class result = dlsym(v2, "FBSOpenApplicationOptionKeyActivateSuspended");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFBSOpenApplicationOptionKeyActivateSuspendedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

uint64_t __FrontBoardServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  FrontBoardServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

id _escapedSearchString(void *a1)
{
  long long v1 = (void *)[a1 mutableCopy];
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"\\", @"\\\\", 0, 0, objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"\"", @"\\\"", 0, 0, objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"'", @"\\'", 0, 0, objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"*", @"\\*", 0, 0, objc_msgSend(v1, "length"));
  return v1;
}

id _searchableDomainNameForURL(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "_lp_highLevelDomain");
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [v1 host];
  }
  long long v5 = v4;

  uint64_t v6 = _escapedSearchString(v5);

  return v6;
}

void sub_1C2C88110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSBSSystemNotesPresentationConfigurationClass_block_invoke_0(uint64_t a1)
{
  SpringBoardServicesLibrary_0();
  Class result = objc_getClass("SBSSystemNotesPresentationConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSBSSystemNotesPresentationConfigurationClass_block_invoke_cold_1_0();
  }
  getSBSSystemNotesPresentationConfigurationClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void SpringBoardServicesLibrary_0()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary_0)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __SpringBoardServicesLibraryCore_block_invoke_0;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E6464688;
    uint64_t v2 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!SpringBoardServicesLibraryCore_frameworkLibrary_0) {
    SpringBoardServicesLibrary_cold_1_0(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __SpringBoardServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SpringBoardServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getSBSSystemNotesPresentationRequestClass_block_invoke(uint64_t a1)
{
  SpringBoardServicesLibrary_0();
  Class result = objc_getClass("SBSSystemNotesPresentationRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSBSSystemNotesPresentationRequestClass_block_invoke_cold_1();
  }
  getSBSSystemNotesPresentationRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C2C8887C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C2C890D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1C2C89E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1C2C8B070(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C2C8B410(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C2C8B5A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getICSystemPaperSceneViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!SystemPaperPresentationLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __SystemPaperPresentationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6464730;
    uint64_t v5 = 0;
    SystemPaperPresentationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SystemPaperPresentationLibraryCore_frameworkLibrary) {
    __getICSystemPaperSceneViewControllerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("ICSystemPaperSceneViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getICSystemPaperSceneViewControllerClass_block_invoke_cold_2();
  }
  getICSystemPaperSceneViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SystemPaperPresentationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SystemPaperPresentationLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __UserActivityLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  UserActivityLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1C2C8CA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_1C2C8CB94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C2C8CD78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v7);
  _Unwind_Resume(a1);
}

void sub_1C2C8CF44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C2C8CFCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __UserActivityLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  UserActivityLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t __UIKitLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void *__getUIApplicationDidBecomeActiveNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary_0();
  uint64_t result = dlsym(v2, "UIApplicationDidBecomeActiveNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIApplicationDidBecomeActiveNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getUIApplicationWillResignActiveNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary_0();
  uint64_t result = dlsym(v2, "UIApplicationWillResignActiveNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIApplicationWillResignActiveNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FrontBoardServicesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  FrontBoardServicesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void sub_1C2C8EBDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SYPathIsInMailDownloadsDir(void *a1)
{
  id v1 = a1;
  uint64_t v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  uint64_t v3 = [v2 firstObject];

  long long v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  uint64_t v5 = [v4 URLByAppendingPathComponent:@"Containers/com.apple.mail/Data/Library/Mail Downloads/"];
  uint64_t v6 = [v5 path];

  uint64_t v7 = [v1 hasPrefix:v6];
  return v7;
}

void OUTLINED_FUNCTION_3_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1C2C92B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

id _SYBundle()
{
  if (_SYBundle___onceToken != -1) {
    dispatch_once(&_SYBundle___onceToken, &__block_literal_global_17);
  }
  int v0 = (void *)_SYBundle___bundle;
  return v0;
}

id SYSupportedLinkContextInfoClasses()
{
  if (SYSupportedLinkContextInfoClasses_onceToken != -1) {
    dispatch_once(&SYSupportedLinkContextInfoClasses_onceToken, &__block_literal_global_18);
  }
  int v0 = (void *)SYSupportedLinkContextInfoClasses_supportedClasses;
  return v0;
}

uint64_t __SYSupportedLinkContextInfoClasses_block_invoke()
{
  int v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  SYSupportedLinkContextInfoClasses_supportedClasses = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t SYCanUseObjectInContextInfo(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = SYSupportedLinkContextInfoClasses();
  if ([v2 containsObject:objc_opt_class()])
  {
    uint64_t v3 = 1;
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v4 = v2;
    uint64_t v3 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v4);
          }
          if (objc_opt_isKindOfClass())
          {
            uint64_t v3 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v3 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v3;
}

uint64_t SYEquivalentUserActivities(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  if (v3 && v4)
  {
    uint64_t v7 = [v3 activityType];
    long long v8 = [v5 activityType];
    int v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      long long v10 = [v5 persistentIdentifier];
      uint64_t v11 = [v10 length];

      if (v11)
      {
        uint64_t v12 = [v3 persistentIdentifier];
        uint64_t v13 = [v5 persistentIdentifier];
        char v14 = [v12 isEqualToString:v13];

        if (v14) {
          goto LABEL_9;
        }
      }
      uint64_t v15 = [v5 targetContentIdentifier];
      uint64_t v16 = [v15 length];

      if (v16)
      {
        uint64_t v17 = [v3 targetContentIdentifier];
        uint64_t v18 = [v5 targetContentIdentifier];
        char v19 = [v17 isEqualToString:v18];

        if (v19) {
          goto LABEL_9;
        }
      }
    }
    v20 = [v3 canonicalURL];
    char v21 = [v5 canonicalURL];
    char v22 = SYEquivalentURLs(v20, v21);

    if (v22)
    {
LABEL_9:
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v23 = [v3 webpageURL];
      uint64_t v24 = [v5 webpageURL];
      uint64_t v6 = SYEquivalentURLs(v23, v24);
    }
  }

  return v6;
}

uint64_t SYEquivalentURLs(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  if (v3 && v4)
  {
    if ([v3 isEqual:v4])
    {
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v7 = objc_msgSend(v3, "_lp_simplifiedURLStringForFuzzyMatching");
      long long v8 = objc_msgSend(v5, "_lp_simplifiedURLStringForFuzzyMatching");
      uint64_t v6 = [v7 isEqualToString:v8];
    }
  }

  return v6;
}

void *SYIsCurrentLocalUserActivity(void *result)
{
  if (result)
  {
    id v1 = (void *)MEMORY[0x1E4F22488];
    id v2 = result;
    id v3 = [v1 _currentUserActivityUUID];
    id v4 = [v2 _uniqueIdentifier];

    uint64_t v5 = [v3 isEqual:v4];
    return (void *)v5;
  }
  return result;
}

id SYMakeEditNoteUserActivity(void *a1, void *a2)
{
  return SYMakeUserActivity(@"com.apple.notes.activity.edit-note", a1, a2);
}

id SYMakeUserActivity(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F22488];
  id v8 = a1;
  int v9 = (void *)[[v7 alloc] initWithActivityType:v8];

  long long v10 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v5 count])
  {
    uint64_t v11 = [v5 firstObject];
    [v10 setObject:v11 forKeyedSubscript:@"domainIdentifier"];
  }
  if ([v6 count])
  {
    uint64_t v12 = [v6 firstObject];
    [v10 setObject:v12 forKeyedSubscript:@"uuid"];
  }
  uint64_t v13 = SYNotesUserDefaults();
  char v14 = [v13 objectForKey:@"ICShouldResumeLastQuickNoteDefaultsKey"];

  if (v14)
  {
    int v15 = [v13 BOOLForKey:@"ICShouldResumeLastQuickNoteDefaultsKey"];
    uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithInt:v15 ^ 1u];
    [v10 setObject:v16 forKeyedSubscript:@"SYLinkPreferNewDocument"];
  }
  uint64_t v17 = (void *)[v10 copy];
  [v9 setUserInfo:v17];

  return v9;
}

void __getLPMetadataProviderClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getLPMetadataProviderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYContentItemPreviewManager.m", 19, @"Unable to find class %s", "LPMetadataProvider");

  __break(1u);
}

void LinkPresentationLibrary_cold_1(void *a1)
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *LinkPresentationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYContentItemPreviewManager.m", 18, @"%s", *a1);

  __break(1u);
}

void __getLPLinkMetadataClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getLPLinkMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYContentItemPreviewManager.m", 20, @"Unable to find class %s", "LPLinkMetadata");

  __break(1u);
}

void __getUIImageClass_block_invoke_cold_1(void *a1)
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *UIKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYContentItemPreviewManager.m", 25, @"%s", *a1);

  __break(1u);
}

void __getUIImageClass_block_invoke_cold_2()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getUIImageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYContentItemPreviewManager.m", 26, @"Unable to find class %s", "UIImage");

  __break(1u);
}

void __getLPImageClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getLPImageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYContentItemPreviewManager.m", 21, @"Unable to find class %s", "LPImage");

  __break(1u);
}

void __getUIScreenClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getUIScreenClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYDocumentSenderAvatar.m", 25, @"Unable to find class %s", "UIScreen");

  __break(1u);
}

void UIKitLibrary_cold_1(void *a1)
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *UIKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYDocumentSenderAvatar.m", 23, @"%s", *a1);

  __break(1u);
}

void __getUIApplicationClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getUIApplicationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYDocumentSenderAvatar.m", 24, @"Unable to find class %s", "UIApplication");

  __break(1u);
}

void __getCNAvatarImageRendererSettingsClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getCNAvatarImageRendererSettingsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYDocumentSenderAvatar.m", 27, @"Unable to find class %s", "CNAvatarImageRendererSettings");

  __break(1u);
}

void ContactsUILibrary_cold_1(void *a1)
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *ContactsUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYDocumentSenderAvatar.m", 17, @"%s", *a1);

  __break(1u);
}

void __getCNAvatarImageRendererClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getCNAvatarImageRendererClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYDocumentSenderAvatar.m", 18, @"Unable to find class %s", "CNAvatarImageRenderer");

  __break(1u);
}

void __getCNAvatarImageRenderingScopeClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getCNAvatarImageRenderingScopeClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYDocumentSenderAvatar.m", 19, @"Unable to find class %s", "CNAvatarImageRenderingScope");

  __break(1u);
}

void SYIsQuickNoteAvailable_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  id v3 = @"com.apple.mobilenotes";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Failed to find record for %@, error: %@", (uint8_t *)&v2, 0x16u);
}

void __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getFBSDisplayLayoutMonitorConfigurationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYLinkableContentItemFinder.m", 37, @"Unable to find class %s", "FBSDisplayLayoutMonitorConfiguration");

  __break(1u);
}

void FrontBoardServicesLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *FrontBoardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYLinkableContentItemFinder.m", 35, @"%s", *a1);

  __break(1u);
}

void __getFBSDisplayLayoutMonitorClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getFBSDisplayLayoutMonitorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYLinkableContentItemFinder.m", 36, @"Unable to find class %s", "FBSDisplayLayoutMonitor");

  __break(1u);
}

void __getUAUserActivityProxyClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *UserActivityLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYLinkableContentItemFinder.m", 23, @"%s", *a1);

  __break(1u);
}

void __getUAUserActivityProxyClass_block_invoke_cold_2()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getUAUserActivityProxyClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYLinkableContentItemFinder.m", 24, @"Unable to find class %s", "UAUserActivityProxy");

  __break(1u);
}

void __getUIWindowClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *UIKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYNotesActivationClient.m", 25, @"%s", *a1);

  __break(1u);
}

void __getUIWindowClass_block_invoke_cold_2()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getUIWindowClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYNotesActivationClient.m", 27, @"Unable to find class %s", "UIWindow");

  __break(1u);
}

void __getSBSSystemNotesPresentationConfigurationClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSBSSystemNotesPresentationConfigurationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYShowBacklinkIndicatorCommandSBImpl.m", 19, @"Unable to find class %s", "SBSSystemNotesPresentationConfiguration");

  __break(1u);
}

void SpringBoardServicesLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *SpringBoardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYShowBacklinkIndicatorCommandSBImpl.m", 17, @"%s", *a1);

  __break(1u);
}

void __getSBSSystemNotesPresentationHandleClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSBSSystemNotesPresentationHandleClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYShowBacklinkIndicatorCommandSBImpl.m", 18, @"Unable to find class %s", "SBSSystemNotesPresentationHandle");

  __break(1u);
}

void __getFBSOpenApplicationOptionKeyActivateSuspendedSymbolLoc_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *FrontBoardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYShowBacklinkIndicatorCommandPhoneImpl.m", 25, @"%s", *a1);

  __break(1u);
}

void __getSBSSystemNotesPresentationConfigurationClass_block_invoke_cold_1_0()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSBSSystemNotesPresentationConfigurationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYNotesActivationCommandSBImpl.m", 24, @"Unable to find class %s", "SBSSystemNotesPresentationConfiguration");

  __break(1u);
}

void SpringBoardServicesLibrary_cold_1_0(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *SpringBoardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYNotesActivationCommandSBImpl.m", 22, @"%s", *a1);

  __break(1u);
}

void __getSBSSystemNotesPresentationRequestClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSBSSystemNotesPresentationRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYNotesActivationCommandSBImpl.m", 23, @"Unable to find class %s", "SBSSystemNotesPresentationRequest");

  __break(1u);
}

void __getICSystemPaperSceneViewControllerClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *SystemPaperPresentationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYNotesActivationCommandInAppImpl.m", 16, @"%s", *a1);

  __break(1u);
}

void __getICSystemPaperSceneViewControllerClass_block_invoke_cold_2()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getICSystemPaperSceneViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYNotesActivationCommandInAppImpl.m", 18, @"Unable to find class %s", "ICSystemPaperSceneViewController");

  __break(1u);
}

void __getUAUserActivityClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *UserActivityLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYActivityObserver.m", 30, @"%s", *a1);

  __break(1u);
}

void __getUAUserActivityClass_block_invoke_cold_2()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getUAUserActivityClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYActivityObserver.m", 31, @"Unable to find class %s", "UAUserActivity");

  __break(1u);
}

void __getUAUserActivityClass_block_invoke_cold_1_0(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *UserActivityLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYNSUserActivityExtensions.m", 19, @"%s", *a1);

  __break(1u);
}

void __getUAUserActivityClass_block_invoke_cold_2_0()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getUAUserActivityClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYNSUserActivityExtensions.m", 20, @"Unable to find class %s", "UAUserActivity");

  __break(1u);
}

void _localUIApplicationIsExtension_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"BOOL _localUIApplicationIsExtension(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYApplicationStateObserver.m", 19, @"%s", dlerror());

  __break(1u);
}

void UIKitLibrary_cold_1_0(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *UIKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYApplicationStateObserver.m", 15, @"%s", *a1);

  __break(1u);
}

void __getUIApplicationClass_block_invoke_cold_1_0()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getUIApplicationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYApplicationStateObserver.m", 18, @"Unable to find class %s", "UIApplication");

  __break(1u);
}

void __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke_cold_1_0()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getFBSDisplayLayoutMonitorConfigurationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYNotesActivationObserver.m", 31, @"Unable to find class %s", "FBSDisplayLayoutMonitorConfiguration");

  __break(1u);
}

void FrontBoardServicesLibrary_cold_1_0(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *FrontBoardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYNotesActivationObserver.m", 29, @"%s", *a1);

  __break(1u);
}

void __getFBSDisplayLayoutMonitorClass_block_invoke_cold_1_0()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getFBSDisplayLayoutMonitorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYNotesActivationObserver.m", 30, @"Unable to find class %s", "FBSDisplayLayoutMonitor");

  __break(1u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t CALayerGetContext()
{
  return MEMORY[0x1F40F4BD8]();
}

uint64_t CALayerGetRenderId()
{
  return MEMORY[0x1F40F4BE8]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1F417CE48]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MDItemFetchPrivateAttributesForURL()
{
  return MEMORY[0x1F410DBD8]();
}

uint64_t _MDItemSetPrivateAttributesForURL()
{
  return MEMORY[0x1F410DBE0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
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

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
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

void objc_exception_throw(id exception)
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}