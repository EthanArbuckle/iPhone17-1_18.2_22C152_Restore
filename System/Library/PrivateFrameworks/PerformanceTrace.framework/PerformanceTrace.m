uint64_t traceConfigTemplateForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ([v1 isEqualToString:@"PTTraceConfigTraceTemplateDefault"])
  {
    v2 = 1;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceTemplateFull"])
  {
    v2 = 2;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceTemplateProfile"])
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t traceTypeForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PTTraceConfigTraceTypeContinuouslyWriteToDisk"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceTypeRingBuffer"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t traceGroupForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PTTraceConfigTraceGroupFullTracePoints"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupProfileTracePoints"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupCallstackSamples"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupSystemCallSamples"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupVMFaultSamples"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupGPU"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupASP"])
  {
    uint64_t v2 = 7;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_21EF02C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_21EF02E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21EF03060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
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

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD60](*(void *)&pid, buffer, *(void *)&buffersize);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x270EDB7C8](*(void *)&a1);
}