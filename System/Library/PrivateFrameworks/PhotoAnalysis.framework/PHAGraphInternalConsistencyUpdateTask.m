@interface PHAGraphInternalConsistencyUpdateTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)runWithGraphManager:(id)a3 withIncrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (BOOL)shouldRunIncrementallyWithGraphManager:(id)a3 incrementalChange:(id)a4 timeIntervalSinceNonIncrementalRun:(double)a5;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (NSString)name;
- (double)period;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAGraphInternalConsistencyUpdateTask

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAGraphInternalConsistencyUpdateTask timeoutFatal:]", "PHAGraphInternalConsistencyUpdateTask.m", 125, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAGraphInternalConsistencyUpdateTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 withIncrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 hasAnythingToDo])
  {
    v12 = [objc_alloc(MEMORY[0x1E4F8D6F8]) initWithGraphManager:v9];
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 1;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__1967;
    v34 = __Block_byref_object_dispose__1968;
    id v35 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __106__PHAGraphInternalConsistencyUpdateTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_241;
    v21[3] = &unk_1E6918968;
    v23 = &v36;
    v24 = &v30;
    v14 = v13;
    v22 = v14;
    [v12 applyChangesFromGraphUpdate:v10 progressReporter:v11 completionHandler:v21];
    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    if (a6) {
      *a6 = (id) v31[5];
    }
    int v15 = *((unsigned __int8 *)v37 + 24);
    v16 = v22;
  }
  else
  {
    dispatch_block_t v17 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_1965);
    v14 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 1;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__1967;
    v34 = __Block_byref_object_dispose__1968;
    id v35 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __106__PHAGraphInternalConsistencyUpdateTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_238;
    v26[3] = &unk_1E6917B08;
    v28 = &v36;
    v29 = &v30;
    v12 = v17;
    v27 = v12;
    [v9 setGraphInfoDateOfLastIncrementalUpdateInvocationWithDate:v14 completionBlock:v26];
    dispatch_block_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    v18 = [v9 workingContext];
    v19 = [v18 loggingConnection];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v19, OS_LOG_TYPE_DEFAULT, "PHAGraphInternalConsistencyUpdateTask: IncrementalChange has nothing to do", buf, 2u);
    }

    if (a6) {
      *a6 = (id) v31[5];
    }
    int v15 = *((unsigned __int8 *)v37 + 24);
    v16 = v27;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v15 != 0;
}

void __106__PHAGraphInternalConsistencyUpdateTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_238(void *a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();
}

void __106__PHAGraphInternalConsistencyUpdateTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_241(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 14, @"The task does not support graph full rebuild which is handled by PHAGraphRebuildTask");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)shouldRunIncrementallyWithGraphManager:(id)a3 incrementalChange:(id)a4 timeIntervalSinceNonIncrementalRun:(double)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v18 = 0;
  char v8 = [v6 isReadyWithError:&v18];
  id v9 = v18;
  if (v8)
  {
    if (![v6 mePersonContactIdentifierDidChangeWithGraphUpdate:v7])
    {
      BOOL v16 = 1;
      goto LABEL_10;
    }
    id v10 = [v6 workingContext];
    id v11 = [v10 loggingConnection];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "PHAGraphInternalConsistencyUpdateTask: Returning NO for shouldRunIncrementally: IncrementalChange contains a"
            " contactIdentifier update of Me person";
      v13 = v11;
      uint32_t v14 = 2;
LABEL_7:
      _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else
  {
    int v15 = [v6 workingContext];
    id v11 = [v15 loggingConnection];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v9;
      v12 = "PHAGraphInternalConsistencyUpdateTask: Returning NO for shouldRunIncrementally: Graph is not ready and need "
            "a full rebuild: %@";
      v13 = v11;
      uint32_t v14 = 12;
      goto LABEL_7;
    }
  }

  BOOL v16 = 0;
LABEL_10:

  return v16;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  return objc_msgSend(MEMORY[0x1E4F8D770], "graphConsistencyCheckIsEnabled", a3);
}

- (int)priority
{
  return 1;
}

- (id)taskClassDependencies
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)incrementalKey
{
  v2 = @"PHAGraphRebuildTaskIncrementalKey";
  return @"PHAGraphRebuildTaskIncrementalKey";
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (double)period
{
  return -1.0;
}

- (NSString)name
{
  return (NSString *)@"PHAGraphInternalConsistencyUpdateTask";
}

@end