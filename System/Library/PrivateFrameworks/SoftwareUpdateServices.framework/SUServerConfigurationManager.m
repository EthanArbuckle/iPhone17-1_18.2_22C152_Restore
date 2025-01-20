@interface SUServerConfigurationManager
+ (id)sharedInstance;
- (BOOL)_queue_didNumberValueChange:(id)a3 oldConfig:(id)a4 newConfig:(id)a5 valueRemoved:(BOOL *)a6;
- (BOOL)_queue_didValueChange:(id)a3 oldConfig:(id)a4 newConfig:(id)a5 type:(unint64_t)a6 valueRemoved:(BOOL *)a7;
- (BOOL)defaultToOldInactivityPredictor;
- (NSNumber)softwareUpdateAutoScanInterval;
- (SUServerConfigurationManager)init;
- (void)addListener:(id)a3;
- (void)coreConfigServerSettingsUpdated:(id)a3 error:(id)a4;
- (void)removeListener:(id)a3;
@end

@implementation SUServerConfigurationManager

- (SUServerConfigurationManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)SUServerConfigurationManager;
  v2 = [(SUServerConfigurationManager *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.softwareupdateservicesd.serverConfigStateQueue", v3);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263F77B40] sharedServerSettings];
    suCoreServerConfig = v2->_suCoreServerConfig;
    v2->_suCoreServerConfig = (SUCoreConfigServer *)v6;

    uint64_t v8 = *MEMORY[0x263F77ED0];
    [(SUCoreConfigServer *)v2->_suCoreServerConfig listenForConfigChanges:v2 withName:*MEMORY[0x263F77ED0]];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F77D88]) initWithProjectName:v8];
    projectConfig = v2->_projectConfig;
    v2->_projectConfig = (SUCoreConfig *)v9;

    uint64_t v11 = [(SUCoreConfig *)v2->_projectConfig getConfig];
    config = v2->_config;
    v2->_config = (NSDictionary *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    listeners = v2->_listeners;
    v2->_listeners = v13;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_pred_1 != -1) {
    dispatch_once(&sharedInstance_pred_1, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance___instance_4;
  return v2;
}

uint64_t __46__SUServerConfigurationManager_sharedInstance__block_invoke()
{
  sharedInstance___instance_4 = objc_alloc_init(SUServerConfigurationManager);
  return MEMORY[0x270F9A758]();
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SUServerConfigurationManager_addListener___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

uint64_t __44__SUServerConfigurationManager_addListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SUServerConfigurationManager_removeListener___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

uint64_t __47__SUServerConfigurationManager_removeListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (NSNumber)softwareUpdateAutoScanInterval
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  uint64_t v11 = __Block_byref_object_dispose__9;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__SUServerConfigurationManager_softwareUpdateAutoScanInterval__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

uint64_t __62__SUServerConfigurationManager_softwareUpdateAutoScanInterval__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) getNumberConfigForKey:*MEMORY[0x263F77E90]];
  return MEMORY[0x270F9A758]();
}

- (BOOL)defaultToOldInactivityPredictor
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = v2->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__SUServerConfigurationManager_defaultToOldInactivityPredictor__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __63__SUServerConfigurationManager_defaultToOldInactivityPredictor__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) getNumberConfigForKey:@"FallbackToCoreDuetInactivityPredictor"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (BOOL)_queue_didValueChange:(id)a3 oldConfig:(id)a4 newConfig:(id)a5 type:(unint64_t)a6 valueRemoved:(BOOL *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (a6)
  {
    SULogInfo(@"Unknown SUServerConfigValueType %lu", v15, v16, v17, v18, v19, v20, v21, a6);
    BOOL v22 = 0;
  }
  else
  {
    BOOL v22 = [(SUServerConfigurationManager *)self _queue_didNumberValueChange:v12 oldConfig:v13 newConfig:v14 valueRemoved:a7];
  }

  return v22;
}

- (BOOL)_queue_didNumberValueChange:(id)a3 oldConfig:(id)a4 newConfig:(id)a5 valueRemoved:(BOOL *)a6
{
  stateQueue = self->_stateQueue;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  dispatch_assert_queue_V2(stateQueue);
  id v13 = [v11 objectForKeyedSubscript:v12];

  id v14 = [v10 objectForKeyedSubscript:v12];

  if (!v13 || v14)
  {
    BOOL v15 = 1;
    if (v13 || !v14)
    {
      if (!v13 || !v14 || (int v16 = [v13 intValue], v16 == objc_msgSend(v14, "intValue"))) {
        BOOL v15 = 0;
      }
    }
  }
  else
  {
    BOOL v15 = 1;
    if (a6) {
      *a6 = 1;
    }
  }

  return v15;
}

- (void)coreConfigServerSettingsUpdated:(id)a3 error:(id)a4
{
  id v5 = a3;
  stateQueue = self->_stateQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__SUServerConfigurationManager_coreConfigServerSettingsUpdated_error___block_invoke;
  v8[3] = &unk_26447C8C8;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(stateQueue, v8);
}

void __70__SUServerConfigurationManager_coreConfigServerSettingsUpdated_error___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  char v22 = 0;
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Projects"];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F77ED0]];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v4 setObject:v5 forKeyedSubscript:@"Changed"];
    [v4 setObject:v6 forKeyedSubscript:@"Removed"];
    uint64_t v7 = *MEMORY[0x263F77E90];
    if (objc_msgSend(*(id *)(a1 + 40), "_queue_didNumberValueChange:oldConfig:newConfig:valueRemoved:", *MEMORY[0x263F77E90], *(void *)(*(void *)(a1 + 40) + 40), v3, &v22))
    {
      if (v22)
      {
        [v6 addObject:v7];
      }
      else
      {
        id v11 = [v3 objectForKeyedSubscript:v7];
        [v5 setObject:v11 forKeyedSubscript:v7];
      }
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 40), v3);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = *(id *)(*(void *)(a1 + 40) + 24);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        id v17 = v6;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v10);
            }
            int v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (v16 && (objc_opt_respondsToSelector() & 1) != 0) {
              [v16 serverConfigManager:*(void *)(a1 + 40) configValuesChanged:v4];
            }
          }
          uint64_t v13 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v13);
        id v6 = v17;
      }
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = v3;
      id v10 = *(id *)(v8 + 40);
      *(void *)(v8 + 40) = v9;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_projectConfig, 0);
  objc_storeStrong((id *)&self->_suCoreServerConfig, 0);
}

@end