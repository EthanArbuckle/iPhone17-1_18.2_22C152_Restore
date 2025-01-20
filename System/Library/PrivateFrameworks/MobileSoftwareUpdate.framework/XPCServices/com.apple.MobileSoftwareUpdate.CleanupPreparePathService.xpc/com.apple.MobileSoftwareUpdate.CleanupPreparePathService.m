CFTypeRef copy_nvram_variable_with_system_nvram_check(const __CFString *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CFStringRef v7;
  CFTypeRef CFProperty;
  io_registry_entry_t v9;
  io_object_t v10;
  char v12;
  mach_port_t mainPort;

  mainPort = 0;
  if (IOMasterPort(bootstrap_port, &mainPort))
  {
    v7 = @"Could not get master port\n";
  }
  else
  {
    v9 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
    if (v9)
    {
      v10 = v9;
      CFProperty = IORegistryEntryCreateCFProperty(v9, a1, kCFAllocatorDefault, 0);
      IOObjectRelease(v10);
      return CFProperty;
    }
    v7 = @"Could not get options entry from the device tree\n";
  }
  logfunction("", 1, v7, v2, v3, v4, v5, v6, v12);
  return 0;
}

CFTypeRef copy_nvram_variable(const __CFString *a1)
{
  return copy_nvram_variable_with_system_nvram_check(a1);
}

BOOL set_nvram_object(const __CFString *a1, BOOL a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return set_nvram_object_with_system_nvram_check(a1, a2, 0, a4, a5, a6, a7, a8);
}

BOOL set_nvram_object_with_system_nvram_check(const __CFString *a1, BOOL a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  kern_return_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFStringRef v18;
  char v20;

  if (!a1)
  {
    v18 = @"Can't insert nil key into registry\n";
LABEL_10:
    logfunction("", 1, v18, a4, a5, a6, a7, a8, v20);
    return 0;
  }
  BOOL v8 = a2;
  if (!a2)
  {
    logfunction("", 1, @"Can't insert nil object into registry\n", a4, a5, a6, a7, a8, v20);
    return v8;
  }
  io_registry_entry_t v10 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/options");
  if (!v10)
  {
    v18 = @"Failed to locate IODeviceTree options in IO registry\n";
    goto LABEL_10;
  }
  io_object_t v11 = v10;
  v12 = IORegistryEntrySetCFProperty(v10, a1, (CFTypeRef)v8);
  BOOL v8 = v12 == 0;
  if (v12) {
    logfunction("", 1, @"Failed to set key %@ in IO registry: %d\n", v13, v14, v15, v16, v17, (char)a1);
  }
  IOObjectRelease(v11);
  return v8;
}

uint64_t delete_nvram_variable(const __CFString *a1)
{
  return msu_delete_nvram_variable_if_exists(a1, &v2);
}

uint64_t msu_delete_nvram_variable_if_exists(const __CFString *a1, unsigned char *a2)
{
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v15 = 0u;
  BOOL v4 = msu_nvram_exists(a1);
  CFStringGetCString(a1, buffer, 511, 0x8000100u);
  if (!v4)
  {
    CFStringRef v12 = @"%s: NVRAM %s not found..Nothing to do\n\n";
    goto LABEL_5;
  }
  BOOL v10 = set_nvram_object_with_system_nvram_check(@"IONVRAM-DELETE-PROPERTY", (BOOL)a1, 0, v5, v6, v7, v8, v9);
  uint64_t v11 = 0;
  if (v10)
  {
    CFStringRef v12 = @"%s: Deleted value %s\n\n";
LABEL_5:
    uint64_t v11 = 1;
    logfunction("", 1, v12, v5, v6, v7, v8, v9, (char)"msu_delete_nvram_variable_if_exists");
  }
  *a2 = v4;
  return v11;
}

BOOL msu_nvram_exists(const __CFString *a1)
{
  CFTypeRef v1 = copy_nvram_variable_with_system_nvram_check(a1);
  CFTypeRef v2 = v1;
  if (v1) {
    CFRelease(v1);
  }
  return v2 != 0;
}

BOOL set_nvram_variable(char *cStr, BOOL a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!cStr)
  {
    CFStringRef v23 = @"Can't set null key name into NVRAM\n";
LABEL_11:
    logfunction("", 1, v23, a4, a5, a6, a7, a8, v25);
    return 0;
  }
  BOOL v8 = a2;
  if (!a2)
  {
    logfunction("", 1, @"Can't set NULL value into NVRAM\n", a4, a5, a6, a7, a8, v25);
    return v8;
  }
  CFStringRef v9 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v9)
  {
    CFStringRef v23 = @"Failed to allocate string for key\n";
    goto LABEL_11;
  }
  CFStringRef v10 = v9;
  CFStringRef v11 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v8, 0x8000100u);
  if (!v11)
  {
    logfunction("", 1, @"Failed to allocate string for value\n", v12, v13, v14, v15, v16, v25);
    CFRelease(v10);
    return 0;
  }
  CFStringRef v17 = v11;
  BOOL v8 = set_nvram_object_with_system_nvram_check(v10, (BOOL)v11, 0, v12, v13, v14, v15, v16);
  if (!v8) {
    logfunction("", 1, @"Failed to set value into NVRAM\n", v18, v19, v20, v21, v22, v25);
  }
  CFRelease(v10);
  CFRelease(v17);
  return v8;
}

BOOL msu_sync_nvram(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1) {
    CFStringRef v8 = @"IONVRAM-FORCESYNCNOW-PROPERTY";
  }
  else {
    CFStringRef v8 = @"IONVRAM-SYNCNOW-PROPERTY";
  }
  return set_nvram_object_with_system_nvram_check(v8, (BOOL)v8, 0, a4, a5, a6, a7, a8);
}

int *logfunctionv(const char *a1, int a2, const __CFString *a3, va_list a4)
{
  int v8 = *__error();
  memcpy(__dst, "Error creating CFString", sizeof(__dst));
  if (a1) {
    CFStringRef v9 = a1;
  }
  else {
    CFStringRef v9 = "";
  }
  if (logfunctionv_onceToken != -1) {
    dispatch_once(&logfunctionv_onceToken, &__block_literal_global);
  }
  CFStringRef v10 = CFStringCreateWithFormatAndArguments(0, 0, a3, a4);
  pthread_t v11 = pthread_self();
  CFStringRef v12 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%08llx %s: %@", v11, v9, v10);
  CFRelease(v10);
  if (v12)
  {
    uint64_t v13 = __dst;
    if (CFStringGetCString(v12, __dst, 1024, 0x8000100u))
    {
      uint64_t v14 = 0;
    }
    else
    {
      CFIndex Length = CFStringGetLength(v12);
      CFIndex v17 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      uint64_t v14 = (char *)malloc_type_malloc(v17, 0x5CBFF54EuLL);
      CFStringGetCString(v12, v14, v17, 0x8000100u);
      uint64_t v13 = v14;
    }
    size_t v15 = strlen(v13);
    CFRelease(v12);
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    size_t v15 = 0;
  }
  uint64_t v18 = logfunctionv_logObject;
  if (logfunctionv_logObject
    || (uint64_t v18 = os_log_create("com.apple.MobileSoftwareUpdate", "Info"), (logfunctionv_logObject = (uint64_t)v18) != 0))
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
    }
  }
  if (console_fd != -1) {
    write(console_fd, v13, v15);
  }
  if (a2)
  {
    openRestoreLogFile(0);
    writeToRestoreLogFile(v13, v15);
  }
  fprintf(__stderrp, "%s: %s", v9, v13);
  free(v14);
  result = __error();
  int *result = v8;
  return result;
}

void __logfunctionv_block_invoke(id a1)
{
  if (getenv("__OSINSTALL_ENVIRONMENT")) {
    console_fd = open("/dev/console", 131082);
  }
}

int *logfunction(const char *a1, int a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return logfunctionv(a1, a2, a3, &a9);
}

uint64_t msuSharedLogger()
{
  if (msuSharedLogger_pred != -1) {
    dispatch_once(&msuSharedLogger_pred, &__block_literal_global_0);
  }
  return msuSharedLogger___instance;
}

void __msuSharedLogger_block_invoke(id a1)
{
  msuSharedLogger___instance = (uint64_t)os_log_create("com.apple.MobileSoftwareUpdate", "cleanup");
}

uint64_t openRestoreLogFile(int a1)
{
  return openRestoreLogFileWithPath("/private/var/MobileSoftwareUpdate/restore.log", a1);
}

uint64_t openRestoreLogFileWithPath(const char *a1, int a2)
{
  uint64_t v2 = _restoreLogFD;
  if (_restoreLogFD < 0)
  {
    if (!a2 && _restoreLogFD == -2) {
      return 0xFFFFFFFFLL;
    }
    _restoreLogFD = -2;
    if (mkparentdir((uint64_t)a1, 0x1EDu))
    {
      __error();
      BOOL v4 = __error();
      strerror(*v4);
      CFStringRef v5 = @"Could not create path %s: %s\n";
    }
    else
    {
      uint64_t v2 = open_dprotected_np(a1, 522, 4, 0, 420);
      if ((v2 & 0x80000000) == 0) {
        goto LABEL_10;
      }
      if (*__error() == 13 || *__error() == 1)
      {
        if (unlink(a1) == -1 && *__error() != 2)
        {
          int v8 = __error();
          strerror(*v8);
          CFStringRef v5 = @"Failed to unlink '%s': %s\n";
          goto LABEL_6;
        }
        uint64_t v2 = open_dprotected_np(a1, 522, 4, 0, 420);
        if ((v2 & 0x80000000) == 0)
        {
LABEL_10:
          atomic_store(0, &_restoreLogGrowth);
          _restoreLogFD = v2;
          rotateRestoreLogFD(v2);
          return v2;
        }
      }
      __error();
      uint64_t v7 = __error();
      strerror(*v7);
      CFStringRef v5 = @"Could not open '%s': %s\n";
    }
LABEL_6:
    logfunction("", 0, v5);
    return 0xFFFFFFFFLL;
  }
  return v2;
}

int *rotateRestoreLogFD(int a1)
{
  memset(&v9, 0, sizeof(v9));
  if (fstat(a1, &v9)) {
    return __error();
  }
  flock(a1, 2);
  if (v9.st_size > 3145728)
  {
    v3 = malloc_type_malloc(0x100000uLL, 0xD11D0637uLL);
    if ((((v9.st_size >= 0x100000uLL) + (v9.st_size >> 63) + 1) & 1) != (unint64_t)(v9.st_size - 0x100000) >> 63) {
      off_t v4 = 0;
    }
    else {
      off_t v4 = v9.st_size - 0x100000;
    }
    ssize_t v5 = pread(a1, v3, 0x100000uLL, v4);
    if (v5 >= 1 && (ssize_t v6 = v5, (v7 = (char *)memchr(v3, 10, v5)) != 0))
    {
      size_t v8 = (unsigned char *)v3 - (v7 + 1) + v6;
      pwrite(a1, v7 + 1, v8, 0);
    }
    else
    {
      size_t v8 = 0;
    }
    ftruncate(a1, v8);
    free(v3);
  }
  return (int *)flock(a1, 8);
}

uint64_t closeRestoreLogFile()
{
  uint64_t result = _restoreLogFD;
  if ((_restoreLogFD & 0x80000000) == 0) {
    uint64_t result = close(_restoreLogFD);
  }
  atomic_store(0, &_restoreLogGrowth);
  _restoreLogFD = -2;
  return result;
}

uint64_t checkForRestoreLogFD(int a1, char **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  memset(&v69, 0, sizeof(v69));
  logfunction("", 0, @"entering %s\n", a4, a5, a6, a7, a8, (char)"checkForRestoreLogFD");
  if (fstat(a1, &v69) != -1)
  {
    logfunction("", 0, @"found restore log (size = %llu)\n", v10, v11, v12, v13, v14, v69.st_size);
    if (v69.st_size < 3145728)
    {
      long long v42 = (char *)malloc_type_malloc(v69.st_size + 1, 0xBA40E0B5uLL);
      if (v42)
      {
        long long v26 = v42;
        ssize_t v43 = read(a1, v42, v69.st_size);
        if ((v43 & 0x8000000000000000) == 0)
        {
          ssize_t v44 = v43;
LABEL_21:
          uint64_t result = 0;
          v26[v44] = 0;
          *a2 = v26;
          return result;
        }
        v47 = __error();
        char v67 = strerror(*v47);
        logfunction("", 0, @"unable to read from restore log file: %s\n", v48, v49, v50, v51, v52, v67);
        goto LABEL_28;
      }
    }
    else
    {
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      *(_OWORD *)__str = 0u;
      long long v71 = 0u;
      logfunction("", 0, @"restore log is suspiciously large - truncating\n", v15, v16, v17, v18, v19, v65);
      uint64_t v20 = (char *)malloc_type_malloc(0x300000uLL, 0xCC603D00uLL);
      if (v20)
      {
        long long v26 = v20;
        ssize_t v27 = read(a1, v20, 0x180000uLL);
        if ((v27 & 0x8000000000000000) == 0)
        {
          uint64_t v28 = v27;
          if (lseek(a1, v27 - 3145727, 2) < 0)
          {
            CFStringRef v46 = @"unable to seek in restore log file: %s\n";
            goto LABEL_27;
          }
          long long v29 = &v26[v28];
          ssize_t v30 = read(a1, &v26[v28], 3145727 - v28);
          if (v30 != -1)
          {
            int64_t v31 = v30;
            long long v32 = &v26[v28];
            do
            {
              if (v28 >= 1)
              {
                v26[v28 - 1] = 0;
                long long v33 = strrchr(v26, 10);
                if (v33) {
                  long long v34 = v33 + 1;
                }
                else {
                  long long v34 = v26;
                }
                *long long v34 = 0;
                uint64_t v28 = v34 - v26;
              }
              if (v31 < 1) {
                break;
              }
              long long v35 = (char *)memchr(v29, 10, v31);
              if (!v35)
              {
                int64_t v31 = 0;
                break;
              }
              long long v29 = v35 + 1;
              int64_t v31 = &v32[v31] - (v35 + 1);
              long long v32 = v35 + 1;
            }
            while (v35 + 1 - &v26[v28] < 160);
            snprintf(__str, 0xA0uLL, "--------------------\n------ Truncated %lld bytes ------\n--------------------\n", v69.st_size - (v28 + v31));
            v59 = &v26[v28];
            long long v60 = v77;
            *((_OWORD *)v59 + 6) = v76;
            *((_OWORD *)v59 + 7) = v60;
            long long v61 = v79;
            *((_OWORD *)v59 + 8) = v78;
            *((_OWORD *)v59 + 9) = v61;
            long long v62 = v73;
            *((_OWORD *)v59 + 2) = v72;
            *((_OWORD *)v59 + 3) = v62;
            long long v63 = v75;
            *((_OWORD *)v59 + 4) = v74;
            *((_OWORD *)v59 + 5) = v63;
            long long v64 = v71;
            *(_OWORD *)v59 = *(_OWORD *)__str;
            *((_OWORD *)v59 + 1) = v64;
            ssize_t v44 = strlen(__str) + v28;
            if (v31)
            {
              if (v29 > &v26[v44])
              {
                memmove(&v26[v44], v29, v31);
                v44 += v31;
              }
            }
            goto LABEL_21;
          }
        }
        CFStringRef v46 = @"unable to read from restore log file: %s\n";
LABEL_27:
        v53 = __error();
        char v68 = strerror(*v53);
        logfunction("", 0, v46, v54, v55, v56, v57, v58, v68);
LABEL_28:
        free(v26);
        return 0xFFFFFFFFLL;
      }
    }
    logfunction("", 0, @"unable to allocate memory to read restore log\n", v21, v22, v23, v24, v25, v65);
    return 0xFFFFFFFFLL;
  }
  long long v36 = __error();
  char v66 = strerror(*v36);
  logfunction("", 1, @"fstat on restore log failed: %s\n", v37, v38, v39, v40, v41, v66);
  return 0xFFFFFFFFLL;
}

size_t writeToRestoreLogFile(void *__buf, size_t __nbyte)
{
  size_t v2 = __nbyte;
  int v3 = _restoreLogFD;
  if ((_restoreLogFD & 0x80000000) == 0)
  {
    ssize_t v4 = write(_restoreLogFD, __buf, __nbyte);
    size_t v2 = v4;
    if (v4 >= 1)
    {
      uint64_t v5 = atomic_fetch_add_explicit((atomic_ullong *volatile)&_restoreLogGrowth, v4, memory_order_relaxed) + v4;
      if (v5 > 0x10000)
      {
        atomic_fetch_add_explicit((atomic_ullong *volatile)&_restoreLogGrowth, -v5, memory_order_relaxed);
        rotateRestoreLogFD(v3);
      }
    }
  }
  return v2;
}

uint64_t submitRestoreLogFile(__CFError *a1, uint64_t a2, const char *a3, const char *a4)
{
  return submitRestoreLogFileToLogDir(a1, a2, a3, a4, 0);
}

uint64_t submitRestoreLogFileToLogDir(__CFError *a1, uint64_t a2, const char *a3, const char *a4, const __CFString *a5)
{
  v124 = 0;
  bzero(v138, 0x400uLL);
  if (a3) {
    uint64_t v10 = a3;
  }
  else {
    uint64_t v10 = "/private/var/MobileSoftwareUpdate/restore.log";
  }
  int v11 = open(v10, 2);
  int v18 = v11;
  if (v11 == -1)
  {
    ssize_t v27 = __error();
    strerror(*v27);
    logfunction("", 1, @"unable to open restore log (%s): %s (%d)\n", v28, v29, v30, v31, v32, (char)v10);
    uint64_t v25 = 0;
    goto LABEL_12;
  }
  int v19 = checkForRestoreLogFD(v11, &v124, v12, v13, v14, v15, v16, v17);
  uint64_t v25 = v124;
  if (v19) {
    BOOL v26 = 1;
  }
  else {
    BOOL v26 = v124 == 0;
  }
  if (v26)
  {
    logfunction("", 1, @"unable to read from restore log file\n", v20, v21, v22, v23, v24, v115);
LABEL_12:
    CFStringRef v33 = 0;
    goto LABEL_43;
  }
  rotateRestoreLogFD(v18);
  CFStringRef v34 = (const __CFString *)MGCopyAnswer();
  CFStringRef v33 = v34;
  if (!v34)
  {
    CFStringRef v48 = @"failed to query device serial number\n";
LABEL_42:
    logfunction("", 1, v48, v35, v36, v37, v38, v39, v115);
LABEL_43:
    free(v25);
    CFStringRef v50 = 0;
    CFStringRef v51 = 0;
    uint64_t v52 = 0xFFFFFFFFLL;
    if (!v33) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  if (CFStringGetLength(v34) < 1)
  {
    CFStringRef v49 = @"device has no serial number for scrubbing\n";
LABEL_23:
    logfunction("", 1, v49, v40, v41, v42, v43, v44, v115);
    goto LABEL_24;
  }
  *(_OWORD *)buffer = 0u;
  long long v140 = 0u;
  if (CFStringGetCString(v33, buffer, 32, 0x8000100u) != 1)
  {
    CFStringRef v49 = @"unable to get c string for device serial number\n";
    goto LABEL_23;
  }
  long long v45 = strcasestr(v25, buffer);
  if (v45)
  {
    CFStringRef v46 = v45;
    do
    {
      size_t v47 = strlen(buffer);
      memset(v46, 88, v47);
      CFStringRef v46 = strcasestr(v46, buffer);
    }
    while (v46);
  }
LABEL_24:
  if (_AMRRegexSubstitution(v25, "'[^\n]*' has been added", "'<<File name>>' has been added ")
    || _AMRRegexSubstitution(v25, "verify_callback: '[^\n]*' did not verify and is not on the exception list.", "verify_callback: '<<File name>>' did not verify and is not on the exception list.")|| _AMRRegexSubstitution(v25, "'[^\n]*' is on the exception list", "'<<File name>>' is on the exception list")
    || _AMRRegexSubstitution(v25, "[:-][0-9a-fA-F]{8}", "XXXX")
    || _AMRRegexSubstitution(v25, "[:-] [0-9a-fA-F]{8}", "XXXX")
    || _AMRRegexSubstitution(v25, "[:-] [a-zA-Z0-9]{18}[[:>:]]", "XXXX")
    || _AMRRegexSubstitution(v25, "[:-][a-zA-Z0-9]{8}[:-][a-zA-Z0-9]{16}", "XXXX")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{40}", "<<<<<<<<<<<<<<<<<<UDID>>>>>>>>>>>>>>>>>>")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{20}", "<<<<<<<<ICCID>>>>>>>")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{19}", "<<<<<<<ICCID>>>>>>>")
    || _AMRRegexSubstitution(v25, "[0-9]{15}", "<<<<<IMEI>>>>>>")
    || _AMRRegexSubstitution(v25, "ecid=0x[0-9a-fA-F]*,", "ecid=0xXXXXXXXXXXX")
    || _AMRRegexSubstitution(v25, "\"ApECID\"[^\n]*value = [+-][0-9<>IMEI]*", "\"ApECID\"} = X {X")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{14}", "<<<<<MEID>>>>>")
    || _AMRRegexSubstitution(v25, "\"ChipSerialNo\"[^\n]*bytes = 0x[0-9a-fA-F]*}", "\"ChipSerialNo\" ")
    || _AMRRegexSubstitution(v25, "snum=0x[0-9a-fA-F]*,", "snum=0xXXXXXXXX")
    || _AMRRegexSubstitution(v25, "BbSNUM[^\n]*", "\"BbSNUM\"} = 0xXXXXXXXX }"))
  {
    goto LABEL_41;
  }
  err = a1;
  size_t v54 = strlen(v25);
  if (v54)
  {
    size_t v55 = v54;
    uint64_t v56 = v25;
    do
    {
      __darwin_ct_rune_t v57 = *v56;
      if (v57 < 0)
      {
        if (!__maskrune(*v56, 0x40000uLL))
        {
          __uint32_t v58 = __maskrune(v57, 0x4000uLL);
LABEL_60:
          if (!v58) {
            *uint64_t v56 = 46;
          }
        }
      }
      else if ((_DefaultRuneLocale.__runetype[v57] & 0x40000) == 0)
      {
        __uint32_t v58 = _DefaultRuneLocale.__runetype[v57] & 0x4000;
        goto LABEL_60;
      }
      ++v56;
      --v55;
    }
    while (v55);
  }
  CFStringRef cf = CFStringCreateWithCString(kCFAllocatorDefault, v25, 0x8000100u);
  if (!cf)
  {
LABEL_41:
    CFStringRef v48 = @"failed to scrub log\n";
    goto LABEL_42;
  }
  theDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!theDict)
  {
    logfunction("", 1, @"failed to create crashReporterDictionary\n", v59, v60, v61, v62, v63, v115);
    CFURLRef v67 = 0;
    CFURLRef v68 = 0;
    CFStringRef v69 = 0;
    CFStringRef v118 = 0;
LABEL_85:
    CFStringRef erra = 0;
    goto LABEL_103;
  }
  if (err)
  {
    CFDictionaryRef v64 = CFErrorCopyUserInfo(err);
    if (v64)
    {
      CFDictionaryRef v65 = v64;
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v64, @"target_update");
      char Code = CFErrorGetCode(err);
      CFRelease(v65);
    }
    else
    {
      char Code = CFErrorGetCode(err);
      CFStringRef Value = 0;
    }
  }
  else
  {
    CFStringRef Value = 0;
    char Code = -1;
  }
  CFStringRef v70 = @"Unknown";
  if (!Value) {
    CFStringRef Value = @"Unknown";
  }
  uint64_t v71 = MGCopyAnswer();
  if (v71) {
    CFStringRef v70 = (const __CFString *)v71;
  }
  CFDictionarySetValue(theDict, @"itunes_version", v70);
  CFDictionarySetValue(theDict, @"restore_payload_version", Value);
  CFDictionarySetValue(theDict, @"restore_type", @"OTAUpdate");
  CFDictionarySetValue(theDict, @"name", @"iPhoneRestore");
  CFStringRef v118 = v70;
  CFDictionarySetValue(theDict, @"os_version", v70);
  CFDictionarySetValue(theDict, @"bug_type", @"183");
  CFStringRef erra = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%ld");
  if (!erra)
  {
    logfunction("", 1, @"failed to create CFString from %ld\n", v72, v73, v74, v75, v76, Code);
    CFURLRef v67 = 0;
    CFURLRef v68 = 0;
    CFStringRef v69 = 0;
    goto LABEL_85;
  }
  CFDictionarySetValue(theDict, @"restore_error", erra);
  if (!a4)
  {
    CFAllocatorRef Default = CFAllocatorGetDefault();
    CFURLRef v68 = CFURLCreateWithFileSystemPath(Default, @"/private/var/mobile/Library/Logs/CrashReporter", kCFURLPOSIXPathStyle, 0);
    goto LABEL_87;
  }
  CFStringRef v77 = CFStringCreateWithCString(0, a4, 0x8000100u);
  if (!v77)
  {
    CFStringRef v112 = @"failed to create dataPartitionMountPointStr\n";
LABEL_99:
    logfunction("", 1, v112, v78, v79, v80, v81, v82, Code);
    CFURLRef v67 = 0;
    CFURLRef v68 = 0;
LABEL_102:
    CFStringRef v69 = 0;
    goto LABEL_103;
  }
  CFStringRef v83 = v77;
  CFAllocatorRef v84 = CFAllocatorGetDefault();
  CFURLRef v85 = CFURLCreateWithFileSystemPath(v84, v83, kCFURLPOSIXPathStyle, 0);
  CFRelease(v83);
  if (!v85)
  {
    CFStringRef v112 = @"failed to create mountPointURL\n";
    goto LABEL_99;
  }
  if (a5) {
    CFStringRef v86 = a5;
  }
  else {
    CFStringRef v86 = @"/mobile/Library/Logs/CrashReporter";
  }
  CFURLRef v68 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v85, v86, 1u);
  CFRelease(v85);
  if (!v68)
  {
    CFStringRef v92 = @"mountPointURL CFURLCreateCopyAppendingPathComponent failed\n";
LABEL_101:
    logfunction("", 1, v92, v87, v88, v89, v90, v91, Code);
    CFURLRef v67 = 0;
    goto LABEL_102;
  }
LABEL_87:
  uint64_t v137 = 0;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  *(_OWORD *)v125 = 0u;
  long long v126 = 0u;
  time_t v123 = 0;
  if (a2 <= 0) {
    a2 = time(0);
  }
  time_t v123 = a2;
  v94 = localtime(&v123);
  if (!v94)
  {
    CFStringRef v92 = @"localtime failed\n";
    goto LABEL_101;
  }
  if (!strftime(v125, 0xC8uLL, "%F-%H-%M-%S", v94))
  {
    CFStringRef v92 = @"strftime failed\n";
    goto LABEL_101;
  }
  CFAllocatorRef v95 = CFAllocatorGetDefault();
  v116 = v125;
  CFStringRef v69 = CFStringCreateWithFormat(v95, 0, @"OTAUpdate-%s.ips");
  if (!v69)
  {
    logfunction("", 1, @"failed to create crashReporterFileName\n", v96, v97, v98, v99, v100, (char)v125);
    CFURLRef v67 = 0;
    goto LABEL_103;
  }
  CFURLRef v101 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v68, v69, 0);
  CFURLRef v67 = v101;
  if (!v101)
  {
    CFStringRef v113 = @"failed to create log file name\n";
LABEL_116:
    logfunction("", 1, v113, v102, v103, v104, v105, v106, (char)v116);
LABEL_103:
    free(v25);
    CFRelease(cf);
    uint64_t v52 = 0xFFFFFFFFLL;
    if (!theDict) {
      goto LABEL_105;
    }
    goto LABEL_104;
  }
  if (!CFURLGetFileSystemRepresentation(v101, 1u, v138, 1024))
  {
    LOBYTE(v116) = (_BYTE)v67;
    CFStringRef v113 = @"Could not get file path from %@\n";
    goto LABEL_116;
  }
  logfunction("", 1, @"Trying to write crashreporter log file %s\n", v102, v103, v104, v105, v106, (char)v138);
  if (store_ips_with_mode(theDict, cf, (const char *)v138))
  {
    logfunction("", 1, @"failed to create %s\n", v107, v108, v109, v110, v111, (char)v138);
    goto LABEL_103;
  }
  int v114 = ftruncate(v18, 0);
  if (a4 || v114) {
    unlink(v10);
  }
  free(v25);
  CFRelease(cf);
  uint64_t v52 = 0;
LABEL_104:
  CFRelease(theDict);
LABEL_105:
  if (v67) {
    CFRelease(v67);
  }
  if (v68) {
    CFRelease(v68);
  }
  if (v69) {
    CFRelease(v69);
  }
  CFStringRef v50 = v118;
  CFStringRef v51 = erra;
  if (v33) {
LABEL_44:
  }
    CFRelease(v33);
LABEL_45:
  if (v50) {
    CFRelease(v50);
  }
  if (v51) {
    CFRelease(v51);
  }
  if (v18 != -1 && close(v18) == -1) {
    submitRestoreLogFileToLogDir_cold_1();
  }
  return v52;
}

uint64_t store_ips_with_mode(const __CFDictionary *a1, const __CFString *a2, const char *a3)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  int v7 = open(a3, 1537);
  if (v7 != -1)
  {
    int v13 = v7;
    CFStringAppend(Mutable, @"{");
    CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)append_item_to_string, Mutable);
    CFStringTrim(Mutable, @",");
    CFStringAppend(Mutable, @"}\n");
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, Mutable, 0x8000100u, 0x3Fu);
    CFDataRef v20 = ExternalRepresentation;
    if (!ExternalRepresentation) {
      goto LABEL_11;
    }
    size_t Length = CFDataGetLength(ExternalRepresentation);
    BytePtr = CFDataGetBytePtr(v20);
    if (write(v13, BytePtr, Length) != Length)
    {
      CFStringRef v34 = @"write hdr\n";
      goto LABEL_15;
    }
    CFRelease(v20);
    CFDataRef v23 = CFStringCreateExternalRepresentation(0, a2, 0x8000100u, 0x3Fu);
    CFDataRef v20 = v23;
    if (v23)
    {
      size_t v24 = CFDataGetLength(v23);
      uint64_t v25 = CFDataGetBytePtr(v20);
      if (write(v13, v25, v24) == v24)
      {
        BOOL v26 = getpwnam("mobile");
        if (v26)
        {
          if (!chown(a3, v26->pw_uid, v26->pw_gid))
          {
            uint64_t v33 = 0;
LABEL_17:
            close(v13);
            if (!Mutable) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
          ssize_t v27 = __error();
          strerror(*v27);
          logfunction("", 1, @"unable to chown file '%s': %s\n\n", v28, v29, v30, v31, v32, (char)a3);
LABEL_16:
          uint64_t v33 = 0xFFFFFFFFLL;
          goto LABEL_17;
        }
        CFStringRef v34 = @"unable to look up mobile user uid/gid. Defaulting to 501/501\n\n";
      }
      else
      {
        CFStringRef v34 = @"write payload\n";
      }
    }
    else
    {
LABEL_11:
      CFStringRef v34 = @"CFStringCreateExternalRepresentation\n";
    }
LABEL_15:
    logfunction("", 1, v34, v15, v16, v17, v18, v19, 164);
    goto LABEL_16;
  }
  logfunction("", 1, @"open\n", v8, v9, v10, v11, v12, 164);
  CFDataRef v20 = 0;
  uint64_t v33 = 0xFFFFFFFFLL;
  if (Mutable) {
LABEL_18:
  }
    CFRelease(Mutable);
LABEL_19:
  if (v20) {
    CFRelease(v20);
  }
  return v33;
}

int *fixCrashReporterDir(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  logfunction("", 1, @"%s - starting\n", a4, a5, a6, a7, a8, (char)"fixCrashReporterDir");
  memset(&v50, 0, sizeof(v50));
  if (lstat("/private/var/mobile/Library/Logs/CrashReporter", &v50))
  {
    if (*__error() != 2) {
      return logfunction("", 1, @"%s failed to stat %s\n", v13, v14, v15, v16, v17, (char)"fixCrashReporterDir");
    }
    logfunction("", 1, @"%s could not find %s, continue\n", v13, v14, v15, v16, v17, (char)"fixCrashReporterDir");
  }
  else if ((v50.st_mode & 0xF000) == 0xA000)
  {
    return logfunction("", 1, @"%s - already fixed\n", v8, v9, v10, v11, v12, (char)"fixCrashReporterDir");
  }
  if (!lstat("/private/var/mobile/Library/Logs/CrashReporterTmp", &v50))
  {
    if ((v50.st_mode & 0xF000) == 0xA000)
    {
      logfunction("", 1, @"%s - tmp dir exist as link, unlink\n", v19, v20, v21, v22, v23, (char)"fixCrashReporterDir");
      unlink("/private/var/mobile/Library/Logs/CrashReporterTmp");
    }
    else
    {
      logfunction("", 1, @"%s - tmp dir exist, remove\n", v19, v20, v21, v22, v23, (char)"fixCrashReporterDir");
      removefile("/private/var/mobile/Library/Logs/CrashReporterTmp", 0, 1u);
    }
  }
  logfunction("", 1, @"%s create directory %s\n", v19, v20, v21, v22, v23, (char)"fixCrashReporterDir");
  int v24 = mkpath_np("/private/var/MobileSoftwareUpdate//mobile/Library/Logs", 0x1C0u);
  if (v24 && v24 != 17) {
    return logfunction("", 1, @"%s unable to create directory %s: %d\n", v25, v26, v27, v28, v29, (char)"fixCrashReporterDir");
  }
  logfunction("", 1, @"%s symlink %s to %s\n", v25, v26, v27, v28, v29, (char)"fixCrashReporterDir");
  if (symlink("/private/var/MobileSoftwareUpdate//mobile/Library/Logs/CrashReporter", "/private/var/mobile/Library/Logs/CrashReporterTmp"))
  {
    return logfunction("", 1, @"%s failed to symlink %s to %s\n", v30, v31, v32, v33, v34, (char)"fixCrashReporterDir");
  }
  logfunction("", 1, @"%s swap %s with %s\n", v30, v31, v32, v33, v34, (char)"fixCrashReporterDir");
  if (renamex_np("/private/var/mobile/Library/Logs/CrashReporterTmp", "/private/var/mobile/Library/Logs/CrashReporter", 2u))
  {
    logfunction("", 1, @"%s swap %s with %s failed with result:%d\n", v35, v36, v37, v38, v39, (char)"fixCrashReporterDir");
    return (int *)unlink("/private/var/mobile/Library/Logs/CrashReporterTmp");
  }
  else
  {
    logfunction("", 1, @"%s copy from %s to %s\n", v35, v36, v37, v38, v39, (char)"fixCrashReporterDir");
    if (copyfile("/private/var/mobile/Library/Logs/CrashReporterTmp", "/private/var/MobileSoftwareUpdate//mobile/Library/Logs/", 0, 0xC800Fu))
    {
      return logfunction("", 1, @"%s failed to copy from %s to %s\n", v40, v41, v42, v43, v44, (char)"fixCrashReporterDir");
    }
    else
    {
      logfunction("", 1, @"%s removing %s\n", v40, v41, v42, v43, v44, (char)"fixCrashReporterDir");
      if (removefile("/private/var/mobile/Library/Logs/CrashReporterTmp", 0, 1u)) {
        return logfunction("", 1, @"%s failed to remove %s\n", v45, v46, v47, v48, v49, (char)"fixCrashReporterDir");
      }
      else {
        return logfunction("", 1, @"%s is done\n", v45, v46, v47, v48, v49, (char)"fixCrashReporterDir");
      }
    }
  }
}

uint64_t _AMRRegexSubstitution(const char *a1, const char *a2, const char *a3)
{
  char v4 = (char)a2;
  memset(&v23, 0, sizeof(v23));
  if (regcomp(&v23, a2, 1))
  {
    logfunction("", 1, @"unable to compile regex '%s': %d\n", v6, v7, v8, v9, v10, v4);
    return 0xFFFFFFFFLL;
  }
  else
  {
    __pmatch.rm_so = 0;
    for (__pmatch.rm_eo = 0; ; a1 += __pmatch.rm_eo)
    {
      int v12 = regexec(&v23, a1, 1uLL, &__pmatch, 0);
      if (v12) {
        break;
      }
      size_t v18 = __pmatch.rm_eo - __pmatch.rm_so;
      int64_t v19 = strlen(a3);
      int v20 = LODWORD(__pmatch.rm_eo) - LODWORD(__pmatch.rm_so) - v19;
      if (v19 < __pmatch.rm_eo - __pmatch.rm_so) {
        size_t v18 = v19;
      }
      memcpy((void *)&a1[__pmatch.rm_so], a3, v18);
      if (v20 >= 1)
      {
        memset((void *)&a1[__pmatch.rm_so + v18], 62, v20);
        a1 += v20;
      }
    }
    if (v12 == 1)
    {
      uint64_t v11 = 0;
    }
    else
    {
      logfunction("", 1, @"regex matching failed for '%s': %d\n", v13, v14, v15, v16, v17, v4);
      uint64_t v11 = 0xFFFFFFFFLL;
    }
    regfree(&v23);
  }
  return v11;
}

void append_item_to_string(uint64_t a1, uint64_t a2, CFMutableStringRef theString)
{
}

uint64_t MSUDemotionCleanup(CFErrorRef *a1)
{
  uint64_t v44 = 0;
  size_t v2 = +[NSData dataWithContentsOfFile:@"/private/var/MobileSoftwareUpdate/DemotionRecord.plist" options:0 error:&v44];
  if (v2)
  {
    id v6 = +[NSPropertyListSerialization propertyListWithData:v2 options:2 format:0 error:&v44];
    if (!v6)
    {
      error_internal_CFStringRef cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 23, v44, 0, @"failed to deserialize demotion record", v3, v4, v5, v34);
      if (!a1) {
        goto LABEL_13;
      }
LABEL_12:
      *a1 = error_internal_cf;
      return 1;
    }
  }
  else
  {
    if ([v44 code] != (id)260)
    {
      error_internal_CFStringRef cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 23, v44, 0, @"failed to read demotion record", v8, v9, v10, v34);
      if (!a1)
      {
LABEL_13:
        CFRelease(error_internal_cf);
        return 1;
      }
      goto LABEL_12;
    }
    id v6 = +[NSMutableDictionary dictionary];
    if (!v6) {
      return 1;
    }
  }
  if (![v6 count]) {
    return 1;
  }
  if ((objc_msgSend(objc_msgSend(v6, "objectForKeyedSubscript:", @"iTunesStoreAutoUpdatesEnabled"), "BOOLValue") & 1) != 0|| ((CFPreferencesSetValue(@"AutoUpdatesEnabled", 0, @"com.apple.itunesstored", @"mobile", kCFPreferencesAnyHost), CFPreferencesSynchronize(@"com.apple.itunesstored", @"mobile", kCFPreferencesAnyHost), (uint64_t v11 = getpwnam("mobile")) == 0)? (pw_uid = 501, pw_gid = 501): (pw_uid = v11->pw_uid, pw_gid = v11->pw_gid), !chown("/private/var/mobile/Library/Preferences/com.apple.itunesstored.plist", pw_uid, pw_gid)))
  {
    uint64_t v44 = 0;
    uint64_t v45 = &v44;
    uint64_t v46 = 0x2020000000;
    uint64_t v47 = 0;
    object = dispatch_queue_create("com.apple.MobileSoftwareUpdate.ApplicationRestore", 0);
    uint64_t v21 = dispatch_group_create();
    id v36 = objc_alloc_init((Class)SSSoftwareLibrary);
    uint64_t v35 = a1;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v22 = [v6 allKeys];
    id v23 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v41;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v41 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          id v27 = [v6 objectForKeyedSubscript:v26];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ([v27 isEqualToArray:&off_100065098] & 1) != 0)
          {
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472;
            v39[2] = __MSUDemotionCleanup_block_invoke;
            v39[3] = &unk_100059090;
            v39[4] = object;
            v39[5] = v26;
            v39[6] = v21;
            v39[7] = &v44;
            [v36 restoreDemotedApplicationWithBundleIdentifier:v26 options:0 completionBlock:v39];
            dispatch_group_enter(v21);
          }
        }
        id v23 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v23);
    }
    dispatch_group_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v21);
    dispatch_release(object);
    uint64_t v28 = (__CFError *)v45[3];
    if (v28)
    {
      if (v35)
      {
        uint64_t v14 = 0;
        *uint64_t v35 = v28;
LABEL_40:
        _Block_object_dispose(&v44, 8);
        return v14;
      }
    }
    else
    {
      uint64_t v38 = 0;
      if (-[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", @"/private/var/MobileSoftwareUpdate/DemotionRecord.plist", &v38)|| [v38 code] == (id)4)
      {
        uint64_t v14 = 1;
        goto LABEL_40;
      }
      CFErrorRef v32 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 23, v38, 0, @"failed to remove demotion record", v29, v30, v31, v34);
      if (v35)
      {
        uint64_t v14 = 0;
        *uint64_t v35 = v32;
        goto LABEL_40;
      }
      CFRelease(v32);
    }
    uint64_t v14 = 0;
    goto LABEL_40;
  }
  uint64_t v15 = __error();
  char v16 = strerror(*v15);
  CFErrorRef v20 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 23, 0, 0, @"failed to chown(2) itunesstored prefs file: %s", v17, v18, v19, v16);
  if (a1)
  {
    uint64_t v14 = 0;
    *a1 = v20;
  }
  else
  {
    CFRelease(v20);
    return 0;
  }
  return v14;
}

void sub_100005790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void __MSUDemotionCleanup_block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if ((a2 & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __MSUDemotionCleanup_block_invoke_2;
    block[3] = &unk_100059068;
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(NSObject **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    block[4] = a3;
    block[5] = v6;
    block[6] = v4;
    dispatch_sync(v5, block);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

CFErrorRef __MSUDemotionCleanup_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v9) {
    CFRelease(v9);
  }
  CFErrorRef result = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 23, *(const void **)(a1 + 32), 0, @"failed to enqueue restore of application '%@': %@", a6, a7, a8, *(void *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

BOOL is_baseband_device()
{
  CFDictionaryRef v0 = IOServiceNameMatching("baseband");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  io_service_t v2 = MatchingService;
  if (MatchingService) {
    IOObjectRelease(MatchingService);
  }
  return v2 != 0;
}

uint64_t msu_partition_execution_logger(const char *a1, int a2)
{
  return fprintf(__stderrp, "%.*s\n", a2, a1);
}

void msu_partition_logger(uint64_t a1, va_list a2)
{
  if (a1)
  {
    CFStringRef v3 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s\n", a1);
    logfunctionv("", 1, v3, a2);
    if (v3)
    {
      CFRelease(v3);
    }
  }
}

CFPropertyListRef load_plist_with_mutability_option(CFURLRef fileURL, CFOptionFlags a2)
{
  if (!fileURL) {
    return 0;
  }
  CFStringRef v3 = CFReadStreamCreateWithFile(kCFAllocatorDefault, fileURL);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  if (CFReadStreamOpen(v3)) {
    CFPropertyListRef v5 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v4, 0, a2, 0, 0);
  }
  else {
    CFPropertyListRef v5 = 0;
  }
  CFReadStreamClose(v4);
  CFRelease(v4);
  return v5;
}

CFPropertyListRef load_dict(char *cStr)
{
  if (!cStr) {
    return 0;
  }
  CFStringRef v1 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v1) {
    return 0;
  }
  CFStringRef v2 = v1;
  CFURLRef v3 = CFURLCreateWithFileSystemPath(0, v1, kCFURLPOSIXPathStyle, 0);
  if (v3)
  {
    CFURLRef v4 = v3;
    CFPropertyListRef plist_with_mutability_option = load_plist_with_mutability_option(v3, 0);
    CFRelease(v4);
  }
  else
  {
    CFPropertyListRef plist_with_mutability_option = 0;
  }
  CFRelease(v2);
  return plist_with_mutability_option;
}

uint64_t size_directory(char *a1)
{
  v6[0] = a1;
  v6[1] = 0;
  CFStringRef v1 = fts_open(v6, 21, 0);
  if (!v1) {
    err(1, "fts_open(%s)");
  }
  CFStringRef v2 = v1;
  CFURLRef v3 = fts_read(v1);
  for (i = 0; v3; CFURLRef v3 = fts_read(v2))
  {
    if (v3->fts_info == 8) {
      i += v3->fts_statp->st_blocks << 9;
    }
  }
  if (fts_close(v2)) {
    err(1, "fts_close(%s)");
  }
  return i;
}

uint64_t msu_execute_command_with_callback(char *const *a1, uint64_t a2, uint64_t a3)
{
  ramrod_execute_config_alloc();
  uint64_t v7 = (const void **)v6;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __msu_execute_command_with_callback_block_invoke;
  v16[3] = &__block_descriptor_48_e13_v24__0r_v8Q16l;
  v16[4] = a2;
  v16[5] = a3;
  ramrod_execute_config_set_output_block(v6, v16);
  uint64_t v14 = ramrod_execute_command_with_config(a1, v7, v8, v9, v10, v11, v12, v13);
  ramrod_execute_config_free(v7);
  return v14;
}

uint64_t __msu_execute_command_with_callback_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

uint64_t execute_command(char *const *a1, uint64_t a2)
{
  return msu_execute_command_with_callback(a1, a2, 0);
}

uint64_t mkparentdir(uint64_t a1, mode_t a2)
{
  bzero(&v8, 0x400uLL);
  if (a1)
  {
    __strlcpy_chk();
    if (v8 == 47) {
      CFURLRef v4 = v9;
    }
    else {
      CFURLRef v4 = &v8;
    }
    do
    {
      if (!*v4) {
        break;
      }
      CFPropertyListRef v5 = strchr(v4, 47);
      CFURLRef v4 = v5;
      if (v5 > &v8)
      {
        memset(&v7, 0, sizeof(v7));
        *CFPropertyListRef v5 = 0;
        if (lstat(&v8, &v7) == -1 && mkdir(&v8, a2) == -1 && *__error() != 17) {
          return 0xFFFFFFFFLL;
        }
        *v4++ = 47;
      }
    }
    while (v4);
    return 0;
  }
  else
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
}

CFErrorRef _vcreate_error_internal_with_userinfo_cf(const __CFString *a1, CFIndex a2, const void *a3, const void *a4, const __CFDictionary *a5, const __CFString *a6, va_list a7)
{
  int v14 = *__error();
  if (a5) {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, a5);
  }
  else {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  char v16 = MutableCopy;
  if (MutableCopy)
  {
    CFStringRef v17 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, a6, a7);
    if (v17)
    {
      CFStringRef v23 = v17;
      logfunction("", 1, @"%@ error %ld - %@\n", v18, v19, v20, v21, v22, (char)a1);
      CFDictionaryAddValue(v16, kCFErrorLocalizedDescriptionKey, v23);
      CFRelease(v23);
    }
    if (a3) {
      CFDictionaryAddValue(v16, kCFErrorUnderlyingErrorKey, a3);
    }
    if (a4) {
      CFDictionaryAddValue(v16, @"target_update", a4);
    }
    CFErrorRef v24 = CFErrorCreate(kCFAllocatorDefault, a1, a2, v16);
    CFRelease(v16);
  }
  else
  {
    CFErrorRef v24 = 0;
  }
  *__error() = v14;
  return v24;
}

CFErrorRef _create_error_internal_cf(const __CFString *a1, CFIndex a2, const void *a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return _vcreate_error_internal_with_userinfo_cf(a1, a2, a3, a4, 0, a5, &a9);
}

CFDictionaryRef cferror_to_dictionary(__CFError *a1)
{
  return cferror_to_dictionary_embedded(a1, 0);
}

CFDictionaryRef cferror_to_dictionary_embedded(__CFError *a1, int a2)
{
  CFIndex valuePtr = CFErrorGetCode(a1);
  CFErrorDomain Domain = CFErrorGetDomain(a1);
  CFDictionaryRef v5 = CFErrorCopyUserInfo(a1);
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &valuePtr);
  if (!v6)
  {
    logfunction("", 1, @"could not create cfnumber\n", v7, v8, v9, v10, v11, v29);
    CFDictionaryRef v19 = 0;
    if (!v5) {
      return v19;
    }
    goto LABEL_22;
  }
  CFNumberRef v12 = v6;
  *(_OWORD *)keys = *(_OWORD *)off_1000590D0;
  long long v35 = *(_OWORD *)&off_1000590E0;
  values[0] = v6;
  values[1] = (void *)Domain;
  CFDictionaryRef v32 = v5;
  uint64_t v33 = 0;
  if (!v5)
  {
    int v14 = 0;
    CFIndex v20 = 2;
    if (!a2) {
      goto LABEL_17;
    }
    uint64_t v21 = &v32;
    uint64_t v22 = 3;
    goto LABEL_16;
  }
  CFStringRef Value = (__CFDictionary *)CFDictionaryGetValue(v5, kCFErrorUnderlyingErrorKey);
  int v14 = Value;
  if (Value)
  {
    CFTypeID v15 = CFGetTypeID(Value);
    if (v15 == CFErrorGetTypeID() && (uint64_t v16 = cferror_to_dictionary_embedded(v14, 0)) != 0)
    {
      CFStringRef v17 = (const void *)v16;
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v5);
      int v14 = MutableCopy;
      if (MutableCopy)
      {
        CFDictionarySetValue(MutableCopy, kCFErrorUnderlyingErrorKey, v17);
        CFDictionaryRef v32 = v14;
      }
      CFRelease(v17);
    }
    else
    {
      int v14 = 0;
    }
  }
  CFIndex v20 = 3;
  if (a2)
  {
    uint64_t v21 = (CFBooleanRef *)&v33;
    uint64_t v22 = 4;
LABEL_16:
    keys[v20] = @"_MSU_Embedded_Error";
    *uint64_t v21 = kCFBooleanTrue;
    CFIndex v20 = v22;
  }
LABEL_17:
  CFDictionaryRef v19 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, v20, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v19) {
    logfunction("", 1, @"could not create cfdictionary\n", v23, v24, v25, v26, v27, v29);
  }
  if (v14) {
    CFRelease(v14);
  }
  CFRelease(v12);
  if (v5) {
LABEL_22:
  }
    CFRelease(v5);
  return v19;
}

CFStringRef copy_dictionary_to_cferror(const void *a1)
{
  CFIndex valuePtr = 0;
  if (!a1) {
    return 0;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    CFStringRef v21 = @"marshalled cferror is not a dictionary.\n";
LABEL_17:
    logfunction("", 1, v21, v3, v4, v5, v6, v7, v23);
    return 0;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a1, @"Code");
  if (!Value)
  {
    CFStringRef v21 = @"marshalled cferror is incomplete. missing code.\n";
    goto LABEL_17;
  }
  if (!CFNumberGetValue(Value, kCFNumberCFIndexType, &valuePtr))
  {
    CFStringRef v21 = @"code not convert cfnumber code to cfindex\n";
    goto LABEL_17;
  }
  CFStringRef v14 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"Domain");
  if (!v14)
  {
    logfunction("", 1, @"marshalled cferror is incomplete. missing domain.\n", v9, v10, v11, v12, v13, v23);
    return v14;
  }
  CFDictionaryRef v15 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a1, @"UserInfo");
  if (!v15)
  {
    CFStringRef v21 = @"marshalled cferror is incomplete. missing \"UserInfo\".\n";
    goto LABEL_17;
  }
  CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v15);
  if (!MutableCopy)
  {
    CFStringRef v21 = @"code not create mutable copy of userInfo\n";
    goto LABEL_17;
  }
  CFStringRef v17 = MutableCopy;
  uint64_t v18 = CFDictionaryGetValue(MutableCopy, kCFErrorUnderlyingErrorKey);
  CFDictionaryRef v19 = (const void *)copy_dictionary_to_cferror(v18);
  if (v19)
  {
    CFIndex v20 = v19;
    CFDictionarySetValue(v17, kCFErrorUnderlyingErrorKey, v19);
    CFRelease(v20);
  }
  CFStringRef v14 = (const __CFString *)CFErrorCreate(kCFAllocatorDefault, v14, valuePtr, v17);
  CFRelease(v17);
  return v14;
}

uint64_t calculate_snapshot_overhead(uint64_t a1)
{
  return (uint64_t)((double)a1 * 1.05 + 293601280.0);
}

BOOL write_SMC_key(char a1)
{
  CFDictionaryRef v2 = IOServiceMatching("AppleSMC");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  io_object_t v9 = MatchingService;
  if (!&_SMCOpenConnection)
  {
    BOOL v10 = 1;
    logfunction("", 1, @"No SMC dylib. Bailing with success.\n", v4, v5, v6, v7, v8, v34);
    if (v9) {
      IOObjectRelease(v9);
    }
    return v10;
  }
  if (!MatchingService)
  {
    logfunction("", 1, @"Couldn't find matching SMC service. Bailing.\n\n", v4, v5, v6, v7, v8, v34);
    return 0;
  }
  if (!SMCOpenConnection())
  {
    logfunction("", 1, @"Failed to open SMC connection. Bailing.\n\n", v11, v12, v13, v14, v15, v34);
    IOObjectRelease(v9);
    return 0;
  }
  SMCMakeUInt32Key();
  if (SMCGetKeyInfo())
  {
    logfunction("", 1, @"Couldn't retrieve SMC Key %s. Got SMC error: %d\n\n", v16, v17, v18, v19, v20, a1);
    BOOL v10 = 0;
  }
  else
  {
    int v21 = SMCWriteKeyWithKnownSize();
    BOOL v10 = v21 == 0;
    if (v21) {
      logfunction("", 1, @"Writing SMC key %s as value %s failed with error %d\n\n", v22, v23, v24, v25, v26, a1);
    }
    int v27 = SMCReadKeyAsNumeric();
    if (v27) {
      logfunction("", 1, @"SMCReadKeyAsNumeric() returned %d\n", v28, v29, v30, v31, v32, v27);
    }
    else {
      logfunction("", 1, @"Read (0x%jX) for key %s\n\n", v28, v29, v30, v31, v32, 0);
    }
  }
  IOObjectRelease(v9);
  SMCCloseConnection();
  return v10;
}

void cleanup_boot_environment(char *a1)
{
  uint64_t v30 = "mobile";
  v32[0] = a1;
  v32[1] = 0;
  bzero(__str, 0x401uLL);
  CFDictionaryRef v2 = fts_open(v32, 85, 0);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = fts_read(v2);
    if (v4)
    {
      uint64_t v5 = v4;
      do
      {
        if (v5->fts_info != 8) {
          goto LABEL_15;
        }
        int v6 = strncmp(".patchd-dirty-", v5->fts_name, 0xEuLL);
        if (v6)
        {
          if (strncmp(".patchd-saved-", v5->fts_name, 0xEuLL)) {
            goto LABEL_15;
          }
        }
        snprintf(__str, 0x400uLL, "%s/patchd-%s.log", a1, (const char *)&v5[1].fts_cycle + 6);
        if (!access(__str, 0))
        {
          if (!v6) {
            goto LABEL_15;
          }
          if (unlink(__str)) {
            goto LABEL_13;
          }
          logfunction("", 1, @"Deleted %s\n", v12, v13, v14, v15, v16, (char)__str);
        }
        if (!unlink(v5->fts_path))
        {
          logfunction("", 1, @"Deleted %s\n", v7, v8, v9, v10, v11, (char)v5->fts_path);
          goto LABEL_15;
        }
        if (*__error() != 2)
        {
LABEL_13:
          int v17 = *__error();
          uint64_t v18 = __error();
          strerror(*v18);
          logfunction("", 1, @"Error %d (%s) deleting %s\n", v19, v20, v21, v22, v23, v17);
        }
LABEL_15:
        uint64_t v5 = fts_read(v3);
      }
      while (v5);
    }
    fts_close(v3);
  }
  else
  {
    uint64_t v24 = __error();
    strerror(*v24);
    logfunction("", 1, @"Could not fts_open(3) path %s: %s\n", v25, v26, v27, v28, v29, (char)a1);
  }
  _cleanup_boot_environment_with_list(a1, (const char **)&off_1000590F0, 20);
  if ((booted_from_recoveryos() & 1) == 0) {
    _cleanup_boot_environment_with_list(a1, &v30, 1);
  }
}

void _cleanup_boot_environment_with_list(const char *a1, const char **a2, uint64_t a3)
{
  bzero(__str, 0x401uLL);
  for (; a3; --a3)
  {
    snprintf(__str, 0x400uLL, "%s/%s", a1, *a2);
    if (removefile(__str, 0, 1u))
    {
      if (*__error() != 2)
      {
        int v11 = *__error();
        uint64_t v12 = __error();
        strerror(*v12);
        logfunction("", 1, @"Error %d (%s) deleting %s\n", v13, v14, v15, v16, v17, v11);
      }
    }
    else
    {
      logfunction("", 1, @"Deleted %s\n", v6, v7, v8, v9, v10, (char)__str);
    }
    ++a2;
  }
}

uint64_t mount_preboot_volume(int a1, unsigned char *a2)
{
  memset(v13, 0, sizeof(v13));
  bzero(v12, 0x400uLL);
  ramrod_get_preboot_partition_device_node((char *)v13, 0x20uLL);
  if (!ramrod_get_mount_path((const char *)v13, v12, 0x400uLL))
  {
    if (a2)
    {
      uint64_t v10 = 0;
      *a2 = 0;
      return v10;
    }
    return 0;
  }
  __strlcpy_chk();
  ramrod_create_directory(v12, 0x1EDu, 0, 0);
  uint64_t v4 = ramrod_mount_filesystem_no_fsck_opt_err((char *)v13, v12, a1, 0);
  if (!v4)
  {
    if (a2)
    {
      uint64_t v10 = 0;
      *a2 = 1;
      return v10;
    }
    return 0;
  }
  uint64_t v10 = v4;
  logfunction("", 1, @"unable to mount preboot volume\n\n", v5, v6, v7, v8, v9, v12[0]);
  return v10;
}

uint64_t unmount_preboot_volume()
{
  memset(v2, 0, sizeof(v2));
  bzero(v1, 0x400uLL);
  ramrod_get_preboot_partition_device_node((char *)v2, 0x20uLL);
  ramrod_get_mount_path((const char *)v2, v1, 0x400uLL);
  ramrod_unmount_filesystem(v1);
  return 0;
}

void sub_100007264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void perform_block_with_ct_server_connection(uint64_t a1)
{
  if (is_baseband_device() && !booted_from_recoveryos() && &__CTServerConnectionCreate)
  {
    uint64_t v3 = (const void *)_CTServerConnectionCreate();
    (*(void (**)(uint64_t, const void *, uint64_t))(a1 + 16))(a1, v3, 1);
    if (v3) {
      CFRelease(v3);
    }
  }
  else
  {
    CFDictionaryRef v2 = *(void (**)(uint64_t, void, void))(a1 + 16);
    v2(a1, 0, 0);
  }
}

uint64_t release_baseband_ticket_lock(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __release_baseband_ticket_lock_block_invoke;
  v3[3] = &unk_100059240;
  v3[4] = &v4;
  v3[5] = a1;
  perform_block_with_ct_server_connection((uint64_t)v3);
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100007F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __release_baseband_ticket_lock_block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 || !a3)
  {
    if (!a2 || (int v10 = _CTServerConnectionUnlockPostponementTicket()) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      return;
    }
    CFStringRef v9 = @"Failed to release postponement ticket lock: %ld.%ld";
    char v13 = v10;
  }
  else
  {
    CFStringRef v9 = @"Failed to create CT server connection";
  }
  error_internal_CFStringRef cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, v9, a6, a7, a8, v13);
  uint64_t v12 = *(CFErrorRef **)(a1 + 40);
  if (v12)
  {
    *uint64_t v12 = error_internal_cf;
  }
  else
  {
    CFRelease(error_internal_cf);
  }
}

void sub_1000081D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008278(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008668(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSString *fetch_string_sysctl()
{
  size_t size = 0;
  if (sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0)) {
    return 0;
  }
  if (!size) {
    return 0;
  }
  CFDictionaryRef v0 = malloc_type_malloc(size, 0x9B725209uLL);
  if (!v0) {
    return 0;
  }
  uint64_t v1 = v0;
  if (sysctlbyname("kern.bootsessionuuid", v0, &size, 0, 0)) {
    CFDictionaryRef v2 = 0;
  }
  else {
    CFDictionaryRef v2 = +[NSString stringWithCString:v1 encoding:4];
  }
  free(v1);
  return v2;
}

int *clear_apply_state()
{
  CFDictionaryRef v0 = +[NSMutableDictionary dictionaryWithContentsOfFile:@"/private/var/MobileSoftwareUpdate/last_update_result.plist"];
  if (v0)
  {
    uint64_t v8 = v0;
    _clear_apply_state(v0);
    CFDictionaryRef v0 = (NSMutableDictionary *)[(NSMutableDictionary *)v8 writeToFile:@"/private/var/MobileSoftwareUpdate/last_update_result.plist" atomically:1];
  }
  if (msu_running_in_limited_environment((uint64_t)v0, v1, v2, v3, v4, v5, v6, v7)) {
    return logfunction("", 1, @"%s: Running in recoveryOS..skipping cleanup of BootedOSState plist file\n", v9, v10, v11, v12, v13, (char)"clear_apply_state");
  }
  if ((msu_should_save_env_info_for_recovery() & 1) == 0) {
    return logfunction("", 1, @"%s: Not attempting to cleanup recoveryOS info since save_env_info is not set\n", v15, v16, v17, v18, v19, (char)"clear_apply_state");
  }
  return (int *)saveCurrentEnvInfoForNeRD(0);
}

id _clear_apply_state(void *a1)
{
  [a1 removeObjectForKey:@"TargetOS"];
  [a1 removeObjectForKey:@"SourceOS"];
  [a1 removeObjectForKey:@"TargetBootManifestHash"];
  [a1 removeObjectForKey:@"SourceRestoreVerion"];
  [a1 removeObjectForKey:@"TargetRestoreVerion"];
  [a1 removeObjectForKey:@"TargetVolumeUUID"];
  return [a1 removeObjectForKey:@"TargetVolumeGroupUUID"];
}

uint64_t process_update_result_state(char *a1, char *a2)
{
  uint64_t string_sysctl = (uint64_t)fetch_string_sysctl();
  if (string_sysctl)
  {
    uint64_t v5 = (void *)MGCopyAnswer();
    if (v5)
    {
      uint64_t v6 = +[NSMutableDictionary dictionaryWithContentsOfFile:@"/private/var/MobileSoftwareUpdate/last_update_result.plist"];
      if (!v6)
      {
        char v30 = 1;
        logfunction("", 1, @"%s: no update result file, assuming 1st boot after a restore\n", v7, v8, v9, v10, v11, (char)"process_update_result_state");
        uint64_t v12 = +[NSMutableDictionary dictionaryWithCapacity:4];
        [(NSMutableDictionary *)v12 setObject:+[NSNumber numberWithLong:0] forKey:@"PreviousUpdateState"];
        [(NSMutableDictionary *)v12 setObject:+[NSDate dateWithTimeIntervalSinceNow:0.0] forKey:@"PreviousRestoreDate"];
        clear_firmware_specific_data();
        uint64_t v31 = 0;
        char v32 = 0;
        if (!v12)
        {
          uint64_t string_sysctl = 1;
          goto LABEL_58;
        }
        goto LABEL_57;
      }
      uint64_t v12 = v6;
      id v13 = [(NSMutableDictionary *)v6 objectForKey:@"BootUUID"];
      if (v13)
      {
        if (([v13 isEqualToString:string_sysctl] & 1) == 0)
        {
          logfunction("", 1, @"%s: Boot UUID is different - 1st run after reboot\n", v19, v20, v21, v22, v23, (char)"process_update_result_state");
          id v24 = [(NSMutableDictionary *)v12 objectForKey:@"TargetOS"];
          if (v24)
          {
            [(NSMutableDictionary *)v12 objectForKey:@"SourceOS"];
            char v93 = 1;
            logfunction("", 1, @"%s: Update attempted (%@ -> %@)\n", v25, v26, v27, v28, v29, (char)"process_update_result_state");
          }
          else
          {
            char v93 = 0;
          }
          uint64_t v31 = (const void *)MGGetStringAnswer();
          id v33 = [(NSMutableDictionary *)v12 objectForKey:@"TargetBootManifestHash"];
          id v34 = [(NSMutableDictionary *)v12 objectForKey:@"OriginalBootManifestHash"];
          BOOL v40 = v34 == 0;
          if (v34)
          {
            if ([v34 isEqualToData:v5])
            {
              BOOL v40 = 1;
              if (!v33) {
                goto LABEL_16;
              }
              goto LABEL_23;
            }
            CFStringRef v47 = @"%s: Boot manifest hash differs - in different OS\n";
          }
          else
          {
            CFStringRef v47 = @"%s: No boot manifest hash in result state file - assuming same OS\n";
          }
          logfunction("", 1, v47, v35, v36, v37, v38, v39, (char)"process_update_result_state");
          if (!v33)
          {
LABEL_16:
            if (v24)
            {
              logfunction("", 1, @"%s: Update was attempted, but no %@ boot manifest hash is present - using target OS version instead\n", v35, v36, v37, v38, v39, (char)"process_update_result_state");
              if (!v31)
              {
                CFStringRef v46 = @"%s: Couldn't fetch current OS version to compare with target OS version - assuming we are in the target OS (%@)\n";
                goto LABEL_32;
              }
              if ([v24 isEqualToString:v31])
              {
                CFStringRef v46 = @"%s: in target OS [%@]\n";
LABEL_32:
                unsigned int v53 = 1;
                logfunction("", 1, v46, v41, v42, v43, v44, v45, (char)"process_update_result_state");
                goto LABEL_34;
              }
              logfunction("", 1, @"%s: in different OS than target (target: %@ - current: %@)\n", v41, v42, v43, v44, v45, (char)"process_update_result_state");
              unsigned int v53 = 0;
LABEL_34:
              unsigned int v87 = v53;
              BOOL v92 = v40;
              uint64_t v88 = v31;
              uint64_t v89 = string_sysctl;
              uint64_t v90 = v5;
              uint64_t v91 = a2;
              long long v94 = 0u;
              long long v95 = 0u;
              long long v96 = 0u;
              long long v97 = 0u;
              id v54 = [&off_1000650B0 countByEnumeratingWithState:&v94 objects:v98 count:16];
              if (v54)
              {
                id v60 = v54;
                uint64_t v61 = *(void *)v95;
                do
                {
                  for (uint64_t i = 0; i != v60; uint64_t i = (char *)i + 1)
                  {
                    if (*(void *)v95 != v61) {
                      objc_enumerationMutation(&off_1000650B0);
                    }
                    CFStringRef v63 = *(const __CFString **)(*((void *)&v94 + 1) + 8 * i);
                    CFDataRef v64 = (const __CFData *)copy_nvram_variable(v63);
                    [(NSMutableDictionary *)v12 removeObjectForKey:v63];
                    if (v64)
                    {
                      id v65 = objc_alloc((Class)NSString);
                      BytePtr = CFDataGetBytePtr(v64);
                      id v67 = [v65 initWithBytes:BytePtr length:CFDataGetLength(v64) encoding:4];
                      [(NSMutableDictionary *)v12 setObject:v67 forKey:v63];

                      CFRelease(v64);
                    }
                  }
                  id v60 = [&off_1000650B0 countByEnumeratingWithState:&v94 objects:v98 count:16];
                }
                while (v60);
              }
              if (v92)
              {
                logfunction("", 1, @"%s: Failed Backward - in original OS after update was attempted\n", v55, v56, v57, v58, v59, (char)"process_update_result_state");
                [(NSMutableDictionary *)v12 setObject:+[NSNumber numberWithLong:2] forKey:@"PreviousUpdateState"];
                a2 = v91;
                uint64_t string_sysctl = v89;
                uint64_t v5 = v90;
                uint64_t v31 = v88;
                char v32 = v93;
              }
              else
              {
                a2 = v91;
                uint64_t string_sysctl = v89;
                uint64_t v5 = v90;
                uint64_t v31 = v88;
                char v32 = v93;
                if (v87)
                {
                  id v68 = [(NSMutableDictionary *)v12 objectForKey:@"ota-result"];
                  if (v68)
                  {
                    if (![v68 isEqualToString:@"success"])
                    {
                      logfunction("", 1, @"%s: Failed Forward - made it to the new OS with a failure indicated in NVRAM [%@]\n", v74, v75, v76, v77, v78, (char)"process_update_result_state");
                      [(NSMutableDictionary *)v12 setObject:+[NSNumber numberWithLong:3] forKey:@"PreviousUpdateState"];
                      record_firmware_failures(v12);
                      goto LABEL_53;
                    }
                    logfunction("", 1, @"%s: Successful Update - made it to the new OS with \"success\" set in NVRAM\n", v74, v75, v76, v77, v78, (char)"process_update_result_state");
                  }
                  else
                  {
                    logfunction("", 1, @"%s: made it to the new OS, but there is no ota-result set.  Assuming success.\n", v69, v70, v71, v72, v73, (char)"process_update_result_state");
                  }
                  uint64_t v79 = +[NSNumber numberWithLong:1];
                  CFStringRef v80 = @"PreviousUpdateState";
                }
                else
                {
                  logfunction("", 1, @"%s: OS is different than target OS for update - update must have failed into recovery with a subsequent restore\n", v55, v56, v57, v58, v59, (char)"process_update_result_state");
                  [(NSMutableDictionary *)v12 setObject:+[NSNumber numberWithLong:0] forKey:@"PreviousUpdateState"];
                  uint64_t v79 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
                  CFStringRef v80 = @"PreviousRestoreDate";
                }
                [(NSMutableDictionary *)v12 setObject:v79 forKey:v80];
                clear_firmware_specific_data();
              }
LABEL_53:
              char v30 = !v92;
              _clear_apply_state(v12);
              [(NSMutableDictionary *)v12 setObject:+[NSDate dateWithTimeIntervalSinceNow:0.0] forKey:@"PreviousUpdateDate"];
              v98[0] = 0;
              if (![(id)string_sysctl writeToFile:@"/var/run/FirstBootAfterUpdate" atomically:1 encoding:4 error:v98]|| v98[0])
              {
                logfunction("", 1, @"%s: Failed to write firstBootAfterUpdate cookie file to /var/run (%@)\n", v81, v82, v83, v84, v85, (char)"process_update_result_state");
              }
              else
              {
                logfunction("", 1, @"%s: Successfully wrote firstBootAfterUpdate cookie file to /var/run\n", v81, v82, v83, v84, v85, (char)"process_update_result_state");
              }
              goto LABEL_57;
            }
LABEL_27:
            if (v40)
            {
              char v30 = 0;
            }
            else
            {
              char v30 = 1;
              logfunction("", 1, @"%s: new OS booted without an update (%@) - tethered restore has been done\n", v35, v36, v37, v38, v39, (char)"process_update_result_state");
              [(NSMutableDictionary *)v12 setObject:+[NSNumber numberWithLong:0] forKey:@"PreviousUpdateState"];
              [(NSMutableDictionary *)v12 setObject:+[NSDate dateWithTimeIntervalSinceNow:0.0] forKey:@"PreviousRestoreDate"];
              clear_firmware_specific_data();
            }
            char v32 = v93;
            goto LABEL_57;
          }
LABEL_23:
          unsigned int v53 = [v33 isEqualToData:v5];
          if (v53) {
            logfunction("", 1, @"%s: in target OS [%@] - target manifest hash matches current boot manifest hash\n", v48, v49, v50, v51, v52, (char)"process_update_result_state");
          }
          else {
            logfunction("", 1, @"%s: not in target OS - target manifest hash does not match current boot manifest hash\n", v48, v49, v50, v51, v52, (char)"process_update_result_state");
          }
          if (v24) {
            goto LABEL_34;
          }
          goto LABEL_27;
        }
      }
      else
      {
        logfunction("", 1, @"%s: No boot UUID in result state file - assuming same boot\n", v14, v15, v16, v17, v18, (char)"process_update_result_state");
      }
      uint64_t v31 = 0;
      char v32 = 0;
      char v30 = 0;
LABEL_57:
      [(NSMutableDictionary *)v12 setObject:string_sysctl forKey:@"BootUUID"];
      [(NSMutableDictionary *)v12 setObject:v5 forKey:@"OriginalBootManifestHash"];
      uint64_t string_sysctl = 1;
      [(NSMutableDictionary *)v12 writeToFile:@"/private/var/MobileSoftwareUpdate/last_update_result.plist" atomically:1];
      goto LABEL_58;
    }
    uint64_t v31 = 0;
    char v32 = 0;
    char v30 = 0;
    uint64_t string_sysctl = 0;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v31 = 0;
    char v32 = 0;
    char v30 = 0;
  }
LABEL_58:
  if (a1) {
    *a1 = v32;
  }
  if (a2) {
    *a2 = v30;
  }
  if (v5) {

  }
  if (v31) {
    CFRelease(v31);
  }
  return string_sysctl;
}

void clear_firmware_specific_data()
{
  CFDictionaryRef v0 = objc_opt_new();
  id v1 = [v0 enumeratorAtPath:@"/private/var/MobileSoftwareUpdate//preserved_firmware/"];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v1);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        id v8 = [@"/private/var/MobileSoftwareUpdate//preserved_firmware/" stringByAppendingPathComponent:v7];
        NSLog(@"[clear_firmware_specific_data] Removing %@ because we're in a state where we don't need to preserve it.", v7);
        [v0 removeItemAtPath:v8 error:0];
      }
      id v4 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void record_firmware_failures(void *a1)
{
  uint64_t v2 = objc_opt_new();
  id v3 = [v2 enumeratorAtPath:@"/private/var/MobileSoftwareUpdate//preserved_firmware/"];
  id v4 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        NSLog(@"[record_firmware_failures] Found %@ updater data blob during a boot after fail-forward.", v10);
        [v4 addObject:v10];
      }
      id v7 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  if (v4 && [v4 count]) {
    [a1 setObject:v4 forKeyedSubscript:@"PreservedFirmware"];
  }
}

BOOL is_first_boot_cleanup_done()
{
  BOOL v1 = [+[NSFileManager defaultManager] fileExistsAtPath:@"/var/run/FirstBootCleanupHandled"];
  logfunction("", 1, @"%s: is first boot cleanup done: %@\n", v2, v3, v4, v5, v6, (char)"is_first_boot_cleanup_done");
  return v1;
}

void sub_100009AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100009D28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009EC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A110(_Unwind_Exception *exception_object)
{
}

void sub_10000A1EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void msu_process_dictionary_values_for_xpc_serialization(const void *a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t v5 = msu_process_cf_object_for_xpc_serialization(a2);
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    if (a3 && !*a3)
    {
      CFMutableStringRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      *a3 = Mutable;
      CFDictionarySetValue(Mutable, a1, v6);
    }
    CFRelease(v6);
  }
}

CFDictionaryRef msu_process_cf_object_for_xpc_serialization(void *a1)
{
  if (!a1) {
    return 0;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFDictionaryGetTypeID())
  {
    CFDictionaryRef context = 0;
    CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)msu_process_dictionary_values_for_xpc_serialization, &context);
    if (context)
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, (CFDictionaryRef)a1);
      CFDictionaryApplyFunction(context, (CFDictionaryApplierFunction)msu_merge_dictionary_values, MutableCopy);
      CFRelease(context);
      return MutableCopy;
    }
    return 0;
  }
  if (v2 == CFArrayGetTypeID())
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      CFIndex v6 = 0;
      CFMutableDictionaryRef MutableCopy = 0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
        uint64_t v8 = msu_process_cf_object_for_xpc_serialization(ValueAtIndex);
        if (v8)
        {
          long long v9 = (const void *)v8;
          if (!MutableCopy) {
            CFMutableDictionaryRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, (CFArrayRef)a1);
          }
          CFArraySetValueAtIndex(MutableCopy, v6, v9);
          CFRelease(v9);
        }
        ++v6;
      }
      while (v5 != v6);
      return MutableCopy;
    }
    return 0;
  }
  if (v2 != CFErrorGetTypeID()) {
    return 0;
  }
  return cferror_to_dictionary_embedded((__CFError *)a1, 1);
}

void msu_merge_dictionary_values(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

void msu_serialize_cf_object_into_xpc_dict(void *a1, const char *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3)
  {
    logfunction("", 1, @"%s: API misuse - object is NULL\n", a4, a5, a6, a7, a8, (char)"msu_serialize_cf_object_into_xpc_dict");
    return;
  }
  CFDictionaryRef v10 = msu_process_cf_object_for_xpc_serialization(a3);
  if (!v10)
  {
    long long v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v12) {
      goto LABEL_4;
    }
LABEL_9:
    logfunction("", 1, @"could not create object for key %s:%@\n", v13, v14, v15, v16, v17, (char)a2);
    return;
  }
  CFDictionaryRef v11 = v10;
  long long v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  CFRelease(v11);
  if (!v12) {
    goto LABEL_9;
  }
LABEL_4:
  xpc_dictionary_set_value(a1, a2, v12);
  xpc_release(v12);
}

void msu_process_dictionary_values_from_xpc_deserialization(const void *a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t v5 = msu_process_cf_object_from_xpc_deserialization(a2);
  if (v5)
  {
    CFIndex v6 = (const void *)v5;
    if (a3 && !*a3)
    {
      CFMutableStringRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      *a3 = Mutable;
      CFDictionarySetValue(Mutable, a1, v6);
    }
    CFRelease(v6);
  }
}

CFStringRef msu_process_cf_object_from_xpc_deserialization(const void *a1)
{
  if (!a1) {
    return 0;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    if (v2 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        CFIndex v6 = 0;
        CFMutableDictionaryRef MutableCopy = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
          uint64_t v9 = msu_process_cf_object_from_xpc_deserialization(ValueAtIndex);
          if (v9)
          {
            CFDictionaryRef v10 = (const void *)v9;
            if (!MutableCopy) {
              CFMutableDictionaryRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, (CFArrayRef)a1);
            }
            CFArraySetValueAtIndex(MutableCopy, v6, v10);
            CFRelease(v10);
          }
          ++v6;
        }
        while (v5 != v6);
        return (const __CFString *)MutableCopy;
      }
    }
    return 0;
  }
  if (!CFDictionaryContainsKey((CFDictionaryRef)a1, @"_MSU_Embedded_Error"))
  {
    CFDictionaryRef context = 0;
    CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)msu_process_dictionary_values_from_xpc_deserialization, &context);
    if (context)
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, (CFDictionaryRef)a1);
      CFDictionaryApplyFunction(context, (CFDictionaryApplierFunction)msu_merge_dictionary_values, MutableCopy);
      CFRelease(context);
      return (const __CFString *)MutableCopy;
    }
    return 0;
  }
  return copy_dictionary_to_cferror(a1);
}

CFStringRef msu_deserialize_cf_object_from_xpc_dict(void *a1, const char *a2)
{
  if (!xpc_dictionary_get_value(a1, a2)) {
    return 0;
  }
  CFTypeID v2 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
  CFStringRef v3 = msu_process_cf_object_from_xpc_deserialization(v2);
  if (v3)
  {
    CFStringRef v4 = v3;
    CFRelease(v2);
    return v4;
  }
  return (const __CFString *)v2;
}

void handle_message(_xpc_connection_s *a1, xpc_object_t xdict, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  string = xpc_dictionary_get_string(xdict, "Command");
  if (string)
  {
    uint64_t v19 = string;
    CFStringRef v23 = msu_deserialize_cf_object_from_xpc_dict(xdict, "CommandParameters");
    if (a4)
    {
      uint64_t v24 = 0;
      uint64_t v25 = (uint64_t *)(a3 + 16);
      while (1)
      {
        size_t v26 = strlen((const char *)*(v25 - 2));
        if (!strncmp(v19, (const char *)*(v25 - 2), v26)) {
          break;
        }
        ++v24;
        v25 += 3;
        if (a4 == v24) {
          goto LABEL_14;
        }
      }
      if ((msu_client_is_entitled(a1, *v25) & 1) == 0)
      {
        error_internal_CFStringRef cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 9, 0, 0, @"Client does not have entitlement %s", v27, v28, v29, *v25);
        goto LABEL_16;
      }
      char v30 = (void *)os_transaction_create();
      ((void (*)(_xpc_connection_s *, xpc_object_t, const __CFString *))*(v25 - 1))(a1, xdict, v23);
      os_release(v30);
    }
    else
    {
      LODWORD(v24) = 0;
    }
    if (v24 != a4)
    {
LABEL_18:
      if (v23)
      {
        CFRelease(v23);
      }
      return;
    }
LABEL_14:
    error_internal_CFStringRef cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 9, 0, 0, @"Unknown command '%s'", v20, v21, v22, (char)v19);
LABEL_16:
    char v32 = error_internal_cf;
    msu_send_error(a1, 0, error_internal_cf, 0);
    if (v32) {
      CFRelease(v32);
    }
    goto LABEL_18;
  }
  logfunction("", 1, @"No command in request\n", v14, v15, v16, v17, v18, a9);
}

uint64_t msu_client_is_entitled(_xpc_connection_s *a1, uint64_t a2)
{
  if (!a2) {
    return 1;
  }
  char v2 = a2;
  CFStringRef v4 = (void *)xpc_connection_copy_entitlement_value();
  if (v4)
  {
    CFIndex v5 = v4;
    if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_BOOL)
    {
      if (xpc_BOOL_get_value(v5))
      {
        uint64_t v12 = 1;
LABEL_17:
        xpc_release(v5);
        return v12;
      }
      CFStringRef v11 = @"Value for entitlement '%s' is false\n";
    }
    else
    {
      CFStringRef v11 = @"Entitlement '%s' is not a BOOLean\n";
    }
    logfunction("", 1, v11, v6, v7, v8, v9, v10, v2);
    uint64_t v12 = 0;
    goto LABEL_17;
  }
  pid_t pid = xpc_connection_get_pid(a1);
  bzero(buffer, 0x400uLL);
  long long v24 = 0u;
  memset(v25, 0, sizeof(v25));
  memset(&audittoken, 0, sizeof(audittoken));
  xpc_connection_get_audit_token();
  if (proc_pidpath_audittoken(&audittoken, buffer, 0x400u) < 1)
  {
    int v21 = proc_pidinfo(pid, 13, 0, &v24, 64);
    uint64_t v20 = (const char *)v25;
    if (!v21) {
      uint64_t v20 = "<unknown>";
    }
  }
  else
  {
    uint64_t v14 = strrchr(buffer, 47);
    if (v14) {
      LOBYTE(v20) = (_BYTE)v14 + 1;
    }
    else {
      uint64_t v20 = buffer;
    }
  }
  logfunction("", 1, @"Client %s[%d] does not have the '%s' entitlement\n", v15, v16, v17, v18, v19, (char)v20);
  return 0;
}

void msu_send_error(_xpc_connection_s *a1, xpc_object_t original, __CFError *a3, int a4)
{
  if (original) {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
  }
  else {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  uint64_t v8 = reply;
  if (reply)
  {
    xpc_dictionary_set_string(reply, "IPCStatus", "Error");
    if (a3)
    {
      CFDictionaryRef v9 = cferror_to_dictionary(a3);
      if (v9)
      {
        CFDictionaryRef v15 = v9;
        msu_serialize_cf_object_into_xpc_dict(v8, "ErrorInfo", v9, v10, v11, v12, v13, v14);
        CFRelease(v15);
      }
    }
    xpc_connection_send_message(a1, v8);
    xpc_release(v8);
    if (a4)
    {
      submitRestoreLogFile(a3, 0, 0, 0);
    }
  }
}

void msu_send_status(_xpc_connection_s *a1, void *a2, void *a3)
{
}

void msu_send_status_with_reply(_xpc_connection_s *a1, xpc_object_t original, void *a3, uint64_t a4)
{
  if (original) {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
  }
  else {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  uint64_t v8 = reply;
  if (reply)
  {
    xpc_dictionary_set_string(reply, "IPCStatus", "Complete");
    if (a3) {
      msu_serialize_cf_object_into_xpc_dict(v8, "Results", a3, v9, v10, v11, v12, v13);
    }
    if (a4) {
      (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v8);
    }
    xpc_connection_send_message(a1, v8);
    xpc_release(v8);
  }
}

CFPropertyListRef _MSUPreferencesCopyValueForDomain(const __CFString *a1, const __CFString *a2)
{
  CFPropertyListRef v4 = CFPreferencesCopyAppValue(a1, a2);
  if (v4) {
    return v4;
  }
  if (_getManagedPreferencesDict_managedPreferencesOnce != -1) {
    dispatch_once(&_getManagedPreferencesDict_managedPreferencesOnce, &__block_literal_global_3);
  }
  if (_getManagedPreferencesDict__managedPreferencesCache)
  {
    CFNumberRef Value = CFDictionaryGetValue((CFDictionaryRef)_getManagedPreferencesDict__managedPreferencesCache, a1);
    if (Value)
    {
      CFPropertyListRef v4 = Value;
      CFRetain(Value);
      return v4;
    }
  }
  return CFPreferencesCopyValue(a1, a2, @"mobile", kCFPreferencesAnyHost);
}

uint64_t _MSUPreferencesGetAppBooleanValue(const __CFString *a1, unsigned char *a2)
{
  CFBooleanRef v3 = (const __CFBoolean *)_MSUPreferencesCopyValueForDomain(a1, @"com.apple.MobileSoftwareUpdate");
  CFBooleanRef v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    BOOL v6 = v5 == CFBooleanGetTypeID();
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL v6 = 0;
  if (a2) {
LABEL_3:
  }
    *a2 = v6;
LABEL_4:
  if (v6)
  {
    uint64_t Value = CFBooleanGetValue(v4);
    if (!v4) {
      return Value;
    }
    goto LABEL_8;
  }
  uint64_t Value = 0;
  if (v4) {
LABEL_8:
  }
    CFRelease(v4);
  return Value;
}

uint64_t _MSUPreferencesGetAppBooleanValueWithDefaultValue(const __CFString *a1, unsigned int a2)
{
  char v4 = 0;
  LODWORD(result) = _MSUPreferencesGetAppBooleanValue(a1, &v4);
  if (v4) {
    return result;
  }
  else {
    return a2;
  }
}

void ___getManagedPreferencesDict_block_invoke(id a1)
{
  CFStringRef v1 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@/%@.plist", @"/Library/Managed Preferences/mobile", @"com.apple.MobileSoftwareUpdate");
  if (v1)
  {
    CFStringRef v2 = v1;
    _getManagedPreferencesDict__managedPreferencesCache = (uint64_t)[objc_alloc((Class)NSDictionary) initWithContentsOfFile:v1];
    CFRelease(v2);
  }
}

int main(int argc, const char **argv, const char **envp)
{
  __int16 v159 = 0;
  logfunction("", 1, @"CleanupPreparePath main() started\n", v3, v4, v5, v6, v7, v146);
  set_partition_logging_function(msu_partition_logger);
  set_partition_execution_function(msu_execute_command_with_callback);
  set_partition_execution_logging_function(msu_partition_execution_logger);
  uint64_t is_recovery = os_variant_is_recovery();
  if (is_recovery) {
    fixCrashReporterDir(is_recovery, v9, v10, v11, v12, v13, v14, v15);
  }
  if ((openRestoreLogFile(1) & 0x80000000) != 0) {
    logfunction("", 1, @"Could not open log file\n", v16, v17, v18, v19, v20, v147);
  }
  if (atexit((void (*)(void))closeRestoreLogFile))
  {
    int v21 = __error();
    char v22 = strerror(*v21);
    logfunction("", 1, @"Could not register aexit: %s\n", v23, v24, v25, v26, v27, v22);
  }
  ramrod_log_set_handler(_ramrod_log_handler);
  logfunction("", 1, @"Enabling vnode rapid aging\n", v28, v29, v30, v31, v32, v147);
  *(void *)v168 = 0x4400000001;
  int v158 = 1;
  if (sysctl(v168, 2u, 0, 0, &v158, 0)) {
    CFStringRef v38 = @"Failed to enable vnode rapid aging\n";
  }
  else {
    CFStringRef v38 = @"Successfully enabled rapid vnode aging\n\n";
  }
  logfunction("", 1, v38, v33, v34, v35, v36, v37, v148);
  process_update_result_state((char *)&v159 + 1, (char *)&v159);
  if (!HIBYTE(v159))
  {
LABEL_72:
    if ((_BYTE)v159)
    {
      logfunction("", 1, @"OSVersion changed. Notifying clients\n", v39, v40, v41, v42, v43, v149);
      notify_post("com.apple.MobileSoftwareUpdate.OSVersionChanged");
      CFDictionaryRef v130 = (const __CFDictionary *)_CFCopySupplementalVersionDictionary();
      if (v130)
      {
        CFDictionaryRef v131 = v130;
        CFDictionaryGetValue(v130, _kCFSystemVersionProductVersionExtraKey);
        logfunction("", 1, @"%s: %i\n", v132, v133, v134, v135, v136, (char)"splat_installed");
        CFRelease(v131);
      }
    }
    conditionally_boot_efi_based_on_nvram();
    xpc_main((xpc_connection_handler_t)CleanupPreparePathService_event_handler);
  }
  BOOL boot_cleanup_done = is_first_boot_cleanup_done();
  if (boot_cleanup_done)
  {
LABEL_64:
    CFDataRef v124 = (const __CFData *)copy_nvram_variable(@"usbcfw.version");
    if (!v124) {
      goto LABEL_72;
    }
    CFDataRef v125 = v124;
    if (CFDataGetLength(v124) < 1) {
      goto LABEL_71;
    }
    CFStringRef v126 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v125, 0x8000100u);
    CFMutableStringRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    long long v128 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v128, @"IOClass", @"AppleUSBCController");
    CFDictionarySetValue(Mutable, @"IOPropertyMatch", v128);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, Mutable);
    if (MatchingService)
    {
      io_object_t v137 = MatchingService;
      CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, @"Firmware Version", kCFAllocatorDefault, 0);
      if (CFProperty)
      {
        CFStringRef v139 = CFProperty;
        if (CFStringGetLength(CFProperty) >= 1 && CFStringCompare(v139, v126, 0x40uLL)) {
          logfunction("", 1, @"USBC FW version in IORegistry (%@) != USBC FW version in nvram (%@)\n", v140, v141, v142, v143, v144, (char)v139);
        }
        CFRelease(v139);
      }
      IOObjectRelease(v137);
      if (!v128)
      {
LABEL_68:
        if (!v126)
        {
LABEL_70:
          delete_nvram_variable(@"usbcfw.version");
LABEL_71:
          CFRelease(v125);
          goto LABEL_72;
        }
LABEL_69:
        CFRelease(v126);
        goto LABEL_70;
      }
    }
    else if (!v128)
    {
      goto LABEL_68;
    }
    CFRelease(v128);
    if (!v126) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }
  int v157 = msu_running_in_limited_environment(boot_cleanup_done, v45, v46, v47, v48, v49, v50, v51);
  if (v157) {
    CFStringRef v57 = @"First boot after update: Not clearing MobileAsset preference overrides since running in recovery OS\n";
  }
  else {
    CFStringRef v57 = @"First boot after update: Clearing out old preference overrides\n";
  }
  logfunction("", 1, v57, v52, v53, v54, v55, v56, v149);
  CFPreferencesAppSynchronize(@"com.apple.MobileAsset");
  CFPreferencesAppSynchronize(@"com.apple.MobileSoftwareUpdate");
  id v58 = objc_alloc_init((Class)NSMutableArray);
  v170[0] = @"MobileAssetServerURL-com.apple.MobileAsset.SoftwareUpdate";
  v170[1] = @"default-MobileAssetServerURL-com.apple.MobileAsset.SoftwareUpdate";
  v170[2] = @"MobileAssetServerURL-com.apple.MobileAsset.WatchSoftwareUpdateDocumentation";
  v170[3] = @"default-MobileAssetServerURL-com.apple.MobileAsset.WatchSoftwareUpdateDocumentation";
  v170[4] = @"MobileAssetServerURL-com.apple.MobileAsset.SoftwareUpdateDocumentation";
  v170[5] = @"default-MobileAssetServerURL-com.apple.MobileAsset.SoftwareUpdateDocumentation";
  v170[6] = @"MobileAssetServerURL-com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain";
  v170[7] = @"default-MobileAssetServerURL-com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain";
  v170[8] = @"EnableLiveAssetServerV2";
  v170[9] = @"MobileAssetAssetAudienceGeneric";
  v170[10] = @"PallasUrlOverride";
  v170[11] = @"PallasUrlOverrideV2";
  objc_msgSend(v58, "addObjectsFromArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v170, 12));
  id v59 = +[NSMutableArray array];
  CFArrayRef v60 = CFPreferencesCopyKeyList(@"com.apple.MobileAsset", @"mobile", kCFPreferencesAnyHost);
  if (v60) {
    CFArrayRef v61 = v60;
  }
  else {
    CFArrayRef v61 = (CFArrayRef)&__NSArray0__struct;
  }
  [v59 addObjectsFromArray:v61];
  CFArrayRef v62 = CFPreferencesCopyKeyList(@"com.apple.MobileAsset", @"root", kCFPreferencesAnyHost);
  if (v62) {
    CFArrayRef v63 = v62;
  }
  else {
    CFArrayRef v63 = (CFArrayRef)&__NSArray0__struct;
  }
  [v59 addObjectsFromArray:v63];
  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  id v64 = [v59 countByEnumeratingWithState:&v160 objects:v169 count:16];
  if (v64)
  {
    id v65 = v64;
    uint64_t v66 = *(void *)v161;
    do
    {
      for (uint64_t i = 0; i != v65; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v161 != v66) {
          objc_enumerationMutation(v59);
        }
        id v68 = *(void **)(*((void *)&v160 + 1) + 8 * i);
        if (([v68 hasPrefix:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-", @"EnableLiveAssetServerV2"] & 1) != 0|| (objc_msgSend(v68, "hasPrefix:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-", @"MobileAssetAssetAudience")) & 1) != 0|| (objc_msgSend(v68, "hasPrefix:", +[NSString stringWithFormat:]( {
                                NSString,
        }
                                "stringWithFormat:",
                                @"%@-",
                                @"MobileAssetAssetAudienceGeneric")) & 1) != 0
          || ([v68 hasPrefix:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-", @"PallasUrlOverride"] & 1) != 0|| objc_msgSend(v68, "hasPrefix:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-", @"PallasUrlOverrideV2")))
        {
          [v58 addObject:v68];
        }
        if ([v68 hasPrefix:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-", @"MobileAssetServerURL"])objc_msgSend(v58, "addObject:", v68); {
      }
        }
      id v65 = [v59 countByEnumeratingWithState:&v160 objects:v169 count:16];
    }
    while (v65);
  }
  if (objc_opt_class())
  {
    CFStringRef v75 = kCFPreferencesAnyHost;
    if (objc_opt_respondsToSelector())
    {
      if (+[SDBetaManager _isEnrolledInBetaProgram])
      {
        logfunction("", 1, @"Device is enrolled in a seeding program via +[SDBetaManager _isEnrolledInBetaProgram]; not resetting MobileAssetAssetAudience\n",
          v69,
          v70,
          v71,
          v72,
          v73,
          v150);
        goto LABEL_44;
      }
      CFStringRef v74 = @"Device is not enrolled in a seeding program via +[SDBetaManager _isEnrolledInBetaProgram]\n";
    }
    else
    {
      CFStringRef v74 = @"Device does not have the seeding framework installed via check +[SDBetaManager _isEnrolledInBetaProgram]\n";
    }
  }
  else
  {
    CFStringRef v74 = @"Device does not have the seeding framework installed via check +[SDBetaManager _isEnrolledInBetaProgram]\n";
    CFStringRef v75 = kCFPreferencesAnyHost;
  }
  logfunction("", 1, v74, v69, v70, v71, v72, v73, v150);
  [v58 addObject:@"MobileAssetAssetAudience"];
LABEL_44:
  if ((v157 & 1) == 0)
  {
    logfunction("", 1, @"Clearing out MobileAsset preference overrides: %@\n", v76, v77, v78, v79, v80, (char)v58);
    if (v58)
    {
      long long v166 = 0u;
      long long v167 = 0u;
      long long v164 = 0u;
      long long v165 = 0u;
      id v81 = [v58 countByEnumeratingWithState:&v164 objects:v171 count:16];
      if (v81)
      {
        id v82 = v81;
        uint64_t v83 = *(void *)v165;
        do
        {
          for (j = 0; j != v82; j = (char *)j + 1)
          {
            if (*(void *)v165 != v83) {
              objc_enumerationMutation(v58);
            }
            CFStringRef v85 = *(const __CFString **)(*((void *)&v164 + 1) + 8 * (void)j);
            CFPreferencesSetValue(v85, 0, @"com.apple.MobileAsset", @"mobile", v75);
            CFPreferencesSetValue(v85, 0, @"com.apple.MobileAsset", @"root", v75);
          }
          id v82 = [v58 countByEnumeratingWithState:&v164 objects:v171 count:16];
        }
        while (v82);
      }
    }
  }
  logfunction("", 1, @"Clearing out MobileSoftwareUpdate preference overrides\n", v76, v77, v78, v79, v80, v151);
  CFPreferencesSetValue(@"DisableSnapshotUpdate", 0, @"com.apple.MobileSoftwareUpdate", @"mobile", v75);
  CFPreferencesSetValue(@"DisableSnapshotUpdate", 0, @"com.apple.MobileSoftwareUpdate", @"root", v75);
  CFPreferencesAppSynchronize(@"com.apple.MobileAsset");
  CFPreferencesAppSynchronize(@"com.apple.MobileSoftwareUpdate");
  logfunction("", 1, @"First boot after update: Finished clearing preference overrides\n", v86, v87, v88, v89, v90, v152);
  logfunction("", 1, @"First boot after update: Purging brains\n", v91, v92, v93, v94, v95, v153);
  logfunction("", 1, @"in deleteV1AssetPath\n", v96, v97, v98, v99, v100, v154);
  v171[0] = 0;
  CFURLRef v101 = +[NSFileManager defaultManager];
  if ([(NSFileManager *)v101 fileExistsAtPath:@"/var/MobileAsset/Assets/com_apple_MobileAsset_MobileSoftwareUpdate_UpdateBrain"]&& [(NSFileManager *)v101 removeItemAtPath:@"/var/MobileAsset/Assets/com_apple_MobileAsset_MobileSoftwareUpdate_UpdateBrain" error:v171])
  {
    logfunction("", 1, @"V1 assets folder successfully deleted\n", v102, v103, v104, v105, v106, v155);
  }
  logfunction("", 1, @"First boot after update: Done purging brains\n", v102, v103, v104, v105, v106, v155);
  if ([+[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist"])
  {
    logfunction("", 1, @"Located Pre-SoftwareUpdate Asset Staging state plist at path: %s\n", v107, v108, v109, v110, v111, (char)"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist");
    v171[0] = 0;
    if ([+[NSFileManager defaultManager] removeItemAtPath:@"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist" error:v171])
    {
      logfunction("", 1, @"Successfully removed Pre-SoftwareUpdate Asset Staging state plist at path: %s\n", v112, v113, v114, v115, v116, (char)"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist");
    }
    else
    {
      logfunction("", 1, @"Failed to remove Pre-SoftwareUpdate Asset Staging state plist at path: %s, with error: %@\n", v112, v113, v114, v115, v116, (char)"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist");
    }
  }
  MSUCleanupPreboot();
  MSUCleanupDataVolume();
  v171[0] = 0;
  unsigned __int8 v117 = [@"SqueakyClean" writeToFile:@"/var/run/FirstBootCleanupHandled" atomically:1 encoding:4 error:v171];
  if ((v117 & (v171[0] == 0)) != 0) {
    CFStringRef v123 = @"Successfully wrote firstBootCleanupDone cookie to /var/run\n";
  }
  else {
    CFStringRef v123 = @"Failed to write firstBootCleanupDone cookie to /var/run\n";
  }
  logfunction("", 1, v123, v118, v119, v120, v121, v122, v156);
  goto LABEL_64;
}

int *_ramrod_log_handler(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return logfunction("", 1, @"%s\n", a4, a5, a6, a7, a8, a1);
}

void CleanupPreparePathService_event_handler(_xpc_connection_s *a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __CleanupPreparePathService_event_handler_block_invoke;
  handler[3] = &unk_1000592C0;
  handler[4] = a1;
  xpc_connection_set_event_handler(a1, handler);
  if (cleanup_service_queue_onceToken != -1) {
    dispatch_once(&cleanup_service_queue_onceToken, &__block_literal_global_324);
  }
  xpc_connection_set_target_queue(a1, (dispatch_queue_t)cleanup_service_queue_service_queue);
  xpc_connection_resume(a1);
}

void conditionally_boot_efi_based_on_nvram()
{
  CFTypeRef v0 = copy_nvram_variable(@"auto-boot-x86-once");
  if (v0)
  {
    CFStringRef v1 = v0;
    if (write_SMC_key((char)"AUPO")) {
      delete_nvram_variable(@"auto-boot-x86-once");
    }
    else {
      logfunction("", 1, @"Failed to write AUPO to 1. Higher level OS will not boot.\n", v2, v3, v4, v5, v6, v7);
    }
    CFRelease(v1);
  }
}

void handle_MSUCleanupPreparePath(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  CFTypeRef cf = 0;
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"ShouldPurge");
  CFBooleanRef v7 = Value;
  if (Value)
  {
    CFTypeID v8 = CFGetTypeID(Value);
    LODWORD(v7) = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
  }
  CFBooleanRef v9 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"ShouldPurgeStagedAssets");
  v12 = v9 && (CFBooleanRef v10 = v9, v11 = CFGetTypeID(v9), v11 == CFBooleanGetTypeID()) && CFBooleanGetValue(v10) != 0;
  CFBooleanRef v13 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"ShouldDisableAssetStaging");
  v16 = v13 && (v14 = v13, CFTypeID v15 = CFGetTypeID(v13), v15 == CFBooleanGetTypeID()) && CFBooleanGetValue(v14) != 0;
  CFBooleanRef v17 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"ShouldResetAPFSReserve");
  v25 = !v17 || (CFBooleanRef v23 = v17, v24 = CFGetTypeID(v17), v24 != CFBooleanGetTypeID()) || CFBooleanGetValue(v23) != 0;
  if (v12)
  {
    logfunction("", 1, @"CleanupPreparePathService: Purging Pre-Software Update Staged Assets\n", v18, v19, v20, v21, v22, v38);
    +[MSUAssetStager purgeStagedAssetsAsync];
  }
  if (v16)
  {
    logfunction("", 1, @"CleanupPreparePathService: Disabling Pre-Software Update Asset Staging\n", v18, v19, v20, v21, v22, v38);
    uint64_t v31 = (void *)MGCopyAnswer();
    if (!v31) {
      logfunction("", 1, @"Failed to get buildVersion\n", v26, v27, v28, v29, v30, v39);
    }
    uint64_t v37 = (void *)MGCopyAnswer();
    if (!v37) {
      logfunction("", 1, @"Failed to get productVersion\n", v32, v33, v34, v35, v36, v39);
    }
    +[MSUAssetStager disableStagingForReason:@"Disabling by request of Cleanup Prepare Path Service" buildVersion:v31 osVersion:v37];
    if (v31) {

    }
    if (v37) {
  }
    }
  if (MSUCleanupPreparePath_server((int)v7, v25, (CFErrorRef *)&cf, v18, v19, v20, v21, v22)) {
    msu_send_status(a1, a2, 0);
  }
  else {
    msu_send_error(a1, a2, (__CFError *)cf, 1);
  }
  if (cf) {
    CFRelease(cf);
  }
}

void handle_MSUCleanupNVRAM(_xpc_connection_s *a1, void *a2)
{
  CFTypeRef cf = 0;
  if (os_variant_has_internal_content())
  {
    CFTypeRef v4 = copy_nvram_variable(@"ota-uuid");
    if (v4)
    {
      uint64_t v5 = v4;
      long long v7 = off_100059358;
      execute_command((char *const *)&v7, (uint64_t)handle_MSUCleanupLogger);
      CFRelease(v5);
    }
  }
  if (UMEventCleanupAllNVRAM(1, &cf)) {
    msu_send_status(a1, a2, 0);
  }
  else {
    msu_send_error(a1, a2, (__CFError *)cf, 1);
  }
  if (cf) {
    CFRelease(cf);
  }
}

void handle_MSUCleanupRecoveryOSSavedState(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  logfunction("", 1, @"Attempting to cleanup saved RecoveryOS state.\n", a4, a5, a6, a7, a8, v63);
  CFBooleanRef v10 = +[NSFileManager defaultManager];
  id v66 = 0;
  id v11 = [objc_alloc((Class)NSString) initWithFormat:@"%s/%s/%@"];
  if ([(NSFileManager *)v10 fileExistsAtPath:v11])
  {
    logfunction("", 1, @"Deleting RecoveryOS status file\n", v12, v13, v14, v15, v16, (char)"/private/var/MobileSoftwareUpdate/");
    [(NSFileManager *)v10 removeItemAtPath:v11 error:&v66];
    if (v66) {
      logfunction("", 1, @"Unable to delete RecoveryOS status file: %@\n", v17, v18, v19, v20, v21, (char)v66);
    }
  }
  else
  {
    logfunction("", 1, @"RecoveryOS status file not present(not an error)\n", v12, v13, v14, v15, v16, (char)"/private/var/MobileSoftwareUpdate/");
  }

  id v66 = 0;
  id v22 = [objc_alloc((Class)NSString) initWithFormat:@"%s/%s/%s"];
  if ([(NSFileManager *)v10 fileExistsAtPath:v22])
  {
    logfunction("", 1, @"Deleting RecoveryOS connectivity data\n", v23, v24, v25, v26, v27, (char)"/private/var/MobileSoftwareUpdate/");
    [(NSFileManager *)v10 removeItemAtPath:v22 error:&v66];
    if (v66) {
      logfunction("", 1, @"Unable to delete RecoveryOS connectivity data file: %@\n", v28, v29, v30, v31, v32, (char)v66);
    }
  }
  else
  {
    logfunction("", 1, @"RecoveryOS connectivity data file not present\n", v23, v24, v25, v26, v27, (char)"/private/var/MobileSoftwareUpdate/");
  }

  char v38 = logfunction("", 1, @"Clearing out RecoveryOS logarchives\n", v33, v34, v35, v36, v37, v64);
  clear_recoveryos_logarchive_files((uint64_t)v38, v39, v40, v41, v42, v43, v44, v45);
  if (MGGetBoolAnswer()
    && (AppIntegerCFBooleanRef Value = CFPreferencesGetAppIntegerValue(@"NerdLogarchivePreservationTime", @"com.apple.MobileSoftwareUpdate.CleanupPreparePathService", 0)) != 0)
  {
    CFIndex v52 = AppIntegerValue;
    [+[NSNumber numberWithLong:AppIntegerValue] doubleValue];
    logfunction("", 1, @"Overriding RecoveryOS logarchive preservation timeout to %f seconds\n", v53, v54, v55, v56, v57, v58);
    [+[NSNumber numberWithLong:v52] doubleValue];
    int64_t v60 = (uint64_t)(v59 * 1000000000.0);
  }
  else
  {
    logfunction("", 1, @"Using default RecoveryOS logarchive preservation timeout\n", v46, v47, v48, v49, v50, v65);
    int64_t v60 = 1209600000000000;
  }
  dispatch_time_t v61 = dispatch_time(0, v60);
  global_queue = dispatch_get_global_queue(17, 0);
  dispatch_after(v61, global_queue, &__block_literal_global_4);
  msu_send_status(a1, a2, 0);
}

void handle_MSUCleanupLogs(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  uint64_t valuePtr = 0x7FFFFFFFFFFFFFFFLL;
  CFTypeRef cf = 0;
  CFTypeRef v15 = 0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"LogsRetention");
  if (Value && (CFNumberRef v11 = Value, v12 = CFGetTypeID(Value), v12 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v11, kCFNumberSInt64Type, &valuePtr);
    time_t v13 = valuePtr;
  }
  else
  {
    logfunction("", 1, @"no valid retention\n", v6, v7, v8, v9, v10, v14);
    time_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (MSUCleanupLogs_server(v13, (CFNumberRef *)&v15, (CFErrorRef *)&cf)) {
    msu_send_status(a1, a2, (void *)v15);
  }
  else {
    msu_send_error(a1, a2, (__CFError *)cf, 1);
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v15) {
    CFRelease(v15);
  }
}

int *handle_reboot_to_nerd(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  logfunction("", 1, @"Rebooting into nerd\n", a4, a5, a6, a7, a8, vars0);
  if (+[NeRDSPI setNVRAMForRebootToNerd])
  {
    logfunction("", 1, @"Rebooting now\n", v9, v10, v11, v12, v13, vars0a);
    if (reboot3()) {
      CFStringRef v14 = @"Failed to reboot into nerd\n";
    }
    else {
      CFStringRef v14 = @"Initiated reboot into nerd\n";
    }
  }
  else
  {
    CFStringRef v14 = @"Failed to set the needed NVRAM to reboot to NeRD\n";
  }
  return logfunction("", 1, v14, v9, v10, v11, v12, v13, a9);
}

int *handle_MSUCleanupLogger(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return logfunction("", 1, @"%s\n", a4, a5, a6, a7, a8, a1);
}

void __clear_recoveryos_saved_files_block_invoke(id a1)
{
  uint64_t v6 = logfunction("", 1, @"Timer fired for clearing RecoveryOS logarchive files\n", v1, v2, v3, v4, v5, vars0);
  clear_recoveryos_logarchive_files((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
}

void clear_recoveryos_logarchive_files(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  logfunction("", 1, @"Deleting RecoveryOS logarchive files\n", a4, a5, a6, a7, a8, v30);
  id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%s/%s", "/private/var/MobileSoftwareUpdate/", "Controller/NeRD");
  uint64_t v9 = +[NSFileManager defaultManager];
  obj = [(NSFileManager *)v9 enumeratorAtPath:v8];
  AppIntegerCFNumberRef Value = CFPreferencesGetAppIntegerValue(@"NerdLogarchivePreservationTime", @"com.apple.MobileSoftwareUpdate.CleanupPreparePathService", 0);
  if (AppIntegerValue)
  {
    [+[NSNumber numberWithLong:AppIntegerValue] doubleValue];
    double v12 = v11;
  }
  else
  {
    double v12 = 1209600.0;
  }
  id v36 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = [(NSDirectoryEnumerator *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (([v17 hasSuffix:@".logarchive"] & 1) != 0
          || [v17 hasSuffix:@".logarchive.zip"])
        {
          id v18 = [v8 stringByAppendingPathComponent:v17];
          [+[NSDate date] timeIntervalSinceDate:[(NSDictionary *)[(NSFileManager *)v9 attributesOfItemAtPath:v18 error:0] objectForKey:NSFileCreationDate]];
          if (v24 >= v12)
          {
            logfunction("", 1, @"Deleting %@\n", v19, v20, v21, v22, v23, (char)v17);
            [(NSFileManager *)v9 removeItemAtPath:v18 error:&v36];
            if (v36)
            {
              logfunction("", 1, @"Failed to delete %@ : %@\n", v25, v26, v27, v28, v29, (char)v17);

              id v36 = 0;
            }
          }
          else
          {
            logfunction("", 1, @"Skipping %@ since it is newer than the timeout\n", v19, v20, v21, v22, v23, (char)v17);
          }
        }
      }
      id v14 = [(NSDirectoryEnumerator *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v14);
  }
}

void __cleanup_service_queue_block_invoke(id a1)
{
  uint64_t v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  cleanup_service_queue_service_queue = (uint64_t)dispatch_queue_create("com.apple.MobileSoftwareUpdate.CleanupPreparePathService.queue", v1);
}

uint64_t get_snapshot_preparation_size(void *a1, char **a2, CFErrorRef *a3)
{
  id v6 = +[MSULogAnnotatedSum sum];
  id v7 = [a1 objectForKey:@"InstallationSize-Snapshot"];
  if (v7)
  {
    id v13 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = objc_alloc_init((Class)NSNumberFormatter);
      objc_msgSend(v14, "setFormatterBehavior:", +[NSNumberFormatter defaultFormatterBehavior](NSNumberFormatter, "defaultFormatterBehavior"));
      id v13 = [v14 numberFromString:v13];
      CFStringRef v15 = @"update_attributes[\"InstallationSize-Snapshot\"] (string)";
LABEL_10:
      uint64_t v46 = (char *)[v13 longLongValue];
      [v6 add:v46 annotation:v15];
      uint64_t updated = cryptex_size_requirement_for_update_type(0, a1);
      long long v34 = &v46[updated];
      [v6 add:updated annotation:@"cryptex_size_requirement_for_update_type(msu_update_type_snapshot)"];
      uint64_t v35 = 1;
      logfunction("", 1, @"snapshot preparation size (mastered) : %lld (%lld MB)\n", v48, v49, v50, v51, v52, (char)v34);
      logfunction("", 1, @"\n%s():%@\n", v53, v54, v55, v56, v57, (char)"get_snapshot_preparation_size");
      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v15 = @"update_attributes[\"InstallationSize-Snapshot\"] (number)";
      goto LABEL_10;
    }
    logfunction("", 1, @"InstallationSize-Snapshot has invalid type in update attributes\n", v41, v42, v43, v44, v45, v63);
    error_internal_CFTypeRef cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 9, 0, 0, @"Invalid update attributes: invalid type InstallationSize-Snapshot", v59, v60, v61, v67);
    if (a3)
    {
      long long v34 = 0;
      uint64_t v35 = 0;
      *a3 = error_internal_cf;
    }
    else
    {
      CFRelease(error_internal_cf);
      long long v34 = 0;
      uint64_t v35 = 0;
    }
  }
  else
  {
    logfunction("", 1, @"InstallationSize-Snapshot not present in update attributes\n", v8, v9, v10, v11, v12, v63);
    uint64_t v16 = (NSNumber *)[a1 objectForKey:@"ActualMinimumSystemPartition"];
    if (!v16)
    {
      logfunction("", 1, @"ActualMinimumSystemPartition not present in update attributes\n", v17, v18, v19, v20, v21, v64);
      uint64_t v16 = (NSNumber *)[a1 objectForKey:@"MinimumSystemPartition"];
      if (!v16)
      {
        logfunction("", 1, @"MinimumSystemPartition not present in update attributes. Using the default.\n", v22, v23, v24, v25, v26, v65);
        logfunction("", 1, @"*** Warning *** This is not a normal path *** Users shouldn't get here *** Engineers can\n", v27, v28, v29, v30, v31, v66);
        uint64_t v16 = +[NSNumber numberWithInt:2500];
      }
    }
    uint64_t v32 = calculate_snapshot_overhead([(NSNumber *)v16 longLongValue] << 20);
    uint64_t v33 = cryptex_size_requirement_for_update_type(0, a1);
    long long v34 = (char *)(v33 + v32);
    uint64_t v35 = 1;
    logfunction("", 1, @"snapshot preparation size (worst case) : %lld (%lld MB)\n", v36, v37, v38, v39, v40, v33 + v32);
  }
LABEL_11:
  if (a2) {
    *a2 = v34;
  }
  return v35;
}

uint64_t cryptex_size_requirement_for_update_type(int a1, void *a2)
{
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  v31[1] = 3221225472;
  v31[0] = _NSConcreteStackBlock;
  uint64_t v32 = __cryptex_size_requirement_for_update_type_block_invoke;
  uint64_t v33 = &unk_1000593D0;
  id v34 = +[MSULogAnnotatedSum sum];
  uint64_t v35 = &v37;
  int v36 = a1;
  if (a2)
  {
    id v9 = [a2 objectForKeyedSubscript:@"CryptexSizeInfo"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v10 = [a2 objectForKeyedSubscript:@"ComboAsset"];
      if (!v10) {
        goto LABEL_31;
      }
      uint64_t v11 = MGCopyAnswer();
      long long v44 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v41 = 0u;
      id v12 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (!v12) {
        goto LABEL_31;
      }
      uint64_t v13 = *(void *)v42;
LABEL_7:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(v10);
        }
        CFStringRef v15 = *(void **)(*((void *)&v41 + 1) + 8 * v14);
        id v16 = [v15 objectForKeyedSubscript:@"PrerequisiteBuild"];
        if (v16)
        {
          if ([v16 isEqualToString:v11]) {
            break;
          }
        }
        if (v12 == (id)++v14)
        {
          id v12 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
          if (v12) {
            goto LABEL_7;
          }
          goto LABEL_31;
        }
      }
      id v9 = [v15 objectForKeyedSubscript:@"CryptexSizeInfo"];
      if (!v9) {
        goto LABEL_31;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_31;
      }
    }
    id v17 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"cryptex-system-arm64e", @"cryptex-app", 0);
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v44 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v41 = 0u;
        id v18 = [v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v42;
          uint64_t v20 = -1;
          do
          {
            for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v42 != v19) {
                objc_enumerationMutation(v9);
              }
              uint64_t v22 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v23 = [v22 objectForKey:@"CryptexTag"];
                if (v23)
                {
                  if ([v17 containsObject:v23]) {
                    v32((uint64_t)v31, (uint64_t)i + v20 + 1, (uint64_t)v23, v22);
                  }
                }
              }
            }
            id v18 = [v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
            v20 += (uint64_t)i;
          }
          while (v18);
        }
      }
    }
  }
LABEL_31:
  logfunction("", 1, @"cryptex size requirement: %lld (%lld MB)\n", v4, v5, v6, v7, v8, v38[3]);
  logfunction("", 1, @"\n%s(%s):%@\n", v24, v25, v26, v27, v28, (char)"cryptex_size_requirement_for_update_type");
  uint64_t v29 = v38[3];
  _Block_object_dispose(&v37, 8);
  return v29;
}

void sub_10000CE28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t get_apfs_preallocate_min_is_allowed(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"SUDisableAPFSGetPreallocateMin"];
  if (!v1)
  {
    CFStringRef v9 = @"Use of APFSIOC_GET_PREALLOCATE_MIN_SPACE is not expressly disallowed by asset attributes\n";
LABEL_8:
    uint64_t v8 = 1;
    logfunction("", 1, v9, v2, v3, v4, v5, v6, (char)v11);
    return v8;
  }
  uint64_t v7 = v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CFStringRef v11 = @"SUDisableAPFSGetPreallocateMin";
    CFStringRef v9 = @"%@ property has an unexpected type\n";
    goto LABEL_8;
  }
  if (![v7 BOOLValue])
  {
    CFStringRef v9 = @"Use of APFSIOC_GET_PREALLOCATE_MIN_SPACE is expressly allowed by asset attributes\n";
    goto LABEL_8;
  }
  logfunction("", 1, @"Use of APFSIOC_GET_PREALLOCATE_MIN_SPACE is disabled by asset attributes\n", v2, v3, v4, v5, v6, (char)v11);
  return 0;
}

unint64_t get_apfs_preallocate_min(unint64_t a1)
{
  uint64_t v2 = "/private/var/MobileSoftwareUpdate/.reserved";
  int v3 = open("/private/var/MobileSoftwareUpdate/.reserved", 1538, 438);
  if (v3 == -1)
  {
    if (*__error() != 1 && *__error() != 13
      || (uint64_t v2 = "/tmp/.reserved", v4 = open("/tmp/.reserved", 1538, 438), v4 == -1))
    {
      uint64_t v5 = __error();
      strerror(*v5);
      logfunction("", 1, @"open(\"%s\") failed: (%s)\n", v6, v7, v8, v9, v10, (char)v2);
      return a1;
    }
  }
  else
  {
    int v4 = v3;
  }
  v19[0] = 0;
  v19[1] = a1;
  unint64_t v20 = 0;
  if (ffsctl(v4, 0xC0184A68uLL, v19, 0) == -1)
  {
    CFStringRef v11 = __error();
    char v12 = strerror(*v11);
    logfunction("", 1, @"ffsctl() failed: (%s)\n", v13, v14, v15, v16, v17, v12);
  }
  else if (v20 > a1)
  {
    a1 = v20;
  }
  close(v4);
  unlink(v2);
  return a1;
}

uint64_t get_snapshot_apply_size(void *a1, void *a2)
{
  return 1;
}

uint64_t get_snapshot_apply_and_reserve_sizes(void *a1, void *a2, void *a3, void *a4)
{
  objc_msgSend(+[MSULogAnnotatedSum sum](MSULogAnnotatedSum, "sum"), "add:annotation:", 419430400, @"2*UPDATE_PARTITION_SIZE + UPDATE_APFS_RESERVE");
  APFSShouldSealSystemVolume();
  get_apfs_preallocate_min_is_allowed(a1);
  logfunction("", 1, @"snapshot application size : %lld (%lld MB)\n", v8, v9, v10, v11, v12, 0);
  logfunction("", 1, @"\n%s():%@\n", v13, v14, v15, v16, v17, (char)"get_snapshot_apply_and_reserve_sizes");
  if (a2) {
    *a2 = 419430400;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

uint64_t booted_from_recoveryos()
{
  if (booted_from_recoveryos_onceToken != -1) {
    dispatch_once(&booted_from_recoveryos_onceToken, &__block_literal_global_5);
  }
  return booted_from_recoveryos_booted_from_recoveryos;
}

void __booted_from_recoveryos_block_invoke(id a1)
{
  memset(v52, 0, sizeof(v52));
  id v50 = 0;
  int v9 = ramrod_probe_media((CFTypeRef *)&v50, v2, v3, v4, v5, v6, v7, v8);
  id v10 = v50;
  if (v9 == 1)
  {
    if (ramrod_get_system_partition_device_node((char *)v52, 0x20uLL) == 1)
    {
      bzero(&v51, 0x878uLL);
      if (statfs("/", &v51))
      {
        int v21 = *__error();
        logfunction("", 1, @"statfs(\"/\") failed. errno=%d\n", v22, v23, v24, v25, v26, v21);
      }
      else
      {
        uint64_t v27 = +[NSString stringWithUTF8String:v51.f_mntfromname];
        if (v27)
        {
          uint64_t v33 = v27;
          id v34 = +[NSRegularExpression regularExpressionWithPattern:@"(.+@)?(\\/dev\\/.+$|^root_device$)" options:1 error:&v50];
          if (v50)
          {
            logfunction("", 1, @"could not create regular expression object with pattern %s\n", v35, v36, v37, v38, v39, (char)"(.+@)?(\\/dev\\/.+$|^root_device$)");
          }
          else
          {
            uint64_t v40 = -[NSRegularExpression firstMatchInString:options:range:](v34, "firstMatchInString:options:range:", v33, 0, 0, [(NSString *)v33 length]);
            if (v40)
            {
              id v46 = [(NSTextCheckingResult *)v40 rangeAtIndex:2];
              if (v47) {
                id v48 = v46;
              }
              else {
                id v48 = 0;
              }
              if (!-[NSString isEqualToString:](-[NSString substringWithRange:](v33, "substringWithRange:", v48, v47), "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v52)))booted_from_recoveryos_booted_from_recoveryos = 1; {
            }
              }
            else
            {
              logfunction("", 1, @"f_mntfromname %@ has unrecognized pattern\n", v41, v42, v43, v44, v45, (char)v33);
            }
          }
        }
        else
        {
          logfunction("", 1, @"could not create string from f_mntfromname %s\n", v28, v29, v30, v31, v32, (char)v51.f_mntfromname);
        }
      }
    }
    else
    {
      logfunction("", 1, @"unable to find system volume\n", v16, v17, v18, v19, v20, v49);
    }
  }
  else
  {
    logfunction("", 1, @"Could not probe media: %@\n", v11, v12, v13, v14, v15, (char)v50);
  }
}

uint64_t saveCurrentEnvInfoForNeRD(uint64_t a1)
{
  uint64_t v202 = 0;
  char v201 = 0;
  id v200 = 0;
  id v1 = +[NSFileManager defaultManager];
  int v2 = MGGetBoolAnswer();
  uint64_t v8 = MGCopyAnswer();
  if (!v8) {
    logfunction("", 1, @"Failed to get currentOSVersion\n", v3, v4, v5, v6, v7, v183);
  }
  v196 = (void *)MGCopyAnswer();
  if (!v196) {
    logfunction("", 1, @"Failed to get currentProductVersion\n", v9, v10, v11, v12, v13, v183);
  }
  id v19 = (id)MGCopyAnswer();
  if (!v19)
  {
    logfunction("", 1, @"currentOSType indicated as nil. Overriding it to be %@\n", v14, v15, v16, v17, v18, (char)@"BootedOSReleaseTypeUnknown");
    id v19 = [objc_alloc((Class)NSString) initWithString:@"BootedOSReleaseTypeUnknown"];
  }
  v193 = [+[NSLocale currentLocale] languageCode];
  if (v193)
  {
    if (!v2) {
      goto LABEL_16;
    }
  }
  else
  {
    logfunction("", 1, @"Failed to get device locale\n", v20, v21, v22, v23, v24, v183);
    if (!v2)
    {
LABEL_16:
      BOOL v191 = 0;
      goto LABEL_17;
    }
  }
  CFBooleanRef v25 = (const __CFBoolean *)CFPreferencesCopyValue(@"SUDisableRedRingUI", @"com.apple.nerd", @"root", kCFPreferencesAnyHost);
  if (!v25) {
    goto LABEL_16;
  }
  CFBooleanRef v26 = v25;
  CFTypeID v27 = CFGetTypeID(v25);
  if (v27 != CFBooleanGetTypeID()) {
    goto LABEL_16;
  }
  int Value = CFBooleanGetValue(v26);
  BOOL v191 = Value != 0;
  id v34 = "FALSE(No effect)";
  if (Value) {
    id v34 = "TRUE";
  }
  logfunction("", 1, @"RedRingUIForceDisable is %s\n", v29, v30, v31, v32, v33, (char)v34);
LABEL_17:
  uint64_t v35 = (__CFString *)CFPreferencesCopyAppValue(@"EnableLiveAssetServerV2", @"com.apple.MobileAsset");
  v197 = v19;
  v198 = (void *)v8;
  if (!v35) {
    goto LABEL_34;
  }
  uint64_t v41 = v35;
  CFTypeID v42 = CFGetTypeID(v35);
  uint64_t v43 = v41;
  if (v42 != CFStringGetTypeID())
  {
    CFTypeID v45 = CFGetTypeID(v41);
    if (v45 == CFNumberGetTypeID())
    {
      uint64_t v43 = (__CFString *)[(__CFString *)v41 stringValue];
      CFRelease(v41);
      if (!v43) {
        goto LABEL_34;
      }
      goto LABEL_20;
    }
    CFTypeID v46 = CFGetTypeID(v41);
    if (v46 != CFBooleanGetTypeID())
    {
      CFRelease(v41);
      goto LABEL_34;
    }
    if (CFBooleanGetValue((CFBooleanRef)v41)) {
      uint64_t v43 = @"YES";
    }
    else {
      uint64_t v43 = @"NO";
    }
  }
  CFRelease(v41);
LABEL_20:
  if (([(__CFString *)v43 isEqual:@"off"] & 1) != 0
    || ([(__CFString *)v43 isEqual:@"false"] & 1) != 0
    || ([(__CFString *)v43 isEqual:@"NO"] & 1) != 0
    || ([(__CFString *)v43 isEqual:&__kCFBooleanFalse] & 1) != 0
    || ([(__CFString *)v43 isEqual:@"0"] & 1) != 0)
  {
    char v190 = 0;
    CFStringRef v44 = @"Pallas is disabled via default\n";
    goto LABEL_35;
  }
LABEL_34:
  char v190 = 1;
  CFStringRef v44 = @"Pallas is enabled\n";
LABEL_35:
  logfunction("", 1, v44, v36, v37, v38, v39, v40, v183);
  uint64_t v52 = MAGetPallasAudience();
  if (!v52) {
    logfunction("", 1, @"Failed to get pallas audience\n", v47, v48, v49, v50, v51, v184);
  }
  CFPropertyListRef v53 = CFPreferencesCopyAppValue(@"MobileAssetTokenFile", @"com.apple.MobileAsset");
  uint64_t v54 = (void *)v53;
  if (v53)
  {
    CFTypeID v55 = CFGetTypeID(v53);
    if (v55 == CFStringGetTypeID())
    {
      if (!objc_msgSend(objc_msgSend(v54, "pathComponents"), "containsObject:", @".."))
      {
        id v61 = [objc_alloc((Class)NSString) initWithFormat:@"/var/MobileSoftwareUpdate/%@", v54];
        goto LABEL_42;
      }
      logfunction("", 1, @"Invalid value set for TokenFile default\n", v56, v57, v58, v59, v60, v184);
    }
  }
  id v61 = 0;
LABEL_42:
  CFPropertyListRef v62 = CFPreferencesCopyAppValue(@"MobileAssetTokenOverride", @"com.apple.MobileAsset");
  char v63 = (void *)v62;
  CFTypeRef cf = v54;
  if (v62)
  {
    CFTypeID v64 = CFGetTypeID(v62);
    if (v64 == CFStringGetTypeID())
    {
      if (!v61) {
        id v61 = [objc_alloc((Class)NSString) initWithString:@"/var/MobileSoftwareUpdate/MobileAsset/token.tok"];
      }
      logfunction("", 1, @"Using %@ for token path\n", v65, v66, v67, v68, v69, (char)v61);
      uint64_t v199 = 0;
      if ([v63 writeToFile:v61 atomically:1 encoding:4 error:&v199]) {
        logfunction("", 1, @"Successfully wrote token to file %@\n", v70, v71, v72, v73, v74, (char)v61);
      }
      else {
        logfunction("", 1, @"Failed to write token to file %@ : %@\n", v70, v71, v72, v73, v74, (char)v61);
      }
    }
  }
  uint64_t v75 = ASServerURLForAssetType();
  LOBYTE(v81) = v202;
  if (v202 || (id v82 = (void *)v75) == 0)
  {
    if (!v202) {
      CFStringRef v81 = @"Unknown error";
    }
    logfunction("", 1, @"Failed to get update asset URL: %@\n", v76, v77, v78, v79, v80, (char)v81);
    id v82 = 0;
    uint64_t v202 = 0;
  }
  uint64_t v83 = ASServerURLForAssetType();
  LOBYTE(v89) = v202;
  if (v202 || (uint64_t v90 = (void *)v83) == 0)
  {
    if (!v202) {
      CFStringRef v89 = @"Unknown error";
    }
    logfunction("", 1, @"Failed to get Brain asset URL: %@\n", v84, v85, v86, v87, v88, (char)v89);
    uint64_t v90 = 0;
    uint64_t v202 = 0;
  }
  uint64_t v91 = ASServerURLForAssetType();
  LOBYTE(v97) = v202;
  if (v202 || (uint64_t v98 = (void *)v91) == 0)
  {
    if (!v202) {
      CFStringRef v97 = @"Unknown error";
    }
    logfunction("", 1, @"Failed to get Documentation asset URL: %@\n", v92, v93, v94, v95, v96, (char)v97);
    uint64_t v98 = 0;
    uint64_t v202 = 0;
  }
  v189 = v1;
  uint64_t v99 = ASServerURLForAssetType();
  LOBYTE(v105) = v202;
  if (v202 || (uint64_t v106 = (void *)v99) == 0)
  {
    if (!v202) {
      CFStringRef v105 = @"Unknown error";
    }
    logfunction("", 1, @"Failed to get Watch Documentation asset URL: %@\n", v100, v101, v102, v103, v104, (char)v105);
    uint64_t v106 = 0;
    uint64_t v202 = 0;
  }
  [v82 absoluteString];
  [v90 absoluteString];
  [v98 absoluteString];
  [v106 absoluteString];
  logfunction("", 1, @"SU configuration:\n Asset Audience : %@\n SU Asset URL: %@\n Brain URL: %@\n Documentation URL: %@\n WatchDocumentation URL: %@\n", v107, v108, v109, v110, v111, v52);
  CFBooleanRef v112 = (const __CFBoolean *)CFPreferencesCopyAppValue(@"RetainOriginalBootedOSState", @"com.apple.MobileSoftwareUpdate");
  CFBooleanRef v113 = v112;
  if (v112 {
    && (CFTypeID v114 = CFGetTypeID(v112), v114 == CFBooleanGetTypeID())
  }
    && CFBooleanGetValue(v113)
    && (logfunction("", 1, @"default set for retaining original bootedOSState plist, will not remove unchanged properties\n", v115, v116, v117, v118, v119, (char)v185), v185 = "/private/var/MobileSoftwareUpdate/", (id v120 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s/%s/%s"]) != 0))
  {
    v192 = v120;
    id v126 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v120];
  }
  else
  {
    id v126 = objc_alloc_init((Class)NSMutableDictionary);
    v192 = 0;
  }
  if (v191) {
    [v126 setValue:@"YES" forKey:@"RedRingDisabled"];
  }
  if (v198) {
    [v126 setValue:v198 forKey:@"BootedOSVersion"];
  }
  if (v197) {
    [v126 setValue:v197 forKey:@"BootedOSType"];
  }
  if (v193) {
    [v126 setValue:v193 forKey:@"BootedOSLanguage"];
  }
  if (v82) {
    objc_msgSend(v126, "setValue:forKey:", objc_msgSend(v82, "absoluteString"), @"BootedOSSUAssetURL");
  }
  if (v98) {
    objc_msgSend(v126, "setValue:forKey:", objc_msgSend(v98, "absoluteString"), @"BootedOSDocumentationURL");
  }
  if (v106) {
    objc_msgSend(v126, "setValue:forKey:", objc_msgSend(v106, "absoluteString"), @"BootedOSWatchDocumentationURL");
  }
  if (v90) {
    objc_msgSend(v126, "setValue:forKey:", objc_msgSend(v90, "absoluteString"), @"BootedOSBrainURL");
  }
  if (v52) {
    [v126 setValue:v52 forKey:@"BootedOSAssetAudience"];
  }
  if (v196) {
    [v126 setValue:v196 forKey:@"BootedOSProductVersion"];
  }
  if ((v190 & 1) == 0)
  {
    logfunction("", 1, @"Updating BootedOSState to indicate pallas is disabled\n", v121, v122, v123, v124, v125, (char)v185);
    [v126 setValue:@"YES" forKey:@"BootedOSHasPallasDisabled"];
  }
  if (v61)
  {
    logfunction("", 1, @"Updating BootedOSState with token path\n", v121, v122, v123, v124, v125, (char)v185);
    [v126 setValue:v61 forKey:@"BootedOSDawTokenPath"];
  }
  if (a1) {
    objc_msgSend(v126, "addEntriesFromDictionary:");
  }
  logfunction("", 1, @"Dictionary is %@\n", v121, v122, v123, v124, v125, (char)v126);
  v186 = "/private/var/MobileSoftwareUpdate/";
  id v132 = [objc_alloc((Class)NSString) initWithFormat:@"%s/%s"];
  if (!v132)
  {
    CFStringRef v162 = @"Failed to allocate path string to save Booted OS state\n";
LABEL_113:
    logfunction("", 1, v162, v127, v128, v129, v130, v131, (char)v186);
    id v143 = 0;
    goto LABEL_123;
  }
  if (![(NSFileManager *)v189 fileExistsAtPath:v132 isDirectory:&v201])
  {
    logfunction("", 1, @"Creating directory(%@) to save current OS state\n", v133, v134, v135, v136, v137, (char)v132);
    if (![(NSFileManager *)v189 createDirectoryAtPath:v132 withIntermediateDirectories:1 attributes:0 error:&v200])
    {
      LOBYTE(v186) = (_BYTE)v200;
      CFStringRef v162 = @"Failed to create directory : %@\n";
      goto LABEL_113;
    }
  }
  LOBYTE(v187) = (_BYTE)v132;
  id v143 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%s"];
  if (!v143)
  {
    CFStringRef v163 = @"Failed to allocate string to save the path for the state file\n";
LABEL_122:
    logfunction("", 1, v163, v138, v139, v140, v141, v142, (char)v187);
    goto LABEL_123;
  }
  logfunction("", 1, @"Saving env data to %@\n", v138, v139, v140, v141, v142, (char)v143);
  if (([v126 writeToFile:v143 atomically:1] & 1) == 0)
  {
    CFStringRef v163 = @"Failed to write env data to file\n";
    goto LABEL_122;
  }
  logfunction("", 1, @"Updating file permissions\n", v138, v139, v140, v141, v142, (char)v187);
  uint64_t v144 = (const char *)[v143 UTF8String];
  if (!v144)
  {
    logfunction("", 1, @"%s: Failed to get c string representation of the bootedOSStateFile path to fixup permissions..Deleting the file\n", v145, v146, v147, v148, v149, (char)"fixup_permissions_for_bootedos_state_file");
    goto LABEL_120;
  }
  char v150 = v144;
  if (chmod(v144, 0x1F8u))
  {
    __error();
    char v151 = __error();
    strerror(*v151);
    logfunction("", 1, @"%s: Failed to chmod bootedOsStateFile at %@ errno=%d: (%s)..Deleting the file\n", v152, v153, v154, v155, v156, (char)"fixup_permissions_for_bootedos_state_file");
    goto LABEL_120;
  }
  long long v164 = getpwnam("mobile");
  if (!v164)
  {
    logfunction("", 1, @"%s: Failed to get uid/gid for mobile user to chown the bootedOSState file..Deleting the file at %@\n", v165, v166, v167, v168, v169, (char)"fixup_permissions_for_bootedos_state_file");
LABEL_120:
    logfunction("", 1, @"Failed to set permissions on BootedOSState file..Deleting it\n", v157, v158, v159, v160, v161, v188);
    uint64_t v199 = 0;
    [(NSFileManager *)v189 removeItemAtPath:v143 error:&v199];
    if (v199)
    {
      v187 = "saveCurrentEnvInfoForNeRD";
      CFStringRef v163 = @"%s: Failed to delete BootedOsState file at %@. Error: %@\n";
      goto LABEL_122;
    }
LABEL_123:
    uint64_t v181 = 0;
    goto LABEL_124;
  }
  if (chown(v150, v164->pw_uid, v164->pw_gid))
  {
    __error();
    v175 = __error();
    strerror(*v175);
    logfunction("", 1, @"%s: Failed to chown bootedOSStateFile at %@ errno=%d: (%s)..Deleting the file\n", v176, v177, v178, v179, v180, (char)"fixup_permissions_for_bootedos_state_file");
    goto LABEL_120;
  }
  uint64_t v181 = 1;
  logfunction("", 1, @"%s: Successfully fixed up permissions for %@\n", v170, v171, v172, v173, v174, (char)"fixup_permissions_for_bootedos_state_file");
LABEL_124:

  if (v63) {
    CFRelease(v63);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v181;
}

uint64_t msu_running_in_limited_environment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (&_os_variant_uses_ephemeral_storage)
  {
    uint64_t v8 = os_variant_uses_ephemeral_storage();
    if (v8) {
      CFStringRef v9 = @"MSU running in limited env\n";
    }
    else {
      CFStringRef v9 = @"MSU running in normal env\n";
    }
  }
  else
  {
    uint64_t v8 = 1;
    CFStringRef v9 = @"MSU running in normal env(default)\n";
  }
  logfunction("", 1, v9, a4, a5, a6, a7, a8, v11);
  return v8;
}

uint64_t msu_should_save_env_info_for_recovery()
{
  return 1;
}

BOOL mount_source_preboot(uint64_t a1, NSString **a2, void *a3, unsigned char *a4, CFErrorRef *a5)
{
  char v30 = 0;
  if (mount_preboot_volume(0, &v30))
  {
    logfunction("", 1, @"Failed to mount preboot\n", v9, v10, v11, v12, v13, v27);
    CFStringRef v17 = @"Failed to mount preboot";
    CFIndex v18 = 62;
LABEL_5:
    error_internal_CFTypeRef cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", v18, 0, 0, v17, v14, v15, v16, (char)v28);
    if (!a5)
    {
      CFRelease(error_internal_cf);
      return 0;
    }
    BOOL v20 = 0;
    goto LABEL_7;
  }
  memset(v32, 0, sizeof(v32));
  bzero(v31, 0x400uLL);
  ramrod_get_preboot_partition_device_node((char *)v32, 0x20uLL);
  if (ramrod_get_mount_path((const char *)v32, v31, 0x400uLL))
  {
    CFStringRef v17 = @"Failed to get preboot mountpoint from dev node (%s)";
    uint64_t v28 = v32;
    CFIndex v18 = 68;
    goto LABEL_5;
  }
  CFErrorRef v29 = 0;
  int v22 = ramrod_change_filesystem_permissions_opt_err((char *)v32, v31, 0, &v29);
  BOOL v20 = v22 == 0;
  if (v22)
  {
    error_internal_CFTypeRef cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 69, v29, 0, @"Failed to upgrade preboot mountpoint to read/write", v23, v24, v25, v27);
    if (!a5)
    {
      CFRelease(error_internal_cf);
      return v20;
    }
LABEL_7:
    *a5 = error_internal_cf;
    return v20;
  }
  CFBooleanRef v26 = +[NSString stringWithUTF8String:v31];
  if (a2) {
    *a2 = v26;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = v30;
  }
  return v20;
}

BOOL unmount_source_preboot()
{
  return unmount_preboot_volume() == 0;
}

id __cryptex_size_requirement_for_update_type_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = +[NSString stringWithFormat:@"update_attributes[\"%@\"][%lu(%@)]", @"CryptexSizeInfo", a2, a3];
  id v7 = [a4 objectForKeyedSubscript:@"CryptexSize"];
  id v8 = [v7 unsignedLongLongValue];
  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += ((void)v8 << 20) / 5uLL + ((void)v8 << 20);
    [*(id *)(a1 + 32) add:v6 annotationFormat:@"CryptexSize"];
  }
  id v9 = [a4 objectForKeyedSubscript:@"ReversePatchSize"];
  id v10 = [v9 unsignedLongLongValue];
  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += (void)v10 << 20;
    [*(id *)(a1 + 32) add:(void)v10 << 20, @"%@[\"%@\"]", v6, @"ReversePatchSize" annotationFormat];
  }
  id v11 = [a4 objectForKeyedSubscript:@"CryptexSizeDelta"];
  id result = [v11 unsignedLongLongValue];
  if (v11)
  {
    if (*(_DWORD *)(a1 + 48) == 1)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += (void)result << 20;
      return [*(id *)(a1 + 32) add:v6 annotationFormat:@"CryptexSizeDelta"];
    }
  }
  return result;
}

void MSUCleanupPreboot()
{
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  char v49 = 0;
  if (!mount_source_preboot(1, &v51, &v50, &v49, 0)) {
    return;
  }
  id v0 = +[NSMutableDictionary dictionary];
  [v0 setObject:v51 forKeyedSubscript:@"PrebootMountpoint"];
  uint64_t v7 = v50;
  if (v50) {
    [v0 setObject:v50 forKeyedSubscript:@"VolumeGroupUUID"];
  }
  ramrod_splat_cleanup(v0, v1, v7, v2, v3, v4, v5, v6);
  if (v49) {
    unmount_source_preboot();
  }
  id v8 = +[NSFileManager defaultManager];
  CFDataRef v9 = (const __CFData *)MGCopyAnswer();
  if (!v9)
  {
    CFStringRef v26 = @"Unable to query boot manifest hash\n";
LABEL_13:
    logfunction("", 1, v26, v10, v11, v12, v13, v14, v45);
    return;
  }
  CFDataRef v15 = v9;
  CFTypeID v16 = CFGetTypeID(v9);
  if (v16 != CFDataGetTypeID())
  {
    CFStringRef v26 = @"Boot manifest hash is not CFData\n";
    goto LABEL_13;
  }
  CFStringRef v17 = +[NSMutableString stringWithCapacity:2 * CFDataGetLength(v15)];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = __MSUCleanupPreboot_block_invoke;
  v48[3] = &unk_1000593F8;
  v48[4] = v17;
  [(__CFData *)v15 enumerateByteRangesUsingBlock:v48];
  id v18 = [@"/private/preboot" stringByAppendingPathComponent:v17];
  id v19 = [(NSFileManager *)v8 attributesOfItemAtPath:v18 error:0];
  if (v19)
  {
    if ([(NSDictionary *)v19 fileType] == NSFileTypeSymbolicLink)
    {
      uint64_t v25 = [(NSFileManager *)v8 destinationOfSymbolicLinkAtPath:v18 error:0];
      if (v25) {
        logfunction("", 1, @"Current manifest hash is a link to %@\n", v27, v28, v29, v30, v31, (char)v25);
      }
    }
    else
    {
      uint64_t v25 = 0;
    }
    uint64_t v32 = [(NSFileManager *)v8 contentsOfDirectoryAtPath:@"/private/preboot" error:0];
    bzero(&v52, 0x878uLL);
    if (statfs((const char *)[@"/private/preboot" fileSystemRepresentation], &v52))
    {
      int v33 = *__error();
      id v34 = __error();
      strerror(*v34);
      logfunction("", 1, @"Error %d (%s) statfs-ing %@\n", v35, v36, v37, v38, v39, v33);
    }
    else if ((v52.f_flags & 0x4001) == 1)
    {
      CFTypeRef cf = 0;
      if (ramrod_change_filesystem_permissions_opt_err(v52.f_mntfromname, v52.f_mntonname, 0, (CFErrorRef *)&cf))logfunction("", 1, @"Failed to upgrade preboot mount to read/write with error:%@\n", v40, v41, v42, v43, v44, (char)cf); {
      else
      }
        logfunction("", 1, @"Successfully upgraded preboot mount to read/write\n", v40, v41, v42, v43, v44, v45);
      if (cf) {
        CFRelease(cf);
      }
    }
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = __MSUCleanupPreboot_block_invoke_2;
    v46[3] = &unk_100059420;
    v46[4] = @"/private/preboot";
    v46[5] = v8;
    v46[6] = v17;
    v46[7] = v25;
    [(NSArray *)v32 enumerateObjectsUsingBlock:v46];
  }
  else
  {
    logfunction("", 1, @"No preboot path found, skipping cleanup\n", v20, v21, v22, v23, v24, v45);
  }
  CFRelease(v15);
}

id *__MSUCleanupPreboot_block_invoke(id *result, uint64_t a2, uint64_t a3, int a4, unsigned char *a5)
{
  int v6 = a4;
  if (a4)
  {
    uint64_t v7 = result;
    id v8 = (unsigned __int8 *)(a2 + a3);
    do
    {
      unsigned int v9 = *v8++;
      id result = (id *)objc_msgSend(v7[4], "appendFormat:", @"%02X", v9);
      --v6;
    }
    while (v6);
  }
  *a5 = 0;
  return result;
}

int *__MSUCleanupPreboot_block_invoke_2(id *a1, void *a2)
{
  id v4 = [a1[4] stringByAppendingPathComponent:a2];
  id v5 = [a1[5] attributesOfItemAtPath:v4 error:0];
  if (v5
    && [v5 fileType] == NSFileTypeSymbolicLink
    && (id v14 = [a1[5] destinationOfSymbolicLinkAtPath:v4 error:0]) != 0
    && [v14 isEqualToString:a1[6]])
  {
    logfunction("", 1, @"Manifest hash %@ is linked to %@\n", v15, v16, v17, v18, v19, (char)a2);
    int v6 = a2;
  }
  else
  {
    int v6 = 0;
  }
  id result = (int *)[a1[6] isEqualToString:a2];
  if ((result & 1) == 0)
  {
    id result = (int *)[v6 isEqualToString:a2];
    if ((result & 1) == 0)
    {
      id result = (int *)[a1[7] isEqualToString:a2];
      if ((result & 1) == 0)
      {
        id result = (int *)[@"active" isEqualToString:a2];
        if ((result & 1) == 0)
        {
          id result = (int *)[@"cryptex1" isEqualToString:a2];
          if ((result & 1) == 0)
          {
            id result = (int *)[@"downlevel" isEqualToString:a2];
            if ((result & 1) == 0)
            {
              id result = (int *)[@"Cryptexes" isEqualToString:a2];
              if ((result & 1) == 0)
              {
                id result = (int *)[@".DarwinDepot" isEqualToString:a2];
                if ((result & 1) == 0)
                {
                  id result = (int *)[@".roots-installed" isEqualToString:a2];
                  if ((result & 1) == 0)
                  {
                    if (objc_msgSend(a1[5], "removeItemAtPath:error:", objc_msgSend(a1[4], "stringByAppendingPathComponent:", a2), 0))CFStringRef v13 = @"Removed preboot path %@\n"; {
                    else
                    }
                      CFStringRef v13 = @"Failed to remove preboot path %@\n";
                    return logfunction("", 1, v13, v8, v9, v10, v11, v12, (char)a2);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t MSUCleanupPreparePath_server(int a1, int a2, CFErrorRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    int v10 = DeleteUpgradeBootCommand();
    buffer[0] = 0;
    msu_delete_nvram_variable_if_exists(@"update-volume", buffer);
    int v11 = buffer[0] | v10;
    msu_delete_nvram_variable_if_exists(@"target-uuid", buffer);
    if (v11 | buffer[0]) {
      msu_sync_nvram(1, v12, v13, v14, v15, v16, v17, v18);
    }
    logfunction("", 1, @"Purging any suspended/pended update...\n", v14, v15, v16, v17, v18, v246);
    unlink("/private/var/MobileSoftwareUpdate/Update.plist");
    unlink("/private/var/MobileSoftwareUpdate/Preflight.plist");
    unlink("/private/var/MobileSoftwareUpdate/brain_path.plist");
    clear_apply_state();
    MSUCleanupPreboot();
  }
  if (a2) {
    [+[MSUFreeSpaceManager sharedInstance] resetAPFSFreeBlocksThreshold:0];
  }
  else {
    logfunction("", 1, @"Not resetting APFS free blocks threshold\n", a4, a5, a6, a7, a8, v246);
  }
  bzero(buffer, 0x400uLL);
  char v19 = 1;
  logfunction("", 1, @"Cleaning up unused prepared updates\n", v20, v21, v22, v23, v24, v246);
  init_update_partition_with_reserve_and_reformat(0, "/private/var/MobileSoftwareUpdate/", 0, v25, v26, v27, v28, v29);
  dict = (void *)load_dict("/private/var/MobileSoftwareUpdate/Update.plist");
  CFDictionaryRef v31 = (const __CFDictionary *)load_dict("/private/var/MobileSoftwareUpdate/Preflight.plist");
  CFDictionaryRef v32 = v31;
  if (!v31) {
    goto LABEL_22;
  }
  if (!dict
    || (id v33 = -[__CFDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", @"update-asset-attributes"), v34 = [dict objectForKeyedSubscript:@"update-asset-attributes"], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)|| (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)|| (v35 = objc_msgSend(v33, "objectForKeyedSubscript:", @"UpdateUUID"), v36 = objc_msgSend(v34, "objectForKeyedSubscript:", @"UpdateUUID"), !v35)|| !v36|| !objc_msgSend(v35, "isEqual:", v36))
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v32, @"suspended-update-path");
    if (!Value || (CFStringRef v43 = Value, v44 = CFGetTypeID(Value), v44 != CFStringGetTypeID()))
    {
      char v19 = 0;
      goto LABEL_22;
    }
    memset(&v262, 0, sizeof(v262));
    CFStringGetCString(v43, buffer, 1024, 0x8000100u);
    char v45 = realpath_DARWIN_EXTSN(buffer, 0);
    if (v45)
    {
      CFTypeID v46 = v45;
      if (stat(v45, &v262))
      {
        free(v46);
LABEL_122:
        CFTypeID v46 = 0;
        int v52 = 0;
        goto LABEL_123;
      }
      int v52 = 1;
      logfunction("", 1, @"Preflighted update at %s\n", v47, v48, v49, v50, v51, (char)v46);
    }
    else
    {
      if (*__error() == 2)
      {
        logfunction("", 1, @"Preflighted update at %s has already been cleaned up\n", v65, v66, v67, v68, v69, (char)buffer);
        goto LABEL_122;
      }
      CFIndex v154 = *__error();
      uint64_t v155 = __error();
      strerror(*v155);
      error_internal_CFDictionaryRef cf = _create_error_internal_cf(kCFErrorDomainPOSIX, v154, 0, 0, @"Could not realpath(3) path %s: %s", v156, v157, v158, (char)buffer);
      if (!a3)
      {
        CFRelease(error_internal_cf);
        goto LABEL_122;
      }
      CFTypeID v46 = 0;
      int v52 = 0;
      *a3 = error_internal_cf;
    }
LABEL_123:
    char v19 = 0;
    goto LABEL_23;
  }
  logfunction("", 1, @"Ignoring preflighted update, it appears to be the same as the suspended/pending update\n", v37, v38, v39, v40, v41, v247);
  CFRelease(v32);
  CFDictionaryRef v32 = 0;
LABEL_22:
  CFTypeID v46 = 0;
  int v52 = 0;
LABEL_23:
  int v53 = 0;
  CFStringRef v54 = 0;
  CFTypeRef v254 = dict;
  if (!v46 && dict)
  {
    CFStringRef v55 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)dict, @"update-path");
    if (v55 && (CFStringRef v56 = v55, v57 = CFGetTypeID(v55), v57 == CFStringGetTypeID())
      || (CFStringRef v56 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)dict, @"suspended-update-path")) != 0)
    {
      CFTypeID v58 = CFGetTypeID(v56);
      if (v58 == CFStringGetTypeID())
      {
        memset(&v262, 0, sizeof(v262));
        CFStringGetCString(v56, buffer, 1024, 0x8000100u);
        uint64_t v59 = realpath_DARWIN_EXTSN(buffer, 0);
        CFTypeID v46 = v59;
        if (v59)
        {
          if (!stat(v59, &v262))
          {
            if (CFDictionaryContainsKey((CFDictionaryRef)dict, @"suspended-update-path"))
            {
              int v53 = 1;
              logfunction("", 1, @"Suspended update at %s\n", v60, v61, v62, v63, v64, (char)v46);
LABEL_40:
              CFStringRef v54 = 0;
              goto LABEL_41;
            }
            CFStringRef v54 = (const __CFString *)copy_nvram_variable(@"boot-command");
            logfunction("", 1, @"boot-command: '%@'\n", v172, v173, v174, v175, v176, (char)v54);
            if (v54)
            {
              CFTypeID v177 = CFGetTypeID(v54);
              if (v177 == CFStringGetTypeID() && CFEqual(v54, @"upgrade"))
              {
                CFDictionaryRef v80 = v32;
                char v81 = v19;
                int v82 = v52;
                int v53 = 1;
                logfunction("", 1, @"Pending update at %s\n", v178, v179, v180, v181, v182, (char)v46);
                goto LABEL_47;
              }
            }
LABEL_34:
            int v53 = 0;
            goto LABEL_41;
          }
        }
        else
        {
          if (*__error() != 2)
          {
            CFIndex v160 = *__error();
            uint64_t v161 = __error();
            strerror(*v161);
            CFErrorRef v165 = _create_error_internal_cf(kCFErrorDomainPOSIX, v160, 0, 0, @"Could not realpath(3) path %s: %s", v162, v163, v164, (char)buffer);
            if (a3) {
              *a3 = v165;
            }
            else {
              CFRelease(v165);
            }
            uint64_t v111 = 0;
            if (v19) {
              goto LABEL_105;
            }
            goto LABEL_104;
          }
          logfunction("", 1, @"Update at %s has already been cleaned up\n", v70, v71, v72, v73, v74, (char)buffer);
        }
        int v53 = 0;
        goto LABEL_40;
      }
    }
    CFTypeID v46 = 0;
    CFStringRef v54 = 0;
    goto LABEL_34;
  }
LABEL_41:
  CFDictionaryRef v80 = v32;
  char v81 = v19;
  if (release_baseband_ticket_lock((uint64_t)a3))
  {
    int v82 = v52;
  }
  else
  {
    if (a3) {
      CFErrorRef v83 = *a3;
    }
    else {
      LOBYTE(v83) = 0;
    }
    int v82 = v52;
    logfunction("", 1, @"Warning: releasing baseband ticket lock failed: %@\n", v75, v76, v77, v78, v79, (char)v83);
  }
LABEL_47:
  uint64_t v84 = realpath_DARWIN_EXTSN("/private/var/MobileSoftwareUpdate/", 0);
  uint64_t v85 = v84;
  if (!v84)
  {
    CFIndex v105 = *__error();
    uint64_t v106 = __error();
    strerror(*v106);
    CFErrorRef v110 = _create_error_internal_cf(kCFErrorDomainPOSIX, v105, 0, 0, @"Could not realpath(3) path %s: %s", v107, v108, v109, (char)"/private/var/MobileSoftwareUpdate/");
    if (a3)
    {
      uint64_t v111 = 0;
      *a3 = v110;
    }
    else
    {
      CFRelease(v110);
      uint64_t v111 = 0;
    }
    uint64_t v85 = 0;
LABEL_97:
    char v112 = v81;
    CFDictionaryRef v32 = v80;
    dict = (void *)v254;
    if (!v46) {
      goto LABEL_99;
    }
    goto LABEL_98;
  }
  v263[0] = v84;
  v263[1] = 0;
  uint64_t v86 = fts_open(v263, 21, 0);
  uint64_t v87 = v85;
  if (!v86)
  {
    CFIndex v113 = *__error();
    CFTypeID v114 = __error();
    strerror(*v114);
    CFErrorRef v118 = _create_error_internal_cf(kCFErrorDomainPOSIX, v113, 0, 0, @"Could not fts_open(3) path %s: %s", v115, v116, v117, (char)v85);
    if (a3)
    {
      uint64_t v111 = 0;
      *a3 = v118;
    }
    else
    {
      CFRelease(v118);
      uint64_t v111 = 0;
    }
    goto LABEL_97;
  }
  uint64_t v88 = v86;
  CFStringRef v251 = v54;
  v252 = v87;
  v253 = a3;
  CFStringRef v89 = fts_read(v86);
  int v90 = v82 | v53;
  CFDictionaryRef cf = v80;
  char v249 = v81;
  if (v89)
  {
    uint64_t v91 = v89;
    do
    {
      if (v91->fts_info == 1 && v91->fts_level >= 1)
      {
        if (!strncmp(v91->fts_name, "softwareupdate", 0xEuLL))
        {
          fts_path = v91->fts_path;
          if (!v90 || strcmp(v91->fts_path, v46))
          {
            logfunction("", 1, @"Removing update at %s\n", v92, v93, v94, v95, v96, (char)fts_path);
            if (removefile(v91->fts_path, 0, 1u))
            {
              CFIndex v98 = *__error();
              uint64_t v99 = v91->fts_path;
              uint64_t v100 = __error();
              strerror(*v100);
              CFErrorRef v104 = _create_error_internal_cf(kCFErrorDomainPOSIX, v98, 0, 0, @"Could not removefile(3) path %s: %s", v101, v102, v103, (char)v99);
              if (v253) {
                CFErrorRef *v253 = v104;
              }
              else {
                CFRelease(v104);
              }
            }
          }
        }
        fts_set(v88, v91, 4);
      }
      uint64_t v91 = fts_read(v88);
    }
    while (v91);
    fts_close(v88);
    dict = (void *)v254;
    CFDictionaryRef v32 = cf;
    char v112 = v249;
    if (v90)
    {
LABEL_66:
      uint64_t v111 = 1;
      CFStringRef v54 = v251;
      uint64_t v85 = v252;
      if (!v46) {
        goto LABEL_99;
      }
LABEL_98:
      free(v46);
      goto LABEL_99;
    }
  }
  else
  {
    fts_close(v88);
    char v112 = v81;
    CFDictionaryRef v32 = v80;
    dict = (void *)v254;
    if (v90) {
      goto LABEL_66;
    }
  }
  int v119 = DeleteUpgradeBootCommand();
  unsigned __int8 v256 = 0;
  msu_delete_nvram_variable_if_exists(@"target-uuid", &v256);
  uint64_t v85 = v252;
  if (v256 | v119) {
    msu_sync_nvram(1, v120, v121, v122, v123, v124, v125, v126);
  }
  id v132 = v253;
  if (!unlink("/private/var/MobileSoftwareUpdate/Update.plist")) {
    logfunction("", 1, @"Deleted Preflight.plist because no preflighted update was found\n", v127, v128, v129, v130, v131, v247);
  }
  if (!unlink("/private/var/MobileSoftwareUpdate/Preflight.plist")) {
    logfunction("", 1, @"Deleted Update.plist because no suspended (or pending) update was found\n", v135, v136, v137, v138, v139, v247);
  }
  CFStringRef v54 = v251;
  if (!mount_update_partition_if_exists("/private/var/MobileSoftwareUpdate/", v133, v134, v135, v136, v137, v138, v139))
  {
    v263[0] = "/private/var/MobileSoftwareUpdate/";
    uint64_t v140 = fts_open(v263, 21, 0);
    if (v140)
    {
      uint64_t v141 = v140;
      uint64_t v142 = fts_read(v140);
      if (v142)
      {
        id v143 = v142;
        do
        {
          int fts_info = v143->fts_info;
          if (fts_info != 8)
          {
            if (fts_info == 1 && v143->fts_level >= 1) {
              fts_set(v141, v143, 4);
            }
            goto LABEL_86;
          }
          if (!strncmp("patchd-", v143->fts_name, 7uLL))
          {
            __endptr[0] = 0;
            unint64_t v145 = strtoull(&v143->fts_name[7], __endptr, 10);
            int v146 = (int)__endptr[0];
            if (__endptr[0])
            {
              uint64_t v147 = v145;
              if (!strcmp(__endptr[0], ".log"))
              {
                bzero(&v262, 0x400uLL);
                snprintf((char *)&v262, 0x400uLL, "%s%.*s", ".patchd-saved-", v146 - (v143 + 111), &v143->fts_name[7]);
                if (!access((const char *)&v262, 0))
                {
                  logfunction("", 1, @"Not saving log file %s\n", v148, v149, v150, v151, v152, (char)v143->fts_path);
LABEL_94:
                  unlink(v143->fts_path);
                  goto LABEL_86;
                }
                logfunction("", 1, @"Saving log file %s\n", v148, v149, v150, v151, v152, (char)v143->fts_path);
                if (!submitRestoreLogFile(0, v147, v143->fts_path, 0)) {
                  goto LABEL_94;
                }
              }
            }
          }
LABEL_86:
          id v143 = fts_read(v141);
        }
        while (v143);
      }
      fts_close(v141);
      id v132 = v253;
      CFStringRef v54 = v251;
    }
    else
    {
      CFIndex v166 = *__error();
      uint64_t v167 = __error();
      strerror(*v167);
      CFErrorRef v171 = _create_error_internal_cf(kCFErrorDomainPOSIX, v166, 0, 0, @"Could not fts_open(3) path %s: %s", v168, v169, v170, (char)"/private/var/MobileSoftwareUpdate/");
      if (v253) {
        CFErrorRef *v253 = v171;
      }
      else {
        CFRelease(v171);
      }
    }
    uint64_t v85 = v252;
  }
  v248 = v46;
  id v183 = [@"/private/var/MobileSoftwareUpdate/" stringByAppendingPathComponent:@"/mobile/Library/Logs/CrashReporter"];
  id v184 = [@"/private/var" stringByAppendingPathComponent:@"/mobile/Library/Logs/CrashReporter"];
  v185 = +[NSFileManager defaultManager];
  if (os_variant_is_recovery())
  {
    logfunction("", 1, @"%s: Not preserving crash reporter logs on recoveryOS\n", v186, v187, v188, v189, v190, (char)"_migrate_ramdisk_logs");
  }
  else if ([(NSFileManager *)v185 fileExistsAtPath:v183])
  {
    id v261 = 0;
    v196 = [(NSFileManager *)v185 contentsOfDirectoryAtPath:v183 error:&v261];
    obj = v196;
    if (!v196 || v261)
    {
      objc_msgSend(objc_msgSend(v261, "description"), "UTF8String");
      logfunction("", 1, @"%s: Failed to get list of crash logs: %s\n", v214, v215, v216, v217, v218, (char)"_migrate_ramdisk_logs");
    }
    else
    {
      long long v259 = 0u;
      long long v260 = 0u;
      *(_OWORD *)__endptr = 0u;
      long long v258 = 0u;
      id v197 = [(NSArray *)v196 countByEnumeratingWithState:__endptr objects:&v262 count:16];
      if (v197)
      {
        id v198 = v197;
        uint64_t v199 = *(void *)v258;
        do
        {
          for (uint64_t i = 0; i != v198; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v258 != v199) {
              objc_enumerationMutation(obj);
            }
            uint64_t v201 = *(void *)&__endptr[1][8 * (void)i];
            id v202 = [v183 stringByAppendingPathComponent:v201];
            id v203 = [v184 stringByAppendingPathComponent:v201];
            if ([(NSFileManager *)v185 fileExistsAtPath:v203])
            {
              [(NSFileManager *)v185 removeItemAtPath:v203 error:&v261];
              if (v261)
              {
                objc_msgSend(objc_msgSend(v261, "description"), "UTF8String");
                logfunction("", 1, @"%s: Failed to remove old log before overwriting: %s\n", v204, v205, v206, v207, v208, (char)"_migrate_ramdisk_logs");
                id v261 = 0;
              }
            }
            [(NSFileManager *)v185 moveItemAtPath:v202 toPath:v203 error:&v261];
            if (v261)
            {
              [v202 fileSystemRepresentation];
              objc_msgSend(objc_msgSend(v261, "description"), "UTF8String");
              logfunction("", 1, @"%s: Failed to move CrashReporter log %s: %s\n", v209, v210, v211, v212, v213, (char)"_migrate_ramdisk_logs");
              id v261 = 0;
            }
          }
          id v198 = [(NSArray *)obj countByEnumeratingWithState:__endptr objects:&v262 count:16];
        }
        while (v198);
      }
    }
    uint64_t v85 = v252;
    id v132 = v253;
    CFStringRef v54 = v251;
  }
  else
  {
    logfunction("", 1, @"%s: No ramdisk created CrashReporter dir found\n", v191, v192, v193, v194, v195, (char)"_migrate_ramdisk_logs");
  }
  cleanup_boot_environment("/private/var/MobileSoftwareUpdate/");
  dict = (void *)v254;
  CFDictionaryRef v32 = cf;
  char v112 = v249;
  CFTypeID v46 = v248;
  if (removefile("/private/var/mobile/MobileSoftwareUpdate/UpdateDownloads", 0, 1u) && *__error() != 2)
  {
    CFIndex v219 = *__error();
    v220 = __error();
    strerror(*v220);
    CFErrorRef v224 = _create_error_internal_cf(kCFErrorDomainPOSIX, v219, 0, 0, @"Could not removefile(3) downloaded updates at %s: %s", v221, v222, v223, (char)"/private/var/mobile/MobileSoftwareUpdate/UpdateDownloads");
    if (!v132)
    {
      CFRelease(v224);
      char v231 = MSUDemotionCleanup(0);
      LOBYTE(v230) = 0;
      uint64_t v85 = v252;
      if (v231) {
        goto LABEL_160;
      }
      goto LABEL_159;
    }
    *id v132 = v224;
    uint64_t v85 = v252;
  }
  if (MSUDemotionCleanup(v132)) {
    goto LABEL_160;
  }
  if (v132) {
    CFErrorRef v230 = *v132;
  }
  else {
    LOBYTE(v230) = 0;
  }
LABEL_159:
  logfunction("", 1, @"Warning: app demotion cleanup failed: %@\n", v225, v226, v227, v228, v229, (char)v230);
LABEL_160:
  v232 = copy_rooted_snapshot_name();
  if (v232)
  {
    v239 = v232;
    if (!mount_apfs_system_readwrite_with_revert("/private/var/MobileSoftwareUpdate/mnt1", v232, v233, v234, v235, v236, v237, v238))
    {
      v240 = copy_root_snapshot_name_from_dt();
      *(void *)&v262.st_dev = _NSConcreteStackBlock;
      v262.st_ino = 3221225472;
      *(void *)&v262.st_uid = __MSUCleanupPreparePath_block_invoke;
      *(void *)&v262.st_rdev = &__block_descriptor_40_e12_B20__0i8r_12l;
      v262.st_atimespec.tv_sec = (__darwin_time_t)v240;
      enumerate_apfs_snapshots("/private/var/MobileSoftwareUpdate/mnt1", (uint64_t)&v262);
      if (v240) {
        free(v240);
      }
      if (unmount("/private/var/MobileSoftwareUpdate/mnt1", 0))
      {
        v241 = __error();
        CFErrorRef v245 = _create_error_internal_cf(kCFErrorDomainPOSIX, *v241, 0, 0, @"Could not unmount live system volume", v242, v243, v244, v247);
        if (v132) {
          *id v132 = v245;
        }
        else {
          CFRelease(v245);
        }
      }
    }
    free(v239);
  }
  uint64_t v111 = 1;
  if (v248) {
    goto LABEL_98;
  }
LABEL_99:
  if (v85) {
    free(v85);
  }
  if (v54) {
    CFRelease(v54);
  }
  if ((v112 & 1) == 0) {
LABEL_104:
  }
    CFRelease(v32);
LABEL_105:
  if (dict) {
    CFRelease(dict);
  }
  return v111;
}

uint64_t MSUCleanupLogs_server(time_t a1, CFNumberRef *a2, CFErrorRef *a3)
{
  if (a1 < 0)
  {
    strerror(22);
    error_internal_CFDictionaryRef cf = _create_error_internal_cf(kCFErrorDomainPOSIX, 22, 0, 0, @"retention value is negative: %lld (%s)", v39, v40, v41, a1);
  }
  else
  {
    v61[0] = "/private/var/MobileSoftwareUpdate/";
    v61[1] = 0;
    int v6 = fts_open(v61, 21, 0);
    if (v6)
    {
      uint64_t v7 = v6;
      time_t v8 = time(0);
      uint64_t v9 = fts_read(v7);
      if (!v9)
      {
        uint64_t v43 = 1;
        goto LABEL_40;
      }
      int v10 = v9;
      time_t v58 = v8;
      CFErrorRef v11 = 0;
      uint64_t v59 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        int fts_info = v10->fts_info;
        if (fts_info == 8)
        {
          if (!strncmp("patchd-", v10->fts_name, 7uLL) || !strncmp("install-", v10->fts_name, 8uLL))
          {
            unint64_t fts_namelen = v10->fts_namelen;
            if (fts_namelen >= 4 && !strcmp(&v10->fts_name[fts_namelen - 4], ".log"))
            {
              fts_path = v10->fts_path;
              if (v58 - v10->fts_statp->st_birthtimespec.tv_sec <= a1)
              {
                logfunction("", 1, @"keep %s, age:%lld, retention:%lld\n", v14, v15, v16, v17, v18, (char)fts_path);
                uint64_t tv_sec = v59;
                if (v10->fts_statp->st_birthtimespec.tv_sec < v59) {
                  uint64_t tv_sec = v10->fts_statp->st_birthtimespec.tv_sec;
                }
                uint64_t v59 = tv_sec;
              }
              else if (unlink(fts_path))
              {
                uint64_t v25 = v10->fts_path;
                uint64_t v26 = __error();
                strerror(*v26);
                logfunction("", 1, @"failed to unlink %s: %s\n", v27, v28, v29, v30, v31, (char)v25);
                if (!v11)
                {
                  CFIndex v32 = *__error();
                  id v33 = v10->fts_path;
                  id v34 = __error();
                  strerror(*v34);
                  CFErrorRef v11 = _create_error_internal_cf(kCFErrorDomainPOSIX, v32, 0, 0, @"Could not unlink path %s: %s", v35, v36, v37, (char)v33);
                }
              }
              else
              {
                logfunction("", 1, @"removed %s, age:%lld, retention:%lld\n", v20, v21, v22, v23, v24, (char)v10->fts_path);
              }
            }
          }
        }
        else if (fts_info == 1 && v10->fts_level >= 1)
        {
          fts_set(v7, v10, 4);
        }
        int v10 = fts_read(v7);
      }
      while (v10);
      if (v11)
      {
        if (a3)
        {
          uint64_t v43 = 0;
          *a3 = v11;
LABEL_40:
          fts_close(v7);
          return v43;
        }
        CFErrorRef v56 = v11;
      }
      else
      {
        uint64_t v43 = 1;
        if (!a2) {
          goto LABEL_40;
        }
        if (v59 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_40;
        }
        time_t valuePtr = v58 - v59;
        CFNumberRef v49 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
        *a2 = v49;
        if (v49) {
          goto LABEL_40;
        }
        CFIndex v50 = *__error();
        uint64_t v51 = __error();
        char v52 = strerror(*v51);
        CFErrorRef v56 = _create_error_internal_cf(kCFErrorDomainPOSIX, v50, 0, 0, @"failed to create CFNumber: %s", v53, v54, v55, v52);
        if (a3)
        {
          *a3 = v56;
LABEL_39:
          uint64_t v43 = 0;
          goto LABEL_40;
        }
      }
      CFRelease(v56);
      goto LABEL_39;
    }
    CFIndex v44 = *__error();
    char v45 = __error();
    strerror(*v45);
    error_internal_CFDictionaryRef cf = _create_error_internal_cf(kCFErrorDomainPOSIX, v44, 0, 0, @"Could not fts_open(3) path %s: %s", v46, v47, v48, (char)"/private/var/MobileSoftwareUpdate/");
  }
  if (a3)
  {
    uint64_t v43 = 0;
    *a3 = error_internal_cf;
  }
  else
  {
    CFRelease(error_internal_cf);
    return 0;
  }
  return v43;
}

uint64_t DeleteUpgradeBootCommand()
{
  CFStringRef v0 = (const __CFString *)copy_nvram_variable(@"boot-command");
  if (!v0) {
    return 0;
  }
  CFStringRef v1 = v0;
  CFTypeID v2 = CFGetTypeID(v0);
  if (v2 == CFStringGetTypeID() && CFEqual(v1, @"upgrade"))
  {
    delete_nvram_variable(@"boot-command");
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
  }
  CFRelease(v1);
  return v3;
}

uint64_t __MSUCleanupPreparePath_block_invoke(uint64_t a1, int a2, char *__s1)
{
  if (!strncmp(__s1, "com.apple.os.update-", 0x14uLL))
  {
    int v6 = *(const char **)(a1 + 32);
    if (v6 && !strcmp(__s1, v6))
    {
      logfunction("", 1, @"Skipping snapshot %s\n", v7, v8, v9, v10, v11, (char)__s1);
    }
    else if (fs_snapshot_delete(a2, __s1, 0))
    {
      uint64_t v17 = __error();
      strerror(*v17);
      logfunction("", 1, @"Unable to delete snapshot %s: %s\n", v18, v19, v20, v21, v22, (char)__s1);
    }
    else
    {
      logfunction("", 1, @"Successfully deleted snapshot %s\n", v12, v13, v14, v15, v16, (char)__s1);
    }
  }
  return 1;
}

uint64_t lzvn_decode_buffer(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a2)
  {
    if (a3 <= a3 + a4 - 8) {
      __asm { BR              X17 }
    }
    __asm { BTI             j }
    return 0;
  }
  else
  {
    __asm { BTI             j }
    return 0;
  }
}

int32x4_t **lz4_encode_2gb(int32x4_t **result, uint64_t a2, char **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int32x4_t v7 = vdupq_n_s32(0xFFFFFFFF);
  uint64_t v8 = *result;
  uint64_t v9 = *a3;
  uint64_t v10 = (uint64_t)(*result)[-8].i64 + a2;
  if (v10 < (uint64_t)*result) {
    goto LABEL_92;
  }
  uint64_t v11 = (uint64_t)&v9[a5 - 128];
  if (v11 >= (uint64_t)v9)
  {
    do
    {
      uint64_t v12 = v9;
      uint64_t v13 = &v9[-a4];
      while (1)
      {
        unint64_t v14 = *v12;
        uint64_t v15 = (int *)(a6 + 8 * ((-1640531535 * *v12) >> 20));
        int v16 = *v15;
        int v17 = v15[1];
        *uint64_t v15 = (int)v13;
        v15[1] = v14;
        unint64_t v18 = v14 >> 8;
        uint64_t v19 = (int *)(a6 + 8 * ((-1640531535 * (v14 >> 8)) >> 20));
        int v20 = *v19;
        int v21 = v19[1];
        *uint64_t v19 = v13 + 1;
        v19[1] = v14 >> 8;
        if (v14 == v17)
        {
          uint64_t v22 = (v13 - v16);
          if (v22 < 0x10000 && v22 != 0) {
            break;
          }
        }
        uint64_t v12 = (void *)((char *)v12 + 1);
        uint64_t v24 = v13 + 1;
        unint64_t v25 = v14 >> 16;
        uint64_t v26 = (int *)(a6 + 8 * ((-1640531535 * v25) >> 20));
        int v27 = *v26;
        int v28 = v26[1];
        *uint64_t v26 = v24 + 1;
        v26[1] = v25;
        if (v18 == v21)
        {
          uint64_t v22 = (v24 - v20);
          if (v22 < 0x10000 && v24 != v20) {
            break;
          }
        }
        uint64_t v12 = (void *)((char *)v12 + 1);
        uint64_t v30 = v24 + 1;
        unint64_t v31 = v25 >> 8;
        CFIndex v32 = (int *)(a6 + 8 * ((-1640531535 * (v25 >> 8)) >> 20));
        int v33 = *v32;
        int v34 = v32[1];
        *CFIndex v32 = v30 + 1;
        v32[1] = v25 >> 8;
        if (v25 == v28)
        {
          uint64_t v22 = (v30 - v27);
          if (v22 < 0x10000 && v30 != v27) {
            break;
          }
        }
        uint64_t v12 = (void *)((char *)v12 + 1);
        uint64_t v36 = v30 + 1;
        unint64_t v37 = v25 >> 16;
        uint64_t v38 = (int *)(a6 + 8 * ((-1640531535 * v37) >> 20));
        int v39 = *v38;
        int v40 = v38[1];
        *uint64_t v38 = v36 + 1;
        v38[1] = v37;
        if (v31 == v34)
        {
          uint64_t v22 = (v36 - v33);
          if (v22 < 0x10000 && v36 != v33) {
            break;
          }
        }
        uint64_t v12 = (void *)((char *)v12 + 1);
        uint64_t v42 = v36 + 1;
        if (v37 == v40)
        {
          uint64_t v22 = (v42 - v39);
          if (v22 < 0x10000 && v42 != v39) {
            break;
          }
        }
        uint64_t v12 = (void *)((char *)v12 + 1);
        uint64_t v13 = v42 + 1;
        if ((unint64_t)v12 >= v11) {
          goto LABEL_74;
        }
      }
      CFIndex v44 = (char *)v12 + 4;
      char v45 = (void *)((char *)v12 - v22 + 4);
      while (1)
      {
        uint64_t v47 = *(void *)v44;
        v44 += 8;
        uint64_t v46 = v47;
        uint64_t v49 = *v45++;
        uint64_t v48 = v49;
        if (v46 != v49) {
          break;
        }
        if ((unint64_t)v44 >= v11) {
          goto LABEL_38;
        }
      }
      CFIndex v44 = &v44[(__clz(__rbit64(v46 ^ v48)) >> 3) - 8];
LABEL_38:
      CFIndex v50 = (char *)v12 - v22;
      while (1)
      {
        BOOL v51 = (uint64_t)v12 <= (uint64_t)v9 || (uint64_t)v50 <= a4;
        if (v51) {
          break;
        }
        int v53 = *((unsigned __int8 *)v12 - 1);
        uint64_t v12 = (void *)((char *)v12 - 1);
        int v52 = v53;
        int v54 = *--v50;
        if (v52 != v54)
        {
          uint64_t v12 = (void *)((char *)v12 + 1);
          break;
        }
      }
      unint64_t v55 = v44 - (char *)v12 - 4;
      uint64_t v56 = (char *)v12 - v9;
      unint64_t v57 = (char *)v12 - v9 + 3;
      unint64_t v58 = v10 - (void)v8 - v57;
      if (v10 - (uint64_t)v8 < v57) {
        goto LABEL_92;
      }
      __int8 v59 = (v55 & 0xF) + 16 * v56;
      uint64_t v60 = (int32x4_t *)&v8->i8[1];
      if ((unint64_t)v56 >= 0xF)
      {
        v59 |= 0xF0u;
        unint64_t v61 = v56 - 15;
        BOOL v62 = v58-- != 0;
        if (!v62) {
          goto LABEL_92;
        }
        if (v61 >= 0xFF)
        {
          unint64_t v63 = v61 / 0xFFuLL;
          BOOL v62 = v58 >= v63;
          v58 -= v63;
          if (!v62) {
            goto LABEL_92;
          }
          LOBYTE(v61) = v61 + v63;
          do
          {
            *v60++ = v7;
            BOOL v51 = v63 > 0x10;
            v63 -= 16;
          }
          while (v51);
          uint64_t v60 = (int32x4_t *)((char *)v60 + v63);
        }
        v60->i8[0] = v61;
        uint64_t v60 = (int32x4_t *)((char *)v60 + 1);
      }
      do
      {
        int32x4_t v64 = *(int32x4_t *)v9;
        v9 += 16;
        *v60++ = v64;
        BOOL v51 = v56 <= 16;
        v56 -= 16;
      }
      while (!v51);
      uint64_t v65 = (__int16 *)((char *)v60->i16 + v56);
      *uint64_t v65 = v22;
      uint64_t v66 = (int32x4_t *)(v65 + 1);
      if (v55 >= 0xF)
      {
        v59 |= 0xFu;
        unint64_t v67 = v44 - (char *)v12 - 19;
        BOOL v62 = v58 != 0;
        unint64_t v68 = v58 - 1;
        if (!v62) {
          goto LABEL_92;
        }
        if (v67 >= 0xFF)
        {
          unint64_t v69 = v67 / 0xFFuLL;
          if (v68 < v69) {
            goto LABEL_92;
          }
          LOBYTE(v67) = v67 + v69;
          do
          {
            *v66++ = v7;
            BOOL v51 = v69 > 0x10;
            v69 -= 16;
          }
          while (v51);
          uint64_t v66 = (int32x4_t *)((char *)v66 + v69);
        }
        v66->i8[0] = v67;
        uint64_t v66 = (int32x4_t *)((char *)v66 + 1);
      }
      v8->i8[0] = v59;
      uint64_t v8 = v66;
      uint64_t v9 = v44;
    }
    while ((uint64_t)v44 < v11 && (uint64_t)v66 < v10);
  }
LABEL_74:
  if (a7) {
    goto LABEL_92;
  }
  uint64_t v71 = (char *)(v11 + 128);
  uint64_t v72 = v71 - v9;
  if (v71 == v9) {
    goto LABEL_92;
  }
  uint64_t v73 = v10 + 128 - (void)v8 - 1;
  BOOL v51 = v73 <= v72;
  uint64_t v74 = v73 - v72;
  if (v51) {
    goto LABEL_92;
  }
  if (v72 < 15)
  {
    v8->i8[0] = 16 * v72;
    uint64_t v8 = (int32x4_t *)((char *)v8 + 1);
    do
    {
LABEL_91:
      __int8 v81 = *v9++;
      v8->i8[0] = v81;
      uint64_t v8 = (int32x4_t *)((char *)v8 + 1);
    }
    while (v9 < v71);
    goto LABEL_92;
  }
  uint64_t v75 = v74 - 1;
  if (v75 >= 0)
  {
    v8->i8[0] = -16;
    uint64_t v76 = (int32x4_t *)&v8->i8[1];
    unsigned int v77 = v72 - 15;
    if ((unint64_t)(v72 - 15) >= 0xFF)
    {
      int64_t v78 = v77 / 0xFFuLL;
      if (v75 - v78 < 0)
      {
        uint64_t v8 = (int32x4_t *)((char *)v76 - 1);
        goto LABEL_92;
      }
      LOBYTE(v77) = v77 + v78;
      do
      {
        *v76++ = v7;
        BOOL v51 = v78 <= 16;
        v78 -= 16;
      }
      while (!v51);
      uint64_t v76 = (int32x4_t *)((char *)v76 + v78);
    }
    v76->i8[0] = v77;
    uint64_t v8 = (int32x4_t *)&v76->i8[1];
    uint64_t v79 = (unint64_t)v72 >> 4;
    if (!((unint64_t)v72 >> 4)) {
      goto LABEL_91;
    }
    do
    {
      int32x4_t v80 = *(int32x4_t *)v9;
      v9 += 16;
      *v8++ = v80;
      BOOL v51 = v79-- <= 1;
    }
    while (!v51);
    if (v9 < v71) {
      goto LABEL_91;
    }
  }
LABEL_92:
  int *result = v8;
  *a3 = v9;
  return result;
}

uint64_t lz4_decode_asm(int8x16_t **a1, unint64_t a2, unint64_t a3, unsigned __int8 **a4, unint64_t a5)
{
  id v5 = *a4;
  int v6 = *a1;
  while (1)
  {
    int32x4_t v7 = v6;
    uint64_t v8 = v5;
    if ((unint64_t)v5 >= a5 || (unint64_t)v6 >= a3) {
      break;
    }
    unsigned int v10 = *v5;
    uint64_t v9 = v5 + 1;
    unint64_t v11 = (unint64_t)v10 >> 4;
    unint64_t v12 = (v10 & 0xF) + 4;
    if (v11 > 0xE)
    {
      while ((unint64_t)v9 < a5)
      {
        unsigned int v13 = *(unsigned __int8 *)v9;
        uint64_t v9 = (_OWORD *)((char *)v9 + 1);
        v11 += v13;
        if (v13 != 255)
        {
          unint64_t v14 = (int8x16_t *)v9;
          uint64_t v15 = v6;
          int v16 = (unsigned __int16 *)((char *)v9 + v11);
          int v17 = (int8x16_t *)((char *)v6 + v11);
          if ((unint64_t)v16 < a5 && (unint64_t)v17 < a3)
          {
            int8x16_t v19 = *v14;
            int8x16_t v20 = v14[1];
            unint64_t v18 = v14 + 2;
            *uint64_t v15 = v19;
            v15[1] = v20;
            int v21 = v15 + 2;
            do
            {
              int8x16_t v22 = *v18;
              int8x16_t v23 = v18[1];
              v18 += 2;
              *int v21 = v22;
              v21[1] = v23;
              v21 += 2;
            }
            while (v17 > v21);
            goto LABEL_13;
          }
          goto LABEL_36;
        }
      }
      break;
    }
    *int v6 = *(int8x16_t *)v9;
    int v16 = (unsigned __int16 *)((char *)v9 + v11);
    int v17 = (int8x16_t *)((char *)v6 + v11);
LABEL_13:
    if ((unint64_t)v16 >= a5) {
      break;
    }
    unsigned int v25 = *v16;
    id v5 = (unsigned __int8 *)(v16 + 1);
    unint64_t v24 = v25;
    if (!v25 || (uint64_t v26 = (int8x16_t *)((char *)v17 - v24), (unint64_t)v17 - v24 < a2))
    {
      uint64_t v47 = -1;
      goto LABEL_37;
    }
    int v27 = v17;
    int v6 = (int8x16_t *)((char *)v17 + v12);
    if (v12 == 19)
    {
      while ((unint64_t)v5 < a5)
      {
        unsigned int v28 = *v5++;
        int v6 = (int8x16_t *)((char *)v6 + v28);
        if (v28 != 255)
        {
          if ((unint64_t)v6 >= a3) {
            goto LABEL_36;
          }
          goto LABEL_24;
        }
      }
      break;
    }
    if (v12 > 0x10)
    {
LABEL_24:
      if (v24 > 0x1F)
      {
        int8x16_t v36 = *v26;
        uint64_t v35 = v26 + 1;
        *int v27 = v36;
        unint64_t v37 = v27 + 1;
        do
        {
          int8x16_t v38 = *v35;
          int8x16_t v39 = v35[1];
          v35 += 2;
          *unint64_t v37 = v38;
          v37[1] = v39;
          v37 += 2;
        }
        while (v6 > v37);
      }
      else if (v24 > 0xF)
      {
        int8x16_t v41 = *v26;
        int v40 = v26 + 1;
        *int v27 = v41;
        uint64_t v42 = v27 + 1;
        do
        {
          int8x16_t v44 = *v40;
          uint64_t v43 = v40 + 1;
          *uint64_t v42 = v44;
          char v45 = v42 + 1;
          int8x16_t v46 = *v43;
          int v40 = v43 + 1;
          *char v45 = v46;
          uint64_t v42 = v45 + 1;
        }
        while (v6 > v42);
      }
      else
      {
        uint64_t v29 = (int8x16_t *)&qword_100010B00[4 * v24];
        int8x16_t v30 = vqtbl1q_s8(*v26, *v29);
        int8x16_t v31 = vqtbl1q_s8(*v26, v29[1]);
        uint64_t v32 = *((unsigned __int8 *)qword_100010D00 + v24);
        *int v27 = v30;
        v27[1] = v31;
        int v33 = (int8x16_t *)((char *)v27 + v32);
        do
        {
          *int v33 = v30;
          v33[1] = v31;
          int v34 = (int8x16_t *)((char *)v33 + v32);
          *int v34 = v30;
          v34[1] = v31;
          int v33 = (int8x16_t *)((char *)v34 + v32);
        }
        while (v6 > v33);
      }
    }
    else if (v24 <= 0xF)
    {
      *int v27 = vqtbl1q_s8(*v26, *(int8x16_t *)&qword_100010B00[4 * v24]);
    }
    else
    {
      *int v27 = *v26;
    }
  }
LABEL_36:
  uint64_t v47 = 0;
LABEL_37:
  *a4 = v8;
  *a1 = v7;
  return v47;
}

uint64_t lzfse_decode_lmd(uint64_t a1)
{
  CFStringRef v1 = *(void **)(a1 + 24);
  CFTypeID v2 = (uint64_t *)(*(void *)a1 + *(int *)(a1 + 120));
  uint64_t v3 = *(void *)(a1 + 104);
  uint64_t v4 = *(unsigned int *)(a1 + 112);
  uint64_t v5 = *(unsigned int *)(a1 + 72);
  unint64_t v6 = *(unsigned int *)(a1 + 88);
  unint64_t v7 = *(unsigned int *)(a1 + 92);
  unint64_t v8 = *(unsigned int *)(a1 + 96);
  unint64_t v9 = *(unsigned __int16 *)(a1 + 124);
  unint64_t v10 = *(unsigned __int16 *)(a1 + 126);
  unint64_t v11 = *(unsigned __int16 *)(a1 + 128);
  uint64_t v12 = *(void *)(a1 + 40) - (void)v1 - 32;
  unsigned int v13 = *(char **)(a1 + 80);
  if (v6 | v7) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 72))
  {
    while (1)
    {
      CFTypeID v2 = (uint64_t *)((char *)v2 - ((unint64_t)(63 - v4) >> 3));
      if ((unint64_t)v2 < *(void *)(a1 + 8)) {
        return -3;
      }
      uint64_t v3 = *v2;
      unint64_t v14 = (unsigned __int8 *)(a1 + 136 + 8 * v9);
      uint64_t v15 = *v14;
      uint64_t v16 = v4 + ((63 - v4) & 0xFFFFFFFFFFFFFFF8) - v15;
      unint64_t v17 = (unint64_t)*v2 >> v16;
      unint64_t v18 = v17 & ~(-1 << v15);
      LOBYTE(v15) = v14[1];
      unint64_t v9 = (v18 >> v15) + *((unsigned __int16 *)v14 + 1);
      unint64_t v6 = (v17 & ~(-1 << v15)) + *((unsigned int *)v14 + 1);
      int8x16_t v19 = (unsigned __int8 *)(a1 + 648 + 8 * v10);
      uint64_t v20 = *v19;
      uint64_t v21 = v16 - v20;
      unint64_t v22 = (unint64_t)*v2 >> v21;
      unint64_t v23 = v22 & ~(-1 << v20);
      LOBYTE(v20) = v19[1];
      unint64_t v10 = (v23 >> v20) + *((unsigned __int16 *)v19 + 1);
      unint64_t v7 = (v22 & ~(-1 << v20)) + *((unsigned int *)v19 + 1);
      unint64_t v24 = (unsigned __int8 *)(a1 + 1160 + 8 * v11);
      uint64_t v25 = *v24;
      uint64_t v4 = v21 - v25;
      unint64_t v26 = (unint64_t)*v2 >> v4;
      unint64_t v27 = v26 & ~(-1 << v25);
      LOBYTE(v25) = v24[1];
      unint64_t v11 = (v27 >> v25) + *((unsigned __int16 *)v24 + 1);
      uint64_t v28 = (v26 & ~(-1 << v25)) + *((unsigned int *)v24 + 1);
      if (v28) {
        unint64_t v8 = v28;
      }
      --v5;
LABEL_7:
      if (v8 > (unint64_t)v1 + v6 - *(void *)(a1 + 32)
        || a1 + *(unsigned int *)(a1 + 7304) + 7308 < (uint64_t)&v13[v6])
      {
        return -3;
      }
      BOOL v29 = v12 < (uint64_t)(v6 + v7);
      v12 -= v6 + v7;
      if (v29)
      {
        uint64_t v40 = v12 + v6 + v7 + 32;
        if (v6)
        {
          do
          {
            BOOL v41 = v40-- != 0;
            if (!v41) {
              goto LABEL_30;
            }
            char v42 = *v13++;
            *(unsigned char *)CFStringRef v1 = v42;
            CFStringRef v1 = (void *)((char *)v1 + 1);
          }
          while (--v6);
        }
        if (v7)
        {
          uint64_t v43 = (char *)v1 - v8;
          while (1)
          {
            BOOL v41 = v40-- != 0;
            if (!v41) {
              break;
            }
            char v44 = *v43++;
            *(unsigned char *)CFStringRef v1 = v44;
            CFStringRef v1 = (void *)((char *)v1 + 1);
            if (!--v7) {
              goto LABEL_28;
            }
          }
LABEL_30:
          *(void *)(a1 + 24) = v1;
          *(void *)(a1 + 120) = (char *)v2 - *(void *)a1;
          *(void *)(a1 + 104) = v3;
          *(_DWORD *)(a1 + 112) = v4;
          *(_DWORD *)(a1 + 72) = v5;
          *(_DWORD *)(a1 + 88) = v6;
          *(_DWORD *)(a1 + 92) = v7;
          *(_DWORD *)(a1 + 96) = v8;
          *(_WORD *)(a1 + 124) = v9;
          *(_WORD *)(a1 + 126) = v10;
          *(_WORD *)(a1 + 128) = v11;
          *(void *)(a1 + 80) = v13;
          return -2;
        }
LABEL_28:
        uint64_t v12 = v40 - 32;
        if (!v5) {
          goto LABEL_29;
        }
      }
      else
      {
        do
        {
          uint64_t v30 = *(void *)v13;
          uint64_t v31 = *((void *)v13 + 1);
          v13 += 16;
          *CFStringRef v1 = v30;
          v1[1] = v31;
          v1 += 2;
          BOOL v29 = v6 > 0x10;
          v6 -= 16;
        }
        while (v29);
        uint64_t v32 = (int8x16_t *)((char *)v1 + v6);
        v13 += v6;
        int v33 = (int8x16_t *)((char *)v32 - v8);
        if (v8 < 0x10)
        {
          int8x16_t v36 = (int8x16_t *)((char *)&unk_10004FBF0 + 32 * v8);
          unint64_t v37 = byte_10004FDF0[v8];
          int8x16_t v38 = vqtbl1q_s8(*v33, *v36);
          int8x16_t v39 = vqtbl1q_s8(*v33, v36[1]);
          do
          {
            *uint64_t v32 = v38;
            v32[1] = v39;
            uint64_t v32 = (int8x16_t *)((char *)v32 + v37);
            BOOL v29 = v7 > v37;
            v7 -= v37;
          }
          while (v29);
          CFStringRef v1 = (uint64_t *)((char *)v32->i64 + v7);
          if (!v5) {
            goto LABEL_29;
          }
        }
        else
        {
          do
          {
            uint64_t v34 = v33->i64[0];
            uint64_t v35 = v33->i64[1];
            ++v33;
            v32->i64[0] = v34;
            v32->i64[1] = v35;
            ++v32;
            BOOL v29 = v7 > 0x10;
            v7 -= 16;
          }
          while (v29);
          CFStringRef v1 = (uint64_t *)((char *)v32->i64 + v7);
          if (!v5) {
            goto LABEL_29;
          }
        }
      }
    }
  }
  else
  {
LABEL_29:
    *(void *)(a1 + 24) = v1;
    return 0;
  }
}

uint64_t lzfse_decode_literals(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, void **a5, unint64_t a6, double a7)
{
  uint64_t v7 = LOWORD(a7);
  uint64_t v8 = WORD1(a7);
  uint64_t v9 = WORD2(a7);
  uint64_t v10 = HIWORD(a7);
  unint64_t v12 = *(void *)a4;
  int v13 = *(_DWORD *)(a4 + 8);
  unint64_t v14 = *a5;
  while (1)
  {
    unsigned int v15 = *(_DWORD *)(a2 + 4 * v7);
    unsigned int v16 = *(_DWORD *)(a2 + 4 * v8);
    unsigned int v17 = *(_DWORD *)(a2 + 4 * v9);
    unsigned int v18 = *(_DWORD *)(a2 + 4 * v10);
    *a1++ = (v16 & 0xFF00)
          + ((unsigned __int16)(v15 & 0xFF00) >> 8)
          + (((v18 & 0xFF00) + ((unsigned __int16)(v17 & 0xFF00) >> 8)) << 16);
    unint64_t v19 = (63 - v13) & 0xFFFFFFF8;
    if (((63 - v13) & 0xFFFFFFF8) != 0) {
      break;
    }
LABEL_5:
    uint64_t v20 = v13 - v15;
    uint64_t v21 = v20 - v16;
    unint64_t v22 = v12 >> (v13 - v15);
    unint64_t v23 = v12 & qword_1000110E0[v20];
    uint64_t v24 = v21 - v17;
    uint64_t v7 = v22 + HIWORD(v15);
    unint64_t v25 = v23 >> (v20 - v16);
    unint64_t v26 = v23 & qword_1000110E0[v21];
    int v13 = v24 - v18;
    uint64_t v8 = v25 + HIWORD(v16);
    unint64_t v27 = v26 >> (v21 - v17);
    unint64_t v28 = v26 & qword_1000110E0[v24];
    uint64_t v9 = v27 + HIWORD(v17);
    unint64_t v29 = v28 >> (v24 - v18);
    unint64_t v12 = v28 & qword_1000110E0[v13];
    uint64_t v10 = v29 + HIWORD(v18);
    BOOL v30 = a3 <= 4;
    a3 -= 4;
    if (v30)
    {
      *(void *)a4 = v12;
      *(_DWORD *)(a4 + 8) = v13;
      *a5 = v14;
      return 0;
    }
  }
  unint64_t v14 = (void *)((char *)v14 - (v19 >> 3));
  if ((unint64_t)v14 >= a6)
  {
    v13 += v19;
    unint64_t v12 = (v12 << v19) | *v14 & qword_1000110E0[v19];
    goto LABEL_5;
  }
  return -3;
}

uint64_t adler32_vec(uint64_t a1, uint64_t a2, uint8x16_t *a3, int a4)
{
  uint64_t v4 = a1 + (a2 << 32);
  if (a4 >= 5552)
  {
    int v5 = a4 - 5552;
    do
    {
      uint8x16_t v6 = *a3;
      uint16x8_t v7 = vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[2]), *a3, *(uint8x16_t *)&vec_table[2]);
      v6.i16[0] = vaddlvq_u8(*a3);
      v7.i32[0] = vaddlvq_u16(v7);
      ++a3;
      uint64_t v8 = (uint64_t)vadd_s32((int32x2_t)(v4 + vshld_n_s64(v4, 0x24uLL)), vzip1_s32(*(int32x2_t *)v6.i8, *(int32x2_t *)v7.i8));
      int v9 = 173;
      do
      {
        uint8x16_t v10 = *a3;
        uint8x16_t v11 = a3[1];
        uint16x4_t v12 = (uint16x4_t)vshld_n_s64(v8, 0x25uLL);
        int32x2_t v13 = (int32x2_t)(v8 + *(void *)&v12);
        v10.i16[0] = vaddlvq_u8(*a3);
        v12.i16[0] = vaddlvq_u8(v11);
        uint16x8_t v14 = vmlal_high_u8(vmlal_u8(vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[0]), *a3, *(uint8x16_t *)vec_table), *(uint8x8_t *)v11.i8, (uint8x8_t)vec_table[2]), v11, *(uint8x16_t *)&vec_table[2]);
        v14.i32[0] = vaddlvq_u16(v14);
        a3 += 2;
        uint64_t v8 = (uint64_t)vadd_s32(v13, vzip1_s32((int32x2_t)*(_OWORD *)&vaddl_u16(*(uint16x4_t *)v10.i8, v12), *(int32x2_t *)v14.i8));
        BOOL v15 = __OFSUB__(v9--, 1);
      }
      while (!((v9 < 0) ^ v15 | (v9 == 0)));
      uint64x2_t v16 = vshrq_n_u64(vmull_lane_u32((uint32x2_t)v8, (uint32x2_t)0x800780710000FFF1, 1), 0x2FuLL);
      v16.i32[1] = v16.i32[2];
      uint64_t v4 = (uint64_t)vmls_lane_s32((int32x2_t)v8, *(int32x2_t *)v16.i8, (int32x2_t)0x800780710000FFF1, 0);
      BOOL v15 = __OFSUB__(v5, 5552);
      v5 -= 5552;
    }
    while (v5 < 0 == v15);
    a4 = v5 + 5552;
  }
  BOOL v15 = __OFSUB__(a4, 32);
  for (int i = a4 - 32; i < 0 == v15; i -= 32)
  {
    uint8x16_t v18 = *a3;
    uint8x16_t v19 = a3[1];
    uint16x4_t v20 = (uint16x4_t)vshld_n_s64(v4, 0x25uLL);
    int32x2_t v21 = (int32x2_t)(v4 + *(void *)&v20);
    v18.i16[0] = vaddlvq_u8(*a3);
    v20.i16[0] = vaddlvq_u8(v19);
    uint16x8_t v22 = vmlal_high_u8(vmlal_u8(vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[0]), *a3, *(uint8x16_t *)vec_table), *(uint8x8_t *)v19.i8, (uint8x8_t)vec_table[2]), v19, *(uint8x16_t *)&vec_table[2]);
    v22.i32[0] = vaddlvq_u16(v22);
    a3 += 2;
    uint64_t v4 = (uint64_t)vadd_s32(v21, vzip1_s32((int32x2_t)*(_OWORD *)&vaddl_u16(*(uint16x4_t *)v18.i8, v20), *(int32x2_t *)v22.i8));
    BOOL v15 = __OFSUB__(i, 32);
  }
  if ((i & 0x10) != 0)
  {
    uint8x16_t v23 = *a3;
    uint16x8_t v24 = vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[2]), *a3, *(uint8x16_t *)&vec_table[2]);
    v23.i16[0] = vaddlvq_u8(*a3);
    v24.i32[0] = vaddlvq_u16(v24);
    ++a3;
    uint64_t v4 = (uint64_t)vadd_s32((int32x2_t)(v4 + vshld_n_s64(v4, 0x24uLL)), vzip1_s32(*(int32x2_t *)v23.i8, *(int32x2_t *)v24.i8));
  }
  for (int j = i & 0xF; j; v4 += v26 + vshld_n_s64(v4 + v26, 0x20uLL))
  {
    unsigned int v26 = a3->u8[0];
    a3 = (uint8x16_t *)((char *)a3 + 1);
    --j;
  }
  uint64x2_t v27 = vshrq_n_u64(vmull_lane_u32((uint32x2_t)v4, (uint32x2_t)0x800780710000FFF1, 1), 0x2FuLL);
  v27.i32[1] = v27.i32[2];
  int32x2_t v28 = vmls_lane_s32((int32x2_t)v4, *(int32x2_t *)v27.i8, (int32x2_t)0x800780710000FFF1, 0);
  return (v28.i32[0] + (v28.i32[1] << 16));
}

void sub_10001250C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
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

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
}

BOOL iterateSafely(io_iterator_t a1, int a2, id a3, void *a4)
{
  uint16x8_t v7 = (void (**)(id, void))a3;
  uint64_t v8 = a4;
  if (a2 < 1)
  {
    BOOL v10 = 0;
LABEL_10:
    _os_log_pack_size();
    __chkstk_darwin();
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
      IOIteratorReset(a1);
      v8[2](v8);
      BOOL v10 = ++v9 < a2;
      if (v9 == a2) {
        goto LABEL_10;
      }
    }
  }

  return v10;
}

uint64_t _lp2_delete_directory_contents(const char *a1)
{
  unsigned int value = 0;
  CFTypeID v2 = removefile_state_alloc();
  removefile_state_set(v2, 1u, _lp2_delete_directory_contents_confirm);
  removefile_state_set(v2, 2u, &value);
  removefile_state_set(v2, 3u, _lp2_delete_directory_contents_error);
  removefile_state_set(v2, 4u, &value);
  _os_log_pack_size();
  __chkstk_darwin();
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
      __chkstk_darwin();
      uint64_t v9 = _os_log_pack_fill();
      BOOL v10 = strerror(value);
      *(_DWORD *)uint64_t v9 = 136380931;
      *(void *)(v9 + 4) = a1;
      *(_WORD *)(v9 + 12) = 2080;
      *(void *)(v9 + 14) = v10;
      _LPLogPack(1);
    }
  }
  _os_log_pack_size();
  __chkstk_darwin();
  uint64_t v11 = _os_log_pack_fill();
  unsigned int v12 = value;
  uint64_t v13 = "failed";
  *(_DWORD *)uint64_t v11 = 136381187;
  *(void *)(v11 + 4) = a1;
  if (!v12) {
    uint64_t v13 = "succeeded";
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
  pid_t v31 = 0;
  *(void *)int v33 = -1;
  if (pipe(v33))
  {
    _os_log_pack_size();
    __chkstk_darwin();
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
    __chkstk_darwin();
    uint64_t v8 = _os_log_pack_fill();
    uint64_t v9 = *a1;
    BOOL v10 = strerror(v6);
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
    __chkstk_darwin();
    uint64_t v21 = _os_log_pack_fill();
    uint16x8_t v22 = *a1;
    uint8x16_t v23 = __error();
    uint16x8_t v24 = strerror(*v23);
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
      __chkstk_darwin();
      uint64_t v25 = _os_log_pack_fill();
      unsigned int v26 = *a1;
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
      __chkstk_darwin();
      uint64_t v25 = _os_log_pack_fill();
      unsigned int v26 = *a1;
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

void ___is_running_in_ramdisk_block_invoke(id a1)
{
  bzero(__s1, 0x400uLL);
  size_t v1 = 1024;
  if (!sysctlbyname("kern.bootargs", __s1, &v1, 0, 0))
  {
    if (strstr(__s1, "-restore")) {
      _is_running_in_ramdisk_is_ramdisk = 1;
    }
  }
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
  __chkstk_darwin();
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
  id v9 = [objc_alloc((Class)NSString) initWithFormat:@"%.*s" arguments:&a9];
  _os_log_pack_size();
  __chkstk_darwin();
  uint64_t v10 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v10 = 138412290;
  *(void *)(v10 + 4) = v9;
  _LPLogPack(3);
}

id _LPLogObject()
{
  if (_LPLogObject_onceToken != -1) {
    dispatch_once(&_LPLogObject_onceToken, &__block_literal_global_7);
  }
  CFStringRef v0 = (void *)_LPLogObject_obj;
  return v0;
}

void _LPLogPack(int a1)
{
  if (sLogLevel >= a1)
  {
    id v1 = _LPLogObject();
    uint64_t v2 = (char *)os_log_pack_compose();

    if (sLogToStandardOut) {
      fprintf(__stdoutp, "%s\n", v2);
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

id __copy_helper_block_e8_32s(uint64_t a1, uint64_t a2)
{
  return *(id *)(a2 + 32);
}

void __destroy_helper_block_e8_32s(uint64_t a1)
{
}

uint64_t UMEventCleanupNVRAMInternal(uint64_t a1, unint64_t a2, unsigned char *a3, CFTypeRef *a4)
{
  if (a2)
  {
    unint64_t v6 = 0;
    CFErrorRef v7 = 0;
    char v8 = 0;
    unsigned int v9 = 1;
    char v10 = 1;
    do
    {
      char v22 = 0;
      char v16 = msu_delete_nvram_variable_if_exists(*(const __CFString **)(a1 + 8 * v6), &v22);
      if (v16 & 1) == 0 && (v10)
      {
        logfunction("", 1, @"clearing NVRAM variable failed\n", v11, v12, v13, v14, v15, v19);
        CFErrorRef v7 = CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainMach, 5, 0);
        char v10 = 0;
      }
      if (v22) {
        char v17 = v16;
      }
      else {
        char v17 = 0;
      }
      v8 |= v17;
      unint64_t v6 = v9++;
    }
    while (v6 < a2);
  }
  else
  {
    char v8 = 0;
    CFErrorRef v7 = 0;
    char v10 = 1;
  }
  if (a3) {
    *a3 = v8 & 1;
  }
  if (v7)
  {
    if (a4) {
      *a4 = CFRetain(v7);
    }
    CFRelease(v7);
  }
  return v10 & 1;
}

uint64_t UMEventCleanupAllNVRAM(int a1, void *a2)
{
  unsigned __int8 v23 = 0;
  CFTypeRef cf = 0;
  int v4 = UMEventCleanupNVRAMInternal((uint64_t)off_1000598C0, 0x1EuLL, &v23, &cf);
  unsigned __int8 v21 = 0;
  id v20 = 0;
  unsigned int v10 = [+[UMEventCheckpoint sharedInstance] cleanupCheckpointsNvramReturnDirty:&v21 error:&v20];
  if (a1 && v23 | v21)
  {
    logfunction("", 1, @"Force syncing NVRAM because values were cleaned up\n", v5, v6, v7, v8, v9, (char)v20);
    msu_sync_nvram(1, v11, v12, v13, v14, v15, v16, v17);
  }
  if (a2)
  {
    if (cf)
    {
      CFTypeRef v18 = CFRetain(cf);
    }
    else
    {
      if (!v20) {
        return v4 & v10;
      }
      CFTypeRef v18 = v20;
    }
    *a2 = v18;
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v20) {

  }
  return v4 & v10;
}

id _longFromNVRAMVar(id a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a1 = [objc_alloc((Class)NSString) initWithData:a1 encoding:4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  if (!a1) {
    return 0;
  }
  return [a1 longLongValue];
}

void __copy_helper_block_e8_32o(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32o(uint64_t a1)
{
}

void _log(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = [objc_alloc((Class)NSString) initWithFormat:a2 arguments:&a9];
  logfunction("", 1, @"%@\n", v10, v11, v12, v13, v14, (char)v9);
}

void __copy_helper_block_e8_32o40o(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 3);
  int v4 = *(const void **)(a2 + 40);
  _Block_object_assign((void *)(a1 + 40), v4, 3);
}

void __destroy_helper_block_e8_32o40o(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 3);
  uint64_t v2 = *(const void **)(a1 + 32);
  _Block_object_dispose(v2, 3);
}

void __copy_helper_block_e8_32b(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32b(uint64_t a1)
{
}

void __copy_helper_block_e8_32o40o48o56o64o72o80b(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 3);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 3);
  _Block_object_assign((void *)(a1 + 48), *(const void **)(a2 + 48), 3);
  _Block_object_assign((void *)(a1 + 56), *(const void **)(a2 + 56), 3);
  _Block_object_assign((void *)(a1 + 64), *(const void **)(a2 + 64), 3);
  _Block_object_assign((void *)(a1 + 72), *(const void **)(a2 + 72), 3);
  int v4 = *(const void **)(a2 + 80);
  _Block_object_assign((void *)(a1 + 80), v4, 7);
}

void __destroy_helper_block_e8_32o40o48o56o64o72o80b(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 80), 7);
  _Block_object_dispose(*(const void **)(a1 + 72), 3);
  _Block_object_dispose(*(const void **)(a1 + 64), 3);
  _Block_object_dispose(*(const void **)(a1 + 56), 3);
  _Block_object_dispose(*(const void **)(a1 + 48), 3);
  _Block_object_dispose(*(const void **)(a1 + 40), 3);
  uint64_t v2 = *(const void **)(a1 + 32);
  _Block_object_dispose(v2, 3);
}

void __copy_helper_block_e8_32o40o48o56o64b(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 3);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 3);
  _Block_object_assign((void *)(a1 + 48), *(const void **)(a2 + 48), 3);
  _Block_object_assign((void *)(a1 + 56), *(const void **)(a2 + 56), 3);
  int v4 = *(const void **)(a2 + 64);
  _Block_object_assign((void *)(a1 + 64), v4, 7);
}

void __destroy_helper_block_e8_32o40o48o56o64b(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 64), 7);
  _Block_object_dispose(*(const void **)(a1 + 56), 3);
  _Block_object_dispose(*(const void **)(a1 + 48), 3);
  _Block_object_dispose(*(const void **)(a1 + 40), 3);
  uint64_t v2 = *(const void **)(a1 + 32);
  _Block_object_dispose(v2, 3);
}

void __copy_helper_block_e8_32o40o48o(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 3);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 3);
  int v4 = *(const void **)(a2 + 48);
  _Block_object_assign((void *)(a1 + 48), v4, 3);
}

void __destroy_helper_block_e8_32o40o48o(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 48), 3);
  _Block_object_dispose(*(const void **)(a1 + 40), 3);
  uint64_t v2 = *(const void **)(a1 + 32);
  _Block_object_dispose(v2, 3);
}

uint64_t AMRestorePartitionFWCopyTagData(const __CFURL *a1)
{
  if (a1 && (int v1 = _AMRestorePartitionOpenFileWithURL(a1, 0)) != 0)
  {
    int v2 = v1;
    id v3 = malloc(0x8000uLL);
    if (v3 && read(v2, v3, 0x8000uLL))
    {
      Img4DecodeParseLengthFromBuffer();
      AMSupportLogInternal();
    }
    AMSupportLogInternal();
    if (v2 >= 1) {
      close(v2);
    }
  }
  else
  {
    AMSupportLogInternal();
  }
  AMSupportSafeFree();
  AMSupportSafeFree();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return 99;
}

uint64_t _AMRestorePartitionOpenFileWithURL(const __CFURL *a1, int a2)
{
  bzero(buffer, 0x400uLL);
  if (!CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
  {
    AMSupportLogInternal();
LABEL_6:
    AMSupportLogInternal();
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = open((const char *)buffer, a2);
  uint64_t v5 = v4;
  if ((int)v4 <= 0)
  {
    uint64_t v7 = __error();
    strerror(*v7);
    AMSupportLogInternal();
    return v5;
  }
  if (fcntl(v4, 48, 1)) {
    goto LABEL_6;
  }
  return v5;
}

void *set_partition_logging_function(void *result)
{
  _loggingPtr = result;
  return result;
}

void *set_partition_execution_logging_function(void *result)
{
  _executionLoggingPtr = result;
  return result;
}

void *set_partition_execution_function(void *result)
{
  _executeCommandPtr = result;
  return result;
}

uint64_t _partition_log(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (_loggingPtr) {
    return _loggingPtr(result, &a9);
  }
  return result;
}

uint64_t create_update_partition_folder_hierarchy(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    _partition_log((uint64_t)"%s: Creating folder hierarchy for update partition", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"create_update_partition_folder_hierarchy");
    for (uint64_t i = 0; i != 9; i += 3)
    {
      *(_OWORD *)__str = *(_OWORD *)&(&UPDATE_DIR_LIST)[i];
      int v52 = (&UPDATE_DIR_LIST)[i + 2];
      create_folder_at_mount_point_for_dir_list_entry((uint64_t)__str, a1);
    }
    _partition_log((uint64_t)"Creating hardware folder hierarchy\n", v10, v11, v12, v13, v14, v15, v16, v46);
    bzero(__str, 0x400uLL);
    _partition_log((uint64_t)"Creating root folder", v17, v18, v19, v20, v21, v22, v23, v47);
    long long v49 = HARDWARE_DIR_LIST;
    CFIndex v50 = off_10006C4B8[0];
    if (create_folder_at_mount_point_for_dir_list_entry((uint64_t)&v49, a1))
    {
      _partition_log((uint64_t)"Successfully created root Hardware folder. Proceeding to create the rest of the folder hierarchy", v24, v25, v26, v27, v28, v29, v30, v48);
      snprintf(__str, 0x3FFuLL, "%s/%s", a1, HARDWARE_DIR_LIST);
      long long v49 = *(_OWORD *)&off_10006C4C0;
      CFIndex v50 = off_10006C4D0;
      if (create_folder_at_mount_point_for_dir_list_entry((uint64_t)&v49, __str)) {
        _partition_log((uint64_t)"Successfully created %s under %s with permissions 0%o for user %s", v31, v32, v33, v34, v35, v36, v37, (uint64_t)off_10006C4C0);
      }
      else {
        _partition_log((uint64_t)"Failed to create %s under %s with permissions 0%o for user %s", v31, v32, v33, v34, v35, v36, v37, (uint64_t)off_10006C4C0);
      }
    }
    else
    {
      _partition_log((uint64_t)"Failed to create root hardware folder %s under %s", v24, v25, v26, v27, v28, v29, v30, HARDWARE_DIR_LIST);
    }
    _partition_log((uint64_t)"%s: Done creating folder hierarchy for update partition", v38, v39, v40, v41, v42, v43, v44, (uint64_t)"create_update_partition_folder_hierarchy");
    return 0;
  }
  else
  {
    _partition_log((uint64_t)"%s: Invalid mount point passed", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"create_update_partition_folder_hierarchy");
    return 1;
  }
}

uint64_t create_folder_at_mount_point_for_dir_list_entry(uint64_t a1, const char *a2)
{
  uint64_t v46 = 0;
  asprintf(&v46, "%s/%s", a2, *(const char **)a1);
  if (v46)
  {
    if (mkdir(v46, *(_WORD *)(a1 + 8)) && *__error() != 17)
    {
      uint64_t v20 = v46;
      __error();
      _partition_log((uint64_t)"failed to mkdir %s with errno=%d", v21, v22, v23, v24, v25, v26, v27, (uint64_t)v20);
    }
    else
    {
      if (chmod(v46, *(_WORD *)(a1 + 8)))
      {
        uint64_t v11 = v46;
        __error();
        _partition_log((uint64_t)"Failed to chmod %s 0%o with errno=%d", v12, v13, v14, v15, v16, v17, v18, (uint64_t)v11);
        uint64_t v19 = 0;
      }
      else
      {
        uint64_t v19 = 1;
      }
      *__error() = 0;
      uint64_t v28 = getpwnam(*(const char **)(a1 + 16));
      if (v28)
      {
        if (!chown(v46, v28->pw_uid, v28->pw_gid))
        {
LABEL_14:
          free(v46);
          return v19;
        }
        uint64_t v29 = v46;
        __error();
        _partition_log((uint64_t)"failed to chown %s %d:%d with errno=%d", v30, v31, v32, v33, v34, v35, v36, (uint64_t)v29);
      }
      else
      {
        uint64_t v37 = *(void *)(a1 + 16);
        __error();
        _partition_log((uint64_t)"failed to getpwnam for %s with errno=%d", v38, v39, v40, v41, v42, v43, v44, v37);
      }
    }
    uint64_t v19 = 0;
    goto LABEL_14;
  }
  _partition_log((uint64_t)"failed to allocate path string for \"%s/%s\"", v4, v5, v6, v7, v8, v9, v10, (uint64_t)a2);
  return 0;
}

uint64_t init_update_partition_with_reserve_and_reformat(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  unint64_t v10 = a1;
  if (a3) {
    a1 = _unmount_filesystem(a2);
  }
  if (!partition_probe_media(a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8))
  {
    uint64_t v18 = "media probe failed probe the media";
    goto LABEL_34;
  }
  if (using_APFS != 1)
  {
    if (!update_device_node_path) {
      goto LABEL_25;
    }
    uint64_t v19 = 0;
    uint64_t v20 = &update_device_node_path;
LABEL_15:
    uint64_t v21 = format_partition((uint64_t)v20, "Update", 0, 0, 0, v19, v16, v17);
    if (v21)
    {
      uint64_t v18 = "formatting update partition failed";
      goto LABEL_34;
    }
    if (using_APFS != 1 || partition_probe_media(v21, v11, v12, v13, v14, v15, v16, v17)) {
      goto LABEL_19;
    }
LABEL_25:
    uint64_t v18 = "media probe failed to find update partition";
    goto LABEL_34;
  }
  if (!update_device_node_path)
  {
    uint64_t v20 = &apfs_container_device_node_path;
    uint64_t v19 = 1;
    goto LABEL_15;
  }
  if (v8)
  {
    if (delete_apfs_partition(5u, 0, v12, v13, v14, v15, v16, v17))
    {
      uint64_t v18 = "failed to delete update filesystem";
      goto LABEL_34;
    }
    _partition_log((uint64_t)"delete update filesystem succeeded", v11, v12, v13, v14, v15, v16, v17, v85);
    uint64_t v19 = using_APFS;
    uint64_t v20 = &apfs_container_device_node_path;
    goto LABEL_15;
  }
  _partition_log((uint64_t)"not deleting existing update filesystem", v11, v12, v13, v14, v15, v16, v17, v85);
LABEL_19:
  bzero(&v89, 0x878uLL);
  if (statfs(a2, &v89))
  {
    _partition_log((uint64_t)"statfs-ing %s failed - creating new mount point", v22, v23, v24, v25, v26, v27, v28, (uint64_t)a2);
    mkdir(a2, 0x1C0u);
  }
  uint64_t v29 = realpath_DARWIN_EXTSN(a2, 0);
  if (v29)
  {
    uint64_t v30 = v29;
    int v31 = strcmp(v89.f_mntonname, v29);
    free(v30);
    if (!v31 || !_mount_filesystem(&update_device_node_path, a2))
    {
      if (create_update_partition_folder_hierarchy(a2, v11, v12, v13, v14, v15, v16, v17)) {
        _partition_log((uint64_t)"Failed to create folder hierarchy on update volume", v32, v33, v34, v35, v36, v37, v38, v85);
      }
      if (using_APFS == 1)
      {
        bzero(v88, 0x400uLL);
        __strlcat_chk();
        __strlcat_chk();
        if (v10)
        {
          _partition_log((uint64_t)"creating %lld MB reserve file at %s", v39, v40, v41, v42, v43, v44, v45, v10 >> 20);
          int allocated_empty_file = create_allocated_empty_file(v10, v88);
          if (allocated_empty_file == 28)
          {
            int v87 = 3;
            if (fsctl(a2, 0x80044101uLL, &v87, 0))
            {
              unint64_t v61 = __error();
              strerror(*v61);
              _partition_log((uint64_t)"first preallocation attempt failed, and full sync of volume %s failed: %s", v62, v63, v64, v65, v66, v67, v68, (uint64_t)a2);
            }
            else
            {
              _partition_log((uint64_t)"first preallocation attempt failed, but full sync of volume %s was successful", v54, v55, v56, v57, v58, v59, v60, (uint64_t)a2);
            }
            _partition_log((uint64_t)"re-trying reserve file creation", v69, v70, v71, v72, v73, v74, v75, v86);
            int allocated_empty_file = create_allocated_empty_file(v10, v88);
          }
          if (allocated_empty_file)
          {
            _partition_log((uint64_t)"reserving %llu bytes failed with errno=%d", v47, v48, v49, v50, v51, v52, v53, v10);
            return 1;
          }
        }
        else if (!unlink(v88))
        {
          _partition_log((uint64_t)"existing reserved file deleted", v78, v79, v80, v81, v82, v83, v84, v85);
        }
      }
      return 0;
    }
    uint64_t v18 = "mounting update partition filesystem failed";
  }
  else
  {
    uint64_t v76 = __error();
    uint64_t v85 = (uint64_t)a2;
    strerror(*v76);
    uint64_t v18 = "Could not realpath(3) path %s: %s";
  }
LABEL_34:
  _partition_log((uint64_t)v18, v11, v12, v13, v14, v15, v16, v17, v85);
  return 1;
}

uint64_t _unmount_filesystem(const char *a1)
{
  bzero(&v47, 0x878uLL);
  if (statfs(a1, &v47))
  {
    int v2 = __error();
    strerror(*v2);
    _partition_log((uint64_t)"statfs %s failed: %s", v3, v4, v5, v6, v7, v8, v9, (uint64_t)a1);
    return 1;
  }
  uint64_t v11 = realpath_DARWIN_EXTSN(a1, 0);
  if (!v11)
  {
    __error();
    uint64_t v12 = __error();
    strerror(*v12);
    _partition_log((uint64_t)"realpath %s failed: %d %s", v13, v14, v15, v16, v17, v18, v19, (uint64_t)a1);
  }
  if (!strcmp(v47.f_mntonname, v11))
  {
    uint64_t v27 = unmount(v11, 0x80000);
    if (v27)
    {
      uint64_t v10 = v27;
      if (*__error() == 1)
      {
        *(void *)&long long v44 = "/sbin/umount";
        *((void *)&v44 + 1) = "-f";
        uint64_t v45 = v11;
        uint64_t v46 = 0;
        if (_executeCommandPtr)
        {
          uint64_t v10 = ((uint64_t (*)(long long *, uint64_t (*)(), void))_executeCommandPtr)(&v44, _partition_execution_log, 0);
          if (!v10) {
            goto LABEL_11;
          }
        }
        else
        {
          uint64_t v10 = 0xFFFFFFFFLL;
        }
      }
      __error();
      uint64_t v36 = __error();
      strerror(*v36);
      _partition_log((uint64_t)"error unmounting '%s': %d %s", v37, v38, v39, v40, v41, v42, v43, (uint64_t)a1);
      long long v44 = off_100059C40;
      if (_executeCommandPtr) {
        ((void (*)(long long *, uint64_t (*)(), void))_executeCommandPtr)(&v44, _partition_execution_log, 0);
      }
      goto LABEL_13;
    }
LABEL_11:
    _partition_log((uint64_t)"file system at %s successfully unmounted", v28, v29, v30, v31, v32, v33, v34, (uint64_t)a1);
    goto LABEL_12;
  }
  _partition_log((uint64_t)"no file system mounted at %s", v20, v21, v22, v23, v24, v25, v26, (uint64_t)a1);
LABEL_12:
  uint64_t v10 = 0;
LABEL_13:
  if (v11) {
    free(v11);
  }
  return v10;
}

uint64_t partition_probe_media(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = 0;
  char v9 = 0;
  p_superclass = PCIeNANDBootWriter.superclass;
  uint64_t v11 = PCIeNANDBootWriter.superclass;
  do
  {
    io_iterator_t iterator = 0;
    CFTypeRef cf = 0;
    storage_device_node_path = 0;
    *((unsigned char *)p_superclass + 2368) = 0;
    *((unsigned char *)v11 + 2528) = 0;
    data_device_node_path = 0;
    user_device_node_path = 0;
    baseband_data_partition_device_node_path = 0;
    update_device_node_path = 0;
    scratch_device_node_path = 0;
    xart_device_node_path = 0;
    apfs_recovery_os_container_device_node_path = 0;
    recovery_os_volume_device_node_path = 0;
    preboot_partition_device_node_path = 0;
    iboot_system_container_device_node_path = 0;
    using_APFS = 0;
    if (!_partition_wait_for_device(&storage_device_node_path, a2, a3, a4, a5, a6, a7, a8))
    {
      _partition_log((uint64_t)"Unable to find storage device node for service named: %s", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"EmbeddedDeviceTypeRoot");
      int v37 = 0;
      io_registry_entry_t v28 = 0;
      goto LABEL_7;
    }
    _partition_log((uint64_t)"entering %s.", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"_partition_probe_media_should_retry");
    CFDictionaryRef v19 = IOBSDNameMatching(kIOMasterPortDefault, 0, byte_10006CAA5);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v19);
    io_registry_entry_t v28 = MatchingService;
    if (!MatchingService)
    {
      _partition_log((uint64_t)"unable to find service for %s", v21, v22, v23, v24, v25, v26, v27, (uint64_t)byte_10006CAA5);
      io_object_t v38 = 0;
LABEL_9:
      int v37 = 1;
      goto LABEL_102;
    }
    IOServiceWaitQuiet(MatchingService, 0);
    uint64_t v29 = IORegistryEntryCreateIterator(v28, "IOService", 1u, &iterator);
    if (v29)
    {
      _partition_log((uint64_t)"unable to create child iterator: 0c%.8x", v30, v31, v32, v33, v34, v35, v36, v29);
      int v37 = 0;
LABEL_7:
      io_object_t v38 = 0;
      goto LABEL_102;
    }
    io_object_t v38 = IOIteratorNext(iterator);
    if (!v38) {
      goto LABEL_9;
    }
    CFErrorRef v118 = 0;
    int v39 = 0;
    while (1)
    {
      if (!IOObjectConformsTo(v38, "IOMedia"))
      {
LABEL_77:
        IOObjectRelease(v38);
        goto LABEL_78;
      }
      memset(name, 0, sizeof(name));
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      IORegistryEntryGetName(v38, name);
      uint64_t CFProperties = IORegistryEntryCreateCFProperties(v38, (CFMutableDictionaryRef *)&cf, kCFAllocatorDefault, 0);
      if (CFProperties)
      {
        _partition_log((uint64_t)"unable to get properies for media registry entry: 0x%.8x", v41, v42, v43, v44, v45, v46, v47, CFProperties);
        goto LABEL_100;
      }
      if (v39
        || (CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)cf, @"BSD Name")) != 0
        && CFEqual(Value, @"disk0s1s1"))
      {
        char v48 = 0;
        int v39 = 1;
      }
      else
      {
        int v39 = 0;
        char v48 = 1;
      }
      uint64_t v50 = CFDictionaryGetValue((CFDictionaryRef)cf, @"Content Hint");
      if (!v50) {
        break;
      }
      uint64_t v58 = v50;
      if (!CFEqual(v50, @"LightweightVolumeManager_Media"))
      {
        if (!CFEqual(v58, @"7C3457EF-0000-11AA-AA11-00306543ECAC")
          && !CFEqual(v58, @"52637672-7900-11AA-AA11-00306543ECAC")
          && !CFEqual(v58, @"69646961-6700-11AA-AA11-00306543ECAC")
          && !CFEqual(v58, @"EF57347C-0000-11AA-AA11-00306543ECAC"))
        {
          break;
        }
        CFStringRef v83 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"BSD Name");
        if (!v83)
        {
          uint64_t v116 = "APFS Container object with no bsd name";
          goto LABEL_119;
        }
        *(_OWORD *)buffer = 0u;
        long long v122 = 0u;
        CFStringGetCString(v83, buffer, 32, 0x8000100u);
        uint64_t v11 = (__objc2_class **)(PCIeNANDBootWriter + 8);
        if (CFEqual(v58, @"7C3457EF-0000-11AA-AA11-00306543ECAC") == 1)
        {
          uint64_t v91 = &apfs_recovery_os_container_device_node_path;
          if (!strstr(name, "RecoveryOSContainer"))
          {
            if (*(void *)name ^ 0x737953746F6F4269 | *(void *)&name[8] ^ 0x61746E6F436D6574 | *(void *)&name[13] ^ 0x72656E6961746ELL) {
              uint64_t v91 = &apfs_container_device_node_path;
            }
            else {
              uint64_t v91 = &iboot_system_container_device_node_path;
            }
          }
          snprintf(v91, 0x20uLL, "%s%s", "/dev/", buffer);
          _partition_log((uint64_t)"APFS Container '%s' %s\n", v92, v93, v94, v95, v96, v97, v98, (uint64_t)name);
          goto LABEL_90;
        }
        int v99 = CFEqual(v58, @"EF57347C-0000-11AA-AA11-00306543ECAC");
        uint64_t v91 = v118;
        if (v99 == 1)
        {
          if (v118 && *v118)
          {
            _partition_log((uint64_t)"Found synthesized APFS container. Using %s instead of %s\n", v100, v101, v102, v103, v104, v105, v106, (uint64_t)buffer);
            snprintf(v118, 0x20uLL, "%s%s", "/dev/", buffer);
            goto LABEL_92;
          }
          _partition_log((uint64_t)"found synthesized container without original device node\n", v100, v101, v102, v103, v104, v105, v106, v117);
        }
        if (v118)
        {
LABEL_90:
          CFErrorRef v118 = v91;
          if (!*v91)
          {
            snprintf(v91, 0x20uLL, "%s%s", "/dev/", buffer);
            _partition_log((uint64_t)"APFS Container '%s' %s\n", v108, v109, v110, v111, v112, v113, v114, (uint64_t)name);
          }
          goto LABEL_93;
        }
LABEL_92:
        CFErrorRef v118 = 0;
LABEL_93:
        using_APFS = 1;
        IOObjectRelease(v38);
        CFRelease(cf);
        CFTypeRef cf = 0;
        goto LABEL_78;
      }
      uint64_t v11 = (__objc2_class **)(PCIeNANDBootWriter + 8);
LABEL_78:
      io_object_t v38 = IOIteratorNext(iterator);
      int v37 = 1;
      if (!v38) {
        goto LABEL_101;
      }
    }
    BOOL v59 = *(_DWORD *)name == 1953724755 && *(_DWORD *)&name[3] == 7169396;
    if (v59 || strstr(name, "OS"))
    {
      int v39 = 1;
      uint64_t v60 = "found system volume not at disk0s1s1: %s\n";
      unint64_t v61 = &system_device_node_path;
      if (v48) {
        goto LABEL_33;
      }
    }
    else if (*(_DWORD *)name ^ 0x61746144 | name[4])
    {
      if (*(_DWORD *)name ^ 0x72657355 | name[4])
      {
        if (*(void *)name == 0x646E616265736142 && *(void *)&name[6] == 0x6174614420646ELL)
        {
          unint64_t v61 = &baseband_data_partition_device_node_path;
        }
        else if (*(_DWORD *)name == 1633972309 && *(_DWORD *)&name[3] == 6648929)
        {
          unint64_t v61 = &update_device_node_path;
        }
        else
        {
          if (system_device_node_path) {
            char v82 = 0;
          }
          else {
            char v82 = v39;
          }
          if (v82)
          {
            uint64_t v60 = "looking for a system volume, and found unknown volume '%s'. using it as the system volume.\n";
LABEL_33:
            _partition_log((uint64_t)v60, v51, v52, v53, v54, v55, v56, v57, (uint64_t)name);
            unint64_t v61 = &system_device_node_path;
          }
          else if (*(void *)name == 0x68637461726353)
          {
            unint64_t v61 = &scratch_device_node_path;
          }
          else if (*(_DWORD *)name ^ 0x54524178 | name[4])
          {
            if (*(void *)name ^ 0x797265766F636552 | name[8])
            {
              if (*(void *)name != 0x746F6F62657250)
              {
                _partition_log((uint64_t)"unexpected partition '%s' - skipping", v51, v52, v53, v54, v55, v56, v57, (uint64_t)name);
                unint64_t v61 = 0;
                char v62 = 1;
                goto LABEL_36;
              }
              unint64_t v61 = &preboot_partition_device_node_path;
            }
            else
            {
              unint64_t v61 = &recovery_os_volume_device_node_path;
            }
          }
          else
          {
            unint64_t v61 = &xart_device_node_path;
          }
        }
      }
      else
      {
        unint64_t v61 = &user_device_node_path;
      }
    }
    else
    {
      unint64_t v61 = &data_device_node_path;
    }
    if (*v61)
    {
      _partition_log((uint64_t)"encountered second '%s' partition; original was '%s'",
        v51,
        v52,
        v53,
        v54,
        v55,
        v56,
        v57,
        (uint64_t)name);
    }
    else
    {
      char v62 = 0;
LABEL_36:
      while (1)
      {
        CFBooleanRef v63 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)cf, @"Leaf");
        if (v63)
        {
          if (CFBooleanGetValue(v63) == 1) {
            break;
          }
        }
        IOObjectRelease(v38);
        CFRelease(cf);
        CFTypeRef cf = 0;
        io_object_t v64 = IOIteratorNext(iterator);
        if (!v64)
        {
LABEL_98:
          _partition_log((uint64_t)"ran out of registry entries without finding a leaf media object", v65, v66, v67, v68, v69, v70, v71, v117);
          io_object_t v38 = 0;
          goto LABEL_99;
        }
        io_object_t v38 = v64;
        while (!IOObjectConformsTo(v38, "IOMedia"))
        {
          IOObjectRelease(v38);
          io_object_t v38 = IOIteratorNext(iterator);
          if (!v38) {
            goto LABEL_98;
          }
        }
        uint64_t v72 = IORegistryEntryCreateCFProperties(v38, (CFMutableDictionaryRef *)&cf, kCFAllocatorDefault, 0);
        if (v72)
        {
          _partition_log((uint64_t)"unable to get properies for media registry entry: 0x%.8x", v73, v74, v75, v76, v77, v78, v79, v72);
          goto LABEL_99;
        }
      }
      if (v62)
      {
LABEL_76:
        uint64_t v11 = (__objc2_class **)(PCIeNANDBootWriter + 8);
        goto LABEL_77;
      }
      CFStringRef v107 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"BSD Name");
      if (v107)
      {
        *(_OWORD *)buffer = 0u;
        long long v122 = 0u;
        CFStringGetCString(v107, buffer, 32, 0x8000100u);
        snprintf(v61, 0x20uLL, "%s%s", "/dev/", buffer);
        goto LABEL_76;
      }
      uint64_t v116 = "leaf media object with no bsd name";
LABEL_119:
      _partition_log((uint64_t)v116, v84, v85, v86, v87, v88, v89, v90, v117);
    }
LABEL_99:
    uint64_t v11 = (__objc2_class **)(PCIeNANDBootWriter + 8);
LABEL_100:
    int v37 = 0;
LABEL_101:
    p_superclass = (__objc2_class **)(PCIeNANDBootWriter + 8);
LABEL_102:
    if (iterator && !IOIteratorIsValid(iterator))
    {
      char v9 = 1;
      int v37 = 0;
    }
    if (v38) {
      IOObjectRelease(v38);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (iterator) {
      IOObjectRelease(iterator);
    }
    if (v28) {
      IOObjectRelease(v28);
    }
    if (v37) {
      return 1;
    }
    uint64_t result = 0;
    if (!v9) {
      break;
    }
    ++v8;
  }
  while (v8 != 3);
  return result;
}

uint64_t delete_apfs_partition(unsigned int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = _partition_log((uint64_t)"entering %s\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (uint64_t)"delete_apfs_partition");
  if (!partition_probe_media(v10, v11, v12, v13, v14, v15, v16, v17))
  {
    _partition_log((uint64_t)"%s : partition_probe_media() failed for partition at index %u, mountpoint %s\n", v18, v19, v20, v21, v22, v23, v24, (uint64_t)"delete_apfs_partition");
    return 1;
  }
  if (a2) {
    _unmount_filesystem(a2);
  }
  if (a1 >= 8)
  {
    _partition_log((uint64_t)"%s : Deleting partition at slice %d is not allowed as path is NULL\n", v18, v19, v20, v21, v22, v23, v24, (uint64_t)"delete_apfs_partition");
    return 1;
  }
  uint64_t v25 = off_100059C50[a1];
  if (*v25)
  {
    if (APFSVolumeDelete())
    {
      _partition_log((uint64_t)"%s : failed to delete partition at slice %d\n", v26, v27, v28, v29, v30, v31, v32, (uint64_t)"delete_apfs_partition");
      return 1;
    }
    uint64_t v34 = _partition_log((uint64_t)"%s : delete partition succeeded at slice %d %s\n", v26, v27, v28, v29, v30, v31, v32, (uint64_t)"delete_apfs_partition");
    if (!partition_probe_media(v34, v35, v36, v37, v38, v39, v40, v41))
    {
      _partition_log((uint64_t)"%s : partition_probe_media() failed for checking for partition at slice %d\n", v42, v43, v44, v45, v46, v47, v48, (uint64_t)"delete_apfs_partition");
      return 1;
    }
    if (*v25)
    {
      _partition_log((uint64_t)"%s : partition_probe_media() found partition at slice %d after it was deleted\n", v42, v43, v44, v45, v46, v47, v48, (uint64_t)"delete_apfs_partition");
      return 1;
    }
    return 0;
  }
  else
  {
    _partition_log((uint64_t)"%s : partition at slice %d does not exist, ignoring this delete call\n", v18, v19, v20, v21, v22, v23, v24, (uint64_t)"delete_apfs_partition");
    return 2;
  }
}

uint64_t format_partition(uint64_t a1, char *__s1, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a5;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  *(void *)__str = 0;
  if (a6)
  {
    *(void *)&long long v30 = "/sbin/newfs_apfs";
    if (!strcmp(__s1, "System"))
    {
      uint64_t v16 = 115;
    }
    else if (!strcmp(__s1, "Data"))
    {
      uint64_t v16 = 100;
    }
    else if (!strcmp(__s1, "User"))
    {
      uint64_t v16 = 117;
    }
    else if (!strcmp(__s1, "Preboot"))
    {
      uint64_t v16 = 98;
    }
    else if (!strcmp(__s1, "Baseband Data"))
    {
      uint64_t v16 = 97;
    }
    else if (!strcmp(__s1, "Logs"))
    {
      uint64_t v16 = 105;
    }
    else if (!strcmp(__s1, "xART"))
    {
      uint64_t v16 = 120;
    }
    else if (!strcmp(__s1, "Scratch"))
    {
      uint64_t v16 = 110;
    }
    else if (!strcmp(__s1, "Hardware"))
    {
      uint64_t v16 = 104;
    }
    else if (!strcmp(__s1, "Update"))
    {
      uint64_t v16 = 112;
    }
    else
    {
      if (strcmp(__s1, "Recovery"))
      {
        unsigned int v11 = 1;
LABEL_28:
        unsigned int v13 = v11 + 1;
        uint64_t v15 = v11;
        uint64_t v12 = "/sbin/newfs_apfs";
        uint64_t v14 = "-A";
        goto LABEL_29;
      }
      uint64_t v16 = 114;
    }
    *((void *)&v30 + 1) = "-o";
    snprintf(__str, 8uLL, "role=%c", v16);
    *(void *)&long long v31 = __str;
    unsigned int v11 = 3;
    goto LABEL_28;
  }
  uint64_t v12 = "/sbin/newfs_hfs";
  *(void *)&long long v30 = "/sbin/newfs_hfs";
  *((void *)&v30 + 1) = "-s";
  unsigned int v13 = 2;
  if (!a4) {
    goto LABEL_30;
  }
  unsigned int v13 = 3;
  uint64_t v14 = "-J";
  uint64_t v15 = 2;
LABEL_29:
  *((void *)&v30 + v15) = v14;
LABEL_30:
  *((void *)&v30 + v13) = "-v";
  unsigned int v17 = v13 + 2;
  *((void *)&v30 + v13 + 1) = __s1;
  if (v8 == 1)
  {
    *((void *)&v30 + v17) = "-P";
    unsigned int v17 = v13 + 3;
  }
  *((void *)&v30 + v17) = a1;
  *((void *)&v30 + v17 + 1) = 0;
  uint64_t v18 = 8;
  do
  {
    _partition_log((uint64_t)"%s ", (uint64_t)__s1, a3, a4, a5, a6, a7, a8, (uint64_t)v12);
    uint64_t v12 = *(const char **)((char *)&v30 + v18);
    v18 += 8;
  }
  while (v12);
  _partition_log((uint64_t)"\n", (uint64_t)__s1, a3, a4, a5, a6, a7, a8, v28);
  if (_executeCommandPtr)
  {
    uint64_t v26 = _executeCommandPtr(&v30, _partition_execution_log, 0);
    if (!v26) {
      return v26;
    }
  }
  else
  {
    uint64_t v26 = 0xFFFFFFFFLL;
  }
  _partition_log((uint64_t)"%s returned %d", v19, v20, v21, v22, v23, v24, v25, v30);
  return v26;
}

uint64_t _mount_filesystem(const char *a1, const char *a2)
{
  if (strnstr(a1, "/dev/", 5uLL) == a1) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = (uint64_t)&a1[v4];
  CFDictionaryRef v6 = IOBSDNameMatching(kIOMasterPortDefault, 0, &a1[v4]);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
  if (MatchingService)
  {
    io_object_t v15 = MatchingService;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"Content Hint", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      uint64_t v24 = CFProperty;
      int v25 = CFEqual(CFProperty, @"41504653-0000-11AA-AA11-00306543ECAC");
      CFRelease(v24);
      IOObjectRelease(v15);
      if (v25)
      {
        uint64_t v26 = "apfs";
        goto LABEL_11;
      }
    }
    else
    {
      _partition_log((uint64_t)"unable to find content hint for %s", v17, v18, v19, v20, v21, v22, v23, v5);
      IOObjectRelease(v15);
    }
  }
  else
  {
    _partition_log((uint64_t)"unable to find service for %s", v8, v9, v10, v11, v12, v13, v14, v5);
  }
  uint64_t v26 = "hfs";
LABEL_11:
  v36[0] = "/sbin/mount";
  v36[1] = "-t";
  v36[2] = v26;
  v36[3] = "-o";
  v36[4] = "nobrowse";
  v36[5] = a1;
  v36[6] = a2;
  v36[7] = 0;
  mkdir(a2, 0x1C0u);
  if (_executeCommandPtr)
  {
    uint64_t v34 = _executeCommandPtr(v36, _partition_execution_log, 0);
    if (!v34) {
      return v34;
    }
  }
  else
  {
    uint64_t v34 = 0xFFFFFFFFLL;
  }
  _partition_log((uint64_t)"mounting %s at %s failed: %d", v27, v28, v29, v30, v31, v32, v33, (uint64_t)a1);
  return v34;
}

uint64_t create_allocated_empty_file(uint64_t a1, char *a2)
{
  uint64_t v46 = 0;
  unlink(a2);
  int v4 = open(a2, 2562, 384);
  if (v4 == -1)
  {
    uint64_t v43 = *__error();
    _partition_log((uint64_t)"Could not open %s with error %d", v21, v22, v23, v24, v25, v26, v27, (uint64_t)a2);
    return v43;
  }
  else
  {
    int v5 = v4;
    v45[0] = 0x30000000CLL;
    v45[1] = 0;
    v45[2] = a1;
    if (fcntl(v4, 42, v45) == -1)
    {
      uint64_t v20 = *__error();
      _partition_log((uint64_t)"preallocation of %llu bytes failed: %d", v28, v29, v30, v31, v32, v33, v34, a1);
    }
    else if (v46 >= a1)
    {
      if (ftruncate(v5, a1) == -1)
      {
        uint64_t v44 = *__error();
        _partition_log((uint64_t)"failed to write to %s file to establish the size (%d).", v35, v36, v37, v38, v39, v40, v41, (uint64_t)a2);
        uint64_t v20 = v44;
      }
      else
      {
        uint64_t v20 = 0;
      }
    }
    else
    {
      _partition_log((uint64_t)"failed to allocate all %llu bytes for %s. only allocatedf %llu bytes", v6, v7, v8, v9, v10, v11, v12, a1);
      if (unlink(a2) == -1)
      {
        __error();
        _partition_log((uint64_t)"failed to unlink %s: %d", v13, v14, v15, v16, v17, v18, v19, (uint64_t)a2);
      }
      uint64_t v20 = 28;
    }
    close(v5);
  }
  return v20;
}

uint64_t mount_update_partition_if_exists(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = _partition_log((uint64_t)"entering %s\n", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"mount_update_partition_if_exists");
  if (!partition_probe_media(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    _partition_log((uint64_t)"%s : partition_probe_media() failed.\n", v17, v18, v19, v20, v21, v22, v23, (uint64_t)"mount_update_partition_if_exists");
    return 0xFFFFFFFFLL;
  }
  if (!update_device_node_path)
  {
    _partition_log((uint64_t)"%s : no device node found for update partition\n", v17, v18, v19, v20, v21, v22, v23, (uint64_t)"mount_update_partition_if_exists");
    return 0xFFFFFFFFLL;
  }
  char v62 = 0;
  uint64_t v24 = realpath_DARWIN_EXTSN(a1, 0);
  if (!v24)
  {
    __error();
    _partition_log((uint64_t)"Failed to realpath(\"%s\"). errno=%d", v37, v38, v39, v40, v41, v42, v43, (uint64_t)a1);
    return 0xFFFFFFFFLL;
  }
  uint64_t v25 = v24;
  int v26 = getmntinfo_r_np(&v62, 2);
  if (v26 < 1)
  {
    _partition_log((uint64_t)"Failed to get mount info for all mounted file systems", v27, v28, v29, v30, v31, v32, v33, v61);
    uint64_t v44 = *__error();
  }
  else
  {
    unint64_t v34 = 0;
    uint64_t v35 = v62;
    uint64_t v36 = 2168 * v26;
    while (strcmp(v35[v34 / 0x878].f_mntfromname, &update_device_node_path))
    {
      v34 += 2168;
      if (v36 == v34) {
        goto LABEL_16;
      }
    }
    if (!strcmp(v35[v34 / 0x878].f_mntonname, v25))
    {
      _partition_log((uint64_t)"Update partition is already mounted\n", v45, v46, v47, v48, v49, v50, v51, v61);
      uint64_t v44 = 0;
      goto LABEL_19;
    }
    _partition_log((uint64_t)"unmounting %s at %s", v45, v46, v47, v48, v49, v50, v51, (uint64_t)v35[v34 / 0x878].f_mntfromname);
    _unmount_filesystem(v62[v34 / 0x878].f_mntonname);
LABEL_16:
    uint64_t v44 = _mount_filesystem(&update_device_node_path, v25);
    BOOL v59 = "Failed to mount";
    if (!v44) {
      BOOL v59 = "Successfully mounted";
    }
    _partition_log((uint64_t)"%s update partition at %s", v52, v53, v54, v55, v56, v57, v58, (uint64_t)v59);
  }
LABEL_19:
  if (v62) {
    free(v62);
  }
  free(v25);
  return v44;
}

uint64_t enumerate_apfs_snapshots(const char *a1, uint64_t a2)
{
  uint64_t v3 = open(a1, 0x100000);
  if ((v3 & 0x80000000) != 0)
  {
    uint64_t v18 = *__error();
    _partition_log((uint64_t)"%s : Unable to open %s: %d", v19, v20, v21, v22, v23, v24, v25, (uint64_t)"enumerate_apfs_snapshots");
  }
  else
  {
    uint64_t v4 = v3;
    v27.reserved = 0;
    *(void *)&v27.volattr = 0;
    *(void *)&v27.fileattr = 0;
    bzero(v28, 0x400uLL);
    v27.bitmapcount = 5;
    v27.commonattr = -1610612735;
    int v5 = fs_snapshot_list(v4, &v27, v28, 0x400uLL, 0);
    if (v5 < 0)
    {
      _partition_log((uint64_t)"%s : fs_snapshot_list failed with error %d", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"enumerate_apfs_snapshots");
      uint64_t v18 = 1;
    }
    else
    {
      if (v5)
      {
        int v13 = v5 + 1;
        uint64_t v14 = (unsigned int *)v28;
        while (1)
        {
          uint64_t v15 = (int *)(v14 + 6);
          unsigned int v16 = v14[1];
          if ((v16 & 0x20000000) != 0)
          {
            uint64_t v18 = *v15;
            _partition_log((uint64_t)"%s : Error in reading attributes for directory entry %d", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"enumerate_apfs_snapshots");
            goto LABEL_16;
          }
          uint64_t v17 = *v14;
          if ((v16 & 1) != 0
            && ((*(uint64_t (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, v4, (char *)v15 + *v15) & 1) == 0)
          {
            break;
          }
          uint64_t v14 = (unsigned int *)((char *)v14 + v17);
          if (--v13 <= 1) {
            goto LABEL_15;
          }
        }
        _partition_log((uint64_t)"%s : caller cancelled on snapshot %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"enumerate_apfs_snapshots");
      }
      else
      {
        _partition_log((uint64_t)"%s : No snapshots to enumerate on %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"enumerate_apfs_snapshots");
      }
LABEL_15:
      uint64_t v18 = 0;
    }
LABEL_16:
    close(v4);
  }
  return v18;
}

BOOL is_storage_apfs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return partition_probe_media(a1, a2, a3, a4, a5, a6, a7, a8) && (using_APFS & 1) != 0;
}

BOOL is_mountpoint_apfs(const char *a1)
{
  bzero(&v11, 0x878uLL);
  partition_probe_media(v2, v3, v4, v5, v6, v7, v8, v9);
  return a1
      && !statfs(a1, &v11)
      && (*(_DWORD *)v11.f_fstypename ^ 0x73667061 | v11.f_fstypename[4]) == 0;
}

uint64_t _partition_wait_for_device(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _partition_log((uint64_t)"entering %s: '%s'\n", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"_partition_wait_for_device");
  if (!a1)
  {
    uint64_t v41 = "path argument is NULL";
    goto LABEL_16;
  }
  CFStringRef v16 = CFStringCreateWithCString(kCFAllocatorDefault, "EmbeddedDeviceTypeRoot", 0x8000100u);
  if (!v16)
  {
LABEL_15:
    uint64_t v41 = "failed to allocate device lookup dict";
LABEL_16:
    _partition_log((uint64_t)v41, v9, v10, v11, v12, v13, v14, v15, (uint64_t)v111);
    return 0;
  }
  CFStringRef v17 = v16;
  CFMutableStringRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    uint64_t v19 = (__CFDictionary *)v17;
LABEL_14:
    CFRelease(v19);
    goto LABEL_15;
  }
  uint64_t v19 = Mutable;
  CFDictionaryAddValue(Mutable, v17, kCFBooleanTrue);
  uint64_t v20 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v20)
  {
    CFRelease(v17);
    goto LABEL_14;
  }
  uint64_t v21 = v20;
  CFDictionaryAddValue(v20, @"IOPropertyMatch", v19);
  CFRelease(v17);
  CFRelease(v19);
  unsigned int v22 = 0;
  while (1)
  {
    CFRetain(v21);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v21);
    if (MatchingService) {
      break;
    }
    if (30 - v22 >= 3) {
      unsigned int v24 = 3;
    }
    else {
      unsigned int v24 = 30 - v22;
    }
    CFStringRef v25 = CFCopyDescription(v21);
    CStringPtr = CFStringGetCStringPtr(v25, 0);
    _partition_log((uint64_t)"waiting for matching IOKit service: %s\n", v27, v28, v29, v30, v31, v32, v33, (uint64_t)CStringPtr);
    sleep(v24);
    v22 += v24;
    CFRelease(v25);
    if (v22 >= 0x1E)
    {
      CFRelease(v21);
      _partition_log((uint64_t)"failed to lookup IO service for %s", v34, v35, v36, v37, v38, v39, v40, (uint64_t)"EmbeddedDeviceTypeRoot");
      return 0;
    }
  }
  io_object_t v44 = MatchingService;
  CFRelease(v21);
  IOObjectRetain(v44);
  io_registry_entry_t v45 = v44;
  do
  {
    io_iterator_t iterator = 0;
    if (IORegistryEntryGetChildIterator(v45, "IOService", &iterator))
    {
      uint64_t v73 = "Could not create child iterator";
      goto LABEL_36;
    }
    io_object_t v53 = IOIteratorNext(iterator);
    uint64_t v54 = 0;
    if (!v53)
    {
      io_object_t v55 = iterator;
LABEL_35:
      IOObjectRelease(v55);
      uint64_t v111 = v54;
      uint64_t v73 = "Found %d child nodes (expected 1)";
LABEL_36:
      _partition_log((uint64_t)v73, v46, v47, v48, v49, v50, v51, v52, (uint64_t)v111);
      LODWORD(v64) = 0;
      goto LABEL_37;
    }
    io_object_t v55 = 0;
    do
    {
      if (v55) {
        IOObjectRelease(v53);
      }
      else {
        io_object_t v55 = v53;
      }
      io_object_t v53 = IOIteratorNext(iterator);
      uint64_t v54 = (const char *)(v54 + 1);
    }
    while (v53);
    IOObjectRelease(iterator);
    if (v54 != 1) {
      goto LABEL_35;
    }
    IOObjectRelease(v45);
    io_registry_entry_t v45 = v55;
  }
  while (!IOObjectConformsTo(v55, "IOMedia"));
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v55, @"Whole", kCFAllocatorDefault, 0);
  CFBooleanRef v64 = CFProperty;
  if (!CFProperty)
  {
    _partition_log((uint64_t)"Did not find Whole property on IOMedia class", v57, v58, v59, v60, v61, v62, v63, (uint64_t)v111);
    goto LABEL_38;
  }
  CFTypeID v65 = CFGetTypeID(CFProperty);
  if (v65 != CFBooleanGetTypeID())
  {
    uint64_t v102 = "Expected Whole to be BOOLean";
LABEL_63:
    _partition_log((uint64_t)v102, v66, v67, v68, v69, v70, v71, v72, (uint64_t)v111);
    io_registry_entry_t v45 = v55;
    io_object_t v55 = 0;
    goto LABEL_64;
  }
  if (!CFBooleanGetValue(v64))
  {
    uint64_t v102 = "Expected Whole=true";
    goto LABEL_63;
  }
  io_registry_entry_t v45 = 0;
LABEL_64:
  CFRelease(v64);
  LODWORD(v64) = v55;
LABEL_37:
  io_object_t v55 = v45;
  if (!v45) {
    goto LABEL_39;
  }
LABEL_38:
  IOObjectRelease(v55);
LABEL_39:
  if (v64)
  {
    CFStringRef v74 = (const __CFString *)IORegistryEntryCreateCFProperty((io_registry_entry_t)v64, @"BSD Name", kCFAllocatorDefault, 0);
    if (v74)
    {
      CFStringRef v82 = v74;
      CFTypeID v83 = CFGetTypeID(v74);
      if (v83 == CFStringGetTypeID())
      {
        strcpy(a1, "/dev/");
        size_t v91 = strlen(a1);
        if (CFStringGetCString(v82, &a1[v91], 32 - v91, 0x8000100u))
        {
          _partition_log((uint64_t)"Using device path %s for %s\n", v92, v93, v94, v95, v96, v97, v98, (uint64_t)a1);
          int v99 = -10;
          while (1)
          {
            if (!access(a1, 0))
            {
              uint64_t v42 = 1;
              goto LABEL_59;
            }
            if (*__error() != 2) {
              break;
            }
            sleep(3u);
            if (__CFADD__(v99++, 1)) {
              goto LABEL_56;
            }
          }
          uint64_t v103 = __error();
          strerror(*v103);
          _partition_log((uint64_t)"stat error while waiting for device '%s': %s\n", v104, v105, v106, v107, v108, v109, v110, (uint64_t)a1);
LABEL_56:
          uint64_t v111 = "EmbeddedDeviceTypeRoot";
          uint64_t v101 = "timeout waiting for %s";
        }
        else
        {
          uint64_t v101 = "failed to create C string from BSD name";
        }
        _partition_log((uint64_t)v101, v92, v93, v94, v95, v96, v97, v98, (uint64_t)v111);
      }
      else
      {
        _partition_log((uint64_t)"returnbed BSD device name for service %s is wrong type", v84, v85, v86, v87, v88, v89, v90, (uint64_t)"EmbeddedDeviceTypeRoot");
      }
      uint64_t v42 = 0;
LABEL_59:
      CFRelease(v82);
    }
    else
    {
      _partition_log((uint64_t)"no BSD device name for service %s", v75, v76, v77, v78, v79, v80, v81, (uint64_t)"EmbeddedDeviceTypeRoot");
      uint64_t v42 = 0;
    }
    IOObjectRelease((io_object_t)v64);
  }
  else
  {
    uint64_t v42 = 0;
  }
  IOObjectRelease(v44);
  return v42;
}

uint64_t mount_apfs_system_readwrite_with_revert(const char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  partition_probe_media((uint64_t)a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  if (!system_device_node_path)
  {
    _partition_log((uint64_t)"system volume device node not found", v10, v11, v12, v13, v14, v15, v16, v101);
    return 2;
  }
  uint64_t v102 = 0;
  int v17 = getmntinfo_r_np(&v102, 2);
  if (v17 < 1)
  {
    _partition_log((uint64_t)"Failed to get mount info for all mounted file systems", v18, v19, v20, v21, v22, v23, v24, v101);
    return *__error();
  }
  unint64_t v25 = 0;
  int v26 = v102;
  uint64_t v27 = 2168 * v17;
  while (strcmp(v26[v25 / 0x878].f_mntfromname, &system_device_node_path))
  {
    v25 += 2168;
    if (v27 == v25) {
      goto LABEL_10;
    }
  }
  _partition_log((uint64_t)"unmounting %s at %s", v28, v29, v30, v31, v32, v33, v34, (uint64_t)v26[v25 / 0x878].f_mntfromname);
  _unmount_filesystem(v102[v25 / 0x878].f_mntonname);
  int v26 = v102;
LABEL_10:
  free(v26);
  uint64_t v36 = _mount_filesystem(&system_device_node_path, a1);
  if (v36)
  {
    uint64_t v35 = v36;
    _partition_log((uint64_t)"system volume device node %s could not be mounted read/write at %s", v37, v38, v39, v40, v41, v42, v43, (uint64_t)&system_device_node_path);
    return v35;
  }
  if (!is_mountpoint_apfs(a1))
  {
    _partition_log((uint64_t)"media is not apfs managed: unsupported operation", v45, v46, v47, v48, v49, v50, v51, v101);
    return 45;
  }
  if (!a2)
  {
LABEL_29:
    _partition_log((uint64_t)"mounting system volume read/write at %s succeeded.", v45, v46, v47, v48, v49, v50, v51, (uint64_t)a1);
    return 0;
  }
  int v52 = open(a1, 0x100000);
  int v53 = v52;
  if (v52 < 0)
  {
    uint64_t v35 = *__error();
    _partition_log((uint64_t)"%s : Unable to open %s: %d", v69, v70, v71, v72, v73, v74, v75, (uint64_t)"mount_apfs_system_readwrite_with_revert");
    if (v53 == -1) {
      return v35;
    }
    goto LABEL_23;
  }
  if (fs_snapshot_revert(v52, a2, 0))
  {
    uint64_t v61 = __error();
    uint64_t v35 = *v61;
    strerror(*v61);
    _partition_log((uint64_t)"revert snapshot operation failed: %d %s", v62, v63, v64, v65, v66, v67, v68, v35);
    goto LABEL_23;
  }
  _partition_log((uint64_t)"reverting system volume to snapshot %s succeeded. remounting...", v54, v55, v56, v57, v58, v59, v60, (uint64_t)a2);
  if (!close(v53))
  {
    uint64_t v92 = _unmount_filesystem(a1);
    if (v92)
    {
      uint64_t v35 = v92;
      _partition_log((uint64_t)"system volume device node %s could not be unmounted from %s", v93, v94, v95, v96, v97, v98, v99, (uint64_t)&system_device_node_path);
      return v35;
    }
    uint64_t v100 = _mount_filesystem(&system_device_node_path, a1);
    if (v100)
    {
      uint64_t v35 = v100;
      _partition_log((uint64_t)"system volume device node %s could not be re-mounted read/write at %s", v45, v46, v47, v48, v49, v50, v51, (uint64_t)&system_device_node_path);
      return v35;
    }
    goto LABEL_29;
  }
  uint64_t v76 = __error();
  uint64_t v35 = *v76;
  strerror(*v76);
  _partition_log((uint64_t)"%s: Unable to close directory: %d %s\n", v77, v78, v79, v80, v81, v82, v83, (uint64_t)"mount_apfs_system_readwrite_with_revert");
LABEL_23:
  if (close(v53))
  {
    __error();
    uint64_t v84 = __error();
    strerror(*v84);
    _partition_log((uint64_t)"%s: Unable to close directory: %d %s\n", v85, v86, v87, v88, v89, v90, v91, (uint64_t)"mount_apfs_system_readwrite_with_revert");
  }
  return v35;
}

char *copy_rooted_snapshot_name()
{
  int v17 = 0;
  if (!is_mountpoint_apfs("/"))
  {
    uint64_t v7 = "media is not apfs managed: unsupported operation";
    goto LABEL_5;
  }
  bzero(&v20, 0x878uLL);
  if (statfs("/", &v20))
  {
    uint64_t v7 = "statfs of root failed";
LABEL_5:
    _partition_log((uint64_t)v7, v0, v1, v2, v3, v4, v5, v6, v16);
    return 0;
  }
  size_t v9 = strlen(v20.f_mntfromname);
  size_t v10 = strlen(&system_device_node_path);
  if (v9 <= v10 + 1
    || (size_t v11 = v9 + ~v10, v20.f_mntfromname[v11] != 64)
    || strcmp(&v20.f_mntfromname[v9 - v10], &system_device_node_path)
    || (asprintf(&v17, "%.*s", v11, v20.f_mntfromname), (uint64_t result = v17) == 0))
  {
    if (strnstr(v20.f_mntfromname, "/dev/", 5uLL) == v20.f_mntfromname) {
      f_mntfromio_name_t name = &v20.f_mntfromname[5];
    }
    else {
      f_mntfromio_name_t name = v20.f_mntfromname;
    }
    CFDictionaryRef v13 = IOBSDNameMatching(kIOMasterPortDefault, 0, f_mntfromname);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v13);
    io_object_t v15 = MatchingService;
    if (MatchingService)
    {
      if (IOObjectConformsTo(MatchingService, "AppleAPFSSnapshot"))
      {
        memset(v19, 0, sizeof(v19));
        memset(v18, 0, sizeof(v18));
        if (!fsctl("/", 0xC1204A43uLL, v18, 0))
        {
          if (LOBYTE(v19[0])) {
            int v17 = strdup((const char *)v19);
          }
        }
      }
    }
    IOObjectRelease(v15);
    return v17;
  }
  return result;
}

char *copy_root_snapshot_name_from_dt()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen");
  if (!v0)
  {
    _partition_log((uint64_t)"uanble to find chosen node", v1, v2, v3, v4, v5, v6, v7, v30);
    return 0;
  }
  io_object_t v8 = v0;
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v0, @"root-snapshot-name", kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    _partition_log((uint64_t)"unable to look up root-snapshot-name on chosen node", v10, v11, v12, v13, v14, v15, v16, v30);
    IOObjectRelease(v8);
    return 0;
  }
  CFDataRef v17 = CFProperty;
  CFTypeID v18 = CFGetTypeID(CFProperty);
  if (v18 == CFDataGetTypeID())
  {
    BytePtr = (const char *)CFDataGetBytePtr(v17);
    size_t Length = CFDataGetLength(v17);
    uint64_t v28 = strndup(BytePtr, Length);
  }
  else
  {
    _partition_log((uint64_t)"device tree root-snapshot-name type mismatch", v19, v20, v21, v22, v23, v24, v25, v30);
    uint64_t v28 = 0;
  }
  IOObjectRelease(v8);
  CFRelease(v17);
  return v28;
}

uint64_t get_main_container_space_info(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _partition_log((uint64_t)"entering %s\n", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, (uint64_t)"get_main_container_space_info");
  if (apfs_container_device_node_path)
  {
    uint64_t SpaceInfo = APFSContainerGetSpaceInfo();
    if (SpaceInfo) {
      _partition_log((uint64_t)"APFSContainerGetSpaceInfo failed with result:%d", v21, v22, v23, v24, v25, v26, v27, SpaceInfo);
    }
  }
  else
  {
    _partition_log((uint64_t)"No container device found, can't retrieve space info", v13, v14, v15, v16, v17, v18, v19, v52);
  }
  if (system_device_node_path)
  {
    uint64_t v28 = APFSVolumeGetSpaceInfo();
    if (v28) {
      _partition_log((uint64_t)"APFSVolumeGetSpaceInfo for system volume failed with result:%d", v29, v30, v31, v32, v33, v34, v35, v28);
    }
  }
  else
  {
    _partition_log((uint64_t)"No system device found, can't retrieve space info", v21, v22, v23, v24, v25, v26, v27, v52);
  }
  if (data_device_node_path)
  {
    uint64_t v36 = APFSVolumeGetSpaceInfo();
    if (v36) {
      _partition_log((uint64_t)"APFSVolumeGetSpaceInfo for data volume failed with result:%d", v37, v38, v39, v40, v41, v42, v43, v36);
    }
  }
  else
  {
    _partition_log((uint64_t)"No data device found, can't retrieve space info", v29, v30, v31, v32, v33, v34, v35, v52);
  }
  if (!preboot_partition_device_node_path)
  {
    uint64_t result = _partition_log((uint64_t)"No preboot device found, can't retrieve space info", v37, v38, v39, v40, v41, v42, v43, v52);
LABEL_17:
    if (!a1) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t result = APFSVolumeGetSpaceInfo();
  if (result)
  {
    uint64_t result = _partition_log((uint64_t)"APFSVolumeGetSpaceInfo for preboot volume failed with result:%d", v45, v46, v47, v48, v49, v50, v51, result);
    goto LABEL_17;
  }
  if (a1) {
LABEL_18:
  }
    *a1 = 0;
LABEL_19:
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  return result;
}

uint64_t _partition_execution_log()
{
  if (_executionLoggingPtr) {
    return _executionLoggingPtr();
  }
  return result;
}

void sub_100026FC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

uint64_t __os_cleanup_iorelease(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    if (result) {
      __os_cleanup_iorelease_cold_1(&v2, v3);
    }
  }
  return result;
}

uint64_t _ioreg_property_is_nonzero(char *a1, const __CFString *a2)
{
  CFDataRef v4 = (const __CFData *)_ioreg_copy_property(a1, a2);
  if (v4)
  {
    CFDataRef v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFDataGetTypeID()
      || (BytePtr = CFDataGetBytePtr(v5), (size_t Length = CFDataGetLength(v5)) != 0)
      && (Length > 4 || !memcmp(BytePtr, &_ioreg_property_is_nonzero_kZeroBytes, Length)))
    {
      uint64_t v9 = 0;
      uint64_t v10 = "NO";
    }
    else
    {
      uint64_t v9 = 1;
      uint64_t v10 = "YES";
    }
    ramrod_log_msg_cf(@"Boot Firmware Updater: property_is_nonzero(%s, %@) = %s (%@)\n", a1, a2, v10, v5);
    CFRelease(v5);
  }
  else
  {
    ramrod_log_msg_cf(@"Boot Firmware Updater: property_is_nonzero(%s, %@) = %s (%@)\n", a1, a2, "NO", 0);
    return 0;
  }
  return v9;
}

BOOL _ioreg_property_exists(const __CFString *a1)
{
  CFTypeRef v2 = _ioreg_copy_property("IODeviceTree:/defaults", a1);
  CFTypeRef v3 = v2;
  if (v2)
  {
    CFRelease(v2);
    CFDataRef v4 = "YES";
  }
  else
  {
    CFDataRef v4 = "NO";
  }
  ramrod_log_msg_cf(@"Boot Firmware Updater: property_exists(%s, %@) = %s\n", "IODeviceTree:/defaults", a1, v4);
  return v3 != 0;
}

void sub_100027894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

CFTypeRef _ioreg_copy_property(char *path, const __CFString *a2)
{
  io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, path);
  if (!v3) {
    return 0;
  }
  io_object_t v4 = v3;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v3, a2, kCFAllocatorDefault, 0);
  IOObjectRelease(v4);
  return CFProperty;
}

uint64_t MSUBootFirmwareFindNamespace(io_registry_entry_t a1, uint64_t a2)
{
  uint64_t entryID = 0;
  IORegistryEntryGetRegistryEntryID(a1, &entryID);
  IOServiceWaitQuiet(a1, 0);
  v12[0] = @"IOParentMatch";
  CFMutableDictionaryRef v4 = IORegistryEntryIDMatching(entryID);
  CFTypeRef v5 = (id)CFMakeCollectable(v4);
  v12[1] = @"IOPropertyMatch";
  v13[0] = v5;
  uint64_t v10 = a2;
  uint64_t v11 = +[NSNumber numberWithBool:1];
  v13[1] = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  CFTypeID v6 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  if (v6) {
    CFDictionaryRef v7 = (const __CFDictionary *)CFRetain(v6);
  }
  else {
    CFDictionaryRef v7 = 0;
  }
  return IOServiceGetMatchingService(kIOMasterPortDefault, v7);
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return __os_log_send_and_compose_impl(a1, v6, v5, 80, a5, v7, 16);
}

void sub_100029F34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

uint64_t __os_cleanup_iorelease_0(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    if (result) {
      __os_cleanup_iorelease_cold_1_0(&v2, v3);
    }
  }
  return result;
}

void sub_10002A330(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

uint64_t __os_cleanup_ioclose(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = IOServiceClose(result);
    if (result) {
      __os_cleanup_ioclose_cold_1(&v2, v3);
    }
  }
  return result;
}

double OUTLINED_FUNCTION_2(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

BOOL OUTLINED_FUNCTION_3()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void iBU_LOG_real(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = [objc_alloc((Class)NSString) initWithFormat:a1 arguments:&a9];
  uint64_t v11 = v10;
  if (_loggingPtr_0)
  {
    uint64_t v12 = (const char *)[v10 UTF8String];
    _loggingPtr_0("%s: %s\n", a2, v12);
  }
  else
  {
    NSLog(@"%s: %@", a2, v10);
  }
}

NSError *MSUBootFirmwareError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = [objc_alloc((Class)NSString) initWithFormat:a3 arguments:&a9];
  if (a2)
  {
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v19 = NSUnderlyingErrorKey;
    id v20 = v11;
    uint64_t v21 = a2;
    uint64_t v12 = &v20;
    uint64_t v13 = &v18;
    uint64_t v14 = 2;
  }
  else
  {
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    id v17 = v11;
    uint64_t v12 = &v17;
    uint64_t v13 = &v16;
    uint64_t v14 = 1;
  }
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MSUFirmwareUpdaterErrorDomain", a1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v13, v14, &a9, v16, v17, v18, v19, v20, v21));
}

BOOL _is_firmware_info_entry(io_registry_entry_t a1)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, @"low-level-fw-device-info", 0, 0);
  CFTypeRef v2 = CFProperty;
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v2 != 0;
}

void sub_10002DD3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
}

uint64_t __os_cleanup_iorelease_1(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    if (result) {
      __os_cleanup_iorelease_cold_1_1(&v2, v3);
    }
  }
  return result;
}

void sub_10002DE68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

void image3Discard(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      if (*(void *)v2)
      {
        if ((*(unsigned char *)(v2 + 10) & 4) != 0)
        {
          image3Free(*(void **)v2);
          uint64_t v2 = *a1;
        }
      }
      image3Free((void *)v2);
      *a1 = 0;
    }
  }
}

uint64_t image3InstantiateNew(void *a1, size_t a2, unsigned int a3)
{
  uint64_t v6 = image3Malloc(0x28uLL);
  if (!v6) {
    return 12;
  }
  uint64_t v7 = v6;
  if (a2 <= 0x14) {
    a2 = 20;
  }
  uint64_t v8 = image3Malloc(a2);
  *uint64_t v7 = v8;
  if (!v8)
  {
    image3Free(v7);
    return 12;
  }
  *uint64_t v8 = 0;
  v8[1] = 0;
  *((_DWORD *)v8 + 4) = 0;
  uint64_t v9 = (_DWORD *)*v7;
  *uint64_t v9 = 1231906611;
  v9[4] = a3;
  v7[2] = a2;
  v7[3] = 0xFFFFFFFF00000000;
  *((_DWORD *)v7 + 2) = 0x40000;
  v7[4] = 0;
  if (a3 == 1667592820 || (uint64_t v10 = image3SetTagUnsignedNumber((char **)v7, 1415139397, a3), !v10))
  {
    uint64_t v11 = 0;
    *a1 = v7;
  }
  else
  {
    uint64_t v11 = v10;
    image3Free((void *)*v7);
    image3Free(v7);
  }
  return v11;
}

uint64_t image3SetTagUnsignedNumber(char **a1, int a2, unint64_t a3)
{
  int v7 = 0;
  unint64_t v6 = 0;
  if (HIDWORD(a3))
  {
    unint64_t v6 = a3;
    io_registry_entry_t v3 = (uint64_t *)&v6;
    size_t v4 = 8;
  }
  else
  {
    int v7 = a3;
    io_registry_entry_t v3 = (uint64_t *)&v7;
    size_t v4 = 4;
  }
  return image3SetTagStructure(a1, a2, v3, v4, 0);
}

uint64_t image3Finalize(uint64_t a1, char **a2, void *a3, int a4, uint64_t a5)
{
  unint64_t v18 = 0;
  int8x16_t v19 = 0uLL;
  int v20 = 0;
  v16[0] = 0;
  v16[1] = 0;
  int v17 = 0;
  if (!a4) {
    goto LABEL_8;
  }
  uint64_t result = image3AdvanceCursorWithZeroPad((char **)a1, (56 - *(_DWORD *)(a1 + 24)) & 0x3F);
  if (!result)
  {
    uint64_t v10 = *(char **)a1;
    unsigned int v11 = *(_DWORD *)(a1 + 24);
    *((_DWORD *)v10 + 3) = v11 + a5;
    uint64_t v12 = v10 + 12;
    CC_LONG v13 = v11 + 8;
    if (a5)
    {
      unint64_t v18 = __PAIR64__(v11, a5);
      image3SHA1Partial(v12, v13, &v19);
    }
    else
    {
      image3SHA1Generate(v12, v13, (unsigned __int8 *)v16);
    }
    uint64_t result = image3PKISignHash();
    if (!result)
    {
      *(_DWORD *)(a1 + 8) |= 0x20000u;
LABEL_8:
      uint64_t result = 0;
      uint64_t v14 = *(char **)a1;
      *((_DWORD *)v14 + 2) = *(_DWORD *)(a1 + 24);
      uint64_t v15 = (*(_DWORD *)(a1 + 24) + 20);
      *((_DWORD *)v14 + 1) = v15;
      *a2 = v14;
      *a3 = v15;
    }
  }
  return result;
}

uint64_t image3AdvanceCursorWithZeroPad(char **a1, int a2)
{
  if ((*((unsigned char *)a1 + 10) & 2) != 0) {
    return 30;
  }
  uint64_t v4 = *((int *)a1 + 6);
  uint64_t v3 = *((int *)a1 + 7);
  LODWORD(v5) = v4 + a2;
  *((_DWORD *)a1 + 6) = v4 + a2;
  unint64_t v6 = *a1;
  if (v3 != -1)
  {
    *(_DWORD *)&v6[v3 + 24] = v5 - v3;
    LODWORD(v5) = *((_DWORD *)a1 + 6);
  }
  uint64_t v5 = (int)v5;
  unint64_t v7 = (int)v5 + 20;
  if (v7 <= (unint64_t)a1[2]) {
    goto LABEL_7;
  }
  unint64_t v6 = (char *)realloc(v6, (int)v5 + 20);
  if (v6)
  {
    *a1 = v6;
    a1[2] = (char *)v7;
    uint64_t v5 = *((int *)a1 + 6);
LABEL_7:
    bzero(&v6[v4 + 20], v5 - v4);
    uint64_t result = 0;
    *((_DWORD *)*a1 + 2) = *((_DWORD *)a1 + 6);
    return result;
  }
  return 12;
}

uint64_t image3SetTagStructure(char **a1, int a2, void *__src, size_t __n, int a5)
{
  if ((*((unsigned char *)a1 + 10) & 2) != 0) {
    return 30;
  }
  if (a5)
  {
    uint64_t v9 = *((int *)a1 + 7);
    int v10 = (a5 + *((_DWORD *)a1 + 6) / a5 * a5 - *((_DWORD *)a1 + 6)) % a5 + *((_DWORD *)a1 + 6);
    *((_DWORD *)a1 + 6) = v10;
    unsigned int v11 = *a1;
    if (v9 != -1) {
      *(_DWORD *)&v11[v9 + 24] = v10 - v9;
    }
  }
  else
  {
    unsigned int v11 = *a1;
  }
  if ((__n & 0xF) != 0) {
    size_t v13 = 16 - (__n & 0xF);
  }
  else {
    size_t v13 = 0;
  }
  uint64_t v14 = *((int *)a1 + 6);
  size_t v15 = __n + v13 + v14 + 32;
  if (v15 > (unint64_t)a1[2])
  {
    unsigned int v11 = (char *)realloc(v11, __n + v13 + v14 + 32);
    if (!v11) {
      return 12;
    }
    *a1 = v11;
    a1[2] = (char *)v15;
    uint64_t v14 = *((int *)a1 + 6);
  }
  NSErrorUserInfoKey v16 = &v11[v14];
  if (((v13 + __n) & 3) != 0) {
    int v17 = ((v13 + __n) & 0xFFFFFFFC) + 16;
  }
  else {
    int v17 = v13 + __n + 12;
  }
  *((_DWORD *)v16 + 5) = a2;
  *((_DWORD *)v16 + 6) = v17;
  *((_DWORD *)v16 + 7) = __n;
  memcpy(v16 + 32, __src, __n);
  bzero(&v16[__n + 32], v13);
  uint64_t result = 0;
  int v18 = *((_DWORD *)a1 + 6);
  *((_DWORD *)a1 + 7) = v18;
  int v19 = *((_DWORD *)v16 + 6) + v18;
  *((_DWORD *)a1 + 6) = v19;
  *((_DWORD *)*a1 + 2) = v19;
  return result;
}

uint64_t image3InstantiateFromBuffer(void *a1, _DWORD *a2, unint64_t a3, char a4)
{
  if (a3 < 0x14) {
    return 22;
  }
  if (*a2 != 1231906611) {
    return 22;
  }
  unint64_t v6 = a2[2];
  if (a3 - 20 < v6 || a2[3] > v6 || v6 + 20 > a2[1]) {
    return 22;
  }
  int v10 = image3Malloc(0x28uLL);
  if (!v10) {
    return 12;
  }
  unsigned int v11 = v10;
  *((_DWORD *)v10 + 2) = 1;
  v10[4] = 0;
  if (a2[3])
  {
    *((_DWORD *)v10 + 2) = 131073;
    if ((a4 & 1) == 0)
    {
      *int v10 = a2;
      v10[2] = a3;
LABEL_21:
      uint64_t result = 0;
      *a1 = v11;
      return result;
    }
    goto LABEL_19;
  }
  *((_DWORD *)v10 + 6) = a2[2];
  *((_DWORD *)v10 + 7) = -1;
  unsigned int v12 = a2[2];
  if (!v12)
  {
LABEL_19:
    size_t v16 = a2[2] + 20;
    v11[2] = v16;
    int v17 = image3Malloc(v16);
    *unsigned int v11 = v17;
    if (v17)
    {
      memcpy(v17, a2, v11[2]);
      *((_DWORD *)v11 + 2) |= 0x40000u;
      goto LABEL_21;
    }
    image3Free(v11);
    return 12;
  }
  unsigned int v13 = 0;
  while (1)
  {
    unsigned int v14 = v13;
    unsigned int v15 = *(_DWORD *)((char *)a2 + v13 + 24);
    v13 += v15;
    if (v13 > v12 || v15 <= 0xB) {
      break;
    }
    if (v13 == v12)
    {
      *((_DWORD *)v10 + 7) = v14;
      goto LABEL_19;
    }
  }
  image3Free(v10);
  return 22;
}

uint64_t image3GetTagStruct(uint64_t a1, int a2, void *a3, void *a4, int a5)
{
  uint64_t v5 = *(unsigned int *)(*(void *)a1 + 8);
  if (!v5) {
    return 2;
  }
  unint64_t v6 = (_DWORD *)(*(void *)a1 + 20);
  unint64_t v7 = (unint64_t)v6 + v5;
  while (1)
  {
    uint64_t v8 = v6 + 3;
    if ((unint64_t)(v6 + 3) > v7) {
      return 22;
    }
    uint64_t v9 = v6[2];
    if ((unint64_t)v8 + v9 > v7) {
      return 22;
    }
    if (a2 == -1 || *v6 == a2) {
      break;
    }
LABEL_9:
    unint64_t v10 = v6[1];
    if (v9 + 12 > v10) {
      return 22;
    }
    unint64_t v6 = (_DWORD *)((char *)v6 + v10);
    if ((unint64_t)v6 >= v7) {
      return 2;
    }
  }
  if (a5)
  {
    --a5;
    goto LABEL_9;
  }
  if (a4)
  {
    if (*a4 && *a4 != v9) {
      return 22;
    }
    *a4 = v9;
  }
  uint64_t result = 0;
  *a3 = v8;
  return result;
}

uint64_t image3GetTagUnsignedNumber(uint64_t a1, int a2, void *a3, int a4)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t result = image3GetTagStruct(a1, a2, &v8, &v7, a4);
  if (!result)
  {
    if (v7 == 8)
    {
      uint64_t v6 = *(void *)v8;
      goto LABEL_6;
    }
    if (v7 == 4)
    {
      uint64_t v6 = *v8;
LABEL_6:
      uint64_t result = 0;
      *a3 = v6;
      return result;
    }
    return 22;
  }
  return result;
}

void __copy_helper_block_e8_32o40b(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 3);
  uint64_t v4 = *(const void **)(a2 + 40);
  _Block_object_assign((void *)(a1 + 40), v4, 7);
}

void __destroy_helper_block_e8_32o40b(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 7);
  uint64_t v2 = *(const void **)(a1 + 32);
  _Block_object_dispose(v2, 3);
}

uint64_t wait_for_io_service_matching_dict(CFTypeRef cf, unsigned int a2)
{
  unsigned int v4 = 0;
  do
  {
    CFRetain(cf);
    uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, (CFDictionaryRef)cf);
    if (MatchingService) {
      break;
    }
    unsigned int v6 = a2 - v4 >= 3 ? 3 : a2 - v4;
    CFStringRef v7 = CFCopyDescription(cf);
    char CStringPtr = CFStringGetCStringPtr(v7, 0);
    ramrod_log_msg("waiting for matching IOKit service: %s\n", v9, v10, v11, v12, v13, v14, v15, CStringPtr);
    sleep(v6);
    v4 += v6;
    CFRelease(v7);
  }
  while (v4 < a2);
  CFRelease(cf);
  return MatchingService;
}

uint64_t wait_for_io_service_matching_resource_with_timeout(const char *a1, unsigned int a2)
{
  CFMutableDictionaryRef v4 = IOServiceMatching("IOResources");
  if (!v4)
  {
    ramrod_log_msg("unable to create matching dictionary for resource '%s'\n", v5, v6, v7, v8, v9, v10, v11, (char)a1);
    return 0;
  }
  uint64_t v12 = v4;
  CFStringRef v13 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x8000100u);
  if (!v13)
  {
    ramrod_log_msg("unable to convert resource name to CFString\n", v14, v15, v16, v17, v18, v19, v20, v23);
    return 0;
  }
  CFStringRef v21 = v13;
  CFDictionarySetValue(v12, @"IOResourceMatch", v13);
  CFRelease(v21);
  return wait_for_io_service_matching_dict(v12, a2);
}

__CFDictionary *create_embedded_storage_service_query_dict(char *cStr)
{
  CFStringRef v1 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v1) {
    return 0;
  }
  CFStringRef v2 = v1;
  CFMutableStringRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFMutableDictionaryRef v4 = Mutable;
    CFDictionaryAddValue(Mutable, v2, kCFBooleanTrue);
    uint64_t v5 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v6 = v5;
    if (v5) {
      CFDictionaryAddValue(v5, @"IOPropertyMatch", v4);
    }
    CFRelease(v2);
  }
  else
  {
    uint64_t v6 = 0;
    CFMutableDictionaryRef v4 = (__CFDictionary *)v2;
  }
  CFRelease(v4);
  return v6;
}

BOOL ramrod_check_NVRAM_access()
{
  io_object_t v0 = wait_for_io_service_matching_resource_with_timeout("IONVRAM", 0);
  io_object_t v1 = v0;
  if (v0) {
    IOObjectRelease(v0);
  }
  return v1 != 0;
}

uint64_t ramrod_delete_NVRAM_variable()
{
  return 1;
}

uint64_t ramrod_copy_NVRAM_variable()
{
  return 0;
}

uint64_t image3SHA1Generate(const void *a1, CC_LONG a2, unsigned __int8 *a3)
{
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, a1, a2);
  return CC_SHA1_Final(a3, &v7);
}

uint64_t image3PKISignHash()
{
  return 0xFFFFFFFFLL;
}

int8x16_t image3SHA1Partial(const void *a1, CC_LONG a2, int8x16_t *a3)
{
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, a1, a2);
  int8x16_t result = vrev32q_s8(*(int8x16_t *)&v7.h0);
  *a3 = result;
  a3[1].i32[0] = bswap32(v7.h4);
  return result;
}

uint64_t ramrod_ticket_create_img3(CFDataRef *a1, CFErrorRef *a2)
{
  uint64_t v28 = 0;
  if (!_ticket || _ticket_is_img3 != 1) {
    return 1;
  }
  CFIndex v29 = 0;
  uint64_t v30 = 0;
  if (image3InstantiateNew(&v28, 0, 0x53434142u))
  {
    ramrod_create_error_cf(a2, @"RamrodErrorDomain", 6, 0, @"%s: unable to create img3 ticket", v4, v5, v6, (char)"ramrod_ticket_create_img3");
    uint64_t v14 = "failed to create img3\n";
LABEL_10:
    ramrod_log_msg(v14, v7, v8, v9, v10, v11, v12, v13, v27);
LABEL_11:
    uint64_t v15 = 0;
    goto LABEL_12;
  }
  uint64_t v16 = v28;
  BytePtr = (UInt8 *)CFDataGetBytePtr((CFDataRef)_ticket);
  size_t Length = CFDataGetLength((CFDataRef)_ticket);
  if (image3SetTagStructure(v16, 1145132097, BytePtr, Length, 32))
  {
    uint64_t v14 = "failed to create data tag for ticket";
    goto LABEL_10;
  }
  if (image3Finalize((uint64_t)v28, (char **)&v30, &v29, 0, 0))
  {
    ramrod_create_error_cf(a2, @"RamrodErrorDomain", 6, 0, @"%s: unable to create CFData for img3 ticket", v19, v20, v21, (char)"ramrod_ticket_create_img3");
    uint64_t v14 = "could not finalize ticket img3";
    goto LABEL_10;
  }
  CFDataRef v23 = CFDataCreate(kCFAllocatorDefault, v30, v29);
  if (!v23)
  {
    ramrod_create_error_cf(a2, @"RamrodErrorDomain", 6, 0, @"%s: unable to create CFData for img3 ticket", v24, v25, v26, (char)"ramrod_ticket_create_img3");
    goto LABEL_11;
  }
  *a1 = v23;
  uint64_t v15 = 1;
LABEL_12:
  if (v28) {
    image3Discard((uint64_t *)&v28);
  }
  return v15;
}

uint64_t ramrod_log_msg_to_fd(uint64_t a1, uint64_t a2, int __fd)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    uint64_t v7 = 0;
    while (1)
    {
      ssize_t v8 = write(__fd, (const void *)(a1 + v7), a2 - v7);
      if (v8 == -1) {
        break;
      }
      v7 += v8;
      if (v7 == a2) {
        return 0;
      }
    }
    return *__error();
  }
  return result;
}

uint64_t ramrod_remove_log_fd_no_locking(int a1)
{
  int valuePtr = a1;
  memset(&v16, 0, sizeof(v16));
  int v1 = fstat(a1, &v16);
  BOOL v2 = (__int16)v16.st_mode <= -1 && v1 == 0;
  uint64_t v3 = &log_fds;
  if (v2) {
    uint64_t v3 = &log_fds_fileonly;
  }
  uint64_t v4 = (__CFSet *)*v3;
  if (!*v3)
  {
    uint64_t v12 = __stderrp;
    uint64_t v13 = "can't remove logging fd since none were added";
    size_t v14 = 45;
LABEL_13:
    fwrite(v13, v14, 1uLL, v12);
    return 0xFFFFFFFFLL;
  }
  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (!v5)
  {
    uint64_t v12 = __stderrp;
    uint64_t v13 = "failed to convert fd to number";
    size_t v14 = 30;
    goto LABEL_13;
  }
  CFNumberRef v6 = v5;
  CFSetRemoveValue(v4, v5);
  if (close(valuePtr))
  {
    uint64_t v7 = __error();
    uint64_t v8 = *v7;
    uint64_t v9 = __stderrp;
    int v10 = valuePtr;
    uint64_t v11 = strerror(*v7);
    fprintf(v9, "failed to close file descriptor '%d', error:%s", v10, v11);
  }
  else
  {
    uint64_t v8 = 0;
  }
  CFRelease(v6);
  return v8;
}

uint64_t ramrod_log_msg_to_all_fds(uint64_t a1, uint64_t a2)
{
  long long context = 0u;
  *(_OWORD *)theArray = 0u;
  int valuePtr = -1;
  pthread_mutex_lock(&log_fds_mutex);
  if (a1 && __PAIR128__(log_fds, log_fds_fileonly) != 0)
  {
    *(void *)&long long context = a1;
    *((void *)&context + 1) = a2;
    theArray[0] = 0;
    LOBYTE(theArray[1]) = 0;
    if (log_fds) {
      CFSetApplyFunction((CFSetRef)log_fds, (CFSetApplierFunction)ramrod_log_to_fd_set_applier, &context);
    }
    ramrod_log_msg_to_all_fds_bytes_to_sync += a2;
    if (ramrod_log_msg_to_all_fds_bytes_to_sync)
    {
      LOBYTE(theArray[1]) = 1;
      ramrod_log_msg_to_all_fds_bytes_to_sync = 0;
    }
    if (log_fds_fileonly) {
      CFSetApplyFunction((CFSetRef)log_fds_fileonly, (CFSetApplierFunction)ramrod_log_to_fd_set_applier, &context);
    }
    if (theArray[0])
    {
      CFIndex Count = CFArrayGetCount(theArray[0]);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        for (CFIndex i = 0; i != v5; ++i)
        {
          CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray[0], i);
          if (CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr)) {
            ramrod_remove_log_fd_no_locking(valuePtr);
          }
          else {
            fwrite("Failed to convert CFNumberRef into int value\n", 0x2DuLL, 1uLL, __stderrp);
          }
        }
      }
      CFRelease(theArray[0]);
    }
  }
  pthread_mutex_unlock(&log_fds_mutex);
  return 0;
}

void ramrod_log_to_fd_set_applier(const void *a1, uint64_t a2)
{
  int valuePtr = -1;
  if (a1)
  {
    if (a2)
    {
      if (*(void *)a2)
      {
        if (CFNumberGetValue((CFNumberRef)a1, kCFNumberIntType, &valuePtr))
        {
          if (ramrod_log_msg_to_fd(*(void *)a2, *(void *)(a2 + 8), valuePtr))
          {
            fprintf(__stderrp, "Removing file descriptor %d since it failed to be written to.\n", valuePtr);
            CFMutableStringRef Mutable = *(__CFArray **)(a2 + 16);
            if (!Mutable)
            {
              CFMutableStringRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
              *(void *)(a2 + 16) = Mutable;
            }
            CFArrayAppendValue(Mutable, a1);
          }
          else if (*(unsigned char *)(a2 + 24))
          {
            fsync(valuePtr);
          }
        }
        else
        {
          fwrite("Failed to convert num to int\n", 0x1DuLL, 1uLL, __stderrp);
        }
      }
      return;
    }
    CFIndex v5 = __stderrp;
    CFNumberRef v6 = "Missing logging context.\n";
    size_t v7 = 25;
  }
  else
  {
    CFIndex v5 = __stderrp;
    CFNumberRef v6 = "NULL fd num in fd set, weird.\n";
    size_t v7 = 30;
  }
  fwrite(v6, v7, 1uLL, v5);
}

void *ramrod_log_set_handler(void *result)
{
  _log_handler = result;
  return result;
}

void ramrod_log_msg(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void ramrod_log_msg_cf(CFStringRef format, ...)
{
  va_start(va, format);
  CFStringRef v1 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, format, va);
  if (!v1)
  {
    ramrod_log_msg("(Failed to format log message)\n", v2, v3, v4, v5, v6, v7, v8, v30);
    return;
  }
  CFStringRef v9 = v1;
  char CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
  if (CStringPtr)
  {
    char v30 = (char)CStringPtr;
    uint64_t v18 = "%s";
  }
  else
  {
    CFIndex Length = CFStringGetLength(v9);
    CFIndex v20 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    uint64_t v21 = (char *)malloc(v20);
    if (v21)
    {
      uint64_t v22 = v21;
      if (CFStringGetCString(v9, v21, v20, 0x8000100u)) {
        ramrod_log_msg("%s", v23, v24, v25, v26, v27, v28, v29, (char)v22);
      }
      else {
        ramrod_log_msg("(Failed to alloc and convert log message)\n", v23, v24, v25, v26, v27, v28, v29, v30);
      }
      free(v22);
      goto LABEL_12;
    }
    uint64_t v18 = "(Failed to alloc and convert log message)\n";
  }
  ramrod_log_msg(v18, v11, v12, v13, v14, v15, v16, v17, v30);
LABEL_12:
  CFRelease(v9);
}

void do_ramrod_log_msg(int a1, const char *a2, va_list a3)
{
  __s = 0;
  if (vasprintf(&__s, a2, a3) != -1)
  {
    pthread_mutex_lock(&log_mutex);
    if (a1 == 1)
    {
      fputs(__s, __stdoutp);
      if (_log_handler) {
        _log_handler(__s);
      }
    }
    size_t v4 = strlen(__s);
    ramrod_log_msg_to_all_fds((uint64_t)__s, v4);
    if (!_log_buffermsgs) {
      goto LABEL_23;
    }
    uint64_t v5 = (char *)log_buffer;
    if (!log_buffer)
    {
      uint64_t v5 = (char *)malloc(0x100000uLL);
      log_buffer = (uint64_t)v5;
      if (!v5)
      {
        fprintf(__stderrp, "unable to allocate %lu bytes for log buffer\n", 0x100000);
LABEL_23:
        pthread_mutex_unlock(&log_mutex);
        goto LABEL_24;
      }
      log_buffer_head = (uint64_t)v5;
      log_buffer_tail = (uint64_t)v5;
    }
    char v6 = *__s;
    if (*__s)
    {
      uint64_t v7 = v5 + 0x100000;
      uint64_t v8 = (char *)log_buffer_tail;
      uint64_t v9 = log_buffer_head;
      int v10 = __s + 1;
      do
      {
        *uint64_t v8 = v6;
        if (v8 + 1 == v7) {
          uint64_t v8 = v5;
        }
        else {
          ++v8;
        }
        log_buffer_tail = (uint64_t)v8;
        if ((char *)v9 == v8)
        {
          if (v8 + 1 == v7) {
            uint64_t v9 = (uint64_t)v5;
          }
          else {
            uint64_t v9 = (uint64_t)(v8 + 1);
          }
          log_buffer_head = v9;
        }
        int v11 = *v10++;
        char v6 = v11;
      }
      while (v11);
    }
    goto LABEL_23;
  }
  fwrite("unable to allocate storage for log message\n", 0x2BuLL, 1uLL, __stderrp);
LABEL_24:
  free(__s);
}

CFStringRef checkpoint_nvram_encode_unknown()
{
  return CFStringCreateWithFormat(0, 0, @"UNKNOWN");
}

CFStringRef checkpoint_nvram_encode_string(uint64_t a1, const char **a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = *a2;
  if (!*a2) {
    return 0;
  }
  size_t v3 = strlen(*a2);
  if (v3 > 0x100) {
    return CFStringCreateWithFormat(0, 0, @"~%s", &v2[v3 - 255]);
  }
  else {
    return CFStringCreateWithFormat(0, 0, @"%s", v2);
  }
}

CFStringRef checkpoint_nvram_encode_id_string(uint64_t a1, unsigned int *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = *((void *)a2 + 1);
  if (!v3) {
    return 0;
  }
  size_t v4 = strlen(*((const char **)a2 + 1));
  if (v4 > 0xF2) {
    return CFStringCreateWithFormat(0, 0, @"{0x%08X:\"~%s\"}", *a2, v4 + v3 - 241);
  }
  else {
    return CFStringCreateWithFormat(0, 0, @"{0x%08X:\"%s\"}", *a2, v3);
  }
}

CFStringRef checkpoint_nvram_encode_long(uint64_t a1, void *a2)
{
  if (a2) {
    return CFStringCreateWithFormat(0, 0, @"%ld", *a2);
  }
  else {
    return 0;
  }
}

CFStringRef checkpoint_nvram_encode_by_boot(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    uint64_t v16 = 0;
    asprintf(&v16, "{");
    uint64_t v8 = v16;
    if (v16)
    {
      uint64_t v9 = 0;
      int v15 = 0;
      char v10 = 1;
      do
      {
        char v11 = v10;
        uint64_t v12 = (const char *)*((void *)&v2->isa + v9);
        if (v12)
        {
          uint64_t v8 = checkpoint_append_and_free_key_v(v8, checkpoint_boot_type_name[v9], v12, &v15);
          uint64_t v16 = v8;
        }
        char v10 = 0;
        uint64_t v9 = 1;
      }
      while ((v11 & 1) != 0);
      uint64_t v16 = checkpoint_append_and_free(v8, "}", (uint64_t)v12, v3, v4, v5, v6, v7, v14);
      CFStringRef v2 = CFStringCreateWithFormat(0, 0, @"%s", v16);
      if (v16) {
        free(v16);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

CFStringRef checkpoint_nvram_encode_by_id(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    char v14 = 0;
    asprintf(&v14, "{");
    uint64_t v8 = v14;
    if (v14)
    {
      uint64_t v9 = 0;
      int v13 = 0;
      do
      {
        char v10 = *(const char **)((char *)&v2->info + v9);
        if (v10)
        {
          uint64_t v8 = checkpoint_append_and_free_id_v(v8, *(_DWORD *)((char *)&v2->isa + v9), v10, &v13);
          char v14 = v8;
        }
        v9 += 16;
      }
      while (v9 != 128);
      char v14 = checkpoint_append_and_free(v8, "}", (uint64_t)v10, v3, v4, v5, v6, v7, v12);
      CFStringRef v2 = CFStringCreateWithFormat(0, 0, @"%s", v14);
      if (v14) {
        free(v14);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

CFStringRef checkpoint_nvram_encode_by_id_int(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    char v14 = 0;
    asprintf(&v14, "{");
    if (v14)
    {
      uint64_t v9 = 0;
      int v13 = 0;
      do
      {
        if (*(_DWORD *)((char *)&v2->isa + v9))
        {
          char v12 = 0;
          asprintf(&v12, "%d", *(_DWORD *)((char *)&v2->isa + v9 + 4));
          uint64_t v3 = v12;
          if (v12)
          {
            char v14 = checkpoint_append_and_free_id_v(v14, *(_DWORD *)((char *)&v2->isa + v9), v12, &v13);
            if (v12) {
              free(v12);
            }
          }
        }
        v9 += 8;
      }
      while (v9 != 64);
      char v14 = checkpoint_append_and_free(v14, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v11);
      CFStringRef v2 = CFStringCreateWithFormat(0, 0, @"%s", v14);
      if (v14) {
        free(v14);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

CFStringRef checkpoint_nvram_encode_by_id_try(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    uint64_t v19 = 0;
    asprintf(&v19, "{");
    if (v19)
    {
      uint64_t v9 = 0;
      int v18 = 0;
      p_info = &v2->info;
      do
      {
        char v11 = (int *)v2 + 18 * v9;
        if (*v11)
        {
          uint64_t v22 = 0;
          asprintf(&v22, "{");
          if (v22)
          {
            uint64_t v12 = 0;
            int v21 = 0;
            do
            {
              int v13 = (const char *)p_info[v12];
              if (v13)
              {
                CFIndex v20 = 0;
                asprintf(&v20, "\"%s\"", v13);
                uint64_t v3 = v20;
                if (v20)
                {
                  uint64_t v22 = checkpoint_append_and_free_try_v(v22, v12, v20, &v21);
                  if (v20) {
                    free(v20);
                  }
                }
              }
              ++v12;
            }
            while (v12 != 8);
            char v14 = checkpoint_append_and_free(v22, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v17);
            if (v14)
            {
              int v15 = v14;
              uint64_t v19 = checkpoint_append_and_free_id_v(v19, *v11, v14, &v18);
              free(v15);
            }
          }
        }
        ++v9;
        p_info += 9;
      }
      while (v9 != 8);
      uint64_t v19 = checkpoint_append_and_free(v19, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v17);
      CFStringRef v2 = CFStringCreateWithFormat(0, 0, @"%s", v19);
      if (v19) {
        free(v19);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

CFStringRef checkpoint_nvram_encode_by_id_try_int(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    int v18 = 0;
    asprintf(&v18, "{");
    if (v18)
    {
      uint64_t v9 = 0;
      int v17 = 0;
      CFStringRef v10 = v2;
      do
      {
        char v11 = (int *)v2 + 11 * v9;
        if (*v11)
        {
          int v21 = 0;
          asprintf(&v21, "{");
          if (v21)
          {
            uint64_t v12 = 0;
            int v20 = 0;
            do
            {
              if (*((unsigned char *)&v10[1].isa + v12 + 4))
              {
                uint64_t v19 = 0;
                asprintf(&v19, "%d", *((_DWORD *)&v10->isa + v12 + 1));
                uint64_t v3 = v19;
                if (v19)
                {
                  int v21 = checkpoint_append_and_free_try_v(v21, v12, v19, &v20);
                  if (v19) {
                    free(v19);
                  }
                }
              }
              ++v12;
            }
            while (v12 != 8);
            int v13 = checkpoint_append_and_free(v21, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v16);
            if (v13)
            {
              char v14 = v13;
              int v18 = checkpoint_append_and_free_id_v(v18, *v11, v13, &v17);
              free(v14);
            }
          }
        }
        ++v9;
        CFStringRef v10 = (CFStringRef)((char *)v10 + 44);
      }
      while (v9 != 8);
      int v18 = checkpoint_append_and_free(v18, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v16);
      CFStringRef v2 = CFStringCreateWithFormat(0, 0, @"%s", v18);
      if (v18) {
        free(v18);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t checkpoint_nvram_is_available(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  int v10 = *(_DWORD *)(a1 + 664);
  if (!v10) {
    goto LABEL_160;
  }
  if (v10 == 1)
  {
    uint64_t v11 = 1;
    goto LABEL_20;
  }
  uint64_t v11 = 0;
  if (a2)
  {
    if (v10 == 2)
    {
LABEL_160:
      if (ramrod_check_NVRAM_access())
      {
        if (*(unsigned char *)(a1 + 2272))
        {
          if (!*(unsigned char *)(a1 + 2273))
          {
LABEL_24:
            int v17 = *(_DWORD *)(a1 + 664);
            if (*(unsigned char *)(a1 + 669))
            {
LABEL_149:
              uint64_t v11 = 1;
              *(_DWORD *)(a1 + 664) = 1;
              if (!v8)
              {
                if (v17) {
                  checkpoint_history_add(a1, 2, 1, 0, 256, "NVRAM access has become available", 0, 0, 0);
                }
                else {
                  checkpoint_history_add(a1, 2, 1, 0, 256, "NVRAM access available on initial check", 0, 0, 0);
                }
              }
              goto LABEL_20;
            }
            BOOL v18 = *(_DWORD *)a1 == 1 && v17 == 2;
            uint64_t v19 = 8;
            if (v18) {
              uint64_t v19 = 400;
            }
            uint64_t v20 = a1 + v19;
            int v21 = (void *)(v20 + 664);
            if (*(unsigned char *)(v20 + 668)) {
              ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): first available indication when already collected\n", v12, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_handle_first_available");
            }
            else {
              checkpoint_nvram_collect((int *)a1, (uint64_t)v21, a3, a4, a5, a6, a7, a8);
            }
            if (*(_DWORD *)a1 == 1)
            {
              int v29 = *(_DWORD *)(a1 + 88);
              if (*(_DWORD *)(a1 + 96))
              {
                if (v29 == 2) {
                  uint64_t v39 = (unsigned int *)&checkpoint_nvram_ota_monitor_aware_awoken;
                }
                else {
                  uint64_t v39 = (unsigned int *)&checkpoint_nvram_restore_monitor_aware_awoken;
                }
              }
              else
              {
                if (v29 == 2)
                {
                  int v31 = checkpoint_nvram_check_collection(a1, (uint64_t)v21, checkpoint_nvram_ota_monitor_aware_init, v24, v25, v26, v27, v28);
                  checkpoint_nvram_delete_var_if_matches(a1, (uint64_t)v21);
                  goto LABEL_53;
                }
                uint64_t v39 = (unsigned int *)&checkpoint_nvram_restore_monitor_aware_init;
              }
              int v31 = checkpoint_nvram_check_collection(a1, (uint64_t)v21, v39, v24, v25, v26, v27, v28);
LABEL_53:
              uint64_t v43 = v21[6];
              if (!v43)
              {
LABEL_110:
                if (!v43 && v31 && !*(unsigned char *)(a1 + 106) && !*(unsigned char *)(a1 + 100) && !*(unsigned char *)(a1 + 104)) {
                  checkpoint_nvram_store_anomaly(a1, v32, "[monitor_aware]pre-existing NVRAM implied reboot-retry but values were inconsistent");
                }
LABEL_116:
                if (*(unsigned char *)(a1 + 104))
                {
                  if (v17 == 2)
                  {
                    uint64_t v73 = 0;
                    uint64_t v74 = (void *)(a1 + 1496);
                    uint64_t v75 = &dword_100059D10;
LABEL_119:
                    uint64_t v76 = *v75;
                    if (v73 != v76)
                    {
                      uint64_t v77 = a1 + 16 * (int)v76;
                      *(unsigned char *)(v77 + 1492) = *((unsigned char *)v74 - 4);
                      *((unsigned char *)v74 - 4) = 0;
                      uint64_t v78 = *v74;
                      *uint64_t v74 = *(void *)(v77 + 1496);
                      *(void *)(v77 + 1496) = v78;
                    }
                    while (v73 != 47)
                    {
                      v74 += 2;
                      v75 += 8;
                      ++v73;
                      if (*(unsigned char *)(a1 + 104)) {
                        goto LABEL_119;
                      }
                    }
                  }
                }
                else if (*(_DWORD *)a1 != 1 && *(_DWORD *)(a1 + 88) == 2)
                {
                  ramrod_log_msg("%s\n", v32, v33, v34, v35, v36, v37, v38, (char)"void clear_stale_ota_nvram(void)");
                  checkpoint_nvram_delete_var_raw(@"boot-breadcrumbs");
                  checkpoint_nvram_delete_var_raw(@"OTA-pre-conversion");
                  checkpoint_nvram_delete_var_raw(@"OTA-post-conversion");
                  checkpoint_nvram_delete_var_raw(@"ota-conv-panic-indicator");
                  checkpoint_nvram_delete_var_raw(@"OTA-fsck-metrics");
                  checkpoint_nvram_delete_var_raw(@"OTA-sealvolume-metrics");
                  checkpoint_nvram_delete_var_raw(@"OTA-migrator-metrics");
                  for (uint64_t i = 0; i != 28; ++i)
                  {
                    uint64_t v80 = (const __CFString **)&checkpoint_nvram_map[4 * dword_100050894[i]];
                    checkpoint_nvram_delete_var_raw(v80[1]);
                    checkpoint_nvram_delete_var_raw(*v80);
                  }
                }
                if (*(_DWORD *)(a1 + 96))
                {
                  if (*(unsigned char *)(a1 + 101))
                  {
                    if (*(unsigned char *)(a1 + 104))
                    {
                      if (*(unsigned char *)(a1 + 106))
                      {
                        unsigned int v81 = 9;
                      }
                      else if (*(unsigned char *)(a1 + 105))
                      {
                        unsigned int v81 = 12;
                      }
                      else if (*(unsigned char *)(a1 + 100))
                      {
                        unsigned int v81 = 10;
                      }
                      else
                      {
                        unsigned int v81 = 11;
                      }
                    }
                    else if (*(unsigned char *)(a1 + 103))
                    {
                      unsigned int v81 = 10;
                    }
                    else
                    {
                      unsigned int v81 = 3;
                    }
                  }
                  else if (*(unsigned char *)(a1 + 102))
                  {
                    if (*(unsigned char *)(a1 + 104)) {
                      unsigned int v81 = 7;
                    }
                    else {
                      unsigned int v81 = 6;
                    }
                  }
                  else
                  {
                    unsigned int v81 = 2;
                  }
                  checkpoint_outcome_progress(a1, v81, v33, v34, v35, v36, v37, v38);
                }
                else
                {
                  checkpoint_outcome_init(a1, 1, v33, v34, v35, v36, v37, v38);
                }
                *(unsigned char *)(a1 + 669) = 1;
                goto LABEL_149;
              }
              unsigned int outcome_type = checkpoint_get_outcome_type(a1, (uint64_t)v21, v33, v34, v35, v36, v37, v38);
              if (outcome_type < 0x22)
              {
                uint64_t v52 = &checkpoint_outcome_attributes[3 * outcome_type];
              }
              else
              {
                ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid outcome=%d\n", v45, v46, v47, v48, v49, v50, v51, (char)"checkpoint_get_outcome_attributes");
                uint64_t v52 = checkpoint_outcome_attributes;
              }
              CFStringRef v53 = (const __CFString *)v21[6];
              bzero(v83, 0x400uLL);
              if (*v52 == 2)
              {
                int v54 = *((unsigned __int8 *)v52 + 8);
                if (*((unsigned char *)v52 + 8)) {
                  *(unsigned char *)(a1 + 106) = 1;
                }
                if (*((unsigned char *)v52 + 7))
                {
                  int v31 = 0;
                  *(unsigned char *)(a1 + 102) = 1;
                }
                if (!*((unsigned char *)v52 + 5))
                {
                  if (!*((unsigned char *)v52 + 4) || !*((unsigned char *)v52 + 6))
                  {
                    LODWORD(v43) = 0;
                    goto LABEL_110;
                  }
                  if (v54)
                  {
                    LODWORD(v43) = 0;
                    *(unsigned char *)(a1 + 101) = 1;
                    goto LABEL_110;
                  }
                  uint64_t v43 = v21[8];
                  if (!v43) {
                    goto LABEL_110;
                  }
LABEL_98:
                  CFStringRef v69 = (const __CFString *)v21[7];
                  *(unsigned char *)(a1 + 101) = 1;
                  if (v69 && CFEqual(v69, @"true"))
                  {
                    *(unsigned char *)(a1 + 100) = 1;
                    LODWORD(v43) = *((unsigned __int8 *)v52 + 5);
                    if (!*((unsigned char *)v52 + 5))
                    {
                      *(unsigned char *)(a1 + 103) = 1;
                      goto LABEL_110;
                    }
                    LODWORD(v43) = 0;
                    goto LABEL_65;
                  }
                  goto LABEL_100;
                }
                if (v54)
                {
                  LODWORD(v43) = 0;
                  *(unsigned char *)(a1 + 101) = 1;
LABEL_65:
                  *(_WORD *)(a1 + 104) = 257;
                  goto LABEL_110;
                }
                uint64_t v43 = v21[8];
                if (v43) {
                  goto LABEL_98;
                }
              }
              else
              {
                LODWORD(v43) = *((unsigned __int8 *)v52 + 5);
                if (!*((unsigned char *)v52 + 5)) {
                  goto LABEL_110;
                }
                if (!v21[8])
                {
                  checkpoint_get_nvram_value_string(v53, v83);
                  checkpoint_nvram_store_anomaly(a1, v71, "[monitor_aware]outcome=%s(reboot_retry_not_in_zone)");
                  goto LABEL_102;
                }
                CFStringRef v55 = (const __CFString *)v21[7];
                if (!v55 || CFStringCompare(v55, @"true", 0))
                {
LABEL_100:
                  checkpoint_get_nvram_value_string(v53, v83);
                  checkpoint_nvram_store_anomaly(a1, v70, "[monitor_aware]outcome=%s(reboot_retry_disabled)");
LABEL_102:
                  LODWORD(v43) = 1;
                  goto LABEL_110;
                }
                LODWORD(v43) = 0;
              }
              *(unsigned char *)(a1 + 104) = 1;
              goto LABEL_110;
            }
            CFStringRef v30 = (const __CFString *)v21[7];
            if (v30 && CFEqual(v30, @"true")) {
              *(unsigned char *)(a1 + 100) = 1;
            }
            else {
              ramrod_log_msg("AP nonce will not be touched\n", v22, v23, v24, v25, v26, v27, v28, v82);
            }
            int v40 = *(_DWORD *)(a1 + 88);
            if (*(_DWORD *)(a1 + 96))
            {
              if (v40 == 2)
              {
                int v41 = checkpoint_nvram_check_collection(a1, (uint64_t)v21, checkpoint_nvram_ota_engine_aware_step, v24, v25, v26, v27, v28);
                checkpoint_nvram_delete_var_if_matches(a1, (uint64_t)v21);
                goto LABEL_72;
              }
              uint64_t v42 = (unsigned int *)&checkpoint_nvram_restore_engine_aware_step;
            }
            else if (v40 == 2)
            {
              uint64_t v42 = (unsigned int *)&checkpoint_nvram_ota_engine_aware_init;
            }
            else
            {
              uint64_t v42 = (unsigned int *)&checkpoint_nvram_restore_engine_aware_init;
            }
            int v41 = checkpoint_nvram_check_collection(a1, (uint64_t)v21, v42, v24, v25, v26, v27, v28);
LABEL_72:
            if (!v21[6])
            {
              *(unsigned char *)(a1 + 1456) = 1;
              *(void *)(a1 + 1464) = "access now enabled";
              if (*(_DWORD *)(a1 + 88) == 2)
              {
                if (v21[8]) {
                  checkpoint_nvram_delete_var(a1, 7, 0, 0, v35, v36, v37, v38);
                }
                CFStringRef v65 = (const __CFString *)v21[3];
                if (v65 && CFStringCompare(v65, @"recover", 0)) {
                  checkpoint_nvram_delete_var(a1, 2, 1, 0, v35, v36, v37, v38);
                }
                if (v21[4]) {
                  checkpoint_nvram_delete_var(a1, 3, 1, 0, v35, v36, v37, v38);
                }
              }
              goto LABEL_105;
            }
            unsigned int v56 = checkpoint_get_outcome_type(a1, (uint64_t)v21, v33, v34, v35, v36, v37, v38);
            if (v56 < 0x22)
            {
              uint64_t v64 = &checkpoint_outcome_attributes[3 * v56];
            }
            else
            {
              ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid outcome=%d\n", v57, v58, v59, v60, v61, v62, v63, (char)"checkpoint_get_outcome_attributes");
              uint64_t v64 = checkpoint_outcome_attributes;
            }
            CFStringRef v66 = (const __CFString *)v21[6];
            bzero(v83, 0x400uLL);
            if (*v64 != 1)
            {
              if (*((unsigned char *)v64 + 6))
              {
                if (v21[8])
                {
                  checkpoint_reboot_retry_chassis_aware((unsigned char *)a1, v66, v33, v34, v35, v36, v37, v38, v82);
                }
                else
                {
                  checkpoint_get_nvram_value_string(v66, v83);
                  checkpoint_nvram_store_anomaly(a1, v72, "[chassis_aware]outcome=%s(pre_existing_reboot_retry_not_in_zone)", v83);
                }
              }
              *(unsigned char *)(a1 + 1456) = 1;
              *(void *)(a1 + 1464) = "access now enabled";
              goto LABEL_105;
            }
            uint64_t v67 = v21[8];
            if (*((unsigned char *)v64 + 5))
            {
              if (!v67)
              {
                checkpoint_get_nvram_value_string(v66, v83);
                checkpoint_nvram_store_anomaly(a1, v68, "[chassis_aware]outcome=%s(pre_existing_reboot_retry_not_in_zone)", v83);
LABEL_105:
                if (v41 && !*(unsigned char *)(a1 + 104)) {
                  checkpoint_nvram_store_anomaly(a1, v32, "[chassis_aware]pre-existing NVRAM implied reboot-retry but values were inconsistent");
                }
                goto LABEL_116;
              }
            }
            else if (!v67)
            {
              goto LABEL_105;
            }
            checkpoint_reboot_retry_chassis_aware((unsigned char *)a1, v66, v33, v34, v35, v36, v37, v38, v82);
            goto LABEL_105;
          }
        }
        else
        {
          checkpoint_nvram_collect_var(a1, 1u, 0x2Fu, (const __CFString **)(a1 + 1056));
          if (!*(void *)(a1 + 1056))
          {
            *(unsigned char *)(a1 + 2272) = 1;
            goto LABEL_24;
          }
          if (*(_DWORD *)a1 == 2) {
            checkpoint_nvram_delete_var(a1, 47, 0, 0, a5, a6, a7, a8);
          }
          *(unsigned char *)(a1 + 2273) = 1;
          *(unsigned char *)(a1 + 668) = 0;
          int v13 = (const __CFString **)(a1 + 992);
          uint64_t v14 = -4;
          do
            checkpoint_nvram_collect_var(a1, 1u, v14 + 43, v13++);
          while (!__CFADD__(v14++, 1));
          *(unsigned char *)(a1 + 2272) = 1;
        }
      }
      *(_DWORD *)(a1 + 664) = 2;
      if (!v8) {
        checkpoint_history_add(a1, 2, 1, 0, 256, "NVRAM access is not currently available", 0, 0, 0);
      }
      uint64_t v11 = 0;
    }
  }
LABEL_20:
  if (!*(_DWORD *)(a1 + 96)) {
    checkpoint_outcome_init(a1, v11, a3, a4, a5, a6, a7, a8);
  }
  return v11;
}

void *checkpoint_history_add(uint64_t a1, int a2, int a3, int a4, int a5, const char *a6, int a7, int a8, const void *a9)
{
  int v17 = calloc(1uLL, 0x78uLL);
  if (!v17) {
    return v17;
  }
  uint64_t v130 = 0;
  asprintf(&v130, "%s", a6);
  if (!v130)
  {
    free(v17);
    return 0;
  }
  *((_DWORD *)v17 + 2) = a2;
  v17[2] = time(0);
  gettimeofday((timeval *)(v17 + 3), 0);
  *((_DWORD *)v17 + 10) = getpid();
  *((_DWORD *)v17 + 11) = getppid();
  *((_DWORD *)v17 + 12) = a3;
  *((_DWORD *)v17 + 13) = a4;
  *((_DWORD *)v17 + 14) = a5;
  v17[8] = v130;
  *((_DWORD *)v17 + 18) = a7;
  *((_DWORD *)v17 + 19) = a8;
  if (a9)
  {
    v17[10] = a9;
    CFRetain(a9);
    a5 = *((_DWORD *)v17 + 14);
  }
  *((_DWORD *)v17 + 22) = a5 | (*((_DWORD *)v17 + 2) << 16) | 0x11000000;
  *(void *)uint64_t v134 = 0x1500000001;
  v131[0] = 0;
  v131[1] = 0;
  size_t v132 = 16;
  if (sysctl(v134, 2u, v131, &v132, 0, 0)) {
    uint64_t v25 = -1;
  }
  else {
    uint64_t v25 = v17[2] - (unint64_t)v131[0];
  }
  int v26 = *((_DWORD *)v17 + 2);
  switch(v26)
  {
    case 1:
      checkpoint_nvram_store_by_id(a1, 10, *((unsigned int *)v17 + 22), (const char *)v17[8], v21, v22, v23, v24);
      goto LABEL_69;
    case 2:
      goto LABEL_69;
    case 3:
      if (!*((_DWORD *)v17 + 18))
      {
        uint64_t v38 = 23;
        if (!*(unsigned char *)(a1 + 104)) {
          uint64_t v38 = 11;
        }
        int v39 = *(_DWORD *)(a1 + 1472) + 1;
        *(_DWORD *)(a1 + 1472) = v39;
        uint64_t v40 = *((unsigned int *)v17 + 22);
        int v41 = *(int **)(a1 + 16 * v38 + 1496);
        if (!v41) {
          goto LABEL_28;
        }
        unint64_t v42 = 0;
        do
        {
          int v44 = *v41;
          v41 += 2;
          int v43 = v44;
          if (v42 > 6) {
            break;
          }
          ++v42;
        }
        while (v43);
        if (!v43)
        {
          *(v41 - 2) = v40;
          *(v41 - 1) = v39;
          *(unsigned char *)(a1 + 16 * v38 + 1492) = 1;
        }
        else
        {
LABEL_28:
          int v45 = *(_DWORD *)(a1 + 1476);
          if (!v45)
          {
            ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", v18, v40, v20, v21, v22, v23, v24, (char)"checkpoint_nvram_store_lost");
            int v45 = *(_DWORD *)(a1 + 1476);
            uint64_t v40 = *((unsigned int *)v17 + 22);
          }
          *(_DWORD *)(a1 + 1476) = v45 + 1;
        }
        checkpoint_nvram_store_by_id(a1, 12, v40, (const char *)v17[8], v21, v22, v23, v24);
      }
      goto LABEL_68;
    case 4:
    case 7:
      goto LABEL_15;
    case 5:
      goto LABEL_13;
    case 6:
      checkpoint_nvram_store_by_id_try(a1, 14, *((unsigned int *)v17 + 22), *((unsigned int *)v17 + 18), (const char *)v17[8], v22, v23, v24);
      goto LABEL_69;
    default:
      if (v26 == 32)
      {
LABEL_15:
        checkpoint_nvram_store_by_id_try_int(a1, 13, *((_DWORD *)v17 + 14) | 0x11070000u, *((unsigned int *)v17 + 18), *((unsigned int *)v17 + 19), v22, v23, v24);
        uint64_t v28 = (__CFError *)v17[10];
        if (v28)
        {
          CFIndex Code = CFErrorGetCode(v28);
          CFStringRef Domain = CFErrorGetDomain((CFErrorRef)v17[10]);
          int v31 = checkpoint_cferror_alloc_string((CFErrorRef)v17[10]);
          checkpoint_nvram_store_by_id_try_int(a1, 15, *((unsigned int *)v17 + 22), *((unsigned int *)v17 + 18), Code, v32, v33, v34);
          if (Domain)
          {
            bzero(buffer, 0x400uLL);
            CFStringGetCString(Domain, (char *)buffer, 1024, 0x8000100u);
            checkpoint_nvram_store_by_id_try(a1, 16, *((unsigned int *)v17 + 22), *((unsigned int *)v17 + 18), (const char *)buffer, v35, v36, v37);
          }
          if (v31)
          {
            checkpoint_nvram_store_by_id(a1, 17, *((unsigned int *)v17 + 22), v31, v21, v22, v23, v24);
            free(v31);
          }
        }
        goto LABEL_68;
      }
      if (v26 != 33) {
        goto LABEL_69;
      }
LABEL_13:
      uint64_t v20 = *((unsigned int *)v17 + 18);
      int v27 = *((_DWORD *)v17 + 14);
      if (v20)
      {
        checkpoint_nvram_store_by_id_try_int(a1, 13, v27 | 0x11070000u, v20, 0, v22, v23, v24);
        goto LABEL_68;
      }
      uint64_t v46 = 23;
      if (!*(unsigned char *)(a1 + 104)) {
        uint64_t v46 = 11;
      }
      uint64_t v47 = a1 + 16 * v46;
      uint64_t v48 = *(void **)(v47 + 1496);
      if (!v48) {
        goto LABEL_45;
      }
      int v49 = v27 | 0x11030000;
      if (*(_DWORD *)v48 == v49)
      {
        uint64_t v50 = 0;
        *uint64_t v48 = 0;
LABEL_37:
        uint64_t v51 = v50;
        do
        {
          v48[v51] = v48[v51 + 1];
          ++v51;
        }
        while (v51 != 7);
        goto LABEL_39;
      }
      uint64_t v52 = v48 + 1;
      unint64_t v53 = -1;
      while (v53 != 6)
      {
        int v54 = *v52;
        v52 += 2;
        ++v53;
        if (v54 == v49)
        {
          *((void *)v52 - 1) = 0;
          if (v53 <= 5)
          {
            uint64_t v50 = v53 + 1;
            goto LABEL_37;
          }
LABEL_39:
          v48[7] = 0;
          *(unsigned char *)(v47 + 1492) = 1;
          goto LABEL_48;
        }
      }
LABEL_45:
      int v55 = *(_DWORD *)(a1 + 1480);
      if (!v55)
      {
        ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on remove [%s]\n", v18, v19, v20, v21, v22, v23, v24, (char)"checkpoint_nvram_remove_lost");
        int v55 = *(_DWORD *)(a1 + 1480);
      }
      *(_DWORD *)(a1 + 1480) = v55 + 1;
LABEL_48:
      uint64_t v56 = 24;
      if (!*(unsigned char *)(a1 + 104)) {
        uint64_t v56 = 12;
      }
      if (((0x1001100uLL >> v56) & 1) == 0) {
        goto LABEL_63;
      }
      uint64_t v57 = a1 + 16 * v56;
      uint64_t v58 = *(void *)(v57 + 1496);
      if (!v58) {
        goto LABEL_63;
      }
      int v59 = *((_DWORD *)v17 + 14) | 0x11030000;
      if (*(_DWORD *)v58 == v59)
      {
        unint64_t v60 = 0;
LABEL_57:
        uint64_t v63 = (void *)(v58 + 16 * v60);
        uint64_t v64 = (void *)v63[1];
        if (v64) {
          free(v64);
        }
        *uint64_t v63 = 0;
        v63[1] = 0;
        if (v60 <= 6)
        {
          uint64_t v65 = 16 * v60;
          do
          {
            *(_OWORD *)(v58 + v65) = *(_OWORD *)(v58 + v65 + 16);
            v65 += 16;
          }
          while (v65 != 112);
        }
        *(void *)(v58 + 112) = 0;
        *(void *)(v58 + 120) = 0;
        *(unsigned char *)(v57 + 1492) = 1;
      }
      else
      {
        unint64_t v60 = 0;
        uint64_t v61 = (int *)(v58 + 16);
        while (v60 != 7)
        {
          ++v60;
          int v62 = *v61;
          v61 += 4;
          if (v62 == v59) {
            goto LABEL_57;
          }
        }
LABEL_63:
        int v66 = *(_DWORD *)(a1 + 1480);
        if (!v66)
        {
          ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on remove [%s]\n", v18, v19, v20, v21, v22, v23, v24, (char)"checkpoint_nvram_remove_lost");
          int v66 = *(_DWORD *)(a1 + 1480);
        }
        *(_DWORD *)(a1 + 1480) = v66 + 1;
      }
LABEL_68:
      checkpoint_nvram_store_long(a1, 18, v25, v20, v21, v22, v23, v24);
      checkpoint_nvram_store_long(a1, 21, (uint64_t)*((double *)v17 + 14), v67, v68, v69, v70, v71);
LABEL_69:
      *int v17 = 0;
      **(void **)(a1 + 192) = v17;
      *(void *)(a1 + 192) = v17;
      unsigned int v72 = *(_DWORD *)(a1 + 200) + 1;
      *(_DWORD *)(a1 + 200) = v72;
      if (v72 >= 0x201)
      {
        uint64_t v73 = (void **)(a1 + 184);
        do
        {
          uint64_t v74 = *v73;
          uint64_t v75 = (void *)**v73;
          *uint64_t v73 = v75;
          if (!v75) {
            *(void *)(a1 + 192) = v73;
          }
          *(_DWORD *)(a1 + 200) = v72 - 1;
          uint64_t v76 = (void *)v74[8];
          if (v76)
          {
            free(v76);
            v74[8] = 0;
          }
          uint64_t v77 = (const void *)v74[10];
          if (v77) {
            CFRelease(v77);
          }
          free(v74);
          unsigned int v72 = *(_DWORD *)(a1 + 200);
        }
        while (v72 > 0x200);
      }
      memset(buffer, 0, 56);
      v131[0] = 0;
      gmtime_r(v17 + 2, buffer);
      uint64_t v78 = *((unsigned int *)v17 + 2);
      if (v78 > 0x21) {
        uint64_t v79 = "GENERAL";
      }
      else {
        uint64_t v79 = checkpoint_history_type_name[v78];
      }
      asprintf(v131, "[%02u:%02u:%02u.%04u-GMT]{%u>%u} CHECKPOINT %s", buffer[0].tm_hour, buffer[0].tm_min, buffer[0].tm_sec, *((_DWORD *)v17 + 8) / 1000, *((_DWORD *)v17 + 11), *((_DWORD *)v17 + 10), v79);
      uint64_t v80 = v131[0];
      *(void *)&buffer[0].tm_sec = 0;
      if (*((_DWORD *)v17 + 19))
      {
        asprintf((char **)buffer, "(FAILURE:%d) ");
      }
      else
      {
        unsigned int v87 = *((_DWORD *)v17 + 2);
        if (v87 <= 0x1C && ((1 << v87) & 0x18000080) != 0) {
          asprintf((char **)buffer, "(SUCCESS) ", v127);
        }
        else {
          asprintf((char **)buffer, " ", v127);
        }
      }
      uint64_t v88 = *(char **)&buffer[0].tm_sec;
      if (!v80 || !*(void *)&buffer[0].tm_sec) {
        goto LABEL_149;
      }
      *(void *)&buffer[0].tm_sec = 0;
      if (*((_DWORD *)v17 + 14))
      {
        int v89 = *((_DWORD *)v17 + 2);
        if (v89 == 28 || v89 == 1)
        {
          asprintf((char **)buffer, "[0x%04X] %s");
        }
        else if (*((_DWORD *)v17 + 12) == 1)
        {
          asprintf((char **)buffer, "%s");
        }
        else
        {
          asprintf((char **)buffer, "%s:[0x%04X] %s");
        }
        uint64_t v90 = *(char **)&buffer[0].tm_sec;
      }
      else
      {
        uint64_t v90 = 0;
      }
      v131[0] = 0;
      int v91 = *((_DWORD *)v17 + 2);
      if (v91 == 28)
      {
        *(void *)&buffer[0].tm_sec = 0;
        if (!*((_DWORD *)v17 + 19))
        {
          asprintf((char **)buffer, "... %s");
          goto LABEL_122;
        }
        uint64_t v94 = checkpoint_nvram_copy_encode_c_string(a1, 9, v81, v82, v83, v84, v85, v86);
        uint64_t v100 = checkpoint_nvram_copy_string(a1, a1 + 1064, 12, v95, v96, v97, v98, v99);
        uint64_t v101 = v100;
        uint64_t v102 = *(unsigned int *)(a1 + 108);
        if (v102 > 6) {
          uint64_t v103 = "GENERAL";
        }
        else {
          uint64_t v103 = checkpoint_failure_type_name[v102];
        }
        if (v94)
        {
          if (!v100)
          {
            asprintf((char **)buffer, "[%s] %s", v103, v94);
            uint64_t v112 = v94;
            goto LABEL_121;
          }
          asprintf((char **)buffer, "[%s] %s %s", v103, v100, v94);
          free(v94);
        }
        else
        {
          if (!v100)
          {
            asprintf((char **)buffer, "[%s]");
LABEL_122:
            uint64_t v92 = *(char **)&buffer[0].tm_sec;
            if (v90) {
              goto LABEL_106;
            }
            goto LABEL_123;
          }
          asprintf((char **)buffer, "[%s] %s", v103, v100);
        }
        uint64_t v112 = v101;
LABEL_121:
        free(v112);
        goto LABEL_122;
      }
      if (v91 == 27)
      {
        uint64_t v92 = checkpoint_nvram_copy_encode_c_string(a1, 13, v81, v82, v83, v84, v85, v86);
        int v93 = strcmp(v92, "{}");
        if (v92 && !v93)
        {
          free(v92);
          if (!v90) {
            goto LABEL_125;
          }
LABEL_108:
          asprintf(v131, "%s:%s%s", v80, v88, v90);
          char v111 = 0;
          uint64_t v92 = 0;
          goto LABEL_127;
        }
      }
      else
      {
        uint64_t v92 = checkpoint_cferror_alloc_string((CFErrorRef)v17[10]);
      }
      if (v90)
      {
LABEL_106:
        if (v92)
        {
          asprintf(v131, "%s:%s%s %s", v80, v88, v90, v92);
          char v111 = 0;
          goto LABEL_127;
        }
        goto LABEL_108;
      }
LABEL_123:
      if (v92)
      {
        asprintf(v131, "%s:%s %s", v80, v88, v92);
        goto LABEL_126;
      }
LABEL_125:
      asprintf(v131, "%s:%s", v80, v88);
      uint64_t v92 = 0;
LABEL_126:
      char v111 = 1;
LABEL_127:
      char v113 = (char)v131[0];
      if (v131[0])
      {
        char v129 = v111;
        if (*((_DWORD *)v17 + 2) == 28)
        {
          if (*(_DWORD *)(a1 + 88) == 2) {
            int v114 = 1;
          }
          else {
            int v114 = 3;
          }
        }
        else
        {
          int v114 = 1;
        }
        while (1)
        {
          ramrod_log_msg("%s\n", v104, v105, v106, v107, v108, v109, v110, v113);
          if (*((_DWORD *)v17 + 2) == 28) {
            ramrod_log_msg("\n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", v115, v116, v117, v118, v119, v120, v121, v128);
          }
          if (v114 < 2) {
            break;
          }
          --v114;
          sleep(1u);
        }
        long long v122 = v131[0];
        uint64_t v123 = calloc(1uLL, 0x10uLL);
        if (v123)
        {
          uint64_t v124 = v123;
          v123[1] = v122;
          if (*(_DWORD *)a1 == 1)
          {
            *uint64_t v123 = 0;
            **(void **)(a1 + 480) = v123;
            *(void *)(a1 + 480) = v123;
          }
          else
          {
            pthread_mutex_lock((pthread_mutex_t *)(a1 + 232));
            int v125 = *(_DWORD *)a1;
            void *v124 = 0;
            **(void **)(a1 + 480) = v124;
            *(void *)(a1 + 480) = v124;
            if (v125 != 1) {
              pthread_mutex_unlock((pthread_mutex_t *)(a1 + 232));
            }
          }
          *(unsigned char *)(a1 + 208) = 1;
          char v111 = v129;
        }
        else if (v122)
        {
          free(v122);
        }
      }
      if ((v111 & 1) == 0) {
        free(v90);
      }
      if (v92) {
        free(v92);
      }
LABEL_149:
      if (v80) {
        free(v80);
      }
      if (v88) {
        free(v88);
      }
      return v17;
  }
}

void checkpoint_nvram_collect(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a2 + 4))
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): first available indication when already collected\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_collect");
    return;
  }
  int v10 = (const __CFString **)(a2 + 8);
  for (uint64_t i = 1; i != 49; ++i)
  {
    checkpoint_nvram_collect_var((uint64_t)a1, *(_DWORD *)a2, i - 1, v10);
    int v16 = *a1;
    if ((i - 40) <= 3 && v16 == 2)
    {
      if (*(void *)(a2 + 8 * i)) {
        goto LABEL_12;
      }
    }
    else if ((i - 44) <= 3 && v16 == 2)
    {
      CFStringRef v17 = *(const __CFString **)(a2 + 8 * i);
      if (v17)
      {
        bzero(v23, 0x400uLL);
        checkpoint_get_nvram_value_string(v17, v23);
        checkpoint_nvram_store_string((uint64_t)a1, (i - 5), v23, v18, v19, v20, v21, v22);
LABEL_12:
        checkpoint_nvram_delete_var((uint64_t)a1, i - 1, 0, 0, v12, v13, v14, v15);
      }
    }
    ++v10;
  }
  *(unsigned char *)(a2 + 4) = 1;
}

uint64_t checkpoint_get_outcome_type(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = checkpoint_nvram_copy_string(a1, a2, 5, a4, a5, a6, a7, a8);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  unint64_t v10 = 0;
  do
  {
    if (!strcmp(v9, checkpoint_outcome_names[v10])) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    if (v11) {
      break;
    }
  }
  while (v10++ < 0x21);
  free(v9);
  return v11;
}

void checkpoint_nvram_store_anomaly(uint64_t a1, uint64_t a2, char *a3, ...)
{
  va_start(va, a3);
  v8[0] = 0;
  va_copy((va_list)&v8[1], va);
  vasprintf(v8, a3, va);
  if (v8[0])
  {
    checkpoint_history_add(a1, 30, 1, 0, 260, v8[0], 0, 0, 0);
    checkpoint_nvram_store_by_id(a1, 8, *(unsigned int *)(a1 + 120), v8[0], v4, v5, v6, v7);
    if (v8[0])
    {
      free(v8[0]);
      v8[0] = 0;
    }
  }
  ++*(_DWORD *)(a1 + 120);
}

void checkpoint_outcome_progress(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned int *)(a1 + 96);
  uint64_t v9 = (uint64_t)*(&checkpoint_outcome_progress_table + v8);
  if (*(_DWORD *)(v9 + 4 * a2))
  {
    *(_DWORD *)(a1 + 92) = v8;
    uint64_t v12 = *(unsigned int *)(v9 + 4 * a2);
    *(_DWORD *)(a1 + 96) = v12;
    if (v12 > 0x21) {
      uint64_t v13 = "unknown";
    }
    else {
      uint64_t v13 = checkpoint_outcome_names[v12];
    }
    checkpoint_nvram_store_string(a1, 5, v13, a4, a5, a6, a7, a8);
    checkpoint_log_progress(a1, a2);
  }
}

void checkpoint_nvram_delete_var(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 < 0x30)
  {
    uint64_t v9 = &checkpoint_nvram_map[4 * a2];
    if (a3 || (*((_DWORD *)v9 + 6) - 5) < 0xFFFFFFFD)
    {
      bzero(buffer, 0x400uLL);
      if (*(_DWORD *)(a1 + 88) == 1) {
        unint64_t v10 = (CFStringRef *)v9;
      }
      else {
        unint64_t v10 = (CFStringRef *)(v9 + 1);
      }
      CFStringRef v11 = *v10;
      CFStringGetCString(*v10, buffer, 1024, 0x8000100u);
      checkpoint_nvram_delete_var_raw(v11);
    }
    else
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid delete of BOOT-CONTROL NVRAM ID %u\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_delete_var");
    }
  }
  else
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid delete of NVRAM ID %u\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_delete_var");
  }
}

char *checkpoint_get_nvram_value_string(const __CFString *a1, char *a2)
{
  if (a1) {
    CFStringGetCString(a1, a2, 1024, 0x8000100u);
  }
  else {
    bzero(a2, 0x400uLL);
  }
  return a2;
}

void checkpoint_nvram_store_string(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    a2 = LODWORD(checkpoint_nvram_map[4 * a2 + 2]);
  }
  if (a2 > 0x2F) {
    goto LABEL_12;
  }
  uint64_t v10 = a2;
LABEL_7:
  if ((0xFFFC000000FEuLL >> v10))
  {
    CFStringRef v11 = *(void ***)(a1 + 16 * v10 + 1496);
    if (v11)
    {
      if (*v11)
      {
        free(*v11);
        *CFStringRef v11 = 0;
      }
      checkpoint_nvram_store_set_string(a1 + 1456, (char **)v11, a3, a4, a5, a6, a7, a8);
      *(unsigned char *)(a1 + 16 * v10 + 1492) = 1;
      return;
    }
  }
LABEL_12:
  int v12 = *(_DWORD *)(a1 + 1476);
  if (!v12)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
    int v12 = *(_DWORD *)(a1 + 1476);
  }
  *(_DWORD *)(a1 + 1476) = v12 + 1;
}

void checkpoint_access_obtain(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (*a1 != 1)
    {
      uint64_t v8 = (pthread_mutex_t *)(a1 + 2);
      pthread_mutex_lock(v8);
    }
  }
  else
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): checkpoint context not initialized\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_access_obtain");
  }
}

void checkpoint_access_yield(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (*a1 != 1)
    {
      uint64_t v8 = (pthread_mutex_t *)(a1 + 2);
      pthread_mutex_unlock(v8);
    }
  }
  else
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): checkpoint context not initialized\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_access_yield");
  }
}

char *checkpoint_cferror_alloc_string(CFErrorRef err)
{
  if (!err) {
    return 0;
  }
  CFStringRef v1 = err;
  CFStringRef v2 = 0;
  unsigned int v3 = 0;
  do
  {
    CFDictionaryRef v4 = CFErrorCopyUserInfo(v1);
    CFStringRef v2 = checkpoint_append_and_free(v2, "[%d]", v5, v6, v7, v8, v9, v10, v3);
    if (!v4) {
      break;
    }
    char v22 = 0;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorLocalizedRecoverySuggestionKey);
    int v12 = checkpoint_cferror_append(v2, (char)"RS", Value, &v22);
    CFStringRef v13 = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorLocalizedDescriptionKey);
    uint64_t v14 = checkpoint_cferror_append(v12, (char)"LD", v13, &v22);
    CFStringRef v15 = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorDescriptionKey);
    int v16 = checkpoint_cferror_append(v14, (char)"D", v15, &v22);
    CFStringRef v17 = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorLocalizedFailureReasonKey);
    CFStringRef v2 = checkpoint_cferror_append(v16, (char)"FR", v17, &v22);
    CFStringRef v1 = (__CFError *)CFDictionaryGetValue(v4, kCFErrorUnderlyingErrorKey);
    CFRelease(v4);
    if (!v1) {
      break;
    }
  }
  while (v3++ < 0xF);
  size_t v19 = strlen(v2);
  if (v19 >= 0xF3)
  {
    uint64_t v21 = 0;
    asprintf(&v21, "%s", &v2[v19 - 242]);
    if (v2) {
      free(v2);
    }
    return v21;
  }
  return v2;
}

uint64_t checkpoint_closure_context_get_step_desc(uint64_t result)
{
  if (result) {
    return *(void *)result;
  }
  return result;
}

uint64_t checkpoint_closure_context_should_retry(uint64_t result)
{
  if (result)
  {
    int v1 = *(_DWORD *)(result + 40);
    *(_DWORD *)(result + 40) = v1 + 1;
    return !*(unsigned char *)(result + 11) && v1 < *(_DWORD *)(*(void *)result + 28);
  }
  return result;
}

uint64_t checkpoint_closure_context_handle_simulator_actions(uint64_t *a1, uint64_t a2, int *a3, const void **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): closure context is NULL\n", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)"checkpoint_closure_context_handle_simulator_actions");
    return a2;
  }
  if (!checkpoint_chassis_context)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): %s called too early, checkpoint_chassis_context == NULL\n", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)"checkpoint_closure_context_handle_simulator_actions");
    return a2;
  }
  uint64_t v9 = *a1;
  uint64_t v10 = checkpoint_chassis_context;
  return checkpoint_simulator_action(v10, v9, a2, a3, a4, a6, a7, a8);
}

uint64_t checkpoint_simulator_action(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, const void **a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = a3;
  unsigned int v13 = a3;
  checkpoint_access_obtain((_DWORD *)a1, a2, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
  checkpoint_simulator_configure(a1, v14, v15, v16, v17, v18, v19, v20);
  if (!*(_DWORD *)(a1 + 2276) || !*(void *)(a1 + 2288)) {
    goto LABEL_14;
  }
  CFStringRef v28 = CFStringCreateWithCString(kCFAllocatorDefault, *(const char **)(a2 + 8), 0x8000100u);
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 2288));
  if (Count < 1)
  {
    BOOL v36 = 0;
    if (!v28) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  CFIndex v30 = Count;
  CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), 0);
  if (CFEqual(v28, ValueAtIndex))
  {
    BOOL v36 = 1;
    if (!v28) {
      goto LABEL_10;
    }
LABEL_9:
    CFRelease(v28);
    goto LABEL_10;
  }
  CFIndex v32 = 1;
  do
  {
    CFIndex v33 = v32;
    if (v30 == v32) {
      break;
    }
    CFStringRef v34 = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), v32);
    CFComparisonResult v35 = CFStringCompare(v28, v34, 0);
    CFIndex v32 = v33 + 1;
  }
  while (v35);
  BOOL v36 = v33 < v30;
  if (v28) {
    goto LABEL_9;
  }
LABEL_10:
  if (!v36)
  {
LABEL_14:
    checkpoint_access_yield((_DWORD *)a1, v21, v22, v23, v24, v25, v26, v27);
    BOOL v38 = 0;
    goto LABEL_15;
  }
  int v37 = *(_DWORD *)(a1 + 2284);
  if (v37)
  {
    if (!v13) {
      *(_DWORD *)(a1 + 2284) = v37 - 1;
    }
    goto LABEL_14;
  }
  if (v13) {
    checkpoint_history_add(a1, *(_DWORD *)(a1 + 2276), 1, 0, *(_DWORD *)a2, *(const char **)(a2 + 8), *(_DWORD *)(a1 + 2280), *a4, *a5);
  }
  checkpoint_access_yield((_DWORD *)a1, v21, v22, v23, v24, v25, v26, v27);
  BOOL v38 = 0;
  int v47 = 0;
  switch(*(_DWORD *)(a1 + 2276))
  {
    case 9:
      goto LABEL_80;
    case 0xA:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        *a4 = 181;
        ramrod_create_error_cf((CFErrorRef *)a5, @"CheckpointErrorDomain", 181, 0, @"checkpoint simulator error", v44, v45, v46, v92);
      }
      goto LABEL_76;
    case 0xB:
      if (*(unsigned __int8 *)(a1 + 2275) == v10) {
        abort();
      }
      goto LABEL_76;
    case 0xC:
      if (*(unsigned __int8 *)(a1 + 2275) == v10) {
        exit(182);
      }
      goto LABEL_76;
    case 0xD:
      if (*(unsigned __int8 *)(a1 + 2275) == v10) {
        _exit(183);
      }
      goto LABEL_76;
    case 0xE:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        for (uint64_t i = 0; ; i += 4)
          ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): simulator signal executing after dereference of %p [%d]\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
      }
      goto LABEL_76;
    case 0xF:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        while (1)
          ;
      }
      goto LABEL_76;
    case 0x10:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        memset(&v94, 0, sizeof(v94));
        v93.__sig = 0;
        *(void *)v93.__opaque = 0;
        pthread_mutexattr_init(&v93);
        pthread_mutex_init(&v94, &v93);
        pthread_mutex_lock(&v94);
        pthread_mutex_lock(&v94);
      }
      goto LABEL_76;
    case 0x11:
      if (*(unsigned __int8 *)(a1 + 2275) != v10) {
        goto LABEL_76;
      }
      mach_port_t v49 = mach_host_self();
      int v50 = 0;
      goto LABEL_45;
    case 0x12:
      if (*(unsigned __int8 *)(a1 + 2275) != v10) {
        goto LABEL_76;
      }
      mach_port_t v49 = mach_host_self();
      int v50 = 4096;
LABEL_45:
      host_reboot(v49, v50);
LABEL_76:
      BOOL v38 = 0;
      goto LABEL_77;
    case 0x13:
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): simulator PAUSE not supported\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
      goto LABEL_76;
    case 0x14:
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): simulator RESUME not supported\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
      goto LABEL_76;
    case 0x15:
      if (*(unsigned __int8 *)(a1 + 2275) != v10) {
        goto LABEL_76;
      }
      __break(1u);
LABEL_50:
      BOOL v38 = v10 == 0;
LABEL_77:
      int v47 = v13;
LABEL_78:
      if (!v13) {
        goto LABEL_80;
      }
      unsigned int v13 = v47;
      if (!v47) {
        goto LABEL_80;
      }
      goto LABEL_15;
    case 0x16:
      goto LABEL_50;
    case 0x17:
      BOOL v38 = 0;
      int v51 = *(unsigned __int8 *)(a1 + 2275);
      if (v51 == v10) {
        int v47 = 0;
      }
      else {
        int v47 = v10;
      }
      if (v13 || v51 != v10) {
        goto LABEL_78;
      }
      if (!*a4)
      {
        ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): checkpoint simulator to ignore error on step %s, but step was successful\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
        goto LABEL_70;
      }
      ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): checkpoint simulator ignoring error on step %s result: %d\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
      *a4 = 0;
      if (!*a5)
      {
LABEL_70:
        BOOL v38 = 0;
        int v47 = 0;
        goto LABEL_80;
      }
      uint64_t v52 = checkpoint_cferror_alloc_string((CFErrorRef)*a5);
      if (v52)
      {
        unint64_t v60 = v52;
        ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): checkpoint simulator ignoring error on step %s error: %s\n", v53, v54, v55, v56, v57, v58, v59, (char)"checkpoint_simulator_action");
        free(v60);
      }
      CFRelease(*a5);
      BOOL v38 = 0;
      int v47 = 0;
      *a5 = 0;
LABEL_80:
      int v90 = *(_DWORD *)(a1 + 2280);
      if (v90)
      {
        int v91 = v90 - 1;
        *(_DWORD *)(a1 + 2280) = v91;
        if (!v91) {
          *(_DWORD *)(a1 + 2276) = 0;
        }
      }
      unsigned int v13 = v47;
LABEL_15:
      if (v10) {
        return v13;
      }
      else {
        return v38;
      }
    case 0x18:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        checkpoint_simulator_jetsam();
        ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): returned from checkpoint jetsam attempt; continuing engine\n",
          v61,
          v62,
          v63,
          v64,
          v65,
          v66,
          v67,
          (char)"checkpoint_simulator_action");
      }
      goto LABEL_76;
    case 0x19:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        int v68 = fork();
        if (v68 < 1)
        {
          if (!v68)
          {
            checkpoint_simulator_jetsam();
            exit(0);
          }
          __error();
          ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): error %d attempting to fork jetsam child\n", v76, v77, v78, v79, v80, v81, v82, (char)"checkpoint_simulator_action");
        }
        else
        {
          LODWORD(v94.__sig) = 0;
          if (waitpid(v68, (int *)&v94, 0) < 0)
          {
            __error();
            ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): error %d waiting for jetsam child\n", v83, v84, v85, v86, v87, v88, v89, (char)"checkpoint_simulator_action");
          }
          else if ((v94.__sig & 0x7F) == 0x7F)
          {
            ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): unexpected status of jetsam child: %d\n", v69, v70, v71, v72, v73, v74, v75, (char)"checkpoint_simulator_action");
          }
          else if ((v94.__sig & 0x7F) != 0)
          {
            ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): jetsam child signalled: %d\n", v69, v70, v71, v72, v73, v74, v75, (char)"checkpoint_simulator_action");
          }
          else
          {
            ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): jetsam child exited: %d\n", v69, v70, v71, v72, v73, v74, v75, (char)"checkpoint_simulator_action");
          }
        }
      }
      goto LABEL_76;
    default:
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): unknown simulator command ignored\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
      BOOL v38 = 0;
      int v47 = 1;
      goto LABEL_78;
  }
}

uint64_t checkpoint_closure_context_handle_simulator_match_name(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): closure context is NULL\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_closure_context_handle_simulator_match_name");
    return 0;
  }
  if (!checkpoint_chassis_context)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): %s called too early, checkpoint_chassis_context == NULL\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_closure_context_handle_simulator_match_name");
    return 0;
  }
  uint64_t v8 = *a1;
  uint64_t v9 = checkpoint_chassis_context;
  return checkpoint_simulator_action_match(v9, v8, a3, a4, a5, a6, a7, a8);
}

uint64_t checkpoint_simulator_action_match(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  checkpoint_access_obtain((_DWORD *)a1, a2, a3, a4, a5, a6, a7, a8);
  checkpoint_simulator_configure(a1, v10, v11, v12, v13, v14, v15, v16);
  if (*(_DWORD *)(a1 + 2276))
  {
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 2288));
    CFStringRef v32 = CFStringCreateWithCString(kCFAllocatorDefault, *(const char **)(a2 + 8), 0x8000100u);
    if (Count < 1)
    {
LABEL_6:
      uint64_t v35 = 0;
    }
    else
    {
      CFIndex v33 = 0;
      while (1)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), v33);
        if (CFEqual(v32, ValueAtIndex)) {
          break;
        }
        if (Count == ++v33) {
          goto LABEL_6;
        }
      }
      uint64_t v35 = 1;
    }
    checkpoint_access_yield((_DWORD *)a1, v25, v26, v27, v28, v29, v30, v31);
    if (v32) {
      CFRelease(v32);
    }
  }
  else
  {
    checkpoint_access_yield((_DWORD *)a1, v17, v18, v19, v20, v21, v22, v23);
    return 0;
  }
  return v35;
}

char *checkpoint_append_and_free_key_v(char *a1, const char *a2, const char *a3, int *a4)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  asprintf(&v12, "%s:%s", a2, a3);
  uint64_t v6 = v12;
  if (!v12) {
    return a1;
  }
  if (!a1) {
    return v12;
  }
  size_t v7 = strlen(a1);
  size_t v8 = strlen(v12);
  uint64_t v9 = 1;
  if (*a4 > 0) {
    uint64_t v9 = 2;
  }
  if (v8 + v7 + v9 >= 0x81)
  {
    uint64_t v11 = a1;
LABEL_13:
    free(v6);
    return v11;
  }
  if (*a4 <= 0) {
    asprintf(&v11, "%s%s");
  }
  else {
    asprintf(&v11, "%s;%s");
  }
  ++*a4;
  free(a1);
  uint64_t v6 = v12;
  if (v12) {
    goto LABEL_13;
  }
  return v11;
}

char *checkpoint_append_and_free(char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11 = 0;
  v12[0] = 0;
  v12[1] = &a9;
  vasprintf(v12, a2, &a9);
  if (!v12[0]) {
    return a1;
  }
  if (!a1) {
    return v12[0];
  }
  asprintf(&v11, "%s%s", a1, v12[0]);
  if (v11) {
    free(a1);
  }
  else {
    uint64_t v11 = a1;
  }
  if (v12[0])
  {
    free(v12[0]);
    v12[0] = 0;
  }
  return v11;
}

char *checkpoint_append_and_free_id_v(char *a1, int a2, const char *a3, int *a4)
{
  size_t v8 = 0;
  asprintf(&v8, "0x%08X", a2);
  if (v8)
  {
    a1 = checkpoint_append_and_free_key_v(a1, v8, a3, a4);
    if (v8) {
      free(v8);
    }
  }
  return a1;
}

char *checkpoint_append_and_free_try_v(char *a1, int a2, const char *a3, int *a4)
{
  size_t v8 = 0;
  asprintf(&v8, "%d", a2);
  if (v8)
  {
    a1 = checkpoint_append_and_free_key_v(a1, v8, a3, a4);
    if (v8) {
      free(v8);
    }
  }
  return a1;
}

void checkpoint_outcome_init(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)a1 == 1)
  {
    if (a2)
    {
      if (*(unsigned char *)(a1 + 104))
      {
        int v9 = 17;
        goto LABEL_14;
      }
      BOOL v10 = *(unsigned char *)(a1 + 101) == 0;
      int v9 = 5;
    }
    else
    {
      BOOL v10 = *(_DWORD *)(a1 + 88) == 2;
      int v9 = 1;
    }
  }
  else if (a2)
  {
    if (*(unsigned char *)(a1 + 104))
    {
      int v9 = 19;
      goto LABEL_14;
    }
    BOOL v10 = *(unsigned char *)(a1 + 101) == 0;
    int v9 = 7;
  }
  else
  {
    BOOL v10 = *(_DWORD *)(a1 + 88) == 2;
    int v9 = 3;
  }
  if (!v10) {
    ++v9;
  }
LABEL_14:
  *(_DWORD *)(a1 + 96) = v9;
  checkpoint_nvram_store_string(a1, 5, checkpoint_outcome_names[v9], a4, a5, a6, a7, a8);
  checkpoint_log_progress(a1, 1);
}

void checkpoint_nvram_collect_var(uint64_t a1, unsigned int a2, unsigned int a3, const __CFString **a4)
{
  CFTypeRef cf = 0;
  bzero(buffer, 0x400uLL);
  bzero(v46, 0x400uLL);
  if (a3 < 0x30)
  {
    if (*(_DWORD *)(a1 + 88) == 1) {
      uint64_t v16 = &checkpoint_nvram_map[4 * a3];
    }
    else {
      uint64_t v16 = &checkpoint_nvram_map[4 * a3 + 1];
    }
    CFStringGetCString(*v16, buffer, 1024, 0x8000100u);
    CFStringRef v17 = (const __CFString *)ramrod_copy_NVRAM_variable();
    if (!v17) {
      return;
    }
    CFStringRef v15 = v17;
    CFTypeID v18 = CFGetTypeID(v17);
    if (v18 == CFStringGetTypeID())
    {
      CFStringGetCString(v15, v46, 1024, 0x8000100u);
      *a4 = v15;
      CFStringRef v15 = 0;
      goto LABEL_22;
    }
    if (v18 == CFNumberGetTypeID())
    {
      LODWORD(valuePtr) = 0;
      if (!CFNumberGetValue((CFNumberRef)v15, kCFNumberIntType, &valuePtr))
      {
        uint64_t v27 = "CHECKPOINT_INTERNAL_ERROR(%s): number that is not an int %s\n";
        goto LABEL_29;
      }
      CFStringRef v26 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", valuePtr);
      if (!v26)
      {
        uint64_t v27 = "CHECKPOINT_INTERNAL_ERROR(%s): failed to get valid number for %s\n";
LABEL_29:
        ramrod_log_msg(v27, v19, v20, v21, v22, v23, v24, v25, (char)"checkpoint_nvram_collect_var");
        goto LABEL_3;
      }
    }
    else
    {
      if (v18 != CFDataGetTypeID())
      {
        ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): unsupported nvram variable type for %s\n", v28, v29, v30, v31, v32, v33, v34, (char)"checkpoint_nvram_collect_var");
        goto LABEL_3;
      }
      CFStringRef v26 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, (CFDataRef)v15, 0x8000100u);
      if (!v26)
      {
        ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): failed to get string from data %s\n", v35, v36, v37, v38, v39, v40, v41, (char)"checkpoint_nvram_collect_var");
        goto LABEL_3;
      }
    }
    CFStringRef v42 = v26;
    CFStringGetCString(v26, v46, 1024, 0x8000100u);
    *a4 = v42;
LABEL_22:
    int valuePtr = 0;
    if (a2 > 2) {
      uint64_t v43 = "Unknown";
    }
    else {
      uint64_t v43 = checkpoint_nvram_collection_name[a2];
    }
    asprintf(&valuePtr, "%s NVRAM variable: %s=%s", v43, buffer, v46);
    if (valuePtr)
    {
      checkpoint_history_add(a1, 2, 1, 0, 257, valuePtr, 0, 0, 0);
      free(valuePtr);
    }
    goto LABEL_3;
  }
  ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable id=%u\n", v8, v9, v10, v11, v12, v13, v14, (char)"checkpoint_nvram_collect_var");
  CFStringRef v15 = 0;
LABEL_3:
  if (cf) {
    CFRelease(cf);
  }
  if (v15) {
    CFRelease(v15);
  }
}

uint64_t checkpoint_nvram_check_collection(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  memset(v38, 0, sizeof(v38));
  unsigned int v10 = *a3;
  if (*a3)
  {
    unsigned __int8 v11 = 0;
    char v12 = 0;
    uint64_t v13 = a3 + 2;
    do
    {
      uint64_t v14 = v10;
      *((unsigned char *)v38 + v10) = 1;
      if (*(void *)(a2 + 8 * v10 + 8))
      {
        if (*((unsigned char *)v13 - 3)) {
          unsigned __int8 v11 = 1;
        }
        if (*((unsigned char *)v13 - 2)) {
          char v12 = 1;
        }
        if (*((unsigned char *)v13 - 1))
        {
          uint64_t v15 = v10 <= 0x2F && (LODWORD(checkpoint_nvram_map[4 * v10 + 3]) - 2) < 3;
          checkpoint_nvram_delete_var(a1, v10, v15, 1, a5, a6, a7, a8);
        }
      }
      else if (*((unsigned char *)v13 - 4))
      {
        bzero(buffer, 0x400uLL);
        checkpoint_get_nvram_name_string(a1, v14, buffer, v16, v17, v18, v19, v20);
        checkpoint_nvram_store_anomaly(a1, v21, "[check_collection]%s(does_not_exist)", buffer);
      }
      unsigned int v22 = *v13;
      v13 += 2;
      unsigned int v10 = v22;
    }
    while (v22);
  }
  else
  {
    char v12 = 0;
    unsigned __int8 v11 = 0;
  }
  uint64_t v23 = 0;
  uint64_t v24 = a2 + 16;
  do
  {
    if (!*((unsigned char *)v38 + v23 + 1) && *(void *)(v24 + 8 * v23))
    {
      bzero(buffer, 0x400uLL);
      bzero(v36, 0x400uLL);
      checkpoint_get_nvram_name_string(a1, (v23 + 1), buffer, v25, v26, v27, v28, v29);
      checkpoint_get_nvram_value_string(*(const __CFString **)(v24 + 8 * v23), v36);
      checkpoint_nvram_store_anomaly(a1, v30, "[check_collection]%s=%s(exists_when_not_expected)", buffer, v36);
      checkpoint_nvram_delete_var(a1, (v23 + 1), 0, 1, v31, v32, v33, v34);
    }
    ++v23;
  }
  while (v23 != 47);
  if (v12) {
    checkpoint_history_add(a1, 2, 1, 0, 262, "Old restore failure indication(s)", 0, 0, 0);
  }
  return v11;
}

void checkpoint_nvram_delete_var_if_matches(uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = *(const __CFString **)(a2 + 24);
  if (v3 && CFEqual(v3, @"upgrade"))
  {
    checkpoint_nvram_delete_var(a1, 2, 1, 0, v4, v5, v6, v7);
  }
}

char *checkpoint_get_nvram_name_string(uint64_t a1, uint64_t a2, char *buffer, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 >= 0x30)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, (uint64_t)buffer, a4, a5, a6, a7, a8, (char)"checkpoint_get_nvram_name");
    LODWORD(a2) = 0;
  }
  if (*(_DWORD *)(a1 + 88) == 1) {
    unsigned int v10 = &checkpoint_nvram_map[4 * a2];
  }
  else {
    unsigned int v10 = &checkpoint_nvram_map[4 * a2 + 1];
  }
  CFStringGetCString(*v10, buffer, 1024, 0x8000100u);
  return buffer;
}

void checkpoint_reboot_retry_chassis_aware(unsigned char *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1[100])
  {
    a1[104] = 1;
    a1[101] = 1;
    ramrod_log_msg("AP nonce will not be touched\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    bzero(v12, 0x400uLL);
    checkpoint_get_nvram_value_string(a2, v12);
    checkpoint_nvram_store_anomaly((uint64_t)a1, v11, "[reboot_retry_chassis]outcome=%s(pre_existing_reboot_retry_disabled)", v12);
  }
}

void checkpoint_nvram_delete_var_raw(const __CFString *a1)
{
  bzero(buffer, 0x400uLL);
  CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  ramrod_delete_NVRAM_variable();
}

void checkpoint_log_progress(uint64_t a1, int a2)
{
  uint64_t v7 = 0;
  uint64_t v3 = *(unsigned int *)(a1 + 92);
  if (v3 > 0x21) {
    uint64_t v4 = "unknown";
  }
  else {
    uint64_t v4 = checkpoint_outcome_names[v3];
  }
  uint64_t v5 = *(unsigned int *)(a1 + 96);
  if (v5 > 0x21) {
    uint64_t v6 = "unknown";
  }
  else {
    uint64_t v6 = checkpoint_outcome_names[v5];
  }
  asprintf(&v7, "%s (%s) -> (%s)", checkpoint_progress_names[a2], v4, v6);
  if (v7)
  {
    checkpoint_history_add(a1, 29, 1, 0, 260, v7, 0, 0, 0);
    if (v7) {
      free(v7);
    }
  }
}

uint64_t checkpoint_nvram_alloc_encode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      LODWORD(a2) = 0;
      goto LABEL_7;
    }
    LODWORD(a2) = checkpoint_nvram_map[4 * a2 + 2];
  }
  if (a2 >= 0x30)
  {
    uint64_t v9 = 0;
    uint64_t v10 = a2;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v10 = a2;
  uint64_t v9 = HIDWORD(checkpoint_nvram_map[4 * a2 + 2]);
LABEL_8:
  uint64_t v11 = checkpoint_nvram_encoder[v9];
  uint64_t v12 = *(void *)(a1 + 16 * v10 + 1496);
  return ((uint64_t (*)(uint64_t, uint64_t))v11)(a1, v12);
}

void checkpoint_nvram_store_by_id(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = a3;
  if (*(unsigned char *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, (uint64_t)a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      uint64_t v11 = 0;
      goto LABEL_7;
    }
    a2 = LODWORD(checkpoint_nvram_map[4 * a2 + 2]);
  }
  if (a2 > 0x2F) {
    goto LABEL_18;
  }
  uint64_t v11 = a2;
LABEL_7:
  if ((0x20420400uLL >> v11))
  {
    a2 = *(void *)(a1 + 16 * v11 + 1496);
    if (a2) {
      goto LABEL_21;
    }
  }
  if ((0x1001100uLL >> v11))
  {
    uint64_t v12 = *(void *)(a1 + 16 * v11 + 1496);
    if (v12)
    {
      unint64_t v13 = 0;
      a2 = v12 - 16;
      do
      {
        int v15 = *(_DWORD *)(a2 + 16);
        a2 += 16;
        int v14 = v15;
        if (v15) {
          BOOL v16 = v13 >= 7;
        }
        else {
          BOOL v16 = 1;
        }
        ++v13;
      }
      while (!v16);
      if (!v14)
      {
LABEL_21:
        *(_DWORD *)a2 = v9;
        checkpoint_nvram_store_set_string(a1 + 1456, (char **)(a2 + 8), a4, (uint64_t)a4, a5, a6, a7, a8);
        *(unsigned char *)(a1 + 16 * v11 + 1492) = 1;
        return;
      }
    }
  }
LABEL_18:
  int v17 = *(_DWORD *)(a1 + 1476);
  if (!v17)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", a2, a3, (uint64_t)a4, a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
    int v17 = *(_DWORD *)(a1 + 1476);
  }
  *(_DWORD *)(a1 + 1476) = v17 + 1;
}

void checkpoint_nvram_store_long(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    a2 = LODWORD(checkpoint_nvram_map[4 * a2 + 2]);
  }
  if (a2 > 0x2F) {
    goto LABEL_10;
  }
  uint64_t v10 = a2;
LABEL_7:
  if ((0x3C03C0000uLL >> v10))
  {
    uint64_t v11 = a1 + 16 * v10;
    uint64_t v12 = *(uint64_t **)(v11 + 1496);
    if (v12)
    {
      *uint64_t v12 = a3;
      *(unsigned char *)(v11 + 1492) = 1;
      return;
    }
  }
LABEL_10:
  int v13 = *(_DWORD *)(a1 + 1476);
  if (!v13)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
    int v13 = *(_DWORD *)(a1 + 1476);
  }
  *(_DWORD *)(a1 + 1476) = v13 + 1;
}

void checkpoint_nvram_store_by_id_try_int(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a5;
  int v9 = a4;
  int v10 = a3;
  if (*(unsigned char *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      uint64_t v12 = 0;
      goto LABEL_7;
    }
    a2 = LODWORD(checkpoint_nvram_map[4 * a2 + 2]);
  }
  if (a2 > 0x2F) {
    goto LABEL_8;
  }
  uint64_t v12 = a2;
LABEL_7:
  if (((0xA00A000uLL >> v12) & 1) != 0 && v9 <= 7)
  {
    int v14 = *(_DWORD **)(a1 + 16 * v12 + 1496);
    if (v14)
    {
      unint64_t v15 = 0;
      BOOL v16 = 0;
      int v17 = *(_DWORD **)(a1 + 16 * v12 + 1496);
      do
      {
        int v19 = *v17;
        v17 += 11;
        int v18 = v19;
        if (v19) {
          BOOL v20 = 1;
        }
        else {
          BOOL v20 = v10 == 0;
        }
        if (!v20) {
          BOOL v16 = v14;
        }
        BOOL v21 = v18 == v10 || v15++ >= 7;
        int v14 = v17;
      }
      while (!v21);
      if (v18 == v10) {
        BOOL v16 = v17 - 11;
      }
      if (v16)
      {
        *BOOL v16 = v10;
        v16[v9 + 1] = v8;
        *((unsigned char *)v16 + v9 + 36) = 1;
        *(unsigned char *)(a1 + 16 * v12 + 1492) = 1;
        return;
      }
    }
  }
LABEL_8:
  int v13 = *(_DWORD *)(a1 + 1476);
  if (!v13)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
    int v13 = *(_DWORD *)(a1 + 1476);
  }
  *(_DWORD *)(a1 + 1476) = v13 + 1;
}

void checkpoint_nvram_store_by_id_try(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = a4;
  int v10 = a3;
  if (*(unsigned char *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, a4, (uint64_t)a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      uint64_t v12 = 0;
      goto LABEL_7;
    }
    a2 = LODWORD(checkpoint_nvram_map[4 * a2 + 2]);
  }
  if (a2 > 0x2F) {
    goto LABEL_8;
  }
  uint64_t v12 = a2;
LABEL_7:
  if (((0x14014000uLL >> v12) & 1) != 0 && v9 <= 7)
  {
    int v14 = *(_DWORD **)(a1 + 16 * v12 + 1496);
    if (v14)
    {
      unint64_t v15 = 0;
      BOOL v16 = 0;
      int v17 = *(_DWORD **)(a1 + 16 * v12 + 1496);
      do
      {
        int v19 = *v17;
        v17 += 18;
        int v18 = v19;
        if (v19) {
          BOOL v20 = 1;
        }
        else {
          BOOL v20 = v10 == 0;
        }
        if (!v20) {
          BOOL v16 = v14;
        }
        BOOL v21 = v18 == v10 || v15++ >= 7;
        int v14 = v17;
      }
      while (!v21);
      if (v18 == v10) {
        BOOL v16 = v17 - 18;
      }
      if (v16)
      {
        *BOOL v16 = v10;
        checkpoint_nvram_store_set_string(a1 + 1456, (char **)&v16[2 * v9 + 2], a5, a4, (uint64_t)a5, a6, a7, a8);
        *(unsigned char *)(a1 + 16 * v12 + 1492) = 1;
        return;
      }
    }
  }
LABEL_8:
  int v13 = *(_DWORD *)(a1 + 1476);
  if (!v13)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", a2, a3, a4, (uint64_t)a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
    int v13 = *(_DWORD *)(a1 + 1476);
  }
  *(_DWORD *)(a1 + 1476) = v13 + 1;
}

void checkpoint_nvram_store_set_string(uint64_t a1, char **a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    if (*a2)
    {
      free(*a2);
      *a2 = 0;
    }
    if (a3) {
      asprintf(a2, "%s", a3);
    }
  }
  else
  {
    int v11 = *(_DWORD *)(a1 + 20);
    if (!v11)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", 0, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
      int v11 = *(_DWORD *)(a1 + 20);
    }
    *(_DWORD *)(a1 + 20) = v11 + 1;
  }
}

char *checkpoint_nvram_copy_encode_c_string(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = (char *)checkpoint_nvram_alloc_encode(a1, a2, a3, a4, a5, a6, a7, a8);
  int v10 = 0;
  if (result)
  {
    CFStringRef v9 = (const __CFString *)result;
    bzero(buffer, 0x400uLL);
    CFStringGetCString(v9, buffer, 1024, 0x8000100u);
    asprintf(&v10, "%s", buffer);
    CFRelease(v9);
    return v10;
  }
  return result;
}

char *checkpoint_nvram_copy_string(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11 = 0;
  if (*(unsigned char *)(a1 + 104))
  {
    if (a3 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      LODWORD(a3) = 0;
    }
    else
    {
      LODWORD(a3) = checkpoint_nvram_map[4 * a3 + 2];
    }
  }
  CFStringRef v9 = *(const __CFString **)(a2 + 8 * a3 + 8);
  if (!v9) {
    return 0;
  }
  bzero(buffer, 0x400uLL);
  CFStringGetCString(v9, buffer, 1024, 0x8000100u);
  asprintf(&v11, "%s", buffer);
  return v11;
}

char *checkpoint_cferror_append(char *a1, char a2, const __CFString *a3, unsigned char *a4)
{
  if (a3)
  {
    bzero(buffer, 0x400uLL);
    CFStringGetCString(a3, buffer, 1024, 0x8000100u);
    if (*a4) {
      int v14 = "|%s(%s)";
    }
    else {
      int v14 = "%s(%s)";
    }
    a1 = checkpoint_append_and_free(a1, v14, v8, v9, v10, v11, v12, v13, a2);
    *a4 = 1;
  }
  return a1;
}

void checkpoint_simulator_configure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(unsigned char *)(a1 + 2274) && checkpoint_nvram_is_available(a1, 0, 0, a4, a5, a6, a7, a8))
  {
    CFStringRef v9 = *(const __CFString **)(a1 + 992);
    if (!v9) {
      goto LABEL_23;
    }
    bzero(&v28[4], 0x3FCuLL);
    *(_DWORD *)(a1 + 2276) = 0;
    *(void *)(a1 + 2288) = 0;
    bzero(v30, 0x3FBuLL);
    strcpy(__s, "SIM_");
    size_t v10 = strlen(__s);
    CFStringGetCString(v9, &__s[v10], 1024 - v10, 0x8000100u);
    strcpy(v28, "SIM");
    size_t v11 = strlen(v28);
    CFStringGetCString(*(CFStringRef *)(a1 + 992), &v28[v11], 1024 - v11, 0x8000100u);
    uint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = checkpoint_history_type_name[v12];
      if (!strncasecmp(__s, v13, 0x400uLL))
      {
        *(_DWORD *)(a1 + 2276) = v12;
        goto LABEL_11;
      }
      if (!strncasecmp(v28, v13, 0x400uLL)) {
        break;
      }
      if (++v12 == 34)
      {
        LODWORD(v12) = *(_DWORD *)(a1 + 2276);
        goto LABEL_11;
      }
    }
    *(_DWORD *)(a1 + 2276) = v12;
    *(unsigned char *)(a1 + 2275) = 1;
LABEL_11:
    if (!v12) {
      goto LABEL_23;
    }
    CFStringRef v20 = *(const __CFString **)(a1 + 1016);
    if (v20)
    {
      CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, v20, @",");
      *(void *)(a1 + 2288) = ArrayBySeparatingStrings;
      if (ArrayBySeparatingStrings)
      {
        CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
        if (Count >= 1)
        {
          CFIndex v23 = Count;
          for (CFIndex i = 0; i != v23; ++i)
          {
            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), i);
            CFStringGetCStringPtr(ValueAtIndex, 0x8000100u);
          }
        }
        CFStringRef v26 = *(const __CFString **)(a1 + 1000);
        if (v26) {
          *(_DWORD *)(a1 + 2280) = CFStringGetIntValue(v26);
        }
        CFStringRef v27 = *(const __CFString **)(a1 + 1008);
        if (v27) {
          *(_DWORD *)(a1 + 2284) = CFStringGetIntValue(v27);
        }
        goto LABEL_23;
      }
    }
    else
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): simulator command without stepName\n", 0, v14, v15, v16, v17, v18, v19, (char)"checkpoint_simulator_configure");
    }
    *(_DWORD *)(a1 + 2276) = 0;
LABEL_23:
    *(unsigned char *)(a1 + 2274) = 1;
  }
}

void *checkpoint_simulator_jetsam()
{
  uint64_t v5 = 0;
  io_object_t v0 = &v5;
  size_t v1 = 0x100000;
  do
  {
    CFStringRef v2 = malloc(v1);
    *io_object_t v0 = v2;
    if (v2)
    {
      bzero(v2, v1);
      io_object_t v0 = (void **)*v0;
    }
    else
    {
      v1 >>= 1;
    }
  }
  while ((int)v1 > 4095);
  uint64_t result = v5;
  if (v5)
  {
    do
    {
      uint64_t v4 = (void *)*result;
      free(result);
      uint64_t result = v4;
    }
    while (v4);
  }
  return result;
}

double ramrod_execute_config_alloc()
{
  io_object_t v0 = calloc(1uLL, 0x28uLL);
  v0[14] = 0;
  double result = NAN;
  *((void *)v0 + 4) = 0x7FFFFFFF000000B4;
  return result;
}

void ramrod_execute_config_free(const void **a1)
{
  _Block_release(*a1);
  _Block_release(a1[1]);
  _Block_release(a1[2]);
  free(a1);
}

void ramrod_execute_config_set_output_block(uint64_t a1, void *aBlock)
{
  uint64_t v3 = _Block_copy(aBlock);
  _Block_release(*(const void **)(a1 + 16));
  *(void *)(a1 + 16) = v3;
}

uint64_t ramrod_execute_command_with_config(char *const *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pid_t v123 = 0;
  ramrod_log_msg("entering ramrod_execute_command_with_config: %s\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (char)*a1);
  *(void *)char v129 = -1;
  *(void *)uint64_t v130 = -1;
  ramrod_log_msg("executing %s", v10, v11, v12, v13, v14, v15, v16, (char)*a1);
  uint64_t v24 = (char *)*((void *)a1 + 1);
  if (v24)
  {
    uint64_t v25 = 2;
    do
    {
      ramrod_log_msg(" %s", v17, v18, v19, v20, v21, v22, v23, (char)v24);
      if ((unint64_t)(v25 - 1) > 8) {
        break;
      }
      uint64_t v24 = a1[v25++];
    }
    while (v24);
  }
  ramrod_log_msg("\n", v17, v18, v19, v20, v21, v22, v23, v120);
  if (pipe(v130) == -1)
  {
    uint64_t v37 = *a1;
    uint64_t v38 = __error();
    strerror(*v38);
    ramrod_log_msg("pipe failed while preparing to execute %s: %s\n", v39, v40, v41, v42, v43, v44, v45, (char)v37);
    int v46 = 0;
    unsigned int v47 = -1;
    goto LABEL_43;
  }
  if (pipe(v129) == -1)
  {
    uint64_t v48 = *a1;
    mach_port_t v49 = __error();
    strerror(*v49);
    ramrod_log_msg("pipe failed while preparing to execute %s: %s\n", v50, v51, v52, v53, v54, v55, v56, (char)v48);
    uint64_t v35 = 0xFFFFFFFFLL;
    int v36 = -1;
  }
  else
  {
    char v121 = 1;
    fcntl(v129[1], 73);
    posix_spawn_file_actions_t v125 = 0;
    posix_spawn_file_actions_init(&v125);
    posix_spawn_file_actions_adddup2(&v125, v129[0], 0);
    posix_spawn_file_actions_adddup2(&v125, v130[1], 1);
    posix_spawn_file_actions_adddup2(&v125, 2, 2);
    posix_spawnattr_t v124 = 0;
    posix_spawnattr_init(&v124);
    posix_spawnattr_setflags(&v124, 0x4000);
    if (*((_DWORD *)a2 + 6)) {
      posix_spawnattr_set_qos_clamp_np();
    }
    if (*a2) {
      (*(void (**)(void, posix_spawn_file_actions_t *))(*a2 + 16))(*a2, &v125);
    }
    int v26 = posix_spawn(&v123, *(const char **)a1, &v125, &v124, a1, 0);
    if (v26)
    {
      CFStringRef v27 = *a1;
      strerror(v26);
      ramrod_log_msg("posix_spawn %s failed: %s\n", v28, v29, v30, v31, v32, v33, v34, (char)v27);
      close(v130[0]);
      close(v129[1]);
      uint64_t v35 = 0xFFFFFFFFLL;
      int v36 = -1;
    }
    else
    {
      uint64_t v35 = v129[1];
      int v36 = v130[0];
      pid_t v58 = v123;
      if (v123 != -1)
      {
        uint64_t v59 = realpath_DARWIN_EXTSN(*(const char **)a1, 0);
        if (v59)
        {
          unint64_t v60 = v59;
          bzero(v132, 0x400uLL);
          uint64_t v61 = basename_r(v60, v132);
          if (v61
            && ((uint64_t v62 = v61, v128 = 256, _get_image_exec_options_bootargs)
             || !sysctlbyname("kern.bootargs", &_get_image_exec_options_bootargs, &v128, 0, 0))
            && (bzero(__str, 0x400uLL),
                uint64_t v126 = 0,
                uint64_t v127 = 0,
                snprintf(__str, 0x3FFuLL, "\\bramrod_exec-\\Q%s\\E=((0[0-7]+)|(([+-])?[[:digit:]]+)|(0[xX][[:xdigit:]]+))", v62), _find_tagged_regex(&_get_image_exec_options_bootargs, v128, __str, &v127, &v126)))
          {
            ramrod_log_msg("found ramrod_execute_command option in boot-args: ramrod_exec-%s=%.*s\n", v63, v64, v65, v66, v67, v68, v69, (char)v62);
            unsigned int v70 = strtol(v127, 0, 0);
            free(v60);
            int v78 = v70 & 0x1F;
            if ((v70 & 0x1F) != 0)
            {
              ramrod_log_msg("sending signal %d to process %d in %d millisecond(s)...\n", v71, v72, v73, v74, v75, v76, v77, v78);
              usleep(1000 * (unsigned __int16)(v70 >> 8));
              if (kill(v58, v78) == -1)
              {
                __error();
                ramrod_log_msg("could not send signal %d to process %d: error %d\n", v79, v80, v81, v82, v83, v84, v85, v78);
              }
            }
          }
          else
          {
            free(v60);
          }
        }
      }
    }
    posix_spawnattr_destroy(&v124);
    posix_spawn_file_actions_destroy(&v125);
    close(v129[0]);
  }
  close(v130[1]);
  int v46 = 0;
  unsigned int v47 = -1;
  if (v36 != -1 && v35 != -1)
  {
    bzero(v132, 0x400uLL);
    uint64_t v57 = a2[1];
    if (v57) {
      int v46 = (*(uint64_t (**)(uint64_t, uint64_t))(v57 + 16))(v57, v35);
    }
    else {
      int v46 = 0;
    }
    close(v35);
    ssize_t v86 = read(v36, v132, 0x3FFuLL);
    if (v86 >= 1)
    {
      for (ssize_t i = v86; i > 0; ssize_t i = read(v36, v132, 0x3FFuLL))
      {
        v132[i] = 0;
        uint64_t v94 = a2[2];
        if (v94) {
          (*(void (**)(uint64_t, char *))(v94 + 16))(v94, v132);
        }
      }
    }
    ramrod_log_msg("waiting for child to exit\n", v87, i, v89, v90, v91, v92, v93, v121);
    *(_DWORD *)__str = 0;
    if (waitpid(v123, (int *)__str, 0) == -1)
    {
      uint64_t v109 = *a1;
      uint64_t v110 = __error();
      strerror(*v110);
      ramrod_log_msg("waitpid failed for %s: %s\n", v111, v112, v113, v114, v115, v116, v117, (char)v109);
    }
    else
    {
      ramrod_log_msg("child exited\n", v95, v96, v97, v98, v99, v100, v101, v122);
      if ((__str[0] & 0x7F) == 0x7F)
      {
        ramrod_log_msg("%s was stopped by signal %d\n", v102, v103, v104, v105, v106, v107, v108, (char)*a1);
      }
      else
      {
        if ((__str[0] & 0x7F) == 0)
        {
          ramrod_log_msg("exit status: %d\n", v102, v103, v104, v105, v106, v107, v108, __str[1]);
          unsigned int v47 = __str[1];
LABEL_42:
          close(v36);
          goto LABEL_43;
        }
        ramrod_log_msg("%s was terminated by signal %d\n", v102, v103, v104, v105, v106, v107, v108, (char)*a1);
      }
    }
    unsigned int v47 = -1;
    goto LABEL_42;
  }
LABEL_43:
  if (v46) {
    BOOL v118 = v47 == 0;
  }
  else {
    BOOL v118 = 0;
  }
  if (v118) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v47;
  }
}

uint64_t _ramrod_execute_command_with_input_data_output_block(char *const *a1, uint64_t a2, uint64_t a3, char a4, const void *a5)
{
  uint64_t v10 = calloc(1uLL, 0x28uLL);
  *((_WORD *)v10 + 14) = 0;
  v10[4] = 0x7FFFFFFF000000B4;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = ___ramrod_execute_command_with_input_data_output_block_block_invoke;
  aBlock[3] = &__block_descriptor_33_e10_i16__0__v8l;
  char v24 = a4;
  uint64_t v11 = _Block_copy(aBlock);
  _Block_release((const void *)*v10);
  *uint64_t v10 = v11;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = ___ramrod_execute_command_with_input_data_output_block_block_invoke_2;
  v22[3] = &__block_descriptor_48_e8_i12__0i8l;
  v22[4] = a2;
  v22[5] = a3;
  uint64_t v12 = _Block_copy(v22);
  _Block_release((const void *)v10[1]);
  v10[1] = v12;
  uint64_t v13 = _Block_copy(a5);
  _Block_release((const void *)v10[2]);
  v10[2] = v13;
  uint64_t v20 = ramrod_execute_command_with_config(a1, v10, v14, v15, v16, v17, v18, v19);
  ramrod_execute_config_free((const void **)v10);
  return v20;
}

uint64_t __ramrod_execute_command_with_callback_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

uint64_t ramrod_execute_command(char *const *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  _OWORD v2[2] = __ramrod_execute_command_with_callback_block_invoke;
  v2[3] = &__block_descriptor_48_e13_v24__0r_v8Q16l;
  v2[4] = log_output_buf;
  v2[5] = 0;
  return _ramrod_execute_command_with_input_data_output_block(a1, 0, 0, 1, v2);
}

void log_output_buf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t wait_for_device(char *a1, char *a2, size_t a3, CFErrorRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  ramrod_log_msg("entering %s: '%s'\n", (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8, (char)"wait_for_device");
  if (!a1)
  {
    CFStringRef v86 = @"%s: type argument is NULL";
LABEL_53:
    ramrod_create_error_cf(a4, @"RamrodErrorDomain", 3, 0, v86, v11, v12, v13, (char)"wait_for_device");
    return 0;
  }
  if (!a2)
  {
    CFStringRef v86 = @"%s: path argument is NULL";
    goto LABEL_53;
  }
  embedded_storage_service_query_dict = create_embedded_storage_service_query_dict(a1);
  if (!embedded_storage_service_query_dict)
  {
    ramrod_create_error_cf(a4, @"RamrodErrorDomain", 6, 0, @"%s: failed to allocate device lookup dict", v15, v16, v17, (char)"wait_for_device");
    return 0;
  }
  io_object_t v18 = wait_for_io_service_matching_dict(embedded_storage_service_query_dict, 0x1Eu);
  if (!v18)
  {
    ramrod_create_error_cf(a4, @"RamrodErrorDomain", 4, 0, @"%s: failed to lookup IO service for %s", v19, v20, v21, (char)"wait_for_device");
    return 0;
  }
  io_object_t v22 = v18;
  IOObjectRetain(v18);
  io_registry_entry_t v23 = v22;
  do
  {
    iterator.io_object_t st_dev = 0;
    if (IORegistryEntryGetChildIterator(v23, "IOService", (io_iterator_t *)&iterator))
    {
      uint64_t v44 = "Could not create child iterator\n";
LABEL_22:
      ramrod_log_msg(v44, v24, v25, v26, v27, v28, v29, v30, v87);
      io_object_t st_dev = 0;
      goto LABEL_23;
    }
    io_object_t v31 = IOIteratorNext(iterator.st_dev);
    int v32 = 0;
    if (!v31)
    {
      io_object_t st_dev = iterator.st_dev;
LABEL_21:
      IOObjectRelease(st_dev);
      char v87 = v32;
      uint64_t v44 = "Found %d child nodes (expected 1)\n";
      goto LABEL_22;
    }
    io_object_t st_dev = 0;
    do
    {
      if (st_dev) {
        IOObjectRelease(v31);
      }
      else {
        io_object_t st_dev = v31;
      }
      io_object_t v31 = IOIteratorNext(iterator.st_dev);
      ++v32;
    }
    while (v31);
    IOObjectRelease(iterator.st_dev);
    if (v32 != 1) {
      goto LABEL_21;
    }
    IOObjectRelease(v23);
    io_registry_entry_t v23 = st_dev;
  }
  while (!IOObjectConformsTo(st_dev, "IOMedia"));
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(st_dev, @"Whole", kCFAllocatorDefault, 0);
  CFBooleanRef v42 = CFProperty;
  if (CFProperty)
  {
    CFTypeID v43 = CFGetTypeID(CFProperty);
    if (v43 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue(v42))
      {
        io_registry_entry_t v23 = 0;
        goto LABEL_49;
      }
      uint64_t v71 = "Expected Whole=true\n";
    }
    else
    {
      uint64_t v71 = "Expected Whole to be BOOLean\n";
    }
  }
  else
  {
    uint64_t v71 = "Did not find Whole property on IOMedia class\n";
  }
  ramrod_log_msg(v71, v35, v36, v37, v38, v39, v40, v41, v87);
  io_registry_entry_t v23 = st_dev;
  io_object_t st_dev = 0;
LABEL_49:
  CFRelease(v42);
  if (v23) {
LABEL_23:
  }
    IOObjectRelease(v23);
  if (st_dev)
  {
    CFStringRef v48 = (const __CFString *)IORegistryEntryCreateCFProperty(st_dev, @"BSD Name", kCFAllocatorDefault, 0);
    if (v48)
    {
      CFStringRef v52 = v48;
      CFTypeID v53 = CFGetTypeID(v48);
      if (v53 == CFStringGetTypeID())
      {
        strlcpy(a2, "/dev/", a3);
        size_t v57 = strlen(a2);
        if (CFStringGetCString(v52, &a2[v57], a3 - v57, 0x8000100u))
        {
          ramrod_log_msg("Using device path %s for %s\n", v58, v59, v60, v61, v62, v63, v64, (char)a2);
          int v65 = -10;
          while (1)
          {
            memset(&iterator, 0, sizeof(iterator));
            if (!stat(a2, &iterator))
            {
              uint64_t v70 = 1;
              goto LABEL_43;
            }
            if (*__error() != 2) {
              break;
            }
            sleep(3u);
            if (__CFADD__(v65++, 1)) {
              goto LABEL_41;
            }
          }
          uint64_t v72 = __error();
          strerror(*v72);
          ramrod_log_msg("stat error while waiting for device '%s': %s\n", v73, v74, v75, v76, v77, v78, v79, (char)a2);
          CFIndex v80 = *__error();
          uint64_t v81 = __error();
          strerror(*v81);
          ramrod_create_error_cf(a4, kCFErrorDomainPOSIX, v80, 0, @"%s: stat error while waiting for device '%s': %s", v82, v83, v84, (char)"wait_for_device");
LABEL_41:
          ramrod_create_error_cf(a4, @"RamrodErrorDomain", 4, 0, @"%s: timeout waiting for %s", v66, v67, v68, (char)"wait_for_device");
        }
        else
        {
          ramrod_create_error_cf(a4, @"RamrodErrorDomain", 5, 0, @"%s: failed to create C string from BSD name", v62, v63, v64, (char)"wait_for_device");
        }
      }
      else
      {
        ramrod_create_error_cf(a4, @"RamrodErrorDomain", 3, 0, @"%s: returnbed BSD device name for service %s is wrong type", v54, v55, v56, (char)"wait_for_device");
      }
      uint64_t v70 = 0;
LABEL_43:
      CFRelease(v52);
    }
    else
    {
      ramrod_create_error_cf(a4, @"RamrodErrorDomain", 4, 0, @"%s: no BSD device name for service %s", v49, v50, v51, (char)"wait_for_device");
      uint64_t v70 = 0;
    }
    IOObjectRelease(st_dev);
  }
  else
  {
    ramrod_create_error_cf(a4, @"RamrodErrorDomain", 4, 0, @"%s: failed to lookup whole node for IO service for %s", v45, v46, v47, (char)"wait_for_device");
    uint64_t v70 = 0;
  }
  IOObjectRelease(v22);
  return v70;
}

uint64_t ramrod_probe_media(CFTypeRef *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _last_ramrod_probe_func = (uint64_t)ramrod_probe_media;
  return ramrod_probe_media_internal(3, a1, a3, a4, a5, a6, a7, a8);
}

uint64_t ramrod_probe_media_internal(uint64_t a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  kern_return_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  io_object_t v40;
  uint64_t v41;
  CFTypeRef v42;
  io_object_t v44;
  char v45;
  kern_return_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  kern_return_t v50;
  BOOL v51;
  CFStringRef Value;
  CFStringRef v53;
  CFTypeID v54;
  size_t v55;
  const void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const void *v64;
  CFStringRef v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  char *v104;
  char v105;
  CFBooleanRef v106;
  io_object_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  kern_return_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  char *v123;
  CFNumberRef v124;
  CFStringRef v125;
  __CFArray *v126;
  CFStringRef v127;
  CFStringRef v128;
  char v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  CFStringRef v133;
  CFIndex v134;
  CFStringRef v135;
  int v136;
  CFStringRef v137;
  CFStringRef v138;
  const char *v139;
  char *v140;
  char *theArray;
  __CFArray *theArraya;
  char *v143;
  char *v144;
  char *v145;
  char *v146;
  char *v147;
  char *v148;
  char *v149;
  char *v150;
  char *v151;
  char *v152;
  char *v153;
  char *__s2;
  int v155;
  uint64_t v156;
  char *v157;
  int v158;
  CFMutableDictionaryRef properties;
  io_iterator_t iterator;
  CFTypeRef cf;
  char buffer[16];
  long long v163;
  io_name_t name;

  CFTypeRef cf = 0;
  stat iterator = 0;
  ramrod_log_msg("entering %s\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (char)"ramrod_probe_media_internal");
  storage_device_node_path_0 = 0;
  apfs_container_device_node_path_0 = 0;
  apfs_recovery_os_container_device_node_path_0 = 0;
  system_device_node_path_0 = 0;
  data_device_node_path_0 = 0;
  user_device_node_path_0 = 0;
  update_device_node_path_0 = 0;
  baseband_data_partition_device_node_path_0 = 0;
  log_partition_device_node_path = 0;
  xart_partition_node_path = 0;
  hardware_partition_node_path = 0;
  scratch_partition_node_path = 0;
  preboot_partition_device_node_path_0 = 0;
  recovery_os_volume_device_node_path_0 = 0;
  iboot_system_container_device_node_path_0 = 0;
  recovery_preboot_partition_device_node_path = 0;
  isc_preboot_partition_device_node_path = 0;
  isc_recovery_os_volume_device_node_path = 0;
  paired_recovery_os_volume_device_node_path = 0;
  if (additional_encrypted_volume_node_paths)
  {
    CFRelease((CFTypeRef)additional_encrypted_volume_node_paths);
    additional_encrypted_volume_node_paths = 0;
  }
  if (additional_eds_volume_node_paths)
  {
    CFRelease((CFTypeRef)additional_eds_volume_node_paths);
    additional_eds_volume_node_paths = 0;
  }
  CFArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!Mutable)
  {
    ramrod_create_error_cf((CFErrorRef *)&cf, @"RamrodErrorDomain", 6, 0, @"%s: unable to allocate array for additional eds volumes", v10, v11, v12, (char)"ramrod_probe_media_internal");
    CFMutableArrayRef v18 = 0;
    goto LABEL_12;
  }
  CFMutableArrayRef v18 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!v18)
  {
    ramrod_create_error_cf((CFErrorRef *)&cf, @"RamrodErrorDomain", 6, 0, @"%s: unable to allocate array for additional encrypted volumes", v15, v16, v17, (char)"ramrod_probe_media_internal");
    goto LABEL_12;
  }
  using_LwVM = 0;
  using_APFS_0 = 0;
  if (!wait_for_device("EmbeddedDeviceTypeRoot", &storage_device_node_path_0, 0x20uLL, (CFErrorRef *)&cf, v14, v15, v16, v17))
  {
    ramrod_log_msg("Unable to find storage device node for service named: %s", v19, v20, v21, v22, v23, v24, v25, (char)"EmbeddedDeviceTypeRoot");
LABEL_12:
    uint64_t v40 = 0;
    io_registry_entry_t v35 = 0;
    goto LABEL_13;
  }
  CFDictionaryRef v26 = IOBSDNameMatching(kIOMasterPortDefault, 0, byte_10006CB87);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v26);
  io_registry_entry_t v35 = MatchingService;
  if (!MatchingService)
  {
    ramrod_log_msg("unable to find service for %s\n", v28, v29, v30, v31, v32, v33, v34, (char)byte_10006CB87);
LABEL_19:
    uint64_t v40 = 0;
    goto LABEL_20;
  }
  IOServiceWaitQuiet(MatchingService, 0);
  uint64_t v36 = IORegistryEntryCreateIterator(v35, "IOService", 1u, &iterator);
  if (v36)
  {
    ramrod_create_error_cf((CFErrorRef *)&cf, kCFErrorDomainMach, v36, 0, @"%s: unable to create child iterator", v37, v38, v39, (char)"ramrod_probe_media_internal");
    uint64_t v40 = 0;
LABEL_13:
    uint64_t v41 = 0;
    goto LABEL_14;
  }
  uint64_t v156 = a1;
  uint64_t v44 = IOIteratorNext(iterator);
  if (v44)
  {
    uint64_t v40 = v44;
    __s2 = 0;
    uint64_t v155 = 0;
    uint64_t v157 = 0;
    id v143 = 0;
    uint64_t v144 = 0;
    unint64_t v145 = 0;
    int v146 = 0;
    uint64_t v147 = 0;
    uint64_t v148 = 0;
    uint64_t v149 = 0;
    uint64_t v150 = 0;
    uint64_t v151 = 0;
    uint64_t v152 = 0;
    uint64_t v153 = 0;
    uint64_t v45 = 0;
    while (1)
    {
      if (!IOObjectConformsTo(v40, "IOMedia"))
      {
        if (IOObjectConformsTo(v40, "IOPartitionScheme"))
        {
          if (IOObjectConformsTo(v40, "IOGUIDPartitionScheme"))
          {
            ramrod_log_msg("device partitioning scheme is GPT\n", v96, v97, v98, v99, v100, v101, v102, (char)v139);
            uint64_t v153 = "Data";
            __s2 = "System";
            uint64_t v151 = "Update";
            uint64_t v152 = "User";
            uint64_t v149 = "Logs";
            uint64_t v150 = "Baseband Data";
            uint64_t v147 = "Hardware";
            uint64_t v148 = "xART";
            int v146 = "Scratch";
          }
          else
          {
            if (!IOObjectConformsTo(v40, "AppleAPFSContainer"))
            {
              ramrod_create_error_cf((CFErrorRef *)&cf, kCFErrorDomainMach, -536870201, 0, @"%s: unrecognized partitioning scheme", v119, v120, v121, (char)"ramrod_probe_media_internal");
              goto LABEL_13;
            }
            ramrod_log_msg("device is APFS formatted\n", v115, v116, v117, v118, v119, v120, v121, (char)v139);
            uint64_t v153 = "Data";
            __s2 = "System";
            uint64_t v151 = "Update";
            uint64_t v152 = "User";
            uint64_t v149 = "Logs";
            uint64_t v150 = "Baseband Data";
            uint64_t v147 = "Hardware";
            uint64_t v148 = "xART";
            unint64_t v145 = "Preboot";
            int v146 = "Scratch";
            id v143 = "Recovery";
            uint64_t v144 = "iSCPreboot";
          }
        }
        goto LABEL_129;
      }
      properties = 0;
      memset(name, 0, sizeof(name));
      uint64_t v46 = IORegistryEntryGetName(v40, name);
      if (v46)
      {
        uint64_t v133 = kCFErrorDomainMach;
        uint64_t v134 = v46;
        uint64_t v135 = @"%s: unable to get name for media registry entry";
        goto LABEL_174;
      }
      uint64_t v50 = IORegistryEntryCreateCFProperties(v40, &properties, kCFAllocatorDefault, 0);
      if (v50)
      {
        uint64_t v133 = kCFErrorDomainMach;
        uint64_t v134 = v50;
        uint64_t v135 = @"%s: unable to get properties for media registry entry";
LABEL_174:
        ramrod_create_error_cf((CFErrorRef *)&cf, v133, v134, 0, v135, v47, v48, v49, (char)"ramrod_probe_media_internal");
LABEL_175:
        uint64_t v136 = 1;
        goto LABEL_179;
      }
      if (v45)
      {
        uint64_t v51 = 1;
      }
      else
      {
        *(_OWORD *)buffer = 0u;
        uint64_t v163 = 0u;
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(properties, @"BSD Name");
        if (Value)
        {
          CFTypeID v53 = Value;
          uint64_t v54 = CFGetTypeID(Value);
          uint64_t v51 = v54 == CFStringGetTypeID()
             && CFStringGetCString(v53, buffer, 32, 0x600u)
             && (uint64_t v55 = strlen(byte_10006CB87), !strncmp(buffer, byte_10006CB87, v55))
             && strcmp("s1s1", &buffer[v55]) == 0;
        }
        else
        {
          uint64_t v51 = 0;
        }
      }
      uint64_t v158 = v51;
      uint64_t v56 = CFDictionaryGetValue(properties, @"Content Hint");
      if (!v56)
      {
LABEL_83:
        if (__s2 && (!strcmp(name, __s2) || strstr(name, "OS") || strstr(name, "System")))
        {
          if (!v158)
          {
            uint64_t v140 = name;
            ramrod_log_msg("found system volume not at %ss1s1: %s\n", v57, v58, v59, v60, v61, v62, v63, (char)&storage_device_node_path_0);
          }
          goto LABEL_89;
        }
        uint64_t v103 = v158;
        if (v153 && !strcmp(name, v153))
        {
          uint64_t v104 = &data_device_node_path_0;
          goto LABEL_90;
        }
        if (v152 && !strcmp(name, v152))
        {
          uint64_t v104 = &user_device_node_path_0;
          goto LABEL_90;
        }
        if (v151 && !strcmp(name, v151))
        {
          uint64_t v104 = &update_device_node_path_0;
          goto LABEL_90;
        }
        if (v150 && !strcmp(name, v150))
        {
          uint64_t v104 = &baseband_data_partition_device_node_path_0;
          goto LABEL_90;
        }
        if (v149 && !strcmp(name, v149))
        {
          uint64_t v104 = &log_partition_device_node_path;
          goto LABEL_90;
        }
        if (v148 && !strcmp(name, v148))
        {
          if (!xart_partition_node_path || !ramrod_should_have_xart_partition())
          {
            uint64_t v105 = 0;
            theArray = &xart_partition_node_path;
            goto LABEL_92;
          }
          uint64_t v137 = kCFErrorDomainMach;
LABEL_183:
          uint64_t v138 = @"%s: encountered second '%s' partition; original was '%s'";
LABEL_184:
          ramrod_create_error_cf((CFErrorRef *)&cf, v137, -536870911, 0, v138, v61, v62, v63, (char)"ramrod_probe_media_internal");
LABEL_178:
          uint64_t v136 = 0;
LABEL_179:
          uint64_t v41 = 0;
          if (v156 >= 1 && v136)
          {
            sleep(1u);
            uint64_t v41 = ramrod_probe_media_internal(v156 - 1, 0);
          }
LABEL_14:
          CFBooleanRef v42 = cf;
          if (a2 && !v41 && cf)
          {
            uint64_t v41 = 0;
            *a2 = CFRetain(cf);
            goto LABEL_21;
          }
          goto LABEL_22;
        }
        if (v147 && !strcmp(name, v147))
        {
          uint64_t v104 = &hardware_partition_node_path;
          goto LABEL_90;
        }
        if (v146 && !strcmp(name, v146))
        {
          uint64_t v104 = &scratch_partition_node_path;
          goto LABEL_90;
        }
        if (v145 && !strcmp(name, v145))
        {
          if (v155 != 1)
          {
            if (v155 == 2)
            {
              ramrod_log_msg("Captured preboot partition on main OS container %d\n", v57, v58, v59, v60, v61, v62, v63, 2);
              uint64_t v104 = &preboot_partition_device_node_path_0;
            }
            else
            {
              if (v155 != 3) {
                goto LABEL_160;
              }
              ramrod_log_msg("Captured preboot partition on recovery container %d\n", v57, v58, v59, v60, v61, v62, v63, 3);
              uint64_t v104 = &recovery_preboot_partition_device_node_path;
            }
            goto LABEL_90;
          }
          char v129 = 1;
        }
        else
        {
          if (!v144 || strcmp(name, v144))
          {
            if (v143 && !strcmp(name, v143))
            {
              uint64_t v104 = &recovery_os_volume_device_node_path_0;
            }
            else
            {
              if (!v158 || system_device_node_path_0)
              {
                ramrod_log_msg("unexpected partition '%s' - skipping\n", v57, v58, v59, v60, v61, v62, v63, (char)name);
LABEL_160:
                theArray = 0;
                uint64_t v105 = 1;
                goto LABEL_92;
              }
              ramrod_log_msg("looking for a system volume, and found unknown volume '%s'. using it as the system volume.\n", v57, v58, v59, v60, v61, v62, v63, (char)name);
LABEL_89:
              uint64_t v103 = 1;
              uint64_t v104 = &system_device_node_path_0;
            }
LABEL_90:
            if (*v104)
            {
              uint64_t v137 = kCFErrorDomainMach;
              goto LABEL_183;
            }
            theArray = v104;
            LOBYTE(v158) = v103;
            uint64_t v105 = 0;
LABEL_92:
            while (1)
            {
              uint64_t v106 = (const __CFBoolean *)CFDictionaryGetValue(properties, @"Leaf");
              if (v106)
              {
                if (CFBooleanGetValue(v106) == 1) {
                  break;
                }
              }
              IOObjectRelease(v40);
              CFRelease(properties);
              uint64_t v107 = IOIteratorNext(iterator);
              if (!v107)
              {
LABEL_176:
                ramrod_create_error_cf((CFErrorRef *)&cf, kCFErrorDomainMach, -536870911, 0, @"%s: ran out of registry entries without finding a leaf media object", v108, v109, v110, (char)"ramrod_probe_media_internal");
                uint64_t v136 = 0;
                uint64_t v40 = 0;
                goto LABEL_179;
              }
              uint64_t v40 = v107;
              while (!IOObjectConformsTo(v40, "IOMedia"))
              {
                IOObjectRelease(v40);
                uint64_t v40 = IOIteratorNext(iterator);
                if (!v40) {
                  goto LABEL_176;
                }
              }
              uint64_t v111 = IORegistryEntryCreateCFProperties(v40, &properties, kCFAllocatorDefault, 0);
              if (v111)
              {
                ramrod_create_error_cf((CFErrorRef *)&cf, kCFErrorDomainMach, v111, 0, @"%s: unable to get properties for media registry entry", v112, v113, v114, (char)"ramrod_probe_media_internal");
                goto LABEL_178;
              }
            }
            if (v105)
            {
              if (CFDictionaryGetValue(properties, @"Encrypted") == kCFBooleanTrue)
              {
                char v122 = (char *)CFDictionaryGetValue(properties, @"BSD Name");
                if (v122)
                {
                  pid_t v123 = v122;
                  *(_WORD *)buffer = 0;
                  posix_spawnattr_t v124 = (const __CFNumber *)CFDictionaryGetValue(properties, @"RoleValue");
                  if (v124) {
                    CFNumberGetValue(v124, kCFNumberSInt16Type, buffer);
                  }
                  if (*(unsigned __int16 *)buffer == 576) {
                    posix_spawn_file_actions_t v125 = @"Found additional enterprise volume at %@\n";
                  }
                  else {
                    posix_spawn_file_actions_t v125 = @"Found additional encrypted volume at %@\n";
                  }
                  if (*(unsigned __int16 *)buffer == 576) {
                    uint64_t v126 = Mutable;
                  }
                  else {
                    uint64_t v126 = v18;
                  }
                  theArraya = v126;
                  ramrod_log_msg_cf(v125, v123, v140);
                  uint64_t v139 = "/dev/";
                  uint64_t v140 = v123;
                  uint64_t v127 = CFStringCreateWithFormat(0, 0, @"%s%@");
                  CFArrayAppendValue(theArraya, v127);
                  CFRelease(v127);
                }
              }
            }
            else
            {
              size_t v128 = (const __CFString *)CFDictionaryGetValue(properties, @"BSD Name");
              if (!v128)
              {
                uint64_t v137 = kCFErrorDomainMach;
                uint64_t v138 = @"%s: leaf media object with no bsd name";
                goto LABEL_184;
              }
              *(_OWORD *)buffer = 0u;
              uint64_t v163 = 0u;
              CFStringGetCString(v128, buffer, 32, 0x8000100u);
              snprintf(theArray, 0x20uLL, "%s%s", "/dev/", buffer);
            }
            CFRelease(properties);
            uint64_t v45 = v158;
LABEL_129:
            IOObjectRelease(v40);
            goto LABEL_78;
          }
          char v129 = v155;
        }
        ramrod_log_msg("Captured preboot partition on ISC %d\n", v57, v58, v59, v60, v61, v62, v63, v129);
        uint64_t v104 = &isc_preboot_partition_device_node_path;
        goto LABEL_90;
      }
      uint64_t v64 = v56;
      if (!CFEqual(v56, @"LightweightVolumeManager_Media")) {
        break;
      }
      using_LwVM = 1;
LABEL_77:
      uint64_t v45 = v158;
      CFRelease(properties);
LABEL_78:
      uint64_t v40 = IOIteratorNext(iterator);
      if (!v40) {
        goto LABEL_166;
      }
    }
    if (!CFEqual(v64, @"7C3457EF-0000-11AA-AA11-00306543ECAC")
      && !CFEqual(v64, @"52637672-7900-11AA-AA11-00306543ECAC")
      && !CFEqual(v64, @"69646961-6700-11AA-AA11-00306543ECAC")
      && !CFEqual(v64, @"EF57347C-0000-11AA-AA11-00306543ECAC"))
    {
      goto LABEL_83;
    }
    int v65 = (const __CFString *)CFDictionaryGetValue(properties, @"BSD Name");
    if (!v65)
    {
      ramrod_log_msg("APFS Container object with no bsd name", v66, v67, v68, v69, v70, v71, v72, (char)v139);
      goto LABEL_178;
    }
    *(_OWORD *)buffer = 0u;
    uint64_t v163 = 0u;
    CFStringGetCString(v65, buffer, 32, 0x8000100u);
    if (CFEqual(v64, @"7C3457EF-0000-11AA-AA11-00306543ECAC") == 1)
    {
      if (strstr(name, "RecoveryOSContainer"))
      {
        uint64_t v155 = 3;
        uint64_t v73 = &apfs_recovery_os_container_device_node_path_0;
      }
      else
      {
        if (*(void *)name ^ 0x737953746F6F4269 | *(void *)&name[8] ^ 0x61746E6F436D6574 | *(void *)&name[13] ^ 0x72656E6961746ELL) {
          uint64_t v73 = &apfs_container_device_node_path_0;
        }
        else {
          uint64_t v73 = &iboot_system_container_device_node_path_0;
        }
        if (*(void *)name ^ 0x737953746F6F4269 | *(void *)&name[8] ^ 0x61746E6F436D6574 | *(void *)&name[13] ^ 0x72656E6961746ELL) {
          uint64_t v81 = 2;
        }
        else {
          uint64_t v81 = 1;
        }
        uint64_t v155 = v81;
      }
      snprintf(v73, 0x20uLL, "%s%s", "/dev/", buffer);
      uint64_t v140 = v73;
      ramrod_log_msg("APFS Container '%s' %s\n", v82, v83, v84, v85, v86, v87, v88, (char)name);
LABEL_73:
      uint64_t v157 = v73;
      if (!*v73)
      {
        snprintf(v73, 0x20uLL, "%s%s", "/dev/", buffer);
        uint64_t v140 = v73;
        ramrod_log_msg("APFS Container '%s' %s\n", v89, v90, v91, v92, v93, v94, v95, (char)name);
      }
      goto LABEL_76;
    }
    if (CFEqual(v64, @"EF57347C-0000-11AA-AA11-00306543ECAC") == 1)
    {
      if (v157 && *v157)
      {
        ramrod_log_msg("Found synthesized APFS container. Using %s instead of %s\n", v74, v75, v76, v77, v78, v79, v80, (char)buffer);
        snprintf(v157, 0x20uLL, "%s%s", "/dev/", buffer);
        uint64_t v157 = 0;
        goto LABEL_76;
      }
      ramrod_log_msg("found synthesized container without original device node\n", v74, v75, v76, v77, v78, v79, v80, (char)v139);
    }
    uint64_t v73 = v157;
    if (v157) {
      goto LABEL_73;
    }
    uint64_t v157 = 0;
LABEL_76:
    using_APFS_0 = 1;
    IOObjectRelease(v40);
    goto LABEL_77;
  }
LABEL_166:
  if (!IOIteratorIsValid(iterator))
  {
    ramrod_create_error_cf((CFErrorRef *)&cf, kCFErrorDomainMach, -536870165, 0, @"%s: media iterator invalidated", v130, v131, v132, (char)"ramrod_probe_media_internal");
    uint64_t v40 = 0;
    goto LABEL_175;
  }
  if (CFArrayGetCount(v18) >= 1) {
    additional_encrypted_volume_node_paths = (uint64_t)CFRetain(v18);
  }
  if (CFArrayGetCount(Mutable) < 1) {
    goto LABEL_19;
  }
  uint64_t v40 = 0;
  additional_eds_volume_node_paths = (uint64_t)CFRetain(Mutable);
LABEL_20:
  uint64_t v41 = 1;
LABEL_21:
  CFBooleanRef v42 = cf;
LABEL_22:
  if (v42) {
    CFRelease(v42);
  }
  if (v40) {
    IOObjectRelease(v40);
  }
  if (iterator) {
    IOObjectRelease(iterator);
  }
  if (v35) {
    IOObjectRelease(v35);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v41;
}

uint64_t ramrod_get_system_partition_device_node(char *a1, size_t __size)
{
  if (!system_device_node_path_0) {
    return 0;
  }
  strlcpy(a1, &system_device_node_path_0, __size);
  return 1;
}

uint64_t ramrod_hardware_partition_supports_bics()
{
  return ramrod_get_gestalt_BOOLean_answer();
}

uint64_t ramrod_get_gestalt_BOOLean_answer()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (!v0) {
    return 0;
  }
  CFBooleanRef v1 = v0;
  CFTypeID v2 = CFGetTypeID(v0);
  if (v2 == CFBooleanGetTypeID()) {
    uint64_t Value = CFBooleanGetValue(v1);
  }
  else {
    uint64_t Value = 0;
  }
  CFRelease(v1);
  return Value;
}

uint64_t ramrod_should_have_xart_partition()
{
  uint64_t v7 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep/iop-sep-nub/xART");
  if (v7)
  {
    ramrod_log_msg("IODeviceTree:/arm-io/sep/iop-sep-nub/xART found\n", v0, v1, v2, v3, v4, v5, v6, v47);
    IOObjectRelease(v7);
    uint64_t v7 = 1;
  }
  io_registry_entry_t v8 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen/has-xart");
  if (v8)
  {
    io_object_t v16 = v8;
    ramrod_log_msg("IODeviceTree:/chosen/has-xart found\n", v9, v10, v11, v12, v13, v14, v15, v47);
    IOObjectRelease(v16);
    uint64_t v7 = 1;
  }
  io_registry_entry_t v17 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/defaults");
  if (!v17)
  {
    ramrod_log_msg("Failed to read IODeviceTree:/defaults\n", v18, v19, v20, v21, v22, v23, v24, v47);
    goto LABEL_22;
  }
  io_object_t v25 = v17;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v17, @"has-xart", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFNumberRef v27 = CFProperty;
    CFTypeID v28 = CFGetTypeID(CFProperty);
    if (v28 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      CFNumberGetValue(v27, kCFNumberSInt32Type, &valuePtr);
      if (valuePtr) {
        uint64_t v36 = "IODeviceTree:/defaults/has-xart found\n";
      }
      else {
        uint64_t v36 = "IODeviceTree:/defaults/has-xart found but is zero\n";
      }
      if (valuePtr) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = v7;
      }
    }
    else
    {
      CFTypeID v44 = CFGetTypeID(v27);
      if (v44 != CFDataGetTypeID()) {
        goto LABEL_20;
      }
      *(_DWORD *)buffer = 0;
      if (CFDataGetLength(v27) == 4)
      {
        v50.location = 0;
        v50.length = 4;
        CFDataGetBytes(v27, v50, buffer);
        if (*(_DWORD *)buffer)
        {
          ramrod_log_msg("IODeviceTree:/defaults/has-xart found\n", v29, v30, v31, v32, v33, v34, v35, v47);
          uint64_t v7 = 1;
          goto LABEL_20;
        }
        uint64_t v36 = "IODeviceTree:/defaults/has-xart found but is zero\n";
      }
      else
      {
        uint64_t v36 = "IODeviceTree:/defaults/has-xart found but is not int sized\n";
      }
    }
    ramrod_log_msg(v36, v29, v30, v31, v32, v33, v34, v35, v47);
LABEL_20:
    CFRelease(v27);
  }
  IOObjectRelease(v25);
LABEL_22:
  if (v7) {
    uint64_t v45 = "We should have an xART partition.\n";
  }
  else {
    uint64_t v45 = "We should not have an xART partition.\n";
  }
  ramrod_log_msg(v45, v37, v38, v39, v40, v41, v42, v43, v47);
  return v7;
}

uint64_t ramrod_get_preboot_partition_device_node(char *a1, size_t __size)
{
  if (!preboot_partition_device_node_path_0) {
    return 0;
  }
  strlcpy(a1, &preboot_partition_device_node_path_0, __size);
  return 1;
}

uint64_t ramrod_change_filesystem_permissions_opt_err(char *a1, char *a2, int a3, CFErrorRef *a4)
{
  char v5 = (char)a1;
  v19[0] = "/sbin/mount";
  v19[1] = "-u";
  uint64_t v6 = "-r";
  if (!a3) {
    uint64_t v6 = "-w";
  }
  void v19[2] = v6;
  v19[3] = a1;
  v19[4] = a2;
  v19[5] = 0;
  uint64_t v14 = ramrod_execute_command(v19);
  if (v14)
  {
    ramrod_log_msg("Failed to change permissions on %s mounted at %s to %s. Error: %d.\n", v7, v8, v9, v10, v11, v12, v13, v5);
    ramrod_create_error_cf(a4, @"RamrodErrorDomain", 7, 0, @"%s: Failed to change permissions on %s mounted at %s to %s. Error: %d.\n", v15, v16, v17, (char)"ramrod_change_filesystem_permissions_opt_err");
  }
  else
  {
    ramrod_log_msg("Changed permissions on %s mounted at %s to %s\n", v7, v8, v9, v10, v11, v12, v13, v5);
  }
  return v14;
}

uint64_t ramrod_mount_filesystem_no_fsck_opt_err(char *a1, char *a2, int a3, CFErrorRef *a4)
{
  bzero(v54, 0x400uLL);
  long long v53 = 0u;
  if (using_APFS_0) {
    uint64_t v15 = "/sbin/mount_apfs";
  }
  else {
    uint64_t v15 = "/sbin/mount_hfs";
  }
  long long v52 = 0uLL;
  long long v51 = 0uLL;
  uint64_t v16 = "-R";
  if (!using_APFS_0) {
    uint64_t v16 = 0;
  }
  long long v50 = 0uLL;
  long long v49 = 0uLL;
  if (using_APFS_0) {
    int v17 = 2;
  }
  else {
    int v17 = 1;
  }
  long long v48 = 0uLL;
  long long v47 = 0uLL;
  v46[0] = v15;
  v46[1] = v16;
  if (a3)
  {
    v46[v17] = "-o";
    int v18 = v17 + 1;
    v17 += 2;
    v46[v18] = "rdonly";
  }
  if (!a2)
  {
    ramrod_log_msg("Creating temporary mount point to mount %s\n", v8, v9, v10, v11, v12, v13, v14, (char)a1);
    a2 = v54;
    __strlcpy_chk();
    if (!mkdtemp(v54))
    {
      uint64_t v19 = __error();
      ramrod_log_msg("unable to create temporary mount directory (%d). Using %s instead\n", v20, v21, v22, v23, v24, v25, v26, *v19);
      a2 = v54;
      __strlcpy_chk();
    }
  }
  v46[v17] = a1;
  v46[v17 + 1] = a2;
  v46[v17 + 2] = 0;
  mkdir(a2, 0x1C0u);
  if (ramrod_execute_command(v46))
  {
    ramrod_log_msg("mounting %s on %s failed\n", v27, v28, v29, v30, v31, v32, v33, (char)a1);
    ramrod_create_error_cf(a4, @"RamrodErrorDomain", 7, 0, @"%s: mounting %s on %s failed", v34, v35, v36, (char)"ramrod_mount_filesystem_no_fsck_opt_err");
    ramrod_dump_mounted_filesystem_info(v37, v38, v39, v40, v41, v42, v43, v44);
    return 0xFFFFFFFFLL;
  }
  else
  {
    ramrod_log_msg("%s mounted on %s\n", v27, v28, v29, v30, v31, v32, v33, (char)a1);
    return 0;
  }
}

void ramrod_dump_mounted_filesystem_info(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  ramrod_log_msg("%s:**********DUMPING MOUNTED FILESYSTEMS********\n", a2, a3, a4, a5, a6, a7, a8, (char)"ramrod_dump_mounted_filesystem_info");
  uint64_t v25 = 0;
  int v8 = getmntinfo(&v25, 2);
  ramrod_log_msg("%s: %d filesystems are mounted\n", v9, v10, v11, v12, v13, v14, v15, (char)"ramrod_dump_mounted_filesystem_info");
  if (v25)
  {
    if (v8 >= 1)
    {
      unint64_t v23 = v8 + 1;
      do
        ramrod_log_msg("%s is mounted at %s\n", v16, v17, v18, v19, v20, v21, v22, (_BYTE)v25 + 120 * (v23-- - 2) + 88);
      while (v23 > 1);
    }
  }
  else
  {
    ramrod_log_msg("Failed to get info regarding mounted filesystems\n", v16, v17, v18, v19, v20, v21, v22, v24);
  }
  ramrod_log_msg("%s: *********DONE DUMPING MOUNTED FILESYSTEMS********\n", v16, v17, v18, v19, v20, v21, v22, (char)"ramrod_dump_mounted_filesystem_info");
}

uint64_t ramrod_unmount_filesystem(char *a1)
{
  return ramrod_force_unmount_filesystem(a1, 0);
}

uint64_t ramrod_get_mount_path(const char *a1, char *a2, size_t a3)
{
  uint64_t v19 = 0;
  int v6 = getmntinfo_r_np(&v19, 2);
  if (!v6)
  {
    ramrod_log_msg("Failed to get list of all mounted file systems\n", v7, v8, v9, v10, v11, v12, v13, v18);
    goto LABEL_8;
  }
  if (v6 < 1)
  {
LABEL_8:
    uint64_t v16 = 1;
    goto LABEL_9;
  }
  uint64_t v14 = v6;
  f_mntfromio_name_t name = v19->f_mntfromname;
  while (strcmp(a1, f_mntfromname))
  {
    f_mntfromname += 2168;
    if (!--v14) {
      goto LABEL_8;
    }
  }
  strlcpy(a2, f_mntfromname - 1024, a3);
  uint64_t v16 = 0;
LABEL_9:
  if (v19) {
    free(v19);
  }
  return v16;
}

uint64_t ramrod_force_unmount_filesystem(char *a1, int a2)
{
  int v3 = (a2 != 0) << 19;
  v60[0] = off_10005A7D8;
  v60[1] = unk_10005A7E8;
  if (a2)
  {
    *((void *)&v60[0] + 1) = "-f";
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 1;
  }
  char v5 = (void *)v60 + v4;
  *char v5 = a1;
  v5[1] = 0;
  int v6 = 3;
  while (1)
  {
    uint64_t v59 = 0;
    long long v58 = xmmword_100050AA8;
    memset(v56, 0, sizeof(v56));
    int v57 = 0;
    if (!getattrlist(a1, &v58, v56, 0x1CuLL, 8u) && (v57 & 1) == 0)
    {
      ramrod_log_msg("Tried to unmount a volume at '%s' that wasn't mounted. Ignoring the error.\n", v7, v8, v9, v10, v11, v12, v13, (char)a1);
      return 0;
    }
    if (!unmount(a1, v3)) {
      return 0;
    }
    uint64_t v14 = __error();
    uint64_t v15 = *v14;
    BOOL v16 = v15 == 35 || v15 == 16;
    int v17 = *v14;
    if (!v16) {
      break;
    }
LABEL_15:
    strerror(v17);
    ramrod_log_msg("Unmounting '%s' failed with %d: %s.\n", v18, v19, v20, v21, v22, v23, v24, (char)a1);
    ramrod_dump_mounted_filesystem_info(v25, v26, v27, v28, v29, v30, v31, v32);
    ramrod_log_msg("Will retry unmounting '%s' in %u seconds.\n", v33, v34, v35, v36, v37, v38, v39, (char)a1);
    sleep(3u);
    if (!--v6) {
      return v15;
    }
  }
  if (v15 == 1)
  {
    if (!ramrod_execute_command((char *const *)v60)) {
      return 0;
    }
    int v17 = 1;
    goto LABEL_15;
  }
  strerror(*v14);
  ramrod_log_msg("Unmounting '%s' failed with %d: %s.\n", v41, v42, v43, v44, v45, v46, v47, (char)a1);
  ramrod_dump_mounted_filesystem_info(v48, v49, v50, v51, v52, v53, v54, v55);
  return v15;
}

BOOL _find_tagged_regex(const char *a1, regoff_t a2, char *a3, void *a4, void *a5)
{
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  memset(&v20, 0, sizeof(v20));
  int v9 = regcomp(&v20, a3, 265);
  if (v9)
  {
    long long v27 = 0uLL;
    long long v28 = 0uLL;
    long long v25 = 0uLL;
    long long v26 = 0uLL;
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    regmatch_t __pmatch = (regmatch_t)0;
    long long v22 = 0uLL;
    regerror(v9, &v20, (char *)&__pmatch, 0x80uLL);
    ramrod_log_msg("regcomp failed: %s\n", v13, v14, v15, v16, v17, v18, v19, (char)&__pmatch);
    return 0;
  }
  else
  {
    long long v29 = 0uLL;
    long long v30 = 0uLL;
    long long v27 = 0uLL;
    long long v28 = 0uLL;
    long long v25 = 0uLL;
    long long v26 = 0uLL;
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    __pmatch.rm_so = 0;
    long long v22 = 0uLL;
    __pmatch.rm_eo = a2;
    int v10 = regexec(&v20, a1, 0xAuLL, &__pmatch, 7);
    BOOL v11 = v10 == 0;
    if (!v10)
    {
      if (a4) {
        *a4 = &a1[v22];
      }
      if (a5) {
        *a5 = *((void *)&v22 + 1) - v22;
      }
    }
    regfree(&v20);
  }
  return v11;
}

uint64_t ___ramrod_execute_command_with_input_data_output_block_block_invoke(uint64_t a1, posix_spawn_file_actions_t *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    posix_spawn_file_actions_adddup2(a2, 1, 2);
  }
  return 0;
}

uint64_t ___ramrod_execute_command_with_input_data_output_block_block_invoke_2(uint64_t a1, int __fd)
{
  int64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 1)
  {
    uint64_t v4 = *(char **)(a1 + 32);
    while (1)
    {
      ssize_t v5 = write(__fd, v4, v2);
      if (v5 == -1) {
        break;
      }
      v4 += v5;
      BOOL v6 = v2 <= v5;
      v2 -= v5;
      if (v6) {
        return 0;
      }
    }
    uint64_t v7 = __error();
    char v8 = strerror(*v7);
    ramrod_log_msg("write failed for subprocess: %s\n", v9, v10, v11, v12, v13, v14, v15, v8);
  }
  return 0;
}

void ramrod_create_error_cf(CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void ramrod_create_error_internal_va(CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, va_list a6)
{
  if (a1)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      uint64_t v13 = Mutable;
      CFStringRef v14 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, a5, a6);
      if (v14)
      {
        CFStringRef v15 = v14;
        CFDictionaryAddValue(v13, kCFErrorDescriptionKey, v14);
        CFRelease(v15);
      }
      if (a4) {
        CFDictionaryAddValue(v13, kCFErrorUnderlyingErrorKey, a4);
      }
      *a1 = CFErrorCreate(kCFAllocatorDefault, a2, a3, v13);
      CFRelease(v13);
    }
  }
}

id _options_get_BOOL(void *a1, uint64_t a2)
{
  id v2 = [a1 objectForKeyedSubscript:a2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

uint64_t _remove_path_if_exists(void *a1, uint64_t a2)
{
  uint64_t v4 = +[NSFileManager defaultManager];
  if (![(NSFileManager *)v4 fileExistsAtPath:a1]) {
    return 1;
  }
  char v5 = [a1 fileSystemRepresentation];
  ramrod_log_msg("Removing %s\n", v6, v7, v8, v9, v10, v11, v12, v5);
  uint64_t result = [(NSFileManager *)v4 removeItemAtPath:a1 error:a2];
  if (result) {
    return 1;
  }
  return result;
}

id _get_os_preboot_path(void *a1)
{
  id v2 = [a1 objectForKeyedSubscript:@"PrebootDirOverride"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !v2)
  {
    id v2 = [a1 objectForKeyedSubscript:@"PrebootMountpoint"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !v2)
    {
      ramrod_log_msg("%s: RAMROD_SPLAT_OPT_PREBOOT_MOUNTPOINT is required\n", v3, v4, v5, v6, v7, v8, v9, (char)"_get_os_preboot_path");
      return 0;
    }
  }
  return v2;
}

BOOL _get_splat_preboot_paths(void *a1, void *a2, void *a3, void *a4, CFErrorRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (_options_get_BOOL(a2, @"SafariDownlevelUpdate")) {
      CFStringRef v11 = @"downlevel";
    }
    else {
      CFStringRef v11 = @"cryptex1";
    }
    id v12 = [a1 stringByAppendingPathComponent:v11];
    uint64_t v13 = v12;
    if (a3) {
      *a3 = [v12 stringByAppendingPathComponent:@"current"];
    }
    if (a4) {
      *a4 = [v13 stringByAppendingPathComponent:@"proposed"];
    }
  }
  else
  {
    ramrod_log_msg("%s: %s\n", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, (char)"_get_splat_preboot_paths");
    ramrod_create_error_cf(a5, @"RamrodErrorDomain", 2001, 0, @"%s", v15, v16, v17, (char)"preboot directory is nil");
  }
  return a1 != 0;
}

uint64_t ramrod_splat_cleanup(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  ramrod_log_msg("%s: Cleaning up proposed directory in preboot\n", a2, a3, a4, a5, a6, a7, a8, (char)"ramrod_splat_cleanup");
  CFStringRef v14 = 0;
  id os_preboot_path = _get_os_preboot_path(a1);
  uint64_t result = _get_splat_preboot_paths(os_preboot_path, a1, 0, &v14, 0, v10, v11, v12);
  if (result) {
    return _remove_path_if_exists(v14, 0);
  }
  return result;
}

uint64_t ramrod_create_directory_with_class(unsigned char *a1, mode_t a2, uid_t a3, gid_t a4, int a5, int a6)
{
  if (!a1 || *a1 != 47) {
    return 22;
  }
  bzero(&v71, 0x400uLL);
  uint64_t v11 = v72;
  __strlcpy_chk();
  while (1)
  {
    uint64_t v12 = strchr(v11, 47);
    uint64_t v13 = v12;
    if (v12) {
      *uint64_t v12 = 0;
    }
    memset(&v70, 0, sizeof(v70));
    if (lstat(&v71, &v70))
    {
      if (*__error() != 2)
      {
        uint64_t v21 = *__error();
        long long v22 = __error();
        strerror(*v22);
        ramrod_log_msg("lstat %s failed: %s\n", v23, v24, v25, v26, v27, v28, v29, (char)&v71);
        return v21;
      }
      if (a6) {
        ramrod_log_msg("creating directory (owner=%d group=%d mode=%o, class=%d) %s\n", v14, v15, v16, v17, v18, v19, v20, a3);
      }
      if (mkdir(&v71, a2 & 0x1FF))
      {
        uint64_t v21 = *__error();
        long long v30 = __error();
        char v63 = strerror(*v30);
        ramrod_log_msg("mkdir failed: %s\n", v31, v32, v33, v34, v35, v36, v37, v63);
        return v21;
      }
      if (chmod(&v71, a2))
      {
        uint64_t v21 = *__error();
        uint64_t v38 = __error();
        char v64 = strerror(*v38);
        ramrod_log_msg("chmod failed: %s\n", v39, v40, v41, v42, v43, v44, v45, v64);
        return v21;
      }
      if (chown(&v71, a3, a4))
      {
        uint64_t v21 = *__error();
        uint64_t v46 = __error();
        char v65 = strerror(*v46);
        ramrod_log_msg("chown failed: %s\n", v47, v48, v49, v50, v51, v52, v53, v65);
        return v21;
      }
      if ((a5 & 0x80000000) == 0)
      {
        uint64_t v69 = 0;
        long long v68 = xmmword_100050AC0;
        int v67 = a5;
        if (setattrlist(&v71, &v68, &v67, 4uLL, 0)) {
          break;
        }
      }
    }
    if (!v13) {
      return 0;
    }
    *uint64_t v13 = 47;
    uint64_t v11 = v13 + 1;
  }
  uint64_t v21 = *__error();
  uint64_t v54 = __error();
  char v66 = strerror(*v54);
  ramrod_log_msg("setattrlist failed: %s\n", v55, v56, v57, v58, v59, v60, v61, v66);
  return v21;
}

uint64_t ramrod_create_directory(unsigned char *a1, mode_t a2, uid_t a3, gid_t a4)
{
  return ramrod_create_directory_with_class(a1, a2, a3, a4, -1, 1);
}

void submitRestoreLogFileToLogDir_cold_1()
{
}

void __os_cleanup_iorelease_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  OUTLINED_FUNCTION_0(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  _os_crash_msg();
  __break(1u);
}

void __os_cleanup_iorelease_cold_1_0(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg();
  __break(1u);
}

void __os_cleanup_ioclose_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg();
  __break(1u);
}

void __os_cleanup_iorelease_cold_1_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg();
  __break(1u);
}

uint64_t AMAuthInstallApImg4EncodeRestoreInfo()
{
  return _AMAuthInstallApImg4EncodeRestoreInfo();
}

uint64_t AMSupportCreateURLFromString()
{
  return _AMSupportCreateURLFromString();
}

uint64_t AMSupportLogInternal()
{
  return _AMSupportLogInternal();
}

uint64_t AMSupportSafeFree()
{
  return _AMSupportSafeFree();
}

uint64_t AMSupportSafeRelease()
{
  return _AMSupportSafeRelease();
}

uint64_t APFSContainerGetSpaceInfo()
{
  return _APFSContainerGetSpaceInfo();
}

uint64_t APFSDecodeMetricsString()
{
  return _APFSDecodeMetricsString();
}

uint64_t APFSShouldSealSystemVolume()
{
  return _APFSShouldSealSystemVolume();
}

uint64_t APFSVolumeCreate()
{
  return _APFSVolumeCreate();
}

uint64_t APFSVolumeCreateForMSU()
{
  return _APFSVolumeCreateForMSU();
}

uint64_t APFSVolumeDelete()
{
  return _APFSVolumeDelete();
}

uint64_t APFSVolumeGetSpaceInfo()
{
  return _APFSVolumeGetSpaceInfo();
}

uint64_t APFSVolumeGetVEKState()
{
  return _APFSVolumeGetVEKState();
}

uint64_t APFSVolumeRole()
{
  return _APFSVolumeRole();
}

uint64_t ASServerURLForAssetType()
{
  return _ASServerURLForAssetType();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return _CC_SHA1_Final(md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return _CC_SHA1_Init(c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA1_Update(c, data, len);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA384(data, len, md);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return _CFAllocatorGetDefault();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return _CFCopyDescription(cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return _CFErrorCopyUserInfo(err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return _CFErrorGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return _CFMakeCollectable(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyKeyList(applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFReadStreamCreateWithFile(alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return _CFStringCreateExternalRepresentation(alloc, theString, encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return _CFStringCreateFromExternalRepresentation(alloc, data, encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return _CFStringGetIntValue(str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

void CFStringTrim(CFMutableStringRef theString, CFStringRef trimString)
{
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return _CFURLCreateCopyAppendingPathComponent(allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return _CFURLGetFileSystemRepresentation(url, resolveAgainstBase, buffer, maxBufLen);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return _IOIteratorIsValid(iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMasterPort(bootstrapPort, mainPort);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return _IOObjectIsEqualTo(object, anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

kern_return_t IORegistryCreateIterator(mach_port_t mainPort, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryCreateIterator(mainPort, plane, options, iterator);
}

CFStringRef IORegistryEntryCopyPath(io_registry_entry_t entry, const io_name_t plane)
{
  return _IORegistryEntryCopyPath(entry, plane);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryEntryCreateIterator(entry, plane, options, iterator);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

kern_return_t IORegistryIteratorExitEntry(io_iterator_t iterator)
{
  return _IORegistryIteratorExitEntry(iterator);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

kern_return_t IOServiceMatchPropertyTable(io_service_t service, CFDictionaryRef matching, BOOLean_t *matches)
{
  return _IOServiceMatchPropertyTable(service, matching, matches);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return _IOServiceWaitQuiet(service, waitTime);
}

uint64_t Img4DecodeGetManifest()
{
  return _Img4DecodeGetManifest();
}

uint64_t Img4DecodeInit()
{
  return _Img4DecodeInit();
}

uint64_t Img4DecodeParseLengthFromBuffer()
{
  return _Img4DecodeParseLengthFromBuffer();
}

uint64_t MAGetPallasAudience()
{
  return _MAGetPallasAudience();
}

uint64_t MANonUserInitiatedDownloadsAllowed()
{
  return _MANonUserInitiatedDownloadsAllowed();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

uint64_t SMCCloseConnection()
{
  return _SMCCloseConnection();
}

uint64_t SMCGetKeyInfo()
{
  return _SMCGetKeyInfo();
}

uint64_t SMCMakeUInt32Key()
{
  return _SMCMakeUInt32Key();
}

uint64_t SMCOpenConnection()
{
  return _SMCOpenConnection();
}

uint64_t SMCReadKeyAsNumeric()
{
  return _SMCReadKeyAsNumeric();
}

uint64_t SMCWriteKeyWithKnownSize()
{
  return _SMCWriteKeyWithKnownSize();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return __CFCopySupplementalVersionDictionary();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

uint64_t _CTServerConnectionCreate()
{
  return __CTServerConnectionCreate();
}

uint64_t _CTServerConnectionUnlockPostponementTicket()
{
  return __CTServerConnectionUnlockPostponementTicket();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void _exit(int a1)
{
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_crash_msg()
{
  return __os_crash_msg();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_pack_fill()
{
  return __os_log_pack_fill();
}

uint64_t _os_log_pack_size()
{
  return __os_log_pack_size();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int atexit(void (*a1)(void))
{
  return _atexit(a1);
}

char *__cdecl basename_r(const char *a1, char *a2)
{
  return _basename_r(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return _calloc(__count, __size);
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return _chown(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return _dispatch_block_wait(block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int dprintf(int a1, const char *a2, ...)
{
  return _dprintf(a1, a2);
}

void err(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return _fcopyfile(from_fd, to_fd, a3, flags);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _ffsctl(a1, a2, a3, a4);
}

int flock(int a1, int a2)
{
  return _flock(a1, a2);
}

pid_t fork(void)
{
  return _fork();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

int fs_snapshot_create(int a1, const char *a2, uint32_t a3)
{
  return _fs_snapshot_create(a1, a2, a3);
}

int fs_snapshot_delete(int a1, const char *a2, uint32_t a3)
{
  return _fs_snapshot_delete(a1, a2, a3);
}

int fs_snapshot_list(int a1, attrlist *a2, void *a3, size_t a4, uint32_t a5)
{
  return _fs_snapshot_list(a1, a2, a3, a4, a5);
}

int fs_snapshot_rename(int a1, const char *a2, const char *a3, uint32_t a4)
{
  return _fs_snapshot_rename(a1, a2, a3, a4);
}

int fs_snapshot_revert(int a1, const char *a2, uint32_t a3)
{
  return _fs_snapshot_revert(a1, a2, a3);
}

uint64_t fs_snapshot_root()
{
  return _fs_snapshot_root();
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fsync(int a1)
{
  return _fsync(a1);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return _fts_set(a1, a2, a3);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

int getmntinfo(statfs **a1, int a2)
{
  return _getmntinfo(a1, a2);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return _getmntinfo_r_np(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

pid_t getppid(void)
{
  return _getppid();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return _gmtime_r(a1, a2);
}

kern_return_t host_reboot(host_priv_t host_priv, int options)
{
  return _host_reboot(host_priv, options);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return _mkdtemp(a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

int mkstempsat_np(int dfd, char *path, int slen)
{
  return _mkstempsat_np(dfd, path, slen);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

uint64_t os_log_pack_compose()
{
  return _os_log_pack_compose();
}

uint64_t os_log_pack_send()
{
  return _os_log_pack_send();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t os_variant_is_recovery()
{
  return _os_variant_is_recovery();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return _os_variant_uses_ephemeral_storage();
}

int pipe(int a1[2])
{
  return _pipe(a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return _posix_spawn_file_actions_addclose(a1, a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return _posix_spawn_file_actions_adddup2(a1, a2, a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_destroy(a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_init(a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_destroy(a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_init(a1);
}

uint64_t posix_spawnattr_set_qos_clamp_np()
{
  return _posix_spawnattr_set_qos_clamp_np();
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return _posix_spawnattr_setflags(a1, a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath_audittoken(audittoken, buffer, buffersize);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_init(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return _realloc(__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t reboot3()
{
  return _reboot3();
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return _regcomp(a1, a2, a3);
}

size_t regerror(int a1, const regex_t *a2, char *a3, size_t a4)
{
  return _regerror(a1, a2, a3, a4);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return _regexec(a1, a2, a3, __pmatch, a5);
}

void regfree(regex_t *a1)
{
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return _removefile(path, state, flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return _removefile_state_alloc();
}

int removefile_state_free(removefile_state_t a1)
{
  return _removefile_state_free(a1);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return _removefile_state_set(state, key, value);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return _renamex_np(a1, a2, a3);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _setattrlist(a1, a2, a3, a4, a5);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return _strcasestr(__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return _strndup(__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return _strnstr(__big, __little, __len);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

int symlink(const char *a1, const char *a2)
{
  return _symlink(a1, a2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return _unlinkat(a1, a2, a3);
}

int unmount(const char *a1, int a2)
{
  return _unmount(a1, a2);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int uuid_is_null(const uuid_t uu)
{
  return _uuid_is_null(uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

void xpc_release(xpc_object_t object)
{
}

id objc_msgSend_BSDName(void *a1, const char *a2, ...)
{
  return [a1 BSDName];
}

id objc_msgSend_IOMatchingPropertyTable(void *a1, const char *a2, ...)
{
  return [a1 IOMatchingPropertyTable];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__cleanupInstallState(void *a1, const char *a2, ...)
{
  return [a1 _cleanupInstallState];
}

id objc_msgSend__copyLiveFilesystemIOMediaForRootedSnapshot(void *a1, const char *a2, ...)
{
  return [a1 _copyLiveFilesystemIOMediaForRootedSnapshot];
}

id objc_msgSend__crossingRegionChangeBoundary(void *a1, const char *a2, ...)
{
  return [a1 _crossingRegionChangeBoundary];
}

id objc_msgSend__currentBaseOSVersion(void *a1, const char *a2, ...)
{
  return [a1 _currentBaseOSVersion];
}

id objc_msgSend__currentEAPFSMode(void *a1, const char *a2, ...)
{
  return [a1 _currentEAPFSMode];
}

id objc_msgSend__currentOSVersion(void *a1, const char *a2, ...)
{
  return [a1 _currentOSVersion];
}

id objc_msgSend__currentTimeInMilliseconds(void *a1, const char *a2, ...)
{
  return [a1 _currentTimeInMilliseconds];
}

id objc_msgSend__defaultSession(void *a1, const char *a2, ...)
{
  return [a1 _defaultSession];
}

id objc_msgSend__defaults(void *a1, const char *a2, ...)
{
  return [a1 _defaults];
}

id objc_msgSend__eventDirectory(void *a1, const char *a2, ...)
{
  return [a1 _eventDirectory];
}

id objc_msgSend__findFirmwareInfoEntry(void *a1, const char *a2, ...)
{
  return [a1 _findFirmwareInfoEntry];
}

id objc_msgSend__getDeviceModel(void *a1, const char *a2, ...)
{
  return [a1 _getDeviceModel];
}

id objc_msgSend__getDiskUsage(void *a1, const char *a2, ...)
{
  return [a1 _getDiskUsage];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__installInProgress(void *a1, const char *a2, ...)
{
  return [a1 _installInProgress];
}

id objc_msgSend__installInProgressAfterApply(void *a1, const char *a2, ...)
{
  return [a1 _installInProgressAfterApply];
}

id objc_msgSend__installInfoFile(void *a1, const char *a2, ...)
{
  return [a1 _installInfoFile];
}

id objc_msgSend__isEnrolledInBetaProgram(void *a1, const char *a2, ...)
{
  return [a1 _isEnrolledInBetaProgram];
}

id objc_msgSend__legacyEventDirectory(void *a1, const char *a2, ...)
{
  return [a1 _legacyEventDirectory];
}

id objc_msgSend__legacyInstallInfoFile(void *a1, const char *a2, ...)
{
  return [a1 _legacyInstallInfoFile];
}

id objc_msgSend__legacySupportDirectory(void *a1, const char *a2, ...)
{
  return [a1 _legacySupportDirectory];
}

id objc_msgSend__loadUnsubmittedEvents(void *a1, const char *a2, ...)
{
  return [a1 _loadUnsubmittedEvents];
}

id objc_msgSend__maxExtendedRegionSize(void *a1, const char *a2, ...)
{
  return [a1 _maxExtendedRegionSize];
}

id objc_msgSend__maxImageSize(void *a1, const char *a2, ...)
{
  return [a1 _maxImageSize];
}

id objc_msgSend__preSUStagingSupportedInSUCore(void *a1, const char *a2, ...)
{
  return [a1 _preSUStagingSupportedInSUCore];
}

id objc_msgSend__restoreInfoDictionary(void *a1, const char *a2, ...)
{
  return [a1 _restoreInfoDictionary];
}

id objc_msgSend__retryInterval(void *a1, const char *a2, ...)
{
  return [a1 _retryInterval];
}

id objc_msgSend__scheduleEventSubmissionRetry(void *a1, const char *a2, ...)
{
  return [a1 _scheduleEventSubmissionRetry];
}

id objc_msgSend__serverCompatibilityVersion(void *a1, const char *a2, ...)
{
  return [a1 _serverCompatibilityVersion];
}

id objc_msgSend__serverURL(void *a1, const char *a2, ...)
{
  return [a1 _serverURL];
}

id objc_msgSend__setupFileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 _setupFileDescriptor];
}

id objc_msgSend__stitchFirmwareImage(void *a1, const char *a2, ...)
{
  return [a1 _stitchFirmwareImage];
}

id objc_msgSend__supportDirectory(void *a1, const char *a2, ...)
{
  return [a1 _supportDirectory];
}

id objc_msgSend__syncNvram(void *a1, const char *a2, ...)
{
  return [a1 _syncNvram];
}

id objc_msgSend__topic(void *a1, const char *a2, ...)
{
  return [a1 _topic];
}

id objc_msgSend__updaterClasses(void *a1, const char *a2, ...)
{
  return [a1 _updaterClasses];
}

id objc_msgSend__uptime(void *a1, const char *a2, ...)
{
  return [a1 _uptime];
}

id objc_msgSend__usesExtendediBootRegion(void *a1, const char *a2, ...)
{
  return [a1 _usesExtendediBootRegion];
}

id objc_msgSend__writeInfoFile(void *a1, const char *a2, ...)
{
  return [a1 _writeInfoFile];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allMedia(void *a1, const char *a2, ...)
{
  return [a1 allMedia];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_ans2Data(void *a1, const char *a2, ...)
{
  return [a1 ans2Data];
}

id objc_msgSend_apNonce(void *a1, const char *a2, ...)
{
  return [a1 apNonce];
}

id objc_msgSend_apNonceSlotID(void *a1, const char *a2, ...)
{
  return [a1 apNonceSlotID];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributeDict(void *a1, const char *a2, ...)
{
  return [a1 attributeDict];
}

id objc_msgSend_baseServerURL(void *a1, const char *a2, ...)
{
  return [a1 baseServerURL];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bootBlockImages(void *a1, const char *a2, ...)
{
  return [a1 bootBlockImages];
}

id objc_msgSend_brainVersion(void *a1, const char *a2, ...)
{
  return [a1 brainVersion];
}

id objc_msgSend_bumpGeneration(void *a1, const char *a2, ...)
{
  return [a1 bumpGeneration];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return [a1 children];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_computeHash(void *a1, const char *a2, ...)
{
  return [a1 computeHash];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_contentTypeToSubclassMap(void *a1, const char *a2, ...)
{
  return [a1 contentTypeToSubclassMap];
}

id objc_msgSend_contentTypesForPartitionMedia(void *a1, const char *a2, ...)
{
  return [a1 contentTypesForPartitionMedia];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_controlCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 controlCharacterSet];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_dataMountPoint(void *a1, const char *a2, ...)
{
  return [a1 dataMountPoint];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultFormatterBehavior(void *a1, const char *a2, ...)
{
  return [a1 defaultFormatterBehavior];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_devNodePath(void *a1, const char *a2, ...)
{
  return [a1 devNodePath];
}

id objc_msgSend_devicePath(void *a1, const char *a2, ...)
{
  return [a1 devicePath];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_droppedEvents(void *a1, const char *a2, ...)
{
  return [a1 droppedEvents];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_eventAttributes(void *a1, const char *a2, ...)
{
  return [a1 eventAttributes];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return [a1 fileType];
}

id objc_msgSend_findHeaders(void *a1, const char *a2, ...)
{
  return [a1 findHeaders];
}

id objc_msgSend_findPreparedHeader(void *a1, const char *a2, ...)
{
  return [a1 findPreparedHeader];
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return [a1 finishTasksAndInvalidate];
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return [a1 finished];
}

id objc_msgSend_firmwareImages(void *a1, const char *a2, ...)
{
  return [a1 firmwareImages];
}

id objc_msgSend_firmwareWriter(void *a1, const char *a2, ...)
{
  return [a1 firmwareWriter];
}

id objc_msgSend_headerGeneration(void *a1, const char *a2, ...)
{
  return [a1 headerGeneration];
}

id objc_msgSend_headerHash(void *a1, const char *a2, ...)
{
  return [a1 headerHash];
}

id objc_msgSend_headerSignature(void *a1, const char *a2, ...)
{
  return [a1 headerSignature];
}

id objc_msgSend_headerVersion(void *a1, const char *a2, ...)
{
  return [a1 headerVersion];
}

id objc_msgSend_ibootData(void *a1, const char *a2, ...)
{
  return [a1 ibootData];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageAddress(void *a1, const char *a2, ...)
{
  return [a1 imageAddress];
}

id objc_msgSend_installTonight(void *a1, const char *a2, ...)
{
  return [a1 installTonight];
}

id objc_msgSend_installType(void *a1, const char *a2, ...)
{
  return [a1 installType];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidHeaders(void *a1, const char *a2, ...)
{
  return [a1 invalidHeaders];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_ioMedia(void *a1, const char *a2, ...)
{
  return [a1 ioMedia];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return [a1 isAvailable];
}

id objc_msgSend_isEmbeddedDeviceTypeRoot(void *a1, const char *a2, ...)
{
  return [a1 isEmbeddedDeviceTypeRoot];
}

id objc_msgSend_isErase(void *a1, const char *a2, ...)
{
  return [a1 isErase];
}

id objc_msgSend_isPrimaryMedia(void *a1, const char *a2, ...)
{
  return [a1 isPrimaryMedia];
}

id objc_msgSend_isPurgingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isPurgingEnabled];
}

id objc_msgSend_isSingleStageBoot(void *a1, const char *a2, ...)
{
  return [a1 isSingleStageBoot];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isWhole(void *a1, const char *a2, ...)
{
  return [a1 isWhole];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_llbData(void *a1, const char *a2, ...)
{
  return [a1 llbData];
}

id objc_msgSend_llbWriter(void *a1, const char *a2, ...)
{
  return [a1 llbWriter];
}

id objc_msgSend_logoData(void *a1, const char *a2, ...)
{
  return [a1 logoData];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_makeValid(void *a1, const char *a2, ...)
{
  return [a1 makeValid];
}

id objc_msgSend_matchedService(void *a1, const char *a2, ...)
{
  return [a1 matchedService];
}

id objc_msgSend_mediaUUID(void *a1, const char *a2, ...)
{
  return [a1 mediaUUID];
}

id objc_msgSend_mountPoint(void *a1, const char *a2, ...)
{
  return [a1 mountPoint];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nodeDescriptor(void *a1, const char *a2, ...)
{
  return [a1 nodeDescriptor];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfBytesRemainingInBlock(void *a1, const char *a2, ...)
{
  return [a1 numberOfBytesRemainingInBlock];
}

id objc_msgSend_nvramPath(void *a1, const char *a2, ...)
{
  return [a1 nvramPath];
}

id objc_msgSend_openService(void *a1, const char *a2, ...)
{
  return [a1 openService];
}

id objc_msgSend_packStructure(void *a1, const char *a2, ...)
{
  return [a1 packStructure];
}

id objc_msgSend_padding(void *a1, const char *a2, ...)
{
  return [a1 padding];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_preferredBlockSize(void *a1, const char *a2, ...)
{
  return [a1 preferredBlockSize];
}

id objc_msgSend_primaryMedia(void *a1, const char *a2, ...)
{
  return [a1 primaryMedia];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_purgeStagedAssetsAsync(void *a1, const char *a2, ...)
{
  return [a1 purgeStagedAssetsAsync];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requiresSEPInFW(void *a1, const char *a2, ...)
{
  return [a1 requiresSEPInFW];
}

id objc_msgSend_resetImages(void *a1, const char *a2, ...)
{
  return [a1 resetImages];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_secondaryPayloadOffset(void *a1, const char *a2, ...)
{
  return [a1 secondaryPayloadOffset];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceConnect(void *a1, const char *a2, ...)
{
  return [a1 serviceConnect];
}

id objc_msgSend_serviceWriter(void *a1, const char *a2, ...)
{
  return [a1 serviceWriter];
}

id objc_msgSend_setAsFirstGeneration(void *a1, const char *a2, ...)
{
  return [a1 setAsFirstGeneration];
}

id objc_msgSend_setNVRAMForRebootToNerd(void *a1, const char *a2, ...)
{
  return [a1 setNVRAMForRebootToNerd];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldCommit(void *a1, const char *a2, ...)
{
  return [a1 shouldCommit];
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return [a1 skipDescendants];
}

id objc_msgSend_snapshotMountPoints(void *a1, const char *a2, ...)
{
  return [a1 snapshotMountPoints];
}

id objc_msgSend_spiDriverConnect(void *a1, const char *a2, ...)
{
  return [a1 spiDriverConnect];
}

id objc_msgSend_stagePurgeAllSync(void *a1, const char *a2, ...)
{
  return [a1 stagePurgeAllSync];
}

id objc_msgSend_startLocation(void *a1, const char *a2, ...)
{
  return [a1 startLocation];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_submissionPending(void *a1, const char *a2, ...)
{
  return [a1 submissionPending];
}

id objc_msgSend_submitter(void *a1, const char *a2, ...)
{
  return [a1 submitter];
}

id objc_msgSend_sum(void *a1, const char *a2, ...)
{
  return [a1 sum];
}

id objc_msgSend_summary(void *a1, const char *a2, ...)
{
  return [a1 summary];
}

id objc_msgSend_supportedContentTypes(void *a1, const char *a2, ...)
{
  return [a1 supportedContentTypes];
}

id objc_msgSend_supportsAFUH(void *a1, const char *a2, ...)
{
  return [a1 supportsAFUH];
}

id objc_msgSend_supportsDualiBoot(void *a1, const char *a2, ...)
{
  return [a1 supportsDualiBoot];
}

id objc_msgSend_supportsPCIeNANDBoot(void *a1, const char *a2, ...)
{
  return [a1 supportsPCIeNANDBoot];
}

id objc_msgSend_supportsSlotIDs(void *a1, const char *a2, ...)
{
  return [a1 supportsSlotIDs];
}

id objc_msgSend_systemMountPoint(void *a1, const char *a2, ...)
{
  return [a1 systemMountPoint];
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return [a1 systemUptime];
}

id objc_msgSend_targetOSVersion(void *a1, const char *a2, ...)
{
  return [a1 targetOSVersion];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_unit(void *a1, const char *a2, ...)
{
  return [a1 unit];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateMountPoint(void *a1, const char *a2, ...)
{
  return [a1 updateMountPoint];
}

id objc_msgSend_updater(void *a1, const char *a2, ...)
{
  return [a1 updater];
}

id objc_msgSend_usesAFUH(void *a1, const char *a2, ...)
{
  return [a1 usesAFUH];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_valid(void *a1, const char *a2, ...)
{
  return [a1 valid];
}

id objc_msgSend_validHash(void *a1, const char *a2, ...)
{
  return [a1 validHash];
}

id objc_msgSend_validHeaderSignature(void *a1, const char *a2, ...)
{
  return [a1 validHeaderSignature];
}

id objc_msgSend_volumeGroupUUID(void *a1, const char *a2, ...)
{
  return [a1 volumeGroupUUID];
}

id objc_msgSend_volumes(void *a1, const char *a2, ...)
{
  return [a1 volumes];
}

id objc_msgSend_waitForBlockStorage(void *a1, const char *a2, ...)
{
  return [a1 waitForBlockStorage];
}

id objc_msgSend_workBlock(void *a1, const char *a2, ...)
{
  return [a1 workBlock];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}

id objc_msgSend_writer(void *a1, const char *a2, ...)
{
  return [a1 writer];
}