@interface PHARemoveFeaturedContentTask
- (BOOL)clearAllFeaturedStateForMemoriesAndSuggestionsWithPhotoLibrary:(id)a3 error:(id *)a4;
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)runWithPhotoLibrary:(id)a3 analytics:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (BOOL)shouldRunWithPhotoLibrary:(id)a3;
- (NSString)name;
- (PHARemoveFeaturedContentTask)init;
- (double)period;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHARemoveFeaturedContentTask

- (void).cxx_destruct
{
}

- (BOOL)clearAllFeaturedStateForMemoriesAndSuggestionsWithPhotoLibrary:(id)a3 error:(id *)a4
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v35 = self;
  v6 = self->_loggingConnection;
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)v6);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  v8 = v6;
  v9 = v8;
  unint64_t v39 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ClearAllFeaturedStateForMemoriesAndSuggestions", "", buf, 2u);
  }
  os_signpost_id_t spid = v7;

  uint64_t v36 = mach_absolute_time();
  v10 = [v5 librarySpecificFetchOptions];
  [v10 setWantsIncrementalChangeDetails:0];
  LOBYTE(v11) = 1;
  v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"featuredState == %d", 1);
  [v10 setPredicate:v12];

  [v10 setIncludePendingMemories:1];
  [v10 setIncludeGuestAssets:1];
  v13 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v10];
  v14 = [v5 librarySpecificFetchOptions];
  [v14 setWantsIncrementalChangeDetails:0];
  [v14 setIncludeGuestAssets:1];
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"featuredState == %d", 1);
  uint64_t v16 = [MEMORY[0x1E4F39310] predicateForAllFeaturedStateEnabledSuggestionTypesForWidget];
  v17 = (void *)MEMORY[0x1E4F28BA0];
  v37 = (void *)v16;
  v38 = (void *)v15;
  v48[0] = v16;
  v48[1] = v15;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  v19 = [v17 andPredicateWithSubpredicates:v18];
  [v14 setPredicate:v19];

  v20 = [MEMORY[0x1E4F39310] fetchAllFeaturedStateEnabledSuggestionsWithOptions:v14];
  uint64_t v21 = [v13 count];
  uint64_t v22 = [v20 count];
  if (v21 | v22)
  {
    int v23 = v22;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __101__PHARemoveFeaturedContentTask_clearAllFeaturedStateForMemoriesAndSuggestionsWithPhotoLibrary_error___block_invoke;
    v41[3] = &unk_1E69189B0;
    id v42 = v13;
    id v43 = v20;
    id v40 = 0;
    id v32 = v5;
    int v11 = [v5 performChangesAndWait:v41 error:&v40];
    id v24 = v40;
    loggingConnection = v35->_loggingConnection;
    if (v11)
    {
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v46 = v21;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v23;
        _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHARemoveFeaturedContentTask] Unfeatured %d memories and %d suggestions", buf, 0xEu);
      }
    }
    else
    {
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v46 = v21;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v23;
        LOWORD(v47[0]) = 2112;
        *(void *)((char *)v47 + 2) = v24;
        _os_log_error_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_ERROR, "[PHARemoveFeaturedContentTask] Update featured %d memories and %d suggestions - failed: %@", buf, 0x18u);
      }
      if (a4) {
        *a4 = v24;
      }
    }

    id v5 = v32;
  }
  uint64_t v26 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v29 = v9;
  v30 = v29;
  if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v30, OS_SIGNPOST_INTERVAL_END, spid, "ClearAllFeaturedStateForMemoriesAndSuggestions", "", buf, 2u);
  }

  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)v46 = "ClearAllFeaturedStateForMemoriesAndSuggestions";
    *(_WORD *)&v46[8] = 2048;
    v47[0] = (float)((float)((float)((float)(v26 - v36) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D21F2000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v11;
}

void __101__PHARemoveFeaturedContentTask_clearAllFeaturedStateForMemoriesAndSuggestionsWithPhotoLibrary_error___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        os_signpost_id_t v7 = [MEMORY[0x1E4F39170] changeRequestForMemory:*(void *)(*((void *)&v18 + 1) + 8 * v6)];
        [v7 setFeaturedState:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(MEMORY[0x1E4F39318], "changeRequestForSuggestion:", *(void *)(*((void *)&v14 + 1) + 8 * v12), (void)v14);
        [v13 setFeaturedState:0];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }
}

- (BOOL)runWithPhotoLibrary:(id)a3 analytics:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  return -[PHARemoveFeaturedContentTask clearAllFeaturedStateForMemoriesAndSuggestionsWithPhotoLibrary:error:](self, "clearAllFeaturedStateForMemoriesAndSuggestionsWithPhotoLibrary:error:", a3, a6, a5);
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHARemoveFeaturedContentTask timeoutFatal:]", "PHARemoveFeaturedContentTask.m", 77, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHARemoveFeaturedContentTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v9 workingContext];
  uint64_t v11 = [v10 photoLibrary];
  uint64_t v12 = [v9 analytics];

  LOBYTE(a5) = [(PHARemoveFeaturedContentTask *)self runWithPhotoLibrary:v11 analytics:v12 progressReporter:v8 error:a5];
  return (char)a5;
}

- (BOOL)shouldRunWithPhotoLibrary:(id)a3
{
  char v4 = PLIsFeaturedContentAllowed();
  if ((v4 & 1) == 0)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)os_signpost_id_t v7 = 0;
      _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_INFO, "[PHARemoveFeaturedContentTask] should run, featured content is disabled", v7, 2u);
    }
  }
  return v4 ^ 1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  char v4 = [a3 photoLibrary];
  LOBYTE(self) = [(PHARemoveFeaturedContentTask *)self shouldRunWithPhotoLibrary:v4];

  return (char)self;
}

- (int)priority
{
  return 1;
}

- (id)taskClassDependencies
{
  return (id)MEMORY[0x1E4F1CBF0];
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
  return -2.0;
}

- (NSString)name
{
  return (NSString *)@"PHARemoveFeaturedContentTask";
}

- (PHARemoveFeaturedContentTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)PHARemoveFeaturedContentTask;
  id v2 = [(PHARemoveFeaturedContentTask *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.PhotosGraph", "suggestions");
    loggingConnection = v2->_loggingConnection;
    v2->_loggingConnection = (OS_os_log *)v3;
  }
  return v2;
}

@end