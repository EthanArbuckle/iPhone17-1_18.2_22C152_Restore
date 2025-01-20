@interface PTDomainServer
- (BOOL)_hasValueChangedFromDefault:(id)a3 forKeypath:(id)a4 settingsClassName:(id)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSDictionary)domainInfoByID;
- (NSDictionary)testRecipeInfoByID;
- (PTDomainServer)init;
- (PTParameterRecords)parameterRecordsOfTunedSettings;
- (id)_queue_archiveForDomainID:(id)a3;
- (id)_queue_proxyDefinitionForDomainID:(id)a3;
- (id)activeTestRecipeID;
- (id)localSettingsOfClass:(Class)a3;
- (id)rootSettingsArchiveForDomainID:(id)a3;
- (id)rootSettingsProxyDefinitionForDomainID:(id)a3;
- (void)_queue_applyArchiveValue:(id)a3 forKeyPath:(id)a4 domainID:(id)a5;
- (void)_queue_invokeOutletAtKeyPath:(id)a3 domainID:(id)a4;
- (void)_queue_persistChanges;
- (void)_queue_removeClient:(id)a3;
- (void)_queue_restoreDefaultsForDomainID:(id)a3;
- (void)_queue_schedulePersistChanges;
- (void)_queue_sendArchiveValue:(id)a3 forKeyPath:(id)a4 domainID:(id)a5;
- (void)_queue_sendRestoreDefaultsForDomainID:(id)a3;
- (void)applyArchiveValue:(id)a3 forKeyPath:(id)a4 domainID:(id)a5 completion:(id)a6;
- (void)applyArchiveValue:(id)a3 forRootSettingsKeyPath:(id)a4 domainID:(id)a5;
- (void)invokeOutletAtKeyPath:(id)a3 domainID:(id)a4;
- (void)persistChanges;
- (void)registerDomainWithInfo:(id)a3;
- (void)registerRootSettingsProxyDefinition:(id)a3 forDomainID:(id)a4;
- (void)registerTestRecipeWithInfo:(id)a3;
- (void)requestArchiveDictionaryForDomainID:(id)a3 completion:(id)a4;
- (void)requestDomainInfoWithCompletion:(id)a3;
- (void)requestServerStatusWithCompletion:(id)a3;
- (void)restoreDefaultValuesForDomainID:(id)a3;
- (void)restoreDefaultValuesForDomainID:(id)a3 completion:(id)a4;
- (void)sendEvent:(int64_t)a3 forTestRecipeID:(id)a4;
- (void)setActiveTestRecipeID:(id)a3;
- (void)setParameterRecordsOfTunedSettings:(id)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
- (void)settingsDidRestoreDefaults:(id)a3;
- (void)settingsWillRestoreDefaults:(id)a3;
@end

@implementation PTDomainServer

- (PTDomainServer)init
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)PTDomainServer;
  v3 = [(PTDomainServer *)&v36 init];
  if (v3)
  {
    if (__listener)
    {
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:a2 object:v3 file:@"PTDomainServer.m" lineNumber:62 description:@"PTDomainServer should only be instantiated once."];
    }
    _PTMigrateIfNecessary();
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.PrototypeTools.PTSettingsServer", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unregisteredClients = v3->_unregisteredClients;
    v3->_unregisteredClients = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    clientsByDomainID = v3->_clientsByDomainID;
    v3->_clientsByDomainID = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    settingsArchivesByDomainID = v3->_settingsArchivesByDomainID;
    v3->_settingsArchivesByDomainID = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    loadedDomainIDs = v3->_loadedDomainIDs;
    v3->_loadedDomainIDs = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    localSettingsByClassName = v3->_localSettingsByClassName;
    v3->_localSettingsByClassName = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    dirtyDomainIDs = v3->_dirtyDomainIDs;
    v3->_dirtyDomainIDs = v16;

    uint64_t v18 = _PTReadDomainInfo();
    domainInfoByID = v3->_domainInfoByID;
    v3->_domainInfoByID = (NSMutableDictionary *)v18;

    uint64_t v20 = _PTReadTestRecipeInfo();
    testRecipeInfoByID = v3->_testRecipeInfoByID;
    v3->_testRecipeInfoByID = (NSMutableDictionary *)v20;

    v22 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [(NSMutableDictionary *)v3->_domainInfoByID count];
      int v24 = [(NSMutableDictionary *)v3->_testRecipeInfoByID count];
      *(_DWORD *)buf = 67109376;
      int v38 = v23;
      __int16 v39 = 1024;
      int v40 = v24;
      _os_log_impl(&dword_1BEC4F000, v22, OS_LOG_TYPE_DEFAULT, "PTDomainServer found %d registered domains and %d registered test recipes", buf, 0xEu);
    }

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.PrototypeTools.domainserver"];
    v26 = (void *)__listener;
    __listener = v25;

    [(id)__listener setDelegate:v3];
    [(id)__listener resume];
    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.PrototypeTools.debugserver"];
    v28 = (void *)__debugServerListener;
    __debugServerListener = v27;

    [(id)__debugServerListener setDelegate:v3];
    [(id)__debugServerListener resume];
    v29 = +[PTDefaults sharedInstance];
    id v30 = (id)[v29 observeTestRecipeDefaultsOnQueue:MEMORY[0x1E4F14428] withBlock:&__block_literal_global_9];

    v31 = objc_alloc_init(PTParameterRecordsPersistenceManager);
    parameterRecordsPersistenceManager = v3->_parameterRecordsPersistenceManager;
    v3->_parameterRecordsPersistenceManager = v31;

    v33 = [(PTParameterRecordsPersistenceManager *)v3->_parameterRecordsPersistenceManager createParameterRecordsFromArchiveDictionary];
    [(PTDomainServer *)v3 setParameterRecordsOfTunedSettings:v33];
  }
  return v3;
}

void __22__PTDomainServer_init__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"PTDomainServerActiveTestRecipeChangedNotification" object:0];
}

- (id)localSettingsOfClass:(Class)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PTDomainServer_localSettingsOfClass___block_invoke;
  block[3] = &unk_1E63BC940;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __39__PTDomainServer_localSettingsOfClass___block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 48));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "objectForKey:");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "_queue_archiveForDomainID:", v10);
    v6 = *(void **)(a1 + 48);
    if (v5)
    {
      uint64_t v7 = [v6 settingsFromArchiveDictionary:v5];
    }
    else
    {
      uint64_t v7 = [objc_alloc((Class)v6) initWithDefaultValues];
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [*(id *)(*(void *)(a1 + 32) + 64) setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:v10];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _setObservationEnabled:1];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addKeyPathObserver:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _setRestoreDefaultsObserver:*(void *)(a1 + 32)];
  }
}

- (void)persistChanges
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PTDomainServer_persistChanges__block_invoke;
  block[3] = &unk_1E63BC600;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __32__PTDomainServer_persistChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_persistChanges");
}

- (NSDictionary)domainInfoByID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__PTDomainServer_domainInfoByID__block_invoke;
  v5[3] = &unk_1E63BC968;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

uint64_t __32__PTDomainServer_domainInfoByID__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSDictionary)testRecipeInfoByID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PTDomainServer_testRecipeInfoByID__block_invoke;
  v5[3] = &unk_1E63BC968;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

uint64_t __36__PTDomainServer_testRecipeInfoByID__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)rootSettingsProxyDefinitionForDomainID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PTDomainServer_rootSettingsProxyDefinitionForDomainID___block_invoke;
  block[3] = &unk_1E63BC990;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __57__PTDomainServer_rootSettingsProxyDefinitionForDomainID___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_proxyDefinitionForDomainID:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)rootSettingsArchiveForDomainID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PTDomainServer_rootSettingsArchiveForDomainID___block_invoke;
  block[3] = &unk_1E63BC990;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__PTDomainServer_rootSettingsArchiveForDomainID___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_archiveForDomainID:", *(void *)(a1 + 40));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)activeTestRecipeID
{
  uint64_t v2 = +[PTDefaults sharedInstance];
  uint64_t v3 = [v2 activeTestRecipeIdentifier];

  return v3;
}

- (void)applyArchiveValue:(id)a3 forRootSettingsKeyPath:(id)a4 domainID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__PTDomainServer_applyArchiveValue_forRootSettingsKeyPath_domainID___block_invoke;
  v15[3] = &unk_1E63BC9B8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __68__PTDomainServer_applyArchiveValue_forRootSettingsKeyPath_domainID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applyArchiveValue:forKeyPath:domainID:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)restoreDefaultValuesForDomainID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PTDomainServer_restoreDefaultValuesForDomainID___block_invoke;
  v7[3] = &unk_1E63BC548;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __50__PTDomainServer_restoreDefaultValuesForDomainID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_restoreDefaultsForDomainID:", *(void *)(a1 + 40));
}

- (void)invokeOutletAtKeyPath:(id)a3 domainID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PTDomainServer_invokeOutletAtKeyPath_domainID___block_invoke;
  block[3] = &unk_1E63BC628;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __49__PTDomainServer_invokeOutletAtKeyPath_domainID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_invokeOutletAtKeyPath:domainID:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)sendEvent:(int64_t)a3 forTestRecipeID:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PTDomainServer_sendEvent_forTestRecipeID___block_invoke;
  block[3] = &unk_1E63BC9E0;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __44__PTDomainServer_sendEvent_forTestRecipeID___block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 40) objectForKey:a1[5]];
  uint64_t v3 = [v2 domainIdentifier];
  if (v3)
  {
    id v4 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = PTPrototypingEventShortName(a1[6]);
      *(_DWORD *)buf = 138412546;
      id v18 = v5;
      __int16 v19 = 2112;
      uint64_t v20 = v3;
      _os_log_impl(&dword_1BEC4F000, v4, OS_LOG_TYPE_DEFAULT, "Sending '%@' to domain %@", buf, 0x16u);
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", v3, 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          int64_t v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) remoteObjectProxy];
          [v11 sendActiveTestRecipeEvent:a1[6]];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)setActiveTestRecipeID:(id)a3
{
  id v4 = a3;
  id v5 = +[PTDefaults sharedInstance];
  id v6 = [v5 testRecipeIdentifier];
  char v7 = [v6 isEqualToString:v4];

  if ((v7 & 1) == 0)
  {
    uint64_t v18 = 0;
    __int16 v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    id v23 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PTDomainServer_setActiveTestRecipeID___block_invoke;
    block[3] = &unk_1E63BC990;
    id v17 = &v18;
    block[4] = self;
    id v9 = v4;
    id v16 = v9;
    dispatch_sync(queue, block);
    if (v9)
    {
      [v5 setTestRecipeIdentifier:v9];
      uint64_t v10 = [(id)v19[5] recipeDescription];
      [v5 setTestRecipeDescription:v10];

      int64_t v11 = [(id)v19[5] events];
      objc_msgSend(v5, "setTestRecipeEatsVolumeUp:", objc_msgSend(v11, "containsIndex:", 1));

      long long v12 = [(id)v19[5] events];
      objc_msgSend(v5, "setTestRecipeEatsVolumeDown:", objc_msgSend(v12, "containsIndex:", 2));

      long long v13 = [(id)v19[5] events];
      objc_msgSend(v5, "setTestRecipeEatsRingerSwitch:", objc_msgSend(v13, "containsIndex:", 3));

      long long v14 = [(id)v19[5] events];
      objc_msgSend(v5, "setTestRecipeEatsRingerButton:", objc_msgSend(v14, "containsIndex:", 4));
    }
    else
    {
      [v5 setTestRecipeIdentifier:0];
      [v5 setTestRecipeDescription:0];
      [v5 setTestRecipeEatsVolumeUp:0];
      [v5 setTestRecipeEatsVolumeDown:0];
      [v5 setTestRecipeEatsRingerSwitch:0];
      [v5 setTestRecipeEatsRingerButton:0];
    }

    _Block_object_dispose(&v18, 8);
  }
}

uint64_t __40__PTDomainServer_setActiveTestRecipeID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)applyArchiveValue:(id)a3 forKeyPath:(id)a4 domainID:(id)a5 completion:(id)a6
{
  uint64_t v10 = (void (**)(id, void))a6;
  [(PTDomainServer *)self applyArchiveValue:a3 forRootSettingsKeyPath:a4 domainID:a5];
  v10[2](v10, 0);
}

- (void)requestArchiveDictionaryForDomainID:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = [(PTDomainServer *)self rootSettingsArchiveForDomainID:a3];
  (*((void (**)(id, id, void))a4 + 2))(v7, v8, 0);
}

- (void)restoreDefaultValuesForDomainID:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  [(PTDomainServer *)self restoreDefaultValuesForDomainID:a3];
  v6[2](v6, 0);
}

- (void)requestDomainInfoWithCompletion:(id)a3
{
}

- (void)requestServerStatusWithCompletion:(id)a3
{
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 _archiveValueForKeyPath:v7];
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__PTDomainServer_settings_changedValueForKeyPath___block_invoke;
  v13[3] = &unk_1E63BC9B8;
  id v14 = v6;
  long long v15 = self;
  id v16 = v8;
  id v17 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(queue, v13);
}

void __50__PTDomainServer_settings_changedValueForKeyPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_queue_applyArchiveValue:forKeyPath:domainID:", *(void *)(a1 + 48), *(void *)(a1 + 56), v3);
}

- (void)settingsWillRestoreDefaults:(id)a3
{
}

- (void)settingsDidRestoreDefaults:(id)a3
{
  id v4 = a3;
  [v4 addKeyPathObserver:self];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PTDomainServer_settingsDidRestoreDefaults___block_invoke;
  v7[3] = &unk_1E63BC548;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __45__PTDomainServer_settingsDidRestoreDefaults___block_invoke(uint64_t a1)
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_queue_restoreDefaultsForDomainID:", v3);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PTDomainServer_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_1E63BC628;
  id v13 = v6;
  id v14 = v7;
  long long v15 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);

  return 1;
}

uint64_t __53__PTDomainServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == __debugServerListener)
  {
    id v7 = PTDebugServerInterface();
    [v2 setExportedInterface:v7];

    [*(id *)(a1 + 40) setExportedObject:*(void *)(a1 + 48)];
  }
  else
  {
    id v3 = PTDomainClientInterface();
    [v2 setRemoteObjectInterface:v3];

    id v4 = *(void **)(a1 + 40);
    id v5 = PTDomainServerInterface();
    [v4 setExportedInterface:v5];

    [*(id *)(a1 + 40) setExportedObject:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 48) + 16) addObject:*(void *)(a1 + 40)];
    objc_initWeak(&location, *(id *)(a1 + 40));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__PTDomainServer_listener_shouldAcceptNewConnection___block_invoke_2;
    v9[3] = &unk_1E63BCA08;
    id v6 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 48);
    objc_copyWeak(&v10, &location);
    [v6 setInvalidationHandler:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return [*(id *)(a1 + 40) resume];
}

void __53__PTDomainServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__PTDomainServer_listener_shouldAcceptNewConnection___block_invoke_3;
  v3[3] = &unk_1E63BCA08;
  v3[4] = v1;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, v3);
  objc_destroyWeak(&v4);
}

void __53__PTDomainServer_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "_queue_removeClient:", WeakRetained);
}

- (void)registerDomainWithInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    PTTransactionBegin(@"PTDomainServer domain registration");
    id v5 = [MEMORY[0x1E4F29268] currentConnection];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PTDomainServer_registerDomainWithInfo___block_invoke;
    block[3] = &unk_1E63BC628;
    id v9 = v4;
    id v10 = self;
    id v11 = v5;
    id v7 = v5;
    dispatch_async(queue, block);
  }
  else
  {
    id v7 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEC4F000, v7, OS_LOG_TYPE_DEFAULT, "Attempt to register prototype domain with nil info. Doing nothing.", buf, 2u);
    }
  }
}

void __41__PTDomainServer_registerDomainWithInfo___block_invoke(id *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] uniqueIdentifier];
  if ([*((id *)a1[5] + 2) containsObject:a1[6]])
  {
    id v3 = [*((id *)a1[5] + 3) objectForKey:v2];
    if (!v3)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [*((id *)a1[5] + 3) setObject:v3 forKey:v2];
    }
    [v3 addObject:a1[6]];
    [*((id *)a1[5] + 2) removeObject:a1[6]];
  }
  id v4 = [*((id *)a1[5] + 4) objectForKeyedSubscript:v2];
  if ((BSEqualObjects() & 1) == 0)
  {
    id v5 = PTLogObjectForTopic(2);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_DWORD *)id v11 = 138412290;
        *(void *)&v11[4] = v2;
        id v7 = "Replacing domain info for %@";
LABEL_11:
        _os_log_impl(&dword_1BEC4F000, v5, OS_LOG_TYPE_DEFAULT, v7, v11, 0xCu);
      }
    }
    else if (v6)
    {
      *(_DWORD *)id v11 = 138412290;
      *(void *)&v11[4] = v2;
      id v7 = "Adding domain info for %@";
      goto LABEL_11;
    }

    [*((id *)a1[5] + 4) setObject:a1[4] forKey:v2];
    _PTWriteDomainInfo(*((void *)a1[5] + 4));
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_42);
  }
  id v8 = objc_msgSend(a1[5], "_queue_archiveForDomainID:", v2, *(_OWORD *)v11);
  id v9 = [a1[6] remoteObjectProxy];
  id v10 = v9;
  if (v8) {
    [v9 updateSettingsFromArchive:v8];
  }
  else {
    [v9 restoreDefaultSettings];
  }

  PTTransactionEnd(@"PTDomainServer domain registration");
}

void __41__PTDomainServer_registerDomainWithInfo___block_invoke_40()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"PTDomainServerDomainsChangedNotification" object:0];
}

- (void)registerTestRecipeWithInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    PTTransactionBegin(@"PTDomainServer test recipe registration");
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__PTDomainServer_registerTestRecipeWithInfo___block_invoke;
    v7[3] = &unk_1E63BC548;
    id v8 = v4;
    id v9 = self;
    dispatch_async(queue, v7);
    BOOL v6 = v8;
  }
  else
  {
    BOOL v6 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEC4F000, v6, OS_LOG_TYPE_DEFAULT, "Attempt to register test recipe with nil info. Doing nothing.", buf, 2u);
    }
  }
}

void __45__PTDomainServer_registerTestRecipeWithInfo___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:v2];
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = PTLogObjectForTopic(2);
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        int v7 = 138412290;
        id v8 = v2;
        BOOL v6 = "Replacing test recipe info for %@";
LABEL_7:
        _os_log_impl(&dword_1BEC4F000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0xCu);
      }
    }
    else if (v5)
    {
      int v7 = 138412290;
      id v8 = v2;
      BOOL v6 = "Adding test recipe info for %@";
      goto LABEL_7;
    }

    [*(id *)(*(void *)(a1 + 40) + 40) setObject:*(void *)(a1 + 32) forKey:v2];
    _PTWriteTestRecipeInfo(*(void *)(*(void *)(a1 + 40) + 40));
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_48);
  }
  PTTransactionEnd(@"PTDomainServer test recipe registration");
}

void __45__PTDomainServer_registerTestRecipeWithInfo___block_invoke_46()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"PTDomainServerTestRecipesChangedNotification" object:0];
}

- (void)registerRootSettingsProxyDefinition:(id)a3 forDomainID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    PTTransactionBegin(@"PTDomainServer proxy definition registration");
    queue = self->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__PTDomainServer_registerRootSettingsProxyDefinition_forDomainID___block_invoke;
    v11[3] = &unk_1E63BC548;
    uint64_t v12 = v6;
    id v13 = v8;
    dispatch_async(queue, v11);

    id v10 = v12;
  }
  else
  {
    id v10 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEC4F000, v10, OS_LOG_TYPE_DEFAULT, "Attempt to register proxy definition with either nil definition or nil domainID. Ignoring.", buf, 2u);
    }
  }
}

void __66__PTDomainServer_registerRootSettingsProxyDefinition_forDomainID___block_invoke(uint64_t a1)
{
  _PTWriteSettingsProxyDefinition(*(void *)(a1 + 32), *(void **)(a1 + 40));
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __66__PTDomainServer_registerRootSettingsProxyDefinition_forDomainID___block_invoke_2;
  v2[3] = &unk_1E63BC548;
  id v3 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  PTTransactionEnd(@"PTDomainServer proxy definition registration");
}

void __66__PTDomainServer_registerRootSettingsProxyDefinition_forDomainID___block_invoke_2(uint64_t a1)
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PTDomainIdentifierKey";
  v4[1] = @"PTDomainSettingsProxyDefinitionKey";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"PTDomainServerSettingsProxyDefinitionChangedNotification" object:0 userInfo:v2];
}

- (id)_queue_proxyDefinitionForDomainID:(id)a3
{
  return _PTReadSettingsProxyDefinition(a3);
}

- (id)_queue_archiveForDomainID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NSMutableDictionary *)self->_settingsArchivesByDomainID objectForKeyedSubscript:v4];
  if (!v5)
  {
    if ([(NSMutableSet *)self->_loadedDomainIDs containsObject:v4])
    {
      BOOL v5 = 0;
    }
    else
    {
      BOOL v5 = _PTReadSettingsArchive(v4);
      [(NSMutableDictionary *)self->_settingsArchivesByDomainID setObject:v5 forKeyedSubscript:v4];
      [(NSMutableSet *)self->_loadedDomainIDs addObject:v4];
    }
  }

  return v5;
}

- (void)_queue_applyArchiveValue:(id)a3 forKeyPath:(id)a4 domainID:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(PTDomainServer *)self _queue_archiveForDomainID:v9];
  id v11 = [(NSMutableDictionary *)self->_domainInfoByID objectForKeyedSubscript:v9];
  uint64_t v12 = [v11 settingsClassName];

  if (!v10)
  {
    id v10 = +[PTSettings emptyArchiveForSettingsClassName:v12];
    [(NSMutableDictionary *)self->_settingsArchivesByDomainID setObject:v10 forKeyedSubscript:v9];
  }
  +[PTSettings _applyArchiveValue:v18 forKeyPath:v8 toArchive:v10];
  [(PTDomainServer *)self _queue_sendArchiveValue:v18 forKeyPath:v8 domainID:v9];
  [(NSMutableSet *)self->_dirtyDomainIDs addObject:v9];
  [(PTDomainServer *)self _queue_schedulePersistChanges];
  BOOL v13 = [(PTDomainServer *)self _hasValueChangedFromDefault:v18 forKeypath:v8 settingsClassName:v12];
  id v14 = [(PTDomainServer *)self parameterRecordsOfTunedSettings];
  long long v15 = v14;
  if (v13) {
    [v14 addRecordWithKeyPath:v8 domainID:v9 recordClassName:v12 value:v18];
  }
  else {
    [v14 removeRecordWithKeyPath:v8 domainID:v9];
  }

  parameterRecordsPersistenceManager = self->_parameterRecordsPersistenceManager;
  id v17 = [(PTDomainServer *)self parameterRecordsOfTunedSettings];
  [(PTParameterRecordsPersistenceManager *)parameterRecordsPersistenceManager writeToDisk:v17];
}

- (BOOL)_hasValueChangedFromDefault:(id)a3 forKeypath:(id)a4 settingsClassName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)[objc_alloc(NSClassFromString((NSString *)a5)) initWithDefaultValues];
  id v10 = [v9 valueForKeyPath:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v7 doubleValue];
    [v10 doubleValue];
    char v11 = BSFloatEqualToFloat();
  }
  else
  {
    char v11 = [v7 isEqual:v10];
  }
  char v12 = v11 ^ 1;

  return v12;
}

- (void)_queue_restoreDefaultsForDomainID:(id)a3
{
  settingsArchivesByDomainID = self->_settingsArchivesByDomainID;
  id v5 = a3;
  [(NSMutableDictionary *)settingsArchivesByDomainID removeObjectForKey:v5];
  [(NSMutableSet *)self->_loadedDomainIDs addObject:v5];
  [(PTDomainServer *)self _queue_sendRestoreDefaultsForDomainID:v5];
  [(NSMutableSet *)self->_dirtyDomainIDs addObject:v5];

  [(PTDomainServer *)self _queue_schedulePersistChanges];
}

- (void)_queue_removeClient:(id)a3
{
  id v4 = a3;
  [(NSMutableSet *)self->_unregisteredClients removeObject:v4];
  clientsByDomainID = self->_clientsByDomainID;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__PTDomainServer__queue_removeClient___block_invoke;
  v7[3] = &unk_1E63BCA30;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)clientsByDomainID enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __38__PTDomainServer__queue_removeClient___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeObject:*(void *)(a1 + 32)];
}

- (void)_queue_schedulePersistChanges
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_persistScheduled)
  {
    PTTransactionBegin(@"PTDomainServer scheduled to persist changes");
    id v3 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v8 = 0x4024000000000000;
      _os_log_impl(&dword_1BEC4F000, v3, OS_LOG_TYPE_DEFAULT, "Will persist changes %gs from now", buf, 0xCu);
    }

    dispatch_time_t v4 = dispatch_time(0, 10000000000);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PTDomainServer__queue_schedulePersistChanges__block_invoke;
    block[3] = &unk_1E63BC600;
    void block[4] = self;
    dispatch_after(v4, queue, block);
    self->_persistScheduled = 1;
  }
}

void __47__PTDomainServer__queue_schedulePersistChanges__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_persistChanges");
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;

  PTTransactionEnd(@"PTDomainServer scheduled to persist changes");
}

- (void)_queue_persistChanges
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  PTTransactionBegin(@"PTDomainServer persisting changes");
  if ([(NSMutableSet *)self->_dirtyDomainIDs count])
  {
    id v3 = [MEMORY[0x1E4F28E78] string];
    dispatch_time_t v4 = [(NSMutableSet *)self->_dirtyDomainIDs allObjects];
    uint64_t v5 = [v4 count];
    if (v5)
    {
      uint64_t v6 = v5;
      unint64_t v7 = 0;
      unint64_t v8 = v5 - 1;
      do
      {
        uint64_t v9 = [v4 objectAtIndex:v7];
        [v3 appendString:v9];
        if (v7 < v8) {
          [v3 appendString:@", "];
        }

        ++v7;
      }
      while (v6 != v7);
    }
    id v10 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v3;
      _os_log_impl(&dword_1BEC4F000, v10, OS_LOG_TYPE_DEFAULT, "Persisting changes for domains: %{public}@", buf, 0xCu);
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v11 = self->_dirtyDomainIDs;
  uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v17 = -[PTDomainServer _queue_archiveForDomainID:](self, "_queue_archiveForDomainID:", v16, (void)v19);
        id v18 = (void *)v17;
        if (v17) {
          _PTWriteSettingsArchive(v17, v16);
        }
        else {
          _PTClearSettingsArchive(v16);
        }
      }
      uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  [(NSMutableSet *)self->_dirtyDomainIDs removeAllObjects];
  PTTransactionEnd(@"PTDomainServer persisting changes");
}

- (void)_queue_sendArchiveValue:(id)a3 forKeyPath:(id)a4 domainID:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = -[NSMutableDictionary objectForKey:](self->_clientsByDomainID, "objectForKey:", a5, 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = [*(id *)(*((void *)&v16 + 1) + 8 * v14) remoteObjectProxy];
        [v15 setArchiveValue:v8 forKeyPath:v9];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)_queue_sendRestoreDefaultsForDomainID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = -[NSMutableDictionary objectForKey:](self->_clientsByDomainID, "objectForKey:", a3, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) remoteObjectProxy];
        [v8 restoreDefaultSettings];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_queue_invokeOutletAtKeyPath:(id)a3 domainID:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PTLogObjectForTopic(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_1BEC4F000, v8, OS_LOG_TYPE_DEFAULT, "Invoking outlet %@ in domain %@", buf, 0x16u);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v9 = -[NSMutableDictionary objectForKey:](self->_clientsByDomainID, "objectForKey:", v7, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v15 + 1) + 8 * v13) remoteObjectProxy];
        [v14 invokeOutletAtKeyPath:v6];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (PTParameterRecords)parameterRecordsOfTunedSettings
{
  return self->_parameterRecordsOfTunedSettings;
}

- (void)setParameterRecordsOfTunedSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterRecordsOfTunedSettings, 0);
  objc_storeStrong((id *)&self->_parameterRecordsPersistenceManager, 0);
  objc_storeStrong((id *)&self->_dirtyDomainIDs, 0);
  objc_storeStrong((id *)&self->_localSettingsByClassName, 0);
  objc_storeStrong((id *)&self->_loadedDomainIDs, 0);
  objc_storeStrong((id *)&self->_settingsArchivesByDomainID, 0);
  objc_storeStrong((id *)&self->_testRecipeInfoByID, 0);
  objc_storeStrong((id *)&self->_domainInfoByID, 0);
  objc_storeStrong((id *)&self->_clientsByDomainID, 0);
  objc_storeStrong((id *)&self->_unregisteredClients, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end