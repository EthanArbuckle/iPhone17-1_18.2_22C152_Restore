void sub_1DBFFFAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1DC007CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
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

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id OSAStabilityMonitorLogDomain()
{
  if (OSAStabilityMonitorLogDomain_onceToken != -1) {
    dispatch_once(&OSAStabilityMonitorLogDomain_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)OSAStabilityMonitorLogDomain_domain;
  return v0;
}

uint64_t __OSAStabilityMonitorLogDomain_block_invoke()
{
  OSAStabilityMonitorLogDomain_domain = (uint64_t)os_log_create("com.apple.osanalytics.monitors", "stability");
  return MEMORY[0x1F41817F8]();
}

id OSAStabilityMonitorLoadParameters()
{
  if (objc_opt_class())
  {
    v0 = [MEMORY[0x1E4FB00A0] clientWithIdentifier:295];
    v1 = [v0 levelForFactor:@"parameters" withNamespaceName:@"OS_ANALYTICS_STABILITY_MONITOR"];
    v2 = (void *)MEMORY[0x1E4F1C9B8];
    v3 = [v1 fileValue];
    v4 = [v3 path];
    v5 = [v2 dataWithContentsOfFile:v4];

    if (v5)
    {
      id v10 = 0;
      v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v10];
      v7 = v10;
      if (!v6)
      {
        v8 = OSAStabilityMonitorLogDomain();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          OSAStabilityMonitorLoadParameters_cold_3();
        }
      }
    }
    else
    {
      v7 = OSAStabilityMonitorLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        OSAStabilityMonitorLoadParameters_cold_2();
      }
      v6 = 0;
    }
  }
  else
  {
    v0 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      OSAStabilityMonitorLoadParameters_cold_1();
    }
    v6 = 0;
  }

  return v6;
}

void OSAStabilityMonitorEvaluateStabilityForBundleID(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = a3;
  id v10 = a4;
  if (v7)
  {
    OSAnalyticsHelperServiceConnection();
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = OSAStabilityMonitorLoadParameters();
      if (v12)
      {
        v13 = ns2xpc();
        BOOL v14 = v13 != 0;
        if (v13)
        {
          empty = xpc_dictionary_create_empty();
          xpc_dictionary_set_uint64(empty, "operation", 8uLL);
          xpc_dictionary_set_string(empty, "stability_bundleID", (const char *)[v7 UTF8String]);
          xpc_dictionary_set_value(empty, "stability_parameters", v13);
          if (v8) {
            xpc_dictionary_set_string(empty, "stability_coalitionName", (const char *)[v8 UTF8String]);
          }
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke;
          handler[3] = &unk_1E6C29B10;
          id v17 = v10;
          xpc_connection_send_message_with_reply(v11, empty, v9, handler);
        }
        else
        {
          empty = OSAStabilityMonitorLogDomain();
          if (os_log_type_enabled(empty, OS_LOG_TYPE_ERROR)) {
            OSAStabilityMonitorEvaluateStabilityForBundleID_cold_4();
          }
        }
      }
      else
      {
        v13 = OSAStabilityMonitorLogDomain();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          OSAStabilityMonitorEvaluateStabilityForBundleID_cold_3();
        }
        BOOL v14 = 0;
      }
    }
    else
    {
      v12 = OSAStabilityMonitorLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        OSAStabilityMonitorEvaluateStabilityForBundleID_cold_2();
      }
      BOOL v14 = 0;
    }
  }
  else
  {
    OSAStabilityMonitorLogDomain();
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      OSAStabilityMonitorEvaluateStabilityForBundleID_cold_1();
    }
    BOOL v14 = 0;
  }

  if (v10 && !v14) {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1E0197DA0]() == MEMORY[0x1E4F14590])
  {
    if (xpc_dictionary_get_BOOL(v3, "result"))
    {
      BOOL v6 = xpc_dictionary_get_BOOL(v3, "stability_result");
      goto LABEL_12;
    }
    xpc_dictionary_get_string(v3, "error_desc");
    id v7 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_2();
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0197CE0](v3);
    v5 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_3();
    }

    if (v4) {
      free(v4);
    }
  }
  BOOL v6 = 0;
LABEL_12:
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v6);
  }
  else
  {
    uint64_t v9 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_1();
    }
  }
}

void OSAStabilityMonitorLoadParameters_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DBFFE000, v0, v1, "Trial is not available on this platform.", v2, v3, v4, v5, v6);
}

void OSAStabilityMonitorLoadParameters_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DBFFE000, v0, v1, "Parameters file not available.", v2, v3, v4, v5, v6);
}

void OSAStabilityMonitorLoadParameters_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DBFFE000, v0, v1, "Error loading parameters: %{public}@", v2, v3, v4, v5, v6);
}

void OSAStabilityMonitorEvaluateStabilityForBundleID_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DBFFE000, v0, v1, "A bundle ID is required to evaluate the stability of a single process.", v2, v3, v4, v5, v6);
}

void OSAStabilityMonitorEvaluateStabilityForBundleID_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DBFFE000, v0, v1, "Error establishing connection to osanalyticshelper.", v2, v3, v4, v5, v6);
}

void OSAStabilityMonitorEvaluateStabilityForBundleID_cold_3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DBFFE000, v0, v1, "Error loading parameters from Trial.", v2, v3, v4, v5, v6);
}

void OSAStabilityMonitorEvaluateStabilityForBundleID_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DBFFE000, v0, v1, "Error converting parameters to an XPC object: %{public}@", v2, v3, v4, v5, v6);
}

void __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DBFFE000, v0, v1, "Missing expected completion handler.", v2, v3, v4, v5, v6);
}

void __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DBFFE000, v0, v1, "Error triggering targeted stability monitor: %{public}s.", v2, v3, v4, v5, v6);
}

void __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DBFFE000, v0, v1, "Received error from XPC request to run stability monitor: %{public}s", v2, v3, v4, v5, v6);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x1F4122BC8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t OSAIsDebugEnabledForRSD()
{
  return MEMORY[0x1F4139E60]();
}

uint64_t OSAIsRSDDevice()
{
  return MEMORY[0x1F4139E68]();
}

uint64_t OSAIsRSDDisplay()
{
  return MEMORY[0x1F4139E70]();
}

uint64_t OSAIsRSDHost()
{
  return MEMORY[0x1F4139E78]();
}

uint64_t OSANSDateFormat()
{
  return MEMORY[0x1F4139E80]();
}

uint64_t OSASafeOpenWriteOnly()
{
  return MEMORY[0x1F4139E88]();
}

uint64_t OSAnalyticsHelperServiceConnection()
{
  return MEMORY[0x1F4139E90]();
}

uint64_t SecCMSVerifyCopyDataAndAttributes()
{
  return MEMORY[0x1F40F6A98]();
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x1F40F7028]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1F40F7210](trust, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
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

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BF0](strm, *(void *)&level, version, *(void *)&stream_size);
}

int deflateReset(z_streamp strm)
{
  return MEMORY[0x1F4182C08](strm);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
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
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

int feof(FILE *a1)
{
  return MEMORY[0x1F40CC098](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1F40CC0A0](a1);
}

FILE *__cdecl fmemopen(void *__buf, size_t __size, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC198](__buf, __size, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1F40CCE08](a1);
}

uint64_t ns2xpc()
{
  return MEMORY[0x1F4139EA8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

uint64_t remote_device_browser_cancel()
{
  return MEMORY[0x1F4149670]();
}

uint64_t remote_device_copy_device_with_uuid()
{
  return MEMORY[0x1F4149698]();
}

uint64_t remote_device_copy_property()
{
  return MEMORY[0x1F41496B8]();
}

uint64_t remote_device_copy_service()
{
  return MEMORY[0x1F41496C0]();
}

uint64_t remote_device_copy_unique_of_type()
{
  return MEMORY[0x1F41496D8]();
}

uint64_t remote_device_copy_uuid()
{
  return MEMORY[0x1F41496E8]();
}

uint64_t remote_device_get_name()
{
  return MEMORY[0x1F4149700]();
}

uint64_t remote_device_get_state()
{
  return MEMORY[0x1F4149710]();
}

uint64_t remote_device_get_type()
{
  return MEMORY[0x1F4149720]();
}

uint64_t remote_device_set_connected_callback()
{
  return MEMORY[0x1F4149748]();
}

uint64_t remote_device_set_disconnected_callback()
{
  return MEMORY[0x1F4149750]();
}

uint64_t remote_device_start_browsing()
{
  return MEMORY[0x1F4149768]();
}

uint64_t remote_device_state_get_description()
{
  return MEMORY[0x1F4149778]();
}

uint64_t remote_device_type_get_description()
{
  return MEMORY[0x1F4149788]();
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CE168](__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CE658](uu);
}

uint64_t xpc2ns()
{
  return MEMORY[0x1F4139EB8]();
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1F40CEF20]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_file_transfer_create_with_path()
{
  return MEMORY[0x1F40CF0E8]();
}

uint64_t xpc_file_transfer_write_to_fd()
{
  return MEMORY[0x1F40CF120]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_remote_connection_activate()
{
  return MEMORY[0x1F41497E8]();
}

uint64_t xpc_remote_connection_cancel()
{
  return MEMORY[0x1F4149800]();
}

uint64_t xpc_remote_connection_create_remote_service_listener()
{
  return MEMORY[0x1F4149810]();
}

uint64_t xpc_remote_connection_create_with_remote_service()
{
  return MEMORY[0x1F4149830]();
}

uint64_t xpc_remote_connection_send_message()
{
  return MEMORY[0x1F4149860]();
}

uint64_t xpc_remote_connection_send_message_with_reply()
{
  return MEMORY[0x1F4149868]();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return MEMORY[0x1F4149880]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}