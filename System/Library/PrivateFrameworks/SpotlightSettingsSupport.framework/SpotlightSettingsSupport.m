void sub_25E3A0260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSPGetDisabledBundleSetSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)SearchLibrary();
  result = dlsym(v2, "SPGetDisabledBundleSet");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSPGetDisabledBundleSetSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SearchLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SearchLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __SearchLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_265525000;
    uint64_t v5 = 0;
    SearchLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = SearchLibraryCore_frameworkLibrary;
  v1 = (void *)v3[0];
  if (!SearchLibraryCore_frameworkLibrary)
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

uint64_t __SearchLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SearchLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getSPGetDisabledAppSetSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)SearchLibrary();
  uint64_t result = dlsym(v2, "SPGetDisabledAppSet");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSPGetDisabledAppSetSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_25E3A0B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25E3A149C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_25E3A19C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void *__getSPGetDisabledBundleSetSymbolLoc_block_invoke_0(uint64_t a1)
{
  v2 = (void *)SearchLibrary_0();
  uint64_t result = dlsym(v2, "SPGetDisabledBundleSet");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSPGetDisabledBundleSetSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SearchLibrary_0()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SearchLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __SearchLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2655250D8;
    uint64_t v5 = 0;
    SearchLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = SearchLibraryCore_frameworkLibrary_0;
  v1 = (void *)v3[0];
  if (!SearchLibraryCore_frameworkLibrary_0)
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

uint64_t __SearchLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SearchLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getSPGetDisabledAppSetSymbolLoc_block_invoke_0(uint64_t a1)
{
  v2 = (void *)SearchLibrary_0();
  uint64_t result = dlsym(v2, "SPGetDisabledAppSet");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSPGetDisabledAppSetSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_25E3A3808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void *__getSPGetDisabledBundleSetSymbolLoc_block_invoke_1(uint64_t a1)
{
  v2 = (void *)SearchLibrary_1();
  uint64_t result = dlsym(v2, "SPGetDisabledBundleSet");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSPGetDisabledBundleSetSymbolLoc_ptr_1 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SearchLibrary_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SearchLibraryCore_frameworkLibrary_1)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __SearchLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2655251C8;
    uint64_t v5 = 0;
    SearchLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = SearchLibraryCore_frameworkLibrary_1;
  v1 = (void *)v3[0];
  if (!SearchLibraryCore_frameworkLibrary_1)
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

uint64_t __SearchLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  SearchLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getSPGetDisabledDomainSetSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)SearchLibrary_1();
  uint64_t result = dlsym(v2, "SPGetDisabledDomainSet");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSPGetDisabledDomainSetSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __SpringBoardServicesLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2655251E0;
    uint64_t v7 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
    if (SpringBoardServicesLibraryCore_frameworkLibrary)
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
  v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "SBSCopyDisplayIdentifiers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBSCopyDisplayIdentifiersSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void SpotlightSettingsInitLogging()
{
  if (SpotlightSettingsInitLogging_once != -1) {
    dispatch_once(&SpotlightSettingsInitLogging_once, &__block_literal_global_0);
  }
}

uint64_t __SpotlightSettingsInitLogging_block_invoke()
{
  spotlightSettingsLogHandles = (uint64_t)os_log_create("com.apple.SpotlightSettings", "General");
  return MEMORY[0x270F9A758]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

uint64_t PSApplicationSpecifierForAssistantSection()
{
  return MEMORY[0x270F551C8]();
}

uint64_t PSTableSectionFooterBottomPad()
{
  return MEMORY[0x270F55318]();
}

uint64_t PSTextViewInsets()
{
  return MEMORY[0x270F55328]();
}

uint64_t SpecifiersFromPlist()
{
  return MEMORY[0x270F55398]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}