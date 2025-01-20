@interface PGSocialGroupsQuestionFactory
+ (void)enumeratePeopleClustersWithGraph:(id)a3 withLinkage:(unint64_t)a4 withBlock:(id)a5;
+ (void)enumerateSocialGroupsWithGraph:(id)a3 withLinkage:(unint64_t)a4 validGroupsBlock:(id)a5 invalidGroupsBlock:(id)a6 averageWeight:(float *)a7;
- (id)_createSocialGroupWithPersonLocalIdentifiers:(id)a3;
- (id)_identifierForPersonNodesAsString:(id)a3;
- (id)_socialGroupsForSurvey:(id)a3 withLimit:(unint64_t)a4;
- (id)_socialGroupsForSurveyFromCurrentAlgorithm:(id)a3;
- (id)_socialGroupsForSurveyFromCustomAlgorithm:(id)a3;
- (id)_socialGroupsForSurveyFromNewAlgorithm:(id)a3 withLinkage:(unint64_t)a4;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGSocialGroupsQuestionFactory

+ (void)enumeratePeopleClustersWithGraph:(id)a3 withLinkage:(unint64_t)a4 withBlock:(id)a5
{
  v147[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v79 = (void (**)(id, id, id, id, id, unsigned char *, float))a5;
  [v7 _checkCanRead];
  v8 = [v7 meNode];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v83 = [v7 relevantMomentNodesForSocialGroupProcessing];
  v139[0] = 0;
  v139[1] = v139;
  v139[2] = 0x2020000000;
  v139[3] = 0;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v136[0] = MEMORY[0x1E4F143A8];
  v136[1] = 3221225472;
  v136[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke;
  v136[3] = &unk_1E68EE990;
  id v11 = v10;
  id v137 = v11;
  v138 = v139;
  [v83 enumerateObjectsUsingBlock:v136];
  v133[0] = MEMORY[0x1E4F143A8];
  v133[1] = 3221225472;
  v133[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_3;
  v133[3] = &unk_1E68F0820;
  id v12 = v11;
  id v134 = v12;
  id v76 = v8;
  id v135 = v76;
  [v7 enumerateNodesInDomain:300 usingBlock:v133];
  uint64_t v129 = 0;
  v130 = &v129;
  uint64_t v131 = 0x2020000000;
  uint64_t v132 = 0;
  v125[0] = MEMORY[0x1E4F143A8];
  v125[1] = 3221225472;
  v125[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_4;
  v125[3] = &unk_1E68EEAA0;
  id v126 = v12;
  v128 = &v129;
  id v84 = v9;
  id v127 = v84;
  id v77 = v126;
  [v126 enumerateKeysAndObjectsUsingBlock:v125];
  v82 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"personNodes" ascending:1 comparator:&__block_literal_global_404];
  v81 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"superGroupMomentNodes" ascending:0 comparator:&__block_literal_global_408];
  v147[0] = v82;
  v147[1] = v81;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v147 count:2];
  [v84 sortUsingDescriptors:v13];

  id v14 = objc_alloc(MEMORY[0x1E4F8A870]);
  v123[0] = MEMORY[0x1E4F143A8];
  v123[1] = 3221225472;
  v123[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_6;
  v123[3] = &unk_1E68EEAE8;
  id v85 = v7;
  id v124 = v85;
  v15 = (void *)[v14 initWithDistanceBlock:v123];
  [v15 setK:1];
  [v15 setLinkage:a4];
  if ([v15 linkage] == 5) {
    [v15 setClusterKeyElementBlock:&__block_literal_global_413];
  }
  if ([v15 linkage] == 4) {
    [v15 setClusterConsolidationBlock:&__block_literal_global_416_65254];
  }
  [v15 setThreshold:0.0];
  v75 = v15;
  v16 = [v15 performWithDataset:v84 progressBlock:0];
  v17 = [v16 sortedArrayUsingComparator:&__block_literal_global_419];

  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  obuint64_t j = v17;
  uint64_t v18 = [obj countByEnumeratingWithState:&v119 objects:v146 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v120;
    uint64_t v72 = *(void *)v120;
    do
    {
      uint64_t v78 = 0;
      uint64_t v73 = v18;
      do
      {
        if (*(void *)v120 != v19) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v119 + 1) + 8 * v78);
        context = (void *)MEMORY[0x1D25FED50]();
        v21 = [v20 objects];
        id v90 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        id v91 = v21;
        v22 = [v21 valueForKey:@"momentNodes"];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v115 objects:v145 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v116;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v116 != v24) {
                objc_enumerationMutation(v22);
              }
              [v90 addObjectsFromArray:*(void *)(*((void *)&v115 + 1) + 8 * i)];
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v115 objects:v145 count:16];
          }
          while (v23);
        }

        id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        v27 = [v91 valueForKey:@"superGroupMomentNodes"];
        uint64_t v28 = [v27 countByEnumeratingWithState:&v111 objects:v144 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v112;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v112 != v29) {
                objc_enumerationMutation(v27);
              }
              v31 = *(void **)(*((void *)&v111 + 1) + 8 * j);
              long long v107 = 0u;
              long long v108 = 0u;
              long long v109 = 0u;
              long long v110 = 0u;
              id v32 = v31;
              uint64_t v33 = [v32 countByEnumeratingWithState:&v107 objects:v143 count:16];
              if (v33)
              {
                uint64_t v34 = *(void *)v108;
                do
                {
                  for (uint64_t k = 0; k != v33; ++k)
                  {
                    if (*(void *)v108 != v34) {
                      objc_enumerationMutation(v32);
                    }
                    if (([v26 containsObject:*(void *)(*((void *)&v107 + 1) + 8 * k)] & 1) == 0) {
                      [v26 addObjectsFromArray:v32];
                    }
                  }
                  uint64_t v33 = [v32 countByEnumeratingWithState:&v107 objects:v143 count:16];
                }
                while (v33);
              }
            }
            uint64_t v28 = [v27 countByEnumeratingWithState:&v111 objects:v144 count:16];
          }
          while (v28);
        }

        id v93 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        id v86 = v91;
        uint64_t v36 = [v86 countByEnumeratingWithState:&v103 objects:v142 count:16];
        if (v36)
        {
          uint64_t v87 = *(void *)v104;
          do
          {
            uint64_t v37 = 0;
            uint64_t v88 = v36;
            do
            {
              if (*(void *)v104 != v87) {
                objc_enumerationMutation(v86);
              }
              uint64_t v89 = v37;
              v38 = *(void **)(*((void *)&v103 + 1) + 8 * v37);
              long long v99 = 0u;
              long long v100 = 0u;
              long long v101 = 0u;
              long long v102 = 0u;
              v39 = [v38 objectForKeyedSubscript:@"personNodes"];
              uint64_t v40 = [v39 countByEnumeratingWithState:&v99 objects:v141 count:16];
              if (v40)
              {
                uint64_t v41 = *(void *)v100;
                id v92 = v39;
                do
                {
                  for (uint64_t m = 0; m != v40; ++m)
                  {
                    if (*(void *)v100 != v41) {
                      objc_enumerationMutation(v92);
                    }
                    v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v99 + 1) + 8 * m), "identifier"));
                    v44 = [v93 objectForKeyedSubscript:v43];
                    uint64_t v45 = [v44 unsignedIntegerValue];

                    v46 = NSNumber;
                    v47 = [v38 objectForKeyedSubscript:@"momentNodes"];
                    v48 = objc_msgSend(v46, "numberWithUnsignedInteger:", objc_msgSend(v47, "count") + v45);
                    [v93 setObject:v48 forKeyedSubscript:v43];
                  }
                  v39 = v92;
                  uint64_t v40 = [v92 countByEnumeratingWithState:&v99 objects:v141 count:16];
                }
                while (v40);
              }

              uint64_t v37 = v89 + 1;
            }
            while (v89 + 1 != v88);
            uint64_t v36 = [v86 countByEnumeratingWithState:&v103 objects:v142 count:16];
          }
          while (v36);
        }

        v49 = [v93 keysSortedByValueUsingComparator:&__block_literal_global_424];
        id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v52 = [v49 firstObject];
        v53 = [v93 objectForKeyedSubscript:v52];
        [v53 floatValue];
        float v55 = v54;

        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id v56 = v49;
        uint64_t v57 = [v56 countByEnumeratingWithState:&v95 objects:v140 count:16];
        if (v57)
        {
          uint64_t v58 = *(void *)v96;
LABEL_49:
          uint64_t v59 = 0;
          while (1)
          {
            if (*(void *)v96 != v58) {
              objc_enumerationMutation(v56);
            }
            v60 = *(void **)(*((void *)&v95 + 1) + 8 * v59);
            double v61 = 0.0;
            if (v55 <= 0.0
              || ([v93 objectForKeyedSubscript:*(void *)(*((void *)&v95 + 1) + 8 * v59)],
                  v62 = objc_claimAutoreleasedReturnValue(),
                  [v62 doubleValue],
                  double v64 = v63,
                  v62,
                  double v61 = v64 / v55,
                  v61 < 0.35))
            {
              if ([v93 count] != 1) {
                break;
              }
            }
            v65 = objc_msgSend(v85, "nodeForIdentifier:", objc_msgSend(v60, "unsignedIntegerValue"));
            [v50 addObject:v65];

            v66 = [NSNumber numberWithDouble:v61];
            [v51 addObject:v66];

            if (v57 == ++v59)
            {
              uint64_t v57 = [v56 countByEnumeratingWithState:&v95 objects:v140 count:16];
              if (v57) {
                goto LABEL_49;
              }
              break;
            }
          }
        }

        if ([v50 count] == 1)
        {
          v67 = [v50 objectAtIndexedSubscript:0];
          BOOL v68 = (unint64_t)[v67 numberOfMomentNodes] > 1;

          if (v68) {
            goto LABEL_61;
          }
        }
        else if ((unint64_t)[v26 count] >= 2)
        {
LABEL_61:
          unint64_t v70 = [v26 count];
          float v71 = (float)v70 / (float)(unint64_t)v130[3];
          unsigned __int8 v94 = 0;
          v79[2](v79, v50, v51, v90, v26, &v94, v71);
          int v69 = v94;
          goto LABEL_62;
        }
        int v69 = 3;
LABEL_62:

        uint64_t v19 = v72;
        if (v69 != 3 && v69) {
          goto LABEL_66;
        }
        ++v78;
      }
      while (v78 != v73);
      uint64_t v18 = [obj countByEnumeratingWithState:&v119 objects:v146 count:16];
    }
    while (v18);
  }
LABEL_66:

  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(v139, 8);
}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6 = a2;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_2;
  v12[3] = &unk_1E68EF528;
  id v8 = v7;
  id v13 = v8;
  [v6 enumeratePersonNodesUsingBlock:v12];
  if ([v8 count])
  {
    id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
      [v10 addObject:v6];
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
      [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v8];

      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    *a4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 0x3E8uLL;
  }
}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v4 addObject:v9];
  v5 = [*(id *)(a1 + 32) objectForKey:v4];
  if (v5)
  {
  }
  else
  {
    id v6 = [v9 localIdentifier];
    id v7 = [*(id *)(a1 + 40) localIdentifier];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
    }
  }
}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v82 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v81 = a1;
  id v7 = *(void **)(a1 + 32);
  v139[0] = MEMORY[0x1E4F143A8];
  v139[1] = 3221225472;
  v139[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_5;
  v139[3] = &unk_1E68EE9B8;
  id v8 = v5;
  id v140 = v8;
  obuint64_t j = v6;
  id v141 = obj;
  [v7 enumerateKeysAndObjectsUsingBlock:v139];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v10 = v8;
  id v86 = v10;
  uint64_t v96 = [v10 countByEnumeratingWithState:&v135 objects:v154 count:16];
  if (v96)
  {
    uint64_t v94 = *(void *)v136;
    do
    {
      for (uint64_t i = 0; i != v96; ++i)
      {
        if (*(void *)v136 != v94) {
          objc_enumerationMutation(v10);
        }
        id v12 = [*(id *)(*((void *)&v135 + 1) + 8 * i) collection];
        id v13 = [v12 relationshipEdges];
        id v14 = [v13 labels];

        long long v133 = 0u;
        long long v134 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v131 objects:v153 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v132;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v132 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v131 + 1) + 8 * j);
              v21 = [v9 objectForKey:v20];

              if (v21)
              {
                v22 = NSNumber;
                uint64_t v23 = [v9 objectForKeyedSubscript:v20];
                [v23 doubleValue];
                v25 = [v22 numberWithDouble:v24 + 1.0];
                [v9 setObject:v25 forKeyedSubscript:v20];
              }
              else
              {
                [v9 setObject:&unk_1F28D2BB0 forKeyedSubscript:v20];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v131 objects:v153 count:16];
          }
          while (v17);
        }

        id v10 = v86;
      }
      uint64_t v96 = [v86 countByEnumeratingWithState:&v135 objects:v154 count:16];
    }
    while (v96);
  }

  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v26 = [v9 allKeys];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v127 objects:v152 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v128;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v128 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v127 + 1) + 8 * k);
        id v32 = NSNumber;
        uint64_t v33 = [v9 objectForKeyedSubscript:v31];
        [v33 doubleValue];
        v35 = objc_msgSend(v32, "numberWithDouble:", v34 / (double)(unint64_t)objc_msgSend(v10, "count"));
        [v9 setObject:v35 forKeyedSubscript:v31];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v127 objects:v152 count:16];
    }
    while (v28);
  }

  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v95 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v93 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v151[0] = @"Hiking";
  v151[1] = @"Climbing";
  v151[2] = @"Beaching";
  v151[3] = @"Diving";
  v151[4] = @"WinterSport";
  v151[5] = @"Entertainment";
  v151[6] = @"Performance";
  v151[7] = @"Concert";
  v151[8] = @"Festival";
  v151[9] = @"Dance";
  v151[10] = @"SportEvent";
  uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v151 count:11];
  v150[0] = @"Beach";
  v150[1] = @"Urban";
  v150[2] = @"Mountain";
  v150[3] = @"Nature";
  id v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v150 count:4];
  v149[0] = @"Restaurant";
  v149[1] = @"AmusementPark";
  v149[2] = @"Park";
  v149[3] = @"Culture";
  v149[4] = @"Nightlife";
  v149[5] = @"Travel";
  v149[6] = @"Entertainment";
  id v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:v149 count:7];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v38 = obj;
  long long v97 = v38;
  uint64_t v87 = [v38 countByEnumeratingWithState:&v123 objects:v148 count:16];
  if (v87)
  {
    uint64_t v83 = *(void *)v124;
    do
    {
      v39 = 0;
      do
      {
        if (*(void *)v124 != v83) {
          objc_enumerationMutation(v38);
        }
        uint64_t v88 = *(void **)(*((void *)&v123 + 1) + 8 * (void)v39);
        obja = v39;
        uint64_t v40 = [v88 meaningLabelsIncludingParents];
        long long v119 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        uint64_t v41 = [v40 countByEnumeratingWithState:&v119 objects:v147 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v120;
          do
          {
            for (uint64_t m = 0; m != v42; ++m)
            {
              if (*(void *)v120 != v43) {
                objc_enumerationMutation(v40);
              }
              uint64_t v45 = *(void *)(*((void *)&v119 + 1) + 8 * m);
              if ([v37 containsObject:v45])
              {
                v46 = [v36 objectForKey:v45];

                if (v46)
                {
                  v47 = NSNumber;
                  v48 = [v36 objectForKeyedSubscript:v45];
                  [v48 doubleValue];
                  id v50 = [v47 numberWithDouble:v49 + 1.0];
                  [v36 setObject:v50 forKeyedSubscript:v45];
                }
                else
                {
                  [v36 setObject:&unk_1F28D2BB0 forKeyedSubscript:v45];
                }
              }
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v119 objects:v147 count:16];
          }
          while (v42);
        }
        v116[0] = MEMORY[0x1E4F143A8];
        v116[1] = 3221225472;
        v116[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_395;
        v116[3] = &unk_1E68EEA28;
        id v117 = &unk_1F28D4BD8;
        id v118 = v36;
        [v88 enumerateSceneEdgesAndNodesUsingBlock:v116];
        v113[0] = MEMORY[0x1E4F143A8];
        v113[1] = 3221225472;
        v113[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_2_397;
        v113[3] = &unk_1E68EEA50;
        id v114 = v85;
        id v115 = v95;
        [v88 enumerateROINodesUsingBlock:v113];
        v110[0] = MEMORY[0x1E4F143A8];
        v110[1] = 3221225472;
        v110[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_3_399;
        v110[3] = &unk_1E68EEA78;
        id v111 = v84;
        id v112 = v93;
        [v88 enumeratePOINodesUsingBlock:v110];

        v39 = obja + 1;
        id v38 = v97;
      }
      while (obja + 1 != (char *)v87);
      uint64_t v87 = [v97 countByEnumeratingWithState:&v123 objects:v148 count:16];
    }
    while (v87);
  }

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v51 = [v36 allKeys];
  uint64_t v52 = [v51 countByEnumeratingWithState:&v106 objects:v146 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v107;
    do
    {
      for (uint64_t n = 0; n != v53; ++n)
      {
        if (*(void *)v107 != v54) {
          objc_enumerationMutation(v51);
        }
        uint64_t v56 = *(void *)(*((void *)&v106 + 1) + 8 * n);
        uint64_t v57 = NSNumber;
        uint64_t v58 = [v36 objectForKeyedSubscript:v56];
        [v58 doubleValue];
        v60 = objc_msgSend(v57, "numberWithDouble:", v59 / (double)(unint64_t)objc_msgSend(v97, "count"));
        [v36 setObject:v60 forKeyedSubscript:v56];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v106 objects:v146 count:16];
    }
    while (v53);
  }

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id objb = [v95 allKeys];
  uint64_t v61 = [objb countByEnumeratingWithState:&v102 objects:v145 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v103;
    do
    {
      for (iuint64_t i = 0; ii != v62; ++ii)
      {
        if (*(void *)v103 != v63) {
          objc_enumerationMutation(objb);
        }
        uint64_t v65 = *(void *)(*((void *)&v102 + 1) + 8 * ii);
        v66 = NSNumber;
        v67 = [v95 objectForKeyedSubscript:v65];
        [v67 doubleValue];
        int v69 = objc_msgSend(v66, "numberWithDouble:", v68 / (double)(unint64_t)objc_msgSend(v97, "count"));
        [v95 setObject:v69 forKeyedSubscript:v65];
      }
      uint64_t v62 = [objb countByEnumeratingWithState:&v102 objects:v145 count:16];
    }
    while (v62);
  }

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id objc = [v93 allKeys];
  uint64_t v70 = [objc countByEnumeratingWithState:&v98 objects:v144 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v99;
    do
    {
      for (juint64_t j = 0; jj != v71; ++jj)
      {
        if (*(void *)v99 != v72) {
          objc_enumerationMutation(objc);
        }
        uint64_t v74 = *(void *)(*((void *)&v98 + 1) + 8 * jj);
        v75 = NSNumber;
        id v76 = [v93 objectForKeyedSubscript:v74];
        [v76 doubleValue];
        uint64_t v78 = objc_msgSend(v75, "numberWithDouble:", v77 / (double)(unint64_t)objc_msgSend(v97, "count"));
        [v93 setObject:v78 forKeyedSubscript:v74];
      }
      uint64_t v71 = [objc countByEnumeratingWithState:&v98 objects:v144 count:16];
    }
    while (v71);
  }

  if ((unint64_t)[v97 count] >= 2 && objc_msgSend(v86, "count"))
  {
    *(void *)(*(void *)(*(void *)(v81 + 48) + 8) + 24) += [v82 count];
    v79 = *(void **)(v81 + 40);
    v142[0] = @"momentNodes";
    v142[1] = @"superGroupMomentNodes";
    v143[0] = v82;
    v143[1] = v97;
    v142[2] = @"personNodes";
    v142[3] = @"relationshipsDistribution";
    v143[2] = v86;
    v143[3] = v9;
    v142[4] = @"activitiesDistribution";
    v142[5] = @"roisDistribution";
    v143[4] = v36;
    v143[5] = v95;
    v142[6] = @"poisDistribution";
    v143[6] = v93;
    v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v143 forKeys:v142 count:7];
    [v79 addObject:v80];
  }
}

double __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"personNodes"];
  id v8 = [v5 objectForKeyedSubscript:@"personNodes"];
  if (([v7 isSubsetOfSet:v8] & 1) != 0
    || (double v9 = 3.0, [v8 isSubsetOfSet:v7]))
  {
    [*(id *)(a1 + 32) peopleDistance:v5 withSecondBaseGroup:v6 threshold:0.28 factor:0.33];
    double v11 = v10 + 0.0;
    [*(id *)(a1 + 32) momentsCountDistance:v5 withSecondBaseGroup:v6 withSubsetBias:@"momentNodes" withDistanceThreshold:0.0 withIntersectionBias:0.66 withKey:0.2];
    double v9 = v11 + v12;
  }

  return v9;
}

uint64_t __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objects];
  id v6 = [v5 valueForKeyPath:@"@sum.momentNodes.@count"];

  id v7 = [v4 objects];

  id v8 = [v7 valueForKeyPath:@"@sum.momentNodes.@count"];

  uint64_t v9 = [v8 compare:v6];
  return v9;
}

id __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v28 = a5;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (a4)
  {
    uint64_t v8 = a4;
    for (uint64_t i = 0; i != v8; ++i)
    {
      double v10 = [v28 objectAtIndexedSubscript:*(void *)(*(void *)(a2 + 8 * a3) + 8 * i)];
      double v11 = [v10 objectForKeyedSubscript:@"momentNodes"];
      [v27 addObjectsFromArray:v11];

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      double v12 = [v10 objectForKeyedSubscript:@"superGroupMomentNodes"];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v34 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v33 + 1) + 8 * j);
            if (([v6 containsObject:v17] & 1) == 0) {
              [v6 addObject:v17];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v14);
      }

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v18 = [v10 objectForKeyedSubscript:@"personNodes"];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v30;
        do
        {
          for (uint64_t k = 0; k != v20; ++k)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            [v7 addObject:*(void *)(*((void *)&v29 + 1) + 8 * k)];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v20);
      }
    }
  }
  [v24 setObject:v7 forKeyedSubscript:@"personNodes"];
  [v24 setObject:v27 forKeyedSubscript:@"momentNodes"];
  [v24 setObject:v6 forKeyedSubscript:@"superGroupMomentNodes"];

  return v24;
}

uint64_t __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a4)
  {
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    for (uint64_t i = 0; i != a4; ++i)
    {
      double v12 = [a5 objectAtIndexedSubscript:*(void *)(*(void *)(a2 + 8 * a3) + 8 * i)];
      uint64_t v13 = [v12 objectForKeyedSubscript:@"personNodes"];
      if ([v13 count] > v9)
      {
        unint64_t v9 = [v13 count];
        uint64_t v10 = i;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  return *(void *)(*(void *)(a2 + 8 * a3) + 8 * v10);
}

uint64_t __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_5_405(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 >= [v5 count])
  {
    unint64_t v8 = [v4 count];
    uint64_t v7 = v8 > [v5 count];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

uint64_t __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_4_401(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 >= [v5 count])
  {
    unint64_t v8 = [v4 count];
    uint64_t v7 = v8 > [v5 count];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(a1 + 32) isSubsetOfSet:a2]) {
    [*(id *)(a1 + 40) addObjectsFromArray:v5];
  }
}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_395(uint64_t a1, void *a2, void *a3)
{
  id v13 = a3;
  int v5 = [a2 isReliable];
  unint64_t v6 = v13;
  if (v5)
  {
    uint64_t v7 = [v13 sceneName];
    if ([*(id *)(a1 + 32) containsObject:v7])
    {
      unint64_t v8 = [*(id *)(a1 + 40) objectForKey:v7];

      if (v8)
      {
        unint64_t v9 = NSNumber;
        uint64_t v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
        [v10 doubleValue];
        double v12 = [v9 numberWithDouble:v11 + 1.0];
        [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:v7];
      }
      else
      {
        [*(id *)(a1 + 40) setObject:&unk_1F28D2BB0 forKeyedSubscript:v7];
      }
    }

    unint64_t v6 = v13;
  }
}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_2_397(uint64_t a1, void *a2)
{
  id v8 = [a2 label];
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    id v3 = [*(id *)(a1 + 40) objectForKey:v8];

    if (v3)
    {
      id v4 = NSNumber;
      int v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
      [v5 doubleValue];
      uint64_t v7 = [v4 numberWithDouble:v6 + 1.0];
      [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v8];
    }
    else
    {
      [*(id *)(a1 + 40) setObject:&unk_1F28D2BB0 forKeyedSubscript:v8];
    }
  }
}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_3_399(uint64_t a1, void *a2)
{
  id v8 = [a2 label];
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    id v3 = [*(id *)(a1 + 40) objectForKey:v8];

    if (v3)
    {
      id v4 = NSNumber;
      int v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
      [v5 doubleValue];
      uint64_t v7 = [v4 numberWithDouble:v6 + 1.0];
      [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v8];
    }
    else
    {
      [*(id *)(a1 + 40) setObject:&unk_1F28D2BB0 forKeyedSubscript:v8];
    }
  }
}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isMeNode] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

+ (void)enumerateSocialGroupsWithGraph:(id)a3 withLinkage:(unint64_t)a4 validGroupsBlock:(id)a5 invalidGroupsBlock:(id)a6 averageWeight:(float *)a7
{
  uint64_t v252 = *MEMORY[0x1E4F143B8];
  id v196 = a3;
  v179 = (void (**)(id, void *, void *, void *, void *, float, double, float, float, float, float, float, float, double))a5;
  id v10 = a6;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v242 = 0;
  v243 = (float *)&v242;
  uint64_t v244 = 0x2020000000;
  int v245 = 0;
  uint64_t v238 = 0;
  v239 = (float *)&v238;
  uint64_t v240 = 0x2020000000;
  int v241 = 0;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v234 = 0;
  v235 = &v234;
  uint64_t v236 = 0x2020000000;
  uint64_t v237 = 0;
  uint64_t v14 = objc_opt_class();
  v226[0] = MEMORY[0x1E4F143A8];
  v226[1] = 3221225472;
  v226[2] = __126__PGSocialGroupsQuestionFactory_enumerateSocialGroupsWithGraph_withLinkage_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke;
  v226[3] = &unk_1E68EE948;
  v231 = &v234;
  v232 = &v242;
  v233 = &v238;
  id v177 = v12;
  id v227 = v177;
  id v176 = v13;
  id v228 = v176;
  id v180 = v10;
  id v230 = v180;
  id v175 = v11;
  id v229 = v175;
  [v14 enumeratePeopleClustersWithGraph:v196 withLinkage:a4 withBlock:v226];
  unint64_t v15 = v235[3];
  if (!v15) {
    goto LABEL_72;
  }
  v243[6] = v243[6] / (float)v15;
  uint64_t v16 = [v177 sortedArrayUsingComparator:&__block_literal_global_65319];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:v16];
  [v17 mean];
  float v19 = v18;
  v173 = v17;
  [v17 standardDeviation];
  float v21 = v20;
  id v193 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v224 = 0u;
  long long v225 = 0u;
  long long v222 = 0u;
  long long v223 = 0u;
  obuint64_t j = v16;
  uint64_t v22 = [obj countByEnumeratingWithState:&v222 objects:v251 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v223;
    float v24 = v19 - v21;
    float v25 = v19 + v21;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v223 != v23) {
          objc_enumerationMutation(obj);
        }
        id v27 = *(void **)(*((void *)&v222 + 1) + 8 * i);
        [v27 floatValue];
        if (v28 >= v24)
        {
          [v27 floatValue];
          if (v29 <= v25) {
            [v193 addObject:v27];
          }
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v222 objects:v251 count:16];
    }
    while (v22);
  }

  v172 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:v193];
  [v172 mean];
  int v188 = v30;
  long long v31 = [v176 sortedArrayUsingComparator:&__block_literal_global_342_65321];
  long long v32 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:v31];
  [v32 mean];
  float v34 = v33;
  v171 = v32;
  [v32 standardDeviation];
  float v36 = v35;
  id v192 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v220 = 0u;
  long long v221 = 0u;
  long long v218 = 0u;
  long long v219 = 0u;
  id v182 = v31;
  uint64_t v37 = [v182 countByEnumeratingWithState:&v218 objects:v250 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v219;
    float v39 = v34 - v36;
    float v40 = v34 + v36;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v219 != v38) {
          objc_enumerationMutation(v182);
        }
        uint64_t v42 = *(void **)(*((void *)&v218 + 1) + 8 * j);
        [v42 floatValue];
        if (v43 >= v39)
        {
          [v42 floatValue];
          if (v44 <= v40) {
            [v192 addObject:v42];
          }
        }
      }
      uint64_t v37 = [v182 countByEnumeratingWithState:&v218 objects:v250 count:16];
    }
    while (v37);
  }

  v170 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:v192];
  [v170 mean];
  int v186 = v45;
  unint64_t v46 = v235[3];
  if (v46 > 0xC7) {
    float v47 = -0.1;
  }
  else {
    float v47 = (float)((float)((float)v46 / 200.0) * 0.5) + -0.1;
  }
  float v178 = v47;
  id v191 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v216 = 0u;
  long long v217 = 0u;
  long long v214 = 0u;
  long long v215 = 0u;
  id v181 = v175;
  uint64_t v190 = [v181 countByEnumeratingWithState:&v214 objects:v249 count:16];
  if (v190)
  {
    uint64_t v184 = *(void *)v215;
    do
    {
      for (uint64_t k = 0; k != v190; ++k)
      {
        if (*(void *)v215 != v184) {
          objc_enumerationMutation(v181);
        }
        v48 = *(void **)(*((void *)&v214 + 1) + 8 * k);
        double v49 = [v48 objectForKeyedSubscript:@"personNodes"];
        id v50 = [v48 objectForKeyedSubscript:@"peopleWeights"];
        id v51 = [v48 objectForKeyedSubscript:@"momentNodes"];
        uint64_t v52 = [v48 objectForKeyedSubscript:@"frequency"];
        [v52 floatValue];
        float v54 = v53;

        float v55 = [v48 objectForKeyedSubscript:@"superGroupMomentNodes"];
        *(float *)&double v56 = (float)(unint64_t)[v51 count];
        LODWORD(v57) = v188;
        LODWORD(v58) = 1060320051;
        [v196 normalizeFeatureValue:v193 average:v56 featureValues:v57 factor:v58];
        float v60 = v59;
        *(float *)&double v61 = (float)(unint64_t)[v55 count];
        LODWORD(v62) = v186;
        LODWORD(v63) = 1060320051;
        [v196 normalizeFeatureValue:v192 average:v61 featureValues:v62 factor:v63];
        float v65 = v64;
        [v196 averageTopMomentTimes:v55 numberOfMoments:3];
        double v67 = v66;
        double v68 = [MEMORY[0x1E4F1C9C8] date];
        [v68 timeIntervalSince1970];
        double v70 = v69;
        v207 = v55;

        uint64_t v71 = [MEMORY[0x1E4F1C9C8] date];
        v209 = [v71 dateByAddingTimeInterval:-157680000.0];

        [v209 timeIntervalSince1970];
        double v73 = v72;
        uint64_t v74 = [v48 objectForKeyedSubscript:@"distribution"];
        v75 = [(id)v74 objectForKeyedSubscript:@"relationshipsDistribution"];
        v194 = (void *)v74;
        id v76 = [v75 objectForKey:@"FAMILY"];
        v197 = v75;
        LOBYTE(v74) = v76 == 0;

        if (v74)
        {
          float v79 = 0.0;
        }
        else
        {
          double v77 = [v75 objectForKeyedSubscript:@"FAMILY"];
          [v77 floatValue];
          float v79 = v78;
        }
        float v80 = (v67 - v73) / (v70 - v73);
        float v81 = tanh((float)(v79 * 3.0));
        float v82 = -(float)(v81 - (float)(v79 * 2.0));
        if (v82 < 0.0) {
          float v82 = 0.0;
        }
        if (v82 <= 1.0) {
          float v83 = v82;
        }
        else {
          float v83 = 1.0;
        }
        id v84 = v49;
        id v85 = v50;
        id v86 = v51;
        unint64_t v87 = 0;
        double v88 = 0.0;
        while (v87 < [v84 count])
        {
          uint64_t v89 = [v84 objectAtIndexedSubscript:v87];
          id v90 = [v85 objectAtIndexedSubscript:v87];
          [v90 doubleValue];
          double v92 = v91;

          unint64_t v93 = [v89 numberOfMomentNodes];
          if (v93)
          {
            unint64_t v94 = [v86 count];
            double v95 = -((double)v94 * v92 - (double)v93);
            if (-((double)v93 - (double)v94 * v92) >= 0.0) {
              double v95 = -((double)v93 - (double)v94 * v92);
            }
            double v96 = v95 / (double)v93;
          }
          else
          {
            double v96 = 0.0;
          }

          double v88 = v88 + v96;
          ++v87;
        }
        unint64_t v97 = [v84 count];

        double v98 = 1.0 - v88 / (double)v97;
        float v99 = v98;
        float v100 = (float)((float)((float)((float)((float)((float)(v65 * 0.3) + (float)(v60 * 0.7)) + (float)(v80 * 0.0))
                                     + (float)(v83 * 0.0))
                             + 0.0)
                     + (float)(v99 * 0.0))
             + 0.0;
        float v101 = v54 / v239[6];
        v247[0] = @"personNodes";
        v247[1] = @"peopleWeights";
        if (v100 >= 1.0) {
          float v102 = (float)((float)(1.0 - v101) * -0.01) + 1.0;
        }
        else {
          float v102 = v100;
        }
        v248[0] = v84;
        v248[1] = v85;
        v247[2] = @"momentNodes";
        v247[3] = @"superGroupMomentNodes";
        v248[2] = v86;
        v248[3] = v55;
        v247[4] = @"socialGroupWeight";
        v205 = objc_msgSend(NSNumber, "numberWithFloat:");
        v248[4] = v205;
        v247[5] = @"groupCohesionScore";
        v203 = [NSNumber numberWithDouble:v98];
        v248[5] = v203;
        v247[6] = @"frequency";
        *(float *)&double v103 = v54;
        v200 = [NSNumber numberWithFloat:v103];
        v248[6] = v200;
        v247[7] = @"avgFrequency";
        *(float *)&double v104 = v243[6];
        v198 = [NSNumber numberWithFloat:v104];
        v248[7] = v198;
        v247[8] = @"exclusiveMomentCountFeature";
        *(float *)&double v105 = v60;
        long long v106 = [NSNumber numberWithFloat:v105];
        v248[8] = v106;
        v247[9] = @"superGroupMomentCountFeature";
        *(float *)&double v107 = v65;
        long long v108 = [NSNumber numberWithFloat:v107];
        v248[9] = v108;
        v247[10] = @"familyDistributionFeature";
        *(float *)&double v109 = v83;
        long long v110 = [NSNumber numberWithFloat:v109];
        v248[10] = v110;
        v247[11] = @"semanticCohesionFeature";
        id v111 = [NSNumber numberWithFloat:0.0];
        v248[11] = v111;
        v247[12] = @"recencyFeature";
        *(float *)&double v112 = v80;
        long long v113 = [NSNumber numberWithFloat:v112];
        v248[12] = v113;
        v247[13] = @"ranking";
        *(float *)&double v114 = v102;
        id v115 = [NSNumber numberWithFloat:v114];
        v248[13] = v115;
        long long v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v248 forKeys:v247 count:14];
        [v191 addObject:v116];
      }
      uint64_t v190 = [v181 countByEnumeratingWithState:&v214 objects:v249 count:16];
    }
    while (v190);
  }

  unint64_t v117 = v235[3];
  if (v117 <= 0xC7) {
    unint64_t v118 = (unint64_t)(tanh((float)((float)((float)v117 / 200.0) * 3.0)) * 15.0);
  }
  else {
    unint64_t v118 = 15;
  }
  v189 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"ranking" ascending:0];
  v187 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"socialGroupWeight" ascending:0];
  v185 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"superGroupMomentCountFeature" ascending:0];
  v246[0] = v189;
  v246[1] = v187;
  v246[2] = v185;
  long long v119 = [MEMORY[0x1E4F1C978] arrayWithObjects:v246 count:3];
  [v191 sortUsingDescriptors:v119];

  unint64_t v120 = 0;
  if (v118 <= 5) {
    uint64_t v121 = 5;
  }
  else {
    uint64_t v121 = v118;
  }
  unint64_t v195 = v121;
  unint64_t v199 = 2 * v121;
  while (v120 < [v191 count])
  {
    long long v122 = [v191 objectAtIndexedSubscript:v120];
    long long v123 = v122;
    if (v179)
    {
      long long v124 = [v122 objectForKeyedSubscript:@"ranking"];
      [v124 floatValue];
      if (v125 >= v178)
      {

        if (v120 < v195)
        {
          v206 = [v123 objectForKeyedSubscript:@"personNodes"];
          v204 = [v123 objectForKeyedSubscript:@"peopleWeights"];
          v210 = [v123 objectForKeyedSubscript:@"momentNodes"];
          v208 = [v123 objectForKeyedSubscript:@"superGroupMomentNodes"];
          v213 = [v123 objectForKeyedSubscript:@"socialGroupWeight"];
          [v213 floatValue];
          float v201 = v126;
          v211 = [v123 objectForKeyedSubscript:@"groupCohesionScore"];
          [v211 floatValue];
          float v128 = v127;
          long long v129 = [v123 objectForKeyedSubscript:@"frequency"];
          [v129 floatValue];
          float v131 = v130;
          long long v132 = [v123 objectForKeyedSubscript:@"avgFrequency"];
          [v132 floatValue];
          float v134 = v133;
          long long v135 = [v123 objectForKeyedSubscript:@"exclusiveMomentCountFeature"];
          [v135 floatValue];
          float v137 = v136;
          long long v138 = [v123 objectForKeyedSubscript:@"superGroupMomentCountFeature"];
          [v138 floatValue];
          float v140 = v139;
          id v141 = [v123 objectForKeyedSubscript:@"familyDistributionFeature"];
          [v141 floatValue];
          float v143 = v142;
          v144 = [v123 objectForKeyedSubscript:@"semanticCohesionFeature"];
          [v144 floatValue];
          float v146 = v145;
          v147 = [v123 objectForKeyedSubscript:@"recencyFeature"];
          [v147 floatValue];
          unsigned int v149 = v148;
          v150 = [v123 objectForKeyedSubscript:@"ranking"];
          [v150 floatValue];
          v179[2](v179, v206, v204, v210, v208, v201, v128, v131, v134, v137, v140, v143, v146, COERCE_DOUBLE(__PAIR64__(v151, v149)));
LABEL_67:

          goto LABEL_68;
        }
      }
      else
      {
      }
    }
    if (v180 && v120 < v199)
    {
      v206 = [v123 objectForKeyedSubscript:@"personNodes"];
      v204 = [v123 objectForKeyedSubscript:@"peopleWeights"];
      v210 = [v123 objectForKeyedSubscript:@"momentNodes"];
      v208 = [v123 objectForKeyedSubscript:@"superGroupMomentNodes"];
      v213 = [v123 objectForKeyedSubscript:@"socialGroupWeight"];
      [v213 floatValue];
      float v202 = v152;
      v211 = [v123 objectForKeyedSubscript:@"groupCohesionScore"];
      [v211 floatValue];
      float v154 = v153;
      long long v129 = [v123 objectForKeyedSubscript:@"frequency"];
      [v129 floatValue];
      float v156 = v155;
      long long v132 = [v123 objectForKeyedSubscript:@"avgFrequency"];
      [v132 floatValue];
      float v158 = v157;
      long long v135 = [v123 objectForKeyedSubscript:@"exclusiveMomentCountFeature"];
      [v135 floatValue];
      float v160 = v159;
      long long v138 = [v123 objectForKeyedSubscript:@"superGroupMomentCountFeature"];
      [v138 floatValue];
      float v162 = v161;
      id v141 = [v123 objectForKeyedSubscript:@"familyDistributionFeature"];
      [v141 floatValue];
      float v164 = v163;
      v144 = [v123 objectForKeyedSubscript:@"semanticCohesionFeature"];
      [v144 floatValue];
      float v166 = v165;
      v147 = [v123 objectForKeyedSubscript:@"recencyFeature"];
      [v147 floatValue];
      unsigned int v168 = v167;
      v150 = [v123 objectForKeyedSubscript:@"ranking"];
      [v150 floatValue];
      (*((void (**)(id, void *, void *, void *, void *, float, double, float, float, float, float, float, float, double))v180
       + 2))(v180, v206, v204, v210, v208, v202, v154, v156, v158, v160, v162, v164, v166, COERCE_DOUBLE(__PAIR64__(v169, v168)));
      goto LABEL_67;
    }
LABEL_68:

    ++v120;
  }
  if (a7) {
    *a7 = v243[6] / v239[6];
  }

LABEL_72:
  _Block_object_dispose(&v234, 8);

  _Block_object_dispose(&v238, 8);
  _Block_object_dispose(&v242, 8);
}

void __126__PGSocialGroupsQuestionFactory_enumerateSocialGroupsWithGraph_withLinkage_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5, float a6)
{
  v29[5] = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  ++*(void *)(*(void *)(a1[8] + 8) + 24);
  *(float *)(*(void *)(a1[9] + 8) + 24) = *(float *)(*(void *)(a1[9] + 8) + 24) + a6;
  uint64_t v15 = *(void *)(a1[10] + 8);
  if (*(float *)(v15 + 24) == 0.0) {
    *(float *)(v15 + 24) = a6;
  }
  uint64_t v16 = (void *)a1[4];
  uint64_t v17 = NSNumber;
  *(float *)&double v18 = (float)(unint64_t)[v13 count];
  float v19 = [v17 numberWithFloat:v18];
  [v16 addObject:v19];

  float v20 = (void *)a1[5];
  float v21 = NSNumber;
  *(float *)&double v22 = (float)(unint64_t)[v14 count];
  uint64_t v23 = [v21 numberWithFloat:v22];
  [v20 addObject:v23];

  if ([v11 count] && a1[7])
  {
    float v25 = (void *)a1[6];
    v28[0] = @"personNodes";
    v28[1] = @"peopleWeights";
    v29[0] = v11;
    v29[1] = v12;
    v28[2] = @"momentNodes";
    v28[3] = @"superGroupMomentNodes";
    v29[2] = v13;
    v29[3] = v14;
    v28[4] = @"frequency";
    *(float *)&double v24 = a6;
    id v26 = [NSNumber numberWithFloat:v24];
    v29[4] = v26;
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:5];
    [v25 addObject:v27];
  }
}

uint64_t __126__PGSocialGroupsQuestionFactory_enumerateSocialGroupsWithGraph_withLinkage_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __126__PGSocialGroupsQuestionFactory_enumerateSocialGroupsWithGraph_withLinkage_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (id)_identifierForPersonNodesAsString:(id)a3
{
  int64_t v3 = +[PGGraphSocialGroupNode identifierForMemberNodes:a3];
  id v4 = [NSNumber numberWithInteger:v3];
  int v5 = [v4 stringValue];

  return v5;
}

- (id)_createSocialGroupWithPersonLocalIdentifiers:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[PGGraphPersonNode personSortDescriptors];
  int v5 = [v3 sortedArrayUsingDescriptors:v4];

  double v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v14 = [v13 localIdentifier];
        [v6 addObject:v14];

        uint64_t v15 = [v13 name];
        uint64_t v16 = [v15 length];

        if (v16)
        {
          uint64_t v17 = [v13 name];
          [v7 addObject:v17];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v10);
  }

  double v18 = [(PGSocialGroupsQuestionFactory *)self _identifierForPersonNodesAsString:v8];
  v26[0] = @"socialGroupID";
  v26[1] = @"personLocalIdentifiers";
  v27[0] = v18;
  v27[1] = v6;
  v26[2] = @"personNames";
  v27[2] = v7;
  float v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];

  return v19;
}

- (id)_socialGroupsForSurveyFromCustomAlgorithm:(id)a3
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  [v44 _checkCanRead];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  float v43 = [v44 relevantMomentNodesForSocialGroupProcessing];
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v59[3] = 0;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke;
  v56[3] = &unk_1E68EE990;
  id v5 = v4;
  id v57 = v5;
  double v58 = v59;
  [v43 enumerateObjectsUsingBlock:v56];
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v55[3] = 0;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke_3;
  v52[3] = &unk_1E68EEB70;
  float v54 = v55;
  id v6 = v3;
  id v53 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v52];
  uint64_t v7 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v41 = v5;
  uint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"personNodes" ascending:0 comparator:&__block_literal_global_426];
  v63[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
  [v6 sortUsingDescriptors:v9];
  uint64_t v42 = (void *)v8;

  for (unint64_t i = 0; i != 10; ++i)
  {
    if (i >= [v6 count]) {
      break;
    }
    uint64_t v11 = [v6 objectAtIndexedSubscript:i];
    if (([v7 containsObject:v11] & 1) == 0) {
      [v7 addObject:v11];
    }
  }
  uint64_t v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"momentNodes" ascending:1 comparator:&__block_literal_global_428];
  uint64_t v62 = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
  [v6 sortUsingDescriptors:v13];
  float v40 = (void *)v12;

  unint64_t v14 = 0;
  unint64_t v15 = 1;
  while (v14 < [v6 count] && v15 < 7)
  {
    uint64_t v16 = [v6 objectAtIndexedSubscript:v14];
    uint64_t v17 = [v16 objectForKeyedSubscript:@"momentNodes"];
    unint64_t v18 = [v17 count];
    if (v18 > v15)
    {
      if (([v7 containsObject:v16] & 1) == 0) {
        [v7 addObject:v16];
      }
      unint64_t v15 = v18;
    }

    ++v14;
  }
  uint64_t v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"momentNodes" ascending:0 comparator:&__block_literal_global_430];
  uint64_t v61 = v19;
  float v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
  [v6 sortUsingDescriptors:v20];
  float v39 = (void *)v19;

  uint64_t v21 = 0;
  uint64_t v45 = 1;
  for (unint64_t j = 0; j < [v6 count]; ++j)
  {
    long long v22 = objc_msgSend(v6, "objectAtIndexedSubscript:");
    if (([v7 containsObject:v22] & 1) == 0)
    {
      [v7 addObject:v22];
      if ((unint64_t)++v21 > 0x45)
      {

        break;
      }
      unint64_t v23 = 0;
      for (unint64_t k = v45; k < [v6 count] && v23 < 4; ++k)
      {
        long long v25 = [v6 objectAtIndexedSubscript:k];
        id v26 = [v22 objectForKeyedSubscript:@"personNodes"];
        id v27 = [v25 objectForKeyedSubscript:@"personNodes"];
        if ((([v26 isSubsetOfSet:v27] & 1) != 0
           || [v27 isSubsetOfSet:v26])
          && ([v7 containsObject:v25] & 1) == 0)
        {
          [v7 addObject:v25];
          if ((unint64_t)++v21 >= 0x46)
          {

            break;
          }
          ++v23;
        }
      }
    }

    ++v45;
  }
  float v28 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v29 = v7;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v49;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v49 != v31) {
          objc_enumerationMutation(v29);
        }
        float v33 = [*(id *)(*((void *)&v48 + 1) + 8 * m) objectForKeyedSubscript:@"personNodes"];
        if ([v33 count])
        {
          float v34 = (void *)MEMORY[0x1E4F1C978];
          float v35 = [v33 allObjects];
          float v36 = [v34 arrayWithArray:v35];

          uint64_t v37 = [(PGSocialGroupsQuestionFactory *)self _createSocialGroupWithPersonLocalIdentifiers:v36];
          [v28 addObject:v37];
        }
      }
      uint64_t v30 = [v29 countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v30);
  }

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v59, 8);

  return v28;
}

void __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6 = a2;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v8 = [v6 collection];
  uint64_t v9 = [v8 personNodes];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke_2;
  v14[3] = &unk_1E68EF528;
  id v10 = v7;
  id v15 = v10;
  [v9 enumerateNodesUsingBlock:v14];
  if ([v10 count])
  {
    uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];

    if (v11)
    {
      uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
      [v12 addObject:v6];
    }
    else
    {
      id v13 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
      [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v10];

      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    *a4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 0x3E8uLL;
  }
}

void __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v6 count];
  if ([v5 count])
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v9[0] = @"momentNodes";
    v9[1] = @"personNodes";
    v10[0] = v6;
    v10[1] = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
    [v7 addObject:v8];
  }
}

uint64_t __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 >= [v5 count])
  {
    unint64_t v8 = [v4 count];
    uint64_t v7 = v8 > [v5 count];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

uint64_t __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 >= [v5 count])
  {
    unint64_t v8 = [v4 count];
    uint64_t v7 = v8 > [v5 count];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

uint64_t __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 >= [v5 count])
  {
    unint64_t v8 = [v4 count];
    uint64_t v7 = v8 > [v5 count];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 isMeNode] & 1) == 0)
  {
    id v3 = [v4 localIdentifier];

    if (v3) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
}

- (id)_socialGroupsForSurveyFromNewAlgorithm:(id)a3 withLinkage:(unint64_t)a4
{
  unint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  uint64_t v9 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v10 = [MEMORY[0x1E4F1CA70] orderedSet];
  int v19 = 0;
  uint64_t v11 = objc_opt_class();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromNewAlgorithm_withLinkage___block_invoke;
  v17[3] = &unk_1E68EE920;
  v17[4] = self;
  id v18 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromNewAlgorithm_withLinkage___block_invoke_2;
  v15[3] = &unk_1E68EE920;
  v15[4] = self;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  [v11 enumerateSocialGroupsWithGraph:v7 withLinkage:a4 validGroupsBlock:v17 invalidGroupsBlock:v15 averageWeight:&v19];

  [v8 setValue:v13 forKey:@"validSocialGroupsPeopleLocalIdentifiers"];
  [v8 setValue:v12 forKey:@"remainingSocialGroupsPeopleLocalIdentifiers"];

  return v8;
}

void __84__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromNewAlgorithm_withLinkage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _createSocialGroupWithPersonLocalIdentifiers:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

void __84__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromNewAlgorithm_withLinkage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _createSocialGroupWithPersonLocalIdentifiers:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)_socialGroupsForSurveyFromCurrentAlgorithm:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v8 = [MEMORY[0x1E4F1CA70] orderedSet];
  int v16 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCurrentAlgorithm___block_invoke;
  v14[3] = &unk_1E68EE8F8;
  void v14[4] = self;
  id v15 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCurrentAlgorithm___block_invoke_2;
  v12[3] = &unk_1E68EE8F8;
  void v12[4] = self;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [v5 enumerateSocialGroupsIncludingMeNode:0 socialGroupsVersion:1 simulateMeNodeNotSet:0 validGroupsBlock:v14 invalidGroupsBlock:v12 averageWeight:&v16];

  [v6 setValue:v10 forKey:@"validSocialGroupsPeopleLocalIdentifiers"];
  [v6 setValue:v9 forKey:@"remainingSocialGroupsPeopleLocalIdentifiers"];

  return v6;
}

void __76__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCurrentAlgorithm___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 count])
  {
    id v3 = [*(id *)(a1 + 32) _createSocialGroupWithPersonLocalIdentifiers:v4];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __76__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCurrentAlgorithm___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 count])
  {
    id v3 = [*(id *)(a1 + 32) _createSocialGroupWithPersonLocalIdentifiers:v4];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (id)_socialGroupsForSurvey:(id)a3 withLimit:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(PGSocialGroupsQuestionFactory *)self _socialGroupsForSurveyFromCurrentAlgorithm:v6];
  id v8 = [v7 objectForKeyedSubscript:@"validSocialGroupsPeopleLocalIdentifiers"];
  if ([v8 count] >= a4)
  {
    id v20 = v8;
  }
  else
  {
    id v9 = [(PGSocialGroupsQuestionFactory *)self _socialGroupsForSurveyFromNewAlgorithm:v6 withLinkage:5];
    id v10 = [v9 objectForKeyedSubscript:@"validSocialGroupsPeopleLocalIdentifiers"];
    [v8 unionOrderedSet:v10];

    if ([v8 count] >= a4)
    {
      id v21 = v8;
    }
    else
    {
      uint64_t v11 = [(PGSocialGroupsQuestionFactory *)self _socialGroupsForSurveyFromNewAlgorithm:v6 withLinkage:0];
      id v12 = [v11 objectForKeyedSubscript:@"validSocialGroupsPeopleLocalIdentifiers"];
      [v8 unionOrderedSet:v12];

      if ([v8 count] >= a4)
      {
        id v22 = v8;
      }
      else
      {
        id v13 = [(PGSocialGroupsQuestionFactory *)self _socialGroupsForSurveyFromNewAlgorithm:v6 withLinkage:3];
        unint64_t v14 = [v13 objectForKeyedSubscript:@"validSocialGroupsPeopleLocalIdentifiers"];
        [v8 unionOrderedSet:v14];

        if ([v8 count] >= a4)
        {
          id v23 = v8;
        }
        else
        {
          id v15 = [(PGSocialGroupsQuestionFactory *)self _socialGroupsForSurveyFromNewAlgorithm:v6 withLinkage:2];
          int v16 = [v15 objectForKeyedSubscript:@"validSocialGroupsPeopleLocalIdentifiers"];
          [v8 unionOrderedSet:v16];

          if ([v8 count] >= a4)
          {
            id v24 = v8;
          }
          else
          {
            uint64_t v17 = [(PGSocialGroupsQuestionFactory *)self _socialGroupsForSurveyFromCustomAlgorithm:v6];
            [v8 unionOrderedSet:v17];
            if ([v8 count] >= a4)
            {
              id v25 = v8;
            }
            else
            {
              id v18 = [v7 objectForKeyedSubscript:@"remainingSocialGroupsPeopleLocalIdentifiers"];
              [v8 unionOrderedSet:v18];
              id v19 = v8;
            }
          }
        }
      }
    }
  }

  return v8;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __74__PGSocialGroupsQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  int v16 = &unk_1E68F0568;
  id v19 = v6;
  unint64_t v20 = a3;
  uint64_t v17 = self;
  id v18 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performSynchronousConcurrentGraphReadUsingBlock:&v13];

  uint64_t v11 = objc_msgSend(v9, "allObjects", v13, v14, v15, v16, v17);

  return v11;
}

void __74__PGSocialGroupsQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v31 = (void (**)(void *, unsigned char *, double))_Block_copy(*(const void **)(a1 + 48));
  if (v31)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v5 = 0.0;
    if (Current >= 0.01)
    {
      double v6 = Current;
      unsigned __int8 v32 = 0;
      v31[2](v31, &v32, 0.0);
      if (v32)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_41;
        }
        *(_DWORD *)buf = 67109378;
        int v34 = 132;
        __int16 v35 = 2080;
        float v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Social Groups/PGSocialGroupsQuestionFactory.m";
        id v7 = MEMORY[0x1E4F14500];
        goto LABEL_27;
      }
      double v5 = v6;
    }
    if (!*(void *)(a1 + 56))
    {
      if (CFAbsoluteTimeGetCurrent() - v5 < 0.01) {
        goto LABEL_41;
      }
      unsigned __int8 v32 = 0;
      v31[2](v31, &v32, 1.0);
      if (!v32 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_41;
      }
      *(_DWORD *)buf = 67109378;
      int v34 = 135;
      __int16 v35 = 2080;
      float v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Social Groups/PGSocialGroupsQuestionFactory.m";
      id v7 = MEMORY[0x1E4F14500];
LABEL_27:
      _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_41;
    }
  }
  else
  {
    double v5 = 0.0;
    if (!*(void *)(a1 + 56)) {
      goto LABEL_41;
    }
  }
  id v8 = [v3 graph];
  id v9 = [v8 meNode];
  id v10 = [v9 localIdentifier];
  uint64_t v30 = [*(id *)(a1 + 32) _socialGroupsForSurvey:v8 withLimit:*(void *)(a1 + 56)];
  uint64_t v11 = [v30 count];
  if (!v11)
  {
    int v25 = 0;
    int v26 = 2;
    goto LABEL_34;
  }
  unint64_t v12 = v11;
  float v28 = v9;
  id v29 = v8;
  id v27 = v3;
  uint64_t v13 = 0;
  double v14 = 1.0 / (double)(unint64_t)(v11 + 1);
  while (1)
  {
    id v15 = [v30 objectAtIndexedSubscript:v13];
    int v16 = [v15 objectForKeyedSubscript:@"personLocalIdentifiers"];
    if ([v10 length]) {
      [v16 addObject:v10];
    }
    uint64_t v17 = [PGSocialGroupsQuestion alloc];
    id v18 = [v15 objectForKeyedSubscript:@"socialGroupID"];
    id v19 = [v15 objectForKeyedSubscript:@"personNames"];
    unint64_t v20 = [(PGSocialGroupsQuestion *)v17 initWithSocialGroupID:v18 personLocalIdentifiers:v16 personNames:v19 localFactoryScore:v14 * (double)v12];

    if (![*(id *)(a1 + 32) shouldAddQuestion:v20 toAlreadyGeneratedQuestions:*(void *)(a1 + 40)])goto LABEL_20; {
    [*(id *)(a1 + 40) addObject:v20];
    }
    uint64_t v21 = [*(id *)(a1 + 40) count];
    if (v31)
    {
      unint64_t v22 = v21;
      unint64_t v23 = *(void *)(a1 + 56);
      double v24 = CFAbsoluteTimeGetCurrent();
      if (v24 - v5 >= 0.01) {
        break;
      }
    }
LABEL_19:
    if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 56))
    {
      int v25 = 0;
      int v26 = 2;
      goto LABEL_32;
    }
LABEL_20:

    ++v13;
    if (!--v12)
    {
      int v25 = 0;
      int v26 = 2;
      id v3 = v27;
      goto LABEL_33;
    }
  }
  unsigned __int8 v32 = 0;
  v31[2](v31, &v32, (double)v22 / (double)v23);
  if (!v32)
  {
    double v5 = v24;
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v34 = 166;
    __int16 v35 = 2080;
    float v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/Su"
          "rvey/Social Groups/PGSocialGroupsQuestionFactory.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  int v26 = 1;
  int v25 = 1;
  double v5 = v24;
LABEL_32:
  id v3 = v27;

LABEL_33:
  id v9 = v28;
  id v8 = v29;
LABEL_34:
  if (v31)
  {
    if (v26 == 2 && CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
    {
      unsigned __int8 v32 = 0;
      v31[2](v31, &v32, 1.0);
      if (v32 | v25)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v34 = 173;
          __int16 v35 = 2080;
          float v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questi"
                "ons/Survey/Social Groups/PGSocialGroupsQuestionFactory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

LABEL_41:
}

- (int64_t)questionOptions
{
  return 0x10000;
}

- (unsigned)questionType
{
  return 17;
}

@end