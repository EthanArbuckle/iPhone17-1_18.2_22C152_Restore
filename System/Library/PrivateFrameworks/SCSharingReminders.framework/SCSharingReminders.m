void sub_25B6558CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  __destructor_8_s8_s16_s24((uint64_t)va);
  _Unwind_Resume(a1);
}

id __copy_constructor_8_8_t0w1_s8_s16_s24(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(id *)(a2 + 8);
  *(void *)(a1 + 16) = *(id *)(a2 + 16);
  id result = *(id *)(a2 + 24);
  *(void *)(a1 + 24) = result;
  return result;
}

void __destructor_8_s8_s16_s24(uint64_t a1)
{
  v2 = *(void **)(a1 + 24);
}

void sub_25B655AB4(_Unwind_Exception *a1)
{
  __destructor_8_s8_s16_s24(v1);
  _Unwind_Resume(a1);
}

void sub_25B655BA8(_Unwind_Exception *a1)
{
  __destructor_8_s8_s16_s24(v1);
  _Unwind_Resume(a1);
}

void sub_25B657960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25B657BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25B657F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25B658570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25B6589A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25B6597EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25B659C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25B659EE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25B65A34C(_Unwind_Exception *a1)
{
  __destructor_8_s8_s16_s24(v1);
  __destructor_8_s8_s16_s24(v2 - 112);
  _Unwind_Resume(a1);
}

void sub_25B65A47C(_Unwind_Exception *a1)
{
  __destructor_8_s8_s16_s24(v1);
  _Unwind_Resume(a1);
}

void sub_25B65A8C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 112));
  __destructor_8_s8_s16_s24(v10 + 32);
  _Unwind_Resume(a1);
}

id __copy_helper_block_e8_48n29_8_8_t0w32_S_t32w1_s40_s48_s56(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v2;
  return __copy_constructor_8_8_t0w1_s8_s16_s24(a1 + 80, a2 + 80);
}

void __destroy_helper_block_e8_48n15_8_S_s40_s48_s56(uint64_t a1)
{
}

void sub_25B65B258(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

void sub_25B65B29C()
{
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1, uint64_t a2)
{
  return a2;
}

id SCLogger()
{
  if (SCLogger_onceToken != -1) {
    dispatch_once(&SCLogger_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)SCLogger_log;
  return v0;
}

uint64_t __SCLogger_block_invoke()
{
  SCLogger_log = (uint64_t)os_log_create("com.apple.safetycheckd", "SCLogger");
  return MEMORY[0x270F9A758]();
}

double configWithGlobalDefaults@<D0>(_OWORD *a1@<X8>)
{
  *(void *)&double result = 3;
  *a1 = xmmword_25B6641F8;
  a1[1] = unk_25B664208;
  return result;
}

uint64_t sharingRemindersStatusToString(uint64_t a1)
{
  v25[16] = *MEMORY[0x263EF8340];
  v25[0] = @"Feature flags:";
  long long v2 = NSString;
  if (_os_feature_enabled_impl()) {
    v3 = "Yes";
  }
  else {
    v3 = "No";
  }
  v24 = objc_msgSend(v2, "stringWithFormat:", @"  %-42s %s", "WiFi Sync Feature Flag:", v3);
  v25[1] = v24;
  uint64_t v4 = NSString;
  if (_os_feature_enabled_impl()) {
    v5 = "Yes";
  }
  else {
    v5 = "No";
  }
  v23 = objc_msgSend(v4, "stringWithFormat:", @"  %-42s %s", "General Reminder Feature Flag:", v5);
  v25[2] = v23;
  v25[3] = @"\n";
  v25[4] = @"Sharing Reminders Status:";
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"  %-42s %hhu", "Consecutive notification count:", *(unsigned __int8 *)(a1 + 32));
  v25[5] = v22;
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"  %-42s %llu", "Maximum notification count before opt out:", *(void *)a1);
  v25[6] = v21;
  uint64_t v6 = NSString;
  v20 = [MEMORY[0x263F08790] localizedStringFromDate:*(void *)(a1 + 40) dateStyle:1 timeStyle:1];
  v7 = [v6 stringWithFormat:@"  %-42s %@", "Last fired date:", v20];
  v25[7] = v7;
  v8 = [NSString stringWithFormat:@"  %-42s %@", "Scheduled sharing reminders:", *(void *)(a1 + 48)];
  v25[8] = v8;
  uint64_t v9 = NSString;
  uint64_t v10 = [*(id *)(a1 + 56) valueForKey:@"com.apple.safetycheckd.wifi"];
  v11 = [v9 stringWithFormat:@"  %-42s %@", "Non-actionable identifiers (Wifi Sync):", v10];
  v25[9] = v11;
  v25[10] = @"\n";
  v25[11] = @"Delays:";
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"  %-42s %llu", "Time interval (backstop):", *(void *)(a1 + 8));
  v25[12] = v12;
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"  %-42s %llu", "Time interval (general):", *(void *)(a1 + 16));
  v25[13] = v13;
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"  %-42s %llu", "Time interval (short):", *(void *)(a1 + 24));
  v25[14] = v14;
  v25[15] = @"\n";
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:16];
  v16 = [v15 componentsJoinedByString:@"\n"];

  id v17 = v16;
  uint64_t v18 = [v17 UTF8String];

  __destructor_8_s8_s16_s24(a1 + 32);
  return v18;
}

void sub_25B65BF0C(_Unwind_Exception *exception_object)
{
}

uint64_t localizedDateStringFromUTC(uint64_t a1)
{
  return [MEMORY[0x263F08790] localizedStringFromDate:a1 dateStyle:1 timeStyle:1];
}

void sub_25B65C3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  __destructor_8_s8_s16_s24((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_25B65CEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B65D580(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id SCUIBundle()
{
  if (SCUIBundle_onceToken != -1) {
    dispatch_once(&SCUIBundle_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)SCUIBundle__Bundle;
  return v0;
}

uint64_t __SCUIBundle_block_invoke()
{
  SCUIBundle__Bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

id SCUILocStringForKey(void *a1)
{
  id v1 = a1;
  uint64_t v2 = SCUIBundle();
  v3 = [v2 localizedStringForKey:v1 value:v1 table:@"Localizable"];

  return v3;
}

__CFString *storeKeyToString(unint64_t a1)
{
  if (a1 < 4) {
    return off_265497148[a1];
  }
  v3 = SCLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    storeKeyToString_cold_1(a1, v3);
  }

  return 0;
}

void sub_25B66007C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void storeKeyToString_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25B654000, a2, OS_LOG_TYPE_ERROR, "\"Cannot cast to string, unsupported key value: %ld\"", (uint8_t *)&v2, 0xCu);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

uint64_t lockdown_copy_wireless_connections_list()
{
  return MEMORY[0x270F99B40]();
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

void objc_enumerationMutation(id obj)
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD60](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

uint64_t xpc_set_event()
{
  return MEMORY[0x270EDC398]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}