@interface PGGraphIngestPublicEventsProcessor
+ (unint64_t)requiredMomentUpdateTypes;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestPublicEventsProcessor)initWithGraphBuilder:(id)a3;
- (void)_enumeratePublicEventsFromMomentNodes:(id)a3 progressBlock:(id)a4 usingBlock:(id)a5;
- (void)_insertPublicEventsFromMomentNodes:(id)a3 graphUpdate:(id)a4 progressBlock:(id)a5;
- (void)deletePerformerNodeWithNoEdgesInGraph:(id)a3;
- (void)deletePublicEventCategoryWithNoEdgesInGraph:(id)a3;
- (void)deletePublicEventEdgesWithMomentNodes:(id)a3 inGraph:(id)a4;
- (void)deletePublicEventNodesWithNoInEdgesInGraph:(id)a3;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestPublicEventsProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disambiguator, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

- (void)_enumeratePublicEventsFromMomentNodes:(id)a3 progressBlock:(id)a4 usingBlock:(id)a5
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v7 = a4;
  v8 = (void (**)(id, void *, void, void *))a5;
  v49 = v7;
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x2020000000;
  char v102 = 0;
  uint64_t v95 = 0;
  v96 = (double *)&v95;
  uint64_t v97 = 0x2020000000;
  uint64_t v98 = 0;
  v58 = _Block_copy(v7);
  if (!v58
    || (double v9 = CFAbsoluteTimeGetCurrent(), v9 - v96[3] < 0.01)
    || (v96[3] = v9,
        v106[0] = 0,
        (*((void (**)(void *, uint8_t *, double))v58 + 2))(v58, v106, 0.0),
        char v10 = *((unsigned char *)v100 + 24) | v106[0],
        (*((unsigned char *)v100 + 24) = v10) == 0))
  {
    *(void *)buf = 0;
    *(void *)&long long v111 = buf;
    *((void *)&v111 + 1) = 0x2020000000;
    uint64_t v112 = 0;
    v62 = [(PGGraphBuilder *)self->_graphBuilder graph];
    uint64_t v11 = [v62 largeFrequentLocationNodes];
    disambiguator = self->_disambiguator;
    id v94 = 0;
    id v93 = 0;
    id v92 = 0;
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __101__PGGraphIngestPublicEventsProcessor__enumeratePublicEventsFromMomentNodes_progressBlock_usingBlock___block_invoke;
    v86[3] = &unk_1E68EB350;
    v88 = buf;
    id v13 = v58;
    id v87 = v13;
    v89 = &v95;
    uint64_t v91 = 0x3F847AE147AE147BLL;
    v90 = &v99;
    [(PGPublicEventDisambiguator *)disambiguator collectConsolidatedAddressesForMomentNodes:v53 largeFrequentLocationNodes:v11 consolidatedAddresses:&v94 consolidatedAddressesByMomentIdentifier:&v93 momentNodesForConsolidatedAddresses:&v92 progressBlock:v86];
    v47 = (void *)v11;
    id v14 = v94;
    id v56 = v93;
    id v57 = v92;
    v15 = [(PGGraphBuilder *)self->_graphBuilder publicEventManager];
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __101__PGGraphIngestPublicEventsProcessor__enumeratePublicEventsFromMomentNodes_progressBlock_usingBlock___block_invoke_2;
    v80[3] = &unk_1E68EB350;
    v82 = buf;
    id v51 = v13;
    id v81 = v51;
    v83 = &v95;
    v84 = &v99;
    uint64_t v85 = 0x3F847AE147AE147BLL;
    v66 = [v15 publicEventsByTimeLocationTupleIdentifierForTimeLocationTuples:v14 progressBlock:v80];
    v46 = v14;

    uint64_t v16 = v111;
    *(void *)(v111 + 24) = 0x3FE3333333333333;
    if (v58)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v16 = v111;
      if (Current - v96[3] >= 0.01)
      {
        v96[3] = Current;
        char v79 = 0;
        (*((void (**)(id, char *, double))v51 + 2))(v51, &v79, *(double *)(v16 + 24));
        char v18 = *((unsigned char *)v100 + 24) | v79;
        *((unsigned char *)v100 + 24) = v18;
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v106 = 67109378;
            int v107 = 203;
            __int16 v108 = 2080;
            v109 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/Ingest Processing/PGGraphIngestPublicEventsProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v106, 0x12u);
          }
LABEL_50:

          _Block_object_dispose(buf, 8);
          goto LABEL_51;
        }
        uint64_t v16 = v111;
      }
    }
    double v19 = *(double *)(v16 + 24);
    unint64_t v20 = [v57 count];
    v61 = [(PGGraphBuilder *)self->_graphBuilder serviceManager];
    v21 = [PGMeaningfulEventProcessorCache alloc];
    v22 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithSet:v57 graph:v62];
    v60 = [(PGMeaningfulEventProcessorCache *)v21 initWithMomentNodes:v22];

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id obj = v57;
    uint64_t v23 = [obj countByEnumeratingWithState:&v75 objects:v105 count:16];
    if (v23)
    {
      double v25 = (0.9 - v19) / (double)v20;
      uint64_t v52 = *(void *)v76;
      *(void *)&long long v24 = 67109378;
      long long v45 = v24;
      while (2)
      {
        uint64_t v26 = 0;
        uint64_t v48 = v23;
        do
        {
          if (*(void *)v76 != v52) {
            objc_enumerationMutation(obj);
          }
          uint64_t v55 = v26;
          v27 = *(void **)(*((void *)&v75 + 1) + 8 * v26);
          context = (void *)MEMORY[0x1D25FED50]();
          v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "identifier"));
          v29 = [v56 objectForKeyedSubscript:v28];

          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v59 = v29;
          uint64_t v30 = [v59 countByEnumeratingWithState:&v71 objects:v104 count:16];
          if (v30)
          {
            uint64_t v65 = *(void *)v72;
            do
            {
              uint64_t v31 = 0;
              uint64_t v64 = v30;
              do
              {
                if (*(void *)v72 != v65) {
                  objc_enumerationMutation(v59);
                }
                v32 = *(void **)(*((void *)&v71 + 1) + 8 * v31);
                v33 = objc_msgSend(v32, "timeLocationIdentifier", v45);
                v34 = [v66 objectForKeyedSubscript:v33];

                if ([v34 count])
                {
                  v35 = [(PGPublicEventDisambiguator *)self->_disambiguator disambiguateEvents:v34 forTimeLocationTuple:v32 momentNode:v27 graph:v62 meaningfulEventProcessorCache:v60 serviceManager:v61];
                  long long v69 = 0u;
                  long long v70 = 0u;
                  long long v67 = 0u;
                  long long v68 = 0u;
                  id v36 = v35;
                  uint64_t v37 = [v36 countByEnumeratingWithState:&v67 objects:v103 count:16];
                  if (v37)
                  {
                    uint64_t v38 = *(void *)v68;
                    do
                    {
                      for (uint64_t i = 0; i != v37; ++i)
                      {
                        if (*(void *)v68 != v38) {
                          objc_enumerationMutation(v36);
                        }
                        v8[2](v8, v27, *(void *)(*((void *)&v67 + 1) + 8 * i), v32);
                      }
                      uint64_t v37 = [v36 countByEnumeratingWithState:&v67 objects:v103 count:16];
                    }
                    while (v37);
                  }

                  uint64_t v30 = v64;
                }

                ++v31;
              }
              while (v31 != v30);
              uint64_t v30 = [v59 countByEnumeratingWithState:&v71 objects:v104 count:16];
            }
            while (v30);
          }

          *(double *)(v111 + 24) = v25 + *(double *)(v111 + 24);
          if (v58
            && (double v40 = CFAbsoluteTimeGetCurrent(), v40 - v96[3] >= 0.01)
            && (v96[3] = v40,
                char v79 = 0,
                (*((void (**)(id, char *, double))v51 + 2))(v51, &v79, *(double *)(v111 + 24)),
                char v41 = *((unsigned char *)v100 + 24) | v79,
                (*((unsigned char *)v100 + 24) = v41) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v106 = v45;
              int v107 = 230;
              __int16 v108 = 2080;
              v109 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/G"
                     "raph/Ingest/Ingest Processing/PGGraphIngestPublicEventsProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v106, 0x12u);
            }
            int v42 = 0;
          }
          else
          {
            int v42 = 1;
          }

          if (!v42)
          {

            goto LABEL_49;
          }
          uint64_t v26 = v55 + 1;
        }
        while (v55 + 1 != v48);
        uint64_t v23 = [obj countByEnumeratingWithState:&v75 objects:v105 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }

    if (v58)
    {
      double v43 = CFAbsoluteTimeGetCurrent();
      if (v43 - v96[3] >= 0.01)
      {
        v96[3] = v43;
        char v79 = 0;
        (*((void (**)(id, char *, double))v51 + 2))(v51, &v79, 1.0);
        char v44 = *((unsigned char *)v100 + 24) | v79;
        *((unsigned char *)v100 + 24) = v44;
        if (v44)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v106 = 67109378;
            int v107 = 233;
            __int16 v108 = 2080;
            v109 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/Ingest Processing/PGGraphIngestPublicEventsProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v106, 0x12u);
          }
        }
      }
    }
LABEL_49:

    goto LABEL_50;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 169;
    LOWORD(v111) = 2080;
    *(void *)((char *)&v111 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPublicEventsProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_51:
  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(&v99, 8);
}

void __101__PGGraphIngestPublicEventsProcessor__enumeratePublicEventsFromMomentNodes_progressBlock_usingBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 * 0.1;
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v6 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                               + 24));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __101__PGGraphIngestPublicEventsProcessor__enumeratePublicEventsFromMomentNodes_progressBlock_usingBlock___block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 * 0.5 + 0.1;
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v6 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                               + 24));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)_insertPublicEventsFromMomentNodes:(id)a3 graphUpdate:(id)a4 progressBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__39104;
  v15[4] = __Block_byref_object_dispose__39105;
  id v16 = [MEMORY[0x1E4F1CA60] dictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __99__PGGraphIngestPublicEventsProcessor__insertPublicEventsFromMomentNodes_graphUpdate_progressBlock___block_invoke;
  v12[3] = &unk_1E68E9D70;
  id v14 = v15;
  v12[4] = self;
  id v11 = v9;
  id v13 = v11;
  [(PGGraphIngestPublicEventsProcessor *)self _enumeratePublicEventsFromMomentNodes:v8 progressBlock:v10 usingBlock:v12];

  _Block_object_dispose(v15, 8);
}

void __99__PGGraphIngestPublicEventsProcessor__insertPublicEventsFromMomentNodes_graphUpdate_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v16 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v10 = [v16 UUID];
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (!v11)
  {
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v13 = [v16 UUID];
    [v12 setObject:v11 forKeyedSubscript:v13];
  }
  id v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "muid"));
  v15 = [v11 objectForKeyedSubscript:v14];
  if (v15
    || ([*(id *)(*(void *)(a1 + 32) + 8) insertPublicEvent:v7 fromEventNode:v16],
        v15 = objc_claimAutoreleasedReturnValue(),
        [v11 setObject:v15 forKeyedSubscript:v14],
        v15))
  {
    objc_msgSend(*(id *)(a1 + 40), "registerPublicEventNode:withConsolidatedAddress:toResolveBusinessItemMuid:", v15, v8, objc_msgSend(v7, "businessItemMuid"));
  }
}

- (void)deletePerformerNodeWithNoEdgesInGraph:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[PGGraphPerformerNode filter];
  [v5 setWhereNoInAndOutEdges:1];
  uint64_t v6 = [v4 nodeIdentifiersMatchingFilter:v5];
  id v7 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134217984;
    uint64_t v10 = [v6 count];
    _os_log_debug_impl(&dword_1D1805000, v7, OS_LOG_TYPE_DEBUG, "[PublicEvents] Deleted %lu public event performer nodes from the graph", (uint8_t *)&v9, 0xCu);
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  [v8 removeNodesForIdentifiers:v6];
  [v4 executeGraphChangeRequest:v8];
}

- (void)deletePublicEventCategoryWithNoEdgesInGraph:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[PGGraphNodeCollection nodesInGraph:v4];
  uint64_t v6 = [v5 categories];
  id v7 = +[PGGraphPublicEventCategoryNode filterWithCategories:v6];
  [v7 setWhereNoInAndOutEdges:1];
  id v8 = [v4 nodeIdentifiersMatchingFilter:v7];
  int v9 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134217984;
    uint64_t v12 = [v8 count];
    _os_log_debug_impl(&dword_1D1805000, v9, OS_LOG_TYPE_DEBUG, "[PublicEvents] Deleted %lu public event category nodes from the graph", (uint8_t *)&v11, 0xCu);
  }

  id v10 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  [v10 removeNodesForIdentifiers:v8];
  [v4 executeGraphChangeRequest:v10];
}

- (void)deletePublicEventNodesWithNoInEdgesInGraph:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[PGGraphPublicEventNode filter];
  [v5 setWhereNoInEdges:1];
  uint64_t v6 = [v4 nodeIdentifiersMatchingFilter:v5];
  id v7 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 134217984;
      uint64_t v10 = [v6 count];
      _os_log_debug_impl(&dword_1D1805000, v8, OS_LOG_TYPE_DEBUG, "[PublicEvents] Deleted %lu public event nodes from the graph", (uint8_t *)&v9, 0xCu);
    }

    id v8 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    [v8 removeNodesForIdentifiers:v6];
    [v4 executeGraphChangeRequest:v8];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = (uint64_t)v5;
    _os_log_fault_impl(&dword_1D1805000, v8, OS_LOG_TYPE_FAULT, "unexpected nil return from MAGraph nodeIdentifiersMatchingFilter:%@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)deletePublicEventEdgesWithMomentNodes:(id)a3 inGraph:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v6 = a4;
  id v7 = a3;
  id v10 = objc_alloc_init(v5);
  id v8 = [v7 publicEventNodes];
  int v9 = +[PGGraphEdgeCollection edgesFromNodes:v7 toNodes:v8];

  [v10 removeEdges:v9];
  [v6 executeGraphChangeRequest:v10];
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (+[PGUserDefaults isPublicEventsEnabled])
  {
    id v8 = [(PGGraphBuilder *)self->_graphBuilder graph];
    int v9 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
    os_signpost_id_t v10 = os_signpost_id_generate(v9);
    uint64_t v11 = v9;
    uint64_t v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGGraphIngestPublicEventsProcessor", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v13 = mach_absolute_time();
    id v14 = objc_msgSend(v6, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v8, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);
    if ([v14 count])
    {
      [(PGGraphIngestPublicEventsProcessor *)self deletePublicEventEdgesWithMomentNodes:v14 inGraph:v8];
      [(PGGraphIngestPublicEventsProcessor *)self _insertPublicEventsFromMomentNodes:v14 graphUpdate:v6 progressBlock:v7];
    }
    [(PGGraphIngestPublicEventsProcessor *)self deletePublicEventNodesWithNoInEdgesInGraph:v8];
    [(PGGraphIngestPublicEventsProcessor *)self deletePublicEventCategoryWithNoEdgesInGraph:v8];
    [(PGGraphIngestPublicEventsProcessor *)self deletePerformerNodeWithNoEdgesInGraph:v8];
    uint64_t v15 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    char v18 = v12;
    double v19 = v18;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v19, OS_SIGNPOST_INTERVAL_END, v10, "PGGraphIngestPublicEventsProcessor", "", buf, 2u);
    }

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "PGGraphIngestPublicEventsProcessor";
      __int16 v23 = 2048;
      double v24 = (float)((float)((float)((float)(v15 - v13) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3 = a3;
  if (+[PGUserDefaults isPublicEventsEnabled])
  {
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
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (PGGraphIngestPublicEventsProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGGraphIngestPublicEventsProcessor;
  uint64_t v6 = [(PGGraphIngestPublicEventsProcessor *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    id v8 = [PGPublicEventDisambiguator alloc];
    int v9 = [v5 sceneTaxonomy];
    uint64_t v10 = [(PGPublicEventDisambiguator *)v8 initWithSceneTaxonomy:v9];
    disambiguator = v7->_disambiguator;
    v7->_disambiguator = (PGPublicEventDisambiguator *)v10;
  }
  return v7;
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 6;
}

@end