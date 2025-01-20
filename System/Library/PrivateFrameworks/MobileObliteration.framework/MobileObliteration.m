uint64_t Mobile_Obliterate(const __CFDictionary *a1)
{
  uint64_t v2;
  NSObject *v3;
  dispatch_block_t v4;
  void *v5;
  dispatch_time_t v6;
  intptr_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  CFStringRef v11;
  __CFDictionary *MutableCopy;
  __CFDictionary *v13;
  pid_t v14;
  CFAllocatorRef v15;
  CFStringRef v16;
  CFStringRef v17;
  __CFDictionary *v18;
  CFDictionaryRef v19;
  CFDictionaryRef v20;
  const void *v21;
  const void *v22;
  int *v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  BOOL v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *value;
  char cStr[16];
  char v42;
  long long buffer;
  long long v44;
  long long v45;
  long long v46;
  uint64_t v47;

  v47 = *MEMORY[0x263EF8340];
  v2 = 0xFFFFFFFFLL;
  v3 = dispatch_queue_create("com.apple.obliteration.timeout_block", 0);
  if (v3 && (v4 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global)) != 0)
  {
    v5 = v4;
    dispatch_async(v3, v4);
    v6 = dispatch_time(0, 180000000000);
    v7 = dispatch_block_wait(v5, v6);

    if (!v7) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    Mobile_Obliterate_cold_7(v8, v9, v10);
    if (!a1) {
      return v2;
    }
    goto LABEL_8;
  }
LABEL_7:
  if (!a1) {
    return v2;
  }
LABEL_8:
  value = 0;
  if (CFDictionaryContainsKey(a1, @"ObliterationCallingProcessName"))
  {
    v11 = (const __CFString *)CFDictionaryGetValue(a1, @"ObliterationCallingProcessName");
    if (v11 && CFEqual(v11, @"__Ignore__"))
    {
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a1);
      v13 = MutableCopy;
      if (MutableCopy)
      {
        CFDictionaryRemoveValue(MutableCopy, @"ObliterationCallingProcessName");
        a1 = v13;
      }
      goto LABEL_19;
    }
LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
  v14 = getpid();
  v45 = 0u;
  v46 = 0u;
  buffer = 0u;
  v44 = 0u;
  if (proc_pidinfo(v14, 13, 1uLL, &buffer, 64) != 64) {
    goto LABEL_18;
  }
  *(_OWORD *)cStr = v44;
  v42 = 0;
  v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v16 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
  if (!v16) {
    goto LABEL_18;
  }
  v17 = v16;
  v18 = CFDictionaryCreateMutableCopy(v15, 0, a1);
  v13 = v18;
  if (v18)
  {
    CFDictionaryAddValue(v18, @"ObliterationCallingProcessName", v17);
    a1 = v13;
  }
  CFRelease(v17);
LABEL_19:
  if (CFDictionaryGetValueIfPresent(a1, @"returnDictionary", (const void **)&value))
  {
    if (v13 || (v13 = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a1)) != 0) {
      CFDictionaryRemoveValue(v13, @"returnDictionary");
    }
  }
  if (!MOXPCTransportOpen())
  {
    v24 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v24) {
      Mobile_Obliterate_cold_1(v24, v25, v26);
    }
    goto LABEL_47;
  }
  MOXPCTransportResume();
  if (!MOXPCTransportSendMessage())
  {
    v27 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v27) {
      Mobile_Obliterate_cold_6(v27, v28, v29);
    }
    LODWORD(v2) = -1000;
    goto LABEL_46;
  }
  v19 = (const __CFDictionary *)MOXPCTransportReceiveMessage();
  if (!v19)
  {
    LODWORD(v2) = -1000;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      Mobile_Obliterate_cold_2(&buffer, (unsigned char *)&buffer + 1);
    }
    goto LABEL_46;
  }
  v20 = v19;
  v21 = CFDictionaryGetValue(v19, @"IPCStatus");
  if (!v21)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      Mobile_Obliterate_cold_3(&buffer, (unsigned char *)&buffer + 1);
    }
LABEL_40:
    v23 = &kMobileObliterationInternalError;
    goto LABEL_45;
  }
  v22 = v21;
  if (!CFEqual(v21, @"Complete"))
  {
    v30 = CFEqual(v22, @"Error");
    v31 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v31) {
        Mobile_Obliterate_cold_5(&buffer, (unsigned char *)&buffer + 1);
      }
      v23 = &kMobileObliterationError;
      goto LABEL_45;
    }
    if (v31) {
      Mobile_Obliterate_cold_4(&buffer, (unsigned char *)&buffer + 1);
    }
    goto LABEL_40;
  }
  v23 = &kMobileObliterationSuccess;
LABEL_45:
  LODWORD(v2) = *v23;
  CFRelease(v20);
LABEL_46:
  MOXPCTransportClose();
LABEL_47:
  v32 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:(int)v2 userInfo:0];
  v33 = [v32 code];
  v34 = [v32 userInfo];
  v35 = value;

  if (v34 && v35)
  {
    v36 = [v32 userInfo];
    v37 = [v36 objectForKeyedSubscript:@"ObliterationResultString"];

    if (v37) {
      CFDictionarySetValue((CFMutableDictionaryRef)value, @"ObliterationResultString", v37);
    }
    v38 = [v36 objectForKeyedSubscript:@"ObliterationResultState"];

    if (v38) {
      CFDictionarySetValue((CFMutableDictionaryRef)value, @"ObliterationResultState", v38);
    }
  }
  if (v13) {
    CFRelease(v13);
  }

  return v33;
}

uint64_t Mobile_Obliterate_IsSupported()
{
  return 1;
}

void *__delete_all_applets_block_invoke()
{
  result = dlopen("/System/Library/PrivateFrameworks/NearField.framework/NearField", 1);
  if (result)
  {
    result = dlsym(result, "ObliterationDeleteAllApplets");
    if (result)
    {
      return (void *)((uint64_t (*)(void))result)();
    }
  }
  return result;
}

unsigned char *OUTLINED_FUNCTION_0(unsigned char *result, unsigned char *a2)
{
  void *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void Mobile_Obliterate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1(&dword_21572A000, &_os_log_internal, a3, "Could not create transport connection", v3);
}

void Mobile_Obliterate_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  OUTLINED_FUNCTION_1(&dword_21572A000, &_os_log_internal, v2, "Could not receive response from server", v3);
}

void Mobile_Obliterate_cold_3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  OUTLINED_FUNCTION_1(&dword_21572A000, &_os_log_internal, v2, "Status missing from response", v3);
}

void Mobile_Obliterate_cold_4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  OUTLINED_FUNCTION_1(&dword_21572A000, &_os_log_internal, v2, "Unrecognized return status", v3);
}

void Mobile_Obliterate_cold_5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  OUTLINED_FUNCTION_1(&dword_21572A000, &_os_log_internal, v2, "Error from server", v3);
}

void Mobile_Obliterate_cold_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1(&dword_21572A000, &_os_log_internal, a3, "Could not send request through transport", v3);
}

void Mobile_Obliterate_cold_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1(&dword_21572A000, &_os_log_internal, a3, "Timed out waiting for ObliterationDeleteAllApplets() to return.", v3);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

uint64_t MOXPCTransportClose()
{
  return MEMORY[0x270F4B398]();
}

uint64_t MOXPCTransportOpen()
{
  return MEMORY[0x270F4B3A0]();
}

uint64_t MOXPCTransportReceiveMessage()
{
  return MEMORY[0x270F4B3A8]();
}

uint64_t MOXPCTransportResume()
{
  return MEMORY[0x270F4B3B0]();
}

uint64_t MOXPCTransportSendMessage()
{
  return MEMORY[0x270F4B3B8]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x270ED92B0](block, timeout);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}