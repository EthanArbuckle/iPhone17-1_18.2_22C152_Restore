@interface SSXPCServer
+ (id)mainServer;
- (SSXPCServer)init;
- (SSXPCServer)initWithServiceName:(id)a3;
- (SSXPCServer)initWithServiceName:(id)a3 entitlement:(id)a4 queue:(id)a5;
- (void)_dispatchMessage:(id)a3 connection:(id)a4;
- (void)_recordCoreAnalyticsEventForClient:(id)a3 andSelector:(id)a4;
- (void)addObserver:(id)a3 selector:(SEL)a4 forMessage:(int64_t)a5;
- (void)dealloc;
- (void)removeObserver:(id)a3 selector:(SEL)a4 forMessage:(int64_t)a5;
- (void)start;
@end

@implementation SSXPCServer

void __43__SSXPCServer__dispatchMessage_connection___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "0"));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "objectForKey:", v2), "copy");
}

uint64_t __62__SSXPCServer__recordCoreAnalyticsEventForClient_andSelector___block_invoke(void *a1)
{
  if (a1[4]) {
    id v2 = (__CFString *)a1[4];
  }
  else {
    id v2 = @"No Client";
  }
  if (a1[5]) {
    v3 = (__CFString *)a1[5];
  }
  else {
    v3 = @"No Selector";
  }
  uint64_t v4 = [NSString stringWithFormat:@"%@-%@", v2, v3];
  uint64_t result = [*(id *)(a1[6] + 56) containsObject:v4];
  if ((result & 1) == 0)
  {
    [*(id *)(a1[6] + 56) addObject:v4];
    return AnalyticsSendEventLazy();
  }
  return result;
}

- (void)_dispatchMessage:(id)a3 connection:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  memset(v81, 0, sizeof(v81));
  xpc_connection_get_audit_token();
  v65 = (void *)CPCopyBundleIdentifierFromAuditToken();
  int v4 = MKBDeviceUnlockedSinceBoot();
  int v5 = v4;
  if (v4 != 1)
  {
    if (v4)
    {
      id v6 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v6) {
        id v6 = +[SSLogConfig sharedConfig];
      }
      int v10 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v11 = v10 | 2;
      }
      else {
        int v11 = v10;
      }
      if (os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_FAULT)) {
        int v12 = v11;
      }
      else {
        int v12 = v11 & 2;
      }
      if (!v12) {
        goto LABEL_25;
      }
      LODWORD(v81[0]) = 138543618;
      *(void *)((char *)v81 + 4) = objc_opt_class();
      WORD6(v81[0]) = 1024;
      *(_DWORD *)((char *)v81 + 14) = v5;
      LODWORD(v61) = 18;
      v60 = (int *)v81;
    }
    else
    {
      id v6 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v6) {
        id v6 = +[SSLogConfig sharedConfig];
      }
      int v7 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v8 = v7 | 2;
      }
      else {
        int v8 = v7;
      }
      if (os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_ERROR)) {
        int v9 = v8;
      }
      else {
        int v9 = v8 & 2;
      }
      if (!v9) {
        goto LABEL_25;
      }
      LODWORD(v81[0]) = 138543362;
      *(void *)((char *)v81 + 4) = objc_opt_class();
      LODWORD(v61) = 12;
      v60 = (int *)v81;
    }
    v13 = (void *)_os_log_send_and_compose_impl();
    if (v13)
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, v81, v61);
      free(v13);
      SSFileLog(v6, @"%@", v15, v16, v17, v18, v19, v20, v14);
    }
LABEL_25:
    [(SSXPCServer *)self _recordCoreAnalyticsEventForClient:v65, @"beforeFirstUnlockClient", v60 andSelector];
    xpc_connection_cancel((xpc_connection_t)a4);
  }
  CFStringRef entitlementName = (const __CFString *)self->_entitlementName;
  if (entitlementName && !SSXPCConnectionHasEntitlement((uint64_t)a4, entitlementName))
  {
    id v45 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v45) {
      id v45 = +[SSLogConfig sharedConfig];
    }
    int v46 = [v45 shouldLog];
    if ([v45 shouldLogToDisk]) {
      int v47 = v46 | 2;
    }
    else {
      int v47 = v46;
    }
    if (os_log_type_enabled((os_log_t)[v45 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      int v48 = v47;
    }
    else {
      int v48 = v47 & 2;
    }
    if (v48)
    {
      uint64_t v49 = objc_opt_class();
      v50 = self->_entitlementName;
      LODWORD(v81[0]) = 138412546;
      *(void *)((char *)v81 + 4) = v49;
      WORD6(v81[0]) = 2112;
      *(void *)((char *)v81 + 14) = v50;
      LODWORD(v61) = 22;
      v60 = (int *)v81;
      uint64_t v51 = _os_log_send_and_compose_impl();
      if (v51)
      {
        v52 = (void *)v51;
        uint64_t v53 = objc_msgSend(NSString, "stringWithCString:encoding:", v51, 4, v81, v61);
        free(v52);
        SSFileLog(v45, @"%@", v54, v55, v56, v57, v58, v59, v53);
      }
    }
    [(SSXPCServer *)self _recordCoreAnalyticsEventForClient:v65, @"unentitledClient", v60 andSelector];
  }
  else
  {
    *(void *)&v81[0] = 0;
    *((void *)&v81[0] + 1) = v81;
    *(void *)&v81[1] = 0x3052000000;
    *((void *)&v81[1] + 1) = __Block_byref_object_copy__37;
    v82 = __Block_byref_object_dispose__37;
    uint64_t v83 = 0;
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__SSXPCServer__dispatchMessage_connection___block_invoke;
    block[3] = &unk_1E5BABCF0;
    block[5] = self;
    block[6] = v81;
    block[4] = a3;
    dispatch_sync(dispatchQueue, block);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = *(id *)(*((void *)&v81[0] + 1) + 40);
    uint64_t v23 = [obj countByEnumeratingWithState:&v67 objects:v80 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v68 != v24) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          v27 = NSStringFromSelector((SEL)[v26 selector]);
          id v28 = +[SSLogConfig sharedDaemonConfig];
          if (!v28) {
            id v28 = +[SSLogConfig sharedConfig];
          }
          int v29 = [v28 shouldLog];
          int v30 = [v28 shouldLogToDisk];
          v31 = [v28 OSLogObject];
          if (v30) {
            v29 |= 2u;
          }
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
            int v32 = v29;
          }
          else {
            int v32 = v29 & 2;
          }
          if (v32)
          {
            uint64_t v33 = objc_opt_class();
            [v26 observer];
            v34 = (objc_class *)objc_opt_class();
            v35 = NSStringFromClass(v34);
            int v72 = 138544130;
            uint64_t v73 = v33;
            __int16 v74 = 2114;
            v75 = v65;
            __int16 v76 = 2112;
            v77 = v35;
            __int16 v78 = 2112;
            v79 = v27;
            LODWORD(v61) = 42;
            v60 = &v72;
            uint64_t v36 = _os_log_send_and_compose_impl();
            if (v36)
            {
              v37 = (void *)v36;
              uint64_t v38 = objc_msgSend(NSString, "stringWithCString:encoding:", v36, 4, &v72, v61);
              free(v37);
              SSFileLog(v28, @"%@", v39, v40, v41, v42, v43, v44, v38);
            }
          }
          objc_msgSend((id)objc_msgSend(v26, "observer", v60), (SEL)objc_msgSend(v26, "selector"), a3, a4);
          [(SSXPCServer *)self _recordCoreAnalyticsEventForClient:v65 andSelector:v27];
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v67 objects:v80 count:16];
      }
      while (v23);
    }

    _Block_object_dispose(v81, 8);
  }
}

- (void)_recordCoreAnalyticsEventForClient:(id)a3 andSelector:(id)a4
{
  if (+[SSDevice deviceIsInternalBuild])
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SSXPCServer__recordCoreAnalyticsEventForClient_andSelector___block_invoke;
    block[3] = &unk_1E5BA8630;
    block[4] = a3;
    block[5] = a4;
    block[6] = self;
    dispatch_sync(dispatchQueue, block);
  }
}

uint64_t __20__SSXPCServer_start__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2 != MEMORY[0x1E4F14528])
  {
    uint64_t v3 = result;
    uint64_t result = MEMORY[0x1A62689E0](a2);
    if (result == MEMORY[0x1E4F14590])
    {
      uint64_t v4 = *(void *)(v3 + 32);
      int v5 = *(void **)(*(void *)(*(void *)(v3 + 40) + 8) + 40);
      return [v5 _dispatchMessage:a2 connection:v4];
    }
  }
  return result;
}

uint64_t __20__SSXPCServer_start__block_invoke(uint64_t a1, _xpc_connection_s *a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v5 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14578])
  {
    xpc_connection_set_target_queue(a2, *(dispatch_queue_t *)(a1 + 32));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __20__SSXPCServer_start__block_invoke_2;
    v8[3] = &unk_1E5BAB6E0;
    uint64_t v6 = *(void *)(a1 + 40);
    v8[4] = a2;
    v8[5] = v6;
    xpc_connection_set_event_handler(a2, v8);
    xpc_connection_resume(a2);
  }

  return [v4 drain];
}

- (SSXPCServer)init
{
  return [(SSXPCServer *)self initWithServiceName:0];
}

- (SSXPCServer)initWithServiceName:(id)a3
{
  return [(SSXPCServer *)self initWithServiceName:a3 entitlement:0 queue:0];
}

- (SSXPCServer)initWithServiceName:(id)a3 entitlement:(id)a4 queue:(id)a5
{
  if (a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)SSXPCServer;
    int v8 = [(SSXPCServer *)&v10 init];
    if (v8)
    {
      v8->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSXPCServer", 0);
      v8->_CFStringRef entitlementName = (NSString *)[a4 copy];
      v8->_observers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v8->_serviceName = (NSString *)[a3 copy];
      v8->_xpcRequestsCache = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      if (a5)
      {
        v8->_observerQueue = (OS_dispatch_queue *)a5;
        dispatch_retain((dispatch_object_t)a5);
      }
    }
  }
  else
  {

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid service name"];
    return 0;
  }
  return v8;
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  listener = self->_listener;
  if (listener) {
    xpc_release(listener);
  }
  observerQueue = self->_observerQueue;
  if (observerQueue) {
    dispatch_release(observerQueue);
  }

  v6.receiver = self;
  v6.super_class = (Class)SSXPCServer;
  [(SSXPCServer *)&v6 dealloc];
}

+ (id)mainServer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__SSXPCServer_mainServer__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = a1;
  if (mainServer_sOnce != -1) {
    dispatch_once(&mainServer_sOnce, block);
  }
  return (id)mainServer_sMainServer;
}

uint64_t __25__SSXPCServer_mainServer__block_invoke()
{
  mainServer_sMainServerQueue = (uint64_t)dispatch_queue_create("com.apple.StoreServices.SSXPCServer.main", 0);
  uint64_t result = [objc_alloc((Class)objc_opt_class()) initWithServiceName:@"com.apple.itunesstored.xpc" entitlement:0 queue:mainServer_sMainServerQueue];
  mainServer_sMainServer = result;
  return result;
}

- (void)addObserver:(id)a3 selector:(SEL)a4 forMessage:(int64_t)a5
{
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SSXPCServer_addObserver_selector_forMessage___block_invoke;
  v6[3] = &unk_1E5BABCC8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a5;
  v6[7] = a4;
  dispatch_sync(dispatchQueue, v6);
}

void __47__SSXPCServer_addObserver_selector_forMessage___block_invoke(void *a1)
{
  id v5 = (id)[objc_alloc(NSNumber) initWithLongLong:a1[6]];
  id v2 = (id)objc_msgSend(*(id *)(a1[4] + 40), "objectForKey:");
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(a1[4] + 40) setObject:v2 forKey:v5];
    id v3 = v2;
  }
  id v4 = objc_alloc_init(SSXPCServerObserver);
  [(SSXPCServerObserver *)v4 setObserver:a1[5]];
  [(SSXPCServerObserver *)v4 setSelector:a1[7]];
  [v2 addObject:v4];
}

- (void)removeObserver:(id)a3 selector:(SEL)a4 forMessage:(int64_t)a5
{
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SSXPCServer_removeObserver_selector_forMessage___block_invoke;
  v6[3] = &unk_1E5BABCC8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a5;
  v6[7] = a4;
  dispatch_sync(dispatchQueue, v6);
}

void __50__SSXPCServer_removeObserver_selector_forMessage___block_invoke(void *a1)
{
  id v6 = (id)[objc_alloc(NSNumber) initWithLongLong:a1[6]];
  uint64_t v2 = objc_msgSend(*(id *)(a1[4] + 40), "objectForKey:");
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = objc_alloc_init(SSXPCServerObserver);
    [(SSXPCServerObserver *)v4 setObserver:a1[5]];
    [(SSXPCServerObserver *)v4 setSelector:a1[7]];
    uint64_t v5 = [v3 indexOfObject:a1[5]];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
      [v3 removeObjectAtIndex:v5];
    }
  }
}

- (void)start
{
  observerQueue = self->_observerQueue;
  if (!observerQueue) {
    observerQueue = dispatch_get_global_queue(0, 0);
  }
  mach_service = xpc_connection_create_mach_service([(NSString *)self->_serviceName UTF8String], observerQueue, 1uLL);
  self->_listener = mach_service;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = __Block_byref_object_copy__37;
  v6[4] = __Block_byref_object_dispose__37;
  v6[5] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __20__SSXPCServer_start__block_invoke;
  v5[3] = &unk_1E5BAB6E0;
  v5[4] = observerQueue;
  v5[5] = v6;
  xpc_connection_set_event_handler(mach_service, v5);
  xpc_connection_resume(self->_listener);
  _Block_object_dispose(v6, 8);
}

uint64_t __62__SSXPCServer__recordCoreAnalyticsEventForClient_andSelector___block_invoke_2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v2[0] = @"Client";
  v2[1] = @"Selector";
  long long v3 = *(_OWORD *)(a1 + 32);
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v3 forKeys:v2 count:2];
}

@end