@interface PGGraphIngestMeaningfulEventsProcessor
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestMeaningfulEventsProcessor)initWithGraphBuilder:(id)a3;
- (id)_removeInvalidMeaningEdgesWithDomain:(unsigned __int16)a3 momentNode:(id)a4 validMeaningLabels:(id)a5 legacyMeaningLabels:(id)a6;
- (id)meaningfulEventMatchingResultsForMomentNode:(id)a3 withRequiredMeaningfulEventCriteriaByIdentifier:(id)a4 andMeaningfulEventProcessorCache:(id)a5;
- (void)_updateMeaningsOfMomentNode:(id)a3 graph:(id)a4 withValidMeaningLabels:(id)a5 legacyLabels:(id)a6;
- (void)processMeaningfulEventsWithMomentNodes:(id)a3 graph:(id)a4 progressBlock:(id)a5;
- (void)processMeaningfulEventsWithMomentNodes:(id)a3 graph:(id)a4 requiredMeaningfulEventCriteriaByIdentifier:(id)a5 progressBlock:(id)a6;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
- (void)updateMeaningsOfMomentNode:(id)a3 graph:(id)a4 affectedMeaningLabels:(id)a5 withMatchedResults:(id)a6;
@end

@implementation PGGraphIngestMeaningfulEventsProcessor

- (void).cxx_destruct
{
}

- (id)_removeInvalidMeaningEdgesWithDomain:(unsigned __int16)a3 momentNode:(id)a4 validMeaningLabels:(id)a5 legacyMeaningLabels:(id)a6
{
  uint64_t v8 = a3;
  id v9 = a5;
  id v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v12 = a4;
  id v13 = objc_alloc_init(v11);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __129__PGGraphIngestMeaningfulEventsProcessor__removeInvalidMeaningEdgesWithDomain_momentNode_validMeaningLabels_legacyMeaningLabels___block_invoke;
  v20[3] = &unk_1E68EAE60;
  id v21 = v9;
  id v22 = v10;
  id v14 = v13;
  id v23 = v14;
  id v15 = v10;
  id v16 = v9;
  [v12 enumerateMeaningEdgesAndNodesWithDomain:v8 block:v20];

  v17 = v23;
  id v18 = v14;

  return v18;
}

void __129__PGGraphIngestMeaningfulEventsProcessor__removeInvalidMeaningEdgesWithDomain_momentNode_validMeaningLabels_legacyMeaningLabels___block_invoke(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  v5 = [a3 label];
  if (([a1[4] containsObject:v5] & 1) == 0 && objc_msgSend(a1[5], "containsObject:", v5)) {
    [a1[6] addObject:v6];
  }
}

- (void)_updateMeaningsOfMomentNode:(id)a3 graph:(id)a4 withValidMeaningLabels:(id)a5 legacyLabels:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v12);
        }
        [(PGGraphBuilder *)self->_graphBuilder addMeaningToMeaningfulEventNode:v10 meaningLabel:*(void *)(*((void *)&v22 + 1) + 8 * v17++) meaningIsReliable:1];
      }
      while (v15 != v17);
      uint64_t v15 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }
  id v18 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
  v19 = [(PGGraphIngestMeaningfulEventsProcessor *)self _removeInvalidMeaningEdgesWithDomain:700 momentNode:v10 validMeaningLabels:v18 legacyMeaningLabels:v13];

  v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
  id v21 = [(PGGraphIngestMeaningfulEventsProcessor *)self _removeInvalidMeaningEdgesWithDomain:702 momentNode:v10 validMeaningLabels:v20 legacyMeaningLabels:v13];

  [v19 unionSet:v21];
  [v11 legacyRemoveEdges:v19];
}

- (void)updateMeaningsOfMomentNode:(id)a3 graph:(id)a4 affectedMeaningLabels:(id)a5 withMatchedResults:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v24 = a4;
  id v23 = a5;
  id v11 = a6;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "requiredCriteria", v23);
        v20 = [v19 meaningNodeLabel];

        -[PGGraphBuilder addMeaningToMeaningfulEventNode:meaningLabel:meaningIsReliable:](self->_graphBuilder, "addMeaningToMeaningfulEventNode:meaningLabel:meaningIsReliable:", v10, v20, [v18 isReliable]);
        [v12 addObject:v20];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }

  id v21 = [(PGGraphIngestMeaningfulEventsProcessor *)self _removeInvalidMeaningEdgesWithDomain:700 momentNode:v10 validMeaningLabels:v12 legacyMeaningLabels:v23];
  long long v22 = [(PGGraphIngestMeaningfulEventsProcessor *)self _removeInvalidMeaningEdgesWithDomain:702 momentNode:v10 validMeaningLabels:v12 legacyMeaningLabels:v23];
  [v21 unionSet:v22];
  [v24 legacyRemoveEdges:v21];
}

- (id)meaningfulEventMatchingResultsForMomentNode:(id)a3 withRequiredMeaningfulEventCriteriaByIdentifier:(id)a4 andMeaningfulEventProcessorCache:(id)a5
{
  graphBuilder = self->_graphBuilder;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PGGraphBuilder *)graphBuilder serviceManager];
  id v12 = +[PGMeaningfulEventProcessor processRequiredCriteria:v9 forMoment:v10 meaningfulEventProcessorCache:v8 serviceManager:v11];

  return v12;
}

- (void)processMeaningfulEventsWithMomentNodes:(id)a3 graph:(id)a4 requiredMeaningfulEventCriteriaByIdentifier:(id)a5 progressBlock:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = _Block_copy(v13);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v37 = 0;
  v38 = (double *)&v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  if (v14
    && (double v15 = CFAbsoluteTimeGetCurrent(), v15 - v38[3] >= 0.01)
    && (v38[3] = v15,
        LOBYTE(v34[0]) = 0,
        (*((void (**)(void *, void *, double))v14 + 2))(v14, v34, 0.0),
        char v16 = *((unsigned char *)v42 + 24) | LOBYTE(v34[0]),
        (*((unsigned char *)v42 + 24) = v16) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 0x5304000202;
      LOWORD(v49) = 2080;
      *(void *)((char *)&v49 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMeaningfulEventsProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    uint64_t buf = 0;
    *(void *)&long long v49 = &buf;
    *((void *)&v49 + 1) = 0x3032000000;
    v50 = __Block_byref_object_copy__48805;
    v51 = __Block_byref_object_dispose__48806;
    id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    id v18 = [v12 allKeys];
    id v52 = (id)[v17 initWithArray:v18];

    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v36[3] = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__48805;
    v34[4] = __Block_byref_object_dispose__48806;
    v35 = [[PGMeaningfulEventProcessorCache alloc] initWithMomentNodes:v10];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __145__PGGraphIngestMeaningfulEventsProcessor_processMeaningfulEventsWithMomentNodes_graph_requiredMeaningfulEventCriteriaByIdentifier_progressBlock___block_invoke;
    v23[3] = &unk_1E68EAE38;
    v23[4] = self;
    id v24 = v12;
    long long v28 = v34;
    id v25 = v11;
    p_uint64_t buf = &buf;
    uint64_t v30 = v36;
    id v26 = v10;
    id v19 = v14;
    id v27 = v19;
    v31 = &v37;
    v32 = &v41;
    uint64_t v33 = 0x3F847AE147AE147BLL;
    [v26 enumerateNodesUsingBlock:v23];
    if (v14)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v38[3] >= 0.01)
      {
        v38[3] = Current;
        char v22 = 0;
        (*((void (**)(id, char *, double))v19 + 2))(v19, &v22, 1.0);
        char v21 = *((unsigned char *)v42 + 24) | v22;
        *((unsigned char *)v42 + 24) = v21;
        if (v21)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            v45[0] = 67109378;
            v45[1] = 105;
            __int16 v46 = 2080;
            v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Ingest/Ingest Processing/PGGraphIngestMeaningfulEventsProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v45, 0x12u);
          }
        }
      }
    }

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v36, 8);
    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
}

void __145__PGGraphIngestMeaningfulEventsProcessor_processMeaningfulEventsWithMomentNodes_graph_requiredMeaningfulEventCriteriaByIdentifier_progressBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1D25FED50]();
  v7 = [*(id *)(a1 + 32) meaningfulEventMatchingResultsForMomentNode:v5 withRequiredMeaningfulEventCriteriaByIdentifier:*(void *)(a1 + 40) andMeaningfulEventProcessorCache:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  [*(id *)(a1 + 32) updateMeaningsOfMomentNode:v5 graph:*(void *)(a1 + 48) affectedMeaningLabels:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) withMatchedResults:v7];
  [*(id *)(*(void *)(a1 + 32) + 8) upsertPeopleEventEdgesOfMomentNode:v5 matchingResults:v7];
  unint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  uint64_t v9 = [*(id *)(a1 + 56) count];
  if (*(void *)(a1 + 64)
    && (unint64_t v10 = v9,
        double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v12 = *(void *)(*(void *)(a1 + 96) + 8),
        Current - *(double *)(v12 + 24) >= *(double *)(a1 + 112))
    && (*(double *)(v12 + 24) = Current,
        (*(void (**)(double))(*(void *)(a1 + 64) + 16))((double)v8 / (double)v10),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8)
                                                                                + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  }
}

- (void)processMeaningfulEventsWithMomentNodes:(id)a3 graph:(id)a4 progressBlock:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  graphBuilder = self->_graphBuilder;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [(PGGraphBuilder *)graphBuilder loggingConnection];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = v12;
  double v15 = v14;
  unint64_t v16 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGGraphIngestMeaningfulEventsProcessor", "", buf, 2u);
  }
  os_signpost_id_t spid = v13;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v26 = mach_absolute_time();
  id v17 = +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v17];
  id v19 = [(PGGraphBuilder *)self->_graphBuilder sceneTaxonomy];
  v20 = +[PGMeaningfulEventRequiredCriteriaFactory requiredCriteriaForIdentifiers:v18 inferenceType:0 graph:v10 sceneTaxonomy:v19];
  [(PGGraphIngestMeaningfulEventsProcessor *)self processMeaningfulEventsWithMomentNodes:v11 graph:v10 requiredMeaningfulEventCriteriaByIdentifier:v20 progressBlock:v9];

  uint64_t v21 = mach_absolute_time();
  mach_timebase_info v22 = info;
  id v23 = v15;
  id v24 = v23;
  if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v24, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestMeaningfulEventsProcessor", "", buf, 2u);
  }

  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 136315394;
    v29 = "PGGraphIngestMeaningfulEventsProcessor";
    __int16 v30 = 2048;
    double v31 = (float)((float)((float)((float)(v21 - v26) * (float)v22.numer) / (float)v22.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  id v10 = a4;
  graphBuilder = self->_graphBuilder;
  id v7 = a3;
  unint64_t v8 = [(PGGraphBuilder *)graphBuilder graph];
  id v9 = [v7 momentNodesToProcessInGraph:v8 forMomentUpdateTypes:31 includeInsertedNodes:1];

  if ([v9 count]) {
    [(PGGraphIngestMeaningfulEventsProcessor *)self processMeaningfulEventsWithMomentNodes:v9 graph:v8 progressBlock:v10];
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3 = a3;
  if ([v3 isResumingFullAnalysis] & 1) != 0 || (objc_msgSend(v3, "hasMomentsToInsert")) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasMomentsToUpdate];
  }

  return v4;
}

- (PGGraphIngestMeaningfulEventsProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestMeaningfulEventsProcessor;
  id v6 = [(PGGraphIngestMeaningfulEventsProcessor *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
  }

  return v7;
}

@end