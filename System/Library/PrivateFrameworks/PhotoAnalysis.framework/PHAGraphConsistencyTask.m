@interface PHAGraphConsistencyTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (NSString)name;
- (double)period;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)graphUpdateMadeProgress:(double)a3;
- (void)markTaskAsCompleted;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAGraphConsistencyTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_progressReporter, 0);

  objc_storeStrong((id *)&self->_updateManager, 0);
}

- (void)graphUpdateMadeProgress:(double)a3
{
  if ([(MAProgressReporter *)self->_progressReporter isCancelledWithProgress:a3])
  {
    [(PHAGraphConsistencyTask *)self markTaskAsCompleted];
  }
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAGraphConsistencyTask timeoutFatal:]", "PHAGraphConsistencyTask.m", 100, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAGraphConsistencyTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  semaphore = self->_semaphore;
  self->_semaphore = v10;

  objc_storeStrong((id *)&self->_progressReporter, a4);
  v12 = (PGGraphUpdateManager *)[objc_alloc(MEMORY[0x1E4F8D6F0]) initWithGraphManager:v8];
  updateManager = self->_updateManager;
  self->_updateManager = v12;

  [(PGGraphUpdateManager *)self->_updateManager addListener:self];
  if (![(PGGraphUpdateManager *)self->_updateManager startListening])
  {
    v15 = [v8 workingContext];
    v16 = [v15 loggingConnection];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_error_impl(&dword_1D21F2000, v16, OS_LOG_TYPE_ERROR, "PHAGraphConsistencyTask failed to start listening for changes", v20, 2u);
    }

    if (a5)
    {
      uint64_t v14 = 14;
      goto LABEL_9;
    }
LABEL_10:
    BOOL v17 = 0;
    goto LABEL_12;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (![(MAProgressReporter *)self->_progressReporter isCancelled])
  {
    BOOL v17 = 1;
    goto LABEL_12;
  }
  if (!a5) {
    goto LABEL_10;
  }
  uint64_t v14 = 16;
LABEL_9:
  objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", v14);
  BOOL v17 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  [(PGGraphUpdateManager *)self->_updateManager stopListening];
  v18 = self->_updateManager;
  self->_updateManager = 0;

  return v17;
}

- (void)markTaskAsCompleted
{
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F8D968] suppressGraphLiveUpdate]) {
    char v4 = 0;
  }
  else {
    char v4 = [v3 isReady];
  }

  return v4;
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
  return 3600.0;
}

- (NSString)name
{
  return (NSString *)@"PHAGraphConsistencyTask";
}

@end