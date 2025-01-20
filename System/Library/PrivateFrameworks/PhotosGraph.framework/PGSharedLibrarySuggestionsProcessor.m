@interface PGSharedLibrarySuggestionsProcessor
+ (BOOL)shouldIncludeAsset:(id)a3 curationContext:(id)a4 rejectionReason:(id *)a5;
+ (id)libraryScopeToUseWithPhotoLibrary:(id)a3;
- (BOOL)_commitSuggestedAssets:(id)a3 rejectedAssets:(id)a4 libraryScope:(id)a5 error:(id *)a6;
- (BOOL)_processMomentNodes:(id)a3 withGraph:(id)a4 error:(id *)a5 progressBlock:(id)a6;
- (BOOL)_suggestAssetsFromMoments:(id)a3 libraryScope:(id)a4 curationContext:(id)a5 progressBlock:(id)a6 error:(id *)a7;
- (BOOL)processSuggestionsForIncrementalChange:(id)a3 withError:(id *)a4 progressBlock:(id)a5;
- (BOOL)processSuggestionsFromStartDate:(id)a3 toDate:(id)a4 withError:(id *)a5 progressBlock:(id)a6;
- (PGSharedLibrarySuggestionsProcessor)initWithWorkingContext:(id)a3 libraryScope:(id)a4;
- (id)_momentsForMomentNodes:(id)a3 inPhotoLibrary:(id)a4;
- (id)_rulesForLibraryScope:(id)a3;
- (id)_startDateFromLibraryScopeRules:(id)a3;
- (id)evaluatorWithGraph:(id)a3;
@end

@implementation PGSharedLibrarySuggestionsProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryScopeRules, 0);
  objc_storeStrong((id *)&self->_libraryScope, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

- (id)_momentsForMomentNodes:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "localIdentifier", (void)v18);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v10);
  }

  v14 = [v6 librarySpecificFetchOptions];
  uint64_t v22 = *MEMORY[0x1E4F394A8];
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  [v14 setFetchPropertySets:v15];

  [v14 setWantsIncrementalChangeDetails:0];
  v16 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithLocalIdentifiers:v7 options:v14];

  return v16;
}

- (id)_startDateFromLibraryScopeRules:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dateRangeCondition", (void)v14);
        uint64_t v11 = v10;
        if (v10 && [v10 criteria] == 2)
        {
          uint64_t v12 = [v11 endDate];

          v4 = (void *)v12;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (id)evaluatorWithGraph:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_libraryScopeRules count])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_libraryScopeRules, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = self->_libraryScopeRules;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "plRepresentation", (void)v15);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    uint64_t v12 = [[PGMomentNodeRuleInterpreter alloc] initWithGraph:v4];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F8A900]) initWithRules:v5 andInterpreter:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_rulesForLibraryScope:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
  uint64_t v6 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
  uint64_t v7 = [v6 librarySpecificFetchOptions];

  uint64_t v8 = [MEMORY[0x1E4F39130] fetchLibraryScopeRulesForLibraryScope:v4 options:v7];
  uint64_t v9 = [v8 count];
  uint64_t v10 = v5;
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v4 localIdentifier];
      int v16 = 138412546;
      long long v17 = v12;
      __int16 v18 = 2048;
      uint64_t v19 = [v8 count];
      _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] scope: %@, with %lu rules", (uint8_t *)&v16, 0x16u);
    }
    id v13 = v8;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v15 = [v4 localIdentifier];
      int v16 = 138412290;
      long long v17 = v15;
      _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] No rules in scope: %@", (uint8_t *)&v16, 0xCu);
    }
    id v13 = 0;
  }

  return v13;
}

- (BOOL)_commitSuggestedAssets:(id)a3 rejectedAssets:(id)a4 libraryScope:(id)a5 error:(id *)a6
{
  *(double *)((char *)&v47[2] + 2) = *(double *)MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v37 = v11;
  if ([v10 count] || objc_msgSend(v11, "count"))
  {
    id v13 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
    os_signpost_id_t v14 = os_signpost_id_generate(v13);
    long long v15 = v13;
    int v16 = v15;
    unint64_t v17 = v14 - 1;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PGSharedLibrarySuggestionsProcessorPersistFromMomentsBatch", "", buf, 2u);
    }
    os_signpost_id_t spid = v14;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v36 = mach_absolute_time();
    __int16 v18 = [v12 photoLibrary];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __96__PGSharedLibrarySuggestionsProcessor__commitSuggestedAssets_rejectedAssets_libraryScope_error___block_invoke;
    v40[3] = &unk_1E68EA440;
    id v19 = v12;
    id v41 = v19;
    id v20 = v10;
    id v42 = v20;
    id v21 = v11;
    id v43 = v21;
    id v39 = 0;
    int v22 = [v18 performChangesAndWait:v40 error:&v39];
    id v38 = v39;
    if (v22)
    {
      v23 = v16;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = [v20 count];
        int v25 = [v21 count];
        v26 = [v19 localIdentifier];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v46 = v24;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v25;
        LOWORD(v47[0]) = 2112;
        *(void *)((char *)v47 + 2) = v26;
        _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] suggested %d, rejected %d assets for scope %@", buf, 0x18u);
      }
    }
    else
    {
      if (a6) {
        *a6 = v38;
      }
      v27 = v16;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v34 = [v19 localIdentifier];
        *(_DWORD *)buf = 138412546;
        *(void *)v46 = v34;
        *(_WORD *)&v46[8] = 2112;
        *(void *)&v47[0] = v38;
        _os_log_error_impl(&dword_1D1805000, v27, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] failed to suggestion assets for scope %@: %@", buf, 0x16u);
      }
    }

    uint64_t v28 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v31 = v16;
    v32 = v31;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v32, OS_SIGNPOST_INTERVAL_END, spid, "PGSharedLibrarySuggestionsProcessorPersistFromMomentsBatch", "", buf, 2u);
    }

    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v46 = "PGSharedLibrarySuggestionsProcessorPersistFromMomentsBatch";
      *(_WORD *)&v46[8] = 2048;
      v47[0] = (float)((float)((float)((float)(v28 - v36) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    LOBYTE(v22) = 1;
  }

  return v22;
}

void __96__PGSharedLibrarySuggestionsProcessor__commitSuggestedAssets_rejectedAssets_libraryScope_error___block_invoke(void *a1)
{
  id v2 = [MEMORY[0x1E4F39118] changeRequestForLibraryScope:a1[4]];
  [v2 addPreviewAssetsSuggestedByPhotos:a1[5]];
  [v2 markAssetsAsRejectedByPhotosSuggester:a1[6]];
}

- (BOOL)_suggestAssetsFromMoments:(id)a3 libraryScope:(id)a4 curationContext:(id)a5 progressBlock:(id)a6 error:(id *)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v48 = a4;
  id v49 = a5;
  id v12 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(a6);
  double v13 = 0.0;
  if (v12)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(info.numer) = 0;
      v12[2](v12, &info, 0.0);
      if (LOBYTE(info.numer))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v53 = 333;
          *(_WORD *)&v53[4] = 2080;
          *(void *)&v53[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        BOOL v15 = 0;
        goto LABEL_50;
      }
      double v13 = Current;
    }
  }
  int v16 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
  os_signpost_id_t v17 = os_signpost_id_generate(v16);
  __int16 v18 = v16;
  id v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PGSharedLibrarySuggestionsProcessorFetchAssetsFromMomentsBatch", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v20 = mach_absolute_time();
  v45 = [v48 photoLibrary];
  id v21 = [v45 librarySpecificFetchOptions];
  int v22 = +[PGCurationManager assetPropertySetsForCuration];
  [v21 setFetchPropertySets:v22];

  v23 = PLManagedAssetPredicateToFetchAssetsToEvaluateSuggestionsForLibraryScope();
  [v21 setInternalPredicate:v23];

  [v21 setWantsIncrementalChangeDetails:0];
  BOOL v15 = 1;
  [v21 setIncludeDuplicateAssetVisibilityStateMostRelevant:1];
  v44 = v21;
  int v24 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollections:v11 options:v21];
  v46 = v24;
  if (![v24 count])
  {
    uint64_t v36 = v44;
    v35 = v45;
    goto LABEL_49;
  }
  id v43 = v11;
  uint64_t v25 = v20;
  v26 = [MEMORY[0x1E4F38EB8] clsAllAssetsFromFetchResult:v24 prefetchOptions:31 curationContext:v49];
  uint64_t v27 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v30 = v19;
  v31 = v30;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v31, OS_SIGNPOST_INTERVAL_END, v17, "PGSharedLibrarySuggestionsProcessorFetchAssetsFromMomentsBatch", "", buf, 2u);
  }

  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)v53 = "PGSharedLibrarySuggestionsProcessorFetchAssetsFromMomentsBatch";
    *(_WORD *)&v53[8] = 2048;
    *(double *)&v53[10] = (float)((float)((float)((float)(v27 - v25) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (v12)
  {
    double v34 = CFAbsoluteTimeGetCurrent();
    id v11 = v43;
    if (v34 - v13 >= 0.01)
    {
      char v50 = 0;
      v12[2](v12, (mach_timebase_info *)&v50, 0.1);
      if (v50)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v53 = 355;
          *(_WORD *)&v53[4] = 2080;
          *(void *)&v53[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        BOOL v15 = 0;
        goto LABEL_47;
      }
      double v13 = v34;
    }
  }
  if (![v26 count])
  {
LABEL_37:
    BOOL v15 = [(PGSharedLibrarySuggestionsProcessor *)self _commitSuggestedAssets:v32 rejectedAssets:v33 libraryScope:v48 error:a7];
    if (!v12) {
      goto LABEL_46;
    }
    id v11 = v43;
    uint64_t v36 = v44;
    v35 = v45;
    if (CFAbsoluteTimeGetCurrent() - v13 >= 0.01)
    {
      char v50 = 0;
      v12[2](v12, (mach_timebase_info *)&v50, 1.0);
      if (v50)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v53 = 376;
          *(_WORD *)&v53[4] = 2080;
          *(void *)&v53[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        BOOL v15 = 0;
      }
    }
    goto LABEL_48;
  }
  unint64_t v37 = 0;
  double v38 = 0.1;
  while (1)
  {
    id v39 = [v26 objectAtIndexedSubscript:v37];
    id v40 = [(id)objc_opt_class() shouldIncludeAsset:v39 curationContext:v49 rejectionReason:0]? v32: v33;
    [v40 addObject:v39];
    if (50 * (v37 / 0x32) == v37)
    {
      if (![(PGSharedLibrarySuggestionsProcessor *)self _commitSuggestedAssets:v32 rejectedAssets:v33 libraryScope:v48 error:a7])goto LABEL_45; {
      [v32 removeAllObjects];
      }
      [v33 removeAllObjects];
      double v38 = v38 + 0.01;
      if (v12)
      {
        double v41 = CFAbsoluteTimeGetCurrent();
        if (v41 - v13 >= 0.01) {
          break;
        }
      }
    }
LABEL_36:

    if (++v37 >= [v26 count]) {
      goto LABEL_37;
    }
  }
  char v50 = 0;
  v12[2](v12, (mach_timebase_info *)&v50, v38);
  if (!v50)
  {
    double v13 = v41;
    goto LABEL_36;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v53 = 372;
    *(_WORD *)&v53[4] = 2080;
    *(void *)&v53[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_45:

  BOOL v15 = 0;
LABEL_46:
  id v11 = v43;
LABEL_47:
  uint64_t v36 = v44;
  v35 = v45;
LABEL_48:

LABEL_49:
LABEL_50:

  return v15;
}

- (BOOL)_processMomentNodes:(id)a3 withGraph:(id)a4 error:(id *)a5 progressBlock:(id)a6
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v68 = a4;
  id v69 = a6;
  id v11 = _Block_copy(v69);
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x2020000000;
  char v95 = 0;
  uint64_t v88 = 0;
  v89 = (double *)&v88;
  uint64_t v90 = 0x2020000000;
  uint64_t v91 = 0;
  v66 = v10;
  if (v11
    && (double v12 = CFAbsoluteTimeGetCurrent(), v12 - v89[3] >= 0.01)
    && (v89[3] = v12,
        LOBYTE(v84) = 0,
        (*((void (**)(void *, uint64_t *, double))v11 + 2))(v11, &v84, 0.0),
        char v13 = *((unsigned char *)v93 + 24) | v84,
        (*((unsigned char *)v93 + 24) = v13) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = 173;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    BOOL v14 = 0;
  }
  else
  {
    oslog = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
    v63 = a5;
    BOOL v15 = [v10 subsetWithEnoughFacesProcessed];
    v67 = [v15 subsetWithEnoughScenesProcessed];

    int v16 = v67;
    uint64_t v17 = [v67 count];
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Number of moment to evaluate with enough scene and faces processed: %zu", buf, 0xCu);
    }
    if (v17)
    {
      __int16 v18 = [(PGSharedLibrarySuggestionsProcessor *)self evaluatorWithGraph:v68];
      if (v18)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v99 = 0;
        uint64_t v84 = 0;
        v85 = (double *)&v84;
        uint64_t v86 = 0x2020000000;
        uint64_t v87 = 0x3FC999999999999ALL;
        unint64_t v19 = [v67 count];
        if (v11
          && (double v20 = CFAbsoluteTimeGetCurrent(), v20 - v89[3] >= 0.01)
          && (v89[3] = v20,
              char v83 = 0,
              (*((void (**)(void *, char *, double))v11 + 2))(v11, &v83, v85[3]),
              char v21 = *((unsigned char *)v93 + 24) | v83,
              (*((unsigned char *)v93 + 24) = v21) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v96 = 67109378;
            *(_DWORD *)v97 = 196;
            *(_WORD *)&v97[4] = 2080;
            *(void *)&v97[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v96, 0x12u);
          }
          BOOL v14 = 0;
        }
        else
        {
          int v22 = [v67 temporarySet];
          v75[0] = MEMORY[0x1E4F143A8];
          v75[1] = 3221225472;
          v75[2] = __89__PGSharedLibrarySuggestionsProcessor__processMomentNodes_withGraph_error_progressBlock___block_invoke;
          v75[3] = &unk_1E68EA3F0;
          v77 = &v84;
          double v81 = 0.3 / (double)v19;
          id v61 = v11;
          id v76 = v61;
          v78 = &v88;
          uint64_t v82 = 0x3F847AE147AE147BLL;
          v79 = &v92;
          v80 = buf;
          v62 = [v18 evaluateObjects:v22 withResultEnumerationBlock:v75];
          v60 = v18;

          if (*((unsigned char *)v93 + 24))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v96 = 67109378;
              *(_DWORD *)v97 = 201;
              *(_WORD *)&v97[4] = 2080;
              *(void *)&v97[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v96, 0x12u);
            }
            BOOL v14 = 0;
          }
          else
          {
            v59 = [MEMORY[0x1E4F1CA80] setWithSet:v62];
            v23 = oslog;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v24 = [v62 count];
              *(_DWORD *)v96 = 134217984;
              *(void *)v97 = v24;
              _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Number of moments matched by evaluator: %zu", v96, 0xCu);
            }

            if ([v59 count])
            {
              uint64_t v25 = +[PGGraphHighlightTypeNodeCollection tripTypeNodesInGraph:v68];
              v58 = [v25 highlightGroupNodes];
              v53 = v25;
              uint64_t v54 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithSet:v62 graph:v68];
              v26 = [(PGGraphMomentNodeCollection *)v54 highlightNodes];
              v57 = [v26 highlightGroupNodes];

              uint64_t v27 = [v58 collectionByIntersecting:v57];
              uint64_t v28 = [v27 count];
              v55 = v27;
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v96 = 134217984;
                *(void *)v97 = v28;
                _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Number of matched trip highlights: %zu", v96, 0xCu);
              }
              if (v28)
              {
                v29 = v23;
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v30 = [v59 count];
                  *(_DWORD *)v96 = 134217984;
                  *(void *)v97 = v30;
                  _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Number of moments before trip matching: %zu", v96, 0xCu);
                }

                v31 = [v27 momentNodes];
                id v32 = [v31 temporarySet];
                [v59 unionSet:v32];
              }
              id v33 = v23;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v34 = [v59 count];
                *(_DWORD *)v96 = 134217984;
                *(void *)v97 = v34;
                _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Total number of moments to suggest: %zu", v96, 0xCu);
              }

              v56 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
              v35 = -[PGSharedLibrarySuggestionsProcessor _momentsForMomentNodes:inPhotoLibrary:](self, "_momentsForMomentNodes:inPhotoLibrary:", v59);
              v65 = [v35 fetchedObjects];

              unint64_t v36 = [v65 count];
              v85[3] = 0.5;
              v64 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v56];
              uint64_t v37 = 0;
              id v38 = 0;
              double v39 = 0.4 / ((double)(v36 / 0x14) + 1.0);
              while (v36)
              {
                id v40 = (void *)MEMORY[0x1D25FED50]();
                v85[3] = v39 + v85[3];
                if (v11
                  && (double Current = CFAbsoluteTimeGetCurrent(), Current - v89[3] >= 0.01)
                  && (v89[3] = Current,
                      char v83 = 0,
                      (*((void (**)(id, char *, double))v61 + 2))(v61, &v83, v85[3]),
                      char v42 = *((unsigned char *)v93 + 24) | v83,
                      (*((unsigned char *)v93 + 24) = v42) != 0))
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v96 = 67109378;
                    *(_DWORD *)v97 = 239;
                    *(_WORD *)&v97[4] = 2080;
                    *(void *)&v97[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v96, 0x12u);
                  }
                  int v43 = 1;
                }
                else
                {
                  if (v36 >= 0x14) {
                    uint64_t v44 = 20;
                  }
                  else {
                    uint64_t v44 = v36;
                  }
                  v45 = objc_msgSend(v65, "subarrayWithRange:", v37, v44);
                  libraryScope = self->_libraryScope;
                  v72[0] = MEMORY[0x1E4F143A8];
                  v72[1] = 3221225472;
                  v72[2] = __89__PGSharedLibrarySuggestionsProcessor__processMomentNodes_withGraph_error_progressBlock___block_invoke_208;
                  v72[3] = &unk_1E68EA418;
                  id v73 = v69;
                  v74 = &v84;
                  id v71 = v38;
                  BOOL v47 = [(PGSharedLibrarySuggestionsProcessor *)self _suggestAssetsFromMoments:v45 libraryScope:libraryScope curationContext:v64 progressBlock:v72 error:&v71];
                  id v48 = v71;

                  if (v47) {
                    uint64_t v49 = v44;
                  }
                  else {
                    uint64_t v49 = 0;
                  }

                  v36 -= v49;
                  v37 += v49;
                  int v43 = !v47;
                  id v38 = v48;
                }
                if (v43) {
                  goto LABEL_50;
                }
              }
              if (v63 && v38)
              {
                id v38 = v38;
                BOOL v14 = 0;
                id *v63 = v38;
              }
              else
              {
                if (v11)
                {
                  double v50 = CFAbsoluteTimeGetCurrent();
                  if (v50 - v89[3] >= 0.01)
                  {
                    v89[3] = v50;
                    char v83 = 0;
                    (*((void (**)(id, char *, double))v61 + 2))(v61, &v83, 1.0);
                    char v51 = *((unsigned char *)v93 + 24) | v83;
                    *((unsigned char *)v93 + 24) = v51;
                    if (v51)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)v96 = 67109378;
                        *(_DWORD *)v97 = 256;
                        *(_WORD *)&v97[4] = 2080;
                        *(void *)&v97[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
                        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v96, 0x12u);
                      }
LABEL_50:
                      BOOL v14 = 0;
                      goto LABEL_61;
                    }
                  }
                }
                BOOL v14 = 1;
              }
LABEL_61:
            }
            else
            {
              BOOL v14 = 1;
            }
          }
          __int16 v18 = v60;
        }
        _Block_object_dispose(&v84, 8);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        BOOL v14 = 1;
      }

      int v16 = v67;
    }
    else
    {
      BOOL v14 = 1;
    }
  }
  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v92, 8);

  return v14;
}

void __89__PGSharedLibrarySuggestionsProcessor__processMomentNodes_withGraph_error_progressBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 72)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 80))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                               + 24));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }
    }
  }
}

uint64_t __89__PGSharedLibrarySuggestionsProcessor__processMomentNodes_withGraph_error_progressBlock___block_invoke_208(uint64_t a1)
{
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (BOOL)processSuggestionsForIncrementalChange:(id)a3 withError:(id *)a4 progressBlock:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = _Block_copy(v9);
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  uint64_t v51 = 0;
  v52 = (double *)&v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  if (!v10
    || (double v11 = CFAbsoluteTimeGetCurrent(), v11 - v52[3] < 0.01)
    || (v52[3] = v11,
        LOBYTE(v59) = 0,
        (*((void (**)(void *, int *, double))v10 + 2))(v10, &v59, 0.0),
        char v12 = *((unsigned char *)v56 + 24) | v59,
        (*((unsigned char *)v56 + 24) = v12) == 0))
  {
    BOOL v14 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
    if (![(NSArray *)self->_libraryScopeRules count])
    {
      BOOL v13 = 1;
LABEL_31:

      goto LABEL_32;
    }
    id v38 = a4;
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    int v16 = [v8 uuidsOfMomentsToInsert];
    [v15 unionSet:v16];

    uint64_t v17 = [v8 uuidsOfMomentsToUpdate];
    [v15 unionSet:v17];

    BOOL v13 = 1;
    if (![v15 count])
    {
LABEL_30:

      goto LABEL_31;
    }
    uint64_t buf = 0;
    *(void *)&long long v62 = &buf;
    *((void *)&v62 + 1) = 0x2020000000;
    char v63 = 1;
    __int16 v18 = v14;
    unint64_t v19 = v14;
    os_signpost_id_t v20 = os_signpost_id_generate(v19);
    char v21 = v19;
    int v22 = v21;
    os_signpost_id_t spid = v20;
    unint64_t v23 = v20 - 1;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      LOWORD(v59) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v22, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PGSharedLibrarySuggestionsProcessorIncremental", "", (uint8_t *)&v59, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v36 = mach_absolute_time();
    workingContext = self->_workingContext;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsForIncrementalChange_withError_progressBlock___block_invoke;
    v41[3] = &unk_1E68EA3C8;
    v41[4] = self;
    uint64_t v25 = v22;
    char v42 = v25;
    id v43 = v15;
    p_uint64_t buf = &buf;
    id v48 = v38;
    id v26 = v10;
    id v44 = v26;
    v46 = &v51;
    uint64_t v49 = 0x3F847AE147AE147BLL;
    BOOL v47 = &v55;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v41];
    BOOL v14 = v18;
    if (*((unsigned char *)v56 + 24))
    {
      uint64_t v27 = v25;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v59 = 67109378;
        LODWORD(v60[0]) = 164;
        WORD2(v60[0]) = 2080;
        *(void *)((char *)v60 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
        uint64_t v28 = MEMORY[0x1E4F14500];
LABEL_15:
        _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v59, 0x12u);
      }
    }
    else
    {
      uint64_t v39 = mach_absolute_time();
      uint64_t v27 = v25;
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      v31 = v25;
      id v32 = v31;
      if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        LOWORD(v59) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v32, OS_SIGNPOST_INTERVAL_END, spid, "PGSharedLibrarySuggestionsProcessorIncremental", "", (uint8_t *)&v59, 2u);
      }

      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        int v59 = 136315394;
        v60[0] = "PGSharedLibrarySuggestionsProcessorIncremental";
        LOWORD(v60[1]) = 2048;
        *(double *)((char *)&v60[1] + 2) = (float)((float)((float)((float)(v39 - v36) * (float)numer) / (float)denom)
                                                 / 1000000.0);
        _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v59, 0x16u);
      }
      if (!v10
        || (double Current = CFAbsoluteTimeGetCurrent(), Current - v52[3] < 0.01)
        || (v52[3] = Current,
            char v40 = 0,
            (*((void (**)(id, char *, double))v26 + 2))(v26, &v40, 1.0),
            char v34 = *((unsigned char *)v56 + 24) | v40,
            (*((unsigned char *)v56 + 24) = v34) == 0))
      {
        BOOL v13 = *(unsigned char *)(v62 + 24) != 0;
        goto LABEL_29;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v59 = 67109378;
        LODWORD(v60[0]) = 167;
        WORD2(v60[0]) = 2080;
        *(void *)((char *)v60 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
        uint64_t v28 = MEMORY[0x1E4F14500];
        goto LABEL_15;
      }
    }
    BOOL v13 = 0;
LABEL_29:

    _Block_object_dispose(&buf, 8);
    goto LABEL_30;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 0x7104000202;
    LOWORD(v62) = 2080;
    *(void *)((char *)&v62 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  BOOL v13 = 0;
LABEL_32:
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  return v13;
}

void __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsForIncrementalChange_withError_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _startDateFromLibraryScopeRules:*(void *)(*(void *)(a1 + 32) + 24)];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  if ([v4 compare:v5] == -1)
  {
    id v7 = [v3 graph];
    id v8 = +[PGGraphMomentNodeCollection momentNodesForUUIDs:*(void *)(a1 + 48) inGraph:v7];
    uint64_t v9 = [v8 count];
    if (v9 == [*(id *)(a1 + 48) count])
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v4 endDate:v5];
      double v11 = +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:v10 inGraph:v7];
      char v12 = [v8 collectionByIntersecting:v11];

      uint64_t v13 = [v12 count];
      BOOL v14 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 138412802;
        uint64_t v24 = v4;
        __int16 v25 = 2112;
        id v26 = v5;
        __int16 v27 = 2048;
        uint64_t v28 = v13;
        _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Number of incremental moment to evaluate between %@ and %@: %zu", buf, 0x20u);
      }
      if (v13)
      {
        id v15 = *(void **)(a1 + 32);
        uint64_t v16 = *(void *)(a1 + 88);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsForIncrementalChange_withError_progressBlock___block_invoke_203;
        v19[3] = &unk_1E68F03F8;
        id v20 = *(id *)(a1 + 56);
        uint64_t v22 = *(void *)(a1 + 96);
        long long v21 = *(_OWORD *)(a1 + 72);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v15 _processMomentNodes:v12 withGraph:v7 error:v16 progressBlock:v19];
      }
      id v8 = v12;
    }
    else
    {
      uint64_t v17 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = *(void **)(a1 + 48);
        *(_DWORD *)uint64_t buf = 138412546;
        uint64_t v24 = v18;
        __int16 v25 = 2112;
        id v26 = v8;
        _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] Failed to fetch moment nodes for %@, fetched: %@. Stopping the task", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }
  else
  {
    id v6 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 138412546;
      uint64_t v24 = v4;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] Library start date is after end date: %@ - %@", buf, 0x16u);
    }
  }
}

void __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsForIncrementalChange_withError_progressBlock___block_invoke_203(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (BOOL)processSuggestionsFromStartDate:(id)a3 toDate:(id)a4 withError:(id *)a5 progressBlock:(id)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = _Block_copy(v12);
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = (double *)&v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  if (!v13
    || (double v14 = CFAbsoluteTimeGetCurrent(), v14 - v51[3] < 0.01)
    || (v51[3] = v14,
        LOBYTE(v58) = 0,
        (*((void (**)(void *, int *, double))v13 + 2))(v13, &v58, 0.0),
        char v15 = *((unsigned char *)v55 + 24) | v58,
        (*((unsigned char *)v55 + 24) = v15) == 0))
  {
    if (![(NSArray *)self->_libraryScopeRules count])
    {
      LOBYTE(a5) = 1;
      goto LABEL_34;
    }
    uint64_t v16 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
    if ([v10 compare:v11] != -1)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t buf = 138412546;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] Invalid start date or end date: %@ - %@", buf, 0x16u);
        if (!a5) {
          goto LABEL_33;
        }
      }
      else if (!a5)
      {
LABEL_33:

        goto LABEL_34;
      }
      uint64_t v17 = [NSString stringWithFormat:@"Invalid start date or end date: %@ - %@", v10, v11];
      *a5 = +[PGError errorWithCode:-1 description:v17];

      LOBYTE(a5) = 0;
      goto LABEL_33;
    }
    *(void *)uint64_t buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    unsigned char buf[24] = 1;
    uint64_t v37 = v16;
    __int16 v18 = v16;
    os_signpost_id_t v19 = os_signpost_id_generate(v18);
    id v20 = v18;
    long long v21 = v20;
    os_signpost_id_t spid = v19;
    unint64_t v22 = v19 - 1;
    if (v22 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      LOWORD(v58) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v21, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PGSharedLibrarySuggestionsProcessor", "", (uint8_t *)&v58, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v35 = mach_absolute_time();
    workingContext = self->_workingContext;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsFromStartDate_toDate_withError_progressBlock___block_invoke;
    v39[3] = &unk_1E68EA3A0;
    v39[4] = self;
    id v40 = v10;
    id v41 = v11;
    uint64_t v24 = v21;
    char v42 = v24;
    id v44 = buf;
    BOOL v47 = a5;
    id v25 = v13;
    id v43 = v25;
    v45 = &v50;
    uint64_t v48 = 0x3F847AE147AE147BLL;
    v46 = &v54;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v39];
    uint64_t v16 = v37;
    if (*((unsigned char *)v55 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v58 = 67109378;
        LODWORD(v59[0]) = 104;
        WORD2(v59[0]) = 2080;
        *(void *)((char *)v59 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
        id v26 = MEMORY[0x1E4F14500];
LABEL_19:
        _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v58, 0x12u);
      }
    }
    else
    {
      uint64_t v34 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      uint64_t v29 = v24;
      uint64_t v30 = v29;
      if (v22 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        LOWORD(v58) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v30, OS_SIGNPOST_INTERVAL_END, spid, "PGSharedLibrarySuggestionsProcessor", "", (uint8_t *)&v58, 2u);
      }

      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        int v58 = 136315394;
        v59[0] = "PGSharedLibrarySuggestionsProcessor";
        LOWORD(v59[1]) = 2048;
        *(double *)((char *)&v59[1] + 2) = (float)((float)((float)((float)(v34 - v35) * (float)numer) / (float)denom)
                                                 / 1000000.0);
        _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v58, 0x16u);
      }
      if (!v13
        || (double Current = CFAbsoluteTimeGetCurrent(), Current - v51[3] < 0.01)
        || (v51[3] = Current,
            char v38 = 0,
            (*((void (**)(id, char *, double))v25 + 2))(v25, &v38, 1.0),
            char v32 = *((unsigned char *)v55 + 24) | v38,
            (*((unsigned char *)v55 + 24) = v32) == 0))
      {
        LOBYTE(a5) = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
        goto LABEL_32;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v58 = 67109378;
        LODWORD(v59[0]) = 107;
        WORD2(v59[0]) = 2080;
        *(void *)((char *)v59 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
        id v26 = MEMORY[0x1E4F14500];
        goto LABEL_19;
      }
    }
    LOBYTE(a5) = 0;
LABEL_32:

    _Block_object_dispose(buf, 8);
    goto LABEL_33;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 64;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  LOBYTE(a5) = 0;
LABEL_34:
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

  return (char)a5;
}

void __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsFromStartDate_toDate_withError_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _startDateFromLibraryScopeRules:*(void *)(*(void *)(a1 + 32) + 24)];
  id v5 = [*(id *)(a1 + 40) laterDate:v4];
  if ([v5 compare:*(void *)(a1 + 48)] == -1)
  {
    id v8 = [v3 graph];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:*(void *)(a1 + 48)];
    id v10 = +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:v9 inGraph:v8];
    uint64_t v11 = [v10 count];
    id v12 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)uint64_t buf = 138412802;
      long long v21 = v5;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      __int16 v24 = 2048;
      uint64_t v25 = v11;
      _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Number of moment to evaluate between %@ and %@: %zu", buf, 0x20u);
    }
    if (v11)
    {
      double v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 96);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsFromStartDate_toDate_withError_progressBlock___block_invoke_197;
      v16[3] = &unk_1E68F03F8;
      id v17 = *(id *)(a1 + 64);
      uint64_t v19 = *(void *)(a1 + 104);
      long long v18 = *(_OWORD *)(a1 + 80);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v14 _processMomentNodes:v10 withGraph:v8 error:v15 progressBlock:v16];
    }
  }
  else
  {
    id v6 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)uint64_t buf = 138412546;
      long long v21 = v5;
      __int16 v22 = 2112;
      uint64_t v23 = v7;
      _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] Interval start date is after end date: %@ - %@", buf, 0x16u);
    }
  }
}

void __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsFromStartDate_toDate_withError_progressBlock___block_invoke_197(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (PGSharedLibrarySuggestionsProcessor)initWithWorkingContext:(id)a3 libraryScope:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGSharedLibrarySuggestionsProcessor;
  uint64_t v9 = [(PGSharedLibrarySuggestionsProcessor *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workingContext, a3);
    objc_storeStrong((id *)&v10->_libraryScope, a4);
    uint64_t v11 = [(PGSharedLibrarySuggestionsProcessor *)v10 _rulesForLibraryScope:v8];
    libraryScopeRules = v10->_libraryScopeRules;
    v10->_libraryScopeRules = (NSArray *)v11;
  }
  return v10;
}

+ (id)libraryScopeToUseWithPhotoLibrary:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 librarySpecificFetchOptions];
  id v4 = [MEMORY[0x1E4F39110] fetchActiveLibraryScopeWithOptions:v3];
  if ([v4 count])
  {
    id v5 = [v4 firstObject];
    if ((unint64_t)[v4 count] >= 2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v8 = [v5 localIdentifier];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] more than 1 active scope configured, using first one: %@", (uint8_t *)&v9, 0xCu);
    }
    if ([v5 autoSharePolicy] == 2)
    {
      id v6 = v5;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PGSharedLibrarySuggestionsProcessor] active scope does not have rules", (uint8_t *)&v9, 2u);
      }
      id v6 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PGSharedLibrarySuggestionsProcessor] no active scope", (uint8_t *)&v9, 2u);
    }
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)shouldIncludeAsset:(id)a3 curationContext:(id)a4 rejectionReason:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [v7 curationScore];
  if (v9 < *MEMORY[0x1E4F8E740])
  {
    char v13 = 0;
    objc_super v14 = @"Utility Asset";
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F8E780];
    uint64_t v11 = [v7 curationProperties];
    id v12 = [v11 importedByBundleIdentifier];
    LOBYTE(v10) = [v10 isBlocklistedImportedByBundleIdentifier:v12];

    if (v10)
    {
      char v13 = 0;
      objc_super v14 = @"Imported Asset";
    }
    else if [v7 isFavorite] && (objc_msgSend(v7, "clsIsUtility"))
    {
      char v13 = 0;
      objc_super v14 = @"Favorited Utility Asset";
    }
    else
    {
      uint64_t v16 = [v7 curationModel];
      char v17 = [v16 isMemeWithAsset:v7];

      if (v17)
      {
        char v13 = 0;
        objc_super v14 = @"Meme Asset";
      }
      else
      {
        long long v18 = [v7 clsConsolidatedPersonLocalIdentifiers];
        uint64_t v19 = [v7 clsPetLocalIdentifiers];
        id v20 = [v18 arrayByAddingObjectsFromArray:v19];

        if ([v20 count])
        {
          id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          uint64_t v35 = v20;
          id v22 = v20;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v43 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v37 != v25) {
                  objc_enumerationMutation(v22);
                }
                __int16 v27 = [MEMORY[0x1E4F391D0] uuidFromLocalIdentifier:*(void *)(*((void *)&v36 + 1) + 8 * i)];
                [v21 addObject:v27];
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v43 count:16];
            }
            while (v24);
          }

          uint64_t v28 = [v7 uuid];
          uint64_t v29 = [v8 userFeedbackCalculator];
          char v42 = v28;
          uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
          id v40 = v28;
          id v41 = v21;
          v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
          [v29 scoreForAssetUUIDs:v30 personsUUIDsByAssetUUIDs:v31];
          double v33 = v32;

          int v34 = [MEMORY[0x1E4F39338] score:v33 meetsScoreThreshold:*MEMORY[0x1E4F39850]];
          if (v34) {
            objc_super v14 = @"User Feedback";
          }
          else {
            objc_super v14 = 0;
          }
          char v13 = v34 ^ 1;

          id v20 = v35;
        }
        else
        {
          objc_super v14 = 0;
          char v13 = 1;
        }
      }
    }
  }
  if (a5) {
    *a5 = v14;
  }

  return v13;
}

@end