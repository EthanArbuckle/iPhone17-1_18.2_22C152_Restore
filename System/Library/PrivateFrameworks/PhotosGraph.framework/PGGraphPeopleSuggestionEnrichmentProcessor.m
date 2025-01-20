@interface PGGraphPeopleSuggestionEnrichmentProcessor
- (void)_performPeopleSuggestionForHomeWithManager:(id)a3 progressBlock:(id)a4;
- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6;
@end

@implementation PGGraphPeopleSuggestionEnrichmentProcessor

- (void)_performPeopleSuggestionForHomeWithManager:(id)a3 progressBlock:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 photoLibrary];
  v35 = v34 = v4;
  v5 = [v4 suggestedPersonsForHome];
  v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v40 + 1) + 8 * v12) objectForKeyedSubscript:@"localIdentifier"];
        if ([v13 length])
        {
          [v6 addObject:v13];
          v14 = [MEMORY[0x1E4F391D0] uuidFromLocalIdentifier:v13];
          [v7 addObject:v14];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v10);
  }

  if ([v6 count])
  {
    v15 = [v35 librarySpecificFetchOptions];
    v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"suggestedForClientType", 0);
    [v15 setInternalPredicate:v16];

    v17 = (void *)MEMORY[0x1E4F391F0];
    v18 = [v6 allObjects];
    v19 = [v17 fetchPersonsWithLocalIdentifiers:v18 options:v15];

    v33 = v19;
    uint64_t v20 = [v19 count];
    v21 = [v35 librarySpecificFetchOptions];
    v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %d && NOT (%K IN %@)", @"suggestedForClientType", 1, @"personUUID", v7];
    [v21 setInternalPredicate:v22];

    v23 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v21];
    uint64_t v24 = [v23 count];
    if (v20 | v24)
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __103__PGGraphPeopleSuggestionEnrichmentProcessor__performPeopleSuggestionForHomeWithManager_progressBlock___block_invoke;
      v37[3] = &unk_1E68EED30;
      id v38 = v33;
      id v39 = v23;
      id v36 = 0;
      char v25 = [v35 performChangesAndWait:v37 error:&v36];
      id v32 = v36;
      if ((v25 & 1) == 0)
      {
        v26 = +[PGLogging sharedLogging];
        v27 = [v26 loggingConnection];

        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v45 = (uint64_t)v32;
          _os_log_error_impl(&dword_1D1805000, v27, OS_LOG_TYPE_ERROR, "Failed to persist people suggestion for home: %@", buf, 0xCu);
        }
      }
    }
    v28 = +[PGLogging sharedLogging];
    v29 = [v28 loggingConnection];

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [v6 count];
      *(_DWORD *)buf = 134218496;
      uint64_t v45 = v30;
      __int16 v46 = 2048;
      uint64_t v47 = v20;
      __int16 v48 = 2048;
      uint64_t v49 = v24;
      _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_DEFAULT, "Suggesting %lu persons for client home (newly persisted: %lu, newly removed: %lu).", buf, 0x20u);
    }
  }
  else
  {
    v31 = +[PGLogging sharedLogging];
    v15 = [v31 loggingConnection];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_DEFAULT, "Found no persons to suggest for client home.", buf, 2u);
    }
  }
}

void __103__PGGraphPeopleSuggestionEnrichmentProcessor__performPeopleSuggestionForHomeWithManager_progressBlock___block_invoke(uint64_t a1)
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
        v7 = [MEMORY[0x1E4F39200] changeRequestForPerson:*(void *)(*((void *)&v18 + 1) + 8 * v6)];
        [v7 persistSuggestionForClient:1];

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
        v13 = objc_msgSend(MEMORY[0x1E4F39200], "changeRequestForPerson:", *(void *)(*((void *)&v14 + 1) + 8 * v12), (void)v14);
        [v13 persistSuggestionForClient:0];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  uint64_t v12 = [v9 enrichmentLoggingConnection];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  long long v14 = v12;
  long long v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGGraphPeopleSuggestionEnrichmentProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v16 = mach_absolute_time();
  int v17 = [v11 isResumingFullAnalysis];

  if (v17)
  {
    [(PGGraphPeopleSuggestionEnrichmentProcessor *)self _performPeopleSuggestionForHomeWithManager:v9 progressBlock:v10];
    [(PGGraphPeopleSuggestionEnrichmentProcessor *)self _performPeopleSuggestionForSharedLibraryWithManager:v9 progressBlock:v10];
    uint64_t v18 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    long long v21 = v15;
    v22 = v21;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v22, OS_SIGNPOST_INTERVAL_END, v13, "PGGraphPeopleSuggestionEnrichmentProcessor", "", buf, 2u);
    }

    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      char v25 = "PGGraphPeopleSuggestionEnrichmentProcessor";
      __int16 v26 = 2048;
      double v27 = (float)((float)((float)((float)(v18 - v16) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
}

@end