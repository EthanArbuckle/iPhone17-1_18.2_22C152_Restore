const void *lockdown_copy_value(uint64_t *a1, const void *a2, const void *a3)
{
  const void *value;
  CFTypeRef cf;

  cf = 0;
  value = send_get_value(*a1, a2, a3, (CFStringRef *)&cf);
  if (cf) {
    CFRelease(cf);
  }
  return value;
}

const void *send_get_value(uint64_t a1, const void *a2, const void *a3, CFStringRef *a4)
{
  if (a4) {
    *a4 = 0;
  }
  message = _create_message(@"GetValue");
  if (message)
  {
    v15 = message;
    if (a2) {
      CFDictionarySetValue(message, @"Domain", a2);
    }
    if (a3) {
      CFDictionarySetValue(v15, @"Key", a3);
    }
    if (lockconn_send_message(a1, v15, v9, v10, v11, v12, v13, v14)) {
      goto LABEL_9;
    }
    CFDictionaryRef v17 = lockconn_receive_message(a1);
    if (v17)
    {
      CFDictionaryRef v18 = v17;
      Value = CFDictionaryGetValue(v17, @"Value");
      v16 = Value;
      if (Value) {
        CFRetain(Value);
      }
      CFStringRef v20 = (const __CFString *)CFDictionaryGetValue(v18, @"Error");
      if (a4)
      {
        CFStringRef v21 = v20;
        if (v20)
        {
          CFRetain(v20);
          *a4 = v21;
        }
      }
      CFRelease(v18);
      goto LABEL_20;
    }
    if (!a4)
    {
LABEL_9:
      v16 = 0;
    }
    else
    {
      v16 = 0;
      *a4 = CFStringCreateCopy(0, @"InvalidResponse");
    }
LABEL_20:
    CFRelease(v15);
    return v16;
  }
  return 0;
}

uint64_t lockconn_send_message(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _send_message(a1, a2, kCFPropertyListXMLFormat_v1_0, a4, a5, a6, a7, a8);
}

CFDictionaryRef lockconn_receive_message(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  CFDictionaryRef v2 = (const __CFDictionary *)_receive_message(a1);
  CFDictionaryRef v3 = v2;
  if (v2)
  {
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFDictionaryGetTypeID())
    {
      if (!*(_DWORD *)(a1 + 32))
      {
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v3, @"ProtocolVersion");
        if (Value)
        {
          CFStringRef v12 = Value;
          CFTypeID v13 = CFGetTypeID(Value);
          if (v13 == CFStringGetTypeID())
          {
            IntCFStringRef Value = CFStringGetIntValue(v12);
            if (IntValue >= 1) {
              *(_DWORD *)(a1 + 32) = IntValue;
            }
          }
        }
      }
      goto LABEL_5;
    }
    locklog(0, "lockconn_receive_message", @"Ignoring message that is not the right type.\n", v5, v6, v7, v8, v9, v15);
    CFRelease(v3);
    return 0;
  }
LABEL_5:
  lockdown_warning_break(v3);
  return v3;
}

void lockdown_warning_break(const __CFDictionary *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a1)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, @"Warning");
    if (Value)
    {
      CFStringRef v2 = Value;
      memcpy(__dst, "Error creating CFString", sizeof(__dst));
      LODWORD(v2) = CFStringGetCString(v2, __dst, 1024, 0x8000100u);
      BOOL v3 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT);
      if (!v2)
      {
        if (!v3) {
          return;
        }
        LOWORD(v6) = 0;
        CFTypeID v4 = MEMORY[0x263EF8438];
        uint64_t v5 = "CFStringGetCString failure in lockdown_warning_break";
        goto LABEL_10;
      }
      if (v3)
      {
        int v6 = 136315138;
        uint64_t v7 = __dst;
        _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v6) = 0;
        CFTypeID v4 = MEMORY[0x263EF8438];
        uint64_t v5 = "*** this is a CLIENT bug, NOT a lockdown bug; set a breakpoint in lockdown_warning_break to debug";
LABEL_10:
        _os_log_impl(&dword_21077C000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v6, 2u);
      }
    }
  }
}

__CFDictionary *_create_message(const void *a1)
{
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  BOOL v3 = Mutable;
  if (Mutable)
  {
    CFDictionarySetValue(Mutable, @"Request", a1);
    CFDictionarySetValue(v3, @"ProtocolVersion", @"2");
    CFTypeID v4 = getprogname();
    if (v4)
    {
      CFStringRef v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, 0x8000100u);
      if (v5)
      {
        CFStringRef v6 = v5;
        CFDictionarySetValue(v3, @"Label", v5);
        CFRelease(v6);
      }
    }
  }
  return v3;
}

void lockdown_disconnect(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      uint64_t heartbeat_ref = lockconn_get_heartbeat_ref(v2);
      if (heartbeat_ref)
      {
        uint64_t v4 = heartbeat_ref;
        xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
        if (v5)
        {
          uint64_t v11 = v5;
          xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.mobile.heartbeat", 0, 0);
          if (mach_service)
          {
            CFDictionaryRef v18 = mach_service;
            xpc_dictionary_set_uint64(v11, "HB_PARAM_COMMAND", 3uLL);
            xpc_dictionary_set_uint64(v11, "HB_PARAM_REF", v4);
            xpc_connection_set_event_handler(v18, &__block_literal_global_131);
            xpc_connection_resume(v18);
            xpc_object_t v19 = xpc_connection_send_message_with_reply_sync(v18, v11);
            if (v19) {
              xpc_release(v19);
            }
            else {
              locklog(0, "HBFreeHeartbeatReference", @"Failed to receive xpc reply.", v20, v21, v22, v23, v24, v28);
            }
            xpc_release(v11);
            v25 = v18;
          }
          else
          {
            locklog(0, "HBFreeHeartbeatReference", @"Failed to create xpc mach service.", v13, v14, v15, v16, v17, v28);
            v25 = (_xpc_connection_s *)v11;
          }
          xpc_release(v25);
        }
        else
        {
          locklog(0, "HBFreeHeartbeatReference", @"Failed to create xpc dictionary.", v6, v7, v8, v9, v10, v28);
        }
      }
      lockconn_disable_ssl(*a1);
      lockconn_close(*a1);
      lockconn_free((void *)*a1);
    }
    v26 = (void *)a1[2];
    if (v26)
    {
      os_release(v26);
      a1[2] = 0;
    }
    v27 = (void *)a1[1];
    if (v27) {
      xpc_release(v27);
    }
    free(a1);
  }
}

uint64_t lockconn_get_heartbeat_ref(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

void lockconn_free(void *a1)
{
  if (a1) {
    free(a1);
  }
}

uint64_t lockconn_disable_ssl(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 20))
  {
    OSStatus v2 = SSLClose(*(SSLContextRef *)(a1 + 24));
    if (v2) {
      locklog(0, "lockconn_disable_ssl", @"Could not shutdown SSL connection: %d\n", v3, v4, v5, v6, v7, v2);
    }
    *(unsigned char *)(a1 + 20) = 0;
  }
  if (*(void *)(a1 + 24))
  {
    _SSLDisposeContext();
    *(void *)(a1 + 24) = 0;
  }
  return 0;
}

unint64_t lockconn_close(unint64_t result)
{
  if (result)
  {
    v1 = (unsigned int *)result;
    OSStatus v2 = *(NSObject **)(result + 40);
    if (v2)
    {
      dispatch_source_cancel(v2);
      dispatch_release(*((dispatch_object_t *)v1 + 5));
      *((void *)v1 + 5) = 0;
    }
    result = *v1;
    if (result != -1) {
      result = close(result);
    }
    unsigned int *v1 = -1;
  }
  return result;
}

CFPropertyListRef _receive_message(uint64_t a1)
{
  unsigned int data = 0;
  CFErrorRef error = 0;
  int v2 = *(_DWORD *)a1;
  if (v2 == -1) {
    return 0;
  }
  size_t processed = 0;
  if (!*(unsigned char *)(a1 + 20))
  {
LABEL_6:
    size_t v9 = recv(v2, &data, 4uLL, 0);
    size_t processed = v9;
    if (!v9) {
      return 0;
    }
    goto LABEL_9;
  }
  uint64_t v3 = *(SSLContext **)(a1 + 24);
  if (!v3) {
    return 0;
  }
  if (SSLRead(v3, &data, 4uLL, &processed) == -9805)
  {
    *(unsigned char *)(a1 + 20) = 0;
    lockconn_disable_ssl(a1);
    int v2 = *(_DWORD *)a1;
    goto LABEL_6;
  }
  size_t v9 = processed;
  if (!processed) {
    return 0;
  }
LABEL_9:
  if (v9 != 4)
  {
    __error();
    CFStringRef v12 = __error();
    strerror(*v12);
    char v43 = 4;
    CFStringRef v11 = @"Could not receive size of message, expected %d bytes, got %ld bytes: (%d, %s)";
    goto LABEL_13;
  }
  size_t v10 = bswap32(data);
  if (v10 > 0x300000)
  {
    char v43 = data;
    CFStringRef v11 = @"swapped %d message size %d exceeds %d limit";
LABEL_13:
    locklog(0, "_receive_message", v11, v4, v5, v6, v7, v8, v43);
    return 0;
  }
  if (!data)
  {
    CFStringRef v11 = @"msize is zero";
    goto LABEL_13;
  }
  uint64_t v15 = (char *)malloc_type_malloc(v10, 0x3C0CF081uLL);
  if (!v15)
  {
    locklog(0, "_receive_message", @"can't alloc message size %d", v16, v17, v18, v19, v20, v10);
    return 0;
  }
  uint64_t v21 = v15;
  size_t v22 = 0;
  uint64_t v23 = v15;
  do
  {
    ssize_t v24 = lockconn_recv(a1, v23, v10 - v22);
    size_t processed = v24;
    if (v24 <= 0)
    {
      locklog(0, "_receive_message", @"Could not receive message: %ld.\n", v25, v26, v27, v28, v29, v24);
LABEL_33:
      free(v21);
      return 0;
    }
    v22 += v24;
    v23 += v24;
  }
  while (v22 < v10);
  CFDataRef v30 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v21, v10, (CFAllocatorRef)*MEMORY[0x263EFFB18]);
  if (!v30)
  {
    locklog(0, "_receive_message", @"Could not create CFData for message.\n", v31, v32, v33, v34, v35, v43);
    goto LABEL_33;
  }
  CFDataRef v36 = v30;
  CFPropertyListRef v13 = CFPropertyListCreateWithData(0, v30, 0, 0, &error);
  if (v13) {
    BOOL v42 = error == 0;
  }
  else {
    BOOL v42 = 0;
  }
  if (!v42)
  {
    locklog(0, "_receive_message", @"there was an err.", v37, v38, v39, v40, v41, v43);
    if (error) {
      CFRelease(error);
    }
  }
  CFRelease(v36);
  return v13;
}

ssize_t lockconn_recv(uint64_t a1, void *a2, size_t a3)
{
  size_t processed = -1;
  if (!*(unsigned char *)(a1 + 20)) {
    return recv(*(_DWORD *)a1, a2, a3, 0);
  }
  OSStatus v3 = SSLRead(*(SSLContextRef *)(a1 + 24), a2, a3, &processed);
  if (v3)
  {
    OSStatus v4 = v3;
    *__error() = 5;
    if (!processed) {
      size_t processed = -1;
    }
    switch(v4)
    {
      case -9806:
        uint64_t v5 = __error();
        int v6 = 54;
        break;
      case -9803:
        uint64_t v5 = __error();
        int v6 = 2;
        break;
      case -9805:
        return 0;
      default:
        return processed;
    }
    *uint64_t v5 = v6;
  }
  return processed;
}

uint64_t _send_message(uint64_t a1, const void *a2, CFPropertyListFormat a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    CFStringRef v10 = @"no connection";
LABEL_21:
    locklog(0, "_send_message", v10, a4, a5, a6, a7, a8, v31);
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 == -1)
  {
    CFStringRef v10 = @"no socket";
    goto LABEL_21;
  }
  if (!*(unsigned char *)(a1 + 20))
  {
    if (!a2) {
      return 0xFFFFFFFFLL;
    }
    goto LABEL_10;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && *(void *)(a1 + 24))
  {
LABEL_10:
    CFDataRef Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, a3, 0, 0);
    if (Data)
    {
      CFDataRef v12 = Data;
      CFIndex Length = CFDataGetLength(Data);
      if (Length < 0)
      {
        locklog(0, "_send_message", @"message length too small", v14, v15, v16, v17, v18, v31);
        CFRelease(v12);
        return 0xFFFFFFFFLL;
      }
      unint64_t v19 = Length;
      BytePtr = CFDataGetBytePtr(v12);
      uint64_t v21 = 0;
      unsigned int v32 = bswap32(v19);
      do
      {
        ssize_t v22 = lockconn_send(a1, (char *)&v32 + v21, 4 - v21);
        if (v22 == -1)
        {
          CFRelease(v12);
          uint64_t v25 = __error();
          strerror(*v25);
          locklog(0, "_send_message", @"Could not send message size %ld: %s\n", v26, v27, v28, v29, v30, v19);
          return 0xFFFFFFFFLL;
        }
        v21 += v22;
      }
      while (v21 != 4);
      if (!v19)
      {
LABEL_19:
        CFRelease(v12);
        return 0;
      }
      unint64_t v23 = 0;
      while (1)
      {
        ssize_t v24 = lockconn_send(a1, BytePtr, v19 - v23);
        if (v24 == -1) {
          break;
        }
        v23 += v24;
        BytePtr += v24;
        if (v23 >= v19) {
          goto LABEL_19;
        }
      }
      CFRelease(v12);
      CFStringRef v10 = @"Could not send secure message.\n";
    }
    else
    {
      CFStringRef v10 = @"Could not encode message as XML";
    }
    goto LABEL_21;
  }
  return result;
}

ssize_t lockconn_send(uint64_t a1, const void *a2, size_t a3)
{
  size_t processed = -1;
  if (!*(unsigned char *)(a1 + 20)) {
    return send(*(_DWORD *)a1, a2, a3, 0);
  }
  OSStatus v3 = SSLWrite(*(SSLContextRef *)(a1 + 24), a2, a3, &processed);
  if (v3)
  {
    OSStatus v4 = v3;
    *__error() = 5;
    if (!processed) {
      size_t processed = -1;
    }
    if (v4 == -9806)
    {
      uint64_t v5 = __error();
      int v6 = 32;
      goto LABEL_10;
    }
    if (v4 == -9803)
    {
      uint64_t v5 = __error();
      int v6 = 35;
LABEL_10:
      *uint64_t v5 = v6;
    }
  }
  return processed;
}

void *lockdown_connect()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v0 = socket(1, 1, 0);
  if (v0 != -1)
  {
    int v1 = v0;
    long long v15 = 0u;
    memset(v16, 0, sizeof(v16));
    long long v13 = 0u;
    long long v14 = 0u;
    sockaddr v11 = (sockaddr)0;
    long long v12 = 0u;
    __strlcpy_chk();
    v11.sa_family = 1;
    if (!connect(v1, &v11, 0xD2u))
    {
      _disable_sigpipe(v1);
      OSStatus v4 = malloc_type_calloc(1uLL, 0x18uLL, 0xA0040A8488062uLL);
      uint64_t v5 = lockconn_new();
      *OSStatus v4 = v5;
      lockconn_init((uint64_t)v5, v1, 4);
      return v4;
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v2 = __error();
      OSStatus v3 = strerror(*v2);
      int v7 = 136315394;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      CFStringRef v10 = "/var/run/lockdown.sock";
      _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Failed to connect to lockdown(%s) for path: %s. \n", (uint8_t *)&v7, 0x16u);
    }
    close(v1);
  }
  return 0;
}

void *lockconn_new()
{
  return malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040BB563593uLL);
}

double lockconn_init(uint64_t a1, int a2, int a3)
{
  if (a1)
  {
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_DWORD *)a1 = a2;
    *(void *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 16) = a3;
    *(_DWORD *)(a1 + 32) = 0;
  }
  return result;
}

BOOL _disable_sigpipe(int a1)
{
  int v10 = 1;
  int v1 = setsockopt(a1, 0xFFFF, 4130, &v10, 4u);
  if (v1 == -1)
  {
    int v2 = __error();
    char v3 = strerror(*v2);
    locklog(0, "_disable_sigpipe", @"setsockopt(SO_NOSIGPIPE) failed: %s", v4, v5, v6, v7, v8, v3);
  }
  return v1 != -1;
}

void locklog(uint64_t a1, const char *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  bzero(buffer, 0x800uLL);
  if (!a2) {
    a2 = "";
  }
  CFStringRef v11 = CFStringCreateWithFormatAndArguments(0, 0, a3, &a9);
  CFStringRef v12 = v11;
  if (v11 && !CFStringGetCString(v11, buffer, 2048, 0x8000100u))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Failed to retrieve C string.", buf, 2u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v14 = a2;
    __int16 v15 = 2080;
    uint64_t v16 = buffer;
    _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: %s", buf, 0x16u);
  }
  if (v12) {
LABEL_8:
  }
    CFRelease(v12);
}

uint64_t lockconn_set_heartbeat_ref(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 8) = a2;
  }
  return result;
}

void lockconn_set_keybag_handle(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1 && a2)
  {
    int v11 = *(_DWORD *)a1;
    if (v11 == -1)
    {
      CFStringRef v12 = @"can't set keybag handle on a connection without a socket";
    }
    else
    {
      if (!*(void *)(a1 + 40))
      {
        int v13 = dup(v11);
        if (v13 == -1)
        {
          int v18 = *__error();
          unint64_t v19 = __error();
          strerror(*v19);
          locklog(0, "lockconn_set_keybag_handle", @"Failed to dup the socket: %d (%s).", v20, v21, v22, v23, v24, v18);
        }
        else
        {
          int v14 = v13;
          uintptr_t v15 = v13;
          global_queue = dispatch_get_global_queue(0, 0);
          uint64_t v17 = dispatch_source_create(MEMORY[0x263EF83F8], v15, 0x1006uLL, global_queue);
          handler[0] = MEMORY[0x263EF8330];
          handler[1] = 0x40000000;
          handler[2] = __lockconn_set_keybag_handle_block_invoke;
          handler[3] = &__block_descriptor_tmp;
          handler[4] = v17;
          dispatch_source_set_event_handler(v17, handler);
          CFRetain(a2);
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 0x40000000;
          v25[2] = __lockconn_set_keybag_handle_block_invoke_2;
          v25[3] = &__block_descriptor_tmp_8;
          v25[4] = a2;
          int v26 = v14;
          dispatch_source_set_cancel_handler(v17, v25);
          dispatch_resume(v17);
          *(void *)(a1 + 40) = v17;
        }
        return;
      }
      CFStringRef v12 = @"can't set two keybag handles for the same socket";
    }
    locklog(0, "lockconn_set_keybag_handle", v12, a4, a5, a6, a7, a8, a9);
  }
}

void __lockconn_set_keybag_handle_block_invoke(uint64_t a1)
{
}

uint64_t __lockconn_set_keybag_handle_block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
  int v2 = *(_DWORD *)(a1 + 40);

  return close(v2);
}

uint64_t lockconn_sock(unsigned int *a1)
{
  if (a1) {
    return *a1;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t lockconn_type(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 16);
  }
  else {
    return 4;
  }
}

uint64_t lockconn_enable_ssl(uint64_t a1, const __CFData *a2, const __CFData *a3, const __CFData *a4, int a5)
{
  uint64_t v6 = lockssl_handshake(*(_DWORD *)a1, a2, a3, a4, a5);
  *(void *)(a1 + 24) = v6;
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *(unsigned char *)(a1 + 20) = 1;
  return result;
}

uint64_t lockconn_sslcontext(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

uint64_t _select_socket()
{
  return 0;
}

uint64_t lockconn_get_buffered_read_size(uint64_t a1, size_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t bufferSize = 0;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 20))
    {
      OSStatus v9 = SSLGetBufferedReadSize(*(SSLContextRef *)(a1 + 24), &bufferSize);
      if (v9)
      {
        char v10 = v9;
        CFStringRef v11 = SecCopyErrorMessageString(v9, 0);
        locklog(0, "lockconn_get_buffered_read_size", @"SSLGetBufferedReadSize failed: %d (%@)", v12, v13, v14, v15, v16, v10);
        if (v11) {
          CFRelease(v11);
        }
        return 0;
      }
LABEL_13:
      *a2 = bufferSize;
      return 1;
    }
    if (!ioctl(*(_DWORD *)a1, 0x4004667FuLL, &bufferSize)) {
      goto LABEL_13;
    }
    int v18 = *__error();
    unint64_t v19 = __error();
    strerror(*v19);
    char v21 = v18;
    CFStringRef v17 = @"ioctl (FIONREAD) failed: %d (%s)";
  }
  else
  {
    CFStringRef v17 = @"Invalid input(s).";
  }
  locklog(0, "lockconn_get_buffered_read_size", v17, a4, a5, a6, a7, a8, v21);
  return 0;
}

uint64_t send_set_value(uint64_t a1, const void *a2, const void *a3, const void *a4, CFStringRef *a5)
{
  if (a5) {
    *a5 = 0;
  }
  message = _create_message(@"SetValue");
  if (message)
  {
    CFStringRef v11 = message;
    if (a2) {
      CFDictionarySetValue(message, @"Domain", a2);
    }
    CFDictionarySetValue(v11, @"Key", a3);
    CFDictionarySetValue(v11, @"Value", a4);
    if (!lockconn_send_message(a1, v11, v12, v13, v14, v15, v16, v17))
    {
      CFDictionaryRef v19 = lockconn_receive_message(a1);
      if (v19)
      {
        CFDictionaryRef v20 = v19;
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v19, @"Error");
        if (Value) {
          uint64_t v18 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v18 = 0;
        }
        if (a5)
        {
          CFStringRef v22 = Value;
          if (Value)
          {
            CFRetain(Value);
            *a5 = v22;
            uint64_t v18 = 0xFFFFFFFFLL;
          }
        }
        CFRelease(v20);
        goto LABEL_17;
      }
      if (a5) {
        *a5 = CFStringCreateCopy(0, @"InvalidResponse");
      }
    }
    uint64_t v18 = 0xFFFFFFFFLL;
LABEL_17:
    CFRelease(v11);
    return v18;
  }
  return 0xFFFFFFFFLL;
}

uint64_t send_save_value(uint64_t a1, const void *a2, const void *a3, const void *a4, CFStringRef *a5)
{
  if (a5) {
    *a5 = 0;
  }
  message = _create_message(@"SaveValue");
  if (message)
  {
    CFStringRef v11 = message;
    if (a2) {
      CFDictionarySetValue(message, @"Domain", a2);
    }
    CFDictionarySetValue(v11, @"Key", a3);
    CFDictionarySetValue(v11, @"Value", a4);
    if (!lockconn_send_message(a1, v11, v12, v13, v14, v15, v16, v17))
    {
      CFDictionaryRef v19 = lockconn_receive_message(a1);
      if (v19)
      {
        CFDictionaryRef v20 = v19;
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v19, @"Error");
        if (Value) {
          uint64_t v18 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v18 = 0;
        }
        if (a5)
        {
          CFStringRef v22 = Value;
          if (Value)
          {
            CFRetain(Value);
            *a5 = v22;
            uint64_t v18 = 0xFFFFFFFFLL;
          }
        }
        CFRelease(v20);
        goto LABEL_17;
      }
      if (a5) {
        *a5 = CFStringCreateCopy(0, @"InvalidResponse");
      }
    }
    uint64_t v18 = 0xFFFFFFFFLL;
LABEL_17:
    CFRelease(v11);
    return v18;
  }
  return 0xFFFFFFFFLL;
}

uint64_t send_remove_value(uint64_t a1, const void *a2, const void *a3, void *a4)
{
  if (a4) {
    *a4 = 0;
  }
  message = _create_message(@"RemoveValue");
  if (message)
  {
    OSStatus v9 = message;
    if (a2) {
      CFDictionarySetValue(message, @"Domain", a2);
    }
    CFDictionarySetValue(v9, @"Key", a3);
    if (!lockconn_send_message(a1, v9, v10, v11, v12, v13, v14, v15))
    {
      CFDictionaryRef v17 = lockconn_receive_message(a1);
      if (v17)
      {
        CFDictionaryRef v18 = v17;
        CFStringRef Value = CFDictionaryGetValue(v17, @"Error");
        uint64_t v16 = (uint64_t)Value;
        if (Value)
        {
          if (isCFString(Value)) {
            CFDictionaryRef v20 = (__CFString *)v16;
          }
          else {
            CFDictionaryRef v20 = @"InvalidResponse";
          }
          if (v20) {
            uint64_t v16 = 0xFFFFFFFFLL;
          }
          else {
            uint64_t v16 = 0;
          }
          if (a4 && v20)
          {
            CFRetain(v20);
            *a4 = v20;
            uint64_t v16 = 0xFFFFFFFFLL;
          }
        }
        CFRelease(v18);
        goto LABEL_21;
      }
      if (a4) {
        *a4 = CFStringCreateCopy(0, @"InvalidResponse");
      }
    }
    uint64_t v16 = 0xFFFFFFFFLL;
LABEL_21:
    CFRelease(v9);
    return v16;
  }
  return 0xFFFFFFFFLL;
}

uint64_t send_reset_pairing(uint64_t a1, int a2, CFStringRef *a3)
{
  if (a3) {
    *a3 = 0;
  }
  message = _create_message(@"ResetPairing");
  if (message)
  {
    uint64_t v7 = message;
    uint64_t v8 = (const void **)MEMORY[0x263EFFB40];
    if (!a2) {
      uint64_t v8 = (const void **)MEMORY[0x263EFFB38];
    }
    CFDictionarySetValue(message, @"FullReset", *v8);
    if (!lockconn_send_message(a1, v7, v9, v10, v11, v12, v13, v14))
    {
      CFDictionaryRef v16 = lockconn_receive_message(a1);
      if (v16)
      {
        CFDictionaryRef v17 = v16;
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v16, @"Error");
        if (Value) {
          uint64_t v15 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v15 = 0;
        }
        if (a3)
        {
          CFStringRef v19 = Value;
          if (Value)
          {
            CFRetain(Value);
            *a3 = v19;
            uint64_t v15 = 0xFFFFFFFFLL;
          }
        }
        CFRelease(v17);
        goto LABEL_17;
      }
      if (a3) {
        *a3 = CFStringCreateCopy(0, @"InvalidResponse");
      }
    }
    uint64_t v15 = 0xFFFFFFFFLL;
LABEL_17:
    CFRelease(v7);
    return v15;
  }
  return 0xFFFFFFFFLL;
}

uint64_t send_unpair(uint64_t a1, void *a2, __CFString **a3)
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  uint64_t v3 = 0xFFFFFFFFLL;
  if (!a1 || !a2) {
    return v3;
  }
  message = _create_message(@"Unpair");
  values = a2;
  keys[0] = @"HostID";
  CFDictionaryRef v8 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v8
    && (CFDictionarySetValue(message, @"PairRecord", v8),
        CFDictionarySetValue(message, @"ResetTrustPrompt", (const void *)*MEMORY[0x263EFFB40]),
        !lockconn_send_message(a1, message, v9, v10, v11, v12, v13, v14)))
  {
    CFDictionaryRef v19 = lockconn_receive_message(a1);
    CFDictionaryRef v15 = v19;
    if (v19)
    {
      CFStringRef Value = (__CFString *)CFDictionaryGetValue(v19, @"Error");
      CFDictionaryRef v17 = Value;
      if (Value) {
        uint64_t v3 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v3 = 0;
      }
      if (Value) {
        goto LABEL_7;
      }
      goto LABEL_10;
    }
    CFDictionaryRef v16 = kLDErrorInvalidResponse;
  }
  else
  {
    CFDictionaryRef v15 = 0;
    CFDictionaryRef v16 = kLDErrorInternalError;
  }
  CFDictionaryRef v17 = *v16;
  if (*v16)
  {
LABEL_7:
    if (a3)
    {
      CFRetain(v17);
      *a3 = v17;
    }
    CFRelease(v17);
  }
LABEL_10:
  if (v8) {
    CFRelease(v8);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (message) {
    CFRelease(message);
  }
  return v3;
}

BOOL send_is_host_trusted(uint64_t a1, const void *a2, const void *a3, CFStringRef *a4)
{
  message = _create_message(@"IsHostTrusted");
  if (message)
  {
    CFDictionaryRef v15 = message;
    if (a2) {
      CFDictionarySetValue(message, @"Client", a2);
    }
    if (a3) {
      CFDictionarySetValue(v15, @"Options", a3);
    }
    if (lockconn_send_message(a1, v15, v9, v10, v11, v12, v13, v14)) {
      goto LABEL_7;
    }
    CFDictionaryRef v17 = lockconn_receive_message(a1);
    if (v17)
    {
      CFDictionaryRef v18 = v17;
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v17, @"Error");
      BOOL v16 = Value == 0;
      if (a4)
      {
        CFStringRef v20 = Value;
        if (Value)
        {
          CFRetain(Value);
          *a4 = v20;
        }
      }
      CFRelease(v18);
      goto LABEL_16;
    }
    if (!a4)
    {
LABEL_7:
      BOOL v16 = 0;
    }
    else
    {
      BOOL v16 = 0;
      *a4 = CFStringCreateCopy(0, @"InvalidResponse");
    }
LABEL_16:
    CFRelease(v15);
    return v16;
  }
  return 0;
}

BOOL send_enable_wireless_pairing(uint64_t a1, int a2)
{
  message = _create_message(@"EnableWirelessPairing");
  if (!message) {
    return 0;
  }
  uint64_t v5 = message;
  uint64_t v6 = (const void **)MEMORY[0x263EFFB40];
  if (!a2) {
    uint64_t v6 = (const void **)MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(message, @"Options", *v6);
  if (lockconn_send_message(a1, v5, v7, v8, v9, v10, v11, v12)
    || (CFDictionaryRef v14 = lockconn_receive_message(a1)) == 0)
  {
    BOOL v13 = 0;
  }
  else
  {
    CFDictionaryRef v15 = v14;
    BOOL v13 = CFDictionaryGetValue(v14, @"Error") == 0;
    CFRelease(v15);
  }
  CFRelease(v5);
  return v13;
}

uint64_t lockcrypto_decode_pem(const __CFData *a1, const char *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  BytePtr = (const char *)CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  if (Length < 0) {
    return 0;
  }
  size_t v6 = Length;
  int v7 = snprintf(__str, 0x50uLL, "-----BEGIN %s-----\n", a2);
  snprintf(__little, 0x50uLL, "\n-----END %s-----\n", a2);
  uint64_t v8 = strnstr(BytePtr, __str, v6);
  uint64_t v9 = strnstr(BytePtr, __little, v6);
  uint64_t v10 = 0;
  if (v8)
  {
    uint64_t v11 = v9;
    if (v9)
    {
      uint64_t v12 = &v8[v7];
      BOOL v13 = (void *)MEMORY[0x216671B90]();
      CFDictionaryRef v14 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v12 length:v11 - v12 freeWhenDone:0];
      uint64_t v10 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedData:v14 options:1];
    }
  }
  return v10;
}

CFDataRef lockcrypto_cert_from_pem_data(const __CFData *a1)
{
  CFDataRef result = (const __CFData *)lockcrypto_decode_pem(a1, "CERTIFICATE");
  if (result)
  {
    CFDataRef v2 = result;
    SecCertificateRef v3 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], result);
    CFRelease(v2);
    return v3;
  }
  return result;
}

uint64_t lockcrypto_private_key_from_pem_data(const __CFData *a1)
{
  CFDataRef v1 = (const __CFData *)lockcrypto_decode_pem(a1, "RSA PRIVATE KEY");
  if (v1)
  {
    CFDataRef v7 = v1;
    CFDataGetBytePtr(v1);
    CFDataGetLength(v7);
    uint64_t RSAPrivateKey = SecKeyCreateRSAPrivateKey();
    if (!RSAPrivateKey) {
      locklog(0, "lockcrypto_private_key_from_pem_data", @"SecKeyCreateRSAPrivateKey failed", v8, v9, v10, v11, v12, v15);
    }
    CFRelease(v7);
  }
  else
  {
    locklog(0, "lockcrypto_private_key_from_pem_data", @"lockcrypto_decode_pem failed", v2, v3, v4, v5, v6, v15);
    return 0;
  }
  return RSAPrivateKey;
}

uint64_t unlock_with_escrow(void *a1, int a2, CFDataRef theData, __CFString **a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (a4) {
    *a4 = 0;
  }
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  int v30 = 0;
  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  CCDigest();
  __sprintf_chk(v27, 0, 0x29uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0);
  CFDataGetLength(theData);
  locklog(0, "unlock_with_escrow", @"Starting service with bag=%s, %ld", v7, v8, v9, v10, v11, (char)v27);
  int v12 = MKBKeyBagCreateWithData();
  if (v12)
  {
    locklog(0, "unlock_with_escrow", @"Can't instantiate escrow bag: %d", v13, v14, v15, v16, v17, v12);
    if (a4)
    {
      uint64_t v18 = @"Failure";
LABEL_9:
      uint64_t v25 = 0;
      *a4 = v18;
      return v25;
    }
    return 0;
  }
  int v19 = MKBKeyBagUnlock();
  if (v19)
  {
    locklog(0, "unlock_with_escrow", @"Can't unlock escrow bag: %d", v20, v21, v22, v23, v24, v19);
    if (a4)
    {
      uint64_t v18 = @"EscrowFailure";
      goto LABEL_9;
    }
    return 0;
  }
  if (a1) {
    *a1 = 0;
  }
  return 1;
}

uint64_t lockdown_copy_checkin_info(void *a1, CFArrayRef *a2)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  values = 0;
  int v55 = -1;
  if (!a2) {
    return 8;
  }
  *a2 = 0;
  if (MEMORY[0x216671E50]() != MEMORY[0x263EF8708]) {
    return 8;
  }
  string = xpc_dictionary_get_string(a1, "_LDCHECKININFO");
  if (!string) {
    return 8;
  }
  CFStringRef v5 = CFStringCreateWithCString(0, string, 0x8000100u);
  if (!v5) {
    return 11;
  }
  CFStringRef v6 = v5;
  CFBagRef v61 = 0;
  *(_OWORD *)v59 = 0u;
  long long v60 = 0u;
  int64_t valuePtr = xpc_dictionary_get_date(a1, "_LDTIMESTAMP");
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberLongLongType, &valuePtr);
  if (!v8)
  {
    uint64_t v49 = 8;
    CFBagRef v47 = (CFBagRef)v6;
LABEL_32:
    CFRelease(v47);
    return v49;
  }
  CFNumberRef v9 = v8;
  xpc_object_t value = xpc_dictionary_get_value(a1, "_LDCHECKINDICT");
  CFTypeRef v18 = copy_dict_from_xpc_data(value, v11, v12, v13, v14, v15, v16, v17);
  if (!v18 || (int v55 = xpc_dictionary_dup_fd(a1, "_LDSERVICESOCK"), v55 == -1))
  {
    CFNumberRef v19 = 0;
    goto LABEL_24;
  }
  CFNumberRef v19 = CFNumberCreate(v7, kCFNumberIntType, &v55);
  if (!v19)
  {
LABEL_24:
    CFBagRef v47 = 0;
LABEL_26:
    uint64_t v49 = 8;
    goto LABEL_27;
  }
  xpc_dictionary_set_value(a1, "_LDSERVICESOCK", 0);
  int v20 = xpc_dictionary_dup_fd(a1, "_LDSERVICELOGSOCK");
  if (v20 == -1)
  {
    locklog(0, "lockdown_copy_checkin_info", @"_LDSERVICELOGSOCK missing", v21, v22, v23, v24, v25, v51);
  }
  else
  {
    int v26 = v20;
    time_t v54 = 0;
    uint64_t v27 = _NSGetProgname();
    if (v27) {
      uint64_t v28 = *v27;
    }
    else {
      uint64_t v28 = "unknown service";
    }
    __s = 0;
    time(&v54);
    ctime_r(&v54, v58);
    pid_t v29 = getpid();
    asprintf(&__s, "%s(%d) checked in at %s", v28, v29, v58);
    if (__s)
    {
      size_t v35 = strlen(__s);
      write(v26, __s, v35);
      free(__s);
    }
    else
    {
      locklog(0, "lockdown_copy_checkin_info", @"asprintf failed", v30, v31, v32, v33, v34, v52);
    }
    close(v26);
  }
  xpc_dictionary_set_value(a1, "_LDSERVICELOGSOCK", 0);
  values = xpc_dictionary_get_remote_connection(a1);
  if (!values)
  {
    locklog(0, "lockdown_copy_checkin_info", @"Failed to get XPC connection from message.", v36, v37, v38, v39, v40, v52);
    goto LABEL_24;
  }
  CFBagRef v41 = CFBagCreate(v7, (const void **)&values, 1, &xpc_connection_bag_callbacks);
  CFBagRef v47 = v41;
  if (!v41)
  {
    locklog(0, "lockdown_copy_checkin_info", @"Failed to store XPC connection in CFBag.", v42, v43, v44, v45, v46, v52);
    goto LABEL_26;
  }
  v59[0] = (void *)v6;
  v59[1] = v9;
  *(void *)&long long v60 = v18;
  *((void *)&v60 + 1) = v19;
  CFBagRef v61 = v41;
  CFArrayRef v48 = CFArrayCreate(v7, (const void **)v59, 5, MEMORY[0x263EFFF70]);
  *a2 = v48;
  if (v48) {
    uint64_t v49 = 0;
  }
  else {
    uint64_t v49 = 11;
  }
LABEL_27:
  CFRelease(v6);
  CFRelease(v9);
  if (v18) {
    CFRelease(v18);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v47) {
    goto LABEL_32;
  }
  return v49;
}

CFTypeRef lockdown_copy_wireless_connections_list()
{
  int v0 = (_xpc_connection_s *)xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }
    return 0;
  }
  CFDataRef v1 = v0;
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.mobile.heartbeat", 0, 0);
  if (!mach_service)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      v29[0] = 0;
      _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Failed to create mach service connection.", (uint8_t *)v29, 2u);
    }
    uint64_t v27 = v1;
    goto LABEL_13;
  }
  uint64_t v3 = mach_service;
  xpc_dictionary_set_uint64(v1, "HB_PARAM_COMMAND", 4uLL);
  xpc_connection_set_event_handler(v3, &__block_literal_global);
  xpc_connection_resume(v3);
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(v3, v1);
  if (!v4)
  {
    locklog(0, "lockdown_copy_wireless_connections_list", @"Failed to send xpc message.", v5, v6, v7, v8, v9, v29[0]);
    xpc_release(v1);
    uint64_t v27 = v3;
LABEL_13:
    xpc_release(v27);
    return 0;
  }
  uint64_t v10 = v4;
  xpc_object_t value = xpc_dictionary_get_value(v4, "HB_PARAM_OBJECT");
  if (value)
  {
    CFTypeRef v19 = copy_array_from_xpc_data(value, v12, v13, v14, v15, v16, v17, v18);
    uint64_t v25 = v19;
    if (v19)
    {
      CFTypeRef v26 = CFRetain(v19);
    }
    else
    {
      locklog(0, "lockdown_copy_wireless_connections_list", @"Failed to copy array from xpc data.", v20, v21, v22, v23, v24, v29[0]);
      CFTypeRef v26 = 0;
    }
  }
  else
  {
    locklog(0, "lockdown_copy_wireless_connections_list", @"Invalid xpc response.", v14, v15, v16, v17, v18, v29[0]);
    CFTypeRef v26 = 0;
    uint64_t v25 = 0;
  }
  xpc_release(v10);
  xpc_release(v1);
  xpc_release(v3);
  if (v25) {
    CFRelease(v25);
  }
  return v26;
}

void lockdown_kill_wireless_connections(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  if (v9)
  {
    uint64_t v15 = v9;
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.mobile.heartbeat", 0, 0);
    if (mach_service)
    {
      uint64_t v22 = mach_service;
      xpc_dictionary_set_uint64(v15, "HB_PARAM_COMMAND", 2uLL);
      xpc_connection_set_event_handler(v22, &__block_literal_global_38);
      xpc_connection_resume(v22);
      xpc_object_t v23 = xpc_connection_send_message_with_reply_sync(v22, v15);
      if (v23) {
        xpc_release(v23);
      }
      else {
        locklog(0, "lockdown_kill_wireless_connections", @"Failed to receive xpc reply.", v24, v25, v26, v27, v28, v30);
      }
      xpc_release(v15);
      pid_t v29 = v22;
    }
    else
    {
      locklog(0, "lockdown_kill_wireless_connections", @"Failed to create xpc mach service.", v17, v18, v19, v20, v21, v30);
      pid_t v29 = (_xpc_connection_s *)v15;
    }
    xpc_release(v29);
  }
  else
  {
    locklog(0, "lockdown_kill_wireless_connections", @"Failed to create xpc dictionary.", v10, v11, v12, v13, v14, a9);
  }
}

uint64_t secure_lockdown_checkin(void *a1, CFDictionaryRef theDict, CFTypeRef *a3)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  int valuePtr = -1;
  int v81 = 0;
  values = 0;
  CFTypeRef cf = 0;
  unsigned int v77 = 0;
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      CFBagRef v41 = MEMORY[0x263EF8438];
      uint64_t v42 = "Invalid input.";
LABEL_46:
      _os_log_impl(&dword_21077C000, v41, OS_LOG_TYPE_DEFAULT, v42, buf, 2u);
    }
LABEL_47:
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    char v30 = 0;
    int v24 = -1;
    uint64_t v40 = 1;
    goto LABEL_55;
  }
  if (!theDict || (CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, @"CheckinConnectionInfo")) == 0)
  {
    *(void *)buf = 0;
    v83 = buf;
    uint64_t v84 = 0x2000000000;
    char v85 = 0;
    uint64_t v27 = getenv("LOCKDOWN_MACH_SERVICE");
    if (v27)
    {
      uint64_t v28 = v27;
      pid_t v29 = dispatch_semaphore_create(0);
      if (v29)
      {
        char v30 = v29;
        dispatch_retain(v29);
        v75[0] = MEMORY[0x263EF8330];
        v75[1] = 0x40000000;
        v75[2] = __secure_lockdown_checkin_block_invoke;
        v75[3] = &unk_2641388D8;
        v75[4] = buf;
        v75[5] = v28;
        v75[6] = a1;
        v75[7] = a3;
        v75[8] = v30;
        lockdown_checkin_xpc(v28, theDict, 0, (uint64_t)v75);
        dispatch_time_t v31 = dispatch_time(0, 10000000000);
        if (dispatch_semaphore_wait(v30, v31))
        {
          BOOL v32 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (v32) {
            secure_lockdown_checkin_cold_1(v32, v33, v34, v35, v36, v37, v38, v39);
          }
          uint64_t v40 = 9;
        }
        else
        {
          uint64_t v40 = 0;
        }
        goto LABEL_54;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v76 = 0;
        uint64_t v45 = MEMORY[0x263EF8438];
        uint64_t v46 = "Failed to create semaphore.";
        goto LABEL_52;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v76 = 0;
      uint64_t v45 = MEMORY[0x263EF8438];
      uint64_t v46 = "Unknown service name.";
LABEL_52:
      _os_log_impl(&dword_21077C000, v45, OS_LOG_TYPE_DEFAULT, v46, v76, 2u);
    }
    char v30 = 0;
    uint64_t v40 = 1;
LABEL_54:
    _Block_object_dispose(buf, 8);
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    int v24 = -1;
    goto LABEL_55;
  }
  CFArrayRef v7 = Value;
  if (!isCFArray(Value) || CFArrayGetCount(v7) != 5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      CFBagRef v41 = MEMORY[0x263EF8438];
      uint64_t v42 = "Invalid sideband info.";
      goto LABEL_46;
    }
    goto LABEL_47;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(v7, 2);
  if (!isCFDictionary(ValueAtIndex))
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    CFBagRef v41 = MEMORY[0x263EF8438];
    uint64_t v42 = "Invalid info.";
    goto LABEL_46;
  }
  xpc_object_t v9 = CFArrayGetValueAtIndex(v7, 3);
  if (!isCFNumber(v9))
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    CFBagRef v41 = MEMORY[0x263EF8438];
    uint64_t v42 = "Invalid socket.";
    goto LABEL_46;
  }
  if (!CFNumberGetValue((CFNumberRef)v9, kCFNumberIntType, &valuePtr))
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    CFBagRef v41 = MEMORY[0x263EF8438];
    uint64_t v42 = "Failed to convert number.";
    goto LABEL_46;
  }
  uint64_t v10 = CFArrayGetValueAtIndex(v7, 4);
  if (!isCFBag(v10))
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_84;
    }
    *(_WORD *)buf = 0;
    CFArrayRef v48 = MEMORY[0x263EF8438];
    uint64_t v49 = "Failed to read CF bag containing XPC connection.";
LABEL_83:
    _os_log_impl(&dword_21077C000, v48, OS_LOG_TYPE_DEFAULT, v49, buf, 2u);
    goto LABEL_84;
  }
  if (MEMORY[0x216671570](v10) != 1)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_84;
    }
    *(_WORD *)buf = 0;
    CFArrayRef v48 = MEMORY[0x263EF8438];
    uint64_t v49 = "Unexpected number of items in XPC connection bag.";
    goto LABEL_83;
  }
  CFBagGetValues((CFBagRef)v10, (const void **)&values);
  if (!values)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_84;
    }
    *(_WORD *)buf = 0;
    CFArrayRef v48 = MEMORY[0x263EF8438];
    uint64_t v49 = "Failed to get remote connection from XPC message.";
    goto LABEL_83;
  }
  if (!ack_checkin((_xpc_connection_s *)values))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      CFArrayRef v48 = MEMORY[0x263EF8438];
      uint64_t v49 = "Failed to send checkin reply.";
      goto LABEL_83;
    }
LABEL_84:
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    char v30 = 0;
    int v24 = -1;
    uint64_t v40 = 8;
    goto LABEL_55;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    CFBagRef v41 = MEMORY[0x263EF8438];
    uint64_t v42 = "Failed to create dictionary.";
    goto LABEL_46;
  }
  CFMutableDictionaryRef v12 = Mutable;
  int v81 = 2;
  CFNumberRef v13 = CFNumberCreate(0, kCFNumberIntType, &v81);
  if (!v13)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Failed to create number.", buf, 2u);
    }
    CFRelease(v12);
    goto LABEL_47;
  }
  CFNumberRef v14 = v13;
  CFDictionarySetValue(v12, @"CheckinVersion", v13);
  uint64_t v15 = CFArrayGetValueAtIndex(v7, 0);
  if (isCFString(v15)) {
    CFDictionarySetValue(v12, @"CheckinPath", v15);
  }
  uint64_t v16 = CFArrayGetValueAtIndex(v7, 1);
  if (isCFNumber(v16)) {
    CFDictionarySetValue(v12, @"CheckinTimestamp", v16);
  }
  uint64_t v17 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"HostID");
  if (isCFString(v17)) {
    CFDictionarySetValue(v12, @"HostID", v17);
  }
  uint64_t v18 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"HostSideClientName");
  if (isCFString(v18)) {
    CFDictionarySetValue(v12, @"ClientName", v18);
  }
  uint64_t v19 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"HostSideHostName");
  if (isCFString(v19)) {
    CFDictionarySetValue(v12, @"HostName", v19);
  }
  uint64_t v20 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"HostConnectionType");
  if (isCFNumber(v20))
  {
    if (CFNumberGetValue((CFNumberRef)v20, kCFNumberIntType, &v77))
    {
      unsigned int v21 = v77;
      if (v77 < 7)
      {
        if (v20)
        {
          CFDictionarySetValue(v12, @"ConnectionType", v20);
          goto LABEL_30;
        }
LABEL_104:
        uint64_t v43 = 0;
        uint64_t v44 = 0;
        int v24 = -1;
        goto LABEL_122;
      }
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_104;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v21;
      v50 = MEMORY[0x263EF8438];
      char v51 = "Unknown connection type: %d";
      uint32_t v52 = 8;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_104;
      }
      *(_WORD *)buf = 0;
      v50 = MEMORY[0x263EF8438];
      char v51 = "Failed to get number.";
      uint32_t v52 = 2;
    }
    _os_log_impl(&dword_21077C000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, v52);
    goto LABEL_104;
  }
LABEL_30:
  uint64_t v22 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"EscrowBag");
  xpc_object_t v23 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"EscrowSecret");
  if (isCFData(v22) && isCFData(v23) && !unlock_with_escrow(&cf, (int)v22, (CFDataRef)v23, 0)) {
    goto LABEL_104;
  }
  int v24 = valuePtr;
  if (v77 - 7 > 0xFFFFFFFD)
  {
    int valuePtr = -1;
  }
  else
  {
    uint64_t v25 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"HostIP");
    int v26 = accept_with_timeout(v24, 5, v25);
    int v24 = v26;
    if (v26 == -1)
    {
LABEL_107:
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      goto LABEL_122;
    }
    _disable_sigpipe(v26);
    _disable_wake_from_sleep(v24);
  }
  CFDictionaryRef theDicta = theDict;
  v74 = a1;
  v53 = malloc_type_calloc(1uLL, 0x18uLL, 0xA0040A8488062uLL);
  if (!v53)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Failed to allocate memory.", buf, 2u);
    }
    goto LABEL_107;
  }
  uint64_t v44 = v53;
  time_t v54 = lockconn_new();
  if (!v54)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Failed to allocate connection.", buf, 2u);
    }
    uint64_t v43 = 0;
    goto LABEL_122;
  }
  uint64_t v43 = v54;
  lockconn_init((uint64_t)v54, v24, v77);
  int v55 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"DeviceCertificate");
  v56 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"DevicePrivateKey");
  CFDataRef v57 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"HostRootCertificate");
  if (!isCFData(v55) || !isCFData(v56)) {
    goto LABEL_108;
  }
  if (isCFData(v57))
  {
    if (lockconn_enable_ssl((uint64_t)v43, (const __CFData *)v55, (const __CFData *)v56, v57, 0))
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v58 = MEMORY[0x263EF8438];
        v59 = "Failed to enable SSL.";
LABEL_121:
        _os_log_impl(&dword_21077C000, v58, OS_LOG_TYPE_DEFAULT, v59, buf, 2u);
        goto LABEL_122;
      }
      goto LABEL_122;
    }
LABEL_108:
    if (CFDictionaryContainsKey((CFDictionaryRef)ValueAtIndex, @"UseHostTracker")
      && !CFDictionaryContainsKey(theDicta, @"NoHeartBeat"))
    {
      *(void *)buf = 0;
      CFStringRef v66 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"HostID");
      v67 = (char *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"HostSideHostName");
      v68 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"HostSideClientName");
      HBWatchFDForHost(v24, v66, v67, (uint64_t)v68, (uint64_t *)buf, v69, v70, v71, v72);
      lockconn_set_heartbeat_ref((uint64_t)v43, *(uint64_t *)buf);
    }
    if (cf) {
      lockconn_set_keybag_handle((uint64_t)v43, cf, v60, v61, v62, v63, v64, v65, v72);
    }
    *uint64_t v44 = v43;
    void *v74 = v44;
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    uint64_t v40 = 0;
    if (a3) {
      *a3 = CFRetain(v12);
    }
    int v24 = -1;
    goto LABEL_123;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v58 = MEMORY[0x263EF8438];
    v59 = "Invalid root certificate.";
    goto LABEL_121;
  }
LABEL_122:
  uint64_t v40 = 1;
LABEL_123:
  CFRelease(v12);
  CFRelease(v14);
  char v30 = 0;
LABEL_55:
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0;
  if (v44) {
    free(v44);
  }
  if (v30) {
    dispatch_release(v30);
  }
  if (valuePtr != -1) {
    close(valuePtr);
  }
  if (v43)
  {
    lockconn_disable_ssl((uint64_t)v43);
    lockconn_close((unint64_t)v43);
    lockconn_free(v43);
  }
  if (v24 != -1) {
    close(v24);
  }
  return v40;
}

uint64_t lockdown_checkin_xpc(const char *a1, const void *a2, NSObject *a3, uint64_t a4)
{
  global_queue = dispatch_get_global_queue(0, 0);
  xpc_connection_t mach_service = xpc_connection_create_mach_service(a1, global_queue, 1uLL);
  if (mach_service)
  {
    uint64_t v10 = mach_service;
    if (a2) {
      CFRetain(a2);
    }
    if (!a3) {
      a3 = global_queue;
    }
    dispatch_retain(a3);
    *(void *)buf = 0;
    CFNumberRef v14 = buf;
    uint64_t v15 = 0x2000000000;
    char v16 = 0;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __lockdown_checkin_xpc_block_invoke;
    handler[3] = &unk_264138928;
    handler[6] = v10;
    handler[7] = a2;
    handler[8] = a3;
    handler[4] = a4;
    void handler[5] = buf;
    xpc_connection_set_event_handler(v10, handler);
    xpc_connection_resume(v10);
    _Block_object_dispose(buf, 8);
    return 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Could not create XPC listener", buf, 2u);
    }
    return 1;
  }
}

void __secure_lockdown_checkin_block_invoke(uint64_t a1, uint64_t a2, CFTypeRef cf)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 136315138;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Unexpected second connection to %s.", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
    **(void **)(a1 + 48) = a2;
    if (*(void *)(a1 + 56)) {
      **(void **)(a1 + 56) = CFRetain(cf);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  dispatch_release(*(dispatch_object_t *)(a1 + 64));
}

BOOL ack_checkin(_xpc_connection_s *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  uint64_t v8 = v2;
  if (v2)
  {
    xpc_dictionary_set_BOOL(v2, "ACK", 1);
    xpc_connection_send_message(a1, v8);
    xpc_release(v8);
  }
  else
  {
    locklog(0, "ack_checkin", @"Couldn't construct a checkin reply message.", v3, v4, v5, v6, v7, v10);
  }
  return v8 != 0;
}

void HBWatchFDForHost(int a1, const __CFString *a2, char *a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a2)
  {
    char v10 = (char *)a4;
    xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
    if (v14)
    {
      uint64_t v15 = v14;
      xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.mobile.heartbeat", 0, 0);
      if (mach_service)
      {
        uint64_t v22 = mach_service;
        xpc_object_t v23 = copy_cstr_from_cfstr(a2);
        if (v23)
        {
          pid_t v29 = v23;
          if (v10 && (char v10 = (char *)copy_cstr_from_cfstr((const __CFString *)v10)) == 0)
          {
            locklog(0, "HBWatchFDForHost", @"Failed to convert client name string.", v30, v31, v32, v33, v34, v49);
            free(v29);
          }
          else
          {
            if (a3 && (a3 = (char *)copy_cstr_from_cfstr((const __CFString *)a3)) == 0)
            {
              locklog(0, "HBWatchFDForHost", @"Failed to convert host name string.", v35, v36, v37, v38, v39, v49);
              uint64_t v46 = 0;
            }
            else
            {
              xpc_dictionary_set_uint64(v15, "HB_PARAM_COMMAND", 1uLL);
              xpc_dictionary_set_fd(v15, "HB_PARAM_FD", a1);
              xpc_dictionary_set_string(v15, "HB_PARAM_HOSTID", (const char *)v29);
              xpc_dictionary_set_uint64(v15, "HB_PARAM_THEIRFD", a1);
              if (v10) {
                xpc_dictionary_set_string(v15, "HB_PARAM_CLIENTNAME", v10);
              }
              if (a3) {
                xpc_dictionary_set_string(v15, "HB_PARAM_HOSTNAME", a3);
              }
              xpc_connection_set_event_handler(v22, &__block_literal_global_116);
              xpc_connection_resume(v22);
              xpc_object_t v40 = xpc_connection_send_message_with_reply_sync(v22, v15);
              uint64_t v46 = v40;
              if (v40)
              {
                if (a5) {
                  *a5 = xpc_dictionary_get_uint64(v40, "HB_PARAM_REF");
                }
              }
              else
              {
                locklog(0, "HBWatchFDForHost", @"Failed to send xpc message.", v41, v42, v43, v44, v45, v49);
              }
            }
            free(v29);
            if (v10) {
              free(v10);
            }
            if (a3) {
              free(a3);
            }
            if (v46) {
              xpc_release(v46);
            }
          }
        }
        else
        {
          locklog(0, "HBWatchFDForHost", @"Failed to convert host id string.", v24, v25, v26, v27, v28, v49);
        }
        xpc_release(v15);
        CFArrayRef v48 = v22;
      }
      else
      {
        locklog(0, "HBWatchFDForHost", @"Failed to create xpc mach service.", v17, v18, v19, v20, v21, v49);
        CFArrayRef v48 = (_xpc_connection_s *)v15;
      }
      xpc_release(v48);
      return;
    }
    CFStringRef v47 = @"Failed to allocate xpc dictionary.";
  }
  else
  {
    CFStringRef v47 = @"Invalid host id.";
  }

  locklog(0, "HBWatchFDForHost", v47, a4, (uint64_t)a5, a6, a7, a8, a9);
}

void __lockdown_checkin_xpc_block_invoke(uint64_t a1, _xpc_connection_s *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (MEMORY[0x216671E50](a2) == MEMORY[0x263EF86F0])
  {
    *(_OWORD *)buf = 0u;
    long long v19 = 0u;
    xpc_connection_get_audit_token();
    uint64_t v6 = (void *)xpc_copy_entitlement_for_token();
    if (v6 && (uint64_t v7 = v6, v8 = (void *)MEMORY[0x263EF8698], xpc_release(v6), v7 == v8))
    {
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      long long v19 = 0x2000000000uLL;
      *((void *)&v19 + 1) = xpc_retain(*(xpc_object_t *)(a1 + 48));
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 0x40000000;
      v11[2] = __lockdown_checkin_xpc_block_invoke_2;
      v11[3] = &unk_264138900;
      long long v14 = *(_OWORD *)(a1 + 56);
      long long v12 = *(_OWORD *)(a1 + 32);
      uint64_t v15 = a2;
      CFNumberRef v13 = buf;
      xpc_connection_set_event_handler(a2, v11);
      xpc_connection_resume(a2);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)char v16 = 67109120;
        pid_t pid = xpc_connection_get_pid(a2);
        _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "connection attempt from pid %d missing entitlement: iamlockdown", v16, 8u);
      }
      xpc_connection_cancel(a2);
    }
  }
  else
  {
    if (a2 == (_xpc_connection_s *)MEMORY[0x263EF86C0])
    {
      syslog(6, "XPC connection closing, time to go");
    }
    else if (a2 != (_xpc_connection_s *)MEMORY[0x263EF86A8] {
           || *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0)
    }
    {
      uint64_t v5 = (void *)MEMORY[0x216671D40](a2);
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Unexpected XPC event '%s' on xpc listener", buf, 0xCu);
      }
      free(v5);
    }
    else
    {
      syslog(6, "XPC listener can now be shutdown");
    }
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 48));
    xpc_release(*(xpc_object_t *)(a1 + 48));
    xpc_object_t v9 = *(NSObject **)(a1 + 64);
    if (v9) {
      dispatch_release(v9);
    }
    char v10 = *(const void **)(a1 + 56);
    if (v10) {
      CFRelease(v10);
    }
  }
}

void __lockdown_checkin_xpc_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (MEMORY[0x216671E50](a2) != MEMORY[0x263EF8708])
  {
    if (a2 == (void *)MEMORY[0x263EF86C0])
    {
      syslog(6, "XPC connection should close now");
    }
    else if (a2 == (void *)MEMORY[0x263EF86A8])
    {
      syslog(6, "The connection is now invalid.");
    }
    else
    {
      uint64_t v4 = (void *)MEMORY[0x216671D40](a2);
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v46 = v4;
        _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Unexpected XPC event '%s' on xpc connection", buf, 0xCu);
      }
      free(v4);
    }
    goto LABEL_19;
  }
  BOOL v5 = xpc_dictionary_get_BOOL(a2, "_LDKEEPCONNALIVE");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(a2, "_LDSHUTDOWNLISTENER");
  CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 56);
  uint64_t v7 = *(NSObject **)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 32);
  CFDictionaryRef theDict = 0;
  CFTypeRef cf = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2000000000;
  uint64_t v36 = 0;
  uint64_t v32 = 0;
  bzero(buf, 0x400uLL);
  int v9 = lockdown_copy_checkin_info(a2, (CFArrayRef *)&cf);
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)block = 67109120;
      *(_DWORD *)&block[4] = v10;
      _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "lockdown_copy_checkin_info failed (%d).", block, 8u);
    }
    CFDictionaryRef v11 = 0;
    goto LABEL_11;
  }
  if (v6) {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v6);
  }
  else {
    MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  CFDictionaryRef v11 = MutableCopy;
  CFDictionarySetValue(MutableCopy, @"CheckinConnectionInfo", cf);
  int v14 = secure_lockdown_checkin((int)&v32, v11);
  if (theDict)
  {
    CFArrayRef Value = CFDictionaryGetValue(theDict, @"CheckinPath");
    CFStringRef v16 = (const __CFString *)isCFString(Value);
    if (v16)
    {
      char v17 = (char)v16;
      uint64_t CString = CFStringGetCString(v16, (char *)buf, 1024, 0x8000100u);
      if (!CString)
      {
        locklog(CString, "handle_lockdown_xpc_message", @"CFStringGetCString failure for %@", v19, v20, v21, v22, v23, v17);
        if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_11;
        }
        *(_WORD *)block = 0;
        uint64_t v24 = MEMORY[0x263EF8438];
        uint64_t v25 = "hinkyness";
        uint32_t v26 = 2;
        goto LABEL_40;
      }
    }
  }
  if (v14)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)block = 136315394;
    *(void *)&block[4] = buf;
    *(_WORD *)&block[12] = 1024;
    *(_DWORD *)&block[14] = v14;
    uint64_t v24 = MEMORY[0x263EF8438];
    uint64_t v25 = "Could not check in with lockdown at '%s': %d";
    uint32_t v26 = 18;
LABEL_40:
    _os_log_impl(&dword_21077C000, v24, OS_LOG_TYPE_DEFAULT, v25, block, v26);
    goto LABEL_11;
  }
  if (v32)
  {
    int v27 = lockconn_sock(*(unsigned int **)v32);
    uint64_t v28 = "out";
    if (v32 && lockconn_sslcontext(*(void *)v32)) {
      uint64_t v28 = "";
    }
  }
  else
  {
    uint64_t v28 = "out";
    int v27 = -1;
  }
  syslog(6, "Checked in with lockdown on path '%s' socket %d with%s SSL", (const char *)buf, v27, v28);
  if (a2 && (uint64_t v29 = v32) != 0)
  {
    xpc_retain(a2);
    uint64_t v30 = *(void **)(v29 + 8);
    if (v30) {
      xpc_release(v30);
    }
    *(void *)(v29 + 8) = a2;
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)block = 0;
    _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Invalid input(s).", block, 2u);
  }
  uint64_t v31 = v32;
  if (!*(void *)(v32 + 16)) {
    *(void *)(v31 + 16) = os_transaction_create();
  }
  v34[3] = os_transaction_create();
  *(void *)block = MEMORY[0x263EF8330];
  *(void *)&block[8] = 0x40000000;
  *(void *)&block[16] = __handle_lockdown_xpc_message_block_invoke;
  xpc_object_t v40 = &unk_264138970;
  uint64_t v43 = v32;
  CFDictionaryRef v44 = theDict;
  uint64_t v41 = v8;
  uint64_t v42 = &v33;
  dispatch_async(v7, block);
LABEL_11:
  if (cf) {
    CFRelease(cf);
  }
  if (v11) {
    CFRelease(v11);
  }
  _Block_object_dispose(&v33, 8);
  if (v5)
  {
    xpc_connection_suspend(*(xpc_connection_t *)(a1 + 72));
    goto LABEL_20;
  }
LABEL_19:
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 72));
LABEL_20:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    long long v12 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v12)
    {
      xpc_connection_cancel(v12);
      xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
}

ssize_t lockdown_send(uint64_t *a1, const void *a2, size_t a3)
{
  return lockconn_send(*a1, a2, a3);
}

ssize_t lockdown_recv(uint64_t *a1, void *a2, size_t a3)
{
  return lockconn_recv(*a1, a2, a3);
}

uint64_t lockdown_get_buffered_read_size(uint64_t *a1, size_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return lockconn_get_buffered_read_size(*a1, a2, a3, a4, a5, a6, a7, a8);
}

BOOL lockdown_send_message(void *a1)
{
  return lockconn_send_message_with_format(*a1) != 0;
}

uint64_t lockdown_receive_message(void *a1, uint64_t *a2)
{
  if (!a2) {
    return 1;
  }
  uint64_t v3 = lockconn_receive_message_no_select(*a1);
  if (!v3) {
    return 1;
  }
  uint64_t v4 = v3;
  uint64_t result = 0;
  *a2 = v4;
  return result;
}

uint64_t lockdown_get_socket(unsigned int **a1)
{
  if (a1) {
    return lockconn_sock(*a1);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t *lockdown_get_securecontext(uint64_t *result)
{
  if (result) {
    return (uint64_t *)lockconn_sslcontext(*result);
  }
  return result;
}

uint64_t lockdown_set_value(uint64_t *a1, const void *a2, const void *a3, const void *a4)
{
  CFTypeRef cf = 0;
  send_set_value(*a1, a2, a3, a4, (CFStringRef *)&cf);
  if (!cf) {
    return 0;
  }
  uint64_t v4 = _convert_error((const __CFString *)cf);
  CFRelease(cf);
  return v4;
}

uint64_t _convert_error(const __CFString *a1)
{
  if (!isCFString(a1) || CFEqual(a1, @"InvalidResponse")) {
    return 1;
  }
  if (CFEqual(a1, @"MissingKey")) {
    return 2;
  }
  if (CFEqual(a1, @"MissingValue")) {
    return 3;
  }
  if (CFEqual(a1, @"GetProhibited")) {
    return 4;
  }
  if (CFEqual(a1, @"SetProhibited")) {
    return 5;
  }
  if (CFEqual(a1, @"RemoveProhibited")) {
    return 6;
  }
  if (CFEqual(a1, @"ImmutableValue")) {
    return 7;
  }
  if (CFEqual(a1, @"InvalidCheckin")) {
    return 8;
  }
  if (CFStringCompare(a1, @"CheckinTimeout", 0)) {
    return 0;
  }
  return 9;
}

uint64_t lockdown_save_value(uint64_t *a1, const void *a2, const void *a3, const void *a4)
{
  CFTypeRef cf = 0;
  send_save_value(*a1, a2, a3, a4, (CFStringRef *)&cf);
  if (!cf) {
    return 0;
  }
  uint64_t v4 = _convert_error((const __CFString *)cf);
  CFRelease(cf);
  return v4;
}

uint64_t lockdown_remove_value(uint64_t *a1, const void *a2, const void *a3)
{
  CFTypeRef cf = 0;
  send_remove_value(*a1, a2, a3, &cf);
  if (!cf) {
    return 0;
  }
  uint64_t v3 = _convert_error((const __CFString *)cf);
  CFRelease(cf);
  return v3;
}

uint64_t lockdown_copy_identity(uint64_t *a1)
{
  CFDataRef value = (const __CFData *)send_get_value(*a1, 0, @"ActivationPrivateKey", 0);
  CFDataRef v3 = (const __CFData *)send_get_value(*a1, 0, @"DeviceCertificate", 0);
  CFDataRef v4 = lockcrypto_cert_from_pem_data(v3);
  if (v4)
  {
    CFDataRef v5 = v4;
    uint64_t v6 = lockcrypto_private_key_from_pem_data(value);
    if (v6)
    {
      uint64_t v7 = (const void *)v6;
      uint64_t v8 = SecIdentityCreate();
      CFRelease(v7);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v10 = 0;
        _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Can't convert pem key", v10, 2u);
      }
      uint64_t v8 = 0;
    }
    CFRelease(v5);
    if (v3) {
LABEL_5:
    }
      CFRelease(v3);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Can't convert pem cert", buf, 2u);
    }
    uint64_t v8 = 0;
    if (v3) {
      goto LABEL_5;
    }
  }
  if (value) {
    CFRelease(value);
  }
  return v8;
}

const void *lockdown_copy_DPK()
{
  CFTypeRef cf = 0;
  int v0 = lockdown_connect();
  if (!v0) {
    return 0;
  }
  CFDataRef v1 = v0;
  CFDataRef value = send_get_value(*v0, 0, @"ActivationPrivateKey", (CFStringRef *)&cf);
  if (cf) {
    CFRelease(cf);
  }
  lockdown_disconnect(v1);
  return value;
}

const void *lockdown_copy_ticket_status()
{
  CFTypeRef cf = 0;
  int v0 = lockdown_connect();
  if (!v0) {
    return 0;
  }
  CFDataRef v1 = v0;
  CFDataRef value = send_get_value(*v0, 0, @"WeHaveATicket", (CFStringRef *)&cf);
  if (cf) {
    CFRelease(cf);
  }
  lockdown_disconnect(v1);
  return value;
}

const void *lockdown_copy_activationState()
{
  CFTypeRef cf = 0;
  int v0 = lockdown_connect();
  if (!v0) {
    return 0;
  }
  CFDataRef v1 = v0;
  CFDataRef value = send_get_value(*v0, 0, @"ActivationState", (CFStringRef *)&cf);
  if (cf) {
    CFRelease(cf);
  }
  lockdown_disconnect(v1);
  return value;
}

const void *lockdown_copy_brickState()
{
  CFTypeRef cf = 0;
  int v0 = lockdown_connect();
  if (!v0) {
    return 0;
  }
  CFDataRef v1 = v0;
  CFDataRef value = send_get_value(*v0, 0, @"BrickState", (CFStringRef *)&cf);
  if (cf) {
    CFRelease(cf);
  }
  lockdown_disconnect(v1);
  return value;
}

const void *lockdown_copy_trustedHostAttached()
{
  CFTypeRef cf = 0;
  int v0 = lockdown_connect();
  if (!v0) {
    return 0;
  }
  CFDataRef v1 = v0;
  CFDataRef value = send_get_value(*v0, 0, @"TrustedHostAttached", (CFStringRef *)&cf);
  if (cf) {
    CFRelease(cf);
  }
  lockdown_disconnect(v1);
  return value;
}

const void *lockdown_copy_raptor()
{
  CFTypeRef cf = 0;
  int v0 = lockdown_connect();
  if (!v0) {
    return 0;
  }
  CFDataRef v1 = v0;
  CFDataRef value = send_get_value(*v0, 0, @"UseRaptorCerts", (CFStringRef *)&cf);
  if (cf) {
    CFRelease(cf);
  }
  lockdown_disconnect(v1);
  return value;
}

uint64_t *lockdown_copy_deviceIdentity()
{
  uint64_t result = lockdown_connect();
  if (result)
  {
    CFDataRef v1 = result;
    uint64_t v2 = lockdown_copy_identity(result);
    lockdown_disconnect(v1);
    return (uint64_t *)v2;
  }
  return result;
}

const void *lockdown_copy_deviceCertificate()
{
  CFTypeRef cf = 0;
  int v0 = lockdown_connect();
  if (!v0) {
    return 0;
  }
  CFDataRef v1 = v0;
  CFDataRef value = send_get_value(*v0, 0, @"DeviceCertificate", (CFStringRef *)&cf);
  if (cf) {
    CFRelease(cf);
  }
  lockdown_disconnect(v1);
  return value;
}

const void *lockdown_copy_ticket()
{
  CFTypeRef cf = 0;
  int v0 = lockdown_connect();
  if (!v0) {
    return 0;
  }
  CFDataRef v1 = v0;
  CFDataRef value = send_get_value(*v0, @"com.apple.fmip", @"ActivationRecord", (CFStringRef *)&cf);
  if (cf) {
    CFRelease(cf);
  }
  lockdown_disconnect(v1);
  return value;
}

BOOL lockdown_wifi_sync_enabled()
{
  int v0 = lockdown_connect();
  BOOL v1 = (BOOL)v0;
  if (v0)
  {
    CFDataRef value = send_get_value(*v0, @"com.apple.mobile.wireless_lockdown", @"EnableWifiConnections", 0);
    lockdown_disconnect((uint64_t *)v1);
    if (value)
    {
      BOOL v1 = value == (const void *)*MEMORY[0x263EFFB40];
      CFRelease(value);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

BOOL lockdown_wifi_debug_enabled()
{
  int v0 = lockdown_connect();
  BOOL v1 = (BOOL)v0;
  if (v0)
  {
    CFDataRef value = send_get_value(*v0, @"com.apple.mobile.wireless_lockdown", @"EnableWifiDebugging", 0);
    lockdown_disconnect((uint64_t *)v1);
    if (value)
    {
      BOOL v1 = value == (const void *)*MEMORY[0x263EFFB40];
      CFRelease(value);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

BOOL lockdown_set_fmipticket(BOOL a1)
{
  BOOL v1 = a1;
  if (a1)
  {
    CFTypeRef cf = 0;
    uint64_t v2 = lockdown_connect();
    if (v2)
    {
      CFDataRef v3 = v2;
      BOOL v1 = send_set_value(*v2, @"com.apple.fmip", @"ActivationRecord", (const void *)v1, (CFStringRef *)&cf) == 0;
      if (cf) {
        CFRelease(cf);
      }
      lockdown_disconnect(v3);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

uint64_t *lockdown_is_host_trusted(const void *a1, const void *a2, CFStringRef *a3)
{
  uint64_t result = lockdown_connect();
  if (result)
  {
    uint64_t v7 = result;
    BOOL is_host_trusted = send_is_host_trusted(*result, a1, a2, a3);
    lockdown_disconnect(v7);
    return (uint64_t *)is_host_trusted;
  }
  return result;
}

uint64_t lockdown_reset_pairing()
{
  return lockdown_reset_pairing_internal(1);
}

uint64_t lockdown_reset_pairing_internal(int a1)
{
  CFTypeRef cf = 0;
  uint64_t v2 = lockdown_connect();
  if (!v2) {
    return 8;
  }
  CFDataRef v3 = v2;
  send_reset_pairing(*v2, a1, (CFStringRef *)&cf);
  if (cf)
  {
    uint64_t v4 = _convert_error((const __CFString *)cf);
    CFRelease(cf);
  }
  else
  {
    uint64_t v4 = 0;
  }
  lockdown_disconnect(v3);
  return v4;
}

uint64_t lockdown_delete_pair_records()
{
  return lockdown_reset_pairing_internal(0);
}

const void *lockdown_copy_regulatoryvariant()
{
  CFTypeRef cf = 0;
  int v0 = lockdown_connect();
  if (!v0) {
    return 0;
  }
  BOOL v1 = v0;
  CFDataRef value = send_get_value(*v0, 0, @"ActivationRegulatoryVariant", (CFStringRef *)&cf);
  if (cf) {
    CFRelease(cf);
  }
  lockdown_disconnect(v1);
  return value;
}

uint64_t *lockdown_enable_wireless_pairing(int a1)
{
  uint64_t result = lockdown_connect();
  if (result)
  {
    CFDataRef v3 = result;
    BOOL v4 = send_enable_wireless_pairing(*result, a1);
    lockdown_disconnect(v3);
    return (uint64_t *)v4;
  }
  return result;
}

uint64_t *lockdown_connection_is_wifi(uint64_t *result)
{
  if (result) {
    return (uint64_t *)(lockconn_type(*result) == 3);
  }
  return result;
}

uint64_t *lockdown_connection_is_usb(uint64_t *result)
{
  if (result) {
    return (uint64_t *)(lockconn_type(*result) == 1);
  }
  return result;
}

uint64_t *lockdown_connection_is_proxy(uint64_t *result)
{
  if (result) {
    return (uint64_t *)(lockconn_type(*result) == 2);
  }
  return result;
}

const void *lockdown_copy_paired_host_info()
{
  CFTypeRef cf = 0;
  int v0 = lockdown_connect();
  if (v0)
  {
    BOOL v1 = v0;
    CFDataRef value = send_get_value(*v0, @"com.apple.mobile.lockdown.paired_host_info", 0, (CFStringRef *)&cf);
    if (!value && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      lockdown_copy_paired_host_info_cold_2((uint64_t *)&cf);
    }
    lockdown_disconnect(v1);
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v3) {
      lockdown_copy_paired_host_info_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    return 0;
  }
  return value;
}

uint64_t lockdown_unpair_host_by_id(void *a1)
{
  CFTypeRef cf = 0;
  uint64_t v2 = lockdown_connect();
  if (v2)
  {
    BOOL v3 = v2;
    if (send_unpair(*v2, a1, (__CFString **)&cf))
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        lockdown_unpair_host_by_id_cold_2((uint64_t)a1, (uint64_t *)&cf);
      }
      uint64_t v4 = 6;
    }
    else
    {
      uint64_t v4 = 0;
    }
    lockdown_disconnect(v3);
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v5) {
      lockdown_copy_paired_host_info_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    return 8;
  }
  return v4;
}

xpc_object_t cfbag_xpc_retain(int a1, xpc_object_t object)
{
  if (object) {
    xpc_retain(object);
  }
  return object;
}

void cfbag_xpc_release(int a1, xpc_object_t object)
{
  if (object) {
    xpc_release(object);
  }
}

void *copy_cstr_from_cfstr(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex v4 = MaximumSizeForEncoding + 1;
  BOOL v5 = malloc_type_calloc(1uLL, MaximumSizeForEncoding + 2, 0x157252B8uLL);
  if (!CFStringGetCString(a1, (char *)v5, v4, 0x8000100u))
  {
    free(v5);
    return 0;
  }
  return v5;
}

void __handle_lockdown_xpc_message_block_invoke(void *a1)
{
  (*(void (**)(void))(a1[4] + 16))();
  uint64_t v2 = (const void *)a1[7];
  if (v2) {
    CFRelease(v2);
  }
  os_release(*(void **)(*(void *)(a1[5] + 8) + 24));
  *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

const void *isCFNumber(const void *result)
{
  if (result)
  {
    BOOL v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFNumberGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *isCFDictionary(const void *result)
{
  if (result)
  {
    BOOL v1 = result;
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

const void *isCFArray(const void *result)
{
  if (result)
  {
    BOOL v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFArrayGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *isCFString(const void *result)
{
  if (result)
  {
    BOOL v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *isCFData(const void *result)
{
  if (result)
  {
    BOOL v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFDataGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *isCFBag(const void *result)
{
  if (result)
  {
    BOOL v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFBagGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

BOOL _disable_wake_from_sleep(int a1)
{
  int v10 = 1;
  int v1 = setsockopt(a1, 0xFFFF, 0x10000, &v10, 4u);
  if (v1 == -1)
  {
    CFTypeID v2 = __error();
    char v3 = strerror(*v2);
    locklog(0, "_disable_wake_from_sleep", @"setsockopt(SO_NOWAKEFROMSLEEP) failed: %s", v4, v5, v6, v7, v8, v3);
  }
  return v1 != -1;
}

CFStringRef createIPString(int a1, char *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  sockaddr v33 = (sockaddr)0;
  long long v34 = 0u;
  socklen_t v31 = 128;
  if (getpeername(a1, &v33, &v31))
  {
    int v10 = __error();
    char v11 = strerror(*v10);
    locklog(0, "createIPString", @"Can't get socket address: %s", v12, v13, v14, v15, v16, v11);
  }
  else if (v33.sa_family == 30)
  {
    if (inet_ntop(30, &v33.sa_data[6], cStr, 0x80u))
    {
      char v8 = 1;
      goto LABEL_8;
    }
    uint64_t v24 = __error();
    char v25 = strerror(*v24);
    locklog(0, "createIPString", @"Can't convert to ipv6 string: %s", v26, v27, v28, v29, v30, v25);
  }
  else if (v33.sa_family == 2)
  {
    if (inet_ntop(2, &v33.sa_data[2], cStr, 0x80u))
    {
      char v8 = 0;
LABEL_8:
      *a2 = v8;
      return CFStringCreateWithCString(0, cStr, 0x8000100u);
    }
    char v17 = __error();
    char v18 = strerror(*v17);
    locklog(0, "createIPString", @"Can't convert to ipv4 string: %s", v19, v20, v21, v22, v23, v18);
  }
  else
  {
    locklog(0, "createIPString", @"Unknown socket family %d", v3, v4, v5, v6, v7, v33.sa_family);
  }
  return 0;
}

uint64_t accept_with_timeout(int a1, int a2, const void *a3)
{
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  memset(&v47, 0, sizeof(v47));
  if (__darwin_check_fd_set_overflow(a1, &v47, 0)) {
    *(__int32_t *)((char *)v47.fds_bits + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << a1;
  }
  if (a2)
  {
    LODWORD(v46) = 0;
    uint64_t v45 = a2;
    uint64_t v6 = (timeval *)&v45;
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = select(a1 + 1, &v47, 0, 0, v6);
  if (!v7)
  {
    locklog(v7, "accept_with_timeout", @"Timed out waiting for a connection", v8, v9, v10, v11, v12, v43);
    return 0xFFFFFFFFLL;
  }
  if (v7 == -1)
  {
    uint64_t v13 = __error();
    char v14 = strerror(*v13);
    locklog(0, "accept_with_timeout", @"select error: %s", v15, v16, v17, v18, v19, v14);
    return 0xFFFFFFFFLL;
  }
  uint64_t v22 = accept(a1, 0, 0);
  uint64_t v20 = v22;
  if (v22 == -1)
  {
    long long v36 = __error();
    char v37 = strerror(*v36);
    locklog(0, "accept_with_timeout", @"Could not accept: %s", v38, v39, v40, v41, v42, v37);
    return v20;
  }
  if (a3)
  {
    CFStringRef v23 = createIPString(v22, &v44);
    if (!v23)
    {
      locklog(0, "accept_with_timeout", @"createIPString failed", v24, v25, v26, v27, v28, v43);
      close(v20);
      return 0xFFFFFFFFLL;
    }
    CFStringRef v29 = v23;
    uint64_t v30 = CFEqual(v23, a3);
    if (!v30)
    {
      locklog(v30, "accept_with_timeout", @"Denying unauthorized host from %@, was expecting %@.", v31, v32, v33, v34, v35, (char)v29);
      close(v20);
      uint64_t v20 = 0xFFFFFFFFLL;
    }
    CFRelease(v29);
  }
  return v20;
}

CFTypeRef copy_array_from_xpc_data(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFErrorRef error = 0;
  if (!a1 || MEMORY[0x216671E50]() != MEMORY[0x263EF86F8])
  {
    locklog(0, "copy_array_from_xpc_data", @"Invalid input(s).", a4, a5, a6, a7, a8, v29);
    return 0;
  }
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(a1);
  size_t length = xpc_data_get_length(a1);
  CFDataRef v14 = CFDataCreateWithBytesNoCopy(v11, bytes_ptr, length, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  if (!v14) {
    return 0;
  }
  CFDataRef v15 = v14;
  CFPropertyListRef v16 = CFPropertyListCreateWithData(0, v14, 0, 0, &error);
  if (v16)
  {
    uint64_t v22 = v16;
    CFTypeID v23 = CFGetTypeID(v16);
    if (v23 == CFArrayGetTypeID())
    {
      CFTypeRef v9 = CFRetain(v22);
    }
    else
    {
      locklog(0, "copy_array_from_xpc_data", @"XPC data is not an array.", v24, v25, v26, v27, v28, v29);
      CFTypeRef v9 = 0;
    }
    CFRelease(v22);
  }
  else
  {
    locklog(0, "copy_array_from_xpc_data", @"Failed to create data: %@", v17, v18, v19, v20, v21, (char)error);
    CFTypeRef v9 = 0;
  }
  CFRelease(v15);
  if (error) {
    CFRelease(error);
  }
  return v9;
}

CFTypeRef copy_dict_from_xpc_data(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFErrorRef error = 0;
  if (!a1 || MEMORY[0x216671E50]() != MEMORY[0x263EF86F8])
  {
    locklog(0, "copy_dict_from_xpc_data", @"Invalid input(s).", a4, a5, a6, a7, a8, v29);
    return 0;
  }
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(a1);
  size_t length = xpc_data_get_length(a1);
  CFDataRef v14 = CFDataCreateWithBytesNoCopy(v11, bytes_ptr, length, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  if (!v14) {
    return 0;
  }
  CFDataRef v15 = v14;
  CFPropertyListRef v16 = CFPropertyListCreateWithData(0, v14, 0, 0, &error);
  if (v16)
  {
    uint64_t v22 = v16;
    CFTypeID v23 = CFGetTypeID(v16);
    if (v23 == CFDictionaryGetTypeID())
    {
      CFTypeRef v9 = CFRetain(v22);
    }
    else
    {
      locklog(0, "copy_dict_from_xpc_data", @"XPC data is not a dictionary.", v24, v25, v26, v27, v28, v29);
      CFTypeRef v9 = 0;
    }
    CFRelease(v22);
  }
  else
  {
    locklog(0, "copy_dict_from_xpc_data", @"Failed to create data: %@", v17, v18, v19, v20, v21, (char)error);
    CFTypeRef v9 = 0;
  }
  CFRelease(v15);
  if (error) {
    CFRelease(error);
  }
  return v9;
}

SSLContext *lockssl_handshake(int a1, const __CFData *a2, const __CFData *a3, const __CFData *a4, int a5)
{
  CFTypeRef cf = 0;
  SecTrustRef trust = 0;
  CFErrorRef error = 0;
  CFTypeRef certificates = 0;
  SSLContextRef context = 0;
  CFDataRef v14 = lockcrypto_cert_from_pem_data(a2);
  CFDataRef v15 = (const __CFAllocator **)MEMORY[0x263EFFB08];
  if (v14)
  {
    uint64_t v16 = lockcrypto_private_key_from_pem_data(a3);
    if (v16)
    {
      uint64_t v22 = (const void *)v16;
      _SSLNewContext();
      locklog(0, "lockssl_create_context", @"Could not create SSL context", v48, v49, v50, v51, v52, v53);
      goto LABEL_5;
    }
  }
  else
  {
    locklog(0, "lockssl_create_context", @"Could not decode certificate", v9, v10, v11, v12, v13, v53);
    uint64_t v22 = (const void *)lockcrypto_private_key_from_pem_data(a3);
    if (v22)
    {
LABEL_5:
      CFRelease(v22);
      if (!v14) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  locklog(0, "lockssl_create_context", @"Could not decode private key", v17, v18, v19, v20, v21, v53);
  if (v14) {
LABEL_6:
  }
    CFRelease(v14);
LABEL_7:
  uint64_t v28 = context;
  if (context)
  {
    if (SSLSetProtocolVersionMin(context, kTLSProtocol1))
    {
      CFStringRef v47 = @"Could Not Set Minimum Protocol Version";
    }
    else
    {
      OSStatus v29 = SSLSetConnection(v28, (SSLConnectionRef)a1);
      if (v29)
      {
        locklog(0, "lockssl_handshake", @"SSLSetConnection returned %ld", v30, v31, v32, v33, v34, v29);
        goto LABEL_58;
      }
      SSLSetSessionOption(v28, (SSLSessionOption)(2 * (a5 == 0)), 1u);
      CFAllocatorRef v35 = *v15;
      long long v36 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
      do
      {
        OSStatus v37 = SSLHandshake(v28);
        if (v37 == -9841)
        {
          if (_SSLCopyPeerCertificates())
          {
            CFStringRef v47 = @"SSLCopyPeerCertificates failed";
            goto LABEL_57;
          }
          LockdownPairing = (const void *)SecPolicyCreateLockdownPairing();
          if (SecTrustCreateWithCertificates(certificates, LockdownPairing, &trust))
          {
            locklog(0, "lockssl_handshake", @"SecTrustCreateWithCertificates failed", v39, v40, v41, v42, v43, v53);
LABEL_53:
            uint64_t v45 = 0;
            goto LABEL_59;
          }
          CFTypeRef cf = lockcrypto_cert_from_pem_data(a4);
          if (!cf) {
            goto LABEL_53;
          }
          CFArrayRef v44 = CFArrayCreate(v35, &cf, 1, v36);
          if (SecTrustSetAnchorCertificates(trust, v44)) {
            goto LABEL_55;
          }
          if (!SecTrustEvaluateWithError(trust, &error))
          {
            locklog(0, "lockssl_handshake", @"SecTrustEvalute failed", v23, v24, v25, v26, v27, v53);
LABEL_55:
            uint64_t v45 = 0;
            goto LABEL_31;
          }
          if (certificates) {
            CFRelease(certificates);
          }
          CFTypeRef certificates = 0;
          if (v44) {
            CFRelease(v44);
          }
          if (cf) {
            CFRelease(cf);
          }
          CFTypeRef cf = 0;
          if (LockdownPairing) {
            CFRelease(LockdownPairing);
          }
          if (trust) {
            CFRelease(trust);
          }
          SecTrustRef trust = 0;
          OSStatus v37 = -9803;
        }
      }
      while (v37 == -9803);
      if (!v37)
      {
        LockdownPairing = 0;
        CFArrayRef v44 = 0;
        uint64_t v45 = v28;
        uint64_t v28 = 0;
        goto LABEL_31;
      }
      char v53 = v37;
      CFStringRef v47 = @"SSLHandshake returned %ld";
    }
  }
  else
  {
    CFStringRef v47 = @"Could not create ssl context";
  }
LABEL_57:
  locklog(0, "lockssl_handshake", v47, v23, v24, v25, v26, v27, v53);
LABEL_58:
  uint64_t v45 = 0;
  LockdownPairing = 0;
LABEL_59:
  CFArrayRef v44 = 0;
LABEL_31:
  if (certificates) {
    CFRelease(certificates);
  }
  CFTypeRef certificates = 0;
  if (v44) {
    CFRelease(v44);
  }
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0;
  if (LockdownPairing) {
    CFRelease(LockdownPairing);
  }
  if (trust) {
    CFRelease(trust);
  }
  SecTrustRef trust = 0;
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0;
  if (v28)
  {
    SSLClose(v28);
    _SSLDisposeContext();
  }
  return v45;
}

uint64_t SocketRead(int a1, char *a2, size_t *a3)
{
  size_t v6 = *a3;
  *a3 = 0;
  size_t v7 = v6;
  while (1)
  {
    *__error() = -555;
    if (_select_socket())
    {
      locklog(0, "SocketRead", @"walk away", v8, v9, v10, v11, v12, v16);
      goto LABEL_7;
    }
    ssize_t v13 = recv(a1, a2, v7, 0);
    if (v13 <= 0) {
      break;
    }
    a2 += v13;
    v7 -= v13;
    if (!v7)
    {
      uint64_t result = 0;
      goto LABEL_14;
    }
  }
  if (!v13)
  {
    uint64_t result = 4294957491;
    goto LABEL_14;
  }
  int v15 = *__error();
  uint64_t result = 4294957493;
  if (v15 != 2 && v15 != 35)
  {
    if (v15 != 54)
    {
      uint64_t result = 4294967260;
      goto LABEL_14;
    }
LABEL_7:
    uint64_t result = 4294957490;
  }
LABEL_14:
  *a3 = v6 - v7;
  return result;
}

uint64_t SocketWrite(int __fd, uint64_t a2, unint64_t *a3)
{
  unint64_t v6 = 0;
  unint64_t v7 = *a3;
  *a3 = 0;
  while (1)
  {
    ssize_t v8 = write(__fd, (const void *)(a2 + v6), v7 - v6);
    if (v8 < 1) {
      break;
    }
    v6 += v8;
    if (v6 >= v7)
    {
      uint64_t result = 0;
      goto LABEL_11;
    }
  }
  int v10 = *__error();
  if (v10 == 32) {
    unsigned int v11 = -9806;
  }
  else {
    unsigned int v11 = -36;
  }
  if (v10 == 35) {
    uint64_t result = 4294957493;
  }
  else {
    uint64_t result = v11;
  }
LABEL_11:
  *a3 = v6;
  return result;
}

void secure_lockdown_checkin_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void lockdown_copy_paired_host_info_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void lockdown_copy_paired_host_info_cold_2(uint64_t *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to read paired host info: %@", (uint8_t *)&v2, 0xCu);
}

void lockdown_unpair_host_by_id_cold_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a2;
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_21077C000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to unpair host ID '%@': %@", (uint8_t *)&v3, 0x16u);
}

uint64_t CCDigest()
{
  return MEMORY[0x270ED7970]();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
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

CFBagRef CFBagCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFBagCallBacks *callBacks)
{
  return (CFBagRef)MEMORY[0x270EE4460](allocator, values, numValues, callBacks);
}

CFIndex CFBagGetCount(CFBagRef theBag)
{
  return MEMORY[0x270EE4478](theBag);
}

CFTypeID CFBagGetTypeID(void)
{
  return MEMORY[0x270EE4488]();
}

void CFBagGetValues(CFBagRef theBag, const void **values)
{
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t MKBKeyBagCreateWithData()
{
  return MEMORY[0x270F4AE68]();
}

uint64_t MKBKeyBagUnlock()
{
  return MEMORY[0x270F4AEA0]();
}

OSStatus SSLClose(SSLContextRef context)
{
  return MEMORY[0x270EFD500](context);
}

OSStatus SSLGetBufferedReadSize(SSLContextRef context, size_t *bufferSize)
{
  return MEMORY[0x270EFD518](context, bufferSize);
}

OSStatus SSLHandshake(SSLContextRef context)
{
  return MEMORY[0x270EFD550](context);
}

OSStatus SSLRead(SSLContextRef context, void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x270EFD588](context, data, dataLength, processed);
}

OSStatus SSLSetCertificate(SSLContextRef context, CFArrayRef certRefs)
{
  return MEMORY[0x270EFD590](context, certRefs);
}

OSStatus SSLSetClientSideAuthenticate(SSLContextRef context, SSLAuthenticate auth)
{
  return MEMORY[0x270EFD598](context, *(void *)&auth);
}

OSStatus SSLSetConnection(SSLContextRef context, SSLConnectionRef connection)
{
  return MEMORY[0x270EFD5A0](context, connection);
}

OSStatus SSLSetIOFuncs(SSLContextRef context, SSLReadFunc readFunc, SSLWriteFunc writeFunc)
{
  return MEMORY[0x270EFD5B0](context, readFunc, writeFunc);
}

OSStatus SSLSetProtocolVersionMin(SSLContextRef context, SSLProtocol minVersion)
{
  return MEMORY[0x270EFD5D8](context, *(void *)&minVersion);
}

OSStatus SSLSetSessionOption(SSLContextRef context, SSLSessionOption option, Boolean value)
{
  return MEMORY[0x270EFD5F0](context, *(void *)&option, value);
}

OSStatus SSLWrite(SSLContextRef context, const void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x270EFD5F8](context, data, dataLength, processed);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x270EFD8F0](*(void *)&status, reserved);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x270EFD958]();
}

uint64_t SecKeyCreateRSAPrivateKey()
{
  return MEMORY[0x270EFDA30]();
}

uint64_t SecPolicyCreateLockdownPairing()
{
  return MEMORY[0x270EFDB70]();
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x270EFDDA8](trust, anchorCertificates);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

char **_NSGetProgname(void)
{
  return (char **)MEMORY[0x270ED7D20]();
}

uint64_t _SSLCopyPeerCertificates()
{
  return MEMORY[0x270EFDE58]();
}

uint64_t _SSLDisposeContext()
{
  return MEMORY[0x270EFDE60]();
}

uint64_t _SSLNewContext()
{
  return MEMORY[0x270EFDE68]();
}

uint64_t _SSLSetEnableCertVerify()
{
  return MEMORY[0x270EFDE70]();
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x270ED7DA8](*(void *)&a1, a2, *(void *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x270ED7EB0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED8478](*(void *)&a1, a2, a3);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8F58](*(void *)&a1, a2, *(void *)&a3);
}

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return (char *)MEMORY[0x270ED9170](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED9CD0](*(void *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB190](*(void *)&a1, a2, a3, *(void *)&a4);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x270EDB328](*(void *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB3B0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x270EDB660](__big, __little, __len);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_suspend(xpc_connection_t connection)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC028](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

int64_t xpc_dictionary_get_date(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC070](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
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