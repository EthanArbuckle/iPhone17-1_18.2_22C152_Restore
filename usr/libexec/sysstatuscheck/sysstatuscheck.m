size_t sub_1000016E0()
{
  FILE *v0;
  const char *v1;
  size_t v2;
  unint64_t v3;
  unint64_t v4;
  mach_port_t v5;
  size_t result;
  int v7;
  mach_msg_type_number_t host_info64_outCnt;
  integer_t host_info64_out[4];
  int v10;
  int v11;
  size_t v12;
  unint64_t v13;
  char __str[255];

  v12 = 8;
  v13 = 0;
  if (sysctlbyname("hw.memsize", &v13, &v12, 0, 0))
  {
    v0 = __stderrp;
    v1 = "could not get hw.memsize\n";
    v2 = 25;
  }
  else
  {
    v11 = 0;
    v12 = 4;
    if (sysctlbyname("vm.pagesize", &v11, &v12, 0, 0))
    {
      v0 = __stderrp;
      v1 = "could not get vm.pagesize\n";
      v2 = 26;
    }
    else
    {
      v3 = v13;
      v4 = v11;
      host_info64_outCnt = 38;
      v5 = mach_host_self();
      result = host_statistics64(v5, 4, host_info64_out, &host_info64_outCnt);
      if (result)
      {
        v0 = __stderrp;
        v1 = "host_statistics64 call failed\n";
        v2 = 30;
      }
      else
      {
        v7 = vaddvq_s32(*(int32x4_t *)host_info64_out);
        if (100 * (unint64_t)(v7 + v10) / (v3 / v4) - 120 > 0xFFFFFFFFFFFFFFD8) {
          return result;
        }
        snprintf(__str, 0xFFuLL, "VM has reached unhealthy accounting levels at %llu%%. resident page count: %llu, max pages: %llu", 100 * (unint64_t)(v7 + v10) / (v3 / v4), (v7 + v10), v3 / v4);
        sub_100001880(__str);
        v0 = __stderrp;
        v1 = "panic or reboot failed\n";
        v2 = 23;
      }
    }
  }
  return fwrite(v1, v2, 1uLL, v0);
}

uint64_t sub_100001880(const char *a1)
{
  v2 = fopen("/var/mobile/Library/Logs/khwm.log", "w");
  if (!v2)
  {
    fwrite("could not create reboot log file\n", 0x21uLL, 1uLL, __stderrp);
    goto LABEL_18;
  }
  v3 = v2;
  mach_msg_type_number_t host_info64_outCnt = 38;
  mach_port_t v4 = mach_host_self();
  if (!host_statistics64(v4, 4, &host_info64_out.st_dev, &host_info64_outCnt))
  {
    fprintf(v3, "Wired Memory Pages: %d\n", HIDWORD(host_info64_out.st_ino));
    fclose(v3);
    *(void *)v12 = 0;
    posix_spawn_file_actions_t v13 = 0;
    *(_OWORD *)__argv = off_100010300;
    if (posix_spawn_file_actions_init(&v13))
    {
      fwrite("posix_spawn_file_actions_init call failed\n", 0x2AuLL, 1uLL, __stderrp);
LABEL_17:
      sync();
      goto LABEL_18;
    }
    if (posix_spawn_file_actions_addopen(&v13, 1, "/var/mobile/Library/Logs/khwm.log", 9, 0))
    {
      v5 = __stderrp;
      v6 = "posix_spawn_file_actions_addopen failed\n";
      size_t v7 = 40;
    }
    else if (posix_spawn(&v12[1], "/usr/bin/zprint", &v13, 0, __argv, 0))
    {
      v5 = __stderrp;
      v6 = "posix_spawn failed\n";
      size_t v7 = 19;
    }
    else if (wait4(v12[1], v12, 0, 0))
    {
      v5 = __stderrp;
      v6 = "wait4 call failed\n";
      size_t v7 = 18;
    }
    else
    {
      if (!BYTE1(v12[0]))
      {
LABEL_16:
        posix_spawn_file_actions_destroy(&v13);
        goto LABEL_17;
      }
      v5 = __stderrp;
      v6 = "zprint returned non-zero exit code\n";
      size_t v7 = 35;
    }
    fwrite(v6, v7, 1uLL, v5);
    goto LABEL_16;
  }
  fwrite("host_statistics64 call failed\n", 0x1EuLL, 1uLL, __stderrp);
  fclose(v3);
LABEL_18:
  if (!stat("/var/db/sysstatuscheck_should_not_panic", &host_info64_out) || reboot_np(7168, a1))
  {
    host_info64_out.st_dev = 2;
    if (sysctlbyname("kern.darkboot", 0, 0, &host_info64_out, 4uLL))
    {
      v8 = __stderrp;
      v9 = "could not set dark-boot flag\n";
      size_t v10 = 29;
LABEL_22:
      fwrite(v9, v10, 1uLL, v8);
      return 1;
    }
    if (reboot(0))
    {
      host_info64_out.st_dev = 0;
      fwrite("reboot failed\n", 0xEuLL, 1uLL, __stderrp);
      if (sysctlbyname("kern.darkboot", 0, 0, &host_info64_out, 4uLL))
      {
        v8 = __stderrp;
        v9 = "could not reset darkboot\n";
        size_t v10 = 25;
        goto LABEL_22;
      }
    }
  }
  return 1;
}

uint64_t start()
{
  unsigned int v8 = 0;
  if (!sub_100001D58()) {
    return 1;
  }
  sub_1000016E0();
  int v9 = 0;
  v10[0] = 4;
  if (sysctlbyname("kern.kasan.available", &v9, v10, 0, 0) || !v9)
  {
    if (sub_100001DA4())
    {
      v1 = __stderrp;
      v2 = "could not do KHWM check because the device has debug boot-args\n";
      uint64_t v0 = 1;
      size_t v3 = 63;
LABEL_18:
      fwrite(v2, v3, 1uLL, v1);
      return v0;
    }
    if ((sub_1000022CC() & 1) == 0)
    {
      v1 = __stderrp;
      v2 = "could not read jetsam properties file\n";
      uint64_t v0 = 1;
      size_t v3 = 38;
      goto LABEL_18;
    }
    uint64_t v0 = sub_100002B08(&v8);
    if (v0) {
      return v0;
    }
    uint64_t v4 = qword_100014070;
    uint64_t v5 = v8;
    if (qword_100014070 >= 1 && qword_100014070 > v8)
    {
      sub_100001ED8(60);
      if (sub_100002B08(&v8)) {
        return 1;
      }
      snprintf((char *)v10, 0xFFuLL, "Kernel memory has exceeded limits. Memory available now: %u%%. Available memory minimum: %llu%%", v8, qword_100014070);
      if (qword_100014070 >= 1 && qword_100014070 > (unint64_t)v8)
      {
        sub_1000028F8(1u, v8, qword_100014070);
        sub_100001880((const char *)v10);
        return 1;
      }
      fwrite("Kernel memory exceeded limit on first pass, but not second pass, not rebooting\n", 0x4FuLL, 1uLL, __stderrp);
      uint64_t v5 = v8;
      uint64_t v4 = qword_100014070;
    }
    sub_1000028F8(0, v5, v4);
    return 1;
  }
  uint64_t v0 = 1;
  fwrite("could not do KHWM check because running kasan kernel\n", 0x35uLL, 1uLL, __stderrp);
  return v0;
}

BOOL sub_100001D58()
{
  return !stat("/private/var/mobile/Library/MemoryMaintenance/sysstatuscheck_should_check", &v2)
      && !remove((const std::__fs::filesystem::path *)"/private/var/mobile/Library/MemoryMaintenance/sysstatuscheck_should_check", v0);
}

uint64_t sub_100001DA4()
{
  sub_100001F28(v17);
  int v0 = (char)v18;
  __p = (void *)v17[0];
  if ((v18 & 0x80u) == 0) {
    v1 = v17;
  }
  else {
    v1 = (void *)v17[0];
  }
  if ((v18 & 0x80u) == 0) {
    int64_t v2 = v18;
  }
  else {
    int64_t v2 = v17[1];
  }
  size_t v3 = (char *)v1 + v2;
  uint64_t v4 = aTrace;
  do
  {
    int v5 = v4[23];
    if (v5 >= 0) {
      v6 = v4;
    }
    else {
      v6 = *(char **)v4;
    }
    if (v5 >= 0) {
      int64_t v7 = v4[23];
    }
    else {
      int64_t v7 = *((void *)v4 + 1);
    }
    if (!v7)
    {
LABEL_26:
      uint64_t v14 = 1;
      if ((v0 & 0x80000000) == 0) {
        return v14;
      }
      goto LABEL_27;
    }
    if (v2 >= v7)
    {
      int v8 = *v6;
      int64_t v9 = v2;
      size_t v10 = v1;
      do
      {
        int64_t v11 = v9 - v7;
        if (v11 == -1) {
          break;
        }
        v12 = (char *)memchr(v10, v8, v11 + 1);
        if (!v12) {
          break;
        }
        posix_spawn_file_actions_t v13 = v12;
        if (!memcmp(v12, v6, v7))
        {
          if (v13 == v3 || v13 - (char *)v1 == -1) {
            break;
          }
          goto LABEL_26;
        }
        size_t v10 = v13 + 1;
        int64_t v9 = v3 - (v13 + 1);
      }
      while (v9 >= v7);
    }
    v4 += 24;
  }
  while (v4 != (char *)&dword_100014060);
  uint64_t v14 = 0;
  if (v0 < 0) {
LABEL_27:
  }
    operator delete(__p);
  return v14;
}

uint64_t sub_100001ED8(uint64_t result)
{
  if (result)
  {
    int v1 = result;
    do
    {
      sub_100001FE4();
      if (v1 >= 30) {
        unsigned int v2 = 30;
      }
      else {
        unsigned int v2 = v1;
      }
      result = sleep(v2);
      v1 -= v2;
    }
    while (v1);
  }
  return result;
}

void *sub_100001F28@<X0>(void *a1@<X8>)
{
  size_t v4 = 512;
  unsigned int v2 = v5;
  if (sysctlbyname("kern.bootargs", v5, &v4, 0, 0))
  {
    fwrite("could not retrieve boot-args\n", 0x1DuLL, 1uLL, __stderrp);
    unsigned int v2 = (char *)&unk_10000F046;
  }
  return sub_100002108(a1, v2);
}

size_t sub_100001FE4()
{
  kern_return_t v7;
  size_t v9;
  uint64_t vars8;

  mach_port_t v0 = dword_100014060;
  if (dword_100014060) {
    goto LABEL_2;
  }
  CFDictionaryRef v4 = IOServiceMatching("IOWatchdog");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v4);
  if (!MatchingService)
  {
    unsigned int v2 = __stderrp;
    size_t v3 = "Failed to discover watchdog service\n";
    int64_t v9 = 36;
    goto LABEL_14;
  }
  io_object_t v6 = MatchingService;
  int64_t v7 = IOServiceOpen(MatchingService, mach_task_self_, 1u, (io_connect_t *)&dword_100014060);
  IOObjectRelease(v6);
  mach_port_t v0 = dword_100014060;
  if (v7 || dword_100014060 == 0)
  {
    unsigned int v2 = __stderrp;
    size_t v3 = "IOServiceOpen kIOWatchdogUserClientOpen failed\n";
  }
  else
  {
LABEL_2:
    size_t result = IOConnectCallScalarMethod(v0, 1u, 0, 0, 0, 0);
    if (!result) {
      return result;
    }
    unsigned int v2 = __stderrp;
    size_t v3 = "Failed to call kIOWatchdogDaemonCheckin method\n";
  }
  int64_t v9 = 47;
LABEL_14:

  return fwrite(v3, v9, 1uLL, v2);
}

void *sub_100002108(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000021BC();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    io_object_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    io_object_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_1000021BC()
{
}

void sub_1000021D4(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100002230(exception, a1);
}

void sub_10000221C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100002230(std::logic_error *a1, const char *a2)
{
  size_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100002264()
{
  for (uint64_t i = 0; i != -96; i -= 24)
  {
    if (aTrace[i + 95] < 0) {
      operator delete(*(void **)&aTrace[i + 72]);
    }
  }
}

uint64_t sub_1000022AC()
{
  return __cxa_atexit((void (*)(void *))sub_100002264, 0, (void *)&_mh_execute_header);
}

uint64_t sub_1000022CC()
{
  if (access("/System/Library/LaunchDaemons/com.apple.jetsamproperties.NonUI.plist", 0))
  {
    LOBYTE(v23[0]) = 0;
    size_t v22 = 32;
    if (sysctlbyname("hw.targettype", v23, &v22, 0, 0))
    {
      sub_100002108(v16, (char *)&unk_10000F046);
    }
    else
    {
      util::stringprintf((util *)"%s.%s.plist", __p, "/AppleInternal/Library/LaunchDaemons/com.apple.jetsamproperties", v23);
      if (v21 >= 0) {
        mach_port_t v0 = __p;
      }
      else {
        mach_port_t v0 = (void **)__p[0];
      }
      if (!access((const char *)v0, 0)) {
        goto LABEL_17;
      }
      util::stringprintf((util *)"%s.%s.plist", object, "/System/Library/LaunchDaemons/com.apple.jetsamproperties", v23);
      if (SHIBYTE(v21) < 0) {
        operator delete(__p[0]);
      }
      *(_OWORD *)__p = *(_OWORD *)object;
      uint64_t v21 = v19;
      int v1 = v19 >= 0 ? (const char *)__p : (const char *)object[0];
      if (access(v1, 0))
      {
        sub_100002108(v16, (char *)&unk_10000F046);
        if (SHIBYTE(v21) < 0) {
          operator delete(__p[0]);
        }
      }
      else
      {
LABEL_17:
        *(_OWORD *)v16 = *(_OWORD *)__p;
        uint64_t v17 = v21;
      }
    }
  }
  else
  {
    sub_100002108(v16, "/System/Library/LaunchDaemons/com.apple.jetsamproperties.NonUI.plist");
  }
  if (v17 >= 0) {
    unsigned int v2 = v16;
  }
  else {
    unsigned int v2 = (void **)v16[0];
  }
  util::MappedFile::MappedFile((util::MappedFile *)v23, (const char *)v2);
  if (!v23[1] || v23[0])
  {
    size_t v4 = (void *)xpc_create_from_plist();
    __p[0] = v4;
    if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_object_t value = xpc_dictionary_get_value(__p[0], "Version4");
      size_t v22 = (size_t)value;
      if (value)
      {
        xpc_retain(value);
        io_object_t v6 = (void *)v22;
      }
      else
      {
        io_object_t v6 = 0;
      }
      object[0] = v6;
      size_t v22 = 0;
      sub_10000274C((void **)&v22);
      if (object[0] && xpc_get_type(object[0]) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_object_t v7 = xpc_dictionary_get_value(object[0], "System");
        xpc_object_t xdict = v7;
        if (v7)
        {
          xpc_retain(v7);
          xpc_object_t v8 = xdict;
        }
        else
        {
          xpc_object_t v8 = 0;
        }
        size_t v22 = (size_t)v8;
        xpc_object_t xdict = 0;
        sub_10000274C(&xdict);
        if (v22 && xpc_get_type((xpc_object_t)v22) == (xpc_type_t)&_xpc_type_dictionary)
        {
          xpc_object_t v9 = xpc_dictionary_get_value((xpc_object_t)v22, "Override");
          xpc_object_t v14 = v9;
          if (v9)
          {
            xpc_retain(v9);
            xpc_object_t v10 = v14;
          }
          else
          {
            xpc_object_t v10 = 0;
          }
          xpc_object_t v14 = 0;
          xpc_object_t xdict = v10;
          sub_10000274C(&v14);
          if (xdict && xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary)
          {
            xpc_object_t v11 = xpc_dictionary_get_value(xdict, "Global");
            uint64_t v3 = (uint64_t)v11;
            posix_spawn_file_actions_t v13 = v11;
            if (v11)
            {
              xpc_retain(v11);
              posix_spawn_file_actions_t v13 = 0;
              xpc_object_t v14 = (xpc_object_t)v3;
              sub_10000274C(&v13);
              if (xpc_get_type((xpc_object_t)v3) == (xpc_type_t)&_xpc_type_dictionary)
              {
                qword_100014068 = xpc_dictionary_get_int64(v14, "UserReclaimableLimit");
                qword_100014070 = xpc_dictionary_get_int64(v14, "KernelHighWaterMark");
                qword_100014078 = xpc_dictionary_get_int64(v14, "DarkBootSystemUIHardLimit");
                uint64_t v3 = 1;
              }
              else
              {
                uint64_t v3 = 0;
              }
            }
            else
            {
              posix_spawn_file_actions_t v13 = 0;
              xpc_object_t v14 = 0;
              sub_10000274C(&v13);
            }
            sub_10000274C(&v14);
          }
          else
          {
            uint64_t v3 = 0;
          }
          sub_10000274C(&xdict);
        }
        else
        {
          uint64_t v3 = 0;
        }
        sub_10000274C((void **)&v22);
      }
      else
      {
        uint64_t v3 = 0;
      }
      sub_10000274C(object);
    }
    else
    {
      uint64_t v3 = 0;
    }
    sub_10000274C(__p);
  }
  else
  {
    uint64_t v3 = 0;
  }
  util::MappedFile::~MappedFile((util::MappedFile *)v23);
  if (SHIBYTE(v17) < 0) {
    operator delete(v16[0]);
  }
  return v3;
}

void sub_10000268C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  sub_10000274C(&a13);
  sub_10000274C(&a14);
  sub_10000274C((void **)(v29 - 64));
  sub_10000274C(&a21);
  sub_10000274C((void **)&a24);
  util::MappedFile::~MappedFile((util::MappedFile *)(v29 - 56));
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_100002738(void *a1)
{
}

void **sub_10000274C(void **a1)
{
  unsigned int v2 = *a1;
  if (v2) {
    xpc_release(v2);
  }
  return a1;
}

FILE *sub_100002780@<X0>(_OWORD *a1@<X8>)
{
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  size_t result = fopen("/private/var/mobile/Library/MemoryMaintenance/system_hwm", "r");
  if (result)
  {
    uint64_t v3 = result;
    fgets(v6, 256, result);
    int v4 = sscanf(v6, "perform_u_reboot=%llu uhwm_level=%llu uhwm_limit=%llu perform_k_reboot=%llu khwm_level=%llu khwm_limit=%llu\n", a1, (char *)a1 + 8, a1 + 1, (char *)a1 + 24, a1 + 2, (char *)a1 + 40);
    int v5 = ferror(v3);
    if (v4 != 6 || v5)
    {
      a1[1] = 0u;
      a1[2] = 0u;
      *a1 = 0u;
    }
    return (FILE *)fclose(v3);
  }
  return result;
}

FILE *sub_100002870(void *a1)
{
  size_t result = fopen("/private/var/mobile/Library/MemoryMaintenance/system_hwm", "w");
  if (result)
  {
    uint64_t v3 = result;
    fprintf(result, "perform_u_reboot=%llu uhwm_level=%llu uhwm_limit=%llu perform_k_reboot=%llu khwm_level=%llu khwm_limit=%llu\n", *a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
    int v4 = ferror(v3);
    fclose(v3);
    if (v4)
    {
      return 0;
    }
    else
    {
      sync();
      return (FILE *)1;
    }
  }
  return result;
}

FILE *sub_1000028F8(unsigned int a1, uint64_t a2, uint64_t a3)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  sub_100002780(&v8);
  *((void *)&v9 + 1) = a1;
  *(void *)&long long v10 = a2;
  *((void *)&v10 + 1) = a3;
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  return sub_100002870(v7);
}

void *sub_100002968(void *result, char *a2, char *a3, unint64_t a4)
{
  int v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000021BC();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    size_t result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *int v4 = result;
    int v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)int v4 = v10;
    int v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)int v4 = 0;
  return result;
}

uint64_t sub_100002A10(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = a2;
  for (uint64_t i = (const char *)(a1 + 96); ; i += 176)
  {
    size_t v6 = strlen(i);
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    char v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    unsigned __int8 v18 = 0;
    char v19 = 0;
    uint64_t v20 = 0;
    *(_OWORD *)__p = 0u;
    memset(v12, 0, sizeof(v12));
    int v7 = sub_100002FC8(a3, (uint64_t)i, (uint64_t)&i[v6], (uint64_t)__p, 4160);
    int v8 = v18;
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    int v9 = v8 ? 0 : v7;
    if (v9 == 1) {
      break;
    }
    if (!--v4) {
      return 0;
    }
  }
  return *((void *)i - 10);
}

void sub_100002AEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100002B08(void *a1)
{
  size_t v11 = 4;
  if (sysctlbyname("kern.memorystatus_level", a1, &v11, 0, 0))
  {
    uint64_t v1 = 1;
    fwrite("pressure: could not retrieve memory level\n", 0x2AuLL, 1uLL, __stderrp);
  }
  else
  {
    mach_zone_name_array_t names = 0;
    mach_msg_type_number_t namesCnt = 0;
    mach_zone_info_array_t info = 0;
    mach_msg_type_number_t infoCnt = 0;
    mach_memory_info_array_t memory_info = 0;
    mach_msg_type_number_t memory_infoCnt = 0;
    mach_port_t v2 = mach_host_self();
    if (!mach_memory_info(v2, &names, &namesCnt, &info, &infoCnt, &memory_info, &memory_infoCnt)) {
      sub_100005FF4(&v4, "com.apple.driver.AppleH[0-9]+CameraInterface.NonPersistent", 0);
    }
    fwrite("pressure: could not retrieve zone memory info\n", 0x2EuLL, 1uLL, __stderrp);
    return 0;
  }
  return v1;
}

void sub_100002EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::locale a17)
{
}

void sub_100002F14(std::locale *this)
{
  locale = (std::__shared_weak_count *)this[6].__locale_;
  if (locale) {
    sub_100002F54(locale);
  }

  std::locale::~locale(this);
}

void sub_100002F54(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t sub_100002FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if ((a5 & 0x80) != 0) {
    int v9 = a5 & 0xFFA;
  }
  else {
    int v9 = a5;
  }
  sub_1000031A4(a4, *(_DWORD *)(a1 + 28) + 1, a2, a3, (unsigned __int16)(v9 & 0x800) >> 11);
  if (sub_100003218(a1, a2, a3, (uint64_t *)a4, v9, (v9 & 0x800) == 0))
  {
    if (*(void *)(a4 + 8) == *(void *)a4) {
      char v10 = (uint64_t *)(a4 + 24);
    }
    else {
      char v10 = *(uint64_t **)a4;
    }
LABEL_8:
    uint64_t v11 = *v10;
    *(void *)(a4 + 56) = *v10;
    *(unsigned char *)(a4 + 64) = *(void *)(a4 + 48) != v11;
    uint64_t v12 = v10[1];
    *(void *)(a4 + 72) = v12;
    *(unsigned char *)(a4 + 88) = v12 != *(void *)(a4 + 80);
    return 1;
  }
  if (a2 != a3 && (v9 & 0x40) == 0)
  {
    int v14 = v9 | 0x80;
    uint64_t v15 = a2 + 1;
    if (v15 != a3)
    {
      while (1)
      {
        sub_100003238((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3), (long long *)(a4 + 24));
        int v16 = sub_100003218(a1, v15, a3, (uint64_t *)a4, v14, 0);
        uint64_t v18 = *(void *)a4;
        uint64_t v17 = *(void *)(a4 + 8);
        if (v16) {
          break;
        }
        sub_100003238((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((v17 - v18) >> 3), (long long *)(a4 + 24));
        if (++v15 == a3) {
          goto LABEL_14;
        }
      }
      if (v17 == v18) {
        char v10 = (uint64_t *)(a4 + 24);
      }
      else {
        char v10 = *(uint64_t **)a4;
      }
      goto LABEL_8;
    }
LABEL_14:
    sub_100003238((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3), (long long *)(a4 + 24));
    if (sub_100003218(a1, a3, a3, (uint64_t *)a4, v14, 0))
    {
      if (*(void *)(a4 + 8) == *(void *)a4) {
        char v10 = (uint64_t *)(a4 + 24);
      }
      else {
        char v10 = *(uint64_t **)a4;
      }
      goto LABEL_8;
    }
  }
  uint64_t result = 0;
  *(void *)(a4 + 8) = *(void *)a4;
  return result;
}

char *sub_1000031A4(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(a1 + 24) = a4;
  int v8 = (_OWORD *)(a1 + 24);
  *(void *)(a1 + 32) = a4;
  *(unsigned char *)(a1 + 40) = 0;
  uint64_t result = sub_100003238((char **)a1, a2, (long long *)(a1 + 24));
  *(void *)(a1 + 48) = a3;
  *(void *)(a1 + 56) = a3;
  *(unsigned char *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 72) = *v8;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a1 + 40);
  if ((a5 & 1) == 0) {
    *(void *)(a1 + 104) = a3;
  }
  *(unsigned char *)(a1 + 96) = 1;
  return result;
}

uint64_t sub_100003218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0) {
    return sub_1000033B0(a1, a2, a3, a4, a5, a6);
  }
  if (*(_DWORD *)(a1 + 28)) {
    return sub_100003DA0(a1, a2, a3, a4, a5, a6);
  }
  return sub_100003804(a1, a2, a3, a4, a5, a6);
}

char *sub_100003238(char **a1, unint64_t a2, long long *a3)
{
  uint64_t v6 = (uint64_t)a1[2];
  uint64_t result = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (uint64_t)result) >> 3) >= a2)
  {
    uint64_t v15 = a1[1];
    unint64_t v16 = (v15 - result) / 24;
    if (v16 >= a2) {
      uint64_t v17 = a2;
    }
    else {
      uint64_t v17 = (v15 - result) / 24;
    }
    if (v17)
    {
      uint64_t v18 = result;
      do
      {
        *(_OWORD *)uint64_t v18 = *a3;
        v18[16] = *((unsigned char *)a3 + 16);
        v18 += 24;
        --v17;
      }
      while (v17);
    }
    if (a2 <= v16)
    {
      a1[1] = &result[24 * a2];
    }
    else
    {
      char v19 = &v15[24 * (a2 - v16)];
      uint64_t v20 = 24 * a2 - 24 * v16;
      do
      {
        long long v21 = *a3;
        *((void *)v15 + 2) = *((void *)a3 + 2);
        *(_OWORD *)uint64_t v15 = v21;
        v15 += 24;
        v20 -= 24;
      }
      while (v20);
      a1[1] = v19;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_100004670();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
    uint64_t v9 = 2 * v8;
    if (2 * v8 <= a2) {
      uint64_t v9 = a2;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v9;
    }
    uint64_t result = sub_100004BE0(a1, v10);
    uint64_t v11 = a1[1];
    uint64_t v12 = &v11[24 * a2];
    uint64_t v13 = 24 * a2;
    do
    {
      long long v14 = *a3;
      *((void *)v11 + 2) = *((void *)a3 + 2);
      *(_OWORD *)uint64_t v11 = v14;
      v11 += 24;
      v13 -= 24;
    }
    while (v13);
    a1[1] = v12;
  }
  return result;
}

uint64_t sub_1000033B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  v45 = 0;
  v46 = 0;
  unint64_t v47 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(void *)&long long v43 = a3;
    *((void *)&v43 + 1) = a3;
    char v44 = 0;
    *(_DWORD *)v40 = 0;
    memset(&v40[8], 0, 48);
    *(_OWORD *)__p = 0u;
    memset(v42, 0, 21);
    v46 = (_OWORD *)sub_1000044A8((uint64_t *)&v45, (uint64_t)v40);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(void *)&v40[32])
    {
      *(void *)&v40[40] = *(void *)&v40[32];
      operator delete(*(void **)&v40[32]);
    }
    v38 = a4;
    uint64_t v13 = v46;
    *((_DWORD *)v46 - 24) = 0;
    *((void *)v13 - 11) = a2;
    *((void *)v13 - 10) = a2;
    *((void *)v13 - 9) = a3;
    sub_10000438C((uint64_t)(v13 - 4), *(unsigned int *)(a1 + 28), &v43);
    sub_1000043C8((uint64_t)v46 - 40, *(unsigned int *)(a1 + 32));
    long long v14 = v46;
    *((void *)v46 - 2) = v6;
    uint64_t v39 = a3;
    signed int v15 = a3 - a2;
    *((_DWORD *)v14 - 2) = a5;
    *((unsigned char *)v14 - 4) = a6;
    unsigned int v16 = 1;
    while (2)
    {
      if ((v16 & 0xFFF) != 0 || (int)(v16 >> 12) < v15)
      {
        uint64_t v18 = v14 - 1;
        uint64_t v17 = *((void *)v14 - 2);
        char v19 = v14 - 6;
        if (v17) {
          (*(void (**)(uint64_t, _OWORD *))(*(void *)v17 + 16))(v17, v14 - 6);
        }
        switch(*(_DWORD *)v19)
        {
          case 0xFFFFFC18:
            uint64_t v20 = *((void *)v14 - 10);
            if ((a5 & 0x20) != 0 && v20 == a2 || (a5 & 0x1000) != 0 && v20 != v39) {
              goto LABEL_16;
            }
            uint64_t v29 = *v38;
            *(void *)uint64_t v29 = a2;
            *(void *)(v29 + 8) = v20;
            *(unsigned char *)(v29 + 16) = 1;
            uint64_t v30 = *((void *)v14 - 8);
            uint64_t v31 = *((void *)v14 - 7) - v30;
            if (v31)
            {
              unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * (v31 >> 3);
              v33 = (unsigned char *)(v30 + 16);
              unsigned int v34 = 1;
              do
              {
                uint64_t v35 = v29 + 24 * v34;
                *(_OWORD *)uint64_t v35 = *((_OWORD *)v33 - 1);
                char v36 = *v33;
                v33 += 24;
                *(unsigned char *)(v35 + 16) = v36;
              }
              while (v32 > v34++);
            }
            uint64_t v27 = 1;
            goto LABEL_25;
          case 0xFFFFFC1D:
          case 0xFFFFFC1E:
          case 0xFFFFFC21:
            goto LABEL_23;
          case 0xFFFFFC1F:
LABEL_16:
            long long v21 = v46 - 6;
            sub_100004790((void *)v46 - 12);
            v46 = v21;
            goto LABEL_23;
          case 0xFFFFFC20:
            long long v22 = *(v14 - 5);
            *(_OWORD *)v40 = *v19;
            *(_OWORD *)&v40[16] = v22;
            memset(&v40[32], 0, 24);
            sub_100004B60(&v40[32], *((long long **)v14 - 8), *((long long **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v14 - 7) - *((void *)v14 - 8)) >> 3));
            __p[0] = 0;
            __p[1] = 0;
            v42[0] = 0;
            sub_100004C34((char *)__p, *((long long **)v14 - 5), *((long long **)v14 - 4), (uint64_t)(*((void *)v14 - 4) - *((void *)v14 - 5)) >> 4);
            uint64_t v23 = *v18;
            *(void *)((char *)&v42[1] + 5) = *(void *)((char *)v14 - 11);
            v42[1] = v23;
            (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v18 + 24))(*v18, 1, v14 - 6);
            (*(void (**)(void, void, unsigned char *))(*(void *)v42[1] + 24))(v42[1], 0, v40);
            v24 = v46;
            if ((unint64_t)v46 >= v47)
            {
              v46 = (_OWORD *)sub_1000044A8((uint64_t *)&v45, (uint64_t)v40);
              if (__p[0])
              {
                __p[1] = __p[0];
                operator delete(__p[0]);
              }
            }
            else
            {
              long long v25 = *(_OWORD *)&v40[16];
              _OWORD *v46 = *(_OWORD *)v40;
              v24[1] = v25;
              *((void *)v24 + 4) = 0;
              *((void *)v24 + 5) = 0;
              *((void *)v24 + 6) = 0;
              *((void *)v24 + 7) = 0;
              v24[2] = *(_OWORD *)&v40[32];
              *((void *)v24 + 6) = *(void *)&v40[48];
              memset(&v40[32], 0, 24);
              *((void *)v24 + 8) = 0;
              *((void *)v24 + 9) = 0;
              *(_OWORD *)((char *)v24 + 56) = *(_OWORD *)__p;
              *((void *)v24 + 9) = v42[0];
              __p[0] = 0;
              __p[1] = 0;
              v42[0] = 0;
              uint64_t v26 = v42[1];
              *(void *)((char *)v24 + 85) = *(void *)((char *)&v42[1] + 5);
              *((void *)v24 + 10) = v26;
              v46 = v24 + 6;
            }
            if (*(void *)&v40[32])
            {
              *(void *)&v40[40] = *(void *)&v40[32];
              operator delete(*(void **)&v40[32]);
            }
LABEL_23:
            long long v14 = v46;
            ++v16;
            if (v45 == v46) {
              goto LABEL_24;
            }
            continue;
          default:
            sub_100004450();
        }
      }
      break;
    }
    sub_1000043F8();
  }
LABEL_24:
  uint64_t v27 = 0;
LABEL_25:
  *(void *)v40 = &v45;
  sub_100004CEC((void ***)v40);
  return v27;
}

void sub_100003784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  sub_100004348(&a11);
  a11 = v16 - 112;
  sub_100004CEC((void ***)&a11);
  _Unwind_Resume(a1);
}

uint64_t sub_100003804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  long long v62 = 0u;
  long long v63 = 0u;
  long long v61 = 0u;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(_DWORD *)v57 = 0;
    memset(&v57[8], 0, 32);
    long long v58 = 0uLL;
    *(_OWORD *)__p = 0uLL;
    memset(v60, 0, 21);
    sub_100004D70(&v61, (uint64_t)v57);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v51 = a4;
    if (*(void *)&v57[32])
    {
      *(void *)&long long v58 = *(void *)&v57[32];
      operator delete(*(void **)&v57[32]);
    }
    uint64_t v12 = *((void *)&v61 + 1);
    unint64_t v13 = *((void *)&v63 + 1) + v63 - 1;
    unint64_t v14 = v13 / 0x2A;
    uint64_t v15 = *(void *)(*((void *)&v61 + 1) + 8 * (v13 / 0x2A));
    unint64_t v16 = 3 * (v13 % 0x2A);
    uint64_t v17 = v15 + 32 * v16;
    *(_DWORD *)uint64_t v17 = 0;
    *(void *)(v17 + 8) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 16) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 24) = a3;
    sub_1000043C8(*(void *)(v12 + 8 * v14) + 32 * v16 + 56, *(unsigned int *)(a1 + 32));
    char v55 = 0;
    unsigned int v18 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = a2;
    uint64_t v19 = *((void *)&v63 + 1);
    uint64_t v20 = *((void *)&v61 + 1);
    unint64_t v21 = *((void *)&v63 + 1) + v63 - 1;
    unint64_t v22 = v21 / 0x2A;
    unint64_t v23 = 3 * (v21 % 0x2A);
    *(void *)(*(void *)(*((void *)&v61 + 1) + 8 * v22) + 32 * v23 + 80) = v6;
    uint64_t v24 = a3 - a2;
    uint64_t v25 = *(void *)(v20 + 8 * v22) + 32 * v23;
    *(_DWORD *)(v25 + 88) = a5;
    *(unsigned char *)(v25 + 92) = a6;
    uint64_t v52 = a3;
    while (2)
    {
      if ((++v18 & 0xFFF) == 0 && (int)(v18 >> 12) >= (int)v24) {
        sub_1000043F8();
      }
      unint64_t v27 = v19 + v63 - 1;
      uint64_t v28 = *(void *)(*((void *)&v61 + 1) + 8 * (v27 / 0x2A));
      unint64_t v29 = v27 % 0x2A;
      uint64_t v30 = v28 + 96 * (v27 % 0x2A);
      unint64_t v32 = (void *)(v30 + 80);
      uint64_t v31 = *(void *)(v30 + 80);
      if (v31) {
        (*(void (**)(uint64_t, unint64_t))(*(void *)v31 + 16))(v31, v28 + 96 * v29);
      }
      switch(*(_DWORD *)v30)
      {
        case 0xFFFFFC18:
          uint64_t v33 = *(void *)(v28 + 96 * v29 + 16);
          BOOL v35 = (a5 & 0x1000) == 0 || v33 == v52;
          BOOL v36 = v33 != v54 || (a5 & 0x20) == 0;
          if (!v36 || !v35) {
            goto LABEL_37;
          }
          uint64_t v37 = v33 - *(void *)(v28 + 96 * v29 + 8);
          uint64_t v38 = v53;
          if ((v55 & (v53 >= v37)) == 0) {
            uint64_t v38 = v37;
          }
          if (v38 != v24)
          {
            uint64_t v53 = v38;
            sub_100004E74(&v61);
            char v55 = 1;
            goto LABEL_38;
          }
          uint64_t v39 = (void **)*((void *)&v61 + 1);
          uint64_t v40 = v62;
          if ((void)v62 == *((void *)&v61 + 1))
          {
            uint64_t v40 = *((void *)&v61 + 1);
          }
          else
          {
            v41 = (void *)(*((void *)&v61 + 1) + 8 * ((unint64_t)v63 / 0x2A));
            v42 = (void *)(*v41 + 96 * ((unint64_t)v63 % 0x2A));
            unint64_t v43 = *(void *)(*((void *)&v61 + 1) + 8 * ((*((void *)&v63 + 1) + (void)v63) / 0x2AuLL))
                + 96 * ((*((void *)&v63 + 1) + (void)v63) % 0x2AuLL);
            if (v42 != (void *)v43)
            {
              do
              {
                sub_100004790(v42);
                v42 += 12;
                if ((void *)((char *)v42 - *v41) == (void *)4032)
                {
                  char v44 = (void *)v41[1];
                  ++v41;
                  v42 = v44;
                }
              }
              while (v42 != (void *)v43);
              uint64_t v39 = (void **)*((void *)&v61 + 1);
              uint64_t v40 = v62;
            }
          }
          *((void *)&v63 + 1) = 0;
          unint64_t v47 = v40 - (void)v39;
          if (v47 >= 0x11)
          {
            do
            {
              operator delete(*v39);
              uint64_t v39 = (void **)(*((void *)&v61 + 1) + 8);
              *((void *)&v61 + 1) = v39;
              unint64_t v47 = v62 - (void)v39;
            }
            while ((void)v62 - (void)v39 > 0x10uLL);
          }
          if (v47 >> 3 == 1)
          {
            uint64_t v48 = 21;
          }
          else
          {
            if (v47 >> 3 != 2) {
              goto LABEL_53;
            }
            uint64_t v48 = 42;
          }
          *(void *)&long long v63 = v48;
LABEL_53:
          char v55 = 1;
          uint64_t v53 = v24;
LABEL_38:
          uint64_t v19 = *((void *)&v63 + 1);
          if (*((void *)&v63 + 1)) {
            continue;
          }
          if (v55)
          {
            uint64_t v49 = *v51;
            *(void *)uint64_t v49 = v54;
            *(void *)(v49 + 8) = v54 + v53;
            uint64_t v6 = 1;
            *(unsigned char *)(v49 + 16) = 1;
          }
          else
          {
            uint64_t v6 = 0;
          }
          break;
        case 0xFFFFFC19:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_38;
        case 0xFFFFFC1D:
          sub_100004EFC((uint64_t)&v61, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          sub_100004E74(&v61);
          goto LABEL_38;
        case 0xFFFFFC20:
          long long v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)v57 = *(_OWORD *)v30;
          *(_OWORD *)&v57[16] = v45;
          long long v58 = 0uLL;
          *(void *)&v57[32] = 0;
          sub_100004B60(&v57[32], *(long long **)(v28 + 96 * v29 + 32), *(long long **)(v28 + 96 * v29 + 40), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v28 + 96 * v29 + 40) - *(void *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v60[0] = 0;
          sub_100004C34((char *)__p, *(long long **)(v28 + 96 * v29 + 56), *(long long **)(v28 + 96 * v29 + 64), (uint64_t)(*(void *)(v28 + 96 * v29 + 64) - *(void *)(v28 + 96 * v29 + 56)) >> 4);
          uint64_t v46 = *v32;
          *(void *)((char *)&v60[1] + 5) = *(void *)(v30 + 85);
          v60[1] = v46;
          (*(void (**)(void, uint64_t, unint64_t))(*(void *)*v32 + 24))(*v32, 1, v28 + 96 * v29);
          (*(void (**)(void, void, unsigned char *))(*(void *)v60[1] + 24))(v60[1], 0, v57);
          sub_100004D70(&v61, (uint64_t)v57);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (*(void *)&v57[32])
          {
            *(void *)&long long v58 = *(void *)&v57[32];
            operator delete(*(void **)&v57[32]);
          }
          goto LABEL_38;
        default:
          sub_100004450();
      }
      break;
    }
  }
  sub_100005B40(&v61);
  return v6;
}

void sub_100003D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
}

uint64_t sub_100003DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  v56 = 0;
  v57 = 0;
  unint64_t v58 = 0;
  *(_DWORD *)uint64_t v53 = 0;
  memset(&v53[8], 0, 32);
  long long v54 = 0u;
  memset(v55, 0, 37);
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6) {
    goto LABEL_43;
  }
  *(void *)&long long v51 = a3;
  *((void *)&v51 + 1) = a3;
  char v52 = 0;
  *(_DWORD *)uint64_t v48 = 0;
  memset(&v48[8], 0, 48);
  *(_OWORD *)__p = 0uLL;
  memset(v50, 0, 21);
  v57 = (_OWORD *)sub_1000044A8((uint64_t *)&v56, (uint64_t)v48);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (*(void *)&v48[32])
  {
    *(void *)&v48[40] = *(void *)&v48[32];
    operator delete(*(void **)&v48[32]);
  }
  char v44 = a4;
  uint64_t v12 = v57;
  *((_DWORD *)v57 - 24) = 0;
  *((void *)v12 - 11) = a2;
  *((void *)v12 - 10) = a2;
  *((void *)v12 - 9) = a3;
  sub_10000438C((uint64_t)(v12 - 4), *(unsigned int *)(a1 + 28), &v51);
  sub_1000043C8((uint64_t)v57 - 40, *(unsigned int *)(a1 + 32));
  uint64_t v45 = a3;
  uint64_t v46 = 0;
  char v13 = 0;
  unsigned int v14 = 0;
  uint64_t v15 = a3 - a2;
  unint64_t v16 = v57;
  *((void *)v57 - 2) = v6;
  *((_DWORD *)v16 - 2) = a5;
  *((unsigned char *)v16 - 4) = a6;
  do
  {
    BOOL v17 = (++v14 & 0xFFF) != 0 || (int)(v14 >> 12) < (int)v15;
    if (!v17) {
      sub_1000043F8();
    }
    uint64_t v19 = v16 - 1;
    uint64_t v18 = *((void *)v16 - 2);
    uint64_t v20 = v16 - 6;
    if (v18) {
      (*(void (**)(uint64_t, _OWORD *))(*(void *)v18 + 16))(v18, v16 - 6);
    }
    switch(*(_DWORD *)v20)
    {
      case 0xFFFFFC18:
        uint64_t v21 = *((void *)v16 - 10);
        if ((a5 & 0x20) != 0 && v21 == a2 || (a5 & 0x1000) != 0 && v21 != v45) {
          goto LABEL_19;
        }
        char v28 = v13;
        uint64_t v29 = v21 - *((void *)v16 - 11);
        uint64_t v30 = v46;
        if ((v28 & (v46 >= v29)) == 0)
        {
          long long v31 = *(v16 - 5);
          *(_OWORD *)uint64_t v53 = *(_OWORD *)v20;
          *(_OWORD *)&v53[16] = v31;
          if (v53 != v20)
          {
            sub_100005CEC(&v53[32], *((long long **)v16 - 8), *((long long **)v16 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v16 - 7) - *((void *)v16 - 8)) >> 3));
            sub_100005EA4(v55, *((uint64_t **)v16 - 5), *((uint64_t **)v16 - 4), (uint64_t)(*((void *)v16 - 4) - *((void *)v16 - 5)) >> 4);
          }
          unint64_t v32 = (void *)*v19;
          *(void **)((char *)&v55[3] + 5) = *(void **)((char *)v16 - 11);
          v55[3] = v32;
          uint64_t v30 = v29;
        }
        uint64_t v33 = v57;
        if (v30 == v15)
        {
          uint64_t v34 = (uint64_t)v56;
          while (v33 != (void *)v34)
          {
            v33 -= 12;
            sub_100004790(v33);
          }
          v57 = (_OWORD *)v34;
          char v13 = 1;
          uint64_t v46 = v15;
        }
        else
        {
          uint64_t v46 = v30;
          BOOL v35 = v57 - 6;
          sub_100004790((void *)v57 - 12);
          v57 = v35;
          char v13 = 1;
        }
        break;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        break;
      case 0xFFFFFC1F:
LABEL_19:
        unint64_t v22 = v57 - 6;
        sub_100004790((void *)v57 - 12);
        v57 = v22;
        break;
      case 0xFFFFFC20:
        long long v23 = *(v16 - 5);
        *(_OWORD *)uint64_t v48 = *(_OWORD *)v20;
        *(_OWORD *)&v48[16] = v23;
        memset(&v48[32], 0, 24);
        sub_100004B60(&v48[32], *((long long **)v16 - 8), *((long long **)v16 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v16 - 7) - *((void *)v16 - 8)) >> 3));
        __p[0] = 0;
        __p[1] = 0;
        v50[0] = 0;
        sub_100004C34((char *)__p, *((long long **)v16 - 5), *((long long **)v16 - 4), (uint64_t)(*((void *)v16 - 4) - *((void *)v16 - 5)) >> 4);
        uint64_t v24 = (void *)*v19;
        *(void *)((char *)&v50[1] + 5) = *(void *)((char *)v16 - 11);
        v50[1] = v24;
        (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v19 + 24))(*v19, 1, v16 - 6);
        (*(void (**)(void, void, unsigned char *))(*(void *)v50[1] + 24))(v50[1], 0, v48);
        uint64_t v25 = v57;
        if ((unint64_t)v57 >= v58)
        {
          v57 = (_OWORD *)sub_1000044A8((uint64_t *)&v56, (uint64_t)v48);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v26 = *(_OWORD *)&v48[16];
          _OWORD *v57 = *(_OWORD *)v48;
          v25[1] = v26;
          *((void *)v25 + 4) = 0;
          *((void *)v25 + 5) = 0;
          *((void *)v25 + 6) = 0;
          *((void *)v25 + 7) = 0;
          v25[2] = *(_OWORD *)&v48[32];
          *((void *)v25 + 6) = *(void *)&v48[48];
          memset(&v48[32], 0, 24);
          *((void *)v25 + 8) = 0;
          *((void *)v25 + 9) = 0;
          *(_OWORD *)((char *)v25 + 56) = *(_OWORD *)__p;
          *((void *)v25 + 9) = v50[0];
          __p[0] = 0;
          __p[1] = 0;
          v50[0] = 0;
          uint64_t v27 = v50[1];
          *(void *)((char *)v25 + 85) = *(void *)((char *)&v50[1] + 5);
          *((void *)v25 + 10) = v27;
          v57 = v25 + 6;
        }
        if (*(void *)&v48[32])
        {
          *(void *)&v48[40] = *(void *)&v48[32];
          operator delete(*(void **)&v48[32]);
        }
        break;
      default:
        sub_100004450();
    }
    unint64_t v16 = v57;
  }
  while (v56 != v57);
  if (v13)
  {
    uint64_t v36 = *v44;
    *(void *)uint64_t v36 = a2;
    *(void *)(v36 + 8) = a2 + v46;
    *(unsigned char *)(v36 + 16) = 1;
    if ((void)v54 != *(void *)&v53[32])
    {
      unint64_t v37 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v54 - *(void *)&v53[32]) >> 3);
      uint64_t v38 = (unsigned char *)(*(void *)&v53[32] + 16);
      unsigned int v39 = 1;
      do
      {
        uint64_t v40 = v36 + 24 * v39;
        *(_OWORD *)uint64_t v40 = *((_OWORD *)v38 - 1);
        char v41 = *v38;
        v38 += 24;
        *(unsigned char *)(v40 + 16) = v41;
        BOOL v17 = v37 > v39++;
      }
      while (v17);
    }
    uint64_t v42 = 1;
  }
  else
  {
LABEL_43:
    uint64_t v42 = 0;
  }
  if (v55[0])
  {
    v55[1] = v55[0];
    operator delete(v55[0]);
  }
  if (*(void *)&v53[32])
  {
    *(void *)&long long v54 = *(void *)&v53[32];
    operator delete(*(void **)&v53[32]);
  }
  *(void *)uint64_t v53 = &v56;
  sub_100004CEC((void ***)v53);
  return v42;
}

void sub_1000042C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  sub_100004348(&a17);
  sub_100004348(&a33);
  a33 = v33 - 120;
  sub_100004CEC((void ***)&a33);
  _Unwind_Resume(a1);
}

void *sub_100004348(void *a1)
{
  mach_port_t v2 = (void *)a1[7];
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
  return a1;
}

void sub_10000438C(uint64_t a1, unint64_t a2, long long *a3)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v4 = a2 >= v3;
  unint64_t v5 = a2 - v3;
  if (v5 != 0 && v4)
  {
    sub_100004838((void **)a1, v5, a3);
  }
  else if (!v4)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }
}

void sub_1000043C8(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 16 * a2;
    }
  }
  else
  {
    sub_100004A08((void **)a1, a2 - v2);
  }
}

void sub_1000043F8()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_complexity);
}

void sub_10000443C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100004450()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_unknown);
}

void sub_100004494(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000044A8(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL) {
    sub_100004670();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x155555555555555) {
    unint64_t v9 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  v16[4] = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)sub_100004688(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  uint64_t v11 = &v10[96 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[96 * v9];
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v11 = *(_OWORD *)a2;
  *((_OWORD *)v11 + 1) = v12;
  *((void *)v11 + 5) = 0;
  *((void *)v11 + 6) = 0;
  *((void *)v11 + 4) = 0;
  *((_OWORD *)v11 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v11 + 6) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *((void *)v11 + 7) = 0;
  *((void *)v11 + 8) = 0;
  *((void *)v11 + 9) = 0;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 56);
  *((void *)v11 + 9) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v13 = *(void *)(a2 + 80);
  *(void *)(v11 + 85) = *(void *)(a2 + 85);
  *((void *)v11 + 10) = v13;
  v16[2] = v11 + 96;
  sub_1000045F8(a1, v16);
  uint64_t v14 = a1[1];
  sub_1000047E8((uint64_t)v16);
  return v14;
}

void sub_1000045E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1000047E8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1000045F8(uint64_t *a1, void *a2)
{
  sub_100004704((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  uint64_t v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  uint64_t v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  uint64_t v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void sub_100004670()
{
}

void *sub_100004688(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL) {
    sub_1000046D0();
  }
  return operator new(96 * a2);
}

void sub_1000046D0()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

__n128 sub_100004704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 != a5)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = a7 + v7;
      uint64_t v9 = a3 + v7;
      long long v10 = *(_OWORD *)(a3 + v7 - 80);
      *(_OWORD *)(v8 - 96) = *(_OWORD *)(a3 + v7 - 96);
      *(_OWORD *)(v8 - 80) = v10;
      *(void *)(v8 - 56) = 0;
      *(void *)(v8 - 48) = 0;
      *(void *)(v8 - 64) = 0;
      *(_OWORD *)(v8 - 64) = *(_OWORD *)(a3 + v7 - 64);
      *(void *)(v8 - 48) = *(void *)(a3 + v7 - 48);
      *(void *)(v9 - 64) = 0;
      *(void *)(v9 - 56) = 0;
      *(void *)(v9 - 48) = 0;
      *(void *)(v8 - 40) = 0;
      *(void *)(v8 - 32) = 0;
      *(void *)(v8 - 24) = 0;
      __n128 result = *(__n128 *)(a3 + v7 - 40);
      *(__n128 *)(v8 - 40) = result;
      *(void *)(v8 - 24) = *(void *)(a3 + v7 - 24);
      *(void *)(v9 - 40) = 0;
      *(void *)(v9 - 32) = 0;
      *(void *)(v9 - 24) = 0;
      uint64_t v12 = *(void *)(a3 + v7 - 16);
      *(void *)(v8 - 11) = *(void *)(a3 + v7 - 11);
      *(void *)(v8 - 16) = v12;
      v7 -= 96;
    }
    while (a3 + v7 != a5);
  }
  return result;
}

void sub_100004790(void *a1)
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
}

uint64_t sub_1000047E8(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 96;
    sub_100004790((void *)(i - 96));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_100004838(void **a1, unint64_t a2, long long *a3)
{
  uint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  uint64_t v9 = *(void **)(v6 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (unsigned char *)v9) >> 3) >= a2)
  {
    if (a2)
    {
      uint64_t v15 = &v9[3 * a2];
      uint64_t v16 = 24 * a2;
      do
      {
        long long v17 = *a3;
        v9[2] = *((void *)a3 + 2);
        *(_OWORD *)uint64_t v9 = v17;
        v9 += 3;
        v16 -= 24;
      }
      while (v16);
      uint64_t v9 = v15;
    }
    a1[1] = v9;
  }
  else
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (unsigned char *)*a1) >> 3);
    unint64_t v11 = v10 + a2;
    if (v10 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_100004670();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (unsigned char *)*a1) >> 3);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x555555555555555) {
      unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13) {
      uint64_t v14 = (char *)sub_1000049C0(v6, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v18 = &v14[24 * v10];
    uint64_t v19 = &v18[24 * a2];
    uint64_t v20 = 24 * a2;
    uint64_t v21 = v18;
    do
    {
      long long v22 = *a3;
      *((void *)v21 + 2) = *((void *)a3 + 2);
      *(_OWORD *)uint64_t v21 = v22;
      v21 += 24;
      v20 -= 24;
    }
    while (v20);
    long long v23 = &v14[24 * v13];
    uint64_t v25 = (char *)*a1;
    uint64_t v24 = (char *)a1[1];
    if (v24 != *a1)
    {
      do
      {
        long long v26 = *(_OWORD *)(v24 - 24);
        *((void *)v18 - 1) = *((void *)v24 - 1);
        *(_OWORD *)(v18 - 24) = v26;
        v18 -= 24;
        v24 -= 24;
      }
      while (v24 != v25);
      uint64_t v24 = (char *)*a1;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v23;
    if (v24)
    {
      operator delete(v24);
    }
  }
}

void *sub_1000049C0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_1000046D0();
  }
  return operator new(24 * a2);
}

void sub_100004A08(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 4);
    if (v9 >> 60) {
      sub_100004670();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      unint64_t v13 = (char *)sub_100004B28(v4, v12);
    }
    else {
      unint64_t v13 = 0;
    }
    uint64_t v14 = &v13[16 * v10];
    uint64_t v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    uint64_t v16 = &v14[16 * a2];
    uint64_t v18 = (char *)*a1;
    long long v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
        v14 -= 16;
        v17 -= 16;
      }
      while (v17 != v18);
      long long v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

void *sub_100004B28(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_1000046D0();
  }
  return operator new(16 * a2);
}

char *sub_100004B60(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = sub_100004BE0(result, a4);
    uint64_t v7 = *((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2;
      *(void *)(v7 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v7 = v8;
      v7 += 24;
      a2 = (long long *)((char *)a2 + 24);
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_100004BC4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100004BE0(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100004670();
  }
  __n128 result = (char *)sub_1000049C0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

char *sub_100004C34(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = sub_100004CA8(result, a4);
    uint64_t v7 = (_OWORD *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2++;
      *v7++ = v8;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_100004C8C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100004CA8(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_100004670();
  }
  __n128 result = (char *)sub_100004B28((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void sub_100004CEC(void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        sub_100004790(v4);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

__n128 sub_100004D70(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 42 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    sub_100004FF0(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  unint64_t v8 = *(void *)(v5 + 8 * (v7 / 0x2A)) + 96 * (v7 % 0x2A);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v9;
  *(void *)(v8 + 40) = 0;
  *(void *)(v8 + 48) = 0;
  *(void *)(v8 + 32) = 0;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(v8 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(v8 + 56) = 0;
  *(void *)(v8 + 64) = 0;
  *(void *)(v8 + 72) = 0;
  __n128 result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v8 + 56) = result;
  *(void *)(v8 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(v8 + 85) = *(void *)(a2 + 85);
  *(void *)(v8 + 80) = v11;
  ++a1[5];
  return result;
}

uint64_t sub_100004E74(void *a1)
{
  unint64_t v2 = a1[5] + a1[4] - 1;
  sub_100004790((void *)(*(void *)(a1[1] + 8 * (v2 / 0x2A)) + 96 * (v2 % 0x2A)));
  --a1[5];

  return sub_1000057AC(a1, 1);
}

int64x2_t sub_100004EFC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    sub_100005824((void **)a1);
    unint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = (void *)(v5 + 8 * (v4 / 0x2A));
  uint64_t v7 = *v6 + 96 * (v4 % 0x2A);
  if (*(void *)(a1 + 16) == v5) {
    uint64_t v7 = 0;
  }
  if (v7 == *v6) {
    uint64_t v7 = *(v6 - 1) + 4032;
  }
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 - 96) = *(_OWORD *)a2;
  *(_OWORD *)(v7 - 80) = v8;
  *(void *)(v7 - 56) = 0;
  *(void *)(v7 - 48) = 0;
  *(void *)(v7 - 64) = 0;
  *(_OWORD *)(v7 - 64) = *(_OWORD *)(a2 + 32);
  *(void *)(v7 - 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(v7 - 40) = 0;
  *(void *)(v7 - 32) = 0;
  *(void *)(v7 - 24) = 0;
  *(_OWORD *)(v7 - 40) = *(_OWORD *)(a2 + 56);
  *(void *)(v7 - 24) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(v7 - 11) = *(void *)(a2 + 85);
  *(void *)(v7 - 16) = v9;
  int64x2_t result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_10000F630);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void sub_100004FF0(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x2A;
  unint64_t v4 = v2 - 42;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    long long v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)long long v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)sub_100005774(v5, v33);
      BOOL v35 = &v34[8 * (v33 >> 2)];
      unint64_t v37 = &v34[8 * v36];
      uint64_t v38 = (uint64_t *)a1[1];
      long long v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        long long v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        char v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)char v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    long long v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0xFC0uLL);
      sub_100005308(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0xFC0uLL);
    sub_100005420((uint64_t)a1, &v54);
    char v44 = (void *)a1[1];
    long long v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)sub_100005774((uint64_t)(a1 + 3), v46);
      BOOL v35 = &v34[8 * (v46 >> 2)];
      unint64_t v37 = &v34[8 * v47];
      uint64_t v48 = (uint64_t *)a1[1];
      long long v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        long long v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        long long v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)long long v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      unint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        long long v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  v56 = a1 + 3;
  *(void *)&long long v54 = sub_100005774((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  uint64_t v53 = operator new(0xFC0uLL);
  sub_100005540(&v54, &v53);
  uint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_100005658((uint64_t)&v54, v27);
  }
  uint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_1000052BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_100005308(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)sub_100005774(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      uint64_t v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

void sub_100005420(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)sub_100005774(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void sub_100005540(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)sub_100005774(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void sub_100005658(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)sub_100005774(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void *sub_100005774(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_1000046D0();
  }
  return operator new(8 * a2);
}

uint64_t sub_1000057AC(void *a1, int a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  if (v2 == v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 42 * ((v2 - v3) >> 3) - 1;
  }
  unint64_t v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x2A) {
    a2 = 1;
  }
  if (v5 < 0x54) {
    int v7 = a2;
  }
  else {
    int v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

void sub_100005824(void **a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  unint64_t v4 = (v3 - v2) >> 3;
  if (v3 == v2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 42 * v4 - 1;
  }
  uint64_t v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(void)a1[5]] < 0x2A)
  {
    uint64_t v7 = (uint64_t)(a1 + 3);
    uint64_t v8 = a1[3];
    uint64_t v9 = *a1;
    uint64_t v10 = v8 - (unsigned char *)*a1;
    if (v4 >= v10 >> 3)
    {
      if (v8 == v9) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = v10 >> 2;
      }
      unint64_t v46 = a1 + 3;
      __p = sub_100005774(v7, v11);
      unint64_t v43 = (char *)__p;
      char v44 = (char *)__p;
      uint64_t v45 = (char *)__p + 8 * v12;
      char v41 = operator new(0xFC0uLL);
      sub_100005540(&__p, &v41);
      uint64_t v13 = (char *)a1[1];
      uint64_t v14 = v44;
      if (v13 == a1[2])
      {
        unint64_t v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            int64_t v15 = v43 - (unsigned char *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p) {
                unint64_t v23 = 1;
              }
              else {
                unint64_t v23 = (v14 - (unsigned char *)__p) >> 2;
              }
              uint64_t v24 = (char *)sub_100005774((uint64_t)v46, v23);
              uint64_t v26 = v43;
              uint64_t v14 = &v24[8 * (v23 >> 2)];
              uint64_t v27 = v44 - v43;
              if (v44 != v43)
              {
                uint64_t v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                uint64_t v28 = 8 * (v27 >> 3);
                uint64_t v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  uint64_t v30 = *(void *)v26;
                  v26 += 8;
                  *(void *)uint64_t v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              long long v31 = __p;
              __p = v24;
              unint64_t v43 = &v24[8 * (v23 >> 2)];
              char v44 = v14;
              uint64_t v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                uint64_t v14 = v44;
              }
            }
            else
            {
              uint64_t v16 = v15 >> 3;
              BOOL v17 = v15 >> 3 < -1;
              uint64_t v18 = (v15 >> 3) + 2;
              if (v17) {
                uint64_t v19 = v18;
              }
              else {
                uint64_t v19 = v16 + 1;
              }
              uint64_t v20 = &v43[-8 * (v19 >> 1)];
              int64_t v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                uint64_t v14 = v43;
              }
              uint64_t v22 = &v14[-8 * (v19 >> 1)];
              uint64_t v14 = &v20[v21];
              unint64_t v43 = v22;
              char v44 = &v20[v21];
            }
          }
          uint64_t v32 = *(void *)v13;
          v13 += 8;
          *(void *)uint64_t v14 = v32;
          uint64_t v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        unint64_t v33 = (char *)a1[1];
      }
      uint64_t v36 = *a1;
      unint64_t v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      __p = v36;
      unint64_t v43 = v33;
      uint64_t v38 = (char *)a1[3];
      uint64_t v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      char v44 = v13;
      uint64_t v45 = v38;
      if (v14 - v37 == 8) {
        uint64_t v40 = 21;
      }
      else {
        uint64_t v40 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v40;
      if (v13 != v33) {
        char v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      }
      if (v36) {
        operator delete(v36);
      }
    }
    else
    {
      if (v2 == v9)
      {
        __p = operator new(0xFC0uLL);
        sub_100005308(a1, &__p);
        uint64_t v34 = a1[2];
        __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        __p = operator new(0xFC0uLL);
      }
      sub_100005420((uint64_t)a1, &__p);
      if ((unsigned char *)a1[2] - (unsigned char *)a1[1] == 8) {
        uint64_t v35 = 21;
      }
      else {
        uint64_t v35 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v6 + 42;
    __p = (void *)*((void *)v3 - 1);
    a1[2] = v3 - 8;
    sub_100005420((uint64_t)a1, &__p);
  }
}

void sub_100005AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  operator delete(v12);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100005B40(void *a1)
{
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  if (v3 == v2)
  {
    unint64_t v4 = a1 + 5;
    uint64_t v3 = (void **)a1[1];
  }
  else
  {
    unint64_t v4 = a1 + 5;
    unint64_t v5 = a1[4];
    uint64_t v6 = &v2[v5 / 0x2A];
    uint64_t v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    unint64_t v8 = (unint64_t)v2[(a1[5] + v5) / 0x2A] + 96 * ((a1[5] + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        sub_100004790(v7);
        v7 += 96;
        if (v7 - (unsigned char *)*v6 == 4032)
        {
          uint64_t v9 = (char *)v6[1];
          ++v6;
          uint64_t v7 = v9;
        }
      }
      while (v7 != (char *)v8);
      uint64_t v2 = (void **)a1[1];
      uint64_t v3 = (void **)a1[2];
    }
  }
  *unint64_t v4 = 0;
  unint64_t v10 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v10 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v11 = v10 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 21;
  }
  else
  {
    if (v11 != 2) {
      goto LABEL_16;
    }
    uint64_t v12 = 42;
  }
  a1[4] = v12;
LABEL_16:
  while (v2 != v3)
  {
    uint64_t v13 = *v2++;
    operator delete(v13);
  }

  return sub_100005C9C((uint64_t)a1);
}

uint64_t sub_100005C9C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

char *sub_100005CEC(void *a1, long long *a2, long long *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= a4)
  {
    uint64_t v19 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v19;
    unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((v19 - result) >> 3);
    if (v20 >= a4)
    {
      uint64_t v25 = result;
      if (a2 != a3)
      {
        uint64_t v26 = result;
        do
        {
          *(_OWORD *)uint64_t v26 = *v6;
          v26[16] = *((unsigned char *)v6 + 16);
          v25 += 24;
          uint64_t v6 = (long long *)((char *)v6 + 24);
          v26 += 24;
        }
        while (v6 != a3);
      }
      int64_t v18 = v25 - result;
      uint64_t v13 = result;
    }
    else
    {
      int64_t v21 = (long long *)((char *)a2 + 24 * v20);
      if (v13 != result)
      {
        do
        {
          *(_OWORD *)int64x2_t result = *v6;
          result[16] = *((unsigned char *)v6 + 16);
          uint64_t v6 = (long long *)((char *)v6 + 24);
          result += 24;
        }
        while (v6 != v21);
      }
      uint64_t v22 = v13;
      if (v21 != a3)
      {
        unint64_t v23 = v13;
        do
        {
          long long v24 = *v21;
          *((void *)v23 + 2) = *((void *)v21 + 2);
          *(_OWORD *)unint64_t v23 = v24;
          v23 += 24;
          int64_t v21 = (long long *)((char *)v21 + 24);
          v22 += 24;
        }
        while (v21 != a3);
      }
      int64_t v18 = v22 - v13;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      sub_100004670();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v11;
    }
    int64x2_t result = sub_100004BE0(a1, v12);
    int64_t v15 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v15;
    uint64_t v16 = v15;
    if (v6 != a3)
    {
      uint64_t v16 = v13;
      do
      {
        long long v17 = *v6;
        *((void *)v16 + 2) = *((void *)v6 + 2);
        *(_OWORD *)uint64_t v16 = v17;
        v16 += 24;
        uint64_t v6 = (long long *)((char *)v6 + 24);
      }
      while (v6 != a3);
    }
    int64_t v18 = v16 - v13;
  }
  *uint64_t v14 = &v13[v18];
  return result;
}

char *sub_100005EA4(void *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (a4 <= (v8 - (uint64_t)result) >> 4)
  {
    int64_t v18 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v18;
    unint64_t v19 = (v18 - result) >> 4;
    if (v19 >= a4)
    {
      uint64_t v26 = result;
      if (a2 != a3)
      {
        uint64_t v27 = result;
        do
        {
          uint64_t v28 = *v6;
          uint64_t v29 = v6[1];
          v6 += 2;
          *(void *)uint64_t v27 = v28;
          *((void *)v27 + 1) = v29;
          v27 += 16;
          v26 += 16;
        }
        while (v6 != a3);
      }
      long long v17 = (char *)(v26 - result);
      unint64_t v12 = result;
    }
    else
    {
      unint64_t v20 = (long long *)&a2[2 * v19];
      if (v12 != result)
      {
        do
        {
          uint64_t v21 = *v6;
          uint64_t v22 = v6[1];
          v6 += 2;
          *(void *)int64x2_t result = v21;
          *((void *)result + 1) = v22;
          result += 16;
        }
        while (v6 != (uint64_t *)v20);
      }
      unint64_t v23 = v12;
      if (v20 != (long long *)a3)
      {
        long long v24 = v12;
        do
        {
          long long v25 = *v20++;
          *(_OWORD *)long long v24 = v25;
          v24 += 16;
          v23 += 16;
        }
        while (v20 != (long long *)a3);
      }
      long long v17 = (char *)(v23 - v12);
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 60) {
      sub_100004670();
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    int64x2_t result = sub_100004CA8(a1, v11);
    uint64_t v14 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v14;
    int64_t v15 = v14;
    if (v6 != a3)
    {
      int64_t v15 = v12;
      do
      {
        long long v16 = *(_OWORD *)v6;
        v6 += 2;
        *(_OWORD *)int64_t v15 = v16;
        v15 += 16;
      }
      while (v6 != a3);
    }
    long long v17 = (char *)(v15 - v12);
  }
  *uint64_t v13 = &v17[(void)v12];
  return result;
}

void sub_100005FF4(std::locale *a1, const char *a2, int a3)
{
  unint64_t v5 = sub_10000608C(a1);
  LODWORD(v5[3].__locale_) = a3;
  *(_OWORD *)((char *)&v5[3].__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v5[5].__locale_ + 4) = 0u;
  HIDWORD(v5[7].__locale_) = 0;
  strlen(a2);
  sub_1000060EC();
}

void sub_10000606C(_Unwind_Exception *a1)
{
  locale = (std::__shared_weak_count *)v1[6].__locale_;
  if (locale) {
    sub_100002F54(locale);
  }
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::locale *sub_10000608C(std::locale *a1)
{
  uint64_t v2 = std::locale::locale(a1);
  a1[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v2, &std::ctype<char>::id);
  a1[2].__locale_ = (std::locale::__imp *)std::locale::use_facet(a1, &std::collate<char>::id);
  return a1;
}

void sub_1000060D8(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void sub_1000060EC()
{
}

void sub_1000062AC(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_1000062E0()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_parse);
}

void sub_100006324(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100006338(uint64_t a1, uint64_t a2)
{
  sub_100006988(&v2, a2);
}

char *sub_100006380(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v6 = a2;
  do
  {
    uint64_t v7 = v6;
    uint64_t v6 = sub_100006E14(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  if (v7 == a2) {
    operator new();
  }
  if (v7 != (unsigned __int8 *)a3)
  {
    if (*v7 == 124)
    {
      uint64_t v8 = v7 + 1;
      uint64_t v9 = v7 + 1;
      do
      {
        uint64_t v10 = v9;
        uint64_t v9 = sub_100006E14(a1, (char *)v9, a3);
      }
      while (v9 != v10);
      if (v10 == v8) {
        operator new();
      }
      sub_100006D0C();
    }
    return (char *)v7;
  }
  return a3;
}

unsigned __int8 *sub_1000064E0(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return a2;
  }
  unint64_t v4 = a3;
  if (*a2 == 94) {
    sub_100007618();
  }
  if (a2 != a3)
  {
    do
    {
      uint64_t v6 = v3;
      uint64_t v3 = sub_10000D74C(a1, v3, v4);
    }
    while (v3 != v6);
    if (v6 != v4)
    {
      if (v6 + 1 == v4 && *v6 == 36) {
        sub_10000769C();
      }
      sub_10000D6F4();
    }
  }
  return v4;
}

unsigned __int8 *sub_100006590(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a3;
  uint64_t v6 = sub_10000DDE8(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2) {
LABEL_8:
  }
    sub_10000D6F4();
  if (v6 != (unsigned __int8 *)v3)
  {
    if (*v6 == 124)
    {
      if (sub_10000DDE8(a1, (char *)v6 + 1, v3) != v6 + 1) {
        sub_100006D0C();
      }
      goto LABEL_8;
    }
    return v6;
  }
  return (unsigned __int8 *)v3;
}

unsigned __int8 *sub_100006634(uint64_t a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  uint64_t v6 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = a3;
  }
  if (v7 == __s) {
    operator new();
  }
  sub_1000064E0(a1, __s, v7);
  if (v7 == a3) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = v7 + 1;
  }
  if (v10 != a3)
  {
    uint64_t v8 = (unsigned __int8 *)memchr(v10, 10, a3 - v10);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = a3;
    }
    if (v9 != v10)
    {
      sub_1000064E0(a1, v10, v9);
      sub_100006D0C();
    }
    operator new();
  }
  return a3;
}

char *sub_10000679C(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6 = (char *)memchr(__s, 10, a3 - __s);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = a3;
  }
  if (v7 == __s) {
    operator new();
  }
  sub_100006590(a1, __s, v7);
  if (v7 == a3) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = v7 + 1;
  }
  if (v10 != a3)
  {
    uint64_t v8 = (char *)memchr(v10, 10, a3 - v10);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = a3;
    }
    if (v9 != v10)
    {
      sub_100006590(a1, v10, v9);
      sub_100006D0C();
    }
    operator new();
  }
  return a3;
}

void sub_100006904()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_grammar);
}

void sub_100006948(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100006960()
{
}

void sub_100006974(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void sub_100006988(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1000069F0(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_10000E328(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_100006A0C(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_100006A44(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_100006A74(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL sub_100006AB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void *sub_100006B08(void *a1)
{
  *a1 = off_100010468;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100006B74(void *a1)
{
  *a1 = off_100010468;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

uint64_t sub_100006C00(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_100006C14(void *a1)
{
  *a1 = off_100010468;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100006C80(void *a1)
{
  *a1 = off_100010468;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

void sub_100006D0C()
{
}

unsigned __int8 *sub_100006E14(uint64_t a1, char *a2, char *a3)
{
  uint64_t result = (unsigned __int8 *)sub_100006EBC(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    uint64_t v7 = sub_1000070CC(a1, (unsigned __int8 *)a2, a3);
    uint64_t result = (unsigned __int8 *)a2;
    if (v7 != (unsigned __int8 *)a2)
    {
      return sub_100007314(a1, v7, (unsigned __int8 *)a3);
    }
  }
  return result;
}

char *sub_100006EBC(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3)
  {
    int v6 = *a2;
    if (v6 > 91)
    {
      if (v6 == 92)
      {
        if (a2 + 1 != a3)
        {
          int v13 = a2[1];
          if (v13 == 66 || v13 == 98) {
            sub_100007720();
          }
        }
      }
      else if (v6 == 94)
      {
        sub_100007618();
      }
    }
    else
    {
      if (v6 == 36) {
        sub_10000769C();
      }
      BOOL v8 = v6 == 40;
      uint64_t v7 = a2 + 1;
      BOOL v8 = !v8 || v7 == a3;
      if (!v8)
      {
        BOOL v8 = *v7 == 63;
        uint64_t v9 = a2 + 2;
        if (v8 && v9 != a3)
        {
          int v11 = *v9;
          if (v11 == 33)
          {
            sub_10000608C(v14);
            long long v15 = 0u;
            uint64_t v17 = 0;
            long long v16 = 0u;
            LODWORD(v15) = *(_DWORD *)(a1 + 24);
            sub_1000060EC(v14, a2 + 3, a3);
            sub_1000077B4();
          }
          if (v11 == 61)
          {
            sub_10000608C(v14);
            long long v15 = 0u;
            uint64_t v17 = 0;
            long long v16 = 0u;
            LODWORD(v15) = *(_DWORD *)(a1 + 24);
            sub_1000060EC(v14, a2 + 3, a3);
            sub_1000077B4();
          }
        }
      }
    }
  }
  return a2;
}

void sub_1000070AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

unsigned __int8 *sub_1000070CC(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == (unsigned __int8 *)a3) {
    return v3;
  }
  int v6 = (char)*a2;
  if (v6 <= 62)
  {
    if (v6 != 40)
    {
      if (v6 == 46) {
        operator new();
      }
      if ((v6 - 42) >= 2) {
        goto LABEL_28;
      }
LABEL_34:
      sub_1000083D4();
    }
    if (a2 + 1 != (unsigned __int8 *)a3)
    {
      if (a2 + 2 != (unsigned __int8 *)a3 && a2[1] == 63 && a2[2] == 58)
      {
        BOOL v8 = (_DWORD *)(a1 + 36);
        ++*(_DWORD *)(a1 + 36);
        uint64_t v9 = (char *)sub_100006380(a1, a2 + 3, a3);
        if (v9 == a3) {
          goto LABEL_35;
        }
        uint64_t v10 = v9;
        if (*v9 != 41) {
          goto LABEL_35;
        }
        goto LABEL_25;
      }
      sub_1000082D4(a1);
      BOOL v8 = (_DWORD *)(a1 + 36);
      ++*(_DWORD *)(a1 + 36);
      int v11 = (char *)sub_100006380(a1, v3 + 1, a3);
      if (v11 != a3)
      {
        uint64_t v10 = v11;
        if (*v11 == 41)
        {
          sub_100008358(a1);
LABEL_25:
          --*v8;
          return (unsigned __int8 *)(v10 + 1);
        }
      }
    }
LABEL_35:
    sub_10000785C();
  }
  if (v6 <= 91)
  {
    if (v6 == 91)
    {
      return sub_1000081C0(a1, a2, a3);
    }
    if (v6 == 63) {
      goto LABEL_34;
    }
LABEL_28:
    return sub_10000842C(a1, a2, a3);
  }
  if (v6 != 92)
  {
    if (v6 == 123) {
      goto LABEL_34;
    }
    goto LABEL_28;
  }

  return sub_10000811C(a1, a2, (unsigned __int8 *)a3);
}

unsigned __int8 *sub_100007314(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  int v5 = (char)*a2;
  if (v5 <= 62)
  {
    if (v5 == 42 || v5 == 43) {
LABEL_18:
    }
      sub_10000D0EC();
    return a2;
  }
  if (v5 == 63) {
    goto LABEL_18;
  }
  if (v5 == 123)
  {
    int v6 = a2 + 1;
    uint64_t v7 = sub_10000D27C(a1, a2 + 1, a3, &v13);
    if (v7 == v6) {
      goto LABEL_23;
    }
    if (v7 != a3)
    {
      int v8 = (char)*v7;
      if (v8 != 44)
      {
        if (v8 == 125) {
          goto LABEL_18;
        }
LABEL_23:
        sub_10000D31C();
      }
      uint64_t v9 = v7 + 1;
      if (v7 + 1 == a3) {
        goto LABEL_23;
      }
      if (*v9 == 125) {
        goto LABEL_18;
      }
      int v12 = -1;
      int v11 = sub_10000D27C(a1, v9, a3, &v12);
      if (v11 != v9 && v11 != a3 && *v11 == 125)
      {
        if (v12 >= v13) {
          goto LABEL_18;
        }
        goto LABEL_23;
      }
    }
    sub_10000D374();
  }
  return a2;
}

void sub_100007618()
{
}

void sub_10000769C()
{
}

void sub_100007720()
{
}

void sub_1000077B4()
{
}

void sub_100007838()
{
}

void sub_10000785C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_paren);
}

void sub_1000078A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_1000078B4(void *a1)
{
  *a1 = off_100010468;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100007920(void *a1)
{
  *a1 = off_100010468;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

uint64_t sub_1000079AC(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 92))
  {
    if (*(void *)(a2 + 16) != *(void *)(a2 + 8) || (*(unsigned char *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      uint64_t v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(unsigned char *)(result + 16)) {
      goto LABEL_12;
    }
    int v2 = *(unsigned __int8 *)(*(void *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10) {
      goto LABEL_12;
    }
  }
  *(_DWORD *)a2 = -994;
  uint64_t v4 = *(void *)(result + 8);
LABEL_13:
  *(void *)(a2 + 80) = v4;
  return result;
}

void *sub_100007A0C(void *a1)
{
  *a1 = off_100010468;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100007A78(void *a1)
{
  *a1 = off_100010468;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

uint64_t sub_100007B04(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(unsigned char *)(a2 + 88) & 2) == 0
    || *(unsigned char *)(result + 16) && ((v3 = *v2, v3 != 13) ? (BOOL v4 = v3 == 10) : (BOOL v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    uint64_t v5 = *(void *)(result + 8);
  }
  else
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_100007B54(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100010528;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_100007BE0(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100010528;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete();
}

uint64_t sub_100007C8C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 8);
  int v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3) {
    goto LABEL_17;
  }
  BOOL v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(unsigned char *)(a2 + 88) & 8) == 0)
    {
      uint64_t v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    int v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    int v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        uint64_t v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          int v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  uint64_t v7 = *(v4 - 1);
  uint64_t v8 = *v4;
  int v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  int v11 = v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  int v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    uint64_t v12 = 0;
    int v13 = -993;
  }
  else
  {
    uint64_t v12 = *(void *)(result + 8);
    int v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(void *)(a2 + 80) = v12;
  return result;
}

uint64_t sub_100007DA0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  *(void *)a1 = off_100010570;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 40);
  *(void *)(a1 + 64) = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 56);
  *(_DWORD *)(a1 + 80) = a5;
  *(unsigned char *)(a1 + 84) = a3;
  return a1;
}

std::locale *sub_100007E30(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100010570;
  uint64_t v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale) {
    sub_100002F54(locale);
  }
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  BOOL v4 = a1[1].__locale_;
  if (v4) {
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
  }
  return a1;
}

void sub_100007ED0(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100010570;
  uint64_t v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale) {
    sub_100002F54(locale);
  }
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  BOOL v4 = a1[1].__locale_;
  if (v4) {
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
  }

  operator delete();
}

void sub_100007F90(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  char v25 = 0;
  long long v26 = 0uLL;
  char v27 = 0;
  char v28 = 0;
  uint64_t v29 = 0;
  __p = 0;
  unint64_t v19 = 0;
  unint64_t v4 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v20 = 0;
  *(void *)&long long v21 = v5;
  *((void *)&v21 + 1) = v5;
  char v22 = 0;
  sub_100003238((char **)&__p, v4, &v21);
  uint64_t v23 = v6;
  uint64_t v24 = v6;
  char v25 = 0;
  long long v26 = v21;
  char v27 = v22;
  uint64_t v29 = v6;
  char v28 = 1;
  uint64_t v7 = *(void *)(a2 + 16);
  if (*(unsigned char *)(a2 + 92)) {
    BOOL v8 = v7 == *(void *)(a2 + 8);
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == sub_1000033B0(a1 + 16, v7, *(void *)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    int v10 = (char *)__p;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(a1 + 8);
  int v10 = (char *)__p;
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((v19 - (unsigned char *)__p) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!v10) {
      return;
    }
    goto LABEL_14;
  }
  int v12 = 0;
  int v13 = *(_DWORD *)(a1 + 80);
  uint64_t v14 = *(void *)(a2 + 32);
  unint64_t v15 = 1;
  do
  {
    long long v16 = &v10[24 * v15];
    uint64_t v17 = v14 + 24 * (v13 + v12);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v16;
    *(unsigned char *)(v17 + 16) = v16[16];
    unint64_t v15 = (v12 + 2);
    ++v12;
  }
  while (v11 > v15);
LABEL_14:
  unint64_t v19 = v10;
  operator delete(v10);
}

void sub_1000080FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *sub_10000811C(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3 || *a2 != 92) {
    return a2;
  }
  uint64_t v5 = a2 + 1;
  if (a2 + 1 == a3) {
    sub_100008598();
  }
  uint64_t result = sub_1000085F0(a1, a2 + 1, a3);
  if (result == v5)
  {
    uint64_t result = (unsigned __int8 *)sub_1000086B0(a1, (char *)a2 + 1, (char *)a3);
    if (result == v5)
    {
      uint64_t result = sub_100008780(a1, a2 + 1, a3, 0);
      if (result == v5) {
        return a2;
      }
    }
  }
  return result;
}

unsigned char *sub_1000081C0(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 != a3) {
      sub_100009984();
    }
    sub_10000AD14();
  }
  return a2;
}

uint64_t sub_1000082D4(uint64_t result)
{
  if ((*(unsigned char *)(result + 24) & 2) == 0) {
    operator new();
  }
  return result;
}

uint64_t sub_100008358(uint64_t result)
{
  if ((*(unsigned char *)(result + 24) & 2) == 0) {
    operator new();
  }
  return result;
}

void sub_1000083D4()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badrepeat);
}

void sub_100008418(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned char *sub_10000842C(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 != a3)
  {
    int v3 = (char)*a2;
    BOOL v4 = (v3 - 36) > 0x3A || ((1 << (*a2 - 36)) & 0x7800000080004F1) == 0;
    if (v4 && (v3 - 123) >= 3) {
      sub_100008B8C(a1);
    }
  }
  return a2;
}

void *sub_1000084A0(void *a1)
{
  *a1 = off_100010468;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_10000850C(void *a1)
{
  *a1 = off_100010468;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

void sub_100008598()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_escape);
}

void sub_1000085DC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_1000085F0(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    unsigned int v5 = v4 - 48;
    if (v4 == 48) {
      sub_100008B8C(a1);
    }
    if ((v4 - 49) <= 8)
    {
      uint64_t v6 = a2 + 1;
      if (a2 + 1 == a3) {
        goto LABEL_12;
      }
      do
      {
        int v7 = *v6;
        if ((v7 - 48) > 9) {
          break;
        }
        if (v5 >= 0x19999999) {
          goto LABEL_14;
        }
        ++v6;
        unsigned int v5 = v7 + 10 * v5 - 48;
      }
      while (v6 != a3);
      if (v5)
      {
LABEL_12:
        if (v5 <= *(_DWORD *)(a1 + 28)) {
          sub_100008D24(a1);
        }
      }
LABEL_14:
      sub_100008CCC();
    }
  }
  return a2;
}

char *sub_1000086B0(uint64_t a1, char *a2, char *a3)
{
  if (a2 == a3) {
    return a2;
  }
  int v3 = *a2;
  if (v3 > 99)
  {
    if (v3 == 119) {
      goto LABEL_12;
    }
    if (v3 == 115) {
LABEL_13:
    }
      sub_100009984();
    if (v3 != 100) {
      return a2;
    }
LABEL_10:
    sub_100009984();
  }
  switch(v3)
  {
    case 'D':
      goto LABEL_10;
    case 'S':
      goto LABEL_13;
    case 'W':
LABEL_12:
      sub_100009984();
  }
  return a2;
}

unsigned __int8 *sub_100008780(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  int v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  uint64_t v5 = *a2;
  if ((char)v5 > 109)
  {
    char v6 = 0;
    switch((char)v5)
    {
      case 'n':
        if (!a4) {
          goto LABEL_62;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v16 = 10;
        goto LABEL_74;
      case 'r':
        if (!a4) {
          goto LABEL_62;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v16 = 13;
        goto LABEL_74;
      case 't':
        if (!a4) {
          goto LABEL_62;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v16 = 9;
        goto LABEL_74;
      case 'u':
        if (a2 + 1 == a3) {
          goto LABEL_83;
        }
        int v7 = a2[1];
        if ((v7 & 0xF8) != 0x30 && (v7 & 0xFE) != 0x38 && (v7 | 0x20u) - 97 >= 6) {
          goto LABEL_83;
        }
        int v4 = a2 + 2;
        if (a2 + 2 == a3) {
          goto LABEL_83;
        }
        int v8 = *v4;
        char v9 = -48;
        if ((v8 & 0xF8) == 0x30 || (v8 & 0xFE) == 0x38) {
          goto LABEL_28;
        }
        v8 |= 0x20u;
        if ((v8 - 97) >= 6) {
          goto LABEL_83;
        }
        char v9 = -87;
LABEL_28:
        char v6 = 16 * (v9 + v8);
LABEL_29:
        if (v4 + 1 == a3) {
          goto LABEL_83;
        }
        int v10 = v4[1];
        char v11 = -48;
        if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38) {
          goto LABEL_34;
        }
        v10 |= 0x20u;
        if ((v10 - 97) >= 6) {
          goto LABEL_83;
        }
        char v11 = -87;
LABEL_34:
        if (v4 + 2 == a3) {
          goto LABEL_83;
        }
        int v12 = v4[2];
        char v13 = -48;
        if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38) {
          goto LABEL_39;
        }
        v12 |= 0x20u;
        if ((v12 - 97) >= 6) {
          goto LABEL_83;
        }
        char v13 = -87;
LABEL_39:
        char v14 = v13 + v12 + 16 * (v11 + v10 + v6);
        if (!a4) {
          sub_100008B8C(a1);
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v14;
        *((unsigned char *)a4 + 1) = 0;
        v4 += 3;
        break;
      case 'v':
        if (!a4) {
          goto LABEL_62;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v16 = 11;
        goto LABEL_74;
      case 'x':
        goto LABEL_29;
      default:
        goto LABEL_53;
    }
    return v4;
  }
  if ((char)v5 == 48)
  {
    if (!a4) {
      goto LABEL_62;
    }
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((unsigned char *)a4 + 23) = 1;
    }
    *(_WORD *)a4 = 0;
    return a2 + 1;
  }
  if ((char)v5 != 99)
  {
    if ((char)v5 == 102)
    {
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v16 = 12;
LABEL_74:
        *(_WORD *)a4 = v16;
        return a2 + 1;
      }
LABEL_62:
      sub_100008B8C(a1);
    }
LABEL_53:
    if ((char)v5 != 95
      && ((char)v5 < 0 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 16) + 4 * v5) & 0x500) == 0))
    {
      if (!a4) {
        goto LABEL_62;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v5;
      *((unsigned char *)a4 + 1) = 0;
      return a2 + 1;
    }
LABEL_83:
    sub_100008598();
  }
  if (a2 + 1 == a3) {
    goto LABEL_83;
  }
  unsigned __int8 v15 = a2[1];
  if (((v15 & 0xDF) - 65) > 0x19u) {
    goto LABEL_83;
  }
  if (!a4) {
    sub_100008B8C(a1);
  }
  if (*((char *)a4 + 23) < 0)
  {
    a4[1] = 1;
    a4 = (uint64_t *)*a4;
  }
  else
  {
    *((unsigned char *)a4 + 23) = 1;
  }
  *(unsigned char *)a4 = v15 & 0x1F;
  *((unsigned char *)a4 + 1) = 0;
  return a2 + 2;
}

void sub_100008B8C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 8) == 0) {
      operator new();
    }
    operator new();
  }
  operator new();
}

void sub_100008CA8()
{
}

void sub_100008CCC()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_backref);
}

void sub_100008D10(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100008D24(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 8) == 0) {
      operator new();
    }
    operator new();
  }
  operator new();
}

uint64_t sub_100008E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = off_100010600;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 40) = (*(uint64_t (**)(void, uint64_t))(**(void **)(a2 + 8) + 40))(*(void *)(a2 + 8), a3);
  return a1;
}

void sub_100008EE8(_Unwind_Exception *a1)
{
  std::locale::~locale(v2);
  void *v1 = off_100010468;
  uint64_t v4 = v1[1];
  if (v4) {
    sub_10000E328(v4);
  }
  _Unwind_Resume(a1);
}

std::locale *sub_100008F28(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100010600;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_100008FB4(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100010600;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete();
}

uint64_t sub_100009060(uint64_t result, uint64_t a2)
{
  int v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (uint64_t v4 = result,
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(result + 24) + 40))(*(void *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(void *)(a2 + 16);
    uint64_t v5 = *(void *)(v4 + 8);
  }
  *(void *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_1000090F4(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100010648;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_100009180(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100010648;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete();
}

uint64_t sub_10000922C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

void *sub_100009274(void *a1)
{
  *a1 = off_100010468;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_1000092E0(void *a1)
{
  *a1 = off_100010468;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

uint64_t sub_10000936C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

std::locale *sub_1000093B4(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_1000106D8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_100009440(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_1000106D8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete();
}

uint64_t sub_1000094EC(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(unsigned char *)(v3 + 16))
  {
    uint64_t v4 = *(void *)(v3 + 8) - *(void *)v3;
    uint64_t v5 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v5 >= v4)
    {
      uint64_t v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v5 + v4;
        uint64_t v6 = *(void *)(v7 + 8);
        goto LABEL_10;
      }
      uint64_t v8 = 0;
      while (1)
      {
        int v9 = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)v3 + v8));
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)(a2 + 16) + v8));
        if (v9 != result) {
          break;
        }
        if (v4 == ++v8)
        {
          uint64_t v5 = *(void *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  uint64_t v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(void *)(a2 + 80) = v6;
  return result;
}

std::locale *sub_100009604(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100010720;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_100009690(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100010720;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete();
}

uint64_t sub_10000973C(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(result + 40) - 1;
  uint64_t v3 = *(void *)(a2 + 32);
  if (*(unsigned char *)(v3 + 24 * v2 + 16))
  {
    uint64_t v4 = (unsigned __int8 **)(v3 + 24 * v2);
    uint64_t v5 = *v4;
    uint64_t v6 = v4[1] - *v4;
    uint64_t v7 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v7 + v6;
        uint64_t v8 = *(void *)(result + 8);
        goto LABEL_9;
      }
      int v9 = *(unsigned __int8 **)(a2 + 16);
      uint64_t v10 = v6;
      while (1)
      {
        int v12 = *v5++;
        int v11 = v12;
        int v13 = *v9++;
        if (v11 != v13) {
          break;
        }
        if (!--v10) {
          goto LABEL_8;
        }
      }
    }
  }
  uint64_t v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(void *)(a2 + 80) = v8;
  return result;
}

void *sub_1000097CC(void *a1)
{
  *a1 = off_100010468;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100009838(void *a1)
{
  *a1 = off_100010468;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

unsigned int *sub_1000098C4(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) < v2) {
    sub_100008CCC();
  }
  unsigned int v5 = v2 - 1;
  if (*(unsigned char *)(v3 + 24 * v5 + 16)
    && (uint64_t v6 = result,
        uint64_t v7 = v3 + 24 * v5,
        uint64_t result = *(unsigned int **)v7,
        int64_t v8 = *(void *)(v7 + 8) - *(void *)v7,
        uint64_t v9 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v9 >= v8)
    && (uint64_t result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !result))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 16) = v9 + v8;
    uint64_t v10 = *((void *)v6 + 1);
  }
  else
  {
    uint64_t v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 80) = v10;
  return result;
}

void sub_100009984()
{
}

void sub_1000099FC()
{
}

void sub_100009A20(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    unsigned int v5 = *(unsigned char **)(a1 + 48);
    unint64_t v4 = *(void *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      uint64_t v6 = (unint64_t *)(a1 + 40);
      unint64_t v7 = *(void *)(a1 + 40);
      int64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          int v12 = operator new(v11);
        }
        else {
          int v12 = 0;
        }
        uint64_t v20 = &v8[(void)v12];
        long long v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (unsigned char *)v7)
        {
          char v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }
          while (v5 != (unsigned char *)v7);
LABEL_45:
          unsigned int v5 = (unsigned char *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      sub_100004670();
    }
    goto LABEL_22;
  }
  uint64_t v6 = (unint64_t *)(a1 + 40);
  unsigned int v5 = *(unsigned char **)(a1 + 48);
  unint64_t v13 = *(void *)(a1 + 56);
  if (!*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      char v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          int v12 = operator new(v28);
        }
        else {
          int v12 = 0;
        }
        uint64_t v20 = &v25[(void)v12];
        long long v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (unsigned char *)v24)
        {
          long long v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }
          while (v5 != (unsigned char *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    unsigned char *v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13) {
    goto LABEL_22;
  }
  unint64_t v14 = *v6;
  unsigned __int8 v15 = &v5[-*v6];
  unint64_t v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0) {
    goto LABEL_50;
  }
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    unint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v18 = v16;
  }
  if (v18) {
    int v12 = operator new(v18);
  }
  else {
    int v12 = 0;
  }
  uint64_t v20 = &v15[(void)v12];
  long long v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (unsigned char *)v14)
  {
    uint64_t v29 = &v5[~v14];
    do
    {
      char v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }
    while (v5 != (unsigned char *)v14);
    goto LABEL_45;
  }
LABEL_46:
  int v12 = v20;
LABEL_47:
  *(void *)(a1 + 40) = v12;
  *(void *)(a1 + 48) = v19;
  *(void *)(a1 + 56) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 48) = v19;
}

uint64_t sub_100009C68(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)a1 = off_1000107B0;
  *(void *)(a1 + 8) = a3;
  size_t v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(unsigned char *)(a1 + 168) = a4;
  *(unsigned char *)(a1 + 169) = a5;
  *(unsigned char *)(a1 + 170) = a6;
  std::locale::locale(&v16, v11);
  std::locale::name(&v17, &v16);
  std::string::size_type size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v17.__r_.__value_.__l.__size_;
  }
  if (size == 1)
  {
    unint64_t v13 = (std::string *)v17.__r_.__value_.__r.__words[0];
    if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      unint64_t v13 = &v17;
    }
    BOOL v14 = v13->__r_.__value_.__s.__data_[0] != 67;
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v14 = 1;
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
LABEL_9:
    }
      operator delete(v17.__r_.__value_.__l.__data_);
  }
  std::locale::~locale(&v16);
  *(unsigned char *)(a1 + 171) = v14;
  return a1;
}

void sub_100009DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  sub_10000A658((void ***)&a10);
  unsigned __int8 v15 = (void *)v10[14];
  if (v15)
  {
    v10[15] = v15;
    operator delete(v15);
  }
  sub_10000A6FC((void ***)&a10);
  std::locale v16 = (void *)v10[8];
  if (v16)
  {
    v10[9] = v16;
    operator delete(v16);
  }
  std::string v17 = *v13;
  if (*v13)
  {
    v10[6] = v17;
    operator delete(v17);
  }
  std::locale::~locale(v12);
  *unint64_t v10 = v11;
  uint64_t v18 = v10[1];
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  _Unwind_Resume(a1);
}

void sub_100009E50(std::locale *a1)
{
  sub_10000A81C(a1);

  operator delete();
}

void sub_100009E88(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(signed __int8 **)(a2 + 16);
  unsigned int v5 = *(signed __int8 **)(a2 + 24);
  if (v4 == v5)
  {
    uint64_t v18 = 0;
    int v16 = *(unsigned __int8 *)(a1 + 168);
    goto LABEL_155;
  }
  if (!*(unsigned char *)(a1 + 171) || v4 + 1 == v5) {
    goto LABEL_27;
  }
  signed __int8 v6 = *v4;
  unsigned __int8 v86 = *v4;
  signed __int8 v7 = v4[1];
  unsigned __int8 v87 = v7;
  if (*(unsigned char *)(a1 + 169))
  {
    unsigned __int8 v86 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v6);
    unsigned __int8 v87 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v7);
  }
  sub_10000A9F4(a1 + 16, (char *)&v86, (char *)&v88, (uint64_t)&__p);
  if ((v85 & 0x80000000) == 0)
  {
    if (v85) {
      goto LABEL_8;
    }
LABEL_27:
    int v16 = 0;
    uint64_t v18 = 1;
    goto LABEL_28;
  }
  size_t v19 = v84;
  operator delete(__p);
  if (!v19) {
    goto LABEL_27;
  }
LABEL_8:
  uint64_t v8 = *(void *)(a1 + 112);
  uint64_t v9 = *(void *)(a1 + 120) - v8;
  if (v9)
  {
    uint64_t v10 = v9 >> 1;
    if ((unint64_t)(v9 >> 1) <= 1) {
      uint64_t v10 = 1;
    }
    uint64_t v11 = (unsigned char *)(v8 + 1);
    do
    {
      if (v86 == *(v11 - 1) && v87 == *v11) {
        goto LABEL_152;
      }
      v11 += 2;
      --v10;
    }
    while (v10);
  }
  if (!*(unsigned char *)(a1 + 170) || *(void *)(a1 + 88) == *(void *)(a1 + 96))
  {
    int v16 = 0;
  }
  else
  {
    sub_10000A904(a1 + 16, (char *)&v86, (char *)&v88);
    uint64_t v13 = *(void *)(a1 + 88);
    if (*(void *)(a1 + 96) == v13)
    {
LABEL_24:
      int v16 = 0;
      int v17 = 0;
    }
    else
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      while ((int)(sub_10000A9BC((void *)(v13 + v14), &__p) << 24) > 0xFFFFFF
           || (int)(sub_10000A9BC(&__p, (void **)(*(void *)(a1 + 88) + v14 + 24)) << 24) >= 0x1000000)
      {
        ++v15;
        uint64_t v13 = *(void *)(a1 + 88);
        v14 += 48;
        if (v15 >= 0xAAAAAAAAAAAAAAABLL * ((*(void *)(a1 + 96) - v13) >> 4)) {
          goto LABEL_24;
        }
      }
      int v16 = 1;
      int v17 = 5;
    }
    if (v85 < 0) {
      operator delete(__p);
    }
    if (v16) {
      goto LABEL_129;
    }
  }
  if (*(void *)(a1 + 136) == *(void *)(a1 + 144)) {
    goto LABEL_134;
  }
  sub_10000AC04(a1 + 16, (char *)&v86, (char *)&v88, (uint64_t)&__p);
  uint64_t v54 = *(void *)(a1 + 136);
  uint64_t v55 = v85;
  uint64_t v56 = *(void *)(a1 + 144) - v54;
  if (v56)
  {
    uint64_t v57 = 0;
    unint64_t v58 = v56 / 24;
    v60 = __p;
    size_t v59 = v84;
    if (v85 >= 0) {
      size_t v61 = v85;
    }
    else {
      size_t v61 = v84;
    }
    if (v58 <= 1) {
      uint64_t v62 = 1;
    }
    else {
      uint64_t v62 = v56 / 24;
    }
    BOOL v63 = 1;
    while (1)
    {
      v64 = (unsigned __int8 **)(v54 + 24 * v57);
      v65 = (unsigned __int8 *)*((unsigned __int8 *)v64 + 23);
      int v66 = (char)v65;
      if ((char)v65 < 0) {
        v65 = v64[1];
      }
      if ((unsigned __int8 *)v61 == v65)
      {
        if (v66 >= 0) {
          v67 = (unsigned __int8 *)(v54 + 24 * v57);
        }
        else {
          v67 = *v64;
        }
        if ((v55 & 0x80) == 0)
        {
          if (v55)
          {
            p_p = &__p;
            uint64_t v69 = v55;
            do
            {
              if (*(unsigned __int8 *)p_p != *v67) {
                goto LABEL_122;
              }
              p_p = (void **)((char *)p_p + 1);
              ++v67;
              --v69;
            }
            while (v69);
            int v16 = 1;
            int v17 = 5;
            goto LABEL_126;
          }
          int v16 = 1;
          if (v63) {
            goto LABEL_154;
          }
LABEL_134:
          if ((char)v86 < 0)
          {
            int v74 = *(_DWORD *)(a1 + 164);
            goto LABEL_147;
          }
          int v71 = *(_DWORD *)(a1 + 160);
          uint64_t v72 = *(void *)(*(void *)(a1 + 24) + 16);
          int v73 = *(_DWORD *)(v72 + 4 * v86);
          if ((v73 & v71) == 0 && (v86 != 95 || (v71 & 0x80) == 0)
            || (char)v87 < 0
            || (*(_DWORD *)(v72 + 4 * v87) & v71) == 0 && ((v71 & 0x80) == 0 || v87 != 95))
          {
            int v74 = *(_DWORD *)(a1 + 164);
            if ((v73 & v74) != 0 || v86 == 95 && (v74 & 0x80) != 0)
            {
LABEL_151:
              int v75 = v16;
              goto LABEL_153;
            }
LABEL_147:
            if (((char)v87 & 0x80000000) == 0)
            {
              if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 4 * v87) & v74) != 0) {
                goto LABEL_151;
              }
              int v75 = 1;
              if (v87 == 95 && (v74 & 0x80) != 0) {
                goto LABEL_151;
              }
LABEL_153:
              int v16 = v75;
LABEL_154:
              uint64_t v18 = 2;
              goto LABEL_155;
            }
          }
LABEL_152:
          int v75 = 1;
          goto LABEL_153;
        }
        unint64_t v80 = v58;
        uint64_t v82 = v55;
        int v70 = memcmp(v60, v67, v59);
        unint64_t v58 = v80;
        uint64_t v55 = v82;
        if (!v70) {
          break;
        }
      }
LABEL_122:
      BOOL v63 = ++v57 < v58;
      if (v57 == v62) {
        goto LABEL_125;
      }
    }
    int v17 = 5;
    int v16 = 1;
    goto LABEL_127;
  }
  BOOL v63 = 0;
LABEL_125:
  int v17 = 0;
LABEL_126:
  if ((v55 & 0x80) != 0) {
LABEL_127:
  }
    operator delete(__p);
  if (!v63) {
    goto LABEL_134;
  }
LABEL_129:
  if (v17) {
    goto LABEL_154;
  }
  uint64_t v18 = 2;
LABEL_28:
  unsigned __int8 v20 = **(unsigned char **)(a2 + 16);
  unsigned __int8 v86 = v20;
  if (*(unsigned char *)(a1 + 169))
  {
    unsigned __int8 v20 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), (char)v20);
    unsigned __int8 v86 = v20;
  }
  long long v21 = *(unsigned __int8 **)(a1 + 40);
  unint64_t v22 = *(void *)(a1 + 48) - (void)v21;
  if (v22)
  {
    if (v22 <= 1) {
      unint64_t v22 = 1;
    }
    while (1)
    {
      int v23 = *v21++;
      if (v23 == v20) {
        break;
      }
      if (!--v22) {
        goto LABEL_35;
      }
    }
LABEL_46:
    int v16 = 1;
    goto LABEL_155;
  }
LABEL_35:
  unsigned int v24 = *(_DWORD *)(a1 + 164);
  if (v24 || *(void *)(a1 + 64) != *(void *)(a1 + 72))
  {
    if ((v20 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 4 * v20) & v24) == 0) {
      int v25 = (v20 == 95) & (v24 >> 7);
    }
    else {
      LOBYTE(v25) = 1;
    }
    unint64_t v26 = *(void **)(a1 + 72);
    unint64_t v27 = memchr(*(void **)(a1 + 64), (char)v20, (size_t)v26 - *(void *)(a1 + 64));
    size_t v28 = v27 ? v27 : v26;
    if ((v25 & 1) == 0 && v28 == v26) {
      goto LABEL_46;
    }
  }
  uint64_t v29 = *(void *)(a1 + 88);
  uint64_t v30 = *(void *)(a1 + 96);
  if (v29 != v30)
  {
    if (*(unsigned char *)(a1 + 170))
    {
      sub_10000A904(a1 + 16, (char *)&v86, (char *)&v87);
      uint64_t v29 = *(void *)(a1 + 88);
      uint64_t v30 = *(void *)(a1 + 96);
    }
    else
    {
      char v85 = 1;
      LOWORD(__p) = v20;
    }
    if (v30 == v29)
    {
LABEL_57:
      char v33 = 0;
    }
    else
    {
      uint64_t v31 = 0;
      unint64_t v32 = 0;
      while ((int)(sub_10000A9BC((void *)(v29 + v31), &__p) << 24) > 0xFFFFFF
           || (int)(sub_10000A9BC(&__p, (void **)(*(void *)(a1 + 88) + v31 + 24)) << 24) >= 0x1000000)
      {
        ++v32;
        uint64_t v29 = *(void *)(a1 + 88);
        v31 += 48;
        if (v32 >= 0xAAAAAAAAAAAAAAABLL * ((*(void *)(a1 + 96) - v29) >> 4)) {
          goto LABEL_57;
        }
      }
      char v33 = 1;
      int v16 = 1;
    }
    if (v85 < 0) {
      operator delete(__p);
    }
    if (v33) {
      goto LABEL_155;
    }
  }
  if (*(void *)(a1 + 136) == *(void *)(a1 + 144)) {
    goto LABEL_90;
  }
  sub_10000AC04(a1 + 16, (char *)&v86, (char *)&v87, (uint64_t)&__p);
  uint64_t v34 = *(void *)(a1 + 136);
  uint64_t v35 = v85;
  uint64_t v36 = *(void *)(a1 + 144) - v34;
  if (v36)
  {
    uint64_t v81 = v18;
    uint64_t v37 = 0;
    unint64_t v38 = v36 / 24;
    uint64_t v39 = __p;
    size_t v40 = v84;
    if (v85 >= 0) {
      size_t v41 = v85;
    }
    else {
      size_t v41 = v84;
    }
    if (v38 <= 1) {
      uint64_t v42 = 1;
    }
    else {
      uint64_t v42 = v36 / 24;
    }
    BOOL v43 = 1;
    while (1)
    {
      char v44 = (unsigned __int8 **)(v34 + 24 * v37);
      uint64_t v45 = (unsigned __int8 *)*((unsigned __int8 *)v44 + 23);
      int v46 = (char)v45;
      if ((char)v45 < 0) {
        uint64_t v45 = v44[1];
      }
      if ((unsigned __int8 *)v41 == v45)
      {
        if (v46 >= 0) {
          uint64_t v47 = (unsigned __int8 *)(v34 + 24 * v37);
        }
        else {
          uint64_t v47 = *v44;
        }
        if ((v35 & 0x80) != 0)
        {
          int v79 = v16;
          size_t v50 = v41;
          uint64_t v78 = v34;
          int v51 = memcmp(v39, v47, v40);
          uint64_t v34 = v78;
          size_t v41 = v50;
          int v16 = v79;
          if (!v51)
          {
            int v16 = 1;
            uint64_t v18 = v81;
            goto LABEL_88;
          }
        }
        else
        {
          if (!v35)
          {
            int v16 = 1;
            uint64_t v18 = v81;
            if (!v43) {
              goto LABEL_90;
            }
            goto LABEL_155;
          }
          uint64_t v48 = &__p;
          uint64_t v49 = v35;
          while (*(unsigned __int8 *)v48 == *v47)
          {
            uint64_t v48 = (void **)((char *)v48 + 1);
            ++v47;
            if (!--v49)
            {
              int v16 = 1;
              goto LABEL_85;
            }
          }
        }
      }
      BOOL v43 = ++v37 < v38;
      if (v37 == v42)
      {
LABEL_85:
        uint64_t v18 = v81;
        if ((v35 & 0x80) == 0) {
          goto LABEL_89;
        }
        goto LABEL_88;
      }
    }
  }
  BOOL v43 = 0;
  if (v85 < 0) {
LABEL_88:
  }
    operator delete(__p);
LABEL_89:
  if (!v43)
  {
LABEL_90:
    if ((char)v86 < 0) {
      goto LABEL_155;
    }
    unsigned int v52 = *(_DWORD *)(a1 + 160);
    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 4 * v86) & v52) == 0)
    {
      int v53 = (v52 >> 7) & 1;
      if (v86 != 95) {
        int v53 = 0;
      }
      if (v53 != 1) {
        goto LABEL_155;
      }
    }
    goto LABEL_46;
  }
LABEL_155:
  if (v16 == *(unsigned __int8 *)(a1 + 168))
  {
    uint64_t v76 = 0;
    int v77 = -993;
  }
  else
  {
    *(void *)(a2 + 16) += v18;
    uint64_t v76 = *(void *)(a1 + 8);
    int v77 = -995;
  }
  *(_DWORD *)a2 = v77;
  *(void *)(a2 + 80) = v76;
}

void sub_10000A658(void ***a1)
{
  char v2 = *a1;
  if (*v2)
  {
    sub_10000A6AC((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_10000A6AC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void sub_10000A6FC(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unsigned int v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        sub_10000A780(v4);
      }
      while ((void *)v4 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_10000A780(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t sub_10000A7D8(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

std::locale *sub_10000A81C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_1000107B0;
  signed __int8 v7 = a1 + 17;
  sub_10000A658((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  signed __int8 v7 = a1 + 11;
  sub_10000A6FC((void ***)&v7);
  uint64_t v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  uint64_t v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  unsigned int v5 = a1[1].__locale_;
  if (v5) {
    (*(void (**)(std::locale::__imp *))(*(void *)v5 + 8))(v5);
  }
  return a1;
}

void sub_10000A904(uint64_t a1, char *a2, char *a3)
{
  sub_100002968(__p, a2, a3, a3 - a2);
  unint64_t v4 = v7;
  if ((v7 & 0x80u) == 0) {
    unsigned int v5 = __p;
  }
  else {
    unsigned int v5 = (void **)__p[0];
  }
  if ((v7 & 0x80u) != 0) {
    unint64_t v4 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10000A9A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000A9BC(void *a1, void **a2)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  size_t v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (void *)*a1;
    size_t v2 = v3;
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    unsigned int v5 = a2;
  }
  else {
    unsigned int v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  return sub_10000ABA4(a1, v2, v5, v6);
}

void sub_10000A9F4(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_100002968(&__s, a2, a3, a3 - a2);
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__s.__r_.__value_.__s + 23)) {
      return;
    }
    p_s = &__s;
  }
  std::__get_collation_name(&v11, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v11.__r_.__value_.__l.__data_;
  unint64_t v7 = v11.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v11.__r_.__value_.__l + 2);
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    return;
  }
  (*(void (**)(std::string *__return_ptr))(**(void **)(a1 + 16) + 32))(&v11);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(std::string *)a4 = v11;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    int v9 = *(unsigned __int8 *)(a4 + 23);
    if (v9 != 12 && v9 != 1)
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)(a4 + 8);
  if (v10 == 1 || v10 == 12)
  {
LABEL_23:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(unsigned char **)a4 = 0;
  *(void *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_10000AB70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000ABA4(const void *a1, size_t a2, void *__s2, size_t a4)
{
  if (a4 >= a2) {
    size_t v7 = a2;
  }
  else {
    size_t v7 = a4;
  }
  int v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (a2 == a4) {
      return 0;
    }
    if (a2 >= a4) {
      return 1;
    }
  }
  return 255;
}

void sub_10000AC04(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_100002968(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    size_t v7 = __p;
  }
  else {
    size_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v7, (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        uint64_t v10 = (unsigned char *)a4;
      }
      else {
        uint64_t v10 = *(unsigned char **)a4;
      }
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(unsigned char **)a4 = 0;
      *(void *)(a4 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10000ACF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000AD14()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brack);
}

void sub_10000AD58(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_10000AD6C(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  int v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  int v5 = *a2;
  if (v5 == 93) {
    return v4;
  }
  uint64_t v6 = (uint64_t)a4;
  unsigned int v9 = 0;
  uint64_t v10 = 0;
  long long v31 = 0uLL;
  uint64_t v32 = 0;
  if (a2 + 1 != a3 && v5 == 91)
  {
    int v11 = a2[1];
    switch(v11)
    {
      case '.':
        int v4 = (char *)sub_10000B3DC(a1, a2 + 2, a3, (uint64_t)&v31);
        unsigned int v9 = HIBYTE(v32);
        uint64_t v10 = *((void *)&v31 + 1);
        break;
      case ':':
        uint64_t v12 = sub_10000B320(a1, a2 + 2, a3, (uint64_t)a4);
        goto LABEL_11;
      case '=':
        uint64_t v12 = sub_10000B140(a1, a2 + 2, a3, a4);
LABEL_11:
        uint64_t v6 = v12;
        char v13 = 0;
        goto LABEL_44;
      default:
        uint64_t v10 = 0;
        unsigned int v9 = 0;
        break;
    }
  }
  int v14 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if ((v9 & 0x80u) == 0) {
    uint64_t v10 = v9;
  }
  if (v10)
  {
    unint64_t v15 = v4;
    goto LABEL_28;
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1B0 | 0x40) == 0x40)
  {
    int v16 = *v4;
    if (v16 == 92)
    {
      uint64_t v17 = v4 + 1;
      if (v14) {
        uint64_t v18 = sub_10000B644(a1, v17, a3, (uint64_t *)&v31);
      }
      else {
        uint64_t v18 = (char *)sub_10000B4CC(a1, (unsigned __int8 *)v17, (unsigned __int8 *)a3, (uint64_t)&v31, v6);
      }
      unint64_t v15 = v18;
      goto LABEL_28;
    }
  }
  else
  {
    LOBYTE(v16) = *v4;
  }
  if ((v9 & 0x80) != 0)
  {
    size_t v19 = (long long *)v31;
    *((void *)&v31 + 1) = 1;
  }
  else
  {
    HIBYTE(v32) = 1;
    size_t v19 = &v31;
  }
  *(unsigned char *)size_t v19 = v16;
  *((unsigned char *)v19 + 1) = 0;
  unint64_t v15 = v4 + 1;
LABEL_28:
  if (v15 == a3
    || (int v20 = *v15, v20 == 93)
    || (long long v21 = v15 + 1, v15 + 1 == a3)
    || v20 != 45
    || *v21 == 93)
  {
    if (SHIBYTE(v32) < 0)
    {
      if (*((void *)&v31 + 1))
      {
        if (*((void *)&v31 + 1) != 1)
        {
          unint64_t v22 = (char *)v31;
LABEL_42:
          sub_10000BD88(v6, *v22, v22[1]);
          goto LABEL_43;
        }
        unint64_t v22 = (char *)v31;
        goto LABEL_40;
      }
    }
    else if (HIBYTE(v32))
    {
      unint64_t v22 = (char *)&v31;
      if (HIBYTE(v32) != 1) {
        goto LABEL_42;
      }
LABEL_40:
      sub_100009A20(v6, *v22);
    }
LABEL_43:
    char v13 = 1;
    int v4 = v15;
    goto LABEL_44;
  }
  v29[0] = 0;
  v29[1] = 0;
  uint64_t v30 = 0;
  int v4 = v15 + 2;
  if (v15 + 2 != a3 && *v21 == 91 && *v4 == 46)
  {
    uint64_t v24 = sub_10000B3DC(a1, v15 + 3, a3, (uint64_t)v29);
LABEL_60:
    int v4 = (char *)v24;
    goto LABEL_61;
  }
  if ((v14 | 0x40) == 0x40)
  {
    LODWORD(v21) = *v21;
    if (v21 == 92)
    {
      if (v14) {
        uint64_t v24 = (uint64_t)sub_10000B644(a1, v15 + 2, a3, (uint64_t *)v29);
      }
      else {
        uint64_t v24 = (uint64_t)sub_10000B4CC(a1, (unsigned __int8 *)v15 + 2, (unsigned __int8 *)a3, (uint64_t)v29, v6);
      }
      goto LABEL_60;
    }
  }
  else
  {
    LOBYTE(v21) = *v21;
  }
  HIBYTE(v30) = 1;
  LOWORD(v29[0]) = v21;
LABEL_61:
  *(_OWORD *)unint64_t v27 = v31;
  uint64_t v28 = v32;
  uint64_t v32 = 0;
  long long v31 = 0uLL;
  *(_OWORD *)__p = *(_OWORD *)v29;
  uint64_t v26 = v30;
  v29[0] = 0;
  v29[1] = 0;
  uint64_t v30 = 0;
  sub_10000B960(v6, (char *)v27, (char *)__p);
  if (SHIBYTE(v26) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v28) < 0) {
    operator delete(v27[0]);
  }
  if (SHIBYTE(v30) < 0) {
    operator delete(v29[0]);
  }
  char v13 = 1;
LABEL_44:
  if (SHIBYTE(v32) < 0) {
    operator delete((void *)v31);
  }
  if (v13) {
    return v4;
  }
  return (char *)v6;
}

void sub_10000B0E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v28 - 49) < 0) {
    operator delete(*(void **)(v28 - 72));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000B140(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_33;
  }
  for (uint64_t i = 0; a2[i] != 61 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_33;
    }
  }
  if (&a2[i] == a3) {
LABEL_33:
  }
    sub_10000AD14();
  sub_10000C080(a1, a2, &a2[i], (uint64_t)&v17);
  if (((char)v19 & 0x80000000) == 0)
  {
    uint64_t v8 = v19;
    if (v19)
    {
      unsigned int v9 = (char *)&v17;
      goto LABEL_14;
    }
LABEL_34:
    sub_10000BFE4();
  }
  uint64_t v8 = v18;
  if (!v18) {
    goto LABEL_34;
  }
  unsigned int v9 = (char *)v17;
LABEL_14:
  sub_10000C230(a1, v9, &v9[v8], (uint64_t)__p);
  unint64_t v10 = v16;
  if ((v16 & 0x80u) != 0) {
    unint64_t v10 = (unint64_t)__p[1];
  }
  if (v10)
  {
    sub_10000C03C(a4, (long long *)__p);
  }
  else
  {
    uint64_t v11 = v19;
    if ((v19 & 0x80u) != 0) {
      uint64_t v11 = v18;
    }
    if (v11 == 2)
    {
      char v13 = (char *)&v17;
      if ((v19 & 0x80u) != 0) {
        char v13 = (char *)v17;
      }
      sub_10000BD88((uint64_t)a4, *v13, v13[1]);
    }
    else
    {
      if (v11 != 1) {
        sub_10000BFE4();
      }
      uint64_t v12 = (char *)&v17;
      if ((v19 & 0x80u) != 0) {
        uint64_t v12 = (char *)v17;
      }
      sub_100009A20((uint64_t)a4, *v12);
    }
  }
  if ((char)v16 < 0) {
    operator delete(__p[0]);
  }
  if ((char)v19 < 0) {
    operator delete(v17);
  }
  return (uint64_t)&a2[i + 2];
}

void sub_10000B2E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000B320(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_11;
  }
  for (uint64_t i = 0; a2[i] != 58 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_11;
    }
  }
  if (&a2[i] == a3) {
LABEL_11:
  }
    sub_10000AD14();
  int v7 = sub_10000C7E4(a1, a2, &a2[i], *(unsigned char *)(a1 + 24) & 1);
  if (!v7) {
    sub_10000C78C();
  }
  *(_DWORD *)(a4 + 160) |= v7;
  return (uint64_t)&a2[i + 2];
}

uint64_t sub_10000B3DC(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  for (uint64_t i = 0; a2[i] != 46 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_15;
    }
  }
  if (&a2[i] == a3) {
LABEL_15:
  }
    sub_10000AD14();
  sub_10000C080(a1, a2, &a2[i], (uint64_t)&v10);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(_OWORD *)a4 = v10;
  unint64_t v7 = v11;
  *(void *)(a4 + 16) = v11;
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 - 1 >= 2) {
    sub_10000BFE4();
  }
  return (uint64_t)&a2[i + 2];
}

unsigned __int8 *sub_10000B4CC(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  if (a2 == a3) {
    sub_100008598();
  }
  int v6 = (char)*a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119) {
          goto LABEL_25;
        }
        *(_DWORD *)(a5 + 160) |= 0x500u;
        sub_100009A20(a5, 95);
        return a2 + 1;
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (v6 == 98)
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(void *)(a4 + 8) = 1;
          a4 = *(void *)a4;
        }
        else
        {
          *(unsigned char *)(a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      if (v6 != 100) {
        goto LABEL_25;
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v8;
    return a2 + 1;
  }
  if (v6 <= 82)
  {
    if (!*a2)
    {
      if (*(char *)(a4 + 23) < 0)
      {
        *(void *)(a4 + 8) = 1;
        a4 = *(void *)a4;
      }
      else
      {
        *(unsigned char *)(a4 + 23) = 1;
      }
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 1) = 0;
      return a2 + 1;
    }
    if (v6 == 68)
    {
      int v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_22:
      *(_DWORD *)(a5 + 164) = v7;
      return a2 + 1;
    }
    goto LABEL_25;
  }
  if (v6 == 83)
  {
    int v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_22;
  }
  if (v6 == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    sub_10000C8B8(a5, 95);
    return a2 + 1;
  }
LABEL_25:

  return sub_100008780(a1, a2, a3, (uint64_t *)a4);
}

char *sub_10000B644(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a2 == a3) {
LABEL_78:
  }
    sub_100008598();
  int v4 = *a2;
  char v5 = *a2;
  if (v4 > 97)
  {
    switch(*a2)
    {
      case 'n':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v11 = 10;
        goto LABEL_75;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_25;
      case 'r':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v11 = 13;
        goto LABEL_75;
      case 't':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v11 = 9;
        goto LABEL_75;
      case 'v':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v11 = 11;
        goto LABEL_75;
      default:
        if (v4 == 98)
        {
          if (!a4) {
            goto LABEL_60;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v11 = 8;
        }
        else
        {
          if (v4 != 102) {
            goto LABEL_25;
          }
          if (!a4) {
            goto LABEL_60;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v11 = 12;
        }
        break;
    }
    goto LABEL_75;
  }
  if (v4 > 91)
  {
    if (v4 == 92) {
      goto LABEL_16;
    }
    if (v4 != 97) {
      goto LABEL_25;
    }
    if (!a4) {
      goto LABEL_60;
    }
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((unsigned char *)a4 + 23) = 1;
    }
    __int16 v11 = 7;
LABEL_75:
    *(_WORD *)a4 = v11;
    return a2 + 1;
  }
  if (v4 == 34 || v4 == 47)
  {
LABEL_16:
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v5;
      *((unsigned char *)a4 + 1) = 0;
      return a2 + 1;
    }
LABEL_60:
    sub_100008B8C(a1);
  }
LABEL_25:
  if ((v5 & 0xF8) != 0x30) {
    goto LABEL_78;
  }
  char v6 = v4 - 48;
  int v7 = a2 + 1;
  if (a2 + 1 == a3)
  {
LABEL_48:
    int v7 = a3;
    goto LABEL_49;
  }
  if ((*v7 & 0xF8) == 0x30)
  {
    char v6 = *v7 + 8 * v6 - 48;
    if (a2 + 2 != a3)
    {
      char v8 = a2[2];
      int v9 = v8 & 0xF8;
      char v10 = v8 + 8 * v6 - 48;
      if (v9 == 48) {
        int v7 = a2 + 3;
      }
      else {
        int v7 = a2 + 2;
      }
      if (v9 == 48) {
        char v6 = v10;
      }
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_49:
  if (!a4) {
    sub_100008B8C(a1);
  }
  if (*((char *)a4 + 23) < 0)
  {
    a4[1] = 1;
    a4 = (uint64_t *)*a4;
  }
  else
  {
    *((unsigned char *)a4 + 23) = 1;
  }
  *(unsigned char *)a4 = v6;
  *((unsigned char *)a4 + 1) = 0;
  return v7;
}

void sub_10000B960(uint64_t a1, char *a2, char *a3)
{
  size_t v3 = a3;
  int v4 = a2;
  if (*(unsigned char *)(a1 + 170))
  {
    if (*(unsigned char *)(a1 + 169))
    {
      for (unint64_t i = 0; ; ++i)
      {
        unint64_t v7 = v4[23] < 0 ? *((void *)v4 + 1) : v4[23];
        if (i >= v7) {
          break;
        }
        char v8 = v4;
        if (v4[23] < 0) {
          char v8 = *(char **)v4;
        }
        char v9 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v8[i]);
        char v10 = v4;
        if (v4[23] < 0) {
          char v10 = *(char **)v4;
        }
        v10[i] = v9;
      }
      for (unint64_t j = 0; ; ++j)
      {
        unint64_t v12 = v3[23] < 0 ? *((void *)v3 + 1) : v3[23];
        if (j >= v12) {
          break;
        }
        char v13 = v3;
        if (v3[23] < 0) {
          char v13 = *(char **)v3;
        }
        char v14 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v13[j]);
        unint64_t v15 = v3;
        if (v3[23] < 0) {
          unint64_t v15 = *(char **)v3;
        }
        v15[j] = v14;
      }
    }
    else
    {
      for (unint64_t k = 0; ; ++k)
      {
        unint64_t v18 = a2[23] < 0 ? *((void *)a2 + 1) : a2[23];
        if (k >= v18) {
          break;
        }
        unsigned __int8 v19 = a2;
        if (a2[23] < 0) {
          unsigned __int8 v19 = *(char **)a2;
        }
        int v20 = a2;
        if (a2[23] < 0) {
          int v20 = *(char **)a2;
        }
        v20[k] = v19[k];
      }
      for (unint64_t m = 0; ; ++m)
      {
        unint64_t v22 = a3[23] < 0 ? *((void *)a3 + 1) : a3[23];
        if (m >= v22) {
          break;
        }
        int v23 = a3;
        if (a3[23] < 0) {
          int v23 = *(char **)a3;
        }
        uint64_t v24 = a3;
        if (a3[23] < 0) {
          uint64_t v24 = *(char **)a3;
        }
        v24[m] = v23[m];
      }
    }
    if (v4[23] < 0)
    {
      uint64_t v26 = v4;
      int v4 = *(char **)v4;
      uint64_t v25 = *((void *)v26 + 1);
    }
    else
    {
      uint64_t v25 = v4[23];
    }
    sub_10000CCB8(a1 + 16, v4, &v4[v25]);
    if (v3[23] < 0)
    {
      uint64_t v28 = v3;
      size_t v3 = *(char **)v3;
      uint64_t v27 = *((void *)v28 + 1);
    }
    else
    {
      uint64_t v27 = v3[23];
    }
    sub_10000CCB8(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)size_t v40 = v38;
    uint64_t v41 = v39;
    *(_OWORD *)__p = *(_OWORD *)v36;
    uint64_t v43 = v37;
    sub_10000CB00((char **)(a1 + 88), (long long *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }
  else
  {
    if (a2[23] < 0) {
      uint64_t v16 = *((void *)a2 + 1);
    }
    else {
      uint64_t v16 = a2[23];
    }
    if (v16 != 1 || (a3[23] < 0 ? (uint64_t v29 = *((void *)a3 + 1)) : (uint64_t v29 = a3[23]), v29 != 1)) {
      sub_10000CD70();
    }
    if (*(unsigned char *)(a1 + 169))
    {
      uint64_t v30 = a2;
      if (a2[23] < 0) {
        uint64_t v30 = *(char **)a2;
      }
      char v31 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v30);
      uint64_t v32 = v4;
      if (v4[23] < 0) {
        uint64_t v32 = *(unsigned char **)v4;
      }
      *uint64_t v32 = v31;
      char v33 = v3;
      if (v3[23] < 0) {
        char v33 = *(char **)v3;
      }
      char v34 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v33);
      uint64_t v35 = v3;
      if (v3[23] < 0) {
        uint64_t v35 = *(unsigned char **)v3;
      }
      *uint64_t v35 = v34;
    }
    *(_OWORD *)size_t v40 = *(_OWORD *)v4;
    uint64_t v41 = *((void *)v4 + 2);
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 2) = 0;
    *(void *)int v4 = 0;
    *(_OWORD *)__p = *(_OWORD *)v3;
    uint64_t v43 = *((void *)v3 + 2);
    *(void *)size_t v3 = 0;
    *((void *)v3 + 1) = 0;
    *((void *)v3 + 2) = 0;
    sub_10000CB00((char **)(a1 + 88), (long long *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }
}

void sub_10000BD3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
}

void sub_10000BD88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 169))
  {
    uint64_t v18 = a1 + 128;
    unint64_t v19 = *(void *)(a1 + 128);
    char v10 = (char **)(a1 + 112);
    __int16 v8 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    char v9 = *(_WORD **)(a1 + 120);
    if (*(unsigned char *)(a1 + 170))
    {
      if ((unint64_t)v9 < v19) {
        goto LABEL_24;
      }
      uint64_t v20 = (char *)v9 - *v10;
      if (v20 > -3)
      {
        uint64_t v21 = v20 >> 1;
        unint64_t v22 = v19 - (void)*v10;
        if (v22 <= (v20 >> 1) + 1) {
          unint64_t v23 = v21 + 1;
        }
        else {
          unint64_t v23 = v22;
        }
        if (v22 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v24 = v23;
        }
        if (v24) {
          uint64_t v25 = (char *)sub_10000CE60(v18, v24);
        }
        else {
          uint64_t v25 = 0;
        }
        uint64_t v27 = &v25[2 * v21];
        uint64_t v28 = &v25[2 * v24];
        *(_WORD *)uint64_t v27 = v8;
        uint64_t v26 = v27 + 2;
        long long v38 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v38) {
          goto LABEL_46;
        }
        do
        {
          __int16 v39 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v39;
          v27 -= 2;
        }
        while (v29 != v38);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v9 < v19) {
        goto LABEL_24;
      }
      uint64_t v32 = (char *)v9 - *v10;
      if (v32 > -3)
      {
        uint64_t v33 = v32 >> 1;
        unint64_t v34 = v19 - (void)*v10;
        if (v34 <= (v32 >> 1) + 1) {
          unint64_t v35 = v33 + 1;
        }
        else {
          unint64_t v35 = v34;
        }
        if (v34 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v36 = v35;
        }
        if (v36) {
          uint64_t v37 = (char *)sub_10000CE60(v18, v36);
        }
        else {
          uint64_t v37 = 0;
        }
        uint64_t v27 = &v37[2 * v33];
        uint64_t v28 = &v37[2 * v36];
        *(_WORD *)uint64_t v27 = v8;
        uint64_t v26 = v27 + 2;
        size_t v40 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v40) {
          goto LABEL_46;
        }
        do
        {
          __int16 v41 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v41;
          v27 -= 2;
        }
        while (v29 != v40);
        goto LABEL_45;
      }
    }
LABEL_49:
    sub_100004670();
  }
  unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
  __int16 v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a3);
  unint64_t v7 = *(void *)(a1 + 128);
  __int16 v8 = v5 | (unsigned __int16)(v6 << 8);
  char v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    _WORD *v9 = v8;
    uint64_t v26 = v9 + 1;
    goto LABEL_48;
  }
  char v10 = (char **)(a1 + 112);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v12 = (uint64_t)v9 - v11;
  if ((uint64_t)v9 - v11 <= -3) {
    goto LABEL_49;
  }
  uint64_t v13 = v12 >> 1;
  unint64_t v14 = v7 - v11;
  if (v14 <= (v12 >> 1) + 1) {
    unint64_t v15 = v13 + 1;
  }
  else {
    unint64_t v15 = v14;
  }
  if (v14 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v16 = v15;
  }
  if (v16) {
    uint64_t v17 = (char *)sub_10000CE60(a1 + 128, v16);
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v27 = &v17[2 * v13];
  uint64_t v28 = &v17[2 * v16];
  *(_WORD *)uint64_t v27 = v8;
  uint64_t v26 = v27 + 2;
  uint64_t v30 = *(char **)(a1 + 112);
  uint64_t v29 = *(char **)(a1 + 120);
  if (v29 == v30) {
    goto LABEL_46;
  }
  do
  {
    __int16 v31 = *((_WORD *)v29 - 1);
    v29 -= 2;
    *((_WORD *)v27 - 1) = v31;
    v27 -= 2;
  }
  while (v29 != v30);
LABEL_45:
  uint64_t v29 = *v10;
LABEL_46:
  *(void *)(a1 + 112) = v27;
  *(void *)(a1 + 120) = v26;
  *(void *)(a1 + 128) = v28;
  if (v29) {
    operator delete(v29);
  }
LABEL_48:
  *(void *)(a1 + 120) = v26;
}

void sub_10000BFE4()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_collate);
}

void sub_10000C028(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C03C(uint64_t *a1, long long *a2)
{
  size_t v3 = a1 + 17;
  unint64_t v4 = a1[18];
  if (v4 >= a1[19])
  {
    uint64_t result = sub_10000C3A0(v3, a2);
  }
  else
  {
    sub_10000C340(v3, a2);
    uint64_t result = v4 + 24;
  }
  a1[18] = result;
  return result;
}

void sub_10000C080(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_100002968(&__s, a2, a3, a3 - a2);
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__s.__r_.__value_.__s + 23)) {
      return;
    }
    p_s = &__s;
  }
  std::__get_collation_name(&v11, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v11.__r_.__value_.__l.__data_;
  unint64_t v7 = v11.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v11.__r_.__value_.__l + 2);
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    return;
  }
  (*(void (**)(std::string *__return_ptr))(**(void **)(a1 + 16) + 32))(&v11);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(std::string *)a4 = v11;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    int v9 = *(unsigned __int8 *)(a4 + 23);
    if (v9 != 12 && v9 != 1)
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)(a4 + 8);
  if (v10 == 1 || v10 == 12)
  {
LABEL_23:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(unsigned char **)a4 = 0;
  *(void *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_10000C1FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000C230(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_100002968(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    unint64_t v7 = __p;
  }
  else {
    unint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v7, (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        uint64_t v10 = (unsigned char *)a4;
      }
      else {
        uint64_t v10 = *(unsigned char **)a4;
      }
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(unsigned char **)a4 = 0;
      *(void *)(a4 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10000C324(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_10000C340(void *result, long long *a2)
{
  size_t v2 = result;
  uint64_t v3 = result[1];
  if (*((char *)a2 + 23) < 0)
  {
    uint64_t result = sub_10000C4C4((unsigned char *)result[1], *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }
  v2[1] = v3 + 24;
  return result;
}

void sub_10000C398(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_10000C3A0(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_100004670();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v18 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_1000049C0(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  std::string v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  uint64_t v16 = v11;
  uint64_t v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_10000C4C4(v11, *(void **)a2, *((void *)a2 + 1));
    std::string v11 = v16;
  }
  else
  {
    long long v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)std::string v11 = v12;
  }
  uint64_t v16 = v11 + 24;
  sub_10000C564(a1, v15);
  uint64_t v13 = a1[1];
  sub_10000C6FC((uint64_t)v15);
  return v13;
}

void sub_10000C4B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000C6FC((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_10000C4C4(unsigned char *__dst, void *__src, unint64_t a3)
{
  unint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_1000021BC();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    unint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    void *v5 = v8;
    unint64_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

uint64_t sub_10000C564(uint64_t *a1, void *a2)
{
  uint64_t result = sub_10000C5DC((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_10000C5DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  pid_t v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  sub_10000C67C((uint64_t)v12);
  return a6;
}

uint64_t sub_10000C67C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_10000C6B4(a1);
  }
  return a1;
}

void sub_10000C6B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

uint64_t sub_10000C6FC(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_10000C734(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void sub_10000C78C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_ctype);
}

void sub_10000C7D0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C7E4(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  sub_100002968(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    uint64_t v7 = __p;
  }
  else {
    uint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8), v7, (char *)v7 + v6);
  if ((v12 & 0x80u) == 0) {
    uint64_t v8 = __p;
  }
  else {
    uint64_t v8 = (void **)__p[0];
  }
  uint64_t classname = std::__get_classname((const char *)v8, a4);
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
  return classname;
}

void sub_10000C89C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000C8B8(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    uint64_t v5 = *(unsigned char **)(a1 + 72);
    unint64_t v4 = *(void *)(a1 + 80);
    if ((unint64_t)v5 >= v4)
    {
      unint64_t v6 = (unint64_t *)(a1 + 64);
      unint64_t v7 = *(void *)(a1 + 64);
      uint64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          unsigned __int8 v12 = operator new(v11);
        }
        else {
          unsigned __int8 v12 = 0;
        }
        uint64_t v20 = &v8[(void)v12];
        uint64_t v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (unsigned char *)v7)
        {
          unint64_t v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }
          while (v5 != (unsigned char *)v7);
LABEL_45:
          uint64_t v5 = (unsigned char *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      sub_100004670();
    }
    goto LABEL_22;
  }
  unint64_t v6 = (unint64_t *)(a1 + 64);
  uint64_t v5 = *(unsigned char **)(a1 + 72);
  unint64_t v13 = *(void *)(a1 + 80);
  if (!*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      uint64_t v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          unsigned __int8 v12 = operator new(v28);
        }
        else {
          unsigned __int8 v12 = 0;
        }
        uint64_t v20 = &v25[(void)v12];
        uint64_t v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (unsigned char *)v24)
        {
          __int16 v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }
          while (v5 != (unsigned char *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    unsigned char *v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13) {
    goto LABEL_22;
  }
  unint64_t v14 = *v6;
  long long v15 = &v5[-*v6];
  unint64_t v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0) {
    goto LABEL_50;
  }
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    unint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v18 = v16;
  }
  if (v18) {
    unsigned __int8 v12 = operator new(v18);
  }
  else {
    unsigned __int8 v12 = 0;
  }
  uint64_t v20 = &v15[(void)v12];
  uint64_t v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (unsigned char *)v14)
  {
    uint64_t v29 = &v5[~v14];
    do
    {
      char v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }
    while (v5 != (unsigned char *)v14);
    goto LABEL_45;
  }
LABEL_46:
  unsigned __int8 v12 = v20;
LABEL_47:
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v19;
  *(void *)(a1 + 80) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 72) = v19;
}

uint64_t sub_10000CB00(char **a1, long long *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(result - 8);
  if (v7 >= v6)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (void)*a1) >> 4);
    unint64_t v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555) {
      sub_100004670();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (void)*a1) >> 4);
    if (2 * v13 > v12) {
      unint64_t v12 = 2 * v13;
    }
    if (v13 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v14 = 0x555555555555555;
    }
    else {
      unint64_t v14 = v12;
    }
    uint64_t v29 = result;
    if (v14) {
      long long v15 = (char *)sub_10000CDC8(result, v14);
    }
    else {
      long long v15 = 0;
    }
    unint64_t v16 = &v15[48 * v11];
    long long v17 = *a2;
    *((void *)v16 + 2) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v16 = v17;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v18 = *(long long *)((char *)a2 + 24);
    *((void *)v16 + 5) = *((void *)a2 + 5);
    *(_OWORD *)(v16 + 24) = v18;
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    *((void *)a2 + 3) = 0;
    uint64_t v20 = *a1;
    unint64_t v19 = (unint64_t)a1[1];
    if ((char *)v19 == *a1)
    {
      int64x2_t v24 = vdupq_n_s64(v19);
      uint64_t v21 = &v15[48 * v11];
    }
    else
    {
      uint64_t v21 = &v15[48 * v11];
      do
      {
        long long v22 = *(_OWORD *)(v19 - 48);
        *((void *)v21 - 4) = *(void *)(v19 - 32);
        *((_OWORD *)v21 - 3) = v22;
        *(void *)(v19 - 40) = 0;
        *(void *)(v19 - 32) = 0;
        *(void *)(v19 - 48) = 0;
        long long v23 = *(_OWORD *)(v19 - 24);
        *((void *)v21 - 1) = *(void *)(v19 - 8);
        *(_OWORD *)(v21 - 24) = v23;
        v21 -= 48;
        *(void *)(v19 - 16) = 0;
        *(void *)(v19 - 8) = 0;
        *(void *)(v19 - 24) = 0;
        v19 -= 48;
      }
      while ((char *)v19 != v20);
      int64x2_t v24 = *(int64x2_t *)a1;
    }
    unint64_t v10 = v16 + 48;
    *a1 = v21;
    a1[1] = v16 + 48;
    int64x2_t v27 = v24;
    uint64_t v25 = a1[2];
    a1[2] = &v15[48 * v14];
    size_t v28 = v25;
    uint64_t v26 = v24.i64[0];
    uint64_t result = sub_10000CE10((uint64_t)&v26);
  }
  else
  {
    long long v8 = *a2;
    *(void *)(v7 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v7 = v8;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v9 = *(long long *)((char *)a2 + 24);
    *(void *)(v7 + 40) = *((void *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    *((void *)a2 + 3) = 0;
    unint64_t v10 = (char *)(v7 + 48);
  }
  a1[1] = v10;
  return result;
}

void sub_10000CCB8(uint64_t a1, char *a2, char *a3)
{
  sub_100002968(__p, a2, a3, a3 - a2);
  unint64_t v4 = v7;
  if ((v7 & 0x80u) == 0) {
    unint64_t v5 = __p;
  }
  else {
    unint64_t v5 = (void **)__p[0];
  }
  if ((v7 & 0x80u) != 0) {
    unint64_t v4 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10000CD54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000CD70()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_range);
}

void sub_10000CDB4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_10000CDC8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    sub_1000046D0();
  }
  return operator new(48 * a2);
}

uint64_t sub_10000CE10(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
    sub_10000A780(i - 48);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *sub_10000CE60(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_1000046D0();
  }
  return operator new(2 * a2);
}

void *sub_10000CE94(void *a1)
{
  *a1 = off_100010468;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_10000CF00(void *a1)
{
  *a1 = off_100010468;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

uint64_t sub_10000CF8C(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(*(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(void *)(a2 + 16);
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_10000CFBC(void *a1)
{
  *a1 = off_100010468;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_10000D028(void *a1)
{
  *a1 = off_100010468;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

uint64_t sub_10000D0B4(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  uint64_t v2 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(void *)(v2 + 8) = *(void *)(a2 + 16);
  *(unsigned char *)(v2 + 16) = 1;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_10000D0EC()
{
}

void sub_10000D244(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_10000D27C(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    if ((v4 & 0xF8) == 0x30 || (v4 & 0xFE) == 0x38)
    {
      int v5 = v4 - 48;
      *a4 = v5;
      if (++a2 == a3)
      {
        return a3;
      }
      else
      {
        while (1)
        {
          int v6 = *a2;
          if ((v6 & 0xF8) != 0x30 && (v6 & 0xFE) != 0x38) {
            break;
          }
          if (v5 >= 214748364) {
            sub_10000D31C();
          }
          int v5 = v6 + 10 * v5 - 48;
          *a4 = v5;
          if (++a2 == a3) {
            return a3;
          }
        }
      }
    }
  }
  return a2;
}

void sub_10000D31C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badbrace);
}

void sub_10000D360(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000D374()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brace);
}

void sub_10000D3B8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000D3D0(void *a1)
{
  sub_10000D528(a1);

  operator delete();
}

unsigned int *sub_10000D408(unsigned int *result, void *a2)
{
  uint64_t v2 = result[10];
  uint64_t v3 = a2[7];
  int v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    unint64_t v5 = *v4 + 1;
    *int v4 = v5;
    unint64_t v6 = *((void *)result + 3);
    unint64_t v7 = *((void *)result + 4);
    BOOL v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      uint64_t v10 = *(void *)(v3 + 16 * v2 + 8);
      BOOL v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8) {
        goto LABEL_25;
      }
LABEL_22:
      a2[10] = *((void *)result + 1);
      return sub_10000D5DC(result, a2);
    }
    goto LABEL_23;
  }
  *int v4 = 0;
  if (*((void *)result + 4))
  {
    if (*((void *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((void *)result + 2);
  return result;
}

unsigned int *sub_10000D4BC(unsigned int *result, int a2, void *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((void *)result + 2);
  }
  else
  {
    a3[10] = *((void *)result + 1);
    return sub_10000D5DC(result, a3);
  }
  return result;
}

void sub_10000D4F0(void *a1)
{
  sub_10000D528(a1);

  operator delete();
}

void *sub_10000D528(void *a1)
{
  *a1 = off_1000108E8;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  *a1 = off_100010468;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  return a1;
}

unsigned int *sub_10000D5DC(unsigned int *result, void *a2)
{
  unsigned int v2 = result[11];
  *(void *)(a2[7] + 16 * result[10] + 8) = a2[2];
  unsigned int v3 = result[12];
  if (v2 != v3)
  {
    uint64_t v4 = v2 - 1;
    uint64_t v5 = a2[3];
    uint64_t v6 = v3 - 1 - v4;
    uint64_t v7 = a2[4] + 24 * v4 + 8;
    do
    {
      *(void *)(v7 - 8) = v5;
      *(void *)uint64_t v7 = v5;
      *(unsigned char *)(v7 + 8) = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

void sub_10000D634()
{
}

uint64_t sub_10000D648(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_10000D660(void *a1)
{
  sub_10000D528(a1);

  operator delete();
}

void sub_10000D698(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t sub_10000D6A4(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  uint64_t v3 = 8;
  if (a2) {
    uint64_t v3 = 16;
  }
  *(void *)(a3 + 80) = *(void *)(result + v3);
  return result;
}

void sub_10000D6CC()
{
}

uint64_t sub_10000D6E0(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_10000D6F4()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_empty);
}

void sub_10000D738(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_10000D74C(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = sub_10000D7E8(a1, a2, a3);
  if (v6 == a2) {
    return a2;
  }

  return sub_10000D8F8(a1, v6, a3);
}

unsigned char *sub_10000D7E8(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t v6 = sub_10000DA9C(a1, a2, a3);
  uint64_t v7 = v6;
  if (v6 == a2 && v6 != a3)
  {
    if (a2 + 1 == a3 || *a2 != 92)
    {
      return a2;
    }
    else
    {
      int v8 = a2[1];
      if (v8 == 40)
      {
        uint64_t v9 = (uint64_t)(a2 + 2);
        sub_1000082D4(a1);
        do
        {
          uint64_t v10 = (unsigned char *)v9;
          uint64_t v9 = sub_10000D74C(a1, v9, a3);
        }
        while ((unsigned char *)v9 != v10);
        if (v10 == a3 || v10 + 1 == a3 || *v10 != 92 || v10[1] != 41) {
          sub_10000785C();
        }
        uint64_t v7 = v10 + 2;
        sub_100008358(a1);
      }
      else
      {
        int v12 = sub_10000DD88(a1, v8);
        uint64_t v13 = 2;
        if (!v12) {
          uint64_t v13 = 0;
        }
        return &a2[v13];
      }
    }
  }
  return v7;
}

unsigned __int8 *sub_10000D8F8(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    if (v4 == 42) {
      sub_10000D0EC();
    }
    if (a2 + 1 != a3 && v4 == 92 && a2[1] == 123)
    {
      uint64_t v6 = a2 + 2;
      int v13 = 0;
      uint64_t v7 = sub_10000D27C(a1, a2 + 2, a3, &v13);
      if (v7 == v6) {
        goto LABEL_16;
      }
      if (v7 != a3)
      {
        int v8 = v7 + 1;
        int v9 = *v7;
        if (v9 == 44)
        {
          int v12 = -1;
          uint64_t v10 = sub_10000D27C(a1, v8, a3, &v12);
          if (v10 != a3 && v10 + 1 != a3 && *v10 == 92 && v10[1] == 125)
          {
            if (v12 != -1 && v12 < v13) {
LABEL_16:
            }
              sub_10000D31C();
LABEL_20:
            sub_10000D0EC();
          }
        }
        else if (v8 != a3 && v9 == 92 && *v8 == 125)
        {
          goto LABEL_20;
        }
      }
      sub_10000D374();
    }
  }
  return a2;
}

unsigned char *sub_10000DA9C(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 == a3)
  {
    uint64_t result = sub_10000DBD4(a1, a2, a3);
    if (result != a2) {
      return result;
    }
    goto LABEL_12;
  }
  int v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
  {
    sub_100008B8C(a1);
  }
  uint64_t result = sub_10000DBD4(a1, a2, a3);
  if (result == a2)
  {
    if (*a2 == 46) {
      operator new();
    }
LABEL_12:
    return sub_1000081C0(a1, a2, a3);
  }
  return result;
}

unsigned char *sub_10000DBD4(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 != a3
    && a2 + 1 != a3
    && *a2 == 92
    && ((char)a2[1] - 36) <= 0x3A
    && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
  {
    sub_100008B8C(a1);
  }
  return a2;
}

void *sub_10000DC50(void *a1)
{
  *a1 = off_100010468;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_10000DCBC(void *a1)
{
  *a1 = off_100010468;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

uint64_t sub_10000DD48(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned char **)(a2 + 16);
  if (v2 == *(unsigned char **)(a2 + 24) || !*v2)
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

uint64_t sub_10000DD88(uint64_t a1, unsigned __int8 a2)
{
  if (((a2 & 0xF8) == 0x30 || (a2 & 0xFE) == 0x38) && a2 - 49 <= 8)
  {
    if (a2 - 48 <= *(_DWORD *)(a1 + 28)) {
      sub_100008D24(a1);
    }
    sub_100008CCC();
  }
  return 0;
}

unsigned __int8 *sub_10000DDE8(uint64_t a1, char *a2, char *a3)
{
  int v6 = sub_10000DE48(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2) {
    sub_10000D6F4();
  }
  do
  {
    uint64_t v7 = v6;
    int v6 = sub_10000DE48(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  return v7;
}

unsigned __int8 *sub_10000DE48(uint64_t a1, char *a2, char *a3)
{
  int v6 = sub_10000DF8C(a1, a2, a3);
  uint64_t v7 = (unsigned __int8 *)v6;
  if (v6 == a2 && v6 != a3)
  {
    int v8 = *a2;
    if (v8 == 36) {
      sub_10000769C();
    }
    if (v8 != 40)
    {
      if (v8 == 94) {
        sub_100007618();
      }
      return (unsigned __int8 *)a2;
    }
    sub_1000082D4(a1);
    ++*(_DWORD *)(a1 + 36);
    int v9 = (char *)sub_100006590(a1, a2 + 1, a3);
    if (v9 == a3 || (uint64_t v10 = v9, *v9 != 41)) {
      sub_10000785C();
    }
    sub_100008358(a1);
    --*(_DWORD *)(a1 + 36);
    uint64_t v7 = (unsigned __int8 *)(v10 + 1);
  }
  if (v7 == (unsigned __int8 *)a2) {
    return (unsigned __int8 *)a2;
  }

  return sub_100007314(a1, v7, (unsigned __int8 *)a3);
}

char *sub_10000DF8C(uint64_t a1, char *a2, char *a3)
{
  uint64_t result = sub_10000E074(a1, a2, a3);
  if (result == a2)
  {
    uint64_t result = sub_10000E100(a1, a2, a3);
    if (result == a2)
    {
      if (a2 != a3 && *a2 == 46) {
        operator new();
      }
      return sub_1000081C0(a1, a2, a3);
    }
  }
  return result;
}

char *sub_10000E074(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3)
  {
    int v3 = *a2;
    uint64_t v4 = (v3 - 36);
    if (v4 > 0x3A) {
      goto LABEL_8;
    }
    if (((1 << (v3 - 36)) & 0x5800000080004D1) != 0) {
      return a2;
    }
    if (v4 == 5)
    {
      if (*(_DWORD *)(a1 + 36)) {
        return a2;
      }
    }
    else
    {
LABEL_8:
      if ((v3 - 123) < 2) {
        return a2;
      }
    }
    sub_100008B8C(a1);
  }
  return a2;
}

char *sub_10000E100(uint64_t a1, char *a2, char *a3)
{
  int v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  uint64_t v4 = (unsigned __int8 *)(a2 + 1);
  if (v3 + 1 == a3 || *v3 != 92) {
    return v3;
  }
  int v5 = (char)*v4;
  BOOL v6 = (v5 - 36) > 0x3A || ((1 << (*v4 - 36)) & 0x5800000080004F1) == 0;
  if (!v6 || (v5 - 123) < 3) {
    sub_100008B8C(a1);
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1F0) != 0x40)
  {
    int v8 = sub_10000DD88(a1, *v4);
    uint64_t v9 = 2;
    if (!v8) {
      uint64_t v9 = 0;
    }
    v3 += v9;
    return v3;
  }

  return sub_10000B644(a1, (char *)v4, a3, 0);
}

util::MappedFile *util::MappedFile::MappedFile(util::MappedFile *this, const char *a2)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  int v3 = open(a2, 0, 0);
  if ((v3 & 0x80000000) == 0)
  {
    int v4 = v3;
    if (!fstat(v3, &v10))
    {
      st_std::string::size_type size = v10.st_size;
      if ((v10.st_mode & 0xF000) == 0x8000 && v10.st_size > 0)
      {
        *((void *)this + 1) = v10.st_size;
        uint64_t v7 = mmap(0, st_size, 1, 1, v4, 0);
        if (v7 == (void *)-1) {
          int v8 = 0;
        }
        else {
          int v8 = v7;
        }
        *(void *)this = v8;
      }
    }
    close(v4);
  }
  return this;
}

void util::MappedFile::~MappedFile(util::MappedFile *this)
{
  uint64_t v2 = *(void **)this;
  if (v2) {
    munmap(v2, *((void *)this + 1));
  }
}

void *util::stringprintf@<X0>(util *this@<X0>, void *a2@<X8>, ...)
{
  va_start(va, a2);
  vsnprintf(__str, 0x400uLL, (const char *)this, va);
  return sub_100002108(a2, __str);
}

uint64_t sub_10000E328(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
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

uint64_t OSKextCopyLoadedKextInfo()
{
  return _OSKextCopyLoadedKextInfo();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return std::locale::name(retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return std::regex_error::regex_error(this, __ecode);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return std::__get_classname(__s, __icase);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return std::__get_collation_name(retstr, __s);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return std::locale::locale(this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return std::locale::locale(this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int ferror(FILE *a1)
{
  return _ferror(a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return _fgets(a1, a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

kern_return_t host_statistics64(host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return _host_statistics64(host_priv, flavor, host_info64_out, host_info64_outCnt);
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

kern_return_t mach_memory_info(mach_port_t host, mach_zone_name_array_t *names, mach_msg_type_number_t *namesCnt, mach_zone_info_array_t *info, mach_msg_type_number_t *infoCnt, mach_memory_info_array_t *memory_info, mach_msg_type_number_t *memory_infoCnt)
{
  return _mach_memory_info(host, names, namesCnt, info, infoCnt, memory_info, memory_infoCnt);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addopen(posix_spawn_file_actions_t *a1, int a2, const char *a3, int a4, mode_t a5)
{
  return _posix_spawn_file_actions_addopen(a1, a2, a3, a4, a5);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_destroy(a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_init(a1);
}

int reboot(int a1)
{
  return _reboot(a1);
}

int reboot_np(int howto, const char *message)
{
  return _reboot_np(howto, message);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
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

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void sync(void)
{
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

pid_t wait4(pid_t a1, int *a2, int a3, rusage *a4)
{
  return _wait4(a1, a2, a3, a4);
}

uint64_t xpc_create_from_plist()
{
  return _xpc_create_from_plist();
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}