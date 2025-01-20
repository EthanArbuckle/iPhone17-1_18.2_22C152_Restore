@interface PGLastMonthAtHomeMemoryGenerator
+ (id)lastMonthAtHomeMemoriesForMonth:(int64_t)a3 year:(int64_t)a4 inGraph:(id)a5 momentNodesWithBlockedFeatureCache:(id)a6 photoLibrary:(id)a7 loggingConnection:(id)a8 progressReporter:(id)a9;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
@end

@implementation PGLastMonthAtHomeMemoryGenerator

+ (id)lastMonthAtHomeMemoriesForMonth:(int64_t)a3 year:(int64_t)a4 inGraph:(id)a5 momentNodesWithBlockedFeatureCache:(id)a6 photoLibrary:(id)a7 loggingConnection:(id)a8 progressReporter:(id)a9
{
  v65[2] = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = a8;
  id v18 = a9;
  if (v16)
  {
    v19 = [[PGMemoryProcessedScenesAndFacesCache alloc] initWithPhotoLibrary:v16];
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "[PGLastMonthAtHomeMemoryGenerator] +lastMonthAtHomeMemoriesForMonth: was passed in a nil photoLibrary, not checking if moments have their scenes processed.", buf, 2u);
    }
    v19 = 0;
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21 = +[PGGraphNodeCollection nodesInGraph:v14];
  if ([v21 count])
  {
    int64_t v55 = a3;
    v22 = [v21 homeNodes];
    if ([v22 count])
    {
      v53 = v19;
      id v54 = v18;
      v52 = v15;
      v23 = +[PGGraphMonthNodeCollection monthNodesForMonth:v55 inGraph:v14];
      v24 = +[PGGraphYearNodeCollection yearNodesForYear:a4 inGraph:v14];
      v51 = v23;
      v25 = [v23 dateNodes];
      v50 = v24;
      v26 = [v24 dateNodes];
      v27 = [v25 collectionByIntersecting:v26];

      v49 = v27;
      [v27 momentNodes];
      uint64_t v28 = v46 = v14;
      v29 = (void *)MEMORY[0x1E4F71F18];
      v30 = +[PGGraphMomentNode addressOfMoment];
      v65[0] = v30;
      +[PGGraphAddressNode homeOfAddress];
      v31 = int v45 = a4;
      v65[1] = v31;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
      uint64_t v33 = [v29 chain:v32];

      v47 = (void *)v33;
      v48 = (void *)v28;
      v34 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v28 relation:v33 targetsClass:objc_opt_class()];
      v35 = [v34 intersectingTargetsWith:v22];

      if ([v35 sourcesCount])
      {
        id v14 = v46;
        v36 = [v52 momentNodesWithBlockedFeatureInGraph:v46 progressReporter:v54];
        [v35 subtractingSourcesWith:v36];
        v37 = id v56 = v16;

        v38 = [v37 transposed];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __164__PGLastMonthAtHomeMemoryGenerator_lastMonthAtHomeMemoriesForMonth_year_inGraph_momentNodesWithBlockedFeatureCache_photoLibrary_loggingConnection_progressReporter___block_invoke;
        v57[3] = &unk_1E68E8DC0;
        v19 = v53;
        v58 = v53;
        id v39 = v20;
        id v59 = v39;
        v60 = v17;
        [v38 enumerateTargetsBySourceWithBlock:v57];

        id v40 = v39;
        id v15 = v52;

        v35 = v37;
        id v18 = v54;
        id v16 = v56;
      }
      else
      {
        id v14 = v46;
        id v15 = v52;
        id v18 = v54;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109376;
          int v62 = v55;
          __int16 v63 = 1024;
          int v64 = v45;
          _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "[PGLastMonthAtHomeMemoryGenerator] No moments detected at home in month: %d year: %d", buf, 0xEu);
        }
        id v43 = v20;
        v19 = v53;
      }
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "[PGLastMonthAtHomeMemoryGenerator] No home nodes found for me node. Not generating last month at home memories.", buf, 2u);
      }
      id v42 = v20;
    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "[PGLastMonthAtHomeMemoryGenerator] No me node found in graph. Not generating last month at home memories.", buf, 2u);
    }
    id v41 = v20;
  }

  return v20;
}

void __164__PGLastMonthAtHomeMemoryGenerator_lastMonthAtHomeMemoriesForMonth_year_inGraph_momentNodesWithBlockedFeatureCache_photoLibrary_loggingConnection_progressReporter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 interestingWithAlternateJunkingSubset];
  v8 = [v6 collectionByIntersecting:v7];
  unint64_t v9 = [v8 count];

  if (v9 < 2)
  {
    id v14 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = v14;
      v17[0] = 67109632;
      v17[1] = v9;
      __int16 v18 = 1024;
      int v19 = [v6 count];
      __int16 v20 = 1024;
      int v21 = 2;
      _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[PGLastMonthAtHomeMemoryGenerator] Only %d interesting moments out of %d for home node, but excepted at least %d. Not generating memory.", (uint8_t *)v17, 0x14u);
    }
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    if (v10 && ![v10 allMomentNodesInCollectionHaveScenesProcessed:v6])
    {
      id v16 = *(NSObject **)(a1 + 48);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17[0]) = 0;
        _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "[PGLastMonthAtHomeMemoryGenerator] Not all moments for home node have scenes processed, not generating memory.", (uint8_t *)v17, 2u);
      }
    }
    else
    {
      v11 = [PGGraphMemory alloc];
      v12 = [v5 featureNodeCollection];
      v13 = [(PGGraphMemory *)v11 initWithMemoryCategory:7 memoryCategorySubcategory:4001 momentNodes:v6 featureNodes:v12];

      [*(id *)(a1 + 40) addObject:v13];
    }
  }
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v9 = a7;
  id v10 = a3;
  v11 = [PGHomeAggregationMemoryTitleGenerator alloc];
  v12 = [v10 memoryMomentNodes];

  v13 = [v12 temporarySet];
  id v14 = [(PGHomeAggregationMemoryTitleGenerator *)v11 initWithMomentNodes:v13 titleGenerationContext:v9];

  return v14;
}

@end