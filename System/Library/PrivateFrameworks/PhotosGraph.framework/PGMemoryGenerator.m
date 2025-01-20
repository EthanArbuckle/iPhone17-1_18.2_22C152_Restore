@interface PGMemoryGenerator
+ (int64_t)titleDateMatchingTypeForMemoryCategory:(unint64_t)a3;
- (BOOL)isDebug;
- (BOOL)semanticalDedupingEnabledForCuration;
- (OS_os_log)loggingConnection;
- (PGGraphLocationHelper)locationHelper;
- (PGMemoryController)controller;
- (PGMemoryCurationSession)memoryCurationSession;
- (PGMemoryGenerationContext)memoryGenerationContext;
- (PGMemoryGenerator)initWithController:(id)a3;
- (PGMemoryGenerator)initWithMemoryCurationSession:(id)a3 loggingConnection:(id)a4;
- (PGMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (PGMemoryMomentNodesWithBlockedFeatureCache)momentNodesWithBlockedFeatureCache;
- (PGMemoryProcessedScenesAndFacesCache)processedScenesAndFacesCache;
- (id)_additionalInfoKeywordsForPotentialMemory:(id)a3;
- (id)baseCurationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4;
- (id)chapterTitleGeneratorForTriggeredMemory:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 titleGenerationContext:(id)a6 inGraph:(id)a7;
- (id)defaultTitleGeneratorWithMomentNodes:(id)a3 keyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 category:(unint64_t)a7 creationDate:(id)a8 titleGenerationContext:(id)a9;
- (id)extendedCurationOptionsWithRequiredAssetUUIDs:(id)a3 triggeredMemory:(id)a4;
- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4;
- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4;
- (id)localIdentifiersFromAssets:(id)a3;
- (id)relevantCurationFeederForTriggeredMemory:(id)a3 relevantFeeder:(id)a4 inGraph:(id)a5 allowGuestAsset:(BOOL)a6 progressReporter:(id)a7;
- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)relevantKeyCurationFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (id)uuidsOfRequiredAssetsWithKeyAsset:(id)a3 triggeredMemory:(id)a4 inGraph:(id)a5 progressReporter:(id)a6;
- (unint64_t)durationForCuration;
- (unint64_t)durationForExtendedCuration;
- (void)_enumerateBestScoringPotentialMemoriesInPotentialMemories:(id)a3 withGraph:(id)a4 attemptUpgradesBeforeSorting:(BOOL)a5 usingBlock:(id)a6;
- (void)_enumeratePotentialMemoriesWithGraph:(id)a3 usingBlock:(id)a4;
- (void)addLocalIdentifiersFromAssets:(id)a3 to:(id)a4;
- (void)setIsDebug:(BOOL)a3;
@end

@implementation PGMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryGenerationContext, 0);
  objc_storeStrong((id *)&self->_locationHelper, 0);
  objc_storeStrong((id *)&self->_momentNodesWithBlockedFeatureCache, 0);
  objc_storeStrong((id *)&self->_processedScenesAndFacesCache, 0);
  objc_storeStrong((id *)&self->_memoryCurationSession, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_destroyWeak((id *)&self->_controller);
}

- (PGMemoryGenerationContext)memoryGenerationContext
{
  return self->_memoryGenerationContext;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void)setIsDebug:(BOOL)a3
{
  self->_isDebug = a3;
}

- (BOOL)isDebug
{
  return self->_isDebug;
}

- (PGMemoryController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (PGMemoryController *)WeakRetained;
}

- (id)chapterTitleGeneratorForTriggeredMemory:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 titleGenerationContext:(id)a6 inGraph:(id)a7
{
  return 0;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [v17 memoryMomentNodes];
  v19 = [v18 set];
  uint64_t v20 = [v17 memoryCategory];
  v21 = [v17 creationDate];

  v22 = [(PGMemoryGenerator *)self defaultTitleGeneratorWithMomentNodes:v19 keyAsset:v16 curatedAssets:v15 extendedCuratedAssets:v14 category:v20 creationDate:v21 titleGenerationContext:v13];

  return v22;
}

- (id)extendedCurationOptionsWithRequiredAssetUUIDs:(id)a3 triggeredMemory:(id)a4
{
  id v5 = a3;
  id v6 = [[PGDejunkerDeduperOptions alloc] initForMemories];
  objc_msgSend(v6, "setDoSemanticalDeduping:", -[PGMemoryGenerator semanticalDedupingEnabledForExtendedCuration](self, "semanticalDedupingEnabledForExtendedCuration"));
  [v6 setIdentifiersOfRequiredItems:v5];

  objc_msgSend(v6, "setDuration:", -[PGMemoryGenerator durationForExtendedCuration](self, "durationForExtendedCuration"));
  return v6;
}

- (id)baseCurationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[PGCurationOptions alloc] initWithDuration:[(PGMemoryGenerator *)self durationForCuration]];
  [(PGCurationOptions *)v8 setSemanticalDedupingEnabled:[(PGMemoryGenerator *)self semanticalDedupingEnabledForCuration]];
  [(PGCurationOptions *)v8 setUseDurationBasedCuration:1];
  [(PGCurationOptions *)v8 setFailIfMinimumDurationNotReached:1];
  [(PGCurationOptions *)v8 setSkipCurationIfEligibleItemsFitTargetDuration:1];
  [(PGCurationOptions *)v8 setUuidsOfRequiredAssets:v7];

  [(PGCurationOptions *)v8 setUuidsOfEligibleAssets:v6];
  BOOL v9 = v6 == 0;
  [(PGCurationOptions *)v8 setIdenticalDedupingEnabled:v9];
  [(PGCurationOptions *)v8 setSemanticalDedupingEnabled:v9];
  [(PGCurationOptions *)v8 setMovieDedupingEnabled:v9];
  return v8;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  v4 = objc_alloc_init(PGKeyAssetCurationOptions);
  [(PGKeyAssetCurationOptions *)v4 setIsForMemories:1];
  [(PGKeyAssetCurationOptions *)v4 setWantsGoodSquareCropScore:1];
  return v4;
}

- (id)uuidsOfRequiredAssetsWithKeyAsset:(id)a3 triggeredMemory:(id)a4 inGraph:(id)a5 progressReporter:(id)a6
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [a3 uuid];
  v8 = [v6 setWithObject:v7];

  return v8;
}

- (id)relevantKeyCurationFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  return 0;
}

- (id)relevantCurationFeederForTriggeredMemory:(id)a3 relevantFeeder:(id)a4 inGraph:(id)a5 allowGuestAsset:(BOOL)a6 progressReporter:(id)a7
{
  return 0;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v6 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PGMemoryGenerator *)self memoryCurationSession];
  v12 = [v11 photoLibrary];

  id v13 = [v12 librarySpecificFetchOptions];
  id v14 = (void *)MEMORY[0x1E4F38EE8];
  id v15 = [v10 memoryMomentNodes];

  id v16 = [v15 localIdentifiers];
  id v17 = [v16 allObjects];
  v18 = [v14 fetchAssetCollectionsWithLocalIdentifiers:v17 options:v13];

  v19 = [(PGMemoryGenerator *)self memoryCurationSession];
  uint64_t v20 = [v19 curationManager];
  v21 = [v20 defaultAssetFetchOptionsForMemories];

  [v21 setIncludeGuestAssets:v6];
  v22 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollections:v18 options:v21];
  v23 = [(PGMemoryGenerator *)self memoryCurationSession];
  v24 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v22 memoryCurationSession:v23 graph:v9];

  return v24;
}

- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PGMemoryGenerator *)self controller];
  [v8 setProgressBlock:v6];

  id v9 = [MEMORY[0x1E4F1CA48] array];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PGMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke;
  v12[3] = &unk_1E68EA6C8;
  id v10 = v9;
  id v13 = v10;
  [(PGMemoryGenerator *)self _enumeratePotentialMemoriesWithGraph:v7 usingBlock:v12];

  return v10;
}

uint64_t __73__PGMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (unint64_t)durationForExtendedCuration
{
  return 9;
}

- (BOOL)semanticalDedupingEnabledForCuration
{
  return 1;
}

- (unint64_t)durationForCuration
{
  return 21;
}

- (id)defaultTitleGeneratorWithMomentNodes:(id)a3 keyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 category:(unint64_t)a7 creationDate:(id)a8 titleGenerationContext:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  id v19 = a8;
  uint64_t v20 = [(id)objc_opt_class() titleDateMatchingTypeForMemoryCategory:a7];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v19 duration:0.0];

  uint64_t v22 = [v15 photoLibrary];
  v23 = (void *)v22;
  if (v15 && v22 && [v16 count] && objc_msgSend(v17, "count"))
  {
    v24 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v16 title:0 identifier:0 photoLibrary:v23];
    v25 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v17 title:0 identifier:0 photoLibrary:v23];
    v26 = [[PGTitleGenerator alloc] initWithMomentNodes:v14 referenceDateInterval:v21 keyAsset:v15 curatedAssetCollection:v24 assetCollection:v25 type:v20 titleGenerationContext:v18];
  }
  else
  {
    v26 = [[PGTitleGenerator alloc] initWithMomentNodes:v14 referenceDateInterval:v21 keyAsset:0 curatedAssetCollection:0 assetCollection:0 type:v20 titleGenerationContext:v18];
  }

  return v26;
}

- (void)addLocalIdentifiersFromAssets:(id)a3 to:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) localIdentifier];
        [v6 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)localIdentifiersFromAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "localIdentifier", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_additionalInfoKeywordsForPotentialMemory:(id)a3
{
  return 0;
}

- (void)_enumerateBestScoringPotentialMemoriesInPotentialMemories:(id)a3 withGraph:(id)a4 attemptUpgradesBeforeSorting:(BOOL)a5 usingBlock:(id)a6
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v40 = (void (**)(id, void *, uint8_t *))a6;
  v11 = [(PGMemoryGenerator *)self controller];
  long long v12 = [v11 progressBlock];
  double v13 = 0.0;
  if (!v12 || (double v14 = CFAbsoluteTimeGetCurrent(), v14 < 0.01))
  {
LABEL_7:
    long long v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
    v49[0] = v15;
    id v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
    v49[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];

    id v18 = [v9 sortedArrayUsingDescriptors:v17];
    if (v12)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v13 >= 0.01)
      {
        char v45 = 0;
        ((void (**)(void, char *, double))v12)[2](v12, &v45, 0.5);
        if (v45)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_44:

            goto LABEL_45;
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v47 = 180;
          *(_WORD *)&v47[4] = 2080;
          *(void *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Memories/Memory Generators/PGMemoryGenerator.m";
          uint64_t v20 = MEMORY[0x1E4F14500];
LABEL_40:
          _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_44;
        }
        double v13 = Current;
      }
    }
    v38 = v17;
    unint64_t v21 = [v18 count];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v18;
    uint64_t v22 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    unint64_t v35 = v21;
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = 0;
      uint64_t v25 = *(void *)v42;
      double v26 = (0.0 / (double)v21 + 1.0) * 0.25;
      v36 = v18;
      id v37 = v9;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v42 != v25) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v29 = (void *)MEMORY[0x1D25FED50]();
          if (v12)
          {
            double v30 = CFAbsoluteTimeGetCurrent();
            if (v30 - v13 >= 0.01)
            {
              char v45 = 0;
              ((void (**)(void, char *, double))v12)[2](v12, &v45, 0.5);
              if (v45)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v47 = 187;
                  *(_WORD *)&v47[4] = 2080;
                  *(void *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Memories/Memory Generators/PGMemoryGenerator.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
LABEL_43:
                id v9 = v37;
                uint64_t v17 = v38;

                id v18 = v36;
                goto LABEL_44;
              }
              double v13 = v30;
            }
          }
          char v45 = 0;
          objc_msgSend(v11, "progressBlock", v35);
          v31 = (void (**)(void, void, double))objc_claimAutoreleasedReturnValue();
          ((void (**)(void, char *, double))v31)[2](v31, &v45, v26);

          if (v45) {
            goto LABEL_43;
          }
          v32 = [v28 buildAssetCollectionUsingMemoryController:v11 withMinimumNumberOfAssets:0];
          if (v32)
          {
            [v28 setAssetCollection:v32];
            buf[0] = 0;
            v40[2](v40, v28, buf);
            if (buf[0])
            {

              id v18 = v36;
              id v9 = v37;
              goto LABEL_33;
            }
          }
          else
          {
            v33 = [v11 loggingConnection];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D1805000, v33, OS_LOG_TYPE_ERROR, "Nil asset collection for momentNode, graph is out-of-sync with the photo library.", buf, 2u);
            }

            ++v24;
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
        id v18 = v36;
        id v9 = v37;
        if (v23) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v24 = 0;
    }
LABEL_33:

    v34 = [v11 loggingConnection];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)v47 = v35;
      *(_WORD *)&v47[8] = 2048;
      *(void *)&v47[10] = v24;
      _os_log_impl(&dword_1D1805000, v34, OS_LOG_TYPE_DEFAULT, "Memory Creation Request: Potential Memory Election out of %lu, rejected %lu build failures", buf, 0x16u);
    }

    uint64_t v17 = v38;
    if (!v12) {
      goto LABEL_44;
    }
    if (CFAbsoluteTimeGetCurrent() - v13 < 0.01) {
      goto LABEL_44;
    }
    char v45 = 0;
    ((void (**)(void, char *, double))v12)[2](v12, &v45, 0.5);
    if (!v45 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_44;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v47 = 217;
    *(_WORD *)&v47[4] = 2080;
    *(void *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Memories/Memory Generators/PGMemoryGenerator.m";
    uint64_t v20 = MEMORY[0x1E4F14500];
    goto LABEL_40;
  }
  char v45 = 0;
  ((void (**)(void, char *, double))v12)[2](v12, &v45, 0.5);
  if (!v45)
  {
    double v13 = v14;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v47 = 173;
    *(_WORD *)&v47[4] = 2080;
    *(void *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Memories/Memory Generators/PGMemoryGenerator.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_45:
}

- (void)_enumeratePotentialMemoriesWithGraph:(id)a3 usingBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  PGMethodNotImplentedException(self, a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (PGGraphLocationHelper)locationHelper
{
  locationHelper = self->_locationHelper;
  if (locationHelper)
  {
    id v3 = locationHelper;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    id v5 = [WeakRetained memoryGenerationContext];
    id v3 = [v5 locationHelper];
  }
  return v3;
}

- (PGMemoryMomentNodesWithBlockedFeatureCache)momentNodesWithBlockedFeatureCache
{
  momentNodesWithBlockedFeatureCache = self->_momentNodesWithBlockedFeatureCache;
  if (momentNodesWithBlockedFeatureCache)
  {
    id v3 = momentNodesWithBlockedFeatureCache;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    id v5 = [WeakRetained memoryGenerationContext];
    id v3 = [v5 momentNodesWithBlockedFeatureCache];
  }
  return v3;
}

- (PGMemoryProcessedScenesAndFacesCache)processedScenesAndFacesCache
{
  processedScenesAndFacesCache = self->_processedScenesAndFacesCache;
  if (!processedScenesAndFacesCache)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v6 = [WeakRetained memoryGenerationContext];
      id v7 = [v6 processedScenesAndFacesCache];
    }
    else
    {
      id v8 = [(PGMemoryGenerator *)self memoryCurationSession];
      uint64_t v6 = [v8 photoLibrary];

      id v7 = [[PGMemoryProcessedScenesAndFacesCache alloc] initWithPhotoLibrary:v6];
    }
    id v9 = self->_processedScenesAndFacesCache;
    self->_processedScenesAndFacesCache = v7;

    processedScenesAndFacesCache = self->_processedScenesAndFacesCache;
  }
  return processedScenesAndFacesCache;
}

- (PGMemoryCurationSession)memoryCurationSession
{
  memoryCurationSession = self->_memoryCurationSession;
  if (!memoryCurationSession)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    id v5 = [WeakRetained photoLibrary];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v5];
    id v7 = +[PGGraphLocationHelper inefficientLocationHelper];
    id v8 = [PGMemoryCurationSession alloc];
    id v9 = [WeakRetained curationManager];
    id v10 = [(PGMemoryCurationSession *)v8 initWithCurationManager:v9 photoLibrary:v5 curationContext:v6 locationHelper:v7];
    v11 = self->_memoryCurationSession;
    self->_memoryCurationSession = v10;

    memoryCurationSession = self->_memoryCurationSession;
  }
  return memoryCurationSession;
}

- (PGMemoryGenerator)initWithController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGMemoryGenerator;
  id v5 = [(PGMemoryGenerator *)&v10 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_controller, v4);
    uint64_t v7 = [v4 loggingConnection];
    loggingConnection = v6->_loggingConnection;
    v6->_loggingConnection = (OS_os_log *)v7;
  }
  return v6;
}

- (PGMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PGMemoryGenerator;
  uint64_t v6 = [(PGMemoryGenerator *)&v16 init];
  if (v6)
  {
    uint64_t v7 = [v5 processedScenesAndFacesCache];
    processedScenesAndFacesCache = v6->_processedScenesAndFacesCache;
    v6->_processedScenesAndFacesCache = (PGMemoryProcessedScenesAndFacesCache *)v7;

    uint64_t v9 = [v5 momentNodesWithBlockedFeatureCache];
    momentNodesWithBlockedFeatureCache = v6->_momentNodesWithBlockedFeatureCache;
    v6->_momentNodesWithBlockedFeatureCache = (PGMemoryMomentNodesWithBlockedFeatureCache *)v9;

    uint64_t v11 = [v5 loggingConnection];
    loggingConnection = v6->_loggingConnection;
    v6->_loggingConnection = (OS_os_log *)v11;

    uint64_t v13 = [v5 locationHelper];
    locationHelper = v6->_locationHelper;
    v6->_locationHelper = (PGGraphLocationHelper *)v13;

    objc_storeStrong((id *)&v6->_memoryGenerationContext, a3);
  }

  return v6;
}

- (PGMemoryGenerator)initWithMemoryCurationSession:(id)a3 loggingConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGMemoryGenerator;
  uint64_t v9 = [(PGMemoryGenerator *)&v12 init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_loggingConnection, a4);
    objc_storeStrong((id *)&v10->_memoryCurationSession, a3);
  }

  return v10;
}

+ (int64_t)titleDateMatchingTypeForMemoryCategory:(unint64_t)a3
{
  if (a3 - 202 > 0xB) {
    return 0;
  }
  else {
    return qword_1D1F4F8E0[a3 - 202];
  }
}

@end