@interface PGGraphIngestPrefetchPeopleProcessor
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestPrefetchPeopleProcessor)initWithGraphBuilder:(id)a3;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestPrefetchPeopleProcessor

- (void).cxx_destruct
{
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
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
          *(_DWORD *)v23 = 46;
          *(_WORD *)&v23[4] = 2080;
          *(void *)&v23[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchPeopleProcessor.m";
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
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGGraphIngestPrefetchPeopleProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v12 = mach_absolute_time();
  id v13 = objc_alloc(MEMORY[0x1E4F76CA0]);
  v14 = [(PGGraphBuilder *)self->_graphBuilder photoLibrary];
  v15 = (void *)[v13 initWithPhotoLibrary:v14 maximumNumberOfPeople:128];
  [(PGGraphBuilder *)self->_graphBuilder setFocusPeopleIngestCache:v15];

  uint64_t v16 = mach_absolute_time();
  mach_timebase_info v17 = info;
  v18 = v11;
  v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v19, OS_SIGNPOST_INTERVAL_END, v9, "PGGraphIngestPrefetchPeopleProcessor", "", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)v23 = "PGGraphIngestPrefetchPeopleProcessor";
    *(_WORD *)&v23[8] = 2048;
    *(double *)&v23[10] = (float)((float)((float)((float)(v16 - v12) * (float)v17.numer) / (float)v17.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (v5)
  {
    if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
    {
      char v20 = 0;
      v5[2](v5, (mach_timebase_info *)&v20, 1.0);
      if (v20)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v23 = 54;
          *(_WORD *)&v23[4] = 2080;
          *(void *)&v23[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchPeopleProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

LABEL_21:
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  return [a3 hasMomentsToInsert];
}

- (PGGraphIngestPrefetchPeopleProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestPrefetchPeopleProcessor;
  double v6 = [(PGGraphIngestPrefetchPeopleProcessor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
  }

  return v7;
}

@end