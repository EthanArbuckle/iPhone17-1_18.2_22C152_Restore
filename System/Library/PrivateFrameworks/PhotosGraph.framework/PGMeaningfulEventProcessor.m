@interface PGMeaningfulEventProcessor
+ (id)_legacyMeaningResultForResult:(id)a3 requiredCriteriaByIdentifier:(id)a4;
+ (id)_postProcessBirthdaysWithResults:(id)a3 forMoment:(id)a4;
+ (id)_postProcessResults:(id)a3 forMoment:(id)a4;
+ (id)processRequiredCriteria:(id)a3 forMoment:(id)a4 meaningfulEventProcessorCache:(id)a5 serviceManager:(id)a6;
@end

@implementation PGMeaningfulEventProcessor

+ (id)_postProcessBirthdaysWithResults:(id)a3 forMoment:(id)a4
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v83 = a4;
  v94 = [MEMORY[0x1E4F1CA80] set];
  v93 = [MEMORY[0x1E4F1CA80] set];
  v91 = [MEMORY[0x1E4F1CA80] set];
  int v95 = [v83 hasEdgeWithLabel:@"CELEBRATING" domain:401];
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v121 objects:v129 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v122;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v122 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v121 + 1) + 8 * i);
        v10 = [v9 requiredCriteria];
        v11 = [v10 identifier];
        int v12 = [v11 isEqualToString:@"Birthday"];
        if ((v12 & 1) == 0)
        {
          int v13 = [v11 isEqualToString:@"WeakBirthday"];
          v14 = v91;
          if (!v13) {
            goto LABEL_13;
          }
        }
        if (!v95
          || ([v10 additionalInfo],
              v15 = objc_claimAutoreleasedReturnValue(),
              [v15 objectForKeyedSubscript:@"birthday.isOnDate"],
              v16 = objc_claimAutoreleasedReturnValue(),
              int v17 = [v16 BOOLValue],
              v16,
              v15,
              v17))
        {
          if (v12) {
            v14 = v94;
          }
          else {
            v14 = v93;
          }
LABEL_13:
          [v14 addObject:v9];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v121 objects:v129 count:16];
    }
    while (v6);
  }

  uint64_t v18 = [v94 count];
  uint64_t v19 = [v93 count] + v18;
  if (v95)
  {
    uint64_t v20 = [v91 count];
    if (v20 + v19 == [obj count])
    {
      v21 = obj;
LABEL_22:
      id v22 = v21;
      goto LABEL_49;
    }
  }
  if (v19 == 1)
  {
    id v22 = (id)[v91 mutableCopy];
    [v22 unionSet:v94];
    [v22 unionSet:v93];
    goto LABEL_49;
  }
  if (!v19)
  {
    v21 = v91;
    goto LABEL_22;
  }
  id v81 = v91;
  v23 = v94;
  if (!v18) {
    v23 = v93;
  }
  id v24 = v23;
  v82 = [v83 graph];
  v25 = [v82 meNode];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v88 = v24;
  uint64_t v26 = [v88 countByEnumeratingWithState:&v117 objects:v128 count:16];
  if (v26)
  {
    v27 = 0;
    v96 = 0;
    uint64_t v28 = *(void *)v118;
    int v29 = 1;
    do
    {
      uint64_t v30 = 0;
      v31 = v27;
      do
      {
        if (*(void *)v118 != v28) {
          objc_enumerationMutation(v88);
        }
        v32 = *(void **)(*((void *)&v117 + 1) + 8 * v30);
        v33 = [v32 requiredCriteria];
        v34 = [v33 peopleTrait];
        v27 = [v34 nodes];

        if (v31) {
          v29 &= [v31 isEqual:v27];
        }
        if (v25)
        {
          if ([v27 containsNode:v25])
          {
            if (!v96 || ([v32 score], double v36 = v35, objc_msgSend(v96, "score"), v36 > v37))
            {
              id v38 = v32;

              v96 = v38;
            }
          }
        }

        ++v30;
        v31 = v27;
      }
      while (v26 != v30);
      uint64_t v26 = [v88 countByEnumeratingWithState:&v117 objects:v128 count:16];
    }
    while (v26);

    if ((v29 & 1) == 0)
    {
      v39 = [v96 requiredCriteria];
      v40 = [v39 additionalInfo];
      v41 = [v40 objectForKeyedSubscript:@"birthday.isOnDate"];
      int v42 = [v41 BOOLValue];

      if (v96) {
        int v43 = v42;
      }
      else {
        int v43 = 0;
      }
      if (v43 == 1)
      {
        objc_msgSend(v81, "addObject:");
      }
      else
      {
        v87 = [MEMORY[0x1E4F1CA80] set];
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        id v89 = v88;
        uint64_t v45 = [v89 countByEnumeratingWithState:&v113 objects:v127 count:16];
        if (v45)
        {
          uint64_t v46 = *(void *)v114;
          do
          {
            for (uint64_t j = 0; j != v45; ++j)
            {
              if (*(void *)v114 != v46) {
                objc_enumerationMutation(v89);
              }
              v48 = *(void **)(*((void *)&v113 + 1) + 8 * j);
              v49 = [v48 requiredCriteria];
              v50 = [v49 additionalInfo];
              v51 = [v50 objectForKeyedSubscript:@"birthday.isOnDate"];
              int v52 = [v51 BOOLValue];

              if (v52) {
                [v87 addObject:v48];
              }
            }
            uint64_t v45 = [v89 countByEnumeratingWithState:&v113 objects:v127 count:16];
          }
          while (v45);
        }

        if ([v87 count])
        {
          id v53 = v87;

          v54 = v53;
        }
        else
        {
          v54 = v89;
        }
        id v88 = v54;
        if ((unint64_t)[v54 count] >= 2)
        {
          v55 = [(MAElementCollection *)[PGGraphPersonNodeCollection alloc] initWithGraph:v82];
          long long v111 = 0u;
          long long v112 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          id v90 = v88;
          uint64_t v56 = [v90 countByEnumeratingWithState:&v109 objects:v126 count:16];
          if (v56)
          {
            uint64_t v57 = *(void *)v110;
            do
            {
              for (uint64_t k = 0; k != v56; ++k)
              {
                if (*(void *)v110 != v57) {
                  objc_enumerationMutation(v90);
                }
                v59 = [*(id *)(*((void *)&v109 + 1) + 8 * k) requiredCriteria];
                v60 = [v59 peopleTrait];
                v61 = [v60 nodes];

                v62 = [v61 localIdentifiers];
                v63 = [v62 anyObject];

                if ([v63 length])
                {
                  uint64_t v64 = [(MAElementCollection *)v55 collectionByFormingUnionWith:v61];

                  v55 = (PGGraphPersonNodeCollection *)v64;
                }
              }
              uint64_t v56 = [v90 countByEnumeratingWithState:&v109 objects:v126 count:16];
            }
            while (v56);
          }

          v65 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v90, "count"));
          uint64_t v105 = 0;
          v106 = &v105;
          uint64_t v107 = 0x2020000000;
          uint64_t v108 = 0;
          v101[0] = MEMORY[0x1E4F143A8];
          v101[1] = 3221225472;
          v101[2] = __73__PGMeaningfulEventProcessor__postProcessBirthdaysWithResults_forMoment___block_invoke;
          v101[3] = &unk_1E68E4AE0;
          v66 = v55;
          v102 = v66;
          id v85 = v65;
          id v103 = v85;
          v104 = &v105;
          [v83 enumeratePersonEdgesAndNodesUsingBlock:v101];
          uint64_t v67 = [MEMORY[0x1E4F1CA80] set];
          unint64_t v68 = v106[3];
          long long v97 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          id v84 = v90;
          uint64_t v69 = [v84 countByEnumeratingWithState:&v97 objects:v125 count:16];
          v80 = v66;
          id v88 = (id)v67;
          if (v69)
          {
            double v70 = (double)v68 * 0.7;
            uint64_t v86 = *(void *)v98;
            do
            {
              for (uint64_t m = 0; m != v69; ++m)
              {
                if (*(void *)v98 != v86) {
                  objc_enumerationMutation(v84);
                }
                v72 = *(void **)(*((void *)&v97 + 1) + 8 * m);
                v73 = objc_msgSend(v72, "requiredCriteria", v80);
                v74 = [v73 peopleTrait];
                v75 = [v74 nodes];

                v76 = [v75 localIdentifiers];
                v77 = [v76 anyObject];

                if ([v77 length])
                {
                  v78 = [v85 objectForKeyedSubscript:v77];
                  unint64_t v79 = [v78 unsignedIntegerValue];

                  if (v70 <= (double)v79) {
                    [v88 addObject:v72];
                  }
                }
              }
              uint64_t v69 = [v84 countByEnumeratingWithState:&v97 objects:v125 count:16];
            }
            while (v69);
          }

          _Block_object_dispose(&v105, 8);
        }
        objc_msgSend(v81, "unionSet:", v88, v80);
      }
      goto LABEL_48;
    }
  }
  else
  {

    v96 = 0;
    v27 = 0;
  }
  [v81 unionSet:v88];
LABEL_48:
  id v22 = v81;

LABEL_49:
  return v22;
}

void __73__PGMeaningfulEventProcessor__postProcessBirthdaysWithResults_forMoment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsNode:v5])
  {
    uint64_t v6 = [v5 localIdentifier];
    if ([v6 length])
    {
      unint64_t v7 = [v10 numberOfAssets];
      v8 = [NSNumber numberWithUnsignedInteger:v7];
      [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v6];

      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      if (v7 > *(void *)(v9 + 24)) {
        *(void *)(v9 + 24) = v7;
      }
    }
  }
}

+ (id)_legacyMeaningResultForResult:(id)a3 requiredCriteriaByIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 requiredCriteria];
  v8 = [v7 identifier];

  if (([v8 isEqualToString:@"AmusementPark"] & 1) != 0
    || ([v8 isEqualToString:@"Festival"] & 1) != 0)
  {
    uint64_t v9 = kPGGraphNodeMeaningEntertainment;
  }
  else if (([v8 isEqualToString:@"Concert"] & 1) != 0 {
         || ([v8 isEqualToString:@"Dance"] & 1) != 0
  }
         || ([v8 isEqualToString:@"Theater"] & 1) != 0)
  {
    uint64_t v9 = kPGGraphNodeMeaningPerformance;
  }
  else
  {
    if (![v8 isEqualToString:@"Wedding"]) {
      goto LABEL_12;
    }
    uint64_t v9 = kPGGraphNodeMeaningGathering;
  }
  id v10 = [v6 objectForKeyedSubscript:*v9];
  v11 = [v10 firstObject];

  if (v11)
  {
    int v12 = [PGMeaningfulEventMatchingResult alloc];
    uint64_t v13 = [v5 isMatching];
    [v5 score];
    v15 = -[PGMeaningfulEventMatchingResult initWithIsMatching:score:isReliable:requiredCriteria:](v12, "initWithIsMatching:score:isReliable:requiredCriteria:", v13, [v5 isReliable], v11, v14);

    goto LABEL_13;
  }
LABEL_12:
  v15 = 0;
LABEL_13:

  return v15;
}

+ (id)_postProcessResults:(id)a3 forMoment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 count] > 1)
  {
    id v8 = [a1 _postProcessBirthdaysWithResults:v6 forMoment:v7];
  }
  else
  {
    id v8 = v6;
  }
  uint64_t v9 = v8;

  return v9;
}

+ (id)processRequiredCriteria:(id)a3 forMoment:(id)a4 meaningfulEventProcessorCache:(id)a5 serviceManager:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  double v14 = [[PGMeaningfulEventMatchingCriteria alloc] initWithMoment:v13 cache:v12 serviceManager:v11];

  v15 = [MEMORY[0x1E4F1CA80] set];
  v16 = [MEMORY[0x1E4F1CA80] set];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __109__PGMeaningfulEventProcessor_processRequiredCriteria_forMoment_meaningfulEventProcessorCache_serviceManager___block_invoke;
  v23[3] = &unk_1E68E5148;
  id v24 = v16;
  v25 = v14;
  id v27 = v10;
  id v28 = a1;
  id v26 = v15;
  id v17 = v10;
  id v18 = v15;
  uint64_t v19 = v14;
  id v20 = v16;
  [v17 enumerateKeysAndObjectsUsingBlock:v23];
  v21 = [a1 _postProcessResults:v18 forMoment:v13];

  return v21;
}

void __109__PGMeaningfulEventProcessor_processRequiredCriteria_forMoment_meaningfulEventProcessorCache_serviceManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
  {
    id v25 = v6;
    id v26 = v5;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      uint64_t v27 = *(void *)v32;
      while (2)
      {
        uint64_t v11 = 0;
        uint64_t v28 = v9;
        do
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
          id v13 = (void *)MEMORY[0x1D25FED50]();
          double v14 = [*(id *)(a1 + 40) matchingResultWithCriteria:v12];
          if ([v14 isMatching])
          {
            v15 = [v12 identifier];
            char v16 = [v14 isReliable];
            [*(id *)(a1 + 48) addObject:v14];
            id v17 = [*(id *)(a1 + 64) _legacyMeaningResultForResult:v14 requiredCriteriaByIdentifier:*(void *)(a1 + 56)];
            if (v17)
            {
              char v29 = v16;
              uint64_t v30 = v15;
              [*(id *)(a1 + 48) addObject:v17];
              id v18 = [v17 requiredCriteria];
              uint64_t v19 = [v18 identifier];

              if ([v17 isReliable]) {
                [*(id *)(a1 + 32) addObject:v19];
              }
              id v20 = +[PGLogging sharedLogging];
              v21 = [v20 loggingConnection];

              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                id v22 = [v14 requiredCriteria];
                [v22 identifier];
                id v24 = v23 = v7;
                *(_DWORD *)buf = 138543618;
                double v36 = v19;
                __int16 v37 = 2114;
                id v38 = v24;
                _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "[MeaningInference] Adding legacy meaning %{public}@ for meaning %{public}@", buf, 0x16u);

                id v7 = v23;
                uint64_t v10 = v27;
              }
              uint64_t v9 = v28;
              v15 = v30;
              char v16 = v29;
            }
            if (v16)
            {
              [*(id *)(a1 + 32) addObject:v15];

              goto LABEL_20;
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_20:

    id v6 = v25;
    id v5 = v26;
  }
}

@end