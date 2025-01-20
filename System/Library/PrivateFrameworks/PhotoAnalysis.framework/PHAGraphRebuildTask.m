@interface PHAGraphRebuildTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)runWithGraphManager:(id)a3 withIncrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (BOOL)shouldRunIncrementallyWithGraphManager:(id)a3 incrementalChange:(id)a4 timeIntervalSinceNonIncrementalRun:(double)a5;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (NSString)name;
- (PHAGraphRebuildTask)init;
- (PHAGraphRebuildTask)initWithMode:(unint64_t)a3;
- (double)incrementalWindow;
- (double)period;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (unint64_t)rebuildTaskMode;
- (unint64_t)version;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAGraphRebuildTask

- (unint64_t)rebuildTaskMode
{
  return self->_rebuildTaskMode;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAGraphRebuildTask timeoutFatal:]", "PHAGraphRebuildTask.m", 209, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAGraphRebuildTask is stuck", v3, 2u);
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
    v33 = __Block_byref_object_copy__568;
    v34 = __Block_byref_object_dispose__569;
    id v35 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __88__PHAGraphRebuildTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_250;
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
    dispatch_block_t v17 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_247);
    v14 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 1;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__568;
    v34 = __Block_byref_object_dispose__569;
    id v35 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __88__PHAGraphRebuildTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_2;
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
      _os_log_impl(&dword_1D21F2000, v19, OS_LOG_TYPE_DEFAULT, "PHAGraphRebuildTask: IncrementalChange has nothing to do", buf, 2u);
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

void __88__PHAGraphRebuildTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_2(void *a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();
}

void __88__PHAGraphRebuildTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_250(uint64_t a1, void *a2)
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
  id v8 = a3;
  id v9 = a4;
  if (self->_rebuildTaskMode == 2)
  {
    id v10 = [v8 workingContext];
    id v11 = [v10 loggingConnection];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_DEFAULT, "PHAGraphRebuildTask: Returning NO for full rebuild run: Current mode is ForceIncrementalUpdate", buf, 2u);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 14, @"Current mode is ForceIncrementalUpdate, the task does not support graph full rebuild");
      BOOL v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 1;
    *(void *)buf = 0;
    v26 = buf;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__568;
    v29 = __Block_byref_object_dispose__569;
    id v30 = 0;
    dispatch_block_t v13 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_576);
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F8D6F0]) initWithGraphManager:v8];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__PHAGraphRebuildTask_runWithGraphManager_progressReporter_error___block_invoke_2;
    v23[3] = &unk_1E6918B08;
    id v24 = v9;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__PHAGraphRebuildTask_runWithGraphManager_progressReporter_error___block_invoke_3;
    v17[3] = &unk_1E6917588;
    id v18 = v8;
    id v19 = v24;
    v21 = &v31;
    v22 = buf;
    id v15 = v13;
    id v20 = v15;
    [v14 performFullRebuildWithProgressBlock:v23 completionBlock:v17];
    dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    if (a5) {
      *a5 = *((id *)v26 + 5);
    }
    BOOL v12 = *((unsigned char *)v32 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v31, 8);
  }

  return v12;
}

uint64_t __66__PHAGraphRebuildTask_runWithGraphManager_progressReporter_error___block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:a3 * 0.7];
  *a2 = result;
  return result;
}

void __66__PHAGraphRebuildTask_runWithGraphManager_progressReporter_error___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__PHAGraphRebuildTask_runWithGraphManager_progressReporter_error___block_invoke_4;
    v10[3] = &unk_1E6918B08;
    v6 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v6 validateGraphConsistencyIfNeededWithProgressBlock:v10];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __66__PHAGraphRebuildTask_runWithGraphManager_progressReporter_error___block_invoke_4(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:a3 * 0.3 + 0.7];
  *a2 = result;
  return result;
}

- (BOOL)shouldRunIncrementallyWithGraphManager:(id)a3 incrementalChange:(id)a4 timeIntervalSinceNonIncrementalRun:(double)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (self->_rebuildTaskMode != 1)
  {
    id v22 = 0;
    char v12 = [v7 isReadyWithError:&v22];
    id v10 = v22;
    if (v12)
    {
      if (self->_rebuildTaskMode == 2)
      {
        dispatch_block_t v13 = [v7 workingContext];
        v14 = [v13 loggingConnection];

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t rebuildTaskMode = self->_rebuildTaskMode;
          *(_DWORD *)buf = 134217984;
          unint64_t v24 = rebuildTaskMode;
          _os_log_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_DEFAULT, "Returning YES for shouldRunIncrementally: Current mode is IncrementalUpdate, %lu", buf, 0xCu);
        }
        BOOL v11 = 1;
        goto LABEL_17;
      }
      if (![v7 mePersonContactIdentifierDidChangeWithGraphUpdate:v8])
      {
        BOOL v11 = 1;
        goto LABEL_18;
      }
      id v20 = [v7 workingContext];
      v14 = [v20 loggingConnection];

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        dispatch_block_t v17 = "Returning NO for shouldRunIncrementally: IncrementalChange contains a contactIdentifier update of Me person";
        id v18 = v14;
        uint32_t v19 = 2;
        goto LABEL_15;
      }
    }
    else
    {
      v16 = [v7 workingContext];
      v14 = [v16 loggingConnection];

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v24 = (unint64_t)v10;
        dispatch_block_t v17 = "Returning NO for shouldRunIncrementally: Graph is not ready and need a full rebuild: %@";
        id v18 = v14;
        uint32_t v19 = 12;
LABEL_15:
        _os_log_impl(&dword_1D21F2000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }
    BOOL v11 = 0;
LABEL_17:

    goto LABEL_18;
  }
  id v9 = [v7 workingContext];
  id v10 = [v9 loggingConnection];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_DEFAULT, "Returning NO for shouldRunIncrementally: Current mode is ForceRebuild", buf, 2u);
  }
  BOOL v11 = 0;
LABEL_18:

  return v11;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 libraryAnalysisState];
  if (v4 == 1)
  {
    id v5 = [v3 workingContext];
    v6 = [v5 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1D21F2000, v6, OS_LOG_TYPE_DEFAULT, "PHAGraphRebuildTask: Graph is already rebuilding, skipping rebuild tasks", v8, 2u);
    }
  }
  return v4 != 1;
}

- (int)priority
{
  return 1;
}

- (id)taskClassDependencies
{
  v4[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F8D770] graphConsistencyCheckIsEnabled])
  {
    v4[0] = objc_opt_class();
    v4[1] = objc_opt_class();
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v2;
}

- (id)incrementalKey
{
  return @"PHAGraphRebuildTaskIncrementalKey";
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (unint64_t)version
{
  return 617;
}

- (double)incrementalWindow
{
  return 604800.0;
}

- (double)period
{
  return 21600.0;
}

- (NSString)name
{
  return (NSString *)@"PHAGraphRebuildTask";
}

- (PHAGraphRebuildTask)init
{
  return [(PHAGraphRebuildTask *)self initWithMode:0];
}

- (PHAGraphRebuildTask)initWithMode:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHAGraphRebuildTask;
  uint64_t result = [(PHAGraphRebuildTask *)&v5 init];
  if (result) {
    result->_unint64_t rebuildTaskMode = a3;
  }
  return result;
}

@end