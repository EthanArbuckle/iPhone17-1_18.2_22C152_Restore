@interface PHAContactUpdateTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (BOOL)supportsIncremental;
- (NSString)name;
- (double)period;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (unint64_t)version;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAContactUpdateTask

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAContactUpdateTask timeoutFatal:]", "PHAContactUpdateTask.m", 108, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAContactUpdateTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 workingContext];
  v10 = [v9 loggingConnection];

  v11 = [v7 graphUpdateForContactsChangesWithProgressReporter:v8];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_DEFAULT, "PHAContactUpdateTask: Graph update %@", (uint8_t *)&buf, 0xCu);
  }
  if ([v11 hasAnythingToDo])
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F8D6F8]) initWithGraphManager:v7];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_INFO, "PHAContactUpdateTask: Run with graphUpdate= %@", (uint8_t *)&buf, 0xCu);
    }
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 1;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__7441;
    v28 = __Block_byref_object_dispose__7442;
    id v29 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__PHAContactUpdateTask_runWithGraphManager_progressReporter_error___block_invoke;
    v17[3] = &unk_1E6918968;
    v19 = &v21;
    p_long long buf = &buf;
    v14 = v13;
    v18 = v14;
    [v12 applyChangesFromGraphUpdate:v11 progressReporter:v8 completionHandler:v17];
    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    if (a5) {
      *a5 = *(id *)(*((void *)&buf + 1) + 40);
    }
    BOOL v15 = *((unsigned char *)v22 + 24) != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    BOOL v15 = 1;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_INFO, "PHAContactUpdateTask: There is nothing to apply from Contacts update", (uint8_t *)&buf, 2u);
    }
  }

  return v15;
}

void __67__PHAContactUpdateTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v9 = 0;
  char v4 = [v3 isReadyWithError:&v9];
  id v5 = v9;
  if ((v4 & 1) == 0)
  {
    v6 = [v3 workingContext];
    id v7 = [v6 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v11 = v5;
      _os_log_error_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_ERROR, "Returning NO for shouldRunWithGraphManager: Graph is not ready and need a full rebuild: %@", buf, 0xCu);
    }
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
  if ([MEMORY[0x1E4F8D770] graphConsistencyCheckIsEnabled])
  {
    v4[0] = objc_opt_class();
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v2;
}

- (id)incrementalKey
{
  return 0;
}

- (BOOL)supportsIncremental
{
  return 0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (unint64_t)version
{
  return 617;
}

- (double)period
{
  return 86400.0;
}

- (NSString)name
{
  return (NSString *)@"PHAContactUpdateTask";
}

@end