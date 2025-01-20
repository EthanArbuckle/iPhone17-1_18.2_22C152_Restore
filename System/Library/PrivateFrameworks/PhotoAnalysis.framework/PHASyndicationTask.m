@interface PHASyndicationTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)performCurationJob;
- (BOOL)performGuestInferenceJob;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (NSString)name;
- (PHASyndicationTask)init;
- (double)period;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)setPerformCurationJob:(BOOL)a3;
- (void)setPerformGuestInferenceJob:(BOOL)a3;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHASyndicationTask

- (void)setPerformGuestInferenceJob:(BOOL)a3
{
  self->_performGuestInferenceJob = a3;
}

- (BOOL)performGuestInferenceJob
{
  return self->_performGuestInferenceJob;
}

- (void)setPerformCurationJob:(BOOL)a3
{
  self->_performCurationJob = a3;
}

- (BOOL)performCurationJob
{
  return self->_performCurationJob;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHASyndicationTask timeoutFatal:]", "PHASyndicationTask.m", 117, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHASyndicationTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  id v10 = objc_alloc(MEMORY[0x1E4F8D940]);
  v11 = [v8 workingContextForEnrichment];
  v12 = (void *)[v10 initWithWorkingContext:v11];

  if (self->_performCurationJob)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __65__PHASyndicationTask_runWithGraphManager_progressReporter_error___block_invoke;
    v29[3] = &unk_1E6918E10;
    v30[1] = &v31;
    v30[0] = v9;
    int v13 = [v12 processSyndicatedAssetCurationWithError:a5 progressBlock:v29];
    if (*((unsigned char *)v32 + 24))
    {
      v14 = v30;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v36 = 95;
        __int16 v37 = 2080;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/PHASyndicationTask.m";
        _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a5 && !*a5)
      {
        id v15 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
LABEL_18:
        LOBYTE(v16) = 0;
        *a5 = v15;
LABEL_28:

        goto LABEL_29;
      }
      goto LABEL_27;
    }
    BOOL v16 = v13;
  }
  else
  {
    BOOL v16 = 1;
  }
  if (self->_performGuestInferenceJob && v16)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __65__PHASyndicationTask_runWithGraphManager_progressReporter_error___block_invoke_202;
    v27[3] = &unk_1E6918E10;
    v28[1] = &v31;
    id v17 = v9;
    v28[0] = v17;
    int v18 = [v12 processSavedSyndicatedAssetsWithError:a5 progressBlock:v27];
    v14 = (id *)v28;
    if (*((unsigned char *)v32 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v36 = 102;
        __int16 v37 = 2080;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/PHASyndicationTask.m";
        _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a5 && !*a5)
      {
        id v15 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
        goto LABEL_18;
      }
    }
    else if (v18)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __65__PHASyndicationTask_runWithGraphManager_progressReporter_error___block_invoke_203;
      v24 = &unk_1E6918E10;
      v26 = &v31;
      id v25 = v17;
      char v19 = [v12 processSyndicatedAssetGuestInferenceWithError:a5 progressBlock:&v21];
      if (!*((unsigned char *)v32 + 24))
      {
        LOBYTE(v16) = v19;

        goto LABEL_28;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v36 = 108;
        __int16 v37 = 2080;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/PHASyndicationTask.m";
        _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a5 && !*a5)
      {
        objc_msgSend(MEMORY[0x1E4F71EB8], "errorForCode:", -4, v21, v22, v23, v24);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
LABEL_27:
    LOBYTE(v16) = 0;
    goto LABEL_28;
  }
LABEL_29:

  _Block_object_dispose(&v31, 8);
  return v16;
}

uint64_t __65__PHASyndicationTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:a3 * 0.25];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v5 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

uint64_t __65__PHASyndicationTask_runWithGraphManager_progressReporter_error___block_invoke_202(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:a3 * 0.25 + 0.25];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v5 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

uint64_t __65__PHASyndicationTask_runWithGraphManager_progressReporter_error___block_invoke_203(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:a3 * 0.5 + 0.5];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v5 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v5 = [v4 BOOLForKey:@"PHASyndicationTaskDisabled"];

  if (v5)
  {
    v6 = [v3 workingContext];
    v7 = [v6 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      id v8 = "Hubble Feature disabled via user defaults, not running syndication processing job";
      id v9 = (uint8_t *)&v16;
LABEL_8:
      _os_log_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  id v10 = [v3 photoLibrary];
  int v11 = [v10 isSystemPhotoLibrary];

  if ((v11 & 1) == 0)
  {
    int v13 = [v3 workingContext];
    v7 = [v13 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      id v8 = "Task is running on a non system photo library, not running syndication processing job";
      id v9 = (uint8_t *)&v15;
      goto LABEL_8;
    }
LABEL_9:

    char v12 = 0;
    goto LABEL_10;
  }
  char v12 = [v3 isReady];
LABEL_10:

  return v12;
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

- (PHASyndicationTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHASyndicationTask;
  uint64_t result = [(PHASyndicationTask *)&v3 init];
  if (result) {
    *(_WORD *)&result->_performCurationJob = 257;
  }
  return result;
}

- (double)period
{
  return 21600.0;
}

- (NSString)name
{
  return (NSString *)@"PHASyndicationTask";
}

@end