id pbb_mobileasset_log()
{
  void *v0;
  uint64_t vars8;

  if (pbb_mobileasset_log_onceToken != -1) {
    dispatch_once(&pbb_mobileasset_log_onceToken, &__block_literal_global_19);
  }
  v0 = (void *)pbb_mobileasset_log___logger;

  return v0;
}

void sub_23C80C234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __pbb_mobileasset_log_block_invoke()
{
  pbb_mobileasset_log___logger = (uint64_t)os_log_create("com.apple.Bridge", "mobileasset");

  return MEMORY[0x270F9A758]();
}

id pbb_bridge_log()
{
  if (pbb_bridge_log_onceToken != -1) {
    dispatch_once(&pbb_bridge_log_onceToken, &__block_literal_global);
  }
  v0 = (void *)pbb_bridge_log___logger;

  return v0;
}

uint64_t __pbb_bridge_log_block_invoke()
{
  pbb_bridge_log___logger = (uint64_t)os_log_create("com.apple.Bridge", "bridge");

  return MEMORY[0x270F9A758]();
}

id pbb_setup_log()
{
  if (pbb_setup_log_onceToken != -1) {
    dispatch_once(&pbb_setup_log_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)pbb_setup_log___logger;

  return v0;
}

uint64_t __pbb_setup_log_block_invoke()
{
  pbb_setup_log___logger = (uint64_t)os_log_create("com.apple.Bridge", "setup");

  return MEMORY[0x270F9A758]();
}

id pbb_shared_log()
{
  if (pbb_shared_log_onceToken != -1) {
    dispatch_once(&pbb_shared_log_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)pbb_shared_log___logger;

  return v0;
}

uint64_t __pbb_shared_log_block_invoke()
{
  pbb_shared_log___logger = (uint64_t)os_log_create("com.apple.Bridge", "shared");

  return MEMORY[0x270F9A758]();
}

id pbb_activation_log()
{
  if (pbb_activation_log_onceToken != -1) {
    dispatch_once(&pbb_activation_log_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)pbb_activation_log___logger;

  return v0;
}

uint64_t __pbb_activation_log_block_invoke()
{
  pbb_activation_log___logger = (uint64_t)os_log_create("com.apple.Bridge", "activation");

  return MEMORY[0x270F9A758]();
}

id pbb_accountsignin_log()
{
  if (pbb_accountsignin_log_onceToken != -1) {
    dispatch_once(&pbb_accountsignin_log_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)pbb_accountsignin_log___logger;

  return v0;
}

uint64_t __pbb_accountsignin_log_block_invoke()
{
  pbb_accountsignin_log___logger = (uint64_t)os_log_create("com.apple.Bridge", "accountsignin");

  return MEMORY[0x270F9A758]();
}

id pbb_setupflow_log()
{
  if (pbb_setupflow_log_onceToken != -1) {
    dispatch_once(&pbb_setupflow_log_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)pbb_setupflow_log___logger;

  return v0;
}

uint64_t __pbb_setupflow_log_block_invoke()
{
  pbb_setupflow_log___logger = (uint64_t)os_log_create("com.apple.Bridge", "setupflow");

  return MEMORY[0x270F9A758]();
}

id pbb_manualunpairing_log()
{
  if (pbb_manualunpairing_log_onceToken != -1) {
    dispatch_once(&pbb_manualunpairing_log_onceToken, &__block_literal_global_22);
  }
  v0 = (void *)pbb_manualunpairing_log___logger;

  return v0;
}

uint64_t __pbb_manualunpairing_log_block_invoke()
{
  pbb_manualunpairing_log___logger = (uint64_t)os_log_create("com.apple.Bridge", "manualunpairing");

  return MEMORY[0x270F9A758]();
}

id pbb_discover_log()
{
  if (pbb_discover_log_onceToken != -1) {
    dispatch_once(&pbb_discover_log_onceToken, &__block_literal_global_25);
  }
  v0 = (void *)pbb_discover_log___logger;

  return v0;
}

uint64_t __pbb_discover_log_block_invoke()
{
  pbb_discover_log___logger = (uint64_t)os_log_create("com.apple.Bridge", "discover");

  return MEMORY[0x270F9A758]();
}

id pbb_proxcard_log()
{
  if (pbb_proxcard_log_onceToken != -1) {
    dispatch_once(&pbb_proxcard_log_onceToken, &__block_literal_global_28);
  }
  v0 = (void *)pbb_proxcard_log___logger;

  return v0;
}

uint64_t __pbb_proxcard_log_block_invoke()
{
  pbb_proxcard_log___logger = (uint64_t)os_log_create("com.apple.Bridge", "proxcard");

  return MEMORY[0x270F9A758]();
}

id pbb_devicemanagement_log()
{
  if (pbb_devicemanagement_log_onceToken != -1) {
    dispatch_once(&pbb_devicemanagement_log_onceToken, &__block_literal_global_31);
  }
  v0 = (void *)pbb_devicemanagement_log___logger;

  return v0;
}

uint64_t __pbb_devicemanagement_log_block_invoke()
{
  pbb_devicemanagement_log___logger = (uint64_t)os_log_create("com.apple.Bridge", "devicemanagement");

  return MEMORY[0x270F9A758]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void dispatch_resume(dispatch_object_t object)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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