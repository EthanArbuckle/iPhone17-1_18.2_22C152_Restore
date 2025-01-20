id aluManagerLogHandle()
{
  void *v0;
  uint64_t vars8;

  if (aluManagerLogHandle_aluManagerHandlePred != -1) {
    dispatch_once(&aluManagerLogHandle_aluManagerHandlePred, &__block_literal_global);
  }
  v0 = (void *)aluManagerLogHandle_aluManagerHandle;
  return v0;
}

uint64_t __aluManagerLogHandle_block_invoke()
{
  aluManagerLogHandle_aluManagerHandle = (uint64_t)os_log_create("com.apple.symptomsframework", "alumanager");
  return MEMORY[0x270F9A758]();
}

id connManagerLogHandle()
{
  if (connManagerLogHandle_connManagerHandlePred != -1) {
    dispatch_once(&connManagerLogHandle_connManagerHandlePred, &__block_literal_global_4);
  }
  v0 = (void *)connManagerLogHandle_connManagerHandle;
  return v0;
}

uint64_t __connManagerLogHandle_block_invoke()
{
  connManagerLogHandle_connManagerHandle = (uint64_t)os_log_create("com.apple.symptomsframework", "connmanager");
  return MEMORY[0x270F9A758]();
}

id nwActReporterLogHandle()
{
  if (nwActReporterLogHandle_nwActReporterHandlePred != -1) {
    dispatch_once(&nwActReporterLogHandle_nwActReporterHandlePred, &__block_literal_global_7);
  }
  v0 = (void *)nwActReporterLogHandle_nwActReporterLogHandle;
  return v0;
}

uint64_t __nwActReporterLogHandle_block_invoke()
{
  nwActReporterLogHandle_nwActReporterLogHandle = (uint64_t)os_log_create("com.apple.symptomsframework", "nwactreporter");
  return MEMORY[0x270F9A758]();
}

void sub_25E6CE248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *ALULinkAdvisoryToString()
{
  return @"None";
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}