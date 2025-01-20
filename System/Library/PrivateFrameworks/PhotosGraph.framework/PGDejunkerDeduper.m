@interface PGDejunkerDeduper
- (BOOL)isJunkForItem:(id)a3;
- (BOOL)shouldPerformIdenticalDedupingForItemFeature:(id)a3 options:(id)a4;
- (BOOL)shouldPerformSemanticalDedupingForItemFeature:(id)a3 options:(id)a4;
- (OS_os_log)loggingConnection;
- (PGDejunkerDeduper)initWithSimilarityModelClass:(Class)a3;
- (double)identicalDedupingSimilarityForItemFeature:(id)a3 options:(id)a4;
- (double)identicalDedupingTimeIntervalForItemFeature:(id)a3 options:(id)a4;
- (double)semanticalDedupingSimilarityForItemFeature:(id)a3 options:(id)a4;
- (double)semanticalDedupingTimeIntervalForItemFeature:(id)a3 options:(id)a4;
- (id)bestItemGroupsBasedOnFaceprintsWithItemGroups:(id)a3 options:(id)a4;
- (id)bestItemGroupsBasedOnSceneprintsWithItemGroups:(id)a3 forSimilarity:(int64_t)a4 options:(id)a5;
- (id)bestItemsInItems:(id)a3 options:(id)a4;
- (id)debugPersonStringForItem:(id)a3;
- (id)dejunkedDedupedItemsInItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6;
- (id)dejunkedItemsWithItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6;
- (id)eligibleItemsInItems:(id)a3 options:(id)a4;
- (id)faceprintByPersonLocalIdentifierByItemIdentifierWithItems:(id)a3;
- (id)featureWithItem:(id)a3;
- (id)finalItemsWithItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6;
- (id)identicallyDedupedItemsInItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6;
- (id)itemsByFeatureWithItems:(id)a3;
- (id)itemsSortedByScoreWithItems:(id)a3 options:(id)a4;
- (id)requiredItemsInItems:(id)a3 options:(id)a4 containStronglyRequiredItems:(BOOL *)a5;
- (id)semanticallyDedupedItemsInItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6;
- (id)splitItemGroupsWithItemGroups:(id)a3 maximumNumberOfItemsPerGroup:(unint64_t)a4 debugInfo:(id)a5;
- (id)splitItemGroupsWithTimeSortedItems:(id)a3 numberOfBuckets:(unint64_t)a4;
- (id)timeGroupsOfTimeSortedItemsWithTimeSortedItems:(id)a3 timeInterval:(double)a4 maximumTimeGroupExtension:(double)a5;
- (id)timeSortedItemsWithItems:(id)a3;
- (void)setLoggingConnection:(id)a3;
@end

@implementation PGDejunkerDeduper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_kMeanTimeClusterer, 0);
  objc_storeStrong((id *)&self->_similarStacker, 0);
}

- (void)setLoggingConnection:(id)a3
{
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (id)requiredItemsInItems:(id)a3 options:(id)a4 containStronglyRequiredItems:(BOOL *)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315138;
    v8 = "-[PGDejunkerDeduper requiredItemsInItems:options:containStronglyRequiredItems:]";
    _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "%s needs to be implemented by subclass", (uint8_t *)&v7, 0xCu);
  }
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)itemsSortedByScoreWithItems:(id)a3 options:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    int v7 = "-[PGDejunkerDeduper itemsSortedByScoreWithItems:options:]";
    _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "%s needs to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)featureWithItem:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    int v7 = "-[PGDejunkerDeduper featureWithItem:]";
    _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "%s needs to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }
  v4 = [[PGDejunkerDeduperFeature alloc] initWithPersonLocalIdentifiers:0 peopleScenes:0 isVideo:0];
  return v4;
}

- (id)faceprintByPersonLocalIdentifierByItemIdentifierWithItems:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315138;
    int v6 = "-[PGDejunkerDeduper faceprintByPersonLocalIdentifierByItemIdentifierWithItems:]";
    _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "%s needs to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)debugPersonStringForItem:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315138;
    int v6 = "-[PGDejunkerDeduper debugPersonStringForItem:]";
    _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "%s needs to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }
  return &stru_1F283BC78;
}

- (BOOL)isJunkForItem:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315138;
    int v6 = "-[PGDejunkerDeduper isJunkForItem:]";
    _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "%s needs to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (id)bestItemsInItems:(id)a3 options:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[PGDejunkerDeduper bestItemsInItems:options:]";
    _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "%s needs to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)eligibleItemsInItems:(id)a3 options:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [a4 identifiersOfEligibleItems];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "clsIdentifier", (void)v17);
          int v15 = [v6 containsObject:v14];

          if (v15) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (id)itemsByFeatureWithItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = -[PGDejunkerDeduper featureWithItem:](self, "featureWithItem:", v11, (void)v15);
        if (v12)
        {
          id v13 = [v5 objectForKeyedSubscript:v12];
          if (!v13) {
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v5 setObject:v13 forKeyedSubscript:v12];
          [v13 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)timeSortedItemsWithItems:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_449];
}

uint64_t __46__PGDejunkerDeduper_timeSortedItemsWithItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "cls_universalDate");
  uint64_t v7 = objc_msgSend(v5, "cls_universalDate");
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    uint64_t v9 = [v4 clsIdentifier];
    uint64_t v10 = [v5 clsIdentifier];
    uint64_t v8 = [v9 compare:v10];
  }
  return v8;
}

- (id)bestItemGroupsBasedOnSceneprintsWithItemGroups:(id)a3 forSimilarity:(int64_t)a4 options:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = [(PGDejunkerDeduper *)self itemsSortedByScoreWithItems:a3 options:v7];
  uint64_t v9 = [v7 identifiersOfEligibleItems];
  v30 = v7;
  uint64_t v10 = [(PGDejunkerDeduper *)self requiredItemsInItems:v8 options:v7 containStronglyRequiredItems:0];
  id v33 = (id)[v10 mutableCopy];
  v29 = v10;
  uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v8;
  uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v40;
    uint64_t v31 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if (([v11 containsObject:v16] & 1) == 0)
        {
          if (!v9
            || ([v16 clsIdentifier],
                long long v17 = objc_claimAutoreleasedReturnValue(),
                int v18 = [v9 containsObject:v17],
                v17,
                v18))
          {
            long long v19 = v11;
            -[CLSSimilarStacker distanceThresholdForSimilarity:withSimilarityModelVersion:](self->_similarStacker, "distanceThresholdForSimilarity:withSimilarityModelVersion:", a4, [v16 clsSimilarityModelVersion]);
            double v21 = v20;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v22 = v33;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v36;
              while (2)
              {
                for (uint64_t j = 0; j != v24; ++j)
                {
                  if (*(void *)v36 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  [(CLSSimilarStacker *)self->_similarStacker distanceBetweenItem:*(void *)(*((void *)&v35 + 1) + 8 * j) andItem:v16];
                  if (v27 < v21)
                  {

                    goto LABEL_19;
                  }
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
                if (v24) {
                  continue;
                }
                break;
              }
            }

            [v22 addObject:v16];
LABEL_19:
            uint64_t v11 = v19;
            uint64_t v14 = v31;
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v13);
  }

  return v33;
}

- (id)bestItemGroupsBasedOnFaceprintsWithItemGroups:(id)a3 options:(id)a4
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v71 = a4;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v105 objects:v113 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v106;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v106 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        if ((unint64_t)[v11 count] < 2)
        {
          [v6 addObject:v11];
        }
        else
        {
          uint64_t v12 = [(PGDejunkerDeduper *)self itemsSortedByScoreWithItems:v11 options:v71];
          [v6 addObject:v12];
          [v65 addObjectsFromArray:v12];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v105 objects:v113 count:16];
    }
    while (v8);
  }

  v84 = [(PGDejunkerDeduper *)self faceprintByPersonLocalIdentifierByItemIdentifierWithItems:v65];
  [v71 identicalDedupingFaceprintDistance];
  double v14 = v13;
  long long v15 = [v71 identifiersOfEligibleItems];
  id v69 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(obj, "count"));
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v67 = v6;
  uint64_t v16 = [v67 countByEnumeratingWithState:&v101 objects:v112 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v102;
    v73 = v15;
    uint64_t v64 = *(void *)v102;
    do
    {
      uint64_t v19 = 0;
      uint64_t v66 = v17;
      do
      {
        if (*(void *)v102 != v18)
        {
          uint64_t v20 = v19;
          objc_enumerationMutation(v67);
          uint64_t v19 = v20;
        }
        uint64_t v72 = v19;
        double v21 = *(void **)(*((void *)&v101 + 1) + 8 * v19);
        if ([v21 count] == 1)
        {
          id v22 = [(PGDejunkerDeduper *)self eligibleItemsInItems:v21 options:v71];
          if ([v22 count]) {
            [v69 addObject:v22];
          }
        }
        else
        {
          uint64_t v23 = [(PGDejunkerDeduper *)self requiredItemsInItems:v21 options:v71 containStronglyRequiredItems:0];
          v76 = (void *)[v23 mutableCopy];
          v70 = v23;
          uint64_t v24 = [MEMORY[0x1E4F1CAD0] setWithArray:v23];
          long long v97 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          id v80 = v21;
          uint64_t v25 = [v80 countByEnumeratingWithState:&v97 objects:v111 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v98;
            uint64_t v74 = *(void *)v98;
            v75 = v24;
            do
            {
              uint64_t v28 = 0;
              uint64_t v78 = v26;
              do
              {
                if (*(void *)v98 != v27) {
                  objc_enumerationMutation(v80);
                }
                v29 = *(void **)(*((void *)&v97 + 1) + 8 * v28);
                if (([v24 containsObject:v29] & 1) == 0)
                {
                  if (!v15
                    || ([v29 clsIdentifier],
                        v30 = objc_claimAutoreleasedReturnValue(),
                        int v31 = [v15 containsObject:v30],
                        v30,
                        v31))
                  {
                    uint64_t v81 = v28;
                    v32 = [(PGDejunkerDeduper *)self featureWithItem:v29];
                    v86 = [v32 personLocalIdentifiers];

                    id v33 = [v29 clsIdentifier];
                    v34 = [v84 objectForKeyedSubscript:v33];

                    v79 = v29;
                    long long v35 = [v29 curationModel];
                    long long v36 = [v35 faceModel];

                    long long v95 = 0u;
                    long long v96 = 0u;
                    long long v93 = 0u;
                    long long v94 = 0u;
                    id v87 = v76;
                    uint64_t v37 = [v87 countByEnumeratingWithState:&v93 objects:v110 count:16];
                    if (v37)
                    {
                      uint64_t v38 = v37;
                      uint64_t v39 = *(void *)v94;
                      uint64_t v82 = *(void *)v94;
                      v83 = v36;
                      while (2)
                      {
                        uint64_t v40 = 0;
                        uint64_t v85 = v38;
                        do
                        {
                          if (*(void *)v94 != v39) {
                            objc_enumerationMutation(v87);
                          }
                          long long v41 = *(void **)(*((void *)&v93 + 1) + 8 * v40);
                          uint64_t v42 = [v36 version];
                          v43 = [v41 curationModel];
                          v44 = [v43 faceModel];
                          uint64_t v45 = [v44 version];

                          if (v42 == v45)
                          {
                            v46 = [v41 clsIdentifier];
                            v47 = [v84 objectForKeyedSubscript:v46];

                            long long v91 = 0u;
                            long long v92 = 0u;
                            long long v89 = 0u;
                            long long v90 = 0u;
                            id v48 = v86;
                            uint64_t v49 = [v48 countByEnumeratingWithState:&v89 objects:v109 count:16];
                            if (v49)
                            {
                              uint64_t v50 = v49;
                              uint64_t v51 = *(void *)v90;
                              double v52 = 0.0;
                              do
                              {
                                for (uint64_t j = 0; j != v50; ++j)
                                {
                                  if (*(void *)v90 != v51) {
                                    objc_enumerationMutation(v48);
                                  }
                                  uint64_t v54 = *(void *)(*((void *)&v89 + 1) + 8 * j);
                                  v55 = [v34 objectForKeyedSubscript:v54];
                                  v56 = [v47 objectForKeyedSubscript:v54];
                                  uint64_t v88 = 0;
                                  v57 = [v55 computeDistance:v56 withDistanceFunction:0 error:&v88];
                                  [v57 doubleValue];
                                  double v52 = v52 + v58 * v58;
                                }
                                uint64_t v50 = [v48 countByEnumeratingWithState:&v89 objects:v109 count:16];
                              }
                              while (v50);
                            }
                            else
                            {
                              double v52 = 0.0;
                            }

                            unint64_t v59 = [v48 count];
                            double v60 = v14;
                            long long v36 = v83;
                            if (v14 == -1.0)
                            {
                              v61 = [v83 distanceNode];
                              [v61 operatingPoint];
                              double v60 = v62;
                            }
                            uint64_t v39 = v82;
                            uint64_t v38 = v85;
                            if (sqrt(v52 / (double)v59) < v60)
                            {

                              goto LABEL_49;
                            }
                          }
                          ++v40;
                        }
                        while (v40 != v38);
                        uint64_t v38 = [v87 countByEnumeratingWithState:&v93 objects:v110 count:16];
                        if (v38) {
                          continue;
                        }
                        break;
                      }
                    }

                    [v87 addObject:v79];
LABEL_49:

                    long long v15 = v73;
                    uint64_t v27 = v74;
                    uint64_t v24 = v75;
                    uint64_t v26 = v78;
                    uint64_t v28 = v81;
                  }
                }
                ++v28;
              }
              while (v28 != v26);
              uint64_t v26 = [v80 countByEnumeratingWithState:&v97 objects:v111 count:16];
            }
            while (v26);
          }

          [v69 addObject:v76];
          uint64_t v18 = v64;
          uint64_t v17 = v66;
          id v22 = v70;
        }

        uint64_t v19 = v72 + 1;
      }
      while (v72 + 1 != v17);
      uint64_t v17 = [v67 countByEnumeratingWithState:&v101 objects:v112 count:16];
    }
    while (v17);
  }

  return v69;
}

- (id)splitItemGroupsWithItemGroups:(id)a3 maximumNumberOfItemsPerGroup:(unint64_t)a4 debugInfo:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v46;
    unint64_t v39 = a4 - 1;
    uint64_t v42 = v8;
    do
    {
      uint64_t v12 = 0;
      uint64_t v40 = v10;
      do
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v45 + 1) + 8 * v12);
        unint64_t v14 = [v13 count];
        if (v14 > a4)
        {
          uint64_t v15 = v11;
          unint64_t v16 = a4;
          unint64_t v17 = (v39 + v14) / a4;
          uint64_t v18 = [(PGDejunkerDeduper *)self timeSortedItemsWithItems:v13];
          uint64_t v19 = [(PGDejunkerDeduper *)self splitItemGroupsWithTimeSortedItems:v18 numberOfBuckets:v17];
          [v44 addObjectsFromArray:v19];
          loggingConnection = self->_loggingConnection;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
          {
            v34 = loggingConnection;
            uint64_t v35 = [obj count];
            uint64_t v36 = [v19 count];
            *(_DWORD *)buf = 134218240;
            uint64_t v50 = v35;
            __int16 v51 = 2048;
            uint64_t v52 = v36;
            _os_log_debug_impl(&dword_1D1805000, v34, OS_LOG_TYPE_DEBUG, "DejunkerDeduper: cluster with %lu items, split in %lu", buf, 0x16u);

            if (v8)
            {
LABEL_9:
              double v21 = [v18 lastObject];
              id v22 = objc_msgSend(v21, "cls_universalDate");
              uint64_t v23 = [v18 firstObject];
              uint64_t v24 = objc_msgSend(v23, "cls_universalDate");
              [v22 timeIntervalSinceDate:v24];
              uint64_t v26 = v25;

              id v8 = v42;
              uint64_t v27 = [NSString stringWithFormat:@"%f sec, %lu items, split in %lu", v26, objc_msgSend(v18, "count"), objc_msgSend(v19, "count")];
              [v42 setState:1 ofCluster:v13 withReason:v27];
            }
          }
          else if (v8)
          {
            goto LABEL_9;
          }
          a4 = v16;
          uint64_t v11 = v15;
          uint64_t v10 = v40;
          goto LABEL_13;
        }
        [v44 addObject:v13];
        if (!v8) {
          goto LABEL_14;
        }
        uint64_t v18 = [(PGDejunkerDeduper *)self timeSortedItemsWithItems:v13];
        uint64_t v28 = [v18 lastObject];
        v29 = objc_msgSend(v28, "cls_universalDate");
        v30 = [v18 firstObject];
        int v31 = objc_msgSend(v30, "cls_universalDate");
        [v29 timeIntervalSinceDate:v31];
        uint64_t v33 = v32;

        id v8 = v42;
        uint64_t v19 = [NSString stringWithFormat:@"%f sec, %lu items", v33, objc_msgSend(v13, "count")];
        [v42 setState:1 ofCluster:v13 withReason:v19];
LABEL_13:

LABEL_14:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v37 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
      uint64_t v10 = v37;
    }
    while (v37);
  }

  return v44;
}

- (id)splitItemGroupsWithTimeSortedItems:(id)a3 numberOfBuckets:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [v5 count];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      uint64_t v18 = v9;
      unint64_t v14 = a4 * v9;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v13);
        if (v14 >= v10 * v6)
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

          [v19 addObject:v16];
          ++v10;
          uint64_t v11 = v16;
        }
        [v11 addObject:v15];
        ++v13;
        v14 += a4;
      }
      while (v8 != v13);
      uint64_t v9 = v18 + v8;
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v19;
}

- (id)timeGroupsOfTimeSortedItemsWithTimeSortedItems:(id)a3 timeInterval:(double)a4 maximumTimeGroupExtension:(double)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __107__PGDejunkerDeduper_timeGroupsOfTimeSortedItemsWithTimeSortedItems_timeInterval_maximumTimeGroupExtension___block_invoke;
  aBlock[3] = &unk_1E68E4A70;
  double v33 = a4 * a5;
  aBlock[4] = self;
  id v10 = v9;
  id v32 = v10;
  uint64_t v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (!v13)
  {

    id v16 = 0;
    uint64_t v15 = 0;
    goto LABEL_17;
  }
  uint64_t v14 = v13;
  uint64_t v15 = 0;
  id v16 = 0;
  uint64_t v17 = *(void *)v28;
  id v26 = v10;
  do
  {
    uint64_t v18 = 0;
    id v19 = v15;
    do
    {
      if (*(void *)v28 != v17) {
        objc_enumerationMutation(v12);
      }
      uint64_t v20 = *(void **)(*((void *)&v27 + 1) + 8 * v18);
      long long v21 = objc_msgSend(v20, "cls_universalDate", v26);
      uint64_t v15 = v21;
      if (!v16) {
        goto LABEL_9;
      }
      [v21 timeIntervalSinceDate:v19];
      if (v22 > a4)
      {
        v11[2](v11, v16);
LABEL_9:
        id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

        [v23 addObject:v20];
        id v16 = v23;
        goto LABEL_11;
      }
      [v16 addObject:v20];
LABEL_11:

      ++v18;
      id v19 = v15;
    }
    while (v14 != v18);
    uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v34 count:16];
  }
  while (v14);

  if (v16) {
    v11[2](v11, v16);
  }
  id v10 = v26;
LABEL_17:
  id v24 = v10;

  return v24;
}

void __107__PGDejunkerDeduper_timeGroupsOfTimeSortedItemsWithTimeSortedItems_timeInterval_maximumTimeGroupExtension___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 lastObject];
  id v5 = objc_msgSend(v4, "cls_universalDate");
  uint64_t v6 = [v3 firstObject];
  uint64_t v7 = objc_msgSend(v6, "cls_universalDate");
  [v5 timeIntervalSinceDate:v7];
  double v9 = v8;

  double v10 = *(double *)(a1 + 48);
  if (v9 <= v10)
  {
    [*(id *)(a1 + 40) addObject:v3];
  }
  else
  {
    unint64_t v11 = vcvtpd_u64_f64(v9 / v10);
    [*(id *)(*(void *)(a1 + 32) + 16) setK:v11];
    id v12 = [*(id *)(*(void *)(a1 + 32) + 16) performWithDataset:v3 progressBlock:0];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(a1 + 32);
          uint64_t v18 = [*(id *)(*((void *)&v21 + 1) + 8 * v16) objects];
          id v19 = [v17 timeSortedItemsWithItems:v18];

          [*(id *)(a1 + 40) addObject:v19];
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v14);
    }
    uint64_t v20 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      double v26 = v9;
      __int16 v27 = 2048;
      unint64_t v28 = v11;
      _os_log_debug_impl(&dword_1D1805000, v20, OS_LOG_TYPE_DEBUG, "DejunkerDeduper: cluster with duration %f, split in %lu", buf, 0x16u);
    }
  }
}

- (double)semanticalDedupingSimilarityForItemFeature:(id)a3 options:(id)a4
{
  id v4 = a3;
  double v5 = 4.0;
  if (([v4 hasPersons] & 1) == 0)
  {
    if ([v4 hasPeopleScenes]) {
      double v5 = 3.0;
    }
    else {
      double v5 = 2.0;
    }
  }

  return v5;
}

- (double)semanticalDedupingTimeIntervalForItemFeature:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasPersons])
  {
    [v6 semanticalDedupingTimeIntervalForPersons];
  }
  else if ([v5 hasPeopleScenes])
  {
    [v6 semanticalDedupingTimeIntervalForPeople];
  }
  else
  {
    [v6 semanticalDedupingTimeInterval];
  }
  double v8 = v7;

  return v8;
}

- (BOOL)shouldPerformSemanticalDedupingForItemFeature:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if [v6 doNotDedupeVideos] && (objc_msgSend(v5, "isVideo"))
  {
    char v7 = 0;
  }
  else
  {
    if ([v5 hasPersons])
    {
      char v8 = [v6 dontSemanticallyDedupePersons];
    }
    else
    {
      if (![v5 hasPeopleScenes])
      {
        char v7 = 1;
        goto LABEL_10;
      }
      char v8 = [v6 dontSemanticallyDedupePeople];
    }
    char v7 = v8 ^ 1;
  }
LABEL_10:

  return v7;
}

- (double)identicalDedupingSimilarityForItemFeature:(id)a3 options:(id)a4
{
  id v4 = a3;
  double v5 = 1.0;
  if (([v4 hasPersons] & 1) == 0)
  {
    if ([v4 hasPeopleScenes]) {
      double v5 = 1.0;
    }
    else {
      double v5 = 0.0;
    }
  }

  return v5;
}

- (double)identicalDedupingTimeIntervalForItemFeature:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 hasPersons] & 1) != 0 || objc_msgSend(v5, "hasPeopleScenes")) {
    [v6 identicalDedupingTimeIntervalForPeople];
  }
  else {
    [v6 identicalDedupingTimeInterval];
  }
  double v8 = v7;

  return v8;
}

- (BOOL)shouldPerformIdenticalDedupingForItemFeature:(id)a3 options:(id)a4
{
  id v5 = a3;
  if ([a4 doNotDedupeVideos]) {
    int v6 = [v5 isVideo] ^ 1;
  }
  else {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (id)finalItemsWithItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PGDejunkerDeduper_finalItemsWithItems_options_debugInfo_progressBlock___block_invoke;
  aBlock[3] = &unk_1E68E4A48;
  unint64_t v39 = self;
  aBlock[4] = self;
  id v41 = v10;
  id v48 = v41;
  id v37 = v12;
  id v49 = v37;
  id v38 = v11;
  id v50 = v38;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v9;
  uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  uint64_t v40 = (void (**)(void, void))v13;
  if (v16)
  {
    uint64_t v17 = v16;
    id v18 = 0;
    uint64_t v19 = *(void *)v44;
    uint64_t v20 = v39;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        long long v22 = v18;
        if (*(void *)v44 != v19) {
          objc_enumerationMutation(obj);
        }
        long long v23 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        long long v24 = [(PGDejunkerDeduper *)v20 featureWithItem:v23];
        if (v22)
        {
          char v25 = [v15 containsObject:v24];
          char v26 = [v24 isVideo];
          if (v25) {
            goto LABEL_24;
          }
          if (v26) {
            goto LABEL_24;
          }
          __int16 v27 = objc_msgSend(v23, "cls_universalDate");
          unint64_t v28 = objc_msgSend(v22, "cls_universalDate");
          [v27 timeIntervalSinceDate:v28];
          double v30 = v29;

          uint64_t v20 = v39;
          [v41 finalPassTimeInterval];
          if (v30 >= v31) {
            goto LABEL_24;
          }
          [(CLSSimilarStacker *)v39->_similarStacker distanceBetweenItem:v23 andItem:v22];
          double v33 = v32;
          [v41 finalPassDedupingThreshold];
          if (v34 < 0.0) {
            -[CLSSimilarStacker distanceThresholdForSimilarity:withSimilarityModelVersion:](v39->_similarStacker, "distanceThresholdForSimilarity:withSimilarityModelVersion:", 0, [v23 clsSimilarityModelVersion]);
          }
          if (v33 >= v34)
          {
LABEL_24:
            if ([v14 count])
            {
              ((void (**)(void, id))v40)[2](v40, v14);
              [v14 removeAllObjects];
              [v15 removeAllObjects];
            }
          }
        }
        [v14 addObject:v23];
        [v15 addObject:v24];
        id v18 = v23;
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v17);
  }
  else
  {
    id v18 = 0;
  }

  if ([v14 count]) {
    ((void (**)(void, id))v40)[2](v40, v14);
  }
  id v35 = v37;

  return v35;
}

void __73__PGDejunkerDeduper_finalItemsWithItems_options_debugInfo_progressBlock___block_invoke(id *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = [v3 count];
  id v5 = a1[4];
  if (v4 < 2)
  {
    id v9 = [a1[4] eligibleItemsInItems:v3 options:a1[5]];
    [a1[6] addObjectsFromArray:v9];
  }
  else
  {
    [a1[5] finalPassTimeInterval];
    double v7 = v6;
    [a1[5] finalPassMaximumTimeGroupExtension];
    id v9 = [v5 timeGroupsOfTimeSortedItemsWithTimeSortedItems:v3 timeInterval:v7 maximumTimeGroupExtension:v8];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          unint64_t v15 = [v14 count];
          id v16 = a1[4];
          id v17 = a1[5];
          if (v15 < 2)
          {
            id v18 = [v16 eligibleItemsInItems:v14 options:v17];
            [a1[6] addObjectsFromArray:v18];
          }
          else
          {
            id v18 = [v16 bestItemsInItems:v14 options:v17];
            [a1[6] addObjectsFromArray:v18];
            [a1[7] dedupItems:v14 toItems:v18 withDedupingType:5];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }
  }
}

- (id)dejunkedItemsWithItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = [v11 identifiersOfRequiredItems];
  uint64_t v13 = [v11 identifiersOfEligibleItems];

  id v14 = (void *)MEMORY[0x1E4F28F60];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __76__PGDejunkerDeduper_dejunkedItemsWithItems_options_debugInfo_progressBlock___block_invoke;
  v26[3] = &unk_1E68E49F8;
  id v15 = v12;
  id v27 = v15;
  id v16 = v13;
  id v28 = v16;
  double v29 = self;
  id v17 = [v14 predicateWithBlock:v26];
  id v18 = [v9 filteredArrayUsingPredicate:v17];

  if (v10)
  {
    long long v19 = (void *)MEMORY[0x1E4F28F60];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __76__PGDejunkerDeduper_dejunkedItemsWithItems_options_debugInfo_progressBlock___block_invoke_2;
    v24[3] = &unk_1E68E4A20;
    v24[4] = self;
    id v25 = v15;
    long long v20 = [v19 predicateWithBlock:v24];
    long long v21 = [v9 filteredArrayUsingPredicate:v20];

    long long v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v21];
    [v10 setState:2 ofItems:v22 withReason:@"Junk"];
  }
  return v18;
}

uint64_t __76__PGDejunkerDeduper_dejunkedItemsWithItems_options_debugInfo_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 clsIdentifier];
  if ([*(id *)(a1 + 32) containsObject:v4])
  {
    uint64_t v5 = 1;
  }
  else
  {
    double v6 = *(void **)(a1 + 40);
    if (v6 && ![v6 containsObject:v4]) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = [*(id *)(a1 + 48) isJunkForItem:v3] ^ 1;
    }
  }

  return v5;
}

uint64_t __76__PGDejunkerDeduper_dejunkedItemsWithItems_options_debugInfo_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isJunkForItem:v3])
  {
    unint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = [v3 clsIdentifier];
    uint64_t v6 = [v4 containsObject:v5] ^ 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)semanticallyDedupedItemsInItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v73 = a5;
  uint64_t v12 = (void (**)(void *, unsigned char *, double))_Block_copy(a6);
  double v13 = 0.0;
  if (v12)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v86 = 0;
      v12[2](v12, &v86, 0.0);
      if (v86)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v91 = 247;
          __int16 v92 = 2080;
          long long v93 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curati"
                "on/DejunkDedupe/PGDejunkerDeduper.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v15 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_68;
      }
      double v13 = Current;
    }
  }
  [v73 setStage:@"Semantical"];
  id v16 = [(PGDejunkerDeduper *)self itemsByFeatureWithItems:v10];
  uint64_t v17 = [v16 count];
  if (v17)
  {
    unint64_t v18 = v17;
    id v59 = v10;
    similarStacker = self->_similarStacker;
    [v11 semanticalDedupingThreshold];
    -[CLSSimilarStacker overrideDistanceThreshold:forSimilarity:](similarStacker, "overrideDistanceThreshold:forSimilarity:", 2);
    long long v20 = self->_similarStacker;
    [v11 semanticalDedupingThresholdForPeople];
    -[CLSSimilarStacker overrideDistanceThreshold:forSimilarity:](v20, "overrideDistanceThreshold:forSimilarity:", 3);
    long long v21 = self->_similarStacker;
    [v11 semanticalDedupingThresholdForPersons];
    -[CLSSimilarStacker overrideDistanceThreshold:forSimilarity:](v21, "overrideDistanceThreshold:forSimilarity:", 4);
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v23 = [v11 maximumNumberOfItemsPerSemanticalCluster];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    double v58 = v16;
    obuint64_t j = v16;
    uint64_t v60 = [obj countByEnumeratingWithState:&v82 objects:v89 count:16];
    if (v60)
    {
      double v24 = 1.0 / (double)v18;
      uint64_t v25 = *(void *)v83;
      double v26 = 0.0;
      uint64_t v63 = v23;
      uint64_t v64 = v12;
      uint64_t v57 = *(void *)v83;
      while (2)
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v83 != v25)
          {
            uint64_t v28 = v27;
            objc_enumerationMutation(obj);
            uint64_t v27 = v28;
          }
          uint64_t v61 = v27;
          uint64_t v67 = *(void *)(*((void *)&v82 + 1) + 8 * v27);
          if (v12)
          {
            double v29 = CFAbsoluteTimeGetCurrent();
            if (v29 - v13 >= 0.01)
            {
              char v86 = 0;
              v12[2](v12, &v86, v26);
              if (v86)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  int v91 = 274;
                  __int16 v92 = 2080;
                  long long v93 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Curation/DejunkDedupe/PGDejunkerDeduper.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
LABEL_63:

                goto LABEL_64;
              }
              double v13 = v29;
            }
          }
          double v26 = v24 + v26;
          double v30 = objc_msgSend(obj, "objectForKeyedSubscript:", v67, v57);
          if (-[PGDejunkerDeduper shouldPerformSemanticalDedupingForItemFeature:options:](self, "shouldPerformSemanticalDedupingForItemFeature:options:", v67, v11)&& [v30 count] != 1)
          {
            [(PGDejunkerDeduper *)self semanticalDedupingTimeIntervalForItemFeature:v67 options:v11];
            double v33 = v32;
            id v34 = [(PGDejunkerDeduper *)self timeSortedItemsWithItems:v30];
            [v11 semanticalDedupingMaximumTimeGroupExtension];
            uint64_t v36 = [(PGDejunkerDeduper *)self timeGroupsOfTimeSortedItemsWithTimeSortedItems:v34 timeInterval:v33 maximumTimeGroupExtension:v35];
            unint64_t v37 = [v36 count];
            if ([v11 semanticalDedupingProtectSmallClusters]) {
              unint64_t v38 = vcvtad_u64_f64(2.0 / (double)(unint64_t)[v36 count]) + 2;
            }
            else {
              unint64_t v38 = 2;
            }
            unint64_t v69 = v38;
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            id v31 = v36;
            uint64_t v71 = [v31 countByEnumeratingWithState:&v78 objects:v88 count:16];
            if (v71)
            {
              double v39 = v24 / (double)v37;
              uint64_t v70 = *(void *)v79;
              double v40 = 0.0;
              id v65 = v31;
              uint64_t v66 = v30;
              while (2)
              {
                uint64_t v41 = 0;
                uint64_t v42 = v34;
                do
                {
                  if (*(void *)v79 != v70) {
                    objc_enumerationMutation(v31);
                  }
                  id v34 = *(id *)(*((void *)&v78 + 1) + 8 * v41);

                  if (v12)
                  {
                    double v43 = CFAbsoluteTimeGetCurrent();
                    if (v43 - v13 >= 0.01)
                    {
                      char v86 = 0;
                      v12[2](v12, &v86, v26 + v40);
                      if (v86)
                      {
                        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 67109378;
                          int v91 = 303;
                          __int16 v92 = 2080;
                          long long v93 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/DejunkDedupe/PGDejunkerDeduper.m";
                          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                        }

                        goto LABEL_63;
                      }
                      double v13 = v43;
                    }
                  }
                  uint64_t v72 = v41;
                  if ([v34 count] >= v69)
                  {
                    [(PGDejunkerDeduper *)self semanticalDedupingSimilarityForItemFeature:v67 options:v11];
                    uint64_t v46 = (uint64_t)v45;
                    long long v47 = [(CLSSimilarStacker *)self->_similarStacker stackSimilarItems:v34 withSimilarity:(uint64_t)v45 timestampSupport:0 progressBlock:0];
                    id v68 = v34;
                    if (v23)
                    {
                      uint64_t v48 = [(PGDejunkerDeduper *)self splitItemGroupsWithItemGroups:v47 maximumNumberOfItemsPerGroup:v23 debugInfo:0];

                      long long v47 = (void *)v48;
                    }
                    long long v76 = 0u;
                    long long v77 = 0u;
                    long long v74 = 0u;
                    long long v75 = 0u;
                    id v44 = v47;
                    uint64_t v49 = [v44 countByEnumeratingWithState:&v74 objects:v87 count:16];
                    if (v49)
                    {
                      uint64_t v50 = v49;
                      uint64_t v51 = *(void *)v75;
                      do
                      {
                        for (uint64_t i = 0; i != v50; ++i)
                        {
                          if (*(void *)v75 != v51) {
                            objc_enumerationMutation(v44);
                          }
                          v53 = *(void **)(*((void *)&v74 + 1) + 8 * i);
                          if ([v53 count] == 1)
                          {
                            uint64_t v54 = [(PGDejunkerDeduper *)self eligibleItemsInItems:v53 options:v11];
                            [v22 addObjectsFromArray:v54];
                          }
                          else
                          {
                            uint64_t v54 = [(PGDejunkerDeduper *)self bestItemGroupsBasedOnSceneprintsWithItemGroups:v53 forSimilarity:v46 options:v11];
                            [v22 addObjectsFromArray:v54];
                            [v73 dedupItems:v53 toItems:v54 withDedupingType:2];
                          }
                        }
                        uint64_t v50 = [v44 countByEnumeratingWithState:&v74 objects:v87 count:16];
                      }
                      while (v50);
                    }

                    uint64_t v23 = v63;
                    uint64_t v12 = v64;
                    id v31 = v65;
                    double v30 = v66;
                    id v34 = v68;
                  }
                  else
                  {
                    id v44 = [(PGDejunkerDeduper *)self eligibleItemsInItems:v34 options:v11];
                    [v22 addObjectsFromArray:v44];
                  }
                  double v40 = v39 + v40;

                  uint64_t v41 = v72 + 1;
                  uint64_t v42 = v34;
                }
                while (v72 + 1 != v71);
                uint64_t v71 = [v31 countByEnumeratingWithState:&v78 objects:v88 count:16];
                if (v71) {
                  continue;
                }
                break;
              }
            }

            uint64_t v25 = v57;
          }
          else
          {
            id v31 = [(PGDejunkerDeduper *)self eligibleItemsInItems:v30 options:v11];
            [v22 addObjectsFromArray:v31];
          }

          uint64_t v27 = v61 + 1;
        }
        while (v61 + 1 != v60);
        uint64_t v55 = [obj countByEnumeratingWithState:&v82 objects:v89 count:16];
        uint64_t v60 = v55;
        if (v55) {
          continue;
        }
        break;
      }
    }

    if (v12 && CFAbsoluteTimeGetCurrent() - v13 >= 0.01 && (char v86 = 0, v12[2](v12, &v86, 1.0), v86))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v91 = 338;
        __int16 v92 = 2080;
        long long v93 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation"
              "/DejunkDedupe/PGDejunkerDeduper.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
LABEL_64:
      id v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v15 = [(PGDejunkerDeduper *)self timeSortedItemsWithItems:v22];
    }

    id v16 = v58;
    id v10 = v59;
  }
  else
  {
    id v15 = [(PGDejunkerDeduper *)self eligibleItemsInItems:v10 options:v11];
  }

LABEL_68:
  return v15;
}

- (id)identicallyDedupedItemsInItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = 0.0;
  int v91 = (void (**)(void *, unsigned char *, double))_Block_copy(v13);
  if (v91)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      unsigned __int8 v122 = 0;
      v91[2](v91, &v122, 0.0);
      if (v122)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v129 = 112;
          __int16 v130 = 2080;
          v131 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curat"
                 "ion/DejunkDedupe/PGDejunkerDeduper.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v16 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_98;
      }
      double v14 = Current;
    }
  }
  [v12 setStage:@"Identical"];
  uint64_t v17 = [(PGDejunkerDeduper *)self itemsByFeatureWithItems:v10];
  uint64_t v18 = [v17 count];
  if (v18)
  {
    unint64_t v19 = v18;
    id v82 = v10;
    long long v83 = v17;
    id v81 = v13;
    similarStacker = self->_similarStacker;
    [v11 identicalDedupingThreshold];
    -[CLSSimilarStacker overrideDistanceThreshold:forSimilarity:](similarStacker, "overrideDistanceThreshold:forSimilarity:", 0);
    long long v21 = self->_similarStacker;
    [v11 identicalDedupingThresholdForPeople];
    -[CLSSimilarStacker overrideDistanceThreshold:forSimilarity:](v21, "overrideDistanceThreshold:forSimilarity:", 1);
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v90 = [v11 maximumNumberOfItemsPerIdenticalCluster];
    id v93 = 0;
    if (([v11 useOnlyScenesForDeduping] & 1) == 0)
    {
      if ([v11 useFaceprintsForIdenticalDeduping]) {
        id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      else {
        id v93 = 0;
      }
    }
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    obuint64_t j = v17;
    long long v105 = v12;
    uint64_t v85 = [obj countByEnumeratingWithState:&v118 objects:v127 count:16];
    if (v85)
    {
      char v95 = 0;
      double v23 = 1.0 / (double)v19;
      double v24 = v91;
      uint64_t v84 = *(void *)v119;
      double v25 = 0.0;
      while (2)
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v119 != v84) {
            objc_enumerationMutation(obj);
          }
          uint64_t v87 = v26;
          uint64_t v27 = *(void **)(*((void *)&v118 + 1) + 8 * v26);
          uint64_t v28 = (void *)MEMORY[0x1D25FED50]();
          if (v24)
          {
            double v29 = CFAbsoluteTimeGetCurrent();
            if (v29 - v14 >= 0.01)
            {
              unsigned __int8 v122 = 0;
              v24[2](v24, &v122, v25);
              if (v122 | v95 & 1)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  int v129 = 140;
                  __int16 v130 = 2080;
                  v131 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Curation/DejunkDedupe/PGDejunkerDeduper.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
LABEL_94:

                goto LABEL_95;
              }
              char v95 = 0;
              double v14 = v29;
            }
          }
          long long v89 = v28;
          double v30 = [obj objectForKeyedSubscript:v27];
          id v31 = [(PGDejunkerDeduper *)self timeSortedItemsWithItems:v30];
          BOOL v32 = [(PGDejunkerDeduper *)self shouldPerformIdenticalDedupingForItemFeature:v27 options:v11];
          uint64_t v88 = v30;
          BOOL v97 = v32;
          if ((unint64_t)[v30 count] < 2 || !v32)
          {
            id v126 = v31;
            [MEMORY[0x1E4F1C978] arrayWithObjects:&v126 count:1];
          }
          else
          {
            [(PGDejunkerDeduper *)self identicalDedupingTimeIntervalForItemFeature:v27 options:v11];
            double v35 = v34;
            [v11 identicalDedupingMaximumTimeGroupExtension];
            [(PGDejunkerDeduper *)self timeGroupsOfTimeSortedItemsWithTimeSortedItems:v31 timeInterval:v35 maximumTimeGroupExtension:v36];
          unint64_t v37 = };
          double v25 = v23 + v25;
          [v12 addClusters:v37 withReason:@"Time Clustering"];
          unint64_t v38 = [v37 count];
          long long v114 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          id v94 = v37;
          uint64_t v99 = [v94 countByEnumeratingWithState:&v114 objects:v125 count:16];
          if (v99)
          {
            double v39 = v23 / (double)v38;
            uint64_t v98 = *(void *)v115;
            double v40 = 0.0;
            double v41 = v14;
            long long v96 = v27;
            while (2)
            {
              uint64_t v42 = 0;
              double v43 = v31;
              do
              {
                if (*(void *)v115 != v98) {
                  objc_enumerationMutation(v94);
                }
                id v31 = *(id *)(*((void *)&v114 + 1) + 8 * v42);

                uint64_t v102 = v42;
                context = (void *)MEMORY[0x1D25FED50]();
                if (v24)
                {
                  double v14 = CFAbsoluteTimeGetCurrent();
                  if (v14 - v41 >= 0.01)
                  {
                    unsigned __int8 v122 = 0;
                    v24[2](v24, &v122, v25 + v40);
                    if (v122 | v95 & 1)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 67109378;
                        int v129 = 167;
                        __int16 v130 = 2080;
                        v131 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Curation/DejunkDedupe/PGDejunkerDeduper.m";
                        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                      }
                      int v70 = 0;
                      char v95 = 1;
                      goto LABEL_69;
                    }
                    char v95 = 0;
                    double v41 = v14;
                  }
                }
                if (v12)
                {
                  id v44 = [v31 firstObject];
                  long long v100 = [(PGDejunkerDeduper *)self debugPersonStringForItem:v44];

                  double v45 = [v31 lastObject];
                  uint64_t v46 = objc_msgSend(v45, "cls_universalDate");
                  [v31 firstObject];
                  long long v47 = v24;
                  id v48 = v12;
                  v50 = id v49 = v31;
                  uint64_t v51 = objc_msgSend(v50, "cls_universalDate");
                  [v46 timeIntervalSinceDate:v51];
                  uint64_t v53 = v52;

                  id v31 = v49;
                  id v12 = v48;
                  double v24 = v47;

                  uint64_t v54 = NSString;
                  uint64_t v55 = [v31 count];
                  unint64_t v56 = [v31 count];
                  uint64_t v57 = &stru_1F283BC78;
                  if (v56 > 1) {
                    uint64_t v57 = @"s";
                  }
                  uint64_t v80 = v55;
                  uint64_t v27 = v96;
                  double v58 = [v54 stringWithFormat:@"%.0f sec, %lu item%@: %@", v53, v80, v57, v100];
                  [v12 setState:1 ofCluster:v31 withReason:v58];
                }
                if (v97 && [v31 count] != 1)
                {
                  [(PGDejunkerDeduper *)self identicalDedupingSimilarityForItemFeature:v27 options:v11];
                  uint64_t v60 = v27;
                  uint64_t v62 = (uint64_t)v61;
                  id v59 = [(CLSSimilarStacker *)self->_similarStacker stackSimilarItems:v31 withSimilarity:(uint64_t)v61 timestampSupport:0 progressBlock:0];
                  long long v101 = [v12 debugInfoForCluster:v31];
                  [v101 setClusters:v59 withReason:@"Similar Stacking"];
                  if (v93 && [v60 hasPersons])
                  {
                    [v93 addObjectsFromArray:v59];
                  }
                  else
                  {
                    id v92 = v31;
                    if (v90)
                    {
                      uint64_t v63 = [(PGDejunkerDeduper *)self splitItemGroupsWithItemGroups:v59 maximumNumberOfItemsPerGroup:v90 debugInfo:v101];

                      id v59 = (id)v63;
                    }
                    long long v112 = 0u;
                    long long v113 = 0u;
                    long long v110 = 0u;
                    long long v111 = 0u;
                    id v59 = v59;
                    uint64_t v64 = [v59 countByEnumeratingWithState:&v110 objects:v124 count:16];
                    if (v64)
                    {
                      uint64_t v65 = v64;
                      uint64_t v66 = *(void *)v111;
                      do
                      {
                        for (uint64_t i = 0; i != v65; ++i)
                        {
                          if (*(void *)v111 != v66) {
                            objc_enumerationMutation(v59);
                          }
                          id v68 = *(void **)(*((void *)&v110 + 1) + 8 * i);
                          if ([v68 count] == 1)
                          {
                            unint64_t v69 = [(PGDejunkerDeduper *)self eligibleItemsInItems:v68 options:v11];
                            [v22 addObjectsFromArray:v69];
                          }
                          else
                          {
                            unint64_t v69 = [(PGDejunkerDeduper *)self bestItemGroupsBasedOnSceneprintsWithItemGroups:v68 forSimilarity:v62 options:v11];
                            [v22 addObjectsFromArray:v69];
                            [v105 dedupItems:v68 toItems:v69 withDedupingType:1];
                          }
                        }
                        uint64_t v65 = [v59 countByEnumeratingWithState:&v110 objects:v124 count:16];
                      }
                      while (v65);
                    }

                    id v12 = v105;
                    double v24 = v91;
                    id v31 = v92;
                  }

                  uint64_t v27 = v96;
                }
                else
                {
                  id v59 = [(PGDejunkerDeduper *)self eligibleItemsInItems:v31 options:v11];
                  [v22 addObjectsFromArray:v59];
                }
                double v40 = v39 + v40;

                uint64_t v42 = v102 + 1;
                double v43 = v31;
              }
              while (v102 + 1 != v99);
              uint64_t v99 = [v94 countByEnumeratingWithState:&v114 objects:v125 count:16];
              if (v99) {
                continue;
              }
              break;
            }
            int v70 = 1;
            double v14 = v41;
          }
          else
          {
            int v70 = 1;
          }
LABEL_69:

          if (!v70) {
            goto LABEL_94;
          }
          uint64_t v26 = v87 + 1;
        }
        while (v87 + 1 != v85);
        uint64_t v85 = [obj countByEnumeratingWithState:&v118 objects:v127 count:16];
        if (v85) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v95 = 0;
      double v24 = v91;
    }

    if ([v93 count])
    {
      [(PGDejunkerDeduper *)self bestItemGroupsBasedOnFaceprintsWithItemGroups:v93 options:v11];
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      contexta = long long v109 = 0u;
      uint64_t v71 = [contexta countByEnumeratingWithState:&v106 objects:v123 count:16];
      if (v71)
      {
        uint64_t v72 = v71;
        uint64_t v73 = 0;
        uint64_t v74 = *(void *)v107;
        do
        {
          for (uint64_t j = 0; j != v72; ++j)
          {
            if (*(void *)v107 != v74) {
              objc_enumerationMutation(contexta);
            }
            long long v76 = *(void **)(*((void *)&v106 + 1) + 8 * j);
            long long v77 = [v93 objectAtIndexedSubscript:v73 + j];
            uint64_t v78 = [v77 count];
            if (v78 != [v76 count]) {
              [v105 dedupItems:v77 toItems:v76 withDedupingType:1];
            }
            [v22 addObjectsFromArray:v76];
          }
          v73 += j;
          uint64_t v72 = [contexta countByEnumeratingWithState:&v106 objects:v123 count:16];
        }
        while (v72);
      }

      id v12 = v105;
      double v24 = v91;
    }
    if (v24 && CFAbsoluteTimeGetCurrent() - v14 >= 0.01 && (unsigned __int8 v122 = 0, v24[2](v24, &v122, 1.0), v122 | v95 & 1))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v129 = 239;
        __int16 v130 = 2080;
        v131 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curatio"
               "n/DejunkDedupe/PGDejunkerDeduper.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
LABEL_95:
      id v16 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v16 = [(PGDejunkerDeduper *)self timeSortedItemsWithItems:v22];
    }

    id v13 = v81;
    id v10 = v82;
    uint64_t v17 = v83;
  }
  else
  {
    id v16 = [(PGDejunkerDeduper *)self eligibleItemsInItems:v10 options:v11];
  }

LABEL_98:
  return v16;
}

- (id)dejunkedDedupedItemsInItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v37 = a6;
  id v13 = _Block_copy(v37);
  uint64_t v63 = 0;
  uint64_t v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  uint64_t v59 = 0;
  uint64_t v60 = (double *)&v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 0;
  double v36 = v10;
  if (!v13
    || (double v14 = CFAbsoluteTimeGetCurrent(), v14 - v60[3] < 0.01)
    || (v60[3] = v14,
        char v58 = 0,
        (*((void (**)(void *, char *, double))v13 + 2))(v13, &v58, 0.0),
        char v15 = *((unsigned char *)v64 + 24) | v58,
        (*((unsigned char *)v64 + 24) = v15) == 0))
  {
    [v12 setAgent:@"DejunkerDeduper"];
    id v17 = v10;
    id v18 = v17;
    if ([v11 doIdenticalDeduping])
    {
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke;
      v53[3] = &unk_1E68F03F8;
      id v54 = v13;
      uint64_t v55 = &v59;
      unint64_t v56 = &v63;
      uint64_t v57 = 0x3F847AE147AE147BLL;
      id v18 = [(PGDejunkerDeduper *)self identicallyDedupedItemsInItems:v17 options:v11 debugInfo:v12 progressBlock:v53];

      if (*((unsigned char *)v64 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)id v68 = 63;
          *(_WORD *)&v68[4] = 2080;
          *(void *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Curation/DejunkDedupe/PGDejunkerDeduper.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v16 = (void *)MEMORY[0x1E4F1CBF0];
        id v19 = v54;
        goto LABEL_45;
      }
    }
    id v18 = v18;
    id v19 = v18;
    if ([v11 doSemanticalDeduping])
    {
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke_70;
      v48[3] = &unk_1E68F03F8;
      id v49 = v13;
      uint64_t v50 = &v59;
      uint64_t v51 = &v63;
      uint64_t v52 = 0x3F847AE147AE147BLL;
      id v19 = [(PGDejunkerDeduper *)self semanticallyDedupedItemsInItems:v18 options:v11 debugInfo:v12 progressBlock:v48];

      if (*((unsigned char *)v64 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)id v68 = 73;
          *(_WORD *)&v68[4] = 2080;
          *(void *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Curation/DejunkDedupe/PGDejunkerDeduper.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v16 = (void *)MEMORY[0x1E4F1CBF0];
        id v20 = v49;
        goto LABEL_44;
      }
    }
    id v19 = v19;
    id v20 = v19;
    if ([v11 doDejunk])
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke_71;
      v43[3] = &unk_1E68F03F8;
      id v44 = v13;
      double v45 = &v59;
      uint64_t v46 = &v63;
      uint64_t v47 = 0x3F847AE147AE147BLL;
      id v20 = [(PGDejunkerDeduper *)self dejunkedItemsWithItems:v19 options:v11 debugInfo:v12 progressBlock:v43];

      if (*((unsigned char *)v64 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)id v68 = 83;
          *(_WORD *)&v68[4] = 2080;
          *(void *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Curation/DejunkDedupe/PGDejunkerDeduper.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v16 = (void *)MEMORY[0x1E4F1CBF0];
        id v21 = v44;
        goto LABEL_43;
      }
      if (![v20 count] && objc_msgSend(v11, "returnDedupedJunkIfOnlyJunk"))
      {
        id v22 = v19;

        id v20 = v22;
      }
    }
    id v20 = v20;
    id v21 = v20;
    if ([v11 doFinalPass])
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke_72;
      v38[3] = &unk_1E68F03F8;
      id v39 = v13;
      double v40 = &v59;
      double v41 = &v63;
      uint64_t v42 = 0x3F847AE147AE147BLL;
      id v21 = [(PGDejunkerDeduper *)self finalItemsWithItems:v20 options:v11 debugInfo:v12 progressBlock:v38];

      if (*((unsigned char *)v64 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)id v68 = 97;
          *(_WORD *)&v68[4] = 2080;
          *(void *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Curation/DejunkDedupe/PGDejunkerDeduper.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        goto LABEL_33;
      }
    }
    double v23 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_INFO))
    {
      double v24 = (void *)MEMORY[0x1E4F28C10];
      double v35 = [v17 firstObject];
      double v34 = objc_msgSend(v35, "cls_universalDate");
      id v33 = [v24 localizedStringFromDate:v34 dateStyle:2 timeStyle:0];
      uint64_t v32 = [v17 count];
      uint64_t v31 = [v18 count];
      uint64_t v30 = [v19 count];
      uint64_t v25 = [v20 count];
      uint64_t v26 = [v21 count];
      *(_DWORD *)buf = 138413570;
      *(void *)id v68 = v33;
      *(_WORD *)&v68[8] = 2048;
      *(void *)&v68[10] = v32;
      __int16 v69 = 2048;
      uint64_t v70 = v31;
      __int16 v71 = 2048;
      uint64_t v72 = v30;
      __int16 v73 = 2048;
      uint64_t v74 = v25;
      __int16 v75 = 2048;
      uint64_t v76 = v26;
      _os_log_impl(&dword_1D1805000, (os_log_t)v23, OS_LOG_TYPE_INFO, "DejunkerDeduper: %@: %lu -> %lu -> %lu -> %lu -> %lu", buf, 0x3Eu);
    }
    if (!v13
      || (double Current = CFAbsoluteTimeGetCurrent(), Current - v60[3] < 0.01)
      || (v60[3] = Current,
          char v58 = 0,
          (*((void (**)(void *, char *, double))v13 + 2))(v13, &v58, 1.0),
          char v28 = *((unsigned char *)v64 + 24) | v58,
          (*((unsigned char *)v64 + 24) = v28) == 0))
    {
      id v21 = v21;
      id v16 = v21;
      goto LABEL_43;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)id v68 = 102;
      *(_WORD *)&v68[4] = 2080;
      *(void *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Curation/DejunkDedupe/PGDejunkerDeduper.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_33:
    id v16 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_43:

LABEL_44:
LABEL_45:

    goto LABEL_46;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)id v68 = 52;
    *(_WORD *)&v68[4] = 2080;
    *(void *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Curation/DejunkDedupe/PGDejunkerDeduper.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v16 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_46:
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  return v16;
}

void __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.4);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke_70(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.4 + 0.4);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke_71(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.8);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke_72(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.9);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (PGDejunkerDeduper)initWithSimilarityModelClass:(Class)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PGDejunkerDeduper;
  unint64_t v4 = [(PGDejunkerDeduper *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F8A8C8]) initWithNumericValueKeypaths:&unk_1F28D3918];
    kMeanTimeClusterer = v4->_kMeanTimeClusterer;
    v4->_kMeanTimeClusterer = (PLKMeansClustering *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F76DA0]) initWithSimilarityModelClass:a3];
    similarStacker = v4->_similarStacker;
    v4->_similarStacker = (CLSSimilarStacker *)v7;

    objc_storeStrong((id *)&v4->_loggingConnection, MEMORY[0x1E4F14500]);
  }
  return v4;
}

uint64_t __73__PGDejunkerDeduper_CLSCurationItem_itemsSortedByScoreWithItems_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v5 clsContentScore];
  double v8 = v7;
  [v6 clsContentScore];
  if (v8 <= v9)
  {
    if (v8 < v9)
    {
      uint64_t v10 = 1;
    }
    else
    {
      id v11 = [v5 clsIdentifier];
      id v12 = [v6 clsIdentifier];
      if (*(unsigned char *)(a1 + 40)
        && ([*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:v11],
            (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        double v14 = v13;
        [v13 doubleValue];
        double v16 = v15;
      }
      else
      {
        [v5 clsAestheticScore];
        double v16 = v17;
      }
      if (*(unsigned char *)(a1 + 40)
        && ([*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:v12],
            (id v18 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v19 = v18;
        [v18 doubleValue];
        double v21 = v20;
      }
      else
      {
        [v6 clsAestheticScore];
        double v21 = v22;
      }
      if (v16 <= v21)
      {
        if (v16 < v21) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = [v11 compare:v12];
        }
      }
      else
      {
        uint64_t v10 = -1;
      }
    }
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

void __95__PGDejunkerDeduper_CLSCurationItem_dejunkedDedupedItemIdentifiersWithItems_options_debugInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  id v10 = [v5 curationModelForItemInfo:v7 options:v6];
  double v9 = +[PGCuratorInvestigationItem itemWithUUID:v8 itemInfo:v7 curationModel:v10];

  [*(id *)(a1 + 48) addObject:v9];
}

uint64_t __65__PGDejunkerDeduper_PHAsset_itemsSortedByScoreWithItems_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v5 clsContentScore];
  double v8 = v7;
  [v6 clsContentScore];
  if (v8 <= v9)
  {
    if (v8 < v9)
    {
      uint64_t v10 = 1;
    }
    else
    {
      id v11 = [v5 uuid];
      id v12 = [v6 uuid];
      if (*(unsigned char *)(a1 + 40)
        && ([*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:v11],
            (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        double v14 = v13;
        [v13 doubleValue];
        double v16 = v15;
      }
      else
      {
        [v5 overallAestheticScore];
        double v16 = v17;
      }
      if (*(unsigned char *)(a1 + 40)
        && ([*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:v12],
            (id v18 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v19 = v18;
        [v18 doubleValue];
        double v21 = v20;
      }
      else
      {
        [v6 overallAestheticScore];
        double v21 = v22;
      }
      if (v16 <= v21)
      {
        if (v16 < v21) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = [v11 compare:v12];
        }
      }
      else
      {
        uint64_t v10 = -1;
      }
    }
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

void __87__PGDejunkerDeduper_PHAsset_faceprintByPersonLocalIdentifierByItemIdentifierWithItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a2;
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v12 = [v11 personLocalIdentifier];
        if (v12)
        {
          id v13 = [v11 faceClusteringProperties];
          double v14 = [v13 faceprint];
          double v15 = [v14 faceprintData];

          if (v15)
          {
            id v16 = objc_alloc(MEMORY[0x1E4F45800]);
            uint64_t v22 = 0;
            float v17 = (void *)[v16 initWithState:v15 error:&v22];
            if (v17) {
              [v5 setObject:v17 forKeyedSubscript:v12];
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  id v18 = *(void **)(a1 + 32);
  id v19 = [MEMORY[0x1E4F38EB8] uuidFromLocalIdentifier:v21];
  [v18 setObject:v5 forKeyedSubscript:v19];
}

void __60__PGDejunkerDeduper_PHAsset__buildCachesWithAssets_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ([v5 isKnownPerson])
  {
    [*(id *)(a1 + 32) addObject:v11];
    [v5 faceQuality];
    if (v6 >= 0.0)
    {
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 24);
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    [v5 faceSize];
    if (v7 > 0.0)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      double v9 = *(double *)(v8 + 24);
      if (v9 < v7 && v9 > 0.0) {
        double v7 = *(double *)(v8 + 24);
      }
      *(double *)(v8 + 24) = v7;
    }
  }
}

void __60__PGDejunkerDeduper_PHAsset__buildCachesWithAssets_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (([v5 isKnownPerson] & 1) == 0)
  {
    [v5 faceSize];
    if (v6 >= *(double *)(a1 + 56))
    {
      [v5 faceQuality];
      if (v7 >= 0.0)
      {
        [*(id *)(a1 + 32) addObject:v9];
        [v5 faceQuality];
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                                + 24);
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      }
    }
  }
}

@end