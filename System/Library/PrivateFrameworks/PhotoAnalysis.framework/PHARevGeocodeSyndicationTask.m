@interface PHARevGeocodeSyndicationTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (NSString)name;
- (double)period;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHARevGeocodeSyndicationTask

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHARevGeocodeSyndicationTask timeoutFatal:]", "PHARevGeocodeSyndicationTask.m", 73, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHARevGeocodeSyndicationTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = (objc_class *)MEMORY[0x1E4F8D940];
  id v9 = a3;
  id v10 = [v8 alloc];
  v11 = [v9 workingContextForEnrichment];

  v12 = (void *)[v10 initWithWorkingContext:v11];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PHARevGeocodeSyndicationTask_runWithGraphManager_progressReporter_error___block_invoke;
  v15[3] = &unk_1E6918B08;
  id v16 = v7;
  id v13 = v7;
  LOBYTE(a5) = [v12 processSyndicatedAssetRevGeoCodingWithError:a5 progressBlock:v15];

  return (char)a5;
}

uint64_t __75__PHARevGeocodeSyndicationTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  v3 = a3;
  v4 = [v3 photoLibrary];
  char v5 = [v4 isSystemPhotoLibrary];

  if (v5)
  {
    char v6 = [v3 isReady];
  }
  else
  {
    id v7 = [v3 workingContext];

    v3 = [v7 loggingConnection];

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1D21F2000, v3, OS_LOG_TYPE_DEFAULT, "Task is running on a non system photo library, not running syndication processing job", v9, 2u);
    }
    char v6 = 0;
  }

  return v6;
}

- (int)priority
{
  return 1;
}

- (id)taskClassDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
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
  return 86400.0;
}

- (NSString)name
{
  return (NSString *)@"PHARevGeocodeSyndicationTask";
}

@end