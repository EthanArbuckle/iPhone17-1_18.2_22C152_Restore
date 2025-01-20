@interface PHASearchEnrichmentTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)shouldRunIncrementallyWithGraphManager:(id)a3 incrementalChange:(id)a4 timeIntervalSinceNonIncrementalRun:(double)a5;
- (double)incrementalWindow;
- (double)period;
- (id)enrichmentProcessor;
- (id)taskClassDependencies;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHASearchEnrichmentTask

- (id)enrichmentProcessor
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F8D6E0]);

  return v2;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHASearchEnrichmentTask timeoutFatal:]", "PHASearchEnrichmentTask.m", 72, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHASearchEnrichmentTask is stuck", v3, 2u);
  }
}

- (BOOL)shouldRunIncrementallyWithGraphManager:(id)a3 incrementalChange:(id)a4 timeIntervalSinceNonIncrementalRun:(double)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 timeIntervalSinceLastGraphFullRebuild];
  double v8 = v7;
  if (v7 < a5)
  {
    v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-v7];
    v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-a5];
    v11 = [v6 workingContext];
    v12 = [v11 loggingConnection];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412546;
      v15 = v9;
      __int16 v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1D21F2000, v12, OS_LOG_TYPE_INFO, "PHASearchEnrichmentTask should not run incrementally, graph was fully rebuilt recently: %@, last search non incremental run: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  return v8 >= a5;
}

- (double)incrementalWindow
{
  return 604800.0;
}

- (double)period
{
  return 21600.0;
}

- (id)taskClassDependencies
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (int)priority
{
  return 1;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

@end