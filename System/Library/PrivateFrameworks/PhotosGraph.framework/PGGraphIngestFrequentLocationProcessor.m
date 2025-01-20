@interface PGGraphIngestFrequentLocationProcessor
+ (unint64_t)requiredMomentUpdateTypes;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestFrequentLocationProcessor)initWithGraphBuilder:(id)a3;
- (id)processFrequentLocationWithGraph:(id)a3 progressBlock:(id)a4;
- (void)deleteFrequentLocationNodesInGraph:(id)a3 changeRequest:(id)a4;
- (void)processAndInsertFrequentLocationWithMomentNodes:(id)a3 inGraph:(id)a4 changeRequest:(id)a5 progressBlock:(id)a6;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestFrequentLocationProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

- (id)processFrequentLocationWithGraph:(id)a3 progressBlock:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v37 = a4;
  v6 = (void (**)(void *, unsigned char *, double))_Block_copy(v37);
  v38 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  uint64_t v48 = 0;
  v49 = (double *)&v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = 0;
  if (!v6
    || (double v7 = CFAbsoluteTimeGetCurrent(), v7 - v49[3] < 0.01)
    || (v49[3] = v7, v47 = 0, v6[2](v6, &v47, 0.0), char v8 = *((unsigned char *)v53 + 24) | v47, (*((unsigned char *)v53 + 24) = v8) == 0))
  {
    v10 = objc_opt_new();
    v11 = [v39 meNode];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __89__PGGraphIngestFrequentLocationProcessor_processFrequentLocationWithGraph_progressBlock___block_invoke;
    v45[3] = &unk_1E68E5478;
    id v12 = v10;
    id v46 = v12;
    [v11 enumerateHomeOrWorkAddressNodesUsingBlock:v45];
    v36 = v11;
    if (v6)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v49[3] >= 0.01)
      {
        v49[3] = Current;
        char v47 = 0;
        v6[2](v6, &v47, 0.1);
        char v14 = *((unsigned char *)v53 + 24) | v47;
        *((unsigned char *)v53 + 24) = v14;
        if (v14)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v57 = 182;
            *(_WORD *)&v57[4] = 2080;
            *(void *)&v57[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v9 = v38;
          goto LABEL_33;
        }
      }
    }
    v15 = [(PGGraphBuilder *)self->_graphBuilder photoLibrary];
    v16 = [v15 librarySpecificFetchOptions];

    v17 = [MEMORY[0x1E4F391A0] fetchMomentsWithOptions:v16];
    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v19 = [v17 fetchedObjects];
    v20 = [v18 setWithArray:v19];

    v21 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = [v20 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v57 = v22;
      _os_log_impl(&dword_1D1805000, (os_log_t)v21, OS_LOG_TYPE_INFO, "Processing frequent location for %tu moments", buf, 0xCu);
    }

    os_signpost_id_t v23 = os_signpost_id_generate((os_log_t)self->_loggingConnection);
    v24 = self->_loggingConnection;
    v25 = v24;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "ProcessFrequentLocations", "", buf, 2u);
    }

    v26 = (void *)MEMORY[0x1E4F8A838];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __89__PGGraphIngestFrequentLocationProcessor_processFrequentLocationWithGraph_progressBlock___block_invoke_251;
    v40[3] = &unk_1E68F03F8;
    v27 = v6;
    id v41 = v27;
    v42 = &v48;
    v43 = &v52;
    uint64_t v44 = 0x3F847AE147AE147BLL;
    v28 = [v26 processFrequentLocationsWithItems:v20 locationsOfInterest:v12 progressBlock:v40];
    v29 = self->_loggingConnection;
    v30 = v29;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v30, OS_SIGNPOST_INTERVAL_END, v23, "ProcessFrequentLocations", "", buf, 2u);
    }

    if (*((unsigned char *)v53 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v57 = 196;
        *(_WORD *)&v57[4] = 2080;
        *(void *)&v57[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
        v31 = MEMORY[0x1E4F14500];
LABEL_24:
        _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (!v6
        || (double v33 = CFAbsoluteTimeGetCurrent(), v33 - v49[3] < 0.01)
        || (v49[3] = v33,
            char v47 = 0,
            v27[2](v27, &v47, 1.0),
            char v34 = *((unsigned char *)v53 + 24) | v47,
            (*((unsigned char *)v53 + 24) = v34) == 0))
      {
        id v32 = v28;
        goto LABEL_32;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v57 = 198;
        *(_WORD *)&v57[4] = 2080;
        *(void *)&v57[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
        v31 = MEMORY[0x1E4F14500];
        goto LABEL_24;
      }
    }
    id v32 = v38;
LABEL_32:
    id v9 = v32;

LABEL_33:
    goto LABEL_34;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v57 = 169;
    *(_WORD *)&v57[4] = 2080;
    *(void *)&v57[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v9 = v38;
LABEL_34:
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

  return v9;
}

void __89__PGGraphIngestFrequentLocationProcessor_processFrequentLocationWithGraph_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 isHome] ^ 1;
  id v11 = [MEMORY[0x1E4F29128] UUID];
  id v7 = objc_alloc(MEMORY[0x1E4F8A928]);
  char v8 = [v5 location];

  id v9 = (void *)[v7 initWithLocation:v8 uncertainty:*MEMORY[0x1E4F8ADD8]];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F8A920]) initWithIdentifier:v11 locationOfInterestType:v6 typeRadius:0 routineLocation:v9 mapItemLocation:250.0];
  [*(id *)(a1 + 32) addObject:v10];
}

void __89__PGGraphIngestFrequentLocationProcessor_processFrequentLocationWithGraph_progressBlock___block_invoke_251(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.9 + 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)processAndInsertFrequentLocationWithMomentNodes:(id)a3 inGraph:(id)a4 changeRequest:(id)a5 progressBlock:(id)a6
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v53 = a4;
  id v61 = a5;
  id v50 = a6;
  uint64_t v86 = 0;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  char v90 = 0;
  uint64_t v83 = 0;
  v84 = (double *)&v83;
  uint64_t v85 = 0x2020000000;
  char v55 = _Block_copy(v50);
  if (!v55
    || (double v9 = CFAbsoluteTimeGetCurrent(), v9 - v84[3] < 0.01)
    || (v84[3] = v9,
        char v82 = 0,
        (*((void (**)(void *, char *, double))v55 + 2))(v55, &v82, 0.0),
        char v10 = *((unsigned char *)v88 + 24) | v82,
        (*((unsigned char *)v88 + 24) = v10) == 0))
  {
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __126__PGGraphIngestFrequentLocationProcessor_processAndInsertFrequentLocationWithMomentNodes_inGraph_changeRequest_progressBlock___block_invoke;
    v77[3] = &unk_1E68F03F8;
    id v52 = v55;
    id v78 = v52;
    v79 = &v83;
    v80 = &v87;
    uint64_t v81 = 0x3F847AE147AE147BLL;
    uint64_t v51 = [(PGGraphIngestFrequentLocationProcessor *)self processFrequentLocationWithGraph:v53 progressBlock:v77];
    if (*((unsigned char *)v88 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v93 = 102;
        *(_WORD *)&v93[4] = 2080;
        *(void *)&v93[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
        id v11 = MEMORY[0x1E4F14500];
LABEL_9:
        _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      unint64_t v12 = [v51 count];
      loggingConnection = self->_loggingConnection;
      BOOL v14 = os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO);
      if (v12)
      {
        if (v14)
        {
          *(_DWORD *)buf = 134217984;
          *(void *)v93 = v12;
          _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "Ingesting %tu frequent locations", buf, 0xCu);
        }
        uint64_t v48 = +[PGGraphNodeCollection nodesInGraph:v53];
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v48, "count"));
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __126__PGGraphIngestFrequentLocationProcessor_processAndInsertFrequentLocationWithMomentNodes_inGraph_changeRequest_progressBlock___block_invoke_237;
        v75[3] = &unk_1E68EF578;
        id v16 = v15;
        id v76 = v16;
        [v48 enumerateNodesUsingBlock:v75];
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        obuint64_t j = v51;
        uint64_t v57 = [obj countByEnumeratingWithState:&v71 objects:v95 count:16];
        if (v57)
        {
          double v17 = 1.0 / (double)v12;
          uint64_t v56 = *(void *)v72;
          double v18 = 0.0;
          while (2)
          {
            for (uint64_t i = 0; i != v57; ++i)
            {
              if (*(void *)v72 != v56) {
                objc_enumerationMutation(obj);
              }
              v60 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              v19 = [PGGraphFrequentLocationNode alloc];
              v20 = [v60 dateInterval];
              v62 = [(PGGraphFrequentLocationNode *)v19 initWithUniversalDateInterval:v20];

              v21 = [v60 centroid];
              uint64_t v22 = objc_msgSend(v21, "pl_uuid");
              os_signpost_id_t v23 = [v16 objectForKeyedSubscript:v22];
              v24 = [v23 bestAddressNode];

              if (!v24)
              {
                v25 = self->_loggingConnection;
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v93 = v60;
                  _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_INFO, "Failed to retrieve centroid address node for frequent location: %@. Will pick from another moment instead.", buf, 0xCu);
                }
              }
              id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v69 = 0u;
              long long v70 = 0u;
              long long v67 = 0u;
              long long v68 = 0u;
              v27 = [v60 sortedMoments];
              uint64_t v28 = [v27 countByEnumeratingWithState:&v67 objects:v94 count:16];
              if (v28)
              {
                uint64_t v29 = 0;
                uint64_t v30 = *(void *)v68;
                do
                {
                  for (uint64_t j = 0; j != v28; ++j)
                  {
                    if (*(void *)v68 != v30) {
                      objc_enumerationMutation(v27);
                    }
                    id v32 = objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * j), "pl_uuid");
                    double v33 = [v16 objectForKeyedSubscript:v32];

                    if (v33)
                    {
                      if (!v24)
                      {
                        v24 = [v33 bestAddressNode];
                      }
                      id v34 = [[PGGraphFrequentLocationInEdge alloc] initFromMomentNode:v33 toFrequentLocationNode:v62];
                      [v26 addObject:v34];
                    }
                    else
                    {
                      ++v29;
                    }
                  }
                  uint64_t v28 = [v27 countByEnumeratingWithState:&v67 objects:v94 count:16];
                }
                while (v28);

                if (v29)
                {
                  v35 = self->_loggingConnection;
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 134218242;
                    *(void *)v93 = v29;
                    *(_WORD *)&v93[8] = 2112;
                    *(void *)&v93[10] = v60;
                    _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "Failed to retrieve %tu moments for frequent location: %@", buf, 0x16u);
                  }
                }
              }
              else
              {
              }
              if (v24)
              {
                [v61 addNode:v62];
                long long v65 = 0u;
                long long v66 = 0u;
                long long v63 = 0u;
                long long v64 = 0u;
                id v36 = v26;
                uint64_t v37 = [v36 countByEnumeratingWithState:&v63 objects:v91 count:16];
                if (v37)
                {
                  uint64_t v38 = *(void *)v64;
                  do
                  {
                    for (uint64_t k = 0; k != v37; ++k)
                    {
                      if (*(void *)v64 != v38) {
                        objc_enumerationMutation(v36);
                      }
                      [v61 addEdge:*(void *)(*((void *)&v63 + 1) + 8 * k)];
                    }
                    uint64_t v37 = [v36 countByEnumeratingWithState:&v63 objects:v91 count:16];
                  }
                  while (v37);
                }

                id v40 = [[PGGraphFrequentLocationAtEdge alloc] initFromFrequentLocationNode:v62 toAddressNode:v24];
                [v61 addEdge:v40];
                double v18 = v17 + v18;
                if (v55)
                {
                  double Current = CFAbsoluteTimeGetCurrent();
                  if (Current - v84[3] >= 0.01)
                  {
                    v84[3] = Current;
                    buf[0] = 0;
                    (*((void (**)(id, uint8_t *, double))v52 + 2))(v52, buf, v18 * 0.1 + 0.9);
                    char v42 = *((unsigned char *)v88 + 24) | buf[0];
                    *((unsigned char *)v88 + 24) = v42;
                    if (v42)
                    {

                      goto LABEL_63;
                    }
                  }
                }

                id v26 = v24;
              }
              else
              {
                v43 = self->_loggingConnection;
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v93 = v60;
                  _os_log_error_impl(&dword_1D1805000, v43, OS_LOG_TYPE_ERROR, "Failed to retrieve any centroid address node for frequent location: %@; Skipping ingest",
                    buf,
                    0xCu);
                }
              }
            }
            uint64_t v57 = [obj countByEnumeratingWithState:&v71 objects:v95 count:16];
            if (v57) {
              continue;
            }
            break;
          }
        }

        if (v55)
        {
LABEL_63:
          double v46 = CFAbsoluteTimeGetCurrent();
          if (v46 - v84[3] >= 0.01)
          {
            v84[3] = v46;
            char v82 = 0;
            (*((void (**)(id, char *, double))v52 + 2))(v52, &v82, 1.0);
            char v47 = *((unsigned char *)v88 + 24) | v82;
            *((unsigned char *)v88 + 24) = v47;
            if (v47)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v93 = 164;
                *(_WORD *)&v93[4] = 2080;
                *(void *)&v93[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
            }
          }
        }

        goto LABEL_68;
      }
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "No frequent location to ingest", buf, 2u);
      }
      if (v55)
      {
        double v44 = CFAbsoluteTimeGetCurrent();
        if (v44 - v84[3] >= 0.01)
        {
          v84[3] = v44;
          char v82 = 0;
          (*((void (**)(id, char *, double))v52 + 2))(v52, &v82, 1.0);
          char v45 = *((unsigned char *)v88 + 24) | v82;
          *((unsigned char *)v88 + 24) = v45;
          if (v45)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v93 = 107;
              *(_WORD *)&v93[4] = 2080;
              *(void *)&v93[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
              id v11 = MEMORY[0x1E4F14500];
              goto LABEL_9;
            }
          }
        }
      }
    }
LABEL_68:

    goto LABEL_69;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v93 = 97;
    *(_WORD *)&v93[4] = 2080;
    *(void *)&v93[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_69:
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);
}

void __126__PGGraphIngestFrequentLocationProcessor_processAndInsertFrequentLocationWithMomentNodes_inGraph_changeRequest_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.9);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __126__PGGraphIngestFrequentLocationProcessor_processAndInsertFrequentLocationWithMomentNodes_inGraph_changeRequest_progressBlock___block_invoke_237(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 uuid];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (void)deleteFrequentLocationNodesInGraph:(id)a3 changeRequest:(id)a4
{
  id v5 = a4;
  id v6 = +[PGGraphNodeCollection nodesInGraph:a3];
  [v5 removeNodes:v6];
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  graphBuilder = self->_graphBuilder;
  id v6 = a4;
  uint64_t v7 = [(PGGraphBuilder *)graphBuilder graph];
  char v8 = self->_loggingConnection;
  os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)v8);
  char v10 = v8;
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGGraphIngestFrequentLocationProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v12 = mach_absolute_time();
  [v7 invalidateSupersetCaches];
  v13 = +[PGGraphNodeCollection nodesInGraph:v7];
  if ([(PGGraphBuilder *)self->_graphBuilder isSharedLibraryEnabled])
  {
    BOOL v14 = [(PGGraphBuilder *)self->_graphBuilder momentNodesWhereMeIsPresent];
    if ([v14 count])
    {
      id v15 = v14;

      v13 = v15;
    }
    else
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "No moments in library where Me is present. Not applying presence filtering", buf, 2u);
      }
    }
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  [(PGGraphIngestFrequentLocationProcessor *)self deleteFrequentLocationNodesInGraph:v7 changeRequest:v17];
  [(PGGraphIngestFrequentLocationProcessor *)self processAndInsertFrequentLocationWithMomentNodes:v13 inGraph:v7 changeRequest:v17 progressBlock:v6];

  [v7 executeGraphChangeRequest:v17];
  uint64_t v18 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v21 = v11;
  uint64_t v22 = v21;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v22, OS_SIGNPOST_INTERVAL_END, v9, "PGGraphIngestFrequentLocationProcessor", "", buf, 2u);
  }

  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "PGGraphIngestFrequentLocationProcessor";
    __int16 v26 = 2048;
    double v27 = (float)((float)((float)((float)(v18 - v12) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
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

- (PGGraphIngestFrequentLocationProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphIngestFrequentLocationProcessor;
  uint64_t v6 = [(PGGraphIngestFrequentLocationProcessor *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    os_log_t v8 = os_log_create("com.apple.PhotosGraph", "FrequentLocationProcessor");
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v8;
  }
  return v7;
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 6;
}

@end