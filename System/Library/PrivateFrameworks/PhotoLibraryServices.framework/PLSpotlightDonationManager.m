@interface PLSpotlightDonationManager
+ (BOOL)_deleteAllSearchableItemsForSystemPhotoLibraryWithError:(id *)a3;
+ (id)_photolibraryDatabaseUUIDForPhotolibraryWithURL:(id)a3;
+ (void)handleDeletionForPhotoLibraryWithURL:(id)a3 completion:(id)a4;
- (BOOL)_acquireSpotlightSandboxExtensionIfNeeded;
- (CSManagedSearchableIndex)managedSpotlightIndex;
- (CSSearchableIndex)spotlightIndex;
- (NSOperationQueue)operationQueue;
- (NSString)photoLibraryTypeDescription;
- (PLPhotoLibrary)photoLibrary;
- (PLSpotlightDonationManager)initWithPhotoLibrary:(id)a3;
- (id)spotlightDonationManagerLog;
- (unint64_t)deleteAllSearchableItemsFromSpotlight;
- (unint64_t)deleteItemsFromSpotlightWithSearchableItemIdentifiers:(id)a3;
- (unint64_t)donateSearchableItemsToSpotlight:(id)a3 bundleIdentifier:(id)a4;
- (unint64_t)pendingOperationCount;
- (void)_releaseSpotlightSandboxExtension;
- (void)_signPostIntervalForOperationType:(unint64_t)a3 searchableItemCount:(unint64_t)a4 isBegin:(BOOL)a5;
- (void)addOperationCountObserver:(id)a3;
- (void)beginSignpostIntervalForOperationType:(unint64_t)a3 searchableItemCount:(unint64_t)a4;
- (void)dealloc;
- (void)deleteAllSearchableItemsWithCompletion:(id)a3;
- (void)deleteSearchableItemsWithIdentifiers:(id)a3;
- (void)disableUISearch;
- (void)donateSearchableItems:(id)a3 bundleIdentifier:(id)a4;
- (void)endSignpostIntervalForOperationType:(unint64_t)a3 searchableItemCount:(unint64_t)a4;
- (void)removeOperationCountObserver:(id)a3;
- (void)setPhotoLibraryTypeDescription:(id)a3;
- (void)setSpotlightOperationQueueSuspended:(BOOL)a3;
@end

@implementation PLSpotlightDonationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryTypeDescription, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_managedSpotlightIndex, 0);
  objc_storeStrong((id *)&self->_spotlightIndex, 0);
}

- (void)setPhotoLibraryTypeDescription:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (CSManagedSearchableIndex)managedSpotlightIndex
{
  return self->_managedSpotlightIndex;
}

- (CSSearchableIndex)spotlightIndex
{
  return self->_spotlightIndex;
}

- (unint64_t)deleteAllSearchableItemsFromSpotlight
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  v3 = [(PLSpotlightDonationManager *)self photoLibrary];
  v4 = [v3 libraryServicesManager];
  BOOL v5 = [v4 wellKnownPhotoLibraryIdentifier] == 3;

  if (v5)
  {
    v6 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543362;
      v35 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "Unsupported %{public}@. Ignoring request to delete all items.", buf, 0xCu);
    }
    unint64_t v8 = v30[3];
  }
  else
  {
    v9 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543362;
      v35 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Preparing to delete all items from Spotlight for %{public}@", buf, 0xCu);
    }
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    v12 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
    v13 = [v3 libraryServicesManager];
    v14 = +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", [v13 wellKnownPhotoLibraryIdentifier]);

    v15 = [(PLSpotlightDonationManager *)self spotlightIndex];
    v33 = v14;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __67__PLSpotlightDonationManager_deleteAllSearchableItemsFromSpotlight__block_invoke;
    v25 = &unk_1E586C2A0;
    v28 = &v29;
    v26 = self;
    v17 = v11;
    v27 = v17;
    [v15 deleteSearchableItemsWithDomainIdentifiers:v16 protectionClass:0 forBundleID:v12 options:0 completionHandler:&v22];

    dispatch_time_t v18 = dispatch_time(0, 20000000000);
    if (dispatch_semaphore_wait(v17, v18))
    {
      v19 = PLSearchBackendDonationsGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543362;
        v35 = v20;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Timed-out trying to delete all items from Spotlight for %{public}@", buf, 0xCu);
      }
      unint64_t v8 = 3;
      v30[3] = 3;
    }
    else
    {
      unint64_t v8 = v30[3];
    }
  }
  _Block_object_dispose(&v29, 8);
  return v8;
}

void __67__PLSpotlightDonationManager_deleteAllSearchableItemsFromSpotlight__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = 1;
  if (v3) {
    uint64_t v4 = 2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v6 = PLSearchBackendDonationsGetLog();
  v7 = v6;
  if (v5 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
      int v13 = 138543362;
      v14 = v8;
      v9 = "Successfully deleted all items from Spotlight for %{public}@.";
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_8:
      _os_log_impl(&dword_19B3C7000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    unint64_t v8 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    int v13 = 138543618;
    v14 = v8;
    __int16 v15 = 2114;
    id v16 = v3;
    v9 = "Failed to delete all items from Spotlight for %{public}@. Error: %{public}@";
    v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_8;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (unint64_t)deleteItemsFromSpotlightWithSearchableItemIdentifiers:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  if ([v4 count])
  {
    uint64_t v5 = [(PLSpotlightDonationManager *)self photoLibrary];
    v6 = [v5 libraryServicesManager];
    BOOL v7 = [v6 wellKnownPhotoLibraryIdentifier] == 1;

    if (v7)
    {
      unint64_t v8 = PLSearchBackendDonationsGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138412546;
        uint64_t v32 = v9;
        __int16 v33 = 2114;
        id v34 = v4;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "Preparing to delete items for %@ from Spotlight. Items: %{public}@", buf, 0x16u);
      }
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      os_log_type_t v11 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
      uint32_t v12 = [(PLSpotlightDonationManager *)self spotlightIndex];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __84__PLSpotlightDonationManager_deleteItemsFromSpotlightWithSearchableItemIdentifiers___block_invoke;
      v22[3] = &unk_1E586C278;
      v26 = &v27;
      id v13 = v4;
      id v23 = v13;
      v24 = self;
      v14 = v10;
      v25 = v14;
      [v12 indexSearchableItems:0 deleteSearchableItemsWithIdentifiers:v13 clientState:0 protectionClass:0 forBundleID:v11 options:0 completionHandler:v22];

      dispatch_time_t v15 = dispatch_time(0, 20000000000);
      if (dispatch_semaphore_wait(v14, v15))
      {
        id v16 = PLSearchBackendDonationsGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
          *(_DWORD *)buf = 138412546;
          uint64_t v32 = v17;
          __int16 v33 = 2114;
          id v34 = v13;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Timed-out trying to delete items for %@ from Spotlight. Items: %{public}@", buf, 0x16u);
        }
        unint64_t v18 = 3;
        v28[3] = 3;
      }
      else
      {
        unint64_t v18 = v28[3];
      }
    }
    else
    {
      v19 = PLSearchBackendDonationsGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v20;
        __int16 v33 = 2114;
        id v34 = v4;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_INFO, "Unsupported PhotoLibrary. Ignoring request to delete items for %{public}@. Items: %{public}@", buf, 0x16u);
      }
      unint64_t v18 = v28[3];
    }
  }
  else
  {
    unint64_t v18 = v28[3];
  }
  _Block_object_dispose(&v27, 8);

  return v18;
}

void __84__PLSpotlightDonationManager_deleteItemsFromSpotlightWithSearchableItemIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = 1;
  if (v3) {
    uint64_t v4 = 2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v4;
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  v6 = PLSearchBackendDonationsGetLog();
  BOOL v7 = v6;
  if (v5 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 32) count];
      v9 = [*(id *)(a1 + 40) photoLibraryTypeDescription];
      int v12 = 134349314;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Successfully deleted %{public}lu items from Spotlight for %{public}@.", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    dispatch_semaphore_t v10 = [*(id *)(a1 + 40) photoLibraryTypeDescription];
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138543874;
    uint64_t v13 = (uint64_t)v10;
    __int16 v14 = 2114;
    id v15 = v3;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to delete items from Spotlight for %{public}@. Error: %{public}@. Items: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (unint64_t)donateSearchableItemsToSpotlight:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  if ([v6 count])
  {
    uint64_t v8 = objc_msgSend(v6, "_pl_map:", &__block_literal_global_104_60579);
    v9 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      dispatch_semaphore_t v10 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = (uint64_t)v7;
      __int16 v34 = 2112;
      uint64_t v35 = v10;
      __int16 v36 = 2114;
      id v37 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Preparing to donate items for Bundle: %{public}@ for %@. Items: %{public}@", buf, 0x20u);
    }
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    int v12 = [(PLSpotlightDonationManager *)self spotlightIndex];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __80__PLSpotlightDonationManager_donateSearchableItemsToSpotlight_bundleIdentifier___block_invoke_105;
    v22[3] = &unk_1E586C250;
    uint64_t v27 = &v28;
    id v13 = v6;
    id v23 = v13;
    v24 = self;
    id v14 = v8;
    id v25 = v14;
    id v15 = v11;
    v26 = v15;
    [v12 indexSearchableItems:v13 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:0 forBundleID:v7 options:0 completionHandler:v22];

    dispatch_time_t v16 = dispatch_time(0, 20000000000);
    if (dispatch_semaphore_wait(v15, v16))
    {
      uint64_t v17 = PLSearchBackendDonationsGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = [v13 count];
        v19 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 134349570;
        uint64_t v33 = v18;
        __int16 v34 = 2114;
        uint64_t v35 = v19;
        __int16 v36 = 2114;
        id v37 = v14;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Timed-out trying to donate %{public}ld items for %{public}@. Items %{public}@", buf, 0x20u);
      }
      unint64_t v20 = 3;
      v29[3] = 3;
    }
    else
    {
      unint64_t v20 = v29[3];
    }
  }
  else
  {
    unint64_t v20 = v29[3];
  }
  _Block_object_dispose(&v28, 8);

  return v20;
}

void __80__PLSpotlightDonationManager_donateSearchableItemsToSpotlight_bundleIdentifier___block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = 1;
  if (v3) {
    uint64_t v4 = 2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v4;
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v6 = PLSearchBackendDonationsGetLog();
  id v7 = v6;
  if (v5 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 32) count];
      v9 = [*(id *)(a1 + 40) photoLibraryTypeDescription];
      dispatch_semaphore_t v10 = *(void **)(a1 + 48);
      int v15 = 134349570;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      id v20 = v10;
      dispatch_semaphore_t v11 = "Successfully donated %{public}lu items to Spotlight for %{public}@. Items: %{public}@";
      int v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
      _os_log_impl(&dword_19B3C7000, v12, v13, v11, (uint8_t *)&v15, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = [*(id *)(a1 + 32) count];
    v9 = [*(id *)(a1 + 40) photoLibraryTypeDescription];
    int v15 = 134349570;
    uint64_t v16 = v14;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    id v20 = v3;
    dispatch_semaphore_t v11 = "Failed to donate %{public}lu searchable items to Spotlight for %{public}@. Error: %{public}@.";
    int v12 = v7;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    goto LABEL_8;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

uint64_t __80__PLSpotlightDonationManager_donateSearchableItemsToSpotlight_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (NSString)photoLibraryTypeDescription
{
  photoLibraryTypeDescription = self->_photoLibraryTypeDescription;
  if (!photoLibraryTypeDescription)
  {
    uint64_t v4 = [(PLSpotlightDonationManager *)self photoLibrary];
    PLPhotolibraryWellKnownIdentifierDescriptionForPhotoLibrary(v4);
    uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_photoLibraryTypeDescription;
    self->_photoLibraryTypeDescription = v5;

    photoLibraryTypeDescription = self->_photoLibraryTypeDescription;
  }
  return photoLibraryTypeDescription;
}

- (void)_signPostIntervalForOperationType:(unint64_t)a3 searchableItemCount:(unint64_t)a4 isBegin:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    uint64_t v8 = @"donation";
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PLSpotlightDonationManager.m", 393, @"Invalid parameter not satisfying: %@", @"operationType == PLSpotlightOperationTypeDonation" object file lineNumber description];

    uint64_t v8 = @"unsupported";
  }
  v9 = [(PLSpotlightDonationManager *)self spotlightDonationManagerLog];
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
  dispatch_semaphore_t v11 = @"End";
  if (v5) {
    dispatch_semaphore_t v11 = @"Begin";
  }
  int v12 = [NSString stringWithFormat:@"%@ %@ operation to Spotlight for batch containing %lu items", v11, v8, a4];
  os_log_type_t v13 = v9;
  uint64_t v14 = v13;
  if (v5)
  {
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v12;
      int v15 = v14;
      os_signpost_type_t v16 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_12:
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, v16, v10, "PLSpotlightDonationManager", "%@", buf, 0xCu);
    }
  }
  else if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v12;
    int v15 = v14;
    os_signpost_type_t v16 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_12;
  }
}

- (void)endSignpostIntervalForOperationType:(unint64_t)a3 searchableItemCount:(unint64_t)a4
{
}

- (void)beginSignpostIntervalForOperationType:(unint64_t)a3 searchableItemCount:(unint64_t)a4
{
}

- (id)spotlightDonationManagerLog
{
  if (spotlightDonationManagerLog_onceToken != -1) {
    dispatch_once(&spotlightDonationManagerLog_onceToken, &__block_literal_global_78);
  }
  v2 = (void *)spotlightDonationManagerLog_spotlightDonationManagerLog;
  return v2;
}

void __57__PLSpotlightDonationManager_spotlightDonationManagerLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.search.spotlight", "PLSpotlightDonationManager");
  v1 = (void *)spotlightDonationManagerLog_spotlightDonationManagerLog;
  spotlightDonationManagerLog_spotlightDonationManagerLog = (uint64_t)v0;
}

- (void)removeOperationCountObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PLSpotlightDonationManager *)self operationQueue];
  [v5 removeObserver:v4 forKeyPath:@"operationCount" context:0];
}

- (void)addOperationCountObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PLSpotlightDonationManager *)self operationQueue];
  [v5 addObserver:v4 forKeyPath:@"operationCount" options:1 context:0];
}

- (unint64_t)pendingOperationCount
{
  v2 = [(PLSpotlightDonationManager *)self operationQueue];
  unint64_t v3 = [v2 operationCount];

  return v3;
}

- (void)setSpotlightOperationQueueSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = [(PLSpotlightDonationManager *)self operationQueue];
  int v6 = [v5 isSuspended];

  id v7 = PLSearchBackendDonationsGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      uint64_t v8 = @"paused";
    }
    else {
      uint64_t v8 = @"unpaused";
    }
    if (v6) {
      v9 = @"paused";
    }
    else {
      v9 = @"unpaused";
    }
    os_signpost_id_t v10 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
    int v12 = 138543874;
    os_log_type_t v13 = v8;
    __int16 v14 = 2114;
    int v15 = v9;
    __int16 v16 = 2114;
    __int16 v17 = v10;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Setting donation operation queue to [%{public}@] from [%{public}@] for %{public}@", (uint8_t *)&v12, 0x20u);
  }
  dispatch_semaphore_t v11 = [(PLSpotlightDonationManager *)self operationQueue];
  [v11 setSuspended:v3];
}

- (void)deleteAllSearchableItemsWithCompletion:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLSpotlightDonationManager *)self photoLibrary];
  int v6 = PLSearchBackendDonationsGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(PLSpotlightDonationManager *)self spotlightIndex];
    uint64_t v8 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
    *(_DWORD *)buf = 138412802;
    uint64_t v30 = (uint64_t)v5;
    __int16 v31 = 2112;
    uint64_t v32 = v7;
    __int16 v33 = 2114;
    __int16 v34 = v8;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "deleteAllSearchableItems [Begin]. PhotoLibrary: %@, CSSearchableIndex: %@ for %{public}@", buf, 0x20u);
  }
  v9 = [v5 libraryServicesManager];
  uint64_t v10 = [v9 wellKnownPhotoLibraryIdentifier];

  dispatch_semaphore_t v11 = PLSearchBackendDonationsGetLog();
  int v12 = v11;
  if (v10 == 1)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v13 = [(PLSpotlightDonationManager *)self operationQueue];
      uint64_t v14 = [v13 operationCount];
      int v15 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 134218242;
      uint64_t v30 = v14;
      __int16 v31 = 2114;
      uint64_t v32 = v15;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "deleteAllSearchableItems. Cancelling all (%ld) in flight Spotlight operations for %{public}@.", buf, 0x16u);
    }
    __int16 v16 = [(PLSpotlightDonationManager *)self operationQueue];
    [v16 cancelAllOperations];

    __int16 v17 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = (uint64_t)v18;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "deleteAllSearchableItems. Deleting Spotlight donation progress plist in preparation for deletion of all searchable items from Core Spotlight for %{public}@.", buf, 0xCu);
    }
    __int16 v19 = [v5 pathManager];
    +[PLSpotlightProgressManager setSpotlightIndexNeedsReindexing:0 forPhotoLibraryPathManager:v19];

    id v20 = [v5 libraryServicesManager];
    int v12 = +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", [v20 wellKnownPhotoLibraryIdentifier]);

    uint64_t v21 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
    uint64_t v22 = [(PLSpotlightDonationManager *)self spotlightIndex];
    uint64_t v28 = v12;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __69__PLSpotlightDonationManager_deleteAllSearchableItemsWithCompletion___block_invoke;
    v25[3] = &unk_1E5875B30;
    v25[4] = self;
    id v26 = v5;
    id v27 = v4;
    [v22 deleteSearchableItemsWithDomainIdentifiers:v23 protectionClass:0 forBundleID:v21 options:0 completionHandler:v25];
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    v24 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = (uint64_t)v24;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_FAULT, "Unsupported %{public}@. Ignoring request to delete all items.", buf, 0xCu);
  }
}

void __69__PLSpotlightDonationManager_deleteAllSearchableItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLSearchBackendDonationsGetLog();
  id v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v6 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    int v22 = 138543618;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v3;
    id v7 = "deleteAllSearchableItems. [Failed]. Failed to delete all searchable items from Core Spotlight for %{public}@. Error: %@";
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    int v6 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    int v22 = 138543362;
    id v23 = v6;
    id v7 = "deleteAllSearchableItems. [Success]. Deleted all searchable items from Core Spotlight for %{public}@";
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
    uint32_t v10 = 12;
  }
  _os_log_impl(&dword_19B3C7000, v8, v9, v7, (uint8_t *)&v22, v10);

LABEL_7:
  dispatch_semaphore_t v11 = [*(id *)(a1 + 40) pathManager];
  BOOL v12 = +[PLSpotlightProgressManager spotlightResetOperationCompletedForPhotoLibraryPathManager:v11 success:v3 == 0];

  os_log_type_t v13 = PLSearchBackendDonationsGetLog();
  uint64_t v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
      int v22 = 138543362;
      id v23 = v15;
      __int16 v16 = "deleteAllSearchableItems. Successfully updated re-indexing flag in progress plist for %{public}@";
      __int16 v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_INFO;
LABEL_12:
      _os_log_impl(&dword_19B3C7000, v17, v18, v16, (uint8_t *)&v22, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v15 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    int v22 = 138543362;
    id v23 = v15;
    __int16 v16 = "deleteAllSearchableItems. Failed to manage progress for Core Spotlight re-indexing, progress may not be accura"
          "tely represented on disk for %{public}@.";
    __int16 v17 = v14;
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    goto LABEL_12;
  }

  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v19, v20, v21);
}

- (void)deleteSearchableItemsWithIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(PLSpotlightDonationManager *)self photoLibrary];
    int v6 = [v5 libraryServicesManager];
    uint64_t v7 = [v6 wellKnownPhotoLibraryIdentifier];

    uint64_t v8 = PLSearchBackendDonationsGetLog();
    os_log_type_t v9 = v8;
    if (v7 == 1)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v4 count];
        dispatch_semaphore_t v11 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
        int v15 = 134349314;
        uint64_t v16 = v10;
        __int16 v17 = 2114;
        os_log_type_t v18 = v11;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Creating operation to delete %{public}lu items from Spotlight for %{public}@.", (uint8_t *)&v15, 0x16u);
      }
      BOOL v12 = [PLSpotlightDeletionOperation alloc];
      os_log_type_t v13 = [(PLSpotlightDonationManager *)self spotlightIndex];
      os_log_type_t v9 = [(PLSpotlightDeletionOperation *)v12 initWithPhotoLibrary:v5 spotlightSearchableIndex:v13 searchableItemIdentifiers:v4];

      uint64_t v14 = [(PLSpotlightDonationManager *)self operationQueue];
      [v14 addOperation:v9];
    }
    else
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v14 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
      int v15 = 138543618;
      uint64_t v16 = (uint64_t)v4;
      __int16 v17 = 2114;
      os_log_type_t v18 = v14;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Unsupported PhotoLibrary. Ignoring request to delete items: %{public}@ for %{public}@", (uint8_t *)&v15, 0x16u);
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)donateSearchableItems:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = objc_msgSend(v6, "_pl_map:", &__block_literal_global_60_60636);
    uint64_t v9 = [v7 length];
    uint64_t v10 = PLSearchBackendDonationsGetLog();
    dispatch_semaphore_t v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v6 count];
        os_log_type_t v13 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
        int v18 = 134349826;
        uint64_t v19 = v12;
        __int16 v20 = 2114;
        id v21 = v7;
        __int16 v22 = 2114;
        id v23 = v8;
        __int16 v24 = 2114;
        id v25 = v13;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Creating operation to donate %{public}lu items to Spotlight, bundleIdentifier: %{public}@, items: %{public}@ for %{public}@", (uint8_t *)&v18, 0x2Au);
      }
      uint64_t v14 = [PLSpotlightDonationOperation alloc];
      int v15 = [(PLSpotlightDonationManager *)self photoLibrary];
      uint64_t v16 = [(PLSpotlightDonationManager *)self spotlightIndex];
      dispatch_semaphore_t v11 = [(PLSpotlightDonationOperation *)v14 initWithPhotoLibrary:v15 spotlightSearchableIndex:v16 searchableItems:v6 bundleIdentifier:v7];

      [v11 setSignpostDelegate:self];
      __int16 v17 = [(PLSpotlightDonationManager *)self operationQueue];
      [v17 addOperation:v11];
    }
    else
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_9:

        goto LABEL_10;
      }
      __int16 v17 = [(PLSpotlightDonationManager *)self photoLibraryTypeDescription];
      int v18 = 138543618;
      uint64_t v19 = (uint64_t)v8;
      __int16 v20 = 2114;
      id v21 = v17;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Missing bundleIdentifier for searchable items donation: %{public}@ for %{public}@", (uint8_t *)&v18, 0x16u);
    }

    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __69__PLSpotlightDonationManager_donateSearchableItems_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (void)_releaseSpotlightSandboxExtension
{
  if (self->_spotlightSandboxExtensionHandle != -1)
  {
    sandbox_extension_release();
    self->_spotlightSandboxExtensionHandle = -1;
    id v3 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Released sandbox extension", v4, 2u);
    }
  }
}

- (BOOL)_acquireSpotlightSandboxExtensionIfNeeded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_spotlightSandboxExtensionHandle == -1)
  {
    id v3 = [(PLPhotoLibrary *)self->_photoLibrary pathManager];
    id v4 = [v3 spotlightSearchIndexPath];
    uint64_t v5 = [v4 fileSystemRepresentation];

    uint64_t v6 = sandbox_extension_issue_file_to_self();
    if (v6)
    {
      id v7 = (void *)v6;
      int64_t v8 = sandbox_extension_consume();
      self->_spotlightSandboxExtensionHandle = v8;
      uint64_t v9 = PLSearchBackendDonationsGetLog();
      uint64_t v10 = v9;
      if (v8 == -1)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v17 = *__error();
          int v19 = 67109378;
          int v20 = v17;
          __int16 v21 = 2080;
          uint64_t v22 = v5;
          dispatch_semaphore_t v11 = "Failed to consume sandbox extension token, errno: %{darwin.errno}d, path: %s";
          uint64_t v12 = v10;
          os_log_type_t v13 = OS_LOG_TYPE_ERROR;
          uint32_t v14 = 18;
          goto LABEL_11;
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v19) = 0;
        dispatch_semaphore_t v11 = "Acquired sandbox extension";
        uint64_t v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
        uint32_t v14 = 2;
LABEL_11:
        _os_log_impl(&dword_19B3C7000, v12, v13, v11, (uint8_t *)&v19, v14);
      }

      free(v7);
      return self->_spotlightSandboxExtensionHandle != -1;
    }
    int v15 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *__error();
      int v19 = 67109378;
      int v20 = v16;
      __int16 v21 = 2080;
      uint64_t v22 = v5;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension token, errno: %{darwin.errno}d, path: %s", (uint8_t *)&v19, 0x12u);
    }
  }
  return self->_spotlightSandboxExtensionHandle != -1;
}

- (void)disableUISearch
{
}

void __45__PLSpotlightDonationManager_disableUISearch__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLSearchBackendDonationsGetLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v2;
      uint64_t v5 = "Failed to disable UI search with error: %@";
      uint64_t v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    uint64_t v5 = "Disabled UI search";
    uint64_t v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
}

- (void)dealloc
{
  [(PLSpotlightDonationManager *)self _releaseSpotlightSandboxExtension];
  v3.receiver = self;
  v3.super_class = (Class)PLSpotlightDonationManager;
  [(PLSpotlightDonationManager *)&v3 dealloc];
}

- (PLSpotlightDonationManager)initWithPhotoLibrary:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    __int16 v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PLSpotlightDonationManager.m", 52, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v37.receiver = self;
  v37.super_class = (Class)PLSpotlightDonationManager;
  os_log_type_t v7 = [(PLSpotlightDonationManager *)&v37 init];
  if (v7)
  {
    uint32_t v8 = [v6 libraryServicesManager];
    uint64_t v9 = [v8 wellKnownPhotoLibraryIdentifier];

    id v10 = +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:v9];
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    uint64_t v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v11;

    [(NSOperationQueue *)v7->_operationQueue setQualityOfService:9];
    [(NSOperationQueue *)v7->_operationQueue setMaxConcurrentOperationCount:1];
    v7->_spotlightSandboxExtensionHandle = -1;
    if (+[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:v9])
    {
      os_log_type_t v13 = [v6 pathManager];
      uint32_t v14 = [v13 spotlightSearchIndexPath];

      int v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v36 = 0;
      char v16 = [v15 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:&v36];
      spotlightIndex = (CSSearchableIndex *)v36;

      if (v16)
      {
        [(PLSpotlightDonationManager *)v7 _acquireSpotlightSandboxExtensionIfNeeded];
        int v18 = PLSearchBackendDonationsGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = [(PLSpotlightDonationManager *)v7 photoLibraryTypeDescription];
          *(_DWORD *)buf = 138412546;
          v39 = v14;
          __int16 v40 = 2114;
          v41 = v19;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Opening Spotlight index at path: %@ for %{public}@", buf, 0x16u);
        }
        uint64_t v20 = [objc_alloc(MEMORY[0x1E4F237F8]) initWithPath:v14];
        managedSpotlightIndex = v7->_managedSpotlightIndex;
        v7->_managedSpotlightIndex = (CSManagedSearchableIndex *)v20;

        uint64_t v22 = [(PLPhotoLibrary *)v7->_photoLibrary libraryServicesManager];
        BOOL v23 = [v22 wellKnownPhotoLibraryIdentifier] == 1;

        __int16 v24 = v7->_managedSpotlightIndex;
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __51__PLSpotlightDonationManager_initWithPhotoLibrary___block_invoke;
        v34[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
        BOOL v35 = v23;
        [(CSManagedSearchableIndex *)v24 setUISearchEnabled:v23 completionHandler:v34];
        id v25 = v7->_managedSpotlightIndex;
        p_super = &v7->_spotlightIndex->super;
        v7->_spotlightIndex = (CSSearchableIndex *)v25;
      }
      else
      {
        p_super = PLSearchBackendDonationsGetLog();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = [(PLSpotlightDonationManager *)v7 photoLibraryTypeDescription];
          *(_DWORD *)buf = 138543618;
          v39 = v28;
          __int16 v40 = 2112;
          v41 = spotlightIndex;
          _os_log_impl(&dword_19B3C7000, p_super, OS_LOG_TYPE_ERROR, "Failed to create Spotlight index directory for %{public}@, error: %@", buf, 0x16u);
        }
      }

      if (!v7->_spotlightIndex)
      {
        uint64_t v29 = PLSearchBackendIndexingEngineGetLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_FAULT, "Unable to create managed spotlight index", buf, 2u);
        }
      }
    }
    else
    {
      uint64_t v27 = [objc_alloc(MEMORY[0x1E4F23838]) initWithName:v10];
      spotlightIndex = v7->_spotlightIndex;
      v7->_spotlightIndex = (CSSearchableIndex *)v27;
    }

    if (!v7->_spotlightIndex)
    {
      uint64_t v30 = PLSearchBackendDonationsGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        __int16 v31 = [(PLSpotlightDonationManager *)v7 photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543362;
        v39 = v31;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "Failed to open Spotlight index for %{public}@.", buf, 0xCu);
      }
    }
  }
  return v7;
}

void __51__PLSpotlightDonationManager_initWithPhotoLibrary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLSearchBackendDonationsGetLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = @"enable";
      if (!*(unsigned char *)(a1 + 32)) {
        id v6 = @"disable";
      }
      int v12 = 138543618;
      os_log_type_t v13 = v6;
      __int16 v14 = 2112;
      id v15 = v3;
      os_log_type_t v7 = "Failed to %{public}@ UI search with error: %@";
      uint32_t v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
      goto LABEL_11;
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 32)) {
      uint64_t v11 = @"enabled";
    }
    else {
      uint64_t v11 = @"disabled";
    }
    int v12 = 138543362;
    os_log_type_t v13 = v11;
    os_log_type_t v7 = "%{public}@ UI search";
    uint32_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
LABEL_11:
    _os_log_impl(&dword_19B3C7000, v8, v9, v7, (uint8_t *)&v12, v10);
  }
}

+ (id)_photolibraryDatabaseUUIDForPhotolibraryWithURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F8B980];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithLibraryURL:v4];

  id v6 = (void *)MEMORY[0x1E4F1CB10];
  os_log_type_t v7 = [v5 photosDatabasePath];
  uint32_t v8 = [v6 fileURLWithPath:v7];

  uint64_t v9 = *MEMORY[0x1E4F1BF70];
  id v15 = 0;
  uint32_t v10 = [MEMORY[0x1E4F1C188] metadataForPersistentStoreOfType:v9 URL:v8 options:0 error:&v15];
  id v11 = v15;
  if (v11)
  {
    int v12 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      int v17 = v8;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to get database UUID for database with url %@. Error: %@.", buf, 0x16u);
    }

    os_log_type_t v13 = 0;
  }
  else
  {
    os_log_type_t v13 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1BF90]];
  }

  return v13;
}

+ (BOOL)_deleteAllSearchableItemsForSystemPhotoLibraryWithError:(id *)a3
{
  return 0;
}

+ (void)handleDeletionForPhotoLibraryWithURL:(id)a3 completion:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F28C58];
  uint64_t v5 = (void (**)(id, void, void *))a4;
  id v6 = [v4 alloc];
  uint64_t v7 = *MEMORY[0x1E4F8C500];
  uint64_t v12 = *MEMORY[0x1E4F28228];
  v13[0] = @"Received unexpected notification from Spotlight of photolibrary deletion for a non macOS platform";
  uint32_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v9 = (void *)[v6 initWithDomain:v7 code:0 userInfo:v8];

  uint32_t v10 = PLSearchBackendDonationsGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Received unexpected notification from Spotlight of PhotoLibrary deletion for a non macOS platform. Ignoring request.", v11, 2u);
  }

  v5[2](v5, 0, v9);
}

@end