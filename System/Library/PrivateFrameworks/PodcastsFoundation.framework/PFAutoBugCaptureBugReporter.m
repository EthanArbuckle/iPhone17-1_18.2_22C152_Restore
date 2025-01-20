@interface PFAutoBugCaptureBugReporter
+ (id)sharedInstance;
- (BOOL)_timeSinceLastSimilarReport:(id)a3 hasExceededElapsedTimeThreshold:(double)a4;
- (BOOL)canSubmitNewReport:(id)a3 withMinimumElapsedTime:(double)a4;
- (PFAutoBugCaptureBugReporter)init;
- (id)_lastSubmissionTimeForReport:(id)a3;
- (id)_processName;
- (void)_executeSubmitBugReport:(id)a3 userInfo:(id)a4 withMaximumSubmissionCadence:(double)a5;
- (void)_reportSignature:(id)a3 forReport:(id)a4;
- (void)_scheduleSubmissionOfBugReport:(id)a3 withUserInfo:(id)a4;
- (void)_setLastSubmissionTime:(id)a3 forReport:(id)a4;
- (void)_submitBugReport:(id)a3 withUserInfo:(id)a4;
- (void)submitBugReport:(id)a3 userInfo:(id)a4 withMaximumSubmissionCadence:(double)a5;
@end

@implementation PFAutoBugCaptureBugReporter

+ (id)sharedInstance
{
  if (sharedInstance_dispatchToken != -1) {
    dispatch_once(&sharedInstance_dispatchToken, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_singleton;
  return v2;
}

uint64_t __45__PFAutoBugCaptureBugReporter_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PFAutoBugCaptureBugReporter);
  uint64_t v1 = sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (PFAutoBugCaptureBugReporter)init
{
  v9.receiver = self;
  v9.super_class = (Class)PFAutoBugCaptureBugReporter;
  v2 = [(PFAutoBugCaptureBugReporter *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Podcasts.AutoBugCapture", 0);
    reportQueue = v2->_reportQueue;
    v2->_reportQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_reportQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__PFAutoBugCaptureBugReporter_init__block_invoke;
    block[3] = &unk_1E5E611F0;
    v8 = v2;
    dispatch_sync(v5, block);
  }
  return v2;
}

void __35__PFAutoBugCaptureBugReporter_init__block_invoke(uint64_t a1)
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v2 = (void *)getSDRDiagnosticReporterClass_softClass;
  uint64_t v11 = getSDRDiagnosticReporterClass_softClass;
  if (!getSDRDiagnosticReporterClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getSDRDiagnosticReporterClass_block_invoke;
    v7[3] = &unk_1E5E621D0;
    v7[4] = &v8;
    __getSDRDiagnosticReporterClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  dispatch_queue_t v3 = v2;
  _Block_object_dispose(&v8, 8);
  id v4 = objc_alloc_init(v3);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;
}

- (void)submitBugReport:(id)a3 userInfo:(id)a4 withMaximumSubmissionCadence:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    reportQueue = self->_reportQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__PFAutoBugCaptureBugReporter_submitBugReport_userInfo_withMaximumSubmissionCadence___block_invoke;
    block[3] = &unk_1E5E62130;
    void block[4] = self;
    id v14 = v8;
    double v16 = a5;
    id v15 = v9;
    dispatch_async(reportQueue, block);
  }
  else
  {
    uint64_t v11 = _MTLogCategoryMetrics();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
    }
  }
}

uint64_t __85__PFAutoBugCaptureBugReporter_submitBugReport_userInfo_withMaximumSubmissionCadence___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) canSubmitNewReport:*(void *)(a1 + 40) withMinimumElapsedTime:*(double *)(a1 + 56)];
  if (result)
  {
    dispatch_queue_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    double v6 = *(double *)(a1 + 56);
    return [v3 _executeSubmitBugReport:v4 userInfo:v5 withMaximumSubmissionCadence:v6];
  }
  return result;
}

- (BOOL)canSubmitNewReport:(id)a3 withMinimumElapsedTime:(double)a4
{
  id v6 = a3;
  BOOL v7 = ([v6 forceSubmissionAttempt] & 1) != 0
    || [(PFAutoBugCaptureBugReporter *)self _timeSinceLastSimilarReport:v6 hasExceededElapsedTimeThreshold:a4];

  return v7;
}

- (BOOL)_timeSinceLastSimilarReport:(id)a3 hasExceededElapsedTimeThreshold:(double)a4
{
  uint64_t v5 = [(PFAutoBugCaptureBugReporter *)self _lastSubmissionTimeForReport:a3];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1C9C8] now];
    [v6 timeIntervalSinceDate:v5];
    BOOL v8 = v7 > a4;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (id)_lastSubmissionTimeForReport:(id)a3
{
  dispatch_queue_t v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  uint64_t v5 = [v3 standardUserDefaults];
  id v6 = [v4 signature];

  double v7 = [v5 objectForKey:v6];

  return v7;
}

- (void)_setLastSubmissionTime:(id)a3 forReport:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB18];
  id v6 = a4;
  id v7 = a3;
  id v9 = [v5 standardUserDefaults];
  BOOL v8 = [v6 signature];

  [v9 setObject:v7 forKey:v8];
}

- (void)_executeSubmitBugReport:(id)a3 userInfo:(id)a4 withMaximumSubmissionCadence:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  if (self->_reporter)
  {
    if (v8)
    {
      objc_initWeak(location, self);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __93__PFAutoBugCaptureBugReporter__executeSubmitBugReport_userInfo_withMaximumSubmissionCadence___block_invoke;
      v12[3] = &unk_1E5E62158;
      objc_copyWeak(&v14, location);
      id v13 = v7;
      ((void (**)(void, void *))v9)[2](v9, v12);

      objc_destroyWeak(&v14);
      objc_destroyWeak(location);
    }
    else
    {
      uint64_t v11 = objc_opt_new();
      [(PFAutoBugCaptureBugReporter *)self _submitBugReport:v7 withUserInfo:v11];
    }
  }
  else
  {
    uint64_t v10 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1AC9D5000, v10, OS_LOG_TYPE_DEFAULT, "Unable to report bug automatically. Unable to load ABC framework.", (uint8_t *)location, 2u);
    }
  }
}

void __93__PFAutoBugCaptureBugReporter__executeSubmitBugReport_userInfo_withMaximumSubmissionCadence___block_invoke(uint64_t a1, void *a2)
{
  dispatch_queue_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _scheduleSubmissionOfBugReport:*(void *)(a1 + 32) withUserInfo:v4];
}

- (void)_scheduleSubmissionOfBugReport:(id)a3 withUserInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  reportQueue = self->_reportQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PFAutoBugCaptureBugReporter__scheduleSubmissionOfBugReport_withUserInfo___block_invoke;
  block[3] = &unk_1E5E62180;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(reportQueue, block);
}

uint64_t __75__PFAutoBugCaptureBugReporter__scheduleSubmissionOfBugReport_withUserInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitBugReport:*(void *)(a1 + 40) withUserInfo:*(void *)(a1 + 48)];
}

- (void)_submitBugReport:(id)a3 withUserInfo:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  reporter = self->_reporter;
  id v9 = [v6 domainString];
  id v10 = [v6 systemString];
  uint64_t v11 = [v6 errorKindString];
  id v12 = [(PFAutoBugCaptureBugReporter *)self _processName];
  id v13 = [(SDRDiagnosticReporter *)reporter signatureWithDomain:v9 type:v10 subType:v11 detectedProcess:v12 triggerThresholdValues:0];

  if (v7) {
    [v13 addEntriesFromDictionary:v7];
  }
  id v14 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = 138543362;
    double v16 = v13;
    _os_log_impl(&dword_1AC9D5000, v14, OS_LOG_TYPE_INFO, "Automatic bug identified, signature: %{public}@", (uint8_t *)&v15, 0xCu);
  }

  [(PFAutoBugCaptureBugReporter *)self _reportSignature:v13 forReport:v6];
}

- (void)_reportSignature:(id)a3 forReport:(id)a4
{
  id v6 = a4;
  reporter = self->_reporter;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PFAutoBugCaptureBugReporter__reportSignature_forReport___block_invoke;
  v9[3] = &unk_1E5E621A8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(SDRDiagnosticReporter *)reporter snapshotWithSignature:a3 duration:0 event:0 payload:v9 reply:300.0];
}

void __58__PFAutoBugCaptureBugReporter__reportSignature_forReport___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = a2;
  uint64_t v4 = getkSymptomDiagnosticReplySuccess();
  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v5 = (void *)v4;
  id v6 = getkSymptomDiagnosticReplySuccess();
  id v7 = [v3 objectForKeyedSubscript:v6];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [MEMORY[0x1E4F1C9C8] now];
    [v9 _setLastSubmissionTime:v10 forReport:*(void *)(a1 + 40)];

    uint64_t v11 = getkSymptomDiagnosticReplySuccess();
    id v12 = [v3 objectForKeyedSubscript:v11];

    id v13 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 138543362;
      int v15 = v12;
      _os_log_impl(&dword_1AC9D5000, v13, OS_LOG_TYPE_INFO, "Bug report accepted, session identifier: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
LABEL_6:
    id v12 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543362;
      int v15 = v3;
      _os_log_impl(&dword_1AC9D5000, v12, OS_LOG_TYPE_ERROR, "Bug report was rejected. Response: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (id)_processName
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  dispatch_queue_t v3 = [v2 processName];

  if (!v3 || [(__CFString *)v3 isEqualToString:&stru_1F03A51F0])
  {

    dispatch_queue_t v3 = @"com.apple.podcasts";
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportQueue, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
}

@end