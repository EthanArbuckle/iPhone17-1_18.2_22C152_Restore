@interface PGWallpaperQuestionFactory
+ (BOOL)isHighRecallCityscapeAsset:(id)a3;
+ (BOOL)isHighRecallLandscapeAsset:(id)a3;
- (id)_generateQuestionsWithLimit:(unint64_t)a3 progressReporter:(id)a4;
- (id)_generateTruePositiveCityscapeQuestionWithLimit:(unint64_t)a3 suggestionSession:(id)a4 alreadyGeneratedQuestions:(id)a5 progressReporter:(id)a6;
- (id)_generateTruePositiveLandscapeQuestionWithLimit:(unint64_t)a3 suggestionSession:(id)a4 alreadyGeneratedQuestions:(id)a5 progressReporter:(id)a6;
- (id)_generateTruePositivePeopleQuestionWithLimit:(unint64_t)a3 suggestionSession:(id)a4 alreadyGeneratedQuestions:(id)a5 progressReporter:(id)a6;
- (id)_generateTruePositivePetQuestionWithLimit:(unint64_t)a3 suggestionSession:(id)a4 alreadyGeneratedQuestions:(id)a5 progressReporter:(id)a6;
- (id)_generateTruePositiveQuestionsWithLimit:(unint64_t)a3 progressReporter:(id)a4;
- (id)evenlySelectQuestionsByType:(id)a3 limit:(unint64_t)a4;
- (id)fetchAssetsWithPredicate:(id)a3 assetFilter:(id)a4;
- (id)fetchCityscapeAssets;
- (id)fetchLandscapeAssets;
- (id)fetchPeopleAssets;
- (id)fetchPetAssets;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGWallpaperQuestionFactory

+ (BOOL)isHighRecallCityscapeAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 clsSceneClassifications];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "extendedSceneIdentifier", (void)v12) == 2147481598)
        {
          v5 = [v3 curationModel];
          v9 = [v5 cityNatureModel];

          v10 = [v9 cityNode];
          LOBYTE(v5) = [v10 passesHighRecallWithSignal:v8];

          goto LABEL_11;
        }
      }
      v5 = (void *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

+ (BOOL)isHighRecallLandscapeAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 sceneClassifications];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "extendedSceneIdentifier", (void)v12) == 2147481597)
        {
          v5 = [v3 curationModel];
          v9 = [v5 cityNatureModel];

          v10 = [v9 natureNode];
          LOBYTE(v5) = [v10 passesHighRecallWithSignal:v8];

          goto LABEL_11;
        }
      }
      v5 = (void *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (id)fetchCityscapeAssets
{
  id v3 = +[PGCityscapeWallpaperSuggester prefilteringInternalPredicateWithForbiddenAssetUUIDs:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PGWallpaperQuestionFactory_fetchCityscapeAssets__block_invoke;
  v6[3] = &unk_1E68E7208;
  v6[4] = self;
  id v4 = [(PGWallpaperQuestionFactory *)self fetchAssetsWithPredicate:v3 assetFilter:v6];

  return v4;
}

uint64_t __50__PGWallpaperQuestionFactory_fetchCityscapeAssets__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(id)objc_opt_class() isHighRecallCityscapeAsset:v2];

  return v3;
}

- (id)fetchLandscapeAssets
{
  uint64_t v3 = +[PGLandscapeWallpaperSuggester prefilteringInternalPredicateWithForbiddenAssetUUIDs:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PGWallpaperQuestionFactory_fetchLandscapeAssets__block_invoke;
  v6[3] = &unk_1E68E7208;
  v6[4] = self;
  id v4 = [(PGWallpaperQuestionFactory *)self fetchAssetsWithPredicate:v3 assetFilter:v6];

  return v4;
}

uint64_t __50__PGWallpaperQuestionFactory_fetchLandscapeAssets__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(id)objc_opt_class() isHighRecallLandscapeAsset:v2];

  return v3;
}

- (id)fetchPetAssets
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PGSurveyQuestionFactory *)self workingContext];
  id v4 = [v3 photoLibrary];

  id v33 = objc_alloc_init(MEMORY[0x1E4F8E778]);
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v4 curationSession:v33];
  uint64_t v6 = [(PGSurveyQuestionFactory *)self workingContext];
  v32 = (void *)v5;
  v7 = +[PGGraphPetIdentityProcessor fetchInterestingEligiblePetsForWallpaperWithWorkingContext:v6 curationContext:v5];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [*(id *)(*((void *)&v34 + 1) + 8 * i) uuid];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v11);
  }

  long long v15 = [v4 librarySpecificFetchOptions];
  [v15 setIncludedDetectionTypes:&unk_1F28D3E10];
  v16 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v17 = [PGPetWallpaperSuggesterFilteringContext alloc];
  id v18 = -[PGPetWallpaperSuggesterFilteringContext initForPetsInOrientation:](v17, "initForPetsInOrientation:", [MEMORY[0x1E4F8E858] primaryOrientation]);
  v19 = +[PGPetWallpaperSuggester prefilteringInternalPredicateWithContext:v18];
  v39[0] = v19;
  v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K IN %@", @"personForFace", @"personUUID", v8];
  v39[1] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  v22 = [v16 andPredicateWithSubpredicates:v21];
  [v15 setInternalPredicate:v22];

  v23 = [MEMORY[0x1E4F39050] fetchFacesWithOptions:v15];
  v24 = [v4 librarySpecificFetchOptions];
  [v24 setCacheSizeForFetch:200];
  [v24 setChunkSizeForFetch:200];
  [v24 setFetchLimit:200];
  v25 = +[PGCurationManager assetPropertySetsForCuration];
  [v24 setFetchPropertySets:v25];

  v26 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v38 = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  [v24 setSortDescriptors:v27];

  v28 = (void *)MEMORY[0x1E4F38EB8];
  v29 = [v23 fetchedObjects];
  v30 = [v28 fetchAssetsForFaces:v29 options:v24];

  return v30;
}

- (id)fetchPeopleAssets
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PGSurveyQuestionFactory *)self workingContext];
  id v4 = [v3 photoLibrary];

  uint64_t v5 = [v4 librarySpecificFetchOptions];
  PFDeviceScreenSize();
  double v8 = v6;
  double v9 = v7;
  if (v6 == 0.0
    || v7 == 0.0
    || (v6 == *MEMORY[0x1E4F8A250] ? (BOOL v10 = v7 == *(double *)(MEMORY[0x1E4F8A250] + 8)) : (BOOL v10 = 0), v10))
  {
    double v11 = 1.0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218496;
      double v33 = v8;
      __int16 v34 = 2048;
      double v35 = v9;
      __int16 v36 = 2048;
      uint64_t v37 = 0x3FF0000000000000;
      _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
    }
  }
  else
  {
    double v11 = fabs(v6 / v7);
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F28BA0];
  long long v13 = [PGSinglePersonWallpaperAssetSuggesterFilteringContext alloc];
  id v14 = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext initForPeopleInOrientation:](v13, "initForPeopleInOrientation:", [MEMORY[0x1E4F8E858] primaryOrientation]);
  long long v15 = +[PGSinglePersonWallpaperAssetSuggester prefilteringInternalPredicateWithContext:v14 forTargetAspectRatio:v11];
  v31[0] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.%K > %d OR %K.%K >= %f", @"personForFace", @"verifiedType", 0, @"personForFace", @"mergeCandidateConfidence", *MEMORY[0x1E4F397C8]);
  v31[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  id v18 = [v12 andPredicateWithSubpredicates:v17];
  [v5 setInternalPredicate:v18];

  v19 = [MEMORY[0x1E4F39050] fetchFacesWithOptions:v5];
  v20 = [(PGSurveyQuestionFactory *)self workingContext];
  v21 = [v20 photoLibrary];
  v22 = [v21 librarySpecificFetchOptions];

  [v22 setCacheSizeForFetch:200];
  [v22 setChunkSizeForFetch:200];
  [v22 setFetchLimit:200];
  v23 = +[PGCurationManager assetPropertySetsForCuration];
  [v22 setFetchPropertySets:v23];

  v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v30 = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  [v22 setSortDescriptors:v25];

  v26 = (void *)MEMORY[0x1E4F38EB8];
  v27 = [v19 fetchedObjects];
  v28 = [v26 fetchAssetsForFaces:v27 options:v22];

  return v28;
}

- (id)fetchAssetsWithPredicate:(id)a3 assetFilter:(id)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (unsigned int (**)(id, void))a4;
  double v8 = [(PGSurveyQuestionFactory *)self workingContext];
  double v9 = [v8 photoLibrary];

  BOOL v10 = [v9 librarySpecificFetchOptions];
  [v10 setCacheSizeForFetch:200];
  [v10 setChunkSizeForFetch:200];
  __int16 v36 = v6;
  [v10 setInternalPredicate:v6];
  double v11 = +[PGCurationManager assetPropertySetsForCuration];
  [v10 setFetchPropertySets:v11];

  uint64_t v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v47[0] = v12;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  [v10 setSortDescriptors:v13];

  __int16 v34 = v10;
  id v14 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v10];
  double v35 = v9;
  id v33 = objc_alloc_init(MEMORY[0x1E4F8E778]);
  uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v9 curationSession:v33];
  v39 = v14;
  unint64_t v37 = [v14 count] / 0xC8uLL;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v16 = 0;
  do
  {
    context = (void *)MEMORY[0x1D25FED50]();
    v40 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:");
    uint64_t v17 = objc_msgSend(v39, "objectsAtIndexes:");
    [MEMORY[0x1E4F38EB8] prefetchOnAssets:v17 options:31 curationContext:v38];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v43;
LABEL_4:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v43 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v42 + 1) + 8 * v22);
        v24 = (void *)MEMORY[0x1D25FED50]();
        if (v7[2](v7, v23)) {
          [v15 addObject:v23];
        }
        unint64_t v25 = [v15 count];
        if (v25 > 0xC7) {
          break;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
          if (v20) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    unint64_t v26 = [v15 count];
    if (v26 > 0xC7) {
      break;
    }
  }
  while (v16++ != v37);
  id v28 = objc_alloc(MEMORY[0x1E4F39150]);
  uint64_t v29 = *MEMORY[0x1E4F39648];
  v30 = [v39 fetchPropertySets];
  v31 = (void *)[v28 initWithObjects:v15 photoLibrary:v35 fetchType:v29 fetchPropertySets:v30 identifier:0 registerIfNeeded:0];

  return v31;
}

- (id)_generateQuestionsWithLimit:(unint64_t)a3 progressReporter:(id)a4
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = [MEMORY[0x1E4F1CAD0] set];
  if (![v6 isCancelledWithProgress:0.0])
  {
    double v9 = +[PGLogging sharedLogging];
    BOOL v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v152 = a3;
      _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Generating regular wallpaper questions with limit: %lu", buf, 0xCu);
    }

    double v11 = [(PGSurveyQuestionFactory *)self workingContext];
    uint64_t v12 = [v11 loggingConnection];

    long long v13 = v12;
    os_signpost_id_t v14 = os_signpost_id_generate(v13);
    id v15 = v13;
    uint64_t v16 = v15;
    unint64_t v141 = v14 - 1;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "OtherWallpaperQuestionGeneration", "", buf, 2u);
    }
    os_signpost_id_t spid = v14;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v140 = mach_absolute_time();
    uint64_t v143 = [MEMORY[0x1E4F1CA80] set];
    id v145 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v17 = v16;
    os_signpost_id_t v18 = os_signpost_id_generate(v17);
    uint64_t v19 = v17;
    uint64_t v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "WallpaperQuestionFetchPeopleAsset", "", buf, 2u);
    }

    mach_timebase_info v149 = 0;
    mach_timebase_info(&v149);
    uint64_t v21 = mach_absolute_time();
    v144 = self;
    uint64_t v22 = [(PGWallpaperQuestionFactory *)self fetchPeopleAssets];
    uint64_t v23 = +[PGLogging sharedLogging];
    v24 = [v23 loggingConnection];

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [v22 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v152 = v25;
      _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Fetched %lu People assets", buf, 0xCu);
    }

    if ([v22 count])
    {
      id v26 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v27 = [v22 fetchedObjects];
      id v28 = (void *)[v26 initWithArray:v27];
      [v145 setObject:v28 forKeyedSubscript:&unk_1F28D14B8];
    }
    uint64_t v29 = mach_absolute_time();
    uint32_t numer = v149.numer;
    uint32_t denom = v149.denom;
    v32 = v20;
    id v33 = v32;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v33, OS_SIGNPOST_INTERVAL_END, v18, "WallpaperQuestionFetchPeopleAsset", "", buf, 2u);
    }

    __int16 v34 = v33;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v152 = "WallpaperQuestionFetchPeopleAsset";
      *(_WORD *)&v152[8] = 2048;
      *(double *)&v152[10] = (float)((float)((float)((float)(v29 - v21) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v34, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    if ([v6 isCancelledWithProgress:0.1])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v152 = 381;
        *(_WORD *)&v152[4] = 2080;
        *(void *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v8 = v7;
      double v35 = (void *)v143;
      goto LABEL_119;
    }
    unint64_t v138 = a3;
    v142 = v22;
    __int16 v36 = v34;
    os_signpost_id_t v37 = os_signpost_id_generate(v36);
    uint64_t v38 = v36;
    v39 = v38;
    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v37, "WallpaperQuestionFetchPetAsset", "", buf, 2u);
    }

    mach_timebase_info v148 = 0;
    mach_timebase_info(&v148);
    uint64_t v40 = mach_absolute_time();
    uint64_t v41 = [(PGWallpaperQuestionFactory *)v144 fetchPetAssets];
    long long v42 = +[PGLogging sharedLogging];
    long long v43 = [v42 loggingConnection];

    long long v44 = v41;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = [v41 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v152 = v45;
      _os_log_impl(&dword_1D1805000, v43, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Fetched %lu Pet assets", buf, 0xCu);
    }

    if ([v41 count])
    {
      id v46 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v47 = [v41 fetchedObjects];
      v48 = (void *)[v46 initWithArray:v47];
      [v145 setObject:v48 forKeyedSubscript:&unk_1F28D14D0];

      long long v44 = v41;
    }
    uint64_t v49 = mach_absolute_time();
    uint32_t v51 = v148.numer;
    uint32_t v50 = v148.denom;
    v52 = v39;
    v53 = v52;
    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v53, OS_SIGNPOST_INTERVAL_END, v37, "WallpaperQuestionFetchPetAsset", "", buf, 2u);
    }

    v54 = v53;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v152 = "WallpaperQuestionFetchPetAsset";
      *(_WORD *)&v152[8] = 2048;
      *(double *)&v152[10] = (float)((float)((float)((float)(v49 - v40) * (float)v51) / (float)v50) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v54, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    if ([v6 isCancelledWithProgress:0.2])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v152 = 390;
        *(_WORD *)&v152[4] = 2080;
        *(void *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v8 = v7;
      double v35 = (void *)v143;
      goto LABEL_118;
    }
    v133 = v54;
    v134 = v44;
    v55 = v54;
    os_signpost_id_t v56 = os_signpost_id_generate(v55);
    v57 = v55;
    v58 = v57;
    if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v58, OS_SIGNPOST_INTERVAL_BEGIN, v56, "WallpaperQuestionFetchLandscapeAsset", "", buf, 2u);
    }

    mach_timebase_info v147 = 0;
    mach_timebase_info(&v147);
    uint64_t v59 = mach_absolute_time();
    v60 = [(PGWallpaperQuestionFactory *)v144 fetchLandscapeAssets];
    v61 = +[PGLogging sharedLogging];
    v62 = [v61 loggingConnection];

    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v63 = [v60 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v152 = v63;
      _os_log_impl(&dword_1D1805000, v62, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Fetched %lu Landscape assets", buf, 0xCu);
    }

    v132 = v60;
    if ([v60 count])
    {
      id v64 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v65 = [v60 fetchedObjects];
      v66 = (void *)[v64 initWithArray:v65];
      [v145 setObject:v66 forKeyedSubscript:&unk_1F28D14E8];
    }
    uint64_t v67 = mach_absolute_time();
    uint32_t v69 = v147.numer;
    uint32_t v68 = v147.denom;
    v70 = v58;
    v71 = v70;
    if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v71, OS_SIGNPOST_INTERVAL_END, v56, "WallpaperQuestionFetchLandscapeAsset", "", buf, 2u);
    }

    v72 = v71;
    long long v44 = v134;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v152 = "WallpaperQuestionFetchLandscapeAsset";
      *(_WORD *)&v152[8] = 2048;
      *(double *)&v152[10] = (float)((float)((float)((float)(v67 - v59) * (float)v69) / (float)v68) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v72, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    v131 = v72;
    if ([v6 isCancelledWithProgress:0.3])
    {
      v54 = v133;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v152 = 399;
        *(_WORD *)&v152[4] = 2080;
        *(void *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v8 = v7;
      double v35 = (void *)v143;
      goto LABEL_117;
    }
    v73 = v72;
    os_signpost_id_t v74 = os_signpost_id_generate(v73);
    v75 = v73;
    v76 = v75;
    if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v76, OS_SIGNPOST_INTERVAL_BEGIN, v74, "WallpaperQuestionFetchCityscapeAsset", "", buf, 2u);
    }

    mach_timebase_info v146 = 0;
    mach_timebase_info(&v146);
    uint64_t v77 = mach_absolute_time();
    v78 = [(PGWallpaperQuestionFactory *)v144 fetchCityscapeAssets];
    v79 = +[PGLogging sharedLogging];
    v80 = [v79 loggingConnection];

    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v81 = [v78 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v152 = v81;
      _os_log_impl(&dword_1D1805000, v80, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Fetched %lu Cityscape assets", buf, 0xCu);
    }

    if ([v78 count])
    {
      id v82 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v83 = [v78 fetchedObjects];
      v84 = (void *)[v82 initWithArray:v83];
      [v145 setObject:v84 forKeyedSubscript:&unk_1F28D1500];
    }
    uint64_t v85 = mach_absolute_time();
    uint32_t v87 = v146.numer;
    uint32_t v86 = v146.denom;
    v88 = v76;
    v89 = v88;
    if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v89, OS_SIGNPOST_INTERVAL_END, v74, "WallpaperQuestionFetchCityscapeAsset", "", buf, 2u);
    }

    v90 = v89;
    long long v44 = v134;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v152 = "WallpaperQuestionFetchCityscapeAsset";
      *(_WORD *)&v152[8] = 2048;
      *(double *)&v152[10] = (float)((float)((float)((float)(v85 - v77) * (float)v87) / (float)v86) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v90, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v129 = v90;

    v91 = v145;
    v54 = v133;
    v128 = v78;
    if ([v6 isCancelledWithProgress:0.4])
    {
      double v35 = (void *)v143;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v152 = 408;
        *(_WORD *)&v152[4] = 2080;
        *(void *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
LABEL_93:
      id v8 = v7;
LABEL_116:

LABEL_117:
LABEL_118:

LABEL_119:
      goto LABEL_120;
    }
    if ([v145 count])
    {
      v130 = v7;
      unint64_t v93 = 0;
      *(void *)&long long v92 = 138412290;
      long long v127 = v92;
      double v35 = (void *)v143;
      while (1)
      {
        context = (void *)MEMORY[0x1D25FED50]();
        [v91 allKeys];
        v136 = unint64_t v135 = v93;
        v94 = [v136 objectAtIndexedSubscript:v93];
        v95 = [v91 objectForKeyedSubscript:v94];
        uint64_t v96 = arc4random_uniform([v95 count]);
        v97 = [v95 objectAtIndex:v96];
        v98 = [PGWallpaperQuestion alloc];
        v99 = [v97 uuid];
        v100 = -[PGWallpaperQuestion initWithAssetUUID:suggestionSubtype:](v98, "initWithAssetUUID:suggestionSubtype:", v99, (unsigned __int16)[v94 unsignedIntValue]);

        if ([(PGSurveyQuestionFactory *)v144 shouldAddQuestion:v100 toAlreadyGeneratedQuestions:v35])
        {
          [v35 addObject:v100];
          v101 = +[PGLogging sharedLogging];
          v102 = [v101 loggingConnection];

          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            [v94 integerValue];
            PHSuggestionStringWithSubtype();
            id v103 = (id)objc_claimAutoreleasedReturnValue();
            v104 = [v97 uuid];
            *(_DWORD *)buf = 138412546;
            *(void *)v152 = v103;
            *(_WORD *)&v152[8] = 2112;
            *(void *)&v152[10] = v104;
            _os_log_impl(&dword_1D1805000, v102, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Generated %@ question with asset %@", buf, 0x16u);

            v91 = v145;
          }

          double v35 = (void *)v143;
        }
        objc_msgSend(v95, "removeObjectAtIndex:", v96, v127);
        double v7 = v130;
        if (![v95 count])
        {
          [v91 setObject:0 forKeyedSubscript:v94];
          v105 = +[PGLogging sharedLogging];
          v106 = [v105 loggingConnection];

          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            [v94 integerValue];
            PHSuggestionStringWithSubtype();
            id v107 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v127;
            *(void *)v152 = v107;
            _os_log_impl(&dword_1D1805000, v106, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Used all %@ assets", buf, 0xCu);
          }
          v91 = v145;
        }
        if ([v35 count] >= v138 || !objc_msgSend(v91, "count")) {
          break;
        }
        if (objc_msgSend(v6, "isCancelledWithProgress:", (double)(unint64_t)objc_msgSend(v35, "count") / (double)v138 * 0.6 + 0.4))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v152 = 445;
            *(_WORD *)&v152[4] = 2080;
            *(void *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v8 = v130;

          uint64_t v22 = v142;
          long long v44 = v134;
          goto LABEL_115;
        }
        unint64_t v93 = (v135 + 1) % [v91 count];
      }

      v108 = +[PGLogging sharedLogging];
      v109 = [v108 loggingConnection];

      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v110 = [v35 count];
        *(_DWORD *)buf = 134217984;
        *(void *)v152 = v110;
        _os_log_impl(&dword_1D1805000, v109, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Generated %lu regular wallpaper questions.", buf, 0xCu);
      }

      uint64_t v22 = v142;
      long long v44 = v134;
      if ([v6 isCancelledWithProgress:1.0])
      {
        v111 = MEMORY[0x1E4F14500];
        id v112 = MEMORY[0x1E4F14500];
        v54 = v133;
        if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v152 = 452;
          *(_WORD *)&v152[4] = 2080;
          *(void *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        goto LABEL_93;
      }
      uint64_t v115 = mach_absolute_time();
      uint32_t v117 = info.numer;
      uint32_t v116 = info.denom;
      v118 = v129;
      v119 = v118;
      if (v141 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v118))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v119, OS_SIGNPOST_INTERVAL_END, spid, "OtherWallpaperQuestionGeneration", "", buf, 2u);
      }

      v120 = v119;
      if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)v152 = "OtherWallpaperQuestionGeneration";
        *(_WORD *)&v152[8] = 2048;
        *(double *)&v152[10] = (float)((float)((float)((float)(v115 - v140) * (float)v117) / (float)v116) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v120, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }

      id v8 = v35;
    }
    else
    {
      v113 = +[PGLogging sharedLogging];
      v114 = [v113 loggingConnection];

      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v114, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Found 0 candidate assets for question generation", buf, 2u);
      }

      if ([v6 isCancelledWithProgress:1.0])
      {
        v54 = v133;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v152 = 412;
          *(_WORD *)&v152[4] = 2080;
          *(void *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v8 = v7;
        double v35 = (void *)v143;
        goto LABEL_116;
      }
      uint64_t v121 = mach_absolute_time();
      uint32_t v123 = info.numer;
      uint32_t v122 = info.denom;
      v124 = v129;
      v125 = v124;
      if (v141 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v124))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v125, OS_SIGNPOST_INTERVAL_END, spid, "OtherWallpaperQuestionGeneration", "", buf, 2u);
      }

      if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)v152 = "OtherWallpaperQuestionGeneration";
        *(_WORD *)&v152[8] = 2048;
        *(double *)&v152[10] = (float)((float)((float)((float)(v121 - v140) * (float)v123) / (float)v122) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v125, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      id v8 = [MEMORY[0x1E4F1CAD0] set];
      double v35 = (void *)v143;
    }
LABEL_115:
    v54 = v133;
    goto LABEL_116;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v152 = 364;
    *(_WORD *)&v152[4] = 2080;
    *(void *)&v152[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v8 = v7;
LABEL_120:

  return v8;
}

- (id)_generateTruePositiveCityscapeQuestionWithLimit:(unint64_t)a3 suggestionSession:(id)a4 alreadyGeneratedQuestions:(id)a5 progressReporter:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([v11 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v47 = 333;
      *(_WORD *)&v47[4] = 2080;
      *(void *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v12 = 0;
  }
  else
  {
    id v36 = v9;
    double v35 = [[PGCityscapeWallpaperSuggester alloc] initWithSession:v9];
    os_signpost_id_t v37 = v11;
    long long v13 = [(PGCityscapeWallpaperSuggester *)v35 fetchUnsortedCandidatesWithProgressReporter:v11];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v15 = v13;
    uint64_t v38 = v15;
    uint64_t v41 = [v15 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v41)
    {
      uint64_t v16 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v43 != v16) {
            objc_enumerationMutation(v15);
          }
          os_signpost_id_t v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v19 = (void *)MEMORY[0x1D25FED50]();
          uint64_t v20 = [v18 asset];
          uint64_t v21 = [PGWallpaperQuestion alloc];
          uint64_t v22 = [v20 uuid];
          uint64_t v23 = [(PGWallpaperQuestion *)v21 initWithAssetUUID:v22 suggestionSubtype:655];

          if ([(PGSurveyQuestionFactory *)self shouldAddQuestion:v23 toAlreadyGeneratedQuestions:v10])
          {
            uint64_t v40 = v19;
            uint64_t v24 = v16;
            uint64_t v25 = self;
            id v26 = +[PGLogging sharedLogging];
            v27 = [v26 loggingConnection];

            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = PHSuggestionStringWithSubtype();
              [v20 uuid];
              id v29 = v14;
              v31 = id v30 = v10;
              *(_DWORD *)buf = 138412546;
              *(void *)v47 = v28;
              *(_WORD *)&v47[8] = 2112;
              *(void *)&v47[10] = v31;
              _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Elected True Positive %@ question with asset %@", buf, 0x16u);

              id v10 = v30;
              id v14 = v29;
              id v15 = v38;
            }
            [v14 addObject:v23];
            self = v25;
            uint64_t v16 = v24;
            uint64_t v19 = v40;
            if ([v14 count] == a3)
            {
              id v11 = v37;
              if ([v37 isCancelledWithProgress:1.0])
              {
                v32 = v35;
                id v9 = v36;
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v47 = 352;
                  *(_WORD *)&v47[4] = 2080;
                  *(void *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
                id v12 = 0;
              }
              else
              {
                id v12 = v14;
                v32 = v35;
                id v9 = v36;
              }

              id v33 = v38;

              goto LABEL_28;
            }
          }
        }
        uint64_t v41 = [v15 countByEnumeratingWithState:&v42 objects:v48 count:16];
        if (v41) {
          continue;
        }
        break;
      }
    }

    id v11 = v37;
    if ([v37 isCancelledWithProgress:1.0])
    {
      id v9 = v36;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v47 = 356;
        *(_WORD *)&v47[4] = 2080;
        *(void *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v12 = 0;
    }
    else
    {
      id v12 = v14;
      id v9 = v36;
    }
    v32 = v35;
    id v33 = v38;
LABEL_28:
  }
  return v12;
}

- (id)_generateTruePositiveLandscapeQuestionWithLimit:(unint64_t)a3 suggestionSession:(id)a4 alreadyGeneratedQuestions:(id)a5 progressReporter:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([v11 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v47 = 304;
      *(_WORD *)&v47[4] = 2080;
      *(void *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v12 = 0;
  }
  else
  {
    id v36 = v9;
    double v35 = [[PGLandscapeWallpaperSuggester alloc] initWithSession:v9];
    os_signpost_id_t v37 = v11;
    long long v13 = [(PGLandscapeWallpaperSuggester *)v35 fetchUnsortedCandidatesWithProgressReporter:v11];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v15 = v13;
    uint64_t v38 = v15;
    uint64_t v41 = [v15 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v41)
    {
      uint64_t v16 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v43 != v16) {
            objc_enumerationMutation(v15);
          }
          os_signpost_id_t v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v19 = (void *)MEMORY[0x1D25FED50]();
          uint64_t v20 = [v18 asset];
          uint64_t v21 = [PGWallpaperQuestion alloc];
          uint64_t v22 = [v20 uuid];
          uint64_t v23 = [(PGWallpaperQuestion *)v21 initWithAssetUUID:v22 suggestionSubtype:654];

          if ([(PGSurveyQuestionFactory *)self shouldAddQuestion:v23 toAlreadyGeneratedQuestions:v10])
          {
            uint64_t v40 = v19;
            uint64_t v24 = v16;
            uint64_t v25 = self;
            id v26 = +[PGLogging sharedLogging];
            v27 = [v26 loggingConnection];

            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = PHSuggestionStringWithSubtype();
              [v20 uuid];
              id v29 = v14;
              v31 = id v30 = v10;
              *(_DWORD *)buf = 138412546;
              *(void *)v47 = v28;
              *(_WORD *)&v47[8] = 2112;
              *(void *)&v47[10] = v31;
              _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Elected True Positive %@ question with asset %@", buf, 0x16u);

              id v10 = v30;
              id v14 = v29;
              id v15 = v38;
            }
            [v14 addObject:v23];
            self = v25;
            uint64_t v16 = v24;
            uint64_t v19 = v40;
            if ([v14 count] == a3)
            {
              id v11 = v37;
              if ([v37 isCancelledWithProgress:1.0])
              {
                v32 = v35;
                id v9 = v36;
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v47 = 323;
                  *(_WORD *)&v47[4] = 2080;
                  *(void *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
                id v12 = 0;
              }
              else
              {
                id v12 = v14;
                v32 = v35;
                id v9 = v36;
              }

              id v33 = v38;

              goto LABEL_28;
            }
          }
        }
        uint64_t v41 = [v15 countByEnumeratingWithState:&v42 objects:v48 count:16];
        if (v41) {
          continue;
        }
        break;
      }
    }

    id v11 = v37;
    if ([v37 isCancelledWithProgress:1.0])
    {
      id v9 = v36;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v47 = 327;
        *(_WORD *)&v47[4] = 2080;
        *(void *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v12 = 0;
    }
    else
    {
      id v12 = v14;
      id v9 = v36;
    }
    v32 = v35;
    id v33 = v38;
LABEL_28:
  }
  return v12;
}

- (id)_generateTruePositivePetQuestionWithLimit:(unint64_t)a3 suggestionSession:(id)a4 alreadyGeneratedQuestions:(id)a5 progressReporter:(id)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (![v11 isCancelledWithProgress:0.0])
  {
    long long v13 = [[PGPetWallpaperSuggester alloc] initWithSession:v9];
    id v61 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v14 = [MEMORY[0x1E4F8E858] randomNumberGeneratorForWallpaperDonation];
    v54 = v13;
    id v15 = [(PGPetWallpaperSuggester *)v13 fetchPets];
    id v16 = objc_alloc(MEMORY[0x1E4F1C978]);
    v47 = v15;
    uint64_t v17 = [v15 fetchedObjects];
    os_signpost_id_t v18 = (void *)[v16 initWithArray:v17];
    v53 = (void *)v14;
    uint64_t v19 = PFShuffledArrayWithRandomNumberGenerator();

    if ([v11 isCancelledWithProgress:0.5])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v72 = 277;
        *(_WORD *)&v72[4] = 2080;
        *(void *)&v72[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v12 = 0;
      goto LABEL_48;
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v46 = v19;
    id v20 = v19;
    uint64_t v52 = [v20 countByEnumeratingWithState:&v67 objects:v74 count:16];
    if (v52)
    {
      id v59 = v10;
      id v45 = v9;
      char v55 = 0;
      uint64_t v51 = *(void *)v68;
      id v49 = v20;
      uint32_t v50 = v11;
      while (2)
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v68 != v51) {
            objc_enumerationMutation(v20);
          }
          uint64_t v22 = *(void *)(*((void *)&v67 + 1) + 8 * i);
          uint64_t v23 = (void *)MEMORY[0x1D25FED50]();
          uint64_t v24 = [(PGPetWallpaperSuggester *)v54 candidatesForPet:v22];
          uint64_t v25 = PFShuffledArrayWithRandomNumberGenerator();
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          obuint64_t j = v25;
          uint64_t v26 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
          id v27 = v59;
          if (v26)
          {
            uint64_t v28 = v26;
            os_signpost_id_t v56 = v24;
            v57 = v23;
            uint64_t v58 = i;
            uint64_t v29 = *(void *)v64;
            while (2)
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v64 != v29) {
                  objc_enumerationMutation(obj);
                }
                v31 = *(void **)(*((void *)&v63 + 1) + 8 * j);
                v32 = (void *)MEMORY[0x1D25FED50]();
                id v33 = [v31 asset];
                __int16 v34 = [PGWallpaperQuestion alloc];
                double v35 = [v33 uuid];
                id v36 = [(PGWallpaperQuestion *)v34 initWithAssetUUID:v35 suggestionSubtype:653];

                if ([(PGSurveyQuestionFactory *)self shouldAddQuestion:v36 toAlreadyGeneratedQuestions:v27])
                {
                  os_signpost_id_t v37 = self;
                  uint64_t v38 = +[PGLogging sharedLogging];
                  v39 = [v38 loggingConnection];

                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v40 = PHSuggestionStringWithSubtype();
                    uint64_t v41 = [v33 uuid];
                    *(_DWORD *)buf = 138412546;
                    *(void *)v72 = v40;
                    *(_WORD *)&v72[8] = 2112;
                    *(void *)&v72[10] = v41;
                    _os_log_impl(&dword_1D1805000, v39, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Elected True Positive %@ question with asset %@", buf, 0x16u);

                    id v27 = v59;
                  }

                  [v61 addObject:v36];
                  self = v37;
                  if ([v61 count] == a3)
                  {
                    id v11 = v50;
                    if ((v55 & 1) != 0 || [v50 isCancelledWithProgress:1.0])
                    {
                      long long v43 = MEMORY[0x1E4F14500];
                      uint64_t v24 = v56;
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)v72 = 293;
                        *(_WORD *)&v72[4] = 2080;
                        *(void *)&v72[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
                        char v55 = 1;
                        _os_log_impl(&dword_1D1805000, v43, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                      }
                      else
                      {
                        char v55 = 1;
                      }
                      id v48 = 0;
                    }
                    else
                    {
                      id v48 = v61;
                      char v55 = 0;
                      uint64_t v24 = v56;
                    }

                    int v42 = 0;
                    id v20 = v49;
                    uint64_t v23 = v57;
                    uint64_t i = v58;
                    goto LABEL_35;
                  }
                }
              }
              uint64_t v28 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
              if (v28) {
                continue;
              }
              break;
            }
            int v42 = 1;
            id v20 = v49;
            id v11 = v50;
            uint64_t v23 = v57;
            uint64_t i = v58;
            uint64_t v24 = v56;
          }
          else
          {
            int v42 = 1;
          }
LABEL_35:

          if (!v42)
          {

            id v9 = v45;
            uint64_t v19 = v46;
            id v10 = v59;
            id v12 = v48;
            goto LABEL_48;
          }
        }
        uint64_t v52 = [v20 countByEnumeratingWithState:&v67 objects:v74 count:16];
        if (v52) {
          continue;
        }
        break;
      }

      id v9 = v45;
      id v10 = v59;
      if (v55) {
        goto LABEL_43;
      }
    }
    else
    {
    }
    if (![v11 isCancelledWithProgress:1.0])
    {
      id v12 = v61;
LABEL_47:
      uint64_t v19 = v46;
LABEL_48:

      goto LABEL_49;
    }
LABEL_43:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v72 = 298;
      *(_WORD *)&v72[4] = 2080;
      *(void *)&v72[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v12 = 0;
    goto LABEL_47;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v72 = 267;
    *(_WORD *)&v72[4] = 2080;
    *(void *)&v72[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v12 = 0;
LABEL_49:

  return v12;
}

- (id)_generateTruePositivePeopleQuestionWithLimit:(unint64_t)a3 suggestionSession:(id)a4 alreadyGeneratedQuestions:(id)a5 progressReporter:(id)a6
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v49 = a4;
  id v60 = a5;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2020000000;
  char v81 = 0;
  id v50 = a6;
  int v8 = [v50 isCancelledWithProgress:0.0];
  *((unsigned char *)v79 + 24) = v8;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = 212;
      LOWORD(v87) = 2080;
      *(void *)((char *)&v87 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v57 = 0;
    goto LABEL_12;
  }
  id v9 = [[PGPeopleWallpaperSuggester alloc] initWithSession:v49];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __136__PGWallpaperQuestionFactory__generateTruePositivePeopleQuestionWithLimit_suggestionSession_alreadyGeneratedQuestions_progressReporter___block_invoke;
  v75[3] = &unk_1E68EBE50;
  uint64_t v77 = &v78;
  id v48 = v50;
  id v76 = v48;
  uint64_t v40 = v9;
  uint64_t v41 = [(PGPeopleWallpaperSuggester *)v9 personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress:v75];
  if (*((unsigned char *)v79 + 24))
  {
    *((unsigned char *)v79 + 24) = 1;
LABEL_8:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = 221;
      LOWORD(v87) = 2080;
      *(void *)((char *)&v87 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v57 = 0;
    goto LABEL_11;
  }
  char v10 = [v48 isCancelledWithProgress:0.5];
  *((unsigned char *)v79 + 24) = v10;
  if (v10) {
    goto LABEL_8;
  }
  id v46 = [v49 curationContext];
  *(void *)buf = 0;
  *(void *)&long long v87 = buf;
  *((void *)&v87 + 1) = 0x2020000000;
  uint64_t v88 = 0x3FE0000000000000;
  unint64_t v12 = [v41 count];
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v47 = [MEMORY[0x1E4F8E858] randomNumberGeneratorForWallpaperDonation];
  long long v13 = [v41 allValues];
  uint64_t v14 = PFShuffledArrayWithRandomNumberGenerator();

  id v15 = [(PGSurveyQuestionFactory *)self workingContext];
  id v45 = [v15 loggingConnection];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obuint64_t j = v14;
  uint64_t v16 = [obj countByEnumeratingWithState:&v71 objects:v85 count:16];
  if (!v16) {
    goto LABEL_48;
  }
  double v17 = 0.5 / (double)v12;
  uint64_t v44 = *(void *)v72;
  uint64_t v18 = v16;
  do
  {
    uint64_t v54 = 0;
    uint64_t v43 = v18;
    do
    {
      if (*(void *)v72 != v44) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(*((void *)&v71 + 1) + 8 * v54);
      context = (void *)MEMORY[0x1D25FED50]();
      os_signpost_id_t v56 = [[PGSinglePersonWallpaperAssetSuggester alloc] initWithPersonLocalIdentifiers:v19 curationContext:v46 loggingConnection:v45];
      id v20 = +[PGCurationManager assetPropertySetsForCuration];
      [(PGSinglePersonWallpaperAssetSuggester *)v56 setAssetFetchPropertySets:v20];

      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __136__PGWallpaperQuestionFactory__generateTruePositivePeopleQuestionWithLimit_suggestionSession_alreadyGeneratedQuestions_progressReporter___block_invoke_327;
      v66[3] = &unk_1E68E71E0;
      long long v68 = &v78;
      id v55 = v48;
      id v67 = v55;
      long long v69 = buf;
      double v70 = v17;
      uint64_t v52 = [(PGSinglePersonWallpaperAssetSuggester *)v56 unsortedCandidatesFromPersonLocalIdentifiers:v19 progressBlock:v66];
      uint64_t v51 = PFShuffledArrayWithRandomNumberGenerator();
      uint64_t v21 = -[PGSinglePersonWallpaperAssetSuggester assetsFromCandidates:](v56, "assetsFromCandidates:");
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v62 objects:v84 count:16];
      if (!v23) {
        goto LABEL_43;
      }
      uint64_t v24 = *(void *)v63;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v63 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void **)(*((void *)&v62 + 1) + 8 * v25);
          id v27 = (void *)MEMORY[0x1D25FED50]();
          uint64_t v28 = [PGWallpaperQuestion alloc];
          uint64_t v29 = [v26 uuid];
          id v30 = [(PGWallpaperQuestion *)v28 initWithAssetUUID:v29 suggestionSubtype:652];

          if ([(PGSurveyQuestionFactory *)self shouldAddQuestion:v30 toAlreadyGeneratedQuestions:v60])
          {
            v31 = +[PGLogging sharedLogging];
            v32 = [v31 loggingConnection];

            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              PHSuggestionStringWithSubtype();
              id v33 = (id)objc_claimAutoreleasedReturnValue();
              __int16 v34 = [v26 uuid];
              *(_DWORD *)id v82 = 138412546;
              *(void *)v83 = v33;
              *(_WORD *)&v83[8] = 2112;
              *(void *)&v83[10] = v34;
              _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Elected True Positive %@ question with asset %@", v82, 0x16u);
            }
            [v61 addObject:v30];
            if ([v61 count] == a3)
            {
              if (*((unsigned char *)v79 + 24))
              {
                *((unsigned char *)v79 + 24) = 1;
              }
              else
              {
                char v36 = [v55 isCancelledWithProgress:1.0];
                *((unsigned char *)v79 + 24) = v36;
                if ((v36 & 1) == 0)
                {
                  id v57 = v61;
                  int v35 = 1;
                  goto LABEL_37;
                }
              }
              int v35 = 1;
              os_signpost_id_t v37 = MEMORY[0x1E4F14500];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)id v82 = 67109378;
                *(_DWORD *)v83 = 254;
                *(_WORD *)&v83[4] = 2080;
                *(void *)&v83[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
                _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v82, 0x12u);
              }
              id v57 = 0;
            }
            else
            {
              int v35 = 0;
            }
          }
          else
          {
            int v35 = 5;
          }
LABEL_37:

          if (v35 != 5 && v35)
          {

            goto LABEL_45;
          }
          ++v25;
        }
        while (v23 != v25);
        uint64_t v38 = [v22 countByEnumeratingWithState:&v62 objects:v84 count:16];
        uint64_t v23 = v38;
      }
      while (v38);
LABEL_43:

      int v35 = 0;
      *(double *)(v87 + 24) = v17 + *(double *)(v87 + 24);
LABEL_45:

      if (v35)
      {

        goto LABEL_55;
      }
      ++v54;
    }
    while (v54 != v43);
    uint64_t v18 = [obj countByEnumeratingWithState:&v71 objects:v85 count:16];
  }
  while (v18);
LABEL_48:

  if (*((unsigned char *)v79 + 24))
  {
    *((unsigned char *)v79 + 24) = 1;
    goto LABEL_52;
  }
  char v39 = [v48 isCancelledWithProgress:1.0];
  *((unsigned char *)v79 + 24) = v39;
  if (v39)
  {
LABEL_52:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v82 = 67109378;
      *(_DWORD *)v83 = 261;
      *(_WORD *)&v83[4] = 2080;
      *(void *)&v83[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v82, 0x12u);
    }
    id v57 = 0;
  }
  else
  {
    id v57 = v61;
  }
LABEL_55:

  _Block_object_dispose(buf, 8);
LABEL_11:

LABEL_12:
  _Block_object_dispose(&v78, 8);

  return v57;
}

uint64_t __136__PGWallpaperQuestionFactory__generateTruePositivePeopleQuestionWithLimit_suggestionSession_alreadyGeneratedQuestions_progressReporter___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:a3 * 0.5];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v5 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

uint64_t __136__PGWallpaperQuestionFactory__generateTruePositivePeopleQuestionWithLimit_suggestionSession_alreadyGeneratedQuestions_progressReporter___block_invoke_327(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + *(double *)(a1 + 56) * a3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v5 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

- (id)evenlySelectQuestionsByType:(id)a3 limit:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v18 = 0;
  uint64_t v20 = 0;
  unint64_t v7 = 0;
  while (1)
  {
    int v8 = objc_msgSend(v5, "allKeys", v18);
    id v9 = [v8 sortedArrayUsingSelector:sel_compare_];

    char v10 = [v9 objectAtIndexedSubscript:v7];
    id v11 = [v5 objectForKeyedSubscript:v10];
    unint64_t v12 = [v11 anyObject];
    if (v12)
    {
      [v6 addObject:v12];
      [v11 removeObject:v12];
    }
    if ([v11 count]) {
      ++v7;
    }
    else {
      [v5 removeObjectForKey:v10];
    }
    unint64_t v13 = [v5 count];
    switch((unsigned __int16)[v10 unsignedIntValue])
    {
      case 0x28Cu:
        ++v19;
        break;
      case 0x28Du:
        ++v20;
        break;
      case 0x28Eu:
        ++v21;
        break;
      case 0x28Fu:
        ++v22;
        break;
      default:
        break;
    }
    if (objc_msgSend(v6, "count", v19) == a4) {
      break;
    }
    v7 %= v13;
    uint64_t v14 = [v5 count];

    if (!v14) {
      goto LABEL_16;
    }
  }

LABEL_16:
  id v15 = +[PGLogging sharedLogging];
  uint64_t v16 = [v15 loggingConnection];

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219008;
    uint64_t v24 = [v6 count];
    __int16 v25 = 2048;
    uint64_t v26 = v18;
    __int16 v27 = 2048;
    uint64_t v28 = v20;
    __int16 v29 = 2048;
    uint64_t v30 = v21;
    __int16 v31 = 2048;
    uint64_t v32 = v22;
    _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Selected %lu true positive questions. People:%lu, Pet:%lu, Landscape:%lu, Cityscape:%lu", buf, 0x34u);
  }

  return v6;
}

- (id)_generateTruePositiveQuestionsWithLimit:(unint64_t)a3 progressReporter:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v47 = [MEMORY[0x1E4F1CAD0] set];
  unint64_t v7 = +[PGLogging sharedLogging];
  int v8 = [v7 loggingConnection];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)uint64_t v51 = a3;
    _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Generating true positive wallpaper questions with limit: %lu", buf, 0xCu);
  }

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  char v10 = [PGSuggestionSession alloc];
  id v11 = [(PGSurveyQuestionFactory *)self workingContext];
  unint64_t v12 = [(PGSuggestionSession *)v10 initWithProfile:2 workingContext:v11];

  unint64_t v13 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v14 = [v13 loggingConnection];

  os_signpost_id_t v15 = os_signpost_id_generate(v14);
  uint64_t v16 = v14;
  double v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "TruePositiveWallpaperQuestionGeneration", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v46 = mach_absolute_time();
  uint64_t v18 = [v6 childProgressReporterFromStart:0.01 toEnd:0.24];
  uint64_t v19 = [(PGWallpaperQuestionFactory *)self _generateTruePositivePeopleQuestionWithLimit:a3 suggestionSession:v12 alreadyGeneratedQuestions:v9 progressReporter:v18];
  if ([v19 count])
  {
    [v9 unionSet:v19];
    [v48 setObject:v19 forKeyedSubscript:&unk_1F28D14B8];
  }
  if ([v6 isCancelledWithProgress:0.25])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v51 = 112;
      *(_WORD *)&v51[4] = 2080;
      *(void *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    uint64_t v20 = v47;
    id v21 = v47;
  }
  else
  {
    uint64_t v44 = v18;
    id v45 = [v6 childProgressReporterFromStart:0.25 toEnd:0.49];
    uint64_t v22 = -[PGWallpaperQuestionFactory _generateTruePositivePetQuestionWithLimit:suggestionSession:alreadyGeneratedQuestions:progressReporter:](self, "_generateTruePositivePetQuestionWithLimit:suggestionSession:alreadyGeneratedQuestions:progressReporter:", a3, v12, v9);
    if ([v22 count])
    {
      [v9 unionSet:v22];
      [v48 setObject:v22 forKeyedSubscript:&unk_1F28D14D0];
    }
    if ([v6 isCancelledWithProgress:0.5])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)uint64_t v51 = 121;
        *(_WORD *)&v51[4] = 2080;
        *(void *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      uint64_t v20 = v47;
      id v21 = v47;
    }
    else
    {
      int v42 = [v6 childProgressReporterFromStart:0.5 toEnd:0.74];
      uint64_t v43 = v12;
      uint64_t v23 = -[PGWallpaperQuestionFactory _generateTruePositiveLandscapeQuestionWithLimit:suggestionSession:alreadyGeneratedQuestions:progressReporter:](self, "_generateTruePositiveLandscapeQuestionWithLimit:suggestionSession:alreadyGeneratedQuestions:progressReporter:", a3, v12, v9);
      if ([v23 count])
      {
        [v9 unionSet:v23];
        [v48 setObject:v23 forKeyedSubscript:&unk_1F28D14E8];
      }
      if ([v6 isCancelledWithProgress:0.75])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)uint64_t v51 = 130;
          *(_WORD *)&v51[4] = 2080;
          *(void *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        uint64_t v20 = v47;
        id v21 = v47;
      }
      else
      {
        uint64_t v41 = v17;
        uint64_t v40 = [v6 childProgressReporterFromStart:0.75 toEnd:0.99];
        uint64_t v24 = -[PGWallpaperQuestionFactory _generateTruePositiveCityscapeQuestionWithLimit:suggestionSession:alreadyGeneratedQuestions:progressReporter:](self, "_generateTruePositiveCityscapeQuestionWithLimit:suggestionSession:alreadyGeneratedQuestions:progressReporter:", a3, v43, v9);
        if ([v24 count])
        {
          [v9 unionSet:v24];
          [v48 setObject:v24 forKeyedSubscript:&unk_1F28D1500];
        }
        char v39 = v24;
        id v25 = v9;
        if ([v25 count] > a3)
        {
          uint64_t v26 = [(PGWallpaperQuestionFactory *)self evenlySelectQuestionsByType:v48 limit:a3];

          id v25 = (id)v26;
        }
        __int16 v27 = +[PGLogging sharedLogging];
        uint64_t v28 = [v27 loggingConnection];

        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = [v25 count];
          *(_DWORD *)buf = 134217984;
          *(void *)uint64_t v51 = v29;
          _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Generated %lu true positive wallpaper questions.", buf, 0xCu);
        }

        uint64_t v30 = mach_absolute_time();
        uint32_t numer = info.numer;
        uint32_t denom = info.denom;
        uint64_t v33 = v41;
        __int16 v34 = v33;
        if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v34, OS_SIGNPOST_INTERVAL_END, v15, "TruePositiveWallpaperQuestionGeneration", "", buf, 2u);
        }

        uint64_t v20 = v47;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)uint64_t v51 = "TruePositiveWallpaperQuestionGeneration";
          *(_WORD *)&v51[8] = 2048;
          *(double *)&v51[10] = (float)((float)((float)((float)(v30 - v46) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v34, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        int v35 = [v6 isCancelledWithProgress:1.0];
        char v36 = v25;
        if (v35)
        {
          BOOL v37 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
          char v36 = v47;
          if (v37)
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)uint64_t v51 = 148;
            *(_WORD *)&v51[4] = 2080;
            *(void *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            char v36 = v47;
          }
        }
        id v21 = v36;

        double v17 = v41;
      }

      unint64_t v12 = v43;
    }

    uint64_t v18 = v44;
  }

  return v21;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:a4];
  if ([v6 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)int v35 = 58;
      *(_WORD *)&v35[4] = 2080;
      *(void *)&v35[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    unint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    int v8 = [(PGSurveyQuestionFactory *)self workingContext];
    id v9 = [v8 loggingConnection];

    if (a3)
    {
      uint64_t v32 = v9;
      char v10 = v9;
      os_signpost_id_t v11 = os_signpost_id_generate(v10);
      unint64_t v12 = v10;
      unint64_t v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "WallpaperQuestionGeneration", "", buf, 2u);
      }

      mach_timebase_info info = 0;
      mach_timebase_info(&info);
      uint64_t v29 = mach_absolute_time();
      uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
      if (a3 >= 4) {
        unint64_t v15 = 4;
      }
      else {
        unint64_t v15 = a3;
      }
      __int16 v31 = [v6 childProgressReporterFromStart:0.0 toEnd:0.4];
      uint64_t v16 = -[PGWallpaperQuestionFactory _generateTruePositiveQuestionsWithLimit:progressReporter:](self, "_generateTruePositiveQuestionsWithLimit:progressReporter:", v15);
      [v14 unionSet:v16];
      unint64_t v17 = a3 - [v16 count];
      uint64_t v30 = [v6 childProgressReporterFromStart:0.4 toEnd:1.0];
      uint64_t v18 = -[PGWallpaperQuestionFactory _generateQuestionsWithLimit:progressReporter:](self, "_generateQuestionsWithLimit:progressReporter:", v17);
      [v14 unionSet:v18];
      uint64_t v19 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      uint64_t v22 = v13;
      uint64_t v23 = v22;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v23, OS_SIGNPOST_INTERVAL_END, v11, "WallpaperQuestionGeneration", "", buf, 2u);
      }

      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)int v35 = "WallpaperQuestionGeneration";
        *(_WORD *)&v35[8] = 2048;
        *(double *)&v35[10] = (float)((float)((float)((float)(v19 - v29) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if ([v6 isCancelledWithProgress:1.0])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)int v35 = 85;
          *(_WORD *)&v35[4] = 2080;
          *(void *)&v35[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        unint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        uint64_t v24 = +[PGLogging sharedLogging];
        id v25 = [v24 loggingConnection];

        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = [v16 count];
          uint64_t v27 = [v18 count];
          *(_DWORD *)buf = 134218496;
          *(void *)int v35 = v26;
          *(_WORD *)&v35[8] = 2048;
          *(void *)&v35[10] = v27;
          __int16 v36 = 2048;
          unint64_t v37 = a3;
          _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_DEFAULT, "[PGWallpaperQuestionFactory]: Generated %lu true positive, %lu regular wallpaper questions, limit %lu", buf, 0x20u);
        }

        unint64_t v7 = [v14 allObjects];
      }

      id v9 = v32;
    }
    else
    {
      if ([v6 isCancelledWithProgress:1.0]
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)int v35 = 63;
        *(_WORD *)&v35[4] = 2080;
        *(void *)&v35[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Wallpaper/PGWallpaperQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      unint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v7;
}

- (int64_t)questionOptions
{
  return 256;
}

- (unsigned)questionType
{
  return 22;
}

@end