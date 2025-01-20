@interface PGMemoryGenerationHelper
+ (BOOL)dates:(id)a3 passSpreadicityWithMinimumCardinal:(unint64_t)a4 minimumTimeInterval:(double)a5;
+ (BOOL)prepareAssets:(id)a3 forMemoriesWithTopTierAestheticScore:(double)a4 curationContext:(id)a5;
+ (id)assetFetchResultForMomentNodes:(id)a3 inLocationOrAreaNode:(id)a4 requireInteresting:(BOOL)a5 curationManager:(id)a6 progressReporter:(id)a7;
+ (id)assetLocalIdentifiersFromAssets:(id)a3;
+ (id)assetUUIDsFromAssets:(id)a3;
+ (id)feederForMemoriesWithAssetCollection:(id)a3 memoryCurationSession:(id)a4 graph:(id)a5 allowGuestAsset:(BOOL)a6;
+ (id)feederForMemoriesWithAssetFetchResult:(id)a3 memoryCurationSession:(id)a4 graph:(id)a5;
+ (id)feederForMemoriesWithAssetLocalIdentifiers:(id)a3 memoryCurationSession:(id)a4 graph:(id)a5 allowGuestAsset:(BOOL)a6;
+ (id)feederForMemoriesWithFeeder:(id)a3 topTierAestheticScore:(double)a4 didFeederChange:(BOOL *)a5 curationContext:(id)a6;
+ (id)keyAssetFetchResultForHighlightGroupUUIDs:(id)a3 curationManager:(id)a4 allowGuestAsset:(BOOL)a5;
+ (id)scoringContextForMemoriesWithAssets:(id)a3 withTopTierAestheticScore:(double)a4;
@end

@implementation PGMemoryGenerationHelper

+ (BOOL)dates:(id)a3 passSpreadicityWithMinimumCardinal:(unint64_t)a4 minimumTimeInterval:(double)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 count] >= a4)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F8A8C8]) initWithNumericValueKeypaths:&unk_1F28D4080];
    [v9 setK:a4];
    v10 = [v7 allObjects];
    v11 = [v9 performWithDataset:v10 progressBlock:&__block_literal_global_36885];

    if ([v11 count] >= a4)
    {
      int v53 = a4;
      v55 = v9;
      v56 = v7;
      v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      v54 = v11;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v74 objects:v92 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v75;
        double v16 = 1.79769313e308;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v75 != v15) {
              objc_enumerationMutation(v12);
            }
            v18 = *(void **)(*((void *)&v74 + 1) + 8 * i);
            long long v70 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            v19 = [v18 objects];
            uint64_t v20 = [v19 countByEnumeratingWithState:&v70 objects:v91 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              id v22 = 0;
              uint64_t v23 = *(void *)v71;
              do
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v71 != v23) {
                    objc_enumerationMutation(v19);
                  }
                  v25 = *(void **)(*((void *)&v70 + 1) + 8 * j);
                  if (v22)
                  {
                    uint64_t v26 = [v22 earlierDate:v25];

                    id v22 = (id)v26;
                  }
                  else
                  {
                    id v22 = v25;
                  }
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v70 objects:v91 count:16];
              }
              while (v21);
            }
            else
            {
              id v22 = 0;
            }

            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            id v27 = v57;
            uint64_t v28 = [v27 countByEnumeratingWithState:&v66 objects:v90 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v67;
              do
              {
                for (uint64_t k = 0; k != v29; ++k)
                {
                  if (*(void *)v67 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  [v22 timeIntervalSinceDate:*(void *)(*((void *)&v66 + 1) + 8 * k)];
                  double v33 = fabs(v32);
                  if (v16 >= v33) {
                    double v16 = v33;
                  }
                }
                uint64_t v29 = [v27 countByEnumeratingWithState:&v66 objects:v90 count:16];
              }
              while (v29);
            }

            if (v22) {
              [v27 addObject:v22];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v74 objects:v92 count:16];
        }
        while (v14);
      }
      else
      {
        double v16 = 1.79769313e308;
      }

      id v34 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v34 setTimeStyle:0];
      [v34 setDateStyle:1];
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v36 = [v57 sortedArrayUsingSelector:sel_compare_];
      uint64_t v37 = [v36 countByEnumeratingWithState:&v62 objects:v89 count:16];
      id v7 = v56;
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v63;
        do
        {
          for (uint64_t m = 0; m != v38; ++m)
          {
            if (*(void *)v63 != v39) {
              objc_enumerationMutation(v36);
            }
            v41 = [v34 stringFromDate:*(void *)(*((void *)&v62 + 1) + 8 * m)];
            [v35 addObject:v41];
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v62 objects:v89 count:16];
        }
        while (v38);
      }

      v42 = [v35 componentsJoinedByString:@", "];
      id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      v44 = [v56 allObjects];
      v45 = [v44 sortedArrayUsingSelector:sel_compare_];

      uint64_t v46 = [v45 countByEnumeratingWithState:&v58 objects:v88 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v59;
        do
        {
          for (uint64_t n = 0; n != v47; ++n)
          {
            if (*(void *)v59 != v48) {
              objc_enumerationMutation(v45);
            }
            v50 = [v34 stringFromDate:*(void *)(*((void *)&v58 + 1) + 8 * n)];
            [v43 addObject:v50];
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v58 objects:v88 count:16];
        }
        while (v47);
      }

      v51 = [v43 componentsJoinedByString:@", "];
      BOOL v8 = v16 >= a5;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67110146;
        BOOL v79 = v16 >= a5;
        __int16 v80 = 1024;
        int v81 = v53;
        __int16 v82 = 1024;
        int v83 = (int)(a5 / 86400.0);
        __int16 v84 = 2112;
        v85 = v42;
        __int16 v86 = 2112;
        v87 = v51;
        _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "passesSpreadicity %d for cardinal %d, interval %d days, with consolidated dates %@\n\toriginal dates %@", buf, 0x28u);
      }

      v11 = v54;
      v9 = v55;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)assetFetchResultForMomentNodes:(id)a3 inLocationOrAreaNode:(id)a4 requireInteresting:(BOOL)a5 curationManager:(id)a6 progressReporter:(id)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  int v14 = [v13 isCancelledWithProgress:0.0];
  *((unsigned char *)v47 + 24) = v14;
  if (!v14)
  {
    double v16 = [v11 label];
    char v17 = [v16 isEqualToString:@"City"];
    char v18 = [v16 isEqualToString:@"Area"];
    char v19 = [v16 isEqualToString:@"State"];
    uint64_t v20 = [v12 defaultAssetFetchOptionsForMemories];
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __132__PGMemoryGenerationHelper_assetFetchResultForMomentNodes_inLocationOrAreaNode_requireInteresting_curationManager_progressReporter___block_invoke;
    v35[3] = &unk_1E68E98F8;
    BOOL v42 = a5;
    id v22 = v20;
    id v36 = v22;
    char v43 = v17;
    id v37 = v11;
    char v44 = v18;
    char v45 = v19;
    id v23 = v16;
    id v38 = v23;
    id v24 = v21;
    id v39 = v24;
    v41 = &v46;
    id v25 = v13;
    id v40 = v25;
    [v34 enumerateNodesUsingBlock:v35];
    if (*((unsigned char *)v47 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v51 = 161;
        __int16 v52 = 2080;
        int v53 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/Memory Generators/PGMemoryGenerationHelper.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v15 = 0;
      goto LABEL_19;
    }
    if ([v24 count])
    {
      id v32 = objc_alloc(MEMORY[0x1E4F39150]);
      uint64_t v26 = [v22 photoLibrary];
      id v27 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v28 = [v22 fetchPropertySets];
      uint64_t v29 = [v27 setWithArray:v28];
      double v33 = (void *)[v32 initWithObjects:v24 photoLibrary:v26 fetchType:0 fetchPropertySets:v29 identifier:0 registerIfNeeded:0];
    }
    else
    {
      double v33 = 0;
    }
    if (*((unsigned char *)v47 + 24))
    {
      *((unsigned char *)v47 + 24) = 1;
    }
    else
    {
      char v30 = [v25 isCancelledWithProgress:1.0];
      *((unsigned char *)v47 + 24) = v30;
      if ((v30 & 1) == 0)
      {
        id v15 = v33;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v51 = 168;
      __int16 v52 = 2080;
      int v53 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emory Generators/PGMemoryGenerationHelper.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v15 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v51 = 127;
    __int16 v52 = 2080;
    int v53 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/Mem"
          "ory Generators/PGMemoryGenerationHelper.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v15 = 0;
LABEL_20:
  _Block_object_dispose(&v46, 8);

  return v15;
}

void __132__PGMemoryGenerationHelper_assetFetchResultForMomentNodes_inLocationOrAreaNode_requireInteresting_curationManager_progressReporter___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = v5;
  if (*(unsigned char *)(a1 + 80) && ![v5 isInteresting]) {
    goto LABEL_16;
  }
  id v7 = (void *)MEMORY[0x1D25FED50]();
  BOOL v8 = (void *)MEMORY[0x1E4F28F60];
  v9 = [v6 uuid];
  v10 = [v8 predicateWithFormat:@"moment.uuid = %@", v9];
  [*(id *)(a1 + 32) setInternalPredicate:v10];

  id v11 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:*(void *)(a1 + 32)];
  id v12 = v11;
  if (*(unsigned char *)(a1 + 81))
  {
    id v13 = [v11 fetchedObjects];
    int v14 = [v6 collection];
    id v15 = [*(id *)(a1 + 40) collection];
    uint64_t v16 = +[PGCurationManager filterAssets:v13 inMomentNodes:v14 forCityNodes:v15 withMaximumDistance:5000.0];
  }
  else if (*(unsigned char *)(a1 + 82))
  {
    id v13 = [v11 fetchedObjects];
    int v14 = [v6 collection];
    id v15 = [*(id *)(a1 + 40) collection];
    uint64_t v16 = +[PGCurationManager filterAssets:v13 inMomentNodes:v14 forAreaNodes:v15 withMaximumDistance:20000.0];
  }
  else
  {
    if (!*(unsigned char *)(a1 + 83))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 136315394;
        id v22 = "+[PGMemoryGenerationHelper assetFetchResultForMomentNodes:inLocationOrAreaNode:requireInteresting:curation"
              "Manager:progressReporter:]_block_invoke";
        __int16 v23 = 2112;
        uint64_t v24 = v20;
        _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s called for location node %@, see rdar://75269533", buf, 0x16u);
      }
      char v17 = [v12 fetchedObjects];
      goto LABEL_10;
    }
    id v13 = [v11 fetchedObjects];
    int v14 = [v6 collection];
    id v15 = [*(id *)(a1 + 40) collection];
    uint64_t v16 = +[PGCurationManager filterAssets:v13 inMomentNodes:v14 forStateNodes:v15 withMaximumDistance:5000.0];
  }
  char v17 = (void *)v16;

LABEL_10:
  [*(id *)(a1 + 56) addObjectsFromArray:v17];
  uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
  if (*(unsigned char *)(v18 + 24))
  {
    char v19 = 1;
  }
  else
  {
    char v19 = [*(id *)(a1 + 64) isCancelledWithProgress:0.5];
    uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
  }
  *(unsigned char *)(v18 + 24) = v19;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
    *a3 = 1;
  }

LABEL_16:
}

+ (id)keyAssetFetchResultForHighlightGroupUUIDs:(id)a3 curationManager:(id)a4 allowGuestAsset:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 photoLibrary];
  v10 = [v9 librarySpecificFetchOptions];
  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v8];

  [v10 setInternalPredicate:v11];
  id v12 = [MEMORY[0x1E4F39238] fetchHighlightsWithOptions:v10];
  id v13 = [v7 defaultAssetFetchOptionsForMemories];

  [v13 setIncludeGuestAssets:v5];
  int v14 = [MEMORY[0x1E4F38EB8] fetchKeyAssetByHighlightUUIDForHighlights:v12 options:v13];
  id v15 = objc_alloc(MEMORY[0x1E4F39150]);
  uint64_t v16 = [v14 allValues];
  uint64_t v17 = *MEMORY[0x1E4F39648];
  uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
  char v19 = [v13 fetchPropertySets];
  uint64_t v20 = [v18 setWithArray:v19];
  id v21 = (void *)[v15 initWithObjects:v16 photoLibrary:v9 fetchType:v17 fetchPropertySets:v20 identifier:0 registerIfNeeded:0];

  return v21;
}

+ (id)assetLocalIdentifiersFromAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
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
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "localIdentifier", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)assetUUIDsFromAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
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
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "uuid", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)prepareAssets:(id)a3 forMemoriesWithTopTierAestheticScore:(double)a4 curationContext:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 scoringContextForMemoriesWithAssets:v8 withTopTierAestheticScore:a4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    int v14 = 0;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v11);
        }
        v14 |= objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "prepareWithAlternateJunkingHeuristics:withContext:curationContext:", 1, v10, v9, (void)v18);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14 & 1;
}

+ (id)scoringContextForMemoriesWithAssets:(id)a3 withTopTierAestheticScore:(double)a4
{
  v4 = [MEMORY[0x1E4F8E778] scoringContextWithAssets:a3 aestheticScoreThresholdToBeAwesome:a4];
  [v4 setShouldEmphasizePanorama:0];
  return v4;
}

+ (id)feederForMemoriesWithFeeder:(id)a3 topTierAestheticScore:(double)a4 didFeederChange:(BOOL *)a5 curationContext:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [v10 allItems];
  char v13 = [a1 prepareAssets:v12 forMemoriesWithTopTierAestheticScore:v11 curationContext:a4];

  if (a5) {
    *a5 = v13;
  }

  return v10;
}

+ (id)feederForMemoriesWithAssetFetchResult:(id)a3 memoryCurationSession:(id)a4 graph:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = [v8 fetchPropertySets];
    uint64_t v12 = (void *)MEMORY[0x1E4F38EB8];
    char v13 = [v9 curationContext];
    int v14 = [v12 clsAllAssetsFromFetchResult:v8 prefetchOptions:31 curationContext:v13];

    uint64_t v15 = [v10 infoNode];
    [v15 topTierAestheticScore];
    double v17 = v16;
    long long v18 = [v9 curationContext];
    [a1 prepareAssets:v14 forMemoriesWithTopTierAestheticScore:v18 curationContext:v17];

    id v19 = objc_alloc(MEMORY[0x1E4F39150]);
    long long v20 = [v8 photoLibrary];
    long long v21 = [v8 fetchType];
    id v22 = (void *)[v19 initWithObjects:v14 photoLibrary:v20 fetchType:v21 fetchPropertySets:v11 identifier:0 registerIfNeeded:0];

    id v23 = objc_alloc(MEMORY[0x1E4F76CF0]);
    uint64_t v24 = [v9 curationContext];
    uint64_t v25 = (void *)[v23 initWithAssetFetchResult:v22 curationContext:v24];
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

+ (id)feederForMemoriesWithAssetLocalIdentifiers:(id)a3 memoryCurationSession:(id)a4 graph:(id)a5 allowGuestAsset:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  char v13 = [v11 curationManager];
  int v14 = [v13 defaultAssetFetchOptionsForMemories];

  [v14 setIncludeGuestAssets:v6];
  uint64_t v15 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v12 options:v14];

  double v16 = [a1 feederForMemoriesWithAssetFetchResult:v15 memoryCurationSession:v11 graph:v10];

  return v16;
}

+ (id)feederForMemoriesWithAssetCollection:(id)a3 memoryCurationSession:(id)a4 graph:(id)a5 allowGuestAsset:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  char v13 = [v11 curationManager];
  int v14 = [v13 defaultAssetFetchOptionsForMemories];

  [v14 setIncludeGuestAssets:v6];
  uint64_t v15 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v12 options:v14];

  double v16 = [a1 feederForMemoriesWithAssetFetchResult:v15 memoryCurationSession:v11 graph:v10];

  return v16;
}

@end