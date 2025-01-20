@interface PGGraphIngestPrefetchLocationProcessor
- (BOOL)prefetchLocationsWithRegions:(id)a3 loggingConnection:(id)a4 progressBlock:(id)a5;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestPrefetchLocationProcessor)initWithGraphBuilder:(id)a3;
- (id)regionsWithMoments:(id)a3 progressBlock:(id)a4;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestPrefetchLocationProcessor

- (void).cxx_destruct
{
}

- (BOOL)prefetchLocationsWithRegions:(id)a3 loggingConnection:(id)a4 progressBlock:(id)a5
{
  v60[6] = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v8 = a4;
  id aBlock = a5;
  v9 = v8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 67109120;
    HIDWORD(buf[0]) = [v40 count];
    _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_DEFAULT, "[PGGraphIngestPrefetchLocationProcessor] Starting to prefetch locations for %d regions", (uint8_t *)buf, 8u);
  }

  v10 = (void (**)(void *, int *, double))_Block_copy(aBlock);
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  uint64_t v48 = 0;
  v49 = (double *)&v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = 0;
  if (v10)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v49[3] >= 0.01)
    {
      v49[3] = Current;
      LOBYTE(v56) = 0;
      v10[2](v10, &v56, 0.0);
      char v12 = *((unsigned char *)v53 + 24) | v56;
      *((unsigned char *)v53 + 24) = v12;
      if (v12)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          buf[0] = 0xD904000202;
          LOWORD(buf[1]) = 2080;
          *(void *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetch"
                                             "LocationProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
        }
        BOOL v13 = 0;
        goto LABEL_18;
      }
    }
  }
  if ([v40 count])
  {
    v14 = [(PGGraphBuilder *)self->_graphBuilder locationCache];
    v36 = [(PGGraphBuilder *)self->_graphBuilder aoiCache];
    v38 = [(PGGraphBuilder *)self->_graphBuilder poiCache];
    v35 = [(PGGraphBuilder *)self->_graphBuilder roiCache];
    v34 = [(PGGraphBuilder *)self->_graphBuilder natureCache];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F76D00]) initWithLocationCache:v14];
    v60[0] = v15;
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F76C40]) initWithAOICache:v36 locationCache:v14];
    v60[1] = v16;
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F76D58]) initWithPOICache:v38 locationCache:v14];
    v60[2] = v17;
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F76D60]) initWithPOICache:v38 locationCache:v14];
    v60[3] = v18;
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F76D90]) initWithROICache:v35 locationCache:v14];
    v60[4] = v19;
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F76D28]) initWithNatureCache:v34 locationCache:v14];
    v60[5] = v20;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:6];

    v21 = (void *)[objc_alloc(MEMORY[0x1E4F76D88]) initWithQueryPerformers:v37];
    [v21 setLoggingConnection:v9];
    v22 = [v40 allObjects];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __103__PGGraphIngestPrefetchLocationProcessor_prefetchLocationsWithRegions_loggingConnection_progressBlock___block_invoke;
    v43[3] = &unk_1E68F03F8;
    v23 = v10;
    v44 = v23;
    v45 = &v48;
    v46 = &v52;
    uint64_t v47 = 0x3F847AE147AE147BLL;
    id v42 = 0;
    char v24 = [v21 createCacheForRegions:v22 progressBlock:v43 error:&v42];
    id v25 = v42;

    if (*((unsigned char *)v53 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_14:
        BOOL v13 = 0;
LABEL_15:

        goto LABEL_18;
      }
      buf[0] = 0xF604000202;
      LOWORD(buf[1]) = 2080;
      *(void *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
      v26 = MEMORY[0x1E4F14500];
      v27 = (uint8_t *)buf;
LABEL_13:
      _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v27, 0x12u);
      goto LABEL_14;
    }
    uint64_t v59 = 0;
    memset(buf, 0, sizeof(buf));
    v29 = [v37 firstObject];
    v30 = v29;
    if (v29)
    {
      [v29 statistics];
    }
    else
    {
      uint64_t v59 = 0;
      memset(buf, 0, sizeof(buf));
    }

    if (buf[0])
    {
      double v31 = (double)(unint64_t)(buf[2] + buf[1]) / (double)buf[0];
      if (v31 >= 0.95)
      {
        BOOL v13 = 1;
        if (v24) {
          goto LABEL_31;
        }
LABEL_30:
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v56 = 138412290;
          v57[0] = v25;
          _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "error creating the location cache: %@", (uint8_t *)&v56, 0xCu);
          if (!v10) {
            goto LABEL_15;
          }
LABEL_32:
          double v32 = CFAbsoluteTimeGetCurrent();
          if (v32 - v49[3] < 0.01) {
            goto LABEL_15;
          }
          v49[3] = v32;
          char v41 = 0;
          v23[2](v23, (int *)&v41, 1.0);
          char v33 = *((unsigned char *)v53 + 24) | v41;
          *((unsigned char *)v53 + 24) = v33;
          if (!v33) {
            goto LABEL_15;
          }
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_14;
          }
          int v56 = 67109378;
          LODWORD(v57[0]) = 267;
          WORD2(v57[0]) = 2080;
          *(void *)((char *)v57 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
          v26 = MEMORY[0x1E4F14500];
          v27 = (uint8_t *)&v56;
          goto LABEL_13;
        }
LABEL_31:
        if (!v10) {
          goto LABEL_15;
        }
        goto LABEL_32;
      }
    }
    else
    {
      double v31 = 0.0;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v56 = 134218240;
      *(double *)v57 = v31;
      LOWORD(v57[1]) = 2048;
      *(void *)((char *)&v57[1] + 2) = 0x3FEE666666666666;
      _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "Cannot use the domain location because the resolved location ratio is too small: %f <= %f", (uint8_t *)&v56, 0x16u);
    }
    BOOL v13 = 0;
    if (v24) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  BOOL v13 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "No location to resolve, returning YES to prefetch location succeeded", (uint8_t *)buf, 2u);
  }
LABEL_18:
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

  return v13;
}

void __103__PGGraphIngestPrefetchLocationProcessor_prefetchLocationsWithRegions_loggingConnection_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.75);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)regionsWithMoments:(id)a3 progressBlock:(id)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id aBlock = a4;
  v6 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = [v48 count];
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "[PGGraphIngestPrefetchLocationProcessor] Starting to cluster %d moments", (uint8_t *)&buf, 8u);
  }

  v49 = _Block_copy(aBlock);
  v46 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t buf = 0;
  p_uint64_t buf = &buf;
  uint64_t v84 = 0x2020000000;
  char v85 = 0;
  uint64_t v72 = 0;
  v73 = (double *)&v72;
  uint64_t v74 = 0x2020000000;
  uint64_t v75 = 0;
  if (!v49
    || (double v7 = CFAbsoluteTimeGetCurrent(), v7 - v73[3] < 0.01)
    || (v73[3] = v7,
        LOBYTE(v70[0]) = 0,
        (*((void (**)(void *, void *, double))v49 + 2))(v49, v70, 0.0),
        char v8 = *((unsigned char *)p_buf + 24) | LOBYTE(v70[0]),
        (*((unsigned char *)p_buf + 24) = v8) == 0))
  {
    v10 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
    os_signpost_id_t v11 = os_signpost_id_generate(v10);
    char v12 = v10;
    BOOL v13 = v12;
    os_signpost_id_t spid = v11;
    unint64_t v14 = v11 - 1;
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(v79) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v13, OS_SIGNPOST_INTERVAL_BEGIN, spid, "RegionsWithMoments", "", (uint8_t *)&v79, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v43 = mach_absolute_time();
    v15 = [MEMORY[0x1E4F1CA80] set];
    id v16 = objc_alloc(MEMORY[0x1E4F8E768]);
    v17 = [(PGGraphBuilder *)self->_graphBuilder photoLibrary];
    v18 = (void *)[v16 initWithPhotoLibrary:v17];

    v19 = [(PGGraphBuilder *)self->_graphBuilder serviceManager];
    if (!v19) {
      __assert_rtn("-[PGGraphIngestPrefetchLocationProcessor regionsWithMoments:progressBlock:]", "PGGraphIngestPrefetchLocationProcessor.m", 110, "serviceManager != nil");
    }
    uint64_t v79 = 0;
    *(void *)&long long v80 = &v79;
    *((void *)&v80 + 1) = 0x2020000000;
    uint64_t v81 = 0;
    unint64_t v20 = [v48 count];
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    v70[3] = 0;
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    CFAbsoluteTime Current = 0.0;
    double v21 = 1.0 / (double)v20;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __75__PGGraphIngestPrefetchLocationProcessor_regionsWithMoments_progressBlock___block_invoke;
    v55[3] = &unk_1E68F03D0;
    v61 = v70;
    v22 = v13;
    int v56 = v22;
    v62 = v68;
    id v23 = v49;
    id v60 = v23;
    v63 = &v72;
    v64 = &v79;
    v65 = &buf;
    uint64_t v66 = 0x3F847AE147AE147BLL;
    id v24 = v18;
    id v57 = v24;
    double v67 = v21;
    id v25 = v15;
    id v58 = v25;
    id v26 = v19;
    id v59 = v26;
    [v48 enumerateObjectsUsingBlock:v55];
    id v42 = (void (**)(id, unsigned char *, double))v23;
    [v26 fetchImportantLocationsOfInterest];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [v27 countByEnumeratingWithState:&v51 objects:v78 count:16];
    v45 = v24;
    if (v28)
    {
      uint64_t v29 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v52 != v29) {
            objc_enumerationMutation(v27);
          }
          double v31 = [*(id *)(*((void *)&v51 + 1) + 8 * i) placemarkRegion];
          if (v31) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v51 objects:v78 count:16];
      }
      while (v28);
    }

    uint64_t v32 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v35 = v22;
    v36 = v35;
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      LOWORD(v76) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v36, OS_SIGNPOST_INTERVAL_END, spid, "RegionsWithMoments", "", (uint8_t *)&v76, 2u);
    }

    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      int v76 = 136315394;
      v77[0] = "RegionsWithMoments";
      LOWORD(v77[1]) = 2048;
      *(double *)((char *)&v77[1] + 2) = (float)((float)((float)((float)(v32 - v43) * (float)numer) / (float)denom)
                                               / 1000000.0);
      _os_log_impl(&dword_1D1805000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v76, 0x16u);
    }
    if (*((unsigned char *)p_buf + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v76 = 67109378;
        LODWORD(v77[0]) = 205;
        WORD2(v77[0]) = 2080;
        *(void *)((char *)v77 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
        v37 = MEMORY[0x1E4F14500];
LABEL_30:
        _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v76, 0x12u);
      }
    }
    else
    {
      if (!v49
        || (double v39 = CFAbsoluteTimeGetCurrent(), v39 - v73[3] < 0.01)
        || (v73[3] = v39,
            char v50 = 0,
            v42[2](v42, &v50, 1.0),
            char v40 = *((unsigned char *)p_buf + 24) | v50,
            (*((unsigned char *)p_buf + 24) = v40) == 0))
      {
        id v38 = v25;
        goto LABEL_38;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v76 = 67109378;
        LODWORD(v77[0]) = 207;
        WORD2(v77[0]) = 2080;
        *(void *)((char *)v77 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
        v37 = MEMORY[0x1E4F14500];
        goto LABEL_30;
      }
    }
    id v38 = v46;
LABEL_38:
    id v9 = v38;

    _Block_object_dispose(v68, 8);
    _Block_object_dispose(v70, 8);
    _Block_object_dispose(&v79, 8);

    goto LABEL_39;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v79 = 0x6504000202;
    LOWORD(v80) = 2080;
    *(void *)((char *)&v80 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v79, 0x12u);
  }
  id v9 = v46;
LABEL_39:
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&buf, 8);

  return v9;
}

void __75__PGGraphIngestPrefetchLocationProcessor_regionsWithMoments_progressBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v7 = *(void *)(v6 + 24);
  if (0x8F5C28F5C28F5C29 * v7 <= 0xA3D70A3D70A3D70)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    id v9 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      double v26 = Current - *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      *(_DWORD *)uint64_t buf = 67109632;
      int v40 = v25;
      __int16 v41 = 1024;
      int v42 = 25;
      __int16 v43 = 2048;
      double v44 = v26;
      _os_log_debug_impl(&dword_1D1805000, v9, OS_LOG_TYPE_DEBUG, "[PGGraphIngestPrefetchLocationProcessor] Clustered %d moments, batch of %d took %.2f seconds", buf, 0x18u);
    }
    *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = Current;
    uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v7 = *(void *)(v6 + 24);
  }
  *(void *)(v6 + 24) = v7 + 1;
  v10 = (void *)MEMORY[0x1D25FED50]();
  if (*(void *)(a1 + 64)
    && (double v11 = CFAbsoluteTimeGetCurrent(),
        uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8),
        v11 - *(double *)(v12 + 24) >= *(double *)(a1 + 112))
    && (*(double *)(v12 + 24) = v11,
        buf[0] = 0,
        (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) |= buf[0]) != 0))
  {
    *a3 = 1;
  }
  else
  {
    BOOL v13 = [v5 photoLibrary];
    unint64_t v14 = [v13 librarySpecificFetchOptions];

    uint64_t v15 = *MEMORY[0x1E4F39528];
    v38[0] = *MEMORY[0x1E4F39448];
    v38[1] = v15;
    uint64_t v16 = *MEMORY[0x1E4F39440];
    v38[2] = *MEMORY[0x1E4F394C8];
    v38[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
    [v14 setFetchPropertySets:v17];

    v18 = [MEMORY[0x1E4F76C98] feederPrefetchOptionsWithDefaultMode:0];
    [v18 setLocationPrefetchMode:2];
    v19 = [MEMORY[0x1E4F76CF0] feederForAssetCollection:v5 options:v14 feederPrefetchOptions:v18 curationContext:*(void *)(a1 + 40)];
    [v19 setLocationClusteringAlgorithm:0];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __75__PGGraphIngestPrefetchLocationProcessor_regionsWithMoments_progressBlock___block_invoke_246;
    v31[3] = &unk_1E68F0380;
    uint64_t v33 = *(void *)(a1 + 96);
    uint64_t v36 = *(void *)(a1 + 120);
    id v20 = *(id *)(a1 + 64);
    uint64_t v21 = *(void *)(a1 + 88);
    id v32 = v20;
    uint64_t v37 = *(void *)(a1 + 112);
    uint64_t v22 = *(void *)(a1 + 104);
    uint64_t v34 = v21;
    uint64_t v35 = v22;
    id v23 = [v19 locationClustersWithProgressBlock:v31];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24))
    {
      *a3 = 1;
    }
    else
    {
      [v5 gpsHorizontalAccuracy];
      char v24 = objc_msgSend(MEMORY[0x1E4F8A930], "horizontalAccuracyIsCoarse:") ^ 1;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __75__PGGraphIngestPrefetchLocationProcessor_regionsWithMoments_progressBlock___block_invoke_2;
      v27[3] = &unk_1E68F03A8;
      id v28 = *(id *)(a1 + 48);
      char v30 = v24;
      id v29 = *(id *)(a1 + 56);
      [v23 enumerateKeysAndObjectsUsingBlock:v27];
      *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(double *)(a1 + 120)
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                              + 24);
    }
  }
}

void __75__PGGraphIngestPrefetchLocationProcessor_regionsWithMoments_progressBlock___block_invoke_246(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    double v7 = *(double *)(a1 + 64);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6 + v7 * a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __75__PGGraphIngestPrefetchLocationProcessor_regionsWithMoments_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) addObject:v5];
  if (*(unsigned char *)(a1 + 48) && [v6 count])
  {
    id v27 = v5;
    double v7 = [v6 firstObject];
    char v8 = objc_msgSend(v7, "cls_universalDate");

    id v9 = v8;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v26 = v6;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      unint64_t v14 = v9;
      do
      {
        uint64_t v15 = 0;
        uint64_t v16 = v9;
        v17 = v14;
        do
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v15), "cls_universalDate", v26);
          unint64_t v14 = [v17 earlierDate:v18];

          id v9 = [v16 laterDate:v18];

          ++v15;
          uint64_t v16 = v9;
          v17 = v14;
        }
        while (v12 != v15);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v12);
    }
    else
    {
      unint64_t v14 = v9;
    }

    id v6 = v26;
    id v5 = v27;
    if (v14 && v9)
    {
      v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v14 endDate:v9];
      id v20 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      [v27 center];
      double v22 = v21;
      [v27 center];
      id v23 = objc_msgSend(v20, "initWithLatitude:longitude:", v22);
      char v24 = [*(id *)(a1 + 40) locationOfInterestCloseToLocation:v23 inDateInterval:v19];
      uint64_t v25 = [v24 placemarkRegion];
      if (v25) {
        [*(id *)(a1 + 32) addObject:v25];
      }
    }
  }
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  *(void *)((char *)&v57[2] + 4) = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v34 = a4;
  id v6 = _Block_copy(v34);
  uint64_t v52 = 0;
  long long v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  uint64_t v48 = 0;
  v49 = (double *)&v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = 0;
  if (!v6
    || (double v7 = CFAbsoluteTimeGetCurrent(), v7 - v49[3] < 0.01)
    || (v49[3] = v7,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v6 + 2))(v6, &info, 0.0),
        char v8 = *((unsigned char *)v53 + 24) | LOBYTE(info.numer),
        (*((unsigned char *)v53 + 24) = v8) == 0))
  {
    id v9 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
    os_signpost_id_t v10 = os_signpost_id_generate(v9);
    uint64_t v11 = v9;
    uint64_t v12 = v11;
    os_signpost_id_t spid = v10;
    unint64_t v13 = v10 - 1;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v12, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PGGraphIngestPrefetchLocationProcessor", "", (uint8_t *)&buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v30 = mach_absolute_time();
    uint64_t v14 = [v35 momentsToProcessForMomentUpdateTypes:4 includeMomentsToIngest:1];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __75__PGGraphIngestPrefetchLocationProcessor_runWithGraphUpdate_progressBlock___block_invoke;
    v42[3] = &unk_1E68F03F8;
    id v15 = v6;
    id v43 = v15;
    double v44 = &v48;
    uint64_t v45 = &v52;
    uint64_t v46 = 0x3F847AE147AE147BLL;
    uint64_t v33 = (void *)v14;
    uint64_t v16 = [(PGGraphIngestPrefetchLocationProcessor *)self regionsWithMoments:v14 progressBlock:v42];
    if (*((unsigned char *)v53 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int buf = 67109378;
        LODWORD(v57[0]) = 73;
        WORD2(v57[0]) = 2080;
        *(void *)((char *)v57 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
      goto LABEL_31;
    }
    long long v31 = [v35 additionalLocationsToPrefetch];
    if (v31)
    {
      v17 = [v35 additionalLocationsToPrefetch];
      uint64_t v18 = [v16 setByAddingObjectsFromSet:v17];

      uint64_t v16 = (void *)v18;
    }
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __75__PGGraphIngestPrefetchLocationProcessor_runWithGraphUpdate_progressBlock___block_invoke_237;
    v37[3] = &unk_1E68F03F8;
    id v19 = v15;
    id v38 = v19;
    double v39 = &v48;
    int v40 = &v52;
    uint64_t v41 = 0x3F847AE147AE147BLL;
    BOOL v20 = [(PGGraphIngestPrefetchLocationProcessor *)self prefetchLocationsWithRegions:v16 loggingConnection:v12 progressBlock:v37];
    if (*((unsigned char *)v53 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
      int buf = 67109378;
      LODWORD(v57[0]) = 85;
      WORD2(v57[0]) = 2080;
      *(void *)((char *)v57 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
      double v21 = MEMORY[0x1E4F14500];
    }
    else
    {
      BOOL v22 = v20;
      if ([v35 isResumingFullAnalysis]) {
        [(PGGraphBuilder *)self->_graphBuilder setCanUseLocationDomain:v22];
      }
      uint64_t v23 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      id v26 = v12;
      id v27 = v26;
      if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v27, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestPrefetchLocationProcessor", "", (uint8_t *)&buf, 2u);
      }

      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        int buf = 136315394;
        v57[0] = "PGGraphIngestPrefetchLocationProcessor";
        LOWORD(v57[1]) = 2048;
        *(double *)((char *)&v57[1] + 2) = (float)((float)((float)((float)(v23 - v30) * (float)numer) / (float)denom)
                                                 / 1000000.0);
        _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
      }
      if (!v6) {
        goto LABEL_30;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v49[3] < 0.01) {
        goto LABEL_30;
      }
      v49[3] = Current;
      char v36 = 0;
      (*((void (**)(id, char *, double))v19 + 2))(v19, &v36, 1.0);
      char v29 = *((unsigned char *)v53 + 24) | v36;
      *((unsigned char *)v53 + 24) = v29;
      if (!v29 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_30;
      }
      int buf = 67109378;
      LODWORD(v57[0]) = 93;
      WORD2(v57[0]) = 2080;
      *(void *)((char *)v57 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
      double v21 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    goto LABEL_30;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int buf = 67109378;
    LODWORD(v57[0]) = 57;
    WORD2(v57[0]) = 2080;
    *(void *)((char *)v57 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_32:
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
}

void __75__PGGraphIngestPrefetchLocationProcessor_runWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.2);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __75__PGGraphIngestPrefetchLocationProcessor_runWithGraphUpdate_progressBlock___block_invoke_237(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.8 + 0.2);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3 = a3;
  if ([v3 hasMomentsToInsert])
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    id v5 = [v3 additionalLocationsToPrefetch];
    if ([v5 count]) {
      LOBYTE(v4) = 1;
    }
    else {
      unint64_t v4 = ((unint64_t)[v3 momentUpdateTypes] >> 2) & 1;
    }
  }
  return v4;
}

- (PGGraphIngestPrefetchLocationProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestPrefetchLocationProcessor;
  id v6 = [(PGGraphIngestPrefetchLocationProcessor *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
  }

  return v7;
}

@end