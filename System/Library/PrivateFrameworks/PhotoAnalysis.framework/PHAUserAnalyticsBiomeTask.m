@interface PHAUserAnalyticsBiomeTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)runWithPhotoLibrary:(id)a3 analytics:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (BOOL)shouldRunWithPhotoLibrary:(id)a3;
- (NSString)name;
- (PHAUserAnalyticsBiomeTask)initWithTaskType:(signed __int16)a3;
- (double)period;
- (id)biomeUUIDsFrom:(id)a3 progressReporter:(id)a4;
- (id)deletedAssetUUIDsFromBiomeFrom:(id)a3 biomeUUIDs:(id)a4;
- (id)deletedMemoryUUIDsFromBiomeFrom:(id)a3 biomeUUIDs:(id)a4;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)pruneBiomeEventsWithUUIDs:(id)a3;
- (void)pruneDeletedRecordsFromBiomeFrom:(id)a3 progressReporter:(id)a4;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAUserAnalyticsBiomeTask

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAUserAnalyticsBiomeTask timeoutFatal:]", "PHAUserAnalyticsBiomeTask.m", 258, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAUserAnalyticsBiomeTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithPhotoLibrary:(id)a3 analytics:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = os_log_create("com.apple.photoanalysisd", "UserAnalyticsBiomeTask");
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "UserAnalyticsBiomeTask", "", buf, 2u);
  }

  uint64_t v15 = mach_absolute_time();
  id v16 = v10;
  v17 = v16;
  v18 = v16;
  if (self->_taskType == 1)
  {
    v18 = [v16 childProgressReporterForStep:0 outOf:3];
  }
  [(PHAUserAnalyticsBiomeTask *)self pruneDeletedRecordsFromBiomeFrom:v9 progressReporter:v18];
  if (self->_taskType == 1)
  {
    v19 = [v17 childProgressReporterForStep:2 outOf:3];
    v20 = [[PHAPhotoStyle alloc] initWithphotoLibrary:v9];
    char v21 = [(PHAPhotoStyle *)v20 updateStyleStreamWithProgressReporter:v19 error:a6];
  }
  else
  {
    char v21 = 1;
  }
  uint64_t v22 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v25 = v14;
  v26 = v25;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v26, OS_SIGNPOST_INTERVAL_END, v12, "UserAnalyticsBiomeTask", "", buf, 2u);
  }

  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "UserAnalyticsBiomeTask";
    __int16 v31 = 2048;
    double v32 = (float)((float)((float)((float)(v22 - v15) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D21F2000, v26, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v21;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 workingContext];
  v11 = [v10 photoLibrary];
  os_signpost_id_t v12 = [v9 analytics];

  LOBYTE(a5) = [(PHAUserAnalyticsBiomeTask *)self runWithPhotoLibrary:v11 analytics:v12 progressReporter:v8 error:a5];
  return (char)a5;
}

- (id)deletedMemoryUUIDsFromBiomeFrom:(id)a3 biomeUUIDs:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1CA80] setWithSet:a4];
  if ([v6 count])
  {
    v7 = [v5 librarySpecificFetchOptions];
    v16[0] = *MEMORY[0x1E4F397B0];
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v7 setFetchPropertySets:v8];

    [v7 setIncludeStoryMemories:1];
    id v9 = [MEMORY[0x1E4F39160] localIdentifiersWithUUIDs:v6];
    id v10 = [v9 allObjects];

    v11 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 localIdentifiers:v10 options:v7];
    if ([v11 count])
    {
      unint64_t v12 = 0;
      do
      {
        v13 = [v11 objectAtIndexedSubscript:v12];
        v14 = [v13 uuid];
        [v6 removeObject:v14];

        ++v12;
      }
      while (v12 < [v11 count]);
    }
  }

  return v6;
}

- (id)deletedAssetUUIDsFromBiomeFrom:(id)a3 biomeUUIDs:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA80] setWithSet:v6];
  if ([v7 count])
  {
    id v8 = [v5 librarySpecificFetchOptions];
    v17[0] = *MEMORY[0x1E4F394A8];
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v8 setFetchPropertySets:v9];

    [v8 setIncludeHiddenAssets:0];
    id v10 = (void *)MEMORY[0x1E4F38EB8];
    v11 = [v6 allObjects];
    unint64_t v12 = [v10 fetchAssetsWithUUIDs:v11 options:v8];

    if ([v12 count])
    {
      unint64_t v13 = 0;
      do
      {
        v14 = [v12 objectAtIndexedSubscript:v13];
        uint64_t v15 = [v14 uuid];
        [v7 removeObject:v15];

        ++v13;
      }
      while (v13 < [v12 count]);
    }
  }

  return v7;
}

- (id)biomeUUIDsFrom:(id)a3 progressReporter:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    id v11 = 0;
    uint64_t v12 = *(void *)v23;
    *(void *)&long long v9 = 138412290;
    long long v19 = v9;
    do
    {
      uint64_t v13 = 0;
      do
      {
        v14 = v11;
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v7);
        }
        int v15 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v13), "intValue", v19);
        id v21 = v11;
        id v16 = +[PHABiomeUtilities readUUIDsWithStream:v15 progressReporter:v6 error:&v21];
        id v11 = v21;

        if (v16)
        {
          [v20 unionSet:v16];
        }
        else
        {
          if (__PXLog_genericOnceToken != -1) {
            dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_228);
          }
          v17 = __PXLog_genericOSLog;
          if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            id v27 = v11;
            _os_log_error_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_ERROR, "Reading from Biome Failed with error: %@", buf, 0xCu);
          }
        }

        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v10);
  }

  return v20;
}

uint64_t __61__PHAUserAnalyticsBiomeTask_biomeUUIDsFrom_progressReporter___block_invoke()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (void)pruneDeletedRecordsFromBiomeFrom:(id)a3 progressReporter:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (__PXLog_genericOnceToken != -1) {
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_216);
  }
  uint64_t v8 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_1D21F2000, v8, OS_LOG_TYPE_INFO, "Biome deletion task starting", (uint8_t *)&v24, 2u);
  }
  long long v9 = +[PHABiomeUtilities availableAssetBiomeStreams];
  uint64_t v10 = +[PHABiomeUtilities availableSessionBiomeStreams];
  id v11 = [v9 arrayByAddingObjectsFromArray:v10];

  uint64_t v12 = [(PHAUserAnalyticsBiomeTask *)self biomeUUIDsFrom:v11 progressReporter:v7];
  uint64_t v13 = [(PHAUserAnalyticsBiomeTask *)self deletedAssetUUIDsFromBiomeFrom:v6 biomeUUIDs:v12];
  uint64_t v14 = [v13 count];
  if (v14)
  {
    uint64_t v15 = v14;
    [(PHAUserAnalyticsBiomeTask *)self pruneBiomeEventsWithUUIDs:v13];
    if (__PXLog_genericOnceToken != -1) {
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_219);
    }
    id v16 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
    {
      int v24 = 134217984;
      uint64_t v25 = v15;
      _os_log_impl(&dword_1D21F2000, v16, OS_LOG_TYPE_INFO, "Biome deletion task deleted events for %lu memories).", (uint8_t *)&v24, 0xCu);
    }
  }
  v17 = +[PHABiomeUtilities availableMemoryBiomeStreams];
  v18 = [(PHAUserAnalyticsBiomeTask *)self biomeUUIDsFrom:v17 progressReporter:v7];
  long long v19 = [(PHAUserAnalyticsBiomeTask *)self deletedMemoryUUIDsFromBiomeFrom:v6 biomeUUIDs:v18];
  uint64_t v20 = [v19 count];
  if (!v20) {
    goto LABEL_15;
  }
  uint64_t v21 = v20;
  [(PHAUserAnalyticsBiomeTask *)self pruneBiomeEventsWithUUIDs:v19];
  if (__PXLog_genericOnceToken != -1) {
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_222);
  }
  long long v22 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
  {
    int v24 = 134217984;
    uint64_t v25 = v21;
    _os_log_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_INFO, "Biome deletion task deleted events for %lu assets).", (uint8_t *)&v24, 0xCu);
LABEL_15:
    if (__PXLog_genericOnceToken != -1) {
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_225);
    }
  }
  long long v23 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_1D21F2000, v23, OS_LOG_TYPE_INFO, "Biome deletion task completed.", (uint8_t *)&v24, 2u);
  }
}

uint64_t __79__PHAUserAnalyticsBiomeTask_pruneDeletedRecordsFromBiomeFrom_progressReporter___block_invoke_223()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __79__PHAUserAnalyticsBiomeTask_pruneDeletedRecordsFromBiomeFrom_progressReporter___block_invoke_220()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __79__PHAUserAnalyticsBiomeTask_pruneDeletedRecordsFromBiomeFrom_progressReporter___block_invoke_217()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __79__PHAUserAnalyticsBiomeTask_pruneDeletedRecordsFromBiomeFrom_progressReporter___block_invoke()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (void)pruneBiomeEventsWithUUIDs:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[PHABiomeUtilities availableAssetBiomeLibraryStream];
  id v5 = +[PHABiomeUtilities availableMemoryBiomeLibraryStream];
  id v6 = +[PHABiomeUtilities availableSessionBiomeLibraryStream];
  id v7 = [v4 arrayByAddingObjectsFromArray:v5];
  uint64_t v8 = [v7 arrayByAddingObjectsFromArray:v6];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = [v13 pruner];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        void v16[2] = __55__PHAUserAnalyticsBiomeTask_pruneBiomeEventsWithUUIDs___block_invoke;
        v16[3] = &unk_1E6918F98;
        v16[4] = v13;
        id v17 = v3;
        [v14 deleteWithPolicy:@"deleted-or-hidden-asset" eventsPassingTest:v16];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

uint64_t __55__PHAUserAnalyticsBiomeTask_pruneBiomeEventsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) identifier];
  id v5 = BiomeLibrary();
  id v6 = [v5 AeroML];
  id v7 = [v6 RawEvent];
  uint64_t v8 = [v7 PhotosSearchSession];
  uint64_t v9 = [v8 identifier];

  if (v4 == v9)
  {
    long long v21 = [v3 eventBody];
    long long v22 = [v21 valueForKey:@"presentedAssets"];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v32;
      while (2)
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v27), "valueForKey:", @"assetUUID", (void)v31);
          char v29 = [*(id *)(a1 + 40) containsObject:v28];

          if (v29)
          {
            uint64_t v18 = 1;
            goto LABEL_16;
          }
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
    uint64_t v18 = 0;
LABEL_16:
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) identifier];
    uint64_t v11 = BiomeLibrary();
    uint64_t v12 = [v11 Photos];
    uint64_t v13 = [v12 Memories];
    uint64_t v14 = [v13 Curation];
    uint64_t v15 = [v14 identifier];

    if (v10 == v15
      && ([v3 eventBody],
          id v16 = objc_claimAutoreleasedReturnValue(),
          [v16 valueForKey:@"type"],
          id v17 = objc_claimAutoreleasedReturnValue(),
          v16,
          LODWORD(v16) = [v17 intValue],
          v17,
          v16 == 4))
    {
      uint64_t v18 = 0;
    }
    else
    {
      long long v19 = [v3 eventBody];
      long long v20 = [v19 valueForKey:@"identifier"];

      uint64_t v18 = [*(id *)(a1 + 40) containsObject:v20];
    }
  }

  return v18;
}

- (BOOL)shouldRunWithPhotoLibrary:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v4 = [a3 isSystemPhotoLibrary];
  if ((v4 & 1) == 0)
  {
    if (__PXLog_genericOnceToken != -1) {
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_10246);
    }
    id v5 = (void *)__PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_DEBUG))
    {
      id v7 = v5;
      uint64_t v8 = [(PHAUserAnalyticsBiomeTask *)self name];
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_debug_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_DEBUG, "Task is running on a non system photo library: not running %@ job", (uint8_t *)&v9, 0xCu);
    }
  }
  return v4;
}

uint64_t __55__PHAUserAnalyticsBiomeTask_shouldRunWithPhotoLibrary___block_invoke()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_taskType == 1 && ![v4 isReady])
  {
    BOOL v7 = 0;
  }
  else
  {
    id v6 = [v5 photoLibrary];
    BOOL v7 = [(PHAUserAnalyticsBiomeTask *)self shouldRunWithPhotoLibrary:v6];
  }
  return v7;
}

- (int)priority
{
  return 0;
}

- (id)taskClassDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)incrementalKey
{
  return 0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (double)period
{
  double result = dbl_1D2433360[self->_taskType == 1];
  if (!self->_taskType) {
    return 86400.0;
  }
  return result;
}

- (NSString)name
{
  v2 = @"PHAUserAnalyticsBiomeUnknown";
  if (self->_taskType == 1) {
    v2 = @"PHAUserAnalyticsBiomeWeeklyTask";
  }
  if (self->_taskType) {
    return &v2->isa;
  }
  else {
    return (NSString *)@"PHAUserAnalyticsBiomeDailyTask";
  }
}

- (PHAUserAnalyticsBiomeTask)initWithTaskType:(signed __int16)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHAUserAnalyticsBiomeTask;
  double result = [(PHAUserAnalyticsBiomeTask *)&v5 init];
  if (result) {
    result->_taskType = a3;
  }
  return result;
}

@end