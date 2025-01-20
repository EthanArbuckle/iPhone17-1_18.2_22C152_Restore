@interface NTKPigmentSyncProvider
+ (BOOL)areCollections:(id)a3 equalToCollections:(id)a4;
- (BOOL)isSyncing;
- (BOOL)prepareForSyncing:(BOOL)a3;
- (BOOL)receivedUpdateDuringSync;
- (BOOL)requestDeltaSyncAfterSyncing;
- (BOOL)shouldForceFullSync;
- (BOOL)shouldSyncSharedCollections;
- (CLKDevice)device;
- (NSMutableArray)faceDomainsToBeSynced;
- (NSMutableSet)domainsRequiringDeltaSync;
- (NTKPigmentEditOptionStore)pigmentStore;
- (NTKPigmentPersistentStorageController)storageController;
- (NTKPigmentSyncProvider)initWithDelegate:(id)a3;
- (NTKPigmentSyncProviderDelegate)delegate;
- (OS_dispatch_queue)privateQueue;
- (id)allAvailableFacesSupportingPigment;
- (id)compareLocalSyncDifferences;
- (id)nextSyncData:(id *)a3;
- (void)_requestDeltaSyncIfNeeded;
- (void)colorBundleContentChanged;
- (void)colorEditOptionStore:(id)a3 didChangeForDomain:(id)a4;
- (void)enumerateAllFacesPigmentDomains:(id)a3;
- (void)faceBundlesUpdated;
- (void)finishSyncing:(BOOL)a3;
- (void)saveSyncVersion;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDomainsRequiringDeltaSync:(id)a3;
- (void)setFaceDomainsToBeSynced:(id)a3;
- (void)setPigmentStore:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setReceivedUpdateDuringSync:(BOOL)a3;
- (void)setRequestDeltaSyncAfterSyncing:(BOOL)a3;
- (void)setShouldSyncSharedCollections:(BOOL)a3;
- (void)setStorageController:(id)a3;
- (void)setSyncing:(BOOL)a3;
@end

@implementation NTKPigmentSyncProvider

- (NTKPigmentSyncProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NTKPigmentSyncProvider;
  v5 = [(NTKPigmentSyncProvider *)&v24 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.NanoTimeKit.NTKPigmentSyncProvider", v6);
    privateQueue = v5->_privateQueue;
    v5->_privateQueue = (OS_dispatch_queue *)v7;

    v9 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    uint64_t v10 = [v9 device];
    device = v5->_device;
    v5->_device = (CLKDevice *)v10;

    uint64_t v12 = +[NTKPigmentEditOptionStore sharedInstance];
    pigmentStore = v5->_pigmentStore;
    v5->_pigmentStore = (NTKPigmentEditOptionStore *)v12;

    [(NTKPigmentEditOptionStore *)v5->_pigmentStore addListener:v5 forDomain:0];
    v14 = [NTKPigmentPersistentStorageController alloc];
    v15 = +[NTKPigmentPersistentStorageController syncStoresFolder];
    uint64_t v16 = [(NTKPigmentPersistentStorageController *)v14 initWithRootDirectory:v15];
    storageController = v5->_storageController;
    v5->_storageController = (NTKPigmentPersistentStorageController *)v16;

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v5 selector:sel_colorBundleContentChanged name:@"NTKColorBundleContentChangedNotificationName" object:0];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v5 selector:sel_faceBundlesUpdated name:@"NTKFaceBundleManagerDidUpdateBundlesNotificationName" object:0];

    v20 = v5->_privateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__NTKPigmentSyncProvider_initWithDelegate___block_invoke;
    block[3] = &unk_1E62BFF20;
    v23 = v5;
    dispatch_sync(v20, block);
  }
  return v5;
}

uint64_t __43__NTKPigmentSyncProvider_initWithDelegate___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) compareLocalSyncDifferences];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;

  int v5 = [*(id *)(a1 + 32) shouldForceFullSync];
  v6 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v13) = 0;
      v8 = "#sync Starting NTKPigmentSyncProvider - Will force full sync";
      v9 = v6;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
    }
  }
  else if (v7)
  {
    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 56) count];
    int v13 = 134217984;
    uint64_t v14 = v11;
    v8 = "#sync Starting NTKPigmentSyncProvider - Number of domains to sync %lu";
    v9 = v6;
    uint32_t v10 = 12;
    goto LABEL_6;
  }

  return [*(id *)(a1 + 32) _requestDeltaSyncIfNeeded];
}

- (BOOL)prepareForSyncing:(BOOL)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke;
  block[3] = &unk_1E62C8378;
  BOOL v7 = a3;
  void block[4] = self;
  block[5] = &v8;
  dispatch_sync(privateQueue, block);
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (unsigned char *)(a1 + 32);
  unsigned int v3 = [*(id *)(a1 + 32) shouldForceFullSync];
  if (v2[16]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = v3 == 0;
  }
  if (!v4)
  {
    unsigned int v5 = v3;
    v6 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = v5;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "#sync will sync colors for all domains. forcing full sync: %lu", buf, 0xCu);
    }

    char v7 = 1;
    *(unsigned char *)(*(void *)v2 + 9) = 1;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    v9 = *(void **)(*(void *)v2 + 64);
    *(void *)(*(void *)v2 + 64) = v8;

    uint64_t v10 = *(void **)v2;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke_31;
    v20[3] = &unk_1E62C8350;
    v20[4] = v10;
    [v10 enumerateAllFacesPigmentDomains:v20];
    uint64_t v11 = 8;
LABEL_18:
    *(unsigned char *)(*(void *)v2 + v11) = v7;
    goto LABEL_19;
  }
  if ([*(id *)(*(void *)v2 + 56) count])
  {
    uint64_t v12 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(*(void *)v2 + 56);
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v13;
      _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "#sync will sync colors for domains %{public}@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)v2 + 9) = [*(id *)(*(void *)v2 + 56) containsObject:@"sharedCollections"];
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v15 = *(void **)(*(void *)v2 + 64);
    *(void *)(*(void *)v2 + 64) = v14;

    uint64_t v16 = *(void **)v2;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke_34;
    v19[3] = &unk_1E62C8350;
    v19[4] = v16;
    [v16 enumerateAllFacesPigmentDomains:v19];
    if ([*(id *)(*(void *)v2 + 56) count]
      && ([*(id *)(*(void *)v2 + 56) count] != 1
       || ([*(id *)(*(void *)v2 + 56) containsObject:@"sharedCollections"] & 1) == 0))
    {
      v17 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke_cold_1((uint64_t)v2, v17);
      }
    }
    v18 = *(void **)(*(void *)v2 + 56);
    *(void *)(*(void *)v2 + 56) = 0;

    char v7 = 0;
    *(unsigned char *)(*(void *)v2 + 8) = 1;
    uint64_t v11 = 11;
    goto LABEL_18;
  }
LABEL_19:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 8);
}

void __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 64);
  id v5 = a3;
  id v6 = a2;
  char v7 = [[_NTKPigmentSyncProviderFaceDomain alloc] initWithFace:v6 domain:v5];

  [v4 addObject:v7];
}

void __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([*(id *)(*(void *)(a1 + 32) + 56) containsObject:v5])
  {
    id v6 = *(void **)(*(void *)(a1 + 32) + 64);
    char v7 = [[_NTKPigmentSyncProviderFaceDomain alloc] initWithFace:v8 domain:v5];
    [v6 addObject:v7];

    [*(id *)(*(void *)(a1 + 32) + 56) removeObject:v5];
  }
}

- (void)enumerateAllFacesPigmentDomains:(id)a3
{
  id v4 = a3;
  if (NTKInternalBuild(v4, v5) && (CLKIsNTKDaemon() & 1) == 0 && (CLKIsNTKXCTests() & 1) == 0)
  {
    id v6 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[NTKPigmentSyncProvider enumerateAllFacesPigmentDomains:](v6);
    }
  }
  char v7 = [(NTKPigmentSyncProvider *)self allAvailableFacesSupportingPigment];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__NTKPigmentSyncProvider_enumerateAllFacesPigmentDomains___block_invoke;
  v9[3] = &unk_1E62C83A0;
  id v10 = v4;
  id v8 = v4;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __58__NTKPigmentSyncProvider_enumerateAllFacesPigmentDomains___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [(id)objc_opt_class() allPigmentFaceDomains];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)nextSyncData:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__41;
  v18 = __Block_byref_object_dispose__41;
  id v19 = 0;
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__41;
  long long v12 = __Block_byref_object_dispose__41;
  id v13 = 0;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__NTKPigmentSyncProvider_nextSyncData___block_invoke;
  block[3] = &unk_1E62C83C8;
  void block[4] = self;
  block[5] = &v8;
  void block[6] = &v14;
  dispatch_sync(privateQueue, block);
  if (a3) {
    *a3 = (id) v9[5];
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __39__NTKPigmentSyncProvider_nextSyncData___block_invoke(void *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(v2 + 9))
  {
    *(unsigned char *)(v2 + 9) = 0;
    id v3 = [*(id *)(a1[4] + 24) sharedCollections];
    if (v3)
    {
      id v4 = +[NTKProtoSharedCollections protoBufferFromSharedCollections:v3];
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), @"sharedCollections");
      uint64_t v5 = [v4 data];
      uint64_t v6 = *(void *)(a1[6] + 8);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      uint64_t v8 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = [*(id *)(*(void *)(a1[6] + 8) + 40) length];
        int v24 = 134217984;
        uint64_t v25 = v9;
        _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_INFO, "#sync Loaded pigment shared collections for sync - data size: %lu", (uint8_t *)&v24, 0xCu);
      }
LABEL_11:
    }
  }
  else
  {
    id v3 = [*(id *)(v2 + 64) firstObject];
    if (v3)
    {
      [*(id *)(a1[4] + 64) removeObjectAtIndex:0];
      uint64_t v10 = *(void **)(a1[4] + 24);
      long long v11 = [v3 domain];
      long long v12 = (void *)MEMORY[0x1E4F28B50];
      id v13 = [v3 face];
      uint64_t v14 = [v12 bundleForClass:objc_opt_class()];
      id v4 = [v10 pigmentSetForDomain:v11 bundle:v14];

      if (v4)
      {
        uint64_t v15 = [v4 domain];
        uint64_t v16 = *(void *)(a1[5] + 8);
        v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        v18 = [v4 protoBuffer];
        uint64_t v19 = [v18 data];
        uint64_t v20 = *(void *)(a1[6] + 8);
        v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;

        uint64_t v8 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = [v4 domain];
          uint64_t v23 = [*(id *)(*(void *)(a1[6] + 8) + 40) length];
          int v24 = 138543618;
          uint64_t v25 = (uint64_t)v22;
          __int16 v26 = 2048;
          uint64_t v27 = v23;
          _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_INFO, "#sync Loaded pigment set for sync - face domain: %{public}@, data size: %lu", (uint8_t *)&v24, 0x16u);
        }
      }
      else
      {
        uint64_t v8 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __39__NTKPigmentSyncProvider_nextSyncData___block_invoke_cold_1(v3, v8);
        }
      }
      goto LABEL_11;
    }
  }
}

- (BOOL)isSyncing
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  privateQueue = self->_privateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__NTKPigmentSyncProvider_isSyncing__block_invoke;
  v5[3] = &unk_1E62C3040;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(privateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__NTKPigmentSyncProvider_isSyncing__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)finishSyncing:(BOOL)a3
{
  privateQueue = self->_privateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__NTKPigmentSyncProvider_finishSyncing___block_invoke;
  v4[3] = &unk_1E62C1BF0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(privateQueue, v4);
}

void __40__NTKPigmentSyncProvider_finishSyncing___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 0;
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 40) && !*(unsigned char *)(v3 + 11))
    {
      id v4 = *(void **)(v3 + 32);
      BOOL v5 = [*(id *)(v3 + 24) sharedCollections];
      [v4 persistSharedCollections:v5 deviceUUID:0];

      uint64_t v6 = *(void **)(a1 + 32);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __40__NTKPigmentSyncProvider_finishSyncing___block_invoke_2;
      v12[3] = &unk_1E62C8350;
      v12[4] = v6;
      [v6 enumerateAllFacesPigmentDomains:v12];
      [*(id *)(a1 + 32) saveSyncVersion];
      uint64_t v3 = *(void *)(a1 + 32);
    }
    if (*(unsigned char *)(v3 + 10))
    {
      *(unsigned char *)(v3 + 10) = 0;
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(NSObject **)(v7 + 40);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __40__NTKPigmentSyncProvider_finishSyncing___block_invoke_3;
      v11[3] = &unk_1E62BFF20;
      v11[4] = v7;
      dispatch_async(v8, v11);
      uint64_t v3 = *(void *)(a1 + 32);
    }
    [*(id *)(v3 + 32) closeTransactionForDeviceUUID:0];
    char v9 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v10;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "#sync Finished syncing. success:%lu", buf, 0xCu);
    }
  }
}

void __40__NTKPigmentSyncProvider_finishSyncing___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 24);
  BOOL v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a3;
  uint64_t v7 = [v5 bundleForClass:objc_opt_class()];
  id v9 = [v4 pigmentSetForDomain:v6 bundle:v7];

  uint64_t v8 = [*(id *)(a1 + 32) storageController];
  [v8 persistFacePigmentSet:v9 deviceUUID:0];
}

uint64_t __40__NTKPigmentSyncProvider_finishSyncing___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestDeltaSyncIfNeeded];
}

- (void)saveSyncVersion
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v2 = [NSNumber numberWithInteger:2];
  [v3 setObject:v2 forKey:@"NTKPigmentSyncProviderSyncVersion"];
}

- (BOOL)shouldForceFullSync
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"NTKPigmentSyncProviderSyncVersion"];
  uint64_t v4 = [v3 integerValue];

  return v4 != 2;
}

- (void)colorBundleContentChanged
{
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NTKPigmentSyncProvider_colorBundleContentChanged__block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(privateQueue, block);
}

uint64_t __51__NTKPigmentSyncProvider_colorBundleContentChanged__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setReceivedUpdateDuringSync:*(unsigned __int8 *)(*(void *)(a1 + 32) + 8)];
  uint64_t v2 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "#sync color bundles changed. It will attempt to request delta sync", v4, 2u);
  }

  return [*(id *)(a1 + 32) _requestDeltaSyncIfNeeded];
}

- (void)faceBundlesUpdated
{
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__NTKPigmentSyncProvider_faceBundlesUpdated__block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(privateQueue, block);
}

uint64_t __44__NTKPigmentSyncProvider_faceBundlesUpdated__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setReceivedUpdateDuringSync:*(unsigned __int8 *)(*(void *)(a1 + 32) + 8)];
  uint64_t v2 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "#sync face bundles updated. It will attempt to request delta sync", v4, 2u);
  }

  return [*(id *)(a1 + 32) _requestDeltaSyncIfNeeded];
}

- (void)colorEditOptionStore:(id)a3 didChangeForDomain:(id)a4
{
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__NTKPigmentSyncProvider_colorEditOptionStore_didChangeForDomain___block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(privateQueue, block);
}

uint64_t __66__NTKPigmentSyncProvider_colorEditOptionStore_didChangeForDomain___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setReceivedUpdateDuringSync:*(unsigned __int8 *)(*(void *)(a1 + 32) + 8)];
  uint64_t v2 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "#sync pigment store changed. It will attempt to request delta sync", v4, 2u);
  }

  return [*(id *)(a1 + 32) _requestDeltaSyncIfNeeded];
}

- (void)_requestDeltaSyncIfNeeded
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(NTKPigmentPersistentStorageController *)self->_storageController sharedCollections];
  if (!v3)
  {
    uint64_t v10 = _NTKLoggingObjectForDomain(5, (uint64_t)"NTKLoggingDomainSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      long long v11 = "#color-sync Ignoring request delta sync, waiting for reset sync request";
LABEL_15:
      _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 2u);
    }
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v4 = [(NTKPigmentSyncProvider *)self compareLocalSyncDifferences];
  domainsRequiringDeltaSync = self->_domainsRequiringDeltaSync;
  self->_domainsRequiringDeltaSync = v4;

  if (![(NSMutableSet *)self->_domainsRequiringDeltaSync count]
    && ![(NTKPigmentSyncProvider *)self shouldForceFullSync])
  {
    uint64_t v10 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      long long v11 = "#sync No changes since last sync";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  BOOL syncing = self->_syncing;
  uint64_t v7 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (syncing)
  {
    if (v8)
    {
      uint64_t v9 = [(NSMutableSet *)self->_domainsRequiringDeltaSync count];
      int v14 = 134217984;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "#sync Needs to request delta sync due to changes in pigment set for domains (%lu)", (uint8_t *)&v14, 0xCu);
    }

    self->_requestDeltaSyncAfterSyncing = 1;
  }
  else
  {
    if (v8)
    {
      uint64_t v12 = [(NSMutableSet *)self->_domainsRequiringDeltaSync count];
      int v14 = 134217984;
      uint64_t v15 = v12;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "#sync Requesting delta sync due to changes in pigment set for domains (%lu)", (uint8_t *)&v14, 0xCu);
    }

    id v13 = [(NTKPigmentSyncProvider *)self delegate];
    [v13 syncProviderDidRequiresDeltaSync:self];
  }
LABEL_17:
}

- (id)compareLocalSyncDifferences
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = [(NTKPigmentEditOptionStore *)self->_pigmentStore sharedCollections];
  BOOL v5 = [(NTKPigmentPersistentStorageController *)self->_storageController sharedCollections];
  if (([(id)objc_opt_class() areCollections:v4 equalToCollections:v5] & 1) == 0) {
    [v3 addObject:@"sharedCollections"];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__NTKPigmentSyncProvider_compareLocalSyncDifferences__block_invoke;
  v11[3] = &unk_1E62C83F0;
  v11[4] = self;
  id v12 = v5;
  id v6 = v3;
  id v13 = v6;
  id v7 = v5;
  [(NTKPigmentSyncProvider *)self enumerateAllFacesPigmentDomains:v11];
  BOOL v8 = v13;
  id v9 = v6;

  return v9;
}

void __53__NTKPigmentSyncProvider_compareLocalSyncDifferences__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1C1875BE0]();
  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v8 = [*(id *)(*(void *)(a1 + 32) + 24) pigmentSetForDomain:v5 bundle:v7];
  id v9 = [*(id *)(*(void *)(a1 + 32) + 32) facePigmentSetForDomain:v5 sharedCollections:*(void *)(a1 + 40)];
  if (([v8 isEqual:v9] & 1) == 0) {
    [*(id *)(a1 + 48) addObject:v5];
  }
}

- (id)allAvailableFacesSupportingPigment
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (NTKInternalBuild(self, a2) && (CLKIsNTKDaemon() & 1) == 0 && (CLKIsNTKXCTests() & 1) == 0)
  {
    id v3 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[NTKPigmentSyncProvider enumerateAllFacesPigmentDomains:](v3);
    }
  }
  uint64_t v4 = NTKAllAvailableFaceDescriptors(self->_device);
  id v5 = (void *)[v4 mutableCopy];

  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = +[NTKFace defaultFaceFromFaceDescriptor:forDevice:](NTKFace, "defaultFaceFromFaceDescriptor:forDevice:", *(void *)(*((void *)&v15 + 1) + 8 * i), self->_device, (void)v15);
        if ([v12 supportsPigmentEditOption])
        {
          id v13 = [(id)objc_opt_class() pigmentFaceDomain];
          if (v13) {
            [v6 addObject:v12];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (BOOL)areCollections:(id)a3 equalToCollections:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  BOOL v16 = 0;
  uint64_t v7 = [v5 count];
  BOOL v16 = v7 == [v6 count];
  if (*((unsigned char *)v14 + 24))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__NTKPigmentSyncProvider_areCollections_equalToCollections___block_invoke;
    v10[3] = &unk_1E62C8418;
    id v12 = &v13;
    id v11 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:v10];

    BOOL v8 = *((unsigned char *)v14 + 24) != 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __60__NTKPigmentSyncProvider_areCollections_equalToCollections___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  BOOL v8 = (void *)MEMORY[0x1C1875BE0]();
  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = NTKEqualObjects(v7, v9);

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

- (NTKPigmentSyncProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKPigmentSyncProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSyncing:(BOOL)a3
{
  self->_BOOL syncing = a3;
}

- (NTKPigmentEditOptionStore)pigmentStore
{
  return self->_pigmentStore;
}

- (void)setPigmentStore:(id)a3
{
}

- (NTKPigmentPersistentStorageController)storageController
{
  return self->_storageController;
}

- (void)setStorageController:(id)a3
{
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BOOL)shouldSyncSharedCollections
{
  return self->_shouldSyncSharedCollections;
}

- (void)setShouldSyncSharedCollections:(BOOL)a3
{
  self->_shouldSyncSharedCollections = a3;
}

- (NSMutableSet)domainsRequiringDeltaSync
{
  return self->_domainsRequiringDeltaSync;
}

- (void)setDomainsRequiringDeltaSync:(id)a3
{
}

- (NSMutableArray)faceDomainsToBeSynced
{
  return self->_faceDomainsToBeSynced;
}

- (void)setFaceDomainsToBeSynced:(id)a3
{
}

- (BOOL)requestDeltaSyncAfterSyncing
{
  return self->_requestDeltaSyncAfterSyncing;
}

- (void)setRequestDeltaSyncAfterSyncing:(BOOL)a3
{
  self->_requestDeltaSyncAfterSyncing = a3;
}

- (BOOL)receivedUpdateDuringSync
{
  return self->_receivedUpdateDuringSync;
}

- (void)setReceivedUpdateDuringSync:(BOOL)a3
{
  self->_receivedUpdateDuringSync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceDomainsToBeSynced, 0);
  objc_storeStrong((id *)&self->_domainsRequiringDeltaSync, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_storageController, 0);
  objc_storeStrong((id *)&self->_pigmentStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 56);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "#sync Domains requiring delta sync will be ignored because there is no face descriptor for them. %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)enumerateAllFacesPigmentDomains:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_FAULT, "SyncProviderUsedInvalid: Sync provider used outside of NTK Daemons", v1, 2u);
}

void __39__NTKPigmentSyncProvider_nextSyncData___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 domain];
  uint64_t v5 = [a1 face];
  int v6 = 138543618;
  id v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "#sync No pigment set for domain. It won't be synced %{public}@ - %{public}@", (uint8_t *)&v6, 0x16u);
}

@end