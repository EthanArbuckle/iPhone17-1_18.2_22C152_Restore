@interface PGPetWallpaperSuggester
+ (BOOL)candidate:(id)a3 passesFilteringWithContext:(id)a4 curationContext:(id)a5 thresholdHelper:(id)a6 statistics:(id *)a7;
+ (BOOL)filtersForTopSuggestions;
+ (BOOL)passesFilteringWithAsset:(id)a3 curationContext:(id)a4 orientation:(int64_t)a5 reason:(id *)a6;
+ (id)prefilteringInternalPredicateWithContext:(id)a3;
+ (id)suggestionSubtypes;
+ (id)suggestionTypes;
- (PGPetWallpaperSuggester)initWithSession:(id)a3;
- (PGPetWallpaperSuggesterFilteringContext)primaryFilteringContext;
- (PGPetWallpaperSuggesterFilteringContext)secondaryFilteringContext;
- (id)candidatesForPet:(id)a3;
- (id)fetchPets;
- (id)rankedAndDedupedCandidatesFromCandidates:(id)a3;
- (id)sortedCandidatesByPetLocalIdentifierFromPets:(id)a3 progressReporter:(id)a4;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
- (void)logPosterFilteringStatistics:(id *)a3;
- (void)setPrimaryFilteringContext:(id)a3;
- (void)setSecondaryFilteringContext:(id)a3;
- (void)setupFilteringContexts;
@end

@implementation PGPetWallpaperSuggester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_primaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_peopleSceneConfidenceThresholdHelper, 0);
  objc_storeStrong((id *)&self->_assetGater, 0);
}

- (void)setSecondaryFilteringContext:(id)a3
{
}

- (PGPetWallpaperSuggesterFilteringContext)secondaryFilteringContext
{
  return self->_secondaryFilteringContext;
}

- (void)setPrimaryFilteringContext:(id)a3
{
}

- (PGPetWallpaperSuggesterFilteringContext)primaryFilteringContext
{
  return self->_primaryFilteringContext;
}

- (id)rankedAndDedupedCandidatesFromCandidates:(id)a3
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
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PGPetWallpaperRankAndDedupeForPet", "", buf, 2u);
  }
  os_signpost_id_t spid = v6;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v40 = mach_absolute_time();
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F8A780]) initWithDistanceBlock:&__block_literal_global];
  [(PGPetWallpaperSuggesterFilteringContext *)self->_primaryFilteringContext timeIntervalForCandidateDeduping];
  objc_msgSend(v9, "setMaximumDistance:");
  [v9 setMinimumNumberOfObjects:1];
  v43 = v9;
  v45 = v4;
  v10 = [v9 performWithDataset:v4 progressBlock:&__block_literal_global_422];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = v8;
    uint64_t v12 = [v10 count];
    *(_DWORD *)buf = 134217984;
    v62 = (const char *)v12;
    _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Deduped to %lu clusters", buf, 0xCu);
  }
  v41 = v8;
  v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.favorite" ascending:0];
  v67[0] = v13;
  v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.mediaAnalysisProperties.wallpaperScore" ascending:0];
  v67[1] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F8E880], "cropScoreSortDescriptorForOrientation:", -[PGPetWallpaperSuggesterFilteringContext orientation](self->_primaryFilteringContext, "orientation"));
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
    _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] %lu ranked candidates after deduped.", buf, 0xCu);
  }

  uint64_t v33 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v36 = v31;
  v37 = v36;
  if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v37, OS_SIGNPOST_INTERVAL_END, spid, "PGPetWallpaperRankAndDedupeForPet", "", buf, 2u);
  }

  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v62 = "PGPetWallpaperRankAndDedupeForPet";
    __int16 v63 = 2048;
    double v64 = (float)((float)((float)((float)(v33 - v40) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v46;
}

double __68__PGPetWallpaperSuggester_rankedAndDedupedCandidatesFromCandidates___block_invoke(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl(&dword_1D1805000, v5, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Filtered out %d for isUtility, %d for avoidForKeyAsset, %d for aesthetics, %d for wallpaper score, %d for clock overlap, %d for low resolution, %d for crop score, %d for not safe for display, %d for positive people scene, %d for low light, %d for sensitive location", (uint8_t *)v17, 0x44u);
  }
}

- (id)candidatesForPet:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PGAbstractSuggester *)self session];
  os_signpost_id_t v6 = [v5 photoLibrary];
  long long v59 = [v5 curationContext];
  v7 = [v5 loggingConnection];
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  double v9 = v7;
  double v10 = v9;
  unint64_t v50 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PGPetWallpaperFindCandidateForPet", "", buf, 2u);
  }
  os_signpost_id_t spid = v8;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v49 = mach_absolute_time();
  long long v53 = v6;
  v11 = [v6 librarySpecificFetchOptions];
  [v11 setIncludedDetectionTypes:&unk_1F28D38A0];
  uint64_t v12 = objc_opt_class();
  v13 = [(PGPetWallpaperSuggester *)self primaryFilteringContext];
  v14 = [v12 prefilteringInternalPredicateWithContext:v13];
  [v11 setInternalPredicate:v14];

  long long v52 = v11;
  v15 = [MEMORY[0x1E4F39050] fetchFacesForPerson:v4 options:v11];
  v16 = v10;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [v15 count];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v17;
    _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Found %lu faces.", buf, 0xCu);
  }
  long long v55 = v4;

  uint64_t v51 = +[PGWallpaperSuggestionUtilities assetFetchPropertySetsIncludingGating:](PGWallpaperSuggestionUtilities, "assetFetchPropertySetsIncludingGating:", [(id)objc_opt_class() filtersForTopSuggestions]);
  __int16 v18 = objc_msgSend(MEMORY[0x1E4F38EB8], "fetchAssetsGroupedByFaceUUIDForFaces:fetchPropertySets:", v15);
  int v19 = (void *)MEMORY[0x1E4F38EB8];
  __int16 v20 = [v18 allValues];
  [v19 prefetchOnAssets:v20 options:14 curationContext:v59];

  int v21 = v16;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = [v18 count];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v22;
    _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Found %lu assets.", buf, 0xCu);
  }
  long long v57 = v21;

  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v54 = v5;
  int v23 = [v5 forbiddenAssetUUIDs];
  long long v88 = 0u;
  memset(v89, 0, 28);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  *(_OWORD *)buf = 0u;
  long long v83 = 0u;
  long long v71 = 0u;
  memset(v72, 0, 28);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v15;
  uint64_t v24 = [obj countByEnumeratingWithState:&v61 objects:v81 count:16];
  long long v58 = v23;
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v62 != v26) {
          objc_enumerationMutation(obj);
        }
        __int16 v28 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        int v29 = [v28 uuid];
        __int16 v30 = [v18 objectForKeyedSubscript:v29];

        if (v30)
        {
          int v31 = [v30 uuid];
          int v32 = [v23 containsObject:v31];

          if (v32)
          {
            int v33 = v57;
            if (os_log_type_enabled(&v33->super, OS_LOG_TYPE_INFO))
            {
              __int16 v34 = [v30 uuid];
              *(_DWORD *)v74 = 138412290;
              *(void *)&v74[4] = v34;
              _os_log_impl(&dword_1D1805000, &v33->super, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Avoiding asset %@ because it has been rejected by the user", v74, 0xCu);
            }
          }
          else
          {
            int v33 = [[PGPetWallpaperSuggestionCandidate alloc] initWithFace:v28 inAsset:v30];
            int v35 = objc_opt_class();
            __int16 v36 = [(PGPetWallpaperSuggester *)self primaryFilteringContext];
            LODWORD(v35) = [v35 candidate:v33 passesFilteringWithContext:v36 curationContext:v59 thresholdHelper:self->_peopleSceneConfidenceThresholdHelper statistics:buf];

            if (v35)
            {
              if (!self->_secondaryFilteringContext
                || (int v37 = objc_opt_class(),
                    [(PGPetWallpaperSuggester *)self secondaryFilteringContext],
                    uint64_t v38 = objc_claimAutoreleasedReturnValue(),
                    LODWORD(v37) = [v37 candidate:v33 passesFilteringWithContext:v38 curationContext:v59 thresholdHelper:self->_peopleSceneConfidenceThresholdHelper statistics:&v65], v38, v37))
              {
                [v56 addObject:v33];
              }
            }
            int v23 = v58;
          }
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v61 objects:v81 count:16];
    }
    while (v25);
  }

  uint64_t v39 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  unint64_t v42 = v57;
  v43 = v42;
  if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    *(_WORD *)v74 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v43, OS_SIGNPOST_INTERVAL_END, spid, "PGPetWallpaperFindCandidateForPet", "", v74, 2u);
  }

  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v74 = 136315394;
    *(void *)&v74[4] = "PGPetWallpaperFindCandidateForPet";
    *(_WORD *)&v74[12] = 2048;
    *(double *)&v74[14] = (float)((float)((float)((float)(v39 - v49) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v43, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v74, 0x16u);
  }
  v44 = v43;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    int v45 = [v56 count];
    id v46 = [v55 localIdentifier];
    *(_DWORD *)v74 = 67109378;
    *(_DWORD *)&v74[4] = v45;
    *(_WORD *)&v74[8] = 2112;
    *(void *)&v74[10] = v46;
    _os_log_impl(&dword_1D1805000, v44, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Found %d candidates after postfiltering for Pet %@", v74, 0x12u);
  }
  long long v79 = v88;
  v80[0] = v89[0];
  *(_OWORD *)((char *)v80 + 12) = *(_OWORD *)((char *)v89 + 12);
  long long v75 = v84;
  long long v76 = v85;
  long long v77 = v86;
  long long v78 = v87;
  *(_OWORD *)v74 = *(_OWORD *)buf;
  *(_OWORD *)&v74[16] = v83;
  [(PGPetWallpaperSuggester *)self logPosterFilteringStatistics:v74];
  if (self->_secondaryFilteringContext)
  {
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v74 = 0;
      _os_log_impl(&dword_1D1805000, v44, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Secondary filtering...", v74, 2u);
    }
    long long v79 = v71;
    v80[0] = v72[0];
    *(_OWORD *)((char *)v80 + 12) = *(_OWORD *)((char *)v72 + 12);
    long long v75 = v67;
    long long v76 = v68;
    long long v77 = v69;
    long long v78 = v70;
    *(_OWORD *)v74 = v65;
    *(_OWORD *)&v74[16] = v66;
    [(PGPetWallpaperSuggester *)self logPosterFilteringStatistics:v74];
  }
  if (*(int *)&buf[4] >= 1) {
    [MEMORY[0x1E4F8E770] logInfo:v44 prefix:@"[PGPetWallpaperSuggester]" avoidForKeyAssetStatistics:(char *)&v84 + 12];
  }

  return v56;
}

- (id)sortedCandidatesByPetLocalIdentifierFromPets:(id)a3 progressReporter:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v47 = 230;
      *(_WORD *)&v47[4] = 2080;
      *(void *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Autobahn/PGPetWallpaperSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v8 = (id)MEMORY[0x1E4F1CC08];
  }
  else
  {
    uint64_t v38 = v7;
    int v37 = [(PGAbstractSuggester *)self session];
    double v9 = [v37 loggingConnection];
    os_signpost_id_t v10 = os_signpost_id_generate(v9);
    v11 = v9;
    uint64_t v12 = v11;
    unint64_t v36 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGPetWallpaperSuggesterFindCandidateForAllPets", "", buf, 2u);
    }
    os_signpost_id_t spid = v10;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v35 = mach_absolute_time();
    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v39 = v6;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v42;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v13);
          }
          __int16 v18 = *(void **)(*((void *)&v41 + 1) + 8 * v17);
          int v19 = (void *)MEMORY[0x1D25FED50](v14);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            __int16 v20 = v12;
            int v21 = objc_msgSend(v18, "uuid", spid);
            *(_DWORD *)buf = 138412290;
            *(void *)v47 = v21;
            _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Finding candidates for Pet %@", buf, 0xCu);
          }
          uint64_t v22 = -[PGPetWallpaperSuggester candidatesForPet:](self, "candidatesForPet:", v18, spid);
          int v23 = [(PGPetWallpaperSuggester *)self rankedAndDedupedCandidatesFromCandidates:v22];
          if ([v22 count])
          {
            uint64_t v24 = [v18 localIdentifier];
            [v40 setObject:v23 forKeyedSubscript:v24];

            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              uint64_t v25 = v12;
              uint64_t v26 = [v22 count];
              *(_DWORD *)buf = 134217984;
              *(void *)v47 = v26;
              _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Found %lu candidates.", buf, 0xCu);
            }
          }

          ++v17;
        }
        while (v15 != v17);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v48 count:16];
        uint64_t v15 = v14;
      }
      while (v14);
    }

    id v7 = v38;
    if ([v38 isCancelledWithProgress:1.0])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v47 = 249;
        *(_WORD *)&v47[4] = 2080;
        *(void *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Autobahn/PGPetWallpaperSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v8 = (id)MEMORY[0x1E4F1CC08];
      id v6 = v39;
      int v27 = v40;
    }
    else
    {
      uint64_t v28 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      int v31 = v12;
      int v32 = v31;
      if (v36 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v32, OS_SIGNPOST_INTERVAL_END, spid, "PGPetWallpaperSuggesterFindCandidateForAllPets", "", buf, 2u);
      }

      int v27 = v40;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)v47 = "PGPetWallpaperSuggesterFindCandidateForAllPets";
        *(_WORD *)&v47[8] = 2048;
        *(double *)&v47[10] = (float)((float)((float)((float)(v28 - v35) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      id v8 = v40;
      id v6 = v39;
    }
  }
  return v8;
}

- (id)fetchPets
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [(PGAbstractSuggester *)self session];
  v3 = [v2 loggingConnection];
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  v5 = v3;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PGPetWallpaperSuggesterFetchPets", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v7 = mach_absolute_time();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Fetching inferred user's pets and user-verified pets... (Pets Parity enabled)", buf, 2u);
  }
  id v8 = [v2 workingContext];
  double v9 = [v2 curationContext];
  os_signpost_id_t v10 = +[PGGraphPetIdentityProcessor fetchInterestingEligiblePetsForWallpaperWithWorkingContext:v8 curationContext:v9];

  uint64_t v11 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v14 = v6;
  uint64_t v15 = v14;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_END, v4, "PGPetWallpaperSuggesterFetchPets", "", buf, 2u);
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v21 = "PGPetWallpaperSuggesterFetchPets";
    __int16 v22 = 2048;
    double v23 = (float)((float)((float)((float)(v11 - v7) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  uint64_t v16 = v15;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [v10 count];
    *(_DWORD *)buf = 134217984;
    int v21 = (const char *)v17;
    _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Found %lu pets", buf, 0xCu);
  }

  return v10;
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:v7];
  uint64_t v54 = 0;
  long long v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  int v9 = [v8 isCancelledWithProgress:0.0];
  *((unsigned char *)v55 + 24) = v9;
  if (!v9)
  {
    uint64_t v11 = [(PGAbstractSuggester *)self session];
    uint64_t v12 = [v11 loggingConnection];
    uint64_t v13 = [v6 maximumNumberOfSuggestions];
    uint64_t v14 = v12;
    os_signpost_id_t v15 = os_signpost_id_generate(v14);
    uint64_t v16 = v14;
    uint64_t v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PGPetWallpaperSuggester", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v41 = mach_absolute_time();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)long long v59 = v13;
      _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Starting to generate %d suggestions.", buf, 8u);
    }
    __int16 v18 = [(PGPetWallpaperSuggester *)self fetchPets];
    if (*((unsigned char *)v55 + 24))
    {
      *((unsigned char *)v55 + 24) = 1;
LABEL_13:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)long long v59 = 101;
        *(_WORD *)&v59[4] = 2080;
        *(void *)&v59[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Autobahn/PGPetWallpaperSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v10 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_16;
    }
    char v19 = [v8 isCancelledWithProgress:0.2];
    *((unsigned char *)v55 + 24) = v19;
    if (v19) {
      goto LABEL_13;
    }
    id v39 = [v8 childProgressReporterFromStart:0.2 toEnd:0.79];
    id v40 = -[PGPetWallpaperSuggester sortedCandidatesByPetLocalIdentifierFromPets:progressReporter:](self, "sortedCandidatesByPetLocalIdentifierFromPets:progressReporter:", v18);
    if (*((unsigned char *)v55 + 24))
    {
      *((unsigned char *)v55 + 24) = 1;
LABEL_23:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)long long v59 = 106;
        *(_WORD *)&v59[4] = 2080;
        *(void *)&v59[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Autobahn/PGPetWallpaperSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v10 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_26;
    }
    char v21 = [v8 isCancelledWithProgress:0.8];
    *((unsigned char *)v55 + 24) = v21;
    if (v21) {
      goto LABEL_23;
    }
    id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v36 = [(id)objc_opt_class() suggestionTypes];
    __int16 v33 = [v36 firstIndex];

    int v37 = [(id)objc_opt_class() suggestionSubtypes];
    __int16 v32 = [v37 firstIndex];

    BOOL v22 = self->_assetGater == 0;
    uint64_t v23 = 5;
    if (!self->_assetGater) {
      uint64_t v23 = 0;
    }
    uint64_t v24 = 2 * v13;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __59__PGPetWallpaperSuggester_suggestionsWithOptions_progress___block_invoke;
    v42[3] = &unk_1E68E4860;
    if (v22) {
      uint64_t v24 = 0;
    }
    uint64_t v48 = v13;
    uint64_t v49 = v23;
    uint64_t v50 = v24;
    uint64_t v38 = v17;
    long long v43 = v38;
    v47 = &v54;
    id v25 = v8;
    __int16 v51 = v33;
    __int16 v52 = v32;
    id v44 = v25;
    int v45 = self;
    id v26 = v34;
    id v46 = v26;
    [v40 enumerateKeysAndObjectsUsingBlock:v42];
    if (*((unsigned char *)v55 + 24))
    {
      *((unsigned char *)v55 + 24) = 1;
    }
    else
    {
      char v27 = [v25 isCancelledWithProgress:1.0];
      *((unsigned char *)v55 + 24) = v27;
      if ((v27 & 1) == 0)
      {
        uint64_t v35 = mach_absolute_time();
        uint32_t numer = info.numer;
        uint32_t denom = info.denom;
        __int16 v30 = v38;
        int v31 = v30;
        if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v31, OS_SIGNPOST_INTERVAL_END, v15, "PGPetWallpaperSuggester", "", buf, 2u);
        }

        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)long long v59 = "PGPetWallpaperSuggester";
          *(_WORD *)&v59[8] = 2048;
          *(double *)&v59[10] = (float)((float)((float)((float)(v35 - v41) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        id v10 = v26;
        goto LABEL_37;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)long long v59 = 210;
      *(_WORD *)&v59[4] = 2080;
      *(void *)&v59[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Autobahn/PGPetWallpaperSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v10 = (id)MEMORY[0x1E4F1CBF0];
LABEL_37:

LABEL_26:
LABEL_16:

    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)long long v59 = 90;
    *(_WORD *)&v59[4] = 2080;
    *(void *)&v59[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/Suggesters/Autobahn/PGPetWallpaperSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v10 = (id)MEMORY[0x1E4F1CBF0];
LABEL_17:
  _Block_object_dispose(&v54, 8);

  return v10;
}

void __59__PGPetWallpaperSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v75 = a2;
  id v7 = a3;
  long long v71 = [[PGWallpaperSuggestionAccumulator alloc] initWithTargetNumberOfSuggestions:*(void *)(a1 + 72) targetMinimumNumberOfGatedSuggestions:*(void *)(a1 + 80) maximumNumberOfSuggestionsToTryForGating:*(void *)(a1 + 88) loggingConnection:*(void *)(a1 + 32)];
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  v74 = [v8 dateByAddingTimeInterval:480.0];
  int v9 = [v7 count];
  id v10 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = NSNumber;
    uint64_t v12 = v10;
    uint64_t v13 = [v11 numberWithDouble:480.0];
    int buf = 67109890;
    LODWORD(v83[0]) = v9;
    WORD2(v83[0]) = 2112;
    *(void *)((char *)v83 + 6) = v8;
    HIWORD(v83[1]) = 2112;
    v83[2] = v13;
    LOWORD(v84[0]) = 2112;
    *(void *)((char *)v84 + 2) = v74;
    _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Start processing %d candidates. StartingDate: %@, MaxProcessingTime: %@s, MaxProcessingDate: %@", (uint8_t *)&buf, 0x26u);
  }
  long long v68 = v8;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = v7;
  uint64_t v72 = [obj countByEnumeratingWithState:&v77 objects:v81 count:16];
  if (!v72)
  {
    uint64_t v67 = 0;
    uint64_t v69 = 0;
    int v15 = 0;
    LODWORD(v16) = 0;
    goto LABEL_54;
  }
  long long v66 = a4;
  uint64_t v67 = 0;
  unint64_t v14 = 0;
  uint64_t v69 = 0;
  int v15 = 0;
  uint64_t v16 = 0;
  uint64_t v73 = *(void *)v78;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v78 != v73) {
        objc_enumerationMutation(obj);
      }
      __int16 v18 = *(void **)(*((void *)&v77 + 1) + 8 * v17);
      uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
      if (*(unsigned char *)(v19 + 24))
      {
        char v20 = 1;
      }
      else
      {
        char v20 = [*(id *)(a1 + 40) isCancelledWithProgress:0.85];
        uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
      }
      *(unsigned char *)(v19 + 24) = v20;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        *long long v66 = 1;
        __int16 v52 = obj;
        long long v53 = v68;
        goto LABEL_62;
      }
      char v21 = [PGPetWallpaperSuggestion alloc];
      uint64_t v22 = *(unsigned __int16 *)(a1 + 96);
      uint64_t v23 = *(unsigned __int16 *)(a1 + 98);
      uint64_t v24 = [v18 asset];
      id v25 = [(PGPetWallpaperSuggestion *)v21 initWithPetLocalIdentifier:v75 type:v22 subtype:v23 asset:v24];

      char v76 = 1;
      if (!*(void *)(*(void *)(a1 + 48) + 48))
      {
        ++v16;
LABEL_22:
        uint64_t v36 = 1;
        goto LABEL_28;
      }
      id v26 = [v18 asset];
      BOOL v27 = +[PGSettlingEffectWallpaperSuggesterFilteringContext shouldRunSettlingEffectForAsset:v26 subtype:603];

      [*(id *)(*(void *)(a1 + 48) + 48) setEnableSettlingEffect:v27];
      uint64_t v28 = *(void **)(*(void *)(a1 + 48) + 48);
      int v29 = [v18 asset];
      __int16 v30 = [v28 gateAsset:v29 hasPetFace:&v76];

      -[PGSingleAssetSuggestion setAvailableFeatures:](v25, "setAvailableFeatures:", [v30 availableFeatures]);
      int v31 = [v30 passesAnyGating];
      v14 += [v30 didTimeout];

      ++v16;
      if (!v76 || (v31 & 1) != 0)
      {
        if (v76) {
          int v35 = v31;
        }
        else {
          int v35 = 0;
        }
        if (v35 != 1)
        {
          if (!v76)
          {
LABEL_42:
            LODWORD(v69) = v69 + 1;
            uint64_t v49 = @"no pet face";
            goto LABEL_43;
          }
LABEL_41:
          ++HIDWORD(v69);
          uint64_t v49 = @"clock overlap";
          goto LABEL_43;
        }
        goto LABEL_22;
      }
      __int16 v32 = [v18 cropResult];
      __int16 v33 = objc_msgSend(v32, "cropForOrientation:", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 64), "orientation"));

      if ([*(id *)(*(void *)(a1 + 48) + 64) ignoreClockOverlap]) {
        int v34 = 1;
      }
      else {
        int v34 = [v33 passesClockOverlap];
      }
      objc_msgSend(v33, "cropZoomRatio", v66);
      double v38 = v37;
      [*(id *)(*(void *)(a1 + 48) + 64) maximumCropZoomRatio];
      double v40 = v39;
      [v33 cropScore];
      double v42 = v41;
      [*(id *)(*(void *)(a1 + 48) + 64) minimumCropScore];
      double v44 = v43;

      if (!v34 || v38 > v40 || v42 < v44)
      {
        if (!v76) {
          goto LABEL_42;
        }
        if (v34)
        {
          if (v38 > v40)
          {
            LODWORD(v67) = v67 + 1;
            uint64_t v49 = @"low resolution";
          }
          else
          {
            ++HIDWORD(v67);
            uint64_t v49 = @"low cropScore";
          }
LABEL_43:
          uint64_t v50 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            int buf = 138412290;
            v83[0] = v49;
            _os_log_impl(&dword_1D1805000, v50, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Rejecting non-gated suggestion because of %@.", (uint8_t *)&buf, 0xCu);
          }
          goto LABEL_29;
        }
        goto LABEL_41;
      }
      uint64_t v36 = 0;
LABEL_28:
      -[PGWallpaperSuggestionAccumulator addSuggestion:passingGating:](v71, "addSuggestion:passingGating:", v25, v36, v66);
      ++v15;
      if ([(PGWallpaperSuggestionAccumulator *)v71 accumulationIsComplete]) {
        goto LABEL_53;
      }
LABEL_29:
      int v45 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v66);
      [v74 timeIntervalSinceDate:v45];
      double v47 = v46;
      uint64_t v48 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        int buf = 67109632;
        LODWORD(v83[0]) = v16;
        WORD2(v83[0]) = 1024;
        *(_DWORD *)((char *)v83 + 6) = v15;
        WORD1(v83[1]) = 2048;
        *(double *)((char *)&v83[1] + 4) = v47;
        _os_log_impl(&dword_1D1805000, v48, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Tried %d candidates. %d passed. %.3fs processing time left.", (uint8_t *)&buf, 0x18u);
      }
      if (v14 > 1 || v47 < 0.0)
      {
        uint64_t v54 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          int buf = 67109632;
          LODWORD(v83[0]) = v14;
          WORD2(v83[0]) = 1024;
          *(_DWORD *)((char *)v83 + 6) = 1;
          WORD1(v83[1]) = 2048;
          *(double *)((char *)&v83[1] + 4) = v47;
          _os_log_impl(&dword_1D1805000, v54, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Reached (%d/%d) timeouts allowed. %.3fs processing time left.", (uint8_t *)&buf, 0x18u);
        }

LABEL_53:
        goto LABEL_54;
      }

      ++v17;
    }
    while (v72 != v17);
    uint64_t v51 = [obj countByEnumeratingWithState:&v77 objects:v81 count:16];
    uint64_t v72 = v51;
  }
  while (v51);
LABEL_54:

  __int16 v52 = [(PGWallpaperSuggestionAccumulator *)v71 suggestions];
  [*(id *)(a1 + 56) addObjectsFromArray:v52];
  uint64_t v55 = *(void *)(*(void *)(a1 + 48) + 48);
  uint64_t v56 = *(NSObject **)(a1 + 32);
  BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_INFO);
  if (v55)
  {
    long long v53 = v68;
    if (v57)
    {
      long long v58 = v56;
      int v59 = [v52 count];
      int v60 = [(PGWallpaperSuggestionAccumulator *)v71 numberOfGatedSuggestions];
      int buf = 67109634;
      LODWORD(v83[0]) = v59;
      WORD2(v83[0]) = 1024;
      *(_DWORD *)((char *)v83 + 6) = v60;
      WORD1(v83[1]) = 2112;
      *(void *)((char *)&v83[1] + 4) = v75;
      long long v61 = "[PGPetWallpaperSuggester] Generated %d suggestions (%d gated) for pet %@";
      long long v62 = v58;
      uint32_t v63 = 24;
      goto LABEL_59;
    }
  }
  else
  {
    long long v53 = v68;
    if (v57)
    {
      long long v58 = v56;
      int v64 = [v52 count];
      int buf = 67109378;
      LODWORD(v83[0]) = v64;
      WORD2(v83[0]) = 2112;
      *(void *)((char *)v83 + 6) = v75;
      long long v61 = "[PGPetWallpaperSuggester] Generated %d suggestions for pet %@";
      long long v62 = v58;
      uint32_t v63 = 18;
LABEL_59:
      _os_log_impl(&dword_1D1805000, v62, OS_LOG_TYPE_INFO, v61, (uint8_t *)&buf, v63);
    }
  }
  long long v65 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    int buf = 67110400;
    LODWORD(v83[0]) = v16;
    WORD2(v83[0]) = 1024;
    *(_DWORD *)((char *)v83 + 6) = v15;
    WORD1(v83[1]) = 1024;
    HIDWORD(v83[1]) = v69;
    LOWORD(v83[2]) = 1024;
    *(_DWORD *)((char *)&v83[2] + 2) = HIDWORD(v69);
    HIWORD(v83[2]) = 1024;
    v84[0] = v67;
    LOWORD(v84[1]) = 1024;
    *(_DWORD *)((char *)&v84[1] + 2) = HIDWORD(v67);
    _os_log_impl(&dword_1D1805000, v65, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Tried %d assets, %d passed, rejected %d for no pet face, %d for clock overlap, %d for low resolution, %d for low crop score.", (uint8_t *)&buf, 0x26u);
  }
LABEL_62:
}

- (void)setupFilteringContexts
{
  v2 = self;
  v3 = (objc_class *)objc_opt_class();
  if (!v2)
  {
    NSStringFromClass(v3);
    objc_claimAutoreleasedReturnValue();
LABEL_11:
    unint64_t v14 = (PGPetWallpaperSuggester *)_PFAssertFailHandler();
    [(PGPetWallpaperSuggester *)v14 initWithSession:v16];
    return;
  }
  if (([(PGPetWallpaperSuggester *)v2 isMemberOfClass:v3] & 1) == 0)
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    objc_claimAutoreleasedReturnValue();
    uint64_t v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }

  int IsIPad = PLPhysicalDeviceIsIPad();
  v5 = [PGPetWallpaperSuggesterFilteringContext alloc];
  if (IsIPad)
  {
    uint64_t v6 = [(PGPetWallpaperSuggesterFilteringContext *)v5 initForPetsInOrientation:2];
    primaryFilteringContext = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGPetWallpaperSuggesterFilteringContext *)v6;

    id v8 = [[PGPetWallpaperSuggesterFilteringContext alloc] initForPetsInOrientation:1];
    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = v8;
  }
  else
  {
    uint64_t v10 = [(PGPetWallpaperSuggesterFilteringContext *)v5 initForPetsInOrientation:1];
    uint64_t v11 = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGPetWallpaperSuggesterFilteringContext *)v10;

    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = 0;
  }
}

- (PGPetWallpaperSuggester)initWithSession:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGPetWallpaperSuggester;
  v5 = [(PGAbstractSuggester *)&v13 initWithSession:v4];
  if (v5)
  {
    if ([(id)objc_opt_class() filtersForTopSuggestions])
    {
      uint64_t v6 = [PGWallpaperSuggestionAssetGater alloc];
      id v7 = [v4 loggingConnection];
      uint64_t v8 = [(PGWallpaperSuggestionAssetGater *)v6 initWithType:2 loggingConnection:v7];
      assetGater = v5->_assetGater;
      v5->_assetGater = (PGWallpaperSuggestionAssetGater *)v8;
    }
    uint64_t v10 = +[PGWallpaperSuggestionUtilities peopleSceneConfidenceThresholdHelper];
    peopleSceneConfidenceThresholdHelper = v5->_peopleSceneConfidenceThresholdHelper;
    v5->_peopleSceneConfidenceThresholdHelper = (CLSSceneConfidenceThresholdHelper *)v10;

    [(PGPetWallpaperSuggester *)v5 setupFilteringContexts];
  }

  return v5;
}

+ (BOOL)passesFilteringWithAsset:(id)a3 curationContext:(id)a4 orientation:(int64_t)a5 reason:(id *)a6
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v10 photoLibrary];
  objc_super v13 = [v12 librarySpecificFetchOptions];
  [v13 setIncludedDetectionTypes:&unk_1F28D38D0];
  unint64_t v14 = [MEMORY[0x1E4F39050] fetchFacesInAsset:v10 options:v13];
  if ([v14 count] == 1)
  {
    SEL v15 = [v14 firstObject];
    if ((unsigned __int16)([v15 detectionType] - 5) <= 0xFFFCu)
    {
      BOOL v16 = 0;
      if (a6) {
        *a6 = @"No Pet Found";
      }
      goto LABEL_65;
    }
    uint64_t v51 = a6;
    long long v53 = v15;
    int v18 = [(id)objc_opt_class() filtersForTopSuggestions];
    uint64_t v19 = [PGPetWallpaperSuggesterFilteringContext alloc];
    int v48 = v18;
    id v50 = v11;
    int64_t v45 = a5;
    if (v18) {
      uint64_t v20 = [(PGPetWallpaperSuggesterFilteringContext *)v19 initForTopPetsInOrientation:a5];
    }
    else {
      uint64_t v20 = [(PGPetWallpaperSuggesterFilteringContext *)v19 initForPetsInOrientation:a5];
    }
    char v21 = (void *)v20;
    uint64_t v22 = [a1 prefilteringInternalPredicateWithContext:v20];
    [v13 setInternalPredicate:v22];

    uint64_t v23 = (void *)MEMORY[0x1E4F39050];
    uint64_t v24 = [v15 localIdentifier];
    v63[0] = v24;
    id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
    id v26 = [v23 fetchFacesWithLocalIdentifiers:v25 options:v13];
    BOOL v27 = [v26 firstObject];

    __int16 v52 = v21;
    if (!v27)
    {
      id v11 = v50;
      BOOL v16 = 0;
      if (v51) {
        *uint64_t v51 = @"Fails Predicate";
      }
      SEL v15 = v53;
      goto LABEL_64;
    }
    uint64_t v28 = [[PGPetWallpaperSuggestionCandidate alloc] initWithFace:v27 inAsset:v10];
    uint64_t v29 = +[PGWallpaperSuggestionUtilities peopleSceneConfidenceThresholdHelper];
    long long v61 = 0u;
    memset(v62, 0, sizeof(v62));
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    __int16 v30 = v28;
    int v31 = v28;
    id v11 = v50;
    double v46 = (void *)v29;
    double v47 = v27;
    if (objc_msgSend(a1, "candidate:passesFilteringWithContext:curationContext:thresholdHelper:statistics:", v31, v21, v50))
    {
      BOOL v16 = 1;
      __int16 v32 = v51;
      if (v48)
      {
        __int16 v33 = [PGWallpaperSuggestionAssetGater alloc];
        int v34 = [(PGWallpaperSuggestionAssetGater *)v33 initWithType:2 loggingConnection:MEMORY[0x1E4F14500]];
        [(PGWallpaperSuggestionAssetGater *)v34 setCoversTracks:1];
        [(PGWallpaperSuggestionAssetGater *)v34 setIsUserInitiated:1];
        char v54 = 1;
        int v35 = [(PGPetWallpaperSuggestionCandidate *)v30 asset];
        uint64_t v36 = [(PGWallpaperSuggestionAssetGater *)v34 gateAsset:v35 hasPetFace:&v54];

        uint64_t v49 = v36;
        if (v54)
        {
          if ([v36 passesAnyGating])
          {
            double v37 = @"Pass Segmented";
            BOOL v16 = 1;
          }
          else
          {
            double v39 = [(PGPetWallpaperSuggestionCandidate *)v30 cropResult];
            double v40 = [v39 cropForOrientation:v45];

            if (([v52 ignoreClockOverlap] & 1) != 0
              || [v40 passesClockOverlap])
            {
              [v40 cropScore];
              double v42 = v41;
              [v52 minimumCropScore];
              BOOL v16 = v42 >= v43;
              if (v42 < v43) {
                double v37 = @"Low Crop Score";
              }
              else {
                double v37 = @"Pass Unsegmented";
              }
            }
            else
            {
              BOOL v16 = 0;
              double v37 = @"Clock Overlap";
            }

            __int16 v32 = v51;
          }
        }
        else
        {
          BOOL v16 = 0;
          double v37 = @"No Pet Face";
        }
      }
      else
      {
        double v37 = @"Pass";
      }
      SEL v15 = v53;
      double v38 = v46;
      if (!v32) {
        goto LABEL_63;
      }
    }
    else
    {
      SEL v15 = v53;
      __int16 v32 = v51;
      if (!v51)
      {
        BOOL v16 = 0;
        double v38 = v46;
LABEL_63:

        BOOL v27 = v47;
LABEL_64:

LABEL_65:
        goto LABEL_66;
      }
      if ((int)v55 <= 0)
      {
        if (SDWORD1(v55) <= 0)
        {
          if (SDWORD2(v55) <= 0)
          {
            if (SHIDWORD(v55) <= 0)
            {
              if ((int)v56 <= 0)
              {
                if (SDWORD1(v56) <= 0)
                {
                  if (SDWORD2(v56) <= 0)
                  {
                    if (SHIDWORD(v56) <= 0)
                    {
                      if ((int)v57 <= 0)
                      {
                        if (SDWORD1(v57) <= 0)
                        {
                          BOOL v16 = 0;
                          if (SDWORD2(v57) <= 0) {
                            double v37 = @"Unknown Reason";
                          }
                          else {
                            double v37 = @"Sensitive Location";
                          }
                        }
                        else
                        {
                          BOOL v16 = 0;
                          double v37 = @"Low Light";
                        }
                      }
                      else
                      {
                        BOOL v16 = 0;
                        double v37 = @"People Scene";
                      }
                    }
                    else
                    {
                      BOOL v16 = 0;
                      double v37 = @"Not Safe for Display";
                    }
                    SEL v15 = v53;
                    __int16 v32 = v51;
                  }
                  else
                  {
                    BOOL v16 = 0;
                    double v37 = @"Low Crop Score";
                  }
                }
                else
                {
                  BOOL v16 = 0;
                  double v37 = @"Low Resolution";
                }
              }
              else
              {
                BOOL v16 = 0;
                double v37 = @"Clock Overlap";
              }
            }
            else
            {
              BOOL v16 = 0;
              double v37 = @"Low Wallpaper Score";
            }
          }
          else
          {
            BOOL v16 = 0;
            double v37 = @"Low Aesthetics";
          }
        }
        else
        {
          BOOL v16 = 0;
          double v37 = @"Avoid for Key Asset";
        }
      }
      else
      {
        BOOL v16 = 0;
        double v37 = @"Is Utility";
      }
      double v38 = v46;
    }
    *__int16 v32 = v37;
    goto LABEL_63;
  }
  if (a6)
  {
    if ((unint64_t)[v14 count] <= 1) {
      uint64_t v17 = @"No Face";
    }
    else {
      uint64_t v17 = @"Too Many Faces";
    }
    BOOL v16 = 0;
    *a6 = v17;
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_66:

  return v16;
}

+ (BOOL)candidate:(id)a3 passesFilteringWithContext:(id)a4 curationContext:(id)a5 thresholdHelper:(id)a6 statistics:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  SEL v15 = [v11 asset];
  BOOL v16 = [v15 curationModel];
  [v12 minimumWallpaperScore];
  double v18 = v17;
  if (v17 < 0.0)
  {
    uint64_t v19 = [v16 wallpaperScoreModel];
    uint64_t v20 = [v11 face];
    int v21 = [v20 detectionType];

    switch(v21)
    {
      case 0:
      case 1:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__int16 v52 = 0;
          _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "This is supposed to be a pet!!!", v52, 2u);
        }
        goto LABEL_5;
      case 2:
        uint64_t v22 = [v19 petNode];
        goto LABEL_9;
      case 3:
        uint64_t v22 = [v19 dogNode];
        goto LABEL_9;
      case 4:
        uint64_t v22 = [v19 catNode];
LABEL_9:
        uint64_t v23 = v22;
        [v22 highPrecisionOperatingPoint];
        double v18 = v24;

        break;
      default:
LABEL_5:
        double v18 = 1.79769313e308;
        break;
    }
  }
  id v25 = [v15 mediaAnalysisProperties];
  [v25 wallpaperScore];
  double v27 = v26;

  if (v18 > v27)
  {
    BOOL v28 = 0;
    ++a7->var3;
    goto LABEL_36;
  }
  uint64_t v29 = [v13 userFeedbackCalculator];
  int v30 = [v16 isUtilityForMemoriesWithAsset:v15 userFeedbackCalculator:v29];

  if (v30)
  {
    BOOL v28 = 0;
    ++a7->var0;
    goto LABEL_36;
  }
  if ([v16 avoidIfPossibleForKeyAssetWithAsset:v15 statistics:&a7->var11])
  {
    BOOL v28 = 0;
    ++a7->var1;
    goto LABEL_36;
  }
  if (([v16 isAestheticallyPrettyGoodWithAsset:v15] & 1) == 0)
  {
    BOOL v28 = 0;
    ++a7->var2;
    goto LABEL_36;
  }
  if (([v12 bypassCropScoreCheck] & 1) == 0)
  {
    int v31 = [v11 cropResult];
    __int16 v32 = objc_msgSend(v31, "cropForOrientation:", objc_msgSend(v12, "orientation"));

    if (([v12 ignoreClockOverlap] & 1) != 0 || objc_msgSend(v32, "passesClockOverlap"))
    {
      [v32 cropZoomRatio];
      double v34 = v33;
      [v12 maximumCropZoomRatio];
      if (v34 <= v35)
      {
        [v32 cropScore];
        double v38 = v37;
        [v12 minimumCropScore];
        if (v38 >= v39)
        {

          goto LABEL_19;
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

    BOOL v28 = 0;
    goto LABEL_36;
  }
LABEL_19:
  if ([MEMORY[0x1E4F8E7A8] assetIsSafeForWidgetDisplay:v15])
  {
    if (+[PGWallpaperSuggestionUtilities foundDominantPeopleSceneInAsset:v15 withConfidenceThresholdHelper:v14])
    {
      BOOL v28 = 0;
      ++a7->var8;
    }
    else
    {
      [v12 maximumLowLightScore];
      double v41 = v40;
      if (v40 < 0.0)
      {
        double v42 = [v15 curationModel];
        double v43 = [v42 aestheticsModel];
        double v44 = [v43 lowLightNode];
        [v44 operatingPoint];
        double v41 = v45;
      }
      double v46 = [v15 aestheticProperties];
      [v46 lowLight];
      double v48 = v47;

      if (v41 >= v48)
      {
        id v50 = [v11 asset];
        BOOL v51 = +[PGSensitiveLocationBlocklistConfiguration isAssetAtSensitiveLocationAndDate:v50];

        if (v51)
        {
          BOOL v28 = 0;
          ++a7->var10;
        }
        else
        {
          BOOL v28 = 1;
        }
      }
      else
      {
        BOOL v28 = 0;
        ++a7->var9;
      }
    }
  }
  else
  {
    BOOL v28 = 0;
    ++a7->var7;
  }
LABEL_36:

  return v28;
}

+ (id)prefilteringInternalPredicateWithContext:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  [v4 minimumFaceSize];
  uint64_t v8 = v7;
  [v4 maximumFaceSize];
  uint64_t v10 = v9;

  id v11 = objc_msgSend(v6, "predicateWithFormat:", @"%K >= %f AND %K < %f", @"size", v8, @"size", v10);
  [v5 addObject:v11];
  id v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.%K == %d", @"assetForFace", @"kind", 0);
  [v5 addObject:v12];
  id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (%K.%K IN %@)", @"assetForFace", @"playbackStyle", &unk_1F28D38B8];
  [v5 addObject:v13];
  id v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.%K != %d", @"assetForFace", @"kindSubtype", 1);
  [v5 addObject:v14];
  SEL v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.%K.@count == %d", @"assetForFace", @"detectedFaces", 1);
  [v5 addObject:v15];
  BOOL v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.%K == NO AND %K.%K == %d", @"assetForFace", @"hidden", @"assetForFace", @"trashedState", 0);
  [v5 addObject:v16];
  double v17 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.%K.%K >= %d", @"assetForFace", @"additionalAttributes", @"sceneAnalysisVersion", 77);
  [v5 addObject:v17];
  double v18 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v5];

  return v18;
}

+ (BOOL)filtersForTopSuggestions
{
  return 0;
}

+ (id)suggestionSubtypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:653];
}

+ (id)suggestionTypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:6];
}

@end