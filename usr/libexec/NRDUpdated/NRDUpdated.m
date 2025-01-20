uint64_t edt_supports_recoveryos(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  char v11;

  if (edt_supports_recoveryos_onceToken != -1) {
    dispatch_once(&edt_supports_recoveryos_onceToken, &__block_literal_global);
  }
  v9 = edt_supports_recoveryos_supports;
  if ((edt_supports_recoveryos_supports & 1) == 0 && a1)
  {
    v9 = 1;
    logfunction((uint64_t)"", 1, @"supports-recoveryos is false, but returning true on internal\n", a4, a5, a6, a7, a8, v11);
  }
  return v9;
}

void __edt_supports_recoveryos_block_invoke(id a1)
{
  io_registry_entry_t v1 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/product");
  if (v1)
  {
    io_object_t v7 = v1;
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v1, @"supports-recoveryos", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFDataRef v14 = CFProperty;
      CFTypeID v15 = CFGetTypeID(CFProperty);
      if (v15 == CFDataGetTypeID())
      {
        BytePtr = CFDataGetBytePtr(v14);
        int64_t Length = CFDataGetLength(v14);
        if (!Length || Length <= 4 && memcmp(BytePtr, &_block_invoke_kZeroBytes, Length)) {
          edt_supports_recoveryos_supports = 1;
        }
        logfunction((uint64_t)"", 1, @"supports-recoveryos is %d in EDT\n", v23, v24, v25, v26, v27, edt_supports_recoveryos_supports);
      }
      else
      {
        logfunction((uint64_t)"", 1, @"Expected supports-recoveryos to be of data type\n", v16, v17, v18, v19, v20, v28);
      }
      CFRelease(v14);
    }
    else
    {
      logfunction((uint64_t)"", 1, @"Did not find supports-recoveryos property for product\n", v9, v10, v11, v12, v13, v28);
    }
    IOObjectRelease(v7);
  }
  else
  {
    logfunction((uint64_t)"", 1, @"Failed to find product entry in EDT\n", v2, v3, v4, v5, v6, v30);
  }
}

void logfunction(uint64_t a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFStringRef v10 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, a3, &a9);
  NSLog(@"%s: %@", a1, v10);
  CFRelease(v10);
}

id nrdSharedLogger()
{
  if (nrdSharedLogger_pred != -1) {
    dispatch_once(&nrdSharedLogger_pred, &__block_literal_global_0);
  }
  v0 = (void *)nrdSharedLogger___instance;

  return v0;
}

void __nrdSharedLogger_block_invoke(id a1)
{
  nrdSharedLogger___instance = (uint64_t)os_log_create("com.apple.MobileSoftwareUpdate", "NRD");

  _objc_release_x1();
}

uint64_t load_trust_cache_at_path(const char *a1, NSError **a2)
{
  char v3 = (char)a1;
  memset(&v66, 0, sizeof(v66));
  io_connect_t connect = 0;
  int v4 = open(a1, 0);
  if (v4 < 0)
  {
    uint64_t v16 = *__error();
    NSErrorUserInfoKey v78 = NSDebugDescriptionErrorKey;
    uint64_t v17 = __error();
    v79 = +[NSString stringWithFormat:@"open() failed: %s", strerror(*v17)];
    v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v16, +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1]);
    uint64_t v18 = __error();
    strerror(*v18);
    logfunction((uint64_t)"", 1, @"Could not open trust cache at path %s: %s.\n", v19, v20, v21, v22, v23, v3);
    CFBooleanRef v24 = (const __CFBoolean *)MGCopyAnswer();
    if (v24 == kCFBooleanFalse
      && (bzero(__s1, 0x400uLL), size_t v64 = 1024, !sysctlbyname("kern.bootargs", __s1, &v64, 0, 0))
      && strstr(__s1, "msu_eng_brain=1"))
    {
      uint64_t v15 = 1;
      logfunction((uint64_t)"", 1, @"System policy for update brain is in effect.\n", v53, v54, v55, v56, v57, outputStructa);
      v8 = 0;
    }
    else
    {
      uint64_t v15 = 0;
    }
    CFRelease(v24);
    goto LABEL_9;
  }
  int v5 = v4;
  if (fstat(v4, &v66))
  {
    uint64_t v6 = *__error();
    NSErrorUserInfoKey v75 = NSDebugDescriptionErrorKey;
    io_object_t v7 = __error();
    v76 = +[NSString stringWithFormat:@"fstat() failed: %s", strerror(*v7)];
    v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v6, +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1]);
    uint64_t v9 = __error();
    char outputStructb = strerror(*v9);
    logfunction((uint64_t)"", 1, @"Could not fstat trust cache: %s\n", v10, v11, v12, v13, v14, outputStructb);
LABEL_4:
    close(v5);
    uint64_t v15 = 0;
    goto LABEL_9;
  }
  uint64_t v26 = mmap(0, v66.st_size, 1, 1026, v5, 0);
  if (v26 == (void *)-1)
  {
    uint64_t v39 = *__error();
    NSErrorUserInfoKey v73 = NSDebugDescriptionErrorKey;
    v40 = __error();
    v74 = +[NSString stringWithFormat:@"mmap() failed: %s", strerror(*v40)];
    v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v39, +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1]);
    v41 = __error();
    strerror(*v41);
    logfunction((uint64_t)"", 1, @"Could not map file %s: %s\n", v42, v43, v44, v45, v46, v3);
    goto LABEL_4;
  }
  uint64_t v27 = v26;
  CFDictionaryRef v28 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v28);
  io_object_t v30 = MatchingService;
  if (!MatchingService)
  {
    NSErrorUserInfoKey v71 = NSDebugDescriptionErrorKey;
    CFStringRef v72 = @"Could not find AppleMobileFileIntegrity service";
    v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 3, +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1]);
    CFStringRef v52 = @"Could not find AppleMobileFileIntegrity service\n";
LABEL_22:
    logfunction((uint64_t)"", 1, v52, v47, v48, v49, v50, v51, outputStruct);
    goto LABEL_23;
  }
  uint64_t v31 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
  if (!v31)
  {
    uint64_t v58 = IOConnectCallMethod(connect, 2u, 0, 0, v27, v66.st_size, 0, 0, 0, 0);
    if (!v58)
    {
      v8 = 0;
      uint64_t v15 = 1;
      goto LABEL_24;
    }
    char v59 = v58;
    uint64_t v60 = (int)v58;
    NSErrorUserInfoKey v67 = NSDebugDescriptionErrorKey;
    v68 = +[NSString stringWithFormat:@"IOConnectCallMethod() failed: 0x%x", v58];
    v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"IOKitErrorDomain", v60, +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1]);
    char outputStruct = v59;
    CFStringRef v52 = @"Unable to load trust cache: 0x%x\n";
    goto LABEL_22;
  }
  char v32 = v31;
  uint64_t v33 = (int)v31;
  NSErrorUserInfoKey v69 = NSDebugDescriptionErrorKey;
  v70 = +[NSString stringWithFormat:@"IOServiceOpen() failed: 0x%x", v31];
  v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"IOKitErrorDomain", v33, +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1]);
  logfunction((uint64_t)"", 1, @"Unable to open user client: 0x%x\n", v34, v35, v36, v37, v38, v32);
LABEL_23:
  uint64_t v15 = 0;
LABEL_24:
  close(v5);
  munmap(v27, v66.st_size);
  if (connect) {
    IOServiceClose(connect);
  }
  if (v30) {
    IOObjectRelease(v30);
  }
LABEL_9:
  if (a2) {
    *a2 = v8;
  }
  return v15;
}

void sub_100004EAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, NSErrorUserInfoKey a10, const __CFString *a11, const __CFString *a12, id a13)
{
  if (a2 == 1)
  {
    id v14 = objc_begin_catch(exception_object);
    a10 = NSDebugDescriptionErrorKey;
    a11 = @"ExceptionDescription";
    a12 = @"Exception invoking NRDUpdateBrain";
    a13 = [v14 description];
    (*(void (**)(uint64_t, NSError *))(v13 + 16))(v13, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NRDUpdateErrorDomain", 113, +[NSDictionary dictionaryWithObjects:&a12 forKeys:&a10 count:2]));
    objc_end_catch();
    JUMPOUT(0x100004E80);
  }
  _Unwind_Resume(exception_object);
}

void sub_100004FEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_100005548(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1000061A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100007CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100009B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_10000C9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  char v3 = nrdSharedLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&buf[4] = "Nov 10 2024";
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = "03:53:41";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting NRDUpdated built %{public}s %{public}s", buf, 0x16u);
  }

  int v4 = dispatch_get_global_queue(21, 0);
  int v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v4);
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __setupSignalHandlers_block_invoke;
  uint64_t v13 = &__block_descriptor_36_e5_v8__0l;
  int v14 = 15;
  dispatch_source_set_event_handler(v5, buf);
  dispatch_resume(v5);
  uint64_t v6 = (void *)setupSignalHandlers_signalSources_0;
  setupSignalHandlers_signalSources_0 = (uint64_t)v5;

  signal(15, (void (__cdecl *)(int))1);
  io_object_t v7 = nrdSharedLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = 15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[SIGNAL_HANDLER] signal handler has been registered for signal: %d", (uint8_t *)v11, 8u);
  }

  v8 = +[NRDUpdateDaemonServerImpl sharedInstance];
  [v8 runUntilExit];

  uint64_t v9 = nrdSharedLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Exiting NRDUpdated", buf, 2u);
  }

  return 0;
}

void __setupSignalHandlers_block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  uint64_t v2 = nrdSharedLogger();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1 == 15)
  {
    if (v3)
    {
      LOWORD(v4[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[SIGNAL_HANDLER] received SIGTERM, exiting", (uint8_t *)v4, 2u);
    }

    exit(1);
  }
  if (v3)
  {
    v4[0] = 67109120;
    v4[1] = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[SIGNAL_HANDLER] unhandled signal: %d (ignored)", (uint8_t *)v4, 8u);
  }
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return _nanosleep(__rqtp, __rmtp);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL protocol_isEqual(Protocol *proto, Protocol *other)
{
  return _protocol_isEqual(proto, other);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

uint64_t xpc_add_bundle()
{
  return _xpc_add_bundle();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__invalidateConnection(void *a1, const char *a2, ...)
{
  return [a1 _invalidateConnection];
}

id objc_msgSend__isAppRefresh(void *a1, const char *a2, ...)
{
  return [a1 _isAppRefresh];
}

id objc_msgSend__run(void *a1, const char *a2, ...)
{
  return [a1 _run];
}

id objc_msgSend_activateMachine(void *a1, const char *a2, ...)
{
  return [a1 activateMachine];
}

id objc_msgSend_allowBackgroundActivity(void *a1, const char *a2, ...)
{
  return [a1 allowBackgroundActivity];
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return [a1 assetId];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_brain(void *a1, const char *a2, ...)
{
  return [a1 brain];
}

id objc_msgSend_brainLoadRequiresUnlock(void *a1, const char *a2, ...)
{
  return [a1 brainLoadRequiresUnlock];
}

id objc_msgSend_cleanBeforeScan(void *a1, const char *a2, ...)
{
  return [a1 cleanBeforeScan];
}

id objc_msgSend_cleanReScanScheduler(void *a1, const char *a2, ...)
{
  return [a1 cleanReScanScheduler];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completedWithError(void *a1, const char *a2, ...)
{
  return [a1 completedWithError];
}

id objc_msgSend_connectToServerIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 connectToServerIfNecessary];
}

id objc_msgSend_connectionInterrupted(void *a1, const char *a2, ...)
{
  return [a1 connectionInterrupted];
}

id objc_msgSend_connectionInvalidated(void *a1, const char *a2, ...)
{
  return [a1 connectionInvalidated];
}

id objc_msgSend_constructSoftwareUpdateMAAssetQuery(void *a1, const char *a2, ...)
{
  return [a1 constructSoftwareUpdateMAAssetQuery];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_core(void *a1, const char *a2, ...)
{
  return [a1 core];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delay(void *a1, const char *a2, ...)
{
  return [a1 delay];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downloadPolicy(void *a1, const char *a2, ...)
{
  return [a1 downloadPolicy];
}

id objc_msgSend_downloadPreflightPolicy(void *a1, const char *a2, ...)
{
  return [a1 downloadPreflightPolicy];
}

id objc_msgSend_enableTransactions(void *a1, const char *a2, ...)
{
  return [a1 enableTransactions];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_findLocalBrainAsset(void *a1, const char *a2, ...)
{
  return [a1 findLocalBrainAsset];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_forceBrainUpdate(void *a1, const char *a2, ...)
{
  return [a1 forceBrainUpdate];
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalUrl];
}

id objc_msgSend_getSchedulerQOS(void *a1, const char *a2, ...)
{
  return [a1 getSchedulerQOS];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return [a1 interval];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isBrainLoaded(void *a1, const char *a2, ...)
{
  return [a1 isBrainLoaded];
}

id objc_msgSend_isPasscodeLocked(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeLocked];
}

id objc_msgSend_isPreregistered(void *a1, const char *a2, ...)
{
  return [a1 isPreregistered];
}

id objc_msgSend_keyBagQueue(void *a1, const char *a2, ...)
{
  return [a1 keyBagQueue];
}

id objc_msgSend_keyBagStateChangedNotifyToken(void *a1, const char *a2, ...)
{
  return [a1 keyBagStateChangedNotifyToken];
}

id objc_msgSend_loadBrainAsset(void *a1, const char *a2, ...)
{
  return [a1 loadBrainAsset];
}

id objc_msgSend_loadBrainPolicy(void *a1, const char *a2, ...)
{
  return [a1 loadBrainPolicy];
}

id objc_msgSend_localBrainAsset(void *a1, const char *a2, ...)
{
  return [a1 localBrainAsset];
}

id objc_msgSend_maControl(void *a1, const char *a2, ...)
{
  return [a1 maControl];
}

id objc_msgSend_needsRelaunchError(void *a1, const char *a2, ...)
{
  return [a1 needsRelaunchError];
}

id objc_msgSend_noteConnectionDropped(void *a1, const char *a2, ...)
{
  return [a1 noteConnectionDropped];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_periodicScheduler(void *a1, const char *a2, ...)
{
  return [a1 periodicScheduler];
}

id objc_msgSend_purgeSync(void *a1, const char *a2, ...)
{
  return [a1 purgeSync];
}

id objc_msgSend_qualityOfService(void *a1, const char *a2, ...)
{
  return [a1 qualityOfService];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_registerUpdatedFSMhandlers(void *a1, const char *a2, ...)
{
  return [a1 registerUpdatedFSMhandlers];
}

id objc_msgSend_repeats(void *a1, const char *a2, ...)
{
  return [a1 repeats];
}

id objc_msgSend_rescanScheduler(void *a1, const char *a2, ...)
{
  return [a1 rescanScheduler];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_runUntilExit(void *a1, const char *a2, ...)
{
  return [a1 runUntilExit];
}

id objc_msgSend_runningBrain(void *a1, const char *a2, ...)
{
  return [a1 runningBrain];
}

id objc_msgSend_scanPolicy(void *a1, const char *a2, ...)
{
  return [a1 scanPolicy];
}

id objc_msgSend_scheduleNRDUpdateBrainPeriodicScan(void *a1, const char *a2, ...)
{
  return [a1 scheduleNRDUpdateBrainPeriodicScan];
}

id objc_msgSend_scheduler(void *a1, const char *a2, ...)
{
  return [a1 scheduler];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldDefer(void *a1, const char *a2, ...)
{
  return [a1 shouldDefer];
}

id objc_msgSend_softwareUpdateDownloadPolicy(void *a1, const char *a2, ...)
{
  return [a1 softwareUpdateDownloadPolicy];
}

id objc_msgSend_softwareUpdateScanPolicy(void *a1, const char *a2, ...)
{
  return [a1 softwareUpdateScanPolicy];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_stateTable(void *a1, const char *a2, ...)
{
  return [a1 stateTable];
}

id objc_msgSend_tolerance(void *a1, const char *a2, ...)
{
  return [a1 tolerance];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateAttempt(void *a1, const char *a2, ...)
{
  return [a1 updateAttempt];
}

id objc_msgSend_updateBrainAsset(void *a1, const char *a2, ...)
{
  return [a1 updateBrainAsset];
}

id objc_msgSend_updateOptions(void *a1, const char *a2, ...)
{
  return [a1 updateOptions];
}

id objc_msgSend_updateQueue(void *a1, const char *a2, ...)
{
  return [a1 updateQueue];
}

id objc_msgSend_updatedFSM(void *a1, const char *a2, ...)
{
  return [a1 updatedFSM];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}