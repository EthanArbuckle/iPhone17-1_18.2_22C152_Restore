@interface WBSAutomaticBugCaptureManager
+ (id)sharedManager;
- (WBSAutomaticBugCaptureManager)init;
- (void)_startLoggingSessionForDomain:(id)a3 detectedProcess:(id)a4 type:(id)a5 subType:(id)a6 context:(id)a7 duration:(double)a8;
- (void)captureDeferredNavigationWithDomain:(id)a3 detectedProcess:(id)a4 context:(id)a5;
- (void)captureLoadingStallWithDomain:(id)a3 detectedProcess:(id)a4 context:(id)a5;
- (void)captureLoadingStallWithDomain:(id)a3 detectedProcess:(id)a4 context:(id)a5 duration:(double)a6;
- (void)capturePerformanceTimeoutWithDomain:(id)a3 detectedProcess:(id)a4 context:(id)a5;
- (void)captureProcessTerminationDueToResourceLimitsWithDomain:(id)a3 detectedProcess:(id)a4 resourceType:(id)a5;
@end

@implementation WBSAutomaticBugCaptureManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

void __46__WBSAutomaticBugCaptureManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WBSAutomaticBugCaptureManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;
}

- (WBSAutomaticBugCaptureManager)init
{
  if (isABCAvailable_onceToken != -1) {
    dispatch_once(&isABCAvailable_onceToken, &__block_literal_global_36);
  }
  if (isABCAvailable_isABCAvailable
    && (v7.receiver = self,
        v7.super_class = (Class)WBSAutomaticBugCaptureManager,
        (self = [(WBSAutomaticBugCaptureManager *)&v7 init]) != 0))
  {
    v3 = (SDRDiagnosticReporter *)[objc_alloc(MEMORY[0x1E4FA8AF0]) initWithQueue:0];
    reporter = self->_reporter;
    self->_reporter = v3;

    self = self;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)captureLoadingStallWithDomain:(id)a3 detectedProcess:(id)a4 context:(id)a5
{
}

- (void)captureLoadingStallWithDomain:(id)a3 detectedProcess:(id)a4 context:(id)a5 duration:(double)a6
{
}

- (void)captureProcessTerminationDueToResourceLimitsWithDomain:(id)a3 detectedProcess:(id)a4 resourceType:(id)a5
{
}

- (void)captureDeferredNavigationWithDomain:(id)a3 detectedProcess:(id)a4 context:(id)a5
{
}

- (void)capturePerformanceTimeoutWithDomain:(id)a3 detectedProcess:(id)a4 context:(id)a5
{
}

- (void)_startLoggingSessionForDomain:(id)a3 detectedProcess:(id)a4 type:(id)a5 subType:(id)a6 context:(id)a7 duration:(double)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__WBSAutomaticBugCaptureManager__startLoggingSessionForDomain_detectedProcess_type_subType_context_duration___block_invoke;
  block[3] = &unk_1E5C8C5D0;
  block[4] = self;
  id v26 = v14;
  id v27 = v16;
  id v28 = v17;
  id v29 = v15;
  id v30 = v18;
  double v31 = a8;
  id v20 = v18;
  id v21 = v15;
  id v22 = v17;
  id v23 = v16;
  id v24 = v14;
  dispatch_async(v19, block);
}

void __109__WBSAutomaticBugCaptureManager__startLoggingSessionForDomain_detectedProcess_type_subType_context_duration___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 8) signatureWithDomain:a1[5] type:a1[6] subType:a1[7] detectedProcess:a1[8] triggerThresholdValues:0];
  v3 = (double *)(a1 + 9);
  [v2 setObject:a1[9] forKeyedSubscript:*MEMORY[0x1E4FA8CB8]];
  v4 = *(void **)(a1[4] + 8);
  double v5 = v3[1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __109__WBSAutomaticBugCaptureManager__startLoggingSessionForDomain_detectedProcess_type_subType_context_duration___block_invoke_2;
  v7[3] = &unk_1E5C8C5A8;
  id v8 = *(id *)v3;
  if (([v4 snapshotWithSignature:v2 duration:0 event:0 payload:v7 reply:v5] & 1) == 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXAutoBugCapture();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __109__WBSAutomaticBugCaptureManager__startLoggingSessionForDomain_detectedProcess_type_subType_context_duration___block_invoke_cold_1((uint64_t *)v3, v6);
    }
  }
}

void __109__WBSAutomaticBugCaptureManager__startLoggingSessionForDomain_detectedProcess_type_subType_context_duration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoBugCapture();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543619;
    uint64_t v7 = v5;
    __int16 v8 = 2113;
    id v9 = v3;
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Got a response from -[SDRDiagnosticReporter snapshotWithSignature:...] with context '%{public}@': %{private}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void).cxx_destruct
{
}

void __109__WBSAutomaticBugCaptureManager__startLoggingSessionForDomain_detectedProcess_type_subType_context_duration___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Calling -[SDRDiagnosticReporter snapshotWithSignature:...] with context '%{public}@' failed", (uint8_t *)&v3, 0xCu);
}

@end