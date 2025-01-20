void IOACIPCTraceClass::IOACIPCTraceClass(IOACIPCTraceClass *this)
{
  *(_DWORD *)this = 0;
  *((void *)this + 9) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 8), 0);
}

{
  *(_DWORD *)this = 0;
  *((void *)this + 9) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 8), 0);
}

void IOACIPCTraceClass::~IOACIPCTraceClass(IOACIPCTraceClass *this)
{
  if (*(_DWORD *)this >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: \n", "~IOACIPCTraceClass");
  }
  IOACIPCTraceClass::stop((io_object_t *)this);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 8));
}

void __clang_call_terminate(void *a1)
{
}

uint64_t IOACIPCTraceClass::stop(io_object_t *this)
{
  v2 = (pthread_mutex_t *)(this + 2);
  pthread_mutex_lock((pthread_mutex_t *)(this + 2));
  v3 = (FILE **)MEMORY[0x263EF8348];
  if (*this >= 2) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: \n", "stop");
  }
  IOACIPCTraceClass::closeService((IOACIPCTraceClass *)this);
  io_object_t v4 = this[18];
  if (v4)
  {
    IOObjectRelease(v4);
    this[18] = 0;
  }
  if (*this >= 2) {
    fprintf(*v3, "IOACIPCTraceClass::%s: --done\n", "stop");
  }
  pthread_mutex_unlock(v2);
  return 1;
}

uint64_t IOACIPCTraceClass::start(IOACIPCTraceClass *this, __CFRunLoop *a2)
{
  io_object_t v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  uint64_t v5 = IOACIPCTraceClass::connect(this, a2, 0);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOACIPCTraceClass::connect(IOACIPCTraceClass *this, __CFRunLoop *a2, NSObject *a3)
{
  if (*((_DWORD *)this + 18))
  {
LABEL_2:
    uint64_t v4 = 1;
    goto LABEL_3;
  }
  CFDictionaryRef v7 = IOServiceMatching("IOAppleConvergedIPCTraceBackendRaw");
  if (v7)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v7);
    *((_DWORD *)this + 18) = MatchingService;
    if (MatchingService)
    {
      if (IOACIPCTraceClass::openService(this))
      {
        if (*(_DWORD *)this >= 2u) {
          fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: could not open service\n", "connect");
        }
        IOObjectRelease(*((_DWORD *)this + 18));
        uint64_t v4 = 0;
        *((_DWORD *)this + 18) = 0;
        goto LABEL_3;
      }
      if (a2)
      {
        if (a3) {
          IOACIPCTraceClass::connect();
        }
        *((void *)this + 11) = a2;
        CFRetain(a2);
      }
      else if (a3)
      {
        *((void *)this + 12) = a3;
        dispatch_retain(a3);
      }
      IOACIPCTraceClass::setNotificationPort(this);
      goto LABEL_2;
    }
    if (*(_DWORD *)this >= 2u)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: could not get matching service\n");
      goto LABEL_15;
    }
    return 0;
  }
  if (*(_DWORD *)this < 2u) {
    return 0;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: could not create matching dictionary\n");
LABEL_15:
  uint64_t v4 = 0;
LABEL_3:
  if (*(_DWORD *)this >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: --done\n", "connect");
  }
  return v4;
}

uint64_t IOACIPCTraceClass::start(IOACIPCTraceClass *this, NSObject *a2)
{
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  uint64_t v5 = IOACIPCTraceClass::connect(this, 0, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOACIPCTraceClass::openService(IOACIPCTraceClass *this)
{
  io_registry_entry_t v2 = *((_DWORD *)this + 18);
  if (!v2) {
    return 3758096385;
  }
  if (*((_DWORD *)this + 19)) {
    return 0;
  }
  if (*((void *)this + 10))
  {
    CFRelease(*((CFTypeRef *)this + 10));
    *((void *)this + 10) = 0;
    io_registry_entry_t v2 = *((_DWORD *)this + 18);
  }
  *((void *)this + 10) = IORegistryEntryCreateCFProperty(v2, @"TracePipes", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  uint64_t v3 = IOServiceOpen(*((_DWORD *)this + 18), *MEMORY[0x263EF8960], 0, (io_connect_t *)this + 19);
  if (v3)
  {
    uint64_t v4 = (const void *)*((void *)this + 10);
    if (v4)
    {
      CFRelease(v4);
      *((void *)this + 10) = 0;
    }
  }
  if (*(_DWORD *)this >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: ret = %x\n", "openService", v3);
  }
  return v3;
}

void IOACIPCTraceClass::setNotificationPort(IOACIPCTraceClass *this)
{
  if (!*((void *)this + 13))
  {
    io_registry_entry_t v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    *((void *)this + 13) = v2;
    if (!v2) {
      IOACIPCTraceClass::setNotificationPort();
    }
    if (*((void *)this + 11))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v2);
      *((void *)this + 14) = RunLoopSource;
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 11), RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    }
    uint64_t v4 = *((void *)this + 12);
    if (v4)
    {
      uint64_t v5 = (IONotificationPort *)*((void *)this + 13);
      IONotificationPortSetDispatchQueue(v5, v4);
    }
  }
}

uint64_t IOACIPCTraceClass::closeService(IOACIPCTraceClass *this)
{
  io_registry_entry_t v2 = (const void *)*((void *)this + 10);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 10) = 0;
  }
  io_connect_t v3 = *((_DWORD *)this + 19);
  if (v3)
  {
    IOServiceClose(v3);
    *((_DWORD *)this + 19) = 0;
  }
  IOACIPCTraceClass::clearNotificationPort(this);
  uint64_t v4 = (const void *)*((void *)this + 11);
  if (v4)
  {
    CFRelease(v4);
    *((void *)this + 11) = 0;
  }
  uint64_t v5 = *((void *)this + 12);
  if (v5)
  {
    dispatch_release(v5);
    *((void *)this + 12) = 0;
  }
  return 0;
}

void IOACIPCTraceClass::clearNotificationPort(IOACIPCTraceClass *this)
{
  io_connect_t v3 = (void *)((char *)this + 104);
  io_registry_entry_t v2 = (IONotificationPort *)*((void *)this + 13);
  if (v2)
  {
    if (*((void *)this + 11))
    {
      CFRunLoopRemoveSource(*((CFRunLoopRef *)this + 11), *((CFRunLoopSourceRef *)this + 14), (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      io_registry_entry_t v2 = (IONotificationPort *)*((void *)this + 13);
    }
    IONotificationPortDestroy(v2);
    *io_connect_t v3 = 0;
    v3[1] = 0;
  }
}

const __CFArray *IOACIPCTraceClass::getPipeCount(IOACIPCTraceClass *this)
{
  CFArrayRef result = (const __CFArray *)*((void *)this + 10);
  if (result) {
    return (const __CFArray *)CFArrayGetCount(result);
  }
  return result;
}

uint64_t IOACIPCTraceClass::getPipeCodeAndName(IOACIPCTraceClass *this, unsigned int a2, unsigned int *a3, char *a4, unsigned int a5)
{
  uint64_t result = *((void *)this + 10);
  if (result)
  {
    unsigned int Count = CFArrayGetCount((CFArrayRef)result);
    uint64_t result = 0;
    if (a3)
    {
      if (a4)
      {
        if (Count > a2)
        {
          uint64_t result = (uint64_t)CFArrayGetValueAtIndex(*((CFArrayRef *)this + 10), a2);
          if (result)
          {
            CFDictionaryRef v12 = (const __CFDictionary *)result;
            CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)result, @"Code");
            uint64_t result = CFNumberGetValue(Value, kCFNumberIntType, a3);
            if (result)
            {
              uint64_t result = (uint64_t)CFDictionaryGetValue(v12, @"Name");
              if (result)
              {
                CFStringRef v14 = (const __CFString *)result;
                if (CFStringGetLength((CFStringRef)result))
                {
                  return CFStringGetCString(v14, a4, a5, 0x600u) != 0;
                }
                else
                {
                  strncpy(a4, "DEFAULT", a5);
                  return 1;
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

uint64_t IOACIPCTraceClass::openPipe(IOACIPCTraceClass *this)
{
  io_registry_entry_t v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if (*(_DWORD *)this >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: \n", "openPipe");
  }
  pthread_mutex_unlock(v2);
  return 0;
}

uint64_t IOACIPCTraceClass::closePipe(IOACIPCTraceClass *this)
{
  io_registry_entry_t v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if (*(_DWORD *)this >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: \n", "closePipe");
  }
  pthread_mutex_unlock(v2);
  return 0;
}

BOOL IOACIPCTraceClass::getSnapshotBufferSize(IOACIPCTraceClass *this, unsigned int *a2)
{
  BOOL v2 = 0;
  if (a2)
  {
    io_registry_entry_t v3 = *((_DWORD *)this + 18);
    if (v3)
    {
      CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, @"SnapshotBufferSize", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
      if (CFProperty)
      {
        CFNumberRef v6 = CFProperty;
        BOOL v2 = CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2) != 0;
        CFRelease(v6);
      }
      else
      {
        return 0;
      }
    }
  }
  return v2;
}

uint64_t IOACIPCTraceClass::readLogsAsync(IOACIPCTraceClass *this, unsigned int a2, void *a3, unsigned int a4, unsigned int a5, void (*a6)(void *, int, void *), void *a7)
{
  input[4] = *MEMORY[0x263EF8340];
  CFStringRef v14 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if (*(_DWORD *)this >= 3u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: buff %p, size %u\n", "readLogsAsync", a3, a4);
  }
  v15 = (IONotificationPort *)*((void *)this + 13);
  if (v15)
  {
    input[0] = a2;
    input[1] = (uint64_t)a3;
    input[2] = a4;
    input[3] = a5;
    *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v16;
    long long v25 = v16;
    reference[1] = (uint64_t)a6;
    v22 = a7;
    mach_port_t v17 = *((_DWORD *)this + 19);
    mach_port_t MachPort = IONotificationPortGetMachPort(v15);
    uint64_t v19 = IOConnectCallAsyncScalarMethod(v17, 0, MachPort, reference, 3u, input, 4u, 0, 0);
    if (*(_DWORD *)this >= 3u) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: ret = %x\n", "readLogsAsync", v19);
    }
    pthread_mutex_unlock(v14);
  }
  else
  {
    if (*(_DWORD *)this >= 2u) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: no async port\n", "readLogsAsync");
    }
    pthread_mutex_unlock(v14);
    return 3758097112;
  }
  return v19;
}

uint64_t IOACIPCTraceClass::dumpRegistry(IOACIPCTraceClass *this)
{
  if (*(_DWORD *)this >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: \n", "dumpRegistry");
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  mach_port_t v2 = *((_DWORD *)this + 19);
  if (v2)
  {
    uint64_t v3 = IOConnectCallScalarMethod(v2, 2u, 0, 0, 0, 0);
  }
  else
  {
    uint64_t v3 = 3758097112;
    if (*(_DWORD *)this >= 2u) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: no connection\n", "dumpRegistry");
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
  return v3;
}

uint64_t IOACIPCTraceClass::flushTraceBuffers(IOACIPCTraceClass *this, unsigned int a2, unsigned int a3, void (*a4)(void *, int, void *), void *a5)
{
  input[2] = *MEMORY[0x263EF8340];
  if (*(_DWORD *)this >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: \n", "flushTraceBuffers");
  }
  input[0] = a2;
  input[1] = a3;
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  mach_port_t v10 = *((_DWORD *)this + 19);
  if (v10)
  {
    if (a4)
    {
      *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
      reference[0] = 0xAAAAAAAAAAAAAAAALL;
      long long v19 = v11;
      long long v20 = v11;
      reference[1] = (uint64_t)a4;
      mach_port_t v17 = a5;
      mach_port_t MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 13));
      uint64_t v13 = IOConnectCallAsyncScalarMethod(v10, 1u, MachPort, reference, 3u, input, 2u, 0, 0);
    }
    else
    {
      uint64_t v13 = IOConnectCallScalarMethod(*((_DWORD *)this + 19), 1u, input, 2u, 0, 0);
    }
    uint64_t v14 = v13;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
  }
  else
  {
    if (*(_DWORD *)this >= 2u) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: no connection\n", "flushTraceBuffers");
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
    return 3758097112;
  }
  return v14;
}

uint64_t IOACIPCTraceClass::demo(IOACIPCTraceClass *this)
{
  if (*(_DWORD *)this >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: \n", "demo");
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  mach_port_t v2 = *((_DWORD *)this + 19);
  if (v2)
  {
    uint64_t v3 = IOConnectCallScalarMethod(v2, 6u, 0, 0, 0, 0);
  }
  else
  {
    uint64_t v3 = 3758097112;
    if (*(_DWORD *)this >= 2u) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: no connection\n", "demo");
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
  return v3;
}

uint64_t IOACIPCTraceClass::enablePipe(IOACIPCTraceClass *this, unsigned int a2, unsigned int a3)
{
  input[2] = *MEMORY[0x263EF8340];
  if (*(_DWORD *)this >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: \n", "enablePipe");
  }
  input[0] = a2;
  input[1] = a3;
  CFNumberRef v6 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  mach_port_t v7 = *((_DWORD *)this + 19);
  if (v7)
  {
    uint64_t v8 = IOConnectCallScalarMethod(v7, 7u, input, 2u, 0, 0);
    pthread_mutex_unlock(v6);
  }
  else
  {
    if (*(_DWORD *)this >= 2u) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: no connection\n", "enablePipe");
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
    return 3758097112;
  }
  return v8;
}

uint64_t IOACIPCTraceClass::activateAllTracePoints(IOACIPCTraceClass *this)
{
  input[1] = *MEMORY[0x263EF8340];
  if (*(_DWORD *)this >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: \n", "activateAllTracePoints");
  }
  input[0] = 1;
  mach_port_t v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  mach_port_t v3 = *((_DWORD *)this + 19);
  if (v3)
  {
    uint64_t v4 = IOConnectCallScalarMethod(v3, 8u, input, 1u, 0, 0);
    pthread_mutex_unlock(v2);
  }
  else
  {
    if (*(_DWORD *)this >= 2u) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: no connection\n", "activateAllTracePoints");
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
    return 3758097112;
  }
  return v4;
}

uint64_t IOACIPCTraceClass::deactivateAllTracePoints(IOACIPCTraceClass *this)
{
  input[1] = *MEMORY[0x263EF8340];
  if (*(_DWORD *)this >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: \n", "deactivateAllTracePoints");
  }
  input[0] = 0;
  mach_port_t v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  mach_port_t v3 = *((_DWORD *)this + 19);
  if (v3)
  {
    uint64_t v4 = IOConnectCallScalarMethod(v3, 8u, input, 1u, 0, 0);
    pthread_mutex_unlock(v2);
  }
  else
  {
    if (*(_DWORD *)this >= 2u) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: no connection\n", "deactivateAllTracePoints");
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
    return 3758097112;
  }
  return v4;
}

uint64_t IOACIPCTraceClass::activateTracePoint(IOACIPCTraceClass *this, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  if (*(_DWORD *)this >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: \n", "activateTracePoint");
  }
  input[0] = 1;
  input[1] = a2;
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  mach_port_t v5 = *((_DWORD *)this + 19);
  if (v5)
  {
    uint64_t v6 = IOConnectCallScalarMethod(v5, 9u, input, 2u, 0, 0);
    pthread_mutex_unlock(v4);
  }
  else
  {
    if (*(_DWORD *)this >= 2u) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: no connection\n", "activateTracePoint");
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
    return 3758097112;
  }
  return v6;
}

uint64_t IOACIPCTraceClass::deactivateTracePoint(IOACIPCTraceClass *this, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  if (*(_DWORD *)this >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: \n", "deactivateTracePoint");
  }
  input[0] = 0;
  input[1] = a2;
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  mach_port_t v5 = *((_DWORD *)this + 19);
  if (v5)
  {
    uint64_t v6 = IOConnectCallScalarMethod(v5, 9u, input, 2u, 0, 0);
    pthread_mutex_unlock(v4);
  }
  else
  {
    if (*(_DWORD *)this >= 2u) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: no connection\n", "deactivateTracePoint");
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
    return 3758097112;
  }
  return v6;
}

BOOL IOACIPCTraceClass::getRegistryInfo(uint64_t a1, void *a2)
{
  kern_return_t v5;
  size_t outputStructCnt;

  if (*(_DWORD *)a1 >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: \n", "getRegistryInfo");
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  mach_port_t v4 = *(_DWORD *)(a1 + 76);
  if (v4)
  {
    outputStructCnt = 36;
    mach_port_t v5 = IOConnectCallStructMethod(v4, 3u, 0, 0, a2, &outputStructCnt);
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    return v5 == 0;
  }
  else
  {
    if (*(_DWORD *)a1 >= 2u) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: no connection\n", "getRegistryInfo");
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    return 0;
  }
}

BOOL IOACIPCTraceClass::getTraceCode(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)a1 >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: \n", "getTraceCode");
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  mach_port_t v6 = *(_DWORD *)(a1 + 76);
  if (v6)
  {
    v48 = (pthread_mutex_t *)(a1 + 8);
    mach_port_t v7 = operator new(0x808uLL);
    v7[1] = 0;
    v7[2] = 0;
    *mach_port_t v7 = &unk_26EB1C928;
    v49 = v7;
    outputStruct = v7 + 3;
    bzero(v7 + 3, 0x7ECuLL);
    size_t v53 = 2028;
    std::string::size_type v50 = a2;
    input.__r_.__value_.__r.__words[0] = a2;
    if (IOConnectCallMethod(v6, 4u, (const uint64_t *)&input, 1u, 0, 0, 0, 0, outputStruct, &v53))
    {
      if (*(_DWORD *)a1 >= 2u) {
        fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: TraceCode invalid\n", "getTraceCode");
      }
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
      BOOL v9 = 0;
    }
    else
    {
      mach_port_t v10 = v49;
      *((_DWORD *)a3 + 12) = *((_DWORD *)v49 + 7);
      MEMORY[0x23EC89E60](a3, (char *)v49 + 44);
      uint64_t v11 = *((unsigned __int8 *)a3 + 23);
      if ((v11 & 0x80u) == 0) {
        CFDictionaryRef v12 = a3;
      }
      else {
        CFDictionaryRef v12 = (uint64_t *)*a3;
      }
      if ((v11 & 0x80u) != 0) {
        uint64_t v11 = a3[1];
      }
      if (v11)
      {
        std::string::size_type v13 = 0;
        while (*((unsigned char *)v12 + v13) == 32)
        {
          if (v11 == ++v13) {
            goto LABEL_20;
          }
        }
      }
      else
      {
LABEL_20:
        std::string::size_type v13 = -1;
      }
      std::string::erase((std::string *)a3, 0, v13);
      uint64_t v14 = *((unsigned __int8 *)a3 + 23);
      if ((v14 & 0x80u) == 0) {
        v15 = a3;
      }
      else {
        v15 = (uint64_t *)*a3;
      }
      if ((v14 & 0x80u) != 0) {
        uint64_t v14 = a3[1];
      }
      uint64_t v16 = (uint64_t)v15 - 1;
      while (v14)
      {
        int v17 = *(unsigned __int8 *)(v16 + v14--);
        if (v17 != 32) {
          goto LABEL_31;
        }
      }
      uint64_t v14 = -1;
LABEL_31:
      std::string::erase((std::string *)a3, v14 + 1, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v18 = *((unsigned __int8 *)a3 + 23);
      if ((v18 & 0x80u) == 0) {
        long long v19 = a3;
      }
      else {
        long long v19 = (uint64_t *)*a3;
      }
      if ((v18 & 0x80u) != 0) {
        uint64_t v18 = a3[1];
      }
      uint64_t v20 = (uint64_t)v19 - 1;
      while (v18)
      {
        int v21 = *(unsigned __int8 *)(v20 + v18--);
        if (v21 != 10) {
          goto LABEL_41;
        }
      }
      uint64_t v18 = -1;
LABEL_41:
      std::string::erase((std::string *)a3, v18 + 1, 0xFFFFFFFFFFFFFFFFLL);
      if (*((unsigned char *)v49 + 1044))
      {
        std::string::basic_string[abi:ne180100]<0>(&v51, ":");
        v22 = std::string::insert(&v51, 0, (const std::string::value_type *)v49 + 1044);
        long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
        input.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
        *(_OWORD *)&input.__r_.__value_.__l.__data_ = v23;
        v22->__r_.__value_.__l.__size_ = 0;
        v22->__r_.__value_.__r.__words[2] = 0;
        v22->__r_.__value_.__r.__words[0] = 0;
        std::to_string(&v54, *((_DWORD *)v49 + 511));
        if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          long long v24 = &v54;
        }
        else {
          long long v24 = (std::string *)v54.__r_.__value_.__r.__words[0];
        }
        if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v54.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v54.__r_.__value_.__l.__size_;
        }
        v26 = std::string::append(&input, (const std::string::value_type *)v24, size);
        std::string::size_type v27 = v26->__r_.__value_.__r.__words[0];
        v55[0] = v26->__r_.__value_.__l.__size_;
        *(void *)((char *)v55 + 7) = *(std::string::size_type *)((char *)&v26->__r_.__value_.__r.__words[1] + 7);
        char v28 = HIBYTE(v26->__r_.__value_.__r.__words[2]);
        v26->__r_.__value_.__l.__size_ = 0;
        v26->__r_.__value_.__r.__words[2] = 0;
        v26->__r_.__value_.__r.__words[0] = 0;
        if (*((char *)a3 + 47) < 0) {
          operator delete((void *)a3[3]);
        }
        uint64_t v29 = v55[0];
        a3[3] = v27;
        a3[4] = v29;
        *(uint64_t *)((char *)a3 + 39) = *(void *)((char *)v55 + 7);
        *((unsigned char *)a3 + 47) = v28;
        if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v54.__r_.__value_.__l.__data_);
        }
        mach_port_t v10 = v49;
        if (SHIBYTE(input.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(input.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v51.__r_.__value_.__l.__data_);
        }
      }
      v30 = a3 + 7;
      std::vector<IOACIPCTraceCodeAttachment>::__clear[abi:ne180100](a3 + 7);
      std::string::size_type v31 = *((unsigned int *)v10 + 8);
      if (v31)
      {
        v32 = (char *)operator new(0x118uLL);
        std::string::size_type v33 = 0;
        BOOL v9 = 0;
        *((void *)v32 + 1) = 0;
        *((void *)v32 + 2) = 0;
        *(void *)v32 = &unk_26EB1C978;
        *(_OWORD *)(v32 + 24) = 0u;
        *(_OWORD *)(v32 + 40) = 0u;
        *(_OWORD *)(v32 + 56) = 0u;
        *(_OWORD *)(v32 + 72) = 0u;
        *(_OWORD *)(v32 + 88) = 0u;
        *(_OWORD *)(v32 + 104) = 0u;
        *(_OWORD *)(v32 + 120) = 0u;
        *(_OWORD *)(v32 + 136) = 0u;
        *(_OWORD *)(v32 + 152) = 0u;
        *(_OWORD *)(v32 + 168) = 0u;
        *(_OWORD *)(v32 + 184) = 0u;
        *(_OWORD *)(v32 + 200) = 0u;
        *(_OWORD *)(v32 + 216) = 0u;
        *(_OWORD *)(v32 + 232) = 0u;
        *(_OWORD *)(v32 + 248) = 0u;
        size_t v53 = 256;
        *(_OWORD *)(v32 + 264) = 0u;
        while (1)
        {
          v54.__r_.__value_.__r.__words[0] = v50;
          v54.__r_.__value_.__l.__size_ = v33;
          if (IOConnectCallMethod(*(_DWORD *)(a1 + 76), 5u, (const uint64_t *)&v54, 2u, 0, 0, 0, 0, v32 + 24, &v53))
          {
            break;
          }
          std::string::basic_string[abi:ne180100]<0>(&v51, v32 + 28);
          int v52 = *((_DWORD *)v32 + 67);
          unint64_t v34 = a3[8];
          unint64_t v35 = a3[9];
          if (v34 >= v35)
          {
            uint64_t v37 = (uint64_t)(v34 - *v30) >> 5;
            unint64_t v38 = v37 + 1;
            if ((unint64_t)(v37 + 1) >> 59) {
              std::vector<IOACIPCTraceCodeAttachment>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v39 = v35 - *v30;
            if (v39 >> 4 > v38) {
              unint64_t v38 = v39 >> 4;
            }
            if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v40 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v40 = v38;
            }
            v58 = a3 + 9;
            v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<IOACIPCTraceCodeAttachment>>((uint64_t)(a3 + 9), v40);
            std::string::size_type v42 = (std::string::size_type)&v41[32 * v37];
            input.__r_.__value_.__r.__words[0] = (std::string::size_type)v41;
            input.__r_.__value_.__l.__size_ = v42;
            v57 = &v41[32 * v43];
            long long v44 = *(_OWORD *)&v51.__r_.__value_.__l.__data_;
            *(void *)(v42 + 16) = *((void *)&v51.__r_.__value_.__l + 2);
            *(_OWORD *)std::string::size_type v42 = v44;
            memset(&v51, 0, sizeof(v51));
            *(_DWORD *)(v42 + 24) = v52;
            input.__r_.__value_.__r.__words[2] = v42 + 32;
            std::vector<IOACIPCTraceCodeAttachment>::__swap_out_circular_buffer(a3 + 7, &input);
            uint64_t v45 = a3[8];
            std::__split_buffer<IOACIPCTraceCodeAttachment>::~__split_buffer((uint64_t)&input);
            int v46 = SHIBYTE(v51.__r_.__value_.__r.__words[2]);
            a3[8] = v45;
            if (v46 < 0) {
              operator delete(v51.__r_.__value_.__l.__data_);
            }
          }
          else
          {
            long long v36 = *(_OWORD *)&v51.__r_.__value_.__l.__data_;
            *(void *)(v34 + 16) = *((void *)&v51.__r_.__value_.__l + 2);
            *(_OWORD *)unint64_t v34 = v36;
            memset(&v51, 0, sizeof(v51));
            *(_DWORD *)(v34 + 24) = v52;
            a3[8] = v34 + 32;
          }
          BOOL v9 = ++v33 >= v31;
          if (v31 == v33)
          {
            pthread_mutex_unlock(v48);
            BOOL v9 = 1;
            goto LABEL_73;
          }
        }
        pthread_mutex_unlock(v48);
LABEL_73:
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v32);
      }
      else
      {
        pthread_mutex_unlock(v48);
        BOOL v9 = 1;
      }
    }
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v49);
  }
  else
  {
    if (*(_DWORD *)a1 >= 2u) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOACIPCTraceClass::%s: no connection\n", "getTraceCode");
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    return 0;
  }
  return v9;
}

void sub_238190584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  _Unwind_Resume(a1);
}

_DWORD *IOACIPCTraceClass::setLogLevel(_DWORD *this, int a2)
{
  *this = a2;
  return this;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__shared_ptr_emplace<IOAppleConvergedIPCTraceRegistryTracePoint>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26EB1C928;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<IOAppleConvergedIPCTraceRegistryTracePoint>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26EB1C928;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x23EC89ED0);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    mach_port_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    mach_port_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264D08980, MEMORY[0x263F8C060]);
}

void sub_238190874(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::vector<IOACIPCTraceCodeAttachment>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0) {
      operator delete(*(void **)(i - 32));
    }
  }
  a1[1] = v2;
}

void std::__shared_ptr_emplace<IOAppleConvergedIPCTraceRegistryAttachment>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26EB1C978;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<IOAppleConvergedIPCTraceRegistryAttachment>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26EB1C978;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x23EC89ED0);
}

uint64_t std::vector<IOACIPCTraceCodeAttachment>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<IOACIPCTraceCodeAttachment>,std::reverse_iterator<IOACIPCTraceCodeAttachment*>,std::reverse_iterator<IOACIPCTraceCodeAttachment*>,std::reverse_iterator<IOACIPCTraceCodeAttachment*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void std::vector<IOACIPCTraceCodeAttachment>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<IOACIPCTraceCodeAttachment>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<IOACIPCTraceCodeAttachment>,std::reverse_iterator<IOACIPCTraceCodeAttachment*>,std::reverse_iterator<IOACIPCTraceCodeAttachment*>,std::reverse_iterator<IOACIPCTraceCodeAttachment*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = a7;
    do
    {
      long long v9 = *(_OWORD *)(a3 - 32);
      *(void *)(v8 - 16) = *(void *)(a3 - 16);
      *(_OWORD *)(v8 - 32) = v9;
      *(void *)(a3 - 24) = 0;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 32) = 0;
      *(_DWORD *)(v8 - 8) = *(_DWORD *)(a3 - 8);
      v8 -= 32;
      v7 -= 32;
      a3 -= 32;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v8;
    uint64_t v10 = v15;
  }
  LOBYTE(v13) = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<IOACIPCTraceCodeAttachment>,std::reverse_iterator<IOACIPCTraceCodeAttachment*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<IOACIPCTraceCodeAttachment>,std::reverse_iterator<IOACIPCTraceCodeAttachment*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<IOACIPCTraceCodeAttachment>,std::reverse_iterator<IOACIPCTraceCodeAttachment*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<IOACIPCTraceCodeAttachment>,std::reverse_iterator<IOACIPCTraceCodeAttachment*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 32;
  }
}

uint64_t std::__split_buffer<IOACIPCTraceCodeAttachment>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<IOACIPCTraceCodeAttachment>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 4;
      *(void *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void IOACIPCControlClass::IOACIPCControlClass(IOACIPCControlClass *this)
{
  *(void *)this = &unk_26EB1C9C8;
  *((_DWORD *)this + 2) = 1;
  *((_DWORD *)this + 20) = 0;
  *((void *)this + 20) = 0;
  *((_DWORD *)this + 42) = 0;
  *((unsigned char *)this + 172) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *((_DWORD *)this + 38) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
}

{
  *(void *)this = &unk_26EB1C9C8;
  *((_DWORD *)this + 2) = 1;
  *((_DWORD *)this + 20) = 0;
  *((void *)this + 20) = 0;
  *((_DWORD *)this + 42) = 0;
  *((unsigned char *)this + 172) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *((_DWORD *)this + 38) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
}

void IOACIPCControlClass::~IOACIPCControlClass(IOACIPCControlClass *this)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void (**)(IOACIPCControlClass *))&unk_26EB1C9C8;
  *(void *)this = &unk_26EB1C9C8;
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    size_t v4 = "~IOACIPCControlClass";
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: \n", (uint8_t *)&v3, 0xCu);
    uint64_t v2 = *(void (***)(IOACIPCControlClass *))this;
  }
  v2[3](this);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 16));
}

{
  uint64_t vars8;

  IOACIPCControlClass::~IOACIPCControlClass(this);

  JUMPOUT(0x23EC89ED0);
}

void sub_238190E14(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t IOACIPCControlClass::lock(IOACIPCControlClass *this)
{
  return pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
}

uint64_t IOACIPCControlClass::unlock(IOACIPCControlClass *this)
{
  return pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
}

BOOL IOACIPCControlClass::start(IOACIPCControlClass *this, const __CFDictionary *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  size_t v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*((_DWORD *)this + 20))
  {
    BOOL v5 = 1;
  }
  else
  {
    CFRetain(a2);
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], a2);
    BOOL v5 = MatchingService != 0;
    if (!MatchingService
      && (*((unsigned char *)this + 8) & 2) != 0
      && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      long long v9 = "start";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: could not get matching service\n", (uint8_t *)&v8, 0xCu);
    }
    *((_DWORD *)this + 20) = MatchingService;
  }
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    long long v9 = "start";
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: --done\n", (uint8_t *)&v8, 0xCu);
  }
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOACIPCControlClass::stop(IOACIPCControlClass *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "stop";
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: \n", (uint8_t *)&v5, 0xCu);
  }
  IOACIPCControlClass::close_nl(this);
  IOACIPCControlClass::deregisterEventNotification_nl(this, 0);
  io_object_t v3 = *((_DWORD *)this + 20);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 20) = 0;
  }
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "stop";
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: --done\n", (uint8_t *)&v5, 0xCu);
  }
  pthread_mutex_unlock(v2);
  return 1;
}

uint64_t IOACIPCControlClass::close_nl(IOACIPCControlClass *this)
{
  if (!*((unsigned char *)this + 172)) {
    return 0;
  }
  *((unsigned char *)this + 172) = 0;
  uint64_t v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 42), 1u, 0, 0, 0, 0);
  io_connect_t v3 = *((_DWORD *)this + 42);
  if (v3)
  {
    IOServiceClose(v3);
    *((_DWORD *)this + 42) = 0;
  }
  IOACIPCControlClass::clearNotificationPort(this);
  size_t v4 = (const void *)*((void *)this + 11);
  if (v4)
  {
    CFRelease(v4);
    *((void *)this + 11) = 0;
  }
  int v5 = *((void *)this + 12);
  if (v5)
  {
    dispatch_release(v5);
    *((void *)this + 12) = 0;
  }
  return v2;
}

void IOACIPCControlClass::deregisterEventNotification_nl(IOACIPCControlClass *this, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v13 = "deregisterEventNotification_nl";
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: +\n", buf, 0xCu);
  }
  if (*((void *)this + 15) || *((void *)this + 16))
  {
    IOObjectRelease(*((_DWORD *)this + 38));
    *((_DWORD *)this + 38) = 0;
    IOACIPCControlClass::clearEventNotificationPort(this);
    if (*((void *)this + 15))
    {
      CFRunLoopRef Current = CFRunLoopGetCurrent();
      if (Current == *((CFRunLoopRef *)this + 15))
      {
        if (*((void *)this + 20))
        {
          _Block_release(*((const void **)this + 20));
          *((void *)this + 20) = 0;
          CFRunLoopRef Current = (CFRunLoopRef)*((void *)this + 15);
        }
        if (Current)
        {
          CFRelease(Current);
          *((void *)this + 15) = 0;
        }
        goto LABEL_25;
      }
    }
    int v5 = a2;
    if (!a2)
    {
      if (*((void *)this + 16))
      {
        char v6 = 0;
        int v5 = 0;
        goto LABEL_12;
      }
      int v5 = dispatch_group_create();
      if (!v5)
      {
        char v6 = 0;
        goto LABEL_12;
      }
    }
    dispatch_retain(v5);
    dispatch_group_enter(v5);
    char v6 = 1;
LABEL_12:
    uint64_t v7 = *((void *)this + 20);
    *((void *)this + 20) = 0;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 0x40000000;
    v11[2] = ___ZN19IOACIPCControlClass30deregisterEventNotification_nlEP16dispatch_group_s_block_invoke;
    v11[3] = &unk_264D08A20;
    v11[4] = v7;
    v11[5] = v5;
    int v8 = (__CFRunLoop *)*((void *)this + 15);
    if (v8)
    {
      if (*((void *)this + 16)) {
        IOACIPCControlClass::deregisterEventNotification_nl();
      }
      CFRunLoopPerformBlock(v8, (CFTypeRef)*MEMORY[0x263EFFE88], v11);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 15));
      CFRelease(*((CFTypeRef *)this + 15));
      *((void *)this + 15) = 0;
    }
    long long v9 = *((void *)this + 16);
    if (v9)
    {
      dispatch_async(v9, v11);
      dispatch_release(*((dispatch_object_t *)this + 16));
      *((void *)this + 16) = 0;
    }
    char v10 = v6 ^ 1;
    if (a2) {
      char v10 = 1;
    }
    if ((v10 & 1) == 0)
    {
      pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
      dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v5);
      pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
    }
LABEL_25:
    if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v13 = "deregisterEventNotification_nl";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: -\n", buf, 0xCu);
    }
  }
}

void IOACIPCControlClass::setNotificationPort(IOACIPCControlClass *this)
{
  if (!*((void *)this + 13))
  {
    uint64_t v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    *((void *)this + 13) = v2;
    if (!v2) {
      IOACIPCControlClass::setNotificationPort();
    }
    if (*((void *)this + 11))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v2);
      *((void *)this + 14) = RunLoopSource;
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 11), RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    }
    size_t v4 = *((void *)this + 12);
    if (v4)
    {
      int v5 = (IONotificationPort *)*((void *)this + 13);
      IONotificationPortSetDispatchQueue(v5, v4);
    }
  }
}

void IOACIPCControlClass::clearNotificationPort(IOACIPCControlClass *this)
{
  io_connect_t v3 = (void *)((char *)this + 104);
  uint64_t v2 = (IONotificationPort *)*((void *)this + 13);
  if (v2)
  {
    if (*((void *)this + 11))
    {
      CFRunLoopRemoveSource(*((CFRunLoopRef *)this + 11), *((CFRunLoopSourceRef *)this + 14), (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      uint64_t v2 = (IONotificationPort *)*((void *)this + 13);
    }
    IONotificationPortDestroy(v2);
    *io_connect_t v3 = 0;
    v3[1] = 0;
  }
}

void IOACIPCControlClass::setEventNotificationPort(IOACIPCControlClass *this)
{
  if (!*((void *)this + 17))
  {
    uint64_t v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    *((void *)this + 17) = v2;
    if (!v2) {
      IOACIPCControlClass::setEventNotificationPort();
    }
    if (*((void *)this + 15))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v2);
      *((void *)this + 18) = RunLoopSource;
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 15), RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    }
    size_t v4 = *((void *)this + 16);
    if (v4)
    {
      int v5 = (IONotificationPort *)*((void *)this + 17);
      IONotificationPortSetDispatchQueue(v5, v4);
    }
  }
}

void IOACIPCControlClass::clearEventNotificationPort(IOACIPCControlClass *this)
{
  uint64_t v2 = (void *)((char *)this + 136);
  uint64_t v1 = *((void *)this + 17);
  if (v1)
  {
    size_t v4 = (__CFRunLoop *)*((void *)this + 15);
    uint64_t v5 = *((void *)this + 18);
    uint64_t v6 = MEMORY[0x263EF8330];
    void *v2 = 0;
    v2[1] = 0;
    block[0] = v6;
    block[1] = 0x40000000;
    block[2] = ___ZN19IOACIPCControlClass26clearEventNotificationPortEv_block_invoke;
    block[3] = &__block_descriptor_tmp;
    block[4] = v4;
    block[5] = v5;
    block[6] = v1;
    if (v4)
    {
      if (*((void *)this + 16)) {
        IOACIPCControlClass::clearEventNotificationPort();
      }
      CFRunLoopPerformBlock(v4, (CFTypeRef)*MEMORY[0x263EFFE88], block);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 15));
    }
    uint64_t v7 = *((void *)this + 16);
    if (v7)
    {
      if (*((void *)this + 15)) {
        IOACIPCControlClass::clearEventNotificationPort();
      }
      dispatch_async(v7, block);
    }
  }
}

void ___ZN19IOACIPCControlClass26clearEventNotificationPortEv_block_invoke(__CFRunLoop **a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    CFRunLoopRemoveSource(v2, a1[5], (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  }
  io_connect_t v3 = a1[6];

  IONotificationPortDestroy(v3);
}

uint64_t IOACIPCControlClass::open(IOACIPCControlClass *this, __CFRunLoop *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  size_t v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "open";
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: \n", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = IOACIPCControlClass::open_nl(this, a2, 0);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOACIPCControlClass::open_nl(IOACIPCControlClass *this, __CFRunLoop *a2, NSObject *a3)
{
  uint64_t result = 0;
  uint32_t outputCnt = 0;
  uint64_t v8 = 0;
  if (!*((unsigned char *)this + 172))
  {
    io_service_t v5 = *((_DWORD *)this + 20);
    if (v5)
    {
      uint64_t result = IOServiceOpen(v5, *MEMORY[0x263EF8960], 0, (io_connect_t *)this + 42);
      if (!result)
      {
        uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 42), 0, &v8, 1u, 0, &outputCnt);
        if (!result)
        {
          *((unsigned char *)this + 172) = 1;
          if (a2)
          {
            if (a3) {
              IOACIPCControlClass::open_nl();
            }
            *((void *)this + 11) = a2;
            CFRetain(a2);
          }
          else if (a3)
          {
            *((void *)this + 12) = a3;
            dispatch_retain(a3);
          }
          IOACIPCControlClass::setNotificationPort(this);
          return 0;
        }
      }
    }
    else
    {
      return 3758096385;
    }
  }
  return result;
}

uint64_t IOACIPCControlClass::open(IOACIPCControlClass *this, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  size_t v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "open";
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: \n", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = IOACIPCControlClass::open_nl(this, 0, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOACIPCControlClass::close(IOACIPCControlClass *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "close";
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: \n", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = IOACIPCControlClass::close_nl(this);
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t IOACIPCControlClass::readLogsAsync(IOACIPCControlClass *this, void *a2, unsigned int a3, unsigned int a4, void (*a5)(void *, int, void *), void *a6)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v23 = v12;
  long long v24 = v12;
  *(_OWORD *)reference = v12;
  long long v22 = v12;
  unint64_t v13 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 4) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "readLogsAsync";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a2;
    *(_WORD *)&buf[22] = 1024;
    unsigned int v20 = a3;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: buff %p, size %u\n", buf, 0x1Cu);
  }
  uint64_t v14 = (IONotificationPort *)*((void *)this + 13);
  if (v14)
  {
    *(void *)buf = a2;
    *(void *)&buf[8] = a3;
    *(void *)&buf[16] = a4;
    reference[1] = (uint64_t)a5;
    *(void *)&long long v22 = a6;
    mach_port_t v15 = *((_DWORD *)this + 42);
    mach_port_t MachPort = IONotificationPortGetMachPort(v14);
    uint64_t v17 = IOConnectCallAsyncScalarMethod(v15, 2u, MachPort, reference, 3u, (const uint64_t *)buf, 3u, 0, 0);
  }
  else
  {
    uint64_t v17 = 3758097112;
    if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "readLogsAsync";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock(v13);
  return v17;
}

uint64_t IOACIPCControlClass::triggerTrap(IOACIPCControlClass *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  uint64_t v3 = IOConnectCallScalarMethod(*((_DWORD *)this + 42), 4u, 0, 0, 0, 0);
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t IOACIPCControlClass::collectSnapshotAsync(IOACIPCControlClass *this, void *a2, unsigned int a3, void (*a4)(void *, int, void *), void *a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v22 = v10;
  long long v23 = v10;
  *(_OWORD *)reference = v10;
  long long v21 = v10;
  uint64_t v11 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "collectSnapshotAsync";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a2;
    __int16 v18 = 1024;
    unsigned int v19 = a3;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: buff %p, size %u\n", buf, 0x1Cu);
  }
  long long v12 = (IONotificationPort *)*((void *)this + 13);
  if (v12)
  {
    *(void *)buf = a2;
    *(void *)&buf[8] = a3;
    reference[1] = (uint64_t)a4;
    *(void *)&long long v21 = a5;
    mach_port_t v13 = *((_DWORD *)this + 42);
    mach_port_t MachPort = IONotificationPortGetMachPort(v12);
    uint64_t v15 = IOConnectCallAsyncScalarMethod(v13, 5u, MachPort, reference, 3u, (const uint64_t *)buf, 2u, 0, 0);
  }
  else
  {
    uint64_t v15 = 3758097112;
    if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "collectSnapshotAsync";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock(v11);
  return v15;
}

uint64_t IOACIPCControlClass::registerEventNotification(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v7 = IOACIPCControlClass::registerEventNotification_nl(a1, a2, 0, a3);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t IOACIPCControlClass::registerEventNotification_nl(uint64_t a1, const void *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 80))
  {
    if (*(void *)(a1 + 160))
    {
      uint64_t v5 = 3758097093;
      if ((*(unsigned char *)(a1 + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v11 = "registerEventNotification_nl";
        _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: a notification block is already registered. deregister it before registering a new block", buf, 0xCu);
        return 3758097093;
      }
    }
    else if (a4)
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 0x40000000;
      aBlock[2] = ___ZN19IOACIPCControlClass28registerEventNotification_nlEP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjPvS4_E_block_invoke;
      aBlock[3] = &unk_264D089F8;
      aBlock[4] = a4;
      *(void *)(a1 + 160) = _Block_copy(aBlock);
      if (a2)
      {
        if (a3) {
          IOACIPCControlClass::registerEventNotification_nl();
        }
        *(void *)(a1 + 120) = a2;
        CFRetain(a2);
      }
      else if (a3)
      {
        *(void *)(a1 + 128) = a3;
        dispatch_retain(a3);
      }
      IOACIPCControlClass::setEventNotificationPort((IOACIPCControlClass *)a1);
      uint64_t v5 = IOServiceAddInterestNotification(*(IONotificationPortRef *)(a1 + 136), *(_DWORD *)(a1 + 80), "IOGeneralInterest", (IOServiceInterestCallback)IOACIPCControlClass::generalInterestCallback, *(void **)(a1 + 160), (io_object_t *)(a1 + 152));
      if (v5)
      {
        if ((*(unsigned char *)(a1 + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v11 = "registerEventNotification_nl";
          __int16 v12 = 1024;
          int v13 = v5;
          _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: could not add interest notification on service: %#x\n", buf, 0x12u);
        }
        _Block_release(*(const void **)(a1 + 160));
        *(void *)(a1 + 160) = 0;
        return 3758097084;
      }
    }
    else
    {
      uint64_t v5 = 3758097090;
      if ((*(unsigned char *)(a1 + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v11 = "registerEventNotification_nl";
        _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: block must be provided\n", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v5 = 3758097136;
    if ((*(unsigned char *)(a1 + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v11 = "registerEventNotification_nl";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: service is NULL - must successfully start() first\n", buf, 0xCu);
      return 3758097136;
    }
  }
  return v5;
}

uint64_t IOACIPCControlClass::registerEventNotification(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v7 = IOACIPCControlClass::registerEventNotification_nl(a1, 0, a2, a3);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t ___ZN19IOACIPCControlClass28registerEventNotification_nlEP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjPvS4_E_block_invoke(uint64_t result, uint64_t a2, int a3, unsigned int *a4)
{
  if (a3 == -469794560 && a4 != 0)
  {
    uint64_t result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *a4, *((void *)a4 + 1), *((void *)a4 + 2));
    }
  }
  return result;
}

void IOACIPCControlClass::generalInterestCallback(IOACIPCControlClass *this, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  _Block_copy(this);
  (*((void (**)(IOACIPCControlClass *, void *, uint64_t, uint64_t))this + 2))(this, a2, a3, a4);

  _Block_release(this);
}

uint64_t IOACIPCControlClass::deregisterEventNotification(IOACIPCControlClass *this, NSObject *a2)
{
  size_t v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  IOACIPCControlClass::deregisterEventNotification_nl(this, a2);

  return pthread_mutex_unlock(v4);
}

void ___ZN19IOACIPCControlClass30deregisterEventNotification_nlEP16dispatch_group_s_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 32);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = *(NSObject **)(a1 + 40);
  if (v3)
  {
    dispatch_group_leave(v3);
    size_t v4 = *(NSObject **)(a1 + 40);
    dispatch_release(v4);
  }
}

BOOL IOACIPCControlClass::getLogInternalBufferSize(IOACIPCControlClass *this, unsigned int *a2)
{
  BOOL v2 = 0;
  if (a2)
  {
    io_registry_entry_t v3 = *((_DWORD *)this + 20);
    if (v3)
    {
      CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, @"currentLogSnapshotBufferSize", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
      if (CFProperty)
      {
        CFNumberRef v6 = CFProperty;
        BOOL v2 = CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2) != 0;
        CFRelease(v6);
      }
      else
      {
        return 0;
      }
    }
  }
  return v2;
}

uint64_t IOACIPCControlClass::loggerTune(IOACIPCControlClass *this, unsigned int a2, unsigned int a3, void *a4, void *a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v10 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 4) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v13 = 136316162;
    *(void *)&v13[4] = "loggerTune";
    *(_WORD *)&v13[12] = 1024;
    *(_DWORD *)&v13[14] = a2;
    *(_WORD *)&v13[18] = 1024;
    *(_DWORD *)&v13[20] = a3;
    *(_WORD *)uint64_t v14 = 2048;
    *(void *)&v14[2] = a4;
    __int16 v15 = 2048;
    uint64_t v16 = a5;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCControlClass::%s: subsystem %u, index %u, arg1 %p, arg2 %p\n", v13, 0x2Cu);
  }
  *(void *)int v13 = a2;
  *(void *)&v13[8] = a3;
  *(void *)&v13[16] = a4;
  *(void *)uint64_t v14 = a5;
  uint64_t v11 = IOConnectCallScalarMethod(*((_DWORD *)this + 42), 3u, (const uint64_t *)v13, 4u, 0, 0);
  pthread_mutex_unlock(v10);
  return v11;
}

BOOL IOACIPCControlClass::getLastKnownBootStage(IOACIPCControlClass *this, unsigned int *a2)
{
  BOOL v2 = 0;
  if (a2)
  {
    io_registry_entry_t v3 = *((_DWORD *)this + 20);
    if (v3)
    {
      CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, @"bootstage", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
      if (CFProperty)
      {
        CFNumberRef v6 = CFProperty;
        BOOL v2 = CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2) != 0;
        CFRelease(v6);
      }
      else
      {
        return 0;
      }
    }
  }
  return v2;
}

const char *getACIPCErrorTypeString(unsigned int a1)
{
  if (a1 > 0x37) {
    return "invalid";
  }
  else {
    return acipcErrorTypeStrings[a1];
  }
}

const char *getACIPCDirectionString(unsigned int a1)
{
  if (a1 > 2) {
    return "invalid";
  }
  else {
    return acipcDirectionStrings[a1];
  }
}

const char *getACIPCLinkStateString(unsigned int a1)
{
  if (a1 > 4) {
    return "invalid";
  }
  else {
    return acipcLinkStateStrings[a1];
  }
}

const char *getACIPCAERErrorTypeString(unsigned int a1)
{
  if (a1 > 2) {
    return "invalid";
  }
  else {
    return acipcAERErrorTypeStrings[a1];
  }
}

void IOACIPCClass::IOACIPCClass(IOACIPCClass *this)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(void *)this = &unk_26EB1CA68;
  *((_DWORD *)this + 2) = 1;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_DWORD *)this + 36) = 0;
  *((void *)this + 20) = 0;
  *((void *)this + 21) = 0;
  *((void *)this + 19) = 0;
  *((unsigned char *)this + 176) = 0;
  v2.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(void *)v2.__opaque = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutexattr_init(&v2);
  pthread_mutexattr_settype(&v2, 2);
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), &v2);
}

void IOACIPCClass::~IOACIPCClass(IOACIPCClass *this)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  pthread_mutexattr_t v2 = (void (**)(IOACIPCClass *, void))&unk_26EB1CA68;
  *(void *)this = &unk_26EB1CA68;
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    size_t v4 = "~IOACIPCClass";
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: \n", (uint8_t *)&v3, 0xCu);
    pthread_mutexattr_t v2 = *(void (***)(IOACIPCClass *, void))this;
  }
  v2[4](this, 0);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 16));
}

{
  uint64_t vars8;

  IOACIPCClass::~IOACIPCClass(this);

  JUMPOUT(0x23EC89ED0);
}

void sub_238192814(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t IOACIPCClass::apiAdapter(IOACIPCClass *this, uint64_t a2)
{
  return a2;
}

uint64_t IOACIPCClass::lock(IOACIPCClass *this)
{
  return pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
}

uint64_t IOACIPCClass::unlock(IOACIPCClass *this)
{
  return pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
}

uint64_t IOACIPCClass::start(uint64_t a1, const void *a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __int16 v12 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t started = IOACIPCClass::start_nl(a1, a2, a3, 0, a4, a5, a6);
  pthread_mutex_unlock(v12);
  return started;
}

uint64_t IOACIPCClass::start_nl(uint64_t a1, const void *a2, CFTypeRef cf, dispatch_object_t object, uint64_t a5, uint64_t a6, uint64_t a7)
{
  kern_return_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  io_object_t v21;
  __CFRunLoop *v22;
  NSObject *v23;
  io_object_t *v24;
  kern_return_t v25;
  io_object_t v27;
  __CFRunLoop *v28;
  NSObject *v29;
  const char *v30;
  int v31;
  const char *v32;
  int v33;
  void v34[5];
  io_object_t v35;
  void v36[5];
  void block[5];
  io_object_t v38;
  void v39[5];
  void v40[5];
  void v41[5];
  void aBlock[6];
  void v43[6];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  kern_return_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x263EF8340];
  uint64_t v14 = *(const void **)(a1 + 80);
  if (v14) {
    CFRelease(v14);
  }
  __int16 v15 = *(NSObject **)(a1 + 88);
  if (v15) {
    dispatch_release(v15);
  }
  if (cf)
  {
    if (object) {
      IOACIPCClass::start_nl();
    }
    *(void *)(a1 + 80) = cf;
    CFRetain(cf);
  }
  else if (object)
  {
    *(void *)(a1 + 88) = object;
    dispatch_retain(object);
  }
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3002000000;
  v43[3] = __Block_byref_object_copy_;
  v43[4] = __Block_byref_object_dispose_;
  v43[5] = 0xAAAAAA0000000000;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke;
  aBlock[3] = &unk_264D08C60;
  aBlock[4] = v43;
  void aBlock[5] = a1;
  *(void *)(a1 + 152) = _Block_copy(aBlock);
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 0x40000000;
  v41[2] = ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_2;
  v41[3] = &unk_264D08C88;
  v41[4] = v43;
  *(void *)(a1 + 160) = _Block_copy(v41);
  if (a7)
  {
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 0x40000000;
    v40[2] = ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_3;
    v40[3] = &unk_264D08CB0;
    v40[4] = a7;
    *(void *)(a1 + 136) = _Block_copy(v40);
  }
  IOACIPCClass::setNotificationPort((IOACIPCClass *)a1);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 0x40000000;
  v39[2] = ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_4;
  v39[3] = &unk_264D08CD8;
  v39[4] = a5;
  *(void *)(a1 + 120) = _Block_copy(v39);
  CFRetain(a2);
  uint64_t v16 = (io_object_t *)(a1 + 112);
  uint64_t v17 = IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 96), "IOServiceFirstMatch", (CFDictionaryRef)a2, (IOServiceMatchingCallback)IOACIPCClass::interfaceMatched, *(void **)(a1 + 120), (io_iterator_t *)(a1 + 112));
  if (v17)
  {
    if ((*(unsigned char *)(a1 + 8) & 2) != 0)
    {
      __int16 v18 = 0;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v45 = "start_nl";
        int v46 = 1024;
        v47 = v17;
        unsigned int v19 = MEMORY[0x263EF8438];
        unsigned int v20 = "IOACIPCClass::%s: IOServiceAddMatchingNotification (kIOFirstMatchNotification) failed, ret = 0x%08x";
LABEL_26:
        _os_log_impl(&dword_23818E000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x12u);
        goto LABEL_27;
      }
      goto LABEL_28;
    }
LABEL_27:
    __int16 v18 = 0;
    goto LABEL_28;
  }
  long long v21 = *v16;
  IOObjectRetain(*v16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_5;
  block[3] = &unk_264D08D00;
  block[4] = v39;
  unint64_t v38 = v21;
  long long v22 = *(__CFRunLoop **)(a1 + 80);
  if (v22)
  {
    if (*(void *)(a1 + 88))
    {
      v30 = "!fQueue";
      std::string::size_type v31 = 283;
      goto LABEL_42;
    }
    CFRunLoopPerformBlock(v22, (CFTypeRef)*MEMORY[0x263EFFE88], block);
    CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 80));
  }
  long long v23 = *(NSObject **)(a1 + 88);
  if (!v23) {
    goto LABEL_22;
  }
  if (*(void *)(a1 + 80))
  {
    v30 = "!fRunLoopRef";
    std::string::size_type v31 = 289;
LABEL_42:
    __assert_rtn("start_nl", "IOACIPCClass.cpp", v31, v30);
  }
  dispatch_async(v23, block);
LABEL_22:
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 0x40000000;
  v36[2] = ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_15;
  v36[3] = &unk_264D08D28;
  v36[4] = a6;
  *(void *)(a1 + 128) = _Block_copy(v36);
  CFRetain(a2);
  uint64_t v24 = (io_object_t *)(a1 + 116);
  uint64_t v25 = IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 96), "IOServiceTerminate", (CFDictionaryRef)a2, (IOServiceMatchingCallback)IOACIPCClass::interfaceMatched, *(void **)(a1 + 128), (io_iterator_t *)(a1 + 116));
  if (!v25)
  {
    std::string::size_type v27 = *v24;
    IOObjectRetain(*v24);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 0x40000000;
    v34[2] = ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_2_18;
    v34[3] = &unk_264D08D50;
    v34[4] = v36;
    unint64_t v35 = v27;
    char v28 = *(__CFRunLoop **)(a1 + 80);
    if (v28)
    {
      if (*(void *)(a1 + 88))
      {
        v32 = "!fQueue";
        std::string::size_type v33 = 340;
        goto LABEL_45;
      }
      CFRunLoopPerformBlock(v28, (CFTypeRef)*MEMORY[0x263EFFE88], v34);
      CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 80));
    }
    uint64_t v29 = *(NSObject **)(a1 + 88);
    if (!v29)
    {
LABEL_38:
      __int16 v18 = 1;
      goto LABEL_28;
    }
    if (!*(void *)(a1 + 80))
    {
      dispatch_async(v29, v34);
      goto LABEL_38;
    }
    v32 = "!fRunLoopRef";
    std::string::size_type v33 = 346;
LABEL_45:
    __assert_rtn("start_nl", "IOACIPCClass.cpp", v33, v32);
  }
  if ((*(unsigned char *)(a1 + 8) & 2) == 0) {
    goto LABEL_27;
  }
  __int16 v18 = 0;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v45 = "start_nl";
    int v46 = 1024;
    v47 = v25;
    unsigned int v19 = MEMORY[0x263EF8438];
    unsigned int v20 = "IOACIPCClass::%s: IOServiceAddMatchingNotification (kIOTerminatedNotification) failed, ret = 0x%08x";
    goto LABEL_26;
  }
LABEL_28:
  if ((*(unsigned char *)(a1 + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v45 = "start_nl";
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: --done\n", buf, 0xCu);
  }
  _Block_object_dispose(v43, 8);
  return v18;
}

void sub_238192F08(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t IOACIPCClass::start(uint64_t a1, const void *a2, NSObject *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __int16 v12 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t started = IOACIPCClass::start_nl(a1, a2, 0, a3, a4, a5, a6);
  pthread_mutex_unlock(v12);
  return started;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 40);
  *(unsigned char *)(result + 44) = *(unsigned char *)(a2 + 44);
  *(_DWORD *)(result + 40) = v2;
  return result;
}

void ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(os_unfair_lock_s **)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v8 + 44))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 40));
  }
  else
  {
    uint64_t v9 = v7 + 36;
    os_unfair_lock_lock(v7 + 36);
    long long v10 = (void (**)(void, void, void))(*(uint64_t (**)(os_unfair_lock_s *, uint64_t, uint64_t))(*(void *)&v7->_os_unfair_lock_opaque + 232))(v7, a3, a4);
    os_unfair_lock_unlock(v9);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    if (v10)
    {
      v10[2](v10, a3, a4);
      _Block_release(v10);
    }
  }
}

void ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 44) = 1;
  int v2 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  os_unfair_lock_unlock(v2);
}

uint64_t ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void IOACIPCClass::setNotificationPort(IOACIPCClass *this)
{
  if (!*((void *)this + 12))
  {
    int v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    *((void *)this + 12) = v2;
    if (!v2) {
      IOACIPCClass::setNotificationPort();
    }
    if (*((void *)this + 10))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v2);
      *((void *)this + 13) = RunLoopSource;
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 10), RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    }
    size_t v4 = *((void *)this + 11);
    if (v4)
    {
      uint64_t v5 = (IONotificationPort *)*((void *)this + 12);
      IONotificationPortSetDispatchQueue(v5, v4);
    }
  }
}

uint64_t ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_4(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_object_t v5 = result;
    int v6 = 0;
    do
    {
      if (!v6) {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      io_object_t v5 = result;
      --v6;
    }
    while (result);
  }
  return result;
}

void IOACIPCClass::interfaceMatched(IOACIPCClass *this, void *a2)
{
  _Block_copy(this);
  (*((void (**)(IOACIPCClass *, void *))this + 2))(this, a2);

  _Block_release(this);
}

uint64_t ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  io_object_t v2 = *(_DWORD *)(a1 + 40);

  return IOObjectRelease(v2);
}

uint64_t ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_15(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_object_t v5 = result;
    int v6 = 0;
    do
    {
      if (!v6) {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      io_object_t v5 = result;
      --v6;
    }
    while (result);
  }
  return result;
}

uint64_t ___ZN12IOACIPCClass8start_nlEPK14__CFDictionaryP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES8_U13block_pointerFvjjiE_block_invoke_2_18(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  io_object_t v2 = *(_DWORD *)(a1 + 40);

  return IOObjectRelease(v2);
}

uint64_t IOACIPCClass::stop(IOACIPCClass *this, NSObject *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  size_t v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v20 = "stop";
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: \n", buf, 0xCu);
  }
  if (*((void *)this + 10) || *((void *)this + 11))
  {
    IOACIPCClass::close_nl(this);
    IOACIPCClass::clearIterators(this);
    IOACIPCClass::clearNotificationPort(this);
    io_object_t v5 = a2;
    if (!a2)
    {
      if (*((void *)this + 11))
      {
        char v6 = 0;
        io_object_t v5 = 0;
        goto LABEL_10;
      }
      io_object_t v5 = dispatch_group_create();
      if (!v5)
      {
        char v6 = 0;
        goto LABEL_10;
      }
    }
    dispatch_retain(v5);
    dispatch_group_enter(v5);
    char v6 = 1;
LABEL_10:
    uint64_t v7 = *((void *)this + 20);
    if (v7)
    {
      (*(void (**)(void))(v7 + 16))();
      _Block_release(*((const void **)this + 20));
      *((void *)this + 20) = 0;
    }
    uint64_t v8 = (const void *)*((void *)this + 17);
    if (v8)
    {
      _Block_release(v8);
      *((void *)this + 17) = 0;
    }
    uint64_t v9 = *((void *)this + 19);
    *((void *)this + 19) = 0;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 0x40000000;
    v15[2] = ___ZN12IOACIPCClass4stopEP16dispatch_group_s_block_invoke;
    v15[3] = &unk_264D08D78;
    long long v10 = *(_OWORD *)((char *)this + 120);
    *((void *)this + 15) = 0;
    *((void *)this + 16) = 0;
    long long v16 = v10;
    uint64_t v17 = v9;
    __int16 v18 = v5;
    uint64_t v11 = (__CFRunLoop *)*((void *)this + 10);
    if (v11)
    {
      if (*((void *)this + 11)) {
        IOACIPCClass::stop();
      }
      CFRunLoopPerformBlock(v11, (CFTypeRef)*MEMORY[0x263EFFE88], v15);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 10));
      CFRelease(*((CFTypeRef *)this + 10));
      *((void *)this + 10) = 0;
    }
    __int16 v12 = *((void *)this + 11);
    if (v12)
    {
      dispatch_async(v12, v15);
      dispatch_release(*((dispatch_object_t *)this + 11));
      *((void *)this + 11) = 0;
    }
    pthread_mutex_unlock(v4);
    char v13 = v6 ^ 1;
    if (a2) {
      char v13 = 1;
    }
    if ((v13 & 1) == 0)
    {
      dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v5);
    }
    if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v20 = "stop";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: --done\n", buf, 0xCu);
    }
    return 1;
  }
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v20 = "stop";
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: already stopped, returning true\n", buf, 0xCu);
  }
  pthread_mutex_unlock(v4);
  return 1;
}

uint64_t IOACIPCClass::close_nl(IOACIPCClass *this)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)this + 176))
  {
    if ((*((unsigned char *)this + 8) & 2) != 0)
    {
      uint64_t v4 = 0;
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        return v4;
      }
      int v8 = 136315138;
      uint64_t v9 = "close_nl";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: not open, return success\n", (uint8_t *)&v8, 0xCu);
    }
    return 0;
  }
  *((unsigned char *)this + 176) = 0;
  mach_port_t v2 = *((_DWORD *)this + 43);
  uint32_t v3 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 1);
  uint64_t v4 = IOConnectCallScalarMethod(v2, v3, 0, 0, 0, 0);
  io_connect_t v5 = *((_DWORD *)this + 43);
  if (v5)
  {
    IOServiceClose(v5);
    *((_DWORD *)this + 43) = 0;
  }
  io_object_t v6 = *((_DWORD *)this + 42);
  if (v6)
  {
    IOObjectRelease(v6);
    *((_DWORD *)this + 42) = 0;
  }
  return v4;
}

uint64_t IOACIPCClass::clearIterators(IOACIPCClass *this)
{
  io_object_t v2 = *((_DWORD *)this + 28);
  if (v2)
  {
    IOObjectRelease(v2);
    *((_DWORD *)this + 28) = 0;
  }
  uint64_t result = *((unsigned int *)this + 29);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 29) = 0;
  }
  return result;
}

void IOACIPCClass::clearNotificationPort(IOACIPCClass *this)
{
  io_object_t v2 = (void *)((char *)this + 96);
  uint64_t v1 = *((void *)this + 12);
  if (v1)
  {
    uint64_t v4 = (__CFRunLoop *)*((void *)this + 10);
    uint64_t v5 = *((void *)this + 13);
    uint64_t v6 = MEMORY[0x263EF8330];
    void *v2 = 0;
    v2[1] = 0;
    block[0] = v6;
    block[1] = 0x40000000;
    block[2] = ___ZN12IOACIPCClass21clearNotificationPortEv_block_invoke;
    block[3] = &__block_descriptor_tmp_22;
    block[4] = v4;
    block[5] = v5;
    block[6] = v1;
    if (v4)
    {
      if (*((void *)this + 11)) {
        IOACIPCClass::clearNotificationPort();
      }
      CFRunLoopPerformBlock(v4, (CFTypeRef)*MEMORY[0x263EFFE88], block);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 10));
    }
    uint64_t v7 = *((void *)this + 11);
    if (v7)
    {
      if (*((void *)this + 10)) {
        IOACIPCClass::clearNotificationPort();
      }
      dispatch_async(v7, block);
    }
  }
}

void ___ZN12IOACIPCClass4stopEP16dispatch_group_s_block_invoke(void *a1)
{
  io_object_t v2 = (const void *)a1[4];
  if (v2) {
    _Block_release(v2);
  }
  uint32_t v3 = (const void *)a1[5];
  if (v3) {
    _Block_release(v3);
  }
  uint64_t v4 = (const void *)a1[6];
  if (v4) {
    _Block_release(v4);
  }
  uint64_t v5 = a1[7];
  if (v5)
  {
    dispatch_group_leave(v5);
    uint64_t v6 = a1[7];
    dispatch_release(v6);
  }
}

void ___ZN12IOACIPCClass21clearNotificationPortEv_block_invoke(__CFRunLoop **a1)
{
  io_object_t v2 = a1[4];
  if (v2) {
    CFRunLoopRemoveSource(v2, a1[5], (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  }
  uint32_t v3 = a1[6];

  IONotificationPortDestroy(v3);
}

const void *IOACIPCClass::getTransferRingInfo(IOACIPCClass *this, io_registry_entry_t entry)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(entry, @"AppleConvergedIPCTransferRingProperties", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!CFProperty)
  {
    if ((*((unsigned char *)this + 8) & 1) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      int v8 = "getTransferRingInfo";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: TR properties are not available\n", (uint8_t *)&v7, 0xCu);
    }
    return 0;
  }
  uint64_t v4 = CFProperty;
  CFTypeID v5 = CFGetTypeID(CFProperty);
  if (v5 != CFArrayGetTypeID())
  {
    if ((*((unsigned char *)this + 8) & 1) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      int v8 = "getTransferRingInfo";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: TR properties has invalid type\n", (uint8_t *)&v7, 0xCu);
    }
    CFRelease(v4);
    return 0;
  }
  return v4;
}

const void *IOACIPCClass::getCompletionRingInfo(IOACIPCClass *this, io_registry_entry_t entry)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(entry, @"AppleConvergedIPCCompletionRingProperties", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!CFProperty)
  {
    if ((*((unsigned char *)this + 8) & 1) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      int v8 = "getCompletionRingInfo";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: CR properties are not available\n", (uint8_t *)&v7, 0xCu);
    }
    return 0;
  }
  uint64_t v4 = CFProperty;
  CFTypeID v5 = CFGetTypeID(CFProperty);
  if (v5 != CFArrayGetTypeID())
  {
    if ((*((unsigned char *)this + 8) & 1) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      int v8 = "getCompletionRingInfo";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: CR properties has invalid type\n", (uint8_t *)&v7, 0xCu);
    }
    CFRelease(v4);
    return 0;
  }
  return v4;
}

uint64_t IOACIPCClass::open(IOACIPCClass *this, io_service_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "open";
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: \n", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = IOACIPCClass::open_nl((io_connect_t *)this, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOACIPCClass::open_nl(io_connect_t *this, io_service_t a2)
{
  uint64_t v2 = 0;
  uint32_t outputCnt = 0;
  uint64_t v10 = 0;
  if (!*((unsigned char *)this + 176))
  {
    if (IOACIPCClass::setUpNotificationCallback((IOACIPCClass *)this, a2))
    {
      uint64_t v2 = IOServiceOpen(a2, *MEMORY[0x263EF8960], 0, this + 43);
      if (!v2)
      {
        mach_port_t v5 = this[43];
        uint32_t v6 = (*(uint64_t (**)(io_connect_t *, void))(*(void *)this + 224))(this, 0);
        uint64_t v2 = IOConnectCallScalarMethod(v5, v6, &v10, 1u, 0, &outputCnt);
        if (!v2)
        {
          *((unsigned char *)this + 176) = 1;
          return v2;
        }
      }
    }
    else
    {
      uint64_t v2 = 3758097112;
    }
    io_connect_t v7 = this[43];
    if (v7)
    {
      IOServiceClose(v7);
      this[43] = 0;
    }
    io_object_t v8 = this[42];
    if (v8)
    {
      IOObjectRelease(v8);
      this[42] = 0;
    }
  }
  return v2;
}

BOOL IOACIPCClass::setUpNotificationCallback(IOACIPCClass *this, io_service_t a2)
{
  kern_return_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  kern_return_t v8;
  uint64_t v9;

  uint64_t v9 = *MEMORY[0x263EF8340];
  uint32_t v3 = IOServiceAddInterestNotification(*((IONotificationPortRef *)this + 12), a2, "IOGeneralInterest", (IOServiceInterestCallback)IOACIPCClass::notificationCallback, *((void **)this + 19), (io_object_t *)this + 42);
  if (v3 && (*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    mach_port_t v5 = 136315394;
    uint32_t v6 = "setUpNotificationCallback";
    io_connect_t v7 = 1024;
    io_object_t v8 = v3;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: Could not add interest notification on service: %#x\n", (uint8_t *)&v5, 0x12u);
  }
  return v3 == 0;
}

uint64_t IOACIPCClass::cleanUpNotificationCallback(IOACIPCClass *this)
{
  uint64_t result = *((unsigned int *)this + 42);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 42) = 0;
  }
  return result;
}

uint64_t IOACIPCClass::close(IOACIPCClass *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint32_t v6 = "close";
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: \n", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = IOACIPCClass::close_nl(this);
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t IOACIPCClass::notificationCallback(uint64_t (**this)(IOACIPCClass *, void *), void *a2, unsigned int a3, unsigned int a4, void *a5)
{
  return this[2]((IOACIPCClass *)this, a2);
}

void *IOACIPCClass::copyNotificationHandler(IOACIPCClass *this, int a2, void *a3)
{
  if (a2 == -469794559 && (uint64_t v3 = (const void *)*((void *)this + 17)) != 0) {
    return _Block_copy(v3);
  }
  else {
    return 0;
  }
}

uint64_t IOACIPCClass::io(uint64_t a1, unsigned int a2, void *a3, unsigned int *a4, unsigned int a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v26 = 0;
  *(_OWORD *)std::string input = 0u;
  long long v25 = 0u;
  uint64_t v10 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if ((*(unsigned char *)(a1 + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *a4;
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "io";
    __int16 v18 = 1024;
    unsigned int v19 = a2;
    __int16 v20 = 2048;
    uint64_t v21 = a3;
    __int16 v22 = 1024;
    int v23 = v11;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: trIndex %u, buff %p, size %u\n", buf, 0x22u);
  }
  input[0] = a2;
  input[1] = a5;
  uint64_t v26 = 0;
  long long v25 = 0uLL;
  size_t v12 = *a4;
  *(void *)buf = v12;
  mach_port_t v13 = *(_DWORD *)(a1 + 172);
  uint32_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 224))(a1, 2);
  if (a5 == 1)
  {
    uint64_t v15 = IOConnectCallMethod(v13, v14, input, 5u, a3, v12, 0, 0, 0, 0);
  }
  else
  {
    uint64_t v15 = IOConnectCallMethod(v13, v14, input, 5u, 0, 0, 0, 0, a3, (size_t *)buf);
    if (!v15) {
      *a4 = *(_DWORD *)buf;
    }
  }
  pthread_mutex_unlock(v10);
  return v15;
}

uint64_t IOACIPCClass::ioAsync(IOACIPCClass *this, unsigned int a2, uint64_t a3, unsigned int a4, void *a5, unsigned int a6, void (*a7)(void *, int, void *), void *a8)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v40 = v16;
  long long v41 = v16;
  *(_OWORD *)reference = v16;
  long long v39 = v16;
  uint64_t v37 = 0;
  *(_OWORD *)std::string input = 0u;
  long long v36 = 0u;
  uint64_t v17 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v24 = "ioAsync";
    __int16 v25 = 1024;
    unsigned int v26 = a2;
    __int16 v27 = 2048;
    uint64_t v28 = a3;
    __int16 v29 = 1024;
    unsigned int v30 = a4;
    __int16 v31 = 2048;
    v32 = a5;
    __int16 v33 = 1024;
    unsigned int v34 = a6;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: trIndex %u, buff %p, size %u, footer %p, size %u\n", buf, 0x32u);
  }
  if (*((void *)this + 12))
  {
    input[0] = a3;
    input[1] = a4;
    *(void *)&long long v36 = a5;
    *((void *)&v36 + 1) = a6;
    uint64_t v37 = a2;
    reference[1] = (uint64_t)a7;
    *(void *)&long long v39 = a8;
    mach_port_t v18 = *((_DWORD *)this + 43);
    uint32_t v19 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 2);
    mach_port_t MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 12));
    uint64_t v21 = IOConnectCallAsyncScalarMethod(v18, v19, MachPort, reference, 3u, input, 5u, 0, 0);
  }
  else
  {
    uint64_t v21 = 3758097112;
    if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v24 = "ioAsync";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock(v17);
  return v21;
}

uint64_t IOACIPCClass::sendImage(IOACIPCClass *this, const void *a2, unsigned int a3, unsigned int *a4, unsigned int a5)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  uint32_t outputCnt = 2;
  uint64_t v10 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    mach_port_t v18 = "sendImage";
    __int16 v19 = 2048;
    *(void *)__int16 v20 = a2;
    *(_WORD *)&v20[8] = 1024;
    *(_DWORD *)&v20[10] = a3;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: buff %p, size %u\n", buf, 0x1Cu);
  }
  input[0] = 0;
  input[1] = 0;
  uint64_t input[2] = a5;
  uint64_t output = 0;
  uint64_t v26 = 0;
  mach_port_t v11 = *((_DWORD *)this + 43);
  uint32_t v12 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 3);
  uint64_t v13 = IOConnectCallMethod(v11, v12, input, 3u, a2, a3, &output, &outputCnt, 0, 0);
  if (!v13)
  {
    *a4 = output;
    uint64_t v13 = v26;
  }
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = *a4;
    *(_DWORD *)buf = 136316162;
    mach_port_t v18 = "sendImage";
    __int16 v19 = 1024;
    *(_DWORD *)__int16 v20 = v13;
    *(_WORD *)&v20[4] = 2048;
    *(void *)&v20[6] = a2;
    __int16 v21 = 1024;
    unsigned int v22 = a3;
    __int16 v23 = 1024;
    int v24 = v14;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: ret 0x%x, buff %p, size %u, cookie %u\n", buf, 0x28u);
  }
  pthread_mutex_unlock(v10);
  return v13;
}

uint64_t IOACIPCClass::sendImageAsync(IOACIPCClass *this, const void *a2, unsigned int a3, void (*a4)(void *, int, void *, void *), void *a5, unsigned int a6)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v25 = v12;
  long long v26 = v12;
  *(_OWORD *)reference = v12;
  long long v24 = v12;
  uint32_t outputCnt = 2;
  uint64_t v13 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "sendImageAsync";
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = a2;
    *(_WORD *)&unsigned char buf[22] = 1024;
    unsigned int v21 = a3;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: buff %p, size %u\n", buf, 0x1Cu);
  }
  if (*((void *)this + 12))
  {
    *(void *)buf = a2;
    *(void *)&buf[8] = a3;
    *(void *)&buf[16] = a6;
    output[0] = 0;
    output[1] = 0;
    reference[1] = (uint64_t)a4;
    *(void *)&long long v24 = a5;
    mach_port_t v14 = *((_DWORD *)this + 43);
    uint32_t v15 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 3);
    mach_port_t MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 12));
    uint64_t v17 = IOConnectCallAsyncScalarMethod(v14, v15, MachPort, reference, 3u, (const uint64_t *)buf, 3u, output, &outputCnt);
  }
  else
  {
    uint64_t v17 = 3758097112;
    if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "sendImageAsync";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock(v13);
  return v17;
}

uint64_t IOACIPCClass::generateNonce(IOACIPCClass *this)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    io_object_t v8 = "generateNonce";
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: \n", (uint8_t *)&v7, 0xCu);
  }
  mach_port_t v3 = *((_DWORD *)this + 43);
  uint32_t v4 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 12);
  uint64_t v5 = IOConnectCallScalarMethod(v3, v4, 0, 0, 0, 0);
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    io_object_t v8 = "generateNonce";
    __int16 v9 = 1024;
    int v10 = v5;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: ret 0x%x\n", (uint8_t *)&v7, 0x12u);
  }
  pthread_mutex_unlock(v2);
  return v5;
}

uint64_t IOACIPCClass::readRegister(IOACIPCClass *this, unsigned int a2, void *a3, unsigned int *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  io_object_t v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *a4;
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "readRegister";
    __int16 v16 = 1024;
    unsigned int v17 = a2;
    __int16 v18 = 2048;
    __int16 v19 = a3;
    __int16 v20 = 1024;
    int v21 = v9;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: reg %u, buff %p, size %u\n", buf, 0x22u);
  }
  size_t v14 = *a4;
  *(void *)buf = a2;
  mach_port_t v10 = *((_DWORD *)this + 43);
  uint32_t v11 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 4);
  uint64_t v12 = IOConnectCallMethod(v10, v11, (const uint64_t *)buf, 1u, 0, 0, 0, 0, a3, &v14);
  if (!v12) {
    *a4 = v14;
  }
  pthread_mutex_unlock(v8);
  return v12;
}

uint64_t IOACIPCClass::writeRegister(IOACIPCClass *this, unsigned int a2, void *a3, unsigned int a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  io_object_t v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "writeRegister";
    __int16 v14 = 1024;
    unsigned int v15 = a2;
    __int16 v16 = 2048;
    unsigned int v17 = a3;
    __int16 v18 = 1024;
    unsigned int v19 = a4;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: reg %u, buff %p, size %u\n", buf, 0x22u);
  }
  *(void *)buf = a2;
  mach_port_t v9 = *((_DWORD *)this + 43);
  uint32_t v10 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 13);
  uint64_t v11 = IOConnectCallMethod(v9, v10, (const uint64_t *)buf, 1u, a3, a4, 0, 0, 0, 0);
  pthread_mutex_unlock(v8);
  return v11;
}

uint64_t IOACIPCClass::queryTransferCredit(IOACIPCClass *this, unsigned int a2, unsigned int *a3)
{
  input[1] = *MEMORY[0x263EF8340];
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 1;
  uint32_t v6 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  input[0] = a2;
  *a3 = 0;
  mach_port_t v7 = *((_DWORD *)this + 43);
  uint32_t v8 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 5);
  uint64_t v9 = IOConnectCallMethod(v7, v8, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
  if (v9) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = outputCnt == 1;
  }
  if (v10) {
    *a3 = output;
  }
  pthread_mutex_unlock(v6);
  return v9;
}

uint64_t IOACIPCClass::getIOMMUPageSize(IOACIPCClass *this, unsigned int *a2)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 1;
  uint32_t v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  *a2 = 0;
  mach_port_t v5 = *((_DWORD *)this + 43);
  uint32_t v6 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 6);
  uint64_t v7 = IOConnectCallMethod(v5, v6, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if (v7) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = outputCnt == 1;
  }
  if (v8) {
    *a2 = output[0];
  }
  pthread_mutex_unlock(v4);
  return v7;
}

uint64_t IOACIPCClass::mapMemory(IOACIPCClass *this, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6, uint64_t a7, unsigned int a8)
{
  input[7] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a4;
  uint64_t input[3] = a5;
  uint64_t input[4] = a6;
  uint64_t input[5] = a7;
  input[6] = a8;
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v17 = "mapMemory";
    __int16 v18 = 1024;
    unsigned int v19 = a2;
    __int16 v20 = 1024;
    unsigned int v21 = a4;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u, size %u\n", buf, 0x18u);
  }
  uint64_t v11 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  mach_port_t v12 = *((_DWORD *)this + 43);
  uint32_t v13 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 7);
  uint64_t v14 = IOConnectCallMethod(v12, v13, input, 7u, 0, 0, 0, 0, 0, 0);
  pthread_mutex_unlock(v11);
  return v14;
}

uint64_t IOACIPCClass::mapMemoryAsync(IOACIPCClass *this, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6, uint64_t a7, unsigned int a8, void (*a9)(void *, int), void *a10)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v29 = v11;
  long long v30 = v11;
  unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a4;
  uint64_t input[3] = a5;
  uint64_t input[4] = a6;
  uint64_t input[5] = a7;
  input[6] = a8;
  reference[1] = (uint64_t)a9;
  uint64_t v27 = a10;
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v20 = "mapMemoryAsync";
    __int16 v21 = 1024;
    unsigned int v22 = a2;
    __int16 v23 = 1024;
    unsigned int v24 = a4;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u, size %u\n", buf, 0x18u);
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*((void *)this + 12))
  {
    mach_port_t v14 = *((_DWORD *)this + 43);
    uint32_t v15 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 7);
    mach_port_t MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 12));
    uint64_t v17 = IOConnectCallAsyncScalarMethod(v14, v15, MachPort, reference, 3u, input, 7u, 0, 0);
  }
  else
  {
    uint64_t v17 = 3758097112;
    if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v20 = "mapMemoryAsync";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
  return v17;
}

uint64_t IOACIPCClass::unmapMemory(IOACIPCClass *this, unsigned int a2)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a2;
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v10 = "unmapMemory";
    __int16 v11 = 1024;
    unsigned int v12 = a2;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u\n", buf, 0x12u);
  }
  uint32_t v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  mach_port_t v5 = *((_DWORD *)this + 43);
  uint32_t v6 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 8);
  uint64_t v7 = IOConnectCallMethod(v5, v6, input, 1u, 0, 0, 0, 0, 0, 0);
  pthread_mutex_unlock(v4);
  return v7;
}

uint64_t IOACIPCClass::unmapMemoryAsync(IOACIPCClass *this, unsigned int a2, void (*a3)(void *, int), void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v20 = v5;
  long long v21 = v5;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t input = a2;
  reference[1] = (uint64_t)a3;
  __int16 v18 = a4;
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint32_t v13 = "unmapMemoryAsync";
    __int16 v14 = 1024;
    unsigned int v15 = a2;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u\n", buf, 0x12u);
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*((void *)this + 12))
  {
    mach_port_t v7 = *((_DWORD *)this + 43);
    uint32_t v8 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 8);
    mach_port_t MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 12));
    uint64_t v10 = IOConnectCallAsyncScalarMethod(v7, v8, MachPort, reference, 3u, &input, 1u, 0, 0);
  }
  else
  {
    uint64_t v10 = 3758097112;
    if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint32_t v13 = "unmapMemoryAsync";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
  return v10;
}

uint64_t IOACIPCClass::updateMemory(IOACIPCClass *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a4;
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v14 = "updateMemory";
    __int16 v15 = 1024;
    unsigned int v16 = a2;
    __int16 v17 = 1024;
    unsigned int v18 = a3;
    __int16 v19 = 1024;
    unsigned int v20 = a4;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u, prio -> %u, tc -> %u\n", buf, 0x1Eu);
  }
  uint32_t v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  mach_port_t v9 = *((_DWORD *)this + 43);
  uint32_t v10 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 9);
  uint64_t v11 = IOConnectCallMethod(v9, v10, input, 3u, 0, 0, 0, 0, 0, 0);
  pthread_mutex_unlock(v8);
  return v11;
}

uint64_t IOACIPCClass::updateMemoryAsync(IOACIPCClass *this, unsigned int a2, unsigned int a3, unsigned int a4, void (*a5)(void *, int), void *a6)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v28 = v7;
  long long v29 = v7;
  unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a4;
  reference[1] = (uint64_t)a5;
  long long v26 = a6;
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v17 = "updateMemoryAsync";
    __int16 v18 = 1024;
    unsigned int v19 = a2;
    __int16 v20 = 1024;
    unsigned int v21 = a3;
    __int16 v22 = 1024;
    unsigned int v23 = a4;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u, prio -> %u, tc -> %u\n", buf, 0x1Eu);
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*((void *)this + 12))
  {
    mach_port_t v11 = *((_DWORD *)this + 43);
    uint32_t v12 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 9);
    mach_port_t MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 12));
    uint64_t v14 = IOConnectCallAsyncScalarMethod(v11, v12, MachPort, reference, 3u, input, 3u, 0, 0);
  }
  else
  {
    uint64_t v14 = 3758097112;
    if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v17 = "updateMemoryAsync";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
  return v14;
}

uint64_t IOACIPCClass::notifyMemory(IOACIPCClass *this, unsigned int a2, uint64_t a3, unsigned int a4)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a4;
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint32_t v12 = "notifyMemory";
    __int16 v13 = 1024;
    unsigned int v14 = a2;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u\n", buf, 0x12u);
  }
  uint32_t v6 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  mach_port_t v7 = *((_DWORD *)this + 43);
  uint32_t v8 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 10);
  uint64_t v9 = IOConnectCallMethod(v7, v8, input, 3u, 0, 0, 0, 0, 0, 0);
  pthread_mutex_unlock(v6);
  return v9;
}

uint64_t IOACIPCClass::notifyMemoryAsync(IOACIPCClass *this, unsigned int a2, uint64_t a3, unsigned int a4, void (*a5)(void *, int), void *a6)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v22 = v7;
  long long v23 = v7;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a4;
  reference[1] = (uint64_t)a5;
  __int16 v20 = a6;
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "notifyMemoryAsync";
    __int16 v16 = 1024;
    unsigned int v17 = a2;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: region %u\n", buf, 0x12u);
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*((void *)this + 12))
  {
    mach_port_t v9 = *((_DWORD *)this + 43);
    uint32_t v10 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 10);
    mach_port_t MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 12));
    uint64_t v12 = IOConnectCallAsyncScalarMethod(v9, v10, MachPort, reference, 3u, input, 3u, 0, 0);
  }
  else
  {
    uint64_t v12 = 3758097112;
    if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v15 = "notifyMemoryAsync";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
  return v12;
}

uint64_t IOACIPCClass::abortTransferRing(IOACIPCClass *this, unsigned int a2)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a2;
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint32_t v10 = "abortTransferRing";
    __int16 v11 = 1024;
    unsigned int v12 = a2;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: TR index %u\n", buf, 0x12u);
  }
  uint32_t v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  mach_port_t v5 = *((_DWORD *)this + 43);
  uint32_t v6 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 11);
  uint64_t v7 = IOConnectCallMethod(v5, v6, input, 1u, 0, 0, 0, 0, 0, 0);
  pthread_mutex_unlock(v4);
  return v7;
}

uint64_t IOACIPCClass::abortTransferRingAsync(IOACIPCClass *this, unsigned int a2, void (*a3)(void *, int), void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v20 = v5;
  long long v21 = v5;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t input = a2;
  reference[1] = (uint64_t)a3;
  __int16 v18 = a4;
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v13 = "abortTransferRingAsync";
    __int16 v14 = 1024;
    unsigned int v15 = a2;
    _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: TR index %u\n", buf, 0x12u);
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*((void *)this + 12))
  {
    mach_port_t v7 = *((_DWORD *)this + 43);
    uint32_t v8 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)this + 224))(this, 11);
    mach_port_t MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 12));
    uint64_t v10 = IOConnectCallAsyncScalarMethod(v7, v8, MachPort, reference, 3u, &input, 1u, 0, 0);
  }
  else
  {
    uint64_t v10 = 3758097112;
    if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v13 = "abortTransferRingAsync";
      _os_log_impl(&dword_23818E000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
  return v10;
}

void IOACIPCTraceClass::connect()
{
}

void IOACIPCTraceClass::setNotificationPort()
{
}

void IOACIPCControlClass::deregisterEventNotification_nl()
{
}

void IOACIPCControlClass::setNotificationPort()
{
}

void IOACIPCControlClass::setEventNotificationPort()
{
}

void IOACIPCControlClass::clearEventNotificationPort()
{
}

{
  __assert_rtn("clearEventNotificationPort", "IOACIPCControlClass.cpp", 196, "!fEventQueue");
}

void IOACIPCControlClass::open_nl()
{
}

void IOACIPCControlClass::registerEventNotification_nl()
{
}

void IOACIPCClass::start_nl()
{
}

void IOACIPCClass::setNotificationPort()
{
}

void IOACIPCClass::stop()
{
}

void IOACIPCClass::clearNotificationPort()
{
}

{
  __assert_rtn("clearNotificationPort", "IOACIPCClass.cpp", 522, "!fQueue");
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

kern_return_t IOConnectCallAsyncScalarMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F20](*(void *)&connection, *(void *)&selector, *(void *)&wake_port, reference, *(void *)&referenceCnt, input, *(void *)&inputCnt, output);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x270EF47C8](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
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

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}