void SDLogInitIfNeeded()
{
  if (SDLogInitIfNeeded_once != -1) {
    dispatch_once(&SDLogInitIfNeeded_once, &__block_literal_global);
  }
}

void __SDLogInitIfNeeded_block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  NSLog(&cfstr_InitializingSp.isa);
  os_log_t v0 = os_log_create((const char *)SDLoggingSubsystem, (const char *)kSDLoggingContextFramework);
  v1 = (void *)SDLogContextFacilityLocalSRBridge;
  SDLogContextFacilityLocalSRBridge = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  v3 = (void *)_dateFormatter;
  _dateFormatter = (uint64_t)v2;

  v4 = (void *)_dateFormatter;
  v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v5];

  [(id)_dateFormatter setDateFormat:@"yyyyMMdd-HHmmss"];
  v6 = SDLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)SDLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "SDLogInitIfNeeded_block_invoke";
    _os_log_impl(&dword_21E886000, v6, OS_LOG_TYPE_DEFAULT, "%s ::: SpeechDetector logging initialized", (uint8_t *)&v7, 0xCu);
  }
}

uint64_t CVAFaceTrackingCopySemantics()
{
  return MEMORY[0x270F0CED8]();
}

void NSLog(NSString *format, ...)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void objc_destroyWeak(id *location)
{
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