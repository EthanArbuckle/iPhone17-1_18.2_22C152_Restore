@interface PLSpotlightProgressManager
+ (BOOL)_addSearchableItemIdentifiers:(id)a3 operationType:(unint64_t)a4 forPhotoLibraryPathManager:(id)a5 isRetry:(BOOL)a6;
+ (BOOL)_shouldRetryReindexWithScheduledDateOf:(id)a3;
+ (BOOL)_shouldRetryRequestWithMostRecentAttemptOf:(id)a3;
+ (BOOL)_writeProgressToDisk:(id)a3 forPhotoLibraryPathManager:(id)a4;
+ (BOOL)addSearchableItemIdentifiers:(id)a3 forOperationType:(unint64_t)a4 forPhotoLibraryPathManager:(id)a5;
+ (BOOL)deleteSpotlightProgressForPhotoLibraryPathManager:(id)a3;
+ (BOOL)didPreviouslySetSpotlightNeedsIndexRebuild;
+ (BOOL)removeSearchableItemIdentifiers:(id)a3 forPhotoLibraryPathManager:(id)a4;
+ (BOOL)setSpotlightIndexNeedsReindexing:(BOOL)a3 forPhotoLibraryPathManager:(id)a4;
+ (BOOL)shouldPerformSpotlightOperationOfType:(unint64_t)a3 withSearchableItemIdentifiers:(id)a4 photoLibraryPathManager:(id)a5;
+ (BOOL)shouldPerformSpotlightOperationsWithPhotoLibraryPathManager:(id)a3;
+ (BOOL)shouldReindexSpotlightIndexForPhotoLibraryPathManager:(id)a3;
+ (BOOL)shouldRetrySpotlightIndexDropForUniversalSearchEligibilityChange;
+ (BOOL)spotlightOperationCompletedForOperationType:(unint64_t)a3 withSearchableIdentifiers:(id)a4 forPhotoLibraryPathManager:(id)a5 success:(BOOL)a6;
+ (BOOL)spotlightResetOperationCompletedForPhotoLibraryPathManager:(id)a3 success:(BOOL)a4;
+ (BOOL)universalSearchEligibilityDidChangeForSPLWithDatabaseUUID:(id)a3 currentSPLPath:(id)a4 currentEligibility:(BOOL)a5;
+ (id)_minimumScheduledDateForNextReindexRetry;
+ (id)_readProgressFromDiskForPhotoLibraryPathManager:(id)a3;
+ (id)_storageKeyForOperationType:(unint64_t)a3;
+ (id)_updateFailureCountsForSearchableItemIdentifiers:(id)a3 shouldIncrementCounts:(BOOL)a4 forPhotoLibraryPathManager:(id)a5;
+ (id)lastKnownSystemPhotoLibraryPath;
+ (void)spotlightProgressForPhotoLibraryPathManager:(id)a3 completion:(id)a4;
@end

@implementation PLSpotlightProgressManager

+ (id)_readProgressFromDiskForPhotoLibraryPathManager:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [a3 searchIndexSpotlightProgressFilePath];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v3];
    if (v6)
    {
      v7 = v6;
      v8 = v7;
      goto LABEL_10;
    }
    v9 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to read Spotlight Progress at path: \"%@\"", (uint8_t *)&v11, 0xCu);
    }

    v7 = 0;
  }
  else
  {
    v7 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "No prior Spotlight progress plist found at path: \"%@\"", (uint8_t *)&v11, 0xCu);
    }
  }
  v8 = 0;
LABEL_10:

  return v8;
}

+ (BOOL)_writeProgressToDisk:(id)a3 forPhotoLibraryPathManager:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v15 = 0;
  v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v15];
  v7 = v15;
  if (!v6)
  {
    v10 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Failed to serialize progress plist. Error: %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  v8 = [v5 searchIndexSpotlightProgressFilePath];
  id v14 = 0;
  char v9 = [v6 writeToFile:v8 options:1073741825 error:&v14];
  v10 = v14;

  if ((v9 & 1) == 0)
  {
    v12 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to write Spotlight progress plist to disk. Error: %@", buf, 0xCu);
    }

LABEL_9:
    BOOL v11 = 0;
    goto LABEL_10;
  }
  BOOL v11 = 1;
LABEL_10:

  return v11;
}

+ (id)_minimumScheduledDateForNextReindexRetry
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v4 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v3 setTimeZone:v4];

  id v5 = [v3 components:28 fromDate:v2];
  objc_msgSend(v5, "setDay:", objc_msgSend(v5, "day") + 1);
  v6 = [v3 dateFromComponents:v5];

  return v6;
}

+ (BOOL)_shouldRetryReindexWithScheduledDateOf:(id)a3
{
  if (!a3) {
    return 1;
  }
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  id v5 = [v3 date];
  uint64_t v6 = [v4 compare:v5];

  BOOL v7 = v6 == -1;
  return v7;
}

+ (BOOL)_shouldRetryRequestWithMostRecentAttemptOf:(id)a3
{
  if (!a3) {
    return 1;
  }
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  id v5 = [v3 date];
  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;

  BOOL v8 = v7 / 60.0 >= 60.0;
  return v8;
}

+ (id)_updateFailureCountsForSearchableItemIdentifiers:(id)a3 shouldIncrementCounts:(BOOL)a4 forPhotoLibraryPathManager:(id)a5
{
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:a5];
  char v9 = [v8 objectForKeyedSubscript:@"search.coreSpotlight.itemFailureCounts"];
  if (v9) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = !v6;
  }
  if (v10)
  {
    v12 = 0;
  }
  else
  {
    id v24 = v9;
    if (v9) {
      id v11 = (id)[v9 mutableCopy];
    }
    else {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    uint64_t v13 = v11;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v25 = v7;
    id v14 = v7;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          if (v6)
          {
            v20 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * i)];
            uint64_t v21 = [v20 unsignedIntegerValue];

            v22 = [NSNumber numberWithUnsignedInteger:v21 + 1];
            [v13 setObject:v22 forKeyedSubscript:v19];
          }
          else
          {
            [v13 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v16);
    }

    v12 = (void *)[v13 copy];
    id v7 = v25;
    char v9 = v24;
  }

  return v12;
}

+ (id)_storageKeyForOperationType:(unint64_t)a3
{
  v3 = @"search.coreSpotlight.itemsToDonate";
  if (a3 != 1) {
    v3 = 0;
  }
  if (a3 == 2) {
    return @"search.coreSpotlight.itemsToDelete";
  }
  else {
    return v3;
  }
}

+ (BOOL)_addSearchableItemIdentifiers:(id)a3 operationType:(unint64_t)a4 forPhotoLibraryPathManager:(id)a5 isRetry:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if ([v9 count])
  {
    id v11 = off_1E585F000;
    if (+[PLSpotlightProgressManager removeSearchableItemIdentifiers:v9 forPhotoLibraryPathManager:v10])
    {
      v12 = +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:v10];
      uint64_t v13 = v12;
      if (v12) {
        id v14 = (id)[v12 mutableCopy];
      }
      else {
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      uint64_t v16 = v14;
      uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
      uint64_t v18 = v17;
      v44 = v13;
      if (v6)
      {
        unint64_t v41 = a4;
        id v43 = v10;
        uint64_t v19 = +[PLSpotlightProgressManager _updateFailureCountsForSearchableItemIdentifiers:v9 shouldIncrementCounts:1 forPhotoLibraryPathManager:v10];
        v42 = v16;
        [v16 setObject:v19 forKeyedSubscript:@"search.coreSpotlight.itemFailureCounts"];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v20 = v9;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v46 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v45 + 1) + 8 * i);
              long long v26 = [v19 objectForKeyedSubscript:v25];
              unint64_t v27 = [v26 unsignedIntegerValue];

              if (v27 <= 4) {
                [v18 addObject:v25];
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v49 count:16];
          }
          while (v22);
        }

        uint64_t v16 = v42;
        long long v28 = [v42 objectForKeyedSubscript:@"search.coreSpotlight.requestFailureCount"];
        uint64_t v29 = [v28 unsignedIntegerValue];

        v30 = [NSNumber numberWithUnsignedInteger:v29 + 1];
        [v42 setObject:v30 forKeyedSubscript:@"search.coreSpotlight.requestFailureCount"];

        uint64_t v31 = [MEMORY[0x1E4F1C9C8] date];
        [v42 setObject:v31 forKeyedSubscript:@"search.coreSpotlight.requestRetryDate"];

        id v10 = v43;
        id v11 = off_1E585F000;
        a4 = v41;
      }
      else
      {
        [v17 addObjectsFromArray:v9];
      }
      v32 = [(__objc2_class *)v11[330] _storageKeyForOperationType:a4];
      v33 = [v16 objectForKeyedSubscript:v32];
      if (v33)
      {
        v34 = [MEMORY[0x1E4F1CA80] setWithArray:v33];
      }
      else
      {
        v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v9, "count"));
      }
      v35 = v34;
      [v34 addObjectsFromArray:v18];
      v36 = [v35 allObjects];
      [v16 setObject:v36 forKeyedSubscript:v32];

      v37 = v11[330];
      v38 = v16;
      v39 = (void *)[v16 copy];
      char v15 = [(__objc2_class *)v37 _writeProgressToDisk:v39 forPhotoLibraryPathManager:v10];
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

+ (id)lastKnownSystemPhotoLibraryPath
{
  return 0;
}

+ (BOOL)didPreviouslySetSpotlightNeedsIndexRebuild
{
  return 0;
}

+ (BOOL)shouldRetrySpotlightIndexDropForUniversalSearchEligibilityChange
{
  return 0;
}

+ (BOOL)universalSearchEligibilityDidChangeForSPLWithDatabaseUUID:(id)a3 currentSPLPath:(id)a4 currentEligibility:(BOOL)a5
{
  return 0;
}

+ (void)spotlightProgressForPhotoLibraryPathManager:(id)a3 completion:(id)a4
{
  id v21 = a3;
  id v7 = (void (**)(id, id, id))a4;
  if (v21)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 316, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 317, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v8 = a1;
  objc_sync_enter(v8);
  id v9 = +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:v21];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"search.coreSpotlight.itemsToDonate"];
  id v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v10) {
    uint64_t v13 = (void *)v10;
  }
  else {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v14 = v13;

  uint64_t v15 = [v9 objectForKeyedSubscript:@"search.coreSpotlight.itemsToDelete"];
  uint64_t v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = (void *)v15;
  }
  else {
    uint64_t v17 = v12;
  }
  id v18 = v17;

  v7[2](v7, v14, v18);
  objc_sync_exit(v8);
}

+ (BOOL)deleteSpotlightProgressForPhotoLibraryPathManager:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 289, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
  }
  id v6 = a1;
  objc_sync_enter(v6);
  id v7 = [v5 searchIndexSpotlightProgressFilePath];
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v9 = [v8 fileExistsAtPath:v7];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v19 = 0;
    int v11 = [v10 removeItemAtPath:v7 error:&v19];
    v12 = v19;

    if (v11)
    {
      uint64_t v13 = PLSearchBackendDonationsGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v7;
        id v14 = "Successfully deleted Spotlight progress plist at path: \"%@\". Nothing to delete";
        uint64_t v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
        _os_log_impl(&dword_19B3C7000, v15, v16, v14, buf, 0xCu);
      }
    }
    else
    {
      uint64_t v13 = PLSearchBackendDonationsGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v12;
        id v14 = "Failed to delete Spotlight progress plist from disk. Error: %@";
        uint64_t v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
    }

    goto LABEL_14;
  }
  v12 = PLSearchBackendDonationsGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v7;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "No prior Spotlight progress plist found at path. Nothing to delete: \"%@\"", buf, 0xCu);
  }
  LOBYTE(v11) = 1;
LABEL_14:

  objc_sync_exit(v6);
  return v11;
}

+ (BOOL)shouldPerformSpotlightOperationsWithPhotoLibraryPathManager:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    os_log_type_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 261, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
  }
  id v6 = a1;
  objc_sync_enter(v6);
  id v7 = +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:v5];
  id v8 = [v7 objectForKeyedSubscript:@"search.coreSpotlight.needsReindexing"];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    uint64_t v10 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Spotlight index needs to be re-indexed. Aborting request to donate/delete content.", buf, 2u);
    }
    BOOL v11 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v12 = [v7 objectForKeyedSubscript:@"search.coreSpotlight.requestFailureCount"];
  unint64_t v13 = [v12 unsignedIntegerValue];

  if (v13 >= 5)
  {
    id v14 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      unint64_t v18 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Donations paused due to multiple (%{public}lu) consecutive failures. Evaluating whether or not to proceed based on when the most recent attempt occurred...", buf, 0xCu);
    }

    uint64_t v10 = [v7 objectForKeyedSubscript:@"search.coreSpotlight.requestRetryDate"];
    BOOL v11 = +[PLSpotlightProgressManager _shouldRetryRequestWithMostRecentAttemptOf:v10];
    goto LABEL_12;
  }
  BOOL v11 = 1;
LABEL_13:

  objc_sync_exit(v6);
  return v11;
}

+ (BOOL)shouldPerformSpotlightOperationOfType:(unint64_t)a3 withSearchableItemIdentifiers:(id)a4 photoLibraryPathManager:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_13:
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 235, @"Invalid parameter not satisfying: %@", @"operationType != PLSpotlightOperationTypeUndefined" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_14;
  }
  unint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 234, @"Invalid parameter not satisfying: %@", @"searchableItemIdentifiers" object file lineNumber description];

  if (!a3) {
    goto LABEL_13;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_14:
  id v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 236, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

LABEL_4:
  id v11 = a1;
  objc_sync_enter(v11);
  char v12 = [v11 shouldPerformSpotlightOperationsWithPhotoLibraryPathManager:v10];
  if ((v12 & 1) == 0)
  {
    unint64_t v13 = +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:v10];
    id v14 = [v13 objectForKeyedSubscript:@"search.coreSpotlight.needsReindexing"];
    char v15 = [v14 BOOLValue];

    if ((v15 & 1) == 0
      && !+[PLSpotlightProgressManager _addSearchableItemIdentifiers:v9 operationType:a3 forPhotoLibraryPathManager:v10 isRetry:0])
    {
      os_log_type_t v16 = PLSearchBackendDonationsGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v22 = [v9 count];
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to record %{public}lu searchable identifiers on disk for deferred retry. Photos and Spotlight indexes have diverged.", buf, 0xCu);
      }
    }
  }
  objc_sync_exit(v11);

  return v12;
}

+ (BOOL)shouldReindexSpotlightIndexForPhotoLibraryPathManager:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 187, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
  }
  id v6 = a1;
  objc_sync_enter(v6);
  if ([v5 isSystemPhotoLibraryPathManager])
  {
    id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v8 = [v7 dictionaryForKey:@"search.coreSpotlight.universalSearchEligibility"];
    id v9 = (void *)[v8 mutableCopy];

    id v10 = [v9 objectForKeyedSubscript:@"search.coreSpotlight.needsSpotlightIndexRebuild"];
    LODWORD(v8) = [v10 BOOLValue];

    if (v8)
    {
      id v11 = PLSearchBackendDonationsGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Detected request to rebuild the search index due to prior universal search eligibility change", buf, 2u);
      }

      char v12 = +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:v5];
      unint64_t v13 = (void *)[v12 mutableCopy];

      [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"search.coreSpotlight.needsReindexing"];
      id v14 = (void *)[v13 copy];
      int v15 = [v6 _writeProgressToDisk:v14 forPhotoLibraryPathManager:v5];

      if (v15)
      {
        [v9 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"search.coreSpotlight.needsSpotlightIndexRebuild"];
        os_log_type_t v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        uint64_t v17 = (void *)[v9 copy];
        [v16 setObject:v17 forKey:@"search.coreSpotlight.universalSearchEligibility"];
      }
    }
  }
  unint64_t v18 = +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:v5];
  uint64_t v19 = [v18 objectForKeyedSubscript:@"search.coreSpotlight.needsReindexing"];
  char v20 = [v19 BOOLValue];

  if (v20)
  {
    id v21 = [v18 objectForKeyedSubscript:@"search.coreSpotlight.reindexFailureCount"];
    uint64_t v22 = [v21 unsignedIntegerValue];

    if (v22)
    {
      uint64_t v23 = [v18 objectForKeyedSubscript:@"search.coreSpotlight.reindexRetryDate"];
      BOOL v24 = +[PLSpotlightProgressManager _shouldRetryReindexWithScheduledDateOf:v23];
    }
    else
    {
      BOOL v24 = 1;
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  objc_sync_exit(v6);
  return v24;
}

+ (BOOL)setSpotlightIndexNeedsReindexing:(BOOL)a3 forPhotoLibraryPathManager:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (!v7)
  {
    os_log_type_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 167, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
  }
  id v8 = a1;
  objc_sync_enter(v8);
  id v9 = +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:v7];
  id v10 = v9;
  if (v9) {
    id v11 = (id)[v9 mutableCopy];
  }
  else {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  char v12 = v11;
  if (v4)
  {
    [v11 setObject:0 forKeyedSubscript:@"search.coreSpotlight.itemsToDonate"];
    [v12 setObject:0 forKeyedSubscript:@"search.coreSpotlight.itemsToDelete"];
  }
  unint64_t v13 = [NSNumber numberWithBool:v4];
  [v12 setObject:v13 forKeyedSubscript:@"search.coreSpotlight.needsReindexing"];

  id v14 = (void *)[v12 copy];
  LOBYTE(v13) = +[PLSpotlightProgressManager _writeProgressToDisk:v14 forPhotoLibraryPathManager:v7];

  objc_sync_exit(v8);
  return (char)v13;
}

+ (BOOL)spotlightResetOperationCompletedForPhotoLibraryPathManager:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    char v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 136, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
  }
  id v8 = a1;
  objc_sync_enter(v8);
  id v9 = +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:v7];
  id v10 = [v9 objectForKeyedSubscript:@"search.coreSpotlight.reindexFailureCount"];
  uint64_t v11 = [v10 unsignedIntegerValue];

  if (!v4)
  {
    unint64_t v13 = +[PLSpotlightProgressManager _minimumScheduledDateForNextReindexRetry];
    uint64_t v12 = v11 + 1;
    if (v9) {
      goto LABEL_5;
    }
LABEL_7:
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    goto LABEL_8;
  }
  uint64_t v12 = 0;
  unint64_t v13 = 0;
  if (!v9) {
    goto LABEL_7;
  }
LABEL_5:
  id v14 = (id)[v9 mutableCopy];
LABEL_8:
  int v15 = v14;
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:v12];
  [v15 setObject:v16 forKeyedSubscript:@"search.coreSpotlight.reindexFailureCount"];

  [v15 setObject:v13 forKeyedSubscript:@"search.coreSpotlight.reindexRetryDate"];
  uint64_t v17 = (void *)[v15 copy];
  LOBYTE(v16) = +[PLSpotlightProgressManager _writeProgressToDisk:v17 forPhotoLibraryPathManager:v7];

  BOOL v18 = v16 & +[PLSpotlightProgressManager setSpotlightIndexNeedsReindexing:!v4 forPhotoLibraryPathManager:v7];
  objc_sync_exit(v8);

  return v18;
}

+ (BOOL)removeSearchableItemIdentifiers:(id)a3 forPhotoLibraryPathManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 99, @"Invalid parameter not satisfying: %@", @"searchableItemIdentifiers" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 100, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

LABEL_3:
  id v10 = a1;
  objc_sync_enter(v10);
  if ([v7 count])
  {
    uint64_t v11 = +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:v9];
    if (v11)
    {
      v32 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
      uint64_t v12 = [v11 objectForKeyedSubscript:@"search.coreSpotlight.itemsToDonate"];
      unint64_t v13 = (void *)v12;
      id v14 = (void *)MEMORY[0x1E4F1CBF0];
      if (v12) {
        int v15 = (void *)v12;
      }
      else {
        int v15 = (void *)MEMORY[0x1E4F1CBF0];
      }
      id v16 = v15;

      uint64_t v31 = v16;
      uint64_t v17 = [MEMORY[0x1E4F1CA80] setWithArray:v16];
      [v17 minusSet:v32];
      uint64_t v18 = [v11 objectForKeyedSubscript:@"search.coreSpotlight.itemsToDelete"];
      uint64_t v19 = (void *)v18;
      if (v18) {
        char v20 = (void *)v18;
      }
      else {
        char v20 = v14;
      }
      id v21 = v20;

      uint64_t v22 = [MEMORY[0x1E4F1CA80] setWithArray:v21];
      [v22 minusSet:v32];
      uint64_t v23 = (void *)[v11 mutableCopy];
      BOOL v24 = [v17 allObjects];
      [v23 setObject:v24 forKeyedSubscript:@"search.coreSpotlight.itemsToDonate"];

      uint64_t v25 = [v22 allObjects];
      [v23 setObject:v25 forKeyedSubscript:@"search.coreSpotlight.itemsToDelete"];

      long long v26 = (void *)[v23 copy];
      BOOL v27 = +[PLSpotlightProgressManager _writeProgressToDisk:v26 forPhotoLibraryPathManager:v9];
    }
    else
    {
      BOOL v27 = 1;
    }
  }
  else
  {
    BOOL v27 = 1;
  }
  objc_sync_exit(v10);

  return v27;
}

+ (BOOL)addSearchableItemIdentifiers:(id)a3 forOperationType:(unint64_t)a4 forPhotoLibraryPathManager:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    int v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 88, @"Invalid parameter not satisfying: %@", @"operationType != PLSpotlightOperationTypeUndefined" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
LABEL_7:
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 89, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    goto LABEL_4;
  }
  id v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 87, @"Invalid parameter not satisfying: %@", @"searchableItemIdentifiers" object file lineNumber description];

  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v10) {
    goto LABEL_7;
  }
LABEL_4:
  id v11 = a1;
  objc_sync_enter(v11);
  BOOL v12 = +[PLSpotlightProgressManager _addSearchableItemIdentifiers:v9 operationType:a4 forPhotoLibraryPathManager:v10 isRetry:0];
  objc_sync_exit(v11);

  return v12;
}

+ (BOOL)spotlightOperationCompletedForOperationType:(unint64_t)a3 withSearchableIdentifiers:(id)a4 forPhotoLibraryPathManager:(id)a5 success:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a4;
  id v12 = a5;
  if (a3)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 51, @"Invalid parameter not satisfying: %@", @"searchableItemIdentifiers" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_18;
  }
  BOOL v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 50, @"Invalid parameter not satisfying: %@", @"operationType != PLSpotlightOperationTypeUndefined" object file lineNumber description];

  if (!v11) {
    goto LABEL_17;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_18:
  long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, a1, @"PLSpotlightProgressManager.m", 52, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

LABEL_4:
  id v13 = a1;
  objc_sync_enter(v13);
  if (v6)
  {
    id v14 = +[PLSpotlightProgressManager _updateFailureCountsForSearchableItemIdentifiers:v11 shouldIncrementCounts:0 forPhotoLibraryPathManager:v12];
    int v15 = +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:v12];
    id v16 = (void *)[v15 mutableCopy];
    uint64_t v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    char v20 = v18;

    [v20 setObject:v14 forKeyedSubscript:@"search.coreSpotlight.itemFailureCounts"];
    [v20 setObject:&unk_1EEBED530 forKeyedSubscript:@"search.coreSpotlight.requestFailureCount"];
    if (a3 == 2)
    {
      id v21 = [MEMORY[0x1E4F1C9C8] date];
      [v20 setObject:v21 forKeyedSubscript:@"search.corespotlight.lastDeletionDate"];
    }
    else
    {
      if (a3 != 1)
      {
LABEL_14:
        uint64_t v22 = (void *)[v20 copy];
        BOOL v19 = +[PLSpotlightProgressManager _writeProgressToDisk:v22 forPhotoLibraryPathManager:v12];

        goto LABEL_15;
      }
      id v21 = [MEMORY[0x1E4F1C9C8] date];
      [v20 setObject:v21 forKeyedSubscript:@"search.corespotlight.lastDonationDate"];
    }

    goto LABEL_14;
  }
  BOOL v19 = +[PLSpotlightProgressManager _addSearchableItemIdentifiers:v11 operationType:a3 forPhotoLibraryPathManager:v12 isRetry:1];
LABEL_15:
  objc_sync_exit(v13);

  return v19;
}

@end