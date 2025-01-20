const char *getACIPCErrorTypeString(unsigned int a1)
{
  if (a1 > 0x44) {
    return "invalid";
  }
  else {
    return acipcErrorTypeStrings[a1];
  }
}

const char *getACIPCBTIRegistersString(unsigned int a1)
{
  if (a1 > 1) {
    return "invalid";
  }
  else {
    return acipcBTIRegistersStrings[a1];
  }
}

const char *getACIPCDirectionString(unsigned int a1)
{
  if (a1 > 1) {
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

void ACIPCBTClass::ACIPCBTClass(ACIPCBTClass *this)
{
  *(_DWORD *)this = 1;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *((void *)this + 13) = 0;
  *((void *)this + 14) = "";
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *((unsigned char *)this + 152) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 8), 0);
}

{
  *(_DWORD *)this = 1;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *((void *)this + 13) = 0;
  *((void *)this + 14) = "";
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *((unsigned char *)this + 152) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 8), 0);
}

void ACIPCBTClass::~ACIPCBTClass(ACIPCBTClass *this)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    v3 = "~ACIPCBTClass";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: \n", (uint8_t *)&v2, 0xCu);
  }
  ACIPCBTClass::stop(this, 0);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 8));
}

void sub_263616698(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t ACIPCBTClass::stop(ACIPCBTClass *this, NSObject *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "stop";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: \n", buf, 0xCu);
  }
  if (*((void *)this + 9) || *((void *)this + 10))
  {
    ACIPCBTClass::close_nl(this);
    ACIPCBTClass::clearIterators(this);
    ACIPCBTClass::clearNotificationPort(this);
    v5 = a2;
    if (!a2)
    {
      if (*((void *)this + 10))
      {
        char v6 = 0;
        v5 = 0;
        goto LABEL_10;
      }
      v5 = dispatch_group_create();
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
    uint64_t v7 = *((void *)this + 17);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 0x40000000;
    v13[2] = ___ZN12ACIPCBTClass4stopEP16dispatch_group_s_block_invoke;
    v13[3] = &unk_2655D2258;
    long long v8 = *(_OWORD *)((char *)this + 120);
    *((void *)this + 15) = 0;
    *((void *)this + 16) = 0;
    *((void *)this + 17) = 0;
    long long v14 = v8;
    uint64_t v15 = v7;
    v16 = v5;
    v9 = (__CFRunLoop *)*((void *)this + 9);
    if (v9)
    {
      if (*((void *)this + 10)) {
        ACIPCBTClass::stop();
      }
      CFRunLoopPerformBlock(v9, (CFTypeRef)*MEMORY[0x263EFFE88], v13);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 9));
      CFRelease(*((CFTypeRef *)this + 9));
      *((void *)this + 9) = 0;
    }
    v10 = *((void *)this + 10);
    if (v10)
    {
      dispatch_async(v10, v13);
      dispatch_release(*((dispatch_object_t *)this + 10));
      *((void *)this + 10) = 0;
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
    if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "stop";
      _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: --done\n", buf, 0xCu);
    }
    return 1;
  }
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "stop";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: already stopped, returning true\n", buf, 0xCu);
  }
  pthread_mutex_unlock(v4);
  return 1;
}

void __clang_call_terminate(void *a1)
{
}

uint64_t ACIPCBTClass::start(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v12 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  uint64_t started = ACIPCBTClass::start_nl(a1, a2, a3, 0, a4, a5, a6);
  pthread_mutex_unlock(v12);
  return started;
}

uint64_t ACIPCBTClass::start_nl(uint64_t a1, uint64_t a2, CFTypeRef cf, dispatch_object_t object, uint64_t a5, uint64_t a6, uint64_t a7)
{
  kern_return_t v18;
  kern_return_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  io_object_t v23;
  __CFRunLoop *v24;
  NSObject *v25;
  kern_return_t v26;
  kern_return_t v27;
  io_object_t v29;
  __CFRunLoop *v30;
  NSObject *v31;
  void v32[5];
  io_object_t v33;
  void v34[5];
  void block[5];
  io_object_t v36;
  void v37[5];
  void aBlock[5];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x263EF8340];
  *(void *)(a1 + 112) = a2;
  if ((*(unsigned char *)a1 & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "start_nl";
    v41 = 2080;
    v42 = a2;
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: for %s\n", buf, 0x16u);
  }
  long long v14 = *(const void **)(a1 + 72);
  if (v14) {
    CFRelease(v14);
  }
  uint64_t v15 = *(NSObject **)(a1 + 80);
  if (v15) {
    dispatch_release(v15);
  }
  if (cf)
  {
    if (object) {
      ACIPCBTClass::start_nl();
    }
    *(void *)(a1 + 72) = cf;
    CFRetain(cf);
  }
  else if (object)
  {
    *(void *)(a1 + 80) = object;
    dispatch_retain(object);
  }
  ACIPCBTClass::setNotificationPort((ACIPCBTClass *)a1);
  v16 = IOServiceMatching("AppleConvergedIPCInterface");
  if (!v16 && (*(unsigned char *)a1 & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "start_nl";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: could not create matching dictionary\n", buf, 0xCu);
  }
  CFStringRef v17 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], *(const char **)(a1 + 112), 0x600u);
  CFDictionarySetValue(v16, @"ACIPCInterfaceProtocol", v17);
  CFRelease(v17);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN12ACIPCBTClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv14acipcErrorTypejiE_block_invoke;
  aBlock[3] = &unk_2655D2190;
  aBlock[4] = a7;
  *(void *)(a1 + 136) = _Block_copy(aBlock);
  if (v16)
  {
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 0x40000000;
    v37[2] = ___ZN12ACIPCBTClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv14acipcErrorTypejiE_block_invoke_2;
    v37[3] = &unk_2655D21B8;
    v37[4] = a5;
    *(void *)(a1 + 120) = _Block_copy(v37);
    CFRetain(v16);
    v18 = IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 88), "IOServiceFirstMatch", v16, (IOServiceMatchingCallback)ACIPCBTClass::interfaceMatched, *(void **)(a1 + 120), (io_iterator_t *)(a1 + 104));
    if (v18)
    {
      if ((*(unsigned char *)a1 & 2) == 0)
      {
LABEL_34:
        v20 = 0;
        goto LABEL_35;
      }
      uint64_t v19 = v18;
      v20 = 0;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "start_nl";
        v41 = 1024;
        LODWORD(v42) = v19;
        v21 = MEMORY[0x263EF8438];
        v22 = "ACIPCBTClass::%s: IOServiceAddMatchingNotification (kIOFirstMatchNotification) failed, ret = 0x%08x";
LABEL_33:
        _os_log_impl(&dword_263615000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0x12u);
        goto LABEL_34;
      }
    }
    else
    {
      v23 = *(_DWORD *)(a1 + 104);
      IOObjectRetain(v23);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = ___ZN12ACIPCBTClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv14acipcErrorTypejiE_block_invoke_3;
      block[3] = &unk_2655D21E0;
      block[4] = v37;
      v36 = v23;
      v24 = *(__CFRunLoop **)(a1 + 72);
      if (v24)
      {
        if (*(void *)(a1 + 80)) {
          ACIPCBTClass::start_nl();
        }
        CFRunLoopPerformBlock(v24, (CFTypeRef)*MEMORY[0x263EFFE88], block);
        CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 72));
      }
      v25 = *(NSObject **)(a1 + 80);
      if (v25)
      {
        if (*(void *)(a1 + 72)) {
          ACIPCBTClass::start_nl();
        }
        dispatch_async(v25, block);
      }
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 0x40000000;
      v34[2] = ___ZN12ACIPCBTClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv14acipcErrorTypejiE_block_invoke_15;
      v34[3] = &unk_2655D2208;
      v34[4] = a6;
      *(void *)(a1 + 128) = _Block_copy(v34);
      CFRetain(v16);
      v26 = IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 88), "IOServiceTerminate", v16, (IOServiceMatchingCallback)ACIPCBTClass::interfaceMatched, *(void **)(a1 + 128), (io_iterator_t *)(a1 + 108));
      if (!v26)
      {
        v29 = *(_DWORD *)(a1 + 108);
        IOObjectRetain(v29);
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 0x40000000;
        v32[2] = ___ZN12ACIPCBTClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv14acipcErrorTypejiE_block_invoke_2_18;
        v32[3] = &unk_2655D2230;
        v32[4] = v34;
        v33 = v29;
        v30 = *(__CFRunLoop **)(a1 + 72);
        if (v30)
        {
          if (*(void *)(a1 + 80)) {
            ACIPCBTClass::start_nl();
          }
          CFRunLoopPerformBlock(v30, (CFTypeRef)*MEMORY[0x263EFFE88], v32);
          CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 72));
        }
        v31 = *(NSObject **)(a1 + 80);
        if (v31)
        {
          if (*(void *)(a1 + 72)) {
            ACIPCBTClass::start_nl();
          }
          dispatch_async(v31, v32);
        }
        v20 = 1;
        goto LABEL_35;
      }
      if ((*(unsigned char *)a1 & 2) == 0) {
        goto LABEL_34;
      }
      v27 = v26;
      v20 = 0;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "start_nl";
        v41 = 1024;
        LODWORD(v42) = v27;
        v21 = MEMORY[0x263EF8438];
        v22 = "ACIPCBTClass::%s: IOServiceAddMatchingNotification (kIOTerminatedNotification) failed, ret = 0x%08x";
        goto LABEL_33;
      }
    }
LABEL_35:
    CFRelease(v16);
    goto LABEL_36;
  }
  v20 = 0;
LABEL_36:
  if ((*(unsigned char *)a1 & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "start_nl";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: --done\n", buf, 0xCu);
  }
  return v20;
}

uint64_t ACIPCBTClass::start(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v12 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  uint64_t started = ACIPCBTClass::start_nl(a1, a2, 0, a3, a4, a5, a6);
  pthread_mutex_unlock(v12);
  return started;
}

void ACIPCBTClass::setNotificationPort(ACIPCBTClass *this)
{
  if (!*((void *)this + 11))
  {
    int v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    *((void *)this + 11) = v2;
    if (!v2) {
      ACIPCBTClass::setNotificationPort();
    }
    if (*((void *)this + 9))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v2);
      *((void *)this + 12) = RunLoopSource;
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 9), RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    }
    uint64_t v4 = *((void *)this + 10);
    if (v4)
    {
      v5 = (IONotificationPort *)*((void *)this + 11);
      IONotificationPortSetDispatchQueue(v5, v4);
    }
  }
}

uint64_t ___ZN12ACIPCBTClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv14acipcErrorTypejiE_block_invoke(uint64_t result, uint64_t a2, int a3, unsigned int *a4)
{
  if (a3 == -469794559)
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *a4, a4[2], a4[4]);
    }
  }
  return result;
}

uint64_t ___ZN12ACIPCBTClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv14acipcErrorTypejiE_block_invoke_2(uint64_t a1, io_iterator_t iterator)
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

void ACIPCBTClass::interfaceMatched(ACIPCBTClass *this, void *a2)
{
  _Block_copy(this);
  (*((void (**)(ACIPCBTClass *, void *))this + 2))(this, a2);

  _Block_release(this);
}

uint64_t ___ZN12ACIPCBTClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv14acipcErrorTypejiE_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  io_object_t v2 = *(_DWORD *)(a1 + 40);

  return IOObjectRelease(v2);
}

uint64_t ___ZN12ACIPCBTClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv14acipcErrorTypejiE_block_invoke_15(uint64_t a1, io_iterator_t iterator)
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

uint64_t ___ZN12ACIPCBTClass8start_nlEPKcP11__CFRunLoopP16dispatch_queue_sU13block_pointerFvjES7_U13block_pointerFv14acipcErrorTypejiE_block_invoke_2_18(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  io_object_t v2 = *(_DWORD *)(a1 + 40);

  return IOObjectRelease(v2);
}

uint64_t ACIPCBTClass::close_nl(ACIPCBTClass *this)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)this + 152))
  {
    if ((*(unsigned char *)this & 2) != 0)
    {
      uint64_t v2 = 0;
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        return v2;
      }
      int v6 = 136315138;
      uint64_t v7 = "close_nl";
      _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: not open, return success\n", (uint8_t *)&v6, 0xCu);
    }
    return 0;
  }
  *((unsigned char *)this + 152) = 0;
  uint64_t v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 37), 1u, 0, 0, 0, 0);
  io_connect_t v3 = *((_DWORD *)this + 37);
  if (v3)
  {
    IOServiceClose(v3);
    *((_DWORD *)this + 37) = 0;
  }
  io_object_t v4 = *((_DWORD *)this + 36);
  if (v4)
  {
    IOObjectRelease(v4);
    *((_DWORD *)this + 36) = 0;
  }
  return v2;
}

uint64_t ACIPCBTClass::clearIterators(ACIPCBTClass *this)
{
  io_object_t v2 = *((_DWORD *)this + 26);
  if (v2)
  {
    IOObjectRelease(v2);
    *((_DWORD *)this + 26) = 0;
  }
  uint64_t result = *((unsigned int *)this + 27);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 27) = 0;
  }
  return result;
}

void ACIPCBTClass::clearNotificationPort(ACIPCBTClass *this)
{
  io_object_t v2 = (void *)((char *)this + 88);
  uint64_t v1 = *((void *)this + 11);
  if (v1)
  {
    io_object_t v4 = (__CFRunLoop *)*((void *)this + 9);
    uint64_t v5 = *((void *)this + 12);
    uint64_t v6 = MEMORY[0x263EF8330];
    *io_object_t v2 = 0;
    v2[1] = 0;
    block[0] = v6;
    block[1] = 0x40000000;
    block[2] = ___ZN12ACIPCBTClass21clearNotificationPortEv_block_invoke;
    block[3] = &__block_descriptor_tmp_22;
    block[4] = v4;
    block[5] = v5;
    block[6] = v1;
    if (v4)
    {
      if (*((void *)this + 10)) {
        ACIPCBTClass::clearNotificationPort();
      }
      CFRunLoopPerformBlock(v4, (CFTypeRef)*MEMORY[0x263EFFE88], block);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 9));
    }
    uint64_t v7 = *((void *)this + 10);
    if (v7)
    {
      if (*((void *)this + 9)) {
        ACIPCBTClass::clearNotificationPort();
      }
      dispatch_async(v7, block);
    }
  }
}

void ___ZN12ACIPCBTClass4stopEP16dispatch_group_s_block_invoke(void *a1)
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

void ___ZN12ACIPCBTClass21clearNotificationPortEv_block_invoke(__CFRunLoop **a1)
{
  io_object_t v2 = a1[4];
  if (v2) {
    CFRunLoopRemoveSource(v2, a1[5], (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  }
  io_connect_t v3 = a1[6];

  IONotificationPortDestroy(v3);
}

uint64_t ACIPCBTClass::open(io_connect_t *this, io_service_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  io_object_t v4 = (pthread_mutex_t *)(this + 2);
  pthread_mutex_lock((pthread_mutex_t *)(this + 2));
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "open";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: \n", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = ACIPCBTClass::open_nl(this, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t ACIPCBTClass::open_nl(io_connect_t *this, io_service_t a2)
{
  uint64_t v2 = 0;
  uint32_t outputCnt = 0;
  uint64_t v8 = 0;
  if (!*((unsigned char *)this + 152))
  {
    if (ACIPCBTClass::setUpNotificationCallback((ACIPCBTClass *)this, a2))
    {
      uint64_t v2 = IOServiceOpen(a2, *MEMORY[0x263EF8960], 0, this + 37);
      if (!v2)
      {
        uint64_t v2 = IOConnectCallScalarMethod(this[37], 0, &v8, 1u, 0, &outputCnt);
        if (!v2)
        {
          *((unsigned char *)this + 152) = 1;
          return v2;
        }
      }
    }
    else
    {
      uint64_t v2 = 3758097112;
    }
    io_connect_t v5 = this[37];
    if (v5)
    {
      IOServiceClose(v5);
      this[37] = 0;
    }
    io_object_t v6 = this[36];
    if (v6)
    {
      IOObjectRelease(v6);
      this[36] = 0;
    }
  }
  return v2;
}

BOOL ACIPCBTClass::setUpNotificationCallback(ACIPCBTClass *this, io_service_t a2)
{
  kern_return_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  kern_return_t v8;
  uint64_t v9;

  uint64_t v9 = *MEMORY[0x263EF8340];
  io_connect_t v3 = IOServiceAddInterestNotification(*((IONotificationPortRef *)this + 11), a2, "IOGeneralInterest", (IOServiceInterestCallback)ACIPCBTClass::notificationCallback, *((void **)this + 17), (io_object_t *)this + 36);
  if (v3 && (*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    io_connect_t v5 = 136315394;
    io_object_t v6 = "setUpNotificationCallback";
    int v7 = 1024;
    uint64_t v8 = v3;
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: Could not add interest notification on service: %#x\n", (uint8_t *)&v5, 0x12u);
  }
  return v3 == 0;
}

uint64_t ACIPCBTClass::cleanUpNotificationCallback(ACIPCBTClass *this)
{
  uint64_t result = *((unsigned int *)this + 36);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 36) = 0;
  }
  return result;
}

uint64_t ACIPCBTClass::close(ACIPCBTClass *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    io_object_t v6 = "close";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: \n", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = ACIPCBTClass::close_nl(this);
  pthread_mutex_unlock(v2);
  return v3;
}

void ACIPCBTClass::notificationCallback(ACIPCBTClass *this, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  _Block_copy(this);
  (*((void (**)(ACIPCBTClass *, void *, uint64_t, uint64_t))this + 2))(this, a2, a3, a4);

  _Block_release(this);
}

uint64_t ACIPCBTClass::write(ACIPCBTClass *this, const void *a2, unsigned int a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  io_object_t v6 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "write";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a2;
    __int16 v10 = 1024;
    unsigned int v11 = a3;
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: buff %p, size %u\n", buf, 0x1Cu);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  uint64_t v7 = IOConnectCallMethod(*((_DWORD *)this + 37), 2u, (const uint64_t *)buf, 2u, a2, a3, 0, 0, 0, 0);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t ACIPCBTClass::writeAsync(ACIPCBTClass *this, const void *a2, unsigned int a3, void (*a4)(void *, int, void *), void *a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v22 = v10;
  long long v23 = v10;
  *(_OWORD *)reference = v10;
  long long v21 = v10;
  unsigned int v11 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "writeAsync";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a2;
    __int16 v18 = 1024;
    unsigned int v19 = a3;
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: buff %p, size %u\n", buf, 0x1Cu);
  }
  uint64_t v12 = (IONotificationPort *)*((void *)this + 11);
  if (v12)
  {
    *(void *)buf = a2;
    *(void *)&buf[8] = a3;
    reference[1] = (uint64_t)a4;
    *(void *)&long long v21 = a5;
    mach_port_t v13 = *((_DWORD *)this + 37);
    mach_port_t MachPort = IONotificationPortGetMachPort(v12);
    uint64_t v15 = IOConnectCallAsyncScalarMethod(v13, 2u, MachPort, reference, 3u, (const uint64_t *)buf, 2u, 0, 0);
  }
  else
  {
    uint64_t v15 = 3758097112;
    if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "writeAsync";
      _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock(v11);
  return v15;
}

uint64_t ACIPCBTClass::read(ACIPCBTClass *this, void *a2, unsigned int *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  io_object_t v6 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *a3;
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "read";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a2;
    __int16 v12 = 1024;
    int v13 = v7;
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: buff %p, size %u\n", buf, 0x1Cu);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  size_t v10 = *a3;
  uint64_t v8 = IOConnectCallMethod(*((_DWORD *)this + 37), 3u, (const uint64_t *)buf, 2u, 0, 0, 0, 0, a2, &v10);
  if (!v8) {
    *a3 = v10;
  }
  pthread_mutex_unlock(v6);
  return v8;
}

uint64_t ACIPCBTClass::readAsync(ACIPCBTClass *this, void *a2, unsigned int a3, void (*a4)(void *, int, void *), void *a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v22 = v10;
  long long v23 = v10;
  *(_OWORD *)reference = v10;
  long long v21 = v10;
  unsigned int v11 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "readAsync";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a2;
    __int16 v18 = 1024;
    unsigned int v19 = a3;
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: buff %p, size %u\n", buf, 0x1Cu);
  }
  __int16 v12 = (IONotificationPort *)*((void *)this + 11);
  if (v12)
  {
    *(void *)buf = a2;
    *(void *)&buf[8] = a3;
    reference[1] = (uint64_t)a4;
    *(void *)&long long v21 = a5;
    mach_port_t v13 = *((_DWORD *)this + 37);
    mach_port_t MachPort = IONotificationPortGetMachPort(v12);
    uint64_t v15 = IOConnectCallAsyncScalarMethod(v13, 3u, MachPort, reference, 3u, (const uint64_t *)buf, 2u, 0, 0);
  }
  else
  {
    uint64_t v15 = 3758097112;
    if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "readAsync";
      _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock(v11);
  return v15;
}

uint64_t ACIPCBTClass::sendImage(ACIPCBTClass *this, const void *a2, unsigned int a3, unsigned int *a4)
{
  input[2] = *MEMORY[0x263EF8340];
  uint32_t outputCnt = 2;
  uint64_t v8 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v14 = "sendImage";
    __int16 v15 = 2048;
    *(void *)v16 = a2;
    *(_WORD *)&v16[8] = 1024;
    *(_DWORD *)&v16[10] = a3;
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: buff %p, size %u\n", buf, 0x1Cu);
  }
  input[0] = 0;
  input[1] = 0;
  uint64_t output = 0;
  uint64_t v22 = 0;
  uint64_t v9 = IOConnectCallMethod(*((_DWORD *)this + 37), 4u, input, 2u, a2, a3, &output, &outputCnt, 0, 0);
  if (!v9)
  {
    *a4 = output;
    uint64_t v9 = v22;
  }
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *a4;
    *(_DWORD *)buf = 136316162;
    uint64_t v14 = "sendImage";
    __int16 v15 = 1024;
    *(_DWORD *)v16 = v9;
    *(_WORD *)&v16[4] = 2048;
    *(void *)&v16[6] = a2;
    __int16 v17 = 1024;
    unsigned int v18 = a3;
    __int16 v19 = 1024;
    int v20 = v10;
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: ret 0x%x, buff %p, size %u, cookie %u\n", buf, 0x28u);
  }
  pthread_mutex_unlock(v8);
  return v9;
}

uint64_t ACIPCBTClass::sendImageAsync(ACIPCBTClass *this, const void *a2, unsigned int a3, void (*a4)(void *, int, void *, void *), void *a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v24 = v10;
  long long v25 = v10;
  *(_OWORD *)reference = v10;
  long long v23 = v10;
  uint32_t outputCnt = 2;
  unsigned int v11 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "sendImageAsync";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a2;
    __int16 v19 = 1024;
    unsigned int v20 = a3;
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: buff %p, size %u\n", buf, 0x1Cu);
  }
  __int16 v12 = (IONotificationPort *)*((void *)this + 11);
  if (v12)
  {
    *(void *)buf = a2;
    *(void *)&buf[8] = a3;
    output[0] = 0;
    output[1] = 0;
    reference[1] = (uint64_t)a4;
    *(void *)&long long v23 = a5;
    mach_port_t v13 = *((_DWORD *)this + 37);
    mach_port_t MachPort = IONotificationPortGetMachPort(v12);
    uint64_t v15 = IOConnectCallAsyncScalarMethod(v13, 4u, MachPort, reference, 3u, (const uint64_t *)buf, 2u, output, &outputCnt);
  }
  else
  {
    uint64_t v15 = 3758097112;
    if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "sendImageAsync";
      _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock(v11);
  return v15;
}

uint64_t ACIPCBTClass::readRegister(ACIPCBTClass *this, unsigned int a2, void *a3, unsigned int *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v8 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *a4;
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "readRegister";
    __int16 v14 = 1024;
    unsigned int v15 = a2;
    __int16 v16 = 2048;
    __int16 v17 = a3;
    __int16 v18 = 1024;
    int v19 = v9;
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: reg %u, buff %p, size %u\n", buf, 0x22u);
  }
  size_t v12 = *a4;
  *(void *)buf = a2;
  uint64_t v10 = IOConnectCallMethod(*((_DWORD *)this + 37), 5u, (const uint64_t *)buf, 1u, 0, 0, 0, 0, a3, &v12);
  if (!v10) {
    *a4 = v12;
  }
  pthread_mutex_unlock(v8);
  return v10;
}

uint64_t ACIPCBTClass::abortChannelAsync(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v23 = v8;
  long long v24 = v8;
  *(_OWORD *)reference = v8;
  long long v22 = v8;
  int v9 = (pthread_mutex_t *)(a1 + 8);
  input[1] = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  if ((*(unsigned char *)a1 & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 1) {
      uint64_t v10 = "invalid";
    }
    else {
      uint64_t v10 = acipcDirectionStrings[a2];
    }
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "abortChannelAsync";
    __int16 v18 = 2080;
    int v19 = v10;
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: direction %s\n", buf, 0x16u);
  }
  unsigned int v11 = *(IONotificationPort **)(a1 + 88);
  if (v11)
  {
    input[0] = a2;
    reference[1] = a3;
    *(void *)&long long v22 = a4;
    mach_port_t v12 = *(_DWORD *)(a1 + 148);
    mach_port_t MachPort = IONotificationPortGetMachPort(v11);
    uint64_t v14 = IOConnectCallAsyncScalarMethod(v12, 6u, MachPort, reference, 3u, input, 1u, 0, 0);
  }
  else
  {
    uint64_t v14 = 3758097112;
    if ((*(unsigned char *)a1 & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v17 = "abortChannelAsync";
      _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock(v9);
  return v14;
}

uint64_t ACIPCBTClass::startChannelAsync(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v23 = v8;
  long long v24 = v8;
  *(_OWORD *)reference = v8;
  long long v22 = v8;
  int v9 = (pthread_mutex_t *)(a1 + 8);
  input[1] = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  if ((*(unsigned char *)a1 & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 1) {
      uint64_t v10 = "invalid";
    }
    else {
      uint64_t v10 = acipcDirectionStrings[a2];
    }
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "startChannelAsync";
    __int16 v18 = 2080;
    int v19 = v10;
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: direction %s\n", buf, 0x16u);
  }
  unsigned int v11 = *(IONotificationPort **)(a1 + 88);
  if (v11)
  {
    input[0] = a2;
    reference[1] = a3;
    *(void *)&long long v22 = a4;
    mach_port_t v12 = *(_DWORD *)(a1 + 148);
    mach_port_t MachPort = IONotificationPortGetMachPort(v11);
    uint64_t v14 = IOConnectCallAsyncScalarMethod(v12, 7u, MachPort, reference, 3u, input, 1u, 0, 0);
  }
  else
  {
    uint64_t v14 = 3758097112;
    if ((*(unsigned char *)a1 & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v17 = "startChannelAsync";
      _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock(v9);
  return v14;
}

void ACIPCBTControlClass::ACIPCBTControlClass(ACIPCBTControlClass *this)
{
  *(_DWORD *)this = 1;
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
  *(_DWORD *)this = 1;
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

void ACIPCBTControlClass::~ACIPCBTControlClass(ACIPCBTControlClass *this)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    uint64_t v3 = "~ACIPCBTControlClass";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: \n", (uint8_t *)&v2, 0xCu);
  }
  ACIPCBTControlClass::stop((io_object_t *)this);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 8));
}

void sub_2636189F8(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t ACIPCBTControlClass::stop(io_object_t *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = (pthread_mutex_t *)(this + 2);
  pthread_mutex_lock((pthread_mutex_t *)(this + 2));
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    io_object_t v6 = "stop";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: \n", (uint8_t *)&v5, 0xCu);
  }
  ACIPCBTControlClass::close_nl((ACIPCBTControlClass *)this);
  ACIPCBTControlClass::deregisterEventNotification_nl((ACIPCBTControlClass *)this, 0);
  io_object_t v3 = this[18];
  if (v3)
  {
    IOObjectRelease(v3);
    this[18] = 0;
  }
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    io_object_t v6 = "stop";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: --done\n", (uint8_t *)&v5, 0xCu);
  }
  pthread_mutex_unlock(v2);
  return 1;
}

uint64_t ACIPCBTControlClass::waitforService(ACIPCBTControlClass *this)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  io_iterator_t notification = 0;
  Current = CFRunLoopGetCurrent();
  CFMutableDictionaryRef v3 = IOServiceMatching("AppleConvergedIPCControl");
  if (!v3)
  {
    if (*(unsigned char *)this)
    {
      uint64_t v11 = 0;
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        return v11;
      }
      *(_DWORD *)buf = 136315138;
      long long v21 = "waitforService";
      _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: could not create matching dictionary\n", buf, 0xCu);
    }
    return 0;
  }
  CFMutableDictionaryRef v4 = v3;
  int v5 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
  if (!v5)
  {
    if ((*(unsigned char *)this & 1) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v21 = "waitforService";
      _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: Failed to create notification port\n", buf, 0xCu);
    }
    CFRelease(v4);
    return 0;
  }
  io_object_t v6 = v5;
  RunLoopSource = IONotificationPortGetRunLoopSource(v5);
  CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE88];
  CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  uint64_t v9 = IOServiceAddMatchingNotification(v6, "IOServiceFirstMatch", v4, (IOServiceMatchingCallback)__serviceCallback, Current, &notification);
  if (!v9)
  {
    do
    {
      uint64_t v11 = v9;
      uint64_t v9 = IOIteratorNext(notification);
    }
    while (v9);
    if (v11) {
      goto LABEL_20;
    }
    if ((*(unsigned char *)this & 1) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v21 = "waitforService";
      _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: AppleConvergedIPCControl service not found, waiting 90 seconds for it to appear", buf, 0xCu);
    }
    CFRunLoopRunResult v15 = CFRunLoopRunInMode(v8, 90.0, 0);
    int v16 = *(_DWORD *)this;
    if (v15 == kCFRunLoopRunStopped)
    {
      if ((v16 & 1) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        long long v21 = "waitforService";
        _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: AppleConvergedIPCControl service found", buf, 0xCu);
      }
      uint64_t v17 = 0;
      do
      {
        uint64_t v11 = v17;
        uint64_t v17 = IOIteratorNext(notification);
      }
      while (v17);
      goto LABEL_20;
    }
    if ((v16 & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t v11 = 0;
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136315138;
    long long v21 = "waitforService";
    mach_port_t v12 = MEMORY[0x263EF8438];
    mach_port_t v13 = "ACIPCBTControlClass::%s: Runloop timed out while finding AppleConvergedIPCControl";
    uint32_t v14 = 12;
    goto LABEL_7;
  }
  if ((*(unsigned char *)this & 1) == 0)
  {
LABEL_8:
    uint64_t v11 = 0;
    goto LABEL_20;
  }
  int v10 = v9;
  uint64_t v11 = 0;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v21 = "waitforService";
    __int16 v22 = 1024;
    int v23 = v10;
    mach_port_t v12 = MEMORY[0x263EF8438];
    mach_port_t v13 = "ACIPCBTControlClass::%s: Failed to add notification for service %#x\n";
    uint32_t v14 = 18;
LABEL_7:
    _os_log_impl(&dword_263615000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, v14);
    goto LABEL_8;
  }
LABEL_20:
  CFRunLoopRemoveSource(Current, RunLoopSource, v8);
  IONotificationPortDestroy(v6);
  return v11;
}

void __serviceCallback(__CFRunLoop *a1)
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "AppleConvergedIPCControl found, releasing waiting thread", v2, 2u);
  }
  CFRunLoopStop(a1);
}

BOOL ACIPCBTControlClass::start(ACIPCBTControlClass *this)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if (*((_DWORD *)this + 18))
  {
    BOOL v3 = 1;
  }
  else
  {
    int v4 = ACIPCBTControlClass::waitforService(this);
    BOOL v3 = v4 != 0;
    if (!v4 && (*(unsigned char *)this & 1) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "start";
      _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: could not get matching service\n", (uint8_t *)&v6, 0xCu);
    }
    *((_DWORD *)this + 18) = v4;
  }
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "start";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: --done\n", (uint8_t *)&v6, 0xCu);
  }
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t ACIPCBTControlClass::close_nl(ACIPCBTControlClass *this)
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
  ACIPCBTControlClass::clearNotificationPort(this);
  int v4 = (const void *)*((void *)this + 10);
  if (v4)
  {
    CFRelease(v4);
    *((void *)this + 10) = 0;
  }
  int v5 = *((void *)this + 11);
  if (v5)
  {
    dispatch_release(v5);
    *((void *)this + 11) = 0;
  }
  return v2;
}

void ACIPCBTControlClass::deregisterEventNotification_nl(ACIPCBTControlClass *this, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    mach_port_t v13 = "deregisterEventNotification_nl";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: +\n", buf, 0xCu);
  }
  if (*((void *)this + 14) || *((void *)this + 15))
  {
    IOObjectRelease(*((_DWORD *)this + 36));
    *((_DWORD *)this + 36) = 0;
    ACIPCBTControlClass::clearEventNotificationPort(this);
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
        goto LABEL_25;
      }
    }
    int v5 = a2;
    if (!a2)
    {
      if (*((void *)this + 15))
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
    uint64_t v7 = *((void *)this + 19);
    *((void *)this + 19) = 0;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 0x40000000;
    v11[2] = ___ZN19ACIPCBTControlClass30deregisterEventNotification_nlEP16dispatch_group_s_block_invoke;
    v11[3] = &unk_2655D2310;
    v11[4] = v7;
    v11[5] = v5;
    uint64_t v8 = (__CFRunLoop *)*((void *)this + 14);
    if (v8)
    {
      if (*((void *)this + 15)) {
        ACIPCBTControlClass::deregisterEventNotification_nl();
      }
      CFRunLoopPerformBlock(v8, (CFTypeRef)*MEMORY[0x263EFFE88], v11);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 14));
      CFRelease(*((CFTypeRef *)this + 14));
      *((void *)this + 14) = 0;
    }
    uint64_t v9 = *((void *)this + 15);
    if (v9)
    {
      dispatch_async(v9, v11);
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
LABEL_25:
    if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      mach_port_t v13 = "deregisterEventNotification_nl";
      _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: -\n", buf, 0xCu);
    }
  }
}

void ACIPCBTControlClass::setNotificationPort(ACIPCBTControlClass *this)
{
  if (!*((void *)this + 12))
  {
    uint64_t v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    *((void *)this + 12) = v2;
    if (!v2) {
      ACIPCBTControlClass::setNotificationPort();
    }
    if (*((void *)this + 10))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v2);
      *((void *)this + 13) = RunLoopSource;
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 10), RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    }
    int v4 = *((void *)this + 11);
    if (v4)
    {
      int v5 = (IONotificationPort *)*((void *)this + 12);
      IONotificationPortSetDispatchQueue(v5, v4);
    }
  }
}

void ACIPCBTControlClass::clearNotificationPort(ACIPCBTControlClass *this)
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
    void *v3 = 0;
    v3[1] = 0;
  }
}

void ACIPCBTControlClass::setEventNotificationPort(ACIPCBTControlClass *this)
{
  if (!*((void *)this + 16))
  {
    uint64_t v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    *((void *)this + 16) = v2;
    if (!v2) {
      ACIPCBTControlClass::setEventNotificationPort();
    }
    if (*((void *)this + 14))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v2);
      *((void *)this + 17) = RunLoopSource;
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 14), RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    }
    int v4 = *((void *)this + 15);
    if (v4)
    {
      int v5 = (IONotificationPort *)*((void *)this + 16);
      IONotificationPortSetDispatchQueue(v5, v4);
    }
  }
}

void ACIPCBTControlClass::clearEventNotificationPort(ACIPCBTControlClass *this)
{
  uint64_t v2 = (void *)((char *)this + 128);
  uint64_t v1 = *((void *)this + 16);
  if (v1)
  {
    int v4 = (__CFRunLoop *)*((void *)this + 14);
    uint64_t v5 = *((void *)this + 17);
    uint64_t v6 = MEMORY[0x263EF8330];
    *uint64_t v2 = 0;
    v2[1] = 0;
    block[0] = v6;
    block[1] = 0x40000000;
    block[2] = ___ZN19ACIPCBTControlClass26clearEventNotificationPortEv_block_invoke;
    block[3] = &__block_descriptor_tmp_0;
    block[4] = v4;
    block[5] = v5;
    block[6] = v1;
    if (v4)
    {
      if (*((void *)this + 15)) {
        ACIPCBTControlClass::clearEventNotificationPort();
      }
      CFRunLoopPerformBlock(v4, (CFTypeRef)*MEMORY[0x263EFFE88], block);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 14));
    }
    uint64_t v7 = *((void *)this + 15);
    if (v7)
    {
      if (*((void *)this + 14)) {
        ACIPCBTControlClass::clearEventNotificationPort();
      }
      dispatch_async(v7, block);
    }
  }
}

void ___ZN19ACIPCBTControlClass26clearEventNotificationPortEv_block_invoke(__CFRunLoop **a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    CFRunLoopRemoveSource(v2, a1[5], (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  }
  io_connect_t v3 = a1[6];

  IONotificationPortDestroy(v3);
}

uint64_t ACIPCBTControlClass::open(ACIPCBTControlClass *this, __CFRunLoop *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "open";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: \n", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = ACIPCBTControlClass::open_nl(this, a2, 0);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t ACIPCBTControlClass::open_nl(ACIPCBTControlClass *this, __CFRunLoop *a2, NSObject *a3)
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
              ACIPCBTControlClass::open_nl();
            }
            *((void *)this + 10) = a2;
            CFRetain(a2);
          }
          else if (a3)
          {
            *((void *)this + 11) = a3;
            dispatch_retain(a3);
          }
          ACIPCBTControlClass::setNotificationPort(this);
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

uint64_t ACIPCBTControlClass::open(ACIPCBTControlClass *this, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "open";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: \n", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = ACIPCBTControlClass::open_nl(this, 0, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t ACIPCBTControlClass::close(ACIPCBTControlClass *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "close";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: \n", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = ACIPCBTControlClass::close_nl(this);
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t ACIPCBTControlClass::readLogsAsync(ACIPCBTControlClass *this, void *a2, unsigned int a3, unsigned int a4, void (*a5)(void *, int, void *), void *a6)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v23 = v12;
  long long v24 = v12;
  *(_OWORD *)reference = v12;
  long long v22 = v12;
  mach_port_t v13 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 4) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "readLogsAsync";
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = a2;
    *(_WORD *)&unsigned char buf[22] = 1024;
    unsigned int v20 = a3;
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: buff %p, size %u\n", buf, 0x1Cu);
  }
  uint64_t v14 = (IONotificationPort *)*((void *)this + 12);
  if (v14)
  {
    *(void *)buf = a2;
    *(void *)&buf[8] = a3;
    *(void *)&buf[16] = a4;
    reference[1] = (uint64_t)a5;
    *(void *)&long long v22 = a6;
    mach_port_t v15 = *((_DWORD *)this + 40);
    mach_port_t MachPort = IONotificationPortGetMachPort(v14);
    uint64_t v17 = IOConnectCallAsyncScalarMethod(v15, 2u, MachPort, reference, 3u, (const uint64_t *)buf, 3u, 0, 0);
  }
  else
  {
    uint64_t v17 = 3758097112;
    if ((*(unsigned char *)this & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "readLogsAsync";
      _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: no async port\n", buf, 0xCu);
    }
  }
  pthread_mutex_unlock(v13);
  return v17;
}

uint64_t ACIPCBTControlClass::registerEventNotification(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  uint64_t v7 = ACIPCBTControlClass::registerEventNotification_nl(a1, a2, 0, a3);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t ACIPCBTControlClass::registerEventNotification_nl(uint64_t a1, const void *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 72))
  {
    if (*(void *)(a1 + 152))
    {
      uint64_t v5 = 3758097093;
      if ((*(unsigned char *)a1 & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v18 = "registerEventNotification_nl";
        _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: a notification block is already registered. deregister it before registering a new block", buf, 0xCu);
        return 3758097093;
      }
      return v5;
    }
    if (a4)
    {
      if (*(_DWORD *)a4 == 1)
      {
        uint64_t v8 = *(void *)(a4 + 8);
        if (v8)
        {
          uint64_t v9 = v15;
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 0x40000000;
          char v10 = &unk_2655D22E8;
          uint64_t v11 = ___ZN19ACIPCBTControlClass28registerEventNotification_nlEP11__CFRunLoopP16dispatch_queue_sP17ACIPCControlEvent_block_invoke_12;
          goto LABEL_19;
        }
        uint64_t v5 = 3758097090;
        if ((*(unsigned char *)a1 & 2) == 0 || !os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
          return v5;
        }
        *(_DWORD *)buf = 136315138;
        __int16 v18 = "registerEventNotification_nl";
        long long v12 = MEMORY[0x263EF8438];
        mach_port_t v13 = "ACIPCBTControlClass::%s: timesync block must be provided\n";
      }
      else if (*(_DWORD *)a4)
      {
        uint64_t v5 = 3758097090;
        if ((*(unsigned char *)a1 & 1) == 0 || !os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
          return v5;
        }
        *(_DWORD *)buf = 136315138;
        __int16 v18 = "registerEventNotification_nl";
        long long v12 = MEMORY[0x263EF8438];
        mach_port_t v13 = "ACIPCBTControlClass::%s: invalid event type\n";
      }
      else
      {
        uint64_t v8 = *(void *)(a4 + 8);
        if (v8)
        {
          uint64_t v9 = v16;
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 0x40000000;
          char v10 = &unk_2655D22C0;
          uint64_t v11 = ___ZN19ACIPCBTControlClass28registerEventNotification_nlEP11__CFRunLoopP16dispatch_queue_sP17ACIPCControlEvent_block_invoke;
LABEL_19:
          v9[2] = v11;
          v9[3] = v10;
          v9[4] = v8;
          *(void *)(a1 + 152) = _Block_copy(v9);
          if (a2)
          {
            if (a3) {
              ACIPCBTControlClass::registerEventNotification_nl();
            }
            *(void *)(a1 + 112) = a2;
            CFRetain(a2);
          }
          else if (a3)
          {
            *(void *)(a1 + 120) = a3;
            dispatch_retain(a3);
          }
          ACIPCBTControlClass::setEventNotificationPort((ACIPCBTControlClass *)a1);
          uint64_t v5 = IOServiceAddInterestNotification(*(IONotificationPortRef *)(a1 + 128), *(_DWORD *)(a1 + 72), "IOGeneralInterest", (IOServiceInterestCallback)ACIPCBTControlClass::generalInterestCallback, *(void **)(a1 + 152), (io_object_t *)(a1 + 144));
          if (v5)
          {
            if ((*(unsigned char *)a1 & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              __int16 v18 = "registerEventNotification_nl";
              __int16 v19 = 1024;
              int v20 = v5;
              _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: could not add interest notification on service: %#x\n", buf, 0x12u);
            }
            _Block_release(*(const void **)(a1 + 152));
            *(void *)(a1 + 152) = 0;
            return 3758097084;
          }
          return v5;
        }
        uint64_t v5 = 3758097090;
        if ((*(unsigned char *)a1 & 2) == 0 || !os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
          return v5;
        }
        *(_DWORD *)buf = 136315138;
        __int16 v18 = "registerEventNotification_nl";
        long long v12 = MEMORY[0x263EF8438];
        mach_port_t v13 = "ACIPCBTControlClass::%s: error block must be provided\n";
      }
    }
    else
    {
      uint64_t v5 = 3758097090;
      if ((*(unsigned char *)a1 & 2) == 0 || !os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        return v5;
      }
      *(_DWORD *)buf = 136315138;
      __int16 v18 = "registerEventNotification_nl";
      long long v12 = MEMORY[0x263EF8438];
      mach_port_t v13 = "ACIPCBTControlClass::%s: event parameters must be provided\n";
    }
    _os_log_impl(&dword_263615000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
    return v5;
  }
  uint64_t v5 = 3758097136;
  if ((*(unsigned char *)a1 & 2) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v18 = "registerEventNotification_nl";
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: service is NULL - must successfully start() first\n", buf, 0xCu);
    return 3758097136;
  }
  return v5;
}

uint64_t ACIPCBTControlClass::registerEventNotification(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  uint64_t v7 = ACIPCBTControlClass::registerEventNotification_nl(a1, 0, a2, a3);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t ___ZN19ACIPCBTControlClass28registerEventNotification_nlEP11__CFRunLoopP16dispatch_queue_sP17ACIPCControlEvent_block_invoke(uint64_t result, uint64_t a2, int a3, unsigned int *a4)
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

uint64_t ___ZN19ACIPCBTControlClass28registerEventNotification_nlEP11__CFRunLoopP16dispatch_queue_sP17ACIPCControlEvent_block_invoke_12(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 == -469794558 && a4 != 0)
  {
    uint64_t result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
    }
  }
  return result;
}

void ACIPCBTControlClass::generalInterestCallback(ACIPCBTControlClass *this, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  _Block_copy(this);
  (*((void (**)(ACIPCBTControlClass *, void *, uint64_t, uint64_t))this + 2))(this, a2, a3, a4);

  _Block_release(this);
}

uint64_t ACIPCBTControlClass::deregisterEventNotification(ACIPCBTControlClass *this, NSObject *a2)
{
  int v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  ACIPCBTControlClass::deregisterEventNotification_nl(this, a2);

  return pthread_mutex_unlock(v4);
}

void ___ZN19ACIPCBTControlClass30deregisterEventNotification_nlEP16dispatch_group_s_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 32);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = *(NSObject **)(a1 + 40);
  if (v3)
  {
    dispatch_group_leave(v3);
    int v4 = *(NSObject **)(a1 + 40);
    dispatch_release(v4);
  }
}

BOOL ACIPCBTControlClass::getLogInternalBufferSize(ACIPCBTControlClass *this, unsigned int *a2)
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

uint64_t ACIPCBTControlClass::loggerTune(ACIPCBTControlClass *this, unsigned int a2, unsigned int a3, void *a4, void *a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v10 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  if ((*(unsigned char *)this & 4) != 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)mach_port_t v13 = 136316162;
    *(void *)&void v13[4] = "loggerTune";
    *(_WORD *)&v13[12] = 1024;
    *(_DWORD *)&v13[14] = a2;
    *(_WORD *)&v13[18] = 1024;
    *(_DWORD *)&v13[20] = a3;
    *(_WORD *)uint64_t v14 = 2048;
    *(void *)&v14[2] = a4;
    __int16 v15 = 2048;
    int v16 = a5;
    _os_log_impl(&dword_263615000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::%s: subsystem %u, index %u, arg1 %p, arg2 %p\n", v13, 0x2Cu);
  }
  *(void *)mach_port_t v13 = a2;
  *(void *)&v13[8] = a3;
  *(void *)&v13[16] = a4;
  *(void *)uint64_t v14 = a5;
  uint64_t v11 = IOConnectCallScalarMethod(*((_DWORD *)this + 40), 3u, (const uint64_t *)v13, 4u, 0, 0);
  pthread_mutex_unlock(v10);
  return v11;
}

BOOL ACIPCBTControlClass::getLastKnownBootStage(ACIPCBTControlClass *this, unsigned int *a2)
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

void ACIPCBTClass::stop()
{
}

void ACIPCBTClass::start_nl()
{
}

{
  __assert_rtn("start_nl", "ACIPCBTClass.cpp", 326, "!fQueue");
}

{
  __assert_rtn("start_nl", "ACIPCBTClass.cpp", 275, "!fRunLoopRef");
}

{
  __assert_rtn("start_nl", "ACIPCBTClass.cpp", 269, "!fQueue");
}

{
  __assert_rtn("start_nl", "ACIPCBTClass.cpp", 187, "!queue");
}

void ACIPCBTClass::setNotificationPort()
{
}

void ACIPCBTClass::clearNotificationPort()
{
}

{
  __assert_rtn("clearNotificationPort", "ACIPCBTClass.cpp", 500, "!fQueue");
}

void ACIPCBTControlClass::deregisterEventNotification_nl()
{
}

void ACIPCBTControlClass::setNotificationPort()
{
}

void ACIPCBTControlClass::setEventNotificationPort()
{
}

void ACIPCBTControlClass::clearEventNotificationPort()
{
}

{
  __assert_rtn("clearEventNotificationPort", "ACIPCBTControlClass.cpp", 278, "!fEventQueue");
}

void ACIPCBTControlClass::open_nl()
{
}

void ACIPCBTControlClass::registerEventNotification_nl()
{
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

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
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

void std::terminate(void)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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