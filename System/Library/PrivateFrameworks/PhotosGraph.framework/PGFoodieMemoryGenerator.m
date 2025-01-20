@interface PGFoodieMemoryGenerator
+ (id)incompatibleMomentNodesInGraph:(id)a3;
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (BOOL)requireSceneProcessingMeetsThresholdOverTime;
- (PGFoodieMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)_foodieTitleGeneratorWithMomentNodes:(id)a3 featureNodes:(id)a4 titleGenerationContext:(id)a5;
- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5;
- (id)featuredYearConfiguration;
- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4;
- (id)momentRequirements;
- (id)overTheYearsConfiguration;
- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (unint64_t)durationForCuration;
- (unint64_t)durationForExtendedCuration;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3;
- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3;
@end

@implementation PGFoodieMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

- (id)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (id)overTheYearsConfiguration
{
  return self->_overTheYearsConfiguration;
}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3
{
  self->_requireFaceProcessingMeetsThresholdOverTime = a3;
}

- (BOOL)requireFaceProcessingMeetsThresholdOverTime
{
  return self->_requireFaceProcessingMeetsThresholdOverTime;
}

- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3
{
  self->_requireSceneProcessingMeetsThresholdOverTime = a3;
}

- (BOOL)requireSceneProcessingMeetsThresholdOverTime
{
  return self->_requireSceneProcessingMeetsThresholdOverTime;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  BOOL v7 = a5;
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v10 memoryFeatureNodes];
  v14 = +[PGGraphNodeCollection subsetInCollection:v13];
  if ([v14 count] == 1)
  {
    v15 = [v10 memoryMomentNodes];
    v16 = +[PGGraphEdgeCollection edgesFromNodes:v15 toNodes:v14];
    if (![v16 count])
    {
      log = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, log, OS_LOG_TYPE_ERROR, "[PGFoodieMemoryGenerator] No moment feature edges for food found", buf, 2u);
      }
      v38 = 0;
      goto LABEL_65;
    }
    v125 = v14;
    id v126 = v11;
    v128 = v13;
    v124 = v16;
    v17 = [v16 allRelevantAssetUUIDs];
    v18 = [(PGMemoryGenerator *)self memoryCurationSession];
    v19 = [v18 curationManager];
    v20 = [v19 defaultAssetFetchOptionsForMemories];

    [v20 setIncludeGuestAssets:v7];
    v21 = (void *)MEMORY[0x1E4F38EB8];
    v22 = [v17 allObjects];
    v132 = v20;
    uint64_t v23 = [v21 fetchAssetsWithUUIDs:v22 options:v20];

    v24 = (void *)MEMORY[0x1E4F38EB8];
    v25 = [(PGMemoryGenerator *)self memoryCurationSession];
    v26 = [v25 curationContext];
    v122 = (void *)v23;
    v27 = [v24 clsAllAssetsFromFetchResult:v23 prefetchOptions:1 curationContext:v26];

    v28 = [(PGMemoryGenerator *)self memoryCurationSession];
    v29 = [v28 photoLibrary];
    uint64_t v30 = [v29 librarySpecificFetchOptions];

    v31 = (void *)MEMORY[0x1E4F38EE8];
    v32 = [v15 localIdentifiers];
    v33 = [v32 allObjects];
    v123 = (void *)v30;
    v34 = [v31 fetchAssetCollectionsWithLocalIdentifiers:v33 options:v30];

    v35 = v34;
    unint64_t v36 = [v34 count];
    v127 = v15;
    log = v17;
    if (v36 < [v15 count])
    {
      v37 = [(PGMemoryGenerator *)self loggingConnection];
      v13 = v128;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v37, OS_LOG_TYPE_ERROR, "[PGFoodieMemoryGenerator] Failed to fetch all momentNodes, graph is out-of-sync with the photo library.", buf, 2u);
      }
      v38 = 0;
      goto LABEL_64;
    }
    v131 = self;
    v13 = v128;
    v39 = +[PGGraphNodeCollection subsetInCollection:v128];
    uint64_t v142 = [v39 count];
    v121 = v39;
    if (v142)
    {
      v40 = +[PGGraphEdgeCollection edgesFromNodes:v15 toNodes:v39];
      if (![v40 count])
      {
        id v144 = v40;
        v68 = [(PGMemoryGenerator *)self loggingConnection];
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1805000, v68, OS_LOG_TYPE_ERROR, "[PGFoodieMemoryGenerator] No moment feature edges for person found", buf, 2u);
        }
        v38 = 0;
        v138 = (void *)MEMORY[0x1E4F1CBF0];
        v37 = v121;
LABEL_63:

LABEL_64:
        v16 = v124;
        v14 = v125;
        id v11 = v126;
        v15 = v127;
LABEL_65:

        goto LABEL_66;
      }
      [v40 allRelevantAssetUUIDs];
      v42 = v41 = v40;
      v138 = [v42 allObjects];
    }
    else
    {
      v138 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v119 = v12;
    id v120 = v10;
    id v144 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v129 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v130 = v35;
    if ([v35 count])
    {
      uint64_t v43 = 0;
      do
      {
        v135 = (void *)MEMORY[0x1D25FED50]();
        uint64_t v136 = v43;
        v134 = [v35 objectAtIndexedSubscript:v43];
        uint64_t v44 = objc_msgSend(MEMORY[0x1E4F38EB8], "fetchAssetsInAssetCollection:options:");
        v45 = (void *)MEMORY[0x1E4F38EB8];
        v46 = [(PGMemoryGenerator *)v131 memoryCurationSession];
        v47 = [v46 curationContext];
        v133 = (void *)v44;
        v48 = [v45 clsAllAssetsFromFetchResult:v44 prefetchOptions:1 curationContext:v47];

        id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v137 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v140 = v49;
        if ([v48 count])
        {
          unint64_t v50 = 0;
          do
          {
            v51 = (void *)MEMORY[0x1D25FED50]();
            v52 = [v48 objectAtIndexedSubscript:v50];
            v53 = [v52 uuid];
            [v49 addObject:v53];
            if (([v17 containsObject:v53] & 1) == 0)
            {
              uint64_t v54 = [v52 clsPeopleCount];
              if (v54)
              {
                if (!v142 || (unint64_t v55 = v54, v56 = [v138 containsObject:v53], v55 <= 2) && v56)
                {
                  v57 = objc_msgSend(v52, "creationDate", v119, v120);
                  [v52 locationCoordinate];
                  *(void *)buf = v58;
                  uint64_t v153 = v59;
                  if ([v27 count])
                  {
                    uint64_t v60 = 0;
                    while (1)
                    {
                      v61 = [v27 objectAtIndexedSubscript:v60];
                      v62 = [v61 creationDate];
                      [v57 timeIntervalSinceDate:v62];
                      double v64 = fabs(v63);

                      if (v64 < 600.0)
                      {
                        [v61 locationCoordinate];
                        CLLocationCoordinate2D v149 = v156;
                        if (CLLocationCoordinate2DIsValid(v156))
                        {
                          CLLocationCoordinate2DGetDistanceFrom();
                          if (v65 < 200.0) {
                            break;
                          }
                        }
                      }

                      if (++v60 >= (unint64_t)[v27 count]) {
                        goto LABEL_34;
                      }
                    }
                    [v137 addObject:v52];
                  }
LABEL_34:

                  v17 = log;
                  id v49 = v140;
                }
              }
            }

            ++v50;
          }
          while (v50 < [v48 count]);
        }
        if (v142 && ![v137 count])
        {
          v66 = v144;
          id v67 = v49;
        }
        else
        {
          v66 = v129;
          id v67 = v137;
        }
        objc_msgSend(v66, "addObjectsFromArray:", v67, v119, v120);
        v35 = v130;

        uint64_t v43 = v136 + 1;
      }
      while (v136 + 1 < (unint64_t)[v130 count]);
    }
    v68 = v129;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    id v69 = v27;
    uint64_t v70 = [v69 countByEnumeratingWithState:&v145 objects:v151 count:16];
    v37 = v121;
    if (v70)
    {
      uint64_t v71 = v70;
      uint64_t v72 = *(void *)v146;
      do
      {
        for (uint64_t i = 0; i != v71; ++i)
        {
          if (*(void *)v146 != v72) {
            objc_enumerationMutation(v69);
          }
          v74 = *(void **)(*((void *)&v145 + 1) + 8 * i);
          v75 = objc_msgSend(v74, "uuid", v119, v120);
          char v76 = [v144 containsObject:v75];

          if ((v76 & 1) == 0) {
            [v68 addObject:v74];
          }
        }
        uint64_t v71 = [v69 countByEnumeratingWithState:&v145 objects:v151 count:16];
      }
      while (v71);
    }

    if (v142)
    {
      id v77 = objc_alloc(MEMORY[0x1E4F39150]);
      v78 = [v132 photoLibrary];
      v79 = (void *)MEMORY[0x1E4F1CAD0];
      v80 = [v132 fetchPropertySets];
      v81 = [v79 setWithArray:v80];
      v82 = (void *)[v77 initWithObjects:v68 photoLibrary:v78 fetchType:0 fetchPropertySets:v81 identifier:0 registerIfNeeded:0];

      v83 = [(PGMemoryGenerator *)v131 memoryCurationSession];
      v38 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v82 memoryCurationSession:v83 graph:v126];
      id v12 = v119;
      id v10 = v120;
    }
    else
    {
      v82 = +[PGGraphNodeCollection subsetInCollection:v128];
      v84 = +[PGGraphNodeCollection subsetInCollection:v128];
      if ([v82 count] || objc_msgSend(v84, "count"))
      {
        if (objc_msgSend(v84, "count", v119, v120))
        {
          v85 = v127;
        }
        else
        {
          v86 = +[PGGraphNodeCollection subsetInCollection:v128];
          v87 = [v86 addressNodes];
          v88 = [v87 cityNodes];
          v85 = v127;
          v89 = [v127 cityNodes];
          uint64_t v90 = [v88 collectionByIntersecting:v89];

          v84 = (void *)v90;
        }
        v143 = v84;
        v91 = +[PGCurationManager filterAssets:v68 inMomentNodes:v85 forCityNodes:v84 withMaximumDistance:5000.0];
        id v92 = objc_alloc(MEMORY[0x1E4F39150]);
        v93 = [v132 photoLibrary];
        v94 = (void *)MEMORY[0x1E4F1CAD0];
        v95 = [v132 fetchPropertySets];
        v96 = [v94 setWithArray:v95];
        v97 = (void *)[v92 initWithObjects:v91 photoLibrary:v93 fetchType:0 fetchPropertySets:v96 identifier:0 registerIfNeeded:0];

        v98 = [(PGMemoryGenerator *)v131 memoryCurationSession];
        v38 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v97 memoryCurationSession:v98 graph:v126];
        v37 = v121;
      }
      else
      {
        v143 = v84;
        v100 = +[PGGraphNodeCollection subsetInCollection:v128];
        v97 = +[PGGraphNodeCollection subsetInCollection:v128];
        v141 = v82;
        if ([v100 count] || objc_msgSend(v97, "count"))
        {
          v98 = objc_msgSend(v100, "locations", v119, v120);
          v91 = v100;
          if (![v100 count])
          {
            v101 = [v97 anyNode];
            [v101 coordinates];
            v104 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v102 longitude:v103];
            v150 = v104;
            uint64_t v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v150 count:1];

            v98 = (void *)v105;
          }
          v106 = +[PGCurationManager filterAssets:v68 withLocations:v98 maximumDistance:100.0];
          id v107 = objc_alloc(MEMORY[0x1E4F39150]);
          v108 = [v132 photoLibrary];
          v109 = (void *)MEMORY[0x1E4F1CAD0];
          v110 = [v132 fetchPropertySets];
          v111 = [v109 setWithArray:v110];
          v112 = (void *)[v107 initWithObjects:v106 photoLibrary:v108 fetchType:0 fetchPropertySets:v111 identifier:0 registerIfNeeded:0];

          v113 = [(PGMemoryGenerator *)v131 memoryCurationSession];
          v38 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v112 memoryCurationSession:v113 graph:v126];

          v37 = v121;
        }
        else
        {
          v91 = v100;
          id v114 = objc_alloc(MEMORY[0x1E4F39150]);
          v115 = [v132 photoLibrary];
          v116 = (void *)MEMORY[0x1E4F1CAD0];
          v117 = [v132 fetchPropertySets];
          v118 = [v116 setWithArray:v117];
          v98 = (void *)[v114 initWithObjects:v68 photoLibrary:v115 fetchType:0 fetchPropertySets:v118 identifier:0 registerIfNeeded:0];

          v106 = [(PGMemoryGenerator *)v131 memoryCurationSession];
          v38 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v98 memoryCurationSession:v106 graph:v126];
        }

        v82 = v141;
      }

      id v12 = v119;
      id v10 = v120;
      v83 = v143;
    }

    v13 = v128;
    v35 = v130;
    goto LABEL_63;
  }
  v15 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = [v14 count];
    _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "[PGFoodieMemoryGenerator] One food scene feature node expected, found %d", buf, 8u);
  }
  v38 = 0;
LABEL_66:

  return v38;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 memoryFeatureNodes];
  v9 = +[PGGraphNodeCollection subsetInCollection:v8];

  id v10 = [(PGMemoryGenerator *)self memoryCurationSession];
  id v11 = [v10 curationManager];

  if ([v9 count])
  {
    id v12 = [v9 anyNode];
    v13 = [v12 localIdentifier];
    if (v13)
    {
      v14 = [v11 curationCriteriaFactory];
      uint64_t v15 = [v14 foodieCurationCriteriaWithPersonLocalIdentifier:v13 client:1];
    }
    else
    {
      v17 = [(PGMemoryGenerator *)self loggingConnection];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "[PGFoodieMemoryGenerator] Nil local identifier found for featured person, falling back to default key asset curation criteria", buf, 2u);
      }

      v14 = [v11 curationCriteriaFactory];
      uint64_t v15 = [v14 foodieCurationCriteriaWithClient:1];
    }
    v16 = (void *)v15;
  }
  else
  {
    id v12 = [v11 curationCriteriaFactory];
    v16 = [v12 foodieCurationCriteriaWithClient:1];
  }

  v20.receiver = self;
  v20.super_class = (Class)PGFoodieMemoryGenerator;
  v18 = [(PGMemoryGenerator *)&v20 keyAssetCurationOptionsWithTriggeredMemory:v7 inGraph:v6];

  [v18 setComplete:1];
  [v18 setCurationCriteria:v16];

  return v18;
}

- (id)_foodieTitleGeneratorWithMomentNodes:(id)a3 featureNodes:(id)a4 titleGenerationContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[PGGraphNodeCollection subsetInCollection:v9];
  if (![v11 count])
  {
    id v12 = +[PGGraphNodeCollection subsetInCollection:v9];
    if ([v12 count])
    {
      v16 = +[PGGraphNodeCollection subsetInCollection:v9];
      v17 = [v16 anyNode];

      v18 = [v17 label];
      if ([v18 isEqual:@"City"])
      {
        uint64_t v19 = 1;
      }
      else if ([v18 isEqual:@"State"])
      {
        uint64_t v19 = 2;
      }
      else if ([v18 isEqual:@"Country"])
      {
        uint64_t v19 = 3;
      }
      else
      {
        uint64_t v19 = 0;
      }
      v26 = [PGFoodieMemoryTitleGenerator alloc];
      v24 = [v8 temporarySet];
      uint64_t v25 = [(PGFoodieMemoryTitleGenerator *)v26 initWithMomentNodes:v24 tripLocationNode:v17 tripTitleLocationType:v19 titleGenerationContext:v10];
      goto LABEL_19;
    }
    v17 = +[PGGraphNodeCollection subsetInCollection:v9];
    if ([v17 count])
    {
      uint64_t v23 = [PGFoodieMemoryTitleGenerator alloc];
      v18 = [v8 temporarySet];
      v24 = [v17 anyNode];
      uint64_t v25 = [(PGFoodieMemoryTitleGenerator *)v23 initWithMomentNodes:v18 cityNode:v24 titleGenerationContext:v10];
LABEL_19:
      v22 = (PGFoodieMemoryTitleGenerator *)v25;
LABEL_20:

      goto LABEL_21;
    }
    v18 = +[PGGraphNodeCollection subsetInCollection:v9];
    if ([v18 count])
    {
      v28 = [PGFoodieMemoryTitleGenerator alloc];
      v24 = [v8 temporarySet];
      v29 = [v18 anyNode];
      uint64_t v30 = [(PGFoodieMemoryTitleGenerator *)v28 initWithMomentNodes:v24 addressNode:v29 titleGenerationContext:v10];
    }
    else
    {
      v24 = +[PGGraphNodeCollection subsetInCollection:v9];
      uint64_t v31 = [v24 count];
      v33 = [PGFoodieMemoryTitleGenerator alloc];
      v29 = [v8 temporarySet];
      if (v31)
      {
        v32 = [v24 anyNode];
        v22 = [(PGFoodieMemoryTitleGenerator *)v33 initWithMomentNodes:v29 businessNode:v32 titleGenerationContext:v10];

        goto LABEL_29;
      }
      uint64_t v30 = [(PGTitleGenerator *)v33 initWithMomentNodes:v29 type:0 titleGenerationContext:v10];
    }
    v22 = (PGFoodieMemoryTitleGenerator *)v30;
LABEL_29:

    goto LABEL_20;
  }
  id v12 = [v11 anyNode];
  if (v12)
  {
    v13 = [PGFoodieMemoryTitleGenerator alloc];
    v14 = [v8 temporarySet];
    uint64_t v15 = [(PGFoodieMemoryTitleGenerator *)v13 initWithMomentNodes:v14 personNode:v12 titleGenerationContext:v10];
  }
  else
  {
    objc_super v20 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v20, OS_LOG_TYPE_ERROR, "person node is unexpectedly nil when our collection wasn't empty", buf, 2u);
    }

    v21 = [PGFoodieMemoryTitleGenerator alloc];
    v14 = [v8 temporarySet];
    uint64_t v15 = [(PGTitleGenerator *)v21 initWithMomentNodes:v14 type:0 titleGenerationContext:v10];
  }
  v22 = (PGFoodieMemoryTitleGenerator *)v15;

LABEL_21:
  return v22;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v10 = a7;
  id v11 = a3;
  id v12 = [v11 memoryFeatureNodes];
  v13 = [v11 memoryMomentNodes];

  v14 = [(PGFoodieMemoryGenerator *)self _foodieTitleGeneratorWithMomentNodes:v13 featureNodes:v12 titleGenerationContext:v10];

  uint64_t v15 = +[PGGraphNodeCollection subsetInCollection:v12];
  if ([v15 count] == 1) {
    [v14 setFeaturedYearNodes:v15];
  }

  return v14;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PGFoodieMemoryGenerator;
  v5 = [(PGMemoryGenerator *)&v7 curationOptionsWithRequiredAssetUUIDs:a3 eligibleAssetUUIDs:a4 triggeredMemory:a5];
  [v5 setMinimumNumberOfItems:15];
  [v5 setFailIfMinimumDurationNotReached:1];
  return v5;
}

- (unint64_t)durationForExtendedCuration
{
  return 10;
}

- (unint64_t)durationForCuration
{
  return 22;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  v5 = (void (**)(id, void *, void *, unsigned char *))a4;
  id v6 = a3;
  objc_super v7 = +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneName:@"Food" inGraph:v6];
  id v8 = [v7 momentNodes];
  id v9 = +[PGFoodieMemoryGenerator incompatibleMomentNodesInGraph:v6];

  id v10 = [v8 collectionBySubtracting:v9];

  if ([v10 count])
  {
    char v12 = 0;
    id v11 = [v7 featureNodeCollection];
    v5[2](v5, v10, v11, &v12);
  }
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 6001;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 6002;
  }
  v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    objc_super v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

- (unint64_t)memoryCategory
{
  return 9;
}

- (PGFoodieMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PGFoodieMemoryGenerator;
  int v3 = [(PGMemoryGenerator *)&v12 initWithMemoryGenerationContext:a3];
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 0;
    v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    [(PGMemoryMomentRequirements *)v4->_momentRequirements setFilterMomentsWithNotEnoughScenesProcessed:1];
    [(PGMemoryMomentRequirements *)v4->_momentRequirements setMinimumNumberOfRelevantAssets:2];
    uint64_t v7 = +[PGOverTheYearsMemoryConfiguration strictDefaultOverTheYearsMemoryConfiguration];
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v7;

    [(PGOverTimeMemoryConfiguration *)v4->_overTheYearsConfiguration setMinimumNumberOfRelevantAssets:15];
    uint64_t v9 = +[PGFeaturedTimePeriodMemoryConfiguration strictDefaultFeaturedYearMemoryConfiguration];
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    [(PGOverTimeMemoryConfiguration *)v4->_featuredYearConfiguration setMinimumNumberOfRelevantAssets:15];
  }
  return v4;
}

+ (id)incompatibleMomentNodesInGraph:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[PGGraphPOINodeCollection poiNodesForLabel:@"Hospital" inGraph:v3];
  v11[0] = @"Wedding";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v6 = +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:v5 inGraph:v3];

  uint64_t v7 = [v4 momentNodes];
  int v8 = [v6 momentNodes];
  uint64_t v9 = [v7 collectionByFormingUnionWith:v8];

  return v9;
}

@end