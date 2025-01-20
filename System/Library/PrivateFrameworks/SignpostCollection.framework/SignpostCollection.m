void sub_21DE74224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DE746C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  objc_destroyWeak(v29);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  objc_destroyWeak(v28);
  objc_destroyWeak((id *)(v30 - 88));
  _Unwind_Resume(a1);
}

void _initOSLogEventProxyFields(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_msgSend(v4, "set_machContinuousTimestamp:", objc_msgSend(v3, "machContinuousTimestamp"));
  objc_msgSend(v4, "setProcessID:", objc_msgSend(v3, "processIdentifier"));
  objc_msgSend(v4, "setProcessUniqueID:", objc_msgSend(v3, "creatorProcessUniqueIdentifier"));
  objc_msgSend(v4, "setThreadID:", objc_msgSend(v3, "threadIdentifier"));
  v5 = [v3 processImageUUID];
  [v4 setProcessImageUUID:v5];

  v6 = [v3 processImagePath];
  [v4 setProcessImagePath:v6];

  v7 = [v3 processImagePath];
  v8 = [v7 lastPathComponent];
  [v4 setProcessName:v8];

  v9 = [v3 senderImageUUID];
  [v4 setSenderImageUUID:v9];

  id v10 = [v3 senderImagePath];

  [v4 setSenderImagePath:v10];
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21DE76360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_21DE768A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v28 - 176), 8);
  _Block_object_dispose((const void *)(v28 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_21DE7748C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void ___dateRangeFromLogArchiveSource_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  void *v7 = v9;
}

void sub_21DE77FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, id *location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

void sub_21DE78C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

double SignpostSystemTimebaseRatio()
{
  if (SignpostSystemTimebaseRatio_onceToken != -1) {
    dispatch_once(&SignpostSystemTimebaseRatio_onceToken, &__block_literal_global_0);
  }
  return *(double *)&SignpostSystemTimebaseRatio_timebaseRatio;
}

uint64_t __SignpostSystemTimebaseRatio_block_invoke()
{
  mach_timebase_info info = 0;
  uint64_t result = mach_timebase_info(&info);
  double v1 = 1.0;
  if (info.numer != info.denom) {
    double v1 = (double)info.numer / (double)info.denom;
  }
  SignpostSystemTimebaseRatio_timebaseRatio = *(void *)&v1;
  return result;
}

uint64_t SignpostPlatformForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"macOS"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"iPhoneOS"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"watchOS"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"tvOS"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"bridgeOS"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *StringForSignpostPlatform(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"Unknown";
  }
  else {
    return off_264488138[a1 - 1];
  }
}

uint64_t SignpostPlatformForDevice()
{
  return 2;
}

uint64_t SCWriteLoggingAppleTrace(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = (void *)MEMORY[0x223C1AE00]();
  if (v15)
  {
    uint64_t v17 = [MEMORY[0x263F08A98] predicateWithFormat:v15];
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v21 = 0;
  uint64_t v18 = SCWriteLoggingAppleTraceWithPredicate(v11, v12, v13, v14, v17, &v21);
  id v19 = v21;

  if (!v19 && (v18 & 1) == 0)
  {
    id v19 = [MEMORY[0x263F087E8] errorWithCode:10 description:@"Unknown failure"];
  }
  if (a6) {
    *a6 = v19;
  }

  return v18;
}

uint64_t SCWriteLoggingAppleTraceWithPredicate(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = (void *)MEMORY[0x223C1AE00]();
  if (v12)
  {
    uint64_t v17 = [v12 pathExtension];
    char v18 = [v17 isEqualToString:kSCAppleTraceFileExtension];

    if ((v18 & 1) == 0)
    {
      [NSString stringWithFormat:@"Output path '%@' does not have the required extension (*.%@)", v12, kSCAppleTraceFileExtension];
      goto LABEL_8;
    }
    id v19 = [MEMORY[0x263F08850] defaultManager];
    int v20 = [v19 fileExistsAtPath:v12];

    if (v20)
    {
      [NSString stringWithFormat:@"Output path '%@' already exists", v12, v37];
      v24 = LABEL_8:;
      v23 = [MEMORY[0x263F087E8] errorWithCode:10 description:v24];

      goto LABEL_9;
    }
    if (v13 && v14 && [v13 compare:v14] != -1)
    {
      id v21 = (void *)MEMORY[0x263F087E8];
      v22 = @"'startDate' >= 'endDate";
      goto LABEL_6;
    }
    [v12 UTF8String];
    uint64_t v28 = ktrace_file_create();
    if (!v28)
    {
      v32 = NSString;
      v33 = __error();
      objc_msgSend(v32, "stringWithFormat:", @"Failed to create trace file due to error: %s", strerror(*v33), v37);
      goto LABEL_8;
    }
    uint64_t v26 = v28;
    if (v11)
    {
      v29 = [NSURL fileURLWithPath:v11];
      uint64_t v30 = [MEMORY[0x263F52748] storeWithArchiveURL:v29];
      if (v30)
      {
        uint64_t v31 = v30;

LABEL_28:
        v38 = (void *)v31;
        int appended = ktrace_file_append_log_content_from_store();
        if (appended)
        {
          v35 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to create output logging AppleTrace file due to error: %s", strerror(appended));
          v23 = [MEMORY[0x263F087E8] errorWithCode:10 description:v35];

          uint64_t v25 = 0;
        }
        else
        {
          v23 = 0;
          uint64_t v25 = 1;
        }
        v36 = v38;
        goto LABEL_35;
      }
      v39 = [NSString stringWithFormat:@"Could not read from input log archive '%@'. Confirm that that file exists and that you have sufficient permissions to read it.", v11];
      v23 = [MEMORY[0x263F087E8] errorWithCode:10 description:v39];
    }
    else
    {
      uint64_t v31 = [MEMORY[0x263F52748] localStore];
      if (v31) {
        goto LABEL_28;
      }
      v23 = [MEMORY[0x263F087E8] errorWithCode:10 description:@"Could not read from local store. Confirm that you have the 'com.apple.private.logging.diagnostic' entitlement."];
    }
    v36 = 0;
    uint64_t v25 = 0;
LABEL_35:

    goto LABEL_10;
  }
  id v21 = (void *)MEMORY[0x263F087E8];
  v22 = @"nil output loggingAppleTracePath";
LABEL_6:
  v23 = [v21 errorWithCode:10 description:v22];
LABEL_9:
  uint64_t v25 = 0;
  uint64_t v26 = 0;
LABEL_10:
  if ((v25 & 1) == 0 && !v23)
  {
    v23 = [MEMORY[0x263F087E8] errorWithCode:10 description:@"Unknown failure"];
  }
  if (a6) {
    *a6 = v23;
  }
  if (v26) {
    ktrace_file_close();
  }

  return v25;
}

id _signpostcollection_debug_log()
{
  if (_signpostcollection_debug_log_onceToken != -1) {
    dispatch_once(&_signpostcollection_debug_log_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)_signpostcollection_debug_log_signpost_log;
  return v0;
}

uint64_t ___signpostcollection_debug_log_block_invoke()
{
  _signpostcollection_debug_log_signpost_log = (uint64_t)os_log_create("com.apple.SignpostSupport", "SignpostCollection_Debugging");
  return MEMORY[0x270F9A758]();
}

uint64_t _SignpostSupportMachTimeTranslatorPowerChanged()
{
  return objc_msgSend(MEMORY[0x263F6C598], "_processPowerNotificationOfType:withNotificationID:");
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x270EF3EE0](*(void *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x270EF4000](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x270EF49B0](refcon, thePortRef, callback, notifier);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _SignpostSupportSerializationDataFromObjectArray()
{
  return MEMORY[0x270F638C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

uint64_t ktrace_chunk_map_data()
{
  return MEMORY[0x270F8C4A0]();
}

uint64_t ktrace_chunk_size()
{
  return MEMORY[0x270F8C4A8]();
}

uint64_t ktrace_chunk_tag()
{
  return MEMORY[0x270F8C4B0]();
}

uint64_t ktrace_chunk_unmap_data()
{
  return MEMORY[0x270F8C4B8]();
}

uint64_t ktrace_file_append_log_content_from_store()
{
  return MEMORY[0x270F8C510]();
}

uint64_t ktrace_file_close()
{
  return MEMORY[0x270F8C518]();
}

uint64_t ktrace_file_create()
{
  return MEMORY[0x270F8C520]();
}

uint64_t ktrace_file_iterate()
{
  return MEMORY[0x270F8C530]();
}

uint64_t ktrace_file_open()
{
  return MEMORY[0x270F8C538]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x270EDA170]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}