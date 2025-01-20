void sub_2104F07E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
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

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
}

uint64_t _lp2_delete_directory_contents(const char *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unsigned int value = 0;
  v2 = removefile_state_alloc();
  removefile_state_set(v2, 1u, _lp2_delete_directory_contents_confirm);
  removefile_state_set(v2, 2u, &value);
  removefile_state_set(v2, 3u, _lp2_delete_directory_contents_error);
  removefile_state_set(v2, 4u, &value);
  _os_log_pack_size();
  MEMORY[0x270FA5388]();
  uint64_t v3 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v3 = 136380675;
  *(void *)(v3 + 4) = a1;
  _LPLogPack(1);
  if (removefile(a1, v2, 3u))
  {
    if (!value) {
      unsigned int value = *__error();
    }
  }
  else
  {
    strcpy(path, ".XXXXXXXX");
    int v4 = open(a1, 1048832);
    if (v4 == -1)
    {
      int v8 = *__error();
    }
    else
    {
      int v5 = v4;
      int v6 = mkstempsat_np(v4, path, 8);
      if (v6 == -1)
      {
        int v8 = *__error();
      }
      else
      {
        int v7 = v6;
        if (unlinkat(v5, path, 0) || fcopyfile(v7, v5, 0, 5u)) {
          int v8 = *__error();
        }
        else {
          int v8 = 0;
        }
        close(v7);
      }
      close(v5);
    }
    unsigned int value = v8;
    if (v8)
    {
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      uint64_t v9 = _os_log_pack_fill();
      v10 = strerror(value);
      *(_DWORD *)uint64_t v9 = 136380931;
      *(void *)(v9 + 4) = a1;
      *(_WORD *)(v9 + 12) = 2080;
      *(void *)(v9 + 14) = v10;
      _LPLogPack(1);
    }
  }
  _os_log_pack_size();
  MEMORY[0x270FA5388]();
  uint64_t v11 = _os_log_pack_fill();
  unsigned int v12 = value;
  v13 = "failed";
  *(_DWORD *)uint64_t v11 = 136381187;
  *(void *)(v11 + 4) = a1;
  if (!v12) {
    v13 = "succeeded";
  }
  *(_WORD *)(v11 + 12) = 2080;
  *(void *)(v11 + 14) = v13;
  *(_WORD *)(v11 + 22) = 1024;
  *(_DWORD *)(v11 + 24) = v12;
  _LPLogPack(1);
  removefile_state_free(v2);
  return value;
}

uint64_t _execForLibpartition(const char **a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  pid_t v31 = 0;
  *(void *)v33 = -1;
  if (pipe(v33))
  {
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    uint64_t v2 = _os_log_pack_fill();
    uint64_t v3 = *a1;
    int v4 = __error();
    int v5 = strerror(*v4);
    *(_DWORD *)uint64_t v2 = 136315394;
    *(void *)(v2 + 4) = v3;
    *(_WORD *)(v2 + 12) = 2080;
    *(void *)(v2 + 14) = v5;
    _LPLogPack(1);
    return 0xFFFFFFFFLL;
  }
  posix_spawnattr_t v29 = 0;
  posix_spawn_file_actions_t v30 = 0;
  posix_spawn_file_actions_init(&v30);
  posix_spawn_file_actions_adddup2(&v30, v33[1], 1);
  posix_spawn_file_actions_addclose(&v30, v33[0]);
  posix_spawnattr_init(&v29);
  posix_spawnattr_setflags(&v29, 0x4000);
  uint64_t v7 = posix_spawn(&v31, *a1, &v30, 0, (char *const *)a1, 0);
  if (v7)
  {
    uint64_t v6 = v7;
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    uint64_t v8 = _os_log_pack_fill();
    uint64_t v9 = *a1;
    v10 = strerror(v6);
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)(v8 + 4) = v9;
    *(_WORD *)(v8 + 12) = 2080;
    *(void *)(v8 + 14) = v10;
    _LPLogPack(1);
    close(v33[0]);
    goto LABEL_5;
  }
  bzero(v32, 0x400uLL);
  int v12 = v33[0];
  close(v33[1]);
  v33[1] = -1;
  ssize_t v13 = read(v12, v32, 0x400uLL);
  if (v13 >= 1)
  {
    do
    {
      execlogfunction(v13, v14, v15, v16, v17, v18, v19, v20, v13);
      ssize_t v13 = read(v12, v32, 0x400uLL);
    }
    while (v13 > 0);
  }
  int v28 = 0;
  if (waitpid(v31, &v28, 0) == -1)
  {
    uint64_t v6 = *__error();
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    uint64_t v21 = _os_log_pack_fill();
    v22 = *a1;
    v23 = __error();
    v24 = strerror(*v23);
    *(_DWORD *)uint64_t v21 = 136315394;
    *(void *)(v21 + 4) = v22;
    *(_WORD *)(v21 + 12) = 2080;
    *(void *)(v21 + 14) = v24;
    _LPLogPack(1);
  }
  else
  {
    if ((v28 & 0x7F) == 0x7F)
    {
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      uint64_t v25 = _os_log_pack_fill();
      v26 = *a1;
      int v27 = v28 >> 8;
    }
    else
    {
      if ((v28 & 0x7F) == 0)
      {
        uint64_t v6 = BYTE1(v28);
        goto LABEL_5;
      }
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      uint64_t v25 = _os_log_pack_fill();
      v26 = *a1;
      int v27 = v28 & 0x7F;
    }
    *(_DWORD *)uint64_t v25 = 136315394;
    *(void *)(v25 + 4) = v26;
    *(_WORD *)(v25 + 12) = 1024;
    *(_DWORD *)(v25 + 14) = v27;
    _LPLogPack(1);
    uint64_t v6 = 0xFFFFFFFFLL;
  }
LABEL_5:
  posix_spawnattr_destroy(&v29);
  posix_spawn_file_actions_destroy(&v30);
  if (v33[1] != -1) {
    close(v33[1]);
  }
  return v6;
}

char *___is_running_in_ramdisk_block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  bzero(__s1, 0x400uLL);
  size_t v1 = 1024;
  result = (char *)sysctlbyname("kern.bootargs", __s1, &v1, 0, 0);
  if (!result)
  {
    result = strstr(__s1, "-restore");
    if (result) {
      _is_running_in_ramdisk_is_ramdisk = 1;
    }
  }
  return result;
}

uint64_t _lp2_delete_directory_contents_confirm()
{
  return 0;
}

uint64_t _lp2_delete_directory_contents_error(uint64_t a1, uint64_t a2, int *a3)
{
  int v5 = __error();
  int v6 = *v5;
  *a3 = *v5;
  _os_log_pack_size();
  MEMORY[0x270FA5388]();
  uint64_t v7 = _os_log_pack_fill();
  uint64_t v8 = strerror(v6);
  *(_DWORD *)uint64_t v7 = 136380931;
  *(void *)(v7 + 4) = a2;
  *(_WORD *)(v7 + 12) = 2080;
  *(void *)(v7 + 14) = v8;
  _LPLogPack(1);
  return 2;
}

void execlogfunction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"%.*s" arguments:&a9];
  _os_log_pack_size();
  MEMORY[0x270FA5388]();
  uint64_t v10 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v10 = 138412290;
  *(void *)(v10 + 4) = v9;
  _LPLogPack(3);
}

id _LPLogObject()
{
  if (_LPLogObject_onceToken != -1) {
    dispatch_once(&_LPLogObject_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)_LPLogObject_obj;

  return v0;
}

void _LPLogPack(int a1)
{
  if (sLogLevel >= a1)
  {
    id v1 = _LPLogObject();
    uint64_t v2 = (char *)os_log_pack_compose();

    if (sLogToStandardOut) {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s\n", v2);
    }
    if (sLogToOSLog)
    {
      id v3 = _LPLogObject();
      os_log_pack_send();
    }
    if (sLogToConsole) {
      dprintf(sConsoleFD, "%s\n", v2);
    }
    free(v2);
  }
}

uint64_t LPLogSetOutput(char a1)
{
  sLogToStandardOut = a1 & 1;
  sLogToOSLog = (a1 & 2) != 0;
  sLogToConsole = (a1 & 4) != 0;
  uint64_t result = sConsoleFD;
  if ((a1 & 4) != 0)
  {
    if (sConsoleFD == -1)
    {
      uint64_t result = open("/dev/console", 10);
      sConsoleFD = result;
      if (result == -1) {
        sLogToConsole = 0;
      }
    }
  }
  else
  {
    if (sConsoleFD != -1) {
      uint64_t result = close(sConsoleFD);
    }
    sConsoleFD = -1;
  }
  return result;
}

uint64_t LPLogSetVerbosity(uint64_t result)
{
  sLogLevel = result;
  return result;
}

id __copy_helper_block_e8_32s(uint64_t a1, uint64_t a2)
{
  return *(id *)(a2 + 32);
}

void __destroy_helper_block_e8_32s(uint64_t a1)
{
}

BOOL iterateSafely(uint64_t a1, int a2, id a3, void *a4)
{
  uint64_t v7 = (void (**)(id, void))a3;
  uint64_t v8 = a4;
  if (a2 < 1)
  {
    BOOL v10 = 0;
LABEL_10:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "_Bool iterateSafely(io_iterator_t, int, void (^__strong)(io_object_t), void (^__strong)(void))";
    *(_WORD *)(v13 + 12) = 1024;
    *(_DWORD *)(v13 + 14) = a2;
    _LPLogPack(1);
  }
  else
  {
    int v9 = 0;
    BOOL v10 = 1;
    while (1)
    {
      uint64_t v11 = IOIteratorNext(a1);
      if (v11)
      {
        uint64_t v12 = v11;
        do
        {
          v7[2](v7, v12);
          IOObjectRelease(v12);
          uint64_t v12 = IOIteratorNext(a1);
        }
        while (v12);
      }
      if (IOIteratorIsValid(a1)) {
        break;
      }
      MEMORY[0x210570BF0](a1);
      v8[2](v8);
      BOOL v10 = ++v9 < a2;
      if (v9 == a2) {
        goto LABEL_10;
      }
    }
  }

  return v10;
}

uint64_t APFSVolumeCreate()
{
  return MEMORY[0x270F08AE0]();
}

uint64_t APFSVolumeCreateForMSU()
{
  return MEMORY[0x270F08AE8]();
}

uint64_t APFSVolumeDelete()
{
  return MEMORY[0x270F08AF0]();
}

uint64_t APFSVolumeGetVEKState()
{
  return MEMORY[0x270F08B08]();
}

uint64_t APFSVolumeRole()
{
  return MEMORY[0x270F08B48]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF3EE8](*(void *)&mainPort, *(void *)&options, bsdName);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x270EF4788](*(void *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return MEMORY[0x270EF4818](*(void *)&object, *(void *)&anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49E0](*(void *)&entry, plane, *(void *)&options, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x270EF4A08](*(void *)&entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IORegistryIteratorExitEntry(io_iterator_t iterator)
{
  return MEMORY[0x270EF4A78](*(void *)&iterator);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return MEMORY[0x270EF4AF0](*(void *)&service, waitTime);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t _os_log_pack_fill()
{
  return MEMORY[0x270ED80A0]();
}

uint64_t _os_log_pack_size()
{
  return MEMORY[0x270ED80A8]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x270ED9668](*(void *)&a1, a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x270ED98D8](*(void *)&from_fd, *(void *)&to_fd, a3, *(void *)&flags);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9940](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

int fs_snapshot_create(int a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x270ED9A78](*(void *)&a1, a2, *(void *)&a3);
}

int fs_snapshot_delete(int a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x270ED9A80](*(void *)&a1, a2, *(void *)&a3);
}

int fs_snapshot_list(int a1, attrlist *a2, void *a3, size_t a4, uint32_t a5)
{
  return MEMORY[0x270ED9A88](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

int fs_snapshot_rename(int a1, const char *a2, const char *a3, uint32_t a4)
{
  return MEMORY[0x270ED9A98](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fs_snapshot_revert(int a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x270ED9AA0](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t fs_snapshot_root()
{
  return MEMORY[0x270ED9AA8]();
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9AB8](a1, a2, a3, *(void *)&a4);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270ED9BA0](a1, a2, a3, a4, *(void *)&a5);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return MEMORY[0x270ED9CA0](a1, *(void *)&a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x270EDA528](a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x270EDA550](path, omode);
}

int mkstempsat_np(int dfd, char *path, int slen)
{
  return MEMORY[0x270EDA578](*(void *)&dfd, path, *(void *)&slen);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void objc_enumerationMutation(id obj)
{
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

uint64_t os_log_pack_compose()
{
  return MEMORY[0x270EDA9A8]();
}

uint64_t os_log_pack_send()
{
  return MEMORY[0x270EDA9B0]();
}

int pipe(int a1[2])
{
  return MEMORY[0x270EDAC38](a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x270EDAC68](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x270EDAC78](a1, *(void *)&a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x270EDAC80](a1, *(void *)&a2, *(void *)&a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x270EDAC98](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x270EDACA0](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x270EDACA8](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x270EDACB8](a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x270EDACC8](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x270EDB1F0](path, state, *(void *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x270EDB1F8]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x270EDB200](a1);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x270EDB210](state, *(void *)&key, value);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270EDB3C8](a1, a2, a3, a4, *(void *)&a5);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x270EDB9B0](*(void *)&a1, a2, *(void *)&a3);
}

int unmount(const char *a1, int a2)
{
  return MEMORY[0x270EDB9C0](a1, *(void *)&a2);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x270EDBA30](in, uu);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x270EDBB48](*(void *)&a1, a2, *(void *)&a3);
}