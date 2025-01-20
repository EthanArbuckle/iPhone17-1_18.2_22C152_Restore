uint64_t WiFiCloudSyncEngineUnScheduleWithQueue(uint64_t result, const void *a2)
{
  uint64_t v2;
  int v3;

  if (result)
  {
    if (a2)
    {
      v2 = result;
      result = *(void *)(result + 32);
      if (result)
      {
        result = CFEqual((CFTypeRef)result, a2);
        if (result)
        {
          WiFiCloudSyncEngineStopEngine(v2);
          v3 = *(_DWORD *)(v2 + 168);
          if (v3) {
            notify_cancel(v3);
          }
          result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
          if (result) {
            return _os_log_send_and_compose_impl();
          }
        }
      }
    }
  }
  else
  {
    result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (result) {
      return _os_log_send_and_compose_impl();
    }
  }
  return result;
}

void WiFiCloudSyncEngineLoggerLog(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v12 = (void *)[[NSString alloc] initWithFormat:a4 arguments:&a9];
  v13 = (void *)[[NSString alloc] initWithFormat:@"%@ %s: %@", a2, a3, v12];
  LogCallbackFunction = (void (*)(void *))WiFiCloudSyncEngineGetLogCallbackFunction(a1);
  if (LogCallbackFunction) {
    LogCallbackFunction(v13);
  }
  else {
    NSLog(&cfstr_NoClientLogger.isa, "Nov 14 2024", "22:48:36", v13);
  }
}

uint64_t WiFiCloudSyncEngineAllowLegacyUpdates()
{
  return 0;
}

void *WiFiCloudSyncEngineCreate()
{
  if (!__wiFiCloudEngineTypeID) {
    pthread_once(&__wiFiCloudEngineTypeInit, (void (*)(void))__WiFiCloudSyncEngineRegister);
  }
  Instance = (_OWORD *)_CFRuntimeCreateInstance();
  if (!Instance)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
    return 0;
  }
  v1 = Instance;
  Instance[16] = 0u;
  Instance[17] = 0u;
  Instance[14] = 0u;
  Instance[15] = 0u;
  Instance[12] = 0u;
  Instance[13] = 0u;
  Instance[10] = 0u;
  Instance[11] = 0u;
  Instance[8] = 0u;
  Instance[9] = 0u;
  Instance[6] = 0u;
  Instance[7] = 0u;
  Instance[4] = 0u;
  Instance[5] = 0u;
  Instance[2] = 0u;
  Instance[3] = 0u;
  Instance[1] = 0u;
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  v1[18] = Mutable;
  if (!Mutable) {
    goto LABEL_13;
  }
  CFMutableArrayRef v4 = CFArrayCreateMutable(v2, 0, MEMORY[0x263EFFF70]);
  v1[30] = v4;
  if (!v4) {
    goto LABEL_13;
  }
  v5 = [[WiFiCloudSyncEngineCore alloc] initWithEncryptedKVS:0];
  v1[5] = v5;
  if (!v5) {
    goto LABEL_13;
  }
  v6 = [[WiFiCloudSyncEngineCore alloc] initWithEncryptedKVS:1];
  v1[6] = v6;
  if (!v6) {
    goto LABEL_13;
  }
  v7 = dispatch_queue_create("com.apple.wifi.wcse.serialQ.circleChanges", 0);
  v1[27] = v7;
  if (!v7
    || (dispatch_source_t v8 = dispatch_source_create(MEMORY[0x263EF83B0], 0, 0, v7), (v1[28] = v8) == 0)
    || (v9 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM), dispatch_queue_t v10 = dispatch_queue_create("com.apple.wifi.wcse.kvs_events", v9), (v1[34] = v10) == 0)|| (v11 = dispatch_semaphore_create(4), (v1[35] = v11) == 0))
  {
LABEL_13:
    CFRelease(v1);
    return 0;
  }
  return v1;
}

void WiFiCloudSyncEngineScheduleWithQueue(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a1)
  {
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = a2;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      v6 = "WiFiCloudSyncEngineScheduleWithQueue";
      __int16 v7 = 2080;
      dispatch_source_t v8 = "WiFiCloudSyncEngine.m";
      __int16 v9 = 1024;
      int v10 = 735;
      _os_log_send_and_compose_impl();
    }
    __WiFiCloudSyncEngineSetupKeychainChangedNotification(a1);
    v3 = *(NSObject **)(a1 + 224);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __WiFiCloudSyncEngineScheduleWithQueue_block_invoke;
    handler[3] = &__block_descriptor_40_e5_v8__0l;
    handler[4] = a1;
    dispatch_source_set_event_handler(v3, handler);
    dispatch_resume(*(dispatch_object_t *)(a1 + 224));
    __WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification(a1);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    _os_log_send_and_compose_impl();
  }
}

uint64_t __WiFiCloudSyncEngineSetupKeychainChangedNotification(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = (void *)a1;
  if (!a1)
  {
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (!result) {
      return result;
    }
    mach_port_t notify_port = 136315650;
    __int16 v7 = "__WiFiCloudSyncEngineSetupKeychainChangedNotification";
    __int16 v8 = 2080;
    __int16 v9 = "WiFiCloudSyncEngine.m";
    __int16 v10 = 1024;
    int v11 = 957;
    return _os_log_send_and_compose_impl();
  }
  if (!*(void *)(a1 + 16) || !*(void *)(a1 + 24))
  {
    if (*(void *)(a1 + 32)) {
      goto LABEL_13;
    }
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (!result) {
      return result;
    }
    mach_port_t notify_port = 136315650;
    __int16 v7 = "__WiFiCloudSyncEngineSetupKeychainChangedNotification";
    __int16 v8 = 2080;
    __int16 v9 = "WiFiCloudSyncEngine.m";
    __int16 v10 = 1024;
    int v11 = 958;
    return _os_log_send_and_compose_impl();
  }
  CFAllocatorRef v2 = *(__CFMachPort **)(a1 + 200);
  if (v2)
  {
LABEL_8:
    if (!*(void *)(a1 + 208))
    {
      CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x263EFFB08], v2, 0);
      *(void *)(a1 + 208) = RunLoopSource;
      if (!RunLoopSource)
      {
        uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
        if (!result) {
          return result;
        }
        mach_port_t notify_port = 136315650;
        __int16 v7 = "__WiFiCloudSyncEngineSetupKeychainChangedNotification";
        __int16 v8 = 2080;
        __int16 v9 = "WiFiCloudSyncEngine.m";
        __int16 v10 = 1024;
        int v11 = 974;
        return _os_log_send_and_compose_impl();
      }
    }
LABEL_13:
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (!result) {
      return result;
    }
    mach_port_t notify_port = 136315650;
    __int16 v7 = "__WiFiCloudSyncEngineSetupKeychainChangedNotification";
    __int16 v8 = 2080;
    __int16 v9 = "WiFiCloudSyncEngine.m";
    __int16 v10 = 1024;
    int v11 = 978;
    return _os_log_send_and_compose_impl();
  }
  mach_port_t notify_port = 0;
  uint64_t result = notify_register_mach_port((const char *)kKeychainChangedNotificationName, &notify_port, 0, (int *)(a1 + 192));
  if (!result)
  {
    uint64_t result = (uint64_t)CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x263EFFB08], notify_port, (CFMachPortCallBack)__WiFiCloudSyncEngineKeychainChangedNotificationCallback, &context, 0);
    *(void *)(a1 + 200) = result;
    if (result)
    {
      CFAllocatorRef v2 = (__CFMachPort *)result;
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t __WiFiCloudSyncEngineScheduleWithQueue_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uintptr_t data = dispatch_source_get_data(*(dispatch_source_t *)(*(void *)(a1 + 32) + 224));
    int v6 = 136315906;
    __int16 v7 = "WiFiCloudSyncEngineScheduleWithQueue_block_invoke";
    __int16 v8 = 2080;
    __int16 v9 = "WiFiCloudSyncEngine.m";
    __int16 v10 = 1024;
    int v11 = 741;
    __int16 v12 = 2048;
    uintptr_t v13 = data;
    LODWORD(v5) = 38;
    CFMutableArrayRef v4 = &v6;
    _os_log_send_and_compose_impl();
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "queryKeychainSyncState", v4, v5);
  return [*(id *)(*(void *)(a1 + 32) + 48) queryKeychainSyncState];
}

void __WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = (void *)a1;
  if (!a1)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    mach_port_t notify_port = 136315650;
    __int16 v10 = "__WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification";
    __int16 v11 = 2080;
    __int16 v12 = "WiFiCloudSyncEngine.m";
    __int16 v13 = 1024;
    int v14 = 910;
    goto LABEL_22;
  }
  if (!*(void *)(a1 + 16) || !*(void *)(a1 + 24))
  {
    if (*(void *)(a1 + 32)) {
      goto LABEL_12;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    mach_port_t notify_port = 136315650;
    __int16 v10 = "__WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification";
    __int16 v11 = 2080;
    __int16 v12 = "WiFiCloudSyncEngine.m";
    __int16 v13 = 1024;
    int v14 = 911;
LABEL_22:
    _os_log_send_and_compose_impl();
    return;
  }
  CFAllocatorRef v2 = *(__CFMachPort **)(a1 + 176);
  if (!v2)
  {
    mach_port_t notify_port = 0;
    if (notify_register_mach_port((const char *)*MEMORY[0x263F16DA0], &notify_port, 0, (int *)(a1 + 168))) {
      return;
    }
    CFMachPortRef v3 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x263EFFB08], notify_port, (CFMachPortCallBack)__WiFiCloudSyncEngineKeychainSyncStateChanged, &context, 0);
    *(void *)(a1 + 176) = v3;
    if (!v3) {
      return;
    }
    CFAllocatorRef v2 = v3;
  }
  CFRunLoopSourceRef RunLoopSource = *(__CFRunLoopSource **)(a1 + 184);
  if (!RunLoopSource)
  {
    CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x263EFFB08], v2, 0);
    *(void *)(a1 + 184) = RunLoopSource;
    if (!RunLoopSource)
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      mach_port_t notify_port = 136315650;
      __int16 v10 = "__WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification";
      __int16 v11 = 2080;
      __int16 v12 = "WiFiCloudSyncEngine.m";
      __int16 v13 = 1024;
      int v14 = 926;
      goto LABEL_22;
    }
  }
  CFRunLoopAddSource(*(CFRunLoopRef *)(a1 + 16), RunLoopSource, *(CFRunLoopMode *)(a1 + 24));
LABEL_12:
  uint64_t v5 = *(NSObject **)(a1 + 32);
  if (v5)
  {
    int v6 = (const char *)*MEMORY[0x263F16DA0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = ____WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification_block_invoke;
    handler[3] = &__block_descriptor_40_e8_v12__0i8l;
    handler[4] = a1;
    notify_register_dispatch(v6, (int *)(a1 + 168), v5, handler);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    mach_port_t notify_port = 136315650;
    __int16 v10 = "__WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification";
    __int16 v11 = 2080;
    __int16 v12 = "WiFiCloudSyncEngine.m";
    __int16 v13 = 1024;
    int v14 = 939;
    _os_log_send_and_compose_impl();
  }
  WiFiCloudSyncEngineCheckKeychainSyncState(a1);
}

void WiFiCloudSyncEngineStopEngine(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v8 = 136315650;
    __int16 v9 = "WiFiCloudSyncEngineStopEngine";
    __int16 v10 = 2080;
    __int16 v11 = "WiFiCloudSyncEngine.m";
    __int16 v12 = 1024;
    int v13 = 1358;
    goto LABEL_11;
  }
  int v2 = *(unsigned __int8 *)(a1 + 56);
  BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (!v3) {
      return;
    }
    int v8 = 136315650;
    __int16 v9 = "WiFiCloudSyncEngineStopEngine";
    __int16 v10 = 2080;
    __int16 v11 = "WiFiCloudSyncEngine.m";
    __int16 v12 = 1024;
    int v13 = 1361;
    goto LABEL_11;
  }
  if (v3)
  {
    int v8 = 136315650;
    __int16 v9 = "WiFiCloudSyncEngineStopEngine";
    __int16 v10 = 2080;
    __int16 v11 = "WiFiCloudSyncEngine.m";
    __int16 v12 = 1024;
    int v13 = 1365;
    LODWORD(v7) = 28;
    int v6 = &v8;
    _os_log_send_and_compose_impl();
  }
  *(unsigned char *)(a1 + 56) = 0;
  objc_msgSend(*(id *)(a1 + 40), "enableIcloudSyncing:ForBundleId:", 0, 0, v6, v7);
  [*(id *)(a1 + 48) enableIcloudSyncing:0 ForBundleId:0];
  uint64_t v4 = *(void *)(a1 + 144);
  BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (!v5) {
      return;
    }
    int v8 = 136315650;
    __int16 v9 = "__WiFiCloudSyncEngineFlushWaitingForPasswordList";
    __int16 v10 = 2080;
    __int16 v11 = "WiFiCloudSyncEngine.m";
    __int16 v12 = 1024;
    int v13 = 2791;
LABEL_11:
    _os_log_send_and_compose_impl();
    return;
  }
  if (v5)
  {
    int v8 = 136315650;
    __int16 v9 = "__WiFiCloudSyncEngineFlushWaitingForPasswordList";
    __int16 v10 = 2080;
    __int16 v11 = "WiFiCloudSyncEngine.m";
    __int16 v12 = 1024;
    int v13 = 2793;
    _os_log_send_and_compose_impl();
  }
  __WiFiCloudSyncEngineStopKeychainChangedNotifications(a1);
  CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 144));
}

void WiFiCloudSyncEngineScheduleWithRunLoop(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a1)
  {
    *(void *)(a1 + 16) = a2;
    *(void *)(a1 + 24) = a3;
    *(void *)(a1 + 32) = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      uint64_t v7 = "WiFiCloudSyncEngineScheduleWithRunLoop";
      __int16 v8 = 2080;
      __int16 v9 = "WiFiCloudSyncEngine.m";
      __int16 v10 = 1024;
      int v11 = 789;
      _os_log_send_and_compose_impl();
    }
    __WiFiCloudSyncEngineSetupKeychainChangedNotification(a1);
    uint64_t v4 = *(NSObject **)(a1 + 224);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __WiFiCloudSyncEngineScheduleWithRunLoop_block_invoke;
    handler[3] = &__block_descriptor_40_e5_v8__0l;
    handler[4] = a1;
    dispatch_source_set_event_handler(v4, handler);
    dispatch_resume(*(dispatch_object_t *)(a1 + 224));
    __WiFiCloudSyncEngineSetupKeychainSyncStateChangeNotification(a1);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    _os_log_send_and_compose_impl();
  }
}

uint64_t __WiFiCloudSyncEngineScheduleWithRunLoop_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uintptr_t data = dispatch_source_get_data(*(dispatch_source_t *)(*(void *)(a1 + 32) + 224));
    int v6 = 136315906;
    uint64_t v7 = "WiFiCloudSyncEngineScheduleWithRunLoop_block_invoke";
    __int16 v8 = 2080;
    __int16 v9 = "WiFiCloudSyncEngine.m";
    __int16 v10 = 1024;
    int v11 = 795;
    __int16 v12 = 2048;
    uintptr_t v13 = data;
    LODWORD(v5) = 38;
    uint64_t v4 = &v6;
    _os_log_send_and_compose_impl();
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "queryKeychainSyncState", v4, v5);
  return [*(id *)(*(void *)(a1 + 32) + 48) queryKeychainSyncState];
}

uint64_t WiFiCloudSyncEngineUnScheduleWithRunLoop(uint64_t result, void *cf2, const __CFString *a3)
{
  if (result)
  {
    if (cf2)
    {
      uint64_t v4 = result;
      uint64_t result = *(void *)(result + 16);
      if (result)
      {
        if (a3)
        {
          if (*(void *)(v4 + 24))
          {
            uint64_t result = CFEqual((CFTypeRef)result, cf2);
            if (result)
            {
              uint64_t result = CFEqual(*(CFTypeRef *)(v4 + 24), a3);
              if (result)
              {
                WiFiCloudSyncEngineStopEngine(v4);
                CFRunLoopRemoveSource((CFRunLoopRef)cf2, *(CFRunLoopSourceRef *)(v4 + 184), a3);
                uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                if (result) {
                  return _os_log_send_and_compose_impl();
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (result) {
      return _os_log_send_and_compose_impl();
    }
  }
  return result;
}

uint64_t WiFiCloudSyncEngineRegisterCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    if (a2)
    {
      uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      if (a4)
      {
        if (result) {
          _os_log_send_and_compose_impl();
        }
        if (*(void *)(a2 + 40))
        {
          if (*(void *)(a2 + 8))
          {
            if (*(void *)(a2 + 24))
            {
              if (*(void *)(a2 + 48))
              {
                if (*(void *)(a2 + 16))
                {
                  if (*(void *)(a2 + 56))
                  {
                    if (*(void *)(a2 + 32))
                    {
                      *(void *)(a1 + 136) = a3;
                      *(_OWORD *)(a1 + 64) = *(_OWORD *)a2;
                      long long v9 = *(_OWORD *)(a2 + 16);
                      long long v10 = *(_OWORD *)(a2 + 32);
                      long long v11 = *(_OWORD *)(a2 + 48);
                      *(void *)(a1 + 128) = *(void *)(a2 + 64);
                      *(_OWORD *)(a1 + 96) = v10;
                      *(_OWORD *)(a1 + 112) = v11;
                      *(_OWORD *)(a1 + 80) = v9;

                      *(void *)(a1 + 160) = [a4 copy];
                      [*(id *)(a1 + 40) registerCallback:__WiFiCloudSyncEngineCloudEventCallback context:a1];
                      [*(id *)(a1 + 48) registerCallback:__WiFiCloudSyncEngineCloudEventCallback context:a1];
                      uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                      if (!result) {
                        return result;
                      }
                      return _os_log_send_and_compose_impl();
                    }
                    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                    if (result) {
                      return _os_log_send_and_compose_impl();
                    }
                  }
                  else
                  {
                    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                    if (result) {
                      return _os_log_send_and_compose_impl();
                    }
                  }
                }
                else
                {
                  uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                  if (result) {
                    return _os_log_send_and_compose_impl();
                  }
                }
              }
              else
              {
                uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                if (result) {
                  return _os_log_send_and_compose_impl();
                }
              }
            }
            else
            {
              uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
              if (result) {
                return _os_log_send_and_compose_impl();
              }
            }
          }
          else
          {
            uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
            if (result) {
              return _os_log_send_and_compose_impl();
            }
          }
        }
        else
        {
          uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
          if (result) {
            return _os_log_send_and_compose_impl();
          }
        }
      }
      else if (result)
      {
        return _os_log_send_and_compose_impl();
      }
    }
    else
    {
      uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      if (result) {
        return _os_log_send_and_compose_impl();
      }
    }
  }
  else
  {
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (result) {
      return _os_log_send_and_compose_impl();
    }
  }
  return result;
}

void __WiFiCloudSyncEngineCloudEventCallback(void *a1, void *a2, NSObject **a3)
{
  if (a2 && a3)
  {
    if ([a1 isKVSEncrypted])
    {
      int v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"reason"), "intValue");
      uint64_t v7 = (void *)[a2 objectForKey:@"changedKeys"];
      switch(v6)
      {
        case 0:
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_9;
          }
          goto LABEL_8;
        case 1:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
LABEL_8:
          }
            _os_log_send_and_compose_impl();
LABEL_9:
          __WiFiCloudSyncEngineProcessCloudChangeEvent(a3, (uint64_t)a1, v7);
          break;
        case 2:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_13;
          }
          break;
        case 3:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_13;
          }
          break;
        default:
          return;
      }
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
LABEL_13:
    _os_log_send_and_compose_impl();
  }
}

uint64_t WiFiCloudSyncEngineRegisterCallbacksWithQueue(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (a1)
  {
    if (a2)
    {
      uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      if (a4)
      {
        if (result) {
          _os_log_send_and_compose_impl();
        }
        if (*(void *)(a2 + 40))
        {
          if (*(void *)(a2 + 8))
          {
            if (*(void *)(a2 + 24))
            {
              if (*(void *)(a2 + 48))
              {
                if (*(void *)(a2 + 16))
                {
                  if (*(void *)(a2 + 56))
                  {
                    if (*(void *)(a2 + 32))
                    {
                      *(void *)(a1 + 136) = a3;
                      *(_OWORD *)(a1 + 64) = *(_OWORD *)a2;
                      long long v11 = *(_OWORD *)(a2 + 16);
                      long long v12 = *(_OWORD *)(a2 + 32);
                      long long v13 = *(_OWORD *)(a2 + 48);
                      *(void *)(a1 + 128) = *(void *)(a2 + 64);
                      *(_OWORD *)(a1 + 96) = v12;
                      *(_OWORD *)(a1 + 112) = v13;
                      *(_OWORD *)(a1 + 80) = v11;

                      *(void *)(a1 + 160) = [a4 copy];
                      [*(id *)(a1 + 40) registerCallback:__WiFiCloudSyncEngineCloudEventCallback queue:a5 context:a1];
                      [*(id *)(a1 + 48) registerCallback:__WiFiCloudSyncEngineCloudEventCallback queue:a5 context:a1];
                      uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                      if (!result) {
                        return result;
                      }
                      return _os_log_send_and_compose_impl();
                    }
                    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                    if (result) {
                      return _os_log_send_and_compose_impl();
                    }
                  }
                  else
                  {
                    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                    if (result) {
                      return _os_log_send_and_compose_impl();
                    }
                  }
                }
                else
                {
                  uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                  if (result) {
                    return _os_log_send_and_compose_impl();
                  }
                }
              }
              else
              {
                uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                if (result) {
                  return _os_log_send_and_compose_impl();
                }
              }
            }
            else
            {
              uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
              if (result) {
                return _os_log_send_and_compose_impl();
              }
            }
          }
          else
          {
            uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
            if (result) {
              return _os_log_send_and_compose_impl();
            }
          }
        }
        else
        {
          uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
          if (result) {
            return _os_log_send_and_compose_impl();
          }
        }
      }
      else if (result)
      {
        return _os_log_send_and_compose_impl();
      }
    }
    else
    {
      uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      if (result) {
        return _os_log_send_and_compose_impl();
      }
    }
  }
  else
  {
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (result) {
      return _os_log_send_and_compose_impl();
    }
  }
  return result;
}

void WiFiCloudSyncEngineCheckKeychainSyncState(uint64_t a1)
{
  BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (a1)
  {
    if (v2) {
      _os_log_send_and_compose_impl();
    }
    dispatch_source_merge_data(*(dispatch_source_t *)(a1 + 224), 1uLL);
  }
  else if (v2)
  {
    _os_log_send_and_compose_impl();
  }
}

void WiFiCloudSyncEngineAddNetworkToKnownNetworksList(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)handler = 136315650;
    *(void *)&handler[4] = "WiFiCloudSyncEngineAddNetworkToKnownNetworksList";
    *(_WORD *)&handler[12] = 2080;
    *(void *)&handler[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&handler[22] = 1024;
    LODWORD(v25) = 1229;
    goto LABEL_36;
  }
  if (!a3)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)handler = 136315650;
    *(void *)&handler[4] = "WiFiCloudSyncEngineAddNetworkToKnownNetworksList";
    *(_WORD *)&handler[12] = 2080;
    *(void *)&handler[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&handler[22] = 1024;
    LODWORD(v25) = 1230;
    goto LABEL_36;
  }
  if (!__WiFiCloudSyncEngineIsNetworkSyncableFromCloud(a2, a3)) {
    return;
  }
  int NetworkSecurity = __WiFiCloudSyncEngineGetNetworkSecurity(a2, a3);
  BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (!NetworkSecurity)
  {
    if (!v7) {
      return;
    }
    *(_DWORD *)handler = 136315650;
    *(void *)&handler[4] = "WiFiCloudSyncEngineAddNetworkToKnownNetworksList";
    *(_WORD *)&handler[12] = 2080;
    *(void *)&handler[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&handler[22] = 1024;
    LODWORD(v25) = 1241;
    goto LABEL_36;
  }
  if (v7)
  {
    *(_DWORD *)handler = 136315650;
    *(void *)&handler[4] = "WiFiCloudSyncEngineAddNetworkToKnownNetworksList";
    *(_WORD *)&handler[12] = 2080;
    *(void *)&handler[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&handler[22] = 1024;
    LODWORD(v25) = 1238;
    LODWORD(v23) = 28;
    v22 = handler;
    _os_log_send_and_compose_impl();
  }
  CFArrayRef v8 = *(const __CFArray **)(a1 + 144);
  if (!v8)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)handler = 136315650;
    *(void *)&handler[4] = "__WiFiCloudSyncEngineAddToWaitingForPasswordList";
    *(_WORD *)&handler[12] = 2080;
    *(void *)&handler[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&handler[22] = 1024;
    LODWORD(v25) = 2740;
LABEL_36:
    _os_log_send_and_compose_impl();
    return;
  }
  CFIndex Count = CFArrayGetCount(v8);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)handler = 136315906;
    *(void *)&handler[4] = "__WiFiCloudSyncEngineAddToWaitingForPasswordList";
    *(_WORD *)&handler[12] = 2080;
    *(void *)&handler[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&handler[22] = 1024;
    LODWORD(v25) = 2743;
    WORD2(v25) = 2048;
    *(void *)((char *)&v25 + 6) = Count;
    LODWORD(v23) = 38;
    v22 = handler;
    _os_log_send_and_compose_impl();
  }
  if (objc_msgSend(a2, "isKVSEncrypted", v22, v23)) {
    long long v10 = @"SSID";
  }
  else {
    long long v10 = @"SSID_STR";
  }
  uint64_t v11 = [a3 objectForKeyedSubscript:v10];
  if (v11)
  {
    uint64_t v12 = v11;
    if (Count >= 1)
    {
      CFIndex v13 = 0;
      do
      {
        uint64_t v14 = (void *)MEMORY[0x223C64240]();
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 144), v13);
        if ([a2 isKVSEncrypted]) {
          v16 = @"SSID";
        }
        else {
          v16 = @"SSID_STR";
        }
        v17 = (void *)[ValueAtIndex objectForKeyedSubscript:v16];
        if (v17 && ![v17 compare:v12]) {
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 144), v13);
        }
        else {
          ++v13;
        }
        CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 144));
      }
      while (v13 < Count);
    }
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 144), a3);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)handler = 136315906;
      *(void *)&handler[4] = "__WiFiCloudSyncEngineAddToWaitingForPasswordList";
      *(_WORD *)&handler[12] = 2080;
      *(void *)&handler[14] = "WiFiCloudSyncEngine.m";
      *(_WORD *)&handler[22] = 1024;
      LODWORD(v25) = 2769;
      WORD2(v25) = 2112;
      *(void *)((char *)&v25 + 6) = v12;
      _os_log_send_and_compose_impl();
    }
    if (Count) {
      goto LABEL_41;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)handler = 136315650;
      *(void *)&handler[4] = "__WiFiCloudSyncEngineAddToWaitingForPasswordList";
      *(_WORD *)&handler[12] = 2080;
      *(void *)&handler[14] = "WiFiCloudSyncEngine.m";
      *(_WORD *)&handler[22] = 1024;
      LODWORD(v25) = 2773;
      _os_log_send_and_compose_impl();
    }
    v18 = *(__CFRunLoop **)(a1 + 16);
    if (v18 && (CFStringRef v19 = *(const __CFString **)(a1 + 24)) != 0)
    {
      v20 = *(__CFRunLoopSource **)(a1 + 208);
      if (!v20)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_41;
        }
        *(_DWORD *)handler = 136315650;
        *(void *)&handler[4] = "__WiFiCloudSyncEngineStartKeychainChangedNotifications";
        *(_WORD *)&handler[12] = 2080;
        *(void *)&handler[14] = "WiFiCloudSyncEngine.m";
        *(_WORD *)&handler[22] = 1024;
        LODWORD(v25) = 1047;
        goto LABEL_40;
      }
      CFRunLoopAddSource(v18, v20, v19);
      v21 = *(NSObject **)(a1 + 32);
      if (!v21)
      {
LABEL_39:
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
LABEL_41:
          __WiFiCloudSyncEngineCheckWaitingForPasswordList(a1, a2);
          return;
        }
LABEL_40:
        _os_log_send_and_compose_impl();
        goto LABEL_41;
      }
    }
    else
    {
      v21 = *(NSObject **)(a1 + 32);
      if (!v21)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_41;
        }
        *(_DWORD *)handler = 136315650;
        *(void *)&handler[4] = "__WiFiCloudSyncEngineStartKeychainChangedNotifications";
        *(_WORD *)&handler[12] = 2080;
        *(void *)&handler[14] = "WiFiCloudSyncEngine.m";
        *(_WORD *)&handler[22] = 1024;
        LODWORD(v25) = 1043;
        goto LABEL_40;
      }
    }
    *(void *)handler = MEMORY[0x263EF8330];
    *(void *)&handler[8] = 3221225472;
    *(void *)&handler[16] = ____WiFiCloudSyncEngineStartKeychainChangedNotifications_block_invoke;
    *(void *)&long long v25 = &__block_descriptor_40_e8_v12__0i8l;
    *((void *)&v25 + 1) = a1;
    notify_register_dispatch((const char *)kKeychainChangedNotificationName, (int *)(a1 + 192), v21, handler);
    goto LABEL_39;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)handler = 136315650;
    *(void *)&handler[4] = "__WiFiCloudSyncEngineAddToWaitingForPasswordList";
    *(_WORD *)&handler[12] = 2080;
    *(void *)&handler[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&handler[22] = 1024;
    LODWORD(v25) = 2746;
    goto LABEL_36;
  }
}

uint64_t __WiFiCloudSyncEngineIsNetworkSyncableFromCloud(void *a1, void *a2)
{
  if ([a1 isKVSEncrypted])
  {
    if (a2)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v4 = (void *)[a2 objectForKey:@"minVersion"];
        if (!v4 || (uint64_t v5 = v4, [v4 integerValue] < 3))
        {
          return __WiFiCloudSyncEngineIsNetworkSyncableToCloudEncrypted(a1, a2);
        }
        BOOL v24 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
        uint64_t result = 0;
        if (!v24) {
          return result;
        }
        goto LABEL_50;
      }
      BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      uint64_t result = 0;
      if (!v20) {
        return result;
      }
    }
    else
    {
      BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      uint64_t result = 0;
      if (!v18) {
        return result;
      }
    }
LABEL_68:
    _os_log_send_and_compose_impl();
    return 0;
  }
  if (!a2)
  {
    BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v19) {
      return result;
    }
    goto LABEL_68;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v21 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v21) {
      return result;
    }
    goto LABEL_68;
  }
  BOOL v7 = (void *)[a2 objectForKey:@"minVersion"];
  if (v7)
  {
    uint64_t v5 = v7;
    if ([v7 integerValue] >= 3)
    {
      BOOL v25 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      uint64_t result = 0;
      if (!v25) {
        return result;
      }
LABEL_50:
      [v5 integerValue];
      goto LABEL_68;
    }
  }
  CFArrayRef v8 = (void *)[a2 objectForKey:@"NOT_SYNCABLE"];
  if (v8 && [v8 BOOLValue])
  {
    BOOL v26 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v26) {
      return result;
    }
    goto LABEL_68;
  }
  long long v9 = (void *)[a2 objectForKey:@"IS_NETWORK_EAP"];
  if (v9 && [v9 BOOLValue])
  {
    BOOL v27 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v27) {
      return result;
    }
    goto LABEL_68;
  }
  long long v10 = (void *)[a2 objectForKey:@"IS_NETWORK_CUSTOMIZED"];
  if (v10 && [v10 BOOLValue])
  {
    BOOL v28 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v28) {
      return result;
    }
    goto LABEL_68;
  }
  uint64_t v11 = (void *)[a2 objectForKey:@"IS_NETWORK_CONFIGURED"];
  if (v11 && [v11 BOOLValue])
  {
    BOOL v29 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v29) {
      return result;
    }
    goto LABEL_68;
  }
  uint64_t v12 = (void *)[a2 objectForKey:@"AP_MODE"];
  if (v12 && [v12 intValue] != 2)
  {
    BOOL v30 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v30) {
      return result;
    }
    goto LABEL_68;
  }
  CFIndex v13 = (void *)[a2 objectForKey:@"IS_NETWORK_EXPIRABLE"];
  if (v13 && [v13 BOOLValue])
  {
    BOOL v31 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v31) {
      return result;
    }
    goto LABEL_68;
  }
  uint64_t v14 = (void *)[a2 objectForKey:@"enabled"];
  if (v14 && ([v14 BOOLValue] & 1) == 0)
  {
    BOOL v32 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v32) {
      return result;
    }
    goto LABEL_68;
  }
  uint64_t v15 = (void *)[a2 objectForKey:@"IS_NETWORK_CARPLAY_ONLY"];
  if (v15 && [v15 BOOLValue])
  {
    BOOL v33 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v33) {
      return result;
    }
    goto LABEL_68;
  }
  if (__WiFiCloudSyncEngineIsNetworkHidden(a1, a2))
  {
    BOOL v22 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v22) {
      return result;
    }
    goto LABEL_68;
  }
  if (!__WiFiCloudSyncEngineGetNetworkSecurity(a1, a2))
  {
    BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v23) {
      return result;
    }
    goto LABEL_68;
  }
  v16 = (void *)[a2 objectForKey:@"IS_NETWORK_CAPTIVE"];
  if (v16 && ![v16 BOOLValue]) {
    return 1;
  }
  BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v17) {
    goto LABEL_68;
  }
  return result;
}

uint64_t __WiFiCloudSyncEngineGetNetworkSecurity(void *a1, void *a2)
{
  if (!a2)
  {
    BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v10) {
      return result;
    }
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v11) {
      return result;
    }
LABEL_22:
    _os_log_send_and_compose_impl();
    return 0;
  }
  if (![a1 isKVSEncrypted])
  {
    long long v9 = (void *)[a2 objectForKey:@"WEP"];
    if (!v9 || ([v9 BOOLValue] & 1) == 0)
    {
      if (![a2 objectForKey:@"WPA3_RSN_IE"])
      {
        if (![a2 objectForKey:@"RSN_IE"]) {
          return 2 * ([a2 objectForKey:@"WPA_IE"] != 0);
        }
        return 3;
      }
      return 4;
    }
    return 1;
  }
  uint64_t v4 = (void *)[a2 objectForKey:@"isWEP"];
  if (v4 && ([v4 BOOLValue] & 1) != 0) {
    return 1;
  }
  uint64_t v5 = (void *)[a2 objectForKey:@"isWPA3"];
  if (v5 && ([v5 BOOLValue] & 1) != 0) {
    return 4;
  }
  int v6 = (void *)[a2 objectForKey:@"isWPA2"];
  if (v6 && ([v6 BOOLValue] & 1) != 0) {
    return 3;
  }
  BOOL v7 = (void *)[a2 objectForKey:@"isWPA"];
  if (!v7 || ([v7 BOOLValue] & 1) == 0) {
    return 0;
  }
  return 2;
}

void WiFiCloudSyncEngineRemoveNetworkFromKnownNetworksList(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (!a1 || !a3)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v23 = 136315650;
    BOOL v24 = "WiFiCloudSyncEngineRemoveNetworkFromKnownNetworksList";
    __int16 v25 = 2080;
    BOOL v26 = "WiFiCloudSyncEngine.m";
    __int16 v27 = 1024;
    int v28 = 1256;
    goto LABEL_41;
  }
  if (!*(void *)(a1 + 104))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v23 = 136315650;
    BOOL v24 = "WiFiCloudSyncEngineRemoveNetworkFromKnownNetworksList";
    __int16 v25 = 2080;
    BOOL v26 = "WiFiCloudSyncEngine.m";
    __int16 v27 = 1024;
    int v28 = 1258;
    goto LABEL_41;
  }
  if (!*(void *)(a1 + 80))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v23 = 136315650;
    BOOL v24 = "WiFiCloudSyncEngineRemoveNetworkFromKnownNetworksList";
    __int16 v25 = 2080;
    BOOL v26 = "WiFiCloudSyncEngine.m";
    __int16 v27 = 1024;
    int v28 = 1259;
LABEL_41:
    _os_log_send_and_compose_impl();
    return;
  }
  if (![a2 isKVSEncrypted]
    || __WiFiCloudSyncEngineIsNetworkSyncableFromCloud(a2, a3))
  {
    uint64_t NetworkFromCloudFormatCallback = __WiFiCloudSyncEngineCreateNetworkFromCloudFormatCallback(a1, a2, a3);
    if (NetworkFromCloudFormatCallback)
    {
      BOOL v7 = (const void *)NetworkFromCloudFormatCallback;
      (*(void (**)(uint64_t, void))(a1 + 80))(NetworkFromCloudFormatCallback, *(void *)(a1 + 136));
      CFArrayRef v8 = *(const __CFArray **)(a1 + 144);
      if (v8)
      {
        CFIndex Count = CFArrayGetCount(v8);
        BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
        if (Count)
        {
          if (v10)
          {
            int v23 = 136315906;
            BOOL v24 = "__WiFiCloudSyncEngineRemoveFromWaitingForPasswordList";
            __int16 v25 = 2080;
            BOOL v26 = "WiFiCloudSyncEngine.m";
            __int16 v27 = 1024;
            int v28 = 2820;
            __int16 v29 = 2048;
            CFIndex v30 = Count;
            LODWORD(v21) = 38;
            BOOL v19 = &v23;
            _os_log_send_and_compose_impl();
          }
          if (objc_msgSend(a2, "isKVSEncrypted", v19, v21)) {
            BOOL v11 = @"SSID";
          }
          else {
            BOOL v11 = @"SSID_STR";
          }
          uint64_t v12 = [a3 objectForKeyedSubscript:v11];
          if (Count >= 1)
          {
            uint64_t v13 = v12;
            CFIndex v14 = 0;
            uint64_t v15 = &_os_log_internal;
            do
            {
              ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 144), v14);
              if ([a2 isKVSEncrypted]) {
                BOOL v17 = @"SSID";
              }
              else {
                BOOL v17 = @"SSID_STR";
              }
              BOOL v18 = objc_msgSend(ValueAtIndex, "objectForKeyedSubscript:", v17, v20, v22);
              if (v18 && ![v18 compare:v13])
              {
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  int v23 = 136315906;
                  BOOL v24 = "__WiFiCloudSyncEngineRemoveFromWaitingForPasswordList";
                  __int16 v25 = 2080;
                  BOOL v26 = "WiFiCloudSyncEngine.m";
                  __int16 v27 = 1024;
                  int v28 = 2831;
                  __int16 v29 = 2112;
                  CFIndex v30 = v13;
                  LODWORD(v22) = 38;
                  BOOL v20 = &v23;
                  _os_log_send_and_compose_impl();
                }
                CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 144), v14);
              }
              else
              {
                ++v14;
              }
            }
            while (v14 < CFArrayGetCount(*(CFArrayRef *)(a1 + 144)));
          }
          if (!CFArrayGetCount(*(CFArrayRef *)(a1 + 144)))
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              int v23 = 136315650;
              BOOL v24 = "__WiFiCloudSyncEngineRemoveFromWaitingForPasswordList";
              __int16 v25 = 2080;
              BOOL v26 = "WiFiCloudSyncEngine.m";
              __int16 v27 = 1024;
              int v28 = 2842;
              _os_log_send_and_compose_impl();
            }
            __WiFiCloudSyncEngineStopKeychainChangedNotifications(a1);
          }
          goto LABEL_31;
        }
        if (v10)
        {
          int v23 = 136315650;
          BOOL v24 = "__WiFiCloudSyncEngineRemoveFromWaitingForPasswordList";
          __int16 v25 = 2080;
          BOOL v26 = "WiFiCloudSyncEngine.m";
          __int16 v27 = 1024;
          int v28 = 2818;
          goto LABEL_46;
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315650;
        BOOL v24 = "__WiFiCloudSyncEngineRemoveFromWaitingForPasswordList";
        __int16 v25 = 2080;
        BOOL v26 = "WiFiCloudSyncEngine.m";
        __int16 v27 = 1024;
        int v28 = 2815;
LABEL_46:
        _os_log_send_and_compose_impl();
      }
LABEL_31:
      CFRelease(v7);
      return;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315650;
      BOOL v24 = "WiFiCloudSyncEngineRemoveNetworkFromKnownNetworksList";
      __int16 v25 = 2080;
      BOOL v26 = "WiFiCloudSyncEngine.m";
      __int16 v27 = 1024;
      int v28 = 1269;
      goto LABEL_41;
    }
  }
}

uint64_t __WiFiCloudSyncEngineCreateNetworkFromCloudFormatCallback(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 104))
  {
    int v6 = (void *)MEMORY[0x223C64240]();
    if (![a2 isKVSEncrypted])
    {
      uint64_t v15 = (*(uint64_t (**)(void *, void))(a1 + 104))(a3, *(void *)(a1 + 136));
      goto LABEL_41;
    }
    BOOL v7 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"SSID"), @"SSID_STR");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"BSSID"), @"BSSID");
    int v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"isPSK"), "BOOLValue");
    int v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"isEAP"), "BOOLValue");
    int v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"isWEP"), "BOOLValue");
    int v11 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"isWPA"), "BOOLValue");
    int v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"isWPA2"), "BOOLValue");
    int v13 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"isWPA3"), "BOOLValue");
    if (v9)
    {
      CFIndex v14 = (void *)MEMORY[0x263EFFA88];
      [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"IS_NETWORK_EAP"];
      if ((v12 & v13) == 1)
      {
        v45 = @"IE_KEY_RSN_VERSION";
        v46 = @"IE_KEY_RSN_MCIPHER";
        *(void *)v50 = &unk_26D1D96F0;
        *(void *)&v50[8] = &unk_26D1D9708;
        v47 = @"IE_KEY_RSN_UCIPHERS";
        v48 = @"IE_KEY_RSN_AUTHSELS";
        *(void *)&v50[16] = &unk_26D1D97C8;
        v51 = &unk_26D1D97E0;
        v49 = @"IE_KEY_RSN_CAPS";
        v37 = @"MFP_CAPABLE";
        v38 = @"MFP_REQUIRED";
        v41 = v14;
        v42 = v14;
        uint64_t v52 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v37 count:2];
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, &v45, 5), @"RSN_IE");
LABEL_22:
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"isHidden"), @"UserDirected");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"isCaptive"), @"IS_NETWORK_CAPTIVE");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"isWhitelistedCaptive"), @"IS_NETWORK_WHITELISTING_CAPTIVE");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"isExpirable"), @"IS_NETWORK_EXPIRABLE");
        int v23 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"isCustom"), "BOOLValue");
        uint64_t v24 = MEMORY[0x263EFFA80];
        uint64_t v25 = MEMORY[0x263EFFA88];
        if (v23) {
          uint64_t v26 = MEMORY[0x263EFFA88];
        }
        else {
          uint64_t v26 = MEMORY[0x263EFFA80];
        }
        [v7 setObject:v26 forKeyedSubscript:@"IS_NETWORK_CUSTOMIZED"];
        if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"isProfileBased"), "BOOLValue"))uint64_t v27 = v25; {
        else
        }
          uint64_t v27 = v24;
        [v7 setObject:v27 forKeyedSubscript:@"IS_NETWORK_CONFIGURED"];
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"isAppBased"), @"IS_NETWORK_APPBASED");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"isCarPlayOnly"), @"IS_NETWORK_CARPLAY_ONLY");
        if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"isIBSS"), "BOOLValue")) {
          int v28 = &unk_26D1D96F0;
        }
        else {
          int v28 = &unk_26D1D9768;
        }
        [v7 setObject:v28 forKeyedSubscript:@"AP_MODE"];
        if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"isAutoJoinDisabled"), "BOOLValue"))uint64_t v29 = v24; {
        else
        }
          uint64_t v29 = v25;
        [v7 setObject:v29 forKeyedSubscript:@"enabled"];
        CFIndex v30 = (void *)[a3 objectForKeyedSubscript:@"lowDataMode"];
        if (v30)
        {
          if ([v30 BOOLValue]) {
            uint64_t v31 = &unk_26D1D96F0;
          }
          else {
            uint64_t v31 = &unk_26D1D9768;
          }
        }
        else
        {
          uint64_t v31 = &unk_26D1D9798;
        }
        [v7 setObject:v31 forKeyedSubscript:@"LOW_DATA_MODE"];
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"AddedAt"), @"addedAt");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"lastJoinedByUserAt"), @"UserJoinedAt");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"lastJoinedBySystemAtWeek"), @"lastJoinedBySystemAtWeek");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"preferredOrderTimestamp"), @"UserPreferredTimestamp");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"minVersion"), @"minVersion");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"NOT_SYNCABLE"), @"NOT_SYNCABLE");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"isPrivacyProxyEnabled"), @"IS_PRIVACY_PROXY_ENABLED");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"isMoving"), @"IS_MOVING");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"isPublic"), @"IS_PUBLIC");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"was6GHzOnlyAtWeek"), @"was6GHzOnlyAtWeek");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"seamlessSSIDList"), @"seamlessSSIDList");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"privateMacPref"), @"privateMacPref");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"prvateMacPrefTimestamp"), @"prvateMacPrefTimestamp");
        id v32 = (id)[v7 copy];
        if (!v32)
        {
          uint64_t v33 = 0;
          goto LABEL_42;
        }
        uint64_t v15 = (*(uint64_t (**)(id, void))(a1 + 104))(v32, *(void *)(a1 + 136));
LABEL_41:
        uint64_t v33 = v15;
LABEL_42:
        return v33;
      }
      if (v13)
      {
        v45 = @"IE_KEY_RSN_VERSION";
        v46 = @"IE_KEY_RSN_MCIPHER";
        *(void *)v50 = &unk_26D1D96F0;
        *(void *)&v50[8] = &unk_26D1D9708;
        v47 = @"IE_KEY_RSN_UCIPHERS";
        v48 = @"IE_KEY_RSN_AUTHSELS";
        *(void *)&v50[16] = &unk_26D1D97F8;
        v51 = &unk_26D1D9810;
        v49 = @"IE_KEY_RSN_CAPS";
        v37 = @"MFP_CAPABLE";
        v38 = @"MFP_REQUIRED";
        v41 = v14;
        v42 = v14;
        uint64_t v52 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v37 count:2];
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, &v45, 5), @"WPA3_RSN_IE");
        goto LABEL_22;
      }
      if ((v11 & v12) == 1)
      {
        v45 = @"IE_KEY_WPA_VERSION";
        v46 = @"IE_KEY_WPA_MCIPHER";
        *(void *)v50 = &unk_26D1D96F0;
        *(void *)&v50[8] = &unk_26D1D9768;
        v47 = @"IE_KEY_WPA_UCIPHERS";
        v48 = @"IE_KEY_WPA_AUTHSELS";
        *(void *)&v50[16] = &unk_26D1D9828;
        v51 = &unk_26D1D9840;
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, &v45, 4), @"WPA_IE");
        v37 = @"IE_KEY_RSN_VERSION";
        v38 = @"IE_KEY_RSN_MCIPHER";
        v41 = &unk_26D1D96F0;
        v42 = &unk_26D1D9768;
        v39 = @"IE_KEY_RSN_UCIPHERS";
        v40 = @"IE_KEY_RSN_AUTHSELS";
        v43 = &unk_26D1D9858;
        v44 = &unk_26D1D9870;
LABEL_19:
        BOOL v18 = NSDictionary;
        BOOL v19 = &v41;
        BOOL v20 = &v37;
        goto LABEL_20;
      }
      if (v12)
      {
        v45 = @"IE_KEY_RSN_VERSION";
        v46 = @"IE_KEY_RSN_MCIPHER";
        *(void *)v50 = &unk_26D1D96F0;
        *(void *)&v50[8] = &unk_26D1D9708;
        v16 = &unk_26D1D9888;
        v47 = @"IE_KEY_RSN_UCIPHERS";
        v48 = @"IE_KEY_RSN_AUTHSELS";
        BOOL v17 = &unk_26D1D98A0;
        goto LABEL_10;
      }
      if (v11)
      {
        v45 = @"IE_KEY_WPA_VERSION";
        v46 = @"IE_KEY_WPA_MCIPHER";
        *(void *)v50 = &unk_26D1D96F0;
        *(void *)&v50[8] = &unk_26D1D9768;
        v35 = &unk_26D1D98B8;
        v47 = @"IE_KEY_WPA_UCIPHERS";
        v48 = @"IE_KEY_WPA_AUTHSELS";
        v36 = &unk_26D1D98D0;
LABEL_53:
        *(void *)&v50[16] = v35;
        v51 = v36;
        uint64_t v21 = [NSDictionary dictionaryWithObjects:v50 forKeys:&v45 count:4];
        uint64_t v22 = @"WPA_IE";
        goto LABEL_21;
      }
    }
    else
    {
      [v7 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"IS_NETWORK_EAP"];
      if (!v8) {
        goto LABEL_22;
      }
      if ((v12 & v13) == 1)
      {
        v45 = @"IE_KEY_RSN_VERSION";
        v46 = @"IE_KEY_RSN_MCIPHER";
        *(void *)v50 = &unk_26D1D96F0;
        *(void *)&v50[8] = &unk_26D1D9708;
        v16 = &unk_26D1D98E8;
        v47 = @"IE_KEY_RSN_UCIPHERS";
        v48 = @"IE_KEY_RSN_AUTHSELS";
        BOOL v17 = &unk_26D1D9900;
LABEL_10:
        *(void *)&v50[16] = v16;
        v51 = v17;
        BOOL v18 = NSDictionary;
        BOOL v19 = (void **)v50;
        BOOL v20 = &v45;
LABEL_20:
        uint64_t v21 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:4];
        uint64_t v22 = @"RSN_IE";
        goto LABEL_21;
      }
      if (v13)
      {
        v45 = @"IE_KEY_RSN_VERSION";
        v46 = @"IE_KEY_RSN_MCIPHER";
        *(void *)v50 = &unk_26D1D96F0;
        *(void *)&v50[8] = &unk_26D1D9708;
        v47 = @"IE_KEY_RSN_UCIPHERS";
        v48 = @"IE_KEY_RSN_AUTHSELS";
        *(void *)&v50[16] = &unk_26D1D9918;
        v51 = &unk_26D1D9930;
        uint64_t v21 = [NSDictionary dictionaryWithObjects:v50 forKeys:&v45 count:4];
        uint64_t v22 = @"WPA3_RSN_IE";
LABEL_21:
        [v7 setObject:v21 forKeyedSubscript:v22];
        goto LABEL_22;
      }
      if ((v11 & v12) == 1)
      {
        v45 = @"IE_KEY_WPA_VERSION";
        v46 = @"IE_KEY_WPA_MCIPHER";
        *(void *)v50 = &unk_26D1D96F0;
        *(void *)&v50[8] = &unk_26D1D9768;
        v47 = @"IE_KEY_WPA_UCIPHERS";
        v48 = @"IE_KEY_WPA_AUTHSELS";
        *(void *)&v50[16] = &unk_26D1D9948;
        v51 = &unk_26D1D9960;
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, &v45, 4), @"WPA_IE");
        v37 = @"IE_KEY_RSN_VERSION";
        v38 = @"IE_KEY_RSN_MCIPHER";
        v41 = &unk_26D1D96F0;
        v42 = &unk_26D1D9708;
        v39 = @"IE_KEY_RSN_UCIPHERS";
        v40 = @"IE_KEY_RSN_AUTHSELS";
        v43 = &unk_26D1D9978;
        v44 = &unk_26D1D9990;
        goto LABEL_19;
      }
      if (v12)
      {
        v45 = @"IE_KEY_RSN_VERSION";
        v46 = @"IE_KEY_RSN_MCIPHER";
        *(void *)v50 = &unk_26D1D96F0;
        *(void *)&v50[8] = &unk_26D1D9708;
        v16 = &unk_26D1D99A8;
        v47 = @"IE_KEY_RSN_UCIPHERS";
        v48 = @"IE_KEY_RSN_AUTHSELS";
        BOOL v17 = &unk_26D1D99C0;
        goto LABEL_10;
      }
      if (v11)
      {
        v45 = @"IE_KEY_WPA_VERSION";
        v46 = @"IE_KEY_WPA_MCIPHER";
        *(void *)v50 = &unk_26D1D96F0;
        *(void *)&v50[8] = &unk_26D1D9768;
        v35 = &unk_26D1D99D8;
        v47 = @"IE_KEY_WPA_UCIPHERS";
        v48 = @"IE_KEY_WPA_AUTHSELS";
        v36 = &unk_26D1D99F0;
        goto LABEL_53;
      }
    }
    if (!v10) {
      goto LABEL_22;
    }
    uint64_t v21 = MEMORY[0x263EFFA88];
    uint64_t v22 = @"WEP";
    goto LABEL_21;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v50 = 136315650;
    *(void *)&v50[4] = "__WiFiCloudSyncEngineCreateNetworkFromCloudFormatCallback";
    *(_WORD *)&v50[12] = 2080;
    *(void *)&v50[14] = "WiFiCloudSyncEngine.m";
    *(_WORD *)&v50[22] = 1024;
    LODWORD(v51) = 484;
    _os_log_send_and_compose_impl();
  }
  return 0;
}

void WiFiCloudSyncEngineStartEngine(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v2 = *(unsigned __int8 *)(a1 + 56);
    BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (v3)
      {
        int v8 = 136315650;
        int v9 = "WiFiCloudSyncEngineStartEngine";
        __int16 v10 = 2080;
        int v11 = "WiFiCloudSyncEngine.m";
        __int16 v12 = 1024;
        int v13 = 1300;
LABEL_5:
        _os_log_send_and_compose_impl();
      }
    }
    else
    {
      if (v3)
      {
        int v8 = 136315650;
        int v9 = "WiFiCloudSyncEngineStartEngine";
        __int16 v10 = 2080;
        int v11 = "WiFiCloudSyncEngine.m";
        __int16 v12 = 1024;
        int v13 = 1303;
        LODWORD(v6) = 28;
        uint64_t v5 = &v8;
        _os_log_send_and_compose_impl();
      }
      objc_msgSend(*(id *)(a1 + 40), "enableIcloudSyncing:ForBundleId:", 1, *(void *)(a1 + 160), v5, v6);
      [*(id *)(a1 + 48) enableIcloudSyncing:1 ForBundleId:*(void *)(a1 + 160)];
      *(unsigned char *)(a1 + 56) = 1;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        int v9 = "WiFiCloudSyncEngineStartEngine";
        __int16 v10 = 2080;
        int v11 = "WiFiCloudSyncEngine.m";
        __int16 v12 = 1024;
        int v13 = 1311;
        _os_log_send_and_compose_impl();
      }
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __WiFiCloudSyncEngineStartEngine_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      dispatch_async(global_queue, block);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    int v9 = "WiFiCloudSyncEngineStartEngine";
    __int16 v10 = 2080;
    int v11 = "WiFiCloudSyncEngine.m";
    __int16 v12 = 1024;
    int v13 = 1297;
    goto LABEL_5;
  }
}

uint64_t __WiFiCloudSyncEngineStartEngine_block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  if (v2[2] && v2[3])
  {
    BOOL v3 = dispatch_semaphore_create(0);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(__CFRunLoop **)(v4 + 16);
    uint64_t v6 = *(const void **)(v4 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __WiFiCloudSyncEngineStartEngine_block_invoke_2;
    block[3] = &unk_26454D1C8;
    block[4] = v3;
    void block[5] = v4;
    CFRunLoopPerformBlock(v5, v6, block);
    CFRunLoopWakeUp(*(CFRunLoopRef *)(*(void *)(a1 + 32) + 16));
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v3);
    int v2 = *(void **)(a1 + 32);
  }
  BOOL v7 = v2[4];
  if (v7)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __WiFiCloudSyncEngineStartEngine_block_invoke_3;
    v12[3] = &__block_descriptor_40_e5_v8__0l;
    v12[4] = v2;
    dispatch_sync(v7, v12);
  }
  int v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "persistentDomainForName:", @"com.apple.wifi.network-sync"), "objectForKeyedSubscript:", @"resetKVS"), "BOOLValue");
  uint64_t v9 = *(void *)(a1 + 32);
  if (v8)
  {
    [*(id *)(v9 + 40) clearKVS];
    return [*(id *)(*(void *)(a1 + 32) + 48) clearKVS];
  }
  else
  {
    int v11 = *(void **)(v9 + 48);
    [v11 pruneKVSStore];
    return [v11 synchronizeAndCallMergeNetworks];
  }
}

intptr_t __WiFiCloudSyncEngineStartEngine_block_invoke_2(uint64_t a1)
{
  __WiFiCloudSyncEngineMigrateToEncryptedKVS(*(void *)(a1 + 40));
  int v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

uint64_t __WiFiCloudSyncEngineMigrateToEncryptedKVS(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  int v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "keyValueStore"), "dictionaryRepresentation");
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "keyValueStore"), "objectForKey:", @"enable_network_sync");
  uint64_t v29 = a1;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 136315650;
      v37 = "__WiFiCloudSyncEngineMigrateToEncryptedKVS";
      __int16 v38 = 2080;
      v39 = "WiFiCloudSyncEngine.m";
      __int16 v40 = 1024;
      int v41 = 528;
      LODWORD(v27) = 28;
      uint64_t v25 = &v36;
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "keyValueStore"), "setObject:forKey:", &unk_26D1D97B0, @"version");
    uint64_t v4 = (void *)[*(id *)(a1 + 48) keyValueStore];
    [v4 setObject:MEMORY[0x263EFFA88] forKey:@"enable_network_sync"];
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v5 = objc_msgSend(v2, "allKeys", v25, v27);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = @"WiFiCloudSyncEngineNonSSIDKeyPrefix_";
    uint64_t v31 = *(void *)v33;
    do
    {
      uint64_t v10 = 0;
      uint64_t v30 = v8;
      do
      {
        if (*(void *)v33 != v31) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
        __int16 v12 = (void *)MEMORY[0x223C64240](v6, v7);
        unint64_t v13 = [v11 length];
        unint64_t v14 = [(__CFString *)v9 length];
        if (!v3 && v13 < v14)
        {
          uint64_t v15 = (void *)[v2 objectForKeyedSubscript:v11];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v16 = (id)[__WiFiCloudSyncEngineTranslateFromLegacyFormat(v15) mutableCopy];
            if (!v16)
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_21;
              }
              int v36 = 136315906;
              v37 = "__WiFiCloudSyncEngineMigrateToEncryptedKVS";
              __int16 v38 = 2080;
              v39 = "WiFiCloudSyncEngine.m";
              __int16 v40 = 1024;
              int v41 = 559;
              __int16 v42 = 2112;
              v43 = v15;
              LODWORD(v28) = 38;
              uint64_t v26 = &v36;
              goto LABEL_20;
            }
            BOOL v17 = v16;
            BOOL v18 = v9;
            BOOL v19 = v5;
            BOOL v20 = v2;
            __WiFiCloudSyncEngineAddVersionsToCloudNetwork(v16);
            uint64_t v21 = [v17 objectForKeyedSubscript:@"SSID"];
            if (v21)
            {
              uint64_t v22 = v21;
              int v23 = (void *)[*(id *)(v29 + 48) keyValueStore];
              [v23 setObject:v17, objc_msgSend(NSString, "stringWithFormat:", @"%@%@", @"network.", v22) forKey];
              int v2 = v20;
              uint64_t v5 = v19;
              uint64_t v9 = v18;
              uint64_t v3 = 0;
              uint64_t v8 = v30;
              goto LABEL_21;
            }
            uint64_t v5 = v19;
            uint64_t v9 = v18;
            uint64_t v3 = 0;
            uint64_t v8 = v30;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              int v36 = 136315906;
              v37 = "__WiFiCloudSyncEngineMigrateToEncryptedKVS";
              __int16 v38 = 2080;
              v39 = "WiFiCloudSyncEngine.m";
              __int16 v40 = 1024;
              int v41 = 554;
              __int16 v42 = 2112;
              v43 = v15;
              LODWORD(v28) = 38;
              uint64_t v26 = &v36;
LABEL_20:
              _os_log_send_and_compose_impl();
            }
          }
        }
LABEL_21:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v44 count:16];
      uint64_t v8 = v6;
    }
    while (v6);
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(v29 + 48), "keyValueStore", v26, v28), "synchronize");
}

uint64_t __WiFiCloudSyncEngineStartEngine_block_invoke_3(uint64_t a1)
{
  return __WiFiCloudSyncEngineMigrateToEncryptedKVS(*(void *)(a1 + 32));
}

void WiFiCloudSyncEnginePruneNetworksInCloud(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a2 && ([a2 isKVSEncrypted] & 1) == 0)
  {
    uint64_t v5 = [a3 count];
    uint64_t v6 = [a3 allKeys];
    if (v5)
    {
      uint64_t v7 = (void *)v6;
      uint64_t v8 = 0;
      uint64_t v9 = &_os_log_internal;
      do
      {
        uint64_t v10 = objc_msgSend(v7, "objectAtIndex:", v8, v21, v22);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 136316162;
          uint64_t v26 = "WiFiCloudSyncEnginePruneNetworksInCloud";
          __int16 v27 = 2080;
          uint64_t v28 = "WiFiCloudSyncEngine.m";
          __int16 v29 = 1024;
          int v30 = 1429;
          __int16 v31 = 2048;
          uint64_t v32 = v8;
          __int16 v33 = 2112;
          long long v34 = v10;
          LODWORD(v22) = 48;
          uint64_t v21 = &v25;
          _os_log_send_and_compose_impl();
        }
        if (!v10) {
          goto LABEL_24;
        }
        unint64_t v11 = [v10 length];
        if (v11 >= [@"WiFiCloudSyncEngineNonSSIDKeyPrefix_" length]) {
          goto LABEL_24;
        }
        __int16 v12 = (void *)[a3 objectForKey:v10];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || __WiFiCloudSyncEngineGetNetworkSecurity(a2, v12)) {
          goto LABEL_24;
        }
        if (v12)
        {
          if (a1)
          {
            if (*(unsigned char *)(a1 + 56))
            {
              if ([a2 isKVSEncrypted]) {
                unint64_t v13 = @"SSID";
              }
              else {
                unint64_t v13 = @"SSID_STR";
              }
              uint64_t v14 = objc_msgSend(v12, "objectForKeyedSubscript:", v13, v21, v22);
              BOOL v15 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
              if (v14)
              {
                if (v15)
                {
                  int v25 = 136315906;
                  uint64_t v26 = "__WiFiCloudSyncEngineRemoveCloudFormatNetworkFromCloud";
                  __int16 v27 = 2080;
                  uint64_t v28 = "WiFiCloudSyncEngine.m";
                  __int16 v29 = 1024;
                  int v30 = 1395;
                  __int16 v31 = 2112;
                  uint64_t v32 = v14;
                  LODWORD(v22) = 38;
                  uint64_t v21 = &v25;
                  _os_log_send_and_compose_impl();
                }
                if (objc_msgSend(a2, "isKVSEncrypted", v21, v22))
                {
                  uint64_t v21 = (int *)@"network.";
                  uint64_t v22 = v14;
                  uint64_t v16 = [NSString stringWithFormat:@"%@%@"];
                  BOOL v17 = a2;
                }
                else
                {
                  BOOL v17 = a2;
                  uint64_t v16 = v14;
                }
                [v17 removeFromKVStore:v16];
                goto LABEL_24;
              }
              if (v15)
              {
                int v25 = 136315650;
                uint64_t v26 = "__WiFiCloudSyncEngineRemoveCloudFormatNetworkFromCloud";
                __int16 v27 = 2080;
                uint64_t v28 = "WiFiCloudSyncEngine.m";
                __int16 v29 = 1024;
                int v30 = 1394;
                LODWORD(v22) = 28;
                uint64_t v21 = &v25;
                goto LABEL_34;
              }
            }
            else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              int v25 = 136315650;
              uint64_t v26 = "__WiFiCloudSyncEngineRemoveCloudFormatNetworkFromCloud";
              __int16 v27 = 2080;
              uint64_t v28 = "WiFiCloudSyncEngine.m";
              __int16 v29 = 1024;
              int v30 = 1388;
              LODWORD(v22) = 28;
              uint64_t v21 = &v25;
              goto LABEL_34;
            }
          }
          else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = 136315650;
            uint64_t v26 = "__WiFiCloudSyncEngineRemoveCloudFormatNetworkFromCloud";
            __int16 v27 = 2080;
            uint64_t v28 = "WiFiCloudSyncEngine.m";
            __int16 v29 = 1024;
            int v30 = 1386;
            LODWORD(v22) = 28;
            uint64_t v21 = &v25;
            goto LABEL_34;
          }
        }
        else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 136315650;
          uint64_t v26 = "__WiFiCloudSyncEngineRemoveCloudFormatNetworkFromCloud";
          __int16 v27 = 2080;
          uint64_t v28 = "WiFiCloudSyncEngine.m";
          __int16 v29 = 1024;
          int v30 = 1384;
          LODWORD(v22) = 28;
          uint64_t v21 = &v25;
LABEL_34:
          _os_log_send_and_compose_impl();
        }
LABEL_24:
        ++v8;
      }
      while (v5 != v8);
    }
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithInteger:", 2, v21, v22);
    id v19 = (id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"WiFiCloudSyncEngineNonSSIDKeyPrefix_NonNetworkContainer"), "mutableCopy");
    if (!v19) {
      id v19 = (id)[MEMORY[0x263EFF9A0] dictionary];
    }
    [v19 setObject:v18 forKeyedSubscript:@"WiFiCloudSyncEngineNonSSIDKeyPrefix_KVSVersion"];
    [v19 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"UserDirected"];
    objc_msgSend((id)objc_msgSend(a2, "keyValueStore"), "removeObjectForKey:", @"WiFiCloudSyncEngineNonSSIDKeyPrefix_KVSVersion");
    objc_msgSend((id)objc_msgSend(a2, "keyValueStore"), "setObject:forKey:", v19, @"WiFiCloudSyncEngineNonSSIDKeyPrefix_NonNetworkContainer");
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __WiFiCloudSyncEnginePruneNetworksInCloud_block_invoke;
    block[3] = &unk_26454D158;
    block[4] = a2;
    dispatch_async(global_queue, block);
  }
}

uint64_t __WiFiCloudSyncEnginePruneNetworksInCloud_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) synchronizeKVS];
}

uint64_t WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS(void *a1, void *a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (!result) {
      return result;
    }
    int v56 = 136315650;
    v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
    __int16 v58 = 2080;
    v59 = "WiFiCloudSyncEngine.m";
    __int16 v60 = 1024;
    int v61 = 1486;
    return _os_log_send_and_compose_impl();
  }
  if (!a2)
  {
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (!result) {
      return result;
    }
    int v56 = 136315650;
    v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
    __int16 v58 = 2080;
    v59 = "WiFiCloudSyncEngine.m";
    __int16 v60 = 1024;
    int v61 = 1488;
    return _os_log_send_and_compose_impl();
  }
  if (!a1[14])
  {
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (!result) {
      return result;
    }
    int v56 = 136315650;
    v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
    __int16 v58 = 2080;
    v59 = "WiFiCloudSyncEngine.m";
    __int16 v60 = 1024;
    int v61 = 1491;
    return _os_log_send_and_compose_impl();
  }
  uint64_t v6 = (uint64_t (*)(void))a1[15];
  uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (!result) {
      return result;
    }
    int v56 = 136315650;
    v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
    __int16 v58 = 2080;
    v59 = "WiFiCloudSyncEngine.m";
    __int16 v60 = 1024;
    int v61 = 1492;
    return _os_log_send_and_compose_impl();
  }
  if (result)
  {
    int v56 = 136315906;
    v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
    __int16 v58 = 2080;
    v59 = "WiFiCloudSyncEngine.m";
    __int16 v60 = 1024;
    int v61 = 1495;
    __int16 v62 = 2112;
    uint64_t v63 = [a3 allKeys];
    LODWORD(v50) = 38;
    v48 = &v56;
    _os_log_send_and_compose_impl();
    uint64_t v6 = (uint64_t (*)(void))a1[15];
  }
  CFArrayRef v8 = (const __CFArray *)v6(a1[17]);
  v54 = a3;
  if (v8)
  {
    CFArrayRef v9 = v8;
    CFIndex Count = CFArrayGetCount(v8);
    BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (Count)
    {
      if (v11)
      {
        int v56 = 136315906;
        v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
        __int16 v58 = 2080;
        v59 = "WiFiCloudSyncEngine.m";
        __int16 v60 = 1024;
        int v61 = 1506;
        __int16 v62 = 2048;
        uint64_t v63 = Count;
        LODWORD(v50) = 38;
        v48 = &v56;
        _os_log_send_and_compose_impl();
      }
      id v12 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:Count];
      uint64_t v14 = v12;
      if (Count >= 1)
      {
        for (CFIndex i = 0; i != Count; ++i)
        {
          uint64_t v16 = (void *)MEMORY[0x223C64240](v12, v13);
          ValueAtIndex = CFArrayGetValueAtIndex(v9, i);
          if (ValueAtIndex)
          {
            id CloudFromNetworkFormatCallback = __WiFiCloudSyncEngineCreateCloudFromNetworkFormatCallback((uint64_t)a1, a2, (uint64_t)ValueAtIndex);
            if (CloudFromNetworkFormatCallback)
            {
              id v19 = CloudFromNetworkFormatCallback;
              [v14 insertObject:CloudFromNetworkFormatCallback atIndex:i];
            }
          }
        }
      }
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke;
      block[3] = &unk_26454D1F0;
      block[8] = v9;
      block[9] = a1;
      uint64_t v53 = v14;
      block[4] = v14;
      void block[5] = a2;
      a3 = v54;
      void block[6] = v54;
      block[7] = Count;
      dispatch_async(global_queue, block);
      goto LABEL_18;
    }
    if (v11)
    {
      int v56 = 136315650;
      v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
      __int16 v58 = 2080;
      v59 = "WiFiCloudSyncEngine.m";
      __int16 v60 = 1024;
      int v61 = 1504;
      LODWORD(v50) = 28;
      v48 = &v56;
      goto LABEL_69;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v56 = 136315650;
    v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
    __int16 v58 = 2080;
    v59 = "WiFiCloudSyncEngine.m";
    __int16 v60 = 1024;
    int v61 = 1501;
    LODWORD(v50) = 28;
    v48 = &v56;
LABEL_69:
    _os_log_send_and_compose_impl();
  }
  uint64_t v53 = 0;
LABEL_18:
  uint64_t v21 = objc_msgSend(a3, "count", v48, v50);
  uint64_t v22 = (void *)[a3 allKeys];
  if (v21)
  {
    for (uint64_t j = 0; v21 != j; ++j)
    {
      uint64_t v24 = (void *)MEMORY[0x223C64240]();
      int v25 = (void *)[v22 objectAtIndex:j];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v56 = 136316162;
        v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
        __int16 v58 = 2080;
        v59 = "WiFiCloudSyncEngine.m";
        __int16 v60 = 1024;
        int v61 = 1628;
        __int16 v62 = 2048;
        uint64_t v63 = j;
        __int16 v64 = 2112;
        v65 = v25;
        LODWORD(v51) = 48;
        v49 = &v56;
        _os_log_send_and_compose_impl();
      }
      if (objc_msgSend(a2, "isKVSEncrypted", v49, v51))
      {
        if ([v25 hasPrefix:@"network."])
        {
          uint64_t v26 = [a3 objectForKey:v25];
          if (v26 && (__int16 v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            uint64_t v52 = [v27 objectForKeyedSubscript:@"SSID"];
            uint64_t v28 = (void *)[v27 objectForKeyedSubscript:@"removedAt"];
            __int16 v29 = (void *)[v27 objectForKeyedSubscript:@"addedAt"];
            int v30 = __WiFiCloudSyncEngineIsCloudNetworkOnDevice(a2, v27, v53);
            if (v30)
            {
              __int16 v31 = (void *)[v30 objectForKeyedSubscript:@"addedAt"];
              [v28 timeIntervalSinceReferenceDate];
              double v33 = v32;
              [v31 timeIntervalSinceReferenceDate];
              if (v33 > v34)
              {
                a3 = v54;
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                {
                  int v56 = 136315906;
                  v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
                  __int16 v58 = 2080;
                  v59 = "WiFiCloudSyncEngine.m";
                  __int16 v60 = 1024;
                  int v61 = 1648;
                  __int16 v62 = 2112;
                  uint64_t v63 = v52;
                  LODWORD(v51) = 38;
                  v49 = &v56;
                  _os_log_send_and_compose_impl();
                }
                WiFiCloudSyncEngineRemoveNetworkFromKnownNetworksList((uint64_t)a1, a2, v27);
                goto LABEL_52;
              }
              [v31 timeIntervalSinceReferenceDate];
              double v44 = v43;
              [v29 timeIntervalSinceReferenceDate];
              double v46 = v45;
              BOOL v47 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
              if (v44 < v46)
              {
                a3 = v54;
                if (v47)
                {
                  int v56 = 136315906;
                  v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
                  __int16 v58 = 2080;
                  v59 = "WiFiCloudSyncEngine.m";
                  __int16 v60 = 1024;
                  int v61 = 1657;
                  __int16 v62 = 2112;
                  uint64_t v63 = v52;
                  LODWORD(v51) = 38;
                  v49 = &v56;
                  goto LABEL_47;
                }
                goto LABEL_48;
              }
              a3 = v54;
              if (v47)
              {
                int v56 = 136315906;
                v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
                __int16 v58 = 2080;
                v59 = "WiFiCloudSyncEngine.m";
                __int16 v60 = 1024;
                int v61 = 1653;
                __int16 v62 = 2112;
                uint64_t v63 = v52;
                LODWORD(v51) = 38;
                v49 = &v56;
                goto LABEL_51;
              }
            }
            else
            {
              [v28 timeIntervalSinceReferenceDate];
              double v39 = v38;
              [v29 timeIntervalSinceReferenceDate];
              double v41 = v40;
              BOOL v42 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
              if (v39 <= v41)
              {
                a3 = v54;
                if (v42)
                {
                  int v56 = 136315906;
                  v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
                  __int16 v58 = 2080;
                  v59 = "WiFiCloudSyncEngine.m";
                  __int16 v60 = 1024;
                  int v61 = 1670;
                  __int16 v62 = 2112;
                  uint64_t v63 = v52;
                  LODWORD(v51) = 38;
                  v49 = &v56;
LABEL_47:
                  _os_log_send_and_compose_impl();
                }
LABEL_48:
                WiFiCloudSyncEngineAddNetworkToKnownNetworksList((uint64_t)a1, a2, v27);
                goto LABEL_52;
              }
              a3 = v54;
              if (v42)
              {
                int v56 = 136315906;
                v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
                __int16 v58 = 2080;
                v59 = "WiFiCloudSyncEngine.m";
                __int16 v60 = 1024;
                int v61 = 1666;
                __int16 v62 = 2112;
                uint64_t v63 = v52;
                LODWORD(v51) = 38;
                v49 = &v56;
                goto LABEL_51;
              }
            }
          }
          else
          {
            [a2 removeFromKVStore:v25];
          }
        }
      }
      else
      {
        if (!v25) {
          goto LABEL_52;
        }
        unint64_t v35 = [v25 length];
        BOOL v36 = v35 >= [@"WiFiCloudSyncEngineNonSSIDKeyPrefix_" length];
        a3 = v54;
        if (v36) {
          goto LABEL_52;
        }
        uint64_t v37 = [v54 objectForKey:v25];
        if (!v37) {
          goto LABEL_52;
        }
        __int16 v27 = (void *)v37;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_52;
        }
        if (!__WiFiCloudSyncEngineIsCloudNetworkOnDevice(a2, v27, v53)) {
          goto LABEL_48;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v56 = 136315906;
          v57 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS";
          __int16 v58 = 2080;
          v59 = "WiFiCloudSyncEngine.m";
          __int16 v60 = 1024;
          int v61 = 1690;
          __int16 v62 = 2112;
          uint64_t v63 = (uint64_t)v25;
          LODWORD(v51) = 38;
          v49 = &v56;
LABEL_51:
          _os_log_send_and_compose_impl();
        }
      }
LABEL_52:
    }
  }
  uint64_t result = objc_msgSend(v22, "indexOfObject:", @"WiFiCloudSyncEngineNonSSIDKeyPrefix_cleaningKVS", v49, v51);
  if (result != 0x7FFFFFFFFFFFFFFFLL) {
    return [a2 removeFromKVStore:@"WiFiCloudSyncEngineNonSSIDKeyPrefix_cleaningKVS"];
  }
  return result;
}

id __WiFiCloudSyncEngineCreateCloudFromNetworkFormatCallback(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(void *)(a1 + 112))
  {
    uint64_t v6 = (void *)MEMORY[0x223C64240]();
    id v7 = (id)(*(uint64_t (**)(uint64_t, void))(a1 + 112))(a3, *(void *)(a1 + 136));
    if ([a2 isKVSEncrypted])
    {
      id v8 = __WiFiCloudSyncEngineTranslateFromLegacyFormat(v7);

      id v7 = v8;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
    return 0;
  }
  return v7;
}

void __WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (*(uint64_t *)(a1 + 56) < 1) {
    goto LABEL_40;
  }
  char v27 = 0;
  unint64_t v2 = 0;
  uint64_t v3 = @"SSID_STR";
  uint64_t v4 = &_os_log_internal;
  while (v2 < objc_msgSend(*(id *)(a1 + 32), "count", v25, v26))
  {
    uint64_t v5 = (void *)MEMORY[0x223C64240]();
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 64), v2);
    id v7 = (void *)[*(id *)(a1 + 32) objectAtIndex:v2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([*(id *)(a1 + 40) isKVSEncrypted]) {
        id v8 = @"SSID";
      }
      else {
        id v8 = v3;
      }
      uint64_t v9 = [v7 objectForKeyedSubscript:v8];
      if (!v9) {
        goto LABEL_28;
      }
      uint64_t v10 = v9;
      if ([*(id *)(a1 + 40) isKVSEncrypted])
      {
        BOOL v11 = (void *)[v7 objectForKeyedSubscript:@"addedAt"];
        uint64_t v12 = [*(id *)(a1 + 48) objectForKey:objc_msgSend(NSString, "stringWithFormat:", @"%@%@", @"network.", v10)];
        if (!v12 || (uint64_t v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            int v28 = 136315906;
            __int16 v29 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke";
            __int16 v30 = 2080;
            __int16 v31 = "WiFiCloudSyncEngine.m";
            __int16 v32 = 1024;
            int v33 = 1585;
            __int16 v34 = 2112;
            uint64_t v35 = v10;
            LODWORD(v26) = 38;
            int v25 = &v28;
            goto LABEL_26;
          }
          goto LABEL_27;
        }
        uint64_t v14 = v3;
        BOOL v15 = (void *)[v13 objectForKeyedSubscript:@"removedAt"];
        uint64_t v16 = (void *)[v13 objectForKeyedSubscript:@"addedAt"];
        [v15 timeIntervalSinceReferenceDate];
        double v18 = v17;
        [v11 timeIntervalSinceReferenceDate];
        if (v18 <= v19)
        {
          [v16 timeIntervalSinceReferenceDate];
          double v21 = v20;
          [v11 timeIntervalSinceReferenceDate];
          double v23 = v22;
          BOOL v24 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
          uint64_t v3 = v14;
          if (v21 < v23)
          {
            if (v24)
            {
              int v28 = 136315906;
              __int16 v29 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke";
              __int16 v30 = 2080;
              __int16 v31 = "WiFiCloudSyncEngine.m";
              __int16 v32 = 1024;
              int v33 = 1578;
              __int16 v34 = 2112;
              uint64_t v35 = v10;
              LODWORD(v26) = 38;
              int v25 = &v28;
              _os_log_send_and_compose_impl();
            }
            goto LABEL_27;
          }
          if (v24)
          {
            int v28 = 136315906;
            __int16 v29 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke";
            __int16 v30 = 2080;
            __int16 v31 = "WiFiCloudSyncEngine.m";
            __int16 v32 = 1024;
            int v33 = 1574;
            __int16 v34 = 2112;
            uint64_t v35 = v10;
            LODWORD(v26) = 38;
            int v25 = &v28;
            goto LABEL_36;
          }
        }
        else
        {
          uint64_t v3 = v14;
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            int v28 = 136315906;
            __int16 v29 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke";
            __int16 v30 = 2080;
            __int16 v31 = "WiFiCloudSyncEngine.m";
            __int16 v32 = 1024;
            int v33 = 1570;
            __int16 v34 = 2112;
            uint64_t v35 = v10;
            LODWORD(v26) = 38;
            int v25 = &v28;
LABEL_36:
            _os_log_send_and_compose_impl();
          }
        }
      }
      else
      {
        if (![*(id *)(a1 + 48) objectForKey:v10]
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            int v28 = 136315906;
            __int16 v29 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke";
            __int16 v30 = 2080;
            __int16 v31 = "WiFiCloudSyncEngine.m";
            __int16 v32 = 1024;
            int v33 = 1599;
            __int16 v34 = 2112;
            uint64_t v35 = v10;
            LODWORD(v26) = 38;
            int v25 = &v28;
LABEL_26:
            _os_log_send_and_compose_impl();
          }
LABEL_27:
          __WiFiCloudSyncEngineAddNetworkToCloudAndPurge(*(void *)(a1 + 72), *(void **)(a1 + 40), ValueAtIndex, 0);
          char v27 = 1;
          goto LABEL_28;
        }
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 136315906;
          __int16 v29 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke";
          __int16 v30 = 2080;
          __int16 v31 = "WiFiCloudSyncEngine.m";
          __int16 v32 = 1024;
          int v33 = 1595;
          __int16 v34 = 2112;
          uint64_t v35 = v10;
          LODWORD(v26) = 38;
          int v25 = &v28;
          goto LABEL_17;
        }
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 136315650;
      __int16 v29 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke";
      __int16 v30 = 2080;
      __int16 v31 = "WiFiCloudSyncEngine.m";
      __int16 v32 = 1024;
      int v33 = 1548;
      LODWORD(v26) = 28;
      int v25 = &v28;
LABEL_17:
      _os_log_send_and_compose_impl();
    }
LABEL_28:
    if ((int64_t)++v2 >= *(void *)(a1 + 56)) {
      break;
    }
  }
  if (v27) {
    [*(id *)(a1 + 40) synchronizeKVS];
  }
LABEL_40:
  CFRelease(*(CFTypeRef *)(a1 + 64));
}

void __WiFiCloudSyncEngineAddNetworkToCloudAndPurge(uint64_t a1, void *a2, CFTypeRef cf, int a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (!cf)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136315650;
      __int16 v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
      __int16 v35 = 2080;
      uint64_t v36 = "WiFiCloudSyncEngine.m";
      __int16 v37 = 1024;
      int v38 = 1997;
      _os_log_send_and_compose_impl();
    }
    BOOL v24 = 0;
    CFTypeRef v8 = 0;
    goto LABEL_77;
  }
  CFTypeRef v8 = CFRetain(cf);
  if (!a1)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_76;
    }
    int v33 = 136315650;
    __int16 v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    __int16 v35 = 2080;
    uint64_t v36 = "WiFiCloudSyncEngine.m";
    __int16 v37 = 1024;
    int v38 = 2002;
LABEL_75:
    _os_log_send_and_compose_impl();
    goto LABEL_76;
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_76;
    }
    int v33 = 136315650;
    __int16 v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    __int16 v35 = 2080;
    uint64_t v36 = "WiFiCloudSyncEngine.m";
    __int16 v37 = 1024;
    int v38 = 2004;
    goto LABEL_75;
  }
  if (!a2)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_76;
    }
    int v33 = 136315650;
    __int16 v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    __int16 v35 = 2080;
    uint64_t v36 = "WiFiCloudSyncEngine.m";
    __int16 v37 = 1024;
    int v38 = 2006;
    goto LABEL_75;
  }
  if (!*(void *)(a1 + 112))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_76;
    }
    int v33 = 136315650;
    __int16 v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    __int16 v35 = 2080;
    uint64_t v36 = "WiFiCloudSyncEngine.m";
    __int16 v37 = 1024;
    int v38 = 2009;
    goto LABEL_75;
  }
  if (!*(void *)(a1 + 96))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_76;
    }
    int v33 = 136315650;
    __int16 v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    __int16 v35 = 2080;
    uint64_t v36 = "WiFiCloudSyncEngine.m";
    __int16 v37 = 1024;
    int v38 = 2010;
    goto LABEL_75;
  }
  id CloudFromNetworkFormatCallback = __WiFiCloudSyncEngineCreateCloudFromNetworkFormatCallback(a1, a2, (uint64_t)v8);
  if (!CloudFromNetworkFormatCallback)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136315650;
      __int16 v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
      __int16 v35 = 2080;
      uint64_t v36 = "WiFiCloudSyncEngine.m";
      __int16 v37 = 1024;
      int v38 = 2014;
      goto LABEL_75;
    }
LABEL_76:
    BOOL v24 = 0;
LABEL_77:
    __int16 v30 = 0;
    uint64_t v10 = 0;
    goto LABEL_57;
  }
  uint64_t v10 = CloudFromNetworkFormatCallback;
  if ([a2 isKVSEncrypted]) {
    BOOL v11 = @"SSID";
  }
  else {
    BOOL v11 = @"SSID_STR";
  }
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];
  BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v13)
    {
      int v33 = 136315650;
      __int16 v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
      __int16 v35 = 2080;
      uint64_t v36 = "WiFiCloudSyncEngine.m";
      __int16 v37 = 1024;
      int v38 = 2018;
LABEL_119:
      _os_log_send_and_compose_impl();
    }
LABEL_120:
    BOOL v24 = 0;
    goto LABEL_121;
  }
  if (v13)
  {
    int v33 = 136315906;
    __int16 v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    __int16 v35 = 2080;
    uint64_t v36 = "WiFiCloudSyncEngine.m";
    __int16 v37 = 1024;
    int v38 = 2019;
    __int16 v39 = 2112;
    uint64_t v40 = v12;
    LODWORD(v32) = 38;
    __int16 v31 = &v33;
    _os_log_send_and_compose_impl();
  }
  if (objc_msgSend(a2, "isKVSEncrypted", v31, v32))
  {
    if (!__WiFiCloudSyncEngineIsNetworkSyncableToCloudEncrypted(a2, v10)) {
      goto LABEL_120;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        __int16 v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        __int16 v35 = 2080;
        uint64_t v36 = "WiFiCloudSyncEngine.m";
        __int16 v37 = 1024;
        int v38 = 2252;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    uint64_t v14 = (void *)[v10 objectForKey:@"NOT_SYNCABLE"];
    if (v14 && [v14 BOOLValue])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        __int16 v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        __int16 v35 = 2080;
        uint64_t v36 = "WiFiCloudSyncEngine.m";
        __int16 v37 = 1024;
        int v38 = 2257;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    BOOL v15 = (void *)[v10 objectForKey:@"IS_NETWORK_EAP"];
    if (!v15)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        __int16 v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        __int16 v35 = 2080;
        uint64_t v36 = "WiFiCloudSyncEngine.m";
        __int16 v37 = 1024;
        int v38 = 2261;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    if ([v15 BOOLValue])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        __int16 v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        __int16 v35 = 2080;
        uint64_t v36 = "WiFiCloudSyncEngine.m";
        __int16 v37 = 1024;
        int v38 = 2262;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    uint64_t v16 = (void *)[v10 objectForKey:@"IS_NETWORK_CUSTOMIZED"];
    if (!v16)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        __int16 v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        __int16 v35 = 2080;
        uint64_t v36 = "WiFiCloudSyncEngine.m";
        __int16 v37 = 1024;
        int v38 = 2266;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    if ([v16 BOOLValue])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        __int16 v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        __int16 v35 = 2080;
        uint64_t v36 = "WiFiCloudSyncEngine.m";
        __int16 v37 = 1024;
        int v38 = 2267;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    double v17 = (void *)[v10 objectForKey:@"IS_NETWORK_CONFIGURED"];
    if (!v17)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        __int16 v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        __int16 v35 = 2080;
        uint64_t v36 = "WiFiCloudSyncEngine.m";
        __int16 v37 = 1024;
        int v38 = 2271;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    if ([v17 BOOLValue])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        __int16 v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        __int16 v35 = 2080;
        uint64_t v36 = "WiFiCloudSyncEngine.m";
        __int16 v37 = 1024;
        int v38 = 2272;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    double v18 = (void *)[v10 objectForKey:@"AP_MODE"];
    if (v18 && [v18 intValue] != 2)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        __int16 v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        __int16 v35 = 2080;
        uint64_t v36 = "WiFiCloudSyncEngine.m";
        __int16 v37 = 1024;
        int v38 = 2278;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    double v19 = (void *)[v10 objectForKey:@"IS_NETWORK_EXPIRABLE"];
    if (v19 && [v19 BOOLValue])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        __int16 v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        __int16 v35 = 2080;
        uint64_t v36 = "WiFiCloudSyncEngine.m";
        __int16 v37 = 1024;
        int v38 = 2284;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    double v20 = (void *)[v10 objectForKey:@"enabled"];
    if (v20 && ([v20 BOOLValue] & 1) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        __int16 v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        __int16 v35 = 2080;
        uint64_t v36 = "WiFiCloudSyncEngine.m";
        __int16 v37 = 1024;
        int v38 = 2289;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    double v21 = (void *)[v10 objectForKey:@"IS_NETWORK_CARPLAY_ONLY"];
    if (v21 && [v21 BOOLValue])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        __int16 v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        __int16 v35 = 2080;
        uint64_t v36 = "WiFiCloudSyncEngine.m";
        __int16 v37 = 1024;
        int v38 = 2294;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    if (__WiFiCloudSyncEngineIsNetworkHidden(a2, v10))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        __int16 v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        __int16 v35 = 2080;
        uint64_t v36 = "WiFiCloudSyncEngine.m";
        __int16 v37 = 1024;
        int v38 = 2297;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    if (!__WiFiCloudSyncEngineGetNetworkSecurity(a2, v10))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        __int16 v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        __int16 v35 = 2080;
        uint64_t v36 = "WiFiCloudSyncEngine.m";
        __int16 v37 = 1024;
        int v38 = 2300;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
    double v22 = (void *)[v10 objectForKey:@"IS_NETWORK_CAPTIVE"];
    if (!v22 || [v22 BOOLValue])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        __int16 v34 = "__WiFiCloudSyncEngineIsNetworkSyncableToCloudLegacy";
        __int16 v35 = 2080;
        uint64_t v36 = "WiFiCloudSyncEngine.m";
        __int16 v37 = 1024;
        int v38 = 2304;
        goto LABEL_119;
      }
      goto LABEL_120;
    }
  }
  double v23 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  if (!v23)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136315650;
      __int16 v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
      __int16 v35 = 2080;
      uint64_t v36 = "WiFiCloudSyncEngine.m";
      __int16 v37 = 1024;
      int v38 = 2026;
      goto LABEL_119;
    }
    goto LABEL_120;
  }
  BOOL v24 = v23;
  [v23 addEntriesFromDictionary:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([a2 isKVSEncrypted] & 1) == 0)
    {
      if (![v24 objectForKey:@"AP_MODE"]) {
        objc_msgSend(v24, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 2), @"AP_MODE");
      }
      if (![v24 objectForKey:@"UserDirected"]) {
        objc_msgSend(v24, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 0), @"UserDirected");
      }
      if (![v24 objectForKey:@"enabled"]) {
        objc_msgSend(v24, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"enabled");
      }
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 136315650;
    __int16 v34 = "__WiFiCloudSyncEngineAddMissingKeysToCloudNetwork";
    __int16 v35 = 2080;
    uint64_t v36 = "WiFiCloudSyncEngine.m";
    __int16 v37 = 1024;
    int v38 = 2516;
    _os_log_send_and_compose_impl();
  }
  if (!__WiFiCloudSyncEngineGetNetworkSecurity(a2, v24)) {
    goto LABEL_52;
  }
  int v25 = (*(uint64_t (**)(CFTypeRef, void))(a1 + 88))(cf, *(void *)(a1 + 136));
  BOOL v26 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v26)
    {
      int v33 = 136315650;
      __int16 v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
      __int16 v35 = 2080;
      uint64_t v36 = "WiFiCloudSyncEngine.m";
      __int16 v37 = 1024;
      int v38 = 2033;
      _os_log_send_and_compose_impl();
    }
    (*(void (**)(CFTypeRef, uint64_t, void))(a1 + 96))(v8, 1, *(void *)(a1 + 136));
LABEL_52:
    __WiFiCloudSyncEngineAddVersionsToCloudNetwork(v24);
    int v27 = [a2 isKVSEncrypted];
    id v28 = objc_alloc(NSDictionary);
    if (v27) {
      uint64_t v29 = [v28 initWithObjectsAndKeys:v24, objc_msgSend(NSString, "stringWithFormat:", @"%@%@", @"network.", v12), 0];
    }
    else {
      uint64_t v29 = objc_msgSend(v28, "initWithObjectsAndKeys:", v24, v12, 0);
    }
    __int16 v30 = (void *)v29;
    if (v29)
    {
      [a2 addToKVStore:v29 synchronize:a4 != 0];
      goto LABEL_57;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_121;
    }
    int v33 = 136315650;
    __int16 v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    __int16 v35 = 2080;
    uint64_t v36 = "WiFiCloudSyncEngine.m";
    __int16 v37 = 1024;
    int v38 = 2048;
    goto LABEL_90;
  }
  if (v26)
  {
    int v33 = 136315650;
    __int16 v34 = "__WiFiCloudSyncEngineAddNetworkToCloudAndPurge";
    __int16 v35 = 2080;
    uint64_t v36 = "WiFiCloudSyncEngine.m";
    __int16 v37 = 1024;
    int v38 = 2032;
LABEL_90:
    _os_log_send_and_compose_impl();
  }
LABEL_121:
  __int16 v30 = 0;
LABEL_57:

  if (v8) {
    CFRelease(v8);
  }
}

void *__WiFiCloudSyncEngineIsCloudNetworkOnDevice(void *a1, void *a2, void *a3)
{
  if (!a3)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
LABEL_20:
    _os_log_send_and_compose_impl();
    return 0;
  }
  uint64_t v6 = [a3 count];
  if (!v6)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    goto LABEL_20;
  }
  uint64_t v7 = v6;
  if (v6 < 1) {
    return 0;
  }
  uint64_t v8 = 0;
  while (1)
  {
    uint64_t v9 = [a3 objectAtIndex:v8];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      BOOL v11 = [a1 isKVSEncrypted] ? @"SSID" : @"SSID_STR";
      uint64_t v12 = (void *)[a2 objectForKeyedSubscript:v11];
      BOOL v13 = [a1 isKVSEncrypted] ? @"SSID" : @"SSID_STR";
      if (objc_msgSend(v12, "isEqualToString:", objc_msgSend(v10, "objectForKeyedSubscript:", v13)))
      {
        int NetworkSecurity = __WiFiCloudSyncEngineGetNetworkSecurity(a1, a2);
        if (NetworkSecurity == __WiFiCloudSyncEngineGetNetworkSecurity(a1, v10)) {
          break;
        }
      }
    }
    if (v7 == ++v8) {
      return 0;
    }
  }
  return v10;
}

void WiFiCloudSyncEngineAddNetworkToCloud(uint64_t a1, CFTypeRef cf)
{
  if (!cf)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
LABEL_12:
    _os_log_send_and_compose_impl();
    return;
  }
  if (!a1)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    goto LABEL_12;
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    goto LABEL_12;
  }
  uint64_t v3 = *(void **)(a1 + 48);

  __WiFiCloudSyncEngineAddNetworkToCloudAndPurge(a1, v3, cf, 1);
}

void WiFiCloudSyncEngineRemoveNetworkFromCloud(uint64_t a1, CFTypeRef cf)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (cf)
  {
    CFTypeRef v4 = CFRetain(cf);
    if (a1)
    {
      if (*(unsigned char *)(a1 + 56))
      {
        uint64_t v5 = *(void **)(a1 + 48);
        if (v5)
        {
          if (*(void *)(a1 + 112))
          {
            id CloudFromNetworkFormatCallback = __WiFiCloudSyncEngineCreateCloudFromNetworkFormatCallback(a1, *(void **)(a1 + 48), (uint64_t)cf);
            if (CloudFromNetworkFormatCallback)
            {
              uint64_t v7 = CloudFromNetworkFormatCallback;
              if ([v5 isKVSEncrypted]) {
                uint64_t v8 = @"SSID";
              }
              else {
                uint64_t v8 = @"SSID_STR";
              }
              uint64_t v9 = [v7 objectForKeyedSubscript:v8];
              BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
              if (v9)
              {
                if (v10)
                {
                  int v19 = 136315906;
                  double v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
                  __int16 v21 = 2080;
                  double v22 = "WiFiCloudSyncEngine.m";
                  __int16 v23 = 1024;
                  int v24 = 2106;
                  __int16 v25 = 2112;
                  uint64_t v26 = v9;
                  LODWORD(v16) = 38;
                  BOOL v15 = &v19;
                  _os_log_send_and_compose_impl();
                }
                if (objc_msgSend(v5, "isKVSEncrypted", v15, v16))
                {
                  uint64_t v11 = [NSString stringWithFormat:@"%@%@", @"network.", v9];
                  uint64_t v12 = objc_msgSend((id)objc_msgSend(v5, "keyValueStore"), "objectForKey:", v11);
                  if (v12)
                  {
                    BOOL v13 = (void *)v12;
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v14 = (id)[v13 mutableCopy];
                      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF910], "date"), @"removedAt");
                      uint64_t v17 = v11;
                      id v18 = v14;
                      objc_msgSend(v5, "addToKVStore:synchronize:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1), 1);
                    }
                  }
                }
                else
                {
                  [v5 removeFromKVStore:v9];
                }
              }
              else if (v10)
              {
                int v19 = 136315650;
                double v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
                __int16 v21 = 2080;
                double v22 = "WiFiCloudSyncEngine.m";
                __int16 v23 = 1024;
                int v24 = 2105;
                _os_log_send_and_compose_impl();
              }
              goto LABEL_18;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              int v19 = 136315650;
              double v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
              __int16 v21 = 2080;
              double v22 = "WiFiCloudSyncEngine.m";
              __int16 v23 = 1024;
              int v24 = 2101;
              goto LABEL_34;
            }
LABEL_35:
            uint64_t v7 = 0;
LABEL_18:

            if (v4) {
              CFRelease(v4);
            }
            return;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_35;
          }
          int v19 = 136315650;
          double v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
          __int16 v21 = 2080;
          double v22 = "WiFiCloudSyncEngine.m";
          __int16 v23 = 1024;
          int v24 = 2097;
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_35;
          }
          int v19 = 136315650;
          double v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
          __int16 v21 = 2080;
          double v22 = "WiFiCloudSyncEngine.m";
          __int16 v23 = 1024;
          int v24 = 2094;
        }
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_35;
        }
        int v19 = 136315650;
        double v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
        __int16 v21 = 2080;
        double v22 = "WiFiCloudSyncEngine.m";
        __int16 v23 = 1024;
        int v24 = 2091;
      }
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      int v19 = 136315650;
      double v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
      __int16 v21 = 2080;
      double v22 = "WiFiCloudSyncEngine.m";
      __int16 v23 = 1024;
      int v24 = 2089;
    }
LABEL_34:
    _os_log_send_and_compose_impl();
    goto LABEL_35;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315650;
    double v20 = "WiFiCloudSyncEngineRemoveNetworkFromCloud";
    __int16 v21 = 2080;
    double v22 = "WiFiCloudSyncEngine.m";
    __int16 v23 = 1024;
    int v24 = 2084;
    _os_log_send_and_compose_impl();
  }
}

uint64_t WiFiCloudSyncEngineMergeKnownNetworksToCloud(uint64_t a1)
{
  if (!a1)
  {
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (!result) {
      return result;
    }
    return _os_log_send_and_compose_impl();
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (!result) {
      return result;
    }
    return _os_log_send_and_compose_impl();
  }
  unint64_t v2 = *(void **)(a1 + 48);
  if (!v2)
  {
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (!result) {
      return result;
    }
    return _os_log_send_and_compose_impl();
  }
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "keyValueStore"), "dictionaryRepresentation");

  return WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS((void *)a1, v2, v3);
}

uint64_t WiFiCloudSyncEngineGetLogCallbackFunction(uint64_t result)
{
  if (result) {
    return *(void *)(result + 128);
  }
  return result;
}

uint64_t WiFiCloudSyncEngineIsRunning()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x223C64240]();
  id v1 = objc_alloc_init(MEMORY[0x263F16D38]);
  [v1 setContext:*MEMORY[0x263F16D90]];
  id v2 = (id)[objc_alloc(MEMORY[0x263F16D30]) initWithContextData:v1];
  if (v2)
  {
    uint64_t v5 = 0;
    uint64_t v3 = [v2 fetchUserControllableViewsSyncingEnabled:&v5];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136316162;
      uint64_t v7 = "WiFiCloudSyncEngineIsRunning";
      __int16 v8 = 2080;
      uint64_t v9 = "WiFiCloudSyncEngine.m";
      __int16 v10 = 1024;
      int v11 = 2888;
      __int16 v12 = 1024;
      int v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      uint64_t v7 = "WiFiCloudSyncEngineIsRunning";
      __int16 v8 = 2080;
      uint64_t v9 = "WiFiCloudSyncEngine.m";
      __int16 v10 = 1024;
      int v11 = 2892;
      _os_log_send_and_compose_impl();
      uint64_t v3 = 0;
    }
  }
  return v3;
}

uint64_t WiFiCloudSyncEngineCopyCompleteKVS(uint64_t a1, int a2)
{
  uint64_t v2 = 48;
  if (a2) {
    uint64_t v2 = 40;
  }
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + v2), "keyValueStore"), "dictionaryRepresentation");

  return [v3 copy];
}

uint64_t __WiFiCloudSyncEngineRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __wiFiCloudEngineTypeID = result;
  return result;
}

void __WiFiCloudSyncEngineRelease(uint64_t a1)
{
  if (a1)
  {
    WiFiCloudSyncEngineStopEngine(a1);
    uint64_t v2 = *(__CFMachPort **)(a1 + 176);
    if (v2)
    {
      CFMachPortInvalidate(v2);
      uint64_t v3 = *(const void **)(a1 + 176);
      if (v3)
      {
        CFRelease(v3);
        *(void *)(a1 + 176) = 0;
      }
    }
    CFTypeRef v4 = *(const void **)(a1 + 184);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 184) = 0;
    }
    uint64_t v5 = *(NSObject **)(a1 + 216);
    if (v5) {
      dispatch_release(v5);
    }
    int v6 = *(NSObject **)(a1 + 224);
    if (v6)
    {
      dispatch_source_cancel(v6);
      dispatch_release(*(dispatch_object_t *)(a1 + 224));
    }
    uint64_t v7 = *(__CFRunLoopTimer **)(a1 + 248);
    if (v7)
    {
      CFRunLoopTimerInvalidate(v7);
      __int16 v8 = *(const void **)(a1 + 248);
      if (v8)
      {
        CFRelease(v8);
        *(void *)(a1 + 248) = 0;
      }
    }
    uint64_t v9 = *(NSObject **)(a1 + 256);
    if (v9)
    {
      dispatch_release(v9);
      *(void *)(a1 + 256) = 0;
    }
    __int16 v10 = *(__CFMachPort **)(a1 + 200);
    if (v10)
    {
      CFMachPortInvalidate(v10);
      int v11 = *(const void **)(a1 + 200);
      if (v11)
      {
        CFRelease(v11);
        *(void *)(a1 + 200) = 0;
      }
    }
    __int16 v12 = *(const void **)(a1 + 208);
    if (v12)
    {
      CFRelease(v12);
      *(void *)(a1 + 208) = 0;
    }
    int v13 = *(const void **)(a1 + 240);
    if (v13)
    {
      CFRelease(v13);
      *(void *)(a1 + 240) = 0;
    }
    __int16 v14 = *(const void **)(a1 + 144);
    if (v14)
    {
      CFRelease(v14);
      *(void *)(a1 + 144) = 0;
    }
    uint64_t v15 = *(NSObject **)(a1 + 272);
    if (v15) {
      dispatch_release(v15);
    }
    uint64_t v16 = *(NSObject **)(a1 + 280);
    if (v16) {
      dispatch_release(v16);
    }

    *(void *)(a1 + 160) = 0;
    uint64_t v17 = *(void **)(a1 + 48);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    _os_log_send_and_compose_impl();
  }
}

void __WiFiCloudSyncEngineKeychainSyncStateChanged(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v5) {
      _os_log_send_and_compose_impl();
    }
    WiFiCloudSyncEngineCheckKeychainSyncState(a4);
  }
  else if (v5)
  {
    _os_log_send_and_compose_impl();
  }
}

void __WiFiCloudSyncEngineKeychainChangedNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v5) {
      _os_log_send_and_compose_impl();
    }
    *(unsigned char *)(a4 + 232) = 1;
    __WiFiCloudSyncEngineCheckWaitingForPasswordList(a4, *(void **)(a4 + 48));
  }
  else if (v5)
  {
    _os_log_send_and_compose_impl();
  }
}

void __WiFiCloudSyncEngineCheckWaitingForPasswordList(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  double Current = CFAbsoluteTimeGetCurrent();
  if (!a1)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v41 = 136315650;
    BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    __int16 v43 = 2080;
    double v44 = "WiFiCloudSyncEngine.m";
    __int16 v45 = 1024;
    int v46 = 2560;
    goto LABEL_37;
  }
  CFArrayRef v5 = *(const __CFArray **)(a1 + 144);
  if (!v5)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v41 = 136315650;
    BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    __int16 v43 = 2080;
    double v44 = "WiFiCloudSyncEngine.m";
    __int16 v45 = 1024;
    int v46 = 2561;
    goto LABEL_37;
  }
  if (!*(void *)(a1 + 240))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v41 = 136315650;
    BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    __int16 v43 = 2080;
    double v44 = "WiFiCloudSyncEngine.m";
    __int16 v45 = 1024;
    int v46 = 2562;
    goto LABEL_37;
  }
  if (!*(void *)(a1 + 104))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v41 = 136315650;
    BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    __int16 v43 = 2080;
    double v44 = "WiFiCloudSyncEngine.m";
    __int16 v45 = 1024;
    int v46 = 2563;
    goto LABEL_37;
  }
  if (!*(void *)(a1 + 72))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v41 = 136315650;
    BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    __int16 v43 = 2080;
    double v44 = "WiFiCloudSyncEngine.m";
    __int16 v45 = 1024;
    int v46 = 2566;
    goto LABEL_37;
  }
  double v6 = Current;
  if (*(void *)(a1 + 16))
  {
    if (*(void *)(a1 + 24))
    {
      uint64_t v7 = *(__CFRunLoopTimer **)(a1 + 248);
      if (v7)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        int v41 = 136316418;
        BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
        __int16 v43 = 2080;
        double v44 = "WiFiCloudSyncEngine.m";
        __int16 v45 = 1024;
        int v46 = 2570;
        __int16 v47 = 1024;
        *(_DWORD *)v48 = 5;
        *(_WORD *)&v48[4] = 2048;
        *(void *)&v48[6] = 0x4024000000000000;
        *(_WORD *)&v48[14] = 2048;
        *(double *)&v48[16] = CFRunLoopTimerGetNextFireDate(v7) - v6;
        goto LABEL_37;
      }
    }
  }
  if (*(void *)(a1 + 32) && *(void *)(a1 + 256))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    double v36 = *(double *)(a1 + 264) - v6;
    int v41 = 136316418;
    BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    __int16 v43 = 2080;
    double v44 = "WiFiCloudSyncEngine.m";
    __int16 v45 = 1024;
    int v46 = 2573;
    __int16 v47 = 1024;
    *(_DWORD *)v48 = 5;
    *(_WORD *)&v48[4] = 2048;
    *(void *)&v48[6] = 0x4024000000000000;
    *(_WORD *)&v48[14] = 2048;
    *(double *)&v48[16] = v36;
    goto LABEL_37;
  }
  CFIndex Count = CFArrayGetCount(v5);
  if (Count)
  {
    CFIndex v9 = Count;
    if (*(void *)(a1 + 152) < Count)
    {
      __int16 v10 = (void *)MEMORY[0x223C64240]();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 152);
        int v41 = 136316162;
        BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
        __int16 v43 = 2080;
        double v44 = "WiFiCloudSyncEngine.m";
        __int16 v45 = 1024;
        int v46 = 2605;
        __int16 v47 = 2048;
        *(void *)v48 = v9;
        *(_WORD *)&v48[8] = 2048;
        *(void *)&v48[10] = v11;
        _os_log_send_and_compose_impl();
      }
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 144), *(void *)(a1 + 152));
      uint64_t NetworkFromCloudFormatCallback = (const void *)__WiFiCloudSyncEngineCreateNetworkFromCloudFormatCallback(a1, a2, ValueAtIndex);
      if (NetworkFromCloudFormatCallback)
      {
        CFDateRef v14 = CFDateCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v6);
        if (v14)
        {
          CFDateRef v15 = v14;
          if (CFArrayGetCount(*(CFArrayRef *)(a1 + 240)) == 5) {
            CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 240), 0);
          }
          CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 240), v15);
          CFRelease(v15);
        }
        int v16 = (*(uint64_t (**)(const void *, void))(a1 + 88))(NetworkFromCloudFormatCallback, *(void *)(a1 + 136));
        BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
        if (v16)
        {
          if (v17)
          {
            uint64_t v18 = *(void *)(a1 + 152);
            int v41 = 136315906;
            BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
            __int16 v43 = 2080;
            double v44 = "WiFiCloudSyncEngine.m";
            __int16 v45 = 1024;
            int v46 = 2635;
            __int16 v47 = 2048;
            *(void *)v48 = v18;
            _os_log_send_and_compose_impl();
          }
          (*(void (**)(const void *, void))(a1 + 72))(NetworkFromCloudFormatCallback, *(void *)(a1 + 136));
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 144), *(void *)(a1 + 152));
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            int v41 = 136315650;
            BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
            __int16 v43 = 2080;
            double v44 = "WiFiCloudSyncEngine.m";
            __int16 v45 = 1024;
            int v46 = 2642;
            _os_log_send_and_compose_impl();
          }
        }
        else
        {
          if (v17)
          {
            uint64_t v21 = *(void *)(a1 + 152);
            int v41 = 136315906;
            BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
            __int16 v43 = 2080;
            double v44 = "WiFiCloudSyncEngine.m";
            __int16 v45 = 1024;
            int v46 = 2630;
            __int16 v47 = 2048;
            *(void *)v48 = v21;
            _os_log_send_and_compose_impl();
          }
          ++*(void *)(a1 + 152);
        }
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v41 = 136315906;
          BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
          __int16 v43 = 2080;
          double v44 = "WiFiCloudSyncEngine.m";
          __int16 v45 = 1024;
          int v46 = 2611;
          __int16 v47 = 2112;
          *(void *)v48 = ValueAtIndex;
          _os_log_send_and_compose_impl();
        }
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 144), *(void *)(a1 + 152));
      }
LABEL_42:
      double v22 = (void *)MEMORY[0x223C64240](v20);
      if (CFArrayGetCount(*(CFArrayRef *)(a1 + 240)) == 5
        && (__int16 v23 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 240), 0)) != 0
        && (double v25 = MEMORY[0x223C63F20](v23, v24), v6 > v25)
        && v6 - v25 <= 10.0)
      {
        double v26 = v25 - v6 + 12.0;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v41 = 136316418;
          BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
          __int16 v43 = 2080;
          double v44 = "WiFiCloudSyncEngine.m";
          __int16 v45 = 1024;
          int v46 = 2685;
          __int16 v47 = 1024;
          *(_DWORD *)v48 = 5;
          *(_WORD *)&v48[4] = 2048;
          *(void *)&v48[6] = 0x4024000000000000;
          *(_WORD *)&v48[14] = 2048;
          *(double *)&v48[16] = v26;
          _os_log_send_and_compose_impl();
        }
        if (*(void *)(a1 + 16) && *(void *)(a1 + 24))
        {
          CFAllocatorRef v27 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = ____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke_51;
          block[3] = &unk_26454D238;
          block[4] = a2;
          void block[5] = a1;
          id v28 = CFRunLoopTimerCreateWithHandler(v27, v6 + v26, 0.0, 0, 0, block);
          *(void *)(a1 + 248) = v28;
          CFRunLoopAddTimer(*(CFRunLoopRef *)(a1 + 16), v28, *(CFRunLoopMode *)(a1 + 24));
        }
        uint64_t v29 = *(NSObject **)(a1 + 32);
        if (v29)
        {
          __int16 v30 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v29);
          *(void *)(a1 + 256) = v30;
          handler[0] = MEMORY[0x263EF8330];
          handler[1] = 3221225472;
          handler[2] = ____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke_2_53;
          handler[3] = &unk_26454D1C8;
          handler[4] = a2;
          void handler[5] = a1;
          dispatch_source_set_event_handler(v30, handler);
          __int16 v31 = *(NSObject **)(a1 + 256);
          dispatch_time_t v32 = dispatch_time(0, (uint64_t)(v26 * 1000000000.0));
          dispatch_source_set_timer(v31, v32, 0xFFFFFFFFFFFFFFFFLL, 0);
          *(double *)(a1 + 264) = v6 + v26;
          dispatch_activate(*(dispatch_object_t *)(a1 + 256));
        }
      }
      else
      {
        int v33 = *(__CFRunLoop **)(a1 + 16);
        if (v33)
        {
          __int16 v34 = *(const void **)(a1 + 24);
          if (v34)
          {
            v40[0] = MEMORY[0x263EF8330];
            v40[1] = 3221225472;
            v40[2] = ____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke;
            v40[3] = &unk_26454D1C8;
            v40[4] = a2;
            v40[5] = a1;
            CFRunLoopPerformBlock(v33, v34, v40);
            CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 16));
          }
        }
        __int16 v35 = *(NSObject **)(a1 + 32);
        if (v35)
        {
          v39[0] = MEMORY[0x263EF8330];
          v39[1] = 3221225472;
          v39[2] = ____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke_2;
          v39[3] = &unk_26454D1C8;
          v39[4] = a2;
          v39[5] = a1;
          dispatch_async(v35, v39);
        }
      }
      if (NetworkFromCloudFormatCallback) {
        CFRelease(NetworkFromCloudFormatCallback);
      }
      return;
    }
    int v19 = *(unsigned __int8 *)(a1 + 232);
    uint64_t v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v20)
      {
        int v41 = 136315906;
        BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
        __int16 v43 = 2080;
        double v44 = "WiFiCloudSyncEngine.m";
        __int16 v45 = 1024;
        int v46 = 2591;
        __int16 v47 = 2048;
        *(void *)v48 = v9;
        uint64_t v20 = _os_log_send_and_compose_impl();
      }
      uint64_t NetworkFromCloudFormatCallback = 0;
      *(void *)(a1 + 152) = 0;
      *(unsigned char *)(a1 + 232) = 0;
      goto LABEL_42;
    }
    if (!v20) {
      return;
    }
    int v41 = 136315906;
    BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    __int16 v43 = 2080;
    double v44 = "WiFiCloudSyncEngine.m";
    __int16 v45 = 1024;
    int v46 = 2598;
    __int16 v47 = 2048;
    *(void *)v48 = v9;
LABEL_37:
    _os_log_send_and_compose_impl();
    return;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = 136315650;
    BOOL v42 = "__WiFiCloudSyncEngineCheckWaitingForPasswordList";
    __int16 v43 = 2080;
    double v44 = "WiFiCloudSyncEngine.m";
    __int16 v45 = 1024;
    int v46 = 2580;
    _os_log_send_and_compose_impl();
  }
  __WiFiCloudSyncEngineStopKeychainChangedNotifications(a1);
}

uint64_t __WiFiCloudSyncEngineStopKeychainChangedNotifications(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(__CFRunLoop **)(a1 + 16);
    if (v2 && (CFStringRef v3 = *(const __CFString **)(a1 + 24)) != 0)
    {
      CFTypeRef v4 = *(__CFRunLoopSource **)(a1 + 208);
      if (!v4)
      {
        uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
        if (result) {
          return _os_log_send_and_compose_impl();
        }
        return result;
      }
      CFRunLoopRemoveSource(v2, v4, v3);
    }
    else if (!*(void *)(a1 + 32))
    {
      uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      if (result) {
        return _os_log_send_and_compose_impl();
      }
      return result;
    }
    if (!*(void *)(a1 + 32)) {
      goto LABEL_10;
    }
    int v5 = *(_DWORD *)(a1 + 192);
    if (v5)
    {
      notify_cancel(v5);
LABEL_10:
      uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      if (!result) {
        return result;
      }
      return _os_log_send_and_compose_impl();
    }
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (result) {
      return _os_log_send_and_compose_impl();
    }
  }
  else
  {
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (result) {
      return _os_log_send_and_compose_impl();
    }
  }
  return result;
}

void __WiFiCloudSyncEngineProcessCloudChangeEvent(NSObject **a1, uint64_t a2, void *a3)
{
  block[13] = *MEMORY[0x263EF8340];
  if (a1 && a3)
  {
    uint64_t v6 = [a3 count];
    CFRetain(a1);
    dispatch_semaphore_wait(a1[35], 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v7 = a1[34];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ____WiFiCloudSyncEngineProcessCloudChangeEvent_block_invoke;
    block[3] = &unk_26454D260;
    block[4] = a3;
    void block[5] = a2;
    void block[6] = v6;
    block[7] = a1;
    dispatch_async(v7, block);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    _os_log_send_and_compose_impl();
  }
}

uint64_t __WiFiCloudSyncEngineProcessCloudNetworkChangeEvent(uint64_t a1, void *a2)
{
  if (!a1)
  {
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (!result) {
      return result;
    }
    return _os_log_send_and_compose_impl();
  }
  if (!a2)
  {
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (!result) {
      return result;
    }
    return _os_log_send_and_compose_impl();
  }

  return objc_msgSend(a2, "readStoreValueForKey:");
}

id __WiFiCloudSyncEngineTranslateFromLegacyFormat(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"SSID_STR"), @"SSID");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"BSSID"), @"BSSID");
  int v3 = objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", @"WEP"), "BOOLValue");
  uint64_t v4 = MEMORY[0x263EFFA88];
  if (v3) {
    uint64_t v5 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v5 = 0;
  }
  [v2 setObject:v5 forKeyedSubscript:@"isWEP"];
  if ([a1 objectForKeyedSubscript:@"WPA_IE"]) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0;
  }
  [v2 setObject:v6 forKeyedSubscript:@"isWPA"];
  if ([a1 objectForKeyedSubscript:@"RSN_IE"]) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 0;
  }
  [v2 setObject:v7 forKeyedSubscript:@"isWPA2"];
  if ([a1 objectForKeyedSubscript:@"WPA3_RSN_IE"]) {
    uint64_t v8 = v4;
  }
  else {
    uint64_t v8 = 0;
  }
  [v2 setObject:v8 forKeyedSubscript:@"isWPA3"];
  if ((objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", @"isWEP"), "BOOLValue") & 1) == 0
    && (objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", @"isWPA"), "BOOLValue") & 1) == 0
    && (objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", @"isWPA2"), "BOOLValue") & 1) == 0
    && (objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", @"isWPA3"), "BOOLValue") & 1) == 0)
  {
    [v2 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isOpen"];
  }
  if ((objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", @"isOpen"), "BOOLValue") & 1) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", @"IS_NETWORK_EAP"), "BOOLValue"))CFIndex v9 = @"isEAP"; {
    else
    }
      CFIndex v9 = @"isPSK";
    [v2 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v9];
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"UserDirected"), @"isHidden");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"IS_NETWORK_CAPTIVE"), @"isCaptive");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"IS_NETWORK_WHITELISTING_CAPTIVE"), @"isWhitelistedCaptive");
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", @"IS_NETWORK_EXPIRABLE"), "BOOLValue"))uint64_t v10 = v4; {
  else
  }
    uint64_t v10 = 0;
  [v2 setObject:v10 forKeyedSubscript:@"isExpirable"];
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", @"IS_NETWORK_CUSTOMIZED"), "BOOLValue"))uint64_t v11 = v4; {
  else
  }
    uint64_t v11 = 0;
  [v2 setObject:v11 forKeyedSubscript:@"isCustom"];
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", @"IS_NETWORK_CONFIGURED"), "BOOLValue"))uint64_t v12 = v4; {
  else
  }
    uint64_t v12 = 0;
  [v2 setObject:v12 forKeyedSubscript:@"isProfileBased"];
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", @"IS_NETWORK_APPBASED"), "BOOLValue"))uint64_t v13 = v4; {
  else
  }
    uint64_t v13 = 0;
  [v2 setObject:v13 forKeyedSubscript:@"isAppBased"];
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", @"IS_NETWORK_CARPLAY_ONLY"), "BOOLValue"))uint64_t v14 = v4; {
  else
  }
    uint64_t v14 = 0;
  [v2 setObject:v14 forKeyedSubscript:@"isCarPlayOnly"];
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", @"AP_MODE"), "intValue") == 1) {
    uint64_t v15 = v4;
  }
  else {
    uint64_t v15 = 0;
  }
  [v2 setObject:v15 forKeyedSubscript:@"isIBSS"];
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKeyedSubscript:", @"enabled"), "BOOLValue")) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v4;
  }
  [v2 setObject:v16 forKeyedSubscript:@"isAutoJoinDisabled"];
  BOOL v17 = (void *)[a1 objectForKeyedSubscript:@"LOW_DATA_MODE"];
  if (v17)
  {
    uint64_t v18 = v17;
    if ([v17 integerValue] == 1)
    {
      uint64_t v19 = MEMORY[0x263EFFA88];
    }
    else
    {
      if ([v18 integerValue] != 2) {
        goto LABEL_50;
      }
      uint64_t v19 = MEMORY[0x263EFFA80];
    }
    [v2 setObject:v19 forKeyedSubscript:@"lowDataMode"];
  }
LABEL_50:
  uint64_t v20 = [a1 objectForKeyedSubscript:@"AddedAt"];
  if (!v20) {
    uint64_t v20 = [MEMORY[0x263EFF910] date];
  }
  [v2 setObject:v20 forKeyedSubscript:@"addedAt"];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"UserJoinedAt"), @"lastJoinedByUserAt");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"lastJoinedBySystemAtWeek"), @"lastJoinedBySystemAtWeek");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"UserPreferredTimestamp"), @"preferredOrderTimestamp");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"minVersion"), @"minVersion");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"NOT_SYNCABLE"), @"NOT_SYNCABLE");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"IS_PRIVACY_PROXY_ENABLED"), @"isPrivacyProxyEnabled");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"IS_MOVING"), @"isMoving");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"IS_PUBLIC"), @"isPublic");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"was6GHzOnlyAtWeek"), @"was6GHzOnlyAtWeek");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"seamlessSSIDList"), @"seamlessSSIDList");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"privateMacPref"), @"privateMacPref");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(a1, "objectForKeyedSubscript:", @"prvateMacPrefTimestamp"), @"prvateMacPrefTimestamp");
  uint64_t v21 = (void *)[v2 copy];

  return v21;
}

uint64_t __WiFiCloudSyncEngineAddVersionsToCloudNetwork(void *a1)
{
  if (a1)
  {
    uint64_t result = [a1 objectForKeyedSubscript:@"addedByVersion"];
    if (!result)
    {
      id v3 = (id)[objc_alloc(NSDictionary) initWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
      uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"ProductBuildVersion"), "stringByReplacingOccurrencesOfString:withString:", @" ", &stru_26D1D9370), "stringByReplacingOccurrencesOfString:withString:", @".", @"_"), "lowercaseString");
      uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"ProductVersion"), "stringByReplacingOccurrencesOfString:withString:", @" ", &stru_26D1D9370), "stringByReplacingOccurrencesOfString:withString:", @".", @"_"), "lowercaseString");
      uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"ProductName"), "stringByReplacingOccurrencesOfString:withString:", @" ", &stru_26D1D9370), "stringByReplacingOccurrencesOfString:withString:", @".", @"_"), "lowercaseString");
      mach_port_t v7 = *MEMORY[0x263F0EC90];
      CFDictionaryRef v8 = IOServiceMatching("IOPlatformExpertDevice");
      io_service_t MatchingService = IOServiceGetMatchingService(v7, v8);
      if (MatchingService)
      {
        io_object_t v10 = MatchingService;
        CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, @"model", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
        if (CFProperty)
        {
          CFDataRef v12 = CFProperty;
          id v13 = [NSString alloc];
          id v14 = (id)[v13 initWithFormat:@"%@", objc_msgSend(NSString, "stringWithCString:encoding:", CFDataGetBytePtr(v12), 4)];
          CFRelease(v12);
        }
        else
        {
          id v14 = 0;
        }
        IOObjectRelease(v10);
      }
      else
      {
        id v14 = 0;
      }
      uint64_t v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", @" ", &stru_26D1D9370), "stringByReplacingOccurrencesOfString:withString:", @".", @"_"), "lowercaseString");
      uint64_t v16 = [NSString stringWithFormat:@"%@.%@.%@.%@.%ld", v6, v5, v4, v15, 2];
      return [a1 setObject:v16 forKeyedSubscript:@"addedByVersion"];
    }
  }
  else
  {
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (result) {
      return _os_log_send_and_compose_impl();
    }
  }
  return result;
}

uint64_t __WiFiCloudSyncEngineIsNetworkSyncableToCloudEncrypted(void *a1, void *a2)
{
  if (a2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = (void *)[a2 objectForKey:@"NOT_SYNCABLE"];
      if (v4 && [v4 BOOLValue])
      {
        BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
        uint64_t result = 0;
        if (v19) {
          goto LABEL_51;
        }
      }
      else
      {
        uint64_t v5 = (void *)[a2 objectForKey:@"isEAP"];
        if (v5 && [v5 BOOLValue])
        {
          BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
          uint64_t result = 0;
          if (v20) {
            goto LABEL_51;
          }
        }
        else
        {
          uint64_t v6 = (void *)[a2 objectForKey:@"isCustom"];
          if (v6 && [v6 BOOLValue])
          {
            BOOL v21 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
            uint64_t result = 0;
            if (v21) {
              goto LABEL_51;
            }
          }
          else
          {
            mach_port_t v7 = (void *)[a2 objectForKey:@"isProfileBased"];
            if (v7 && [v7 BOOLValue])
            {
              BOOL v22 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
              uint64_t result = 0;
              if (v22) {
                goto LABEL_51;
              }
            }
            else
            {
              CFDictionaryRef v8 = (void *)[a2 objectForKey:@"isIBSS"];
              if (v8 && [v8 BOOLValue])
              {
                BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                uint64_t result = 0;
                if (v23) {
                  goto LABEL_51;
                }
              }
              else
              {
                CFIndex v9 = (void *)[a2 objectForKey:@"isExpirable"];
                if (v9 && [v9 BOOLValue])
                {
                  BOOL v24 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                  uint64_t result = 0;
                  if (v24) {
                    goto LABEL_51;
                  }
                }
                else
                {
                  io_object_t v10 = (void *)[a2 objectForKey:@"isAutoJoinDisabled"];
                  if (v10 && [v10 BOOLValue])
                  {
                    BOOL v25 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                    uint64_t result = 0;
                    if (v25) {
                      goto LABEL_51;
                    }
                  }
                  else
                  {
                    uint64_t v11 = (void *)[a2 objectForKey:@"isCarPlayOnly"];
                    if (v11 && [v11 BOOLValue])
                    {
                      BOOL v26 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                      uint64_t result = 0;
                      if (v26) {
                        goto LABEL_51;
                      }
                    }
                    else if (__WiFiCloudSyncEngineIsNetworkHidden(a1, a2))
                    {
                      BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                      uint64_t result = 0;
                      if (v18) {
                        goto LABEL_51;
                      }
                    }
                    else
                    {
                      CFDataRef v12 = (void *)[a2 objectForKey:@"isOpen"];
                      if (v12 && [v12 BOOLValue])
                      {
                        BOOL v27 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                        uint64_t result = 0;
                        if (v27) {
                          goto LABEL_51;
                        }
                      }
                      else
                      {
                        id v13 = (void *)[a2 objectForKey:@"isCaptive"];
                        if (v13 && ![v13 BOOLValue]) {
                          return 1;
                        }
                        BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
                        uint64_t result = 0;
                        if (v15)
                        {
LABEL_51:
                          _os_log_send_and_compose_impl();
                          return 0;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      uint64_t result = 0;
      if (v17) {
        goto LABEL_51;
      }
    }
  }
  else
  {
    BOOL v16 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (v16) {
      goto LABEL_51;
    }
  }
  return result;
}

uint64_t __WiFiCloudSyncEngineIsNetworkHidden(void *a1, void *a2)
{
  if (!a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    return 0;
  }
  if ([a1 isKVSEncrypted]) {
    uint64_t v4 = @"isHidden";
  }
  else {
    uint64_t v4 = @"UserDirected";
  }
  uint64_t v5 = (void *)[a2 objectForKey:v4];
  if (!v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
LABEL_15:
    }
      _os_log_send_and_compose_impl();
    return 0;
  }

  return [v5 BOOLValue];
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
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

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x270EE48C8](theDate);
  return result;
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4AE8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x270EE4AF0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
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

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreateWithHandler(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, void *block)
{
  return (CFRunLoopTimerRef)MEMORY[0x270EE4F08](allocator, flags, order, block, fireDate, interval);
}

CFAbsoluteTime CFRunLoopTimerGetNextFireDate(CFRunLoopTimerRef timer)
{
  MEMORY[0x270EE4F10](timer);
  return result;
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

void NSLog(NSString *format, ...)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x270ED9310]();
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

void dispatch_resume(dispatch_object_t object)
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

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x270ED9518](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  return MEMORY[0x270EDA778](name, notify_port, *(void *)&flags, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

void objc_enumerationMutation(id obj)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}