@interface PGRecurrentTripMemoryGenerator
- (id)chapterTitleGeneratorForTriggeredMemory:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 titleGenerationContext:(id)a6 inGraph:(id)a7;
- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4;
- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)relevantKeyCurationFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
@end

@implementation PGRecurrentTripMemoryGenerator

- (id)chapterTitleGeneratorForTriggeredMemory:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 titleGenerationContext:(id)a6 inGraph:(id)a7
{
  id v7 = a3;
  v8 = [v7 memoryMomentNodes];
  v9 = [v8 dateNodes];
  v10 = [v9 yearNodes];
  unint64_t v11 = [v10 count];

  if (v11 < 2) {
    v12 = 0;
  }
  else {
    v12 = [[PGYearChapterTitleGenerator alloc] initWithTriggeredMemory:v7];
  }

  return v12;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v9 = a7;
  v10 = [a3 memoryFeatureNodes];
  unint64_t v11 = +[PGGraphNodeCollection subsetInCollection:v10];

  v12 = [PGRecurrentTripMemoryTitleGenerator alloc];
  v13 = [v11 temporarySet];
  v14 = [(PGRecurrentTripMemoryTitleGenerator *)v12 initWithLocationNodes:v13 titleGenerationContext:v9];

  return v14;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [v9 memoryFeatureNodes];
  v13 = +[PGGraphNodeCollection subsetInCollection:v12];

  if ([v13 count] == 1)
  {
    v14 = [v9 memoryMomentNodes];
    v15 = [v13 anyNode];
    v16 = [(PGMemoryGenerator *)self memoryCurationSession];
    v17 = [v16 curationManager];
    v18 = +[PGMemoryGenerationHelper assetFetchResultForMomentNodes:v14 inLocationOrAreaNode:v15 requireInteresting:0 curationManager:v17 progressReporter:v11];

    v19 = [(PGMemoryGenerator *)self memoryCurationSession];
    v20 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v18 memoryCurationSession:v19 graph:v10];
  }
  else
  {
    v21 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23[0] = 67109120;
      v23[1] = [v13 count];
      _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "[PGRecurrentTripMemoryGenerator] One location node expected, found %d", (uint8_t *)v23, 8u);
    }

    v20 = 0;
  }

  return v20;
}

- (id)relevantKeyCurationFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v6 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = [v9 memoryFeatureNodes];
  v12 = +[PGGraphNodeCollection subsetInCollection:v11];

  if ([v12 count])
  {
    v13 = [v12 uuids];
    v14 = [(PGMemoryGenerator *)self memoryCurationSession];
    v15 = [v14 curationManager];
    v16 = +[PGMemoryGenerationHelper keyAssetFetchResultForHighlightGroupUUIDs:v13 curationManager:v15 allowGuestAsset:v6];

    if ([v16 count])
    {
      id v38 = v10;
      v17 = (void *)MEMORY[0x1E4F38EB8];
      v18 = [(PGMemoryGenerator *)self memoryCurationSession];
      v19 = [v18 curationContext];
      v20 = [v17 clsAllAssetsFromFetchResult:v16 prefetchOptions:16 curationContext:v19];

      v21 = [v9 memoryFeatureNodes];
      v22 = +[PGGraphNodeCollection subsetInCollection:v21];
      if ([v22 count])
      {
        v23 = [v9 memoryMomentNodes];
        uint64_t v24 = +[PGCurationManager filterAssets:v20 inMomentNodes:v23 forLocationNodes:v22 withMaximumDistance:5000.0];

        if ([v24 count])
        {
          id v25 = objc_alloc(MEMORY[0x1E4F39150]);
          v26 = [v16 photoLibrary];
          [v16 fetchType];
          v27 = v37 = v21;
          [v16 fetchPropertySets];
          v36 = v22;
          v29 = v28 = v24;
          v30 = (void *)[v25 initWithObjects:v28 photoLibrary:v26 fetchType:v27 fetchPropertySets:v29 identifier:0 registerIfNeeded:0];

          v31 = [(PGMemoryGenerator *)self memoryCurationSession];
          v21 = v37;
          id v10 = v38;
          v32 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v30 memoryCurationSession:v31 graph:v38];

          v20 = v28;
          v22 = v36;
        }
        else
        {
          v34 = [(PGMemoryGenerator *)self loggingConnection];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1805000, v34, OS_LOG_TYPE_ERROR, "[PGRecurrentTripMemoryGenerator] No key assets found in locations featured by Recurrent Trip memory.", buf, 2u);
          }

          v32 = 0;
          v20 = v24;
          id v10 = v38;
        }
      }
      else
      {
        v33 = [(PGMemoryGenerator *)self loggingConnection];
        id v10 = v38;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1805000, v33, OS_LOG_TYPE_ERROR, "[PGRecurrentTripMemoryGenerator] Location nodes expected in memory features, found none.", buf, 2u);
        }

        v32 = 0;
      }
    }
    else
    {
      v20 = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v13;
        _os_log_error_impl(&dword_1D1805000, v20, OS_LOG_TYPE_ERROR, "[PGRecurrentTripMemoryGenerator] No key assets found for trips %@", buf, 0xCu);
      }
      v32 = 0;
    }
  }
  else
  {
    v13 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGRecurrentTripMemoryGenerator] Highlight group nodes expected in features, found none", buf, 2u);
    }
    v32 = 0;
  }

  return v32;
}

- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v35 = a4;
  BOOL v6 = _Block_copy(v35);
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 0;
  uint64_t v64 = 0;
  v65 = (double *)&v64;
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = 0;
  if (!v6
    || (double v7 = CFAbsoluteTimeGetCurrent(), v7 - v65[3] < 0.01)
    || (v65[3] = v7,
        LOBYTE(v60) = 0,
        (*((void (**)(void *, uint64_t *, double))v6 + 2))(v6, &v60, 0.0),
        char v8 = *((unsigned char *)v69 + 24) | v60,
        (*((unsigned char *)v69 + 24) = v8) == 0))
  {
    uint64_t buf = 0;
    *(void *)&long long v75 = &buf;
    *((void *)&v75 + 1) = 0x2020000000;
    uint64_t v76 = 0;
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x2020000000;
    uint64_t v63 = 0;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v34 = +[PGGraphHighlightTypeNodeCollection concludedTripTypeNodesInGraph:v38];
    v37 = [v34 highlightGroupNodes];
    id v11 = (void *)MEMORY[0x1E4F71E88];
    v12 = +[PGGraphHighlightGroupNode momentInHighlight];
    v13 = self;
    v14 = [v11 adjacencyWithSources:v37 relation:v12 targetsClass:v13];

    v15 = [(PGMemoryGenerator *)self memoryGenerationContext];
    v36 = [v15 momentNodesAtSensitiveLocationsInGraph:v38];

    v16 = [v14 subtractingTargetsWith:v36];

    v17 = [(PGMemoryGenerator *)self locationHelper];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __86__PGRecurrentTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke;
    v53[3] = &unk_1E68EAC28;
    id v18 = v17;
    id v54 = v18;
    id v19 = v10;
    id v55 = v19;
    id v20 = v6;
    id v56 = v20;
    v57 = &v64;
    v58 = &v68;
    uint64_t v59 = 0x3F847AE147AE147BLL;
    [v16 enumerateTargetsBySourceWithBlock:v53];
    if (*((unsigned char *)v69 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v72 = 67109378;
        LODWORD(v73[0]) = 71;
        WORD2(v73[0]) = 2080;
        *(void *)((char *)v73 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/TripMemoryGen"
                                       "erators/PGRecurrentTripMemoryGenerator.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v72, 0x12u);
      }
      id v9 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_25;
    }
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v22 = [(PGMemoryGenerator *)self momentNodesWithBlockedFeatureCache];
    v23 = [v22 momentNodesWithBlockedFeature];

    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __86__PGRecurrentTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_263;
    v40[3] = &unk_1E68EAC78;
    id v24 = v20;
    id v47 = v24;
    v48 = &v64;
    uint64_t v52 = 0x3F847AE147AE147BLL;
    v49 = &v68;
    id v41 = v18;
    id v42 = v16;
    id v25 = v23;
    id v43 = v25;
    v44 = self;
    p_uint64_t buf = &buf;
    id v45 = v38;
    v51 = &v60;
    id v33 = v21;
    id v46 = v33;
    [v19 enumerateKeysAndObjectsUsingBlock:v40];
    if (*((unsigned char *)v69 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v72 = 67109378;
        LODWORD(v73[0]) = 128;
        WORD2(v73[0]) = 2080;
        *(void *)((char *)v73 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/TripMemoryGen"
                                       "erators/PGRecurrentTripMemoryGenerator.m";
        v26 = MEMORY[0x1E4F14500];
LABEL_14:
        _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v72, 0x12u);
      }
    }
    else
    {
      v27 = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = *(void *)(v75 + 24);
        uint64_t v29 = v61[3];
        int v72 = 134218240;
        v73[0] = v28;
        LOWORD(v73[1]) = 2048;
        *(void *)((char *)&v73[1] + 2) = v29;
        _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_DEFAULT, "Memory Creation Request: %lu not interesting, %lu no scenes processed", (uint8_t *)&v72, 0x16u);
      }

      if (!v6
        || (double Current = CFAbsoluteTimeGetCurrent(), Current - v65[3] < 0.01)
        || (v65[3] = Current,
            char v39 = 0,
            (*((void (**)(id, char *, double))v24 + 2))(v24, &v39, 1.0),
            char v31 = *((unsigned char *)v69 + 24) | v39,
            (*((unsigned char *)v69 + 24) = v31) == 0))
      {
        id v9 = v33;
        goto LABEL_24;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v72 = 67109378;
        LODWORD(v73[0]) = 132;
        WORD2(v73[0]) = 2080;
        *(void *)((char *)v73 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/TripMemoryGen"
                                       "erators/PGRecurrentTripMemoryGenerator.m";
        v26 = MEMORY[0x1E4F14500];
        goto LABEL_14;
      }
    }
    id v9 = (id)MEMORY[0x1E4F1CBF0];
LABEL_24:

LABEL_25:
    _Block_object_dispose(&v60, 8);
    _Block_object_dispose(&buf, 8);
    goto LABEL_26;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 0x2104000202;
    LOWORD(v75) = 2080;
    *(void *)((char *)&v75 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/TripMemoryGenerator"
                                    "s/PGRecurrentTripMemoryGenerator.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  id v9 = (id)MEMORY[0x1E4F1CBF0];
LABEL_26:
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);

  return v9;
}

void __86__PGRecurrentTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v31 = a2;
  id v6 = a3;
  double v7 = *(void **)(a1 + 32);
  char v8 = [v6 temporaryArray];
  id v9 = [v7 relevantLocationNodesForMomentNodes:v8 applyDensestCloseLocationNode:0];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    id v30 = v6;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v15 = *(void **)(a1 + 32);
        v16 = [v14 locationNodeCollection];
        v17 = [v15 addressNodesFromLocationNodes:v16];

        id v18 = [*(id *)(a1 + 32) momentNodesByAddressNode];
        id v19 = [v18 targetsForSources:v17];

        id v20 = [v19 collectionByIntersecting:v6];
        uint64_t v21 = [v20 count];
        if ([v6 count] <= (unint64_t)(2 * v21))
        {
          v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:v14];
          v23 = v22;
          if (v22)
          {
            [v22 collectionByFormingUnionWith:v31];
            uint64_t v24 = v11;
            v26 = uint64_t v25 = v12;
            [*(id *)(a1 + 40) setObject:v26 forKeyedSubscript:v14];

            uint64_t v12 = v25;
            uint64_t v11 = v24;
            id v6 = v30;
          }
          else
          {
            [*(id *)(a1 + 40) setObject:v31 forKeyedSubscript:v14];
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v11);
  }

  if (*(void *)(a1 + 48))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
    if (Current - *(double *)(v28 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v28 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 48) + 16))(0.25);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        *a4 = 1;
      }
    }
  }
}

void __86__PGRecurrentTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_263(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1D25FED50]();
  if (*(void *)(a1 + 80)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v11 = *(void *)(*(void *)(a1 + 88) + 8),
        Current - *(double *)(v11 + 24) >= *(double *)(a1 + 120))
    && (*(double *)(v11 + 24) = Current,
        char v41 = 0,
        (*(void (**)(double))(*(void *)(a1 + 80) + 16))(0.5),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else if ((unint64_t)[v8 count] >= 3)
  {
    uint64_t v12 = *(void **)(a1 + 32);
    v13 = [v7 locationNodeCollection];
    v14 = [v12 addressNodesFromLocationNodes:v13];

    v15 = [*(id *)(a1 + 32) momentNodesByAddressNode];
    v16 = [v15 targetsForSources:v14];

    id v17 = objc_alloc_init(MEMORY[0x1E4F71E60]);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __86__PGRecurrentTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_2;
    v35[3] = &unk_1E68EAC50;
    id v36 = *(id *)(a1 + 40);
    id v18 = v16;
    id v37 = v18;
    id v19 = *(id *)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 56);
    id v38 = v19;
    uint64_t v39 = v20;
    id v21 = v17;
    id v40 = v21;
    v22 = [v8 filteredCollectionUsingBlock:v35];
    if ((unint64_t)[v22 count] > 2)
    {
      v23 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithGraph:*(void *)(a1 + 64) elementIdentifiers:v21];
      uint64_t v24 = [(PGGraphMomentNodeCollection *)v23 universalDateInterval];
      [v24 duration];
      double v26 = v25;

      if (v26 >= 31557600.0)
      {
        long long v34 = v14;
        v27 = [*(id *)(a1 + 56) processedScenesAndFacesCache];
        char v28 = [v27 allMomentNodesInCollectionHaveScenesProcessed:v23];

        if (v28)
        {
          uint64_t v29 = [v22 featureNodeCollection];
          v32 = [v7 locationNodeCollection];
          id v30 = [v32 featureNodeCollection];
          long long v33 = [v29 collectionByFormingUnionWith:v30];

          id v31 = [[PGGraphMemory alloc] initWithMemoryCategory:18 memoryCategorySubcategory:12002 momentNodes:v23 featureNodes:v33];
          [*(id *)(a1 + 72) addObject:v31];
        }
        else
        {
          ++*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
        }
        v14 = v34;
      }
    }
    else
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
    }
  }
}

BOOL __86__PGRecurrentTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) targetsForSources:a2];
  v4 = [*(id *)(a1 + 40) collectionByIntersecting:v3];
  v5 = [v4 collectionBySubtracting:*(void *)(a1 + 48)];

  id v6 = [*(id *)(a1 + 56) memoryGenerationContext];
  id v7 = [v6 interestingForMemoriesSubsetFromMomentNodes:v5];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v9 = *(void **)(a1 + 64);
    uint64_t v10 = [v5 elementIdentifiers];
    [v9 unionWithIdentifierSet:v10];
  }
  return v8 != 0;
}

@end