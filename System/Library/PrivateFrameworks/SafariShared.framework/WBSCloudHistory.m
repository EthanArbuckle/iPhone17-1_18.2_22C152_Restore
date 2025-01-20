@interface WBSCloudHistory
- (BOOL)_shouldSyncProfiles;
- (BOOL)isCloudHistoryEnabled;
- (BOOL)removedHistoryItemsArePendingSave;
- (WBSCloudHistory)initWithDatabase:(id)a3 configuration:(id)a4 databaseStore:(id)a5 completionBlock:(id)a6;
- (WBSHistoryServiceDatabaseStore)databaseStore;
- (double)_backoffTimeIntervalFromError:(id)a3;
- (id).cxx_construct;
- (id)_convertProfileLocalIdentifierToServerIdentifier:(id)a3;
- (id)_convertProfileServerIdentifierToLocalIdentifier:(id)a3;
- (id)_currentFetchChangesThrottlerPolicyString;
- (id)_currentSaveChangesThrottlerPolicyString;
- (id)_currentSyncCircleSizeRetrievalThrottlerPolicyString;
- (id)_manateeErrorCode:(id)a3;
- (id)dateOfNextPermittedSaveChangesAttempt;
- (id)recordOfPastOperationsForThrottler:(id)a3;
- (int64_t)_estimatedPriorityForPotentialSaveAttempt;
- (int64_t)_priorityForSaveWithVisits:(id)a3 tombstones:(id)a4 bypassingThrottler:(BOOL)a5;
- (int64_t)_resultFromError:(id)a3;
- (unint64_t)_cachedNumberOfDevicesInSyncCircle;
- (unint64_t)numberOfDevicesInSyncCircle;
- (void)_backOffWithInterval:(double)a3;
- (void)_callAndResetFetchCompletionHandlerWithError:(id)a3;
- (void)_callAndResetSaveCompletionHandlerWithError:(id)a3;
- (void)_deleteAllCloudHistoryAndSaveAgain;
- (void)_determineCloudHistoryStoreWithCompletion:(id)a3;
- (void)_determineNumberOfDevicesInSyncCircleForOperation:(id)a3 completionHandler:(id)a4;
- (void)_enumerateDatabasesWithProfileLocalIdentifiers:(id)a3 createIfNeeded:(BOOL)a4 enumerationBlock:(id)a5 completionBlock:(id)a6;
- (void)_fetchAddedProfileLocalIdentifiers:(id)a3;
- (void)_fetchAndMergeChangesWithServerChangeTokenData:(id)a3 withPriority:(int64_t)a4;
- (void)_fetchChangesInResponseToPushNotification:(id)a3;
- (void)_fetchChangesWhenHistoryLoads;
- (void)_getServerChangeTokenDataWithCompletion:(id)a3;
- (void)_handleManateeErrorIfNeeded:(id)a3;
- (void)_initializePushNotificationSupport;
- (void)_loadMetadataAsynchronously;
- (void)_pcsIdentitiesChangedNotification:(id)a3;
- (void)_performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:(id)a3;
- (void)_persistLongLivedSaveOperationDictionaryWithOperationID:(id)a3 databaseGenerations:(id)a4;
- (void)_persistedLongLivedSaveOperationID:(id *)a3 databaseGenerations:(id *)a4;
- (void)_postSaveChangesAttemptCompletedNotificationWithAllPendingDataSaved:(BOOL)a3;
- (void)_processPendingPushNotifications;
- (void)_pruneTombstonesThatCanNoLongerMatchVisitsFetchedFromCloud;
- (void)_pushNotificationReceived:(id)a3;
- (void)_pushNotificationsAreInitializedWithCompletionHandler:(id)a3;
- (void)_registerFetchCompletionHandler:(id)a3;
- (void)_registerSaveCompletionHandler:(id)a3;
- (void)_removePersistedLongLivedSaveOperationDictionary;
- (void)_replayPersistedLongLivedSaveOperationIfNecessary;
- (void)_resetCloudHistoryDataWithCompletionHandler:(id)a3;
- (void)_resetForAccountChangeWithCompletionHandler:(id)a3;
- (void)_saveChangesWhenHistoryLoads;
- (void)_saveVisits:(id)a3 tombstones:(id)a4 toCloudHistoryBypassingThrottler:(BOOL)a5 longLivedOperationPersistenceCompletion:(id)a6 withCallback:(id)a7;
- (void)_serverBackoffTimerFired:(id)a3;
- (void)_setCachedNumberOfDevicesInSyncCircle:(unint64_t)a3;
- (void)_setPushNotificationAreInitialized:(BOOL)a3;
- (void)_setServerChangeToken:(id)a3;
- (void)_transitionCloudHistoryStoreToManateeState:(int64_t)a3 completion:(id)a4;
- (void)_updateDeviceCountInResponseToPushNotification;
- (void)_updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations:(id)a3 completion:(id)a4;
- (void)_updateProfileLocalIdentifiersToServerIdentifiersMapInDatabase;
- (void)_updateProfileServerIdentifiersToLocalIdentifiersMapBasedOnLocalToServerMap;
- (void)_updateThrottlerPolicies;
- (void)dealloc;
- (void)fetchAndMergeChanges;
- (void)fetchAndMergeChangesBypassingThrottler;
- (void)fetchAndMergeChangesBypassingThrottler:(BOOL)a3 completionHandler:(id)a4;
- (void)fetchDateOfNextPermittedSaveChangesAttemptWithCompletionHandler:(id)a3;
- (void)getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow:(double)a3 completion:(id)a4;
- (void)resetForAccountChange;
- (void)resetForAccountChangeWithCompletionHandler:(id)a3;
- (void)saveChangesBypassingThrottler:(BOOL)a3 completionHandler:(id)a4;
- (void)saveChangesToCloudHistoryStore;
- (void)saveChangesToCloudHistoryStoreBypassingThrottler;
- (void)setCloudHistoryEnabled:(BOOL)a3;
- (void)setDatabaseStore:(id)a3;
- (void)setNumberOfDevicesInSyncCircle:(unint64_t)a3;
- (void)setRecordOfPastOperations:(id)a3 forThrottler:(id)a4;
- (void)setRemovedHistoryItemsArePendingSave:(BOOL)a3;
- (void)updateConfiguration:(id)a3 completionHandler:(id)a4;
- (void)updateProfileLocalIdentifiersToServerIdentifiersMap:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSCloudHistory

- (WBSCloudHistory)initWithDatabase:(id)a3 configuration:(id)a4 databaseStore:(id)a5 completionBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v46.receiver = self;
  v46.super_class = (Class)WBSCloudHistory;
  v15 = [(WBSCloudHistory *)&v46 init];
  if (v15)
  {
    objc_initWeak(&location, v15);
    objc_storeStrong((id *)&v15->_database, a3);
    objc_storeWeak((id *)&v15->_databaseStore, v13);
    id v16 = [NSString stringWithFormat:@"com.apple.SafariShared.WBSCloudHistory.%@.%p.internalQueue", objc_opt_class(), v15];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    cloudHistoryQueue = v15->_cloudHistoryQueue;
    v15->_cloudHistoryQueue = (OS_dispatch_queue *)v17;

    id v19 = [NSString stringWithFormat:@"com.apple.SafariShared.WBSCloudHistory.%@.%p.waitForMetadata", objc_opt_class(), v15];
    v20 = (const char *)[v19 UTF8String];
    v21 = dispatch_queue_attr_make_initially_inactive(0);
    dispatch_queue_t v22 = dispatch_queue_create(v20, v21);
    waitUntilMetadataHasLoadedQueue = v15->_waitUntilMetadataHasLoadedQueue;
    v15->_waitUntilMetadataHasLoadedQueue = (OS_dispatch_queue *)v22;

    objc_storeStrong((id *)&v15->_configuration, a4);
    v24 = (objc_class *)objc_opt_class();
    v25 = (objc_class *)objc_opt_class();
    uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
    storeDeterminationCompletionBlocks = v15->_storeDeterminationCompletionBlocks;
    v15->_storeDeterminationCompletionBlocks = (NSMutableArray *)v26;

    id v28 = objc_alloc_init(v24);
    uint64_t v29 = [[v25 alloc] initWithContainerIdentifier:@"com.apple.SafariShared.History" appleAccountInformationProvider:v28];
    containerManateeObserver = v15->_containerManateeObserver;
    v15->_containerManateeObserver = (WBSCloudKitContainerManateeObserving *)v29;

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke;
    v43[3] = &unk_1E5C8D0A8;
    objc_copyWeak(&v44, &location);
    [(WBSCloudKitContainerManateeObserving *)v15->_containerManateeObserver setStateChangeObserver:v43];
    v31 = objc_alloc_init(WBSCloudHistoryPushAgentProxy);
    pushAgent = v15->_pushAgent;
    v15->_pushAgent = v31;

    [(WBSCloudHistory *)v15 _loadMetadataAsynchronously];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke_2_87;
    v40[3] = &unk_1E5C8C9F8;
    v33 = v15;
    v41 = v33;
    id v42 = v14;
    [(WBSCloudHistory *)v33 _performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:v40];
    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    syncCircleSizeRetrievalCompletionHandlersByOperation = v33->_syncCircleSizeRetrievalCompletionHandlersByOperation;
    v33->_syncCircleSizeRetrievalCompletionHandlersByOperation = v34;

    v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 addObserver:v33 selector:sel__cloudHistoryConfigurationChanged_ name:@"WBSCloudHistoryConfigurationChangedNotification" object:v15->_configuration];

    v37 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v37 addObserver:v33 selector:sel__pushNotificationReceived_ name:@"com.apple.SafariShared.CloudHistory.PushReceived" object:0];

    v38 = v33;
    objc_destroyWeak(&v44);

    objc_destroyWeak(&location);
  }

  return v15;
}

void __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke_2;
    v6[3] = &unk_1E5C8D080;
    uint64_t v8 = a2;
    v7 = WeakRetained;
    dispatch_async(v5, v6);
  }
}

void __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v10 = 134217984;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_DEFAULT, "Received PCS change notification with state %ld", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 232);
  v6 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == v4)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 134217984;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring PCS state change notification because it is the same as the current state %ld", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 134217984;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_DEFAULT, "Determining cloud history store in response to PCS change notification with state %ld", (uint8_t *)&v10, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 240) = 1;
    [*(id *)(a1 + 32) _determineCloudHistoryStoreWithCompletion:&__block_literal_global_15];
  }
}

void __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke_2_87(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F97E68]);
  id v16 = [*(id *)(a1 + 32) _currentSaveChangesThrottlerPolicyString];
  uint64_t v3 = objc_msgSend(v2, "initWithPolicyString:");
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 128);
  *(void *)(v4 + 128) = v3;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "setDataStore:");
  id v6 = objc_alloc(MEMORY[0x1E4F97E68]);
  id v17 = [*(id *)(a1 + 32) _currentFetchChangesThrottlerPolicyString];
  uint64_t v7 = objc_msgSend(v6, "initWithPolicyString:");
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 136);
  *(void *)(v8 + 136) = v7;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 136), "setDataStore:");
  id v10 = objc_alloc(MEMORY[0x1E4F97E68]);
  id v18 = [*(id *)(a1 + 32) _currentSyncCircleSizeRetrievalThrottlerPolicyString];
  uint64_t v11 = objc_msgSend(v10, "initWithPolicyString:");
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 144);
  *(void *)(v12 + 144) = v11;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "setDataStore:");
  [*(id *)(a1 + 32) _replayPersistedLongLivedSaveOperationIfNecessary];
  [*(id *)(a1 + 32) _pruneTombstonesThatCanNoLongerMatchVisitsFetchedFromCloud];
  [*(id *)(a1 + 32) _initializePushNotificationSupport];
  id v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v14 = [v19 objectForKey:@"WBSCloudHistoryLongLivedSaveOperation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v14 format:200 options:0 error:0];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v15);
    [*(id *)(*(void *)(a1 + 32) + 24) setMetadataValue:v15 forKey:@"long_lived_save_operation" completionHandler:&__block_literal_global_94];
    [v19 removeObjectForKey:@"WBSCloudHistoryLongLivedSaveOperation"];
  }
  if (*(void *)(a1 + 40)) {
    dispatch_async(MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 40));
  }
}

void __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke_3_cold_1();
    }
  }
}

- (void)_determineCloudHistoryStoreWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_store && !self->_manateeStateNeedsUpdate)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    storeDeterminationCompletionBlocks = self->_storeDeterminationCompletionBlocks;
    uint64_t v7 = (void *)MEMORY[0x1AD0C4F80](v4);
    [(NSMutableArray *)storeDeterminationCompletionBlocks addObject:v7];

    if (!self->_determiningStoreType)
    {
      self->_determiningStoreType = 1;
      containerManateeObserver = self->_containerManateeObserver;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __61__WBSCloudHistory__determineCloudHistoryStoreWithCompletion___block_invoke;
      v9[3] = &unk_1E5C8D0F0;
      v9[4] = self;
      [(WBSCloudKitContainerManateeObserving *)containerManateeObserver determineAccountStateWithCompletion:v9];
    }
  }
}

void __61__WBSCloudHistory__determineCloudHistoryStoreWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = a2;
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_DEFAULT, "Determined PCS state to be %ld", buf, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__WBSCloudHistory__determineCloudHistoryStoreWithCompletion___block_invoke_102;
  v7[3] = &unk_1E5C8D080;
  v7[4] = v5;
  v7[5] = a2;
  dispatch_async(v6, v7);
}

uint64_t __61__WBSCloudHistory__determineCloudHistoryStoreWithCompletion___block_invoke_102(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__WBSCloudHistory__determineCloudHistoryStoreWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5C8CA70;
  v4[4] = v2;
  return [v2 _transitionCloudHistoryStoreToManateeState:v1 completion:v4];
}

uint64_t __61__WBSCloudHistory__determineCloudHistoryStoreWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 242) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 240) = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 224);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "removeAllObjects", (void)v7);
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  uint64_t v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)WBSCloudHistory;
  [(WBSCloudHistory *)&v5 dealloc];
}

- (BOOL)isCloudHistoryEnabled
{
  return self->_cloudHistoryEnabled;
}

- (void)setCloudHistoryEnabled:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_cloudHistoryEnabled != a3)
  {
    self->_cloudHistoryEnabled = a3;
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_cloudHistoryEnabled) {
        objc_super v5 = @"enabled";
      }
      else {
        objc_super v5 = @"disabled";
      }
      int v6 = 138543362;
      long long v7 = v5;
      _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "iCloud History is now %{public}@.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)_shouldSyncProfiles
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v4 = objc_msgSend(v3, "safari_numberForKey:", @"WBSEnableSafariProfileCloudHistorySyncing");

  store = self->_store;
  if (v4)
  {
    if (![(WBSCloudHistoryDataStore *)store useManateeContainer])
    {
      BOOL v7 = 0;
      goto LABEL_7;
    }
    char v6 = [v4 BOOLValue];
  }
  else
  {
    char v6 = [(WBSCloudHistoryDataStore *)store useManateeContainer];
  }
  BOOL v7 = v6;
LABEL_7:

  return v7;
}

- (void)saveChangesToCloudHistoryStore
{
}

- (void)saveChangesToCloudHistoryStoreBypassingThrottler
{
}

- (void)saveChangesBypassingThrottler:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  char v6 = (void (**)(id, void *))a4;
  BOOL v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v8 = [v7 BOOLForKey:@"WBSCloudHistoryIgnoreThrottlingPolicy"];

  long long v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  int v10 = v8 | v4;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = @"respecting the throttler";
    if (v10) {
      uint64_t v11 = @"bypassing the throttler";
    }
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_INFO, "Saving changes to iCloud History %{public}@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v12 = [WBSCleanupHandler alloc];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke;
  v16[3] = &unk_1E5C8CA70;
  v16[4] = self;
  id v13 = [(WBSCleanupHandler *)v12 initWithBlock:v16];
  if ([(WBSCloudHistory *)self isCloudHistoryEnabled])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x3812000000;
    id v19 = __Block_byref_object_copy__2;
    v20 = __Block_byref_object_dispose__2;
    uint64_t v21 = 0;
    operator new();
  }
  id v14 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1A6B5F000, v14, OS_LOG_TYPE_INFO, "iCloud History is not enabled. Nothing to do when saving changes!", (uint8_t *)&buf, 2u);
  }
  if (v6)
  {
    v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSCloudHistory" code:1 userInfo:0];
    v6[2](v6, v15);
  }
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2;
  block[3] = &unk_1E5C8CA70;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_3;
  v4[3] = &unk_1E5C8CA70;
  v4[4] = v2;
  dispatch_async(v3, v4);
}

uint64_t __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postSaveChangesAttemptCompletedNotificationWithAllPendingDataSaved:0];
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:14 userInfo:0];
  objc_msgSend(v1, "_callAndResetSaveCompletionHandlerWithError:");
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_123(uint64_t a1)
{
  [*(id *)(a1 + 32) _registerSaveCompletionHandler:*(void *)(a1 + 48)];
  if ([*(id *)(*(void *)(a1 + 32) + 152) isValid])
  {
    id v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v3 = "Server has already asked us to back off. Nothing to do when saving changes!";
LABEL_7:
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_INFO, v3, buf, 2u);
    return;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v4 + 80);
  objc_super v5 = (id **)(v4 + 80);
  if (v6)
  {
    id v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v3 = "A save operation is already in progress. Nothing to do!";
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  int v8 = *(id **)(v7 + 48);
  *(void *)(v7 + 48) = 0;
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100](v5, v8);
  long long v9 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_124;
  v10[3] = &unk_1E5C8D258;
  v10[4] = v9;
  id v11 = *(id *)(a1 + 40);
  char v12 = *(unsigned char *)(a1 + 64);
  [v9 _determineCloudHistoryStoreWithCompletion:v10];
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_124(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_125;
  v3[3] = &unk_1E5C8D118;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);
  [v2 _performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:v3];
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_125(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  [*(id *)(a1 + 32) _replayPersistedLongLivedSaveOperationIfNecessary];
  uint64_t v3 = *(void *)(*(void *)v2 + 184);
  if (v3 == 1)
  {
    long long v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_INFO, "Only one device in the iCloud History sync circle", buf, 2u);
    }
    goto LABEL_12;
  }
  if (v3)
  {
    int v10 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_INFO, "More than one device in the iCloud History sync circle", buf, 2u);
    }
    id v11 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_125_cold_1(v2, v11);
    }
LABEL_12:
    [*(id *)(*(void *)(a1 + 32) + 112) syncWindow];
    double v13 = v12;
    char v14 = [*(id *)(*(void *)(a1 + 32) + 112) shouldUseLongLivedOperationsToSaveRecords];
    *(void *)long long buf = 0;
    uint64_t v22 = buf;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__128;
    v25 = __Block_byref_object_dispose__129;
    uint64_t v26 = 0;
    v15 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_130;
    v16[3] = &unk_1E5C8D230;
    char v19 = v14;
    v16[4] = v15;
    uint64_t v18 = buf;
    char v20 = *(unsigned char *)(a1 + 48);
    id v17 = *(id *)(a1 + 40);
    [v15 getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow:v16 completion:v13];

    _Block_object_dispose(buf, 8);
    int v8 = v26;
    goto LABEL_13;
  }
  id v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Unknown number of devices in iCloud History sync circle. Will determine the number of devices and then retry the save.", buf, 2u);
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_126;
  v27[3] = &unk_1E5C8D118;
  char v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v28 = v6;
  uint64_t v29 = v7;
  char v30 = *(unsigned char *)(a1 + 48);
  [v5 _determineNumberOfDevicesInSyncCircleForOperation:@"SaveChanges" completionHandler:v27];
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(*(void *)v2 + 80), 0);
  int v8 = v28;
LABEL_13:
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_126(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_127;
  block[3] = &unk_1E5C8D118;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  char v7 = *(unsigned char *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_127(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  return [v2 saveChangesBypassingThrottler:v3 completionHandler:0];
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_130(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void *)(a1 + 32);
  char v14 = *(NSObject **)(v13 + 8);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_131;
  v21[3] = &unk_1E5C8D208;
  __int16 v28 = *(_WORD *)(a1 + 56);
  v21[4] = v13;
  id v22 = v11;
  id v23 = v9;
  id v24 = v10;
  id v16 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  id v26 = v12;
  uint64_t v27 = v15;
  id v25 = v16;
  id v17 = v12;
  id v18 = v10;
  id v19 = v9;
  id v20 = v11;
  dispatch_async(v14, v21);
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_131(uint64_t a1)
{
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_3_132;
  v19[3] = &unk_1E5C8D140;
  char v22 = *(unsigned char *)(a1 + 88);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 80);
  v19[4] = v2;
  id v20 = v3;
  id v4 = (void *)MEMORY[0x1AD0C4F80](v19);
  ct_green_tea_logger_create_static();
  id v5 = getCTGreenTeaOsLogHandle();
  uint64_t v6 = v5;
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Transmitted Internet Records", buf, 2u);
  }

  char v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 89);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_135;
  v13[3] = &unk_1E5C8D1E0;
  v13[4] = v7;
  id v11 = *(id *)(a1 + 72);
  char v17 = *(unsigned char *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 80);
  id v15 = v11;
  uint64_t v16 = v12;
  id v14 = *(id *)(a1 + 64);
  [v7 _saveVisits:v8 tombstones:v9 toCloudHistoryBypassingThrottler:v10 longLivedOperationPersistenceCompletion:v4 withCallback:v13];
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_3_132(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      [*(id *)(a1 + 32) _persistLongLivedSaveOperationDictionaryWithOperationID:v4 databaseGenerations:*(void *)(a1 + 40)];
      id v5 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = 138543362;
        id v7 = v4;
        _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Long-lived operation was persisted. Operation ID %{public}@", (uint8_t *)&v6, 0xCu);
      }
    }
  }
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_135(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = v7;
  if (!a3 && !v7)
  {
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_6:
      uint64_t v8 = 0;
      goto LABEL_15;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v10 = "No new data to save to iCloud History.";
    id v11 = v9;
    uint32_t v12 = 2;
LABEL_5:
    _os_log_impl(&dword_1A6B5F000, v11, OS_LOG_TYPE_INFO, v10, buf, v12);
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    uint64_t v13 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [*(id *)(*(void *)(a1 + 32) + 128) dateOfNextPermittedOperationWithPriority:a2];
      id v15 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:v15];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v32 = v16;
      _os_log_impl(&dword_1A6B5F000, v13, OS_LOG_TYPE_INFO, "Save was denied by the throttler. A save will be permitted in %f seconds.", buf, 0xCu);
    }
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSCloudHistory" code:2 userInfo:0];

    uint64_t v8 = (void *)v17;
  }
  else
  {
    if (!v7)
    {
      id v24 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
      *(_DWORD *)long long buf = 134217984;
      uint64_t v32 = a3;
      uint64_t v10 = "iCloud History save completed with result %ld";
      id v11 = v24;
      uint32_t v12 = 12;
      goto LABEL_5;
    }
    id v18 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_135_cold_1();
    }
  }
LABEL_15:
  [*(id *)(*(void *)(a1 + 32) + 128) operationWithPriority:a2 didCompleteWithResult:a3];
  v25[0] = MEMORY[0x1E4F143A8];
  BOOL v19 = (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0;
  v25[1] = 3221225472;
  v25[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_137;
  v25[3] = &unk_1E5C8D1B8;
  char v30 = *(unsigned char *)(a1 + 64);
  uint64_t v20 = *(void *)(a1 + 48);
  uint64_t v28 = *(void *)(a1 + 56);
  uint64_t v29 = a3;
  uint64_t v21 = *(void **)(a1 + 40);
  v25[4] = *(void *)(a1 + 32);
  id v26 = v8;
  id v27 = v21;
  char v22 = *(void (**)(uint64_t, BOOL, void *))(v20 + 16);
  id v23 = v8;
  v22(v20, v19, v25);
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_137(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_138;
  v5[3] = &unk_1E5C8D190;
  char v10 = *(unsigned char *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = v4;
  v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v3, v5);
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_138(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 72))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      [*(id *)(a1 + 32) _removePersistedLongLivedSaveOperationDictionary];
      uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v20 = v3;
        _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_INFO, "Persisted long-lived operation was removed because operation finished. Operation ID %{public}@", buf, 0xCu);
      }
    }
  }
  char v4 = 1;
  switch(*(void *)(a1 + 64))
  {
    case 0:
    case 2:
      goto LABEL_8;
    case 6:
      [*(id *)(a1 + 32) _callAndResetSaveCompletionHandlerWithError:*(void *)(a1 + 40)];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_139;
      block[3] = &unk_1E5C8CA70;
      void block[4] = *(void *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], block);
      break;
    case 7:
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v7 = a1 + 32;
      [v8 _callAndResetSaveCompletionHandlerWithError:*(void *)(v7 + 8)];
      [*(id *)v7 _handleManateeErrorIfNeeded:*(void *)(v7 + 8)];
      break;
    default:
      char v4 = 0;
LABEL_8:
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      id v11 = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_140;
      uint32_t v12 = &unk_1E5C8D168;
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 64);
      uint64_t v13 = v5;
      id v14 = v6;
      char v17 = v4;
      id v15 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x1E4F14428], &v9);
      if (*(void *)(a1 + 64) != 5) {
        objc_msgSend(*(id *)(a1 + 32), "_callAndResetSaveCompletionHandlerWithError:", *(void *)(a1 + 40), v9, v10, v11, v12, v13, v14);
      }

      break;
  }
}

uint64_t __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_139(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetForAccountChangeWithCompletionHandler:0];
}

uint64_t __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_140(uint64_t a1)
{
  if (*(void *)(a1 + 56) == 5)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 160) = 1;
    uint64_t v2 = *(void **)(a1 + 32);
    [v2 _backoffTimeIntervalFromError:*(void *)(a1 + 40)];
    objc_msgSend(v2, "_backOffWithInterval:");
  }
  if (*(unsigned char *)(a1 + 64)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 264) = 0;
  }
  [*(id *)(a1 + 48) invalidate];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  return [v3 _postSaveChangesAttemptCompletedNotificationWithAllPendingDataSaved:v4];
}

- (void)_registerSaveCompletionHandler:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    saveCompletionHandlers = self->_saveCompletionHandlers;
    p_saveCompletionHandlers = &self->_saveCompletionHandlers;
    uint64_t v8 = (void *)MEMORY[0x1AD0C4F80](v4);
    uint64_t v9 = [(NSArray *)saveCompletionHandlers arrayByAddingObject:v8];
    if (v9)
    {
      objc_storeStrong((id *)p_saveCompletionHandlers, v9);
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1AD0C4F80](v5);
      v13[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      uint32_t v12 = *p_saveCompletionHandlers;
      *p_saveCompletionHandlers = (NSArray *)v11;
    }
  }
}

- (void)_callAndResetSaveCompletionHandlerWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self->_saveCompletionHandlers;
  saveCompletionHandlers = self->_saveCompletionHandlers;
  self->_saveCompletionHandlers = 0;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v7 = v5;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)_convertProfileLocalIdentifierToServerIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  id v6 = (void *)*MEMORY[0x1E4F980C8];
  if (v5 && ![v4 isEqualToString:*MEMORY[0x1E4F980C8]])
  {
    id v7 = [(NSDictionary *)self->_namedProfileLocalIdentifiersToServerIdentifiersMap objectForKeyedSubscript:v4];
  }
  else
  {
    id v7 = v6;
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)_convertProfileServerIdentifierToLocalIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  id v6 = (void *)*MEMORY[0x1E4F980C8];
  if (v5 && ![v4 isEqualToString:*MEMORY[0x1E4F980C8]])
  {
    id v7 = [(NSDictionary *)self->_namedProfileServerIdentifiersToLocalIdentifiersMap objectForKeyedSubscript:v4];
  }
  else
  {
    id v7 = v6;
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)_enumerateDatabasesWithProfileLocalIdentifiers:(id)a3 createIfNeeded:(BOOL)a4 enumerationBlock:(id)a5 completionBlock:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseStore);
  cloudHistoryQueue = self->_cloudHistoryQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __114__WBSCloudHistory__enumerateDatabasesWithProfileLocalIdentifiers_createIfNeeded_enumerationBlock_completionBlock___block_invoke;
  v17[3] = &unk_1E5C8D2D0;
  BOOL v20 = a4;
  id v18 = WeakRetained;
  id v19 = v10;
  id v15 = v10;
  id v16 = WeakRetained;
  objc_msgSend(v12, "safari_enumerateAsynchronouslyOnQueue:enumerationBlock:completionBlock:", cloudHistoryQueue, v17, v11);
}

void __114__WBSCloudHistory__enumerateDatabasesWithProfileLocalIdentifiers_createIfNeeded_enumerationBlock_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __114__WBSCloudHistory__enumerateDatabasesWithProfileLocalIdentifiers_createIfNeeded_enumerationBlock_completionBlock___block_invoke_2;
  v12[3] = &unk_1E5C8D2A8;
  id v14 = v7;
  uint64_t v9 = *(void **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v9 openDatabaseWithID:v10 createIfNeeded:v8 completionHandler:v12];
}

void __114__WBSCloudHistory__enumerateDatabasesWithProfileLocalIdentifiers_createIfNeeded_enumerationBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __114__WBSCloudHistory__enumerateDatabasesWithProfileLocalIdentifiers_createIfNeeded_enumerationBlock_completionBlock___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:*MEMORY[0x1E4F980C8]];
  id v18 = v7;
  if ([(WBSCloudHistory *)self _shouldSyncProfiles])
  {
    uint64_t v8 = [(NSDictionary *)self->_namedProfileLocalIdentifiersToServerIdentifiersMap allKeys];
    [v7 addObjectsFromArray:v8];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke;
  v26[3] = &unk_1E5C8D320;
  double v31 = a3;
  v26[4] = self;
  id v27 = v9;
  id v28 = v10;
  id v29 = v11;
  id v30 = v12;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_3;
  v19[3] = &unk_1E5C8D3E8;
  id v13 = v6;
  id v25 = v13;
  id v14 = v27;
  id v20 = v14;
  id v15 = v28;
  id v21 = v15;
  id v16 = v29;
  id v22 = v16;
  id v23 = v30;
  id v24 = self;
  id v17 = v30;
  [(WBSCloudHistory *)self _enumerateDatabasesWithProfileLocalIdentifiers:v18 createIfNeeded:0 enumerationBlock:v26 completionBlock:v19];
}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  double v10 = *(double *)(a1 + 72);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_2;
  v15[3] = &unk_1E5C8D2F8;
  id v11 = *(void **)(a1 + 40);
  v15[4] = *(void *)(a1 + 32);
  id v16 = v7;
  id v17 = v11;
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 64);
  id v21 = v8;
  id v22 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  [v13 visitsAndTombstonesNeedingSyncWithVisitSyncWindow:v15 completionHandler:v10];
}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v12 = a2;
  id v7 = a3;
  if ([v12 count] || objc_msgSend(v7, "count"))
  {
    id v8 = [*(id *)(a1 + 32) _convertProfileLocalIdentifierToServerIdentifier:*(void *)(a1 + 40)];
    id v9 = [v12 allObjects];
    [*(id *)(a1 + 48) setObject:v9 forKeyedSubscript:v8];

    double v10 = [v7 allObjects];
    [*(id *)(a1 + 56) setObject:v10 forKeyedSubscript:v8];

    id v11 = [NSNumber numberWithLongLong:a4];
    [*(id *)(a1 + 64) setObject:v11 forKeyedSubscript:v8];

    [*(id *)(a1 + 72) setObject:*(void *)(a1 + 80) forKeyedSubscript:v8];
  }
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_4;
  v8[3] = &unk_1E5C8D3C0;
  uint64_t v5 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  id v10 = v6;
  uint64_t v11 = v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v4, v5, v8);
}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    dispatch_group_t v7 = dispatch_group_create();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_5;
    v10[3] = &unk_1E5C8D398;
    id v8 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    dispatch_group_t v12 = v7;
    id v9 = v7;
    [v8 enumerateKeysAndObjectsUsingBlock:v10];
    dispatch_group_notify(v9, *(dispatch_queue_t *)(*(void *)(a1 + 48) + 8), v6);
  }
  else
  {
    (*((void (**)(id))v5 + 2))(v5);
  }
}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_group_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  uint64_t v8 = [v7 longLongValue];

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_6;
  v10[3] = &unk_1E5C8D370;
  id v9 = v6;
  id v11 = v9;
  uint64_t v13 = v8;
  id v12 = *(id *)(a1 + 40);
  [v9 updateDatabaseAfterSuccessfulSyncWithGeneration:v8 completionHandler:v10];
}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_6_cold_1();
    }
  }
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_148;
  v7[3] = &unk_1E5C8D348;
  id v6 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  [v6 convertTombstoneWithGenerationToSecureFormat:v5 lastSyncedGeneration:v5 completionHandler:v7];
}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_148(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_148_cold_1();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_saveVisits:(id)a3 tombstones:(id)a4 toCloudHistoryBypassingThrottler:(BOOL)a5 longLivedOperationPersistenceCompletion:(id)a6 withCallback:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  int64_t v16 = [(WBSCloudHistory *)self _priorityForSaveWithVisits:v12 tombstones:v13 bypassingThrottler:v9];
  if (![v12 count] && !objc_msgSend(v13, "count"))
  {
    (*((void (**)(id, int64_t, void, void))v15 + 2))(v15, v16, 0, 0);
    goto LABEL_7;
  }
  if (([(WBSCloudKitThrottler *)self->_saveChangesThrottler permitsOperationWithPriority:v16] & 1) == 0)
  {
    (*((void (**)(id, int64_t, uint64_t, void))v15 + 2))(v15, v16, 1, 0);
LABEL_7:
    std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)&self->_saveOperationSuddenTerminationDisabler, 0);
    goto LABEL_8;
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke;
  v26[3] = &unk_1E5C8D410;
  v26[4] = self;
  id v27 = v14;
  id v17 = (void *)MEMORY[0x1AD0C4F80](v26);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_3;
  v19[3] = &unk_1E5C8D488;
  id v20 = v12;
  id v22 = self;
  id v23 = v17;
  id v21 = v13;
  id v24 = v15;
  int64_t v25 = v16;
  id v18 = v17;
  [(WBSCloudHistory *)self _determineCloudHistoryStoreWithCompletion:v19];

LABEL_8:
}

void __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_2;
    v6[3] = &unk_1E5C8C660;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_4;
  v9[3] = &unk_1E5C8D460;
  uint64_t v6 = *(void *)(a1 + 56);
  v9[4] = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  id v10 = v7;
  uint64_t v11 = v8;
  [a2 saveCloudHistoryVisits:v4 tombstones:v5 longLivedOperationPersistenceCompletion:v6 completion:v9];
}

void __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_5;
  v8[3] = &unk_1E5C8D438;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v7 = v3;
  dispatch_async(v4, v8);
}

id *__128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void, void, uint64_t, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 56), [*(id *)(a1 + 32) _resultFromError:*(void *)(a1 + 40)], *(void *)(a1 + 40));
  uint64_t v2 = (id **)(*(void *)(a1 + 32) + 80);
  return std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100](v2, 0);
}

- (void)_postSaveChangesAttemptCompletedNotificationWithAllPendingDataSaved:(BOOL)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"WBSCloudHistoryAllPendingDataSavedToCloudKey";
  uint64_t v4 = [NSNumber numberWithBool:a3];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"WBSCloudHistorySaveChangesAttemptDidCompleteNotification" object:self userInfo:v5];
}

- (id)dateOfNextPermittedSaveChangesAttempt
{
  saveChangesThrottler = self->_saveChangesThrottler;
  int64_t v3 = [(WBSCloudHistory *)self _estimatedPriorityForPotentialSaveAttempt];
  return (id)[(WBSCloudKitThrottler *)saveChangesThrottler dateOfNextPermittedOperationWithPriority:v3];
}

- (void)fetchAndMergeChanges
{
}

- (void)fetchAndMergeChangesBypassingThrottler
{
}

- (void)fetchAndMergeChangesBypassingThrottler:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void *))a4;
  id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v8 = [v7 BOOLForKey:@"WBSCloudHistoryIgnoreThrottlingPolicy"];

  if ([(WBSCloudHistory *)self isCloudHistoryEnabled])
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    int v10 = v8 | v4;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = @"respecting the throttler";
      if (v10) {
        uint64_t v11 = @"bypassing the throttler";
      }
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_DEFAULT, "Fetching changes from iCloud History %{public}@", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x3812000000;
    int64_t v16 = __Block_byref_object_copy__2;
    id v17 = __Block_byref_object_dispose__2;
    uint64_t v18 = 0;
    operator new();
  }
  id v12 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_DEFAULT, "iCloud History is not enabled. Nothing to do when fetching changes!", (uint8_t *)&buf, 2u);
  }
  if (v6)
  {
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSCloudHistory" code:1 userInfo:0];
    v6[2](v6, v13);
  }
}

void __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _registerFetchCompletionHandler:*(void *)(a1 + 40)];
  if ([*(id *)(*(void *)(a1 + 32) + 152) isValid])
  {
    uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)long long buf = 0;
    int64_t v3 = "Server has already asked us to back off. Nothing to do when fetching changes!";
LABEL_7:
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_DEFAULT, v3, buf, 2u);
    return;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v4 + 88);
  id v5 = (id **)(v4 + 88);
  if (v6)
  {
    uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)long long buf = 0;
    int64_t v3 = "A fetch operation is already in progress. Nothing to do!";
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  int v8 = *(id **)(v7 + 48);
  *(void *)(v7 + 48) = 0;
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100](v5, v8);
  id v9 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_154;
  v10[3] = &unk_1E5C8D500;
  void v10[4] = v9;
  char v11 = *(unsigned char *)(a1 + 56);
  [v9 _determineCloudHistoryStoreWithCompletion:v10];
}

uint64_t __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_154(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_2;
  v3[3] = &unk_1E5C8D4B0;
  v3[4] = v1;
  char v4 = *(unsigned char *)(a1 + 40);
  return [v1 _performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:v3];
}

id *__76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  [*(id *)(a1 + 32) _replayPersistedLongLivedSaveOperationIfNecessary];
  uint64_t v3 = *(void *)(*(void *)v2 + 184);
  if (v3 == 1)
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_INFO, "Only one device in the iCloud History sync circle", buf, 2u);
    }
    goto LABEL_12;
  }
  if (v3)
  {
    int v8 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, "More than one device in the iCloud History sync circle", buf, 2u);
    }
    id v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_125_cold_1(v2, v9);
    }
LABEL_12:
    int v10 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_157;
    v11[3] = &unk_1E5C8D4D8;
    v11[4] = v10;
    char v12 = *(unsigned char *)(a1 + 40);
    return (id *)[v10 _getServerChangeTokenDataWithCompletion:v11];
  }
  char v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Unknown number of devices in iCloud History sync circle. Will determine the number of devices and then retry the fetch.", buf, 2u);
  }
  id v5 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_155;
  v13[3] = &unk_1E5C8D4B0;
  v13[4] = v5;
  char v14 = *(unsigned char *)(a1 + 40);
  [v5 _determineNumberOfDevicesInSyncCircleForOperation:@"FetchChanges" completionHandler:v13];
  return std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(*(void *)v2 + 88), 0);
}

void __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_155(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_2_156;
  v1[3] = &unk_1E5C8D4B0;
  v1[4] = *(void *)(a1 + 32);
  char v2 = *(unsigned char *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v1);
}

uint64_t __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_2_156(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchAndMergeChangesBypassingThrottler:*(unsigned __int8 *)(a1 + 40) completionHandler:0];
}

void __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_157(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_2_158;
  block[3] = &unk_1E5C8D118;
  char v9 = *(unsigned char *)(a1 + 40);
  void block[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

void __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_2_158(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 2 * *(unsigned __int8 *)(a1 + 48);
  if ([*(id *)(*(void *)(a1 + 32) + 136) permitsOperationWithPriority:v2])
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _fetchAndMergeChangesWithServerChangeTokenData:v4 withPriority:v2];
  }
  else
  {
    id v5 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(*(void *)(a1 + 32) + 136) dateOfNextPermittedOperationWithPriority:v2];
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
      [v6 timeIntervalSinceDate:v7];
      int v11 = 134217984;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEFAULT, "Fetch was denied by the throttler. A fetch will be permitted in %f seconds.", (uint8_t *)&v11, 0xCu);
    }
    std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(*(void *)(a1 + 32) + 88), 0);
    char v9 = *(void **)(a1 + 32);
    int v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSCloudHistory" code:2 userInfo:0];
    [v9 _callAndResetFetchCompletionHandlerWithError:v10];
  }
}

- (void)_registerFetchCompletionHandler:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    fetchCompletionHandlers = self->_fetchCompletionHandlers;
    p_fetchCompletionHandlers = &self->_fetchCompletionHandlers;
    uint64_t v8 = (void *)MEMORY[0x1AD0C4F80](v4);
    char v9 = [(NSArray *)fetchCompletionHandlers arrayByAddingObject:v8];
    if (v9)
    {
      objc_storeStrong((id *)p_fetchCompletionHandlers, v9);
    }
    else
    {
      int v10 = (void *)MEMORY[0x1AD0C4F80](v5);
      v13[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      uint64_t v12 = *p_fetchCompletionHandlers;
      *p_fetchCompletionHandlers = (NSArray *)v11;
    }
  }
}

- (void)_callAndResetFetchCompletionHandlerWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_fetchCompletionHandlers;
  fetchCompletionHandlers = self->_fetchCompletionHandlers;
  self->_fetchCompletionHandlers = 0;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v7 = v5;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_getServerChangeTokenDataWithCompletion:(id)a3
{
  id v4 = a3;
  database = self->_database;
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:@"server_change_token"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __59__WBSCloudHistory__getServerChangeTokenDataWithCompletion___block_invoke;
  v8[3] = &unk_1E5C8D550;
  id v7 = v4;
  id v9 = v7;
  [(WBSHistoryServiceDatabaseProtocol *)database fetchMetadataForKeys:v6 completionHandler:v8];
}

void __59__WBSCloudHistory__getServerChangeTokenDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __59__WBSCloudHistory__getServerChangeTokenDataWithCompletion___block_invoke_cold_1();
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = objc_msgSend(v5, "safari_dataForKey:", @"server_change_token");
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

- (void)_setServerChangeToken:(id)a3
{
}

void __41__WBSCloudHistory__setServerChangeToken___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __41__WBSCloudHistory__setServerChangeToken___block_invoke_cold_1();
    }
  }
}

- (void)_pcsIdentitiesChangedNotification:(id)a3
{
  cloudHistoryQueue = self->_cloudHistoryQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__WBSCloudHistory__pcsIdentitiesChangedNotification___block_invoke;
  block[3] = &unk_1E5C8CA70;
  void block[4] = self;
  dispatch_async(cloudHistoryQueue, block);
}

void __53__WBSCloudHistory__pcsIdentitiesChangedNotification___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x1E4F19C90] object:0];

  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 241))
  {
    *(unsigned char *)(v3 + 241) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 240) = 1;
    id v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_DEFAULT, "Received expected PCS identity change notification. Fetching Safari History", buf, 2u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__WBSCloudHistory__pcsIdentitiesChangedNotification___block_invoke_164;
    block[3] = &unk_1E5C8CA70;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring PCS identity change notification because Safari History is not waiting for an identity update", buf, 2u);
    }
  }
}

uint64_t __53__WBSCloudHistory__pcsIdentitiesChangedNotification___block_invoke_164(uint64_t a1)
{
  [*(id *)(a1 + 32) fetchAndMergeChanges];
  id v2 = *(void **)(a1 + 32);
  return [v2 saveChangesToCloudHistoryStore];
}

- (id)_manateeErrorCode:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 110))
  {
    id v4 = &unk_1EFC224F8;
  }
  else if (objc_msgSend(v3, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 112))
  {
    id v4 = &unk_1EFC22510;
  }
  else if (objc_msgSend(v3, "safari_errorOrAnyPartialErrorHasCloudKitInternalErrorCode:", 5004))
  {
    id v4 = &unk_1EFC22528;
  }
  else if (objc_msgSend(v3, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 111))
  {
    id v4 = &unk_1EFC22540;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_handleManateeErrorIfNeeded:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WBSCloudHistory *)self _manateeErrorCode:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 integerValue];
    uint64_t v8 = v7;
    if (v7 > 111)
    {
      if (v7 == 112 || v7 == 5004)
      {
        long long v11 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 134217984;
          uint64_t v14 = v8;
          _os_log_impl(&dword_1A6B5F000, v11, OS_LOG_TYPE_DEFAULT, "Received unrecoverable PCS error %ld from CloudKit. Deleting the zone and saving History data again.", (uint8_t *)&v13, 0xCu);
        }
        [(WBSCloudHistory *)self _deleteAllCloudHistoryAndSaveAgain];
      }
    }
    else if (v7 == 110)
    {
      long long v12 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_DEFAULT, "Received PCS unavailable error from CloudKit. Marking PCS state needs updating", (uint8_t *)&v13, 2u);
      }
      self->_manateeStateNeedsUpdate = 1;
    }
    else if (v7 == 111)
    {
      id v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_DEFAULT, "Received unsynced Keychain error. Observing notification to start fetching History when PCS identities change", (uint8_t *)&v13, 2u);
      }
      self->_isWaitingForPCSIdentityUpdate = 1;
      uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 addObserver:self selector:sel__pcsIdentitiesChangedNotification_ name:*MEMORY[0x1E4F19C90] object:0];
    }
  }
}

- (void)_transitionCloudHistoryStoreToManateeState:(int64_t)a3 completion:(id)a4
{
  *(void *)&v20[5] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a4;
  uint64_t v7 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)id v20 = a3;
    _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_DEFAULT, "Transitioning history store to PCS state %ld", buf, 0xCu);
  }
  int64_t currentManateeState = self->_currentManateeState;
  self->_int64_t currentManateeState = a3;
  if (self->_store && (BOOL v9 = currentManateeState != 1, (a3 != 1) == v9))
  {
    long long v12 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109376;
      v20[0] = v9;
      LOWORD(v20[1]) = 1024;
      *(_DWORD *)((char *)&v20[1] + 2) = a3 != 1;
      _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_DEFAULT, "No need to transition the history store. Currently using PCS cloud history store %d, should use PCS cloud history store %d", buf, 0xEu);
    }
    v6[2](v6);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke;
    v18[3] = &unk_1E5C8D5C8;
    v18[4] = self;
    uint64_t v10 = (void *)MEMORY[0x1AD0C4F80](v18);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_4;
    v13[3] = &unk_1E5C8D690;
    v13[4] = self;
    id v14 = v10;
    BOOL v17 = a3 != 1;
    uint64_t v15 = v6;
    v16[1] = (id)a3;
    id v11 = v10;
    objc_copyWeak(v16, (id *)buf);
    [(WBSCloudHistory *)self _performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:v13];
    objc_destroyWeak(v16);

    objc_destroyWeak((id *)buf);
  }
}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 24);
  id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:@"sync_with_manatee_container"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_2;
  v7[3] = &unk_1E5C8D5A0;
  void v7[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v8 = v6;
  [v4 fetchMetadataForKeys:v5 completionHandler:v7];
}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_3;
  block[3] = &unk_1E5C8D578;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "safari_BOOLForKey:", @"sync_with_manatee_container");
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v5(v2, v3, v4);
}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_4(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_5;
  v5[3] = &unk_1E5C8D668;
  uint64_t v2 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 72);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 64);
  id v6 = v3;
  v7[1] = v4;
  objc_copyWeak(v7, (id *)(a1 + 56));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
  objc_destroyWeak(v7);
}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  void v27[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_5_cold_1();
    }
  }
  uint64_t v7 = [objc_alloc((Class)objc_opt_class()) initWithConfiguration:*(void *)(*(void *)(a1 + 32) + 112) useManateeContainer:*(unsigned __int8 *)(a1 + 64)];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 120);
  *(void *)(v8 + 120) = v7;

  if (a2)
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)long long buf = 0;
    id v11 = "History database has PCS container sync properties";
  }
  else
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)long long buf = 0;
    id v11 = "History database has normal container sync properties";
  }
  _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
LABEL_11:
  id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v13 = *(void *)(a1 + 32);
  id v26 = @"UsesManateeContainerKey";
  id v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  v27[0] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  [v12 postNotificationName:@"WBSCloudHistoryStoreManateeStateDidChangeNotification" object:v13 userInfo:v15];

  if (((*(unsigned __int8 *)(a1 + 64) != a2) & ~(v5 != 0)) != 0)
  {
    uint64_t v18 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void **)(a1 + 56);
      *(_DWORD *)long long buf = 134217984;
      int64_t v25 = v19;
      _os_log_impl(&dword_1A6B5F000, v18, OS_LOG_TYPE_DEFAULT, "History database needs to reset because sync properties are not compatible with PCS state %ld", buf, 0xCu);
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_176;
    v20[3] = &unk_1E5C8D640;
    v20[4] = *(void *)(a1 + 32);
    char v23 = *(unsigned char *)(a1 + 64);
    objc_copyWeak(&v22, (id *)(a1 + 48));
    id v21 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v20);

    objc_destroyWeak(&v22);
  }
  else
  {
    uint64_t v16 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v17 = objc_msgSend(v5, "safari_privacyPreservingDescription");
      *(_DWORD *)long long buf = 138543362;
      int64_t v25 = v17;
      _os_log_impl(&dword_1A6B5F000, v16, OS_LOG_TYPE_DEFAULT, "Database sync properties should not reset. Error %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_176(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_2_177;
  v3[3] = &unk_1E5C8D640;
  v3[4] = v2;
  char v6 = *(unsigned char *)(a1 + 56);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  [v2 _resetForAccountChangeWithCompletionHandler:v3];

  objc_destroyWeak(&v5);
}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_2_177(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_DEFAULT, "Finish reseting database sync properties in response to PCS cloud history store transition", buf, 2u);
  }
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_178;
  v5[3] = &unk_1E5C8D618;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 40);
  [v3 setMetadataValue:v4 forKey:@"sync_with_manatee_container" completionHandler:v5];

  objc_destroyWeak(&v7);
}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_178(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_178_cold_1();
    }
  }
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_179;
    block[3] = &unk_1E5C8D5F0;
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v7, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_179(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_deleteAllCloudHistoryAndSaveAgain
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke;
  v2[3] = &unk_1E5C8CA70;
  v2[4] = self;
  [(WBSCloudHistory *)self _performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:v2];
}

uint64_t __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_2;
  v3[3] = &unk_1E5C8D6B8;
  v3[4] = v1;
  return [v1 _determineCloudHistoryStoreWithCompletion:v3];
}

uint64_t __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_3;
  v3[3] = &unk_1E5C8D348;
  v3[4] = *(void *)(a1 + 32);
  return [a2 deleteHistoryZoneWithCompletion:v3];
}

void __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_3(uint64_t a1, void *a2)
{
  block[8] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_3_cold_1();
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_181;
    block[3] = &unk_1E5C8CA70;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_181(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_2_182;
  v3[3] = &unk_1E5C8CA70;
  v3[4] = v1;
  return [v1 _resetForAccountChangeWithCompletionHandler:v3];
}

void __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_2_182(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_3_183;
  block[3] = &unk_1E5C8CA70;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_3_183(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveChangesToCloudHistoryStore];
}

- (void)_fetchAndMergeChangesWithServerChangeTokenData:(id)a3 withPriority:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke;
  v8[3] = &unk_1E5C8D7F8;
  id v9 = v6;
  uint64_t v10 = self;
  int64_t v11 = a4;
  id v7 = v6;
  [(WBSCloudHistory *)self _determineCloudHistoryStoreWithCompletion:v8];
}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke(int8x16_t *a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_2;
  v3[3] = &unk_1E5C8D7D0;
  uint64_t v5 = a1[3].i64[0];
  int8x16_t v2 = a1[2];
  int8x16_t v4 = vextq_s8(v2, v2, 8uLL);
  [a2 fetchRecordsWithServerChangeTokenData:(id)v2.i64[0] completion:v3];
}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_2(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = a1[4];
  uint64_t v10 = *(NSObject **)(v9 + 8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3;
  v14[3] = &unk_1E5C8D7A8;
  id v15 = v8;
  uint64_t v16 = v9;
  int64_t v11 = (void *)a1[5];
  uint64_t v19 = a1[6];
  uint64_t v20 = a3;
  id v17 = v7;
  id v18 = v11;
  id v12 = v7;
  id v13 = v8;
  dispatch_async(v10, v14);
}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int8x16_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    int v3 = objc_msgSend(v2, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E4F19C38], 21);
    int8x16_t v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    uint64_t v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEFAULT, "iCloud History change token has expired. Resetting change token and retrying fetch.", buf, 2u);
      }
      [*(id *)(a1 + 40) _setServerChangeToken:0];
      [*(id *)(a1 + 40) _fetchAndMergeChangesWithServerChangeTokenData:0 withPriority:*(void *)(a1 + 64)];
    }
    else
    {
      uint64_t v16 = v4;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3_cold_1();
      }

      if (*(void *)(a1 + 72) >= 2uLL)
      {
        unint64_t v17 = 0;
        do
        {
          [*(id *)(*(void *)(a1 + 40) + 136) operationWithPriority:*(void *)(a1 + 64) didCompleteWithResult:2];
          ++v17;
        }
        while (v17 < *(void *)(a1 + 72) - 1);
      }
      uint64_t v18 = [*(id *)(a1 + 40) _resultFromError:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(a1 + 40) + 136) operationWithPriority:*(void *)(a1 + 64) didCompleteWithResult:v18];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_184;
      block[3] = &unk_1E5C8D6E0;
      uint64_t v32 = v18;
      int8x16_t v21 = *(int8x16_t *)(a1 + 32);
      id v19 = (id)v21.i64[0];
      int8x16_t v31 = vextq_s8(v21, v21, 8uLL);
      dispatch_async(MEMORY[0x1E4F14428], block);
      std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(*(void *)(a1 + 40) + 88), 0);
      if (v18 != 5)
      {
        [*(id *)(a1 + 40) _callAndResetFetchCompletionHandlerWithError:*(void *)(a1 + 32)];
        if (v18 == 6)
        {
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_2_185;
          v29[3] = &unk_1E5C8CA70;
          v29[4] = *(void *)(a1 + 40);
          uint64_t v20 = (void *)MEMORY[0x1E4F14428];
          dispatch_async(MEMORY[0x1E4F14428], v29);
        }
        else if (v18 == 7)
        {
          [*(id *)(a1 + 40) _handleManateeErrorIfNeeded:*(void *)(a1 + 32)];
        }
      }
    }
  }
  else
  {
    if (*(void *)(a1 + 72))
    {
      unint64_t v6 = 0;
      do
      {
        [*(id *)(*(void *)(a1 + 40) + 136) operationWithPriority:*(void *)(a1 + 64) didCompleteWithResult:2];
        ++v6;
      }
      while (v6 < *(void *)(a1 + 72));
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3_186;
    v25[3] = &unk_1E5C8D708;
    v25[4] = *(void *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 72);
    id v26 = v7;
    uint64_t v28 = v8;
    id v27 = *(id *)(a1 + 56);
    uint64_t v9 = (void *)MEMORY[0x1AD0C4F80](v25);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 272));
    int64_t v11 = [*(id *)(a1 + 48) profiles];
    id v12 = [v11 allObjects];
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(v13 + 8);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3_189;
    v22[3] = &unk_1E5C8D780;
    v22[4] = v13;
    id v23 = *(id *)(a1 + 48);
    id v15 = WeakRetained;
    id v24 = v15;
    objc_msgSend(v12, "safari_enumerateAsynchronouslyOnQueue:enumerationBlock:completionBlock:", v14, v22, v9);
  }
}

void *__79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_184(void *result)
{
  if (result[6] == 5)
  {
    *(unsigned char *)(result[4] + 161) = 1;
    uint64_t v1 = (void *)result[4];
    [v1 _backoffTimeIntervalFromError:result[5]];
    return objc_msgSend(v1, "_backOffWithInterval:");
  }
  return result;
}

uint64_t __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_2_185(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetForAccountChangeWithCompletionHandler:0];
}

uint64_t __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3_186(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int8x16_t v2 = *(void **)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) serverChangeTokenData];
  [v2 _setServerChangeToken:v3];

  [*(id *)(a1 + 32) _pruneTombstonesThatCanNoLongerMatchVisitsFetchedFromCloud];
  int8x16_t v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 40) visitCount];
    uint64_t v6 = [*(id *)(a1 + 40) tombstoneCount];
    uint64_t v7 = *(void *)(a1 + 56);
    *(_DWORD *)long long buf = 134218496;
    uint64_t v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2048;
    uint64_t v17 = v7;
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_DEFAULT, "Merged %zu visits and %zu tombstones fetched from iCloud History in %zu operations into local history store.", buf, 0x20u);
  }

  [*(id *)(*(void *)(a1 + 32) + 168) clearAcknowledgedPushNotifications];
  [*(id *)(a1 + 32) _processPendingPushNotifications];
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(*(void *)(a1 + 32) + 88), 0);
  uint64_t result = [*(id *)(a1 + 32) _callAndResetFetchCompletionHandlerWithError:0];
  if (!*(void *)(a1 + 48))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(void *)(v9 + 184) <= 1uLL)
    {
      *(void *)(v9 + 64) = 0;
      *(void *)(*(void *)(a1 + 32) + 184) = 0;
      uint64_t v10 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_187;
      v11[3] = &unk_1E5C8CA70;
      v11[4] = v10;
      return [v10 _determineNumberOfDevicesInSyncCircleForOperation:@"FetchChanges" completionHandler:v11];
    }
  }
  return result;
}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_187(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 184) >= 2uLL)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_2_188;
    block[3] = &unk_1E5C8CA70;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_2_188(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveChangesBypassingThrottler:0 completionHandler:0];
}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3_189(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  if (([*(id *)(a1 + 32) _shouldSyncProfiles] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F980C8]] & 1) != 0)
  {
    uint64_t v8 = [*(id *)(a1 + 32) _convertProfileServerIdentifierToLocalIdentifier:v6];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = *(void **)(a1 + 48);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_190;
      v12[3] = &unk_1E5C8D758;
      id v13 = v8;
      id v14 = v6;
      id v16 = v7;
      id v15 = *(id *)(a1 + 40);
      [v10 openDatabaseWithID:v13 createIfNeeded:1 completionHandler:v12];
    }
    else
    {
      int64_t v11 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138477827;
        id v18 = v6;
        _os_log_impl(&dword_1A6B5F000, v11, OS_LOG_TYPE_DEFAULT, "Database for profile with server identifier %{private}@ does not exists on device because there is no local profile identifier that it is associated with, ignoring records associated with this server identifier", buf, 0xCu);
      }
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
  else
  {
    [*(id *)(a1 + 40) clearRecordsForProfileWithServerIdentifier:v6];
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_190(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_190_cold_1((uint64_t)a1, v7);
      if (v5) {
        goto LABEL_4;
      }
LABEL_6:
      (*((void (**)(void))a1[7] + 2))();
      goto LABEL_7;
    }
  }
  if (!v5) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v8 = [[WBSCloudHistoryMergeOperation alloc] initWithDatabase:v5 fetchResult:a1[6] profileServerIdentifier:a1[5]];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_192;
  v9[3] = &unk_1E5C8D730;
  id v10 = a1[6];
  id v11 = a1[5];
  id v12 = a1[7];
  [(WBSCloudHistoryMergeOperation *)v8 mergeWithCompletion:v9];

LABEL_7:
}

uint64_t __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_192(uint64_t a1)
{
  [*(id *)(a1 + 32) clearRecordsForProfileWithServerIdentifier:*(void *)(a1 + 40)];
  int8x16_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)_pruneTombstonesThatCanNoLongerMatchVisitsFetchedFromCloud
{
  int v3 = [MEMORY[0x1E4F1C9C8] date];
  [(WBSCloudHistoryConfiguration *)self->_configuration syncWindow];
  id v5 = [v3 dateByAddingTimeInterval:-v4];

  [(WBSHistoryServiceDatabaseProtocol *)self->_database pruneTombstonesWithEndDatePriorToDate:v5 completionHandler:&__block_literal_global_196];
}

void __77__WBSCloudHistory__pruneTombstonesThatCanNoLongerMatchVisitsFetchedFromCloud__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    double v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __77__WBSCloudHistory__pruneTombstonesThatCanNoLongerMatchVisitsFetchedFromCloud__block_invoke_cold_1();
    }
  }
}

- (void)_replayPersistedLongLivedSaveOperationIfNecessary
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(WBSCloudHistoryConfiguration *)self->_configuration shouldUseLongLivedOperationsToSaveRecords]&& !self->_replayLongLivedSaveOperationHasBeenPerformed)
  {
    self->_replayLongLivedSaveOperationHasBeenPerformed = 1;
    id v6 = 0;
    id v7 = 0;
    [(WBSCloudHistory *)self _persistedLongLivedSaveOperationID:&v7 databaseGenerations:&v6];
    id v3 = v7;
    id v4 = v6;
    [(WBSCloudHistory *)self _removePersistedLongLivedSaveOperationDictionary];
    if (v3 && v4) {
      operator new();
    }
    id v5 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543618;
      id v9 = v3;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "There is no persisted long-lived operation to replay. Operation ID: %{public}@, generations: %@", buf, 0x16u);
    }
  }
}

void __68__WBSCloudHistory__replayPersistedLongLivedSaveOperationIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__WBSCloudHistory__replayPersistedLongLivedSaveOperationIfNecessary__block_invoke_2;
  v6[3] = &unk_1E5C8D868;
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  id v8 = *(id *)(a1 + 48);
  [a2 replayPersistedLongLivedSaveOperationWithID:v4 completion:v6];
}

void __68__WBSCloudHistory__replayPersistedLongLivedSaveOperationIfNecessary__block_invoke_2(id *a1, int a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)a1[4] + 12, 0);
    id v11 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = a1[5];
      id v12 = a1[6];
      id v14 = @"NO";
      if (a2) {
        id v14 = @"YES";
      }
      id v15 = v14;
      id v16 = objc_msgSend(v5, "safari_privacyPreservingDescription");
      *(_DWORD *)long long buf = 138544130;
      id v21 = v13;
      __int16 v22 = 2112;
      id v23 = v12;
      __int16 v24 = 2114;
      int64_t v25 = v15;
      __int16 v26 = 2114;
      id v27 = v16;
      _os_log_error_impl(&dword_1A6B5F000, v11, OS_LOG_TYPE_ERROR, "Long-lived operation cannot be fetched. Operation ID: %{public}@, generations: %@, operation exists: %{public}@, error: %{public}@", buf, 0x2Au);
    }
    [a1[4] _handleManateeErrorIfNeeded:v5];
  }
  else
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = a1[5];
      id v8 = a1[6];
      *(_DWORD *)long long buf = 138543618;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Long-lived operation was fetched and successfully replayed. Operation ID: %{public}@, generations: %@", buf, 0x16u);
    }
    id v9 = a1[4];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__WBSCloudHistory__replayPersistedLongLivedSaveOperationIfNecessary__block_invoke_200;
    v17[3] = &unk_1E5C8D840;
    void v17[4] = v9;
    id v10 = a1[6];
    id v18 = a1[5];
    id v19 = a1[6];
    [v9 _updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations:v10 completion:v17];
  }
}

void __68__WBSCloudHistory__replayPersistedLongLivedSaveOperationIfNecessary__block_invoke_200(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(a1[4] + 96), 0);
  int8x16_t v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_INFO, "History was updated after successfully replaying the persisted long-lived operation. Operation ID: %{public}@, generations: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseStore);
  uint64_t v9 = [v6 allKeys];
  cloudHistoryQueue = self->_cloudHistoryQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke;
  v13[3] = &unk_1E5C8D780;
  v13[4] = self;
  id v11 = WeakRetained;
  id v14 = v11;
  id v12 = v6;
  id v15 = v12;
  objc_msgSend(v9, "safari_enumerateAsynchronouslyOnQueue:enumerationBlock:completionBlock:", cloudHistoryQueue, v13, v7);
}

void __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) _convertProfileServerIdentifierToLocalIdentifier:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_201;
    v12[3] = &unk_1E5C8D8E0;
    id v13 = v8;
    id v16 = v7;
    id v14 = *(id *)(a1 + 48);
    id v15 = v6;
    [v10 openDatabaseWithID:v13 createIfNeeded:0 completionHandler:v12];
  }
  else
  {
    id v11 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_cold_1((uint64_t)v6, v11);
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_201(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
    uint64_t v9 = [v8 longLongValue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_202;
    v13[3] = &unk_1E5C8D8B8;
    id v14 = *(id *)(a1 + 56);
    [v5 updateDatabaseAfterSuccessfulSyncWithGeneration:v9 completionHandler:v13];
  }
  else
  {
    if ((objc_msgSend(v6, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E4F28798], 2) & 1) == 0)
    {
      id v10 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        id v12 = objc_msgSend(v7, "safari_privacyPreservingDescription");
        __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_201_cold_1(v11, v12, (uint64_t)v15);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_202(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_6_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_persistedLongLivedSaveOperationID:(id *)a3 databaseGenerations:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  *a3 = 0;
  *a4 = 0;
  id v6 = self->_longLivedSaveOperationData;
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = objc_msgSend(v7, "safari_stringForKey:", @"operationID");
      if (v8)
      {
        uint64_t v9 = objc_msgSend(v7, "safari_numberForKey:", @"generation");
        if (v9)
        {
          *a3 = v8;
          uint64_t v11 = *MEMORY[0x1E4F980C8];
          v12[0] = v9;
          *a4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
        }
        else
        {
          id v10 = [v7 objectForKeyedSubscript:@"generations"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            *a3 = v8;
            *a4 = v10;
          }
        }
      }
    }
  }
}

- (void)_persistLongLivedSaveOperationDictionaryWithOperationID:(id)a3 databaseGenerations:(id)a4
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12[0] = @"operationID";
  v12[1] = @"generations";
  v13[0] = v6;
  v13[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:200 options:0 error:0];
  longLivedSaveOperationData = self->_longLivedSaveOperationData;
  self->_longLivedSaveOperationData = v9;
  uint64_t v11 = v9;

  [(WBSHistoryServiceDatabaseProtocol *)self->_database setMetadataValue:v11 forKey:@"long_lived_save_operation" completionHandler:&__block_literal_global_204];
}

void __95__WBSCloudHistory__persistLongLivedSaveOperationDictionaryWithOperationID_databaseGenerations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __95__WBSCloudHistory__persistLongLivedSaveOperationDictionaryWithOperationID_databaseGenerations___block_invoke_cold_1();
    }
  }
}

- (void)_removePersistedLongLivedSaveOperationDictionary
{
  longLivedSaveOperationData = self->_longLivedSaveOperationData;
  self->_longLivedSaveOperationData = 0;

  database = self->_database;
  [(WBSHistoryServiceDatabaseProtocol *)database setMetadataValue:0 forKey:@"long_lived_save_operation" completionHandler:&__block_literal_global_206];
}

void __67__WBSCloudHistory__removePersistedLongLivedSaveOperationDictionary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __67__WBSCloudHistory__removePersistedLongLivedSaveOperationDictionary__block_invoke_cold_1();
    }
  }
}

- (void)_initializePushNotificationSupport
{
  if ([(WBSCloudHistory *)self isCloudHistoryEnabled])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke;
    v3[3] = &unk_1E5C8D908;
    void v3[4] = self;
    [(WBSCloudHistory *)self _pushNotificationsAreInitializedWithCompletionHandler:v3];
  }
}

void __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_cold_1();
    }
  }
  else if (a2)
  {
    [*(id *)(a1 + 32) _processPendingPushNotifications];
  }
  else
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_INFO, "Initializing iCloud History push notifications…", buf, 2u);
    }
    uint64_t v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_207;
    v9[3] = &unk_1E5C8D6B8;
    void v9[4] = v8;
    [v8 _determineCloudHistoryStoreWithCompletion:v9];
  }
}

uint64_t __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_207(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_2;
  v3[3] = &unk_1E5C8D348;
  void v3[4] = *(void *)(a1 + 32);
  return [a2 initializePushNotifications:v3];
}

void __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_2_cold_1();
    }
  }
  else
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Push notifications are now initialized.", v6, 2u);
    }
    [*(id *)(a1 + 32) _setPushNotificationAreInitialized:1];
  }
  [*(id *)(a1 + 32) fetchAndMergeChanges];
}

- (void)_pushNotificationsAreInitializedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  database = self->_database;
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:@"push_notifications_initialized"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __73__WBSCloudHistory__pushNotificationsAreInitializedWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5C8D5A0;
  void v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [(WBSHistoryServiceDatabaseProtocol *)database fetchMetadataForKeys:v6 completionHandler:v8];
}

void __73__WBSCloudHistory__pushNotificationsAreInitializedWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__WBSCloudHistory__pushNotificationsAreInitializedWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5C8D578;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __73__WBSCloudHistory__pushNotificationsAreInitializedWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "safari_BOOLForKey:", @"push_notifications_initialized");
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v5(v2, v3, v4);
}

- (void)_setPushNotificationAreInitialized:(BOOL)a3
{
  database = self->_database;
  id v4 = [NSNumber numberWithBool:a3];
  -[WBSHistoryServiceDatabaseProtocol setMetadataValue:forKey:completionHandler:](database, "setMetadataValue:forKey:completionHandler:");
}

void __54__WBSCloudHistory__setPushNotificationAreInitialized___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __54__WBSCloudHistory__setPushNotificationAreInitialized___block_invoke_cold_1();
    }
  }
}

- (void)_pushNotificationReceived:(id)a3
{
  id v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_DEFAULT, "iCloud History push notification received from agent.", v5, 2u);
  }
  [(WBSCloudHistory *)self _processPendingPushNotifications];
}

- (void)_processPendingPushNotifications
{
  pushAgent = self->_pushAgent;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__WBSCloudHistory__processPendingPushNotifications__block_invoke;
  v3[3] = &unk_1E5C8D958;
  void v3[4] = self;
  [(WBSCloudHistoryPushAgentProxy *)pushAgent getPushNotifications:v3];
}

void __51__WBSCloudHistory__processPendingPushNotifications__block_invoke(uint64_t a1, char a2, char a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 8);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__WBSCloudHistory__processPendingPushNotifications__block_invoke_2;
  v5[3] = &unk_1E5C8D930;
  char v6 = a2;
  char v7 = a3;
  void v5[4] = v3;
  dispatch_async(v4, v5);
}

void __51__WBSCloudHistory__processPendingPushNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 40) && !*(unsigned char *)(a1 + 41))
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v20) = 0;
    id v9 = "No pending push notifications.";
    goto LABEL_24;
  }
  id v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v3 = @"YES";
    }
    else {
      uint64_t v3 = @"NO";
    }
    id v4 = v3;
    if (*(unsigned char *)(a1 + 41)) {
      id v5 = @"YES";
    }
    else {
      id v5 = @"NO";
    }
    char v6 = v5;
    int v20 = 138543618;
    id v21 = v4;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_INFO, "Processing unacknowledged push notifications: %{public}@. Processing acknowledged push notifications: %{public}@.", (uint8_t *)&v20, 0x16u);
  }
  [*(id *)(a1 + 32) _updateDeviceCountInResponseToPushNotification];
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(void *)(v7 + 88))
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v20) = 0;
    id v9 = "A fetch is already in progress. Push notifications will be processed once the fetch completes.";
LABEL_24:
    _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v20, 2u);
    return;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(v7 + 168) acknowledgePendingPushNotifications];
    uint64_t v7 = *(void *)(a1 + 32);
  }
  if (([*(id *)(v7 + 136) permitsOperationWithPriority:0] & 1) != 0
    || ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 BOOLForKey:@"WBSCloudHistoryIgnoreThrottlingPolicy"],
        v10,
        v11))
  {
    [*(id *)(a1 + 32) _fetchChangesInResponseToPushNotification:0];
    return;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (*(void *)(v12 + 176))
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v20) = 0;
    id v9 = "A fetch has already been scheduled in response to a push notification.";
    goto LABEL_24;
  }
  id v13 = [*(id *)(v12 + 136) dateOfNextPermittedOperationWithPriority:0];
  id v14 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:v15];
    int v20 = 134217984;
    id v21 = v16;
    _os_log_impl(&dword_1A6B5F000, v14, OS_LOG_TYPE_DEFAULT, "A fetch is not currently permitted by the throttler. Scheduling a fetch in %f seconds in response to processing push notifications", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v17 = [[WBSOneShotTimer alloc] initWithFireDate:v13 queue:*(void *)(*(void *)(a1 + 32) + 8) target:*(void *)(a1 + 32) selector:sel__fetchChangesInResponseToPushNotification_];
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(v18 + 176);
  *(void *)(v18 + 176) = v17;
}

- (void)_fetchChangesInResponseToPushNotification:(id)a3
{
  pushNotificationFetchTimer = self->_pushNotificationFetchTimer;
  self->_pushNotificationFetchTimer = 0;

  id v5 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEFAULT, "Fetching changes from iCloud History in response to a push notification.", buf, 2u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__WBSCloudHistory__fetchChangesInResponseToPushNotification___block_invoke;
  block[3] = &unk_1E5C8CA70;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__WBSCloudHistory__fetchChangesInResponseToPushNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchAndMergeChanges];
}

- (void)_determineNumberOfDevicesInSyncCircleForOperation:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_syncCircleSizeRetrievalCompletionHandlersByOperation objectForKeyedSubscript:v6];

  if (v8)
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WBSCloudHistory _determineNumberOfDevicesInSyncCircleForOperation:completionHandler:]((uint64_t)v6, v9);
    }
  }
  else
  {
    id v10 = (void *)[v7 copy];
    [(NSMutableDictionary *)self->_syncCircleSizeRetrievalCompletionHandlersByOperation setObject:v10 forKeyedSubscript:v6];

    if ((unint64_t)[(NSMutableDictionary *)self->_syncCircleSizeRetrievalCompletionHandlersByOperation count] <= 1)
    {
      unint64_t v11 = [(WBSCloudHistory *)self _cachedNumberOfDevicesInSyncCircle];
      int v12 = [(WBSCloudKitThrottler *)self->_syncCircleSizeRetrievalThrottler permitsOperationWithPriority:v11 == 0];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke;
      v19[3] = &unk_1E5C8D9F0;
      char v20 = v12;
      void v19[4] = self;
      void v19[5] = v11 == 0;
      id v13 = (void (**)(void, void, void))MEMORY[0x1AD0C4F80](v19);
      id v14 = v13;
      if (v12)
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_4;
        v17[3] = &unk_1E5C8DA18;
        uint64_t v18 = v13;
        [(WBSCloudHistory *)self _determineCloudHistoryStoreWithCompletion:v17];
      }
      else
      {
        id v15 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16[0] = 0;
          _os_log_impl(&dword_1A6B5F000, v15, OS_LOG_TYPE_INFO, "Determining size of sync circle was denied by throttler", (uint8_t *)v16, 2u);
        }
        v14[2](v14, v11, 0);
      }
    }
  }
}

void __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_214;
    block[3] = &unk_1E5C8D980;
    void block[4] = v7;
    id v14 = v5;
    dispatch_async(v8, block);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(NSObject **)(v9 + 8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_2;
    v11[3] = &unk_1E5C8D9C8;
    v11[4] = v9;
    void v11[5] = a2;
    char v12 = *(unsigned char *)(a1 + 48);
    v11[6] = *(void *)(a1 + 40);
    dispatch_async(v10, v11);
  }
}

uint64_t __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_214(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 192) removeAllObjects];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _handleManateeErrorIfNeeded:v3];
}

uint64_t __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNumberOfDevicesInSyncCircle:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 192) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_217];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 192) removeAllObjects];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 144);
    uint64_t v4 = *(void *)(a1 + 48);
    return [v3 operationWithPriority:v4 didCompleteWithResult:2];
  }
  return result;
}

uint64_t __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

uint64_t __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 fetchNumberOfDevicesInSyncCircleWithCompletion:*(void *)(a1 + 32)];
}

- (void)_saveChangesWhenHistoryLoads
{
  if (!self->_saveChangesWhenHistoryLoads)
  {
    [(WBSCloudHistory *)self _registerForHistoryWasLoadedNotificationIfNecessary];
    self->_saveChangesWhenHistoryLoads = 1;
  }
}

- (void)_fetchChangesWhenHistoryLoads
{
  if (!self->_fetchChangesWhenHistoryLoads)
  {
    [(WBSCloudHistory *)self _registerForHistoryWasLoadedNotificationIfNecessary];
    self->_fetchChangesWhenHistoryLoads = 1;
  }
}

- (void)_updateProfileServerIdentifiersToLocalIdentifiersMapBasedOnLocalToServerMap
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  namedProfileLocalIdentifiersToServerIdentifiersMap = self->_namedProfileLocalIdentifiersToServerIdentifiersMap;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __94__WBSCloudHistory__updateProfileServerIdentifiersToLocalIdentifiersMapBasedOnLocalToServerMap__block_invoke;
  v8[3] = &unk_1E5C8DA40;
  id v5 = v3;
  uint64_t v9 = v5;
  [(NSDictionary *)namedProfileLocalIdentifiersToServerIdentifiersMap enumerateKeysAndObjectsUsingBlock:v8];
  namedProfileServerIdentifiersToLocalIdentifiersMap = self->_namedProfileServerIdentifiersToLocalIdentifiersMap;
  self->_namedProfileServerIdentifiersToLocalIdentifiersMap = v5;
  uint64_t v7 = v5;
}

uint64_t __94__WBSCloudHistory__updateProfileServerIdentifiersToLocalIdentifiersMapBasedOnLocalToServerMap__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

- (void)_updateProfileLocalIdentifiersToServerIdentifiersMapInDatabase
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.808e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to serialize profile identifier map: %{private}@", v5);
}

void __81__WBSCloudHistory__updateProfileLocalIdentifiersToServerIdentifiersMapInDatabase__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    __81__WBSCloudHistory__updateProfileLocalIdentifiersToServerIdentifiersMapInDatabase__block_invoke_cold_1();
  }
}

- (void)updateProfileLocalIdentifiersToServerIdentifiersMap:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__WBSCloudHistory_updateProfileLocalIdentifiersToServerIdentifiersMap_completionHandler___block_invoke;
  v10[3] = &unk_1E5C8D730;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(WBSCloudHistory *)self _performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:v10];
}

void __89__WBSCloudHistory_updateProfileLocalIdentifiersToServerIdentifiersMap_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 248) isEqualToDictionary:*(void *)(a1 + 40)])
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    int v3 = (void *)MEMORY[0x1E4F1CA80];
    os_log_t v4 = [*(id *)(a1 + 40) allKeys];
    id v8 = [v3 setWithArray:v4];

    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = [*(id *)(*(void *)(a1 + 32) + 248) allKeys];
    id v7 = [v5 setWithArray:v6];
    [v8 minusSet:v7];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 248), *(id *)(a1 + 40));
    [*(id *)(a1 + 32) _updateProfileServerIdentifiersToLocalIdentifiersMapBasedOnLocalToServerMap];
    [*(id *)(a1 + 32) _updateProfileLocalIdentifiersToServerIdentifiersMapInDatabase];
    if ([v8 count]) {
      [*(id *)(a1 + 32) _fetchAddedProfileLocalIdentifiers:v8];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_fetchAddedProfileLocalIdentifiers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke;
  v6[3] = &unk_1E5C8DAB8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WBSCloudHistory *)self _determineCloudHistoryStoreWithCompletion:v6];
}

void __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) allObjects];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke_2;
  v7[3] = &unk_1E5C8DA90;
  void v7[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v8 = v6;
  [v4 _enumerateDatabasesWithProfileLocalIdentifiers:v5 createIfNeeded:1 enumerationBlock:v7 completionBlock:&__block_literal_global_226];
}

void __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(a1 + 32) _convertProfileLocalIdentifierToServerIdentifier:v7];
  id v11 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v16[2] = __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke_3;
  v16[3] = &unk_1E5C8DA68;
  id v17 = v10;
  id v12 = v7;
  id v18 = v12;
  id v13 = v9;
  id v20 = v13;
  id v14 = v8;
  id v19 = v14;
  id v15 = v10;
  [v11 fetchRecordsForProfileServerIdentifier:v15 completion:v16];
}

void __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      id v11 = objc_msgSend(v6, "safari_privacyPreservingDescription");
      *(_DWORD *)long long buf = 138478339;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_error_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch records for profile server identifier %{private}@ (local identifier: %@): %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v8 = [[WBSCloudHistoryMergeOperation alloc] initWithDatabase:*(void *)(a1 + 48) fetchResult:v5 profileServerIdentifier:*(void *)(a1 + 32)];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke_222;
    v12[3] = &unk_1E5C8D5F0;
    id v13 = *(id *)(a1 + 56);
    [(WBSCloudHistoryMergeOperation *)v8 mergeWithCompletion:v12];
  }
}

uint64_t __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke_222(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke_2_224()
{
  v0 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_INFO, "Finished fetching new profiles", v1, 2u);
  }
}

- (void)_loadMetadataAsynchronously
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"push_throttler_data", @"fetch_throttler_data", @"sync_circle_size_retrieval_throttler_data", @"cached_sync_circle_size", @"long_lived_save_operation", @"profile_server_map", 0);
  database = self->_database;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__WBSCloudHistory__loadMetadataAsynchronously__block_invoke;
  v5[3] = &unk_1E5C8DAE0;
  void v5[4] = self;
  [(WBSHistoryServiceDatabaseProtocol *)database fetchMetadataForKeys:v3 completionHandler:v5];
}

void __46__WBSCloudHistory__loadMetadataAsynchronously__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __46__WBSCloudHistory__loadMetadataAsynchronously__block_invoke_2;
  v7[3] = &unk_1E5C8D980;
  void v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __46__WBSCloudHistory__loadMetadataAsynchronously__block_invoke_2(uint64_t a1)
{
  v23[4] = *(id *)MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 40);
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "safari_dataForKey:", @"push_throttler_data");
  uint64_t v5 = a1 + 32;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v3;

  uint64_t v7 = objc_msgSend(*v2, "safari_dataForKey:", @"fetch_throttler_data");
  id v8 = *(void **)(*(void *)(a1 + 32) + 40);
  *(void *)(*(void *)v5 + 40) = v7;

  uint64_t v9 = objc_msgSend(*v2, "safari_dataForKey:", @"sync_circle_size_retrieval_throttler_data");
  uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 48);
  *(void *)(*(void *)v5 + 48) = v9;

  id v11 = objc_msgSend(*v2, "safari_numberForKey:", @"cached_sync_circle_size");
  *(void *)(*(void *)(a1 + 32) + 64) = [v11 unsignedIntegerValue];

  uint64_t v12 = objc_msgSend(*(id *)(a1 + 40), "safari_dataForKey:", @"long_lived_save_operation");
  id v13 = *(void **)(*(void *)(a1 + 32) + 56);
  *(void *)(*(void *)(a1 + 32) + 56) = v12;

  id v14 = objc_msgSend(*(id *)(a1 + 40), "safari_dataForKey:", @"profile_server_map");
  if (v14)
  {
    v23[0] = 0;
    uint64_t v15 = [MEMORY[0x1E4F28F98] propertyListWithData:v14 options:0 format:0 error:v23];
    id v16 = v23[0];
    uint64_t v17 = *(void *)(a1 + 32);
    __int16 v18 = *(void **)(v17 + 248);
    *(void *)(v17 + 248) = v15;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(void **)(v19 + 248);
      *(void *)(v19 + 248) = 0;
    }
    id v21 = *(void **)(a1 + 32);
    if (v21[31])
    {
      [v21 _updateProfileServerIdentifiersToLocalIdentifiersMapBasedOnLocalToServerMap];
    }
    else
    {
      __int16 v22 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __46__WBSCloudHistory__loadMetadataAsynchronously__block_invoke_2_cold_1();
      }
    }
  }
  dispatch_set_target_queue(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16), *(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  dispatch_activate(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
}

- (void)_performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:(id)a3
{
}

- (int64_t)_priorityForSaveWithVisits:(id)a3 tombstones:(id)a4 bypassingThrottler:(BOOL)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = v6;
  if (a5)
  {
    int64_t v8 = 2;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = objc_msgSend(v6, "allValues", 0);
    int64_t v8 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          v10 += [*(id *)(*((void *)&v14 + 1) + 8 * v12++) count];
        }
        while (v8 != v12);
        int64_t v8 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
      int64_t v8 = v10 != 0;
    }
  }
  return v8;
}

- (int64_t)_estimatedPriorityForPotentialSaveAttempt
{
  return self->_removedHistoryItemsArePendingSave;
}

- (int64_t)_resultFromError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(WBSCloudHistory *)self _manateeErrorCode:v4];

    if (v5)
    {
      int64_t v6 = 7;
    }
    else if ((objc_msgSend(v4, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 26) & 1) != 0 {
           || (objc_msgSend(v4, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 28) & 1) != 0)
    }
    {
      int64_t v6 = 6;
    }
    else if (objc_msgSend(v4, "safari_errorOrAnyPartialErrorHasCloudKitInternalErrorCode:", 5008))
    {
      int64_t v6 = 5;
    }
    else
    {
      int64_t v8 = [v4 domain];
      char v9 = [v8 isEqualToString:*MEMORY[0x1E4F19C38]];

      if ((v9 & 1) != 0 && ([v4 code] & 0xFFFFFFFFFFFFFFFELL) == 6)
      {
        [(WBSCloudHistory *)self _backoffTimeIntervalFromError:v4];
        if (v10 == 0.0) {
          int64_t v6 = 4;
        }
        else {
          int64_t v6 = 5;
        }
      }
      else
      {
        int64_t v6 = 3;
      }
    }
  }
  else
  {
    int64_t v6 = 2;
  }

  return v6;
}

- (double)_backoffTimeIntervalFromError:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "safari_errorOrAnyPartialErrorHasCloudKitInternalErrorCode:", 5008))
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Backing off sync in response to receiving unsynced keychain error from CloudKit", v11, 2u);
    }
    double v5 = 120.0;
  }
  else
  {
    int64_t v6 = [v3 userInfo];
    uint64_t v7 = objc_msgSend(v6, "safari_numberForKey:", *MEMORY[0x1E4F19C58]);
    [v7 doubleValue];
    double v9 = v8;

    double v5 = 0.0;
    if (v9 > 0.0)
    {
      if (v9 <= 21600.0) {
        double v5 = v9;
      }
      else {
        double v5 = 21600.0;
      }
    }
  }

  return v5;
}

- (void)_backOffWithInterval:(double)a3
{
  [(WBSOneShotTimer *)self->_serverBackoffTimer invalidate];
  double v5 = [WBSOneShotTimer alloc];
  id v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
  uint64_t v6 = MEMORY[0x1E4F14428];
  id v7 = MEMORY[0x1E4F14428];
  double v8 = [(WBSOneShotTimer *)v5 initWithFireDate:v10 queue:v6 target:self selector:sel__serverBackoffTimerFired_];
  serverBackoffTimer = self->_serverBackoffTimer;
  self->_serverBackoffTimer = v8;
}

- (void)_serverBackoffTimerFired:(id)a3
{
  serverBackoffTimer = self->_serverBackoffTimer;
  self->_serverBackoffTimer = 0;

  if (self->_saveChangesWhenBackoffTimerFires) {
    [(WBSCloudHistory *)self saveChangesToCloudHistoryStore];
  }
  if (self->_fetchChangesWhenBackoffTimerFires) {
    [(WBSCloudHistory *)self fetchAndMergeChanges];
  }
  *(_WORD *)&self->_saveChangesWhenBackoffTimerFires = 0;
}

- (id)recordOfPastOperationsForThrottler:(id)a3
{
  id v4 = (WBSCloudKitThrottler *)a3;
  double v5 = v4;
  if (self->_saveChangesThrottler == v4)
  {
    uint64_t v7 = 32;
  }
  else if (self->_fetchChangesThrottler == v4)
  {
    uint64_t v7 = 40;
  }
  else
  {
    if (self->_syncCircleSizeRetrievalThrottler != v4)
    {
      id v6 = 0;
      goto LABEL_9;
    }
    uint64_t v7 = 48;
  }
  id v6 = *(id *)((char *)&self->super.isa + v7);
LABEL_9:

  return v6;
}

- (void)setRecordOfPastOperations:(id)a3 forThrottler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __58__WBSCloudHistory_setRecordOfPastOperations_forThrottler___block_invoke;
  void v13[3] = &unk_1E5C8D348;
  double v8 = (WBSCloudKitThrottler *)v7;
  long long v14 = v8;
  double v9 = (void *)MEMORY[0x1AD0C4F80](v13);
  id v10 = (void *)[v6 copy];

  if (self->_saveChangesThrottler == v8)
  {
    uint64_t v11 = WBSHistorySQLiteStorePushThrottlerDataKey;
    uint64_t v12 = 32;
    goto LABEL_7;
  }
  if (self->_fetchChangesThrottler == v8)
  {
    uint64_t v11 = WBSHistorySQLiteStoreFetchThrottlerDataKey;
    uint64_t v12 = 40;
    goto LABEL_7;
  }
  if (self->_syncCircleSizeRetrievalThrottler == v8)
  {
    uint64_t v11 = WBSHistorySQLiteStoreSyncCircleSizeRetrievalThrottlerDataKey;
    uint64_t v12 = 48;
LABEL_7:
    objc_storeStrong((id *)((char *)&self->super.isa + v12), v10);
    [(WBSHistoryServiceDatabaseProtocol *)self->_database setMetadataValue:v10 forKey:*v11 completionHandler:v9];
  }
}

void __58__WBSCloudHistory_setRecordOfPastOperations_forThrottler___block_invoke(uint64_t a1, void *a2)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = objc_msgSend(v3, "safari_privacyPreservingDescription");
      __58__WBSCloudHistory_setRecordOfPastOperations_forThrottler___block_invoke_cold_1(v5, v6, (uint64_t)v7);
    }
  }
}

- (id)_currentSaveChangesThrottlerPolicyString
{
  unint64_t numberOfDevicesInSyncCircle = self->_numberOfDevicesInSyncCircle;
  configuration = self->_configuration;
  if (numberOfDevicesInSyncCircle == 1) {
    [(WBSCloudHistoryConfiguration *)configuration singleDeviceSaveChangesThrottlingPolicyString];
  }
  else {
  id v4 = [(WBSCloudHistoryConfiguration *)configuration multipleDeviceSaveChangesThrottlingPolicyString];
  }
  return v4;
}

- (id)_currentFetchChangesThrottlerPolicyString
{
  unint64_t numberOfDevicesInSyncCircle = self->_numberOfDevicesInSyncCircle;
  configuration = self->_configuration;
  if (numberOfDevicesInSyncCircle == 1) {
    [(WBSCloudHistoryConfiguration *)configuration singleDeviceFetchChangesThrottlingPolicyString];
  }
  else {
  id v4 = [(WBSCloudHistoryConfiguration *)configuration multipleDeviceFetchChangesThrottlingPolicyString];
  }
  return v4;
}

- (id)_currentSyncCircleSizeRetrievalThrottlerPolicyString
{
  return [(WBSCloudHistoryConfiguration *)self->_configuration syncCircleSizeRetrievalThrottlingPolicyString];
}

- (void)setNumberOfDevicesInSyncCircle:(unint64_t)a3
{
  if ([(WBSCloudHistory *)self _cachedNumberOfDevicesInSyncCircle] != a3) {
    [(WBSCloudHistory *)self _setCachedNumberOfDevicesInSyncCircle:a3];
  }
  if (self->_numberOfDevicesInSyncCircle != a3)
  {
    self->_unint64_t numberOfDevicesInSyncCircle = a3;
    [(WBSCloudHistory *)self _updateThrottlerPolicies];
  }
}

- (void)_updateDeviceCountInResponseToPushNotification
{
  if (self->_numberOfDevicesInSyncCircle == 1)
  {
    [(WBSCloudHistory *)self setNumberOfDevicesInSyncCircle:2];
    id v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_INFO, "Moved to multi-device throttling policies in response to receiving a push notification.", v3, 2u);
    }
  }
}

- (void)_updateThrottlerPolicies
{
  id v3 = [(WBSCloudHistory *)self _currentSaveChangesThrottlerPolicyString];
  -[WBSCloudKitThrottler setPolicyString:](self->_saveChangesThrottler, "setPolicyString:");

  id v4 = [(WBSCloudHistory *)self _currentFetchChangesThrottlerPolicyString];
  -[WBSCloudKitThrottler setPolicyString:](self->_fetchChangesThrottler, "setPolicyString:");

  id v5 = [(WBSCloudHistory *)self _currentSyncCircleSizeRetrievalThrottlerPolicyString];
  -[WBSCloudKitThrottler setPolicyString:](self->_syncCircleSizeRetrievalThrottler, "setPolicyString:");
}

- (unint64_t)_cachedNumberOfDevicesInSyncCircle
{
  return self->_syncCircleSize;
}

- (void)_setCachedNumberOfDevicesInSyncCircle:(unint64_t)a3
{
  self->_syncCircleSize = a3;
  database = self->_database;
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryServiceDatabaseProtocol setMetadataValue:forKey:completionHandler:](database, "setMetadataValue:forKey:completionHandler:");
}

void __57__WBSCloudHistory__setCachedNumberOfDevicesInSyncCircle___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __57__WBSCloudHistory__setCachedNumberOfDevicesInSyncCircle___block_invoke_cold_1();
    }
  }
}

- (void)_resetCloudHistoryDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __63__WBSCloudHistory__resetCloudHistoryDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8D8B8;
  id v8 = v4;
  id v6 = v4;
  [(WBSHistoryServiceDatabaseProtocol *)database resetCloudHistoryDataWithCompletionHandler:v7];
}

void __63__WBSCloudHistory__resetCloudHistoryDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __63__WBSCloudHistory__resetCloudHistoryDataWithCompletionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetForAccountChange
{
}

- (void)_resetForAccountChangeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Resetting Cloud History due to account change.", buf, 2u);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __63__WBSCloudHistory__resetForAccountChangeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  void v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [(WBSCloudHistory *)self _resetCloudHistoryDataWithCompletionHandler:v7];
}

void __63__WBSCloudHistory__resetForAccountChangeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__WBSCloudHistory__resetForAccountChangeWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5C8C9F8;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __63__WBSCloudHistory__resetForAccountChangeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNumberOfDevicesInSyncCircle:0];
  [*(id *)(*(void *)(a1 + 32) + 128) reloadRecordOfPastOperations];
  [*(id *)(*(void *)(a1 + 32) + 136) reloadRecordOfPastOperations];
  [*(id *)(*(void *)(a1 + 32) + 144) reloadRecordOfPastOperations];
  [*(id *)(a1 + 32) _initializePushNotificationSupport];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)updateConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  cloudHistoryQueue = self->_cloudHistoryQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __57__WBSCloudHistory_updateConfiguration_completionHandler___block_invoke;
  v8[3] = &unk_1E5C8D980;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(cloudHistoryQueue, v8);
}

uint64_t __57__WBSCloudHistory_updateConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) applyRemoteConfiguration:*(void *)(a1 + 40)];
}

- (void)resetForAccountChangeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  cloudHistoryQueue = self->_cloudHistoryQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __62__WBSCloudHistory_resetForAccountChangeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(cloudHistoryQueue, v7);
}

void __62__WBSCloudHistory_resetForAccountChangeWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__WBSCloudHistory_resetForAccountChangeWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1E5C8D5F0;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _resetForAccountChangeWithCompletionHandler:v2];
}

uint64_t __62__WBSCloudHistory_resetForAccountChangeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchDateOfNextPermittedSaveChangesAttemptWithCompletionHandler:(id)a3
{
  id v4 = a3;
  cloudHistoryQueue = self->_cloudHistoryQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __83__WBSCloudHistory_fetchDateOfNextPermittedSaveChangesAttemptWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C660;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(cloudHistoryQueue, v7);
}

void __83__WBSCloudHistory_fetchDateOfNextPermittedSaveChangesAttemptWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) dateOfNextPermittedSaveChangesAttempt];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (BOOL)removedHistoryItemsArePendingSave
{
  return self->_removedHistoryItemsArePendingSave;
}

- (void)setRemovedHistoryItemsArePendingSave:(BOOL)a3
{
  self->_removedHistoryItemsArePendingSave = a3;
}

- (WBSHistoryServiceDatabaseStore)databaseStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseStore);
  return (WBSHistoryServiceDatabaseStore *)WeakRetained;
}

- (void)setDatabaseStore:(id)a3
{
}

- (unint64_t)numberOfDevicesInSyncCircle
{
  return self->_numberOfDevicesInSyncCircle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_databaseStore);
  objc_storeStrong((id *)&self->_namedProfileServerIdentifiersToLocalIdentifiersMap, 0);
  objc_storeStrong((id *)&self->_namedProfileLocalIdentifiersToServerIdentifiersMap, 0);
  objc_storeStrong((id *)&self->_storeDeterminationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_containerManateeObserver, 0);
  objc_storeStrong((id *)&self->_saveCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_fetchCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_syncCircleSizeRetrievalCompletionHandlersByOperation, 0);
  objc_storeStrong((id *)&self->_pushNotificationFetchTimer, 0);
  objc_storeStrong((id *)&self->_pushAgent, 0);
  objc_storeStrong((id *)&self->_serverBackoffTimer, 0);
  objc_storeStrong((id *)&self->_syncCircleSizeRetrievalThrottler, 0);
  objc_storeStrong((id *)&self->_fetchChangesThrottler, 0);
  objc_storeStrong((id *)&self->_saveChangesThrottler, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)&self->_replayLongLivedSaveOperationSuddenTerminationDisabler, 0);
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)&self->_fetchOperationSuddenTerminationDisabler, 0);
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)&self->_saveOperationSuddenTerminationDisabler, 0);
  objc_storeStrong((id *)&self->_longLivedSaveOperationData, 0);
  objc_storeStrong((id *)&self->_syncCircleSizeRetrievalThrottlerData, 0);
  objc_storeStrong((id *)&self->_fetchThrottlerData, 0);
  objc_storeStrong((id *)&self->_pushThrottlerData, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_waitUntilMetadataHasLoadedQueue, 0);
  objc_storeStrong((id *)&self->_cloudHistoryQueue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

void __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.808e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to migrate long lived operation: %{private}@", v5);
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_125_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 184);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Number of devices in iCloud History sync circle: %lul", (uint8_t *)&v3, 0xCu);
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_135_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_3(&dword_1A6B5F000, "iCloud History save completed with result %ld and error %{public}@.", v4, v5);
}

void __114__WBSCloudHistory__enumerateDatabasesWithProfileLocalIdentifiers_createIfNeeded_enumerationBlock_completionBlock___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to open database: %{public}@", v5);
}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to update database after successful sync: %{public}@", v5);
}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_148_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to convert tombstone to their secure format: %{public}@", v5);
}

void __59__WBSCloudHistory__getServerChangeTokenDataWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to fetch server change token: %{public}@", v5);
}

void __41__WBSCloudHistory__setServerChangeToken___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to update server change token: %{public}@", v5);
}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to read syncs with PCS cloud container status: %{public}@", v5);
}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_178_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to update syncs with PCS cloud container status: %{public}@", v5);
}

void __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "iCloud History failed to delete History zone %{public}@", v5);
}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_3(&dword_1A6B5F000, "iCloud History fetch failed with an error after %zu operations: %{public}@", v4, v5);
}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_190_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138478083;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Can't open database with local identifier %{private}@ (server identifier %@)", (uint8_t *)&v4, 0x16u);
}

void __77__WBSCloudHistory__pruneTombstonesThatCanNoLongerMatchVisitsFetchedFromCloud__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to prune tombsotnes: %{public}@", v5);
}

void __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Unable to find local profile identifier for server profile identifier: %{private}@", (uint8_t *)&v2, 0xCu);
}

void __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_201_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_1(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1A6B5F000, "Failed to open database with local identifier %@ after successful sync: %{public}@", v4, v5);
}

void __95__WBSCloudHistory__persistLongLivedSaveOperationDictionaryWithOperationID_databaseGenerations___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.808e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to save long lived save operation: %{private}@", v5);
}

void __67__WBSCloudHistory__removePersistedLongLivedSaveOperationDictionary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.808e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to remove long lived save operation: %{private}@", v5);
}

void __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to determine if push notifications are initialized: %{public}@", v5);
}

void __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to initialize push notifications for iCloud History: %{public}@", v5);
}

void __54__WBSCloudHistory__setPushNotificationAreInitialized___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to update push notifications initialize status: %{public}@", v5);
}

- (void)_determineNumberOfDevicesInSyncCircleForOperation:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Skipping query for number of devices in sync circle. Concurrent %{public}@ in progress", (uint8_t *)&v2, 0xCu);
}

void __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Error when determining number of devices in sync circle: %{public}@", v5);
}

void __81__WBSCloudHistory__updateProfileLocalIdentifiersToServerIdentifiersMapInDatabase__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.808e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to save profile identifier map: %{private}@", v5);
}

void __46__WBSCloudHistory__loadMetadataAsynchronously__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.808e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Profile identifier map could not be read from database: %{private}@", v5);
}

void __58__WBSCloudHistory_setRecordOfPastOperations_forThrottler___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_1(a1, (uint64_t)a2, a3, 5.8081e-34);
  OUTLINED_FUNCTION_3(&dword_1A6B5F000, "Failed to save past operations for throller %{private}@: %{public}@", v4, v5);
}

void __57__WBSCloudHistory__setCachedNumberOfDevicesInSyncCircle___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to update cached sync circle size: %{public}@", v5);
}

void __63__WBSCloudHistory__resetCloudHistoryDataWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to reset Cloud History Data: %{public}@", v5);
}

@end