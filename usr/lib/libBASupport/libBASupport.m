BOOL ba_is_process_extension()
{
  uint64_t v0;
  audit_token_t *v1;
  CFAllocatorRef v2;
  CFStringRef v3;
  CFURLRef v4;
  CFURLRef v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  CFDictionaryRef Value;
  CFDictionaryRef v9;
  CFTypeID v10;
  const void *v11;
  BOOL v12;
  CFTypeID v13;
  const void *v14;
  CFTypeID v15;
  const void *v16;
  CFTypeID v17;
  char buffer[4096];
  uint64_t v20;

  v0 = MEMORY[0x1F4188790]();
  v20 = *MEMORY[0x1E4F143B8];
  if (!v0) {
    ba_is_process_extension_cold_1();
  }
  v1 = (audit_token_t *)v0;
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath_audittoken(v1, buffer, 0x1000u) >= 1)
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v3 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], buffer);
    if (v3)
    {
      v4 = CFURLCreateWithFileSystemPath(v2, v3, kCFURLPOSIXPathStyle, 0);
      v5 = v4;
      if (!v4)
      {
        v12 = 0;
LABEL_22:
        CFRelease(v3);
        return v12;
      }
      v6 = CFBundleCopyInfoDictionaryForURL(v4);
      v7 = v6;
      if (!v6)
      {
        v12 = 0;
LABEL_21:
        CFRelease(v5);
        goto LABEL_22;
      }
      Value = (const __CFDictionary *)CFDictionaryGetValue(v6, @"EXAppExtensionAttributes");
      v9 = Value;
      if (Value)
      {
        v10 = CFGetTypeID(Value);
        if (v10 == CFDictionaryGetTypeID())
        {
          v11 = CFDictionaryGetValue(v9, @"EXExtensionPointIdentifier");
          v12 = (BOOL)v11;
          if (v11)
          {
            v13 = CFGetTypeID(v11);
            if (v13 == CFStringGetTypeID()) {
              goto LABEL_17;
            }
          }
        }
      }
      v14 = CFDictionaryGetValue(v7, @"NSExtension");
      v12 = (BOOL)v14;
      if (v14)
      {
        v15 = CFGetTypeID(v14);
        if (v15 != CFDictionaryGetTypeID()) {
          goto LABEL_19;
        }
        v16 = CFDictionaryGetValue((CFDictionaryRef)v12, @"NSExtensionPointIdentifier");
        v12 = (BOOL)v16;
        if (v16)
        {
          v17 = CFGetTypeID(v16);
          if (v17 == CFStringGetTypeID())
          {
LABEL_17:
            v12 = CFEqual((CFStringRef)v12, @"com.apple.background-asset-downloader-extension");
            goto LABEL_20;
          }
LABEL_19:
          v12 = 0;
        }
      }
LABEL_20:
      CFRelease(v7);
      goto LABEL_21;
    }
  }
  return 0;
}

void sub_1B0C7531C(_Unwind_Exception *a1)
{
  CFRelease(v3);
  CFRelease(v2);
  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t ba_is_current_process_extension()
{
  *(_OWORD *)task_info_out = 0u;
  long long v3 = 0u;
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(*MEMORY[0x1E4F14960], 0xFu, task_info_out, &task_info_outCnt)) {
    return 0;
  }
  else {
    return ba_is_process_extension_ls((long long *)task_info_out);
  }
}

uint64_t ba_is_process_extension_ls(long long *a1)
{
  if (!a1) {
    ba_is_process_extension_ls_cold_1();
  }
  v2 = os_log_create("com.apple.BackgroundAssets.BASupport", "ExtensionLookup");
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  long long v3 = (void *)getLSBundleRecordClass_softClass;
  uint64_t v21 = getLSBundleRecordClass_softClass;
  if (!getLSBundleRecordClass_softClass)
  {
    *(void *)&long long v15 = MEMORY[0x1E4F143A8];
    *((void *)&v15 + 1) = 3221225472;
    *(void *)&long long v16 = __getLSBundleRecordClass_block_invoke;
    *((void *)&v16 + 1) = &unk_1E5FEEC50;
    v17 = &v18;
    __getLSBundleRecordClass_block_invoke((uint64_t)&v15);
    long long v3 = (void *)v19[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v18, 8);
  id v14 = 0;
  long long v5 = a1[1];
  long long v15 = *a1;
  long long v16 = v5;
  v6 = [v4 bundleRecordForAuditToken:&v15 error:&v14];
  id v7 = v14;
  if (!v6)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      ba_is_process_extension_ls_cold_2((uint64_t)v7, v2);
    }
    goto LABEL_11;
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v8 = (void *)getLSApplicationExtensionRecordClass_softClass;
  uint64_t v21 = getLSApplicationExtensionRecordClass_softClass;
  if (!getLSApplicationExtensionRecordClass_softClass)
  {
    *(void *)&long long v15 = MEMORY[0x1E4F143A8];
    *((void *)&v15 + 1) = 3221225472;
    *(void *)&long long v16 = __getLSApplicationExtensionRecordClass_block_invoke;
    *((void *)&v16 + 1) = &unk_1E5FEEC50;
    v17 = &v18;
    __getLSApplicationExtensionRecordClass_block_invoke((uint64_t)&v15);
    v8 = (void *)v19[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v18, 8);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    uint64_t v12 = 0;
    goto LABEL_12;
  }
  v10 = [v6 extensionPointRecord];
  v11 = [v10 identifier];
  uint64_t v12 = [v11 isEqualToString:@"com.apple.background-asset-downloader-extension"];

LABEL_12:
  return v12;
}

void sub_1B0C755FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLSBundleRecordClass_block_invoke(uint64_t a1)
{
  CoreServicesLibrary();
  Class result = objc_getClass("LSBundleRecord");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLSBundleRecordClass_block_invoke_cold_1();
  }
  getLSBundleRecordClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void CoreServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!CoreServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __CoreServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5FEEC70;
    uint64_t v3 = 0;
    CoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!CoreServicesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __CoreServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getLSApplicationExtensionRecordClass_block_invoke(uint64_t a1)
{
  CoreServicesLibrary();
  Class result = objc_getClass("LSApplicationExtensionRecord");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLSApplicationExtensionRecordClass_block_invoke_cold_1();
  }
  getLSApplicationExtensionRecordClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ba_is_process_extension_ls_cold_1()
{
  qword_1E9B51E00 = (uint64_t)"BUG IN CLIENT OF libBASupport: ba_is_process_extension_ls() was invoked with a NULL audit token.";
  qword_1E9B51E30 = 6;
  __break(1u);
}

void ba_is_process_extension_ls_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B0C74000, a2, OS_LOG_TYPE_DEBUG, "-[LSBundleRecord bundleRecordForAuditToken:] returned nil. %{public}@", (uint8_t *)&v2, 0xCu);
}

void ba_is_process_extension_cold_1()
{
  qword_1E9B51E00 = (uint64_t)"BUG IN CLIENT OF libBASupport: ba_is_process_extension() was invoked with a NULL audit token.";
  qword_1E9B51E30 = 6;
  __break(1u);
}

void __getLSBundleRecordClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getLSApplicationExtensionRecordClass_block_invoke_cold_1(v0);
}

void __getLSApplicationExtensionRecordClass_block_invoke_cold_1()
{
  CFURLRef v0 = (const __CFURL *)abort_report_np();
  CFBundleCopyInfoDictionaryForURL(v0);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7478](url);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1F40D8478](alloc, buffer);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

void objc_terminate(void)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8C0](audittoken, buffer, *(void *)&buffersize);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}