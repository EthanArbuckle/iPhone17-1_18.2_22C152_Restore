@interface PDSDaemon
- (IDSServerBag)bag;
- (PDSCDCache)underlyingStorage;
- (PDSCDCacheContainer)cacheContainer;
- (PDSConfiguration)configuration;
- (PDSCoordinator)coordinator;
- (PDSDaemon)initWithConfiguration:(id)a3;
- (PDSEntryStore)entryStore;
- (PDSRequestQueue)requestQueue;
- (PDSUserTracker)userTracker;
- (PDSXPCServer)XPCServer;
- (id)_entryStore;
- (id)_underlyingStorage;
- (id)remoteInternalListener;
- (id)remoteListenerForAllClientIDs;
- (id)remoteListenerForClientIDs:(id)a3;
- (void)_setupSysdiagnoseDump;
- (void)_underlyingStorage;
- (void)setBag:(id)a3;
- (void)setCacheContainer:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setEntryStore:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)setUnderlyingStorage:(id)a3;
- (void)setUserTracker:(id)a3;
- (void)setXPCServer:(id)a3;
- (void)start;
@end

@implementation PDSDaemon

- (PDSDaemon)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PDSDaemon.m", 64, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v6 = [v5 queue];

  if (!v6)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PDSDaemon.m", 65, @"Invalid parameter not satisfying: %@", @"configuration.queue" object file lineNumber description];
  }
  v7 = [v5 workloop];

  if (!v7)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PDSDaemon.m", 66, @"Invalid parameter not satisfying: %@", @"configuration.workloop" object file lineNumber description];
  }
  v8 = [v5 daemonRootDirectory];

  if (!v8)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PDSDaemon.m", 67, @"Invalid parameter not satisfying: %@", @"configuration.daemonRootDirectory" object file lineNumber description];
  }
  v9 = [v5 pushHandlerPort];

  if (!v9)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PDSDaemon.m", 68, @"Invalid parameter not satisfying: %@", @"configuration.pushHandlerPort" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)PDSDaemon;
  v10 = [(PDSDaemon *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v5 copy];
    configuration = v10->_configuration;
    v10->_configuration = (PDSConfiguration *)v11;
  }
  return v10;
}

- (void)start
{
  v3 = [(PDSDaemon *)self configuration];
  v4 = [v3 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __18__PDSDaemon_start__block_invoke;
  block[3] = &unk_2645C8BE0;
  block[4] = self;
  dispatch_async(v4, block);
}

void __18__PDSDaemon_start__block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F5B9E8] setDisableXPC:1];
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = [*(id *)(a1 + 32) configuration];
  v4 = [v3 workloop];
  dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("com.apple.pds.idsd.queue", v2, v4);

  dispatch_queue_t v47 = v5;
  v48 = [[PDSDaemonRemoteVendor alloc] initWithQueue:v5 daemonListenerVendor:*(void *)(a1 + 32)];
  objc_msgSend(MEMORY[0x263F5B9D8], "registerGlobalVendor:");
  v6 = [*(id *)(a1 + 32) configuration];
  v7 = [v6 workloop];
  v8 = createPDSServerBag(v7);
  [*(id *)(a1 + 32) setBag:v8];

  v9 = [*(id *)(a1 + 32) bag];
  [v9 startBagLoad];

  v10 = pds_defaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = PDSCurrentServerEnvironment();
    v12 = PDSStringForServerEnvironment(v11);
    v13 = [*(id *)(a1 + 32) configuration];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v12;
    __int16 v62 = 2112;
    v63 = v13;
    _os_log_impl(&dword_221791000, v10, OS_LOG_TYPE_DEFAULT, "Starting PDSAgent [Environment %@] [Configuration %@]", buf, 0x16u);
  }
  v14 = [PDSCDCacheContainer alloc];
  v15 = [*(id *)(a1 + 32) configuration];
  v16 = [v15 daemonRootDirectory];
  v17 = [(PDSCDCacheContainer *)v14 initWithContainingPath:v16];
  [*(id *)(a1 + 32) setCacheContainer:v17];

  v18 = objc_alloc_init(PDSUserTracker);
  [*(id *)(a1 + 32) setUserTracker:v18];

  objc_super v19 = [*(id *)(a1 + 32) configuration];
  v20 = [v19 queue];

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __18__PDSDaemon_start__block_invoke_61;
  v59[3] = &unk_2645C8CB8;
  id v50 = v20;
  id v60 = v50;
  v52 = (void *)MEMORY[0x223C8A560](v59);
  id v21 = objc_alloc(MEMORY[0x263F3BB38]);
  v22 = [*(id *)(a1 + 32) bag];
  v51 = (void *)[v21 initWithIDSServerBag:v22];

  v23 = [PDSRequestQueue alloc];
  v24 = [*(id *)(a1 + 32) userTracker];
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __18__PDSDaemon_start__block_invoke_2;
  v57[3] = &unk_2645C8CE0;
  objc_copyWeak(&v58, (id *)buf);
  v25 = [(PDSRequestQueue *)v23 initWithMessageDelivery:v51 userTracker:v24 queue:v50 pushTokenBlock:v52 entryStoreBlock:v57];
  [*(id *)(a1 + 32) setRequestQueue:v25];

  v26 = (void *)MEMORY[0x263F4A230];
  v27 = [*(id *)(a1 + 32) configuration];
  v28 = [v27 pushHandlerPort];
  v49 = [v26 sharedInstanceWithPortName:v28];

  v29 = [PDSCoordinator alloc];
  v30 = [*(id *)(a1 + 32) configuration];
  v31 = [v30 queue];
  v32 = [*(id *)(a1 + 32) bag];
  v33 = [*(id *)(a1 + 32) requestQueue];
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __18__PDSDaemon_start__block_invoke_3;
  v55[3] = &unk_2645C8D08;
  objc_copyWeak(&v56, (id *)buf);
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __18__PDSDaemon_start__block_invoke_4;
  v53[3] = &unk_2645C8CE0;
  objc_copyWeak(&v54, (id *)buf);
  v34 = [MEMORY[0x263F4A868] sharedInstance];
  v35 = [(PDSCoordinator *)v29 initWithQueue:v31 serverBag:v32 requestQueue:v33 kvStoreBlock:v55 entryStoreBlock:v53 pushTokenBlock:v52 systemMonitor:v34 pushHandler:v49];
  [*(id *)(a1 + 32) setCoordinator:v35];

  v36 = [*(id *)(a1 + 32) coordinator];
  [v36 registerIfNeeded];

  v37 = [PDSXPCServer alloc];
  v38 = [MEMORY[0x263F5B9E8] defaultListenerVendor];
  v39 = [MEMORY[0x263F5B9E8] defaultInterfaceVendor];
  v40 = *(void **)(a1 + 32);
  v41 = [v40 configuration];
  v42 = [v41 queue];
  v43 = [*(id *)(a1 + 32) configuration];
  v44 = [v43 workloop];
  v45 = [(PDSXPCServer *)v37 initWithServiceName:*MEMORY[0x263F5BA10] listenerVendor:v38 interfaceVendor:v39 daemonListenerVendor:v40 queue:v42 workloop:v44];
  [*(id *)(a1 + 32) setXPCServer:v45];

  v46 = [*(id *)(a1 + 32) XPCServer];
  [v46 resume];

  [*(id *)(a1 + 32) _setupSysdiagnoseDump];
  objc_destroyWeak(&v54);
  objc_destroyWeak(&v56);

  objc_destroyWeak(&v58);
  objc_destroyWeak((id *)buf);
}

id __18__PDSDaemon_start__block_invoke_61(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F280F0];
  id v4 = a2;
  id v5 = [v3 alloc];
  v6 = (void *)[v5 initWithEnvironmentName:v4 namedDelegatePort:*MEMORY[0x263F280B8] queue:*(void *)(a1 + 32)];

  v7 = [v6 publicToken];

  return v7;
}

id __18__PDSDaemon_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _entryStore];

  return v2;
}

id __18__PDSDaemon_start__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _underlyingStorage];

  return v2;
}

id __18__PDSDaemon_start__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _entryStore];

  return v2;
}

- (id)remoteListenerForClientIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(PDSDaemon *)self _entryStore];
  if (v5)
  {
    v6 = [PDSDaemonListener alloc];
    v7 = [(PDSDaemon *)self userTracker];
    v8 = [(PDSDaemonListener *)v6 initWithClientIDs:v4 entryStore:v5 userTracker:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)remoteListenerForAllClientIDs
{
  v3 = [(PDSDaemon *)self _entryStore];
  if (v3)
  {
    id v4 = [PDSDaemonListener alloc];
    id v5 = [(PDSDaemon *)self userTracker];
    v6 = [(PDSDaemonListener *)v4 initWithEntryStore:v3 userTracker:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)remoteInternalListener
{
  v3 = [PDSInternalDaemonListener alloc];
  id v4 = [(PDSDaemon *)self _underlyingStorage];
  id v5 = [(PDSInternalDaemonListener *)v3 initWithKVStore:v4];

  return v5;
}

- (id)_underlyingStorage
{
  v3 = [(PDSDaemon *)self underlyingStorage];
  if (!v3)
  {
    id v4 = [(PDSDaemon *)self cacheContainer];
    id v8 = 0;
    v3 = [v4 loadWithError:&v8];
    id v5 = v8;

    if (!v3)
    {
      v6 = pds_defaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(PDSDaemon *)(uint64_t)v5 _underlyingStorage];
      }
    }
  }
  return v3;
}

- (id)_entryStore
{
  v3 = [(PDSDaemon *)self entryStore];
  if (!v3)
  {
    uint64_t v4 = [(PDSDaemon *)self _underlyingStorage];
    if (v4)
    {
      id v5 = (void *)v4;
      v3 = [[PDSEntryStore alloc] initWithCache:v4];
      [(PDSDaemon *)self setEntryStore:v3];
      v6 = [(PDSDaemon *)self coordinator];
      [(PDSEntryStore *)v3 setDelegate:v6];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)_setupSysdiagnoseDump
{
  v2 = [(PDSDaemon *)self configuration];
  v3 = [v2 queue];
  IMLogRegisterStateToSysdiagnoseBlock();
}

id __34__PDSDaemon__setupSysdiagnoseDump__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) _entryStore];
  if (v1)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
    [v2 appendString:@"Users:\n"];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v3 = [v1 users];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v3);
          }
          [v2 appendFormat:@"%@\n", *(void *)(*((void *)&v18 + 1) + 8 * i)];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v5);
    }

    [v2 appendString:@"Entries:\n"];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = [v1 entries];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          [v2 appendFormat:@"\t%@\n", *(void *)(*((void *)&v14 + 1) + 8 * j)];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (PDSConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (PDSXPCServer)XPCServer
{
  return self->_XPCServer;
}

- (void)setXPCServer:(id)a3
{
}

- (PDSCDCacheContainer)cacheContainer
{
  return self->_cacheContainer;
}

- (void)setCacheContainer:(id)a3
{
}

- (IDSServerBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (PDSEntryStore)entryStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entryStore);
  return (PDSEntryStore *)WeakRetained;
}

- (void)setEntryStore:(id)a3
{
}

- (PDSCDCache)underlyingStorage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_underlyingStorage);
  return (PDSCDCache *)WeakRetained;
}

- (void)setUnderlyingStorage:(id)a3
{
}

- (PDSUserTracker)userTracker
{
  return self->_userTracker;
}

- (void)setUserTracker:(id)a3
{
}

- (PDSCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (PDSRequestQueue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_userTracker, 0);
  objc_destroyWeak((id *)&self->_underlyingStorage);
  objc_destroyWeak((id *)&self->_entryStore);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_cacheContainer, 0);
  objc_storeStrong((id *)&self->_XPCServer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)_underlyingStorage
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221791000, a2, OS_LOG_TYPE_ERROR, "Failed loading cache {error: %@}", (uint8_t *)&v2, 0xCu);
}

@end