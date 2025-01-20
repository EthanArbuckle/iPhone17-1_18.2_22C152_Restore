@interface PGEarlyMomentsWithPeopleMemoryGenerator
+ (id)earlyMomentNodesByPersonNodeWithPersonNodes:(id)a3;
+ (unint64_t)numberOfPotentialMemoriesForGraph:(id)a3;
- (BOOL)shouldGenerateAllMemories;
- (NSDate)localDate;
- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4;
- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (void)_enumerateEarlyMomentsWithPeopleForLocalDate:(id)a3 withGraph:(id)a4 usingBlock:(id)a5;
- (void)_enumeratePotentialMemoriesWithGraph:(id)a3 usingBlock:(id)a4;
- (void)setLocalDate:(id)a3;
- (void)setShouldGenerateAllMemories:(BOOL)a3;
@end

@implementation PGEarlyMomentsWithPeopleMemoryGenerator

- (void).cxx_destruct
{
}

- (void)setShouldGenerateAllMemories:(BOOL)a3
{
  self->_shouldGenerateAllMemories = a3;
}

- (BOOL)shouldGenerateAllMemories
{
  return self->_shouldGenerateAllMemories;
}

- (void)setLocalDate:(id)a3
{
}

- (NSDate)localDate
{
  return self->_localDate;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v9 = a7;
  id v10 = a3;
  v11 = [v10 memoryFeatureNodes];
  v12 = +[PGGraphNodeCollection subsetInCollection:v11];

  v13 = [v10 memoryMomentNodes];

  v14 = [PGPeopleMemoryTitleGenerator alloc];
  v15 = [v13 temporarySet];
  v16 = [v12 temporarySet];
  v17 = [(PGPeopleMemoryTitleGenerator *)v14 initWithMomentNodes:v15 personNodes:v16 timeTitleOptions:0 type:3 titleGenerationContext:v9];

  return v17;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 memoryFeatureNodes];
  id v9 = +[PGGraphNodeCollection subsetInCollection:v8];

  v13.receiver = self;
  v13.super_class = (Class)PGEarlyMomentsWithPeopleMemoryGenerator;
  id v10 = [(PGMemoryGenerator *)&v13 keyAssetCurationOptionsWithTriggeredMemory:v7 inGraph:v6];

  v11 = [v9 localIdentifiers];
  [v10 setReferencePersonLocalIdentifiers:v11];

  [v10 setMinimumNumberOfReferencePersons:0];
  return v10;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v7 = a5;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  id v54 = a6;
  int v12 = [v54 isCancelledWithProgress:0.0];
  *((unsigned char *)v64 + 24) = v12;
  v52 = v11;
  v53 = v10;
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v69 = 250;
      __int16 v70 = 2080;
      v71 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emory Generators/CurrentMemoryGenerators/PersonMemoryGenerators/PGEarlyMomentsWithPeopleMemoryGenerator.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v13 = 0;
    goto LABEL_38;
  }
  v14 = [v54 childProgressReporterFromStart:0.0 toEnd:0.25];
  v62.receiver = self;
  v62.super_class = (Class)PGEarlyMomentsWithPeopleMemoryGenerator;
  v51 = [(PGMemoryGenerator *)&v62 relevantFeederForTriggeredMemory:v10 inGraph:v11 allowGuestAsset:v7 progressReporter:v14];
  v50 = self;

  if (*((unsigned char *)v64 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v69 = 253;
      __int16 v70 = 2080;
      v71 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emory Generators/CurrentMemoryGenerators/PersonMemoryGenerators/PGEarlyMomentsWithPeopleMemoryGenerator.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v13 = 0;
    goto LABEL_37;
  }
  v15 = [v10 memoryFeatureNodes];
  v49 = +[PGGraphNodeCollection subsetInCollection:v15];

  v16 = [v10 memoryMomentNodes];
  v48 = +[PGGraphEdgeCollection edgesFromNodes:v16 toNodes:v49];

  if (![v48 count])
  {
    v18 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "[PGEarlyMomentsWithPeopleMemoryGenerator] No moment feature edges found", buf, 2u);
    }
    id v13 = 0;
    goto LABEL_36;
  }
  v17 = [v49 localIdentifiers];
  v18 = [v17 anyObject];

  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v20 = [v51 allItems];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (!v21) {
    goto LABEL_21;
  }
  uint64_t v22 = *(void *)v59;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v59 != v22) {
        objc_enumerationMutation(v20);
      }
      v24 = *(void **)(*((void *)&v58 + 1) + 8 * i);
      v25 = [v24 clsPersonLocalIdentifiers];
      if ([v25 containsObject:v18])
      {
      }
      else
      {
        v26 = [v24 clsFaceInformationSummary];
        BOOL v27 = [v26 numberOfFacesIncludingPets] == 0;

        if (!v27) {
          continue;
        }
      }
      [v19 addObject:v24];
    }
    uint64_t v21 = [v20 countByEnumeratingWithState:&v58 objects:v67 count:16];
  }
  while (v21);
LABEL_21:

  id v28 = objc_alloc(MEMORY[0x1E4F39150]);
  v29 = [(PGMemoryGenerator *)v50 memoryCurationSession];
  v30 = [v29 photoLibrary];
  v31 = (void *)MEMORY[0x1E4F1CAD0];
  v32 = [v51 assetFetchOptions];
  v33 = [v32 fetchPropertySets];
  v34 = [v31 setWithArray:v33];
  v35 = (void *)[v28 initWithObjects:v19 photoLibrary:v30 fetchType:0 fetchPropertySets:v34 identifier:0 registerIfNeeded:0];

  v36 = [(PGMemoryGenerator *)v50 memoryCurationSession];
  v37 = [v36 curationManager];
  uint64_t v38 = [(PGMemoryGenerator *)v50 durationForCuration];
  v39 = [v48 allRelevantAssetLocalIdentifiers];
  v40 = [(PGMemoryGenerator *)v50 memoryCurationSession];
  v41 = [v40 curationContext];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __117__PGEarlyMomentsWithPeopleMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke;
  v55[3] = &unk_1E68EBE50;
  v57 = &v63;
  id v42 = v54;
  id v56 = v42;
  v43 = [v37 memoryCuratedAssetsForAssets:v35 duration:v38 withContextualAssetLocalIdentifiers:v39 minimumProportion:v52 graph:v41 curationContext:v55 progressBlock:0.7];

  if (!*((unsigned char *)v64 + 24))
  {
    v44 = [(PGMemoryGenerator *)v50 memoryCurationSession];
    v45 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v43 memoryCurationSession:v44 graph:v52];

    if (*((unsigned char *)v64 + 24))
    {
      *((unsigned char *)v64 + 24) = 1;
    }
    else
    {
      char v46 = [v42 isCancelledWithProgress:1.0];
      *((unsigned char *)v64 + 24) = v46;
      if ((v46 & 1) == 0)
      {
        id v13 = v45;
LABEL_34:

        goto LABEL_35;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v69 = 279;
      __int16 v70 = 2080;
      v71 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emory Generators/CurrentMemoryGenerators/PersonMemoryGenerators/PGEarlyMomentsWithPeopleMemoryGenerator.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v13 = 0;
    goto LABEL_34;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v69 = 275;
    __int16 v70 = 2080;
    v71 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/Mem"
          "ory Generators/CurrentMemoryGenerators/PersonMemoryGenerators/PGEarlyMomentsWithPeopleMemoryGenerator.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v13 = 0;
LABEL_35:

LABEL_36:
LABEL_37:

LABEL_38:
  _Block_object_dispose(&v63, 8);

  return v13;
}

uint64_t __117__PGEarlyMomentsWithPeopleMemoryGenerator_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:a3 * 0.75 + 0.25];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v5 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

- (void)_enumeratePotentialMemoriesWithGraph:(id)a3 usingBlock:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PGMemoryGenerator *)self controller];
  if ([v8 libraryHasEnoughProcessedScenes:1 andProcessedFaces:1])
  {
    id v9 = [(PGEarlyMomentsWithPeopleMemoryGenerator *)self localDate];
    if (v9) {
      [(PGEarlyMomentsWithPeopleMemoryGenerator *)self localDate];
    }
    else {
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    }

    id v11 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    uint64_t v43 = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __91__PGEarlyMomentsWithPeopleMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke;
    v20[3] = &unk_1E68E5038;
    v24 = &v40;
    v25 = &v36;
    v26 = &v32;
    id v12 = v6;
    id v21 = v12;
    id v13 = v8;
    id v22 = v13;
    BOOL v27 = &v28;
    id v14 = v11;
    id v23 = v14;
    [(PGEarlyMomentsWithPeopleMemoryGenerator *)self _enumerateEarlyMomentsWithPeopleForLocalDate:v10 withGraph:v12 usingBlock:v20];
    v15 = [v13 loggingConnection];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v41[3];
      uint64_t v17 = v37[3];
      uint64_t v18 = v33[3];
      uint64_t v19 = v29[3];
      *(_DWORD *)buf = 134219008;
      uint64_t v45 = v16;
      __int16 v46 = 2048;
      uint64_t v47 = v17;
      __int16 v48 = 2048;
      uint64_t v49 = v18;
      __int16 v50 = 2048;
      uint64_t v51 = 0;
      __int16 v52 = 2048;
      uint64_t v53 = v19;
      _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_DEFAULT, "Memory Creation Request: Found %lu, rejected %lu uninteresting, %lu too short, %lu insufficiently faced, %lu blocklisting", buf, 0x34u);
    }

    [(PGMemoryGenerator *)self _enumerateBestScoringPotentialMemoriesInPotentialMemories:v14 withGraph:v12 attemptUpgradesBeforeSorting:0 usingBlock:v7];
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
  }
}

void __91__PGEarlyMomentsWithPeopleMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v44;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(v7);
        }
        if (([*(id *)(*((void *)&v43 + 1) + 8 * i) isInterestingForMemories] & 1) == 0)
        {
          ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

          goto LABEL_36;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (!v13)
  {

LABEL_21:
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    goto LABEL_36;
  }
  uint64_t v14 = v13;
  unint64_t v15 = 0;
  uint64_t v16 = *(void *)v40;
  do
  {
    for (uint64_t j = 0; j != v14; ++j)
    {
      if (*(void *)v40 != v16) {
        objc_enumerationMutation(v12);
      }
      v15 += [*(id *)(*((void *)&v39 + 1) + 8 * j) numberOfAssets];
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v48 count:16];
  }
  while (v14);

  if (v15 <= 0xC) {
    goto LABEL_21;
  }
  uint64_t v18 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithArray:v12 graph:*(void *)(a1 + 32)];
  uint64_t v19 = [v6 collection];
  v20 = +[PGGraphEdgeCollection edgesFromNodes:v18 toNodes:v19];
  if ((unint64_t)[v20 numberOfRelevantAssets] > 8)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v21 = (PGPotentialEarlyMomentsWithPeopleMemory *)v12;
    uint64_t v22 = [(PGPotentialEarlyMomentsWithPeopleMemory *)v21 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v36;
      while (2)
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v21);
          }
          if (objc_msgSend(*(id *)(a1 + 40), "anyBlockedFeatureIsHitByEvent:", *(void *)(*((void *)&v35 + 1) + 8 * k), (void)v35))
          {
            ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
            goto LABEL_34;
          }
        }
        uint64_t v23 = [(PGPotentialEarlyMomentsWithPeopleMemory *)v21 countByEnumeratingWithState:&v35 objects:v47 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }

    v26 = [PGPotentialEarlyMomentsWithPeopleMemory alloc];
    BOOL v27 = [MEMORY[0x1E4F1CAD0] setWithArray:v21];
    uint64_t v28 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    id v21 = [(PGPotentialEarlyMomentsWithPeopleMemory *)v26 initWithMomentNodes:v27 personNodes:v28];

    [v6 personScore];
    -[PGPotentialMemory setScore:](v21, "setScore:", v29 + (double)(unint64_t)[v6 numberOfMomentNodes] * 0.01);
    uint64_t v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = +[PGFeature featureWithType:3 node:v6];
    uint64_t v32 = [v30 setWithObject:v31];
    [(PGPotentialMemory *)v21 setFeatures:v32];

    [(PGPotentialMemory *)v21 computeContentScore];
    v33 = [v6 localIdentifier];
    if ([v33 length])
    {
      uint64_t v34 = [MEMORY[0x1E4F1CAD0] setWithObject:v33];
      [(PGPotentialMemory *)v21 setPeopleUUIDs:v34];
    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v21, (void)v35);

LABEL_34:
  }
  else
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  }

LABEL_36:
}

- (void)_enumerateEarlyMomentsWithPeopleForLocalDate:(id)a3 withGraph:(id)a4 usingBlock:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v44 = (void (**)(id, id, uint64_t, unsigned __int8 *))a5;
  long long v43 = v8;
  if ([(PGEarlyMomentsWithPeopleMemoryGenerator *)self shouldGenerateAllMemories])
  {
    uint64_t v10 = [v9 momentNodes];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F76C68] monthFromDate:v8];
    uint64_t v12 = [MEMORY[0x1E4F76C68] weekOfMonthFromDate:v8];
    uint64_t v13 = [v9 dateNodesForMonth:v11];
    uint64_t v14 = [v9 dateNodesForWeekOfMonth:v12];
    unint64_t v15 = [MEMORY[0x1E4F1CA80] setWithSet:v14];
    [v15 intersectSet:v13];
    uint64_t v16 = [(MAElementCollection *)[PGGraphDateNodeCollection alloc] initWithSet:v15 graph:v9];
    uint64_t v10 = [(PGGraphDateNodeCollection *)v16 momentNodes];
  }
  uint64_t v17 = [v10 personNodes];
  uint64_t v18 = [v9 meNodeCollection];
  uint64_t v19 = [v17 collectionBySubtracting:v18];

  v20 = [(PGMemoryGenerator *)self memoryGenerationContext];
  long long v42 = v9;
  id v21 = [v20 momentNodesAtSensitiveLocationsInGraph:v9];

  unsigned __int8 v60 = 0;
  long long v41 = (void *)v19;
  [(id)objc_opt_class() earlyMomentNodesByPersonNodeWithPersonNodes:v19];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v47 = [v22 countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v47)
  {
    id v45 = v22;
    uint64_t v46 = *(void *)v57;
    while (2)
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v57 != v46) {
          objc_enumerationMutation(v22);
        }
        uint64_t v24 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        v25 = [v22 objectForKey:v24];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v52 objects:v62 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = 0;
          uint64_t v30 = *(void *)v53;
          while (2)
          {
            uint64_t v31 = 0;
            uint64_t v32 = v29 + v28;
            do
            {
              if (*(void *)v53 != v30) {
                objc_enumerationMutation(v26);
              }
              if (![v10 containsNode:*(void *)(*((void *)&v52 + 1) + 8 * v31)])
              {
                uint64_t v32 = v29 + v31;
                goto LABEL_19;
              }
              ++v31;
            }
            while (v28 != v31);
            uint64_t v28 = [v26 countByEnumeratingWithState:&v52 objects:v62 count:16];
            uint64_t v29 = v32;
            if (v28) {
              continue;
            }
            break;
          }
LABEL_19:

          if (v32)
          {
            if (v32 != [v26 count])
            {
              uint64_t v33 = objc_msgSend(v26, "subarrayWithRange:", 0, v32);

              id v26 = (id)v33;
            }
            id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            id v26 = v26;
            uint64_t v35 = [v26 countByEnumeratingWithState:&v48 objects:v61 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v49;
              do
              {
                for (uint64_t j = 0; j != v36; ++j)
                {
                  if (*(void *)v49 != v37) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t v39 = *(void *)(*((void *)&v48 + 1) + 8 * j);
                  if (([v21 containsNode:v39] & 1) == 0) {
                    [v34 addObject:v39];
                  }
                }
                uint64_t v36 = [v26 countByEnumeratingWithState:&v48 objects:v61 count:16];
              }
              while (v36);
            }

            v44[2](v44, v34, v24, &v60);
            int v40 = v60;

            if (v40)
            {

              id v22 = v45;
              goto LABEL_38;
            }
          }
          id v22 = v45;
        }
        else
        {
        }
      }
      uint64_t v47 = [v22 countByEnumeratingWithState:&v56 objects:v63 count:16];
      if (v47) {
        continue;
      }
      break;
    }
  }
LABEL_38:
}

+ (id)earlyMomentNodesByPersonNodeWithPersonNodes:(id)a3
{
  id v3 = a3;
  v4 = [v3 socialGroupNodes];
  id v5 = [v4 personNodes];
  id v6 = [v5 collectionByIntersecting:v3];

  id v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__PGEarlyMomentsWithPeopleMemoryGenerator_earlyMomentNodesByPersonNodeWithPersonNodes___block_invoke;
  v10[3] = &unk_1E68E5010;
  id v8 = v7;
  id v11 = v8;
  [v6 enumerateIdentifiersAsCollectionsWithBlock:v10];

  return v8;
}

void __87__PGEarlyMomentsWithPeopleMemoryGenerator_earlyMomentNodesByPersonNodeWithPersonNodes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 featureNodeCollection];
  id v6 = [v5 momentNodes];

  id v7 = [v6 interestingSubset];

  id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  v31[0] = v8;
  id v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalEndDate" ascending:1];
  v31[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  v31[2] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];

  uint64_t v12 = [v7 sortedArrayUsingDescriptors:v11];

  uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    double v18 = 0.0;
LABEL_3:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v27 != v17) {
        objc_enumerationMutation(v14);
      }
      v20 = *(void **)(*((void *)&v26 + 1) + 8 * v19);
      if ((unint64_t)objc_msgSend(v20, "totalNumberOfPersons", (void)v26) <= 0x13)
      {
        [v20 timestampUTCStart];
        double v22 = v21;
        if (v18 != 0.0)
        {
          double v21 = v21 - v18;
          BOOL v23 = v22 - v18 <= 15552000.0;
          double v22 = v18;
          if (!v23) {
            break;
          }
        }
        objc_msgSend(v13, "addObject:", v20, v21);
        double v18 = v22;
        if ((unint64_t)[v13 count] > 4) {
          break;
        }
      }
      if (v16 == ++v19)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v16) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if ([v13 count])
  {
    uint64_t v24 = *(void **)(a1 + 32);
    v25 = [v4 anyNode];
    [v24 setObject:v13 forKey:v25];
  }
}

+ (unint64_t)numberOfPotentialMemoriesForGraph:(id)a3
{
  id v4 = +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:a3];
  id v5 = [a1 earlyMomentNodesByPersonNodeWithPersonNodes:v4];
  unint64_t v6 = [v5 count];

  return v6;
}

@end