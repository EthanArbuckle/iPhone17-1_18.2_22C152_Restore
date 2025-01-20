uint64_t start()
{
  io_registry_entry_t v0;
  io_object_t v1;
  CFDataRef CFProperty;
  uint64_t Length;
  size_t v4;
  timespec v5;
  int v6;
  char *v7;
  int v8;
  int v10;
  timespec v11;
  char *v12;
  size_t v13;
  int v14;
  stat v15;
  mach_port_t mainPort[4];
  timespec v17;
  timespec v18;
  timespec v19;
  timespec v20;
  CFRange v21;

  puts("checking in");
  if ((chdir(off_100014008) & 0x80000000) == 0)
  {
LABEL_2:
    fflush(__stdoutp);
    mainPort[0] = -1431655766;
    if (!IOMainPort(0, mainPort))
    {
      v0 = IORegistryEntryFromPath(mainPort[0], "IODeviceTree:/chosen");
      if (v0)
      {
        v1 = v0;
        CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v0, @"osenvironment", kCFAllocatorDefault, 0);
        Length = CFDataGetLength(CFProperty);
        if (CFProperty && (v4 = Length, Length <= 64))
        {
          v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
          v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
          v15.st_atimespec = v5;
          v15.st_mtimespec = v5;
          *(timespec *)&v15.st_dev = v5;
          *(timespec *)&v15.st_uid = v5;
          v21.location = 0;
          v21.length = Length;
          CFDataGetBytes(CFProperty, v21, (UInt8 *)&v15);
          v6 = strncmp("darwinos-ramdisk", (const char *)&v15, v4);
          CFRelease(CFProperty);
          IOObjectRelease(v1);
          if (!v6)
          {
            *(_OWORD *)&v15.st_dev = off_100010560;
            sigaction(31, (const sigaction *)&v15, 0);
            while (1)
              usleep(0xF4240u);
          }
        }
        else
        {
          if (CFProperty) {
            CFRelease(CFProperty);
          }
          IOObjectRelease(v1);
        }
      }
    }
    *(_OWORD *)&v15.st_dev = off_100010570;
    sigaction(15, (const sigaction *)&v15, 0);
    sigaction(3, (const sigaction *)&v15, 0);
    sigaction(2, (const sigaction *)&v15, 0);
    xpc_activity_register("com.apple.iomfb_bics_daemon", XPC_ACTIVITY_CHECK_IN, &stru_1000105A0);
    dispatch_main();
  }
  v7 = off_100014000[0];
  v8 = *off_100014000[0];
  if (v8 == 47)
  {
    if (chdir("/")) {
      goto LABEL_11;
    }
    v10 = *++v7;
    v8 = v10;
  }
  if (!v8) {
    goto LABEL_2;
  }
  while (1)
  {
    v11.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v11.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    v19 = v11;
    v20 = v11;
    v17 = v11;
    v18 = v11;
    *(timespec *)mainPort = v11;
    *(timespec *)&v15.st_blksize = v11;
    *(timespec *)v15.st_qspare = v11;
    v15.st_birthtimespec = v11;
    *(timespec *)&v15.st_size = v11;
    v15.st_mtimespec = v11;
    v15.st_ctimespec = v11;
    *(timespec *)&v15.st_uid = v11;
    v15.st_atimespec = v11;
    *(timespec *)&v15.st_dev = v11;
    v12 = strchr(v7, 47);
    v13 = v12 ? v12 - v7 : strlen(v7);
    if (v13 - 80 < 0xFFFFFFFFFFFFFFAFLL) {
      break;
    }
    __strncpy_chk();
    *((unsigned char *)mainPort + v13) = 0;
    if (stat((const char *)mainPort, &v15))
    {
      if (*__error() != 2 || mkdir((const char *)mainPort, 0x1F8u)) {
        break;
      }
    }
    if (chdir((const char *)mainPort)) {
      break;
    }
    v7 = &v7[v13 - 1];
    do
      v14 = *++v7;
    while (v14 == 47);
    if (!*v7) {
      goto LABEL_2;
    }
  }
LABEL_11:
  printf("failed to connect to working directory");
  return 1;
}

void sub_100001340()
{
  unsigned int v0 = atomic_fetch_or((atomic_ullong *volatile)&dword_100014010, 1uLL);
  if (v0) {
    int v1 = 3;
  }
  else {
    int v1 = v0 >> 1;
  }
  if ((v1 - 2) >= 2)
  {
    if (!v1) {
      sub_100001BAC((char *)qword_100014258);
    }
    exit(0);
  }
}

void sub_100001398(id a1, OS_xpc_object *a2)
{
  xpc_activity_state_t state = xpc_activity_get_state(a2);
  if (state == 2)
  {
    if (!qword_100014258) {
      return;
    }
    unsigned int v3 = atomic_fetch_or((atomic_ullong *volatile)&dword_100014010, 4uLL);
    if (v3 >= 2)
    {
      puts("State transition error");
      exit(1);
    }
    if ((dword_100014010 & 0xFFFFFFFE) != 4) {
      printf("%s(%d), op failed\n", "set_state", 2);
    }
    if (!v3)
    {
      puts("woke");
      fflush(__stdoutp);
      sub_100001C48((char *)qword_100014258);
    }
    char v4 = atomic_fetch_and((atomic_ullong *volatile)&dword_100014010, 1uLL);
    if (dword_100014010 >= 2) {
      printf("%s(%d), op failed\n", "set_state", 0);
    }
    if (v4) {
      exit(0);
    }
    goto LABEL_18;
  }
  if (state)
  {
    printf("xpc_activity_state_t state = %lld, d=%d\n");
LABEL_18:
    puts("sleeping");
    v5 = __stdoutp;
    fflush(v5);
    return;
  }
  if (qword_100014258) {
    return;
  }
  puts("starting");
  fflush(__stdoutp);
  qword_100014258 = sub_100001898();
  if (qword_100014258)
  {
    atomic_fetch_and((atomic_ullong *volatile)&dword_100014010, 1uLL);
    if (dword_100014010 >= 2) {
      printf("%s(%d), op failed\n");
    }
    goto LABEL_18;
  }
  puts("failed to start properly");

  xpc_activity_unregister("com.apple.iomfb_bics_daemon");
}

uint64_t sub_1000015A0(int a1)
{
  return ((a1 + 217) & 0xFFFFFFFC) + 4;
}

uint64_t sub_1000015B0(_DWORD *a1)
{
  if (*a1 == 1) {
    return 14;
  }
  else {
    return 0;
  }
}

uint64_t sub_1000015C4(uint64_t result, int a2)
{
  if (result)
  {
    if (*(_DWORD *)result == 1
      && (int v2 = *(_DWORD *)(result + 8) + *(unsigned __int16 *)(result + 4) * *(unsigned __int16 *)(result + 6), v2 != -14))
    {
      unsigned int v3 = (v2 + 17) & 0xFFFFFFFC;
      if (a2) {
        int v4 = 4;
      }
      else {
        int v4 = 0;
      }
      return v3 + v4;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

_DWORD *sub_100001610(_DWORD *result)
{
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)(result[2] + 14);
    }
    else {
      return 0;
    }
  }
  return result;
}

BOOL sub_100001634(const char *a1, size_t __n, char *__s2, int a4)
{
  return __n == a4 && strncmp(a1, __s2, __n) == 0;
}

int *sub_100001674(int *result, int a2, int *a3)
{
  for (int i = *a3; a2; --a2)
  {
    int v4 = *result++;
    int i = v4 ^ __ROR4__(i, 15);
  }
  *a3 = i;
  return result;
}

void sub_100001694(int a1, int a2, uint64_t a3, intptr_t notificationID)
{
  if (a3 == -536870112)
  {
    byte_100014019 = 0;
    (*(void (**)(uint64_t, void, uint64_t, intptr_t))(*(void *)qword_100014700 + 64))(qword_100014700, 0, a3, notificationID);
    if (byte_10001401C) {
      BOOL v5 = byte_10001401B == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5)
    {
      sub_100002BA0("Woke up: resuming pending tasks.\n");
      IOMobileFramebufferSetParameter();
      if (!(*(unsigned int (**)(uint64_t))(*(void *)qword_100014700 + 24))(qword_100014700)) {
        byte_10001401B = 0;
      }
      IOMobileFramebufferSetParameter();
    }
  }
  else
  {
    if (a3 == -536870272)
    {
      if (byte_10001401A) {
        v6 = (const char *)&unk_10000ACAB;
      }
      else {
        v6 = "not ";
      }
      sub_100002BA0("going to sleep, %sbusy", v6);
      (*(void (**)(uint64_t, uint64_t))(*(void *)qword_100014700 + 64))(qword_100014700, 1);
      pthread_mutex_lock(&stru_100014020);
      if (byte_10001401A)
      {
        byte_100014019 = 1;
        pthread_cond_wait(&stru_100014060, &stru_100014020);
      }
      pthread_mutex_unlock(&stru_100014020);
      sub_100002BA0("allowing sleep");
    }
    else if (a3 != -536870288)
    {
      return;
    }
    io_connect_t v7 = dword_10001470C;
    IOAllowPowerChange(v7, notificationID);
  }
}

uint64_t sub_100001898()
{
  if (!byte_100014018 && !IOMobileFramebufferGetMainDisplay())
  {
    qword_100014700 = 0;
    io_registry_entry_t ServiceObject = IOMobileFramebufferGetServiceObject();
    unsigned int v1 = sub_10000281C(ServiceObject, "IOMFBBICSType");
    if (v1 == 2)
    {
      sub_100002BA0("BICS backlight support");
      operator new();
    }
    if (v1 == 1)
    {
      sub_100002BA0("BICS pixel support");
      operator new();
    }
    sub_100002BA0("BICS no support");
    qword_100014700 = 0;
    sub_100001B54();
  }
  return 0;
}

void sub_100001B1C()
{
}

uint64_t sub_100001B54()
{
  if (qword_100014098) {
    CFRelease((CFTypeRef)qword_100014098);
  }
  qword_100014098 = 0;
  uint64_t result = qword_100014700;
  if (qword_100014700)
  {
    nullsub_2();
    operator delete();
  }
  qword_100014700 = 0;
  return result;
}

uint64_t sub_100001BAC(char *a1)
{
  if (a1 == &byte_100014018)
  {
    IOMobileFramebufferSetParameter();
    uint64_t v1 = sub_1000025EC(qword_100014700);
    IOMobileFramebufferSetParameter();
  }
  else
  {
    syslog(5, "totally bogus daemon pointer.");
    return 3758097084;
  }
  return v1;
}

uint64_t sub_100001C48(char *a1)
{
  if (a1 == &byte_100014018)
  {
    pthread_mutex_lock(&stru_100014020);
    if (byte_100014019)
    {
      pthread_mutex_unlock(&stru_100014020);
      return 0;
    }
    else
    {
      byte_10001401A = 1;
      pthread_mutex_unlock(&stru_100014020);
      IOMobileFramebufferSetParameter();
      uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)qword_100014700 + 24))(qword_100014700);
      if (v1 == -536870165) {
        byte_10001401B = 1;
      }
      IOMobileFramebufferSetParameter();
      pthread_mutex_lock(&stru_100014020);
      byte_10001401A = 0;
      if (byte_100014019)
      {
        byte_100014019 = 0;
        pthread_cond_signal(&stru_100014060);
      }
      pthread_mutex_unlock(&stru_100014020);
      sub_100002BA0("done");
      int v2 = sem_open("iomfb_bics_daemon.started", 0);
      if (v2 == (sem_t *)-1)
      {
        sub_100002BA0("Couldn't open semaphore to notify");
      }
      else
      {
        unsigned int v3 = v2;
        sem_post(v2);
        sem_close(v3);
      }
    }
  }
  else
  {
    uint64_t v1 = 3758097084;
    syslog(5, "totally bogus daemon pointer.");
  }
  return v1;
}

uint64_t sub_100001DD4()
{
  byte_100014708 = 1;
  byte_100014709 = 1;
  uint64_t result = sub_100001898();
  if (result)
  {
    int v5 = -1431655766;
    *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v4[4] = v1;
    v4[5] = v1;
    v4[2] = v1;
    v4[3] = v1;
    v4[0] = v1;
    v4[1] = v1;
    IOMobileFramebufferSetParameter();
    (*(void (**)(uint64_t, _OWORD *))(*(void *)qword_100014700 + 40))(qword_100014700, v4);
    IOMobileFramebufferSetParameter();
    int v2 = fopen("/var/hardware/done", "w");
    if (!v2)
    {
      sub_100001FE0("Couldn't open 'done' file");
      exit(-1);
    }
    unsigned int v3 = v2;
    fprintf(v2, "%s\n", (const char *)v4);
    return fclose(v3);
  }
  return result;
}

uint64_t sub_100001F18(uint64_t result)
{
  *(void *)uint64_t result = off_1000105D0;
  *(void *)(result + 16) = 0;
  *(_DWORD *)(result + 25) = 0;
  return result;
}

uint64_t sub_100001F44(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  return 1;
}

uint64_t sub_100001F50(uint64_t a1, const __CFString *a2)
{
  io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/defaults");
  if (v3)
  {
    io_object_t v4 = v3;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v3, a2, kCFAllocatorDefault, 0);
    IOObjectRelease(v4);
    if (CFProperty)
    {
      CFRelease(CFProperty);
      char v6 = 1;
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    sub_100001FE0("unable to find /defaults node\n");
  }
  return v6 & 1;
}

void sub_100001FE0(char *a1, ...)
{
  va_start(va, a1);
  vsyslog(4, a1, va);
  if (byte_10001470A)
  {
    vprintf(a1, va);
    fputc(10, __stdoutp);
  }
}

uint64_t sub_10000204C(uint64_t a1)
{
  uint64_t result = sub_100001F50(a1, @"ean-storage-present");
  *(unsigned char *)(a1 + 25) = result;
  return result;
}

uint64_t sub_10000207C(uint64_t a1)
{
  uint64_t result = sub_100001F50(a1, @"display-storage-present");
  *(unsigned char *)(a1 + 24) = result;
  return result;
}

uint64_t sub_1000020AC(uint64_t a1)
{
  sub_100002104();
  int v2 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 80);

  return v2(a1);
}

void sub_100002104()
{
  uint64_t v0 = __chkstk_darwin();
  time_t v1 = time(0);
  bzero(&v44[3], 0x5ECuLL);
  v44[0] = 1;
  *(void *)&v44[1] = v1;
  *(void *)&v44[5] = v1;
  memcpy(v43, &unk_10000CEE0, sizeof(v43));
  memcpy(__dst, &unk_10000D0E0, sizeof(__dst));
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v39[12] = v2;
  long long v38 = v2;
  *(_OWORD *)v39 = v2;
  long long v35 = xmmword_10000FB10;
  long long v36 = unk_10000FB20;
  long long v37 = xmmword_10000FB30;
  int v34 = -1;
  unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0;
  uint64_t v31 = 0;
  unsigned int v30 = 0;
  uint64_t v41 = 0;
  uint64_t v40 = 0;
  io_registry_entry_t ServiceObject = IOMobileFramebufferGetServiceObject();
  unsigned int v4 = sub_10000281C(ServiceObject, "ean-mode-caching");
  unsigned int v5 = sub_10000281C(ServiceObject, "ean-mode-update-thesh");
  if (v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = 172800;
  }
  if (v4 && *(unsigned char *)(v0 + 25))
  {
    if (!sub_1000028C8(0x50525354u, (void **)&v32, (_DWORD *)&v31 + 1))
    {
      if (HIDWORD(v31) > 0x3FF)
      {
        io_connect_t v7 = v32;
        if (v32)
        {
          v8 = (uint64_t *)(v32 + 5);
          if (*(void *)(v32 + 5))
          {
            sub_100001674(v32 + 5, 2, (int *)&v31);
            if (*(void *)(v7 + 7) == v31)
            {
              uint64_t v9 = *v8;
              if (v1 != *v8)
              {
                if ((v1 - *v8) / (unint64_t)(*(void *)(v7 + 3) + 1) < v6)
                {
LABEL_44:
                  free(v7);
                  return;
                }
                *(void *)&v44[3] = *(void *)(v7 + 3) + 1;
                *(void *)&v44[5] = v9;
              }
            }
          }
        }
      }
      else
      {
        sub_100001FE0("modeInfoUpdate: size mismatch\n");
        sub_100002A2C(0x50525354u);
      }
    }
    uint64_t v10 = 0;
    v11 = v43;
    while (1)
    {
      HIDWORD(v40) = v10;
      if (IOMobileFramebufferGetBlock()) {
        break;
      }
      ++v10;
      v11 += 64;
      if (v10 == 8)
      {
        *(void *)&v44[129] = 4;
        break;
      }
    }
    uint64_t v12 = 153;
    v13 = &dword_10000FB40;
    do
    {
      unsigned int v14 = *v13++;
      v15 = &v43[64 * (unint64_t)v14];
      long long v16 = v15[1];
      v29[0] = *v15;
      v29[1] = v16;
      long long v17 = v15[3];
      v29[2] = v15[2];
      v29[3] = v17;
      sub_10000274C(&v44[v12], v29);
      v12 += 16;
    }
    while (v12 != 249);
    uint64_t v18 = 0;
    v19 = __dst;
    do
    {
      HIDWORD(v40) = v18;
      int Block = IOMobileFramebufferGetBlock();
      if (*((_DWORD *)v19 + 2) == 8)
      {
        io_connect_t v7 = v32;
        goto LABEL_43;
      }
      int v21 = Block;
      if (Block) {
        BOOL v22 = 1;
      }
      else {
        BOOL v22 = v18 == 17;
      }
      ++v18;
      v19 += 75;
    }
    while (!v22);
    uint64_t v23 = 249;
    v24 = &dword_10000FB58;
    do
    {
      unsigned int v25 = *v24++;
      memcpy(v28, &__dst[75 * v25], sizeof(v28));
      sub_1000027B0((uint64_t)&v44[v23], (uint64_t)v28);
      v23 += 16;
    }
    while (v23 != 377);
    if (!v21) {
      *(void *)&v44[129] |= 8uLL;
    }
    if (!IOMobileFramebufferGetBlock()) {
      *(void *)&v44[129] |= 1uLL;
    }
    *(_OWORD *)&v44[131] = v38;
    *(_OWORD *)&v44[135] = *(_OWORD *)v39;
    *(void *)&v44[139] = *(void *)&v39[16];
    if (!IOMobileFramebufferGetBlock()) {
      *(void *)&v44[129] |= 2uLL;
    }
    v44[141] = v35;
    LOWORD(v44[143]) = WORD4(v35);
    *(_OWORD *)&v44[145] = v36;
    *(_OWORD *)&v44[149] = v37;
    if (!IOMobileFramebufferGetBlock()) {
      *(void *)&v44[129] |= 0x10uLL;
    }
    v44[377] = v33;
    LOBYTE(v44[378]) = BYTE4(v33);
    v44[379] = v34;
    sub_100001674(&v44[129], 252, &v44[381]);
    io_connect_t v7 = v32;
    if (v32 && v44[381] == v32[381]) {
      goto LABEL_44;
    }
    sub_100001674(&v44[5], 2, (int *)&v30);
    *(void *)&v44[7] = v30;
    v26 = malloc_type_malloc(0x1000uLL, 0xFF74838BuLL);
    if (v26)
    {
      v27 = v26;
      bzero(v26, 0x1000uLL);
      memcpy(v27, v44, 0x5F8uLL);
      sub_100002AC0(0x50525354u, (uint64_t)v27, 0x400u);
      free(v27);
    }
LABEL_43:
    if (!v7) {
      return;
    }
    goto LABEL_44;
  }
}

uint64_t sub_1000025EC(uint64_t a1)
{
  sub_1000026B0(a1, 1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 72))(a1, 1);
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  (*(void (**)(uint64_t, void))(*(void *)a1 + 72))(a1, 0);
  sub_1000026B0(a1, 0);
  sub_100002104();
  return v2;
}

uint64_t sub_1000026B0(uint64_t a1, int a2)
{
  io_registry_entry_t ServiceObject = IOMobileFramebufferGetServiceObject();
  if (!sub_10000281C(ServiceObject, "LTHSaveDispPerfBoostEnable")) {
    return 0;
  }
  uint64_t v4 = IOMobileFramebufferSetParameter();
  sub_100002BA0("request_disp_perf_boost( %d) -> %d\n", a2, v4);
  return v4;
}

double sub_100002730(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  double result = *(double *)(a2 + 32);
  *(double *)(a1 + 32) = result;
  return result;
}

float sub_10000274C(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2 = 0;
  io_registry_entry_t v3 = a2 + 13;
  *a1 = *a2;
  do
  {
    uint64_t v4 = &a1[v2 + 13];
    *(v4 - 12) = v3[v2 - 12];
    *uint64_t v4 = v3[v2++];
  }
  while (v2 != 3);
  for (uint64_t i = 4; i != 13; ++i)
  {
    float result = *(float *)&a2[i];
    *(float *)&a1[i] = result;
  }
  return result;
}

uint64_t sub_1000027A0(uint64_t result)
{
  if ((result - 1) >= 9) {
    return 0;
  }
  else {
    return result;
  }
}

float sub_1000027B0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  int v2 = *(_DWORD *)(a2 + 8);
  if ((v2 - 1) >= 9) {
    int v2 = 0;
  }
  *(_DWORD *)(a1 + 8) = v2;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 + 12);
  *(void *)(a1 + 28) = *(void *)(a2 + 28);
  float result = *(float *)(a2 + 36);
  *(float *)(a1 + 36) = result;
  return result;
}

uint64_t sub_100002808(int a1, int a2)
{
  return (a1 + a2 - 1) & -a2;
}

CFStringRef sub_10000281C(io_registry_entry_t a1, const char *a2)
{
  CFStringRef result = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  if (result)
  {
    CFStringRef v4 = result;
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, result, kCFAllocatorDefault, 0);
    CFRelease(v4);
    if (CFProperty)
    {
      unsigned int valuePtr = -1431655766;
      if (!CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr)) {
        unsigned int valuePtr = 0;
      }
      CFRelease(CFProperty);
      return (const __CFString *)valuePtr;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000028C8(unsigned int a1, void **a2, _DWORD *a3)
{
  mach_port_t connection = -1431655766;
  uint64_t v6 = sub_1000088D0(&connection);
  if (v6) {
    return v6;
  }
  *a2 = 0;
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint64_t input = a1;
  uint32_t outputCnt = 1;
  uint64_t v6 = IOConnectCallMethod(connection, 3u, &input, 1u, 0, 0, &output, &outputCnt, 0, 0);
  if (!v6)
  {
    size_t v8 = output;
    *a3 = output >> 2;
    uint64_t v9 = malloc_type_malloc(v8, 0x7AFB2134uLL);
    *a2 = v9;
    if (v9)
    {
      v14[0] = a1;
      v14[1] = (uint64_t)v9;
      v14[2] = output;
      uint64_t v6 = IOConnectCallMethod(connection, 4u, v14, 3u, 0, 0, 0, 0, 0, 0);
      IOServiceClose(connection);
      if (!v6) {
        return v6;
      }
      goto LABEL_4;
    }
    uint64_t v6 = 3758097085;
  }
  IOServiceClose(connection);
LABEL_4:
  if (*a2) {
    free(*a2);
  }
  *a2 = 0;
  sub_100001FE0("EAN read failed: 0x%X", v6);
  return v6;
}

uint64_t sub_100002A2C(unsigned int a1)
{
  io_connect_t v5 = -1431655766;
  uint64_t v2 = sub_1000088D0(&v5);
  if (!v2)
  {
    uint64_t input = a1;
    uint64_t v2 = IOConnectCallMethod(v5, 5u, &input, 1u, 0, 0, 0, 0, 0, 0);
    IOServiceClose(v5);
    if (v2) {
      sub_100001FE0("EAN erase failed: 0x%X", v2);
    }
  }
  return v2;
}

uint64_t sub_100002AC0(unsigned int a1, uint64_t a2, unsigned int a3)
{
  uint64_t output = 0;
  mach_port_t connection = -1431655766;
  uint32_t outputCnt = 1;
  uint64_t v6 = sub_1000088D0(&connection);
  if (!v6)
  {
    input[0] = a1;
    input[1] = a2;
    input[2] = 4 * a3;
    uint64_t v6 = IOConnectCallMethod(connection, 2u, input, 3u, 0, 0, &output, &outputCnt, 0, 0);
    IOServiceClose(connection);
    if (v6) {
      sub_100001FE0("EAN update failed: 0x%X", v6);
    }
  }
  return v6;
}

void sub_100002BA0(char *a1, ...)
{
  va_start(va, a1);
  vsyslog(5, a1, va);
  if (byte_10001470A)
  {
    vprintf(a1, va);
    fputc(10, __stdoutp);
  }
}

uint64_t sub_100002C0C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 24))
  {
    time_t v1 = 0;
  }
  else if (*(unsigned char *)(a1 + 136))
  {
    time_t v1 = "migrate_history";
  }
  else
  {
    time_t v1 = *(const char **)(a1 + 16 * (*(_DWORD *)(a1 + 112) != 0) + 32);
  }
  return sub_100005C94(a1, 14, 1, 1, *(void *)(a1 + 16 * (*(_DWORD *)(a1 + 112) != 0) + 40), (uint64_t)v1, "history");
}

uint64_t sub_100002CB4()
{
  int v1 = 120;
  while (1)
  {
    uint64_t v2 = IOMobileFramebufferSetParameter();
    io_registry_entry_t v3 = sub_100005550(v2);
    sub_100002BA0("%s: Update_BIC => %s", "update_bic", v3);
    if (v2 == -536870184 || v2 == -536870187) {
      usleep(0xF4240u);
    }
    else {
      uint64_t v0 = v2;
    }
    if (v2 != -536870184 && v2 != -536870187) {
      break;
    }
    if (!--v1) {
      return 3758097084;
    }
  }
  return v0;
}

uint64_t sub_100002D80(uint64_t a1)
{
  sub_100002BA0("%s", "save_bic");
  uint64_t v2 = sub_100005C94(a1, 13, 1, 1, *(void *)(a1 + 72), *(void *)(a1 + 64), "BIC");
  if (*(unsigned char *)(a1 + 25)) {
    io_registry_entry_t v3 = (const char *)&unk_10000ACAB;
  }
  else {
    io_registry_entry_t v3 = "not ";
  }
  sub_100002BA0("ean %spresent, membuf %sallocated\n", v3, "not ");
  return v2;
}

uint64_t sub_100002E6C()
{
  while (1)
  {
    uint64_t Block = IOMobileFramebufferGetBlock();
    if (Block != -536870187 && Block != -536870184) {
      break;
    }
    usleep(0xF4240u);
  }
  uint64_t v2 = Block;
  if (Block)
  {
    sub_100002BA0(">> BICAB read failed");
  }
  else
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    if (v3)
    {
      CFStringRef v4 = v3;
      xpc_dictionary_set_double(v3, "boost", NAN);
      analytics_send_event();
      xpc_release(v4);
      uint64_t v2 = 0;
      sub_100002BA0("BICAB saved");
    }
    else
    {
      return 3758097084;
    }
  }
  return v2;
}

uint64_t sub_100002F64()
{
  while (1)
  {
    uint64_t Block = IOMobileFramebufferGetBlock();
    if (Block != -536870187 && Block != -536870184) {
      break;
    }
    usleep(0xF4240u);
  }
  uint64_t v2 = Block;
  if (Block)
  {
    sub_100002BA0(">> UA Boost read failed", 0xAAAAAAAAAAAAAAAALL);
  }
  else
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    if (v3)
    {
      CFStringRef v4 = v3;
      xpc_dictionary_set_double(v3, "uaboost", NAN);
      analytics_send_event();
      xpc_release(v4);
      uint64_t v2 = 0;
      sub_100002BA0("UA Boost saved", 0xAAAAAAAAAAAAAAAALL);
    }
    else
    {
      return 3758097084;
    }
  }
  return v2;
}

uint64_t sub_100003080(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 25)) {
    return 0;
  }
  sub_100002BA0("%s", "save_ibic");
  uint64_t v2 = sub_100005788();
  if (v2)
  {
    uint64_t v1 = v2;
    CFDataRef v3 = 0;
    goto LABEL_14;
  }
  MEMORY[0xFFFFFFFFFFFFFFFC] = ~sub_100008768(0xFFFFFFFFLL, 0, -4);
  CFDataRef v4 = CFDataCreateWithBytesNoCopy(0, 0, 0, kCFAllocatorNull);
  CFDataRef v3 = v4;
  if (!v4)
  {
    sub_100001FE0("Unable to create dictionary");
LABEL_13:
    uint64_t v1 = 0;
    goto LABEL_14;
  }
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v24 = v5;
  long long v25 = v5;
  long long v22 = v5;
  long long v23 = v5;
  long long v20 = v5;
  long long v21 = v5;
  long long v18 = v5;
  long long v19 = v5;
  long long v16 = v5;
  long long v17 = v5;
  long long v14 = v5;
  long long v15 = v5;
  long long v12 = v5;
  long long v13 = v5;
  *(_OWORD *)__s = v5;
  long long v11 = v5;
  if ((sub_100005A94((uint64_t)v4, __s, 0x100uLL) & 1) == 0)
  {
    sub_100001FE0("Unable to find firmware device");
    uint64_t v1 = 3758097098;
    goto LABEL_14;
  }
  sub_100002BA0("Firmware partition: %s", __s);
  size_t v6 = strlen(__s);
  CFURLRef v7 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)__s, v6, 0);
  if (!v7)
  {
    sub_100001FE0("Unable to generate path URL");
    goto LABEL_13;
  }
  CFURLRef v8 = v7;
  uint64_t v1 = AMRestorePartitionFWCommitData(v7, @"ibic", v3, 1);
  CFRelease(v8);
  if (v1) {
    sub_100001FE0("Failed to create iBIC in firmware partition");
  }
  else {
    sub_100002BA0("iBIC created in firmware partition");
  }
LABEL_14:
  if (v3) {
    CFRelease(v3);
  }
  return v1;
}

uint64_t sub_1000032A4(uint64_t a1)
{
  long long v17 = 0;
  sub_100002BA0("%s", "save_recovery_lth");
  sub_1000065CC(a1);
  uint64_t v2 = *(unsigned __int16 *)(a1 + 140);
  if (*(_WORD *)(a1 + 140) && (uint64_t v3 = *(unsigned __int16 *)(a1 + 142), *(_WORD *)(a1 + 142)) && *(_DWORD *)(a1 + 144))
  {
    unsigned int v16 = -1431655766;
    int v4 = *(unsigned char *)(a1 + 25) != 0;
    if (*(unsigned char *)(a1 + 25)) {
      int v5 = -4096;
    }
    else {
      int v5 = 0;
    }
    int v6 = v4 << 12;
    int v7 = 2 * *(unsigned __int8 *)(a1 + 25);
    LODWORD(v15) = v4 << 12;
    uint64_t v8 = sub_100005F74(a1, 14, v2, v3, &v17, &v16, "recovery LTH");
    if (v8)
    {
      uint64_t v9 = v8;
      sub_100002BA0("Could not fetch bis data %s %d");
    }
    else
    {
      uint64_t v10 = v16;
      if (v16 <= *(_DWORD *)(a1 + 144))
      {
        if (*(unsigned char *)(a1 + 25))
        {
          long long v11 = v17;
          *(_DWORD *)long long v17 = -2147483646;
          v11[1] = v10;
          uint64_t v9 = sub_100002AC0(0x644C5448u, (uint64_t)v11, ((v6 + 4 * (v10 + v7) - 1) & v5) >> 2);
          sub_100002BA0("dLTH saved to ean - ret: %d, buf_size %d, recovery.nwords %d, version %d");
        }
        else
        {
          *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v32 = v12;
          long long v33 = v12;
          long long v30 = v12;
          long long v31 = v12;
          long long v28 = v12;
          long long v29 = v12;
          long long v26 = v12;
          long long v27 = v12;
          long long v24 = v12;
          long long v25 = v12;
          long long v22 = v12;
          long long v23 = v12;
          long long v20 = v12;
          long long v21 = v12;
          *(_OWORD *)long long v18 = v12;
          long long v19 = v12;
          if (sub_10000630C(v8, v18, 0x100uLL))
          {
            int v13 = sub_100006710(v17, 4 * v10, v18);
            if (v13)
            {
              uint64_t v9 = 3758097098;
              strerror(v13);
              sub_100002BA0("Unable to write %s - %s");
            }
            else if (sub_100006530())
            {
              uint64_t v9 = 3758097098;
              sub_100002BA0("Unable to commit BIS.", v15);
            }
            else
            {
              uint64_t v9 = 0;
            }
          }
          else
          {
            uint64_t v9 = 3758097098;
            sub_100002BA0("Unable to find BIS device", v15);
          }
        }
      }
      else
      {
        uint64_t v9 = 3758097098;
        sub_100002BA0("Read %X words, expected %X");
      }
    }
  }
  else
  {
    sub_100002BA0("Params missing in %s", "save_recovery_lth");
    uint64_t v9 = 3758097084;
  }
  if (v17) {
    free(v17);
  }
  return v9;
}

uint64_t sub_10000350C(uint64_t a1)
{
  int v36 = -1431655766;
  if ((MGGetBoolAnswer() & 1) == 0)
  {
    memset(__b, 170, sizeof(__b));
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v38[0] = v3;
    v38[1] = v3;
    v39[0] = v3;
    v39[1] = v3;
    while (1)
    {
      uint64_t Block = IOMobileFramebufferGetBlock();
      if (Block != -536870187 && Block != -536870184) {
        break;
      }
      usleep(0xF4240u);
    }
    uint64_t v6 = Block;
    if (Block)
    {
      sub_100002BA0(">> burn in metric read failed.");
      return v6;
    }
    uint64_t v6 = 3758097098;
    __int16 v28 = 16897;
    time_t v7 = time(0);
    time_t v29 = v7;
    int v30 = __b[1];
    unsigned __int16 v31 = __b[2];
    int v32 = *(_DWORD *)((char *)&__b[2] + 2);
    unsigned __int16 v33 = HIWORD(__b[3]);
    int v34 = __b[4];
    unsigned __int16 v35 = __b[5];
    uint64_t v8 = sub_100008768(0xFFFFFFFFLL, (char *)&v28, 28);
    int v9 = ~v8;
    int v36 = ~v8;
    BOOL v10 = sub_100006D28(v8, "min", 0, (unsigned __int16)v30);
    BOOL v11 = sub_100006D28(v10, "min", 1u, HIWORD(v30));
    BOOL v12 = sub_100006D28(v11, "min", 2u, v31);
    BOOL v13 = sub_100006D28(v12, "median", 0, (unsigned __int16)v32);
    BOOL v14 = sub_100006D28(v13, "median", 1u, HIWORD(v32));
    BOOL v15 = sub_100006D28(v14, "median", 2u, v33);
    BOOL v16 = sub_100006D28(v15, "max", 0, (unsigned __int16)v34);
    BOOL v17 = sub_100006D28(v16, "max", 1u, HIWORD(v34));
    sub_100006D28(v17, "max", 2u, v35);
    if (!*(unsigned char *)(a1 + 116))
    {
      sub_100002BA0("Unable to connect to BIM storage");
      return v6;
    }
    sub_100002BA0("IOMFB: BIMUpdaterStartUpdate ");
    if (!BIMUpdaterStartUpdate())
    {
      uint64_t v2 = 3758097098;
      sub_100002BA0("Unable to begin BIM update");
LABEL_38:
      sub_100002BA0("IOMFB: BIMUpdaterEndUpdate ");
      if (BIMUpdaterEndUpdate()) {
        return v2;
      }
      sub_100002BA0("Unable to end BIM update");
      return v6;
    }
    int v18 = sub_100006B74(a1, 0, (char *)v38);
    long long v19 = (unsigned __int16 *)v39;
    int v20 = sub_100006B74(a1, 1uLL, (char *)v39);
    sub_100002BA0("Writing BIM with timestamp %llu : %d %d : %08x", v7, v18 == 0, v20 == 0, v9);
    if (v20 | v18)
    {
      if (v18)
      {
        uint64_t v21 = sub_100006CA0(a1, 0, (uint64_t)&v28);
        uint64_t v2 = v21;
        if (v20)
        {
          if (!v21)
          {
            uint64_t v2 = sub_100006CA0(a1, 1uLL, (uint64_t)&v28);
            goto LABEL_34;
          }
LABEL_37:
          sub_100002BA0("Unable to write BIM to storage");
          goto LABEL_38;
        }
LABEL_26:
        int v23 = HIWORD(v34) - v19[12];
        if (v23 <= v35 - v19[13]) {
          int v23 = v35 - v19[13];
        }
        if ((unsigned __int16)v34 - v19[11] <= v23) {
          int v24 = v23;
        }
        else {
          int v24 = (unsigned __int16)v34 - v19[11];
        }
        if (v24 >= 0x1F5)
        {
          sub_100002BA0("Max BIM delta above threshold or below 0");
          xpc_object_t v25 = xpc_dictionary_create(0, 0, 0);
          if (!v25)
          {
            uint64_t v2 = 3758097084;
            goto LABEL_37;
          }
          long long v26 = v25;
          xpc_dictionary_set_int64(v25, "max_bim_delta", v24);
          analytics_send_event();
          xpc_release(v26);
        }
LABEL_34:
        if (!v2) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
      long long v19 = (unsigned __int16 *)v38;
      unint64_t v22 = 1;
    }
    else
    {
      unint64_t v22 = *(void *)((char *)v38 + 2) > *(void *)((char *)v39 + 2);
      if (*(void *)((char *)v38 + 2) > *(void *)((char *)v39 + 2)) {
        long long v19 = (unsigned __int16 *)v38;
      }
    }
    uint64_t v2 = sub_100006CA0(a1, v22, (uint64_t)&v28);
    goto LABEL_26;
  }
  return 0;
}

uint64_t sub_10000390C()
{
  memset(__b, 170, sizeof(__b));
  while (1)
  {
    uint64_t Block = IOMobileFramebufferGetBlock();
    if (Block != -536870187 && Block != -536870184) {
      break;
    }
    usleep(0x3D090u);
  }
  uint64_t v2 = Block;
  if (Block)
  {
    sub_100002BA0(">> tiled BIM read failed.");
  }
  else if (__b[0] == 2)
  {
    if (__b[1])
    {
      unsigned int v3 = 0;
      while (1)
      {
        LOBYTE(Block) = sub_100006DCC(Block, 0, (uint64_t)__b, v3);
        if ((Block & 1) == 0) {
          return 3758097084;
        }
        if (++v3 >= __b[1]) {
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:
      sub_100002BA0("TBIM saved");
      return 0;
    }
  }
  else
  {
    uint64_t v2 = 3758097084;
    sub_100002BA0(">> unexpected tbim version (wanted 2, got %d)");
  }
  return v2;
}

double sub_100003A28(uint64_t a1)
{
  *(void *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 25) = 0;
  *(void *)a1 = off_100010638;
  *(unsigned char *)(a1 + 29) = 0;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)off_1000106B8;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)off_1000106C8;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)off_1000106D8;
  double result = COERCE_DOUBLE("unsecure_history");
  *(_OWORD *)(a1 + 32) = *(_OWORD *)off_100010698;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)off_1000106A8;
  *(_DWORD *)(a1 + 112) = 0;
  *(unsigned char *)(a1 + 116) = 0;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = 0;
  *(_WORD *)(a1 + 136) = 0;
  return result;
}

uint64_t sub_100003A84(uint64_t a1)
{
  *(void *)a1 = off_100010638;
  if (*(void *)(a1 + 120))
  {
    BIMUpdaterCancel();
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 128), 0xFFFFFFFFFFFFFFFFLL);
    CFRelease(*(CFTypeRef *)(a1 + 120));
  }
  return a1;
}

void sub_100003AE8(void *a1)
{
}

BOOL sub_100003B00(uint64_t a1)
{
  io_registry_entry_t ServiceObject = IOMobileFramebufferGetServiceObject();
  BOOL result = sub_100003B38(ServiceObject, "TBICSSupported");
  *(unsigned char *)(a1 + 137) = result;
  return result;
}

BOOL sub_100003B38(io_registry_entry_t a1, const char *a2)
{
  CFStringRef v3 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a1, v3, kCFAllocatorDefault, 0);
  CFRelease(v4);
  if (!CFProperty) {
    return 0;
  }
  BOOL v6 = CFBooleanGetValue(CFProperty) != 0;
  CFRelease(CFProperty);
  return v6;
}

uint64_t sub_100003BCC(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(a1 + 16) = a2;
  io_registry_entry_t ServiceObject = IOMobileFramebufferGetServiceObject();
  *(_DWORD *)(a1 + 112) = sub_10000281C(ServiceObject, "bics_mode");
  bzero((void *)(a1 + 140), 8uLL);
  *(unsigned char *)(a1 + 116) = 0;
  if ((a3 & 1) != 0
    || (*(void *)(a1 + 128) = dispatch_semaphore_create(0),
        *(void *)(a1 + 120) = BIMUpdaterCreate(),
        uint64_t v6 = BIMUpdaterActivate(),
        (v6 & 1) != 0))
  {
    uint64_t v7 = sub_100001F50(v6, @"ean-storage-present");
    *(unsigned char *)(a1 + 25) = v7;
    *(unsigned char *)(a1 + 24) = sub_100001F50(v7, @"display-storage-present");
    io_registry_entry_t v8 = IOMobileFramebufferGetServiceObject();
    *(unsigned char *)(a1 + 137) = sub_100003B38(v8, "TBICSSupported");
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a1 + 120) = 0;
  }
  return result;
}

uint64_t sub_100003D24(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 116) = 1;
  return result;
}

intptr_t sub_100003D34(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  *(unsigned char *)(v1 + 116) = 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 128));
}

uint64_t sub_100003D44(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 25) && *(unsigned char *)(a1 + 26))
  {
    sub_100002CB4();
    *(unsigned char *)(a1 + 26) = 0;
  }
  return 0;
}

uint64_t sub_100003D84(unsigned char *a1, const std::__fs::filesystem::path *a2, const char *a3)
{
  if (byte_100014709) {
    sub_1000043D0();
  }
  if (sub_10000442C((uint64_t)a1))
  {
    sub_100002BA0("Failed to load LTH");
    return 0;
  }
  if (a1[137] && sub_1000045B8((uint64_t)a1))
  {
    sub_100002BA0("Failed to upload TBICS LTH");
    return 0;
  }
  if (a1[26])
  {
    sub_10000479C();
    sub_100002C0C((uint64_t)a1);
    if (a1[29]) {
      sub_100004834((uint64_t)a1);
    }
  }
  else
  {
    sub_1000049A0((uint64_t)a1);
  }
  sub_10000479C();
  return 1;
}

uint64_t sub_100003E44(uint64_t a1, const std::__fs::filesystem::path *a2, const char *a3)
{
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  timespec v52 = v6;
  timespec v53 = v6;
  timespec v50 = v6;
  timespec v51 = v6;
  timespec v48 = v6;
  timespec v49 = v6;
  timespec v46 = v6;
  timespec v47 = v6;
  timespec v44 = v6;
  timespec v45 = v6;
  timespec v42 = v6;
  timespec v43 = v6;
  timespec v40 = v6;
  timespec v41 = v6;
  *(timespec *)__str = v6;
  timespec v39 = v6;
  timespec v36 = v6;
  timespec v37 = v6;
  timespec v34 = v6;
  timespec v35 = v6;
  timespec v32 = v6;
  timespec v33 = v6;
  timespec v30 = v6;
  timespec v31 = v6;
  timespec v28 = v6;
  timespec v29 = v6;
  timespec v26 = v6;
  timespec v27 = v6;
  timespec v24 = v6;
  timespec v25 = v6;
  *(timespec *)to = v6;
  timespec v23 = v6;
  *(timespec *)&v21.st_blksize = v6;
  *(timespec *)v21.st_qspare = v6;
  v21.st_birthtimespec = v6;
  *(timespec *)&v21.st_size = v6;
  v21.st_mtimespec = v6;
  v21.st_ctimespec = v6;
  *(timespec *)&v21.st_uid = v6;
  v21.st_atimespec = v6;
  *(timespec *)v20.st_qspare = v6;
  *(timespec *)&v21.st_dev = v6;
  *(timespec *)&v20.st_size = v6;
  *(timespec *)&v20.st_blksize = v6;
  v20.st_ctimespec = v6;
  v20.st_birthtimespec = v6;
  v20.st_atimespec = v6;
  v20.st_mtimespec = v6;
  *(timespec *)&v20.st_dev = v6;
  *(timespec *)&v20.st_uid = v6;
  if (stat((const char *)a2, &v21) < 0 || stat(a3, &v20) < 0) {
    return 0;
  }
  sub_100002BA0("Daemon migrating from %s to %s", (const char *)a2, a3);
  uint64_t v7 = 0;
  char v19 = 1;
  do
  {
    if (v7 != 2)
    {
      uint64_t v8 = 0;
      char v9 = 1;
      do
      {
        char v10 = v9;
        uint64_t v11 = a1 + 16 * v7 + 8 * v8;
        snprintf(__str, 0x100uLL, "%s/%s", (const char *)a2, *(const char **)(v11 + 32));
        snprintf(to, 0x100uLL, "%s/%s", a3, *(const char **)(v11 + 32));
        if ((stat(__str, &v21) & 0x80000000) == 0)
        {
          if (stat(to, &v20))
          {
            sub_100002BA0("Daemon copying from %s to %s", __str, to);
            if (copyfile(__str, to, 0, 0xAu) < 0)
            {
              sub_100002BA0("Daemon copying from %s to %s failed", __str, to);
              char v19 = 0;
            }
          }
        }
        char v9 = 0;
        uint64_t v8 = 1;
      }
      while ((v10 & 1) != 0);
    }
    ++v7;
  }
  while (v7 != 5);
  if (v19)
  {
    for (uint64_t i = 0; i != 5; ++i)
    {
      uint64_t v13 = 0;
      char v14 = 1;
      do
      {
        char v15 = v14;
        snprintf(__str, 0x100uLL, "%s/%s", (const char *)a2, *(const char **)(a1 + 16 * i + 8 * v13 + 32));
        if ((stat(__str, &v21) & 0x80000000) == 0)
        {
          sub_100002BA0("Daemon unlinking %s", __str);
          unlink(__str);
        }
        char v14 = 0;
        uint64_t v13 = 1;
      }
      while ((v15 & 1) != 0);
    }
    remove(a2, v16);
    uint64_t v17 = 0;
    sub_100002BA0("Daemon migrating completed");
  }
  else
  {
    uint64_t v17 = 0xFFFFFFFFLL;
    sub_100002BA0("Daemon migrating failed");
  }
  return v17;
}

void sub_1000040F4(uint64_t a1)
{
  if (byte_100014708) {
    return;
  }
  long long v14 = unk_10000FBC8;
  long long size = xmmword_10000FBD8;
  long long v16 = unk_10000FBE8;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  v18[11] = v2;
  timespec v19 = v2;
  v18[9] = v2;
  v18[10] = v2;
  v18[7] = v2;
  v18[8] = v2;
  v18[5] = v2;
  v18[6] = v2;
  v18[3] = v2;
  v18[4] = v2;
  v18[1] = v2;
  v18[2] = v2;
  v18[0] = v2;
  *(timespec *)&v12.st_dev = v2;
  *(timespec *)&v12.st_uid = v2;
  v12.st_atimespec = v2;
  v12.st_mtimespec = v2;
  v12.st_ctimespec = v2;
  v12.st_birthtimespec = v2;
  *(timespec *)&v12.st_long long size = v2;
  *(timespec *)&v12.st_blklong long size = v2;
  *(timespec *)v12.st_qspare = v2;
  memset(v13, 170, sizeof(v13));
  int v11 = -1431655766;
  if (!stat("force_panel_reset", &v12) && (__int16)v12.st_mode < 0)
  {
    if (unlink("force_panel_reset"))
    {
      sub_100001FE0("Could not delete %s; skipping reset\n", "force_panel_reset");
      return;
    }
    timespec v6 = 0;
    int v4 = 0;
    goto LABEL_14;
  }
  if (IOMobileFramebufferGetBlock()) {
    return;
  }
  int v3 = open(*(const char **)(a1 + 64), 0);
  if (v3 < 0) {
    return;
  }
  int v4 = v3;
  if (read(v3, &v11, 4uLL) != 4) {
    goto LABEL_30;
  }
  int v5 = v11;
  if (v11 == 1112097568)
  {
    if (read(v4, v13, 4uLL) != 4) {
      goto LABEL_30;
    }
    int v5 = v13[0];
  }
  else
  {
    v13[0] = v11;
  }
  unsigned int v7 = v5 - 1;
  if (v7 >= 4)
  {
    sub_100002BA0("unknown BIC header version; panelID verification skipped");
    goto LABEL_30;
  }
  size_t v8 = *(void *)&aD[8 * v7];
  if (v8 != read(v4, &v13[1], v8)) {
    goto LABEL_30;
  }
  if (size != HIDWORD(v19.tv_nsec))
  {
    timespec v6 = 0;
    goto LABEL_14;
  }
  char v9 = malloc_type_malloc(size, 0x9B0DAAF5uLL);
  if (!v9)
  {
LABEL_30:
    close(v4);
    return;
  }
  timespec v6 = v9;
  uint64_t v10 = size;
  if (read(v4, v9, size) != v10 || !memcmp(v6, (char *)v18 + 4, HIDWORD(v19.tv_nsec)))
  {
    close(v4);
LABEL_20:
    free(v6);
    return;
  }
LABEL_14:
  sub_100002BA0("new panel detected; invalidate stored LTH & BIC");
  if (*(unsigned char *)(a1 + 24)) {
    sub_100004B24();
  }
  else {
    unlink(*(const char **)(a1 + 16 * (*(_DWORD *)(a1 + 112) != 0) + 32));
  }
  unlink(*(const char **)(a1 + 64));
  sub_100004D34(a1);
  if (*(unsigned char *)(a1 + 25)) {
    sub_100002A2C(0x64424943u);
  }
  *(unsigned char *)(a1 + 26) = 1;
  close(v4);
  if (v6) {
    goto LABEL_20;
  }
}

uint64_t sub_1000043D0()
{
  uint64_t v0 = IOMobileFramebufferSetParameter();
  uint64_t v1 = sub_100005550(v0);
  sub_100002BA0("%s: Update_BIC => %s", "enable_headless_migration", v1);
  return v0;
}

uint64_t sub_10000442C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 26))
  {
    if (*(unsigned char *)(a1 + 24))
    {
      if (!sub_100005358(a1, 0x4C544820u)) {
        return 0;
      }
    }
    else if (!sub_100005244(a1, *(char **)(a1 + 16 * (*(_DWORD *)(a1 + 112) != 0) + 32), 1, 1, 14, 1, "history"))
    {
      return 0;
    }
    if (sub_100006814(a1)) {
      goto LABEL_2;
    }
    return 0;
  }
LABEL_2:
  int v8 = 1;
  unsigned int v7 = &_mh_execute_header;
  bzero(v5, 0xFBCuLL);
  sub_100002BA0("%s: upload empty history", "upload_history");
  int v6 = 0;
  uint64_t v2 = IOMobileFramebufferSetBlock();
  int v3 = sub_100005550(v2);
  sub_100002BA0("%s: set block[0] => %s", "upload_history", v3);
  if (v2 != -536870201 && v2 != -536870174 && v2) {
    sub_100001FE0("uploading empty history failed.");
  }
  return v2;
}

uint64_t sub_1000045B8(uint64_t a1)
{
  uint64_t v2 = *(const char **)(a1 + 96);
  int v15 = -1431655766;
  xpc_object_t v13 = 0;
  long long v14 = 0;
  int v3 = open(v2, 0);
  int v4 = v3;
  if ((v3 & 0x80000000) == 0)
  {
    v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v12.st_blklong long size = v5;
    *(timespec *)v12.st_qspare = v5;
    v12.st_birthtimespec = v5;
    *(timespec *)&v12.st_long long size = v5;
    v12.st_mtimespec = v5;
    v12.st_ctimespec = v5;
    *(timespec *)&v12.st_uid = v5;
    v12.st_atimespec = v5;
    *(timespec *)&v12.st_dev = v5;
    if (fstat(v3, &v12))
    {
      uint64_t v6 = 3758097084;
      sub_100002BA0("%s: Could not stat %s", "upload_tbics_history", v2);
      close(v4);
      return v6;
    }
    uint64_t st_size_low = LODWORD(v12.st_size);
    if (sub_100006120(v12.st_size, (uint64_t *)&v14, &v15))
    {
LABEL_10:
      ssize_t v10 = read(v4, v14, st_size_low);
      close(v4);
      if (v10 < st_size_low)
      {
        uint64_t v6 = 3758097084;
        goto LABEL_15;
      }
      goto LABEL_14;
    }
LABEL_12:
    close(v4);
    uint64_t v6 = 3758097085;
    goto LABEL_15;
  }
  *(void *)&v12.st_dev = 0xAAAAAAAAAAAAAAAALL;
  if (sub_100005470(0x544C5448u, &v13) || (xpc_object_t v7 = v13) == 0)
  {
    uint64_t v6 = 3758097084;
    sub_100002BA0("%s: Could not read dstore", "upload_tbics_history");
    return v6;
  }
  data = xpc_dictionary_get_data(v13, "content", (size_t *)&v12);
  uint64_t st_size_low = *(void *)&v12.st_dev;
  if ((sub_100006120(v12.st_dev, (uint64_t *)&v14, &v15) & 1) == 0) {
    goto LABEL_12;
  }
  if (!data) {
    goto LABEL_10;
  }
  memcpy(v14, data, st_size_low);
  xpc_release(v7);
  close(v4);
LABEL_14:
  uint64_t v6 = sub_100006198(*(void *)(a1 + 16), 129, (uint64_t)v14, st_size_low, "TBICS LTH", 0);
LABEL_15:
  if (v14) {
    free(v14);
  }
  return v6;
}

uint64_t sub_10000479C()
{
  *(void *)&long long v0 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v0 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v5 = v0;
  int v1 = 79;
  do
  {
    usleep(0x3D090u);
    uint64_t result = IOMobileFramebufferGetBlock();
    if (result) {
      break;
    }
    if (v5 != 1 || BYTE8(v5) == 0) {
      break;
    }
  }
  while ((HIDWORD(v5) & 0xFFFFFFFD) != 0 && v1-- != 0);
  return result;
}

uint64_t sub_100004834(uint64_t a1)
{
  uint64_t v1 = 3758097084;
  int v11 = -1431655766;
  __ptr = 0;
  uint64_t v2 = "not ";
  if (!*(unsigned char *)(a1 + 25)) {
    goto LABEL_19;
  }
  if (sub_100006120(7856, (uint64_t *)&__ptr, &v11))
  {
    uint64_t v4 = sub_100006198(*(void *)(a1 + 16), 129, (uint64_t)__ptr, 7856, "TBICS LTH", 1);
    if (!v4)
    {
      long long v5 = *(FILE **)(a1 + 96);
      uint64_t v6 = *(FILE **)(a1 + 104);
      v9[1] = v6;
      v9[2] = v5;
      xpc_object_t v7 = fopen((const char *)v6, "w");
      v9[0] = v7;
      if (v7)
      {
        if (fwrite(__ptr, 1uLL, 0x1EB0uLL, v7))
        {
          if (sub_100005E38((uint64_t)v9))
          {
            sub_100004C34(0x544C5448u, __ptr, 0x7ACu);
            uint64_t v1 = 0;
          }
          goto LABEL_11;
        }
      }
      else
      {
        sub_100001FE0("Could not open temp file %s", (const char *)v6);
      }
      sub_100005F08((uint64_t)v9);
LABEL_11:
      if (v9[0]) {
        fclose(v9[0]);
      }
      uint64_t v4 = v1;
    }
  }
  else
  {
    uint64_t v4 = 3758097085;
  }
  if (__ptr) {
    free(__ptr);
  }
  if (!v4) {
    uint64_t v2 = (const char *)&unk_10000ACAB;
  }
  uint64_t v1 = v4;
LABEL_19:
  sub_100002BA0("TBICS LTH %ssaved", v2);
  return v1;
}

void sub_100004988(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, FILE *a10)
{
  if (a10) {
    fclose(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000049A0(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 26))
  {
    if (!*(unsigned char *)(a1 + 25)) {
      goto LABEL_19;
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v9[1] = v3;
    v9[2] = v3;
    v9[0] = v3;
    BOOL v4 = !IOMobileFramebufferGetBlock() && LODWORD(v9[0]) == 1;
    BOOL v5 = !v4 || BYTE8(v9[0]) == 0;
    if (!v5 && BYTE9(v9[0]) == 0)
    {
LABEL_19:
      if (sub_100005244(a1, *(char **)(a1 + 64), 1, 1, 13, 0, "BIC"))
      {
        int v11 = 0;
        bzero(v9, 0xFBCuLL);
        sub_10000479C();
        int v7 = IOMobileFramebufferSetBlock();
        int v8 = sub_100005550(v7);
        sub_100002BA0("%s: upload empty bic => %s", "upload_bic", v8);
      }
    }
  }
  return 0;
}

uint64_t sub_100004AA8(xpc_connection_t *a1)
{
  uint64_t v2 = dispatch_queue_create("com.apple.disp.store.client", 0);
  mach_service = xpc_connection_create_mach_service("display_storage_service", v2, 0);
  *a1 = mach_service;
  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &stru_100010748);
    xpc_connection_resume(*a1);
    return 0;
  }
  else
  {
    sub_100002BA0("Couldn't find Display Storage driver");
    return 5;
  }
}

uint64_t sub_100004B24()
{
  xpc_connection_t v4 = (xpc_connection_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t v0 = sub_100004AA8(&v4);
  if (!v0)
  {
    xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v1, "command", "erase");
    uint64_t v2 = v4;
    sub_100004BBC(v4, v1);
    xpc_release(v1);
    xpc_connection_cancel(v2);
    xpc_release(v2);
  }
  return v0;
}

intptr_t sub_100004BBC(_xpc_connection_s *a1, void *a2)
{
  xpc_connection_send_message(a1, a2);
  if (qword_1000146F8 != -1) {
    dispatch_once(&qword_1000146F8, &stru_1000109B8);
  }
  xpc_connection_send_barrier(a1, &stru_1000109F8);
  long long v3 = qword_1000146F0;

  return dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t sub_100004C34(unsigned int a1, const void *a2, unsigned int a3)
{
  xpc_connection_t v10 = (xpc_connection_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = sub_100004AA8(&v10);
  if (!v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "command", "write");
    xpc_dictionary_set_uint64(v7, "key", a1);
    xpc_dictionary_set_data(v7, "content", a2, 4 * a3);
    int v8 = v10;
    sub_100004BBC(v10, v7);
    xpc_release(v7);
    xpc_connection_cancel(v8);
    xpc_release(v8);
  }
  return v6;
}

uint64_t sub_100004D0C(uint64_t a1, unsigned int a2)
{
  return *(void *)(a1 + 8 * a2 + 64);
}

uint64_t sub_100004D18(uint64_t a1, unsigned int a2)
{
  return *(void *)(a1 + 16 * (*(_DWORD *)(a1 + 112) != 0) + 8 * a2 + 32);
}

void sub_100004D34(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 25))
  {
    sub_100002A2C(0x644C5448u);
  }
  else
  {
    *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v2;
    long long v25 = v2;
    long long v22 = v2;
    long long v23 = v2;
    long long v20 = v2;
    long long v21 = v2;
    long long v18 = v2;
    long long v19 = v2;
    long long v16 = v2;
    long long v17 = v2;
    long long v14 = v2;
    long long v15 = v2;
    long long v12 = v2;
    long long v13 = v2;
    *(_OWORD *)xpc_connection_t v10 = v2;
    long long v11 = v2;
    sub_1000065CC(a1);
    if (*(_WORD *)(a1 + 140))
    {
      uint64_t v4 = *(unsigned int *)(a1 + 144);
      if (sub_10000630C(v3, v10, 0x100uLL))
      {
        int v5 = open(v10, 1);
        if (v5 < 0)
        {
          sub_100002BA0("Unable to open DR LTH");
        }
        else
        {
          int v6 = v5;
          if (fcntl(v5, 48, 1) < 0)
          {
            sub_100002BA0("Failed to set F_NOCACHE");
          }
          else
          {
            size_t v7 = 4 * v4;
            int v8 = malloc_type_malloc(v7, 0xDA4338C8uLL);
            if (v8)
            {
              char v9 = v8;
              bzero(v8, v7);
              write(v6, v9, v7);
              free(v9);
            }
          }
          close(v6);
        }
      }
      else
      {
        sub_100002BA0("Unable to find BIS device");
      }
    }
  }
}

uint64_t sub_100004EF0()
{
  size_t v3 = 128;
  if (sysctlbyname("hw.target", byte_100014260, &v3, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = 0;
  size_t v2 = v3 + 1;
  while (strncmp(byte_100014260, off_100010768[v1], v2))
  {
    if (++v1 == 20) {
      return 4;
    }
  }
  return 5;
}

uint64_t sub_100004F98()
{
  uint64_t v0 = __chkstk_darwin();
  size_t v2 = v1;
  unsigned int v4 = v3;
  int v6 = v5;
  uint64_t v7 = v0;
  int v26 = 0;
  int v27 = v8;
  int v28 = v9;
  bzero(v24, 0xFBCuLL);
  int v10 = *(unsigned __int8 *)(v7 + 136);
  sub_100002BA0("%s (%s)", "upload_reader", v2);
  if ((int)v4 < 1024 || (v4 & 3) != 0)
  {
    sub_100002BA0("%s: bad file size (%d) for %s", "upload_reader", v4, v2);
    uint64_t v18 = 3758097084;
LABEL_18:
    sub_100001FE0("uploading %s failed.", v2);
  }
  else
  {
    long long v23 = v2;
    int v11 = 0;
    int v12 = v10 << 30;
    unsigned int v13 = v4 >> 2;
    unsigned int v14 = ((v4 >> 2) + 999) / 0x3E8;
    unsigned int v25 = v4 >> 2;
    int v15 = 1000;
    unsigned int v21 = v4 >> 2;
    int v22 = v12;
    unsigned int v20 = v14;
    while (2)
    {
      if (v11 == v14)
      {
        sub_100002BA0("%s: Upload of %s successful", "upload_reader", v23);
      }
      else
      {
        int v26 = v11 | v12;
        if (v14 == v11 + 1) {
          int v15 = v13 - v11 * v15;
        }
        (**v6)(v6);
        int v16 = 15;
        while (1)
        {
          uint64_t v17 = IOMobileFramebufferSetBlock();
          uint64_t v18 = v17;
          if (v11 || v17 != -536870187) {
            break;
          }
          usleep(0xF4240u);
          if (!--v16)
          {
            uint64_t v18 = 3758097109;
LABEL_17:
            sub_100002BA0("%s: bad return stat %X", "upload_reader", v18);
            size_t v2 = v23;
            goto LABEL_18;
          }
        }
        if (v11 || v17 != -536870174)
        {
          ++v11;
          unsigned int v13 = v21;
          int v12 = v22;
          unsigned int v14 = v20;
          if (!v17) {
            continue;
          }
          goto LABEL_17;
        }
      }
      return 0;
    }
  }
  return v18;
}

uint64_t sub_1000051F8()
{
  return sub_100004F98();
}

uint64_t sub_100005244(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const char *a7)
{
  uint64_t v8 = 3758097084;
  int v9 = open(a2, 0);
  if ((v9 & 0x80000000) == 0)
  {
    int v10 = v9;
    v11.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v11.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v13.st_blklong long size = v11;
    *(timespec *)v13.st_qspare = v11;
    v13.st_birthtimespec = v11;
    *(timespec *)&v13.st_long long size = v11;
    v13.st_mtimespec = v11;
    v13.st_ctimespec = v11;
    *(timespec *)&v13.st_uid = v11;
    v13.st_atimespec = v11;
    *(timespec *)&v13.st_dev = v11;
    if (fstat(v9, &v13))
    {
      sub_100002BA0("%s: Could not stat %s", "upload_file", a7);
    }
    else
    {
      unsigned int v14 = &off_100010A28;
      int v16 = -1431655766;
      int v15 = v10;
      uint64_t v8 = sub_100004F98();
    }
    close(v10);
  }
  return v8;
}

uint64_t sub_100005358(uint64_t a1, unsigned int a2)
{
  size_t length = 0xAAAAAAAAAAAAAAAALL;
  xpc_object_t xdict = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  if (sub_100005470(a2, &xdict) || (xpc_object_t v2 = xdict) == 0)
  {
    sub_100002BA0("%s: Could not read dstore", "upload_dstore");
    return 3758097084;
  }
  else
  {
    xpc_dictionary_get_data(xdict, "content", &length);
    length >>= 2;
    uint64_t v3 = sub_100004F98();
    xpc_release(v2);
  }
  return v3;
}

uint64_t sub_100005470(unsigned int a1, xpc_object_t *a2)
{
  xpc_connection_t connection = (xpc_connection_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = sub_100004AA8(&connection);
  if (!result)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "command", "read");
    xpc_dictionary_set_uint64(v5, "key", a1);
    int v6 = connection;
    *a2 = xpc_connection_send_message_with_reply_sync(connection, v5);
    xpc_release(v5);
    xpc_connection_cancel(v6);
    xpc_release(v6);
    if (xpc_get_type(*a2) == (xpc_type_t)&_xpc_type_dictionary)
    {
      return 0;
    }
    else
    {
      xpc_release(*a2);
      *a2 = 0;
      return 5;
    }
  }
  return result;
}

char *sub_100005550(int a1)
{
  uint64_t v1 = 0;
  while (dword_1000108C8[v1] != a1)
  {
    v1 += 4;
    if (v1 == 36)
    {
      xpc_object_t v2 = byte_1000142E0;
      snprintf(byte_1000142E0, 0xCuLL, "%X", a1);
      return v2;
    }
  }
  return *(char **)&dword_1000108C8[v1 + 2];
}

unint64_t sub_1000055C8(uint64_t a1, _DWORD *a2, unint64_t a3, uint64_t a4, const void *a5)
{
  int v9 = sub_100004EF0();
  int v10 = sub_100004EF0();
  *a2 = v10;
  if (v10 == 4) {
    int v11 = 92;
  }
  else {
    int v11 = 84;
  }
  unint64_t v12 = (v11 + *(_DWORD *)(a4 + 96));
  a2[1] = v12;
  if (v12 <= a3)
  {
    uint64_t v13 = a4 + 13;
    uint64_t v14 = -3;
    do
    {
      int v15 = (char *)a2 + v14 + 14;
      *(v15 - 3) = *(unsigned char *)(v13 + v14 - 6);
      unsigned char *v15 = *(unsigned char *)(v13 + v14 - 3);
      v15[3] = *(unsigned char *)(v13 + v14);
      v15[6] = *(unsigned char *)(v13 + v14 + 3);
      v15[9] = *(unsigned char *)(v13 + v14 + 6);
      v15[12] = *(unsigned char *)(v13 + v14 + 9);
      v15[15] = *(unsigned char *)(v13 + v14 + 12);
    }
    while (!__CFADD__(v14++, 1));
    uint64_t v17 = 0;
    uint64_t v18 = a2 + 11;
    uint64_t v19 = -6;
    do
    {
      unsigned int v20 = (char *)v18 + v19;
      *((_WORD *)v20 - 4) = *(_WORD *)(a4 + v17 * 4 + 26);
      *((_WORD *)v20 - 1) = *(_WORD *)(a4 + v17 * 4 + 28);
      v18[v17] = *(_DWORD *)(a4 + v17 * 4 + 40);
      ++v17;
      v19 += 2;
    }
    while (v17 != 3);
    for (uint64_t i = 0; i != 3; ++i)
      a2[i + 14] = *(_DWORD *)(a4 + 52 + i * 4);
    if (v9 == 4)
    {
      for (uint64_t j = 0; j != 3; ++j)
        a2[j + 17] = *(_DWORD *)(a4 + 64 + j * 4);
      for (uint64_t k = 0; k != 3; ++k)
        a2[k + 20] = *(_DWORD *)(a4 + 76 + k * 4);
      long long v24 = a2 + 23;
    }
    else
    {
      for (uint64_t m = 0; m != 3; ++m)
        a2[m + 17] = *(_DWORD *)(a4 + 76 + m * 4);
      a2[20] = *(_DWORD *)(a4 + 128);
      long long v24 = a2 + 21;
    }
    memcpy(v24, a5, *(unsigned int *)(a4 + 96));
  }
  else
  {
    sub_100001FE0("Not enough space allocated for the ibic header");
    return 0;
  }
  return v12;
}

uint64_t sub_100005788()
{
  uint64_t v0 = __chkstk_darwin();
  long long v24 = v1;
  uint64_t v25 = v2;
  long long v23 = v3;
  int v28 = v4;
  int v29 = v5;
  int v30 = 0;
  int v6 = *(unsigned __int8 *)(v0 + 136) << 30;
  memset(__b, 170, sizeof(__b));
  int v7 = 0;
  int v8 = 0;
  while (1)
  {
    int v27 = v7 | v6;
    uint64_t Block = IOMobileFramebufferGetBlock();
    uint64_t v10 = Block;
    if (Block != -536870187) {
      break;
    }
LABEL_5:
    if (++v8 > 0x77)
    {
      sub_100001FE0("%s: max retries reached; bailing.");
      return v10;
    }
    sub_100002BA0("%s: IOMFB busy, will retry", "fetch_machine");
LABEL_8:
    usleep(0xF4240u);
    int v7 = v27;
  }
  if (Block)
  {
    if (Block != -536870184)
    {
      int v11 = sub_100005550(Block);
      sub_100002BA0("%s: GetBlock[0] returned %s", "fetch_machine", v11);
LABEL_11:
      sub_100001FE0("failed to save %s -- IOMFB in a bad state");
      return v10;
    }
    goto LABEL_5;
  }
  int v30 = __b[1];
  sub_100002BA0("%s: xfer id=%d, pending=%d, nwords=%d", "fetch_machine", __b[1], LOBYTE(__b[0]), __b[2]);
  if (LOBYTE(__b[0])) {
    goto LABEL_8;
  }
  int v12 = __b[2];
  if ((__b[2] - 1) >= 0x3E8) {
    uint64_t v13 = 1000;
  }
  else {
    uint64_t v13 = __b[2];
  }
  uint64_t v10 = ((uint64_t (*)(uint64_t, _DWORD *, void, uint64_t, void))v24)(v25, __b, 0, v13, __b[2]);
  if (v10)
  {
LABEL_16:
    sub_100001FE0("%s: %s save failure [%X]");
    return v10;
  }
  int v30 = __b[1];
  if ((v12 + 999) >= 0x7D0)
  {
    int v15 = 0;
    unsigned int v16 = (v12 + 999) / 0x3E8u;
    unsigned int v22 = v16 - 2;
    if (v16 <= 2) {
      unsigned int v16 = 2;
    }
    unsigned int v17 = v16 - 1;
    int v18 = -1000;
    LODWORD(v19) = v13;
    while (1)
    {
      int v27 = (v15 + 1) | v6;
      uint64_t v20 = IOMobileFramebufferGetBlock();
      if (v20)
      {
        uint64_t v10 = v20;
        goto LABEL_11;
      }
      uint64_t v19 = v22 == v15 ? (v18 + __b[2]) : v19;
      uint64_t v21 = v24(v25, __b, v13, v19);
      if (v21) {
        break;
      }
      uint64_t v13 = (v19 + v13);
      ++v15;
      v18 -= 1000;
      if (v17 == v15) {
        goto LABEL_28;
      }
    }
    uint64_t v10 = v21;
    goto LABEL_16;
  }
LABEL_28:
  sub_100002BA0("%s: save of %s successful", "fetch_machine", v23);
  return 0;
}

uint64_t sub_100005A6C(char *a1, uint64_t a2)
{
  return ~sub_100008768(0xFFFFFFFFLL, a1, a2);
}

uint64_t sub_100005A94(uint64_t a1, char *a2, size_t a3)
{
  io_iterator_t iterator = 0;
  if (IORegistryCreateIterator(kIOMainPortDefault, "IOService", 1u, &iterator))
  {
    sub_100002BA0("Failed to allocate iterator");
    return 0;
  }
  io_object_t v6 = IOIteratorNext(iterator);
  if (!v6)
  {
LABEL_12:
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  io_object_t v7 = v6;
  while (1)
  {
    if (!IOObjectConformsTo(v7, "IOMedia")
      || kCFBooleanTrue != IORegistryEntrySearchCFProperty(v7, "IOService", @"EmbeddedDeviceTypeFirmware", kCFAllocatorDefault, 3u))
    {
      goto LABEL_11;
    }
    CFMutableDictionaryRef properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
    if (!IORegistryEntryCreateCFProperties(v7, &properties, kCFAllocatorDefault, 0)) {
      break;
    }
    sub_100002BA0("Unable to obtain properties of IOMedia object");
LABEL_11:
    IOObjectRelease(v7);
    io_object_t v7 = IOIteratorNext(iterator);
    if (!v7) {
      goto LABEL_12;
    }
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(properties, @"BSD Name");
  if (!Value)
  {
    CFRelease(properties);
    goto LABEL_11;
  }
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v19 = v10;
  long long v20 = v10;
  long long v17 = v10;
  long long v18 = v10;
  long long v15 = v10;
  long long v16 = v10;
  *(_OWORD *)buffer = v10;
  long long v14 = v10;
  CFStringGetCString(Value, buffer, 128, 0x8000100u);
  snprintf(a2, a3, "%s%s", "/dev/", buffer);
  CFRelease(properties);
  IOObjectRelease(v7);
  uint64_t v5 = 1;
LABEL_13:
  IOObjectRelease(iterator);
  return v5;
}

uint64_t sub_100005C94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const char *a7)
{
  if (a6) {
    operator new();
  }
  uint64_t v8 = sub_100005788();
  if (v8) {
    sub_100001FE0("%s save failure", a7);
  }
  return v8;
}

void sub_100005E14()
{
}

BOOL sub_100005E38(uint64_t a1)
{
  uint64_t v1 = *(FILE **)a1;
  if (!*(void *)a1) {
    return 0;
  }
  int v3 = ferror(*(FILE **)a1);
  fclose(v1);
  *(void *)a1 = 0;
  if (!*(void *)(a1 + 8)) {
    return 1;
  }
  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v8.st_blklong long size = v4;
  *(timespec *)v8.st_qspare = v4;
  v8.st_birthtimespec = v4;
  *(timespec *)&v8.st_long long size = v4;
  v8.st_mtimespec = v4;
  v8.st_ctimespec = v4;
  *(timespec *)&v8.st_uid = v4;
  v8.st_atimespec = v4;
  *(timespec *)&v8.st_dev = v4;
  if (v3)
  {
LABEL_4:
    unlink(*(const char **)(a1 + 8));
    return 0;
  }
  sync();
  if (stat(*(const char **)(a1 + 16), &v8))
  {
    if (*__error() != 2) {
      goto LABEL_4;
    }
  }
  else if (unlink(*(const char **)(a1 + 16)))
  {
    goto LABEL_4;
  }
  rename(*(const std::__fs::filesystem::path **)(a1 + 8), *(const std::__fs::filesystem::path **)(a1 + 16), v6);
  return v7 == 0;
}

BOOL sub_100005F08(uint64_t a1)
{
  uint64_t v1 = *(FILE **)a1;
  if (!*(void *)a1) {
    return 0;
  }
  int v3 = ferror(*(FILE **)a1);
  fclose(v1);
  *(void *)a1 = 0;
  timespec v4 = *(const char **)(a1 + 8);
  if (!v4) {
    timespec v4 = *(const char **)(a1 + 16);
  }
  return (unlink(v4) | v3) == 0;
}

uint64_t sub_100005F74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void **a5, _DWORD *a6, const char *a7)
{
  *a5 = 0;
  uint64_t v10 = sub_100005788();
  if (v10)
  {
    sub_100001FE0("%s fetch failure", a7);
    if (*a5)
    {
      free(*a5);
      *a5 = 0;
    }
  }
  else
  {
    *a6 = 0;
  }
  return v10;
}

uint64_t sub_10000601C(uint64_t a1)
{
  int v9 = -1431655766;
  stat v8 = 0;
  uint64_t v1 = "not ";
  if (!*(unsigned char *)(a1 + 25))
  {
    uint64_t v6 = 3758097084;
    goto LABEL_11;
  }
  int v3 = sub_100006120(3968, (uint64_t *)&v8, &v9);
  timespec v4 = v8;
  if (!v3)
  {
    uint64_t v6 = 3758097085;
    if (!v8) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v5 = sub_100006198(*(void *)(a1 + 16), 130, (uint64_t)v8, 3968, "TBIC", 1);
  timespec v4 = v8;
  if (!v5)
  {
    if (sub_100002AC0(0x54424943u, (uint64_t)v8, 0x3E0u)) {
      uint64_t v6 = 3758097084;
    }
    else {
      uint64_t v6 = 0;
    }
    timespec v4 = v8;
    if (!v8) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v6 = v5;
  if (v8) {
LABEL_8:
  }
    free(v4);
LABEL_9:
  if (!v6) {
    uint64_t v1 = (const char *)&unk_10000ACAB;
  }
LABEL_11:
  sub_100002BA0("TBICS BIC %ssaved", v1);
  return v6;
}

uint64_t sub_100006120(int a1, uint64_t *a2, _DWORD *a3)
{
  uint64_t result = 0;
  if (a1 && a2 && a3)
  {
    size_t v7 = (a1 + 0x3FFF) & 0xFFFFC000;
    *a3 = v7;
    uint64_t result = (uint64_t)malloc_type_aligned_alloc(0x4000uLL, v7, 0xF5FB5398uLL);
    *a2 = result;
    if (result)
    {
      bzero((void *)result, *a3);
      return 1;
    }
    else
    {
      *a3 = 0;
    }
  }
  return result;
}

uint64_t sub_100006198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, int a6)
{
  if (a6) {
    stat v8 = "get";
  }
  else {
    stat v8 = "set";
  }
  for (int i = 119; ; --i)
  {
    uint64_t v10 = a6 ? IOMobileFramebufferGetBufBlock() : IOMobileFramebufferSetBlock();
    uint64_t v11 = v10;
    if (v10 != -536870187 && v10 != -536870184) {
      break;
    }
    if (!i)
    {
      sub_100001FE0("%s %s max retries reached -> bailing");
      return v11;
    }
    sub_100002BA0("%s %s failed, will retry", v8, a5);
    usleep(0xF4240u);
  }
  if (v10)
  {
    sub_100005550(v10);
    sub_100001FE0("%s %s failed: %s");
  }
  return v11;
}

BOOL sub_1000062CC(FILE **a1, void *__ptr, size_t __size, size_t __nitems)
{
  return *a1 && fwrite(__ptr, __size, __nitems, *a1) != 0;
}

uint64_t sub_10000630C(uint64_t a1, char *a2, size_t a3)
{
  io_iterator_t iterator = 0;
  if (IORegistryCreateIterator(kIOMainPortDefault, "IOService", 1u, &iterator))
  {
    sub_100002BA0("Failed to allocate iterator");
    return 0;
  }
  io_object_t v6 = IOIteratorNext(iterator);
  if (!v6)
  {
LABEL_13:
    uint64_t v5 = 0;
    goto LABEL_14;
  }
  io_object_t v7 = v6;
  __long long size = a3;
  while (1)
  {
    if (!IOObjectConformsTo(v7, "IOMedia")
      || kCFBooleanTrue != IORegistryEntrySearchCFProperty(v7, "IOService", @"EmbeddedDeviceTypeBIS", kCFAllocatorDefault, 3u))
    {
      goto LABEL_12;
    }
    CFMutableDictionaryRef properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
    if (!IORegistryEntryCreateCFProperties(v7, &properties, kCFAllocatorDefault, 0)) {
      break;
    }
    sub_100002BA0("Unable to obtain properties of IOMedia object");
LABEL_12:
    IOObjectRelease(v7);
    io_object_t v7 = IOIteratorNext(iterator);
    if (!v7) {
      goto LABEL_13;
    }
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(properties, @"BSD Name");
  CFBooleanRef v9 = (const __CFBoolean *)CFDictionaryGetValue(properties, @"Whole");
  if (!Value || v9 != kCFBooleanTrue)
  {
    CFRelease(properties);
    goto LABEL_12;
  }
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v21 = v11;
  long long v22 = v11;
  long long v19 = v11;
  long long v20 = v11;
  long long v17 = v11;
  long long v18 = v11;
  *(_OWORD *)buffer = v11;
  long long v16 = v11;
  CFStringGetCString(Value, buffer, 128, 0x8000100u);
  snprintf(a2, __size, "%s%s", "/dev/", buffer);
  CFRelease(properties);
  IOObjectRelease(v7);
  uint64_t v5 = 1;
LABEL_14:
  IOObjectRelease(iterator);
  return v5;
}

uint64_t sub_100006530()
{
  CFDictionaryRef v0 = IOServiceMatching("AppleANS2NVMeController");
  if (!v0)
  {
    sub_100002BA0("Can't create AppleANS2NVMeController dictionary");
    return 16;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  if (!MatchingService)
  {
    sub_100002BA0("Can't find AppleANS2NVMeController service");
    return 16;
  }
  io_object_t v2 = MatchingService;
  if (IORegistryEntrySetCFProperty(MatchingService, @"bis-write-done", kCFBooleanTrue)) {
    sub_100002BA0("Failed to commit BIS");
  }
  IOObjectRelease(v2);
  return 0;
}

void sub_1000065CC(uint64_t a1)
{
  int v2 = 5;
  while (!*(_WORD *)(a1 + 140))
  {
    int Block = IOMobileFramebufferGetBlock();
    if (Block != -536870187 && Block != -536870184)
    {
      if (Block) {
        sub_100002BA0(">> reading BICS params failed.");
      }
      else {
        sub_100002BA0("unexpected struct version for BICS parameters");
      }
      return;
    }
    usleep(0xF4240u);
    if (!--v2) {
      return;
    }
  }
}

uint64_t sub_100006710(const void *a1, size_t a2, char *a3)
{
  uint64_t v3 = 22;
  if (a1 && a3)
  {
    int v7 = open(a3, 1);
    if ((v7 & 0x80000000) == 0)
    {
      int v8 = v7;
      if (fcntl(v7, 48, 1) < 0)
      {
        sub_100002BA0("Failed to set F_NOCACHE", v12);
      }
      else
      {
        ssize_t v9 = write(v8, a1, a2);
        ssize_t v10 = v9;
        if ((v9 & 0x8000000000000000) == 0 && v9 == a2)
        {
          uint64_t v3 = 0;
LABEL_14:
          close(v8);
          return v3;
        }
        sub_100002BA0("Failed to Write");
        if (v10 < 0) {
          sub_100002BA0("Write Failed");
        }
        else {
          sub_100002BA0("Wrong Buf_size %zd - %zd");
        }
      }
      uint64_t v3 = *__error();
      goto LABEL_14;
    }
    sub_100002BA0("Failed to open %s", a3);
    return *__error();
  }
  return v3;
}

uint64_t sub_100006814(uint64_t a1)
{
  sub_1000065CC(a1);
  sub_100002BA0("%s", "load_recovery_lth");
  if (!*(_WORD *)(a1 + 140) || !*(_WORD *)(a1 + 142) || !*(_DWORD *)(a1 + 144))
  {
    uint64_t v5 = 3758097084;
    sub_100002BA0("Params missing in %s");
    return v5;
  }
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v16[14] = v3;
  v16[15] = v3;
  v16[12] = v3;
  v16[13] = v3;
  v16[10] = v3;
  v16[11] = v3;
  v16[8] = v3;
  v16[9] = v3;
  v16[6] = v3;
  v16[7] = v3;
  v16[4] = v3;
  v16[5] = v3;
  v16[2] = v3;
  v16[3] = v3;
  v16[0] = v3;
  v16[1] = v3;
  if (*(unsigned char *)(a1 + 25))
  {
    long long v15 = (unsigned int *)0xAAAAAAAAAAAAAAAALL;
    unsigned int v14 = -1431655766;
    uint64_t v4 = sub_1000028C8(0x644C5448u, (void **)&v15, &v14);
    if (v4)
    {
      uint64_t v5 = v4;
      sub_100002BA0("Failed to read dLTH from ean: ret- %d");
      return v5;
    }
    ssize_t v9 = v15;
    unsigned int v10 = *v15;
    if ((*v15 & 0x80000000) != 0)
    {
      int v11 = v10 & 0x7FFFFFFF;
      unsigned int v10 = v15[1];
    }
    else
    {
      int v11 = 1;
    }
    sub_100002BA0("dLTH version: %u\n", v11);
    unsigned int v12 = *(_DWORD *)(a1 + 144);
    if (v10 > v12 || v14 <= v10)
    {
      uint64_t v5 = 3758097084;
      sub_100002BA0("Buffer size mismatch in %s: buf %d, recovery.nwords %d", "load_recovery_lth", v10, v12);
      free(v9);
      return v5;
    }
    sub_100002BA0("dLTH size: %u\n", v10);
    uint64_t v5 = sub_100004F98();
    free(v9);
    int v8 = -1;
  }
  else
  {
    if ((sub_10000630C(v2, (char *)v16, 0x100uLL) & 1) == 0)
    {
      sub_100002BA0("Unable to find BIS device");
      return 3758097098;
    }
    sub_100002BA0("LTH recovery path = %s", (const char *)v16);
    int v7 = sub_100006B1C((const char *)v16);
    if (v7 < 0)
    {
      uint64_t v13 = strerror(-536870212);
      sub_100002BA0("Unable to read BIS LTH - %s", v13);
      return 3758097098;
    }
    int v8 = v7;
    uint64_t v5 = sub_100004F98();
  }
  if (!v5) {
    sub_100002BA0("Disaster recovery history uploaded");
  }
  if ((v8 & 0x80000000) == 0) {
    close(v8);
  }
  return v5;
}

uint64_t sub_100006B1C(const char *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = open(a1, 0);
  if ((v2 & 0x80000000) != 0) {
    sub_100002BA0("Failed to open %s", a1);
  }
  return v2;
}

uint64_t sub_100006B74(uint64_t a1, unint64_t a2, char *a3)
{
  uint64_t result = 3758097090;
  if (a2 <= 1 && a3)
  {
    int v5 = BIMUpdaterRead();
    if (v5)
    {
      sub_100002BA0("IOConnectCallMethod() @%u failed for READ with 0x%08x.", 2179, v5);
      return 3758097098;
    }
    sub_100002BA0("IOMFB: BIM read version:%u header:%u timestamp:%llu crc:%u", *a3, a3[1], *(void *)(a3 + 2), *((_DWORD *)a3 + 7));
    if (*a3 == 1)
    {
      if (a3[1] == 66)
      {
        if (*((_DWORD *)a3 + 7) == ~sub_100008768(0xFFFFFFFFLL, a3, 28)) {
          return 0;
        }
        sub_100002BA0("BIM region: %llu failed Checksum: %08x expected - %08x calculated");
      }
      else
      {
        sub_100002BA0("BIM region: %llu header malformed %02x expected - %02x read");
      }
    }
    else
    {
      sub_100002BA0("BIM region: %llu version incorrect %02x expected - %02x read");
    }
    return 3758097084;
  }
  return result;
}

uint64_t sub_100006CA0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = 3758097090;
  if (a2 <= 1 && a3)
  {
    int v5 = BIMUpdaterWrite();
    if (v5)
    {
      sub_100002BA0("IOConnectCallMethod() @%u failed for WRITE with 0x%08x.", 2226, v5);
      return 3758097098;
    }
    else
    {
      sub_100002BA0("BIM region %llu: write successful", a2);
      return 0;
    }
  }
  return v3;
}

BOOL sub_100006D28(uint64_t a1, const char *a2, unsigned int a3, unsigned int a4)
{
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  int v8 = v7;
  if (v7)
  {
    xpc_dictionary_set_uint64(v7, "channel", a3);
    xpc_dictionary_set_string(v8, "value_type", a2);
    xpc_dictionary_set_uint64(v8, "value", a4);
    analytics_send_event();
    xpc_release(v8);
  }
  return v8 != 0;
}

BOOL sub_100006DCC(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  int v8 = v7;
  if (v7)
  {
    xpc_dictionary_set_uint64(v7, "tile", a4 + 1000 * a2);
    ssize_t v9 = (unsigned __int16 *)(a3 + 6 * a4);
    xpc_dictionary_set_uint64(v8, "red_min", v9[4]);
    xpc_dictionary_set_uint64(v8, "red_median", v9[5]);
    xpc_dictionary_set_uint64(v8, "red_max", v9[6]);
    xpc_dictionary_set_uint64(v8, "green_min", v9[604]);
    xpc_dictionary_set_uint64(v8, "green_median", v9[605]);
    xpc_dictionary_set_uint64(v8, "green_max", v9[606]);
    xpc_dictionary_set_uint64(v8, "blue_min", v9[1204]);
    xpc_dictionary_set_uint64(v8, "blue_median", v9[1205]);
    xpc_dictionary_set_uint64(v8, "blue_max", v9[1206]);
    analytics_send_event();
    xpc_release(v8);
  }
  return v8 != 0;
}

uint64_t sub_100006F08()
{
  if (IOMobileFramebufferSetParameter()) {
    return 3758097084;
  }
  else {
    return 0;
  }
}

uint64_t sub_100006F4C(unsigned char *a1)
{
  mach_timebase_info info = 0;
  (*(void (**)(unsigned char *, uint64_t))(*(void *)a1 + 72))(a1, 1);
  unint64_t v2 = byte_1000140A1;
  int v3 = byte_1000140A0[0];
  if (byte_1000140A1 >= byte_1000140A0[0])
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v4 = &byte_1000140A0[48 * byte_1000140A1 + 32];
    while (!a1[27])
    {
      mach_timebase_info(&info);
      int v5 = (uint64_t (*)(void *))*((void *)v4 - 2);
      uint64_t v6 = *((void *)v4 - 1);
      uint64_t v7 = mach_absolute_time();
      int v8 = &a1[v6 >> 1];
      if (v6) {
        int v5 = *(uint64_t (**)(void *))(*v8 + v5);
      }
      uint64_t v9 = v5(v8);
      uint64_t v10 = (mach_absolute_time() - v7) * info.numer / info.denom / 0xF4240;
      sub_100002BA0("Task %s took %llu millisec\n", v4, v10);
      *((void *)v4 - 3) = v10;
      byte_1000140A1 = ++v2;
      int v3 = byte_1000140A0[0];
      v4 += 48;
      if (v2 >= byte_1000140A0[0])
      {
        LODWORD(v2) = v2;
        goto LABEL_10;
      }
    }
    sub_100002BA0("Interrupted by sleep at %s task!!\n", v4);
    LODWORD(v2) = byte_1000140A1;
    int v3 = byte_1000140A0[0];
    uint64_t v9 = 3758097131;
  }
LABEL_10:
  if (v2 == v3)
  {
    sub_100002BA0("Tasks completed!!\n");
    byte_1000140A1 = 0;
  }
  (*(void (**)(unsigned char *, void))(*(void *)a1 + 72))(a1, 0);
  return v9;
}

uint64_t sub_10000711C(unsigned char *a1)
{
  if (a1[8])
  {
    unint64_t v2 = *(uint64_t (**)(void))(*(void *)a1 + 88);
    return v2();
  }
  else
  {
    unsigned int v4 = sub_100002C0C((uint64_t)a1);
    unsigned int v5 = sub_100002CB4();
    if (!v4) {
      unsigned int v4 = v5;
    }
    unsigned int v6 = sub_100002D80((uint64_t)a1);
    if (!v4) {
      unsigned int v4 = v6;
    }
    unsigned int v7 = sub_100002E6C();
    if (!v4) {
      unsigned int v4 = v7;
    }
    if (a1[29])
    {
      sub_100004834((uint64_t)a1);
      sub_10000601C((uint64_t)a1);
    }
    unsigned int v8 = sub_100002F64();
    if (!v4) {
      unsigned int v4 = v8;
    }
    unsigned int v9 = sub_100003080((uint64_t)a1);
    if (!v4) {
      unsigned int v4 = v9;
    }
    unsigned int v10 = sub_1000032A4((uint64_t)a1);
    if (!v4) {
      unsigned int v4 = v10;
    }
    unsigned int v11 = sub_10000350C((uint64_t)a1);
    if (!v4) {
      unsigned int v4 = v11;
    }
    LODWORD(result) = sub_10000390C();
    if (v4) {
      return v4;
    }
    else {
      return result;
    }
  }
}

uint64_t sub_100007228(uint64_t a1, uint64_t a2)
{
  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v8.st_blklong long size = v4;
  *(timespec *)v8.st_qspare = v4;
  v8.st_birthtimespec = v4;
  *(timespec *)&v8.st_long long size = v4;
  v8.st_mtimespec = v4;
  v8.st_ctimespec = v4;
  *(timespec *)&v8.st_uid = v4;
  v8.st_atimespec = v4;
  *(timespec *)&v8.st_dev = v4;
  if (!*(unsigned char *)(a1 + 24) && stat("migrate_history", &v8))
  {
    *(unsigned char *)(a1 + 136) = 1;
    uint64_t result = sub_100002C0C(a1);
    *(unsigned char *)(a1 + 136) = 0;
    if (result) {
      return snprintf((char *)a2, 0x64uLL, "save migrate history [%X]");
    }
    *(_WORD *)(a2 + 16) = 108;
    unsigned int v7 = "export successful";
    goto LABEL_17;
  }
  sub_10000479C();
  *(unsigned char *)(a1 + 136) = 1;
  if (*(unsigned char *)(a1 + 24)) {
    int v5 = sub_100005358(a1, 0x4C544820u);
  }
  else {
    int v5 = sub_100005244(a1, "migrate_history", 1, 1, 14, 1, "migrate history");
  }
  *(unsigned char *)(a1 + 136) = 0;
  if (v5) {
    return snprintf((char *)a2, 0x64uLL, "import history failed [%X]");
  }
  if (!*(unsigned char *)(a1 + 24)) {
    unlink("migrate_history");
  }
  if (sub_100002C0C(a1)) {
    return snprintf((char *)a2, 0x64uLL, "save local history failed [%X]");
  }
  if (sub_100002CB4()) {
    return snprintf((char *)a2, 0x64uLL, "regenerate BIC failed [%X]");
  }
  uint64_t result = sub_100002D80(a1);
  if (!result)
  {
    *(_WORD *)(a2 + 16) = 108;
    unsigned int v7 = "import successful";
LABEL_17:
    *(_OWORD *)a2 = *(_OWORD *)v7;
    return result;
  }
  return snprintf((char *)a2, 0x64uLL, "save BIC failed [%X]");
}

uint64_t sub_1000073D4(uint64_t a1)
{
  *(void *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 25) = 0;
  *(void *)a1 = off_100010818;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)off_100010870;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)off_100010880;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)off_100010890;
  bzero((void *)(a1 + 80), 0xD6uLL);
  return a1;
}

uint64_t sub_100007440(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  *(unsigned char *)(a1 + 25) = sub_100001F50(a1, @"ean-storage-present");
  return 1;
}

BOOL sub_100007478(uint64_t a1)
{
  int Block = IOMobileFramebufferGetBlock();
  if (Block)
  {
    sub_100002BA0("No LACS support");
  }
  else
  {
    if (sub_100007524(a1)) {
      sub_100002BA0("Failed to upload LAH");
    }
    int v4 = sub_10000775C(a1);
    if (v4)
    {
      if (v4 == -536870911)
      {
        sub_10000796C();
        sub_1000079C8(a1, 0);
      }
      else
      {
        sub_100002BA0("Failed to upload LAC");
      }
    }
  }
  return Block == 0;
}

uint64_t sub_100007524(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 293)) {
    return 0;
  }
  unsigned int v17 = 0;
  __ptr = 0;
  int v2 = sub_1000015A0(22400);
  if (!sub_100006120(v2, (uint64_t *)&__ptr, &v17)) {
    return 3758097085;
  }
  long long v15 = (FILE *)0xAAAAAAAAAAAAAAAALL;
  sub_100008970(&v15, *(char **)(a1 + 32));
  if (v15)
  {
    int v3 = sub_100007A50(a1, &v15, (char *)__ptr, v17, &v18, "file history");
    if (v3 == -536870911)
    {
      memset(__to, 0, sizeof(__to));
      time_t v14 = time(0);
      unsigned int v6 = localtime(&v14);
      strftime(__to, 0x50uLL, "history_%R_%F", v6);
      if (v15) {
        fclose(v15);
      }
      long long v15 = 0;
      rename(*(const std::__fs::filesystem::path **)(a1 + 32), (const std::__fs::filesystem::path *)__to, v7);
      sub_100002BA0("corrupted history moved aside %s\n", __to);
    }
    else if (!v3)
    {
      uint64_t v4 = 0;
      goto LABEL_16;
    }
  }
  uint64_t v8 = sub_100007C8C(a1, __ptr, v17, "recovery history");
  uint64_t v5 = v8;
  if (v8)
  {
    if (v8 == -536870911)
    {
      sub_100002A2C(0x724C4153u);
      uint64_t v5 = 3758096385;
    }
    goto LABEL_19;
  }
  uint64_t v4 = 1;
LABEL_16:
  uint64_t v9 = *(void *)(a1 + 16);
  unsigned int v10 = off_1000108A0[v4];
  uint64_t v11 = sub_100006198(v9, 58, (uint64_t)__ptr, v17, v10, 0);
  uint64_t v5 = v11;
  if (v11)
  {
    unsigned int v12 = sub_100005550(v11);
    sub_100001FE0("upload %s failed: %s", v10, v12);
  }
  else
  {
    sub_100002BA0("uploaded %s", v10);
    uint64_t v5 = 0;
  }
LABEL_19:
  if (__ptr) {
    free(__ptr);
  }
  if (v15) {
    fclose(v15);
  }
  return v5;
}

void sub_100007734(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, FILE *a12)
{
  if (a12) {
    fclose(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000775C(uint64_t a1)
{
  char v2 = *(unsigned char *)(a1 + 80);
  unsigned int v11 = 0;
  __ptr = 0;
  int v3 = sub_1000015A0(5600);
  if (!sub_100006120(v3, (uint64_t *)&__ptr, &v11)) {
    return 3758097085;
  }
  if ((*(unsigned char *)(a1 + 80) & 2) != 0
    && (uint64_t v9 = (FILE *)0xAAAAAAAAAAAAAAAALL, sub_100008970(&v9, *(char **)(a1 + 64)), v9))
  {
    int v4 = sub_100007A50(a1, &v9, (char *)__ptr, v11, &v12, "test LAC");
    if (v9) {
      fclose(v9);
    }
    if (!v4)
    {
      uint64_t v5 = 2;
      goto LABEL_25;
    }
  }
  else if (v2)
  {
    uint64_t v5 = 3;
    goto LABEL_24;
  }
  uint64_t v7 = sub_100007E98(a1, __ptr, v11, "iLAC");
  if (v7)
  {
    uint64_t v6 = v7;
    if (v7 == -536870911) {
      sub_100002A2C(0x694C4143u);
    }
    uint64_t v9 = (FILE *)0xAAAAAAAAAAAAAAAALL;
    sub_100008970(&v9, *(char **)(a1 + 48));
    if (!v9) {
      goto LABEL_28;
    }
    uint64_t v6 = sub_100007A50(a1, &v9, (char *)__ptr, v11, &v12, "file LAC");
    if (v6 == -536870911)
    {
      if (v9) {
        fclose(v9);
      }
      uint64_t v9 = 0;
      unlink(*(const char **)(a1 + 48));
    }
    if (v9) {
      fclose(v9);
    }
    if (v6) {
      goto LABEL_28;
    }
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
LABEL_24:
  if ((*(unsigned char *)(a1 + 80) & 1) == 0)
  {
LABEL_25:
    uint64_t v6 = sub_100006198(*(void *)(a1 + 16), 59, (uint64_t)__ptr, v11, "LAC", 0);
    if (!v6)
    {
      sub_100002BA0("uploaded %s", off_1000108B0[v5]);
      *(unsigned char *)(a1 + 80) |= 1u;
    }
    goto LABEL_28;
  }
  uint64_t v6 = 0;
LABEL_28:
  if (__ptr) {
    free(__ptr);
  }
  return v6;
}

void sub_100007950(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, FILE *a10)
{
  if (a10) {
    fclose(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000796C()
{
  uint64_t v0 = IOMobileFramebufferSetParameter();
  uint64_t v1 = sub_100005550(v0);
  sub_100002BA0("%s: %s", "update_lac", v1);
  return v0;
}

uint64_t sub_1000079C8(uint64_t a1, int a2)
{
  int v4 = sub_1000015A0(5600);
  return sub_100008260(a1, a2, 59, v4, *(FILE **)(a1 + 56), *(char **)(a1 + 48), 4, "lac", 0x694C4143u);
}

uint64_t sub_100007A2C()
{
  return IOMobileFramebufferSetParameter();
}

uint64_t sub_100007A40(uint64_t a1, unsigned int a2)
{
  return *(void *)(a1 + 8 * a2 + 32);
}

uint64_t sub_100007A50(uint64_t a1, FILE **a2, char *__ptr, unsigned int a4, _DWORD *a5, const char *a6)
{
  if (!*a2 || (int v12 = *(_DWORD *)(a1 + 89), fread(__ptr, 1uLL, 4uLL, *a2) != 4))
  {
    uint64_t v19 = 3758097084;
    sub_100001FE0("failed to read %s version");
    return v19;
  }
  int v13 = sub_1000015B0(__ptr);
  if (!v13)
  {
    sub_100001FE0("%s header version unknown %d");
    return 3758096385;
  }
  if (!*a2 || (int v14 = v13, fread(__ptr + 4, 1uLL, (v13 - 4), *a2) != v13 - 4))
  {
    uint64_t v19 = 3758097084;
    sub_100001FE0("failed to read %s header");
    return v19;
  }
  int v15 = sub_1000015C4((uint64_t)__ptr, 1);
  int v16 = v15;
  if (v15 - 1 >= a4)
  {
    uint64_t v19 = 3758097084;
    sub_100001FE0("bad %s size 0x%x buf 0x%x");
    return v19;
  }
  if (!*a2 || fread(&__ptr[v14], 1uLL, (v15 - v14), *a2) != v15 - v14)
  {
    uint64_t v19 = 3758097084;
    sub_100001FE0("failed to read %s content");
    return v19;
  }
  if (v12 && !sub_100001634(&__ptr[v14], *((unsigned int *)__ptr + 2), (char *)(a1 + 93), v12))
  {
    sub_100001FE0("%s panel mismatch", a6);
    *(unsigned char *)(a1 + 26) = 1;
    return 3758096385;
  }
  unsigned int v17 = (v16 - 4) >> 2;
  int v18 = *(_DWORD *)&__ptr[4 * v17];
  int v21 = 0;
  sub_100001674((int *)__ptr, v17, &v21);
  if ((*(unsigned char *)(a1 + 80) & 2) == 0 && v21 != v18)
  {
    sub_100001FE0("%s CRC not valid 0x%x 0x%x");
    return 3758096385;
  }
  uint64_t v19 = 0;
  *a5 = v16;
  return v19;
}

FILE *sub_100007C5C(FILE **a1)
{
  uint64_t result = *a1;
  if (result) {
    uint64_t result = (FILE *)fclose(result);
  }
  *a1 = 0;
  return result;
}

uint64_t sub_100007C8C(uint64_t a1, _DWORD *a2, unsigned int a3, const char *a4)
{
  int v5 = *(_DWORD *)(a1 + 89);
  long long v24 = 0;
  unsigned int v23 = 0;
  if (*(unsigned char *)(a1 + 25) && !sub_1000028C8(0x724C4153u, (void **)&v24, &v23))
  {
    unsigned int v10 = v24;
    int v22 = 0;
    if (*v24 <= *(_DWORD *)(a1 + 85) && sub_1000015B0(v24))
    {
      unsigned int v11 = sub_1000015C4((uint64_t)v10, 1);
      unsigned int v12 = v11;
      if (v11 - 1 >= a3 || 4 * (unint64_t)v23 < v11)
      {
        sub_100001FE0("%s has bad size hdr 0x%x ean 0x%x buf 0x%x");
      }
      else if (v5 && (unsigned int v13 = sub_1000015B0(v10), !sub_100001634((const char *)v10 + v13, v10[2], (char *)(a1 + 93), v5)))
      {
        sub_100001FE0("%s panel mismatch");
      }
      else
      {
        uint64_t v14 = (v12 >> 2) - 1;
        unsigned int v15 = v10[v14];
        if (v12 >> 2 != 1)
        {
          uint64_t v16 = (v12 >> 2) - 1;
          unsigned int v17 = a2;
          int v18 = (int *)v10;
          uint64_t v19 = (int *)v10;
          do
          {
            int v20 = *v19++;
            *v17++ = v20;
            sub_100001674(v18, 1, &v22);
            int v18 = v19;
            --v16;
          }
          while (v16);
        }
        if ((*(unsigned char *)(a1 + 80) & 2) != 0 || v15 == v22)
        {
          uint64_t v9 = 0;
          a2[v14] = v15;
LABEL_18:
          free(v10);
          return v9;
        }
        sub_100001FE0("%s CRC not valid 0x%x 0x%x");
      }
    }
    else
    {
      sub_100001FE0("%s header version unknown %d support %d");
    }
    uint64_t v9 = 3758096385;
    goto LABEL_18;
  }
  sub_100001FE0("could not read %s from EAN\n", a4);
  return 3758097084;
}

FILE **sub_100007E64(FILE **a1)
{
  char v2 = *a1;
  if (v2) {
    fclose(v2);
  }
  *a1 = 0;
  return a1;
}

uint64_t sub_100007E98(uint64_t a1, _DWORD *a2, unsigned int a3, const char *a4)
{
  int v5 = *(_DWORD *)(a1 + 89);
  long long v24 = 0;
  unsigned int v23 = 0;
  if (*(unsigned char *)(a1 + 25) && !sub_1000028C8(0x694C4143u, (void **)&v24, &v23))
  {
    unsigned int v10 = v24;
    int v22 = 0;
    if (*v24 <= *(_DWORD *)(a1 + 81) && sub_1000015B0(v24))
    {
      unsigned int v11 = sub_1000015C4((uint64_t)v10, 1);
      unsigned int v12 = v11;
      if (v11 - 1 >= a3 || 4 * (unint64_t)v23 < v11)
      {
        sub_100001FE0("%s has bad size hdr 0x%x ean 0x%x buf 0x%x");
      }
      else if (v5 && (unsigned int v13 = sub_1000015B0(v10), !sub_100001634((const char *)v10 + v13, v10[2], (char *)(a1 + 93), v5)))
      {
        sub_100001FE0("%s panel mismatch");
      }
      else
      {
        uint64_t v14 = (v12 >> 2) - 1;
        unsigned int v15 = v10[v14];
        if (v12 >> 2 != 1)
        {
          uint64_t v16 = (v12 >> 2) - 1;
          unsigned int v17 = a2;
          int v18 = (int *)v10;
          uint64_t v19 = (int *)v10;
          do
          {
            int v20 = *v19++;
            *v17++ = v20;
            sub_100001674(v18, 1, &v22);
            int v18 = v19;
            --v16;
          }
          while (v16);
        }
        if ((*(unsigned char *)(a1 + 80) & 2) != 0 || v15 == v22)
        {
          uint64_t v9 = 0;
          a2[v14] = v15;
LABEL_18:
          free(v10);
          return v9;
        }
        sub_100001FE0("%s CRC not valid 0x%x 0x%x");
      }
    }
    else
    {
      sub_100001FE0("%s header version unknown %d support %d");
    }
    uint64_t v9 = 3758096385;
    goto LABEL_18;
  }
  sub_100001FE0("could not read %s from EAN\n", a4);
  return 3758097084;
}

uint64_t sub_100008070(uint64_t a1, unsigned int a2)
{
  return *(void *)(a1 + 8 * a2 + 48);
}

uint64_t sub_10000807C(int a1, const void *a2, unsigned int a3, FILE *a4, FILE *a5, const char *a6, int a7)
{
  memset(__stream, 170, sizeof(__stream));
  sub_100008D84(__stream, a4, a5, a7);
  if (__stream[0] && fwrite(a2, 1uLL, a3, __stream[0]) && sub_100005E38((uint64_t)__stream))
  {
    sub_100002BA0("saved %s to file", a6);
    uint64_t v10 = 0;
  }
  else
  {
    sub_100005F08((uint64_t)__stream);
    sub_100001FE0("%s save failure", a6);
    uint64_t v10 = 3758097084;
  }
  if (__stream[0]) {
    fclose(__stream[0]);
  }
  return v10;
}

void sub_100008144(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, FILE *a10)
{
  if (a10) {
    fclose(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000815C(uint64_t a1, int a2, const void *a3, unsigned int a4, unsigned int a5, const char *a6)
{
  size_t v9 = (a2 + 4095) & 0xFFFFF000;
  if (v9 <= a4)
  {
    unsigned int v12 = 0;
  }
  else
  {
    unsigned int v11 = malloc_type_malloc((a2 + 4095) & 0xFFFFF000, 0xEB25752AuLL);
    if (!v11)
    {
      uint64_t v13 = 3758097084;
      sub_100001FE0("could not allocate memory to save %s to EAN", a6);
      return v13;
    }
    unsigned int v12 = v11;
    bzero(v11, v9);
    memcpy(v12, a3, a4);
    a3 = v12;
  }
  if (sub_100002AC0(a5, (uint64_t)a3, v9 >> 2))
  {
    uint64_t v13 = 3758097084;
    sub_100001FE0("save %s to EAN failed", a6);
    if (!v12) {
      return v13;
    }
    goto LABEL_9;
  }
  sub_100002BA0("saved %s to EAN", a6);
  uint64_t v13 = 0;
  if (v12) {
LABEL_9:
  }
    free(v12);
  return v13;
}

uint64_t sub_100008260(uint64_t a1, int a2, uint64_t a3, int a4, FILE *a5, char *a6, int a7, const char *a8, unsigned int a9)
{
  unsigned int v17 = (const char *)&unk_10000ACAB;
  if (a2) {
    unsigned int v17 = " with backup";
  }
  sub_100002BA0("%s %s%s", "save_lac_data", a6, v17);
  int v26 = 0;
  uint64_t v27 = 0;
  if (!sub_100006120(a4, (uint64_t *)&v26, (_DWORD *)&v27 + 1)) {
    return 3758097085;
  }
  int v18 = v26;
  uint64_t v19 = sub_100006198(*(void *)(a1 + 16), a3, (uint64_t)v26, HIDWORD(v27), a8, 1);
  if (!v19)
  {
    unsigned int v20 = sub_1000015C4((uint64_t)v18, 0);
    int v21 = sub_100001674((int *)v26, v20 >> 2, (int *)&v27);
    int v22 = v26;
    *(_DWORD *)((char *)v26 + v20) = v27;
    int v23 = v20 + 4;
    uint64_t v24 = sub_10000807C(v21, v22, v20 + 4, a5, (FILE *)a6, a8, a7);
    uint64_t v19 = v24;
    if (a2)
    {
      if (*(unsigned char *)(a1 + 25)) {
        uint64_t v19 = sub_10000815C(v24, v23, v26, HIDWORD(v27), a9, a8);
      }
      else {
        sub_100001FE0("could not access EAN");
      }
    }
  }
  if (v26) {
    free(v26);
  }
  return v19;
}

uint64_t sub_1000083D0(uint64_t a1, int a2, uint64_t a3, int a4, FILE *a5, char *a6, int a7, const char *a8, unsigned int a9)
{
  unsigned int v17 = (const char *)&unk_10000ACAB;
  if (a2) {
    unsigned int v17 = " with backup";
  }
  sub_100002BA0("%s %s%s", "save_lah_data", a6, v17);
  int v26 = 0;
  uint64_t v27 = 0;
  if (!sub_100006120(a4, (uint64_t *)&v26, (_DWORD *)&v27 + 1)) {
    return 3758097085;
  }
  int v18 = v26;
  uint64_t v19 = sub_100006198(*(void *)(a1 + 16), a3, (uint64_t)v26, HIDWORD(v27), a8, 1);
  if (!v19)
  {
    unsigned int v20 = sub_1000015C4((uint64_t)v18, 0);
    int v21 = sub_100001674((int *)v26, v20 >> 2, (int *)&v27);
    int v22 = v26;
    *(_DWORD *)((char *)v26 + v20) = v27;
    int v23 = v20 + 4;
    uint64_t v24 = sub_10000807C(v21, v22, v20 + 4, a5, (FILE *)a6, a8, a7);
    uint64_t v19 = v24;
    if (a2)
    {
      if (*(unsigned char *)(a1 + 25)) {
        uint64_t v19 = sub_10000815C(v24, v23, v26, HIDWORD(v27), a9, a8);
      }
      else {
        sub_100001FE0("could not access EAN");
      }
    }
  }
  if (v26) {
    free(v26);
  }
  return v19;
}

uint64_t sub_100008540(uint64_t a1, int a2)
{
  int v4 = sub_1000015A0(22400);
  return sub_1000083D0(a1, a2, 58, v4, *(FILE **)(a1 + 40), *(char **)(a1 + 32), 4, "history", 0x724C4153u);
}

uint64_t sub_1000085A4(uint64_t a1)
{
  return sub_100008540(a1, 0);
}

uint64_t sub_1000085B4(uint64_t a1)
{
  unsigned int v2 = sub_100008540(a1, 1);
  unsigned int v3 = sub_10000796C();
  if (!v2) {
    unsigned int v2 = v3;
  }
  LODWORD(result) = sub_1000079C8(a1, 1);
  if (v2) {
    return v2;
  }
  else {
    return result;
  }
}

BOOL sub_100008604(FILE **a1, void *__ptr, size_t __nitems)
{
  return *a1 && fread(__ptr, 1uLL, __nitems, *a1) == __nitems;
}

void sub_10000864C(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) == 1 && *(_DWORD *)a2 == 1 && !*(void *)(a2 + 8))
  {
    int v3 = IOMobileFramebufferSetParameter();
    if (v3)
    {
      int v4 = sub_100005550(v3);
      sub_100001FE0("Couldn't reset history: %s", v4);
      return;
    }
    unsigned int v2 = "Cleared history in driver";
  }
  else
  {
    unsigned int v2 = "Unsupported operation";
  }

  sub_100002BA0(v2);
}

uint64_t sub_1000086E4(uint64_t result, int a2)
{
  for (uint64_t i = 0; i != 256; ++i)
  {
    int v3 = 8;
    unsigned int v4 = i;
    do
    {
      unsigned int v4 = ((int)(v4 << 31) >> 31) & a2 ^ (v4 >> 1);
      --v3;
    }
    while (v3);
    *(_DWORD *)(result + 4 * i) = v4;
  }
  return result;
}

void sub_100008718()
{
  for (uint64_t i = 0; i != 256; ++i)
  {
    int v1 = 8;
    unsigned int v2 = i;
    do
    {
      unsigned int v2 = ((int)(v2 << 31) >> 31) & 0xEDB88320 ^ (v2 >> 1);
      --v1;
    }
    while (v1);
    dword_1000142EC[i] = v2;
  }
  byte_1000146EC = 1;
}

uint64_t sub_100008768(uint64_t result, char *a2, uint64_t a3)
{
  if ((byte_1000146EC & 1) == 0)
  {
    for (uint64_t i = 0; i != 256; ++i)
    {
      int v4 = 8;
      unsigned int v5 = i;
      do
      {
        unsigned int v5 = ((int)(v5 << 31) >> 31) & 0xEDB88320 ^ (v5 >> 1);
        --v4;
      }
      while (v4);
      dword_1000142EC[i] = v5;
    }
    byte_1000146EC = 1;
  }
  for (; a3; --a3)
  {
    char v6 = *a2++;
    uint64_t result = dword_1000142EC[(v6 ^ result)] ^ (result >> 8);
  }
  return result;
}

BOOL sub_1000087E0(int *a1, int *a2, unsigned int a3)
{
  unsigned int v3 = a3 >> 2;
  if (a3 >= 4)
  {
    unsigned int v5 = 0;
    if (v3 <= 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = v3;
    }
    uint64_t v6 = v4;
    uint64_t v7 = a2;
    uint64_t v8 = a1;
    while (1)
    {
      int v10 = *v8++;
      int v9 = v10;
      int v11 = *v7++;
      if (v9 != v11) {
        break;
      }
      ++v5;
      if (!--v6) {
        return v4 != v3;
      }
    }
    BOOL v12 = v5 >= 4;
    unsigned int v13 = v5 - 4;
    if (v12) {
      LODWORD(v4) = v13;
    }
    else {
      LODWORD(v4) = 0;
    }
    uint64_t v14 = &a1[v4];
    unsigned int v15 = &a2[v4];
    sub_100002BA0("a[%d/%d] = %08X %08X %08X %08X %08X %08X %08X %08X", v4, a3 >> 2, *v14, v14[1], v14[2], v14[3], v14[4], v14[5], v14[6], v14[7]);
    sub_100002BA0("b[%d/%d] = %08X %08X %08X %08X %08X %08X %08X %08X", v4, v3, *v15, v15[1], v15[2], v15[3], v15[4], v15[5], v15[6], v15[7]);
  }
  else
  {
    LODWORD(v4) = 0;
  }
  return v4 != v3;
}

uint64_t sub_1000088D0(io_connect_t *a1)
{
  CFDictionaryRef v2 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    io_object_t v4 = MatchingService;
    uint64_t v5 = IOServiceOpen(MatchingService, mach_task_self_, 0, a1);
    IOObjectRelease(v4);
    if (v5) {
      sub_100002BA0("IOServiceOpen on AppleNVMeEAN failed, ans = 0x%x \n", v5);
    }
  }
  else
  {
    sub_100002BA0("Couldn't find AppleNVMeEAN object");
    return 5;
  }
  return v5;
}

FILE **sub_100008970(FILE **a1, char *__filename)
{
  io_object_t v4 = fopen(__filename, "r");
  *a1 = v4;
  if (!v4) {
    sub_100001FE0("Could not open file %s", __filename);
  }
  return a1;
}

BOOL sub_1000089C8(const char *a1)
{
  int v1 = sem_open(a1, 0);
  CFDictionaryRef v2 = v1;
  if (v1 != (sem_t *)-1) {
    sem_close(v1);
  }
  return v2 != (sem_t *)-1;
}

void sub_100008A08(const char *a1)
{
  CFDictionaryRef v2 = sem_open(a1, 512, 256, 0);
  if (v2 == (sem_t *)-1)
  {
    unsigned int v3 = __error();
    sub_100001FE0("could not create semaphore %s (%d)", a1, *v3);
  }
  else
  {
    sem_close(v2);
  }
}

void sub_100008A80(const void *a1, unsigned int a2, const char *a3)
{
  size_t v6 = a2;
  if (a2 <= 0xC7) {
    size_t v7 = 200 - a2;
  }
  else {
    size_t v7 = 0;
  }
  bzero(&__dst[a2], v7);
  memcpy(__dst, a1, v6);
  __dst[a2] = 0;
  sub_100002BA0("%s %s len %d\n", a3, __dst, a2);
}

uint64_t sub_100008B40()
{
  return 1;
}

uint64_t sub_100008B48()
{
  return 0;
}

uint64_t sub_100008B50()
{
  return 0;
}

uint64_t sub_100008B58()
{
  return 0;
}

uint64_t sub_100008B6C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 27) = a2;
  return result;
}

void sub_100008B7C(id a1)
{
  qword_1000146F0 = (uint64_t)dispatch_semaphore_create(0);
}

void sub_100008BA0(id a1)
{
}

ssize_t sub_100008BAC(uint64_t a1, void *a2, unsigned int a3)
{
  return read(*(_DWORD *)(a1 + 8), a2, 4 * a3);
}

void *sub_100008BB8(uint64_t a1, void *__dst, unsigned int a3)
{
  if (*(_DWORD *)(a1 + 16) >= a3) {
    unsigned int v4 = a3;
  }
  else {
    unsigned int v4 = *(_DWORD *)(a1 + 16);
  }
  uint64_t result = memcpy(__dst, *(const void **)(a1 + 8), 4 * v4);
  *(_DWORD *)(a1 + 16) -= v4;
  *(void *)(a1 + 8) += 4 * v4;
  return result;
}

uint64_t sub_100008C10(uint64_t a1, _DWORD *a2, int a3, unsigned int a4)
{
  if (a3)
  {
    uint64_t v7 = *(void *)(a1 + 16) - 4 * a4;
    *(void *)(a1 + 16) = v7;
    if (v7 >= 0)
    {
      size_t v8 = 4 * a4;
      memcpy(*(void **)(a1 + 32), a2 + 7, v8);
      uint64_t v9 = 0;
      size_t v10 = *(void *)(a1 + 32) + v8;
LABEL_4:
      *(void *)(a1 + 32) = v10;
      return v9;
    }
    uint64_t v9 = 3758097085;
    goto LABEL_16;
  }
  int v11 = sub_100004EF0();
  uint64_t v12 = 0;
  if (v11 == 4) {
    int v13 = 92;
  }
  else {
    int v13 = 84;
  }
  size_t v14 = (v13 + a2[31]) + 4;
  *(void *)(a1 + 24) = v14;
  do
  {
    size_t v15 = v14 + a2[v12 + 17];
    *(void *)(a1 + 24) = v15;
    size_t v14 = v15 + a2[v12 + 20];
    *(void *)(a1 + 24) = v14;
    ++v12;
  }
  while (v12 != 3);
  uint64_t v9 = 3758097085;
  uint64_t v16 = malloc_type_malloc(v14, 0x7CB7AFF2uLL);
  *(void *)(a1 + 8) = v16;
  if (v16)
  {
    unint64_t v17 = sub_1000055C8((uint64_t)v16, v16, *(void *)(a1 + 24), (uint64_t)(a2 + 7), a2 + 41);
    if (!v17)
    {
      sub_100001FE0("Failed to populate ibic header");
      return v9;
    }
    uint64_t v18 = *(void *)(a1 + 24) - v17;
    *(void *)(a1 + 16) = v18;
    if (v18 >= 0)
    {
      uint64_t v19 = (void *)(*(void *)(a1 + 8) + v17);
      *(void *)(a1 + 32) = v19;
      unsigned int v20 = (char *)a2 + a2[31] + 164;
      size_t v21 = 4 * a4 - (a2[31] + 164) + 28;
      uint64_t v22 = v18 - v21;
      *(void *)(a1 + 16) = v22;
      if (v22 >= 0)
      {
        memcpy(v19, v20, v21);
        uint64_t v9 = 0;
        size_t v10 = *(void *)(a1 + 32) + v21;
        goto LABEL_4;
      }
    }
LABEL_16:
    sub_100001FE0("Out of memory");
  }
  return v9;
}

FILE **sub_100008D84(FILE **a1, FILE *a2, FILE *a3, int a4)
{
  a1[1] = a2;
  a1[2] = a3;
  if (a4)
  {
    int v5 = open_dprotected_np((const char *)a2, 1537, a4, 0, 420);
    if (v5 < 0)
    {
      *a1 = 0;
LABEL_8:
      sub_100001FE0("Could not open temp file %s", (const char *)a1[1]);
      return a1;
    }
    size_t v6 = fdopen(v5, "w");
  }
  else
  {
    size_t v6 = fopen((const char *)a2, "w");
  }
  *a1 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  return a1;
}

uint64_t sub_100008E20(uint64_t a1, uint64_t a2, int a3, size_t __nitems, int a5)
{
  unsigned int v6 = __nitems;
  size_t v10 = *(FILE ***)(a1 + 32);
  if (v10 && (!*v10 || !fwrite((const void *)(a2 + 28), 4uLL, __nitems, *v10)))
  {
    sub_100002BA0("%s: write failure", *(const char **)(a1 + 24));
    return 3758097084;
  }
  if (*(void *)a1)
  {
    if (a3)
    {
      int v11 = **(_DWORD ***)a1;
      if (!v11) {
        return 0;
      }
    }
    else
    {
      int v13 = *(_DWORD *)(a1 + 16);
      if (v13) {
        size_t v14 = (4 * (a5 + 1) + v13 - 1) & -v13;
      }
      else {
        size_t v14 = 4 * (a5 + 1);
      }
      **(void **)a1 = malloc_type_malloc(v14, 0x2ADF1D83uLL);
      size_t v15 = *(_DWORD ***)a1;
      **(_DWORD **)(a1 + 8) = v14 >> 2;
      int v11 = *v15;
      if (!*v15) {
        return 0;
      }
      _DWORD *v11 = a5;
    }
    memcpy(&v11[a3 + 1], (const void *)(a2 + 28), 4 * v6);
  }
  return 0;
}

uint64_t sub_100008F30(unsigned int *a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  if (!a3 && !**((void **)a1 + 3))
  {
    a1[2] = a5;
    unsigned int v10 = a1[1];
    size_t v11 = v10 ? (v10 + 4 * (*a1 + a5) - 1) & -v10 : 4 * (*a1 + a5);
    **((void **)a1 + 3) = malloc_type_malloc(v11, 0x36C82B13uLL);
    if (!*((void *)a1 + 3)) {
      sub_100002BA0("%s: failed to allocate buffer.", *((const char **)a1 + 2));
    }
  }
  uint64_t v12 = 3758097084;
  int v13 = (void *)*((void *)a1 + 3);
  if (!v13) {
    return 3758097085;
  }
  if (a4 + a3 <= a5 && a1[2] == a5)
  {
    memcpy((void *)(*v13 + 4 * a3 + 4 * *a1), (const void *)(a2 + 28), 4 * a4);
    return 0;
  }
  else
  {
    sub_100002BA0("%s: inconsistent data from server.", *((const char **)a1 + 2));
  }
  return v12;
}

void sub_10000904C(pthread_t *a1)
{
  if (pthread_create(a1, 0, (void *(__cdecl *)(void *))sub_1000090A0, 0))
  {
    sub_100001FE0("Could not launch power listener thread");
  }
}

uint64_t sub_1000090A0()
{
  io_object_t notifier = 0;
  IONotificationPortRef notify = 0;
  io_connect_t v0 = IORegisterForSystemPower(0, &notify, (IOServiceInterestCallback)sub_100001694, &notifier);
  dword_10001470C = v0;
  if (notify) {
    BOOL v1 = v0 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1)
  {
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource(notify);
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    CFRunLoopRun();
  }
  sub_100001FE0("power listener thread returning. :(");
  return 0;
}

uint64_t AMRestorePartitionFWCopyTagData(const __CFURL *a1)
{
  if (a1 && (int v1 = sub_1000096C0(a1, 0)) != 0)
  {
    int v2 = v1;
    unsigned int v3 = malloc(0x8000uLL);
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

uint64_t sub_1000096C0(const __CFURL *a1, int a2)
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

uint64_t AMRestorePartitionFWCommitData(const __CFURL *a1, CFStringRef theString, CFDataRef theData, int a4)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  *(_WORD *)bytes = 0;
  if (!a1 || !theString || !theData)
  {
    AMSupportLogInternal();
    goto LABEL_18;
  }
  if (a4)
  {
    CFDataRef v16 = 0;
    memset(length, 0, sizeof(length));
    if (CFStringGetLength(theString) == 4
      && (char v14 = 0, *(_DWORD *)buffer = 0, CFStringGetCString(theString, buffer, 5, 0x8000100u))
      && !AMAuthInstallApImg4CreatePayload()
      && v16
      && (CFDataGetBytePtr(v16), CFDataGetLength(v16), Img4EncodeStitchManifest() == 100)
      && (CFDataRef v6 = CFDataCreate(0, *(const UInt8 **)&length[1], length[0])) != 0)
    {
      CFDataRef v7 = (const __CFData *)CFRetain(v6);
      char v8 = 1;
    }
    else
    {
      AMSupportLogInternal();
      CFDataRef v7 = 0;
      char v8 = 0;
    }
    AMSupportSafeRelease();
    AMSupportSafeRelease();
    AMSupportSafeFree();
    if ((v8 & 1) == 0 || !v7) {
      goto LABEL_17;
    }
    CFDataGetLength(v7);
  }
  else
  {
    CFDataGetLength(theData);
  }
  AMRestorePartitionFWCopyTagData(a1);
LABEL_17:
  AMSupportLogInternal();
LABEL_18:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return 99;
}

uint64_t sub_10000A040(const __CFData *a1, int a2)
{
  if (a1)
  {
    if (a2 > 0)
    {
      BytePtr = CFDataGetBytePtr(a1);
      if (BytePtr)
      {
        uint64_t v5 = BytePtr;
        CFIndex Length = CFDataGetLength(a1);
        CFIndex v7 = Length;
        if (Length < 1)
        {
          CFIndex v8 = 0;
LABEL_10:
          if (v8 == v7) {
            return 1;
          }
        }
        else
        {
          CFIndex v8 = 0;
          size_t v9 = Length;
          while (1)
          {
            ssize_t v10 = write(a2, v5, v9);
            if (v10 <= 0) {
              break;
            }
            v5 += v10;
            v9 -= v10;
            v8 += v10;
            if (v8 >= v7) {
              goto LABEL_10;
            }
          }
          uint64_t v12 = __error();
          strerror(*v12);
        }
      }
    }
  }
  AMSupportLogInternal();
  return 0;
}

uint64_t AMAuthInstallApImg4CreatePayload()
{
  return _AMAuthInstallApImg4CreatePayload();
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

uint64_t BIMUpdaterActivate()
{
  return _BIMUpdaterActivate();
}

uint64_t BIMUpdaterCancel()
{
  return _BIMUpdaterCancel();
}

uint64_t BIMUpdaterCreate()
{
  return _BIMUpdaterCreate();
}

uint64_t BIMUpdaterEndUpdate()
{
  return _BIMUpdaterEndUpdate();
}

uint64_t BIMUpdaterRead()
{
  return _BIMUpdaterRead();
}

uint64_t BIMUpdaterStartUpdate()
{
  return _BIMUpdaterStartUpdate();
}

uint64_t BIMUpdaterWrite()
{
  return _BIMUpdaterWrite();
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

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return _CFURLCreateFromFileSystemRepresentation(allocator, buffer, bufLen, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return _CFURLGetFileSystemRepresentation(url, resolveAgainstBase, buffer, maxBufLen);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
}

uint64_t IOMobileFramebufferGetBlock()
{
  return _IOMobileFramebufferGetBlock();
}

uint64_t IOMobileFramebufferGetBufBlock()
{
  return _IOMobileFramebufferGetBufBlock();
}

uint64_t IOMobileFramebufferGetMainDisplay()
{
  return _IOMobileFramebufferGetMainDisplay();
}

uint64_t IOMobileFramebufferGetServiceObject()
{
  return _IOMobileFramebufferGetServiceObject();
}

uint64_t IOMobileFramebufferSetBlock()
{
  return _IOMobileFramebufferSetBlock();
}

uint64_t IOMobileFramebufferSetParameter()
{
  return _IOMobileFramebufferSetParameter();
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryCreateIterator(mach_port_t mainPort, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryCreateIterator(mainPort, plane, options, iterator);
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

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
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

uint64_t Img4DecodeInit()
{
  return _Img4DecodeInit();
}

uint64_t Img4DecodeParseLengthFromBuffer()
{
  return _Img4DecodeParseLengthFromBuffer();
}

uint64_t Img4EncodeStitchManifest()
{
  return _Img4EncodeStitchManifest();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int *__error(void)
{
  return ___error();
}

uint64_t __strncpy_chk()
{
  return ___strncpy_chk();
}

uint64_t analytics_send_event()
{
  return _analytics_send_event();
}

void bzero(void *a1, size_t a2)
{
}

int chdir(const char *a1)
{
  return _chdir(a1);
}

int close(int a1)
{
  return _close(a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
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

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return _fdopen(a1, a2);
}

int ferror(FILE *a1)
{
  return _ferror(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
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

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_aligned_alloc(alignment, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return _pthread_cond_signal(a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int sem_close(sem_t *a1)
{
  return _sem_close(a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return _sem_open(a1, a2);
}

int sem_post(sem_t *a1)
{
  return _sem_post(a1);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return _sigaction(a1, a2, a3);
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

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

void sync(void)
{
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int vprintf(const char *a1, va_list a2)
{
  return _vprintf(a1, a2);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_unregister(const char *identifier)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}