@interface PGGraphIngestEventLabelingProcessor
+ (unint64_t)requiredMomentUpdateTypes;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestEventLabelingProcessor)initWithGraphBuilder:(id)a3;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestEventLabelingProcessor

- (void).cxx_destruct
{
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  graphBuilder = self->_graphBuilder;
  id v7 = a4;
  id v8 = a3;
  v9 = [(PGGraphBuilder *)graphBuilder loggingConnection];
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGGraphIngestEventLabelingProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v13 = mach_absolute_time();
  v14 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:v7];

  v15 = [(PGGraphBuilder *)self->_graphBuilder graph];
  v16 = objc_msgSend(v8, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v15, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);

  v17 = self->_graphBuilder;
  id v27 = 0;
  BOOL v18 = +[PGEventProcessor processPGGraphForMomentNodes:v16 graphBuilder:v17 progressReporter:v14 error:&v27];
  v19 = (char *)v27;
  if (!v18)
  {
    v20 = +[PGLogging sharedLogging];
    v21 = [v20 loggingConnection];

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v19;
      _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "[PGGraphIngestEventLabelingProcessor] Error processing events: %@", buf, 0xCu);
    }
  }
  uint64_t v22 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v25 = v12;
  v26 = v25;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v26, OS_SIGNPOST_INTERVAL_END, v10, "PGGraphIngestEventLabelingProcessor", "", buf, 2u);
  }

  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "PGGraphIngestEventLabelingProcessor";
    __int16 v31 = 2048;
    double v32 = (float)((float)((float)((float)(v22 - v13) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v4 = a3;
  if (+[PGEventLabelingConfiguration isEventLabelingEnabled])
  {
    v5 = [(PGGraphBuilder *)self->_graphBuilder photoLibrary];
    int v6 = 1;
    id v7 = [v5 urlForApplicationDataFolderIdentifier:1];

    id v8 = [(PGGraphBuilder *)self->_graphBuilder eventLabelingFeaturesCache];
    int v9 = [v8 isCacheEmptyAtGraphServiceURL:v7];

    if (([v4 hasMomentsToInsert] & 1) == 0) {
      int v6 = [v4 hasMomentsToUpdate];
    }
    if ((v9 & v6) == 1)
    {
      os_signpost_id_t v10 = +[PGLogging sharedLogging];
      v11 = [v10 loggingConnection];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        __int16 v17 = 0;
        v12 = "[PGGraphIngestEventLabelingProcessor] GraphUpdate has moments to insert or update, but processor will not "
              "run due to missing feature cache.";
        uint64_t v13 = (uint8_t *)&v17;
LABEL_14:
        _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
      }
    }
    else
    {
      if ((v9 | v6))
      {
LABEL_11:

        goto LABEL_12;
      }
      v14 = +[PGLogging sharedLogging];
      v11 = [v14 loggingConnection];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        __int16 v16 = 0;
        v12 = "[PGGraphIngestEventLabelingProcessor] Found features in the event labeling cache, but processor will not r"
              "un because the GraphUpdate does not have moments to insert or update.";
        uint64_t v13 = (uint8_t *)&v16;
        goto LABEL_14;
      }
    }

    goto LABEL_11;
  }
  LOBYTE(v6) = 0;
LABEL_12:

  return v6;
}

- (PGGraphIngestEventLabelingProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestEventLabelingProcessor;
  int v6 = [(PGGraphIngestEventLabelingProcessor *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
  }

  return v7;
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 31;
}

@end