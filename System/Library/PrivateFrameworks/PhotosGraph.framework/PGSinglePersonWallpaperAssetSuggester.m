@interface PGSinglePersonWallpaperAssetSuggester
+ (BOOL)candidateAsset:(id)a3 andFace:(id)a4 passesPostfilteringWithContext:(id)a5 curationContext:(id)a6 statistics:(id *)a7;
+ (BOOL)passesFilteringWithAsset:(id)a3 forTopWallpaperSuggestions:(BOOL)a4 curationContext:(id)a5 orientation:(int64_t)a6 reason:(id *)a7;
+ (id)_assetExpressionWithFilteringContext:(id)a3;
+ (id)prefilteringInternalPredicateWithContext:(id)a3 forTargetAspectRatio:(double)a4;
+ (id)prefilteringSubpredicatesWithContext:(id)a3 forTargetAspectRatio:(double)a4;
- (NSArray)assetFetchPropertySets;
- (NSSet)forbiddenAssetUUIDs;
- (PGSinglePersonWallpaperAssetSuggester)initWithPersonLocalIdentifiers:(id)a3 curationContext:(id)a4 loggingConnection:(id)a5;
- (PGSinglePersonWallpaperAssetSuggesterDistancingContext)distancingContext;
- (PGSinglePersonWallpaperAssetSuggesterFilteringContext)primaryFilteringContext;
- (PGSinglePersonWallpaperAssetSuggesterFilteringContext)secondaryFilteringContext;
- (PGSinglePersonWallpaperAssetSuggesterScoringContext)scoringContext;
- (id)_sortedDedupedCandidatesFromCandidates:(id)a3 progressBlock:(id)a4;
- (id)assetsFromCandidates:(id)a3;
- (id)nextSuggestedAsset;
- (id)unsortedCandidatesFromPersonLocalIdentifiers:(id)a3 progressBlock:(id)a4;
- (unint64_t)expectedNumberOfSuggestedAssets;
- (void)computeSuggestedAssetsWithProgress:(id)a3;
- (void)logPosterFilteringStatistics:(id *)a3;
- (void)setAssetFetchPropertySets:(id)a3;
- (void)setDistancingContext:(id)a3;
- (void)setForbiddenAssetUUIDs:(id)a3;
- (void)setPrimaryFilteringContext:(id)a3;
- (void)setScoringContext:(id)a3;
- (void)setSecondaryFilteringContext:(id)a3;
@end

@implementation PGSinglePersonWallpaperAssetSuggester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forbiddenAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_assetFetchPropertySets, 0);
  objc_storeStrong((id *)&self->_distancingContext, 0);
  objc_storeStrong((id *)&self->_scoringContext, 0);
  objc_storeStrong((id *)&self->_secondaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_primaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_suggestedAssetEnumerator, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
}

- (void)setForbiddenAssetUUIDs:(id)a3
{
}

- (NSSet)forbiddenAssetUUIDs
{
  return self->_forbiddenAssetUUIDs;
}

- (void)setAssetFetchPropertySets:(id)a3
{
}

- (NSArray)assetFetchPropertySets
{
  return self->_assetFetchPropertySets;
}

- (void)setDistancingContext:(id)a3
{
}

- (PGSinglePersonWallpaperAssetSuggesterDistancingContext)distancingContext
{
  return self->_distancingContext;
}

- (void)setScoringContext:(id)a3
{
}

- (PGSinglePersonWallpaperAssetSuggesterScoringContext)scoringContext
{
  return self->_scoringContext;
}

- (void)setSecondaryFilteringContext:(id)a3
{
}

- (PGSinglePersonWallpaperAssetSuggesterFilteringContext)secondaryFilteringContext
{
  return self->_secondaryFilteringContext;
}

- (void)setPrimaryFilteringContext:(id)a3
{
}

- (PGSinglePersonWallpaperAssetSuggesterFilteringContext)primaryFilteringContext
{
  return self->_primaryFilteringContext;
}

- (id)assetsFromCandidates:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x1D25FED50]();
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v39 + 1) + 8 * i) assetUUID];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v8);
  }

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v13 = [(CLSCurationContext *)self->_curationContext photoLibrary];
  v14 = [v13 librarySpecificFetchOptions];

  [v14 setFetchPropertySets:self->_assetFetchPropertySets];
  v15 = [MEMORY[0x1E4F38EB8] fetchAssetsWithUUIDs:v5 options:v14];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        v21 = [v20 uuid];
        [v12 setObject:v20 forKeyedSubscript:v21];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v17);
  }
  v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v23 = v5;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = [v12 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * k)];
        if (v28) {
          [v22 addObject:v28];
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v25);
  }

  return v22;
}

- (id)_sortedDedupedCandidatesFromCandidates:(id)a3 progressBlock:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void *, unsigned char *, double))_Block_copy(v7);
  double v9 = 0.0;
  if (v8)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v59 = 0;
      v8[2](v8, &v59, 0.0);
      if (v59)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v64 = 285;
          __int16 v65 = 2080;
          v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v11 = 0;
        goto LABEL_44;
      }
      double v9 = Current;
    }
  }
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F8A780]) initWithDistanceBlock:&__block_literal_global_25355];
  [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)self->_primaryFilteringContext timeIntervalForCandidateDeduping];
  objc_msgSend(v12, "setMaximumDistance:");
  [v12 setMinimumNumberOfObjects:1];
  v44 = [v12 performWithDataset:v6 progressBlock:&__block_literal_global_390];
  if (v8)
  {
    double v13 = CFAbsoluteTimeGetCurrent();
    if (v13 - v9 >= 0.01)
    {
      char v59 = 0;
      v8[2](v8, &v59, 0.5);
      if (v59)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v64 = 297;
          __int16 v65 = 2080;
          v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v11 = 0;
        goto LABEL_43;
      }
      double v9 = v13;
    }
  }
  long long v39 = self;
  long long v40 = v12;
  long long v41 = v8;
  id v42 = v7;
  v43 = v6;
  v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"isFavorite" ascending:0];
  v62[0] = v14;
  v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
  v62[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"wallpaperScore" ascending:0];
  v62[2] = v16;
  uint64_t v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"aestheticScore" ascending:0];
  v62[3] = v17;
  uint64_t v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v62[4] = v18;
  v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"assetUUID" ascending:1];
  v62[5] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:6];

  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = v44;
  uint64_t v48 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (!v48) {
    goto LABEL_33;
  }
  uint64_t v47 = *(void *)v56;
  do
  {
    for (uint64_t i = 0; i != v48; ++i)
    {
      if (*(void *)v56 != v47) {
        objc_enumerationMutation(obj);
      }
      v22 = *(void **)(*((void *)&v55 + 1) + 8 * i);
      id v23 = (void *)MEMORY[0x1D25FED50]();
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v24 = [v22 objects];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (!v25)
      {
        v27 = v24;
        goto LABEL_30;
      }
      uint64_t v26 = v25;
      v49 = v23;
      uint64_t v50 = i;
      v27 = 0;
      uint64_t v28 = *(void *)v52;
      do
      {
        uint64_t v29 = 0;
        v30 = v27;
        do
        {
          if (*(void *)v52 != v28) {
            objc_enumerationMutation(v24);
          }
          long long v31 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *(void *)(*((void *)&v51 + 1) + 8 * v29), v30, 0);
          long long v32 = [v31 sortedArrayUsingDescriptors:v20];
          v27 = [v32 firstObject];

          ++v29;
          v30 = v27;
        }
        while (v26 != v29);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v26);

      id v23 = v49;
      uint64_t i = v50;
      if (v27)
      {
        [v45 addObject:v27];
LABEL_30:
      }
    }
    uint64_t v48 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
  }
  while (v48);
LABEL_33:

  long long v33 = [v45 sortedArrayUsingDescriptors:v20];
  loggingConnection = v39->_loggingConnection;
  id v6 = v43;
  uint64_t v8 = v41;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    long long v35 = loggingConnection;
    int v36 = [v43 count];
    int v37 = [v33 count];
    *(_DWORD *)buf = 67109376;
    int v64 = v36;
    __int16 v65 = 1024;
    LODWORD(v66) = v37;
    _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "[PGSinglePersonWallpaperAssetSuggester] Deduped %d candidates to %d", buf, 0xEu);
  }
  id v7 = v42;
  v12 = v40;
  if (v41 && CFAbsoluteTimeGetCurrent() - v9 >= 0.01 && (char v59 = 0, v41[2](v41, &v59, 1.0), v59))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v64 = 325;
      __int16 v65 = 2080;
      v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v11 = 0;
  }
  else
  {
    id v11 = v33;
  }

LABEL_43:
LABEL_44:

  return v11;
}

double __94__PGSinglePersonWallpaperAssetSuggester__sortedDedupedCandidatesFromCandidates_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 creationDate];
  id v6 = [v4 creationDate];

  [v5 timeIntervalSinceDate:v6];
  double v8 = fabs(v7);

  return v8;
}

- (void)logPosterFilteringStatistics:(id *)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v5 = [(PGSinglePersonWallpaperAssetSuggester *)self primaryFilteringContext];
  int v6 = [v5 bypassCropScoreCheck];

  loggingConnection = self->_loggingConnection;
  BOOL v8 = os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (!v8) {
      return;
    }
    int var0 = a3->var0;
    int var1 = a3->var1;
    int var2 = a3->var2;
    int var3 = a3->var3;
    int var4 = a3->var4;
    int var8 = a3->var8;
    int var9 = a3->var9;
    int var10 = a3->var10;
    int var11 = a3->var11;
    int v33 = 67111168;
    int v34 = var0;
    __int16 v35 = 1024;
    int v36 = var1;
    __int16 v37 = 1024;
    int v38 = var2;
    __int16 v39 = 1024;
    int v40 = var3;
    __int16 v41 = 1024;
    int v42 = var9;
    __int16 v43 = 1024;
    int v44 = var4;
    __int16 v45 = 1024;
    int v46 = var8;
    __int16 v47 = 1024;
    int v48 = var10;
    __int16 v49 = 1024;
    int v50 = var11;
    uint64_t v18 = "[PGSinglePersonWallpaperAssetSuggester] Filtered out %d for isUtility, %d for avoidForKeyAsset, %d for aesthet"
          "ics, %d for wallpaper score, %d for aesthetics+wallpaper, %d for face quality, %d for not safe for display, %d"
          " for low light, %d for sensitive location";
    v19 = loggingConnection;
    uint32_t v20 = 56;
  }
  else
  {
    if (!v8) {
      return;
    }
    int v21 = a3->var0;
    int v22 = a3->var1;
    int v23 = a3->var2;
    int v24 = a3->var3;
    int v25 = a3->var4;
    int var5 = a3->var5;
    int var6 = a3->var6;
    int var7 = a3->var7;
    int v30 = a3->var8;
    int v29 = a3->var9;
    int v31 = a3->var10;
    int v32 = a3->var11;
    int v33 = 67111936;
    int v34 = v21;
    __int16 v35 = 1024;
    int v36 = v22;
    __int16 v37 = 1024;
    int v38 = v23;
    __int16 v39 = 1024;
    int v40 = v24;
    __int16 v41 = 1024;
    int v42 = v29;
    __int16 v43 = 1024;
    int v44 = v25;
    __int16 v45 = 1024;
    int v46 = var5;
    __int16 v47 = 1024;
    int v48 = var6;
    __int16 v49 = 1024;
    int v50 = var7;
    __int16 v51 = 1024;
    int v52 = v30;
    __int16 v53 = 1024;
    int v54 = v31;
    __int16 v55 = 1024;
    int v56 = v32;
    uint64_t v18 = "[PGSinglePersonWallpaperAssetSuggester] Filtered out %d for isUtility, %d for avoidForKeyAsset, %d for aesthet"
          "ics, %d for wallpaper score, %d for aesthetics+wallpaper, %d for face quality, %d for clock overlap, %d for lo"
          "w resolution, %d for crop score, %d for not safe for display, %d for low light, %d for sensitive location";
    v19 = loggingConnection;
    uint32_t v20 = 74;
  }
  _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v33, v20);
}

- (id)unsortedCandidatesFromPersonLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v93 = a3;
  id v6 = a4;
  double v7 = (void (**)(void *, _OWORD *, double))_Block_copy(v6);
  double v8 = 0.0;
  v90 = v6;
  if (v7)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(v107) = 0;
      v7[2](v7, &v107, 0.0);
      if ((_BYTE)v107)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = 183;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v10 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_103;
      }
      double v8 = Current;
    }
  }
  v89 = [(CLSCurationContext *)self->_curationContext photoLibrary];
  id v11 = [v89 librarySpecificFetchOptions];
  PFDeviceScreenSize();
  double v14 = v12;
  double v15 = v13;
  if (v12 == 0.0
    || v13 == 0.0
    || (v12 == *MEMORY[0x1E4F8A250] ? (BOOL v16 = v13 == *(double *)(MEMORY[0x1E4F8A250] + 8)) : (BOOL v16 = 0), v16))
  {
    double v17 = 1.0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(double *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = 0x3FF0000000000000;
      _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "[Performance] %s: %f ms", buf, 0x20u);
    }
  }
  else
  {
    double v17 = fabs(v12 / v13);
  }
  [v11 setChunkSizeForFetch:200];
  v91 = v11;
  [v11 setCacheSizeForFetch:200];
  v92 = [(id)objc_opt_class() prefilteringInternalPredicateWithContext:self->_primaryFilteringContext forTargetAspectRatio:v17];
  id v100 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v18 = v93;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v117 objects:v139 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v118;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v118 != v21) {
          objc_enumerationMutation(v18);
        }
        int v23 = [MEMORY[0x1E4F391F0] uuidFromLocalIdentifier:*(void *)(*((void *)&v117 + 1) + 8 * i)];
        if (v23) {
          [v100 addObject:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v117 objects:v139 count:16];
    }
    while (v20);
  }

  uint64_t v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"personForFace.personUUID", v100];
  int v25 = (void *)MEMORY[0x1E4F28BA0];
  v88 = (void *)v24;
  v138[0] = v24;
  v138[1] = v92;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:2];
  v27 = [v25 andPredicateWithSubpredicates:v26];
  uint64_t v28 = v91;
  [v91 setInternalPredicate:v27];

  int v29 = self->_loggingConnection;
  os_signpost_id_t v30 = os_signpost_id_generate((os_log_t)v29);
  int v31 = v29;
  int v32 = v31;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "PGSinglePersonWallpaperAssetSuggesterFaceFetch", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v33 = mach_absolute_time();
  v97 = [MEMORY[0x1E4F39050] fetchFacesWithOptions:v91];
  uint64_t v34 = mach_absolute_time();
  mach_timebase_info v35 = info;
  int v36 = v32;
  __int16 v37 = v36;
  log = v36;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    BOOL v38 = os_signpost_enabled(v36);
    __int16 v37 = log;
    if (v38)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, log, OS_SIGNPOST_INTERVAL_END, v30, "PGSinglePersonWallpaperAssetSuggesterFaceFetch", "", buf, 2u);
      __int16 v37 = log;
    }
  }
  __int16 v39 = v37;

  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "PGSinglePersonWallpaperAssetSuggesterFaceFetch";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v34 - v33) * (float)v35.numer) / (float)v35.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  loggingConnection = self->_loggingConnection;
  __int16 v41 = v97;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int v42 = loggingConnection;
    int v43 = [v97 count];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v43;
    _os_log_impl(&dword_1D1805000, v42, OS_LOG_TYPE_INFO, "[PGSinglePersonWallpaperAssetSuggester] Found %d candidates after prefiltering", buf, 8u);
  }
  if (v7)
  {
    double v44 = CFAbsoluteTimeGetCurrent();
    if (v44 - v8 >= 0.01)
    {
      LOBYTE(v107) = 0;
      v7[2](v7, &v107, 0.2);
      if ((_BYTE)v107)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = 213;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v10 = (id)MEMORY[0x1E4F1CBF0];
        int v46 = v88;
        __int16 v45 = v89;
        goto LABEL_102;
      }
      double v8 = v44;
    }
  }
  v101 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v97, "count"));
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v131 = 0u;
  memset(buf, 0, sizeof(buf));
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v107 = 0u;
  __int16 v47 = +[PGCurationManager assetPropertySetsForCuration];
  v96 = [v47 arrayByAddingObject:*MEMORY[0x1E4F394F8]];

  unint64_t v48 = [v97 count];
  if (![v97 count]) {
    goto LABEL_78;
  }
  unint64_t v49 = 0;
  double v50 = 0.75 / (double)v48;
  double v51 = 0.2;
  unint64_t v52 = 0x1E4F38000uLL;
  v95 = v7;
LABEL_45:
  __int16 v53 = (void *)MEMORY[0x1D25FED50]();
  int v54 = (void *)MEMORY[0x1E4F28D60];
  uint64_t v55 = [v41 count];
  if (v55 - v49 >= 0xC8) {
    uint64_t v56 = 200;
  }
  else {
    uint64_t v56 = v55 - v49;
  }
  uint64_t v57 = objc_msgSend(v54, "indexSetWithIndexesInRange:", v49, v56);
  id v58 = [v41 objectsAtIndexes:v57];

  char v59 = [*(id *)(v52 + 3768) fetchAssetsGroupedByFaceUUIDForFaces:v58 fetchPropertySets:v96];
  double v60 = v51 + v50 * 0.3;
  if (v7)
  {
    double v61 = CFAbsoluteTimeGetCurrent();
    if (v61 - v8 >= 0.01)
    {
      char v106 = 0;
      ((void (**)(void *, char *, double))v7)[2](v7, &v106, v60);
      if (v106)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v121 = 67109378;
          *(_DWORD *)&v121[4] = 228;
          *(_WORD *)&v121[8] = 2080;
          *(void *)&v121[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
          v86 = MEMORY[0x1E4F14500];
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      double v8 = v61;
    }
  }
  v62 = *(void **)(v52 + 3768);
  v63 = [v59 allValues];
  [v62 prefetchOnAssets:v63 options:14 curationContext:self->_curationContext];

  double v64 = v60 + v50 * 0.3;
  if (!v7) {
    goto LABEL_56;
  }
  double v65 = CFAbsoluteTimeGetCurrent();
  if (v65 - v8 < 0.01) {
    goto LABEL_56;
  }
  char v106 = 0;
  ((void (**)(void *, char *, double))v7)[2](v7, &v106, v64);
  if (!v106)
  {
    double v8 = v65;
LABEL_56:
    unint64_t v98 = v49;
    v99 = v53;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v58 = v58;
    uint64_t v66 = [v58 countByEnumeratingWithState:&v102 objects:v129 count:16];
    if (!v66) {
      goto LABEL_72;
    }
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v103;
    while (1)
    {
      for (uint64_t j = 0; j != v67; ++j)
      {
        if (*(void *)v103 != v68) {
          objc_enumerationMutation(v58);
        }
        v70 = *(void **)(*((void *)&v102 + 1) + 8 * j);
        v71 = [v70 uuid];
        v72 = [v59 objectForKeyedSubscript:v71];

        if (v72)
        {
          forbiddenAssetUUIDs = self->_forbiddenAssetUUIDs;
          v74 = [v72 uuid];
          LODWORD(forbiddenAssetUUIDs) = [(NSSet *)forbiddenAssetUUIDs containsObject:v74];

          if (forbiddenAssetUUIDs)
          {
            v75 = self->_loggingConnection;
            if (!os_log_type_enabled(v75, OS_LOG_TYPE_INFO)) {
              goto LABEL_70;
            }
            v76 = v75;
            v77 = [v72 uuid];
            *(_DWORD *)v121 = 138412290;
            *(void *)&v121[4] = v77;
            _os_log_impl(&dword_1D1805000, &v76->super, OS_LOG_TYPE_INFO, "[PGSinglePersonWallpaperAssetSuggester] Avoiding asset %@ because it has been rejected by the user", v121, 0xCu);

            goto LABEL_69;
          }
          if ([(id)objc_opt_class() candidateAsset:v72 andFace:v70 passesPostfilteringWithContext:self->_primaryFilteringContext curationContext:self->_curationContext statistics:buf]&& (!self->_secondaryFilteringContext|| objc_msgSend((id)objc_opt_class(), "candidateAsset:andFace:passesPostfilteringWithContext:curationContext:statistics:", v72, v70, self->_secondaryFilteringContext, self->_curationContext, &v107)))
          {
            v76 = [[PGSinglePersonWallpaperAssetCandidate alloc] initWithFace:v70 inAsset:v72];
            [v101 addObject:v76];
LABEL_69:
          }
        }
LABEL_70:
      }
      uint64_t v67 = [v58 countByEnumeratingWithState:&v102 objects:v129 count:16];
      if (!v67)
      {
LABEL_72:

        double v51 = v64 + v50 * 0.4;
        double v7 = v95;
        if (v95)
        {
          double v78 = CFAbsoluteTimeGetCurrent();
          __int16 v41 = v97;
          unint64_t v79 = v98;
          __int16 v53 = v99;
          unint64_t v52 = 0x1E4F38000;
          if (v78 - v8 < 0.01) {
            goto LABEL_77;
          }
          char v106 = 0;
          ((void (**)(void *, char *, double))v95)[2](v95, &v106, v51);
          if (!v106)
          {
            double v8 = v78;
            goto LABEL_77;
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v121 = 67109378;
            *(_DWORD *)&v121[4] = 256;
            *(_WORD *)&v121[8] = 2080;
            *(void *)&v121[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
            v86 = MEMORY[0x1E4F14500];
LABEL_99:
            _os_log_impl(&dword_1D1805000, v86, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v121, 0x12u);
          }
          goto LABEL_100;
        }
        __int16 v41 = v97;
        unint64_t v79 = v98;
        __int16 v53 = v99;
        unint64_t v52 = 0x1E4F38000;
LABEL_77:

        unint64_t v49 = v79 + 200;
        if (v49 >= [v41 count])
        {
LABEL_78:
          v80 = self->_loggingConnection;
          v81 = v101;
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            v82 = v80;
            int v83 = [v101 count];
            *(_DWORD *)v121 = 67109120;
            *(_DWORD *)&v121[4] = v83;
            _os_log_impl(&dword_1D1805000, v82, OS_LOG_TYPE_INFO, "[PGSinglePersonWallpaperAssetSuggester] Found %d candidates after postfiltering", v121, 8u);
          }
          long long v126 = v135;
          long long v127 = v136;
          long long v128 = v137;
          long long v122 = v131;
          long long v123 = v132;
          long long v124 = v133;
          long long v125 = v134;
          *(_OWORD *)v121 = *(_OWORD *)buf;
          *(_OWORD *)&v121[16] = *(_OWORD *)&buf[16];
          [(PGSinglePersonWallpaperAssetSuggester *)self logPosterFilteringStatistics:v121];
          v84 = [(PGSinglePersonWallpaperAssetSuggester *)self secondaryFilteringContext];

          uint64_t v28 = v91;
          if (v84)
          {
            v85 = self->_loggingConnection;
            if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v121 = 0;
              _os_log_impl(&dword_1D1805000, v85, OS_LOG_TYPE_INFO, "[PGSinglePersonWallpaperAssetSuggester] Secondary filtering...", v121, 2u);
            }
            long long v126 = v113;
            long long v127 = v114;
            long long v128 = v115;
            long long v122 = v109;
            long long v123 = v110;
            long long v124 = v111;
            long long v125 = v112;
            *(_OWORD *)v121 = v107;
            *(_OWORD *)&v121[16] = v108;
            [(PGSinglePersonWallpaperAssetSuggester *)self logPosterFilteringStatistics:v121];
          }
          if (*(int *)&buf[4] >= 1) {
            [MEMORY[0x1E4F8E770] logInfo:self->_loggingConnection prefix:@"[PGSinglePersonWallpaperAssetSuggester]" avoidForKeyAssetStatistics:&v132];
          }
          int v46 = v88;
          __int16 v45 = v89;
          if (v7
            && CFAbsoluteTimeGetCurrent() - v8 >= 0.01
            && (char v106 = 0, ((void (**)(void *, char *, double))v7)[2](v7, &v106, 1.0), v106))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v121 = 67109378;
              *(_DWORD *)&v121[4] = 270;
              *(_WORD *)&v121[8] = 2080;
              *(void *)&v121[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v121, 0x12u);
            }
            id v10 = (id)MEMORY[0x1E4F1CBF0];
          }
          else
          {
            id v10 = v101;
          }
          goto LABEL_101;
        }
        goto LABEL_45;
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v121 = 67109378;
    *(_DWORD *)&v121[4] = 234;
    *(_WORD *)&v121[8] = 2080;
    *(void *)&v121[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
    v86 = MEMORY[0x1E4F14500];
    goto LABEL_99;
  }
LABEL_100:
  int v46 = v88;
  __int16 v45 = v89;

  id v10 = (id)MEMORY[0x1E4F1CBF0];
  uint64_t v28 = v91;
  v81 = v101;
LABEL_101:

LABEL_102:
LABEL_103:

  return v10;
}

- (void)computeSuggestedAssetsWithProgress:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v4 = _Block_copy(v42);
  uint64_t v59 = 0;
  double v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = (double *)&v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 0;
  if (v4
    && (double v5 = CFAbsoluteTimeGetCurrent(), v5 - v56[3] >= 0.01)
    && (v56[3] = v5,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v4 + 2))(v4, &info, 0.0),
        char v6 = *((unsigned char *)v60 + 24) | LOBYTE(info.numer),
        (*((unsigned char *)v60 + 24) = v6) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)double v64 = 82;
      *(_WORD *)&v64[4] = 2080;
      *(void *)&v64[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
      double v7 = MEMORY[0x1E4F14500];
LABEL_42:
      _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    context = (void *)MEMORY[0x1D25FED50]();
    double v8 = self->_loggingConnection;
    os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)v8);
    id v10 = v8;
    id v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGSinglePersonWallpaperAssetSuggesterCandidateFiltering", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v12 = mach_absolute_time();
    personLocalIdentifiers = self->_personLocalIdentifiers;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __76__PGSinglePersonWallpaperAssetSuggester_computeSuggestedAssetsWithProgress___block_invoke;
    v49[3] = &unk_1E68F03F8;
    id v14 = v4;
    id v50 = v14;
    double v51 = &v55;
    unint64_t v52 = &v59;
    uint64_t v53 = 0x3F847AE147AE147BLL;
    __int16 v41 = [(PGSinglePersonWallpaperAssetSuggester *)self unsortedCandidatesFromPersonLocalIdentifiers:personLocalIdentifiers progressBlock:v49];
    if (*((unsigned char *)v60 + 24))
    {
      int v15 = 1;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)double v64 = 89;
        *(_WORD *)&v64[4] = 2080;
        *(void *)&v64[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      uint64_t v16 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      uint64_t v19 = v11;
      uint64_t v20 = v19;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_END, v9, "PGSinglePersonWallpaperAssetSuggesterCandidateFiltering", "", buf, 2u);
      }

      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)double v64 = "PGSinglePersonWallpaperAssetSuggesterCandidateFiltering";
        *(_WORD *)&v64[8] = 2048;
        *(double *)&v64[10] = (float)((float)((float)((float)(v16 - v12) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (v4
        && (double Current = CFAbsoluteTimeGetCurrent(), Current - v56[3] >= 0.01)
        && (v56[3] = Current,
            LOBYTE(v48.numer) = 0,
            (*((void (**)(id, mach_timebase_info *, double))v14 + 2))(v14, &v48, 0.5),
            char v22 = *((unsigned char *)v60 + 24) | LOBYTE(v48.numer),
            (*((unsigned char *)v60 + 24) = v22) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)double v64 = 92;
          *(_WORD *)&v64[4] = 2080;
          *(void *)&v64[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        int v15 = 1;
      }
      else
      {
        int v23 = self->_loggingConnection;
        os_signpost_id_t v24 = os_signpost_id_generate((os_log_t)v23);
        int v25 = v23;
        uint64_t v26 = v25;
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PGSinglePersonWallpaperAssetSuggesterCandidateDeduping", "", buf, 2u);
        }

        mach_timebase_info v48 = 0;
        mach_timebase_info(&v48);
        uint64_t v27 = mach_absolute_time();
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __76__PGSinglePersonWallpaperAssetSuggester_computeSuggestedAssetsWithProgress___block_invoke_236;
        v43[3] = &unk_1E68F03F8;
        id v44 = v14;
        __int16 v45 = &v55;
        int v46 = &v59;
        uint64_t v47 = 0x3F847AE147AE147BLL;
        uint64_t v28 = [(PGSinglePersonWallpaperAssetSuggester *)self _sortedDedupedCandidatesFromCandidates:v41 progressBlock:v43];
        if (*((unsigned char *)v60 + 24))
        {
          int v15 = 1;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)double v64 = 98;
            *(_WORD *)&v64[4] = 2080;
            *(void *)&v64[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else
        {
          uint64_t v29 = v27;
          uint64_t v39 = mach_absolute_time();
          uint32_t v31 = v48.numer;
          uint32_t v30 = v48.denom;
          int v32 = v26;
          uint64_t v33 = v32;
          if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v33, OS_SIGNPOST_INTERVAL_END, v24, "PGSinglePersonWallpaperAssetSuggesterCandidateDeduping", "", buf, 2u);
          }

          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)double v64 = "PGSinglePersonWallpaperAssetSuggesterCandidateDeduping";
            *(_WORD *)&v64[8] = 2048;
            *(double *)&v64[10] = (float)((float)((float)((float)(v39 - v29) * (float)v31) / (float)v30) / 1000000.0);
            _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
          }
          uint64_t v34 = -[PGSinglePersonWallpaperAssetSuggester assetsFromCandidates:](self, "assetsFromCandidates:", v28, v39, context);
          mach_timebase_info v35 = [v34 objectEnumerator];
          suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
          self->_suggestedAssetEnumerator = v35;

          int v15 = 0;
          self->_numberOfSuggestedAssets = [v28 count];
        }
      }
    }

    if (v4)
    {
      if (!v15)
      {
        double v37 = CFAbsoluteTimeGetCurrent();
        if (v37 - v56[3] >= 0.01)
        {
          v56[3] = v37;
          LOBYTE(info.numer) = 0;
          (*((void (**)(id, mach_timebase_info *, double))v14 + 2))(v14, &info, 1.0);
          char v38 = *((unsigned char *)v60 + 24) | LOBYTE(info.numer);
          *((unsigned char *)v60 + 24) = v38;
          if (v38)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)double v64 = 105;
              *(_WORD *)&v64[4] = 2080;
              *(void *)&v64[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
              double v7 = MEMORY[0x1E4F14500];
              goto LABEL_42;
            }
          }
        }
      }
    }
  }
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
}

void __76__PGSinglePersonWallpaperAssetSuggester_computeSuggestedAssetsWithProgress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __76__PGSinglePersonWallpaperAssetSuggester_computeSuggestedAssetsWithProgress___block_invoke_236(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (unint64_t)expectedNumberOfSuggestedAssets
{
  return self->_numberOfSuggestedAssets;
}

- (id)nextSuggestedAsset
{
  return [(NSEnumerator *)self->_suggestedAssetEnumerator nextObject];
}

- (PGSinglePersonWallpaperAssetSuggester)initWithPersonLocalIdentifiers:(id)a3 curationContext:(id)a4 loggingConnection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PGSinglePersonWallpaperAssetSuggester;
  uint64_t v12 = [(PGSinglePersonWallpaperAssetSuggester *)&v19 init];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_personLocalIdentifiers, a3);
    objc_storeStrong((id *)&v13->_curationContext, a4);
    objc_storeStrong((id *)&v13->_loggingConnection, a5);
    id v14 = objc_alloc_init(PGSinglePersonWallpaperAssetSuggesterScoringContext);
    scoringContext = v13->_scoringContext;
    v13->_scoringContext = v14;

    uint64_t v16 = objc_alloc_init(PGSinglePersonWallpaperAssetSuggesterDistancingContext);
    distancingContext = v13->_distancingContext;
    v13->_distancingContext = v16;
  }
  return v13;
}

+ (BOOL)passesFilteringWithAsset:(id)a3 forTopWallpaperSuggestions:(BOOL)a4 curationContext:(id)a5 orientation:(int64_t)a6 reason:(id *)a7
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = [PGSinglePersonWallpaperAssetSuggesterFilteringContext alloc];
  if (a4) {
    uint64_t v15 = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)v14 initForTopPeopleInOrientation:a6];
  }
  else {
    uint64_t v15 = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)v14 initForPeopleInOrientation:a6];
  }
  uint64_t v16 = (void *)v15;
  double v17 = [v12 photoLibrary];
  id v18 = [v17 librarySpecificFetchOptions];
  [v18 setIncludedDetectionTypes:&unk_1F28D3EA0];
  [v18 setIncludeTorsoAndFaceDetectionData:1];
  objc_super v19 = [MEMORY[0x1E4F39050] fetchFacesInAsset:v12 options:v18];
  if ([v19 count] == 1)
  {
    uint64_t v57 = [v19 firstObject];
    if ([v57 detectionType] != 1)
    {
      char v26 = 0;
      if (a7) {
        *a7 = @"No Human Face";
      }
      goto LABEL_66;
    }
    PFDeviceScreenSize();
    double v22 = v20;
    double v23 = v21;
    id v53 = v13;
    id v54 = v12;
    double v51 = v19;
    unint64_t v52 = v17;
    id v50 = a7;
    if (v20 == 0.0 || v21 == 0.0 || v20 == *MEMORY[0x1E4F8A250] && v21 == *(double *)(MEMORY[0x1E4F8A250] + 8))
    {
      double v24 = 1.0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218496;
        *(double *)&uint8_t buf[4] = v22;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v23;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = 0x3FF0000000000000;
        _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "[Performance] %s: %f ms", buf, 0x20u);
      }
    }
    else
    {
      double v24 = fabs(v20 / v21);
    }
    uint64_t v55 = v16;
    [a1 prefilteringSubpredicatesWithContext:v16 forTargetAspectRatio:v24];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [obj countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v59;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v59 != v29) {
            objc_enumerationMutation(obj);
          }
          uint32_t v31 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          [v18 setInternalPredicate:v31];
          int v32 = (void *)MEMORY[0x1E4F39050];
          uint64_t v33 = [v57 localIdentifier];
          v71 = v33;
          uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
          mach_timebase_info v35 = [v32 fetchFacesWithLocalIdentifiers:v34 options:v18];
          int v36 = [v35 firstObject];

          if (!v36)
          {
            int v46 = objc_msgSend(v31, "pg_wallpaperSuggestionReason");
            uint64_t v47 = v46;
            if (v50) {
              *id v50 = v46;
            }
            id v13 = v53;
            id v12 = v54;
            uint64_t v16 = v55;
            double v37 = obj;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              mach_timebase_info v48 = [v57 uuid];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v48;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v47;
              *(_WORD *)&buf[22] = 2112;
              *(void *)&buf[24] = v31;
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Face %@ fails subpredicate '%@': %@", buf, 0x20u);
            }
            char v26 = 0;
            int v43 = obj;
            goto LABEL_65;
          }
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v58 objects:v72 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
    double v37 = obj;

    uint64_t v16 = v55;
    char v38 = [a1 prefilteringInternalPredicateWithContext:v55 forTargetAspectRatio:v24];
    [v18 setInternalPredicate:v38];

    uint64_t v39 = (void *)MEMORY[0x1E4F39050];
    int v40 = [v57 localIdentifier];
    v70 = v40;
    __int16 v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
    id v42 = [v39 fetchFacesWithLocalIdentifiers:v41 options:v18];
    int v43 = [v42 firstObject];

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v63 = 0u;
    memset(buf, 0, sizeof(buf));
    id v13 = v53;
    id v12 = v54;
    char v26 = [a1 candidateAsset:v54 andFace:v43 passesPostfilteringWithContext:v55 curationContext:v53 statistics:buf];
    if (v26)
    {
      id v44 = v50;
      if (v50)
      {
        __int16 v45 = @"Pass";
LABEL_64:
        void *v44 = v45;
      }
    }
    else
    {
      id v44 = v50;
      if (v50)
      {
        if (*(int *)buf <= 0)
        {
          if (*(int *)&buf[4] <= 0)
          {
            if (*(int *)&buf[8] <= 0)
            {
              if (*(int *)&buf[12] <= 0)
              {
                if (*(int *)&buf[16] <= 0)
                {
                  if (*(int *)&buf[20] <= 0)
                  {
                    if (*(int *)&buf[24] <= 0)
                    {
                      if (*(int *)&buf[28] <= 0)
                      {
                        if ((int)v63 <= 0)
                        {
                          if ((uint64_t)v63 <= 0)
                          {
                            if (*(uint64_t *)((char *)&v63 + 4) <= 0)
                            {
                              if (SHIDWORD(v63) <= 0) {
                                __int16 v45 = @"Unknown Reason";
                              }
                              else {
                                __int16 v45 = @"Sensitive Location";
                              }
                            }
                            else
                            {
                              __int16 v45 = @"Low Light";
                            }
                          }
                          else
                          {
                            __int16 v45 = @"Low Aesthetic&Wallpaper";
                          }
                        }
                        else
                        {
                          __int16 v45 = @"Not Safe for Display";
                        }
                      }
                      else
                      {
                        __int16 v45 = @"Low Crop Score";
                      }
                      uint64_t v16 = v55;
                      double v37 = obj;
                      id v44 = v50;
                    }
                    else
                    {
                      __int16 v45 = @"Low Resolution";
                    }
                  }
                  else
                  {
                    __int16 v45 = @"Clock Overlap";
                  }
                }
                else
                {
                  __int16 v45 = @"Low Face Quality";
                }
              }
              else
              {
                __int16 v45 = @"Low Wallpaper Score";
              }
            }
            else
            {
              __int16 v45 = @"Low Aesthetics";
            }
          }
          else
          {
            __int16 v45 = @"Avoid for Key Asset";
          }
        }
        else
        {
          __int16 v45 = @"Is Utility";
        }
        goto LABEL_64;
      }
    }
LABEL_65:

    objc_super v19 = v51;
    double v17 = v52;
LABEL_66:

    goto LABEL_67;
  }
  if (a7)
  {
    if ((unint64_t)[v19 count] <= 1) {
      int v25 = @"No Face";
    }
    else {
      int v25 = @"Too Many Faces";
    }
    char v26 = 0;
    *a7 = v25;
  }
  else
  {
    char v26 = 0;
  }
LABEL_67:

  return v26;
}

+ (BOOL)candidateAsset:(id)a3 andFace:(id)a4 passesPostfilteringWithContext:(id)a5 curationContext:(id)a6 statistics:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [v11 curationModel];
  uint64_t v16 = [v14 userFeedbackCalculator];

  LODWORD(v14) = [v15 isUtilityForMemoriesWithAsset:v11 userFeedbackCalculator:v16];
  if (v14)
  {
    BOOL v17 = 0;
    ++a7->var0;
  }
  else if ([v15 avoidIfPossibleForKeyAssetWithAsset:v11 statistics:&a7->var12])
  {
    BOOL v17 = 0;
    ++a7->var1;
  }
  else
  {
    id v18 = [v15 aestheticsModel];
    objc_super v19 = [v18 overallAestheticScoreNode];
    [v19 highPrecisionOperatingPoint];
    double v21 = v20;

    [v11 overallAestheticScore];
    if (v21 <= v22)
    {
      [v13 absoluteMinimumWallpaperScore];
      double v24 = v23;
      if (v23 < 0.0)
      {
        int v25 = [v15 wallpaperScoreModel];
        char v26 = [v25 minimumWallpaperScoreNode];
        [v26 operatingPoint];
        double v24 = v27;
      }
      uint64_t v28 = [v11 mediaAnalysisProperties];
      [v28 wallpaperScore];
      double v30 = v29;

      if (v24 <= v30)
      {
        char v31 = [v15 isAestheticallyPrettyGoodWithAsset:v11];
        [v13 minimumWallpaperScore];
        double v33 = v32;
        if (v32 < 0.0)
        {
          uint64_t v34 = [v15 wallpaperScoreModel];
          mach_timebase_info v35 = [v34 peopleNode];
          [v35 highPrecisionOperatingPoint];
          double v33 = v36;
        }
        double v37 = [v11 mediaAnalysisProperties];
        [v37 wallpaperScore];
        double v39 = v38;

        if (v33 <= v39) {
          char v40 = 1;
        }
        else {
          char v40 = v31;
        }
        if (v40)
        {
          [v13 minimumFaceQuality];
          double v42 = v41;
          if (v41 < 0.0)
          {
            double v42 = 0.5;
            if ((int)[v11 faceAnalysisVersion] >= 12)
            {
              int v43 = [v11 curationModel];
              id v44 = [v43 faceModel];
              __int16 v45 = [v44 qualityNode];
              [v45 highPrecisionOperatingPoint];
              double v42 = v46;
            }
          }
          if ((int)[v11 faceAnalysisVersion] < 12) {
            +[PGWallpaperSuggestionAssetGater sydneyMD4FaceQualityFromAsset:v11];
          }
          else {
            [v12 quality];
          }
          if (v47 >= v42)
          {
            if ([v13 bypassCropScoreCheck]) {
              goto LABEL_30;
            }
            char v66 = 0;
            double v65 = 1.0;
            objc_msgSend(MEMORY[0x1E4F8E858], "cropScoreWithAsset:classification:passesClockOverlap:cropZoomRatio:orientation:", v11, 1, &v66, &v65, objc_msgSend(v13, "orientation"));
            double v49 = v48;
            double v50 = v65;
            [v13 maximumCropZoomRatio];
            double v52 = v51;
            [v13 minimumCropScore];
            if (!v66) {
              goto LABEL_36;
            }
            if (v50 <= v52 && v49 >= v53)
            {
LABEL_30:
              if ([MEMORY[0x1E4F8E7A8] assetIsSafeForWidgetDisplay:v11])
              {
                [v13 maximumLowLightScore];
                double v55 = v54;
                if (v54 < 0.0)
                {
                  uint64_t v56 = [v11 curationModel];
                  uint64_t v57 = [v56 aestheticsModel];
                  long long v58 = [v57 lowLightNode];
                  [v58 operatingPoint];
                  double v55 = v59;
                }
                long long v60 = [v11 aestheticProperties];
                [v60 lowLight];
                double v62 = v61;

                if (v55 >= v62)
                {
                  if (+[PGSensitiveLocationBlocklistConfiguration isAssetAtSensitiveLocationAndDate:v11])
                  {
                    BOOL v17 = 0;
                    ++a7->var11;
                  }
                  else
                  {
                    BOOL v17 = 1;
                  }
                }
                else
                {
                  BOOL v17 = 0;
                  ++a7->var10;
                }
              }
              else
              {
                BOOL v17 = 0;
                ++a7->var8;
              }
            }
            else
            {
LABEL_36:
              if (v66)
              {
                if (v50 > v52) {
                  p_int var6 = &a7->var6;
                }
                else {
                  p_int var6 = &a7->var7;
                }
              }
              else
              {
                p_int var6 = &a7->var5;
              }
              BOOL v17 = 0;
              ++*p_var6;
            }
          }
          else
          {
            BOOL v17 = 0;
            ++a7->var4;
          }
        }
        else
        {
          BOOL v17 = 0;
          ++a7->var9;
        }
      }
      else
      {
        BOOL v17 = 0;
        ++a7->var3;
      }
    }
    else
    {
      BOOL v17 = 0;
      ++a7->var2;
    }
  }

  return v17;
}

+ (id)prefilteringInternalPredicateWithContext:(id)a3 forTargetAspectRatio:(double)a4
{
  id v4 = [a1 prefilteringSubpredicatesWithContext:a3 forTargetAspectRatio:a4];
  double v5 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];

  return v5;
}

+ (id)prefilteringSubpredicatesWithContext:(id)a3 forTargetAspectRatio:(double)a4
{
  v46[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v8 = (void *)MEMORY[0x1E4F28F60];
  [v6 maximumFaceRoll];
  double v10 = -v9;
  [v6 maximumFaceRoll];
  id v12 = objc_msgSend(v8, "predicateWithFormat:", @"%K >= %f AND %K <= %f", @"roll", *(void *)&v10, @"roll", v11);
  objc_msgSend(v12, "pg_setWallpaperSuggestionReason:", @"High Face Roll");
  __int16 v45 = v12;
  [v7 addObject:v12];
  if ([v6 requiresSmile])
  {
    id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K IN { %d, %d } AND %K != %d AND %K != %d) OR (%K == %d)", @"ageType", 1, 2, @"faceExpressionType", 3, @"faceExpressionType", 2, @"smileType", 2];
    objc_msgSend(v13, "pg_setWallpaperSuggestionReason:", @"Failed Face Expression");
    [v7 addObject:v13];
  }
  if ([v6 requiresNoBlink])
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"eyesState", 2);
    objc_msgSend(v14, "pg_setWallpaperSuggestionReason:", @"Closed Eyes");
    [v7 addObject:v14];
  }
  uint64_t v15 = (void *)MEMORY[0x1E4F28F60];
  if (a4 <= 1.0) {
    double v16 = a4;
  }
  else {
    double v16 = 1.0;
  }
  [v6 minimumFaceSize];
  uint64_t v18 = v17;
  [v6 maximumFaceSize];
  id v44 = [v15 predicateWithFormat:@"%K <= %K * %f AND %K BETWEEN { %f, %f }", @"sourceWidth", @"sourceHeight", *(void *)&v16, @"size", v18, v19];
  double v20 = (void *)MEMORY[0x1E4F28F60];
  [v6 minimumFaceSize];
  double v22 = v21 * a4;
  [v6 maximumFaceSize];
  double v24 = [v20 predicateWithFormat:@"%K >= %K * %f AND %K BETWEEN { %f, %f }", @"sourceWidth", @"sourceHeight", fmax(a4, 1.0), @"size", *(void *)&v22, v23 * a4];
  int v25 = (void *)MEMORY[0x1E4F28F60];
  [v6 minimumFaceSize];
  uint64_t v27 = v26;
  [v6 maximumFaceSize];
  float v29 = objc_msgSend(v25, "predicateWithFormat:", @"%K >= %K * %f AND %K < %K AND %K >= (%f * %K) / %K AND %K <= (%f * %K) / %K", @"sourceWidth", @"sourceHeight", *(void *)&a4, @"sourceWidth", @"sourceHeight", @"size", v27, @"sourceWidth", @"sourceHeight", @"size", v28, @"sourceWidth", @"sourceHeight");
  double v30 = (void *)MEMORY[0x1E4F28F60];
  [v6 minimumFaceSize];
  double v32 = v31 * a4;
  [v6 maximumFaceSize];
  uint64_t v34 = objc_msgSend(v30, "predicateWithFormat:", @"%K > %K AND %K <= %K * %f AND %K >= (%f * %K) / %K AND %K <= (%f * %K)  / %K", @"sourceWidth", @"sourceHeight", @"sourceWidth", @"sourceHeight", *(void *)&a4, @"size", *(void *)&v32, @"sourceHeight", @"sourceWidth", @"size", v33 * a4, @"sourceHeight", @"sourceWidth");
  mach_timebase_info v35 = (void *)MEMORY[0x1E4F28BA0];
  v46[0] = v44;
  v46[1] = v24;
  v46[2] = v29;
  v46[3] = v34;
  double v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
  double v37 = [v35 orPredicateWithSubpredicates:v36];

  objc_msgSend(v37, "pg_setWallpaperSuggestionReason:", @"Face Size Out of Range");
  [v7 addObject:v37];
  float v38 = [a1 _assetExpressionWithFilteringContext:v6];
  double v39 = (void *)MEMORY[0x1E4F28B98];
  char v40 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"%@.@count", v38];
  double v41 = [MEMORY[0x1E4F28C68] expressionForConstantValue:&unk_1F28D16B0];
  double v42 = [v39 predicateWithLeftExpression:v40 rightExpression:v41 modifier:0 type:5 options:0];

  objc_msgSend(v42, "pg_setWallpaperSuggestionReason:", @"Invalid Asset");
  [v7 addObject:v42];

  return v7;
}

+ (id)_assetExpressionWithFilteringContext:(id)a3
{
  v24[7] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v22 = a3;
  id v4 = [v3 alloc];
  double v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"$asset.%K == %d", @"kind", 0);
  v24[0] = v5;
  id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"$asset.%K != %d", @"kindSubtype", 10);
  v24[1] = v6;
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"$asset.%K != %d", @"kindSubtype", 1);
  v24[2] = v7;
  double v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT ($asset.%K IN %@)", @"playbackStyle", &unk_1F28D3E88];
  v24[3] = v8;
  double v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY($asset.%K, $face, $face != NIL).@count == %d", @"detectedFaces", 1];
  v24[4] = v9;
  double v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"$asset.%K == NO AND $asset.%K == %d", @"hidden", @"trashedState", 0);
  v24[5] = v10;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"$asset.%K >= %d", @"additionalAttributes.sceneAnalysisVersion", 77);
  v24[6] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:7];
  id v13 = (void *)[v4 initWithArray:v12];

  LODWORD(v5) = [v22 styleableFilter];
  if (v5)
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"$asset.%K > %d", @"currentSleetCast", 0);
    v23[0] = v14;
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"$asset.%K > 0", @"additionalAttributes.sleetIsReversible");
    v23[1] = v15;
    double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    [v13 addObjectsFromArray:v16];
  }
  uint64_t v17 = (void *)MEMORY[0x1E4F28C68];
  uint64_t v18 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"assetForFace"];
  uint64_t v19 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];
  double v20 = [v17 expressionForSubquery:v18 usingIteratorVariable:@"asset" predicate:v19];

  return v20;
}

@end