@interface PGGraphUserBehaviorEnrichmentProcessor
- (OS_os_log)loggingConnection;
- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6;
@end

@implementation PGGraphUserBehaviorEnrichmentProcessor

- (void).cxx_destruct
{
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  v12 = [v9 enrichmentLoggingConnection];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  unint64_t v16 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGGraphUserBehaviorEnrichmentProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v17 = mach_absolute_time();
  int v18 = [v11 isResumingFullAnalysis];

  if (v18 && +[PGUserDefaults isBehavioralCurationEnabled])
  {
    uint64_t v40 = v17;
    v19 = [v9 enrichmentLoggingConnection];
    loggingConnection = self->_loggingConnection;
    self->_loggingConnection = v19;

    v21 = [(PGGraphUserBehaviorEnrichmentProcessor *)self loggingConnection];
    os_signpost_id_t v22 = os_signpost_id_generate(v21);
    v23 = v21;
    v24 = v23;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "UserBehaviorEnrichment", "", buf, 2u);
    }

    mach_timebase_info v42 = 0;
    mach_timebase_info(&v42);
    uint64_t v39 = mach_absolute_time();
    v41 = [[PGBehavioralScoreProcessor alloc] initWithGraphManager:v9 algorithm:1];
    [(PGBehavioralScoreProcessor *)v41 processBehavioralScoresWithProgressBlock:v10];
    uint64_t v25 = mach_absolute_time();
    mach_timebase_info v26 = v42;
    v27 = v24;
    v28 = v27;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v28, OS_SIGNPOST_INTERVAL_END, v22, "UserBehaviorEnrichment", "", buf, 2u);
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "UserBehaviorEnrichment";
      __int16 v46 = 2048;
      double v47 = (float)((float)((float)((float)(v25 - v39) * (float)v26.numer) / (float)v26.denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    uint64_t v29 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v32 = v15;
    v33 = v32;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v33, OS_SIGNPOST_INTERVAL_END, v13, "PGGraphUserBehaviorEnrichmentProcessor", "", buf, 2u);
    }

    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "PGGraphUserBehaviorEnrichmentProcessor";
      __int16 v46 = 2048;
      double v47 = (float)((float)((float)((float)(v29 - v40) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v34 = mach_absolute_time();
    uint32_t v36 = info.numer;
    uint32_t v35 = info.denom;
    v37 = v15;
    v38 = v37;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v38, OS_SIGNPOST_INTERVAL_END, v13, "PGGraphUserBehaviorEnrichmentProcessor", "", buf, 2u);
    }

    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "PGGraphUserBehaviorEnrichmentProcessor";
      __int16 v46 = 2048;
      double v47 = (float)((float)((float)((float)(v34 - v17) * (float)v36) / (float)v35) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v38, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
}

@end