@interface PGGraphIngestBusinessProcessor
+ (id)_spatialMapCategoriesByMeaningIdentifier;
+ (unint64_t)requiredMomentUpdateTypes;
- (BOOL)_momentNode:(id)a3 hasValidConstraintsForLocationOfInterestVisit:(id)a4 requiredCriteriaByPOIIdentifier:(id)a5 meaningfulEventProcessorCache:(id)a6;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestBusinessProcessor)initWithGraphBuilder:(id)a3;
- (id)_businessItemContainersToEnrichForLowConfidenceDisambiguation:(id)a3 requiredCriteriaByPOIIdentifier:(id)a4 meaningfulEventProcessorCache:(id)a5;
- (id)_predominantVisitForMomentNode:(id)a3 publicEventBusinessItemMuid:(unint64_t)a4;
- (id)requiredCriteriaByPOIIdentifierForGraph:(id)a3;
- (void)_insertBusinessItemsForMomentNodesToResolvedBusinessItems:(id)a3 graph:(id)a4 progressBlock:(id)a5;
- (void)_insertBusinessItemsFromMomentNodes:(id)a3 graph:(id)a4 withLocationOfInterestVisitsToResolveByMomentUUID:(id)a5 requiredCriteriaByPOIIdentifier:(id)a6 progressBlock:(id)a7;
- (void)deleteBusinessCategoryNodesWithNoEdges:(id)a3;
- (void)deleteBusinessEdgesWithMomentNodes:(id)a3 inGraph:(id)a4;
- (void)deleteBusinessNodesWithNoInEdgesInGraph:(id)a3;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestBusinessProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessCacheUpdater, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

- (id)requiredCriteriaByPOIIdentifierForGraph:(id)a3
{
  v14[10] = *MEMORY[0x1E4F143B8];
  v14[0] = @"Performance";
  v14[1] = @"SportEvent";
  v14[2] = @"Lunch";
  v14[3] = @"Dinner";
  v14[4] = @"Breakfast";
  v14[5] = @"NightOut";
  v14[6] = @"Entertainment";
  v14[7] = @"AmusementPark";
  v14[8] = @"Museum";
  v14[9] = @"Concert";
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:v14 count:10];
  v7 = [(PGGraphBuilder *)self->_graphBuilder sceneTaxonomy];
  v8 = +[PGMeaningfulEventRequiredCriteriaFactory requiredCriteriaForIdentifiers:v6 inferenceType:0 graph:v5 sceneTaxonomy:v7];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__PGGraphIngestBusinessProcessor_requiredCriteriaByPOIIdentifierForGraph___block_invoke;
  v12[3] = &unk_1E68E6540;
  id v10 = v9;
  id v13 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];

  return v10;
}

void __74__PGGraphIngestBusinessProcessor_requiredCriteriaByPOIIdentifierForGraph___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = a3;
  uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v6 = [v5 poisTrait];
        v7 = [v6 nodes];

        if ([v7 count])
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          v18 = v7;
          v8 = [v7 labels];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v20 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * j);
                v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
                if (!v14)
                {
                  v14 = [MEMORY[0x1E4F1CA80] set];
                  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v13];
                }
                [v14 addObject:v5];
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v10);
          }

          v7 = v18;
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v17);
  }
}

- (id)_predominantVisitForMomentNode:(id)a3 publicEventBusinessItemMuid:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__16212;
  v38 = __Block_byref_object_dispose__16213;
  id v39 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__16212;
  v31 = __Block_byref_object_dispose__16213;
  id v32 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  BOOL v7 = *MEMORY[0x1E4F76C00] != a4;
  v8 = [(PGGraphBuilder *)self->_graphBuilder serviceManager];
  if (!v8) {
    __assert_rtn("-[PGGraphIngestBusinessProcessor _predominantVisitForMomentNode:publicEventBusinessItemMuid:]", "PGGraphIngestBusinessProcessor.m", 563, "serviceManager != nil");
  }
  uint64_t v9 = [v6 universalStartDate];
  uint64_t v10 = [v6 universalEndDate];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v10];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__PGGraphIngestBusinessProcessor__predominantVisitForMomentNode_publicEventBusinessItemMuid___block_invoke;
  v17[3] = &unk_1E68E6518;
  id v12 = v8;
  id v18 = v12;
  id v13 = v11;
  id v19 = v13;
  long long v20 = &v34;
  BOOL v25 = v7;
  long long v21 = v33;
  long long v22 = &v27;
  long long v23 = v26;
  unint64_t v24 = a4;
  [v6 enumeratePreciseAddressNodesUsingBlock:v17];
  v14 = (void *)v28[5];
  if (!v14) {
    v14 = (void *)v35[5];
  }
  id v15 = v14;

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v34, 8);

  return v15;
}

void __93__PGGraphIngestBusinessProcessor__predominantVisitForMomentNode_publicEventBusinessItemMuid___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [a2 location];
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) fetchLocationOfInterestVisitsAtLocation:v3 inDateInterval:*(void *)(a1 + 40)];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (!v5) {
      goto LABEL_20;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [v9 visitInterval];
        [v10 duration];
        double v12 = v11;

        uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v15 = *(void *)(v13 + 40);
        v14 = (id *)(v13 + 40);
        if (!v15 || v12 > *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
        {
          objc_storeStrong(v14, v9);
          *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v12;
        }
        if (*(unsigned char *)(a1 + 88))
        {
          uint64_t v16 = [v9 locationOfInterest];
          if ([v16 businessItemMuid] != *(void *)(a1 + 80))
          {

            continue;
          }
          if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
          {

LABEL_17:
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v9);
            *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v12;
            continue;
          }
          double v17 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);

          if (v12 > v17) {
            goto LABEL_17;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (!v6)
      {
LABEL_20:

        break;
      }
    }
  }
}

- (id)_businessItemContainersToEnrichForLowConfidenceDisambiguation:(id)a3 requiredCriteriaByPOIIdentifier:(id)a4 meaningfulEventProcessorCache:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [MEMORY[0x1E4F1CA80] set];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke;
  v46[3] = &unk_1E68ED8A8;
  id v12 = v11;
  id v47 = v12;
  [v8 enumeratePOINodesUsingBlock:v46];
  uint64_t v13 = [v8 name];
  if (PGIsAppleInternal_onceToken != -1) {
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8452);
  }
  int v14 = PGIsAppleInternal_isAppleInternal;
  if ([v12 count])
  {
    id v28 = v10;
    uint64_t v29 = v9;
    uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v16 = [(PGGraphBuilder *)self->_graphBuilder poiCache];
    double v17 = [(id)objc_opt_class() _spatialMapCategoriesByMeaningIdentifier];
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = __Block_byref_object_copy__16212;
    v42[4] = __Block_byref_object_dispose__16213;
    id v43 = 0;
    long long v18 = [(PGGraphBuilder *)self->_graphBuilder serviceManager];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_3;
    v30[3] = &unk_1E68E64F0;
    id v31 = v12;
    id v32 = v29;
    v40 = v42;
    id v33 = v8;
    id v34 = v10;
    id v19 = v18;
    id v35 = v19;
    id v20 = v17;
    id v36 = v20;
    id v21 = v16;
    id v37 = v21;
    id v22 = v15;
    id v38 = v22;
    char v41 = v14;
    id v39 = v13;
    [v33 enumerateConsolidatedAddressesUsingBlock:v30];
    uint64_t v23 = v39;
    id v24 = v22;

    _Block_object_dispose(v42, 8);
    id v10 = v28;
    id v9 = v29;
  }
  else
  {
    if (v14)
    {
      BOOL v25 = [MEMORY[0x1E4F1CA48] array];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_2;
      v44[3] = &unk_1E68E64A8;
      id v45 = v25;
      id v26 = v25;
      [v8 enumerateConsolidatedAddressesUsingBlock:v44];
    }
    id v24 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v24;
}

void __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 label];
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    v3 = v4;
  }
}

void __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  [a2 centerCoordinates];
  id v5 = [NSString stringWithFormat:@"{%.8f, %.8f}", v3, v4];
  [v2 addObject:v5];
}

void __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 duration];
  if (v4 >= 1800.0)
  {
    [v3 centerCoordinates];
    double v6 = v5;
    double v8 = v7;
    id v9 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    [MEMORY[0x1E4F76D58] defaultPrecision];
    double v11 = v10;
    id v12 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v13 = [v12 UUIDString];
    v57 = objc_msgSend(v9, "initWithCenter:radius:identifier:", v13, v6, v8, v11);

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    obuint64_t j = *(id *)(a1 + 32);
    uint64_t v53 = [obj countByEnumeratingWithState:&v73 objects:v84 count:16];
    if (v53)
    {
      uint64_t v52 = *(void *)v74;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v74 != v52) {
            objc_enumerationMutation(obj);
          }
          uint64_t v54 = v14;
          uint64_t v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*((void *)&v73 + 1) + 8 * v14)];
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v58 = v15;
          uint64_t v16 = [v58 countByEnumeratingWithState:&v69 objects:v83 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v70;
            uint64_t v55 = *(void *)v70;
            do
            {
              uint64_t v19 = 0;
              uint64_t v56 = v17;
              do
              {
                if (*(void *)v70 != v18) {
                  objc_enumerationMutation(v58);
                }
                id v20 = *(void **)(*((void *)&v69 + 1) + 8 * v19);
                id v21 = (void *)MEMORY[0x1D25FED50]();
                id v22 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
                if (!v22)
                {
                  uint64_t v23 = [[PGMeaningfulEventMatchingCriteria alloc] initWithMoment:*(void *)(a1 + 48) cache:*(void *)(a1 + 56) serviceManager:*(void *)(a1 + 64)];
                  uint64_t v24 = *(void *)(*(void *)(a1 + 104) + 8);
                  BOOL v25 = *(void **)(v24 + 40);
                  *(void *)(v24 + 40) = v23;

                  id v22 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
                }
                id v26 = [v22 matchingResultWithCriteria:v20];
                int v27 = [v26 isMatching];

                if (v27)
                {
                  id v28 = *(void **)(a1 + 72);
                  uint64_t v29 = [v20 identifier];
                  v30 = [v28 objectForKeyedSubscript:v29];

                  id v31 = [*(id *)(a1 + 80) businessItemsInRegion:v57 categories:v30 maximumDistance:50.0];
                  unint64_t v32 = [v31 count];
                  if (v32)
                  {
                    v61 = v21;
                    uint64_t v62 = v19;
                    v59 = v31;
                    v60 = v30;
                    if (v32 > 3)
                    {
                      v68[0] = MEMORY[0x1E4F143A8];
                      v68[1] = 3221225472;
                      v68[2] = __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_4;
                      v68[3] = &__block_descriptor_48_e45_q24__0__CLSBusinessItem_8__CLSBusinessItem_16l;
                      *(double *)&v68[4] = v6;
                      *(double *)&v68[5] = v8;
                      id v34 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 comparator:v68];
                      v82 = v34;
                      id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
                      id v36 = [v31 sortedArrayUsingDescriptors:v35];

                      id v37 = objc_msgSend(v36, "subarrayWithRange:", 0, 3);
                      id v33 = [MEMORY[0x1E4F1CAD0] setWithArray:v37];
                    }
                    else
                    {
                      id v33 = v31;
                    }
                    long long v66 = 0u;
                    long long v67 = 0u;
                    long long v64 = 0u;
                    long long v65 = 0u;
                    id v63 = v33;
                    uint64_t v38 = [v63 countByEnumeratingWithState:&v64 objects:v81 count:16];
                    if (v38)
                    {
                      uint64_t v39 = v38;
                      uint64_t v40 = *(void *)v65;
                      do
                      {
                        uint64_t v41 = 0;
                        do
                        {
                          if (*(void *)v65 != v40) {
                            objc_enumerationMutation(v63);
                          }
                          v42 = *(void **)(*((void *)&v64 + 1) + 8 * v41);
                          id v43 = (void *)MEMORY[0x1D25FED50]();
                          id v44 = objc_alloc(MEMORY[0x1E4F28C18]);
                          id v45 = [v3 startDate];
                          v46 = [v3 endDate];
                          id v47 = (void *)[v44 initWithStartDate:v45 endDate:v46];

                          v48 = [[PGGraphIngestBusinessItemContainer alloc] initWithBusinessItem:v42 dateInterval:v47];
                          [*(id *)(a1 + 88) addObject:v48];
                          if (*(unsigned char *)(a1 + 112) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
                          {
                            uint64_t v49 = *(void *)(a1 + 96);
                            uint64_t v50 = [v42 muid];
                            *(_DWORD *)buf = 138412546;
                            uint64_t v78 = v49;
                            __int16 v79 = 2048;
                            uint64_t v80 = v50;
                            _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[IngestBusiness] [%@] Matching constraints for business %lu.", buf, 0x16u);
                          }

                          ++v41;
                        }
                        while (v39 != v41);
                        uint64_t v39 = [v63 countByEnumeratingWithState:&v64 objects:v81 count:16];
                      }
                      while (v39);
                    }

                    uint64_t v18 = v55;
                    uint64_t v17 = v56;
                    id v21 = v61;
                    uint64_t v19 = v62;
                    id v31 = v59;
                    v30 = v60;
                  }
                }
                ++v19;
              }
              while (v19 != v17);
              uint64_t v17 = [v58 countByEnumeratingWithState:&v69 objects:v83 count:16];
            }
            while (v17);
          }

          uint64_t v14 = v54 + 1;
        }
        while (v54 + 1 != v53);
        uint64_t v53 = [obj countByEnumeratingWithState:&v73 objects:v84 count:16];
      }
      while (v53);
    }
  }
}

uint64_t __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  double v6 = [v4 region];
  [v6 center];
  uint64_t v21 = v7;
  uint64_t v22 = v8;

  id v9 = [v5 region];
  [v9 center];
  uint64_t v19 = v10;
  uint64_t v20 = v11;

  CLLocationCoordinate2DGetDistanceFrom();
  double v13 = v12;
  CLLocationCoordinate2DGetDistanceFrom();
  if (v13 <= v14)
  {
    if (v13 < v14)
    {
      uint64_t v15 = -1;
    }
    else
    {
      uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid", v19, v20, v21, v22));
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "muid"));
      uint64_t v15 = [v16 compare:v17];
    }
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

- (BOOL)_momentNode:(id)a3 hasValidConstraintsForLocationOfInterestVisit:(id)a4 requiredCriteriaByPOIIdentifier:(id)a5 meaningfulEventProcessorCache:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = [v11 locationOfInterest];
  uint64_t v15 = [v14 businessItemMuid];
  uint64_t v16 = [v10 name];
  if (v15 != *MEMORY[0x1E4F76C00])
  {
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x2020000000;
    char v41 = 0;
    uint64_t v18 = [v11 visitInterval];
    [v18 duration];
    double v20 = v19;

    if (v20 >= 3600.0)
    {
      [v11 confidence];
      if (v22 >= 0.6)
      {
        BOOL v17 = 1;
        *((unsigned char *)v39 + 24) = 1;
        goto LABEL_10;
      }
    }
    else if (v20 < 1800.0)
    {
      uint64_t v34 = 0;
      id v35 = &v34;
      uint64_t v36 = 0x2020000000;
      char v37 = 0;
      v33[0] = 0;
      v33[1] = v33;
      v33[2] = 0x2020000000;
      v33[3] = 0;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __154__PGGraphIngestBusinessProcessor__momentNode_hasValidConstraintsForLocationOfInterestVisit_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke;
      v32[3] = &unk_1E68E6458;
      v32[4] = v33;
      v32[5] = &v34;
      [v10 enumerateConsolidatedAddressesUsingBlock:v32];
      int v21 = *((unsigned __int8 *)v35 + 24);
      _Block_object_dispose(v33, 8);
      _Block_object_dispose(&v34, 8);
      if (!v21)
      {
        BOOL v17 = 0;
LABEL_10:
        _Block_object_dispose(&v38, 8);
        goto LABEL_11;
      }
    }
    uint64_t v23 = [(PGGraphBuilder *)self->_graphBuilder serviceManager];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __154__PGGraphIngestBusinessProcessor__momentNode_hasValidConstraintsForLocationOfInterestVisit_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_2;
    v26[3] = &unk_1E68E6480;
    id v27 = v12;
    id v28 = v10;
    id v29 = v13;
    id v24 = v23;
    id v30 = v24;
    id v31 = &v38;
    [v28 enumeratePOINodesUsingBlock:v26];

    BOOL v17 = *((unsigned char *)v39 + 24) != 0;
    goto LABEL_10;
  }
  BOOL v17 = 0;
LABEL_11:

  return v17;
}

uint64_t __154__PGGraphIngestBusinessProcessor__momentNode_hasValidConstraintsForLocationOfInterestVisit_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 duration];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 1800.0;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

void __154__PGGraphIngestBusinessProcessor__momentNode_hasValidConstraintsForLocationOfInterestVisit_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)a1[4];
  uint64_t v6 = [a2 label];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
      double v14 = [PGMeaningfulEventMatchingCriteria alloc];
      uint64_t v15 = -[PGMeaningfulEventMatchingCriteria initWithMoment:cache:serviceManager:](v14, "initWithMoment:cache:serviceManager:", a1[5], a1[6], a1[7], (void)v17);
      uint64_t v16 = [(PGMeaningfulEventMatchingCriteria *)v15 matchingResultWithCriteria:v13];
      *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = [v16 isMatching];

      LODWORD(v16) = *(unsigned __int8 *)(*(void *)(a1[8] + 8) + 24);
      if (v16) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  *a3 = *(unsigned char *)(*(void *)(a1[8] + 8) + 24);
}

- (void)_insertBusinessItemsFromMomentNodes:(id)a3 graph:(id)a4 withLocationOfInterestVisitsToResolveByMomentUUID:(id)a5 requiredCriteriaByPOIIdentifier:(id)a6 progressBlock:(id)a7
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v44 = a4;
  id v45 = a5;
  id v46 = a6;
  id v12 = a7;
  id v47 = v11;
  if ([v11 count])
  {
    uint64_t v93 = 0;
    v94 = (double *)&v93;
    uint64_t v95 = 0x2020000000;
    uint64_t v96 = 0x3FE0000000000000;
    id v41 = v12;
    v48 = (void (**)(void *, uint8_t *, double))_Block_copy(v12);
    uint64_t v89 = 0;
    v90 = &v89;
    uint64_t v91 = 0x2020000000;
    char v92 = 0;
    uint64_t v85 = 0;
    v86 = (double *)&v85;
    uint64_t v87 = 0x2020000000;
    uint64_t v88 = 0;
    if (v48)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v86[3] >= 0.01)
      {
        v86[3] = Current;
        v99[0] = 0;
        v48[2](v48, v99, v94[3]);
        char v14 = *((unsigned char *)v90 + 24) | v99[0];
        *((unsigned char *)v90 + 24) = v14;
        if (v14)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&uint8_t buf[4] = 262;
            LOWORD(v104) = 2080;
            *(void *)((char *)&v104 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestBusinessProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_37;
        }
      }
    }
    uint64_t v15 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    unint64_t v17 = [v11 count];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __172__PGGraphIngestBusinessProcessor__insertBusinessItemsFromMomentNodes_graph_withLocationOfInterestVisitsToResolveByMomentUUID_requiredCriteriaByPOIIdentifier_progressBlock___block_invoke;
    aBlock[3] = &unk_1E68E6408;
    id v43 = v15;
    id v83 = v43;
    id v42 = v16;
    id v84 = v42;
    long long v18 = _Block_copy(aBlock);
    *(void *)buf = 0;
    *(void *)&long long v104 = buf;
    *((void *)&v104 + 1) = 0x3032000000;
    v105 = __Block_byref_object_copy__16212;
    v106 = __Block_byref_object_dispose__16213;
    v107 = [[PGMeaningfulEventProcessorCache alloc] initWithMomentNodes:v11];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __172__PGGraphIngestBusinessProcessor__insertBusinessItemsFromMomentNodes_graph_withLocationOfInterestVisitsToResolveByMomentUUID_requiredCriteriaByPOIIdentifier_progressBlock___block_invoke_2;
    v70[3] = &unk_1E68E6430;
    id v71 = v45;
    long long v72 = self;
    id v73 = v46;
    long long v76 = buf;
    id v39 = v18;
    id v74 = v39;
    uint64_t v40 = v48;
    long long v75 = v40;
    v77 = &v85;
    uint64_t v80 = 0x3F847AE147AE147BLL;
    uint64_t v78 = &v93;
    __int16 v79 = &v89;
    double v81 = 0.2 / (double)v17;
    [v11 enumerateNodesUsingBlock:v70];
    if ([v43 count])
    {
      businessCacheUpdater = self->_businessCacheUpdater;
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __172__PGGraphIngestBusinessProcessor__insertBusinessItemsFromMomentNodes_graph_withLocationOfInterestVisitsToResolveByMomentUUID_requiredCriteriaByPOIIdentifier_progressBlock___block_invoke_338;
      v64[3] = &unk_1E68F0380;
      long long v20 = v40;
      long long v65 = v20;
      long long v66 = &v85;
      long long v69 = xmmword_1D1F4F190;
      long long v67 = &v93;
      v68 = &v89;
      int v21 = -[CLSBusinessCacheUpdater enrichedBusinessItemsByMuidsForBusinessItems:progressBlock:](businessCacheUpdater, "enrichedBusinessItemsByMuidsForBusinessItems:progressBlock:", v42, v64, v39);
      v94[3] = v94[3] + 0.2;
      if (v48)
      {
        double v22 = CFAbsoluteTimeGetCurrent();
        if (v22 - v86[3] >= 0.01)
        {
          v86[3] = v22;
          char v63 = 0;
          v20[2](v20, (uint8_t *)&v63, v94[3]);
          char v23 = *((unsigned char *)v90 + 24) | v63;
          *((unsigned char *)v90 + 24) = v23;
          if (v23)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v99 = 67109378;
              int v100 = 331;
              __int16 v101 = 2080;
              v102 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/G"
                     "raph/Ingest/Ingest Processing/PGGraphIngestBusinessProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v99, 0x12u);
            }

LABEL_36:
            _Block_object_dispose(buf, 8);

LABEL_37:
            _Block_object_dispose(&v85, 8);
            _Block_object_dispose(&v89, 8);

            _Block_object_dispose(&v93, 8);
            id v12 = v41;
            goto LABEL_38;
          }
        }
      }
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      obuint64_t j = v43;
      uint64_t v24 = [obj countByEnumeratingWithState:&v59 objects:v98 count:16];
      if (v24)
      {
        uint64_t v49 = *(void *)v60;
        do
        {
          uint64_t v25 = 0;
          uint64_t v50 = v24;
          do
          {
            if (*(void *)v60 != v49) {
              objc_enumerationMutation(obj);
            }
            uint64_t v53 = v25;
            uint64_t v26 = *(void *)(*((void *)&v59 + 1) + 8 * v25);
            context = (void *)MEMORY[0x1D25FED50]();
            id v27 = [obj objectForKey:v26];
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            id v28 = v27;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v97 count:16];
            if (v29)
            {
              uint64_t v30 = *(void *)v56;
              do
              {
                for (uint64_t i = 0; i != v29; ++i)
                {
                  if (*(void *)v56 != v30) {
                    objc_enumerationMutation(v28);
                  }
                  unint64_t v32 = *(void **)(*((void *)&v55 + 1) + 8 * i);
                  id v33 = [v32 businessItem];
                  uint64_t v34 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v33, "muid"));
                  id v35 = [v21 objectForKeyedSubscript:v34];

                  if (v35)
                  {
                    [v32 updateBusinessItem:v35];
                    id v36 = [(PGGraphBuilder *)self->_graphBuilder insertBusiness:v32 fromMomentNode:v26];
                  }
                }
                uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v97 count:16];
              }
              while (v29);
            }

            uint64_t v25 = v53 + 1;
          }
          while (v53 + 1 != v50);
          uint64_t v24 = [obj countByEnumeratingWithState:&v59 objects:v98 count:16];
        }
        while (v24);
      }
    }
    if (v48)
    {
      double v37 = CFAbsoluteTimeGetCurrent();
      if (v37 - v86[3] >= 0.01)
      {
        v86[3] = v37;
        char v63 = 0;
        v40[2](v40, (uint8_t *)&v63, 1.0);
        char v38 = *((unsigned char *)v90 + 24) | v63;
        *((unsigned char *)v90 + 24) = v38;
        if (v38)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v99 = 67109378;
            int v100 = 348;
            __int16 v101 = 2080;
            v102 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/Ingest Processing/PGGraphIngestBusinessProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v99, 0x12u);
          }
        }
      }
    }
    goto LABEL_36;
  }
LABEL_38:
}

void __172__PGGraphIngestBusinessProcessor__insertBusinessItemsFromMomentNodes_graph_withLocationOfInterestVisitsToResolveByMomentUUID_requiredCriteriaByPOIIdentifier_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 objectForKey:v10];
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    [*(id *)(a1 + 32) setObject:v7 forKey:v10];
  }
  [v7 addObject:v6];
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = [v6 businessItem];

  [v8 addObject:v9];
}

void __172__PGGraphIngestBusinessProcessor__insertBusinessItemsFromMomentNodes_graph_withLocationOfInterestVisitsToResolveByMomentUUID_requiredCriteriaByPOIIdentifier_progressBlock___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1D25FED50]();
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [v5 uuid];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (![v9 count])
  {
    id v10 = [*(id *)(a1 + 40) _businessItemContainersToEnrichForLowConfidenceDisambiguation:v5 requiredCriteriaByPOIIdentifier:*(void *)(a1 + 48) meaningfulEventProcessorCache:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v22 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v10);
          }
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
        uint64_t v23 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v23);
    }
    goto LABEL_26;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v29 = v9;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (!v11) {
    goto LABEL_18;
  }
  uint64_t v12 = v11;
  id v28 = v6;
  uint64_t v13 = *(void *)v35;
  do
  {
    for (uint64_t j = 0; j != v12; ++j)
    {
      if (*(void *)v35 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * j);
      if (_os_feature_enabled_impl())
      {
        [v15 confidence];
        if (v16 >= 0.6)
        {
          unint64_t v17 = +[PGLogging sharedLogging];
          long long v18 = [v17 loggingConnection];

          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            uint64_t v40 = v15;
            _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_DEFAULT, "[IngestBusiness] Not using constraint validation for visit:%{private}@", buf, 0xCu);
          }

LABEL_14:
          id v19 = objc_alloc_init(MEMORY[0x1E4F76C58]);
          long long v20 = [v15 locationOfInterest];
          objc_msgSend(v19, "setMuid:", objc_msgSend(v20, "businessItemMuid"));

          int v21 = [[PGGraphIngestBusinessItemContainer alloc] initWithBusinessItem:v19 visit:v15];
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

          continue;
        }
      }
      if ([*(id *)(a1 + 40) _momentNode:v5 hasValidConstraintsForLocationOfInterestVisit:v15 requiredCriteriaByPOIIdentifier:*(void *)(a1 + 48) meaningfulEventProcessorCache:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)])goto LABEL_14; {
    }
      }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v41 count:16];
  }
  while (v12);
  id v6 = v28;
LABEL_18:
  uint64_t v9 = v29;
LABEL_26:

  if (*(void *)(a1 + 64)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v27 = *(void *)(*(void *)(a1 + 80) + 8),
        Current - *(double *)(v27 + 24) >= *(double *)(a1 + 104))
    && (*(double *)(v27 + 24) = Current,
        buf[0] = 0,
        (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) |= buf[0]) != 0))
  {
    *a3 = 1;
  }
  else
  {
    *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(double *)(a1 + 112)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                            + 24);
  }
}

void __172__PGGraphIngestBusinessProcessor__insertBusinessItemsFromMomentNodes_graph_withLocationOfInterestVisitsToResolveByMomentUUID_requiredCriteriaByPOIIdentifier_progressBlock___block_invoke_338(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                               + 24) + *(double *)(a1 + 72) * a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)_insertBusinessItemsForMomentNodesToResolvedBusinessItems:(id)a3 graph:(id)a4 progressBlock:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _Block_copy(v10);
  uint64_t v52 = 0;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = (double *)&v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = 0;
  if (v11
    && (double v12 = CFAbsoluteTimeGetCurrent(), v12 - v49[3] >= 0.01)
    && (v49[3] = v12,
        LOBYTE(v39) = 0,
        (*((void (**)(void *, uint64_t *, double))v11 + 2))(v11, &v39, 0.0),
        char v13 = *((unsigned char *)v53 + 24) | v39,
        (*((unsigned char *)v53 + 24) = v13) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = 186;
      LOWORD(v61) = 2080;
      *(void *)((char *)&v61 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestBusinessProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    char v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = [v8 allKeys];
    double v16 = [v14 setWithArray:v15];

    *(void *)buf = 0;
    *(void *)&long long v61 = buf;
    *((void *)&v61 + 1) = 0x3032000000;
    long long v62 = __Block_byref_object_copy__16212;
    char v63 = __Block_byref_object_dispose__16213;
    businessCacheUpdater = self->_businessCacheUpdater;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __112__PGGraphIngestBusinessProcessor__insertBusinessItemsForMomentNodesToResolvedBusinessItems_graph_progressBlock___block_invoke;
    v43[3] = &unk_1E68F0420;
    id v18 = v11;
    id v44 = v18;
    id v45 = &v48;
    long long v47 = xmmword_1D1F4F1A0;
    id v46 = &v52;
    id v64 = [(CLSBusinessCacheUpdater *)businessCacheUpdater enrichedBusinessItemsByMuidsForMuids:v16 progressBlock:v43];
    uint64_t v39 = 0;
    uint64_t v40 = (double *)&v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v42 = 0x3FDCCCCCCCCCCCCDLL;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    double v38 = 0.0;
    double v38 = 0.05 / (double)(unint64_t)[v8 count];
    if (v11
      && (double v19 = CFAbsoluteTimeGetCurrent(), v19 - v49[3] >= 0.01)
      && (v49[3] = v19,
          char v36 = 0,
          (*((void (**)(id, char *, double))v18 + 2))(v18, &v36, v40[3]),
          char v20 = *((unsigned char *)v53 + 24) | v36,
          (*((unsigned char *)v53 + 24) = v20) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long v56 = 67109378;
        int v57 = 198;
        __int16 v58 = 2080;
        long long v59 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/In"
              "gest/Ingest Processing/PGGraphIngestBusinessProcessor.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v56, 0x12u);
      }
    }
    else
    {
      int v21 = [(PGGraphBuilder *)self->_graphBuilder publicEventManager];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __112__PGGraphIngestBusinessProcessor__insertBusinessItemsForMomentNodesToResolvedBusinessItems_graph_progressBlock___block_invoke_325;
      v26[3] = &unk_1E68E63E0;
      long long v30 = buf;
      id v22 = v21;
      id v27 = v22;
      id v28 = self;
      long long v31 = &v39;
      long long v32 = v37;
      id v23 = v18;
      id v29 = v23;
      long long v33 = &v48;
      long long v34 = &v52;
      uint64_t v35 = 0x3F847AE147AE147BLL;
      [v8 enumerateKeysAndObjectsUsingBlock:v26];
      if (v11)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v49[3] >= 0.01)
        {
          v49[3] = Current;
          char v36 = 0;
          (*((void (**)(id, char *, double))v23 + 2))(v23, &v36, 0.5);
          char v25 = *((unsigned char *)v53 + 24) | v36;
          *((unsigned char *)v53 + 24) = v25;
          if (v25)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long v56 = 67109378;
              int v57 = 245;
              __int16 v58 = 2080;
              long long v59 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/Ingest/Ingest Processing/PGGraphIngestBusinessProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v56, 0x12u);
            }
          }
        }
      }
    }
    _Block_object_dispose(v37, 8);
    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(buf, 8);
  }
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
}

void __112__PGGraphIngestBusinessProcessor__insertBusinessItemsForMomentNodesToResolvedBusinessItems_graph_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 64) * a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __112__PGGraphIngestBusinessProcessor__insertBusinessItemsForMomentNodesToResolvedBusinessItems_graph_progressBlock___block_invoke_325(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v26 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKeyedSubscript:a2];
  if (v26)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v22 = v6;
    obuint64_t j = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v25 = *(void *)v33;
      uint64_t v24 = *MEMORY[0x1E4F76C00];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v11 = [v10 publicEventNode];
          double v12 = objc_msgSend(*(id *)(a1 + 32), "cachedPublicEventsForMuid:", objc_msgSend(v11, "muid"));
          char v13 = [v12 anyObject];
          char v14 = v13;
          uint64_t v15 = v24;
          if (v13) {
            uint64_t v15 = [v13 businessItemMuid];
          }
          double v16 = [v11 collection];
          unint64_t v17 = [v16 momentNodes];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __112__PGGraphIngestBusinessProcessor__insertBusinessItemsForMomentNodesToResolvedBusinessItems_graph_progressBlock___block_invoke_2;
          v27[3] = &unk_1E68E63B8;
          v27[4] = *(void *)(a1 + 40);
          uint64_t v31 = v15;
          id v28 = v26;
          id v29 = v10;
          id v30 = v11;
          id v18 = v11;
          [v17 enumerateNodesUsingBlock:v27];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v8);
    }

    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                            + 24)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
    id v6 = v22;
    if (*(void *)(a1 + 48))
    {
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v20 = *(void *)(*(void *)(a1 + 80) + 8);
      if (Current - *(double *)(v20 + 24) >= *(double *)(a1 + 96))
      {
        *(double *)(v20 + 24) = Current;
        (*(void (**)(double))(*(void *)(a1 + 48) + 16))(*(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                 + 24));
        *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                              + 24);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
          *a4 = 1;
        }
      }
    }
  }
}

void __112__PGGraphIngestBusinessProcessor__insertBusinessItemsForMomentNodesToResolvedBusinessItems_graph_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 64);
  id v5 = a2;
  id v13 = [v3 _predominantVisitForMomentNode:v5 publicEventBusinessItemMuid:v4];
  if (v13)
  {
    id v6 = [[PGGraphIngestBusinessItemContainer alloc] initWithBusinessItem:*(void *)(a1 + 40) visit:v13];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 48) consolidatedAddress];
    uint64_t v8 = [v7 startDate];
    id v9 = [v7 endDate];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v9];
    id v6 = [[PGGraphIngestBusinessItemContainer alloc] initWithBusinessItem:*(void *)(a1 + 40) dateInterval:v10];
  }
  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 8) insertBusiness:v6 fromMomentNode:v5];

  id v12 = (id)[*(id *)(*(void *)(a1 + 32) + 8) connectPublicEventNode:*(void *)(a1 + 56) withBusinessNode:v11];
}

- (void)deleteBusinessCategoryNodesWithNoEdges:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PGGraphNodeCollection nodesInGraph:v4];
  id v6 = [v5 categories];
  uint64_t v7 = +[PGGraphBusinessCategoryNode filterWithCategories:v6];
  [v7 setWhereNoInAndOutEdges:1];
  uint64_t v8 = [v4 nodeIdentifiersMatchingFilter:v7];
  id v9 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134217984;
    uint64_t v12 = [v8 count];
    _os_log_debug_impl(&dword_1D1805000, v9, OS_LOG_TYPE_DEBUG, "[IngestBusiness] Deleted %lu business category nodes from the graph", (uint8_t *)&v11, 0xCu);
  }

  id v10 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  [v10 removeNodesForIdentifiers:v8];
  [v4 executeGraphChangeRequest:v10];
}

- (void)deleteBusinessNodesWithNoInEdgesInGraph:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PGGraphBusinessNode filter];
  [v5 setWhereNoInEdges:1];
  id v6 = [v4 nodeIdentifiersMatchingFilter:v5];
  uint64_t v7 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134217984;
    uint64_t v10 = [v6 count];
    _os_log_debug_impl(&dword_1D1805000, v7, OS_LOG_TYPE_DEBUG, "[IngestBusiness] Deleted %lu business item nodes from the graph", (uint8_t *)&v9, 0xCu);
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  [v8 removeNodesForIdentifiers:v6];
  [v4 executeGraphChangeRequest:v8];
}

- (void)deleteBusinessEdgesWithMomentNodes:(id)a3 inGraph:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v6 = a4;
  id v7 = a3;
  id v10 = objc_alloc_init(v5);
  id v8 = [v7 businessNodes];
  int v9 = +[PGGraphEdgeCollection edgesFromNodes:v7 toNodes:v8];

  [v10 removeEdges:v9];
  [v6 executeGraphChangeRequest:v10];
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v29 = a4;
  id v7 = [(PGGraphBuilder *)self->_graphBuilder graph];
  id v8 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  id v10 = v8;
  uint64_t v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGGraphIngestBusinessProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v13 = mach_absolute_time();
  char v14 = objc_msgSend(v6, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v7, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);
  [(PGGraphIngestBusinessProcessor *)self deleteBusinessEdgesWithMomentNodes:v14 inGraph:v7];
  uint64_t v15 = [v6 registeredResolvableItemsByBusinessItemMuid];
  if ([v15 count]) {
    [(PGGraphIngestBusinessProcessor *)self _insertBusinessItemsForMomentNodesToResolvedBusinessItems:v15 graph:v7 progressBlock:v29];
  }
  if ([v14 count])
  {
    double v16 = [v6 registeredLocationOfInterestVisitsToResolveByMomentUUID];
    [(PGGraphIngestBusinessProcessor *)self requiredCriteriaByPOIIdentifierForGraph:v7];
    id v28 = v11;
    unint64_t v17 = v15;
    unint64_t v18 = v9 - 1;
    id v19 = v6;
    os_signpost_id_t v20 = v9;
    v22 = uint64_t v21 = v13;
    [(PGGraphIngestBusinessProcessor *)self _insertBusinessItemsFromMomentNodes:v14 graph:v7 withLocationOfInterestVisitsToResolveByMomentUUID:v16 requiredCriteriaByPOIIdentifier:v22 progressBlock:v29];

    uint64_t v13 = v21;
    os_signpost_id_t v9 = v20;
    id v6 = v19;
    unint64_t v12 = v18;
    uint64_t v15 = v17;
    uint64_t v11 = v28;
  }
  [(PGGraphIngestBusinessProcessor *)self deleteBusinessNodesWithNoInEdgesInGraph:v7];
  [(PGGraphIngestBusinessProcessor *)self deleteBusinessCategoryNodesWithNoEdges:v7];
  uint64_t v23 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v26 = v11;
  id v27 = v26;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v27, OS_SIGNPOST_INTERVAL_END, v9, "PGGraphIngestBusinessProcessor", "", buf, 2u);
  }

  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v32 = "PGGraphIngestBusinessProcessor";
    __int16 v33 = 2048;
    double v34 = (float)((float)((float)((float)(v23 - v13) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3 = a3;
  if (([v3 isResumingFullAnalysis] & 1) != 0
    || ([v3 hasMomentsToInsert] & 1) != 0
    || ([v3 hasMomentsToDelete] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v6 = [v3 momentUpdateTypes];
    BOOL v4 = ([(id)objc_opt_class() requiredMomentUpdateTypes] & v6) != 0;
  }

  return v4;
}

- (PGGraphIngestBusinessProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGGraphIngestBusinessProcessor;
  uint64_t v6 = [(PGGraphIngestBusinessProcessor *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F76C50]);
    os_signpost_id_t v9 = [v5 poiCache];
    uint64_t v10 = [v8 initWithBusinessCategoryCache:v9];
    businessCacheUpdater = v7->_businessCacheUpdater;
    v7->_businessCacheUpdater = (CLSBusinessCacheUpdater *)v10;
  }
  return v7;
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 6;
}

+ (id)_spatialMapCategoriesByMeaningIdentifier
{
  if (_spatialMapCategoriesByMeaningIdentifier_onceToken != -1) {
    dispatch_once(&_spatialMapCategoriesByMeaningIdentifier_onceToken, &__block_literal_global_16274);
  }
  v2 = (void *)_spatialMapCategoriesByMeaningIdentifier_spatialMapCategoriesByMeaningIdentifier;
  return v2;
}

void __74__PGGraphIngestBusinessProcessor__spatialMapCategoriesByMeaningIdentifier__block_invoke()
{
  v3[12] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Performance";
  v2[1] = @"Concert";
  v3[0] = &unk_1F28D3BB8;
  v3[1] = &unk_1F28D3BD0;
  v2[2] = @"SportEvent";
  v2[3] = @"Lunch";
  v3[2] = &unk_1F28D3BE8;
  v3[3] = &unk_1F28D3C00;
  v2[4] = @"Dinner";
  v2[5] = @"Breakfast";
  v3[4] = &unk_1F28D3C18;
  v3[5] = &unk_1F28D3C30;
  v2[6] = @"NightOut";
  v2[7] = @"Entertainment";
  v3[6] = &unk_1F28D3C48;
  v3[7] = &unk_1F28D3C60;
  v2[8] = @"AmusementPark";
  v2[9] = @"Museum";
  v3[8] = &unk_1F28D3C78;
  v3[9] = &unk_1F28D3C90;
  v2[10] = @"Diving";
  v2[11] = @"Hiking";
  v3[10] = &unk_1F28D3CA8;
  v3[11] = &unk_1F28D3CC0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:12];
  v1 = (void *)_spatialMapCategoriesByMeaningIdentifier_spatialMapCategoriesByMeaningIdentifier;
  _spatialMapCategoriesByMeaningIdentifier_spatialMapCategoriesByMeaningIdentifier = v0;
}

@end