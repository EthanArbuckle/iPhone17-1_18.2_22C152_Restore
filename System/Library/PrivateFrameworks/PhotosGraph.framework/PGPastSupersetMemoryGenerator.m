@interface PGPastSupersetMemoryGenerator
- (NSDate)localDate;
- (id)chapterTitleGeneratorForTriggeredMemory:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 titleGenerationContext:(id)a6 inGraph:(id)a7;
- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5;
- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4;
- (id)relevantCurationFeederForTriggeredMemory:(id)a3 relevantFeeder:(id)a4 inGraph:(id)a5 allowGuestAsset:(BOOL)a6 progressReporter:(id)a7;
- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (void)_enumeratePotentialMemoriesWithGraph:(id)a3 usingBlock:(id)a4;
- (void)setLocalDate:(id)a3;
@end

@implementation PGPastSupersetMemoryGenerator

- (void).cxx_destruct
{
}

- (void)setLocalDate:(id)a3
{
}

- (NSDate)localDate
{
  return self->_localDate;
}

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
  id v10 = a3;
  unint64_t v11 = [v10 memoryMomentNodes];
  v12 = [v11 universalDateInterval];

  v13 = [v10 memoryFeatureNodes];
  v14 = +[PGGraphNodeCollection subsetInCollection:v13];
  v15 = [v14 anyNode];

  v16 = [PGPastSupersetMemoryTitleGenerator alloc];
  v17 = [v10 memoryMomentNodes];

  v18 = [v17 set];
  v19 = [(PGPastSupersetMemoryTitleGenerator *)v16 initWithMomentNodes:v18 supersetLocationNode:v15 supersetDateInterval:v12 titleGenerationContext:v9];

  return v19;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)PGPastSupersetMemoryGenerator;
  id v7 = a5;
  v8 = [(PGMemoryGenerator *)&v14 curationOptionsWithRequiredAssetUUIDs:a3 eligibleAssetUUIDs:a4 triggeredMemory:v7];
  id v9 = objc_msgSend(v7, "memoryMomentNodes", v14.receiver, v14.super_class);

  id v10 = [v9 universalDateInterval];
  [v10 duration];
  double v12 = v11;

  if (v12 > 31557600.0) {
    [v8 setDuration:21];
  }
  return v8;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PGPastSupersetMemoryGenerator;
  id v5 = a4;
  v6 = [(PGMemoryGenerator *)&v10 keyAssetCurationOptionsWithTriggeredMemory:a3 inGraph:v5];
  objc_msgSend(v6, "setComplete:", 1, v10.receiver, v10.super_class);
  id v7 = [v5 meNodeCollection];

  v8 = [v7 localIdentifiers];
  [v6 setReferencePersonLocalIdentifiers:v8];

  [v6 setFocusOnPeople:1];
  return v6;
}

- (id)relevantCurationFeederForTriggeredMemory:(id)a3 relevantFeeder:(id)a4 inGraph:(id)a5 allowGuestAsset:(BOOL)a6 progressReporter:(id)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a7;
  v13 = [v10 memoryFeatureNodes];
  objc_super v14 = +[PGGraphNodeCollection subsetInCollection:v13];

  if ([v14 count] == 1)
  {
    v15 = [v10 memoryMomentNodes];
    v16 = [v14 anyNode];
    v17 = [(PGMemoryGenerator *)self memoryCurationSession];
    v18 = [v17 curationManager];
    v19 = +[PGMemoryGenerationHelper assetFetchResultForMomentNodes:v15 inLocationOrAreaNode:v16 requireInteresting:1 curationManager:v18 progressReporter:v12];

    v20 = [(PGMemoryGenerator *)self memoryCurationSession];
    v21 = +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:v19 memoryCurationSession:v20 graph:v11];
  }
  else
  {
    v22 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v24[0] = 67109120;
      v24[1] = [v14 count];
      _os_log_error_impl(&dword_1D1805000, v22, OS_LOG_TYPE_ERROR, "[PGPastSupersetMemoryGenerator] One frequent location node expected, found %d", (uint8_t *)v24, 8u);
    }

    v21 = 0;
  }

  return v21;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [v9 memoryFeatureNodes];
  v13 = +[PGGraphNodeCollection subsetInCollection:v12];

  if ([v13 count] == 1)
  {
    objc_super v14 = [v9 memoryMomentNodes];
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
      _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "[PGPastSupersetMemoryGenerator] One frequent location node expected, found %d", (uint8_t *)v23, 8u);
    }

    v20 = 0;
  }

  return v20;
}

- (void)_enumeratePotentialMemoriesWithGraph:(id)a3 usingBlock:(id)a4
{
  v271[1] = *MEMORY[0x1E4F143B8];
  id v167 = a3;
  v160 = (void (**)(id, void *, unsigned char *))a4;
  v169 = self;
  v174 = [(PGMemoryGenerator *)self controller];
  char v249 = 0;
  v157 = objc_opt_new();
  v6 = self;
  uint64_t v155 = [MEMORY[0x1E4F76C68] yearFromDate:self->_localDate];
  id v7 = (void *)MEMORY[0x1E4F76C68];
  v8 = [(PGPastSupersetMemoryGenerator *)v6 localDate];
  id v9 = [v7 dateByAddingMonths:-6 toDate:v8];

  id v166 = v9;
  id v10 = [(PGFeaturedMemoryGenerator *)v169 upperBoundLocalDate];

  v170 = v166;
  if (v10)
  {
    id v11 = [(PGFeaturedMemoryGenerator *)v169 upperBoundLocalDate];
    v170 = [v166 earlierDate:v11];
  }
  id v12 = objc_alloc(MEMORY[0x1E4F28C18]);
  v13 = [(PGPastSupersetMemoryGenerator *)v169 localDate];
  v184 = (void *)[v12 initWithStartDate:v166 endDate:v13];

  objc_super v14 = [MEMORY[0x1E4F1CA48] array];
  v15 = [(PGMemoryGenerator *)v169 locationHelper];
  v165 = +[PGGraphNodeCollection nodesInGraph:v167];
  v16 = (void *)MEMORY[0x1E4F71E88];
  v17 = +[PGGraphFrequentLocationNode momentOfFrequentLocation];
  v18 = [v16 adjacencyWithSources:v165 relation:v17 targetsClass:objc_opt_class()];

  v19 = (void *)MEMORY[0x1E4F71E88];
  v20 = +[PGGraphFrequentLocationNode addressOfFrequentLocation];
  v21 = [v19 adjacencyWithSources:v165 relation:v20 targetsClass:objc_opt_class()];

  v22 = (void *)MEMORY[0x1E4F71E88];
  v23 = [v21 targets];
  uint64_t v24 = +[PGGraphAddressNode cityOfAddress];
  uint64_t v25 = [v22 adjacencyWithSources:v23 relation:v24 targetsClass:objc_opt_class()];

  v242[0] = MEMORY[0x1E4F143A8];
  v242[1] = 3221225472;
  v242[2] = __81__PGPastSupersetMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke;
  v242[3] = &unk_1E68E4DA0;
  id v152 = v21;
  id v243 = v152;
  id v153 = v25;
  id v244 = v153;
  id v197 = v15;
  id v245 = v197;
  uint64_t v248 = 208;
  id v151 = v18;
  id v246 = v151;
  id v159 = v14;
  id v247 = v159;
  [v165 enumerateNodesUsingBlock:v242];
  id v180 = [MEMORY[0x1E4F1CA48] array];
  v26 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateInterval" ascending:1];
  v261 = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v261 count:1];
  v28 = [v159 sortedArrayUsingDescriptors:v27];

  long long v240 = 0u;
  long long v241 = 0u;
  long long v238 = 0u;
  long long v239 = 0u;
  obuint64_t j = v28;
  uint64_t v182 = [obj countByEnumeratingWithState:&v238 objects:v260 count:16];
  if (v182)
  {
    uint64_t v178 = *(void *)v239;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v239 != v178)
        {
          uint64_t v30 = v29;
          objc_enumerationMutation(obj);
          uint64_t v29 = v30;
        }
        uint64_t v185 = v29;
        v31 = *(void **)(*((void *)&v238 + 1) + 8 * v29);
        context = (void *)MEMORY[0x1D25FED50]();
        v198 = [v31 dateInterval];
        v189 = [v31 momentNodes];
        id v194 = [v31 supersetCityNodes];
        v192 = [v31 densestCloseLocationNodes];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v263 = __Block_byref_object_copy__1144;
        *(void *)v264 = __Block_byref_object_dispose__1145;
        *(void *)&v264[8] = 0;
        long long v234 = 0u;
        long long v235 = 0u;
        long long v236 = 0u;
        long long v237 = 0u;
        id v32 = v180;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v234 objects:v259 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v235;
          while (2)
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v235 != v34) {
                objc_enumerationMutation(v32);
              }
              v36 = *(void **)(*((void *)&v234 + 1) + 8 * i);
              v37 = [v36 dateInterval];
              v38 = [v198 intersectionWithDateInterval:v37];
              [v38 duration];
              BOOL v40 = v39 > 7889400.0;

              if (v40)
              {
                v41 = [v36 densestCloseLocationNodes];
                int v42 = [v41 containsCollection:v192];

                if (v42)
                {
                  uint64_t v54 = *(void *)&buf[8];
                  id v55 = v36;
                  id v53 = *(id *)(v54 + 40);
                  *(void *)(v54 + 40) = v55;
LABEL_24:

                  goto LABEL_25;
                }
                v43 = [v36 supersetCityNodes];
                v44 = [v197 stateNodeFromCityNodeAsCollection:v194];
                v45 = [v36 stateNodeAsCollection];
                if (v45)
                {
                  if ([v44 intersectsCollection:v45])
                  {
                    v46 = [v197 addressNodesFromLocationNodes:v194];
                    uint64_t v47 = [v46 anyNode];
                    [(id)v47 coordinate];
                    uint64_t v49 = v48;
                    uint64_t v51 = v50;

                    v227[0] = MEMORY[0x1E4F143A8];
                    v227[1] = 3221225472;
                    v227[2] = __81__PGPastSupersetMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_246;
                    v227[3] = &unk_1E68E4DC8;
                    id v52 = v197;
                    uint64_t v232 = v49;
                    uint64_t v233 = v51;
                    v231 = buf;
                    id v228 = v52;
                    v229 = v36;
                    id v53 = v43;
                    id v230 = v53;
                    [v53 enumerateIdentifiersAsCollectionsWithBlock:v227];
                    LOBYTE(v47) = *(void *)(*(void *)&buf[8] + 40) == 0;

                    if ((v47 & 1) == 0)
                    {

                      goto LABEL_24;
                    }
                  }
                }
              }
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v234 objects:v259 count:16];
            if (v33) {
              continue;
            }
            break;
          }
        }
LABEL_25:

        v56 = *(void **)(*(void *)&buf[8] + 40);
        if (v56)
        {
          v57 = [v56 dateInterval];
          v58 = [v57 startDate];
          v59 = [v198 startDate];
          v60 = [v58 earlierDate:v59];

          v61 = [v57 endDate];
          v62 = [v198 endDate];
          v63 = [v61 laterDate:v62];

          v64 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v60 endDate:v63];
          [*(id *)(*(void *)&buf[8] + 40) setDateInterval:v64];
          v65 = [*(id *)(*(void *)&buf[8] + 40) momentNodes];
          v66 = [v65 collectionByFormingUnionWith:v189];
          [*(id *)(*(void *)&buf[8] + 40) setMomentNodes:v66];

          v67 = [*(id *)(*(void *)&buf[8] + 40) supersetCityNodes];
          v68 = [v67 collectionByFormingUnionWith:v194];
          [*(id *)(*(void *)&buf[8] + 40) setSupersetCityNodes:v68];

          v69 = [*(id *)(*(void *)&buf[8] + 40) densestCloseLocationNodes];
          v70 = [v69 collectionByFormingUnionWith:v192];
          [*(id *)(*(void *)&buf[8] + 40) setDensestCloseLocationNodes:v70];
        }
        else
        {
          v57 = +[PGPastSupersetGroup pastSupersetGroupWithMomentNodes:v189 dateInterval:v198 supersetCityNodeAsCollection:v194 densestCloseLocationNodeAsCollection:v192 locationHelper:v197];
          [v32 addObject:v57];
        }

        _Block_object_dispose(buf, 8);
        uint64_t v29 = v185 + 1;
      }
      while (v185 + 1 != v182);
      uint64_t v182 = [obj countByEnumeratingWithState:&v238 objects:v260 count:16];
    }
    while (v182);
  }

  uint64_t v221 = 0;
  v222 = &v221;
  uint64_t v223 = 0x3032000000;
  v224 = __Block_byref_object_copy__1144;
  v225 = __Block_byref_object_dispose__1145;
  v226 = [(MAElementCollection *)[PGGraphLocationNodeCollection alloc] initWithGraph:v167];
  v199 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v219 = 0u;
  long long v220 = 0u;
  long long v217 = 0u;
  long long v218 = 0u;
  id v195 = v180;
  uint64_t v71 = [v195 countByEnumeratingWithState:&v217 objects:v258 count:16];
  if (v71)
  {
    uint64_t v72 = *(void *)v218;
    do
    {
      for (uint64_t j = 0; j != v71; ++j)
      {
        if (*(void *)v218 != v72) {
          objc_enumerationMutation(v195);
        }
        v74 = *(void **)(*((void *)&v217 + 1) + 8 * j);
        v75 = [v74 dateInterval];
        char v76 = [v75 intersectsDateInterval:v184];

        v77 = [v74 densestCloseLocationNodes];
        v212[0] = MEMORY[0x1E4F143A8];
        v212[1] = 3221225472;
        v212[2] = __81__PGPastSupersetMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_2;
        v212[3] = &unk_1E68E4DF0;
        id v213 = v199;
        v214 = v74;
        char v216 = v76;
        v215 = &v221;
        [v77 enumerateNodesUsingBlock:v212];
      }
      uint64_t v71 = [v195 countByEnumeratingWithState:&v217 objects:v258 count:16];
    }
    while (v71);
  }

  v78 = [v167 meNode];
  v156 = [v78 localIdentifier];

  v79 = [(PGMemoryGenerator *)v169 momentNodesWithBlockedFeatureCache];
  v164 = [v79 momentNodesWithBlockedFeature];

  v80 = [(PGMemoryGenerator *)v169 processedScenesAndFacesCache];
  v163 = [v80 momentNodesWithEnoughScenesProcessedInGraph:v167];
  long long v210 = 0u;
  long long v211 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  id v171 = v195;
  uint64_t v81 = [v171 countByEnumeratingWithState:&v208 objects:v257 count:16];
  v177 = v80;
  if (v81)
  {
    uint64_t v173 = 0;
    uint64_t v158 = 0;
    v154 = 0;
    uint64_t v161 = 0;
    uint64_t v168 = 0;
    uint64_t v176 = *(void *)v209;
    while (2)
    {
      uint64_t v82 = 0;
      uint64_t v172 = v81;
      do
      {
        if (*(void *)v209 != v176) {
          objc_enumerationMutation(v171);
        }
        contexta = *(void **)(*((void *)&v208 + 1) + 8 * v82);
        v83 = [v174 progressBlock];
        ((void (**)(void, char *, double))v83)[2](v83, &v249, 0.0);
        uint64_t v186 = v82;

        if (v249)
        {
          v140 = v171;
          goto LABEL_116;
        }
        v84 = [contexta momentNodes];
        if ([v177 allMomentNodesInCollectionHaveScenesProcessed:v84])
        {
          v179 = v84;
          v183 = [contexta densestCloseLocationNodes];
          v85 = [contexta dateInterval];
          v193 = [v85 endDate];

          if ([v193 compare:v170] == 1)
          {
            ++v168;
          }
          else
          {
            if ([(id)v222[5] intersectsCollection:v183])
            {
              v86 = [v183 collectionByIntersecting:v222[5]];
              long long v206 = 0u;
              long long v207 = 0u;
              long long v204 = 0u;
              long long v205 = 0u;
              v87 = [v86 temporarySet];
              uint64_t v88 = [v87 countByEnumeratingWithState:&v204 objects:v256 count:16];
              v162 = v86;
              if (v88)
              {
                uint64_t v191 = *(void *)v205;
                id v181 = v87;
                while (2)
                {
                  uint64_t v89 = 0;
                  uint64_t v190 = v88;
                  do
                  {
                    if (*(void *)v205 != v191) {
                      objc_enumerationMutation(v181);
                    }
                    v90 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v204 + 1) + 8 * v89), "identifier"));
                    v91 = [v199 objectForKeyedSubscript:v90];

                    id v196 = v91;
                    v92 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
                    v271[0] = v92;
                    v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v271 count:1];
                    v94 = [v196 sortedArrayUsingDescriptors:v93];

                    v95 = [v94 firstObject];
                    long long v253 = 0u;
                    long long v251 = 0u;
                    long long v252 = 0u;
                    long long v250 = 0u;
                    id v96 = v94;
                    uint64_t v97 = [v96 countByEnumeratingWithState:&v250 objects:buf count:16];
                    if (v97)
                    {
                      uint64_t v98 = *(void *)v251;
                      do
                      {
                        for (uint64_t k = 0; k != v97; ++k)
                        {
                          if (*(void *)v251 != v98) {
                            objc_enumerationMutation(v96);
                          }
                          v100 = *(void **)(*((void *)&v250 + 1) + 8 * k);
                          if ([v100 intersectsDateInterval:v95]) {
                            goto LABEL_60;
                          }
                          v101 = [v95 startDate];
                          v102 = [v100 endDate];
                          [v101 timeIntervalSinceDate:v102];
                          BOOL v104 = v103 > 15778800.0;

                          if (!v104)
                          {
LABEL_60:
                            id v105 = v100;

                            v95 = v105;
                          }
                        }
                        uint64_t v97 = [v96 countByEnumeratingWithState:&v250 objects:buf count:16];
                      }
                      while (v97);
                    }

                    v106 = [v95 startDate];

                    [v106 timeIntervalSinceDate:v193];
                    BOOL v108 = v107 < 31557600.0;

                    if (v108)
                    {

                      ++v158;
                      goto LABEL_93;
                    }
                    ++v89;
                  }
                  while (v89 != v190);
                  v87 = v181;
                  uint64_t v88 = [v181 countByEnumeratingWithState:&v204 objects:v256 count:16];
                  if (v88) {
                    continue;
                  }
                  break;
                }
              }
            }
            v109 = [v179 collectionBySubtracting:v164];
            v110 = [v109 collectionByIntersecting:v163];

            v111 = [v174 memoryGenerationContext];
            v112 = [v111 interestingWithAlternateJunkingSubsetFromMomentNodes:v110];

            if ((unint64_t)[v112 count] > 4)
            {
              v113 = [v112 universalDateInterval];
              [v113 duration];
              double v115 = v114;

              v116 = [v179 universalDateInterval];
              [v116 duration];
              double v118 = v117;
              v119 = (void *)MEMORY[0x1E4F76C68];
              v120 = [v116 startDate];
              uint64_t v121 = [v119 yearFromDate:v120];

              v122 = (void *)MEMORY[0x1E4F76C68];
              v123 = [v116 endDate];
              uint64_t v124 = [v122 yearFromDate:v123];

              if (((v155 - v124) & ~((v155 - v124) >> 63)) >= 10) {
                uint64_t v125 = 10;
              }
              else {
                uint64_t v125 = (v155 - v124) & ~((v155 - v124) >> 63);
              }
              if (v124 < v121) {
                uint64_t v126 = -1;
              }
              else {
                uint64_t v126 = v124 - v121;
              }
              if (v124 - v121 < 10) {
                uint64_t v127 = v126 + 1;
              }
              else {
                uint64_t v127 = 10;
              }
              if (v115 < 7889400.0 || v115 < v118 / 3.0)
              {
                v154 = (uint64_t (*)(uint64_t, uint64_t))((char *)v154 + 1);
              }
              else
              {
                [contexta supersetCityNodes];
                v129 = v128 = v179;
                uint64_t v130 = [v129 count];
                v131 = v129;
                if (v130 == 1 || (uint64_t v132 = [v183 count], v131 = v183, v132 == 1))
                {
                  v133 = [v131 anyNode];
                }
                else
                {
                  v134 = [contexta stateNodeAsCollection];
                  v133 = [v134 anyNode];

                  v128 = v179;
                }
                v135 = [v183 collectionByFormingUnionWith:v129];
                v136 = [[PGPotentialPastSupersetMemory alloc] initWithSupersetLocationNode:v133 supersetDateInterval:v116 interestingMomentNodes:v112 momentNodes:v128];
                [(PGPotentialMemory *)v136 setScore:(double)v127 / 10.0 * 0.4 + (double)v125 / 10.0 * 0.6];
                v137 = +[PGFeature featureWithNode:v133];
                if (v137)
                {
                  v138 = [MEMORY[0x1E4F1CAD0] setWithObject:v137];
                  [(PGPotentialMemory *)v136 setFeatures:v138];
                }
                [(PGPotentialPastSupersetMemory *)v136 setSupersetLocationNodes:v135];
                if ([v156 length])
                {
                  v139 = [MEMORY[0x1E4F1CAD0] setWithObject:v156];
                  [(PGPotentialMemory *)v136 setPeopleUUIDs:v139];
                }
                [v157 addObject:v136];
              }
            }
            else
            {
              ++v161;
            }
          }
LABEL_93:

          v84 = v179;
        }
        else
        {
          ++v173;
        }

        uint64_t v82 = v186 + 1;
      }
      while (v186 + 1 != v172);
      uint64_t v81 = [v171 countByEnumeratingWithState:&v208 objects:v257 count:16];
      if (v81) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v173 = 0;
    uint64_t v158 = 0;
    v154 = 0;
    uint64_t v161 = 0;
    uint64_t v168 = 0;
  }

  if (!v249)
  {
    v141 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
    v255[0] = v141;
    v142 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
    v255[1] = v142;
    v140 = [MEMORY[0x1E4F1C978] arrayWithObjects:v255 count:2];

    [v157 sortUsingDescriptors:v140];
    long long v202 = 0u;
    long long v203 = 0u;
    long long v200 = 0u;
    long long v201 = 0u;
    v143 = v157;
    uint64_t v144 = 0;
    uint64_t v145 = [v143 countByEnumeratingWithState:&v200 objects:v254 count:16];
    if (v145)
    {
      uint64_t v146 = *(void *)v201;
LABEL_102:
      uint64_t v147 = 0;
      while (1)
      {
        if (*(void *)v201 != v146) {
          objc_enumerationMutation(v143);
        }
        v148 = *(void **)(*((void *)&v200 + 1) + 8 * v147);
        v149 = [v174 progressBlock];
        ((void (**)(void, char *, double))v149)[2](v149, &v249, 0.0);

        if (v249) {
          break;
        }
        [v148 computeContentScore];
        if (v150 > 0.5 || [(PGFeaturedMemoryGenerator *)v169 usesLowRequirements])
        {
          buf[0] = 0;
          v160[2](v160, v148, buf);
          if (buf[0]) {
            goto LABEL_113;
          }
        }
        else
        {
          ++v144;
        }
        if (v145 == ++v147)
        {
          uint64_t v145 = [v143 countByEnumeratingWithState:&v200 objects:v254 count:16];
          if (v145) {
            goto LABEL_102;
          }
          goto LABEL_113;
        }
      }
    }
    else
    {
LABEL_113:

      v143 = [v174 loggingConnection];
      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219776;
        *(void *)&buf[4] = 0;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v161;
        *(_WORD *)&buf[22] = 2048;
        v263 = v154;
        *(_WORD *)v264 = 2048;
        *(void *)&v264[2] = v158;
        *(_WORD *)&v264[10] = 2048;
        *(void *)&v264[12] = v168;
        __int16 v265 = 2048;
        uint64_t v266 = v144;
        __int16 v267 = 2048;
        uint64_t v268 = 0;
        __int16 v269 = 2048;
        uint64_t v270 = v173;
        _os_log_impl(&dword_1D1805000, v143, OS_LOG_TYPE_DEFAULT, "Memory Creation Request: Found %lu, rejected %lu not interseting enough, %lu small superset duration overlap, %lu not disjoint from recent close supersets, %lu untimely, %lu low scoring, %lu insufficiently Superseted, %lu not enough scenes processed", buf, 0x52u);
      }
    }

LABEL_116:
  }

  _Block_object_dispose(&v221, 8);
}

void __81__PGPastSupersetMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "targetsForSourceIdentifier:", objc_msgSend(v3, "identifier"));
  id v5 = [*(id *)(a1 + 40) targetsForSources:v4];
  if ([v5 count])
  {
    v17 = v4;
    v6 = [v5 anyNode];
    id v7 = [*(id *)(a1 + 48) densestCloseLocationNodeFromLocationNode:v6 withDateInterval:0 locationMask:*(void *)(a1 + 72)];
    if (!v7)
    {
      v8 = +[PGLogging sharedLogging];
      id v9 = [v8 loggingConnection];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "No densestLocationNode for supersetCityNode %@", buf, 0xCu);
      }

      id v7 = v6;
    }
    id v10 = objc_msgSend(*(id *)(a1 + 56), "targetsForSourceIdentifier:", objc_msgSend(v3, "identifier"));
    id v11 = [v3 universalDateInterval];
    id v12 = [v6 collection];
    v13 = [v7 locationNodeCollection];
    objc_super v14 = +[PGPastSupersetGroup pastSupersetGroupWithMomentNodes:v10 dateInterval:v11 supersetCityNodeAsCollection:v12 densestCloseLocationNodeAsCollection:v13 locationHelper:*(void *)(a1 + 48)];

    [*(id *)(a1 + 64) addObject:v14];
    v4 = v17;
  }
  else
  {
    v15 = +[PGLogging sharedLogging];
    v6 = [v15 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v16 = [v4 anyNode];
      *(_DWORD *)buf = 138477827;
      v19 = v16;
      _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "No supersetCityNode for home superset best address node %{private}@", buf, 0xCu);
    }
  }
}

void __81__PGPastSupersetMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_246(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v6 = objc_msgSend(*(id *)(a1 + 32), "addressNodesFromLocationNodes:");
  id v7 = [v6 anyNode];
  [v7 coordinate];
  uint64_t v11 = v8;
  uint64_t v12 = v9;

  CLLocationCoordinate2DGetDistanceFrom();
  if (v10 <= 160000.0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
    goto LABEL_5;
  }
  if (v10 > (double)(unint64_t)objc_msgSend(*(id *)(a1 + 48), "count", v11, v12) * 160000.0) {
LABEL_5:
  }
    *a4 = 1;
}

void __81__PGPastSupersetMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "identifier"));
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");

  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v12];
  }
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
  v6 = [*(id *)(a1 + 40) dateInterval];
  [v5 addObject:v6];

  if (*(unsigned char *)(a1 + 56))
  {
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v8 = [*(id *)(a1 + 40) densestCloseLocationNodes];
    uint64_t v9 = [v7 collectionByFormingUnionWith:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

@end