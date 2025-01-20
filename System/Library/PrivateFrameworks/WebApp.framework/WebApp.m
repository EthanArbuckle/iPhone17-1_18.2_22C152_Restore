uint64_t WebAppMainEntry(int a1, char **a2)
{
  char __value[1024];
  uint64_t v6;

  v6 = *MEMORY[0x263EF8340];
  getpid();
  if (!sandbox_container_path_for_pid())
  {
    setenv("HOME", __value, 1);
    setenv("CFFIXED_USER_HOME", __value, 1);
    if ((unint64_t)__strlcat_chk() >= 0x400) {
      exit(1);
    }
    setenv("TMPDIR", __value, 1);
  }
  return UIApplicationMain(a1, a2, 0, &cfstr_Appdelegate.isa);
}

id viewServiceLog()
{
  if (viewServiceLog_onceToken != -1) {
    dispatch_once(&viewServiceLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)viewServiceLog_log;

  return v0;
}

uint64_t __viewServiceLog_block_invoke()
{
  viewServiceLog_log = (uint64_t)os_log_create("com.apple.mobilesafari", "ViewService");

  return MEMORY[0x270F9A758]();
}

id getCPSPromiseClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getCPSPromiseClass_softClass;
  uint64_t v7 = getCPSPromiseClass_softClass;
  if (!getCPSPromiseClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCPSPromiseClass_block_invoke;
    v3[3] = &unk_264EA4A50;
    v3[4] = &v4;
    __getCPSPromiseClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23D522FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D5232AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

Class __getCPSPromiseClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!ClipServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __ClipServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264EA4A70;
    uint64_t v5 = 0;
    ClipServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ClipServicesLibraryCore_frameworkLibrary) {
    __getCPSPromiseClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CPSPromise");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCPSPromiseClass_block_invoke_cold_2();
  }
  getCPSPromiseClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ClipServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ClipServicesLibraryCore_frameworkLibrary = result;
  return result;
}

id webClipIdentifierFromLaunchURL(void *a1, void *a2)
{
  id v3 = a2;
  long long v4 = [a1 absoluteString];
  if ([v4 hasPrefix:v3])
  {
    uint64_t v5 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v3, "length"));
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __getCPSPromiseClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *ClipServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WebAppViewController.m", 21, @"%s", *a1);

  __break(1u);
}

void __getCPSPromiseClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getCPSPromiseClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WebAppViewController.m", 22, @"Unable to find class %s", "CPSPromise");

  __break(1u);
  CGRectGetHeight(v2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x270F55148]();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return MEMORY[0x270F55160]();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return MEMORY[0x270F05F88](*(void *)&argc, argv, principalClassName, delegateClassName);
}

uint64_t UIStatusBarStyleFromUIWebClipStatusBarStyle()
{
  return MEMORY[0x270F06290]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x270ED7ED8]();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x270EDB2A8]();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x270EDB3D8](__name, __value, *(void *)&__overwrite);
}