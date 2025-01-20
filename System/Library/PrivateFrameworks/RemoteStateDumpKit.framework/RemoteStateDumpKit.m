void sub_2255F876C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCNearbyServiceBrowserClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!MultipeerConnectivityLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __MultipeerConnectivityLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_26471F5A0;
    uint64_t v5 = 0;
    MultipeerConnectivityLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MultipeerConnectivityLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getMCNearbyServiceBrowserClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("MCNearbyServiceBrowser");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getMCNearbyServiceBrowserClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MultipeerConnectivityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MultipeerConnectivityLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_2255F9010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCPeerIDClass_block_invoke(uint64_t a1)
{
  MultipeerConnectivityLibrary();
  Class result = objc_getClass("MCPeerID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMCPeerIDClass_block_invoke_cold_1();
  }
  getMCPeerIDClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void MultipeerConnectivityLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!MultipeerConnectivityLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __MultipeerConnectivityLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26471F628;
    uint64_t v3 = 0;
    MultipeerConnectivityLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!MultipeerConnectivityLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __MultipeerConnectivityLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  MultipeerConnectivityLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getMCSessionClass_block_invoke(uint64_t a1)
{
  MultipeerConnectivityLibrary();
  Class result = objc_getClass("MCSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMCSessionClass_block_invoke_cold_1();
  }
  getMCSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2255FA634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCNearbyServiceAdvertiserClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!MultipeerConnectivityLibraryCore_frameworkLibrary_1)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __MultipeerConnectivityLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_26471F668;
    uint64_t v5 = 0;
    MultipeerConnectivityLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!MultipeerConnectivityLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
LABEL_8:
      __getMCNearbyServiceAdvertiserClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("MCNearbyServiceAdvertiser");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getMCNearbyServiceAdvertiserClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MultipeerConnectivityLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  MultipeerConnectivityLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void __getMCNearbyServiceBrowserClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMCPeerIDClass_block_invoke_cold_1(v0);
}

void __getMCPeerIDClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMCSessionClass_block_invoke_cold_1(v0);
}

void __getMCSessionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMCNearbyServiceAdvertiserClass_block_invoke_cold_1(v0);
}

void __getMCNearbyServiceAdvertiserClass_block_invoke_cold_1()
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

void free(void *a1)
{
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

void objc_destroyWeak(id *location)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}