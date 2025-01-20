@interface REApplicationCache
+ (id)sharedInstance;
- (BOOL)_queue_applicationIsRemoved:(id)a3;
- (BOOL)_queue_applicationIsRestricted:(id)a3;
- (BOOL)applicationIsRemote:(id)a3;
- (BOOL)applicationIsRemoved:(id)a3;
- (BOOL)applicationIsRestricted:(id)a3;
- (id)_init;
- (id)localApplicationForRemoteApplication:(id)a3;
- (id)remoteApplicationForLocalApplication:(id)a3;
- (id)watchKitExtensionForApplication:(id)a3;
- (unint64_t)_trackedApplicationCount;
- (unint64_t)_typeForRecord:(id)a3;
- (unint64_t)typeForApplication:(id)a3;
- (void)_accessRemoteApplicationsMapWithCompletion:(id)a3;
- (void)_clearApplicationTypesMap;
- (void)_init_loadApplicationTypesMapFromWorkspace:(id)a3;
- (void)_queue_applicationsDidChange:(id)a3;
- (void)_queue_loadRemoteAppsCompletion:(id)a3;
- (void)_queue_loadStateForBundleID:(id)a3;
- (void)applicationStateDidChange:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)clearNanoRegistryApplications;
- (void)dealloc;
@end

@implementation REApplicationCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_37);
  }
  v2 = (void *)sharedInstance_cache;
  return v2;
}

uint64_t __36__REApplicationCache_sharedInstance__block_invoke()
{
  id v0 = [[REApplicationCache alloc] _init];
  uint64_t v1 = sharedInstance_cache;
  sharedInstance_cache = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)_init
{
  v19.receiver = self;
  v19.super_class = (Class)REApplicationCache;
  v2 = [(REApplicationCache *)&v19 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    restrictedApps = v2->_restrictedApps;
    v2->_restrictedApps = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    removedApps = v2->_removedApps;
    v2->_removedApps = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    applicationTypes = v2->_applicationTypes;
    v2->_applicationTypes = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    watchKitExtensions = v2->_watchKitExtensions;
    v2->_watchKitExtensions = (NSMutableDictionary *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.relevanceengine.systemapplicationcache", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

    v13 = [MEMORY[0x263F01880] defaultWorkspace];
    [(REApplicationCache *)v2 _init_loadApplicationTypesMapFromWorkspace:v13];
    [v13 addObserver:v2];
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v14 = (void *)getCSLPRFDefaultAppDataProviderClass_softClass;
    uint64_t v24 = getCSLPRFDefaultAppDataProviderClass_softClass;
    if (!getCSLPRFDefaultAppDataProviderClass_softClass)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __getCSLPRFDefaultAppDataProviderClass_block_invoke;
      v20[3] = &unk_2644BC768;
      v20[4] = &v21;
      __getCSLPRFDefaultAppDataProviderClass_block_invoke((uint64_t)v20);
      v14 = (void *)v22[3];
    }
    v15 = v14;
    _Block_object_dispose(&v21, 8);
    v16 = (CSLPRFDefaultAppDataProvider *)objc_alloc_init(v15);
    appProvider = v2->_appProvider;
    v2->_appProvider = v16;

    [(CSLPRFDefaultAppDataProvider *)v2->_appProvider setDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)REApplicationCache;
  [(REApplicationCache *)&v4 dealloc];
}

- (BOOL)applicationIsRemoved:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__REApplicationCache_applicationIsRemoved___block_invoke;
  block[3] = &unk_2644BEE08;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __43__REApplicationCache_applicationIsRemoved___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_applicationIsRemoved:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_applicationIsRemoved:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_removedApps objectForKeyedSubscript:v4];
  if (!v5)
  {
    [(REApplicationCache *)self _queue_loadStateForBundleID:v4];
    uint64_t v5 = [(NSMutableDictionary *)self->_removedApps objectForKeyedSubscript:v4];
  }
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)applicationIsRestricted:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__REApplicationCache_applicationIsRestricted___block_invoke;
  block[3] = &unk_2644BEE08;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __46__REApplicationCache_applicationIsRestricted___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_applicationIsRestricted:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_applicationIsRestricted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_restrictedApps objectForKeyedSubscript:v4];
  if (!v5)
  {
    [(REApplicationCache *)self _queue_loadStateForBundleID:v4];
    uint64_t v5 = [(NSMutableDictionary *)self->_restrictedApps objectForKeyedSubscript:v4];
  }
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)applicationIsRemote:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__16;
  char v14 = __Block_byref_object_dispose__16;
  id v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__REApplicationCache_applicationIsRemote___block_invoke;
  v7[3] = &unk_2644BEE30;
  id v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  [(REApplicationCache *)self _accessRemoteApplicationsMapWithCompletion:v7];
  LOBYTE(self) = v11[5] != 0;

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __42__REApplicationCache_applicationIsRemote___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 valueForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x270F9A758](v3, v5);
}

- (id)localApplicationForRemoteApplication:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  objc_super v19 = __Block_byref_object_copy__16;
  v20 = __Block_byref_object_dispose__16;
  id v21 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __59__REApplicationCache_localApplicationForRemoteApplication___block_invoke;
  uint64_t v13 = &unk_2644BEE30;
  id v15 = &v16;
  id v5 = v4;
  id v14 = v5;
  [(REApplicationCache *)self _accessRemoteApplicationsMapWithCompletion:&v10];
  char v6 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v10, v11, v12, v13);
  if ([v6 isEqual:v17[5]]) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = (void *)v17[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v16, 8);
  return v8;
}

uint64_t __59__REApplicationCache_localApplicationForRemoteApplication___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 valueForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x270F9A758](v3, v5);
}

- (id)remoteApplicationForLocalApplication:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  objc_super v19 = __Block_byref_object_copy__16;
  v20 = __Block_byref_object_dispose__16;
  id v21 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __59__REApplicationCache_remoteApplicationForLocalApplication___block_invoke;
  uint64_t v13 = &unk_2644BEE30;
  id v15 = &v16;
  id v5 = v4;
  id v14 = v5;
  [(REApplicationCache *)self _accessRemoteApplicationsMapWithCompletion:&v10];
  char v6 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v10, v11, v12, v13);
  if ([v6 isEqual:v17[5]]) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = (void *)v17[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v16, 8);
  return v8;
}

uint64_t __59__REApplicationCache_remoteApplicationForLocalApplication___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 keyForValue:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x270F9A758](v3, v5);
}

- (void)_accessRemoteApplicationsMapWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__REApplicationCache__accessRemoteApplicationsMapWithCompletion___block_invoke;
  v7[3] = &unk_2644BC5E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __65__REApplicationCache__accessRemoteApplicationsMapWithCompletion___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 48))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__REApplicationCache__accessRemoteApplicationsMapWithCompletion___block_invoke_2;
    v7[3] = &unk_2644BDA00;
    id v4 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    dispatch_semaphore_t v8 = v3;
    id v9 = v5;
    void v7[4] = *(void *)(a1 + 32);
    id v6 = v3;
    objc_msgSend(v4, "_queue_loadRemoteAppsCompletion:", v7);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  }
}

intptr_t __65__REApplicationCache__accessRemoteApplicationsMapWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v2);
}

- (id)watchKitExtensionForApplication:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__16;
  uint64_t v16 = __Block_byref_object_dispose__16;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__REApplicationCache_watchKitExtensionForApplication___block_invoke;
  block[3] = &unk_2644BCAD8;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__REApplicationCache_watchKitExtensionForApplication___block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  unint64_t v3 = 0x263EFF000;
  if (!v2)
  {
    id v4 = [MEMORY[0x263F01868] applicationProxyForIdentifier:a1[5]];
    id v5 = v4;
    if (v4 && [v4 isWatchKitApp])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v6 = objc_msgSend(v5, "plugInKitPlugins", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v20;
LABEL_6:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
          uint64_t v12 = [v11 protocol];
          char v13 = [v12 isEqualToString:@"com.apple.watchkit"];

          if (v13) {
            break;
          }
          if (v8 == ++v10)
          {
            uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
            if (v8) {
              goto LABEL_6;
            }
            goto LABEL_12;
          }
        }
        v2 = [v11 bundleIdentifier];

        unint64_t v3 = 0x263EFF000uLL;
        if (v2) {
          goto LABEL_15;
        }
      }
      else
      {
LABEL_12:

        unint64_t v3 = 0x263EFF000;
      }
    }
    v2 = [*(id *)(v3 + 2512) null];
LABEL_15:
    [*(id *)(a1[4] + 40) setObject:v2 forKeyedSubscript:a1[5]];
  }
  uint64_t v14 = [*(id *)(v3 + 2512) null];
  char v15 = [v14 isEqual:v2];

  uint64_t v16 = *(void *)(a1[6] + 8);
  if (v15) {
    id v17 = 0;
  }
  else {
    id v17 = v2;
  }
  uint64_t v18 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v17;
}

- (unint64_t)typeForApplication:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__REApplicationCache_typeForApplication___block_invoke;
  block[3] = &unk_2644BCAD8;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__REApplicationCache_typeForApplication___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  if (v2)
  {
    id v3 = v2;
    *(void *)(*(void *)(a1[6] + 8) + 24) = [v2 unsignedIntegerValue];
    v2 = v3;
  }
}

- (unint64_t)_trackedApplicationCount
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__REApplicationCache__trackedApplicationCount__block_invoke;
  v5[3] = &unk_2644BD938;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__REApplicationCache__trackedApplicationCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)clearNanoRegistryApplications
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__REApplicationCache_clearNanoRegistryApplications__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

void __51__REApplicationCache_clearNanoRegistryApplications__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__REApplicationCache_clearNanoRegistryApplications__block_invoke_2;
  block[3] = &unk_2644BC660;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __51__REApplicationCache_clearNanoRegistryApplications__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"REApplicationStateDidChange" object:*(void *)(a1 + 32)];
}

- (void)_queue_loadRemoteAppsCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = dispatch_get_global_queue(33, 0);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    appProvider = self->_appProvider;
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    uint64_t v14 = appProvider;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    _os_log_impl(&dword_21E6E6000, &_os_log_internal, OS_LOG_TYPE_INFO, ">>>> %@ is loading apps using %@, completionQueue %@", buf, 0x20u);
  }
  unint64_t v7 = self->_appProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__REApplicationCache__queue_loadRemoteAppsCompletion___block_invoke;
  v9[3] = &unk_2644BEE80;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(CSLPRFDefaultAppDataProvider *)v7 loadAppsWithCompletion:v9 completionQueue:v5];
}

void __54__REApplicationCache__queue_loadRemoteAppsCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = v4;
    __int16 v27 = 1024;
    int v28 = [v3 count];
    _os_log_impl(&dword_21E6E6000, &_os_log_internal, OS_LOG_TYPE_INFO, ">>>> %@ loaded %d apps, processing", buf, 0x12u);
  }
  id v5 = -[REKeyValueMap initWithCapacity:]([REKeyValueMap alloc], "initWithCapacity:", [v3 count]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [v3 allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v21 + 1) + 8 * v10) bundleID];
        uint64_t v12 = [MEMORY[0x263EFF9D0] null];
        [(REKeyValueMap *)v5 addKey:v11 withValue:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v8);
  }

  __int16 v13 = [MEMORY[0x263F01880] defaultWorkspace];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __54__REApplicationCache__queue_loadRemoteAppsCompletion___block_invoke_14;
  v19[3] = &unk_2644BEE58;
  uint64_t v14 = v5;
  long long v20 = v14;
  [v13 enumerateBundlesOfType:1 block:v19];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v5);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    int v16 = [(REKeyValueMap *)v14 count];
    uint64_t v17 = (void *)MEMORY[0x223C31700](*(void *)(a1 + 40));
    *(_DWORD *)buf = 138412802;
    uint64_t v26 = v15;
    __int16 v27 = 1024;
    int v28 = v16;
    __int16 v29 = 2112;
    v30 = v17;
    _os_log_impl(&dword_21E6E6000, &_os_log_internal, OS_LOG_TYPE_INFO, ">>>> %@ mapps %d apps, calling %@", buf, 0x1Cu);
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(void))(v18 + 16))();
  }
}

void __54__REApplicationCache__queue_loadRemoteAppsCompletion___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F01868];
  uint64_t v4 = [a2 bundleURL];
  id v5 = [v3 applicationProxyForBundleURL:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend(v5, "counterpartIdentifiers", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [*(id *)(a1 + 32) valueForKey:v11];

        if (v12)
        {
          __int16 v13 = *(void **)(a1 + 32);
          uint64_t v14 = [v5 bundleIdentifier];
          [v13 addKey:v11 withValue:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)_clearApplicationTypesMap
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__REApplicationCache__clearApplicationTypesMap__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __47__REApplicationCache__clearApplicationTypesMap__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (void)_init_loadApplicationTypesMapFromWorkspace:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    do
    {
      uint64_t v8 = [v7 applicationState];
      if ([v8 isInstalled])
      {
        BOOL v9 = [v7 developerType] == 1;
        uint64_t v10 = [NSNumber numberWithUnsignedInteger:v9];
        applicationTypes = self->_applicationTypes;
        uint64_t v12 = [v7 bundleIdentifier];
        [(NSMutableDictionary *)applicationTypes setObject:v10 forKeyedSubscript:v12];

        uint64_t v13 = [v5 nextObject];

        uint64_t v7 = (void *)v13;
      }
    }
    while (v7);
  }
  uint64_t v14 = RELogForDomain(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = [(NSMutableDictionary *)self->_applicationTypes count];
    int v16 = 134217984;
    uint64_t v17 = v15;
    _os_log_impl(&dword_21E6E6000, v14, OS_LOG_TYPE_INFO, "[AppCache] Tracking %lu installed apps.", (uint8_t *)&v16, 0xCu);
  }
}

- (void)_queue_loadStateForBundleID:(id)a3
{
  id v13 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v13 allowPlaceholder:0 error:0];
  id v5 = [v4 applicationState];
  uint64_t v6 = v5;
  if (v4 && [v5 isValid])
  {
    uint64_t v7 = [v6 isRestricted];
    uint64_t v8 = [NSNumber numberWithBool:v7];
    [(NSMutableDictionary *)self->_restrictedApps setObject:v8 forKeyedSubscript:v13];

    if ([v6 isInstalled])
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v13 allowPlaceholder:1 error:0];
      uint64_t v11 = [v10 applicationState];
      uint64_t v9 = [v11 isPlaceholder] ^ 1;
    }
    uint64_t v12 = [NSNumber numberWithBool:v9];
    [(NSMutableDictionary *)self->_removedApps setObject:v12 forKeyedSubscript:v13];
  }
  else
  {
    [(NSMutableDictionary *)self->_restrictedApps setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v13];
    [(NSMutableDictionary *)self->_removedApps setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v13];
  }
}

- (void)applicationStateDidChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = RELogForDomain(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 count];
    uint64_t v7 = NSStringFromSelector(sel_bundleIdentifier);
    uint64_t v8 = [v4 valueForKeyPath:v7];
    uint64_t v9 = [v8 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 134218242;
    uint64_t v15 = v6;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_impl(&dword_21E6E6000, v5, OS_LOG_TYPE_DEFAULT, "[AppCache] %lu were changed: %{public}@.", buf, 0x16u);
  }
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__REApplicationCache_applicationStateDidChange___block_invoke;
  v12[3] = &unk_2644BC688;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_async(queue, v12);
}

uint64_t __48__REApplicationCache_applicationStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applicationsDidChange:", *(void *)(a1 + 40));
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = RELogForDomain(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 count];
    uint64_t v7 = NSStringFromSelector(sel_bundleIdentifier);
    uint64_t v8 = [v4 valueForKeyPath:v7];
    uint64_t v9 = [v8 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 134218242;
    uint64_t v18 = v6;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    _os_log_impl(&dword_21E6E6000, v5, OS_LOG_TYPE_DEFAULT, "[AppCache] %lu were installed: %{public}@", buf, 0x16u);
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__REApplicationCache_applicationsDidInstall___block_invoke;
  block[3] = &unk_2644BDBF0;
  block[4] = self;
  id v15 = v10;
  id v16 = v4;
  id v12 = v4;
  id v13 = v10;
  dispatch_async(queue, block);
}

void __45__REApplicationCache_applicationsDidInstall___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  id v4 = [*(id *)(*(void *)(a1 + 32) + 16) allKeys];
  [*(id *)(a1 + 40) removeObjectsInArray:v4];
  if ([*(id *)(a1 + 40) count])
  {
    id v16 = v4;
    id v5 = (void *)[*(id *)(a1 + 40) copy];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
          id v12 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v11 allowPlaceholder:0 error:0];
          id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "_typeForRecord:", v12));
          [*(id *)(*(void *)(a1 + 32) + 16) setObject:v13 forKeyedSubscript:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__REApplicationCache_applicationsDidInstall___block_invoke_2;
    block[3] = &unk_2644BC688;
    uint64_t v14 = *(void *)(a1 + 32);
    id v18 = v6;
    uint64_t v19 = v14;
    id v15 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v4 = v16;
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_applicationsDidChange:", *(void *)(a1 + 48));
}

void __45__REApplicationCache_applicationsDidInstall___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = @"REApplicationStateBundleIdentifiers";
  v6[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"REApplicationStateDidInstall" object:*(void *)(a1 + 40) userInfo:v3];
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = RELogForDomain(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 count];
    uint64_t v7 = NSStringFromSelector(sel_bundleIdentifier);
    uint64_t v8 = [v4 valueForKeyPath:v7];
    uint64_t v9 = [v8 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 134218242;
    uint64_t v16 = v6;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_impl(&dword_21E6E6000, v5, OS_LOG_TYPE_DEFAULT, "[AppCache] %lu were uninstalled: %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__REApplicationCache_applicationsDidUninstall___block_invoke;
  v12[3] = &unk_2644BC688;
  id v13 = v4;
  uint64_t v14 = self;
  id v11 = v4;
  dispatch_async(queue, v12);
}

void __47__REApplicationCache_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v18 + 1) + 8 * v7) bundleIdentifier];
        [v2 addObject:v8];
        [*(id *)(*(void *)(a1 + 40) + 16) removeObjectForKey:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  uint64_t v9 = (void *)[v2 copy];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __47__REApplicationCache_applicationsDidUninstall___block_invoke_2;
  id v15 = &unk_2644BC688;
  uint64_t v10 = *(void *)(a1 + 40);
  id v16 = v9;
  uint64_t v17 = v10;
  id v11 = v9;
  dispatch_async(MEMORY[0x263EF83A0], &v12);
  objc_msgSend(*(id *)(a1 + 40), "_queue_applicationsDidChange:", *(void *)(a1 + 32), v12, v13, v14, v15);
}

void __47__REApplicationCache_applicationsDidUninstall___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v5 = @"REApplicationStateBundleIdentifiers";
  v6[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"REApplicationStateDidUninstall" object:*(void *)(a1 + 40) userInfo:v3];
}

- (void)_queue_applicationsDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) bundleIdentifier];
        [(REApplicationCache *)self _queue_loadStateForBundleID:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  [(NSMutableDictionary *)self->_watchKitExtensions removeAllObjects];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__REApplicationCache__queue_applicationsDidChange___block_invoke;
  block[3] = &unk_2644BC660;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __51__REApplicationCache__queue_applicationsDidChange___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"REApplicationStateDidChange" object:*(void *)(a1 + 32)];
}

- (unint64_t)_typeForRecord:(id)a3
{
  return [a3 developerType] == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appProvider, 0);
  objc_storeStrong((id *)&self->_remoteApplicationsMap, 0);
  objc_storeStrong((id *)&self->_watchKitExtensions, 0);
  objc_storeStrong((id *)&self->_removedApps, 0);
  objc_storeStrong((id *)&self->_restrictedApps, 0);
  objc_storeStrong((id *)&self->_applicationTypes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end