@interface PLAggdLogging
+ (id)_analyticsDescriptionForAssetCount:(int64_t)a3;
+ (id)_analyticsDescriptionForMediaAge:(double)a3;
+ (id)_fetchPersistentHistoryStatsWithLibraryPathManager:(id)a3;
+ (void)_addDistributionStatisticsOfValues:(id)a3 withPrefix:(id)a4 toDictionary:(id)a5 formatter:(id)a6;
+ (void)_addFileSystemStatsToLibrarySummaryEvent:(id)a3 withLibraryPathManager:(id)a4;
+ (void)_addLibrarySummaryDataToCollectionIfPresent:(id)a3 fromCPLEventData:(id)a4 forKey:(id)a5;
+ (void)_addOrphanedSceneClassificationsCountToLibrarySummaryEvent:(id)a3 withContext:(id)a4;
+ (void)_addPersistentHistoryStatsToLibrarySummaryEvent:(id)a3 withLibraryPathManager:(id)a4;
+ (void)_addPrefix:(id)a3 toKeysInDictionary:(id)a4 inPrefixedDictionary:(id)a5;
+ (void)_configureEnumeratorForLibrarySummaryLogging:(id)a3 cloudPhotoLibraryEnabled:(BOOL)a4 dataForCA:(id)a5 libraryServicesManager:(id)a6;
+ (void)_configureEnumeratorForSyndicationLibrarySummaryLogging:(id)a3 dataForCA:(id)a4;
+ (void)configureEnumeratorForHyperionLocalResourcesLogging:(id)a3 cloudPhotoLibraryEnabled:(BOOL)a4 dataForCA:(id)a5 dataForCK:(id)a6;
+ (void)configureEnumeratorForLibrarySizeLogging:(id)a3 cloudPhotoLibraryEnabled:(BOOL)a4 dataForCA:(id)a5 dataForCK:(id)a6;
+ (void)configureEnumeratorForLibrarySummaryForLibraryEnumerator:(id)a3 withSyndicationLibraryEnumerator:(id)a4 cloudPhotoLibraryEnabled:(BOOL)a5 dataForCA:(id)a6 libraryServicesManager:(id)a7;
+ (void)performCMMSummaryLogging:(id)a3 cloudPhotoLibraryEnabled:(BOOL)a4;
+ (void)performLibraryStatisticsLoggingForLibrary:(id)a3 completionHandler:(id)a4;
+ (void)performMomentsStatisticsLogging:(id)a3;
+ (void)performSlideshowProjectStatisticsLogging:(id)a3;
@end

@implementation PLAggdLogging

+ (void)_addOrphanedSceneClassificationsCountToLibrarySummaryEvent:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__PLAggdLogging__addOrphanedSceneClassificationsCountToLibrarySummaryEvent_withContext___block_invoke;
  v9[3] = &unk_1E5875E18;
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  [v8 performBlockAndWait:v9];
}

void __88__PLAggdLogging__addOrphanedSceneClassificationsCountToLibrarySummaryEvent_withContext___block_invoke(uint64_t a1)
{
  v3 = [[PLGlobalValues alloc] initWithManagedObjectContext:*(void *)(a1 + 32)];
  v2 = [(PLGlobalValues *)v3 orphanedSceneClassificationsCount];
  if (v2) {
    [*(id *)(a1 + 40) setObject:v2 forKeyedSubscript:*MEMORY[0x1E4F8BF28]];
  }
}

+ (void)_addFileSystemStatsToLibrarySummaryEvent:(id)a3 withLibraryPathManager:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F8B8F8];
  id v7 = [a4 libraryURL];
  id v8 = [v6 capabilitiesWithURL:v7];

  if (v8)
  {
    v12[0] = *MEMORY[0x1E4F8BE78];
    v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isInternalVolume"));
    v13[0] = v9;
    v12[1] = *MEMORY[0x1E4F8BE80];
    id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isNetworkVolume"));
    v13[1] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

    [v5 addEntriesFromDictionary:v11];
  }
}

+ (id)_fetchPersistentHistoryStatsWithLibraryPathManager:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 photosDatabasePath];
  id v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Gathering persistent history statistics from databasePath: %@", (uint8_t *)&v13, 0xCu);
  }

  id v6 = (void *)MEMORY[0x1E4F8B9C0];
  id v7 = [v3 capabilities];

  id v8 = [v6 openDatabaseAtPath:v4 capabilities:v7];

  if (v8)
  {
    v9 = +[PLPersistentHistoryStats statsFromDatabase:v8];
    if (!v9)
    {
      id v10 = PLBackendGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        v14 = v4;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Unable to retrieve history stats from database at path: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    [v8 close];
  }
  else
  {
    id v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Unable to open database at path: %@", (uint8_t *)&v13, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

+ (void)_addPersistentHistoryStatsToLibrarySummaryEvent:(id)a3 withLibraryPathManager:(id)a4
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 _fetchPersistentHistoryStatsWithLibraryPathManager:a4];
  id v8 = v7;
  if (v7)
  {
    v16[0] = *MEMORY[0x1E4F8BF50];
    v9 = NSNumber;
    [v7 persistentHistoryPageCountPercent];
    id v10 = objc_msgSend(v9, "numberWithDouble:");
    v17[0] = v10;
    v16[1] = *MEMORY[0x1E4F8BF48];
    id v11 = NSNumber;
    [v8 persistentHistoryPageCountPercentOfPayload];
    v12 = objc_msgSend(v11, "numberWithDouble:");
    v17[1] = v12;
    v16[2] = *MEMORY[0x1E4F8BF58];
    int v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "transactionCount"));
    v17[2] = v13;
    v16[3] = *MEMORY[0x1E4F8BF40];
    v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "daysSinceEarliestTransaction"));
    v17[3] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

    [v6 addEntriesFromDictionary:v15];
  }
}

+ (void)performLibraryStatisticsLoggingForLibrary:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke;
  v25[3] = &unk_1E586FFA8;
  id v27 = a1;
  id v8 = v6;
  id v26 = v8;
  uint64_t v9 = MEMORY[0x19F38D650](v25);
  id v10 = (void *)v9;
  if (v7)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke_2;
    v19[3] = &unk_1E58742F0;
    id v11 = (id *)&v21;
    uint64_t v21 = v9;
    v12 = &v20;
    id v13 = v8;
    id v20 = v13;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke_3;
    v17[3] = &unk_1E5875198;
    id v18 = v7;
    id v14 = v10;
    [v13 performBlock:v19 completionHandler:v17];
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke_327;
    v22[3] = &unk_1E58742F0;
    id v11 = (id *)&v24;
    uint64_t v24 = v9;
    v12 = &v23;
    id v15 = v8;
    id v23 = v15;
    id v16 = v10;
    [v15 performBlock:v22];
  }
}

void __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 managedObjectContext];
  v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Library statistics logging: starting...", v5, 2u);
  }

  [*(id *)(a1 + 40) performMomentsStatisticsLogging:v3];
  [*(id *)(a1 + 40) performSlideshowProjectStatisticsLogging:v3];
  objc_msgSend(*(id *)(a1 + 40), "performCMMSummaryLogging:cloudPhotoLibraryEnabled:", v3, objc_msgSend(*(id *)(a1 + 32), "isCloudPhotoLibraryEnabled"));
}

uint64_t __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke_327(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)performCMMSummaryLogging:(id)a3 cloudPhotoLibraryEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = +[PLMomentShare entityName];
  uint64_t v9 = [v7 fetchRequestWithEntityName:v8];

  [v9 setResultType:2];
  [v9 setPropertiesToFetch:&unk_1EEBF21C8];
  id v60 = 0;
  id v10 = [v6 executeFetchRequest:v9 error:&v60];
  id v11 = v60;
  if (v11 || !v10)
  {
    v34 = PLBackendGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = NSStringFromSelector(a2);
      v36 = +[PLMomentShare entityName];
      *(_DWORD *)buf = 138412802;
      v62 = v35;
      __int16 v63 = 2112;
      v64 = v36;
      __int16 v65 = 2112;
      id v66 = v11;
      _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "%@ failed to fetch counts for %@ %@", buf, 0x20u);
    }
  }
  else
  {
    v47 = v10;
    v48 = v9;
    id v49 = v6;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v69 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      unint64_t v15 = 0;
      unint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v16 = 0;
      unint64_t v17 = 0;
      uint64_t v18 = *(void *)v57;
      BOOL v51 = !v4;
      uint64_t v50 = v4;
      id obj = v12;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          uint64_t v20 = v16;
          if (*(void *)v57 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x19F38D3B0]();
          id v23 = [v21 objectForKeyedSubscript:@"assetCount"];
          uint64_t v24 = [v23 unsignedIntegerValue];

          v25 = [v21 objectForKeyedSubscript:@"status"];
          __int16 v26 = [v25 unsignedIntegerValue];

          if (v26 == 1)
          {
            ++v17;
            v15 += v24;
            uint64_t v16 = v20;
          }
          else
          {
            uint64_t v16 = v20;
            if ((v26 & 0xFFFE) == 2)
            {
              uint64_t v16 = v20 + v51;
              v53 += v50;
              v52 += v24;
            }
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v56 objects:v69 count:16];
      }
      while (v14);

      BOOL v27 = v17 != 0;
      BOOL v28 = v53 != 0;
      BOOL v29 = v16 != 0;
      unint64_t v30 = v15 / v17;
      BOOL v31 = v15 == 0;
      uint64_t v32 = v53;
      if (v31) {
        unint64_t v30 = 0;
      }
      id obja = (id)v30;
      if (v52) {
        unint64_t v33 = v52 / (v53 + v16);
      }
      else {
        unint64_t v33 = 0;
      }
    }
    else
    {

      id obja = 0;
      uint64_t v16 = 0;
      uint64_t v32 = 0;
      unint64_t v17 = 0;
      BOOL v27 = 0;
      BOOL v28 = 0;
      BOOL v29 = 0;
      unint64_t v33 = 0;
    }
    BOOL v37 = v29;
    BOOL v38 = v28;
    v67[0] = *MEMORY[0x1E4F8BB98];
    v34 = [NSNumber numberWithUnsignedInteger:v27];
    v68[0] = v34;
    v67[1] = *MEMORY[0x1E4F8BB88];
    v39 = [NSNumber numberWithUnsignedInteger:v38];
    v68[1] = v39;
    v67[2] = *MEMORY[0x1E4F8BB90];
    v40 = [NSNumber numberWithUnsignedInteger:v37];
    v68[2] = v40;
    v67[3] = *MEMORY[0x1E4F8BBB0];
    v41 = [NSNumber numberWithUnsignedInteger:v17];
    v68[3] = v41;
    v67[4] = *MEMORY[0x1E4F8BBA0];
    v42 = [NSNumber numberWithUnsignedInteger:v32];
    v68[4] = v42;
    v67[5] = *MEMORY[0x1E4F8BBA8];
    v43 = [NSNumber numberWithUnsignedInteger:v16];
    v68[5] = v43;
    v67[6] = *MEMORY[0x1E4F8BB80];
    v44 = [NSNumber numberWithInteger:obja];
    v68[6] = v44;
    v67[7] = *MEMORY[0x1E4F8BB78];
    v45 = [NSNumber numberWithInteger:v33];
    v68[7] = v45;
    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:8];
    PLSendCoreAnalyticEvent();

    uint64_t v9 = v48;
    id v6 = v49;
    id v11 = 0;
    id v10 = v47;
  }
}

+ (void)_configureEnumeratorForLibrarySummaryLogging:(id)a3 cloudPhotoLibraryEnabled:(BOOL)a4 dataForCA:(id)a5 libraryServicesManager:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v35 = a6;
  if (!v10)
  {
    BOOL v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"PLAggdLogging.m", 811, @"Invalid parameter not satisfying: %@", @"enumerator" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, a1, @"PLAggdLogging.m", 812, @"Invalid parameter not satisfying: %@", @"dataForCA" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  id v12 = [v10 sourceContext];
  uint64_t v13 = [v12 pathManager];
  uint64_t v14 = [v13 libraryURL];
  unint64_t v15 = objc_alloc_init(PLAnalyticsLibraryCounters);
  id v16 = a1;
  unint64_t v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-7776000.0];
  uint64_t v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2592000.0];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke;
  v53[3] = &unk_1E586FE90;
  v19 = v15;
  v54 = v19;
  id v55 = v17;
  id v56 = v18;
  id v33 = v18;
  id v20 = v17;
  [v10 addAssetVisitor:v53];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_2;
  v51[3] = &unk_1E586FEE0;
  uint64_t v21 = v19;
  unint64_t v52 = v21;
  [v10 addFaceVisitor:v51];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_3;
  v49[3] = &unk_1E586FF08;
  v22 = v21;
  uint64_t v50 = v22;
  [v10 addResourceVisitor:v49];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_4;
  v47[3] = &unk_1E586FF30;
  id v23 = v22;
  v48 = v23;
  [v10 addAlbumVisitor:v47];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_5;
  v45[3] = &unk_1E586FF58;
  uint64_t v24 = v23;
  v46 = v24;
  [v10 addPersonVisitor:v45];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_6;
  v36[3] = &unk_1E586FF80;
  BOOL v44 = a4;
  id v37 = v12;
  BOOL v38 = v24;
  id v39 = v14;
  id v40 = v35;
  id v41 = v11;
  id v42 = v13;
  id v43 = v16;
  id v25 = v13;
  id v26 = v11;
  id v27 = v35;
  id v28 = v14;
  BOOL v29 = v24;
  id v30 = v12;
  [v10 addEndOfListVisitor:v36];
}

void __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 8), 1uLL);
  id v63 = v3;
  if ([v3 isInTrash]) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 24), 1uLL);
  }
  if ([v63 isPhoto])
  {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 32), 1uLL);
    if ([v63 isPhotoIris]) {
      atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 40), 1uLL);
    }
    BOOL v4 = (void *)MEMORY[0x1E4F8CDF8];
    id v5 = [v63 uniformTypeIdentifier];
    id v6 = [v4 typeWithIdentifier:v5];

    if ([v63 isJPEG])
    {
      uint64_t v7 = 72;
    }
    else if ([v63 isRAW])
    {
      uint64_t v7 = 80;
    }
    else if ([v6 conformsToType:*MEMORY[0x1E4F443E8]])
    {
      uint64_t v7 = 88;
    }
    else
    {
      int v13 = [v6 conformsToType:*MEMORY[0x1E4F443E0]];
      uint64_t v7 = 64;
      if (v13) {
        uint64_t v7 = 88;
      }
    }
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + v7), 1uLL);
    if ([v63 hasAdjustments])
    {
      int v14 = [v63 depthType];
      uint64_t v15 = 152;
      if (v14 == 1) {
        uint64_t v15 = 144;
      }
      atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + v15), 1uLL);
    }

    goto LABEL_24;
  }
  int v8 = [v63 isVideo];
  uint64_t v9 = *(void *)(a1 + 32);
  if (!v8)
  {
    atomic_fetch_add((atomic_ullong *volatile)(v9 + 56), 1uLL);
LABEL_24:
    id v11 = v63;
    goto LABEL_25;
  }
  atomic_fetch_add((atomic_ullong *volatile)(v9 + 48), 1uLL);
  int v10 = [v63 hasAdjustments];
  id v11 = v63;
  if (v10)
  {
    char v12 = [v63 isDefaultAdjustedSlomo];
    id v11 = v63;
    if ((v12 & 1) == 0) {
      atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 152), 1uLL);
    }
  }
LABEL_25:
  if ([v11 isFavorite]) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 120), 1uLL);
  }
  if ([v63 kindSubtype] == 10) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 136), 1uLL);
  }
  [v63 curationScore];
  if (v16 != 0.0 && v16 < 0.5) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 128), 1uLL);
  }
  if (!atomic_load((unint64_t *)(*(void *)(a1 + 32) + 96)))
  {
    uint64_t v18 = [v63 addedDate];
    BOOL IsGreaterThanOrEqual = PLDateIsGreaterThanOrEqual(v18, *(void **)(a1 + 40));

    if (IsGreaterThanOrEqual) {
      atomic_store(1uLL, (unint64_t *)(*(void *)(a1 + 32) + 96));
    }
  }
  id v20 = [v63 addedDate];
  BOOL v21 = PLDateIsGreaterThanOrEqual(v20, *(void **)(a1 + 48));

  if (v21) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 160), 1uLL);
  }
  v22 = [v63 additionalAttributes];
  int v23 = [v22 importedBy];

  uint64_t v24 = v63;
  if (v23)
  {
    id v25 = [v63 additionalAttributes];
    if ([v25 importedBy] == 2)
    {

      uint64_t v24 = v63;
    }
    else
    {
      id v26 = [v63 additionalAttributes];
      int v27 = [v26 importedBy];

      uint64_t v24 = v63;
      if (v27 != 1)
      {
LABEL_42:
        atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 112), 1uLL);
        goto LABEL_43;
      }
    }
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 104), 1uLL);
    goto LABEL_42;
  }
LABEL_43:
  if ([v24 cameraProcessingAdjustmentState]
    && ([v63 cameraProcessingAdjustmentState] & 8) != 0)
  {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 168), 1uLL);
  }
  id v28 = [v63 additionalAttributes];
  uint64_t v29 = [v28 syndicationIdentifier];
  if (!v29)
  {

    uint64_t v32 = v63;
    goto LABEL_57;
  }
  id v30 = (void *)v29;
  [MEMORY[0x1E4F8BA10] maskForUserLibrary];
  [v63 savedAssetType];
  int v31 = PLValidatedSavedAssetTypeApplies();

  uint64_t v32 = v63;
  if (!v31) {
    goto LABEL_57;
  }
  id v33 = [v63 additionalAttributes];
  v34 = [v33 importedByBundleIdentifier];
  int v35 = [v34 isEqualToString:@"com.apple.MobileSMS"];

  if (v35)
  {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 416), 1uLL);
    v36 = [v63 additionalAttributes];
    int v37 = [v36 syndicationHistory];

    uint64_t v32 = v63;
    if (v37 != 2) {
      goto LABEL_57;
    }
    BOOL v38 = (atomic_ullong *)(*(void *)(a1 + 32) + 432);
  }
  else
  {
    id v39 = [v63 additionalAttributes];
    id v40 = [v39 importedByBundleIdentifier];
    if ([v40 isEqualToString:@"com.apple.mobileslideshow"])
    {

      uint64_t v32 = v63;
    }
    else
    {
      id v41 = [v63 additionalAttributes];
      id v42 = [v41 importedByBundleIdentifier];
      int v43 = [v42 isEqualToString:@"com.apple.Photos"];

      uint64_t v32 = v63;
      if (!v43) {
        goto LABEL_57;
      }
    }
    BOOL v38 = (atomic_ullong *)(*(void *)(a1 + 32) + 424);
  }
  atomic_fetch_add(v38, 1uLL);
LABEL_57:
  BOOL v44 = [v32 detectedFaces];
  uint64_t v45 = [v44 count];

  if (v45) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 176), 1uLL);
  }
  v46 = [v63 mediaAnalysisAttributes];
  v47 = [v46 characterRecognitionAttributes];

  if (!v47) {
    goto LABEL_64;
  }
  v48 = [v47 characterRecognitionData];
  if (!v48)
  {
    id v49 = [v47 machineReadableCodeData];

    if (v49) {
      goto LABEL_63;
    }
LABEL_64:
    if (!v45) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }

LABEL_63:
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 184), 1uLL);
LABEL_65:
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 192), 1uLL);
LABEL_66:
  if ([v63 duplicateAssetVisibilityState] == 100) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 240), 1uLL);
  }
  int v50 = [v63 hasLibraryScope];
  uint64_t v51 = *(void *)(a1 + 32);
  if (!v50)
  {
    id v55 = (atomic_ullong *)(v51 + 232);
    uint64_t v53 = v63;
    goto LABEL_79;
  }
  atomic_fetch_add((atomic_ullong *volatile)(v51 + 248), 1uLL);
  uint64_t v52 = [v63 libraryScopeShareState];
  if ((v52 & 0x200000) != 0) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 256), 1uLL);
  }
  if ((v52 & 0x10) != 0 || (v52 & 0x1E) == 2) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 280), 1uLL);
  }
  uint64_t v53 = v63;
  if ((v52 & 0x1C) == 4 || (v52 & 0x18) == 8)
  {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 264), 1uLL);
    __int16 v54 = [v63 importedBy];
    uint64_t v53 = v63;
    if ((unsigned __int16)(v54 - 1) <= 1u)
    {
      id v55 = (atomic_ullong *)(*(void *)(a1 + 32) + 272);
LABEL_79:
      atomic_fetch_add(v55, 1uLL);
    }
  }
  id v56 = [v53 extendedAttributes];
  uint64_t v57 = [v56 longitude];
  if (v57)
  {
    long long v58 = (void *)v57;
    long long v59 = [v63 extendedAttributes];
    id v60 = [v59 latitude];

    v61 = v63;
    if (v60) {
      atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 288), 1uLL);
    }
  }
  else
  {

    v61 = v63;
  }
  int v62 = [v61 savedAssetType];
  if (v62 == [MEMORY[0x1E4F8BA10] savedAssetTypeForFinderSyncedAsset]) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 296), 1uLL);
  }
  if ([v63 spatialType]) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 304), 1uLL);
  }
  if ([v63 spatialType] == 2) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 312), 1uLL);
  }
  if ([v63 currentSleetCast]) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 320), 1uLL);
  }
  if ((int)[v63 currentSleetCast] >= 2) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 328), 1uLL);
  }
}

uint64_t __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_2(uint64_t a1, void *a2)
{
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 208), 1uLL);
  uint64_t result = [a2 isTorsoOnly];
  if (result) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 200), 1uLL);
  }
  return result;
}

uint64_t __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_3(uint64_t result)
{
  return result;
}

void __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 kind];
  uint64_t v4 = [v3 integerValue];

  if (v4 == 1510)
  {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 224), 1uLL);
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 216), [v5 approximateCount]);
  }
}

void __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 336), 1uLL);
  id v18 = v3;
  if ((int)[v3 detectionType] >= 2) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 344), 1uLL);
  }
  int v4 = [v18 verifiedType];
  if (v4 == -2)
  {
    uint64_t v7 = 400;
LABEL_10:
    id v6 = v18;
    goto LABEL_11;
  }
  if (v4 == 2)
  {
    uint64_t v7 = 352;
    goto LABEL_10;
  }
  BOOL v5 = v4 == 1;
  id v6 = v18;
  if (v5)
  {
    uint64_t v7 = 360;
LABEL_11:
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + v7), 1uLL);
  }
  int v8 = [v6 type];
  if (v8 == -1)
  {
    uint64_t v10 = 376;
    uint64_t v9 = v18;
    goto LABEL_17;
  }
  BOOL v5 = v8 == 1;
  uint64_t v9 = v18;
  if (v5)
  {
    uint64_t v10 = 368;
LABEL_17:
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + v10), 1uLL);
  }
  id v11 = [v9 fullName];
  if ([v11 length])
  {
  }
  else
  {
    char v12 = [v18 displayName];
    uint64_t v13 = [v12 length];

    if (!v13) {
      goto LABEL_22;
    }
  }
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 384), 1uLL);
LABEL_22:
  int v14 = [v18 personUri];
  uint64_t v15 = [v14 length];

  if (v15) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 392), 1uLL);
  }
  double v16 = [v18 userFeedbacks];
  uint64_t v17 = [v16 count];

  if (v17) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 408), 1uLL);
  }
}

void __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_6(uint64_t a1)
{
  v348[4] = *MEMORY[0x1E4F143B8];
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  if (*(unsigned char *)(a1 + 88))
  {
    objc_opt_class();
    id v2 = *(id *)(a1 + 32);
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
    id v4 = v3;

    BOOL v5 = objc_msgSend(v4, "pl_libraryBundle");
    id v6 = +[PLCPLSettings settingsWithLibraryBundle:v5];

    if ([v6 isKeepOriginalsEnabled])
    {
      unint64_t v7 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 32));
      unint64_t v8 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 48));
      unint64_t v249 = v8;
      unint64_t v251 = v7;
      unint64_t v9 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 24));
      unint64_t v247 = v9;
      uint64_t v10 = 2;
    }
    else
    {
      unint64_t v247 = 0;
      unint64_t v249 = 0;
      unint64_t v251 = 0;
      uint64_t v10 = 1;
    }
    uint64_t v253 = v10;
  }
  else
  {
    unint64_t v11 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 32));
    unint64_t v251 = v11;
    uint64_t v253 = 0;
    unint64_t v12 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 48));
    unint64_t v13 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 24));
    unint64_t v247 = v13;
    unint64_t v249 = v12;
  }
  if (PLIsAssetsd()
    && [MEMORY[0x1E4F8B980] isSystemPhotoLibraryURL:*(void *)(a1 + 48)])
  {
    unint64_t v14 = [*(id *)(a1 + 56) resourceCacheMetrics];
    unint64_t v16 = v15;
    objc_msgSend(*(id *)(a1 + 56), "setResourceCacheMetrics:", 0, 0);
    uint64_t v17 = *(void **)(a1 + 64);
    v347[0] = *MEMORY[0x1E4F8BE20];
    id v18 = [NSNumber numberWithUnsignedInteger:v14];
    v348[0] = v18;
    v347[1] = *MEMORY[0x1E4F8BE28];
    v19 = [NSNumber numberWithUnsignedInteger:HIDWORD(v14)];
    v348[1] = v19;
    v347[2] = *MEMORY[0x1E4F8BE30];
    id v20 = [NSNumber numberWithUnsignedInteger:v16];
    v348[2] = v20;
    v347[3] = *MEMORY[0x1E4F8BE38];
    BOOL v21 = [NSNumber numberWithUnsignedInteger:HIDWORD(v16)];
    v348[3] = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v348 forKeys:v347 count:4];
    [v17 addEntriesFromDictionary:v22];
  }
  if (_PLIsCloudPhotoLibraryEnabledForCurrentUserWithDataclass((void *)*MEMORY[0x1E4F17570]))
  {
    int v23 = CPLMetricsFromPathManager(*(void **)(a1 + 72));
    uint64_t v24 = *MEMORY[0x1E4F59AA8];
    uint64_t v319 = [v23 countForKey:*MEMORY[0x1E4F59AA8]];
    uint64_t v25 = *MEMORY[0x1E4F59A28];
    uint64_t v311 = [v23 countForKey:*MEMORY[0x1E4F59A28]];
    uint64_t v26 = *MEMORY[0x1E4F59AB0];
    uint64_t v303 = [v23 countForKey:*MEMORY[0x1E4F59AB0]];
    uint64_t v27 = *MEMORY[0x1E4F59A20];
    uint64_t v295 = [v23 countForKey:*MEMORY[0x1E4F59A20]];
    uint64_t v28 = *MEMORY[0x1E4F59A50];
    uint64_t v287 = [v23 countForKey:*MEMORY[0x1E4F59A50]];
    uint64_t v29 = *MEMORY[0x1E4F59A38];
    uint64_t v279 = [v23 countForKey:*MEMORY[0x1E4F59A38]];
    uint64_t v30 = *MEMORY[0x1E4F59A60];
    uint64_t v271 = [v23 countForKey:*MEMORY[0x1E4F59A60]];
    uint64_t v267 = *MEMORY[0x1E4F59A58];
    uint64_t v263 = objc_msgSend(v23, "countForKey:");
    uint64_t v259 = *MEMORY[0x1E4F59A30];
    uint64_t v255 = objc_msgSend(v23, "countForKey:");
    uint64_t v243 = *MEMORY[0x1E4F59A68];
    uint64_t v239 = objc_msgSend(v23, "countForKey:");
    uint64_t v235 = *MEMORY[0x1E4F59A80];
    uint64_t v232 = objc_msgSend(v23, "countForKey:");
    uint64_t v229 = *MEMORY[0x1E4F59AA0];
    uint64_t v226 = objc_msgSend(v23, "countForKey:");
    uint64_t v223 = *MEMORY[0x1E4F59A48];
    uint64_t v220 = objc_msgSend(v23, "countForKey:");
    uint64_t v217 = *MEMORY[0x1E4F59A70];
    uint64_t v214 = objc_msgSend(v23, "countForKey:");
    uint64_t v211 = *MEMORY[0x1E4F59A98];
    uint64_t v208 = objc_msgSend(v23, "countForKey:");
    uint64_t v205 = *MEMORY[0x1E4F59A88];
    uint64_t v202 = objc_msgSend(v23, "countForKey:");
    uint64_t v199 = *MEMORY[0x1E4F59AB8];
    uint64_t v197 = objc_msgSend(v23, "countForKey:");
    uint64_t v195 = *MEMORY[0x1E4F59A40];
    uint64_t v193 = objc_msgSend(v23, "countForKey:");
    uint64_t v191 = *MEMORY[0x1E4F59A78];
    uint64_t v189 = objc_msgSend(v23, "countForKey:");
    uint64_t v187 = *MEMORY[0x1E4F59A90];
    uint64_t v185 = objc_msgSend(v23, "countForKey:");
    v183 = *(void **)(a1 + 64);
    v323 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v24];
    v345[0] = v323;
    v320 = [NSNumber numberWithUnsignedInteger:v319];
    v346[0] = v320;
    v316 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v25];
    v345[1] = v316;
    v312 = [NSNumber numberWithUnsignedInteger:v311];
    v346[1] = v312;
    v308 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v26];
    v345[2] = v308;
    v304 = [NSNumber numberWithUnsignedInteger:v303];
    v346[2] = v304;
    v300 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v27];
    v345[3] = v300;
    v296 = [NSNumber numberWithUnsignedInteger:v295];
    v346[3] = v296;
    v292 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v28];
    v345[4] = v292;
    v288 = [NSNumber numberWithUnsignedInteger:v287];
    v346[4] = v288;
    v284 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v29];
    v345[5] = v284;
    v280 = [NSNumber numberWithUnsignedInteger:v279];
    v346[5] = v280;
    v275 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v30];
    v345[6] = v275;
    v272 = [NSNumber numberWithUnsignedInteger:v271];
    v346[6] = v272;
    v268 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v267];
    v345[7] = v268;
    v264 = [NSNumber numberWithUnsignedInteger:v263];
    v346[7] = v264;
    v260 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v259];
    v345[8] = v260;
    v256 = [NSNumber numberWithUnsignedInteger:v255];
    v346[8] = v256;
    v244 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v243];
    v345[9] = v244;
    v240 = [NSNumber numberWithUnsignedInteger:v239];
    v346[9] = v240;
    v236 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v235];
    v345[10] = v236;
    v233 = [NSNumber numberWithUnsignedInteger:v232];
    v346[10] = v233;
    v230 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v229];
    v345[11] = v230;
    v227 = [NSNumber numberWithUnsignedInteger:v226];
    v346[11] = v227;
    v224 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v223];
    v345[12] = v224;
    v221 = [NSNumber numberWithUnsignedInteger:v220];
    v346[12] = v221;
    v218 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v217];
    v345[13] = v218;
    v215 = [NSNumber numberWithUnsignedInteger:v214];
    v346[13] = v215;
    v212 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v211];
    v345[14] = v212;
    v209 = [NSNumber numberWithUnsignedInteger:v208];
    v346[14] = v209;
    v206 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v205];
    v345[15] = v206;
    v203 = [NSNumber numberWithUnsignedInteger:v202];
    v346[15] = v203;
    v200 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v199];
    v345[16] = v200;
    int v31 = [NSNumber numberWithUnsignedInteger:v197];
    v346[16] = v31;
    uint64_t v32 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v195];
    v345[17] = v32;
    id v33 = [NSNumber numberWithUnsignedInteger:v193];
    v346[17] = v33;
    v34 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v191];
    v345[18] = v34;
    int v35 = [NSNumber numberWithUnsignedInteger:v189];
    v346[18] = v35;
    v36 = [NSString stringWithFormat:@"%@%@", @"iCPLSyncSession", v187];
    v345[19] = v36;
    int v37 = [NSNumber numberWithUnsignedInteger:v185];
    v346[19] = v37;
    BOOL v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v346 forKeys:v345 count:20];
    [v183 addEntriesFromDictionary:v38];

    uint64_t v39 = *MEMORY[0x1E4F59A00];
    uint64_t v40 = [v23 countForKey:*MEMORY[0x1E4F59A00]];
    uint64_t v41 = *MEMORY[0x1E4F59A10];
    uint64_t v313 = [v23 countForKey:*MEMORY[0x1E4F59A10]];
    uint64_t v42 = *MEMORY[0x1E4F59A08];
    uint64_t v305 = [v23 countForKey:*MEMORY[0x1E4F59A08]];
    uint64_t v43 = *MEMORY[0x1E4F59A18];
    uint64_t v297 = [v23 countForKey:*MEMORY[0x1E4F59A18]];
    uint64_t v44 = *MEMORY[0x1E4F599F8];
    uint64_t v289 = [v23 countForKey:*MEMORY[0x1E4F599F8]];
    uint64_t v45 = *MEMORY[0x1E4F599D8];
    uint64_t v281 = [v23 countForKey:*MEMORY[0x1E4F599D8]];
    uint64_t v276 = *MEMORY[0x1E4F599E8];
    uint64_t v273 = objc_msgSend(v23, "countForKey:");
    uint64_t v269 = *MEMORY[0x1E4F599E0];
    uint64_t v265 = objc_msgSend(v23, "countForKey:");
    uint64_t v261 = *MEMORY[0x1E4F599F0];
    uint64_t v257 = objc_msgSend(v23, "countForKey:");
    uint64_t v245 = *MEMORY[0x1E4F599D0];
    uint64_t v241 = objc_msgSend(v23, "countForKey:");
    v237 = *(void **)(a1 + 64);
    v324 = [NSString stringWithFormat:@"%@%@", @"iCPLComputeSync", v39];
    v343[0] = v324;
    v321 = [NSNumber numberWithUnsignedInteger:v40];
    v344[0] = v321;
    v317 = [NSString stringWithFormat:@"%@%@", @"iCPLComputeSync", v41];
    v343[1] = v317;
    v314 = [NSNumber numberWithUnsignedInteger:v313];
    v344[1] = v314;
    v309 = [NSString stringWithFormat:@"%@%@", @"iCPLComputeSync", v42];
    v343[2] = v309;
    v306 = [NSNumber numberWithUnsignedInteger:v305];
    v344[2] = v306;
    v301 = [NSString stringWithFormat:@"%@%@", @"iCPLComputeSync", v43];
    v343[3] = v301;
    v298 = [NSNumber numberWithUnsignedInteger:v297];
    v344[3] = v298;
    v293 = [NSString stringWithFormat:@"%@%@", @"iCPLComputeSync", v44];
    v343[4] = v293;
    v290 = [NSNumber numberWithUnsignedInteger:v289];
    v344[4] = v290;
    v285 = [NSString stringWithFormat:@"%@%@", @"iCPLComputeSync", v45];
    v343[5] = v285;
    v282 = [NSNumber numberWithUnsignedInteger:v281];
    v344[5] = v282;
    v277 = [NSString stringWithFormat:@"%@%@", @"iCPLComputeSync", v276];
    v343[6] = v277;
    v46 = [NSNumber numberWithUnsignedInteger:v273];
    v344[6] = v46;
    v47 = [NSString stringWithFormat:@"%@%@", @"iCPLComputeSync", v269];
    v343[7] = v47;
    v48 = [NSNumber numberWithUnsignedInteger:v265];
    v344[7] = v48;
    id v49 = [NSString stringWithFormat:@"%@%@", @"iCPLComputeSync", v261];
    v343[8] = v49;
    int v50 = [NSNumber numberWithUnsignedInteger:v257];
    v344[8] = v50;
    uint64_t v51 = [NSString stringWithFormat:@"%@%@", @"iCPLComputeSync", v245];
    v343[9] = v51;
    uint64_t v52 = [NSNumber numberWithUnsignedInteger:v241];
    v344[9] = v52;
    uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v344 forKeys:v343 count:10];
    [v237 addEntriesFromDictionary:v53];

    [v23 resetMetrics];
  }
  if (atomic_load((unint64_t *)(*(void *)(a1 + 40) + 104)))
  {
    unint64_t v55 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 112));
    unint64_t v56 = 0x1E4F28000uLL;
    if (v55)
    {
      unint64_t v57 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 104));
      double v58 = (double)v57 * 100.0;
      unint64_t v59 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 112));
      unint64_t v60 = vcvtad_u64_f64(v58 / (double)v59);
    }
    else
    {
      unint64_t v60 = 100;
    }
  }
  else
  {
    unint64_t v60 = 0;
    unint64_t v56 = 0x1E4F28000;
  }
  uint64_t v335 = 0;
  v336 = (double *)&v335;
  uint64_t v337 = 0x2020000000;
  uint64_t v338 = 0;
  uint64_t v331 = 0;
  v332 = &v331;
  uint64_t v333 = 0x2020000000;
  char v334 = 0;
  if (atomic_load((unint64_t *)(*(void *)(a1 + 40) + 272)))
  {
    int v62 = *(void **)(a1 + 32);
    v326[0] = MEMORY[0x1E4F143A8];
    v326[1] = 3221225472;
    v326[2] = __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_7;
    v326[3] = &unk_1E5874900;
    id v327 = v62;
    v329 = &v331;
    v330 = &v335;
    id v328 = *(id *)(a1 + 40);
    [v327 performBlockAndWait:v326];
    if (*((unsigned char *)v332 + 24))
    {
      unint64_t v63 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 272));
      unint64_t v64 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 264));
      if (v64 <= 4 * v63)
      {
        __int16 v65 = *(void **)(a1 + 64);
        uint64_t v341 = *MEMORY[0x1E4F8C008];
        id v66 = [NSNumber numberWithDouble:v336[3]];
        v342 = v66;
        v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v342 forKeys:&v341 count:1];
        [v65 addEntriesFromDictionary:v67];
      }
    }
  }
  v179 = *(void **)(a1 + 64);
  v339[0] = *MEMORY[0x1E4F8BDF0];
  v68 = *(void **)(v56 + 3792);
  unint64_t v69 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 8));
  v325 = [v68 numberWithUnsignedLongLong:v69];
  v340[0] = v325;
  v339[1] = *MEMORY[0x1E4F8BF78];
  uint64_t v70 = *(void **)(v56 + 3792);
  unint64_t v71 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 32));
  v322 = [v70 numberWithUnsignedLongLong:v71];
  v340[1] = v322;
  v339[2] = *MEMORY[0x1E4F8BEC8];
  v72 = *(void **)(v56 + 3792);
  unint64_t v73 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 40));
  v318 = [v72 numberWithUnsignedLongLong:v73];
  v340[2] = v318;
  v339[3] = *MEMORY[0x1E4F8C068];
  v74 = *(void **)(v56 + 3792);
  unint64_t v75 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 48));
  v315 = [v74 numberWithUnsignedLongLong:v75];
  v340[3] = v315;
  v339[4] = *MEMORY[0x1E4F8C050];
  v76 = *(void **)(v56 + 3792);
  unint64_t v77 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 24));
  v310 = [v76 numberWithUnsignedLongLong:v77];
  v340[4] = v310;
  v339[5] = *MEMORY[0x1E4F8BEB8];
  v78 = *(void **)(v56 + 3792);
  unint64_t v79 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 72));
  v307 = [v78 numberWithUnsignedLongLong:v79];
  v340[5] = v307;
  v339[6] = *MEMORY[0x1E4F8BF88];
  v80 = *(void **)(v56 + 3792);
  unint64_t v81 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 80));
  v302 = [v80 numberWithUnsignedLongLong:v81];
  v340[6] = v302;
  v339[7] = *MEMORY[0x1E4F8BE98];
  v82 = *(void **)(v56 + 3792);
  unint64_t v83 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 88));
  v299 = [v82 numberWithUnsignedLongLong:v83];
  v340[7] = v299;
  v339[8] = *MEMORY[0x1E4F8BF30];
  v84 = *(void **)(v56 + 3792);
  unint64_t v85 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 64));
  v294 = [v84 numberWithUnsignedLongLong:v85];
  v340[8] = v294;
  v339[9] = *MEMORY[0x1E4F8BF38];
  v86 = *(void **)(v56 + 3792);
  unint64_t v87 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 56));
  v291 = [v86 numberWithUnsignedLongLong:v87];
  v340[9] = v291;
  v339[10] = *MEMORY[0x1E4F8BF80];
  v88 = *(void **)(v56 + 3792);
  unint64_t v89 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 144));
  v286 = [v88 numberWithUnsignedLongLong:v89];
  v340[10] = v286;
  v339[11] = *MEMORY[0x1E4F8BDE8];
  v90 = *(void **)(v56 + 3792);
  unint64_t v91 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 152));
  v283 = [v90 numberWithUnsignedLongLong:v91];
  v340[11] = v283;
  v339[12] = *MEMORY[0x1E4F8BEB0];
  v92 = *(void **)(v56 + 3792);
  unint64_t v93 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 96));
  v278 = [v92 numberWithUnsignedLongLong:v93];
  v340[12] = v278;
  v339[13] = *MEMORY[0x1E4F8BE68];
  v94 = *(void **)(v56 + 3792);
  unint64_t v95 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 120));
  v274 = [v94 numberWithUnsignedLongLong:v95];
  v340[13] = v274;
  v339[14] = *MEMORY[0x1E4F8BEC0];
  v96 = *(void **)(v56 + 3792);
  unint64_t v97 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 128));
  v270 = [v96 numberWithUnsignedLongLong:v97];
  v340[14] = v270;
  v339[15] = *MEMORY[0x1E4F8BFF8];
  v98 = *(void **)(v56 + 3792);
  unint64_t v99 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 136));
  v266 = [v98 numberWithUnsignedLongLong:v99];
  v340[15] = v266;
  v339[16] = *MEMORY[0x1E4F8BDD8];
  v100 = *(void **)(v56 + 3792);
  unint64_t v101 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 160));
  v262 = [v100 numberWithUnsignedLongLong:v101];
  v340[16] = v262;
  v339[17] = *MEMORY[0x1E4F8BEA8];
  v258 = [*(id *)(v56 + 3792) numberWithUnsignedInteger:v60];
  v340[17] = v258;
  v339[18] = *MEMORY[0x1E4F8C070];
  v254 = [*(id *)(v56 + 3792) numberWithInteger:v253];
  v340[18] = v254;
  v339[19] = *MEMORY[0x1E4F8C078];
  v252 = [*(id *)(v56 + 3792) numberWithInteger:v251];
  v340[19] = v252;
  v339[20] = *MEMORY[0x1E4F8C088];
  v250 = [*(id *)(v56 + 3792) numberWithInteger:v249];
  v340[20] = v250;
  v339[21] = *MEMORY[0x1E4F8C080];
  v248 = [*(id *)(v56 + 3792) numberWithInteger:v247];
  v340[21] = v248;
  v339[22] = *MEMORY[0x1E4F8BFE0];
  v102 = *(void **)(v56 + 3792);
  unint64_t v103 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 168));
  v246 = [v102 numberWithUnsignedLongLong:v103];
  v340[22] = v246;
  v339[23] = *MEMORY[0x1E4F8C040];
  v104 = *(void **)(v56 + 3792);
  unint64_t v105 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 16));
  v242 = [v104 numberWithUnsignedLongLong:v105];
  v340[23] = v242;
  v339[24] = *MEMORY[0x1E4F8BFF0];
  v106 = *(void **)(v56 + 3792);
  unint64_t v107 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 424));
  v238 = [v106 numberWithUnsignedLongLong:v107];
  v340[24] = v238;
  v339[25] = *MEMORY[0x1E4F8BFE8];
  v108 = *(void **)(v56 + 3792);
  unint64_t v109 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 416));
  v234 = [v108 numberWithUnsignedLongLong:v109];
  v340[25] = v234;
  v339[26] = *MEMORY[0x1E4F8BF10];
  v110 = *(void **)(v56 + 3792);
  unint64_t v111 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 432));
  v231 = [v110 numberWithUnsignedLongLong:v111];
  v340[26] = v231;
  v339[27] = *MEMORY[0x1E4F8BDF8];
  v112 = *(void **)(v56 + 3792);
  unint64_t v113 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 176));
  v228 = [v112 numberWithUnsignedLongLong:v113];
  v340[27] = v228;
  v339[28] = *MEMORY[0x1E4F8BE00];
  v114 = *(void **)(v56 + 3792);
  unint64_t v115 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 184));
  v225 = [v114 numberWithUnsignedLongLong:v115];
  v340[28] = v225;
  v339[29] = *MEMORY[0x1E4F8BE08];
  v116 = *(void **)(v56 + 3792);
  unint64_t v117 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 192));
  v222 = [v116 numberWithUnsignedLongLong:v117];
  v340[29] = v222;
  v339[30] = *MEMORY[0x1E4F8BE10];
  v118 = *(void **)(v56 + 3792);
  unint64_t v119 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 200));
  v219 = [v118 numberWithUnsignedLongLong:v119];
  v340[30] = v219;
  v339[31] = *MEMORY[0x1E4F8BE60];
  v120 = *(void **)(v56 + 3792);
  unint64_t v121 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 208));
  v216 = [v120 numberWithUnsignedLongLong:v121];
  v340[31] = v216;
  v339[32] = *MEMORY[0x1E4F8BE48];
  v122 = *(void **)(v56 + 3792);
  unint64_t v123 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 216));
  v213 = [v122 numberWithUnsignedLongLong:v123];
  v340[32] = v213;
  v339[33] = *MEMORY[0x1E4F8BE50];
  v124 = *(void **)(v56 + 3792);
  unint64_t v125 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 224));
  v210 = [v124 numberWithUnsignedLongLong:v125];
  v340[33] = v210;
  v339[34] = *MEMORY[0x1E4F8BE58];
  v126 = *(void **)(v56 + 3792);
  unint64_t v127 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 240));
  v207 = [v126 numberWithUnsignedLongLong:v127];
  v340[34] = v207;
  v339[35] = *MEMORY[0x1E4F8C000];
  v128 = *(void **)(v56 + 3792);
  unint64_t v129 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 248));
  v204 = [v128 numberWithUnsignedLongLong:v129];
  v340[35] = v204;
  v339[36] = *MEMORY[0x1E4F8BF70];
  v130 = *(void **)(v56 + 3792);
  unint64_t v131 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 232));
  v201 = [v130 numberWithUnsignedLongLong:v131];
  v340[36] = v201;
  v339[37] = *MEMORY[0x1E4F8BEF0];
  v132 = *(void **)(v56 + 3792);
  unint64_t v133 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 256));
  v198 = [v132 numberWithUnsignedLongLong:v133];
  v340[37] = v198;
  v339[38] = *MEMORY[0x1E4F8BDD0];
  v134 = *(void **)(v56 + 3792);
  unint64_t v135 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 264));
  v196 = [v134 numberWithUnsignedLongLong:v135];
  v340[38] = v196;
  v339[39] = *MEMORY[0x1E4F8BDE0];
  v136 = *(void **)(v56 + 3792);
  unint64_t v137 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 280));
  v194 = [v136 numberWithUnsignedLongLong:v137];
  v340[39] = v194;
  v339[40] = *MEMORY[0x1E4F8BEE8];
  v138 = *(void **)(v56 + 3792);
  unint64_t v139 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 288));
  v192 = [v138 numberWithUnsignedLongLong:v139];
  v340[40] = v192;
  v339[41] = *MEMORY[0x1E4F8BE88];
  v140 = *(void **)(v56 + 3792);
  unint64_t v141 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 296));
  v190 = [v140 numberWithUnsignedLongLong:v141];
  v340[41] = v190;
  v339[42] = *MEMORY[0x1E4F8C018];
  v142 = *(void **)(v56 + 3792);
  unint64_t v143 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 304));
  v188 = [v142 numberWithUnsignedLongLong:v143];
  v340[42] = v188;
  v339[43] = *MEMORY[0x1E4F8C010];
  v144 = *(void **)(v56 + 3792);
  unint64_t v145 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 312));
  v186 = [v144 numberWithUnsignedLongLong:v145];
  v340[43] = v186;
  v339[44] = *MEMORY[0x1E4F8C020];
  v146 = *(void **)(v56 + 3792);
  unint64_t v147 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 320));
  v184 = [v146 numberWithUnsignedLongLong:v147];
  v340[44] = v184;
  v339[45] = *MEMORY[0x1E4F8C028];
  v148 = *(void **)(v56 + 3792);
  unint64_t v149 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 328));
  v182 = [v148 numberWithUnsignedLongLong:v149];
  v340[45] = v182;
  v339[46] = *MEMORY[0x1E4F8BF60];
  v150 = *(void **)(v56 + 3792);
  unint64_t v151 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 336));
  v181 = [v150 numberWithUnsignedLongLong:v151];
  v340[46] = v181;
  v339[47] = *MEMORY[0x1E4F8BF68];
  v152 = *(void **)(v56 + 3792);
  unint64_t v153 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 344));
  v180 = [v152 numberWithUnsignedLongLong:v153];
  v340[47] = v180;
  v339[48] = *MEMORY[0x1E4F8BE90];
  v154 = *(void **)(v56 + 3792);
  unint64_t v155 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 352));
  v156 = [v154 numberWithUnsignedLongLong:v155];
  v340[48] = v156;
  v339[49] = *MEMORY[0x1E4F8C060];
  v157 = *(void **)(v56 + 3792);
  unint64_t v158 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 360));
  v159 = [v157 numberWithUnsignedLongLong:v158];
  v340[49] = v159;
  v339[50] = *MEMORY[0x1E4F8BE70];
  v160 = *(void **)(v56 + 3792);
  unint64_t v161 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 368));
  v162 = [v160 numberWithUnsignedLongLong:v161];
  v340[50] = v162;
  v339[51] = *MEMORY[0x1E4F8BEA0];
  v163 = *(void **)(v56 + 3792);
  unint64_t v164 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 376));
  v165 = [v163 numberWithUnsignedLongLong:v164];
  v340[51] = v165;
  v339[52] = *MEMORY[0x1E4F8BF08];
  v166 = *(void **)(v56 + 3792);
  unint64_t v167 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 384));
  v168 = [v166 numberWithUnsignedLongLong:v167];
  v340[52] = v168;
  v339[53] = *MEMORY[0x1E4F8BE40];
  v169 = *(void **)(v56 + 3792);
  unint64_t v170 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 392));
  v171 = [v169 numberWithUnsignedLongLong:v170];
  v340[53] = v171;
  v339[54] = *MEMORY[0x1E4F8C038];
  v172 = *(void **)(v56 + 3792);
  unint64_t v173 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 400));
  v174 = [v172 numberWithUnsignedLongLong:v173];
  v340[54] = v174;
  v339[55] = *MEMORY[0x1E4F8C058];
  v175 = *(void **)(v56 + 3792);
  unint64_t v176 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 408));
  v177 = [v175 numberWithUnsignedLongLong:v176];
  v340[55] = v177;
  v178 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v340 forKeys:v339 count:56];
  [v179 addEntriesFromDictionary:v178];

  [*(id *)(a1 + 80) _addPersistentHistoryStatsToLibrarySummaryEvent:*(void *)(a1 + 64) withLibraryPathManager:*(void *)(a1 + 72)];
  [*(id *)(a1 + 80) _addFileSystemStatsToLibrarySummaryEvent:*(void *)(a1 + 64) withLibraryPathManager:*(void *)(a1 + 72)];
  [*(id *)(a1 + 80) _addOrphanedSceneClassificationsCountToLibrarySummaryEvent:*(void *)(a1 + 64) withContext:*(void *)(a1 + 32)];
  _Block_object_dispose(&v331, 8);
  _Block_object_dispose(&v335, 8);
}

void __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_7(void *a1)
{
  id v2 = +[PLLibraryScope activeLibraryScopeInManagedObjectContext:a1[4]];
  if (v2)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    id v5 = v2;
    double v3 = (double)(int)[v2 countOfAssetsAddedByCameraSmartSharing];
    id v2 = v5;
    unint64_t v4 = atomic_load((unint64_t *)(a1[5] + 272));
    *(double *)(*(void *)(a1[7] + 8) + 24) = v3 / (double)v4;
  }
}

+ (void)_configureEnumeratorForSyndicationLibrarySummaryLogging:(id)a3 dataForCA:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = v8;
  if (!v7)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PLAggdLogging.m", 720, @"Invalid parameter not satisfying: %@", @"enumerator" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PLAggdLogging.m", 721, @"Invalid parameter not satisfying: %@", @"dataForCA" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = objc_alloc_init(PLAnalyticsLibraryCounters);
  unint64_t v11 = objc_alloc_init(PLAnalyticsSyndicationLibraryCounters);
  unint64_t v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-7776000.0];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __83__PLAggdLogging__configureEnumeratorForSyndicationLibrarySummaryLogging_dataForCA___block_invoke;
  v28[3] = &unk_1E586FE90;
  unint64_t v13 = v10;
  uint64_t v29 = v13;
  id v30 = v12;
  unint64_t v14 = v11;
  int v31 = v14;
  id v15 = v12;
  [v7 addAssetVisitor:v28];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __83__PLAggdLogging__configureEnumeratorForSyndicationLibrarySummaryLogging_dataForCA___block_invoke_2;
  v26[3] = &unk_1E586FEB8;
  unint64_t v16 = v14;
  uint64_t v27 = v16;
  [v7 addConversationVisitor:v26];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __83__PLAggdLogging__configureEnumeratorForSyndicationLibrarySummaryLogging_dataForCA___block_invoke_3;
  v22[3] = &unk_1E5873A50;
  int v23 = v16;
  id v24 = v9;
  uint64_t v25 = v13;
  uint64_t v17 = v13;
  id v18 = v9;
  v19 = v16;
  [v7 addEndOfListVisitor:v22];
}

void __83__PLAggdLogging__configureEnumeratorForSyndicationLibrarySummaryLogging_dataForCA___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 8), 1uLL);
  if ([v18 isPhoto])
  {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 32), 1uLL);
    if ([v18 isPhotoIris])
    {
      uint64_t v3 = 40;
LABEL_6:
      atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + v3), 1uLL);
    }
  }
  else if ([v18 isVideo])
  {
    uint64_t v3 = 48;
    goto LABEL_6;
  }
  if (!atomic_load((unint64_t *)(*(void *)(a1 + 32) + 96)))
  {
    id v5 = [v18 addedDate];
    BOOL IsGreaterThanOrEqual = PLDateIsGreaterThanOrEqual(v5, *(void **)(a1 + 40));

    if (IsGreaterThanOrEqual) {
      atomic_store(1uLL, (unint64_t *)(*(void *)(a1 + 32) + 96));
    }
  }
  int v7 = [v18 savedAssetType];
  int v8 = [MEMORY[0x1E4F8BA10] savedAssetTypeForPromoteToGuestAsset];
  uint64_t v9 = 32;
  if (v7 == v8) {
    uint64_t v9 = 24;
  }
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 48) + v9), 1uLL);
  if (([v18 syndicationState] & 2) != 0) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 48) + 48), 1uLL);
  }
  uint64_t v10 = [v18 conversation];

  uint64_t v11 = 8;
  if (!v10) {
    uint64_t v11 = 16;
  }
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 48) + v11), 1uLL);
  unint64_t v12 = [v18 additionalAttributes];
  unint64_t v13 = [v12 importedByBundleIdentifier];

  if ([v13 isEqualToString:@"com.apple.MobileSMS"])
  {
    uint64_t v14 = 56;
LABEL_20:
    id v15 = v18;
LABEL_21:
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 48) + v14), 1uLL);
    goto LABEL_22;
  }
  if ([v13 isEqualToString:@"com.apple.mobilenotes"])
  {
    uint64_t v14 = 64;
    goto LABEL_20;
  }
  id v15 = v18;
  if (v13)
  {
    unint64_t v16 = PLSyndicationAllEquivalentFileProviderLocalAndCloudBundleIDs();
    int v17 = [v16 containsObject:v13];

    id v15 = v18;
    if (v17)
    {
      uint64_t v14 = 72;
      goto LABEL_21;
    }
  }
LABEL_22:
  if ([v15 spatialType]) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 304), 1uLL);
  }
  if ([v18 spatialType] == 2) {
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 312), 1uLL);
  }
}

uint64_t __83__PLAggdLogging__configureEnumeratorForSyndicationLibrarySummaryLogging_dataForCA___block_invoke_2(uint64_t result)
{
  return result;
}

void __83__PLAggdLogging__configureEnumeratorForSyndicationLibrarySummaryLogging_dataForCA___block_invoke_3(void *a1)
{
  v56[15] = *MEMORY[0x1E4F143B8];
  if (atomic_load((unint64_t *)(a1[4] + 40)))
  {
    uint64_t v3 = (void *)a1[5];
    unint64_t v4 = atomic_load((unint64_t *)(a1[4] + 8));
    double v5 = (double)v4;
    unint64_t v6 = atomic_load((unint64_t *)(a1[4] + 40));
    int v7 = [NSNumber numberWithDouble:v5 / (double)v6];
    [v3 setObject:v7 forKey:*MEMORY[0x1E4F8C250]];
  }
  v55[0] = *MEMORY[0x1E4F8C240];
  int v8 = NSNumber;
  int v50 = (void *)a1[5];
  unint64_t v9 = atomic_load((unint64_t *)(a1[6] + 8));
  __int16 v54 = [v8 numberWithUnsignedLongLong:v9];
  v56[0] = v54;
  v55[1] = *MEMORY[0x1E4F8C298];
  uint64_t v10 = NSNumber;
  unint64_t v11 = atomic_load((unint64_t *)(a1[6] + 32));
  uint64_t v53 = [v10 numberWithUnsignedLongLong:v11];
  v56[1] = v53;
  v55[2] = *MEMORY[0x1E4F8C278];
  unint64_t v12 = NSNumber;
  unint64_t v13 = atomic_load((unint64_t *)(a1[6] + 40));
  uint64_t v52 = [v12 numberWithUnsignedLongLong:v13];
  v56[2] = v52;
  v55[3] = *MEMORY[0x1E4F8C2B8];
  uint64_t v14 = NSNumber;
  unint64_t v15 = atomic_load((unint64_t *)(a1[6] + 48));
  uint64_t v51 = [v14 numberWithUnsignedLongLong:v15];
  v56[3] = v51;
  v55[4] = *MEMORY[0x1E4F8C270];
  unint64_t v16 = NSNumber;
  unint64_t v17 = atomic_load((unint64_t *)(a1[6] + 96));
  id v49 = [v16 numberWithUnsignedLongLong:v17];
  v56[4] = v49;
  v55[5] = *MEMORY[0x1E4F8C2B0];
  id v18 = NSNumber;
  unint64_t v19 = atomic_load((unint64_t *)(a1[6] + 304));
  v48 = [v18 numberWithUnsignedLongLong:v19];
  v56[5] = v48;
  v55[6] = *MEMORY[0x1E4F8C2A8];
  id v20 = NSNumber;
  unint64_t v21 = atomic_load((unint64_t *)(a1[6] + 312));
  v22 = [v20 numberWithUnsignedLongLong:v21];
  v56[6] = v22;
  v55[7] = *MEMORY[0x1E4F8C268];
  int v23 = NSNumber;
  unint64_t v24 = atomic_load((unint64_t *)(a1[4] + 24));
  uint64_t v25 = [v23 numberWithUnsignedLongLong:v24];
  v56[7] = v25;
  v55[8] = *MEMORY[0x1E4F8C288];
  uint64_t v26 = NSNumber;
  unint64_t v27 = atomic_load((unint64_t *)(a1[4] + 32));
  uint64_t v28 = [v26 numberWithUnsignedLongLong:v27];
  v56[8] = v28;
  v55[9] = *MEMORY[0x1E4F8C2A0];
  uint64_t v29 = NSNumber;
  unint64_t v30 = atomic_load((unint64_t *)(a1[4] + 48));
  int v31 = [v29 numberWithUnsignedLongLong:v30];
  v56[9] = v31;
  v55[10] = *MEMORY[0x1E4F8C258];
  uint64_t v32 = NSNumber;
  unint64_t v33 = atomic_load((unint64_t *)(a1[4] + 40));
  v34 = [v32 numberWithUnsignedLongLong:v33];
  v56[10] = v34;
  v55[11] = *MEMORY[0x1E4F8C248];
  int v35 = NSNumber;
  unint64_t v36 = atomic_load((unint64_t *)(a1[4] + 16));
  int v37 = [v35 numberWithUnsignedLongLong:v36];
  v56[11] = v37;
  v55[12] = *MEMORY[0x1E4F8C280];
  BOOL v38 = NSNumber;
  unint64_t v39 = atomic_load((unint64_t *)(a1[4] + 56));
  uint64_t v40 = [v38 numberWithUnsignedLongLong:v39];
  v56[12] = v40;
  v55[13] = *MEMORY[0x1E4F8C290];
  uint64_t v41 = NSNumber;
  unint64_t v42 = atomic_load((unint64_t *)(a1[4] + 64));
  uint64_t v43 = [v41 numberWithUnsignedLongLong:v42];
  v56[13] = v43;
  v55[14] = *MEMORY[0x1E4F8C260];
  uint64_t v44 = NSNumber;
  unint64_t v45 = atomic_load((unint64_t *)(a1[4] + 72));
  v46 = [v44 numberWithUnsignedLongLong:v45];
  v56[14] = v46;
  v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:15];
  [v50 addEntriesFromDictionary:v47];
}

+ (void)configureEnumeratorForLibrarySummaryForLibraryEnumerator:(id)a3 withSyndicationLibraryEnumerator:(id)a4 cloudPhotoLibraryEnabled:(BOOL)a5 dataForCA:(id)a6 libraryServicesManager:(id)a7
{
  BOOL v9 = a5;
  id v12 = a4;
  id v11 = a6;
  +[PLAggdLogging _configureEnumeratorForLibrarySummaryLogging:a3 cloudPhotoLibraryEnabled:v9 dataForCA:v11 libraryServicesManager:a7];
  if (v12) {
    +[PLAggdLogging _configureEnumeratorForSyndicationLibrarySummaryLogging:v12 dataForCA:v11];
  }
}

+ (void)configureEnumeratorForHyperionLocalResourcesLogging:(id)a3 cloudPhotoLibraryEnabled:(BOOL)a4 dataForCA:(id)a5 dataForCK:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    unint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PLAggdLogging.m", 393, @"Invalid parameter not satisfying: %@", @"enumerator" object file lineNumber description];
  }
  uint64_t v14 = objc_alloc_init(PLAnalyticsResourceCounters);
  if (a4 || MEMORY[0x19F38C0C0]())
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __114__PLAggdLogging_configureEnumeratorForHyperionLocalResourcesLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke;
    v31[3] = &unk_1E586FE10;
    unint64_t v15 = v14;
    uint64_t v32 = v15;
    id v33 = &unk_1EEBF2150;
    id v34 = &unk_1EEBF2168;
    id v35 = &unk_1EEBF2198;
    id v36 = &unk_1EEBF2180;
    [v11 addAssetVisitor:v31];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __114__PLAggdLogging_configureEnumeratorForHyperionLocalResourcesLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke_2;
    v29[3] = &unk_1E586FE38;
    unint64_t v30 = v15;
    [v11 addResourceVisitor:v29];
  }
  unint64_t v16 = [v11 sourceContext];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __114__PLAggdLogging_configureEnumeratorForHyperionLocalResourcesLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke_3;
  v22[3] = &unk_1E586FE60;
  int v23 = v14;
  id v24 = v13;
  BOOL v28 = a4;
  id v25 = v12;
  id v26 = v16;
  id v27 = a1;
  id v17 = v16;
  id v18 = v12;
  id v19 = v13;
  id v20 = v14;
  [v11 addEndOfListVisitor:v22];
}

void __114__PLAggdLogging_configureEnumeratorForHyperionLocalResourcesLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke(void *a1, void *a2)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 kind];
  int v5 = [v3 kind];
  int v6 = [v3 isDefaultAdjustedSlomo];
  if ([v3 hasAdjustments]) {
    int v7 = 2;
  }
  else {
    int v7 = 0;
  }
  if ([v3 supportsCloudUpload])
  {
    int v8 = [v3 hasLibraryScope];
    uint64_t v9 = a1[4];
    if (v8)
    {
      atomic_fetch_add((atomic_ullong *volatile)(v9 + 176), 1uLL);
      uint64_t v10 = [v3 libraryScopeShareState];
      if ((v10 & 0x200000) != 0) {
        atomic_fetch_add((atomic_ullong *volatile)(a1[4] + 184), 1uLL);
      }
      if ((v10 & 0x10) != 0 || (v10 & 0x1E) == 2) {
        atomic_fetch_add((atomic_ullong *volatile)(a1[4] + 192), 1uLL);
      }
      if ((v10 & 0x1C) != 4 && (v10 & 0x18) != 8)
      {
LABEL_16:
        atomic_fetch_add((atomic_ullong *volatile)(a1[4] + 24), 1uLL);
        if (v4) {
          BOOL v12 = v5 == 1;
        }
        else {
          BOOL v12 = 1;
        }
        int v13 = v12;
        int v53 = v13;
        if (v12)
        {
          uint64_t v14 = 40;
          if (!v4) {
            uint64_t v14 = 32;
          }
          atomic_fetch_add((atomic_ullong *volatile)(a1[4] + v14), 1uLL);
        }
        int v54 = v4;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        unint64_t v15 = [v3 modernResources];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v64 objects:v70 count:16];
        unint64_t v55 = a1;
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v65;
LABEL_29:
          uint64_t v19 = 0;
          while (1)
          {
            if (*(void *)v65 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = *(void **)(*((void *)&v64 + 1) + 8 * v19);
            if ([v20 isLocallyAvailable])
            {
              if ([v3 hasAdjustments])
              {
                if (v6)
                {
                  if (![v20 version])
                  {
                    unint64_t v21 = (void *)a1[5];
                    v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "cplType"));
                    LOBYTE(v21) = [v21 containsObject:v22];

                    a1 = v55;
                    if (v21)
                    {
LABEL_45:
                      int v29 = 1;
                      goto LABEL_46;
                    }
                  }
                }
                if ([v20 version] != 2) {
                  goto LABEL_42;
                }
                int v23 = (void *)a1[6];
                goto LABEL_41;
              }
              if (![v20 version])
              {
                int v23 = (void *)a1[5];
LABEL_41:
                id v24 = NSNumber;
                uint64_t v25 = [v20 cplType];
                id v26 = v24;
                a1 = v55;
                id v27 = [v26 numberWithUnsignedInteger:v25];
                char v28 = [v23 containsObject:v27];

                if (v28) {
                  goto LABEL_45;
                }
              }
            }
LABEL_42:
            if (v17 == ++v19)
            {
              uint64_t v17 = [v15 countByEnumeratingWithState:&v64 objects:v70 count:16];
              if (v17) {
                goto LABEL_29;
              }
              break;
            }
          }
        }
        int v29 = 0;
LABEL_46:

        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        unint64_t v30 = [v3 modernResources];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v60 objects:v69 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v61;
          while (2)
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v61 != v33) {
                objc_enumerationMutation(v30);
              }
              id v35 = *(void **)(*((void *)&v60 + 1) + 8 * i);
              if ([v35 isLocallyAvailable]
                && [v35 cplType] == 4
                && [v35 version] == v7)
              {
                int v36 = 1;
                goto LABEL_58;
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v60 objects:v69 count:16];
            if (v32) {
              continue;
            }
            break;
          }
        }
        int v36 = 0;
LABEL_58:

        if (v6)
        {
          id v37 = &unk_1EEBF21B0;
        }
        else
        {
          int v38 = [v3 hasAdjustments];
          uint64_t v39 = 8;
          if (v38) {
            uint64_t v39 = 7;
          }
          id v37 = (id)a1[v39];
        }
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        uint64_t v40 = [v3 modernResources];
        uint64_t v41 = [v40 countByEnumeratingWithState:&v56 objects:v68 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          int v51 = v36;
          int v52 = v29;
          uint64_t v43 = *(void *)v57;
          while (2)
          {
            for (uint64_t j = 0; j != v42; ++j)
            {
              if (*(void *)v57 != v43) {
                objc_enumerationMutation(v40);
              }
              unint64_t v45 = *(void **)(*((void *)&v56 + 1) + 8 * j);
              if ([v45 isLocallyAvailable])
              {
                int v46 = [v45 version] == v7 ? 1 : v6;
                if (v46 == 1)
                {
                  v47 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "cplType"));
                  char v48 = [v37 containsObject:v47];

                  if (v48)
                  {
                    int v49 = 1;
                    goto LABEL_78;
                  }
                }
              }
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v56 objects:v68 count:16];
            if (v42) {
              continue;
            }
            break;
          }
          int v49 = 0;
LABEL_78:
          a1 = v55;
          int v36 = v51;
          int v29 = v52;
        }
        else
        {
          int v49 = 0;
        }

        if ([v3 hasAllThumbs]) {
          atomic_fetch_add((atomic_ullong *volatile)(a1[4] + 56), 1uLL);
        }
        if (v29)
        {
          atomic_fetch_add((atomic_ullong *volatile)(a1[4] + 48), 1uLL);
          if (!v36)
          {
LABEL_84:
            if (!v49) {
              goto LABEL_92;
            }
            goto LABEL_88;
          }
        }
        else if (!v36)
        {
          goto LABEL_84;
        }
        atomic_fetch_add((atomic_ullong *volatile)(a1[4] + 64), 1uLL);
        if (!v49)
        {
LABEL_92:

          goto LABEL_93;
        }
LABEL_88:
        atomic_fetch_add((atomic_ullong *volatile)(a1[4] + 72), 1uLL);
        if (v53)
        {
          uint64_t v50 = 88;
          if (!v54) {
            uint64_t v50 = 80;
          }
          atomic_fetch_add((atomic_ullong *volatile)(a1[4] + v50), 1uLL);
        }
        goto LABEL_92;
      }
      id v11 = (atomic_ullong *)(a1[4] + 200);
    }
    else
    {
      id v11 = (atomic_ullong *)(v9 + 168);
    }
    atomic_fetch_add(v11, 1uLL);
    goto LABEL_16;
  }
LABEL_93:
}

void __114__PLAggdLogging_configureEnumeratorForHyperionLocalResourcesLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke_2(uint64_t a1, void *a2)
{
  id v17 = a2;
  [MEMORY[0x1E4F59940] derivativeGenerationThreshold];
  float v4 = v3;
  unint64_t v5 = [MEMORY[0x1E4F59940] maxPixelSizeForResourceType:4];
  uint64_t v6 = [v17 unorientedWidth];
  uint64_t v7 = [v17 unorientedHeight];
  if ([v17 cplType] == 1 && v7 * v6 <= (unint64_t)(float)(v4 * (float)v5))
  {
    int v8 = [v17 isLocallyAvailable];
    uint64_t v9 = 16;
    if (v8) {
      uint64_t v9 = 8;
    }
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + v9), 1uLL);
  }
  if ([v17 cplType])
  {
    uint64_t v10 = [v17 cloudPrunedAt];
    if (v10)
    {
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:v10];
      double v13 = v12;

      if (v13 >= 0.0)
      {
        if (v13 <= 86400.0)
        {
          atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 96), 1uLL);
          atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 120), [v17 dataLength]);
        }
        if (v13 <= 604800.0)
        {
          atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 104), 1uLL);
          atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 128), [v17 dataLength]);
        }
        if (v13 <= 2592000.0)
        {
          atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 112), 1uLL);
          atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 136), [v17 dataLength]);
        }
      }
      uint64_t v14 = [v17 cloudLastPrefetchDate];
      [v10 timeIntervalSinceDate:v14];
      double v16 = v15;

      if (v16 >= 0.0)
      {
        if (v16 <= 86400.0) {
          atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 144), 1uLL);
        }
        if (v16 <= 604800.0) {
          atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 152), 1uLL);
        }
        if (v16 <= 2592000.0) {
          atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 160), 1uLL);
        }
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
}

void __114__PLAggdLogging_configureEnumeratorForHyperionLocalResourcesLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke_3(uint64_t a1)
{
  unint64_t v2 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 8));
  unint64_t v3 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 16));
  double v4 = 0.0;
  double v5 = 0.0;
  if (v2 + v3)
  {
    unint64_t v6 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 8));
    double v7 = (double)v6 * 100.0;
    unint64_t v8 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 8));
    unint64_t v9 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 16));
    double v5 = round(v7 / (double)(v9 + v8));
  }
  uint64_t v10 = *(void **)(a1 + 40);
  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", (uint64_t)v5);
  [v10 setObject:v11 forKey:@"com.apple.assetsd.cpl.mediumOriginalPercent"];

  double v12 = *(void **)(a1 + 48);
  double v13 = [NSNumber numberWithDouble:v5];
  [v12 setObject:v13 forKey:*MEMORY[0x1E4F8BEF8]];

  if (atomic_load((unint64_t *)(*(void *)(a1 + 32) + 24)))
  {
    unint64_t v15 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 48));
    double v16 = (double)v15 * 100.0;
    unint64_t v17 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 24));
    double v4 = round(v16 / (double)v17);
  }
  uint64_t v18 = *(void **)(a1 + 40);
  uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", (uint64_t)v4);
  [v18 setObject:v19 forKey:@"com.apple.assetsd.cpl.originalPercent"];

  id v20 = *(void **)(a1 + 48);
  unint64_t v21 = [NSNumber numberWithDouble:v4];
  [v20 setObject:v21 forKey:*MEMORY[0x1E4F8BF20]];

  unint64_t v22 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 24));
  double v23 = 0.0;
  double v24 = 0.0;
  if (v22)
  {
    unint64_t v25 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 56));
    double v26 = (double)v25 * 100.0;
    unint64_t v27 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 24));
    double v24 = round(v26 / (double)v27);
  }
  char v28 = *(void **)(a1 + 40);
  int v29 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", (uint64_t)v24);
  [v28 setObject:v29 forKey:@"com.apple.assetsd.cpl.thumbPercent"];

  unint64_t v30 = *(void **)(a1 + 48);
  uint64_t v31 = [NSNumber numberWithDouble:v24];
  [v30 setObject:v31 forKey:*MEMORY[0x1E4F8C030]];

  if (atomic_load((unint64_t *)(*(void *)(a1 + 32) + 24)))
  {
    unint64_t v33 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 64));
    double v34 = (double)v33 * 100.0;
    unint64_t v35 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 24));
    double v23 = round(v34 / (double)v35);
  }
  int v36 = *(void **)(a1 + 40);
  id v37 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", (uint64_t)v23);
  [v36 setObject:v37 forKey:@"com.apple.assetsd.cpl.mediumPercent"];

  int v38 = *(void **)(a1 + 48);
  uint64_t v39 = [NSNumber numberWithDouble:v23];
  [v38 setObject:v39 forKey:*MEMORY[0x1E4F8BF00]];

  unint64_t v40 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 24));
  double v41 = 0.0;
  double v42 = 0.0;
  if (v40)
  {
    unint64_t v43 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 72));
    double v44 = (double)v43 * 100.0;
    unint64_t v45 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 24));
    double v42 = round(v44 / (double)v45);
  }
  int v46 = *(void **)(a1 + 40);
  v47 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", (uint64_t)v42);
  [v46 setObject:v47 forKey:@"com.apple.assetsd.cpl.localMediumOrOriginalPercent"];

  char v48 = *(void **)(a1 + 48);
  int v49 = [NSNumber numberWithDouble:v42];
  [v48 setObject:v49 forKey:*MEMORY[0x1E4F8BED0]];

  if (atomic_load((unint64_t *)(*(void *)(a1 + 32) + 24)))
  {
    unint64_t v51 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 80));
    double v52 = (double)v51 * 100.0;
    unint64_t v53 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 32));
    double v41 = round(v52 / (double)v53);
  }
  int v54 = *(void **)(a1 + 40);
  unint64_t v55 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", (uint64_t)v41);
  [v54 setObject:v55 forKey:@"com.apple.assetsd.cpl.localMediumOrOriginalPercent.photo"];

  long long v56 = *(void **)(a1 + 48);
  long long v57 = [NSNumber numberWithDouble:v41];
  [v56 setObject:v57 forKey:*MEMORY[0x1E4F8BED8]];

  if (atomic_load((unint64_t *)(*(void *)(a1 + 32) + 24)))
  {
    unint64_t v59 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 88));
    double v60 = (double)v59 * 100.0;
    unint64_t v61 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 40));
    double v62 = round(v60 / (double)v61);
  }
  else
  {
    double v62 = 0.0;
  }
  long long v63 = *(void **)(a1 + 40);
  long long v64 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", (uint64_t)v62);
  [v63 setObject:v64 forKey:@"com.apple.assetsd.cpl.localMediumOrOriginalPercent.video"];

  long long v65 = *(void **)(a1 + 48);
  long long v66 = [NSNumber numberWithDouble:v62];
  [v65 setObject:v66 forKey:*MEMORY[0x1E4F8BEE0]];

  long long v67 = NSNumber;
  unint64_t v68 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 96));
  unint64_t v69 = [v67 numberWithUnsignedLongLong:v68];
  [*(id *)(a1 + 48) setObject:v69 forKeyedSubscript:*MEMORY[0x1E4F8BF98]];

  uint64_t v70 = NSNumber;
  unint64_t v71 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 104));
  v72 = [v70 numberWithUnsignedLongLong:v71];
  [*(id *)(a1 + 48) setObject:v72 forKeyedSubscript:*MEMORY[0x1E4F8BFB8]];

  unint64_t v73 = NSNumber;
  unint64_t v74 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 112));
  unint64_t v75 = [v73 numberWithUnsignedLongLong:v74];
  [*(id *)(a1 + 48) setObject:v75 forKeyedSubscript:*MEMORY[0x1E4F8BFA8]];

  v76 = NSNumber;
  unint64_t v77 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 120));
  v78 = [v76 numberWithUnsignedLongLong:v77];
  [*(id *)(a1 + 48) setObject:v78 forKeyedSubscript:*MEMORY[0x1E4F8BFA0]];

  unint64_t v79 = NSNumber;
  unint64_t v80 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 128));
  unint64_t v81 = [v79 numberWithUnsignedLongLong:v80];
  [*(id *)(a1 + 48) setObject:v81 forKeyedSubscript:*MEMORY[0x1E4F8BFC0]];

  v82 = NSNumber;
  unint64_t v83 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 136));
  v84 = [v82 numberWithUnsignedLongLong:v83];
  [*(id *)(a1 + 48) setObject:v84 forKeyedSubscript:*MEMORY[0x1E4F8BFB0]];

  unint64_t v85 = NSNumber;
  unint64_t v86 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 144));
  unint64_t v87 = [v85 numberWithUnsignedLongLong:v86];
  [*(id *)(a1 + 48) setObject:v87 forKeyedSubscript:*MEMORY[0x1E4F8BFC8]];

  v88 = NSNumber;
  unint64_t v89 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 152));
  v90 = [v88 numberWithUnsignedLongLong:v89];
  [*(id *)(a1 + 48) setObject:v90 forKeyedSubscript:*MEMORY[0x1E4F8BFD8]];

  unint64_t v91 = NSNumber;
  unint64_t v92 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 160));
  unint64_t v93 = [v91 numberWithUnsignedLongLong:v92];
  [*(id *)(a1 + 48) setObject:v93 forKeyedSubscript:*MEMORY[0x1E4F8BFD0]];

  v94 = NSString;
  unint64_t v95 = *(void **)(a1 + 40);
  unint64_t v96 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 96));
  unint64_t v97 = objc_msgSend(v94, "stringWithFormat:", @"%lld", v96);
  [v95 setObject:v97 forKey:@"com.apple.assetsd.cpl.resourcesPurgedInTheLastDay.count"];

  v98 = NSString;
  unint64_t v99 = *(void **)(a1 + 40);
  unint64_t v100 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 104));
  unint64_t v101 = objc_msgSend(v98, "stringWithFormat:", @"%lld", v100);
  [v99 setObject:v101 forKey:@"com.apple.assetsd.cpl.resourcesPurgedInTheLastWeek.count"];

  v102 = NSString;
  unint64_t v103 = *(void **)(a1 + 40);
  unint64_t v104 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 112));
  unint64_t v105 = objc_msgSend(v102, "stringWithFormat:", @"%lld", v104);
  [v103 setObject:v105 forKey:@"com.apple.assetsd.cpl.resourcesPurgedInTheLastMonth.count"];

  v106 = NSString;
  unint64_t v107 = *(void **)(a1 + 40);
  unint64_t v108 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 120));
  unint64_t v109 = objc_msgSend(v106, "stringWithFormat:", @"%lld", v108);
  [v107 setObject:v109 forKey:@"com.apple.assetsd.cpl.resourcesPurgedInTheLastDay.size"];

  v110 = NSString;
  unint64_t v111 = *(void **)(a1 + 40);
  unint64_t v112 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 128));
  unint64_t v113 = objc_msgSend(v110, "stringWithFormat:", @"%lld", v112);
  [v111 setObject:v113 forKey:@"com.apple.assetsd.cpl.resourcesPurgedInTheLastWeek.size"];

  v114 = NSString;
  unint64_t v115 = *(void **)(a1 + 40);
  unint64_t v116 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 136));
  unint64_t v117 = objc_msgSend(v114, "stringWithFormat:", @"%lld", v116);
  [v115 setObject:v117 forKey:@"com.apple.assetsd.cpl.resourcesPurgedInTheLastMonth.size"];

  v118 = NSString;
  unint64_t v119 = *(void **)(a1 + 40);
  unint64_t v120 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 144));
  unint64_t v121 = objc_msgSend(v118, "stringWithFormat:", @"%lld", v120);
  [v119 setObject:v121 forKey:@"com.apple.assetsd.cpl.resourcesPurgedWithinDayOfPrefetch.count"];

  v122 = NSString;
  unint64_t v123 = *(void **)(a1 + 40);
  unint64_t v124 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 152));
  unint64_t v125 = objc_msgSend(v122, "stringWithFormat:", @"%lld", v124);
  [v123 setObject:v125 forKey:@"com.apple.assetsd.cpl.resourcesPurgedWithinWeekOfPrefetch.count"];

  v126 = NSString;
  unint64_t v127 = *(void **)(a1 + 40);
  unint64_t v128 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 160));
  unint64_t v129 = objc_msgSend(v126, "stringWithFormat:", @"%lld", v128);
  [v127 setObject:v129 forKey:@"com.apple.assetsd.cpl.resourcesPurgedWithinMonthOfPrefetch.count"];

  v130 = NSString;
  unint64_t v131 = *(void **)(a1 + 40);
  unint64_t v132 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 176));
  unint64_t v133 = objc_msgSend(v130, "stringWithFormat:", @"%lld", v132);
  [v131 setObject:v133 forKey:@"com.apple.mobileslideshow.sharedlibrary.assetcount"];

  v134 = NSString;
  unint64_t v135 = *(void **)(a1 + 40);
  unint64_t v136 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 168));
  unint64_t v137 = objc_msgSend(v134, "stringWithFormat:", @"%lld", v136);
  [v135 setObject:v137 forKey:@"com.apple.mobileslideshow.personallibrary.assetcount"];

  v138 = NSString;
  unint64_t v139 = *(void **)(a1 + 40);
  unint64_t v140 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 184));
  unint64_t v141 = objc_msgSend(v138, "stringWithFormat:", @"%lld", v140);
  [v139 setObject:v141 forKey:@"com.apple.mobileslideshow.sharedlibrary.assetaddedmanuallycount"];

  v142 = NSString;
  unint64_t v143 = *(void **)(a1 + 40);
  unint64_t v144 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 192));
  unint64_t v145 = objc_msgSend(v142, "stringWithFormat:", @"%lld", v144);
  [v143 setObject:v145 forKey:@"com.apple.mobileslideshow.sharedlibrary.assetaddedincameracount"];

  v146 = NSString;
  unint64_t v147 = *(void **)(a1 + 40);
  unint64_t v148 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 200));
  unint64_t v149 = objc_msgSend(v146, "stringWithFormat:", @"%lld", v148);
  [v147 setObject:v149 forKey:@"com.apple.mobileslideshow.sharedlibrary.assetaddedinsuggestionscount"];

  id v174 = (id)MGCopyAnswer();
  v150 = [v174 objectForKey:*MEMORY[0x1E4FBA0F0]];
  uint64_t v151 = [v150 longLongValue];

  v152 = *(void **)(a1 + 40);
  unint64_t v153 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", v151);
  [v152 setValue:v153 forKey:@"totalStorage"];

  v154 = *(void **)(a1 + 48);
  unint64_t v155 = [NSNumber numberWithLongLong:v151];
  [v154 setObject:v155 forKey:*MEMORY[0x1E4F8C048]];

  v156 = [v174 objectForKey:*MEMORY[0x1E4FBA0D8]];
  uint64_t v157 = [v156 longLongValue];

  unint64_t v158 = *(void **)(a1 + 40);
  v159 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", v157);
  [v158 setValue:v159 forKey:@"availableStorage"];

  v160 = *(void **)(a1 + 48);
  unint64_t v161 = [NSNumber numberWithLongLong:v157];
  [v160 setObject:v161 forKey:*MEMORY[0x1E4F8BE18]];

  int v162 = MEMORY[0x19F38C0C0]();
  v163 = &stru_1EEB2EB80;
  if (v162) {
    v163 = @"unitTest-";
  }
  unint64_t v164 = v163;
  if (*(unsigned char *)(a1 + 72) && (MEMORY[0x19F38C0C0]() & 1) == 0)
  {
    objc_opt_class();
    id v165 = *(id *)(a1 + 56);
    if (objc_opt_isKindOfClass()) {
      v166 = v165;
    }
    else {
      v166 = 0;
    }
    id v167 = v166;

    v168 = objc_msgSend(v167, "pl_libraryBundle");
    v169 = +[PLCPLSettings settingsWithLibraryBundle:v168];

    int v170 = [v169 isKeepOriginalsEnabled];
    v171 = @"icplOpt-";
    if (v170) {
      v171 = @"icplOrg-";
    }
    v172 = v171;

    unint64_t v164 = v172;
  }
  unint64_t v173 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  [*(id *)(a1 + 64) _addPrefix:v164 toKeysInDictionary:*(void *)(a1 + 40) inPrefixedDictionary:v173];
  [*(id *)(a1 + 40) removeAllObjects];
  [*(id *)(a1 + 40) addEntriesFromDictionary:v173];
}

+ (void)configureEnumeratorForLibrarySizeLogging:(id)a3 cloudPhotoLibraryEnabled:(BOOL)a4 dataForCA:(id)a5 dataForCK:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    unint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PLAggdLogging.m", 377, @"Invalid parameter not satisfying: %@", @"enumerator" object file lineNumber description];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __103__PLAggdLogging_configureEnumeratorForLibrarySizeLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke;
  v16[3] = &unk_1E586FDE8;
  id v17 = v12;
  id v18 = v11;
  id v13 = v11;
  id v14 = v12;
  +[PLPhotoLibrary configureEnumeratorForLibrarySizeInfo:v10 completion:v16];
}

void __103__PLAggdLogging_configureEnumeratorForLibrarySizeLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = +[PLPhotoLibrary savedPhotosOriginalsSizeWithSizeDataRef:v3];
  double v4 = *(void **)(a1 + 32);
  double v5 = [NSString stringWithFormat:@"%@", v9];
  [v4 setObject:v5 forKey:@"originalLibrarySize"];

  [*(id *)(a1 + 40) setObject:v9 forKey:*MEMORY[0x1E4F8BF18]];
  unint64_t v6 = +[PLPhotoLibrary savedPhotosReferenceMediaSizeWithSizeDataRef:v3];

  double v7 = *(void **)(a1 + 32);
  unint64_t v8 = [NSString stringWithFormat:@"%@", v6];
  [v7 setObject:v8 forKey:@"referenceMediaSize"];

  [*(id *)(a1 + 40) setObject:v6 forKey:*MEMORY[0x1E4F8BF90]];
}

+ (void)_addLibrarySummaryDataToCollectionIfPresent:(id)a3 fromCPLEventData:(id)a4 forKey:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = [v7 objectForKeyedSubscript:v8];
    [v11 setObject:v10 forKey:v8];
  }
}

+ (void)_addPrefix:(id)a3 toKeysInDictionary:(id)a4 inPrefixedDictionary:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PLAggdLogging__addPrefix_toKeysInDictionary_inPrefixedDictionary___block_invoke;
  v11[3] = &unk_1E5875D30;
  id v12 = v8;
  id v13 = v7;
  id v9 = v7;
  id v10 = v8;
  [a4 enumerateKeysAndObjectsUsingBlock:v11];
}

void __68__PLAggdLogging__addPrefix_toKeysInDictionary_inPrefixedDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4 = NSString;
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = [v4 stringWithFormat:@"%@%@", v6, a2];
  [v5 setObject:v7 forKey:v8];
}

+ (id)_analyticsDescriptionForAssetCount:(int64_t)a3
{
  if (a3 < 1) {
    return @"0";
  }
  if ((unint64_t)a3 < 6) {
    return @"1-5";
  }
  if ((unint64_t)a3 < 0xB) {
    return @"6-10";
  }
  if ((unint64_t)a3 < 0x15) {
    return @"11-20";
  }
  if ((unint64_t)a3 < 0x1F) {
    return @"21-30";
  }
  if ((unint64_t)a3 < 0x29) {
    return @"31-40";
  }
  if ((unint64_t)a3 < 0x33) {
    return @"41-50";
  }
  if ((unint64_t)a3 < 0x65) {
    return @"51-100";
  }
  if ((unint64_t)a3 < 0xC9) {
    return @"101-200";
  }
  if ((unint64_t)a3 >= 0x1F5) {
    return @"501+";
  }
  return @"201-500";
}

+ (id)_analyticsDescriptionForMediaAge:(double)a3
{
  double v4 = a3 / 60.0 / 60.0 / 24.0;
  double v5 = v4 / 30.0;
  if (v4 / 30.0 >= 1.0)
  {
    if (v5 >= 3.0)
    {
      if (v5 >= 6.0)
      {
        double v8 = v4 / 365.0;
        if (v4 / 365.0 >= 1.0)
        {
          id v9 = [NSString alloc];
          uint64_t v10 = (uint64_t)v8;
          if (v8 >= 10.0) {
            uint64_t v10 = 10 * (v10 / 10);
          }
          uint64_t v6 = (__CFString *)objc_msgSend(v9, "initWithFormat:", @"%liYears", v10);
        }
        else
        {
          uint64_t v6 = @"lastYear";
        }
      }
      else
      {
        uint64_t v6 = @"last6Months";
      }
    }
    else
    {
      uint64_t v6 = @"last3Months";
    }
  }
  else
  {
    uint64_t v6 = @"lastMonth";
  }
  return v6;
}

+ (void)_addDistributionStatisticsOfValues:(id)a3 withPrefix:(id)a4 toDictionary:(id)a5 formatter:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *))a6;
  if ([v9 count])
  {
    id v13 = [v9 sortedArrayUsingSelector:sel_compare_];
    id v14 = [v13 firstObject];
    unint64_t v15 = v12[2](v12, v14);
    double v16 = [v10 stringByAppendingString:@"Min"];
    [v11 setObject:v15 forKeyedSubscript:v16];

    id v17 = [v13 lastObject];
    id v18 = v12[2](v12, v17);
    uint64_t v19 = [v10 stringByAppendingString:@"Max"];
    [v11 setObject:v18 forKeyedSubscript:v19];

    id v20 = objc_msgSend(v13, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v13, "count") >> 1);
    unint64_t v21 = v12[2](v12, v20);
    unint64_t v22 = [v10 stringByAppendingString:@"Median"];
    [v11 setObject:v21 forKeyedSubscript:v22];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v23 = v13;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v34;
      double v27 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v34 != v26) {
            objc_enumerationMutation(v23);
          }
          objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "doubleValue", (void)v33);
          double v27 = v27 + v29;
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v25);
    }
    else
    {
      double v27 = 0.0;
    }

    unint64_t v30 = objc_msgSend(NSNumber, "numberWithDouble:", v27 / (double)(unint64_t)objc_msgSend(v23, "count"));
    uint64_t v31 = v12[2](v12, v30);
    uint64_t v32 = [v10 stringByAppendingString:@"Mean"];
    [v11 setObject:v31 forKeyedSubscript:v32];
  }
}

+ (void)performSlideshowProjectStatisticsLogging:(id)a3
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = +[PLProjectAlbum entityName];
  double v8 = [v6 fetchRequestWithEntityName:v7];

  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"projectDocumentType", @"com.apple.photos.projects.slideshow"];
  [v8 setPredicate:v9];

  v55[0] = @"creationDate";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  [v8 setPropertiesToFetch:v10];

  int v54 = @"assets";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  [v8 setRelationshipKeyPathsForPrefetching:v11];

  [v8 setFetchBatchSize:100];
  id v48 = 0;
  id v12 = [v5 executeFetchRequest:v8 error:&v48];
  id v13 = v48;
  id v14 = v13;
  if (v12)
  {
    id v38 = v13;
    id v39 = a1;
    unint64_t v40 = v8;
    id v41 = v5;
    uint64_t v15 = [v12 count];
    double v16 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
    uint64_t v37 = v15;
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v18 = v12;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v45 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          uint64_t v24 = [v23 creationDate];
          uint64_t v25 = v24;
          if (v24)
          {
            uint64_t v26 = NSNumber;
            [v24 timeIntervalSinceNow];
            char v28 = [v26 numberWithDouble:-v27];
            [v16 addObject:v28];
          }
          double v29 = NSNumber;
          unint64_t v30 = [v23 assets];
          uint64_t v31 = objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
          [v17 addObject:v31];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v20);
    }

    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v33 = [NSNumber numberWithInteger:v37];
    [v32 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F8C228]];

    uint64_t v34 = *MEMORY[0x1E4F8C238];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __58__PLAggdLogging_performSlideshowProjectStatisticsLogging___block_invoke;
    v43[3] = &__block_descriptor_40_e28___NSString_16__0__NSNumber_8l;
    v43[4] = v39;
    [v39 _addDistributionStatisticsOfValues:v16 withPrefix:v34 toDictionary:v32 formatter:v43];
    uint64_t v35 = *MEMORY[0x1E4F8C220];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __58__PLAggdLogging_performSlideshowProjectStatisticsLogging___block_invoke_2;
    v42[3] = &__block_descriptor_40_e28___NSString_16__0__NSNumber_8l;
    v42[4] = v39;
    [v39 _addDistributionStatisticsOfValues:v17 withPrefix:v35 toDictionary:v32 formatter:v42];
    PLSendCoreAnalyticEvent();

    double v8 = v40;
    id v5 = v41;
    id v14 = v38;
  }
  else
  {
    double v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      long long v36 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v50 = v36;
      __int16 v51 = 2112;
      double v52 = v14;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "%@ failed to slideshow projects: %@", buf, 0x16u);
    }
  }
}

uint64_t __58__PLAggdLogging_performSlideshowProjectStatisticsLogging___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  [a2 doubleValue];
  return objc_msgSend(v2, "_analyticsDescriptionForMediaAge:");
}

uint64_t __58__PLAggdLogging_performSlideshowProjectStatisticsLogging___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 integerValue];
  return [v2 _analyticsDescriptionForAssetCount:v3];
}

+ (void)performMomentsStatisticsLogging:(id)a3
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v6 = +[PLMoment entityName];
  id v7 = [v5 fetchRequestWithEntityName:v6];

  [v7 setResultType:2];
  [v7 setFetchBatchSize:100];
  [v7 setPropertiesToFetch:&unk_1EEBF2138];
  double v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"cachedCount" ascending:1];
  v57[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
  [v7 setSortDescriptors:v9];

  id v50 = 0;
  id v10 = [v4 executeFetchRequest:v7 error:&v50];
  id v11 = v50;
  if (v11 || !v10)
  {
    id v23 = PLBackendGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = NSStringFromSelector(a2);
      uint64_t v25 = +[PLMoment entityName];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v24;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v25;
      __int16 v52 = 2112;
      id v53 = v11;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "%@ failed to fetch counts for %@ %@", buf, 0x20u);
    }
  }
  else
  {
    unint64_t v43 = v7;
    id v44 = v4;
    unint64_t v45 = [v10 count];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    double v42 = v10;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      unint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v47 != v17) {
            objc_enumerationMutation(v12);
          }
          uint64_t v19 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v20 = (void *)MEMORY[0x19F38D3B0]();
          uint64_t v21 = [v19 objectForKeyedSubscript:@"cachedCount"];
          uint64_t v22 = [v21 unsignedIntegerValue];

          v15 += v22;
          if (v22 == 1) {
            ++v16;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v46 objects:v56 count:16];
      }
      while (v14);
    }
    else
    {
      unint64_t v15 = 0;
      uint64_t v16 = 0;
    }

    unint64_t v26 = v45;
    unint64_t v27 = v15 / v45;
    id v28 = [v12 valueForKeyPath:@"cachedCount"];
    if ([v28 count])
    {
      id v11 = 0;
      if ([v28 count] == 1)
      {
        double v29 = [v28 firstObject];
        uint64_t v30 = [v29 integerValue];
        id v10 = v42;
      }
      else
      {
        unint64_t v31 = v27;
        double v29 = [v28 sortedArrayUsingSelector:sel_compare_];
        char v32 = [v28 count];
        unint64_t v33 = (unint64_t)[v29 count] >> 1;
        if (v32)
        {
          uint64_t v34 = [v29 objectAtIndex:v33];
          uint64_t v30 = [v34 integerValue];
        }
        else
        {
          uint64_t v34 = [v29 objectAtIndex:v33 - 1];
          *(void *)buf = v34;
          uint64_t v35 = [v29 objectAtIndex:v33];
          *(void *)&buf[8] = v35;
          long long v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:2];
          uint64_t v37 = [v36 valueForKeyPath:@"@avg.self"];
          uint64_t v30 = [v37 integerValue];

          unint64_t v26 = v45;
        }
        id v10 = v42;

        unint64_t v27 = v31;
      }
    }
    else
    {
      uint64_t v30 = 0;
      id v10 = v42;
      id v11 = 0;
    }

    v54[0] = *MEMORY[0x1E4F8C0A8];
    id v23 = [NSNumber numberWithUnsignedInteger:v26];
    v55[0] = v23;
    v54[1] = *MEMORY[0x1E4F8C0B0];
    id v38 = [NSNumber numberWithUnsignedInteger:v16];
    v55[1] = v38;
    v54[2] = *MEMORY[0x1E4F8C098];
    id v39 = [NSNumber numberWithInteger:v27];
    v55[2] = v39;
    v54[3] = *MEMORY[0x1E4F8C0A0];
    unint64_t v40 = [NSNumber numberWithUnsignedInteger:v30];
    v55[3] = v40;
    id v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:4];
    PLSendCoreAnalyticEvent();

    id v7 = v43;
    id v4 = v44;
  }
}

@end