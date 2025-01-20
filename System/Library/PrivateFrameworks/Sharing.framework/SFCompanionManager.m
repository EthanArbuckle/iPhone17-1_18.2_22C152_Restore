@interface SFCompanionManager
+ (id)serviceManager;
- (NSMutableDictionary)services;
- (NSMutableDictionary)streamHandlers;
- (NSString)deviceID;
- (NSString)deviceIP;
- (NSString)deviceName;
- (NSString)identifier;
- (OS_dispatch_queue)serviceIdentifierQueue;
- (OS_dispatch_semaphore)managerSemaphore;
- (SFCompanionManager)init;
- (SFCompanionServiceManagerProtocol)managerProxy;
- (id)serviceForIdentifier:(id)a3;
- (id)streamDataForIdentifier:(id)a3;
- (void)dealloc;
- (void)disableStreamSupportForIdentifier:(id)a3;
- (void)getStreamsForData:(id)a3 withStreamHandler:(id)a4;
- (void)retrieveManagerProxy;
- (void)setDeviceID:(id)a3;
- (void)setDeviceIP:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setManagerProxy:(id)a3;
- (void)setManagerSemaphore:(id)a3;
- (void)setServiceIdentifierQueue:(id)a3;
- (void)setServices:(id)a3;
- (void)setStreamHandlers:(id)a3;
- (void)signalSemaphore;
- (void)streamToService:(id)a3 withFileHandle:(id)a4 acceptReply:(id)a5;
- (void)streamsFromFileHandle:(id)a3 withCompletionHandler:(id)a4;
- (void)supportStreamsWithIdentifier:(id)a3 withStreamHandler:(id)a4;
- (void)xpcManagerConnectionInterrupted;
- (void)xpcManagerDidInvalidate:(id)a3;
@end

@implementation SFCompanionManager

+ (id)serviceManager
{
  if (serviceManager_onceToken != -1) {
    dispatch_once(&serviceManager_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)serviceManager_serviceManager;

  return v2;
}

void __36__SFCompanionManager_serviceManager__block_invoke()
{
  v0 = objc_alloc_init(SFCompanionManager);
  v1 = (void *)serviceManager_serviceManager;
  serviceManager_serviceManager = (uint64_t)v0;
}

- (SFCompanionManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)SFCompanionManager;
  v2 = [(SFCompanionManager *)&v14 init];
  v3 = v2;
  if (v2)
  {
    managerProxy = v2->_managerProxy;
    v2->_managerProxy = 0;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    services = v3->_services;
    v3->_services = v5;

    v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = [v7 UUIDString];
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    streamHandlers = v3->_streamHandlers;
    v3->_streamHandlers = v10;

    v12 = +[SFCompanionXPCManager sharedManager];
    [v12 registerObserver:v3];

    [(SFCompanionManager *)v3 retrieveManagerProxy];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[SFCompanionXPCManager sharedManager];
  [v3 unregisterObserver:self];

  [(SFCompanionManager *)self signalSemaphore];
  v4.receiver = self;
  v4.super_class = (Class)SFCompanionManager;
  [(SFCompanionManager *)&v4 dealloc];
}

- (id)serviceForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SFCompanionManager *)self serviceIdentifierQueue];

  if (!v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.sharing.service-identifier-queue", 0);
    [(SFCompanionManager *)self setServiceIdentifierQueue:v6];
  }
  v7 = [(SFCompanionManager *)self serviceIdentifierQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SFCompanionManager_serviceForIdentifier___block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_sync(v7, block);

  uint64_t v8 = [(SFCompanionManager *)self services];
  v9 = [v8 objectForKeyedSubscript:v4];

  v10 = [v9 deviceID];

  if (!v10)
  {
    v11 = streams_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SFCompanionManager serviceForIdentifier:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }

  return v9;
}

void __43__SFCompanionManager_serviceForIdentifier___block_invoke(uint64_t a1)
{
  id v12 = +[SFCompanionXPCManager sharedManager];
  if ([v12 isInvalid])
  {
  }
  else
  {
    v2 = [*(id *)(a1 + 32) managerProxy];

    if (!v2)
    {
      v3 = streams_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Waiting for manager proxy", buf, 2u);
      }

      dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
      uint64_t v5 = *(void *)(a1 + 32);
      dispatch_queue_t v6 = *(void **)(v5 + 72);
      *(void *)(v5 + 72) = v4;

      dispatch_time_t v7 = dispatch_time(0, 4000000000);
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 72), v7);
      id v8 = *(id *)(a1 + 32);
      objc_sync_enter(v8);
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = *(void **)(v9 + 72);
      *(void *)(v9 + 72) = 0;

      objc_sync_exit(v8);
      v11 = streams_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_1A5389000, v11, OS_LOG_TYPE_DEFAULT, "Finished Wait", v13, 2u);
      }
    }
  }
}

- (id)streamDataForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCompanionManager *)self serviceForIdentifier:v4];
  dispatch_queue_t v6 = v5;
  if (v5)
  {
    dispatch_time_t v7 = [v5 messageData];
  }
  else
  {
    dispatch_time_t v7 = 0;
  }

  return v7;
}

- (void)retrieveManagerProxy
{
  if (self->_managerProxy)
  {
    v2 = streams_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v6 = 0;
      _os_log_impl(&dword_1A5389000, v2, OS_LOG_TYPE_DEFAULT, "Trying to retrieve manager proxy when one already exists", v6, 2u);
    }
  }
  else
  {
    id v4 = +[SFCompanionXPCManager sharedManager];
    identifier = self->_identifier;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__SFCompanionManager_retrieveManagerProxy__block_invoke;
    v7[3] = &unk_1E5BBE4C8;
    v7[4] = self;
    [v4 serviceManagerProxyForIdentifier:identifier client:self withCompletionHandler:v7];
  }
}

void __42__SFCompanionManager_retrieveManagerProxy__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v11 && v12 && v13)
  {
    [*(id *)(a1 + 32) setManagerProxy:v11];
    [*(id *)(a1 + 32) setDeviceName:v12];
    [*(id *)(a1 + 32) setDeviceID:v13];
    [*(id *)(a1 + 32) setDeviceIP:v14];
    uint64_t v16 = *(id *)(a1 + 32);
    objc_sync_enter(v16);
    [*(id *)(*(void *)(a1 + 32) + 48) allValues];
    id v22 = v15;
    id v23 = v11;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v17);
          }
          v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          objc_msgSend(v21, "setDeviceName:", v12, v22, v23, (void)v24);
          [v21 setDeviceID:v13];
          [v21 setIpAddress:v14];
          [*(id *)(*(void *)(a1 + 32) + 16) enableService:v21];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v38 count:16];
      }
      while (v18);
    }

    id v15 = v22;
    id v11 = v23;

    objc_sync_exit(v16);
  }
  else
  {
    uint64_t v16 = streams_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413314;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v12;
      __int16 v32 = 2112;
      id v33 = v13;
      __int16 v34 = 2112;
      id v35 = v14;
      __int16 v36 = 2112;
      id v37 = v15;
      _os_log_error_impl(&dword_1A5389000, v16, OS_LOG_TYPE_ERROR, "Error retrieving proxy object. Returned values (proxy = %@, deviceName = %@, deviceID = %@, deviceIP = %@, error = %@)", buf, 0x34u);
    }
  }

  [*(id *)(a1 + 32) signalSemaphore];
}

- (void)signalSemaphore
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_managerSemaphore)
  {
    v3 = streams_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Signaling the semaphore", v4, 2u);
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)v2->_managerSemaphore);
  }
  objc_sync_exit(v2);
}

- (void)streamToService:(id)a3 withFileHandle:(id)a4 acceptReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  if (v9)
  {
    streamHandlers = self->_streamHandlers;
    id v12 = [v8 identifier];
    id v13 = [(NSMutableDictionary *)streamHandlers objectForKeyedSubscript:v12];

    if (v13)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __65__SFCompanionManager_streamToService_withFileHandle_acceptReply___block_invoke;
      v29[3] = &unk_1E5BBE4F0;
      id v31 = &v32;
      __int16 v30 = v13;
      [(SFCompanionManager *)self streamsFromFileHandle:v9 withCompletionHandler:v29];
      id v14 = v30;
    }
    else
    {
      id v14 = streams_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SFCompanionManager streamToService:withFileHandle:acceptReply:](v14, v22, v23, v24, v25, v26, v27, v28);
      }
    }
  }
  else
  {
    id v13 = streams_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SFCompanionManager streamToService:withFileHandle:acceptReply:](v13, v15, v16, v17, v18, v19, v20, v21);
    }
  }

  v10[2](v10, *((unsigned __int8 *)v33 + 24));
  _Block_object_dispose(&v32, 8);
}

uint64_t __65__SFCompanionManager_streamToService_withFileHandle_acceptReply___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
    {
      uint64_t v3 = result;
      result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
      *(unsigned char *)(*(void *)(*(void *)(v3 + 40) + 8) + 24) = result;
    }
  }
  return result;
}

- (void)xpcManagerConnectionInterrupted
{
  managerProxy = self->_managerProxy;
  self->_managerProxy = 0;

  id v4 = streams_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_DEFAULT, "XPC Manager connection interrupted", v5, 2u);
  }

  [(SFCompanionManager *)self retrieveManagerProxy];
}

- (void)xpcManagerDidInvalidate:(id)a3
{
  managerProxy = self->_managerProxy;
  self->_managerProxy = 0;

  [(SFCompanionManager *)self signalSemaphore];
}

- (void)getStreamsForData:(id)a3 withStreamHandler:(id)a4
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v14 = 0;
  v15[0] = 0;
  id v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:v15 error:&v14];
  id v9 = v14;
  if (v9)
  {
    v10 = streams_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SFCompanionManager getStreamsForData:withStreamHandler:]((uint64_t)v9, v15, v10);
    }

    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v9);
  }
  else
  {
    id v11 = +[SFCompanionXPCManager sharedManager];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__SFCompanionManager_getStreamsForData_withStreamHandler___block_invoke;
    v12[3] = &unk_1E5BBE540;
    v12[4] = self;
    id v13 = v7;
    [v11 streamsForMessage:v8 withCompletionHandler:v12];
  }
}

void __58__SFCompanionManager_getStreamsForData_withStreamHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__SFCompanionManager_getStreamsForData_withStreamHandler___block_invoke_2;
    v9[3] = &unk_1E5BBE518;
    id v8 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v8 streamsFromFileHandle:v5 withCompletionHandler:v9];
  }
  else if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __58__SFCompanionManager_getStreamsForData_withStreamHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)supportStreamsWithIdentifier:(id)a3 withStreamHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [[SFCompanionService alloc] initWithServiceName:v6];
  [(SFCompanionService *)v9 setManagerID:v8->_identifier];
  id v10 = [(SFCompanionManager *)v8 deviceName];
  [(SFCompanionService *)v9 setDeviceName:v10];

  id v11 = [(SFCompanionManager *)v8 deviceID];
  [(SFCompanionService *)v9 setDeviceID:v11];

  id v12 = [(SFCompanionManager *)v8 deviceIP];
  [(SFCompanionService *)v9 setIpAddress:v12];

  [(NSMutableDictionary *)v8->_services setObject:v9 forKeyedSubscript:v6];
  if (v7)
  {
    id v13 = streams_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5389000, v13, OS_LOG_TYPE_DEFAULT, "Storing stream handler", buf, 2u);
    }

    id v14 = (void *)[v7 copy];
    uint64_t v15 = _Block_copy(v14);
    streamHandlers = v8->_streamHandlers;
    uint64_t v17 = [(SFCompanionService *)v9 identifier];
    [(NSMutableDictionary *)streamHandlers setObject:v15 forKeyedSubscript:v17];
  }
  managerProxy = v8->_managerProxy;
  if (managerProxy)
  {
    [(SFCompanionServiceManagerProtocol *)managerProxy enableService:v9];
  }
  else
  {
    uint64_t v19 = streams_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_1A5389000, v19, OS_LOG_TYPE_DEFAULT, "Service enabled before manager proxy retrieved", v20, 2u);
    }
  }
  objc_sync_exit(v8);
}

- (void)disableStreamSupportForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_services objectForKeyedSubscript:v4];
  id v7 = v6;
  if (v6 && ([v6 identifier], id v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    managerProxy = v5->_managerProxy;
    if (managerProxy) {
      [(SFCompanionServiceManagerProtocol *)managerProxy disableService:v7];
    }
    [(NSMutableDictionary *)v5->_services removeObjectForKey:v4];
    streamHandlers = v5->_streamHandlers;
    id v11 = [v7 identifier];
    [(NSMutableDictionary *)streamHandlers removeObjectForKey:v11];
  }
  else
  {
    id v11 = streams_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1A5389000, v11, OS_LOG_TYPE_DEFAULT, "Trying to disable service that has never been enabled", v12, 2u);
    }
  }

  objc_sync_exit(v5);
}

- (void)streamsFromFileHandle:(id)a3 withCompletionHandler:(id)a4
{
  CFWriteStreamRef stream = 0;
  CFReadStreamRef readStream = 0;
  id v5 = (void (**)(id, CFReadStreamRef, CFWriteStreamRef))a4;
  id v6 = a3;
  CFSocketNativeHandle v7 = dup([v6 fileDescriptor]);
  CFStreamCreatePairWithSocket(0, v7, &readStream, &stream);
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D480];
  id v9 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFReadStreamSetProperty(readStream, (CFStreamPropertyKey)*MEMORY[0x1E4F1D480], (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
  CFWriteStreamSetProperty(stream, v8, v9);
  [v6 closeFile];

  v5[2](v5, readStream, stream);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (SFCompanionServiceManagerProtocol)managerProxy
{
  return (SFCompanionServiceManagerProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setManagerProxy:(id)a3
{
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)deviceIP
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceIP:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSMutableDictionary)services
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServices:(id)a3
{
}

- (NSMutableDictionary)streamHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStreamHandlers:(id)a3
{
}

- (OS_dispatch_queue)serviceIdentifierQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setServiceIdentifierQueue:(id)a3
{
}

- (OS_dispatch_semaphore)managerSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 72, 1);
}

- (void)setManagerSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managerSemaphore, 0);
  objc_storeStrong((id *)&self->_serviceIdentifierQueue, 0);
  objc_storeStrong((id *)&self->_streamHandlers, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIP, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_managerProxy, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)serviceForIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)streamDataForIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "Caught exception getting endpoint data %@", (uint8_t *)&v2, 0xCu);
}

- (void)streamToService:(uint64_t)a3 withFileHandle:(uint64_t)a4 acceptReply:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)streamToService:(uint64_t)a3 withFileHandle:(uint64_t)a4 acceptReply:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getStreamsForData:(os_log_t)log withStreamHandler:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1A5389000, log, OS_LOG_TYPE_ERROR, "Deserialization error = %@, format = %ld", (uint8_t *)&v4, 0x16u);
}

@end