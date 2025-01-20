@interface PGLandscapeWallpaperSuggester
+ (BOOL)candidate:(id)a3 passesFilteringWithContext:(id)a4 curationContext:(id)a5 thresholdHelper:(id)a6 statistics:(id *)a7;
+ (BOOL)filtersForAmbientSuggestions;
+ (BOOL)filtersForTopSuggestions;
+ (BOOL)isPositiveLandscapeAsset:(id)a3;
+ (BOOL)passesFilteringWithAsset:(id)a3 curationContext:(id)a4 orientation:(int64_t)a5 reason:(id *)a6;
+ (id)candidatesFromAssets:(id)a3;
+ (id)prefilteringInternalPredicateWithForbiddenAssetUUIDs:(id)a3;
+ (id)suggestionSubtypes;
+ (id)suggestionTypes;
- (PGLandscapeWallpaperSuggester)initWithSession:(id)a3;
- (PGLandscapeWallpaperSuggesterDistancingContext)distancingContext;
- (PGLandscapeWallpaperSuggesterFilteringContext)primaryFilteringContext;
- (PGLandscapeWallpaperSuggesterFilteringContext)secondaryFilteringContext;
- (PGLandscapeWallpaperSuggesterScoringContext)scoringContext;
- (id)fetchCandidateAssets;
- (id)fetchUnsortedCandidatesWithProgressReporter:(id)a3;
- (id)sortedDedupedCandidatesFromCandidates:(id)a3;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
- (void)logPosterFilteringStatistics:(id *)a3;
- (void)setDistancingContext:(id)a3;
- (void)setPrimaryFilteringContext:(id)a3;
- (void)setScoringContext:(id)a3;
- (void)setSecondaryFilteringContext:(id)a3;
- (void)setupFilteringContexts;
@end

@implementation PGLandscapeWallpaperSuggester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distancingContext, 0);
  objc_storeStrong((id *)&self->_scoringContext, 0);
  objc_storeStrong((id *)&self->_secondaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_primaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_peopleSceneConfidenceThresholdHelper, 0);
  objc_storeStrong((id *)&self->_assetGater, 0);
}

- (void)setDistancingContext:(id)a3
{
}

- (PGLandscapeWallpaperSuggesterDistancingContext)distancingContext
{
  return self->_distancingContext;
}

- (void)setScoringContext:(id)a3
{
}

- (PGLandscapeWallpaperSuggesterScoringContext)scoringContext
{
  return self->_scoringContext;
}

- (void)setSecondaryFilteringContext:(id)a3
{
}

- (PGLandscapeWallpaperSuggesterFilteringContext)secondaryFilteringContext
{
  return self->_secondaryFilteringContext;
}

- (void)setPrimaryFilteringContext:(id)a3
{
}

- (PGLandscapeWallpaperSuggesterFilteringContext)primaryFilteringContext
{
  return self->_primaryFilteringContext;
}

- (id)sortedDedupedCandidatesFromCandidates:(id)a3
{
  v70[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v47 = [(PGAbstractSuggester *)self session];
  v5 = [v47 loggingConnection];
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  unint64_t v45 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PGLandscapeWallpaperSuggesterDedupeAndRank", "", buf, 2u);
  }
  os_signpost_id_t spid = v6;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v43 = mach_absolute_time();
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F8A780]) initWithDistanceBlock:&__block_literal_global_415];
  v10 = [(PGLandscapeWallpaperSuggester *)self primaryFilteringContext];
  [v10 timeIntervalForCandidateDeduping];
  objc_msgSend(v9, "setMaximumDistance:");

  [v9 setMinimumNumberOfObjects:1];
  v46 = v9;
  v48 = v4;
  v11 = [v9 performWithDataset:v4 progressBlock:&__block_literal_global_417];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12 = v8;
    uint64_t v13 = [v11 count];
    *(_DWORD *)buf = 134217984;
    v65 = (const char *)v13;
    _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Deduped to %lu clusters", buf, 0xCu);
  }
  v44 = v8;
  v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.favorite" ascending:0];
  v70[0] = v14;
  v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.mediaAnalysisProperties.wallpaperScore" ascending:0];
  v70[1] = v15;
  v16 = (void *)MEMORY[0x1E4F8E880];
  v17 = [(PGLandscapeWallpaperSuggester *)self primaryFilteringContext];
  v18 = objc_msgSend(v16, "cropScoreSortDescriptorForOrientation:", objc_msgSend(v17, "orientation"));
  v70[2] = v18;
  v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.creationDate" ascending:0];
  v70[3] = v19;
  v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.uuid" ascending:1];
  v70[4] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:5];

  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v11;
  uint64_t v52 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v60 != v51) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        v24 = (void *)MEMORY[0x1D25FED50]();
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        v25 = [v23 objects];
        uint64_t v26 = [v25 countByEnumeratingWithState:&v55 objects:v68 count:16];
        if (!v26)
        {
          v28 = v25;
          goto LABEL_21;
        }
        uint64_t v27 = v26;
        v53 = v24;
        uint64_t v54 = i;
        v28 = 0;
        uint64_t v29 = *(void *)v56;
        do
        {
          uint64_t v30 = 0;
          v31 = v28;
          do
          {
            if (*(void *)v56 != v29) {
              objc_enumerationMutation(v25);
            }
            v32 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *(void *)(*((void *)&v55 + 1) + 8 * v30), v31, 0);
            v33 = [v32 sortedArrayUsingDescriptors:v21];
            v28 = [v33 firstObject];

            ++v30;
            v31 = v28;
          }
          while (v27 != v30);
          uint64_t v27 = [v25 countByEnumeratingWithState:&v55 objects:v68 count:16];
        }
        while (v27);

        v24 = v53;
        uint64_t i = v54;
        if (v28)
        {
          [v49 addObject:v28];
LABEL_21:
        }
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
    }
    while (v52);
  }

  [v49 sortUsingDescriptors:v21];
  v34 = v44;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    uint64_t v35 = [v49 count];
    *(_DWORD *)buf = 134217984;
    v65 = (const char *)v35;
    _os_log_impl(&dword_1D1805000, v34, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Ranked & deduped to %lu candidates", buf, 0xCu);
  }

  uint64_t v36 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v39 = v34;
  v40 = v39;
  if (v45 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v40, OS_SIGNPOST_INTERVAL_END, spid, "PGLandscapeWallpaperSuggesterDedupeAndRank", "", buf, 2u);
  }

  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v65 = "PGLandscapeWallpaperSuggesterDedupeAndRank";
    __int16 v66 = 2048;
    double v67 = (float)((float)((float)((float)(v36 - v43) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v49;
}

double __71__PGLandscapeWallpaperSuggester_sortedDedupedCandidatesFromCandidates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 asset];
  os_signpost_id_t v6 = [v5 creationDate];
  v7 = [v4 asset];

  v8 = [v7 creationDate];
  [v6 timeIntervalSinceDate:v8];
  double v10 = fabs(v9);

  return v10;
}

- (void)logPosterFilteringStatistics:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = [(PGAbstractSuggester *)self session];
  v5 = [v4 loggingConnection];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int var0 = a3->var0;
    int var1 = a3->var1;
    int var2 = a3->var2;
    int var3 = a3->var3;
    int var4 = a3->var4;
    int var5 = a3->var5;
    int var6 = a3->var6;
    int var7 = a3->var7;
    int var8 = a3->var8;
    int var9 = a3->var9;
    int var10 = a3->var10;
    v17[0] = 67111680;
    v17[1] = var0;
    __int16 v18 = 1024;
    int v19 = var1;
    __int16 v20 = 1024;
    int v21 = var2;
    __int16 v22 = 1024;
    int v23 = var3;
    __int16 v24 = 1024;
    int v25 = var4;
    __int16 v26 = 1024;
    int v27 = var5;
    __int16 v28 = 1024;
    int v29 = var6;
    __int16 v30 = 1024;
    int v31 = var7;
    __int16 v32 = 1024;
    int v33 = var8;
    __int16 v34 = 1024;
    int v35 = var9;
    __int16 v36 = 1024;
    int v37 = var10;
    _os_log_impl(&dword_1D1805000, v5, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Filtered out %d for isUtility, %d for avoidForKeyAsset, %d for aesthetics, %d for wallpaper score, %d for clock overlap, %d for low resolution, %d for crop score, %d for not safe for display, %d for positive people scene, %d for low light, %d for sensitive location", (uint8_t *)v17, 0x44u);
  }
}

- (id)fetchUnsortedCandidatesWithProgressReporter:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = 295;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    long long v57 = [(PGAbstractSuggester *)self session];
    os_signpost_id_t v6 = [v57 loggingConnection];
    long long v56 = [(PGLandscapeWallpaperSuggester *)self fetchCandidateAssets];
    uint64_t v51 = v6;
    if ([v4 isCancelledWithProgress:0.2])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 301;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v5 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v8 = v6;
      os_signpost_id_t v9 = os_signpost_id_generate(v8);
      double v10 = v8;
      v11 = v10;
      unint64_t v50 = v9 - 1;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGLandscapeWallpaperSuggesterFilterCandidates", "", buf, 2u);
      }
      os_signpost_id_t spid = v9;

      mach_timebase_info info = 0;
      mach_timebase_info(&info);
      uint64_t v49 = mach_absolute_time();
      uint64_t v12 = [v56 count];
      int v55 = v12;
      unint64_t v13 = v12 + 199;
      long long v90 = 0u;
      memset(v91, 0, 28);
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v74 = 0u;
      memset(v75, 0, 28);
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      v14 = [v57 curationContext];
      if (v13 >= 0xC8)
      {
        unint64_t v26 = 0;
        unint64_t v52 = v13 / 0xC8;
        double v27 = 1.0 / (double)(v13 / 0xC8) * 0.8;
        *(void *)&long long v15 = 134218240;
        long long v47 = v15;
        os_log_t oslog = v11;
        uint64_t v54 = v4;
        while (1)
        {
          context = (void *)MEMORY[0x1D25FED50]();
          unint64_t v60 = v26;
          long long v58 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v47, spid);
          __int16 v28 = objc_msgSend(v56, "objectsAtIndexes:");
          int v29 = (void *)MEMORY[0x1E4F38EB8];
          __int16 v30 = [v57 curationContext];
          [v29 prefetchOnAssets:v28 options:14 curationContext:v30];

          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id obj = v28;
          int v31 = off_1E68E2000;
          uint64_t v63 = [obj countByEnumeratingWithState:&v64 objects:v84 count:16];
          if (v63)
          {
            uint64_t v62 = *(void *)v65;
            do
            {
              for (uint64_t i = 0; i != v63; ++i)
              {
                if (*(void *)v65 != v62) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v33 = *(void *)(*((void *)&v64 + 1) + 8 * i);
                __int16 v34 = (void *)MEMORY[0x1D25FED50]();
                int v35 = (void *)[objc_alloc(v31[199]) initWithAsset:v33];
                __int16 v36 = objc_opt_class();
                int v37 = [(PGLandscapeWallpaperSuggester *)self primaryFilteringContext];
                LODWORD(v36) = [v36 candidate:v35 passesFilteringWithContext:v37 curationContext:v14 thresholdHelper:self->_peopleSceneConfidenceThresholdHelper statistics:buf];

                if (v36)
                {
                  uint64_t v38 = [(PGLandscapeWallpaperSuggester *)self secondaryFilteringContext];
                  if (!v38) {
                    goto LABEL_38;
                  }
                  v39 = (void *)v38;
                  v40 = objc_opt_class();
                  [(PGLandscapeWallpaperSuggester *)self secondaryFilteringContext];
                  v42 = id v41 = v7;
                  LODWORD(v40) = [v40 candidate:v35 passesFilteringWithContext:v42 curationContext:v14 thresholdHelper:self->_peopleSceneConfidenceThresholdHelper statistics:&v68];

                  id v7 = v41;
                  int v31 = off_1E68E2000;

                  if (v40) {
LABEL_38:
                  }
                    [v7 addObject:v35];
                }
              }
              uint64_t v63 = [obj countByEnumeratingWithState:&v64 objects:v84 count:16];
            }
            while (v63);
          }

          v11 = oslog;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v43 = oslog;
            uint64_t v44 = [v58 firstIndex];
            uint64_t v45 = [v58 lastIndex];
            *(_DWORD *)v77 = v47;
            *(void *)&v77[4] = v44;
            *(_WORD *)&v77[12] = 2048;
            *(void *)&v77[14] = v45;
            _os_log_debug_impl(&dword_1D1805000, v43, OS_LOG_TYPE_DEBUG, "[PGLandscapeWallpaperSuggester] processed candidates from %lu to %lu", v77, 0x16u);
          }
          id v4 = v54;
          if ([v54 isCancelledWithProgress:v27 * (double)v60 + 0.2]) {
            break;
          }

          unint64_t v26 = v60 + 1;
          if (v60 + 1 == v52) {
            goto LABEL_13;
          }
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v77 = 67109378;
          *(_DWORD *)&v77[4] = 335;
          *(_WORD *)&v77[8] = 2080;
          *(void *)&v77[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v77, 0x12u);
        }

        id v5 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
LABEL_13:
        v16 = v14;
        v17 = v7;
        uint64_t v18 = mach_absolute_time();
        uint32_t numer = info.numer;
        uint32_t denom = info.denom;
        int v21 = v11;
        __int16 v22 = v21;
        if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
        {
          *(_WORD *)v77 = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v22, OS_SIGNPOST_INTERVAL_END, spid, "PGLandscapeWallpaperSuggesterFilterCandidates", "", v77, 2u);
        }

        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v77 = 136315394;
          *(void *)&v77[4] = "PGLandscapeWallpaperSuggesterFilterCandidates";
          *(_WORD *)&v77[12] = 2048;
          *(double *)&v77[14] = (float)((float)((float)((float)(v18 - v49) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v77, 0x16u);
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v77 = 67109120;
          *(_DWORD *)&v77[4] = v55;
          _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Found %d positive landscape assets", v77, 8u);
        }
        int v23 = v22;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v24 = [v17 count];
          *(_DWORD *)v77 = 67109120;
          *(_DWORD *)&v77[4] = v24;
          _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Found %d candidates after postfiltering", v77, 8u);
        }

        long long v82 = v90;
        v83[0] = v91[0];
        *(_OWORD *)((char *)v83 + 12) = *(_OWORD *)((char *)v91 + 12);
        long long v78 = v86;
        long long v79 = v87;
        long long v80 = v88;
        long long v81 = v89;
        *(_OWORD *)v77 = *(_OWORD *)buf;
        *(_OWORD *)&v77[16] = *(_OWORD *)&buf[16];
        [(PGLandscapeWallpaperSuggester *)self logPosterFilteringStatistics:v77];
        int v25 = [(PGLandscapeWallpaperSuggester *)self secondaryFilteringContext];

        if (v25)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v77 = 0;
            _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Secondary filtering...", v77, 2u);
          }
          long long v82 = v74;
          v83[0] = v75[0];
          *(_OWORD *)((char *)v83 + 12) = *(_OWORD *)((char *)v75 + 12);
          long long v78 = v70;
          long long v79 = v71;
          long long v80 = v72;
          long long v81 = v73;
          *(_OWORD *)v77 = v68;
          *(_OWORD *)&v77[16] = v69;
          [(PGLandscapeWallpaperSuggester *)self logPosterFilteringStatistics:v77];
        }
        if (*(int *)&buf[4] >= 1) {
          [MEMORY[0x1E4F8E770] logInfo:v23 prefix:@"[PGLandscapeWallpaperSuggester]" avoidForKeyAssetStatistics:(char *)&v86 + 12];
        }
        id v7 = v17;
        id v5 = v17;
        v14 = v16;
      }
    }
  }

  return v5;
}

- (id)fetchCandidateAssets
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PGAbstractSuggester *)self session];
  v3 = [v2 loggingConnection];
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  id v5 = v3;
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PGLandscapeWallpaperSuggesterFetchCandidates", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v7 = mach_absolute_time();
  v8 = [v2 photoLibrary];
  os_signpost_id_t v9 = [v8 librarySpecificFetchOptions];
  [v9 setCacheSizeForFetch:200];
  [v9 setChunkSizeForFetch:200];
  double v10 = +[PGWallpaperSuggestionUtilities assetFetchPropertySetsIncludingGating:](PGWallpaperSuggestionUtilities, "assetFetchPropertySetsIncludingGating:", [(id)objc_opt_class() filtersForTopSuggestions]);
  [v9 setFetchPropertySets:v10];

  v11 = objc_opt_class();
  uint64_t v12 = [v2 forbiddenAssetUUIDs];
  unint64_t v13 = [v11 prefilteringInternalPredicateWithForbiddenAssetUUIDs:v12];
  [v9 setInternalPredicate:v13];

  v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v30[0] = v14;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [v9 setSortDescriptors:v15];

  v16 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v9];
  v17 = v6;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [v16 count];
    *(_DWORD *)buf = 134217984;
    double v27 = (const char *)v18;
    _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Fetched %lu candidate assets.", buf, 0xCu);
  }

  uint64_t v19 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  __int16 v22 = v17;
  int v23 = v22;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v23, OS_SIGNPOST_INTERVAL_END, v4, "PGLandscapeWallpaperSuggesterFetchCandidates", "", buf, 2u);
  }

  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    double v27 = "PGLandscapeWallpaperSuggesterFetchCandidates";
    __int16 v28 = 2048;
    double v29 = (float)((float)((float)((float)(v19 - v7) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v16;
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v116 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:v6];
  uint64_t v126 = 0;
  v127 = &v126;
  uint64_t v128 = 0x2020000000;
  char v129 = 0;
  int v8 = [v7 isCancelledWithProgress:0.0];
  *((unsigned char *)v127 + 24) = v8;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v132 = 100;
      *(_WORD *)&v132[4] = 2080;
      *(void *)&v132[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v9 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_25;
  }
  uint64_t v10 = [v116 maximumNumberOfSuggestions];
  v11 = [(PGAbstractSuggester *)self session];
  [v11 loggingConnection];
  v114 = v11;
  uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  v14 = v12;
  long long v15 = v14;
  unint64_t v111 = v13 - 1;
  os_signpost_id_t spid = v13;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGLandscapeWallpaperSuggester", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v110 = mach_absolute_time();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v132 = v10;
    _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Starting to generate %d suggestions.", buf, 8u);
  }
  v113 = [v7 childProgressReporterFromStart:0.0 toEnd:0.39];
  v115 = -[PGLandscapeWallpaperSuggester fetchUnsortedCandidatesWithProgressReporter:](self, "fetchUnsortedCandidatesWithProgressReporter:");
  if (![v115 count])
  {
    if (*((unsigned char *)v127 + 24))
    {
      *((unsigned char *)v127 + 24) = 1;
    }
    else
    {
      char v19 = [v7 isCancelledWithProgress:1.0];
      *((unsigned char *)v127 + 24) = v19;
      if ((v19 & 1) == 0)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Found 0 unsorted candidate.", buf, 2u);
        }
        uint64_t v23 = mach_absolute_time();
        uint32_t numer = info.numer;
        uint32_t denom = info.denom;
        unint64_t v26 = v15;
        double v27 = v26;
        if (v111 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v27, OS_SIGNPOST_INTERVAL_END, spid, "PGLandscapeWallpaperSuggester", "", buf, 2u);
        }

        if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)v132 = "PGLandscapeWallpaperSuggester";
        *(_WORD *)&v132[8] = 2048;
        *(double *)&v132[10] = (float)((float)((float)((float)(v23 - v110) * (float)numer) / (float)denom) / 1000000.0);
        uint64_t v18 = "[Performance] %s: %f ms";
        v17 = v27;
        uint32_t v20 = 22;
        goto LABEL_22;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v132 = 114;
      *(_WORD *)&v132[4] = 2080;
      *(void *)&v132[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
      v17 = MEMORY[0x1E4F14500];
      uint64_t v18 = "Cancelled at line %d in file %s";
      goto LABEL_21;
    }
LABEL_23:
    id v9 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_24;
  }
  if (*((unsigned char *)v127 + 24))
  {
    *((unsigned char *)v127 + 24) = 1;
    goto LABEL_16;
  }
  char v16 = [v7 isCancelledWithProgress:0.4];
  *((unsigned char *)v127 + 24) = v16;
  if (v16)
  {
LABEL_16:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v132 = 121;
      *(_WORD *)&v132[4] = 2080;
      *(void *)&v132[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
      v17 = MEMORY[0x1E4F14500];
      uint64_t v18 = "Cancelled at line %d in file %s";
LABEL_21:
      uint32_t v20 = 18;
LABEL_22:
      _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, v18, buf, v20);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  __int16 v22 = [(PGLandscapeWallpaperSuggester *)self sortedDedupedCandidatesFromCandidates:v115];
  if (*((unsigned char *)v127 + 24))
  {
    *((unsigned char *)v127 + 24) = 1;
LABEL_38:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v132 = 125;
      *(_WORD *)&v132[4] = 2080;
      *(void *)&v132[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v9 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_41;
  }
  char v28 = [v7 isCancelledWithProgress:0.8];
  *((unsigned char *)v127 + 24) = v28;
  if (v28) {
    goto LABEL_38;
  }
  v95 = v22;
  double v29 = [(id)objc_opt_class() suggestionTypes];
  unsigned __int16 v30 = [v29 firstIndex];

  int v31 = [(id)objc_opt_class() suggestionSubtypes];
  unsigned __int16 v32 = [v31 firstIndex];

  assetGater = self->_assetGater;
  __int16 v34 = [PGWallpaperSuggestionAccumulator alloc];
  if (assetGater) {
    uint64_t v35 = 2 * v10;
  }
  else {
    uint64_t v35 = 0;
  }
  if (assetGater) {
    uint64_t v36 = 5;
  }
  else {
    uint64_t v36 = 0;
  }
  v97 = [(PGWallpaperSuggestionAccumulator *)v34 initWithTargetNumberOfSuggestions:v10 targetMinimumNumberOfGatedSuggestions:v36 maximumNumberOfSuggestionsToTryForGating:v35 loggingConnection:v15];
  v93 = [MEMORY[0x1E4F1C9C8] date];
  v96 = [v93 dateByAddingTimeInterval:480.0];
  unint64_t v37 = [v95 count];
  log = v15;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    uint64_t v38 = [NSNumber numberWithDouble:480.0];
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v132 = v37;
    *(_WORD *)&v132[4] = 2112;
    *(void *)&v132[6] = v93;
    *(_WORD *)&v132[14] = 2112;
    *(void *)&v132[16] = v38;
    LOWORD(v133[0]) = 2112;
    *(void *)((char *)v133 + 2) = v96;
    _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Start processing %d candidates. StartingDate: %@, MaxProcessingTime: %@s, MaxProcessingDate: %@", buf, 0x26u);
  }
  if (v37 <= 1) {
    unint64_t v39 = 1;
  }
  else {
    unint64_t v39 = v37;
  }
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id obj = v95;
  uint64_t v40 = [obj countByEnumeratingWithState:&v121 objects:v130 count:16];
  if (!v40)
  {
    int v101 = 0;
    int v98 = 0;
    uint64_t v92 = 0;
    int v91 = 0;
LABEL_96:

LABEL_97:
    long long v74 = [(PGWallpaperSuggestionAccumulator *)v97 suggestions];
    v75 = self->_assetGater;
    v76 = log;
    BOOL v77 = os_log_type_enabled(v76, OS_LOG_TYPE_INFO);
    if (v75)
    {
      if (!v77) {
        goto LABEL_103;
      }
      int v78 = [v74 count];
      int v79 = [(PGWallpaperSuggestionAccumulator *)v97 numberOfGatedSuggestions];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v132 = v78;
      *(_WORD *)&v132[4] = 1024;
      *(_DWORD *)&v132[6] = v79;
      long long v80 = "[PGLandscapeWallpaperSuggester] Generated %d suggestions (%d gated)";
      long long v81 = v76;
      uint32_t v82 = 14;
    }
    else
    {
      if (!v77) {
        goto LABEL_103;
      }
      int v83 = [v74 count];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v132 = v83;
      long long v80 = "[PGLandscapeWallpaperSuggester] Generated %d suggestions";
      long long v81 = v76;
      uint32_t v82 = 8;
    }
    _os_log_impl(&dword_1D1805000, v81, OS_LOG_TYPE_INFO, v80, buf, v82);
LABEL_103:

    if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v132 = v101;
      *(_WORD *)&v132[4] = 1024;
      *(_DWORD *)&v132[6] = v98;
      *(_WORD *)&v132[10] = 1024;
      *(_DWORD *)&v132[12] = HIDWORD(v92);
      *(_WORD *)&v132[16] = 1024;
      *(_DWORD *)&v132[18] = v91;
      *(_WORD *)&v132[22] = 1024;
      v133[0] = v92;
      _os_log_impl(&dword_1D1805000, v76, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Tried %d assets, %d passed, rejected %d for clock overlap, %d for low resolution, %d for low crop score.", buf, 0x20u);
    }
    if (*((unsigned char *)v127 + 24))
    {
      *((unsigned char *)v127 + 24) = 1;
    }
    else
    {
      char v84 = [v7 isCancelledWithProgress:1.0];
      *((unsigned char *)v127 + 24) = v84;
      if ((v84 & 1) == 0)
      {
        uint64_t v85 = mach_absolute_time();
        uint32_t v86 = info.numer;
        uint32_t v87 = info.denom;
        long long v88 = v76;
        long long v89 = v88;
        if (v111 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v89, OS_SIGNPOST_INTERVAL_END, spid, "PGLandscapeWallpaperSuggester", "", buf, 2u);
        }

        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)v132 = "PGLandscapeWallpaperSuggester";
          *(_WORD *)&v132[8] = 2048;
          *(double *)&v132[10] = (float)((float)((float)((float)(v85 - v110) * (float)v86) / (float)v87) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v89, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        id v9 = v74;
        goto LABEL_111;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v132 = 221;
      *(_WORD *)&v132[4] = 2080;
      *(void *)&v132[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v9 = (id)MEMORY[0x1E4F1CBF0];
LABEL_111:

    goto LABEL_112;
  }
  int v101 = 0;
  int v98 = 0;
  uint64_t v92 = 0;
  int v91 = 0;
  uint64_t v107 = 0;
  unint64_t v108 = 0;
  unsigned int v104 = v32;
  unsigned int v105 = v30;
  double v42 = 0.1 / (double)v39;
  uint64_t v106 = *(void *)v122;
  *(void *)&long long v41 = 138412290;
  long long v90 = v41;
LABEL_55:
  uint64_t v103 = v40;
  uint64_t v43 = 0;
  while (1)
  {
    if (*(void *)v122 != v106) {
      objc_enumerationMutation(obj);
    }
    uint64_t v44 = *(void **)(*((void *)&v121 + 1) + 8 * v43);
    context = (void *)MEMORY[0x1D25FED50]();
    uint64_t v45 = [PGSingleAssetSuggestion alloc];
    v46 = [v44 asset];
    long long v47 = [(PGSingleAssetSuggestion *)v45 initWithType:v105 subtype:v104 asset:v46];

    if (self->_assetGater)
    {
      v48 = [v44 asset];
      BOOL v49 = +[PGSettlingEffectWallpaperSuggesterFilteringContext shouldRunSettlingEffectForAsset:v48 subtype:604];

      [(PGWallpaperSuggestionAssetGater *)self->_assetGater setEnableSettlingEffect:v49];
      unint64_t v50 = self->_assetGater;
      uint64_t v51 = [v44 asset];
      v117[0] = MEMORY[0x1E4F143A8];
      v117[1] = 3221225472;
      v117[2] = __65__PGLandscapeWallpaperSuggester_suggestionsWithOptions_progress___block_invoke;
      v117[3] = &unk_1E68E5668;
      v119 = &v126;
      id v118 = v7;
      double v120 = v42 * (double)(unint64_t)(v107 + v43);
      unint64_t v52 = [(PGWallpaperSuggestionAssetGater *)v50 gateAsset:v51 progressBlock:v117];

      -[PGSingleAssetSuggestion setAvailableFeatures:](v47, "setAvailableFeatures:", [v52 availableFeatures]);
      uint64_t v53 = [v52 passesAnyGating];
      LODWORD(v48) = [v52 didTimeout];

      v108 += v48;
    }
    else
    {
      uint64_t v53 = 1;
    }
    if (*((unsigned char *)v127 + 24))
    {
      *((unsigned char *)v127 + 24) = 1;
LABEL_64:
      int v55 = 1;
      long long v56 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v132 = 165;
        *(_WORD *)&v132[4] = 2080;
        *(void *)&v132[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
        _os_log_impl(&dword_1D1805000, v56, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_89;
    }
    char v54 = [v7 isCancelledWithProgress:v42 * (double)(unint64_t)(v107 + v43) + 0.9];
    *((unsigned char *)v127 + 24) = v54;
    if (v54) {
      goto LABEL_64;
    }
    ++v101;
    if (v53) {
      goto LABEL_71;
    }
    long long v57 = [v44 cropResult];
    long long v58 = [(PGLandscapeWallpaperSuggester *)self primaryFilteringContext];
    v99 = objc_msgSend(v57, "cropForOrientation:", objc_msgSend(v58, "orientation"));

    long long v59 = [(PGLandscapeWallpaperSuggester *)self primaryFilteringContext];
    unsigned __int8 v94 = ([v59 ignoreClockOverlap] & 1) != 0 ? 1 : objc_msgSend(v99, "passesClockOverlap");

    [v99 cropZoomRatio];
    double v61 = v60;
    uint64_t v62 = [(PGLandscapeWallpaperSuggester *)self primaryFilteringContext];
    [v62 maximumCropZoomRatio];
    double v64 = v63;

    [v99 cropScore];
    double v66 = v65;
    long long v67 = [(PGLandscapeWallpaperSuggester *)self primaryFilteringContext];
    [v67 minimumCropScore];
    BOOL v69 = v66 >= v68;

    if ((v94 & (v61 <= v64) & v69) != 0)
    {
LABEL_71:
      -[PGWallpaperSuggestionAccumulator addSuggestion:passingGating:](v97, "addSuggestion:passingGating:", v47, v53, v90);
      ++v98;
      if ([(PGWallpaperSuggestionAccumulator *)v97 accumulationIsComplete])
      {
        int v55 = 2;
        goto LABEL_89;
      }
    }
    else
    {
      if (v94)
      {
        if (v61 > v64)
        {
          ++v91;
          long long v70 = @"low resolution";
        }
        else
        {
          LODWORD(v92) = v92 + 1;
          long long v70 = @"low cropScore";
        }
      }
      else
      {
        ++HIDWORD(v92);
        long long v70 = @"clock overlap";
      }
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v90;
        *(void *)v132 = v70;
        _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Rejecting non-gated suggestion because of %@.", buf, 0xCu);
      }
    }
    long long v71 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v90);
    [v96 timeIntervalSinceDate:v71];
    double v73 = v72;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v132 = v101;
      *(_WORD *)&v132[4] = 1024;
      *(_DWORD *)&v132[6] = v98;
      *(_WORD *)&v132[10] = 2048;
      *(double *)&v132[12] = v73;
      _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Tried %d candidates. %d passed. %.3fs processing time left.", buf, 0x18u);
    }
    if (v108 > 1 || v73 < 0.0)
    {
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v132 = v108;
        *(_WORD *)&v132[4] = 1024;
        *(_DWORD *)&v132[6] = 1;
        *(_WORD *)&v132[10] = 2048;
        *(double *)&v132[12] = v73;
        _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Reached (%d/%d) timeouts allowed. %.3fs processing time left.", buf, 0x18u);
      }
      int v55 = 2;
    }
    else
    {
      int v55 = 0;
    }

LABEL_89:
    if (v55) {
      break;
    }
    if (v103 == ++v43)
    {
      uint64_t v40 = [obj countByEnumeratingWithState:&v121 objects:v130 count:16];
      v107 += v43;
      if (v40) {
        goto LABEL_55;
      }
      goto LABEL_96;
    }
  }

  if (v55 == 2) {
    goto LABEL_97;
  }
  id v9 = (id)MEMORY[0x1E4F1CBF0];
LABEL_112:

  __int16 v22 = v95;
LABEL_41:

LABEL_24:
LABEL_25:
  _Block_object_dispose(&v126, 8);

  return v9;
}

uint64_t __65__PGLandscapeWallpaperSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:*(double *)(a1 + 48) * a2 + 0.9];
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v2 + 24) = result;
  return result;
}

- (void)setupFilteringContexts
{
  uint64_t v2 = self;
  v3 = (objc_class *)objc_opt_class();
  if (!v2)
  {
    NSStringFromClass(v3);
    objc_claimAutoreleasedReturnValue();
LABEL_11:
    v14 = (PGLandscapeWallpaperSuggester *)_PFAssertFailHandler();
    [(PGLandscapeWallpaperSuggester *)v14 initWithSession:v16];
    return;
  }
  if (([(PGLandscapeWallpaperSuggester *)v2 isMemberOfClass:v3] & 1) == 0)
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }

  int IsIPad = PLPhysicalDeviceIsIPad();
  id v5 = [PGLandscapeWallpaperSuggesterFilteringContext alloc];
  if (IsIPad)
  {
    uint64_t v6 = [(PGLandscapeWallpaperSuggesterFilteringContext *)v5 initForLandscapesInOrientation:2];
    primaryFilteringContext = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGLandscapeWallpaperSuggesterFilteringContext *)v6;

    int v8 = [[PGLandscapeWallpaperSuggesterFilteringContext alloc] initForLandscapesInOrientation:1];
    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = v8;
  }
  else
  {
    uint64_t v10 = [(PGLandscapeWallpaperSuggesterFilteringContext *)v5 initForLandscapesInOrientation:1];
    v11 = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGLandscapeWallpaperSuggesterFilteringContext *)v10;

    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = 0;
  }
}

- (PGLandscapeWallpaperSuggester)initWithSession:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGLandscapeWallpaperSuggester;
  id v5 = [(PGAbstractSuggester *)&v13 initWithSession:v4];
  if (v5)
  {
    if ([(id)objc_opt_class() filtersForTopSuggestions])
    {
      uint64_t v6 = [PGWallpaperSuggestionAssetGater alloc];
      id v7 = [v4 loggingConnection];
      uint64_t v8 = [(PGWallpaperSuggestionAssetGater *)v6 initWithType:3 loggingConnection:v7];
      assetGater = v5->_assetGater;
      v5->_assetGater = (PGWallpaperSuggestionAssetGater *)v8;
    }
    uint64_t v10 = +[PGWallpaperSuggestionUtilities peopleSceneConfidenceThresholdHelper];
    peopleSceneConfidenceThresholdHelper = v5->_peopleSceneConfidenceThresholdHelper;
    v5->_peopleSceneConfidenceThresholdHelper = (CLSSceneConfidenceThresholdHelper *)v10;

    [(PGLandscapeWallpaperSuggester *)v5 setupFilteringContexts];
  }

  return v5;
}

+ (BOOL)passesFilteringWithAsset:(id)a3 curationContext:(id)a4 orientation:(int64_t)a5 reason:(id *)a6
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if ([a1 isPositiveLandscapeAsset:v10])
  {
    uint64_t v38 = [v10 photoLibrary];
    uint64_t v12 = [v38 librarySpecificFetchOptions];
    objc_super v13 = [a1 prefilteringInternalPredicateWithForbiddenAssetUUIDs:0];
    [v12 setInternalPredicate:v13];

    v14 = (void *)MEMORY[0x1E4F38EB8];
    SEL v15 = [v10 localIdentifier];
    v39[0] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    v17 = [v14 fetchAssetsWithLocalIdentifiers:v16 options:v12];
    uint64_t v18 = [v17 firstObject];

    if (!v18)
    {
      BOOL v23 = 0;
      if (a6) {
        *a6 = @"Fails Predicate";
      }
      goto LABEL_29;
    }
    int v19 = [(id)objc_opt_class() filtersForTopSuggestions];
    uint32_t v20 = [[PGLandscapeWallpaperSuggestionCandidate alloc] initWithAsset:v10];
    int v21 = [PGLandscapeWallpaperSuggesterFilteringContext alloc];
    if (v19) {
      uint64_t v22 = [(PGLandscapeWallpaperSuggesterFilteringContext *)v21 initForTopLandscapesInOrientation:a5];
    }
    else {
      uint64_t v22 = [(PGLandscapeWallpaperSuggesterFilteringContext *)v21 initForLandscapesInOrientation:a5];
    }
    int v24 = (void *)v22;
    uint64_t v36 = +[PGWallpaperSuggestionUtilities peopleSceneConfidenceThresholdHelper];
    unint64_t v37 = v20;
    if (objc_msgSend(a1, "candidate:passesFilteringWithContext:curationContext:thresholdHelper:statistics:", v20, v24, v11))
    {
      if (v19)
      {
        int v25 = [PGWallpaperSuggestionAssetGater alloc];
        unint64_t v26 = [(PGWallpaperSuggestionAssetGater *)v25 initWithType:3 loggingConnection:MEMORY[0x1E4F14500]];
        BOOL v23 = 1;
        [(PGWallpaperSuggestionAssetGater *)v26 setCoversTracks:1];
        [(PGWallpaperSuggestionAssetGater *)v26 setIsUserInitiated:1];
        uint64_t v35 = [(PGWallpaperSuggestionAssetGater *)v26 gateAsset:v10 progressBlock:&__block_literal_global_220];
        if ([v35 passesAnyGating])
        {
          double v27 = @"Pass Segmented";
        }
        else
        {
          char v28 = [(PGLandscapeWallpaperSuggestionCandidate *)v20 cropResult];
          double v29 = [v28 cropForOrientation:a5];

          if (([v24 ignoreClockOverlap] & 1) != 0
            || [v29 passesClockOverlap])
          {
            [v29 cropScore];
            double v31 = v30;
            [v24 minimumCropScore];
            BOOL v23 = v31 >= v32;
            if (v31 < v32) {
              double v27 = @"Low Crop Score";
            }
            else {
              double v27 = @"Pass Unsegmented";
            }
          }
          else
          {
            BOOL v23 = 0;
            double v27 = @"Clock Overlap";
          }
        }
      }
      else
      {
        double v27 = @"Pass";
        BOOL v23 = 1;
      }
      uint64_t v33 = (void *)v36;
      if (!a6) {
        goto LABEL_28;
      }
    }
    else
    {
      if (!a6)
      {
        BOOL v23 = 0;
        uint64_t v33 = (void *)v36;
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      BOOL v23 = 0;
      double v27 = @"Unknown Reason";
      uint64_t v33 = (void *)v36;
    }
    *a6 = v27;
    goto LABEL_28;
  }
  BOOL v23 = 0;
  if (a6) {
    *a6 = @"Not Landscape";
  }
LABEL_30:

  return v23;
}

+ (BOOL)candidate:(id)a3 passesFilteringWithContext:(id)a4 curationContext:(id)a5 thresholdHelper:(id)a6 statistics:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  SEL v15 = [v11 asset];
  id v16 = [v15 curationModel];
  [v12 minimumWallpaperScore];
  double v18 = v17;
  if (v17 < 0.0)
  {
    int v19 = [v16 wallpaperScoreModel];
    int v20 = [(id)objc_opt_class() filtersForAmbientSuggestions];
    int v21 = [v19 landscapeNode];
    uint64_t v22 = v21;
    if (v20) {
      [v21 highRecallOperatingPoint];
    }
    else {
      [v21 highPrecisionOperatingPoint];
    }
    double v18 = v23;
  }
  int v24 = [v15 mediaAnalysisProperties];
  [v24 wallpaperScore];
  double v26 = v25;

  if (v18 > v26)
  {
    BOOL v27 = 0;
    ++a7->var3;
    goto LABEL_31;
  }
  char v28 = [v13 userFeedbackCalculator];
  int v29 = [v16 isUtilityForMemoriesWithAsset:v15 userFeedbackCalculator:v28];

  if (v29)
  {
    BOOL v27 = 0;
    ++a7->var0;
    goto LABEL_31;
  }
  if ([v16 avoidIfPossibleForKeyAssetWithAsset:v15 statistics:&a7->var11])
  {
    BOOL v27 = 0;
    ++a7->var1;
    goto LABEL_31;
  }
  if (([v16 isAestheticallyPrettyGoodWithAsset:v15] & 1) == 0)
  {
    BOOL v27 = 0;
    ++a7->var2;
    goto LABEL_31;
  }
  if (([v12 bypassCropScoreCheck] & 1) == 0)
  {
    double v30 = [v11 cropResult];
    double v31 = objc_msgSend(v30, "cropForOrientation:", objc_msgSend(v12, "orientation"));

    if (([v12 ignoreClockOverlap] & 1) != 0 || objc_msgSend(v31, "passesClockOverlap"))
    {
      [v31 cropZoomRatio];
      double v33 = v32;
      [v12 maximumCropZoomRatio];
      if (v33 <= v34)
      {
        [v31 cropScore];
        double v37 = v36;
        [v12 minimumCropScore];
        if (v37 >= v38)
        {

          goto LABEL_14;
        }
        p_int var6 = &a7->var6;
      }
      else
      {
        p_int var6 = &a7->var5;
      }
    }
    else
    {
      p_int var6 = &a7->var4;
    }
    ++*p_var6;

    BOOL v27 = 0;
    goto LABEL_31;
  }
LABEL_14:
  if ([MEMORY[0x1E4F8E7A8] assetIsSafeForWidgetDisplay:v15])
  {
    if (+[PGWallpaperSuggestionUtilities foundDominantPeopleSceneInAsset:v15 withConfidenceThresholdHelper:v14])
    {
      BOOL v27 = 0;
      ++a7->var8;
    }
    else
    {
      [v12 maximumLowLightScore];
      double v40 = v39;
      if (v39 < 0.0)
      {
        long long v41 = [v15 curationModel];
        double v42 = [v41 aestheticsModel];
        uint64_t v43 = [v42 lowLightNode];
        [v43 operatingPoint];
        double v40 = v44;
      }
      uint64_t v45 = [v15 aestheticProperties];
      [v45 lowLight];
      double v47 = v46;

      if (v40 >= v47)
      {
        BOOL v49 = [v11 asset];
        BOOL v50 = +[PGSensitiveLocationBlocklistConfiguration isAssetAtSensitiveLocationAndDate:v49];

        if (v50)
        {
          BOOL v27 = 0;
          ++a7->var10;
        }
        else
        {
          BOOL v27 = 1;
        }
      }
      else
      {
        BOOL v27 = 0;
        ++a7->var9;
      }
    }
  }
  else
  {
    BOOL v27 = 0;
    ++a7->var7;
  }
LABEL_31:

  return v27;
}

+ (BOOL)isPositiveLandscapeAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 clsSceneClassifications];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "extendedSceneIdentifier", (void)v12) == 2147481597)
        {
          id v5 = [v3 curationModel];
          id v9 = [v5 cityNatureModel];

          id v10 = [v9 natureNode];
          LOBYTE(v5) = [v10 passesHighPrecisionWithSignal:v8];

          goto LABEL_11;
        }
      }
      id v5 = (void *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

+ (id)candidatesFromAssets:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [PGLandscapeWallpaperSuggestionCandidate alloc];
        long long v12 = -[PGLandscapeWallpaperSuggestionCandidate initWithAsset:](v11, "initWithAsset:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)prefilteringInternalPredicateWithForbiddenAssetUUIDs:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 0);
  [v4 addObject:v5];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"kindSubtype", 1);
  [v4 addObject:v6];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.%K > %d", @"additionalAttributes", @"faceAnalysisVersion", 0);
  [v4 addObject:v7];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.@count == %d", @"detectedFaces", 0);
  [v4 addObject:v8];
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (%K IN %@)", @"playbackStyle", &unk_1F28D3900];
  [v4 addObject:v9];
  if ([v3 count])
  {
    uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (%K IN %@)", @"uuid", v3];
    [v4 addObject:v10];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 32000;
  long long v12 = (void *)MEMORY[0x1E4F8EB28];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  _DWORD v17[2] = __86__PGLandscapeWallpaperSuggester_prefilteringInternalPredicateWithForbiddenAssetUUIDs___block_invoke;
  v17[3] = &unk_1E68E48D0;
  uint64_t v19 = v20;
  id v13 = v11;
  id v18 = v13;
  [v12 enumerateModelsAscending:0 usingBlock:v17];
  long long v14 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v13];
  [v4 addObject:v14];
  long long v15 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];

  _Block_object_dispose(v20, 8);
  return v15;
}

void __86__PGLandscapeWallpaperSuggester_prefilteringInternalPredicateWithForbiddenAssetUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a2;
  uint64_t v5 = [v4 version];
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v7 = [v4 natureNode];
  [v7 highPrecisionOperatingPoint];
  [v3 predicateWithFormat:@"SUBQUERY(additionalAttributes, $a, $a.sceneAnalysisVersion >= %d AND $a.sceneAnalysisVersion < %d AND SUBQUERY($a.sceneClassifications, $s, $s.sceneIdentifier = %d AND $s.confidence >= %f).@count != 0).@count != 0", v5, v6, 2147481597, v8];
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) addObject:v10];
  uint64_t v9 = [v4 version];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
}

+ (BOOL)filtersForAmbientSuggestions
{
  return 0;
}

+ (BOOL)filtersForTopSuggestions
{
  return 0;
}

+ (id)suggestionSubtypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:654];
}

+ (id)suggestionTypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:6];
}

@end