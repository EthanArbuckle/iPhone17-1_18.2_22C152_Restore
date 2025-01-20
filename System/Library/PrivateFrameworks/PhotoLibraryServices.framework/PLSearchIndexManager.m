@interface PLSearchIndexManager
+ (BOOL)_isIndexingAllowedByDAS;
+ (BOOL)_isUnboundedIndexingAllowed;
+ (id)_keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords:(id)a3 andAssetUUIDsBySocialGroup:(id)a4 photoLibrary:(id)a5;
+ (id)_keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords:(id)a3 photoLibrary:(id)a4;
+ (id)_keywordsByCategoryMaskByAssetUUIDFromAssetUUIDsBySocialGroup:(id)a3;
+ (id)fetchAlbumUUIDsToPopulateSearchIndexWithManagedObjectContext:(id)a3 libraryIdentifier:(int64_t)a4 error:(id *)a5;
+ (id)fetchAlbumsWithUUIDs:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
+ (id)fetchAssetUUIDsToPopulateSearchIndexWithManagedObjectContext:(id)a3 libraryIdentifier:(int64_t)a4 error:(id *)a5;
+ (id)fetchAssetsWithUUIDs:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
+ (id)fetchHighlightUUIDsToPopulateSearchIndexWithManagedObjectContext:(id)a3 libraryIdentifier:(int64_t)a4 error:(id *)a5;
+ (id)fetchHighlightsWithUUIDs:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
+ (id)fetchMemoriesWithUUIDs:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
+ (id)fetchMemoryUUIDsToPopulateSearchIndexWithManagedObjectContext:(id)a3 libraryIdentifier:(int64_t)a4 error:(id *)a5;
+ (id)fetchMomentUUIDsToPopulateAssetSearchIndexWithManagedObjectContext:(id)a3 error:(id *)a4;
- (BOOL)_inqIsIndexingPaused;
- (BOOL)_inqUpdateEmbeddingModelVersion;
- (BOOL)_inqUpdateFeaturedContentAllowed:(BOOL)a3;
- (BOOL)_inqUpdateLocale;
- (BOOL)_inqUpdateSceneTaxonomySHA:(id)a3;
- (BOOL)_inqUpdateSearchSystemInfo:(id)a3 forKey:(id)a4 logMessage:(id)a5;
- (BOOL)_inqUpdateUtilityTypeClassifierVersion;
- (BOOL)_inqUpdateVersion;
- (BOOL)_inqUpdateWordEmbeddingVersion:(id)a3;
- (BOOL)_isIndexing;
- (BOOL)_onQueueAsync:(id)a3;
- (BOOL)_onQueueAsyncWithDelay:(double)a3 perform:(id)a4;
- (BOOL)_onQueueSync:(id)a3;
- (BOOL)_removeFileAtPath:(id)a3 description:(id)a4;
- (BOOL)_setIndexingPaused:(BOOL)a3 synchronously:(BOOL)a4 reason:(id)a5;
- (BOOL)_shouldResumeIndexingBasedOnDevicePowerStatusOrDAS;
- (BOOL)isIndexingPaused;
- (BOOL)isSharedLibraryEnabledForSearchIndexingContext:(id)a3;
- (CSUSearchableKnowledgeObjectStore)csuTaxonomyObjectStore;
- (NSCountedSet)_pauseReasons;
- (NSDate)dateBeganIndexingOnBattery;
- (NSDate)dateOfLastSearchIndexRebuild;
- (NSDate)datePausedIndexingOnBattery;
- (NSString)photoLibraryTypeDescription;
- (PLSearchIndexManager)initWithPathManager:(id)a3;
- (PLSearchIndexManagerDatabaseConnectionDelegate)databaseConnectionDelegate;
- (PLSearchIndexSceneTaxonomyProvider)sceneTaxonomyProvider;
- (PLSpotlightDonationManager)spotlightDonationManager;
- (PSIDatabase)database;
- (double)lastKnownElapsedIndexingTime;
- (id)_assetUUIDsToRemoveFromUUIDsToProcess:(id)a3;
- (id)_assetUUIDsWithGraphDataInSpotlight;
- (id)_collectionUUIDsToRemoveFromUUIDsToProcess:(id)a3;
- (id)_featuredPersonLocalIdentifiersFromPhotosGraphData:(id)a3 photosGraphVersion:(int64_t)a4;
- (id)_inqAfterIndexingDidIterate;
- (id)_inqPhotoLibrary;
- (id)_inqRequestGraphDataForHighlightUUIDs:(id)a3 momentUUIDs:(id)a4 photoLibrary:(id)a5 singleAssetOnly:(BOOL)a6 error:(id *)a7;
- (id)_updatesAfterConvertingDetectedFacesToAssetsInUpdates:(id)a3;
- (id)_updatesAfterConvertingPersonsToAssetsInUpdates:(id)a3;
- (id)_updatesEnsuringMutableArraysFromUpdates:(id)a3;
- (id)_wordEmbeddingVersion;
- (id)searchIndexManagerSignpostLog;
- (int64_t)_inqRebuildReasonIfSearchIndexIsValid;
- (int64_t)_inqRebuildReasonIfSearchSupportingDataIsValid;
- (int64_t)_inqSpotlightRequestedRebuild;
- (unint64_t)_inqEnqueuedUUIDsCountForceLoad:(BOOL)a3;
- (void)_beginObservingPhotosPreferences;
- (void)_beginObservingPowerSourceChanges;
- (void)_fetchMemoriesToIndexWithUUIDs:(id)a3 managedObjectContext:(id)a4 result:(id)a5;
- (void)_handlePowerSourceChange;
- (void)_inqAddUpdatesWithUUIDs:(id)a3 forKey:(id)a4;
- (void)_inqCloseIndexIfAbleOrForce:(BOOL)a3 isDelete:(BOOL)a4;
- (void)_inqCloseSearchIndexAndDelete:(BOOL)a3 withCompletion:(id)a4;
- (void)_inqDropClientServerTransactionIfNeeded;
- (void)_inqEndTrackingRebuildIfNeeded;
- (void)_inqEndTrackingUpdateIfNeeded;
- (void)_inqEnsureCSUTaxonomyProxyExists;
- (void)_inqEnsurePhotoLibraryExists;
- (void)_inqEnsureSceneTaxonomyProxyExists;
- (void)_inqEnsureSearchIndexExists;
- (void)_inqEnsureSearchProgressExists;
- (void)_inqEnsureSearchSystemInfoExists;
- (void)_inqEnsureSpotlightDonationManagerExists;
- (void)_inqIndexPhotoLibrary;
- (void)_inqResetSearchIndexWithReason:(int64_t)a3 dropCompletion:(id)a4;
- (void)_inqResumeIndexingIfNeeded;
- (void)_inqScheduleCloseIndexIfNeeded;
- (void)_inqSetIndexingPaused:(BOOL)a3 reason:(id)a4;
- (void)_inqStartTrackingRebuildWithReason:(int64_t)a3;
- (void)_inqStartTrackingUpdateIfAble;
- (void)_inqTakeClientServerTransactionIfNeeded;
- (void)_inqTrackTransitionFromUpdateScheduledToUpdatingIfAble;
- (void)_inqUpdateFeaturedContentForSearch:(BOOL)a3;
- (void)_inqUpdateUUIDsToProcessWithSpotlightProgress;
- (void)_inqValidateSearchIndexWithCompletionHandler:(id)a3;
- (void)_preferencesDidChange;
- (void)_setIndexing:(BOOL)a3;
- (void)_setInqAfterIndexingDidIterate:(id)a3;
- (void)_stopObservingPhotosPreferences;
- (void)_stopObservingPowerSourceChanges;
- (void)_throttleTimerFire:(id)a3;
- (void)applyGraphUpdates:(id)a3 supportingData:(id)a4 completion:(id)a5;
- (void)applyUpdates:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteEmbeddings:(id)a3 assetUUID:(id)a4 completion:(id)a5;
- (void)disableUISearch;
- (void)dropSearchIndexWithCompletion:(id)a3;
- (void)enqueuedUUIDsCountWithCompletionHandler:(id)a3;
- (void)ensureSearchIndexExistsWithCompletionHandler:(id)a3;
- (void)indexSingleAssetWithUUID:(id)a3 completion:(id)a4;
- (void)insertEmbeddings:(id)a3 modelType:(unint64_t)a4 assetUUID:(id)a5 completion:(id)a6;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseIndexingWithReason:(id)a3;
- (void)resetSearchIndexWithReason:(int64_t)a3 dropCompletion:(id)a4;
- (void)resumeIndexingIfAllowed;
- (void)setDatabaseConnectionDelegate:(id)a3;
- (void)setDateBeganIndexingOnBattery:(id)a3;
- (void)setDateOfLastSearchIndexRebuild:(id)a3;
- (void)setDatePausedIndexingOnBattery:(id)a3;
- (void)setLastKnownElapsedIndexingTime:(double)a3;
- (void)setPhotoLibraryTypeDescription:(id)a3;
- (void)unpauseIndexingWithReason:(id)a3;
@end

@implementation PLSearchIndexManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_databaseConnectionDelegate);
  objc_storeStrong((id *)&self->_datePausedIndexingOnBattery, 0);
  objc_storeStrong((id *)&self->_dateBeganIndexingOnBattery, 0);
  objc_storeStrong((id *)&self->_photoLibraryTypeDescription, 0);
  objc_storeStrong((id *)&self->_spotlightDonationManager, 0);
  objc_storeStrong((id *)&self->__pauseReasons, 0);
  objc_storeStrong(&self->__inqAfterIndexingDidIterate, 0);
  objc_storeStrong((id *)&self->_dateOfLastSearchIndexRebuild, 0);
  objc_storeStrong((id *)&self->_blocksOnQueueAfterDelay, 0);
  objc_storeStrong((id *)&self->_inqSynonymsByIndexCategoryMask, 0);
  objc_storeStrong((id *)&self->_inqGraphDataByUUID, 0);
  objc_storeStrong((id *)&self->_inqUUIDsToProcess, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_searchSystemInfo, 0);
  objc_storeStrong((id *)&self->_csuTaxonomyObjectStore, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomyProvider, 0);
  objc_storeStrong((id *)&self->_serverTransaction, 0);
  objc_storeStrong((id *)&self->_throttleTimer, 0);
  objc_storeStrong((id *)&self->_searchMetadataStore, 0);
  objc_storeStrong((id *)&self->_zeroKeywordStore, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

- (void)setDatabaseConnectionDelegate:(id)a3
{
}

- (PLSearchIndexManagerDatabaseConnectionDelegate)databaseConnectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseConnectionDelegate);
  return (PLSearchIndexManagerDatabaseConnectionDelegate *)WeakRetained;
}

- (void)setDatePausedIndexingOnBattery:(id)a3
{
}

- (NSDate)datePausedIndexingOnBattery
{
  return self->_datePausedIndexingOnBattery;
}

- (void)setDateBeganIndexingOnBattery:(id)a3
{
}

- (NSDate)dateBeganIndexingOnBattery
{
  return self->_dateBeganIndexingOnBattery;
}

- (void)setPhotoLibraryTypeDescription:(id)a3
{
}

- (PLSpotlightDonationManager)spotlightDonationManager
{
  return self->_spotlightDonationManager;
}

- (NSCountedSet)_pauseReasons
{
  return self->__pauseReasons;
}

- (void)_setInqAfterIndexingDidIterate:(id)a3
{
}

- (id)_inqAfterIndexingDidIterate
{
  return self->__inqAfterIndexingDidIterate;
}

- (void)_setIndexing:(BOOL)a3
{
  self->__indexing = a3;
}

- (BOOL)_isIndexing
{
  return self->__indexing;
}

- (CSUSearchableKnowledgeObjectStore)csuTaxonomyObjectStore
{
  return self->_csuTaxonomyObjectStore;
}

- (PLSearchIndexSceneTaxonomyProvider)sceneTaxonomyProvider
{
  return self->_sceneTaxonomyProvider;
}

- (void)setDateOfLastSearchIndexRebuild:(id)a3
{
}

- (NSDate)dateOfLastSearchIndexRebuild
{
  return self->_dateOfLastSearchIndexRebuild;
}

- (void)setLastKnownElapsedIndexingTime:(double)a3
{
  self->_lastKnownElapsedIndexingTime = a3;
}

- (double)lastKnownElapsedIndexingTime
{
  return self->_lastKnownElapsedIndexingTime;
}

- (BOOL)isSharedLibraryEnabledForSearchIndexingContext:(id)a3
{
  return self->_isSharedLibraryEnabled;
}

- (void)deleteEmbeddings:(id)a3 assetUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__PLSearchIndexManager_deleteEmbeddings_assetUUID_completion___block_invoke;
  v15[3] = &unk_1E58710F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  v11 = (void (**)(void))v10;
  id v18 = v11;
  id v12 = v9;
  id v13 = v8;
  BOOL v14 = [(PLSearchIndexManager *)self _onQueueAsync:v15];
  if (v11 && !v14) {
    v11[2](v11);
  }
}

void __62__PLSearchIndexManager_deleteEmbeddings_assetUUID_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _inqEnsureSearchIndexExists];
  id v3 = *(id *)(*(void *)(a1 + 32) + 32);
  [v3 deleteEmbeddingsForModelTypes:*(void *)(a1 + 40) assetUUID:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (void)insertEmbeddings:(id)a3 modelType:(unint64_t)a4 assetUUID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__PLSearchIndexManager_insertEmbeddings_modelType_assetUUID_completion___block_invoke;
  v17[3] = &unk_1E5873600;
  v17[4] = self;
  id v18 = v10;
  unint64_t v21 = a4;
  id v19 = v11;
  id v13 = (void (**)(void))v12;
  id v20 = v13;
  id v14 = v11;
  id v15 = v10;
  BOOL v16 = [(PLSearchIndexManager *)self _onQueueAsync:v17];
  if (v13 && !v16) {
    v13[2](v13);
  }
}

uint64_t __72__PLSearchIndexManager_insertEmbeddings_modelType_assetUUID_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _inqEnsureSearchIndexExists];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 48);
  return [v3 insertEmbeddings:v2 modelType:v4 assetUUID:v6 completion:v5];
}

- (void)_handlePowerSourceChange
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "Detected power source change. Resuming indexing if needed / allowed for %{public}@.", (uint8_t *)&v5, 0xCu);
  }
  [(PLSearchIndexManager *)self resumeIndexingIfAllowed];
}

- (void)_stopObservingPowerSourceChanges
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.system.powersources.source", 0);
}

- (void)_beginObservingPowerSourceChanges
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_PLSearchIndexManagerPowerSourceNotificationCallback, @"com.apple.system.powersources.source", 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)_stopObservingPhotosPreferences
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobileslideshow.PreferenceChanged", 0);
}

- (void)_beginObservingPhotosPreferences
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_preferencesDidChange, @"com.apple.mobileslideshow.PreferenceChanged", 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)_preferencesDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__PLSearchIndexManager__preferencesDidChange__block_invoke;
  v2[3] = &unk_1E5875CE0;
  v2[4] = self;
  [(PLSearchIndexManager *)self _onQueueAsync:v2];
}

uint64_t __45__PLSearchIndexManager__preferencesDidChange__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Preferences changed. Resuming indexing if needed for %{public}@.", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) _inqResumeIndexingIfNeeded];
}

- (void)_inqUpdateFeaturedContentForSearch:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PLSearchIndexManager *)self _inqPhotoLibrary];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6864;
  BOOL v16 = __Block_byref_object_dispose__6865;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__PLSearchIndexManager__inqUpdateFeaturedContentForSearch___block_invoke;
  v8[3] = &unk_1E5875340;
  id v6 = v5;
  id v10 = self;
  id v11 = &v12;
  id v9 = v6;
  [v6 performBlockAndWait:v8];
  if ([(id)v13[5] count])
  {
    if (v3) {
      uint64_t v7 = @"insertMemory";
    }
    else {
      uint64_t v7 = @"removeMemory";
    }
    [(PLSearchIndexManager *)self _inqAddUpdatesWithUUIDs:v13[5] forKey:v7];
  }

  _Block_object_dispose(&v12, 8);
}

void __59__PLSearchIndexManager__inqUpdateFeaturedContentForSearch___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F38D3B0]();
  BOOL v3 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v4 = objc_opt_class();
  int v5 = [*(id *)(*(void *)(a1 + 40) + 24) libraryServicesManager];
  id v12 = 0;
  uint64_t v6 = objc_msgSend(v4, "fetchMemoryUUIDsToPopulateSearchIndexWithManagedObjectContext:libraryIdentifier:error:", v3, objc_msgSend(v5, "wellKnownPhotoLibraryIdentifier"), &v12);
  id v7 = v12;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  if (v7)
  {
    id v10 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [*(id *)(a1 + 40) photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch Memories for %{public}@. Error: %@", buf, 0x16u);
    }
  }
}

- (PSIDatabase)database
{
  return self->_db;
}

- (id)searchIndexManagerSignpostLog
{
  if (searchIndexManagerSignpostLog_onceToken != -1) {
    dispatch_once(&searchIndexManagerSignpostLog_onceToken, &__block_literal_global_421);
  }
  uint64_t v2 = (void *)searchIndexManagerSignpostLog_searchIndexManagerSignpostLog;
  return v2;
}

void __53__PLSearchIndexManager_searchIndexManagerSignpostLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.search", "SearchIndexManager");
  v1 = (void *)searchIndexManagerSignpostLog_searchIndexManagerSignpostLog;
  searchIndexManagerSignpostLog_searchIndexManagerSignpostLog = (uint64_t)v0;
}

- (id)_featuredPersonLocalIdentifiersFromPhotosGraphData:(id)a3 photosGraphVersion:(int64_t)a4
{
  unsigned __int16 v39 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  int v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v14 = v6;
  __int16 v15 = v41;
  id v16 = objc_msgSend(v14, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, v37, 0);
  id v46 = 0;
  uint64_t v17 = [v5 unarchivedObjectOfClasses:v16 fromData:v41 error:&v46];
  id v18 = v46;

  if (v17)
  {
    BOOL v19 = v39 == 257;
    if (v39 >= 0x101u)
    {
      id v40 = v18;
      if (v19) {
        id v20 = @"featureVector";
      }
      else {
        id v20 = @"featureVector_v2";
      }
      [v17 objectForKeyedSubscript:v20];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      unint64_t v21 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v43 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            v27 = [v26 firstObject];
            int v28 = [v27 isEqualToString:@"People"];

            if (v28)
            {
              v29 = [v26 lastObject];
              [v4 addObject:v29];
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v51 count:16];
        }
        while (v23);
      }

      id v18 = v40;
      __int16 v15 = v41;
      goto LABEL_25;
    }
    v31 = [v17 objectForKeyedSubscript:@"featureVector"];
    unint64_t v21 = v31;
    if (v31)
    {
      v32 = [v31 objectForKeyedSubscript:@"people"];
      v33 = v32;
      if (v32 && [v32 count])
      {
        uint64_t v34 = [MEMORY[0x1E4F1CA80] setWithArray:v33];
LABEL_24:
        v35 = (void *)v34;

        uint64_t v4 = v35;
        goto LABEL_25;
      }
    }
    else
    {
      v33 = 0;
    }
    uint64_t v34 = [MEMORY[0x1E4F1CA80] set];
    goto LABEL_24;
  }
  unint64_t v21 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v30 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)buf = 138543618;
    v48 = v30;
    __int16 v49 = 2112;
    id v50 = v18;
    _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to unarchive Knowledge Graph data for %{public}@. Error: %@", buf, 0x16u);
  }
LABEL_25:

  return v4;
}

- (void)_fetchMemoriesToIndexWithUUIDs:(id)a3 managedObjectContext:(id)a4 result:(id)a5
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(id, void *, void *, void *))a5;
  uint64_t v9 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v10 = +[PLMemory entityName];
  uint64_t v11 = [v9 fetchRequestWithEntityName:v10];

  [v11 setPropertiesToFetch:&unk_1EEBF15E0];
  [v11 setIncludesPendingChanges:0];
  [v11 setFetchBatchSize:100];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(pendingState) != %d && noindex:(rejected) == NO", 1);
  [v11 setPredicate:v12];

  uint64_t v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v59[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v59[1] = v14;
  __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  [v11 setSortDescriptors:v15];

  id v56 = 0;
  id v16 = [v7 executeFetchRequest:v11 error:&v56];
  id v17 = v56;
  id v18 = v17;
  if (v16)
  {
    id v39 = v17;
    id v41 = v11;
    long long v42 = v8;
    id v43 = v7;
    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v19 = v16;
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unint64_t v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
    v58 = v21;
    v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v40 = v19;
    id obj = v19;
    uint64_t v51 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v51)
    {
      uint64_t v49 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v53 != v49) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          uint64_t v24 = [v23 photosGraphData];
          v25 = -[PLSearchIndexManager _featuredPersonLocalIdentifiersFromPhotosGraphData:photosGraphVersion:](self, "_featuredPersonLocalIdentifiersFromPhotosGraphData:photosGraphVersion:", v24, [v23 photosGraphVersion]);

          if ([v25 count])
          {
            v26 = [v25 sortedArrayUsingDescriptors:v48];
            v27 = [v26 componentsJoinedByString:@":"];
          }
          else
          {
            v27 = &stru_1EEB2EB80;
          }
          id v28 = [NSString alloc];
          int v29 = [v23 category];
          int v30 = [v23 subcategory];
          v31 = [v23 title];
          v32 = [v23 subtitle];
          v33 = (void *)[v28 initWithFormat:@"%hd:%hd:%@:%@:%@", v29, v30, v31, v32, v27];

          if ([v20 containsObject:v33])
          {
            uint64_t v34 = [v23 uuid];
            [v45 addObject:v34];
          }
          else
          {
            [v20 addObject:v33];
            v35 = [v23 uuid];
            int v36 = [v46 containsObject:v35];

            if (v36) {
              [v44 addObject:v23];
            }
          }
        }
        uint64_t v51 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v51);
    }

    uint64_t v8 = v42;
    id v7 = v43;
    id v16 = v40;
    uint64_t v11 = v41;
    id v18 = v39;
    uint64_t v37 = v44;
    v38 = v45;
  }
  else
  {
    v38 = 0;
    uint64_t v37 = 0;
  }
  v8[2](v8, v37, v38, v18);
}

- (void)disableUISearch
{
}

- (void)indexSingleAssetWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x3032000000;
  v103 = __Block_byref_object_copy__6864;
  v104 = __Block_byref_object_dispose__6865;
  id v105 = 0;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  char v99 = 1;
  uint64_t v9 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "(JIT) indexSingleAssetWithUUID: %{public}@ BEGIN for %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v126 = __Block_byref_object_copy__6864;
  v127 = __Block_byref_object_dispose__6865;
  id v128 = 0;
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x3032000000;
  v94[3] = __Block_byref_object_copy__6864;
  v94[4] = __Block_byref_object_dispose__6865;
  id v95 = 0;
  v92[0] = 0;
  v92[1] = v92;
  v92[2] = 0x3032000000;
  v92[3] = __Block_byref_object_copy__6864;
  v92[4] = __Block_byref_object_dispose__6865;
  id v93 = 0;
  uint64_t v11 = objc_alloc_init(PLPhotoLibraryOptions);
  uint64_t v12 = [(PLPhotoLibraryPathManager *)self->_pathManager libraryURL];
  id v91 = 0;
  id v13 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLSearchIndexManager indexSingleAssetWithUUID:completion:]", v12, v11, &v91);
  id v62 = v91;

  if (v13)
  {
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke;
    v88[3] = &unk_1E5874928;
    v88[4] = self;
    id v14 = v7;
    id v89 = v14;
    v90[1] = buf;
    v90[4] = a2;
    v90[2] = v94;
    id v15 = v13;
    v90[0] = v15;
    v90[3] = v92;
    BOOL v16 = [(PLSearchIndexManager *)self _onQueueSync:v88];
    v60 = &v89;
    v61 = (id *)v90;
    *((unsigned char *)v97 + 24) = v16;
    if (v16)
    {
      id v17 = [PLPhotoAnalysisMomentGraphService alloc];
      id v18 = [v15 photoAnalysisClient];
      BOOL v19 = [(PLPhotoAnalysisMomentGraphService *)v17 initWithServiceProvider:v18];

      v58 = a2;
      v59 = v8;
      id v20 = v7;
      *(void *)v121 = 0;
      *(void *)&v121[8] = v121;
      *(void *)&v121[16] = 0x3032000000;
      v122 = __Block_byref_object_copy__6864;
      v123 = __Block_byref_object_dispose__6865;
      id v124 = 0;
      uint64_t v82 = 0;
      v83 = &v82;
      uint64_t v84 = 0x3032000000;
      v85 = __Block_byref_object_copy__6864;
      v86 = __Block_byref_object_dispose__6865;
      id v87 = 0;
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke_350;
      v70[3] = &unk_1E5863D40;
      id v21 = v14;
      id v71 = v21;
      id v72 = v15;
      uint64_t v22 = v19;
      v73 = v22;
      v74 = self;
      v75 = buf;
      v76 = v94;
      v77 = v121;
      v78 = v92;
      v79 = &v82;
      v80 = &v96;
      v81 = &v100;
      [v72 performBlockAndWait:v70];
      uint64_t v23 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
      if (v23 && *(void *)(*(void *)&v121[8] + 40) && v83[5])
      {
        uint64_t v24 = PLSearchBackendIndexManagerGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = [*(id *)(*(void *)&v121[8] + 40) uniqueIdentifier];
          uint64_t v26 = v83[5];
          uint64_t v27 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
          *(_DWORD *)v115 = 138543874;
          v116 = v25;
          __int16 v117 = 2114;
          uint64_t v118 = v26;
          __int16 v119 = 2114;
          id v56 = (void *)v27;
          uint64_t v120 = v27;
          _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_INFO, "(JIT) Donating CSSI %{public}@, bundleID %{public}@ to Spotlight for %{public}@.", v115, 0x20u);

          id v7 = v20;
        }

        a2 = v58;
        v57 = [MEMORY[0x1E4F8BA48] transaction:"-[PLSearchIndexManager indexSingleAssetWithUUID:completion:]"];
        uint64_t v114 = *(void *)(*(void *)&v121[8] + 40);
        id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
        uint64_t v55 = v83[5];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke_360;
        v63[3] = &unk_1E5863D68;
        v67 = v121;
        v68 = &v82;
        v63[4] = self;
        v69 = &v100;
        id v66 = v59;
        id v64 = v21;
        id v29 = v57;
        id v65 = v29;
        [v23 indexSearchableItems:v28 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:0 forBundleID:v55 options:0 completionHandler:v63];

        id v8 = v59;
      }
      else
      {
        *((unsigned char *)v97 + 24) = 0;
        a2 = v58;
        if (v101[5])
        {
LABEL_16:

          _Block_object_dispose(&v82, 8);
          _Block_object_dispose(v121, 8);

          goto LABEL_17;
        }
        int v36 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v112 = *MEMORY[0x1E4F28228];
        v113 = @"missing at least one of: index, cssi, bundle identifier";
        id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
        uint64_t v37 = [v36 errorWithDomain:*MEMORY[0x1E4F8C500] code:46502 userInfo:v29];
        v38 = (void *)v101[5];
        v101[5] = v37;

        a2 = v58;
      }

      goto LABEL_16;
    }
    v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v110 = *MEMORY[0x1E4F28228];
    v111 = @"search index manager invalid state";
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
    uint64_t v34 = [v33 errorWithDomain:*MEMORY[0x1E4F8C500] code:46502 userInfo:v22];
    v35 = (void *)v101[5];
    v101[5] = v34;
  }
  else
  {
    *((unsigned char *)v97 + 24) = 0;
    id v30 = v8;
    v31 = v101;
    id v32 = v62;
    uint64_t v22 = (PLPhotoAnalysisMomentGraphService *)v31[5];
    v31[5] = (uint64_t)v32;
    id v8 = v30;
  }
LABEL_17:

  id v39 = v97;
  if (*((unsigned char *)v97 + 24))
  {
    id v40 = NSStringFromSelector(a2);
    BOOL v41 = [(PLSearchIndexManager *)self _setIndexingPaused:0 synchronously:1 reason:v40];

    id v39 = v97;
    if (!v41)
    {
      *((unsigned char *)v97 + 24) = 0;
      long long v42 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v108 = *MEMORY[0x1E4F28228];
      v109 = @"indexSingleAssetWithUUID: unable to resume search indexing";
      id v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
      uint64_t v44 = [v42 errorWithDomain:*MEMORY[0x1E4F8C500] code:46502 userInfo:v43];
      id v45 = (void *)v101[5];
      v101[5] = v44;

      id v39 = v97;
    }
  }
  if (!*((unsigned char *)v39 + 24))
  {
    if (!v101[5])
    {
      id v46 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
        v47 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)v121 = 138543618;
        *(void *)&v121[4] = v7;
        *(_WORD *)&v121[12] = 2114;
        *(void *)&v121[14] = v47;
        _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_FAULT, "(JIT) indexSingleAssetWithUUID: %{public}@ unexpected localError is nil for %{public}@.", v121, 0x16u);
      }
      v48 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v106 = *MEMORY[0x1E4F28228];
      v107 = @"unexpected localError == nil during indexSingleAssetWithUUID";
      uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
      uint64_t v50 = [v48 errorWithDomain:*MEMORY[0x1E4F8C500] code:46502 userInfo:v49];
      uint64_t v51 = (void *)v101[5];
      v101[5] = v50;
    }
    long long v52 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      long long v53 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      long long v54 = (uint64_t (*)(uint64_t, uint64_t))v101[5];
      *(_DWORD *)v121 = 138543874;
      *(void *)&v121[4] = v7;
      *(_WORD *)&v121[12] = 2114;
      *(void *)&v121[14] = v53;
      *(_WORD *)&v121[22] = 2112;
      v122 = v54;
      _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_ERROR, "(JIT) [FAILED] indexSingleAssetWithUUID: %{public}@ failed for %{public}@. Error: %@", v121, 0x20u);
    }
    (*((void (**)(id, void, uint64_t))v8 + 2))(v8, 0, v101[5]);
  }
  if (v13)
  {
  }
  _Block_object_dispose(v92, 8);

  _Block_object_dispose(v94, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v100, 8);
}

void __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _inqIsIndexingPaused])
  {
    uint64_t v2 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_INFO, "(JIT) Search Indexing is already paused before indexing single asset %{public}@ for %{public}@", buf, 0x16u);
    }
  }
  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 80));
  [v5 _inqSetIndexingPaused:1 reason:v6];

  [*(id *)(a1 + 32) _inqEnsureSceneTaxonomyProxyExists];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 80));
  [*(id *)(a1 + 32) _inqEnsureCSUTaxonomyProxyExists];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 88));
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v46 = __Block_byref_object_copy__6864;
  v47 = __Block_byref_object_dispose__6865;
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  int v36 = __Block_byref_object_copy__6864;
  uint64_t v37 = __Block_byref_object_dispose__6865;
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v7 = *(void **)(a1 + 48);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke_349;
  v27[3] = &unk_1E586C518;
  id v28 = v7;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v29 = v8;
  uint64_t v30 = v9;
  v31 = buf;
  id v32 = &v33;
  [v28 performBlockAndWait:v27];
  if (_os_feature_enabled_impl())
  {
    uint64_t v10 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
      *(_DWORD *)id v39 = 138412546;
      uint64_t v40 = v11;
      __int16 v41 = 2114;
      long long v42 = v12;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "Skipping request for search data from photoanalysisd for asset %@, %{public}@", v39, 0x16u);
    }
  }
  else
  {
    id v13 = *(void **)(a1 + 32);
    id v14 = [*(id *)(*(void *)&buf[8] + 40) allObjects];
    id v15 = [(id)v34[5] allObjects];
    uint64_t v16 = *(void *)(a1 + 48);
    id v26 = 0;
    id v17 = [v13 _inqRequestGraphDataForHighlightUUIDs:v14 momentUUIDs:v15 photoLibrary:v16 singleAssetOnly:1 error:&v26];
    uint64_t v10 = v26;

    if (![v17 count] && v10)
    {
      id v18 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        id v20 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
        *(_DWORD *)id v39 = 138543874;
        uint64_t v40 = v19;
        __int16 v41 = 2114;
        long long v42 = v20;
        __int16 v43 = 2112;
        uint64_t v44 = v10;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "(JIT) Failed to get Knowledge Graph data for asset %{public}@ for %{public}@. Error: %@", v39, 0x20u);
      }
    }
    id v21 = [v17 objectForKey:*(void *)(a1 + 40)];
    uint64_t v22 = [v21 copy];
    uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
  uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
  if (!*(void *)(v25 + 40)) {
    *(void *)(v25 + 40) = MEMORY[0x1E4F1CC08];
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(buf, 8);
}

void __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke_350(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLManagedAsset assetWithUUID:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 48);
    id v43 = 0;
    uint64_t v4 = [v3 requestSynonymsDictionariesWithOperationID:&stru_1EEB2EB80 error:&v43];
    id v5 = v43;
    if (!v4)
    {
      uint64_t v6 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [*(id *)(a1 + 56) photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v49 = v7;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "(JIT) synonymsDictionaries not available for JIT donation for %{public}@.", buf, 0xCu);
      }
      uint64_t v4 = (void *)MEMORY[0x1E4F1CC08];
    }
    id v42 = v5;
    uint64_t v8 = [v4 objectForKeyedSubscript:&unk_1EEBED308];
    uint64_t v9 = (void *)v8;
    uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
    if (v8) {
      uint64_t v10 = (void *)v8;
    }
    id v11 = v10;

    uint64_t v12 = [PLSearchIndexingContext alloc];
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    id v15 = +[PLSearchIndexConfiguration locale];
    uint64_t v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v17 = -[PLSearchIndexingContext initWithSceneTaxonomyProvider:csuTaxonomyObjectStore:locale:calendar:indexDateFormatter:delegate:seasonSynonyms:synonymsByIndexCategoryMask:](v12, "initWithSceneTaxonomyProvider:csuTaxonomyObjectStore:locale:calendar:indexDateFormatter:delegate:seasonSynonyms:synonymsByIndexCategoryMask:", v13, v14, v15, v16, *(void *)(*(void *)(a1 + 56) + 8), v11, v4);

    id v18 = [*(id *)(*(void *)(a1 + 56) + 24) libraryServicesManager];
    uint64_t v19 = [v18 wellKnownPhotoLibraryIdentifier];
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    id v21 = [v2 documentObservation];
    uint64_t v22 = +[PLSpotlightAssetTranslator spotlightSearchableItemFromAsset:v2 libraryIdentifier:v19 graphData:v20 indexingContext:v17 documentObservation:v21];
    uint64_t v23 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
    {
      uint64_t v25 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = *(void **)(a1 + 32);
        uint64_t v27 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) uniqueIdentifier];
        id v28 = [*(id *)(a1 + 56) photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543874;
        uint64_t v49 = v26;
        __int16 v50 = 2114;
        uint64_t v51 = v27;
        __int16 v52 = 2114;
        long long v53 = v28;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_INFO, "(JIT) CSSI for asset %{public}@ has uniqueIdentifier %{public}@ for %{public}@", buf, 0x20u);
      }
      if (![*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count]) {
        [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setIsUpdate:1];
      }
      uint64_t v29 = +[PLSpotlightDonationUtilities bundleIdentifierForAsset:v2];
      uint64_t v30 = *(void *)(*(void *)(a1 + 96) + 8);
      v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v29;
    }
    else
    {
      uint64_t v37 = (uint64_t *)MEMORY[0x1E4F28228];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
      uint64_t v46 = *v37;
      id v38 = [NSString stringWithFormat:@"indexSingleAssetWithUUID could not create CSSI from asset %@", *(void *)(a1 + 32)];
      v47 = v38;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];

      uint64_t v39 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:47017 userInfo:v31];
      uint64_t v40 = *(void *)(*(void *)(a1 + 112) + 8);
      __int16 v41 = *(void **)(v40 + 40);
      *(void *)(v40 + 40) = v39;
    }
    uint64_t v34 = v42;
  }
  else
  {
    id v32 = (uint64_t *)MEMORY[0x1E4F28228];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
    uint64_t v44 = *v32;
    uint64_t v33 = [NSString stringWithFormat:@"indexSingleAssetWithUUID unable to find asset %@", *(void *)(a1 + 32)];
    id v45 = v33;
    uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];

    uint64_t v35 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:47017 userInfo:v34];
    uint64_t v36 = *(void *)(*(void *)(a1 + 112) + 8);
    uint64_t v4 = *(void **)(v36 + 40);
    *(void *)(v36 + 40) = v35;
  }
}

void __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke_360(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLSearchBackendIndexManagerGetLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) uniqueIdentifier];
      id v7 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      uint64_t v8 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
      uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      int v14 = 138544130;
      id v15 = v6;
      __int16 v16 = 2114;
      id v17 = v7;
      __int16 v18 = 2114;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "(JIT) [FAILED] Donation for CSSI %{public}@, bundleID %{public}@ failed for %{public}@. Error: %@", (uint8_t *)&v14, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void **)(a1 + 40);
    id v11 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) uniqueIdentifier];
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v13 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    int v14 = 138544130;
    id v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    id v21 = v13;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "(JIT) [SUCCEEDED] Donated asset UUID %{public}@, CSSI %{public}@, bundleID %{public}@ for %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 48) stillAlive];
}

void __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke_349(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) assetWithUUID:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 highlightBeingAssets];
    id v5 = [v4 uuid];

    if (v5) {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v5];
    }
    uint64_t v6 = [v3 moment];
    id v7 = [v6 uuid];

    if (v7) {
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v7];
    }
  }
  else
  {
    id v5 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = [*(id *)(a1 + 48) photoLibraryTypeDescription];
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "(JIT) Failed to find asset with UUID: %{public}@ for %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_inqResumeIndexingIfNeeded
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  +[PLFileDescriptorFuse checkFileDescriptorFuse];
  id v3 = [(PLSearchIndexManager *)self searchIndexManagerSignpostLog];
  if ([(PLSearchIndexManager *)self _inqIsIndexingPaused])
  {
    uint64_t v4 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(PLSearchIndexManager *)self _pauseReasons];
      uint64_t v6 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543618;
      __int16 v119 = v5;
      __int16 v120 = 2114;
      uint64_t v121 = (uint64_t)v6;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Not resuming because indexing is paused. Pause reasons: %{public}@ for %{public}@", buf, 0x16u);
    }
LABEL_4:

    goto LABEL_44;
  }
  if ([(PLSearchIndexManager *)self _isIndexing])
  {
    uint64_t v4 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543362;
      __int16 v119 = v7;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Already indexing a batch of content. Not resuming because indexing work is already in progress for %{public}@.", buf, 0xCu);
    }
    goto LABEL_4;
  }
  if (![(PLSearchIndexManager *)self _shouldResumeIndexingBasedOnDevicePowerStatusOrDAS])goto LABEL_44; {
  uint64_t v8 = PLSearchBackendIndexManagerGetLog();
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)buf = 138543362;
    __int16 v119 = v9;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Resuming indexing for %{public}@.", buf, 0xCu);
  }
  [(PLSearchIndexManager *)self _inqValidateSearchIndexWithCompletionHandler:0];
  [(PLSearchIndexManager *)self _inqTrackTransitionFromUpdateScheduledToUpdatingIfAble];
  [(PLSearchIndexManager *)self _inqEnsureSearchProgressExists];
  if ([(PLSearchIndexManager *)self _inqEnqueuedUUIDsCountForceLoad:0])
  {
    self->_startedIndexing = 1;
    [(PLSearchIndexManager *)self _inqEnsureSceneTaxonomyProxyExists];
    [(PLSearchIndexManager *)self _inqEnsureCSUTaxonomyProxyExists];
    [(PLSearchIndexManager *)self _setIndexing:1];
    int v10 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      __int16 v12 = [(PLPhotoLibraryPathManager *)self->_pathManager libraryURL];
      *(_DWORD *)buf = 134349570;
      __int16 v119 = self;
      __int16 v120 = 2114;
      uint64_t v121 = (uint64_t)v11;
      __int16 v122 = 2112;
      uint64_t v123 = (uint64_t)v12;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Indexing Batch: [BEGIN]. Search Index Manager: %{public}p for %{public}@, PhotoLibrary path: %@", buf, 0x20u);
    }
    self->_receivedUpdatesWhileIndexing = 0;
    v117[0] = 0;
    v117[1] = v117;
    v117[2] = 0x2020000000;
    v117[3] = 0;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    inqUUIDsToProcess = self->_inqUUIDsToProcess;
    v114[0] = MEMORY[0x1E4F143A8];
    v114[1] = 3221225472;
    v114[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke;
    v114[3] = &unk_1E5863B88;
    v116 = v117;
    id v15 = v13;
    id v115 = v15;
    [(NSDictionary *)inqUUIDsToProcess enumerateKeysAndObjectsUsingBlock:v114];
    v70 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:32];
    v69 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:32];
    v112[0] = 0;
    v112[1] = v112;
    v112[2] = 0x3032000000;
    v112[3] = __Block_byref_object_copy__6864;
    v112[4] = __Block_byref_object_dispose__6865;
    id v113 = 0;
    v67 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v79 = [v15 objectForKeyedSubscript:@"insertAsset"];
    v77 = [v15 objectForKeyedSubscript:@"insertHighlight"];
    v75 = [v15 objectForKeyedSubscript:@"insertAlbum"];
    v73 = [v15 objectForKeyedSubscript:@"insertMemory"];
    id v66 = [v15 objectForKeyedSubscript:@"removeMemory"];
    id v72 = [v15 objectForKeyedSubscript:@"renamePerson"];
    id v17 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v79 count];
      uint64_t v19 = [v77 count];
      uint64_t v20 = [v75 count];
      uint64_t v21 = [v73 count];
      uint64_t v22 = [v72 count];
      uint64_t v23 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 134350338;
      __int16 v119 = (PLSearchIndexManager *)v18;
      __int16 v120 = 2050;
      uint64_t v121 = v19;
      __int16 v122 = 2050;
      uint64_t v123 = v20;
      __int16 v124 = 2050;
      uint64_t v125 = v21;
      __int16 v126 = 2050;
      uint64_t v127 = v22;
      __int16 v128 = 2114;
      uint64_t v129 = v23;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Indexing batch of %{public}lu Assets, %{public}lu Highlights, %{public}ld Albums, %{public}ld Memories, %{public}ld Renamed Persons for %{public}@", buf, 0x3Eu);
    }
    os_signpost_id_t v24 = os_signpost_id_generate(v3);
    uint64_t v25 = v3;
    id v26 = v25;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "SearchIndexManager - IndexBatch", "", buf, 2u);
    }
    id v64 = v26;
    os_signpost_id_t v65 = v24;

    if (_os_feature_enabled_impl())
    {
      uint64_t v27 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543362;
        __int16 v119 = v28;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_INFO, "Skipping graph data validation, %{public}@", buf, 0xCu);
      }
      uint64_t v29 = (void *)MEMORY[0x1E4F1CC08];
      id v62 = MEMORY[0x1E4F1CC08];
    }
    else
    {
      uint64_t v29 = (void *)[(NSMutableDictionary *)self->_inqSynonymsByIndexCategoryMask copy];
      uint64_t v27 = [(NSMutableDictionary *)self->_inqGraphDataByUUID copy];
      if (+[PLSearchIndexKnowledgeGraphDataValidator isGraphDataValid:v27])
      {
        id v62 = v27;
LABEL_41:
        __int16 v41 = [(PLSearchIndexManager *)self _inqPhotoLibrary];
        id v42 = [v41 libraryServicesManager];
        uint64_t v43 = [v42 wellKnownPhotoLibraryIdentifier];

        BOOL v44 = +[PLSpotlightDonationUtilities isUniversalSearchEnabledForPhotoLibrary:v41];
        BOOL v61 = v43 == 3;
        uint64_t v45 = [v29 objectForKeyedSubscript:&unk_1EEBED308];
        uint64_t v46 = (void *)v45;
        v47 = (void *)MEMORY[0x1E4F1CC08];
        if (v45) {
          v47 = (void *)v45;
        }
        id v48 = v47;

        uint64_t v49 = objc_opt_new();
        v110[0] = MEMORY[0x1E4F143A8];
        v110[1] = 3221225472;
        v110[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_304;
        v110[3] = &unk_1E5863BB0;
        v110[4] = self;
        id v50 = v49;
        id v111 = v50;
        uint64_t v51 = (void *)MEMORY[0x19F38D650](v110);
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_306;
        v93[3] = &unk_1E5863C00;
        id v52 = v41;
        id v94 = v52;
        id v95 = self;
        id v58 = v67;
        id v96 = v58;
        id v68 = v48;
        id v97 = v68;
        id v60 = v29;
        id v98 = v60;
        id v59 = v79;
        id v99 = v59;
        v80 = v62;
        uint64_t v100 = v80;
        id v101 = v70;
        BOOL v109 = v44;
        id v53 = v51;
        id v107 = v53;
        id v63 = v77;
        id v102 = v63;
        id v71 = v75;
        id v103 = v71;
        id v104 = v69;
        id v76 = v73;
        id v105 = v76;
        uint64_t v108 = v112;
        id v78 = v66;
        id v106 = v78;
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_318;
        v81[3] = &unk_1E5863CA0;
        CFAbsoluteTime v89 = Current;
        v81[4] = self;
        id v74 = v15;
        id v82 = v74;
        v88 = v112;
        id v54 = v101;
        id v83 = v54;
        id v55 = v104;
        id v84 = v55;
        id v56 = v72;
        id v85 = v56;
        v86 = v64;
        os_signpost_id_t v90 = v65;
        BOOL v91 = v44;
        BOOL v92 = v61;
        id v57 = v50;
        id v87 = v57;
        [v52 performBlock:v93 completionHandler:v81];

        _Block_object_dispose(v112, 8);
        _Block_object_dispose(v117, 8);
        goto LABEL_44;
      }
      uint64_t v39 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138412546;
        __int16 v119 = (PLSearchIndexManager *)v27;
        __int16 v120 = 2114;
        uint64_t v121 = (uint64_t)v40;
        _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "Detected Invalid Knowledge Graph data. Not indexing Knowledge Graph data: %@ for %{public}@", buf, 0x16u);
      }
      id v62 = 0;
    }

    goto LABEL_41;
  }
  if (!self->_startedIndexing || self->_lastIndexingStartTime == 0.0)
  {
    uint64_t v35 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543362;
      __int16 v119 = v36;
      _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "Search Indexing is Finished for %{public}@.", buf, 0xCu);
    }
  }
  else
  {
    self->_double lastKnownElapsedIndexingTime = CFAbsoluteTimeGetCurrent() - self->_lastIndexingStartTime;
    uint64_t v30 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      double lastKnownElapsedIndexingTime = self->_lastKnownElapsedIndexingTime;
      id v32 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 134349314;
      __int16 v119 = *(PLSearchIndexManager **)&lastKnownElapsedIndexingTime;
      __int16 v120 = 2114;
      uint64_t v121 = (uint64_t)v32;
      _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "Search Indexing is Finished. Took %{public}f seconds for %{public}@.", buf, 0x16u);
    }
    uint64_t v33 = [MEMORY[0x1E4F1C9C8] date];
    dateOfLastSearchIndexRebuild = self->_dateOfLastSearchIndexRebuild;
    self->_dateOfLastSearchIndexRebuild = v33;

    self->_lastIndexingStartTime = 0.0;
    self->_startedIndexing = 0;
  }
  uint64_t v37 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    id v38 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)buf = 138543362;
    __int16 v119 = v38;
    _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEFAULT, "Finished indexing for the Photos Search Index (enqueuedUUIDs count is 0). Scheduling search index close if needed for %{public}@.", buf, 0xCu);
  }
  [(PLSearchIndexManager *)self _inqScheduleCloseIndexIfNeeded];
  [(PLSearchIndexManager *)self setDateBeganIndexingOnBattery:0];
  [(PLSearchIndexManager *)self setDatePausedIndexingOnBattery:0];
LABEL_44:
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) <= 0x20uLL) {
    unint64_t v5 = 32;
  }
  else {
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  id v6 = a3;
  id v7 = a2;
  unint64_t v8 = [v6 count];
  if (v5 >= v8) {
    unint64_t v5 = v8;
  }
  unint64_t v9 = 32 - v5;
  if (v5 > 0x20) {
    unint64_t v9 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v9;
  int v10 = [v6 array];
  objc_msgSend(v10, "subarrayWithRange:", 0, v5);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) setObject:v11 forKey:v7];
  objc_msgSend(v6, "removeObjectsInRange:", 0, v5);
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_304(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
    if (!v7)
    {
      id v7 = objc_opt_new();
      [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
    }
    [v7 addObject:v5];
  }
  else
  {
    id v7 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = [v5 uniqueIdentifier];
      unint64_t v9 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2114;
      id v13 = v9;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to add CSSearchableItem for donation. Missing bundleIdentifier for searchableItem: %{public}@ for %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_306(uint64_t a1)
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = +[PLLibraryScope activeLibraryScopeInManagedObjectContext:v2];
  *(unsigned char *)(*(void *)(a1 + 40) + 142) = v3 != 0;

  uint64_t v4 = [PLSearchIndexingContext alloc];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 88);
  unint64_t v8 = +[PLSearchIndexConfiguration locale];
  uint64_t v9 = v6;
  uint64_t v10 = a1;
  id v11 = -[PLSearchIndexingContext initWithSceneTaxonomyProvider:csuTaxonomyObjectStore:locale:calendar:indexDateFormatter:delegate:seasonSynonyms:synonymsByIndexCategoryMask:](v4, "initWithSceneTaxonomyProvider:csuTaxonomyObjectStore:locale:calendar:indexDateFormatter:delegate:seasonSynonyms:synonymsByIndexCategoryMask:", v9, v7, v8, *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 40) + 8), *(void *)(a1 + 56), *(void *)(a1 + 64));

  id v105 = v11;
  id v106 = (void *)v2;
  uint64_t v107 = a1;
  if ([*(id *)(a1 + 72) count])
  {
    __int16 v12 = objc_opt_class();
    uint64_t v13 = *(void *)(a1 + 72);
    id v126 = 0;
    uint64_t v14 = [v12 fetchAssetsWithUUIDs:v13 managedObjectContext:v2 error:&v126];
    id v15 = v126;
    __int16 v16 = (void *)v2;
    id v96 = v15;
    if (v14)
    {
      uint64_t v17 = [v14 count];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = 0;
        uint64_t v99 = v17;
        uint64_t v100 = v14;
        do
        {
          uint64_t v20 = (void *)MEMORY[0x19F38D3B0]();
          uint64_t v21 = [v14 objectAtIndex:v19];
          if (([v21 isDeleted] & 1) != 0
            || ([v21 uuid], uint64_t v22 = objc_claimAutoreleasedReturnValue(), v22, !v22))
          {
            os_signpost_id_t v24 = PLSearchBackendIndexManagerGetLog();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
              goto LABEL_24;
            }
            __int16 v41 = [v21 uuid];
            uint64_t v42 = v107;
            uint64_t v43 = [*(id *)(v107 + 40) photoLibraryTypeDescription];
            *(_DWORD *)buf = 138543618;
            uint64_t v130 = v41;
            __int16 v131 = 2114;
            id v132 = v43;
            BOOL v44 = v24;
            uint64_t v45 = "Asset is deleted. Not indexing asset UUID: %{public}@ for %{public}@";
          }
          else
          {
            uint64_t v23 = [v21 dateCreated];

            if (v23)
            {
              os_signpost_id_t v24 = [v21 documentObservation];
              uint64_t v25 = *(void **)(v107 + 80);
              id v26 = [v21 uuid];
              uint64_t v27 = v25;
              uint64_t v10 = v107;
              uint64_t v28 = [v27 objectForKeyedSubscript:v26];
              uint64_t v29 = (void *)v28;
              uint64_t v30 = (void *)MEMORY[0x1E4F1CC08];
              if (v28) {
                uint64_t v30 = (void *)v28;
              }
              id v31 = v30;

              id v32 = +[PSIAssetTranslator psiAssetFromAsset:v21 graphData:v31 indexingContext:v105 documentObservation:v24];
              if (v32) {
                [*(id *)(v107 + 88) addObject:v32];
              }
              if (*(unsigned char *)(v107 + 152))
              {
                uint64_t v33 = +[PLSpotlightDonationUtilities bundleIdentifierForAsset:v21];
                uint64_t v34 = [*(id *)(*(void *)(v107 + 40) + 24) libraryServicesManager];
                uint64_t v35 = +[PLSpotlightAssetTranslator spotlightSearchableItemFromAsset:libraryIdentifier:graphData:indexingContext:documentObservation:](PLSpotlightAssetTranslator, "spotlightSearchableItemFromAsset:libraryIdentifier:graphData:indexingContext:documentObservation:", v21, [v34 wellKnownPhotoLibraryIdentifier], v31, v105, v24);

                uint64_t v10 = v107;
                if (v35)
                {
                  id v98 = v33;
                  id v97 = PLSearchBackendIndexManagerGetLog();
                  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
                  {
                    id v94 = [v21 uuid];
                    uint64_t v36 = [v35 uniqueIdentifier];
                    id v95 = [v35 attributeSet];
                    uint64_t v37 = [v95 debugDescription];
                    uint64_t v38 = [*(id *)(v107 + 40) photoLibraryTypeDescription];
                    *(_DWORD *)buf = 138544386;
                    uint64_t v130 = v94;
                    __int16 v131 = 2114;
                    id v132 = v33;
                    __int16 v133 = 2114;
                    uint64_t v39 = (void *)v36;
                    uint64_t v134 = v36;
                    __int16 v135 = 2112;
                    v136 = v37;
                    __int16 v137 = 2114;
                    uint64_t v138 = v38;
                    uint64_t v40 = (void *)v38;
                    _os_log_impl(&dword_19B3C7000, v97, OS_LOG_TYPE_DEBUG, "Created CSSearchableItem for asset UUID: %{public}@, bundleIdentifier: %{public}@, searchableItem.uniqueIdentifier: %{public}@, attributes: %@ for %{public}@", buf, 0x34u);

                    uint64_t v10 = v107;
                  }

                  uint64_t v33 = v98;
                  (*(void (**)(void))(*(void *)(v10 + 136) + 16))();
                }
              }
              __int16 v16 = v106;
              objc_msgSend(v106, "refreshObject:mergeChanges:", v21, objc_msgSend(v21, "hasChanges"));

              uint64_t v18 = v99;
              uint64_t v14 = v100;
              goto LABEL_25;
            }
            os_signpost_id_t v24 = PLSearchBackendIndexManagerGetLog();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
LABEL_24:
              uint64_t v10 = v107;
              goto LABEL_25;
            }
            __int16 v41 = [v21 uuid];
            uint64_t v42 = v107;
            uint64_t v43 = [*(id *)(v107 + 40) photoLibraryTypeDescription];
            *(_DWORD *)buf = 138543618;
            uint64_t v130 = v41;
            __int16 v131 = 2114;
            id v132 = v43;
            BOOL v44 = v24;
            uint64_t v45 = "Asset missing creation date. Not indexing asset UIUD: %{public}@ for %{public}@";
          }
          _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_INFO, v45, buf, 0x16u);

          uint64_t v10 = v42;
          __int16 v16 = v106;
LABEL_25:

          ++v19;
        }
        while (v18 != v19);
      }
    }
    else
    {
      id v47 = v15;
      id v48 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        uint64_t v49 = [*(id *)(a1 + 40) photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v130 = v49;
        __int16 v131 = 2112;
        id v132 = v47;
        _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "Failed to fetch Assets while indexing batch for %{public}@. Error: %@", buf, 0x16u);

        __int16 v16 = (void *)v2;
      }

      uint64_t v10 = a1;
    }

    id v11 = v105;
    uint64_t v46 = v96;
  }
  else
  {
    uint64_t v46 = 0;
    __int16 v16 = (void *)v2;
  }
  if ([*(id *)(v10 + 96) count])
  {
    id v50 = objc_opt_class();
    uint64_t v51 = *(void *)(v10 + 96);
    id v125 = v46;
    id v52 = [v50 fetchHighlightsWithUUIDs:v51 managedObjectContext:v16 error:&v125];
    id v53 = v125;

    if (v52)
    {
      id v103 = v53;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v54 = v52;
      uint64_t v55 = [v54 countByEnumeratingWithState:&v121 objects:v128 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        id v101 = v52;
        uint64_t v57 = *(void *)v122;
        do
        {
          for (uint64_t i = 0; i != v56; ++i)
          {
            if (*(void *)v122 != v57) {
              objc_enumerationMutation(v54);
            }
            id v59 = *(void **)(*((void *)&v121 + 1) + 8 * i);
            if ([v59 isEligibleForSearchIndexing])
            {
              id v60 = +[PLSpotlightHighlightTranslator spotlightSearchableItemFromHighlight:v59];
              if (v60)
              {
                uint64_t v61 = *(void *)(v107 + 136);
                id v62 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
                (*(void (**)(uint64_t, void *, void *))(v61 + 16))(v61, v60, v62);

                __int16 v16 = v106;
              }
              objc_msgSend(v16, "refreshObject:mergeChanges:", v59, objc_msgSend(v59, "hasChanges"));
            }
          }
          uint64_t v56 = [v54 countByEnumeratingWithState:&v121 objects:v128 count:16];
        }
        while (v56);
        id v11 = v105;
        id v52 = v101;
        id v53 = v103;
      }
    }
    else
    {
      id v54 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        id v63 = [*(id *)(v107 + 40) photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v130 = v63;
        __int16 v131 = 2112;
        id v132 = v53;
        _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_ERROR, "Failed to fetch Highlights while indexing a batch for %{public}@. Error: %@", buf, 0x16u);

        __int16 v16 = v106;
      }
    }

    uint64_t v10 = v107;
  }
  else
  {
    id v53 = v46;
  }
  if ([*(id *)(v10 + 104) count])
  {
    id v64 = objc_opt_class();
    uint64_t v65 = *(void *)(v10 + 104);
    id v120 = v53;
    id v66 = [v64 fetchAlbumsWithUUIDs:v65 managedObjectContext:v16 error:&v120];
    id v67 = v120;

    if (v66)
    {
      long long v119 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v116 = 0u;
      id v68 = v66;
      uint64_t v69 = [v68 countByEnumeratingWithState:&v116 objects:v127 count:16];
      if (v69)
      {
        uint64_t v70 = v69;
        id v102 = v66;
        id v104 = v67;
        uint64_t v71 = *(void *)v117;
        do
        {
          for (uint64_t j = 0; j != v70; ++j)
          {
            if (*(void *)v117 != v71) {
              objc_enumerationMutation(v68);
            }
            v73 = *(void **)(*((void *)&v116 + 1) + 8 * j);
            id v74 = (void *)MEMORY[0x19F38D3B0]();
            if ([v73 isEligibleForSearchIndexing])
            {
              v75 = +[PSIAlbumTranslator psiCollectionFromAlbum:v73 indexingContext:v11];
              if (v75) {
                [*(id *)(v10 + 112) addObject:v75];
              }
              if (*(unsigned char *)(v10 + 152))
              {
                id v76 = +[PLSpotlightAlbumTranslator spotlightSearchableItemFromAlbum:v73];
                if (v76)
                {
                  uint64_t v77 = *(void *)(v107 + 136);
                  id v78 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
                  v79 = *(void (**)(uint64_t, void *, void *))(v77 + 16);
                  uint64_t v80 = v77;
                  __int16 v16 = v106;
                  v79(v80, v76, v78);

                  id v11 = v105;
                }

                uint64_t v10 = v107;
              }
              objc_msgSend(v16, "refreshObject:mergeChanges:", v73, objc_msgSend(v73, "hasChanges"));
            }
          }
          uint64_t v70 = [v68 countByEnumeratingWithState:&v116 objects:v127 count:16];
        }
        while (v70);
        id v66 = v102;
        id v67 = v104;
      }
    }
    else
    {
      id v68 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v81 = [*(id *)(v10 + 40) photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v130 = v81;
        __int16 v131 = 2112;
        id v132 = v67;
        _os_log_impl(&dword_19B3C7000, v68, OS_LOG_TYPE_ERROR, "Failed to fetch Albums while indexing a batch for %{public}@. Error: %@", buf, 0x16u);

        id v11 = v105;
      }
    }
  }
  else
  {
    id v67 = v53;
  }
  int v82 = PLIsFeaturedContentAllowed();
  if ([*(id *)(v107 + 120) count] && v82)
  {
    id v83 = *(void **)(v107 + 40);
    id v84 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(v107 + 120)];
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_314;
    v108[3] = &unk_1E5863BD8;
    BOOL v109 = v11;
    id v110 = *(id *)(v107 + 112);
    char v115 = *(unsigned char *)(v107 + 152);
    id v113 = *(id *)(v107 + 136);
    id v85 = v106;
    uint64_t v86 = *(void *)(v107 + 40);
    id v111 = v85;
    uint64_t v112 = v86;
    uint64_t v114 = *(void *)(v107 + 144);
    [v83 _fetchMemoriesToIndexWithUUIDs:v84 managedObjectContext:v85 result:v108];

    id v87 = v109;
LABEL_81:

    goto LABEL_82;
  }
  if ([*(id *)(v107 + 128) count]) {
    char v88 = v82;
  }
  else {
    char v88 = 1;
  }
  if ((v88 & 1) == 0)
  {
    uint64_t v89 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(v107 + 128)];
    uint64_t v90 = *(void *)(*(void *)(v107 + 144) + 8);
    BOOL v91 = *(void **)(v90 + 40);
    *(void *)(v90 + 40) = v89;

    id v87 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      BOOL v92 = *(void **)(*(void *)(*(void *)(v107 + 144) + 8) + 40);
      id v93 = [*(id *)(v107 + 40) photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v130 = v92;
      __int16 v131 = 2114;
      id v132 = v93;
      _os_log_impl(&dword_19B3C7000, v87, OS_LOG_TYPE_INFO, "Featured Content is disabled for %{public}@. Removing Memories from search index. Memory UUIDs: %{public}@", buf, 0x16u);

      id v11 = v105;
    }
    goto LABEL_81;
  }
LABEL_82:
  [v106 refreshAllObjects];
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_318(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    CFAbsoluteTime v3 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 96);
    uint64_t v4 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    *(_DWORD *)buf = 134349314;
    CFAbsoluteTime v22 = v3;
    __int16 v23 = 2114;
    os_signpost_id_t v24 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_INFO, "PhotoLibrary performBlock for index batch took %{public}f seconds for %{public}@.", buf, 0x16u);
  }
  uint64_t v5 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_319;
  v10[3] = &unk_1E5863CA0;
  v10[4] = v5;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 88);
  id v11 = v6;
  uint64_t v17 = v7;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 104);
  id v15 = v8;
  uint64_t v18 = v9;
  uint64_t v19 = *(void *)(a1 + 96);
  __int16 v20 = *(_WORD *)(a1 + 112);
  id v16 = *(id *)(a1 + 80);
  [v5 _onQueueAsync:v10];
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_319(uint64_t a1)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  CFAbsoluteTime v3 = [*(id *)(a1 + 32) _assetUUIDsToRemoveFromUUIDsToProcess:*(void *)(a1 + 40)];
  uint64_t v4 = [*(id *)v2 _collectionUUIDsToRemoveFromUUIDsToProcess:*(void *)(v2 + 8)];
  if ([*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count])
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) allObjects];
    uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];

    uint64_t v4 = (void *)v6;
  }
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x2020000000;
  BOOL v75 = 0;
  BOOL v75 = [*(id *)(a1 + 48) count] == 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x2020000000;
  BOOL v73 = 0;
  BOOL v73 = [*(id *)(a1 + 56) count] == 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x2020000000;
  BOOL v71 = 0;
  BOOL v71 = [v3 count] == 0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  BOOL v69 = 0;
  BOOL v69 = [v4 count] == 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x2020000000;
  BOOL v67 = 0;
  BOOL v67 = [*(id *)(a1 + 64) count] == 0;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_2;
  v57[3] = &unk_1E5863C28;
  id v60 = v72;
  uint64_t v61 = v70;
  id v62 = v68;
  id v63 = v66;
  uint64_t v7 = *(void *)(a1 + 32);
  id v59 = v74;
  v57[4] = v7;
  id v8 = *(id *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 96);
  id v58 = v8;
  uint64_t v64 = v9;
  uint64_t v65 = *(void *)(a1 + 104);
  uint64_t v10 = (void (**)(void))MEMORY[0x19F38D650](v57);
  [*(id *)(a1 + 32) _inqEnsureSearchIndexExists];
  id v11 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [*(id *)(a1 + 48) count];
    uint64_t v13 = [v3 count];
    id v14 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    *(_DWORD *)buf = 134349570;
    uint64_t v77 = v12;
    __int16 v78 = 2050;
    uint64_t v79 = v13;
    __int16 v80 = 2114;
    v81 = v14;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Search Index Updates: [PSIAsset] Adding %{public}ld, Removing %{public}ld for %{public}@", buf, 0x20u);
  }
  id v15 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [*(id *)(a1 + 56) count];
    uint64_t v17 = [v4 count];
    uint64_t v18 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    *(_DWORD *)buf = 134349570;
    uint64_t v77 = v16;
    __int16 v78 = 2050;
    uint64_t v79 = v17;
    __int16 v80 = 2114;
    v81 = v18;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Search Index Updates: [PSICollection] Adding %{public}ld, Removing %{public}ld for %{public}@", buf, 0x20u);
  }
  v10[2](v10);
  if ([v4 count])
  {
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_324;
    v53[3] = &unk_1E58694A8;
    v53[4] = *(void *)(a1 + 32);
    id v19 = v4;
    id v54 = v19;
    uint64_t v56 = v68;
    uint64_t v55 = v10;
    __int16 v20 = (void (**)(void))MEMORY[0x19F38D650](v53);
    uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 32);
    if (v21) {
      [v21 removeCollectionsWithUUIDs:v19 completion:v20];
    }
    else {
      v20[2](v20);
    }
    if (*(unsigned char *)(a1 + 112))
    {
      CFAbsoluteTime v22 = [*(id *)(a1 + 32) spotlightDonationManager];
      [v22 deleteSearchableItemsWithIdentifiers:v19];
    }
  }
  if ([v3 count])
  {
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_3;
    v49[3] = &unk_1E58694A8;
    v49[4] = *(void *)(a1 + 32);
    id v23 = v3;
    id v50 = v23;
    id v52 = v70;
    uint64_t v51 = v10;
    os_signpost_id_t v24 = (void (**)(void))MEMORY[0x19F38D650](v49);
    uint64_t v25 = *(void **)(*(void *)(a1 + 32) + 32);
    if (v25) {
      [v25 removeAssetsWithUUIDs:v23 completion:v24];
    }
    else {
      v24[2](v24);
    }
    if (*(unsigned char *)(a1 + 112) && !*(unsigned char *)(a1 + 113))
    {
      id v26 = [*(id *)(a1 + 32) spotlightDonationManager];
      [v26 deleteSearchableItemsWithIdentifiers:v23];
    }
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  if ([*(id *)(a1 + 48) count])
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_5;
    v44[3] = &unk_1E5863C50;
    objc_copyWeak(&v48, (id *)buf);
    id v45 = *(id *)(a1 + 48);
    id v47 = v74;
    uint64_t v46 = v10;
    uint64_t v27 = (void (**)(void))MEMORY[0x19F38D650](v44);
    uint64_t v28 = *(void **)(*(void *)(a1 + 32) + 32);
    if (v28) {
      [v28 addAssets:*(void *)(a1 + 48) withCompletion:v27];
    }
    else {
      v27[2](v27);
    }
    if (*(unsigned char *)(a1 + 112))
    {
      uint64_t v29 = *(void **)(a1 + 80);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_7;
      v43[3] = &unk_1E586BDB8;
      v43[4] = *(void *)(a1 + 32);
      [v29 enumerateKeysAndObjectsUsingBlock:v43];
    }

    objc_destroyWeak(&v48);
  }
  if ([*(id *)(a1 + 56) count])
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_8;
    v38[3] = &unk_1E5863C50;
    objc_copyWeak(&v42, (id *)buf);
    id v39 = *(id *)(a1 + 56);
    __int16 v41 = v72;
    uint64_t v40 = v10;
    uint64_t v30 = (void (**)(void))MEMORY[0x19F38D650](v38);
    id v31 = *(void **)(*(void *)(a1 + 32) + 32);
    if (v31) {
      [v31 addCollections:*(void *)(a1 + 56) withCompletion:v30];
    }
    else {
      v30[2](v30);
    }

    objc_destroyWeak(&v42);
  }
  if ([*(id *)(a1 + 64) count])
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_10;
    v34[3] = &unk_1E5863C78;
    objc_copyWeak(&v37, (id *)buf);
    uint64_t v36 = v66;
    uint64_t v35 = v10;
    id v32 = (void (**)(void))MEMORY[0x19F38D650](v34);
    uint64_t v33 = *(void **)(*(void *)(a1 + 32) + 32);
    if (v33) {
      [v33 deleteGroupsWithGraphCollectionsForPersonUUIDs:*(void *)(a1 + 64) withCompletion:v32];
    }
    else {
      v32[2](v32);
    }

    objc_destroyWeak(&v37);
  }
  objc_destroyWeak((id *)buf);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v68, 8);
  _Block_object_dispose(v70, 8);
  _Block_object_dispose(v72, 8);
  _Block_object_dispose(v74, 8);
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 104));
    id v2 = *(id *)(*(void *)(a1 + 32) + 112);
    id v37 = NSString;
    id v39 = [v2 objectForKeyedSubscript:@"insertAsset"];
    uint64_t v35 = [v39 count];
    uint64_t v38 = [v2 objectForKeyedSubscript:@"removeAsset"];
    uint64_t v33 = [v38 count];
    uint64_t v36 = [v2 objectForKeyedSubscript:@"insertAlbum"];
    uint64_t v32 = [v36 count];
    uint64_t v34 = [v2 objectForKeyedSubscript:@"removeAlbum"];
    uint64_t v31 = [v34 count];
    CFAbsoluteTime v3 = [v2 objectForKeyedSubscript:@"insertMemory"];
    uint64_t v30 = [v3 count];
    uint64_t v4 = [v2 objectForKeyedSubscript:@"removeMemory"];
    uint64_t v5 = [v4 count];
    uint64_t v6 = [v2 objectForKeyedSubscript:@"insertHighlight"];
    uint64_t v7 = [v6 count];
    id v8 = [v2 objectForKeyedSubscript:@"removeHighlight"];
    uint64_t v9 = [v8 count];
    uint64_t v10 = [v2 objectForKeyedSubscript:@"renamePerson"];
    id v11 = [v37 stringWithFormat:@"(%@) index progress -> assets[+%d -%d] albums[+%d -%d] [memories[+%d -%d]] highlights[+%d -%d] renamedPersons[+%d]", @"iter", v35, v33, v32, v31, v30, v5, v7, v9, objc_msgSend(v10, "count")];

    uint64_t v12 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v46 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 112) objectEnumerator];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v55 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(v13);
          }
          v16 += [*(id *)(*((void *)&v41 + 1) + 8 * i) count];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v55 count:16];
      }
      while (v15);
    }
    else
    {
      uint64_t v16 = 0;
    }

    id v19 = *(id *)(a1 + 40);
    __int16 v20 = v19;
    os_signpost_id_t v21 = *(void *)(a1 + 88);
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v20, OS_SIGNPOST_INTERVAL_END, v21, "SearchIndexManager - IndexBatch", "", buf, 2u);
    }

    [*(id *)(a1 + 32) _setIndexing:0];
    CFAbsoluteTime v22 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
      CFAbsoluteTime v24 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 96);
      uint64_t v25 = *(void *)(a1 + 32);
      id v26 = [*(id *)(v25 + 16) libraryURL];
      *(_DWORD *)buf = 138544386;
      uint64_t v46 = v23;
      __int16 v47 = 2050;
      CFAbsoluteTime v48 = v24;
      __int16 v49 = 2050;
      uint64_t v50 = v16;
      __int16 v51 = 2050;
      uint64_t v52 = v25;
      __int16 v53 = 2112;
      id v54 = v26;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Indexing Batch: [END] for %{public}@. Took %{public}f seconds. %{public}ld items remaining for the Photos Search Index. Search Index Manager: %{public}p, PhotoLibrary path: %@", buf, 0x34u);
    }
    uint64_t v27 = [*(id *)(a1 + 32) _inqAfterIndexingDidIterate];
    uint64_t v28 = (void *)v27;
    if (v27)
    {
      (*(void (**)(uint64_t))(v27 + 16))(v27);
      [*(id *)(a1 + 32) _setInqAfterIndexingDidIterate:0];
    }
    else
    {
      uint64_t v29 = *(unsigned char **)(a1 + 32);
      if (!v29[136])
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_323;
        v40[3] = &unk_1E5875CE0;
        v40[4] = v29;
        [v29 _onQueueAsync:v40];
      }
    }
  }
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_324(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_2_325;
  v5[3] = &unk_1E58694A8;
  v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v7 = v4;
  [v2 _onQueueAsync:v5];
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_4;
  v5[3] = &unk_1E58694A8;
  v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v7 = v4;
  [v2 _onQueueAsync:v5];
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_5(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_6;
  v6[3] = &unk_1E5863C50;
  objc_copyWeak(&v9, v2);
  id v7 = *(id *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v8 = v5;
  [WeakRetained _onQueueAsync:v6];

  objc_destroyWeak(&v9);
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 spotlightDonationManager];
  [v7 donateSearchableItems:v5 bundleIdentifier:v6];
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_8(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_9;
  v6[3] = &unk_1E5863C50;
  objc_copyWeak(&v9, v2);
  id v7 = *(id *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v8 = v5;
  [WeakRetained _onQueueAsync:v6];

  objc_destroyWeak(&v9);
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_11;
  v5[3] = &unk_1E5870D98;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [WeakRetained _onQueueAsync:v5];
}

uint64_t __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_11(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_9(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
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
        id v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "uuid", (void)v10);
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [WeakRetained[15] removeObjectsForKeys:v3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_6(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
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
        id v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "uuid", (void)v10);
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [WeakRetained[15] removeObjectsForKeys:v3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_4(void *a1)
{
  [*(id *)(a1[4] + 120) removeObjectsForKeys:a1[5]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  id v2 = *(uint64_t (**)(void))(a1[6] + 16);
  return v2();
}

uint64_t __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_2_325(void *a1)
{
  [*(id *)(a1[4] + 120) removeObjectsForKeys:a1[5]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  id v2 = *(uint64_t (**)(void))(a1[6] + 16);
  return v2();
}

uint64_t __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_323(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Process another batch for %{public}@. Resuming indexing if needed.", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) _inqResumeIndexingIfNeeded];
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_314(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v7;
    uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v27 = v8;
      id v28 = v9;
      id v29 = v7;
      uint64_t v12 = *(void *)v32;
      long long v13 = obj;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v13);
          }
          uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v16 = (void *)MEMORY[0x19F38D3B0]();
          if ([v15 isEligibleForSearchIndexing])
          {
            uint64_t v17 = +[PSIMemoryTranslator psiCollectionFromMemory:v15 indexingContext:*(void *)(a1 + 32)];
            if (v17) {
              [*(id *)(a1 + 40) addObject:v17];
            }
            if (*(unsigned char *)(a1 + 80))
            {
              uint64_t v18 = +[PLSpotlightMemoryTranslator spotlightSearchableItemFromMemory:v15];
              if (v18)
              {
                uint64_t v19 = *(void *)(a1 + 64);
                __int16 v20 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
                os_signpost_id_t v21 = *(void (**)(uint64_t, void *, void *))(v19 + 16);
                uint64_t v22 = v19;
                long long v13 = obj;
                v21(v22, v18, v20);
              }
            }
            objc_msgSend(*(id *)(a1 + 48), "refreshObject:mergeChanges:", v15, objc_msgSend(v15, "hasChanges", v27, v28, v29));
          }
        }
        uint64_t v11 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v11);
      id v9 = v28;
      id v7 = v29;
      id v8 = v27;
    }
  }
  else
  {
    id v23 = PLSearchBackendIndexManagerGetLog();
    id obj = v23;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      CFAbsoluteTime v24 = [*(id *)(a1 + 56) photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v24;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Failed to fetch Memories while indexing a batch for %{public}@. Error: %@", buf, 0x16u);
    }
  }

  uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
  id v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v8;
}

- (void)resumeIndexingIfAllowed
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__PLSearchIndexManager_resumeIndexingIfAllowed__block_invoke;
  v2[3] = &unk_1E5875CE0;
  v2[4] = self;
  [(PLSearchIndexManager *)self _onQueueAsync:v2];
}

uint64_t __47__PLSearchIndexManager_resumeIndexingIfAllowed__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _inqResumeIndexingIfNeeded];
}

- (BOOL)_shouldResumeIndexingBasedOnDevicePowerStatusOrDAS
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v3 = [(id)objc_opt_class() _isUnboundedIndexingAllowed];
  if (!self->_shouldLimitIndexingWhileOnBattery || (v3 & 1) != 0)
  {
    if (self->_shouldLimitIndexingWhileOnBattery)
    {
      if (!v3)
      {
LABEL_18:
        -[PLSearchIndexManager setDateBeganIndexingOnBattery:](self, "setDateBeganIndexingOnBattery:", 0, *(_OWORD *)v28);
        [(PLSearchIndexManager *)self setDatePausedIndexingOnBattery:0];
        return 1;
      }
      long long v13 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)id v28 = 138543362;
        *(void *)&v28[4] = v14;
        uint64_t v15 = "Indexing on power or because DAS has allowed indexing for %{public}@.";
LABEL_16:
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, v15, v28, 0xCu);
      }
    }
    else
    {
      long long v13 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)id v28 = 138543362;
        *(void *)&v28[4] = v14;
        uint64_t v15 = "Battery indexing limitations overridden, no battery or DAS indexing limits applied for %{public}@.";
        goto LABEL_16;
      }
    }

    goto LABEL_18;
  }
  id v4 = [(PLSearchIndexManager *)self dateBeganIndexingOnBattery];

  if (!v4)
  {
    uint64_t v16 = [(PLSearchIndexManager *)self datePausedIndexingOnBattery];

    if (v16)
    {
      uint64_t v17 = [(PLSearchIndexManager *)self datePausedIndexingOnBattery];
      [v17 timeIntervalSinceNow];
      double v19 = (0.0 - v18) / 60.0;

      __int16 v20 = PLSearchBackendIndexManagerGetLog();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19 <= 60.0)
      {
        if (v21)
        {
          id v27 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
          *(_DWORD *)id v28 = 134218498;
          *(double *)&v28[4] = v19;
          *(_WORD *)&v28[12] = 2114;
          *(void *)&v28[14] = v27;
          __int16 v29 = 2048;
          uint64_t v30 = 60;
          _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Search indexing on battery has been paused for %f minutes for %{public}@, indexing will remain paused for a minimum of %tu minutes.", v28, 0x20u);
        }
        return 0;
      }
      if (v21)
      {
        uint64_t v22 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)id v28 = 134218498;
        *(double *)&v28[4] = v19;
        *(_WORD *)&v28[12] = 2114;
        *(void *)&v28[14] = v22;
        __int16 v29 = 2048;
        uint64_t v30 = 5;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Search indexing on battery has been paused for %f minutes for %{public}@, resuming indexing for %tu minutes.", v28, 0x20u);
      }
      [(PLSearchIndexManager *)self setDatePausedIndexingOnBattery:0];
    }
    else
    {
      id v23 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        CFAbsoluteTime v24 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)id v28 = 138543362;
        *(void *)&v28[4] = v24;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "Began indexing on battery for %{public}@.", v28, 0xCu);
      }
    }
    uint64_t v25 = [MEMORY[0x1E4F1C9C8] now];
    [(PLSearchIndexManager *)self setDateBeganIndexingOnBattery:v25];

    return 1;
  }
  int v5 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)id v28 = 138543362;
    *(void *)&v28[4] = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Indexing on battery for %{public}@.", v28, 0xCu);
  }
  id v7 = [(PLSearchIndexManager *)self dateBeganIndexingOnBattery];
  [v7 timeIntervalSinceNow];
  double v9 = (0.0 - v8) / 60.0;

  if (v9 <= 5.0) {
    return 1;
  }
  uint64_t v10 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)id v28 = 134218498;
    *(double *)&v28[4] = v9;
    *(_WORD *)&v28[12] = 2114;
    *(void *)&v28[14] = v11;
    __int16 v29 = 2048;
    uint64_t v30 = 60;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Search has been indexing on battery for %f minutes for %{public}@, pausing indexing for %tu minutes.", v28, 0x20u);
  }
  [(PLSearchIndexManager *)self setDateBeganIndexingOnBattery:0];
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
  [(PLSearchIndexManager *)self setDatePausedIndexingOnBattery:v12];

  [(PLSearchIndexManager *)self _inqCloseIndexIfAbleOrForce:1 isDelete:0];
  return 0;
}

- (void)_inqValidateSearchIndexWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PLSearchIndexManager__inqValidateSearchIndexWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E5866240;
  v14[4] = self;
  int v5 = (void (**)(void))v4;
  id v15 = v5;
  uint64_t v6 = (void (**)(void, void))MEMORY[0x19F38D650](v14);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v7 = [(PLSearchIndexManager *)self _inqPhotoLibrary];
    double v8 = [v7 globalValues];
    double v9 = [v8 searchIndexVersion];

    if (v9)
    {
      uint64_t v10 = [v7 globalValues];
      [v10 setSearchIndexSceneTaxonomySHA:0];

      uint64_t v11 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v13 = 0;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Reindexing because feature flag PhotosSearchBackgroundJobWorker was turned off", v13, 2u);
      }

      v6[2](v6, 9);
      goto LABEL_11;
    }
  }
  int64_t v12 = [(PLSearchIndexManager *)self _inqRebuildReasonIfSearchIndexIsValid];
  if (v12
    || (int64_t v12 = [(PLSearchIndexManager *)self _inqSpotlightRequestedRebuild]) != 0
    || ([(PLSearchIndexManager *)self _inqEnsureSearchIndexExists],
        [(PLSearchIndexManager *)self _inqEnsureSceneTaxonomyProxyExists],
        [(PLSearchIndexManager *)self _inqEnsureCSUTaxonomyProxyExists],
        (int64_t v12 = [(PLSearchIndexManager *)self _inqRebuildReasonIfSearchSupportingDataIsValid]) != 0))
  {
    v6[2](v6, v12);
  }
  else if (v5)
  {
    v5[2](v5);
  }
LABEL_11:
}

void __69__PLSearchIndexManager__inqValidateSearchIndexWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a2 - 1) > 0xA) {
      int v5 = @"PLSearchIndexRebuildReasonNone";
    }
    else {
      int v5 = off_1E5863DA0[a2 - 1];
    }
    uint64_t v6 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    *(_DWORD *)buf = 138543874;
    uint64_t v11 = v5;
    __int16 v12 = 2050;
    uint64_t v13 = a2;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Detected reason to reindex: %{public}@ (%{public}ld) for %{public}@", buf, 0x20u);
  }
  [*(id *)(a1 + 32) _inqSetIndexingPaused:1 reason:@"_PLSearchIndexPauseReasonInvalidSearchIndex"];
  id v7 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__PLSearchIndexManager__inqValidateSearchIndexWithCompletionHandler___block_invoke_297;
  v8[3] = &unk_1E58742F0;
  void v8[4] = v7;
  id v9 = *(id *)(a1 + 40);
  [v7 _inqResetSearchIndexWithReason:a2 dropCompletion:v8];
}

void __69__PLSearchIndexManager__inqValidateSearchIndexWithCompletionHandler___block_invoke_297(uint64_t a1)
{
  [*(id *)(a1 + 32) _inqSetIndexingPaused:0 reason:@"_PLSearchIndexPauseReasonInvalidSearchIndex"];
  [*(id *)(a1 + 32) unpauseIndexingWithReason:@"PLSearchIndexPauseReasonCloseSearchIndex"];
  id v4 = [*(id *)(a1 + 32) _inqPhotoLibrary];
  id v2 = [v4 globalValues];
  [v2 setSearchIndexVersion:0];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

- (id)_collectionUUIDsToRemoveFromUUIDsToProcess:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  int v5 = [v3 array];
  uint64_t v6 = [v4 objectForKey:@"removeHighlight"];
  [v5 addObjectsFromArray:v6];

  id v7 = [v4 objectForKey:@"removeAlbum"];
  [v5 addObjectsFromArray:v7];

  double v8 = [v4 objectForKey:@"removeMemory"];

  [v5 addObjectsFromArray:v8];
  return v5;
}

- (id)_assetUUIDsToRemoveFromUUIDsToProcess:(id)a3
{
  return (id)[a3 objectForKey:@"removeAsset"];
}

- (int64_t)_inqRebuildReasonIfSearchSupportingDataIsValid
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLSearchIndexManager *)self _wordEmbeddingVersion];
  BOOL v4 = [(PLSearchIndexManager *)self _inqUpdateWordEmbeddingVersion:v3];

  if (!self->_hasValidSearchSupportingData || (self->_shouldCheckDatabaseIntegrity ? (int v5 = 1) : (int v5 = v4), v5 == 1))
  {
    BOOL v6 = [(PLSearchIndexManager *)self _inqUpdateLocale];
    BOOL v7 = [(PLSearchIndexManager *)self _inqUpdateEmbeddingModelVersion];
    BOOL v8 = [(PLSearchIndexManager *)self _inqUpdateUtilityTypeClassifierVersion];
    id v9 = [(PLSearchIndexSceneTaxonomyProvider *)self->_sceneTaxonomyProvider digests];
    BOOL v10 = [(PLSearchIndexManager *)self _inqUpdateSceneTaxonomySHA:v9];

    if (v6)
    {
      uint64_t v11 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        int v21 = 138543362;
        uint64_t v22 = v12;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Detected reason to reindex: Locale changed for %{public}@.", (uint8_t *)&v21, 0xCu);
      }
      int64_t v13 = 2;
    }
    else if (v7)
    {
      uint64_t v11 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        int v21 = 138543362;
        uint64_t v22 = v14;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Detected reason to reindex: Embedding model version changed for %{public}@.", (uint8_t *)&v21, 0xCu);
      }
      int64_t v13 = 10;
    }
    else if (v8)
    {
      uint64_t v11 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        int v21 = 138543362;
        uint64_t v22 = v15;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Detected reason to reindex: Utility type classifier version changed for %{public}@.", (uint8_t *)&v21, 0xCu);
      }
      int64_t v13 = 11;
    }
    else if (v10)
    {
      uint64_t v11 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        int v21 = 138543362;
        uint64_t v22 = v16;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Detected reason to reindex: Scene Taxonomy SHA changed for %{public}@.", (uint8_t *)&v21, 0xCu);
      }
      int64_t v13 = 3;
    }
    else if (v4)
    {
      uint64_t v11 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        int v21 = 138543362;
        uint64_t v22 = v17;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Detected reason to reindex: Word Embedding version changed for %{public}@.", (uint8_t *)&v21, 0xCu);
      }
      int64_t v13 = 4;
    }
    else
    {
      if (!self->_shouldCheckDatabaseIntegrity || ![(PSIDatabase *)self->_db isDatabaseCorrupted])
      {
        int64_t v13 = 0;
        BOOL v19 = 1;
        goto LABEL_33;
      }
      uint64_t v11 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        double v18 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        int v21 = 138543362;
        uint64_t v22 = v18;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Detected unexpected reason to reindex: Search Index databsae is corrupted for %{public}@.", (uint8_t *)&v21, 0xCu);
      }
      int64_t v13 = 7;
    }

    BOOL v19 = 0;
LABEL_33:
    self->_hasValidSearchSupportingData = v19;
    self->_shouldCheckDatabaseIntegrity = 0;
    return v13;
  }
  return 0;
}

- (id)_wordEmbeddingVersion
{
  id v2 = +[PLSearchIndexConfiguration locale];
  uint64_t v3 = (void *)NLStringEmbeddingCopyCurrentVersion();

  return v3;
}

- (int64_t)_inqRebuildReasonIfSearchIndexIsValid
{
  [(PLSearchIndexManager *)self _inqEnsureSearchSystemInfoExists];
  if (self->_hasValidSearchIndex) {
    return 0;
  }
  int64_t result = [(PLSearchIndexManager *)self _inqUpdateVersion];
  self->_hasValidSearchIndex = result ^ 1;
  return result;
}

- (id)_inqPhotoLibrary
{
  [(PLSearchIndexManager *)self _inqEnsurePhotoLibraryExists];
  photoLibrary = self->_photoLibrary;
  return photoLibrary;
}

- (void)_inqEnsurePhotoLibraryExists
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_photoLibrary)
  {
    uint64_t v3 = objc_alloc_init(PLPhotoLibraryOptions);
    [(PLPhotoLibraryOptions *)v3 setRequiredState:6];
    [(PLPhotoLibraryOptions *)v3 setAutomaticallyPinToFirstFetch:0];
    BOOL v4 = [(PLPhotoLibraryPathManager *)self->_pathManager libraryURL];
    id v12 = 0;
    int v5 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLSearchIndexManager _inqEnsurePhotoLibraryExists]", v4, v3, &v12);
    id v6 = v12;
    photoLibrary = self->_photoLibrary;
    self->_photoLibrary = v5;

    if (!self->_photoLibrary)
    {
      BOOL v8 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = [(PLPhotoLibraryPathManager *)self->_pathManager libraryURL];
        *(_DWORD *)buf = 138412546;
        __int16 v14 = v9;
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Failed to load Photo Library from path \"%@\". Error: %@", buf, 0x16u);
      }
    }
  }
  if (!self->_dateFormatter)
  {
    BOOL v10 = objc_alloc_init(PLSearchIndexDateFormatter);
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v10;
  }
}

- (void)_inqEnsureCSUTaxonomyProxyExists
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_csuTaxonomyObjectStore)
  {
    uint64_t v3 = [(PLPhotoLibrary *)self->_photoLibrary pathManager];
    id v11 = 0;
    BOOL v4 = [v3 internalDirectoryWithSubType:5 additionalPathComponents:0 createIfNeeded:0 error:&v11];
    id v5 = v11;

    id v10 = v5;
    id v6 = (CSUSearchableKnowledgeObjectStore *)[objc_alloc(MEMORY[0x1E4F5D0B0]) initExistingDB:v4 error:&v10];
    id v7 = v10;

    csuTaxonomyObjectStore = self->_csuTaxonomyObjectStore;
    self->_csuTaxonomyObjectStore = v6;

    if (!self->_csuTaxonomyObjectStore || v7)
    {
      id v9 = PLSearchBackendSceneTaxonomyGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v7;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "CSU: Failed to load CSU EntityStore. Error: %@", buf, 0xCu);
      }
    }
  }
}

- (void)_inqEnsureSceneTaxonomyProxyExists
{
  if (!self->_sceneTaxonomyProvider)
  {
    uint64_t v3 = objc_alloc_init(PLSearchIndexSceneTaxonomyProvider);
    sceneTaxonomyProvider = self->_sceneTaxonomyProvider;
    self->_sceneTaxonomyProvider = v3;
  }
}

- (void)_inqIndexPhotoLibrary
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  [(PLSearchIndexManager *)self _inqEnsurePhotoLibraryExists];
  uint64_t v3 = self->_photoLibrary;
  self->_lastIndexingStartTime = CFAbsoluteTimeGetCurrent();
  log = [(PLSearchIndexManager *)self searchIndexManagerSignpostLog];
  BOOL v4 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Began indexing Photo Library: %@, Search Index Manager: %{public}p", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v114 = __Block_byref_object_copy__6864;
  char v115 = __Block_byref_object_dispose__6865;
  id v116 = 0;
  uint64_t v103 = 0;
  id v104 = &v103;
  uint64_t v105 = 0x3032000000;
  id v106 = __Block_byref_object_copy__6864;
  uint64_t v107 = __Block_byref_object_dispose__6865;
  id v108 = 0;
  uint64_t v97 = 0;
  id v98 = &v97;
  uint64_t v99 = 0x3032000000;
  uint64_t v100 = __Block_byref_object_copy__6864;
  id v101 = __Block_byref_object_dispose__6865;
  id v102 = 0;
  uint64_t v91 = 0;
  BOOL v92 = &v91;
  uint64_t v93 = 0x3032000000;
  id v94 = __Block_byref_object_copy__6864;
  id v95 = __Block_byref_object_dispose__6865;
  id v96 = 0;
  uint64_t v85 = 0;
  uint64_t v86 = &v85;
  uint64_t v87 = 0x3032000000;
  char v88 = __Block_byref_object_copy__6864;
  uint64_t v89 = __Block_byref_object_dispose__6865;
  id v90 = 0;
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __45__PLSearchIndexManager__inqIndexPhotoLibrary__block_invoke;
  v77[3] = &unk_1E5863B38;
  __int16 v78 = v3;
  uint64_t v79 = self;
  __int16 v80 = buf;
  v81 = &v103;
  uint64_t v82 = &v97;
  id v83 = &v91;
  id v84 = &v85;
  id v68 = v78;
  [(PLPhotoLibrary *)v78 performBlockAndWait:v77];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __45__PLSearchIndexManager__inqIndexPhotoLibrary__block_invoke_290;
  v76[3] = &unk_1E5863B60;
  v76[4] = self;
  id v6 = (void (**)(void, void, void))MEMORY[0x19F38D650](v76);
  ((void (**)(void, void, __CFString *))v6)[2](v6, *(void *)(*(void *)&buf[8] + 40), @"insertAsset");
  ((void (**)(void, uint64_t, __CFString *))v6)[2](v6, v104[5], @"insertAlbum");
  ((void (**)(void, uint64_t, __CFString *))v6)[2](v6, v98[5], @"insertMemory");
  ((void (**)(void, uint64_t, __CFString *))v6)[2](v6, v92[5], @"insertHighlight");
  id v7 = [PLPhotoAnalysisMomentGraphService alloc];
  BOOL v8 = [(PLPhotoLibrary *)v68 photoAnalysisClient];
  BOOL v71 = [(PLPhotoAnalysisMomentGraphService *)v7 initWithServiceProvider:v8];

  if (_os_feature_enabled_impl())
  {
    id v9 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)BOOL v109 = 138543362;
      double v110 = *(double *)&v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Skipping request for search data from photoanalysisd, %{public}@, ", v109, 0xCu);
    }
    id v11 = 0;
  }
  else
  {
    uint64_t v12 = v92[5];
    uint64_t v13 = v86[5];
    id v75 = 0;
    id v9 = [(PLSearchIndexManager *)self _inqRequestGraphDataForHighlightUUIDs:v12 momentUUIDs:v13 photoLibrary:v68 singleAssetOnly:0 error:&v75];
    id v14 = v75;
    if ([v9 count]) {
      [(NSMutableDictionary *)self->_inqGraphDataByUUID addEntriesFromDictionary:v9];
    }
    __int16 v15 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)BOOL v109 = 138543362;
      double v110 = *(double *)&v16;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Requesting Synonym Dictionaries for %{public}@.", v109, 0xCu);
    }
    double Current = CFAbsoluteTimeGetCurrent();
    os_signpost_id_t v18 = os_signpost_id_generate(log);
    BOOL v19 = log;
    __int16 v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)BOOL v109 = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "SearchIndexManager - RequestSynonymDictionaries", "", v109, 2u);
    }

    id v74 = v14;
    int v21 = [(PLPhotoAnalysisMomentGraphService *)v71 requestSynonymsDictionariesWithOperationID:&stru_1EEB2EB80 error:&v74];
    id v11 = v74;

    if (v21)
    {
      [(NSMutableDictionary *)self->_inqSynonymsByIndexCategoryMask addEntriesFromDictionary:v21];
    }
    else
    {
      uint64_t v22 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)BOOL v109 = 138543618;
        double v110 = *(double *)&v23;
        __int16 v111 = 2112;
        id v112 = v11;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Failed to get Synonyms from Photo Analysis for %{public}@. Error: %@", v109, 0x16u);
      }
    }
    CFAbsoluteTime v24 = v20;
    uint64_t v25 = v24;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)BOOL v109 = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v25, OS_SIGNPOST_INTERVAL_END, v18, "SearchIndexManager - RequestSynonymDictionaries", "", v109, 2u);
    }

    id v26 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      double v27 = CFAbsoluteTimeGetCurrent();
      id v28 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)BOOL v109 = 134349314;
      double v110 = v27 - Current;
      __int16 v111 = 2114;
      id v112 = v28;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Request for Synonyms took %{public}f seconds for %{public}@.", v109, 0x16u);
    }
  }

  __int16 v29 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)BOOL v109 = 138543362;
    double v110 = *(double *)&v30;
    _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEFAULT, "Requesting Zero Keywords from Photo Analysis for %{public}@.", v109, 0xCu);
  }
  double v31 = CFAbsoluteTimeGetCurrent();
  os_signpost_id_t v32 = os_signpost_id_generate(log);
  long long v33 = log;
  long long v34 = v33;
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)BOOL v109 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "SearchIndexManager - RequestZeroKeywords", "", v109, 2u);
  }

  id v73 = v11;
  os_log_t loga = [(PLPhotoAnalysisMomentGraphService *)v71 requestZeroKeywordsWithOptions:0 operationID:&stru_1EEB2EB80 error:&v73];
  id v35 = v73;

  if (loga)
  {
    zeroKeywordStore = self->_zeroKeywordStore;
    if (!zeroKeywordStore)
    {
      __int16 v37 = [PLZeroKeywordStore alloc];
      id v38 = [(PLPhotoLibraryPathManager *)self->_pathManager searchIndexZeroKeywordStoreFilePath];
      id v39 = [(PLZeroKeywordStore *)v37 initWithPath:v38];
      uint64_t v40 = self->_zeroKeywordStore;
      self->_zeroKeywordStore = v39;

      zeroKeywordStore = self->_zeroKeywordStore;
    }
    [(PLZeroKeywordStore *)zeroKeywordStore updateZeroKeywordsTo:loga];
  }
  else
  {
    long long v41 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      long long v42 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)BOOL v109 = 138543618;
      double v110 = *(double *)&v42;
      __int16 v111 = 2112;
      id v112 = v35;
      _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_ERROR, "Failed to get Zero Keywords from Photo Analysis for %{public}@. Error: %@", v109, 0x16u);
    }
  }
  long long v43 = v34;
  long long v44 = v43;
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    *(_WORD *)BOOL v109 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v44, OS_SIGNPOST_INTERVAL_END, v32, "SearchIndexManager - RequestZeroKeywords", "", v109, 2u);
  }

  id v45 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    double v46 = CFAbsoluteTimeGetCurrent();
    __int16 v47 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)BOOL v109 = 134349314;
    double v110 = v46 - v31;
    __int16 v111 = 2114;
    id v112 = v47;
    _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_DEFAULT, "Request for Zero Keywords took %{public}f seconds for %{public}@.", v109, 0x16u);
  }
  CFAbsoluteTime v48 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v49 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)BOOL v109 = 138543362;
    double v110 = *(double *)&v49;
    _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_DEFAULT, "Requesting Knowledge Graph Search Metadata for %{public}@.", v109, 0xCu);
  }
  double v50 = CFAbsoluteTimeGetCurrent();
  os_signpost_id_t v51 = os_signpost_id_generate(v44);
  uint64_t v52 = v44;
  __int16 v53 = v52;
  if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
  {
    *(_WORD *)BOOL v109 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v53, OS_SIGNPOST_INTERVAL_BEGIN, v51, "SearchIndexManager - indexPhotoLibrary - requestGraphSearchMetadata", "", v109, 2u);
  }

  id v72 = v35;
  id v54 = [(PLPhotoAnalysisMomentGraphService *)v71 requestGraphSearchMetadataWithOptions:0 operationID:&stru_1EEB2EB80 error:&v72];
  id v55 = v72;

  if (v54)
  {
    searchMetadataStore = self->_searchMetadataStore;
    if (!searchMetadataStore)
    {
      uint64_t v57 = [PLSearchMetadataStore alloc];
      id v58 = [(PLPhotoLibraryPathManager *)self->_pathManager searchIndexMetadataStoreFilePath];
      id v59 = [(PLSearchMetadataStore *)v57 initWithPath:v58];
      id v60 = self->_searchMetadataStore;
      self->_searchMetadataStore = v59;

      searchMetadataStore = self->_searchMetadataStore;
    }
    [(PLSearchMetadataStore *)searchMetadataStore updateSearchMetadataTo:v54];
  }
  else
  {
    uint64_t v61 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      id v62 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)BOOL v109 = 138543618;
      double v110 = *(double *)&v62;
      __int16 v111 = 2112;
      id v112 = v55;
      _os_log_impl(&dword_19B3C7000, v61, OS_LOG_TYPE_ERROR, "Failed to get Knowledge Graph Search Metadata from Photo Analysis for %{public}@. Error: %@", v109, 0x16u);
    }
  }
  id v63 = v53;
  uint64_t v64 = v63;
  if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
  {
    *(_WORD *)BOOL v109 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v64, OS_SIGNPOST_INTERVAL_END, v51, "SearchIndexManager - RequestGraphSearchMetadata", "", v109, 2u);
  }

  uint64_t v65 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    double v66 = CFAbsoluteTimeGetCurrent();
    BOOL v67 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)BOOL v109 = 134349314;
    double v110 = v66 - v50;
    __int16 v111 = 2114;
    id v112 = v67;
    _os_log_impl(&dword_19B3C7000, v65, OS_LOG_TYPE_DEFAULT, "Request for Knowledge Graph Search Metadata took %{public}f seconds for %{public}@.", v109, 0x16u);
  }
  _Block_object_dispose(&v85, 8);

  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v97, 8);

  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(buf, 8);
}

void __45__PLSearchIndexManager__inqIndexPhotoLibrary__block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v3 = [*(id *)(a1 + 32) managedObjectContext];
  BOOL v4 = objc_opt_class();
  id v5 = [*(id *)(*(void *)(a1 + 40) + 24) libraryServicesManager];
  id v44 = 0;
  uint64_t v6 = objc_msgSend(v4, "fetchAssetUUIDsToPopulateSearchIndexWithManagedObjectContext:libraryIdentifier:error:", v3, objc_msgSend(v5, "wellKnownPhotoLibraryIdentifier"), &v44);
  id v7 = v44;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v10 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [*(id *)(a1 + 40) photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543618;
      double v46 = v11;
      __int16 v47 = 2112;
      id v48 = v7;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch Assets for %{public}@. Error: %@", buf, 0x16u);
    }
  }
  uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 24) libraryServicesManager];
  id v43 = v7;
  uint64_t v13 = objc_msgSend(v4, "fetchAlbumUUIDsToPopulateSearchIndexWithManagedObjectContext:libraryIdentifier:error:", v3, objc_msgSend(v12, "wellKnownPhotoLibraryIdentifier"), &v43);
  id v14 = v43;

  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v13;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v17 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [*(id *)(a1 + 40) photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543618;
      double v46 = v12;
      __int16 v47 = 2112;
      id v48 = v14;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Failed to fetch Albums for %{public}@ . Error: %@", buf, 0x16u);
    }
  }
  int v18 = PLIsFeaturedContentAllowed();
  if (v18)
  {
    uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 24) libraryServicesManager];
    id v42 = v14;
    BOOL v19 = objc_msgSend(v4, "fetchMemoryUUIDsToPopulateSearchIndexWithManagedObjectContext:libraryIdentifier:error:", v3, objc_msgSend(v12, "wellKnownPhotoLibraryIdentifier"), &v42);
    id v20 = v42;

    id v14 = v20;
  }
  else
  {
    BOOL v19 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v19);
  if (v18)
  {

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
      goto LABEL_20;
    }
    int v21 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [*(id *)(a1 + 40) photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543618;
      double v46 = v22;
      __int16 v47 = 2112;
      id v48 = v14;
      uint64_t v23 = "Failed to fetch Memories for %{public}@. Error: %@";
      CFAbsoluteTime v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      uint32_t v26 = 22;
LABEL_18:
      _os_log_impl(&dword_19B3C7000, v24, v25, v23, buf, v26);
    }
  }
  else
  {
    int v21 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = [*(id *)(a1 + 40) photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543362;
      double v46 = v22;
      uint64_t v23 = "Featured Content is disabled for %{public}@. Not fetching Memories to index.";
      CFAbsoluteTime v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_INFO;
      uint32_t v26 = 12;
      goto LABEL_18;
    }
  }

LABEL_20:
  double v27 = [*(id *)(*(void *)(a1 + 40) + 24) libraryServicesManager];
  id v41 = v14;
  uint64_t v28 = objc_msgSend(v4, "fetchHighlightUUIDsToPopulateSearchIndexWithManagedObjectContext:libraryIdentifier:error:", v3, objc_msgSend(v27, "wellKnownPhotoLibraryIdentifier"), &v41);
  id v29 = v41;

  uint64_t v30 = *(void *)(*(void *)(a1 + 72) + 8);
  double v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v28;

  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    os_signpost_id_t v32 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      long long v33 = [*(id *)(a1 + 40) photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543618;
      double v46 = v33;
      __int16 v47 = 2112;
      id v48 = v29;
      _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Failed to fetch Highlights for %{public}@. Error: %@", buf, 0x16u);
    }
  }
  id v40 = v29;
  uint64_t v34 = [v4 fetchMomentUUIDsToPopulateAssetSearchIndexWithManagedObjectContext:v3 error:&v40];
  id v35 = v40;

  uint64_t v36 = *(void *)(*(void *)(a1 + 80) + 8);
  __int16 v37 = *(void **)(v36 + 40);
  *(void *)(v36 + 40) = v34;

  if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    id v38 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v39 = [*(id *)(a1 + 40) photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543618;
      double v46 = v39;
      __int16 v47 = 2112;
      id v48 = v35;
      _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Failed to fetch Moments for %{public}@. Error: %@", buf, 0x16u);
    }
  }
}

void __45__PLSearchIndexManager__inqIndexPhotoLibrary__block_invoke_290(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v6 count]) {
    [*(id *)(a1 + 32) _inqAddUpdatesWithUUIDs:v6 forKey:v5];
  }
}

- (id)_inqRequestGraphDataForHighlightUUIDs:(id)a3 momentUUIDs:(id)a4 photoLibrary:(id)a5 singleAssetOnly:(BOOL)a6 error:(id *)a7
{
  BOOL v77 = a6;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (_os_feature_enabled_impl())
  {
    uint64_t v13 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543362;
      v81 = v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "Skipping _inqRequestGraphDataForHighlightUUIDs, %{public}@", buf, 0xCu);
    }
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v13 = [(PLSearchIndexManager *)self searchIndexManagerSignpostLog];
    id v74 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v16 = [v12 libraryServicesManager];
    uint64_t v17 = [v16 wellKnownPhotoLibraryIdentifier];

    if (v17 == 3
      || (int v18 = [PLPhotoAnalysisMomentGraphService alloc],
          [v12 photoAnalysisClient],
          BOOL v19 = objc_claimAutoreleasedReturnValue(),
          id v20 = [(PLPhotoAnalysisMomentGraphService *)v18 initWithServiceProvider:v19],
          v19,
          !v20))
    {
      int v21 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543362;
        v81 = v22;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "No Knowledge Graph data for %{public}@", buf, 0xCu);
      }
      id v20 = 0;
    }
    id v73 = v10;
    id v75 = v12;
    id v76 = v20;
    if ([v10 count])
    {
      uint64_t v23 = PLSearchBackendIndexManagerGetLog();
      CFAbsoluteTime v24 = @"(JIT) ";
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        if (v77) {
          os_log_type_t v25 = @"(JIT) ";
        }
        else {
          os_log_type_t v25 = &stru_1EEB2EB80;
        }
        uint64_t v26 = [v10 count];
        double v27 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543874;
        v81 = v25;
        __int16 v82 = 2050;
        CFAbsoluteTime v83 = *(double *)&v26;
        __int16 v84 = 2114;
        id v85 = v27;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_INFO, "%{public}@Requesting Search Index Keywords for %{public}ld Highlights for %{public}@", buf, 0x20u);

        id v10 = v73;
      }

      double Current = CFAbsoluteTimeGetCurrent();
      os_signpost_id_t v29 = os_signpost_id_generate(v13);
      if (!v77)
      {
        uint64_t v30 = v13;
        double v31 = v30;
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "SearchIndexManager - RequestSearchIndexKeywordsForHighlights", "", buf, 2u);
        }
      }
      v79[1] = 0;
      os_signpost_id_t v32 = -[PLPhotoAnalysisMomentGraphService requestSearchIndexKeywordsForAssetCollectionUUIDs:ofType:operationID:error:](v76, "requestSearchIndexKeywordsForAssetCollectionUUIDs:ofType:operationID:error:", v10, 1);
      id v33 = 0;
      if (v33)
      {
        uint64_t v34 = PLSearchBackendIndexManagerGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id v35 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
          *(_DWORD *)buf = 138543618;
          v81 = v35;
          __int16 v82 = 2112;
          CFAbsoluteTime v83 = *(double *)&v33;
          _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "No Highlight Knowledge Graph data from full index rebuild for %{public}@. Error: %@", buf, 0x16u);
        }
        id v10 = v73;
      }
      else
      {
        [v74 addEntriesFromDictionary:v32];
      }
      if (!v77)
      {
        uint64_t v36 = v13;
        __int16 v37 = v36;
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v37, OS_SIGNPOST_INTERVAL_END, v29, "SearchIndexManager - RequestSearchIndexKeywordsForHighlights", "", buf, 2u);
        }
      }
      id v38 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        if (!v77) {
          CFAbsoluteTime v24 = &stru_1EEB2EB80;
        }
        CFAbsoluteTime v39 = CFAbsoluteTimeGetCurrent() - Current;
        id v40 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543874;
        v81 = v24;
        __int16 v82 = 2050;
        CFAbsoluteTime v83 = v39;
        __int16 v84 = 2114;
        id v85 = v40;
        _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Request for Search Index Keywords for Highlights took %{public}f seconds for %{public}@", buf, 0x20u);
      }
      id v20 = v76;
    }
    else
    {
      id v33 = 0;
    }
    if ([v11 count])
    {
      id v41 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        if (v77) {
          id v42 = @"(JIT) ";
        }
        else {
          id v42 = &stru_1EEB2EB80;
        }
        uint64_t v43 = [v11 count];
        id v44 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543874;
        v81 = v42;
        id v12 = v75;
        __int16 v82 = 2050;
        CFAbsoluteTime v83 = *(double *)&v43;
        __int16 v84 = 2114;
        id v85 = v44;
        _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Requesting Asset Search Keywords for %{public}ld Moments for %{public}@", buf, 0x20u);
      }
      double v45 = CFAbsoluteTimeGetCurrent();
      os_signpost_id_t v46 = os_signpost_id_generate(v13);
      __int16 v47 = v13;
      id v48 = v47;
      unint64_t v72 = v46 - 1;
      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v46, "SearchIndexManager - RequestAssetSearchKeywordsForMoments", "", buf, 2u);
      }
      os_signpost_id_t spid = v46;

      v79[0] = v33;
      uint64_t v49 = [(PLPhotoAnalysisMomentGraphService *)v20 requestAssetSearchKeywordsForAssetCollectionUUIDs:v11 ofType:0 operationID:&stru_1EEB2EB80 error:v79];
      id v50 = v79[0];

      if (v50)
      {
        os_signpost_id_t v51 = PLSearchBackendIndexManagerGetLog();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          if (v77) {
            uint64_t v52 = @"JIT";
          }
          else {
            uint64_t v52 = @"full search index rebuild";
          }
          [(PLSearchIndexManager *)self photoLibraryTypeDescription];
          v54 = __int16 v53 = v49;
          *(_DWORD *)buf = 138543874;
          v81 = v52;
          id v12 = v75;
          __int16 v82 = 2114;
          CFAbsoluteTime v83 = *(double *)&v54;
          __int16 v84 = 2112;
          id v85 = v50;
          _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_ERROR, "No asset Knowledge Graph data for %{public}@ for %{public}@. Error: %@", buf, 0x20u);

          uint64_t v49 = v53;
        }
      }
      id v78 = v50;
      id v55 = &stru_1EEB2EB80;
      uint64_t v56 = [(PLPhotoAnalysisMomentGraphService *)v20 requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs:v11 ofType:0 isFullAnalysis:1 operationID:&stru_1EEB2EB80 error:&v78];
      id v33 = v78;

      if (v33)
      {
        uint64_t v57 = PLSearchBackendIndexManagerGetLog();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          if (v77) {
            id v58 = @"JIT";
          }
          else {
            id v58 = @"full search index rebuild";
          }
          [(PLSearchIndexManager *)self photoLibraryTypeDescription];
          v60 = id v59 = v49;
          *(_DWORD *)buf = 138543874;
          v81 = v58;
          id v12 = v75;
          __int16 v82 = 2114;
          CFAbsoluteTime v83 = *(double *)&v60;
          __int16 v84 = 2112;
          id v85 = v33;
          _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_ERROR, "No Social Group asset Knowledge Graph data for %{public}@ for %{public}@. Error :%@", buf, 0x20u);

          uint64_t v49 = v59;
          id v55 = &stru_1EEB2EB80;
        }
      }
      uint64_t v61 = +[PLSearchIndexManager _keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords:v49 andAssetUUIDsBySocialGroup:v56 photoLibrary:v12];
      if (v61)
      {
        [v74 addEntriesFromDictionary:v61];
      }
      else
      {
        id v62 = v49;
        id v63 = PLSearchBackendIndexManagerGetLog();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          uint64_t v64 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
          *(_DWORD *)buf = 138543362;
          v81 = v64;
          _os_log_impl(&dword_19B3C7000, v63, OS_LOG_TYPE_ERROR, "Failed to compute per-asset keywords from assetSearchKeywords for %{public}@.", buf, 0xCu);

          id v12 = v75;
        }

        uint64_t v49 = v62;
        id v55 = &stru_1EEB2EB80;
      }
      uint64_t v65 = v48;
      double v66 = v65;
      if (v72 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v66, OS_SIGNPOST_INTERVAL_END, spid, "SearchIndexManager - RequestAssetSearchKeywordsForMoments", "", buf, 2u);
      }

      BOOL v67 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        if (v77) {
          id v55 = @"(JIT)";
        }
        CFAbsoluteTime v68 = CFAbsoluteTimeGetCurrent() - v45;
        BOOL v69 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543874;
        v81 = v55;
        __int16 v82 = 2050;
        CFAbsoluteTime v83 = v68;
        __int16 v84 = 2114;
        id v85 = v69;
        _os_log_impl(&dword_19B3C7000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@Request for Asset Search Keywords for Moments took %{public}f seconds for %{public}@.", buf, 0x20u);

        id v12 = v75;
      }

      id v10 = v73;
      id v20 = v76;
    }
    uint64_t v15 = (void *)[v74 copy];
  }
  return v15;
}

- (void)_inqEnsureSearchProgressExists
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  p_inqUUIDsToProcess = &self->_inqUUIDsToProcess;
  if (self->_inqUUIDsToProcess) {
    goto LABEL_37;
  }
  BOOL v4 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v89 = (uint64_t)v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "-[PLSearchIndexManager _inqEnsureSearchProgressExists] called. Requesting Server Transaction if needed for %{public}@.", buf, 0xCu);
  }
  __int16 v82 = (void *)MEMORY[0x19F38D3B0]([(PLSearchIndexManager *)self _inqTakeClientServerTransactionIfNeeded]);
  id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v7 = [(PLPhotoLibraryPathManager *)self->_pathManager searchIndexProgressFilePath];
  uint64_t v8 = (void *)[v6 initWithContentsOfFile:v7];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = v9;
  if (v8)
  {
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __54__PLSearchIndexManager__inqEnsureSearchProgressExists__block_invoke;
    v86[3] = &unk_1E5869AA0;
    uint64_t v87 = (NSMutableDictionary *)v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v86];
    objc_storeStrong((id *)p_inqUUIDsToProcess, v10);
    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    inqGraphDataByUUID = self->_inqGraphDataByUUID;
    self->_inqGraphDataByUUID = v11;

    [(PLPhotoLibraryPathManager *)self->_pathManager searchIndexGraphDataProgressFilePath];
    __int16 v80 = v85[1] = 0;
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfFile:options:error:");
    id v14 = 0;
    uint64_t v79 = v8;
    v81 = p_inqUUIDsToProcess;
    id v78 = (void *)v13;
    if (v13)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      id v20 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, objc_opt_class(), 0);
      v85[0] = v14;
      int v21 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v20 fromData:v13 error:v85];
      id v22 = v85[0];

      if (v21)
      {
        [(NSMutableDictionary *)self->_inqGraphDataByUUID addEntriesFromDictionary:v21];
      }
      else
      {
        os_signpost_id_t v32 = PLSearchBackendIndexManagerGetLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          id v33 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
          *(_DWORD *)buf = 138543618;
          uint64_t v89 = (uint64_t)v33;
          __int16 v90 = 2112;
          id v91 = v22;
          _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Failed to unarchive Knowledge Graph data for %{public}@. Error: %@", buf, 0x16u);
        }
      }
      p_inqUUIDsToProcess = v81;
    }
    else
    {
      id v20 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        double v31 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138412802;
        uint64_t v89 = (uint64_t)v80;
        __int16 v90 = 2114;
        id v91 = v31;
        __int16 v92 = 2112;
        id v93 = v14;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to read Knowledge Graph data from file \"%@\" for %{public}@. Error: %@", buf, 0x20u);
      }
      id v22 = v14;
    }

    uint64_t v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    inqSynonymsByIndexCategoryMask = self->_inqSynonymsByIndexCategoryMask;
    self->_inqSynonymsByIndexCategoryMask = v34;

    uint64_t v36 = [(PLPhotoLibraryPathManager *)self->_pathManager searchIndexSynonymsFilePath];
    id v84 = 0;
    uint64_t v37 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v36 options:0 error:&v84];
    id v38 = v84;
    id v76 = (void *)v37;
    BOOL v77 = (void *)v36;
    if (v37)
    {
      CFAbsoluteTime v39 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v40 = objc_opt_class();
      uint64_t v41 = objc_opt_class();
      uint64_t v42 = objc_opt_class();
      uint64_t v43 = objc_msgSend(v39, "setWithObjects:", v40, v41, v42, objc_opt_class(), 0);
      id v83 = v38;
      id v44 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v43 fromData:v37 error:&v83];
      id v45 = v83;

      if (v44)
      {
        [(NSMutableDictionary *)self->_inqSynonymsByIndexCategoryMask addEntriesFromDictionary:v44];
      }
      else
      {
        __int16 v47 = PLSearchBackendIndexManagerGetLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          id v48 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
          *(_DWORD *)buf = 138543618;
          uint64_t v89 = (uint64_t)v48;
          __int16 v90 = 2112;
          id v91 = v45;
          _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_ERROR, "Failed to unarchive synonyms for %{public}@. Error: %@", buf, 0x16u);
        }
      }
      id v75 = v45;
    }
    else
    {
      uint64_t v43 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        os_signpost_id_t v46 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138412802;
        uint64_t v89 = v36;
        __int16 v90 = 2114;
        id v91 = v46;
        __int16 v92 = 2112;
        id v93 = v38;
        _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_ERROR, "Failed to read synonyms from file \"%@\" for %{public}@. Error: %@", buf, 0x20u);
      }
      id v75 = v38;
    }

    uint64_t v49 = *p_inqUUIDsToProcess;
    unint64_t v72 = NSString;
    id v74 = [(NSDictionary *)v49 objectForKeyedSubscript:@"insertAsset"];
    uint64_t v70 = [v74 count];
    id v73 = [(NSDictionary *)v49 objectForKeyedSubscript:@"removeAsset"];
    uint64_t v68 = [v73 count];
    BOOL v71 = [(NSDictionary *)v49 objectForKeyedSubscript:@"insertAlbum"];
    uint64_t v66 = [v71 count];
    BOOL v69 = [(NSDictionary *)v49 objectForKeyedSubscript:@"removeAlbum"];
    uint64_t v65 = [v69 count];
    BOOL v67 = [(NSDictionary *)v49 objectForKeyedSubscript:@"insertMemory"];
    uint64_t v64 = [v67 count];
    id v50 = [(NSDictionary *)v49 objectForKeyedSubscript:@"removeMemory"];
    uint64_t v51 = [v50 count];
    uint64_t v52 = [(NSDictionary *)v49 objectForKeyedSubscript:@"insertHighlight"];
    uint64_t v53 = [v52 count];
    id v54 = [(NSDictionary *)v49 objectForKeyedSubscript:@"removeHighlight"];
    uint64_t v55 = [v54 count];
    uint64_t v56 = [(NSDictionary *)v49 objectForKeyedSubscript:@"renamePerson"];
    uint64_t v57 = [v72 stringWithFormat:@"(%@) index progress -> assets[+%d -%d] albums[+%d -%d] [memories[+%d -%d]] highlights[+%d -%d] renamedPersons[+%d]", @"load", v70, v68, v66, v65, v64, v51, v53, v55, objc_msgSend(v56, "count")];

    id v58 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v89 = (uint64_t)v57;
      _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    os_signpost_id_t v29 = v87;
    uint64_t v30 = v79;
    p_inqUUIDsToProcess = v81;
  }
  else
  {
    uint64_t v23 = _uuidProcessingKeys;
    do
    {
      CFAbsoluteTime v24 = [MEMORY[0x1E4F1CA70] orderedSet];
      uint64_t v25 = (uint64_t)*v23++;
      [v10 setObject:v24 forKey:v25];
    }
    while (v23 < PLSearchIndexPauseReasonCloseSearchIndex);
    objc_storeStrong((id *)p_inqUUIDsToProcess, v10);
    uint64_t v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v27 = self->_inqGraphDataByUUID;
    self->_inqGraphDataByUUID = v26;

    uint64_t v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    os_signpost_id_t v29 = self->_inqSynonymsByIndexCategoryMask;
    self->_inqSynonymsByIndexCategoryMask = v28;
    uint64_t v30 = 0;
  }

  if (*p_inqUUIDsToProcess)
  {
    if (!v30)
    {
LABEL_33:
      id v59 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        id v60 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v89 = (uint64_t)v60;
        _os_log_impl(&dword_19B3C7000, v59, OS_LOG_TYPE_DEFAULT, "No prior search progress. Enqueuing ALL assets, albums, memories, etc. for %{public}@", buf, 0xCu);
      }
      [(PLSearchIndexManager *)self _inqIndexPhotoLibrary];
    }
  }
  else
  {
    id v62 = [MEMORY[0x1E4F28B00] currentHandler];
    [v62 handleFailureInMethod:a2 object:self file:@"PLSearchIndexManager.m" lineNumber:1444 description:@"expect search progress data structures"];

    if (!v30) {
      goto LABEL_33;
    }
  }

LABEL_37:
  [(PLSearchIndexManager *)self _inqUpdateUUIDsToProcessWithSpotlightProgress];
  uint64_t v61 = PLIsFeaturedContentAllowed();
  if ([(PLSearchIndexManager *)self _inqUpdateFeaturedContentAllowed:v61]) {
    [(PLSearchIndexManager *)self _inqUpdateFeaturedContentForSearch:v61];
  }
}

void __54__PLSearchIndexManager__inqEnsureSearchProgressExists__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA70];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithArray:v6];

  [*(id *)(a1 + 32) setObject:v8 forKey:v7];
}

- (void)_inqUpdateUUIDsToProcessWithSpotlightProgress
{
  uint64_t v3 = [(PLSearchIndexManager *)self _inqPhotoLibrary];
  if (v3)
  {
    BOOL v4 = [(NSDictionary *)self->_inqUUIDsToProcess objectForKeyedSubscript:@"insertAsset"];
    id v5 = [(NSDictionary *)self->_inqUUIDsToProcess objectForKeyedSubscript:@"removeAsset"];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = [v3 pathManager];
    BOOL v8 = +[PLSpotlightProgressManager shouldPerformSpotlightOperationsWithPhotoLibraryPathManager:v7];

    if (v8)
    {
      id v9 = [v3 pathManager];
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      uint64_t v15 = __69__PLSearchIndexManager__inqUpdateUUIDsToProcessWithSpotlightProgress__block_invoke;
      uint64_t v16 = &unk_1E5863B10;
      id v17 = v5;
      id v18 = v4;
      id v10 = v6;
      id v19 = v10;
      id v20 = self;
      +[PLSpotlightProgressManager spotlightProgressForPhotoLibraryPathManager:v9 completion:&v13];

      id v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16);
      id v12 = [v3 pathManager];
      +[PLSpotlightProgressManager removeSearchableItemIdentifiers:v11 forPhotoLibraryPathManager:v12];
    }
  }
}

void __69__PLSearchIndexManager__inqUpdateUUIDsToProcessWithSpotlightProgress__block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        if (([a1[4] containsObject:v11] & 1) == 0) {
          [a1[5] addObject:v11];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v26 objects:v37 count:16];
    }
    while (v8);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * j);
        if ((objc_msgSend(a1[5], "containsObject:", v17, (void)v22) & 1) == 0) {
          [a1[4] addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v36 count:16];
    }
    while (v14);
  }

  [a1[6] addObjectsFromArray:v5];
  [a1[6] addObjectsFromArray:v12];
  if ([v5 count] || objc_msgSend(v12, "count"))
  {
    id v18 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v5 count];
      uint64_t v20 = [v12 count];
      int v21 = [a1[7] photoLibraryTypeDescription];
      *(_DWORD *)buf = 134349570;
      uint64_t v31 = v19;
      __int16 v32 = 2050;
      uint64_t v33 = v20;
      __int16 v34 = 2114;
      id v35 = v21;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Added %{public}lu, Removed %{public}lud asset UUIDs to search index manager's UUIDsToProcess from Spotlight progress for %{public}@.", buf, 0x20u);
    }
  }
}

- (void)_inqEnsureSearchSystemInfoExists
{
  if (!self->_searchSystemInfo)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    BOOL v4 = [(PLPhotoLibraryPathManager *)self->_pathManager searchIndexSystemInfoFilePath];
    id v5 = (NSDictionary *)[v3 initWithContentsOfFile:v4];
    searchSystemInfo = self->_searchSystemInfo;
    self->_searchSystemInfo = v5;

    uint64_t v7 = self->_searchSystemInfo;
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    }
    uint64_t v9 = self->_searchSystemInfo;
    self->_searchSystemInfo = v8;
  }
}

- (void)_inqEnsureSpotlightDonationManagerExists
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->_spotlightDonationManager)
  {
    id v3 = [(PLSearchIndexManager *)self _inqPhotoLibrary];
    if (+[PLSpotlightDonationUtilities shouldDisablePhotosLegacySearchDonation])
    {
      BOOL v4 = PLSearchBackendIndexStatusGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [v3 pathManager];
        id v6 = [v5 libraryURL];
        uint64_t v7 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        int v16 = 138412546;
        uint64_t v17 = v6;
        __int16 v18 = 2114;
        uint64_t v19 = v7;
        uint64_t v8 = "PhotosSearchBackgroundJobWorker feature flag is enabled. Not using Spotlight donations from legacy search. "
             "Not creating Spotlight Donation Manager for PhotoLibrary at path: %@ of type: %{public}@.";
LABEL_11:
        _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v16, 0x16u);
      }
    }
    else
    {
      BOOL v9 = +[PLSpotlightDonationUtilities isUniversalSearchEnabledForPhotoLibrary:v3];
      BOOL v4 = PLSearchBackendIndexManagerGetLog();
      BOOL v10 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v10)
        {
          uint64_t v11 = [v3 pathManager];
          id v12 = [v11 libraryURL];
          uint64_t v13 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
          int v16 = 138412546;
          uint64_t v17 = v12;
          __int16 v18 = 2114;
          uint64_t v19 = v13;
          _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Creating Spotlight Donation Manager for PhotoLibrary at path: %@ of type: %{public}@", (uint8_t *)&v16, 0x16u);
        }
        uint64_t v14 = [[PLSpotlightDonationManager alloc] initWithPhotoLibrary:self->_photoLibrary];
        spotlightDonationManager = self->_spotlightDonationManager;
        self->_spotlightDonationManager = v14;

        [(PLSpotlightDonationManager *)self->_spotlightDonationManager addOperationCountObserver:self];
        [(PLSpotlightDonationManager *)self->_spotlightDonationManager setSpotlightOperationQueueSuspended:[(PLSearchIndexManager *)self _inqIsIndexingPaused]];
        goto LABEL_13;
      }
      if (v10)
      {
        id v5 = [v3 pathManager];
        id v6 = [v5 libraryURL];
        uint64_t v7 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        int v16 = 138412546;
        uint64_t v17 = v6;
        __int16 v18 = 2114;
        uint64_t v19 = v7;
        uint64_t v8 = "Universal Search not supported for Photo Library. Not creating Spotlight Donation Manager. PhotoLibrary pat"
             "h: %@ of type: %{public}@";
        goto LABEL_11;
      }
    }

LABEL_13:
  }
}

- (void)_inqEnsureSearchIndexExists
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v3 = [(PLSearchIndexManager *)self _inqPhotoLibrary];
    BOOL v4 = [v3 libraryServicesManager];
    uint64_t v5 = [v4 wellKnownPhotoLibraryIdentifier];

    if (!self->_db && v5 != 3)
    {
      id v6 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v14 = v7;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "-[PLSearchIndexManager _inqEnsureSearchIndexExists] called. Requesting Server Transaction if needed for %{public}@.", buf, 0xCu);
      }
      [(PLSearchIndexManager *)self _inqTakeClientServerTransactionIfNeeded];
      uint64_t v8 = [[PSIDatabase alloc] initWithPathManager:self->_pathManager options:2];
      db = self->_db;
      self->_db = v8;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseConnectionDelegate);
      if (WeakRetained)
      {
        uint64_t v11 = self->_db;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __51__PLSearchIndexManager__inqEnsureSearchIndexExists__block_invoke;
        v12[3] = &unk_1E5875CE0;
        v12[4] = self;
        [(PSIDatabase *)v11 performSyncOnDBQueue:v12];
      }
    }
  }
  [(PLSearchIndexManager *)self _inqEnsureSpotlightDonationManagerExists];
}

void __51__PLSearchIndexManager__inqEnsureSearchIndexExists__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) databaseConnectionDelegate];
  objc_msgSend(v2, "didCreateConnection:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "databaseConnection"));
}

- (void)_inqCloseIndexIfAbleOrForce:(BOOL)a3 isDelete:(BOOL)a4
{
  BOOL v4 = a4;
  LODWORD(v5) = a3;
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(PLSearchIndexManager *)self _isIndexing];
  unint64_t v8 = [(PLSearchIndexManager *)self _inqEnqueuedUUIDsCountForceLoad:0];
  BOOL v9 = [(PLSearchIndexManager *)self spotlightDonationManager];
  uint64_t v10 = [v9 pendingOperationCount];

  if (v8) {
    int v11 = 1;
  }
  else {
    int v11 = v7;
  }
  if (v10) {
    int v12 = 1;
  }
  else {
    int v12 = v11;
  }
  uint64_t v13 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v128 = v7;
    if (v4) {
      uint64_t v14 = @"YES";
    }
    else {
      uint64_t v14 = @"NO";
    }
    uint64_t v15 = v14;
    if (v5) {
      int v16 = @"YES";
    }
    else {
      int v16 = @"NO";
    }
    char context = (char)v5;
    uint64_t v5 = v16;
    if (v12) {
      uint64_t v17 = @"YES";
    }
    else {
      uint64_t v17 = @"NO";
    }
    __int16 v18 = v17;
    uint64_t v19 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)buf = 138544130;
    v144 = v15;
    __int16 v145 = 2114;
    v146 = (PLSearchIndexManager *)v5;
    __int16 v147 = 2114;
    v148 = v18;
    __int16 v149 = 2114;
    v150 = v19;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Checking if able to close the Search Index. isDelete: %{public}@, forceClose: %{public}@, hasIndexingWork: %{public}@ for %{public}@", buf, 0x2Au);

    BOOL v7 = v128;
    LOBYTE(v5) = context;
  }
  uint64_t v20 = PLSearchBackendIndexManagerGetLog();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) == 0 && !v4 && v12 == 1)
  {
    if (v21)
    {
      long long v22 = @"NO";
      if (v7) {
        long long v22 = @"YES";
      }
      long long v23 = v22;
      long long v24 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138544130;
      v144 = v23;
      __int16 v145 = 2050;
      v146 = (PLSearchIndexManager *)v8;
      __int16 v147 = 2050;
      v148 = (__CFString *)v10;
      __int16 v149 = 2114;
      v150 = v24;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Not closing the search index because there is work to do. isIndexing: %{public}@, enqueued UUIDs count: %{public}ld, pending Spotlight operations count: %{public}ld for %{public}@", buf, 0x2Au);
    }
    goto LABEL_93;
  }
  long long v25 = &off_19BA99000;
  if (v21)
  {
    long long v26 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)buf = 138543362;
    v144 = v26;
    _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Closing the Search Index for %{public}@.", buf, 0xCu);
  }
  uint64_t v20 = [(PLPhotoLibraryPathManager *)self->_pathManager searchIndexProgressFilePath];
  long long v27 = [(PLPhotoLibraryPathManager *)self->_pathManager searchIndexGraphDataProgressFilePath];
  uint64_t v28 = [(PLPhotoLibraryPathManager *)self->_pathManager searchIndexSystemInfoFilePath];
  uint64_t v129 = (void *)v28;
  if (v4)
  {
    long long v29 = v27;
    uint64_t v30 = [(PLSearchIndexManager *)self _inqPhotoLibrary];
    BOOL v31 = +[PLSpotlightDonationUtilities isUniversalSearchEnabledForPhotoLibrary:v30];
    __int16 v32 = [v30 libraryServicesManager];
    uint64_t v33 = [v32 wellKnownPhotoLibraryIdentifier];

    if (v31 && v33 != 3)
    {
      [(PLSearchIndexManager *)self _inqEnsureSpotlightDonationManagerExists];
      dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
      id v35 = [(PLSearchIndexManager *)self spotlightDonationManager];
      v141[0] = MEMORY[0x1E4F143A8];
      v141[1] = 3221225472;
      v141[2] = __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke;
      v141[3] = &unk_1E5875CE0;
      uint64_t v36 = v34;
      v142 = v36;
      [v35 deleteAllSearchableItemsWithCompletion:v141];

      dispatch_time_t v37 = dispatch_time(0, 20000000000);
      if (dispatch_semaphore_wait(v36, v37))
      {
        uint64_t v38 = PLSearchBackendDonationsGetLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          CFAbsoluteTime v39 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
          *(_DWORD *)buf = 138543618;
          v144 = v39;
          __int16 v145 = 2050;
          v146 = self;
          _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Timed-out trying to delete all items in Spotlight for %{public}@. SearchIndexManager: %{public}p", buf, 0x16u);
        }
      }
    }
    dispatch_semaphore_t v40 = dispatch_semaphore_create(0);
    v139[0] = MEMORY[0x1E4F143A8];
    v139[1] = 3221225472;
    v139[2] = __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke_238;
    v139[3] = &unk_1E586B750;
    v139[4] = self;
    uint64_t v41 = v40;
    v140 = v41;
    uint64_t v42 = MEMORY[0x19F38D650](v139);
    uint64_t v43 = (void *)v42;
    if (v33 == 3)
    {
      (*(void (**)(uint64_t, void))(v42 + 16))(v42, 0);
      long long v27 = v29;
    }
    else
    {
      db = self->_db;
      long long v27 = v29;
      if (db)
      {
        [(PSIDatabase *)db dropDatabaseWithCompletion:v43];
      }
      else
      {
        id v91 = [(PLPhotoLibraryPathManager *)self->_pathManager searchIndexDatabaseFilePath];
        +[PSIDatabase dropDatabaseAtPath:v91 withCompletion:v43];
      }
    }
    id v45 = v129;
    dispatch_semaphore_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
    zeroKeywordStore = self->_zeroKeywordStore;
    if (zeroKeywordStore)
    {
      [(PLZeroKeywordStore *)zeroKeywordStore deleteStore];
    }
    else
    {
      id v93 = [(PLPhotoLibraryPathManager *)self->_pathManager searchIndexZeroKeywordStoreFilePath];
      [(PLSearchIndexManager *)self _removeFileAtPath:v93 description:@"zero keyword store"];
    }
    searchMetadataStore = self->_searchMetadataStore;
    if (searchMetadataStore)
    {
      [(PLSearchMetadataStore *)searchMetadataStore deleteStore];
    }
    else
    {
      id v95 = [(PLPhotoLibraryPathManager *)self->_pathManager searchIndexMetadataStoreFilePath];
      [(PLSearchIndexManager *)self _removeFileAtPath:v95 description:@"search metadata store"];
    }
    [(PLSearchIndexManager *)self _removeFileAtPath:v20 description:@"index progress"];
    [(PLSearchIndexManager *)self _removeFileAtPath:v27 description:@"graph data progress"];
    [(PLSearchIndexManager *)self _removeFileAtPath:v129 description:@"index searchSystemInfo"];

    long long v25 = &off_19BA99000;
    goto LABEL_88;
  }
  id v45 = (void *)v28;
  id v125 = v27;
  contexta = (void *)MEMORY[0x19F38D3B0]();
  unint64_t v46 = 0x1E4F28000uLL;
  if (self->_inqUUIDsToProcess)
  {
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    inqUUIDsToProcess = self->_inqUUIDsToProcess;
    v137[0] = MEMORY[0x1E4F143A8];
    v137[1] = 3221225472;
    v137[2] = __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke_255;
    v137[3] = &unk_1E5863AE8;
    id v49 = v47;
    id v138 = v49;
    [(NSDictionary *)inqUUIDsToProcess enumerateKeysAndObjectsUsingBlock:v137];
    id v50 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v49 format:100 options:0 error:0];
    id v136 = 0;
    LOBYTE(inqUUIDsToProcess) = [v50 writeToFile:v20 options:1073741825 error:&v136];
    uint64_t v51 = (PLSearchIndexManager *)v136;
    uint64_t v52 = v51;
    if (inqUUIDsToProcess)
    {
      long long v121 = v50;
      id v122 = v49;
      long long v123 = v51;
      uint64_t v53 = self->_inqUUIDsToProcess;
      long long v118 = NSString;
      id v120 = [(NSDictionary *)v53 objectForKeyedSubscript:@"insertAsset"];
      uint64_t v116 = [v120 count];
      long long v119 = [(NSDictionary *)v53 objectForKeyedSubscript:@"removeAsset"];
      uint64_t v114 = [v119 count];
      uint64_t v117 = [(NSDictionary *)v53 objectForKeyedSubscript:@"insertAlbum"];
      uint64_t v112 = [v117 count];
      char v115 = [(NSDictionary *)v53 objectForKeyedSubscript:@"removeAlbum"];
      uint64_t v111 = [v115 count];
      id v113 = [(NSDictionary *)v53 objectForKeyedSubscript:@"insertMemory"];
      uint64_t v110 = [v113 count];
      id v54 = [(NSDictionary *)v53 objectForKeyedSubscript:@"removeMemory"];
      uint64_t v55 = [v54 count];
      uint64_t v56 = [(NSDictionary *)v53 objectForKeyedSubscript:@"insertHighlight"];
      uint64_t v57 = [v56 count];
      id v58 = [(NSDictionary *)v53 objectForKeyedSubscript:@"removeHighlight"];
      uint64_t v59 = [v58 count];
      id v60 = [(NSDictionary *)v53 objectForKeyedSubscript:@"renamePerson"];
      uint64_t v61 = [v118 stringWithFormat:@"(%@) index progress -> assets[+%d -%d] albums[+%d -%d] [memories[+%d -%d]] highlights[+%d -%d] renamedPersons[+%d]", @"save progress", v116, v114, v112, v111, v110, v55, v57, v59, objc_msgSend(v60, "count")];

      id v62 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v144 = v61;
        _os_log_impl(&dword_19B3C7000, v62, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      uint64_t v52 = v123;
      long long v27 = v125;
      unint64_t v46 = 0x1E4F28000;
      id v50 = v121;
      id v49 = v122;
    }
    else
    {
      PLSearchBackendIndexManagerGetLog();
      uint64_t v53 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v53->super, OS_LOG_TYPE_ERROR))
      {
        id v63 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543618;
        v144 = v63;
        __int16 v145 = 2112;
        v146 = v52;
        _os_log_impl(&dword_19B3C7000, &v53->super, OS_LOG_TYPE_ERROR, "Failed to write search progress for %{public}@. Error: %@", buf, 0x16u);
      }
    }

    long long v25 = &off_19BA99000;
    id v45 = v129;
  }
  else
  {
    uint64_t v52 = 0;
  }
  inqGraphDataByUUID = self->_inqGraphDataByUUID;
  if (inqGraphDataByUUID)
  {
    long long v124 = v52;
    id v135 = 0;
    uint64_t v65 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:inqGraphDataByUUID requiringSecureCoding:1 error:&v135];
    uint64_t v66 = (PLSearchIndexManager *)v135;
    if (v65)
    {
      BOOL v67 = v45;
      uint64_t v68 = v27;
      BOOL v69 = [(PLPhotoLibraryPathManager *)self->_pathManager searchIndexGraphDataProgressFilePath];
      uint64_t v134 = v66;
      char v70 = [v65 writeToFile:v69 options:1073741825 error:&v134];
      BOOL v71 = v134;

      if (v70)
      {
        long long v27 = v68;
        id v45 = v67;
        long long v25 = &off_19BA99000;
        uint64_t v52 = v124;
LABEL_59:

        unint64_t v46 = 0x1E4F28000uLL;
        goto LABEL_60;
      }
      unint64_t v72 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        id v74 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543618;
        v144 = v74;
        __int16 v145 = 2112;
        v146 = v71;
        _os_log_impl(&dword_19B3C7000, v72, OS_LOG_TYPE_ERROR, "Failed to write search graph data progress for %{public}@. Error: %@", buf, 0x16u);
      }
      long long v27 = v68;
      id v45 = v67;
      long long v25 = &off_19BA99000;
    }
    else
    {
      unint64_t v72 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        id v73 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543618;
        v144 = v73;
        __int16 v145 = 2112;
        v146 = v66;
        _os_log_impl(&dword_19B3C7000, v72, OS_LOG_TYPE_ERROR, "Failed to archive search graph data for %{public}@. Error: %@", buf, 0x16u);
      }
      BOOL v71 = v66;
    }
    uint64_t v52 = v124;

    goto LABEL_59;
  }
LABEL_60:
  searchSystemInfo = self->_searchSystemInfo;
  if (searchSystemInfo)
  {
    id v76 = [*(id *)(v46 + 3992) dataWithPropertyList:searchSystemInfo format:100 options:0 error:0];
    __int16 v133 = v52;
    char v77 = [v76 writeToFile:v45 options:1073741825 error:&v133];
    id v78 = v133;

    if ((v77 & 1) == 0)
    {
      uint64_t v79 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        __int16 v80 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543618;
        v144 = v80;
        __int16 v145 = 2112;
        v146 = v78;
        _os_log_impl(&dword_19B3C7000, v79, OS_LOG_TYPE_ERROR, "Failed to write searchSystemInfo for %{public}@. Error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v78 = v52;
  }
  inqSynonymsByIndexCategoryMask = self->_inqSynonymsByIndexCategoryMask;
  if (!inqSynonymsByIndexCategoryMask) {
    goto LABEL_79;
  }
  id v132 = 0;
  __int16 v82 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:inqSynonymsByIndexCategoryMask requiringSecureCoding:1 error:&v132];
  id v83 = (PLSearchIndexManager *)v132;
  if (!v82)
  {
    char v88 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      uint64_t v89 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543618;
      v144 = v89;
      __int16 v145 = 2112;
      v146 = v83;
      _os_log_impl(&dword_19B3C7000, v88, OS_LOG_TYPE_ERROR, "Failed to archive search synonyms for %{public}@. Error: %@", buf, 0x16u);
    }
    uint64_t v87 = v83;
    goto LABEL_77;
  }
  id v84 = v25;
  id v85 = [(PLPhotoLibraryPathManager *)self->_pathManager searchIndexSynonymsFilePath];
  __int16 v131 = v83;
  char v86 = [v82 writeToFile:v85 options:1073741825 error:&v131];
  uint64_t v87 = v131;

  if ((v86 & 1) == 0)
  {
    char v88 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      __int16 v90 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543618;
      v144 = v90;
      __int16 v145 = 2112;
      v146 = v87;
      _os_log_impl(&dword_19B3C7000, v88, OS_LOG_TYPE_ERROR, "Failed to write search synonyms for %{public}@. Error: %@", buf, 0x16u);
    }
    long long v25 = v84;
LABEL_77:

    goto LABEL_78;
  }
  long long v25 = v84;
LABEL_78:

  long long v27 = v125;
  id v45 = v129;
LABEL_79:
  [(PLSearchIndexManager *)self _inqEndTrackingUpdateIfNeeded];
  [(PLSearchIndexManager *)self _inqEndTrackingRebuildIfNeeded];

LABEL_88:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseConnectionDelegate);

  if (WeakRetained)
  {
    uint64_t v97 = self->_db;
    v130[0] = MEMORY[0x1E4F143A8];
    v130[1] = 3221225472;
    v130[2] = __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke_262;
    v130[3] = &unk_1E5875CE0;
    v130[4] = self;
    [(PSIDatabase *)v97 performSyncOnDBQueue:v130];
  }
  id v98 = self->_db;
  self->_db = 0;

  uint64_t v99 = self->_inqUUIDsToProcess;
  self->_inqUUIDsToProcess = 0;

  uint64_t v100 = self->_inqGraphDataByUUID;
  self->_inqGraphDataByUUID = 0;

  id v101 = self->_inqSynonymsByIndexCategoryMask;
  self->_inqSynonymsByIndexCategoryMask = 0;

  id v102 = [(PLSearchIndexManager *)self spotlightDonationManager];
  [v102 removeOperationCountObserver:self];

  spotlightDonationManager = self->_spotlightDonationManager;
  self->_spotlightDonationManager = 0;

  photoLibrary = self->_photoLibrary;
  self->_photoLibrary = 0;

  sceneTaxonomyProvider = self->_sceneTaxonomyProvider;
  self->_sceneTaxonomyProvider = 0;

  csuTaxonomyObjectStore = self->_csuTaxonomyObjectStore;
  self->_csuTaxonomyObjectStore = 0;

  dateFormatter = self->_dateFormatter;
  self->_dateFormatter = 0;

  id v108 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v109 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)buf = *((void *)v25 + 98);
    v144 = v109;
    _os_log_impl(&dword_19B3C7000, v108, OS_LOG_TYPE_DEFAULT, "Search index closed. Closing Server Transaction if needed for %{public}@.", buf, 0xCu);
  }
  [(PLSearchIndexManager *)self _inqDropClientServerTransactionIfNeeded];

LABEL_93:
}

intptr_t __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke_238(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
      int v6 = 138543618;
      BOOL v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Failed to drop the search index database for %{public}@. Error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke_255(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 array];
  [v4 setObject:v6 forKey:v5];
}

void __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke_262(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) databaseConnectionDelegate];
  objc_msgSend(v2, "willTeardownConnection:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "databaseConnection"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"operationCount", a4, a5, a6))
  {
    BOOL v7 = [(PLSearchIndexManager *)self spotlightDonationManager];
    uint64_t v8 = [v7 pendingOperationCount];

    if (!v8)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __71__PLSearchIndexManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v9[3] = &unk_1E5875CE0;
      v9[4] = self;
      [(PLSearchIndexManager *)self _onQueueAsync:v9];
    }
  }
}

uint64_t __71__PLSearchIndexManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Spotlight operation count is 0. Scheduling search index close if needed for %{public}@.", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) _inqScheduleCloseIndexIfNeeded];
}

- (void)_inqDropClientServerTransactionIfNeeded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  serverTransaction = self->_serverTransaction;
  BOOL v4 = PLSearchBackendIndexManagerGetLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (serverTransaction)
  {
    if (v5)
    {
      id v6 = self->_serverTransaction;
      uint64_t v7 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      int v15 = 134349570;
      int v16 = v6;
      __int16 v17 = 2112;
      __int16 v18 = v6;
      __int16 v19 = 2114;
      double v20 = *(double *)&v7;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Server Transaction [Closing]: %{public}p, %@ for %{public}@", (uint8_t *)&v15, 0x20u);
    }
    [(PLClientServerTransaction *)self->_serverTransaction completeTransactionScope:@"PLTransactionScopeSearchIndex"];
    double Current = CFAbsoluteTimeGetCurrent();
    double serverTransactionStartTime = self->_serverTransactionStartTime;
    uint64_t v10 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = self->_serverTransaction;
      int v12 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      int v15 = 134349826;
      int v16 = v11;
      __int16 v17 = 2112;
      __int16 v18 = v11;
      __int16 v19 = 2050;
      double v20 = Current - serverTransactionStartTime;
      __int16 v21 = 2114;
      long long v22 = v12;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Server Transaction [Closed]: %{public}p, %@. Transaction time: %{public}f for %{public}@", (uint8_t *)&v15, 0x2Au);
    }
    uint64_t v13 = self->_serverTransaction;
    self->_serverTransaction = 0;

    self->_double serverTransactionStartTime = 0.0;
  }
  else
  {
    if (v5)
    {
      uint64_t v14 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      int v15 = 138543362;
      int v16 = v14;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Server Transaction [NULL]. No transaction to close for %{public}@.", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_inqTakeClientServerTransactionIfNeeded
{
  v24[1] = *MEMORY[0x1E4F143B8];
  p_serverTransaction = &self->_serverTransaction;
  serverTransaction = self->_serverTransaction;
  BOOL v5 = PLSearchBackendIndexManagerGetLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (serverTransaction)
  {
    if (v6)
    {
      uint64_t v7 = self->_serverTransaction;
      uint64_t v8 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      int v18 = 134349570;
      __int16 v19 = v7;
      __int16 v20 = 2112;
      __int16 v21 = v7;
      __int16 v22 = 2114;
      uint64_t v23 = v8;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Server Transaction [Exists]: %{public}p, %@ for %{public}@", (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    if (v6)
    {
      id v9 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      int v18 = 138543362;
      __int16 v19 = v9;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Server Transaction [Opening] for %{public}@", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = @"PLTransactionScopeSearchIndex";
    int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    BOOL v5 = [v10 setWithArray:v11];

    int v12 = +[PLClientServerTransaction beginClientTransactionWithChangeScopes:pathManager:identifier:](PLClientServerTransaction, "beginClientTransactionWithChangeScopes:pathManager:identifier:", v5, self->_pathManager, "-[PLSearchIndexManager _inqTakeClientServerTransactionIfNeeded]");
    uint64_t v13 = [v12 transactionToken];
    uint64_t v14 = +[PLClientServerTransaction beginServerTransactionWithToken:changeScopes:pathManager:identifier:](PLClientServerTransaction, "beginServerTransactionWithToken:changeScopes:pathManager:identifier:", v13, v5, self->_pathManager, "-[PLSearchIndexManager _inqTakeClientServerTransactionIfNeeded]");

    objc_storeStrong((id *)p_serverTransaction, v14);
    [v12 completeTransaction];
    int v15 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = self->_serverTransaction;
      __int16 v17 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      int v18 = 134349570;
      __int16 v19 = v16;
      __int16 v20 = 2112;
      __int16 v21 = v16;
      __int16 v22 = 2114;
      uint64_t v23 = v17;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Server Transaction [Opened]: %{public}p, %@ for %{public}@", (uint8_t *)&v18, 0x20u);
    }
    self->_double serverTransactionStartTime = CFAbsoluteTimeGetCurrent();
  }
}

- (void)_inqScheduleCloseIndexIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL hasScheduledCloseIndex = self->_hasScheduledCloseIndex;
  BOOL v4 = PLSearchBackendIndexManagerGetLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (hasScheduledCloseIndex)
  {
    if (v5)
    {
      BOOL v6 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Search index already scheduled to close for %{public}@.", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Scheduling search index close if needed for %{public}@.", buf, 0xCu);
    }
    self->_BOOL hasScheduledCloseIndex = 1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__PLSearchIndexManager__inqScheduleCloseIndexIfNeeded__block_invoke;
    v8[3] = &unk_1E5875CE0;
    void v8[4] = self;
    [(PLSearchIndexManager *)self _onQueueAsyncWithDelay:v8 perform:5.0];
  }
}

uint64_t __54__PLSearchIndexManager__inqScheduleCloseIndexIfNeeded__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 137) = 0;
  return [*(id *)(a1 + 32) _inqCloseIndexIfAbleOrForce:0 isDelete:0];
}

- (BOOL)_removeFileAtPath:(id)a3 description:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [v8 fileExistsAtPath:v6];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v21 = 0;
    char v11 = [v10 removeItemAtPath:v6 error:&v21];
    id v12 = v21;

    uint64_t v13 = PLSearchBackendIndexManagerGetLog();
    uint64_t v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v15 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        *(_DWORD *)buf = 138412546;
        id v23 = v7;
        __int16 v24 = 2114;
        id v25 = v15;
        int v16 = "Removed: %@ for %{public}@";
        __int16 v17 = v14;
        os_log_type_t v18 = OS_LOG_TYPE_INFO;
        uint32_t v19 = 22;
LABEL_7:
        _os_log_impl(&dword_19B3C7000, v17, v18, v16, buf, v19);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138412802;
      id v23 = v15;
      __int16 v24 = 2114;
      id v25 = v7;
      __int16 v26 = 2112;
      id v27 = v12;
      int v16 = "Failed to remove %@ for %{public}@. Error: %@";
      __int16 v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 32;
      goto LABEL_7;
    }
  }
  return 0;
}

- (id)_assetUUIDsWithGraphDataInSpotlight
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  BOOL v4 = [&unk_1EEBF15B0 componentsJoinedByString:@" || "];
  id v5 = objc_alloc(MEMORY[0x1E4F23828]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F23830]);
  id v7 = (void *)[v5 initWithQueryString:v4 queryContext:v6];

  uint64_t v8 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)buf = 138412546;
    id v26 = v4;
    __int16 v27 = 2114;
    uint64_t v28 = v9;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Querying Spotlight for indexed Knowledge Graph data with queryString: %@ for %{public}@", buf, 0x16u);
  }
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __59__PLSearchIndexManager__assetUUIDsWithGraphDataInSpotlight__block_invoke;
  v23[3] = &unk_1E586AA58;
  id v11 = v3;
  id v24 = v11;
  [v7 setFoundItemsHandler:v23];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__PLSearchIndexManager__assetUUIDsWithGraphDataInSpotlight__block_invoke_2;
  v21[3] = &unk_1E586B750;
  v21[4] = self;
  id v12 = v10;
  __int16 v22 = v12;
  [v7 setCompletionHandler:v21];
  [v7 start];
  dispatch_time_t v13 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    uint64_t v14 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v15 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543362;
      id v26 = v15;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_FAULT, "Spotlight query for Knowledge Graph data timed out. Stale Knowledge Graph data may remain in the Spotlight index until the next Knowledge Graph rebuild for %{public}@", buf, 0xCu);
    }
    [v7 cancel];
  }
  int v16 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)buf = 138543618;
    id v26 = v11;
    __int16 v27 = 2114;
    uint64_t v28 = v17;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Spotlight query for Knowledge Graph data returned UUIDs: %{public}@ for %{public}@", buf, 0x16u);
  }
  os_log_type_t v18 = v22;
  id v19 = v11;

  return v19;
}

void __59__PLSearchIndexManager__assetUUIDsWithGraphDataInSpotlight__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(a1 + 32);
        int v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) uniqueIdentifier];
        [v8 addObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

void __59__PLSearchIndexManager__assetUUIDsWithGraphDataInSpotlight__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Spotlight query for Knowledge Graph data failed. Stale Knowledge Graph data may remain in the Spotlight index until the next Knowledge Graph rebuild for %{public}@. Error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)applyGraphUpdates:(id)a3 supportingData:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  uint64_t v11 = [v8 count];
  long long v12 = PLSearchBackendIndexManagerGetLog();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      uint64_t v14 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 134349826;
      uint64_t v30 = v11;
      __int16 v31 = 2114;
      id v32 = v8;
      __int16 v33 = 2112;
      id v34 = v9;
      __int16 v35 = 2114;
      uint64_t v36 = v14;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Applying %{public}lu Knowledge Graph updates :%{public}@, supportingData: %@ for %{public}@", buf, 0x2Au);
    }
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __68__PLSearchIndexManager_applyGraphUpdates_supportingData_completion___block_invoke;
    id v24 = &unk_1E58710F0;
    id v25 = self;
    id v26 = v9;
    id v27 = v8;
    uint64_t v15 = v10;
    id v28 = v15;
    BOOL v16 = [(PLSearchIndexManager *)self _onQueueAsync:&v21];
    if (v15 && !v16) {
      v15[2](v15);
    }

    __int16 v17 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v18 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = (uint64_t)v18;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Finished applying Knowledge Graph updates for %{public}@.", buf, 0xCu);
    }
  }
  else
  {
    if (v13)
    {
      id v19 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = (uint64_t)v19;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "No Knowledge Graph updates to apply for %{public}@.", buf, 0xCu);
    }
    if (v10)
    {
      __int16 v20 = (void *)MEMORY[0x19F38D3B0]();
      v10[2](v10);
    }
  }
}

void __68__PLSearchIndexManager_applyGraphUpdates_supportingData_completion___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _inqEnsureSearchProgressExists];
  id v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"zeroKeywords"];
  if (v2)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 40);
    if (!v3)
    {
      uint64_t v4 = [PLZeroKeywordStore alloc];
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) searchIndexZeroKeywordStoreFilePath];
      uint64_t v6 = [(PLZeroKeywordStore *)v4 initWithPath:v5];
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      id v3 = *(void **)(*(void *)(a1 + 32) + 40);
    }
    [v3 updateZeroKeywordsTo:v2];
  }
  else
  {
    id v9 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543618;
      id v54 = v10;
      __int16 v55 = 2112;
      uint64_t v56 = 0;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to get ZeroKeywords from Knowledge Graph update for %{public}@. Error: %@", buf, 0x16u);
    }
  }
  uint64_t v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"searchMetadata"];
  if (v11)
  {
    long long v12 = *(void **)(*(void *)(a1 + 32) + 48);
    if (!v12)
    {
      BOOL v13 = [PLSearchMetadataStore alloc];
      uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 16) searchIndexMetadataStoreFilePath];
      uint64_t v15 = [(PLSearchMetadataStore *)v13 initWithPath:v14];
      uint64_t v16 = *(void *)(a1 + 32);
      __int16 v17 = *(void **)(v16 + 48);
      *(void *)(v16 + 48) = v15;

      long long v12 = *(void **)(*(void *)(a1 + 32) + 48);
    }
    [v12 updateSearchMetadataTo:v11];
  }
  else
  {
    os_log_type_t v18 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543618;
      id v54 = v19;
      __int16 v55 = 2112;
      uint64_t v56 = 0;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to get Search Metadata from Knowledge Graph update for %{public}@. Error: %@", buf, 0x16u);
    }
  }
  if (_os_feature_enabled_impl())
  {
    __int16 v20 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543362;
      id v54 = v21;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_INFO, "Ignoring applyGraphUpdates call from photoanalysisd, %{public}@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v52 = v2;
    __int16 v20 = [*(id *)(a1 + 32) _inqPhotoLibrary];
    uint64_t v51 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"synonymsByIndexCategoryMask"];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "addEntriesFromDictionary:");
    uint64_t v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"isGraphRebuild"];
    int v23 = [v22 BOOLValue];

    if (v23)
    {
      id v24 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543362;
        id v54 = v25;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Applying Knowledge Graph updates for Knowledge Graph rebuild for %{public}@.", buf, 0xCu);
      }
      [*(id *)(a1 + 32) _inqEnsureSearchIndexExists];
      *(unsigned char *)(*(void *)(a1 + 32) + 140) = 1;
      id v26 = [MEMORY[0x1E4F28E60] indexSet];
      [v26 addIndex:1700];
      [v26 addIndex:1701];
      [v26 addIndex:1800];
      [v26 addIndex:1802];
      [v26 addIndex:1801];
      [v26 addIndex:1103];
      [v26 addIndex:1310];
      [v26 addIndex:1600];
      [v26 addIndex:1610];
      [v26 addIndex:1001];
      [v26 addIndex:1000];
      [v26 addIndex:1300];
      id v27 = [MEMORY[0x1E4F1CA60] dictionary];
      id v28 = [v20 libraryServicesManager];
      uint64_t v29 = [v28 wellKnownPhotoLibraryIdentifier];

      uint64_t v30 = *(id **)(a1 + 32);
      if (v29 == 3)
      {
        __int16 v31 = [v30 _assetUUIDsWithGraphDataInSpotlight];
        id v32 = @"insertAsset";
      }
      else
      {
        __int16 v33 = [v30[4] allAssetUUIDsForGroupsWithCategories:v26];
        [v27 setObject:v33 forKeyedSubscript:@"insertAsset"];

        __int16 v31 = [*(id *)(*(void *)(a1 + 32) + 32) allCollectionUUIDsWithCollectionType:4];
        id v32 = @"removeHighlight";
      }
      [v27 setObject:v31 forKeyedSubscript:v32];

      id v34 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v35 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
        *(_DWORD *)buf = 138543362;
        id v54 = v35;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEFAULT, "Applying Knowledge Graph updates: dropGraphDataUpdates for %{public}@.", buf, 0xCu);
      }
      [*(id *)(a1 + 32) applyUpdates:v27 completion:0];
    }
    uint64_t v36 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"assetSearchKeywordsKey"];
    uint64_t v37 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"searchableAssetAssetUUIDsBySocialGroupKey"];
    uint64_t v38 = +[PLSearchIndexManager _keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords:v36 andAssetUUIDsBySocialGroup:v37 photoLibrary:v20];
    [*(id *)(*(void *)(a1 + 32) + 120) addEntriesFromDictionary:v38];
    CFAbsoluteTime v39 = (void *)[*(id *)(a1 + 48) mutableCopy];
    dispatch_semaphore_t v40 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v41 = [v38 allKeys];
    uint64_t v42 = [v40 arrayWithArray:v41];

    uint64_t v43 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"insertAsset"];
    [v42 addObjectsFromArray:v43];

    [v39 setObject:v42 forKeyedSubscript:@"insertAsset"];
    id v44 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"graphDataByUUID"];
    [*(id *)(*(void *)(a1 + 32) + 120) addEntriesFromDictionary:v44];
    id v45 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) photoLibraryTypeDescription];
      id v50 = v37;
      unint64_t v46 = v36;
      id v47 = v20;
      id v49 = v48 = v11;
      *(_DWORD *)buf = 138543362;
      id v54 = v49;
      _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_DEFAULT, "Applying Knowledge Graph updates to the search index for %{public}@.", buf, 0xCu);

      uint64_t v11 = v48;
      __int16 v20 = v47;
      uint64_t v36 = v46;
      uint64_t v37 = v50;
    }

    [*(id *)(a1 + 32) applyUpdates:v39 completion:*(void *)(a1 + 56)];
    id v2 = v52;
  }
}

- (void)applyUpdates:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v8 = [v6 count];
  id v9 = PLSearchBackendIndexManagerGetLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 134349570;
      uint64_t v20 = v8;
      __int16 v21 = 2114;
      id v22 = v6;
      __int16 v23 = 2114;
      id v24 = v11;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Applying %{public}lu updates: %{public}@ for %{public}@", buf, 0x20u);
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__PLSearchIndexManager_applyUpdates_completion___block_invoke;
    v16[3] = &unk_1E5874868;
    v16[4] = self;
    id v17 = v6;
    long long v12 = v7;
    id v18 = v12;
    BOOL v13 = [(PLSearchIndexManager *)self _onQueueAsync:v16];
    if (v12 && !v13) {
      v12[2](v12);
    }
  }
  else
  {
    if (v10)
    {
      uint64_t v14 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = (uint64_t)v14;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "No updates to apply for %{public}@.", buf, 0xCu);
    }
    if (v7)
    {
      uint64_t v15 = (void *)MEMORY[0x19F38D3B0]();
      v7[2](v7);
    }
  }
}

uint64_t __48__PLSearchIndexManager_applyUpdates_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _inqStartTrackingUpdateIfAble];
  [*(id *)(a1 + 32) _inqEnsurePhotoLibraryExists];
  id v2 = *(void **)(a1 + 32);
  if (v2[3])
  {
    id v3 = [v2 _updatesEnsuringMutableArraysFromUpdates:*(void *)(a1 + 40)];
    uint64_t v4 = [*(id *)(a1 + 32) _updatesAfterConvertingPersonsToAssetsInUpdates:v3];

    uint64_t v5 = [*(id *)(a1 + 32) _updatesAfterConvertingDetectedFacesToAssetsInUpdates:v4];

    [*(id *)(a1 + 32) _inqEnsureSearchProgressExists];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__PLSearchIndexManager_applyUpdates_completion___block_invoke_2;
    v10[3] = &unk_1E5871D68;
    v10[4] = *(void *)(a1 + 32);
    [v5 enumerateKeysAndObjectsUsingBlock:v10];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
  uint64_t v7 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    *(_DWORD *)buf = 138543362;
    long long v12 = v8;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "-[PLSearchIndexManager applyUpdates:completion:] called. Scheduling search index close if needed for %{public}@.", buf, 0xCu);
  }
  return [*(id *)(a1 + 32) _inqScheduleCloseIndexIfNeeded];
}

void __48__PLSearchIndexManager_applyUpdates_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2114;
    long long v12 = v8;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Applying search index updates for key: %{public}@ for %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) _inqAddUpdatesWithUUIDs:v6 forKey:v5];
}

- (id)_updatesEnsuringMutableArraysFromUpdates:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PLSearchIndexManager__updatesEnsuringMutableArraysFromUpdates___block_invoke;
  v8[3] = &unk_1E5873F68;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __65__PLSearchIndexManager__updatesEnsuringMutableArraysFromUpdates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 mutableCopy];
  [*(id *)(a1 + 32) setObject:v6 forKey:v5];
}

- (id)_updatesAfterConvertingDetectedFacesToAssetsInUpdates:(id)a3
{
  id v5 = a3;
  if (!self->_photoLibrary)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLSearchIndexManager.m", 786, @"Invalid parameter not satisfying: %@", @"_photoLibrary" object file lineNumber description];
  }
  id v6 = [v5 objectForKey:@"insertDetectedFace"];
  if ([v6 count])
  {
    uint64_t v7 = (void *)[v5 mutableCopy];
    [v7 removeObjectForKey:@"insertDetectedFace"];
    uint64_t v8 = [v5 objectForKey:@"insertAsset"];
    if (!v8)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
      [v7 setObject:v8 forKey:@"insertAsset"];
    }
    photoLibrary = self->_photoLibrary;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__PLSearchIndexManager__updatesAfterConvertingDetectedFacesToAssetsInUpdates___block_invoke;
    v13[3] = &unk_1E5873A50;
    v13[4] = self;
    id v14 = v6;
    id v15 = v8;
    id v10 = v8;
    [(PLPhotoLibrary *)photoLibrary performBlockAndWait:v13];
  }
  else
  {
    uint64_t v7 = v5;
  }

  return v7;
}

void __78__PLSearchIndexManager__updatesAfterConvertingDetectedFacesToAssetsInUpdates___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) managedObjectContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__PLSearchIndexManager__updatesAfterConvertingDetectedFacesToAssetsInUpdates___block_invoke_2;
  v4[3] = &unk_1E5863AC0;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  +[PLPerson enumerateAssetUUIDsForSearchIndexingWithDetectedFaceUUIDs:v3 managedObjectContext:v2 assetUUIDHandler:v4];
}

uint64_t __78__PLSearchIndexManager__updatesAfterConvertingDetectedFacesToAssetsInUpdates___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (id)_updatesAfterConvertingPersonsToAssetsInUpdates:(id)a3
{
  id v5 = a3;
  if (!self->_photoLibrary)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PLSearchIndexManager.m", 753, @"Invalid parameter not satisfying: %@", @"_photoLibrary" object file lineNumber description];
  }
  id v6 = [v5 objectForKey:@"insertPerson"];
  if ([v6 count])
  {
    uint64_t v7 = (void *)[v5 mutableCopy];
    [v7 removeObjectForKey:@"insertPerson"];
    uint64_t v8 = [v5 objectForKey:@"insertAsset"];
    if (!v8)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
      [v7 setObject:v8 forKey:@"insertAsset"];
    }
    id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    photoLibrary = self->_photoLibrary;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__PLSearchIndexManager__updatesAfterConvertingPersonsToAssetsInUpdates___block_invoke;
    v15[3] = &unk_1E5873A50;
    v15[4] = self;
    id v16 = v9;
    id v17 = v8;
    id v11 = v8;
    id v12 = v9;
    [(PLPhotoLibrary *)photoLibrary performBlockAndWait:v15];
  }
  else
  {
    uint64_t v7 = v5;
  }

  return v7;
}

void __72__PLSearchIndexManager__updatesAfterConvertingPersonsToAssetsInUpdates___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) managedObjectContext];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 24) libraryServicesManager];
        uint64_t v9 = [v8 wellKnownPhotoLibraryIdentifier];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __72__PLSearchIndexManager__updatesAfterConvertingPersonsToAssetsInUpdates___block_invoke_2;
        v11[3] = &unk_1E5863A98;
        id v12 = *(id *)(a1 + 48);
        +[PLPerson enumerateAssetUUIDsForSearchIndexingWithPersonUUID:v7 managedObjectContext:v2 libraryIdentifier:v9 assetUUIDHandler:v11];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

uint64_t __72__PLSearchIndexManager__updatesAfterConvertingPersonsToAssetsInUpdates___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)resetSearchIndexWithReason:(int64_t)a3 dropCompletion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PLSearchIndexManager_resetSearchIndexWithReason_dropCompletion___block_invoke;
  v9[3] = &unk_1E5873370;
  v9[4] = self;
  int64_t v11 = a3;
  uint64_t v7 = (void (**)(void))v6;
  id v10 = v7;
  BOOL v8 = [(PLSearchIndexManager *)self _onQueueAsync:v9];
  if (v7 && !v8) {
    v7[2](v7);
  }
}

uint64_t __66__PLSearchIndexManager_resetSearchIndexWithReason_dropCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _inqResetSearchIndexWithReason:*(void *)(a1 + 48) dropCompletion:*(void *)(a1 + 40)];
}

- (void)_inqResetSearchIndexWithReason:(int64_t)a3 dropCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 0xA) {
      BOOL v8 = @"PLSearchIndexRebuildReasonNone";
    }
    else {
      BOOL v8 = off_1E5863DA0[a3 - 1];
    }
    uint64_t v9 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    *(_DWORD *)buf = 138543874;
    long long v14 = v8;
    __int16 v15 = 2050;
    int64_t v16 = a3;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Received request to rebuild search index with reason: %{public}@ (%{public}ld) for %{public}@", buf, 0x20u);
  }
  [(PLSearchIndexManager *)self _inqStartTrackingRebuildWithReason:a3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__PLSearchIndexManager__inqResetSearchIndexWithReason_dropCompletion___block_invoke;
  v11[3] = &unk_1E58742F0;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(PLSearchIndexManager *)self _inqCloseSearchIndexAndDelete:1 withCompletion:v11];
}

uint64_t __70__PLSearchIndexManager__inqResetSearchIndexWithReason_dropCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) unpauseIndexingWithReason:@"PLSearchIndexPauseReasonCloseSearchIndex"];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)dropSearchIndexWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PLSearchIndexManager_dropSearchIndexWithCompletion___block_invoke;
  v7[3] = &unk_1E58742F0;
  v7[4] = self;
  uint64_t v5 = (void (**)(void))v4;
  id v8 = v5;
  BOOL v6 = [(PLSearchIndexManager *)self _onQueueAsync:v7];
  if (v5 && !v6) {
    v5[2](v5);
  }
}

uint64_t __54__PLSearchIndexManager_dropSearchIndexWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _inqCloseSearchIndexAndDelete:1 withCompletion:*(void *)(a1 + 40)];
}

- (void)invalidate
{
  [(PLSearchIndexManager *)self _stopObservingPhotosPreferences];
  [(PLSearchIndexManager *)self _stopObservingPowerSourceChanges];
  [(PLThrottleTimer *)self->_throttleTimer invalidate];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __34__PLSearchIndexManager_invalidate__block_invoke;
  int64_t v11 = &unk_1E5875CE0;
  id v12 = self;
  PLRunWithUnfairLock();
  dispatch_block_t v3 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_7185);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PLSearchIndexManager_invalidate__block_invoke_3;
  block[3] = &unk_1E58742F0;
  block[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(queue, block);
  dispatch_block_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

void __34__PLSearchIndexManager_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 176) = 1;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "allObjects", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        dispatch_block_cancel(*(dispatch_block_t *)(*((void *)&v6 + 1) + 8 * v5++));
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

uint64_t __34__PLSearchIndexManager_invalidate__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _inqCloseSearchIndexAndDelete:0 withCompletion:*(void *)(a1 + 40)];
}

- (void)ensureSearchIndexExistsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PLSearchIndexManager_ensureSearchIndexExistsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58742F0;
  v7[4] = self;
  uint64_t v5 = (void (**)(void))v4;
  id v8 = v5;
  BOOL v6 = [(PLSearchIndexManager *)self _onQueueAsync:v7];
  if (v5 && !v6) {
    v5[2](v5);
  }
}

void __69__PLSearchIndexManager_ensureSearchIndexExistsWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__PLSearchIndexManager_ensureSearchIndexExistsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5870758;
  objc_copyWeak(&v6, &location);
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _inqValidateSearchIndexWithCompletionHandler:v4];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __69__PLSearchIndexManager_ensureSearchIndexExistsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _inqEnsureSearchIndexExists];

  id v4 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    int v8 = 138543362;
    long long v9 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "-ensureSearchIndexExistsWithCompletionHandler called. Schedule index close if needed for %{public}@.", (uint8_t *)&v8, 0xCu);
  }
  id v6 = objc_loadWeakRetained(v2);
  [v6 _inqScheduleCloseIndexIfNeeded];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_inqCloseSearchIndexAndDelete:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  [(PLSearchIndexManager *)self _inqSetIndexingPaused:1 reason:@"PLSearchIndexPauseReasonCloseSearchIndex"];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  long long v13 = __69__PLSearchIndexManager__inqCloseSearchIndexAndDelete_withCompletion___block_invoke;
  long long v14 = &unk_1E5871E30;
  __int16 v15 = self;
  BOOL v17 = a3;
  id v7 = v6;
  id v16 = v7;
  int v8 = (void (**)(void))MEMORY[0x19F38D650](&v11);
  if ([(PLSearchIndexManager *)self _isIndexing]
    && (uint64_t v10 = MEMORY[0x1E4F143A8],
        PLResultWithUnfairLock(),
        long long v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    -[PLSearchIndexManager _setInqAfterIndexingDidIterate:](self, "_setInqAfterIndexingDidIterate:", v8, v10, 3221225472, __69__PLSearchIndexManager__inqCloseSearchIndexAndDelete_withCompletion___block_invoke_2, &unk_1E5870538, self, v11, v12, v13, v14, v15);
  }
  else
  {
    v8[2](v8);
  }
}

uint64_t __69__PLSearchIndexManager__inqCloseSearchIndexAndDelete_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _inqCloseIndexIfAbleOrForce:1 isDelete:*(unsigned __int8 *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

__CFString *__69__PLSearchIndexManager__inqCloseSearchIndexAndDelete_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 176)) {
    return @"Closed";
  }
  else {
    return (__CFString *)0;
  }
}

- (void)_throttleTimerFire:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Throttle timer fire. Resuming indexing if needed for %{public}@.", (uint8_t *)&v6, 0xCu);
  }
  [(PLSearchIndexManager *)self _inqResumeIndexingIfNeeded];
}

- (void)unpauseIndexingWithReason:(id)a3
{
}

- (void)pauseIndexingWithReason:(id)a3
{
}

- (BOOL)_setIndexingPaused:(BOOL)a3 synchronously:(BOOL)a4 reason:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__PLSearchIndexManager__setIndexingPaused_synchronously_reason___block_invoke;
  v14[3] = &unk_1E5874318;
  BOOL v16 = a3;
  v14[4] = self;
  id v15 = v8;
  id v9 = v8;
  uint64_t v10 = (void *)MEMORY[0x19F38D650](v14);
  if (v5) {
    BOOL v11 = [(PLSearchIndexManager *)self _onQueueSync:v10];
  }
  else {
    BOOL v11 = [(PLSearchIndexManager *)self _onQueueAsync:v10];
  }
  BOOL v12 = v11;

  return v12;
}

uint64_t __64__PLSearchIndexManager__setIndexingPaused_synchronously_reason___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _inqSetIndexingPaused:*(unsigned __int8 *)(a1 + 48) reason:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v2 = 1;
  }
  else
  {
    uint64_t v3 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      BOOL v5 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
      int v7 = 138543618;
      uint64_t v8 = v4;
      __int16 v9 = 2114;
      uint64_t v10 = v5;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Indexing unpaused for reason: %{public}@. Resuming indexing if needed for %{public}@.", (uint8_t *)&v7, 0x16u);
    }
    [*(id *)(a1 + 32) _inqResumeIndexingIfNeeded];
    BOOL v2 = *(unsigned char *)(a1 + 48) != 0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 56) setPaused:v2];
}

- (void)_inqSetIndexingPaused:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v6 = (PLSearchIndexManager *)a4;
  BOOL v7 = [(PLSearchIndexManager *)self _inqIsIndexingPaused];
  uint64_t v8 = [(PLSearchIndexManager *)self _pauseReasons];
  __int16 v9 = v8;
  if (v4)
  {
    uint64_t v10 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      int v25 = 138543874;
      id v26 = (__CFString *)v6;
      __int16 v27 = 2050;
      id v28 = self;
      __int16 v29 = 2114;
      uint64_t v30 = v11;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Search Indexing was asked to pause for reason: '%{public}@'. Search Index Manager: %{public}p for %{public}@", (uint8_t *)&v25, 0x20u);
    }
    [(__CFString *)v9 addObject:v6];
  }
  else
  {
    char v12 = [(__CFString *)v8 containsObject:v6];
    long long v13 = PLSearchBackendIndexManagerGetLog();
    long long v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        int v25 = 138543874;
        id v26 = (__CFString *)v6;
        __int16 v27 = 2050;
        id v28 = self;
        __int16 v29 = 2114;
        uint64_t v30 = v15;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Search Indexing was asked to unpause for reason: '%{public}@'. Search Index Manager: %{public}p for %{public}@", (uint8_t *)&v25, 0x20u);
      }
      [(__CFString *)v9 removeObject:v6];
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        BOOL v16 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
        int v25 = 138543874;
        id v26 = (__CFString *)v6;
        __int16 v27 = 2050;
        id v28 = self;
        __int16 v29 = 2114;
        uint64_t v30 = v16;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Search Indexing was asked to unpause for (unbalanced) reason: '%{public}@'. Search Index Manager: %{public}p for %{public}@", (uint8_t *)&v25, 0x20u);
      }
    }
  }
  BOOL v17 = [(PLSearchIndexManager *)self _inqIsIndexingPaused];
  if (v7 != v17)
  {
    BOOL v18 = v17;
    uint64_t v19 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if (v18) {
        uint64_t v20 = @"paused";
      }
      else {
        uint64_t v20 = @"unpaused";
      }
      __int16 v21 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      int v25 = 138544130;
      id v26 = v20;
      __int16 v27 = 2114;
      id v28 = v6;
      __int16 v29 = 2050;
      uint64_t v30 = self;
      __int16 v31 = 2114;
      id v32 = v21;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Search Indexing [%{public}@] for reason: '%{public}@'. Search Index Manager: %{public}p for %{public}@", (uint8_t *)&v25, 0x2Au);
    }
    id v22 = [(PLSearchIndexManager *)self spotlightDonationManager];
    [v22 setSpotlightOperationQueueSuspended:v18];
  }
  __int16 v23 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    int v25 = 138543874;
    id v26 = v9;
    __int16 v27 = 2050;
    id v28 = self;
    __int16 v29 = 2114;
    uint64_t v30 = v24;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "Search Indexing pause reasons: '%{public}@'. Search Index Manager: %{public}p for %{public}@", (uint8_t *)&v25, 0x20u);
  }
}

- (BOOL)isIndexingPaused
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__PLSearchIndexManager_isIndexingPaused__block_invoke;
  v4[3] = &unk_1E5875E68;
  void v4[4] = self;
  void v4[5] = &v5;
  [(PLSearchIndexManager *)self _onQueueSync:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__PLSearchIndexManager_isIndexingPaused__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _inqIsIndexingPaused];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_inqIsIndexingPaused
{
  char v2 = [(PLSearchIndexManager *)self _pauseReasons];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_inqAddUpdatesWithUUIDs:(id)a3 forKey:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v6];
    __int16 v9 = [(NSDictionary *)self->_inqUUIDsToProcess objectForKey:v7];
    inqUUIDsToProcess = self->_inqUUIDsToProcess;
    id v11 = v7;
    id v42 = v7;
    id v43 = v6;
    if ([v11 isEqualToString:@"insertAsset"])
    {
      char v12 = @"removeAsset";
    }
    else if ([v11 isEqualToString:@"removeAsset"])
    {
      char v12 = @"insertAsset";
    }
    else if ([v11 isEqualToString:@"insertAlbum"])
    {
      char v12 = @"removeAlbum";
    }
    else if ([v11 isEqualToString:@"removeAlbum"])
    {
      char v12 = @"insertAlbum";
    }
    else if ([v11 isEqualToString:@"insertMemory"])
    {
      char v12 = @"removeMemory";
    }
    else if ([v11 isEqualToString:@"removeMemory"])
    {
      char v12 = @"insertMemory";
    }
    else
    {
      char v12 = @"insertHighlight";
      if ([v11 isEqualToString:@"insertHighlight"])
      {
        char v12 = @"removeHighlight";
      }
      else if (![v11 isEqualToString:@"removeHighlight"])
      {
        char v12 = 0;
      }
    }

    long long v13 = [(NSDictionary *)inqUUIDsToProcess objectForKey:v12];
    CFAbsoluteTime v39 = v9;
    [v9 unionOrderedSet:v8];
    uint64_t v38 = v13;
    dispatch_semaphore_t v40 = (void *)v8;
    [v13 minusOrderedSet:v8];
    uint64_t v41 = self;
    long long v14 = self->_inqUUIDsToProcess;
    if ([v11 hasPrefix:@"insert"]) {
      id v15 = @" add";
    }
    else {
      id v15 = @" del";
    }
    BOOL v16 = v14;
    __int16 v35 = NSString;
    uint64_t v33 = v15;
    uint64_t v37 = [(NSDictionary *)v16 objectForKeyedSubscript:@"insertAsset"];
    uint64_t v32 = [v37 count];
    uint64_t v36 = [(NSDictionary *)v16 objectForKeyedSubscript:@"removeAsset"];
    uint64_t v30 = [v36 count];
    id v34 = [(NSDictionary *)v16 objectForKeyedSubscript:@"insertAlbum"];
    uint64_t v29 = [v34 count];
    __int16 v31 = [(NSDictionary *)v16 objectForKeyedSubscript:@"removeAlbum"];
    uint64_t v28 = [v31 count];
    BOOL v17 = [(NSDictionary *)v16 objectForKeyedSubscript:@"insertMemory"];
    uint64_t v18 = [v17 count];
    uint64_t v19 = [(NSDictionary *)v16 objectForKeyedSubscript:@"removeMemory"];
    uint64_t v20 = [v19 count];
    __int16 v21 = [(NSDictionary *)v16 objectForKeyedSubscript:@"insertHighlight"];
    uint64_t v22 = [v21 count];
    __int16 v23 = [(NSDictionary *)v16 objectForKeyedSubscript:@"removeHighlight"];
    uint64_t v24 = [v23 count];
    int v25 = [(NSDictionary *)v16 objectForKeyedSubscript:@"renamePerson"];
    id v26 = [v35 stringWithFormat:@"(%@) index progress -> assets[+%d -%d] albums[+%d -%d] [memories[+%d -%d]] highlights[+%d -%d] renamedPersons[+%d]", v33, v32, v30, v29, v28, v18, v20, v22, v24, objc_msgSend(v25, "count")];

    __int16 v27 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v26;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    id v6 = v43;
    if ([v39 count] || objc_msgSend(v38, "count"))
    {
      [(PLThrottleTimer *)v41->_throttleTimer ping];
      if ([(PLSearchIndexManager *)v41 _isIndexing]) {
        v41->_receivedUpdatesWhileIndexing = 1;
      }
    }

    id v7 = v42;
  }
}

- (void)enqueuedUUIDsCountWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __64__PLSearchIndexManager_enqueuedUUIDsCountWithCompletionHandler___block_invoke;
  id v11 = &unk_1E58742F0;
  char v12 = self;
  id v5 = v4;
  id v13 = v5;
  if (![(PLSearchIndexManager *)self _onQueueAsync:&v8])
  {
    id v6 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      *(_DWORD *)buf = 138543362;
      id v15 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Search index is invalidated. Not returning enqueuedUUIDsCount for %{public}@.", buf, 0xCu);
    }
    if (v5) {
      (*((void (**)(id, void, void, double))v5 + 2))(v5, 0, 0, 0.0);
    }
  }
}

uint64_t __64__PLSearchIndexManager_enqueuedUUIDsCountWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _inqEnqueuedUUIDsCountForceLoad:1];
  char v2 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = [*(id *)(a1 + 32) photoLibraryTypeDescription];
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "-enqueuedUUIDsCountWithCompletionHandler called. Scheduling search index close if needed for %{public}@.", (uint8_t *)&v6, 0xCu);
  }
  uint64_t result = [*(id *)(a1 + 32) _inqScheduleCloseIndexIfNeeded];
  if (*(void *)(a1 + 40))
  {
    [*(id *)(*(void *)(a1 + 32) + 256) timeIntervalSinceNow];
    return (*(uint64_t (**)(double))(*(void *)(a1 + 40) + 16))((0.0 - v5) / 60.0);
  }
  return result;
}

- (unint64_t)_inqEnqueuedUUIDsCountForceLoad:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3) {
    [(PLSearchIndexManager *)self _inqEnsureSearchProgressExists];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(NSDictionary *)self->_inqUUIDsToProcess allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += [*(id *)(*((void *)&v11 + 1) + 8 * i) count];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)_inqEndTrackingUpdateIfNeeded
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_updateState == 2)
  {
    BOOL v3 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "End tracking update for %{public}@.", (uint8_t *)&v5, 0xCu);
    }
    kdebug_trace();
    self->_updateState = 0;
  }
}

- (void)_inqTrackTransitionFromUpdateScheduledToUpdatingIfAble
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_updateState == 1)
  {
    BOOL v3 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "Transition to active updating for %{public}@.", (uint8_t *)&v5, 0xCu);
    }
    kdebug_trace();
    kdebug_trace();
    self->_updateState = 2;
  }
}

- (void)_inqStartTrackingUpdateIfAble
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!self->_updateState)
  {
    BOOL v3 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "Start tracking update scheduled for %{public}@.", (uint8_t *)&v5, 0xCu);
    }
    kdebug_trace();
    self->_updateState = 1;
  }
}

- (void)_inqEndTrackingRebuildIfNeeded
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_isTrackingRebuild)
  {
    BOOL v3 = [(PLSearchIndexManager *)self searchIndexManagerSignpostLog];
    os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
    int v5 = v3;
    uint64_t v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_INTERVAL_END, v4, "SearchIndexManager - RebuildIndex", "", (uint8_t *)&v11, 2u);
    }

    uint64_t v7 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int64_t rebuildReason = self->_rebuildReason;
      if ((unint64_t)(rebuildReason - 1) > 0xA) {
        uint64_t v9 = @"PLSearchIndexRebuildReasonNone";
      }
      else {
        uint64_t v9 = off_1E5863DA0[rebuildReason - 1];
      }
      uint64_t v10 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
      int v11 = 138543874;
      long long v12 = v9;
      __int16 v13 = 2050;
      int64_t v14 = rebuildReason;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "End tracking search index rebuild with reason: %{public}@ (%{public}ld) for %{public}@", (uint8_t *)&v11, 0x20u);
    }
    kdebug_trace();
    self->_isTrackingRebuild = 0;
  }
}

- (void)_inqStartTrackingRebuildWithReason:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(PLSearchIndexManager *)self _inqEndTrackingRebuildIfNeeded];
  int v5 = [(PLSearchIndexManager *)self searchIndexManagerSignpostLog];
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  uint64_t v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SearchIndexManager - RebuildIndex", "", (uint8_t *)&v12, 2u);
  }

  uint64_t v9 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 0xA) {
      uint64_t v10 = @"PLSearchIndexRebuildReasonNone";
    }
    else {
      uint64_t v10 = off_1E5863DA0[a3 - 1];
    }
    int v11 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
    int v12 = 138543874;
    __int16 v13 = v10;
    __int16 v14 = 2050;
    int64_t v15 = a3;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Start tracking search index rebuild with reason: %{public}@ (%{public}ld) for %{public}@", (uint8_t *)&v12, 0x20u);
  }
  kdebug_trace();
  self->_isTrackingRebuild = 1;
  self->_int64_t rebuildReason = a3;
}

- (BOOL)_inqUpdateFeaturedContentAllowed:(BOOL)a3
{
  os_signpost_id_t v4 = @"0";
  if (a3) {
    os_signpost_id_t v4 = @"1";
  }
  int v5 = NSString;
  os_signpost_id_t v6 = v4;
  uint64_t v7 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
  uint64_t v8 = [v5 stringWithFormat:@"Featured Content Allowed Changed for photolibrary: %@", v7];

  BOOL v9 = [(PLSearchIndexManager *)self _inqUpdateSearchSystemInfo:v6 forKey:@"featuredContentAllowed" logMessage:v8];
  return v9;
}

- (BOOL)_inqUpdateWordEmbeddingVersion:(id)a3
{
  if (!a3) {
    return 0;
  }
  os_signpost_id_t v4 = NSString;
  id v5 = a3;
  os_signpost_id_t v6 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
  uint64_t v7 = [v4 stringWithFormat:@"Word Embedding version changed for photolibrary: %@", v6];

  uint64_t v8 = [v5 description];

  LOBYTE(self) = [(PLSearchIndexManager *)self _inqUpdateSearchSystemInfo:v8 forKey:@"embeddingVersion" logMessage:v7];
  return (char)self;
}

- (BOOL)_inqUpdateSceneTaxonomySHA:(id)a3
{
  os_signpost_id_t v4 = NSString;
  id v5 = a3;
  os_signpost_id_t v6 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
  uint64_t v7 = [v4 stringWithFormat:@"Scene taxonomy SHA changed for photolibrary: %@", v6];

  LOBYTE(self) = [(PLSearchIndexManager *)self _inqUpdateSearchSystemInfo:v5 forKey:@"sceneTaxonomySHA" logMessage:v7];
  return (char)self;
}

- (BOOL)_inqUpdateLocale
{
  BOOL v3 = +[PLSearchIndexConfiguration locale];
  os_signpost_id_t v4 = [v3 localeIdentifier];

  id v5 = NSString;
  os_signpost_id_t v6 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
  uint64_t v7 = [v5 stringWithFormat:@"Locale changed for photolibrary: %@", v6];

  LOBYTE(self) = [(PLSearchIndexManager *)self _inqUpdateSearchSystemInfo:v4 forKey:@"localeIdentifier" logMessage:v7];
  return (char)self;
}

- (int64_t)_inqSpotlightRequestedRebuild
{
  char v2 = [(PLSearchIndexManager *)self _inqPhotoLibrary];
  BOOL v3 = v2;
  if (v2)
  {
    os_signpost_id_t v4 = [v2 pathManager];
    BOOL v5 = +[PLSpotlightProgressManager shouldReindexSpotlightIndexForPhotoLibraryPathManager:v4];

    if (v5) {
      int64_t v6 = 8;
    }
    else {
      int64_t v6 = 0;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_inqUpdateUtilityTypeClassifierVersion
{
  unint64_t v3 = +[PLSearchIndexConfiguration currentUtilityTypeClassifierVersion];
  os_signpost_id_t v4 = NSString;
  BOOL v5 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
  int64_t v6 = [v4 stringWithFormat:@"Utility type classifier version changed for photolibrary: %@", v5];

  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v3];
  uint64_t v8 = [v7 description];
  LOBYTE(self) = [(PLSearchIndexManager *)self _inqUpdateSearchSystemInfo:v8 forKey:@"utilityTypeClassifierVersion" logMessage:v6];

  return (char)self;
}

- (BOOL)_inqUpdateEmbeddingModelVersion
{
  unint64_t v3 = +[PLSearchIndexConfiguration currentEmbeddingModelVersion];
  os_signpost_id_t v4 = NSString;
  BOOL v5 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
  int64_t v6 = [v4 stringWithFormat:@"Search embedding model version changed for photolibrary: %@", v5];

  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v3];
  uint64_t v8 = [v7 description];
  LOBYTE(self) = [(PLSearchIndexManager *)self _inqUpdateSearchSystemInfo:v8 forKey:@"embeddingModelVersion" logMessage:v6];

  return (char)self;
}

- (BOOL)_inqUpdateVersion
{
  unint64_t v3 = +[PLSearchIndexConfiguration currentSearchIndexVersion];
  os_signpost_id_t v4 = NSString;
  BOOL v5 = [(PLSearchIndexManager *)self photoLibraryTypeDescription];
  int64_t v6 = [v4 stringWithFormat:@"Search index version changed for photolibrary: %@", v5];

  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v3];
  uint64_t v8 = [v7 description];
  LOBYTE(self) = [(PLSearchIndexManager *)self _inqUpdateSearchSystemInfo:v8 forKey:@"searchIndexVersion" logMessage:v6];

  return (char)self;
}

- (BOOL)_inqUpdateSearchSystemInfo:(id)a3 forKey:(id)a4 logMessage:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(PLSearchIndexManager *)self _inqEnsureSearchSystemInfoExists];
  NSUInteger v11 = [(NSDictionary *)self->_searchSystemInfo count];
  id v12 = [(NSDictionary *)self->_searchSystemInfo objectForKeyedSubscript:v9];
  __int16 v13 = v12;
  if (v12 == v8 || ([v12 isEqual:v8] & 1) != 0)
  {
    char v14 = 0;
  }
  else
  {
    if (v10)
    {
      int64_t v15 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v20 = 138543874;
        id v21 = v10;
        __int16 v22 = 2114;
        __int16 v23 = v13;
        __int16 v24 = 2114;
        id v25 = v8;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ -> %{public}@", (uint8_t *)&v20, 0x20u);
      }
    }
    __int16 v16 = (NSDictionary *)[(NSDictionary *)self->_searchSystemInfo mutableCopy];
    [(NSDictionary *)v16 setObject:v8 forKeyedSubscript:v9];
    searchSystemInfo = self->_searchSystemInfo;
    self->_searchSystemInfo = v16;

    char v14 = 1;
  }
  if (v11) {
    BOOL v18 = v14;
  }
  else {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)_onQueueAsyncWithDelay:(double)a3 perform:(id)a4
{
  id v6 = a4;
  location[1] = (id)MEMORY[0x1E4F143A8];
  location[2] = (id)3221225472;
  location[3] = __55__PLSearchIndexManager__onQueueAsyncWithDelay_perform___block_invoke;
  location[4] = &unk_1E5870538;
  location[5] = self;
  uint64_t v7 = PLResultWithUnfairLock();

  if (!v7)
  {
    objc_initWeak(location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PLSearchIndexManager__onQueueAsyncWithDelay_perform___block_invoke_2;
    block[3] = &unk_1E5870758;
    objc_copyWeak(&v15, location);
    block[4] = self;
    id v14 = v6;
    dispatch_block_t v8 = dispatch_block_create((dispatch_block_flags_t)0, block);
    os_unfair_lock_lock(&self->_stateLock);
    blocksOnQueueAfterDelay = self->_blocksOnQueueAfterDelay;
    id v10 = (void *)MEMORY[0x19F38D650](v8);
    [(NSHashTable *)blocksOnQueueAfterDelay addObject:v10];

    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_after(v11, (dispatch_queue_t)self->_queue, v8);
    os_unfair_lock_unlock(&self->_stateLock);

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }

  return v7 == 0;
}

__CFString *__55__PLSearchIndexManager__onQueueAsyncWithDelay_perform___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 176)) {
    return @"Closed";
  }
  else {
    return (__CFString *)0;
  }
}

void __55__PLSearchIndexManager__onQueueAsyncWithDelay_perform___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v3 = PLResultWithUnfairLock();

  if (!v3) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

__CFString *__55__PLSearchIndexManager__onQueueAsyncWithDelay_perform___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 176)) {
    return @"Closed";
  }
  else {
    return (__CFString *)0;
  }
}

- (BOOL)_onQueueAsync:(id)a3
{
  id v4 = a3;
  BOOL v5 = PLResultWithUnfairLock();

  if (!v5) {
    dispatch_async((dispatch_queue_t)self->_queue, v4);
  }

  return v5 == 0;
}

__CFString *__38__PLSearchIndexManager__onQueueAsync___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 176)) {
    return @"Closed";
  }
  else {
    return (__CFString *)0;
  }
}

- (BOOL)_onQueueSync:(id)a3
{
  id v4 = a3;
  BOOL v5 = PLResultWithUnfairLock();

  if (!v5) {
    dispatch_sync((dispatch_queue_t)self->_queue, v4);
  }

  return v5 == 0;
}

__CFString *__37__PLSearchIndexManager__onQueueSync___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 176)) {
    return @"Closed";
  }
  else {
    return (__CFString *)0;
  }
}

- (void)dealloc
{
  [(PLThrottleTimer *)self->_throttleTimer invalidate];
  [(PLSearchIndexManager *)self _inqCloseIndexIfAbleOrForce:1 isDelete:0];
  v3.receiver = self;
  v3.super_class = (Class)PLSearchIndexManager;
  [(PLSearchIndexManager *)&v3 dealloc];
}

- (PLSearchIndexManager)initWithPathManager:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((PLIsAssetsd() & 1) == 0 && (PLIsInternalTool() & 1) == 0)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"PLSearchIndexManager.m" lineNumber:315 description:@"Must only be initialized in assetsd"];
  }
  if ((PLPlatformSearchSupported() & 1) == 0) {
    goto LABEL_9;
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v7 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Attempted to initialize PLSearchIndexManager while PhotosSearchBackgroundJobWorker feature flag is enabled. Unsupported configuration.", buf, 2u);
    }

LABEL_9:
    dispatch_block_t v8 = 0;
    goto LABEL_10;
  }
  v30.receiver = self;
  v30.super_class = (Class)PLSearchIndexManager;
  dispatch_block_t v8 = [(PLSearchIndexManager *)&v30 init];
  if (v8)
  {
    char v10 = 1;
    dispatch_time_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v12 = pl_dispatch_queue_create_with_qos_and_fallback_qos();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v8->_pathManager, a3);
    v8->_stateLock._os_unfair_lock_opaque = 0;
    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    blocksOnQueueAfterDelay = v8->_blocksOnQueueAfterDelay;
    v8->_blocksOnQueueAfterDelay = (NSHashTable *)v14;

    __int16 v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v17 = [v16 objectForKey:@"shouldLimitIndexingWhileOnBattery"];
    BOOL v18 = v17;
    if (v17) {
      char v10 = [v17 BOOLValue];
    }
    v8->_shouldLimitIndexingWhileOnBattery = v10;
    uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v20 = [(PLPhotoLibraryPathManager *)v8->_pathManager searchIndexDirectory];
    id v29 = 0;
    char v21 = [v19 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:&v29];
    id v22 = v29;

    if (v21)
    {
      __int16 v23 = [[PLThrottleTimer alloc] initWithTarget:v8 action:sel__throttleTimerFire_ invocationQueue:v8->_queue timeout:20.0 maxTimeout:300.0];
      throttleTimer = v8->_throttleTimer;
      v8->_throttleTimer = v23;

      id v25 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
      pauseReasons = v8->__pauseReasons;
      v8->__pauseReasons = v25;
    }
    else
    {
      __int16 v27 = PLSearchBackendIndexManagerGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v22;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Failed to create directory. Error: %@", buf, 0xCu);
      }

      pauseReasons = v8;
      dispatch_block_t v8 = 0;
    }

    [(PLSearchIndexManager *)v8 _beginObservingPhotosPreferences];
    [(PLSearchIndexManager *)v8 _beginObservingPowerSourceChanges];
  }
LABEL_10:

  return v8;
}

- (NSString)photoLibraryTypeDescription
{
  photoLibraryTypeDescription = self->_photoLibraryTypeDescription;
  if (!photoLibraryTypeDescription)
  {
    id v4 = [(PLSearchIndexManager *)self _inqPhotoLibrary];
    PLPhotolibraryWellKnownIdentifierDescriptionForPhotoLibrary(v4);
    BOOL v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_photoLibraryTypeDescription;
    self->_photoLibraryTypeDescription = v5;

    photoLibraryTypeDescription = self->_photoLibraryTypeDescription;
  }
  return photoLibraryTypeDescription;
}

+ (id)_keywordsByCategoryMaskByAssetUUIDFromAssetUUIDsBySocialGroup:(id)a3
{
  objc_super v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetUUIDsBySocialGroup___block_invoke;
  v8[3] = &unk_1E5863D18;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __86__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetUUIDsBySocialGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
        if (!v12)
        {
          uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
          [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v11];
        }
        __int16 v13 = [v12 objectForKeyedSubscript:&unk_1EEBED320];
        if (!v13)
        {
          __int16 v13 = [MEMORY[0x1E4F1CA48] array];
          [v12 setObject:v13 forKeyedSubscript:&unk_1EEBED320];
        }
        [v13 addObject:v5];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

+ (id)_keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_photoLibrary___block_invoke;
  v14[3] = &unk_1E5873A50;
  id v15 = v6;
  id v16 = v5;
  id v8 = v7;
  id v17 = v8;
  id v9 = v5;
  id v10 = v6;
  [v10 performBlockAndWait:v14];
  uint64_t v11 = v17;
  id v12 = v8;

  return v12;
}

void __95__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_photoLibrary___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_photoLibrary___block_invoke_2;
  v5[3] = &unk_1E5863CF0;
  id v6 = v2;
  objc_super v3 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v4 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
}

void __95__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_photoLibrary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a2;
  id v8 = +[PLManagedAsset entityName];
  id v9 = [v6 fetchRequestWithEntityName:v8];

  [v9 setResultType:2];
  [v9 setPropertiesToFetch:&unk_1EEBF15C8];
  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"moment.uuid = %@", v7];

  [v9 setPredicate:v10];
  uint64_t v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
  v20[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v9 setSortDescriptors:v12];

  __int16 v13 = *(void **)(a1 + 32);
  id v19 = 0;
  long long v14 = [v13 executeFetchRequest:v9 error:&v19];
  id v15 = v19;
  if (v14)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __95__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_photoLibrary___block_invoke_3;
    v16[3] = &unk_1E5863CC8;
    id v17 = v14;
    id v18 = *(id *)(a1 + 40);
    [v5 enumerateKeysAndObjectsUsingBlock:v16];
  }
}

void __95__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_photoLibrary___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v19 = a3;
  id v6 = [v5 startDate];
  id v18 = v5;
  int v20 = [v5 endDate];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        __int16 v13 = [v12 objectForKeyedSubscript:@"dateCreated"];
        long long v14 = v13;
        if (v13 && [v13 compare:v6] != -1)
        {
          if ([v14 compare:v20] == 1)
          {

            goto LABEL_17;
          }
          id v15 = [v12 objectForKeyedSubscript:@"uuid"];
          id v16 = [*(id *)(a1 + 40) objectForKeyedSubscript:v15];
          if (v16)
          {
            id v17 = v16;
            [v16 addEntriesFromDictionary:v19];
          }
          else
          {
            id v17 = (void *)[v19 mutableCopy];
            [*(id *)(a1 + 40) setObject:v17 forKeyedSubscript:v15];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_17:
}

+ (id)_keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords:(id)a3 andAssetUUIDsBySocialGroup:(id)a4 photoLibrary:(id)a5
{
  id v8 = a4;
  uint64_t v9 = [a1 _keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords:a3 photoLibrary:a5];
  uint64_t v10 = [a1 _keywordsByCategoryMaskByAssetUUIDFromAssetUUIDsBySocialGroup:v8];

  if ([v10 count])
  {
    if ([v9 count])
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __122__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_andAssetUUIDsBySocialGroup_photoLibrary___block_invoke;
      v15[3] = &unk_1E586F060;
      id v11 = v9;
      id v16 = v11;
      [v10 enumerateKeysAndObjectsUsingBlock:v15];
      id v12 = v11;

      goto LABEL_7;
    }
    id v13 = v10;
  }
  else
  {
    id v13 = v9;
  }
  id v12 = v13;
LABEL_7:

  return v12;
}

void __122__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_andAssetUUIDsBySocialGroup_photoLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
    [v7 addEntriesFromDictionary:v5];
  }
  else
  {
    id v7 = (void *)[v5 mutableCopy];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

+ (BOOL)_isIndexingAllowedByDAS
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2050000000;
  char v2 = (void *)get_DASSystemContextClass_softClass;
  uint64_t v17 = get_DASSystemContextClass_softClass;
  if (!get_DASSystemContextClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    id v19 = __get_DASSystemContextClass_block_invoke;
    int v20 = &unk_1E5875840;
    long long v21 = &v14;
    __get_DASSystemContextClass_block_invoke((uint64_t)&buf);
    char v2 = (void *)v15[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v14, 8);
  id v4 = [v3 sharedInstance];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  id v5 = (void *)get_DASSchedulingPriorityBackgroundSymbolLoc_ptr;
  uint64_t v17 = get_DASSchedulingPriorityBackgroundSymbolLoc_ptr;
  if (!get_DASSchedulingPriorityBackgroundSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    id v19 = __get_DASSchedulingPriorityBackgroundSymbolLoc_block_invoke;
    int v20 = &unk_1E5875840;
    long long v21 = &v14;
    id v6 = DuetActivitySchedulerLibrary();
    id v7 = dlsym(v6, "_DASSchedulingPriorityBackground");
    *(void *)(v21[1] + 24) = v7;
    get_DASSchedulingPriorityBackgroundSymbolLoc_ptr = *(void *)(v21[1] + 24);
    id v5 = (void *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = [NSString stringWithUTF8String:"_DASSchedulingPriority get_DASSchedulingPriorityBackground(void)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"PLSearchIndexManager.m", 89, @"%s", dlerror());

    __break(1u);
  }
  int v8 = [v4 allowsDiscretionaryWorkForTask:@"com.apple.assetsd.search" withPriority:*v5 withParameters:0];

  uint64_t v9 = PLSearchBackendIndexManagerGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = @" not";
    if (v8) {
      uint64_t v10 = &stru_1EEB2EB80;
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "DAS is%@ allowing indexing to continue.", (uint8_t *)&buf, 0xCu);
  }

  return v8;
}

+ (BOOL)_isUnboundedIndexingAllowed
{
  if (IOPSGetTimeRemainingEstimate() == -2.0) {
    return 1;
  }
  return [a1 _isIndexingAllowedByDAS];
}

+ (id)fetchMomentUUIDsToPopulateAssetSearchIndexWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[PLMoment fetchRequest];
  [v6 setResultType:2];
  v11[0] = @"uuid";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v6 setPropertiesToFetch:v7];

  int v8 = [v5 executeFetchRequest:v6 error:a4];

  uint64_t v9 = [v8 valueForKey:@"uuid"];

  return v9;
}

+ (id)fetchHighlightUUIDsToPopulateSearchIndexWithManagedObjectContext:(id)a3 libraryIdentifier:(int64_t)a4 error:(id *)a5
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = +[PLPhotosHighlight fetchRequest];
  [v8 setResultType:2];
  v14[0] = @"uuid";
  v14[1] = @"title";
  v14[2] = @"keyAssetPrivate";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  [v8 setPropertiesToFetch:v9];

  uint64_t v10 = +[PLPhotosHighlight isEligibleForSearchIndexingPredicateForLibraryIdentifier:a4];
  [v8 setPredicate:v10];

  id v11 = [v7 executeFetchRequest:v8 error:a5];

  id v12 = [v11 valueForKey:@"uuid"];

  return v12;
}

+ (id)fetchMemoryUUIDsToPopulateSearchIndexWithManagedObjectContext:(id)a3 libraryIdentifier:(int64_t)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = a3;
  uint64_t v9 = +[PLMemory entityName];
  uint64_t v10 = [v7 fetchRequestWithEntityName:v9];

  [v10 setResultType:2];
  v16[0] = @"uuid";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v10 setPropertiesToFetch:v11];

  id v12 = +[PLMemory isEligibleForSearchIndexingPredicateForLibraryIdentifier:a4];
  [v10 setPredicate:v12];

  id v13 = [v8 executeFetchRequest:v10 error:a5];

  uint64_t v14 = [v13 valueForKey:@"uuid"];

  return v14;
}

+ (id)fetchAlbumUUIDsToPopulateSearchIndexWithManagedObjectContext:(id)a3 libraryIdentifier:(int64_t)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = a3;
  uint64_t v9 = +[PLGenericAlbum entityName];
  uint64_t v10 = [v7 fetchRequestWithEntityName:v9];

  [v10 setResultType:2];
  v16[0] = @"uuid";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v10 setPropertiesToFetch:v11];

  id v12 = +[PLGenericAlbum isEligibleForSearchIndexingPredicateForLibraryIdentifier:a4];
  [v10 setPredicate:v12];

  id v13 = [v8 executeFetchRequest:v10 error:a5];

  uint64_t v14 = [v13 valueForKey:@"uuid"];

  return v14;
}

+ (id)fetchAssetUUIDsToPopulateSearchIndexWithManagedObjectContext:(id)a3 libraryIdentifier:(int64_t)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = a3;
  uint64_t v9 = +[PLManagedAsset entityName];
  uint64_t v10 = [v7 fetchRequestWithEntityName:v9];

  [v10 setResultType:2];
  v16[0] = @"uuid";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v10 setPropertiesToFetch:v11];

  id v12 = +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:a4];
  [v10 setPredicate:v12];

  id v13 = [v8 executeFetchRequest:v10 error:a5];

  uint64_t v14 = [v13 valueForKey:@"uuid"];

  return v14;
}

+ (id)fetchHighlightsWithUUIDs:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[PLPhotosHighlight fetchRequest];
  v14[0] = @"uuid";
  v14[1] = @"title";
  v14[2] = @"keyAssetPrivate";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  [v9 setPropertiesToFetch:v10];

  [v9 setIncludesPendingChanges:0];
  if ((unint64_t)[v7 count] >= 0x65) {
    [v9 setFetchBatchSize:100];
  }
  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v7];
  [v9 setPredicate:v11];

  objc_msgSend(v9, "setFetchLimit:", objc_msgSend(v7, "count"));
  id v12 = [v8 executeFetchRequest:v9 error:a5];

  return v12;
}

+ (id)fetchMemoriesWithUUIDs:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1E4F1C0D0];
  id v9 = a4;
  uint64_t v10 = +[PLMemory entityName];
  id v11 = [v8 fetchRequestWithEntityName:v10];

  [v11 setPropertiesToFetch:&unk_1EEBF1CB8];
  [v11 setIncludesPendingChanges:0];
  if ((unint64_t)[v7 count] >= 0x65) {
    [v11 setFetchBatchSize:100];
  }
  id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v7];
  [v11 setPredicate:v12];

  objc_msgSend(v11, "setFetchLimit:", objc_msgSend(v7, "count"));
  id v13 = [v9 executeFetchRequest:v11 error:a5];

  return v13;
}

+ (id)fetchAlbumsWithUUIDs:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1E4F1C0D0];
  id v9 = a4;
  uint64_t v10 = +[PLGenericAlbum entityName];
  id v11 = [v8 fetchRequestWithEntityName:v10];

  [v11 setPropertiesToFetch:&unk_1EEBF1CA0];
  [v11 setIncludesPendingChanges:0];
  if ((unint64_t)[v7 count] >= 0x65) {
    [v11 setFetchBatchSize:100];
  }
  id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v7];
  [v11 setPredicate:v12];

  objc_msgSend(v11, "setFetchLimit:", objc_msgSend(v7, "count"));
  id v13 = [v9 executeFetchRequest:v11 error:a5];

  return v13;
}

+ (id)fetchAssetsWithUUIDs:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1E4F1C0D0];
  id v9 = a4;
  uint64_t v10 = +[PLManagedAsset entityName];
  id v11 = [v8 fetchRequestWithEntityName:v10];

  [v11 setIncludesPendingChanges:0];
  [v11 setRelationshipKeyPathsForPrefetching:&unk_1EEBF1C88];
  if ((unint64_t)[v7 count] >= 0x65) {
    [v11 setFetchBatchSize:100];
  }
  id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v7];
  [v11 setPredicate:v12];

  objc_msgSend(v11, "setFetchLimit:", objc_msgSend(v7, "count"));
  id v13 = [v9 executeFetchRequest:v11 error:a5];

  return v13;
}

@end