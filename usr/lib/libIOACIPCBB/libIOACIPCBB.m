void IOACIPCBBClass::~IOACIPCBBClass(IOACIPCBBClass *this)
{
  const void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26DDDBDE0;
  IOACIPCClass::stop(this, 0);
  v2 = (const void *)*((void *)this + 23);
  if (v2)
  {
    _Block_release(v2);
    *((void *)this + 23) = 0;
  }

  MEMORY[0x270F92340](this);
}

{
  uint64_t vars8;

  IOACIPCBBClass::~IOACIPCBBClass(this);

  JUMPOUT(0x22A6C3690);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t IOACIPCBBClass::openRing(IOACIPCClass *a1, int a2, int a3, void *a4)
{
  if (!a4) {
    return 3758097090;
  }
  IOACIPCClass::lock(a1);
  inputStruct[0] = a3;
  inputStruct[1] = a2;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  size_t v12 = 32;
  mach_port_t v8 = *((_DWORD *)a1 + 43);
  uint32_t v9 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)a1 + 224))(a1, 17);
  uint64_t v10 = IOConnectCallStructMethod(v8, v9, inputStruct, 0x18uLL, a4, &v12);
  IOACIPCClass::unlock(a1);
  return v10;
}

uint64_t IOACIPCBBClass::closeRing(IOACIPCClass *a1, int a2, int a3)
{
  IOACIPCClass::lock(a1);
  inputStruct[0] = a3;
  inputStruct[1] = a2;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  mach_port_t v6 = *((_DWORD *)a1 + 43);
  uint32_t v7 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)a1 + 224))(a1, 18);
  uint64_t v8 = IOConnectCallStructMethod(v6, v7, inputStruct, 0x18uLL, 0, 0);
  IOACIPCClass::unlock(a1);
  return v8;
}

uint64_t IOACIPCBBClass::enableRingEvents(uint64_t a1, uint64_t a2)
{
  uint64_t input = a2 != 0;
  IOACIPCClass::lock((IOACIPCClass *)a1);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
  v4 = *(const void **)(a1 + 184);
  if (v4)
  {
    _Block_release(v4);
    *(void *)(a1 + 184) = 0;
  }
  if (a2)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    v9[2] = ___ZN14IOACIPCBBClass16enableRingEventsEU13block_pointerFvvE_block_invoke;
    v9[3] = &unk_26486DBA8;
    v9[4] = a2;
    *(void *)(a1 + 184) = _Block_copy(v9);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  mach_port_t v5 = *(_DWORD *)(a1 + 172);
  uint32_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 224))(a1, 19);
  uint64_t v7 = IOConnectCallScalarMethod(v5, v6, &input, 1u, 0, 0);
  IOACIPCClass::unlock((IOACIPCClass *)a1);
  return v7;
}

uint64_t ___ZN14IOACIPCBBClass16enableRingEventsEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t IOACIPCBBClass::readIndexArrays(mach_port_t *this)
{
  IOACIPCClass::lock((IOACIPCClass *)this);
  mach_port_t v2 = this[43];
  uint32_t v3 = (*(uint64_t (**)(mach_port_t *, uint64_t))(*(void *)this + 224))(this, 20);
  uint64_t v4 = IOConnectCallStructMethod(v2, v3, 0, 0, 0, 0);
  IOACIPCClass::unlock((IOACIPCClass *)this);
  return v4;
}

uint64_t IOACIPCBBClass::updateIndexArrays(IOACIPCClass *a1, const void *a2)
{
  if (!a2) {
    return 3758097090;
  }
  IOACIPCClass::lock(a1);
  mach_port_t v4 = *((_DWORD *)a1 + 43);
  uint32_t v5 = (*(uint64_t (**)(IOACIPCClass *, uint64_t))(*(void *)a1 + 224))(a1, 21);
  uint64_t v6 = IOConnectCallStructMethod(v4, v5, a2, 0x68uLL, 0, 0);
  IOACIPCClass::unlock(a1);
  return v6;
}

uint64_t IOACIPCBBClass::mapUserMemory(mach_port_t *this, uint64_t a2, unsigned int a3, unint64_t *a4)
{
  input[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097090;
  if (a2 && a3)
  {
    IOACIPCClass::lock((IOACIPCClass *)this);
    input[0] = a2;
    input[1] = a3;
    uint32_t outputCnt = 1;
    mach_port_t v9 = this[43];
    uint32_t v10 = (*(uint64_t (**)(mach_port_t *, uint64_t))(*(void *)this + 224))(this, 22);
    uint64_t v4 = IOConnectCallScalarMethod(v9, v10, input, 2u, a4, &outputCnt);
    IOACIPCClass::unlock((IOACIPCClass *)this);
  }
  return v4;
}

uint64_t IOACIPCBBClass::unmapUserMemory(IOACIPCBBClass *this, uint64_t a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  if (!a2) {
    return 3758097090;
  }
  uint64_t v2 = a2;
  IOACIPCClass::lock(this);
  v7[0] = v2;
  LODWORD(v2) = *((_DWORD *)this + 43);
  uint32_t v4 = (*(uint64_t (**)(IOACIPCBBClass *, uint64_t))(*(void *)this + 224))(this, 23);
  uint64_t v5 = IOConnectCallScalarMethod(v2, v4, v7, 1u, 0, 0);
  IOACIPCClass::unlock(this);
  return v5;
}

uint64_t IOACIPCBBClass::mapIndexArrays(mach_port_t *this, uint64_t a2, int a3)
{
  input[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = 3758097090;
  if (a2 && a3 == 104)
  {
    IOACIPCClass::lock((IOACIPCClass *)this);
    input[0] = a2;
    input[1] = 104;
    mach_port_t v6 = this[43];
    uint32_t v7 = (*(uint64_t (**)(mach_port_t *, uint64_t))(*(void *)this + 224))(this, 24);
    uint64_t v3 = IOConnectCallScalarMethod(v6, v7, input, 2u, 0, 0);
    IOACIPCClass::unlock((IOACIPCClass *)this);
  }
  return v3;
}

uint64_t IOACIPCBBClass::unmapIndexArrays(mach_port_t *this)
{
  IOACIPCClass::lock((IOACIPCClass *)this);
  mach_port_t v2 = this[43];
  uint32_t v3 = (*(uint64_t (**)(mach_port_t *, uint64_t))(*(void *)this + 224))(this, 25);
  uint64_t v4 = IOConnectCallScalarMethod(v2, v3, 0, 0, 0, 0);
  IOACIPCClass::unlock((IOACIPCClass *)this);
  return v4;
}

uint64_t IOACIPCBBClass::timesyncAsync(IONotificationPortRef *this, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5, void (*a6)(void *, int, void *), void *a7)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  IOACIPCClass::lock((IOACIPCClass *)this);
  if (this[12])
  {
    *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v14;
    long long v25 = v14;
    input[0] = a2;
    input[1] = a3;
    input[2] = a4;
    uint64_t input[3] = a5;
    reference[1] = (uint64_t)a6;
    v22 = a7;
    mach_port_t v15 = *((_DWORD *)this + 43);
    uint32_t v16 = (*((uint64_t (**)(IONotificationPortRef *, uint64_t))*this + 28))(this, 14);
    mach_port_t MachPort = IONotificationPortGetMachPort(this[12]);
    uint64_t v18 = IOConnectCallAsyncScalarMethod(v15, v16, MachPort, reference, 3u, input, 4u, 0, 0);
    IOACIPCClass::unlock((IOACIPCClass *)this);
  }
  else
  {
    IOACIPCClass::unlock((IOACIPCClass *)this);
    return 3758097112;
  }
  return v18;
}

uint64_t IOACIPCBBClass::registerTimeEvent(IONotificationPortRef *this, unsigned int a2, void (*a3)(void *, int, void **, unsigned int), void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  IOACIPCClass::lock((IOACIPCClass *)this);
  if (this[12])
  {
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    long long v18 = v8;
    long long v19 = v8;
    uint64_t input = a2;
    reference[1] = (uint64_t)a3;
    uint32_t v16 = a4;
    mach_port_t v9 = *((_DWORD *)this + 43);
    uint32_t v10 = (*((uint64_t (**)(IONotificationPortRef *, uint64_t))*this + 28))(this, 15);
    mach_port_t MachPort = IONotificationPortGetMachPort(this[12]);
    uint64_t v12 = IOConnectCallAsyncScalarMethod(v9, v10, MachPort, reference, 3u, &input, 1u, 0, 0);
    IOACIPCClass::unlock((IOACIPCClass *)this);
  }
  else
  {
    IOACIPCClass::unlock((IOACIPCClass *)this);
    return 3758097112;
  }
  return v12;
}

uint64_t IOACIPCBBClass::deregisterTimeEvent(IONotificationPortRef *this, unsigned int a2, void (*a3)(void *, int), void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  IOACIPCClass::lock((IOACIPCClass *)this);
  if (this[12])
  {
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    long long v18 = v8;
    long long v19 = v8;
    uint64_t input = a2;
    reference[1] = (uint64_t)a3;
    uint32_t v16 = a4;
    mach_port_t v9 = *((_DWORD *)this + 43);
    uint32_t v10 = (*((uint64_t (**)(IONotificationPortRef *, uint64_t))*this + 28))(this, 16);
    mach_port_t MachPort = IONotificationPortGetMachPort(this[12]);
    uint64_t v12 = IOConnectCallAsyncScalarMethod(v9, v10, MachPort, reference, 3u, &input, 1u, 0, 0);
    IOACIPCClass::unlock((IOACIPCClass *)this);
  }
  else
  {
    IOACIPCClass::unlock((IOACIPCClass *)this);
    return 3758097112;
  }
  return v12;
}

void *IOACIPCBBClass::copyNotificationHandler(IOACIPCBBClass *this, int a2, void *a3)
{
  if (a2 != -469794304) {
    return (void *)MEMORY[0x270F922D8](this);
  }
  result = (void *)*((void *)this + 23);
  if (result) {
    return _Block_copy(result);
  }
  return result;
}

uint64_t IOACIPCBBControlClass::hostSleepEntryExit(mach_port_t *this, unsigned int a2)
{
  IOACIPCControlClass::lock((IOACIPCControlClass *)this);
  uint64_t input = a2;
  uint64_t v4 = IOConnectCallScalarMethod(this[42], 6u, &input, 1u, 0, 0);
  IOACIPCControlClass::unlock((IOACIPCControlClass *)this);
  return v4;
}

void IOACIPCBBNetCfgClass::IOACIPCBBNetCfgClass(IOACIPCBBNetCfgClass *this)
{
  *(void *)this = &unk_26DDDBEF8;
  *((_DWORD *)this + 2) = 1;
  *((void *)this + 10) = 0;
  *((unsigned char *)this + 88) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
}

{
  *(void *)this = &unk_26DDDBEF8;
  *((_DWORD *)this + 2) = 1;
  *((void *)this + 10) = 0;
  *((unsigned char *)this + 88) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
}

void IOACIPCBBNetCfgClass::~IOACIPCBBNetCfgClass(IOACIPCBBNetCfgClass *this)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  mach_port_t v2 = (void (**)(IOACIPCBBNetCfgClass *))&unk_26DDDBEF8;
  *(void *)this = &unk_26DDDBEF8;
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    uint64_t v4 = "~IOACIPCBBNetCfgClass";
    _os_log_impl(&dword_22A2DB000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: \n", (uint8_t *)&v3, 0xCu);
    mach_port_t v2 = *(void (***)(IOACIPCBBNetCfgClass *))this;
  }
  v2[3](this);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 16));
}

{
  uint64_t vars8;

  IOACIPCBBNetCfgClass::~IOACIPCBBNetCfgClass(this);

  JUMPOUT(0x22A6C3690);
}

void sub_22A2DC964(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t IOACIPCBBNetCfgClass::lock(IOACIPCBBNetCfgClass *this)
{
  return pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
}

uint64_t IOACIPCBBNetCfgClass::unlock(IOACIPCBBNetCfgClass *this)
{
  return pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
}

uint64_t IOACIPCBBNetCfgClass::start(IOACIPCBBNetCfgClass *this, const __CFDictionary *a2, int a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  io_iterator_t existing = -1431655766;
  mach_port_t v6 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (!*((_DWORD *)this + 20))
  {
    CFRetain(a2);
    char v7 = 0;
    if (IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], a2, &existing)) {
      goto LABEL_10;
    }
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint32_t v10 = MEMORY[0x263EF8438];
    while (1)
    {
      io_registry_entry_t v11 = IOIteratorNext(existing);
      if (!v11)
      {
LABEL_38:
        IOObjectRelease(existing);
        goto LABEL_6;
      }
      io_object_t v12 = v11;
      CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v11, @"sim-context", v9, 0);
      if (CFProperty)
      {
        CFNumberRef v14 = CFProperty;
        CFTypeID v15 = CFGetTypeID(CFProperty);
        if (v15 == CFNumberGetTypeID())
        {
          __int16 valuePtr = -21846;
          int Value = CFNumberGetValue(v14, kCFNumberSInt16Type, &valuePtr);
          int v17 = *((_DWORD *)this + 2);
          if (Value)
          {
            if ((v17 & 2) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v22 = "start";
              __int16 v23 = 1024;
              int v24 = valuePtr;
              _os_log_impl(&dword_22A2DB000, v10, OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: SIM context: %d\n", buf, 0x12u);
            }
            if (valuePtr == a3)
            {
              *((_DWORD *)this + 20) = v12;
              IOObjectRetain(v12);
              if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v22 = "start";
                __int16 v23 = 1024;
                int v24 = valuePtr;
                _os_log_impl(&dword_22A2DB000, v10, OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: Service selected with sim-context: %d\n", buf, 0x12u);
              }
              int v18 = 3;
              char v7 = 1;
              goto LABEL_36;
            }
          }
          else if ((v17 & 1) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v22 = "start";
            _os_log_impl(&dword_22A2DB000, v10, OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: ERROR: unable to read SIM context\n", buf, 0xCu);
          }
          int v18 = 2;
LABEL_36:
          CFRelease(v14);
          goto LABEL_37;
        }
        if ((*((unsigned char *)this + 8) & 1) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v22 = "start";
          _os_log_impl(&dword_22A2DB000, v10, OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: ERROR: SIM context wrong type\n", buf, 0xCu);
        }
        CFRelease(v14);
      }
      else if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "start";
        _os_log_impl(&dword_22A2DB000, v10, OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: IOService has no SIM context assigned\n", buf, 0xCu);
      }
      int v18 = 2;
LABEL_37:
      if (v18 != 2) {
        goto LABEL_38;
      }
    }
  }
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "start";
    _os_log_impl(&dword_22A2DB000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: Service already available\n", buf, 0xCu);
  }
  char v7 = 1;
LABEL_6:
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "start";
    _os_log_impl(&dword_22A2DB000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: --done\n", buf, 0xCu);
  }
LABEL_10:
  pthread_mutex_unlock(v6);
  return v7 & 1;
}

uint64_t IOACIPCBBNetCfgClass::stop(IOACIPCBBNetCfgClass *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  mach_port_t v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    mach_port_t v6 = "stop";
    _os_log_impl(&dword_22A2DB000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: \n", (uint8_t *)&v5, 0xCu);
  }
  IOACIPCBBNetCfgClass::close_nl(this);
  io_object_t v3 = *((_DWORD *)this + 20);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 20) = 0;
  }
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    mach_port_t v6 = "stop";
    _os_log_impl(&dword_22A2DB000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: --done\n", (uint8_t *)&v5, 0xCu);
  }
  pthread_mutex_unlock(v2);
  return 1;
}

uint64_t IOACIPCBBNetCfgClass::close_nl(IOACIPCBBNetCfgClass *this)
{
  if (!*((unsigned char *)this + 88)) {
    return 0;
  }
  *((unsigned char *)this + 88) = 0;
  uint64_t v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 21), 1u, 0, 0, 0, 0);
  io_connect_t v3 = *((_DWORD *)this + 21);
  if (v3)
  {
    IOServiceClose(v3);
    *((_DWORD *)this + 21) = 0;
  }
  return v2;
}

uint64_t IOACIPCBBNetCfgClass::open(IOACIPCBBNetCfgClass *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    mach_port_t v6 = "open";
    _os_log_impl(&dword_22A2DB000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: \n", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = IOACIPCBBNetCfgClass::open_nl(this);
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t IOACIPCBBNetCfgClass::open_nl(IOACIPCBBNetCfgClass *this)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint32_t outputCnt = 0;
  uint64_t v8 = 0;
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    io_registry_entry_t v11 = "open_nl";
    _os_log_impl(&dword_22A2DB000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: \n", buf, 0xCu);
  }
  if (!*((unsigned char *)this + 88))
  {
    io_service_t v3 = *((_DWORD *)this + 20);
    if (!v3)
    {
      if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        io_registry_entry_t v11 = "open_nl";
        _os_log_impl(&dword_22A2DB000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: no service\n", buf, 0xCu);
      }
      return 3758096385;
    }
    uint64_t v4 = IOServiceOpen(v3, *MEMORY[0x263EF8960], 0, (io_connect_t *)this + 21);
    if (v4)
    {
      uint64_t v2 = v4;
      if ((*((unsigned char *)this + 8) & 2) == 0 || !os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        return v2;
      }
      *(_DWORD *)buf = 136315394;
      io_registry_entry_t v11 = "open_nl";
      __int16 v12 = 1024;
      int v13 = v2;
      int v5 = MEMORY[0x263EF8438];
      mach_port_t v6 = "IOACIPCBBNetCfgClass::%s: open failed: 0x%x\n";
    }
    else
    {
      uint64_t v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 21), 0, &v8, 1u, 0, &outputCnt);
      if (!v2)
      {
        *((unsigned char *)this + 88) = 1;
        return v2;
      }
      if ((*((unsigned char *)this + 8) & 2) == 0 || !os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        return v2;
      }
      *(_DWORD *)buf = 136315394;
      io_registry_entry_t v11 = "open_nl";
      __int16 v12 = 1024;
      int v13 = v2;
      int v5 = MEMORY[0x263EF8438];
      mach_port_t v6 = "IOACIPCBBNetCfgClass::%s: kACDPNetCfgUserClientOpen failed: 0x%x\n";
    }
    _os_log_impl(&dword_22A2DB000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0x12u);
    return v2;
  }
  if ((*((unsigned char *)this + 8) & 2) == 0) {
    return 0;
  }
  uint64_t v2 = 0;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    io_registry_entry_t v11 = "open_nl";
    _os_log_impl(&dword_22A2DB000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: is open\n", buf, 0xCu);
    return 0;
  }
  return v2;
}

uint64_t IOACIPCBBNetCfgClass::close(IOACIPCBBNetCfgClass *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if ((*((unsigned char *)this + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    mach_port_t v6 = "close";
    _os_log_impl(&dword_22A2DB000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: \n", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = IOACIPCBBNetCfgClass::close_nl(this);
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t IOACIPCBBNetCfgClass::setLogLevel(uint64_t this, int a2)
{
  *(_DWORD *)(this + 8) = a2;
  return this;
}

uint64_t IOACIPCBBNetCfgClass::addNetIf(uint64_t a1, unsigned __int8 *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 3758097090;
  }
  if ((*(unsigned char *)(a1 + 8) & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(unsigned __int16 *)a2;
    int v7 = a2[2];
    int v8 = a2[3];
    *(_DWORD *)buf = 136315906;
    int v13 = "addNetIf";
    __int16 v14 = 1024;
    int v15 = v6;
    __int16 v16 = 1024;
    int v17 = v7;
    __int16 v18 = 1024;
    int v19 = v8;
    _os_log_impl(&dword_22A2DB000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: Adding Network Interface (id = %u, prioUL = %u, rss = %u)\n", buf, 0x1Eu);
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  size_t v11 = 478;
  uint64_t v9 = IOConnectCallMethod(*(_DWORD *)(a1 + 84), 2u, 0, 0, a2, 0x1CuLL, 0, 0, a3, &v11);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  if (v9 && (*(unsigned char *)(a1 + 8) & 1) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v13 = "addNetIf";
    __int16 v14 = 1024;
    int v15 = v9;
    _os_log_impl(&dword_22A2DB000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOACIPCBBNetCfgClass::%s: Adding Network Interface failed (0x%x)\n", buf, 0x12u);
  }
  return v9;
}

uint64_t IOACIPCBBNetCfgClass::removeNetIf(IOACIPCBBNetCfgClass *this, unsigned int a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v7[0] = a2;
  uint64_t v5 = IOConnectCallScalarMethod(*((_DWORD *)this + 21), 3u, v7, 1u, 0, 0);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t IOACIPCBBNetCfgClass::addQueueSet(IOACIPCBBNetCfgClass *this, unsigned __int8 a2, BOOL a3, unsigned int *a4)
{
  return 3758097095;
}

uint64_t IOACIPCBBNetCfgClass::stopNetIfRx(IOACIPCBBNetCfgClass *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  v10[3] = *MEMORY[0x263EF8340];
  int v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v10[0] = a2;
  v10[1] = a3;
  v10[2] = a4;
  IOConnectCallScalarMethod(*((_DWORD *)this + 21), 5u, v10, 3u, 0, 0);
  return pthread_mutex_unlock(v8);
}

uint64_t IOACIPCBBNetCfgClass::startNetIfRx(IOACIPCBBNetCfgClass *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  v10[3] = *MEMORY[0x263EF8340];
  int v8 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v10[0] = a2;
  v10[1] = a3;
  v10[2] = a4;
  IOConnectCallScalarMethod(*((_DWORD *)this + 21), 4u, v10, 3u, 0, 0);
  return pthread_mutex_unlock(v8);
}

uint64_t IOACIPCBBNetCfgClass::stopNetIfTx(IOACIPCBBNetCfgClass *this, unsigned int a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v6[0] = a2;
  IOConnectCallScalarMethod(*((_DWORD *)this + 21), 7u, v6, 1u, 0, 0);
  return pthread_mutex_unlock(v4);
}

uint64_t IOACIPCBBNetCfgClass::startNetIfTx(IOACIPCBBNetCfgClass *this, unsigned int a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  v6[0] = a2;
  IOConnectCallScalarMethod(*((_DWORD *)this + 21), 6u, v6, 1u, 0, 0);
  return pthread_mutex_unlock(v4);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
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

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x270EF47C8](notify);
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

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
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

uint64_t IOACIPCClass::lock(IOACIPCClass *this)
{
  return MEMORY[0x270F922E8](this);
}

uint64_t IOACIPCClass::stop(IOACIPCClass *this, dispatch_group_s *a2)
{
  return MEMORY[0x270F92300](this, a2);
}

uint64_t IOACIPCClass::unlock(IOACIPCClass *this)
{
  return MEMORY[0x270F92320](this);
}

uint64_t IOACIPCControlClass::lock(IOACIPCControlClass *this)
{
  return MEMORY[0x270F923F8](this);
}

uint64_t IOACIPCControlClass::unlock(IOACIPCControlClass *this)
{
  return MEMORY[0x270F92428](this);
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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