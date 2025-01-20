@interface PGGraphIngestLocationDisambiguationProcessor
+ (unint64_t)requiredMomentUpdateTypes;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestLocationDisambiguationProcessor)initWithGraphBuilder:(id)a3;
- (void)removeDuplicateCityNodes:(id)a3 graph:(id)a4 loggingConnection:(id)a5 progressBlock:(id)a6;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestLocationDisambiguationProcessor

- (void).cxx_destruct
{
}

- (void)removeDuplicateCityNodes:(id)a3 graph:(id)a4 loggingConnection:(id)a5 progressBlock:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = _Block_copy(v12);
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v34 = 0;
  v35 = (double *)&v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  if (v13
    && (double v14 = CFAbsoluteTimeGetCurrent(), v14 - v35[3] >= 0.01)
    && (v35[3] = v14,
        LOBYTE(v42[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v13 + 2))(v13, v42, 0.0),
        char v15 = *((unsigned char *)v39 + 24) | LOBYTE(v42[0]),
        (*((unsigned char *)v39 + 24) = v15) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 0x4804000202;
      LOWORD(v46) = 2080;
      *(void *)((char *)&v46 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestLocationDisambiguationProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke;
    v32[3] = &unk_1E68EBC70;
    id v17 = v16;
    id v33 = v17;
    [v9 enumerateNodesUsingBlock:v32];
    unint64_t v18 = [v17 count];
    uint64_t buf = 0;
    *(void *)&long long v46 = &buf;
    *((void *)&v46 + 1) = 0x2020000000;
    uint64_t v47 = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_2;
    v23[3] = &unk_1E68E8938;
    p_uint64_t buf = &buf;
    double v30 = 1.0 / (double)v18;
    id v19 = v13;
    id v26 = v19;
    v28 = &v34;
    uint64_t v31 = 0x3F847AE147AE147BLL;
    v29 = &v38;
    id v24 = v11;
    id v25 = v10;
    [v17 enumerateKeysAndObjectsUsingBlock:v23];
    if (v13)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v35[3] >= 0.01)
      {
        v35[3] = Current;
        char v22 = 0;
        (*((void (**)(id, char *, double))v19 + 2))(v19, &v22, 1.0);
        char v21 = *((unsigned char *)v39 + 24) | v22;
        *((unsigned char *)v39 + 24) = v21;
        if (v21)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            v42[0] = 67109378;
            v42[1] = 218;
            __int16 v43 = 2080;
            v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Ingest/Ingest Processing/PGGraphIngestLocationDisambiguationProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v42, 0x12u);
          }
        }
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
}

void __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 name];
  v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (v4)
  {
    v5 = v4;
    [v4 addObject:v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA80] setWithObject:v3];

    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

void __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(a1 + 80)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);
  if (*(void *)(a1 + 48)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8),
        Current - *(double *)(v10 + 24) >= *(double *)(a1 + 88))
    && (*(double *)(v10 + 24) = Current,
        char v45 = 0,
        (*(void (**)(double))(*(void *)(a1 + 48) + 16))(*(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else if ((unint64_t)[v8 count] >= 2)
  {
    id v31 = v7;
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    id v12 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v30 = v8;
    id obj = v8;
    uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          unint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "identifier"));
          [v11 setObject:v17 forKeyedSubscript:v18];
          id v19 = [v17 collection];
          v20 = [v19 addressNodes];
          uint64_t v21 = [v20 count];

          char v22 = [NSNumber numberWithUnsignedInteger:v21];
          [v12 setObject:v22 forKeyedSubscript:v18];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v14);
    }

    v23 = v12;
    id v24 = [v12 keysSortedByValueUsingComparator:&__block_literal_global_31453];
    id v25 = [MEMORY[0x1E4F1CA60] dictionary];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_4;
    v37[3] = &unk_1E68E88E8;
    id v26 = v11;
    id v38 = v26;
    id v39 = v24;
    id v40 = v25;
    id v27 = v25;
    id v28 = v24;
    [v28 enumerateObjectsUsingBlock:v37];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_7;
    v33[3] = &unk_1E68E8910;
    id v34 = v26;
    id v35 = *(id *)(a1 + 32);
    id v36 = *(id *)(a1 + 40);
    id v29 = v26;
    [v27 enumerateKeysAndObjectsUsingBlock:v33];

    id v8 = v30;
    id v7 = v31;
  }
}

void __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_4(id *a1, void *a2, uint64_t a3)
{
  id v30 = a2;
  v5 = objc_msgSend(a1[4], "objectForKeyedSubscript:");
  id v6 = [v5 locationNodeCollection];
  id v7 = [v6 deepParentLocationNodes];

  v32 = v5;
  id v31 = [v5 fullname];
  if (!a3) {
    goto LABEL_18;
  }
  uint64_t v8 = 0;
  uint64_t v33 = a3;
  id v34 = v7;
  while (1)
  {
    id v9 = (void *)MEMORY[0x1D25FED50]();
    uint64_t v10 = [a1[5] objectAtIndexedSubscript:v8];
    id v11 = [a1[6] objectForKeyedSubscript:v10];

    if (v11) {
      goto LABEL_14;
    }
    id v12 = [a1[4] objectForKeyedSubscript:v10];
    uint64_t v13 = [v12 locationNodeCollection];
    uint64_t v14 = [v13 deepParentLocationNodes];

    uint64_t v15 = [v7 count];
    v16 = [v12 fullname];
    if ([v14 isEqual:v7]) {
      break;
    }
    if (v15)
    {
      uint64_t v17 = [v7 count];
      if (v17 == [v14 count] && (objc_msgSend(v31, "isEqualToString:", v16) & 1) != 0) {
        break;
      }
    }
    unint64_t v18 = [MEMORY[0x1E4F1CA80] set];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_5;
    v37[3] = &unk_1E68E88C0;
    id v19 = v18;
    id v38 = v19;
    [v7 enumerateNodesUsingBlock:v37];
    v20 = [MEMORY[0x1E4F1CA80] set];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_6;
    v35[3] = &unk_1E68E88C0;
    id v21 = v20;
    id v36 = v21;
    [v14 enumerateNodesUsingBlock:v35];
    [v21 intersectSet:v19];
    double v22 = (double)(unint64_t)[v21 count];
    uint64_t v23 = [v14 count];
    id v24 = v7;
    unint64_t v25 = v23;
    unint64_t v26 = [v24 count];
    if (v25 <= v26) {
      unint64_t v27 = v26;
    }
    else {
      unint64_t v27 = v25;
    }
    if (v22 / (double)v27 >= 0.6)
    {
      [v32 coordinate];
      [v12 coordinate];
      CLLocationCoordinate2DGetDistanceFrom();
      double v29 = v28;

      a3 = v33;
      id v7 = v34;
      if (v29 <= 50000.0) {
        goto LABEL_17;
      }
    }
    else
    {

      a3 = v33;
      id v7 = v34;
    }
LABEL_14:

    if (a3 == ++v8) {
      goto LABEL_18;
    }
  }

LABEL_17:
  [a1[6] setObject:v10 forKeyedSubscript:v30];

LABEL_18:
}

void __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  char v45 = [*(id *)(a1 + 32) objectForKeyedSubscript:a3];
  id v39 = v5;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v7 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 138412546;
    v62 = v6;
    __int16 v63 = 2112;
    v64 = v45;
    _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_DEFAULT, "Location Disambiguation [City] Node %@ is a duplicate of node %@", buf, 0x16u);
  }
  uint64_t v8 = [v6 locationNodeCollection];
  id v9 = [v8 deepChildLocationNodes];
  uint64_t v10 = [v9 temporarySet];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v10;
  long long v42 = v6;
  uint64_t v43 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v43)
  {
    uint64_t v41 = *(void *)v55;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v55 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v11;
        id v12 = *(void **)(*((void *)&v54 + 1) + 8 * v11);
        uint64_t v13 = [v12 edgesTowardNode:v6];
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v51 != v16) {
                objc_enumerationMutation(v13);
              }
              unint64_t v18 = *(void **)(*((void *)&v50 + 1) + 8 * i);
              id v19 = *(void **)(a1 + 48);
              v20 = [v18 label];
              uint64_t v21 = [v18 domain];
              double v22 = [v18 propertyDictionary];
              id v23 = (id)[v19 addUniqueEdgeWithLabel:v20 sourceNode:v12 targetNode:v45 domain:v21 properties:v22];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v50 objects:v59 count:16];
          }
          while (v15);
        }

        uint64_t v11 = v44 + 1;
        id v6 = v42;
      }
      while (v44 + 1 != v43);
      uint64_t v43 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v43);
  }

  id v24 = [v6 locationNodeCollection];
  unint64_t v25 = [v24 parentLocationNodes];
  unint64_t v26 = [v25 anyNode];

  if (v26)
  {
    unint64_t v27 = [v6 edgesTowardNode:v26];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v47 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          uint64_t v33 = *(void **)(a1 + 48);
          id v34 = [v32 label];
          uint64_t v35 = [v32 domain];
          id v36 = [v32 propertyDictionary];
          id v37 = (id)[v33 addUniqueEdgeWithLabel:v34 sourceNode:v45 targetNode:v26 domain:v35 properties:v36];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v46 objects:v58 count:16];
      }
      while (v29);
    }

    id v6 = v42;
  }
  id v38 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  [v38 removeNode:v6];
  [*(id *)(a1 + 48) executeGraphChangeRequest:v38];
}

void __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  [v2 addObject:v3];
}

void __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  [v2 addObject:v3];
}

uint64_t __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PGGraphBuilder *)self->_graphBuilder graph];
  id v9 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  uint64_t v11 = v9;
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGGraphIngestLocationDisambiguationProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v13 = mach_absolute_time();
  if ([v6 isResumingFullAnalysis])
  {
    uint64_t v14 = +[PGGraphNodeCollection nodesInGraph:v8];
  }
  else
  {
    uint64_t v15 = objc_msgSend(v6, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v8, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);
    uint64_t v14 = [v15 cityNodes];
  }
  if ([v14 count]) {
    [(PGGraphIngestLocationDisambiguationProcessor *)self removeDuplicateCityNodes:v14 graph:v8 loggingConnection:v12 progressBlock:v7];
  }
  uint64_t v16 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v19 = v12;
  v20 = v19;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_END, v10, "PGGraphIngestLocationDisambiguationProcessor", "", buf, 2u);
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 136315394;
    id v23 = "PGGraphIngestLocationDisambiguationProcessor";
    __int16 v24 = 2048;
    double v25 = (float)((float)((float)((float)(v16 - v13) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3 = a3;
  if ([v3 isResumingFullAnalysis] & 1) != 0 || (objc_msgSend(v3, "hasInsertedMomentNodes"))
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [v3 momentUpdateTypes];
    BOOL v4 = ([(id)objc_opt_class() requiredMomentUpdateTypes] & v5) != 0;
  }

  return v4;
}

- (PGGraphIngestLocationDisambiguationProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestLocationDisambiguationProcessor;
  id v6 = [(PGGraphIngestLocationDisambiguationProcessor *)&v9 init];
  id v7 = v6;
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