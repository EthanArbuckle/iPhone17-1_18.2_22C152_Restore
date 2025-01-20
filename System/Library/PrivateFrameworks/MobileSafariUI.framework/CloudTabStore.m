@interface CloudTabStore
+ (id)cloudTabForTabDocument:(uint64_t)a1;
+ (id)sharedCloudTabStore;
- (BOOL)_cloudKitDataNeedsFetching;
- (BOOL)closeAllTabsOnDevice:(id)a3;
- (BOOL)closeTab:(id)a3 onDevice:(id)a4;
- (BOOL)cloudTabsAreEnabled;
- (BOOL)tabArrayOfDeviceFromDictionary:(id)a3 isEqualToOtherDeviceTabsFromDictionary:(id)a4 includingLastViewedTime:(BOOL)a5;
- (CloudTabStore)init;
- (CloudTabStoreDelegate)delegate;
- (NSArray)allSyncedCloudTabDevices;
- (id)_currentDeviceUUID;
- (id)_syncedCloudTabDevicesUsingFilter:(BOOL)a3;
- (id)currentDevice;
- (id)syncedCloudTabDevices;
- (void)_callFetchCloudKitDataCompletionHandlers;
- (void)_clearAllDevices;
- (void)_clearTabsForCurrentDeviceWithSyncCompletionHandler:(id)a3;
- (void)_closeRequestedTabIfPossible:(id)a3;
- (void)_cloudKitDataDidUpdateOnServer:(id)a3;
- (void)_cloudKitDataWasDeletedAfterAccountChange:(id)a3;
- (void)_cloudTabsEnabledDidChange;
- (void)_notifyCloudTabStoreDidUpdate;
- (void)_removeConflictingDevice;
- (void)_saveCurrentDeviceCloudTabs:(id)a3 syncCompletionHandler:(id)a4;
- (void)_saveCurrentDeviceCloudTabsNow:(id)a3 syncCompletionHandler:(id)a4;
- (void)_saveCurrentDeviceTabs:(void *)a3 sceneIDToLocalGroupTabs:(int)a4 isForEnteringBackground:(void *)a5 completion:;
- (void)_setCloudKitDataNeedsFetching:(BOOL)a3;
- (void)_waitForInitialCloudKitFetchToComplete:(id)a3;
- (void)clearTabsForCurrentDevice;
- (void)currentDevice;
- (void)didGetCachedDevicesFromCloudKitForCloudTabStore:(id)a3;
- (void)didUpdateDevicesAndCloseRequestsFromCloudKitForCloudTabStore:(id)a3 error:(id)a4;
- (void)fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit;
- (void)saveCurrentDeviceCloudTabs:(id)a3;
- (void)saveCurrentDeviceCloudTabsForEnteringBackground:(id)a3 completion:(id)a4;
- (void)saveCurrentDeviceTabs:(void *)a3 sceneIDToLocalGroupTabs:;
- (void)saveCurrentDeviceTabsForEnteringBackground:(void *)a3 sceneIDToLocalGroupTabs:(void *)a4 completion:;
- (void)saveCurrentDeviceTabsFromBrowserState:(id)a3;
- (void)saveCurrentDeviceTabsFromBrowserState:(id)a3 syncCompletionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startObservingTabStoreStateChanges;
- (void)stopObservingTabStoreStateChanges;
- (void)synchronizeCloudTabDevices;
@end

@implementation CloudTabStore

- (BOOL)cloudTabsAreEnabled
{
  if ([MEMORY[0x1E4FB6EE0] accessLevel] == 2) {
    return 1;
  }
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v4 = [v3 BOOLForKey:@"CloudTabsEnabled"];

  return v4;
}

- (id)syncedCloudTabDevices
{
  return [(CloudTabStore *)self _syncedCloudTabDevicesUsingFilter:1];
}

uint64_t __65__CloudTabStore_didGetCachedDevicesFromCloudKitForCloudTabStore___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callFetchCloudKitDataCompletionHandlers];
}

- (void)startObservingTabStoreStateChanges
{
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 addObserver:self selector:sel__cloudKitDataDidUpdateOnServer_ name:*MEMORY[0x1E4F98188] object:0];

  char v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 addObserver:self selector:sel__cloudKitDataWasDeletedAfterAccountChange_ name:*MEMORY[0x1E4F98180] object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_cloudTabsEnabledDidChange, @"CloudTabStorePrefChangedNotification", 0, (CFNotificationSuspensionBehavior)1024);
}

+ (id)sharedCloudTabStore
{
  if (sharedCloudTabStore_onceToken != -1) {
    dispatch_once(&sharedCloudTabStore_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedCloudTabStore_cloudTabStore;
  return v2;
}

- (void)setDelegate:(id)a3
{
}

+ (id)cloudTabForTabDocument:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [v2 urlForSharing];
  char v4 = [v2 titleForSharing];
  if (![v4 length])
  {
    uint64_t v5 = objc_msgSend(v3, "safari_userVisibleString");

    char v4 = (void *)v5;
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F98A40]) initWithURL:v3];
  [v6 setTitle:v4];
  objc_msgSend(v6, "setShowingReader:", objc_msgSend(v2, "isShowingReader"));
  v7 = [v2 readerContext];
  v8 = [v7 scrollPositionInformation];
  [v6 setReaderScrollPosition:v8];

  [v2 lastViewedTime];
  objc_msgSend(v6, "setLastViewedTime:");
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F98A28]) initWithParameters:v6];

  return v9;
}

void __36__CloudTabStore_sharedCloudTabStore__block_invoke()
{
  v0 = objc_alloc_init(CloudTabStore);
  v1 = (void *)sharedCloudTabStore_cloudTabStore;
  sharedCloudTabStore_cloudTabStore = (uint64_t)v0;
}

- (CloudTabStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)CloudTabStore;
  id v2 = [(WBSCloudTabStore *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(WBSCloudTabStore *)v2 setWbsDelegate:v2];
    [(CloudTabStore *)v3 _setCloudKitDataNeedsFetching:1];
    char v4 = v3;
  }

  return v3;
}

- (void)fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit
{
  if (![(CloudTabStore *)self _cloudKitDataNeedsFetching])
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    char v4 = "Bypassing fetching data from CloudKit because we're already up-to-date";
    goto LABEL_8;
  }
  [(CloudTabStore *)self _setCloudKitDataNeedsFetching:0];
  if ([(WBSCloudTabStore *)self syncAgentIsAvailable])
  {
    self->_hasInitiatedFetchOfCloudKitDataAtLeastOnce = 1;
    v5.receiver = self;
    v5.super_class = (Class)CloudTabStore;
    [(WBSCloudTabStore *)&v5 fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit];
    return;
  }
  v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    char v4 = "Bypassing fetching data from CloudKit because sync agent is not available";
LABEL_8:
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
  }
}

- (void)_setCloudKitDataNeedsFetching:(BOOL)a3
{
  self->__cloudKitDataNeedsFetching = a3;
}

- (void)didGetCachedDevicesFromCloudKitForCloudTabStore:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__CloudTabStore_didGetCachedDevicesFromCloudKitForCloudTabStore___block_invoke;
  v6[3] = &unk_1E6D77E20;
  v6[4] = self;
  [v4 setHandler:v6];
  if ([(WBSCloudTabStore *)self syncAgentIsAvailable])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained cloudTabStoreDidGetCachedDevicesFromCloudKit:self];
  }
}

- (BOOL)_cloudKitDataNeedsFetching
{
  return self->__cloudKitDataNeedsFetching;
}

- (void)didUpdateDevicesAndCloseRequestsFromCloudKitForCloudTabStore:(id)a3 error:(id)a4
{
  id v6 = a4;
  self->_hasCompletedFetchOfCloudKitDataAtLeastOnce = 1;
  if ([(WBSCloudTabStore *)self syncAgentIsAvailable])
  {
    self->_didAttemptToCloseAtLeastOneTab = 0;
    [(WBSCloudTabStore *)self handleCloseTabRequestsFromCloudKit];
    [(CloudTabStore *)self _notifyCloudTabStoreDidUpdate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained cloudTabStore:self didUpdateDevicesFromCloudKitWithError:v6];
    if (self->_didAttemptToCloseAtLeastOneTab) {
      [WeakRetained saveCloudTabsUsingCloudTabStore:self];
    }
    [(CloudTabStore *)self _callFetchCloudKitDataCompletionHandlers];
  }
  else
  {
    [(CloudTabStore *)self _callFetchCloudKitDataCompletionHandlers];
  }
}

- (void)_callFetchCloudKitDataCompletionHandlers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  fetchCloudKitDataCompletionHandlers = self->_fetchCloudKitDataCompletionHandlers;
  if (fetchCloudKitDataCompletionHandlers)
  {
    id v4 = fetchCloudKitDataCompletionHandlers;
    objc_super v5 = self->_fetchCloudKitDataCompletionHandlers;
    self->_fetchCloudKitDataCompletionHandlers = 0;

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v4;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_notifyCloudTabStoreDidUpdate
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = [MEMORY[0x1E4F28EA0] notificationWithName:@"CloudTabStoreDidUpdateNotification" object:self userInfo:0];
  [v3 postNotification:v4];

  [(WBSCloudTabStore *)self notifyObserversOfSyncedCloudTabDevicesChanged];
}

- (id)_currentDeviceUUID
{
  return (id)[MEMORY[0x1E4F78268] deviceUUID];
}

- (id)_syncedCloudTabDevicesUsingFilter:(BOOL)a3
{
  if ([(CloudTabStore *)self cloudTabsAreEnabled])
  {
    v18.receiver = self;
    v18.super_class = (Class)CloudTabStore;
    objc_super v5 = [(WBSCloudTabStore *)&v18 syncedCloudTabDevices];
    id v6 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_DEFAULT, "Synchronizing before returning iCloud Tab devices", buf, 2u);
    }
    [(CloudTabStore *)self synchronizeCloudTabDevices];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v8 = [v7 objectForKey:@"uuidOfCloudTabDeviceUsedForRestoration"];
    [v7 doubleForKey:@"lastModifiedTimeOfCloudTabDeviceUsedForRestoration"];
    if (v8 && a3)
    {
      uint64_t v10 = v9;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __51__CloudTabStore__syncedCloudTabDevicesUsingFilter___block_invoke;
      v15[3] = &unk_1E6D7A610;
      id v16 = v8;
      uint64_t v17 = v10;
      long long v11 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v15);

      id v12 = v11;
    }
    else
    {
      id v12 = v5;
    }
  }
  else
  {
    long long v13 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v13, OS_LOG_TYPE_DEFAULT, "No iCloud Tab devices returned because iCloud Tabs are disabled", buf, 2u);
    }
    id v12 = 0;
  }
  return v12;
}

- (void)stopObservingTabStoreStateChanges
{
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (void)_cloudTabsEnabledDidChange
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 synchronize];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cloudTabStore:cloudTabsEnabledDidChange:", self, -[CloudTabStore cloudTabsAreEnabled](self, "cloudTabsAreEnabled"));
}

- (void)_cloudKitDataDidUpdateOnServer:(id)a3
{
  [(CloudTabStore *)self _setCloudKitDataNeedsFetching:1];
  id v4 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_DEFAULT, "Fetching data from CloudKit because data was updated on server", v5, 2u);
  }
  [(CloudTabStore *)self fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit];
}

- (void)_cloudKitDataWasDeletedAfterAccountChange:(id)a3
{
  id v4 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_DEFAULT, "Received notification of CloudKit data deletion after account change.", v5, 2u);
  }
  [(CloudTabStore *)self _setCloudKitDataNeedsFetching:1];
}

- (id)currentDevice
{
  if ([(WBSCloudTabStore *)self syncAgentIsAvailable])
  {
    v3 = [(WBSCloudTabStore *)self dictionaryRepresentationOfCurrentDeviceInCloudKit];
    if (v3)
    {
      id v4 = objc_alloc(MEMORY[0x1E4F98A30]);
      objc_super v5 = [(CloudTabStore *)self _currentDeviceUUID];
      id v6 = [v5 UUIDString];
      uint64_t v7 = (void *)[v4 initWithDictionary:v3 uuid:v6];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CloudTabStore currentDevice]();
    }
    uint64_t v7 = 0;
  }
  return v7;
}

- (NSArray)allSyncedCloudTabDevices
{
  return (NSArray *)[(CloudTabStore *)self _syncedCloudTabDevicesUsingFilter:0];
}

uint64_t __51__CloudTabStore__syncedCloudTabDevicesUsingFilter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 uuid];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5
    && ([v3 lastModified],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 timeIntervalSinceReferenceDate],
        double v8 = v7,
        double v9 = *(double *)(a1 + 40),
        v6,
        v8 <= v9))
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    uint64_t v10 = 0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = v12;
      long long v14 = [v3 uuid];
      v15 = [v3 lastModified];
      [v15 timeIntervalSinceReferenceDate];
      int v17 = 138543618;
      objc_super v18 = v14;
      __int16 v19 = 2048;
      uint64_t v20 = v16;
      _os_log_impl(&dword_1E102C000, v13, OS_LOG_TYPE_DEFAULT, "Filtering out device with uuid %{public}@ and last modified time %f", (uint8_t *)&v17, 0x16u);

      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

- (void)synchronizeCloudTabDevices
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1E102C000, v0, v1, "Synchronizing with CloudKit", v2, v3, v4, v5, v6);
}

void __43__CloudTabStore_synchronizeCloudTabDevices__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _cloudKitDataNeedsFetching])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__CloudTabStore_synchronizeCloudTabDevices__block_invoke_2;
    block[3] = &unk_1E6D77E20;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1E102C000, v2, OS_LOG_TYPE_DEFAULT, "Bypassing fetching data from CloudKit as part of synchronizing because we're already up-to-date", v3, 2u);
    }
  }
}

uint64_t __43__CloudTabStore_synchronizeCloudTabDevices__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1E102C000, v2, OS_LOG_TYPE_DEFAULT, "Fetching data from CloudKit as part of synchronizing", v4, 2u);
  }
  return [*(id *)(a1 + 32) fetchSyncedCloudTabDevicesAndCloseRequestsFromCloudKit];
}

- (void)_waitForInitialCloudKitFetchToComplete:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  if (self->_hasCompletedFetchOfCloudKitDataAtLeastOnce)
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CloudTabStore _waitForInitialCloudKitFetchToComplete:].cold.4();
    }
    v4[2](v4, 1);
    goto LABEL_16;
  }
  if (!self->_hasInitiatedFetchOfCloudKitDataAtLeastOnce)
  {
    uint64_t v10 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CloudTabStore _waitForInitialCloudKitFetchToComplete:]();
    }
    goto LABEL_15;
  }
  if (![(WBSCloudTabStore *)self syncAgentIsAvailable])
  {
    long long v11 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CloudTabStore _waitForInitialCloudKitFetchToComplete:]();
    }
LABEL_15:
    v4[2](v4, 0);
    goto LABEL_16;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__CloudTabStore__waitForInitialCloudKitFetchToComplete___block_invoke;
  v15[3] = &unk_1E6D77E70;
  uint64_t v16 = v4;
  uint8_t v6 = (void *)MEMORY[0x1E4E42950](v15);
  double v7 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CloudTabStore _waitForInitialCloudKitFetchToComplete:]();
  }
  fetchCloudKitDataCompletionHandlers = self->_fetchCloudKitDataCompletionHandlers;
  if (fetchCloudKitDataCompletionHandlers)
  {
    double v9 = (void *)MEMORY[0x1E4E42950](v6);
    [(NSMutableArray *)fetchCloudKitDataCompletionHandlers addObject:v9];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CA48];
    double v9 = (void *)MEMORY[0x1E4E42950](v6);
    long long v13 = [v12 arrayWithObject:v9];
    long long v14 = self->_fetchCloudKitDataCompletionHandlers;
    self->_fetchCloudKitDataCompletionHandlers = v13;
  }
LABEL_16:
}

uint64_t __56__CloudTabStore__waitForInitialCloudKitFetchToComplete___block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __56__CloudTabStore__waitForInitialCloudKitFetchToComplete___block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)closeTab:(id)a3 onDevice:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CloudTabStore;
  BOOL v5 = [(WBSCloudTabStore *)&v7 closeTab:a3 onDevice:a4];
  if (v5) {
    [(CloudTabStore *)self _notifyCloudTabStoreDidUpdate];
  }
  return v5;
}

- (BOOL)closeAllTabsOnDevice:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CloudTabStore;
  BOOL v4 = [(WBSCloudTabStore *)&v6 closeAllTabsOnDevice:a3];
  if (v4) {
    [(CloudTabStore *)self _notifyCloudTabStoreDidUpdate];
  }
  return v4;
}

- (void)_clearAllDevices
{
  if ([(WBSCloudTabStore *)self syncAgentIsAvailable])
  {
    [(WBSCloudTabStore *)self deleteAllDevicesFromCloudKit];
  }
}

- (void)clearTabsForCurrentDevice
{
}

- (void)_clearTabsForCurrentDeviceWithSyncCompletionHandler:(id)a3
{
  [(CloudTabStore *)self _saveCurrentDeviceCloudTabs:0 syncCompletionHandler:a3];
  [(CloudTabStore *)self _notifyCloudTabStoreDidUpdate];
}

- (void)_removeConflictingDevice
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Sync agent not available so not removing conflicting device", v2, v3, v4, v5, v6);
}

uint64_t __41__CloudTabStore__removeConflictingDevice__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 uuid];
  uint64_t v4 = [v2 isEqualToString:v3] ^ 1;

  return v4;
}

- (void)saveCurrentDeviceCloudTabsForEnteringBackground:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__CloudTabStore_saveCurrentDeviceCloudTabsForEnteringBackground_completion___block_invoke;
  v15[3] = &unk_1E6D77E70;
  id v8 = v7;
  id v16 = v8;
  double v9 = (void (**)(void))MEMORY[0x1E4E42950](v15);
  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__CloudTabStore_saveCurrentDeviceCloudTabsForEnteringBackground_completion___block_invoke_41;
    v11[3] = &unk_1E6D7A660;
    v11[4] = self;
    id v12 = v6;
    long long v13 = v9;
    [(CloudTabStore *)self _waitForInitialCloudKitFetchToComplete:v11];
  }
  else
  {
    uint64_t v10 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v10, OS_LOG_TYPE_DEFAULT, "Saving iCloud Tabs when entering background because tabs are nil", buf, 2u);
    }
    [(CloudTabStore *)self saveCurrentDeviceCloudTabs:0];
    v9[2](v9);
  }
}

uint64_t __76__CloudTabStore_saveCurrentDeviceCloudTabsForEnteringBackground_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __76__CloudTabStore_saveCurrentDeviceCloudTabsForEnteringBackground_completion___block_invoke_41(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v4 = "Saving iCloud Tabs when entering background because no CloudKit data is available";
      uint64_t v5 = buf;
      goto LABEL_7;
    }
LABEL_8:
    [*(id *)(a1 + 32) saveCurrentDeviceCloudTabs:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    return;
  }
  if (([*(id *)(a1 + 32) uniqueDeviceMultiplicity] | 2) == 2)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      uint64_t v4 = "Saving iCloud Tabs when entering background because at least one other device is registered or registered dev"
           "ices cannot be determined";
      uint64_t v5 = (uint8_t *)&v16;
LABEL_7:
      _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (([*(id *)(a1 + 32) currentDeviceIsRegisteredInCloudKit] & 1) == 0)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    __int16 v15 = 0;
    uint64_t v4 = "Saving iCloud Tabs when entering background with no other devices because this device isn't registered";
    uint64_t v5 = (uint8_t *)&v15;
    goto LABEL_7;
  }
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v7 = objc_msgSend(v6, "safari_dateForKey:", @"CloudTabStoreDateOfLastSaveWhenEnteringBackgroundWithNoOtherDevices");
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  double v9 = v8;
  if (v7 && ([v8 timeIntervalSinceDate:v7], v10 < 86400.0))
  {
    long long v11 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v14 = 0;
      _os_log_impl(&dword_1E102C000, v11, OS_LOG_TYPE_DEFAULT, "Not saving iCloud Tabs when entering background with no other devices", v14, 2u);
    }
  }
  else
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v13 = 0;
      _os_log_impl(&dword_1E102C000, v12, OS_LOG_TYPE_DEFAULT, "Saving iCloud Tabs when entering background with no other devices", v13, 2u);
    }
    [v6 setObject:v9 forKey:@"CloudTabStoreDateOfLastSaveWhenEnteringBackgroundWithNoOtherDevices"];
    [*(id *)(a1 + 32) saveCurrentDeviceCloudTabs:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)saveCurrentDeviceCloudTabs:(id)a3
{
}

- (void)_saveCurrentDeviceCloudTabs:(id)a3 syncCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (![(WBSCloudTabStore *)self syncAgentIsAvailable])
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[CloudTabStore _saveCurrentDeviceCloudTabs:syncCompletionHandler:]();
      if (!v7) {
        goto LABEL_8;
      }
    }
    else if (!v7)
    {
      goto LABEL_8;
    }
    v7[2](v7, 0);
    goto LABEL_8;
  }
  if (![(CloudTabStore *)self canSaveCloudTabsForCurrentDevice])
  {

    id v6 = 0;
  }
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__CloudTabStore__saveCurrentDeviceCloudTabs_syncCompletionHandler___block_invoke;
  v9[3] = &unk_1E6D7A688;
  objc_copyWeak(&v12, &location);
  id v6 = v6;
  id v10 = v6;
  long long v11 = v7;
  [(CloudTabStore *)self _waitForInitialCloudKitFetchToComplete:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
LABEL_8:
}

void __67__CloudTabStore__saveCurrentDeviceCloudTabs_syncCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _saveCurrentDeviceCloudTabsNow:*(void *)(a1 + 32) syncCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_saveCurrentDeviceCloudTabsNow:(id)a3 syncCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [(WBSCloudTabStore *)self dictionaryRepresentationOfCurrentDeviceInCloudKit];
  if (v8)
  {
LABEL_4:
    BOOL v9 = [MEMORY[0x1E4FB6EE0] accessLevel] == 2;
    id v10 = objc_alloc_init(MEMORY[0x1E4F98A38]);
    long long v11 = [MEMORY[0x1E4F97E88] currentDevice];
    id v12 = [v11 userAssignedName];
    [v10 setDeviceName:v12];

    long long v13 = [MEMORY[0x1E4F1C9C8] date];
    [v10 setLastModified:v13];

    [v10 setTabs:v6];
    [v10 setEphemeralDevice:v9];
    long long v14 = [MEMORY[0x1E4F97E88] currentDevice];
    __int16 v15 = [v14 deviceTypeIdentifier];
    [v10 setDeviceTypeIdentifier:v15];

    __int16 v16 = [v10 dictionaryRepresentation];
    int v17 = [v16 objectForKey:@"DeviceName"];
    objc_super v18 = [v8 objectForKey:@"DeviceName"];
    if (-[CloudTabStore tabArrayOfDeviceFromDictionary:isEqualToOtherDeviceTabsFromDictionary:includingLastViewedTime:](self, "tabArrayOfDeviceFromDictionary:isEqualToOtherDeviceTabsFromDictionary:includingLastViewedTime:", v16, v8, 0)&& [v17 isEqual:v18])
    {
      if ([(CloudTabStore *)self tabArrayOfDeviceFromDictionary:v16 isEqualToOtherDeviceTabsFromDictionary:v8 includingLastViewedTime:1])
      {
        double v19 = 86400.0;
      }
      else
      {
        v25.receiver = self;
        v25.super_class = (Class)CloudTabStore;
        uint64_t v20 = [(WBSCloudTabStore *)&v25 syncedCloudTabDevices];
        BOOL v21 = (unint64_t)[v20 count] > 1;

        double v19 = dbl_1E123DF90[v21];
      }
      v22 = [v16 objectForKey:@"LastModified"];
      v23 = [v8 objectForKey:@"LastModified"];
      if (v23)
      {
        [v22 timeIntervalSinceDate:v23];
        if (v24 < v19)
        {
          if (v7) {
            v7[2](v7, 0);
          }

          goto LABEL_18;
        }
      }
    }
    [(WBSCloudTabStore *)self saveCurrentCloudTabDeviceDictionaryToCloudKit:v16 completionHandler:v7];
LABEL_18:

    goto LABEL_19;
  }
  if (v6)
  {
    [(CloudTabStore *)self _removeConflictingDevice];
    goto LABEL_4;
  }
  if (v7) {
    v7[2](v7, 0);
  }
LABEL_19:
}

- (BOOL)tabArrayOfDeviceFromDictionary:(id)a3 isEqualToOtherDeviceTabsFromDictionary:(id)a4 includingLastViewedTime:(BOOL)a5
{
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __111__CloudTabStore_tabArrayOfDeviceFromDictionary_isEqualToOtherDeviceTabsFromDictionary_includingLastViewedTime___block_invoke;
  v15[3] = &__block_descriptor_33_e26___NSArray_16__0__NSArray_8l;
  BOOL v16 = a5;
  id v6 = a4;
  id v7 = a3;
  id v8 = (void (**)(void, void))MEMORY[0x1E4E42950](v15);
  BOOL v9 = [v7 objectForKeyedSubscript:@"Tabs"];

  id v10 = ((void (**)(void, void *))v8)[2](v8, v9);
  long long v11 = [v6 objectForKeyedSubscript:@"Tabs"];

  id v12 = ((void (**)(void, void *))v8)[2](v8, v11);
  char v13 = [v10 isEqual:v12];

  return v13;
}

id __111__CloudTabStore_tabArrayOfDeviceFromDictionary_isEqualToOtherDeviceTabsFromDictionary_includingLastViewedTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 sortedArrayUsingComparator:&__block_literal_global_47];
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 32))
  {
    id v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_50);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v5;

  return v6;
}

uint64_t __111__CloudTabStore_tabArrayOfDeviceFromDictionary_isEqualToOtherDeviceTabsFromDictionary_includingLastViewedTime___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *MEMORY[0x1E4FB6120];
  id v5 = a3;
  id v6 = objc_msgSend(a2, "safari_numberForKey:", v4);
  id v7 = objc_msgSend(v5, "safari_numberForKey:", v4);

  if (v6) {
    uint64_t v8 = -1;
  }
  else {
    uint64_t v8 = v7 != 0;
  }
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    uint64_t v8 = [v6 compare:v7];
  }

  return v8;
}

id __111__CloudTabStore_tabArrayOfDeviceFromDictionary_isEqualToOtherDeviceTabsFromDictionary_includingLastViewedTime___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)[a2 mutableCopy];
  [v2 setObject:0 forKeyedSubscript:*MEMORY[0x1E4FB6120]];
  return v2;
}

- (void)saveCurrentDeviceTabsFromBrowserState:(id)a3
{
}

- (void)saveCurrentDeviceTabsFromBrowserState:(id)a3 syncCompletionHandler:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 windowStates];
  if ([v7 count])
  {
    v31 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = v7;
    uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v28)
    {
      id v26 = v6;
      uint64_t v27 = *(void *)v38;
      double v24 = self;
      objc_super v25 = v7;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v38 != v27) {
            objc_enumerationMutation(obj);
          }
          v32 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          BOOL v9 = [v32 localTabGroup];
          if (v9)
          {
            v29 = v9;
            uint64_t v30 = i;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            id v10 = [v9 allTabs];
            uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v34;
              do
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v34 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  __int16 v15 = *(void **)(*((void *)&v33 + 1) + 8 * j);
                  BOOL v16 = [v15 url];
                  if (v16)
                  {
                    int v17 = [v15 uuid];
                    if ([v17 length])
                    {
                      objc_super v18 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v17];
                      if (v18)
                      {
                        double v19 = (void *)[objc_alloc(MEMORY[0x1E4F98A40]) initWithURL:v16];
                        [v19 setUuid:v18];
                        uint64_t v20 = [v15 title];
                        [v19 setTitle:v20];

                        objc_msgSend(v19, "setShowingReader:", objc_msgSend(v15, "isShowingReader"));
                        BOOL v21 = [v32 sceneID];
                        [v19 setSceneID:v21];

                        [v15 lastViewedTime];
                        objc_msgSend(v19, "setLastViewedTime:");
                        v22 = (void *)[objc_alloc(MEMORY[0x1E4F98A28]) initWithParameters:v19];
                        if (v22) {
                          [v31 addObject:v22];
                        }
                      }
                    }
                  }
                }
                uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v41 count:16];
              }
              while (v12);
            }

            id v7 = v25;
            id v6 = v26;
            self = v24;
            BOOL v9 = v29;
            uint64_t i = v30;
          }
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v28);
    }

    if ([v31 count]) {
      [(CloudTabStore *)self _saveCurrentDeviceCloudTabs:v31 syncCompletionHandler:v6];
    }
    else {
      [(CloudTabStore *)self _clearTabsForCurrentDeviceWithSyncCompletionHandler:v6];
    }
  }
  else
  {
    [(CloudTabStore *)self _clearTabsForCurrentDeviceWithSyncCompletionHandler:v6];
  }
}

- (void)_closeRequestedTabIfPossible:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [v4 tabUUID];
    uint64_t v8 = [v7 UUIDString];
    int v11 = 138543362;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to close tab with UUID %{public}@", (uint8_t *)&v11, 0xCu);
  }
  BOOL v9 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CloudTabStore _closeRequestedTabIfPossible:](v9, v4);
  }
  self->_didAttemptToCloseAtLeastOneTab = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cloudTabStore:self didReceiveTabCloseRequest:v4];
}

- (CloudTabStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CloudTabStoreDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fetchCloudKitDataCompletionHandlers, 0);
}

- (void)_saveCurrentDeviceTabs:(void *)a3 sceneIDToLocalGroupTabs:(int)a4 isForEnteringBackground:(void *)a5 completion:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  id v9 = a3;
  id v10 = a5;
  if (a1)
  {
    int v11 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v18;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v22;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v12);
          }
          BOOL v16 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v15), "cloudTab", v18);
          objc_msgSend(v11, "safari_addObjectUnlessNil:", v16);

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __116__CloudTabStore_SafariAdditions___saveCurrentDeviceTabs_sceneIDToLocalGroupTabs_isForEnteringBackground_completion___block_invoke;
    v19[3] = &unk_1E6D7E450;
    id v17 = v11;
    id v20 = v17;
    [v9 enumerateKeysAndObjectsUsingBlock:v19];
    if (a4)
    {
      [a1 saveCurrentDeviceCloudTabsForEnteringBackground:v17 completion:v10];
    }
    else
    {
      [a1 saveCurrentDeviceCloudTabs:v17];
      if (v10) {
        v10[2](v10);
      }
    }
  }
}

void __116__CloudTabStore_SafariAdditions___saveCurrentDeviceTabs_sceneIDToLocalGroupTabs_isForEnteringBackground_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = a3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        id v10 = objc_alloc(MEMORY[0x1E4F98A40]);
        int v11 = [v9 syncableURL];
        id v12 = (void *)[v10 initWithURL:v11];

        id v13 = objc_alloc(MEMORY[0x1E4F29128]);
        uint64_t v14 = [v9 uuid];
        uint64_t v15 = (void *)[v13 initWithUUIDString:v14];
        [v12 setUuid:v15];

        BOOL v16 = [v9 title];
        [v12 setTitle:v16];

        [v12 setSceneID:v5];
        [v9 lastViewedTime];
        objc_msgSend(v12, "setLastViewedTime:");
        id v17 = *(void **)(a1 + 32);
        id v18 = (void *)[objc_alloc(MEMORY[0x1E4F98A28]) initWithParameters:v12];
        objc_msgSend(v17, "safari_addObjectUnlessNil:", v18);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }
}

- (void)saveCurrentDeviceTabs:(void *)a3 sceneIDToLocalGroupTabs:
{
  id v6 = a2;
  id v5 = a3;
  if (a1) {
    -[CloudTabStore _saveCurrentDeviceTabs:sceneIDToLocalGroupTabs:isForEnteringBackground:completion:](a1, v6, v5, 0, 0);
  }
}

- (void)saveCurrentDeviceTabsForEnteringBackground:(void *)a3 sceneIDToLocalGroupTabs:(void *)a4 completion:
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1) {
    -[CloudTabStore _saveCurrentDeviceTabs:sceneIDToLocalGroupTabs:isForEnteringBackground:completion:](a1, v9, v7, 1, v8);
  }
}

- (void)currentDevice
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Sync agent not available so can't retrieve current device", v2, v3, v4, v5, v6);
}

- (void)_waitForInitialCloudKitFetchToComplete:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1E102C000, v0, v1, "Initial CloudKit fetch was never started", v2, v3, v4, v5, v6);
}

- (void)_waitForInitialCloudKitFetchToComplete:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1E102C000, v0, v1, "Waiting for initial CloudKit fetch to complete", v2, v3, v4, v5, v6);
}

- (void)_waitForInitialCloudKitFetchToComplete:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1E102C000, v0, v1, "Sync agent not available so initial CloudKit fetch will never complete", v2, v3, v4, v5, v6);
}

- (void)_waitForInitialCloudKitFetchToComplete:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1E102C000, v0, v1, "Initial CloudKit fetch has already completed", v2, v3, v4, v5, v6);
}

void __56__CloudTabStore__waitForInitialCloudKitFetchToComplete___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1E102C000, v0, v1, "Initial CloudKit fetch has completed", v2, v3, v4, v5, v6);
}

- (void)_saveCurrentDeviceCloudTabs:syncCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Sync agent not available so not saving current device's tabs", v2, v3, v4, v5, v6);
}

- (void)_closeRequestedTabIfPossible:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 url];
  int v5 = 138477827;
  uint8_t v6 = v4;
  _os_log_debug_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEBUG, "Tab URL: \"%{private}@\"", (uint8_t *)&v5, 0xCu);
}

@end