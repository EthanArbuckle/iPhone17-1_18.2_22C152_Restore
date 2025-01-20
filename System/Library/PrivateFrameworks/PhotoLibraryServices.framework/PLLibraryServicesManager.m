@interface PLLibraryServicesManager
+ (Class)libraryServicesDelegateClass;
+ (id)errorForInvalidationError:(id)a3 userInfo:(id)a4;
+ (id)libraryServicesManagerForLibraryURL:(id)a3;
+ (int64_t)_finalState;
+ (int64_t)_initialState;
+ (void)setLibraryServicesDelegateClass:(Class)a3;
- ($5E5F304956FB491AF6F034FDF0808287)resourceCacheMetrics;
- (BOOL)_canTransitionToState:(int64_t)a3 error:(id *)a4;
- (BOOL)_enqueueOperation:(id)a3 error:(id *)a4;
- (BOOL)activate:(id *)a3;
- (BOOL)awaitLibraryState:(int64_t)a3 error:(id *)a4;
- (BOOL)disableiCPLForLibraryDeletionWithError:(id *)a3;
- (BOOL)enqueueOperation:(id)a3 error:(id *)a4;
- (BOOL)finalize:(id *)a3;
- (BOOL)isActive;
- (BOOL)isAppPhotoLibrary;
- (BOOL)isCPLSyncablePhotoLibrary;
- (BOOL)isCloudPhotoLibraryEnabled;
- (BOOL)isCreateMode;
- (BOOL)isFinalizing;
- (BOOL)isSearchIndexingEnabled;
- (BOOL)isSyndicationPhotoLibrary;
- (BOOL)isSystemPhotoLibrary;
- (BOOL)transitionToState:(int64_t)a3 error:(id *)a4;
- (BOOL)updateGreenTeaSavedContactsAuthorizationIfNeeded;
- (BOOL)updateSavedLocaleIfNeeded;
- (BOOL)willBecomeNonSyncablePhotoLibrary:(id *)a3;
- (CPLConfiguration)directServerConfiguration;
- (CPLFingerprintContext)fingerprintContext;
- (NSError)invalidationError;
- (NSMutableArray)mutablePendingOperations;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSProgress)postRunningProgress;
- (NSProgress)preRunningProgress;
- (NSString)description;
- (NSString)logPrefix;
- (NSString)mainScopeIdentifier;
- (NSString)upgradeClient;
- (NSURL)libraryURL;
- (OS_dispatch_queue)helperQueue;
- (OS_dispatch_queue)stateSerializationQueue;
- (PFClientSideEncryptionManager)clientSideEncryptionManager;
- (PLAnalysisCoordinator)analysisCoordinator;
- (PLAssetsdCrashRecoverySupport)crashRecoverySupport;
- (PLBackgroundJobService)backgroundJobService;
- (PLCPLSettings)cplSettings;
- (PLCacheDeleteRegistration)cacheDeleteRegistration;
- (PLCacheDeleteSupport)cacheDeleteSupport;
- (PLCameraPreviewWellManager)cameraPreviewWellManager;
- (PLChangeHandlingContainer)changeHandlingContainer;
- (PLCloudIdentifierReservationSupport)cloudIdentifierReservationSupport;
- (PLCloudPhotoLibraryManager)cloudPhotoLibraryManager;
- (PLComputeCacheManager)computeCacheManager;
- (PLDatabaseContext)databaseContext;
- (PLDeferredProcessingServiceHandler)deferredProcessingServicerHandler;
- (PLDuplicateProcessor)duplicateProcessor;
- (PLFeatureAvailabilityComputer)availabilityComputer;
- (PLImageWriter)imageWriter;
- (PLKeywordManager)keywordManager;
- (PLLibraryOpenerCreationOptions)openerCreationOptions;
- (PLLibraryServicesCPLReadiness)cplReadiness;
- (PLLibraryServicesDelegate)libraryServicesDelegate;
- (PLLibraryServicesManager)initWithLibraryBundle:(id)a3 backgroundJobService:(id)a4 cacheDeleteRegistration:(id)a5 delegateClass:(Class)a6;
- (PLLibraryServicesStateNode)currentStateNode;
- (PLMigrationServiceProtocol)migrationServiceProxy;
- (PLModelMigrator)modelMigrator;
- (PLMomentGenerationDataManager)momentGenerationDataManager;
- (PLPairing)pairingManager;
- (PLPhotoLibraryBundle)libraryBundle;
- (PLPhotoLibraryPathManager)pathManager;
- (PLQuickActionManager)quickActionManager;
- (PLReadyForAnalysis)readyForAnalysis;
- (PLRebuildJournalManager)rebuildJournalManager;
- (PLSearchDonationProgress)searchDonationProgress;
- (PLSearchIndexManager)searchIndexManager;
- (PLSearchIndexingEngine)searchIndexingEngine;
- (PLSyndicationDeleteEngine)syndicationDeleteManager;
- (PLTrackableRequestManager)trackableRequestManager;
- (id)_enqueueAwaitOperation;
- (id)_libraryServicesStateNodeWithState:(int64_t)a3;
- (id)_newContainer:(Class)a3 scope:(id)a4;
- (id)_provideContextForSearchDonationProgress;
- (id)activeOperations;
- (id)availabilityProgressDelegate;
- (id)availabilityTransitionDelegate;
- (id)journalManagerForName:(id)a3;
- (id)newAlbumCountCoalescer;
- (id)newClientSideEncryptionManager;
- (id)newCloudPhotoLibraryManager;
- (id)newComputeCacheManager;
- (id)newCrashRecoverySupport;
- (id)newDirectServerConfiguration;
- (id)newImportSessionCountCoalescer;
- (id)newMomentGenerationDataManager;
- (id)newRebuildJournalManager;
- (id)newSearchDonationProgress;
- (id)newSearchIndexManager;
- (id)newSearchIndexingEngine;
- (id)operationCountObservee;
- (id)pendingOperations;
- (id)stateCaptureDictionary;
- (id)statusDescription;
- (int64_t)_determineWellKnownPhotoLibraryIdentifier;
- (int64_t)_state;
- (int64_t)state;
- (int64_t)wellKnownPhotoLibraryIdentifier;
- (os_unfair_lock_s)contactsAuthorizationUpdateLock;
- (os_unfair_lock_s)fileSystemAssetImporterMutex;
- (os_unfair_lock_s)importMutex;
- (os_unfair_lock_s)localeUpdateLock;
- (unint64_t)createOptions;
- (void)_addPendingOperationsForStateNode:(id)a3;
- (void)_awaitLibraryState:(int64_t)a3 sync:(BOOL)a4 completionHandler:(id)a5;
- (void)_cancelPendingOperations;
- (void)_dispatchAwaitLibraryStateCompletionHandler:(id)a3 group:(id)a4 error:(id)a5;
- (void)_dispatchExternalWaitersForState:(int64_t)a3;
- (void)_enqueueExternalWaiterCompletionBlockForState:(int64_t)a3 completionBlock:(id)a4;
- (void)_handleCoalescerActionWithScope:(id)a3 class:(Class)a4 forIDs:(id)a5 context:(id)a6;
- (void)_handleLibraryStateCompletedAllOperations;
- (void)_increaseStateQueueQoSIfNeeded;
- (void)_initCameraPreviewWellManager;
- (void)_initSyndicationPhotoLibrarySpecificServices;
- (void)_initSystemPhotoLibrarySpecificServices;
- (void)_invalidate;
- (void)_invalidateAlbumCountCoalescer;
- (void)_invalidateAnalysisCoordinator;
- (void)_invalidateAvailabilityComputer;
- (void)_invalidateAvailabilityProgressDelegate;
- (void)_invalidateAvailabilityTransitionDelegate;
- (void)_invalidateBackgroundJobService;
- (void)_invalidateCPLReadiness;
- (void)_invalidateCPLSettings;
- (void)_invalidateCacheDeleteSupport;
- (void)_invalidateCameraPreviewWellManager;
- (void)_invalidateClientSideEncryptionManager;
- (void)_invalidateCloudIdentifierReservationSupport;
- (void)_invalidateCloudPhotoLibraryManager;
- (void)_invalidateComputeCacheManager;
- (void)_invalidateCrashRecoverySupport;
- (void)_invalidateDatabaseContext;
- (void)_invalidateDirectServerConfiguration;
- (void)_invalidateDuplicateProcessor;
- (void)_invalidateImageWriter;
- (void)_invalidateImportSessionCountCoalescer;
- (void)_invalidateKeywordManager;
- (void)_invalidateMainScopeIdentifier;
- (void)_invalidateModelMigrator;
- (void)_invalidateMomentGenerationDataManager;
- (void)_invalidateOutstandingTransactionHandlerTimer;
- (void)_invalidatePairingManager;
- (void)_invalidateQuickActionManager;
- (void)_invalidateReadyForAnalysis;
- (void)_invalidateRebuildJournalManager;
- (void)_invalidateSearchDonationProgress;
- (void)_invalidateSearchIndexManager;
- (void)_invalidateSearchIndexingEngine;
- (void)_invalidateSyndicationDeleteManager;
- (void)_invalidateSyndicationPhotoLibrarySpecificServices;
- (void)_invalidateSystemPhotoLibrarySpecificServices;
- (void)_resetStateQueueQoS;
- (void)_setCameraRollCountedInQuota:(BOOL)a3;
- (void)_setCurrentStateNode:(id)a3;
- (void)_startObservingLibraryStateCompletedAllOperations;
- (void)_stopObservingLibraryStateCompletedAllOperations;
- (void)_transitionToState:(int64_t)a3;
- (void)_waitForAwaitOperation:(id)a3;
- (void)awaitLibraryState:(int64_t)a3 completionHandler:(id)a4;
- (void)currentLocaleDidChangeNotification:(id)a3;
- (void)deactivateWithInvalidationError:(id)a3;
- (void)dealloc;
- (void)didBecomeNonSyncablePhotoLibrary;
- (void)didRemainSyncablePhotoLibrary;
- (void)initializeChangeHandling;
- (void)initializeConstraintsDirector;
- (void)invalidateReverseLocationDataOnAllAssets;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performBlockWithImportMutex:(id)a3;
- (void)performFileSystemAssetImporterWorkWithLibrary:(id)a3 block:(id)a4;
- (void)performTransactionForSyndicationDeleteManager:(id)a3 name:(const char *)a4 transaction:(id)a5;
- (void)refreshAlbumCountForAlbumIDs:(id)a3;
- (void)refreshImportSessionCountForImportSessionIDs:(id)a3;
- (void)registerOutstandingTransactionsHandler:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setContactsAuthorizationUpdateLock:(os_unfair_lock_s)a3;
- (void)setCreateMode:(BOOL)a3 options:(id)a4;
- (void)setFileSystemAssetImporterMutex:(os_unfair_lock_s)a3;
- (void)setFinalizing:(BOOL)a3;
- (void)setICloudPhotosEnabledInternal:(BOOL)a3;
- (void)setImportMutex:(os_unfair_lock_s)a3;
- (void)setLibraryServicesDelegate:(id)a3;
- (void)setLocaleUpdateLock:(os_unfair_lock_s)a3;
- (void)setMigrationServiceProxy:(id)a3;
- (void)setOpenerCreationOptions:(id)a3;
- (void)setOperationCountObservee:(id)a3;
- (void)setPostRunningProgress:(id)a3;
- (void)setPreRunningProgress:(id)a3;
- (void)setResourceCacheMetrics:(id)a3;
- (void)setUpgradeClient:(id)a3;
- (void)shutdownLibraryWithDescription:(id)a3;
@end

@implementation PLLibraryServicesManager

+ (Class)libraryServicesDelegateClass
{
  return (Class)(id)_libraryServicesDelegateClass;
}

- (int64_t)state
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__PLLibraryServicesManager_state__block_invoke;
  v6[3] = &unk_1E5875E68;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

+ (id)libraryServicesManagerForLibraryURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PLLibraryServicesManager.m", 217, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  v6 = +[PLPhotoLibraryBundleController sharedBundleController];
  uint64_t v7 = [v6 lookupOrCreateBundleForLibraryURL:v5];

  v8 = [v7 libraryServicesManager];

  return v8;
}

- (int64_t)wellKnownPhotoLibraryIdentifier
{
  return self->_wellKnownPhotoLibraryIdentifier;
}

- (BOOL)awaitLibraryState:(int64_t)a3 error:(id *)a4
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__46487;
  v12 = __Block_byref_object_dispose__46488;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PLLibraryServicesManager_awaitLibraryState_error___block_invoke;
  v7[3] = &unk_1E5874ED8;
  v7[4] = &v14;
  v7[5] = &v8;
  [(PLLibraryServicesManager *)self _awaitLibraryState:a3 sync:1 completionHandler:v7];
  if (a4) {
    *a4 = (id) v9[5];
  }
  char v5 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

uint64_t __33__PLLibraryServicesManager_state__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _state];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __37__PLLibraryServicesManager_activate___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2[58])
  {
    if ([v2 _state] == 99)
    {
      v3 = PLLibraryServicesGetLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int64_t v4 = [*(id *)(a1 + 32) logPrefix];
        char v5 = PLStringFromLibraryServicesState();
        v6 = [*(id *)(a1 + 32) invalidationError];
        *(_DWORD *)buf = 138543874;
        char v17 = v4;
        __int16 v18 = 2112;
        v19 = v5;
        __int16 v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Cannot activate state machine in error state (%@: %@)", buf, 0x20u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      if (*(void *)(a1 + 48))
      {
        uint64_t v14 = @"currentState";
        uint64_t v7 = PLStringFromLibraryServicesState();
        v15 = v7;
        uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];

        uint64_t v9 = objc_opt_class();
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "invalidationError", v14);
        **(void **)(a1 + 48) = [v9 errorForInvalidationError:v10 userInfo:v8];
      }
    }
  }
  else
  {
    v11 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [*(id *)(a1 + 32) logPrefix];
      qos_class_self();
      id v13 = PLStringFromQoSClass();
      *(_DWORD *)buf = 138543618;
      char v17 = v12;
      __int16 v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Activating state machine at current QoS: %{public}@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) setActive:1];
    objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", objc_msgSend((id)objc_opt_class(), "_initialState"));
  }
}

void __70__PLLibraryServicesManager__awaitLibraryState_sync_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _state];
  if ((PLIsValidStateForMinimumStateRequirement() & 1) != 0
    || [*(id *)(a1 + 32) isFinalizing]
    && (uint64_t v2 = [*(id *)(a1 + 32) _state], v2 == objc_msgSend((id)objc_opt_class(), "_finalState")))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    char v5 = *(void **)(a1 + 32);
    [v5 _dispatchAwaitLibraryStateCompletionHandler:v3 group:v4 error:0];
  }
  else
  {
    [*(id *)(a1 + 32) _state];
    if (!PLHasPathFromSourceStateToTargetState()
      || ([*(id *)(a1 + 32) _enqueueExternalWaiterCompletionBlockForState:*(void *)(a1 + 72) completionBlock:*(void *)(a1 + 56)], objc_msgSend(*(id *)(a1 + 32), "_enqueueAwaitOperation"), v6 = objc_claimAutoreleasedReturnValue(), uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8), v8 = *(void **)(v7 + 40), *(void *)(v7 + 40) = v6, v8, !*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)))
    {
      uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      v9();
    }
  }
}

- (void)_awaitLibraryState:(int64_t)a3 sync:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (a3 < 1) {
    goto LABEL_4;
  }
  id v38 = 0;
  BOOL v9 = [(PLLibraryServicesManager *)self activate:&v38];
  uint64_t v10 = v38;
  v11 = v10;
  if (v9)
  {

LABEL_4:
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__PLLibraryServicesManager__awaitLibraryState_sync_completionHandler___block_invoke;
    block[3] = &unk_1E5873510;
    id v13 = v8;
    id v36 = v13;
    int64_t v37 = a3;
    block[4] = self;
    uint64_t v14 = v12;
    v35 = v14;
    dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__46487;
    v32 = __Block_byref_object_dispose__46488;
    id v33 = 0;
    uint64_t v16 = [(PLLibraryServicesManager *)self stateSerializationQueue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __70__PLLibraryServicesManager__awaitLibraryState_sync_completionHandler___block_invoke_2;
    v22[3] = &unk_1E58724D0;
    v22[4] = self;
    int64_t v27 = a3;
    id v24 = v13;
    v11 = v14;
    v23 = v11;
    id v17 = v15;
    id v25 = v17;
    v26 = &v28;
    dispatch_sync(v16, v22);

    if (v5)
    {
      [(PLLibraryServicesManager *)self _waitForAwaitOperation:v29[5]];
      __int16 v18 = PLLibraryServicesGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [(PLLibraryServicesManager *)self logPrefix];
        PLStringFromLibraryServicesState();
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        qos_class_self();
        v21 = PLStringFromQoSClass();
        *(_DWORD *)buf = 138543874;
        v40 = v19;
        __int16 v41 = 2114;
        id v42 = v20;
        __int16 v43 = 2114;
        v44 = v21;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Waiting on dispatch_group for library state %{public}@ at QoS: %{public}@", buf, 0x20u);
      }
      dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    }

    _Block_object_dispose(&v28, 8);
    goto LABEL_11;
  }
  if (v8) {
    (*((void (**)(id, void, NSObject *))v8 + 2))(v8, 0, v10);
  }
LABEL_11:
}

- (int64_t)_state
{
  uint64_t v3 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(PLLibraryServicesManager *)self currentStateNode];
  int64_t v5 = [v4 state];

  return v5;
}

- (OS_dispatch_queue)stateSerializationQueue
{
  return self->_stateSerializationQueue;
}

- (PLLibraryServicesStateNode)currentStateNode
{
  return self->_currentStateNode;
}

- (NSString)logPrefix
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (BOOL)activate:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t v5 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [(PLLibraryServicesManager *)self logPrefix];
    qos_class_self();
    uint64_t v7 = PLStringFromQoSClass();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Received activate state machine at current QoS: %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v13 = 1;
  id v8 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PLLibraryServicesManager_activate___block_invoke;
  block[3] = &unk_1E5873ED8;
  block[4] = self;
  void block[5] = buf;
  block[6] = a3;
  dispatch_sync(v8, block);

  char v9 = *(unsigned char *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v9;
}

- (void)_waitForAwaitOperation:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int64_t v5 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(PLLibraryServicesManager *)self logPrefix];
      qos_class_self();
      uint64_t v7 = PLStringFromQoSClass();
      int v8 = 138543874;
      char v9 = v6;
      __int16 v10 = 2114;
      id v11 = v4;
      __int16 v12 = 2114;
      char v13 = v7;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Waiting for await operation to finish: %{public}@ at QoS: %{public}@", (uint8_t *)&v8, 0x20u);
    }
    [v4 waitUntilFinished];
  }
}

void __84__PLLibraryServicesManager__dispatchAwaitLibraryStateCompletionHandler_group_error___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

void __52__PLLibraryServicesManager_awaitLibraryState_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (PLChangeHandlingContainer)changeHandlingContainer
{
  uint64_t v2 = [(PLLibraryServicesManager *)self libraryBundle];
  uint64_t v3 = [v2 changeHandlingContainer];

  return (PLChangeHandlingContainer *)v3;
}

- (PLPhotoLibraryBundle)libraryBundle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  return (PLPhotoLibraryBundle *)WeakRetained;
}

- (PLSearchIndexManager)searchIndexManager
{
  return (PLSearchIndexManager *)[(PLLazyObject *)self->_lazySearchIndexManager objectValue];
}

- (PLDeferredProcessingServiceHandler)deferredProcessingServicerHandler
{
  return (PLDeferredProcessingServiceHandler *)[(PLLazyObject *)self->_lazyDeferredProcessingServiceHandler objectValue];
}

- (PLCPLSettings)cplSettings
{
  return (PLCPLSettings *)[(PLLazyObject *)self->_lazyCPLSettings objectValue];
}

- (void)_dispatchAwaitLibraryStateCompletionHandler:(id)a3 group:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  char v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __int16 v12 = [(PLLibraryServicesManager *)self logPrefix];
      qos_class_self();
      char v13 = PLStringFromQoSClass();
      *(_DWORD *)buf = 138543618;
      v21 = v12;
      __int16 v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: Dispatching await completion handler at current QoS: %{public}@", buf, 0x16u);
    }
    qos_class_t v14 = qos_class_self();
    dispatch_block_t v15 = dispatch_get_global_queue(v14, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__PLLibraryServicesManager__dispatchAwaitLibraryStateCompletionHandler_group_error___block_invoke;
    block[3] = &unk_1E5874868;
    id v17 = v10;
    id v19 = v8;
    __int16 v18 = v9;
    dispatch_group_async(v18, v15, block);
  }
  else
  {
    dispatch_group_leave(v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helperQueue, 0);
  objc_storeStrong((id *)&self->_stateSerializationQueue, 0);
  objc_storeStrong((id *)&self->_mutablePendingOperations, 0);
  objc_storeStrong(&self->_operationCountObservee, 0);
  objc_storeStrong((id *)&self->_currentStateNode, 0);
  objc_destroyWeak((id *)&self->_migrationServiceProxy);
  objc_storeStrong((id *)&self->_upgradeClient, 0);
  objc_storeStrong((id *)&self->_openerCreationOptions, 0);
  objc_storeStrong((id *)&self->_postRunningProgress, 0);
  objc_storeStrong((id *)&self->_preRunningProgress, 0);
  objc_storeStrong((id *)&self->_cacheDeleteRegistration, 0);
  objc_storeStrong((id *)&self->_trackableRequestManager, 0);
  objc_storeStrong((id *)&self->_backgroundJobService, 0);
  objc_storeStrong((id *)&self->_invalidationError, 0);
  objc_storeStrong((id *)&self->_libraryServicesDelegate, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_externalWaiterCompletionBlocksByState, 0);
  objc_storeStrong((id *)&self->_albumCountQueue, 0);
  objc_storeStrong((id *)&self->_outstandingTransactionHandlerTimer, 0);
  objc_storeStrong((id *)&self->_serverTransaction, 0);
  objc_storeStrong((id *)&self->_lazyFingerprintContext, 0);
  objc_storeStrong((id *)&self->_lazyCloudIdentifierReservationSupport, 0);
  objc_storeStrong((id *)&self->_lazyAvailabilityComputer, 0);
  objc_storeStrong((id *)&self->_lazyAvailabilityTransitionDelegate, 0);
  objc_storeStrong((id *)&self->_lazyAvailabilityProgressDelegate, 0);
  objc_storeStrong((id *)&self->_lazyReadyForAnalysis, 0);
  objc_storeStrong((id *)&self->_lazyAnalysisCoordinator, 0);
  objc_storeStrong((id *)&self->_lazyMainScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_lazyCPLSettings, 0);
  objc_storeStrong((id *)&self->_lazyDirectServerConfiguration, 0);
  objc_storeStrong((id *)&self->_lazyDeferredProcessingServiceHandler, 0);
  objc_storeStrong((id *)&self->_lazyCacheDeleteSupport, 0);
  objc_storeStrong((id *)&self->_lazySyndicationDeleteManager, 0);
  objc_storeStrong((id *)&self->_lazyCameraPreviewWellManager, 0);
  objc_storeStrong((id *)&self->_lazyClientSideEncryptionManager, 0);
  objc_storeStrong((id *)&self->_lazyCPLReadiness, 0);
  objc_storeStrong((id *)&self->_lazyPairingManager, 0);
  objc_storeStrong((id *)&self->_lazyCrashRecoverySupport, 0);
  objc_storeStrong((id *)&self->_lazyCloudPhotoLibraryManager, 0);
  objc_storeStrong((id *)&self->_lazyImportSessionCountCoalescer, 0);
  objc_storeStrong((id *)&self->_lazyAlbumCountCoalescer, 0);
  objc_storeStrong((id *)&self->_lazyKeywordManager, 0);
  objc_storeStrong((id *)&self->_lazyQuickActionManager, 0);
  objc_storeStrong((id *)&self->_lazyComputeCacheManager, 0);
  objc_storeStrong((id *)&self->_lazyRebuildJournalManager, 0);
  objc_storeStrong((id *)&self->_lazyMomentGenerationDataManager, 0);
  objc_storeStrong((id *)&self->_lazyDuplicateProcessor, 0);
  objc_storeStrong((id *)&self->_lazyDatabaseContext, 0);
  objc_storeStrong((id *)&self->_lazySearchDonationProgress, 0);
  objc_storeStrong((id *)&self->_lazySearchIndexingEngine, 0);
  objc_storeStrong((id *)&self->_lazySearchIndexManager, 0);
  objc_storeStrong((id *)&self->_lazyModelMigrator, 0);
  objc_storeStrong((id *)&self->_lazyImageWriter, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_destroyWeak((id *)&self->_libraryBundle);
}

- (void)setContactsAuthorizationUpdateLock:(os_unfair_lock_s)a3
{
  self->_contactsAuthorizationUpdateLock = a3;
}

- (os_unfair_lock_s)contactsAuthorizationUpdateLock
{
  return self->_contactsAuthorizationUpdateLock;
}

- (void)setLocaleUpdateLock:(os_unfair_lock_s)a3
{
  self->_localeUpdateLock = a3;
}

- (os_unfair_lock_s)localeUpdateLock
{
  return self->_localeUpdateLock;
}

- (void)setFileSystemAssetImporterMutex:(os_unfair_lock_s)a3
{
  self->_fileSystemAssetImporterMutex = a3;
}

- (os_unfair_lock_s)fileSystemAssetImporterMutex
{
  return self->_fileSystemAssetImporterMutex;
}

- (void)setImportMutex:(os_unfair_lock_s)a3
{
  self->_importMutex = a3;
}

- (os_unfair_lock_s)importMutex
{
  return self->_importMutex;
}

- (void)setFinalizing:(BOOL)a3
{
  self->_finalizing = a3;
}

- (BOOL)isFinalizing
{
  return self->_finalizing;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (OS_dispatch_queue)helperQueue
{
  return self->_helperQueue;
}

- (NSMutableArray)mutablePendingOperations
{
  return self->_mutablePendingOperations;
}

- (void)setOperationCountObservee:(id)a3
{
}

- (id)operationCountObservee
{
  return self->_operationCountObservee;
}

- (void)setResourceCacheMetrics:(id)a3
{
  $5E5F304956FB491AF6F034FDF0808287 v3 = a3;
  objc_copyStruct(&self->_resourceCacheMetrics, &v3, 16, 1, 0);
}

- ($5E5F304956FB491AF6F034FDF0808287)resourceCacheMetrics
{
  objc_copyStruct(v4, &self->_resourceCacheMetrics, 16, 1, 0);
  uint64_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.var2 = v3;
  result.var3 = HIDWORD(v3);
  result.var0 = v2;
  result.var1 = HIDWORD(v2);
  return result;
}

- (void)setMigrationServiceProxy:(id)a3
{
}

- (PLMigrationServiceProtocol)migrationServiceProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_migrationServiceProxy);
  return (PLMigrationServiceProtocol *)WeakRetained;
}

- (void)setUpgradeClient:(id)a3
{
}

- (NSString)upgradeClient
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (void)setOpenerCreationOptions:(id)a3
{
}

- (PLLibraryOpenerCreationOptions)openerCreationOptions
{
  return self->_openerCreationOptions;
}

- (void)setPostRunningProgress:(id)a3
{
}

- (NSProgress)postRunningProgress
{
  return self->_postRunningProgress;
}

- (void)setPreRunningProgress:(id)a3
{
}

- (NSProgress)preRunningProgress
{
  return self->_preRunningProgress;
}

- (PLCacheDeleteRegistration)cacheDeleteRegistration
{
  return (PLCacheDeleteRegistration *)objc_getProperty(self, a2, 416, 1);
}

- (PLTrackableRequestManager)trackableRequestManager
{
  return (PLTrackableRequestManager *)objc_getProperty(self, a2, 408, 1);
}

- (PLBackgroundJobService)backgroundJobService
{
  return (PLBackgroundJobService *)objc_getProperty(self, a2, 400, 1);
}

- (PLPhotoLibraryPathManager)pathManager
{
  return (PLPhotoLibraryPathManager *)objc_getProperty(self, a2, 24, 1);
}

- (NSError)invalidationError
{
  return self->_invalidationError;
}

- (void)setLibraryServicesDelegate:(id)a3
{
}

- (PLLibraryServicesDelegate)libraryServicesDelegate
{
  return (PLLibraryServicesDelegate *)objc_getProperty(self, a2, 384, 1);
}

- (id)stateCaptureDictionary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PLLibraryServicesManager *)self logPrefix];
    int64_t v5 = (void *)MEMORY[0x1E4F8B8F0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
    uint64_t v7 = [WeakRetained libraryURL];
    id v8 = [v5 descriptionWithFileURL:v7];
    int v21 = 138412546;
    __int16 v22 = v4;
    __int16 v23 = 2112;
    uint64_t v24 = v8;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "STATEDUMP: %@: State information for library services manager at path %@", (uint8_t *)&v21, 0x16u);
  }
  char v9 = [(PLLibraryServicesManager *)self currentStateNode];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(PLLibraryServicesManager *)self state];
  id v11 = PLStringFromLibraryServicesState();
  [v10 setObject:v11 forKeyedSubscript:@"state"];

  __int16 v12 = [v9 description];
  [v10 setObject:v12 forKeyedSubscript:@"currentStateNode"];

  char v13 = [(PLLibraryServicesManager *)self activeOperations];
  qos_class_t v14 = objc_msgSend(v13, "_pl_prettyDescription");
  [v10 setObject:v14 forKeyedSubscript:@"activeOperations"];

  dispatch_block_t v15 = [(PLLibraryServicesManager *)self pendingOperations];
  uint64_t v16 = objc_msgSend(v15, "_pl_prettyDescription");
  [v10 setObject:v16 forKeyedSubscript:@"pendingOperations"];

  id v17 = PLStringFromQoSClass();
  [v10 setObject:v17 forKeyedSubscript:@"maxWaiterQoS"];

  [(PLLibraryServicesManager *)self wellKnownPhotoLibraryIdentifier];
  __int16 v18 = PLStringFromWellKnownPhotoLibraryIdentifier();
  [v10 setObject:v18 forKeyedSubscript:@"wellKnownPhotoLibraryIdentifier"];

  id v19 = [(PLBackgroundJobService *)self->_backgroundJobService description];
  [v10 setObject:v19 forKeyedSubscript:@"backgroundJobService"];

  return v10;
}

- (BOOL)disableiCPLForLibraryDeletionWithError:(id *)a3
{
  if ([(PLLibraryServicesManager *)self isCPLSyncablePhotoLibrary])
  {
    int64_t v5 = [[PLPhotoLibraryOpener alloc] initWithLibraryServicesManager:self reportInProgressUpgrades:0];
    BOOL v6 = [(PLPhotoLibraryOpener *)v5 openPhotoLibraryDatabaseWithAutoUpgrade:1 autoCreate:0 error:a3];
    if (v6)
    {
      uint64_t v7 = [(PLLibraryServicesManager *)self cloudPhotoLibraryManager];
      id v8 = v7;
      if (v7)
      {
        [v7 disableiCPLSyncForLibraryDeletion];
      }
      else
      {
        char v9 = PLBackendGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v11 = 0;
          _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "disableiCPLForLibraryDeletionWithError: CPL manager unexpectedly nil, unable to disable iCPL", v11, 2u);
        }
      }
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)didRemainSyncablePhotoLibrary
{
  [(PLLazyObject *)self->_lazyCloudPhotoLibraryManager resetObjectWithHandler:&__block_literal_global_259_46386];
  id v3 = [(PLLibraryServicesManager *)self cloudPhotoLibraryManager];
}

uint64_t __57__PLLibraryServicesManager_didRemainSyncablePhotoLibrary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)didBecomeNonSyncablePhotoLibrary
{
  BOOL v3 = [(PLLibraryServicesManager *)self isSystemPhotoLibrary];
  self->_wellKnownPhotoLibraryIdentifier = [(PLLibraryServicesManager *)self _determineWellKnownPhotoLibraryIdentifier];
  [(PLLazyObject *)self->_lazyMainScopeIdentifier resetObject];
  [(PLLazyObject *)self->_lazyCloudPhotoLibraryManager resetObjectWithHandler:&__block_literal_global_257];
  id v4 = [(PLLibraryServicesManager *)self readyForAnalysis];
  [v4 resetReadyForAnalysisState];

  if (v3) {
    [(PLLibraryServicesManager *)self _invalidateSystemPhotoLibrarySpecificServices];
  }
  id v6 = [(PLLibraryServicesManager *)self backgroundJobService];
  int64_t v5 = [(PLLibraryServicesManager *)self libraryBundle];
  [v6 signalBackgroundProcessingNeededOnBundle:v5];
}

uint64_t __60__PLLibraryServicesManager_didBecomeNonSyncablePhotoLibrary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (BOOL)willBecomeNonSyncablePhotoLibrary:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(PLLibraryServicesManager *)self awaitLibraryState:6 error:a3];
  if (v4)
  {
    int64_t v5 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(PLLibraryServicesManager *)self logPrefix];
      uint64_t v7 = (void *)MEMORY[0x1E4F8B8F0];
      id v8 = [(PLLibraryServicesManager *)self libraryURL];
      char v9 = [v7 descriptionWithFileURL:v8];
      BOOL v10 = [(PLLibraryServicesManager *)self isSystemPhotoLibrary];
      id v11 = @"no";
      *(_DWORD *)buf = 138543874;
      v31 = v6;
      __int16 v32 = 2112;
      if (v10) {
        id v11 = @"yes";
      }
      id v33 = v9;
      __int16 v34 = 2112;
      v35 = v11;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Library will become non-syncable: %@ isSPL: %@", buf, 0x20u);
    }
    __int16 v12 = [(PLLibraryServicesManager *)self cloudPhotoLibraryManager];
    [v12 disableiCPLSyncWillBecomeNonSyncablePhotoLibrary];

    if ([(PLLibraryServicesManager *)self isSystemPhotoLibrary])
    {
      char v13 = dispatch_group_create();
      qos_class_t v14 = +[PLAccountStore pl_sharedAccountStore];
      dispatch_block_t v15 = [v14 cachedPrimaryAppleAccount];

      uint64_t v16 = *MEMORY[0x1E4F17A88];
      if ([v15 isEnabledForDataclass:*MEMORY[0x1E4F17A88]])
      {
        [v15 setEnabled:0 forDataclass:v16];
        uint64_t v17 = *MEMORY[0x1E4F17B18];
        if (([v15 isEnabledForDataclass:*MEMORY[0x1E4F17B18]] & 1) == 0)
        {
LABEL_14:
          __int16 v23 = PLLibraryServicesGetLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = [(PLLibraryServicesManager *)self logPrefix];
            *(_DWORD *)buf = 138543618;
            v31 = v24;
            __int16 v32 = 2112;
            id v33 = v15;
            _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: SPL Change: Updating account %@", buf, 0x16u);
          }
          uint64_t v25 = +[PLAccountStore pl_sharedAccountStore];
          dispatch_group_enter(v13);
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __62__PLLibraryServicesManager_willBecomeNonSyncablePhotoLibrary___block_invoke;
          v27[3] = &unk_1E586A6B8;
          v27[4] = self;
          id v28 = v15;
          v29 = v13;
          [v25 saveAccount:v28 withDataclassActions:0 doVerify:0 completion:v27];

          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v17 = *MEMORY[0x1E4F17B18];
        if (![v15 isEnabledForDataclass:*MEMORY[0x1E4F17B18]])
        {
LABEL_17:
          dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

          return v4;
        }
      }
      [v15 setEnabled:0 forDataclass:v17];
      __int16 v18 = PLLibraryServicesGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = [(PLLibraryServicesManager *)self logPrefix];
        id v20 = (void *)MEMORY[0x1E4F8B8F0];
        int v21 = [(PLLibraryServicesManager *)self libraryURL];
        __int16 v22 = [v20 descriptionWithFileURL:v21];
        *(_DWORD *)buf = 138543618;
        v31 = v19;
        __int16 v32 = 2112;
        id v33 = v22;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: SPL Change: Disabling Shared Albums of previous SPL at %@", buf, 0x16u);
      }
      +[PLCloudSharingEnablingJob disableCloudSharingWithLibraryServicesManager:self];
      goto LABEL_14;
    }
  }
  return v4;
}

void __62__PLLibraryServicesManager_willBecomeNonSyncablePhotoLibrary___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLLibraryServicesGetLog();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) logPrefix];
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138543618;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      BOOL v10 = "%{public}@: SPL Change: Successfully updated account %@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 22;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v8 = [*(id *)(a1 + 32) logPrefix];
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138543874;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    id v20 = v5;
    BOOL v10 = "%{public}@: SPL Change: Failed to update account %@: %@";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 32;
    goto LABEL_6;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)setICloudPhotosEnabledInternal:(BOOL)a3
{
  BOOL v3 = a3;
  *(void *)&v29[5] = *MEMORY[0x1E4F143B8];
  if ((PLIsAssetsd() & 1) == 0)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"PLLibraryServicesManager.m" lineNumber:1709 description:@"Only Assetsd should be calling setICloudPhotosEnabledInternal"];
  }
  id v6 = [(PLLibraryServicesManager *)self libraryBundle];
  uint64_t v7 = [v6 indicatorFileCoordinator];

  id v8 = PLLibraryServicesGetLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v9)
    {
      BOOL v10 = [(PLLibraryServicesManager *)self logPrefix];
      *(_DWORD *)buf = 138543362;
      *(void *)v29 = v10;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: enabling iCloud Photos", buf, 0xCu);
    }
    [v7 writeEnableICloudPhotosMarker];
    if ([(PLLibraryServicesManager *)self isSystemPhotoLibrary])
    {
      id v11 = [(PLLibraryServicesManager *)self modelMigrator];
      char v12 = [v11 isPostProcessingLightweightMigration];

      if ((v12 & 1) == 0)
      {
        uint32_t v13 = PLLibraryServicesGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [(PLLibraryServicesManager *)self logPrefix];
          *(_DWORD *)buf = 138543362;
          *(void *)v29 = v14;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: deleting all iTunes synced content", buf, 0xCu);
        }
        int v15 = [(PLLibraryServicesManager *)self databaseContext];
        [v15 performSync:&__block_literal_global_241 withName:"-[PLLibraryServicesManager setICloudPhotosEnabledInternal:]"];
      }
      uint64_t v16 = PLLibraryServicesGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = [(PLLibraryServicesManager *)self logPrefix];
        *(_DWORD *)buf = 138543362;
        *(void *)v29 = v17;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: deleting all My Photo Stream assets", buf, 0xCu);
      }
      uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
      [v18 setObject:*MEMORY[0x1E4F8C9A8] forKey:*MEMORY[0x1E4F8C970]];
      __int16 v19 = [(PLLibraryServicesManager *)self imageWriter];
      [v19 enqueueJob:v18];

      [(PLLibraryServicesManager *)self _setCameraRollCountedInQuota:1];
    }
  }
  else
  {
    if (v9)
    {
      id v20 = [(PLLibraryServicesManager *)self logPrefix];
      *(_DWORD *)buf = 138543362;
      *(void *)v29 = v20;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: disabling iCloud Photos", buf, 0xCu);
    }
    [v7 writeDisableICloudPhotosMarker];
    if ([(PLLibraryServicesManager *)self isSystemPhotoLibrary]) {
      [(PLLibraryServicesManager *)self _setCameraRollCountedInQuota:0];
    }
  }
  uint64_t v21 = [(PLLibraryServicesManager *)self readyForAnalysis];
  [v21 resetReadyForAnalysisState];

  __int16 v22 = [(PLLibraryServicesManager *)self cplSettings];
  id v27 = 0;
  char v23 = [v22 setICPLEnabled:v3 error:&v27];
  id v24 = v27;

  if ((v23 & 1) == 0)
  {
    uint64_t v25 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v29[0] = v3;
      LOWORD(v29[1]) = 2112;
      *(void *)((char *)&v29[1] + 2) = v24;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Failed to write CPL enabled setting to %d, %@", buf, 0x12u);
    }
  }
  if ([v7 isICloudPhotosPaused])
  {
    CFPreferencesSetAppValue(@"cloudPhotosPaused", 0, @"com.apple.mobileslideshow");
    [v7 clearPauseMarkerForReason:3];
  }
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
}

uint64_t __59__PLLibraryServicesManager_setICloudPhotosEnabledInternal___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deleteITunesSyncedContentForEnablingiCPL];
}

- (void)_setCameraRollCountedInQuota:(BOOL)a3
{
  BOOL v3 = a3;
  pl_dispatch_once();
  if (v3) {
    [(id)_setCameraRollCountedInQuota___BackupManager countCameraRollQuota];
  }
  else {
    [(id)_setCameraRollCountedInQuota___BackupManager discountCameraRollQuota];
  }
}

uint64_t __57__PLLibraryServicesManager__setCameraRollCountedInQuota___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCameraRollCountedInQuota:*(unsigned __int8 *)(a1 + 40)];
}

void __57__PLLibraryServicesManager__setCameraRollCountedInQuota___block_invoke()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getMBManagerClass_softClass;
  uint64_t v8 = getMBManagerClass_softClass;
  if (!getMBManagerClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    void v4[2] = __getMBManagerClass_block_invoke;
    v4[3] = &unk_1E5875840;
    v4[4] = &v5;
    __getMBManagerClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = v0;
  _Block_object_dispose(&v5, 8);
  id v2 = objc_alloc_init(v1);
  BOOL v3 = (void *)_setCameraRollCountedInQuota___BackupManager;
  _setCameraRollCountedInQuota___BackupManager = (uint64_t)v2;
}

- (void)registerOutstandingTransactionsHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(PLLibraryServicesManager *)self pathManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__PLLibraryServicesManager_registerOutstandingTransactionsHandler___block_invoke;
  v11[3] = &unk_1E5875CE0;
  v11[4] = self;
  uint64_t v7 = +[PLClientServerTransaction handleOutstandingTransactionsForPathManager:v6 sqliteErrorHandler:v11 handler:v5];

  if (!v7)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PLLibraryServicesManager.m", 1673, @"Invalid parameter not satisfying: %@", @"timer != nil" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_outstandingTransactionHandlerTimerLock);
  outstandingTransactionHandlerTimer = self->_outstandingTransactionHandlerTimer;
  if (outstandingTransactionHandlerTimer)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLLibraryServicesManager.m", 1675, @"Invalid parameter not satisfying: %@", @"_outstandingTransactionHandlerTimer == nil" object file lineNumber description];

    outstandingTransactionHandlerTimer = self->_outstandingTransactionHandlerTimer;
  }
  self->_outstandingTransactionHandlerTimer = v7;

  os_unfair_lock_unlock(&self->_outstandingTransactionHandlerTimerLock);
}

uint64_t __67__PLLibraryServicesManager_registerOutstandingTransactionsHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) shutdownLibraryWithDescription:@"excessive recovery attempts"];
}

- (void)performFileSystemAssetImporterWorkWithLibrary:(id)a3 block:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [[PLFileSystemAssetImporter alloc] initWithPhotoLibrary:v6 libraryServicesManager:self];
  BOOL v9 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = [(PLLibraryServicesManager *)self logPrefix];
    *(_DWORD *)buf = 138543362;
    __int16 v17 = v10;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Preparing to run file system asset importer work block", buf, 0xCu);
  }
  uint64_t v14 = v6;
  int v15 = v7;
  id v11 = v8;
  id v12 = v7;
  id v13 = v6;
  PLSafeRunWithUnfairLock();
}

void __80__PLLibraryServicesManager_performFileSystemAssetImporterWorkWithLibrary_block___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = [*(id *)(a1 + 32) logPrefix];
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting file system asset importer work block on library %@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v5 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) logPrefix];
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Completed file system asset importer work block", (uint8_t *)&v7, 0xCu);
  }
}

- (void)performBlockWithImportMutex:(id)a3
{
}

- (void)_cancelPendingOperations
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  dispatch_assert_queue_V2(v3);

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [(PLLibraryServicesManager *)self mutablePendingOperations];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) cancel];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  __int16 v9 = [(PLLibraryServicesManager *)self mutablePendingOperations];
  [v9 removeAllObjects];
}

- (void)_addPendingOperationsForStateNode:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [v4 state];
  [(PLLibraryServicesManager *)self pendingOperations];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v12 requiredState] == v7)
        {
          [v6 addObject:v12];
          long long v13 = [(PLLibraryServicesManager *)self mutablePendingOperations];
          [v13 removeObject:v12];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v41 count:16];
    }
    while (v9);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v24 = v6;
  uint64_t v14 = [v24 countByEnumeratingWithState:&v26 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v24);
        }
        uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        __int16 v19 = PLLibraryServicesGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          id v20 = [(PLLibraryServicesManager *)self logPrefix];
          [v18 qualityOfService];
          uint64_t v21 = PLStringFromQualityOfService();
          *(_DWORD *)buf = 138543874;
          v35 = v20;
          __int16 v36 = 2114;
          int64_t v37 = v18;
          __int16 v38 = 2114;
          v39 = v21;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: Adding pending operation: %{public}@ at QoS: %{public}@", buf, 0x20u);
        }
        [v18 setLogPrefix:self->_logPrefix];
        if (([v4 enqueueOperation:v18 error:0] & 1) == 0)
        {
          __int16 v22 = [MEMORY[0x1E4F28B00] currentHandler];
          [v22 handleFailureInMethod:a2, self, @"PLLibraryServicesManager.m", 1641, @"Invalid parameter not satisfying: %@", @"enqueued" object file lineNumber description];
        }
      }
      uint64_t v15 = [v24 countByEnumeratingWithState:&v26 objects:v40 count:16];
    }
    while (v15);
  }
}

- (void)_setCurrentStateNode:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  dispatch_assert_queue_V2(v5);

  v10[0] = @"PLLibraryServicesManagerStateChangeStateKey";
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "state"));
  v10[1] = @"PLLibraryServicesManagerStateChangeStateNodeKey";
  v11[0] = v6;
  v11[1] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"PLLibraryServicesManagerStateWillChangeNotification" object:self userInfo:v7];
  currentStateNode = self->_currentStateNode;
  self->_currentStateNode = (PLLibraryServicesStateNode *)v4;

  [v8 postNotificationName:@"PLLibraryServicesManagerStateDidChangeNotification" object:self userInfo:v7];
}

- (void)_handleLibraryStateCompletedAllOperations
{
  BOOL v3 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(PLLibraryServicesManager *)self currentStateNode];
  uint64_t v5 = [v4 operationCount];

  if (!v5)
  {
    uint64_t v6 = [(PLLibraryServicesManager *)self _state];
    [(id)objc_opt_class() _finalState];
    if (PLCanMoveFromSourceStateToTargetState()
      && [(PLLibraryServicesManager *)self isFinalizing])
    {
      -[PLLibraryServicesManager _transitionToState:](self, "_transitionToState:", [(id)objc_opt_class() _finalState]);
    }
    if (v6 == (void *)7) {
      [(PLLibraryServicesManager *)self _resetStateQueueQoS];
    }
    uint64_t v7 = [(PLLibraryServicesManager *)self libraryServicesDelegate];
    objc_initWeak(&location, v7);

    id v8 = objc_loadWeakRetained(&location);
    if (v8)
    {
      uint64_t v9 = [(PLLibraryServicesManager *)self helperQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__PLLibraryServicesManager__handleLibraryStateCompletedAllOperations__block_invoke;
      block[3] = &unk_1E586A670;
      objc_copyWeak(v11, &location);
      v11[1] = v6;
      dispatch_async(v9, block);

      objc_destroyWeak(v11);
    }
    objc_destroyWeak(&location);
  }
}

void __69__PLLibraryServicesManager__handleLibraryStateCompletedAllOperations__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleCompletedAllOperationsForLibraryState:*(void *)(a1 + 40)];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  long long v11 = v10;
  if (a6 == &PLLibraryServicesManagerOperationQueueObserverOperationCountContext)
  {
    if (![v10 operationCount])
    {
      long long v12 = [(PLLibraryServicesManager *)self stateSerializationQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__PLLibraryServicesManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E5875CE0;
      void block[4] = self;
      dispatch_async(v12, block);
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLLibraryServicesManager;
    [(PLLibraryServicesManager *)&v13 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

uint64_t __75__PLLibraryServicesManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleLibraryStateCompletedAllOperations];
}

- (void)_stopObservingLibraryStateCompletedAllOperations
{
  BOOL v3 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(PLLibraryServicesManager *)self operationCountObservee];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F8B960];
    uint64_t v6 = [(PLLibraryServicesManager *)self operationCountObservee];
    [v5 removeOperationCountObserver:self fromObservedObject:v6 context:&PLLibraryServicesManagerOperationQueueObserverOperationCountContext];

    [(PLLibraryServicesManager *)self setOperationCountObservee:0];
  }
}

- (void)_startObservingLibraryStateCompletedAllOperations
{
  BOOL v3 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(PLLibraryServicesManager *)self operationCountObservee];

  if (v4) {
    [(PLLibraryServicesManager *)self _stopObservingLibraryStateCompletedAllOperations];
  }
  id v6 = [(PLLibraryServicesManager *)self currentStateNode];
  uint64_t v5 = [v6 addOperationCountObserver:self context:&PLLibraryServicesManagerOperationQueueObserverOperationCountContext];
  [(PLLibraryServicesManager *)self setOperationCountObservee:v5];
}

- (void)_dispatchExternalWaitersForState:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  dispatch_assert_queue_V2(v5);

  int64_t v6 = [(id)objc_opt_class() _initialState];
  if (v6 <= a3)
  {
    int64_t v7 = v6;
    do
    {
      externalWaiterCompletionBlocksByState = self->_externalWaiterCompletionBlocksByState;
      uint64_t v9 = [NSNumber numberWithInteger:v7];
      id v10 = [(NSMutableDictionary *)externalWaiterCompletionBlocksByState objectForKeyedSubscript:v9];

      if (v10)
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v15++) + 16))();
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v13);
        }

        uint64_t v16 = self->_externalWaiterCompletionBlocksByState;
        __int16 v17 = [NSNumber numberWithInteger:v7];
        [(NSMutableDictionary *)v16 removeObjectForKey:v17];
      }
    }
    while (v7++ != a3);
  }
}

- (void)_transitionToState:(int64_t)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  dispatch_assert_queue_V2(v5);

  int64_t v6 = [(PLLibraryServicesManager *)self currentStateNode];
  uint64_t v7 = [v6 state];

  if (v7 != a3)
  {
    id v8 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(PLLibraryServicesManager *)self logPrefix];
      id v10 = PLStringFromLibraryServicesState();
      id v11 = PLStringFromLibraryServicesState();
      *(_DWORD *)buf = 138543874;
      __int16 v43 = v9;
      __int16 v44 = 2114;
      uint64_t v45 = v10;
      __int16 v46 = 2114;
      v47 = v11;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Transition from library services state %{public}@ to %{public}@", buf, 0x20u);
    }
  }
  [(PLLibraryServicesManager *)self _stopObservingLibraryStateCompletedAllOperations];
  uint64_t v12 = [(PLLibraryServicesManager *)self currentStateNode];
  [v12 terminate];

  uint64_t v13 = [(PLLibraryServicesManager *)self _libraryServicesStateNodeWithState:a3];
  [(PLLibraryServicesManager *)self _setCurrentStateNode:v13];

  if ([(PLLibraryServicesManager *)self isActive])
  {
    uint64_t v14 = [(PLLibraryServicesManager *)self libraryServicesDelegate];

    if (v14)
    {
      if ([(id)objc_opt_class() _initialState] == a3)
      {
        uint64_t v15 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
        [(PLLibraryServicesManager *)self setPreRunningProgress:v15];

        uint64_t v16 = PLLibraryServicesGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          __int16 v17 = [(PLLibraryServicesManager *)self logPrefix];
          uint64_t v18 = [(PLLibraryServicesManager *)self preRunningProgress];
          *(_DWORD *)buf = 138543618;
          __int16 v43 = v17;
          __int16 v44 = 2112;
          uint64_t v45 = v18;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: preRunningProgress = %@", buf, 0x16u);
        }
        long long v19 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
        [(PLLibraryServicesManager *)self setPostRunningProgress:v19];

        long long v20 = PLLibraryServicesGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          long long v21 = [(PLLibraryServicesManager *)self logPrefix];
          long long v22 = [(PLLibraryServicesManager *)self postRunningProgress];
          *(_DWORD *)buf = 138543618;
          __int16 v43 = v21;
          __int16 v44 = 2112;
          uint64_t v45 = v22;
          _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "%{public}@: postRunnningProgress = %@", buf, 0x16u);
        }
      }
      char v23 = [(PLLibraryServicesManager *)self libraryServicesDelegate];
      uint64_t v24 = [v23 operationsForLibraryStateTransition:a3];

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        long long v28 = 0;
        uint64_t v29 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v38 != v29) {
              objc_enumerationMutation(v25);
            }
            long long v31 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            v28 += objc_msgSend(v31, "progressPercentOfTotal", (void)v37);
            [(PLLibraryServicesManager *)self _enqueueOperation:v31 error:0];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v27);
      }
      else
      {
        long long v28 = 0;
      }

      if ([(id)objc_opt_class() _initialState] == a3)
      {
        long long v32 = PLLibraryServicesGetLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          long long v33 = [(PLLibraryServicesManager *)self logPrefix];
          __int16 v34 = [v25 debugDescription];
          *(_DWORD *)buf = 138543874;
          __int16 v43 = v33;
          __int16 v44 = 2112;
          uint64_t v45 = v34;
          __int16 v46 = 2048;
          v47 = v28;
          _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEBUG, "%{public}@: Finished adding operations: %@\ntotalUnitCounts is %ld.", buf, 0x20u);
        }
      }
    }
    v35 = [(PLLibraryServicesManager *)self currentStateNode];
    [(PLLibraryServicesManager *)self _addPendingOperationsForStateNode:v35];

    [(PLLibraryServicesManager *)self _startObservingLibraryStateCompletedAllOperations];
    __int16 v36 = [(PLLibraryServicesManager *)self currentStateNode];
    [v36 run];
  }
  [(PLLibraryServicesManager *)self _dispatchExternalWaitersForState:a3];
}

- (BOOL)_canTransitionToState:(int64_t)a3 error:(id *)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  int64_t v6 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  dispatch_assert_queue_V2(v6);

  [(PLLibraryServicesManager *)self _state];
  [(PLLibraryServicesManager *)self _state];
  if (PLCanMoveFromSourceStateToTargetState())
  {
    uint64_t v7 = [(PLLibraryServicesManager *)self activeOperations];
    uint64_t v8 = [v7 count];

    if (!v8)
    {
      id v18 = 0;
      BOOL v19 = 1;
      goto LABEL_9;
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F8C500];
    v21[0] = @"currentState";
    id v11 = PLStringFromLibraryServicesState();
    v22[0] = v11;
    v21[1] = @"targetState";
    uint64_t v12 = PLStringFromLibraryServicesState();
    v21[2] = @"reason";
    v22[1] = v12;
    v22[2] = @"Current library state has active operations";
    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = v22;
    uint64_t v15 = v21;
    uint64_t v16 = 3;
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F8C500];
    v23[0] = @"currentState";
    id v11 = PLStringFromLibraryServicesState();
    v23[1] = @"targetState";
    v24[0] = v11;
    uint64_t v12 = PLStringFromLibraryServicesState();
    v24[1] = v12;
    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = v24;
    uint64_t v15 = v23;
    uint64_t v16 = 2;
  }
  __int16 v17 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:v16];
  id v18 = [v9 errorWithDomain:v10 code:43002 userInfo:v17];

  if (a4)
  {
    id v18 = v18;
    BOOL v19 = 0;
    *a4 = v18;
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_9:

  return v19;
}

- (void)deactivateWithInvalidationError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v6 = [(PLLibraryServicesManager *)self logPrefix];
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Deactivating with error %@", buf, 0x16u);
  }
  uint64_t v7 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __60__PLLibraryServicesManager_deactivateWithInvalidationError___block_invoke;
  uint64_t v12 = &unk_1E5875E18;
  uint64_t v13 = self;
  id v14 = v4;
  id v8 = v4;
  dispatch_sync(v7, &v9);

  [(PLLibraryServicesManager *)self _invalidate];
}

uint64_t __60__PLLibraryServicesManager_deactivateWithInvalidationError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setActive:0];
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) invalidationError];

    if (!v2) {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 392), *(id *)(a1 + 40));
    }
  }
  uint64_t result = [*(id *)(a1 + 32) _state];
  if (result != 99)
  {
    [*(id *)(a1 + 32) _cancelPendingOperations];
    id v4 = *(void **)(a1 + 32);
    return [v4 _transitionToState:99];
  }
  return result;
}

- (BOOL)finalize:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(PLLibraryServicesManager *)self setFinalizing:1];
  uint64_t v5 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v6 = [(PLLibraryServicesManager *)self logPrefix];
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting finalize", buf, 0xCu);
  }
  uint64_t v7 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PLLibraryServicesManager_finalize___block_invoke;
  block[3] = &unk_1E5875CE0;
  void block[4] = self;
  dispatch_sync(v7, block);

  id v13 = 0;
  BOOL v8 = -[PLLibraryServicesManager awaitLibraryState:error:](self, "awaitLibraryState:error:", [(id)objc_opt_class() _finalState], &v13);
  id v9 = v13;
  if (v8)
  {
    [(PLLibraryServicesManager *)self _invalidate];
  }
  else
  {
    uint64_t v10 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(PLLibraryServicesManager *)self logPrefix];
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Finalize failed with error %@", buf, 0x16u);
    }
    if (a3) {
      *a3 = v9;
    }
  }

  return v8;
}

void __37__PLLibraryServicesManager_finalize___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _state];
  if (v2 != [(id)objc_opt_class() _finalState])
  {
    [*(id *)(a1 + 32) _state];
    [(id)objc_opt_class() _finalState];
    if (PLCanMoveFromSourceStateToTargetState())
    {
      BOOL v3 = [*(id *)(a1 + 32) currentStateNode];
      uint64_t v4 = [v3 operationCount];

      if (!v4)
      {
        uint64_t v5 = *(void **)(a1 + 32);
        uint64_t v6 = [(id)objc_opt_class() _finalState];
        [v5 _transitionToState:v6];
      }
    }
  }
}

- (void)_invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(PLLibraryServicesManager *)self logPrefix];
    *(_DWORD *)buf = 138543362;
    BOOL v8 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating", buf, 0xCu);
  }
  [(PLLibraryServicesManager *)self _invalidateCPLReadiness];
  uint64_t v5 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PLLibraryServicesManager__invalidate__block_invoke;
  block[3] = &unk_1E5875CE0;
  void block[4] = self;
  dispatch_sync(v5, block);

  [(PLLibraryServicesManager *)self _invalidateCloudPhotoLibraryManager];
  [(PLLibraryServicesManager *)self _invalidateCrashRecoverySupport];
  [(PLLibraryServicesManager *)self _invalidateMomentGenerationDataManager];
  [(PLLibraryServicesManager *)self _invalidateRebuildJournalManager];
  [(PLLibraryServicesManager *)self _invalidateComputeCacheManager];
  [(PLLibraryServicesManager *)self _invalidateSearchIndexManager];
  [(PLLibraryServicesManager *)self _invalidateSearchIndexingEngine];
  [(PLLibraryServicesManager *)self _invalidateSearchDonationProgress];
  [(PLLibraryServicesManager *)self _invalidateModelMigrator];
  [(PLLibraryServicesManager *)self _invalidateBackgroundJobService];
  [(PLLibraryServicesManager *)self _invalidateAlbumCountCoalescer];
  [(PLLibraryServicesManager *)self _invalidateImageWriter];
  [(PLLibraryServicesManager *)self _invalidateKeywordManager];
  [(PLLibraryServicesManager *)self _invalidatePairingManager];
  [(PLLibraryServicesManager *)self _invalidateDuplicateProcessor];
  [(PLLibraryServicesManager *)self _invalidateQuickActionManager];
  [(PLLibraryServicesManager *)self _invalidateDatabaseContext];
  [(PLLibraryServicesManager *)self _invalidateCameraPreviewWellManager];
  if ([(PLLibraryServicesManager *)self isSyndicationPhotoLibrary]) {
    [(PLLibraryServicesManager *)self _invalidateSyndicationPhotoLibrarySpecificServices];
  }
  [(PLLibraryServicesManager *)self _invalidateOutstandingTransactionHandlerTimer];
  [(PLLibraryServicesManager *)self _invalidateClientSideEncryptionManager];
  [(PLLibraryServicesManager *)self _invalidateDirectServerConfiguration];
  [(PLLibraryServicesManager *)self _invalidateMainScopeIdentifier];
  [(PLLibraryServicesManager *)self _invalidateCPLSettings];
  [(PLLibraryServicesManager *)self _invalidateAnalysisCoordinator];
  [(PLLibraryServicesManager *)self _invalidateReadyForAnalysis];
  [(PLLibraryServicesManager *)self _invalidateAvailabilityComputer];
  [(PLLibraryServicesManager *)self _invalidateCloudIdentifierReservationSupport];
  self->_wellKnownPhotoLibraryIdentifier = [(PLLibraryServicesManager *)self _determineWellKnownPhotoLibraryIdentifier];
}

uint64_t __39__PLLibraryServicesManager__invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopObservingLibraryStateCompletedAllOperations];
  uint64_t v2 = [*(id *)(a1 + 32) currentStateNode];
  [v2 terminate];

  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setActive:0];
}

- (BOOL)transitionToState:(int64_t)a3 error:(id *)a4
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  uint64_t v7 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__PLLibraryServicesManager_transitionToState_error___block_invoke;
  v9[3] = &unk_1E5873C08;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = a3;
  v9[7] = a4;
  dispatch_sync(v7, v9);

  LOBYTE(a4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)a4;
}

void __52__PLLibraryServicesManager_transitionToState_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _state] != *(void *)(a1 + 48))
  {
    int v2 = objc_msgSend(*(id *)(a1 + 32), "_canTransitionToState:error:");
    id v3 = 0;
    uint64_t v4 = v3;
    if (v2)
    {
      [*(id *)(a1 + 32) _transitionToState:*(void *)(a1 + 48)];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      if (*(void *)(a1 + 56))
      {
        **(void **)(a1 + 56) = v3;
      }
      else
      {
        uint64_t v5 = PLLibraryServicesGetLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          uint64_t v6 = [*(id *)(a1 + 32) logPrefix];
          uint64_t v7 = PLStringFromLibraryServicesState();
          BOOL v8 = PLStringFromLibraryServicesState();
          uint64_t v9 = [*(id *)(a1 + 32) description];
          *(_DWORD *)buf = 138544386;
          id v11 = v6;
          __int16 v12 = 2114;
          char v13 = v7;
          __int16 v14 = 2114;
          uint64_t v15 = v8;
          __int16 v16 = 2114;
          __int16 v17 = v9;
          __int16 v18 = 2114;
          uint64_t v19 = v4;
          _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Transition from %{public}@ to %{public}@ on %{public}@ failed with error %{public}@", buf, 0x34u);
        }
      }
    }
  }
}

- (void)_enqueueExternalWaiterCompletionBlockForState:(int64_t)a3 completionBlock:(id)a4
{
  id v15 = a4;
  uint64_t v7 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  dispatch_assert_queue_V2(v7);

  if (!v15)
  {
    __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PLLibraryServicesManager.m", 1340, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];
  }
  externalWaiterCompletionBlocksByState = self->_externalWaiterCompletionBlocksByState;
  uint64_t v9 = [NSNumber numberWithInteger:a3];
  id v10 = [(NSMutableDictionary *)externalWaiterCompletionBlocksByState objectForKeyedSubscript:v9];

  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = self->_externalWaiterCompletionBlocksByState;
    __int16 v12 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];
  }
  char v13 = (void *)MEMORY[0x19F38D650](v15);
  [v10 addObject:v13];

  [(PLLibraryServicesManager *)self _increaseStateQueueQoSIfNeeded];
}

- (void)awaitLibraryState:(int64_t)a3 completionHandler:(id)a4
{
}

- (id)_enqueueAwaitOperation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLLibraryServicesManager *)self currentStateNode];
  uint64_t v4 = [v3 state];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50__PLLibraryServicesManager__enqueueAwaitOperation__block_invoke;
  v17[3] = &unk_1E5873348;
  v17[4] = self;
  v17[5] = v4;
  uint64_t v5 = [MEMORY[0x1E4F8B958] operationWithName:@"Await Operation" requiredState:v4 parentProgress:0 execution:v17];
  [v5 setLogPrefix:self->_logPrefix];
  qos_class_self();
  [v5 setQualityOfService:PLQualityOfServiceFromQoSClass()];
  uint64_t v6 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [(PLLibraryServicesManager *)self logPrefix];
    [v5 qualityOfService];
    BOOL v8 = PLStringFromQualityOfService();
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v7;
    __int16 v20 = 2114;
    long long v21 = v5;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: Adding await operation: %{public}@ at QoS: %{public}@", buf, 0x20u);
  }
  uint64_t v9 = [(PLLibraryServicesManager *)self currentStateNode];
  id v16 = 0;
  char v10 = [v9 enqueueOperation:v5 error:&v16];
  id v11 = v16;

  if (v10)
  {
    id v12 = v5;
  }
  else
  {
    char v13 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = [(PLLibraryServicesManager *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      long long v21 = v5;
      __int16 v22 = 2112;
      id v23 = v11;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enqueue await operation: %@ error: %@", buf, 0x20u);
    }
    id v12 = 0;
  }

  return v12;
}

void __50__PLLibraryServicesManager__enqueueAwaitOperation__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) logPrefix];
    uint64_t v4 = PLStringFromLibraryServicesState();
    qos_class_self();
    uint64_t v5 = PLStringFromQoSClass();
    int v6 = 138543874;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Running await block, current state: %{public}@ at QoS: %{public}@)", (uint8_t *)&v6, 0x20u);
  }
}

void __70__PLLibraryServicesManager__awaitLibraryState_sync_completionHandler___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48))
  {
    int v2 = [*(id *)(a1 + 32) stateSerializationQueue];
    dispatch_assert_queue_V2(v2);

    [*(id *)(a1 + 32) _state];
    if (PLIsValidStateForMinimumStateRequirement())
    {
      id v3 = 0;
    }
    else
    {
      uint64_t v9 = @"currentState";
      uint64_t v5 = PLStringFromLibraryServicesState();
      v10[0] = v5;
      int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

      uint64_t v7 = objc_opt_class();
      __int16 v8 = [*(id *)(a1 + 32) invalidationError];
      id v3 = [v7 errorForInvalidationError:v8 userInfo:v6];
    }
    [*(id *)(a1 + 32) _dispatchAwaitLibraryStateCompletionHandler:*(void *)(a1 + 48) group:*(void *)(a1 + 40) error:v3];
  }
  else
  {
    uint64_t v4 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v4);
  }
}

- (id)pendingOperations
{
  int v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = [(PLLibraryServicesManager *)self mutablePendingOperations];
  uint64_t v4 = [v2 arrayWithArray:v3];

  return v4;
}

- (id)activeOperations
{
  int v2 = [(PLLibraryServicesManager *)self currentStateNode];
  id v3 = [v2 operations];

  return v3;
}

- (BOOL)_enqueueOperation:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  dispatch_assert_queue_V2(v7);

  [v6 setLogPrefix:self->_logPrefix];
  if (![(PLLibraryServicesManager *)self isFinalizing]
    || (uint64_t v8 = [v6 requiredState], v8 == objc_msgSend((id)objc_opt_class(), "_finalState")))
  {
    if ([(PLLibraryServicesManager *)self isActive])
    {
      int64_t v9 = [(PLLibraryServicesManager *)self _state];
      if (v9 == [v6 requiredState])
      {
        [(PLLibraryServicesManager *)self _increaseStateQueueQoSIfNeeded];
        __int16 v10 = PLLibraryServicesGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          id v11 = [(PLLibraryServicesManager *)self logPrefix];
          [v6 qualityOfService];
          uint64_t v12 = PLStringFromQualityOfService();
          *(_DWORD *)buf = 138543874;
          long long v30 = v11;
          __int16 v31 = 2114;
          id v32 = v6;
          __int16 v33 = 2114;
          id v34 = v12;
          _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Adding operation: %{public}@ at QoS: %{public}@", buf, 0x20u);
        }
        char v13 = [(PLLibraryServicesManager *)self currentStateNode];
        char v14 = [v13 enqueueOperation:v6 error:0];

        if ((v14 & 1) == 0) {
          goto LABEL_12;
        }
LABEL_11:
        BOOL v16 = 1;
        goto LABEL_19;
      }
    }
    [(PLLibraryServicesManager *)self _state];
    [v6 requiredState];
    if (PLHasPathFromSourceStateToTargetState())
    {
      [(PLLibraryServicesManager *)self _increaseStateQueueQoSIfNeeded];
      id v15 = [(PLLibraryServicesManager *)self mutablePendingOperations];
      [v15 addObject:v6];

      goto LABEL_11;
    }
  }
LABEL_12:
  [(PLLibraryServicesManager *)self _state];
  __int16 v17 = PLStringFromLibraryServicesState();
  v27[1] = @"operation";
  v28[0] = v17;
  __int16 v18 = [v6 description];
  v28[1] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  __int16 v20 = objc_opt_class();
  long long v21 = [(PLLibraryServicesManager *)self invalidationError];
  __int16 v22 = [v20 errorForInvalidationError:v21 userInfo:v19];

  if (([MEMORY[0x1E4F8B958] shouldSuppressLogging] & 1) == 0)
  {
    id v23 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [(PLLibraryServicesManager *)self logPrefix];
      [(PLLibraryServicesManager *)self _state];
      id v25 = PLStringFromLibraryServicesState();
      *(_DWORD *)buf = 138543874;
      long long v30 = v24;
      __int16 v31 = 2114;
      id v32 = v25;
      __int16 v33 = 2114;
      id v34 = v6;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Enqueue operation failed with invalid library state %{public}@ %{public}@", buf, 0x20u);
    }
  }
  if (a4) {
    *a4 = v22;
  }

  BOOL v16 = 0;
LABEL_19:

  return v16;
}

- (void)_resetStateQueueQoS
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  dispatch_assert_queue_V2(v3);

  if (self->_maxWaiterQoS != 9)
  {
    uint64_t v4 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(PLLibraryServicesManager *)self logPrefix];
      id v6 = PLStringFromQoSClass();
      int v8 = 138543618;
      int64_t v9 = v5;
      __int16 v10 = 2114;
      id v11 = v6;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting QoS to %{public}@", (uint8_t *)&v8, 0x16u);
    }
    self->_maxWaiterQoS = 9;
    uint64_t v7 = [(PLLibraryServicesManager *)self currentStateNode];
    [v7 setQos:9];
  }
}

- (void)_increaseStateQueueQoSIfNeeded
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = qos_class_self();
  if (v4 > self->_maxWaiterQoS)
  {
    uint64_t v5 = v4;
    id v6 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(PLLibraryServicesManager *)self logPrefix];
      int v8 = PLStringFromQoSClass();
      int64_t v9 = PLStringFromQoSClass();
      int v11 = 138543874;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      char v14 = v8;
      __int16 v15 = 2114;
      BOOL v16 = v9;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Increase QoS from %{public}@ to %{public}@", (uint8_t *)&v11, 0x20u);
    }
    self->_maxWaiterQoS = v5;
    __int16 v10 = [(PLLibraryServicesManager *)self currentStateNode];
    [v10 setQos:v5];
  }
}

- (void)shutdownLibraryWithDescription:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[PLPhotoLibraryBundleController sharedBundleController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F8C500];
  uint64_t v11 = *MEMORY[0x1E4F28228];
  v12[0] = v4;
  int64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  __int16 v10 = [v7 errorWithDomain:v8 code:41021 userInfo:v9];

  [v5 shutdownBundle:WeakRetained reason:v10];
}

- (BOOL)enqueueOperation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__46487;
  __int16 v20 = __Block_byref_object_dispose__46488;
  id v21 = 0;
  uint64_t v7 = [(PLLibraryServicesManager *)self stateSerializationQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __51__PLLibraryServicesManager_enqueueOperation_error___block_invoke;
  v12[3] = &unk_1E5874900;
  char v14 = &v22;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  __int16 v15 = &v16;
  dispatch_sync(v7, v12);

  int v9 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((unsigned char *)v23 + 24))
  {
    *a4 = (id) v17[5];
    int v9 = *((unsigned __int8 *)v23 + 24);
  }
  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __51__PLLibraryServicesManager_enqueueOperation_error___block_invoke(void *a1)
{
  int v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  obuint64_t j = *(id *)(v4 + 40);
  char v5 = [v2 _enqueueOperation:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (id)_libraryServicesStateNodeWithState:(int64_t)a3
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F8B960]) initWithLibraryServicesState:a3 qualityOfService:self->_maxWaiterQoS logPrefix:self->_logPrefix];
  return v3;
}

- (void)initializeConstraintsDirector
{
  id v3 = [(PLLibraryServicesManager *)self libraryBundle];
  id v2 = (id)[v3 constraintsDirector];
}

- (void)initializeChangeHandling
{
  id v2 = [(PLLibraryServicesManager *)self libraryBundle];
  [v2 initializeChangeHandling];
}

- (PLCloudIdentifierReservationSupport)cloudIdentifierReservationSupport
{
  return (PLCloudIdentifierReservationSupport *)[(PLLazyObject *)self->_lazyCloudIdentifierReservationSupport objectValue];
}

- (PLFeatureAvailabilityComputer)availabilityComputer
{
  return (PLFeatureAvailabilityComputer *)[(PLLazyObject *)self->_lazyAvailabilityComputer objectValue];
}

- (id)availabilityTransitionDelegate
{
  return (id)[(PLLazyObject *)self->_lazyAvailabilityTransitionDelegate objectValue];
}

- (id)availabilityProgressDelegate
{
  return (id)[(PLLazyObject *)self->_lazyAvailabilityProgressDelegate objectValue];
}

- (PLAnalysisCoordinator)analysisCoordinator
{
  return (PLAnalysisCoordinator *)[(PLLazyObject *)self->_lazyAnalysisCoordinator objectValue];
}

- (PLCacheDeleteSupport)cacheDeleteSupport
{
  return (PLCacheDeleteSupport *)[(PLLazyObject *)self->_lazyCacheDeleteSupport objectValue];
}

- (PLSyndicationDeleteEngine)syndicationDeleteManager
{
  return (PLSyndicationDeleteEngine *)[(PLLazyObject *)self->_lazySyndicationDeleteManager objectValue];
}

- (PLCameraPreviewWellManager)cameraPreviewWellManager
{
  return (PLCameraPreviewWellManager *)[(PLLazyObject *)self->_lazyCameraPreviewWellManager objectValue];
}

- (PLPairing)pairingManager
{
  return (PLPairing *)[(PLLazyObject *)self->_lazyPairingManager objectValue];
}

- (PLKeywordManager)keywordManager
{
  return (PLKeywordManager *)[(PLLazyObject *)self->_lazyKeywordManager objectValue];
}

- (PLQuickActionManager)quickActionManager
{
  return (PLQuickActionManager *)[(PLLazyObject *)self->_lazyQuickActionManager objectValue];
}

- (id)newDirectServerConfiguration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  pathManager = self->_pathManager;
  id v10 = 0;
  id v3 = [(PLPhotoLibraryPathManager *)pathManager photoDirectoryWithType:5 createIfNeeded:1 error:&v10];
  id v4 = v10;
  if (v4)
  {
    char v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Could not create private directory for direct server configuration cache: %@", buf, 0xCu);
    }
  }
  id v6 = objc_alloc(MEMORY[0x1E4F59850]);
  uint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
  id v8 = (void *)[v6 initWithClientLibraryBaseURL:v7 minUpdateInterval:*MEMORY[0x1E4F59738] updateIntervalKey:*MEMORY[0x1E4F59740]];

  return v8;
}

- (id)newClientSideEncryptionManager
{
  id v2 = objc_alloc(MEMORY[0x1E4F8CBF0]);
  id v3 = (void *)[v2 initWithProfile:*MEMORY[0x1E4F8CEC0]];
  [v3 start];
  return v3;
}

- (PFClientSideEncryptionManager)clientSideEncryptionManager
{
  if ([(PLLibraryServicesManager *)self isSystemPhotoLibrary])
  {
    id v3 = [(PLLazyObject *)self->_lazyClientSideEncryptionManager objectValue];
  }
  else
  {
    id v3 = 0;
  }
  return (PFClientSideEncryptionManager *)v3;
}

- (id)journalManagerForName:(id)a3
{
  id v4 = a3;
  char v5 = +[PLComputeCacheManager name];
  int v6 = [v4 isEqualToString:v5];

  if (v6) {
    [(PLLibraryServicesManager *)self computeCacheManager];
  }
  else {
  uint64_t v7 = [(PLLibraryServicesManager *)self rebuildJournalManager];
  }
  return v7;
}

- (id)newComputeCacheManager
{
  id v2 = [[PLComputeCacheManager alloc] initWithLibraryServicesManager:self];
  [(PLComputeCacheManager *)v2 start];
  return v2;
}

- (PLComputeCacheManager)computeCacheManager
{
  return (PLComputeCacheManager *)[(PLLazyObject *)self->_lazyComputeCacheManager objectValue];
}

- (id)newRebuildJournalManager
{
  if (!+[PLRebuildJournalManager isEnabledWithPathManager:self->_pathManager error:0])return 0; {
  id v3 = [PLRebuildJournalManager alloc];
  }
  return [(PLRebuildJournalManager *)v3 initWithLibraryServicesManager:self];
}

- (PLRebuildJournalManager)rebuildJournalManager
{
  return (PLRebuildJournalManager *)[(PLLazyObject *)self->_lazyRebuildJournalManager objectValue];
}

- (PLDuplicateProcessor)duplicateProcessor
{
  return (PLDuplicateProcessor *)[(PLLazyObject *)self->_lazyDuplicateProcessor objectValue];
}

- (PLMomentGenerationDataManager)momentGenerationDataManager
{
  if (PLPlatformMomentsSupported())
  {
    id v3 = [(PLLazyObject *)self->_lazyMomentGenerationDataManager objectValue];
  }
  else
  {
    id v3 = 0;
  }
  return (PLMomentGenerationDataManager *)v3;
}

- (void)_invalidateReadyForAnalysis
{
}

- (void)_invalidateCloudIdentifierReservationSupport
{
}

- (void)_invalidateAvailabilityComputer
{
}

- (void)_invalidateAvailabilityTransitionDelegate
{
}

- (void)_invalidateAvailabilityProgressDelegate
{
}

- (void)_invalidateAnalysisCoordinator
{
}

- (void)_invalidateMainScopeIdentifier
{
}

- (void)_invalidateCPLSettings
{
}

- (void)_invalidateOutstandingTransactionHandlerTimer
{
  p_outstandingTransactionHandlerTimerLock = &self->_outstandingTransactionHandlerTimerLock;
  os_unfair_lock_lock(&self->_outstandingTransactionHandlerTimerLock);
  outstandingTransactionHandlerTimer = self->_outstandingTransactionHandlerTimer;
  self->_outstandingTransactionHandlerTimer = 0;
  char v5 = outstandingTransactionHandlerTimer;

  os_unfair_lock_unlock(p_outstandingTransactionHandlerTimerLock);
  +[PLClientServerTransaction cancelOutstandingTransactionHandlerTimer:v5];
}

- (void)_invalidateCacheDeleteSupport
{
}

- (void)_invalidateSyndicationDeleteManager
{
}

- (void)_invalidateCameraPreviewWellManager
{
}

- (void)_invalidateDirectServerConfiguration
{
}

uint64_t __64__PLLibraryServicesManager__invalidateDirectServerConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)_invalidateClientSideEncryptionManager
{
}

uint64_t __66__PLLibraryServicesManager__invalidateClientSideEncryptionManager__block_invoke(uint64_t a1, void *a2)
{
  return [a2 shutdownWithCompletionHandler:0];
}

- (void)_invalidateCPLReadiness
{
}

uint64_t __51__PLLibraryServicesManager__invalidateCPLReadiness__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)_invalidateBackgroundJobService
{
  if (self->_backgroundJobService)
  {
    dispatch_block_t block = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_173);
    backgroundJobService = self->_backgroundJobService;
    id v4 = [(PLLibraryServicesManager *)self libraryBundle];
    [(PLBackgroundJobService *)backgroundJobService invalidateLibraryBundle:v4 completion:block];

    dispatch_block_wait(block, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)_invalidateCrashRecoverySupport
{
}

- (void)_invalidateCloudPhotoLibraryManager
{
}

uint64_t __63__PLLibraryServicesManager__invalidateCloudPhotoLibraryManager__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)_invalidateDatabaseContext
{
}

uint64_t __54__PLLibraryServicesManager__invalidateDatabaseContext__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)_invalidateQuickActionManager
{
}

- (void)_invalidateDuplicateProcessor
{
}

- (void)_invalidatePairingManager
{
}

- (void)_invalidateKeywordManager
{
}

- (void)_invalidateImageWriter
{
}

- (void)_invalidateImportSessionCountCoalescer
{
}

uint64_t __66__PLLibraryServicesManager__invalidateImportSessionCountCoalescer__block_invoke(uint64_t a1, void *a2)
{
  return [a2 reset];
}

- (void)_invalidateAlbumCountCoalescer
{
}

uint64_t __58__PLLibraryServicesManager__invalidateAlbumCountCoalescer__block_invoke(uint64_t a1, void *a2)
{
  return [a2 reset];
}

- (void)_invalidateModelMigrator
{
}

- (void)_invalidateSearchDonationProgress
{
}

uint64_t __61__PLLibraryServicesManager__invalidateSearchDonationProgress__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)_invalidateSearchIndexingEngine
{
}

uint64_t __59__PLLibraryServicesManager__invalidateSearchIndexingEngine__block_invoke(uint64_t a1, void *a2)
{
  return [a2 close];
}

- (void)_invalidateSearchIndexManager
{
}

uint64_t __57__PLLibraryServicesManager__invalidateSearchIndexManager__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)_invalidateComputeCacheManager
{
}

uint64_t __58__PLLibraryServicesManager__invalidateComputeCacheManager__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stop];
}

- (void)_invalidateRebuildJournalManager
{
}

uint64_t __60__PLLibraryServicesManager__invalidateRebuildJournalManager__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stop];
}

- (void)_invalidateMomentGenerationDataManager
{
}

- (PLReadyForAnalysis)readyForAnalysis
{
  return (PLReadyForAnalysis *)[(PLLazyObject *)self->_lazyReadyForAnalysis objectValue];
}

- (CPLConfiguration)directServerConfiguration
{
  return (CPLConfiguration *)[(PLLazyObject *)self->_lazyDirectServerConfiguration objectValue];
}

- (PLLibraryServicesCPLReadiness)cplReadiness
{
  return (PLLibraryServicesCPLReadiness *)[(PLLazyObject *)self->_lazyCPLReadiness objectValue];
}

- (id)newMomentGenerationDataManager
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (PLPlatformMomentsSupported())
  {
    id v3 = [PLMomentGenerationDataManager alloc];
    return [(PLMomentGenerationDataManager *)v3 initWithLibraryServicesManager:self];
  }
  else
  {
    char v5 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = [(PLLibraryServicesManager *)self logPrefix];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Moments disabled, momentGenerationDataManager unavailable", (uint8_t *)&v7, 0xCu);
    }
    return 0;
  }
}

- (id)newSearchDonationProgress
{
  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __53__PLLibraryServicesManager_newSearchDonationProgress__block_invoke;
  uint64_t v11 = &unk_1E586A4E0;
  objc_copyWeak(&v12, &location);
  id v3 = (void *)MEMORY[0x19F38D650](&v8);
  id v4 = [PLSearchDonationProgress alloc];
  char v5 = [(PLLibraryServicesManager *)self pathManager];
  int v6 = [(PLSearchDonationProgress *)v4 initWithPathManager:v5 contextProviderBlock:v3];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

id __53__PLLibraryServicesManager_newSearchDonationProgress__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _provideContextForSearchDonationProgress];

  return v2;
}

- (id)_provideContextForSearchDonationProgress
{
  id v2 = [(PLLibraryServicesManager *)self databaseContext];
  id v3 = (void *)[v2 newShortLivedLibraryWithName:"search donation progress"];

  id v4 = [v3 managedObjectContext];

  return v4;
}

- (id)newSearchIndexingEngine
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(PLLibraryServicesManager *)self isSearchIndexingEnabled])
  {
    id v3 = [PLSearchIndexingEngine alloc];
    return [(PLSearchIndexingEngine *)v3 initWithLibraryServicesManager:self];
  }
  else
  {
    char v5 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = [(PLLibraryServicesManager *)self logPrefix];
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Search indexing disabled, newSearchIndexingEngine unavailable", (uint8_t *)&v7, 0xCu);
    }
    return 0;
  }
}

- (id)newSearchIndexManager
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    id v3 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "PhotosSearchBackgroundJobWorker feature flag enabled. Not initializing PLSearchIndexManager.", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    if ([(PLLibraryServicesManager *)self isSearchIndexingEnabled])
    {
      id v4 = [PLSearchIndexManager alloc];
      char v5 = [(PLLibraryServicesManager *)self pathManager];
      int v6 = [(PLSearchIndexManager *)v4 initWithPathManager:v5];

      return v6;
    }
    uint64_t v8 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [(PLLibraryServicesManager *)self logPrefix];
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Search index manager disabled, newSearchIndexManager unavailable", (uint8_t *)&v10, 0xCu);
    }
  }
  return 0;
}

- (PLAssetsdCrashRecoverySupport)crashRecoverySupport
{
  return (PLAssetsdCrashRecoverySupport *)[(PLLazyObject *)self->_lazyCrashRecoverySupport objectValue];
}

- (id)newCrashRecoverySupport
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(PLLibraryServicesManager *)self isSystemPhotoLibrary])
  {
    id v3 = [PLAssetsdCrashRecoverySupport alloc];
    id v4 = [(PLLibraryServicesManager *)self pathManager];
    char v5 = [(PLAssetsdCrashRecoverySupport *)v3 initWithPathManager:v4];

    return v5;
  }
  else
  {
    int v7 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [(PLLibraryServicesManager *)self logPrefix];
      uint64_t v9 = [(PLLibraryServicesManager *)self pathManager];
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Request for newCrashRecoverySupport from a non-system photo library: %@", (uint8_t *)&v10, 0x16u);
    }
    return 0;
  }
}

- (PLCloudPhotoLibraryManager)cloudPhotoLibraryManager
{
  return (PLCloudPhotoLibraryManager *)[(PLLazyObject *)self->_lazyCloudPhotoLibraryManager objectValue];
}

- (id)newCloudPhotoLibraryManager
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(PLLibraryServicesManager *)self isCPLSyncablePhotoLibrary])
  {
    id v3 = [PLCloudPhotoLibraryManager alloc];
    return [(PLCloudPhotoLibraryManager *)v3 initWithLibraryServicesManager:self];
  }
  else
  {
    char v5 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = [(PLLibraryServicesManager *)self logPrefix];
      int v7 = [(PLLibraryServicesManager *)self pathManager];
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Request for newCloudPhotoLibraryManager from a non-system photo library: %@", (uint8_t *)&v8, 0x16u);
    }
    return 0;
  }
}

- (PLDatabaseContext)databaseContext
{
  return (PLDatabaseContext *)[(PLLazyObject *)self->_lazyDatabaseContext objectValue];
}

- (PLSearchDonationProgress)searchDonationProgress
{
  return (PLSearchDonationProgress *)[(PLLazyObject *)self->_lazySearchDonationProgress objectValue];
}

- (PLSearchIndexingEngine)searchIndexingEngine
{
  return (PLSearchIndexingEngine *)[(PLLazyObject *)self->_lazySearchIndexingEngine objectValue];
}

- (PLModelMigrator)modelMigrator
{
  return (PLModelMigrator *)[(PLLazyObject *)self->_lazyModelMigrator objectValue];
}

- (PLImageWriter)imageWriter
{
  return (PLImageWriter *)[(PLLazyObject *)self->_lazyImageWriter objectValue];
}

- (id)_newContainer:(Class)a3 scope:(id)a4
{
  id v6 = a4;
  int v7 = [(objc_class *)a3 entityName];
  int v8 = (void *)MEMORY[0x1E4F8A220];
  uint64_t v9 = [NSString stringWithFormat:@"com.apple.photos.%@counts", v7];
  albumCountQueue = self->_albumCountQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__PLLibraryServicesManager__newContainer_scope___block_invoke;
  v14[3] = &unk_1E586A4B8;
  id v15 = v6;
  Class v16 = a3;
  id v11 = v6;
  uint64_t v12 = [v8 setCoalescerWithLabel:v9 target:self queue:albumCountQueue action:v14];

  return v12;
}

uint64_t __48__PLLibraryServicesManager__newContainer_scope___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 _handleCoalescerActionWithScope:*(void *)(a1 + 32) class:*(void *)(a1 + 40) forIDs:a3 context:a4];
}

- (void)_handleCoalescerActionWithScope:(id)a3 class:(Class)a4 forIDs:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_albumCountQueue);
  BOOL v24 = [(PLLibraryServicesManager *)self isSystemPhotoLibrary];
  uint64_t v13 = [(objc_class *)a4 entityName];
  uint64_t v14 = [v12 activityToken];
  char v25 = v11;
  id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v11];
  Class v16 = [(PLLibraryServicesManager *)self databaseContext];
  id v17 = [NSString stringWithFormat:@"%@-countCoalescer", v13];
  uint64_t v18 = objc_msgSend(v16, "newShortLivedLibraryWithName:", objc_msgSend(v17, "UTF8String"));

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __81__PLLibraryServicesManager__handleCoalescerActionWithScope_class_forIDs_context___block_invoke;
  v26[3] = &unk_1E586A490;
  Class v29 = a4;
  id v19 = v18;
  id v27 = v19;
  id v20 = v15;
  id v28 = v20;
  [v19 performTransactionAndWait:v26];
  id v21 = self;
  objc_sync_enter(v21);
  [(PLClientServerTransaction *)v21->_serverTransaction completeTransactionScope:v10];
  if (v24) {
    double v22 = 4.0;
  }
  else {
    double v22 = 0.5;
  }
  serverTransaction = v21->_serverTransaction;
  v21->_serverTransaction = 0;

  objc_sync_exit(v21);
  [v14 endActivity];
  [v12 delayNextInvocationByTimeInterval:v22];
}

void __81__PLLibraryServicesManager__handleCoalescerActionWithScope_class_forIDs_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) managedObjectContext];
  +[PLPhotoLibrary refreshCachedCountsAndDates:1 onAssetsContainerClass:v2 inContext:v3 withPredicate:*(void *)(a1 + 40)];
}

- (id)newImportSessionCountCoalescer
{
  uint64_t v3 = objc_opt_class();
  return [(PLLibraryServicesManager *)self _newContainer:v3 scope:@"PLTransactionScopeImportSessionCounts"];
}

- (id)newAlbumCountCoalescer
{
  uint64_t v3 = objc_opt_class();
  return [(PLLibraryServicesManager *)self _newContainer:v3 scope:@"PLTransactionScopeAlbumCounts"];
}

- (void)_invalidateSyndicationPhotoLibrarySpecificServices
{
  [(PLLibraryServicesManager *)self _invalidateSyndicationDeleteManager];
  [(PLLibraryServicesManager *)self _invalidateCacheDeleteSupport];
}

- (void)_initSyndicationPhotoLibrarySpecificServices
{
  id v3 = objc_initWeak(&location, self);

  id v4 = objc_alloc(MEMORY[0x1E4F8B948]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PLLibraryServicesManager__initSyndicationPhotoLibrarySpecificServices__block_invoke;
  v13[3] = &unk_1E5874070;
  objc_copyWeak(&v14, &location);
  char v5 = (PLLazyObject *)[v4 initWithBlock:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  lazySyndicationDeleteManager = self->_lazySyndicationDeleteManager;
  self->_lazySyndicationDeleteManager = v5;

  id v7 = objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x1E4F8B948]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __72__PLLibraryServicesManager__initSyndicationPhotoLibrarySpecificServices__block_invoke_2;
  void v11[3] = &unk_1E5874070;
  objc_copyWeak(&v12, &location);
  uint64_t v9 = (PLLazyObject *)[v8 initWithBlock:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  lazyCacheDeleteSupport = self->_lazyCacheDeleteSupport;
  self->_lazyCacheDeleteSupport = v9;
}

PLSyndicationDeleteEngine *__72__PLLibraryServicesManager__initSyndicationPhotoLibrarySpecificServices__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    uint64_t v2 = [[PLSyndicationDeleteEngine alloc] initWithLibraryServicesManager:WeakRetained];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

PLCacheDeleteSupport *__72__PLLibraryServicesManager__initSyndicationPhotoLibrarySpecificServices__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    uint64_t v2 = [[PLCacheDeleteSupport alloc] initWithLibraryServicesManager:WeakRetained cplStatus:0];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (void)_invalidateSystemPhotoLibrarySpecificServices
{
  id v3 = [(PLLibraryServicesManager *)self searchIndexingEngine];
  [v3 disableUISearch];

  id v4 = [(PLLibraryServicesManager *)self searchIndexManager];
  [v4 disableUISearch];

  [(PLLibraryServicesManager *)self _invalidateCameraPreviewWellManager];
  [(PLLibraryServicesManager *)self _invalidateCrashRecoverySupport];
  [(PLLibraryServicesManager *)self _invalidateSyndicationDeleteManager];
}

- (void)_initSystemPhotoLibrarySpecificServices
{
  [(PLLibraryServicesManager *)self _initCameraPreviewWellManager];
  id v3 = objc_initWeak(&location, self);

  id v4 = objc_alloc(MEMORY[0x1E4F8B948]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__PLLibraryServicesManager__initSystemPhotoLibrarySpecificServices__block_invoke;
  v13[3] = &unk_1E5874070;
  objc_copyWeak(&v14, &location);
  char v5 = (PLLazyObject *)[v4 initWithBlock:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  lazyCrashRecoverySupport = self->_lazyCrashRecoverySupport;
  self->_lazyCrashRecoverySupport = v5;

  if ([(PLLibraryServicesManager *)self isSystemPhotoLibrary])
  {
    id v7 = objc_initWeak(&location, self);

    id v8 = objc_alloc(MEMORY[0x1E4F8B948]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __67__PLLibraryServicesManager__initSystemPhotoLibrarySpecificServices__block_invoke_2;
    void v11[3] = &unk_1E5874070;
    objc_copyWeak(&v12, &location);
    uint64_t v9 = (PLLazyObject *)[v8 initWithBlock:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    lazySyndicationDeleteManager = self->_lazySyndicationDeleteManager;
    self->_lazySyndicationDeleteManager = v9;
  }
}

id __67__PLLibraryServicesManager__initSystemPhotoLibrarySpecificServices__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newCrashRecoverySupport];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

PLSyndicationDeleteEngine *__67__PLLibraryServicesManager__initSystemPhotoLibrarySpecificServices__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    uint64_t v2 = [[PLSyndicationDeleteEngine alloc] initWithLibraryServicesManager:WeakRetained];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (CPLFingerprintContext)fingerprintContext
{
  return (CPLFingerprintContext *)[(PLLazyObject *)self->_lazyFingerprintContext objectValue];
}

- (NSString)mainScopeIdentifier
{
  uint64_t v2 = [(PLLazyObject *)self->_lazyMainScopeIdentifier objectValue];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    CPLPrimaryScopeIdentifierForCurrentUniverse();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v5 = v4;

  return (NSString *)v5;
}

- (BOOL)isSearchIndexingEnabled
{
  char v3 = [(PLLibraryServicesManager *)self createOptions];
  BOOL v4 = [(PLLibraryServicesManager *)self isSyndicationPhotoLibrary];
  char v5 = (v3 & 2) == 0 || v4;
  return PLPlatformSearchSupported() & v5;
}

- (BOOL)isCPLSyncablePhotoLibrary
{
  if ([(PLLibraryServicesManager *)self isSystemPhotoLibrary]) {
    return 1;
  }
  if (![(PLLibraryServicesManager *)self isAppPhotoLibrary])
  {
    if (PLCloudPhotoLibraryMultiLibarySyncingEnabled_onceToken != -1) {
      dispatch_once(&PLCloudPhotoLibraryMultiLibarySyncingEnabled_onceToken, &__block_literal_global_387);
    }
    return PLCloudPhotoLibraryMultiLibarySyncingEnabled_multiLibrarySyncingEnabled
        && [(PLLibraryServicesManager *)self isSyndicationPhotoLibrary];
  }
  BOOL v4 = [(PLLibraryServicesManager *)self libraryBundle];
  char v5 = [v4 indicatorFileCoordinator];

  if ([(PLLibraryServicesManager *)self isCloudPhotoLibraryEnabled]) {
    char v3 = 1;
  }
  else {
    char v3 = [v5 isDisableICloudPhotos];
  }

  return v3;
}

- (BOOL)isAppPhotoLibrary
{
  uint64_t v2 = [(PLLibraryServicesManager *)self cplSettings];
  char v3 = [v2 isAppLibrary];

  return v3;
}

- (BOOL)isSyndicationPhotoLibrary
{
  return [(PLLibraryServicesManager *)self wellKnownPhotoLibraryIdentifier] == 3;
}

- (BOOL)isSystemPhotoLibrary
{
  return [(PLLibraryServicesManager *)self wellKnownPhotoLibraryIdentifier] == 1;
}

- (void)refreshImportSessionCountForImportSessionIDs:(id)a3
{
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLLibraryServicesManager refreshImportSessionCountForImportSessionIDs:]"];
  id v6 = [(PLLazyObject *)self->_lazyImportSessionCountCoalescer objectValue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PLLibraryServicesManager_refreshImportSessionCountForImportSessionIDs___block_invoke;
  v9[3] = &unk_1E586A468;
  v9[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 update:v9];
}

void __73__PLLibraryServicesManager_refreshImportSessionCountForImportSessionIDs___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  if (!*(void *)(*(void *)(a1 + 32) + 312))
  {
    id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:@"PLTransactionScopeImportSessionCounts"];
    char v5 = [*(id *)(a1 + 32) pathManager];
    id v6 = +[PLClientServerTransaction beginClientTransactionWithChangeScopes:pathManager:identifier:](PLClientServerTransaction, "beginClientTransactionWithChangeScopes:pathManager:identifier:", v4, v5, "-[PLLibraryServicesManager refreshImportSessionCountForImportSessionIDs:]_block_invoke");

    id v7 = [v6 transactionToken];
    id v8 = [*(id *)(a1 + 32) pathManager];
    uint64_t v9 = +[PLClientServerTransaction beginServerTransactionWithToken:changeScopes:pathManager:identifier:](PLClientServerTransaction, "beginServerTransactionWithToken:changeScopes:pathManager:identifier:", v7, v4, v8, "-[PLLibraryServicesManager refreshImportSessionCountForImportSessionIDs:]_block_invoke");
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 312);
    *(void *)(v10 + 312) = v9;

    [v6 completeTransaction];
  }
  objc_sync_exit(v3);

  [v12 unionSet:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) stillAlive];
}

- (void)refreshAlbumCountForAlbumIDs:(id)a3
{
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLLibraryServicesManager refreshAlbumCountForAlbumIDs:]"];
  id v6 = [(PLLazyObject *)self->_lazyAlbumCountCoalescer objectValue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PLLibraryServicesManager_refreshAlbumCountForAlbumIDs___block_invoke;
  v9[3] = &unk_1E586A468;
  v9[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 update:v9];
}

void __57__PLLibraryServicesManager_refreshAlbumCountForAlbumIDs___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  if (!*(void *)(*(void *)(a1 + 32) + 312))
  {
    id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:@"PLTransactionScopeAlbumCounts"];
    char v5 = [*(id *)(a1 + 32) pathManager];
    id v6 = +[PLClientServerTransaction beginClientTransactionWithChangeScopes:pathManager:identifier:](PLClientServerTransaction, "beginClientTransactionWithChangeScopes:pathManager:identifier:", v4, v5, "-[PLLibraryServicesManager refreshAlbumCountForAlbumIDs:]_block_invoke");

    id v7 = [v6 transactionToken];
    id v8 = [*(id *)(a1 + 32) pathManager];
    uint64_t v9 = +[PLClientServerTransaction beginServerTransactionWithToken:changeScopes:pathManager:identifier:](PLClientServerTransaction, "beginServerTransactionWithToken:changeScopes:pathManager:identifier:", v7, v4, v8, "-[PLLibraryServicesManager refreshAlbumCountForAlbumIDs:]_block_invoke");
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 312);
    *(void *)(v10 + 312) = v9;

    [v6 completeTransaction];
  }
  objc_sync_exit(v3);

  [v12 unionSet:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) stillAlive];
}

- (void)setCreateMode:(BOOL)a3 options:(id)a4
{
  id v7 = a4;
  self->_isCreateMode = a3;
  id v10 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&self->_openerCreationOptions, a4);
    id v8 = [v10 createDatabaseOptionsDictionary];
    uint64_t v9 = [(PLLibraryServicesManager *)self modelMigrator];
    [v9 setOptions:v8];
  }
}

- (BOOL)isCreateMode
{
  return self->_isCreateMode;
}

- (unint64_t)createOptions
{
  uint64_t v2 = [(PLLibraryServicesManager *)self modelMigrator];
  id v3 = [v2 options];
  id v4 = [v3 objectForKeyedSubscript:@"PLPhotoLibraryCreateOptions"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  uint64_t v2 = [(PLLibraryServicesManager *)self cplSettings];
  char v3 = [v2 isCloudPhotoLibraryEnabled];

  return v3;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  uint64_t v2 = [(PLLibraryServicesManager *)self libraryBundle];
  char v3 = [v2 persistentContainer];
  id v4 = [v3 sharedPersistentStoreCoordinator];

  return (NSPersistentStoreCoordinator *)v4;
}

- (NSURL)libraryURL
{
  uint64_t v2 = [(PLLibraryServicesManager *)self pathManager];
  char v3 = [v2 libraryURL];

  return (NSURL *)v3;
}

- (void)invalidateReverseLocationDataOnAllAssets
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  double v22 = __Block_byref_object_copy__46487;
  id v23 = __Block_byref_object_dispose__46488;
  id v24 = 0;
  uint64_t v15 = 0;
  Class v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  char v3 = [(PLLibraryServicesManager *)self databaseContext];
  id v4 = (void *)[v3 newShortLivedLibraryWithName:"-[PLLibraryServicesManager invalidateReverseLocationDataOnAllAssets]"];

  unint64_t v5 = [v4 managedObjectContext];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __68__PLLibraryServicesManager_invalidateReverseLocationDataOnAllAssets__block_invoke;
  void v11[3] = &unk_1E5875A90;
  uint64_t v13 = &v15;
  id v6 = v5;
  id v12 = v6;
  id v14 = &v19;
  [v4 performTransactionAndWait:v11];
  if (*((unsigned char *)v16 + 24))
  {
    id v7 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(PLLibraryServicesManager *)self logPrefix];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully invalidated reverseLocationDataIsValid on ALL assets", buf, 0xCu);
    }
  }
  else
  {
    id v7 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [(PLLibraryServicesManager *)self logPrefix];
      uint64_t v10 = v20[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      uint64_t v28 = v10;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to invalidate reverseLocationDataIsValid on ALL assets error: %@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

void __68__PLLibraryServicesManager_invalidateReverseLocationDataOnAllAssets__block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  obuint64_t j = *(id *)(v3 + 40);
  BOOL v4 = +[PLManagedAsset invalidateReverseLocationDataOnAllAssetsInManagedObjectContext:v2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (BOOL)updateGreenTeaSavedContactsAuthorizationIfNeeded
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  PLSafeRunWithUnfairLock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __76__PLLibraryServicesManager_updateGreenTeaSavedContactsAuthorizationIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) databaseContext];
  uint64_t v3 = (void *)[v2 newShortLivedLibraryWithName:"-[PLLibraryServicesManager updateGreenTeaSavedContactsAuthorizationIfNeeded]_block_invoke"];

  uint64_t v4 = [v3 globalValues];
  unint64_t v5 = [v4 greenTeaContactsAuthorization];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(MEMORY[0x1E4F1B980], "authorizationStatusForEntityType:", 0));
  if (v5)
  {
    if ([v5 isEqualToNumber:v6]) {
      goto LABEL_9;
    }
    char v7 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) logPrefix];
      int v13 = 138543874;
      id v14 = v8;
      __int16 v15 = 2114;
      Class v16 = v6;
      __int16 v17 = 2114;
      char v18 = v5;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Detected contacts authorization change: currentAuthStatus %{public}@ differs from savedAuthStatus %{public}@", (uint8_t *)&v13, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  uint64_t v9 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [*(id *)(a1 + 32) logPrefix];
    int v13 = 138543618;
    id v14 = v10;
    __int16 v15 = 2114;
    Class v16 = v6;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving new contacts authorization: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  [v4 setGreenTeaContactsAuthorization:v6];
LABEL_9:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v11 = [*(id *)(*(void *)(a1 + 32) + 104) objectValue];
    id v12 = [v11 generator];
    [v12 invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale:1 completionBlock:0];

    [*(id *)(a1 + 32) invalidateReverseLocationDataOnAllAssets];
  }
}

- (BOOL)updateSavedLocaleIfNeeded
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  PLSafeRunWithUnfairLock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __53__PLLibraryServicesManager_updateSavedLocaleIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) databaseContext];
  uint64_t v3 = (void *)[v2 newShortLivedLibraryWithName:"-[PLLibraryServicesManager updateSavedLocaleIfNeeded]_block_invoke"];

  uint64_t v4 = [v3 globalValues];
  unint64_t v5 = [v4 localeIdentifier];
  uint64_t v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  char v7 = [v6 localeIdentifier];

  if (v5)
  {
    if ([v5 isEqualToString:v7]) {
      goto LABEL_9;
    }
    id v8 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) logPrefix];
      int v14 = 138543874;
      __int16 v15 = v9;
      __int16 v16 = 2114;
      __int16 v17 = v7;
      __int16 v18 = 2114;
      uint64_t v19 = v5;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Detected locale change: currentLocaleIdentifier %{public}@ differs from savedLocaleIdentifier %{public}@", (uint8_t *)&v14, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  uint64_t v10 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [*(id *)(a1 + 32) logPrefix];
    int v14 = 138543618;
    __int16 v15 = v11;
    __int16 v16 = 2114;
    __int16 v17 = v7;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving new locale identifier: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  [v4 setLocaleIdentifier:v7];
LABEL_9:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v12 = [*(id *)(*(void *)(a1 + 32) + 104) objectValue];
    int v13 = [v12 generator];
    [v13 invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale:1 completionBlock:0];

    [*(id *)(a1 + 32) invalidateReverseLocationDataOnAllAssets];
  }
}

- (void)currentLocaleDidChangeNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PLLibraryServicesManager *)self state];
  unint64_t v5 = PLLibraryServicesGetLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 < 6)
  {
    if (v6)
    {
      uint64_t v10 = [(PLLibraryServicesManager *)self logPrefix];
      id v11 = PLStringFromLibraryServicesState();
      int v12 = 138543618;
      int v13 = v10;
      __int16 v14 = 2114;
      __int16 v15 = v11;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Library not ready to handle locale change notification (state: %{public}@)", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    if (v6)
    {
      char v7 = [(PLLibraryServicesManager *)self logPrefix];
      int v12 = 138543362;
      int v13 = v7;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating saved locale in response to locale change notification.", (uint8_t *)&v12, 0xCu);
    }
    if ([(PLLibraryServicesManager *)self updateSavedLocaleIfNeeded])
    {
      id v8 = PLLibraryServicesGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [(PLLibraryServicesManager *)self logPrefix];
        int v12 = 138543362;
        int v13 = v9;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting exit due to detected locale change.", (uint8_t *)&v12, 0xCu);
      }
      xpc_transaction_exit_clean();
    }
  }
}

- (void)_initCameraPreviewWellManager
{
  id v3 = objc_initWeak(&location, self);

  id v4 = objc_alloc(MEMORY[0x1E4F8B948]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PLLibraryServicesManager__initCameraPreviewWellManager__block_invoke;
  v7[3] = &unk_1E5874070;
  objc_copyWeak(&v8, &location);
  unint64_t v5 = (PLLazyObject *)[v4 initWithBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  lazyCameraPreviewWellManager = self->_lazyCameraPreviewWellManager;
  self->_lazyCameraPreviewWellManager = v5;
}

PLCameraPreviewWellManager *__57__PLLibraryServicesManager__initCameraPreviewWellManager__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained && [WeakRetained isSystemPhotoLibrary]) {
    id v3 = objc_alloc_init(PLCameraPreviewWellManager);
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (int64_t)_determineWellKnownPhotoLibraryIdentifier
{
  id v3 = (void *)MEMORY[0x1E4F8B980];
  id v4 = [(PLLibraryServicesManager *)self pathManager];
  unint64_t v5 = [v4 libraryURL];
  int64_t v6 = [v3 wellKnownPhotoLibraryIdentifierForURL:v5];

  if (!v6)
  {
    char v7 = (void *)MEMORY[0x1E4F8B980];
    id v8 = [(PLLibraryServicesManager *)self pathManager];
    uint64_t v9 = [v8 libraryURL];
    LODWORD(v6) = [v7 isSystemPhotoLibraryURL:v9];

    return v6;
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = objc_opt_class();
    pathManager = self->_pathManager;
    *(_DWORD *)buf = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    int v12 = pathManager;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc %@", buf, 0x20u);
  }

  v6.receiver = self;
  v6.super_class = (Class)PLLibraryServicesManager;
  [(PLLibraryServicesManager *)&v6 dealloc];
}

- (PLLibraryServicesManager)initWithLibraryBundle:(id)a3 backgroundJobService:(id)a4 cacheDeleteRegistration:(id)a5 delegateClass:(Class)a6
{
  uint64_t v231 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  obuint64_t j = a5;
  id v163 = a4;
  id v164 = a5;
  v224.receiver = self;
  v224.super_class = (Class)PLLibraryServicesManager;
  int v12 = [(PLLibraryServicesManager *)&v224 init];
  if (v12)
  {
    if ((PLIsAssetsd() & 1) == 0)
    {
      v160 = [MEMORY[0x1E4F28B00] currentHandler];
      [v160 handleFailureInMethod:a2 object:v12 file:@"PLLibraryServicesManager.m" lineNumber:274 description:@"Only supposed to be running in assetsd"];
    }
    objc_storeWeak((id *)&v12->_libraryBundle, v11);
    uint64_t v13 = [v11 pathManager];
    pathManager = v12->_pathManager;
    v12->_pathManager = (PLPhotoLibraryPathManager *)v13;

    v12->_wellKnownPhotoLibraryIdentifier = [(PLLibraryServicesManager *)v12 _determineWellKnownPhotoLibraryIdentifier];
    uint64_t v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"LSM-%d-%p", v12->_wellKnownPhotoLibraryIdentifier, v12);
    logPrefix = v12->_logPrefix;
    v12->_logPrefix = (NSString *)v15;

    __int16 v17 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [(PLLibraryServicesManager *)v12 logPrefix];
      uint64_t v19 = (void *)MEMORY[0x1E4F8B8F0];
      uint64_t v20 = [v11 libraryURL];
      uint64_t v21 = [v19 descriptionWithFileURL:v20];
      double v22 = PLStringFromWellKnownPhotoLibraryIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v226 = (uint64_t)v18;
      __int16 v227 = 2112;
      v228 = v21;
      __int16 v229 = 2112;
      id v230 = v22;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Initialized library services manager at path %@ with well known identifier %@", buf, 0x20u);
    }
    dispatch_queue_t v23 = dispatch_queue_create("PLLibraryServicesManager.nodesQueue", 0);
    stateSerializationQueue = v12->_stateSerializationQueue;
    v12->_stateSerializationQueue = (OS_dispatch_queue *)v23;

    char v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutablePendingOperations = v12->_mutablePendingOperations;
    v12->_mutablePendingOperations = v25;

    *(void *)&v12->_importMutex._os_unfair_lock_opaque = 0;
    *(void *)&v12->_localeUpdateLock._os_unfair_lock_opaque = 0;
    __int16 v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    externalWaiterCompletionBlocksByState = v12->_externalWaiterCompletionBlocksByState;
    v12->_externalWaiterCompletionBlocksByState = v27;

    if (a6)
    {
      id v29 = [a6 alloc];
      if (([v29 conformsToProtocol:&unk_1EECD1A58] & 1) == 0)
      {
        v161 = [MEMORY[0x1E4F28B00] currentHandler];
        [v161 handleFailureInMethod:a2, v12, @"PLLibraryServicesManager.m", 290, @"Invalid class '%@' assigned to libraryServicesDelegateClass, must conform to PLLibraryServicesDelegate", a6 object file lineNumber description];
      }
      long long v30 = (void *)[v29 initWithLibraryServicesManager:v12];
      [(PLLibraryServicesManager *)v12 setLibraryServicesDelegate:v30];
      dispatch_queue_t v31 = dispatch_queue_create("PLLibraryServicesManager.helperQueue", 0);
      helperQueue = v12->_helperQueue;
      v12->_helperQueue = (OS_dispatch_queue *)v31;
    }
    __int16 v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v34 = dispatch_queue_attr_make_with_qos_class(v33, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v35 = dispatch_queue_create("album-count-update", v34);
    albumCountQueue = v12->_albumCountQueue;
    v12->_albumCountQueue = (OS_dispatch_queue *)v35;

    id v37 = objc_initWeak((id *)buf, v12);
    id v38 = objc_alloc(MEMORY[0x1E4F8B948]);
    v221[0] = MEMORY[0x1E4F143A8];
    v221[1] = 3221225472;
    v221[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke;
    v221[3] = &unk_1E5870860;
    objc_copyWeak(&v223, (id *)buf);
    id v222 = v11;
    uint64_t v39 = [v38 initWithBlock:v221];

    objc_destroyWeak(&v223);
    objc_destroyWeak((id *)buf);
    lazyDatabaseContext = v12->_lazyDatabaseContext;
    v12->_lazyDatabaseContext = (PLLazyObject *)v39;

    id v41 = objc_initWeak((id *)buf, v12);
    id v42 = objc_alloc(MEMORY[0x1E4F8B948]);
    v219[0] = MEMORY[0x1E4F143A8];
    v219[1] = 3221225472;
    v219[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_2;
    v219[3] = &unk_1E5874070;
    objc_copyWeak(&v220, (id *)buf);
    uint64_t v43 = [v42 initWithBlock:v219];
    objc_destroyWeak(&v220);
    objc_destroyWeak((id *)buf);
    lazyImageWriter = v12->_lazyImageWriter;
    v12->_lazyImageWriter = (PLLazyObject *)v43;

    id v45 = objc_initWeak((id *)buf, v12);
    id v46 = objc_alloc(MEMORY[0x1E4F8B948]);
    v217[0] = MEMORY[0x1E4F143A8];
    v217[1] = 3221225472;
    v217[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_3;
    v217[3] = &unk_1E5874070;
    objc_copyWeak(&v218, (id *)buf);
    uint64_t v47 = [v46 initWithBlock:v217];
    objc_destroyWeak(&v218);
    objc_destroyWeak((id *)buf);
    lazyModelMigrator = v12->_lazyModelMigrator;
    v12->_lazyModelMigrator = (PLLazyObject *)v47;

    id v49 = objc_initWeak((id *)buf, v12);
    id v50 = objc_alloc(MEMORY[0x1E4F8B948]);
    v215[0] = MEMORY[0x1E4F143A8];
    v215[1] = 3221225472;
    v215[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_4;
    v215[3] = &unk_1E5874070;
    objc_copyWeak(&v216, (id *)buf);
    uint64_t v51 = [v50 initWithBlock:v215];
    objc_destroyWeak(&v216);
    objc_destroyWeak((id *)buf);
    lazySearchIndexManager = v12->_lazySearchIndexManager;
    v12->_lazySearchIndexManager = (PLLazyObject *)v51;

    id v53 = objc_initWeak((id *)buf, v12);
    id v54 = objc_alloc(MEMORY[0x1E4F8B948]);
    v213[0] = MEMORY[0x1E4F143A8];
    v213[1] = 3221225472;
    v213[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_5;
    v213[3] = &unk_1E5874070;
    objc_copyWeak(&v214, (id *)buf);
    uint64_t v55 = [v54 initWithBlock:v213];
    objc_destroyWeak(&v214);
    objc_destroyWeak((id *)buf);
    lazySearchIndexingEngine = v12->_lazySearchIndexingEngine;
    v12->_lazySearchIndexingEngine = (PLLazyObject *)v55;

    id v57 = objc_initWeak((id *)buf, v12);
    id v58 = objc_alloc(MEMORY[0x1E4F8B948]);
    v211[0] = MEMORY[0x1E4F143A8];
    v211[1] = 3221225472;
    v211[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_6;
    v211[3] = &unk_1E5874070;
    objc_copyWeak(&v212, (id *)buf);
    uint64_t v59 = [v58 initWithBlock:v211];
    objc_destroyWeak(&v212);
    objc_destroyWeak((id *)buf);
    lazySearchDonationProgress = v12->_lazySearchDonationProgress;
    v12->_lazySearchDonationProgress = (PLLazyObject *)v59;

    id v61 = objc_initWeak((id *)buf, v12);
    id v62 = objc_alloc(MEMORY[0x1E4F8B948]);
    v209[0] = MEMORY[0x1E4F143A8];
    v209[1] = 3221225472;
    v209[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_7;
    v209[3] = &unk_1E5874070;
    objc_copyWeak(&v210, (id *)buf);
    uint64_t v63 = [v62 initWithBlock:v209];
    objc_destroyWeak(&v210);
    objc_destroyWeak((id *)buf);
    lazyMomentGenerationDataManager = v12->_lazyMomentGenerationDataManager;
    v12->_lazyMomentGenerationDataManager = (PLLazyObject *)v63;

    id v65 = objc_initWeak((id *)buf, v12);
    id v66 = objc_alloc(MEMORY[0x1E4F8B948]);
    v207[0] = MEMORY[0x1E4F143A8];
    v207[1] = 3221225472;
    v207[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_8;
    v207[3] = &unk_1E5874070;
    objc_copyWeak(&v208, (id *)buf);
    uint64_t v67 = [v66 initWithBlock:v207];
    objc_destroyWeak(&v208);
    objc_destroyWeak((id *)buf);
    lazyDuplicateProcessor = v12->_lazyDuplicateProcessor;
    v12->_lazyDuplicateProcessor = (PLLazyObject *)v67;

    id v69 = objc_initWeak((id *)buf, v12);
    id v70 = objc_alloc(MEMORY[0x1E4F8B948]);
    v205[0] = MEMORY[0x1E4F143A8];
    v205[1] = 3221225472;
    v205[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_9;
    v205[3] = &unk_1E5874070;
    objc_copyWeak(&v206, (id *)buf);
    uint64_t v71 = [v70 initWithBlock:v205];
    objc_destroyWeak(&v206);
    objc_destroyWeak((id *)buf);
    lazyRebuildJournalManager = v12->_lazyRebuildJournalManager;
    v12->_lazyRebuildJournalManager = (PLLazyObject *)v71;

    id v73 = objc_initWeak((id *)buf, v12);
    id v74 = objc_alloc(MEMORY[0x1E4F8B948]);
    v203[0] = MEMORY[0x1E4F143A8];
    v203[1] = 3221225472;
    v203[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_10;
    v203[3] = &unk_1E5874070;
    objc_copyWeak(&v204, (id *)buf);
    uint64_t v75 = [v74 initWithBlock:v203];
    objc_destroyWeak(&v204);
    objc_destroyWeak((id *)buf);
    lazyComputeCacheManager = v12->_lazyComputeCacheManager;
    v12->_lazyComputeCacheManager = (PLLazyObject *)v75;

    id v77 = objc_initWeak((id *)buf, v12);
    id v78 = objc_alloc(MEMORY[0x1E4F8B948]);
    v201[0] = MEMORY[0x1E4F143A8];
    v201[1] = 3221225472;
    v201[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_11;
    v201[3] = &unk_1E5874070;
    objc_copyWeak(&v202, (id *)buf);
    uint64_t v79 = [v78 initWithBlock:v201];
    objc_destroyWeak(&v202);
    objc_destroyWeak((id *)buf);
    lazyQuickActionManager = v12->_lazyQuickActionManager;
    v12->_lazyQuickActionManager = (PLLazyObject *)v79;

    id v81 = objc_initWeak((id *)buf, v12);
    id v82 = objc_alloc(MEMORY[0x1E4F8B948]);
    v199[0] = MEMORY[0x1E4F143A8];
    v199[1] = 3221225472;
    v199[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_12;
    v199[3] = &unk_1E5874070;
    objc_copyWeak(&v200, (id *)buf);
    uint64_t v83 = [v82 initWithBlock:v199];
    objc_destroyWeak(&v200);
    objc_destroyWeak((id *)buf);
    lazyKeywordManager = v12->_lazyKeywordManager;
    v12->_lazyKeywordManager = (PLLazyObject *)v83;

    objc_storeStrong((id *)&v12->_backgroundJobService, a4);
    id v85 = objc_initWeak((id *)buf, v12);

    id v86 = objc_alloc(MEMORY[0x1E4F8B948]);
    v197[0] = MEMORY[0x1E4F143A8];
    v197[1] = 3221225472;
    v197[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_13;
    v197[3] = &unk_1E5874070;
    objc_copyWeak(&v198, (id *)buf);
    uint64_t v87 = [v86 initWithBlock:v197];
    objc_destroyWeak(&v198);
    objc_destroyWeak((id *)buf);
    lazyPairingManager = v12->_lazyPairingManager;
    v12->_lazyPairingManager = (PLLazyObject *)v87;

    id v89 = objc_initWeak((id *)buf, v12);
    id v90 = objc_alloc(MEMORY[0x1E4F8B948]);
    v195[0] = MEMORY[0x1E4F143A8];
    v195[1] = 3221225472;
    v195[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_14;
    v195[3] = &unk_1E5874070;
    objc_copyWeak(&v196, (id *)buf);
    uint64_t v91 = [v90 initWithBlock:v195];
    objc_destroyWeak(&v196);
    objc_destroyWeak((id *)buf);
    lazyCPLReadiness = v12->_lazyCPLReadiness;
    v12->_lazyCPLReadiness = (PLLazyObject *)v91;

    id v93 = objc_initWeak((id *)buf, v12);
    id v94 = objc_alloc(MEMORY[0x1E4F8B948]);
    v193[0] = MEMORY[0x1E4F143A8];
    v193[1] = 3221225472;
    v193[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_15;
    v193[3] = &unk_1E5874070;
    objc_copyWeak(&v194, (id *)buf);
    uint64_t v95 = [v94 initWithBlock:v193];
    objc_destroyWeak(&v194);
    objc_destroyWeak((id *)buf);
    lazyClientSideEncryptionManager = v12->_lazyClientSideEncryptionManager;
    v12->_lazyClientSideEncryptionManager = (PLLazyObject *)v95;

    id v97 = objc_initWeak((id *)buf, v12);
    id v98 = objc_alloc(MEMORY[0x1E4F8B948]);
    v191[0] = MEMORY[0x1E4F143A8];
    v191[1] = 3221225472;
    v191[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_16;
    v191[3] = &unk_1E5874070;
    objc_copyWeak(&v192, (id *)buf);
    uint64_t v99 = [v98 initWithBlock:v191];
    objc_destroyWeak(&v192);
    objc_destroyWeak((id *)buf);
    lazyDeferredProcessingServiceHandler = v12->_lazyDeferredProcessingServiceHandler;
    v12->_lazyDeferredProcessingServiceHandler = (PLLazyObject *)v99;

    id v101 = objc_initWeak((id *)buf, v12);
    id v102 = objc_alloc(MEMORY[0x1E4F8B948]);
    v189[0] = MEMORY[0x1E4F143A8];
    v189[1] = 3221225472;
    v189[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_17;
    v189[3] = &unk_1E5874070;
    objc_copyWeak(&v190, (id *)buf);
    uint64_t v103 = [v102 initWithBlock:v189];
    objc_destroyWeak(&v190);
    objc_destroyWeak((id *)buf);
    lazyDirectServerConfiguration = v12->_lazyDirectServerConfiguration;
    v12->_lazyDirectServerConfiguration = (PLLazyObject *)v103;

    id v105 = objc_initWeak((id *)buf, v12);
    id v106 = objc_alloc(MEMORY[0x1E4F8B948]);
    v187[0] = MEMORY[0x1E4F143A8];
    v187[1] = 3221225472;
    v187[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_18;
    v187[3] = &unk_1E5874070;
    objc_copyWeak(&v188, (id *)buf);
    uint64_t v107 = [v106 initWithBlock:v187];
    objc_destroyWeak(&v188);
    objc_destroyWeak((id *)buf);
    lazyCPLSettings = v12->_lazyCPLSettings;
    v12->_lazyCPLSettings = (PLLazyObject *)v107;

    id v109 = objc_initWeak((id *)buf, v12);
    id v110 = objc_alloc(MEMORY[0x1E4F8B948]);
    v185[0] = MEMORY[0x1E4F143A8];
    v185[1] = 3221225472;
    v185[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_19;
    v185[3] = &unk_1E5874070;
    objc_copyWeak(&v186, (id *)buf);
    uint64_t v111 = [v110 initWithBlock:v185];
    objc_destroyWeak(&v186);
    objc_destroyWeak((id *)buf);
    lazyAnalysisCoordinator = v12->_lazyAnalysisCoordinator;
    v12->_lazyAnalysisCoordinator = (PLLazyObject *)v111;

    id v113 = objc_initWeak((id *)buf, v12);
    id v114 = objc_alloc(MEMORY[0x1E4F8B948]);
    v183[0] = MEMORY[0x1E4F143A8];
    v183[1] = 3221225472;
    v183[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_20;
    v183[3] = &unk_1E5874070;
    objc_copyWeak(&v184, (id *)buf);
    uint64_t v115 = [v114 initWithRetriableBlock:v183];
    objc_destroyWeak(&v184);
    objc_destroyWeak((id *)buf);
    lazyMainScopeIdentifier = v12->_lazyMainScopeIdentifier;
    v12->_lazyMainScopeIdentifier = (PLLazyObject *)v115;

    id v117 = objc_initWeak((id *)buf, v12);
    id v118 = objc_alloc(MEMORY[0x1E4F8B948]);
    v181[0] = MEMORY[0x1E4F143A8];
    v181[1] = 3221225472;
    v181[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_21;
    v181[3] = &unk_1E5874070;
    objc_copyWeak(&v182, (id *)buf);
    uint64_t v119 = [v118 initWithBlock:v181];
    objc_destroyWeak(&v182);
    objc_destroyWeak((id *)buf);
    lazyAlbumCountCoalescer = v12->_lazyAlbumCountCoalescer;
    v12->_lazyAlbumCountCoalescer = (PLLazyObject *)v119;

    id v121 = objc_initWeak((id *)buf, v12);
    id v122 = objc_alloc(MEMORY[0x1E4F8B948]);
    v179[0] = MEMORY[0x1E4F143A8];
    v179[1] = 3221225472;
    v179[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_22;
    v179[3] = &unk_1E5874070;
    objc_copyWeak(&v180, (id *)buf);
    uint64_t v123 = [v122 initWithBlock:v179];
    objc_destroyWeak(&v180);
    objc_destroyWeak((id *)buf);
    lazyImportSessionCountCoalescer = v12->_lazyImportSessionCountCoalescer;
    v12->_lazyImportSessionCountCoalescer = (PLLazyObject *)v123;

    id v125 = objc_initWeak((id *)buf, v12);
    id v126 = objc_alloc(MEMORY[0x1E4F8B948]);
    v177[0] = MEMORY[0x1E4F143A8];
    v177[1] = 3221225472;
    v177[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_23;
    v177[3] = &unk_1E5874070;
    objc_copyWeak(&v178, (id *)buf);
    uint64_t v127 = [v126 initWithRetriableBlock:v177];
    objc_destroyWeak(&v178);
    objc_destroyWeak((id *)buf);
    lazyCloudPhotoLibraryManager = v12->_lazyCloudPhotoLibraryManager;
    v12->_lazyCloudPhotoLibraryManager = (PLLazyObject *)v127;

    id v129 = objc_initWeak((id *)buf, v12);
    id v130 = objc_alloc(MEMORY[0x1E4F8B948]);
    v175[0] = MEMORY[0x1E4F143A8];
    v175[1] = 3221225472;
    v175[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_24;
    v175[3] = &unk_1E5874070;
    objc_copyWeak(&v176, (id *)buf);
    uint64_t v131 = [v130 initWithBlock:v175];
    objc_destroyWeak(&v176);
    objc_destroyWeak((id *)buf);
    lazyReadyForAnalysis = v12->_lazyReadyForAnalysis;
    v12->_lazyReadyForAnalysis = (PLLazyObject *)v131;

    id v133 = objc_initWeak((id *)buf, v12);
    id v134 = objc_alloc(MEMORY[0x1E4F8B948]);
    v173[0] = MEMORY[0x1E4F143A8];
    v173[1] = 3221225472;
    v173[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_25;
    v173[3] = &unk_1E5874070;
    objc_copyWeak(&v174, (id *)buf);
    uint64_t v135 = [v134 initWithBlock:v173];
    objc_destroyWeak(&v174);
    objc_destroyWeak((id *)buf);
    lazyAvailabilityProgressDelegate = v12->_lazyAvailabilityProgressDelegate;
    v12->_lazyAvailabilityProgressDelegate = (PLLazyObject *)v135;

    id v137 = objc_initWeak((id *)buf, v12);
    id v138 = objc_alloc(MEMORY[0x1E4F8B948]);
    v171[0] = MEMORY[0x1E4F143A8];
    v171[1] = 3221225472;
    v171[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_26;
    v171[3] = &unk_1E5874070;
    objc_copyWeak(&v172, (id *)buf);
    uint64_t v139 = [v138 initWithBlock:v171];
    objc_destroyWeak(&v172);
    objc_destroyWeak((id *)buf);
    lazyAvailabilityTransitionDelegate = v12->_lazyAvailabilityTransitionDelegate;
    v12->_lazyAvailabilityTransitionDelegate = (PLLazyObject *)v139;

    id v141 = objc_initWeak((id *)buf, v12);
    id v142 = objc_alloc(MEMORY[0x1E4F8B948]);
    v169[0] = MEMORY[0x1E4F143A8];
    v169[1] = 3221225472;
    v169[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_27;
    v169[3] = &unk_1E5874070;
    objc_copyWeak(&v170, (id *)buf);
    uint64_t v143 = [v142 initWithBlock:v169];
    objc_destroyWeak(&v170);
    objc_destroyWeak((id *)buf);
    lazyAvailabilityComputer = v12->_lazyAvailabilityComputer;
    v12->_lazyAvailabilityComputer = (PLLazyObject *)v143;

    id v145 = objc_initWeak((id *)buf, v12);
    id v146 = objc_alloc(MEMORY[0x1E4F8B948]);
    v167[0] = MEMORY[0x1E4F143A8];
    v167[1] = 3221225472;
    v167[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_28;
    v167[3] = &unk_1E5874070;
    objc_copyWeak(&v168, (id *)buf);
    uint64_t v147 = [v146 initWithBlock:v167];
    objc_destroyWeak(&v168);
    objc_destroyWeak((id *)buf);
    lazyCloudIdentifierReservationSupport = v12->_lazyCloudIdentifierReservationSupport;
    v12->_lazyCloudIdentifierReservationSupport = (PLLazyObject *)v147;

    id v149 = objc_initWeak((id *)buf, v12);
    id v150 = objc_alloc(MEMORY[0x1E4F8B948]);
    v165[0] = MEMORY[0x1E4F143A8];
    v165[1] = 3221225472;
    v165[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_29;
    v165[3] = &unk_1E5874070;
    objc_copyWeak(&v166, (id *)buf);
    uint64_t v151 = [v150 initWithBlock:v165];
    objc_destroyWeak(&v166);
    objc_destroyWeak((id *)buf);
    lazyFingerprintContext = v12->_lazyFingerprintContext;
    v12->_lazyFingerprintContext = (PLLazyObject *)v151;

    v12->_outstandingTransactionHandlerTimerLock._os_unfair_lock_opaque = 0;
    *(void *)&v12->_resourceCacheMetrics.imageCacheHitCount = 0;
    *(void *)&v12->_resourceCacheMetrics.videoComplementCacheHitCount = 0;
    [(PLLibraryServicesManager *)v12 _initSystemPhotoLibrarySpecificServices];
    if ([(PLLibraryServicesManager *)v12 isSyndicationPhotoLibrary]) {
      [(PLLibraryServicesManager *)v12 _initSyndicationPhotoLibrarySpecificServices];
    }
    v12->_maxWaiterQoS = 9;
    objc_storeStrong((id *)&v12->_cacheDeleteRegistration, obj);
    id v153 = objc_alloc(MEMORY[0x1E4F8A228]);
    v154 = [(PLLibraryServicesManager *)v12 logPrefix];
    uint64_t v155 = [v153 initWithProvider:v12 name:v154];
    stateHandler = v12->_stateHandler;
    v12->_stateHandler = (PFStateCaptureHandler *)v155;
  }
  v157 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v158 = objc_opt_class();
    *(_DWORD *)buf = 138412802;
    uint64_t v226 = v158;
    __int16 v227 = 2048;
    v228 = v12;
    __int16 v229 = 2112;
    id v230 = v11;
    _os_log_impl(&dword_19B3C7000, v157, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryBundle:%@", buf, 0x20u);
  }

  return v12;
}

PLDatabaseContext *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    id v3 = [[PLDatabaseContext alloc] initWithLibraryBundle:*(void *)(a1 + 32)];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

PLImageWriter *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    char v2 = [[PLImageWriter alloc] initWithLibraryServicesManager:WeakRetained];
  }
  else {
    char v2 = 0;
  }

  return v2;
}

PLModelMigrator *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v2 = [PLModelMigrator alloc];
    id v3 = [WeakRetained pathManager];
    uint64_t v4 = [(PLModelMigrator *)v2 initWithPathManager:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newSearchIndexManager];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newSearchIndexingEngine];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newSearchDonationProgress];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newMomentGenerationDataManager];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

PLDuplicateProcessor *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    char v2 = [[PLDuplicateProcessor alloc] initWithLibraryServicesManager:WeakRetained];
  }
  else {
    char v2 = 0;
  }

  return v2;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newRebuildJournalManager];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newComputeCacheManager];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

PLQuickActionManager *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v2 = [PLQuickActionManager alloc];
    id v3 = [WeakRetained databaseContext];
    uint64_t v4 = [(PLQuickActionManager *)v2 initWithDatabaseContext:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

PLKeywordManager *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v2 = [PLKeywordManager alloc];
    id v3 = [WeakRetained pathManager];
    uint64_t v4 = [(PLKeywordManager *)v2 initWithPathManager:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

PLPairing *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    char v2 = objc_alloc_init(PLPairing);
  }
  else {
    char v2 = 0;
  }

  return v2;
}

PLLibraryServicesCPLReadiness *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    char v2 = [[PLLibraryServicesCPLReadiness alloc] initWithLibraryServicesManager:WeakRetained];
  }
  else {
    char v2 = 0;
  }

  return v2;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newClientSideEncryptionManager];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

PLDeferredProcessingServiceHandler *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_16(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    char v2 = objc_alloc_init(PLDeferredProcessingServiceHandler);
  }
  else {
    char v2 = 0;
  }

  return v2;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_17(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newDirectServerConfiguration];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

PLCPLSettings *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v2 = [PLCPLSettings alloc];
    id v3 = [WeakRetained libraryBundle];
    uint64_t v4 = [(PLCPLSettings *)v2 initWithLibraryBundle:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

PLAnalysisCoordinator *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_19(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    char v2 = [[PLAnalysisCoordinator alloc] initWithLibraryServicesManager:WeakRetained];
  }
  else {
    char v2 = 0;
  }

  return v2;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained && [WeakRetained isCPLSyncablePhotoLibrary])
  {
    id v3 = [v2 cplSettings];
    uint64_t v4 = [v3 deriveMainScopeIdentifier];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_21(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newAlbumCountCoalescer];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_22(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newImportSessionCountCoalescer];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_23(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newCloudPhotoLibraryManager];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

PLReadyForAnalysis *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_24(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    char v2 = [[PLReadyForAnalysis alloc] initWithLibraryServicesManager:WeakRetained];
  }
  else {
    char v2 = 0;
  }

  return v2;
}

PLFeatureAvailabilityProgressDelegate *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_25(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    char v2 = [[PLFeatureAvailabilityProgressDelegate alloc] initWithLibraryServicesManager:WeakRetained];
  }
  else {
    char v2 = 0;
  }

  return v2;
}

PLFeatureAvailabilityTransitionDelegate *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_26(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    char v2 = [[PLFeatureAvailabilityTransitionDelegate alloc] initWithLibraryServicesManager:WeakRetained];
  }
  else {
    char v2 = 0;
  }

  return v2;
}

PLFeatureAvailabilityComputer *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_27(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v2 = [PLFeatureAvailabilityComputer alloc];
    id v3 = [WeakRetained availabilityTransitionDelegate];
    uint64_t v4 = [WeakRetained availabilityProgressDelegate];
    unint64_t v5 = [(PLFeatureAvailabilityComputer *)v2 initWithTransitionDelegate:v3 progressDelegate:v4];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

PLCloudIdentifierReservationSupport *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_28(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    char v2 = objc_alloc_init(PLCloudIdentifierReservationSupport);
  }
  else {
    char v2 = 0;
  }

  return v2;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_29(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained cplSettings];
    uint64_t v4 = [v3 fingerprintContext];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)statusDescription
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLLibraryServicesManager *)self activeOperations];
  uint64_t v4 = [(PLLibraryServicesManager *)self pendingOperations];
  unint64_t v5 = (void *)MEMORY[0x1E4F28E78];
  objc_super v6 = [(PLLibraryServicesManager *)self libraryURL];
  char v7 = [v6 path];
  uint64_t v8 = [(PLLibraryServicesManager *)self currentStateNode];
  [v8 state];
  __int16 v9 = PLStringFromLibraryServicesState();
  uint64_t v10 = [v5 stringWithFormat:@"%@ [%@, %d active, %d pending]\n", v7, v9, objc_msgSend(v3, "count"), objc_msgSend(v4, "count")];

  if ([v3 count])
  {
    [v10 appendFormat:@"  Active operations\n"];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v3;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v11);
          }
          __int16 v17 = [*(id *)(*((void *)&v30 + 1) + 8 * i) statusDescription];
          [v10 appendFormat:@"  %d: %@\n", v14 + i, v17];
        }
        uint64_t v14 = (v14 + i);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v13);
    }
  }
  if ([v4 count])
  {
    [v10 appendFormat:@"  Pending operations\n"];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v18 = v4;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v18);
          }
          id v24 = [*(id *)(*((void *)&v26 + 1) + 8 * j) statusDescription];
          [v10 appendFormat:@"  %d: %@\n", v21 + j, v24];
        }
        uint64_t v21 = (v21 + j);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v20);
    }
  }
  return v10;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p> %@", objc_opt_class(), self, self->_pathManager];
}

+ (id)errorForInvalidationError:(id)a3 userInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [v5 domain];
  uint64_t v8 = *MEMORY[0x1E4F8C500];
  int v9 = [v7 isEqualToString:*MEMORY[0x1E4F8C500]];

  if (v9)
  {
    id v10 = v5;
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F28A50];
    if (v5)
    {
      uint64_t v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      if (!v12)
      {
        id v13 = objc_alloc(MEMORY[0x1E4F1CA60]);
        if (v6) {
          id v14 = v6;
        }
        else {
          id v14 = (id)MEMORY[0x1E4F1CC08];
        }
        uint64_t v15 = (void *)[v13 initWithDictionary:v14];
        [v15 setObject:v5 forKeyedSubscript:v11];

        id v6 = v15;
      }
    }
    uint64_t v16 = [v6 objectForKeyedSubscript:v11];
    if (PLIsErrorEqualToCode()) {
      uint64_t v17 = 46516;
    }
    else {
      uint64_t v17 = 43002;
    }
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:v8 code:v17 userInfo:v6];
  }
  return v10;
}

+ (int64_t)_finalState
{
  return 8;
}

+ (int64_t)_initialState
{
  return 1;
}

+ (void)setLibraryServicesDelegateClass:(Class)a3
{
  _libraryServicesDelegateClass = (uint64_t)a3;
}

- (void)performTransactionForSyndicationDeleteManager:(id)a3 name:(const char *)a4 transaction:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [(PLLibraryServicesManager *)self databaseContext];
  int v9 = (void *)[v8 newShortLivedLibraryWithName:a4];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __126__PLLibraryServicesManager_PLSyndicationDeleteEngineDelegate__performTransactionForSyndicationDeleteManager_name_transaction___block_invoke;
  v12[3] = &unk_1E58742F0;
  id v13 = v9;
  id v14 = v7;
  id v10 = v9;
  id v11 = v7;
  [v10 performTransactionAndWait:v12];
}

void __126__PLLibraryServicesManager_PLSyndicationDeleteEngineDelegate__performTransactionForSyndicationDeleteManager_name_transaction___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

@end