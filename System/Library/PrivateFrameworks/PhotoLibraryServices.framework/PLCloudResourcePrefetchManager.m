@interface PLCloudResourcePrefetchManager
+ (BOOL)_hasAssetsNeedingOneTimeThumbRebuildInContext:(id)a3;
+ (BOOL)_prefetchIsEnabledForPhase:(unint64_t)a3 givenMode:(int64_t)a4 andInitialSyncDate:(id)a5;
+ (id)_fetchThumbnailResourcesForAssets:(id)a3 version:(unsigned int)a4 maxRetry:(unint64_t)a5 inContext:(id)a6 error:(id *)a7;
+ (id)_identifierForResourceDownload:(id)a3;
+ (id)_resourcesWithPredicate:(id)a3 limit:(unint64_t)a4 context:(id)a5;
+ (id)descriptionForPrefetchMode:(int64_t)a3;
+ (id)descriptionForPrefetchPhase:(unint64_t)a3;
+ (id)thumbnailResourcesNeedingPrefetchInContext:(id)a3 maxRetry:(unint64_t)a4 limit:(int64_t)a5;
+ (void)resourcesToPrefetchWithPrefetchPhase:(unint64_t)a3 prefetchMode:(int64_t)a4 prefetchOptimizeMode:(int64_t)a5 initialSyncDate:(id)a6 lastCompletePrefetchDate:(id)a7 initialBudget:(int64_t)a8 excludeDynamicCPLResources:(BOOL)a9 prefetchConfiguration:(id)a10 photoLibrary:(id)a11 applyPerPrefetchLimit:(BOOL)a12 completionHandler:(id)a13;
- (BOOL)_canPrefetchInLibrary:(id)a3;
- (BOOL)_isInflightResourceIdentifier:(id)a3;
- (BOOL)_isPrefetchDisabled;
- (BOOL)_prefetchIsEnabledForPhase:(unint64_t)a3;
- (PLCloudResourcePrefetchManager)init;
- (PLCloudResourcePrefetchManager)initWithCPLManager:(id)a3 pruneManager:(id)a4 libraryServicesManager:(id)a5;
- (id)_allInflightResourceIdentifiers;
- (id)_inflightResourceIdentifiersForPrefetchPhase:(unint64_t)a3;
- (id)_lastCompletePrefetchDateInLibrary:(id)a3;
- (id)_prefetchStatusForDebug:(BOOL)a3;
- (id)_resourcesToPrefetchWithPrefetchPhase:(unint64_t)a3 photoLibrary:(id)a4 applyPerPrefetchLimit:(BOOL)a5 initialBudget:(int64_t *)a6;
- (id)_volumeInfo;
- (id)prefetchStatusForDebug:(BOOL)a3;
- (int64_t)_diskSpaceBudgetForPrefetchPhase:(unint64_t)a3;
- (int64_t)_diskSpaceBudgetForPrefetchPhase:(unint64_t)a3 prefetchOptimizeMode:(int64_t)a4;
- (int64_t)_prefetchOptimizeModeBasedOnLibrarySize;
- (int64_t)_totalSizeOfLocallyAvailableOriginalResources;
- (int64_t)_totalSizeOfOriginalResources;
- (int64_t)_totalSizeOfOriginalResourcesForPrefetchWithPredicate:(id)a3;
- (unint64_t)_countOfAllInflightResources;
- (unint64_t)_countOfInflightResourcesForPrefetchPhase:(unint64_t)a3;
- (unint64_t)_intentForPrefetchPhase:(unint64_t)a3;
- (unint64_t)_smallLibrarySizeThresholdForTotalSizeOfLocallyAvailableOriginalResources:(int64_t)a3;
- (void)_addInflightResourceIdentifier:(id)a3 prefetchPhase:(unint64_t)a4;
- (void)_checkCPLBackgroundDownloadOperations;
- (void)_cleanupInflightResourcesInLibrary:(id)a3;
- (void)_enqueueCheckCPLBGDownloadFromNow:(id)a3 withReason:(id)a4;
- (void)_handlePrefetchError:(id)a3 forPLCloudResourceWithObjectID:(id)a4;
- (void)_incrementPrefetchCountForPrefetchPhase:(unint64_t)a3 resources:(id)a4 photoLibrary:(id)a5;
- (void)_prefetchComputeSyncResources:(id)a3 photoLibrary:(id)a4 prefetchPhase:(unint64_t)a5 shouldAutoPrefetchNextBatch:(BOOL)a6;
- (void)_prefetchResources:(id)a3 photoLibrary:(id)a4 prefetchPhase:(unint64_t)a5 shouldAutoPrefetchNextBatch:(BOOL)a6;
- (void)_removeAllInflightResourceIdentifiers;
- (void)_removeInflightResourceIdentifier:(id)a3 prefetchPhase:(unint64_t)a4;
- (void)_runOnWorkQueueWithTransaction:(id)a3 block:(id)a4;
- (void)_setLastCompletePrefetchDate:(id)a3 inLibrary:(id)a4;
- (void)_startAutomaticPrefetch;
- (void)_startPrefetchNextBatch;
- (void)_writeDownloadFinishedMarkerIfNeededWithLibrary:(id)a3;
- (void)clearPrefetchState;
- (void)handleCPLConfigurationChange;
- (void)handleCPLStatusChange;
- (void)handleOptimizeModeChange;
- (void)invalidate;
- (void)prefetchResourcesWithPredicates:(id)a3 photoLibrary:(id)a4 prefetchPhase:(unint64_t)a5 completionHandler:(id)a6;
- (void)startAutomaticPrefetch;
- (void)stop;
@end

@implementation PLCloudResourcePrefetchManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchConfiguration, 0);
  objc_storeStrong((id *)&self->_lastCompletePrefetchDate, 0);
  objc_storeStrong((id *)&self->_initialSyncDate, 0);
  objc_storeStrong((id *)&self->_volumeInfo, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_lastCheckCPLBGDownloadDate, 0);
  objc_storeStrong((id *)&self->_inflightResources, 0);
  objc_destroyWeak((id *)&self->_pruneManager);
  objc_destroyWeak((id *)&self->_cplManager);
  objc_storeStrong((id *)&self->_lsm, 0);
}

- (id)_resourcesToPrefetchWithPrefetchPhase:(unint64_t)a3 photoLibrary:(id)a4 applyPerPrefetchLimit:(BOOL)a5 initialBudget:(int64_t *)a6
{
  id v10 = a4;
  int64_t v11 = [(PLCloudResourcePrefetchManager *)self _diskSpaceBudgetForPrefetchPhase:a3];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__81682;
  v28 = __Block_byref_object_dispose__81683;
  id v29 = 0;
  v12 = [(PLCloudResourcePrefetchManager *)self _lastCompletePrefetchDateInLibrary:v10];
  v13 = objc_opt_class();
  int64_t prefetchMode = self->_prefetchMode;
  int64_t prefetchOptimizeMode = self->_prefetchOptimizeMode;
  initialSyncDate = self->_initialSyncDate;
  BOOL isWalrusEnabled = self->_isWalrusEnabled;
  prefetchConfiguration = self->_prefetchConfiguration;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __121__PLCloudResourcePrefetchManager__resourcesToPrefetchWithPrefetchPhase_photoLibrary_applyPerPrefetchLimit_initialBudget___block_invoke;
  v23[3] = &unk_1E58702B8;
  v23[4] = &v24;
  LOBYTE(v22) = a5;
  LOBYTE(v21) = isWalrusEnabled;
  [v13 resourcesToPrefetchWithPrefetchPhase:a3 prefetchMode:prefetchMode prefetchOptimizeMode:prefetchOptimizeMode initialSyncDate:initialSyncDate lastCompletePrefetchDate:v12 initialBudget:v11 excludeDynamicCPLResources:v21 prefetchConfiguration:prefetchConfiguration photoLibrary:v10 applyPerPrefetchLimit:v22 completionHandler:v23];
  if (a6) {
    *a6 = v11;
  }
  id v19 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v19;
}

void __121__PLCloudResourcePrefetchManager__resourcesToPrefetchWithPrefetchPhase_photoLibrary_applyPerPrefetchLimit_initialBudget___block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)_prefetchIsEnabledForPhase:(unint64_t)a3
{
  v5 = objc_opt_class();
  int64_t prefetchMode = self->_prefetchMode;
  initialSyncDate = self->_initialSyncDate;
  return [v5 _prefetchIsEnabledForPhase:a3 givenMode:prefetchMode andInitialSyncDate:initialSyncDate];
}

- (void)_setLastCompletePrefetchDate:(id)a3 inLibrary:(id)a4
{
  v6 = (NSDate *)a3;
  workQueue = self->_workQueue;
  id v8 = a4;
  dispatch_assert_queue_V2(workQueue);
  v9 = [v8 globalValues];

  [v9 setLastCompletePrefetchDate:v6];
  lastCompletePrefetchDate = self->_lastCompletePrefetchDate;
  self->_lastCompletePrefetchDate = v6;
}

- (id)_lastCompletePrefetchDateInLibrary:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  lastCompletePrefetchDate = self->_lastCompletePrefetchDate;
  if (!lastCompletePrefetchDate)
  {
    v6 = [v4 globalValues];
    v7 = [v6 lastCompletePrefetchDate];
    id v8 = self->_lastCompletePrefetchDate;
    self->_lastCompletePrefetchDate = v7;

    lastCompletePrefetchDate = self->_lastCompletePrefetchDate;
  }
  v9 = lastCompletePrefetchDate;

  return v9;
}

- (int64_t)_prefetchOptimizeModeBasedOnLibrarySize
{
  v3 = +[PLPrefetchConfiguration overridePrefetchOptimizeMode];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 integerValue];
  }
  else
  {
    if (!self->_prefetchMode)
    {
      if (MEMORY[0x19F38BDA0]())
      {
        v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        uint64_t v7 = [v6 integerForKey:@"PLPrefetchMaximumSmallLibraryThresholdGB"];
      }
      else
      {
        uint64_t v7 = 0;
      }
      if ([(PLPrefetchConfiguration *)self->_prefetchConfiguration cloudResourceMaximumSmallLibraryThreshold] | v7)
      {
        id v10 = [(PLCloudResourcePrefetchManager *)self _volumeInfo];
        int64_t v8 = -[PLPrefetchConfiguration prefetchOptimizeModeForTotalSizeOfOriginalResources:totalSizeOfLocallyAvailableOriginalResources:availableSpace:overrideMaximumSmallLibraryThresholdGB:nonThumbnailsBudget:](self->_prefetchConfiguration, "prefetchOptimizeModeForTotalSizeOfOriginalResources:totalSizeOfLocallyAvailableOriginalResources:availableSpace:overrideMaximumSmallLibraryThresholdGB:nonThumbnailsBudget:", -[PLCloudResourcePrefetchManager _totalSizeOfOriginalResources](self, "_totalSizeOfOriginalResources"), -[PLCloudResourcePrefetchManager _totalSizeOfLocallyAvailableOriginalResources](self, "_totalSizeOfLocallyAvailableOriginalResources"), [v10 availableSpace], v7, -[PLCloudResourcePrefetchManager _diskSpaceBudgetForPrefetchPhase:prefetchOptimizeMode:](self, "_diskSpaceBudgetForPrefetchPhase:prefetchOptimizeMode:", 4, 2));

        goto LABEL_10;
      }
    }
    uint64_t v5 = +[PLPrefetchConfiguration defaultPrefetchOptimizeMode];
  }
  int64_t v8 = v5;
LABEL_10:

  return v8;
}

- (unint64_t)_smallLibrarySizeThresholdForTotalSizeOfLocallyAvailableOriginalResources:(int64_t)a3
{
  if (MEMORY[0x19F38BDA0](self, a2))
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v6 = [v5 integerForKey:@"PLPrefetchMaximumSmallLibraryThresholdGB"];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(PLCloudResourcePrefetchManager *)self _volumeInfo];
  unint64_t v8 = -[PLPrefetchConfiguration smallLibrarySizeThresholdForTotalSizeOfLocallyAvailableOriginalResources:availableSpace:overrideMaximumThresholdGB:](self->_prefetchConfiguration, "smallLibrarySizeThresholdForTotalSizeOfLocallyAvailableOriginalResources:availableSpace:overrideMaximumThresholdGB:", a3, [v7 availableSpace], v6);

  return v8;
}

- (int64_t)_totalSizeOfLocallyAvailableOriginalResources
{
  v3 = +[PLCloudResourcePrefetchPredicates predicateForOriginalResourcesForPrefetchLocallyAvailableOnly:1];
  int64_t v4 = [(PLCloudResourcePrefetchManager *)self _totalSizeOfOriginalResourcesForPrefetchWithPredicate:v3];

  return v4;
}

- (int64_t)_totalSizeOfOriginalResources
{
  v3 = +[PLCloudResourcePrefetchPredicates predicateForOriginalResourcesForPrefetchLocallyAvailableOnly:0];
  int64_t v4 = [(PLCloudResourcePrefetchManager *)self _totalSizeOfOriginalResourcesForPrefetchWithPredicate:v3];

  return v4;
}

- (int64_t)_totalSizeOfOriginalResourcesForPrefetchWithPredicate:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = -1;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v7 = +[PLInternalResource entityName];
  unint64_t v8 = [v6 fetchRequestWithEntityName:v7];

  [v8 setResultType:2];
  [v8 setPredicate:v5];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  id v10 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"dataLength"];
  [v9 setName:@"dataLength"];
  int64_t v11 = (void *)MEMORY[0x1E4F28C68];
  v31[0] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  v13 = [v11 expressionForFunction:@"sum:" arguments:v12];
  [v9 setExpression:v13];

  [v9 setExpressionResultType:300];
  id v30 = v9;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  [v8 setPropertiesToFetch:v14];

  v15 = [(PLLibraryServicesManager *)self->_lsm databaseContext];
  v16 = (void *)[v15 newShortLivedLibraryWithName:"-[PLCloudResourcePrefetchManager _totalSizeOfOriginalResourcesForPrefetchWithPredicate:]"];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __88__PLCloudResourcePrefetchManager__totalSizeOfOriginalResourcesForPrefetchWithPredicate___block_invoke;
  v21[3] = &unk_1E5873DC0;
  id v17 = v16;
  id v22 = v17;
  id v18 = v8;
  id v23 = v18;
  uint64_t v24 = &v26;
  SEL v25 = a2;
  [v17 performBlockAndWait:v21];
  int64_t v19 = v27[3];

  _Block_object_dispose(&v26, 8);
  return v19;
}

void __88__PLCloudResourcePrefetchManager__totalSizeOfOriginalResourcesForPrefetchWithPredicate___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = 0;
  int64_t v4 = [v2 executeFetchRequest:v3 error:&v9];
  id v5 = v9;

  if (!v4)
  {
    uint64_t v6 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      int64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "%@: failed to calculate total resource size: %@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  if ([v4 count] == 1)
  {
    uint64_t v6 = [v4 objectAtIndexedSubscript:0];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"dataLength"];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v7 longLongValue];

LABEL_6:
  }
}

- (int64_t)_diskSpaceBudgetForPrefetchPhase:(unint64_t)a3 prefetchOptimizeMode:(int64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v7 = [(PLCloudResourcePrefetchManager *)self _volumeInfo];
  uint64_t v8 = [v7 nearLowDiskThreshold];
  if (a3 > 6)
  {
    uint64_t v9 = 0;
    goto LABEL_5;
  }
  uint64_t v9 = v8;
  if (((1 << a3) & 0x6E) == 0)
  {
    if (!a3) {
      goto LABEL_5;
    }
    uint64_t v9 = 0x40000000;
    if (self->_prefetchMode != 1 && a4 != 2 && !self->_lastCompletePrefetchDate)
    {
      [(PLPrefetchConfiguration *)self->_prefetchConfiguration cloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio];
      uint64_t v9 = (uint64_t)(v15 * (double)(unint64_t)[v7 volumeSize]);
    }
  }
  id v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v11 = [v10 integerForKey:@"PLPrefetchMinimumFreeDiskGB"];

  if (v11 > 0) {
    uint64_t v9 = v11 << 30;
  }
LABEL_5:
  uint64_t v12 = [v7 availableSpace];
  int64_t v13 = (v12 - v9) & ~((v12 - v9) >> 63);

  return v13;
}

- (int64_t)_diskSpaceBudgetForPrefetchPhase:(unint64_t)a3
{
  return [(PLCloudResourcePrefetchManager *)self _diskSpaceBudgetForPrefetchPhase:a3 prefetchOptimizeMode:self->_prefetchOptimizeMode];
}

- (id)_volumeInfo
{
  volumeInfo = self->_volumeInfo;
  if (!volumeInfo)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F8BA18]);
    id v5 = [(PLLibraryServicesManager *)self->_lsm pathManager];
    uint64_t v6 = [v5 photoDirectoryWithType:1];
    uint64_t v7 = (PLVolumeInfo *)[v4 initWithPath:v6];
    uint64_t v8 = self->_volumeInfo;
    self->_volumeInfo = v7;

    volumeInfo = self->_volumeInfo;
  }
  return volumeInfo;
}

- (void)_handlePrefetchError:(id)a3 forPLCloudResourceWithObjectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 domain];
  if ([v8 isEqualToString:*MEMORY[0x1E4F59778]])
  {
    uint64_t v9 = [v6 code];

    if (v9 == 27)
    {
      id v10 = [(PLLibraryServicesManager *)self->_lsm databaseContext];
      uint64_t v11 = (void *)[v10 newShortLivedLibraryWithName:"-[PLCloudResourcePrefetchManager _handlePrefetchError:forPLCloudResourceWithObjectID:]"];

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __86__PLCloudResourcePrefetchManager__handlePrefetchError_forPLCloudResourceWithObjectID___block_invoke;
      v13[3] = &unk_1E5875E18;
      id v14 = v11;
      id v15 = v7;
      id v12 = v11;
      [v12 performTransactionAndWait:v13];
    }
  }
  else
  {
  }
}

void __86__PLCloudResourcePrefetchManager__handlePrefetchError_forPLCloudResourceWithObjectID___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = [v2 existingObjectWithID:*(void *)(a1 + 40) error:0];

  if (v3 && (int)[v3 remoteAvailability] >= 1)
  {
    id v4 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Setting %@ as unavailable", (uint8_t *)&v5, 0xCu);
    }

    [v3 setRemoteAvailability:0];
  }
}

- (void)_incrementPrefetchCountForPrefetchPhase:(unint64_t)a3 resources:(id)a4 photoLibrary:(id)a5
{
  id v8 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__PLCloudResourcePrefetchManager__incrementPrefetchCountForPrefetchPhase_resources_photoLibrary___block_invoke;
  v10[3] = &unk_1E5875E40;
  id v12 = self;
  unint64_t v13 = a3;
  id v11 = v8;
  id v9 = v8;
  [a5 performTransactionAndWait:v10];
}

void __97__PLCloudResourcePrefetchManager__incrementPrefetchCountForPrefetchPhase_resources_photoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
        unint64_t v8 = *(void *)(a1 + 48);
        if (v8 <= 6)
        {
          if (v8 == 2) {
            __int16 v9 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "cloudResourceMaxPrefetchRetry", (void)v12);
          }
          else {
            __int16 v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v6) cloudPrefetchCount];
          }
          objc_msgSend(v7, "setCloudPrefetchCount:", (__int16)(v9 + 1), (void)v12);
        }
        id v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", (void)v12);
        [v7 setCloudLastPrefetchDate:v10];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v11 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v4 = v11;
    }
    while (v11);
  }
}

- (void)_prefetchComputeSyncResources:(id)a3 photoLibrary:(id)a4 prefetchPhase:(unint64_t)a5 shouldAutoPrefetchNextBatch:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke;
  v29[3] = &unk_1E5870A08;
  id v13 = v10;
  id v30 = v13;
  id v14 = v12;
  id v31 = v14;
  v32 = self;
  unint64_t v34 = a5;
  id v15 = v11;
  id v33 = v15;
  [v15 performBlockAndWait:v29];
  v16 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudResourcePrefetchManager _prefetchComputeSyncResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:]"];
  uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
  id v18 = NSString;
  int64_t v19 = [(id)objc_opt_class() descriptionForPrefetchPhase:a5];
  v20 = [v18 stringWithFormat:@"start prefetching for phase: %@", v19];
  [(PLCloudResourcePrefetchManager *)self _enqueueCheckCPLBGDownloadFromNow:v17 withReason:v20];

  uint64_t v21 = [v14 allKeys];
  if ([v21 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cplManager);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2;
    v23[3] = &unk_1E5870268;
    v23[4] = self;
    id v24 = v16;
    unint64_t v27 = a5;
    id v25 = v14;
    id v26 = v21;
    BOOL v28 = a6;
    [WeakRetained fetchComputeStatesForRecordsWithScopedIdentifiers:v26 onDemand:0 completionHandler:v23];
  }
}

uint64_t __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
        unint64_t v8 = (void *)MEMORY[0x19F38D3B0](v3);
        __int16 v9 = objc_msgSend(v7, "scopedIdentifier", (void)v12);
        if (v9)
        {
          id v10 = [v7 objectID];
          [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v9];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }

  return [*(id *)(a1 + 48) _incrementPrefetchCountForPrefetchPhase:*(void *)(a1 + 64) resources:*(void *)(a1 + 32) photoLibrary:*(void *)(a1 + 56)];
}

void __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_3;
  v11[3] = &unk_1E58701C8;
  id v12 = v6;
  long long v13 = v7;
  uint64_t v17 = *(void *)(a1 + 64);
  id v14 = *(id *)(a1 + 48);
  id v15 = v5;
  id v16 = *(id *)(a1 + 56);
  char v18 = *(unsigned char *)(a1 + 72);
  id v9 = v5;
  id v10 = v6;
  [v7 _runOnWorkQueueWithTransaction:v8 block:v11];
}

void __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_3(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = [(id)objc_opt_class() descriptionForPrefetchPhase:*(void *)(a1 + 72)];
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = (uint64_t)v3;
      __int16 v27 = 2112;
      uint64_t v28 = v4;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "[CCSS] Failed to prefetch ComputeSync resources (phase: %@) error: %@", buf, 0x16u);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = [*(id *)(a1 + 48) allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(a1 + 40) _handlePrefetchError:*(void *)(a1 + 32) forPLCloudResourceWithObjectID:*(void *)(*((void *)&v20 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
  }
  id v10 = [*(id *)(*(void *)(a1 + 40) + 8) databaseContext];
  id v11 = (void *)[v10 newShortLivedComputeSyncApplyLibraryWithNameSuffix:"-[PLCloudResourcePrefetchManager _prefetchComputeSyncResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:]_block_invoke"];

  if ([*(id *)(a1 + 56) count])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2_242;
    v16[3] = &unk_1E5873A50;
    uint64_t v17 = *(id *)(a1 + 56);
    id v18 = *(id *)(a1 + 48);
    id v19 = v11;
    [v19 performTransactionAndWait:v16];

    id v12 = v17;
  }
  else
  {
    if (*MEMORY[0x1E4F59AC0]) {
      goto LABEL_18;
    }
    id v12 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [*(id *)(a1 + 64) count];
      *(_DWORD *)buf = 134217984;
      uint64_t v26 = v13;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "[CCSS] No compute sync resources returned in batch of size %lu", buf, 0xCu);
    }
  }

LABEL_18:
  if (*(unsigned char *)(a1 + 80))
  {
    id v14 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(id)objc_opt_class() descriptionForPrefetchPhase:*(void *)(a1 + 72)];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = (uint64_t)v15;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "No more compute sync resource downloads for phase: %{public}@, checking additional resources for prefetch", buf, 0xCu);
    }
    [*(id *)(a1 + 40) _startPrefetchNextBatch];
  }
}

void __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2_242(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_3_243;
  v3[3] = &unk_1E5870240;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_3_243(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  uint64_t v9 = [*(id *)(a1 + 40) managedObjectContext];
  id v10 = [v9 existingObjectWithID:v8 error:0];

  id v11 = +[PLManagedAsset assetWithScopedIdentifier:v7 inLibrary:*(void *)(a1 + 40) prefetchResources:0];

  id v12 = [v5 fileURL];

  uint64_t v13 = [v5 fileURL];
  id v14 = v13;
  if (v12 && v10)
  {
    id v15 = [v13 path];
    id v30 = 0;
    int v16 = [v11 copyComputeSyncResourceFromCPLFilePath:v15 error:&v30];
    uint64_t v17 = v30;

    if (v16)
    {
      [v11 updateComputeSyncResourceAfterDownloadWithResource:v10 onDemandDownload:0];
      id v29 = 0;
      int v18 = [v11 applyComputeSyncPayloadWithComputeStateRecord:v5 originatedFromPrefetch:1 error:&v29];
      id v19 = v29;
      if (v18)
      {
        if (!*MEMORY[0x1E4F59AC0])
        {
          long long v20 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            long long v21 = [v11 scopedIdentifier];
            *(_DWORD *)buf = 138412546;
            id v32 = v5;
            __int16 v33 = 2114;
            unint64_t v34 = v21;
            long long v22 = "[CCSS] Applied compute sync record %@ to asset %{public}@ using payload helper";
            long long v23 = v20;
            os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
            uint32_t v25 = 22;
LABEL_22:
            _os_log_impl(&dword_19B3C7000, v23, v24, v22, buf, v25);

            goto LABEL_23;
          }
          goto LABEL_23;
        }
      }
      else if (!*MEMORY[0x1E4F59AC0])
      {
        long long v20 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          long long v21 = [v11 scopedIdentifier];
          *(_DWORD *)buf = 138412802;
          id v32 = v5;
          __int16 v33 = 2114;
          unint64_t v34 = v21;
          __int16 v35 = 2112;
          v36 = v19;
          long long v22 = "[CCSS] Failed to apply compute sync record %@ to asset %{public}@ using payload helper error: %@";
          long long v23 = v20;
          os_log_type_t v24 = OS_LOG_TYPE_ERROR;
          uint32_t v25 = 32;
          goto LABEL_22;
        }
LABEL_23:
      }
LABEL_24:

      goto LABEL_25;
    }
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v19 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        long long v20 = [v11 scopedIdentifier];
        *(_DWORD *)buf = 138412802;
        id v32 = v5;
        __int16 v33 = 2114;
        unint64_t v34 = v20;
        __int16 v35 = 2112;
        v36 = v17;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "[CCSS] Failed to copy compute sync record %@ to asset %{public}@ using payload helper error: %@", buf, 0x20u);
        goto LABEL_23;
      }
      goto LABEL_24;
    }
LABEL_25:

    goto LABEL_26;
  }

  if (v14)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v17 = __CPLAssetsdOSLogDomain();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      id v19 = [v11 scopedIdentifier];
      *(_DWORD *)buf = 138412802;
      id v32 = v5;
      __int16 v33 = 2114;
      unint64_t v34 = v19;
      __int16 v35 = 2114;
      v36 = v8;
      uint64_t v26 = "[CCSS] No compute sync wrapper resource found %@ for asset: %{public}@, resource: %{public}@";
      __int16 v27 = v17;
      uint32_t v28 = 32;
LABEL_18:
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
      goto LABEL_24;
    }
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v17 = __CPLAssetsdOSLogDomain();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    id v19 = [v11 scopedIdentifier];
    *(_DWORD *)buf = 138412546;
    id v32 = v5;
    __int16 v33 = 2114;
    unint64_t v34 = v19;
    uint64_t v26 = "[CCSS] ComputeStateRecord contains nil fileURL unexpectedly %@ for asset %{public}@";
    __int16 v27 = v17;
    uint32_t v28 = 22;
    goto LABEL_18;
  }
LABEL_26:
}

- (void)_prefetchResources:(id)a3 photoLibrary:(id)a4 prefetchPhase:(unint64_t)a5 shouldAutoPrefetchNextBatch:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
  id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke;
  v30[3] = &unk_1E5870CA8;
  id v31 = v9;
  id v32 = self;
  id v33 = v11;
  id v13 = v12;
  id v35 = v10;
  unint64_t v36 = a5;
  id v34 = v13;
  id v14 = v10;
  id v15 = v11;
  id v16 = v9;
  [v14 performBlockAndWait:v30];
  uint64_t v17 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudResourcePrefetchManager _prefetchResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:]"];
  int v18 = [MEMORY[0x1E4F1C9C8] date];
  id v19 = NSString;
  long long v20 = [(id)objc_opt_class() descriptionForPrefetchPhase:a5];
  long long v21 = [v19 stringWithFormat:@"start prefetching for phase: %@", v20];
  [(PLCloudResourcePrefetchManager *)self _enqueueCheckCPLBGDownloadFromNow:v18 withReason:v21];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_231;
  v25[3] = &unk_1E5870218;
  v25[4] = self;
  id v26 = v17;
  id v27 = v13;
  unint64_t v28 = a5;
  BOOL v29 = a6;
  id v22 = v13;
  id v23 = v17;
  [v15 enumerateKeysAndObjectsUsingBlock:v25];
}

uint64_t __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) dataLength];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v29 count:16];
    }
    while (v4);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        id v13 = (void *)MEMORY[0x19F38D3B0]();
        id v14 = [v12 cplResourceIncludeFile:1];
        if (v14)
        {
          id v15 = [(id)objc_opt_class() _identifierForResourceDownload:v12];
          id v16 = [v12 objectID];
          [*(id *)(a1 + 48) setObject:v14 forKeyedSubscript:v15];
          [*(id *)(a1 + 56) setObject:v16 forKeyedSubscript:v15];
        }
        else
        {
          id v15 = PLResourceCachingGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v27 = v12;
            _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Unable to create CPLResource from %@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v9);
  }

  return [*(id *)(a1 + 40) _incrementPrefetchCountForPrefetchPhase:*(void *)(a1 + 72) resources:*(void *)(a1 + 32) photoLibrary:*(void *)(a1 + 64)];
}

void __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_231(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) _isInflightResourceIdentifier:v5])
  {
    id v7 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [(id)objc_opt_class() descriptionForPrefetchPhase:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138412802;
      id v31 = v6;
      __int16 v32 = 2112;
      id v33 = v5;
      __int16 v34 = 2112;
      id v35 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Skip prefetching %@ [%@] which is already inflight (phase: %@)", buf, 0x20u);
    }
  }
  else
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F59958]), "initWithIntent:priority:", objc_msgSend(*(id *)(a1 + 32), "_intentForPrefetchPhase:", *(void *)(a1 + 56)), 2);
    uint64_t v9 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [(id)objc_opt_class() descriptionForPrefetchPhase:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138413058;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v6;
      __int16 v34 = 2112;
      id v35 = v5;
      __int16 v36 = 2112;
      uint64_t v37 = v7;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Start prefetching (phase: %@) %@ [%@] %@", buf, 0x2Au);
    }
    [*(id *)(a1 + 32) _addInflightResourceIdentifier:v5 prefetchPhase:*(void *)(a1 + 56)];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_236;
    v25[3] = &unk_1E58701A0;
    id v12 = *(void **)(a1 + 40);
    v25[4] = *(void *)(a1 + 32);
    id v13 = v12;
    uint64_t v14 = *(void *)(a1 + 56);
    id v26 = v13;
    uint64_t v29 = v14;
    id v27 = v6;
    id v28 = v5;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_238;
    v18[3] = &unk_1E58701F0;
    id v15 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v16 = v15;
    uint64_t v17 = *(void *)(a1 + 56);
    id v19 = v16;
    uint64_t v23 = v17;
    id v20 = v27;
    id v21 = v28;
    id v22 = *(id *)(a1 + 48);
    char v24 = *(unsigned char *)(a1 + 64);
    [WeakRetained downloadResource:v20 options:v7 clientBundleID:@"com.apple.mobileslideshow" proposedTaskIdentifier:0 taskDidBeginHandler:v25 progressBlock:0 completionHandler:v18];
  }
}

void __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_236(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2;
  v9[3] = &unk_1E5870A08;
  id v10 = v5;
  id v11 = v6;
  uint64_t v14 = *(void *)(a1 + 64);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v8 = v5;
  [v6 _runOnWorkQueueWithTransaction:v7 block:v9];
}

void __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2_239;
  v10[3] = &unk_1E58701C8;
  id v11 = v6;
  id v12 = v7;
  uint64_t v16 = *(void *)(a1 + 72);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  char v17 = *(unsigned char *)(a1 + 80);
  id v9 = v6;
  [v7 _runOnWorkQueueWithTransaction:v8 block:v10];
}

void __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2_239(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = [(id)objc_opt_class() descriptionForPrefetchPhase:*(void *)(a1 + 72)];
      uint64_t v4 = *(void *)(a1 + 48);
      uint64_t v5 = *(void *)(a1 + 56);
      id v6 = *(void **)(a1 + 32);
      int v15 = 138413058;
      uint64_t v16 = v3;
      __int16 v17 = 2112;
      uint64_t v18 = v4;
      __int16 v19 = 2112;
      uint64_t v20 = v5;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Failed to prefetch (phase: %@) %@ [%@]: %@", (uint8_t *)&v15, 0x2Au);
    }
    uint64_t v7 = [*(id *)(a1 + 64) objectForKeyedSubscript:*(void *)(a1 + 56)];
    [*(id *)(a1 + 40) _handlePrefetchError:*(void *)(a1 + 32) forPLCloudResourceWithObjectID:v7];
  }
  [*(id *)(a1 + 40) _removeInflightResourceIdentifier:*(void *)(a1 + 56) prefetchPhase:*(void *)(a1 + 72)];
  uint64_t v8 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v11 = [*(id *)(a1 + 40) _countOfInflightResourcesForPrefetchPhase:*(void *)(a1 + 72)];
    id v12 = [(id)objc_opt_class() descriptionForPrefetchPhase:*(void *)(a1 + 72)];
    int v15 = 138413058;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Removing %@ [%@] from %ld inflight prefetched resources (phase: %@).", (uint8_t *)&v15, 0x2Au);
  }
  if (*(unsigned char *)(a1 + 80))
  {
    if ([*(id *)(a1 + 40) _countOfInflightResourcesForPrefetchPhase:*(void *)(a1 + 72)])
    {
      [*(id *)(a1 + 40) _checkCPLBackgroundDownloadOperations];
    }
    else
    {
      id v13 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(id)objc_opt_class() descriptionForPrefetchPhase:*(void *)(a1 + 72)];
        int v15 = 138412290;
        uint64_t v16 = v14;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "No more inflight resource downloads for phase: %@, checking additional resources for prefetch", (uint8_t *)&v15, 0xCu);
      }
      [*(id *)(a1 + 40) _startPrefetchNextBatch];
    }
  }
}

void __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = PLResourceCachingGetLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [(id)objc_opt_class() descriptionForPrefetchPhase:*(void *)(a1 + 64)];
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 56);
      uint64_t v8 = *(void *)(a1 + 32);
      int v12 = 138413058;
      id v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Failed to start prefetching (phase: %@) %@ [%@]: %@", (uint8_t *)&v12, 0x2Au);
    }
    [*(id *)(a1 + 40) _removeInflightResourceIdentifier:*(void *)(a1 + 56) prefetchPhase:*(void *)(a1 + 64)];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void **)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      uint64_t v11 = [*(id *)(a1 + 40) _countOfInflightResourcesForPrefetchPhase:*(void *)(a1 + 64)];
      int v12 = 138412802;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = v11;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Adding %@ [%@] to %ld inflight prefetched resources", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (unint64_t)_intentForPrefetchPhase:(unint64_t)a3
{
  if (self->_prefetchMode == 1) {
    return 2;
  }
  unint64_t result = 3;
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
      if (self->_prefetchOptimizeMode == 2) {
        unint64_t result = 5;
      }
      else {
        unint64_t result = 1;
      }
      break;
    case 1uLL:
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLCloudResourcePrefetchManager.m", 762, @"%s should not be invoked for compute sync prefetch phase", "-[PLCloudResourcePrefetchManager _intentForPrefetchPhase:]");

      goto LABEL_8;
    case 2uLL:
      return result;
    case 3uLL:
      unint64_t result = 6;
      break;
    default:
LABEL_8:
      unint64_t result = 0;
      break;
  }
  return result;
}

- (void)_startPrefetchNextBatch
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [(PLLibraryServicesManager *)self->_lsm databaseContext];
  uint64_t v4 = (void *)[v3 newShortLivedLibraryWithName:"-[PLCloudResourcePrefetchManager _startPrefetchNextBatch]"];

  if ([(PLCloudResourcePrefetchManager *)self _canPrefetchInLibrary:v4])
  {
    uint64_t v36 = 0;
    uint64_t v5 = [(PLCloudResourcePrefetchManager *)self _resourcesToPrefetchWithPrefetchPhase:0 photoLibrary:v4 applyPerPrefetchLimit:1 initialBudget:&v36];
    if ([v5 count])
    {
      uint64_t v6 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [v5 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v38 = v7;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch of %lu thumbnail resources", buf, 0xCu);
      }

      [(PLCloudResourcePrefetchManager *)self _prefetchResources:v5 photoLibrary:v4 prefetchPhase:0 shouldAutoPrefetchNextBatch:1];
    }
    else
    {
      uint64_t v35 = 0;
      uint64_t v8 = [(PLCloudResourcePrefetchManager *)self _resourcesToPrefetchWithPrefetchPhase:1 photoLibrary:v4 applyPerPrefetchLimit:1 initialBudget:&v35];
      if ([v8 count])
      {
        uint64_t v9 = PLResourceCachingGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v38 = v10;
          _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch of %lu compute-sync resources", buf, 0xCu);
        }

        [(PLCloudResourcePrefetchManager *)self _prefetchComputeSyncResources:v8 photoLibrary:v4 prefetchPhase:1 shouldAutoPrefetchNextBatch:1];
      }
      else if (![(PLCloudResourcePrefetchManager *)self _countOfInflightResourcesForPrefetchPhase:0])
      {
        uint64_t v33 = 0;
        uint64_t v34 = 0;
        uint64_t v31 = 0;
        uint64_t v32 = 0;
        uint64_t v30 = 0;
        uint64_t v11 = [(PLCloudResourcePrefetchManager *)self _resourcesToPrefetchWithPrefetchPhase:2 photoLibrary:v4 applyPerPrefetchLimit:1 initialBudget:&v34];
        int v12 = [(PLCloudResourcePrefetchManager *)self _resourcesToPrefetchWithPrefetchPhase:3 photoLibrary:v4 applyPerPrefetchLimit:1 initialBudget:&v33];
        id v13 = [(PLCloudResourcePrefetchManager *)self _resourcesToPrefetchWithPrefetchPhase:4 photoLibrary:v4 applyPerPrefetchLimit:1 initialBudget:&v32];
        __int16 v14 = [(PLCloudResourcePrefetchManager *)self _resourcesToPrefetchWithPrefetchPhase:5 photoLibrary:v4 applyPerPrefetchLimit:1 initialBudget:&v31];
        uint64_t v15 = [(PLCloudResourcePrefetchManager *)self _resourcesToPrefetchWithPrefetchPhase:6 photoLibrary:v4 applyPerPrefetchLimit:1 initialBudget:&v30];
        dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
        uint64_t v29 = v11;
        uint64_t v16 = [v11 count];
        BOOL v17 = v16 == 0;
        if (v16
          && ![(PLCloudResourcePrefetchManager *)self _countOfInflightResourcesForPrefetchPhase:2])
        {
          __int16 v18 = PLResourceCachingGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = [v29 count];
            *(_DWORD *)buf = 134217984;
            uint64_t v38 = v19;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch of %lu memories resources", buf, 0xCu);
          }

          [(PLCloudResourcePrefetchManager *)self _prefetchResources:v29 photoLibrary:v4 prefetchPhase:2 shouldAutoPrefetchNextBatch:1];
        }
        if ([v12 count])
        {
          if (![(PLCloudResourcePrefetchManager *)self _countOfInflightResourcesForPrefetchPhase:3])
          {
            uint64_t v20 = PLResourceCachingGetLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v21 = [v12 count];
              *(_DWORD *)buf = 134217984;
              uint64_t v38 = v21;
              _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch of %lu widget resources", buf, 0xCu);
            }

            [(PLCloudResourcePrefetchManager *)self _prefetchResources:v12 photoLibrary:v4 prefetchPhase:3 shouldAutoPrefetchNextBatch:1];
          }
          BOOL v17 = 0;
        }
        if ([v13 count])
        {
          if (![(PLCloudResourcePrefetchManager *)self _countOfInflightResourcesForPrefetchPhase:4])
          {
            id v22 = PLResourceCachingGetLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v23 = [v13 count];
              *(_DWORD *)buf = 134217984;
              uint64_t v38 = v23;
              _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch of %lu non-thumbnail resources", buf, 0xCu);
            }

            [(PLCloudResourcePrefetchManager *)self _prefetchResources:v13 photoLibrary:v4 prefetchPhase:4 shouldAutoPrefetchNextBatch:1];
          }
          BOOL v17 = 0;
        }
        if ([v14 count])
        {
          if (![(PLCloudResourcePrefetchManager *)self _countOfInflightResourcesForPrefetchPhase:5])
          {
            char v24 = PLResourceCachingGetLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v25 = [v14 count];
              *(_DWORD *)buf = 134217984;
              uint64_t v38 = v25;
              _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch of %lu media-metadata-overflow resources", buf, 0xCu);
            }

            [(PLCloudResourcePrefetchManager *)self _prefetchResources:v14 photoLibrary:v4 prefetchPhase:5 shouldAutoPrefetchNextBatch:1];
          }
          BOOL v17 = 0;
        }
        if ([v15 count])
        {
          if (![(PLCloudResourcePrefetchManager *)self _countOfInflightResourcesForPrefetchPhase:5])
          {
            id v26 = PLResourceCachingGetLog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v27 = [v15 count];
              *(_DWORD *)buf = 134217984;
              uint64_t v38 = v27;
              _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch of %lu adjusted-media-metadata-overflow resources", buf, 0xCu);
            }

            [(PLCloudResourcePrefetchManager *)self _prefetchResources:v15 photoLibrary:v4 prefetchPhase:6 shouldAutoPrefetchNextBatch:1];
          }
        }
        else if (v17)
        {
          id v28 = PLResourceCachingGetLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "No more resources for prefetching", buf, 2u);
          }

          [(PLCloudResourcePrefetchManager *)self _writeDownloadFinishedMarkerIfNeededWithLibrary:v4];
        }
      }
    }
  }
}

- (void)clearPrefetchState
{
  uint64_t v3 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Clearing prefetch state", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudResourcePrefetchManager clearPrefetchState]"];
  uint64_t v5 = [(PLLibraryServicesManager *)self->_lsm databaseContext];
  uint64_t v6 = (void *)[v5 newShortLivedLibraryWithName:"-[PLCloudResourcePrefetchManager clearPrefetchState]"];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__PLCloudResourcePrefetchManager_clearPrefetchState__block_invoke;
  v9[3] = &unk_1E5873A50;
  id v10 = v6;
  uint64_t v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v6;
  [(PLCloudResourcePrefetchManager *)self _runOnWorkQueueWithTransaction:v7 block:v9];
}

void __52__PLCloudResourcePrefetchManager_clearPrefetchState__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__PLCloudResourcePrefetchManager_clearPrefetchState__block_invoke_2;
  v9[3] = &unk_1E5875E18;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v4;
  [v3 performTransactionAndWait:v9];
  uint64_t v5 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Deleting cpl_download_finished_marker", v8, 2u);
  }

  uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 8) libraryBundle];
  id v7 = [v6 indicatorFileCoordinator];

  [v7 deleteCPLDownloadFinishedMarkerFilePath];
  [*(id *)(a1 + 48) stillAlive];
}

uint64_t __52__PLCloudResourcePrefetchManager_clearPrefetchState__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Resetting cloud resources state", v5, 2u);
  }

  id v3 = [*(id *)(a1 + 32) managedObjectContext];
  +[PLInternalResource resetCloudResourcesStateForCloudInManagedObjectContext:v3 hardReset:0];

  return [*(id *)(a1 + 40) _setLastCompletePrefetchDate:0 inLibrary:*(void *)(a1 + 32)];
}

- (void)_writeDownloadFinishedMarkerIfNeededWithLibrary:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  if (self->_lastCompletePrefetchDate)
  {
    [(PLCloudResourcePrefetchManager *)self _setLastCompletePrefetchDate:v5 inLibrary:v4];
  }
  else if (self->_initialSyncDate)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v6 setDateFormat:@"yyyy-MM-dd HH.mm.ss.SSS"];
    id v7 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
    [v6 setLocale:v7];

    id v8 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Writing out cpl_download_finished_marker", (uint8_t *)&v13, 2u);
    }

    uint64_t v9 = [v6 stringFromDate:v5];
    id v10 = [(PLLibraryServicesManager *)self->_lsm pathManager];
    uint64_t v11 = [v10 cplDownloadFinishedMarkerFilePath];
    [v9 writeToFile:v11 atomically:1 encoding:4 error:0];

    [(PLCloudResourcePrefetchManager *)self _setLastCompletePrefetchDate:v5 inLibrary:v4];
  }
  else
  {
    id v12 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      __int16 v14 = v5;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "No initial sync date at %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (BOOL)_canPrefetchInLibrary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLCloudResourcePrefetchManager *)self _isPrefetchDisabled])
  {
    uint64_t v5 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      uint64_t v21 = @"PLPrefetchDisabled";
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Prefetch disabled because %@ user default is set", (uint8_t *)&v20, 0xCu);
    }
    goto LABEL_18;
  }
  id v6 = [(PLLibraryServicesManager *)self->_lsm libraryBundle];
  uint64_t v5 = [v6 indicatorFileCoordinator];

  if (![v5 isICloudPhotosPaused])
  {
    int v13 = [v4 thumbnailManager];
    int v14 = [v13 isRebuildingThumbnails];

    if (v14)
    {
      id v7 = PLResourceCachingGetLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      LOWORD(v20) = 0;
      id v10 = "Thumbnail rebuilding in progress, stops prefetching";
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_cplManager);
      uint64_t v16 = [WeakRetained currentResetSyncType];

      if (v16)
      {
        id v7 = PLResourceCachingGetLog();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        LOWORD(v20) = 0;
        id v10 = "In reset sync, stops prefetching";
      }
      else
      {
        uint64_t v19 = [(PLCloudResourcePrefetchManager *)self _volumeInfo];

        if (v19)
        {
          BOOL v17 = 1;
          goto LABEL_19;
        }
        id v7 = PLResourceCachingGetLog();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        LOWORD(v20) = 0;
        id v10 = "Cannot access volume info, stops prefetching";
      }
    }
    uint64_t v11 = v7;
    uint32_t v12 = 2;
LABEL_16:
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v20, v12);
    goto LABEL_17;
  }
  id v7 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v5 isUserPause];
    uint64_t v9 = &stru_1EEB2EB80;
    if (v8) {
      uint64_t v9 = @"(user)";
    }
    int v20 = 138412290;
    uint64_t v21 = v9;
    id v10 = "CloudPhotos is paused %@, stops prefetching";
    uint64_t v11 = v7;
    uint32_t v12 = 12;
    goto LABEL_16;
  }
LABEL_17:

LABEL_18:
  BOOL v17 = 0;
LABEL_19:

  return v17;
}

- (BOOL)_isPrefetchDisabled
{
  int v2 = MEMORY[0x19F38BDA0](self, a2);
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v4 = [v3 BOOLForKey:@"PLPrefetchDisabled"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (void)_removeAllInflightResourceIdentifiers
{
}

uint64_t __71__PLCloudResourcePrefetchManager__removeAllInflightResourceIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeAllObjects];
}

- (void)_removeInflightResourceIdentifier:(id)a3 prefetchPhase:(unint64_t)a4
{
  inflightResources = self->_inflightResources;
  id v6 = NSNumber;
  id v7 = a3;
  id v9 = [v6 numberWithUnsignedInteger:a4];
  int v8 = [(NSDictionary *)inflightResources objectForKeyedSubscript:v9];
  [v8 removeObject:v7];
}

- (void)_addInflightResourceIdentifier:(id)a3 prefetchPhase:(unint64_t)a4
{
  inflightResources = self->_inflightResources;
  id v6 = NSNumber;
  id v7 = a3;
  id v9 = [v6 numberWithUnsignedInteger:a4];
  int v8 = [(NSDictionary *)inflightResources objectForKeyedSubscript:v9];
  [v8 addObject:v7];
}

- (BOOL)_isInflightResourceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint32_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  inflightResources = self->_inflightResources;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PLCloudResourcePrefetchManager__isInflightResourceIdentifier___block_invoke;
  v8[3] = &unk_1E5870158;
  id v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [(NSDictionary *)inflightResources enumerateKeysAndObjectsUsingBlock:v8];
  LOBYTE(inflightResources) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)inflightResources;
}

uint64_t __64__PLCloudResourcePrefetchManager__isInflightResourceIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 containsObject:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (id)_inflightResourceIdentifiersForPrefetchPhase:(unint64_t)a3
{
  inflightResources = self->_inflightResources;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v5 = [(NSDictionary *)inflightResources objectForKeyedSubscript:v4];

  return v5;
}

- (id)_allInflightResourceIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  inflightResources = self->_inflightResources;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__PLCloudResourcePrefetchManager__allInflightResourceIdentifiers__block_invoke;
  v7[3] = &unk_1E5870130;
  id v5 = v3;
  id v8 = v5;
  [(NSDictionary *)inflightResources enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

uint64_t __65__PLCloudResourcePrefetchManager__allInflightResourceIdentifiers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:");
}

- (unint64_t)_countOfInflightResourcesForPrefetchPhase:(unint64_t)a3
{
  inflightResources = self->_inflightResources;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSDictionary *)inflightResources objectForKeyedSubscript:v4];
  unint64_t v6 = [v5 count];

  return v6;
}

- (unint64_t)_countOfAllInflightResources
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  inflightResources = self->_inflightResources;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__PLCloudResourcePrefetchManager__countOfAllInflightResources__block_invoke;
  v5[3] = &unk_1E5870108;
  v5[4] = &v6;
  [(NSDictionary *)inflightResources enumerateKeysAndObjectsUsingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__PLCloudResourcePrefetchManager__countOfAllInflightResources__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)_runOnWorkQueueWithTransaction:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v7;
  id v6 = v8;
  pl_dispatch_async();
}

uint64_t __71__PLCloudResourcePrefetchManager__runOnWorkQueueWithTransaction_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int v2 = *(void **)(a1 + 32);
  return [v2 stillAlive];
}

- (void)prefetchResourcesWithPredicates:(id)a3 photoLibrary:(id)a4 prefetchPhase:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v20 = a4;
  id v16 = a6;
  id v10 = dispatch_group_create();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    uint64_t v18 = *(void *)v32;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * v12);
        dispatch_group_enter(v10);
        char v14 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudResourcePrefetchManager prefetchResourcesWithPredicates:photoLibrary:prefetchPhase:completionHandler:]"];
        v29[0] = 0;
        v29[1] = v29;
        v29[2] = 0x3032000000;
        v29[3] = __Block_byref_object_copy__81682;
        void v29[4] = __Block_byref_object_dispose__81683;
        id v30 = 0;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __111__PLCloudResourcePrefetchManager_prefetchResourcesWithPredicates_photoLibrary_prefetchPhase_completionHandler___block_invoke;
        v26[3] = &unk_1E5875368;
        id v28 = v29;
        v26[4] = self;
        v26[5] = v13;
        id v15 = v20;
        id v27 = v15;
        [v15 performBlockAndWait:v26];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __111__PLCloudResourcePrefetchManager_prefetchResourcesWithPredicates_photoLibrary_prefetchPhase_completionHandler___block_invoke_2;
        v21[3] = &unk_1E58743C0;
        void v21[4] = self;
        char v24 = v29;
        id v22 = v15;
        unint64_t v25 = a5;
        uint64_t v23 = v10;
        [(PLCloudResourcePrefetchManager *)self _runOnWorkQueueWithTransaction:v14 block:v21];

        _Block_object_dispose(v29, 8);
        ++v12;
      }
      while (v11 != v12);
      uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }
}

void __111__PLCloudResourcePrefetchManager_prefetchResourcesWithPredicates_photoLibrary_prefetchPhase_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) managedObjectContext];
  uint64_t v4 = [v2 _resourcesWithPredicate:v3 limit:0xFFFFFFFFLL context:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __111__PLCloudResourcePrefetchManager_prefetchResourcesWithPredicates_photoLibrary_prefetchPhase_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _prefetchResources:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) photoLibrary:*(void *)(a1 + 40) prefetchPhase:*(void *)(a1 + 64) shouldAutoPrefetchNextBatch:0];
  int v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

- (id)_prefetchStatusForDebug:(BOOL)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v5 = [(PLLibraryServicesManager *)self->_lsm databaseContext];
  id v6 = (void *)[v5 newShortLivedLibraryWithName:"-[PLCloudResourcePrefetchManager _prefetchStatusForDebug:]"];

  id v7 = [v6 libraryBundle];
  id v8 = [v7 indicatorFileCoordinator];

  if ([v8 isICloudPhotosPaused])
  {
    [v4 appendFormat:@"iCPL Paused"];
    if ([v8 isUserPause]) {
      [v4 appendFormat:@" (user)"];
    }
    [v4 appendFormat:@"\n"];
  }
  long long v33 = v8;
  id v9 = [v6 thumbnailManager];
  int v10 = [v9 isRebuildingThumbnails];

  if (v10) {
    [v4 appendFormat:@"Rebuilding thumbnails\n"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cplManager);
  uint64_t v12 = [WeakRetained currentResetSyncType];

  if (v12) {
    [v4 appendFormat:@"In reset sync\n"];
  }
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  uint64_t v53 = 0;
  id v30 = [(PLCloudResourcePrefetchManager *)self _resourcesToPrefetchWithPrefetchPhase:0 photoLibrary:v6 applyPerPrefetchLimit:0 initialBudget:&v59];
  uint64_t v13 = [(PLCloudResourcePrefetchManager *)self _resourcesToPrefetchWithPrefetchPhase:2 photoLibrary:v6 applyPerPrefetchLimit:0 initialBudget:&v58];
  char v14 = [(PLCloudResourcePrefetchManager *)self _resourcesToPrefetchWithPrefetchPhase:3 photoLibrary:v6 applyPerPrefetchLimit:0 initialBudget:&v57];
  id v15 = [(PLCloudResourcePrefetchManager *)self _resourcesToPrefetchWithPrefetchPhase:4 photoLibrary:v6 applyPerPrefetchLimit:0 initialBudget:&v56];
  id v16 = [(PLCloudResourcePrefetchManager *)self _resourcesToPrefetchWithPrefetchPhase:1 photoLibrary:v6 applyPerPrefetchLimit:0 initialBudget:&v55];
  BOOL v17 = [(PLCloudResourcePrefetchManager *)self _resourcesToPrefetchWithPrefetchPhase:5 photoLibrary:v6 applyPerPrefetchLimit:0 initialBudget:&v54];
  uint64_t v18 = [(PLCloudResourcePrefetchManager *)self _resourcesToPrefetchWithPrefetchPhase:6 photoLibrary:v6 applyPerPrefetchLimit:0 initialBudget:&v53];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __58__PLCloudResourcePrefetchManager__prefetchStatusForDebug___block_invoke;
  v34[3] = &unk_1E58700E0;
  id v19 = v4;
  uint64_t v45 = v59;
  uint64_t v46 = v58;
  uint64_t v47 = v57;
  uint64_t v48 = v56;
  uint64_t v49 = v55;
  uint64_t v50 = v54;
  uint64_t v51 = v53;
  id v35 = v19;
  uint64_t v36 = self;
  id v37 = v6;
  id v38 = v30;
  BOOL v52 = a3;
  id v39 = v13;
  id v40 = v14;
  id v41 = v15;
  id v42 = v16;
  id v43 = v17;
  v44 = v18;
  id v32 = v18;
  id v29 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v30;
  id v25 = v6;
  [v25 performBlockAndWait:v34];
  id v26 = v44;
  id v27 = v19;

  return v27;
}

void __58__PLCloudResourcePrefetchManager__prefetchStatusForDebug___block_invoke(uint64_t a1)
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = [MEMORY[0x1E4F28B68] stringFromByteCount:*(void *)(a1 + 112) countStyle:3];
  id v4 = [MEMORY[0x1E4F28B68] stringFromByteCount:*(void *)(a1 + 120) countStyle:3];
  uint64_t v5 = [MEMORY[0x1E4F28B68] stringFromByteCount:*(void *)(a1 + 128) countStyle:3];
  id v6 = [MEMORY[0x1E4F28B68] stringFromByteCount:*(void *)(a1 + 136) countStyle:3];
  id v7 = [MEMORY[0x1E4F28B68] stringFromByteCount:*(void *)(a1 + 144) countStyle:3];
  id v8 = [MEMORY[0x1E4F28B68] stringFromByteCount:*(void *)(a1 + 152) countStyle:3];
  id v9 = [MEMORY[0x1E4F28B68] stringFromByteCount:*(void *)(a1 + 160) countStyle:3];
  int v10 = [*(id *)(a1 + 40) _lastCompletePrefetchDateInLibrary:*(void *)(a1 + 48)];
  uint64_t v11 = @"(Incremental)";
  if (!v10) {
    uint64_t v11 = @"(Initial)";
  }
  [v2 appendFormat:@"Disk space budget: Thumbnails: %@ Memories: %@ Widget: %@ Non-Thumbnails: %@ ComputeSync: %@ MediaMetadataOverflow: %@ FullSizeResourceMediaMetadataOverflow: %@ %@\n", v3, v4, v5, v6, v7, v8, v9, v11];

  if ([*(id *)(a1 + 40) _isPrefetchDisabled]) {
    [*(id *)(a1 + 32) appendFormat:@"Prefetch disabled\n"];
  }
  uint64_t v12 = *(void **)(a1 + 40);
  uint64_t v13 = v12[5];
  if (v13 >= 2)
  {
    char v14 = *(void **)(a1 + 32);
    id v15 = [(id)objc_opt_class() descriptionForPrefetchMode:*(void *)(*(void *)(a1 + 40) + 40)];
    [v14 appendFormat:@"Prefetch Mode: %@\n", v15];

    uint64_t v12 = *(void **)(a1 + 40);
    uint64_t v13 = v12[5];
  }
  if (!v13)
  {
    uint64_t v16 = [v12 _totalSizeOfOriginalResources];
    uint64_t v17 = [*(id *)(a1 + 40) _totalSizeOfLocallyAvailableOriginalResources];
    uint64_t v18 = [*(id *)(a1 + 40) _smallLibrarySizeThresholdForTotalSizeOfLocallyAvailableOriginalResources:v17];
    id v19 = *(void **)(a1 + 32);
    id v20 = +[PLPrefetchConfiguration descriptionForPrefetchOptimizeMode:*(void *)(*(void *)(a1 + 40) + 48)];
    id v21 = [MEMORY[0x1E4F28B68] stringFromByteCount:v16 countStyle:3];
    id v22 = [MEMORY[0x1E4F28B68] stringFromByteCount:v17 countStyle:3];
    id v23 = [MEMORY[0x1E4F28B68] stringFromByteCount:v18 countStyle:3];
    [v19 appendFormat:@"Prefetch Optimize Mode (non-thumbnail): %@ (original resources: %@, local original resources: %@ small-library threshold: %@)\n", v20, v21, v22, v23];

    id v24 = *(void **)(a1 + 32);
    id v25 = +[PLPrefetchConfiguration descriptionForPrefetchOptimizeMode:](PLPrefetchConfiguration, "descriptionForPrefetchOptimizeMode:", +[PLPrefetchConfiguration defaultPrefetchOptimizeMode]);
    [v24 appendFormat:@"Prefetch Optimize Mode (memories/widget): %@\n", v25];

    uint64_t v12 = *(void **)(a1 + 40);
  }
  if ([v12 _prefetchIsEnabledForPhase:0])
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"Will prefetch %ld thumbnail resources:\n", objc_msgSend(*(id *)(a1 + 56), "count"));
    if (*(unsigned char *)(a1 + 168))
    {
      if ([*(id *)(a1 + 56) count])
      {
        long long v148 = 0u;
        long long v149 = 0u;
        long long v146 = 0u;
        long long v147 = 0u;
        obuint64_t j = *(id *)(a1 + 56);
        uint64_t v26 = [obj countByEnumeratingWithState:&v146 objects:v157 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v111 = *(void *)v147;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v147 != v111) {
                objc_enumerationMutation(obj);
              }
              id v29 = *(void **)(*((void *)&v146 + 1) + 8 * i);
              id v30 = *(void **)(a1 + 32);
              long long v31 = [v29 asset];
              id v32 = [v31 uuid];
              long long v33 = +[PLPrefetchResourceIdentifier resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:](PLPrefetchResourceIdentifier, "resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:", v32, [v29 version], objc_msgSend(v29, "cplType"), objc_msgSend(v29, "recipeID"));
              [v30 appendFormat:@"  %@\n", v33];
            }
            uint64_t v27 = [obj countByEnumeratingWithState:&v146 objects:v157 count:16];
          }
          while (v27);
        }
      }
    }
  }
  if ([*(id *)(a1 + 40) _prefetchIsEnabledForPhase:2])
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"Will prefetch %ld memories resources:\n", objc_msgSend(*(id *)(a1 + 64), "count"));
    if (*(unsigned char *)(a1 + 168))
    {
      if ([*(id *)(a1 + 64) count])
      {
        long long v144 = 0u;
        long long v145 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        id obja = *(id *)(a1 + 64);
        uint64_t v34 = [obja countByEnumeratingWithState:&v142 objects:v156 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v112 = *(void *)v143;
          do
          {
            for (uint64_t j = 0; j != v35; ++j)
            {
              if (*(void *)v143 != v112) {
                objc_enumerationMutation(obja);
              }
              id v37 = *(void **)(*((void *)&v142 + 1) + 8 * j);
              id v38 = *(void **)(a1 + 32);
              id v39 = [v37 asset];
              id v40 = [v39 uuid];
              id v41 = +[PLPrefetchResourceIdentifier resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:](PLPrefetchResourceIdentifier, "resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:", v40, [v37 version], objc_msgSend(v37, "cplType"), objc_msgSend(v37, "recipeID"));
              [v38 appendFormat:@"  %@\n", v41];
            }
            uint64_t v35 = [obja countByEnumeratingWithState:&v142 objects:v156 count:16];
          }
          while (v35);
        }
      }
    }
  }
  if ([*(id *)(a1 + 40) _prefetchIsEnabledForPhase:3])
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"Will prefetch %ld widget resources:\n", objc_msgSend(*(id *)(a1 + 72), "count"));
    if (*(unsigned char *)(a1 + 168))
    {
      if ([*(id *)(a1 + 72) count])
      {
        long long v140 = 0u;
        long long v141 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        id objb = *(id *)(a1 + 72);
        uint64_t v42 = [objb countByEnumeratingWithState:&v138 objects:v155 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v113 = *(void *)v139;
          do
          {
            for (uint64_t k = 0; k != v43; ++k)
            {
              if (*(void *)v139 != v113) {
                objc_enumerationMutation(objb);
              }
              uint64_t v45 = *(void **)(*((void *)&v138 + 1) + 8 * k);
              uint64_t v46 = *(void **)(a1 + 32);
              uint64_t v47 = [v45 asset];
              uint64_t v48 = [v47 uuid];
              uint64_t v49 = +[PLPrefetchResourceIdentifier resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:](PLPrefetchResourceIdentifier, "resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:", v48, [v45 version], objc_msgSend(v45, "cplType"), objc_msgSend(v45, "recipeID"));
              [v46 appendFormat:@"  %@\n", v49];
            }
            uint64_t v43 = [objb countByEnumeratingWithState:&v138 objects:v155 count:16];
          }
          while (v43);
        }
      }
    }
  }
  if ([*(id *)(a1 + 40) _prefetchIsEnabledForPhase:4])
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"Will prefetch %ld non-thumbnail resources:\n", objc_msgSend(*(id *)(a1 + 80), "count"));
    if (*(unsigned char *)(a1 + 168))
    {
      if ([*(id *)(a1 + 80) count])
      {
        long long v136 = 0u;
        long long v137 = 0u;
        long long v134 = 0u;
        long long v135 = 0u;
        id objc = *(id *)(a1 + 80);
        uint64_t v50 = [objc countByEnumeratingWithState:&v134 objects:v154 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v114 = *(void *)v135;
          do
          {
            for (uint64_t m = 0; m != v51; ++m)
            {
              if (*(void *)v135 != v114) {
                objc_enumerationMutation(objc);
              }
              uint64_t v53 = *(void **)(*((void *)&v134 + 1) + 8 * m);
              uint64_t v54 = *(void **)(a1 + 32);
              uint64_t v55 = [v53 asset];
              uint64_t v56 = [v55 uuid];
              uint64_t v57 = +[PLPrefetchResourceIdentifier resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:](PLPrefetchResourceIdentifier, "resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:", v56, [v53 version], objc_msgSend(v53, "cplType"), objc_msgSend(v53, "recipeID"));
              [v54 appendFormat:@"  %@\n", v57];
            }
            uint64_t v51 = [objc countByEnumeratingWithState:&v134 objects:v154 count:16];
          }
          while (v51);
        }
      }
    }
  }
  if ([*(id *)(a1 + 40) _prefetchIsEnabledForPhase:1])
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"Will prefetch %ld compute-sync resources:\n", objc_msgSend(*(id *)(a1 + 88), "count"));
    if (*(unsigned char *)(a1 + 168))
    {
      if ([*(id *)(a1 + 88) count])
      {
        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        id objd = *(id *)(a1 + 88);
        uint64_t v58 = [objd countByEnumeratingWithState:&v130 objects:v153 count:16];
        if (v58)
        {
          uint64_t v59 = v58;
          uint64_t v115 = *(void *)v131;
          do
          {
            for (uint64_t n = 0; n != v59; ++n)
            {
              if (*(void *)v131 != v115) {
                objc_enumerationMutation(objd);
              }
              v61 = *(void **)(*((void *)&v130 + 1) + 8 * n);
              v62 = *(void **)(a1 + 32);
              v63 = [v61 asset];
              v64 = [v63 uuid];
              v65 = +[PLPrefetchResourceIdentifier resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:](PLPrefetchResourceIdentifier, "resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:", v64, [v61 version], objc_msgSend(v61, "cplType"), objc_msgSend(v61, "recipeID"));
              [v62 appendFormat:@"  %@\n", v65];
            }
            uint64_t v59 = [objd countByEnumeratingWithState:&v130 objects:v153 count:16];
          }
          while (v59);
        }
      }
    }
  }
  if ([*(id *)(a1 + 40) _prefetchIsEnabledForPhase:5])
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"Will prefetch %ld media-metadata-overflow resources:\n", objc_msgSend(*(id *)(a1 + 96), "count"));
    if (*(unsigned char *)(a1 + 168))
    {
      if ([*(id *)(a1 + 96) count])
      {
        long long v128 = 0u;
        long long v129 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        id obje = *(id *)(a1 + 96);
        uint64_t v66 = [obje countByEnumeratingWithState:&v126 objects:v152 count:16];
        if (v66)
        {
          uint64_t v67 = v66;
          uint64_t v116 = *(void *)v127;
          do
          {
            for (iuint64_t i = 0; ii != v67; ++ii)
            {
              if (*(void *)v127 != v116) {
                objc_enumerationMutation(obje);
              }
              v69 = *(void **)(*((void *)&v126 + 1) + 8 * ii);
              v70 = *(void **)(a1 + 32);
              v71 = [v69 asset];
              v72 = [v71 uuid];
              v73 = +[PLPrefetchResourceIdentifier resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:](PLPrefetchResourceIdentifier, "resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:", v72, [v69 version], objc_msgSend(v69, "cplType"), objc_msgSend(v69, "recipeID"));
              [v70 appendFormat:@"  %@\n", v73];
            }
            uint64_t v67 = [obje countByEnumeratingWithState:&v126 objects:v152 count:16];
          }
          while (v67);
        }
      }
    }
  }
  if ([*(id *)(a1 + 40) _prefetchIsEnabledForPhase:6])
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"Will prefetch %ld adjusted-media-metadata-overflow resources:\n", objc_msgSend(*(id *)(a1 + 104), "count"));
    if (*(unsigned char *)(a1 + 168))
    {
      if ([*(id *)(a1 + 104) count])
      {
        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        id objf = *(id *)(a1 + 104);
        uint64_t v74 = [objf countByEnumeratingWithState:&v122 objects:v151 count:16];
        if (v74)
        {
          uint64_t v75 = v74;
          uint64_t v117 = *(void *)v123;
          do
          {
            for (juint64_t j = 0; jj != v75; ++jj)
            {
              if (*(void *)v123 != v117) {
                objc_enumerationMutation(objf);
              }
              v77 = *(void **)(*((void *)&v122 + 1) + 8 * jj);
              v78 = *(void **)(a1 + 32);
              v79 = [v77 asset];
              v80 = [v79 uuid];
              v81 = +[PLPrefetchResourceIdentifier resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:](PLPrefetchResourceIdentifier, "resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:", v80, [v77 version], objc_msgSend(v77, "cplType"), objc_msgSend(v77, "recipeID"));
              [v78 appendFormat:@"  %@\n", v81];
            }
            uint64_t v75 = [objf countByEnumeratingWithState:&v122 objects:v151 count:16];
          }
          while (v75);
        }
      }
    }
  }
  uint64_t v82 = [*(id *)(a1 + 40) _countOfAllInflightResources];
  if (v82)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"In-flight resources: %lu\n", v82);
    for (kuint64_t k = 0; kk != 5; ++kk)
    {
      uint64_t v84 = [*(id *)(a1 + 40) _countOfInflightResourcesForPrefetchPhase:kk];
      if (v84)
      {
        uint64_t v85 = v84;
        v86 = *(void **)(a1 + 32);
        v87 = [(id)objc_opt_class() descriptionForPrefetchPhase:kk];
        [v86 appendFormat:@"In-flight %@ resources: %ld\n", v87, v85];

        if (*(unsigned char *)(a1 + 168))
        {
          long long v120 = 0u;
          long long v121 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          v88 = [*(id *)(a1 + 40) _inflightResourceIdentifiersForPrefetchPhase:kk];
          uint64_t v89 = [v88 countByEnumeratingWithState:&v118 objects:v150 count:16];
          if (v89)
          {
            uint64_t v90 = v89;
            uint64_t v91 = *(void *)v119;
            do
            {
              for (muint64_t m = 0; mm != v90; ++mm)
              {
                if (*(void *)v119 != v91) {
                  objc_enumerationMutation(v88);
                }
                [*(id *)(a1 + 32) appendFormat:@"  %@\n", *(void *)(*((void *)&v118 + 1) + 8 * mm)];
              }
              uint64_t v90 = [v88 countByEnumeratingWithState:&v118 objects:v150 count:16];
            }
            while (v90);
          }
        }
      }
    }
  }
  v93 = +[PLMemory memoriesToPrefetchInPhotoLibrary:*(void *)(a1 + 48) prefetchConfiguration:*(void *)(*(void *)(a1 + 40) + 104)];
  if ([v93 count])
  {
    v94 = *(void **)(a1 + 32);
    v95 = [v93 valueForKey:@"uuid"];
    [v94 appendFormat:@"Will prefetch memories with UUIDs: %@\n", v95];
  }
  if ([*(id *)(a1 + 40) _prefetchIsEnabledForPhase:3])
  {
    v96 = [*(id *)(a1 + 48) managedObjectContext];
    v97 = +[PLSuggestion suggestionsToPrefetchInManagedObjectContext:v96];

    if ([v97 count])
    {
      v98 = *(void **)(a1 + 32);
      v99 = [v97 valueForKey:@"uuid"];
      [v98 appendFormat:@"Will prefetch widget suggestions with UUIDs: %@\n", v99];
    }
    v100 = [*(id *)(a1 + 48) managedObjectContext];
    v101 = +[PLMemory memoriesToPrefetchForWidgetInManagedObjectContext:v100];

    if ([v101 count])
    {
      v102 = *(void **)(a1 + 32);
      v103 = [v101 valueForKey:@"uuid"];
      [v102 appendFormat:@"Will prefetch widget memories with UUIDs: %@\n", v103];
    }
  }
}

- (id)prefetchStatusForDebug:(BOOL)a3
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__81682;
  id v9 = __Block_byref_object_dispose__81683;
  id v10 = 0;
  pl_dispatch_sync();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __57__PLCloudResourcePrefetchManager_prefetchStatusForDebug___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _prefetchStatusForDebug:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)stop
{
  uint64_t v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudResourcePrefetchManager stop]"];
  id v4 = [(PLLibraryServicesManager *)self->_lsm databaseContext];
  uint64_t v5 = (void *)[v4 newShortLivedLibraryWithName:"-[PLCloudResourcePrefetchManager stop]"];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__PLCloudResourcePrefetchManager_stop__block_invoke;
  v7[3] = &unk_1E5875E18;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PLCloudResourcePrefetchManager *)self _runOnWorkQueueWithTransaction:v3 block:v7];
}

uint64_t __38__PLCloudResourcePrefetchManager_stop__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) _countOfAllInflightResources];
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Stopping prefetching, %ld inflight resources.", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) _cleanupInflightResourcesInLibrary:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _setLastCompletePrefetchDate:0 inLibrary:*(void *)(a1 + 40)];
}

- (void)_cleanupInflightResourcesInLibrary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v19 = self;
  id v4 = [(PLCloudResourcePrefetchManager *)self _allInflightResourceIdentifiers];
  int v5 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Cleaning up inflight resources: %@", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:6];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "assetUuid", v18);

        if (v13)
        {
          char v14 = -[PLPrefetchResourceIdentifier initWithAssetUuid:version:cplType:recipeID:]([PLPrefetchResourceIdentifier alloc], "initWithAssetUuid:version:cplType:recipeID:", 0, [v12 version], objc_msgSend(v12, "cplType"), objc_msgSend(v12, "recipeID"));
          id v15 = [v6 objectForKey:v14];
          if (!v15)
          {
            id v15 = [MEMORY[0x1E4F1CA80] set];
            [v6 setObject:v15 forKey:v14];
          }
          uint64_t v16 = [v12 assetUuid];
          [v15 addObject:v16];
        }
        else
        {
          if (*MEMORY[0x1E4F59AC0]) {
            continue;
          }
          __CPLAssetsdOSLogDomain();
          char v14 = (PLPrefetchResourceIdentifier *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v28 = v12;
            _os_log_impl(&dword_19B3C7000, &v14->super, OS_LOG_TYPE_ERROR, "Invalid resource identifier: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__PLCloudResourcePrefetchManager__cleanupInflightResourcesInLibrary___block_invoke;
  v20[3] = &unk_1E58700B8;
  id v21 = v18;
  id v17 = v18;
  [v6 enumerateKeysAndObjectsUsingBlock:v20];
  [(PLCloudResourcePrefetchManager *)v19 _removeAllInflightResourceIdentifiers];
}

void __69__PLCloudResourcePrefetchManager__cleanupInflightResourcesInLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 count]) {
    +[PLInternalResource resetPrefetchStateForResourcesWithVersion:cplType:assetUuids:inLibrary:](PLInternalResource, "resetPrefetchStateForResourcesWithVersion:cplType:assetUuids:inLibrary:", [v6 version], objc_msgSend(v6, "cplType"), v5, *(void *)(a1 + 32));
  }
}

- (void)_enqueueCheckCPLBGDownloadFromNow:(id)a3 withReason:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (self->_enqueuedCheckCPLBGDownload)
  {
    uint64_t v8 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "CPL background download check (reason: %@) already enqueued", buf, 0xCu);
    }
  }
  else
  {
    self->_enqueuedCheckCPLBGDownload = 1;
    uint64_t v9 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_msgSend(v6, "dateByAddingTimeInterval:", (double)-[PLPrefetchConfiguration cloudResourceIntervalBetweenCheckCPLBGDownload](self->_prefetchConfiguration, "cloudResourceIntervalBetweenCheckCPLBGDownload"));
      *(_DWORD *)buf = 138412546;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Enqueuing CPL background download check (reason: %@) at %@", buf, 0x16u);
    }
    dispatch_time(0, 1000000000* [(PLPrefetchConfiguration *)self->_prefetchConfiguration cloudResourceIntervalBetweenCheckCPLBGDownload]);
    uint64_t v11 = v7;
    pl_dispatch_after();
    uint64_t v8 = v11;
  }
}

uint64_t __79__PLCloudResourcePrefetchManager__enqueueCheckCPLBGDownloadFromNow_withReason___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Running CPL background download check (reason: %@)", (uint8_t *)&v5, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 40) + 64) = 0;
  return [*(id *)(a1 + 40) _checkCPLBackgroundDownloadOperations];
}

- (void)_checkCPLBackgroundDownloadOperations
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if ([(PLCloudResourcePrefetchManager *)self _countOfAllInflightResources])
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceDate:self->_lastCheckCPLBGDownloadDate];
    if (v4 <= (double)[(PLPrefetchConfiguration *)self->_prefetchConfiguration cloudResourceIntervalBetweenCheckCPLBGDownload])
    {
      [(PLCloudResourcePrefetchManager *)self _enqueueCheckCPLBGDownloadFromNow:v3 withReason:@"throttled"];
    }
    else
    {
      int v5 = [MEMORY[0x1E4F1C9C8] date];
      lastCheckCPLBGDownloadDate = self->_lastCheckCPLBGDownloadDate;
      self->_lastCheckCPLBGDownloadDate = v5;

      uint64_t v7 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Asking CPL if it has background download operations", buf, 2u);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_cplManager);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __71__PLCloudResourcePrefetchManager__checkCPLBackgroundDownloadOperations__block_invoke;
      v9[3] = &unk_1E5870090;
      void v9[4] = self;
      [WeakRetained cplHasBackgroundDownloadOperationsWithCompletionHandler:v9];
    }
  }
}

void __71__PLCloudResourcePrefetchManager__checkCPLBackgroundDownloadOperations__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudResourcePrefetchManager _checkCPLBackgroundDownloadOperations]_block_invoke"];
  uint64_t v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__PLCloudResourcePrefetchManager__checkCPLBackgroundDownloadOperations__block_invoke_2;
  v9[3] = &unk_1E5874318;
  char v12 = a2;
  id v10 = v5;
  uint64_t v11 = v7;
  id v8 = v5;
  [v7 _runOnWorkQueueWithTransaction:v6 block:v9];
}

void __71__PLCloudResourcePrefetchManager__checkCPLBackgroundDownloadOperations__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v11 = 138412290;
      uint64_t v12 = v3;
      double v4 = "Failed to check if CPL has background download operations: %@";
      id v5 = v2;
      os_log_type_t v6 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl(&dword_19B3C7000, v5, v6, v4, (uint8_t *)&v11, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 40) _countOfAllInflightResources];
      int v11 = 134217984;
      uint64_t v12 = v7;
      double v4 = "CPL has %ld inflight resources download, do not start another automatic prefetch now";
      id v5 = v2;
      os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  if ([*(id *)(a1 + 40) _countOfAllInflightResources])
  {
    id v8 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [*(id *)(a1 + 40) _allInflightResourceIdentifiers];
      int v11 = 138412290;
      uint64_t v12 = (uint64_t)v9;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "CPL has no background download operations, yet assetsd has inflight downloads (%@)", (uint8_t *)&v11, 0xCu);
    }
    id v10 = [*(id *)(*(void *)(a1 + 40) + 8) databaseContext];
    uint64_t v2 = [v10 newShortLivedLibraryWithName:"-[PLCloudResourcePrefetchManager _checkCPLBackgroundDownloadOperations]_block_invoke"];

    [*(id *)(a1 + 40) _cleanupInflightResourcesInLibrary:v2];
    [*(id *)(a1 + 40) _startPrefetchNextBatch];
    goto LABEL_8;
  }
}

- (void)handleOptimizeModeChange
{
  uint64_t v3 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Trigger prefetching due to optimize mode change", buf, 2u);
  }

  double v4 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudResourcePrefetchManager handleOptimizeModeChange]"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PLCloudResourcePrefetchManager_handleOptimizeModeChange__block_invoke;
  v5[3] = &unk_1E5875CE0;
  v5[4] = self;
  [(PLCloudResourcePrefetchManager *)self _runOnWorkQueueWithTransaction:v4 block:v5];
}

uint64_t __58__PLCloudResourcePrefetchManager_handleOptimizeModeChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) cplSettings];
  *(void *)(*(void *)(a1 + 32) + 40) = [v2 prefetchMode];

  [*(id *)(a1 + 32) clearPrefetchState];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 startAutomaticPrefetch];
}

- (void)handleCPLConfigurationChange
{
  uint64_t v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudResourcePrefetchManager handleCPLConfigurationChange]"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cplManager);
  id v5 = [WeakRetained cplConfiguration];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PLCloudResourcePrefetchManager_handleCPLConfigurationChange__block_invoke;
  v7[3] = &unk_1E5875E18;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PLCloudResourcePrefetchManager *)self _runOnWorkQueueWithTransaction:v3 block:v7];
}

void __62__PLCloudResourcePrefetchManager_handleCPLConfigurationChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = [PLPrefetchConfiguration alloc];
  id v6 = [*(id *)(a1 + 40) valueForKey:*MEMORY[0x1E4F59750]];
  uint64_t v3 = [(PLPrefetchConfiguration *)v2 initWithPrefetchDictionary:v6];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = v3;
}

- (void)handleCPLStatusChange
{
  uint64_t v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudResourcePrefetchManager handleCPLStatusChange]"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cplManager);
  id v5 = [WeakRetained cplStatus];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PLCloudResourcePrefetchManager_handleCPLStatusChange__block_invoke;
  v7[3] = &unk_1E5875E18;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PLCloudResourcePrefetchManager *)self _runOnWorkQueueWithTransaction:v3 block:v7];
}

uint64_t __55__PLCloudResourcePrefetchManager_handleCPLStatusChange__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 88)
    || ([*(id *)(a1 + 40) initialSyncDate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    uint64_t v2 = [*(id *)(a1 + 40) initialSyncDate];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 88);
    *(void *)(v3 + 88) = v2;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 40) initialSyncDate];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 88);
    *(void *)(v7 + 88) = v6;

    uint64_t v9 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 88);
      int v12 = 138412290;
      uint64_t v13 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "initialSyncDate became non-nil (%@), starting non-thumbnails prefetch", (uint8_t *)&v12, 0xCu);
    }

    [*(id *)(a1 + 32) _startAutomaticPrefetch];
  }
  uint64_t result = [*(id *)(a1 + 40) isWalrusEnabled];
  *(unsigned char *)(*(void *)(a1 + 32) + 112) = result;
  return result;
}

- (void)_startAutomaticPrefetch
{
  if (self->_initialSyncDate) {
    self->_int64_t prefetchOptimizeMode = [(PLCloudResourcePrefetchManager *)self _prefetchOptimizeModeBasedOnLibrarySize];
  }
  if ([(PLCloudResourcePrefetchManager *)self _countOfAllInflightResources])
  {
    [(PLCloudResourcePrefetchManager *)self _checkCPLBackgroundDownloadOperations];
  }
  else
  {
    [(PLCloudResourcePrefetchManager *)self _startPrefetchNextBatch];
  }
}

- (void)startAutomaticPrefetch
{
  uint64_t v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudResourcePrefetchManager startAutomaticPrefetch]"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__PLCloudResourcePrefetchManager_startAutomaticPrefetch__block_invoke;
  v4[3] = &unk_1E5875CE0;
  v4[4] = self;
  [(PLCloudResourcePrefetchManager *)self _runOnWorkQueueWithTransaction:v3 block:v4];
}

uint64_t __56__PLCloudResourcePrefetchManager_startAutomaticPrefetch__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startAutomaticPrefetch];
}

- (void)invalidate
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  uint64_t v4 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Invalidated prefetch manager", v5, 2u);
  }
}

- (PLCloudResourcePrefetchManager)initWithCPLManager:(id)a3 pruneManager:(id)a4 libraryServicesManager:(id)a5
{
  v43[7] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v41.receiver = self;
  v41.super_class = (Class)PLCloudResourcePrefetchManager;
  int v12 = [(PLCloudResourcePrefetchManager *)&v41 init];
  if (v12)
  {
    if (!v11)
    {
      id v39 = [MEMORY[0x1E4F28B00] currentHandler];
      [v39 handleFailureInMethod:a2, v12, @"PLCloudResourcePrefetchManager.m", 152, @"Invalid parameter not satisfying: %@", @"libraryServicesManager" object file lineNumber description];
    }
    objc_storeStrong((id *)&v12->_lsm, a5);
    objc_storeWeak((id *)&v12->_cplManager, v9);
    id v40 = v10;
    objc_storeWeak((id *)&v12->_pruneManager, v10);
    uint64_t v13 = [PLPrefetchConfiguration alloc];
    uint64_t v14 = [v9 cplConfiguration];
    id v15 = [v14 valueForKey:*MEMORY[0x1E4F59750]];
    uint64_t v16 = [(PLPrefetchConfiguration *)v13 initWithPrefetchDictionary:v15];
    prefetchConfiguratiouint64_t n = v12->_prefetchConfiguration;
    v12->_prefetchConfiguratiouint64_t n = (PLPrefetchConfiguration *)v16;

    v42[0] = &unk_1EEBEFA68;
    id v18 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[PLPrefetchConfiguration cloudResourceThumbnailsMaxResourcesPerFetch](v12->_prefetchConfiguration, "cloudResourceThumbnailsMaxResourcesPerFetch"));
    v43[0] = v18;
    v42[1] = &unk_1EEBEFA80;
    id v19 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[PLPrefetchConfiguration cloudResourceComputeSyncMaxResourcesPerFetch](v12->_prefetchConfiguration, "cloudResourceComputeSyncMaxResourcesPerFetch"));
    v43[1] = v19;
    v42[2] = &unk_1EEBEFA98;
    id v20 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[PLPrefetchConfiguration cloudResourceMemoriesMaxResourcesPerFetch](v12->_prefetchConfiguration, "cloudResourceMemoriesMaxResourcesPerFetch"));
    v43[2] = v20;
    v42[3] = &unk_1EEBEFAB0;
    id v21 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[PLPrefetchConfiguration cloudResourceWidgetMaxResourcesPerFetch](v12->_prefetchConfiguration, "cloudResourceWidgetMaxResourcesPerFetch"));
    v43[3] = v21;
    v42[4] = &unk_1EEBEFAC8;
    long long v22 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[PLPrefetchConfiguration cloudResourceNonThumbnailsMaxResourcesPerFetch](v12->_prefetchConfiguration, "cloudResourceNonThumbnailsMaxResourcesPerFetch"));
    v43[4] = v22;
    v42[5] = &unk_1EEBEFAE0;
    long long v23 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[PLPrefetchConfiguration cloudResourceMediaMetadataOverflowMaxResourcesPerFetch](v12->_prefetchConfiguration, "cloudResourceMediaMetadataOverflowMaxResourcesPerFetch"));
    v43[5] = v23;
    v42[6] = &unk_1EEBEFAF8;
    long long v24 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[PLPrefetchConfiguration cloudResourceMediaMetadataOverflowMaxResourcesPerFetch](v12->_prefetchConfiguration, "cloudResourceMediaMetadataOverflowMaxResourcesPerFetch"));
    v43[6] = v24;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:7];
    inflightResources = v12->_inflightResources;
    v12->_inflightResources = (NSDictionary *)v25;

    uint64_t v27 = PLCloudCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v28 = dispatch_queue_create("PLCloudResourcePrefetchManager work queue", v27);
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v28;

    v12->_enqueuedCheckCPLBGDownload = 0;
    uint64_t v30 = [MEMORY[0x1E4F1C9C8] distantPast];
    lastCheckCPLBGDownloadDate = v12->_lastCheckCPLBGDownloadDate;
    v12->_lastCheckCPLBGDownloadDate = (NSDate *)v30;

    if (PLIsEDUMode()) {
      v12->_int64_t prefetchMode = 2;
    }
    id v32 = [v11 cplSettings];
    v12->_int64_t prefetchMode = [v32 prefetchMode];

    v12->_int64_t prefetchOptimizeMode = +[PLPrefetchConfiguration defaultPrefetchOptimizeMode];
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_cplManager);
    uint64_t v34 = [WeakRetained cplStatus];

    uint64_t v35 = [v34 initialSyncDate];
    initialSyncDate = v12->_initialSyncDate;
    v12->_initialSyncDate = (NSDate *)v35;

    lastCompletePrefetchDate = v12->_lastCompletePrefetchDate;
    v12->_lastCompletePrefetchDate = 0;

    v12->_BOOL isWalrusEnabled = [v34 isWalrusEnabled];
    id v10 = v40;
  }

  return v12;
}

- (PLCloudResourcePrefetchManager)init
{
  [(PLCloudResourcePrefetchManager *)self doesNotRecognizeSelector:a2];
  return [(PLCloudResourcePrefetchManager *)self initWithCPLManager:0 pruneManager:0 libraryServicesManager:0];
}

+ (void)resourcesToPrefetchWithPrefetchPhase:(unint64_t)a3 prefetchMode:(int64_t)a4 prefetchOptimizeMode:(int64_t)a5 initialSyncDate:(id)a6 lastCompletePrefetchDate:(id)a7 initialBudget:(int64_t)a8 excludeDynamicCPLResources:(BOOL)a9 prefetchConfiguration:(id)a10 photoLibrary:(id)a11 applyPerPrefetchLimit:(BOOL)a12 completionHandler:(id)a13
{
  id v18 = a6;
  id v19 = a7;
  id v20 = a10;
  id v21 = a11;
  long long v22 = (void (**)(id, id, int64_t))a13;
  uint64_t v36 = v18;
  if ([(id)objc_opt_class() _prefetchIsEnabledForPhase:a3 givenMode:a4 andInitialSyncDate:v18])
  {
    long long v23 = [[PLCloudResourcePrefetchPredicateOptions alloc] initWithPrefetchMode:a4 prefetchOptimizeMode:+[PLPrefetchConfiguration defaultPrefetchOptimizeMode] excludeDynamicResources:a9 prefetchConfiguration:v20];
    long long v24 = v23;
    uint64_t v25 = v19;
    switch(a3)
    {
      case 0uLL:
        unsigned int v26 = [v20 cloudResourceThumbnailsMaxResourcesPerFetch];
        uint64_t v27 = 0;
        break;
      case 1uLL:
        uint64_t v27 = +[PLCloudResourcePrefetchPredicates predicatesForComputeSync:v23 photoLibrary:v21];
        unsigned int v26 = [v20 cloudResourceComputeSyncMaxResourcesPerFetch];
        break;
      case 2uLL:
        uint64_t v27 = +[PLCloudResourcePrefetchPredicates predicatesForMemories:v23 photoLibrary:v21];
        unsigned int v26 = [v20 cloudResourceMemoriesMaxResourcesPerFetch];
        break;
      case 3uLL:
        uint64_t v27 = +[PLCloudResourcePrefetchPredicates predicatesForWidget:v23 photoLibrary:v21];
        unsigned int v26 = [v20 cloudResourceWidgetMaxResourcesPerFetch];
        break;
      case 4uLL:
        [(PLCloudResourcePrefetchPredicateOptions *)v23 setPrefetchOptimizeMode:a5];
        uint64_t v27 = +[PLCloudResourcePrefetchPredicates predicatesForNonThumbnails:v24 lastCompletePrefetchDate:v19];
        unsigned int v26 = [v20 cloudResourceNonThumbnailsMaxResourcesPerFetch];
        break;
      case 5uLL:
        uint64_t v30 = +[PLCloudResourcePrefetchPredicates predicateToPrefetchMediaMetadataResourcesWithOptions:v23 photoLibrary:v21];
        goto LABEL_12;
      case 6uLL:
        uint64_t v30 = +[PLCloudResourcePrefetchPredicates predicateToPrefetchAdjustedMediaMetadataResourcesWithOptions:v23 photoLibrary:v21];
LABEL_12:
        uint64_t v27 = (void *)v30;
        unsigned int v26 = [v20 cloudResourceMediaMetadataOverflowMaxResourcesPerFetch];
        break;
      default:
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        uint64_t v25 = v19;
        break;
    }
    int64_t v29 = a8;
    uint64_t v28 = v26;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v27 = 0;
    uint64_t v25 = v19;
    int64_t v29 = a8;
  }
  if (a12)
  {
    uint64_t v47 = 0;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x2020000000;
    int64_t v50 = v29;
    long long v31 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v28];
  }
  else
  {
    LODWORD(v28) = [v20 cloudResourceThumbnailsMaxResourcesPerFetch];
    uint64_t v47 = 0;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x2020000000;
    int64_t v50 = v29;
    long long v31 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v28 = v28;
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __262__PLCloudResourcePrefetchManager_resourcesToPrefetchWithPrefetchPhase_prefetchMode_prefetchOptimizeMode_initialSyncDate_lastCompletePrefetchDate_initialBudget_excludeDynamicCPLResources_prefetchConfiguration_photoLibrary_applyPerPrefetchLimit_completionHandler___block_invoke;
  v38[3] = &unk_1E58724A8;
  uint64_t v43 = &v47;
  id v32 = v31;
  id v39 = v32;
  unint64_t v44 = a3;
  id v45 = a1;
  id v33 = v21;
  id v40 = v33;
  id v34 = v20;
  id v41 = v34;
  uint64_t v46 = v28;
  id v35 = v27;
  id v42 = v35;
  [v33 performBlockAndWait:v38];
  if (v22) {
    v22[2](v22, v32, v29);
  }

  _Block_object_dispose(&v47, 8);
}

void __262__PLCloudResourcePrefetchManager_resourcesToPrefetchWithPrefetchPhase_prefetchMode_prefetchOptimizeMode_initialSyncDate_lastCompletePrefetchDate_initialBudget_excludeDynamicCPLResources_prefetchConfiguration_photoLibrary_applyPerPrefetchLimit_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __262__PLCloudResourcePrefetchManager_resourcesToPrefetchWithPrefetchPhase_prefetchMode_prefetchOptimizeMode_initialSyncDate_lastCompletePrefetchDate_initialBudget_excludeDynamicCPLResources_prefetchConfiguration_photoLibrary_applyPerPrefetchLimit_completionHandler___block_invoke_2;
  v22[3] = &unk_1E5870290;
  uint64_t v24 = *(void *)(a1 + 64);
  id v23 = *(id *)(a1 + 32);
  uint64_t v2 = (void (**)(void, void))MEMORY[0x19F38D650](v22);
  if (*(void *)(a1 + 72) || *(uint64_t *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) < 1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    obuint64_t j = *(id *)(a1 + 56);
    uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v25 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v19;
LABEL_4:
      uint64_t v6 = 0;
      while (1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * v6);
        unint64_t v8 = [*(id *)(a1 + 32) count];
        unint64_t v9 = *(void *)(a1 + 88);
        uint64_t v10 = v9 - v8;
        if (v9 <= v8 || *(uint64_t *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) < 1) {
          break;
        }
        id v11 = objc_opt_class();
        int v12 = [*(id *)(a1 + 40) managedObjectContext];
        uint64_t v13 = [v11 _resourcesWithPredicate:v7 limit:v10 context:v12];

        ((void (**)(void, void *))v2)[2](v2, v13);
        if (v4 == ++v6)
        {
          uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v25 count:16];
          if (v4) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  else
  {
    uint64_t v14 = objc_opt_class();
    id v15 = [*(id *)(a1 + 40) managedObjectContext];
    uint64_t v16 = objc_msgSend(v14, "thumbnailResourcesNeedingPrefetchInContext:maxRetry:limit:", v15, objc_msgSend(*(id *)(a1 + 48), "cloudResourceMaxPrefetchRetry"), *(void *)(a1 + 88));

    obuint64_t j = (id)v16;
    v2[2](v2, v16);
  }
}

void __262__PLCloudResourcePrefetchManager_resourcesToPrefetchWithPrefetchPhase_prefetchMode_prefetchOptimizeMode_initialSyncDate_lastCompletePrefetchDate_initialBudget_excludeDynamicCPLResources_prefetchConfiguration_photoLibrary_applyPerPrefetchLimit_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      unint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) -= objc_msgSend(v8, "dataLength", (void)v9);
      if (*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 1) {
        break;
      }
      [*(id *)(a1 + 32) addObject:v8];
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

+ (id)thumbnailResourcesNeedingPrefetchInContext:(id)a3 maxRetry:(unint64_t)a4 limit:(int64_t)a5
{
  v119[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a5 < 1)
  {
    long long v31 = 0;
  }
  else
  {
    unint64_t v83 = a4;
    int64_t v94 = a5;
    uint64_t v85 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a5];
    v80 = (void *)MEMORY[0x19F38D3B0]();
    id v82 = a1;
    int v9 = [a1 _hasAssetsNeedingOneTimeThumbRebuildInContext:v8];
    long long v10 = (void *)MEMORY[0x1E4F1CA48];
    long long v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"thumbnailIndex", 0xFFFFFFFFLL);
    long long v12 = [v10 arrayWithObject:v11];

    if (v9)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"thumbnailIndex", 4294967293);
      [v12 addObject:v13];
    }
    uint64_t v14 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v12];

    id v15 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v16 = +[PLManagedAsset entityName];
    id v17 = [v15 fetchRequestWithEntityName:v16];

    long long v18 = (void *)MEMORY[0x1E4F28BA0];
    v79 = (void *)v14;
    v119[0] = v14;
    long long v19 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"cloudLocalState", 1);
    v119[1] = v19;
    long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:2];
    long long v21 = [v18 andPredicateWithSubpredicates:v20];
    [v17 setPredicate:v21];

    [v17 setResultType:2];
    long long v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:0];
    long long v118 = v22;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v118 count:1];
    [v17 setSortDescriptors:v23];

    [v17 setAllocationType:1];
    id v24 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v24 setName:@"assetID"];
    uint64_t v25 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
    [v24 setExpression:v25];

    [v24 setExpressionResultType:2000];
    id v26 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v26 setName:@"adjustmentsState"];
    uint64_t v27 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"adjustmentsState"];
    [v26 setExpression:v27];

    [v26 setExpressionResultType:100];
    v76 = v26;
    v77 = v24;
    v117[0] = v24;
    v117[1] = v26;
    uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:2];
    [v17 setPropertiesToFetch:v28];

    id v109 = 0;
    v78 = v17;
    int64_t v29 = [v8 executeFetchRequest:v17 error:&v109];
    id v75 = v109;
    unint64_t v30 = 0;
    id v84 = v8;
    long long v31 = v85;
    unint64_t v32 = v94;
    uint64_t v90 = v29;
    do
    {
      if ([v31 count] >= v32 || v30 >= objc_msgSend(v29, "count")) {
        break;
      }
      context = (void *)MEMORY[0x19F38D3B0]();
      uint64_t v91 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v32];
      id v33 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v32];
      id v34 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v32];
      v93 = v33;
      uint64_t v35 = [v33 count];
      v92 = v34;
      if ([v34 count] + v35 >= v32)
      {
        uint64_t v36 = v82;
      }
      else
      {
        uint64_t v36 = v82;
        do
        {
          if (v30 >= [v29 count]) {
            break;
          }
          id v37 = [v29 objectAtIndexedSubscript:v30];
          id v38 = [v37 objectForKeyedSubscript:@"assetID"];
          id v39 = [v37 objectForKeyedSubscript:@"adjustmentsState"];
          int v40 = [v39 unsignedShortValue];

          [v91 addObject:v38];
          id v41 = v40 ? v34 : v93;
          [v41 addObject:v38];
          ++v30;

          int64_t v29 = v90;
          uint64_t v42 = [v93 count];
        }
        while ([v34 count] + v42 < v32);
      }
      uint64_t v43 = [MEMORY[0x1E4F1CA48] array];
      id v108 = 0;
      uint64_t v44 = [v36 _fetchThumbnailResourcesForAssets:v93 version:0 maxRetry:v83 inContext:v8 error:&v108];
      id v45 = v108;
      if (v44)
      {
        [v43 addObjectsFromArray:v44];
      }
      else
      {
        uint64_t v46 = PLResourceCachingGetLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          uint64_t v47 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          uint64_t v114 = v47;
          __int16 v115 = 2112;
          id v116 = v45;
          _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_ERROR, "%@: failed to fetch thumbnail resources in unadj batch with error: %@", buf, 0x16u);
        }
      }
      id v107 = v45;
      uint64_t v48 = [v36 _fetchThumbnailResourcesForAssets:v92 version:2 maxRetry:v83 inContext:v8 error:&v107];
      id v49 = v107;

      v87 = v49;
      v88 = (void *)v44;
      v86 = (void *)v48;
      if (v48)
      {
        [v43 addObjectsFromArray:v48];
      }
      else
      {
        int64_t v50 = PLResourceCachingGetLog();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          uint64_t v51 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          uint64_t v114 = v51;
          __int16 v115 = 2112;
          id v116 = v49;
          _os_log_impl(&dword_19B3C7000, v50, OS_LOG_TYPE_ERROR, "%@: failed to fetch thumbnail resources in adj batch with error: %@", buf, 0x16u);
        }
      }
      BOOL v52 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v43, "count"));
      long long v103 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v53 = v43;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v103 objects:v112 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v104;
        do
        {
          for (uint64_t i = 0; i != v55; ++i)
          {
            if (*(void *)v104 != v56) {
              objc_enumerationMutation(v53);
            }
            uint64_t v58 = *(void **)(*((void *)&v103 + 1) + 8 * i);
            uint64_t v59 = [v58 objectIDsForRelationshipNamed:@"asset"];
            v60 = [v59 firstObject];

            [v52 setObject:v58 forKeyedSubscript:v60];
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v103 objects:v112 count:16];
        }
        while (v55);
      }

      v61 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v53, "count"));
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v62 = v91;
      uint64_t v63 = [v62 countByEnumeratingWithState:&v99 objects:v111 count:16];
      if (v63)
      {
        uint64_t v64 = v63;
        uint64_t v65 = *(void *)v100;
        do
        {
          for (uint64_t j = 0; j != v64; ++j)
          {
            if (*(void *)v100 != v65) {
              objc_enumerationMutation(v62);
            }
            uint64_t v67 = [v52 objectForKeyedSubscript:*(void *)(*((void *)&v99 + 1) + 8 * j)];
            if (v67) {
              [v61 addObject:v67];
            }
          }
          uint64_t v64 = [v62 countByEnumeratingWithState:&v99 objects:v111 count:16];
        }
        while (v64);
      }

      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v68 = v61;
      uint64_t v69 = [v68 countByEnumeratingWithState:&v95 objects:v110 count:16];
      long long v31 = v85;
      if (v69)
      {
        uint64_t v70 = v69;
        uint64_t v71 = *(void *)v96;
LABEL_44:
        uint64_t v72 = 0;
        while (1)
        {
          if (*(void *)v96 != v71) {
            objc_enumerationMutation(v68);
          }
          [v85 addObject:*(void *)(*((void *)&v95 + 1) + 8 * v72)];
          if ([v85 count] == v94) {
            break;
          }
          if (v70 == ++v72)
          {
            uint64_t v70 = [v68 countByEnumeratingWithState:&v95 objects:v110 count:16];
            if (v70) {
              goto LABEL_44;
            }
            break;
          }
        }
      }

      uint64_t v73 = [v85 count];
      unint64_t v32 = v94;
      id v8 = v84;
      int64_t v29 = v90;
    }
    while (v73 != v94);
  }

  return v31;
}

+ (id)_fetchThumbnailResourcesForAssets:(id)a3 version:(unsigned int)a4 maxRetry:(unint64_t)a5 inContext:(id)a6 error:(id *)a7
{
  uint64_t v10 = *(void *)&a4;
  v26[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  if ([v11 count])
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v14 = +[PLInternalResource entityName];
    id v15 = [v13 fetchRequestWithEntityName:v14];

    uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@ AND %K == %d", @"asset", v11, @"version", v10];
    id v17 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d AND %K == %d AND %K <= %d AND %K != nil", @"dataStoreClassID", 0, @"dataStoreSubtype", 5, @"cloudPrefetchCount", a5, @"fingerprint");
    long long v18 = (void *)MEMORY[0x1E4F28BA0];
    v26[0] = v16;
    v26[1] = v17;
    long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    long long v20 = [v18 andPredicateWithSubpredicates:v19];
    [v15 setPredicate:v20];

    id v25 = 0;
    long long v21 = [v12 executeFetchRequest:v15 error:&v25];
    id v22 = v25;
    id v23 = v22;
    if (!v21 && a7) {
      *a7 = v22;
    }
  }
  else
  {
    long long v21 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v21;
}

+ (BOOL)_hasAssetsNeedingOneTimeThumbRebuildInContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[PLManagedAsset fetchRequest];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"thumbnailIndex", 4294967293);
  [v4 setPredicate:v5];

  uint64_t v6 = [v3 countForFetchRequest:v4 error:0];
  BOOL v8 = v6 != 0x7FFFFFFFFFFFFFFFLL && v6 != 0;

  return v8;
}

+ (BOOL)_prefetchIsEnabledForPhase:(unint64_t)a3 givenMode:(int64_t)a4 andInitialSyncDate:(id)a5
{
  unsigned int v5 = (0x77u >> a3) & 1;
  if (a3 >= 7) {
    LOBYTE(v5) = 0;
  }
  if (!a5) {
    LOBYTE(v5) = 0;
  }
  BOOL v6 = a3 == 0;
  if (a4 != 3) {
    BOOL v6 = 0;
  }
  if ((unint64_t)a4 >= 2) {
    return v6;
  }
  else {
    return v5;
  }
}

+ (id)_resourcesWithPredicate:(id)a3 limit:(unint64_t)a4 context:(id)a5
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  int v9 = +[PLInternalResource entityName];
  uint64_t v10 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v9];
  v26[0] = @"asset";
  v26[1] = @"asset.master";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  [v10 setRelationshipKeyPathsForPrefetching:v11];

  id v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"cloudMasterDateCreated" ascending:0];
  id v25 = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  [v10 setSortDescriptors:v13];

  [v10 setPredicate:v7];
  [v10 setFetchLimit:a4];
  id v18 = 0;
  uint64_t v14 = [v8 executeFetchRequest:v10 error:&v18];

  id v15 = v18;
  if (v15)
  {
    uint64_t v16 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = v7;
      __int16 v21 = 2048;
      unint64_t v22 = a4;
      __int16 v23 = 2112;
      id v24 = v15;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to fetch resources with predicate %@ limit %ld : %@", buf, 0x20u);
    }
  }
  return v14;
}

+ (id)descriptionForPrefetchMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"optimize";
  }
  else {
    return off_1E5870308[a3 - 1];
  }
}

+ (id)_identifierForResourceDownload:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [PLPrefetchResourceIdentifier alloc];
  unsigned int v5 = [v3 asset];
  BOOL v6 = [v5 uuid];
  uint64_t v7 = [v3 version];
  uint64_t v8 = [v3 cplType];
  uint64_t v9 = [v3 recipeID];

  uint64_t v10 = [(PLPrefetchResourceIdentifier *)v4 initWithAssetUuid:v6 version:v7 cplType:v8 recipeID:v9];
  return v10;
}

+ (id)descriptionForPrefetchPhase:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return @"thumbnails";
  }
  else {
    return off_1E58702D8[a3 - 1];
  }
}

@end