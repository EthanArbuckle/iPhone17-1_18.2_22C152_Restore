@interface PHAEnrichmentTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)runWithGraphManager:(id)a3 withIncrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (NSString)name;
- (PGGraphDataModelEnrichmentProcessor)enrichmentProcessor;
- (double)period;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAEnrichmentTask

- (PGGraphDataModelEnrichmentProcessor)enrichmentProcessor
{
  PHAAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAEnrichmentTask timeoutFatal:]", "PHAEnrichmentTask.m", 76, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAEnrichmentTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 withIncrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  v11 = (objc_class *)MEMORY[0x1E4F8D658];
  id v12 = a4;
  id v13 = a3;
  id v14 = [v11 alloc];
  v15 = [(PHAEnrichmentTask *)self enrichmentProcessor];
  v22[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v17 = (void *)[v14 initWithManager:v13 enrichmentProcessors:v16];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86__PHAEnrichmentTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke;
  v20[3] = &unk_1E6918B08;
  id v21 = v10;
  id v18 = v10;
  LOBYTE(a6) = [v17 enrichDataModelWithGraphUpdateInventory:v12 error:a6 progressBlock:v20];

  return (char)a6;
}

uint64_t __86__PHAEnrichmentTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E4F8D658];
  id v10 = a3;
  id v11 = [v9 alloc];
  id v12 = [(PHAEnrichmentTask *)self enrichmentProcessor];
  v19[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v14 = (void *)[v11 initWithManager:v10 enrichmentProcessors:v13];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__PHAEnrichmentTask_runWithGraphManager_progressReporter_error___block_invoke;
  v17[3] = &unk_1E6918B08;
  id v18 = v8;
  id v15 = v8;
  LOBYTE(a5) = [v14 enrichDataModelWithError:a5 progressBlock:v17];

  return (char)a5;
}

uint64_t __64__PHAEnrichmentTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v11 = 0;
  char v5 = [v4 isReadyWithError:&v11];
  id v6 = v11;
  if ((v5 & 1) == 0)
  {
    v7 = [v4 workingContext];
    id v8 = [v7 loggingConnection];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = [(PHAEnrichmentTask *)self name];
      *(_DWORD *)buf = 138412290;
      id v13 = v9;
      _os_log_impl(&dword_1D21F2000, v8, OS_LOG_TYPE_INFO, "[%@] graph is not ready, not running enrichment task.", buf, 0xCu);
    }
  }

  return v5;
}

- (id)taskClassDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (int)priority
{
  return 0;
}

- (id)incrementalKey
{
  return 0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (double)period
{
  PHAAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSString)name
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end