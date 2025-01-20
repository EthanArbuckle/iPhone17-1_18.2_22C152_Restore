@interface PGGraphIngestNextEdgesProcessor
+ (unint64_t)requiredMomentUpdateTypes;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestNextEdgesProcessor)initWithGraphBuilder:(id)a3;
- (void)processNextEdgesWithSortedMomentNodes:(id)a3 graph:(id)a4 progressBlock:(id)a5;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestNextEdgesProcessor

- (void).cxx_destruct
{
}

- (void)processNextEdgesWithSortedMomentNodes:(id)a3 graph:(id)a4 progressBlock:(id)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(void *, unsigned char *, double))_Block_copy(a5);
  double v10 = 0.0;
  if (v9)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v64 = 0;
      v9[2](v9, &v64, 0.0);
      if (v64)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v68 = 92;
          __int16 v69 = 2080;
          v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/"
                "Ingest/Ingest Processing/PGGraphIngestNextEdgesProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_30;
      }
      double v10 = Current;
    }
  }
  v47 = v9;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v48 = v7;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v61 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "identifier"));
        [v12 setObject:v18 forKeyedSubscript:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v15);
  }

  v49 = v8;
  v20 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithArray:v13 graph:v8];
  v21 = (void *)MEMORY[0x1E4F71E88];
  v22 = +[PGGraphMomentNode nextMomentOfMoment];
  v46 = v20;
  v23 = [v21 adjacencyWithSources:v20 relation:v22 targetsClass:objc_opt_class()];

  id v24 = objc_alloc_init(MEMORY[0x1E4F71E58]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v25 = v13;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    id v28 = 0;
    uint64_t v29 = *(void *)v57;
    do
    {
      uint64_t v30 = 0;
      v31 = v28;
      do
      {
        if (*(void *)v57 != v29) {
          objc_enumerationMutation(v25);
        }
        v32 = *(void **)(*((void *)&v56 + 1) + 8 * v30);
        if (v31) {
          objc_msgSend(v24, "insertSource:target:", objc_msgSend(v31, "identifier"), objc_msgSend(v32, "identifier"));
        }
        id v28 = v32;

        ++v30;
        v31 = v28;
      }
      while (v27 != v30);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v27);
  }
  id v33 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  v34 = [v23 adjacency];
  v35 = [v24 differenceWith:v34];

  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __93__PGGraphIngestNextEdgesProcessor_processNextEdgesWithSortedMomentNodes_graph_progressBlock___block_invoke;
  v53[3] = &unk_1E68E6368;
  id v36 = v12;
  id v54 = v36;
  id v37 = v33;
  id v55 = v37;
  [v35 enumerateTargetsBySourceWith:v53];
  v38 = [v23 adjacency];
  v39 = [v38 differenceWith:v24];

  v40 = [PGGraphMomentNodeCollection alloc];
  v41 = [v39 sources];
  v42 = [(MAElementCollection *)v40 initWithGraph:v8 elementIdentifiers:v41];

  v43 = +[PGGraphEdgeCollection edgesFromNodes:v42];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __93__PGGraphIngestNextEdgesProcessor_processNextEdgesWithSortedMomentNodes_graph_progressBlock___block_invoke_3;
  v50[3] = &unk_1E68E6390;
  id v51 = v39;
  id v44 = v37;
  id v52 = v44;
  id v45 = v39;
  [v43 enumerateEdgesUsingBlock:v50];
  [v49 executeGraphChangeRequest:v44];
  v9 = v47;
  id v7 = v48;
  if (v47)
  {
    if (CFAbsoluteTimeGetCurrent() - v10 >= 0.01)
    {
      char v64 = 0;
      v47[2](v47, &v64, 1.0);
      if (v64)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v68 = 145;
          __int16 v69 = 2080;
          v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/"
                "Ingest/Ingest Processing/PGGraphIngestNextEdgesProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

  id v8 = v49;
LABEL_30:
}

void __93__PGGraphIngestNextEdgesProcessor_processNextEdgesWithSortedMomentNodes_graph_progressBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithUnsignedInteger:a2];
  v9 = [v5 objectForKeyedSubscript:v8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__PGGraphIngestNextEdgesProcessor_processNextEdgesWithSortedMomentNodes_graph_progressBlock___block_invoke_2;
  v11[3] = &unk_1E68E6340;
  id v12 = *(id *)(a1 + 32);
  id v13 = v9;
  id v14 = *(id *)(a1 + 40);
  id v10 = v9;
  [v7 enumerateIdentifiersWithBlock:v11];
}

void __93__PGGraphIngestNextEdgesProcessor_processNextEdgesWithSortedMomentNodes_graph_progressBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = [v7 sourceNode];
  uint64_t v5 = [v4 identifier];
  v6 = [v7 targetNode];
  LODWORD(v3) = objc_msgSend(v3, "containsSource:target:", v5, objc_msgSend(v6, "identifier"));

  if (v3) {
    [*(id *)(a1 + 40) removeEdge:v7];
  }
}

void __93__PGGraphIngestNextEdgesProcessor_processNextEdgesWithSortedMomentNodes_graph_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = [NSNumber numberWithUnsignedInteger:a2];
  id v6 = [v3 objectForKeyedSubscript:v4];

  id v5 = [[PGGraphMomentNextEdge alloc] initFromMomentNode:*(void *)(a1 + 40) toMomentNode:v6];
  [*(id *)(a1 + 48) addEdge:v5];
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PGGraphBuilder *)self->_graphBuilder graph];
  v9 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  v11 = v9;
  id v12 = v11;
  unint64_t v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGGraphIngestNextEdgesProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v14 = mach_absolute_time();
  uint64_t v15 = [v8 momentNodes];
  if ([v15 count])
  {
    os_signpost_id_t spid = v10;
    uint64_t v37 = v14;
    v38 = v15;
    id v39 = v7;
    uint64_t v16 = [v15 set];
    v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
    *(void *)buf = v17;
    [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalEndDate" ascending:1];
    v18 = v8;
    v20 = id v19 = v6;
    *(void *)&buf[8] = v20;
    v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
    *(void *)&buf[16] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];

    id v6 = v19;
    id v8 = v18;

    v23 = [v16 sortedArrayUsingDescriptors:v22];

    if ([v6 isResumingFullAnalysis])
    {
      id v24 = +[PGGraphEdgeCollection edgesInGraph:v18];
      id v25 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
      [v25 removeEdges:v24];
      [v18 executeGraphChangeRequest:v25];
    }
    id v7 = v39;
    [(PGGraphIngestNextEdgesProcessor *)self processNextEdgesWithSortedMomentNodes:v23 graph:v18 progressBlock:v39];
    uint64_t v26 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    uint64_t v29 = v12;
    uint64_t v30 = v29;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v30, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestNextEdgesProcessor", "", buf, 2u);
    }

    uint64_t v15 = v38;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "PGGraphIngestNextEdgesProcessor";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v26 - v37) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v31 = mach_absolute_time();
    uint32_t v33 = info.numer;
    uint32_t v32 = info.denom;
    v34 = v12;
    v35 = v34;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v35, OS_SIGNPOST_INTERVAL_END, v10, "PGGraphIngestNextEdgesProcessor", "", buf, 2u);
    }

    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "PGGraphIngestNextEdgesProcessor";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v31 - v14) * (float)v33) / (float)v32) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v4 = a3;
  if (([v4 isResumingFullAnalysis] & 1) != 0
    || (uint64_t v5 = [v4 momentUpdateTypes],
        ([(id)objc_opt_class() requiredMomentUpdateTypes] & v5) != 0))
  {
    BOOL v6 = 1;
  }
  else if (([v4 hasDeletedMomentNodes] & 1) != 0 {
         || [v4 hasInsertedMomentNodes])
  }
  {
    id v8 = [(PGGraphBuilder *)self->_graphBuilder graph];
    uint64_t v9 = [v8 edgesCountForLabel:@"NEXT" domain:101];
    BOOL v6 = v9 != [v8 numberOfMomentNodes] - 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (PGGraphIngestNextEdgesProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestNextEdgesProcessor;
  BOOL v6 = [(PGGraphIngestNextEdgesProcessor *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
  }

  return v7;
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 2;
}

@end