id pre_sv_xpc_handle()
{
  void *v0;
  uint64_t vars8;

  if (pre_sv_xpc_handle__pasOnceToken0 != -1) {
    dispatch_once(&pre_sv_xpc_handle__pasOnceToken0, &__block_literal_global_15);
  }
  v0 = (void *)pre_sv_xpc_handle__pasExprOnceResult;
  return v0;
}

void sub_2355686D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

Class __getSGMultiHeadInferenceClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!CoreSuggestionsMLLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __CoreSuggestionsMLLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_264C5C740;
    uint64_t v8 = 0;
    CoreSuggestionsMLLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreSuggestionsMLLibraryCore_frameworkLibrary)
  {
    v3 = [MEMORY[0x263F08690] currentHandler];
    v4 = [NSString stringWithUTF8String:"void *CoreSuggestionsMLLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PREResponsesServerDelegate.m", 24, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("SGMultiHeadInference");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v3 = [MEMORY[0x263F08690] currentHandler];
    v5 = [NSString stringWithUTF8String:"Class getSGMultiHeadInferenceClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PREResponsesServerDelegate.m", 25, @"Unable to find class %s", "SGMultiHeadInference");

LABEL_10:
    __break(1u);
  }
  getSGMultiHeadInferenceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreSuggestionsMLLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreSuggestionsMLLibraryCore_frameworkLibrary = result;
  return result;
}

id procNameForPid(int a1, int *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  bzero(buffer, 0x400uLL);
  *__error() = 0;
  unsigned int v4 = proc_name(a1, buffer, 0x400u);
  if (a2) {
    *a2 = *__error();
  }
  if ((v4 & 0x80000000) != 0) {
    v5 = 0;
  }
  else {
    v5 = (void *)[[NSString alloc] initWithBytes:buffer length:v4 encoding:4];
  }
  return v5;
}

void sub_2355698AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 160));
  _Unwind_Resume(a1);
}

void __pre_sv_xpc_handle_block_invoke()
{
  v0 = (void *)MEMORY[0x237DE1ED0]();
  os_log_t v1 = os_log_create("com.apple.private.proactive.experiments", "Server XPCClient");
  v2 = (void *)pre_sv_xpc_handle__pasExprOnceResult;
  pre_sv_xpc_handle__pasExprOnceResult = (uint64_t)v1;
}

id pre_sv_responses_handle()
{
  if (pre_sv_responses_handle__pasOnceToken1 != -1) {
    dispatch_once(&pre_sv_responses_handle__pasOnceToken1, &__block_literal_global_4);
  }
  v0 = (void *)pre_sv_responses_handle__pasExprOnceResult;
  return v0;
}

void __pre_sv_responses_handle_block_invoke()
{
  v0 = (void *)MEMORY[0x237DE1ED0]();
  os_log_t v1 = os_log_create("com.apple.private.proactive.experiments", "Server Responses");
  v2 = (void *)pre_sv_responses_handle__pasExprOnceResult;
  pre_sv_responses_handle__pasExprOnceResult = (uint64_t)v1;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD60](*(void *)&pid, buffer, *(void *)&buffersize);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}