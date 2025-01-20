@interface PGCityscapeWallpaperSuggester
+ (BOOL)candidate:(id)a3 passesFilteringWithContext:(id)a4 curationContext:(id)a5 thresholdHelper:(id)a6 statistics:(id *)a7;
+ (BOOL)filtersForAmbientSuggestions;
+ (BOOL)filtersForTopSuggestions;
+ (BOOL)isPositiveWithUrbanSceneLabelsForAsset:(id)a3;
+ (BOOL)passesFilteringWithAsset:(id)a3 curationContext:(id)a4 orientation:(int64_t)a5 reason:(id *)a6;
+ (CLSSceneTaxonomyHierarchy)sceneTaxonomy;
+ (id)candidatesFromAssets:(id)a3;
+ (id)prefilteringInternalPredicateWithForbiddenAssetUUIDs:(id)a3;
+ (id)suggestionSubtypes;
+ (id)suggestionTypes;
- (PGCityscapeWallpaperSuggester)initWithSession:(id)a3;
- (PGCityscapeWallpaperSuggesterDistancingContext)distancingContext;
- (PGCityscapeWallpaperSuggesterFilteringContext)primaryFilteringContext;
- (PGCityscapeWallpaperSuggesterFilteringContext)secondaryFilteringContext;
- (PGCityscapeWallpaperSuggesterScoringContext)scoringContext;
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

@implementation PGCityscapeWallpaperSuggester

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

- (PGCityscapeWallpaperSuggesterDistancingContext)distancingContext
{
  return self->_distancingContext;
}

- (void)setScoringContext:(id)a3
{
}

- (PGCityscapeWallpaperSuggesterScoringContext)scoringContext
{
  return self->_scoringContext;
}

- (void)setSecondaryFilteringContext:(id)a3
{
}

- (PGCityscapeWallpaperSuggesterFilteringContext)secondaryFilteringContext
{
  return self->_secondaryFilteringContext;
}

- (void)setPrimaryFilteringContext:(id)a3
{
}

- (PGCityscapeWallpaperSuggesterFilteringContext)primaryFilteringContext
{
  return self->_primaryFilteringContext;
}

- (id)sortedDedupedCandidatesFromCandidates:(id)a3
{
  v67[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44 = [(PGAbstractSuggester *)self session];
  v5 = [v44 loggingConnection];
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  unint64_t v42 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PGCityscapeWallpaperSuggesterDedupeAndRank", "", buf, 2u);
  }
  os_signpost_id_t spid = v6;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v40 = mach_absolute_time();
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F8A780]) initWithDistanceBlock:&__block_literal_global_458];
  [(PGCityscapeWallpaperSuggesterFilteringContext *)self->_primaryFilteringContext timeIntervalForCandidateDeduping];
  objc_msgSend(v9, "setMaximumDistance:");
  [v9 setMinimumNumberOfObjects:1];
  v43 = v9;
  v45 = v4;
  v10 = [v9 performWithDataset:v4 progressBlock:&__block_literal_global_460];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = v8;
    uint64_t v12 = [v10 count];
    *(_DWORD *)buf = 134217984;
    v62 = (const char *)v12;
    _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Deduped to %lu clusters", buf, 0xCu);
  }
  v41 = v8;
  v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.favorite" ascending:0];
  v67[0] = v13;
  v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.mediaAnalysisProperties.wallpaperScore" ascending:0];
  v67[1] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F8E880], "cropScoreSortDescriptorForOrientation:", -[PGCityscapeWallpaperSuggesterFilteringContext orientation](self->_primaryFilteringContext, "orientation"));
  v67[2] = v15;
  v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.creationDate" ascending:0];
  v67[3] = v16;
  v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.uuid" ascending:1];
  v67[4] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:5];

  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v10;
  uint64_t v49 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v57 != v48) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x1D25FED50]();
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        v22 = [v20 objects];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v52 objects:v65 count:16];
        if (!v23)
        {
          v25 = v22;
          goto LABEL_21;
        }
        uint64_t v24 = v23;
        v50 = v21;
        uint64_t v51 = i;
        v25 = 0;
        uint64_t v26 = *(void *)v53;
        do
        {
          uint64_t v27 = 0;
          v28 = v25;
          do
          {
            if (*(void *)v53 != v26) {
              objc_enumerationMutation(v22);
            }
            v29 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *(void *)(*((void *)&v52 + 1) + 8 * v27), v28, 0);
            v30 = [v29 sortedArrayUsingDescriptors:v18];
            v25 = [v30 firstObject];

            ++v27;
            v28 = v25;
          }
          while (v24 != v27);
          uint64_t v24 = [v22 countByEnumeratingWithState:&v52 objects:v65 count:16];
        }
        while (v24);

        v21 = v50;
        uint64_t i = v51;
        if (v25)
        {
          [v46 addObject:v25];
LABEL_21:
        }
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
    }
    while (v49);
  }

  [v46 sortUsingDescriptors:v18];
  v31 = v41;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    uint64_t v32 = [v46 count];
    *(_DWORD *)buf = 134217984;
    v62 = (const char *)v32;
    _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Ranked & deduped to %lu candidates", buf, 0xCu);
  }

  uint64_t v33 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v36 = v31;
  v37 = v36;
  if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v37, OS_SIGNPOST_INTERVAL_END, spid, "PGCityscapeWallpaperSuggesterDedupeAndRank", "", buf, 2u);
  }

  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v62 = "PGCityscapeWallpaperSuggesterDedupeAndRank";
    __int16 v63 = 2048;
    double v64 = (float)((float)((float)((float)(v33 - v40) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v46;
}

double __71__PGCityscapeWallpaperSuggester_sortedDedupedCandidatesFromCandidates___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v41 = *MEMORY[0x1E4F143B8];
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
    int var11 = a3->var11;
    v18[0] = 67111936;
    v18[1] = var0;
    __int16 v19 = 1024;
    int v20 = var1;
    __int16 v21 = 1024;
    int v22 = var2;
    __int16 v23 = 1024;
    int v24 = var3;
    __int16 v25 = 1024;
    int v26 = var9;
    __int16 v27 = 1024;
    int v28 = var4;
    __int16 v29 = 1024;
    int v30 = var5;
    __int16 v31 = 1024;
    int v32 = var6;
    __int16 v33 = 1024;
    int v34 = var7;
    __int16 v35 = 1024;
    int v36 = var8;
    __int16 v37 = 1024;
    int v38 = var10;
    __int16 v39 = 1024;
    int v40 = var11;
    _os_log_impl(&dword_1D1805000, v5, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Filtered out %d for isUtility, %d for avoidForKeyAsset, %d for aesthetics, %d for wallpaper score, %d for aesthetics+wallpaper, %d for clock overlap, %d for low resolution, %d for crop score, %d for not safe for display, %d for positive people scene, %d for low light, %d for sensitive location", (uint8_t *)v18, 0x4Au);
  }
}

- (id)fetchUnsortedCandidatesWithProgressReporter:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = 309;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v44 = [(PGAbstractSuggester *)self session];
    os_signpost_id_t v6 = [v44 loggingConnection];
    v43 = [(PGCityscapeWallpaperSuggester *)self fetchCandidateAssets];
    if ([v4 isCancelledWithProgress:0.2])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 315;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v5 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      __int16 v39 = v6;
      v7 = v6;
      os_signpost_id_t v8 = os_signpost_id_generate(v7);
      double v9 = v7;
      double v10 = v9;
      unint64_t v38 = v8 - 1;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PGCityscapeWallpaperSuggesterFilterCandidates", "", buf, 2u);
      }
      os_signpost_id_t spid = v8;

      mach_timebase_info info = 0;
      mach_timebase_info(&info);
      uint64_t v37 = mach_absolute_time();
      unint64_t v40 = [v43 count] / 0xC8uLL;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v74 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v54 = 0u;
      uint64_t v49 = [v44 curationContext];
      int v11 = 0;
      unint64_t v12 = 0;
      os_log_t oslog = v10;
      unint64_t v42 = v4;
      while (1)
      {
        unint64_t v46 = v12;
        context = (void *)MEMORY[0x1D25FED50]();
        v45 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:");
        v13 = objc_msgSend(v43, "objectsAtIndexes:");
        v14 = (void *)MEMORY[0x1E4F38EB8];
        v15 = [v44 curationContext];
        [v14 prefetchOnAssets:v13 options:14 curationContext:v15];

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v16 = v13;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v72 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v51 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v50 + 1) + 8 * i);
              int v22 = (void *)MEMORY[0x1D25FED50]();
              if ([(id)objc_opt_class() isPositiveWithUrbanSceneLabelsForAsset:v21])
              {
                __int16 v23 = [[PGCityscapeWallpaperSuggestionCandidate alloc] initWithAsset:v21];
                if ([(id)objc_opt_class() candidate:v23 passesFilteringWithContext:self->_primaryFilteringContext curationContext:v49 thresholdHelper:self->_peopleSceneConfidenceThresholdHelper statistics:buf]&& (!self->_secondaryFilteringContext|| objc_msgSend((id)objc_opt_class(), "candidate:passesFilteringWithContext:curationContext:thresholdHelper:statistics:", v23, self->_secondaryFilteringContext, v49, self->_peopleSceneConfidenceThresholdHelper, &v54)))
                {
                  [v48 addObject:v23];
                }
                ++v11;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v50 objects:v72 count:16];
          }
          while (v18);
        }

        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          int v24 = oslog;
          uint64_t v25 = [v45 firstIndex];
          uint64_t v26 = [v45 lastIndex];
          *(_DWORD *)double v64 = 134218240;
          *(void *)&v64[4] = v25;
          *(_WORD *)&v64[12] = 2048;
          *(void *)&v64[14] = v26;
          _os_log_debug_impl(&dword_1D1805000, v24, OS_LOG_TYPE_DEBUG, "[PGCityscapeWallpaperSuggester] processed candidates from %lu to %lu", v64, 0x16u);
        }
        id v4 = v42;
        if ([v42 isCancelledWithProgress:1.0 / (double)(v40 + 1) * 0.8 * (double)v46 + 0.2])break; {

        }
        unint64_t v12 = v46 + 1;
        if (v46 == v40)
        {
          uint64_t v28 = mach_absolute_time();
          uint32_t numer = info.numer;
          uint32_t denom = info.denom;
          __int16 v31 = oslog;
          int v32 = v31;
          if (v38 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
          {
            *(_WORD *)double v64 = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v32, OS_SIGNPOST_INTERVAL_END, spid, "PGCityscapeWallpaperSuggesterFilterCandidates", "", v64, 2u);
          }

          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)double v64 = 136315394;
            *(void *)&v64[4] = "PGCityscapeWallpaperSuggesterFilterCandidates";
            *(_WORD *)&v64[12] = 2048;
            *(double *)&v64[14] = (float)((float)((float)((float)(v28 - v37) * (float)numer) / (float)denom) / 1000000.0);
            _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v64, 0x16u);
          }
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)double v64 = 67109120;
            *(_DWORD *)&v64[4] = v11;
            _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Found %d positive cityscape assets", v64, 8u);
          }
          __int16 v33 = v32;
          os_signpost_id_t v6 = v39;
          __int16 v27 = v48;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            int v34 = [v48 count];
            *(_DWORD *)double v64 = 67109120;
            *(_DWORD *)&v64[4] = v34;
            _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Found %d candidates after postfiltering", v64, 8u);
          }

          long long v69 = v78;
          long long v70 = v79;
          long long v71 = v80;
          long long v65 = v74;
          long long v66 = v75;
          long long v67 = v76;
          long long v68 = v77;
          *(_OWORD *)double v64 = *(_OWORD *)buf;
          *(_OWORD *)&v64[16] = *(_OWORD *)&buf[16];
          [(PGCityscapeWallpaperSuggester *)self logPosterFilteringStatistics:v64];
          if (self->_secondaryFilteringContext)
          {
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)double v64 = 0;
              _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Secondary filtering...", v64, 2u);
            }
            long long v69 = v60;
            long long v70 = v61;
            long long v71 = v62;
            long long v65 = v56;
            long long v66 = v57;
            long long v67 = v58;
            long long v68 = v59;
            *(_OWORD *)double v64 = v54;
            *(_OWORD *)&v64[16] = v55;
            [(PGCityscapeWallpaperSuggester *)self logPosterFilteringStatistics:v64];
          }
          if (*(int *)&buf[4] >= 1) {
            [MEMORY[0x1E4F8E770] logInfo:v33 prefix:@"[PGCityscapeWallpaperSuggester]" avoidForKeyAssetStatistics:&v75];
          }
          id v5 = v48;
          goto LABEL_50;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)double v64 = 67109378;
        *(_DWORD *)&v64[4] = 355;
        *(_WORD *)&v64[8] = 2080;
        *(void *)&v64[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v64, 0x12u);
      }

      id v5 = (id)MEMORY[0x1E4F1CBF0];
      os_signpost_id_t v6 = v39;
      __int16 v27 = v48;
LABEL_50:
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
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PGCityscapeWallpaperSuggesterFetchCandidates", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v7 = mach_absolute_time();
  os_signpost_id_t v8 = [v2 photoLibrary];
  double v9 = [v8 librarySpecificFetchOptions];
  [v9 setCacheSizeForFetch:200];
  [v9 setChunkSizeForFetch:200];
  double v10 = +[PGWallpaperSuggestionUtilities assetFetchPropertySetsIncludingGating:](PGWallpaperSuggestionUtilities, "assetFetchPropertySetsIncludingGating:", [(id)objc_opt_class() filtersForTopSuggestions]);
  [v9 setFetchPropertySets:v10];

  int v11 = objc_opt_class();
  unint64_t v12 = [v2 forbiddenAssetUUIDs];
  v13 = [v11 prefilteringInternalPredicateWithForbiddenAssetUUIDs:v12];
  [v9 setInternalPredicate:v13];

  v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v30[0] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [v9 setSortDescriptors:v15];

  id v16 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v9];
  uint64_t v17 = v6;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [v16 count];
    *(_DWORD *)buf = 134217984;
    __int16 v27 = (const char *)v18;
    _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Fetched %lu candidate assets.", buf, 0xCu);
  }

  uint64_t v19 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  int v22 = v17;
  __int16 v23 = v22;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v23, OS_SIGNPOST_INTERVAL_END, v4, "PGCityscapeWallpaperSuggesterFetchCandidates", "", buf, 2u);
  }

  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v27 = "PGCityscapeWallpaperSuggesterFetchCandidates";
    __int16 v28 = 2048;
    double v29 = (float)((float)((float)((float)(v19 - v7) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v16;
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v113 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:v6];
  uint64_t v123 = 0;
  v124 = &v123;
  uint64_t v125 = 0x2020000000;
  char v126 = 0;
  int v8 = [v7 isCancelledWithProgress:0.0];
  *((unsigned char *)v124 + 24) = v8;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v129 = 124;
      *(_WORD *)&v129[4] = 2080;
      *(void *)&v129[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v9 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_25;
  }
  uint64_t v10 = [v113 maximumNumberOfSuggestions];
  int v11 = [(PGAbstractSuggester *)self session];
  [v11 loggingConnection];
  v111 = v11;
  unint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  unint64_t v108 = v13 - 1;
  os_signpost_id_t spid = v13;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGCityscapeWallpaperSuggester", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v107 = mach_absolute_time();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v129 = v10;
    _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Starting to generate %d suggestions.", buf, 8u);
  }
  uint64_t v16 = [v7 childProgressReporterFromStart:0.0 toEnd:0.39];
  v112 = [(PGCityscapeWallpaperSuggester *)self fetchUnsortedCandidatesWithProgressReporter:v16];
  v110 = (void *)v16;
  if (![v112 count])
  {
    if (*((unsigned char *)v124 + 24))
    {
      *((unsigned char *)v124 + 24) = 1;
    }
    else
    {
      char v20 = [v7 isCancelledWithProgress:1.0];
      *((unsigned char *)v124 + 24) = v20;
      if ((v20 & 1) == 0)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Found 0 unsorted candidate.", buf, 2u);
        }
        uint64_t v24 = mach_absolute_time();
        uint32_t numer = info.numer;
        uint32_t denom = info.denom;
        __int16 v27 = v15;
        __int16 v28 = v27;
        if (v108 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v28, OS_SIGNPOST_INTERVAL_END, spid, "PGCityscapeWallpaperSuggester", "", buf, 2u);
        }

        if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)v129 = "PGCityscapeWallpaperSuggester";
        *(_WORD *)&v129[8] = 2048;
        *(double *)&v129[10] = (float)((float)((float)((float)(v24 - v107) * (float)numer) / (float)denom) / 1000000.0);
        uint64_t v19 = "[Performance] %s: %f ms";
        uint64_t v18 = v28;
        uint32_t v21 = 22;
        goto LABEL_22;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v129 = 138;
      *(_WORD *)&v129[4] = 2080;
      *(void *)&v129[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
      uint64_t v18 = MEMORY[0x1E4F14500];
      uint64_t v19 = "Cancelled at line %d in file %s";
      goto LABEL_21;
    }
LABEL_23:
    id v9 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_24;
  }
  if (*((unsigned char *)v124 + 24))
  {
    *((unsigned char *)v124 + 24) = 1;
    goto LABEL_16;
  }
  char v17 = [v7 isCancelledWithProgress:0.4];
  *((unsigned char *)v124 + 24) = v17;
  if (v17)
  {
LABEL_16:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v129 = 145;
      *(_WORD *)&v129[4] = 2080;
      *(void *)&v129[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
      uint64_t v18 = MEMORY[0x1E4F14500];
      uint64_t v19 = "Cancelled at line %d in file %s";
LABEL_21:
      uint32_t v21 = 18;
LABEL_22:
      _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, v19, buf, v21);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  __int16 v23 = [(PGCityscapeWallpaperSuggester *)self sortedDedupedCandidatesFromCandidates:v112];
  if (*((unsigned char *)v124 + 24))
  {
    *((unsigned char *)v124 + 24) = 1;
LABEL_38:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v129 = 149;
      *(_WORD *)&v129[4] = 2080;
      *(void *)&v129[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v9 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_41;
  }
  char v29 = [v7 isCancelledWithProgress:0.8];
  *((unsigned char *)v124 + 24) = v29;
  if (v29) {
    goto LABEL_38;
  }
  v93 = v23;
  int v30 = [(id)objc_opt_class() suggestionTypes];
  unsigned __int16 v31 = [v30 firstIndex];

  int v32 = [(id)objc_opt_class() suggestionSubtypes];
  unsigned __int16 v33 = [v32 firstIndex];

  assetGater = self->_assetGater;
  __int16 v35 = [PGWallpaperSuggestionAccumulator alloc];
  if (assetGater) {
    uint64_t v36 = 2 * v10;
  }
  else {
    uint64_t v36 = 0;
  }
  if (assetGater) {
    uint64_t v37 = 5;
  }
  else {
    uint64_t v37 = 0;
  }
  v95 = [(PGWallpaperSuggestionAccumulator *)v35 initWithTargetNumberOfSuggestions:v10 targetMinimumNumberOfGatedSuggestions:v37 maximumNumberOfSuggestionsToTryForGating:v36 loggingConnection:v15];
  v92 = [MEMORY[0x1E4F1C9C8] date];
  v94 = [v92 dateByAddingTimeInterval:480.0];
  unint64_t v38 = [v23 count];
  log = v15;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    __int16 v39 = [NSNumber numberWithDouble:480.0];
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v129 = v38;
    *(_WORD *)&v129[4] = 2112;
    *(void *)&v129[6] = v92;
    *(_WORD *)&v129[14] = 2112;
    *(void *)&v129[16] = v39;
    LOWORD(v130[0]) = 2112;
    *(void *)((char *)v130 + 2) = v94;
    _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Start processing %d candidates. StartingDate: %@, MaxProcessingTime: %@s, MaxProcessingDate: %@", buf, 0x26u);
  }
  if (v38 <= 1) {
    unint64_t v40 = 1;
  }
  else {
    unint64_t v40 = v38;
  }
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id obj = v93;
  uint64_t v41 = [obj countByEnumeratingWithState:&v118 objects:v127 count:16];
  if (!v41)
  {
    int v98 = 0;
    int v96 = 0;
    uint64_t v91 = 0;
    int v90 = 0;
LABEL_102:

LABEL_103:
    v73 = [(PGWallpaperSuggestionAccumulator *)v95 suggestions];
    long long v74 = self->_assetGater;
    long long v75 = log;
    BOOL v76 = os_log_type_enabled(v75, OS_LOG_TYPE_INFO);
    if (v74)
    {
      if (!v76) {
        goto LABEL_109;
      }
      int v77 = [v73 count];
      int v78 = [(PGWallpaperSuggestionAccumulator *)v95 numberOfGatedSuggestions];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v129 = v77;
      *(_WORD *)&v129[4] = 1024;
      *(_DWORD *)&v129[6] = v78;
      long long v79 = "[PGCityscapeWallpaperSuggester] Generated %d suggestions (%d gated)";
      long long v80 = v75;
      uint32_t v81 = 14;
    }
    else
    {
      if (!v76) {
        goto LABEL_109;
      }
      int v82 = [v73 count];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v129 = v82;
      long long v79 = "[PGCityscapeWallpaperSuggester] Generated %d suggestions";
      long long v80 = v75;
      uint32_t v81 = 8;
    }
    _os_log_impl(&dword_1D1805000, v80, OS_LOG_TYPE_INFO, v79, buf, v81);
LABEL_109:

    if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v129 = v98;
      *(_WORD *)&v129[4] = 1024;
      *(_DWORD *)&v129[6] = v96;
      *(_WORD *)&v129[10] = 1024;
      *(_DWORD *)&v129[12] = HIDWORD(v91);
      *(_WORD *)&v129[16] = 1024;
      *(_DWORD *)&v129[18] = v90;
      *(_WORD *)&v129[22] = 1024;
      v130[0] = v91;
      _os_log_impl(&dword_1D1805000, v75, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Tried %d assets, %d passed, rejected %d for clock overlap, %d for low resolution, %d for low crop score.", buf, 0x20u);
    }
    if (*((unsigned char *)v124 + 24))
    {
      *((unsigned char *)v124 + 24) = 1;
    }
    else
    {
      char v83 = [v7 isCancelledWithProgress:1.0];
      *((unsigned char *)v124 + 24) = v83;
      if ((v83 & 1) == 0)
      {
        uint64_t v84 = mach_absolute_time();
        uint32_t v85 = info.numer;
        uint32_t v86 = info.denom;
        v87 = v75;
        v88 = v87;
        if (v108 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v87))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v88, OS_SIGNPOST_INTERVAL_END, spid, "PGCityscapeWallpaperSuggester", "", buf, 2u);
        }

        if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)v129 = "PGCityscapeWallpaperSuggester";
          *(_WORD *)&v129[8] = 2048;
          *(double *)&v129[10] = (float)((float)((float)((float)(v84 - v107) * (float)v85) / (float)v86) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v88, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        id v9 = v73;
        goto LABEL_117;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v129 = 242;
      *(_WORD *)&v129[4] = 2080;
      *(void *)&v129[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v9 = (id)MEMORY[0x1E4F1CBF0];
LABEL_117:

    goto LABEL_118;
  }
  int v98 = 0;
  int v96 = 0;
  uint64_t v91 = 0;
  int v90 = 0;
  uint64_t v104 = 0;
  unint64_t v105 = 0;
  unsigned int v100 = v33;
  unsigned int v101 = v31;
  double v43 = 0.1 / (double)v40;
  uint64_t v102 = *(void *)v119;
  *(void *)&long long v42 = 138412290;
  long long v89 = v42;
LABEL_55:
  uint64_t v44 = 0;
  uint64_t v103 = v41;
  while (1)
  {
    if (*(void *)v119 != v102) {
      objc_enumerationMutation(obj);
    }
    v45 = *(void **)(*((void *)&v118 + 1) + 8 * v44);
    context = (void *)MEMORY[0x1D25FED50]();
    unint64_t v46 = [PGSingleAssetSuggestion alloc];
    v47 = [v45 asset];
    id v48 = [(PGSingleAssetSuggestion *)v46 initWithType:v101 subtype:v100 asset:v47];

    uint64_t v49 = self->_assetGater;
    if (v49)
    {
      long long v50 = [v45 asset];
      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = __65__PGCityscapeWallpaperSuggester_suggestionsWithOptions_progress___block_invoke;
      v114[3] = &unk_1E68E5668;
      v116 = &v123;
      id v115 = v7;
      double v117 = v43 * (double)(unint64_t)(v104 + v44);
      long long v51 = [(PGWallpaperSuggestionAssetGater *)v49 gateAsset:v50 progressBlock:v114];

      -[PGSingleAssetSuggestion setAvailableFeatures:](v48, "setAvailableFeatures:", [v51 availableFeatures]);
      uint64_t v52 = [v51 passesAnyGating];
      unsigned int v53 = [v51 didTimeout];

      v105 += v53;
    }
    else
    {
      uint64_t v52 = 1;
    }
    if (*((unsigned char *)v124 + 24))
    {
      *((unsigned char *)v124 + 24) = 1;
LABEL_64:
      int v55 = 1;
      long long v56 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v129 = 186;
        *(_WORD *)&v129[4] = 2080;
        *(void *)&v129[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/PGCityscapeWallpaperSuggester.m";
        _os_log_impl(&dword_1D1805000, v56, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_95;
    }
    char v54 = [v7 isCancelledWithProgress:v43 * (double)(unint64_t)(v104 + v44) + 0.9];
    *((unsigned char *)v124 + 24) = v54;
    if (v54) {
      goto LABEL_64;
    }
    ++v98;
    if (v52) {
      goto LABEL_77;
    }
    long long v57 = [v45 cropResult];
    long long v58 = objc_msgSend(v57, "cropForOrientation:", -[PGCityscapeWallpaperSuggesterFilteringContext orientation](self->_primaryFilteringContext, "orientation"));

    int v59 = -[PGCityscapeWallpaperSuggesterFilteringContext ignoreClockOverlap](self->_primaryFilteringContext, "ignoreClockOverlap")? 1: [v58 passesClockOverlap];
    objc_msgSend(v58, "cropZoomRatio", v89);
    double v61 = v60;
    [(PGCityscapeWallpaperSuggesterFilteringContext *)self->_primaryFilteringContext maximumCropZoomRatio];
    double v63 = v62;
    [v58 cropScore];
    double v65 = v64;
    [(PGCityscapeWallpaperSuggesterFilteringContext *)self->_primaryFilteringContext minimumCropScore];
    int v67 = v61 <= v63 ? v59 : 0;
    int v68 = v65 >= v66 ? v67 : 0;

    if (v68)
    {
LABEL_77:
      -[PGWallpaperSuggestionAccumulator addSuggestion:passingGating:](v95, "addSuggestion:passingGating:", v48, v52, v89);
      ++v96;
      if ([(PGWallpaperSuggestionAccumulator *)v95 accumulationIsComplete])
      {
        int v55 = 2;
        goto LABEL_95;
      }
    }
    else
    {
      if (v59)
      {
        if (v61 > v63)
        {
          ++v90;
          long long v69 = @"low resolution";
        }
        else
        {
          LODWORD(v91) = v91 + 1;
          long long v69 = @"low cropScore";
        }
      }
      else
      {
        ++HIDWORD(v91);
        long long v69 = @"clock overlap";
      }
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v89;
        *(void *)v129 = v69;
        _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Rejecting non-gated suggestion because of %@.", buf, 0xCu);
      }
    }
    long long v70 = [MEMORY[0x1E4F1C9C8] date];
    [v94 timeIntervalSinceDate:v70];
    double v72 = v71;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v129 = v98;
      *(_WORD *)&v129[4] = 1024;
      *(_DWORD *)&v129[6] = v96;
      *(_WORD *)&v129[10] = 2048;
      *(double *)&v129[12] = v72;
      _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Tried %d candidates. %d passed. %.3fs processing time left.", buf, 0x18u);
    }
    if (v105 > 1 || v72 < 0.0)
    {
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v129 = v105;
        *(_WORD *)&v129[4] = 1024;
        *(_DWORD *)&v129[6] = 1;
        *(_WORD *)&v129[10] = 2048;
        *(double *)&v129[12] = v72;
        _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Reached (%d/%d) timeouts allowed. %.3fs processing time left.", buf, 0x18u);
      }
      int v55 = 2;
    }
    else
    {
      int v55 = 0;
    }

LABEL_95:
    if (v55) {
      break;
    }
    if (v103 == ++v44)
    {
      uint64_t v41 = [obj countByEnumeratingWithState:&v118 objects:v127 count:16];
      v104 += v44;
      if (v41) {
        goto LABEL_55;
      }
      goto LABEL_102;
    }
  }

  if (v55 == 2) {
    goto LABEL_103;
  }
  id v9 = (id)MEMORY[0x1E4F1CBF0];
LABEL_118:

  __int16 v23 = v93;
LABEL_41:

LABEL_24:
LABEL_25:
  _Block_object_dispose(&v123, 8);

  return v9;
}

uint64_t __65__PGCityscapeWallpaperSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, double a2)
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
    v14 = (PGCityscapeWallpaperSuggester *)_PFAssertFailHandler();
    [(PGCityscapeWallpaperSuggester *)v14 initWithSession:v16];
    return;
  }
  if (([(PGCityscapeWallpaperSuggester *)v2 isMemberOfClass:v3] & 1) == 0)
  {
    unint64_t v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }

  int IsIPad = PLPhysicalDeviceIsIPad();
  id v5 = [PGCityscapeWallpaperSuggesterFilteringContext alloc];
  if (IsIPad)
  {
    uint64_t v6 = [(PGCityscapeWallpaperSuggesterFilteringContext *)v5 initForCityscapesInOrientation:2];
    primaryFilteringContext = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGCityscapeWallpaperSuggesterFilteringContext *)v6;

    int v8 = [[PGCityscapeWallpaperSuggesterFilteringContext alloc] initForCityscapesInOrientation:1];
    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = v8;
  }
  else
  {
    uint64_t v10 = [(PGCityscapeWallpaperSuggesterFilteringContext *)v5 initForCityscapesInOrientation:1];
    int v11 = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGCityscapeWallpaperSuggesterFilteringContext *)v10;

    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = 0;
  }
}

- (PGCityscapeWallpaperSuggester)initWithSession:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGCityscapeWallpaperSuggester;
  id v5 = [(PGAbstractSuggester *)&v13 initWithSession:v4];
  if (v5)
  {
    if ([(id)objc_opt_class() filtersForTopSuggestions])
    {
      uint64_t v6 = [PGWallpaperSuggestionAssetGater alloc];
      id v7 = [v4 loggingConnection];
      uint64_t v8 = [(PGWallpaperSuggestionAssetGater *)v6 initWithType:4 loggingConnection:v7];
      assetGater = v5->_assetGater;
      v5->_assetGater = (PGWallpaperSuggestionAssetGater *)v8;

      [(PGWallpaperSuggestionAssetGater *)v5->_assetGater setEnableSettlingEffect:0];
    }
    uint64_t v10 = +[PGWallpaperSuggestionUtilities peopleSceneConfidenceThresholdHelper];
    peopleSceneConfidenceThresholdHelper = v5->_peopleSceneConfidenceThresholdHelper;
    v5->_peopleSceneConfidenceThresholdHelper = (CLSSceneConfidenceThresholdHelper *)v10;

    [(PGCityscapeWallpaperSuggester *)v5 setupFilteringContexts];
  }

  return v5;
}

+ (BOOL)passesFilteringWithAsset:(id)a3 curationContext:(id)a4 orientation:(int64_t)a5 reason:(id *)a6
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if ([a1 isPositiveWithUrbanSceneLabelsForAsset:v10])
  {
    unint64_t v38 = [v10 photoLibrary];
    unint64_t v12 = [v38 librarySpecificFetchOptions];
    objc_super v13 = [a1 prefilteringInternalPredicateWithForbiddenAssetUUIDs:0];
    [v12 setInternalPredicate:v13];

    v14 = (void *)MEMORY[0x1E4F38EB8];
    SEL v15 = [v10 localIdentifier];
    v39[0] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    char v17 = [v14 fetchAssetsWithLocalIdentifiers:v16 options:v12];
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
    char v20 = [[PGCityscapeWallpaperSuggestionCandidate alloc] initWithAsset:v10];
    uint32_t v21 = [PGCityscapeWallpaperSuggesterFilteringContext alloc];
    if (v19) {
      uint64_t v22 = [(PGCityscapeWallpaperSuggesterFilteringContext *)v21 initForTopCityscapesInOrientation:a5];
    }
    else {
      uint64_t v22 = [(PGCityscapeWallpaperSuggesterFilteringContext *)v21 initForCityscapesInOrientation:a5];
    }
    uint64_t v24 = (void *)v22;
    uint64_t v36 = +[PGWallpaperSuggestionUtilities peopleSceneConfidenceThresholdHelper];
    uint64_t v37 = v20;
    if (objc_msgSend(a1, "candidate:passesFilteringWithContext:curationContext:thresholdHelper:statistics:", v20, v24, v11))
    {
      if (v19)
      {
        uint64_t v25 = [PGWallpaperSuggestionAssetGater alloc];
        uint64_t v26 = [(PGWallpaperSuggestionAssetGater *)v25 initWithType:4 loggingConnection:MEMORY[0x1E4F14500]];
        BOOL v23 = 1;
        [(PGWallpaperSuggestionAssetGater *)v26 setCoversTracks:1];
        [(PGWallpaperSuggestionAssetGater *)v26 setIsUserInitiated:1];
        __int16 v35 = [(PGWallpaperSuggestionAssetGater *)v26 gateAsset:v10 progressBlock:&__block_literal_global_445];
        if ([v35 passesAnyGating])
        {
          __int16 v27 = @"Pass Segmented";
        }
        else
        {
          __int16 v28 = [(PGCityscapeWallpaperSuggestionCandidate *)v20 cropResult];
          char v29 = [v28 cropForOrientation:a5];

          if (([v24 ignoreClockOverlap] & 1) != 0
            || [v29 passesClockOverlap])
          {
            [v29 cropScore];
            double v31 = v30;
            [v24 minimumCropScore];
            BOOL v23 = v31 >= v32;
            if (v31 < v32) {
              __int16 v27 = @"Low Crop Score";
            }
            else {
              __int16 v27 = @"Pass Unsegmented";
            }
          }
          else
          {
            BOOL v23 = 0;
            __int16 v27 = @"Clock Overlap";
          }
        }
      }
      else
      {
        __int16 v27 = @"Pass";
        BOOL v23 = 1;
      }
      unsigned __int16 v33 = (void *)v36;
      if (!a6) {
        goto LABEL_28;
      }
    }
    else
    {
      if (!a6)
      {
        BOOL v23 = 0;
        unsigned __int16 v33 = (void *)v36;
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      BOOL v23 = 0;
      __int16 v27 = @"Unknown Reason";
      unsigned __int16 v33 = (void *)v36;
    }
    *a6 = v27;
    goto LABEL_28;
  }
  BOOL v23 = 0;
  if (a6) {
    *a6 = @"No Urban Scene";
  }
LABEL_30:

  return v23;
}

+ (BOOL)candidate:(id)a3 passesFilteringWithContext:(id)a4 curationContext:(id)a5 thresholdHelper:(id)a6 statistics:(id *)a7
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a5;
  SEL v15 = [v11 asset];
  id v16 = [v15 curationModel];
  char v17 = [v14 userFeedbackCalculator];

  LODWORD(v14) = [v16 isUtilityForMemoriesWithAsset:v15 userFeedbackCalculator:v17];
  if (v14)
  {
    BOOL v18 = 0;
    ++a7->var0;
    goto LABEL_47;
  }
  if ([v16 avoidIfPossibleForKeyAssetWithAsset:v15 statistics:&a7->var12])
  {
    BOOL v18 = 0;
    ++a7->var1;
    goto LABEL_47;
  }
  int v19 = [v16 aestheticsModel];
  char v20 = [v19 overallAestheticScoreNode];
  [v20 highPrecisionOperatingPoint];
  double v22 = v21;

  [v15 overallAestheticScore];
  if (v22 > v23)
  {
    BOOL v18 = 0;
    ++a7->var2;
    goto LABEL_47;
  }
  [v12 absoluteMinimumWallpaperScore];
  double v25 = v24;
  if (v24 < 0.0)
  {
    uint64_t v26 = [v16 wallpaperScoreModel];
    __int16 v27 = [v26 minimumWallpaperScoreNode];
    [v27 operatingPoint];
    double v25 = v28;
  }
  char v29 = [v15 mediaAnalysisProperties];
  [v29 wallpaperScore];
  double v31 = v30;

  if (v25 > v31)
  {
    BOOL v18 = 0;
    ++a7->var3;
    goto LABEL_47;
  }
  double v32 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v32 doubleForKey:@"PGCityscapeWallpaperSuggesterAestheticScore"];
  double v34 = v33;

  if (v34 <= 0.0)
  {
    char v36 = [v16 isAestheticallyPrettyGoodWithAsset:v15];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v72 = 134217984;
      double v73 = v34;
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Using custom aesthetics score %.2f ", (uint8_t *)&v72, 0xCu);
    }
    [v15 overallAestheticScore];
    char v36 = v34 <= v35;
  }
  [v12 minimumWallpaperScore];
  double v38 = v37;
  if (v37 < 0.0)
  {
    int v39 = [(id)objc_opt_class() filtersForAmbientSuggestions];
    unint64_t v40 = [v16 wallpaperScoreModel];
    uint64_t v41 = [v40 cityscapeNode];
    long long v42 = v41;
    if (v39) {
      [v41 highRecallOperatingPoint];
    }
    else {
      [v41 highPrecisionOperatingPoint];
    }
    double v38 = v43;
  }
  uint64_t v44 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v44 doubleForKey:@"PGCityscapeWallpaperSuggesterWallpaperScore"];
  double v46 = v45;

  if (v46 > 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v72 = 134217984;
      double v73 = v46;
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PGCityscapeWallpaperSuggester] Using custom wallpaper score %.2f ", (uint8_t *)&v72, 0xCu);
    }
    double v38 = v46;
  }
  v47 = [v15 mediaAnalysisProperties];
  [v47 wallpaperScore];
  double v49 = v48;

  if (v38 <= v49) {
    char v50 = 1;
  }
  else {
    char v50 = v36;
  }
  if ((v50 & 1) == 0)
  {
    BOOL v18 = 0;
    ++a7->var9;
    goto LABEL_47;
  }
  if (([v12 bypassCropScoreCheck] & 1) == 0)
  {
    long long v51 = [v11 cropResult];
    uint64_t v52 = objc_msgSend(v51, "cropForOrientation:", objc_msgSend(v12, "orientation"));

    if (([v12 ignoreClockOverlap] & 1) != 0 || objc_msgSend(v52, "passesClockOverlap"))
    {
      [v52 cropZoomRatio];
      double v54 = v53;
      [v12 maximumCropZoomRatio];
      if (v54 <= v55)
      {
        [v52 cropScore];
        double v58 = v57;
        [v12 minimumCropScore];
        if (v58 >= v59)
        {

          goto LABEL_30;
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

    BOOL v18 = 0;
    goto LABEL_47;
  }
LABEL_30:
  if ([MEMORY[0x1E4F8E7A8] assetIsSafeForWidgetDisplay:v15])
  {
    if (+[PGWallpaperSuggestionUtilities foundDominantPeopleSceneInAsset:v15 withConfidenceThresholdHelper:v13])
    {
      BOOL v18 = 0;
      ++a7->var8;
    }
    else
    {
      [v12 maximumLowLightScore];
      double v61 = v60;
      if (v60 < 0.0)
      {
        double v62 = [v15 curationModel];
        double v63 = [v62 aestheticsModel];
        double v64 = [v63 lowLightNode];
        [v64 operatingPoint];
        double v61 = v65;
      }
      double v66 = [v15 aestheticProperties];
      [v66 lowLight];
      double v68 = v67;

      if (v61 >= v68)
      {
        long long v70 = [v11 asset];
        BOOL v71 = +[PGSensitiveLocationBlocklistConfiguration isAssetAtSensitiveLocationAndDate:v70];

        if (v71)
        {
          BOOL v18 = 0;
          ++a7->var11;
        }
        else
        {
          BOOL v18 = 1;
        }
      }
      else
      {
        BOOL v18 = 0;
        ++a7->var10;
      }
    }
  }
  else
  {
    BOOL v18 = 0;
    ++a7->var7;
  }
LABEL_47:

  return v18;
}

+ (BOOL)isPositiveWithUrbanSceneLabelsForAsset:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v11 = @"cityscape";
  id v12 = @"skyscraper";
  id v13 = @"Q702492";
  id v14 = @"Q200250";
  SEL v15 = @"Q174782";
  id v16 = @"Q18142";
  char v17 = @"Q2997369";
  BOOL v18 = @"Q1050303";
  int v19 = @"Q515";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v11 count:9];
  id v7 = [PGSceneAssetFilter alloc];
  uint64_t v8 = [a1 sceneTaxonomy];
  id v9 = -[PGSceneAssetFilter initForEntityNetWithSceneNames:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:](v7, "initForEntityNetWithSceneNames:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:", v6, &__block_literal_global_6481, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], 0, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], v8, v11, v12, v13, v14, v15, v16, v17, v18,
         v19,
         v20);

  LOBYTE(v8) = [v9 passesWithAsset:v5];
  return (char)v8;
}

uint64_t __72__PGCityscapeWallpaperSuggester_isPositiveWithUrbanSceneLabelsForAsset___block_invoke(uint64_t a1, void *a2)
{
  return [a2 trendsSceneModel];
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
        id v11 = [PGCityscapeWallpaperSuggestionCandidate alloc];
        id v12 = -[PGCityscapeWallpaperSuggestionCandidate initWithAsset:](v11, "initWithAsset:", v10, (void)v14);
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
  uint64_t v7 = [MEMORY[0x1E4F8A950] predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToSceneVersion:&unk_1F28D07E0];
  [v4 addObject:v7];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.%K > %d", @"additionalAttributes", @"faceAnalysisVersion", 0);
  [v4 addObject:v8];
  id v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.@count == %d", @"detectedFaces", 0);
  [v4 addObject:v9];
  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (%K IN %@)", @"playbackStyle", &unk_1F28D39D8];
  [v4 addObject:v10];
  if ([v3 count])
  {
    id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (%K IN %@)", @"uuid", v3];
    [v4 addObject:v11];
  }
  id v12 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];

  return v12;
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
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:655];
}

+ (id)suggestionTypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:6];
}

+ (CLSSceneTaxonomyHierarchy)sceneTaxonomy
{
  uint64_t v2 = (void *)sceneTaxonomy_sceneTaxonomy;
  if (!sceneTaxonomy_sceneTaxonomy)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F8E790]) initForSceneNetOnly:0];
    id v4 = (void *)sceneTaxonomy_sceneTaxonomy;
    sceneTaxonomy_sceneTaxonomy = v3;

    uint64_t v2 = (void *)sceneTaxonomy_sceneTaxonomy;
  }
  return (CLSSceneTaxonomyHierarchy *)v2;
}

@end