@interface PLAnalysisCoordinator
+ (id)bgstTaskNameForCoordinatorFeature:(unint64_t)a3;
+ (unint64_t)bgstFeatureCodeForCoordinatorFeature:(unint64_t)a3;
+ (void)registerSearchFastPassTaskWithBundleController:(id)a3;
+ (void)reportBGSTFeatureAvailable:(unint64_t)a3;
+ (void)reportBGSTFeaturePreviewAvailable:(unint64_t)a3;
- (PLAnalysisCoordinator)initWithLibraryServicesManager:(id)a3;
- (id)analyzeAssets:(id)a3 forFeature:(unint64_t)a4 withCompletionHandler:(id)a5;
- (id)analyzeLibraryForFeature:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)_handleSearchFastPassTask:(id)a3;
- (void)reportBGSTCheckpointProgressForFeature:(unint64_t)a3;
@end

@implementation PLAnalysisCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_lsm, 0);
}

- (void)reportBGSTCheckpointProgressForFeature:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = [(PLLibraryServicesManager *)self->_lsm databaseContext];
  v5 = (void *)[v4 newShortLivedLibraryWithName:"-[PLAnalysisCoordinator reportBGSTCheckpointProgressForFeature:]"];

  v6 = [v5 globalValues];
  v7 = [v6 featureAvailability];

  v8 = [[PLFeatureAvailability alloc] initWithDictionary:v7];
  v9 = [NSNumber numberWithUnsignedInteger:a3];
  v10 = [(PLFeatureAvailability *)v8 fractionForFeature:v9];

  v11 = [(PLFeatureAvailability *)v8 processingSnapshot];
  v12 = [(id)objc_opt_class() bgstTaskNameForCoordinatorFeature:a3];
  if (v12)
  {
    v21 = [MEMORY[0x1E4F4F430] sharedInstance];
    uint64_t v13 = [v11 totalAssetCount];
    [v10 doubleValue];
    unint64_t v15 = llround(v14 * 100.0);
    if (v15 >= 0x65)
    {
      v16 = PLAnalysisCoordinatorGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v24 = v15;
        __int16 v25 = 2048;
        unint64_t v26 = a3;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "completedPercentage is over 100: %tu, capping at 100 for feature %lu", buf, 0x16u);
      }

      unint64_t v15 = 100;
    }
    v17 = [MEMORY[0x1E4F1C9C8] now];
    id v22 = 0;
    char v18 = [v21 reportProgressForTaskWithName:v12 withGlobalTarget:v13 completed:v15 atDate:v17 category:10 subCategory:0 error:&v22];
    id v19 = v22;

    if ((v18 & 1) == 0)
    {
      v20 = PLAnalysisCoordinatorGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        unint64_t v24 = a3;
        __int16 v25 = 2112;
        unint64_t v26 = (unint64_t)v19;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Report task workload progress failed for feature %lu: %@", buf, 0x16u);
      }
    }
  }
}

- (void)_handleSearchFastPassTask:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F90] currentProgress];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__PLAnalysisCoordinator__handleSearchFastPassTask___block_invoke;
  v9[3] = &unk_1E586F1F0;
  id v10 = v5;
  v11 = self;
  id v12 = v4;
  id v6 = v4;
  id v7 = v5;
  id v8 = [(PLAnalysisCoordinator *)self analyzeLibraryForFeature:2 withCompletionHandler:v9];
}

void __51__PLAnalysisCoordinator__handleSearchFastPassTask___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) fractionCompleted];
  if (v4 >= 0.35) {
    [(id)objc_opt_class() reportBGSTFeaturePreviewAvailable:3];
  }
  if ([v3 isSuccess])
  {
    [*(id *)(a1 + 48) setTaskCompleted];
  }
  else
  {
    v5 = PLAnalysisCoordinatorGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [v3 error];
      *(_DWORD *)buf = 138412290;
      double v14 = v6;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Task failed with analysis coordinator error: %@", buf, 0xCu);
    }
    id v7 = *(void **)(a1 + 48);
    id v12 = 0;
    char v8 = [v7 setTaskExpiredWithRetryAfter:&v12 error:300.0];
    v9 = (__CFString *)v12;
    if ((v8 & 1) == 0)
    {
      id v10 = PLAnalysisCoordinatorGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = @"Unknown";
        if (v9) {
          v11 = v9;
        }
        *(_DWORD *)buf = 138412290;
        double v14 = v11;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Failed to expire task with error: %@", buf, 0xCu);
      }
    }
  }
}

- (id)analyzeLibraryForFeature:(unint64_t)a3 withCompletionHandler:(id)a4
{
  lsm = self->_lsm;
  id v7 = a4;
  char v8 = [(PLLibraryServicesManager *)lsm databaseContext];
  v9 = (void *)[v8 newShortLivedLibraryWithName:"-[PLAnalysisCoordinator analyzeLibraryForFeature:withCompletionHandler:]"];

  id v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __72__PLAnalysisCoordinator_analyzeLibraryForFeature_withCompletionHandler___block_invoke;
  char v18 = &unk_1E5875E18;
  id v19 = v9;
  id v20 = v10;
  id v11 = v10;
  id v12 = v9;
  [v12 performBlockAndWait:&v15];
  uint64_t v13 = -[PLAnalysisCoordinator analyzeAssets:forFeature:withCompletionHandler:](self, "analyzeAssets:forFeature:withCompletionHandler:", v11, a3, v7, v15, v16, v17, v18);

  return v13;
}

void __72__PLAnalysisCoordinator_analyzeLibraryForFeature_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v10 = +[PLManagedAsset fetchRequest];
  v2 = +[PLManagedAsset predicateToIncludeOnlyAllowedForAnalysisAssets];
  [v10 setPredicate:v2];

  [v10 setFetchBatchSize:100];
  id v3 = [*(id *)(a1 + 32) managedObjectContext];
  double v4 = [v3 executeFetchRequest:v10 error:0];

  if ([v4 count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = (void *)MEMORY[0x19F38D3B0]();
      id v7 = [v4 objectAtIndexedSubscript:v5];
      char v8 = *(void **)(a1 + 40);
      v9 = [v7 objectID];
      [v8 addObject:v9];

      ++v5;
    }
    while (v5 < [v4 count]);
  }
}

- (id)analyzeAssets:(id)a3 forFeature:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [[PLAnalysisCoordinatorTask alloc] initForFeature:a4 assets:v9 lsm:self->_lsm];

  os_unfair_lock_lock(&self->_lock_tasks);
  tasks = self->_tasks;
  id v12 = [v10 taskID];
  [(NSMutableDictionary *)tasks setObject:v10 forKeyedSubscript:v12];

  os_unfair_lock_unlock(&self->_lock_tasks);
  uint64_t v13 = +[PLConcurrencyLimiter sharedLimiter];
  taskQueue = self->_taskQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__PLAnalysisCoordinator_analyzeAssets_forFeature_withCompletionHandler___block_invoke;
  v19[3] = &unk_1E5874868;
  id v20 = v10;
  v21 = self;
  id v22 = v8;
  id v15 = v8;
  id v16 = v10;
  [v13 dispatchAsync:taskQueue block:v19];

  v17 = [v16 progress];

  return v17;
}

void __72__PLAnalysisCoordinator_analyzeAssets_forFeature_withCompletionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__PLAnalysisCoordinator_analyzeAssets_forFeature_withCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E586DE60;
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  id v2 = (id)v3.i64[0];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  id v6 = *(id *)(a1 + 48);
  [v2 executeWithCompletionHandler:v4];
}

void __72__PLAnalysisCoordinator_analyzeAssets_forFeature_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  int8x16_t v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 32);
  id v6 = a2;
  os_unfair_lock_lock(v3);
  double v4 = *(void **)(*(void *)(a1 + 32) + 24);
  int8x16_t v5 = [*(id *)(a1 + 40) taskID];
  [v4 setObject:0 forKeyedSubscript:v5];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (PLAnalysisCoordinator)initWithLibraryServicesManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLAnalysisCoordinator;
  id v6 = [(PLAnalysisCoordinator *)&v13 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.photolibrary.analysis-coordinator", v7);
    taskQueue = v6->_taskQueue;
    v6->_taskQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_lsm, a3);
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    tasks = v6->_tasks;
    v6->_tasks = (NSMutableDictionary *)v10;

    v6->_lock_tasks._os_unfair_lock_opaque = 0;
  }

  return v6;
}

+ (void)reportBGSTFeatureAvailable:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(a1, "bgstFeatureCodeForCoordinatorFeature:");
  if (v4)
  {
    unint64_t v5 = v4;
    id v14 = 0;
    char v6 = [MEMORY[0x1E4F4F430] reportFeatureCheckpoint:50 forFeature:v4 error:&v14];
    id v7 = v14;
    dispatch_queue_t v8 = PLAnalysisCoordinatorGetLog();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v16 = v5;
        uint64_t v10 = "Successfully reported feature available checkpoint for feature code: %tu";
        id v11 = v9;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_11:
        _os_log_impl(&dword_19B3C7000, v11, v12, v10, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_super v13 = @"Unknown";
      if (v7) {
        objc_super v13 = (__CFString *)v7;
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v16 = (unint64_t)v13;
      uint64_t v10 = "Failed to report available checkpoint with error: %@";
      id v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_11;
    }

    goto LABEL_13;
  }
  id v7 = PLAnalysisCoordinatorGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v16 = a3;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Unknown feature %lu, not reporting available", buf, 0xCu);
  }
LABEL_13:
}

+ (void)reportBGSTFeaturePreviewAvailable:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(a1, "bgstFeatureCodeForCoordinatorFeature:");
  if (v4)
  {
    unint64_t v5 = v4;
    id v14 = 0;
    char v6 = [MEMORY[0x1E4F4F430] reportFeatureCheckpoint:30 forFeature:v4 error:&v14];
    id v7 = v14;
    dispatch_queue_t v8 = PLAnalysisCoordinatorGetLog();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v16 = v5;
        uint64_t v10 = "Successfully reported preview available checkpoint for feature code: %tu";
        id v11 = v9;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_11:
        _os_log_impl(&dword_19B3C7000, v11, v12, v10, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_super v13 = @"Unknown";
      if (v7) {
        objc_super v13 = (__CFString *)v7;
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v16 = (unint64_t)v13;
      uint64_t v10 = "Failed to report preview available checkpoint with error: %@";
      id v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_11;
    }

    goto LABEL_13;
  }
  id v7 = PLAnalysisCoordinatorGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v16 = a3;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Unknown feature %lu, not reporting available", buf, 0xCu);
  }
LABEL_13:
}

+ (id)bgstTaskNameForCoordinatorFeature:(unint64_t)a3
{
  if (a3 == 3) {
    return @"com.apple.assetsd.PhotosSearchIndexing.fastpass";
  }
  else {
    return 0;
  }
}

+ (unint64_t)bgstFeatureCodeForCoordinatorFeature:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return qword_19BA9A740[a3];
  }
}

+ (void)registerSearchFastPassTaskWithBundleController:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F4F440] sharedScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PLAnalysisCoordinator_registerSearchFastPassTaskWithBundleController___block_invoke;
  v7[3] = &unk_1E5864750;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [v5 registerForTaskWithIdentifier:@"com.apple.assetsd.PhotosSearchIndexing.fastpass" usingQueue:0 launchHandler:v7];
}

void __72__PLAnalysisCoordinator_registerSearchFastPassTaskWithBundleController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  [v4 becomeCurrentWithPendingUnitCount:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__PLAnalysisCoordinator_registerSearchFastPassTaskWithBundleController___block_invoke_2;
  v17[3] = &unk_1E5875CE0;
  id v5 = v4;
  id v18 = v5;
  [v3 setExpirationHandler:v17];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileslideshow"];
  if ([v6 BOOLForKey:@"PLAnalyisCoordinatorSkipSearchFastPass"])
  {
    id v7 = PLAnalysisCoordinatorGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Skipping Search Fast Pass due to default being set", buf, 2u);
    }

    [*(id *)(a1 + 40) reportBGSTFeatureAvailable:3];
    [v3 setTaskCompleted];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F8B980] systemLibraryURL];
    id v9 = [*(id *)(a1 + 32) openBundleAtLibraryURL:v8];
    uint64_t v10 = [v9 libraryServicesManager];
    id v11 = [[PLPhotoLibraryOpener alloc] initWithLibraryServicesManager:v10 reportInProgressUpgrades:0];
    id v16 = 0;
    BOOL v12 = [(PLPhotoLibraryOpener *)v11 openPhotoLibraryDatabaseWithAutoUpgrade:1 autoCreate:0 error:&v16];
    id v13 = v16;
    if (v12)
    {
      id v14 = [v10 analysisCoordinator];
      [v14 _handleSearchFastPassTask:v3];
    }
    else
    {
      id v15 = PLAnalysisCoordinatorGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v13;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to open photo library: %@", buf, 0xCu);
      }

      [v3 setTaskExpiredWithRetryAfter:0 error:0.0];
    }
  }
  [v5 resignCurrent];
}

uint64_t __72__PLAnalysisCoordinator_registerSearchFastPassTaskWithBundleController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

@end