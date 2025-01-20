uint64_t start(int a1, uint64_t a2)
{
  void *v4;
  kern_return_t v5;
  unint64_t v6;
  FILE *v7;
  FILE *v8;
  const char *v9;
  const char *v10;
  const char *v12;
  const char *v13;
  mach_msg_type_number_t init_port_setCnt;
  mach_port_array_t init_port_set;

  init_port_set = 0;
  init_port_setCnt = 0;
  v5 = mach_ports_lookup(mach_task_self_, &init_port_set, &init_port_setCnt);
  if (v5)
  {
    sub_100002ED4(v5);
  }
  else
  {
    if (!init_port_setCnt) {
      goto LABEL_17;
    }
    v6 = 0;
    v7 = (FILE *)qword_100008038;
    do
    {
      if (v7
        || (v7 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"),
            (qword_100008038 = (uint64_t)v7) != 0))
      {
        fprintf(v7, "%d Found valid port: %d Valid: %d\n", v6, init_port_set[v6], init_port_set[v6] - 1 < 0xFFFFFFFE);
        fprintf(__stderrp, "%d Found valid port: %d Valid: %d\n", v6, init_port_set[v6], init_port_set[v6] - 1 < 0xFFFFFFFE);
        v7 = (FILE *)qword_100008038;
      }
      ++v6;
    }
    while (v6 < init_port_setCnt);
    if (!init_port_setCnt) {
LABEL_17:
    }
      sub_100002E44();
    dword_100008040 = *init_port_set;
    if (a1 == 3)
    {
      v9 = *(const char **)(a2 + 8);
      v10 = *(const char **)(a2 + 16);
LABEL_16:
      sub_100002334(v9, v10);
      return 0;
    }
    if (a1 == 1)
    {
      v8 = (FILE *)qword_100008038;
      if (qword_100008038
        || (v8 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"),
            (qword_100008038 = (uint64_t)v8) != 0))
      {
        fwrite("Using default cache paths\n", 0x1AuLL, 1uLL, v8);
        fwrite("Using default cache paths\n", 0x1AuLL, 1uLL, __stderrp);
      }
      v9 = "/System/Library/xpc/launchd.plist";
      v10 = "/System/Library/xpc/launchd.plist.sig";
      goto LABEL_16;
    }
  }
  v12 = (const char *)sub_100002E60();
  return sub_100002334(v12, v13);
}

uint64_t sub_100002334(const char *a1, const char *a2)
{
  kern_return_t v22;
  FILE *v23;
  id v24;
  FILE *v25;
  id v26;
  const __SecCode *v27;
  FILE *v28;
  int v30;
  void *v31;
  const char *v32;
  char *v33;
  CFDictionaryRef information;
  SecStaticCodeRef staticCode;
  io_connect_t connect;
  uint64_t input[16];

  v4 = (FILE *)qword_100008038;
  if (qword_100008038
    || (v4 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v4) != 0))
  {
    fprintf(v4, "Code: %s Sig: %s\n", a1, a2);
    fprintf(__stderrp, "Code: %s Sig: %s\n", a1, a2);
  }
  v33 = 0;
  if (sub_100002B64("kern.bootargs", &v33) && v33)
  {
    if (sub_100002CF4(v33, "launchd_unsecure_cache=", 0))
    {
      v5 = (FILE *)qword_100008038;
      if (qword_100008038
        || (v5 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"),
            (qword_100008038 = (uint64_t)v5) != 0))
      {
        fprintf(v5, "Using unsecure cache: %s\n", a1);
        fprintf(__stderrp, "Using unsecure cache: %s\n", a1);
      }
      return sub_100002808(a1);
    }
  }
  else
  {
    v6 = (FILE *)qword_100008038;
    if (qword_100008038
      || (v6 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"),
          (qword_100008038 = (uint64_t)v6) != 0))
    {
      fwrite("No boot-args\n", 0xDuLL, 1uLL, v6);
      fwrite("No boot-args\n", 0xDuLL, 1uLL, __stderrp);
    }
  }
  uint64_t v7 = +[NSURL fileURLWithFileSystemRepresentation:a1 isDirectory:0 relativeToURL:0];
  v8 = +[NSURL fileURLWithFileSystemRepresentation:a2 isDirectory:0 relativeToURL:0];
  staticCode = 0;
  uint64_t v9 = SecStaticCodeCreateWithPath((CFURLRef)v7, 0, &staticCode);
  if (v9)
  {
    uint64_t v11 = sub_100003348(input, v9);
    goto LABEL_36;
  }
  v10 = +[NSData dataWithContentsOfURL:v8];
  uint64_t v11 = SecCodeSetDetachedSignature();
  if (v11)
  {
LABEL_36:
    uint64_t v14 = sub_1000032CC(input, v11);
LABEL_37:
    sub_100003250(input, v14);
    goto LABEL_38;
  }
  uint64_t v12 = SecStaticCodeCheckValidity(staticCode, 6u, 0);
  if (v12 != -66996)
  {
    uint64_t v13 = v12;
    if (v12) {
      goto LABEL_42;
    }
  }
  information = 0;
  uint64_t v14 = SecCodeCopySigningInformation(staticCode, 0, &information);
  if (v14) {
    goto LABEL_37;
  }
  CFDictionaryRef v15 = information;
  id v16 = [(__CFDictionary *)information objectForKeyedSubscript:kSecCodeInfoUnique];
  CFDictionaryRef v17 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v17);
  if (!MatchingService)
  {
LABEL_38:
    sub_100002FC8();
    goto LABEL_39;
  }
  io_object_t v19 = MatchingService;
  connect = 0;
  if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
  {
LABEL_39:
    sub_1000031DC();
    goto LABEL_40;
  }
  input[0] = 1;
  io_connect_t v20 = connect;
  id v21 = v16;
  v22 = IOConnectCallMethod(v20, 6u, input, 1u, [v21 bytes], (size_t)[v21 length], 0, 0, 0, 0);
  if (v22)
  {
    v30 = v22;
    v31 = v21;
    if (v30 == -536870160) {
      sub_10000314C(v21);
    }
    goto LABEL_41;
  }
  v23 = (FILE *)qword_100008038;
  if (qword_100008038
    || (v23 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"),
        (qword_100008038 = (uint64_t)v23) != 0))
  {
    v24 = [v21 description];
    fprintf(v23, "cdhash: %s is trusted\n", (const char *)[v24 UTF8String]);

    v25 = __stderrp;
    v26 = [v21 description];
    fprintf(v25, "cdhash: %s is trusted\n", (const char *)[v26 UTF8String]);
  }
  if (!connect) {
    sub_100002E44();
  }
  IOServiceClose(connect);
  IOObjectRelease(v19);

  v27 = staticCode;
  if (!v27) {
    sub_100002E44();
  }
  uint64_t v7 = SecCodeMapMemory(v27, 0);
  CFRelease(v27);
  if (!v7)
  {
    v28 = (FILE *)qword_100008038;
    if (qword_100008038
      || (v28 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"),
          (qword_100008038 = (uint64_t)v28) != 0))
    {
      fwrite("Attached signature to file, checking ...\n", 0x29uLL, 1uLL, v28);
      fwrite("Attached signature to file, checking ...\n", 0x29uLL, 1uLL, __stderrp);
    }
    return sub_100002808(a1);
  }
LABEL_40:
  v31 = (void *)sub_1000030D0(input, v7);
LABEL_41:
  sub_10000303C(v31, v30);
LABEL_42:
  v32 = (const char *)sub_100002F4C(input, v13);
  return sub_100002808(v32);
}

uint64_t sub_100002808(const char *a1)
{
  int v1 = open(a1, 0);
  if (v1 == -1)
  {
    sub_1000033C4();
LABEL_24:
    sub_1000035E8();
  }
  int v2 = v1;
  memset(&v12, 0, sizeof(v12));
  if (fstat(v1, &v12)) {
    goto LABEL_24;
  }
  v3 = mmap(0, v12.st_size, 1, 2, v2, 0);
  if (v3 == (void *)-1)
  {
    sub_100003450();
LABEL_26:
    sub_100003574();
  }
  int v4 = dword_100008040;
  if ((dword_100008040 - 1) >= 0xFFFFFFFE) {
    goto LABEL_26;
  }
  v5 = v3;
  v6 = (FILE *)qword_100008038;
  if (!qword_100008038)
  {
    v6 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w");
    qword_100008038 = (uint64_t)v6;
    if (!v6) {
      goto LABEL_9;
    }
    int v4 = dword_100008040;
  }
  fprintf(v6, "Trying to send bytes to launchd: %d %lu\n", v4, vm_page_size);
  fprintf(__stderrp, "Trying to send bytes to launchd: %d %lu\n", dword_100008040, vm_page_size);
LABEL_9:
  __dst = 0;
  int v7 = sub_100002D64(dword_100008040, (v12.st_size + vm_page_size - 1) & -(uint64_t)vm_page_size, (mach_vm_address_t *)&__dst, 1);
  if (v7) {
    sub_1000034FC(v7);
  }
  v8 = (FILE *)qword_100008038;
  if (qword_100008038
    || (v8 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v8) != 0))
  {
    fwrite("Sending validated cache to launchd\n", 0x23uLL, 1uLL, v8);
    fwrite("Sending validated cache to launchd\n", 0x23uLL, 1uLL, __stderrp);
  }
  memcpy(__dst, v5, v12.st_size);
  uint64_t v9 = (FILE *)qword_100008038;
  if (qword_100008038
    || (uint64_t v9 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v9) != 0))
  {
    fwrite("Cache sent to launchd successfully\n", 0x23uLL, 1uLL, v9);
    fwrite("Cache sent to launchd successfully\n", 0x23uLL, 1uLL, __stderrp);
  }
  if (!v5) {
    sub_100002E44();
  }
  if (munmap(v5, v12.st_size) == -1) {
    sub_1000034DC();
  }
  uint64_t result = close(v2);
  if (result == -1) {
    return sub_1000034DC();
  }
  return result;
}

uint64_t sub_100002A5C()
{
  return _abort_with_reason(7, 1, v0, 0);
}

uint64_t sub_100002A7C(_OWORD *a1, uint64_t a2)
{
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return _DebugGetErrorString(a2, a1, 128);
}

uint64_t sub_100002AB4(FILE *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  return fprintf(a1, v9);
}

uint64_t sub_100002AD0()
{
  return 1;
}

char *sub_100002AF0(char *a1, ...)
{
  va_start(va, a1);
  v3 = 0;
  while (1)
  {
    vasprintf(&v3, a1, va);
    uint64_t result = v3;
    if (v3) {
      break;
    }
    if (*__error() != 12)
    {
      if (*__error()) {
        sub_100003674();
      }
    }
    sub_100002AD0();
  }
  return result;
}

size_t sub_100002B64(const char *a1, char **a2)
{
  *__error() = 0;
  memset(v12, 0, sizeof(v12));
  size_t size = 128;
  int v4 = sysctlbyname(a1, v12, &size, 0, 0);
  int v5 = v4;
  if (size)
  {
    if (!v4) {
      goto LABEL_6;
    }
  }
  else
  {
    size_t size = 128;
    *__error() = 12;
    if (!v5) {
      goto LABEL_6;
    }
  }
  if (*__error() != 12) {
    return 0;
  }
LABEL_6:
  if (size != 128 || *__error() != 12)
  {
    uint64_t v10 = 0;
    v8 = (char *)v12;
    if (v5) {
      goto LABEL_13;
    }
LABEL_16:
    *a2 = strdup(v8);
    goto LABEL_17;
  }
  int v6 = sysctlbyname(a1, 0, &size, 0, 0);
  size_t result = 0;
  if (v6) {
    return result;
  }
  if (size < 0x81)
  {
    uint64_t v10 = 0;
    v8 = (char *)v12;
    goto LABEL_16;
  }
  v8 = (char *)sub_100002DDC(size);
  int v9 = sysctlbyname(a1, v8, &size, 0, 0);
  uint64_t v10 = v8;
  if (!v9) {
    goto LABEL_16;
  }
LABEL_13:
  size_t size = 0;
LABEL_17:
  free(v10);
  return size;
}

unint64_t sub_100002CF4(char *a1, const char *a2, uint64_t a3)
{
  int v5 = strstr(a1, a2);
  if (v5)
  {
    __endptr = 0;
    int v6 = &v5[strlen(a2)];
    unint64_t v7 = strtoul(v6, &__endptr, 10);
    if (v6 != __endptr) {
      return v7;
    }
  }
  return a3;
}

uint64_t sub_100002D64(mem_entry_name_port_t object, mach_vm_size_t size, mach_vm_address_t *a3, int a4)
{
  mach_vm_address_t address = 0;
  uint64_t result = mach_vm_map(mach_task_self_, &address, size, 0, 1, object, 0, a4 ^ 1, 67, 67, 2u);
  if (!result) {
    *a3 = address;
  }
  return result;
}

void *sub_100002DDC(size_t size)
{
  do
  {
    uint64_t v2 = malloc_type_calloc(1uLL, size, 0x5C63E6C5uLL);
    if (v2) {
      break;
    }
    if (*__error() != 12 && *__error()) {
      sub_100003674();
    }
  }
  while (sub_100002AD0());
  return v2;
}

void sub_100002E44()
{
}

uint64_t sub_100002E60()
{
  uint64_t v0 = sub_100002AF0("Invalid Args");
  uint64_t v1 = (FILE *)qword_100008038;
  if (qword_100008038
    || (uint64_t v1 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v1) != 0))
  {
    fprintf(v1, "abort: %s\n", v0);
    sub_100002AB4(__stderrp, v2, v3, v4, v5, v6, v7, v8, v11);
  }
  uint64_t v9 = sub_100002A5C();
  return sub_100002ED4(v9);
}

uint64_t sub_100002ED4(int a1)
{
  uint64_t v1 = sub_100002AF0("Unable to get stashed ports: %d", a1);
  int v2 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v2 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v2) != 0))
  {
    fprintf(v2, "abort: %s\n", v1);
    sub_100002AB4(__stderrp, v3, v4, v5, v6, v7, v8, v9, v13);
  }
  uint64_t v10 = (_OWORD *)sub_100002A5C();
  return sub_100002F4C(v10, v11);
}

uint64_t sub_100002F4C(_OWORD *a1, uint64_t a2)
{
  sub_100002A7C(a1, a2);
  int v4 = sub_100002AF0("Failed to verify codedirectory [%d|%s]", v2, v3);
  int v5 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v5 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v5) != 0))
  {
    fprintf(v5, "abort: %s\n", v4);
    sub_100002AB4(__stderrp, v6, v7, v8, v9, v10, v11, v12, v15);
  }
  uint64_t v13 = sub_100002A5C();
  return sub_100002FC8(v13);
}

uint64_t sub_100002FC8()
{
  uint64_t v0 = sub_100002AF0("Unable to find AMFI");
  uint64_t v1 = (FILE *)qword_100008038;
  if (qword_100008038
    || (uint64_t v1 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v1) != 0))
  {
    fprintf(v1, "abort: %s\n", v0);
    sub_100002AB4(__stderrp, v2, v3, v4, v5, v6, v7, v8, v11);
  }
  uint64_t v9 = sub_100002A5C();
  return sub_10000303C(v9);
}

uint64_t sub_10000303C(void *a1, int a2)
{
  id v3 = [a1 description];
  int v4 = sub_100002AF0("Unknown error (%d) checking cdhash %s", a2, (const char *)[v3 UTF8String]);

  int v5 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v5 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v5) != 0))
  {
    fprintf(v5, "abort: %s\n", v4);
    sub_100002AB4(__stderrp, v6, v7, v8, v9, v10, v11, v12, v15);
  }
  uint64_t v13 = sub_100002A5C();
  return sub_1000030D0(v13);
}

uint64_t sub_1000030D0(_OWORD *a1, uint64_t a2)
{
  sub_100002A7C(a1, a2);
  int v4 = sub_100002AF0("Failed to push signature to kernel [%d|%s]", v2, v3);
  int v5 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v5 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v5) != 0))
  {
    fprintf(v5, "abort: %s\n", v4);
    sub_100002AB4(__stderrp, v6, v7, v8, v9, v10, v11, v12, v15);
  }
  uint64_t v13 = sub_100002A5C();
  return sub_10000314C(v13);
}

uint64_t sub_10000314C(void *a1)
{
  id v1 = [a1 description];
  int v2 = sub_100002AF0("cdhash: %s is not in trust cache", (const char *)[v1 UTF8String]);

  id v3 = (FILE *)qword_100008038;
  if (qword_100008038
    || (id v3 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v3) != 0))
  {
    fprintf(v3, "abort: %s\n", v2);
    sub_100002AB4(__stderrp, v4, v5, v6, v7, v8, v9, v10, v13);
  }
  uint64_t v11 = sub_100002A5C();
  return sub_1000031DC(v11);
}

uint64_t sub_1000031DC()
{
  uint64_t v0 = sub_100002AF0("Unable to connect to AMFI");
  id v1 = (FILE *)qword_100008038;
  if (qword_100008038
    || (id v1 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v1) != 0))
  {
    fprintf(v1, "abort: %s\n", v0);
    sub_100002AB4(__stderrp, v2, v3, v4, v5, v6, v7, v8, v11);
  }
  uint64_t v9 = sub_100002A5C();
  return sub_100003250(v9);
}

uint64_t sub_100003250(_OWORD *a1, uint64_t a2)
{
  sub_100002A7C(a1, a2);
  int v4 = sub_100002AF0("Failed to get information [%d|%s]", v2, v3);
  int v5 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v5 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v5) != 0))
  {
    fprintf(v5, "abort: %s\n", v4);
    sub_100002AB4(__stderrp, v6, v7, v8, v9, v10, v11, v12, v15);
  }
  uint64_t v13 = sub_100002A5C();
  return sub_1000032CC(v13);
}

uint64_t sub_1000032CC(_OWORD *a1, uint64_t a2)
{
  sub_100002A7C(a1, a2);
  int v4 = sub_100002AF0("Failed to create set detatched signature [%d|%s]", v2, v3);
  int v5 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v5 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v5) != 0))
  {
    fprintf(v5, "abort: %s\n", v4);
    sub_100002AB4(__stderrp, v6, v7, v8, v9, v10, v11, v12, v15);
  }
  uint64_t v13 = sub_100002A5C();
  return sub_100003348(v13);
}

uint64_t sub_100003348(_OWORD *a1, uint64_t a2)
{
  sub_100002A7C(a1, a2);
  int v4 = sub_100002AF0("Failed to create SecStaticCodeRef [%d|%s]", v2, v3);
  int v5 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v5 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v5) != 0))
  {
    fprintf(v5, "abort: %s\n", v4);
    sub_100002AB4(__stderrp, v6, v7, v8, v9, v10, v11, v12, v14);
  }
  sub_100002A5C();
  return sub_1000033C4();
}

uint64_t sub_1000033C4()
{
  int v0 = *__error();
  id v1 = __error();
  int v2 = strerror(*v1);
  int v3 = sub_100002AF0("Failed to open fd [%d|%s]", v0, v2);
  int v4 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v4 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v4) != 0))
  {
    fprintf(v4, "abort: %s\n", v3);
    sub_100002AB4(__stderrp, v5, v6, v7, v8, v9, v10, v11, v14);
  }
  uint64_t v12 = sub_100002A5C();
  return sub_100003450(v12);
}

uint64_t sub_100003450()
{
  int v0 = *__error();
  id v1 = __error();
  int v2 = strerror(*v1);
  int v3 = sub_100002AF0("failed mmap [%d|%s]", v0, v2);
  int v4 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v4 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v4) != 0))
  {
    fprintf(v4, "abort: %s\n", v3);
    sub_100002AB4(__stderrp, v5, v6, v7, v8, v9, v10, v11, v14);
  }
  uint64_t v12 = sub_100002A5C();
  return sub_1000034DC(v12);
}

uint64_t sub_1000034DC()
{
  return _os_assumes_log();
}

void sub_1000034FC(int a1)
{
  id v1 = sub_100002AF0("Unable to map launchd memory: %d", a1);
  int v2 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v2 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v2) != 0))
  {
    fprintf(v2, "abort: %s\n", v1);
    sub_100002AB4(__stderrp, v3, v4, v5, v6, v7, v8, v9, v11);
  }
  uint64_t v10 = sub_100002A5C();
  sub_100003574(v10);
}

void sub_100003574()
{
  int v0 = sub_100002AF0("launchd port not valid");
  id v1 = (FILE *)qword_100008038;
  if (qword_100008038
    || (id v1 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v1) != 0))
  {
    fprintf(v1, "abort: %s\n", v0);
    sub_100002AB4(__stderrp, v2, v3, v4, v5, v6, v7, v8, v10);
  }
  uint64_t v9 = sub_100002A5C();
  sub_1000035E8(v9);
}

void sub_1000035E8()
{
  int v0 = *__error();
  id v1 = __error();
  int v2 = strerror(*v1);
  int v3 = sub_100002AF0("failed to stat fd [%d|%s]", v0, v2);
  int v4 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v4 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v4) != 0))
  {
    fprintf(v4, "abort: %s\n", v3);
    sub_100002AB4(__stderrp, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  sub_100002A5C();
  sub_100003674();
}

void sub_100003674()
{
  _os_assert_log();
  int v0 = (const void *)_os_crash();
  __break(1u);
  CFRelease(v0);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
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

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return _SecCodeCopySigningInformation(code, flags, information);
}

OSStatus SecCodeMapMemory(SecStaticCodeRef code, SecCSFlags flags)
{
  return _SecCodeMapMemory(code, flags);
}

uint64_t SecCodeSetDetachedSignature()
{
  return _SecCodeSetDetachedSignature();
}

OSStatus SecStaticCodeCheckValidity(SecStaticCodeRef staticCode, SecCSFlags flags, SecRequirementRef requirement)
{
  return _SecStaticCodeCheckValidity(staticCode, flags, requirement);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return _SecStaticCodeCreateWithPath(path, flags, staticCode);
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

int close(int a1)
{
  return _close(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

kern_return_t mach_ports_lookup(task_t target_task, mach_port_array_t *init_port_set, mach_msg_type_number_t *init_port_setCnt)
{
  return _mach_ports_lookup(target_task, init_port_set, init_port_setCnt);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return _mach_vm_map(target_task, address, size, mask, flags, object, offset, copy, cur_protection, max_protection, inheritance);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}