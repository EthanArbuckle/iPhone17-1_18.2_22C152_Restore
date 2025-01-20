@interface PGGraphIngestPersonalAestheticsProcessor
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestPersonalAestheticsProcessor)initWithGraphBuilder:(id)a3;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestPersonalAestheticsProcessor

- (void).cxx_destruct
{
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  graphBuilder = self->_graphBuilder;
  id v6 = a4;
  v7 = [(PGGraphBuilder *)graphBuilder loggingConnection];
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PGGraphIngestPersonalAestheticsProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v12 = mach_absolute_time();
  v13 = (void (**)(void *, unsigned char *, double))_Block_copy(v6);

  double v14 = 0.0;
  if (!v13 || (double v15 = CFAbsoluteTimeGetCurrent(), v15 < 0.01))
  {
LABEL_10:
    v16 = [(PGGraphBuilder *)self->_graphBuilder graph];
    v17 = [v16 infoNode];
    unint64_t v18 = [v17 numberOfAssets];

    if (v18 <= 0x63)
    {
      v19 = +[PGLogging sharedLogging];
      v20 = [v19 loggingConnection];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[Ingest Personal Aesthetics] Not enough assets in library, early exit", buf, 2u);
      }

      uint64_t v21 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      v24 = v10;
      v25 = v24;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v25, OS_SIGNPOST_INTERVAL_END, v8, "PGGraphIngestPersonalAestheticsProcessor", "", buf, 2u);
      }

      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)v70 = "PGGraphIngestPersonalAestheticsProcessor";
        *(_WORD *)&v70[8] = 2048;
        *(double *)&v70[10] = (float)((float)((float)((float)(v21 - v12) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (v13)
      {
        if (CFAbsoluteTimeGetCurrent() - v14 >= 0.01)
        {
          char v66 = 0;
          v13[2](v13, &v66, 1.0);
          if (v66)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v70 = 60;
              *(_WORD *)&v70[4] = 2080;
              *(void *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonalAestheticsProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_67;
    }
    uint64_t v65 = v12;
    double v26 = (double)v18;
    unint64_t v27 = (unint64_t)((double)v18 * 0.2);
    v28 = [(PGGraphBuilder *)self->_graphBuilder photoLibrary];
    v29 = [v28 librarySpecificFetchOptions];

    v30 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"overallAestheticScore != %f", *MEMORY[0x1E4F8EB00]);
    [v29 setInternalPredicate:v30];

    [v29 setFetchLimit:v27 + 1];
    v31 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"overallAestheticScore" ascending:0];
    v68 = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
    [v29 setSortDescriptors:v32];

    v33 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v29];
    if ([v33 count] > v27)
    {
      if (v13)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v14 >= 0.01)
        {
          char v66 = 0;
          v13[2](v13, &v66, 0.5);
          if (v66)
          {
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
LABEL_66:

LABEL_67:
              goto LABEL_68;
            }
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v70 = 81;
            *(_WORD *)&v70[4] = 2080;
            *(void *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonalAestheticsProcessor.m";
            v35 = MEMORY[0x1E4F14500];
LABEL_41:
            _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_66;
          }
          double v14 = Current;
        }
      }
      v43 = [v33 objectAtIndex:(unint64_t)(v26 * 0.05)];
      v64 = v33;
      v44 = [v33 objectAtIndex:v27];
      v63 = v43;
      [v43 clsAestheticScore];
      double v46 = v45;
      v62 = v44;
      [v44 clsAestheticScore];
      double v48 = v47;
      [MEMORY[0x1E4F8E778] legacyAestheticScoreThresholdToNotBeJunk];
      double v50 = v49;
      v51 = +[PGLogging sharedLogging];
      v52 = [v51 loggingConnection];

      BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_INFO);
      if (v46 > v50 && v48 > v50)
      {
        if (v53)
        {
          *(_DWORD *)buf = 134217984;
          *(double *)v70 = v46;
          _os_log_impl(&dword_1D1805000, v52, OS_LOG_TYPE_INFO, "Personal High Aesthetics threshold is: %f", buf, 0xCu);
        }

        v55 = +[PGLogging sharedLogging];
        v56 = [v55 loggingConnection];

        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)v70 = v48;
          _os_log_impl(&dword_1D1805000, v56, OS_LOG_TYPE_INFO, "Personal Good Aesthetics threshold is: %f", buf, 0xCu);
        }

        [(PGGraphBuilder *)self->_graphBuilder persistPersonalHighAestheticsThreshold:v46 personalGoodAestheticsThreshold:v48];
      }
      else
      {
        if (v53)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1805000, v52, OS_LOG_TYPE_INFO, "High and Good Personal Aesthetics Score cannot be inferior to Utility Threshold -> can't save personal aesthetics thresholds", buf, 2u);
        }
      }
      v33 = v64;
      uint64_t v57 = mach_absolute_time();
      uint32_t v59 = info.numer;
      uint32_t v58 = info.denom;
      v60 = v10;
      v61 = v60;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v61, OS_SIGNPOST_INTERVAL_END, v8, "PGGraphIngestPersonalAestheticsProcessor", "", buf, 2u);
      }

      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)v70 = "PGGraphIngestPersonalAestheticsProcessor";
        *(_WORD *)&v70[8] = 2048;
        *(double *)&v70[10] = (float)((float)((float)((float)(v57 - v65) * (float)v59) / (float)v58) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v61, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (v13)
      {
        if (CFAbsoluteTimeGetCurrent() - v14 >= 0.01)
        {
          char v66 = 0;
          v13[2](v13, &v66, 1.0);
          if (v66)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v70 = 104;
              *(_WORD *)&v70[4] = 2080;
              *(void *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonalAestheticsProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }

      goto LABEL_66;
    }
    v36 = +[PGLogging sharedLogging];
    v37 = [v36 loggingConnection];

    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "Ingest Personal Aesthetics]Not enough assets with aesthetic score, early exit", buf, 2u);
    }

    uint64_t v38 = mach_absolute_time();
    uint32_t v40 = info.numer;
    uint32_t v39 = info.denom;
    v41 = v10;
    v42 = v41;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v42, OS_SIGNPOST_INTERVAL_END, v8, "PGGraphIngestPersonalAestheticsProcessor", "", buf, 2u);
    }

    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v70 = "PGGraphIngestPersonalAestheticsProcessor";
      *(_WORD *)&v70[8] = 2048;
      *(double *)&v70[10] = (float)((float)((float)((float)(v38 - v65) * (float)v40) / (float)v39) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v42, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    if (!v13) {
      goto LABEL_66;
    }
    if (CFAbsoluteTimeGetCurrent() - v14 < 0.01) {
      goto LABEL_66;
    }
    char v66 = 0;
    v13[2](v13, &v66, 1.0);
    if (!v66 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_66;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v70 = 77;
    *(_WORD *)&v70[4] = 2080;
    *(void *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Graph/Ingest/Ingest Processing/PGGraphIngestPersonalAestheticsProcessor.m";
    v35 = MEMORY[0x1E4F14500];
    goto LABEL_41;
  }
  char v66 = 0;
  v13[2](v13, &v66, 0.0);
  if (!v66)
  {
    double v14 = v15;
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v70 = 51;
    *(_WORD *)&v70[4] = 2080;
    *(void *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Graph/Ingest/Ingest Processing/PGGraphIngestPersonalAestheticsProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_68:
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  int v3 = [a3 isResumingFullAnalysis];
  if (v3)
  {
    LOBYTE(v3) = +[PGUserDefaults isBehavioralCurationEnabled];
  }
  return v3;
}

- (PGGraphIngestPersonalAestheticsProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestPersonalAestheticsProcessor;
  id v6 = [(PGGraphIngestPersonalAestheticsProcessor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
  }

  return v7;
}

@end