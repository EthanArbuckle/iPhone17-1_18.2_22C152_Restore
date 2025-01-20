uint64_t IOABPClass::writeAsync(IOABPClass *this, const void *a2, unsigned int a3, void (*a4)(void *, int, void *), void *a5)
{
  long long v10;
  pthread_mutex_t *v11;
  IONotificationPort *v12;
  mach_port_t v13;
  mach_port_t MachPort;
  uint64_t v15;
  uint64_t input[2];
  uint64_t reference[2];
  long long v19;
  long long v20;
  long long v21;
  uint64_t v22;

  v22 = *MEMORY[0x263EF8340];
  *(void *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20 = v10;
  v21 = v10;
  *(_OWORD *)reference = v10;
  v19 = v10;
  v11 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: buff %p, size %u\n", "writeAsync", a2, a3);
  }
  v12 = (IONotificationPort *)*((void *)this + 12);
  if (v12)
  {
    input[0] = (uint64_t)a2;
    input[1] = a3;
    reference[1] = (uint64_t)a4;
    *(void *)&v19 = a5;
    v13 = *((_DWORD *)this + 39);
    MachPort = IONotificationPortGetMachPort(v12);
    v15 = IOConnectCallAsyncScalarMethod(v13, 2u, MachPort, reference, 3u, input, 2u, 0, 0);
    pthread_mutex_unlock(v11);
  }
  else
  {
    if ((*((unsigned char *)this + 8) & 2) != 0) {
      syslog(5, "IOABPClass::%s: no async port\n", "writeAsync");
    }
    pthread_mutex_unlock(v11);
    return 3758097112;
  }
  return v15;
}

uint64_t IOABPClass::readAsync(IOABPClass *this, uint64_t a2, unsigned int a3, void (*a4)(void *, int, void *), void *a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v20 = v10;
  long long v21 = v10;
  *(_OWORD *)reference = v10;
  long long v19 = v10;
  v11 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v12 = (IONotificationPort *)*((void *)this + 12);
  if (v12)
  {
    input[0] = a2;
    input[1] = a3;
    reference[1] = (uint64_t)a4;
    *(void *)&long long v19 = a5;
    mach_port_t v13 = *((_DWORD *)this + 39);
    mach_port_t MachPort = IONotificationPortGetMachPort(v12);
    uint64_t v15 = IOConnectCallAsyncScalarMethod(v13, 3u, MachPort, reference, 3u, input, 2u, 0, 0);
    pthread_mutex_unlock(v11);
  }
  else
  {
    if ((*((unsigned char *)this + 8) & 2) != 0) {
      syslog(5, "IOABPClass::%s: no async port\n", "readAsync");
    }
    pthread_mutex_unlock(v11);
    return 3758097112;
  }
  return v15;
}

void IOABPControlClass::IOABPControlClass(IOABPControlClass *this)
{
  *(_DWORD *)this = 0;
  *((_DWORD *)this + 18) = 0;
  *((void *)this + 19) = 0;
  *((_DWORD *)this + 40) = 0;
  *((unsigned char *)this + 164) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_DWORD *)this + 36) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 8), 0);
}

{
  *(_DWORD *)this = 0;
  *((_DWORD *)this + 18) = 0;
  *((void *)this + 19) = 0;
  *((_DWORD *)this + 40) = 0;
  *((unsigned char *)this + 164) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_DWORD *)this + 36) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 8), 0);
}

void IOABPControlClass::~IOABPControlClass(IOABPControlClass *this)
{
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPControlClass::%s: \n", "~IOABPControlClass");
  }
  IOABPControlClass::stop((io_object_t *)this);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 8));
}

void __clang_call_terminate(void *a1)
{
}

uint64_t IOABPControlClass::stop(io_object_t *this)
{
  v2 = (pthread_mutex_t *)(this + 2);
  pthread_mutex_lock((pthread_mutex_t *)(this + 2));
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPControlClass::%s: \n", "stop");
  }
  IOABPControlClass::close_nl((IOABPControlClass *)this);
  IOABPControlClass::deregisterEventNotification_nl((IOABPControlClass *)this, 0);
  io_object_t v3 = this[18];
  if (v3)
  {
    IOObjectRelease(v3);
    this[18] = 0;
  }
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPControlClass::%s: --done\n", "stop");
  }
  pthread_mutex_unlock(v2);
  return 1;
}

BOOL IOABPControlClass::start(IOABPControlClass *this)
{
  v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if (*((_DWORD *)this + 18))
  {
    BOOL v3 = 1;
  }
  else
  {
    CFDictionaryRef v4 = IOServiceMatching("AppleBasebandPCIControl");
    if (v4)
    {
      io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v4);
      BOOL v3 = MatchingService != 0;
      if (!MatchingService && (*(unsigned char *)this & 2) != 0) {
        syslog(5, "IOABPControlClass::%s: could not get matching service\n", "start");
      }
      *((_DWORD *)this + 18) = MatchingService;
    }
    else
    {
      if ((*(unsigned char *)this & 2) != 0) {
        syslog(5, "IOABPControlClass::%s: could not create matching dictionary\n", "start");
      }
      BOOL v3 = 0;
    }
  }
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPControlClass::%s: --done\n", "start");
  }
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t IOABPControlClass::close_nl(IOABPControlClass *this)
{
  if (!*((unsigned char *)this + 164)) {
    return 0;
  }
  *((unsigned char *)this + 164) = 0;
  uint64_t v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 40), 1u, 0, 0, 0, 0);
  io_connect_t v3 = *((_DWORD *)this + 40);
  if (v3)
  {
    IOServiceClose(v3);
    *((_DWORD *)this + 40) = 0;
  }
  IOABPControlClass::clearNotificationPort(this);
  CFDictionaryRef v4 = (const void *)*((void *)this + 10);
  if (v4)
  {
    CFRelease(v4);
    *((void *)this + 10) = 0;
  }
  v5 = *((void *)this + 11);
  if (v5)
  {
    dispatch_release(v5);
    *((void *)this + 11) = 0;
  }
  return v2;
}

void IOABPControlClass::deregisterEventNotification_nl(IOABPControlClass *this, NSObject *a2)
{
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPControlClass::%s: +\n", "deregisterEventNotification_nl");
  }
  if (*((void *)this + 14) || *((void *)this + 15))
  {
    IOObjectRelease(*((_DWORD *)this + 36));
    *((_DWORD *)this + 36) = 0;
    IOABPControlClass::clearEventNotificationPort(this);
    if (*((void *)this + 14))
    {
      CFRunLoopRef Current = CFRunLoopGetCurrent();
      if (Current == *((CFRunLoopRef *)this + 14))
      {
        if (*((void *)this + 19))
        {
          _Block_release(*((const void **)this + 19));
          *((void *)this + 19) = 0;
          CFRunLoopRef Current = (CFRunLoopRef)*((void *)this + 14);
        }
        if (Current)
        {
          CFRelease(Current);
          *((void *)this + 14) = 0;
        }
        goto LABEL_24;
      }
    }
    v5 = a2;
    if (!a2)
    {
      if (*((void *)this + 15))
      {
        char v6 = 0;
        v5 = 0;
        goto LABEL_11;
      }
      v5 = dispatch_group_create();
      if (!v5)
      {
        char v6 = 0;
        goto LABEL_11;
      }
    }
    dispatch_retain(v5);
    dispatch_group_enter(v5);
    char v6 = 1;
LABEL_11:
    uint64_t v7 = *((void *)this + 19);
    *((void *)this + 19) = 0;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN17IOABPControlClass30deregisterEventNotification_nlEP16dispatch_group_s_block_invoke;
    block[3] = &unk_264328DF8;
    block[4] = v7;
    block[5] = v5;
    v8 = (__CFRunLoop *)*((void *)this + 14);
    if (v8)
    {
      if (*((void *)this + 15)) {
        IOABPControlClass::deregisterEventNotification_nl();
      }
      CFRunLoopPerformBlock(v8, (CFTypeRef)*MEMORY[0x263EFFE88], block);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 14));
      CFRelease(*((CFTypeRef *)this + 14));
      *((void *)this + 14) = 0;
    }
    v9 = *((void *)this + 15);
    if (v9)
    {
      dispatch_async(v9, block);
      dispatch_release(*((dispatch_object_t *)this + 15));
      *((void *)this + 15) = 0;
    }
    char v10 = v6 ^ 1;
    if (a2) {
      char v10 = 1;
    }
    if ((v10 & 1) == 0)
    {
      pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
      dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v5);
      pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
    }
LABEL_24:
    if ((*(unsigned char *)this & 2) != 0) {
      syslog(5, "IOABPControlClass::%s: -\n", "deregisterEventNotification_nl");
    }
  }
}

void IOABPControlClass::setNotificationPort(IOABPControlClass *this)
{
  if (!*((void *)this + 12))
  {
    uint64_t v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    *((void *)this + 12) = v2;
    if (!v2) {
      IOABPControlClass::setNotificationPort();
    }
    if (*((void *)this + 10))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v2);
      *((void *)this + 13) = RunLoopSource;
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 10), RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    }
    CFDictionaryRef v4 = *((void *)this + 11);
    if (v4)
    {
      v5 = (IONotificationPort *)*((void *)this + 12);
      IONotificationPortSetDispatchQueue(v5, v4);
    }
  }
}

void IOABPControlClass::clearNotificationPort(IOABPControlClass *this)
{
  io_connect_t v3 = (void *)((char *)this + 96);
  uint64_t v2 = (IONotificationPort *)*((void *)this + 12);
  if (v2)
  {
    if (*((void *)this + 10))
    {
      CFRunLoopRemoveSource(*((CFRunLoopRef *)this + 10), *((CFRunLoopSourceRef *)this + 13), (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      uint64_t v2 = (IONotificationPort *)*((void *)this + 12);
    }
    IONotificationPortDestroy(v2);
    *io_connect_t v3 = 0;
    v3[1] = 0;
  }
}

void IOABPControlClass::setEventNotificationPort(IOABPControlClass *this)
{
  if (!*((void *)this + 16))
  {
    uint64_t v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    *((void *)this + 16) = v2;
    if (!v2) {
      IOABPControlClass::setEventNotificationPort();
    }
    if (*((void *)this + 14))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v2);
      *((void *)this + 17) = RunLoopSource;
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 14), RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    }
    CFDictionaryRef v4 = *((void *)this + 15);
    if (v4)
    {
      v5 = (IONotificationPort *)*((void *)this + 16);
      IONotificationPortSetDispatchQueue(v5, v4);
    }
  }
}

void IOABPControlClass::clearEventNotificationPort(IOABPControlClass *this)
{
  uint64_t v2 = (void *)((char *)this + 128);
  uint64_t v1 = *((void *)this + 16);
  if (v1)
  {
    CFDictionaryRef v4 = (__CFRunLoop *)*((void *)this + 14);
    uint64_t v5 = *((void *)this + 17);
    uint64_t v6 = MEMORY[0x263EF8330];
    void *v2 = 0;
    v2[1] = 0;
    block[0] = v6;
    block[1] = 0x40000000;
    block[2] = ___ZN17IOABPControlClass26clearEventNotificationPortEv_block_invoke;
    block[3] = &__block_descriptor_tmp;
    block[4] = v4;
    block[5] = v5;
    void block[6] = v1;
    if (v4)
    {
      if (*((void *)this + 15)) {
        IOABPControlClass::clearEventNotificationPort();
      }
      CFRunLoopPerformBlock(v4, (CFTypeRef)*MEMORY[0x263EFFE88], block);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 14));
    }
    uint64_t v7 = *((void *)this + 15);
    if (v7)
    {
      if (*((void *)this + 14)) {
        IOABPControlClass::clearEventNotificationPort();
      }
      dispatch_async(v7, block);
    }
  }
}

void ___ZN17IOABPControlClass26clearEventNotificationPortEv_block_invoke(__CFRunLoop **a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    CFRunLoopRemoveSource(v2, a1[5], (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  }
  io_connect_t v3 = a1[6];

  IONotificationPortDestroy(v3);
}

uint64_t IOABPControlClass::open(IOABPControlClass *this, __CFRunLoop *a2)
{
  CFDictionaryRef v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPControlClass::%s: \n", "open");
  }
  uint64_t v5 = IOABPControlClass::open_nl(this, a2, 0);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOABPControlClass::open_nl(IOABPControlClass *this, __CFRunLoop *a2, NSObject *a3)
{
  uint64_t result = 0;
  uint32_t outputCnt = 0;
  uint64_t v8 = 0;
  if (!*((unsigned char *)this + 164))
  {
    io_service_t v5 = *((_DWORD *)this + 18);
    if (v5)
    {
      uint64_t result = IOServiceOpen(v5, *MEMORY[0x263EF8960], 0, (io_connect_t *)this + 40);
      if (!result)
      {
        uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 40), 0, &v8, 1u, 0, &outputCnt);
        if (!result)
        {
          *((unsigned char *)this + 164) = 1;
          if (a2)
          {
            if (a3) {
              IOABPControlClass::open_nl();
            }
            *((void *)this + 10) = a2;
            CFRetain(a2);
          }
          else if (a3)
          {
            *((void *)this + 11) = a3;
            dispatch_retain(a3);
          }
          IOABPControlClass::setNotificationPort(this);
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

uint64_t IOABPControlClass::open(IOABPControlClass *this, NSObject *a2)
{
  CFDictionaryRef v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPControlClass::%s: \n", "open");
  }
  uint64_t v5 = IOABPControlClass::open_nl(this, 0, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOABPControlClass::close(IOABPControlClass *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPControlClass::%s: \n", "close");
  }
  uint64_t v3 = IOABPControlClass::close_nl(this);
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t IOABPControlClass::readLogsAsync(IOABPControlClass *this, void *a2, unsigned int a3, unsigned int a4, void (*a5)(void *, int, void *), void *a6)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v22 = v12;
  long long v23 = v12;
  *(_OWORD *)reference = v12;
  long long v21 = v12;
  mach_port_t v13 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 4) != 0) {
    syslog(5, "IOABPControlClass::%s: buff %p, size %u\n", "readLogsAsync", a2, a3);
  }
  v14 = (IONotificationPort *)*((void *)this + 12);
  if (v14)
  {
    input[0] = (uint64_t)a2;
    input[1] = a3;
    uint64_t input[2] = a4;
    reference[1] = (uint64_t)a5;
    *(void *)&long long v21 = a6;
    mach_port_t v15 = *((_DWORD *)this + 40);
    mach_port_t MachPort = IONotificationPortGetMachPort(v14);
    uint64_t v17 = IOConnectCallAsyncScalarMethod(v15, 2u, MachPort, reference, 3u, input, 3u, 0, 0);
    pthread_mutex_unlock(v13);
  }
  else
  {
    if ((*(unsigned char *)this & 2) != 0) {
      syslog(5, "IOABPControlClass::%s: no async port\n", "readLogsAsync");
    }
    pthread_mutex_unlock(v13);
    return 3758097112;
  }
  return v17;
}

uint64_t IOABPControlClass::registerEventNotification(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  uint64_t v7 = IOABPControlClass::registerEventNotification_nl(a1, a2, 0, a3);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t IOABPControlClass::registerEventNotification_nl(uint64_t a1, const void *a2, NSObject *a3, uint64_t a4)
{
  kern_return_t v9;
  void aBlock[5];

  if (*(_DWORD *)(a1 + 72))
  {
    if (*(void *)(a1 + 152))
    {
      uint64_t v5 = 3758097093;
      if ((*(unsigned char *)a1 & 2) != 0) {
        syslog(5, "IOABPControlClass::%s: a notification block is already registered. deregister it before registering a new block");
      }
    }
    else if (a4)
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 0x40000000;
      aBlock[2] = ___ZN17IOABPControlClass28registerEventNotification_nlEP11__CFRunLoopP16dispatch_queue_sU13block_pointerFv12abpErrorTypePvS5_E_block_invoke;
      aBlock[3] = &unk_264328DD0;
      aBlock[4] = a4;
      *(void *)(a1 + 152) = _Block_copy(aBlock);
      if (a2)
      {
        if (a3) {
          IOABPControlClass::registerEventNotification_nl();
        }
        *(void *)(a1 + 112) = a2;
        CFRetain(a2);
      }
      else if (a3)
      {
        *(void *)(a1 + 120) = a3;
        dispatch_retain(a3);
      }
      IOABPControlClass::setEventNotificationPort((IOABPControlClass *)a1);
      v9 = IOServiceAddInterestNotification(*(IONotificationPortRef *)(a1 + 128), *(_DWORD *)(a1 + 72), "IOGeneralInterest", (IOServiceInterestCallback)IOABPControlClass::generalInterestCallback, *(void **)(a1 + 152), (io_object_t *)(a1 + 144));
      if (v9)
      {
        if ((*(unsigned char *)a1 & 2) != 0) {
          syslog(5, "IOABPControlClass::%s: could not add interest notification on service: %#x\n", "registerEventNotification_nl", v9);
        }
        _Block_release(*(const void **)(a1 + 152));
        *(void *)(a1 + 152) = 0;
        return 3758097084;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      uint64_t v5 = 3758097090;
      if ((*(unsigned char *)a1 & 2) != 0) {
        syslog(5, "IOABPControlClass::%s: block must be provided\n");
      }
    }
  }
  else
  {
    uint64_t v5 = 3758097136;
    if ((*(unsigned char *)a1 & 2) != 0) {
      syslog(5, "IOABPControlClass::%s: service is NULL - must successfully start() first\n");
    }
  }
  return v5;
}

uint64_t IOABPControlClass::registerEventNotification(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  uint64_t v7 = IOABPControlClass::registerEventNotification_nl(a1, 0, a2, a3);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t ___ZN17IOABPControlClass28registerEventNotification_nlEP11__CFRunLoopP16dispatch_queue_sU13block_pointerFv12abpErrorTypePvS5_E_block_invoke(uint64_t result, uint64_t a2, int a3, unsigned int *a4)
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

void IOABPControlClass::generalInterestCallback(IOABPControlClass *this, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  _Block_copy(this);
  (*((void (**)(IOABPControlClass *, void *, uint64_t, uint64_t))this + 2))(this, a2, a3, a4);

  _Block_release(this);
}

uint64_t IOABPControlClass::deregisterEventNotification(IOABPControlClass *this, NSObject *a2)
{
  CFDictionaryRef v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  IOABPControlClass::deregisterEventNotification_nl(this, a2);

  return pthread_mutex_unlock(v4);
}

void ___ZN17IOABPControlClass30deregisterEventNotification_nlEP16dispatch_group_s_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 32);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = *(NSObject **)(a1 + 40);
  if (v3)
  {
    dispatch_group_leave(v3);
    CFDictionaryRef v4 = *(NSObject **)(a1 + 40);
    dispatch_release(v4);
  }
}

BOOL IOABPControlClass::getLogInternalBufferSize(IOABPControlClass *this, unsigned int *a2)
{
  BOOL v2 = 0;
  if (a2)
  {
    io_registry_entry_t v3 = *((_DWORD *)this + 18);
    if (v3)
    {
      CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, @"logSnapshotBufferSize", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
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

uint64_t IOABPControlClass::loggerTune(IOABPControlClass *this, unsigned int a2, unsigned int a3, void *a4, void *a5)
{
  input[4] = *MEMORY[0x263EF8340];
  char v10 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 4) != 0) {
    syslog(5, "IOABPControlClass::%s: subsystem %u, index %u, arg1 %p, arg2 %p\n", "loggerTune", a2, a3, a4, a5);
  }
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = (uint64_t)a4;
  uint64_t input[3] = (uint64_t)a5;
  uint64_t v11 = IOConnectCallScalarMethod(*((_DWORD *)this + 40), 3u, input, 4u, 0, 0);
  pthread_mutex_unlock(v10);
  return v11;
}

BOOL IOABPControlClass::getLastKnownBootStage(IOABPControlClass *this, unsigned int *a2)
{
  BOOL v2 = 0;
  if (a2)
  {
    io_registry_entry_t v3 = *((_DWORD *)this + 18);
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

const char *getABPErrorTypeString(unsigned int a1)
{
  if (a1 > 0x31) {
    return "invalid";
  }
  else {
    return abpErrorTypeStrings[a1];
  }
}

const char *getABPBHIRegistersString(unsigned int a1)
{
  if (a1 > 5) {
    return "invalid";
  }
  else {
    return abpBHIRegistersStrings[a1];
  }
}

const char *getABPBTIRegistersString(unsigned int a1)
{
  if (a1 > 1) {
    return "invalid";
  }
  else {
    return abpBTIRegistersStrings[a1];
  }
}

const char *getABPDirectionString(unsigned int a1)
{
  if (a1 > 1) {
    return "invalid";
  }
  else {
    return abpDirectionStrings[a1];
  }
}

const char *getABPLinkStateString(unsigned int a1)
{
  if (a1 > 4) {
    return "invalid";
  }
  else {
    return abpLinkStateStrings[a1];
  }
}

const char *getABPAERErrorTypeString(unsigned int a1)
{
  if (a1 > 2) {
    return "invalid";
  }
  else {
    return abpAERErrorTypeStrings[a1];
  }
}

void IOABPClass::IOABPClass(IOABPClass *this)
{
  *(void *)this = &unk_26C9AB588;
  *((_DWORD *)this + 2) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((void *)this + 14) = 0;
  *((void *)this + 15) = &unk_2185870C5;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((unsigned char *)this + 160) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
}

{
  *(void *)this = &unk_26C9AB588;
  *((_DWORD *)this + 2) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((void *)this + 14) = 0;
  *((void *)this + 15) = &unk_2185870C5;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((unsigned char *)this + 160) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
}

void IOABPClass::~IOABPClass(IOABPClass *this)
{
  *(void *)this = &unk_26C9AB588;
  if ((*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: \n", "~IOABPClass");
  }
  IOABPClass::stop(this, 0);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 16));
}

uint64_t IOABPClass::stop(IOABPClass *this, NSObject *a2)
{
  CFDictionaryRef v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: \n", "stop");
  }
  if (*((void *)this + 10) || *((void *)this + 11))
  {
    IOABPClass::close_nl(this);
    IOABPClass::clearIterators(this);
    IOABPClass::clearNotificationPort(this);
    uint64_t v5 = a2;
    if (!a2)
    {
      if (*((void *)this + 11))
      {
        char v6 = 0;
        uint64_t v5 = 0;
        goto LABEL_9;
      }
      uint64_t v5 = dispatch_group_create();
      if (!v5)
      {
        char v6 = 0;
        goto LABEL_9;
      }
    }
    dispatch_retain(v5);
    dispatch_group_enter(v5);
    char v6 = 1;
LABEL_9:
    uint64_t v7 = *((void *)this + 18);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN10IOABPClass4stopEP16dispatch_group_s_block_invoke;
    block[3] = &unk_264329108;
    long long v8 = *((_OWORD *)this + 8);
    *((void *)this + 16) = 0;
    *((void *)this + 17) = 0;
    *((void *)this + 18) = 0;
    long long v14 = v8;
    uint64_t v15 = v7;
    v16 = v5;
    v9 = (__CFRunLoop *)*((void *)this + 10);
    if (v9)
    {
      if (*((void *)this + 11)) {
        IOABPClass::stop();
      }
      CFRunLoopPerformBlock(v9, (CFTypeRef)*MEMORY[0x263EFFE88], block);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 10));
      CFRelease(*((CFTypeRef *)this + 10));
      *((void *)this + 10) = 0;
    }
    char v10 = *((void *)this + 11);
    if (v10)
    {
      dispatch_async(v10, block);
      dispatch_release(*((dispatch_object_t *)this + 11));
      *((void *)this + 11) = 0;
    }
    pthread_mutex_unlock(v4);
    char v11 = v6 ^ 1;
    if (a2) {
      char v11 = 1;
    }
    if ((v11 & 1) == 0)
    {
      dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v5);
    }
    if ((*((unsigned char *)this + 8) & 2) != 0) {
      syslog(5, "IOABPClass::%s: --done\n", "stop");
    }
    return 1;
  }
  if ((*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: already stopped, returning true\n", "stop");
  }
  pthread_mutex_unlock(v4);
  return 1;
}

uint64_t IOABPClass::start(uint64_t a1, const char *a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  long long v12 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t started = IOABPClass::start_nl(a1, a2, a3, 0, a4, a5, a6);
  pthread_mutex_unlock(v12);
  return started;
}

uint64_t IOABPClass::start_nl(uint64_t a1, const char *a2, CFTypeRef cf, dispatch_object_t object, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(a1 + 120) = a2;
  if ((*(unsigned char *)(a1 + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: for %s\n", "start_nl", a2);
  }
  mach_port_t v13 = *(const void **)(a1 + 80);
  if (v13) {
    CFRelease(v13);
  }
  long long v14 = *(NSObject **)(a1 + 88);
  if (v14) {
    dispatch_release(v14);
  }
  if (cf)
  {
    if (object) {
      IOABPClass::start_nl();
    }
    *(void *)(a1 + 80) = cf;
    CFRetain(cf);
  }
  else if (object)
  {
    *(void *)(a1 + 88) = object;
    dispatch_retain(object);
  }
  uint64_t v15 = IOServiceMatching("AppleBasebandPCIInterface");
  if (!v15 && (*(unsigned char *)(a1 + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: could not create matching dictionary\n", "start_nl");
  }
  CFStringRef v16 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], *(const char **)(a1 + 120), 0x600u);
  CFDictionarySetValue(v15, @"ABPInterfaceProtocol", v16);
  CFRelease(v16);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke;
  aBlock[3] = &unk_264329040;
  aBlock[4] = a7;
  *(void *)(a1 + 144) = _Block_copy(aBlock);
  IOABPClass::setNotificationPort((IOABPClass *)a1);
  if (!v15)
  {
    uint64_t v17 = 0;
    goto LABEL_31;
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 0x40000000;
  v30[2] = ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_2;
  v30[3] = &unk_264329068;
  v30[4] = a5;
  *(void *)(a1 + 128) = _Block_copy(v30);
  CFRetain(v15);
  if (IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 96), "IOServiceFirstMatch", v15, (IOServiceMatchingCallback)IOABPClass::interfaceMatched, *(void **)(a1 + 128), (io_iterator_t *)(a1 + 112)))
  {
    if ((*(unsigned char *)(a1 + 8) & 2) != 0) {
      syslog(5, "IOABPClass::%s: IOServiceAddMatchingNotification (kIOFirstMatchNotification) failed, ret = 0x%08x");
    }
  }
  else
  {
    io_object_t v18 = *(_DWORD *)(a1 + 112);
    IOObjectRetain(v18);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_3;
    block[3] = &unk_264329090;
    void block[4] = v30;
    io_object_t v29 = v18;
    long long v19 = *(__CFRunLoop **)(a1 + 80);
    if (v19)
    {
      if (*(void *)(a1 + 88)) {
        IOABPClass::start_nl();
      }
      CFRunLoopPerformBlock(v19, (CFTypeRef)*MEMORY[0x263EFFE88], block);
      CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 80));
    }
    long long v20 = *(NSObject **)(a1 + 88);
    if (v20)
    {
      if (*(void *)(a1 + 80)) {
        IOABPClass::start_nl();
      }
      dispatch_async(v20, block);
    }
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 0x40000000;
    v27[2] = ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_4;
    v27[3] = &unk_2643290B8;
    v27[4] = a6;
    *(void *)(a1 + 136) = _Block_copy(v27);
    CFRetain(v15);
    if (!IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 96), "IOServiceTerminate", v15, (IOServiceMatchingCallback)IOABPClass::interfaceMatched, *(void **)(a1 + 136), (io_iterator_t *)(a1 + 116)))
    {
      io_object_t v22 = *(_DWORD *)(a1 + 116);
      IOObjectRetain(v22);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 0x40000000;
      v25[2] = ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_5;
      v25[3] = &unk_2643290E0;
      v25[4] = v27;
      io_object_t v26 = v22;
      long long v23 = *(__CFRunLoop **)(a1 + 80);
      if (v23)
      {
        if (*(void *)(a1 + 88)) {
          IOABPClass::start_nl();
        }
        CFRunLoopPerformBlock(v23, (CFTypeRef)*MEMORY[0x263EFFE88], v25);
        CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 80));
      }
      uint64_t v24 = *(NSObject **)(a1 + 88);
      if (v24)
      {
        if (*(void *)(a1 + 80)) {
          IOABPClass::start_nl();
        }
        dispatch_async(v24, v25);
      }
      uint64_t v17 = 1;
      goto LABEL_30;
    }
    if ((*(unsigned char *)(a1 + 8) & 2) != 0) {
      syslog(5, "IOABPClass::%s: IOServiceAddMatchingNotification (kIOTerminatedNotification) failed, ret = 0x%08x");
    }
  }
  uint64_t v17 = 0;
LABEL_30:
  CFRelease(v15);
LABEL_31:
  if ((*(unsigned char *)(a1 + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: --done\n", "start_nl");
  }
  return v17;
}

uint64_t IOABPClass::start(uint64_t a1, const char *a2, NSObject *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  long long v12 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t started = IOABPClass::start_nl(a1, a2, 0, a3, a4, a5, a6);
  pthread_mutex_unlock(v12);
  return started;
}

uint64_t ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke(uint64_t result, uint64_t a2, int a3, unsigned int *a4)
{
  if (a3 == -469794559)
  {
    uint64_t result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *a4, a4[2], a4[4]);
    }
  }
  return result;
}

void IOABPClass::setNotificationPort(IOABPClass *this)
{
  if (!*((void *)this + 12))
  {
    BOOL v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    *((void *)this + 12) = v2;
    if (!v2) {
      IOABPClass::setNotificationPort();
    }
    if (*((void *)this + 10))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v2);
      *((void *)this + 13) = RunLoopSource;
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 10), RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    }
    CFDictionaryRef v4 = *((void *)this + 11);
    if (v4)
    {
      uint64_t v5 = (IONotificationPort *)*((void *)this + 12);
      IONotificationPortSetDispatchQueue(v5, v4);
    }
  }
}

uint64_t ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_2(uint64_t a1, io_iterator_t iterator)
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

void IOABPClass::interfaceMatched(IOABPClass *this, void *a2)
{
  _Block_copy(this);
  (*((void (**)(IOABPClass *, void *))this + 2))(this, a2);

  _Block_release(this);
}

uint64_t ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  io_object_t v2 = *(_DWORD *)(a1 + 40);

  return IOObjectRelease(v2);
}

uint64_t ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_4(uint64_t a1, io_iterator_t iterator)
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

uint64_t ___ZN10IOABPClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv12abpErrorTypejiE_block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  io_object_t v2 = *(_DWORD *)(a1 + 40);

  return IOObjectRelease(v2);
}

uint64_t IOABPClass::close_nl(IOABPClass *this)
{
  if (*((unsigned char *)this + 160))
  {
    *((unsigned char *)this + 160) = 0;
    uint64_t v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 39), 1u, 0, 0, 0, 0);
    io_connect_t v3 = *((_DWORD *)this + 39);
    if (v3)
    {
      IOServiceClose(v3);
      *((_DWORD *)this + 39) = 0;
    }
    io_object_t v4 = *((_DWORD *)this + 38);
    if (v4)
    {
      IOObjectRelease(v4);
      *((_DWORD *)this + 38) = 0;
    }
  }
  else
  {
    if ((*((unsigned char *)this + 8) & 2) != 0) {
      syslog(5, "IOABPClass::%s: not open, return success\n", "close_nl");
    }
    return 0;
  }
  return v2;
}

uint64_t IOABPClass::clearIterators(IOABPClass *this)
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

void IOABPClass::clearNotificationPort(IOABPClass *this)
{
  io_object_t v2 = (void *)((char *)this + 96);
  uint64_t v1 = *((void *)this + 12);
  if (v1)
  {
    io_object_t v4 = (__CFRunLoop *)*((void *)this + 10);
    uint64_t v5 = *((void *)this + 13);
    uint64_t v6 = MEMORY[0x263EF8330];
    void *v2 = 0;
    v2[1] = 0;
    block[0] = v6;
    block[1] = 0x40000000;
    block[2] = ___ZN10IOABPClass21clearNotificationPortEv_block_invoke;
    block[3] = &__block_descriptor_tmp_28;
    void block[4] = v4;
    void block[5] = v5;
    void block[6] = v1;
    if (v4)
    {
      if (*((void *)this + 11)) {
        IOABPClass::clearNotificationPort();
      }
      CFRunLoopPerformBlock(v4, (CFTypeRef)*MEMORY[0x263EFFE88], block);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 10));
    }
    uint64_t v7 = *((void *)this + 11);
    if (v7)
    {
      if (*((void *)this + 10)) {
        IOABPClass::clearNotificationPort();
      }
      dispatch_async(v7, block);
    }
  }
}

void ___ZN10IOABPClass4stopEP16dispatch_group_s_block_invoke(void *a1)
{
  io_object_t v2 = (const void *)a1[4];
  if (v2) {
    _Block_release(v2);
  }
  io_connect_t v3 = (const void *)a1[5];
  if (v3) {
    _Block_release(v3);
  }
  io_object_t v4 = (const void *)a1[6];
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

void ___ZN10IOABPClass21clearNotificationPortEv_block_invoke(__CFRunLoop **a1)
{
  io_object_t v2 = a1[4];
  if (v2) {
    CFRunLoopRemoveSource(v2, a1[5], (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  }
  io_connect_t v3 = a1[6];

  IONotificationPortDestroy(v3);
}

uint64_t IOABPClass::open(IOABPClass *this, io_service_t a2)
{
  io_object_t v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: \n", "open");
  }
  uint64_t v5 = IOABPClass::open_nl((io_connect_t *)this, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOABPClass::open_nl(io_connect_t *this, io_service_t a2)
{
  uint64_t v2 = 0;
  uint32_t outputCnt = 0;
  uint64_t v8 = 0;
  if (!*((unsigned char *)this + 160))
  {
    if (IOABPClass::setUpNotificationCallback((IOABPClass *)this, a2))
    {
      uint64_t v2 = IOServiceOpen(a2, *MEMORY[0x263EF8960], 0, this + 39);
      if (!v2)
      {
        uint64_t v2 = IOConnectCallScalarMethod(this[39], 0, &v8, 1u, 0, &outputCnt);
        if (!v2)
        {
          *((unsigned char *)this + 160) = 1;
          return v2;
        }
      }
    }
    else
    {
      uint64_t v2 = 3758097112;
    }
    io_connect_t v5 = this[39];
    if (v5)
    {
      IOServiceClose(v5);
      this[39] = 0;
    }
    io_object_t v6 = this[38];
    if (v6)
    {
      IOObjectRelease(v6);
      this[38] = 0;
    }
  }
  return v2;
}

BOOL IOABPClass::setUpNotificationCallback(IOABPClass *this, io_service_t a2)
{
  kern_return_t v3;
  kern_return_t v4;

  io_connect_t v3 = IOServiceAddInterestNotification(*((IONotificationPortRef *)this + 12), a2, "IOGeneralInterest", (IOServiceInterestCallback)IOABPClass::notificationCallback, *((void **)this + 18), (io_object_t *)this + 38);
  io_object_t v4 = v3;
  if (v3 && (*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: Could not add interest notification on service: %#x\n", "setUpNotificationCallback", v3);
  }
  return v4 == 0;
}

uint64_t IOABPClass::cleanUpNotificationCallback(IOABPClass *this)
{
  uint64_t result = *((unsigned int *)this + 38);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 38) = 0;
  }
  return result;
}

uint64_t IOABPClass::close(IOABPClass *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: \n", "close");
  }
  uint64_t v3 = IOABPClass::close_nl(this);
  pthread_mutex_unlock(v2);
  return v3;
}

void IOABPClass::notificationCallback(IOABPClass *this, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  _Block_copy(this);
  (*((void (**)(IOABPClass *, void *, uint64_t, uint64_t))this + 2))(this, a2, a3, a4);

  _Block_release(this);
}

uint64_t IOABPClass::write(IOABPClass *this, const void *a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  io_object_t v6 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: buff %p, size %u\n", "write", a2, a3);
  }
  input[0] = 0;
  input[1] = 0;
  uint64_t v7 = IOConnectCallMethod(*((_DWORD *)this + 39), 2u, input, 2u, a2, a3, 0, 0, 0, 0);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t IOABPClass::read(IOABPClass *this, void *a2, unsigned int *a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  io_object_t v6 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: buff %p, size %u\n", "read", a2, *a3);
  }
  input[0] = 0;
  input[1] = 0;
  size_t outputStructCnt = *a3;
  uint64_t v7 = IOConnectCallMethod(*((_DWORD *)this + 39), 3u, input, 2u, 0, 0, 0, 0, a2, &outputStructCnt);
  if (!v7) {
    *a3 = outputStructCnt;
  }
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t IOABPClass::sendImage(IOABPClass *this, const void *a2, unsigned int a3, unsigned int *a4)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint32_t outputCnt = 2;
  uint64_t v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: buff %p, size %u\n", "sendImage", a2, a3);
  }
  input[0] = 0;
  input[1] = 0;
  uint64_t output = 0;
  uint64_t v13 = 0;
  uint64_t v9 = IOConnectCallMethod(*((_DWORD *)this + 39), 4u, input, 2u, a2, a3, &output, &outputCnt, 0, 0);
  if (!v9)
  {
    *a4 = output;
    uint64_t v9 = v13;
  }
  if ((*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: ret 0x%x, buff %p, size %u, cookie %u\n", "sendImage", v9, a2, a3, *a4);
  }
  pthread_mutex_unlock(v8);
  return v9;
}

uint64_t IOABPClass::sendImageAsync(IOABPClass *this, const void *a2, unsigned int a3, void (*a4)(void *, int, void *, void *), void *a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v22 = v10;
  long long v23 = v10;
  *(_OWORD *)reference = v10;
  long long v21 = v10;
  uint32_t outputCnt = 2;
  char v11 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: buff %p, size %u\n", "sendImageAsync", a2, a3);
  }
  long long v12 = (IONotificationPort *)*((void *)this + 12);
  if (v12)
  {
    input[0] = (uint64_t)a2;
    input[1] = a3;
    output[0] = 0;
    output[1] = 0;
    reference[1] = (uint64_t)a4;
    *(void *)&long long v21 = a5;
    mach_port_t v13 = *((_DWORD *)this + 39);
    mach_port_t MachPort = IONotificationPortGetMachPort(v12);
    uint64_t v15 = IOConnectCallAsyncScalarMethod(v13, 4u, MachPort, reference, 3u, input, 2u, output, &outputCnt);
    pthread_mutex_unlock(v11);
  }
  else
  {
    if ((*((unsigned char *)this + 8) & 2) != 0) {
      syslog(5, "IOABPClass::%s: no async port\n", "sendImageAsync");
    }
    pthread_mutex_unlock(v11);
    return 3758097112;
  }
  return v15;
}

uint64_t IOABPClass::readRegister(IOABPClass *this, unsigned int a2, void *a3, unsigned int *a4)
{
  input[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: reg %u, buff %p, size %u\n", "readRegister", a2, a3, *a4);
  }
  size_t v11 = *a4;
  input[0] = a2;
  uint64_t v9 = IOConnectCallMethod(*((_DWORD *)this + 39), 5u, input, 1u, 0, 0, 0, 0, a3, &v11);
  if (!v9) {
    *a4 = v11;
  }
  pthread_mutex_unlock(v8);
  return v9;
}

uint64_t IOABPClass::abortChannelAsync(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v19 = v8;
  long long v20 = v8;
  *(_OWORD *)reference = v8;
  long long v18 = v8;
  uint64_t v9 = (pthread_mutex_t *)(a1 + 16);
  input[1] = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if ((*(unsigned char *)(a1 + 8) & 2) != 0)
  {
    if (a2 > 1) {
      long long v10 = "invalid";
    }
    else {
      long long v10 = abpDirectionStrings[a2];
    }
    syslog(5, "IOABPClass::%s: direction %s\n", "abortChannelAsync", v10);
  }
  size_t v11 = *(IONotificationPort **)(a1 + 96);
  if (v11)
  {
    input[0] = a2;
    reference[1] = a3;
    *(void *)&long long v18 = a4;
    mach_port_t v12 = *(_DWORD *)(a1 + 156);
    mach_port_t MachPort = IONotificationPortGetMachPort(v11);
    uint64_t v14 = IOConnectCallAsyncScalarMethod(v12, 6u, MachPort, reference, 3u, input, 1u, 0, 0);
    pthread_mutex_unlock(v9);
  }
  else
  {
    if ((*(unsigned char *)(a1 + 8) & 2) != 0) {
      syslog(5, "IOABPClass::%s: no async port\n", "abortChannelAsync");
    }
    pthread_mutex_unlock(v9);
    return 3758097112;
  }
  return v14;
}

uint64_t IOABPClass::startChannelAsync(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v19 = v8;
  long long v20 = v8;
  *(_OWORD *)reference = v8;
  long long v18 = v8;
  uint64_t v9 = (pthread_mutex_t *)(a1 + 16);
  input[1] = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if ((*(unsigned char *)(a1 + 8) & 2) != 0)
  {
    if (a2 > 1) {
      long long v10 = "invalid";
    }
    else {
      long long v10 = abpDirectionStrings[a2];
    }
    syslog(5, "IOABPClass::%s: direction %s\n", "startChannelAsync", v10);
  }
  size_t v11 = *(IONotificationPort **)(a1 + 96);
  if (v11)
  {
    input[0] = a2;
    reference[1] = a3;
    *(void *)&long long v18 = a4;
    mach_port_t v12 = *(_DWORD *)(a1 + 156);
    mach_port_t MachPort = IONotificationPortGetMachPort(v11);
    uint64_t v14 = IOConnectCallAsyncScalarMethod(v12, 7u, MachPort, reference, 3u, input, 1u, 0, 0);
    pthread_mutex_unlock(v9);
  }
  else
  {
    if ((*(unsigned char *)(a1 + 8) & 2) != 0) {
      syslog(5, "IOABPClass::%s: no async port\n", "startChannelAsync");
    }
    pthread_mutex_unlock(v9);
    return 3758097112;
  }
  return v14;
}

uint64_t IOABPClass::timeSyncAsync(IOABPClass *this, unsigned int a2, void *a3, unsigned int a4, void (*a5)(void *, int, void *), void *a6)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v22 = v12;
  long long v23 = v12;
  *(_OWORD *)reference = v12;
  long long v21 = v12;
  mach_port_t v13 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: buff %p, size %u\n", "timeSyncAsync", a3, a4);
  }
  uint64_t v14 = (IONotificationPort *)*((void *)this + 12);
  if (v14)
  {
    input[0] = a2;
    input[1] = (uint64_t)a3;
    uint64_t input[2] = a4;
    reference[1] = (uint64_t)a5;
    *(void *)&long long v21 = a6;
    mach_port_t v15 = *((_DWORD *)this + 39);
    mach_port_t MachPort = IONotificationPortGetMachPort(v14);
    uint64_t v17 = IOConnectCallAsyncScalarMethod(v15, 8u, MachPort, reference, 3u, input, 3u, 0, 0);
    pthread_mutex_unlock(v13);
  }
  else
  {
    if ((*((unsigned char *)this + 8) & 2) != 0) {
      syslog(5, "IOABPClass::%s: no async port\n", "timeSyncAsync");
    }
    pthread_mutex_unlock(v13);
    return 3758097112;
  }
  return v17;
}

uint64_t IOABPClass::mapMemoryAsync(IOABPClass *this, unsigned int a2, uint64_t a3, unsigned int a4, void (*a5)(void *, int), void *a6)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v18 = v7;
  long long v19 = v7;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a4;
  reference[1] = (uint64_t)a5;
  CFStringRef v16 = a6;
  if ((*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: region %u, size %u\n", "mapMemoryAsync", a2, a4);
  }
  long long v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  uint64_t v9 = (IONotificationPort *)*((void *)this + 12);
  if (v9)
  {
    mach_port_t v10 = *((_DWORD *)this + 39);
    mach_port_t MachPort = IONotificationPortGetMachPort(v9);
    uint64_t v12 = IOConnectCallAsyncScalarMethod(v10, 9u, MachPort, reference, 3u, input, 3u, 0, 0);
    pthread_mutex_unlock(v8);
  }
  else
  {
    if ((*((unsigned char *)this + 8) & 2) != 0) {
      syslog(5, "IOABPClass::%s: no async port\n", "mapMemoryAsync");
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
    return 3758097112;
  }
  return v12;
}

uint64_t IOABPClass::unmapMemoryAsync(IOABPClass *this, unsigned int a2, void (*a3)(void *, int), void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v16 = v5;
  long long v17 = v5;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t input = a2;
  reference[1] = (uint64_t)a3;
  uint64_t v14 = a4;
  if ((*((unsigned char *)this + 8) & 2) != 0) {
    syslog(5, "IOABPClass::%s: region %u\n", "unmapMemoryAsync", a2);
  }
  io_object_t v6 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  long long v7 = (IONotificationPort *)*((void *)this + 12);
  if (v7)
  {
    mach_port_t v8 = *((_DWORD *)this + 39);
    mach_port_t MachPort = IONotificationPortGetMachPort(v7);
    uint64_t v10 = IOConnectCallAsyncScalarMethod(v8, 0xAu, MachPort, reference, 3u, &input, 1u, 0, 0);
    pthread_mutex_unlock(v6);
  }
  else
  {
    if ((*((unsigned char *)this + 8) & 2) != 0) {
      syslog(5, "IOABPClass::%s: no async port\n", "unmapMemoryAsync");
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
    return 3758097112;
  }
  return v10;
}

uint64_t IOABPClass::registerTimeEvent(IOABPClass *this, unsigned int a2, void (*a3)(void *, int, void **, unsigned int), void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  mach_port_t v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  uint64_t v9 = (IONotificationPort *)*((void *)this + 12);
  if (v9)
  {
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    long long v19 = v10;
    long long v20 = v10;
    uint64_t input = a2;
    reference[1] = (uint64_t)a3;
    long long v17 = a4;
    mach_port_t v11 = *((_DWORD *)this + 39);
    mach_port_t MachPort = IONotificationPortGetMachPort(v9);
    uint64_t v13 = IOConnectCallAsyncScalarMethod(v11, 0xBu, MachPort, reference, 3u, &input, 1u, 0, 0);
    pthread_mutex_unlock(v8);
  }
  else
  {
    pthread_mutex_unlock(v8);
    return 3758097112;
  }
  return v13;
}

uint64_t IOABPClass::deregisterTimeEvent(IOABPClass *this, unsigned int a2, void (*a3)(void *, int), void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  mach_port_t v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  uint64_t v9 = (IONotificationPort *)*((void *)this + 12);
  if (v9)
  {
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    long long v19 = v10;
    long long v20 = v10;
    uint64_t input = a2;
    reference[1] = (uint64_t)a3;
    long long v17 = a4;
    mach_port_t v11 = *((_DWORD *)this + 39);
    mach_port_t MachPort = IONotificationPortGetMachPort(v9);
    uint64_t v13 = IOConnectCallAsyncScalarMethod(v11, 0xCu, MachPort, reference, 3u, &input, 1u, 0, 0);
    pthread_mutex_unlock(v8);
  }
  else
  {
    pthread_mutex_unlock(v8);
    return 3758097112;
  }
  return v13;
}

void IOABPTraceClass::IOABPTraceClass(IOABPTraceClass *this)
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

void IOABPTraceClass::~IOABPTraceClass(IOABPTraceClass *this)
{
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPTraceClass::%s: \n", "~IOABPTraceClass");
  }
  IOABPTraceClass::stop((io_object_t *)this);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 8));
}

uint64_t IOABPTraceClass::stop(io_object_t *this)
{
  uint64_t v2 = (pthread_mutex_t *)(this + 2);
  pthread_mutex_lock((pthread_mutex_t *)(this + 2));
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPTraceClass::%s: \n", "stop");
  }
  IOABPTraceClass::closeService((IOABPTraceClass *)this);
  io_object_t v3 = this[18];
  if (v3)
  {
    IOObjectRelease(v3);
    this[18] = 0;
  }
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPTraceClass::%s: --done\n", "stop");
  }
  pthread_mutex_unlock(v2);
  return 1;
}

uint64_t IOABPTraceClass::start(IOABPTraceClass *this, __CFRunLoop *a2)
{
  io_object_t v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  uint64_t v5 = IOABPTraceClass::connect(this, a2, 0);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOABPTraceClass::connect(IOABPTraceClass *this, __CFRunLoop *a2, NSObject *a3)
{
  if (*((_DWORD *)this + 18))
  {
LABEL_2:
    uint64_t v4 = 1;
    goto LABEL_14;
  }
  CFDictionaryRef v7 = IOServiceMatching("AppleBasebandPCITraceBackendRaw");
  if (!v7)
  {
    if ((*(unsigned char *)this & 2) != 0) {
      syslog(5, "IOABPTraceClass::%s: could not create matching dictionary\n");
    }
    goto LABEL_13;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v7);
  *((_DWORD *)this + 18) = MatchingService;
  if (!MatchingService)
  {
    if ((*(unsigned char *)this & 2) != 0) {
      syslog(5, "IOABPTraceClass::%s: could not get matching service\n");
    }
LABEL_13:
    uint64_t v4 = 0;
    goto LABEL_14;
  }
  if (!IOABPTraceClass::openService(this))
  {
    if (a2)
    {
      if (a3) {
        IOABPTraceClass::connect();
      }
      *((void *)this + 11) = a2;
      CFRetain(a2);
    }
    else if (a3)
    {
      *((void *)this + 12) = a3;
      dispatch_retain(a3);
    }
    IOABPTraceClass::setNotificationPort(this);
    goto LABEL_2;
  }
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPTraceClass::%s: could not open service\n", "connect");
  }
  IOObjectRelease(*((_DWORD *)this + 18));
  uint64_t v4 = 0;
  *((_DWORD *)this + 18) = 0;
LABEL_14:
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPTraceClass::%s: --done\n", "connect");
  }
  return v4;
}

uint64_t IOABPTraceClass::start(IOABPTraceClass *this, NSObject *a2)
{
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  uint64_t v5 = IOABPTraceClass::connect(this, 0, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOABPTraceClass::openService(IOABPTraceClass *this)
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
  return v3;
}

void IOABPTraceClass::setNotificationPort(IOABPTraceClass *this)
{
  if (!*((void *)this + 13))
  {
    io_registry_entry_t v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    *((void *)this + 13) = v2;
    if (!v2) {
      IOABPTraceClass::setNotificationPort();
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

uint64_t IOABPTraceClass::closeService(IOABPTraceClass *this)
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
  IOABPTraceClass::clearNotificationPort(this);
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

void IOABPTraceClass::clearNotificationPort(IOABPTraceClass *this)
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

const __CFArray *IOABPTraceClass::getPipeCount(IOABPTraceClass *this)
{
  CFArrayRef result = (const __CFArray *)*((void *)this + 10);
  if (result) {
    return (const __CFArray *)CFArrayGetCount(result);
  }
  return result;
}

uint64_t IOABPTraceClass::getPipeCodeAndName(IOABPTraceClass *this, unsigned int a2, unsigned int *a3, char *a4, unsigned int a5)
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

uint64_t IOABPTraceClass::openPipe(IOABPTraceClass *this)
{
  io_registry_entry_t v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPTraceClass::%s: \n", "openPipe");
  }
  pthread_mutex_unlock(v2);
  return 0;
}

uint64_t IOABPTraceClass::closePipe(IOABPTraceClass *this)
{
  io_registry_entry_t v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPTraceClass::%s: \n", "closePipe");
  }
  pthread_mutex_unlock(v2);
  return 0;
}

BOOL IOABPTraceClass::getSnapshotBufferSize(IOABPTraceClass *this, unsigned int *a2)
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

uint64_t IOABPTraceClass::readLogsAsync(IOABPTraceClass *this, unsigned int a2, void *a3, unsigned int a4, unsigned int a5, void (*a6)(void *, int, void *), void *a7)
{
  input[4] = *MEMORY[0x263EF8340];
  CFStringRef v14 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 4) != 0) {
    syslog(5, "IOABPTraceClass::%s: buff %p, size %u\n", "readLogsAsync", a3, a4);
  }
  unint64_t v15 = (IONotificationPort *)*((void *)this + 13);
  if (v15)
  {
    input[0] = a2;
    input[1] = (uint64_t)a3;
    uint64_t input[2] = a4;
    uint64_t input[3] = a5;
    *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v16;
    long long v25 = v16;
    reference[1] = (uint64_t)a6;
    long long v22 = a7;
    mach_port_t v17 = *((_DWORD *)this + 19);
    mach_port_t MachPort = IONotificationPortGetMachPort(v15);
    uint64_t v19 = IOConnectCallAsyncScalarMethod(v17, 0, MachPort, reference, 3u, input, 4u, 0, 0);
    pthread_mutex_unlock(v14);
  }
  else
  {
    if ((*(unsigned char *)this & 2) != 0) {
      syslog(5, "IOABPTraceClass::%s: no async port\n", "readLogsAsync");
    }
    pthread_mutex_unlock(v14);
    return 3758097112;
  }
  return v19;
}

uint64_t IOABPTraceClass::dumpRegistry(IOABPTraceClass *this)
{
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPTraceClass::%s: \n", "dumpRegistry");
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
    if ((*(unsigned char *)this & 2) != 0) {
      syslog(5, "IOABPTraceClass::%s: no connection\n", "dumpRegistry");
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
  return v3;
}

uint64_t IOABPTraceClass::flushTraceBuffers(IOABPTraceClass *this, unsigned int a2, unsigned int a3, void (*a4)(void *, int, void *), void *a5)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPTraceClass::%s: \n", "flushTraceBuffers");
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
    if ((*(unsigned char *)this & 2) != 0) {
      syslog(5, "IOABPTraceClass::%s: no connection\n", "flushTraceBuffers");
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
    return 3758097112;
  }
  return v14;
}

uint64_t IOABPTraceClass::demo(IOABPTraceClass *this)
{
  if ((*(unsigned char *)this & 2) != 0) {
    syslog(5, "IOABPTraceClass::%s: \n", "demo");
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
    if ((*(unsigned char *)this & 2) != 0) {
      syslog(5, "IOABPTraceClass::%s: no connection\n", "demo");
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 8));
  return v3;
}

BOOL IOABPTraceClass::getRegistryInfo(uint64_t a1, void *a2)
{
  kern_return_t v5;
  size_t outputStructCnt;

  if ((*(unsigned char *)a1 & 2) != 0) {
    syslog(5, "IOABPTraceClass::%s: \n", "getRegistryInfo");
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  mach_port_t v4 = *(_DWORD *)(a1 + 76);
  if (v4)
  {
    size_t outputStructCnt = 36;
    uint64_t v5 = IOConnectCallStructMethod(v4, 3u, 0, 0, a2, &outputStructCnt);
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    return v5 == 0;
  }
  else
  {
    if ((*(unsigned char *)a1 & 2) != 0) {
      syslog(5, "IOABPTraceClass::%s: no connection\n", "getRegistryInfo");
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    return 0;
  }
}

BOOL IOABPTraceClass::getTraceCode(uint64_t a1, unsigned int a2, uint64_t a3)
{
  input[1] = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)a1 & 2) != 0) {
    syslog(5, "IOABPTraceClass::%s: \n", "getTraceCode");
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  mach_port_t v6 = *(_DWORD *)(a1 + 76);
  if (v6)
  {
    CFDictionaryRef v7 = operator new(0x808uLL);
    v7[1] = 0;
    v7[2] = 0;
    *CFDictionaryRef v7 = &unk_26C9AB5B8;
    io_object_t v26 = (pthread_mutex_t *)(a1 + 8);
    v27 = v7;
    outputStruct = v7 + 3;
    bzero(v7 + 3, 0x7ECuLL);
    size_t v31 = 2028;
    std::string::size_type v9 = a2;
    input[0] = a2;
    if (IOConnectCallMethod(v6, 4u, input, 1u, 0, 0, 0, 0, outputStruct, &v31))
    {
      if ((*(unsigned char *)a1 & 2) != 0) {
        syslog(5, "IOABPTraceClass::%s: TraceCode invalid\n", "getTraceCode");
      }
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
      BOOL v10 = 0;
    }
    else
    {
      *(_DWORD *)(a3 + 48) = *((_DWORD *)v27 + 7);
      MEMORY[0x21D46C8E0](a3, (char *)v27 + 44);
      long long v11 = v27;
      if (*((unsigned char *)v27 + 1044))
      {
        std::string::basic_string[abi:ne180100]<0>(&v32, ":");
        CFDictionaryRef v12 = std::string::insert(&v32, 0, (const std::string::value_type *)v27 + 1044);
        long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
        v28.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v13;
        v12->__r_.__value_.__l.__size_ = 0;
        v12->__r_.__value_.__r.__words[2] = 0;
        v12->__r_.__value_.__r.__words[0] = 0;
        std::to_string(&v30, *((_DWORD *)v27 + 511));
        if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v14 = &v30;
        }
        else {
          uint64_t v14 = (std::string *)v30.__r_.__value_.__r.__words[0];
        }
        if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v30.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v30.__r_.__value_.__l.__size_;
        }
        long long v16 = std::string::append(&v28, (const std::string::value_type *)v14, size);
        std::string::size_type v17 = v16->__r_.__value_.__r.__words[0];
        v33[0] = v16->__r_.__value_.__l.__size_;
        *(void *)((char *)v33 + 7) = *(std::string::size_type *)((char *)&v16->__r_.__value_.__r.__words[1] + 7);
        char v18 = HIBYTE(v16->__r_.__value_.__r.__words[2]);
        v16->__r_.__value_.__l.__size_ = 0;
        v16->__r_.__value_.__r.__words[2] = 0;
        v16->__r_.__value_.__r.__words[0] = 0;
        if (*(char *)(a3 + 47) < 0) {
          operator delete(*(void **)(a3 + 24));
        }
        uint64_t v19 = v33[0];
        *(void *)(a3 + 24) = v17;
        *(void *)(a3 + 32) = v19;
        *(void *)(a3 + 39) = *(void *)((char *)v33 + 7);
        *(unsigned char *)(a3 + 47) = v18;
        if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v30.__r_.__value_.__l.__data_);
        }
        long long v11 = v27;
        if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v28.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v32.__r_.__value_.__l.__data_);
        }
      }
      std::vector<IOABPTraceCodeAttachment const>::__clear[abi:ne180100]((uint64_t *)(a3 + 56));
      std::string::size_type v20 = *((unsigned int *)v11 + 8);
      if (v20)
      {
        uint64_t v21 = (char *)operator new(0x118uLL);
        std::string::size_type v22 = 0;
        BOOL v10 = 0;
        *((void *)v21 + 1) = 0;
        *((void *)v21 + 2) = 0;
        *(void *)uint64_t v21 = &unk_26C9AB608;
        *(_OWORD *)(v21 + 24) = 0u;
        *(_OWORD *)(v21 + 40) = 0u;
        *(_OWORD *)(v21 + 56) = 0u;
        *(_OWORD *)(v21 + 72) = 0u;
        *(_OWORD *)(v21 + 88) = 0u;
        *(_OWORD *)(v21 + 104) = 0u;
        *(_OWORD *)(v21 + 120) = 0u;
        *(_OWORD *)(v21 + 136) = 0u;
        *(_OWORD *)(v21 + 152) = 0u;
        *(_OWORD *)(v21 + 168) = 0u;
        *(_OWORD *)(v21 + 184) = 0u;
        *(_OWORD *)(v21 + 200) = 0u;
        *(_OWORD *)(v21 + 216) = 0u;
        *(_OWORD *)(v21 + 232) = 0u;
        *(_OWORD *)(v21 + 248) = 0u;
        size_t v31 = 256;
        *(_OWORD *)(v21 + 264) = 0u;
        while (1)
        {
          v32.__r_.__value_.__r.__words[0] = v9;
          v32.__r_.__value_.__l.__size_ = v22;
          if (IOConnectCallMethod(*(_DWORD *)(a1 + 76), 5u, (const uint64_t *)&v32, 2u, 0, 0, 0, 0, v21 + 24, &v31))
          {
            break;
          }
          std::string::basic_string[abi:ne180100]<0>(&v28, v21 + 28);
          int v29 = *((_DWORD *)v21 + 67);
          unint64_t v23 = *(void *)(a3 + 64);
          if (v23 >= *(void *)(a3 + 72))
          {
            uint64_t v24 = std::vector<IOABPTraceCodeAttachment const>::__push_back_slow_path<IOABPTraceCodeAttachment const>((uint64_t *)(a3 + 56), (long long *)&v28);
          }
          else
          {
            std::vector<IOABPTraceCodeAttachment const>::__construct_one_at_end[abi:ne180100]<IOABPTraceCodeAttachment const>(a3 + 56, (long long *)&v28);
            uint64_t v24 = v23 + 32;
          }
          *(void *)(a3 + 64) = v24;
          if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v28.__r_.__value_.__l.__data_);
          }
          BOOL v10 = ++v22 >= v20;
          if (v20 == v22)
          {
            pthread_mutex_unlock(v26);
            BOOL v10 = 1;
            goto LABEL_38;
          }
        }
        pthread_mutex_unlock(v26);
LABEL_38:
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v21);
      }
      else
      {
        pthread_mutex_unlock(v26);
        BOOL v10 = 1;
      }
    }
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v27);
  }
  else
  {
    if ((*(unsigned char *)a1 & 2) != 0) {
      syslog(5, "IOABPTraceClass::%s: no connection\n", "getTraceCode");
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    return 0;
  }
  return v10;
}

void sub_218585A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__shared_ptr_emplace<ABPTraceRegistryTracePoint>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AB5B8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ABPTraceRegistryTracePoint>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AB5B8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D46C950);
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
  __cxa_throw(exception, (struct type_info *)off_264328D68, MEMORY[0x263F8C060]);
}

void sub_218585D5C(_Unwind_Exception *a1)
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

void std::vector<IOABPTraceCodeAttachment const>::__clear[abi:ne180100](uint64_t *a1)
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

void std::__shared_ptr_emplace<ABPTraceRegistryAttachment>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AB608;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ABPTraceRegistryAttachment>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AB608;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D46C950);
}

void std::vector<IOABPTraceCodeAttachment const>::__construct_one_at_end[abi:ne180100]<IOABPTraceCodeAttachment const>(uint64_t a1, long long *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    *(void *)(v4 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v4 = v5;
  }
  *(_DWORD *)(v4 + 24) = *((_DWORD *)a2 + 6);
  *(void *)(a1 + 8) = v4 + 32;
}

void sub_218585ED8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<IOABPTraceCodeAttachment const>::__push_back_slow_path<IOABPTraceCodeAttachment const>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 5;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 59) {
    std::vector<IOABPTraceCodeAttachment const>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 4 > v5) {
    unint64_t v5 = v8 >> 4;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0) {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  char v18 = a1 + 2;
  if (v9) {
    BOOL v10 = std::__allocate_at_least[abi:ne180100]<std::allocator<IOABPTraceCodeAttachment const>>(v7, v9);
  }
  else {
    BOOL v10 = 0;
  }
  long long v11 = (std::string *)&v10[8 * v4];
  v15[0] = v10;
  v15[1] = v11;
  long long v16 = v11;
  std::string::size_type v17 = (char *)&v10[8 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    long long v11 = v16;
  }
  else
  {
    long long v12 = *a2;
    v11->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  v10[8 * v4 + 6] = *((_DWORD *)a2 + 6);
  long long v16 = (std::string *)((char *)v11 + 32);
  std::vector<IOABPTraceCodeAttachment const>::__swap_out_circular_buffer(a1, v15);
  uint64_t v13 = a1[1];
  std::__split_buffer<IOABPTraceCodeAttachment const>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_218585FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  unint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    unint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t std::vector<IOABPTraceCodeAttachment const>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<IOABPTraceCodeAttachment const>,std::reverse_iterator<IOABPTraceCodeAttachment const*>,std::reverse_iterator<IOABPTraceCodeAttachment const*>,std::reverse_iterator<IOABPTraceCodeAttachment const*>>((uint64_t)(a1 + 2), a1[1], (long long *)a1[1], *a1, (long long *)*a1, a2[1], a2[1]);
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

void std::vector<IOABPTraceCodeAttachment const>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<IOABPTraceCodeAttachment const>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<IOABPTraceCodeAttachment const>,std::reverse_iterator<IOABPTraceCodeAttachment const*>,std::reverse_iterator<IOABPTraceCodeAttachment const*>,std::reverse_iterator<IOABPTraceCodeAttachment const*>>(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, long long *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v19 = a6;
  *((void *)&v19 + 1) = a7;
  long long v18 = v19;
  v16[0] = a1;
  v16[1] = &v18;
  v16[2] = &v19;
  unint64_t v17 = 0xAAAAAAAAAAAAAA00;
  if (a3 == a5)
  {
    uint64_t v14 = a6;
  }
  else
  {
    unint64_t v9 = (const std::string::value_type **)a3;
    do
    {
      BOOL v10 = (std::string *)(v7 - 32);
      long long v11 = (long long *)(v9 - 4);
      if (*((char *)v9 - 9) < 0)
      {
        std::string::__init_copy_ctor_external(v10, *(v9 - 4), (std::string::size_type)*(v9 - 3));
        uint64_t v13 = *((void *)&v19 + 1);
      }
      else
      {
        long long v12 = *v11;
        *(void *)(v7 - 16) = *(v9 - 2);
        *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v12;
        uint64_t v13 = v7;
      }
      *(_DWORD *)(v7 - 8) = *((_DWORD *)v9 - 2);
      uint64_t v7 = v13 - 32;
      *((void *)&v19 + 1) = v13 - 32;
      v9 -= 4;
    }
    while (v11 != a5);
    uint64_t v14 = v19;
  }
  LOBYTE(v17) = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<IOABPTraceCodeAttachment const>,std::reverse_iterator<IOABPTraceCodeAttachment const*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v16);
  return v14;
}

void sub_218586238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<IOABPTraceCodeAttachment const>,std::reverse_iterator<IOABPTraceCodeAttachment const*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<IOABPTraceCodeAttachment const>,std::reverse_iterator<IOABPTraceCodeAttachment const*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<IOABPTraceCodeAttachment const>,std::reverse_iterator<IOABPTraceCodeAttachment const*>>::operator()[abi:ne180100](uint64_t a1)
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

uint64_t std::__split_buffer<IOABPTraceCodeAttachment const>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<IOABPTraceCodeAttachment const>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
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

void IOABPControlClass::deregisterEventNotification_nl()
{
}

void IOABPControlClass::setNotificationPort()
{
}

void IOABPControlClass::setEventNotificationPort()
{
}

void IOABPControlClass::clearEventNotificationPort()
{
}

{
  __assert_rtn("clearEventNotificationPort", "IOABPControlClass.cpp", 213, "!fEventQueue");
}

void IOABPControlClass::open_nl()
{
}

void IOABPControlClass::registerEventNotification_nl()
{
}

void IOABPClass::stop()
{
}

void IOABPClass::start_nl()
{
}

{
  __assert_rtn("start_nl", "IOABPClass.cpp", 341, "!fQueue");
}

{
  __assert_rtn("start_nl", "IOABPClass.cpp", 290, "!fRunLoopRef");
}

{
  __assert_rtn("start_nl", "IOABPClass.cpp", 284, "!fQueue");
}

{
  __assert_rtn("start_nl", "IOABPClass.cpp", 202, "!queue");
}

void IOABPClass::setNotificationPort()
{
}

void IOABPClass::clearNotificationPort()
{
}

{
  __assert_rtn("clearNotificationPort", "IOABPClass.cpp", 516, "!fQueue");
}

void IOABPTraceClass::connect()
{
}

void IOABPTraceClass::setNotificationPort()
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}