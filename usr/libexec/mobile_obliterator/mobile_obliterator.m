void sub_100002A68(int a1, int a2)
{
  char *v4;
  CFStringRef v5;
  CFNumberRef v6;
  CFTypeID v7;
  CFTypeID v8;
  CFRange v9;
  CFTypeID v10;
  CFIndex Length;
  UInt8 buffer[8];
  uint64_t v13;

  if (os_variant_has_internal_content())
  {
    dword_100028BE0 = a1;
    if (a1) {
      goto LABEL_16;
    }
    if (a2) {
      v4 = "safe-oblit-sim-fail";
    }
    else {
      v4 = "oblit-sim-fail";
    }
    v5 = sub_10000FAC0(v4, 1);
    if (v5)
    {
      v6 = (const __CFNumber *)v5;
      v7 = CFGetTypeID(v5);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberIntType, &dword_100028BE0);
      }
      else
      {
        v8 = CFGetTypeID(v6);
        if (v8 == CFDataGetTypeID())
        {
          *(void *)buffer = 0;
          v13 = 0;
          if ((unint64_t)CFDataGetLength(v6) > 0xF) {
            v9.length = 16;
          }
          else {
            v9.length = CFDataGetLength(v6);
          }
          v9.location = 0;
          CFDataGetBytes(v6, v9, buffer);
          dword_100028BE0 = strtoul((const char *)buffer, 0, 0);
        }
      }
      v10 = CFGetTypeID(v6);
      Length = CFDataGetLength(v6);
      sub_100002D6C(1, "%s: Found %s set in NVRAM (type: %lu, size: %ld)\n", "obliteration_sim_failure_setup", "oblit-sim-fail", v10, Length);
      CFRelease(v6);
    }
    a1 = dword_100028BE0;
    if (dword_100028BE0) {
LABEL_16:
    }
      sub_100002D6C(1, "%s: Set simulated failure location to 0x%x", "obliteration_sim_failure_setup", a1);
  }
}

uint64_t sub_100002BFC(int a1, const char *a2)
{
  unsigned int has_internal_content = os_variant_has_internal_content();
  if (dword_100028BE0 == a1) {
    uint64_t v5 = has_internal_content;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v5 == 1) {
    sub_100002D6C(1, "%s: Simulating failure at location 0x%x (%s)\n", "obliteration_sim_failure_should_fail", a1, a2);
  }
  return v5;
}

const char *sub_100002C78(int a1)
{
  result = aPrivateVarHard;
  switch(a1)
  {
    case 0:
      int v4 = byte_100028D00;
      uint64_t v5 = "/private/var";
      v6 = "/private/var/tmp/alt_root/private/var";
      goto LABEL_7;
    case 1:
      int v4 = byte_100028D00;
      uint64_t v5 = "/private/var/mobile";
      v6 = "/private/var/tmp/alt_root/private/var/mobile";
      goto LABEL_7;
    case 2:
      return result;
    case 3:
      return "/private/var/tmp";
    case 4:
      int v4 = byte_100028D00;
      uint64_t v5 = "/";
      v6 = "/private/var/tmp/alt_root";
LABEL_7:
      if (v4) {
        result = v6;
      }
      else {
        result = v5;
      }
      break;
    default:
      sub_100002D6C(1, "%s: ☠️ =====>>> Error: Invalid path request (%d) <<<===== ☠️", "getCurrentPath", a1);
      result = "/private/var";
      break;
  }
  return result;
}

void sub_100002D6C(int a1, char *__format, ...)
{
  va_start(va, __format);
  if (!__format) {
    return;
  }
  if (byte_100028D18 != 1)
  {
    CFStringRef v6 = CFStringCreateWithCString(kCFAllocatorDefault, __format, 0x8000100u);
    if (!v6) {
      return;
    }
    CFStringRef v7 = v6;
    CFStringRef v5 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, v6, va);
    CFRelease(v7);
    if (!v5) {
      return;
    }
LABEL_10:
    sub_100004D28(v5, 1u, a1);
    CFRelease(v5);
    return;
  }
  int v3 = vsnprintf((char *)__str, 0x400uLL, __format, va);
  if (v3)
  {
    CFIndex v4 = v3;
    if (v3 <= 0x3FF)
    {
      __str[v3] = 10;
      CFIndex v4 = v3 + 1;
    }
    CFStringRef v5 = CFStringCreateWithBytes(kCFAllocatorDefault, __str, v4, 0x8000100u, 0);
    if (v5) {
      goto LABEL_10;
    }
  }
}

uint64_t sub_100002EB4(int a1, char *__s1, const char *a3)
{
  if (__s1)
  {
    size_t v6 = strnlen(__s1, 0x100uLL) + 1;
    if (a3)
    {
LABEL_3:
      size_t v7 = strnlen(a3, 0x100uLL);
      goto LABEL_6;
    }
  }
  else
  {
    size_t v6 = 1;
    if (a3) {
      goto LABEL_3;
    }
  }
  size_t v7 = 0;
LABEL_6:
  v8 = sub_100002C78(a1);
  size_t v9 = strlen(v8);
  if (v6 + v7 + v9 >= 0x101) {
    sub_100002D6C(1, "%s: ☠️ =====>>> Error: path too long (%zu > %d) and WILL BE TRUNCATED <<<===== ☠️", "setGlobalPath", v6 + v7 + v9, 256);
  }
  v10 = "";
  if (__s1) {
    v11 = __s1;
  }
  else {
    v11 = "";
  }
  if (a3) {
    v10 = a3;
  }
  return snprintf(byte_100028BF8, 0x100uLL, "%s%s%s", v8, v11, v10);
}

uint64_t start(int a1, uint64_t a2)
{
  byte_100028BE9 = sub_1000108A0();
  int v4 = sub_10001079C();
  dword_1000286C0 = open("/dev/console", 9);
  if (sub_10000F384()) {
    sub_10000F50C();
  }
  byte_100028D01 = sub_10000F2DC();
  if (a1 == 2 && !strcmp(*(const char **)(a2 + 8), "--init"))
  {
    fwrite("Obliterator: In INIT check\n", 0x1BuLL, 1uLL, __stderrp);
    int v8 = sub_1000033B0(0, 0);
    if (v8)
    {
      if (!v4)
      {
        fwrite("Obliterator: Obliteration terminated improperly, continuing obliteration...\n", 0x4CuLL, 1uLL, __stderrp);
        int v8 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      if (!v4)
      {
        fwrite("Obliterator: No obliteration needed, continue booting, returning 0\n", 0x43uLL, 1uLL, __stderrp);
        goto LABEL_35;
      }
      sub_1000034DC();
    }
    fwrite("Obliterator: Running in ephemeral data mode, initiating obliteration...\n", 0x48uLL, 1uLL, __stderrp);
LABEL_18:
    close(0);
    if (open("/dev/null", 2) == -1)
    {
      size_t v9 = "failed to open stdin devnull\n";
      size_t v10 = 29;
    }
    else
    {
      size_t v9 = "*** STDIN set with devnull ***\n";
      size_t v10 = 31;
    }
    fwrite(v9, v10, 1uLL, __stderrp);
    sub_100002A68(0, 1);
    uint64_t v11 = sub_1000036E4();
    uint64_t v12 = v11;
    if (v11 != 89 && v11)
    {
      CFStringRef v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Safe Obliteration failed with [gF: 0x%016llX] Attempt: %ld", qword_100028BF0, qword_100028D08 + 1);
      if (v22)
      {
        CFStringRef v23 = v22;
        sub_1000101EC("oblit-failure", v22);
        CFRelease(v23);
      }
      sub_100002D6C(0, "%s: Safe Obliteration failed, returning %d", "main", v12);
    }
    else
    {
      size_t v13 = sub_100004C2C("oblit-begins", __big, 0x100u);
      if (v13)
      {
        size_t v15 = v13;
        v16 = strnstr(__big, "Caller: ", v13);
        unint64_t v17 = v15 - 8;
        v14 = &__big[8 * (v16 != 0)];
        if (!v16) {
          unint64_t v17 = v15;
        }
        if (v17 >= 0xC1)
        {
          uint64_t v18 = 199;
          if (!v16) {
            uint64_t v18 = 191;
          }
          __big[v18] = 0;
        }
      }
      else
      {
        v14 = 0;
      }
      time_t v19 = time(0);
      v20 = "<unknown>";
      if (v14) {
        v20 = v14;
      }
      CFStringRef v21 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"SafeOblit done @%ld, Err:%d, By:%s", v19, v12, v20);
      sub_100004D28(v21, 0, 1);
      sub_100010698(@"oblit-begins");
      sub_100010698(@"oblit-failure");
      if (((v8 | v4 ^ 1) & 1) == 0) {
LABEL_35:
      }
        exit(0);
    }
    if (sub_10000F384())
    {
      sub_100002EB4(0, 0, "/log/obliteration.log");
      sub_10000F80C((uint64_t)byte_100028BF8, (uint64_t)sub_10000F3F0);
      sub_10000F5E8();
    }
    exit(v12);
  }
  sub_100002D6C(1, "%s: mobile_obliterator - XPC version started", "main");
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.mobile.obliterator", 0);
  if (v5)
  {
    size_t v6 = v5;
    if (qword_100028D10 || (qword_100028D10 = MOXPCTransportOpen()) != 0)
    {
      MOXPCTransportSetMessageHandler();
      dispatch_release(v6);
      MOXPCTransportResume();
      dispatch_main();
    }
    sub_100002D6C(1, "%s: Unable to start server");
  }
  else
  {
    sub_100002D6C(1, "%s: Can't create dispatch resources.");
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000033B0(int a1, uint64_t *a2)
{
  uint32_t size = 255;
  io_registry_entry_t v4 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v4)
  {
    sub_100002D6C(0, "%s: IORegistryEntryFromPath failed");
    return 0;
  }
  memset(_20, 0, 255);
  if (IORegistryEntryGetProperty(v4, "oblit-inprogress", _20, &size))
  {
    sub_100002D6C(0, "%s: IORegistryEntryGetProperty failed, may be does not exist");
    return 0;
  }
  uint64_t result = 1;
  if (a2)
  {
    if (a1)
    {
      __endptr = 0;
      *a2 = strtol(_20, &__endptr, 10);
      return 1;
    }
  }
  return result;
}

uint64_t sub_1000034DC()
{
  kern_return_t v7;
  mach_port_t mainPort;
  char __str[16];
  long long v11;
  long long v12;
  long long v13;

  sub_100002D6C(1, "%s: Marking NVRAM Obliteration in Progress", "setOblitNVRAMkey");
  if (!sub_1000033B0(0, 0))
  {
    mainPort = 0;
    *(_OWORD *)__str = 0u;
    uint64_t v11 = 0u;
    uint64_t v12 = 0u;
    size_t v13 = 0u;
    int v1 = 64;
    if (!byte_100028D19) {
      int v1 = 0;
    }
    snprintf(__str, 0x40uLL, "%d", v1);
    CFStringRef v2 = CFStringCreateWithCString(0, "oblit-inprogress", 0x8000100u);
    if (IOMainPort(bootstrap_port, &mainPort))
    {
      sub_100002D6C(1, "%s: Could not get main port\n");
    }
    else
    {
      io_registry_entry_t v3 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
      if (v3)
      {
        io_registry_entry_t v4 = v3;
        CFStringRef v5 = CFStringCreateWithCString(0, __str, 0x8000100u);
        if (v5)
        {
          CFStringRef v6 = v5;
          size_t v7 = IORegistryEntrySetCFProperty(v4, v2, v5);
          if (v7)
          {
            sub_100002D6C(1, "%s: Could not save value:%08x\n", "setOblitNVRAMkey", v7);
            uint64_t v0 = 0xFFFFFFFFLL;
          }
          else
          {
            sub_10000FEAC(v4, "0");
            uint64_t v0 = 0;
          }
          sub_100002D6C(1, "%s: NVRamSyncNow", "setOblitNVRAMkey");
          CFRelease(v6);
        }
        else
        {
          sub_100002D6C(1, "%s: Could not create string for value\n", "setOblitNVRAMkey");
          uint64_t v0 = 0xFFFFFFFFLL;
        }
        IOObjectRelease(v4);
        goto LABEL_17;
      }
      sub_100002D6C(1, "%s: Could not get options entry from the device tree\n");
    }
    uint64_t v0 = 0xFFFFFFFFLL;
LABEL_17:
    CFRelease(v2);
    return v0;
  }
  sub_100002D6C(1, "%s: Already marked the start of progress, returning", "setOblitNVRAMkey");
  return 0;
}

uint64_t sub_1000036E4()
{
  memset(v80, 0, 64);
  long long v79 = 0u;
  long long v78 = 0u;
  long long v77 = 0u;
  *(_OWORD *)__s = 0u;
  memset(v75, 0, sizeof(v75));
  char v73 = 0;
  int v0 = sub_10001079C();
  char v72 = 0;
  sub_100002D6C(1, "%s: safeObliterate: Starting", "safeObliterate");
  if (v0) {
    goto LABEL_32;
  }
  size_t v1 = sub_100004C2C("oblit-failure", (char *)&xmmword_100028DE0, 0x180u);
  if (v1)
  {
    size_t v2 = v1;
    io_registry_entry_t v3 = strnstr((const char *)&xmmword_100028DE0, "[gF: 0x", v1);
    if (v3)
    {
      unint64_t v4 = strtoull(v3 + 7, 0, 16);
      sub_100002D6C(1, "%s: Safe Obliteration previous gFailure is 0x%016llX", "safeOblitCheckLoop", v4);
    }
    else
    {
      unint64_t v4 = 0;
    }
    CFStringRef v6 = strnstr((const char *)&xmmword_100028DE0, "Attempt: ", v2);
    if (v6)
    {
      uint64_t v7 = strtol(v6 + 9, 0, 10);
      uint64_t v8 = v7;
      if (v7)
      {
        sub_100002D6C(1, "%s: Safe Obliteration previous finish count in nvram is %ld", "safeOblitCheckLoop", v7);
        if (v8 >= 1) {
          qword_100028D08 = v8;
        }
      }
      uint64_t v5 = v8 & ~(v8 >> 63);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v4 = 0;
  }
  uint64_t v9 = sub_100004C2C("oblit-begins", (char *)&xmmword_100028DE0, 0x160u);
  if (v9)
  {
    size_t v10 = strnstr((const char *)&xmmword_100028DE0, "Attempt: ", v9);
    if (v10)
    {
      uint64_t v11 = v10 + 9;
      uint64_t v12 = strtol(v10 + 9, 0, 10);
      if (v12)
      {
        uint64_t v13 = v12;
        sub_100002D6C(1, "%s: Safe Obliteration previous start count in nvram is %ld", "safeOblitCheckLoop", v12);
        if (v13 > 0)
        {
          if ((unint64_t)v13 > 0xA)
          {
            v14 = "no";
            if ((v4 & 0x8650100000165600) == 0) {
              v14 = "yes";
            }
            sub_100002D6C(1, "%s: Too many failures (try boot: %s)", "safeObliterate", v14);
            if ((v4 & 0x8650100000165600) == 0)
            {
              sub_100002D6C(0, "%s: Skipping safe attempt, returning 0 to try normal boot (also clearing NVRAM Key indicating obliteration should run)", "safeObliterate");
              sub_100002D6C(0, "%s: Clearing Obliteration in Progress", "clearOblitNVRAMkey");
              sub_100010698(@"oblit-inprogress");
              return 0;
            }
            goto LABEL_30;
          }
          goto LABEL_28;
        }
      }
    }
  }
  if ((unint64_t)(v5 - 1) > 3)
  {
    uint64_t v5 = 1;
    sub_100002D6C(1, "%s: Overriding all safe obliteration previous count values to 1", "safeOblitCheckLoop");
    qword_100028D08 = 1;
    if (v9) {
      goto LABEL_24;
    }
LABEL_26:
    strcpy((char *)&xmmword_100028DE0, "No info for unknown MO type, Attempt: ");
    uint64_t v9 = &stru_100000020.cmdsize + 2;
    goto LABEL_27;
  }
  sub_100002D6C(1, "%s: Overriding safe obliteration previous start count to %ld", "safeOblitCheckLoop", v5);
  if (!v9) {
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v9 = v9 - 1 + snprintf((char *)&xmmword_100028DE0 + v9 - 1, 353 - v9, ", Attempt: ");
LABEL_27:
  uint64_t v11 = (char *)&xmmword_100028DE0 + v9;
  uint64_t v13 = v5;
LABEL_28:
  if (v13 - v5 >= 5)
  {
    sub_100002D6C(1, "%s: Too many failures (try boot: %s)", "safeObliterate", "no");
LABEL_30:
    sub_10000FD1C("auto-boot", "false");
    sub_100002D6C(0, "%s: Skipping safe attempt, returning EACCES to go into recovery (set 'auto-boot' to false)");
    return 13;
  }
  snprintf(v11, 384 - v9, "%lu", v13 + 1);
  sub_10000FD1C("oblit-begins", (const char *)&xmmword_100028DE0);
  sub_100002D6C(1, "%s: safeOblitCheckLoop() passed, attempting safe-obliterate", "safeObliterate");
LABEL_32:
  if (sub_100002BFC(16, "safeObliterate"))
  {
    sub_100002D6C(1, "%s: Simulating safeObliterate failure at start");
    return 13;
  }
  BOOL v16 = sub_100009934();
  if (v16) {
    sub_100002D6C(1, "%s: safeObliterate: Device is in multiuser mode", "safeObliterate");
  }
  if (byte_100028D00) {
    unint64_t v17 = "/private/var/tmp/alt_root/private/var";
  }
  else {
    unint64_t v17 = "/private/var";
  }
  v71 = (char *)v17;
  if (getfsfile(v17) && (sub_100002BFC(17, "safeObliterate") & 1) == 0)
  {
    __strlcpy_chk();
  }
  else
  {
    sub_100002D6C(1, "%s: safeObliterate: Failed getfsfile, manually creating data volume device", "safeObliterate");
    memset(&v74, 0, 512);
    *__error() = 0;
    if (statfs("/", &v74) || sub_100002BFC(17, "safeObliterate"))
    {
      uint64_t v18 = __error();
      sub_100002D6C(1, "%s: safeObliterate: Failed statfs of \"/\", error: %d", "safeObliterate", *v18);
    }
    else
    {
      f_mntfromname = v74.f_mntfromname;
      do
      {
        v20 = strchr(f_mntfromname, 64);
        f_mntfromname = v20 + 1;
      }
      while (v20);
      __strlcpy_chk();
      __s[strlen(__s) - 1] = 50;
      sub_100002D6C(1, "%s: safeObliterate: Using data volume device: %s", "safeObliterate", __s);
    }
  }
  sub_100002D6C(1, "%s: safeObliterate(): XXXXXXXXXXXXX SKIPPING RAMROD SETUP XXXXXXXXXXXXX ", "safeObliterate");
  sub_100002D6C(1, "%s: safeObliterate: Checking if Data volume exists", "safeObliterate");
  CFStringRef v21 = sub_10000CFF8();
  CFStringRef v22 = &DiskSupport__metaData;
  if (!v21)
  {
    sub_100002D6C(1, "%s: Unable to find any APFS Volume in IORegistry, bailing", "data_volume_exists");
LABEL_59:
    v22[42].base_meths = (__objc2_meth_list *)((unint64_t)v22[42].base_meths | 0x10000);
    sub_100002D6C(1, "%s: safeObliterate: Could not find Data volume, will skip deletion but drop keys before creating new volume", "safeObliterate");
    int v28 = 0;
    goto LABEL_60;
  }
  CFStringRef v23 = v21;
  int Count = CFArrayGetCount(v21);
  if (!Count)
  {
    sub_100002D6C(1, "%s: APFS Volume list is empty, bailing");
    goto LABEL_58;
  }
  sub_100002D6C(1, "%s: Obtained List of APFS volumes", "data_volume_exists");
  CFStringRef v25 = CFStringCreateWithCString(kCFAllocatorDefault, __s, 0x8000100u);
  if (!v25)
  {
    sub_100002D6C(1, "%s: Could not create String from f_mntfromname, bailing");
    goto LABEL_58;
  }
  if (Count <= 0)
  {
LABEL_58:
    CFRelease(v23);
    goto LABEL_59;
  }
  CFStringRef v26 = v25;
  CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v23, 0);
  if (CFStringFind(v26, ValueAtIndex, 0x40uLL).location == -1)
  {
    CFIndex v70 = Count;
    uint64_t v61 = Count;
    CFIndex v62 = 1;
    while (v61 != v62)
    {
      CFStringRef v63 = (const __CFString *)CFArrayGetValueAtIndex(v23, v62++);
      if (CFStringFind(v26, v63, 0x40uLL).location != -1)
      {
        int v28 = 1;
        sub_100002D6C(1, "%s: Found existing Data volume", "data_volume_exists");
        CFRelease(v23);
        CFStringRef v22 = &DiskSupport__metaData;
        if (v62 - 1 >= v70) {
          goto LABEL_59;
        }
        goto LABEL_60;
      }
    }
    CFRelease(v23);
    CFStringRef v22 = &DiskSupport__metaData;
    if (v62 >= v70) {
      goto LABEL_59;
    }
    int v28 = 1;
  }
  else
  {
    int v28 = 1;
    sub_100002D6C(1, "%s: Found existing Data volume", "data_volume_exists");
    CFRelease(v23);
  }
LABEL_60:
  if ((v0 & 1) == 0)
  {
    if (byte_100028BE9)
    {
      sub_100002D6C(1, "%s: safeObliterate: Skipping the Disable of the watchdog timer", "safeObliterate");
    }
    else
    {
      sub_100002D6C(1, "%s: safeObliterate: Disabling the watchdog timer", "safeObliterate");
      sub_10000CA54();
    }
  }
  sub_100009A64(__s, v80);
  sub_100002D6C(1, "%s: safeObliterate: Using container device name: %s", "safeObliterate", v80);
  sub_100002D6C(1, "%s: safeObliterate: Obliterating the Data volume", "safeObliterate");
  if (sub_100009B7C(v80, __s, v28, v16, &v73))
  {
    v22[42].base_meths = (__objc2_meth_list *)((unint64_t)v22[42].base_meths | 0x20000);
    sub_100002D6C(1, "%s: safeObliterate: Could not obliterate the Data volume", "safeObliterate");
    if (!v73)
    {
      sub_100002D6C(1, "%s: safeObliterate: failed to wipe volume keys, failing safe obliteration");
      return 13;
    }
  }
  sub_100002D6C(1, "%s: safeObliterate: Reformatting the Data volume in container %s", "safeObliterate", v80);
  if (sub_10000A374(v80, 1, __s, "safeObliterate")) {
    sub_100002D6C(0, "%s: safeObliterate: Could not reformat the Data volume", "safeObliterate");
  }
  if (v16)
  {
    sub_100002D6C(1, "%s: safeObliterate: Reformatting the User volume in container %s", "safeObliterate", v80);
    if (sub_10000A374(v80, 0, v75, "safeObliterate")) {
      sub_100002D6C(0, "%s: safeObliterate: Could not reformat the User volume", "safeObliterate");
    }
  }
  if (!__s[0])
  {
    if (getfsfile(v71))
    {
      __strlcpy_chk();
      sub_100002D6C(1, "%s: safeObliterate: Using data volume device: %s", "safeObliterate", __s);
    }
    else
    {
      sub_100002D6C(1, "%s: safeObliterate: Failed second getfsfile, this is really bad", "safeObliterate");
      v22[42].base_meths = (__objc2_meth_list *)((unint64_t)v22[42].base_meths | 0x2000000000000);
    }
  }
  sub_100002D6C(1, "%s: safeObliterate: Setting up Data volume content", "safeObliterate");
  v29 = sub_10000A628(0, 0);
  v30 = v29;
  if (v29)
  {
    sub_10000DFCC((uint64_t)v29);
  }
  else
  {
    v22[42].base_meths = (__objc2_meth_list *)((unint64_t)v22[42].base_meths | 0x80000);
    sub_100002D6C(1, "%s: safeObliterate: Failed to set up detault content on the new Data volume", "safeObliterate");
  }
  byte_100028D00 = 1;
  sub_10000A7A8("/private/var/tmp");
  if (byte_100028D00) {
    v31 = "/private/var/tmp/alt_root/private/var";
  }
  else {
    v31 = "/private/var";
  }
  int v32 = mkpath_np(v31, 0x1EDu);
  if (v32)
  {
    int v33 = v32;
    if (v32 != 17)
    {
      v34 = strerror(v32);
      sub_100002D6C(1, "%s: safeObliterate: Could not create the Data volume path %s, error %d (%s)", "safeObliterate", v31, v33, v34);
    }
  }
  sub_100002D6C(1, "%s: safeObliterate: Remounting the Data volume %s at %s", "safeObliterate", __s, v31);
  if (sub_10000A8A4(__s, v31))
  {
    v22[42].base_meths = (__objc2_meth_list *)((unint64_t)v22[42].base_meths | 0x100000);
    sub_100002D6C(1, "%s: safeObliterate: Could not remount the Data volume", "safeObliterate");
  }
  if (v16)
  {
    sub_100002D6C(1, "%s: safeObliterate: Setting up UM/AKS for the new Data volume", "safeObliterate");
    if (sub_10000A964(__s, v31, v75, 0))
    {
      v22[42].base_meths = (__objc2_meth_list *)((unint64_t)v22[42].base_meths | 0x100000000000000);
      sub_100002D6C(1, "%s: safeObliterate: Failed to set up the data and user volumes in multiuser mode", "safeObliterate");
    }
  }
  sub_100002D6C(1, "%s: safeObliterate: Re-creating overprovisioning file", "safeObliterate");
  if (sub_10000B1A4())
  {
    v22[42].base_meths = (__objc2_meth_list *)((unint64_t)v22[42].base_meths | 0x200000);
    sub_100002D6C(1, "%s: safeObliterate: Could not re-create overprovisioning file", "safeObliterate");
  }
  sub_100002D6C(1, "%s: safeObliterate: Creating mobile path", "safeObliterate");
  sub_10000E9DC();
  if (byte_100028D00) {
    v35 = "/private/var/tmp/alt_root/private/var/mobile";
  }
  else {
    v35 = "/private/var/mobile";
  }
  if (v16)
  {
    sub_100002D6C(1, "%s: safeObliterate: Remounting the User volume %s at %s", "safeObliterate", v75, v35);
    if (sub_10000A8A4(v75, v35))
    {
      v22[42].base_meths = (__objc2_meth_list *)((unint64_t)v22[42].base_meths | 0x400000000000000);
      sub_100002D6C(1, "%s: safeObliterate: Could not remount the User volume", "safeObliterate");
    }
    sub_100002D6C(1, "%s: safeObliterate: Rebuilding the Data volume", "safeObliterate");
    sub_10000DA00((uint64_t)v30);
    sub_100002D6C(1, "%s: safeObliterate: Populating USER volume with mastered content", "safeObliterate");
    if (sub_10000B9AC((uint64_t)v35))
    {
      v22[42].base_meths = (__objc2_meth_list *)((unint64_t)v22[42].base_meths | 0x800000000000000);
      sub_100002D6C(0, "%s: safeObliterate: Failed to create and set up a user volume for multiuser mode", "safeObliterate");
    }
  }
  else
  {
    sub_100002D6C(1, "%s: safeObliterate: Rebuilding the Data volume", "safeObliterate");
    sub_10000DA00((uint64_t)v30);
  }
  v36 = &DiskSupport__metaData;
  if (!v0)
  {
    if (!sub_10000BBE8(320, &v72)) {
      goto LABEL_165;
    }
    memset(&v74, 0, 144);
    sub_100002EB4(2, "/.obliteration_preserved", "/");
    sub_100002D6C(1, "%s: Examining '%s' for files to recover", "copy_preserved_files_from_storage", byte_100028BF8);
    if (stat(byte_100028BF8, (stat *)&v74) || (v74.f_iosize & 0xF000) != 0x4000)
    {
      sub_100002D6C(1, "%s: No files to recover");
    }
    else
    {
      if (byte_100028D00) {
        v45 = "/private/var/tmp/alt_root/private/var";
      }
      else {
        v45 = "/private/var";
      }
      if (copyfile(byte_100028BF8, v45, 0, 0x800Fu))
      {
        v46 = __error();
        strerror(*v46);
        sub_100002D6C(1, "%s: Could not copy files from temporary location '%s', error: %s");
      }
      else
      {
        sub_100002D6C(1, "%s: Successfully copied files from the temporary location '%s'");
      }
    }
    sub_10000BDE0();
    goto LABEL_126;
  }
  if (!byte_100028D01 || (sub_10000DCD8("epdm_skip_preboot_cleanup=1") & 1) == 0)
  {
    sub_100002D6C(1, "%s: safeObliterate: Cleaning Preboot volume", "safeObliterate");
    id v37 = objc_alloc_init((Class)NSMutableDictionary);
    if (v37)
    {
      v38 = v37;
      sub_10000D500();
      int v39 = open("/private/preboot/active", 0);
      if (v39 == -1)
      {
        v47 = __error();
        v48 = strerror(*v47);
        sub_100002D6C(1, "%s: Failed to open /private/preboot/active: %s", "epdm_fixup_preboot", v48);
        __error();
      }
      else
      {
        int v40 = v39;
        off_t v41 = lseek(v39, 0, 2);
        if (v41 != -1
          && (size_t v42 = v41, (v43 = (char *)malloc_type_malloc(v41 + 1, 0x5B17B845uLL)) != 0)
          && (v44 = v43, v42 == pread(v40, v43, v42, 0)))
        {
          v44[v42] = 0;
          sub_100002D6C(1, "%s: Found '/private/preboot/active' to point to '%s'", "epdm_fixup_preboot", v44);
          [v38 setObject:@"remove" forKey:off_1000286C8];
          [v38 setObject:@"keep" forKey:@"DarwinInitCache"];
          [v38 setObject:@"keep" forKey:@"active"];
          [v38 setObject:@"removeExcept /apticket.der/ /com.apple.factorydata/", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s/System/Library/Caches", v44) forKey];
          [v38 setObject:@"removeExcept /kernelcache/", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s/System/Library/Caches/com.apple.kernelcaches", v44) forKey];
          [v38 setObject:@"removeExcept /devicetree.img4/ /root_hash.img4/ /sep-firmware.img4/", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s/usr/standalone/firmware", v44) forKey];
          [v38 setObject:@"removeExcept /(ANE|GFX|PMP|SIO|StaticTrustCache|iBootData|Ap,(ANE1|RestoreTMU|SecurePageTableMonitor|TrustedExecutionMonitor))\\.img4/", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s/usr/standalone/firmware/FUD", v44) forKey];
          [+[DiskSupport sharedInstance] traverseFolderAndRemoveItems:@"/private/preboot" exceptions:v38];

          free(v44);
        }
        else
        {
          sub_100002D6C(1, "%s: Failed to read /private/preboot/active");
        }
      }
    }
    else
    {
      sub_100002D6C(1, "%s: Could not create exceptions dictionary");
    }
  }
  if (sub_10000BBE8(320, &v72))
  {
    if (!byte_100028D01 || (sub_10000DCD8("epdm_skip_hwvolume_cleanup=1") & 1) == 0)
    {
      sub_100002D6C(1, "%s: safeObliterate: Cleaning Hardware volume in ephemeral mode", "safeObliterate");
      uint64_t v49 = MGCopyAnswer();
      uint64_t v50 = MGCopyAnswer();
      id v51 = objc_alloc_init((Class)NSMutableDictionary);
      if (v51)
      {
        v52 = v51;
        [v51 setObject:@"remove" forKey:off_1000286C8];
        [v52 setObject:@"removeExcept /dcrt/ /sdcrt/" forKey:@"MobileActivation"];
        [v52 setObject:@"keep" forKey:@"dcrt"];
        [v52 setObject:@"keep" forKey:@"sdcrt"];
        [v52 setObject:@"removeExcept /apticket.der/" forKey:@"FactoryData/System/Library/Caches"];
        CFStringRef v53 = &stru_100025D78;
        if (v49) {
          CFStringRef v53 = +[NSString stringWithFormat:@"%@/(appv|(|mansta-)fCfg|pcrt|scrt|seal)-%@/ ", &stru_100025D78, v49];
        }
        if (v50)
        {
          id v54 = [-[NSArray objectAtIndex:](-[NSString componentsSeparatedByString:](+[NSString stringWithFormat:](NSString stringWithFormat:@"%@", v50), "componentsSeparatedByString:", @"0x", "objectAtIndex:", 1), "uppercaseString"];
          CFStringRef v53 = [NSString stringWithFormat:@"%@/(|mansta-)lcrt-%@/ ", v53, [v54 substringToIndex:[v54 length] - 1]];
        }
        sub_100002EB4(2, "/FactoryData/System/Library/Caches/com.apple.factorydata/", "trustobject-current");
        int v55 = open(byte_100028BF8, 0);
        if (v55 == -1)
        {
          v64 = __error();
          v65 = strerror(*v64);
          sub_100002D6C(1, "%s: Failed to open '%s': %s", "epdm_fixup_hardware_volume", byte_100028BF8, v65);
        }
        else
        {
          int v56 = v55;
          v57 = sub_10000DDDC(v55);
          close(v56);
          if (v57)
          {
            snprintf((char *)&v74, 0x4DuLL, "trustobject-%s", v57);
            sub_100002EB4(2, "/FactoryData/System/Library/Caches/com.apple.factorydata/", (const char *)&v74);
            int v58 = open(byte_100028BF8, 0);
            if (v58 == -1)
            {
              v66 = __error();
              v67 = strerror(*v66);
              sub_100002D6C(1, "%s: Failed to open '%s': %s", "epdm_fixup_hardware_volume", byte_100028BF8, v67);
            }
            else
            {
              int v59 = v58;
              v60 = sub_10000DDDC(v58);
              close(v59);
              if (v60)
              {
                v36 = &DiskSupport__metaData;
                if (!strncmp(v57, v60, 0x40uLL))
                {
                  sub_100002D6C(1, "%s: Verified 'trustobject-current' and '%s' have the same content SHA-256 which also matches the name", "epdm_fixup_hardware_volume", (const char *)&v74);
                  v36 = &DiskSupport__metaData;
                  CFStringRef v53 = +[NSString stringWithFormat:@"%@/trustobject-current/ /%s/", v53, &v74];
                }
                free(v60);
              }
              else
              {
                v36 = &DiskSupport__metaData;
              }
            }
            free(v57);
          }
        }
        if (v53) {
          [v52 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"removeExcept %@", v53), @"FactoryData/System/Library/Caches/com.apple.factorydata" forKey];
        }
        [+[DiskSupport sharedInstance](DiskSupport, "sharedInstance") traverseFolderAndRemoveItems:+[NSString stringWithUTF8String:aPrivateVarHard] exceptions:v52];
      }
      else
      {
        sub_100002D6C(1, "%s: Could not create exceptions dictionary", "epdm_fixup_hardware_volume");
      }
LABEL_155:
      if (v72) {
        sub_10000C7D0(320);
      }
      if (!v0) {
        goto LABEL_165;
      }
      goto LABEL_158;
    }
LABEL_126:
    sub_100002D6C(1, "%s: safeObliterate: Cleaning Hardware volume", "safeObliterate");
    sub_10000BEEC();
    goto LABEL_155;
  }
LABEL_158:
  if (!BYTE1(v36[46].ivar_lyt) || (sub_10000DCD8("epdm_skip_update_cleanup=1") & 1) == 0)
  {
    sub_100002D6C(1, "%s: safeObliterate: Cleaning Update volume", "safeObliterate");
    id v68 = objc_alloc_init((Class)NSMutableDictionary);
    if (!v68)
    {
      sub_100002D6C(1, "%s: Could not create exceptions dictionary", "epdm_fixup_update_volume");
      if (!v16) {
        goto LABEL_168;
      }
      goto LABEL_166;
    }
    v69 = v68;
    [v68 setObject:@"remove" forKey:off_1000286C8];
    [v69 setObject:@"keep" forKey:@"last_update_result.plist"];
    [v69 setObject:@"removeExcept /ota_tolerated_failures.plist/" forKey:@"lastOTA"];
    LOBYTE(v74.f_bsize) = 0;
    if (sub_10000BBE8(192, &v74))
    {
      sub_100002D6C(1, "%s: Cleaning up the Update volume", "epdm_fixup_update_volume");
      [+[DiskSupport sharedInstance](DiskSupport, "sharedInstance") traverseFolderAndRemoveItems:+[NSString stringWithUTF8String:aPrivateVarMobi_1] exceptions:v69];
      if (LOBYTE(v74.f_bsize)) {
        sub_10000C7D0(192);
      }
    }
  }
LABEL_165:
  if (!v16) {
    goto LABEL_168;
  }
LABEL_166:
  sub_100002D6C(1, "%s: safeObliterate: Unmounting the User volume post obliteration", "safeObliterate");
  if (sub_1000099B0(1, 1))
  {
    v22[42].base_meths = (__objc2_meth_list *)((unint64_t)v22[42].base_meths | 0x200000000000000);
    sub_100002D6C(1, "%s: safeObliterate: Failed to unmount the User volume post obliteration", "safeObliterate");
  }
LABEL_168:
  sub_100002D6C(1, "%s: safeObliterate: Unmounting the Data volume post obliteration", "safeObliterate");
  if (sub_1000099B0(0, 1))
  {
    v22[42].base_meths = (__objc2_meth_list *)((unint64_t)v22[42].base_meths | 0x40000000000000);
    sub_100002D6C(1, "%s: safeObliterate: Failed to unmount the Data volume post obliteration", "safeObliterate");
  }
  sub_100002D6C(1, "%s: safeObliterate: Unmounting the tmpfs volume post obliteration", "safeObliterate");
  sub_1000099B0(3, 1);
  sub_100002D6C(1, "%s: safeObliterate: Clearing NVRAM Key", "safeObliterate");
  sub_100002D6C(0, "%s: Clearing Obliteration in Progress", "clearOblitNVRAMkey");
  sub_100010698(@"oblit-inprogress");
  if (v30) {
    sub_10000E2B8(v30);
  }
  if (!v73) {
    return 13;
  }
  sub_100002D6C(0, "%s: safeObliterate: all done, returning ECANCELED", "safeObliterate");
  return 89;
}

size_t sub_100004C2C(char *a1, char *a2, unsigned int a3)
{
  size_t v3 = 0;
  if (a1 && a2)
  {
    CFStringRef v6 = sub_10000FAC0(a1, 0);
    if (v6)
    {
      CFStringRef v7 = v6;
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 == CFStringGetTypeID() && CFStringGetCString(v7, a2, a3, 0x8000100u))
      {
        size_t v3 = strnlen(a2, a3) + 1;
      }
      else
      {
        CFTypeID v9 = CFGetTypeID(v7);
        if (v9 == CFDataGetTypeID())
        {
          CFIndex Length = CFDataGetLength((CFDataRef)v7);
          if (Length + 1 < (unint64_t)a3) {
            size_t v3 = Length + 1;
          }
          else {
            size_t v3 = a3;
          }
          BytePtr = CFDataGetBytePtr((CFDataRef)v7);
          memcpy(a2, BytePtr, v3);
          a2[v3 - 1] = 0;
        }
        else
        {
          size_t v3 = 0;
        }
      }
      CFRelease(v7);
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

void sub_100004D28(const __CFString *a1, unsigned __int8 a2, int a3)
{
  if (CFStringGetCString(a1, (char *)buffer, 1024, 0x8000100u) == 1)
  {
    size_t v6 = strlen((const char *)buffer);
    if (v6 > 0x3FF) {
      goto LABEL_22;
    }
    for (size_t i = v6; i; --i)
    {
      int v8 = v23[i + 15];
      if (v8 != 13 && v8 != 10) {
        break;
      }
    }
    int v10 = snprintf((char *)&buffer[i], 1024 - i, " [gF: 0x%016llX]", qword_100028BF0);
    CFIndex v11 = i + v10 >= 0x400 ? 1024 : i + v10;
    CFStringRef v12 = CFStringCreateWithBytes(kCFAllocatorDefault, buffer, v11, 0x8000100u, 0);
    if (v12)
    {
      CFStringRef v13 = v12;
      if (a3) {
        CFStringRef v14 = @"obliteration";
      }
      else {
        CFStringRef v14 = 0;
      }
      sub_100007590(v12, v14, a2);
      CFRelease(v13);
    }
    else
    {
LABEL_22:
      if (a3) {
        CFStringRef v16 = @"obliteration";
      }
      else {
        CFStringRef v16 = 0;
      }
      sub_100007590(a1, v16, a2);
    }
    if (byte_100028D40)
    {
      *(void *)__str = 0;
      uint64_t v22 = 0;
      memset(v23, 0, 11);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      snprintf(__str, 0x1BuLL, "%fs ", Current - *(double *)&qword_100028D38);
    }
    else
    {
      time_t v20 = time(0);
      ctime_r(&v20, __str);
      strcpy(&v23[8], ": ");
    }
    if (dword_1000286C0 != -1)
    {
      size_t v18 = strlen(__str);
      write(dword_1000286C0, __str, v18);
      size_t v19 = strlen((const char *)buffer);
      write(dword_1000286C0, buffer, v19);
      write(dword_1000286C0, "\n", 1uLL);
    }
  }
  else
  {
    if (a3) {
      CFStringRef v15 = @"obliteration";
    }
    else {
      CFStringRef v15 = 0;
    }
    sub_100007590(a1, v15, a2);
  }
}

void sub_100004F64(id a1, OS_xpc_object *a2, __CFDictionary *a3)
{
  signed int valuePtr = 0;
  byte_1000286D0 = 1;
  uint64_t v5 = &DiskSupport__metaData;
  byte_100028D30 = 0;
  byte_100028D31 = 0;
  byte_100028BE8 = 0;
  byte_100028D32 = 0;
  qword_100028D38 = 0;
  byte_100028D40 = 0;
  qword_100028BF0 = 0;
  qword_100028D08 = 0;
  byte_100028D01 = sub_10000F2DC();
  byte_100028D41 = 0;
  byte_100028D19 = 0;
  qword_100028D48 = 0;
  byte_100028D18 = 0;
  byte_100028BE9 = sub_1000108A0();
  if (dword_100028CF8) {
    sub_100002D6C(1, "%s: Error: sepService is supposed to be NULL at handle_message(), 0x%x instead", "handle_message", dword_100028CF8);
  }
  long long v73 = 0u;
  long long v74 = 0u;
  memset(&v77, 0, 512);
  xpc_connection_get_audit_token();
  memset(&token, 0, sizeof(token));
  CFErrorRef error = 0;
  size_t v6 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (!v6)
  {
    sub_100002D6C(1, "%s: Could not create the security task from the audit token", "verify_obliteration_client");
LABEL_8:
    sub_100002D6C(1, "%s: Could not verify the obliteration client");
    goto LABEL_128;
  }
  CFStringRef v7 = v6;
  CFTypeRef v8 = SecTaskCopyValueForEntitlement(v6, @"allow-obliterate-device", &error);
  if (!v8)
  {
    sub_100002D6C(1, "%s: Could not extract the value for the entitlement", "verify_obliteration_client");
    int v10 = -1;
    goto LABEL_17;
  }
  CFTypeID v9 = v8;
  if (error)
  {
    sub_100002D6C(1, "%s: There was an error retrieving the entitlement value");
LABEL_15:
    int v10 = -1;
    goto LABEL_16;
  }
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(v9))
  {
    sub_100002D6C(1, "%s: The entitlement value is not a BOOLean");
    goto LABEL_15;
  }
  if (!CFEqual(v9, kCFBooleanTrue))
  {
    sub_100002D6C(1, "%s: The client does not have the obliteration entitlement");
    goto LABEL_15;
  }
  int v10 = 0;
LABEL_16:
  CFRelease(v9);
LABEL_17:
  uint64_t v5 = &DiskSupport__metaData;
  if (error) {
    CFRelease(error);
  }
  CFRelease(v7);
  if (v10) {
    goto LABEL_8;
  }
  Value = CFDictionaryGetValue(a3, @"DisplayProgressBar");
  if (Value)
  {
    byte_1000286D0 = CFEqual(Value, kCFBooleanTrue) != 0;
    sub_100002D6C(1, "%s: Option: set gShowProgress to %s");
  }
  else
  {
    sub_100002D6C(1, "%s: Caller did not specify preference for progress bar. Defaulting to %d.");
  }
  CFStringRef v13 = CFDictionaryGetValue(a3, @"IgnoreMissingPath");
  if (v13)
  {
    if (CFEqual(v13, kCFBooleanTrue))
    {
      sub_100002D6C(1, "%s: Option: set gPathMissOkay = true", "handle_message");
      byte_100028BE8 = 1;
    }
    else
    {
      sub_100002D6C(1, "%s: Option: set gPathMissOkay = false", "handle_message");
      byte_100028BE8 = 0;
    }
  }
  else
  {
    sub_100002D6C(1, "%s: Caller did not specify preference for missing Exclusion path. Defaulting to %d", "handle_message", byte_100028BE8);
  }
  CFStringRef v14 = CFDictionaryGetValue(a3, @"SkipDataObliteration");
  if (v14) {
    CFEqual(v14, kCFBooleanTrue);
  }
  CFStringRef v15 = CFDictionaryGetValue(a3, @"ObliterationManagedDeviceWipe");
  if (v15 && CFEqual(v15, kCFBooleanTrue))
  {
    CFStringRef v16 = "%s: Managed Device Wipe Chosen";
    char v17 = 1;
  }
  else
  {
    char v17 = 0;
    CFStringRef v16 = "%s: Not a Managed Device Wipe Request";
  }
  byte_100028D19 = v17;
  int v18 = 1;
  sub_100002D6C(1, v16, "handle_message");
  size_t v19 = CFDictionaryGetValue(a3, @"ObliterationBrickIncludesFirmware");
  if (v19 && CFEqual(v19, kCFBooleanFalse))
  {
    sub_100002D6C(1, "%s: Not including firmware in brick operation", "handle_message");
    int v18 = 0;
  }
  time_t v20 = CFDictionaryGetValue(a3, @"IgnoreInternalBuildSetting");
  if (v20 && CFEqual(v20, kCFBooleanTrue))
  {
    byte_100028D01 = 0;
    sub_100002D6C(1, "%s: Ignoring internal build - assuming customer build", "handle_message");
  }
  CFStringRef v21 = (const __CFString *)CFDictionaryGetValue(a3, @"ObliterationMessage");
  CFStringRef v22 = v21;
  if (v21)
  {
    CFTypeID v23 = CFGetTypeID(v21);
    if (v23 == CFStringGetTypeID())
    {
      if (CFStringGetCString(v22, (char *)&token, 512, 0x8000100u)) {
        sub_100002D6C(1, "%s: Option: reason is '%s'", "handle_message", (const char *)&token);
      }
      uint64_t v5 = &DiskSupport__metaData;
    }
  }
  CFArrayRef v24 = (const __CFArray *)CFDictionaryGetValue(a3, @"ExclusionPaths");
  if (v24)
  {
    CFArrayRef v25 = v24;
    CFTypeID v26 = CFGetTypeID(v24);
    if (v26 != CFArrayGetTypeID())
    {
      sub_100002D6C(1, "%s: Exclusions paths isn't an array", "handle_message");
      goto LABEL_125;
    }
    if (CFArrayGetCount(v25))
    {
      int v71 = v18;
      if (CFArrayGetCount(v25) >= 1)
      {
        for (CFIndex i = 0; i < CFArrayGetCount(v25); ++i)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v25, i);
          CFTypeID v29 = CFGetTypeID(ValueAtIndex);
          if (v29 != CFStringGetTypeID())
          {
            sub_100002D6C(1, "%s: Exclusions path isn't a string");
            goto LABEL_124;
          }
          if (!CFStringGetCString(ValueAtIndex, (char *)&token, 1025, 0x8000100u))
          {
            sub_100002D6C(1, "%s: Could not get string");
            goto LABEL_124;
          }
          v30 = realpath_DARWIN_EXTSN((const char *)&token, 0);
          if (v30)
          {
            v31 = v30;
            sub_100002D6C(1, "%s: realpath(%s) returned %s, path checks out okay.", "handle_message", (const char *)&token, v30);
            free(v31);
          }
          else
          {
            int v32 = byte_100028BE8;
            int v33 = *__error();
            if (!v32)
            {
              sub_100002D6C(1, "%s: realpath(%s) returned %d, path doesn't appear to exist.");
LABEL_124:
              uint64_t v5 = &DiskSupport__metaData;
LABEL_125:
              if (CFEqual(0, @"ObliterationTypeMarkStart")
                || CFEqual(0, @"ObliterationTypeMarkerCreate"))
              {
                LOBYTE(v5[46].base_props) = 1;
              }
              goto LABEL_128;
            }
            sub_100002D6C(1, "%s: realpath(%s) returned %d, path doesn't appear to exist, skipping as path miss is okay.", "handle_message", (const char *)&token, v33);
          }
        }
      }
      qword_100028D48 = (uint64_t)CFRetain(v25);
      uint64_t v5 = &DiskSupport__metaData;
      int v18 = v71;
    }
  }
  CFNumberRef v34 = (const __CFNumber *)CFDictionaryGetValue(a3, @"ObliterationSimulatedFailure");
  token.val[0] = 0;
  if (v34)
  {
    CFNumberGetValue(v34, kCFNumberIntType, &token);
    LODWORD(v34) = token.val[0];
  }
  sub_100002A68((int)v34, 0);
  v35 = CFDictionaryGetValue(a3, @"ObliterationType");
  if (!v35)
  {
    sub_100002D6C(1, "%s: No obliteration type specified in the options");
    goto LABEL_128;
  }
  v36 = v35;
  CFTypeID v37 = CFGetTypeID(v35);
  if (v37 != CFStringGetTypeID())
  {
    sub_100002D6C(1, "%s: Obliteration type is not CFString");
    goto LABEL_128;
  }
  if (byte_100028D32 == 1)
  {
    sub_100002D6C(1, "%s: Obliteration is already in progress, cannot handle another one, returning", "handle_message");
    LOBYTE(v5[46].base_props) = 1;
    goto LABEL_128;
  }
  sub_100002D6C(1, "%s: Obliteration started, sending ack to the caller...", "handle_message");
  sub_100002D6C(1, "%s: Examining the Data volume", "handle_message");
  bzero(&v77, 0x878uLL);
  if (byte_100028D00) {
    v38 = "/private/var/tmp/alt_root/private/var";
  }
  else {
    v38 = "/private/var";
  }
  if (statfs(v38, &v77) == -1)
  {
    v44 = __error();
    v45 = strerror(*v44);
    sub_100002D6C(1, "%s: Could not statfs %s: %s", "handle_message", v38, v45);
    LOBYTE(v5[46].base_props) = 1;
    goto LABEL_128;
  }
  if (CFDictionaryContainsKey(a3, @"ObliterationDelayAfterReply"))
  {
    CFNumberRef v39 = (const __CFNumber *)CFDictionaryGetValue(a3, @"ObliterationDelayAfterReply");
    if (v39 && (v40 = v39, v41 = v18, v42 = CFGetTypeID(v39), v43 = v42 == CFNumberGetTypeID(), int v18 = v41, v43))
    {
      CFNumberGetValue(v40, kCFNumberIntType, &valuePtr);
      if (valuePtr < 0)
      {
        sub_100002D6C(1, "%s: Incorrect Delay After Reply time of %d, ignoring");
      }
      else
      {
        sub_100002D6C(1, "%s: SENDING REPLY BACK TO CALLER and waiting for %d secs", "handle_message", valuePtr);
        sub_100007500((uint64_t)a2, @"Complete");
        if (valuePtr >= 1) {
          sleep(valuePtr);
        }
      }
    }
    else
    {
      sub_100002D6C(1, "%s: Invalid Delay After Reply time, ignoring..");
    }
  }
  else
  {
    sub_100002D6C(1, "%s: Continuing Obliteration Without Reply");
  }
  if (byte_100028D01) {
    CFStringRef v46 = (const __CFString *)CFDictionaryGetValue(a3, @"ObliterationCallingProcessName");
  }
  else {
    CFStringRef v46 = 0;
  }
  int v47 = v18;
  CFStringRef v48 = @"N/A";
  if (v46) {
    CFStringRef v49 = v46;
  }
  else {
    CFStringRef v49 = @"N/A";
  }
  if (v22) {
    CFStringRef v48 = v22;
  }
  CFStringRef v50 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Caller: %@, Type: %@, Reason: %@", v49, v36, v48);
  if (v50)
  {
    CFStringRef v51 = v50;
    CFStringRef v52 = CFStringCreateWithFormat(0, 0, @"%@", v50);
    if (v52)
    {
      CFStringRef v53 = v52;
      CStringPtr = CFStringGetCStringPtr(v52, 0x8000100u);
      int v55 = "<error getting string>";
      if (CStringPtr) {
        int v55 = CStringPtr;
      }
      sub_100002D6C(1, "%s: Logging obliteration reason: \"%s\"", "handle_message", v55);
      CFRelease(v53);
    }
    else
    {
      sub_100002D6C(1, "%s: Logging obliteration reason: \"%s\"", "handle_message", "<error getting string>");
    }
    sub_100007590(v51, @"oblit-begins", 1u);
    if (CFEqual(v36, @"ObliterateDataPartition"))
    {
      byte_100028D32 = 1;
      sub_100002D6C(1, "%s: Data Obliteration is in progress...", "handle_message");
      if (!sub_1000077A0((uint64_t)&v77, 1, 0, 0))
      {
        CFStringRef v56 = @"EACS Done";
LABEL_99:
        sub_1000087A8(v56, v46, v22);
        sub_100010698(@"orig-oblit");
        sub_100010698(@"oblit-begins");
        CFStringRef v57 = @"oblit-failure";
LABEL_100:
        sub_100010698(v57);
LABEL_121:
        CFRelease(v51);
        goto LABEL_128;
      }
      CFStringRef v58 = sub_10000FC48("orig-oblit", 0);
      if (!v58)
      {
        CFStringRef v59 = sub_10000FC48("obliteration", 0);
        if (!v59)
        {
LABEL_105:
          CFStringRef v60 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"EACS failed with [gF: 0x%016llX] Attempt: 1", qword_100028BF0);
          if (v60)
          {
            CFStringRef v61 = v60;
            sub_1000101EC("oblit-failure", v60);
            CFRelease(v61);
          }
          sub_100002D6C(0, "%s: Data Obliteration failed with error %d");
LABEL_120:
          uint64_t v5 = &DiskSupport__metaData;
          goto LABEL_121;
        }
        CFStringRef v58 = v59;
        sub_1000101EC("orig-oblit", v59);
      }
      CFRelease(v58);
      goto LABEL_105;
    }
    if (!CFEqual(v36, @"ObliterationTypeWipeAndBrick"))
    {
      if (CFEqual(v36, @"ObliterationTypeBrickOnly"))
      {
        sub_100002D6C(1, "%s: Bricking but preserving user data...", "handle_message");
        sub_100008880(v47);
        CFStringRef v62 = @"BrickOnly Done";
      }
      else
      {
        if (CFEqual(v36, @"ObliterationTypeMarkStart"))
        {
          sub_100002D6C(1, "%s: Marking Obliteration Begin in NVRAM...", "handle_message");
          sub_100009288();
          sub_1000034DC();
          byte_100028D31 = 1;
          sub_100002D6C(1, "%s: Marked in NVRAM, returning ...", "handle_message");
          goto LABEL_121;
        }
        if (CFEqual(v36, @"ObliterationTypeSafeWipe"))
        {
          sub_1000034DC();
          byte_100028D32 = 1;
          byte_100028D41 = 1;
          sub_100002D6C(1, "%s: SAFE WIPE Type Obliteration is in progress...", "handle_message");
          sub_100002D6C(1, "%s: Terminating Daemons for safe wipe ...", "handle_message");
          sub_1000097DC();
          sub_100002D6C(1, "%s: Terminating Daemons Complete, safe wipe started ...", "handle_message");
          sub_1000036E4();
          CFStringRef v62 = @"SafeWipe Done";
        }
        else
        {
          if (!CFEqual(v36, @"ObliterationTypeMarkerCreate"))
          {
            CFStringRef v69 = CFStringCreateWithFormat(0, 0, @"Unknown obliteration type '%@' specified", v36);
            CFStringRef v70 = v69;
            if (!v69) {
              CFStringRef v69 = @"Unknown obliteration type specified";
            }
            sub_1000087A8(v69, v46, v22);
            if (v70) {
              CFRelease(v70);
            }
            sub_100010698(@"oblit-begins");
            LOBYTE(v5[46].base_props) = 1;
            goto LABEL_121;
          }
          sub_100002D6C(1, "%s: Creating Marker files ...", "handle_message");
          byte_100028D31 = 1;
          CFStringRef v62 = @"MarkerCreate Done";
        }
      }
      sub_1000087A8(v62, v46, v22);
      CFStringRef v57 = @"oblit-begins";
      goto LABEL_100;
    }
    byte_100028D32 = 1;
    sub_100002D6C(1, "%s: Brick Obliteration is in progress...", "handle_message");
    if (!sub_1000077A0((uint64_t)&v77, 0, 1, v47))
    {
      CFStringRef v56 = @"WipeAndBrick Done";
      goto LABEL_99;
    }
    CFStringRef v63 = sub_10000FC48("orig-oblit", 0);
    if (!v63)
    {
      CFStringRef v64 = sub_10000FC48("obliteration", 0);
      if (!v64)
      {
LABEL_117:
        CFStringRef v65 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Brick failed with [gF: 0x%016llX] Attempt: 1", qword_100028BF0);
        if (v65)
        {
          CFStringRef v66 = v65;
          sub_1000101EC("oblit-failure", v65);
          CFRelease(v66);
        }
        sub_100002D6C(0, "%s: Brick failed with error %d");
        goto LABEL_120;
      }
      CFStringRef v63 = v64;
      sub_1000101EC("orig-oblit", v64);
    }
    CFRelease(v63);
    goto LABEL_117;
  }
LABEL_128:
  if (sub_10000F384())
  {
    sub_100002EB4(0, 0, "/log/obliteration.log");
    sub_10000F80C((uint64_t)byte_100028BF8, (uint64_t)sub_10000F3F0);
    sub_10000F5E8();
  }
  if ((uint64_t)v5[46].base_props)
  {
    v67 = &stru_100024BF8;
    id v68 = &off_100024E30;
  }
  else
  {
    if (byte_100028D31 != 1)
    {
      v67 = &stru_100024C38;
      goto LABEL_136;
    }
    v67 = &stru_100024C18;
    id v68 = &off_100024E28;
  }
  sub_100007500((uint64_t)a2, *v68);
LABEL_136:
  xpc_connection_send_barrier(a2, v67);
}

const char *sub_100005E28(const char *result)
{
  if (result)
  {
    size_t v1 = result;
    uint64_t v5 = 0;
    int v2 = getmntinfo(&v5, 2);
    if (v2)
    {
      int v3 = v2;
      for (CFIndex i = v5->f_mntfromname; strcmp(v1, i); i += 2168)
      {
        uint64_t v5 = (statfs *)(i + 1056);
        if (!--v3) {
          return 0;
        }
      }
      return i - 1024;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100005EB0(const char *a1)
{
  if (unmount(a1, 0x80000) != -1) {
    return 0;
  }
  int v3 = __error();
  unint64_t v4 = strerror(*v3);
  sub_100002D6C(1, "%s: Could not unmount %s: %s", "unmountVolume", a1, v4);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100005FB0()
{
  objc_opt_class();
  uint64_t result = objc_opt_new();
  qword_100028D20 = result;
  return result;
}

void sub_100007500(uint64_t a1, const void *a2)
{
  int v3 = sub_10000F25C();
  CFDictionarySetValue(v3, @"IPCStatus", a2);
  if ((MOXPCTransportSendMessageOnConnection() & 1) == 0) {
    sub_100002D6C(1, "%s: Failed to not send response to the client", "send_reply_response_cf");
  }

  CFRelease(v3);
}

void sub_100007590(const __CFString *a1, const __CFString *a2, unsigned __int8 a3)
{
  if (!a1) {
    return;
  }
  if (!byte_100028D01 || (byte_100028D18 & 1) != 0)
  {
    size_t v6 = 0;
LABEL_5:
    CFStringRef v7 = 0;
    goto LABEL_6;
  }
  size_t v6 = CFDateFormatterCreate(kCFAllocatorDefault, 0, kCFDateFormatterShortStyle, kCFDateFormatterLongStyle);
  if (!v6) {
    goto LABEL_5;
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFStringRef StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(kCFAllocatorDefault, v6, Current);
  CFStringRef v7 = StringWithAbsoluteTime;
  if (StringWithAbsoluteTime)
  {
    CFStringRef v8 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@: %@", StringWithAbsoluteTime, a1);
    if (!a2) {
      goto LABEL_21;
    }
    goto LABEL_11;
  }
LABEL_6:
  CFStringRef v8 = 0;
  if (!a2) {
    goto LABEL_21;
  }
LABEL_11:
  if (((v8 != 0) & a3) != 0) {
    CFStringRef v11 = v8;
  }
  else {
    CFStringRef v11 = a1;
  }
  mach_port_t mainPort = 0;
  if (IOMainPort(bootstrap_port, &mainPort))
  {
    CFStringRef v12 = "%s: Could not get main port";
  }
  else
  {
    io_registry_entry_t v13 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
    if (v13)
    {
      io_object_t v14 = v13;
      if (IORegistryEntrySetCFProperty(v13, a2, v11)) {
        sub_100002D6C(0, "%s: Could not set obliterate setting");
      }
      IOObjectRelease(v14);
      goto LABEL_21;
    }
    CFStringRef v12 = "%s: Could not get options entry from the device tree";
  }
  sub_100002D6C(0, v12);
LABEL_21:
  if (sub_10000F384())
  {
    if (v8) {
      uint64_t v15 = (uint64_t)v8;
    }
    else {
      uint64_t v15 = (uint64_t)a1;
    }
    CFStringRef v16 = sub_10000F4A8(v15, (uint64_t)&_CFRetain, (uint64_t)&_CFRelease);
    if (v16)
    {
      sub_10000F6E0((uint64_t)v16);
    }
    else if (dword_1000286C0 != -1)
    {
      write(dword_1000286C0, "Failed to create in memory logging data\n", 0x29uLL);
    }
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v8) {
    CFRelease(v8);
  }
}

uint64_t sub_1000077A0(uint64_t a1, int a2, int a3, int a4)
{
  IOPMAssertionID AssertionID = 0;
  __int16 v46 = 0;
  memset(v54, 0, sizeof(v54));
  memset(v53, 0, sizeof(v53));
  memset(v52, 0, sizeof(v52));
  sub_1000034DC();
  sub_100009288();
  CFDictionaryRef v8 = (const __CFDictionary *)MKBUserTypeDeviceMode();
  if (!v8
    || (CFDictionaryRef v9 = v8,
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v8, kMKBDeviceModeKey),
        CFComparisonResult v11 = CFStringCompare(Value, kMKBDeviceModeSharedIPad, 0),
        CFRelease(v9),
        v11))
  {
    uint64_t v12 = 0xFFFFFFFFLL;
    BOOL v13 = sub_100009934();
    if (v13) {
      sub_100002D6C(1, "%s: Device is in multiuser mode", "obliterate");
    }
    if (IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, @"Mobile Obliteratation", &AssertionID))
    {
      sub_100002D6C(1, "%s: Cannot prevent idle sleep", "obliterate");
      if (!a3) {
        goto LABEL_146;
      }
    }
    if (dword_1000286C0 != -1) {
      ramrod_add_log_fd(dword_1000286C0);
    }
    ramrod_log_set_buffermsgs(0);
    ramrod_set_syslog_flush_msgs(0);
    ramrod_display_set_showprogress(byte_1000286D0);
    sub_100002D6C(1, "%s: Posting the data eschaton notification", "obliterate");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if (DarwinNotifyCenter) {
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobile.data_eschaton", 0, 0, 1u);
    }
    else {
      sub_100002D6C(1, "%s: Could not get the darwin notification center", "post_notification");
    }
    sub_100002D6C(1, "%s: Taking the device off the USB bus", "obliterate");
    values[0] = 0;
    int v16 = IOUSBDeviceControllerCreate();
    if (v16)
    {
      if (v16 == -536870160)
      {
        char v17 = 1;
        sub_100002D6C(1, "%s: The USB device controller could not be found. It's cool.", "getoff_bus");
LABEL_21:
        if (values[0]) {
          CFRelease(values[0]);
        }
        if ((v17 & 1) == 0)
        {
          qword_100028BF0 |= 1uLL;
          sub_100002D6C(0, "%s: Could not get off the USB bus", "obliterate");
          if (!a3) {
            goto LABEL_146;
          }
        }
        if (byte_100028BE9)
        {
          sub_100002D6C(1, "%s: Skipping the disable of watchdog timer", "obliterate");
        }
        else
        {
          sub_100002D6C(1, "%s: Disabling the watchdog timer", "obliterate");
          sub_10000C8F4(@"com.apple.watchdogd");
          if (sub_10000CA54())
          {
            qword_100028BF0 |= 2uLL;
            sub_100002D6C(0, "%s: Could not disable the watchdog timer", "obliterate");
            if (!a3) {
              goto LABEL_146;
            }
          }
        }
        int v44 = a4;
        sub_100002D6C(1, "%s: Grabbing framebuffer", "obliterate");
        uint64_t v18 = MGCopyAnswer();
        if (!v18)
        {
          sub_100002D6C(1, "%s: Could not get device class.", "grab_framebuffer");
LABEL_37:
          qword_100028BF0 |= 4uLL;
          sub_100002D6C(0, "%s: Could not open framebuffer", "obliterate");
          if (!a3) {
            goto LABEL_146;
          }
LABEL_53:
          sub_100002D6C(1, "%s: Begin background progress bar UI thread", "obliterate");
          CFArrayRef v24 = malloc_type_malloc(0xCuLL, 0x10000403E1C8BA9uLL);
          sub_100002D6C(1, "%s: Faking from %3f to %3f expecting %d sec", "begin_fakery", 0.0, 1.0, 15);
          if (v24)
          {
            *(void *)CFArrayRef v24 = 0x3F80000000000000;
            v24[2] = 15;
            byte_100028D50 = 0;
            if (pthread_create((pthread_t *)&qword_100028D58, 0, (void *(__cdecl *)(void *))sub_10000CB7C, v24))
            {
              CFArrayRef v25 = __error();
              CFTypeID v26 = strerror(*v25);
              sub_100002D6C(1, "%s: could not spwawn thread: %s", "begin_fakery", v26);
            }
          }
          sub_100002D6C(1, "%s: Killing some daemons", "obliterate");
          qword_100028D38 = CFAbsoluteTimeGetCurrent();
          if (*(double *)&qword_100028D38 <= 0.0) {
            sub_100002D6C(1, "%s: Failed to get daemon unload timestamp", "obliterate");
          }
          else {
            byte_100028D40 = 1;
          }
          if (sub_1000097DC())
          {
            qword_100028BF0 |= 0x10uLL;
            sub_100002D6C(0, "%s: Could not kill daemons", "obliterate");
            if (!a3) {
              goto LABEL_145;
            }
          }
          if (a2)
          {
            sub_100002D6C(1, "%s: Capturing the Data volume state", "obliterate");
            v27 = sub_10000E030();
            if (v27)
            {
              int v28 = v27;
              if (sub_10000E338((uint64_t)v27, "/private/var/mobile/Library/Preferences/.GlobalPreferences.plist", "/System/Library/Obliteration/GlobalPreferences.plist"))
              {
                qword_100028BF0 |= 0x1000000uLL;
                sub_100002D6C(1, "%s: Could not add user preferences file.", "capture_data_volume");
              }
              sub_10000ED48((uint64_t)v28);
              CFArrayRef v29 = (const __CFArray *)qword_100028D48;
              if (qword_100028D48)
              {
                CFIndex v30 = 0;
                while (1)
                {
                  if (v30 >= CFArrayGetCount(v29)) {
                    goto LABEL_71;
                  }
                  CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)qword_100028D48, v30);
                  if (!CFStringGetCString(ValueAtIndex, (char *)values, 1025, 0x8000100u)) {
                    break;
                  }
                  if (sub_10000E338((uint64_t)v28, (char *)values, 0))
                  {
                    sub_100002D6C(1, "%s: Could not add item '%s' to scrapper");
                    goto LABEL_82;
                  }
                  ++v30;
                  CFArrayRef v29 = (const __CFArray *)qword_100028D48;
                  if (!qword_100028D48) {
                    goto LABEL_71;
                  }
                }
                sub_100002D6C(1, "%s: Could not extract C-string for path.");
LABEL_82:
                free(v28);
                goto LABEL_83;
              }
LABEL_71:
              sub_100002D6C(1, "%s: Successfully captured Data volume info", "capture_data_volume");
              sub_10000DFCC((uint64_t)v28);
LABEL_85:
              sub_100002D6C(1, "%s: Warming Launchd pages", "obliterate");
              int v45 = 0;
              if (sysctlbyname("kern.memorystatus_do_fastwake_warmup_all", 0, 0, &v45, 4uLL))
              {
                qword_100028BF0 |= 0x80uLL;
                __error();
                sub_100002D6C(1, "%s: memorystatus_do_fastwake_warmup_all failed with error: %d");
              }
              else
              {
                sub_100002D6C(1, "%s: memorystatus_do_fastwake_warmup_all success");
              }
              if (v13)
              {
                sub_100002D6C(1, "%s: Unmounting the User volume", "obliterate");
                if (sub_1000099B0(1, 1))
                {
                  qword_100028BF0 |= 0x4000000000000000uLL;
                  sub_100002D6C(0, "%s: Could not unmount the User volume", "obliterate");
                  if (!a3) {
                    goto LABEL_143;
                  }
                }
              }
              sub_100002D6C(1, "%s: Unmounting the Data volume", "obliterate");
              if (sub_1000099B0(0, 1))
              {
                qword_100028BF0 |= 0x100uLL;
                sub_100002D6C(0, "%s: Could not unmount the Data volume", "obliterate");
                if (!a3) {
                  goto LABEL_143;
                }
              }
              sub_100009A64((const char *)(a1 + 1112), v54);
              sub_100002D6C(1, "%s: Using container device name: %s", "obliterate", v54);
              sub_100002D6C(1, "%s: Obliterating the Data volume", "obliterate");
              if (sub_100009B7C(v54, (const char *)(a1 + 1112), a2, v13, (unsigned char *)&v46 + 1))
              {
                qword_100028BF0 |= 0x200uLL;
                sub_100002D6C(0, "%s: Could not obliterate the Data volume", "obliterate");
                if ((a3 & 1) == 0) {
                  goto LABEL_143;
                }
              }
              else if (!a3)
              {
                goto LABEL_98;
              }
              sub_100008880(v44);
LABEL_98:
              if (!a2)
              {
LABEL_139:
                if (sub_10000BBE8(320, &v46))
                {
                  sub_100002EB4(2, "/.obliteration_preserved", 0);
                  sub_10000BDE0();
                  sub_100002D6C(1, "%s: Cleaning Hardware volume", "obliterate");
                  sub_10000BEEC();
                  if ((_BYTE)v46) {
                    sub_10000C7D0(320);
                  }
                }
                sub_10000C8A4();
                uint64_t v12 = 0;
                goto LABEL_143;
              }
              sub_100002D6C(1, "%s: Reformatting the Data volume in container %s", "obliterate", v54);
              if (!sub_10000A374(v54, 1, (char *)v53, 0)
                || (sub_100002D6C(0, "%s: Could not reformat the Data volume", "obliterate"), a3))
              {
                if (!v13
                  || !sub_10000A374(v54, 0, (char *)v52, 0)
                  || (sub_100002D6C(0, "%s: Could not reformat the User volume", "obliterate"), a3))
                {
                  int v28 = sub_10000A628(v28, 1);
                  if (!v28)
                  {
                    qword_100028BF0 |= 0x800uLL;
                    sub_100002D6C(0, "%s: Could not setup the content for Data volume", "obliterate");
                    if (!a3)
                    {
LABEL_145:
                      dispatch_semaphore_t v38 = dispatch_semaphore_create(0);
                      CFNumberRef v39 = dispatch_queue_create("com.apple.obliterator.threadJoin", 0);
                      values[0] = _NSConcreteStackBlock;
                      values[1] = (CFTypeRef)3221225472;
                      values[2] = sub_10000D480;
                      values[3] = &unk_100024BB8;
                      values[4] = v38;
                      dispatch_async(v39, values);
                      dispatch_time_t v40 = dispatch_time(0, 5000000000);
                      dispatch_semaphore_wait(v38, v40);
                      usleep(0x3D090u);
LABEL_146:
                      sub_100002D6C(0, "%s:  ******** Obliteration done ******** ", "obliterate");
                      return v12;
                    }
                  }
                  byte_100028D00 = 1;
                  if (!sub_10000A7A8("/private/var/tmp") || a3)
                  {
                    int v32 = byte_100028D00 ? "/private/var/tmp/alt_root/private/var" : "/private/var";
                    int v33 = mkpath_np(v32, 0x1EDu);
                    if (!v33
                      || (int v34 = v33, v33 == 17)
                      || (qword_100028BF0 |= 0x1000uLL,
                          v35 = strerror(v33),
                          sub_100002D6C(1, "%s: Could not create the Data volume path %s, error %d (%s)", "obliterate", v32, v34, v35), a3))
                    {
                      sub_100002D6C(1, "%s: Remounting the Data volume %s at %s", "obliterate", (const char *)v53, v32);
                      if (!sub_10000A8A4((char *)v53, v32)
                        || (qword_100028BF0 |= 0x1000uLL,
                            sub_100002D6C(0, "%s: Could not remount the Data volume", "obliterate"),
                            a3))
                      {
                        if (!v13
                          || (sub_100002D6C(1, "%s: Setting up UM/AKS for the new Data volume", "obliterate"),
                              !sub_10000A964((const char *)v53, v32, (const char *)v52, 1))
                          || (qword_100028BF0 |= 0x20000000000000uLL,
                              sub_100002D6C(0, "%s: Failed to set up the data volume in multiuser mode", "obliterate"),
                              a3))
                        {
                          sub_100002D6C(1, "%s: Re-creating overprovisioning file", "obliterate");
                          if (sub_10000B1A4())
                          {
                            qword_100028BF0 |= 0x2000uLL;
                            sub_100002D6C(0, "%s: Could not re-create overprovisioning file", "obliterate");
                          }
                          sub_100002D6C(1, "%s: Creating mobile path", "obliterate");
                          sub_10000E9DC();
                          if (byte_100028D00) {
                            v36 = "/private/var/tmp/alt_root/private/var/mobile";
                          }
                          else {
                            v36 = "/private/var/mobile";
                          }
                          if (v13)
                          {
                            sub_100002D6C(1, "%s: Remounting the User volume %s at %s", "obliterate", (const char *)v52, v36);
                            if (sub_10000A8A4((char *)v52, v36))
                            {
                              qword_100028BF0 |= 0x10000000000000uLL;
                              sub_100002D6C(0, "%s: Could not remount the User volume", "obliterate");
                              if (!a3) {
                                goto LABEL_143;
                              }
                            }
                            CFTypeID v37 = "Shared ";
                          }
                          else
                          {
                            CFTypeID v37 = "";
                          }
                          sub_100002D6C(1, "%s: Rebuilding the %sData volume", "obliterate", v37);
                          if (!sub_10000B684((uint64_t)v28)
                            || (qword_100028BF0 |= 0x4000uLL,
                                sub_100002D6C(0, "%s: Could not rebuild the Data volume", "obliterate"),
                                a3))
                          {
                            if (!v13)
                            {
LABEL_136:
                              sub_100002D6C(1, "%s: Unmounting the Data volume post obliteration", "obliterate");
                              if (sub_1000099B0(0, 0))
                              {
                                qword_100028BF0 |= 0x40000000000000uLL;
                                sub_100002D6C(1, "%s: Failed to unmount the Data volume post obliteration", "obliterate");
                              }
                              sub_100002D6C(1, "%s: Unmounting the tmpfs volume post obliteration", "obliterate");
                              sub_1000099B0(3, 0);
                              goto LABEL_139;
                            }
                            sub_100002D6C(1, "%s: Populating USER volume with mastered content", "obliterate");
                            if (!sub_10000B9AC((uint64_t)v36)
                              || (qword_100028BF0 |= 0x80000000000000uLL,
                                  sub_100002D6C(0, "%s: Failed to create and set up a user volume for multiuser mode", "obliterate"), a3))
                            {
                              sub_100002D6C(1, "%s: Unmounting the User volume post obliteration", "obliterate");
                              if (sub_1000099B0(1, 0))
                              {
                                qword_100028BF0 |= 0x200000000000000uLL;
                                sub_100002D6C(1, "%s: Failed to unmount the User volume post obliteration", "obliterate");
                              }
                              goto LABEL_136;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
LABEL_143:
              if (v28) {
                sub_10000E2B8(v28);
              }
              goto LABEL_145;
            }
            sub_100002D6C(1, "%s: Could not create FS scraper.", "capture_data_volume");
LABEL_83:
            qword_100028BF0 |= 0x40uLL;
            sub_100002D6C(0, "%s: Could not capture the Data volume state", "obliterate");
            if (!a3) {
              goto LABEL_145;
            }
          }
          int v28 = 0;
          goto LABEL_85;
        }
        size_t v19 = (const void *)v18;
        sub_100002D6C(1, "%s: Unloading Springboard", "grab_framebuffer");
        sub_10000C8F4(@"com.apple.SpringBoard");
        sub_100002D6C(1, "%s: Unloaded Springboard", "grab_framebuffer");
        sub_100002D6C(1, "%s: Unloading backbaordd", "grab_framebuffer");
        sub_10000C8F4(@"com.apple.backboardd");
        sub_100002D6C(1, "%s: Unloaded backboardd", "grab_framebuffer");
        if (CFEqual(v19, @"RealityDevice") == 1)
        {
          sub_100002D6C(1, "%s: Unloading wakeboardd", "grab_framebuffer");
          sub_10000C8F4(@"com.apple.wakeboardd");
          sub_100002D6C(1, "%s: Unloaded wakeboardd", "grab_framebuffer");
        }
        if (sub_10000DFA0(0.0))
        {
          sub_100002D6C(1, "%s: Could not initialize progress bar to zero.");
LABEL_32:
          CFRelease(v19);
          goto LABEL_37;
        }
        if (CFEqual(v19, @"AppleTV") || CFEqual(v19, @"RealityDevice") | byte_100028BE9)
        {
          sub_100002D6C(1, "%s: Will not attempt to disable backlight for this platform", "grab_framebuffer");
          goto LABEL_52;
        }
        sub_100002D6C(1, "%s: Turning off backlight", "grab_framebuffer");
        keys = @"backlight-control";
        CFTypeRef v51 = 0;
        values[0] = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (!values[0]) {
          goto LABEL_73;
        }
        keys = @"IOPropertyMatch";
        CFDictionaryRef v20 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (!v20) {
          goto LABEL_73;
        }
        io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v20);
        if (!MatchingService) {
          goto LABEL_73;
        }
        io_registry_entry_t entry = MatchingService;
        int valuePtr = 0x8000;
        CFTypeRef v51 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
        if (!v51)
        {
          int v23 = -1;
          goto LABEL_76;
        }
        CFStringRef v48 = @"brightness";
        CFDictionaryRef v22 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&v48, &v51, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (v22)
        {
          CFDictionaryRef cf = v22;
          if (IORegistryEntrySetCFProperties(entry, v22)) {
            int v23 = -1;
          }
          else {
            int v23 = 0;
          }
          CFRelease(cf);
        }
        else
        {
LABEL_73:
          int v23 = -1;
        }
        if (v51) {
          CFRelease(v51);
        }
LABEL_76:
        if (values[0]) {
          CFRelease(values[0]);
        }
        if (v23)
        {
          sub_100002D6C(1, "%s: Could not turn on backlight.");
          goto LABEL_32;
        }
LABEL_52:
        CFRelease(v19);
        goto LABEL_53;
      }
      sub_100002D6C(1, "%s: Could not create controller %08x");
    }
    else
    {
      char v17 = 1;
      if (!IOUSBDeviceControllerForceOffBus()) {
        goto LABEL_21;
      }
      sub_100002D6C(1, "%s: Could not force controller off USB %08x");
    }
    char v17 = 0;
    goto LABEL_21;
  }
  sub_100002D6C(1, "%s: Shared Mode device, reverting to Safeboot wipe.", "obliterate");
  *__error() = 0;
  reboot(0);
  uint64_t v15 = __error();
  sub_100002D6C(1, "%s: Ooops... shouldn't be here - reboot() must have failed - errno %d!", "obliterate", *v15);
  byte_100028D30 = 1;
  if (*__error()) {
    return *__error();
  }
  else {
    return 35;
  }
}

void sub_1000087A8(const __CFString *a1, const __CFString *a2, const __CFString *a3)
{
  time_t v6 = time(0);
  CFStringRef v7 = @"N/A";
  if (a2) {
    CFStringRef v8 = a2;
  }
  else {
    CFStringRef v8 = @"N/A";
  }
  if (a3) {
    CFStringRef v7 = a3;
  }
  CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@ @%ld, Caller: %@, Reason: %@", a1, v6, v8, v7);
  if (v9)
  {
    CFStringRef v10 = v9;
    sub_100004D28(v9, 0, 1);
    CFRelease(v10);
  }
  else
  {
    sub_100004D28(a1, 0, 1);
  }
}

uint64_t sub_100008880(int a1)
{
  sub_100002D6C(1, "%s: Deleting kernelcaches", "brick");
  sub_10000D500();
  CFStringRef v53 = 0;
  int v2 = (__CFString *)sub_10000FAC0("boot-path", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v2)
    {
      int v3 = (const char *)[(__CFString *)v2 UTF8String];
      goto LABEL_6;
    }
  }
  else
  {
    sub_100002D6C(1, "%s: boot-path was not a string!?", "kernelcachePathFromVars");
    int v2 = 0;
  }
  int v3 = "/System/Library/Caches/com.apple.kernelcaches/kernelcache";
LABEL_6:
  memset(&v55, 0, sizeof(v55));
  int v4 = open("/private/preboot/active", 0);
  if (v4 != -1)
  {
    int v5 = v4;
    off_t v6 = lseek(v4, 0, 2);
    if (v6 == -1)
    {
      CFStringRef v8 = 0;
    }
    else
    {
      size_t v7 = v6;
      CFStringRef v8 = (char *)malloc_type_malloc(v6 + 1, 0x8E7123DAuLL);
      if (v8 && v7 == pread(v5, v8, v7, 0))
      {
        v8[v7] = 0;
        if (asprintf(&v53, "/private/preboot/%s%s", v8, v3) < 0)
        {
          sub_100002D6C(1, "%s: asprintf failed", "kernelcachePathFromVars");
          CFStringRef v53 = 0;
        }
        goto LABEL_17;
      }
    }
    sub_100002D6C(1, "%s: Failed to read /private/preboot/active", "kernelcachePathFromVars");
LABEL_17:
    close(v5);
    goto LABEL_18;
  }
  if (*__error() != 2)
  {
    CFStringRef v9 = __error();
    CFStringRef v10 = strerror(*v9);
    sub_100002D6C(1, "%s: Failed to open /private/preboot/active: %s", "kernelcachePathFromVars", v10);
  }
  CFStringRef v8 = 0;
LABEL_18:

  free(v8);
  CFComparisonResult v11 = v53;
  if (v53) {
    char v12 = sub_10000D584(v53) == 0;
  }
  else {
    char v12 = 0;
  }
  int v13 = glob_b("/private/preboot/*/System/Library/Caches/com.apple.kernelcaches/kernelcache*", 32, &stru_100024C88, &v55);
  if (v13 != -3 && v13)
  {
    qword_100028BF0 |= 0x40000000uLL;
    char v17 = __error();
    strerror(*v17);
    sub_100002D6C(1, "%s: glob_b failed: ret:%d err:%s");
  }
  else
  {
    size_t gl_pathc = v55.gl_pathc;
    if (v55.gl_pathc)
    {
      uint64_t v15 = 0;
      do
      {
        int v16 = v55.gl_pathv[v15];
        if (!v11 || strcmp(v11, v55.gl_pathv[v15])) {
          v12 |= sub_10000D584(v16) == 0;
        }
        ++v15;
      }
      while (gl_pathc != v15);
      globfree(&v55);
      if ((v12 & 1) == 0)
      {
        qword_100028BF0 |= 0x80000000uLL;
        sub_100002D6C(1, "%s: Failed to delete any kernelcaches...");
      }
    }
    else
    {
      globfree(&v55);
    }
  }
  free(v11);
  if (!a1)
  {
    sub_100002D6C(1, "%s: Setting auto-boot to false", "brick");
    return sub_10000FD1C("auto-boot", "false");
  }
  sub_100002D6C(1, "%s: Deleting firmware", "brick");
  CFDictionaryRef v18 = IOServiceMatching("AppleImage3NORAccess");
  if (v18)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v18);
    if (MatchingService)
    {
      io_service_t v20 = MatchingService;
      sub_100002D6C(1, "%s: Found device with AppleImage3NORAccess; Erasing Firmware", "deleteFirmware");
      LODWORD(v55.gl_pathc) = 0;
      if (IOServiceOpen(v20, mach_task_self_, 0, (io_connect_t *)&v55))
      {
        qword_100028BF0 |= 0x20000000000uLL;
        sub_100002D6C(1, "%s: Could not open the service");
      }
      else
      {
        sub_100002D6C(1, "%s: Erasing all Image3 firmware images", "delete_Image3_Firmware");
        if (IOConnectCallStructMethod(v55.gl_pathc, 2u, 0, 0, 0, 0))
        {
          qword_100028BF0 |= 0x40000000000uLL;
          sub_100002D6C(1, "%s: IOConnectCallStructMethod(%d) failed: 0x%x\n");
        }
      }
      if (LODWORD(v55.gl_pathc)) {
        IOServiceClose(v55.gl_pathc);
      }
      IOObjectRelease(v20);
      goto LABEL_51;
    }
    sub_100002D6C(1, "%s: Could not get the AppleImage3NORAccess service; Trying ASPStorage", "deleteFirmware");
    CFDictionaryRef v24 = IOServiceMatching("ASPStorage");
    if (v24)
    {
      io_service_t v25 = IOServiceGetMatchingService(kIOMainPortDefault, v24);
      if (v25)
      {
        IOObjectRelease(v25);
        sub_100002D6C(1, "%s: Found device with ASPStorage; Erasing Firmware", "deleteFirmware");
        uint64_t v54 = 1;
        uint64_t v52 = 0;
        if (sub_10000D688((char *)&v55))
        {
          qword_100028BF0 |= 0x4000000000000uLL;
LABEL_45:
          sub_100002D6C(1, "%s: Failed to find firmware partition, err=%d");
LABEL_51:
          CFDictionaryRef v22 = "%s: Firmware is gone?!";
          int v23 = 0;
          goto LABEL_52;
        }
        int v27 = open((const char *)&v55, 1);
        if (v27 == -1)
        {
          qword_100028BF0 |= 0x800000000uLL;
          BOOL v43 = __error();
          strerror(*v43);
          goto LABEL_72;
        }
        int v28 = v27;
        sub_100002D6C(1, "%s: Opened Device '%s': ", "delete_ASP_Firmware", (const char *)&v55);
        CFStringRef v53 = (char *)&v51;
        uint64_t v51 = 0;
        uint64_t v52 = sub_10000D8F0(v28, (const char *)&v55);
        int v29 = ioctl(v28, 0x8010641FuLL, &v53);
        if (v29)
        {
          int v30 = v29;
          qword_100028BF0 |= 0x1000000000uLL;
          v31 = __error();
          int v32 = strerror(*v31);
          sub_100002D6C(1, "%s: ioctl: %d DKIOCUNMAP failed: %s\n", "delete_ASP_Firmware", v30, v32);
        }
        sub_100002D6C(1, "%s: Completed DKIOCUNMAP on '%s': ", "delete_ASP_Firmware", (const char *)&v55);
        close(v28);
        memset(&v55, 0, 64);
        CFDictionaryRef v33 = IOServiceNameMatching("Apple LLB Media");
        io_service_t v34 = IOServiceGetMatchingService(kIOMainPortDefault, v33);
        if (v34)
        {
          io_registry_entry_t v35 = v34;
          if (IOObjectConformsTo(v34, "IOMedia"))
          {
            CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v35, @"BSD Name", kCFAllocatorDefault, 0);
            IOObjectRelease(v35);
            if (CFProperty)
            {
              __strlcpy_chk();
              if (!CFStringGetCString(CFProperty, (char *)&v55.gl_pathc + 5, 59, 0x8000100u))
              {
                CFRelease(CFProperty);
                sub_100002D6C(1, "%s: Failed to get LLB device name");
                goto LABEL_51;
              }
              sub_100002D6C(1, "%s: Found LLB device: %s", "delete_ASP_Firmware", (const char *)&v55);
              CFRelease(CFProperty);
              int v37 = open((const char *)&v55, 1);
              if (v37 != -1)
              {
                int v38 = v37;
                sub_100002D6C(1, "%s: Opened Device '%s': ", "delete_ASP_Firmware", (const char *)&v55);
                CFStringRef v53 = (char *)&v51;
                LODWORD(v54) = 1;
                uint64_t v51 = 0;
                uint64_t v52 = sub_10000D8F0(v38, (const char *)&v55);
                int v39 = ioctl(v38, 0x8010641FuLL, &v53);
                if (v39)
                {
                  int v40 = v39;
                  qword_100028BF0 |= 0x4000000000uLL;
                  int v41 = __error();
                  CFTypeID v42 = strerror(*v41);
                  sub_100002D6C(1, "%s: ioctl: %d DKIOCUNMAP failed: %s\n", "delete_ASP_Firmware", v40, v42);
                }
                sub_100002D6C(1, "%s: Completed DKIOCUNMAP on '%s': ", "delete_ASP_Firmware", (const char *)&v55);
LABEL_77:
                close(v38);
                goto LABEL_51;
              }
              qword_100028BF0 |= 0x2000000000uLL;
              CFStringRef v50 = __error();
              strerror(*v50);
              goto LABEL_72;
            }
          }
          else
          {
            IOObjectRelease(v35);
          }
        }
        else
        {
          sub_100002D6C(1, "%s: Failed to find llb object %s", "delete_ASP_Firmware", "Apple LLB Media");
        }
        sub_100002D6C(1, "%s: Failed to find LLB device");
        goto LABEL_51;
      }
      sub_100002D6C(1, "%s: Could not get the ASPStorage service; Trying NVMe", "deleteFirmware");
      CFDictionaryRef v26 = IOServiceMatching("AppleEmbeddedNVMeController");
      if (v26)
      {
        if (IOServiceGetMatchingService(kIOMainPortDefault, v26))
        {
          uint64_t v54 = 1;
          uint64_t v52 = 0;
          if (sub_10000D688((char *)&v55))
          {
            qword_100028BF0 |= (unint64_t)&_mh_execute_header;
            goto LABEL_45;
          }
          int v44 = open((const char *)&v55, 1);
          if (v44 != -1)
          {
            int v38 = v44;
            sub_100002D6C(1, "%s: Opened Device '%s': ", "delete_NVMe_Firmware", (const char *)&v55);
            CFStringRef v53 = (char *)&v51;
            uint64_t v51 = 0;
            uint64_t v52 = sub_10000D8F0(v38, (const char *)&v55);
            int v45 = ioctl(v38, 0x8010641FuLL, &v53);
            if (v45)
            {
              int v46 = v45;
              qword_100028BF0 |= 0x10000000000uLL;
              int v47 = __error();
              CFStringRef v48 = strerror(*v47);
              sub_100002D6C(1, "%s: ioctl: %d DKIOCUNMAP failed: %s\n", "delete_NVMe_Firmware", v46, v48);
            }
            sub_100002D6C(1, "%s: Completed DKIOCUNMAP on '%s': ", "delete_NVMe_Firmware", (const char *)&v55);
            goto LABEL_77;
          }
          qword_100028BF0 |= 0x8000000000uLL;
          CFStringRef v49 = __error();
          strerror(*v49);
LABEL_72:
          sub_100002D6C(1, "%s: Unable to open '%s': err='%s': ");
          goto LABEL_51;
        }
        qword_100028BF0 |= 0x200000000uLL;
        CFDictionaryRef v22 = "%s: Could not get the NVMe service as well; giving up...";
      }
      else
      {
        CFDictionaryRef v22 = "%s: Could not create NVMe matching dictionary";
      }
    }
    else
    {
      CFDictionaryRef v22 = "%s: Could not create ASP Storage MATCHING Dictionary";
    }
  }
  else
  {
    qword_100028BF0 |= 0x400000000uLL;
    CFDictionaryRef v22 = "%s: Could not create AppleImage3NORAccess MATCHING Dictionary";
  }
  int v23 = 1;
LABEL_52:
  sub_100002D6C(v23, v22, "deleteFirmware");
  sub_100002D6C(1, "%s: Delete Any existing EAN", "brick");
  v55.size_t gl_pathc = (size_t)"aptk";
  return sub_10000CCBC((uint64_t)&v55, 1u);
}

void sub_100009288()
{
  if (byte_100028D00) {
    int v0 = "/private/var/tmp/alt_root/private/var";
  }
  else {
    int v0 = "/private/var";
  }
  if (byte_100028D00) {
    size_t v1 = 37;
  }
  else {
    size_t v1 = 12;
  }
  sub_100002EB4(2, "/.obliteration_preserved", 0);
  uint64_t v2 = __strlcpy_chk();
  int v3 = mkpath_np(path, 0x1EDu);
  if (v3 && v3 != 17)
  {
    strerror(v3);
    sub_100002D6C(1, "%s: Could not create folder '%s' for temporary storage, error: %s");
    return;
  }
  CFArrayRef v4 = (const __CFArray *)qword_100028D48;
  if (!qword_100028D48) {
    return;
  }
  CFIndex v5 = 0;
  uint64_t v6 = 0;
  size_t v7 = &path[v2];
  size_t v8 = 1025 - (int)v2;
  while (v5 < CFArrayGetCount(v4))
  {
    memset(&v29, 0, sizeof(v29));
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)qword_100028D48, v5);
    if (CFStringGetCString(ValueAtIndex, v7, v8, 0x8000100u))
    {
      CFStringRef v10 = realpath_DARWIN_EXTSN(v7, 0);
      if (v10)
      {
        CFComparisonResult v11 = v10;
        if (!strncmp(v10, v0, v1))
        {
          strlcpy(v7, &v11[v1], v8);
          char v12 = strrchr(path, 47);
          if (!v12 || v12 == path)
          {
            sub_100002D6C(1, "%s: Could not find path of '%s', skipping");
          }
          else
          {
            int v13 = v12;
            *char v12 = 0;
            int v14 = mkpath_np(path, 0x1EDu);
            if (v14 && v14 != 17)
            {
              strerror(v14);
              sub_100002D6C(1, "%s: Could not create folder '%s' in temporary location, error: %s");
            }
            else
            {
              *int v13 = 47;
              uint64_t v15 = strdup(v11);
              if (v15)
              {
                int v16 = v15;
                char v17 = strdup(path);
                if (v17)
                {
                  CFDictionaryRef v18 = v17;
                  uint64_t v27 = v6;
                  int v28 = &v16[v1];
                  while (1)
                  {
                    size_t v19 = strrchr(v16, 47);
                    io_service_t v20 = v19;
                    if (!v19 || v19 == v28) {
                      goto LABEL_42;
                    }
                    *size_t v19 = 0;
                    CFStringRef v21 = strrchr(v18, 47);
                    if (!v21)
                    {
                      sub_100002D6C(1, "%s: Failed to find next '/' in destination path %s, might be malformed", "copy_preserved_files_to_storage", v18);
                      goto LABEL_43;
                    }
                    io_service_t v20 = v21;
                    *CFStringRef v21 = 0;
                    if (stat(v16, &v29))
                    {
                      int v23 = __error();
                      strerror(*v23);
                      __error();
                      sub_100002D6C(1, "%s: Failed to stat '%s' with error %s (%d)");
                      goto LABEL_42;
                    }
                    if (chown(v18, v29.st_uid, v29.st_gid)) {
                      break;
                    }
                    if (chmod(v18, v29.st_mode))
                    {
                      CFDictionaryRef v22 = __error();
                      strerror(*v22);
                      __error();
                      sub_100002D6C(1, "%s: Failed to change mode of '%s' with error %s (%d)");
                      goto LABEL_42;
                    }
                  }
                  CFDictionaryRef v24 = __error();
                  strerror(*v24);
                  __error();
                  sub_100002D6C(1, "%s: Failed to change ownership of '%s' with error %s (%d)");
LABEL_42:
                  if (v20 != v28)
                  {
LABEL_43:
                    sub_100002D6C(1, "%s: Failed to set permissions on %s", "copy_preserved_files_to_storage", v11);
                    uint64_t v6 = v27;
                    goto LABEL_47;
                  }
                  uint64_t v6 = v27;
                  if (copyfile(v11, path, 0, 0xFu))
                  {
                    io_service_t v25 = __error();
                    CFDictionaryRef v26 = strerror(*v25);
                    sub_100002D6C(1, "%s: Could not copy file '%s' to temporary location '%s', error: %s", "copy_preserved_files_to_storage", v11, path, v26);
                  }
                  else
                  {
                    sub_100002D6C(1, "%s: Successfully copied file '%s' to temporary location '%s'", "copy_preserved_files_to_storage", v11, path);
                    uint64_t v6 = (v27 + 1);
                  }
LABEL_47:
                  free(v11);
                  free(v16);
                  free(v18);
                }
                else
                {
                  sub_100002D6C(1, "%s: Failed to copy destination path %s", "copy_preserved_files_to_storage", path);
                  free(v11);
                  free(v16);
                }
                goto LABEL_36;
              }
              sub_100002D6C(1, "%s: Failed to copy source path %s");
            }
          }
        }
        else
        {
          sub_100002D6C(1, "%s: File '%s' is not under the Data (or User) volume '%s', skipping", "copy_preserved_files_to_storage", v11, v0);
        }
        free(v11);
      }
      else
      {
        sub_100002D6C(1, "%s: Could not find the real path of '%s', skipping");
      }
    }
    else
    {
      sub_100002D6C(1, "%s: Could not extract C-string for path... skipping");
    }
LABEL_36:
    ++v5;
    CFArrayRef v4 = (const __CFArray *)qword_100028D48;
    if (!qword_100028D48) {
      break;
    }
  }
  if ((int)v6 >= 1) {
    sub_100002D6C(1, "%s: Done copying files to temporary location, %d successfully copied");
  }
}

uint64_t sub_1000097DC()
{
  time_t v6 = time(0);
  int v0 = ctime(&v6);
  sub_100002D6C(1, "%s: Starting termination of Daemons:%s", "terminate_daemons", v0);
  uint64_t v1 = reboot3();
  if (v1) {
    int v2 = *__error();
  }
  else {
    int v2 = 0;
  }
  if (dword_1000286C0 != -1)
  {
    close(dword_1000286C0);
    dword_1000286C0 = open("/dev/console", 9);
  }
  if (v1)
  {
    int v3 = strerror(v2);
    sub_100002D6C(1, "%s: Reboot3: obliterate shutdown failed with error %s", "terminate_daemons", v3);
    uint64_t v1 = 0xFFFFFFFFLL;
  }
  else
  {
    sub_100002D6C(1, "%s: Reboot3: obliterate shutdown Completed", "terminate_daemons");
  }
  time_t v6 = time(0);
  CFArrayRef v4 = ctime(&v6);
  sub_100002D6C(0, "%s: Termination of daemons completed at %s", "terminate_daemons", v4);
  return v1;
}

void sub_1000098E8(id a1)
{
}

void sub_1000098F4(id a1)
{
}

void sub_100009900(id a1)
{
  usleep(0xF4240u);

  reboot3();
}

BOOL sub_100009934()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/filesystems");
  if (!v0) {
    return 0;
  }
  io_object_t v1 = v0;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v0, @"e-apfs", kCFAllocatorDefault, 0);
  BOOL v3 = CFProperty != 0;
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  IOObjectRelease(v1);
  return v3;
}

uint64_t sub_1000099B0(int a1, int a2)
{
  CFArrayRef v4 = sub_100002C78(a1);
  CFIndex v5 = v4;
  if (a2) {
    int v6 = 0x80000;
  }
  else {
    int v6 = 0;
  }
  if (unmount(v4, v6) == -1)
  {
    if (a2) {
      size_t v8 = "force-";
    }
    else {
      size_t v8 = "";
    }
    CFStringRef v9 = __error();
    CFStringRef v10 = strerror(*v9);
    sub_100002D6C(1, "%s: Could not %sunmount %s: %s", "unmount_volume", v8, v5, v10);
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t result = 0;
    if (!a1) {
      byte_100028D18 = 1;
    }
  }
  return result;
}

void sub_100009A64(const char *a1, char *a2)
{
  uint64_t v4 = 0;
  if (sscanf(a1, "disk%ds%d", (char *)&v4 + 4, &v4) == 2)
  {
    snprintf(a2, 0x40uLL, "disk%d");
  }
  else if (sscanf(a1, "/dev/disk%ds%d", (char *)&v4 + 4, &v4) == 2)
  {
    snprintf(a2, 0x40uLL, "/dev/disk%d");
  }
  else if (sscanf(a1, "/dev/rdisk%ds%d", (char *)&v4 + 4, &v4) == 2)
  {
    snprintf(a2, 0x40uLL, "/dev/rdisk%d");
  }
  else
  {
    sub_100002D6C(1, "%s: Data volume path looks odd: %s, defaulting to %s\n", "get_container_from_volume", a1, "/dev/rdisk0s1");
    strcpy(a2, "/dev/rdisk0s1");
  }
}

uint64_t sub_100009B7C(const char *a1, const char *a2, int a3, int a4, unsigned char *a5)
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (sub_100002BFC(1, "obliterate_data_volume")) {
    return 0xFFFFFFFFLL;
  }
  if (a3)
  {
    if (byte_100028D41 == 1)
    {
      if (a4 && sub_1000099B0(1, 1))
      {
        CFComparisonResult v11 = __error();
        sub_100002D6C(1, "%s: SafeWipe: Could not unmount the User volume %s (error: %d)", "obliterate_data_volume", a2, *v11);
      }
      if (sub_1000099B0(0, 1))
      {
        char v12 = __error();
        sub_100002D6C(1, "%s: SafeWipe: Could not unmount the Data volume %s (error: %d)", "obliterate_data_volume", a2, *v12);
      }
    }
    sub_100002D6C(1, "%s: Calling APFSVolumeDelete", "obliterate_data_volume");
    if (APFSVolumeDelete())
    {
      qword_100028BF0 |= 0x2000000uLL;
      sub_100002D6C(1, "%s: Could not delete the Data volume %s (error: %d)");
    }
  }
  else
  {
    sub_100002D6C(1, "%s: NoDelete requested, skipping deletion, just create+format");
  }
  if (sub_100002BFC(2, "obliterate_data_volume")) {
    return 0xFFFFFFFFLL;
  }
  sub_100002D6C(1, "%s: Delete other non fstab APFS volumes if present", "obliterate_data_volume");
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  CFMutableArrayRef v14 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  uint64_t v15 = v14;
  if (Mutable) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  char v17 = "removeOtherAPFSVolumes";
  if (v16)
  {
    sub_100002D6C(1, "%s: Unable to create Mutable Arrays, bail");
LABEL_52:
    CFArrayRef v26 = 0;
LABEL_55:
    int v39 = 0;
    goto LABEL_56;
  }
  sub_100002D6C(1, "%s: Creating a list of fssepc nodes from fstab", "removeOtherAPFSVolumes");
  if (setfsent())
  {
    CFDictionaryRef v18 = a5;
    size_t v19 = getfsent();
    if (v19)
    {
      io_service_t v20 = v19;
      do
      {
        *(_WORD *)buffer = 0;
        CFStringRef v21 = CFStringCreateWithCString(kCFAllocatorDefault, v20->fs_spec, 0x8000100u);
        fs_spec = v20->fs_spec;
        if (v21)
        {
          CFStringRef v23 = v21;
          sub_100002D6C(1, "%s: Adding fspec to the spec node array:%s", "removeOtherAPFSVolumes", fs_spec);
          CFArrayAppendValue(Mutable, v23);
          CFRelease(v23);
        }
        else
        {
          sub_100002D6C(1, "%s: Failed to create CFStr for spec file:%s", "removeOtherAPFSVolumes", fs_spec);
        }
        if (APFSVolumeRole())
        {
          sub_100002D6C(1, "%s: APFSVolumeRole for %s failed with %d");
        }
        else if (*(unsigned __int16 *)buffer == 192)
        {
          __strlcpy_chk();
          __strlcpy_chk();
          sub_100002D6C(1, "%s: Found Update volume device %s, default mount point '%s'");
        }
        io_service_t v20 = getfsent();
      }
      while (v20);
    }
    endfsent();
    a5 = v18;
  }
  int Count = CFArrayGetCount(Mutable);
  if (!Count)
  {
    sub_100002D6C(1, "%s: Unable to find any FSSpec nodes in fstab, bailing");
    goto LABEL_52;
  }
  sub_100002D6C(1, "%s: Creating List of APFS volume Spec Nodes", "removeOtherAPFSVolumes");
  io_service_t v25 = sub_10000CFF8();
  CFArrayRef v26 = v25;
  if (!v25)
  {
    sub_100002D6C(1, "%s: Unable to find any APFS Volume FSSpec nodes from IORegistry, bailing");
    goto LABEL_55;
  }
  int v27 = CFArrayGetCount(v25);
  if (!v27)
  {
    sub_100002D6C(1, "%s: APFS Volume FSSpec nodes list empty , bailing");
    goto LABEL_55;
  }
  int v44 = a1;
  int v45 = a5;
  if (v27 >= 1)
  {
    CFIndex v28 = 0;
    uint64_t v46 = v27;
    do
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v26, v28);
      if (Count < 1) {
        goto LABEL_41;
      }
      CFArrayRef v30 = v26;
      v31 = v17;
      int v32 = v15;
      CFIndex v33 = 0;
      char v34 = 0;
      do
      {
        CFStringRef v35 = (const __CFString *)CFArrayGetValueAtIndex(Mutable, v33);
        v34 |= CFStringFind(v35, ValueAtIndex, 0x40uLL).location != -1;
        ++v33;
      }
      while (Count != v33);
      uint64_t v15 = v32;
      char v17 = v31;
      CFArrayRef v26 = v30;
      if ((v34 & 1) == 0) {
LABEL_41:
      }
        CFArrayAppendValue(v15, ValueAtIndex);
      ++v28;
    }
    while (v28 != v46);
  }
  int v36 = CFArrayGetCount(v15);
  if (v36)
  {
    if (v36 < 1)
    {
      int v39 = 1;
    }
    else
    {
      CFIndex v37 = 0;
      uint64_t v38 = v36;
      int v39 = 1;
      do
      {
        CFStringRef v40 = (const __CFString *)CFArrayGetValueAtIndex(v15, v37);
        *(_OWORD *)buffer = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        CFStringGetCString(v40, buffer, 256, 0x8000100u);
        APFSVolumeRole();
        sub_100002D6C(1, "%s: Trying to delete APFS volume: %s", v17, buffer);
        if (APFSVolumeDelete()) {
          sub_100002D6C(1, "%s: Failed to delete volume: %s");
        }
        else {
          sub_100002D6C(1, "%s: Successfully deleted volume: %s");
        }
        ++v37;
      }
      while (v38 != v37);
    }
    a1 = v44;
    a5 = v45;
  }
  else
  {
    int v39 = 1;
    sub_100002D6C(1, "%s: Found no extraneous APFS volumes to delete", v17);
    a1 = v44;
    a5 = v45;
  }
LABEL_56:
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v26) {
    CFRelease(v26);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v39)
  {
    sub_100002D6C(1, "%s: Completed deletion of non fstab APFS volumes if present", "obliterate_data_volume");
  }
  else
  {
    sub_100002D6C(1, "%s: Could not delete existing non fstab APFS volumes", "obliterate_data_volume");
    qword_100028BF0 |= 0x4000000uLL;
  }
  *a5 = 0;
  sub_100002D6C(1, "%s: Calling APFSContainerWipeVolumeKeys for container %s", "obliterate_data_volume", a1);
  if (APFSContainerWipeVolumeKeys())
  {
    qword_100028BF0 |= 0x8000000uLL;
    sub_100002D6C(1, "%s: APFSContainerWipeVolumeKeys failed for container %s (error: %d)");
    return 0xFFFFFFFFLL;
  }
  if (sub_100002BFC(3, "obliterate_data_volume")) {
    return 0xFFFFFFFFLL;
  }
  if (byte_100028BE9)
  {
    sub_100002D6C(1, "%s: Wiping xART on VM", "obliterate_data_volume");
    *(_OWORD *)buffer = *(_OWORD *)&off_100024C58;
    sub_10000CCBC((uint64_t)buffer, 2u);
LABEL_72:
    sub_100002D6C(1, "%s: Revoking D Key", "obliterate_data_volume");
    if (MKBDeviceObliterateClassDKey())
    {
      qword_100028BF0 |= 0x20000000uLL;
      uint64_t v41 = 0xFFFFFFFFLL;
      sub_100002D6C(1, "%s: Unable to obliterate class-d key: %d", "obliterate_data_volume", -1);
      return v41;
    }
    if ((sub_100002BFC(5, "obliterate_data_volume") & 1) == 0)
    {
      *a5 = 1;
      CFAbsoluteTime v43 = CFAbsoluteTimeGetCurrent();
      sub_100002D6C(1, "%s: obliterate_data_volume() took %f seconds to complete with result %d", "obliterate_data_volume", v43 - Current, 0);
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  sub_100002D6C(1, "%s: Telling SEP to obliterate gigalockers.", "obliterate_data_volume");
  if (!sub_1000103C0())
  {
    qword_100028BF0 |= 0x10000000uLL;
    sub_100002D6C(1, "%s: Failed to obliterate gigalockers.");
    return 0xFFFFFFFFLL;
  }
  if ((sub_100002BFC(4, "obliterate_data_volume") & 1) == 0) {
    goto LABEL_72;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000A374(char *a1, int a2, char *a3, const char *a4)
{
  __argv[0] = "/sbin/newfs_apfs";
  __argv[1] = "-A";
  if (a4) {
    int v6 = a4;
  }
  else {
    int v6 = "reformat_volume";
  }
  __argv[2] = "-P";
  __argv[3] = "-v";
  if (a2) {
    size_t v7 = "Data";
  }
  else {
    size_t v7 = "User";
  }
  __argv[4] = v7;
  __argv[5] = "-R";
  size_t v8 = "u";
  if (a2) {
    size_t v8 = "d";
  }
  __argv[6] = v8;
  __argv[7] = "-D";
  __argv[8] = a1;
  __argv[9] = 0;
  sub_100002D6C(1, "%s: %s: Calling newfs_apfs for the %s volume on container %s", "reformat_volume", v6, v7, a1);
  if (sub_10000FA4C((const char **)__argv, 0))
  {
    uint64_t v9 = 0x40000;
    if (a2) {
      uint64_t v9 = 1024;
    }
    qword_100028BF0 |= v9;
    sub_100002D6C(1, "%s: %s: Could not newfs the Data volume: %d");
    return 0xFFFFFFFFLL;
  }
  sub_100002D6C(1, "%s: %s: newfs_apfs for the %s volume completed OK, looking up new volume dev node", "reformat_volume", v6, v7);
  if (APFSVolumeRoleFind() || CFArrayGetCount(0) != 1)
  {
    qword_100028BF0 |= 0x100000000000uLL;
    sub_100002D6C(1, "%s: %s: Error: expected exactly one volume with '%s' role");
    return 0xFFFFFFFFLL;
  }
  if (a3)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(0, 0);
    CFStringGetCString(ValueAtIndex, a3, 64, 0x8000100u);
    sub_100002D6C(1, "%s: %s: newfs_apfs new volume dev node is %s", "reformat_volume", v6, a3);
  }
  CFRelease(0);
  return 0;
}

void *sub_10000A628(void *a1, int a2)
{
  BOOL v3 = a1;
  if (a1 || (BOOL v3 = sub_10000E030()) != 0)
  {
    sub_10000EB90((uint64_t)v3, 0, a2);
    if (setfsent())
    {
      uint64_t v4 = getfsent();
      if (v4)
      {
        CFIndex v5 = v4;
        do
        {
          sub_100002EB4(0, "/", 0);
          fs_file = v5->fs_file;
          size_t v7 = strlen(fs_file);
          size_t v8 = strlen(byte_100028BF8);
          if (v7 > v8 && !strncmp(fs_file, byte_100028BF8, v8))
          {
            sub_100002D6C(1, "%s: Adding FSENT path %s", "setup_default_content_for_data_volume", fs_file);
            sub_10000E338((uint64_t)v3, v5->fs_file, 0);
          }
          CFIndex v5 = getfsent();
        }
        while (v5);
      }
      endfsent();
    }
    if (sub_10000E7C0(v3))
    {
      sub_100002D6C(1, "%s: Could not finalize FS capture.", "setup_default_content_for_data_volume");
      if (v3)
      {
        free(v3);
        return 0;
      }
    }
    else
    {
      sub_100002D6C(1, "%s: Successfully setup default Data volume content", "setup_default_content_for_data_volume");
      sub_10000DFCC((uint64_t)v3);
    }
  }
  else
  {
    sub_100002D6C(1, "%s: Could not create FS scraper.", "setup_default_content_for_data_volume");
  }
  return v3;
}

uint64_t sub_10000A7A8(char *a1)
{
  __argv[0] = "/sbin/mount_tmpfs";
  __argv[1] = a1;
  __argv[2] = 0;
  int v1 = mkpath_np(a1, 0x1EDu);
  if (v1 && v1 != 17)
  {
    qword_100028BF0 |= 0x1000000000000000uLL;
    strerror(v1);
    sub_100002D6C(1, "%s: Could not create tmpfs folder at %s, error: %d (%s)");
  }
  else
  {
    uint64_t result = sub_10000FA4C((const char **)__argv, 0);
    if (!result) {
      return result;
    }
    qword_100028BF0 |= 0x2000000000000000uLL;
    strerror(result);
    sub_100002D6C(1, "%s: Could not create tmpfs at %s, error: %d (%s)");
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000A8A4(char *a1, char *a2)
{
  __argv[0] = "/sbin/mount_apfs";
  __argv[1] = a1;
  __argv[2] = a2;
  __argv[3] = 0;
  uint64_t result = sub_10000FA4C((const char **)__argv, 0);
  if (result)
  {
    int v5 = result;
    qword_100028BF0 |= 0x200000000000uLL;
    int v6 = strerror(result);
    sub_100002D6C(1, "%s: Could not mount volume: %s at %s, error: %d (%s)", "mount_volume", a1, a2, v5, v6);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_10000A964(const char *a1, const char *a2, const char *a3, char a4)
{
  id v57 = 0;
  UInt8 bytes = 0;
  sub_100002D6C(1, "%s: Setting up user on %s (device: %s, user device: %s)", "multiuser_mode_setup_user_and_data_volumes", a2, a1, a3);
  size_t v8 = +[NSString stringWithCString:a2 encoding:1];
  if (!v8)
  {
    sub_100002D6C(1, "%s: Failed to convert data mount point string %s to NSString");
LABEL_14:
    id v11 = 0;
    uint64_t v17 = 0xFFFFFFFFLL;
    goto LABEL_114;
  }
  uint64_t v9 = v8;
  id v10 = +[UMLManager sharedManager];
  if (!v10)
  {
    sub_100002D6C(1, "%s: Failed to obtain shared UserManagement instance");
    goto LABEL_14;
  }
  id v11 = [v10 createPrimaryUserOnSharedDataVolumePath:v9 withError:&v57];
  if (v11) {
    BOOL v12 = v57 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    uint64_t v17 = 0;
    goto LABEL_23;
  }
  if (v57)
  {
    CFStringRef v13 = CFStringCreateWithFormat(0, 0, @"%@", v57);
    if (v13)
    {
      CFStringRef v14 = v13;
      CStringPtr = CFStringGetCStringPtr(v13, 0x8000100u);
      BOOL v16 = "<error getting string>";
      if (CStringPtr) {
        BOOL v16 = CStringPtr;
      }
      sub_100002D6C(1, "%s: Failed to create primary user with error:%s", "multiuser_mode_setup_user_and_data_volumes", v16);
      CFRelease(v14);
    }
    else
    {
      sub_100002D6C(1, "%s: Failed to create primary user with error:%s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
    }
    uint64_t v17 = (uint64_t)[v57 code];
  }
  else
  {
    uint64_t v17 = 0xFFFFFFFFLL;
  }
  if (v11 && (a4 & 1) == 0)
  {
    if (v57)
    {

      id v57 = 0;
    }
LABEL_23:
    unsigned int v18 = [v11 uid];
    CFStringRef v19 = CFStringCreateWithFormat(0, 0, @"%@", [v11 userUUID]);
    if (v19)
    {
      CFStringRef v20 = v19;
      CFStringRef v21 = CFStringGetCStringPtr(v19, 0x8000100u);
      if (v21) {
        CFDictionaryRef v22 = v21;
      }
      else {
        CFDictionaryRef v22 = "<error getting string>";
      }
      sub_100002D6C(1, "%s: Primary user create with uuid: %s and session uid:%d", "multiuser_mode_setup_user_and_data_volumes", v22, v18);
      CFRelease(v20);
    }
    else
    {
      sub_100002D6C(1, "%s: Primary user create with uuid: %s and session uid:%d", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>", v18);
    }
    CFUUIDRef v23 = CFUUIDCreateFromString(kCFAllocatorDefault, (CFStringRef)[v11 userUUID]);
    CFStringRef v24 = CFStringCreateWithFormat(0, 0, @"%@", v23);
    if (v24)
    {
      CFStringRef v25 = v24;
      CFArrayRef v26 = CFStringGetCStringPtr(v24, 0x8000100u);
      if (v26) {
        int v27 = v26;
      }
      else {
        int v27 = "<error getting string>";
      }
      sub_100002D6C(1, "%s: AKSIdentityCreateFirst attempt with UUID %s", "multiuser_mode_setup_user_and_data_volumes", v27);
      CFRelease(v25);
    }
    else
    {
      sub_100002D6C(1, "%s: AKSIdentityCreateFirst attempt with UUID %s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
    }
    CFDataRef v28 = CFDataCreate(kCFAllocatorDefault, &bytes, 1);
    CFStringRef v29 = CFStringCreateWithFormat(0, 0, @"%@", v28);
    if (v29)
    {
      CFStringRef v30 = v29;
      v31 = CFStringGetCStringPtr(v29, 0x8000100u);
      if (v31) {
        int v32 = v31;
      }
      else {
        int v32 = "<error getting string>";
      }
      sub_100002D6C(1, "%s: AKSIdentityCreateFirst attempt with emptyPass %s", "multiuser_mode_setup_user_and_data_volumes", v32);
      CFRelease(v30);
      if (!v23) {
        goto LABEL_45;
      }
    }
    else
    {
      sub_100002D6C(1, "%s: AKSIdentityCreateFirst attempt with emptyPass %s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
      if (!v23) {
        goto LABEL_45;
      }
    }
    if (v28 && (AKSIdentityCreateFirst() & 1) != 0)
    {
      sub_100002D6C(1, "%s: AKSIdentityCreateFirst success, loading the identity", "multiuser_mode_setup_user_and_data_volumes");
LABEL_55:
      if (v57)
      {

        id v57 = 0;
      }
      if (AKSIdentityLoad())
      {
        sub_100002D6C(1, "%s: AKSIdentityLoad Succeeded, calling SetPrimary", "multiuser_mode_setup_user_and_data_volumes");
      }
      else
      {
        CFStringRef v37 = CFStringCreateWithFormat(0, 0, @"%@", v57);
        if (v37)
        {
          CFStringRef v38 = v37;
          int v39 = CFStringGetCStringPtr(v37, 0x8000100u);
          if (v39) {
            CFStringRef v40 = v39;
          }
          else {
            CFStringRef v40 = "<error getting string>";
          }
          sub_100002D6C(1, "%s: AKSIdentityLoad failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", v40);
          CFRelease(v38);
        }
        else
        {
          sub_100002D6C(1, "%s: AKSIdentityLoad failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
        }
        if (v57) {
          uint64_t v17 = (uint64_t)[v57 code];
        }
        else {
          uint64_t v17 = 0xFFFFFFFFLL;
        }
        if (a4) {
          goto LABEL_110;
        }
      }
      if (v57)
      {

        id v57 = 0;
      }
      if (AKSIdentitySetPrimary())
      {
        sub_100002D6C(1, "%s: AKSIdentitySetPrimary succeded, binding Shared data volume", "multiuser_mode_setup_user_and_data_volumes");
        goto LABEL_83;
      }
      CFStringRef v41 = CFStringCreateWithFormat(0, 0, @"%@", v57);
      if (v41)
      {
        CFStringRef v42 = v41;
        CFAbsoluteTime v43 = CFStringGetCStringPtr(v41, 0x8000100u);
        if (v43) {
          int v44 = v43;
        }
        else {
          int v44 = "<error getting string>";
        }
        sub_100002D6C(1, "%s: AKSIdentitySetPrimary failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", v44);
        CFRelease(v42);
      }
      else
      {
        sub_100002D6C(1, "%s: AKSIdentitySetPrimary failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
      }
      if (v57) {
        uint64_t v17 = (uint64_t)[v57 code];
      }
      else {
        uint64_t v17 = 0xFFFFFFFFLL;
      }
      if ((a4 & 1) == 0)
      {
LABEL_83:
        memset(uu, 0, sizeof(uu));
        sub_100002D6C(1, "%s: Binding shared data volume to primary identity", "multiuser_mode_APFS_bind_data_volume");
        if (CFStringGetCString((CFStringRef)[v11 userUUID], buffer, 256, 0x8000100u))
        {
          if (uuid_parse(buffer, uu))
          {
            sub_100002D6C(1, "%s: Failed to parse unique string to uuid_t");
          }
          else
          {
            sub_100002D6C(1, "%s: Calling APFSVolumeEnableUserProtectionWithOptions with device_node:%s userUUID:%s", "multiuser_mode_APFS_bind_data_volume", a1, buffer);
            int v45 = APFSVolumeEnableUserProtectionWithOptions();
            if (!v45)
            {
              sub_100002D6C(1, "%s: Shared data volume bound to AKS with primary identity", "multiuser_mode_APFS_bind_data_volume");
              sub_100002D6C(1, "%s: Shared data volume bound to AKS with primary", "multiuser_mode_setup_user_and_data_volumes");
              goto LABEL_90;
            }
            strerror(v45);
            sub_100002D6C(1, "%s: APFSVolumeEnableUserProtectionWithOptions failed with error:%s");
          }
        }
        else
        {
          sub_100002D6C(1, "%s: Failed to retrieve CString from user UUID-string");
        }
        sub_100002D6C(1, "%s: Failed to bind Shared data volume", "multiuser_mode_setup_user_and_data_volumes");
        uint64_t v17 = 0xFFFFFFFFLL;
        if (a4) {
          goto LABEL_110;
        }
LABEL_90:
        if (v57)
        {

          id v57 = 0;
        }
        uint64_t v46 = [+[NSString stringWithCString:a3 encoding:1] lastPathComponent];
        CFStringRef v47 = CFStringCreateWithFormat(0, 0, @"%@", v46);
        if (v47)
        {
          CFStringRef v48 = v47;
          long long v49 = CFStringGetCStringPtr(v47, 0x8000100u);
          if (v49) {
            long long v50 = v49;
          }
          else {
            long long v50 = "<error getting string>";
          }
          sub_100002D6C(1, "%s: User Data Volume, calling volume map on %s", "multiuser_mode_setup_user_and_data_volumes", v50);
          CFRelease(v48);
          if (!v46)
          {
LABEL_101:
            CFStringRef v51 = CFStringCreateWithFormat(0, 0, @"%@", v57);
            if (v51)
            {
              CFStringRef v52 = v51;
              long long v53 = CFStringGetCStringPtr(v51, 0x8000100u);
              if (v53) {
                long long v54 = v53;
              }
              else {
                long long v54 = "<error getting string>";
              }
              sub_100002D6C(1, "%s: AKSVolumeMap not called (userDisk unavailable) or failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", v54);
              CFRelease(v52);
            }
            else
            {
              sub_100002D6C(1, "%s: AKSVolumeMap not called (userDisk unavailable) or failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
            }
            if (v57) {
              uint64_t v17 = (uint64_t)[v57 code];
            }
            else {
              uint64_t v17 = 0xFFFFFFFFLL;
            }
            goto LABEL_110;
          }
        }
        else
        {
          sub_100002D6C(1, "%s: User Data Volume, calling volume map on %s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
          if (!v46) {
            goto LABEL_101;
          }
        }
        if (AKSVolumeMap())
        {
          sub_100002D6C(1, "%s: AKS VolumeMapPath Success", "multiuser_mode_setup_user_and_data_volumes");
          goto LABEL_110;
        }
        goto LABEL_101;
      }
LABEL_110:
      if (v23) {
        CFRelease(v23);
      }
      if (v28) {
        CFRelease(v28);
      }
      goto LABEL_114;
    }
LABEL_45:
    CFStringRef v33 = CFStringCreateWithFormat(0, 0, @"%@", v57);
    if (v33)
    {
      CFStringRef v34 = v33;
      CFStringRef v35 = CFStringGetCStringPtr(v33, 0x8000100u);
      if (v35) {
        int v36 = v35;
      }
      else {
        int v36 = "<error getting string>";
      }
      sub_100002D6C(1, "%s: AKSIdentityCreateFirst not called (cfuuid or emptyPassRef unavailable) or failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", v36);
      CFRelease(v34);
    }
    else
    {
      sub_100002D6C(1, "%s: AKSIdentityCreateFirst not called (cfuuid or emptyPassRef unavailable) or failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
    }
    if (v57) {
      uint64_t v17 = (uint64_t)[v57 code];
    }
    else {
      uint64_t v17 = 0xFFFFFFFFLL;
    }
    if (a4) {
      goto LABEL_110;
    }
    goto LABEL_55;
  }
LABEL_114:

  return v17;
}

uint64_t sub_10000B1A4()
{
  int v26 = 0;
  uint64_t v25 = 0;
  memset(v28, 0, sizeof(v28));
  int v0 = APFSOverProvModel();
  if (!v0)
  {
    size_t v7 = "None";
LABEL_13:
    sub_100002D6C(1, "%s: System OVP model is %s", "create_overprovisioning_file", v7);
    return 0;
  }
  if (v0 != 1)
  {
    size_t v7 = "unknown";
    if (v0 == 2) {
      size_t v7 = "Volume based";
    }
    goto LABEL_13;
  }
  memset(&v27, 0, 512);
  sub_100002D6C(1, "%s: System OVP model is %s", "create_overprovisioning_file", "File based - going to create the OVP file now");
  v24[3] = 0;
  uint64_t v22 = 0;
  unint64_t v23 = 0;
  statfs("/", &v27);
  int v1 = strstr(v27.f_mntfromname, "disk");
  if (v1)
  {
    if (v1[4] < 48)
    {
      LODWORD(v2) = 0;
    }
    else
    {
      unint64_t v2 = 0;
      unsigned int v3 = v1[4];
      uint64_t v4 = v1 + 5;
      while (v3 <= 0x39 && v2 <= 1)
      {
        v21[v2] = v3;
        int v5 = v2 + 1;
        int v6 = v4[v2];
        unsigned int v3 = v4[v2++];
        if (v6 <= 47)
        {
          LODWORD(v2) = v5;
          break;
        }
      }
    }
    v21[v2] = 0;
  }
  __sprintf_chk((char *)v28, 0, 0x40uLL, "/dev/rdisk%s", v21);
  int v9 = open((const char *)v28, 0);
  if (v9 != -1)
  {
    int v10 = v9;
    if (ioctl(v9, 0x40046418uLL, &v26) == -1)
    {
      uint64_t v8 = *__error();
      __error();
      sub_100002D6C(1, "%s: unable to get DKIOCGETBLOCKSIZE: %d\n");
    }
    else if (ioctl(v10, 0x40086419uLL, &v25) == -1)
    {
      uint64_t v8 = *__error();
      __error();
      sub_100002D6C(1, "%s: unable to get DKIOCGETBLOCKCOUNT: %d\n");
    }
    else
    {
      uint64_t v11 = v25 * v26;
      uint64_t v12 = v11 + 0x3FFFFFFF;
      if (v11 >= 0) {
        uint64_t v12 = v25 * v26;
      }
      sub_100002D6C(1, "%s: device_uint32_t size = %llu (%lld GB)\n", "create_overprovisioning_file", v25 * v26, v12 >> 30);
      if ((unint64_t)(v11 / 100) >= 0x40000000) {
        unint64_t v13 = 0x40000000;
      }
      else {
        unint64_t v13 = v11 / 100;
      }
      sub_100002D6C(1, "%s: file_uint32_t size = %llu (%lld GB)\n", "create_overprovisioning_file", v13, v13 >> 30);
      sub_100002EB4(0, 0, "/.overprovisioning_file");
      int v14 = open_dprotected_np(byte_100028BF8, 2562, 6, 0, 384);
      if (v14 != -1)
      {
        int v15 = v14;
        v24[0] = 0x300000002;
        v24[1] = 0;
        v24[2] = v13;
        if (fcntl(v14, 42, v24) == -1 && *__error() == 28 && (LODWORD(v24[0]) = 0, fcntl(v15, 42, v24) == -1))
        {
          uint64_t v8 = *__error();
          __error();
          sub_100002D6C(1, "%s: preallocation of %llu bytes failed: %d \n");
        }
        else
        {
          uint64_t v16 = ftruncate(v15, v13);
          if (v16)
          {
            uint64_t v8 = v16;
            __error();
            sub_100002D6C(1, "%s: failed to write to %s file to establish the size (%d).\n");
          }
          else
          {
            uint64_t v19 = fcntl(v15, 51, 0);
            if (v19)
            {
              uint64_t v8 = v19;
              __error();
              sub_100002D6C(1, "%s: failed to fullsync %s file with %d.\n");
            }
            else
            {
              uint64_t v22 = 0;
              unint64_t v23 = v13;
              if (fcntl(v15, 100, &v22) == -1)
              {
                uint64_t v8 = *__error();
                __error();
                sub_100002D6C(1, "%s: F_TRIM_ACTIVE_FILE failed with: %d \n");
              }
              else
              {
                uint64_t v8 = 0;
              }
            }
          }
        }
        close(v10);
        int v18 = v15;
        goto LABEL_42;
      }
      uint64_t v8 = *__error();
      __error();
      sub_100002D6C(1, "%s: Could not open %s with error %d\n");
    }
    int v18 = v10;
LABEL_42:
    close(v18);
    return v8;
  }
  uint64_t v8 = *__error();
  uint64_t v17 = __error();
  sub_100002D6C(1, "%s: unable to open device: %d\n", "create_overprovisioning_file", *v17);
  return v8;
}

uint64_t sub_10000B684(uint64_t a1)
{
  int v2 = umask(0);
  sub_100002D6C(1, "%s: Old mask has value %o; New mask has value %o.", "rebuild_data_volume", v2, 0);
  uid_t v3 = geteuid();
  uid_t v4 = getuid();
  pid_t v5 = getpid();
  pid_t v6 = getppid();
  sub_100002D6C(1, "%s: EUID = %d; UID = %d; PID = %d; PPID = %d.", "rebuild_data_volume", v3, v4, v5, v6);
  if (byte_100028D19 == 1) {
    sub_10000F170();
  }
  sub_100002D6C(1, "%s: Creating whitelist directories", "rebuild_data_volume");
  int v7 = aks_bootstrap_fs();
  if (v7)
  {
    qword_100028BF0 |= 0x400000000000uLL;
    sub_100002D6C(1, "%s: aksutils_bootstrap_fs failed: %d", "rebuild_data_volume", v7);
  }
  sub_10000EF78();
  sub_100002D6C(1, "%s: Creating system keybag", "rebuild_data_volume");
  int System = MKBKeyBagCreateSystem();
  if (System)
  {
    qword_100028BF0 |= 0x1000000000000uLL;
    sub_100002D6C(1, "%s: Unable to create keybag: %d", "rebuild_data_volume", System);
    uint64_t v9 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v9 = 0;
  }
  sub_100002D6C(1, "%s: Restoring Data volume content", "rebuild_data_volume");
  if (byte_100028D00) {
    int v10 = "/private/var/tmp/alt_root";
  }
  else {
    int v10 = "/";
  }
  if (sub_10000E82C(a1, (uint64_t)v10))
  {
    qword_100028BF0 |= 0x800000000000uLL;
    uint64_t v9 = 0xFFFFFFFFLL;
    sub_100002D6C(1, "%s: Unable to restore filesystem stuff.");
  }
  else
  {
    sub_100002D6C(1, "%s: Restoring Data volume content Completed");
  }
  sub_100002EB4(4, "/private", "/var/db/timezone/localtime");
  if (symlink("/var/db/timezone/zoneinfo/US/Pacific", byte_100028BF8) == -1)
  {
    if (*__error() == 17)
    {
      sub_100002D6C(1, "%s: Timezone symlink already exists.");
    }
    else
    {
      qword_100028BF0 |= 8uLL;
      uint64_t v12 = __error();
      unint64_t v13 = strerror(*v12);
      sub_100002D6C(1, "%s: Could not symlink the timezone file '%s': %s", "rebuild_data_volume", byte_100028BF8, v13);
      uint64_t v9 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    sub_100002D6C(1, "%s: Symlink of TZDEFAULT(%s) to US/Pacific Completed OK", "rebuild_data_volume", byte_100028BF8);
    if (lchmod(byte_100028BF8, 0x1EDu) == -1)
    {
      uint64_t v11 = __error();
      strerror(*v11);
      sub_100002D6C(1, "%s: Could not set 0755 permission on symlink: %s");
    }
  }
  sub_10000EDEC();
  sub_100002EB4(0, "/root", "/.obliterated");
  int v14 = open(byte_100028BF8, 513, 420);
  if (v14 == -1)
  {
    qword_100028BF0 |= 0x8000uLL;
    int v15 = __error();
    uint64_t v16 = strerror(*v15);
    sub_100002D6C(1, "%s: Could not create the '.obliterated' marker file: %s", "rebuild_data_volume", v16);
  }
  else
  {
    close(v14);
  }
  return v9;
}

id sub_10000B9AC(uint64_t a1)
{
  id v19 = 0;
  int v1 = +[NSString stringWithCString:a1 encoding:1];
  int v2 = +[NSString stringWithCString:"/" encoding:1];
  uid_t v3 = v2;
  if (v1) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4
    || (objc_msgSend(+[UMLManager sharedManager](UMLManager, "sharedManager"), "createPrimaryUserLayoutWithOnUserVolumePath:fromSystemVolumePath:withError:", v1, v2, &v19) & 1) == 0)
  {
    CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"%@", v1);
    if (v6)
    {
      CFStringRef v7 = v6;
      CStringPtr = CFStringGetCStringPtr(v6, 0x8000100u);
      if (CStringPtr) {
        uint64_t v9 = CStringPtr;
      }
      else {
        uint64_t v9 = "<error getting string>";
      }
      sub_100002D6C(1, "%s: createPrimaryUserLayout for user mount point %s", "multiuser_mode_rebuild_user_volume", v9);
      CFRelease(v7);
    }
    else
    {
      sub_100002D6C(1, "%s: createPrimaryUserLayout for user mount point %s", "multiuser_mode_rebuild_user_volume", "<error getting string>");
    }
    CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"%@", v3);
    if (v10)
    {
      CFStringRef v11 = v10;
      uint64_t v12 = CFStringGetCStringPtr(v10, 0x8000100u);
      if (v12) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = "<error getting string>";
      }
      sub_100002D6C(1, "%s: createPrimaryUserLayout for system mount point %s", "multiuser_mode_rebuild_user_volume", v13);
      CFRelease(v11);
    }
    else
    {
      sub_100002D6C(1, "%s: createPrimaryUserLayout for system mount point %s", "multiuser_mode_rebuild_user_volume", "<error getting string>");
    }
    CFStringRef v14 = CFStringCreateWithFormat(0, 0, @"%@", v19);
    if (v14)
    {
      CFStringRef v15 = v14;
      uint64_t v16 = CFStringGetCStringPtr(v14, 0x8000100u);
      if (v16) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = "<error getting string>";
      }
      sub_100002D6C(1, "%s: createPrimaryUserLayoutWithOnUserVolumePath failed with error:%s", "multiuser_mode_rebuild_user_volume", v17);
      CFRelease(v15);
    }
    else
    {
      sub_100002D6C(1, "%s: createPrimaryUserLayoutWithOnUserVolumePath failed with error:%s", "multiuser_mode_rebuild_user_volume", "<error getting string>");
    }
    id v5 = [v19 code];
  }
  else
  {
    sub_100002D6C(1, "%s: createPrimaryUserLayoutWithOnUserVolumePath Success", "multiuser_mode_rebuild_user_volume");
    id v5 = 0;
  }

  return v5;
}

uint64_t sub_10000BBE8(int a1, unsigned char *a2)
{
  if (a1 == 192)
  {
    uid_t v3 = aPrivateVarMobi_1;
    BOOL v4 = &byte_100028DA0;
    id v5 = "Update";
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a1 != 320)
  {
    sub_100002D6C(1, "%s: Unknown or unsupported volume role 0x%x");
    return 0;
  }
  uid_t v3 = aPrivateVarHard;
  BOOL v4 = &byte_100028D60;
  id v5 = "Hardware";
  if (a2) {
LABEL_6:
  }
    *a2 = 0;
LABEL_7:
  if (!*v4)
  {
    sub_100002D6C(1, "%s: Warning: %s volume device-node/default-mount unknown!");
    return 0;
  }
  memset(&v13, 0, 512);
  if (*v3)
  {
    if (!statfs(v3, &v13))
    {
      size_t v6 = strlen(v3);
      if (!strncmp(v13.f_mntonname, v3, v6))
      {
        CFStringRef v11 = v4;
        uint64_t v12 = v3;
        CFStringRef v10 = v5;
        uint64_t v9 = "%s: %s volume %s is already mounted at '%s'";
LABEL_21:
        uint64_t v7 = 1;
        sub_100002D6C(1, v9, "try_mount_volume_by_role", v10, v11, v12, *(void *)&v13.f_bsize, v13.f_blocks, v13.f_bfree, v13.f_bavail, v13.f_files, v13.f_ffree, *(void *)&v13.f_fsid, *(void *)&v13.f_owner, *(void *)&v13.f_flags, *(void *)v13.f_fstypename, *(void *)&v13.f_fstypename[8], *(void *)v13.f_mntonname, *(void *)&v13.f_mntonname[8],
          *(void *)&v13.f_mntonname[16],
          *(void *)&v13.f_mntonname[24],
          *(void *)&v13.f_mntonname[32],
          *(void *)&v13.f_mntonname[40],
          *(void *)&v13.f_mntonname[48],
          *(void *)&v13.f_mntonname[56],
          *(void *)&v13.f_mntonname[64],
          *(void *)&v13.f_mntonname[72],
          *(void *)&v13.f_mntonname[80],
          *(void *)&v13.f_mntonname[88],
          *(void *)&v13.f_mntonname[96],
          *(void *)&v13.f_mntonname[104],
          *(void *)&v13.f_mntonname[112],
          *(void *)&v13.f_mntonname[120],
          *(void *)&v13.f_mntonname[128],
          *(void *)&v13.f_mntonname[136],
          *(void *)&v13.f_mntonname[144],
          *(void *)&v13.f_mntonname[152],
          *(void *)&v13.f_mntonname[160],
          *(void *)&v13.f_mntonname[168],
          *(void *)&v13.f_mntonname[176],
          *(void *)&v13.f_mntonname[184],
          *(void *)&v13.f_mntonname[192],
          *(void *)&v13.f_mntonname[200],
          *(void *)&v13.f_mntonname[208],
          *(void *)&v13.f_mntonname[216],
          *(void *)&v13.f_mntonname[224],
          *(void *)&v13.f_mntonname[232],
          *(void *)&v13.f_mntonname[240],
          *(void *)&v13.f_mntonname[248],
          *(void *)&v13.f_mntonname[256],
          *(void *)&v13.f_mntonname[264],
          *(void *)&v13.f_mntonname[272],
          *(void *)&v13.f_mntonname[280],
          *(void *)&v13.f_mntonname[288],
          *(void *)&v13.f_mntonname[296],
          *(void *)&v13.f_mntonname[304],
          *(void *)&v13.f_mntonname[312],
          *(void *)&v13.f_mntonname[320],
          *(void *)&v13.f_mntonname[328],
          *(void *)&v13.f_mntonname[336],
          *(void *)&v13.f_mntonname[344],
          *(void *)&v13.f_mntonname[352],
          *(void *)&v13.f_mntonname[360]);
        return v7;
      }
    }
  }
  if (!sub_10000A8A4(v4, v3))
  {
    if (a2) {
      *a2 = 1;
    }
    CFStringRef v10 = v5;
    uint64_t v9 = "%s: Successfully mounted %s volume";
    goto LABEL_21;
  }
  sub_100002D6C(1, "%s: Failed to mount %s volume (%s) with error %d");
  return 0;
}

uint64_t sub_10000BDE0()
{
  int v0 = removefile_state_alloc();
  int value = 0;
  if (removefile_state_set(v0, 3u, sub_10000D31C))
  {
    int v1 = __error();
    int v2 = strerror(*v1);
    sub_100002D6C(1, "%s: removefile_state_set REMOVEFILE_STATE_ERROR_CALLBACK failed: %s", "RemoveFileLayout", v2);
  }
  if (removefile_state_set(v0, 4u, &value))
  {
    uid_t v3 = __error();
    BOOL v4 = strerror(*v3);
    sub_100002D6C(1, "%s: removefile_state_set REMOVEFILE_STATE_ERROR_CONTEXT failed: %s", "RemoveFileLayout", v4);
  }
  if (removefile(byte_100028BF8, v0, 1u) && (int v5 = *__error(), v5 != 2) || (int v5 = value, (value & 0xFFFFFFFD) != 0))
  {
    size_t v6 = strerror(v5);
    sub_100002D6C(1, "%s: removefile for %s failed with error:%s", "RemoveFileLayout", byte_100028BF8, v6);
  }
  return removefile_state_free(v0);
}

void sub_10000BEEC()
{
  uint64_t v66 = 0;
  id v0 = [[+[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor") copyPersistentDataPathsWithError:&v66];
  id v1 = objc_alloc_init((Class)NSMutableDictionary);
  if (v1)
  {
    int v2 = v1;
    [v1 setObject:@"remove" forKey:off_1000286C8];
    uid_t v3 = &AKSIdentityCreateFirst_ptr;
    if (v0 && [v0 count])
    {
      id v4 = [[+[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor") copyMountPointForVolumeType:1 error:0];
      if (!v4 || (id v5 = v4, ![v4 length]))
      {
        sub_100002D6C(1, "%s: Warning: Failed to determine HW volume for MSU DA", "fixup_hardware_volume");
        goto LABEL_57;
      }
      long long v61 = (char *)[v5 length];
      if ([v5 characterAtIndex:v61 - 1] != 47)
      {
        id v5 = [v5 stringByAppendingString:@"/"];
        long long v61 = (char *)[v5 length];
      }
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v6 = [v0 countByEnumeratingWithState:&v62 objects:v67 count:16];
      if (v6)
      {
        id v7 = v6;
        CFStringRef v8 = @"Path not part of HW volume: '%@'";
        uint64_t v9 = *(void *)v63;
        id v60 = v5;
        do
        {
          for (CFIndex i = 0; i != v7; CFIndex i = (char *)i + 1)
          {
            if (*(void *)v63 != v9) {
              objc_enumerationMutation(v0);
            }
            CFStringRef v11 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            if (v11 && [*(id *)(*((void *)&v62 + 1) + 8 * i) hasPrefix:v5])
            {
              id v12 = v0;
              CFStringRef v13 = v8;
              id v14 = [v11 substringFromIndex:v61];
              if ([v14 containsString:@"/"])
              {
                id v15 = [v14 pathComponents];
                if ((unint64_t)[v15 count] < 2)
                {
                  id v31 = [v3[329] stringWithFormat:@"Failed to parse path '%@'", v11];
                  CFStringRef v32 = CFStringCreateWithFormat(0, 0, @"%@", v31);
                  if (v32)
                  {
                    CFStringRef v33 = v32;
                    CStringPtr = CFStringGetCStringPtr(v32, 0x8000100u);
                    if (CStringPtr) {
                      CFStringRef v35 = CStringPtr;
                    }
                    else {
                      CFStringRef v35 = "<error getting string>";
                    }
                    sub_100002D6C(1, "%s: %s", "fixup_hardware_volume", v35);
                    CFRelease(v33);
                  }
                  else
                  {
                    sub_100002D6C(1, "%s: %s", "fixup_hardware_volume", "<error getting string>");
                  }
                  goto LABEL_44;
                }
                id v16 = [v3[329] pathWithComponents:[v15 subarrayWithRange:0, (char *)[v15 count] - 1]];
                id v17 = [v15 objectAtIndexedSubscript:(char *)[v15 count] - 1];
                if ([v2 objectForKeyedSubscript:v16])
                {
                  unsigned int v18 = [[objc_msgSend(v2, "objectForKeyedSubscript:", v16) hasPrefix:@"removeExcept /"];
                  id v19 = v3;
                  unsigned int v20 = v18;
                  CFStringRef v21 = v19[329];
                  id v22 = [v2 objectForKeyedSubscript:v16];
                  if (v20)
                  {
                    [v2 setObject:[v21 stringWithFormat:@"%@ /%@/", v22, v17], v16 forKey];
                    uid_t v3 = &AKSIdentityCreateFirst_ptr;
                    goto LABEL_29;
                  }
                  id v31 = [v21 stringWithFormat:@"Mismatched rules from MSU DA: new: '%@' (going to be ignored), current exceptions list for path: '%@'", v16, v22];
                  CFStringRef v36 = CFStringCreateWithFormat(0, 0, @"%@", v31);
                  if (v36)
                  {
                    CFStringRef v37 = v36;
                    CFStringRef v38 = CFStringGetCStringPtr(v36, 0x8000100u);
                    if (v38) {
                      int v39 = v38;
                    }
                    else {
                      int v39 = "<error getting string>";
                    }
                    sub_100002D6C(1, "%s: %s", "fixup_hardware_volume", v39);
                    CFRelease(v37);
                  }
                  else
                  {
                    sub_100002D6C(1, "%s: %s", "fixup_hardware_volume", "<error getting string>");
                  }
                  uid_t v3 = &AKSIdentityCreateFirst_ptr;
LABEL_44:
                  CFStringRef v8 = v13;
                  free(v31);
LABEL_45:
                  id v0 = v12;
                  id v5 = v60;
                  continue;
                }
                CFStringRef v29 = (const __CFString *)[v3[329] stringWithFormat:@"removeExcept /%@/", v17];
                CFDataRef v28 = v2;
                id v30 = v16;
              }
              else
              {
                CFDataRef v28 = v2;
                CFStringRef v29 = @"keep";
                id v30 = v14;
              }
              [v28 setObject:v29 forKey:v30];
LABEL_29:
              CFStringRef v8 = v13;
              goto LABEL_45;
            }
            id v23 = [v3[329] stringWithFormat:v8, v11];
            CFStringRef v24 = CFStringCreateWithFormat(0, 0, @"%@", v23);
            if (v24)
            {
              CFStringRef v25 = v24;
              int v26 = CFStringGetCStringPtr(v24, 0x8000100u);
              if (v26) {
                statfs v27 = v26;
              }
              else {
                statfs v27 = "<error getting string>";
              }
              sub_100002D6C(1, "%s: %s", "fixup_hardware_volume", v27);
              CFRelease(v25);
            }
            else
            {
              sub_100002D6C(1, "%s: %s", "fixup_hardware_volume", "<error getting string>");
            }
            free(v23);
          }
          id v7 = [v0 countByEnumeratingWithState:&v62 objects:v67 count:16];
        }
        while (v7);
      }
    }
    else
    {
      CFStringRef v40 = +[NSString stringWithFormat:@"Warning: Failed to get default persistent data paths: error %@", v66];
      CFStringRef v41 = CFStringCreateWithFormat(0, 0, @"%@", v40);
      if (v41)
      {
        CFStringRef v42 = v41;
        CFAbsoluteTime v43 = CFStringGetCStringPtr(v41, 0x8000100u);
        int v44 = "<error getting string>";
        if (v43) {
          int v44 = v43;
        }
        sub_100002D6C(1, "%s: %s", "fixup_hardware_volume", v44);
        CFRelease(v42);
      }
      else
      {
        sub_100002D6C(1, "%s: %s", "fixup_hardware_volume", "<error getting string>");
      }
      free(v40);
    }
LABEL_57:
    if ([v2 objectForKeyedSubscript:@"MobileActivation"])
    {
      id v45 = [v3[329] stringWithFormat:@"Warning: A rule for 'MobileActivation' based on 'copyPersistentDataPaths' already exists: '%@'", [v2 objectForKeyedSubscript:@"MobileActivation"];
      CFStringRef v46 = CFStringCreateWithFormat(0, 0, @"%@", v45);
      if (v46)
      {
        CFStringRef v47 = v46;
        CFStringRef v48 = CFStringGetCStringPtr(v46, 0x8000100u);
        long long v49 = "<error getting string>";
        if (v48) {
          long long v49 = v48;
        }
        sub_100002D6C(1, "%s: %s", "fixup_hardware_volume", v49);
        CFRelease(v47);
      }
      else
      {
        sub_100002D6C(1, "%s: %s", "fixup_hardware_volume", "<error getting string>");
      }
      free(v45);
    }
    else
    {
      [v2 setObject:@"removeExcept /dcrt/ /sdcrt/" forKey:@"MobileActivation"];
    }
    if ([v2 objectForKeyedSubscript:@"dcrt"])
    {
      id v50 = [v3[329] stringWithFormat:@"Warning: A rule for 'dcrt' based on 'copyPersistentDataPaths' already exists: '%@'", [v2 objectForKeyedSubscript:@"dcrt"];
      CFStringRef v51 = CFStringCreateWithFormat(0, 0, @"%@", v50);
      if (v51)
      {
        CFStringRef v52 = v51;
        long long v53 = CFStringGetCStringPtr(v51, 0x8000100u);
        long long v54 = "<error getting string>";
        if (v53) {
          long long v54 = v53;
        }
        sub_100002D6C(1, "%s: %s", "fixup_hardware_volume", v54);
        CFRelease(v52);
      }
      else
      {
        sub_100002D6C(1, "%s: %s", "fixup_hardware_volume", "<error getting string>");
      }
      free(v50);
    }
    else
    {
      [v2 setObject:@"keep" forKey:@"dcrt"];
    }
    if ([v2 objectForKeyedSubscript:@"sdcrt"])
    {
      id v55 = [v3[329] stringWithFormat:@"Warning: A rule for 'sdcrt' based on 'copyPersistentDataPaths' already exists: '%@'", [v2 objectForKeyedSubscript:@"sdcrt"];
      CFStringRef v56 = CFStringCreateWithFormat(0, 0, @"%@", v55);
      if (v56)
      {
        CFStringRef v57 = v56;
        long long v58 = CFStringGetCStringPtr(v56, 0x8000100u);
        long long v59 = "<error getting string>";
        if (v58) {
          long long v59 = v58;
        }
        sub_100002D6C(1, "%s: %s", "fixup_hardware_volume", v59);
        CFRelease(v57);
      }
      else
      {
        sub_100002D6C(1, "%s: %s", "fixup_hardware_volume", "<error getting string>");
      }
      free(v55);
    }
    else
    {
      [v2 setObject:@"keep" forKey:@"sdcrt"];
    }
    -[DiskSupport traverseFolderAndRemoveItems:exceptions:](+[DiskSupport sharedInstance](DiskSupport, "sharedInstance"), "traverseFolderAndRemoveItems:exceptions:", [v3[329] stringWithUTF8String:aPrivateVarHard], v2);
  }
  else
  {
    sub_100002D6C(1, "%s: Could not create exceptions dictionary", "fixup_hardware_volume");
  }
}

void sub_10000C7D0(int a1)
{
  if (a1 == 192)
  {
    id v1 = aPrivateVarMobi_1;
  }
  else
  {
    if (a1 != 320)
    {
      sub_100002D6C(1, "%s: Unknown or unsupported volume role 0x%x");
      return;
    }
    id v1 = aPrivateVarHard;
  }
  if (unmount(v1, 0x80000))
  {
    qword_100028BF0 |= 0x8000000000000000;
    int v2 = __error();
    strerror(*v2);
    sub_100002D6C(1, "%s: Failed to unmount the %s volume: %s");
  }
  else
  {
    sub_100002D6C(1, "%s: Successfully unmounted the %s volume");
  }
}

void sub_10000C8A4()
{
  sub_100002D6C(0, "%s: Clearing Obliteration in Progress", "clearOblitNVRAMkey");

  sub_100010698(@"oblit-inprogress");
}

void sub_10000C8F4(CFStringRef jobLabel)
{
  CFErrorRef outError = 0;
  if (SMJobRemove(kSMDomainSystemLaunchd, jobLabel, 0, 1u, &outError))
  {
    CFStringRef v2 = CFStringCreateWithFormat(0, 0, @"%@", jobLabel);
    if (v2)
    {
      CFStringRef v3 = v2;
      CFStringGetCStringPtr(v2, 0x8000100u);
      sub_100002D6C(1, "%s: SMJobRemove:%s Success");
LABEL_6:
      CFRelease(v3);
      return;
    }
    sub_100002D6C(1, "%s: SMJobRemove:%s Success");
  }
  else
  {
    CFErrorGetCode(outError);
    CFStringRef v4 = CFStringCreateWithFormat(0, 0, @"%@", jobLabel);
    if (v4)
    {
      CFStringRef v3 = v4;
      CFStringGetCStringPtr(v4, 0x8000100u);
      sub_100002D6C(1, "%s: SMJobRemove:%s Failed, returned error:%d");
      goto LABEL_6;
    }
    sub_100002D6C(1, "%s: SMJobRemove:%s Failed, returned error:%d");
  }
}

uint64_t sub_10000CA54()
{
  kern_return_t v3;
  BOOL v4;
  uint64_t v5;
  kern_return_t v6;
  io_connect_t connect;

  connect = 0;
  CFDictionaryRef v0 = IOServiceMatching("IOWatchdog");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  if (!MatchingService)
  {
    sub_100002D6C(1, "%s: Failed to discover watchdog service");
    return 0xFFFFFFFFLL;
  }
  io_object_t v2 = MatchingService;
  CFStringRef v3 = IOServiceOpen(MatchingService, mach_task_self_, 1u, &connect);
  IOObjectRelease(v2);
  if (v3) {
    CFStringRef v4 = 1;
  }
  else {
    CFStringRef v4 = connect == 0;
  }
  if (v4)
  {
    sub_100002D6C(1, "%s: IOServiceOpen kIOWatchdogUserClientOpen failed with error: %d");
    return 0xFFFFFFFFLL;
  }
  id v6 = IOConnectCallScalarMethod(connect, 3u, 0, 0, 0, 0);
  if (v6)
  {
    sub_100002D6C(1, "%s: Failed to call kIOWatchdogDaemonDisableUserspaceMonitoring method, returned : %d", "disable_watchdog_only", v6);
    id v5 = 0xFFFFFFFFLL;
  }
  else
  {
    sub_100002D6C(1, "%s: Disabled watchdog timer", "disable_watchdog_only");
    id v5 = 0;
  }
  IOServiceClose(connect);
  return v5;
}

uint64_t sub_10000CB7C(void *a1)
{
  float v3 = *(float *)a1;
  float v2 = *((float *)a1 + 1);
  int v4 = *((_DWORD *)a1 + 2);
  sub_100002D6C(1, "%s: \tspawned drawing thread.", "drawing_routine");
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current <= 0.0)
  {
    sub_100002D6C(1, "%s: could not get start time");
  }
  else
  {
    double v6 = Current;
    double v7 = CFAbsoluteTimeGetCurrent();
    if (v7 <= 0.0)
    {
LABEL_6:
      sub_100002D6C(1, "%s: could not get time");
    }
    else
    {
      double v8 = (float)(v2 - v3);
      double v9 = v3;
      float v10 = 1.2 / (float)v4;
      while (1)
      {
        float v11 = v7 - v6;
        if (byte_100028D50 == 1) {
          break;
        }
        float v12 = v9 + v8 * tanh((float)(v10 * v11));
        sub_10000DFA0(v12);
        usleep(0x411Au);
        double v7 = CFAbsoluteTimeGetCurrent();
        if (v7 <= 0.0) {
          goto LABEL_6;
        }
      }
      sub_100002D6C(0, "%s: time to die. setting to %f. %f total seconds elapsed", "drawing_routine", *((float *)a1 + 1), v11);
      sub_10000DFA0(*((float *)a1 + 1));
    }
  }
  free(a1);
  return 0;
}

uint64_t sub_10000CCBC(uint64_t result, unsigned int a2)
{
  kern_return_t v13;
  CFDictionaryRef v14;
  io_service_t v15;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint64_t input;

  connect = 0;
  input = 0;
  output = 0;
  outputCnt = 1;
  if (!result) {
    return result;
  }
  float v2 = (const char **)result;
  if (!*(void *)result) {
    return result;
  }
  io_registry_entry_t v4 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/defaults");
  if (!v4)
  {
    sub_100002D6C(1, "%s: unable to find /defaults node\n", "deviceHasEANStorage");
    goto LABEL_9;
  }
  io_object_t v5 = v4;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v4, @"ean-storage-present", kCFAllocatorDefault, 0);
  IOObjectRelease(v5);
  if (!CFProperty)
  {
LABEL_9:
    sub_100002D6C(1, "%s: Device Does not Support EAN Storage, skipping...", "eraseEANStorage");
    io_object_t v10 = 0;
    io_object_t v9 = 0;
    goto LABEL_12;
  }
  CFRelease(CFProperty);
  sub_100002D6C(1, "%s: Supports EAN Storage, erasing...", "eraseEANStorage");
  CFDictionaryRef v7 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v7);
  io_object_t v9 = MatchingService;
  if (MatchingService)
  {
    if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
    {
      sub_100002D6C(1, "%s: Failed to open IOService with error:0x%x");
    }
    else if (connect)
    {
      if (a2)
      {
        uint64_t v11 = a2;
        float v12 = (unsigned int **)v2;
        do
        {
          input = bswap32(**v12);
          sub_100002D6C(1, "%s: Erasing EAN key %c%c%c%c.\n", "eraseEANStorage", BYTE3(input), WORD1(input), input >> 8, input);
          CFStringRef v13 = IOConnectCallMethod(connect, 5u, &input, 1u, 0, 0, &output, &outputCnt, 0, 0);
          if (v13)
          {
            qword_100028BF0 |= 0x80000000000uLL;
            sub_100002D6C(1, "%s: Erasing EAN key failed with error %d\n", "eraseEANStorage", v13);
          }
          ++v12;
          --v11;
        }
        while (v11);
      }
      if (!strcmp(*v2, "xrtC") && !strcmp(v2[1], "xrtP"))
      {
        id v14 = IOServiceMatching("AppleVirtualPlatformXART");
        id v15 = IOServiceGetMatchingService(kIOMainPortDefault, v14);
        io_object_t v10 = v15;
        if (v15)
        {
          if (IORegistryEntrySetCFProperty(v15, @"FORCE-RELOAD", kCFBooleanTrue))
          {
            qword_100028BF0 |= 0x80000000000uLL;
            sub_100002D6C(1, "%s: Failed to set FORCE_RELOAD on AppleVirtualPlatformXART with error: %d\n");
          }
        }
        else
        {
          sub_100002D6C(1, "%s: Failed to find AppleVirtualPlatformXART\n");
        }
        goto LABEL_12;
      }
    }
    else
    {
      sub_100002D6C(1, "%s: IOServiceOpen returned IO_OBJECT_NULL, bailing...");
    }
  }
  else
  {
    sub_100002D6C(1, "%s: Unable to find kNVMeEANServiceMatchName, bailing...");
  }
  io_object_t v10 = 0;
LABEL_12:
  uint64_t result = connect;
  if (connect) {
    uint64_t result = IOServiceClose(connect);
  }
  if (v9) {
    uint64_t result = IOObjectRelease(v9);
  }
  if (v10) {
    return IOObjectRelease(v10);
  }
  return result;
}

__CFArray *sub_10000CFF8()
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    id v1 = Mutable;
    CFMutableDictionaryRef properties = 0;
    *(void *)existing = 0;
    CFMutableDictionaryRef theDict = 0;
    CFMutableDictionaryRef v12 = 0;
    io_registry_entry_t parent = 0;
    sub_100002D6C(1, "%s: Creating List of APFS volume Spec Nodes", "findAll_APFSVolumes_OnDevice");
    CFDictionaryRef v2 = IOServiceMatching("AppleAPFSContainer");
    if (!IOServiceGetMatchingServices(kIOMainPortDefault, v2, &existing[1]))
    {
      io_object_t v3 = IOIteratorNext(existing[1]);
      if (!v3)
      {
        IOObjectRelease(existing[1]);
        sub_100002D6C(1, "%s: no APFS containers found");
        goto LABEL_24;
      }
      io_object_t v4 = v3;
      while (!IORegistryEntryGetParentEntry(v4, "IOService", &parent)
           && !IORegistryEntryGetChildIterator(v4, "IOService", existing))
      {
        if (IORegistryEntryCreateCFProperties(parent, &properties, kCFAllocatorDefault, 0)
          || IORegistryEntryCreateCFProperties(v4, &v12, kCFAllocatorDefault, 0))
        {
LABEL_21:
          sub_100002D6C(1, "%s: unable to fetch IORegistry properties");
          goto LABEL_24;
        }
        CFRelease(v12);
        CFRelease(properties);
        IOObjectRelease(parent);
        io_object_t v5 = IOIteratorNext(existing[0]);
        if (v5)
        {
          io_object_t v6 = v5;
          do
          {
            if (IOObjectConformsTo(v6, "AppleAPFSVolume"))
            {
              if (IORegistryEntryCreateCFProperties(v6, &theDict, kCFAllocatorDefault, 0)) {
                goto LABEL_21;
              }
              CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"BSD Name");
              CFArrayAppendValue(v1, Value);
              CFStringGetCString(Value, buffer, 256, 0x8000100u);
              sub_100002D6C(1, "%s: Found Volume IOBSD name:%s, added to the list", "findAll_APFSVolumes_OnDevice", buffer);
              CFRelease(theDict);
            }
            IOObjectRelease(v6);
            io_object_t v6 = IOIteratorNext(existing[0]);
          }
          while (v6);
        }
        IOObjectRelease(existing[0]);
        IOObjectRelease(v4);
        io_object_t v4 = IOIteratorNext(existing[1]);
        if (!v4)
        {
          IOObjectRelease(existing[1]);
          int Count = CFArrayGetCount(v1);
          if (Count)
          {
            sub_100002D6C(1, "%s: Found %d Volumes, returning the list", "findAll_APFSVolumes_OnDevice", Count);
            return v1;
          }
          sub_100002D6C(1, "%s: Unable to find any APFS Volume FSSpec nodes from IORegistry, bailing");
          goto LABEL_24;
        }
      }
    }
    sub_100002D6C(1, "%s: unable to scan IORegistry");
LABEL_24:
    sub_100002D6C(1, "%s: Encountered error while finding volumes, NULL returned", "findAll_APFSVolumes_OnDevice");
    CFRelease(v1);
    return 0;
  }
  sub_100002D6C(1, "%s: could not create temp Array", "findAll_APFSVolumes_OnDevice");
  sub_100002D6C(1, "%s: Encountered error while finding volumes, NULL returned", "findAll_APFSVolumes_OnDevice");
  return 0;
}

uint64_t sub_10000D31C(_removefile_state *a1, const char *a2, _DWORD *a3)
{
  int dst = 0;
  if (removefile_state_get(a1, 5u, &dst))
  {
    sub_100002D6C(1, "%s: removefile hit error for %s but we failed to get the error number", "_removefile_error_callback", a2);
    int dst = 2;
  }
  else if (dst != 2)
  {
    io_object_t v5 = strerror(dst);
    sub_100002D6C(1, "%s: removefile hit error for %s : %s", "_removefile_error_callback", a2, v5);
    if (dst == 1)
    {
      memset(&v10, 0, sizeof(v10));
      if (lstat(a2, &v10))
      {
        io_object_t v6 = "%s: Failed to stat %s before unsetting UF_IMMUTABLE: %s";
      }
      else
      {
        if ((v10.st_flags & 2) == 0) {
          goto LABEL_8;
        }
        if (lchflags(a2, v10.st_flags & 0xFFFFFFFD))
        {
          io_object_t v6 = "%s: Failed to lchflags %s: %s";
        }
        else
        {
          sub_100002D6C(1, "%s: Unset UF_IMMUTABLE on %s", "_removefile_error_callback", a2);
          if (!unlink(a2)) {
            return 0;
          }
          io_object_t v6 = "%s: unlink of %s failed: %s";
        }
      }
      CFDictionaryRef v7 = __error();
      double v8 = strerror(*v7);
      sub_100002D6C(1, v6, "_removefile_error_callback", a2, v8);
    }
  }
LABEL_8:
  if (a3 && !*a3) {
    *a3 = dst;
  }
  return 0;
}

intptr_t sub_10000D480(uint64_t a1)
{
  byte_100028D50 = 1;
  int v2 = pthread_join((pthread_t)qword_100028D58, 0);
  if (v2) {
    BOOL v3 = v2 == 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    sub_100002D6C(0, "%s: Couldn't wait for thread: %d", "end_fakery_block_invoke", v2);
  }
  io_object_t v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

void sub_10000D500()
{
  *(_OWORD *)__argv = *(_OWORD *)off_100024CA8;
  long long v2 = *(_OWORD *)&off_100024CB8;
  int v0 = sub_10000FA4C((const char **)__argv, 0);
  if (v0) {
    sub_100002D6C(1, "%s: Failed to remount preboot as read-write: %d", "remountPreboot", v0);
  }
}

uint64_t sub_10000D584(const char *a1)
{
  uint64_t v2 = unlink(a1);
  if (v2)
  {
    if (*__error() != 2)
    {
      BOOL v3 = __error();
      strerror(*v3);
      sub_100002D6C(1, "%s: Failed to delete kernelcache at %s: %s");
    }
  }
  else
  {
    sub_100002D6C(0, "%s: Deleted kernelcache at %s", "deleteKernelcacheAtPath", a1);
    sub_100002D6C(1, "%s: Deleted kernelcache");
  }
  return v2;
}

int sub_10000D628(id a1, const char *a2, int a3)
{
  if (a3 != 20)
  {
    io_object_t v4 = strerror(a3);
    sub_100002D6C(1, "%s: glob_b: %s: %s", "deleteKernelcaches_block_invoke", a2, v4);
  }
  return 0;
}

uint64_t sub_10000D688(char *a1)
{
  io_iterator_t existing = 0;
  uint64_t v2 = IOServiceMatching("IOMedia");
  if (!v2)
  {
    uint64_t v5 = 12;
    strerror(12);
    sub_100002D6C(1, "%s: Failed to create match dictionary: %s");
    return v5;
  }
  BOOL v3 = v2;
  CFDictionaryAddValue(v2, @"Leaf", kCFBooleanTrue);
  CFDictionaryAddValue(v3, @"Whole", kCFBooleanTrue);
  uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v3, &existing);
  if (MatchingServices)
  {
    uint64_t v5 = MatchingServices;
    mach_error_string(MatchingServices);
    sub_100002D6C(1, "%s: Cannot find entries matching %s: %s");
    return v5;
  }
  io_object_t v6 = IOIteratorNext(existing);
  if (!v6)
  {
LABEL_13:
    uint64_t v5 = 0;
    goto LABEL_14;
  }
  io_object_t v7 = v6;
  while (1)
  {
    CFTypeRef v8 = IORegistryEntrySearchCFProperty(v7, "IOService", @"EmbeddedDeviceTypeFirmware", kCFAllocatorDefault, 3u);
    if (v8) {
      break;
    }
LABEL_12:
    IOObjectRelease(v7);
    io_object_t v7 = IOIteratorNext(existing);
    if (!v7) {
      goto LABEL_13;
    }
  }
  io_object_t v9 = v8;
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(v9) || CFBooleanGetValue((CFBooleanRef)v9) != 1)
  {
    CFRelease(v9);
    goto LABEL_12;
  }
  CFRelease(v9);
  CFMutableDictionaryRef properties = 0;
  uint64_t v12 = IORegistryEntryCreateCFProperties(v7, &properties, kCFAllocatorDefault, 0);
  if (v12)
  {
    uint64_t v5 = v12;
    CFStringRef v13 = mach_error_string(v12);
    sub_100002D6C(1, "%s: Failed to create CF properties for firmware partition: %s", "findFirmwarePartition", v13);
  }
  else
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(properties, @"BSD Name");
    if (Value)
    {
      strcpy(a1, "/dev/");
      if (CFStringGetCString(Value, a1 + 5, 59, 0x8000100u)) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = 22;
      }
    }
    else
    {
      sub_100002D6C(1, "%s: Failed to get bsd name for firmware partition", "findFirmwarePartition");
      uint64_t v5 = 0;
    }
    CFRelease(properties);
  }
  IOObjectRelease(v7);
LABEL_14:
  IOObjectRelease(existing);
  return v5;
}

uint64_t sub_10000D8F0(int a1, const char *a2)
{
  unsigned int v10 = 0;
  uint64_t v9 = 0;
  if (ioctl(a1, 0x40046418uLL, &v10) < 0)
  {
    uint64_t v5 = __error();
    io_object_t v6 = strerror(*v5);
    sub_100002D6C(1, "%s: FS_partsize: IOCTL DKIOCGETBLOCKSIZE for device %s failed: %s\n", "FS_partsize", a2, v6);
    if (*__error() == 25) {
      sub_100002D6C(1, "%s: FS_partsize: The specified device may be a file and not a valid block device. \n");
    }
    goto LABEL_7;
  }
  if (ioctl(a1, 0x40086419uLL, &v9) < 0)
  {
    io_object_t v7 = __error();
    strerror(*v7);
    sub_100002D6C(1, "%s: FS_partsize: IOCTL DKIOCGETBLOCKCOUNT for device %s failed: %s\n");
LABEL_7:
    uint64_t v4 = 0x800000;
    goto LABEL_8;
  }
  uint64_t v4 = v9 * v10;
LABEL_8:
  sub_100002D6C(1, "%s: FS_partsize: for device %s returned %llu\n", "FS_partsize", a2, v4);
  return v4;
}

void sub_10000DA00(uint64_t a1)
{
  uint64_t v10 = 0;
  if (sub_1000033B0(1, &v10))
  {
    sub_100002D6C(1, "%s: Obtained the NVRAM Key Value and it is %ld", "safe_setup_volume", v10);
    if (v10)
    {
      byte_100028D19 = 1;
      sub_100002D6C(1, "%s: This is a ManagedDevice Wipe");
    }
    else
    {
      sub_100002D6C(1, "%s: Not a ManagedDevice Wipe");
    }
  }
  sub_100002D6C(1, "%s: Creating whitelist directories", "safe_setup_volume");
  int v2 = aks_bootstrap_fs();
  if (v2) {
    sub_100002D6C(1, "%s: aksutils_bootstrap_fs failed: %d", "safe_setup_volume", v2);
  }
  sub_100002D6C(1, "%s: Restoring Data volume content", "safe_setup_volume");
  if (byte_100028D00) {
    BOOL v3 = "/private/var/tmp/alt_root";
  }
  else {
    BOOL v3 = "/";
  }
  if (sub_10000E82C(a1, (uint64_t)v3)) {
    sub_100002D6C(1, "%s: Unable to restore filesystem stuff.");
  }
  else {
    sub_100002D6C(1, "%s: Restoring Data volume content Completed");
  }
  if (byte_100028D19 == 1) {
    sub_10000F170();
  }
  sub_100002D6C(1, "%s: Creating system keybag", "safe_setup_volume");
  int System = MKBKeyBagCreateSystem();
  if (System) {
    sub_100002D6C(1, "%s: Unable to create keybag: %d", "safe_setup_volume", System);
  }
  sub_100002D6C(1, "%s: Creating system keybag - done", "safe_setup_volume");
  sub_100002EB4(4, "/private", "/var/db/timezone/localtime");
  if (symlink("/var/db/timezone/zoneinfo/US/Pacific", byte_100028BF8) == -1)
  {
    if (*__error() == 17)
    {
      sub_100002D6C(1, "%s: Timezone symlink already exists.");
    }
    else
    {
      io_object_t v6 = __error();
      strerror(*v6);
      sub_100002D6C(1, "%s: Could not symlink the timezone file '%s': %s");
    }
  }
  else if (lchmod(byte_100028BF8, 0x1EDu) == -1)
  {
    uint64_t v5 = __error();
    strerror(*v5);
    sub_100002D6C(1, "%s: Could not set 0755 permission on symlink: %s");
  }
  sub_100002D6C(1, "%s: done symlink of TZDIR", "safe_setup_volume");
  sub_100002EB4(0, "/root", "/.obliterated");
  int v7 = open(byte_100028BF8, 513, 420);
  if (v7 == -1)
  {
    CFTypeRef v8 = __error();
    uint64_t v9 = strerror(*v8);
    sub_100002D6C(1, "%s: Could not create the '.obliterated' marker file: %s", "safe_setup_volume", v9);
  }
  else
  {
    close(v7);
  }
}

uint64_t sub_10000DCD8(const char *a1)
{
  size_t size = 0;
  if (sysctlbyname("kern.bootargs", 0, &size, 0, 0)) {
    return 0;
  }
  BOOL v3 = (char *)malloc_type_malloc(size, 0x100004077774924uLL);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  if (sysctlbyname("kern.bootargs", v3, &size, 0, 0)
    || ![+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4) containsString:+[NSString stringWithUTF8String:a1]])
  {
    uint64_t v2 = 0;
  }
  else
  {
    io_object_t v6 = a1;
    uint64_t v2 = 1;
    sub_100002D6C(1, "%s: found %s in bootargs(%s)", "bootArgsContains", v6, v4);
  }
  free(v4);
  return v2;
}

char *sub_10000DDDC(int a1)
{
  uint64_t v2 = malloc_type_malloc(0x10000uLL, 0x6C6E1509uLL);
  *(_OWORD *)md = 0u;
  long long v13 = 0u;
  if (v2)
  {
    BOOL v3 = v2;
    uint64_t v4 = (char *)malloc_type_malloc(0x41uLL, 0x16592D9AuLL);
    if (v4)
    {
      memset(&c, 0, sizeof(c));
      CC_SHA256_Init(&c);
      ssize_t v5 = pread(a1, v3, 0x10000uLL, 0);
      if (v5 >= 1)
      {
        CC_SHA256_Update(&c, v3, v5);
        goto LABEL_8;
      }
      if ((v5 & 0x8000000000000000) == 0)
      {
LABEL_8:
        CC_SHA256_Final(md, &c);
        uint64_t v6 = 0;
        int v7 = v4;
        do
          v7 += snprintf(v7, 3uLL, "%02X", md[v6++]);
        while (v6 != 32);
        goto LABEL_10;
      }
      uint64_t v9 = __error();
      uint64_t v10 = strerror(*v9);
      sub_100002D6C(1, "%s: Failed to read from input file: %s", "calculate_SHA256_str", v10);
      free(v4);
      uint64_t v4 = 0;
    }
    else
    {
      sub_100002D6C(1, "%s: Failed to allocate %d bytes for SHA result string", "calculate_SHA256_str", 65);
    }
LABEL_10:
    free(v3);
    return v4;
  }
  sub_100002D6C(1, "%s: Failed to allocate %d bytes for SHA calculation", "calculate_SHA256_str", 0x10000);
  return 0;
}

uint64_t sub_10000DFA0(float a1)
{
  return 0;
}

void sub_10000DFCC(uint64_t a1)
{
  if (a1) {
    sub_100002D6C(1, "%s: Scraper stats: files: %zu, dirs: %zu, symlinks: %zu");
  }
  else {
    sub_100002D6C(1, "%s: Invalid FS scraper.");
  }
}

void *sub_10000E030()
{
  int v0 = malloc_type_calloc(1uLL, 0x40uLL, 0x10200405D94163CuLL);
  if (v0)
  {
    CFMutableDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
    v0[1] = Mutable;
    if (Mutable)
    {
      *(_DWORD *)int v0 = 1935897200;
      *((_OWORD *)v0 + 2) = 0u;
      *((_OWORD *)v0 + 3) = 0u;
      uint64_t v2 = archive_write_new();
      v0[2] = v2;
      if (v2)
      {
        if (archive_write_set_format_cpio())
        {
          sub_100002D6C(1, "%s: Could not set archive type CPIO: %d.");
        }
        else if (archive_write_set_compression_bzip2())
        {
          sub_100002D6C(1, "%s: Could not set archive compression to bzip2: %d.");
        }
        else if (archive_write_open())
        {
          sub_100002D6C(1, "%s: Could not set backing memory buffer.");
        }
        else
        {
          uint64_t disk_new = archive_read_disk_new();
          v0[3] = disk_new;
          if (disk_new)
          {
            if (!archive_read_disk_set_symlink_physical()) {
              return v0;
            }
            sub_100002D6C(1, "%s: Could not set no-follow symlink mode.");
          }
          else
          {
            sub_100002D6C(1, "%s: Could not create archive structure.");
          }
        }
      }
      else
      {
        sub_100002D6C(1, "%s: Could not write_mem archive.");
      }
    }
    else
    {
      sub_100002D6C(1, "%s: Could not create CFData.");
    }
    sub_10000E2B8(v0);
    return 0;
  }
  return v0;
}

uint64_t sub_10000E1D8()
{
  return 0;
}

CFIndex sub_10000E21C(int a1, uint64_t a2, UInt8 *bytes, CFIndex length)
{
  if (!a2) {
    return -1;
  }
  if (*(_DWORD *)a2 != 1935897200) {
    return -1;
  }
  uint64_t v4 = *(__CFData **)(a2 + 8);
  if (!v4) {
    return -1;
  }
  CFIndex v5 = length;
  CFDataAppendBytes(v4, bytes, length);
  return v5;
}

uint64_t sub_10000E274()
{
  return 0;
}

uint64_t sub_10000E2B8(void *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 != 1935897200) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = (const void *)a1[1];
  if (v2)
  {
    CFRelease(v2);
    a1[1] = 0;
  }
  if (a1[2]) {
    archive_write_finish();
  }
  *((_OWORD *)a1 + 2) = 0u;
  *((_OWORD *)a1 + 3) = 0u;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  free(a1);
  return 0;
}

uint64_t sub_10000E338(uint64_t a1, char *a2, const char *a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = 0xFFFFFFFFLL;
  if (a2 && *(_DWORD *)a1 == 1935897200 && *a2 == 47)
  {
    int v7 = realpath_DARWIN_EXTSN(a2, 0);
    if (v7)
    {
      CFTypeRef v8 = v7;
      if (!archive_entry_new())
      {
        sub_100002D6C(1, "%s: Couldn't create archive entry.", "FSScraperAddPath");
        goto LABEL_13;
      }
      archive_entry_set_pathname();
      if (archive_read_disk_entry_from_file())
      {
        sub_100002D6C(1, "%s: Couldn't read archive entry %s from disk: %d.");
LABEL_9:
        archive_entry_free();
LABEL_13:
        free(v8);
        return v4;
      }
      if (a3)
      {
        memset(&v19, 0, sizeof(v19));
        memset(&v18, 0, sizeof(v18));
        if (lstat(a3, &v19) == -1)
        {
          __error();
          sub_100002D6C(1, "%s: lstat(2) on '%s' failed: %d");
          goto LABEL_9;
        }
        if ((v19.st_mode & 0xF000) != 0x8000) {
          goto LABEL_33;
        }
        sub_100002D6C(1, "%s: Processing reg file at %s", "FSScraperAddPath", a3);
        if (stat(a2, &v18) == -1)
        {
          __error();
          sub_100002D6C(1, "%s: stat(2) on '%s' failed: %d");
          goto LABEL_9;
        }
        if ((v18.st_mode & 0xF000) != 0x8000)
        {
LABEL_33:
          sub_100002D6C(1, "%s: '%s' isn't a regular file");
          goto LABEL_9;
        }
        archive_entry_set_size();
      }
      if (archive_write_header())
      {
        sub_100002D6C(1, "%s: Couldn't write archive entry for path %s: %d.");
        goto LABEL_9;
      }
      if (archive_entry_filetype() == 0x8000)
      {
        if (a3)
        {
          int v12 = open(a3, 0);
          if (v12 == -1) {
            goto LABEL_46;
          }
        }
        else
        {
          int v12 = open(a2, 0);
          if (v12 == -1)
          {
LABEL_46:
            __error();
            sub_100002D6C(1, "%s: Couldn't open(2) path %s for reading: %d.");
            goto LABEL_9;
          }
        }
        size_t v14 = archive_entry_size();
        id v15 = malloc_type_malloc(v14, 0x6E14BFECuLL);
        if (!v15)
        {
          sub_100002D6C(1, "%s: Couldn't allocate buffer of  %ld bytes for file %s.", "FSScraperAddPath", v14, a2);
          uint64_t v4 = 0xFFFFFFFFLL;
LABEL_50:
          close(v12);
          goto LABEL_9;
        }
        id v16 = v15;
        if (v14 == read(v12, v15, v14))
        {
          if (archive_write_data() == v14)
          {
            uint64_t v17 = *(void *)(a1 + 40) + 1;
            *(void *)(a1 + 32) += v14;
            *(void *)(a1 + 40) = v17;
            sub_100002D6C(1, "%s: Added regular file with size:%zu and total file count:%zu", "FSScraperAddPath", v14, v17);
            sub_100002D6C(1, "%s: Added path %s", "FSScraperAddPath", v8);
            uint64_t v4 = 0;
LABEL_49:
            free(v16);
            goto LABEL_50;
          }
          sub_100002D6C(1, "%s: Couldn't write archive data for path %s: %ld:");
        }
        else
        {
          sub_100002D6C(1, "%s: Couldn't read  %ld bytes for file %s, got %ld .");
        }
        uint64_t v4 = 0xFFFFFFFFLL;
        goto LABEL_49;
      }
      if (archive_entry_filetype() == 0x4000)
      {
        long long v13 = (void *)(a1 + 48);
      }
      else
      {
        if (archive_entry_filetype() != 40960)
        {
LABEL_37:
          sub_100002D6C(1, "%s: Added path %s", "FSScraperAddPath", v8);
          uint64_t v4 = 0;
          goto LABEL_9;
        }
        long long v13 = (void *)(a1 + 56);
      }
      ++*v13;
      goto LABEL_37;
    }
    int v9 = byte_100028BE8;
    int v10 = *__error();
    if (v9)
    {
      sub_100002D6C(1, "%s: Path %s doesn't exist, skipping as path miss is okay: %d.", "FSScraperAddPath", a2, v10);
      return 0;
    }
    else
    {
      sub_100002D6C(1, "%s: Path %s doesn't exist: %d.", "FSScraperAddPath", a2, v10);
    }
  }
  return v4;
}

uint64_t sub_10000E7C0(_DWORD *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*a1 == 1935897200)
  {
    uint64_t result = archive_write_close();
    if (!result) {
      return result;
    }
    sub_100002D6C(1, "%s: Failed closing archive: %d.", "FSScraperFinalizeCapture", result);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000E82C(uint64_t a1, uint64_t a2)
{
  if (!a1 || *(_DWORD *)a1 != 1935897200) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a2)
  {
    if (*(void *)(a1 + 8))
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        CFIndex v5 = Mutable;
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 8));
        CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 8));
        CFTypeRef v8 = CFReadStreamCreateWithBytesNoCopy(0, BytePtr, Length, kCFAllocatorNull);
        if (!v8)
        {
          uint64_t v3 = 0xFFFFFFFFLL;
          goto LABEL_16;
        }
        int v9 = v8;
        if (CFReadStreamOpen(v8))
        {
          CFDictionarySetValue(v5, @"inputStream", v9);
          CFDictionarySetValue(v5, @"compressCPIO", kCFBooleanTrue);
          CFDictionarySetValue(v5, @"extractCPIO", kCFBooleanTrue);
          if (BOMCopierNew())
          {
            int v10 = BOMCopierCopyWithOptions();
            if (v10)
            {
              sub_100002D6C(1, "%s: Could not copy with options: %d.\n", "FSScraperRestore", v10);
              uint64_t v3 = 0xFFFFFFFFLL;
            }
            else
            {
              uint64_t v3 = 0;
            }
            BOMCopierFree();
            goto LABEL_15;
          }
        }
        else
        {
          sub_100002D6C(1, "%s: Could not open read stream.", "FSScraperRestore");
        }
        uint64_t v3 = 0xFFFFFFFFLL;
LABEL_15:
        CFRelease(v9);
LABEL_16:
        CFRelease(v5);
      }
    }
  }
  return v3;
}

uint64_t sub_10000E9DC()
{
  int v0 = sub_100002C78(1);

  return sub_10000EA14(v0, 457, 0x1F5u, 0x1F5u);
}

uint64_t sub_10000EA14(const char *a1, int a2, uid_t a3, gid_t a4)
{
  memset(&v16, 0, sizeof(v16));
  if (stat(a1, &v16))
  {
    uint64_t v8 = mkpath_np(a1, a2);
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = strerror(v8);
      sub_100002D6C(1, "%s: Failed mkpath for path '%s' - %s", "FSScraperCreatePath", a1, v10);
      return v9;
    }
    goto LABEL_6;
  }
  sub_100002D6C(1, "%s: Path '%s' already exits", "FSScraperCreatePath", a1);
  if (!chmod(a1, a2)
    || (uint64_t v11 = __error(),
        int v12 = strerror(*v11),
        sub_100002D6C(1, "%s: Failed to change permissions on path '%s' - %s", "FSScraperCreatePath", a1, v12),
        uint64_t v9 = *__error(),
        !v9))
  {
LABEL_6:
    if (chown(a1, a3, a4))
    {
      long long v13 = __error();
      size_t v14 = strerror(*v13);
      sub_100002D6C(1, "%s: Failed to change ownership on path '%s' - %s", "FSScraperCreatePath", a1, v14);
      return *__error();
    }
    else
    {
      sub_100002D6C(1, "%s: Successfully set up path('%s', mode %03o, uid %d, gid %d)", "FSScraperCreatePath", a1, a2, a3, a4);
      return 0;
    }
  }
  return v9;
}

uint64_t sub_10000EB90(uint64_t a1, char *a2, int a3)
{
  v16[0] = a2;
  v16[1] = 0;
  if (!a2)
  {
    a2 = (char *)sub_100002C78(0);
    v16[0] = a2;
  }
  sub_100002D6C(1, "%s: FSScraperSetDefaultPaths: examining '%s'", "FSScraperSetDefaultPaths", a2);
  CFIndex v5 = fts_open(v16, 2124, 0);
  if (!v5)
  {
    uint64_t v11 = v16[0];
    int v12 = __error();
    long long v13 = strerror(*v12);
    size_t v14 = __error();
    sub_100002D6C(1, "%s: failed to open path %s: %s (%d)\n", "FSScraperSetDefaultPaths", v11, v13, *v14);
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  int v7 = fts_read(v5);
  if (!v7)
  {
LABEL_15:
    fts_close(v6);
    sub_100002D6C(1, "%s: Done with FSScraperSetDefaultPaths()", "FSScraperSetDefaultPaths");
    return 0;
  }
  uint64_t v8 = v7;
  while (1)
  {
    unsigned int fts_info = v8->fts_info;
    if (fts_info <= 0xA)
    {
      if (((1 << fts_info) & 0x490) != 0) {
        goto LABEL_8;
      }
      if (((1 << fts_info) & 0x60) != 0) {
        goto LABEL_11;
      }
    }
    if (!v8->fts_errno) {
      goto LABEL_9;
    }
LABEL_8:
    sub_100002D6C(1, "%s: FSScraperSetDefaultPaths: error in fts_read(), returned info %d, errno %d", "FSScraperSetDefaultPaths", v8->fts_info, v8->fts_errno);
    if (a3) {
      break;
    }
LABEL_9:
    sub_10000E338(a1, v8->fts_path, 0);
LABEL_11:
    uint64_t v8 = fts_read(v6);
    if (!v8) {
      goto LABEL_15;
    }
  }
  unsigned int fts_errno = v8->fts_errno;
  if (fts_errno) {
    return fts_errno;
  }
  else {
    return 22;
  }
}

uint64_t sub_10000ED48(uint64_t a1)
{
  sub_100002D6C(1, "%s: Adding Hilo paths to scrapper", "FSScraperCaptureHiloPaths");
  for (uint64_t i = 0; i != 15; i += 5)
  {
    sub_100002EB4(0, "/iomfb_bics_daemon", (&off_100024CD0)[i]);
    if (i * 8) {
      uint64_t v3 = byte_100028BF8;
    }
    else {
      uint64_t v3 = 0;
    }
    sub_10000E338(a1, byte_100028BF8, v3);
  }
  return 0;
}

uint64_t sub_10000EDEC()
{
  sub_100002D6C(1, "%s: Setting Class-D on restored Hilo paths", "FSScraperFixupRestoredHiloPaths");
  for (uint64_t i = 0; i != 15; i += 5)
  {
    sub_100002EB4(0, "/iomfb_bics_daemon", (&off_100024CD0)[i]);
    sub_10000EE6C();
  }
  return 0;
}

uint64_t sub_10000EE6C()
{
  int v0 = open_dprotected_np(byte_100028BF8, 0, 0, 1);
  if (v0 == -1)
  {
    CFIndex v5 = __error();
    uint64_t v3 = *v5;
    uint64_t v6 = strerror(*v5);
    sub_100002D6C(1, "%s: failed (%s) to open path %s\n", "_set_path_class", v6, byte_100028BF8);
  }
  else
  {
    int v1 = v0;
    if (fcntl(v0, 64, 4))
    {
      uint64_t v2 = __error();
      uint64_t v3 = *v2;
      uint64_t v4 = strerror(*v2);
      sub_100002D6C(1, "%s: failed (%s) to update class for %s\n", "_set_path_class", v4, byte_100028BF8);
      if (v1 < 0) {
        return v3;
      }
      goto LABEL_7;
    }
    sub_100002D6C(1, "%s: Set %s to protection class:%d\n", "_set_path_class", byte_100028BF8, 4);
    uint64_t v3 = 0;
    if ((v1 & 0x80000000) == 0) {
LABEL_7:
    }
      close(v1);
  }
  return v3;
}

uint64_t sub_10000EF78()
{
  sub_100002EB4(0, "/iomfb_bics_daemon", "/");
  sub_100002D6C(1, "%s: Setting up hilo path at '%s'", "FSScraperCreateHiloDirPath", byte_100028BF8);
  uint64_t v0 = sub_10000F07C();
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = strerror(v0);
    sub_100002D6C(1, "%s: Failed to get uid or gid for user '%s' or group '%s' - %s\n", "FSScraperCreateHiloDirPath", "root", "wheel", v2);
    return v1;
  }
  uint64_t v1 = sub_10000EA14(byte_100028BF8, 488, 0, 0);
  if (v1) {
    return v1;
  }

  return sub_10000EE6C();
}

uint64_t sub_10000F07C()
{
  uint64_t v0 = (const char *)__chkstk_darwin();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  memset(&v11, 0, sizeof(v11));
  int v10 = 0;
  memset(&v9, 0, sizeof(v9));
  uint64_t v8 = 0;
  if (getpwnam_r(v0, &v11, v12, 0x1000uLL, &v10)) {
    return *__error();
  }
  *uint64_t v4 = v10->pw_uid;
  uint64_t result = getgrnam_r(v6, &v9, v12, 0x1000uLL, &v8);
  if (result) {
    return *__error();
  }
  *uint64_t v2 = v8->gr_gid;
  return result;
}

uint64_t sub_10000F170()
{
  sub_100002EB4(1, "/Library/Application Support", "/com.apple.dmd-setup-option");
  sub_100002D6C(1, "%s: Setting up Managed Device path at '%s'", "setManagedDeviceWipePath", byte_100028BF8);
  uint64_t v0 = sub_10000F07C();
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = strerror(v0);
    sub_100002D6C(1, "%s: Failed to get uid or gid for user '%s' or group '%s' - %s\n", "setManagedDeviceWipePath", "mobile", "mobile", v2);
    return v1;
  }
  else
  {
    return sub_10000EA14(byte_100028BF8, 493, 0, 0);
  }
}

CFMutableDictionaryRef sub_10000F25C()
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!result) {
    exit(-1);
  }
  return result;
}

const void *sub_10000F2A0(const void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFDictionaryGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000F2DC()
{
  if (qword_100028F60 != -1) {
    dispatch_once(&qword_100028F60, &stru_100024E58);
  }
  return byte_100028F68;
}

void sub_10000F320(id a1)
{
  int has_internal_content = os_variant_has_internal_content();
  byte_100028F68 = has_internal_content;
  CFTypeID v2 = "Customer";
  if (has_internal_content) {
    CFTypeID v2 = "Internal";
  }
  sub_100002D6C(0, "%s: Running on an %s build according to OS variant", "runningInternalBuild_block_invoke", v2);
}

uint64_t sub_10000F384()
{
  if (qword_100028F70 != -1) {
    dispatch_once(&qword_100028F70, &stru_100024E98);
  }
  return byte_100028F78;
}

void sub_10000F3C8(id a1)
{
  byte_100028F78 = os_variant_has_internal_diagnostics();
}

void *sub_10000F3F0(const __CFString *a1, CFIndex *a2)
{
  if (!a1) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(a1);
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t v6 = 0;
  if (a2)
  {
    if (v4 == TypeID)
    {
      CFIndex Length = CFStringGetLength(a1);
      CFIndex v8 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      *a2 = v8;
      uint64_t v6 = malloc_type_calloc(v8, 1uLL, 0x100004077774924uLL);
      if (v6)
      {
        if (!CFStringGetCString(a1, (char *)v6, v8, 0x8000100u))
        {
          free(v6);
          return 0;
        }
      }
    }
  }
  return v6;
}

void *sub_10000F4A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFMutableDictionaryRef result = 0;
  if (a1 && a2)
  {
    if (a3)
    {
      CFMutableDictionaryRef result = malloc_type_calloc(1uLL, 0x28uLL, 0xE0040DC662491uLL);
      void *result = a1;
      result[1] = a2;
      result[2] = a3;
    }
  }
  return result;
}

void sub_10000F50C()
{
  if (qword_100028FA0 != -1) {
    dispatch_once(&qword_100028FA0, &stru_100025018);
  }
  qword_100028F88 = qword_100028FA8;
  if (qword_100028FA8 && qword_100028F80 != -1)
  {
    dispatch_once(&qword_100028F80, &stru_100024ED8);
  }
}

void sub_10000F594(id a1)
{
}

void sub_10000F5A8(id a1)
{
  uint64_t v1 = malloc_type_calloc(1uLL, 0x10uLL, 0xA0040AFF93C70uLL);
  if (v1)
  {
    *uint64_t v1 = 0;
    v1[1] = v1;
    qword_100028F90 = (uint64_t)v1;
  }
}

void sub_10000F5E8()
{
  if (qword_100028F90)
  {
    if (qword_100028F98 != -1) {
      dispatch_once(&qword_100028F98, &stru_100024F58);
    }
  }
}

void sub_10000F61C(id a1)
{
  if (qword_100028FA0 != -1) {
    dispatch_once(&qword_100028FA0, &stru_100025018);
  }
  uint64_t v1 = qword_100028FA8;

  dispatch_sync(v1, &stru_100024F98);
}

void sub_10000F678(id a1)
{
  while (1)
  {
    uint64_t v1 = *(void **)qword_100028F90;
    if (!*(void *)qword_100028F90) {
      break;
    }
    uint64_t v2 = v1[3];
    uint64_t v3 = (void *)v1[4];
    if (v2)
    {
      *(void *)(v2 + 32) = v3;
      uint64_t v3 = (void *)v1[4];
    }
    else
    {
      *(void *)(qword_100028F90 + 8) = v3;
    }
    *uint64_t v3 = v2;
    ((void (*)(void))v1[2])(*v1);
    free(v1);
  }
  free((void *)qword_100028F90);
  qword_100028F90 = 0;
}

void sub_10000F6E0(uint64_t a1)
{
  if (a1 && qword_100028F90 && *(void *)(a1 + 8) && *(void *)(a1 + 16))
  {
    if (qword_100028FA0 != -1)
    {
      uint64_t v1 = a1;
      dispatch_once(&qword_100028FA0, &stru_100025018);
      a1 = v1;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_10000F7B0;
    block[3] = &unk_100024FB8;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)qword_100028FA8, block);
  }
}

uint64_t sub_10000F7B0(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 8))(**(void **)(a1 + 32));
  *(void *)(*(void *)(a1 + 32) + 24) = 0;
  uint64_t v3 = qword_100028F90;
  CFTypeID v4 = *(void **)(qword_100028F90 + 8);
  *(void *)(*(void *)(a1 + 32) + 32) = v4;
  *CFTypeID v4 = *(void *)(a1 + 32);
  *(void *)(v3 + 8) = *(void *)(a1 + 32) + 24;
  return result;
}

void sub_10000F80C(uint64_t a1, uint64_t a2)
{
  if (a2 && a1 && qword_100028F90)
  {
    if (qword_100028FA0 != -1) {
      dispatch_once(&qword_100028FA0, &stru_100025018);
    }
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000;
    v4[2] = sub_10000F8D0;
    v4[3] = &unk_100024FD8;
    v4[4] = a1;
    v4[5] = a2;
    dispatch_sync((dispatch_queue_t)qword_100028FA8, v4);
  }
}

void sub_10000F8D0(uint64_t a1)
{
  int v2 = open(*(const char **)(a1 + 32), 522, 384, 0);
  if (v2 != -1)
  {
    int v3 = v2;
    CFTypeID v4 = *(void **)qword_100028F90;
    if (*(void *)qword_100028F90)
    {
      do
      {
        CFIndex v5 = (const char *)(*(uint64_t (**)(void, uint64_t *))(a1 + 40))(*v4, &v8);
        if (v5)
        {
          uint64_t v6 = (char *)v5;
          size_t v7 = strlen(v5);
          write(v3, v6, v7);
          write(v3, "\n", 1uLL);
          free(v6);
        }
        CFTypeID v4 = (void *)v4[3];
      }
      while (v4);
    }
    if (v3 >= 1) {
      close(v3);
    }
  }
}

BOOL sub_10000F99C(unsigned int a1, void *a2)
{
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.obliteration.timeout_block", 0);
  if (!v4) {
    return 0;
  }
  CFIndex v5 = v4;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, a2);
  if (v6)
  {
    size_t v7 = v6;
    dispatch_async(v5, v6);
    dispatch_time_t v8 = dispatch_time(0, 1000000000 * a1);
    BOOL v9 = dispatch_block_wait(v7, v8) == 0;
    _Block_release(v7);
  }
  else
  {
    BOOL v9 = 0;
  }
  dispatch_release(v5);
  return v9;
}

uint64_t sub_10000FA4C(const char **__argv, char **__envp)
{
  pid_t v4 = 0;
  int v3 = 0;
  if (posix_spawn(&v4, *__argv, 0, 0, (char *const *)__argv, __envp)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = waitpid(v4, &v3, 0);
  if (result != -1)
  {
    if ((v3 & 0x7F) != 0) {
      return 0xFFFFFFFFLL;
    }
    else {
      return BYTE1(v3);
    }
  }
  return result;
}

CFStringRef sub_10000FAC0(char *cStr, int a2)
{
  if (!cStr)
  {
    sub_100002D6C(1, "%s: Invalid argument(s).");
    return 0;
  }
  CFStringRef v4 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v4)
  {
    sub_100002D6C(1, "%s: Failed to create CFString from C-string for %s");
    return 0;
  }
  CFStringRef v5 = v4;
  io_registry_entry_t v6 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v6)
  {
    sub_100002D6C(1, "%s: Failed to get the IO registry entry.", "checkNVRAMProperty");
    CFRelease(v5);
    return 0;
  }
  io_registry_entry_t v7 = v6;
  CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v6, v5, 0, 0);
  if (CFProperty)
  {
    if (a2)
    {
      mach_error_t v9 = IORegistryEntrySetCFProperty(v7, @"IONVRAM-DELETE-PROPERTY", v5);
      if (v9)
      {
        mach_error_t v10 = v9;
        passwd v11 = mach_error_string(v9);
        sub_100002D6C(1, "%s: Failed to set io registry property for key %s: %s (0x%08x).", "checkNVRAMProperty", "IONVRAM-DELETE-PROPERTY", v11, v10);
        CFRelease(v5);
        CFStringRef v5 = CFProperty;
        CFStringRef CFProperty = 0;
      }
    }
  }
  else
  {
    sub_100002D6C(1, "%s: Failed to find property with the key %s", "checkNVRAMProperty", cStr);
  }
  CFRelease(v5);
  IOObjectRelease(v7);
  return CFProperty;
}

CFStringRef sub_10000FC48(char *cStr, int a2)
{
  if (!cStr) {
    return 0;
  }
  CFStringRef v3 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  io_registry_entry_t v5 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v5)
  {
    CFRelease(v4);
    return 0;
  }
  io_registry_entry_t v6 = v5;
  CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v5, v4, 0, 0);
  if (CFProperty) {
    BOOL v8 = a2 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && IORegistryEntrySetCFProperty(v6, @"IONVRAM-DELETE-PROPERTY", v4))
  {
    CFRelease(v4);
    CFStringRef v4 = CFProperty;
    CFStringRef CFProperty = 0;
  }
  CFRelease(v4);
  IOObjectRelease(v6);
  return CFProperty;
}

uint64_t sub_10000FD1C(char *cStr, const char *a2)
{
  if (!cStr || !a2)
  {
    sub_100002D6C(1, "%s: Invalid argument(s).");
    return 0;
  }
  CFStringRef v4 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v4)
  {
    sub_100002D6C(1, "%s: Failed to create C string from CFString for '%s'");
    return 0;
  }
  CFStringRef v5 = v4;
  CFStringRef v6 = CFStringCreateWithCString(0, a2, 0x8000100u);
  if (!v6)
  {
    sub_100002D6C(1, "%s: Failed to create C string from CFString for '%s'", "setNVRAMProperty", a2);
    CFRelease(v5);
    return 0;
  }
  CFStringRef v7 = v6;
  io_registry_entry_t v8 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  io_registry_entry_t v9 = v8;
  if (!v8)
  {
    sub_100002D6C(1, "%s: Failed to get the IO registry entry.");
    goto LABEL_14;
  }
  mach_error_t v10 = IORegistryEntrySetCFProperty(v8, v5, v7);
  if (v10)
  {
    mach_error_string(v10);
    sub_100002D6C(1, "%s: Failed to set io registry property for key %s to value %s: %s (0x%08x).");
LABEL_14:
    uint64_t v11 = 0;
    goto LABEL_16;
  }
  sub_10000FEAC(v9, cStr);
  uint64_t v11 = 1;
LABEL_16:
  CFRelease(v5);
  CFRelease(v7);
  if (v9) {
    IOObjectRelease(v9);
  }
  return v11;
}

void sub_10000FEAC(io_registry_entry_t a1, const char *a2)
{
  kern_return_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CFIndex v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  __darwin_ct_rune_t v22;
  __darwin_ct_rune_t v23;
  unsigned int v24;
  __darwin_ct_rune_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;
  uint64_t valuePtr;

  CFTypeID TypeID = CFStringGetTypeID();
  CFStringRef v5 = CFStringCreateWithCString(kCFAllocatorDefault, "IONVRAM-FORCESYNCNOW-PROPERTY", 0x8000100u);
  if (!v5)
  {
    sub_100002D6C(0, "%s: Error creating CFString for key %s", "SetOFVariable", "IONVRAM-FORCESYNCNOW-PROPERTY");
    return;
  }
  CFStringRef v6 = v5;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, v5, 0, 0);
  if (CFProperty)
  {
    io_registry_entry_t v8 = CFProperty;
    CFTypeID TypeID = CFGetTypeID(CFProperty);
    CFRelease(v8);
  }
  if (CFBooleanGetTypeID() == TypeID)
  {
    if (!strcmp("true", a2))
    {
      io_registry_entry_t v9 = &kCFBooleanTrue;
    }
    else
    {
      if (strcmp("false", a2)) {
        goto LABEL_46;
      }
      io_registry_entry_t v9 = &kCFBooleanFalse;
    }
    CFDataRef v11 = *v9;
    if (*v9) {
      goto LABEL_17;
    }
  }
  else
  {
    if (CFNumberGetTypeID() == TypeID)
    {
      int valuePtr = strtol(a2, 0, 0);
      CFDataRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
    }
    else
    {
      if (CFStringGetTypeID() != TypeID)
      {
        if (CFDataGetTypeID() == TypeID)
        {
          size_t v14 = strlen(a2);
          id v15 = malloc_type_malloc(v14, 0x96A49A6DuLL);
          if (v15)
          {
            stat v16 = v15;
            if (v14 >= 1)
            {
              uint64_t v17 = 0;
              stat v18 = 0;
              CFDataRef v28 = v14;
              while (1)
              {
                stat v19 = a2[v18];
                if (v19 == 37)
                {
                  unsigned int v20 = v18 + 2;
                  if (v18 + 2 >= v14) {
                    goto LABEL_45;
                  }
                  CFStringRef v21 = v18 + 1;
                  id v22 = a2[v18 + 1];
                  if (v22 < 0)
                  {
                    if (!__maskrune(v22, 0x10000uLL)) {
                      goto LABEL_45;
                    }
                  }
                  else if ((_DefaultRuneLocale.__runetype[v22] & 0x10000) == 0)
                  {
                    goto LABEL_45;
                  }
                  id v23 = a2[v20];
                  if (v23 < 0)
                  {
                    if (!__maskrune(v23, 0x10000uLL))
                    {
LABEL_45:
                      free(v16);
                      goto LABEL_46;
                    }
                  }
                  else if ((_DefaultRuneLocale.__runetype[v23] & 0x10000) == 0)
                  {
                    goto LABEL_45;
                  }
                  CFStringRef v24 = __toupper(a2[v21]) - 48;
                  CFStringRef v25 = __toupper(a2[v20]);
                  int v26 = v25 - 48;
                  statfs v27 = 16 * v24;
                  if (v24 > 9) {
                    statfs v27 = 16 * v24 - 112;
                  }
                  if (v26 > 9) {
                    LOBYTE(v26) = v25 - 55;
                  }
                  LOBYTE(v19) = v26 + v27;
                  size_t v14 = v28;
                }
                else
                {
                  unsigned int v20 = v18;
                }
                *((unsigned char *)v16 + v17) = v19;
                stat v18 = v20 + 1;
                ++v17;
                if (v20 + 1 >= v14) {
                  goto LABEL_43;
                }
              }
            }
            uint64_t v17 = 0;
LABEL_43:
            CFDataRef v11 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v16, v17);
            free(v16);
            if (v11) {
              goto LABEL_17;
            }
          }
        }
        goto LABEL_46;
      }
      CFDataRef v10 = (const __CFData *)CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
    }
    CFDataRef v11 = v10;
    if (v10)
    {
LABEL_17:
      int v12 = IORegistryEntrySetCFProperty(a1, v6, v11);
      long long v13 = "Failed";
      if (!v12) {
        long long v13 = "Succeeded";
      }
      sub_100002D6C(0, "%s: %s setting the property %s to value %s", "SetOFVariable", v13, "IONVRAM-FORCESYNCNOW-PROPERTY", a2);
      CFRelease(v11);
      goto LABEL_47;
    }
  }
LABEL_46:
  sub_100002D6C(0, "%s: Error creating CFTypeRef(%lu) for value %s", "SetOFVariable", TypeID, a2);
LABEL_47:
  CFRelease(v6);
}

BOOL sub_1000101EC(char *cStr, const void *a2)
{
  kern_return_t v8;
  BOOL v9;
  mach_error_t v10;
  CFStringRef v11;
  CFStringRef v12;
  const char *CStringPtr;
  const char *v14;
  char *v15;
  char *v17;

  if (!cStr || !a2)
  {
    sub_100002D6C(1, "%s: Invalid argument(s).");
    return 0;
  }
  CFStringRef v4 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v4)
  {
    sub_100002D6C(1, "%s: Failed to create C string from CFString for '%s'");
    return 0;
  }
  CFStringRef v5 = v4;
  io_registry_entry_t v6 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v6)
  {
    sub_100002D6C(1, "%s: Failed to get the IO registry entry.", "setNVRAMPropertyWithValueRef");
    CFRelease(v5);
    return 0;
  }
  io_registry_entry_t v7 = v6;
  io_registry_entry_t v8 = IORegistryEntrySetCFProperty(v6, v5, a2);
  io_registry_entry_t v9 = v8 == 0;
  if (v8)
  {
    CFDataRef v10 = v8;
    CFDataRef v11 = CFStringCreateWithFormat(0, 0, @"%@", a2);
    if (v11)
    {
      int v12 = v11;
      CStringPtr = CFStringGetCStringPtr(v11, 0x8000100u);
      if (CStringPtr) {
        size_t v14 = CStringPtr;
      }
      else {
        size_t v14 = "<error getting string>";
      }
      id v15 = mach_error_string(v10);
      sub_100002D6C(1, "%s: Failed to set io registry property for key %s to value %s: %s (0x%08x).", "setNVRAMPropertyWithValueRef", cStr, v14, v15, v10);
      CFRelease(v12);
    }
    else
    {
      uint64_t v17 = mach_error_string(v10);
      sub_100002D6C(1, "%s: Failed to set io registry property for key %s to value %s: %s (0x%08x).", "setNVRAMPropertyWithValueRef", cStr, "<error getting string>", v17, v10);
    }
  }
  else
  {
    sub_10000FEAC(v7, cStr);
  }
  CFRelease(v5);
  IOObjectRelease(v7);
  return v9;
}

uint64_t sub_1000103C0()
{
  *(void *)notification = 0;
  uint64_t v0 = dispatch_semaphore_create(0);
  uint64_t v1 = v0;
  if (!v0)
  {
    sub_100002D6C(1, "%s: Failed to create a semaphore.");
LABEL_8:
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  dispatch_retain(v0);
  CFMutableDictionaryRef v2 = IOServiceMatching("AppleSEPManager");
  if (!v2)
  {
    sub_100002D6C(1, "%s: Failed to create matching dictionary for : '%s'");
    goto LABEL_8;
  }
  CFMutableDictionaryRef v3 = v2;
  CFStringRef v4 = IONotificationPortCreate(kIOMainPortDefault);
  if (!v4)
  {
    sub_100002D6C(1, "%s: Failed to create the io notification port.", "obliterate_gigalockers_oneshot");
    CFRelease(v3);
    goto LABEL_8;
  }
  CFStringRef v5 = v4;
  if (IOServiceAddMatchingNotification(v4, "IOServiceFirstMatch", v3, (IOServiceMatchingCallback)sub_10001062C, v1, notification))
  {
    sub_100002D6C(1, "%s: Failed to register notification for io service: '%s' : %d");
LABEL_23:
    uint64_t v6 = 0;
    goto LABEL_24;
  }
  sub_10001062C(v1, notification[0]);
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v1, v8))
  {
    sub_100002D6C(1, "%s: Timed out waiting for %s to match.");
    goto LABEL_23;
  }
  if (IOServiceOpen(dword_100028CF8, mach_task_self_, 0, &notification[1]))
  {
    sub_100002D6C(1, "%s: Failed to connect to IO service: '%s' : %d");
    goto LABEL_23;
  }
  sub_100002D6C(1, "%s: IOService to sepService successful", "obliterate_gigalockers_oneshot");
  if (IOConnectCallScalarMethod(notification[1], 0x2Fu, 0, 0, 0, 0))
  {
    sub_100002D6C(1, "%s: Failed to call method: %d via IO service: '%s' : %d");
    goto LABEL_23;
  }
  uint64_t v6 = 1;
  sub_100002D6C(1, "%s:  Completed  obliterate_gigalockers", "obliterate_gigalockers_oneshot");
LABEL_24:
  IONotificationPortDestroy(v5);
  if (notification[0]) {
    IOObjectRelease(notification[0]);
  }
LABEL_9:
  if (notification[1]) {
    IOServiceClose(notification[1]);
  }
  if (dword_100028CF8)
  {
    IOObjectRelease(dword_100028CF8);
    dword_100028CF8 = 0;
  }
  if (v1) {
    dispatch_release(v1);
  }
  return v6;
}

void sub_10001062C(NSObject *a1, io_iterator_t iterator)
{
  if (iterator)
  {
    io_object_t v3 = IOIteratorNext(iterator);
    if (v3)
    {
      if (!dword_100028CF8)
      {
        dword_100028CF8 = v3;
        if (a1)
        {
          dispatch_semaphore_signal(a1);
          dispatch_release(a1);
        }
      }
    }
  }
}

void sub_100010698(const void *a1)
{
  io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v2)
  {
    io_object_t v3 = v2;
    mach_error_t v4 = IORegistryEntrySetCFProperty(v2, @"IONVRAM-DELETE-PROPERTY", a1);
    if (v4)
    {
      CFStringRef v5 = mach_error_string(v4);
      sub_100002D6C(0, "%s: Error clearing nvram key: %s", "clearNVRAMkey", v5);
    }
    IOObjectRelease(v3);
  }
  else
  {
    sub_100002D6C(0, "%s: nvram is not supported on this system", "clearNVRAMkey");
  }
}

void sub_100010750(int a1)
{
  if (a1) {
    sub_100002D6C(1, "%s: EpDM obliteration enabled %s");
  }
  else {
    sub_100002D6C(0, "%s: EpDM obliteration disabled %s");
  }
}

uint64_t sub_10001079C()
{
  uint64_t result = os_variant_is_darwinos();
  if (result)
  {
    uint64_t v7 = 0;
    if (os_parse_boot_arg_int())
    {
      sub_100010750(v7 == 1);
LABEL_10:
      sub_100010698(@"obliteration");
      return 0;
    }
    int valuePtr = -1;
    CFNumberRef v1 = (const __CFNumber *)MGCopyAnswer();
    if (!v1
      || (v2 = v1, CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr), CFRelease(v2), int v3 = valuePtr, valuePtr == -1))
    {
      int v4 = MGGetBoolAnswer();
      char v5 = v4;
      sub_100010750(v4);
      if ((v5 & 1) == 0) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_100010750(valuePtr == 1);
      if (v3 != 1) {
        goto LABEL_10;
      }
    }
    return 1;
  }
  return result;
}

BOOL sub_1000108A0()
{
  int v2 = 0;
  size_t v1 = 4;
  if (sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0)) {
    sub_100002D6C(1, "%s: Failed to determine virtual machine status", "machine_is_virtual");
  }
  return v2 != 0;
}

void sub_100010910(id a1)
{
  qword_100028FA8 = (uint64_t)dispatch_queue_create("com.apple.obliterator.logger", 0);
}

uint64_t ramrod_display_set_minimum_progress_blink(double a1)
{
  pthread_once(&stru_100028AD8, (void (*)(void))sub_1000109CC);
  pthread_mutex_lock(&stru_100028FB0);
  qword_100028AE8 = *(void *)&a1;
  if (*(double *)&qword_100028AF0 >= a1 && (byte_1000290B8 & 1) == 0)
  {
    byte_1000290B8 = 1;
    sub_10001295C();
  }

  return pthread_mutex_unlock(&stru_100028FB0);
}

uint64_t sub_1000109CC()
{
  if (pthread_mutex_init(&stru_100028FB0, 0)) {
    ramrod_log_msg("unable to initialize display lock\n", v0, v1, v2, v3, v4, v5, v6, v16);
  }
  pthread_mutex_lock(&stru_100028FB0);
  *(void *)&dword_100029044 = 0xFF4D4D4DFFFFFFFFLL;
  byte_100029040 = 0;
  dword_10002903C = 257;
  byte_100029074 = 1;
  int v7 = MGGetSInt32Answer();
  if (v7)
  {
    if (v7 == 1)
    {
      ramrod_log_msg("inverting UI color", v8, v9, v10, v11, v12, v13, v14, v16);
      *(void *)&dword_100029044 = 0xFFCCCCCCFF000000;
      HIWORD(dword_10002903C) = -1;
      byte_100029040 = -1;
    }
    else
    {
      ramrod_log_msg("unexpect color map policy %d", v8, v9, v10, v11, v12, v13, v14, v7);
    }
  }
  off_1000290A0 = (uint64_t (*)(void))sub_100011FD0;
  off_100029090 = (uint64_t (*)(void, void))sub_1000122E4;
  off_100029098 = sub_1000123B8;
  off_1000290A8 = (uint64_t (*)(double))sub_100012410;
  off_1000290B0 = (uint64_t (*)(void))sub_100012784;
  sub_100011BC0();

  return pthread_mutex_unlock(&stru_100028FB0);
}

void ramrod_set_progress_UI(int a1, double a2)
{
  double v2 = 100.0;
  if (a2 <= 100.0) {
    double v2 = a2;
  }
  if (a2 >= 0.0) {
    double v3 = v2;
  }
  else {
    double v3 = 0.0;
  }
  if (v3 != *(double *)&qword_100028AF0 || a1 != 0)
  {
    qword_100028AF0 = *(void *)&v3;
    if (dword_100028AF8 != -1)
    {
      off_1000290A8(v3);
      double v3 = *(double *)&qword_100028AF0;
    }
    if (v3 >= *(double *)&qword_100028AE8 && (byte_1000290B8 & 1) == 0)
    {
      byte_1000290B8 = 1;
      sub_10001295C();
    }
  }
}

uint64_t ramrod_display_set_granular_progress_forced(int a1, double a2)
{
  pthread_once(&stru_100028AD8, (void (*)(void))sub_1000109CC);
  pthread_mutex_lock(&stru_100028FB0);
  ramrod_log_msg("%s: %f\n", v4, v5, v6, v7, v8, v9, v10, (char)"ramrod_display_set_granular_progress_forced");
  ramrod_set_progress_UI(a1, a2);

  return pthread_mutex_unlock(&stru_100028FB0);
}

double ramrod_display_get_progress()
{
  return *(double *)&qword_100028AF0;
}

uint64_t ramrod_display_get_num_progress_segments()
{
  if (dword_100029030) {
    return dword_100029030;
  }
  else {
    return (dword_100029004 << 8);
  }
}

void ramrod_display_set_showui(char a1)
{
  pthread_once(&stru_100028AD8, (void (*)(void))sub_1000109CC);
  LOBYTE(dword_10002903C) = a1;

  sub_100010D00();
}

void sub_100010D00()
{
  sub_100012A64((__IOSurface *)qword_100029060);
  sub_1000117E8();
  if (dword_100028AF8 != -1)
  {
    v0.n128_u64[0] = qword_100028AF0;
    if (*(double *)&qword_100028AF0 >= 0.0)
    {
      uint64_t v1 = (void (*)(__n128))off_1000290A8;
      v1(v0);
    }
    else
    {
      sub_10001156C();
    }
  }
}

void ramrod_display_set_showprogress(int a1)
{
  pthread_once(&stru_100028AD8, (void (*)(void))sub_1000109CC);
  uint64_t v9 = "Disabling";
  if (a1) {
    uint64_t v9 = "Enabling";
  }
  ramrod_log_msg("%s progress UI", v2, v3, v4, v5, v6, v7, v8, (char)v9);
  BYTE1(dword_10002903C) = a1;

  sub_100010D00();
}

uint64_t ramrod_display_show_image(const __CFString *a1)
{
  return ramrod_display_show_image_with_alpha(a1, 0);
}

uint64_t ramrod_display_show_image_with_alpha(const __CFString *a1, int a2)
{
  pthread_once(&stru_100028AD8, (void (*)(void))sub_1000109CC);
  pthread_mutex_lock(&stru_100028FB0);
  if (dword_100028AF8 != -1)
  {
    bzero(v41, 0x400uLL);
    uint64_t v4 = buffer;
    bzero(buffer, 0x400uLL);
    unint64_t v37 = 0;
    unint64_t v38 = 0;
    uint64_t v39 = 0;
    CFStringGetFileSystemRepresentation(a1, buffer, 1024);
    if (access(buffer, 0))
    {
      uint64_t v12 = strrchr(buffer, 47);
      if (!v12)
      {
        ramrod_log_msg("'%s' is not an absolute path\n", v13, v14, v15, v16, v17, v18, v19, (char)buffer);
        return pthread_mutex_unlock(&stru_100028FB0);
      }
      *uint64_t v12 = 0;
      unsigned int v20 = v12 + 1;
      CFStringRef v21 = strchr(v12 + 1, 46);
      if (!v21)
      {
        ramrod_log_msg("'%s' does not have an extension\n", v22, v23, v24, v25, v26, v27, v28, (char)v20);
        return pthread_mutex_unlock(&stru_100028FB0);
      }
      *CFStringRef v21 = 0;
      uint64_t v4 = v41;
      if (!sub_10001102C(buffer, v20, dword_100029004, v41))
      {
        ramrod_log_msg("could not find suitable image for %s/%s\n", v5, v6, v7, v8, v9, v10, v11, (char)buffer);
        return pthread_mutex_unlock(&stru_100028FB0);
      }
    }
    ramrod_log_msg("loading image: %s\n", v5, v6, v7, v8, v9, v10, v11, (char)v4);
    if (sub_1000112A4(v4, &v37, dword_100029000))
    {
      if (v37 > (unint64_t)xmmword_100028FF0 || v38 > *((void *)&xmmword_100028FF0 + 1))
      {
        ramrod_log_msg("image dimensions (%zu, %zu) too big\n", v29, v30, v31, v32, v33, v34, v35, v37);
      }
      else
      {
        if (a2) {
          sub_100011484((uint64_t)&v37, 1);
        }
        sub_1000114FC(*((__IOSurface **)&unk_100029050 + dword_100028AF8), (uint64_t *)&v37);
        sub_10001156C();
        sub_1000114FC(*((__IOSurface **)&unk_100029050 + dword_100028AF8), (uint64_t *)&v37);
      }
    }
    else
    {
      ramrod_log_msg("unable to load image '%s'\n", v29, v30, v31, v32, v33, v34, v35, (char)buffer);
    }
  }
  return pthread_mutex_unlock(&stru_100028FB0);
}

BOOL sub_10001102C(const char *a1, const char *a2, int a3, char *a4)
{
  memset(v18, 0, sizeof(v18));
  unsigned int v8 = MGGetSInt32Answer() - 1;
  if (v8 >= 9 || ((0x12Fu >> v8) & 1) == 0)
  {
    LOBYTE(v18[0]) = 0;
    byte_10002900C = 0;
LABEL_4:
    snprintf(a4, 0x400uLL, "%s/%s@%zu.tga", a1, a2, *((size_t *)&xmmword_100028FF0 + 1));
    if (access(a4, 0))
    {
      snprintf(a4, 0x400uLL, "%s/%s@%dx.tga", a1, a2, a3);
      if (access(a4, 0))
      {
        if (!LOBYTE(v18[0]) || (snprintf(a4, 0x400uLL, "%s/%s~%s.tga", a1, a2, (const char *)v18), access(a4, 0)))
        {
          snprintf(a4, 0x400uLL, "%s/%s.tga", a1, a2);
          return access(a4, 0) == 0;
        }
      }
    }
    return 1;
  }
  __strlcpy_chk();
  byte_10002900C = 0;
  if (!LOBYTE(v18[0])) {
    goto LABEL_4;
  }
  ramrod_log_msg("Using product_suffix of %s\n", v10, v11, v12, v13, v14, v15, v16, (char)v18);
  MGGetFloat32Answer();
  if (v17 > 0.0)
  {
    snprintf(a4, 0x400uLL, "%s/%s@%zu~%s-USBc.tga", a1, a2, *((size_t *)&xmmword_100028FF0 + 1), (const char *)v18);
    if (!access(a4, 0))
    {
      BOOL result = 1;
      byte_10002900C = 1;
      return result;
    }
  }
  snprintf(a4, 0x400uLL, "%s/%s@%zu~%s.tga", a1, a2, *((size_t *)&xmmword_100028FF0 + 1), (const char *)v18);
  if (access(a4, 0))
  {
    snprintf(a4, 0x400uLL, "%s/%s@%dx~%s.tga", a1, a2, a3, (const char *)v18);
    if (access(a4, 0)) {
      goto LABEL_4;
    }
  }
  return 1;
}

uint64_t sub_1000112A4(const char *a1, void *a2, int a3)
{
  size_t v6 = strlen(a1);
  if (v6 < 4 || strcasecmp(&a1[v6 - 4], ".png"))
  {
    if ((ramrod_load_tga(a1, a2, a2 + 1, a2 + 2) & 1) == 0) {
      return 0;
    }
LABEL_4:
    if (a3 > 179)
    {
      if (a3 != 270 && a3 != 180) {
        goto LABEL_20;
      }
    }
    else
    {
      if (!a3) {
        return 1;
      }
      if (a3 != 90)
      {
LABEL_20:
        ramrod_log_msg("unexpected rotation value %d\n", v7, v8, v9, v10, v11, v12, v13, a3);
        return 0;
      }
    }
    uint64_t v15 = a2[1];
    uint64_t v14 = (int *)a2[2];
    uint64_t v16 = *a2;
    float v17 = (char *)malloc(4 * *a2 * v15);
    if (a3 == 90)
    {
      if (v15)
      {
        uint64_t v24 = 0;
        uint64_t v25 = (uint64_t)&v17[4 * v15 - 4];
        do
        {
          uint64_t v26 = (_DWORD *)v25;
          for (uint64_t i = v16; i; --i)
          {
            int v28 = *v14++;
            *uint64_t v26 = v28;
            v26 += v15;
          }
          ++v24;
          v25 -= 4;
        }
        while (v24 != v15);
      }
    }
    else
    {
      if (a3 == 180)
      {
        if (v15)
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (v16)
            {
              uint64_t v30 = &v17[4 * (v15 - j) * v16 - 4];
              uint64_t v31 = v16;
              do
              {
                int v32 = *v14++;
                *(_DWORD *)uint64_t v30 = v32;
                v30 -= 4;
                --v31;
              }
              while (v31);
            }
          }
        }
        goto LABEL_34;
      }
      if (v15)
      {
        uint64_t v18 = 0;
        uint64_t v19 = &v17[4 * (v16 - 1) * v15];
        do
        {
          unsigned int v20 = v19;
          for (uint64_t k = v16; k; --k)
          {
            int v22 = *v14++;
            *(_DWORD *)unsigned int v20 = v22;
            v20 -= 4 * v15;
          }
          ++v18;
          v19 += 4;
        }
        while (v18 != v15);
      }
    }
    *a2 = v15;
    a2[1] = v16;
LABEL_34:
    a2[2] = v17;
    return 1;
  }
  uint64_t result = ramrod_load_png(a1, a2, a2 + 1, a2 + 2);
  if (result) {
    goto LABEL_4;
  }
  return result;
}

uint64_t sub_100011484(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(result + 8) * *(void *)result;
  if (v2)
  {
    for (uint64_t i = *(int **)(result + 16); ; ++i)
    {
      uint64_t result = HIBYTE(*i);
      if (result != 255) {
        break;
      }
      if (a2)
      {
        uint64_t result = dword_100029044;
LABEL_10:
        *uint64_t i = result;
      }
      if (!--v2) {
        return result;
      }
    }
    if (a2) {
      int v5 = dword_100029044;
    }
    else {
      int v5 = *i;
    }
    uint64_t result = sub_1000128D8(result, v5);
    goto LABEL_10;
  }
  return result;
}

void sub_1000114FC(__IOSurface *a1, uint64_t *a2)
{
  unint64_t v4 = (unint64_t)(xmmword_100028FF0 - *a2) >> 1;
  unint64_t v5 = (unint64_t)(*((void *)&xmmword_100028FF0 + 1) - a2[1]) >> 1;
  sub_100012A64(a1);

  sub_100012ADC(a1, a2, v4, v5);
}

uint64_t sub_10001156C()
{
  if (qword_100029080) {
    BOOL v0 = dword_100028AF8 == -1;
  }
  else {
    BOOL v0 = 1;
  }
  if (!v0)
  {
    if (!(_BYTE)dword_10002903C) {
      sub_100012A64(*((__IOSurface **)&unk_100028FB0 + dword_100028AF8 + 20));
    }
    IOMobileFramebufferSwapBegin();
    if (byte_100029074) {
      IOMobileFramebufferSwapSetLayer();
    }
    IOMobileFramebufferSwapSetLayer();
    if (byte_100029074)
    {
      IOMobileFramebufferSwapSetLayer();
      byte_100029074 = 0;
    }
    uint64_t result = IOMobileFramebufferSwapEnd();
    dword_100028AF8 = 1 - dword_100028AF8;
  }
  return result;
}

uint64_t ramrod_display_set_background_color(char a1, char a2, char a3)
{
  pthread_once(&stru_100028AD8, (void (*)(void))sub_1000109CC);
  pthread_mutex_lock(&stru_100028FB0);
  BYTE2(dword_10002903C) = a1;
  HIBYTE(dword_10002903C) = a2;
  byte_100029040 = a3;
  sub_100010D00();

  return pthread_mutex_unlock(&stru_100028FB0);
}

uint64_t ramrod_clear_ui()
{
  pthread_once(&stru_100028AD8, (void (*)(void))sub_1000109CC);
  pthread_mutex_lock(&stru_100028FB0);
  if (qword_1000290D0)
  {
    qword_1000290C0 = 0;
    *(void *)&dword_1000290C8 = 0;
    free((void *)qword_1000290D0);
    qword_1000290D0 = 0;
  }
  off_100029098();
  sub_100012A64((__IOSurface *)qword_100029060);
  sub_1000117E8();

  return pthread_mutex_unlock(&stru_100028FB0);
}

void sub_1000117E8()
{
  if (qword_1000290D0)
  {
    int v0 = 0;
    if (dword_100029000 > 179)
    {
      if (dword_100029000 == 180)
      {
        int v0 = ((int)xmmword_100028FF0 - (int)qword_1000290C0) / 2;
        int v1 = dword_10002901C - 2 * dword_1000290C8;
        goto LABEL_13;
      }
      int v1 = 0;
      if (dword_100029000 == 270)
      {
        int v0 = dword_100029018 + 2 * qword_1000290C0;
        goto LABEL_10;
      }
    }
    else
    {
      if (!dword_100029000)
      {
        int v0 = ((int)xmmword_100028FF0 - (int)qword_1000290C0) / 2;
        int v1 = dword_10002901C + 2 * dword_1000290C8;
        goto LABEL_13;
      }
      int v1 = 0;
      if (dword_100029000 == 90)
      {
        int v0 = dword_100029018 - 2 * qword_1000290C0;
LABEL_10:
        int v1 = (DWORD2(xmmword_100028FF0) - dword_1000290C8) / 2;
      }
    }
  }
  else
  {
    int v0 = 0;
    int v1 = 0;
  }
LABEL_13:
  for (uint64_t i = 0; i != 16; i += 8)
  {
    uint64_t v3 = *(__IOSurface **)((char *)&unk_100028FB0 + i + 160);
    if (v3)
    {
      sub_100012A64(v3);
      if (qword_1000290E8) {
        sub_100012ADC(*(__IOSurface **)((char *)&unk_100028FB0 + i + 160), &qword_1000290D8, dword_100029010, unk_100029014);
      }
      if (qword_1000290D0) {
        sub_100012ADC(*(__IOSurface **)((char *)&unk_100028FB0 + i + 160), &qword_1000290C0, v0, v1);
      }
    }
  }
}

BOOL ramrod_display_set_aux_image_path(const __CFString *a1, CFErrorRef *a2)
{
  pthread_once(&stru_100028AD8, (void (*)(void))sub_1000109CC);
  pthread_mutex_lock(&stru_100028FB0);
  if (qword_1000290D0)
  {
    qword_1000290C0 = 0;
    *(void *)&dword_1000290C8 = 0;
    free((void *)qword_1000290D0);
    qword_1000290D0 = 0;
  }
  if (a1)
  {
    bzero(buffer, 0x400uLL);
    CFStringGetFileSystemRepresentation(a1, buffer, 1024);
    int v4 = sub_1000112A4(buffer, &qword_1000290C0, dword_100029000);
    BOOL v12 = v4 != 0;
    if (v4)
    {
      sub_100011484((uint64_t)&qword_1000290C0, 0);
    }
    else
    {
      ramrod_log_msg("failed to load image %s\n", v5, v6, v7, v8, v9, v10, v11, (char)buffer);
      ramrod_create_error_cf(a2, @"RamrodErrorDomain", 3, 0, @"%s: unable to load image file %@", v13, v14, v15, (char)"ramrod_display_set_aux_image_path");
    }
  }
  else
  {
    BOOL v12 = 1;
  }
  sub_1000117E8();
  ramrod_set_progress_UI(1, *(double *)&qword_100028AF0);
  pthread_mutex_unlock(&stru_100028FB0);
  return v12;
}

BOOL ramrod_display_has_framebuffer()
{
  return dword_100029078 > 0;
}

BOOL ramrod_display_retry_framebuffer_create()
{
  return dword_100029078 > 0;
}

void sub_100011BC0()
{
  if (dword_100029078 > 0) {
    return;
  }
  CFArrayRef DisplayList = (const __CFArray *)IOMobileFramebufferCreateDisplayList();
  if (DisplayList) {
    goto LABEL_3;
  }
  int v32 = dword_100028B10;
  if (dword_100028B10 >= 1)
  {
    int v33 = dword_100028B10 + 1;
    do
    {
      dword_100028B10 = v32 - 1;
      int v34 = 100000 * (v33 - v32);
      if (v34 >= 1000000) {
        useconds_t v35 = 1000000;
      }
      else {
        useconds_t v35 = v34;
      }
      usleep(v35);
      uint64_t v36 = IOMobileFramebufferCreateDisplayList();
      int v32 = dword_100028B10;
    }
    while (dword_100028B10 >= 1 && v36 == 0);
    CFArrayRef DisplayList = (const __CFArray *)v36;
    if (v36)
    {
LABEL_3:
      uint64_t v8 = (char *)qword_100029088;
      if (qword_100029088)
      {
        if (dword_100029078 >= 1)
        {
          uint64_t v9 = 0;
          uint64_t v10 = 72;
          do
          {
            CFRelease(*(CFTypeRef *)&v8[v10]);
            uint64_t v8 = (char *)qword_100029088;
            *(void *)(qword_100029088 + v10) = 0;
            ++v9;
            v10 += 80;
          }
          while (v9 < dword_100029078);
        }
        free(v8);
        qword_100029088 = 0;
      }
      dword_100029078 = 0;
      size_t Count = CFArrayGetCount(DisplayList);
      qword_100029088 = (uint64_t)calloc(Count, 0x50uLL);
      if (!qword_100029088)
      {
        unint64_t v38 = "unable to allocate framebuffer display\n";
        goto LABEL_29;
      }
      CFIndex v19 = sub_1000135EC(DisplayList, 0);
      if (qword_100029080) {
        goto LABEL_35;
      }
      CFIndex v19 = sub_1000135EC(DisplayList, 1);
      if (dword_100029078 >= 1 && !*(unsigned char *)(qword_100029088 + 80 * (dword_100029078 - 1)))
      {
        ramrod_log_msg("attempting to power on display port\n", v12, v13, v14, v15, v16, v17, v18, v59);
        unsigned int v20 = (const void *)__IOAVClassMatching();
        if (v20)
        {
          io_object_t v28 = wait_for_io_service_matching_dict(v20, 0xAu);
          if (v28)
          {
            io_object_t v29 = v28;
            uint64_t v30 = (const void *)IOAVControllerCreateWithService();
            IOObjectRelease(v29);
            if (v30)
            {
              int v31 = IOAVControllerSetPower();
              CFRelease(v30);
              if (v31) {
                ramrod_log_msg("unable to power on DisplayPort: 0x%x\n", v12, v13, v14, v15, v16, v17, v18, v31);
              }
              goto LABEL_34;
            }
            uint64_t v39 = "Unable to create IOAVController from service";
          }
          else
          {
            uint64_t v39 = "timed out waiting for IOAVController service\n";
          }
        }
        else
        {
          uint64_t v39 = "IOAVClassMatching returned no matching class for IOAVController\n";
        }
        ramrod_log_msg(v39, v21, v22, v23, v24, v25, v26, v27, v59);
      }
LABEL_34:
      if (qword_100029080)
      {
LABEL_35:
        if (DisplayList) {
          CFRelease(DisplayList);
        }
        goto LABEL_37;
      }
      unint64_t v38 = "unable to find a usable display\n";
LABEL_29:
      ramrod_log_msg(v38, v12, v13, v14, v15, v16, v17, v18, v59);
      goto LABEL_35;
    }
  }
  ramrod_log_msg("unable to get display list\n", v0, v1, v2, v3, v4, v5, v6, v59);
LABEL_37:
  if (!dword_100029078)
  {
    id v55 = "unable to get framebuffer\n";
LABEL_52:
    ramrod_log_msg(v55, v12, v13, v14, v15, v16, v17, v18, v59);
LABEL_53:
    sub_100013574();
    return;
  }
  off_1000290B0(v19);
  if (!qword_100029080)
  {
    if (!*(unsigned char *)qword_100029088) {
      goto LABEL_50;
    }
    qword_100029080 = qword_100029088;
    ramrod_log_msg("%s: Will use %s\n", v40, v41, v42, v43, v44, v45, v46, (char)"create_framebuffer");
    if (!qword_100029080) {
      goto LABEL_50;
    }
  }
  v60[0] = 0;
  v60[1] = 0;
  int DisplaySize = IOMobileFramebufferGetDisplaySize();
  if (DisplaySize) {
    ramrod_log_msg("unable to get display size: 0x%x\n", v48, v49, v50, v51, v52, v53, v54, DisplaySize);
  }
  else {
    xmmword_100028FF0 = (__int128)vcvtq_u64_f64(*(float64x2_t *)v60);
  }
  off_100029090(dword_100029004, dword_100029000);
  CFStringRef v56 = (unsigned __int8 *)qword_100029080;
  if (!qword_100029080
    || !*(unsigned char *)qword_100029080
    || !*(unsigned char *)(qword_100029080 + 1) && !*(unsigned char *)(qword_100029088 + 80 * dword_100029078 - 80))
  {
LABEL_50:
    v60[0] = 0;
    if (pthread_create(v60, 0, (void *(__cdecl *)(void *))sub_100012CC0, 0))
    {
      id v55 = "unable to create hot plug thread\n";
      goto LABEL_52;
    }
    pthread_detach(v60[0]);
    CFStringRef v56 = (unsigned __int8 *)qword_100029080;
    if (!qword_100029080) {
      goto LABEL_53;
    }
  }
  int v57 = sub_100012E28(*((void *)v56 + 9), *v56);
  if (!*(unsigned char *)qword_100029080)
  {
    uint64_t v58 = off_100029090(dword_100029004, dword_100029000);
    off_1000290A0(v58);
    sub_1000117E8();
  }
  if (*(unsigned char *)(qword_100029088 + 80 * dword_100029078 - 80) && v57) {
    goto LABEL_53;
  }
}

uint64_t ramrod_display_set_granular_progress(double a1)
{
  return ramrod_display_set_granular_progress_forced(0, a1);
}

uint64_t ramrod_display_set_progress(int a1)
{
  return ramrod_display_set_granular_progress_forced(0, (double)a1);
}

void sub_100011FD0()
{
  int v0 = MGGetSInt32Answer();
  if (v0 == 3)
  {
    int v9 = dword_100029004;
    int v8 = 80 * dword_100029004;
    int v10 = 239;
  }
  else if (v0 == 9)
  {
    int v8 = (int)((double)*((unint64_t *)&xmmword_100028FF0 + 1) * -0.06
             + (double)*((unint64_t *)&xmmword_100028FF0 + 1) * 0.5
             + -45.0
             + -2.0);
    int v9 = dword_100029004;
    int v10 = 234;
  }
  else
  {
    int v9 = dword_100029004;
    int v8 = 56 * dword_100029004;
    int v10 = 189;
  }
  int v11 = v9 * v10;
  if (byte_10002900C)
  {
    int v12 = MGGetSInt32Answer();
    dword_100029008 = v12;
    if (v12 == 11) {
      int v13 = 286;
    }
    else {
      int v13 = 224;
    }
    if (v12 == 20) {
      int v8 = 254;
    }
    else {
      int v8 = v13;
    }
  }
  ramrod_log_msg("Progress Bar Y offset at %d, display class %d\n", v1, v2, v3, v4, v5, v6, v7, v8);
  int v14 = dword_100029000;
  if (dword_100029000 > 179)
  {
    if (dword_100029000 == 180)
    {
      int v14 = 0;
      dword_100029010 = ((int)xmmword_100028FF0 - (int)qword_1000290D8) / 2;
      unk_100029014 = (DWORD2(xmmword_100028FF0) - dword_1000290E0) / 2;
      dword_100029018 = (v11 + (int)xmmword_100028FF0) / 2;
      int v15 = (*((void *)&xmmword_100028FF0 + 1) >> 1) - v8;
      unint64_t v16 = 0xFFFFFFFFLL;
    }
    else
    {
      if (dword_100029000 != 270) {
        return;
      }
      dword_100029010 = ((int)xmmword_100028FF0 - (int)qword_1000290D8) / 2;
      unk_100029014 = (DWORD2(xmmword_100028FF0) - dword_1000290E0) / 2;
      dword_100029018 = v8 + ((unint64_t)xmmword_100028FF0 >> 1);
      int v15 = (v11 + DWORD2(xmmword_100028FF0)) / 2;
      unint64_t v16 = 0xFFFFFFFF00000000;
      int v14 = 1;
    }
  }
  else if (dword_100029000)
  {
    if (dword_100029000 != 90) {
      return;
    }
    dword_100029010 = ((int)xmmword_100028FF0 - (int)qword_1000290D8) / 2;
    unk_100029014 = (DWORD2(xmmword_100028FF0) - dword_1000290E0) / 2;
    dword_100029018 = ((unint64_t)xmmword_100028FF0 >> 1) - v8;
    int v15 = (DWORD2(xmmword_100028FF0) - v11) / 2;
    unint64_t v16 = (unint64_t)&_mh_execute_header;
    int v14 = -1;
  }
  else
  {
    dword_100029010 = ((int)xmmword_100028FF0 - (int)qword_1000290D8) / 2;
    unk_100029014 = (DWORD2(xmmword_100028FF0) - dword_1000290E0) / 2;
    dword_100029018 = ((int)xmmword_100028FF0 - v11) / 2;
    int v15 = v8 + (*((void *)&xmmword_100028FF0 + 1) >> 1);
    unint64_t v16 = 1;
  }
  dword_10002901C = v15;
  *(void *)&dword_100029020 = v16;
  dword_100029028 = v14;
  dword_10002902C = v16;
  dword_100029030 = v11 - 4;
}

uint64_t sub_1000122E4(int a1, int a2)
{
  bzero(v13, 0x400uLL);
  if (sub_10001102C("/usr/share/progressui", "applelogo", a1, v13))
  {
    ramrod_log_msg("found applelogo at %s\n", v4, v5, v6, v7, v8, v9, v10, (char)v13);
    sub_1000112A4(v13, &qword_1000290D8, a2);
  }
  else
  {
    ramrod_log_msg("unable to find a suitable applelogo for this hardware\n", v4, v5, v6, v7, v8, v9, v10, v12);
  }
  return sub_100011484((uint64_t)&qword_1000290D8, 1);
}

void sub_1000123B8()
{
  if (qword_1000290E8)
  {
    qword_1000290D8 = 0;
    *(void *)&dword_1000290E0 = 0;
    free((void *)qword_1000290E8);
    qword_1000290E8 = 0;
  }
}

void sub_100012410(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  double v9 = a1 - *(double *)&qword_1000290F0;
  if (a1 - *(double *)&qword_1000290F0 < 0.0) {
    double v9 = 0.0;
  }
  if (*(double *)&qword_1000290F0 > 0.0) {
    double v10 = v9;
  }
  else {
    double v10 = a1;
  }
  if (byte_1000290B8 == 1) {
    double v11 = v10;
  }
  else {
    double v11 = a1;
  }
  if (v11 * (double)dword_100029030 / 100.0 >= (double)dword_100029030) {
    double v12 = (double)dword_100029030;
  }
  else {
    double v12 = v11 * (double)dword_100029030 / 100.0;
  }
  if ((dword_100028AF8 & 0x80000000) == 0)
  {
    int v13 = (__IOSurface *)*((void *)&unk_100028FB0 + dword_100028AF8 + 20);
    uint64_t v14 = *((unsigned int *)&unk_100028FB0 + dword_100028AF8 + 46);
    if (v14) {
      IOMobileFramebufferSwapWaitWithTimeout();
    }
    if (BYTE1(dword_10002903C))
    {
      unsigned int v15 = IOSurfaceGetBytesPerRow(v13) >> 2;
      uint64_t v23 = (char *)IOSurfaceGetBaseAddress(v13) + 4 * (int)(dword_10002901C * v15);
      int v24 = dword_100029004;
      if (dword_100029004 < 5)
      {
        if (dword_100029004 <= 0)
        {
          ramrod_log_msg("Warning: Detected scale is X%d, Supported scales are 1 to %d. Going to use X1 as a fallback.\n", v16, v17, v18, v19, v20, v21, v22, dword_100029004);
          int v24 = 1;
        }
      }
      else
      {
        ramrod_log_msg("Warning: Detected scale is X%d, Supported scales are 1 to %d. Going to use X%d as a fallback.\n", v16, v17, v18, v19, v20, v21, v22, dword_100029004);
        int v24 = 4;
      }
      unsigned int v25 = 0;
      uint64_t v26 = 0;
      uint64_t v44 = (4 * v24);
      uint64_t v46 = (unsigned __int8 *)*(&off_100025038 + 3 * (v24 - 1));
      uint64_t v27 = *v46;
      while (1)
      {
        io_object_t v28 = &dword_100029044;
        if (v11 <= 0.0)
        {
          uint64_t v29 = *((void *)v46 + 2);
          if (v29)
          {
            io_object_t v28 = &dword_100029044;
            goto LABEL_28;
          }
          io_object_t v28 = &dword_100029048;
        }
        uint64_t v29 = *((void *)v46 + 1);
LABEL_28:
        uint64_t v30 = v25;
        int v31 = (int *)&v23[4 * dword_100029018];
        uint64_t v45 = v23;
        if (v27)
        {
          int v32 = *v28;
          int v33 = (unsigned __int8 *)(v29 + v25);
          uint64_t v34 = v27;
          do
          {
            int v35 = *v33++;
            int *v31 = sub_1000128D8(v35, v32);
            v31 += (int)(*(_DWORD *)algn_100029024 * v15) + dword_100029020;
            --v34;
          }
          while (v34);
        }
        if (dword_100029030 >= 1)
        {
          int v36 = 0;
          do
          {
            unint64_t v37 = &dword_100029044;
            if (v36 >= (int)v12) {
              unint64_t v37 = &dword_100029048;
            }
            int *v31 = *v37;
            v31 += (int)(*(_DWORD *)algn_100029024 * v15) + dword_100029020;
            ++v36;
          }
          while (v36 < dword_100029030);
        }
        unint64_t v38 = &dword_100029044;
        if (v11 < 100.0)
        {
          uint64_t v39 = *((void *)v46 + 2);
          if (v39)
          {
            unint64_t v38 = &dword_100029044;
            if (v27) {
              goto LABEL_42;
            }
            goto LABEL_44;
          }
          unint64_t v38 = &dword_100029048;
        }
        uint64_t v39 = *((void *)v46 + 1);
        if (v27)
        {
LABEL_42:
          int v40 = *v38;
          uint64_t v41 = v39 + v30 - 1;
          uint64_t v42 = v27;
          do
          {
            int *v31 = sub_1000128D8(*(unsigned __int8 *)(v41 + v42), v40);
            v31 += (int)(*(_DWORD *)algn_100029024 * v15) + dword_100029020;
            --v42;
          }
          while (v42);
        }
LABEL_44:
        uint64_t v23 = &v45[4 * dword_10002902C * v15 + 4 * dword_100029028];
        ++v26;
        unsigned int v25 = v30 + v27;
        if (v26 == v44) {
          goto LABEL_45;
        }
      }
    }
    ramrod_log_msg("Not updating screen progress since showprogress is set to false\n", v14, a4, a5, a6, a7, a8, a9, v43);
LABEL_45:
    sub_10001156C();
  }
}

void sub_100012784()
{
  MGGetFloat32Answer();
  dword_100029004 = v0;
  MGGetFloat32Answer();
  float v2 = v1;
  dword_100029008 = MGGetSInt32Answer();
  int v3 = MGGetSInt32Answer();
  ramrod_log_msg("display-boot-rotation = %d\n", v4, v5, v6, v7, v8, v9, v10, v3);
  float v11 = v2 * 57.2957795;
  dword_100029000 = (int)(v3 - llroundf(v11) + 360) % 360;
  ramrod_log_msg("display-scale = %d\n", v12, v13, v14, v15, v16, v17, v18, dword_100029004);
  ramrod_log_msg("display-rotation = %d\n", v19, v20, v21, v22, v23, v24, v25, dword_100029000);
  if (dword_100029000 > 179)
  {
    if (dword_100029000 != 180 && dword_100029000 != 270) {
      goto LABEL_7;
    }
  }
  else if (dword_100029000 && dword_100029000 != 90)
  {
LABEL_7:
    ramrod_log_msg("display-rotation value (%d) unsupported, not rotating images\n", v26, v27, v28, v29, v30, v31, v32, dword_100029000);
    dword_100029000 = 0;
  }
}

uint64_t sub_1000128D8(int a1, int a2)
{
  return ((((32897 * BYTE2(dword_10002903C) * (a1 ^ 0xFFu)) >> 23) + ((32897 * BYTE2(a2) * a1) >> 23)) << 16) | ((((32897 * HIBYTE(dword_10002903C) * (a1 ^ 0xFFu)) >> 23) + ((32897 * BYTE1(a2) * a1) >> 23)) << 8) | (((32897 * byte_100029040 * (a1 ^ 0xFFu)) >> 23) + ((32897 * a2 * a1) >> 23)) | 0xFF000000;
}

void sub_10001295C()
{
  if (byte_1000290B8 == 1)
  {
    dispatch_time_t v0 = dispatch_time(0, 1000000000);
    global_queue = dispatch_get_global_queue(2, 0);
    dispatch_after(v0, global_queue, &stru_1000250E8);
  }
}

void sub_1000129D4(id a1)
{
  sub_10001295C();
  pthread_mutex_lock(&stru_100028FB0);
  float v1 = *(double *)&qword_100028AF0;
  off_1000290A8(v1);
  double v2 = 1.0;
  if (*(double *)&qword_1000290F0 == 0.0
    || (double v3 = *(double *)&qword_1000290F0 + -1.0, v2 = 0.0, *(double *)&qword_1000290F0 + -1.0 < 0.0))
  {
    double v3 = v2;
  }
  qword_1000290F0 = *(void *)&v3;

  pthread_mutex_unlock(&stru_100028FB0);
}

void sub_100012A64(__IOSurface *a1)
{
  if (a1)
  {
    unsigned int v2 = BYTE2(dword_10002903C);
    unsigned int v3 = *(unsigned __int16 *)((char *)&dword_10002903C + 3);
    BaseAddress = IOSurfaceGetBaseAddress(a1);
    size_t AllocSize = IOSurfaceGetAllocSize(a1);
    int __pattern4 = (__PAIR64__(v2, bswap32(v3)) >> 16) | 0xFF000000;
    memset_pattern4(BaseAddress, &__pattern4, AllocSize);
  }
}

void sub_100012ADC(__IOSurface *a1, uint64_t *a2, int a3, int a4)
{
  int BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
  uint64_t v17 = *a2;
  if (*a2)
  {
    uint64_t v18 = a2[1];
    if ((unint64_t)(v18 + a4) <= *((void *)&xmmword_100028FF0 + 1)
      && v17 + a3 <= (unint64_t)xmmword_100028FF0)
    {
      if (v18)
      {
        uint64_t v19 = 0;
        uint64_t v20 = (int *)a2[2];
        do
        {
          uint64_t v21 = &BaseAddress[4 * a3 + ((v19 + a4) * BytesPerRow)];
          uint64_t v22 = v17;
          do
          {
            int v23 = *v20++;
            *(_DWORD *)uint64_t v21 = v23;
            v21 += 4;
            --v22;
          }
          while (v22);
          ++v19;
        }
        while (v19 != v18);
      }
    }
    else
    {
      dword_1000290F8 = a3;
      dword_100029100 = a4;
      qword_100029110 = v17;
      qword_100029108 = v18;
      pthread_once(&stru_100028B00, (void (*)(void))sub_100012C24);
    }
  }
  else
  {
    ramrod_log_msg("%s: can't blit - image x offset greater that width [%d > %zu]\n", v10, v11, v12, v13, v14, v15, v16, (char)"display_blit_raw_image_limit");
  }
}

void sub_100012C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  ramrod_log_msg("Can't blit image into display buffer since it overflows the display size!\n", a2, a3, a4, a5, a6, a7, a8, v37);
  ramrod_log_msg("Here is some image and display information to debug your overflow issue:\n", v9, v10, v11, v12, v13, v14, v15, v38);
  ramrod_log_msg("Display Info: width=%zu height=%zu\n", v16, v17, v18, v19, v20, v21, v22, xmmword_100028FF0);
  ramrod_log_msg("Image Info: xoff=%d yoff=%d height=%zu width=%zu\n", v23, v24, v25, v26, v27, v28, v29, dword_1000290F8);

  ramrod_log_msg("This message will only be logged once for all failed blits!\n", v30, v31, v32, v33, v34, v35, v36, a9);
}

uint64_t sub_100012CC0()
{
  double Current = CFRunLoopGetCurrent();
  ramrod_log_msg("starting display hot plug thread\n", v1, v2, v3, v4, v5, v6, v7, v27);
  if (dword_100029078 < 1) {
    goto LABEL_12;
  }
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  int v17 = 0;
  do
  {
    if (!*(unsigned char *)(qword_100029088 + v15))
    {
      RunLoopSource = (__CFRunLoopSource *)IOMobileFramebufferGetRunLoopSource();
      if (RunLoopSource)
      {
        CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
        if (IOMobileFramebufferEnableHotPlugDetectNotifications()) {
          ramrod_log_msg("unable to register for hot plug notifications on %s: 0x%x\n", v8, v9, v10, v11, v12, v13, v14, qword_100029088 + v15 + 2);
        }
        else {
          ++v17;
        }
      }
    }
    ++v16;
    v15 += 80;
  }
  while (v16 < dword_100029078);
  if (v17 <= 0)
  {
LABEL_12:
    ramrod_log_msg("no external displays registered for hot plug notifications\n", v8, v9, v10, v11, v12, v13, v14, v28);
  }
  else
  {
    ramrod_log_msg("listening for hot plug notifications from %d display%s\n", v8, v9, v10, v11, v12, v13, v14, v17);
    CFRunLoopRun();
  }
  ramrod_log_msg("display hot plug thread exiting\n", v19, v20, v21, v22, v23, v24, v25, v29);
  return 0;
}

uint64_t sub_100012E28(uint64_t a1, int a2)
{
  if (!a2)
  {
    int v82 = 0;
    int v10 = IOMobileFramebufferSetDisplayDevice();
    if (v10)
    {
      ramrod_log_msg("unable to set display device: 0x%x\n", v11, v12, v13, v14, v15, v16, v17, v10);
    }
    else
    {
      uint64_t v84 = 0;
      uint64_t v85 = 0;
      uint64_t v83 = 0;
      int SupportedDigitalOutModes = IOMobileFramebufferGetSupportedDigitalOutModes();
      if (SupportedDigitalOutModes) {
        ramrod_log_msg("unable to get color and timing modes: 0x%x\n", v62, v63, v64, v65, v66, v67, v68, SupportedDigitalOutModes);
      }
      else {
        ramrod_log_msg("NULL timing (%p) modes\n", v62, v63, v64, v65, v66, v67, v68, 0);
      }
    }
    return 0xFFFFFFFFLL;
  }
  int DisplaySize = IOMobileFramebufferGetDisplaySize();
  if (DisplaySize)
  {
    ramrod_log_msg("unable to get display size: 0x%x\n", v3, v4, v5, v6, v7, v8, v9, DisplaySize);
    return 0xFFFFFFFFLL;
  }
  *(void *)&xmmword_100028FF0 = (unint64_t)0.0;
  *((void *)&xmmword_100028FF0 + 1) = (unint64_t)0.0;
  byte_100029074 = 1;
  ramrod_log_msg("display: %zu x %zu\n", v3, v4, v5, v6, v7, v8, v9, (unint64_t)0.0);
  off_1000290A0();
  for (uint64_t i = 0; i != 3; ++i)
  {
    long long v19 = xmmword_100028FF0;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!Mutable)
    {
      *((void *)&unk_100028FB0 + i + 20) = 0;
LABEL_20:
      ramrod_log_msg("unable to create display buffer %i\n", v21, v22, v23, v24, v25, v26, v27, i);
      return 0xFFFFFFFFLL;
    }
    char v28 = Mutable;
    sub_100013CC4(Mutable, kIOSurfaceBytesPerRow, (4 * v19 + 63) & 0xFFFFFFC0);
    sub_100013CC4(v28, kIOSurfaceWidth, v19);
    sub_100013CC4(v28, kIOSurfaceHeight, SDWORD2(v19));
    sub_100013CC4(v28, kIOSurfacePixelFormat, 1111970369);
    sub_100013CC4(v28, kIOSurfaceBytesPerElement, 4);
    if ((_get_cpu_capabilities() & 0x800) != 0) {
      int v29 = 1792;
    }
    else {
      int v29 = 1024;
    }
    sub_100013CC4(v28, kIOSurfaceCacheMode, v29);
    uint64_t v30 = IOSurfaceCreate(v28);
    CFRelease(v28);
    *((void *)&unk_100028FB0 + i + 20) = v30;
    if (!v30) {
      goto LABEL_20;
    }
    if (IOSurfaceLock(v30, 0, 0))
    {
      ramrod_log_msg("unable to lock display buffer %i: 0x%x\n", v31, v32, v33, v34, v35, v36, v37, i);
      return 0xFFFFFFFFLL;
    }
  }
  sub_100012A64((__IOSurface *)qword_100029060);
  sub_1000117E8();
  v81[0] = 128;
  int v38 = sysctlbyname("hw.target", &unk_100029118, v81, 0, 0);
  ramrod_log_msg("%s: HW.target returned: %s\n", v39, v40, v41, v42, v43, v44, v45, (char)"skip_display_poweron_for_device");
  if (!v38)
  {
    CFStringRef v69 = (const __CFString *)MGCopyAnswer();
    if (v69)
    {
      CFStringRef v70 = v69;
      CFStringGetCStringPtr(v69, 0x8000100u);
      ramrod_log_msg("%s: DeviceName is: %s\n", v71, v72, v73, v74, v75, v76, v77, (char)"skip_display_poweron_for_device");
      CFComparisonResult v78 = CFStringCompare(@"Apple Display", v70, 1uLL);
      CFRelease(v70);
      if (v78 == kCFCompareEqualTo)
      {
        ramrod_log_msg("Display-less device detected. Skipping poweron entirely\n", v46, v47, v48, v49, v50, v51, v52, v80);
        return 0xFFFFFFFFLL;
      }
    }
  }
  ramrod_log_msg("powering on display\n", v46, v47, v48, v49, v50, v51, v52, v80);
  int v53 = IOMobileFramebufferRequestPowerChange();
  if (v53)
  {
    ramrod_log_msg("IOMobileFramebufferRequestPowerChange failed: %x\n", v54, v55, v56, v57, v58, v59, v60, v53);
    return 0xFFFFFFFFLL;
  }
  IOMobileFramebufferSwapWait();
  uint64_t result = 0;
  dword_100028AF8 = 0;
  return result;
}

void sub_100013574()
{
  uint64_t v0 = 0;
  xmmword_100028FF0 = 0uLL;
  do
  {
    uint64_t v1 = (CFTypeRef *)((char *)&unk_100028FB0 + v0);
    uint64_t v2 = *(__IOSurface **)((char *)&unk_100028FB0 + v0 + 160);
    if (v2)
    {
      IOSurfaceUnlock(v2, 0, 0);
      CFRelease(v1[20]);
      v1[20] = 0;
    }
    v0 += 8;
  }
  while (v0 != 24);
  dword_100028AF8 = -1;
}

CFIndex sub_1000135EC(const __CFArray *a1, int a2)
{
  CFIndex result = CFArrayGetCount(a1);
  if (result >= 1)
  {
    for (CFIndex i = 0; i < result; ++i)
    {
      CFStringRef ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(a1, i);
      if (*((_DWORD *)ValueAtIndex + 2) == a2)
      {
        uint64_t v7 = qword_100029088;
        int v8 = dword_100029078;
        uint64_t v9 = (BOOL *)(qword_100029088 + 80 * dword_100029078);
        if (!CFStringGetCString(*ValueAtIndex, (char *)v9 + 2, 64, 0x8000100u)) {
          __strlcpy_chk();
        }
        ramrod_log_msg("found display: %s\n", v10, v11, v12, v13, v14, v15, v16, (_BYTE)v9 + 2);
        int v17 = IOMobileFramebufferOpenByName();
        if (v17)
        {
          ramrod_log_msg("unable to open framebuffer: 0x%x\n", v18, v19, v20, v21, v22, v23, v24, v17);
        }
        else
        {
          ++dword_100029078;
          uint64_t v25 = v7 + 80 * v8;
          *(unsigned char *)(v25 + 1) = 0;
          uint64_t v26 = (BOOL *)(v25 + 1);
          *uint64_t v9 = a2 == 0;
          char v35 = 0;
          if (!a2)
          {
            int v34 = 1;
            char v35 = 1;
LABEL_13:
            *uint64_t v26 = v34 == 1;
            if (v34 == 1 && !qword_100029080)
            {
              qword_100029080 = (uint64_t)v9;
              ramrod_log_msg("Will use display %s\n", v18, v19, v20, v21, v22, v23, v24, (_BYTE)v9 + 2);
              LOBYTE(v34) = v35;
            }
            ramrod_log_msg("Display state is %d\n", v18, v19, v20, v21, v22, v23, v24, v34);
            goto LABEL_17;
          }
          if (!IOMobileFramebufferGetDigitalOutState())
          {
            int v34 = 0;
            goto LABEL_13;
          }
          ramrod_log_msg("%s: Failed to query digital out state %08x\n", v18, v19, v20, v21, v22, v23, v24, (char)"get_display_state");
          ramrod_log_msg("Unable to get state of %s\n", v27, v28, v29, v30, v31, v32, v33, (_BYTE)v9 + 2);
        }
      }
LABEL_17:
      CFIndex result = CFArrayGetCount(a1);
    }
  }
  return result;
}

uint64_t sub_1000137C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a3;
  ramrod_log_msg("%s: display %s %s\n", a2, a3, a4, a5, a6, a7, a8, (char)"display_hot_plug");
  uint64_t v11 = pthread_mutex_lock((pthread_mutex_t *)&unk_100028FB0);
  uint64_t v19 = (unsigned char *)qword_100029080;
  if (a2)
  {
    *(unsigned char *)(v8 + 1) = 1;
    if (!v19 || !v19[1]) {
      goto LABEL_16;
    }
  }
  else
  {
    *(unsigned char *)(v8 + 1) = 0;
    if (v19 == (unsigned char *)v8)
    {
      ramrod_log_msg("%s: %s was active", v12, v13, v14, v15, v16, v17, v18, (char)"display_hot_plug");
    }
    else if (v19)
    {
      goto LABEL_17;
    }
    uint64_t v20 = dword_100029078;
    uint64_t v8 = qword_100029088;
    if (dword_100029078 >= 1)
    {
      uint64_t v21 = qword_100029088 + 2;
      while (!*(unsigned char *)(v21 - 1))
      {
        v21 += 80;
        if (!--v20) {
          goto LABEL_13;
        }
      }
      uint64_t v8 = v21 - 2;
      goto LABEL_16;
    }
LABEL_13:
    if (*(unsigned char *)qword_100029088)
    {
LABEL_16:
      ramrod_log_msg("%s: Will use %s\n", v12, v13, v14, v15, v16, v17, v18, (char)"display_hot_plug");
      uint64_t v19 = (unsigned char *)v8;
      goto LABEL_17;
    }
    uint64_t v19 = 0;
  }
LABEL_17:
  if ((unsigned char *)qword_100029080 != v19)
  {
    if (qword_100029080)
    {
      if (*(unsigned char *)qword_100029080) {
        BOOL v22 = dword_100028AF8 == -1;
      }
      else {
        BOOL v22 = 1;
      }
      if (!v22)
      {
        uint64_t v23 = (__IOSurface *)*((void *)&unk_100028FB0 + dword_100028AF8 + 20);
        if (v23)
        {
          sub_100012A64(v23);
          sub_10001156C();
        }
      }
      sub_100013574();
    }
    qword_100029080 = (uint64_t)v19;
    if (v19)
    {
      if (*v19)
      {
        off_1000290B0(v11);
        int v24 = *(unsigned __int8 *)qword_100029080;
      }
      else
      {
        int v24 = 0;
      }
      if (!sub_100012E28(a1, v24))
      {
        uint64_t v25 = off_100029090(dword_100029004, dword_100029000);
        off_1000290A0(v25);
        sub_1000117E8();
        if (*(double *)&qword_100028AF0 != -1.0) {
          off_1000290A8(*(double *)&qword_100028AF0);
        }
      }
    }
  }

  return pthread_mutex_unlock((pthread_mutex_t *)&unk_100028FB0);
}

CFNumberRef sub_1000139D0(const __CFDictionary *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  *a2 = 0;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"HorizontalAttributes");
  CFDictionaryRef v11 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"VerticalAttributes");
  if (Value)
  {
    CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(Value, @"Active");
    if (v12)
    {
      CFNumberRef v13 = v12;
      CFTypeID v14 = CFGetTypeID(v12);
      if (v14 == CFNumberGetTypeID()) {
        CFNumberGetValue(v13, kCFNumberIntType, a2);
      }
    }
  }
  if (v11)
  {
    int valuePtr = 0;
    CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(v11, @"Active");
    if (v15)
    {
      CFNumberRef v16 = v15;
      CFTypeID v17 = CFGetTypeID(v15);
      if (v17 == CFNumberGetTypeID()) {
        CFNumberGetValue(v16, kCFNumberIntType, a3);
      }
    }
    CFNumberRef v18 = (const __CFNumber *)CFDictionaryGetValue(v11, @"SyncRate");
    if (v18)
    {
      CFNumberRef v19 = v18;
      CFTypeID v20 = CFGetTypeID(v18);
      if (v20 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v19, kCFNumberIntType, &valuePtr);
        *a4 = (int)((float)((float)valuePtr * 0.000015259) + 0.5);
      }
    }
  }
  CFNumberRef result = (const __CFNumber *)CFDictionaryGetValue(a1, @"Score");
  if (result)
  {
    CFNumberRef v22 = result;
    CFTypeID v23 = CFGetTypeID(result);
    CFNumberRef result = (const __CFNumber *)CFNumberGetTypeID();
    if ((const __CFNumber *)v23 == result) {
      return (const __CFNumber *)CFNumberGetValue(v22, kCFNumberIntType, a5);
    }
  }
  return result;
}

uint64_t sub_100013B78(uint64_t a1, SInt32 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    CFNumberRef v13 = "can't fetch NVRAM value with NULL key\n";
LABEL_8:
    ramrod_log_msg(v13, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v28);
    return 2;
  }
  if (!a2)
  {
    CFNumberRef v13 = "can't load nil pointer with NVRAM value\n";
    goto LABEL_8;
  }
  CFStringRef v9 = (const __CFString *)ramrod_copy_NVRAM_variable();
  if (v9)
  {
    CFStringRef v10 = v9;
    int valuePtr = -1;
    CFTypeID v11 = CFGetTypeID(v9);
    if (v11 == CFStringGetTypeID())
    {
      IntCFDictionaryRef Value = CFStringGetIntValue(v10);
    }
    else if (v11 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)v10, kCFNumberIntType, &valuePtr);
      IntCFDictionaryRef Value = valuePtr;
    }
    else
    {
      if (v11 != CFDataGetTypeID())
      {
        ramrod_log_msg("can't convert unsupported CFType to int\n", v15, v16, v17, v18, v19, v20, v21, v28);
        goto LABEL_19;
      }
      BytePtr = CFDataGetBytePtr((CFDataRef)v10);
      if (!BytePtr) {
        goto LABEL_19;
      }
      CFTypeID v23 = BytePtr;
      CFIndex Length = CFDataGetLength((CFDataRef)v10);
      CFStringRef v25 = CFStringCreateWithBytes(kCFAllocatorDefault, v23, Length, 0x8000100u, 0);
      if (!v25) {
        goto LABEL_19;
      }
      CFStringRef v26 = v25;
      IntCFDictionaryRef Value = CFStringGetIntValue(v25);
      CFRelease(v26);
    }
    if (IntValue != -1)
    {
      uint64_t v14 = 0;
      *a2 = IntValue;
LABEL_20:
      CFRelease(v10);
      return v14;
    }
LABEL_19:
    uint64_t v14 = 3;
    goto LABEL_20;
  }
  return 2;
}

void sub_100013CC4(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
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

CFTypeRef ramrod_copy_NVRAM_variable_from_devicetree(CFStringRef theString)
{
  CFStringRef Copy = CFStringCreateCopy(0, theString);
  io_registry_entry_t v2 = atomic_load((unsigned int *)dword_100029198);
  if (!v2)
  {
    io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/options");
    if (v2)
    {
      io_registry_entry_t v5 = 0;
      atomic_compare_exchange_strong(dword_100029198, &v5, v2);
      if (v5)
      {
        IOObjectRelease(v2);
        io_registry_entry_t v2 = v5;
      }
    }
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v2, Copy, 0, 0);
  CFRelease(Copy);
  return CFProperty;
}

uint64_t ramrod_load_tga(const char *a1, void *a2, unint64_t *a3, void *a4)
{
  char v7 = (char)a1;
  memset(&v81, 0, sizeof(v81));
  int v8 = open(a1, 0, 0);
  if ((v8 & 0x80000000) == 0)
  {
    int v9 = v8;
    if (fstat(v8, &v81))
    {
      CFStringRef v10 = __error();
      strerror(*v10);
      ramrod_log_msg("unable to stat image '%s': %s\n", v11, v12, v13, v14, v15, v16, v17, v7);
LABEL_4:
      uint64_t v18 = 0;
LABEL_25:
      close(v9);
      return v18;
    }
    st_size_t size = v81.st_size;
    char v28 = (unsigned __int8 *)mmap(0, v81.st_size, 1, 2, v9, 0);
    if (v28 == (unsigned __int8 *)-1)
    {
      uint64_t v42 = __error();
      strerror(*v42);
      ramrod_log_msg("unable to mmap image '%s': %s\n", v43, v44, v45, v46, v47, v48, v49, v7);
      goto LABEL_4;
    }
    uint64_t v36 = v28;
    if (st_size >= 0x13
      && v28[1] <= 1u
      && ((unsigned int v37 = v28[2], v37 <= 0xB) ? (v38 = ((1 << v37) & 0xE0E) == 0) : (v38 = 1),
          !v38
       && v28[7] <= 0x20u
       && (v28[12] || v28[13])
       && (v28[14] || v28[15])
       && (int v39 = v28[16], HIDWORD(v40) = v39, LODWORD(v40) = (v39 << 24) - 0x8000000, (v40 >> 27) <= 3u)
       && v28[17] < 0x40u))
    {
      if (!v28[1] && v37 >= 0xA)
      {
        uint64_t v50 = *((unsigned __int16 *)v28 + 6);
        if (*((_WORD *)v28 + 6))
        {
          if (*((_WORD *)v28 + 7))
          {
            uint64_t v51 = *v28;
            if (v39 == 24 || v39 == 32)
            {
              uint64_t v52 = 4 * v50;
              unint64_t v53 = *((unsigned __int16 *)v28 + 7);
              uint64_t v79 = *((unsigned __int16 *)v28 + 6);
              unsigned __int8 v80 = v28[17];
              uint64_t v54 = (char *)malloc((4 * v50) * v53);
              uint64_t v55 = 0;
              char v56 = 0;
              char v57 = 0;
              char v58 = 0;
              char v59 = 0;
              unint64_t v60 = 0;
              uint64_t v61 = 0;
              unsigned int v62 = v53 - 1;
              if ((v80 & 0x20) != 0) {
                unsigned int v62 = 0;
              }
              uint64_t v63 = &v54[v62 * (unint64_t)v52];
              unint64_t v64 = st_size - v51 - 18;
              uint64_t v65 = (char *)&v36[v51 + 18];
              uint64_t v66 = 1 - v79;
              while (1)
              {
                if (!v64)
                {
LABEL_69:
                  if (v54) {
                    free(v54);
                  }
                  goto LABEL_23;
                }
                char v68 = *v65++;
                char v67 = v68;
                int v69 = v68;
                --v64;
                if (v68 >= 0) {
                  char v70 = 1;
                }
                else {
                  char v70 = -127;
                }
                char v71 = v70 + v67;
                if (v39 == 24)
                {
                  if (v71)
                  {
                    uint64_t v76 = 0;
                    uint64_t v77 = &v63[4 * v61 + 1];
                    while (1)
                    {
                      if ((v69 & 0x80000000) == 0 || !v76)
                      {
                        BOOL v75 = v64 >= 3;
                        v64 -= 3;
                        if (!v75) {
                          goto LABEL_69;
                        }
                        char v57 = *v65;
                        char v58 = v65[1];
                        char v59 = v65[2];
                        v65 += 3;
                      }
                      *(v77 - 1) = v57;
                      *uint64_t v77 = v58;
                      v77[1] = v59;
                      v77[2] = -1;
                      if (!(v66 + v61 + v76)) {
                        goto LABEL_64;
                      }
                      ++v76;
                      v77 += 4;
                      if ((v69 + v70) == v76)
                      {
                        v61 += v76;
                        break;
                      }
                    }
                  }
                }
                else if (v71)
                {
                  uint64_t v72 = 0;
                  int v73 = (v69 + v70);
                  uint64_t v74 = &v63[4 * v61 + 1];
                  while (1)
                  {
                    if ((v69 & 0x80000000) == 0 || !v72)
                    {
                      BOOL v75 = v64 >= 4;
                      v64 -= 4;
                      if (!v75) {
                        goto LABEL_69;
                      }
                      char v56 = v65[3];
                      if (v56)
                      {
                        char v57 = *v65;
                        char v58 = v65[1];
                        char v59 = v65[2];
                      }
                      else
                      {
                        char v59 = 0;
                        char v58 = 0;
                        char v57 = 0;
                      }
                      v65 += 4;
                    }
                    *(v74 - 1) = v59;
                    *uint64_t v74 = v58;
                    v74[1] = v57;
                    v74[2] = v56;
                    if (!(v66 + v61 + v72)) {
                      break;
                    }
                    ++v72;
                    v74 += 4;
                    if (v73 == v72)
                    {
                      v61 += v72;
                      goto LABEL_67;
                    }
                  }
LABEL_64:
                  uint64_t v61 = 0;
                  unint64_t v78 = v53 - 2 + v55;
                  if ((v80 & 0x20) != 0) {
                    unint64_t v78 = v60 + 1;
                  }
                  ++v60;
                  uint64_t v63 = &v54[v78 * v52];
                }
LABEL_67:
                uint64_t v55 = -(uint64_t)v60;
                if (v60 >= v53)
                {
                  *a2 = v79;
                  *a3 = v53;
                  uint64_t v18 = 1;
                  *a4 = v54;
                  goto LABEL_24;
                }
              }
            }
          }
        }
      }
      ramrod_log_msg("image '%s' is an unsupported TGA\n", v29, v30, v31, v32, v33, v34, v35, v7);
    }
    else
    {
      ramrod_log_msg("image '%s' is not a TGA\n", v29, v30, v31, v32, v33, v34, v35, v7);
    }
LABEL_23:
    uint64_t v18 = 0;
LABEL_24:
    munmap(v36, st_size);
    goto LABEL_25;
  }
  uint64_t v19 = __error();
  strerror(*v19);
  ramrod_log_msg("unable to open image '%s': %s\n", v20, v21, v22, v23, v24, v25, v26, v7);
  return 0;
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

uint64_t ramrod_write_full_log_buffer_to_fd(int __fd)
{
  uint64_t v1 = qword_1000291A8;
  if (qword_1000291A0) {
    BOOL v2 = qword_1000291A8 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2
    && ((v4 = qword_1000291B0, (size_t v5 = ((int)qword_1000291B0 - (int)qword_1000291A0) & 0xFFFFFLL) != 0)
     && write(__fd, (const void *)qword_1000291A0, v5) == -1
     || v1 != v4 && write(__fd, (const void *)qword_1000291B0, v1 - v4) == -1))
  {
    return *__error();
  }
  else
  {
    return 0;
  }
}

uint64_t ramrod_add_log_fd(int a1)
{
  int valuePtr = a1;
  memset(&v9, 0, sizeof(v9));
  pthread_mutex_lock(&stru_100028B18);
  pthread_mutex_lock(&stru_100028B58);
  if (fstat(a1, &v9) || ((__int16)v9.st_mode & 0x80000000) == 0)
  {
    CFMutableDictionaryRef Mutable = (__CFSet *)*((void *)&xmmword_1000291B8 + 1);
    if (!*((void *)&xmmword_1000291B8 + 1))
    {
      CFMutableDictionaryRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 1, &kCFTypeSetCallBacks);
      *((void *)&xmmword_1000291B8 + 1) = Mutable;
      if (!Mutable)
      {
        uint64_t v3 = __stderrp;
        uint64_t v4 = "failed to allocate logging file descriptors";
        size_t v5 = 43;
        goto LABEL_12;
      }
    }
  }
  else
  {
    CFMutableDictionaryRef Mutable = (__CFSet *)xmmword_1000291B8;
    if (!(void)xmmword_1000291B8)
    {
      CFMutableDictionaryRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 1, &kCFTypeSetCallBacks);
      *(void *)&xmmword_1000291B8 = Mutable;
      if (!Mutable)
      {
        uint64_t v3 = __stderrp;
        uint64_t v4 = "failed to allocate logging file descriptors for regular files";
        size_t v5 = 61;
LABEL_12:
        fwrite(v4, v5, 1uLL, v3);
        CFNumberRef v6 = 0;
        goto LABEL_13;
      }
    }
  }
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (v6)
  {
    ramrod_write_full_log_buffer_to_fd(valuePtr);
    CFSetAddValue(Mutable, v6);
    uint64_t v7 = 0;
    goto LABEL_14;
  }
  fwrite("failed to allocate file descriptor number", 0x29uLL, 1uLL, __stderrp);
LABEL_13:
  uint64_t v7 = 0xFFFFFFFFLL;
LABEL_14:
  pthread_mutex_unlock(&stru_100028B58);
  pthread_mutex_unlock(&stru_100028B18);
  if (v6) {
    CFRelease(v6);
  }
  return v7;
}

uint64_t ramrod_remove_log_fd(int a1)
{
  pthread_mutex_lock(&stru_100028B58);
  uint64_t v2 = sub_100014508(a1);
  pthread_mutex_unlock(&stru_100028B58);
  return v2;
}

uint64_t sub_100014508(int a1)
{
  int valuePtr = a1;
  memset(&v16, 0, sizeof(v16));
  int v1 = fstat(a1, &v16);
  BOOL v2 = (__int16)v16.st_mode <= -1 && v1 == 0;
  uint64_t v3 = &qword_1000291C0;
  if (v2) {
    uint64_t v3 = &qword_1000291B8;
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
    stat v9 = __stderrp;
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
  pthread_mutex_lock(&stru_100028B58);
  if (a1 && xmmword_1000291B8 != 0)
  {
    *(void *)&long long context = a1;
    *((void *)&context + 1) = a2;
    theArray[0] = 0;
    LOBYTE(theArray[1]) = 0;
    if (*((void *)&xmmword_1000291B8 + 1)) {
      CFSetApplyFunction(*((CFSetRef *)&xmmword_1000291B8 + 1), (CFSetApplierFunction)sub_1000147A4, &context);
    }
    qword_1000291C8 += a2;
    if (qword_1000291C8)
    {
      LOBYTE(theArray[1]) = 1;
      qword_1000291C8 = 0;
    }
    if ((void)xmmword_1000291B8) {
      CFSetApplyFunction((CFSetRef)xmmword_1000291B8, (CFSetApplierFunction)sub_1000147A4, &context);
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
            sub_100014508(valuePtr);
          }
          else {
            fwrite("Failed to convert CFNumberRef into int value\n", 0x2DuLL, 1uLL, __stderrp);
          }
        }
      }
      CFRelease(theArray[0]);
    }
  }
  pthread_mutex_unlock(&stru_100028B58);
  return 0;
}

void sub_1000147A4(const void *a1, uint64_t a2)
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
            CFMutableDictionaryRef Mutable = *(__CFArray **)(a2 + 16);
            if (!Mutable)
            {
              CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
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
  off_1000291D0 = result;
  return result;
}

uint64_t ramrod_set_syslog_flush_msgs(uint64_t result)
{
  byte_100028B98 = result;
  return result;
}

unsigned char *ramrod_copy_log_buffer()
{
  pthread_mutex_lock(&stru_100028B18);
  io_object_t v0 = (const void *)qword_1000291B0;
  if (qword_1000291B0)
  {
    int v1 = malloc(0x100000uLL);
    if (v1)
    {
      uint64_t v2 = qword_1000291A8;
      uint64_t v3 = (v0 - qword_1000291A0) & 0xFFFFF;
      if (((v0 - qword_1000291A0) & 0xFFFFF) != 0) {
        __memcpy_chk();
      }
      if ((const void *)v2 != v0) {
        memcpy(&v1[v3], v0, v2 - (void)v0);
      }
      v1[v3 + v2 - (void)v0] = 0;
    }
  }
  else
  {
    int v1 = 0;
  }
  pthread_mutex_unlock(&stru_100028B18);
  return v1;
}

void ramrod_log_msg_noecho(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_1000149F0(int a1, const char *a2, va_list a3)
{
  if (byte_100028B98)
  {
    if (qword_1000291E0 != -1) {
      dispatch_once(&qword_1000291E0, &stru_100025170);
    }
    if (qword_1000291D8)
    {
      pthread_mutex_lock(&stru_100028BA0);
      size_t last = 0;
      asl_object_t v6 = asl_match((asl_object_t)qword_1000291D8, 0, &last, qword_1000291E8, 0x100uLL, 0, 1);
      if (v6)
      {
        size_t v7 = v6;
        do
        {
          qword_1000291E8 = last + 1;
          while (1)
          {
            uint64_t v8 = asl_next(v7);
            if (!v8) {
              break;
            }
            stat v9 = asl_format(v8, "std", "lcl", 1u);
            if (v9)
            {
              stat v16 = v9;
              sub_100014EF8(a1, "SYSLOG: %s", v10, v11, v12, v13, v14, v15, (char)v9);
              free(v16);
            }
          }
          asl_close(v7);
          size_t v7 = asl_match((asl_object_t)qword_1000291D8, 0, &last, qword_1000291E8, 0x100uLL, 0, 1);
        }
        while (v7);
      }
      pthread_mutex_unlock(&stru_100028BA0);
    }
  }
  sub_100014D0C(a1, a2, a3);
}

uint64_t ramrod_log_set_buffermsgs(uint64_t result)
{
  byte_100028B99 = result;
  return result;
}

void ramrod_log_msg(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void ramrod_log_msgv(const char *a1, va_list a2)
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
  CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
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

void ramrod_message_error(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_100014D0C(int a1, const char *a2, va_list a3)
{
  __s = 0;
  if (vasprintf(&__s, a2, a3) != -1)
  {
    pthread_mutex_lock(&stru_100028B18);
    if (a1 == 1)
    {
      fputs(__s, __stdoutp);
      if (off_1000291D0) {
        off_1000291D0(__s);
      }
    }
    size_t v4 = strlen(__s);
    ramrod_log_msg_to_all_fds((uint64_t)__s, v4);
    if (!byte_100028B99) {
      goto LABEL_23;
    }
    uint64_t v5 = (char *)qword_1000291B0;
    if (!qword_1000291B0)
    {
      uint64_t v5 = (char *)malloc(0x100000uLL);
      qword_1000291B0 = (uint64_t)v5;
      if (!v5)
      {
        fprintf(__stderrp, "unable to allocate %lu bytes for log buffer\n", 0x100000);
LABEL_23:
        pthread_mutex_unlock(&stru_100028B18);
        goto LABEL_24;
      }
      qword_1000291A0 = (uint64_t)v5;
      qword_1000291A8 = (uint64_t)v5;
    }
    char v6 = *__s;
    if (*__s)
    {
      uint64_t v7 = v5 + 0x100000;
      uint64_t v8 = (char *)qword_1000291A8;
      uint64_t v9 = qword_1000291A0;
      uint64_t v10 = __s + 1;
      do
      {
        char *v8 = v6;
        if (v8 + 1 == v7) {
          uint64_t v8 = v5;
        }
        else {
          ++v8;
        }
        qword_1000291A8 = (uint64_t)v8;
        if ((char *)v9 == v8)
        {
          if (v8 + 1 == v7) {
            uint64_t v9 = (uint64_t)v5;
          }
          else {
            uint64_t v9 = (uint64_t)(v8 + 1);
          }
          qword_1000291A0 = v9;
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

void sub_100014E88(id a1)
{
  CFStringRef v1 = asl_open_path(0, 0);
  if (v1)
  {
    asl_close(v1);
    uint64_t v8 = "asl_open_path() succeeded - syslogd polling not needed";
  }
  else
  {
    asl_object_t v9 = asl_open(0, 0, 4u);
    if (v9)
    {
      qword_1000291D8 = (uint64_t)v9;
      return;
    }
    uint64_t v8 = "asl_open() returned NULL - disabling syslogd polling";
  }

  sub_100014EF8(1, v8, v2, v3, v4, v5, v6, v7, v11);
}

void sub_100014EF8(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

uint64_t ramrod_load_png(const char *a1, void *a2, void *a3, void *a4)
{
  char v7 = (char)a1;
  memset(&v55, 0, sizeof(v55));
  unint64_t v53 = 0;
  unint64_t v54 = 0;
  __p = 0;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  int v8 = open(a1, 0);
  int v9 = v8;
  if (v8 < 0)
  {
    CFIndex v20 = __error();
    strerror(*v20);
    ramrod_log_msg("unable to open image '%s': %s\n", v21, v22, v23, v24, v25, v26, v27, v7);
    return 0;
  }
  if (fstat(v8, &v55))
  {
    uint64_t v10 = __error();
    strerror(*v10);
    uint64_t v18 = "unable to stat image '%s': %s\n";
LABEL_4:
    ramrod_log_msg(v18, v11, v12, v13, v14, v15, v16, v17, v7);
    uint64_t v19 = 0;
    goto LABEL_14;
  }
  st_size_t size = v55.st_size;
  uint64_t v29 = (unsigned __int8 *)mmap(0, v55.st_size, 1, 2, v9, 0);
  if (v29 == (unsigned __int8 *)-1)
  {
    unsigned int v37 = __error();
    strerror(*v37);
    uint64_t v18 = "unable to mmap image '%s': %s\n";
    goto LABEL_4;
  }
  if (picoPNG::decodePNG((uint64_t)&__p, &v54, &v53, v29, st_size, 1))
  {
    ramrod_log_msg("unable to decode image '%s'\n", v30, v31, v32, v33, v34, v35, v36, v7);
  }
  else
  {
    BOOL v38 = __p;
    size_t v39 = v51 - (unsigned char *)__p;
    unint64_t v40 = malloc(v51 - (unsigned char *)__p);
    if (v40)
    {
      uint64_t v48 = v40;
      memcpy(v40, v38, v39);
      *a2 = v54;
      *a3 = v53;
      *a4 = v48;
      uint64_t v19 = 1;
      goto LABEL_13;
    }
    ramrod_log_msg("unable to malloc destination image buffer\n", v41, v42, v43, v44, v45, v46, v47, 0);
  }
  uint64_t v19 = 0;
LABEL_13:
  munmap(v29, st_size);
LABEL_14:
  close(v9);
  if (__p)
  {
    uint64_t v51 = __p;
    operator delete(__p);
  }
  return v19;
}

void sub_100015100(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ramrod_create_error_cf(CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_100015148(CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, va_list a6)
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

void ramrod_create_error_internal(CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, char *cStr, ...)
{
  va_start(va, cStr);
  CFStringRef v9 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  sub_100015148(a1, a2, a3, a4, v9, va);
  CFRelease(v9);
}

uint64_t picoPNG::decodePNG(uint64_t a1, unint64_t *a2, unint64_t *a3, unsigned __int8 *a4, unint64_t a5, char a6)
{
  unint64_t v6 = 0;
  long long v111 = 0u;
  long long v109 = 0u;
  *(_OWORD *)v110 = 0u;
  long long v108 = 0u;
  uint64_t v7 = 48;
  unint64_t v8 = 0;
  if (!a4 || !a5) {
    goto LABEL_20;
  }
  if (a5 < 0x1D)
  {
    unint64_t v6 = 0;
    unint64_t v8 = 0;
    uint64_t v7 = 27;
LABEL_20:
    *a2 = v8;
    *a3 = v6;
    return v7;
  }
  if (*a4 != 137
    || a4[1] != 80
    || a4[2] != 78
    || a4[3] != 71
    || a4[4] != 13
    || a4[5] != 10
    || a4[6] != 26
    || a4[7] != 10)
  {
    unint64_t v6 = 0;
    unint64_t v8 = 0;
    uint64_t v7 = 28;
    goto LABEL_20;
  }
  if (a4[12] != 73 || a4[13] != 72 || a4[14] != 68 || a4[15] != 82)
  {
    unint64_t v6 = 0;
    unint64_t v8 = 0;
    uint64_t v7 = 29;
    goto LABEL_20;
  }
  uint64_t v10 = a2;
  uint64_t v11 = a3;
  unint64_t v8 = bswap32(*((_DWORD *)a4 + 4));
  unint64_t v6 = bswap32(*((_DWORD *)a4 + 5));
  unint64_t v101 = v8;
  unint64_t v102 = v6;
  unint64_t v12 = a4[24];
  uint64_t v13 = a4[25];
  unint64_t v103 = v13;
  unint64_t v104 = v12;
  if ((unint64_t)a4[26])
  {
    uint64_t v7 = 32;
LABEL_27:
    a2 = v10;
    goto LABEL_20;
  }
  if ((unint64_t)a4[27])
  {
    uint64_t v7 = 33;
    goto LABEL_27;
  }
  unint64_t v107 = a4[28];
  if (v107 > 1)
  {
    uint64_t v7 = 34;
    goto LABEL_27;
  }
  uint64_t v7 = sub_100017304(v13, v12);
  DWORD2(v111) = v7;
  a3 = v11;
  a2 = v10;
  if (v7) {
    goto LABEL_20;
  }
  v121 = 0;
  __int dst = 0;
  uint64_t v123 = 0;
  BYTE8(v109) = 0;
  if (a5 < 0x2A)
  {
LABEL_73:
    int v33 = 30;
LABEL_130:
    DWORD2(v111) = v33;
    goto LABEL_131;
  }
  uint64_t v17 = 33;
  uint64_t v18 = 41;
  while (1)
  {
    int64_t v19 = bswap32(*(_DWORD *)&a4[v17]);
    if ((v19 & 0x80000000) != 0) {
      goto LABEL_129;
    }
    unint64_t v20 = v17 + 4 + v19;
    if (v20 >= a5)
    {
      int v33 = 35;
      goto LABEL_130;
    }
    int v21 = a4[v17 + 4];
    if (v21 != 116) {
      break;
    }
    if (a4[v17 + 5] != 82 || a4[v17 + 6] != 78 || a4[v17 + 7] != 83) {
      goto LABEL_57;
    }
    if (v103)
    {
      if (v103 != 2)
      {
        if (v103 != 3)
        {
          int v33 = 42;
          goto LABEL_130;
        }
        uint64_t v26 = 4 * v19;
        if ((void *)(4 * v19) > (void *)((char *)v110[1] - (char *)v110[0]))
        {
          int v33 = 39;
          goto LABEL_130;
        }
        if (v19)
        {
          uint64_t v27 = 0;
          do
          {
            uint64_t v28 = v18 + 1;
            *((unsigned char *)v110[0] + v27 + 3) = a4[v18];
            v27 += 4;
            ++v18;
          }
          while (v26 != v27);
          goto LABEL_67;
        }
        goto LABEL_66;
      }
      if (v19 != 6)
      {
        int v33 = 41;
        goto LABEL_130;
      }
      uint64_t v31 = a4[v18];
      BYTE8(v109) = 1;
      uint64_t v32 = __rev16(*(unsigned __int16 *)&a4[v17 + 10]);
      *(void *)&long long v108 = a4[v17 + 9] | (unint64_t)(v31 << 8);
      *((void *)&v108 + 1) = v32;
      *(void *)&long long v109 = __rev16(*(unsigned __int16 *)&a4[v17 + 12]);
      uint64_t v28 = v17 + 14;
    }
    else
    {
      if (v19 != 2)
      {
        int v33 = 40;
        goto LABEL_130;
      }
      BYTE8(v109) = 1;
      *((void *)&v108 + 1) = a4[v17 + 9] | ((unint64_t)a4[v18] << 8);
      *(void *)&long long v109 = *((void *)&v108 + 1);
      *(void *)&long long v108 = *((void *)&v108 + 1);
      uint64_t v28 = v17 + 10;
    }
LABEL_67:
    uint64_t v17 = v28 + 4;
    uint64_t v18 = v28 + 12;
    if (v28 + 12 >= a5) {
      goto LABEL_73;
    }
  }
  if (v21 == 80)
  {
    if (a4[v17 + 5] != 76 || a4[v17 + 6] != 84 || a4[v17 + 7] != 69) {
      goto LABEL_80;
    }
    unint64_t v23 = ((2863311531u * (unint64_t)v19) >> 31) & 0x1FFFFFFFCLL;
    uint64_t v25 = v110[0];
    uint64_t v24 = (char *)v110[1];
    if (v23 <= (char *)v110[1] - (char *)v110[0])
    {
      if (v23 < (char *)v110[1] - (char *)v110[0])
      {
        uint64_t v24 = (char *)v110[0] + v23;
        v110[1] = (char *)v110[0] + v23;
      }
    }
    else
    {
      sub_100017670((unint64_t *)v110, v23 - ((char *)v110[1] - (char *)v110[0]));
      uint64_t v25 = v110[0];
      uint64_t v24 = (char *)v110[1];
    }
    if ((unint64_t)(v24 - v25) > 0x400)
    {
      int v33 = 38;
      goto LABEL_130;
    }
    if (v24 != v25)
    {
      unint64_t v29 = 0;
      do
      {
        for (uint64_t i = 0; i != 3; ++i)
          *((unsigned char *)v110[0] + v29 + i) = a4[v18 + i];
        *((unsigned char *)v110[0] + (v29 | 3)) = -1;
        v29 += 4;
        v18 += 3;
      }
      while (v29 < (char *)v110[1] - (char *)v110[0]);
    }
LABEL_66:
    uint64_t v28 = v18;
    goto LABEL_67;
  }
  if (v21 != 73)
  {
    if ((v21 & 0x20) == 0) {
      goto LABEL_80;
    }
LABEL_57:
    uint64_t v28 = v20 + 4;
    goto LABEL_67;
  }
  int v22 = a4[v17 + 5];
  if (v22 == 68)
  {
    if (a4[v17 + 6] != 65 || a4[v17 + 7] != 84) {
      goto LABEL_80;
    }
    sub_1000173B0((uint64_t)&v121, (char *)__dst, (char *)&a4[v18], (char *)&a4[v18 + v19], v19);
    goto LABEL_57;
  }
  if (v22 != 69 || (uint64_t v34 = &a4[v17], v34[6] != 78) || v34[7] != 68)
  {
LABEL_80:
    int v33 = 69;
    goto LABEL_130;
  }
  if (v103 == 2)
  {
    unint64_t v35 = 3 * v104;
  }
  else if (v103 < 4)
  {
    unint64_t v35 = v104;
  }
  else
  {
    unint64_t v35 = v104 * (v103 - 2);
  }
  if (v35 < 8) {
    uint64_t v36 = 1;
  }
  else {
    uint64_t v36 = v35 >> 3;
  }
  if (!v102 || !v101 || (v101 | v102) >= 0x10000)
  {
LABEL_129:
    int v33 = 63;
    goto LABEL_130;
  }
  v118 = 0;
  v119 = 0;
  uint64_t v120 = 0;
  sub_1000177AC(&v118, (v36 + v36 * v102) * v101);
  unsigned int v37 = v118;
  if (v102 + 1 == (v119 - (unsigned char *)v118) / (v101 * v36))
  {
    DWORD2(v111) = sub_100015F78((unint64_t *)&v118, (unsigned __int8 **)&v121);
    if (!DWORD2(v111))
    {
      unint64_t v96 = (v101 * v35 + 7) >> 3;
      sub_100015F50((unint64_t *)a1, v96 * v102);
      if (v102 == (*(void *)(a1 + 8) - *(void *)a1) / v96)
      {
        unint64_t v99 = (v35 + 7) >> 3;
        if (v96 * v102) {
          unint64_t v38 = *(void *)a1;
        }
        else {
          unint64_t v38 = 0;
        }
        if (v107)
        {
          uint64_t v39 = 0;
          uint64_t v40 = 0;
          unint64_t v41 = v101;
          uint64x2_t v131 = vshlq_u64((uint64x2_t)vdupq_n_s64(v101 + 3), (uint64x2_t)xmmword_1000230D0);
          uint64x2_t v132 = vshlq_u64((uint64x2_t)vdupq_n_s64(v101 + 1), (uint64x2_t)xmmword_1000230E0);
          unint64_t v133 = v101 >> 1;
          unint64_t v134 = v101;
          v126[0] = (v102 + 7) >> 3;
          v126[1] = v126[0];
          uint64x2_t v127 = vshlq_u64((uint64x2_t)vdupq_n_s64(v102 + 3), (uint64x2_t)xmmword_1000230D0);
          uint64x2_t v128 = vshlq_u64((uint64x2_t)vdupq_n_s64(v102 + 1), (uint64x2_t)xmmword_1000230E0);
          unint64_t v129 = v102 >> 1;
          v130 = (unsigned __int8 *)((v101 + 7) >> 3);
          uint64_t v125 = 0;
          memset(v124, 0, sizeof(v124));
          do
          {
            uint64_t v42 = (&v130)[v39];
            BOOL v43 = v42 == 0;
            unint64_t v44 = ((unint64_t)v42 * v35 + 7) >> 3;
            if (!v43) {
              ++v44;
            }
            v40 += v44 * v126[v39];
            v124[++v39] = v40;
          }
          while (v39 != 6);
          v115 = 0;
          v116 = 0;
          uint64_t v117 = 0;
          sub_1000177AC(&v115, (v41 * v35 + 7) >> 3);
          __p = 0;
          v113 = 0;
          uint64_t v114 = 0;
          sub_1000177AC(&__p, (v101 * v35 + 7) >> 3);
          uint64_t v87 = 0;
          if (v99 <= 1) {
            unint64_t v45 = 1;
          }
          else {
            unint64_t v45 = (v35 + 7) >> 3;
          }
          do
          {
            uint64_t v46 = (&v130)[v87];
            if (v46)
            {
              uint64_t v91 = v126[v87];
              if (v91)
              {
                uint64_t v47 = (char *)__p;
                v93 = (unsigned __int8 *)v115;
                uint64_t v94 = 0;
                v90 = (char *)v118 + v124[v87];
                uint64_t v48 = (uint64_t *)((char *)&unk_100023558 + 8 * v87);
                uint64_t v84 = v101 * v35;
                uint64_t v85 = v48[21];
                unint64_t v89 = (v101 * v35 + 7) >> 3;
                uint64_t v95 = v48[14];
                uint64_t v97 = *v48;
                uint64_t v86 = v48[7];
                unint64_t v92 = v38 + v99 * (*v48 + v86 * v101);
                uint64_t v88 = v99 * v85 * v101;
                do
                {
                  uint64_t v49 = v47;
                  uint64_t v50 = &v90[v94 * ((((unint64_t)v46 * v35 + 7) >> 3) + 1)];
                  unsigned int v53 = *v50;
                  uint64_t v51 = v50 + 1;
                  uint64_t v52 = v53;
                  if (v94) {
                    unint64_t v54 = v93;
                  }
                  else {
                    unint64_t v54 = 0;
                  }
                  sub_100016A8C((uint64_t)&v101, v47, v51, v54, v99, v52, v89);
                  if (DWORD2(v111)) {
                    break;
                  }
                  if (v35 <= 7)
                  {
                    for (uint64_t j = 0; j != v46; ++j)
                    {
                      if (v35)
                      {
                        unint64_t v63 = (void)j * v35;
                        unint64_t v64 = (v86 + v94 * v85) * v84 + (v97 + (void)j * v95) * v35;
                        unint64_t v65 = v35;
                        do
                        {
                          int v66 = (v49[v63 >> 3] >> (~(_BYTE)v63 & 7)) & 1;
                          ++v63;
                          *(unsigned char *)(v38 + (v64 >> 3)) |= (_BYTE)v66 << (~(_BYTE)v64 & 7);
                          ++v64;
                          --v65;
                        }
                        while (v65);
                      }
                    }
                  }
                  else
                  {
                    stat v55 = 0;
                    char v56 = v49;
                    char v57 = (unsigned char *)v92;
                    do
                    {
                      char v58 = v56;
                      char v59 = v57;
                      unint64_t v60 = v45;
                      if (v35 + 7 >= 8)
                      {
                        do
                        {
                          char v61 = *v58++;
                          *v59++ = v61;
                          --v60;
                        }
                        while (v60);
                      }
                      ++v55;
                      v57 += v99 * v95;
                      v56 += v99;
                    }
                    while (v55 != v46);
                  }
                  v92 += v88;
                  uint64_t v47 = (char *)v93;
                  v93 = (unsigned __int8 *)v49;
                  ++v94;
                }
                while (v94 != v91);
              }
            }
            ++v87;
          }
          while (v87 != 7);
          if (__p)
          {
            v113 = __p;
            operator delete(__p);
          }
          if (v115)
          {
            v116 = v115;
            operator delete(v115);
          }
          goto LABEL_166;
        }
        size_t v98 = (v101 * v35 + 7) >> 3;
        if (v35 < 8)
        {
          v130 = 0;
          uint64x2_t v131 = 0uLL;
          sub_1000177AC(&v130, v98);
          uint64_t v74 = 0;
          uint64_t v75 = 0;
          uint64_t v76 = 0;
          while (1)
          {
            uint64_t v77 = v74 ? (unsigned __int8 *)(v38 + (v74 - 1) * v96) : 0;
            sub_100016A8C((uint64_t)&v101, v130, (char *)v118 + v75 + 1, v77, v99, *((unsigned __int8 *)v118 + v75), v98);
            BOOL v78 = DWORD2(v111) != 0;
            if (DWORD2(v111)) {
              break;
            }
            if (v101 * v35)
            {
              unint64_t v79 = 0;
              do
              {
                unint64_t v80 = v76 + v79;
                char v81 = ~(v76 + v79);
                int v82 = (v130[v79 >> 3] >> (~(_BYTE)v79 & 7)) & 1;
                ++v79;
                *(unsigned char *)(v38 + (v80 >> 3)) |= (_BYTE)v82 << (v81 & 7);
              }
              while (v79 < v101 * v35);
              v76 += v79;
            }
            v75 += v98 + 1;
            if (++v74 >= v102)
            {
              int v83 = 0;
              goto LABEL_161;
            }
          }
          int v83 = 1;
LABEL_161:
          if (v130)
          {
            v131.i64[0] = (uint64_t)v130;
            operator delete(v130);
          }
          if (!v78) {
LABEL_164:
          }
            int v83 = 0;
          if (!v83)
          {
LABEL_166:
            if ((a6 & 1) != 0 && (v103 != 6 || v104 != 8))
            {
              v130 = 0;
              uint64x2_t v131 = 0uLL;
              sub_100017EB4(&v130, *(const void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 8) - *(void *)a1);
              DWORD2(v111) = sub_100016D30((unint64_t *)a1, v130, (uint64_t)&v101, v101, v102);
              if (v130)
              {
                v131.i64[0] = (uint64_t)v130;
                operator delete(v130);
              }
            }
          }
        }
        else
        {
          uint64_t v69 = 0;
          unint64_t v70 = 0;
          uint64_t v71 = -(uint64_t)v99;
          uint64_t v72 = (unsigned char *)v38;
          while (1)
          {
            int v73 = v70 ? (unsigned __int8 *)(v38 + v71 * v101) : 0;
            sub_100016A8C((uint64_t)&v101, v72, (char *)v118 + v69 + 1, v73, v99, *((unsigned __int8 *)v118 + v69), v98);
            if (DWORD2(v111)) {
              break;
            }
            ++v70;
            v72 += v98;
            v71 += v99;
            v69 += v98 + 1;
            if (v70 >= v102) {
              goto LABEL_164;
            }
          }
        }
      }
      else
      {
        DWORD2(v111) = 63;
      }
    }
    unsigned int v37 = v118;
  }
  else
  {
    DWORD2(v111) = 63;
  }
  if (v37)
  {
    v119 = v37;
    operator delete(v37);
  }
LABEL_131:
  if (v121)
  {
    __int dst = v121;
    operator delete(v121);
  }
  unint64_t v67 = v102;
  uint64_t v7 = DWORD2(v111);
  char v68 = v110[0];
  unint64_t *v10 = v101;
  unint64_t *v11 = v67;
  if (v68)
  {
    v110[1] = v68;
    operator delete(v68);
  }
  return v7;
}

void sub_100015EC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *__p,uint64_t a50,uint64_t a51,void *a52,uint64_t a53)
{
  if (__p) {
    operator delete(__p);
  }
  if (a52) {
    operator delete(a52);
  }
  if (a39) {
    operator delete(a39);
  }
  _Unwind_Resume(exception_object);
}

void sub_100015F50(unint64_t *a1, unint64_t a2)
{
  unint64_t v2 = a1[1] - *a1;
  BOOL v3 = a2 >= v2;
  size_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_100017670(a1, v4);
  }
  else if (!v3)
  {
    a1[1] = *a1 + a2;
  }
}

uint64_t sub_100015F78(unint64_t *a1, unsigned __int8 **a2)
{
  *(_OWORD *)unint64_t v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  *(_OWORD *)unint64_t v102 = 0u;
  *(_OWORD *)v100 = 0u;
  unint64_t v2 = *a2;
  if ((unint64_t)(a2[1] - *a2) < 2)
  {
    uint64_t v3 = 53;
    goto LABEL_176;
  }
  int v4 = *v2;
  __int16 v5 = v2[1];
  if ((unsigned __int16)(31711 * (v5 | ((_WORD)v4 << 8))) > 0x842u)
  {
    uint64_t v3 = 24;
    goto LABEL_176;
  }
  if ((v4 & 0xFFFFFF8F) != 8)
  {
    uint64_t v3 = 25;
    goto LABEL_176;
  }
  if ((v5 & 0x20) != 0)
  {
    uint64_t v3 = 26;
    goto LABEL_176;
  }
  unint64_t v7 = 0;
  unint64_t v105 = 0;
  LODWORD(v100[0]) = 0;
  unint64_t v99 = a2;
  do
  {
    uint64_t v3 = LODWORD(v100[0]);
    if (LODWORD(v100[0])) {
      goto LABEL_174;
    }
    unint64_t v8 = v105;
    CFStringRef v9 = *a2;
    unint64_t v10 = a2[1] - *a2;
    if (v105 >> 3 >= v10)
    {
      uint64_t v3 = 52;
LABEL_173:
      LODWORD(v100[0]) = v3;
      goto LABEL_174;
    }
    uint64_t v11 = (uint64_t)(v9 + 2);
    unsigned int v12 = v9[(v105 >> 3) + 2];
    int v13 = (v9[((v105 + 1) >> 3) + 2] >> ((v105 + 1) & 7)) & 1;
    int v14 = v9[((v105 + 2) >> 3) + 2] >> ((v105 + 2) & 7);
    unint64_t v15 = v105 + 3;
    v105 += 3;
    uint64_t v16 = v13 & 0xFFFFFFFD | (2 * (v14 & 1));
    if (v16 == 3)
    {
      uint64_t v3 = 20;
      goto LABEL_173;
    }
    if (v16 == 2)
    {
      unsigned int v98 = v12;
      v112 = 0;
      v113 = 0;
      uint64_t v114 = 0;
      uint64_t v109 = 0;
      sub_100017BE8(&v112, 0x120uLL, &v109);
      uint64_t v109 = 0;
      uint64_t v110 = 0;
      uint64_t v111 = 0;
      __p = 0;
      sub_100017BE8(&v109, 0x20uLL, &__p);
      if (v10 - 2 <= v15 >> 3)
      {
        LODWORD(v100[0]) = 49;
        goto LABEL_118;
      }
      uint64_t v25 = 0;
      for (uint64_t i = 3; i != 8; ++i)
      {
        uint64_t v27 = v25;
        unint64_t v28 = (unint64_t)((*(unsigned __int8 *)(v11 + ((v8 + i) >> 3)) >> ((v8 + i) & 7)) & 1) << (i - 3);
        v25 += v28;
      }
      uint64_t v29 = 0;
      do
      {
        v29 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v8 + i) >> 3)) >> ((v8 + i) & 7)) & 1) << (i - 8);
        ++i;
      }
      while (i != 13);
      uint64_t v30 = 0;
      do
      {
        v30 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v8 + i) >> 3)) >> ((v8 + i) & 7)) & 1) << (i - 13);
        ++i;
      }
      while (i != 17);
      __p = 0;
      unint64_t v107 = 0;
      uint64_t v108 = 0;
      sub_100017D18(&__p, 0x13uLL);
      unint64_t v31 = 0;
      unint64_t v97 = v25 + 257;
      unint64_t v32 = v30 + 4;
      unint64_t v33 = v8 + 17;
      uint64_t v34 = __p;
      unsigned int v12 = v98;
      do
      {
        if (v31 >= v32)
        {
          uint64_t v36 = 0;
        }
        else
        {
          uint64_t v35 = 0;
          uint64_t v36 = 0;
          do
          {
            v36 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v33 + v35) >> 3)) >> ((v33 + v35) & 7)) & 1) << v35;
            ++v35;
          }
          while (v35 != 3);
          v33 += 3;
        }
        v34[qword_1000234C0[v31++]] = v36;
      }
      while (v31 != 19);
      unint64_t v105 = v33;
      LODWORD(v100[0]) = sub_100017944(&v103[1], (uint64_t **)&__p, 7);
      if (!LODWORD(v100[0]))
      {
        uint64_t v95 = v112;
        unint64_t v96 = v25 + v29 + 258;
        if (v25 + v29 != -258)
        {
          unint64_t v37 = 0;
          uint64_t v38 = v27 + v28;
          uint64_t v39 = v109;
          uint64_t v40 = -8 * v38;
          do
          {
            unint64_t v41 = sub_1000178B8((int *)v100, v11, &v105, (uint64_t *)&v103[1], v10);
            if (LODWORD(v100[0])) {
              goto LABEL_116;
            }
            if (v41 > 0xF)
            {
              switch(v41)
              {
                case 0x12uLL:
                  if (v10 <= v105 >> 3) {
                    goto LABEL_112;
                  }
                  uint64_t v55 = 0;
                  uint64_t v56 = 0;
                  do
                  {
                    v56 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v105 + v55) >> 3)) >> ((v105 + v55) & 7)) & 1) << v55;
                    ++v55;
                  }
                  while (v55 != 7);
                  v105 += 7;
                  uint64_t v57 = v56 + 11;
                  if (v56 != -11)
                  {
                    unint64_t v58 = v96 - v37;
                    if (v96 < v37) {
                      unint64_t v58 = 0;
                    }
                    char v59 = (uint64_t *)(v109 + v40 + 8 * v37 - 2056);
                    unint64_t v60 = &v112[v37];
                    while (v58)
                    {
                      if (v37 >= v97) {
                        char v61 = v59;
                      }
                      else {
                        char v61 = v60;
                      }
                      *char v61 = 0;
                      ++v37;
                      --v58;
                      ++v59;
                      ++v60;
                      if (!--v57) {
                        goto LABEL_48;
                      }
                    }
                    int v70 = 15;
                    goto LABEL_115;
                  }
                  break;
                case 0x11uLL:
                  if (v10 <= v105 >> 3)
                  {
LABEL_112:
                    int v70 = 50;
                    goto LABEL_115;
                  }
                  uint64_t v62 = 0;
                  uint64_t v63 = 0;
                  do
                  {
                    v63 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v105 + v62) >> 3)) >> ((v105 + v62) & 7)) & 1) << v62;
                    ++v62;
                  }
                  while (v62 != 3);
                  v105 += 3;
                  uint64_t v64 = v63 + 3;
                  if (v63 != -3)
                  {
                    unint64_t v65 = v96 - v37;
                    if (v96 < v37) {
                      unint64_t v65 = 0;
                    }
                    int v66 = (uint64_t *)(v109 + v40 + 8 * v37 - 2056);
                    unint64_t v67 = &v112[v37];
                    while (v65)
                    {
                      if (v37 >= v97) {
                        char v68 = v66;
                      }
                      else {
                        char v68 = v67;
                      }
                      *char v68 = 0;
                      ++v37;
                      --v65;
                      ++v66;
                      ++v67;
                      if (!--v64) {
                        goto LABEL_48;
                      }
                    }
                    int v70 = 14;
                    goto LABEL_115;
                  }
                  break;
                case 0x10uLL:
                  if (v10 <= v105 >> 3) {
                    goto LABEL_112;
                  }
                  if (!v37)
                  {
                    int v70 = 54;
                    goto LABEL_115;
                  }
                  uint64_t v46 = 0;
                  uint64_t v47 = 0;
                  do
                  {
                    v47 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v105 + v46) >> 3)) >> ((v105 + v46) & 7)) & 1) << v46;
                    ++v46;
                  }
                  while (v46 != 2);
                  v105 += 2;
                  if (v37 - 1 >= v97) {
                    uint64_t v48 = (uint64_t *)(v109 + 8 * (v37 - v25) - 2064);
                  }
                  else {
                    uint64_t v48 = &v112[v37 - 1];
                  }
                  uint64_t v49 = v47 + 3;
                  if (v49)
                  {
                    uint64_t v50 = *v48;
                    unint64_t v51 = v96 - v37;
                    if (v96 < v37) {
                      unint64_t v51 = 0;
                    }
                    uint64_t v52 = (uint64_t *)(v109 + v40 + 8 * v37 - 2056);
                    unsigned int v53 = &v112[v37];
                    while (v51)
                    {
                      if (v37 >= v97) {
                        unint64_t v54 = v52;
                      }
                      else {
                        unint64_t v54 = v53;
                      }
                      *unint64_t v54 = v50;
                      ++v37;
                      --v51;
                      ++v52;
                      ++v53;
                      if (!--v49) {
                        goto LABEL_48;
                      }
                    }
                    int v70 = 13;
                    goto LABEL_115;
                  }
                  break;
                default:
                  int v70 = 16;
                  goto LABEL_115;
              }
            }
            else
            {
              BOOL v42 = v37 >= v97;
              unint64_t v43 = v37 - v97;
              unint64_t v44 = &v95[v37++];
              unint64_t v45 = (unint64_t *)(v39 + 8 * v43);
              if (!v42) {
                unint64_t v45 = (unint64_t *)v44;
              }
              unint64_t *v45 = v41;
            }
LABEL_48:
            ;
          }
          while (v37 < v96);
        }
        if (v95[256])
        {
          LODWORD(v100[0]) = sub_100017944(&v100[1], &v112, 15);
          if (LODWORD(v100[0])) {
            goto LABEL_116;
          }
          int v70 = sub_100017944(v102, (uint64_t **)&v109, 15);
        }
        else
        {
          int v70 = 64;
        }
LABEL_115:
        LODWORD(v100[0]) = v70;
      }
LABEL_116:
      if (__p)
      {
        unint64_t v107 = __p;
        operator delete(__p);
      }
LABEL_118:
      if (v109)
      {
        uint64_t v110 = v109;
        operator delete((void *)v109);
      }
      if (v112)
      {
        v113 = v112;
        operator delete(v112);
      }
      if (!LODWORD(v100[0]))
      {
        while (1)
        {
          do
          {
            while (1)
            {
LABEL_123:
              unint64_t v71 = sub_1000178B8((int *)v100, v11, &v105, (uint64_t *)&v100[1], v10);
              if (LODWORD(v100[0])) {
                goto LABEL_165;
              }
              char v72 = v71;
              if (v71 == 256) {
                goto LABEL_165;
              }
              if (v71 > 0xFF) {
                break;
              }
              unint64_t v73 = *a1;
              unint64_t v74 = a1[1] - *a1;
              if (v7 >= v74)
              {
                unint64_t v75 = 2 * v7 + 2;
                if (v75 <= v74)
                {
                  if (v75 < v74) {
                    a1[1] = v73 + v75;
                  }
                }
                else
                {
                  sub_100017670(a1, v75 - v74);
                  unint64_t v73 = *a1;
                }
              }
              *(unsigned char *)(v73 + v7++) = v72;
            }
          }
          while (v71 > 0x11D);
          if (v10 <= v105 >> 3) {
            goto LABEL_161;
          }
          uint64_t v76 = 8 * v71 - 2056;
          if (v71 - 285 >= 0xFFFFFFFFFFFFFFECLL)
          {
            uint64_t v78 = 0;
            uint64_t v77 = 0;
            uint64_t v79 = *(void *)((char *)&unk_1000231F8 + v76);
            do
            {
              v77 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v105 + v78) >> 3)) >> ((v105 + v78) & 7)) & 1) << v78;
              ++v78;
            }
            while (v79 != v78);
            v105 += v79;
          }
          else
          {
            uint64_t v77 = 0;
          }
          uint64_t v80 = *(void *)((char *)&unk_100023110 + v76);
          unint64_t v81 = sub_1000178B8((int *)v100, v11, &v105, (uint64_t *)v102, v10);
          if (LODWORD(v100[0])) {
            goto LABEL_165;
          }
          if (v81 > 0x1D) {
            break;
          }
          if (v10 <= v105 >> 3)
          {
LABEL_161:
            int v92 = 51;
LABEL_164:
            LODWORD(v100[0]) = v92;
            goto LABEL_165;
          }
          if (v81 >= 4)
          {
            uint64_t v83 = 0;
            uint64_t v82 = 0;
            uint64_t v84 = qword_1000233D0[v81];
            do
            {
              v82 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v105 + v83) >> 3)) >> ((v105 + v83) & 7)) & 1) << v83;
              ++v83;
            }
            while (v84 != v83);
            v105 += v84;
          }
          else
          {
            uint64_t v82 = 0;
          }
          unint64_t v85 = v82 + qword_1000232E0[v81];
          uint64_t v86 = v7 - v85;
          if (v7 < v85)
          {
            int v92 = 52;
            goto LABEL_164;
          }
          uint64_t v87 = v77 + v80;
          unint64_t v88 = a1[1] - *a1;
          if (v87 + v7 >= v88)
          {
            unint64_t v89 = 2 * (v87 + v7);
            if (v89 <= v88)
            {
              if (v89 < v88) {
                a1[1] = *a1 + v89;
              }
            }
            else
            {
              sub_100017670(a1, v89 - v88);
            }
          }
          if (v87)
          {
            uint64_t v90 = 0;
            uint64_t v91 = v86;
            do
            {
              *(unsigned char *)(*a1 + v7 + v90) = *(unsigned char *)(*a1 + v91);
              if (v91 + 1 < v7) {
                ++v91;
              }
              else {
                uint64_t v91 = v86;
              }
              ++v90;
            }
            while (v87 != v90);
            v7 += v90;
          }
        }
        int v92 = 18;
        goto LABEL_164;
      }
      goto LABEL_165;
    }
    if (v16 == 1)
    {
      unsigned int v23 = v12;
      v112 = 0;
      v113 = 0;
      uint64_t v114 = 0;
      uint64_t v109 = 8;
      sub_100017BE8(&v112, 0x120uLL, &v109);
      uint64_t v109 = 0;
      uint64_t v110 = 0;
      uint64_t v111 = 0;
      __p = (void *)5;
      sub_100017BE8(&v109, 0x20uLL, &__p);
      uint64_t v24 = v112;
      memset_pattern16(v112 + 144, &unk_1000230F0, 0x380uLL);
      memset_pattern16(v24 + 256, &unk_100023100, 0xC0uLL);
      sub_100017944(&v100[1], &v112, 15);
      sub_100017944(v102, (uint64_t **)&v109, 15);
      unsigned int v12 = v23;
      if (v109)
      {
        uint64_t v110 = v109;
        operator delete((void *)v109);
      }
      if (v112)
      {
        v113 = v112;
        operator delete(v112);
      }
      goto LABEL_123;
    }
    if (v16) {
      goto LABEL_123;
    }
    unsigned int v17 = v12;
    if ((v15 & 7) != 0)
    {
      unint64_t v15 = (v15 | 7) + 1;
      unint64_t v105 = v15;
    }
    unint64_t v18 = v15 >> 3;
    if (v15 >> 3 >= v10 - 4)
    {
      int v22 = 52;
      goto LABEL_99;
    }
    uint64_t v19 = *(unsigned __int16 *)(v11 + v18);
    if (*(unsigned __int16 *)(v11 + v18 + 2) + v19 != 0xFFFF)
    {
      int v22 = 21;
      goto LABEL_99;
    }
    unint64_t v20 = a1[1] - *a1;
    if (v19 + v7 > v20) {
      sub_100017670(a1, v19 + v7 - v20);
    }
    unint64_t v21 = v18 + 4;
    if (v19 + v18 + 4 > v10)
    {
      int v22 = 23;
LABEL_99:
      LODWORD(v100[0]) = v22;
      unsigned int v12 = v17;
      goto LABEL_165;
    }
    if (v19)
    {
      unint64_t v69 = v18 + 6;
      do
      {
        *(unsigned char *)(*a1 + v7++) = v9[v69++];
        --v19;
      }
      while (v19);
      unint64_t v21 = v69 - 2;
    }
    unsigned int v12 = v17;
    unint64_t v105 = 8 * v21;
LABEL_165:
    a2 = v99;
  }
  while (((v12 >> (v8 & 7)) & 1) == 0);
  uint64_t v3 = LODWORD(v100[0]);
  if (!LODWORD(v100[0]))
  {
    unint64_t v93 = a1[1] - *a1;
    if (v7 <= v93)
    {
      uint64_t v3 = 0;
      if (v7 < v93) {
        a1[1] = *a1 + v7;
      }
    }
    else
    {
      sub_100017670(a1, v7 - v93);
      uint64_t v3 = LODWORD(v100[0]);
    }
  }
LABEL_174:
  if (v103[1])
  {
    *(void **)&long long v104 = v103[1];
    operator delete(v103[1]);
  }
LABEL_176:
  if (v102[0])
  {
    v102[1] = v102[0];
    operator delete(v102[0]);
  }
  if (v100[1])
  {
    *(void **)&long long v101 = v100[1];
    operator delete(v100[1]);
  }
  return v3;
}

void sub_100016A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30)
{
}

uint64_t sub_100016A8C(uint64_t result, unsigned char *a2, char *a3, unsigned __int8 *a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  switch(a6)
  {
    case 0:
      for (; a7; --a7)
      {
        char v7 = *a3++;
        *a2++ = v7;
      }
      break;
    case 1:
      if (a5)
      {
        unint64_t v8 = a3;
        CFStringRef v9 = a2;
        unint64_t v10 = a5;
        do
        {
          char v11 = *v8++;
          *v9++ = v11;
          --v10;
        }
        while (v10);
      }
      if (a5 < a7)
      {
        do
        {
          a2[a5] = *a2 + a3[a5];
          --a7;
          ++a2;
          ++a3;
        }
        while (a5 != a7);
      }
      break;
    case 2:
      if (a4)
      {
        for (; a7; --a7)
        {
          char v13 = *a3++;
          char v12 = v13;
          char v14 = *a4++;
          *a2++ = v14 + v12;
        }
      }
      else
      {
        for (; a7; --a7)
        {
          char v41 = *a3++;
          *a2++ = v41;
        }
      }
      break;
    case 3:
      if (a4)
      {
        if (a5)
        {
          unint64_t v15 = a3;
          uint64_t v16 = a4;
          unsigned int v17 = a2;
          unint64_t v18 = a5;
          do
          {
            char v20 = *v15++;
            char v19 = v20;
            unsigned int v21 = *v16++;
            *v17++ = v19 + (v21 >> 1);
            --v18;
          }
          while (v18);
        }
        if (a5 < a7)
        {
          do
          {
            a2[a5] = a3[a5] + ((a4[a5] + *a2) >> 1);
            --a7;
            ++a2;
            ++a4;
            ++a3;
          }
          while (a5 != a7);
        }
      }
      else
      {
        if (a5)
        {
          BOOL v42 = a3;
          unint64_t v43 = a2;
          unint64_t v44 = a5;
          do
          {
            char v45 = *v42++;
            *v43++ = v45;
            --v44;
          }
          while (v44);
        }
        if (a5 < a7)
        {
          do
          {
            a2[a5] = a3[a5] + (*a2 >> 1);
            --a7;
            ++a2;
            ++a3;
          }
          while (a5 != a7);
        }
      }
      break;
    case 4:
      if (a4)
      {
        if (a5)
        {
          int v22 = a3;
          unsigned int v23 = (char *)a4;
          uint64_t v24 = a2;
          unint64_t v25 = a5;
          do
          {
            char v27 = *v22++;
            char v26 = v27;
            char v28 = *v23++;
            *v24++ = v28 + v26;
            --v25;
          }
          while (v25);
        }
        if (a5 < a7)
        {
          do
          {
            int v29 = *a2;
            int v30 = a4[a5];
            int v32 = *a4++;
            int v31 = v32;
            int v33 = v30 + v29 - v32;
            int v34 = v32 - v30;
            int v35 = v30 - v32;
            if (v33 >= v29 && v30 != v32) {
              int v34 = v35;
            }
            int v36 = v30 - v33;
            if (v33 > v30) {
              int v36 = v33 - v30;
            }
            int v37 = v31 - v33;
            BOOL v38 = __OFSUB__(v33, v31);
            int v39 = v33 - v31;
            if ((v39 < 0) ^ v38 | (v39 == 0)) {
              int v39 = v37;
            }
            if (v36 > v39) {
              LOBYTE(v30) = v31;
            }
            if (v34 > v39 || v34 > v36) {
              LOBYTE(v29) = v30;
            }
            a2[a5] = v29 + a3[a5];
            --a7;
            ++a2;
            ++a3;
          }
          while (a5 != a7);
        }
      }
      else
      {
        if (a5)
        {
          uint64_t v46 = a3;
          uint64_t v47 = a2;
          unint64_t v48 = a5;
          do
          {
            char v49 = *v46++;
            *v47++ = v49;
            --v48;
          }
          while (v48);
        }
        if (a5 < a7)
        {
          do
          {
            a2[a5] = *a2 + a3[a5];
            --a7;
            ++a2;
            ++a3;
          }
          while (a5 != a7);
        }
      }
      break;
    default:
      *(_DWORD *)(result + 112) = 36;
      break;
  }
  return result;
}

uint64_t sub_100016D30(unint64_t *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = a5 * a4;
  unint64_t v9 = 4 * a5 * a4;
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  unint64_t v12 = v11 - *a1;
  if (v9 <= v12)
  {
    if (v9 < v12)
    {
      unint64_t v11 = v10 + v9;
      a1[1] = v10 + v9;
    }
  }
  else
  {
    sub_100017670(a1, v9 - v12);
    unint64_t v10 = *a1;
    unint64_t v11 = a1[1];
  }
  if (v10 == v11) {
    unint64_t v10 = 0;
  }
  uint64_t v13 = *(void *)(a3 + 16);
  unint64_t v14 = *(void *)(a3 + 24);
  if (v14 == 8 && v13 == 0)
  {
    if (v8)
    {
      int v22 = (unsigned char *)(v10 + 3);
      do
      {
        unsigned __int8 v23 = *a2;
        *(v22 - 1) = *a2;
        *(v22 - 2) = v23;
        *(v22 - 3) = v23;
        char v24 = *(unsigned char *)(a3 + 80);
        if (v24) {
          char v24 = *(void *)(a3 + 56) == *a2;
        }
        *int v22 = v24 - 1;
        v22 += 4;
        ++a2;
        --v8;
      }
      while (v8);
    }
    return 0;
  }
  if (v14 == 8 && v13 == 2)
  {
    if (v8)
    {
      uint64_t v16 = 0;
      unsigned int v17 = a2;
      unint64_t v18 = v10;
      do
      {
        for (uint64_t i = 0; i != 3; ++i)
          *(unsigned char *)(v18 + i) = v17[i];
        BOOL v21 = *(unsigned char *)(a3 + 80)
           && *(void *)(a3 + 56) == a2[3 * v16]
           && (char v20 = &a2[3 * v16], *(void *)(a3 + 64) == v20[1])
           && *(void *)(a3 + 72) == v20[2];
        *(unsigned char *)(v10 + ((4 * v16++) | 3)) = v21 - 1;
        v18 += 4;
        v17 += 3;
      }
      while (v16 != v8);
    }
    return 0;
  }
  if (v14 == 8 && v13 == 3)
  {
    if (v8)
    {
      uint64_t v26 = 0;
      while (*(void *)(a3 + 96) - *(void *)(a3 + 88) > 4 * (unint64_t)a2[v26])
      {
        for (uint64_t j = 0; j != 4; ++j)
          *(unsigned char *)(v10 + j) = *(unsigned char *)(*(void *)(a3 + 88) + 4 * a2[v26] + j);
        ++v26;
        v10 += 4;
        if (v26 == v8) {
          return 0;
        }
      }
      return 46;
    }
    return 0;
  }
  if (v14 == 8 && v13 == 4)
  {
    if (v8)
    {
      char v28 = (char *)(a2 + 1);
      int v29 = (unsigned char *)(v10 + 3);
      do
      {
        char v30 = *(v28 - 1);
        *(v29 - 1) = v30;
        *(v29 - 2) = v30;
        *(v29 - 3) = v30;
        char v31 = *v28;
        v28 += 2;
        unsigned char *v29 = v31;
        v29 += 4;
        --v8;
      }
      while (v8);
    }
    return 0;
  }
  if (v14 == 8 && v13 == 6)
  {
    if (v8)
    {
      for (uint64_t k = 0; k != v8; ++k)
      {
        for (uint64_t m = 0; m != 4; ++m)
          *(unsigned char *)(v10 + m) = a2[m];
        uint64_t result = 0;
        v10 += 4;
        a2 += 4;
      }
      return result;
    }
    return 0;
  }
  if (v14 == 16 && !v13)
  {
    if (v8)
    {
      uint64_t v34 = 0;
      do
      {
        unsigned __int8 v35 = a2[2 * v34];
        int v36 = (unsigned __int8 *)(v10 + 4 * v34);
        v36[2] = v35;
        v36[1] = v35;
        unsigned __int8 *v36 = v35;
        if (*(unsigned char *)(a3 + 80))
        {
          uint64_t v37 = v34 + 1;
          BOOL v38 = __rev16(*(unsigned __int16 *)&a2[v34]) == *(void *)(a3 + 56);
        }
        else
        {
          BOOL v38 = 0;
          uint64_t v37 = v34 + 1;
        }
        uint64_t result = 0;
        *(unsigned char *)(v10 + ((4 * v34) | 3)) = v38 - 1;
        uint64_t v34 = v37;
      }
      while (v37 != v8);
      return result;
    }
    return 0;
  }
  if (v14 == 16 && v13 == 2)
  {
    if (v8)
    {
      uint64_t v39 = 0;
      unint64_t v40 = v10;
      char v41 = (char *)a2;
      do
      {
        uint64_t v42 = 0;
        unint64_t v43 = v41;
        do
        {
          char v44 = *v43;
          v43 += 2;
          *(unsigned char *)(v40 + v42++) = v44;
        }
        while (v42 != 3);
        BOOL v46 = *(unsigned char *)(a3 + 80)
           && (a2[(6 * v39) | 1] | ((unint64_t)a2[6 * v39] << 8)) == *(void *)(a3 + 56)
           && (char v45 = &a2[6 * v39], __rev16(*((unsigned __int16 *)v45 + 1)) == *(void *)(a3 + 64))
           && __rev16(*((unsigned __int16 *)v45 + 2)) == *(void *)(a3 + 72);
        uint64_t result = 0;
        *(unsigned char *)(v10 + ((4 * v39++) | 3)) = v46 - 1;
        v41 += 6;
        v40 += 4;
      }
      while (v39 != v8);
      return result;
    }
    return 0;
  }
  if (v14 == 16 && v13 == 4)
  {
    if (v8)
    {
      uint64_t v47 = (unsigned char *)(v10 + 3);
      unint64_t v48 = (char *)(a2 + 2);
      uint64_t result = 0;
      do
      {
        char v49 = *(v48 - 2);
        *(v47 - 1) = v49;
        *(v47 - 2) = v49;
        *(v47 - 3) = v49;
        char v50 = *v48;
        v48 += 4;
        unsigned char *v47 = v50;
        v47 += 4;
        --v8;
      }
      while (v8);
      return result;
    }
    return 0;
  }
  if (v14 == 16 && v13 == 6)
  {
    if (v8)
    {
      for (uint64_t n = 0; n != v8; ++n)
      {
        uint64_t v52 = 0;
        unsigned int v53 = (char *)a2;
        do
        {
          char v54 = *v53;
          v53 += 2;
          *(unsigned char *)(v10 + v52++) = v54;
        }
        while (v52 != 4);
        uint64_t result = 0;
        a2 += 8;
        v10 += 4;
      }
      return result;
    }
    return 0;
  }
  if (v14 <= 7 && !v13)
  {
    if (v8)
    {
      uint64_t v55 = 0;
      unint64_t v56 = 0;
      do
      {
        unint64_t v57 = *(void *)(a3 + 24);
        if (v57)
        {
          uint64_t v58 = 0;
          unint64_t v59 = v57 - 1;
          do
          {
            uint64_t v60 = (a2[v56 >> 3] >> (~(_BYTE)v56 & 7)) & 1;
            ++v56;
            v58 += v60 << v59--;
          }
          while (v59 < v57);
        }
        else
        {
          uint64_t v58 = 0;
        }
        BOOL v61 = 0;
        unint64_t v62 = 255 * v58;
        unint64_t v63 = ~(-1 << v57);
        uint64_t v64 = (unsigned char *)(v10 + 4 * v55);
        v64[2] = v62 / v63;
        v64[1] = v62 / v63;
        unsigned char *v64 = v62 / v63;
        if (*(unsigned char *)(a3 + 80) && v62 >= v63)
        {
          uint64_t v65 = *(unsigned int *)(a3 + 24);
          BOOL v61 = *(void *)(a3 + 56) == ~(-1 << v65) && v65 != 0;
        }
        uint64_t result = 0;
        *(unsigned char *)(v10 + ((4 * v55++) | 3)) = v61 - 1;
      }
      while (v55 != v8);
      return result;
    }
    return 0;
  }
  uint64_t result = 0;
  if (v14 <= 7 && v13 == 3 && v8)
  {
    uint64_t v67 = 0;
    unint64_t v68 = 0;
    while (1)
    {
      unint64_t v69 = *(void *)(a3 + 24);
      if (v69)
      {
        uint64_t v70 = 0;
        unint64_t v71 = v69 - 1;
        do
        {
          uint64_t v72 = (a2[v68 >> 3] >> (~(_BYTE)v68 & 7)) & 1;
          ++v68;
          v70 += v72 << v71--;
        }
        while (v71 < v69);
      }
      else
      {
        uint64_t v70 = 0;
      }
      unint64_t v73 = 4 * v70;
      if (v73 >= *(void *)(a3 + 96) - *(void *)(a3 + 88)) {
        break;
      }
      for (iuint64_t i = 0; ii != 4; ++ii)
        *(unsigned char *)(v10 + ii) = *(unsigned char *)(*(void *)(a3 + 88) + v73 + ii);
      uint64_t result = 0;
      ++v67;
      v10 += 4;
      if (v67 == v8) {
        return result;
      }
    }
    return 47;
  }
  return result;
}

uint64_t sub_100017304(uint64_t a1, unint64_t a2)
{
  uint64_t result = 31;
  switch(a1)
  {
    case 0:
      if (((1 << a2) & 0x10116) != 0) {
        unsigned int v4 = 0;
      }
      else {
        unsigned int v4 = 37;
      }
      if (a2 <= 0x10) {
        uint64_t result = v4;
      }
      else {
        uint64_t result = 37;
      }
      break;
    case 2:
    case 4:
    case 6:
      if (((a2 - 8) & 0xFFFFFFFFFFFFFFF7) != 0) {
        uint64_t result = 37;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 3:
      if (a2 - 1 > 7) {
        uint64_t result = 37;
      }
      else {
        uint64_t result = dword_100023638[a2 - 1];
      }
      break;
    default:
      return result;
  }
  return result;
}

char *sub_1000173B0(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  __int16 v5 = __dst;
  if (a5 < 1) {
    return v5;
  }
  unint64_t v10 = *(char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    unint64_t v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      sub_10001759C();
    }
    uint64_t v13 = (char *)(__dst - v11);
    unint64_t v14 = v9 - (void)v11;
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v15 = v12;
    }
    if (v15)
    {
      size_t v16 = v15;
      unsigned int v17 = (char *)operator new(v15);
    }
    else
    {
      size_t v16 = 0;
      unsigned int v17 = 0;
    }
    char v27 = &v13[(void)v17];
    memcpy(&v13[(void)v17], __src, a5);
    char v28 = &v13[(void)v17];
    size_t v29 = v16;
    if (v11 != v5)
    {
      do
      {
        v13[(void)v17 - 1] = v13[(void)(v11 - 1)];
        --v13;
      }
      while (v13);
      unint64_t v10 = *(char **)(a1 + 8);
      char v28 = v17;
    }
    char v30 = &v27[a5];
    char v31 = &v17[v29];
    if (v10 != v5) {
      memmove(v30, v5, v10 - v5);
    }
    int v32 = *(char **)a1;
    *(void *)a1 = v28;
    *(void *)(a1 + 8) = &v30[v10 - v5];
    *(void *)(a1 + 16) = v31;
    if (v32) {
      operator delete(v32);
    }
    return v27;
  }
  uint64_t v18 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    char v19 = &__src[a5];
    BOOL v21 = *(char **)(a1 + 8);
LABEL_17:
    int v22 = &v5[a5];
    unsigned __int8 v23 = &v21[-a5];
    char v24 = v21;
    if (&v21[-a5] < v10)
    {
      int64_t v25 = &v10[a5] - v21;
      char v24 = v21;
      do
      {
        char v26 = *v23++;
        *v24++ = v26;
        --v25;
      }
      while (v25);
    }
    *(void *)(a1 + 8) = v24;
    if (v21 != v22) {
      memmove(&v5[a5], v5, v21 - v22);
    }
    if (v19 != __src) {
      memmove(v5, __src, v19 - __src);
    }
    return v5;
  }
  char v19 = &__src[v18];
  int64_t v20 = a4 - &__src[v18];
  if (a4 != &__src[v18]) {
    memmove(*(void **)(a1 + 8), &__src[v18], a4 - &__src[v18]);
  }
  BOOL v21 = &v10[v20];
  *(void *)(a1 + 8) = &v10[v20];
  if (v18 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_10001759C()
{
}

void sub_1000175B4(const char *a1)
{
  exceptiouint64_t n = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100017610(exception, a1);
}

void sub_1000175FC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100017610(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_10001763C()
{
  exceptiouint64_t n = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  CFStringRef v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_100017670(unint64_t *a1, size_t a2)
{
  __int16 v5 = (char *)a1[1];
  unsigned int v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    unint64_t v6 = *a1;
    char v7 = &v5[-*a1];
    unint64_t v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0) {
      sub_10001759C();
    }
    unint64_t v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v10 = v8;
    }
    if (v10) {
      unint64_t v11 = (unint64_t)operator new(v10);
    }
    else {
      unint64_t v11 = 0;
    }
    uint64_t v12 = &v7[v11];
    uint64_t v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      unint64_t v11 = (unint64_t)v12;
    }
    else
    {
      unint64_t v14 = &v5[~v6];
      do
      {
        char v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      __int16 v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

void *sub_1000177AC(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_100017820(a1, a2);
    unsigned int v4 = (char *)a1[1];
    __int16 v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_100017804(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100017820(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    sub_10001759C();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void *sub_100017864(void *a1)
{
  unint64_t v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  unsigned int v4 = (void *)a1[1];
  if (v4)
  {
    a1[2] = v4;
    operator delete(v4);
  }
  return a1;
}

unint64_t sub_1000178B8(int *a1, uint64_t a2, unint64_t *a3, uint64_t *a4, unint64_t a5)
{
  unint64_t v5 = 0;
  unint64_t v6 = *a3;
  uint64_t v7 = *a4;
  unint64_t v8 = (unint64_t)((a4[1] - *a4) >> 3) >> 1;
  while (1)
  {
    unint64_t v9 = v6 >> 3;
    if ((v6 & 7) == 0 && v9 >= a5)
    {
      int v12 = 10;
      goto LABEL_9;
    }
    unsigned int v10 = *(unsigned __int8 *)(a2 + v9);
    *a3 = v6 + 1;
    if (v5 >= v8) {
      break;
    }
    unint64_t v11 = *(void *)(v7 + ((8 * ((v10 >> (v6 & 7)) & 1)) | (16 * v5)));
    *a1 = 0;
    ++v6;
    unint64_t v5 = v11 - v8;
    if (v11 < v8) {
      return v11;
    }
  }
  int v12 = 11;
LABEL_9:
  unint64_t v11 = 0;
  *a1 = v12;
  return v11;
}

uint64_t sub_100017944(void *a1, uint64_t **a2, uint64_t a3)
{
  uint64_t v7 = *a2;
  unint64_t v6 = a2[1];
  uint64_t v8 = (char *)v6 - (char *)*a2;
  unint64_t v9 = v8 >> 3;
  char v45 = 0;
  BOOL v46 = 0;
  uint64_t v47 = 0;
  sub_100017D18(&v45, v8 >> 3);
  uint64_t v42 = 0;
  unint64_t v43 = 0;
  uint64_t v44 = 0;
  __p = 0;
  sub_100017BE8(&v42, a3 + 1, &__p);
  __p = 0;
  unint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v38 = 0;
  sub_100017BE8(&__p, a3 + 1, &v38);
  if (v6 != v7)
  {
    unsigned int v10 = *a2;
    unint64_t v11 = v42;
    if (v9 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v8 >> 3;
    }
    do
    {
      uint64_t v13 = *v10++;
      ++v11[v13];
      --v12;
    }
    while (v12);
  }
  if (a3)
  {
    unint64_t v14 = (uint64_t *)v42;
    char v15 = (uint64_t *)((char *)__p + 8);
    uint64_t v16 = *(void *)__p;
    do
    {
      uint64_t v17 = *v14++;
      uint64_t v16 = 2 * (v17 + v16);
      *v15++ = v16;
      --a3;
    }
    while (a3);
  }
  if (v6 != v7)
  {
    uint64_t v18 = *a2;
    char v19 = __p;
    int64_t v20 = v45;
    if (v9 <= 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v8 >> 3;
    }
    do
    {
      uint64_t v23 = *v18++;
      uint64_t v22 = v23;
      if (v23)
      {
        uint64_t v24 = v19[v22];
        v19[v22] = v24 + 1;
        void *v20 = v24;
      }
      ++v20;
      --v21;
    }
    while (v21);
  }
  a1[1] = *a1;
  uint64_t v38 = 0x7FFFLL;
  sub_100017CE8((uint64_t)a1, v8 >> 2, &v38);
  if (v6 == v7)
  {
LABEL_31:
    BOOL v30 = 0;
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    unint64_t v27 = 0;
    char v28 = *a2;
    if (v9 <= 1) {
      uint64_t v29 = 1;
    }
    else {
      uint64_t v29 = v8 >> 3;
    }
    BOOL v30 = 1;
    while (1)
    {
      unint64_t v31 = v28[v25];
      if (v31) {
        break;
      }
LABEL_30:
      BOOL v30 = ++v25 < v9;
      if (v25 == v29) {
        goto LABEL_31;
      }
    }
    unint64_t v32 = 0;
    int v33 = v45;
    while (v27 <= v9 - 2)
    {
      uint64_t v34 = (v33[v25] >> (v31 + ~(_BYTE)v32)) & 1 | (2 * v27);
      uint64_t v35 = *a1;
      uint64_t v36 = *(void *)(*a1 + 8 * v34);
      if (v36 == 0x7FFF)
      {
        if (++v32 == v31)
        {
          unint64_t v27 = 0;
          *(void *)(v35 + 8 * v34) = v25;
        }
        else
        {
          unint64_t v27 = v26 + 1;
          *(void *)(v35 + 8 * v34) = ++v26 + v9;
        }
      }
      else
      {
        unint64_t v27 = v36 - v9;
        ++v32;
      }
      unint64_t v31 = v28[v25];
      if (v32 >= v31) {
        goto LABEL_30;
      }
    }
  }
  if (__p)
  {
    unint64_t v40 = __p;
    operator delete(__p);
  }
  if (v42)
  {
    unint64_t v43 = v42;
    operator delete(v42);
  }
  if (v45)
  {
    BOOL v46 = v45;
    operator delete(v45);
  }
  if (v30) {
    return 55;
  }
  else {
    return 0;
  }
}

void sub_100017B9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  if (a16) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100017BE8(void *a1, unint64_t a2, void *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_100017C6C(a1, a2);
    unint64_t v6 = (void *)a1[1];
    uint64_t v7 = &v6[a2];
    uint64_t v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_100017C50(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100017C6C(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_10001759C();
  }
  uint64_t result = (char *)sub_100017CB0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *sub_100017CB0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_10001763C();
  }
  return operator new(8 * a2);
}

void sub_100017CE8(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    sub_100017D90((void **)a1, a2 - v3, a3);
  }
}

void *sub_100017D18(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_100017C6C(a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_100017D74(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_100017D90(void **a1, unint64_t a2, void *a3)
{
  uint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  unint64_t v9 = *(void **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 3)
  {
    if (a2)
    {
      uint64_t v16 = 8 * a2;
      uint64_t v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8;
      }
      while (v16);
      unint64_t v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 3);
    if (v11 >> 61) {
      sub_10001759C();
    }
    uint64_t v12 = v10 >> 3;
    uint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 >> 2 > v11) {
      unint64_t v11 = v13 >> 2;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      char v15 = (char *)sub_100017CB0(v6, v14);
    }
    else {
      char v15 = 0;
    }
    uint64_t v18 = &v15[8 * v12];
    char v19 = &v18[8 * a2];
    uint64_t v20 = 8 * a2;
    uint64_t v21 = v18;
    do
    {
      *(void *)uint64_t v21 = *a3;
      v21 += 8;
      v20 -= 8;
    }
    while (v20);
    uint64_t v22 = &v15[8 * v14];
    uint64_t v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 8)
    {
      uint64_t v25 = *((void *)i - 1);
      *((void *)v18 - 1) = v25;
      v18 -= 8;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

void *sub_100017EB4(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    uint64_t result = sub_100017820(result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_100017F14(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
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

CFArrayRef wait_for_io_service_matching_any_dict(const __CFArray *result, unsigned int a2)
{
  if (result)
  {
    unint64_t v3 = result;
    CFIndex Count = CFArrayGetCount(result);
    unsigned int v5 = 0;
    while (1)
    {
      unsigned int v6 = a2 - v5 >= 3 ? 3 : a2 - v5;
      if (Count >= 1) {
        break;
      }
LABEL_10:
      CFStringRef v9 = CFCopyDescription(v3);
      int v23 = 0;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      *(_OWORD *)buffer = 0u;
      long long v18 = 0u;
      if (CFStringGetCString(v9, buffer, 100, 0x8000100u)) {
        ramrod_log_msg("waiting for matching IOKit service: %s\n", v10, v11, v12, v13, v14, v15, v16, (char)buffer);
      }
      CFRelease(v9);
      sleep(v6);
      v5 += v6;
      if (v5 >= a2) {
        return 0;
      }
    }
    CFIndex v7 = 0;
    while (1)
    {
      CFNumberRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v3, v7);
      CFRetain(ValueAtIndex);
      uint64_t result = (const __CFArray *)IOServiceGetMatchingService(kIOMasterPortDefault, (CFDictionaryRef)ValueAtIndex);
      if (result) {
        break;
      }
      if (Count == ++v7) {
        goto LABEL_10;
      }
    }
  }
  return result;
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

uint64_t wait_for_io_service_matching_class_with_timeout(const char *a1, unsigned int a2)
{
  char v3 = (char)a1;
  CFMutableDictionaryRef v4 = IOServiceMatching(a1);
  if (v4)
  {
    return wait_for_io_service_matching_dict(v4, a2);
  }
  else
  {
    ramrod_log_msg("unable to create matching dictionary for class '%s'\n", v5, v6, v7, v8, v9, v10, v11, v3);
    return 0;
  }
}

uint64_t wait_for_io_service_matching_class(const char *a1)
{
  return wait_for_io_service_matching_class_with_timeout(a1, 0xFFFFFFFF);
}

CFArrayRef wait_for_io_service_matching_any_class_with_timeout(const __CFArray *a1, unsigned int a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t Count = CFArrayGetCount(a1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, Count, &kCFTypeArrayCallBacks);
  if (!Mutable) {
    return 0;
  }
  CFArrayRef v6 = Mutable;
  if (Count < 1)
  {
LABEL_12:
    CFArrayRef v17 = wait_for_io_service_matching_any_dict(v6, a2);
  }
  else
  {
    CFIndex v7 = 0;
    while (1)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v7);
      if (!ValueAtIndex) {
        break;
      }
      CFStringRef v9 = ValueAtIndex;
      CFTypeID v10 = CFGetTypeID(ValueAtIndex);
      if (v10 != CFStringGetTypeID()) {
        break;
      }
      CFIndex Length = CFStringGetLength(v9);
      int64_t MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      if (MaximumSizeForEncoding < 1) {
        break;
      }
      CFIndex v13 = MaximumSizeForEncoding;
      uint64_t v14 = (char *)malloc(MaximumSizeForEncoding);
      if (!v14) {
        break;
      }
      uint64_t v15 = v14;
      if (!CFStringGetCString(v9, v14, v13, 0x8000100u)) {
        break;
      }
      CFMutableDictionaryRef v16 = IOServiceMatching(v15);
      free(v15);
      if (!v16) {
        break;
      }
      CFArrayAppendValue(v6, v16);
      CFRelease(v16);
      if (Count == ++v7) {
        goto LABEL_12;
      }
    }
    CFArrayRef v17 = 0;
  }
  CFRelease(v6);
  return v17;
}

CFArrayRef wait_for_io_service_matching_any_class(const __CFArray *a1)
{
  return wait_for_io_service_matching_any_class_with_timeout(a1, 0xFFFFFFFF);
}

uint64_t wait_for_io_service_matching_name(const char *a1)
{
  char v1 = (char)a1;
  CFMutableDictionaryRef v2 = IOServiceNameMatching(a1);
  if (v2)
  {
    return wait_for_io_service_matching_dict(v2, 0xFFFFFFFF);
  }
  else
  {
    ramrod_log_msg("unable to create matching dictionary for service '%s'\n", v3, v4, v5, v6, v7, v8, v9, v1);
    return 0;
  }
}

__CFDictionary *create_embedded_storage_service_query_dict(char *cStr)
{
  CFStringRef v1 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v1) {
    return 0;
  }
  CFStringRef v2 = v1;
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    uint64_t v4 = Mutable;
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
    uint64_t v4 = (__CFDictionary *)v2;
  }
  CFRelease(v4);
  return v6;
}

uint64_t AKSIdentityCreateFirst()
{
  return _AKSIdentityCreateFirst();
}

uint64_t AKSIdentityLoad()
{
  return _AKSIdentityLoad();
}

uint64_t AKSIdentitySetPrimary()
{
  return _AKSIdentitySetPrimary();
}

uint64_t AKSVolumeMap()
{
  return _AKSVolumeMap();
}

uint64_t APFSContainerWipeVolumeKeys()
{
  return _APFSContainerWipeVolumeKeys();
}

uint64_t APFSOverProvModel()
{
  return _APFSOverProvModel();
}

uint64_t APFSVolumeDelete()
{
  return _APFSVolumeDelete();
}

uint64_t APFSVolumeEnableUserProtectionWithOptions()
{
  return _APFSVolumeEnableUserProtectionWithOptions();
}

uint64_t APFSVolumeRole()
{
  return _APFSVolumeRole();
}

uint64_t APFSVolumeRoleFind()
{
  return _APFSVolumeRoleFind();
}

uint64_t BOMCopierCopyWithOptions()
{
  return _BOMCopierCopyWithOptions();
}

uint64_t BOMCopierFree()
{
  return _BOMCopierFree();
}

uint64_t BOMCopierNew()
{
  return _BOMCopierNew();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
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

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
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

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return _CFDateFormatterCreate(allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return _CFDateFormatterCreateStringWithAbsoluteTime(allocator, formatter, at);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
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

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
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

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFReadStreamCreateWithBytesNoCopy(alloc, bytes, length, bytesDeallocator);
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

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRun(void)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
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

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFRange v5 = _CFStringFind(theString, stringToFind, compareOptions);
  CFIndex length = v5.length;
  locatiouint64_t n = v5.location;
  result.CFIndex length = length;
  result.locatiouint64_t n = location;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return _CFStringGetFileSystemRepresentation(string, buffer, maxBufLen);
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

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return _CFUUIDCreateFromString(alloc, uuidStr);
}

uint64_t IOAVControllerCreateWithService()
{
  return _IOAVControllerCreateWithService();
}

uint64_t IOAVControllerSetPower()
{
  return _IOAVControllerSetPower();
}

uint64_t IOAVGetCEAVideoShortIDWithData()
{
  return _IOAVGetCEAVideoShortIDWithData();
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

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
}

uint64_t IOMobileFramebufferCreateDisplayList()
{
  return _IOMobileFramebufferCreateDisplayList();
}

uint64_t IOMobileFramebufferEnableHotPlugDetectNotifications()
{
  return _IOMobileFramebufferEnableHotPlugDetectNotifications();
}

uint64_t IOMobileFramebufferGetDigitalOutState()
{
  return _IOMobileFramebufferGetDigitalOutState();
}

uint64_t IOMobileFramebufferGetDisplaySize()
{
  return _IOMobileFramebufferGetDisplaySize();
}

uint64_t IOMobileFramebufferGetRunLoopSource()
{
  return _IOMobileFramebufferGetRunLoopSource();
}

uint64_t IOMobileFramebufferGetSupportedDigitalOutModes()
{
  return _IOMobileFramebufferGetSupportedDigitalOutModes();
}

uint64_t IOMobileFramebufferOpenByName()
{
  return _IOMobileFramebufferOpenByName();
}

uint64_t IOMobileFramebufferRequestPowerChange()
{
  return _IOMobileFramebufferRequestPowerChange();
}

uint64_t IOMobileFramebufferSetDigitalOutMode()
{
  return _IOMobileFramebufferSetDigitalOutMode();
}

uint64_t IOMobileFramebufferSetDisplayDevice()
{
  return _IOMobileFramebufferSetDisplayDevice();
}

uint64_t IOMobileFramebufferSwapBegin()
{
  return _IOMobileFramebufferSwapBegin();
}

uint64_t IOMobileFramebufferSwapEnd()
{
  return _IOMobileFramebufferSwapEnd();
}

uint64_t IOMobileFramebufferSwapSetLayer()
{
  return _IOMobileFramebufferSwapSetLayer();
}

uint64_t IOMobileFramebufferSwapWait()
{
  return _IOMobileFramebufferSwapWait();
}

uint64_t IOMobileFramebufferSwapWaitWithTimeout()
{
  return _IOMobileFramebufferSwapWaitWithTimeout();
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithName(AssertionType, AssertionLevel, AssertionName, AssertionID);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntryGetProperty(io_registry_entry_t entry, const io_name_t propertyName, io_struct_inband_t buffer, uint32_t *size)
{
  return _IORegistryEntryGetProperty(entry, propertyName, buffer, size);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return _IORegistryEntrySetCFProperties(entry, properties);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
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

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return _IOSurfaceCreate(properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return _IOSurfaceGetAllocSize(buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return _IOSurfaceGetBaseAddress(buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return _IOSurfaceGetBytesPerRow(buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceLock(buffer, options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceUnlock(buffer, options, seed);
}

uint64_t IOUSBDeviceControllerCreate()
{
  return _IOUSBDeviceControllerCreate();
}

uint64_t IOUSBDeviceControllerForceOffBus()
{
  return _IOUSBDeviceControllerForceOffBus();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetFloat32Answer()
{
  return _MGGetFloat32Answer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MKBDeviceObliterateClassDKey()
{
  return _MKBDeviceObliterateClassDKey();
}

uint64_t MKBKeyBagCreateSystem()
{
  return _MKBKeyBagCreateSystem();
}

uint64_t MKBUserTypeDeviceMode()
{
  return _MKBUserTypeDeviceMode();
}

uint64_t MOXPCTransportOpen()
{
  return _MOXPCTransportOpen();
}

uint64_t MOXPCTransportResume()
{
  return _MOXPCTransportResume();
}

uint64_t MOXPCTransportSendMessageOnConnection()
{
  return _MOXPCTransportSendMessageOnConnection();
}

uint64_t MOXPCTransportSetMessageHandler()
{
  return _MOXPCTransportSetMessageHandler();
}

Boolean SMJobRemove(CFStringRef domain, CFStringRef jobLabel, AuthorizationRef auth, Boolean wait, CFErrorRef *outError)
{
  return _SMJobRemove(domain, jobLabel, auth, wait, outError);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

uint64_t __IOAVClassMatching()
{
  return ___IOAVClassMatching();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
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

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return ___sprintf_chk(a1, a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return ___toupper(a1);
}

uint64_t _get_cpu_capabilities()
{
  return __get_cpu_capabilities();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

uint64_t aks_bootstrap_fs()
{
  return _aks_bootstrap_fs();
}

uint64_t archive_entry_filetype()
{
  return _archive_entry_filetype();
}

uint64_t archive_entry_free()
{
  return _archive_entry_free();
}

uint64_t archive_entry_new()
{
  return _archive_entry_new();
}

uint64_t archive_entry_set_pathname()
{
  return _archive_entry_set_pathname();
}

uint64_t archive_entry_set_size()
{
  return _archive_entry_set_size();
}

uint64_t archive_entry_size()
{
  return _archive_entry_size();
}

uint64_t archive_read_disk_entry_from_file()
{
  return _archive_read_disk_entry_from_file();
}

uint64_t archive_read_disk_new()
{
  return _archive_read_disk_new();
}

uint64_t archive_read_disk_set_symlink_physical()
{
  return _archive_read_disk_set_symlink_physical();
}

uint64_t archive_write_close()
{
  return _archive_write_close();
}

uint64_t archive_write_data()
{
  return _archive_write_data();
}

uint64_t archive_write_finish()
{
  return _archive_write_finish();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

uint64_t archive_write_new()
{
  return _archive_write_new();
}

uint64_t archive_write_open()
{
  return _archive_write_open();
}

uint64_t archive_write_set_compression_bzip2()
{
  return _archive_write_set_compression_bzip2();
}

uint64_t archive_write_set_format_cpio()
{
  return _archive_write_set_format_cpio();
}

void asl_close(asl_object_t obj)
{
}

char *__cdecl asl_format(asl_object_t msg, const char *msg_fmt, const char *time_fmt, uint32_t text_encoding)
{
  return _asl_format(msg, msg_fmt, time_fmt, text_encoding);
}

asl_object_t asl_match(asl_object_t data, asl_object_t querylist, size_t *last, size_t start, size_t count, uint32_t duration, int32_t direction)
{
  return _asl_match(data, querylist, last, start, count, duration, direction);
}

asl_object_t asl_next(asl_object_t obj)
{
  return _asl_next(obj);
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return _asl_open(ident, facility, opts);
}

asl_object_t asl_open_path(const char *path, uint32_t opts)
{
  return _asl_open_path(path, opts);
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
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

char *__cdecl ctime(const time_t *a1)
{
  return _ctime(a1);
}

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return _ctime_r(a1, a2);
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

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return _dispatch_block_wait(block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
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

void dispatch_retain(dispatch_object_t object)
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

void endfsent(void)
{
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
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

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return _geteuid();
}

fstab *getfsent(void)
{
  return _getfsent();
}

fstab *__cdecl getfsfile(const char *a1)
{
  return _getfsfile(a1);
}

int getgrnam_r(const char *a1, group *a2, char *a3, size_t a4, group **a5)
{
  return _getgrnam_r(a1, a2, a3, a4, a5);
}

int getmntinfo(statfs **a1, int a2)
{
  return _getmntinfo(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

pid_t getppid(void)
{
  return _getppid();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return _getpwnam_r(a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return _getuid();
}

int glob_b(const char *a1, int a2, void *a3, glob_t *a4)
{
  return _glob_b(a1, a2, a3, a4);
}

void globfree(glob_t *a1)
{
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int lchflags(const char *a1, __uint32_t a2)
{
  return _lchflags(a1, a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return _lchmod(a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

void objc_enumerationMutation(id obj)
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

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

uint64_t os_parse_boot_arg_int()
{
  return _os_parse_boot_arg_int();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

uint64_t os_variant_is_darwinos()
{
  return _os_variant_is_darwinos();
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_detach(pthread_t a1)
{
  return _pthread_detach(a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
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

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return _pthread_once(a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int reboot(int a1)
{
  return _reboot(a1);
}

uint64_t reboot3()
{
  return _reboot3();
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

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return _removefile_state_get(state, key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return _removefile_state_set(state, key, value);
}

int setfsent(void)
{
  return _setfsent();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
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

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
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

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

int symlink(const char *a1, const char *a2)
{
  return _symlink(a1, a2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

long double tanh(long double __x)
{
  return _tanh(__x);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unmount(const char *a1, int a2)
{
  return _unmount(a1, a2);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dryRunOnly(void *a1, const char *a2, ...)
{
  return [a1 dryRunOnly];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_sharedDataAccessor(void *a1, const char *a2, ...)
{
  return [a1 sharedDataAccessor];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return [a1 uid];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_userUUID(void *a1, const char *a2, ...)
{
  return [a1 userUUID];
}