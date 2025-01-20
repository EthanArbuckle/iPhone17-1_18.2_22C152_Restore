@interface WBSCloudTabStore
- (BOOL)_closeTabs:(id)a3 onDevice:(id)a4;
- (BOOL)_writeCloseRequestForTab:(id)a3 onDevice:(id)a4;
- (BOOL)atLeastOneOtherActiveDeviceIsRegistered;
- (BOOL)closeAllTabsOnDevice:(id)a3;
- (BOOL)closeTab:(id)a3 onDevice:(id)a4;
- (BOOL)cloudTabsAreEnabled;
- (BOOL)currentDeviceIsRegisteredInCloudKit;
- (BOOL)syncAgentIsAvailable;
- (NSArray)syncedCloudTabDevices;
- (NSDictionary)dictionaryRepresentationOfCurrentDeviceInCloudKit;
- (NSError)lastFetchError;
- (WBSCloudTabStore)init;
- (WBSCloudTabStoreDelegate)wbsDelegate;
- (id)_currentDeviceUUID;
- (id)_deviceWithTabsWithOutstandingCloseRequestsRemoved:(id)a3 closeRequestsForDevice:(id)a4;
- (id)_devicesByFilteringAndSortingDevices:(id)a3;
- (id)syncedRemoteCloudTabDevicesForProfileWithIdentifier:(id)a3;
- (int64_t)uniqueDeviceMultiplicity;
- (unint64_t)_indexOfDeviceInSyncedCloudTabDevicesFromCloudKit:(id)a3;
- (unint64_t)totalSyncedCloudTabDeviceCount;
- (void)_addCloseRequestDictionary:(id)a3 toDeviceUUIDsToCloseRequestsDictionary:(id)a4 requestUUID:(id)a5;
- (void)_didFetchDeviceDictionariesFromCloudKit:(id)a3 fetchedCloseRequests:(id)a4 error:(id)a5;
- (void)_didFetchDeviceDictionariesFromCloudKit:(id)a3 fetchedCloseRequests:(id)a4 fetchedDevicesBySyncing:(BOOL)a5 error:(id)a6;
- (void)_syncAgentProxyConnectionWasInvalidated:(id)a3;
- (void)_tabWasClosed:(id)a3 onDevice:(id)a4;
- (void)_tabsWereClosed:(id)a3 onDevice:(id)a4;
- (void)addCloudTabsObserver:(id)a3;
- (void)clearTabsForFirstDuplicateDeviceInCloudKitWithName:(id)a3;
- (void)clearTabsForFirstDuplicateDeviceInCloudKitWithName:(id)a3 passingTest:(id)a4;
- (void)deleteAllDevicesFromCloudKit;
- (void)fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit;
- (void)handleCloseTabRequestsFromCloudKit;
- (void)notifyObserversOfSyncedCloudTabDevicesChanged;
- (void)pruneExpiredDevicesFromCloudKit;
- (void)resetSyncedCloudTabDevicesAndCloseRequestsFromCloudKit;
- (void)saveCurrentCloudTabDeviceDictionaryToCloudKit:(id)a3 completionHandler:(id)a4;
- (void)setWbsDelegate:(id)a3;
@end

@implementation WBSCloudTabStore

- (void)_didFetchDeviceDictionariesFromCloudKit:(id)a3 fetchedCloseRequests:(id)a4 fetchedDevicesBySyncing:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218243;
    uint64_t v25 = [v10 count];
    __int16 v26 = 2113;
    id v27 = v10;
    _os_log_impl(&dword_1A6B5F000, v13, OS_LOG_TYPE_DEFAULT, "Fetched %lu devices from CloudKit: %{private}@", buf, 0x16u);
  }

  self->_isFetchingDataFromCloudKit = !v7;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__WBSCloudTabStore__didFetchDeviceDictionariesFromCloudKit_fetchedCloseRequests_fetchedDevicesBySyncing_error___block_invoke;
  block[3] = &unk_1E5C8E3E0;
  block[4] = self;
  BOOL v23 = v7;
  id v15 = v12;
  id v20 = v15;
  id v16 = v10;
  id v21 = v16;
  id v17 = v11;
  id v22 = v17;
  dispatch_sync(internalQueue, block);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wbsDelegate);
  if (v7)
  {
    if (objc_opt_respondsToSelector()) {
      [WeakRetained didUpdateDevicesAndCloseRequestsFromCloudKitForCloudTabStore:self error:v15];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [WeakRetained didGetCachedDevicesFromCloudKitForCloudTabStore:self];
  }
}

void __111__WBSCloudTabStore__didFetchDeviceDictionariesFromCloudKit_fetchedCloseRequests_fetchedDevicesBySyncing_error___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  if (*(unsigned char *)(a1 + 64)) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  }
  v9 = [*(id *)(a1 + 32) _currentDeviceUUID];
  v42 = [v9 UUIDString];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = *(id *)(a1 + 48);
  uint64_t v10 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v49;
    *(void *)&long long v11 = 134218242;
    long long v41 = v11;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        id v15 = objc_msgSend(v14, "deviceOrCloseRequestDictionary", v41);
        if (+[WBSCloudTabDevice isCloudTabDeviceDictionary:v15])
        {
          id v16 = [v14 uuidString];
          id v17 = [[WBSCloudTabDevice alloc] initWithDictionary:v15 uuid:v16];
          if (v17)
          {
            [*(id *)(*(void *)(a1 + 32) + 24) addObject:v17];
            if ([v16 isEqualToString:v42])
            {
              uint64_t v18 = *(void *)(a1 + 32);
              v19 = v17;
              id v20 = *(NSObject **)(v18 + 40);
              *(void *)(v18 + 40) = v19;
            }
            else
            {
              id v20 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                id v21 = [(WBSCloudTabDevice *)v17 tabs];
                uint64_t v22 = [v21 count];
                *(_DWORD *)buf = v41;
                uint64_t v54 = v22;
                __int16 v55 = 2114;
                v56 = v16;
                _os_log_impl(&dword_1A6B5F000, v20, OS_LOG_TYPE_DEFAULT, "Fetched %lu tabs from CloudKit for device with UUID %{public}@", buf, 0x16u);
              }
            }
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v10);
  }

  BOOL v23 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = [*(id *)(a1 + 56) count];
    uint64_t v25 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 134218243;
    uint64_t v54 = v24;
    __int16 v55 = 2113;
    v56 = v25;
    _os_log_impl(&dword_1A6B5F000, v23, OS_LOG_TYPE_DEFAULT, "Fetched %lu close requests from CloudKit: %{private}@", buf, 0x16u);
  }

  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void **)(v27 + 48);
  *(void *)(v27 + 48) = v26;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v29 = *(id *)(a1 + 56);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(v29);
        }
        v33 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        v34 = [v33 deviceOrCloseRequestDictionary];
        if (+[WBSCloudTabCloseRequest isCloudTabCloseRequestDictionary:v34])
        {
          v35 = *(void **)(a1 + 32);
          uint64_t v36 = v35[6];
          v37 = [v33 uuidString];
          [v35 _addCloseRequestDictionary:v34 toDeviceUUIDsToCloseRequestsDictionary:v36 requestUUID:v37];
        }
      }
      uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v30);
  }

  uint64_t v38 = [*(id *)(a1 + 32) _devicesByFilteringAndSortingDevices:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v39 = *(void *)(a1 + 32);
  v40 = *(void **)(v39 + 32);
  *(void *)(v39 + 32) = v38;
}

- (id)_devicesByFilteringAndSortingDevices:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v26;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        deviceUUIDsToCloseRequestsFromCloudKit = self->_deviceUUIDsToCloseRequestsFromCloudKit;
        long long v11 = [v9 uuid];
        uint64_t v12 = [(NSMutableDictionary *)deviceUUIDsToCloseRequestsFromCloudKit objectForKeyedSubscript:v11];
        v13 = [(WBSCloudTabStore *)self _deviceWithTabsWithOutstandingCloseRequestsRemoved:v9 closeRequestsForDevice:v12];

        v14 = [v13 tabs];
        LOBYTE(v12) = [v14 count] == 0;

        if ((v12 & 1) == 0)
        {
          id v15 = [v13 name];
          id v16 = [v4 objectForKeyedSubscript:v15];

          if (!v16)
          {
            uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
            uint64_t v18 = [v13 name];
            [v4 setObject:v17 forKeyedSubscript:v18];

            id v16 = (void *)v17;
          }
          [v16 addObject:v13];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v6);
  }

  v19 = [(WBSCloudTabStore *)self _currentDeviceUUID];
  id v20 = [v19 UUIDString];

  id v21 = [MEMORY[0x1E4F1CA48] array];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __57__WBSCloudTabStore__devicesByFilteringAndSortingDevices___block_invoke;
  v27[3] = &unk_1E5C8E450;
  id v22 = v20;
  id v28 = v22;
  id v23 = v21;
  id v29 = v23;
  [v4 enumerateKeysAndObjectsUsingBlock:v27];
  [v23 sortUsingComparator:&__block_literal_global_50];
  uint64_t v24 = (void *)[v23 copy];

  return v24;
}

- (void)addCloudTabsObserver:(id)a3
{
}

- (BOOL)syncAgentIsAvailable
{
  return self->_syncAgentIsAvailable;
}

- (id)syncedRemoteCloudTabDevicesForProfileWithIdentifier:(id)a3
{
  uint64_t v3 = [(WBSCloudTabStore *)self syncedCloudTabDevices];
  return v3;
}

- (void)setWbsDelegate:(id)a3
{
}

- (WBSCloudTabStore)init
{
  v10.receiver = self;
  v10.super_class = (Class)WBSCloudTabStore;
  id v2 = [(WBSCloudTabStore *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.SafariShared.WBSCloudTabStore", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    v2->_syncAgentIsAvailable = 1;
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__syncAgentProxyConnectionWasInvalidated_ name:*MEMORY[0x1E4F981A8] object:0];

    v8 = v2;
  }

  return v2;
}

- (void)fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit
{
  if (self->_syncAgentIsAvailable)
  {
    objc_initWeak(location, self);
    dispatch_queue_t v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_DEFAULT, "Fetching data from CloudKit", buf, 2u);
    }
    if (self->_hasAttemptedToFetchDevicesAtLeastOnce)
    {
      char v4 = 0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_wbsDelegate);
      char v4 = objc_opt_respondsToSelector();
    }
    self->_hasAttemptedToFetchDevicesAtLeastOnce = 1;
    v8 = [MEMORY[0x1E4F97FB8] sharedProxy];
    if (v4)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_DEFAULT, "Getting cached CloudTab devices from the sync agent", buf, 2u);
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke;
      v12[3] = &unk_1E5C8E2A8;
      objc_copyWeak(&v13, location);
      [v8 getCloudTabDevicesWithCompletionHandler:v12];
      objc_destroyWeak(&v13);
    }
    self->_isFetchingDataFromCloudKit = 1;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke_19;
    v10[3] = &unk_1E5C8E2F8;
    objc_copyWeak(&v11, location);
    [v8 fetchSyncedCloudTabDevicesAndCloseRequestsWithCompletionHandler:v10];
    objc_destroyWeak(&v11);

    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEFAULT, "Bypassing fetching data from CloudKit because CloudKit syncing of iCloud Tabs is not available", (uint8_t *)location, 2u);
    }
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4099 userInfo:0];
    [(WBSCloudTabStore *)self _didFetchDeviceDictionariesFromCloudKit:0 fetchedCloseRequests:0 error:v6];
  }
}

void __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke_2_20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _didFetchDeviceDictionariesFromCloudKit:*(void *)(a1 + 32) fetchedCloseRequests:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke_2(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_DEFAULT, "Received cached CloudTab devices from the sync agent", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didFetchDeviceDictionariesFromCloudKit:*(void *)(a1 + 32) fetchedCloseRequests:0 fetchedDevicesBySyncing:0 error:0];
}

- (void)_didFetchDeviceDictionariesFromCloudKit:(id)a3 fetchedCloseRequests:(id)a4 error:(id)a5
{
}

- (void)notifyObserversOfSyncedCloudTabDevicesChanged
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  dispatch_queue_t v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    uint64_t v6 = *MEMORY[0x1E4F980C8];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 cloudTabDeviceProvider:self didUpdateCloudTabsInProfileWithIdentifier:v6];
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke_2;
  v5[3] = &unk_1E5C8E280;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke_19(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__WBSCloudTabStore_fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke_2_20;
  v13[3] = &unk_1E5C8E2D0;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  id v14 = v7;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v13);

  objc_destroyWeak(&v17);
}

- (void)handleCloseTabRequestsFromCloudKit
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_DEFAULT, "Handling close requests from CloudKit", buf, 2u);
  }
  deviceUUIDsToCloseRequestsFromCloudKit = self->_deviceUUIDsToCloseRequestsFromCloudKit;
  uint64_t v5 = [(WBSCloudTabStore *)self _currentDeviceUUID];
  id v6 = [v5 UUIDString];
  id v7 = [(NSMutableDictionary *)deviceUUIDsToCloseRequestsFromCloudKit objectForKeyedSubscript:v6];

  if ([v7 count])
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          -[WBSCloudTabStore _closeRequestedTabIfPossible:](self, "_closeRequestedTabIfPossible:", v13, (void)v18);
          id v14 = [v13 requestUUID];
          id v15 = [v14 UUIDString];
          [v8 addObject:v15];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v10);
    }

    id v16 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6B5F000, v16, OS_LOG_TYPE_DEFAULT, "Deleting close requests for this device from CloudKit", buf, 2u);
    }
    id v17 = objc_msgSend(MEMORY[0x1E4F97FB8], "sharedProxy", (void)v18);
    [v17 deleteCloudTabCloseRequestsWithUUIDStrings:v8 completionHandler:&__block_literal_global_24_0];
  }
}

- (NSArray)syncedCloudTabDevices
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__6;
  uint64_t v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  internalQueue = self->_internalQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__WBSCloudTabStore_syncedCloudTabDevices__block_invoke;
  v6[3] = &unk_1E5C8E190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(internalQueue, v6);
  id v3 = (void *)v8[5];
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __41__WBSCloudTabStore_syncedCloudTabDevices__block_invoke(uint64_t a1)
{
}

- (unint64_t)totalSyncedCloudTabDeviceCount
{
  return [(NSMutableArray *)self->_syncedCloudTabDevicesFromCloudKit count];
}

- (BOOL)atLeastOneOtherActiveDeviceIsRegistered
{
  return ([(WBSCloudTabStore *)self uniqueDeviceMultiplicity] & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)closeTab:(id)a3 onDevice:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 uuidString];
    uint64_t v10 = [v7 uuid];
    *(_DWORD *)buf = 138543618;
    id v23 = v9;
    __int16 v24 = 2114;
    uint64_t v25 = v10;
    _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_DEFAULT, "Closing single tab with UUID %{public}@ on device with UUID %{public}@", buf, 0x16u);
  }
  uint64_t v11 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    [v6 description];
    objc_claimAutoreleasedReturnValue();
    [v7 name];
    objc_claimAutoreleasedReturnValue();
    -[WBSCloudTabStore closeTab:onDevice:]();
  }

  if (([v7 isCloseRequestSupported] & 1) == 0)
  {
    id v16 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    BOOL v15 = 0;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)long long v21 = 0;
    _os_log_impl(&dword_1A6B5F000, v16, OS_LOG_TYPE_DEFAULT, "Device doesn't support close requests", v21, 2u);
LABEL_11:
    BOOL v15 = 0;
    goto LABEL_12;
  }
  id v12 = [v7 uuid];
  BOOL v13 = [v12 length] == 0;

  if (v13
    || ![(WBSCloudTabStore *)self _writeCloseRequestForTab:v6 onDevice:v7])
  {
    goto LABEL_11;
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__WBSCloudTabStore_closeTab_onDevice___block_invoke;
  block[3] = &unk_1E5C8D840;
  block[4] = self;
  id v19 = v6;
  id v20 = v7;
  dispatch_sync(internalQueue, block);

  BOOL v15 = 1;
LABEL_12:

  return v15;
}

void __38__WBSCloudTabStore_closeTab_onDevice___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _tabWasClosed:*(void *)(a1 + 40) onDevice:*(void *)(a1 + 48)];
  uint64_t v2 = [*(id *)(a1 + 32) _devicesByFilteringAndSortingDevices:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

- (BOOL)closeAllTabsOnDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uuid];
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEFAULT, "Closing all tabs on device with UUID %{public}@", buf, 0xCu);
  }
  id v7 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    [v4 name];
    objc_claimAutoreleasedReturnValue();
    -[WBSCloudTabStore closeAllTabsOnDevice:]();
  }

  if (([v4 isCloseRequestSupported] & 1) == 0)
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    BOOL v11 = 0;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_DEFAULT, "Device doesn't support close requests", v14, 2u);
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_11;
  }
  id v8 = [v4 uuid];
  BOOL v9 = [v8 length] == 0;

  if (v9) {
    goto LABEL_10;
  }
  uint64_t v10 = [v4 tabs];
  BOOL v11 = [(WBSCloudTabStore *)self _closeTabs:v10 onDevice:v4];

LABEL_11:
  return v11;
}

- (void)resetSyncedCloudTabDevicesAndCloseRequestsFromCloudKit
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__WBSCloudTabStore_resetSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke;
  block[3] = &unk_1E5C8CA70;
  block[4] = self;
  dispatch_sync(internalQueue, block);
  deviceUUIDsToCloseRequestsFromCloudKit = self->_deviceUUIDsToCloseRequestsFromCloudKit;
  self->_deviceUUIDsToCloseRequestsFromCloudKit = 0;
}

void __74__WBSCloudTabStore_resetSyncedCloudTabDevicesAndCloseRequestsFromCloudKit__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;
}

- (void)saveCurrentCloudTabDeviceDictionaryToCloudKit:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v15 = 0;
    _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_DEFAULT, "Saving current device to CloudKit", v15, 2u);
  }
  BOOL v9 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    [v6 description];
    objc_claimAutoreleasedReturnValue();
    -[WBSCloudTabStore saveCurrentCloudTabDeviceDictionaryToCloudKit:completionHandler:]();
  }

  uint64_t v10 = [(WBSCloudTabStore *)self _currentDeviceUUID];
  BOOL v11 = [v10 UUIDString];

  id v12 = [[WBSCloudTabDevice alloc] initWithDictionary:v6 uuid:v11];
  currentDevice = self->_currentDevice;
  self->_currentDevice = v12;

  id v14 = [MEMORY[0x1E4F97FB8] sharedProxy];
  [v14 saveTabsForCurrentDeviceWithDictionaryRepresentation:v6 deviceUUIDString:v11 completionHandler:v7];
}

- (int64_t)uniqueDeviceMultiplicity
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 1;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__WBSCloudTabStore_uniqueDeviceMultiplicity__block_invoke;
  v5[3] = &unk_1E5C8E1B8;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __44__WBSCloudTabStore_uniqueDeviceMultiplicity__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 56))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v3 = *(id *)(v2 + 24);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v8;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          if ((objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6), "hasDuplicateName", (void)v7) & 1) == 0)
          {
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;

            return;
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
  }
}

- (NSError)lastFetchError
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__6;
  long long v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__WBSCloudTabStore_lastFetchError__block_invoke;
  v5[3] = &unk_1E5C8E190;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

void __34__WBSCloudTabStore_lastFetchError__block_invoke(uint64_t a1)
{
}

- (BOOL)currentDeviceIsRegisteredInCloudKit
{
  return self->_currentDevice != 0;
}

- (NSDictionary)dictionaryRepresentationOfCurrentDeviceInCloudKit
{
  return [(WBSCloudTabDevice *)self->_currentDevice dictionaryRepresentation];
}

- (void)pruneExpiredDevicesFromCloudKit
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "No expired devices found in CloudKit", v1, 2u);
}

void __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke_cold_1(a1, v2);
  }
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke_9;
  v7[3] = &unk_1E5C8E1E0;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v4 = objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", v7);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

id __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 hasDuplicateName];
  uint64_t v5 = 40;
  if (v4) {
    uint64_t v5 = 32;
  }
  id v6 = *(id *)(a1 + v5);
  long long v7 = [v3 lastModified];
  uint64_t v8 = [v7 compare:v6];

  if (v8 == -1)
  {
    long long v10 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v3 uuid];
      int v13 = 138543362;
      id v14 = v11;
      _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_DEFAULT, "Pruning expired CloudKit device with UUID %{public}@", (uint8_t *)&v13, 0xCu);
    }
    id v9 = [v3 uuid];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke_11_cold_1();
    }
  }
}

- (void)clearTabsForFirstDuplicateDeviceInCloudKitWithName:(id)a3
{
}

- (void)clearTabsForFirstDuplicateDeviceInCloudKitWithName:(id)a3 passingTest:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_DEFAULT, "Clearing tabs for first duplicate device in CloudKit", buf, 2u);
  }
  *(void *)buf = 0;
  long long v31 = buf;
  uint64_t v32 = 0x3032000000;
  long long v33 = __Block_byref_object_copy__6;
  v34 = __Block_byref_object_dispose__6;
  id v35 = 0;
  internalQueue = self->_internalQueue;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  __int16 v24 = __83__WBSCloudTabStore_clearTabsForFirstDuplicateDeviceInCloudKitWithName_passingTest___block_invoke;
  uint64_t v25 = &unk_1E5C8E258;
  uint64_t v26 = self;
  id v10 = v6;
  id v27 = v10;
  id v29 = buf;
  id v11 = v7;
  id v28 = v11;
  dispatch_sync(internalQueue, &v22);
  uint64_t v12 = (void *)*((void *)v31 + 5);
  if (v12)
  {
    int v13 = objc_msgSend(v12, "uuid", v22, v23, v24, v25, v26, v27);
    id v14 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v36 = 138543362;
      v37 = v13;
      _os_log_impl(&dword_1A6B5F000, v14, OS_LOG_TYPE_DEFAULT, "Marking device with UUID %{public}@ as a duplicate", v36, 0xCu);
    }
    uint64_t v15 = [WBSCloudTabDevice alloc];
    uint64_t v16 = [*((id *)v31 + 5) name];
    uint64_t v17 = [*((id *)v31 + 5) lastModified];
    uint64_t v18 = [(WBSCloudTabDevice *)v15 initWithDeviceName:v16 lastModified:v17 hasDuplicateName:1 tabs:0 uuid:v13];
    id v19 = (void *)*((void *)v31 + 5);
    *((void *)v31 + 5) = v18;

    id v20 = [MEMORY[0x1E4F97FB8] sharedProxy];
    long long v21 = [*((id *)v31 + 5) dictionaryRepresentation];
    [v20 saveTabsForCurrentDeviceWithDictionaryRepresentation:v21 deviceUUIDString:v13 completionHandler:0];
  }
  _Block_object_dispose(buf, 8);
}

void __83__WBSCloudTabStore_clearTabsForFirstDuplicateDeviceInCloudKitWithName_passingTest___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__WBSCloudTabStore_clearTabsForFirstDuplicateDeviceInCloudKitWithName_passingTest___block_invoke_13;
    v8[3] = &unk_1E5C8E230;
    id v9 = *(id *)(a1 + 40);
    long long v6 = *(_OWORD *)(a1 + 48);
    id v3 = (id)v6;
    long long v10 = v6;
    [v2 enumerateObjectsUsingBlock:v8];
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      int v4 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_DEFAULT, "No eligible device with the same name found when looking for duplicates", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __83__WBSCloudTabStore_clearTabsForFirstDuplicateDeviceInCloudKitWithName_passingTest___block_invoke_cold_1(v5);
    }
  }
}

void __83__WBSCloudTabStore_clearTabsForFirstDuplicateDeviceInCloudKitWithName_passingTest___block_invoke_13(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (([v6 isEphemeralDevice] & 1) == 0)
  {
    id v7 = [v6 name];
    char v8 = [v7 isEqualToString:a1[4]];

    if ((v8 & 1) != 0 && ([v6 hasDuplicateName] & 1) == 0)
    {
      if (*(void *)(*(void *)(a1[6] + 8) + 40))
      {
        id v9 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          long long v10 = [v6 uuid];
          int v24 = 138543362;
          uint64_t v25 = v10;
          _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_DEFAULT, "Found more than one device with the same name when looking for duplicates, second device has UUID %{public}@", (uint8_t *)&v24, 0xCu);
        }
        uint64_t v11 = *(void *)(a1[6] + 8);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = 0;

        *a4 = 1;
      }
      else
      {
        int v13 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [v6 uuid];
          int v24 = 138543362;
          uint64_t v25 = v14;
          _os_log_impl(&dword_1A6B5F000, v13, OS_LOG_TYPE_DEFAULT, "Found device with UUID %{public}@ with the same name as this device when looking for duplicates", (uint8_t *)&v24, 0xCu);
        }
        uint64_t v15 = [WBSCloudTabDevice alloc];
        uint64_t v16 = [v6 dictionaryRepresentation];
        uint64_t v17 = [v6 uuid];
        uint64_t v18 = [(WBSCloudTabDevice *)v15 initWithDictionary:v16 uuid:v17];
        uint64_t v19 = *(void *)(a1[6] + 8);
        id v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;

        uint64_t v21 = a1[5];
        if (v21
          && ((*(uint64_t (**)(uint64_t, void))(v21 + 16))(v21, *(void *)(*(void *)(a1[6] + 8) + 40)) & 1) == 0)
        {
          uint64_t v22 = *(void *)(a1[6] + 8);
          uint64_t v23 = *(void **)(v22 + 40);
          *(void *)(v22 + 40) = 0;
        }
      }
    }
  }
}

void __54__WBSCloudTabStore_handleCloseTabRequestsFromCloudKit__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __54__WBSCloudTabStore_handleCloseTabRequestsFromCloudKit__block_invoke_cold_1();
    }
  }
  int v4 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_DEFAULT, "Finished deleting close requests for this device from CloudKit", v5, 2u);
  }
}

- (void)deleteAllDevicesFromCloudKit
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_DEFAULT, "Deleting all devices from CloudKit", buf, 2u);
  }
  *(void *)buf = 0;
  uint64_t v18 = buf;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__6;
  uint64_t v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke;
  block[3] = &unk_1E5C8E1B8;
  block[4] = self;
  void block[5] = buf;
  dispatch_sync(internalQueue, block);
  currentDevice = self->_currentDevice;
  if (currentDevice)
  {
    uint64_t v6 = (void *)*((void *)v18 + 5);
    id v7 = [(WBSCloudTabDevice *)currentDevice uuid];
    if (v6)
    {
      [v6 arrayByAddingObject:v7];
    }
    else
    {
      v23[0] = v7;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    uint64_t v8 = };
    id v9 = (void *)*((void *)v18 + 5);
    *((void *)v18 + 5) = v8;
  }
  if ([*((id *)v18 + 5) count])
  {
    objc_initWeak(location, self);
    long long v10 = [MEMORY[0x1E4F97FB8] sharedProxy];
    uint64_t v11 = *((void *)v18 + 5);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke_28;
    v13[3] = &unk_1E5C8E368;
    objc_copyWeak(&v14, location);
    [v10 deleteDevicesWithUUIDStrings:v11 completionHandler:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v12 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_DEFAULT, "No devices found in CloudKit to delete", (uint8_t *)location, 2u);
    }
  }
  _Block_object_dispose(buf, 8);
}

void __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_26_0);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    int v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

id __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 uuid];
  return v2;
}

void __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke_28(uint64_t a1, void *a2)
{
  v6[4] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke_28_cold_1();
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke_29;
  block[3] = &unk_1E5C8E340;
  objc_copyWeak(v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v6);
}

void __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke_29(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_DEFAULT, "Fetching data from CloudKit after deleting all devices", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit];
}

- (BOOL)cloudTabsAreEnabled
{
  return 1;
}

- (BOOL)_writeCloseRequestForTab:(id)a3 onDevice:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v24 = a4;
  id v7 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v8 = [(WBSCloudTabStore *)self _currentDeviceUUID];
  id v9 = objc_alloc(MEMORY[0x1E4F29128]);
  long long v10 = [v24 uuid];
  uint64_t v11 = (void *)[v9 initWithUUIDString:v10];

  uint64_t v12 = [WBSCloudTabCloseRequest alloc];
  int v13 = [v6 url];
  id v14 = [v6 uuidString];
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v16 = [(WBSCloudTabCloseRequest *)v12 initWithURL:v13 tabUUIDString:v14 lastModified:v15 sourceDeviceUUID:v8 destinationDeviceUUID:v11 requestUUID:v7];
  uint64_t v17 = [(WBSCloudTabCloseRequest *)v16 dictionaryRepresentation];

  if (v17)
  {
    uint64_t v18 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v11 UUIDString];
      *(_DWORD *)buf = 138543362;
      id v27 = v19;
      _os_log_impl(&dword_1A6B5F000, v18, OS_LOG_TYPE_DEFAULT, "Writing close request to CloudKit for device with UUID %{public}@", buf, 0xCu);
    }
    id v20 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      [v11 UUIDString];
      objc_claimAutoreleasedReturnValue();
      [v6 url];
      objc_claimAutoreleasedReturnValue();
      -[WBSCloudTabStore _writeCloseRequestForTab:onDevice:]();
    }

    uint64_t v21 = [MEMORY[0x1E4F97FB8] sharedProxy];
    id v22 = [v7 UUIDString];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke;
    v25[3] = &unk_1E5C8D348;
    v25[4] = self;
    [v21 saveCloudTabCloseRequestWithDictionaryRepresentation:v17 closeRequestUUIDString:v22 completionHandler:v25];
  }
  return v17 != 0;
}

void __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke(uint64_t a1, void *a2)
{
  block[8] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke_cold_1();
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke_34;
    block[3] = &unk_1E5C8CA70;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke_34(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke_34_cold_1(v2);
  }
  return [*(id *)(a1 + 32) fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit];
}

- (BOOL)_closeTabs:(id)a3 onDevice:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if ([(WBSCloudTabStore *)self _writeCloseRequestForTab:v13 onDevice:v7]) {
          [v8 addObject:v13];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [v8 count];
  if (v14)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__WBSCloudTabStore__closeTabs_onDevice___block_invoke;
    block[3] = &unk_1E5C8D840;
    void block[4] = self;
    id v18 = v8;
    id v19 = v7;
    dispatch_sync(internalQueue, block);
  }
  return v14 != 0;
}

void __40__WBSCloudTabStore__closeTabs_onDevice___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _tabsWereClosed:*(void *)(a1 + 40) onDevice:*(void *)(a1 + 48)];
  uint64_t v2 = [*(id *)(a1 + 32) _devicesByFilteringAndSortingDevices:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

- (id)_deviceWithTabsWithOutstandingCloseRequestsRemoved:(id)a3 closeRequestsForDevice:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v23 = a3;
  id v25 = a4;
  if ([v25 count])
  {
    uint64_t v5 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v23 uuid];
      *(_DWORD *)buf = 138543362;
      long long v33 = v6;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEFAULT, "Removing tabs with outstanding close requests for device with UUID %{public}@", buf, 0xCu);
    }
    id v7 = [v23 tabs];
    uint64_t v8 = [v7 count];

    id v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = [v23 tabs];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __94__WBSCloudTabStore__deviceWithTabsWithOutstandingCloseRequestsRemoved_closeRequestsForDevice___block_invoke;
          v26[3] = &unk_1E5C8E390;
          v26[4] = v13;
          if ([v25 indexOfObjectPassingTest:v26] == 0x7FFFFFFFFFFFFFFFLL)
          {
            [v24 addObject:v13];
          }
          else
          {
            uint64_t v14 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = [v13 uuid];
              *(_DWORD *)buf = 138543362;
              long long v33 = v15;
              _os_log_impl(&dword_1A6B5F000, v14, OS_LOG_TYPE_DEFAULT, "Removing tab with outstanding close request with UUID %{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v10);
    }

    if ([v24 count])
    {
      uint64_t v16 = +[WBSCloudTabDeviceParameters parametersWithDevice:v23];
      [v16 setTabs:v24];
      uint64_t v17 = [WBSCloudTabDevice alloc];
      id v18 = [v23 uuid];
      uint64_t v19 = [(WBSCloudTabDevice *)v17 initWithParameters:v16 uuid:v18];
    }
    else
    {
      uint64_t v19 = 0;
    }

    long long v20 = v23;
    long long v23 = v19;
  }
  else
  {
    long long v20 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      long long v21 = [v23 uuid];
      *(_DWORD *)buf = 138543362;
      long long v33 = v21;
      _os_log_impl(&dword_1A6B5F000, v20, OS_LOG_TYPE_DEFAULT, "No outstanding close requests for device with UUID %{public}@", buf, 0xCu);
    }
  }

  return v23;
}

uint64_t __94__WBSCloudTabStore__deviceWithTabsWithOutstandingCloseRequestsRemoved_closeRequestsForDevice___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matchesCloudTab:*(void *)(a1 + 32)];
}

- (void)_addCloseRequestDictionary:(id)a3 toDeviceUUIDsToCloseRequestsDictionary:(id)a4 requestUUID:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [WBSCloudTabCloseRequest alloc];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
  uint64_t v11 = [(WBSCloudTabCloseRequest *)v9 initWithDictionary:v15 requestUUID:v10];

  if (v11)
  {
    uint64_t v12 = [(WBSCloudTabCloseRequest *)v11 destinationDeviceUUID];
    uint64_t v13 = [v12 UUIDString];

    id v14 = [v7 objectForKeyedSubscript:v13];
    if (!v14)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v7 setObject:v14 forKeyedSubscript:v13];
    }
    [v14 addObject:v11];
  }
}

- (unint64_t)_indexOfDeviceInSyncedCloudTabDevicesFromCloudKit:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 uuid];
  syncedCloudTabDevicesFromCloudKit = self->_syncedCloudTabDevicesFromCloudKit;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__WBSCloudTabStore__indexOfDeviceInSyncedCloudTabDevicesFromCloudKit___block_invoke;
  v10[3] = &unk_1E5C8E3B8;
  id v11 = v5;
  id v7 = v5;
  unint64_t v8 = [(NSMutableArray *)syncedCloudTabDevicesFromCloudKit indexOfObjectPassingTest:v10];

  return v8;
}

uint64_t __70__WBSCloudTabStore__indexOfDeviceInSyncedCloudTabDevicesFromCloudKit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 uuid];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (void)_tabWasClosed:(id)a3 onDevice:(id)a4
{
  id v9 = a3;
  unint64_t v6 = [(WBSCloudTabStore *)self _indexOfDeviceInSyncedCloudTabDevicesFromCloudKit:a4];
  id v7 = [(NSMutableArray *)self->_syncedCloudTabDevicesFromCloudKit objectAtIndexedSubscript:v6];
  unint64_t v8 = [v7 deviceByRemovingTab:v9];
  [(NSMutableArray *)self->_syncedCloudTabDevicesFromCloudKit replaceObjectAtIndex:v6 withObject:v8];
}

- (void)_tabsWereClosed:(id)a3 onDevice:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  unint64_t v7 = [(WBSCloudTabStore *)self _indexOfDeviceInSyncedCloudTabDevicesFromCloudKit:v6];
  unint64_t v8 = [v6 deviceByRemovingTabs:v9];
  [(NSMutableArray *)self->_syncedCloudTabDevicesFromCloudKit replaceObjectAtIndex:v7 withObject:v8];
}

- (void)_syncAgentProxyConnectionWasInvalidated:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__WBSCloudTabStore__syncAgentProxyConnectionWasInvalidated___block_invoke;
  block[3] = &unk_1E5C8CA70;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__WBSCloudTabStore__syncAgentProxyConnectionWasInvalidated___block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_DEFAULT, "CloudKit syncing of iCloud Tabs is not available", v6, 2u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (v3[16])
  {
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4099 userInfo:0];
    [v3 _didFetchDeviceDictionariesFromCloudKit:0 fetchedCloseRequests:0 error:v4];
  }
  else
  {
    [*(id *)(a1 + 32) resetSyncedCloudTabDevicesAndCloseRequestsFromCloudKit];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

void __57__WBSCloudTabStore__devicesByFilteringAndSortingDevices___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    uint64_t v5 = [v4 firstObject];
    id v6 = [v5 uuid];
    char v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

    if ((v7 & 1) == 0)
    {
      unint64_t v8 = *(void **)(a1 + 40);
      id v9 = [v4 firstObject];
      [v8 addObject:v9];
    }
  }
  else
  {
    [v4 sortUsingComparator:&__block_literal_global_43];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__WBSCloudTabStore__devicesByFilteringAndSortingDevices___block_invoke_3;
    v10[3] = &unk_1E5C8E428;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    [v4 enumerateObjectsUsingBlock:v10];
  }
}

uint64_t __57__WBSCloudTabStore__devicesByFilteringAndSortingDevices___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 uuid];
  id v6 = [v4 uuid];
  uint64_t v7 = [v5 compare:v6];

  return v7;
}

void __57__WBSCloudTabStore__devicesByFilteringAndSortingDevices___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  uint64_t v5 = [v13 uuid];
  char v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    unint64_t v8 = NSString;
    id v9 = _WBSLocalizedString();
    uint64_t v10 = [v13 name];
    id v11 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v10, a3 + 1);
    id v12 = [v13 deviceBySettingDisambiguatedName:v11];
    [v7 addObject:v12];
  }
}

uint64_t __57__WBSCloudTabStore__devicesByFilteringAndSortingDevices___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 lastModified];
  char v6 = [v4 lastModified];
  uint64_t v7 = [v5 compare:v6];

  return v7;
}

- (id)_currentDeviceUUID
{
  return 0;
}

- (WBSCloudTabStoreDelegate)wbsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wbsDelegate);
  return (WBSCloudTabStoreDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wbsDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lastFetchError, 0);
  objc_storeStrong((id *)&self->_deviceUUIDsToCloseRequestsFromCloudKit, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_filteredAndSortedSyncedCloudTabDevicesFromCloudKit, 0);
  objc_storeStrong((id *)&self->_syncedCloudTabDevicesFromCloudKit, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)closeTab:onDevice:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(v2, v3, v4, 5.8081e-34);
  _os_log_debug_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_DEBUG, "Closing single tab %{private}@ on \"%{private}@\"", v5, 0x16u);
}

- (void)closeAllTabsOnDevice:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.808e-34);
  _os_log_debug_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_DEBUG, "Closing all tabs on \"%{private}@\"", v4, 0xCu);
}

- (void)saveCurrentCloudTabDeviceDictionaryToCloudKit:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.808e-34);
  _os_log_debug_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_DEBUG, "Saving current device to CloudKit with dictionary: %{private}@", v4, 0xCu);
}

void __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Current CloudKit devices: %{private}@", (uint8_t *)&v3, 0xCu);
}

void __51__WBSCloudTabStore_pruneExpiredDevicesFromCloudKit__block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Deleting expired devices failed with error %{public}@", v5);
}

void __83__WBSCloudTabStore_clearTabsForFirstDuplicateDeviceInCloudKitWithName_passingTest___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "No other devices found when when looking for duplicates", v1, 2u);
}

void __54__WBSCloudTabStore_handleCloseTabRequestsFromCloudKit__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Deleting close requests for this device failed with error %{public}@", v5);
}

void __48__WBSCloudTabStore_deleteAllDevicesFromCloudKit__block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Deleting all devices in CloudKit failed with error %{public}@", v5);
}

- (void)_writeCloseRequestForTab:onDevice:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(v2, v3, v4, 5.8382e-34);
  _os_log_debug_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_DEBUG, "Writing close request to CloudKit for device with UUID %{public}@ and tab URL %{private}@", v5, 0x16u);
}

void __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Writing close request failed with error %{public}@", v5);
}

void __54__WBSCloudTabStore__writeCloseRequestForTab_onDevice___block_invoke_34_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Fetching data from CloudKit after writing close request failed", v1, 2u);
}

@end