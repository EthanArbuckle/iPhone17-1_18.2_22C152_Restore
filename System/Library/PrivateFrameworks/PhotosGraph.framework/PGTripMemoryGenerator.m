@interface PGTripMemoryGenerator
+ (id)tripTypeNodesInGraph:(id)a3;
+ (unint64_t)memoryCategory;
+ (unint64_t)memoryCategorySubcategory;
- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5;
- (id)featuredLocationOrAreaNodesByTripNodeForTripNodes:(id)a3;
- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4;
- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)relevantKeyCurationFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
@end

@implementation PGTripMemoryGenerator

+ (id)tripTypeNodesInGraph:(id)a3
{
  return +[PGGraphHighlightTypeNodeCollection concludedTripTypeNodesInGraph:a3];
}

+ (unint64_t)memoryCategorySubcategory
{
  return 12001;
}

+ (unint64_t)memoryCategory
{
  return 19;
}

- (void).cxx_destruct
{
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  v11 = [a3 memoryFeatureNodes];
  v12 = +[PGGraphNodeCollection subsetInCollection:v11];
  if ([v12 count] == 1)
  {
    v13 = +[PGGraphNodeCollection subsetInCollection:v11];
    v14 = +[PGGraphNodeCollection subsetInCollection:v11];
    uint64_t v15 = [v13 count];
    if (v15 + [v14 count])
    {
      v16 = +[PGGraphNodeCollection subsetInCollection:v11];
      if ([v16 count])
      {
        v18 = [v16 labels];
        uint64_t v19 = [v18 containsObject:@"ShortTrip"];

        v17 = [[PGTripMemoryTitleGenerator alloc] initWithHighlightGroupNodeAsCollection:v12 type:v19 titleGenerationContext:v10];
LABEL_14:

        goto LABEL_15;
      }
      v20 = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22[0]) = 0;
        _os_log_error_impl(&dword_1D1805000, v20, OS_LOG_TYPE_ERROR, "[PGTripMemoryGenerator] No trip type nodes found", (uint8_t *)v22, 2u);
      }
    }
    else
    {
      v16 = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22[0]) = 0;
        _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "[PGTripMemoryGenerator] No location or area nodes found", (uint8_t *)v22, 2u);
      }
    }
    v17 = 0;
    goto LABEL_14;
  }
  v13 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v22[0] = 67109120;
    v22[1] = [v12 count];
    _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGTripMemoryGenerator] One trip highlight group expected, found %d", (uint8_t *)v22, 8u);
  }
  v17 = 0;
LABEL_15:

  return v17;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PGTripMemoryGenerator;
  v11 = [(PGMemoryGenerator *)&v27 relevantFeederForTriggeredMemory:a3 inGraph:v10 allowGuestAsset:v7 progressReporter:a6];
  v12 = [v11 assetFetchResult];
  v13 = (void *)MEMORY[0x1E4F38EB8];
  v14 = [(PGMemoryGenerator *)self memoryCurationSession];
  uint64_t v15 = [v14 curationContext];
  v16 = [v13 clsAllAssetsFromFetchResult:v12 prefetchOptions:22 curationContext:v15];

  if ((unint64_t)[v16 count] > 0xC)
  {
    v26 = +[PGMemoryGeneratorUtils filterImportedAssetsWithoutLocationAndWithoutSceneOrPersonOverlapFromAllAssets:v16 withGraph:v10];
    id v18 = objc_alloc(MEMORY[0x1E4F39150]);
    uint64_t v19 = [v26 allObjects];
    v20 = [v12 photoLibrary];
    v21 = [v12 fetchType];
    v22 = [v12 fetchPropertySets];
    uint64_t v23 = (void *)[v18 initWithObjects:v19 photoLibrary:v20 fetchType:v21 fetchPropertySets:v22 identifier:0 registerIfNeeded:0];

    v24 = [(PGMemoryGenerator *)self memoryCurationSession];
    id v17 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v23 memoryCurationSession:v24 graph:v10];
  }
  else
  {
    id v17 = v11;
  }

  return v17;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PGTripMemoryGenerator;
  v5 = [(PGMemoryGenerator *)&v7 curationOptionsWithRequiredAssetUUIDs:a3 eligibleAssetUUIDs:a4 triggeredMemory:a5];
  [v5 setLastPassMovieAdditionEnabled:1];
  return v5;
}

- (id)relevantKeyCurationFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v6 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = [a3 memoryFeatureNodes];
  v11 = +[PGGraphNodeCollection subsetInCollection:v10];

  if ([v11 count] == 1)
  {
    v12 = [v11 uuids];
    v13 = [(PGMemoryGenerator *)self memoryCurationSession];
    v14 = [v13 curationManager];
    uint64_t v15 = +[PGMemoryGenerationHelper keyAssetFetchResultForHighlightGroupUUIDs:v12 curationManager:v14 allowGuestAsset:v6];

    if ([v15 count])
    {
      v16 = [(PGMemoryGenerator *)self memoryCurationSession];
      id v17 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v15 memoryCurationSession:v16 graph:v9];
    }
    else
    {
      id v18 = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = [v12 anyObject];
        int v21 = 138412290;
        v22 = v20;
        _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "[PGTripMemoryGenerator] No key asset found for trip %@", (uint8_t *)&v21, 0xCu);
      }
      id v17 = 0;
    }
  }
  else
  {
    v12 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v21 = 67109120;
      LODWORD(v22) = [v11 count];
      _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "[PGTripMemoryGenerator] One trip highlight group expected, found %d", (uint8_t *)&v21, 8u);
    }
    id v17 = 0;
  }

  return v17;
}

- (id)featuredLocationOrAreaNodesByTripNodeForTripNodes:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  featuredLocationOrAreaNodesByTripNode = self->_featuredLocationOrAreaNodesByTripNode;
  if (!featuredLocationOrAreaNodesByTripNode)
  {
    v5 = (void *)MEMORY[0x1E4F71F18];
    id v6 = a3;
    objc_super v7 = +[PGGraphHighlightGroupNodeCollection locationFeatureOfHighlightGroup];
    v16[0] = v7;
    v8 = +[PGGraphHighlightGroupNodeCollection areaFeatureOfHighlightGroup];
    v16[1] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    id v10 = [v5 union:v9];

    v11 = (void *)MEMORY[0x1E4F71E88];
    v12 = self;
    v13 = [v11 adjacencyWithSources:v6 relation:v10 targetsClass:v12];

    v14 = self->_featuredLocationOrAreaNodesByTripNode;
    self->_featuredLocationOrAreaNodesByTripNode = v13;

    featuredLocationOrAreaNodesByTripNode = self->_featuredLocationOrAreaNodesByTripNode;
  }
  return featuredLocationOrAreaNodesByTripNode;
}

- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v46 = a4;
  v48 = _Block_copy(v46);
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  char v72 = 0;
  uint64_t v65 = 0;
  v66 = (double *)&v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  v47 = [(id)objc_opt_class() tripTypeNodesInGraph:v6];
  objc_super v7 = (void *)MEMORY[0x1E4F71E88];
  v8 = +[PGGraphHighlightTypeNode highlightGroupOfType];
  id v9 = self;
  id v10 = [v7 adjacencyWithSources:v47 relation:v8 targetsClass:v9];
  v49 = [v10 transposed];

  v11 = [v49 sources];
  unint64_t v12 = [v11 count];
  if (v12)
  {
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v78 = 0;
    *(void *)&long long v79 = &v78;
    *((void *)&v79 + 1) = 0x2020000000;
    uint64_t v80 = 0;
    v13 = (void *)MEMORY[0x1E4F71F18];
    v14 = +[PGGraphHighlightGroupNode highlightOfHighlightGroup];
    v77[0] = v14;
    uint64_t v15 = +[PGGraphHighlightNode momentInHighlight];
    v77[1] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
    v45 = [v13 chain:v16];

    id v17 = (void *)MEMORY[0x1E4F71E88];
    id v18 = self;
    uint64_t v19 = [v17 adjacencyWithSources:v11 relation:v45 targetsClass:v18];

    v20 = [(PGMemoryGenerator *)self momentNodesWithBlockedFeatureCache];
    v44 = [v20 momentNodesWithBlockedFeature];

    int v21 = [(PGMemoryGenerator *)self memoryGenerationContext];
    v43 = [v21 momentNodesAtSensitiveLocationsInGraph:v6];

    v22 = [v19 subtractingTargetsWith:v44];

    uint64_t v23 = [v22 subtractingTargetsWith:v43];

    v24 = [(PGTripMemoryGenerator *)self featuredLocationOrAreaNodesByTripNodeForTripNodes:v11];
    v25 = [v24 sources];

    v26 = [v23 intersectingSourcesWith:v25];

    objc_super v27 = [(PGMemoryGenerator *)self memoryGenerationContext];
    v28 = [v26 targets];
    v29 = [v27 interestingWithAlternateJunkingSubsetFromMomentNodes:v28];

    v30 = [v26 sources];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __77__PGTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke;
    v51[3] = &unk_1E68E6038;
    v60 = &v78;
    double v63 = 1.0 / (double)v12;
    id v31 = v48;
    id v59 = v31;
    v61 = &v65;
    uint64_t v64 = 0x3F847AE147AE147BLL;
    v62 = &v69;
    id v32 = v26;
    id v52 = v32;
    v53 = self;
    id v33 = v29;
    id v54 = v33;
    id v55 = v49;
    id v56 = v6;
    id v57 = v11;
    id v34 = v42;
    id v58 = v34;
    [v30 enumerateUUIDs:v51];

    if (*((unsigned char *)v70 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int buf = 67109378;
        int v74 = 119;
        __int16 v75 = 2080;
        v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/Memory Generators/CurrentMemoryGenerators/TripMemoryGenerators/PGTripMemoryGenerator.m";
        v35 = MEMORY[0x1E4F14500];
LABEL_5:
        _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
    }
    else
    {
      if (!v31
        || (double Current = CFAbsoluteTimeGetCurrent(), Current - v66[3] < 0.01)
        || (v66[3] = Current,
            char v50 = 0,
            (*((void (**)(id, char *, double))v31 + 2))(v31, &v50, 1.0),
            char v40 = *((unsigned char *)v70 + 24) | v50,
            (*((unsigned char *)v70 + 24) = v40) == 0))
      {
        id v36 = v34;
        goto LABEL_19;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int buf = 67109378;
        int v74 = 120;
        __int16 v75 = 2080;
        v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/Memory Generators/CurrentMemoryGenerators/TripMemoryGenerators/PGTripMemoryGenerator.m";
        v35 = MEMORY[0x1E4F14500];
        goto LABEL_5;
      }
    }
    id v36 = (id)MEMORY[0x1E4F1CBF0];
LABEL_19:

    _Block_object_dispose(&v78, 8);
    goto LABEL_20;
  }
  if (v48)
  {
    double v37 = CFAbsoluteTimeGetCurrent();
    if (v37 - v66[3] >= 0.01)
    {
      v66[3] = v37;
      LOBYTE(buf) = 0;
      (*((void (**)(void *, int *, double))v48 + 2))(v48, &buf, 1.0);
      char v38 = *((unsigned char *)v70 + 24) | buf;
      *((unsigned char *)v70 + 24) = v38;
      if (v38)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          uint64_t v78 = 0x4004000202;
          LOWORD(v79) = 2080;
          *(void *)((char *)&v79 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/TripMem"
                                          "oryGenerators/PGTripMemoryGenerator.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v78, 0x12u);
        }
      }
    }
  }
  id v36 = (id)MEMORY[0x1E4F1CBF0];
LABEL_20:

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);

  return v36;
}

void __77__PGTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(double *)(a1 + 120)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                          + 24);
  if (!*(void *)(a1 + 88)
    || (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v9 = *(void *)(*(void *)(a1 + 104) + 8),
        Current - *(double *)(v9 + 24) < *(double *)(a1 + 128))
    || (*(double *)(v9 + 24) = Current,
        LOBYTE(v38) = 0,
        (*(void (**)(double))(*(void *)(a1 + 88) + 16))(*(double *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8)
                                                                                + 24)) == 0))
  {
    id v10 = [*(id *)(a1 + 32) targetsForSourceIdentifier:a2];
    v11 = [*(id *)(a1 + 40) processedScenesAndFacesCache];
    char v12 = [v11 allMomentNodesInCollectionHaveScenesProcessed:v10];

    if (v12)
    {
      char v13 = [*(id *)(a1 + 48) intersectsCollection:v10];
      v14 = *(void **)(a1 + 40);
      if (v13)
      {
        uint64_t v15 = [v14 memoryGenerationContext];
        unint64_t v16 = [v15 numberOfAssetsInExtendedCurationForMomentNodes:v10];

        id v17 = *(void **)(a1 + 40);
        if (v16 > 0xC)
        {
          v22 = [v17 memoryGenerationContext];
          [v22 averageContentScoreForMomentNodes:v10];
          double v24 = v23;

          if (v24 > 0.5)
          {
            id v18 = [*(id *)(a1 + 56) targetsForSourceIdentifier:a2];
            v25 = [PGGraphHighlightGroupNodeCollection alloc];
            uint64_t v26 = *(void *)(a1 + 64);
            objc_super v27 = (void *)[objc_alloc(MEMORY[0x1E4F71E40]) initWithElementIdentifier:a2];
            v28 = [(MAElementCollection *)v25 initWithGraph:v26 elementIdentifiers:v27];

            v29 = [(PGGraphHighlightNodeCollection *)v28 featureNodeCollection];
            v30 = [v18 featureNodeCollection];
            id v31 = [v29 collectionByFormingUnionWith:v30];

            id v32 = [*(id *)(a1 + 40) featuredLocationOrAreaNodesByTripNodeForTripNodes:*(void *)(a1 + 72)];
            id v33 = [v32 targetsForSourceIdentifier:a2];

            id v34 = [v31 collectionByFormingUnionWith:v33];

            v35 = [PGGraphMemory alloc];
            uint64_t v36 = [(id)objc_opt_class() memoryCategory];
            double v37 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:](v35, "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:", v36, [(id)objc_opt_class() memoryCategorySubcategory], v10, v34);
            [*(id *)(a1 + 80) addObject:v37];

            goto LABEL_16;
          }
          id v18 = [*(id *)(a1 + 40) loggingConnection];
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
            goto LABEL_16;
          }
          int v38 = 138412546;
          id v39 = v7;
          __int16 v40 = 2048;
          double v41 = v24;
          uint64_t v19 = "[PGTripMemoryGenerator] Not creating memory for trip with uuid %@, average moment content score not high enough (%f)";
          v20 = v18;
          uint32_t v21 = 22;
          goto LABEL_15;
        }
        id v18 = [v17 loggingConnection];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v38 = 138412546;
          id v39 = v7;
          __int16 v40 = 1024;
          LODWORD(v41) = v16;
          uint64_t v19 = "[PGTripMemoryGenerator] Not creating memory for trip with uuid %@, not enough assets in extended curation (%d)";
          v20 = v18;
          uint32_t v21 = 18;
LABEL_15:
          _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v38, v21);
        }
LABEL_16:

        goto LABEL_17;
      }
      id v18 = [v14 loggingConnection];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      int v38 = 138412290;
      id v39 = v7;
      uint64_t v19 = "[PGTripMemoryGenerator] Not creating memory for trip with uuid %@, no interesting moment nodes found";
    }
    else
    {
      id v18 = [*(id *)(a1 + 40) loggingConnection];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      int v38 = 138412290;
      id v39 = v7;
      uint64_t v19 = "[PGTripMemoryGenerator] Not creating memory for trip with uuid %@, not all moments in trip have scenes processed";
    }
    v20 = v18;
    uint32_t v21 = 12;
    goto LABEL_15;
  }
  *a4 = 1;
LABEL_17:
}

@end