@interface PGTripFoodieMemoryGenerator
- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4;
@end

@implementation PGTripFoodieMemoryGenerator

- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v39 = _Block_copy(v7);
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  uint64_t v52 = 0;
  v53 = (double *)&v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  v8 = +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneName:@"Food" inGraph:v6];
  v38 = [v8 momentNodes];
  +[PGGraphHighlightTypeNodeCollection concludedTripTypeNodesInGraph:v6];
  v37 = v36 = v7;
  v9 = [v37 highlightGroupNodes];
  v10 = (void *)MEMORY[0x1E4F71E88];
  v11 = +[PGGraphHighlightGroupNode momentInHighlight];
  v12 = self;
  v13 = [v10 adjacencyWithSources:v9 relation:v11 targetsClass:v12];

  v14 = [v13 intersectingTargetsWith:v38];

  v15 = +[PGFoodieMemoryGenerator incompatibleMomentNodesInGraph:v6];
  v16 = [v14 subtractingTargetsWith:v15];

  v17 = [(PGMemoryGenerator *)self momentNodesWithBlockedFeatureCache];
  v18 = [v17 momentNodesWithBlockedFeature];

  v19 = [v16 subtractingTargetsWith:v18];

  v20 = [v19 targets];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __83__PGTripFoodieMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke;
  v50[3] = &unk_1E68EEE18;
  id v21 = v8;
  id v51 = v21;
  v22 = [v20 filteredCollectionUsingBlock:v50];

  v23 = [v19 intersectingTargetsWith:v22];

  v24 = [v23 sources];
  unint64_t v25 = [v24 count];

  if (v25)
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v64 = 0;
    *(void *)&long long v65 = &v64;
    *((void *)&v65 + 1) = 0x2020000000;
    uint64_t v66 = 0;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __83__PGTripFoodieMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_235;
    v41[3] = &unk_1E68E8C58;
    v45 = &v64;
    double v48 = 1.0 / (double)v25;
    id v27 = v39;
    uint64_t v49 = 0x3F847AE147AE147BLL;
    v46 = &v52;
    v47 = &v56;
    id v44 = v27;
    v41[4] = self;
    id v42 = v21;
    id v28 = v26;
    id v43 = v28;
    [v23 enumerateTargetsBySourceWithBlock:v41];
    if (*((unsigned char *)v57 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int buf = 67109378;
        int v61 = 77;
        __int16 v62 = 2080;
        v63 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/Memory Generators/CurrentMemoryGenerators/FoodieMemoryGenerators/PGTripFoodieMemoryGenerator.m";
        v29 = MEMORY[0x1E4F14500];
LABEL_5:
        _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
    }
    else
    {
      if (!v27
        || (double Current = CFAbsoluteTimeGetCurrent(), Current - v53[3] < 0.01)
        || (v53[3] = Current,
            char v40 = 0,
            (*((void (**)(id, char *, double))v27 + 2))(v27, &v40, 1.0),
            char v34 = *((unsigned char *)v57 + 24) | v40,
            (*((unsigned char *)v57 + 24) = v34) == 0))
      {
        id v30 = v28;
        goto LABEL_19;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int buf = 67109378;
        int v61 = 78;
        __int16 v62 = 2080;
        v63 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/Memory Generators/CurrentMemoryGenerators/FoodieMemoryGenerators/PGTripFoodieMemoryGenerator.m";
        v29 = MEMORY[0x1E4F14500];
        goto LABEL_5;
      }
    }
    id v30 = (id)MEMORY[0x1E4F1CBF0];
LABEL_19:

    _Block_object_dispose(&v64, 8);
    goto LABEL_20;
  }
  if (v39)
  {
    double v31 = CFAbsoluteTimeGetCurrent();
    if (v31 - v53[3] >= 0.01)
    {
      v53[3] = v31;
      LOBYTE(buf) = 0;
      (*((void (**)(void *, int *, double))v39 + 2))(v39, &buf, 1.0);
      char v32 = *((unsigned char *)v57 + 24) | buf;
      *((unsigned char *)v57 + 24) = v32;
      if (v32)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          uint64_t v64 = 0x2A04000202;
          LOWORD(v65) = 2080;
          *(void *)((char *)&v65 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/FoodieM"
                                          "emoryGenerators/PGTripFoodieMemoryGenerator.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v64, 0x12u);
        }
      }
    }
  }
  id v30 = (id)MEMORY[0x1E4F1CBF0];
LABEL_20:

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  return v30;
}

BOOL __83__PGTripFoodieMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PGGraphEdgeCollection edgesFromNodes:a2 toNodes:*(void *)(a1 + 32)];
  BOOL v3 = (unint64_t)[v2 numberOfRelevantAssets] > 1;

  return v3;
}

void __83__PGTripFoodieMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_235(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(a1 + 88)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 24);
  if (*(void *)(a1 + 56)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8),
        Current - *(double *)(v10 + 24) >= *(double *)(a1 + 96))
    && (*(double *)(v10 + 24) = Current,
        LOBYTE(v32) = 0,
        (*(void (**)(double))(*(void *)(a1 + 56) + 16))(*(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    v11 = [v7 uuids];
    v12 = [v11 anyObject];

    v13 = [*(id *)(a1 + 32) processedScenesAndFacesCache];
    char v14 = [v13 allMomentNodesInCollectionHaveScenesProcessed:v8];

    if (v14)
    {
      v15 = +[PGGraphEdgeCollection edgesFromNodes:v8 toNodes:*(void *)(a1 + 40)];
      if ((unint64_t)[v15 numberOfRelevantAssets] >= 0xD)
      {
        v16 = [PGLocationTripTitleUtility alloc];
        v17 = [v8 temporarySet];
        v18 = [*(id *)(a1 + 32) locationHelper];
        v19 = [(PGLocationTripTitleUtility *)v16 initWithMomentNodes:v17 filterMomentsAndCities:1 locationHelper:v18];

        if ([(PGLocationTripTitleUtility *)v19 tripTitleType] - 3 >= 0xFFFFFFFFFFFFFFFELL)
        {
          v20 = [(PGLocationTripTitleUtility *)v19 usedLocationNodes];
          id v21 = [v20 anyObject];
          v22 = [v21 locationOrAreaNodeCollection];

          v23 = [v22 addressNodes];
          v24 = [v23 momentNodes];
          unint64_t v25 = [v8 collectionByIntersecting:v24];

          if ([v25 count])
          {
            id v26 = [*(id *)(a1 + 40) featureNodeCollection];
            id v27 = [v22 featureNodeCollection];
            id v28 = [v26 collectionByFormingUnionWith:v27];

            v29 = [v7 featureNodeCollection];
            id v30 = [v28 collectionByFormingUnionWith:v29];

            double v31 = [[PGGraphMemory alloc] initWithMemoryCategory:9 memoryCategorySubcategory:6011 momentNodes:v25 featureNodes:v30];
            [*(id *)(a1 + 48) addObject:v31];
          }
          else
          {
            id v30 = [*(id *)(a1 + 32) loggingConnection];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              int v32 = 138412290;
              v33 = v12;
              _os_log_error_impl(&dword_1D1805000, v30, OS_LOG_TYPE_ERROR, "[PGTripFoodieMemoryGenerator] No moment nodes at trip's used location nodes address for trip with uuid %@", (uint8_t *)&v32, 0xCu);
            }
          }

          id v8 = v25;
        }
      }
    }
    else
    {
      v15 = [*(id *)(a1 + 32) loggingConnection];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v32 = 138412290;
        v33 = v12;
        _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[PGTripFoodieMemoryGenerator] Not creating foodie memory for trip with uuid %@, not all moments in trip have scenes processed", (uint8_t *)&v32, 0xCu);
      }
    }
  }
}

@end