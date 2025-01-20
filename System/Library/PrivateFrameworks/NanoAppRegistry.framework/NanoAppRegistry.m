void sub_228C5B2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

void sub_228C5B99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id nar_sync_log()
{
  if (nar_sync_log_onceToken != -1) {
    dispatch_once(&nar_sync_log_onceToken, &__block_literal_global);
  }
  v0 = (void *)nar_sync_log___logger;

  return v0;
}

uint64_t __nar_sync_log_block_invoke()
{
  nar_sync_log___logger = (uint64_t)os_log_create("NanoAppRegistry", "sync");

  return MEMORY[0x270F9A758]();
}

id nar_workspace_log()
{
  if (nar_workspace_log_onceToken != -1) {
    dispatch_once(&nar_workspace_log_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)nar_workspace_log___logger;

  return v0;
}

uint64_t __nar_workspace_log_block_invoke()
{
  nar_workspace_log___logger = (uint64_t)os_log_create("NanoAppRegistry", "workspace");

  return MEMORY[0x270F9A758]();
}

uint64_t NARSyncedInfoPlistKeys()
{
  return objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263EFFB58], *MEMORY[0x263EFFB68], *MEMORY[0x263EFFB70], *MEMORY[0x263EFFA90], *MEMORY[0x263EFFAA8], *MEMORY[0x263EFFAA0], 0);
}

uint64_t NARSyncedLocalizedInfoPlistKeys()
{
  return objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263EFFB68], *MEMORY[0x263EFFA90], *MEMORY[0x263EFFAA0], 0);
}

uint64_t NARSyncediTunesPlistKeys()
{
  return objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"artistName", @"itemName", 0);
}

uint64_t NARWorkspaceServiceInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DD342C8];
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
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