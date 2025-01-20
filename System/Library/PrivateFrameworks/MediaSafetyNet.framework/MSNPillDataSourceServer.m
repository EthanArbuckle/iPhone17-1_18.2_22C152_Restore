@interface MSNPillDataSourceServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldQueryPillDataSource;
- (MSNPillDataSourceServer)initWithQueue:(id)a3;
- (NSMutableArray)activeDataSources;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (STCallingStatusDomain)callingDomain;
- (STCallingStatusDomainData)callingData;
- (STDynamicActivityAttributionMonitor)systemStatusDynamicAttributionMonitor;
- (void)_callingDataUpdatedWithData:(id)a3;
- (void)dealloc;
- (void)fetchPillRegistrationForProcess:(id)a3 withCompletion:(id)a4;
- (void)registerPillDataSourceForIdentifiers:(id)a3;
- (void)setCallingData:(id)a3;
- (void)setCallingDomain:(id)a3;
@end

@implementation MSNPillDataSourceServer

- (MSNPillDataSourceServer)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSNPillDataSourceServer;
  v6 = [(MSNPillDataSourceServer *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    activeDataSources = v6->_activeDataSources;
    v6->_activeDataSources = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_queue, a3);
    queue = v6->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__MSNPillDataSourceServer_initWithQueue___block_invoke;
    block[3] = &unk_1E6CA01D0;
    v12 = v6;
    dispatch_sync(queue, block);
  }
  return v6;
}

void __41__MSNPillDataSourceServer_initWithQueue___block_invoke(uint64_t a1)
{
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v2 = (void *)getSTDynamicActivityAttributionMonitorClass_softClass;
  uint64_t v29 = getSTDynamicActivityAttributionMonitorClass_softClass;
  if (!getSTDynamicActivityAttributionMonitorClass_softClass)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getSTDynamicActivityAttributionMonitorClass_block_invoke;
    v24 = &unk_1E6CA0270;
    v25 = &v26;
    __getSTDynamicActivityAttributionMonitorClass_block_invoke((uint64_t)&v21);
    v2 = (void *)v27[3];
  }
  v3 = v2;
  _Block_object_dispose(&v26, 8);
  id v4 = objc_alloc_init(v3);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v4;

  [*(id *)(*(void *)(a1 + 32) + 32) activate];
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  uint64_t v7 = (void *)getSTCallingStatusDomainClass_softClass;
  uint64_t v29 = getSTCallingStatusDomainClass_softClass;
  if (!getSTCallingStatusDomainClass_softClass)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getSTCallingStatusDomainClass_block_invoke;
    v24 = &unk_1E6CA0270;
    v25 = &v26;
    __getSTCallingStatusDomainClass_block_invoke((uint64_t)&v21);
    uint64_t v7 = (void *)v27[3];
  }
  v8 = v7;
  _Block_object_dispose(&v26, 8);
  id v9 = objc_alloc_init(v8);
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  v12 = *(void **)(*(void *)(a1 + 32) + 40);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __41__MSNPillDataSourceServer_initWithQueue___block_invoke_2;
  v18[3] = &unk_1E6CA01A8;
  objc_copyWeak(&v19, &location);
  [v12 observeDataWithBlock:v18];
  objc_super v13 = *(id **)(a1 + 32);
  v14 = [v13[5] data];
  [v13 _callingDataUpdatedWithData:v14];

  uint64_t v15 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.mediasafetynet.pill"];
  uint64_t v16 = *(void *)(a1 + 32);
  v17 = *(void **)(v16 + 24);
  *(void *)(v16 + 24) = v15;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 24) resume];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __41__MSNPillDataSourceServer_initWithQueue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__MSNPillDataSourceServer_initWithQueue___block_invoke_3;
  v8[3] = &unk_1E6CA0180;
  id v9 = WeakRetained;
  id v10 = v3;
  id v6 = v3;
  id v7 = WeakRetained;
  dispatch_async(v5, v8);
}

uint64_t __41__MSNPillDataSourceServer_initWithQueue___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callingDataUpdatedWithData:*(void *)(a1 + 40)];
}

- (void)_callingDataUpdatedWithData:(id)a3
{
  id v5 = a3;
  id v4 = [(MSNPillDataSourceServer *)self queue];
  dispatch_assert_queue_V2(v4);

  [(MSNPillDataSourceServer *)self setCallingData:v5];
}

- (void)dealloc
{
  [(STDynamicActivityAttributionMonitor *)self->_systemStatusDynamicAttributionMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MSNPillDataSourceServer;
  [(MSNPillDataSourceServer *)&v3 dealloc];
}

- (BOOL)shouldQueryPillDataSource
{
  objc_super v3 = [(MSNPillDataSourceServer *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MSNPillDataSourceServer *)self systemStatusDynamicAttributionMonitor];
  id v5 = [v4 currentAttributions];
  if ([v5 count])
  {
    id v6 = [(MSNPillDataSourceServer *)self activeDataSources];
    BOOL v7 = [v6 count] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)fetchPillRegistrationForProcess:(id)a3 withCompletion:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  v33 = (void (**)(id, void))a4;
  v34 = self;
  id v6 = [(MSNPillDataSourceServer *)self queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  int v52 = 0;
  BOOL v7 = [(MSNPillDataSourceServer *)self activeDataSources];
  LODWORD(self) = [v7 count] == 0;

  if (self)
  {
    v30 = MSNLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[MSNPillDataSourceServer fetchPillRegistrationForProcess:withCompletion:](v30);
    }

    v33[2](v33, *((unsigned int *)v50 + 6));
  }
  else
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v8 = [(MSNPillDataSourceServer *)v34 systemStatusDynamicAttributionMonitor];
    id v9 = [v8 currentAttributions];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v56 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v46;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_super v13 = *(void **)(*((void *)&v45 + 1) + 8 * v12);
        v14 = [v13 clientExecutablePath];
        uint64_t v15 = [v14 lastPathComponent];
        char v16 = [v15 isEqualToString:v32];

        if (v16) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v56 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v17 = v13;

      if (!v17) {
        goto LABEL_25;
      }
      v18 = dispatch_group_create();
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v19 = [(MSNPillDataSourceServer *)v34 activeDataSources];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v55 count:16];
      if (v20)
      {
        uint64_t v22 = *(void *)v42;
        *(void *)&long long v21 = 138412290;
        long long v31 = v21;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v42 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * i), "connection", v31);
            v25 = [v24 remoteObjectProxy];

            if (v25)
            {
              dispatch_group_enter(v18);
              uint64_t v26 = [v17 bundleIdentifier];
              v38[0] = MEMORY[0x1E4F143A8];
              v38[1] = 3221225472;
              v38[2] = __74__MSNPillDataSourceServer_fetchPillRegistrationForProcess_withCompletion___block_invoke;
              v38[3] = &unk_1E6CA01F8;
              v38[4] = v34;
              v40 = &v49;
              v39 = v18;
              [v25 currentStatusDescriptorForIdentifier:v26 reply:v38];
            }
            else
            {
              *((_DWORD *)v50 + 6) = 1;
              v27 = MSNLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v31;
                id v54 = v32;
                _os_log_debug_impl(&dword_1DC736000, v27, OS_LOG_TYPE_DEBUG, "Dont have data source tracking the attribution for client: %@", buf, 0xCu);
              }

              v33[2](v33, *((unsigned int *)v50 + 6));
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v55 count:16];
        }
        while (v20);
      }

      uint64_t v28 = [(MSNPillDataSourceServer *)v34 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__MSNPillDataSourceServer_fetchPillRegistrationForProcess_withCompletion___block_invoke_27;
      block[3] = &unk_1E6CA0220;
      v36 = v33;
      v37 = &v49;
      dispatch_group_notify(v18, v28, block);
    }
    else
    {
LABEL_10:

LABEL_25:
      uint64_t v29 = MSNLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[MSNPillDataSourceServer fetchPillRegistrationForProcess:withCompletion:]((uint64_t)v32, v29);
      }

      v33[2](v33, *((unsigned int *)v50 + 6));
    }
  }
  _Block_object_dispose(&v49, 8);
}

void __74__MSNPillDataSourceServer_fetchPillRegistrationForProcess_withCompletion___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    objc_super v3 = (void *)a1[4];
    id v4 = a2;
    id v5 = [v3 callingData];
    id v6 = [v5 callDescriptors];
    int v7 = [v6 containsObject:v4];

    if (v7) {
      int v8 = 2;
    }
    else {
      int v8 = 3;
    }
  }
  else
  {
    int v8 = 3;
  }
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = v8;
  id v9 = a1[5];

  dispatch_group_leave(v9);
}

uint64_t __74__MSNPillDataSourceServer_fetchPillRegistrationForProcess_withCompletion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = [v5 valueForEntitlement:@"com.apple.private.mediasafetynet.pilldatasource"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    int v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F37C5808];
    [v5 setExportedInterface:v8];

    id v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F37C6498];
    [v5 setRemoteObjectInterface:v9];

    [v5 setExportedObject:self];
    uint64_t v10 = [(MSNPillDataSourceServer *)self queue];
    [v5 _setQueue:v10];

    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    char v16 = __62__MSNPillDataSourceServer_listener_shouldAcceptNewConnection___block_invoke;
    id v17 = &unk_1E6CA0180;
    v18 = self;
    id v11 = v5;
    id v19 = v11;
    uint64_t v12 = (void *)MEMORY[0x1E01A2850](&v14);
    objc_msgSend(v11, "setInterruptionHandler:", v12, v14, v15, v16, v17, v18);
    [v11 setInvalidationHandler:v12];
    [v11 resume];
  }
  return v7;
}

void __62__MSNPillDataSourceServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = MSNLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC736000, v2, OS_LOG_TYPE_DEFAULT, "Connection gone.", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__MSNPillDataSourceServer_listener_shouldAcceptNewConnection___block_invoke_39;
  v5[3] = &unk_1E6CA0180;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

void __62__MSNPillDataSourceServer_listener_shouldAcceptNewConnection___block_invoke_39(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "connection", (void)v13);
        uint64_t v10 = *(void **)(a1 + 40);

        if (v9 == v10) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  id v11 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v12 = (void *)[v2 copy];
  [v11 removeObjectsInArray:v12];
}

- (void)registerPillDataSourceForIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v6 = [(MSNPillDataSourceServer *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MSNPillDataSourceServer_registerPillDataSourceForIdentifiers___block_invoke;
  block[3] = &unk_1E6CA0248;
  id v10 = v5;
  id v11 = v4;
  uint64_t v12 = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __64__MSNPillDataSourceServer_registerPillDataSourceForIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = MSNLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1DC736000, v2, OS_LOG_TYPE_DEFAULT, "Current connection (%@) registering with identifiers: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 48) activeDataSources];
  uint64_t v6 = [[MSNPillDataSource alloc] initWithConnection:*(void *)(a1 + 32) identifiers:*(void *)(a1 + 40)];
  [v5 addObject:v6];
}

- (NSMutableArray)activeDataSources
{
  return self->_activeDataSources;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (STDynamicActivityAttributionMonitor)systemStatusDynamicAttributionMonitor
{
  return self->_systemStatusDynamicAttributionMonitor;
}

- (STCallingStatusDomain)callingDomain
{
  return self->_callingDomain;
}

- (void)setCallingDomain:(id)a3
{
}

- (STCallingStatusDomainData)callingData
{
  return self->_callingData;
}

- (void)setCallingData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callingData, 0);
  objc_storeStrong((id *)&self->_callingDomain, 0);
  objc_storeStrong((id *)&self->_systemStatusDynamicAttributionMonitor, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_activeDataSources, 0);
}

- (void)fetchPillRegistrationForProcess:(os_log_t)log withCompletion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DC736000, log, OS_LOG_TYPE_DEBUG, "Dont have any data sources registered", v1, 2u);
}

- (void)fetchPillRegistrationForProcess:(uint64_t)a1 withCompletion:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DC736000, a2, OS_LOG_TYPE_DEBUG, "Dont have matching attribution for client: %@", (uint8_t *)&v2, 0xCu);
}

@end