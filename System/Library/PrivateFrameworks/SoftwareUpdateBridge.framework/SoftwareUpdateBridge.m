uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_23C27D104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SUBLoggingInit()
{
  if (SUBLoggingInit_onceToken != -1) {
    dispatch_once(&SUBLoggingInit_onceToken, &__block_literal_global);
  }
}

uint64_t __SUBLoggingInit_block_invoke()
{
  softwareupdatebridge_log = (uint64_t)os_log_create("com.apple.subridge", "Logging");
  return MEMORY[0x270F9A758]();
}

void SUBIPCEncodeObject(void *a1, const char *a2, void *a3)
{
  if (a1 && a2 && a3)
  {
    v5 = (objc_class *)MEMORY[0x263F08910];
    id v6 = a3;
    id v7 = a1;
    id v11 = (id)[[v5 alloc] initRequiringSecureCoding:1];
    [v11 encodeObject:v6 forKey:*MEMORY[0x263F081D0]];

    [v11 finishEncoding];
    id v8 = [v11 encodedData];
    v9 = (const void *)[v8 bytes];
    v10 = [v11 encodedData];
    xpc_dictionary_set_data(v7, a2, v9, [v10 length]);
  }
}

id SUBIPCDecodeObjectForKey(void *a1, const char *a2, uint64_t a3)
{
  data = 0;
  if (a1)
  {
    if (a2)
    {
      size_t length = 0;
      data = (void *)xpc_dictionary_get_data(a1, a2, &length);
      if (data)
      {
        id v5 = objc_alloc(MEMORY[0x263F08928]);
        id v6 = [MEMORY[0x263EFF8F8] dataWithBytes:data length:length];
        id v7 = (void *)[v5 initForReadingFromData:v6 error:0];

        data = [v7 decodeObjectOfClass:a3 forKey:*MEMORY[0x263F081D0]];
        [v7 finishDecoding];
      }
    }
  }
  return data;
}

id SUBIPCDecodeObjectsForKey(void *a1, const char *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  data = 0;
  if (a1)
  {
    if (a2)
    {
      size_t length = 0;
      data = (void *)xpc_dictionary_get_data(a1, a2, &length);
      if (data)
      {
        id v7 = objc_alloc(MEMORY[0x263F08928]);
        id v8 = [MEMORY[0x263EFF8F8] dataWithBytes:data length:length];
        v9 = (void *)[v7 initForReadingFromData:v8 error:0];

        uint64_t v10 = *MEMORY[0x263F081D0];
        id v14 = 0;
        data = [v9 decodeTopLevelObjectOfClasses:v5 forKey:v10 error:&v14];
        id v11 = v14;
        [v9 finishDecoding];
        if (v11)
        {
          v12 = softwareupdatebridge_log;
          if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v17 = a2;
            __int16 v18 = 2112;
            id v19 = v11;
            _os_log_impl(&dword_23C27B000, v12, OS_LOG_TYPE_DEFAULT, "Error decoding %s: %@", buf, 0x16u);
          }
        }
      }
    }
  }

  return data;
}

BOOL SUBIPCClientIsEntitled()
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  xpc_connection_get_audit_token();
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  memset(&token, 0, sizeof(token));
  v1 = SecTaskCreateWithAuditToken(v0, &token);
  if (v1)
  {
    v2 = v1;
    CFErrorRef error = 0;
    CFBooleanRef v3 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, @"com.apple.private.allow-subridge", &error);
    CFErrorRef v4 = error;
    if (v3)
    {
      CFBooleanRef v5 = v3;
      CFTypeID v6 = CFGetTypeID(v3);
      if (v6 == CFBooleanGetTypeID())
      {
        BOOL v7 = CFBooleanGetValue(v5) != 0;
      }
      else
      {
        v13 = softwareupdatebridge_log;
        BOOL v7 = 0;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(token.val[0]) = 0;
          _os_log_impl(&dword_23C27B000, v13, OS_LOG_TYPE_DEFAULT, "entitlement has wrong type", (uint8_t *)&token, 2u);
          BOOL v7 = 0;
        }
      }
      CFRelease(v2);
      goto LABEL_16;
    }
    uint64_t v8 = softwareupdatebridge_log;
    BOOL v9 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v9)
      {
        token.val[0] = 138543362;
        *(void *)&token.val[1] = v4;
        uint64_t v10 = "unable to look up client entitlement: %{public}@";
        id v11 = v8;
        uint32_t v12 = 12;
LABEL_14:
        _os_log_impl(&dword_23C27B000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&token, v12);
      }
    }
    else if (v9)
    {
      LOWORD(token.val[0]) = 0;
      uint64_t v10 = "client is not entitled";
      id v11 = v8;
      uint32_t v12 = 2;
      goto LABEL_14;
    }
    BOOL v7 = 0;
    CFBooleanRef v5 = v2;
LABEL_16:
    CFRelease(v5);

    return v7;
  }
  return 0;
}

id SUBIPCDictionaryToXPC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  CFBooleanRef v5 = v4;
  if (v4) {
    xpc_object_t v6 = v4;
  }
  else {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __SUBIPCDictionaryToXPC_block_invoke;
  v9[3] = &unk_264E3C0D8;
  id v7 = v6;
  id v10 = v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void __SUBIPCDictionaryToXPC_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_object_t v9 = xpc_string_create((const char *)[v8 UTF8String]);
LABEL_7:
    id v11 = v9;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    xpc_object_t v9 = xpc_data_create((const void *)[v10 bytes], objc_msgSend(v10, "length"));
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_object_t v9 = xpc_int64_create([v8 integerValue]);
    goto LABEL_7;
  }
  id v11 = 0;
LABEL_8:
  uint32_t v12 = *(void **)(a1 + 32);
  id v13 = v7;
  xpc_dictionary_set_value(v12, (const char *)[v13 UTF8String], v11);
  *a4 = 0;
}

id SUBIPCXPCToDictionary(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1 && MEMORY[0x23ECDFBB0](v1) == MEMORY[0x263EF8708])
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __SUBIPCXPCToDictionary_block_invoke;
    applier[3] = &unk_264E3C100;
    id v3 = v4;
    id v7 = v3;
    xpc_dictionary_apply(v2, applier);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

uint64_t __SUBIPCXPCToDictionary_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = MEMORY[0x23ECDFBB0]();
  if (v6 == MEMORY[0x263EF8798])
  {
    uint64_t v7 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v5)];
  }
  else if (v6 == MEMORY[0x263EF86F8])
  {
    id v8 = (void *)MEMORY[0x263EFF8F8];
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    uint64_t v7 = [v8 dataWithBytes:bytes_ptr length:xpc_data_get_length(v5)];
  }
  else
  {
    if (v6 != MEMORY[0x263EF8738]) {
      goto LABEL_9;
    }
    uint64_t v7 = [NSNumber numberWithLongLong:xpc_int64_get_value(v5)];
  }
  id v10 = (void *)v7;
  if (v7)
  {
    id v11 = *(void **)(a1 + 32);
    uint32_t v12 = [NSString stringWithUTF8String:a2];
    [v11 setObject:v10 forKey:v12];
  }
LABEL_9:

  return 1;
}

id SUBError(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  xpc_object_t v9 = SUBErrorUserInfoV(a1, a2, 0, a3, a4, (uint64_t)&a9);
  return v9;
}

id SUBErrorUserInfoV(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v12)
  {
    uint64_t v15 = [v12 mutableCopy];
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
  }
  long long v16 = (void *)v15;
  if (v14)
  {
    long long v17 = (void *)[[NSString alloc] initWithFormat:v14 arguments:a6];
    if (v17) {
      [v16 setObject:v17 forKeyedSubscript:*MEMORY[0x263F08320]];
    }
  }
  if (v13) {
    [v16 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  __int16 v18 = [MEMORY[0x263F087E8] errorWithDomain:v11 code:a2 userInfo:v16];

  return v18;
}

id SUBErrorUserInfo(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  xpc_object_t v9 = SUBErrorUserInfoV(a1, a2, a3, a4, a5, (uint64_t)&a9);
  return v9;
}

uint64_t SUBIsChargerConnected()
{
  CFDictionaryRef v0 = IOServiceMatching("IOPMPowerSource");
  if (!v0) {
    return 0;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC90], v0);
  if (!MatchingService) {
    return 0;
  }
  io_object_t v2 = MatchingService;
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(MatchingService, @"ExternalConnected", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  IOObjectRelease(v2);
  if (!CFProperty) {
    return 0;
  }
  uint64_t Value = CFBooleanGetValue(CFProperty);
  CFRelease(CFProperty);
  return Value;
}

id SUBActiveNRDevice()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFDictionaryRef v0 = [MEMORY[0x263F57730] sharedInstance];
  id v1 = [v0 getAllDevices];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    uint64_t v6 = *MEMORY[0x263F575A8];
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        xpc_object_t v9 = objc_msgSend(v8, "valueForProperty:", v6, (void)v13);
        char v10 = [v9 BOOLValue];

        if (v10)
        {
          id v11 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

uint64_t SUBIsRunningInStoreDemoMode()
{
  if (SUBIsRunningInStoreDemoMode_onceToken != -1) {
    dispatch_once(&SUBIsRunningInStoreDemoMode_onceToken, &__block_literal_global_0);
  }
  return SUBIsRunningInStoreDemoMode_result;
}

uint64_t __SUBIsRunningInStoreDemoMode_block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0);
  SUBIsRunningInStoreDemoMode_uint64_t result = result != 0;
  return result;
}

__CFString *stringForMAAssetCancelResult(unint64_t a1)
{
  if (a1 > 6) {
    return @"Unknown";
  }
  else {
    return (__CFString *)*((void *)&off_264E3C120 + a1);
  }
}

__CFString *stringForMAAssetPurgeResult(unint64_t a1)
{
  if (a1 > 7) {
    return @"Unknown";
  }
  else {
    return (__CFString *)*((void *)&off_264E3C158 + a1);
  }
}

void enableNotification(const char *a1)
{
  id v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "Notification", a1);
  xpc_set_event();
}

uint64_t disableNotification()
{
  return xpc_set_event();
}

char *SUBResultTypeForMessageType(const char *a1)
{
  if (!strcmp(a1, SUBMessageTypeScanForUpdates)) {
    return SUBMessageTypeScanResult;
  }
  if (!strcmp(a1, SUBMessageTypeStartDownload)) {
    return SUBMessageTypeDownloadProgress;
  }
  if (!strcmp(a1, SUBMessageTypeInstallUpdate)) {
    return SUBMessageTypeInstallResult;
  }
  if (!strcmp(a1, SUBMessageTypeSetUserInstallRequestType)) {
    return (char *)SUBMessageTypeSetUserInstallRequestTypeCompletion;
  }
  if (!strcmp(a1, SUBMessageTypeUserDidAcceptTermsAndConditions)) {
    return (char *)SUBMessageTypeUserDidAcceptTermsAndConditionsCompletion;
  }
  return 0;
}

__CFString *SUBStringForManagerState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9) {
    return @"Unknown";
  }
  else {
    return (__CFString *)*((void *)&off_264E3C240 + a1 - 1);
  }
}

const char *SUBStringForUserInstallRequestType(unint64_t a1)
{
  if (a1 > 3) {
    return "unknown";
  }
  else {
    return off_264E3C290[a1];
  }
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x270EE4578](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURLInDirectory(CFURLRef bundleURL, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE45A0](bundleURL, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
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

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
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

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC210](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x270EDC398]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}