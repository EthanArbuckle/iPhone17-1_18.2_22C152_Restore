@interface MAAutoAssetControl
+ (id)activeJobSummary:(BOOL)a3 error:(id *)a4;
+ (id)activeJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5;
+ (id)assetSelectorOrAllSelector:(id)a3;
+ (id)autoAssetControl;
+ (id)availableForStagingAssetSummary:(id *)a3;
+ (id)controlStatistics:(BOOL)a3 error:(id *)a4;
+ (id)defaultDispatchQueue;
+ (id)forceGlobalAbandon:(id)a3;
+ (id)forceGlobalForget:(id)a3;
+ (id)forceGlobalPurge:(id)a3 forcingUnlock:(BOOL)a4;
+ (id)forceGlobalUnlock:(id)a3;
+ (id)frameworkDispatchQueue;
+ (id)frameworkInstanceUUID;
+ (id)knownAssetSummary:(BOOL)a3 error:(id *)a4;
+ (id)knownAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5;
+ (id)lockedAssetSummary:(BOOL)a3 error:(id *)a4;
+ (id)lockedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5;
+ (id)pushNotificationHistory:(BOOL)a3 error:(id *)a4;
+ (id)scheduledJobSummary:(BOOL)a3 error:(id *)a4;
+ (id)scheduledJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5;
+ (id)simulateSetJobOperation:(int64_t)a3 withEndEvent:(int64_t)a4 forSelector:(id)a5;
+ (id)stagedAssetSummary:(BOOL)a3 error:(id *)a4;
+ (id)stagedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5;
+ (int64_t)simulateCacheDeleteDetermineReclaimableSpace:(id)a3 withUrgency:(int)a4 error:(id *)a5;
+ (int64_t)simulateCacheDeleteReclaimSpace:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5 error:(id *)a6;
+ (int64_t)waitOnSemaphore:(id)a3 withTimeout:(int64_t)a4;
+ (void)frameworkInstanceSetLogDomain;
- (MAAutoAssetControl)init;
- (NSString)controlClientName;
- (NSString)controlClientProcessName;
- (OS_dispatch_queue)completionDispatchQueue;
- (SUCoreConnectClient)connectionClient;
- (int64_t)controlClientProcessID;
- (void)_activeJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5;
- (void)_availableForStagingAssetSummary:(id)a3;
- (void)_controlStatistics:(BOOL)a3 completion:(id)a4;
- (void)_failedControl:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedControlLockSummary:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedControlStatistics:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedControlSummary:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedSimulateCacheDeleteOperation:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_forceGlobalAbandon:(id)a3 completion:(id)a4;
- (void)_forceGlobalForget:(id)a3 completion:(id)a4;
- (void)_forceGlobalPurge:(id)a3 forcingUnlock:(BOOL)a4 completion:(id)a5;
- (void)_forceGlobalUnlock:(id)a3 completion:(id)a4;
- (void)_knownAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5;
- (void)_lockedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5;
- (void)_scheduledJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5;
- (void)_simulateCacheDeleteDetermineReclaimableSpace:(id)a3 withUrgency:(int)a4 error:(id *)a5 completion:(id)a6;
- (void)_simulateCacheDeleteReclaimSpace:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5 error:(id *)a6 completion:(id)a7;
- (void)_simulateSetJobOperation:(int64_t)a3 withEndEvent:(int64_t)a4 forSelector:(id)a5 completion:(id)a6;
- (void)_stagedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5;
- (void)_successControl:(id)a3 completion:(id)a4;
- (void)_successControlLockSummary:(id)a3 withLockSummaryEntries:(id)a4 completion:(id)a5;
- (void)_successControlStatistics:(id)a3 withControlStatistics:(id)a4 completion:(id)a5;
- (void)_successControlSummary:(id)a3 withJobSummaryEntries:(id)a4 completion:(id)a5;
- (void)_successSimulateCacheDeleteOperation:(id)a3 withReclaimableSpace:(int64_t)a4 completion:(id)a5;
- (void)connectToServerFrameworkCompletion:(id)a3;
- (void)setConnectionClient:(id)a3;
@end

@implementation MAAutoAssetControl

- (MAAutoAssetControl)init
{
  v9.receiver = self;
  v9.super_class = (Class)MAAutoAssetControl;
  v2 = [(MAAutoAssetControl *)&v9 init];
  if (v2)
  {
    +[MAAutoAssetControl frameworkInstanceSetLogDomain];
    controlClientName = v2->_controlClientName;
    v2->_controlClientName = (NSString *)@"auto-control-client";

    uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
    controlClientProcessName = v2->_controlClientProcessName;
    v2->_controlClientProcessName = (NSString *)v4;

    v2->_controlClientProcessID = getpid();
    uint64_t v6 = +[MAAutoAssetControl defaultDispatchQueue];
    completionDispatchQueue = v2->_completionDispatchQueue;
    v2->_completionDispatchQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

+ (id)controlStatistics:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v6 = +[MAAutoAssetControl autoAssetControl];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__6;
  v33 = __Block_byref_object_dispose__6;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__6;
  v27 = __Block_byref_object_dispose__6;
  id v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__MAAutoAssetControl_controlStatistics_error___block_invoke;
  v13[3] = &unk_1E60059C8;
  v15 = v19;
  v16 = &v29;
  v17 = &v23;
  v18 = v21;
  v8 = v7;
  v14 = v8;
  [v6 _controlStatistics:v5 completion:v13];
  if (+[MAAutoAssetControl waitOnSemaphore:v8 withTimeout:-2])
  {
    objc_super v9 = +[MAAutoAssetControl frameworkDispatchQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__MAAutoAssetControl_controlStatistics_error___block_invoke_3;
    v12[3] = &unk_1E6004130;
    v12[4] = v21;
    v12[5] = v19;
    v12[6] = &v23;
    dispatch_sync(v9, v12);
  }
  if (a4) {
    *a4 = (id) v24[5];
  }
  id v10 = (id)v30[5];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v10;
}

void __46__MAAutoAssetControl_controlStatistics_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_semaphore_t v7 = +[MAAutoAssetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __46__MAAutoAssetControl_controlStatistics_error___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __46__MAAutoAssetControl_controlStatistics_error___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __46__MAAutoAssetControl_controlStatistics_error___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(controlStatistics)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for control-statistics to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_controlStatistics:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_semaphore_t v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__MAAutoAssetControl__controlStatistics_completion___block_invoke;
    v10[3] = &unk_1E60059F0;
    BOOL v12 = a3;
    v10[4] = self;
    id v11 = v6;
    [(MAAutoAssetControl *)self connectToServerFrameworkCompletion:v10];
  }
  else
  {
    id v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _controlStatistics:completion:]();
    }
  }
}

void __52__MAAutoAssetControl__controlStatistics_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _failedControlStatistics:@"controlStatistics" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [[MAAutoAssetInfoControl alloc] initClearingAfter:*(unsigned __int8 *)(a1 + 48)];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dispatch_semaphore_t v7 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v8 = [v7 UUIDString];

    id v9 = +[MAAutoAssetControl assetSelectorOrAllSelector:0];
    id v10 = [MAAutoAssetInfoInstance alloc];
    id v11 = [*(id *)(a1 + 32) controlClientName];
    BOOL v12 = [*(id *)(a1 + 32) controlClientProcessName];
    uint64_t v13 = [*(id *)(a1 + 32) controlClientProcessID];
    id v14 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetInfoInstance *)v10 initForClientName:v11 withProcessName:v12 withProcessID:v13 usingAssetSelector:v9 associatingFrameworkUUID:v14];

    [v6 setSafeObject:v15 forKey:@"instance"];
    [v6 setSafeObject:v5 forKey:@"control"];
    long long v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-CONTROL:CONTROL_STATISTICS" clientID:v8 version:0 message:v6];
    uint64_t v17 = [*(id *)(a1 + 32) connectionClient];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __52__MAAutoAssetControl__controlStatistics_completion___block_invoke_2;
    void v19[3] = &unk_1E6004158;
    v18 = *(void **)(a1 + 40);
    v19[4] = *(void *)(a1 + 32);
    id v20 = v18;
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v19];
  }
}

void __52__MAAutoAssetControl__controlStatistics_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [*(id *)(a1 + 32) _failedControlStatistics:@"controlStatistics" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    dispatch_semaphore_t v7 = [v6 safeObjectForKey:@"controlStatistics" ofClass:objc_opt_class()];

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlStatistics:@"controlStatistics" withControlStatistics:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlStatistics:@"controlStatistics" withErrorCode:6110 withResponseError:0 description:@"no control-statistics provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)knownAssetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetControl knownAssetSummary:a3 limitedToAssetTypes:0 error:a4];
}

+ (id)availableForStagingAssetSummary:(id *)a3
{
  uint64_t v4 = +[MAAutoAssetControl autoAssetControl];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__6;
  uint64_t v31 = __Block_byref_object_dispose__6;
  id v32 = 0;
  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  uint64_t v25 = __Block_byref_object_dispose__6;
  id v26 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke;
  v11[3] = &unk_1E6004108;
  uint64_t v13 = v17;
  id v14 = &v27;
  id v15 = &v21;
  long long v16 = v19;
  id v6 = v5;
  id v12 = v6;
  [v4 _availableForStagingAssetSummary:v11];
  if (+[MAAutoAssetControl waitOnSemaphore:v6 withTimeout:-2])
  {
    dispatch_semaphore_t v7 = +[MAAutoAssetControl frameworkDispatchQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke_3;
    v10[3] = &unk_1E6004130;
    v10[4] = v19;
    void v10[5] = v17;
    v10[6] = &v21;
    dispatch_sync(v7, v10);
  }
  if (a3) {
    *a3 = (id) v22[5];
  }
  id v8 = (id)v28[5];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v8;
}

void __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_semaphore_t v7 = +[MAAutoAssetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(availableForStagingAssetSummary)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for known-asset-summary to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (id)knownAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = +[MAAutoAssetControl autoAssetControl];
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__6;
  uint64_t v29 = __Block_byref_object_dispose__6;
  id v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke;
  v15[3] = &unk_1E6004108;
  uint64_t v17 = v21;
  char v18 = &v31;
  v19 = &v25;
  char v20 = v23;
  id v10 = v9;
  long long v16 = v10;
  [v8 _knownAssetSummary:v6 limitedToAssetTypes:v7 completion:v15];
  if (+[MAAutoAssetControl waitOnSemaphore:v10 withTimeout:-2])
  {
    long long v11 = +[MAAutoAssetControl frameworkDispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke_3;
    v14[3] = &unk_1E6004130;
    v14[4] = v23;
    v14[5] = v21;
    v14[6] = &v25;
    dispatch_sync(v11, v14);
  }
  if (a5) {
    *a5 = (id) v26[5];
  }
  id v12 = (id)v32[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v12;
}

void __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAssetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(knownAssetSummary)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for known-asset-summary to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_availableForStagingAssetSummary:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__MAAutoAssetControl__availableForStagingAssetSummary___block_invoke;
    v8[3] = &unk_1E60054F0;
    v8[4] = self;
    id v9 = v4;
    [(MAAutoAssetControl *)self connectToServerFrameworkCompletion:v8];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _availableForStagingAssetSummary:]();
    }
  }
}

void __55__MAAutoAssetControl__availableForStagingAssetSummary___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _failedControlSummary:@"availableForStagingAssetSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v7 = [v6 UUIDString];

    id v8 = +[MAAutoAssetControl assetSelectorOrAllSelector:0];
    id v9 = [MAAutoAssetInfoInstance alloc];
    id v10 = [*(id *)(a1 + 32) controlClientName];
    long long v11 = [*(id *)(a1 + 32) controlClientProcessName];
    uint64_t v12 = [*(id *)(a1 + 32) controlClientProcessID];
    id v13 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v14 = [(MAAutoAssetInfoInstance *)v9 initForClientName:v10 withProcessName:v11 withProcessID:v12 usingAssetSelector:v8 associatingFrameworkUUID:v13];

    [v5 setSafeObject:v14 forKey:@"instance"];
    long long v15 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-CONTROL:AVAILABLE_FOR_STAGING_ASSET_SUMMARY" clientID:v7 version:0 message:v5];
    long long v16 = [*(id *)(a1 + 32) connectionClient];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__MAAutoAssetControl__availableForStagingAssetSummary___block_invoke_2;
    v18[3] = &unk_1E6004158;
    uint64_t v17 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v17;
    [v16 connectClientSendServerMessage:v15 proxyObject:0 withReply:v18];
  }
}

void __55__MAAutoAssetControl__availableForStagingAssetSummary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [*(id *)(a1 + 32) _failedControlSummary:@"availableForStagingAssetSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    id v7 = [v6 safeObjectForKey:@"jobSummary" ofClass:objc_opt_class()];

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"availableForStagingAssetSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"availableForStagingAssetSummary" withErrorCode:6110 withResponseError:0 description:@"no auto-stage-status provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

- (void)_knownAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__MAAutoAssetControl__knownAssetSummary_limitedToAssetTypes_completion___block_invoke;
    v12[3] = &unk_1E6004180;
    BOOL v16 = a3;
    id v13 = v8;
    id v14 = self;
    id v15 = v9;
    [(MAAutoAssetControl *)self connectToServerFrameworkCompletion:v12];

    uint64_t v10 = v13;
  }
  else
  {
    id v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v10 = [v11 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _knownAssetSummary:limitedToAssetTypes:completion:]();
    }
  }
}

void __72__MAAutoAssetControl__knownAssetSummary_limitedToAssetTypes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControlSummary:@"knownAssetSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [[MAAutoAssetInfoControl alloc] initClearingAfter:*(unsigned __int8 *)(a1 + 56) limitedToAssetTypes:*(void *)(a1 + 32)];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v8 = [v7 UUIDString];

    id v9 = +[MAAutoAssetControl assetSelectorOrAllSelector:0];
    uint64_t v10 = [MAAutoAssetInfoInstance alloc];
    id v11 = [*(id *)(a1 + 40) controlClientName];
    id v12 = [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v13 = [*(id *)(a1 + 40) controlClientProcessID];
    id v14 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetInfoInstance *)v10 initForClientName:v11 withProcessName:v12 withProcessID:v13 usingAssetSelector:v9 associatingFrameworkUUID:v14];

    [v6 setSafeObject:v15 forKey:@"instance"];
    [v6 setSafeObject:v5 forKey:@"control"];
    BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-CONTROL:KNOWN_ASSET_SUMMARY" clientID:v8 version:0 message:v6];
    uint64_t v17 = [*(id *)(a1 + 40) connectionClient];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__MAAutoAssetControl__knownAssetSummary_limitedToAssetTypes_completion___block_invoke_2;
    void v19[3] = &unk_1E6004158;
    char v18 = *(void **)(a1 + 48);
    v19[4] = *(void *)(a1 + 40);
    id v20 = v18;
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v19];
  }
}

void __72__MAAutoAssetControl__knownAssetSummary_limitedToAssetTypes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [*(id *)(a1 + 32) _failedControlSummary:@"knownAssetSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    id v7 = [v6 safeObjectForKey:@"jobSummary" ofClass:objc_opt_class()];

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"knownAssetSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"knownAssetSummary" withErrorCode:6110 withResponseError:0 description:@"no known-asset-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)lockedAssetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetControl lockedAssetSummary:a3 limitedToAssetTypes:0 error:a4];
}

+ (id)lockedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = +[MAAutoAssetControl autoAssetControl];
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__6;
  uint64_t v29 = __Block_byref_object_dispose__6;
  id v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke;
  v15[3] = &unk_1E6004108;
  uint64_t v17 = v21;
  char v18 = &v31;
  id v19 = &v25;
  id v20 = v23;
  uint64_t v10 = v9;
  BOOL v16 = v10;
  [v8 _lockedAssetSummary:v6 limitedToAssetTypes:v7 completion:v15];
  if (+[MAAutoAssetControl waitOnSemaphore:v10 withTimeout:-2])
  {
    id v11 = +[MAAutoAssetControl frameworkDispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke_3;
    v14[3] = &unk_1E6004130;
    v14[4] = v23;
    v14[5] = v21;
    v14[6] = &v25;
    dispatch_sync(v11, v14);
  }
  if (a5) {
    *a5 = (id) v26[5];
  }
  id v12 = (id)v32[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v12;
}

void __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAssetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(lockedAssetSummary)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for locked-asset-summary to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_lockedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__MAAutoAssetControl__lockedAssetSummary_limitedToAssetTypes_completion___block_invoke;
    v12[3] = &unk_1E6004180;
    BOOL v16 = a3;
    id v13 = v8;
    id v14 = self;
    id v15 = v9;
    [(MAAutoAssetControl *)self connectToServerFrameworkCompletion:v12];

    id v10 = v13;
  }
  else
  {
    long long v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v10 = [v11 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _lockedAssetSummary:limitedToAssetTypes:completion:]();
    }
  }
}

void __73__MAAutoAssetControl__lockedAssetSummary_limitedToAssetTypes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControlLockSummary:@"lockedAssetSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [[MAAutoAssetInfoControl alloc] initClearingAfter:*(unsigned __int8 *)(a1 + 56) limitedToAssetTypes:*(void *)(a1 + 32)];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v8 = [v7 UUIDString];

    id v9 = +[MAAutoAssetControl assetSelectorOrAllSelector:0];
    id v10 = [MAAutoAssetInfoInstance alloc];
    long long v11 = [*(id *)(a1 + 40) controlClientName];
    id v12 = [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v13 = [*(id *)(a1 + 40) controlClientProcessID];
    id v14 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetInfoInstance *)v10 initForClientName:v11 withProcessName:v12 withProcessID:v13 usingAssetSelector:v9 associatingFrameworkUUID:v14];

    [v6 setSafeObject:v15 forKey:@"instance"];
    [v6 setSafeObject:v5 forKey:@"control"];
    BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-CONTROL:LOCKED_ASSET_SUMMARY" clientID:v8 version:0 message:v6];
    uint64_t v17 = [*(id *)(a1 + 40) connectionClient];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__MAAutoAssetControl__lockedAssetSummary_limitedToAssetTypes_completion___block_invoke_2;
    void v19[3] = &unk_1E6004158;
    char v18 = *(void **)(a1 + 48);
    v19[4] = *(void *)(a1 + 40);
    id v20 = v18;
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v19];
  }
}

void __73__MAAutoAssetControl__lockedAssetSummary_limitedToAssetTypes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [*(id *)(a1 + 32) _failedControlLockSummary:@"lockedAssetSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    id v7 = [v6 safeObjectForKey:@"lockSummary" ofClass:objc_opt_class()];

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlLockSummary:@"lockedAssetSummary" withLockSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlLockSummary:@"lockedAssetSummary" withErrorCode:6110 withResponseError:0 description:@"no locked-asset-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)stagedAssetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetControl stagedAssetSummary:a3 limitedToAssetTypes:0 error:a4];
}

+ (id)stagedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = +[MAAutoAssetControl autoAssetControl];
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__6;
  uint64_t v29 = __Block_byref_object_dispose__6;
  id v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke;
  v15[3] = &unk_1E6004108;
  uint64_t v17 = v21;
  char v18 = &v31;
  id v19 = &v25;
  id v20 = v23;
  uint64_t v10 = v9;
  BOOL v16 = v10;
  [v8 _stagedAssetSummary:v6 limitedToAssetTypes:v7 completion:v15];
  if (+[MAAutoAssetControl waitOnSemaphore:v10 withTimeout:-2])
  {
    id v11 = +[MAAutoAssetControl frameworkDispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke_3;
    v14[3] = &unk_1E6004130;
    v14[4] = v23;
    v14[5] = v21;
    v14[6] = &v25;
    dispatch_sync(v11, v14);
  }
  if (a5) {
    *a5 = (id) v26[5];
  }
  id v12 = (id)v32[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v12;
}

void __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAssetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(stagedAssetSummary)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for staged-asset-summary to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_stagedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__MAAutoAssetControl__stagedAssetSummary_limitedToAssetTypes_completion___block_invoke;
    v12[3] = &unk_1E6004180;
    BOOL v16 = a3;
    id v13 = v8;
    id v14 = self;
    id v15 = v9;
    [(MAAutoAssetControl *)self connectToServerFrameworkCompletion:v12];

    id v10 = v13;
  }
  else
  {
    long long v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v10 = [v11 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _stagedAssetSummary:limitedToAssetTypes:completion:]();
    }
  }
}

void __73__MAAutoAssetControl__stagedAssetSummary_limitedToAssetTypes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControlSummary:@"stagedAssetSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [[MAAutoAssetInfoControl alloc] initClearingAfter:*(unsigned __int8 *)(a1 + 56) limitedToAssetTypes:*(void *)(a1 + 32)];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v8 = [v7 UUIDString];

    id v9 = +[MAAutoAssetControl assetSelectorOrAllSelector:0];
    id v10 = [MAAutoAssetInfoInstance alloc];
    long long v11 = [*(id *)(a1 + 40) controlClientName];
    id v12 = [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v13 = [*(id *)(a1 + 40) controlClientProcessID];
    id v14 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetInfoInstance *)v10 initForClientName:v11 withProcessName:v12 withProcessID:v13 usingAssetSelector:v9 associatingFrameworkUUID:v14];

    [v6 setSafeObject:v15 forKey:@"instance"];
    [v6 setSafeObject:v5 forKey:@"control"];
    BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-CONTROL:STAGED_ASSET_SUMMARY" clientID:v8 version:0 message:v6];
    uint64_t v17 = [*(id *)(a1 + 40) connectionClient];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__MAAutoAssetControl__stagedAssetSummary_limitedToAssetTypes_completion___block_invoke_2;
    void v19[3] = &unk_1E6004158;
    char v18 = *(void **)(a1 + 48);
    v19[4] = *(void *)(a1 + 40);
    id v20 = v18;
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v19];
  }
}

void __73__MAAutoAssetControl__stagedAssetSummary_limitedToAssetTypes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [*(id *)(a1 + 32) _failedControlSummary:@"stagedAssetSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    id v7 = [v6 safeObjectForKey:@"jobSummary" ofClass:objc_opt_class()];

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"stagedAssetSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"stagedAssetSummary" withErrorCode:6110 withResponseError:0 description:@"no staged-asset-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)activeJobSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetControl activeJobSummary:a3 limitedToAssetTypes:0 error:a4];
}

+ (id)activeJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = +[MAAutoAssetControl autoAssetControl];
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__6;
  uint64_t v29 = __Block_byref_object_dispose__6;
  id v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke;
  v15[3] = &unk_1E6004108;
  uint64_t v17 = v21;
  char v18 = &v31;
  id v19 = &v25;
  id v20 = v23;
  uint64_t v10 = v9;
  BOOL v16 = v10;
  [v8 _activeJobSummary:v6 limitedToAssetTypes:v7 completion:v15];
  if (+[MAAutoAssetControl waitOnSemaphore:v10 withTimeout:-2])
  {
    id v11 = +[MAAutoAssetControl frameworkDispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke_3;
    v14[3] = &unk_1E6004130;
    v14[4] = v23;
    v14[5] = v21;
    v14[6] = &v25;
    dispatch_sync(v11, v14);
  }
  if (a5) {
    *a5 = (id) v26[5];
  }
  id v12 = (id)v32[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v12;
}

void __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAssetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(activeJobSummary)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for active-job-summary to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_activeJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__MAAutoAssetControl__activeJobSummary_limitedToAssetTypes_completion___block_invoke;
    v12[3] = &unk_1E6004180;
    BOOL v16 = a3;
    id v13 = v8;
    id v14 = self;
    id v15 = v9;
    [(MAAutoAssetControl *)self connectToServerFrameworkCompletion:v12];

    id v10 = v13;
  }
  else
  {
    long long v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v10 = [v11 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _activeJobSummary:limitedToAssetTypes:completion:]();
    }
  }
}

void __71__MAAutoAssetControl__activeJobSummary_limitedToAssetTypes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControlSummary:@"activeJobSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [[MAAutoAssetInfoControl alloc] initClearingAfter:*(unsigned __int8 *)(a1 + 56) limitedToAssetTypes:*(void *)(a1 + 32)];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v8 = [v7 UUIDString];

    id v9 = +[MAAutoAssetControl assetSelectorOrAllSelector:0];
    id v10 = [MAAutoAssetInfoInstance alloc];
    long long v11 = [*(id *)(a1 + 40) controlClientName];
    id v12 = [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v13 = [*(id *)(a1 + 40) controlClientProcessID];
    id v14 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetInfoInstance *)v10 initForClientName:v11 withProcessName:v12 withProcessID:v13 usingAssetSelector:v9 associatingFrameworkUUID:v14];

    [v6 setSafeObject:v15 forKey:@"instance"];
    [v6 setSafeObject:v5 forKey:@"control"];
    BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-CONTROL:ACTIVE_JOB_SUMMARY" clientID:v8 version:0 message:v6];
    uint64_t v17 = [*(id *)(a1 + 40) connectionClient];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__MAAutoAssetControl__activeJobSummary_limitedToAssetTypes_completion___block_invoke_2;
    void v19[3] = &unk_1E6004158;
    char v18 = *(void **)(a1 + 48);
    v19[4] = *(void *)(a1 + 40);
    id v20 = v18;
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v19];
  }
}

void __71__MAAutoAssetControl__activeJobSummary_limitedToAssetTypes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [*(id *)(a1 + 32) _failedControlSummary:@"activeJobSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    id v7 = [v6 safeObjectForKey:@"jobSummary" ofClass:objc_opt_class()];

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"activeJobSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"activeJobSummary" withErrorCode:6110 withResponseError:0 description:@"no active-job-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)scheduledJobSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetControl scheduledJobSummary:a3 limitedToAssetTypes:0 error:a4];
}

+ (id)scheduledJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = +[MAAutoAssetControl autoAssetControl];
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__6;
  uint64_t v29 = __Block_byref_object_dispose__6;
  id v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke;
  v15[3] = &unk_1E6004108;
  uint64_t v17 = v21;
  char v18 = &v31;
  id v19 = &v25;
  id v20 = v23;
  uint64_t v10 = v9;
  BOOL v16 = v10;
  [v8 _scheduledJobSummary:v6 limitedToAssetTypes:v7 completion:v15];
  if (+[MAAutoAssetControl waitOnSemaphore:v10 withTimeout:-2])
  {
    id v11 = +[MAAutoAssetControl frameworkDispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke_3;
    v14[3] = &unk_1E6004130;
    v14[4] = v23;
    v14[5] = v21;
    v14[6] = &v25;
    dispatch_sync(v11, v14);
  }
  if (a5) {
    *a5 = (id) v26[5];
  }
  id v12 = (id)v32[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v12;
}

void __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAssetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(scheduledJobSummary)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for scheduled-job-summary to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_scheduledJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__MAAutoAssetControl__scheduledJobSummary_limitedToAssetTypes_completion___block_invoke;
    v12[3] = &unk_1E6004180;
    BOOL v16 = a3;
    id v13 = v8;
    id v14 = self;
    id v15 = v9;
    [(MAAutoAssetControl *)self connectToServerFrameworkCompletion:v12];

    id v10 = v13;
  }
  else
  {
    long long v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v10 = [v11 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _scheduledJobSummary:limitedToAssetTypes:completion:]();
    }
  }
}

void __74__MAAutoAssetControl__scheduledJobSummary_limitedToAssetTypes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControlSummary:@"scheduledJobSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [[MAAutoAssetInfoControl alloc] initClearingAfter:*(unsigned __int8 *)(a1 + 56) limitedToAssetTypes:*(void *)(a1 + 32)];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v8 = [v7 UUIDString];

    id v9 = +[MAAutoAssetControl assetSelectorOrAllSelector:0];
    id v10 = [MAAutoAssetInfoInstance alloc];
    long long v11 = [*(id *)(a1 + 40) controlClientName];
    id v12 = [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v13 = [*(id *)(a1 + 40) controlClientProcessID];
    id v14 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetInfoInstance *)v10 initForClientName:v11 withProcessName:v12 withProcessID:v13 usingAssetSelector:v9 associatingFrameworkUUID:v14];

    [v6 setSafeObject:v15 forKey:@"instance"];
    [v6 setSafeObject:v5 forKey:@"control"];
    BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-CONTROL:SCHEDULED_JOB_SUMMARY" clientID:v8 version:0 message:v6];
    uint64_t v17 = [*(id *)(a1 + 40) connectionClient];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__MAAutoAssetControl__scheduledJobSummary_limitedToAssetTypes_completion___block_invoke_2;
    void v19[3] = &unk_1E6004158;
    char v18 = *(void **)(a1 + 48);
    v19[4] = *(void *)(a1 + 40);
    id v20 = v18;
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v19];
  }
}

void __74__MAAutoAssetControl__scheduledJobSummary_limitedToAssetTypes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [*(id *)(a1 + 32) _failedControlSummary:@"scheduledJobSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    id v7 = [v6 safeObjectForKey:@"jobSummary" ofClass:objc_opt_class()];

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"scheduledJobSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"scheduledJobSummary" withErrorCode:6110 withResponseError:0 description:@"no scheduled-job-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)forceGlobalUnlock:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[MAAutoAssetControl autoAssetControl];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__6;
  char v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke;
  v11[3] = &unk_1E60059A0;
  uint64_t v13 = v16;
  id v14 = &v20;
  id v15 = v18;
  id v6 = v5;
  id v12 = v6;
  [v4 _forceGlobalUnlock:v3 completion:v11];
  if (+[MAAutoAssetControl waitOnSemaphore:v6 withTimeout:-2])
  {
    id v7 = +[MAAutoAssetControl frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v18;
    block[5] = v16;
    block[6] = &v20;
    dispatch_sync(v7, block);
  }
  id v8 = (id)v21[5];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MAAutoAssetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 48);
  block[2] = __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke_2;
  block[3] = &unk_1E6005748;
  id v9 = v3;
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_sync(v4, block);
}

intptr_t __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(forceGlobalUnlock)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for force-global-unlock to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_forceGlobalUnlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__MAAutoAssetControl__forceGlobalUnlock_completion___block_invoke;
    v10[3] = &unk_1E60041F8;
    long long v11 = v6;
    id v12 = self;
    id v13 = v7;
    [(MAAutoAssetControl *)self connectToServerFrameworkCompletion:v10];

    id v8 = v11;
  }
  else
  {
    id v9 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v8 = [v9 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _forceGlobalUnlock:completion:]();
    }
  }
}

void __52__MAAutoAssetControl__forceGlobalUnlock_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControl:@"forceGlobalUnlock" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v7 = [v6 UUIDString];

    id v8 = +[MAAutoAssetControl assetSelectorOrAllSelector:*(void *)(a1 + 32)];
    id v9 = [MAAutoAssetInfoInstance alloc];
    long long v10 = [*(id *)(a1 + 40) controlClientName];
    long long v11 = [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v12 = [*(id *)(a1 + 40) controlClientProcessID];
    id v13 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v14 = [(MAAutoAssetInfoInstance *)v9 initForClientName:v10 withProcessName:v11 withProcessID:v12 usingAssetSelector:v8 associatingFrameworkUUID:v13];

    [v5 setSafeObject:v14 forKey:@"instance"];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-CONTROL:FORCE_GLOBAL_UNLOCK" clientID:v7 version:0 message:v5];
    BOOL v16 = [*(id *)(a1 + 40) connectionClient];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__MAAutoAssetControl__forceGlobalUnlock_completion___block_invoke_2;
    void v18[3] = &unk_1E6004158;
    char v17 = *(void **)(a1 + 48);
    v18[4] = *(void *)(a1 + 40);
    id v19 = v17;
    [v16 connectClientSendServerMessage:v15 proxyObject:0 withReply:v18];
  }
}

void __52__MAAutoAssetControl__forceGlobalUnlock_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      id v7 = @"failure reported by server";
      uint64_t v8 = 0;
      id v9 = v5;
    }
    else
    {
      id v7 = @"no response message from server";
      uint64_t v8 = 6104;
      id v9 = 0;
    }
    [v6 _failedControl:@"forceGlobalUnlock" withErrorCode:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successControl:@"forceGlobalUnlock" completion:*(void *)(a1 + 40)];
  }
}

+ (id)forceGlobalForget:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[MAAutoAssetControl autoAssetControl];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__6;
  char v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__MAAutoAssetControl_forceGlobalForget___block_invoke;
  v11[3] = &unk_1E60059A0;
  id v13 = v16;
  id v14 = &v20;
  id v15 = v18;
  id v6 = v5;
  uint64_t v12 = v6;
  [v4 _forceGlobalForget:v3 completion:v11];
  if (+[MAAutoAssetControl waitOnSemaphore:v6 withTimeout:-2])
  {
    id v7 = +[MAAutoAssetControl frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__MAAutoAssetControl_forceGlobalForget___block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v18;
    block[5] = v16;
    block[6] = &v20;
    dispatch_sync(v7, block);
  }
  id v8 = (id)v21[5];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __40__MAAutoAssetControl_forceGlobalForget___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MAAutoAssetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 48);
  block[2] = __40__MAAutoAssetControl_forceGlobalForget___block_invoke_2;
  block[3] = &unk_1E6005748;
  id v9 = v3;
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_sync(v4, block);
}

intptr_t __40__MAAutoAssetControl_forceGlobalForget___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __40__MAAutoAssetControl_forceGlobalForget___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(forceGlobalForget)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for force-global-forget to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_forceGlobalForget:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__MAAutoAssetControl__forceGlobalForget_completion___block_invoke;
    v10[3] = &unk_1E60041F8;
    long long v11 = v6;
    uint64_t v12 = self;
    id v13 = v7;
    [(MAAutoAssetControl *)self connectToServerFrameworkCompletion:v10];

    id v8 = v11;
  }
  else
  {
    id v9 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v8 = [v9 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _forceGlobalForget:completion:]();
    }
  }
}

void __52__MAAutoAssetControl__forceGlobalForget_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControl:@"forceGlobalForget" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v7 = [v6 UUIDString];

    id v8 = +[MAAutoAssetControl assetSelectorOrAllSelector:*(void *)(a1 + 32)];
    id v9 = [MAAutoAssetInfoInstance alloc];
    long long v10 = [*(id *)(a1 + 40) controlClientName];
    long long v11 = [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v12 = [*(id *)(a1 + 40) controlClientProcessID];
    id v13 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v14 = [(MAAutoAssetInfoInstance *)v9 initForClientName:v10 withProcessName:v11 withProcessID:v12 usingAssetSelector:v8 associatingFrameworkUUID:v13];

    [v5 setSafeObject:v14 forKey:@"instance"];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-CONTROL:FORCE_GLOBAL_FORGET" clientID:v7 version:0 message:v5];
    BOOL v16 = [*(id *)(a1 + 40) connectionClient];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__MAAutoAssetControl__forceGlobalForget_completion___block_invoke_2;
    void v18[3] = &unk_1E6004158;
    char v17 = *(void **)(a1 + 48);
    v18[4] = *(void *)(a1 + 40);
    id v19 = v17;
    [v16 connectClientSendServerMessage:v15 proxyObject:0 withReply:v18];
  }
}

void __52__MAAutoAssetControl__forceGlobalForget_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      id v7 = @"failure reported by server";
      uint64_t v8 = 0;
      id v9 = v5;
    }
    else
    {
      id v7 = @"no response message from server";
      uint64_t v8 = 6104;
      id v9 = 0;
    }
    [v6 _failedControl:@"forceGlobalForget" withErrorCode:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successControl:@"forceGlobalForget" completion:*(void *)(a1 + 40)];
  }
}

+ (id)forceGlobalPurge:(id)a3 forcingUnlock:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[MAAutoAssetControl autoAssetControl];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__6;
  id v26 = __Block_byref_object_dispose__6;
  id v27 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke;
  v13[3] = &unk_1E60059A0;
  id v15 = v18;
  BOOL v16 = &v22;
  char v17 = v20;
  uint64_t v8 = v7;
  id v14 = v8;
  [v6 _forceGlobalPurge:v5 forcingUnlock:v4 completion:v13];
  if (+[MAAutoAssetControl waitOnSemaphore:v8 withTimeout:-2])
  {
    id v9 = +[MAAutoAssetControl frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v20;
    block[5] = v18;
    block[6] = &v22;
    dispatch_sync(v9, block);
  }
  id v10 = (id)v23[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[MAAutoAssetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 48);
  block[2] = __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke_2;
  block[3] = &unk_1E6005748;
  id v9 = v3;
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_sync(v4, block);
}

intptr_t __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(forceGlobalPurge)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for force-global-purge to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_forceGlobalPurge:(id)a3 forcingUnlock:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__MAAutoAssetControl__forceGlobalPurge_forcingUnlock_completion___block_invoke;
    v12[3] = &unk_1E6004180;
    BOOL v16 = a4;
    id v13 = v8;
    id v14 = self;
    id v15 = v9;
    [(MAAutoAssetControl *)self connectToServerFrameworkCompletion:v12];

    long long v10 = v13;
  }
  else
  {
    long long v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    long long v10 = [v11 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _forceGlobalPurge:forcingUnlock:completion:]();
    }
  }
}

void __65__MAAutoAssetControl__forceGlobalPurge_forcingUnlock_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControl:@"forceGlobalPurge" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [[MAAutoAssetInfoControl alloc] initForcingUnlock:*(unsigned __int8 *)(a1 + 56)];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v7 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v8 = [v7 UUIDString];

    id v9 = +[MAAutoAssetControl assetSelectorOrAllSelector:*(void *)(a1 + 32)];
    long long v10 = [MAAutoAssetInfoInstance alloc];
    long long v11 = [*(id *)(a1 + 40) controlClientName];
    uint64_t v12 = [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v13 = [*(id *)(a1 + 40) controlClientProcessID];
    id v14 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetInfoInstance *)v10 initForClientName:v11 withProcessName:v12 withProcessID:v13 usingAssetSelector:v9 associatingFrameworkUUID:v14];

    [v6 setSafeObject:v15 forKey:@"instance"];
    [v6 setSafeObject:v5 forKey:@"control"];
    BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-CONTROL:FORCE_GLOBAL_PURGE" clientID:v8 version:0 message:v6];
    char v17 = [*(id *)(a1 + 40) connectionClient];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __65__MAAutoAssetControl__forceGlobalPurge_forcingUnlock_completion___block_invoke_2;
    void v19[3] = &unk_1E6004158;
    char v18 = *(void **)(a1 + 48);
    v19[4] = *(void *)(a1 + 40);
    id v20 = v18;
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v19];
  }
}

void __65__MAAutoAssetControl__forceGlobalPurge_forcingUnlock_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      long long v7 = @"failure reported by server";
      uint64_t v8 = 0;
      id v9 = v5;
    }
    else
    {
      long long v7 = @"no response message from server";
      uint64_t v8 = 6104;
      id v9 = 0;
    }
    [v6 _failedControl:@"forceGlobalPurge" withErrorCode:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successControl:@"forceGlobalPurge" completion:*(void *)(a1 + 40)];
  }
}

+ (id)forceGlobalAbandon:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[MAAutoAssetControl autoAssetControl];
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__6;
  uint64_t v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke;
  v11[3] = &unk_1E60059A0;
  uint64_t v13 = v16;
  id v14 = &v20;
  id v15 = v18;
  id v6 = v5;
  uint64_t v12 = v6;
  [v4 _forceGlobalAbandon:v3 completion:v11];
  if (+[MAAutoAssetControl waitOnSemaphore:v6 withTimeout:-2])
  {
    long long v7 = +[MAAutoAssetControl frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v18;
    block[5] = v16;
    block[6] = &v20;
    dispatch_sync(v7, block);
  }
  id v8 = (id)v21[5];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MAAutoAssetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 48);
  block[2] = __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke_2;
  block[3] = &unk_1E6005748;
  id v9 = v3;
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_sync(v4, block);
}

intptr_t __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(forceGlobalAbandon)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for force-global-abandon to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_forceGlobalAbandon:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__MAAutoAssetControl__forceGlobalAbandon_completion___block_invoke;
    v10[3] = &unk_1E60041F8;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(MAAutoAssetControl *)self connectToServerFrameworkCompletion:v10];
  }
  else
  {
    id v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _forceGlobalAbandon:completion:]();
    }
  }
}

void __53__MAAutoAssetControl__forceGlobalAbandon_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControl:@"forceGlobalAbandon" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) controlClientName];
    id v7 = [*(id *)(a1 + 32) controlClientProcessName];
    uint64_t v8 = [*(id *)(a1 + 32) controlClientProcessID];
    uint64_t v9 = *(void *)(a1 + 40);
    long long v10 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v13 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v14 = [v13 UUIDString];

    [v12 setSafeObject:v11 forKey:@"instance"];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-CONTROL:FORCE_GLOBAL_ABANDON" clientID:v14 version:0 message:v12];
    BOOL v16 = [*(id *)(a1 + 32) connectionClient];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__MAAutoAssetControl__forceGlobalAbandon_completion___block_invoke_2;
    void v17[3] = &unk_1E6004158;
    v17[4] = *(void *)(a1 + 32);
    id v18 = *(id *)(a1 + 48);
    [v16 connectClientSendServerMessage:v15 proxyObject:0 withReply:v17];
  }
}

void __53__MAAutoAssetControl__forceGlobalAbandon_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      id v7 = @"failure reported by server";
      uint64_t v8 = 0;
      id v9 = v5;
    }
    else
    {
      id v7 = @"no response message from server";
      uint64_t v8 = 6104;
      id v9 = 0;
    }
    [v6 _failedControl:@"forceGlobalAbandon" withErrorCode:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successControl:@"forceGlobalAbandon" completion:*(void *)(a1 + 40)];
  }
}

+ (int64_t)simulateCacheDeleteDetermineReclaimableSpace:(id)a3 withUrgency:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  uint64_t v8 = +[MAAutoAssetControl autoAssetControl];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = (id *)&v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__6;
  id v32 = __Block_byref_object_dispose__6;
  id v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  id v10 = v29;
  id v11 = v29[5];
  uint64_t v22 = v26;
  id obj = v11;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke;
  void v17[3] = &unk_1E6005A40;
  char v19 = v24;
  uint64_t v20 = &v34;
  char v21 = &v28;
  id v12 = v9;
  id v18 = v12;
  [v8 _simulateCacheDeleteDetermineReclaimableSpace:v7 withUrgency:v6 error:&obj completion:v17];
  objc_storeStrong(v10 + 5, obj);
  if (+[MAAutoAssetControl waitOnSemaphore:v12 withTimeout:-2])
  {
    uint64_t v13 = +[MAAutoAssetControl frameworkDispatchQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke_3;
    void v16[3] = &unk_1E6004130;
    v16[4] = v26;
    v16[5] = v24;
    v16[6] = &v28;
    dispatch_sync(v13, v16);
  }
  if (a5) {
    *a5 = v29[5];
  }
  int64_t v14 = v35[3];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v14;
}

void __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[MAAutoAssetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v9 = *(_OWORD *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 48);
  block[2] = __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke_2;
  block[3] = &unk_1E6005A18;
  id v11 = v5;
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v15 = a2;
  id v7 = (id)v9;
  long long v12 = v9;
  id v8 = v5;
  dispatch_sync(v6, block);
}

intptr_t __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    *(void *)(*(void *)(*(void *)(result + 56) + 8) + 24) = *(void *)(result + 80);
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 72) + 8) + 24) = 1;
    v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(simulateCacheDeleteDetermineReclaimableSpace)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for simulated-cache-delete-operation to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_simulateCacheDeleteDetermineReclaimableSpace:(id)a3 withUrgency:(int)a4 error:(id *)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  if (v10)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __97__MAAutoAssetControl__simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error_completion___block_invoke;
    v13[3] = &unk_1E6005A68;
    int v17 = a4;
    uint64_t v14 = v9;
    uint64_t v15 = self;
    id v16 = v10;
    [(MAAutoAssetControl *)self connectToServerFrameworkCompletion:v13];

    id v11 = v14;
  }
  else
  {
    long long v12 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v11 = [v12 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _simulateCacheDeleteDetermineReclaimableSpace:withUrgency:error:completion:]();
    }
  }
}

void __97__MAAutoAssetControl__simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedSimulateCacheDeleteOperation:@"simulateCacheDeleteDetermineReclaimableSpace" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [[MAAutoAssetInfoControl alloc] initWithVolumeToReclaim:*(void *)(a1 + 32) withUrgency:*(unsigned int *)(a1 + 56) targetingPurgeAmount:0];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v8 = [v7 UUIDString];

    id v9 = +[MAAutoAssetControl assetSelectorOrAllSelector:0];
    id v10 = [MAAutoAssetInfoInstance alloc];
    id v11 = [*(id *)(a1 + 40) controlClientName];
    long long v12 = [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v13 = [*(id *)(a1 + 40) controlClientProcessID];
    uint64_t v14 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetInfoInstance *)v10 initForClientName:v11 withProcessName:v12 withProcessID:v13 usingAssetSelector:v9 associatingFrameworkUUID:v14];

    [v6 setSafeObject:v15 forKey:@"instance"];
    [v6 setSafeObject:v5 forKey:@"control"];
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-CONTROL:SIM_CACHE_DELETE_DETERMINE_RECLAIMABLE" clientID:v8 version:0 message:v6];
    int v17 = [*(id *)(a1 + 40) connectionClient];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __97__MAAutoAssetControl__simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error_completion___block_invoke_2;
    void v19[3] = &unk_1E6004158;
    id v18 = *(void **)(a1 + 48);
    v19[4] = *(void *)(a1 + 40);
    id v20 = v18;
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v19];
  }
}

void __97__MAAutoAssetControl__simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (!v11 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      uint64_t v9 = 0;
      id v10 = v5;
    }
    else
    {
      id v8 = @"no response message from server";
      uint64_t v9 = 6104;
      id v10 = 0;
    }
    [*(id *)(a1 + 32) _failedSimulateCacheDeleteOperation:@"simulateCacheDeleteDetermineReclaimableSpace" withErrorCode:v9 withResponseError:v10 description:v8 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v11 message];
    id v7 = [v6 safeObjectForKey:@"control" ofClass:objc_opt_class()];

    if (v7) {
      objc_msgSend(*(id *)(a1 + 32), "_successSimulateCacheDeleteOperation:withReclaimableSpace:completion:", @"simulateCacheDeleteDetermineReclaimableSpace", objc_msgSend(v7, "targetingPurgeAmount"), *(void *)(a1 + 40));
    }
    else {
      [*(id *)(a1 + 32) _failedSimulateCacheDeleteOperation:@"simulateCacheDeleteDetermineReclaimableSpace" withErrorCode:6111 withResponseError:0 description:@"no control results information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (int64_t)simulateCacheDeleteReclaimSpace:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a4;
  id v8 = a3;
  uint64_t v9 = +[MAAutoAssetControl autoAssetControl];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v31 = 0;
  id v32 = (id *)&v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  id v36 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  id v11 = v32;
  id v12 = v32[5];
  char v25 = v29;
  id obj = v12;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke;
  void v20[3] = &unk_1E6005A40;
  uint64_t v22 = v27;
  uint64_t v23 = &v37;
  uint64_t v13 = v8;
  uint64_t v24 = &v31;
  uint64_t v14 = v10;
  char v21 = v14;
  [v9 _simulateCacheDeleteReclaimSpace:v8 withUrgency:v7 targetingPurgeAmount:a5 error:&obj completion:v20];
  objc_storeStrong(v11 + 5, obj);
  if (+[MAAutoAssetControl waitOnSemaphore:v14 withTimeout:-2])
  {
    id v15 = +[MAAutoAssetControl frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v29;
    block[5] = v27;
    block[6] = &v31;
    dispatch_sync(v15, block);
  }
  if (a6) {
    *a6 = v32[5];
  }
  int64_t v16 = v38[3];

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v16;
}

void __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = +[MAAutoAssetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v9 = *(_OWORD *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 48);
  block[2] = __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke_2;
  block[3] = &unk_1E6005A18;
  id v11 = v5;
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v15 = a2;
  id v7 = (id)v9;
  long long v12 = v9;
  id v8 = v5;
  dispatch_sync(v6, block);
}

intptr_t __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    *(void *)(*(void *)(*(void *)(result + 56) + 8) + 24) = *(void *)(result + 80);
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 72) + 8) + 24) = 1;
    v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(simulateCacheDeleteReclaimSpace)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for simulated-cache-delete-operation to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_simulateCacheDeleteReclaimSpace:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5 error:(id *)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  if (v12)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __105__MAAutoAssetControl__simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error_completion___block_invoke;
    v15[3] = &unk_1E6005A90;
    int v20 = a4;
    int64_t v19 = a5;
    int64_t v16 = v11;
    int v17 = self;
    id v18 = v12;
    [(MAAutoAssetControl *)self connectToServerFrameworkCompletion:v15];

    long long v13 = v16;
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4FA56C8] sharedLogger];
    long long v13 = [v14 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _simulateCacheDeleteReclaimSpace:withUrgency:targetingPurgeAmount:error:completion:]();
    }
  }
}

void __105__MAAutoAssetControl__simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedSimulateCacheDeleteOperation:@"simulateCacheDeleteReclaimSpace" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [[MAAutoAssetInfoControl alloc] initWithVolumeToReclaim:*(void *)(a1 + 32) withUrgency:*(unsigned int *)(a1 + 64) targetingPurgeAmount:*(void *)(a1 + 56)];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v8 = [v7 UUIDString];

    long long v9 = +[MAAutoAssetControl assetSelectorOrAllSelector:0];
    dispatch_semaphore_t v10 = [MAAutoAssetInfoInstance alloc];
    id v11 = [*(id *)(a1 + 40) controlClientName];
    id v12 = [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v13 = [*(id *)(a1 + 40) controlClientProcessID];
    uint64_t v14 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetInfoInstance *)v10 initForClientName:v11 withProcessName:v12 withProcessID:v13 usingAssetSelector:v9 associatingFrameworkUUID:v14];

    [v6 setSafeObject:v15 forKey:@"instance"];
    [v6 setSafeObject:v5 forKey:@"control"];
    int64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-CONTROL:SIM_CACHE_DELETE_RECLAIM_SPACE" clientID:v8 version:0 message:v6];
    int v17 = [*(id *)(a1 + 40) connectionClient];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __105__MAAutoAssetControl__simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error_completion___block_invoke_2;
    void v19[3] = &unk_1E6004158;
    id v18 = *(void **)(a1 + 48);
    v19[4] = *(void *)(a1 + 40);
    id v20 = v18;
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v19];
  }
}

void __105__MAAutoAssetControl__simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (!v11 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      uint64_t v9 = 0;
      id v10 = v5;
    }
    else
    {
      id v8 = @"no response message from server";
      uint64_t v9 = 6104;
      id v10 = 0;
    }
    [*(id *)(a1 + 32) _failedSimulateCacheDeleteOperation:@"simulateCacheDeleteReclaimSpace" withErrorCode:v9 withResponseError:v10 description:v8 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v11 message];
    id v7 = [v6 safeObjectForKey:@"control" ofClass:objc_opt_class()];

    if (v7) {
      objc_msgSend(*(id *)(a1 + 32), "_successSimulateCacheDeleteOperation:withReclaimableSpace:completion:", @"simulateCacheDeleteReclaimSpace", objc_msgSend(v7, "targetingPurgeAmount"), *(void *)(a1 + 40));
    }
    else {
      [*(id *)(a1 + 32) _failedSimulateCacheDeleteOperation:@"simulateCacheDeleteReclaimSpace" withErrorCode:6111 withResponseError:0 description:@"no control results information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)simulateSetJobOperation:(int64_t)a3 withEndEvent:(int64_t)a4 forSelector:(id)a5
{
  id v7 = a5;
  id v8 = +[MAAutoAssetControl autoAssetControl];
  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x3032000000;
  char v27 = __Block_byref_object_copy__6;
  char v28 = __Block_byref_object_dispose__6;
  id v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke;
  v15[3] = &unk_1E60059A0;
  int v17 = v20;
  id v18 = &v24;
  int64_t v19 = v22;
  id v10 = v9;
  int64_t v16 = v10;
  [v8 _simulateSetJobOperation:a3 withEndEvent:a4 forSelector:v7 completion:v15];
  if (+[MAAutoAssetControl waitOnSemaphore:v10 withTimeout:-2])
  {
    id v11 = +[MAAutoAssetControl frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v22;
    block[5] = v20;
    block[6] = &v24;
    dispatch_sync(v11, block);
  }
  id v12 = (id)v25[5];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MAAutoAssetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 48);
  block[2] = __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke_2;
  block[3] = &unk_1E6005748;
  id v9 = v3;
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_sync(v4, block);
}

intptr_t __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(simulateSetJobOperation)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for simulate-job-operation to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_simulateSetJobOperation:(int64_t)a3 withEndEvent:(int64_t)a4 forSelector:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (v11)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__MAAutoAssetControl__simulateSetJobOperation_withEndEvent_forSelector_completion___block_invoke;
    v14[3] = &unk_1E6005AB8;
    v14[4] = self;
    id v15 = v10;
    int64_t v17 = a3;
    int64_t v18 = a4;
    id v16 = v11;
    [(MAAutoAssetControl *)self connectToServerFrameworkCompletion:v14];
  }
  else
  {
    id v12 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v13 = [v12 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _simulateSetJobOperation:withEndEvent:forSelector:completion:]();
    }
  }
}

void __83__MAAutoAssetControl__simulateSetJobOperation_withEndEvent_forSelector_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControl:@"simulateSetJobOperation" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) controlClientName];
    long long v7 = [*(id *)(a1 + 32) controlClientProcessName];
    uint64_t v8 = [*(id *)(a1 + 32) controlClientProcessID];
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = [[MAAutoAssetInfoControl alloc] initForSimulateOperation:*(void *)(a1 + 56) withSimulateEnd:*(void *)(a1 + 64)];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v14 = +[MAAutoAssetControl frameworkInstanceUUID];
    id v15 = [v14 UUIDString];

    [v13 setSafeObject:v11 forKey:@"instance"];
    [v13 setSafeObject:v12 forKey:@"control"];
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-CONTROL:SIM_SET_JOB_OPERATION" clientID:v15 version:0 message:v13];
    int64_t v17 = [*(id *)(a1 + 32) connectionClient];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __83__MAAutoAssetControl__simulateSetJobOperation_withEndEvent_forSelector_completion___block_invoke_2;
    void v18[3] = &unk_1E6004158;
    v18[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 48);
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v18];
  }
}

void __83__MAAutoAssetControl__simulateSetJobOperation_withEndEvent_forSelector_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      long long v7 = @"failure reported by server";
      uint64_t v8 = 0;
      id v9 = v5;
    }
    else
    {
      long long v7 = @"no response message from server";
      uint64_t v8 = 6104;
      id v9 = 0;
    }
    [v6 _failedControl:@"simulateSetJobOperation" withErrorCode:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successControl:@"simulateSetJobOperation" completion:*(void *)(a1 + 40)];
  }
}

+ (id)defaultDispatchQueue
{
  if (defaultDispatchQueue_defaultQueueOnce_2 != -1) {
    dispatch_once(&defaultDispatchQueue_defaultQueueOnce_2, &__block_literal_global_10);
  }
  v2 = (void *)defaultDispatchQueue_defaultQueue_2;
  return v2;
}

void __42__MAAutoAssetControl_defaultDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.autoassetcontrol.client" UTF8String];
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)defaultDispatchQueue_defaultQueue_2;
  defaultDispatchQueue_defaultQueue_2 = (uint64_t)v1;
}

+ (id)autoAssetControl
{
  if (autoAssetControl_dispatchOnceAutoAssetControl != -1) {
    dispatch_once(&autoAssetControl_dispatchOnceAutoAssetControl, &__block_literal_global_503);
  }
  v2 = (void *)autoAssetControl___autoAssetControl;
  return v2;
}

uint64_t __38__MAAutoAssetControl_autoAssetControl__block_invoke()
{
  autoAssetControl___autoAssetControl = objc_alloc_init(MAAutoAssetControl);
  return MEMORY[0x1F41817F8]();
}

- (void)connectToServerFrameworkCompletion:(id)a3
{
  uint64_t v39 = (void (**)(id, void))a3;
  uint64_t v4 = [(MAAutoAssetControl *)self connectionClient];

  if (v4)
  {
    v39[2](v39, 0);
  }
  else
  {
    id v5 = +[MAAutoAssetControl frameworkInstanceUUID];
    v38 = [v5 UUIDString];

    id v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v35 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v37 = self;
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v25, v24, v23, v22, v21, v20, v19,
      v6,
      v7,
      v8,
      v9,
      v10,
      v11,
      v12,
      v13,
      v14,
      v15,
      objc_opt_class(),
    id v16 = 0);
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:CONTROL_STATISTICS"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:KNOWN_ASSET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:AVAILABLE_FOR_STAGING_ASSET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:LOCKED_ASSET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:STAGED_ASSET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:ACTIVE_JOB_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:SCHEDULED_JOB_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:FORCE_GLOBAL_UNLOCK"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:FORCE_GLOBAL_FORGET"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:FORCE_GLOBAL_PURGE"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:FORCE_GLOBAL_ABANDON"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:SIM_CACHE_DELETE_DETERMINE_RECLAIMABLE"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:SIM_CACHE_DELETE_RECLAIM_SPACE"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:SIM_SET_JOB_OPERATION"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:ALTER_ENTRIES_REPRESENTING_ATOMIC"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:NEED_FOR_ATOMIC"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:CHECK_ATOMIC"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:LOCK_ATOMIC"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:MAP_LOCKED_ATOMIC_ENTRY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:FORM_SUB_ATOMIC"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:CONTINUE_ATOMIC_LOCK"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:END_ATOMIC_LOCK"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:END_ATOMIC_LOCKS_FOR_CLIENT"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:ASSET_SET_FOR_STAGING"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:CURRENT_SET_STATUS"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:ELIMINATE_ATOMIC"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):CONTROL_STATISTICS"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):KNOWN_ASSET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):AVAILABLE_FOR_STAGING_ASSET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):LOCKED_ASSET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):STAGED_ASSET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):ACTIVE_JOB_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):SCHEDULED_JOB_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):FORCE_GLOBAL_UNLOCK"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):FORCE_GLOBAL_FORGET"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):FORCE_GLOBAL_PURGE"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):FORCE_GLOBAL_ABANDON"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):SIM_CACHE_DELETE_DETERMINE_RECLAIMABLE"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):SIM_CACHE_DELETE_RECLAIM_SPACE"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):SIM_SET_JOB_OPERATION"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL:KNOWN_ASSET_SET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL:ACTIVE_SET_JOB_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL:SCHEDULED_SET_JOB_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL:LOCKED_ASSET_SET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL:STAGED_ASSET_SET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):ALTER_ENTRIES_REPRESENTING_ATOMIC"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):NEED_FOR_ATOMIC"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):CHECK_ATOMIC"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):LOCK_ATOMIC"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):MAP_LOCKED_ATOMIC_ENTRY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):FORM_SUB_ATOMIC"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):CONTINUE_ATOMIC_LOCK"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):END_ATOMIC_LOCK"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):END_ATOMIC_LOCKS_FOR_CLIENT"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):ASSET_SET_FOR_STAGING"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):CURRENT_SET_STATUS"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):ELIMINATE_ATOMIC"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL(REPLY):ACTIVE_SET_JOB_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL(REPLY):SCHEDULED_SET_JOB_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL(REPLY):LOCKED_ASSET_SET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL(REPLY):STAGED_ASSET_SET_SUMMARY"];
    int64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4FA56A8]) initForServiceName:@"com.apple.mobileasset.autoasset" delegate:v37 clientID:v38];
    int64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4FA56A0]) initWithClientPolicy:v17];
    [(MAAutoAssetControl *)v37 setConnectionClient:v18];

    v39[2](v39, 0);
  }
}

+ (id)assetSelectorOrAllSelector:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    id v4 = [[MAAutoAssetSelector alloc] initForAssetType:@"MAAutoAssetControl-all-asset-types" withAssetSpecifier:@"MAAutoAssetControl-all-asset-specifiers"];
  }

  return v4;
}

- (void)_successControlStatistics:(id)a3 withControlStatistics:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = [(MAAutoAssetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__MAAutoAssetControl__successControlStatistics_withControlStatistics_completion___block_invoke;
    block[3] = &unk_1E6004290;
    uint64_t v15 = v8;
    id v17 = v10;
    id v16 = v9;
    dispatch_async(v11, block);

    uint64_t v12 = v15;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v12 = [v13 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _successControlStatistics:withControlStatistics:completion:]();
    }
  }
}

uint64_t __81__MAAutoAssetControl__successControlStatistics_withControlStatistics_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-control{_successControlStatistics} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_failedControlStatistics:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    id v16 = [(MAAutoAssetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__MAAutoAssetControl__failedControlStatistics_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004268;
    id v24 = v13;
    int64_t v28 = a4;
    id v25 = v12;
    id v26 = v14;
    id v27 = v15;
    dispatch_async(v16, block);

    id v17 = v24;
  }
  else
  {
    id v18 = [NSString alloc];
    if (v13)
    {
      uint64_t v19 = [v13 checkedSummary];
      uint64_t v20 = [v18 initWithFormat:@"%@ | error:%@", v14, v19];
    }
    else
    {
      uint64_t v19 = +[MAAutoAssetError summaryForCode:a4 fromOperation:v12];
      uint64_t v20 = [v18 initWithFormat:@"%@ | result:%@", v14, v19];
    }
    id v17 = (void *)v20;

    uint64_t v21 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v22 = [v21 oslog];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _failedControlStatistics:withErrorCode:withResponseError:description:completion:]();
    }
  }
}

void __102__MAAutoAssetControl__failedControlStatistics_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 64);
    if (v3)
    {
      id v2 = +[MAAutoAssetError buildError:v3 fromOperation:*(void *)(a1 + 40) underlyingError:0 withDescription:*(void *)(a1 + 48)];
    }
    else
    {
      id v2 = 0;
    }
  }
  uint64_t v4 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __102__MAAutoAssetControl__failedControlStatistics_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_successControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(MAAutoAssetControl *)self completionDispatchQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__MAAutoAssetControl__successControl_completion___block_invoke;
    v11[3] = &unk_1E6004240;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v8, v11);

    id v9 = v12;
  }
  else
  {
    id v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v9 = [v10 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _successControl:completion:]();
    }
  }
}

uint64_t __49__MAAutoAssetControl__successControl_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  uint64_t v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-control{_successControl} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_failedControl:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    id v16 = [(MAAutoAssetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__MAAutoAssetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004268;
    id v24 = v13;
    int64_t v28 = a4;
    id v25 = v12;
    id v26 = v14;
    id v27 = v15;
    dispatch_async(v16, block);

    id v17 = v24;
  }
  else
  {
    id v18 = [NSString alloc];
    if (v13)
    {
      uint64_t v19 = [v13 checkedSummary];
      uint64_t v20 = [v18 initWithFormat:@"%@ | error:%@", v14, v19];
    }
    else
    {
      uint64_t v19 = +[MAAutoAssetError summaryForCode:a4 fromOperation:v12];
      uint64_t v20 = [v18 initWithFormat:@"%@ | result:%@", v14, v19];
    }
    id v17 = (void *)v20;

    uint64_t v21 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v22 = [v21 oslog];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _failedControl:withErrorCode:withResponseError:description:completion:]();
    }
  }
}

void __92__MAAutoAssetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 64);
    if (v3)
    {
      id v2 = +[MAAutoAssetError buildError:v3 fromOperation:*(void *)(a1 + 40) underlyingError:0 withDescription:*(void *)(a1 + 48)];
    }
    else
    {
      id v2 = 0;
    }
  }
  uint64_t v4 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __92__MAAutoAssetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_successControlSummary:(id)a3 withJobSummaryEntries:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = [(MAAutoAssetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__MAAutoAssetControl__successControlSummary_withJobSummaryEntries_completion___block_invoke;
    block[3] = &unk_1E6004290;
    id v15 = v8;
    id v17 = v10;
    id v16 = v9;
    dispatch_async(v11, block);

    id v12 = v15;
  }
  else
  {
    id v13 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v12 = [v13 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _successControlSummary:withJobSummaryEntries:completion:]();
    }
  }
}

uint64_t __78__MAAutoAssetControl__successControlSummary_withJobSummaryEntries_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  uint64_t v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-control{_successControlSummary} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_failedControlSummary:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    id v16 = [(MAAutoAssetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__MAAutoAssetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004268;
    id v24 = v13;
    int64_t v28 = a4;
    id v25 = v12;
    id v26 = v14;
    id v27 = v15;
    dispatch_async(v16, block);

    id v17 = v24;
  }
  else
  {
    id v18 = [NSString alloc];
    if (v13)
    {
      uint64_t v19 = [v13 checkedSummary];
      uint64_t v20 = [v18 initWithFormat:@"%@ | error:%@", v14, v19];
    }
    else
    {
      uint64_t v19 = +[MAAutoAssetError summaryForCode:a4 fromOperation:v12];
      uint64_t v20 = [v18 initWithFormat:@"%@ | result:%@", v14, v19];
    }
    id v17 = (void *)v20;

    uint64_t v21 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v22 = [v21 oslog];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _failedControlSummary:withErrorCode:withResponseError:description:completion:]();
    }
  }
}

void __99__MAAutoAssetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 64);
    if (v3)
    {
      id v2 = +[MAAutoAssetError buildError:v3 fromOperation:*(void *)(a1 + 40) underlyingError:0 withDescription:*(void *)(a1 + 48)];
    }
    else
    {
      id v2 = 0;
    }
  }
  uint64_t v4 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __99__MAAutoAssetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_successControlLockSummary:(id)a3 withLockSummaryEntries:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = [(MAAutoAssetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__MAAutoAssetControl__successControlLockSummary_withLockSummaryEntries_completion___block_invoke;
    block[3] = &unk_1E6004290;
    id v15 = v8;
    id v17 = v10;
    id v16 = v9;
    dispatch_async(v11, block);

    id v12 = v15;
  }
  else
  {
    id v13 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v12 = [v13 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _successControlLockSummary:withLockSummaryEntries:completion:]();
    }
  }
}

uint64_t __83__MAAutoAssetControl__successControlLockSummary_withLockSummaryEntries_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  uint64_t v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-control{_successControlLockSummary} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_failedControlLockSummary:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    id v16 = [(MAAutoAssetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__MAAutoAssetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004268;
    id v24 = v13;
    int64_t v28 = a4;
    id v25 = v12;
    id v26 = v14;
    id v27 = v15;
    dispatch_async(v16, block);

    id v17 = v24;
  }
  else
  {
    id v18 = [NSString alloc];
    if (v13)
    {
      uint64_t v19 = [v13 checkedSummary];
      uint64_t v20 = [v18 initWithFormat:@"%@ | error:%@", v14, v19];
    }
    else
    {
      uint64_t v19 = +[MAAutoAssetError summaryForCode:a4 fromOperation:v12];
      uint64_t v20 = [v18 initWithFormat:@"%@ | result:%@", v14, v19];
    }
    id v17 = (void *)v20;

    uint64_t v21 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v22 = [v21 oslog];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _failedControlLockSummary:withErrorCode:withResponseError:description:completion:]();
    }
  }
}

void __103__MAAutoAssetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 64);
    if (v3)
    {
      id v2 = +[MAAutoAssetError buildError:v3 fromOperation:*(void *)(a1 + 40) underlyingError:0 withDescription:*(void *)(a1 + 48)];
    }
    else
    {
      id v2 = 0;
    }
  }
  uint64_t v4 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __103__MAAutoAssetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_successSimulateCacheDeleteOperation:(id)a3 withReclaimableSpace:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = [(MAAutoAssetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__MAAutoAssetControl__successSimulateCacheDeleteOperation_withReclaimableSpace_completion___block_invoke;
    block[3] = &unk_1E6005AE0;
    id v14 = v8;
    id v15 = v9;
    int64_t v16 = a4;
    dispatch_async(v10, block);

    uint64_t v11 = v14;
  }
  else
  {
    id v12 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v11 = [v12 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _successSimulateCacheDeleteOperation:withReclaimableSpace:completion:]();
    }
  }
}

uint64_t __91__MAAutoAssetControl__successSimulateCacheDeleteOperation_withReclaimableSpace_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  uint64_t v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-control{_successSimulateCacheDeleteOperation} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_failedSimulateCacheDeleteOperation:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    int64_t v16 = [(MAAutoAssetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__MAAutoAssetControl__failedSimulateCacheDeleteOperation_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004268;
    id v24 = v13;
    int64_t v28 = a4;
    id v25 = v12;
    id v26 = v14;
    id v27 = v15;
    dispatch_async(v16, block);

    id v17 = v24;
  }
  else
  {
    id v18 = [NSString alloc];
    if (v13)
    {
      uint64_t v19 = [v13 checkedSummary];
      uint64_t v20 = [v18 initWithFormat:@"%@ | error:%@", v14, v19];
    }
    else
    {
      uint64_t v19 = +[MAAutoAssetError summaryForCode:a4 fromOperation:v12];
      uint64_t v20 = [v18 initWithFormat:@"%@ | result:%@", v14, v19];
    }
    id v17 = (void *)v20;

    uint64_t v21 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v22 = [v21 oslog];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _failedSimulateCacheDeleteOperation:withErrorCode:withResponseError:description:completion:]();
    }
  }
}

void __113__MAAutoAssetControl__failedSimulateCacheDeleteOperation_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 64);
    if (v3)
    {
      id v2 = +[MAAutoAssetError buildError:v3 fromOperation:*(void *)(a1 + 40) underlyingError:0 withDescription:*(void *)(a1 + 48)];
    }
    else
    {
      id v2 = 0;
    }
  }
  uint64_t v4 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __113__MAAutoAssetControl__failedSimulateCacheDeleteOperation_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (id)pushNotificationHistory:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetPushNotificationHistory sharedInstance];
}

+ (void)frameworkInstanceSetLogDomain
{
  if (frameworkInstanceSetLogDomain_frameworkLogDomainOnce_1 != -1) {
    dispatch_once(&frameworkInstanceSetLogDomain_frameworkLogDomainOnce_1, &__block_literal_global_690);
  }
}

void __51__MAAutoAssetControl_frameworkInstanceSetLogDomain__block_invoke()
{
  id v1 = (id)[[NSString alloc] initWithFormat:@"%@.%s", @"com.apple.MAAutoControlClient", getprogname()];
  v0 = [MEMORY[0x1E4FA56C0] sharedCore];
  [v0 useDomain:v1];
}

+ (id)frameworkDispatchQueue
{
  if (frameworkDispatchQueue_frameworkQueueOnce_1 != -1) {
    dispatch_once(&frameworkDispatchQueue_frameworkQueueOnce_1, &__block_literal_global_696);
  }
  id v2 = (void *)frameworkDispatchQueue_frameworkQueue_1;
  return v2;
}

void __44__MAAutoAssetControl_frameworkDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.autoassetcontrol.framework" UTF8String];
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  id v2 = (void *)frameworkDispatchQueue_frameworkQueue_1;
  frameworkDispatchQueue_frameworkQueue_1 = (uint64_t)v1;
}

+ (id)frameworkInstanceUUID
{
  if (frameworkInstanceUUID_frameworkUUIDOnce_1 != -1) {
    dispatch_once(&frameworkInstanceUUID_frameworkUUIDOnce_1, &__block_literal_global_698);
  }
  id v2 = (void *)frameworkInstanceUUID_frameworkUUID_1;
  return v2;
}

uint64_t __43__MAAutoAssetControl_frameworkInstanceUUID__block_invoke()
{
  frameworkInstanceUUID_frameworkUUID_1 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F29128]);
  return MEMORY[0x1F41817F8]();
}

+ (int64_t)waitOnSemaphore:(id)a3 withTimeout:(int64_t)a4
{
  return dispatch_semaphore_wait((dispatch_semaphore_t)a3, 0xFFFFFFFFFFFFFFFFLL);
}

- (NSString)controlClientName
{
  return self->_controlClientName;
}

- (NSString)controlClientProcessName
{
  return self->_controlClientProcessName;
}

- (int64_t)controlClientProcessID
{
  return self->_controlClientProcessID;
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (SUCoreConnectClient)connectionClient
{
  return self->_connectionClient;
}

- (void)setConnectionClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionClient, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_controlClientProcessName, 0);
  objc_storeStrong((id *)&self->_controlClientName, 0);
}

- (void)_controlStatistics:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"controlStatistics"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-control{controlStatistics} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_availableForStagingAssetSummary:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"availableForStagingAssetSummary"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-control{availableForStagingAssetSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_knownAssetSummary:limitedToAssetTypes:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"knownAssetSummary"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-control{knownAssetSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_lockedAssetSummary:limitedToAssetTypes:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"lockedAssetSummary"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-control{lockedAssetSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_stagedAssetSummary:limitedToAssetTypes:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"stagedAssetSummary"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-control{stagedAssetSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_activeJobSummary:limitedToAssetTypes:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"activeJobSummary"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-control{activeJobSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_scheduledJobSummary:limitedToAssetTypes:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"scheduledJobSummary"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-control{scheduledJobSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_forceGlobalUnlock:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"forceGlobalUnlock"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-control{forceGlobalUnlock} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_forceGlobalForget:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"forceGlobalForget"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-control{forceGlobalForget} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_forceGlobalPurge:forcingUnlock:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"forceGlobalPurge"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-control{forceGlobalPurge} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_forceGlobalAbandon:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"forceGlobalAbandon"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-control{forceGlobalAbandon} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_simulateCacheDeleteDetermineReclaimableSpace:withUrgency:error:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"simulateCacheDeleteDetermineReclaimableSpace"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-control{simulateCacheDeleteDetermineReclaimableSpace} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_simulateCacheDeleteReclaimSpace:withUrgency:targetingPurgeAmount:error:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"simulateCacheDeleteDetermineReclaimableSpace"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-control{simulateCacheDeleteReclaimSpace} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_simulateSetJobOperation:withEndEvent:forSelector:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"simulateSetJobOperation"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-control{simulateSetJobOperation} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_successControlStatistics:withControlStatistics:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto-control{_successControlStatistics} | %{public}@ | no client completion block", v2);
}

- (void)_failedControlStatistics:withErrorCode:withResponseError:description:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-control{_failedControlStatistics} | %{public}@ | no client completion block | %{public}@");
}

void __102__MAAutoAssetControl__failedControlStatistics_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-control{_failedControlStatistics} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successControl:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto-control{_successControl} | %{public}@ | no client completion block", v2);
}

- (void)_failedControl:withErrorCode:withResponseError:description:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-control{_failedControl} | %{public}@ | no client completion block | %{public}@");
}

void __92__MAAutoAssetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-control{_failedControl} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successControlSummary:withJobSummaryEntries:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto-control{_successControlSummary} | %{public}@ | no client completion block", v2);
}

- (void)_failedControlSummary:withErrorCode:withResponseError:description:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-control{_failedControlSummary} | %{public}@ | no client completion block | %{public}@");
}

void __99__MAAutoAssetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-control{_failedControlSummary} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successControlLockSummary:withLockSummaryEntries:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto-control{_successControlLockSummary} | %{public}@ | no client completion block", v2);
}

- (void)_failedControlLockSummary:withErrorCode:withResponseError:description:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-control{_failedControlLockSummary} | %{public}@ | no client completion block | %{public}@");
}

void __103__MAAutoAssetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-control{_failedControlLockSummary} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successSimulateCacheDeleteOperation:withReclaimableSpace:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto-control{_successSimulateCacheDeleteOperation} | %{public}@ | no client completion block", v2);
}

- (void)_failedSimulateCacheDeleteOperation:withErrorCode:withResponseError:description:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-control{_failedSimulateCacheDeleteOperation} | %{public}@ | no client completion block | %{public}@");
}

void __113__MAAutoAssetControl__failedSimulateCacheDeleteOperation_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-control{_failedSimulateCacheDeleteOperation} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

@end