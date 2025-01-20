@interface PLFakeCPLLibraryManager
+ (id)fakeCPLStatusBaseURLWithBaseURL:(id)a3;
+ (id)forwardingTargetForSelector:(SEL)a3;
- (CPLConfiguration)configuration;
- (CPLLibraryManagerDelegate)delegate;
- (CPLLibraryManagerForceSyncDelegate)forceSyncDelegate;
- (CPLRecordComputeStateDelegate)recordComputeStateDelegate;
- (CPLResourceProgressDelegate)resourceProgressDelegate;
- (CPLStatus)syncStatus;
- (NSURL)baseURL;
- (NSURL)fakeBaseURL;
- (PLFakeCPLLibraryManager)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 options:(unint64_t)a7;
- (id)forwardingTargetForSelector:(SEL)a3;
- (unint64_t)estimatedInitialAssetCountForLocalLibrary;
- (unint64_t)estimatedInitialSizeForLocalLibrary;
- (unint64_t)numberOfImagesToUpload;
- (unint64_t)numberOfOtherItemsToUpload;
- (unint64_t)numberOfVideosToUpload;
- (unint64_t)sizeOfOriginalResourcesToUpload;
- (unint64_t)sizeOfResourcesToUpload;
- (unint64_t)state;
- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4;
- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 highPriority:(BOOL)a5 completionHandler:(id)a6;
- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7;
- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5;
- (void)beginPullChangeSessionWithKnownLibraryVersion:(id)a3 completionHandler:(id)a4;
- (void)beginPushChangeSessionWithKnownLibraryVersion:(id)a3 completionHandler:(id)a4;
- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3;
- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- (void)createOwnedLibraryShareScopeWithShare:(id)a3 title:(id)a4 completionHandler:(id)a5;
- (void)createScope:(id)a3 completionHandler:(id)a4;
- (void)deactivateWithCompletionHandler:(id)a3;
- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- (void)disableMainScopeWithCompletionHandler:(id)a3;
- (void)enableMainScopeWithCompletionHandler:(id)a3;
- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4;
- (void)forceBackupWithCompletionHandler:(id)a3;
- (void)forceSynchronizingScopeWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getCloudCacheForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getCloudIdentifiersForLocalIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getCloudScopedIdentifiersForLocalScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4;
- (void)getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5;
- (void)getStatusForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getStreamingURLOrMediaMakerDataForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8;
- (void)getSystemBudgetsWithCompletionHandler:(id)a3;
- (void)openWithCompletionHandler:(id)a3;
- (void)queryUserDetailsForShareParticipants:(id)a3 completionHandler:(id)a4;
- (void)removeParticipants:(id)a3 fromSharedScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7;
- (void)resolveLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setEstimatedInitialAssetCountForLocalLibrary:(unint64_t)a3;
- (void)setEstimatedInitialSizeForLocalLibrary:(unint64_t)a3;
- (void)setForceSyncDelegate:(id)a3;
- (void)setRecordComputeStateDelegate:(id)a3;
- (void)setResourceProgressDelegate:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3;
- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6;
- (void)updateShareForScope:(id)a3 completionHandler:(id)a4;
@end

@implementation PLFakeCPLLibraryManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeBaseURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_destroyWeak((id *)&self->_forceSyncDelegate);
  objc_destroyWeak((id *)&self->_recordComputeStateDelegate);
  objc_destroyWeak((id *)&self->_resourceProgressDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_syncStatus, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSURL)fakeBaseURL
{
  return self->_fakeBaseURL;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setForceSyncDelegate:(id)a3
{
}

- (CPLLibraryManagerForceSyncDelegate)forceSyncDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forceSyncDelegate);
  return (CPLLibraryManagerForceSyncDelegate *)WeakRetained;
}

- (void)setRecordComputeStateDelegate:(id)a3
{
}

- (CPLRecordComputeStateDelegate)recordComputeStateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordComputeStateDelegate);
  return (CPLRecordComputeStateDelegate *)WeakRetained;
}

- (void)setResourceProgressDelegate:(id)a3
{
}

- (CPLResourceProgressDelegate)resourceProgressDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourceProgressDelegate);
  return (CPLResourceProgressDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CPLLibraryManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CPLLibraryManagerDelegate *)WeakRetained;
}

- (void)setEstimatedInitialAssetCountForLocalLibrary:(unint64_t)a3
{
  self->_estimatedInitialAssetCountForLocalLibrary = a3;
}

- (unint64_t)estimatedInitialAssetCountForLocalLibrary
{
  return self->_estimatedInitialAssetCountForLocalLibrary;
}

- (void)setEstimatedInitialSizeForLocalLibrary:(unint64_t)a3
{
  self->_estimatedInitialSizeForLocalLibrary = a3;
}

- (unint64_t)estimatedInitialSizeForLocalLibrary
{
  return self->_estimatedInitialSizeForLocalLibrary;
}

- (unint64_t)numberOfOtherItemsToUpload
{
  return self->_numberOfOtherItemsToUpload;
}

- (unint64_t)numberOfVideosToUpload
{
  return self->_numberOfVideosToUpload;
}

- (unint64_t)numberOfImagesToUpload
{
  return self->_numberOfImagesToUpload;
}

- (unint64_t)sizeOfOriginalResourcesToUpload
{
  return self->_sizeOfOriginalResourcesToUpload;
}

- (unint64_t)sizeOfResourcesToUpload
{
  return self->_sizeOfResourcesToUpload;
}

- (CPLConfiguration)configuration
{
  return self->_configuration;
}

- (CPLStatus)syncStatus
{
  return self->_syncStatus;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PLFakeCPLLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

void __65__PLFakeCPLLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager getSystemBudgetsWithCompletionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__PLFakeCPLLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __92__PLFakeCPLLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 highPriority:(BOOL)a5 completionHandler:(id)a6
{
  id v7 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PLFakeCPLLibraryManager_beginDownloadForResource_clientBundleID_highPriority_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, block);
}

uint64_t __98__PLFakeCPLLibraryManager_beginDownloadForResource_clientBundleID_highPriority_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7
{
  id v8 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__PLFakeCPLLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, block);
}

uint64_t __116__PLFakeCPLLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getStreamingURLOrMediaMakerDataForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  id v9 = a8;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __126__PLFakeCPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(queue, block);
}

void __126__PLFakeCPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager getStreamingURLOrMediaMakerDataForResource:intent:hints:timeRange:clientBundleID:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void, void, void, void *))(v1 + 16))(v1, 0, 0, 0, 0, v3);
}

- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__PLFakeCPLLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke;
  v12[3] = &unk_1E58742F0;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, v12);
}

void __97__PLFakeCPLLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v8 = (void *)MEMORY[0x1E4F59868];
        id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s does not support resource prune", "-[PLFakeCPLLibraryManager checkResourcesAreSafeToPrune:checkServerIfNecessary:completionHandler:]_block_invoke");
        id v10 = [v8 cplErrorWithCode:1002, @"%@", v9 description];
        [v2 setObject:v10 forKeyedSubscript:v7];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = (void *)[v2 copy];
  (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
}

- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__PLFakeCPLLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke;
  v12[3] = &unk_1E58742F0;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, v12);
}

void __84__PLFakeCPLLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v8 = (void *)MEMORY[0x1E4F59868];
        id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s does not support resource deletions", "-[PLFakeCPLLibraryManager deleteResources:checkServerIfNecessary:completionHandler:]_block_invoke");
        id v10 = [v8 cplErrorWithCode:1002, @"%@", v9 description];
        [v2 setObject:v10 forKeyedSubscript:v7];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = (void *)[v2 copy];
  (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
}

- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PLFakeCPLLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

void __85__PLFakeCPLLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager checkHasBackgroundDownloadOperationsWithCompletionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)resolveLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PLFakeCPLLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __100__PLFakeCPLLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager resolveLocalScopedIdentifiersForCloudScopedIdentifiers:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)getCloudScopedIdentifiersForLocalScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PLFakeCPLLibraryManager_getCloudScopedIdentifiersForLocalScopedIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __96__PLFakeCPLLibraryManager_getCloudScopedIdentifiersForLocalScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager getCloudScopedIdentifiersForLocalScopedIdentifiers:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)getCloudCacheForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PLFakeCPLLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __88__PLFakeCPLLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager getCloudCacheForRecordWithScopedIdentifier:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PLFakeCPLLibraryManager_getStatusForComponents_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __68__PLFakeCPLLibraryManager_getStatusForComponents_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager getStatusForComponents:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)getCloudIdentifiersForLocalIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PLFakeCPLLibraryManager_getCloudIdentifiersForLocalIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __84__PLFakeCPLLibraryManager_getCloudIdentifiersForLocalIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager getCloudIdentifiersForLocalIdentifiers:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)getStatusForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__PLFakeCPLLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke;
  v11[3] = &unk_1E58742F0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);
}

void __86__PLFakeCPLLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v14 = a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * v7);
        id v9 = objc_alloc(MEMORY[0x1E4F59930]);
        id v10 = (void *)[MEMORY[0x1E4F59910] newRecordWithScopedIdentifier:v8];
        uint64_t v11 = (void *)[v9 initWithRecord:v10 generation:0];

        [v11 setUploaded:1];
        [v2 setObject:v11 forKey:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  uint64_t v12 = *(void *)(v14 + 40);
  id v13 = (void *)[v2 copy];
  (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v13, 0);
}

- (void)forceBackupWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PLFakeCPLLibraryManager_forceBackupWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

uint64_t __60__PLFakeCPLLibraryManager_forceBackupWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)beginPullChangeSessionWithKnownLibraryVersion:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__PLFakeCPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_completionHandler___block_invoke;
  v8[3] = &unk_1E58742F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __91__PLFakeCPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[PLFakeCPLPullChangeSession alloc] initWithLibraryManager:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 8)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)beginPushChangeSessionWithKnownLibraryVersion:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__PLFakeCPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_completionHandler___block_invoke;
  v8[3] = &unk_1E58742F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __91__PLFakeCPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[PLFakeCPLPushChangeSession alloc] initWithLibraryManager:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 8)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)queryUserDetailsForShareParticipants:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PLFakeCPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __82__PLFakeCPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager queryUserDetailsForShareParticipants:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)forceSynchronizingScopeWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PLFakeCPLLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

uint64_t __84__PLFakeCPLLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PLFakeCPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __81__PLFakeCPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager boostPriorityForScopeWithIdentifier:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PLFakeCPLLibraryManager_acceptSharedScope_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __63__PLFakeCPLLibraryManager_acceptSharedScope_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager acceptSharedScope:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PLFakeCPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __74__PLFakeCPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager fetchSharedScopeFromShareURL:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v6 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__PLFakeCPLLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __112__PLFakeCPLLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager getStatusForPendingRecordsSharedToScopeWithIdentifier:maximumCount:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)getScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PLFakeCPLLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __88__PLFakeCPLLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager getScopeStatusCountsForScopeWithIdentifier:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)updateShareForScope:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PLFakeCPLLibraryManager_updateShareForScope_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __65__PLFakeCPLLibraryManager_updateShareForScope_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager updateShareForScope:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)createOwnedLibraryShareScopeWithShare:(id)a3 title:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PLFakeCPLLibraryManager_createOwnedLibraryShareScopeWithShare_title_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __89__PLFakeCPLLibraryManager_createOwnedLibraryShareScopeWithShare_title_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager createOwnedLibraryShareScopeWithShare:title:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)createScope:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PLFakeCPLLibraryManager_createScope_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __57__PLFakeCPLLibraryManager_createScope_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager createScope:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PLFakeCPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

uint64_t __71__PLFakeCPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeParticipants:(id)a3 fromSharedScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7
{
  id v8 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__PLFakeCPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, block);
}

void __121__PLFakeCPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager removeParticipants:fromSharedScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6
{
  id v7 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__PLFakeCPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, block);
}

void __111__PLFakeCPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F59868];
  objc_msgSend(NSString, "stringWithFormat:", @"%s does not support this action", "-[PLFakeCPLLibraryManager startExitFromSharedScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:]_block_invoke");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 cplErrorWithCode:1002, @"%@", v4 description];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)deactivateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PLFakeCPLLibraryManager_deactivateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58742F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __59__PLFakeCPLLibraryManager_deactivateWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PLFakeCPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

uint64_t __73__PLFakeCPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)disableMainScopeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PLFakeCPLLibraryManager_disableMainScopeWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

uint64_t __65__PLFakeCPLLibraryManager_disableMainScopeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableMainScopeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PLFakeCPLLibraryManager_enableMainScopeWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5875198;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

uint64_t __64__PLFakeCPLLibraryManager_enableMainScopeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PLFakeCPLLibraryManager_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58742F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __53__PLFakeCPLLibraryManager_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = 2;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (PLFakeCPLLibraryManager)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 options:(unint64_t)a7
{
  id v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PLFakeCPLLibraryManager;
  id v10 = [(PLFakeCPLLibraryManager *)&v24 init];
  if (v10)
  {
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v13 = dispatch_queue_create("PLFakeCPLLibraryManager", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v10->_baseURL, a3);
    uint64_t v15 = [(id)objc_opt_class() fakeCPLStatusBaseURLWithBaseURL:v9];
    fakeBaseURL = v10->_fakeBaseURL;
    v10->_fakeBaseURL = (NSURL *)v15;

    v10->_state = 0;
    id v17 = objc_alloc(MEMORY[0x1E4F59998]);
    long long v18 = [(id)objc_opt_class() fakeCPLStatusBaseURLWithBaseURL:v9];
    uint64_t v19 = [v17 initWithClientLibraryBaseURL:v18];
    syncStatus = v10->_syncStatus;
    v10->_syncStatus = (CPLStatus *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F59850]) initWithClientLibraryBaseURL:v9];
    configuration = v10->_configuration;
    v10->_configuration = (CPLConfiguration *)v21;
  }
  return v10;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return 0;
}

+ (id)fakeCPLStatusBaseURLWithBaseURL:(id)a3
{
  id v3 = [a3 URLByDeletingLastPathComponent];
  id v4 = [v3 URLByAppendingPathComponent:@"PLFakeCPLLibraryManager"];

  return v4;
}

+ (id)forwardingTargetForSelector:(SEL)a3
{
  return 0;
}

@end