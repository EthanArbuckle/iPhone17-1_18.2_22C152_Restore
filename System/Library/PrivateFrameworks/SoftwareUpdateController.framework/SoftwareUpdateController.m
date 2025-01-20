__CFString *SUControllerStringForManagerState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x11) {
    return @"Unknown";
  }
  else {
    return off_26551BFA0[a1 - 1];
  }
}

void SUControllerIPCEncodeObject(uint64_t a1, void *a2, const char *a3, void *a4)
{
  xpc_object_t xdict = a2;
  id v7 = a4;
  if (xdict && a3 && v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    [v8 encodeObject:v7 forKey:*MEMORY[0x263F081D0]];
    v9 = [v8 encodedData];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
      xpc_dictionary_set_data(xdict, a3, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
    }
    else
    {
      v15 = +[SUControllerLogger sharedLogger];
      [v15 logAtLevel:0 label:"SUControllerIPCEncodeObject" format:@"{SUControllerIPCEncodeObject} failed to encode using archiver"];
    }
  }
  else
  {
    v12 = +[SUControllerLogger sharedLogger];
    v8 = v12;
    v13 = "MISSING";
    if (a3) {
      v13 = a3;
    }
    v14 = @"PROVIDED";
    if (!v7) {
      v14 = @"MISSING";
    }
    [v12 logAtLevel:0, "SUControllerIPCEncodeObject", @"{SUControllerIPCEncodeObject} missing required parameter(s): message:PROVIDED(%s), key:%s, object:%@", a1, v13, v14 label format];
  }
}

id _SUControllerIPCDecodeObjectForKey(uint64_t a1, xpc_object_t xdict, char *key, uint64_t a4, int a5)
{
  if (!xdict || !key)
  {
    v15 = +[SUControllerLogger sharedLogger];
    v16 = v15;
    v17 = "MISSING";
    if (key) {
      v17 = key;
    }
    [v15 logAtLevel:0, "_SUControllerIPCDecodeObjectForKey", @"{_SUControllerIPCDecodeObjectForKey} missing required parameter(s): message:PROVIDED(%s), key:%s", a1, v17 label format];

    goto LABEL_8;
  }
  size_t length = 0;
  data = xpc_dictionary_get_data(xdict, key, &length);
  if (!data)
  {
    if (a5)
    {
      v13 = +[SUControllerLogger sharedLogger];
      objc_msgSend(v13, "logAtLevel:label:format:", 0, "_SUControllerIPCDecodeObjectForKey", @"{SUControllerIPCDecodeObjectForKey} unable to get data for key:%s", key);
      v14 = 0;
      goto LABEL_11;
    }
LABEL_8:
    v14 = 0;
    goto LABEL_12;
  }
  v10 = data;
  id v11 = objc_alloc(MEMORY[0x263F08928]);
  v12 = [MEMORY[0x263EFF8F8] dataWithBytes:v10 length:length];
  v13 = (void *)[v11 initForReadingFromData:v12 error:0];

  v14 = [v13 decodeObjectOfClass:a4 forKey:*MEMORY[0x263F081D0]];
  [v13 finishDecoding];
LABEL_11:

LABEL_12:

  return v14;
}

id SUControllerIPCDecodeObjectForKey(uint64_t a1, void *a2, char *a3, uint64_t a4)
{
  return _SUControllerIPCDecodeObjectForKey(a1, a2, a3, a4, 1);
}

id SUControllerIPCDecodeOptionalObjectForKey(uint64_t a1, void *a2, char *a3, uint64_t a4)
{
  return _SUControllerIPCDecodeObjectForKey(a1, a2, a3, a4, 0);
}

BOOL SUControllerIPCDecodeBooleanForKey(uint64_t a1, xpc_object_t xdict, char *key)
{
  if (xdict && key)
  {
    return xpc_dictionary_get_BOOL(xdict, key);
  }
  else
  {
    v6 = +[SUControllerLogger sharedLogger];
    id v7 = v6;
    v8 = "MISSING";
    if (key) {
      v8 = key;
    }
    [v6 logAtLevel:0, "SUControllerIPCDecodeBooleanForKey", @"{SUControllerIPCDecodeBooleanForKey} missing required parameter(s): message:PROVIDED(%s), key:%s", a1, v8 label format];

    return 0;
  }
}

id SUControllerIPCDecodeStringForKey(uint64_t a1, xpc_object_t xdict, char *key)
{
  if (xdict && key)
  {
    string = (void *)xpc_dictionary_get_string(xdict, key);
    if (string)
    {
      string = [NSString stringWithUTF8String:string];
    }
  }
  else
  {
    v6 = +[SUControllerLogger sharedLogger];
    id v7 = v6;
    v8 = "MISSING";
    if (key) {
      v8 = key;
    }
    [v6 logAtLevel:0, "SUControllerIPCDecodeStringForKey", @"{SUControllerIPCDecodeStringForKey} missing required parameter(s): message:PROVIDED(%s), key:%s", a1, v8 label format];

    string = 0;
  }

  return string;
}

BOOL SUControllerIPCClientIsEntitled()
{
  CFErrorRef error = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  xpc_connection_get_audit_token();
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  memset(&token, 0, sizeof(token));
  v1 = SecTaskCreateWithAuditToken(v0, &token);
  if (v1)
  {
    v2 = v1;
    CFBooleanRef v3 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, @"com.apple.private.allow-SUController", &error);
    if (v3)
    {
      CFBooleanRef v4 = v3;
      CFTypeID v5 = CFGetTypeID(v3);
      if (v5 == CFBooleanGetTypeID())
      {
        BOOL v6 = CFBooleanGetValue(v4) != 0;
      }
      else
      {
        v9 = +[SUControllerLogger sharedLogger];
        [v9 logAtLevel:0 label:"SUControllerIPCClientIsEntitled" format:@"entitlement has wrong type"];

        BOOL v6 = 0;
      }
      CFRelease(v2);
      v2 = v4;
    }
    else
    {
      CFErrorRef v7 = error;
      v8 = +[SUControllerLogger sharedLogger];
      if (v7) {
        objc_msgSend(v8, "logAtLevel:label:format:", 0, "SUControllerIPCClientIsEntitled", @"unable to look up client entitlement: %ld", CFErrorGetCode(error));
      }
      else {
        objc_msgSend(v8, "logAtLevel:label:format:", 0, "SUControllerIPCClientIsEntitled", @"client is not entitled", v11);
      }

      BOOL v6 = 0;
    }
    CFRelease(v2);
  }
  else
  {
    BOOL v6 = 0;
  }
  if (error) {
    CFRelease(error);
  }
  return v6;
}

id SUControllerIPCDictionaryToXPC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  CFTypeID v5 = v4;
  if (v4) {
    xpc_object_t v6 = v4;
  }
  else {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __SUControllerIPCDictionaryToXPC_block_invoke;
  v9[3] = &unk_26551C038;
  id v7 = v6;
  id v10 = v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void __SUControllerIPCDictionaryToXPC_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_object_t v9 = xpc_string_create((const char *)[v8 UTF8String]);
LABEL_7:
    uint64_t v11 = v9;
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
  uint64_t v11 = 0;
LABEL_8:
  v12 = *(void **)(a1 + 32);
  id v13 = v7;
  xpc_dictionary_set_value(v12, (const char *)[v13 UTF8String], v11);
  *a4 = 0;
}

id SUControllerIPCXPCToDictionary(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1 && MEMORY[0x2611CD070](v1) == MEMORY[0x263EF8708])
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __SUControllerIPCXPCToDictionary_block_invoke;
    applier[3] = &unk_26551C060;
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

uint64_t __SUControllerIPCXPCToDictionary_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = MEMORY[0x2611CD070]();
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
    uint64_t v11 = *(void **)(a1 + 32);
    v12 = [NSString stringWithUTF8String:a2];
    [v11 setObject:v10 forKey:v12];
  }
LABEL_9:

  return 1;
}

id SUControllerArchive(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    [v2 encodeObject:v1 forKey:*MEMORY[0x263F081D0]];
    id v3 = [v2 encodedData];
  }
  else
  {
    id v3 = [MEMORY[0x263EFF9D0] null];
  }

  return v3;
}

id SUControllerUnarchive(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = [v5 objectForKey:v6];
  if (!v7) {
    goto LABEL_3;
  }
  id v8 = (void *)v7;
  xpc_object_t v9 = [v5 objectForKey:v6];
  id v10 = [MEMORY[0x263EFF9D0] null];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    id v13 = objc_alloc(MEMORY[0x263F08928]);
    long long v14 = [v5 objectForKey:v6];
    v15 = (void *)[v13 initForReadingFromData:v14 error:0];

    v12 = [v15 decodeObjectOfClass:a3 forKey:*MEMORY[0x263F081D0]];
    [v15 finishDecoding];
  }
  else
  {
LABEL_3:
    v12 = 0;
  }

  return v12;
}

id SUControllerError(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  xpc_object_t v9 = SUControllerErrorUserInfoV(a1, a2, 0, a3, a4, (uint64_t)&a9);

  return v9;
}

id SUControllerErrorUserInfoV(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6)
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
  v16 = (void *)v15;
  if (v14)
  {
    v17 = (void *)[[NSString alloc] initWithFormat:v14 arguments:a6];
    if (v17) {
      [v16 setObject:v17 forKeyedSubscript:*MEMORY[0x263F08320]];
    }
  }
  if (v13) {
    [v16 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  v18 = [MEMORY[0x263F087E8] errorWithDomain:v11 code:a2 userInfo:v16];

  return v18;
}

id SUControllerErrorUserInfo(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  xpc_object_t v9 = SUControllerErrorUserInfoV(a1, a2, a3, a4, a5, (uint64_t)&a9);

  return v9;
}

uint64_t doStringsMatch(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  id v5 = (void *)v4;
  if (v3 | v4)
  {
    uint64_t v6 = 0;
    if (v3 && v4) {
      uint64_t v6 = [(id)v3 isEqualToString:v4];
    }
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t updateRequiresDocAsset()
{
  CFAllocatorRef v0 = [MEMORY[0x263F77DA0] sharedDevice];
  id v1 = [v0 deviceClass];
  int v2 = [v1 isEqualToString:@"AppleTV"];

  return v2 ^ 1u;
}

void sub_25E026A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_25E026C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
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

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
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

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
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

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}