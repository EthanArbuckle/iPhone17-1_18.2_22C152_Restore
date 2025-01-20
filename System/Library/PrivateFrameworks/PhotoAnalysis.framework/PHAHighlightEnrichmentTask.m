@interface PHAHighlightEnrichmentTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)featureAvailable;
- (BOOL)featureComplete;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (double)period;
- (id)incrementalKey;
- (int)priority;
- (unint64_t)featureCode;
- (unint64_t)tailorOptions;
- (void)setTailorOptions:(unint64_t)a3;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAHighlightEnrichmentTask

- (BOOL)featureComplete
{
  return self->_featureComplete;
}

- (BOOL)featureAvailable
{
  return self->_featureAvailable;
}

- (void)setTailorOptions:(unint64_t)a3
{
  self->_tailorOptions = a3;
}

- (unint64_t)featureCode
{
  return 102;
}

- (unint64_t)tailorOptions
{
  if (self->_tailorOptions) {
    return self->_tailorOptions;
  }
  else {
    return 255;
  }
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAHighlightEnrichmentTask timeoutFatal:]", "PHAHighlightEnrichmentTask.m", 60, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAHighlightEnrichmentTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E4F8D6C8];
  id v10 = a3;
  v11 = objc_msgSend([v9 alloc], "initWithHighlightTailorOptions:", -[PHAHighlightEnrichmentTask tailorOptions](self, "tailorOptions"));
  id v12 = objc_alloc(MEMORY[0x1E4F8D658]);
  v21[0] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v14 = (void *)[v12 initWithManager:v10 enrichmentProcessors:v13];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__PHAHighlightEnrichmentTask_runWithGraphManager_progressReporter_error___block_invoke;
  v19[3] = &unk_1E6918B08;
  id v20 = v8;
  id v15 = v8;
  LOBYTE(a5) = [v14 enrichDataModelWithError:a5 progressBlock:v19];
  self->_featureAvailable = [v11 curatedLibraryFTEIsReady];
  v16 = (void *)MEMORY[0x1E4F8D6C8];
  v17 = [v10 photoLibrary];

  self->_featureComplete = [v16 hasCompletedEnrichmentForLibrary:v17];
  return (char)a5;
}

uint64_t __73__PHAHighlightEnrichmentTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

- (int)priority
{
  return 1;
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
  return 10800.0;
}

@end