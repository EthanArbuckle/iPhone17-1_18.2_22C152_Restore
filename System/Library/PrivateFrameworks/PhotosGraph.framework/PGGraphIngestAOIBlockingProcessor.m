@interface PGGraphIngestAOIBlockingProcessor
+ (unint64_t)requiredMomentUpdateTypes;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestAOIBlockingProcessor)initWithGraphBuilder:(id)a3;
- (void)processAOIBlockingWithAOINodes:(id)a3 graph:(id)a4 loggingConnection:(id)a5 progressBlock:(id)a6;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestAOIBlockingProcessor

- (void).cxx_destruct
{
}

- (void)processAOIBlockingWithAOINodes:(id)a3 graph:(id)a4 loggingConnection:(id)a5 progressBlock:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = _Block_copy(v12);
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v33 = 0;
  v34 = (double *)&v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  if (v13
    && (double v14 = CFAbsoluteTimeGetCurrent(), v14 - v34[3] >= 0.01)
    && (v34[3] = v14,
        LOBYTE(v41[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v13 + 2))(v13, v41, 0.0),
        char v15 = *((unsigned char *)v38 + 24) | LOBYTE(v41[0]),
        (*((unsigned char *)v38 + 24) = v15) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 0x4C04000202;
      LOWORD(v45) = 2080;
      *(void *)((char *)&v45 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestAOIBlockingProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t buf = 0;
    *(void *)&long long v45 = &buf;
    *((void *)&v45 + 1) = 0x2020000000;
    uint64_t v46 = 0;
    unint64_t v17 = [v9 count];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke;
    v23[3] = &unk_1E68EDE00;
    p_uint64_t buf = &buf;
    double v31 = (double)v17;
    id v18 = v13;
    id v27 = v18;
    v29 = &v33;
    uint64_t v32 = 0x3F847AE147AE147BLL;
    v30 = &v37;
    id v19 = v16;
    id v24 = v19;
    id v25 = v10;
    id v26 = v11;
    [v9 enumerateNodesUsingBlock:v23];
    if (v13)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v34[3] >= 0.01)
      {
        v34[3] = Current;
        char v22 = 0;
        (*((void (**)(id, char *, double))v18 + 2))(v18, &v22, 1.0);
        char v21 = *((unsigned char *)v38 + 24) | v22;
        *((unsigned char *)v38 + 24) = v21;
        if (v21)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            v41[0] = 67109378;
            v41[1] = 238;
            __int16 v42 = 2080;
            v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Ingest/Ingest Processing/PGGraphIngestAOIBlockingProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v41, 0x12u);
          }
        }
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
}

void __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  double v7 = *(double *)(v6 + 24);
  double v8 = *(double *)(a1 + 88);
  *(double *)(v6 + 24) = v7 + 1.0;
  if (!*(void *)(a1 + 56)
    || (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8),
        Current - *(double *)(v10 + 24) < *(double *)(a1 + 96))
    || (*(double *)(v10 + 24) = Current,
        buf[0] = 0,
        (*(void (**)(double))(*(void *)(a1 + 56) + 16))(v7 / v8),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                               + 24)) == 0))
  {
    if ([v5 isBlocked]) {
      goto LABEL_49;
    }
    id v11 = (void *)MEMORY[0x1D25FED50]();
    uint64_t v85 = 0;
    v86 = &v85;
    uint64_t v87 = 0x2020000000;
    uint64_t v88 = 0;
    uint64_t v81 = 0;
    v82 = &v81;
    uint64_t v83 = 0x2020000000;
    uint64_t v84 = 0;
    id v12 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x2020000000;
    char v80 = 0;
    uint64_t v73 = 0;
    v74 = &v73;
    uint64_t v75 = 0x2020000000;
    char v76 = 0;
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2020000000;
    uint64_t v72 = 0;
    v13 = [v5 collection];
    double v14 = [v13 addressNodes];

    unint64_t v15 = [v14 count];
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    v68[3] = 0;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke_2;
    v52[3] = &unk_1E68EDDD8;
    v58 = v68;
    uint64_t v16 = *(void *)(a1 + 88);
    double v65 = (double)v15;
    uint64_t v66 = v16;
    long long v50 = *(_OWORD *)(a1 + 56);
    id v17 = (id)v50;
    long long v57 = v50;
    uint64_t v67 = *(void *)(a1 + 96);
    long long v59 = *(_OWORD *)(a1 + 72);
    id v18 = v14;
    id v53 = v18;
    v60 = &v77;
    v61 = &v73;
    id v19 = v5;
    id v54 = v19;
    v62 = &v69;
    id v20 = v12;
    id v55 = v20;
    id v56 = *(id *)(a1 + 32);
    v63 = &v81;
    v64 = &v85;
    [v18 enumerateNodesUsingBlock:v52];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      *a3 = 1;
LABEL_48:

      _Block_object_dispose(v68, 8);
      _Block_object_dispose(&v69, 8);
      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(&v77, 8);

      _Block_object_dispose(&v81, 8);
      _Block_object_dispose(&v85, 8);
      goto LABEL_49;
    }
    unint64_t v21 = v86[3];
    unint64_t v22 = v82[3];
    double v23 = (double)v21 / (double)v22;
    BOOL v24 = (double)(unint64_t)v70[3] / (double)v21 >= 0.4 && v21 > 1;
    int v25 = v24;
    BOOL v26 = v24 || *((unsigned char *)v74 + 24) != 0;
    BOOL v27 = v23 < 0.95 || v22 == 0;
    int v28 = !v27;
    LODWORD(v50) = v28;
    unsigned __int8 v29 = *((unsigned char *)v78 + 24);
    BOOL v30 = !v27 && v26;
    char v31 = objc_msgSend(v19, "isBlocked", (void)v50);
    if (v29 | v30) {
      char v32 = v31;
    }
    else {
      char v32 = 1;
    }
    if (v32)
    {
      if (!(v29 | v30))
      {
        uint64_t v33 = *(id *)(a1 + 48);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v42 = [v19 name];
          v43 = (void *)v42;
          v44 = @"YES";
          if (*((unsigned char *)v78 + 24)) {
            long long v45 = @"YES";
          }
          else {
            long long v45 = @"NO";
          }
          if (*((unsigned char *)v74 + 24)) {
            uint64_t v46 = @"YES";
          }
          else {
            uint64_t v46 = @"NO";
          }
          if (v25) {
            uint64_t v47 = @"YES";
          }
          else {
            uint64_t v47 = @"NO";
          }
          uint64_t v48 = v86[3];
          if (!v51) {
            v44 = @"NO";
          }
          uint64_t v49 = v82[3];
          *(_DWORD *)uint64_t buf = 138414082;
          uint64_t v90 = v42;
          __int16 v91 = 2112;
          v92 = @"NO";
          __int16 v93 = 2112;
          v94 = v45;
          __int16 v95 = 2112;
          v96 = v46;
          __int16 v97 = 2112;
          v98 = v47;
          __int16 v99 = 2112;
          v100 = v44;
          __int16 v101 = 2048;
          uint64_t v102 = v48;
          __int16 v103 = 2048;
          uint64_t v104 = v49;
          _os_log_debug_impl(&dword_1D1805000, v33, OS_LOG_TYPE_DEBUG, "Not blocking AOI %@: %@ (isVeryLarge %@, isUrban %@, hasManyAOIsAtSharedAddresses %@, isMatchingAddressRatio %@ (#AOI:%lu #Country:%lu))", buf, 0x52u);
        }
LABEL_47:

        goto LABEL_48;
      }
    }
    else
    {
      +[PGGraphAreaNode setIsBlocked:onNodeForIdentifier:inGraph:](PGGraphAreaNode, "setIsBlocked:onNodeForIdentifier:inGraph:", 1, [v19 identifier], *(void *)(a1 + 40));
    }
    uint64_t v33 = *(id *)(a1 + 48);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = [v19 name];
      uint64_t v35 = (void *)v34;
      uint64_t v36 = @"NO";
      if (*((unsigned char *)v78 + 24)) {
        uint64_t v37 = @"YES";
      }
      else {
        uint64_t v37 = @"NO";
      }
      if (*((unsigned char *)v74 + 24)) {
        v38 = @"YES";
      }
      else {
        v38 = @"NO";
      }
      if (v25) {
        uint64_t v39 = @"YES";
      }
      else {
        uint64_t v39 = @"NO";
      }
      uint64_t v40 = v86[3];
      if (v51) {
        uint64_t v36 = @"YES";
      }
      uint64_t v41 = v82[3];
      *(_DWORD *)uint64_t buf = 138414082;
      uint64_t v90 = v34;
      __int16 v91 = 2112;
      v92 = @"YES";
      __int16 v93 = 2112;
      v94 = v37;
      __int16 v95 = 2112;
      v96 = v38;
      __int16 v97 = 2112;
      v98 = v39;
      __int16 v99 = 2112;
      v100 = v36;
      __int16 v101 = 2048;
      uint64_t v102 = v40;
      __int16 v103 = 2048;
      uint64_t v104 = v41;
      _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "Blocking AOI %@: %@ (isVeryLarge %@, isUrban %@, hasManyAOIsAtSharedAddresses %@, isMatchingAddressRatio %@ (#AOI:%lu #Country:%lu))", buf, 0x52u);
    }
    goto LABEL_47;
  }
  *a3 = 1;
LABEL_49:
}

void __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  double v6 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8);
  double v8 = *(double *)(v7 + 24);
  double v10 = *(double *)(a1 + 144);
  double v9 = *(double *)(a1 + 152);
  *(double *)(v7 + 24) = v8 + 1.0;
  if (*(void *)(a1 + 64)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8),
        Current - *(double *)(v12 + 24) >= *(double *)(a1 + 160))
    && (*(double *)(v12 + 24) = Current,
        char v46 = 0,
        (*(void (**)(double))(*(void *)(a1 + 64) + 16))((v6 + v8 / v10) / v9),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    v13 = (void *)MEMORY[0x1D25FED50]();
    [v5 coordinate];
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    id v18 = *(void **)(a1 + 32);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    _DWORD v41[2] = __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke_3;
    v41[3] = &unk_1E68EDDB0;
    id v19 = v5;
    uint64_t v44 = v15;
    uint64_t v45 = v17;
    uint64_t v20 = *(void *)(a1 + 104);
    id v42 = v19;
    uint64_t v43 = v20;
    [v18 enumerateNodesUsingBlock:v41];
    *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24))
    {
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
      {
        unint64_t v21 = [v19 collection];
        unint64_t v22 = [v21 momentNodes];
        double v23 = [v22 urbanRoiNodes];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = [v23 isEmpty] ^ 1;
      }
      BOOL v24 = [v19 collection];
      int v25 = [v24 areaNodes];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke_4;
      v38[3] = &unk_1E68EE470;
      id v26 = *(id *)(a1 + 40);
      uint64_t v27 = *(void *)(a1 + 120);
      id v39 = v26;
      uint64_t v40 = v27;
      [v25 enumerateNodesUsingBlock:v38];

      int v28 = [v19 collection];
      unsigned __int8 v29 = [v28 countryNodes];
      BOOL v30 = [v29 anyNode];

      if (v30 && ([*(id *)(a1 + 48) containsObject:v30] & 1) == 0)
      {
        [*(id *)(a1 + 48) addObject:v30];
        char v31 = [v30 UUID];
        if (v31
          && ([*(id *)(a1 + 56) objectForKeyedSubscript:v31],
              char v32 = objc_claimAutoreleasedReturnValue(),
              uint64_t v33 = [v32 unsignedIntegerValue],
              v32))
        {
          uint64_t v34 = v33;
        }
        else
        {
          uint64_t v35 = [v30 collection];
          uint64_t v36 = [v35 addressNodes];
          uint64_t v34 = [v36 count];

          if (v31)
          {
            uint64_t v37 = [NSNumber numberWithUnsignedInteger:v34];
            [*(id *)(a1 + 56) setObject:v37 forKeyedSubscript:v31];
          }
          char v32 = 0;
        }
        *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) += v34;
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24);
    }
  }
}

void __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  double v6 = (void *)MEMORY[0x1D25FED50]();
  if (([*(id *)(a1 + 32) isSameNodeAsNode:v5] & 1) == 0)
  {
    [v5 coordinate];
    CLLocationCoordinate2DGetDistanceFrom();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7 >= 250000.0;
    *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

uint64_t __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isSameNodeAsNode:*(void *)(a1 + 32)];
  if ((result & 1) == 0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(PGGraphBuilder *)self->_graphBuilder graph];
  double v9 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  id v11 = v9;
  uint64_t v12 = v11;
  unint64_t v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGGraphIngestAOIBlockingProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v14 = mach_absolute_time();
  unsigned __int8 v29 = self;
  if ([v6 isResumingFullAnalysis])
  {
    uint64_t v15 = +[PGGraphNodeCollection nodesInGraph:v8];
  }
  else
  {
    uint64_t v16 = objc_msgSend(v6, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v8, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);
    [v16 addressNodes];
    unint64_t v17 = v10 - 1;
    id v18 = v8;
    os_signpost_id_t v19 = v10;
    id v20 = v6;
    uint64_t v21 = v14;
    v23 = id v22 = v7;
    uint64_t v15 = [v23 areaNodes];

    id v7 = v22;
    uint64_t v14 = v21;
    id v6 = v20;
    os_signpost_id_t v10 = v19;
    double v8 = v18;
    unint64_t v13 = v17;
  }
  if (objc_msgSend(v15, "count", v29)) {
    [v30 processAOIBlockingWithAOINodes:v15 graph:v8 loggingConnection:v12 progressBlock:v7];
  }
  uint64_t v24 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v27 = v12;
  int v28 = v27;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v28, OS_SIGNPOST_INTERVAL_END, v10, "PGGraphIngestAOIBlockingProcessor", "", buf, 2u);
  }

  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 136315394;
    uint64_t v33 = "PGGraphIngestAOIBlockingProcessor";
    __int16 v34 = 2048;
    double v35 = (float)((float)((float)((float)(v24 - v14) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3 = a3;
  if ([v3 isResumingFullAnalysis] & 1) != 0 || (objc_msgSend(v3, "hasMomentsToInsert"))
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

- (PGGraphIngestAOIBlockingProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestAOIBlockingProcessor;
  id v6 = [(PGGraphIngestAOIBlockingProcessor *)&v9 init];
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