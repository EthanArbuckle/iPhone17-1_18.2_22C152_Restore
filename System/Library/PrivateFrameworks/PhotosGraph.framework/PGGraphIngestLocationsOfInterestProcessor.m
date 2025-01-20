@interface PGGraphIngestLocationsOfInterestProcessor
+ (unint64_t)requiredMomentUpdateTypes;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestLocationsOfInterestProcessor)initWithGraphBuilder:(id)a3;
- (void)processLocationsOfInterest;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestLocationsOfInterestProcessor

- (void).cxx_destruct
{
}

- (void)processLocationsOfInterest
{
  id v2 = [(PGGraphBuilder *)self->_graphBuilder serviceManager];
  [v2 postProcessLocationsOfInterest];
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(a4);
  double v6 = 0.0;
  if (v5)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(info.numer) = 0;
      v5[2](v5, &info, 0.0);
      if (LOBYTE(info.numer))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v20 = 48;
          *(_WORD *)&v20[4] = 2080;
          *(void *)&v20[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/Ingest Processing/PGGraphIngestLocationsOfInterestProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_21;
      }
      double v6 = Current;
    }
  }
  v8 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGGraphIngestLocationsOfInterestProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v12 = mach_absolute_time();
  [(PGGraphIngestLocationsOfInterestProcessor *)self processLocationsOfInterest];
  uint64_t v13 = mach_absolute_time();
  mach_timebase_info v14 = info;
  v15 = v11;
  v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v16, OS_SIGNPOST_INTERVAL_END, v9, "PGGraphIngestLocationsOfInterestProcessor", "", buf, 2u);
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)v20 = "PGGraphIngestLocationsOfInterestProcessor";
    *(_WORD *)&v20[8] = 2048;
    *(double *)&v20[10] = (float)((float)((float)((float)(v13 - v12) * (float)v14.numer) / (float)v14.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (v5)
  {
    if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
    {
      char v17 = 0;
      v5[2](v5, (mach_timebase_info *)&v17, 1.0);
      if (v17)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v20 = 55;
          *(_WORD *)&v20[4] = 2080;
          *(void *)&v20[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/Ingest Processing/PGGraphIngestLocationsOfInterestProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

LABEL_21:
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

- (PGGraphIngestLocationsOfInterestProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestLocationsOfInterestProcessor;
  double v6 = [(PGGraphIngestLocationsOfInterestProcessor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
  }

  return v7;
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 6;
}

@end