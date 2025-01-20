@interface PGGraphIngestTripProcessor
+ (unint64_t)requiredMomentUpdateTypes;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestTripProcessor)initWithGraphBuilder:(id)a3;
- (id)allTripNodes;
- (id)featuredLocationNodesByHighlightGroupNode;
- (id)tripsMissingFeaturedLocations;
- (void)ingestLocationFeaturesForTripNodes:(id)a3 graph:(id)a4 loggingConnection:(id)a5 progressBlock:(id)a6 isResumingFullAnalysis:(BOOL)a7;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestTripProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripsMissingFeaturedLocations, 0);
  objc_storeStrong((id *)&self->_featuredLocationNodesByHighlightGroupNode, 0);
  objc_storeStrong((id *)&self->_allTripNodes, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

- (void)ingestLocationFeaturesForTripNodes:(id)a3 graph:(id)a4 loggingConnection:(id)a5 progressBlock:(id)a6 isResumingFullAnalysis:(BOOL)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v14 = a5;
  id v15 = a6;
  v16 = [v12 targets];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    v18 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:v15];
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F71F10]) initWithProgressReporter:v18];
    *(void *)buf = 0;
    v48 = buf;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = 0;
    v20 = [v12 targets];
    unint64_t v21 = [v20 count];

    v22 = [[PGGraphLocationHelper alloc] initWithGraph:v13];
    id v23 = v18;
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    char v46 = 0;
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __126__PGGraphIngestTripProcessor_ingestLocationFeaturesForTripNodes_graph_loggingConnection_progressBlock_isResumingFullAnalysis___block_invoke;
    v32 = &unk_1E68EF6E0;
    id v24 = v19;
    id v33 = v24;
    v39 = buf;
    double v41 = 1.0 / (double)v21;
    id v34 = v13;
    v25 = v22;
    v35 = v25;
    v36 = v14;
    v40 = &v43;
    id v26 = v23;
    BOOL v42 = a7;
    id v37 = v26;
    v38 = self;
    [v12 enumerateTargetsBySourceWithBlock:&v29];
    if (*((unsigned char *)v44 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_11:

        _Block_object_dispose(&v43, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_12;
      }
      *(_DWORD *)v51 = 67109378;
      int v52 = 175;
      __int16 v53 = 2080;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGGraphIngestTripProcessor.m";
      v27 = MEMORY[0x1E4F14500];
    }
    else
    {
      int v28 = objc_msgSend(v26, "isCancelledWithProgress:", 1.0, v29, v30, v31, v32, v33, v34, v35, v36);
      *((unsigned char *)v44 + 24) = v28;
      if (!v28 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_11;
      }
      *(_DWORD *)v51 = 67109378;
      int v52 = 176;
      __int16 v53 = 2080;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGGraphIngestTripProcessor.m";
      v27 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v51, 0x12u);
    goto LABEL_11;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "[PGGraphIngestTripProcessor] No highlight to be ingest.", buf, 2u);
  }
LABEL_12:
}

void __126__PGGraphIngestTripProcessor_ingestLocationFeaturesForTripNodes_graph_loggingConnection_progressBlock_isResumingFullAnalysis___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  v8 = *(void **)(a1 + 32);
  double v9 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) + *(double *)(a1 + 96) * 0.9;
  id v10 = a3;
  v11 = [v8 childProgressReporterToCheckpoint:v9];
  *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(double *)(a1 + 96)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                          + 24);
  id v12 = [v7 anyNode];
  id v13 = [v12 uuid];
  v14 = [PGTripFeatureProcessor alloc];
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  id v55 = 0;
  uint64_t v17 = [(PGTripFeatureProcessor *)v14 initWithMomentNodes:v10 graph:v15 locationHelper:v16 error:&v55];

  id v18 = v55;
  v19 = v18;
  if (v17)
  {
    uint64_t v50 = a4;
    id v54 = v18;
    v20 = [(PGTripFeatureProcessor *)v17 processTripLocationsWithReporter:v11 error:&v54];
    id v21 = v54;

    uint64_t v22 = *(void *)(*(void *)(a1 + 88) + 8);
    if (*(unsigned char *)(v22 + 24))
    {
      char v23 = 1;
    }
    else
    {
      char v23 = [*(id *)(a1 + 64) isCancelledWithProgress:*(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
      uint64_t v22 = *(void *)(*(void *)(a1 + 88) + 8);
    }
    *(unsigned char *)(v22 + 24) = v23;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
    {
      *uint64_t v50 = 1;
    }
    else
    {
      if (*(unsigned char *)(a1 + 104)) {
        [(PGTripFeatureProcessor *)v17 sendAnalyticsEvent];
      }
      if (v20)
      {
        uint64_t v25 = [v20 count];
        id v26 = *(NSObject **)(a1 + 56);
        BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
        if (v25)
        {
          if (v27)
          {
            int v28 = v26;
            uint64_t v29 = [v20 count];
            *(_DWORD *)buf = 138412546;
            uint64_t v57 = (uint64_t)v13;
            __int16 v58 = 2048;
            uint64_t v59 = v29;
            _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "[PGGraphIngestTripProcessor] Trip with uuid %@ does have %lu featuredLocationNodes retrieved from processor.", buf, 0x16u);
          }
        }
        else if (v27)
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v57 = (uint64_t)v13;
          _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "[PGGraphIngestTripProcessor] Trip with uuid %@ does not have any featuredLocationNodes.", buf, 0xCu);
        }
        id v49 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
        v31 = [*(id *)(a1 + 72) featuredLocationNodesByHighlightGroupNode];
        uint64_t v32 = [v31 targetsForSources:v7];

        id v33 = (void *)v32;
        v48 = [(MAElementCollection *)[PGGraphFeatureNodeCollection alloc] initWithArray:v20 graph:*(void *)(a1 + 40)];
        v47 = [(MAElementCollection *)v48 collectionBySubtracting:v32];
        if ([v47 count])
        {
          id v34 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v35 = v34;
            v36 = v33;
            id v37 = v35;
            uint64_t v38 = [v47 count];
            *(_DWORD *)buf = 134218242;
            uint64_t v57 = v38;
            __int16 v58 = 2112;
            uint64_t v59 = (uint64_t)v13;
            _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "[PGGraphIngestTripProcessor] adding %lu featured location nodes to trip with uuid @\"%@\"", buf, 0x16u);

            id v33 = v36;
          }
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __126__PGGraphIngestTripProcessor_ingestLocationFeaturesForTripNodes_graph_loggingConnection_progressBlock_isResumingFullAnalysis___block_invoke_241;
          v51[3] = &unk_1E68EF6B8;
          id v52 = v12;
          id v53 = v49;
          [v47 enumerateNodesUsingBlock:v51];
        }
        v39 = [v33 collectionBySubtracting:v48];
        if ([v39 count])
        {
          char v46 = v33;
          v40 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            double v41 = v40;
            uint64_t v42 = [v39 count];
            *(_DWORD *)buf = 134218242;
            uint64_t v57 = v42;
            __int16 v58 = 2112;
            uint64_t v59 = (uint64_t)v13;
            _os_log_impl(&dword_1D1805000, v41, OS_LOG_TYPE_INFO, "[PGGraphIngestTripProcessor] removing %lu featured location nodes to trip with uuid @\"%@\"", buf, 0x16u);
          }
          uint64_t v43 = +[PGGraphEdgeCollection edgesFromNodes:v7 toNodes:v39];
          [v49 removeEdges:v43];

          id v33 = v46;
        }
        [*(id *)(a1 + 40) executeGraphChangeRequest:v49];
        uint64_t v44 = *(void *)(*(void *)(a1 + 88) + 8);
        if (*(unsigned char *)(v44 + 24))
        {
          char v45 = 1;
        }
        else
        {
          char v45 = [*(id *)(a1 + 64) isCancelledWithProgress:*(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
          uint64_t v44 = *(void *)(*(void *)(a1 + 88) + 8);
        }
        *(unsigned char *)(v44 + 24) = v45;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
          *uint64_t v50 = 1;
        }
      }
      else
      {
        uint64_t v30 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v57 = (uint64_t)v21;
          __int16 v58 = 2112;
          uint64_t v59 = (uint64_t)v13;
          _os_log_error_impl(&dword_1D1805000, v30, OS_LOG_TYPE_ERROR, "[PGGraphIngestTripProcessor] Cannot retrieve featuredLocationNodes with error %@ on trip with uuid %@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    id v24 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v57 = (uint64_t)v19;
      __int16 v58 = 2112;
      uint64_t v59 = (uint64_t)v13;
      _os_log_error_impl(&dword_1D1805000, v24, OS_LOG_TYPE_ERROR, "[PGGraphIngestTripProcessor] PGTripFeatureProcessor init failed with error %@ on trip with uuid %@", buf, 0x16u);
    }
    id v21 = v19;
  }
}

void __126__PGGraphIngestTripProcessor_ingestLocationFeaturesForTripNodes_graph_loggingConnection_progressBlock_isResumingFullAnalysis___block_invoke_241(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PGGraphTripFeatureEdge alloc] initFromHighlightGroupNode:*(void *)(a1 + 32) toFeatureNode:v3];

  [*(id *)(a1 + 40) addEdge:v4];
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v39 = a4;
  v40 = [(PGGraphBuilder *)self->_graphBuilder graph];
  id v7 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  double v9 = v7;
  id v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PGGraphIngestTripProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v38 = mach_absolute_time();
  uint64_t v12 = [v6 isResumingFullAnalysis];
  if (v12)
  {
    id v13 = [(PGGraphIngestTripProcessor *)self allTripNodes];
  }
  else
  {
    v14 = objc_msgSend(v6, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v40, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);
    id v13 = [(PGGraphIngestTripProcessor *)self tripsMissingFeaturedLocations];
    if ([v14 count])
    {
      [v14 highlightNodes];
      v35 = v10;
      v16 = uint64_t v15 = v13;
      [v16 highlightGroupNodes];
      uint64_t v17 = v34 = v8 - 1;
      [(PGGraphIngestTripProcessor *)self allTripNodes];
      v19 = id v18 = v6;
      [v17 collectionByIntersecting:v19];
      v20 = os_signpost_id_t spida = v8;

      id v6 = v18;
      id v13 = [v15 collectionByFormingUnionWith:v20];

      id v10 = v35;
      os_signpost_id_t v8 = spida;
      unint64_t v11 = v34;
    }
  }
  if ([v13 isEmpty])
  {
    uint64_t v21 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    id v24 = v10;
    uint64_t v25 = v24;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v25, OS_SIGNPOST_INTERVAL_END, v8, "PGGraphIngestTripProcessor", "", buf, 2u);
    }

    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v43 = "PGGraphIngestTripProcessor";
      __int16 v44 = 2048;
      double v45 = (float)((float)((float)((float)(v21 - v38) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    os_signpost_id_t spid = v8;
    id v26 = (void *)MEMORY[0x1E4F71E88];
    BOOL v27 = +[PGGraphHighlightGroupNode momentInHighlight];
    int v28 = [v26 adjacencyWithSources:v13 relation:v27 targetsClass:objc_opt_class()];

    [(PGGraphIngestTripProcessor *)self ingestLocationFeaturesForTripNodes:v28 graph:v40 loggingConnection:v10 progressBlock:v39 isResumingFullAnalysis:v12];
    uint64_t v29 = mach_absolute_time();
    uint32_t v31 = info.numer;
    uint32_t v30 = info.denom;
    uint64_t v32 = v10;
    id v33 = v32;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v33, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestTripProcessor", "", buf, 2u);
    }

    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v43 = "PGGraphIngestTripProcessor";
      __int16 v44 = 2048;
      double v45 = (float)((float)((float)((float)(v29 - v38) * (float)v31) / (float)v30) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v4 = a3;
  if (([v4 isResumingFullAnalysis] & 1) != 0
    || ([(PGGraphIngestTripProcessor *)self tripsMissingFeaturedLocations],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEmpty],
        v5,
        ([v4 hasMomentsToInsert] & 1) != 0))
  {
    BOOL v7 = 1;
  }
  else
  {
    char v8 = v6 ^ 1;
    uint64_t v9 = [v4 momentUpdateTypes];
    if (([(id)objc_opt_class() requiredMomentUpdateTypes] & v9) != 0) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v8;
    }
  }

  return v7;
}

- (id)tripsMissingFeaturedLocations
{
  tripsMissingFeaturedLocations = self->_tripsMissingFeaturedLocations;
  if (!tripsMissingFeaturedLocations)
  {
    id v4 = [(PGGraphIngestTripProcessor *)self allTripNodes];
    v5 = [(PGGraphIngestTripProcessor *)self featuredLocationNodesByHighlightGroupNode];
    char v6 = [v5 sources];
    BOOL v7 = [v4 collectionBySubtracting:v6];
    char v8 = self->_tripsMissingFeaturedLocations;
    self->_tripsMissingFeaturedLocations = v7;

    tripsMissingFeaturedLocations = self->_tripsMissingFeaturedLocations;
  }
  return tripsMissingFeaturedLocations;
}

- (id)featuredLocationNodesByHighlightGroupNode
{
  featuredLocationNodesByHighlightGroupNode = self->_featuredLocationNodesByHighlightGroupNode;
  if (!featuredLocationNodesByHighlightGroupNode)
  {
    id v4 = (void *)MEMORY[0x1E4F71E88];
    v5 = [(PGGraphIngestTripProcessor *)self allTripNodes];
    char v6 = +[PGGraphHighlightGroupNodeCollection locationFeatureOfHighlightGroup];
    BOOL v7 = [v4 adjacencyWithSources:v5 relation:v6 targetsClass:objc_opt_class()];
    char v8 = self->_featuredLocationNodesByHighlightGroupNode;
    self->_featuredLocationNodesByHighlightGroupNode = v7;

    featuredLocationNodesByHighlightGroupNode = self->_featuredLocationNodesByHighlightGroupNode;
  }
  return featuredLocationNodesByHighlightGroupNode;
}

- (id)allTripNodes
{
  allTripNodes = self->_allTripNodes;
  if (!allTripNodes)
  {
    id v4 = [(PGGraphBuilder *)self->_graphBuilder graph];
    v5 = +[PGGraphHighlightTypeNodeCollection tripTypeNodesInGraph:v4];
    char v6 = [v5 highlightGroupNodes];
    BOOL v7 = self->_allTripNodes;
    self->_allTripNodes = v6;

    allTripNodes = self->_allTripNodes;
  }
  return allTripNodes;
}

- (PGGraphIngestTripProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestTripProcessor;
  char v6 = [(PGGraphIngestTripProcessor *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
  }

  return v7;
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 4;
}

@end