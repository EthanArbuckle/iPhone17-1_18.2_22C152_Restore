@interface PHAMemoriesEnrichmentTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)runWithGraphManager:(id)a3 withIncrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (NSString)name;
- (PHAMemoriesEnrichmentTask)initWithOptions:(id)a3;
- (double)period;
- (id)memoriesEnrichmentProcessor;
- (id)taskClassDependencies;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAMemoriesEnrichmentTask

- (id)memoriesEnrichmentProcessor
{
  if (self->_numberOfMemoriesToEnrich) {
    id v2 = (id)[objc_alloc(MEMORY[0x1E4F8D680]) initWithNumberOfMemoriesToEnrich:self->_numberOfMemoriesToEnrich];
  }
  else {
    id v2 = objc_alloc_init(MEMORY[0x1E4F8D680]);
  }

  return v2;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAMemoriesEnrichmentTask timeoutFatal:]", "PHAMemoriesEnrichmentTask.m", 78, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAMemoriesEnrichmentTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 withIncrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(PHAMemoriesEnrichmentTask *)self memoriesEnrichmentProcessor];
  LOBYTE(a6) = [v13 runWithGraphManager:v12 incrementalChange:v11 progressReporter:v10 error:a6];

  return (char)a6;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PHAMemoriesEnrichmentTask *)self memoriesEnrichmentProcessor];
  LOBYTE(a5) = [v10 runWithGraphManager:v9 incrementalChange:0 progressReporter:v8 error:a5];

  return (char)a5;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  uint64_t v4 = 0;
  return [a3 isReadyWithError:&v4];
}

- (int)priority
{
  return 0;
}

- (id)taskClassDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (double)period
{
  return -2.0;
}

- (NSString)name
{
  return (NSString *)@"PHAMemoriesEnrichmentTask";
}

- (PHAMemoriesEnrichmentTask)initWithOptions:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHAMemoriesEnrichmentTask;
  v5 = [(PHAMemoriesEnrichmentTask *)&v8 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"limit"];
    v5->_numberOfMemoriesToEnrich = [v6 unsignedIntegerValue];
  }
  return v5;
}

@end