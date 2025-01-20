void MSMediaStreamInitialize()
{
  if (MSMediaStreamInitialize_once != -1) {
    dispatch_once(&MSMediaStreamInitialize_once, &__block_literal_global_231);
  }
}

void __MSMediaStreamInitialize_block_invoke()
{
  v0 = (void *)MEMORY[0x1E01C1600]();
  v1 = +[MSMSPlatform thePlatform];
  MSCoreMediaStreamInitialize();
}

void _notificationCallBack(void *key, uint64_t a2)
{
  CFDictionaryRef Mutable = (const __CFDictionary *)_notificationToInfo_dict;
  if (!_notificationToInfo_dict)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    _notificationToInfo_dict = (uint64_t)Mutable;
  }
  if (CFDictionaryContainsKey(Mutable, key))
  {
    CFDictionaryRef v5 = (const __CFDictionary *)_notificationToInfo_dict;
    if (!_notificationToInfo_dict)
    {
      CFDictionaryRef v5 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      _notificationToInfo_dict = (uint64_t)v5;
    }
    CFDictionaryGetValue(v5, key);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = [v7 owner];
    [v6 _userDidRespondToNotification:key info:v7 responseFlags:a2];
  }
}

void sub_1DD95AD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
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

void sub_1DD95B81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DD95BC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DD95D550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _MSSetDaemon(void *a1)
{
  id v2 = a1;
  if ((id)_theDaemon != v2)
  {
    id v3 = v2;
    objc_storeStrong((id *)&_theDaemon, a1);
    id v2 = v3;
  }
}

id MSMSLocalizedString(void *a1)
{
  uint64_t v1 = MSMSLocalizedString_once;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&MSMSLocalizedString_once, &__block_literal_global_228);
  }
  id v3 = [(id)MSMSLocalizedString_bundle localizedStringForKey:v2 value:v2 table:@"MediaStream"];

  return v3;
}

uint64_t __MSMSLocalizedString_block_invoke()
{
  MSMSLocalizedString_bundle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  return MEMORY[0x1F41817F8]();
}

void *BatteryStateChanged(void *result, uint64_t a2, int a3)
{
  if (a3 == -536723200)
  {
    CFDictionaryRef v5 = result;
    [result updateBatteryLevelWithBatteryEntry:a2];
    return (void *)[v5 updateBatteryConnectedStateWithBatteryEntry:a2];
  }
  return result;
}

id _timerPingQueue()
{
  if (_timerPingQueue_onceToken != -1) {
    dispatch_once(&_timerPingQueue_onceToken, &__block_literal_global_227);
  }
  v0 = (void *)_timerPingQueue_queue;

  return v0;
}

uint64_t ___timerPingQueue_block_invoke()
{
  _timerPingQueue_queue = (uint64_t)dispatch_queue_create("MSASConnection timer ping queue", 0);

  return MEMORY[0x1F41817F8]();
}

void ___initializePlatform_block_invoke()
{
  v0 = +[MSMSPlatform thePlatform];
  MSCoreMediaStreamInitialize();

  if (MSAlbumSharingInitialize_once != -1)
  {
    dispatch_once(&MSAlbumSharingInitialize_once, &__block_literal_global_149);
  }
}

void sub_1DD9663E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD966574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD966680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD966960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD966B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD966DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _throttledIndicatorFilePath()
{
  if (_throttledIndicatorFilePath_onceToken != -1) {
    dispatch_once(&_throttledIndicatorFilePath_onceToken, &__block_literal_global_153);
  }
  v0 = (void *)_throttledIndicatorFilePath_path;

  return v0;
}

uint64_t _availableDiskBlocks()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(&v8, 0, 512);
  MSPathAlbumSharingDir();
  id v0 = objc_claimAutoreleasedReturnValue();
  int v1 = statfs((const char *)[v0 fileSystemRepresentation], &v8);

  if (v1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v4 = __error();
      CFDictionaryRef v5 = strerror(*v4);
      int v6 = 136315138;
      uint64_t v7 = (uint64_t)v5;
      _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot check disk space remaining: %s", (uint8_t *)&v6, 0xCu);
    }
    return 0;
  }
  else
  {
    uint64_t f_bavail = v8.f_bavail;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v6 = 134217984;
      uint64_t v7 = f_bavail;
      _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Checked disk space remaining: %lld blocks.", (uint8_t *)&v6, 0xCu);
    }
  }
  return f_bavail;
}

void ___throttledIndicatorFilePath_block_invoke()
{
  NSTemporaryDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"com.apple.mediastream.mstreamd.disk-throttled"];
  int v1 = (void *)_throttledIndicatorFilePath_path;
  _throttledIndicatorFilePath_path = v0;
}

void _MSASSetDaemon(id obj)
{
}

void MSAlbumSharingInitialize()
{
  if (MSAlbumSharingInitialize_once != -1) {
    dispatch_once(&MSAlbumSharingInitialize_once, &__block_literal_global_149);
  }
}

void __MSAlbumSharingInitialize_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E01C1600]();
  int v1 = +[MSMSPlatform thePlatform];
  MSCoreMediaStreamInitialize();

  id v2 = objc_alloc_init(MSASPlatformImplementation);
  MSASInitialize();
}

void sub_1DD9697D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1DD96B7DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _XPCShouldLog()
{
  uint64_t result = _shouldLogBlock;
  if (_shouldLogBlock) {
    return (*(uint64_t (**)(void))(_shouldLogBlock + 16))();
  }
  return result;
}

void _XPCLog(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  if (_logMessageBlock && _shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
    (*(void (**)(uint64_t, uint64_t, id, uint64_t *))(_logMessageBlock + 16))(_logMessageBlock, a1, v10, &a9);
  }
}

void XPCSetLogBlocks(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x1E01C17F0](a1);
  CFDictionaryRef v5 = (void *)_shouldLogBlock;
  _shouldLogBlock = v4;

  uint64_t v6 = MEMORY[0x1E01C17F0](v3);
  uint64_t v7 = (void *)_logMessageBlock;
  _logMessageBlock = v6;
}

uint64_t _insertMessage(void *a1, void *a2, void *a3, void *a4, size_t *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  if (v10)
  {
    id v43 = 0;
    v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v43];
    id v13 = v43;
    if (!v12)
    {
      if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
        _XPCLog(3, @"Cannot serialize object, error: %@", v28, v29, v30, v31, v32, v33, (uint64_t)v13);
      }

      goto LABEL_23;
    }
    id v14 = v12;
    xpc_dictionary_set_data(v9, "__nsmsg", (const void *)[v14 bytes], objc_msgSend(v14, "length"));
  }
  if (v11)
  {
    size_t v15 = [v11 length];
    v16 = mmap(0, v15, 3, 4099, -1, 0);
    if (v16 != (void *)-1)
    {
      uint64_t v17 = v16;
      memcpy(v16, (const void *)[v11 bytes], v15);
      xpc_object_t v18 = xpc_shmem_create(v17, v15);
      xpc_dictionary_set_value(v9, "__nsdata", v18);
      xpc_dictionary_set_uint64(v9, "__nsdsize", v15);
      if (a4) {
        *a4 = v18;
      }
      if (a5) {
        *a5 = v15;
      }
      if (munmap(v17, v15) && _shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
      {
        v19 = __error();
        v20 = strerror(*v19);
        _XPCLog(3, @"munmap(2) failed. Error: %s", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
      }

      goto LABEL_15;
    }
    if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    {
      v34 = __error();
      v35 = strerror(*v34);
      _XPCLog(3, @"Cannot create mapped memory region. Error: %s", v36, v37, v38, v39, v40, v41, (uint64_t)v35);
    }
LABEL_23:
    uint64_t v27 = 0;
    goto LABEL_24;
  }
LABEL_15:
  uint64_t v27 = 1;
LABEL_24:

  return v27;
}

uint64_t _unpack(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = v5;
  if (!v5)
  {
LABEL_25:
    uint64_t v18 = 1;
    goto LABEL_26;
  }
  if (!a2) {
    goto LABEL_12;
  }
  size_t length = 0;
  data = xpc_dictionary_get_data(v5, "__nsmsg", &length);
  if (!length)
  {
    if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
      _XPCLog(3, @"Could not interpret serialized message.", v19, v20, v21, v22, v23, v24, v45);
    }
    goto LABEL_12;
  }
  statfs v8 = (void *)MEMORY[0x1E4F28DC0];
  id v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
  id v46 = 0;
  id v10 = [v8 MSSafeUnarchiveObjectWithData:v9 outError:&v46];
  id v11 = v46;
  *a2 = v10;

  if (!v11)
  {
LABEL_12:
    if (a3)
    {
      uint64_t v25 = xpc_dictionary_get_value(v6, "__nsdata");
      uint64_t v26 = v25;
      if (v25)
      {
        size_t length = 0;
        size_t v27 = xpc_shmem_map(v25, (void **)&length);
        if (v27)
        {
          size_t v28 = v27;
          uint64_t uint64 = xpc_dictionary_get_uint64(v6, "__nsdsize");
          if (uint64 <= v28)
          {
            *a3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:length length:uint64];
          }
          else if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
          {
            _XPCLog(3, @"Could not unpack message due to invalid size.", v30, v31, v32, v33, v34, v35, v45);
          }
          if (munmap((void *)length, v28) && _shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
          {
            uint64_t v36 = __error();
            uint64_t v37 = strerror(*v36);
            _XPCLog(3, @"munmap(2) failed. Error: %s", v38, v39, v40, v41, v42, v43, (uint64_t)v37);
          }
        }
      }
    }
    goto LABEL_25;
  }
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
    _XPCLog(3, @"Could not interpret serialized message. Error: %@", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
  }

  uint64_t v18 = 0;
LABEL_26:

  return v18;
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

Boolean CFRunLoopContainsSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  return MEMORY[0x1F40D8088](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1F40D8A20](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8A40](allocator, userNotification, callout, order);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40E8F20](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F70](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1F40E9230](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

uint64_t MSASInitialize()
{
  return MEMORY[0x1F4113E88]();
}

uint64_t MSASPlatform()
{
  return MEMORY[0x1F4113E90]();
}

uint64_t MSCoreMediaStreamInitialize()
{
  return MEMORY[0x1F4113E98]();
}

uint64_t MSPathAlbumSharingDir()
{
  return MEMORY[0x1F4113EA0]();
}

uint64_t MSPlatform()
{
  return MEMORY[0x1F4113EA8]();
}

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
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
  return (id)MEMORY[0x1F4181758](location, val);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CF268](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1F40CF278](xshmem, region);
}