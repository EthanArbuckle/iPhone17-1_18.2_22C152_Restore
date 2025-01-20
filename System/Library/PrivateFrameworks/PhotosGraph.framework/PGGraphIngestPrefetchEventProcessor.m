@interface PGGraphIngestPrefetchEventProcessor
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestPrefetchEventProcessor)initWithGraphBuilder:(id)a3;
- (void)prefetchEventsWithSortedMomentNodes:(id)a3 locationsToPrefetch:(id *)a4 progressBlock:(id)a5;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestPrefetchEventProcessor

- (void).cxx_destruct
{
}

- (void)prefetchEventsWithSortedMomentNodes:(id)a3 locationsToPrefetch:(id *)a4 progressBlock:(id)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v7 = a5;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  char v78 = 0;
  uint64_t v71 = 0;
  v72 = (double *)&v71;
  uint64_t v73 = 0x2020000000;
  uint64_t v74 = 0;
  v62 = (void (**)(void *, uint8_t *, double))_Block_copy(v7);
  v53 = v7;
  if (!v62
    || (double v8 = CFAbsoluteTimeGetCurrent(), v8 - v72[3] < 0.01)
    || (v72[3] = v8,
        v79[0] = 0,
        v62[2](v62, v79, 0.0),
        char v9 = *((unsigned char *)v76 + 24) | v79[0],
        (*((unsigned char *)v76 + 24) = v9) == 0))
  {
    id v59 = [MEMORY[0x1E4F1CA80] set];
    v10 = [v61 firstObject];
    v58 = [v10 startDate];

    v11 = [v61 lastObject];
    v57 = [v11 endDate];

    v12 = +[PGLogging sharedLogging];
    v13 = [v12 loggingConnection];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v58;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v57;
      _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_DEFAULT, "[IngestPrefetchEventProcessor] First Moment starts at %@, Last Moment ends at %@", buf, 0x16u);
    }

    int v56 = 0;
    if (!v58 || !v57) {
      goto LABEL_43;
    }
    v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1577880000.0];
    v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:31557600.0];
    v51 = [v14 laterDate:v58];
    v16 = [v15 earlierDate:v57];
    [v51 timeIntervalSinceDate:v16];
    v60 = v16;
    v49 = v14;
    v50 = v15;
    if (v17 >= 0.0)
    {
      v40 = +[PGLogging sharedLogging];
      v41 = [v40 loggingConnection];

      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        *(void *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 2112;
        v84 = v58;
        __int16 v85 = 2112;
        v86 = v57;
        _os_log_impl(&dword_1D1805000, v41, OS_LOG_TYPE_DEFAULT, "[IngestPrefetchEventProcessor] prefetchStartDate [%@] is later date than prefetchEndDate [%@] because firstMomentUniversalStartDate was %@ and lastMomentUniversalEndDate was %@.", buf, 0x2Au);
      }

      if (v62)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        v43 = v16;
        if (Current - v72[3] >= 0.01)
        {
          v72[3] = Current;
          v79[0] = 0;
          v62[2](v62, v79, 1.0);
          char v44 = *((unsigned char *)v76 + 24) | v79[0];
          *((unsigned char *)v76 + 24) = v44;
          if (v44)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = 92;
              *(_WORD *)&buf[8] = 2080;
              *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchEventProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
        int v56 = 0;
        int v39 = 1;
LABEL_42:

        if (v39)
        {
LABEL_52:

          goto LABEL_53;
        }
LABEL_43:
        v45 = +[PGLogging sharedLogging];
        v46 = [v45 loggingConnection];

        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v56;
          _os_log_impl(&dword_1D1805000, v46, OS_LOG_TYPE_INFO, "[IngestPrefetchEventProcessor] Prefetched %d events in all", buf, 8u);
        }

        if (a4) {
          *a4 = v59;
        }
        if (v62)
        {
          double v47 = CFAbsoluteTimeGetCurrent();
          if (v47 - v72[3] >= 0.01)
          {
            v72[3] = v47;
            v79[0] = 0;
            v62[2](v62, v79, 1.0);
            char v48 = *((unsigned char *)v76 + 24) | v79[0];
            *((unsigned char *)v76 + 24) = v48;
            if (v48)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = 151;
                *(_WORD *)&buf[8] = 2080;
                *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchEventProcessor.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
            }
          }
        }
        goto LABEL_52;
      }
      int v56 = 0;
      int v39 = 1;
    }
    else
    {
      [v16 timeIntervalSinceDate:v51];
      double v19 = v18;
      v54 = [(PGGraphBuilder *)self->_graphBuilder serviceManager];
      if (!v54) {
        __assert_rtn("-[PGGraphIngestPrefetchEventProcessor prefetchEventsWithSortedMomentNodes:locationsToPrefetch:progressBlock:]", "PGGraphIngestPrefetchEventProcessor.m", 99, "serviceManager != nil");
      }
      id v20 = v51;
      int v56 = 0;
      v21 = MEMORY[0x1E4F14500];
      id v55 = v20;
      while (v20 && [v20 compare:v16] == -1)
      {
        v22 = (void *)MEMORY[0x1D25FED50]();
        v23 = [MEMORY[0x1E4F76C68] dateByAddingMonths:6 toDate:v20];
        v24 = [v23 earlierDate:v60];

        [v20 timeIntervalSinceDate:v55];
        double v26 = v25 / v19;
        if (v62
          && (double v27 = CFAbsoluteTimeGetCurrent(), v27 - v72[3] >= 0.01)
          && (v72[3] = v27,
              v79[0] = 0,
              v62[2](v62, v79, v26),
              char v28 = *((unsigned char *)v76 + 24) | v79[0],
              (*((unsigned char *)v76 + 24) = v28) != 0))
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = 110;
            *(_WORD *)&buf[8] = 2080;
            *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchEventProcessor.m";
            _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          int v29 = 1;
        }
        else
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          v84 = 0;
          v30 = [v20 dateByAddingTimeInterval:-0.001];
          v31 = [v24 dateByAddingTimeInterval:0.001];
          v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate >= %@) AND (startDate <= %@)", v30, v31];
          v33 = [v61 filteredArrayUsingPredicate:v32];

          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __109__PGGraphIngestPrefetchEventProcessor_prefetchEventsWithSortedMomentNodes_locationsToPrefetch_progressBlock___block_invoke;
          v63[3] = &unk_1E68E5518;
          id v64 = v59;
          v66 = buf;
          v65 = v62;
          v67 = &v71;
          double v70 = v26;
          uint64_t v69 = 0x3F847AE147AE147BLL;
          v68 = &v75;
          [v54 prefetchEventsFromUniversalDate:v20 toUniversalDate:v24 forAssetCollectionsSortedByStartDate:v33 usingBlock:v63];
          if (*((unsigned char *)v76 + 24))
          {
            int v29 = 1;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v79 = 67109378;
              int v80 = 134;
              __int16 v81 = 2080;
              v82 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/Ingest/Ingest Processing/PGGraphIngestPrefetchEventProcessor.m";
              _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v79, 0x12u);
            }
          }
          else
          {
            v34 = +[PGLogging sharedLogging];
            v35 = [v34 loggingConnection];

            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              uint64_t v36 = *(void *)(*(void *)&buf[8] + 24);
              *(_DWORD *)v79 = 67109120;
              int v80 = v36;
              _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "[IngestPrefetchEventProcessor] Prefetched %d events", v79, 8u);
            }

            uint64_t v37 = *(void *)(*(void *)&buf[8] + 24);
            id v38 = v24;

            int v29 = 0;
            v56 += v37;
            id v20 = v38;
          }

          _Block_object_dispose(buf, 8);
        }

        v16 = v60;
        if (v29)
        {
          int v39 = 1;
          goto LABEL_39;
        }
      }
      int v39 = 0;
LABEL_39:
    }
    v43 = v60;
    goto LABEL_42;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 70;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchEventProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_53:
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);
}

void __109__PGGraphIngestPrefetchEventProcessor_prefetchEventsWithSortedMomentNodes_locationsToPrefetch_progressBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (v5)
  {
    v6 = (void *)MEMORY[0x1D25FED50]();
    id v7 = [v5 geoLocation];
    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1E5A8]);
      [v7 coordinate];
      double v10 = v9;
      double v12 = v11;
      v13 = [MEMORY[0x1E4F29128] UUID];
      v14 = [v13 UUIDString];
      v15 = objc_msgSend(v8, "initWithCenter:radius:identifier:", v14, v10, v12, 10.0);

      [*(id *)(a1 + 32) addObject:v15];
    }

    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if (*(void *)(a1 + 40))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    if (Current - *(double *)(v17 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v17 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 80));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        *a3 = 1;
      }
    }
  }
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v28 = a4;
  id v7 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  double v9 = v7;
  double v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PGGraphIngestPrefetchEventProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v27 = mach_absolute_time();
  double v11 = [v6 momentsToProcessForMomentUpdateTypes:31 includeMomentsToIngest:1];
  double v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v35[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  v14 = [v11 sortedArrayUsingDescriptors:v13];

  v15 = +[PGLogging sharedLogging];
  v16 = [v15 loggingConnection];

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = [v11 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v32) = v17;
    _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_DEFAULT, "[IngestPrefetchEventProcessor] About to process %d Moments", buf, 8u);
  }

  if ([v14 count])
  {
    id v29 = 0;
    [(PGGraphIngestPrefetchEventProcessor *)self prefetchEventsWithSortedMomentNodes:v14 locationsToPrefetch:&v29 progressBlock:v28];
    id v18 = v29;
    if (v18)
    {
      double v19 = +[PGLogging sharedLogging];
      id v20 = [v19 loggingConnection];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = [v18 count];
        *(_DWORD *)buf = 67109120;
        LODWORD(v32) = v21;
        _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_DEFAULT, "[IngestPrefetchEventProcessor] There are %d additional locations to prefetch", buf, 8u);
      }

      [v6 setAdditionalLocationsToPrefetch:v18];
    }
  }
  else
  {
    id v18 = 0;
  }
  uint64_t v22 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  double v25 = v10;
  double v26 = v25;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v26, OS_SIGNPOST_INTERVAL_END, v8, "PGGraphIngestPrefetchEventProcessor", "", buf, 2u);
  }

  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "PGGraphIngestPrefetchEventProcessor";
    __int16 v33 = 2048;
    double v34 = (float)((float)((float)((float)(v22 - v27) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3 = a3;
  BOOL v4 = (CLSDeviceIs2GBOrLess() & 1) == 0
    && (([v3 hasMomentsToInsert] & 1) != 0 || (objc_msgSend(v3, "momentUpdateTypes") & 0x1F) != 0);

  return v4;
}

- (PGGraphIngestPrefetchEventProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestPrefetchEventProcessor;
  id v6 = [(PGGraphIngestPrefetchEventProcessor *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
  }

  return v7;
}

@end