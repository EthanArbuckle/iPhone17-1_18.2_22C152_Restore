void MOLogWrite(uint64_t a1, int a2, uint64_t a3, const __CFString *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  MOLogWriteV(a1, a2, a3, a4, &a9);
}

void MOLogWriteV(uint64_t a1, int a2, uint64_t a3, const __CFString *a4, va_list a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v10 = __dst;
  memcpy(__dst, "Error creating CFString", sizeof(__dst));
  CFStringRef v11 = CFStringCreateWithFormatAndArguments(0, 0, a4, a5);
  CFStringRef v12 = v11;
  if (!v11) {
    goto LABEL_14;
  }
  CStringPtr = (char *)CFStringGetCStringPtr(v11, 0x8000100u);
  if (!CStringPtr)
  {
    if (CFStringGetCString(v12, __dst, 1024, 0x8000100u))
    {
      v10 = __dst;
      CStringPtr = __dst;
      goto LABEL_6;
    }
    CFIndex maxBufLen = 0;
    CFIndex Length = CFStringGetLength(v12);
    v27.location = 0;
    v27.length = Length;
    CFIndex Bytes = CFStringGetBytes(v12, v27, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
    if (maxBufLen >= 1 && Bytes == Length)
    {
      v17 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x6B5D4F1EuLL);
      if (v17)
      {
        v10 = (char *)v17;
        CFIndex usedBufLen = 0;
        v28.location = 0;
        v28.length = Length;
        CFIndex v18 = CFStringGetBytes(v12, v28, 0x8000100u, 0, 0, v17, maxBufLen, &usedBufLen);
        BOOL v19 = v18 == Length;
        if (v18 == Length)
        {
          size_t v14 = usedBufLen;
          v10[usedBufLen] = 0;
        }
        else
        {
          free(v10);
          v10 = __dst;
          __strlcpy_chk();
          size_t v14 = 0;
        }
        goto LABEL_16;
      }
    }
    v10 = __dst;
    __strlcpy_chk();
LABEL_14:
    size_t v14 = 0;
    goto LABEL_15;
  }
  v10 = CStringPtr;
LABEL_6:
  size_t v14 = strlen(CStringPtr);
LABEL_15:
  BOOL v19 = 0;
LABEL_16:
  pthread_self();
  if (a3) {
    asl_log(0, 0, a2, "%p %s: %s\n");
  }
  else {
    asl_log(0, 0, a2, "%p %s\n");
  }
  if (a1 && *(void *)(a1 + 8))
  {
    v20 = *(NSObject **)a1;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __MOLogWriteV_block_invoke;
    block[3] = &__block_descriptor_tmp_19_0;
    block[4] = a1;
    block[5] = a3;
    int v22 = a2;
    block[6] = v10;
    block[7] = v14;
    dispatch_sync(v20, block);
  }
  if (v19) {
    free(v10);
  }
  if (v12) {
    CFRelease(v12);
  }
}

void *MOXPCTransportOpen(const char *a1, unsigned int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  memcpy(__dst, "com.apple.MobileSystemServices.XPCConnectionQueue.", sizeof(__dst));
  __strlcat_chk();
  v4 = dispatch_queue_create(__dst, MEMORY[0x263EF83A8]);
  xpc_connection_t mach_service = xpc_connection_create_mach_service(a1, v4, a2);
  if (mach_service)
  {
    v10 = mach_service;
    CFStringRef v11 = malloc_type_calloc(1uLL, 0x48uLL, 0x10A004046B7DE22uLL);
    CFStringRef v12 = v11;
    if (v11)
    {
      v11[1] = v10;
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
      v12[2] = v4;
      v12[3] = v13;
      *((unsigned char *)v12 + 64) = v12[8] & 0xFE | a2;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = __MOXPCTransportOpen_block_invoke;
      handler[3] = &__block_descriptor_tmp_15;
      handler[4] = v12;
      char v17 = a2;
      xpc_connection_set_event_handler(v10, handler);
    }
    else
    {
      xpc_release(v10);
    }
  }
  else
  {
    MOLogWrite(0, 3, (uint64_t)"MOXPCTransportOpen", @"Failed to create xpc_connection!", v6, v7, v8, v9, v15);
    return 0;
  }
  return v12;
}

void __MOXPCTransportOpen_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    MOLogWrite(0, 3, (uint64_t)"MOXPCTransportOpen_block_invoke", @"Got event on connection for %p when connection was NULL!", a5, a6, a7, a8, *(void *)(a1 + 32));
    return;
  }
  uint64_t v11 = MEMORY[0x210568780](a2);
  if (v11 == MEMORY[0x263EF86F0])
  {
    if (*(unsigned char *)(a1 + 40))
    {
      xpc_object_t v22 = xpc_retain(a2);
      uint64_t v23 = *(void *)(a1 + 32);
      v24 = *(NSObject **)(v23 + 16);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 0x40000000;
      aBlock[2] = __MOXPCTransportOpen_block_invoke_2;
      aBlock[3] = &__block_descriptor_tmp;
      aBlock[4] = v23;
      aBlock[5] = a2;
      MEMORY[0x2105687B0](v22);
      v25 = _Block_copy(aBlock);
      dispatch_async_f(v24, v25, (dispatch_function_t)transactionRunner);
      return;
    }
    CFStringRef v38 = @"Got connection on non-listener connection!?";
    goto LABEL_31;
  }
  if (v11 == MEMORY[0x263EF8720])
  {
    uint64_t v26 = *(void *)(a1 + 32);
    char string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
    v32 = (void *)MEMORY[0x263EF86A8];
    BOOL v34 = a2 == (void *)MEMORY[0x263EF86A0] || a2 == (void *)MEMORY[0x263EF86A8];
    if (a2 != (void *)MEMORY[0x263EF86C0] && !v34) {
      MOLogWrite(0, 3, (uint64_t)"_HandleConnectionError", @"unknown server connection error: %s", v28, v29, v30, v31, string);
    }
    char v35 = !v34;
    if (!*(void *)v26) {
      char v35 = 1;
    }
    if ((v35 & 1) == 0)
    {
      pthread_mutex_lock(*(pthread_mutex_t **)v26);
      v36 = *(pthread_mutex_t **)v26;
      v37 = *(const void **)(*(void *)v26 + 112);
      if (v37)
      {
        CFRelease(v37);
        v36 = *(pthread_mutex_t **)v26;
        *(void *)(*(void *)v26 + 112) = 0;
      }
      pthread_cond_broadcast((pthread_cond_t *)&v36[1]);
      pthread_mutex_unlock(*(pthread_mutex_t **)v26);
    }
    if (a2 == v32)
    {
      v39 = *(NSObject **)(v26 + 24);
      dispatch_semaphore_signal(v39);
    }
  }
  else
  {
    if (v11 != MEMORY[0x263EF8708])
    {
      char v17 = (void *)MEMORY[0x210568760](a2);
      MOLogWrite(0, 3, (uint64_t)"MOXPCTransportOpen_block_invoke", @"received unhandled event from server: %s", v18, v19, v20, v21, (char)v17);
      free(v17);
      return;
    }
    if (*(unsigned char *)(a1 + 40))
    {
      CFStringRef v38 = @"Got dictionary on listener connection! Ignoring.";
LABEL_31:
      MOLogWrite(0, 3, (uint64_t)"MOXPCTransportOpen_block_invoke", v38, v13, v14, v15, v16, a9);
      return;
    }
    uint64_t v40 = *(void *)(a1 + 32);
    v41 = *(_xpc_connection_s **)(v40 + 8);
    _HandleIncomingMessage(v40, v41, a2, v12, v13, v14, v15, v16, a9);
  }
}

void MOXPCTransportRunTransactionalTask(NSObject *a1, const void *a2)
{
  MEMORY[0x2105687B0]();
  v4 = _Block_copy(a2);

  dispatch_async_f(a1, v4, (dispatch_function_t)transactionRunner);
}

void __MOXPCTransportOpen_block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(_xpc_connection_s **)(a1 + 40);
  if (*(void *)(v3 + 48))
  {
    v4 = *(NSObject **)(v3 + 56);
    if (v4)
    {
      uint64_t handler = 0;
      p_uint64_t handler = (uint64_t)&handler;
      uint64_t v8 = 0x2000000000;
      LOBYTE(v9) = 0;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = ___HandleListenerConnection_block_invoke;
      block[3] = &unk_26412A868;
      block[4] = &handler;
      block[5] = v3;
      block[6] = v2;
      dispatch_sync(v4, block);
      if (!*(unsigned char *)(p_handler + 24))
      {
        xpc_connection_cancel(v2);
        _Block_object_dispose(&handler, 8);
        goto LABEL_6;
      }
      _Block_object_dispose(&handler, 8);
    }
  }
  xpc_object_t v5 = xpc_retain(v2);
  MEMORY[0x2105687B0](v5);
  xpc_connection_set_target_queue(v2, *(dispatch_queue_t *)(v3 + 16));
  uint64_t handler = MEMORY[0x263EF8330];
  p_uint64_t handler = 0x40000000;
  uint64_t v8 = (uint64_t)___HandleListenerConnection_block_invoke_2;
  uint64_t v9 = &__block_descriptor_tmp_48;
  uint64_t v10 = v3;
  uint64_t v11 = v2;
  xpc_connection_set_event_handler(v2, &handler);
  xpc_connection_resume(v2);
LABEL_6:
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

void _HandleIncomingMessage(uint64_t a1, _xpc_connection_s *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12 = (const void *)_CFXPCCreateCFObjectFromXPCMessage();
  if (v12)
  {
    char v17 = v12;
    CFTypeID v18 = CFGetTypeID(v12);
    if (v18 == CFDictionaryGetTypeID())
    {
      if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
      {
        if ((*(unsigned char *)(a1 + 64) & 1) != 0 && !xpc_connection_get_context(a2))
        {
          xpc_retain(a3);
          xpc_connection_set_context(a2, a3);
        }
        CFRetain(v17);
        xpc_object_t v23 = xpc_retain(a2);
        v24 = *(NSObject **)(a1 + 40);
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 0x40000000;
        aBlock[2] = ___HandleIncomingMessage_block_invoke;
        aBlock[3] = &__block_descriptor_tmp_55;
        aBlock[4] = a1;
        aBlock[5] = a2;
        void aBlock[6] = v17;
        MEMORY[0x2105687B0](v23);
        v25 = _Block_copy(aBlock);
        dispatch_async_f(v24, v25, (dispatch_function_t)transactionRunner);
        goto LABEL_18;
      }
      if (*(void *)a1)
      {
        pthread_mutex_lock(*(pthread_mutex_t **)a1);
        CFRange v27 = *(pthread_mutex_t **)a1;
        if (*(void *)(*(void *)a1 + 112))
        {
          CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)a1 + 112), v17);
          pthread_cond_signal((pthread_cond_t *)(*(void *)a1 + 64));
          CFRange v27 = *(pthread_mutex_t **)a1;
        }
        pthread_mutex_unlock(v27);
        goto LABEL_18;
      }
      CFStringRef v26 = @"No message handler set and no support for receiving messages; dropping message.";
    }
    else
    {
      CFStringRef v26 = @"Message received was not a CFDictionary";
    }
    MOLogWrite(0, 3, (uint64_t)"_HandleIncomingMessage", v26, v19, v20, v21, v22, v28);
LABEL_18:
    CFRelease(v17);
    return;
  }

  MOLogWrite(0, 3, (uint64_t)"_HandleIncomingMessage", @"Payload data received from client did not contain a CF object or failed to deserialize.", v13, v14, v15, v16, a9);
}

void *MOXPCTransportSetConnectionAuthHandler(uint64_t a1, dispatch_object_t object, void *aBlock)
{
  if ((*(unsigned char *)(a1 + 64) & 2) != 0) {
    MOXPCTransportSetConnectionAuthHandler_cold_2();
  }
  if ((*(unsigned char *)(a1 + 64) & 1) == 0) {
    MOXPCTransportSetConnectionAuthHandler_cold_1();
  }
  uint64_t v6 = *(NSObject **)(a1 + 56);
  if (v6) {
    dispatch_release(v6);
  }
  uint64_t v7 = *(const void **)(a1 + 48);
  if (v7) {
    _Block_release(v7);
  }
  if (object) {
    dispatch_retain(object);
  }
  *(void *)(a1 + 56) = object;
  if (aBlock) {
    result = _Block_copy(aBlock);
  }
  else {
    result = 0;
  }
  *(void *)(a1 + 48) = result;
  return result;
}

void *MOXPCTransportSetMessageHandler(uint64_t a1, dispatch_object_t object, void *aBlock)
{
  if ((*(unsigned char *)(a1 + 64) & 2) != 0) {
    MOXPCTransportSetMessageHandler_cold_1();
  }
  uint64_t v6 = *(NSObject **)(a1 + 40);
  if (v6) {
    dispatch_release(v6);
  }
  uint64_t v7 = *(const void **)(a1 + 32);
  if (v7) {
    _Block_release(v7);
  }
  if (object) {
    dispatch_retain(object);
  }
  *(void *)(a1 + 40) = object;
  if (aBlock) {
    result = _Block_copy(aBlock);
  }
  else {
    result = 0;
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void MOXPCTransportResume(void **a1)
{
  if (((_BYTE)a1[8] & 2) == 0)
  {
    *((unsigned char *)a1 + 64) |= 2u;
    if (!a1[4])
    {
      *a1 = malloc_type_malloc(0x78uLL, 0x1020040DDEB3994uLL);
      CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      uint64_t v3 = (pthread_mutex_t *)*a1;
      *(void *)&v3[1].__opaque[40] = Mutable;
      pthread_mutex_init(v3, 0);
      pthread_cond_init((pthread_cond_t *)((char *)*a1 + 64), 0);
    }
    v4 = (_xpc_connection_s *)a1[1];
    xpc_connection_resume(v4);
  }
}

void MOXPCTransportClose(uint64_t *a1)
{
  v2 = (_xpc_connection_s *)a1[1];
  if (v2)
  {
    xpc_connection_cancel(v2);
    uint64_t v3 = a1[3];
    if (v3) {
      dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    }
    xpc_release((xpc_object_t)a1[1]);
    a1[1] = 0;
  }
  v4 = a1[2];
  if (v4)
  {
    dispatch_barrier_sync(v4, &__block_literal_global);
    dispatch_release((dispatch_object_t)a1[2]);
    a1[2] = 0;
  }
  xpc_object_t v5 = a1[3];
  if (v5)
  {
    dispatch_release(v5);
    a1[3] = 0;
  }
  uint64_t v6 = (const void *)a1[4];
  if (v6)
  {
    _Block_release(v6);
    a1[4] = 0;
  }
  uint64_t v7 = a1[5];
  if (v7)
  {
    dispatch_release(v7);
    a1[5] = 0;
  }
  uint64_t v8 = (const void *)a1[6];
  if (v8)
  {
    _Block_release(v8);
    a1[6] = 0;
  }
  uint64_t v9 = a1[7];
  if (v9)
  {
    dispatch_release(v9);
    a1[7] = 0;
  }
  uint64_t v10 = *a1;
  if (*a1)
  {
    uint64_t v11 = *(const void **)(v10 + 112);
    if (v11)
    {
      CFRelease(v11);
      uint64_t v10 = *a1;
      *(void *)(*a1 + 112) = 0;
    }
    pthread_cond_destroy((pthread_cond_t *)(v10 + 64));
    pthread_mutex_destroy((pthread_mutex_t *)*a1);
    free((void *)*a1);
  }

  free(a1);
}

BOOL MOXPCTransportSendMessageOnConnection(_xpc_connection_s *a1)
{
  uint64_t v6 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  if (v6)
  {
    xpc_connection_send_message(a1, v6);
    xpc_release(v6);
  }
  else
  {
    MOLogWrite(0, 3, (uint64_t)"MOXPCTransportSendMessageOnConnection", @"Failed to create xpc dictionary", v2, v3, v4, v5, v8);
  }
  return v6 != 0;
}

BOOL MOXPCTransportSendMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a1 + 64))
  {
    MOLogWrite(0, 3, (uint64_t)"MOXPCTransportSendMessage", @"Can't send a message on a server transport handle!", a5, a6, a7, a8, vars0);
    return 0;
  }
  else
  {
    char v8 = *(_xpc_connection_s **)(a1 + 8);
    return MOXPCTransportSendMessageOnConnection(v8);
  }
}

const void *MOXPCTransportReceiveMessage(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v31.tv_sec = 0;
  v31.tv_nsec = 0;
  uint64_t v9 = *(pthread_mutex_t **)a1;
  if (v9 && !*(void *)(a1 + 32))
  {
    if (a2 == 0x7FFFFFFF)
    {
      pthread_mutex_lock(v9);
      char v17 = *(pthread_mutex_t **)a1;
    }
    else
    {
      v30.tv_sec = 0;
      *(void *)&v30.tv_usec = 0;
      if (gettimeofday(&v30, 0))
      {
        int v29 = *__error();
        MOLogWrite(0, 3, (uint64_t)"MOXPCTransportReceiveMessage", @"gettimeofday returned error %d", v22, v23, v24, v25, v29);
        return 0;
      }
      v31.tv_sec = v30.tv_sec + a2;
      v31.tv_nsec = 1000 * v30.tv_usec;
      pthread_mutex_lock(*(pthread_mutex_t **)a1);
      char v17 = *(pthread_mutex_t **)a1;
      if (!a2)
      {
LABEL_19:
        CFArrayRef v26 = *(const __CFArray **)&v17[1].__opaque[40];
        if (v26)
        {
          if (CFArrayGetCount(v26))
          {
            ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)a1 + 112), 0);
            CFRetain(ValueAtIndex);
            CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(void *)a1 + 112), 0);
LABEL_24:
            pthread_mutex_unlock(*(pthread_mutex_t **)a1);
            return ValueAtIndex;
          }
        }
        else
        {
          MOLogWrite(0, 3, (uint64_t)"MOXPCTransportReceiveMessage", @"Connection blew up while waiting for messages on %p", v13, v14, v15, v16, a1);
        }
        ValueAtIndex = 0;
        goto LABEL_24;
      }
    }
    CFArrayRef v18 = *(const __CFArray **)&v17[1].__opaque[40];
    if (v18)
    {
      while (1)
      {
        CFIndex Count = CFArrayGetCount(v18);
        char v17 = *(pthread_mutex_t **)a1;
        if (Count) {
          goto LABEL_19;
        }
        uint64_t v20 = (pthread_cond_t *)&v17[1];
        if (a2 == 0x7FFFFFFF)
        {
          if (pthread_cond_wait(v20, v17))
          {
            CFStringRef v27 = @"pthread_cond_wait failed";
            goto LABEL_28;
          }
        }
        else
        {
          int v21 = pthread_cond_timedwait(v20, v17, &v31);
          if (v21)
          {
            if (v21 == 60)
            {
              MOLogWrite(0, 3, (uint64_t)"MOXPCTransportReceiveMessage", @"Timed out waiting for message on %p", v13, v14, v15, v16, a1);
LABEL_29:
              pthread_mutex_unlock(*(pthread_mutex_t **)a1);
              return 0;
            }
            char v28 = v21;
            CFStringRef v27 = @"pthread_cond_timedwait returned error %d\n";
LABEL_28:
            MOLogWrite(0, 3, (uint64_t)"MOXPCTransportReceiveMessage", v27, v13, v14, v15, v16, v28);
            goto LABEL_29;
          }
        }
        char v17 = *(pthread_mutex_t **)a1;
        CFArrayRef v18 = *(const __CFArray **)(*(void *)a1 + 112);
        if (!v18) {
          goto LABEL_19;
        }
      }
    }
    goto LABEL_19;
  }
  MOLogWrite(0, 3, (uint64_t)"MOXPCTransportReceiveMessage", @"Can't call MOXPCTransportReceiveMessage with a message handler set!", a5, a6, a7, a8, v28);
  return 0;
}

void transactionRunner(uint64_t (**a1)(void))
{
  uint64_t v2 = a1[2]();
  MEMORY[0x2105687C0](v2);

  _Block_release(a1);
}

char *MOLogOpen(const char *a1, int a2)
{
  uint64_t v4 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0x10700405B918952uLL);
  *(void *)uint64_t v4 = dispatch_queue_create("com.apple.MobileSystemServices.Logging", 0);
  *((void *)v4 + 2) = strdup(a1);
  *((_DWORD *)v4 + 11) = a2;
  *((_DWORD *)v4 + 12) = a2;
  *(void *)(v4 + 36) = -1;
  uint64_t v14 = 0;
  asprintf(&v14, "com.apple.MobileSystemServices.Logging.%s", a1);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = __MOLogOpen_block_invoke;
  handler[3] = &__block_descriptor_tmp_0;
  handler[4] = v4;
  uint64_t v5 = v14;
  global_queue = dispatch_get_global_queue(0, 0);
  if (notify_register_dispatch(v5, (int *)v4 + 10, global_queue, handler))
  {
    MOLogWrite((uint64_t)v4, 5, 0, @"failed to register for %s notification", v7, v8, v9, v10, (char)v14);
    *((_DWORD *)v4 + 10) = -1;
  }
  free(v14);
  uint64_t v11 = *(NSObject **)v4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___MOLogLoadPreferences_block_invoke;
  block[3] = &__block_descriptor_tmp_28;
  block[4] = v4;
  dispatch_sync(v11, block);
  return v4;
}

void __MOLogOpen_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject ***)(a1 + 32);
  uint64_t v3 = *v2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___MOLogLoadPreferences_block_invoke;
  block[3] = &__block_descriptor_tmp_28;
  block[4] = v2;
  dispatch_sync(v3, block);
  MOLogWrite(*(void *)(a1 + 32), 5, 0, @"%s: set log level to %s", v4, v5, v6, v7, *(void *)(*(void *)(a1 + 32) + 16));
}

void MOLogEnableDiskLogging(NSObject **a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = __MOLogEnableDiskLogging_block_invoke;
  v5[3] = &__block_descriptor_tmp_8;
  v5[4] = a1;
  v5[5] = a2;
  v5[6] = a4;
  int v6 = a3;
  dispatch_sync(v4, v5);
}

char *__MOLogEnableDiskLogging_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  if (v3)
  {
    free(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  int v4 = *(_DWORD *)(v2 + 36);
  if ((v4 & 0x80000000) == 0)
  {
    close(v4);
    uint64_t v2 = *(void *)(a1 + 32);
    *(_DWORD *)(v2 + 36) = -1;
  }
  result = *(char **)(a1 + 40);
  if (result) {
    result = strdup(result);
  }
  *(void *)(v2 + 8) = result;
  uint64_t v6 = *(void *)(a1 + 32);
  *(void *)(v6 + 24) = *(void *)(a1 + 48);
  *(_DWORD *)(v6 + 32) = *(_DWORD *)(a1 + 56);
  return result;
}

void MOLogClose(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 40);
  if ((v2 & 0x80000000) == 0) {
    notify_cancel(v2);
  }
  dispatch_release(*(dispatch_object_t *)a1);
  int v3 = *(_DWORD *)(a1 + 36);
  if ((v3 & 0x80000000) == 0) {
    close(v3);
  }
  int v4 = *(void **)(a1 + 8);
  if (v4) {
    free(v4);
  }
  uint64_t v5 = *(void **)(a1 + 16);
  if (v5) {
    free(v5);
  }

  free((void *)a1);
}

void *__MOLogWriteV_block_invoke(void *result)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (*(void *)(result[4] + 8))
  {
    v1 = result;
    time_t v21 = 0;
    time(&v21);
    int v2 = ctime(&v21);
    v2[strlen(v2) - 1] = 0;
    uint64_t v3 = v1[5];
    getpid();
    pthread_self();
    if (v3) {
      snprintf(__str, 0x400uLL, "%s [%d] <%s> (%p) %s: ");
    }
    else {
      snprintf(__str, 0x400uLL, "%s [%d] <%s> (%p) ");
    }
    int v4 = *(_DWORD *)(v1[4] + 36);
    if (v4 != -1) {
      goto LABEL_23;
    }
    __strlcpy_chk();
    if (__s.__pn_.__r_.__value_.__s.__data_[0])
    {
      uint64_t v5 = (std::__fs::filesystem::path *)((char *)&__s + strlen((const char *)&__s) - 1);
      while (v5 > &__s)
      {
        int v6 = v5->__pn_.__r_.__value_.__s.__data_[0];
        uint64_t v5 = (std::__fs::filesystem::path *)((char *)v5 - 1);
        if (v6 != 47)
        {
          while (v5 > &__s)
          {
            int v7 = v5->__pn_.__r_.__value_.__s.__data_[0];
            uint64_t v5 = (std::__fs::filesystem::path *)((char *)v5 - 1);
            if (v7 == 47)
            {
              uint64_t v5 = (std::__fs::filesystem::path *)((char *)v5 + 1);
              goto LABEL_13;
            }
          }
          goto LABEL_18;
        }
      }
LABEL_13:
      if (v5 != &__s)
      {
        uint64_t v8 = (unsigned __int8 *)&v5[-1].__pn_.__r_.__value_.__r.__words[2] + 7;
        do
        {
          uint64_t v9 = v5;
          if (v8 <= (unsigned __int8 *)&__s) {
            break;
          }
          int v10 = *v8--;
          uint64_t v5 = (std::__fs::filesystem::path *)((char *)v5 - 1);
        }
        while (v10 == 47);
        v9->__pn_.__r_.__value_.__s.__data_[0] = 0;
        goto LABEL_22;
      }
LABEL_18:
      if (__s.__pn_.__r_.__value_.__s.__data_[0] == 47) {
        __int16 v11 = 47;
      }
      else {
        __int16 v11 = 46;
      }
      LOWORD(__s.__pn_.__r_.__value_.__l.__data_) = v11;
    }
LABEL_22:
    mkpath_np((const char *)&__s, 0x1EDu);
    snprintf((char *)&__s, 0x400uLL, "%s.0", *(const char **)(v1[4] + 8));
    result = (void *)open((const char *)&__s, 521, 420);
    int v4 = (int)result;
    *(_DWORD *)(v1[4] + 36) = result;
    if (result != -1)
    {
LABEL_23:
      size_t v12 = strlen(__str);
      memset(&v20, 0, sizeof(v20));
      v22.iov_base = __str;
      v22.iov_len = v12;
      uint64_t v13 = v1[7];
      uint64_t v23 = v1[6];
      uint64_t v24 = v13;
      uint64_t v25 = "\n";
      uint64_t v26 = 1;
      writev(v4, &v22, 3);
      result = (void *)fstat(*(_DWORD *)(v1[4] + 36), &v20);
      if (!result)
      {
        uint64_t v14 = v1[4];
        if (v20.st_size >= *(void *)(v14 + 24))
        {
          close(*(_DWORD *)(v14 + 36));
          uint64_t v15 = v1[4];
          *(_DWORD *)(v15 + 36) = -1;
          snprintf((char *)&__s, 0x400uLL, "%s.%d", *(const char **)(v15 + 8), *(_DWORD *)(v15 + 32));
          result = (void *)unlink((const char *)&__s);
          int v16 = *(_DWORD *)(v1[4] + 32) - 1;
          if (v16 >= 0)
          {
            do
            {
              snprintf((char *)&__s, 0x400uLL, "%s.%d", *(const char **)(v1[4] + 8), v16);
              int v17 = v16 + 1;
              snprintf((char *)&__to, 0x400uLL, "%s.%d", *(const char **)(v1[4] + 8), v16 + 1);
              rename(&__s, &__to, v18);
              result = (void *)open((const char *)&__to, 265);
              if (result != -1)
              {
                int v19 = (int)result;
                fcntl((int)result, 64, 3);
                result = (void *)close(v19);
              }
              int v16 = v17 - 2;
            }
            while (v17 - 1 > 0);
          }
        }
      }
    }
  }
  return result;
}

uint64_t MOLogSetLogLevel(const char *a1, unsigned int a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int valuePtr = a2;
  if (sysconf(71) == -1) {
    abort();
  }
  uint64_t v4 = MEMORY[0x270FA5388]();
  memset(&v14, 0, sizeof(v14));
  uint64_t v13 = 0;
  if (getpwnam_r("mobile", &v14, (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v5, &v13)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v13 == 0;
  }
  if (!v6 && geteuid() != v14.pw_uid) {
    return 1;
  }
  CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"MobileSystemServices-%s-%s", a1, "LogLevel");
  if (a2 == -1)
  {
    CFNumberRef v8 = 0;
  }
  else
  {
    if ((a2 & 0x80000000) != 0)
    {
      int valuePtr = 0;
    }
    else if (a2 >= 8)
    {
      int valuePtr = 7;
    }
    CFNumberRef v8 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  }
  CFStringRef v10 = (const __CFString *)*MEMORY[0x263EFFE48];
  CFStringRef v11 = (const __CFString *)*MEMORY[0x263EFFE68];
  CFPreferencesSetValue(v7, v8, (CFStringRef)*MEMORY[0x263EFFE48], @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]);
  CFPreferencesSynchronize(v10, @"mobile", v11);
  if (v8) {
    CFRelease(v8);
  }
  CFRelease(v7);
  size_t v12 = 0;
  asprintf(&v12, "com.apple.MobileSystemServices.Logging.%s", a1);
  notify_post(v12);
  free(v12);
  return 0;
}

uint64_t MOLogGetLogLevel(uint64_t a1)
{
  uint64_t v2 = 0xFFFFFFFFLL;
  unsigned int v5 = -1;
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x263EFFE48], @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]);
  if (_MOLogGetPreferenceIntValue(a1, (SInt32 *)&v5))
  {
    if (v5 >= 7) {
      unsigned int v3 = 7;
    }
    else {
      unsigned int v3 = v5;
    }
    if ((v5 & 0x80000000) == 0) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return v2;
}

BOOL _MOLogGetPreferenceIntValue(uint64_t a1, SInt32 *a2)
{
  CFStringRef v3 = CFStringCreateWithFormat(0, 0, @"MobileSystemServices-%s-%s", a1, "LogLevel");
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  CFNumberRef v5 = (const __CFNumber *)CFPreferencesCopyValue(v3, (CFStringRef)*MEMORY[0x263EFFE48], @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFNumberGetTypeID())
    {
      BOOL v8 = CFNumberGetValue(v6, kCFNumberIntType, a2) != 0;
    }
    else
    {
      CFTypeID v9 = CFGetTypeID(v6);
      if (v9 == CFStringGetTypeID())
      {
        *a2 = CFStringGetIntValue((CFStringRef)v6);
        BOOL v8 = 1;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    CFRelease(v6);
  }
  else
  {
    BOOL v8 = 0;
  }
  CFRelease(v4);
  return v8;
}

CFDataRef MOCreateSerializedData(CFPropertyListRef propertyList)
{
  CFErrorRef error = 0;
  CFDataRef v5 = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x263EFFB08], propertyList, kCFPropertyListBinaryFormat_v1_0, 0, &error);
  if (!v5)
  {
    MOLogWrite(0, 3, (uint64_t)"MOCreateSerializedData", @"Failed to serialize: %@\n", v1, v2, v3, v4, (char)error);
    if (error) {
      CFRelease(error);
    }
  }
  return v5;
}

CFPropertyListRef MOCreateCFTypeFromSerializedBuffer(UInt8 *bytes, CFIndex length)
{
  CFErrorRef error = 0;
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v3 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  if (v3)
  {
    CFDataRef v8 = v3;
    CFPropertyListRef v13 = CFPropertyListCreateWithData(v2, v3, 0, 0, &error);
    if (!v13)
    {
      MOLogWrite(0, 3, (uint64_t)"MOCreateCFTypeFromSerializedBuffer", @"Unserialization failed: %@\n", v9, v10, v11, v12, (char)error);
      if (error) {
        CFRelease(error);
      }
    }
    CFRelease(v8);
  }
  else
  {
    MOLogWrite(0, 3, (uint64_t)"MOCreateCFTypeFromSerializedBuffer", @"Failed to create data from buffer", v4, v5, v6, v7, v15);
    return 0;
  }
  return v13;
}

void MOXPCTransportSetConnectionAuthHandler_cold_1()
{
}

void MOXPCTransportSetConnectionAuthHandler_cold_2()
{
}

void MOXPCTransportSetMessageHandler_cold_1()
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x270EFDD50](trust, result);
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

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x270EE5790]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x270EE57A0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x270ED7ED8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void abort(void)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x270ED8648](client, msg, *(void *)&level, format);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

char *__cdecl ctime(const time_t *a1)
{
  return (char *)MEMORY[0x270ED9168](a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x270ED9D30](a1, a2, a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x270EDA550](path, omode);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE78](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
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

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x270EDB7C8](*(void *)&a1);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x270EDBC38](*(void *)&a1, a2, *(void *)&a3);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x270EDBE78](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

void xpc_transaction_begin(void)
{
}

void xpc_transaction_end(void)
{
}