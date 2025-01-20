void sub_2179FC4D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2179FCC50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id psy_log()
{
  if (psy_log_onceToken != -1) {
    dispatch_once(&psy_log_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)psy_log___logger;

  return v0;
}

void sub_2179FCFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_2179FD458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2179FD5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PSYSyncStateProviderXPCInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C802D90];
  v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  v4 = objc_msgSend(v1, "setWithObjects:", v2, v3, objc_opt_class(), 0);
  [v0 setClasses:v4 forSelector:sel_requestDeviceSyncStateEntriesForPairingIDs_completion_ argumentIndex:0 ofReply:0];

  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  [v0 setClasses:v10 forSelector:sel_requestDeviceSyncStateEntriesForPairingIDs_completion_ argumentIndex:0 ofReply:1];

  return v0;
}

id PSYSyncSessionProviderXPCInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C802E50];
  v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_requestActiveSyncSessionWithCompletion_ argumentIndex:1 ofReply:1];

  return v0;
}

uint64_t __psy_log_block_invoke()
{
  psy_log___logger = (uint64_t)os_log_create("com.apple.pairedsync", "framework");

  return MEMORY[0x270F9A758]();
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

uint64_t PSYSyncStateObserverXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7FDA08];
}

__CFString *NSStringfromPSYSyncSessionType(unint64_t a1)
{
  if (a1 > 2) {
    return &stru_26C7F6DA8;
  }
  else {
    return off_2642B3FB0[a1];
  }
}

void sub_217A00E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  objc_destroyWeak((id *)(v13 - 144));
  _Unwind_Resume(a1);
}

void sub_217A013D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_217A03478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id PSYToolInterfaceXPCInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C802DF0];
  v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_getOrderedActivityInfosWithCompletion_ argumentIndex:0 ofReply:1];

  return v0;
}

id PSYErrorForCode(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 - 1;
  if (unint64_t)(a1 - 1) <= 5 && ((0x3Bu >> v2))
  {
    v4 = off_2642B4138[v2];
    uint64_t v7 = *MEMORY[0x263F08320];
    v8[0] = v4;
    uint64_t v3 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    uint64_t v3 = 0;
  }
  v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.pairedsync" code:a1 userInfo:v3];

  return v5;
}

uint64_t PSYSyncSessionObserverXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7FEB60];
}

__CFString *NSStringFromPSYSyncSessionState(unint64_t a1)
{
  if (a1 > 2) {
    return &stru_26C7F6DA8;
  }
  else {
    return off_2642B4260[a1];
  }
}

__CFString *NSStringFromPSYSyncSessionActivityState(unint64_t a1)
{
  if (a1 > 2) {
    return &stru_26C7F6DA8;
  }
  else {
    return off_2642B4260[a1];
  }
}

void sub_217A08E64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromPSYDeviceSyncState(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_2642B4318[a1];
  }
}

id PSYGetClientListDirectory()
{
  v0 = [@"/" stringByAppendingPathComponent:@"System/Library/PairedSyncServices"];
  v1 = [NSURL fileURLWithPath:v0 isDirectory:1];

  return v1;
}

id PSYGetPreferredActivityOrdering()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v1 = [v0 pathForResource:@"job_ordering" ofType:@"plist"];

  uint64_t v2 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v1];
  uint64_t v3 = [MEMORY[0x263F08AC0] propertyListWithData:v2 options:0 format:0 error:0];

  return v3;
}

uint64_t PSYProgressClientXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C802EB0];
}

id PSYProgressServerXPCInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C802F10];
  v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  v4 = objc_msgSend(v1, "setWithObjects:", v2, v3, objc_opt_class(), 0);
  [v0 setClasses:v4 forSelector:sel_getCurrentStateWithCompletion_ argumentIndex:0 ofReply:1];

  return v0;
}

id psd_log()
{
  if (psd_log_onceToken != -1) {
    dispatch_once(&psd_log_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)psd_log___logger;

  return v0;
}

uint64_t __psd_log_block_invoke()
{
  psd_log___logger = (uint64_t)os_log_create("com.apple.pairedsync", "daemon");

  return MEMORY[0x270F9A758]();
}

id psylink_log()
{
  if (psylink_log_onceToken != -1) {
    dispatch_once(&psylink_log_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)psylink_log___logger;

  return v0;
}

uint64_t __psylink_log_block_invoke()
{
  psylink_log___logger = (uint64_t)os_log_create("com.apple.pairedsync", "link");

  return MEMORY[0x270F9A758]();
}

uint64_t PSYConnectionXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C802F70];
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

uint64_t PSYActivityXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7FE198];
}

uint64_t PSYActivityProgressXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C802FD0];
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void NSLog(NSString *format, ...)
{
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

void abort(void)
{
}

uint64_t createStringFromNRLinkSubtype()
{
  return MEMORY[0x270F4DCB0]();
}

uint64_t createStringFromNRLinkType()
{
  return MEMORY[0x270F4DCC0]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
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

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}