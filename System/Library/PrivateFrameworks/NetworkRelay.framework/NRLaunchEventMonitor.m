@interface NRLaunchEventMonitor
+ (id)copySharedMonitor;
- (NRLaunchEventMonitor)init;
- (uint64_t)processSCDUpdate:(uint64_t)a1;
- (void)cancel;
- (void)processCWFEvent:(int)a3 forced:;
- (void)setLaunchFlags:(uint64_t)a1;
- (void)start;
- (void)triggerLaunchIfNeeded;
@end

@implementation NRLaunchEventMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scdKeyIR, 0);
  objc_storeStrong((id *)&self->_coreWiFiHandle, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)cancel
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__NRLaunchEventMonitor_cancel__block_invoke;
  block[3] = &unk_263FD1360;
  block[4] = self;
  dispatch_async(queue, block);
}

void __30__NRLaunchEventMonitor_cancel__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    if (*(unsigned char *)(v8 + 9)) {
      return;
    }
    *(unsigned char *)(v8 + 9) = 1;
  }
  if (nrCopyLogObj_onceToken_7 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_7, &__block_literal_global_48);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_8, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_8, 0, (uint64_t)"%s%.30s:%-4d cancelled launch event monitor", a4, a5, a6, a7, a8, (uint64_t)"");
  }
}

- (void)start
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__NRLaunchEventMonitor_start__block_invoke;
  block[3] = &unk_263FD1360;
  block[4] = self;
  dispatch_async(queue, block);
}

void __29__NRLaunchEventMonitor_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v59[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8 && !*(unsigned char *)(v8 + 8))
  {
    if (nrSupportsPHSProxyClient_onceToken != -1) {
      dispatch_once(&nrSupportsPHSProxyClient_onceToken, &__block_literal_global_473);
    }
    if (nrSupportsPHSProxyClient_supported)
    {
      int out_token = -1;
      objc_initWeak(&location, (id)v8);
      v10 = *(id *)(v8 + 24);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __34__NRLaunchEventMonitor_startInner__block_invoke;
      handler[3] = &unk_263FD0FA0;
      objc_copyWeak(&v56, &location);
      uint64_t v11 = notify_register_dispatch("com.apple.networkrelay.launch", &out_token, v10, handler);

      if (v11)
      {
        if (nrCopyLogObj_onceToken_7 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_7, &__block_literal_global_48);
        }
        v12 = (id)nrCopyLogObj_sNRLogObj_8;
        v13 = v12;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v21 = os_log_type_enabled(v12, OS_LOG_TYPE_FAULT);

          if (!v21)
          {
            objc_destroyWeak(&v56);
            objc_destroyWeak(&location);
            return;
          }
        }
        if (nrCopyLogObj_onceToken_7 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_7, &__block_literal_global_48);
        }
        id v18 = (id)nrCopyLogObj_sNRLogObj_8;
        _NRLogWithArgs((uint64_t)v18, 17, (uint64_t)"notify_register_dispatch(%u) failed", v22, v23, v24, v25, v26, v11);
        goto LABEL_37;
      }
      *(_DWORD *)(v8 + 12) = out_token;
      id v14 = objc_alloc_init(MEMORY[0x263F386E0]);
      v15 = *(void **)(v8 + 32);
      *(void *)(v8 + 32) = v14;

      id v16 = *(id *)(v8 + 32);
      [v16 activate];

      id v17 = *(id *)(v8 + 32);
      id v54 = 0;
      [v17 startMonitoringEventType:30 error:&v54];
      id v18 = v54;

      if (v18)
      {
        if (nrCopyLogObj_onceToken_7 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_7, &__block_literal_global_48);
        }
        v19 = (id)nrCopyLogObj_sNRLogObj_8;
        v20 = v19;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v42 = os_log_type_enabled(v19, OS_LOG_TYPE_FAULT);

          if (!v42)
          {
LABEL_37:

            objc_destroyWeak(&v56);
            objc_destroyWeak(&location);
            return;
          }
        }
        if (nrCopyLogObj_onceToken_7 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_7, &__block_literal_global_48);
        }
        id v43 = (id)nrCopyLogObj_sNRLogObj_8;
        _NRLogWithArgs((uint64_t)v43, 17, (uint64_t)"startMonitoringEventType(%@) failed", v44, v45, v46, v47, v48, (uint64_t)v18);

        goto LABEL_37;
      }
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __34__NRLaunchEventMonitor_startInner__block_invoke_2;
      v52[3] = &unk_263FD0FC8;
      objc_copyWeak(&v53, &location);
      id v27 = *(id *)(v8 + 32);
      [v27 setEventHandler:v52];

      context.version = 0;
      memset(&context.retain, 0, 24);
      context.info = (void *)v8;
      *(void *)(v8 + 48) = SCDynamicStoreCreate(0, @"NRLaunchEventMonitor", (SCDynamicStoreCallBack)scDynamicStoreCallout, &context);
      CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)*MEMORY[0x263F1BC10], @"ir0", (CFStringRef)*MEMORY[0x263F1BC70]);
      v29 = *(void **)(v8 + 56);
      *(void *)(v8 + 56) = NetworkInterfaceEntity;

      id v30 = *(id *)(v8 + 56);
      v59[0] = v30;
      CFArrayRef v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:1];

      SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(v8 + 48), v31, 0);
      v32 = *(const __SCDynamicStore **)(v8 + 48);
      v33 = *(id *)(v8 + 24);
      SCDynamicStoreSetDispatchQueue(v32, v33);

      v34 = *(NSObject **)(v8 + 24);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __34__NRLaunchEventMonitor_startInner__block_invoke_3;
      block[3] = &unk_263FD1428;
      block[4] = v8;
      CFArrayRef v50 = v31;
      CFArrayRef v35 = v31;
      dispatch_async(v34, block);

      objc_destroyWeak(&v53);
      objc_destroyWeak(&v56);
      objc_destroyWeak(&location);
      uint64_t v41 = *(void *)(a1 + 32);
      if (v41) {
        *(unsigned char *)(v41 + 8) = 1;
      }
      if (nrCopyLogObj_onceToken_7 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_7, &__block_literal_global_48);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_8, OS_LOG_TYPE_DEFAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_8, 0, (uint64_t)"%s%.30s:%-4d started launch event monitor", v36, v37, v38, v39, v40, (uint64_t)"");
      }
    }
    else
    {
      if (nrCopyLogObj_onceToken_7 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_7, &__block_literal_global_48);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_8, OS_LOG_TYPE_DEFAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_8, 0, (uint64_t)"%s%.30s:%-4d PHS proxy client not supported", a4, a5, a6, a7, a8, (uint64_t)"");
      }
    }
  }
}

void __34__NRLaunchEventMonitor_startInner__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((unsigned char *)WeakRetained + 9) && *((_DWORD *)WeakRetained + 3) == a2)
  {
    id v4 = WeakRetained;
    -[NRLaunchEventMonitor triggerLaunchIfNeeded]((uint64_t)WeakRetained);
    id WeakRetained = v4;
  }
}

void __34__NRLaunchEventMonitor_startInner__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 9)) {
    -[NRLaunchEventMonitor processCWFEvent:forced:]((uint64_t)WeakRetained, v5, 0);
  }
}

uint64_t __34__NRLaunchEventMonitor_startInner__block_invoke_3(uint64_t a1)
{
  -[NRLaunchEventMonitor processCWFEvent:forced:](*(void *)(a1 + 32), 0, 1);
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v3 = *(void **)(a1 + 40);
    return -[NRLaunchEventMonitor processSCDUpdate:](result, v3);
  }
  return result;
}

- (void)processCWFEvent:(int)a3 forced:
{
  id v5 = a2;
  v6 = v5;
  if (a1 && ([v5 type] == 30 || a3))
  {
    int v7 = *(_DWORD *)(a1 + 16) + 1;
    *(_DWORD *)(a1 + 16) = v7;
    dispatch_time_t v8 = dispatch_time(0, 2000000000);
    v9 = *(NSObject **)(a1 + 24);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__NRLaunchEventMonitor_processCWFEvent_forced___block_invoke;
    v10[3] = &unk_263FD0FF0;
    v10[4] = a1;
    int v11 = v7;
    dispatch_after(v8, v9, v10);
  }
}

- (uint64_t)processSCDUpdate:(uint64_t)a1
{
  CFArrayRef v3 = a2;
  CFArrayRef v4 = v3;
  if (!*(unsigned char *)(a1 + 9))
  {
    CFArrayRef v11 = v3;
    CFDictionaryRef v5 = SCDynamicStoreCopyMultiple(*(SCDynamicStoreRef *)(a1 + 48), v3, 0);
    if ([(__CFArray *)v11 containsObject:*(void *)(a1 + 56)])
    {
      v6 = [(__CFDictionary *)v5 objectForKeyedSubscript:*(void *)(a1 + 56)];
      int v7 = v6;
      if (v6)
      {
        dispatch_time_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F1BDB0]];
        int v9 = [v8 BOOLValue];
      }
      else
      {
        int v9 = 0;
      }
      if (v9 == (*(_DWORD *)(a1 + 40) & 1))
      {
      }
      else
      {
        -[NRLaunchEventMonitor setLaunchFlags:](a1, *(void *)(a1 + 40) ^ 1);

        -[NRLaunchEventMonitor triggerLaunchIfNeeded](a1);
      }
    }

    CFArrayRef v4 = v11;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

- (void)setLaunchFlags:(uint64_t)a1
{
  if (a1 && *(void *)(a1 + 40) != a2)
  {
    *(void *)(a1 + 40) = a2;
    if (nrCopyLogObj_onceToken_7 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_7, &__block_literal_global_48);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      CFArrayRef v4 = (objc_class *)MEMORY[0x263EFF980];
      id v5 = (id)nrCopyLogObj_sNRLogObj_8;
      id v6 = objc_alloc_init(v4);
      int v7 = v6;
      if (v3) {
        [v6 addObject:@"PHSClientActiveWithIR"];
      }
      if ((v3 & 2) != 0) {
        [v7 addObject:@"PHSClientActiveWithSoftAP"];
      }
      if ([v7 count])
      {
        dispatch_time_t v8 = [v7 componentsJoinedByString:@","];
      }
      else
      {
        dispatch_time_t v8 = &stru_26BE156B0;
      }
      id v14 = v8;

      _NRLogWithArgs((uint64_t)v5, 0, (uint64_t)"%s%.30s:%-4d updated launch flags: [%@]", v9, v10, v11, v12, v13, (uint64_t)"");
    }
  }
}

- (void)triggerLaunchIfNeeded
{
  if (a1 && *(void *)(a1 + 40))
  {
    if (nrCopyLogObj_onceToken_7 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_7, &__block_literal_global_48);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = *(void *)(a1 + 40);
      uint64_t v3 = (objc_class *)MEMORY[0x263EFF980];
      id v4 = (id)nrCopyLogObj_sNRLogObj_8;
      id v5 = objc_alloc_init(v3);
      id v6 = v5;
      if (v2) {
        [v5 addObject:@"PHSClientActiveWithIR"];
      }
      if ((v2 & 2) != 0) {
        [v6 addObject:@"PHSClientActiveWithSoftAP"];
      }
      if ([v6 count])
      {
        int v7 = [v6 componentsJoinedByString:@","];
      }
      else
      {
        int v7 = &stru_26BE156B0;
      }

      _NRLogWithArgs((uint64_t)v4, 0, (uint64_t)"%s%.30s:%-4d issuing launch notify w/ flags: %@", v8, v9, v10, v11, v12, (uint64_t)"");
    }
    if ((*(unsigned char *)(a1 + 40) & 3) != 0)
    {
      notify_post("com.apple.networkrelay.launch.phs");
    }
  }
}

void __47__NRLaunchEventMonitor_processCWFEvent_forced___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    if (*(unsigned char *)(v9 + 9)) {
      return;
    }
    if (*(_DWORD *)(a1 + 40) == *(_DWORD *)(v9 + 16))
    {
      uint64_t v10 = *(void **)(v9 + 32);
      goto LABEL_6;
    }
  }
  else if (!*(_DWORD *)(a1 + 40))
  {
    uint64_t v10 = 0;
LABEL_6:
    uint64_t v11 = [v10 currentKnownNetworkProfile];
    uint64_t v12 = *(void *)(a1 + 32);
    id v27 = v11;
    if (v12)
    {
      uint64_t v13 = *(void *)(v12 + 40);
      if (![v11 isPersonalHotspot] || (v13 & 2) != 0)
      {
        if ((v13 & 2) != 0 && ([v27 isPersonalHotspot] & 1) == 0)
        {
          if (nrCopyLogObj_onceToken_7 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_7, &__block_literal_global_48);
          }
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_8, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = nrCopyLogObj_19();
            _NRLogWithArgs((uint64_t)v20, 0, (uint64_t)"%s%.30s:%-4d Left PHS network", v21, v22, v23, v24, v25, (uint64_t)"");
          }
          uint64_t v26 = *(void *)(a1 + 32);
          if (v26) {
            -[NRLaunchEventMonitor setLaunchFlags:](v26, *(void *)(v26 + 40) & 0xFFFFFFFFFFFFFFFDLL);
          }
        }
        goto LABEL_26;
      }
    }
    else if (![v11 isPersonalHotspot])
    {
LABEL_26:

      return;
    }
    if (nrCopyLogObj_onceToken_7 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_7, &__block_literal_global_48);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_8, OS_LOG_TYPE_DEFAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_8, 0, (uint64_t)"%s%.30s:%-4d Joined PHS network", v14, v15, v16, v17, v18, (uint64_t)"");
    }
    uint64_t v19 = *(void *)(a1 + 32);
    if (v19)
    {
      -[NRLaunchEventMonitor setLaunchFlags:](v19, *(void *)(v19 + 40) | 2);
      uint64_t v19 = *(void *)(a1 + 32);
    }
    -[NRLaunchEventMonitor triggerLaunchIfNeeded](v19);
    goto LABEL_26;
  }
  if (nrCopyLogObj_onceToken_7 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_7, &__block_literal_global_48);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_8, OS_LOG_TYPE_DEBUG)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_8, 2, (uint64_t)"%s%.30s:%-4d Ignoring stale profile changed event", a4, a5, a6, a7, a8, (uint64_t)"");
  }
}

- (NRLaunchEventMonitor)init
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)NRLaunchEventMonitor;
  uint64_t v2 = [(NRLaunchEventMonitor *)&v16 init];
  if (!v2)
  {
    id v5 = nrCopyLogObj_19();
    id v6 = v5;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

      if (!v7)
      {
LABEL_10:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v14 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v14 = 136446210;
        *(void *)(v14 + 4) = "-[NRLaunchEventMonitor init]";
        id v15 = nrCopyLogObj_19();
        _NRLogAbortWithPack(v15);
      }
    }
    id v8 = nrCopyLogObj_19();
    _NRLogWithArgs((uint64_t)v8, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v9, v10, v11, v12, v13, (uint64_t)"");

    goto LABEL_10;
  }
  uint64_t v3 = v2;
  if (NRLaunchEventMonitorCopyQueue_onceToken != -1) {
    dispatch_once(&NRLaunchEventMonitorCopyQueue_onceToken, &__block_literal_global_64);
  }
  objc_storeStrong((id *)&v3->_queue, (id)NRLaunchEventMonitorCopyQueue_queue);
  return v3;
}

+ (id)copySharedMonitor
{
  if (copySharedMonitor_onceToken != -1) {
    dispatch_once(&copySharedMonitor_onceToken, &__block_literal_global_26);
  }
  uint64_t v2 = (void *)copySharedMonitor_monitor;
  return v2;
}

uint64_t __41__NRLaunchEventMonitor_copySharedMonitor__block_invoke()
{
  v0 = objc_alloc_init(NRLaunchEventMonitor);
  uint64_t v1 = copySharedMonitor_monitor;
  copySharedMonitor_monitor = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end