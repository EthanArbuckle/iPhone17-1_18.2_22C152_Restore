id SidecarPresenterLogSubsystem(os_log_type_t type)
{
  uint64_t v2;
  void *v3;
  uint64_t vars8;

  if (SidecarPresenterLogSubsystem_once != -1) {
    dispatch_once(&SidecarPresenterLogSubsystem_once, &__block_literal_global_157);
  }
  v2 = SidecarPresenterLogSubsystem_subsystem;
  if (os_log_type_enabled((os_log_t)SidecarPresenterLogSubsystem_subsystem, type)) {
    v3 = (void *)v2;
  }
  else {
    v3 = 0;
  }

  return v3;
}

uint64_t __SidecarPresenterLogSubsystem_block_invoke()
{
  SidecarPresenterLogSubsystem_subsystem = (uint64_t)os_log_create("com.apple.sidecar", "presenter");

  return MEMORY[0x270F9A758]();
}

uint64_t SidecarOptOutOfReconnect()
{
  return MEMORY[0x270F638A8]();
}

uint64_t SidecarRegisterServiceProvider()
{
  return MEMORY[0x270F638B0]();
}

uint64_t SidecarServiceProviderReady()
{
  return MEMORY[0x270F638B8]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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