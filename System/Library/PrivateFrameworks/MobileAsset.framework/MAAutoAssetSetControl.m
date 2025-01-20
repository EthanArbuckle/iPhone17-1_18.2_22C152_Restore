@interface MAAutoAssetSetControl
+ (id)activeSetJobSummary:(BOOL)a3 error:(id *)a4;
+ (id)activeSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5;
+ (id)assetSetDescriptorInfo:(id)a3 error:(id *)a4;
+ (id)assetSetsOverview:(id *)a3;
+ (id)assetSetsOverview:(id)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5;
+ (id)autoAssetSetControl;
+ (id)defaultDispatchQueue;
+ (id)frameworkDispatchQueue;
+ (id)frameworkInstanceUUID;
+ (id)knownAssetSetSummary:(BOOL)a3 error:(id *)a4;
+ (id)knownAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5;
+ (id)lockedAssetSetSummary:(BOOL)a3 error:(id *)a4;
+ (id)lockedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5;
+ (id)scheduledSetJobSummary:(BOOL)a3 error:(id *)a4;
+ (id)scheduledSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5;
+ (id)stagedAssetSetSummary:(BOOL)a3 error:(id *)a4;
+ (id)stagedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5;
+ (int64_t)waitOnSemaphore:(id)a3 withTimeout:(int64_t)a4;
+ (void)frameworkInstanceSetLogDomain;
- (MAAutoAssetSetControl)init;
- (NSString)controlClientDomainName;
- (NSString)controlClientName;
- (NSString)controlClientProcessName;
- (OS_dispatch_queue)completionDispatchQueue;
- (SUCoreConnectClient)connectionClient;
- (int64_t)controlClientProcessID;
- (void)_activeSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5;
- (void)_autoAssetInstanceInfo:(id)a3 completion:(id)a4;
- (void)_autoAssetsOverview:(id)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5;
- (void)_failedControl:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedControlInstanceInfo:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedControlLockSummary:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedControlOverview:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedControlSummary:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_knownAssetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5;
- (void)_lockedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5;
- (void)_scheduledSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5;
- (void)_stagedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5;
- (void)_successControl:(id)a3 completion:(id)a4;
- (void)_successControlInstanceInfo:(id)a3 withInstanceInfo:(id)a4 completion:(id)a5;
- (void)_successControlLockSummary:(id)a3 withLockSummaryEntries:(id)a4 completion:(id)a5;
- (void)_successControlOverview:(id)a3 withOverviewEntries:(id)a4 completion:(id)a5;
- (void)_successControlSummary:(id)a3 withJobSummaryEntries:(id)a4 completion:(id)a5;
- (void)connectToServerFrameworkCompletion:(id)a3;
- (void)setConnectionClient:(id)a3;
@end

@implementation MAAutoAssetSetControl

- (MAAutoAssetSetControl)init
{
  v10.receiver = self;
  v10.super_class = (Class)MAAutoAssetSetControl;
  v2 = [(MAAutoAssetSetControl *)&v10 init];
  if (v2)
  {
    +[MAAutoAssetSetControl frameworkInstanceSetLogDomain];
    controlClientDomainName = v2->_controlClientDomainName;
    v2->_controlClientDomainName = (NSString *)@"com.apple.MobileAsset.AutoSetControl";

    controlClientName = v2->_controlClientName;
    v2->_controlClientName = (NSString *)@"auto-set-control-client";

    uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
    controlClientProcessName = v2->_controlClientProcessName;
    v2->_controlClientProcessName = (NSString *)v5;

    v2->_controlClientProcessID = getpid();
    uint64_t v7 = +[MAAutoAssetSetControl defaultDispatchQueue];
    completionDispatchQueue = v2->_completionDispatchQueue;
    v2->_completionDispatchQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (id)knownAssetSetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetSetControl knownAssetSetSummary:a3 limitedToSetIdentifiers:0 error:a4];
}

+ (id)knownAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  v8 = +[MAAutoAssetSetControl autoAssetSetControl];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
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
  v15[2] = __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke;
  v15[3] = &unk_1E6004108;
  v17 = v21;
  v18 = &v31;
  v19 = &v25;
  v20 = v23;
  objc_super v10 = v9;
  v16 = v10;
  [v8 _knownAssetSummary:v6 limitedToSetIdentifiers:v7 completion:v15];
  if (+[MAAutoAssetSetControl waitOnSemaphore:v10 withTimeout:-2])
  {
    v11 = +[MAAutoAssetSetControl frameworkDispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3;
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

void __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAssetSetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2;
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

intptr_t __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2(intptr_t result)
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

uint64_t __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3(uint64_t result)
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

- (void)_knownAssetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__MAAutoAssetSetControl__knownAssetSummary_limitedToSetIdentifiers_completion___block_invoke;
    v12[3] = &unk_1E6004180;
    BOOL v16 = a3;
    id v13 = v8;
    id v14 = self;
    id v15 = v9;
    [(MAAutoAssetSetControl *)self connectToServerFrameworkCompletion:v12];

    id v10 = v13;
  }
  else
  {
    long long v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v10 = [v11 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _knownAssetSummary:limitedToSetIdentifiers:completion:]();
    }
  }
}

void __79__MAAutoAssetSetControl__knownAssetSummary_limitedToSetIdentifiers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControlSummary:@"knownAssetSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:v4];
  }
  else
  {
    id v19 = [[MAAutoAssetSetInfoControl alloc] initClearingAfter:*(unsigned __int8 *)(a1 + 56) limitedToSetIdentifiers:*(void *)(a1 + 32)];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = +[MAAutoAssetSetControl frameworkInstanceUUID];
    id v7 = [v6 UUIDString];

    id v8 = [MAAutoAssetSetInfoInstance alloc];
    id v9 = [*(id *)(a1 + 40) controlClientDomainName];
    id v10 = [*(id *)(a1 + 40) controlClientName];
    long long v11 = [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v12 = [*(id *)(a1 + 40) controlClientProcessID];
    if (*(void *)(a1 + 32)) {
      id v13 = @"LIMITED_INSTANCES";
    }
    else {
      id v13 = @"ALL_INSTANCES";
    }
    id v14 = +[MAAutoAssetSetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetSetInfoInstance *)v8 initUsingClientDomain:v9 forClientName:v10 withProcessName:v11 withProcessID:v12 forAssetSetIdentifier:v13 forAtomicInstance:0 comprisedOfEntries:0 asEntriesWhenTargeting:0 associatingFrameworkUUID:v14];

    [v5 setSafeObject:v15 forKey:@"setInstance"];
    [v5 setSafeObject:v19 forKey:@"setControl"];
    BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET-CONTROL:KNOWN_ASSET_SET_SUMMARY" clientID:v7 version:0 message:v5];
    uint64_t v17 = [*(id *)(a1 + 40) connectionClient];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __79__MAAutoAssetSetControl__knownAssetSummary_limitedToSetIdentifiers_completion___block_invoke_2;
    v20[3] = &unk_1E6004158;
    v18 = *(void **)(a1 + 48);
    v20[4] = *(void *)(a1 + 40);
    id v21 = v18;
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v20];
  }
}

void __79__MAAutoAssetSetControl__knownAssetSummary_limitedToSetIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    id v7 = [v6 safeObjectForKey:@"setJobSummary" ofClass:objc_opt_class()];

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"knownAssetSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"knownAssetSummary" withErrorCode:6110 withResponseError:0 description:@"no known-asset-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)lockedAssetSetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetSetControl lockedAssetSetSummary:a3 limitedToSetIdentifiers:0 error:a4];
}

+ (id)lockedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = +[MAAutoAssetSetControl autoAssetSetControl];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
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
  v15[2] = __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke;
  v15[3] = &unk_1E6004108;
  uint64_t v17 = v21;
  v18 = &v31;
  id v19 = &v25;
  v20 = v23;
  uint64_t v10 = v9;
  BOOL v16 = v10;
  [v8 _lockedAssetSetSummary:v6 limitedToSetIdentifiers:v7 completion:v15];
  if (+[MAAutoAssetSetControl waitOnSemaphore:v10 withTimeout:-2])
  {
    id v11 = +[MAAutoAssetSetControl frameworkDispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3;
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

void __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAssetSetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2;
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

intptr_t __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2(intptr_t result)
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

uint64_t __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(lockedAssetSetSummary)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for locked-asset-summary to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_lockedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83__MAAutoAssetSetControl__lockedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke;
    v12[3] = &unk_1E6004180;
    BOOL v16 = a3;
    id v13 = v8;
    id v14 = self;
    id v15 = v9;
    [(MAAutoAssetSetControl *)self connectToServerFrameworkCompletion:v12];

    id v10 = v13;
  }
  else
  {
    long long v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v10 = [v11 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _lockedAssetSetSummary:limitedToSetIdentifiers:completion:]();
    }
  }
}

void __83__MAAutoAssetSetControl__lockedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControlLockSummary:@"lockedAssetSetSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:v4];
  }
  else
  {
    id v19 = [[MAAutoAssetSetInfoControl alloc] initClearingAfter:*(unsigned __int8 *)(a1 + 56) limitedToSetIdentifiers:*(void *)(a1 + 32)];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = +[MAAutoAssetSetControl frameworkInstanceUUID];
    id v7 = [v6 UUIDString];

    id v8 = [MAAutoAssetSetInfoInstance alloc];
    id v9 = [*(id *)(a1 + 40) controlClientDomainName];
    id v10 = [*(id *)(a1 + 40) controlClientName];
    long long v11 = [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v12 = [*(id *)(a1 + 40) controlClientProcessID];
    if (*(void *)(a1 + 32)) {
      id v13 = @"LIMITED_INSTANCES";
    }
    else {
      id v13 = @"ALL_INSTANCES";
    }
    id v14 = +[MAAutoAssetSetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetSetInfoInstance *)v8 initUsingClientDomain:v9 forClientName:v10 withProcessName:v11 withProcessID:v12 forAssetSetIdentifier:v13 forAtomicInstance:0 comprisedOfEntries:0 asEntriesWhenTargeting:0 associatingFrameworkUUID:v14];

    [v5 setSafeObject:v15 forKey:@"setInstance"];
    [v5 setSafeObject:v19 forKey:@"setControl"];
    BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET-CONTROL:LOCKED_ASSET_SET_SUMMARY" clientID:v7 version:0 message:v5];
    uint64_t v17 = [*(id *)(a1 + 40) connectionClient];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __83__MAAutoAssetSetControl__lockedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke_2;
    v20[3] = &unk_1E6004158;
    v18 = *(void **)(a1 + 48);
    v20[4] = *(void *)(a1 + 40);
    id v21 = v18;
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v20];
  }
}

void __83__MAAutoAssetSetControl__lockedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    [*(id *)(a1 + 32) _failedControlLockSummary:@"lockedAssetSetSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    id v7 = [v6 safeObjectForKey:@"setLockSummary" ofClass:objc_opt_class()];

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlLockSummary:@"lockedAssetSetSummary" withLockSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlLockSummary:@"lockedAssetSetSummary" withErrorCode:6110 withResponseError:0 description:@"no locked-asset-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)stagedAssetSetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetSetControl stagedAssetSetSummary:a3 limitedToSetIdentifiers:0 error:a4];
}

+ (id)stagedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = +[MAAutoAssetSetControl autoAssetSetControl];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
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
  v15[2] = __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke;
  v15[3] = &unk_1E6004108;
  uint64_t v17 = v21;
  v18 = &v31;
  id v19 = &v25;
  v20 = v23;
  uint64_t v10 = v9;
  BOOL v16 = v10;
  [v8 _stagedAssetSetSummary:v6 limitedToSetIdentifiers:v7 completion:v15];
  if (+[MAAutoAssetSetControl waitOnSemaphore:v10 withTimeout:-2])
  {
    id v11 = +[MAAutoAssetSetControl frameworkDispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3;
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

void __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAssetSetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2;
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

intptr_t __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2(intptr_t result)
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

uint64_t __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(stagedAssetSetSummary)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for staged-asset-set-summary to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_stagedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83__MAAutoAssetSetControl__stagedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke;
    v12[3] = &unk_1E6004180;
    BOOL v16 = a3;
    id v13 = v8;
    id v14 = self;
    id v15 = v9;
    [(MAAutoAssetSetControl *)self connectToServerFrameworkCompletion:v12];

    id v10 = v13;
  }
  else
  {
    long long v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v10 = [v11 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _stagedAssetSetSummary:limitedToSetIdentifiers:completion:]();
    }
  }
}

void __83__MAAutoAssetSetControl__stagedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControlSummary:@"stagedAssetSetSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:v4];
  }
  else
  {
    id v19 = [[MAAutoAssetSetInfoControl alloc] initClearingAfter:*(unsigned __int8 *)(a1 + 56) limitedToSetIdentifiers:*(void *)(a1 + 32)];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = +[MAAutoAssetSetControl frameworkInstanceUUID];
    id v7 = [v6 UUIDString];

    id v8 = [MAAutoAssetSetInfoInstance alloc];
    id v9 = [*(id *)(a1 + 40) controlClientDomainName];
    id v10 = [*(id *)(a1 + 40) controlClientName];
    long long v11 = [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v12 = [*(id *)(a1 + 40) controlClientProcessID];
    if (*(void *)(a1 + 32)) {
      id v13 = @"LIMITED_INSTANCES";
    }
    else {
      id v13 = @"ALL_INSTANCES";
    }
    id v14 = +[MAAutoAssetSetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetSetInfoInstance *)v8 initUsingClientDomain:v9 forClientName:v10 withProcessName:v11 withProcessID:v12 forAssetSetIdentifier:v13 forAtomicInstance:0 comprisedOfEntries:0 asEntriesWhenTargeting:0 associatingFrameworkUUID:v14];

    [v5 setSafeObject:v15 forKey:@"setInstance"];
    [v5 setSafeObject:v19 forKey:@"setControl"];
    BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET-CONTROL:STAGED_ASSET_SET_SUMMARY" clientID:v7 version:0 message:v5];
    uint64_t v17 = [*(id *)(a1 + 40) connectionClient];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __83__MAAutoAssetSetControl__stagedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke_2;
    v20[3] = &unk_1E6004158;
    v18 = *(void **)(a1 + 48);
    v20[4] = *(void *)(a1 + 40);
    id v21 = v18;
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v20];
  }
}

void __83__MAAutoAssetSetControl__stagedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    [*(id *)(a1 + 32) _failedControlSummary:@"stagedAssetSetSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    id v7 = [v6 safeObjectForKey:@"setJobSummary" ofClass:objc_opt_class()];

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"stagedAssetSetSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"stagedAssetSetSummary" withErrorCode:6110 withResponseError:0 description:@"no staged-asset-set-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)activeSetJobSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetSetControl activeSetJobSummary:a3 limitedToSetIdentifiers:0 error:a4];
}

+ (id)activeSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = +[MAAutoAssetSetControl autoAssetSetControl];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
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
  v15[2] = __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke;
  v15[3] = &unk_1E6004108;
  uint64_t v17 = v21;
  v18 = &v31;
  id v19 = &v25;
  v20 = v23;
  uint64_t v10 = v9;
  BOOL v16 = v10;
  [v8 _activeSetJobSummary:v6 limitedToSetIdentifiers:v7 completion:v15];
  if (+[MAAutoAssetSetControl waitOnSemaphore:v10 withTimeout:-2])
  {
    id v11 = +[MAAutoAssetSetControl frameworkDispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke_3;
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

void __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAssetSetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke_2;
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

intptr_t __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke_2(intptr_t result)
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

uint64_t __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(activeSetJobSummary)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for active-set-job-summary to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_activeSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81__MAAutoAssetSetControl__activeSetJobSummary_limitedToSetIdentifiers_completion___block_invoke;
    v12[3] = &unk_1E6004180;
    BOOL v16 = a3;
    id v13 = v8;
    id v14 = self;
    id v15 = v9;
    [(MAAutoAssetSetControl *)self connectToServerFrameworkCompletion:v12];

    id v10 = v13;
  }
  else
  {
    long long v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v10 = [v11 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _activeSetJobSummary:limitedToSetIdentifiers:completion:]();
    }
  }
}

void __81__MAAutoAssetSetControl__activeSetJobSummary_limitedToSetIdentifiers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControlSummary:@"activeSetJobSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:v4];
  }
  else
  {
    id v19 = [[MAAutoAssetSetInfoControl alloc] initClearingAfter:*(unsigned __int8 *)(a1 + 56) limitedToSetIdentifiers:*(void *)(a1 + 32)];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = +[MAAutoAssetSetControl frameworkInstanceUUID];
    id v7 = [v6 UUIDString];

    id v8 = [MAAutoAssetSetInfoInstance alloc];
    id v9 = [*(id *)(a1 + 40) controlClientDomainName];
    id v10 = [*(id *)(a1 + 40) controlClientName];
    long long v11 = [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v12 = [*(id *)(a1 + 40) controlClientProcessID];
    if (*(void *)(a1 + 32)) {
      id v13 = @"LIMITED_INSTANCES";
    }
    else {
      id v13 = @"ALL_INSTANCES";
    }
    id v14 = +[MAAutoAssetSetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetSetInfoInstance *)v8 initUsingClientDomain:v9 forClientName:v10 withProcessName:v11 withProcessID:v12 forAssetSetIdentifier:v13 forAtomicInstance:0 comprisedOfEntries:0 asEntriesWhenTargeting:0 associatingFrameworkUUID:v14];

    [v5 setSafeObject:v15 forKey:@"setInstance"];
    [v5 setSafeObject:v19 forKey:@"setControl"];
    BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET-CONTROL:ACTIVE_SET_JOB_SUMMARY" clientID:v7 version:0 message:v5];
    uint64_t v17 = [*(id *)(a1 + 40) connectionClient];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __81__MAAutoAssetSetControl__activeSetJobSummary_limitedToSetIdentifiers_completion___block_invoke_2;
    v20[3] = &unk_1E6004158;
    v18 = *(void **)(a1 + 48);
    v20[4] = *(void *)(a1 + 40);
    id v21 = v18;
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v20];
  }
}

void __81__MAAutoAssetSetControl__activeSetJobSummary_limitedToSetIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    [*(id *)(a1 + 32) _failedControlSummary:@"activeSetJobSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    id v7 = [v6 safeObjectForKey:@"setJobSummary" ofClass:objc_opt_class()];

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"activeSetJobSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"activeSetJobSummary" withErrorCode:6110 withResponseError:0 description:@"no active-set-job-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)scheduledSetJobSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetSetControl scheduledSetJobSummary:a3 limitedToSetIdentifiers:0 error:a4];
}

+ (id)scheduledSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = +[MAAutoAssetSetControl autoAssetSetControl];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
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
  v15[2] = __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke;
  v15[3] = &unk_1E6004108;
  uint64_t v17 = v21;
  v18 = &v31;
  id v19 = &v25;
  v20 = v23;
  uint64_t v10 = v9;
  BOOL v16 = v10;
  [v8 _scheduledSetJobSummary:v6 limitedToSetIdentifiers:v7 completion:v15];
  if (+[MAAutoAssetSetControl waitOnSemaphore:v10 withTimeout:-2])
  {
    id v11 = +[MAAutoAssetSetControl frameworkDispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke_3;
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

void __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAssetSetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke_2;
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

intptr_t __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke_2(intptr_t result)
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

uint64_t __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(scheduledSetJobSummary)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for scheduled-job-summary to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_scheduledSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__MAAutoAssetSetControl__scheduledSetJobSummary_limitedToSetIdentifiers_completion___block_invoke;
    v12[3] = &unk_1E6004180;
    BOOL v16 = a3;
    id v13 = v8;
    id v14 = self;
    id v15 = v9;
    [(MAAutoAssetSetControl *)self connectToServerFrameworkCompletion:v12];

    id v10 = v13;
  }
  else
  {
    long long v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v10 = [v11 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _scheduledSetJobSummary:limitedToSetIdentifiers:completion:]();
    }
  }
}

void __84__MAAutoAssetSetControl__scheduledSetJobSummary_limitedToSetIdentifiers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControlSummary:@"scheduledSetJobSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:v4];
  }
  else
  {
    id v19 = [[MAAutoAssetSetInfoControl alloc] initClearingAfter:*(unsigned __int8 *)(a1 + 56) limitedToSetIdentifiers:*(void *)(a1 + 32)];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = +[MAAutoAssetSetControl frameworkInstanceUUID];
    id v7 = [v6 UUIDString];

    id v8 = [MAAutoAssetSetInfoInstance alloc];
    id v9 = [*(id *)(a1 + 40) controlClientDomainName];
    id v10 = [*(id *)(a1 + 40) controlClientName];
    long long v11 = [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v12 = [*(id *)(a1 + 40) controlClientProcessID];
    if (*(void *)(a1 + 32)) {
      id v13 = @"LIMITED_INSTANCES";
    }
    else {
      id v13 = @"ALL_INSTANCES";
    }
    id v14 = +[MAAutoAssetSetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetSetInfoInstance *)v8 initUsingClientDomain:v9 forClientName:v10 withProcessName:v11 withProcessID:v12 forAssetSetIdentifier:v13 forAtomicInstance:0 comprisedOfEntries:0 asEntriesWhenTargeting:0 associatingFrameworkUUID:v14];

    [v5 setSafeObject:v15 forKey:@"setInstance"];
    [v5 setSafeObject:v19 forKey:@"setControl"];
    BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET-CONTROL:SCHEDULED_SET_JOB_SUMMARY" clientID:v7 version:0 message:v5];
    uint64_t v17 = [*(id *)(a1 + 40) connectionClient];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __84__MAAutoAssetSetControl__scheduledSetJobSummary_limitedToSetIdentifiers_completion___block_invoke_2;
    v20[3] = &unk_1E6004158;
    v18 = *(void **)(a1 + 48);
    v20[4] = *(void *)(a1 + 40);
    id v21 = v18;
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v20];
  }
}

void __84__MAAutoAssetSetControl__scheduledSetJobSummary_limitedToSetIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    [*(id *)(a1 + 32) _failedControlSummary:@"scheduledSetJobSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    id v7 = [v6 safeObjectForKey:@"setJobSummary" ofClass:objc_opt_class()];

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"scheduledSetJobSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"scheduledSetJobSummary" withErrorCode:6110 withResponseError:0 description:@"no scheduled-job-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)assetSetsOverview:(id *)a3
{
  return +[MAAutoAssetSetControl assetSetsOverview:0 limitedToSetIdentifiers:0 error:a3];
}

+ (id)assetSetsOverview:(id)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[MAAutoAssetSetControl autoAssetSetControl];
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  id v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  id v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke;
  v16[3] = &unk_1E6004108;
  v18 = v22;
  id v19 = &v32;
  v20 = &v26;
  id v21 = v24;
  id v11 = v10;
  uint64_t v17 = v11;
  [v9 _autoAssetsOverview:v7 limitedToSetIdentifiers:v8 completion:v16];
  if (+[MAAutoAssetSetControl waitOnSemaphore:v11 withTimeout:-2])
  {
    id v12 = +[MAAutoAssetSetControl frameworkDispatchQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke_3;
    v15[3] = &unk_1E6004130;
    void v15[4] = v24;
    v15[5] = v22;
    v15[6] = &v26;
    dispatch_sync(v12, v15);
  }
  if (a5) {
    *a5 = (id) v27[5];
  }
  id v13 = (id)v33[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v13;
}

void __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAssetSetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke_2;
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

intptr_t __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke_2(intptr_t result)
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

uint64_t __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(assetSetsOverview)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for asset-sets-overview to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_autoAssetsOverview:(id)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__MAAutoAssetSetControl__autoAssetsOverview_limitedToSetIdentifiers_completion___block_invoke;
    v13[3] = &unk_1E60041A8;
    id v14 = v8;
    id v15 = v9;
    long long v16 = self;
    id v17 = v10;
    [(MAAutoAssetSetControl *)self connectToServerFrameworkCompletion:v13];

    long long v11 = v14;
  }
  else
  {
    id v12 = [MEMORY[0x1E4FA56C8] sharedLogger];
    long long v11 = [v12 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _autoAssetsOverview:limitedToSetIdentifiers:completion:]();
    }
  }
}

void __80__MAAutoAssetSetControl__autoAssetsOverview_limitedToSetIdentifiers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    [v3 _failedControlOverview:@"assetSetsOverview" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:v4];
  }
  else
  {
    id v19 = [[MAAutoAssetSetInfoControl alloc] initClearingAfter:0 limitedToClientDomains:*(void *)(a1 + 32) limitedToSetIdentifiers:*(void *)(a1 + 40)];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = +[MAAutoAssetSetControl frameworkInstanceUUID];
    id v7 = [v6 UUIDString];

    id v8 = [MAAutoAssetSetInfoInstance alloc];
    id v9 = [*(id *)(a1 + 48) controlClientDomainName];
    id v10 = [*(id *)(a1 + 48) controlClientName];
    long long v11 = [*(id *)(a1 + 48) controlClientProcessName];
    uint64_t v12 = [*(id *)(a1 + 48) controlClientProcessID];
    if (*(void *)(a1 + 40)) {
      id v13 = @"LIMITED_INSTANCES";
    }
    else {
      id v13 = @"ALL_INSTANCES";
    }
    id v14 = +[MAAutoAssetSetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetSetInfoInstance *)v8 initUsingClientDomain:v9 forClientName:v10 withProcessName:v11 withProcessID:v12 forAssetSetIdentifier:v13 forAtomicInstance:0 comprisedOfEntries:0 asEntriesWhenTargeting:0 associatingFrameworkUUID:v14];

    [v5 setSafeObject:v15 forKey:@"setInstance"];
    [v5 setSafeObject:v19 forKey:@"setControl"];
    long long v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET-CONTROL:ASSET_SETS_OVERVIEW" clientID:v7 version:0 message:v5];
    id v17 = [*(id *)(a1 + 48) connectionClient];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __80__MAAutoAssetSetControl__autoAssetsOverview_limitedToSetIdentifiers_completion___block_invoke_2;
    v20[3] = &unk_1E6004158;
    v18 = *(void **)(a1 + 56);
    v20[4] = *(void *)(a1 + 48);
    id v21 = v18;
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v20];
  }
}

void __80__MAAutoAssetSetControl__autoAssetsOverview_limitedToSetIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    [*(id *)(a1 + 32) _failedControlOverview:@"assetSetsOverview" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    id v7 = [v6 safeObjectForKey:@"setOverview" ofClass:objc_opt_class()];

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlOverview:@"assetSetsOverview" withOverviewEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"assetSetsOverview" withErrorCode:6110 withResponseError:0 description:@"no asset-sets-overview provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)assetSetDescriptorInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[MAAutoAssetSetControl autoAssetSetControl];
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy_;
  uint64_t v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy_;
  uint64_t v27 = __Block_byref_object_dispose_;
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
  v13[2] = __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke;
  v13[3] = &unk_1E60041D0;
  id v15 = v19;
  long long v16 = &v29;
  id v17 = &v23;
  v18 = v21;
  id v8 = v7;
  id v14 = v8;
  [v6 _autoAssetInstanceInfo:v5 completion:v13];
  if (+[MAAutoAssetSetControl waitOnSemaphore:v8 withTimeout:-2])
  {
    id v9 = +[MAAutoAssetSetControl frameworkDispatchQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke_3;
    v12[3] = &unk_1E6004130;
    void v12[4] = v21;
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

void __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_semaphore_t v7 = +[MAAutoAssetSetControl frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke_2;
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

intptr_t __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke_2(intptr_t result)
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

uint64_t __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto-control(assetSetInstanceInfo)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for asset-set-instance-info to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)_autoAssetInstanceInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__MAAutoAssetSetControl__autoAssetInstanceInfo_completion___block_invoke;
    v10[3] = &unk_1E60041F8;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(MAAutoAssetSetControl *)self connectToServerFrameworkCompletion:v10];
  }
  else
  {
    id v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _autoAssetInstanceInfo:completion:]();
    }
  }
}

void __59__MAAutoAssetSetControl__autoAssetInstanceInfo_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedControlInstanceInfo:@"autoAssetInstanceInfo" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:v4];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = +[MAAutoAssetSetControl frameworkInstanceUUID];
    id v7 = [v6 UUIDString];

    id v8 = [MAAutoAssetSetInfoInstance alloc];
    id v9 = [*(id *)(a1 + 32) controlClientDomainName];
    id v10 = [*(id *)(a1 + 32) controlClientName];
    id v11 = [*(id *)(a1 + 32) controlClientProcessName];
    uint64_t v12 = [*(id *)(a1 + 32) controlClientProcessID];
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = +[MAAutoAssetSetControl frameworkInstanceUUID];
    id v15 = [(MAAutoAssetSetInfoInstance *)v8 initUsingClientDomain:v9 forClientName:v10 withProcessName:v11 withProcessID:v12 forAssetSetIdentifier:@"ALL_INSTANCES" forAtomicInstance:v13 comprisedOfEntries:0 asEntriesWhenTargeting:0 associatingFrameworkUUID:v14];

    [v5 setSafeObject:v15 forKey:@"setInstance"];
    long long v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-SET-CONTROL:SET_INSTANCE_INFO" clientID:v7 version:0 message:v5];
    uint64_t v17 = [*(id *)(a1 + 32) connectionClient];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__MAAutoAssetSetControl__autoAssetInstanceInfo_completion___block_invoke_2;
    v18[3] = &unk_1E6004158;
    v18[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 48);
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v18];
  }
}

void __59__MAAutoAssetSetControl__autoAssetInstanceInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    [*(id *)(a1 + 32) _failedControlInstanceInfo:@"autoAssetInstanceInfo" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    id v7 = [v6 safeObjectForKey:@"setInstanceInfo" ofClass:objc_opt_class()];

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlInstanceInfo:@"autoAssetInstanceInfo" withInstanceInfo:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlInstanceInfo:@"autoAssetInstanceInfo" withErrorCode:6110 withResponseError:0 description:@"no asset-sets atomic instance information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)defaultDispatchQueue
{
  if (defaultDispatchQueue_defaultQueueOnce != -1) {
    dispatch_once(&defaultDispatchQueue_defaultQueueOnce, &__block_literal_global);
  }
  v2 = (void *)defaultDispatchQueue_defaultQueue;
  return v2;
}

void __45__MAAutoAssetSetControl_defaultDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.autoassetcontrol.client" UTF8String];
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)defaultDispatchQueue_defaultQueue;
  defaultDispatchQueue_defaultQueue = (uint64_t)v1;
}

+ (id)autoAssetSetControl
{
  if (autoAssetSetControl_dispatchOnceAutoAssetSetControl != -1) {
    dispatch_once(&autoAssetSetControl_dispatchOnceAutoAssetSetControl, &__block_literal_global_436);
  }
  v2 = (void *)autoAssetSetControl___autoAssetSetControl;
  return v2;
}

uint64_t __44__MAAutoAssetSetControl_autoAssetSetControl__block_invoke()
{
  autoAssetSetControl___autoAssetSetControl = objc_alloc_init(MAAutoAssetSetControl);
  return MEMORY[0x1F41817F8]();
}

- (void)connectToServerFrameworkCompletion:(id)a3
{
  uint64_t v25 = (void (**)(id, void))a3;
  uint64_t v4 = [(MAAutoAssetSetControl *)self connectionClient];

  if (v4)
  {
    v25[2](v25, 0);
  }
  else
  {
    id v5 = +[MAAutoAssetSetControl frameworkInstanceUUID];
    char v24 = [v5 UUIDString];

    uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    id v15 = objc_msgSend(v23, "setWithObjects:", v22, v21, v20, v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL:KNOWN_ASSET_SET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL:LOCKED_ASSET_SET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL:STAGED_ASSET_SET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL:ACTIVE_SET_JOB_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL:SCHEDULED_SET_JOB_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL(REPLY):KNOWN_ASSET_SET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL(REPLY):LOCKED_ASSET_SET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL(REPLY):STAGED_ASSET_SET_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL(REPLY):ACTIVE_SET_JOB_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL(REPLY):SCHEDULED_SET_JOB_SUMMARY"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL(REPLY):ASSET_SETS_OVERVIEW"];
    [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL(REPLY):SET_INSTANCE_INFO"];
    long long v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56A8]) initForServiceName:@"com.apple.mobileasset.autoasset" delegate:self clientID:v24];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4FA56A0]) initWithClientPolicy:v16];
    [(MAAutoAssetSetControl *)self setConnectionClient:v17];

    v25[2](v25, 0);
  }
}

- (void)_successControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(MAAutoAssetSetControl *)self completionDispatchQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__MAAutoAssetSetControl__successControl_completion___block_invoke;
    v11[3] = &unk_1E6004240;
    uint64_t v12 = v6;
    id v13 = v7;
    dispatch_async(v8, v11);

    uint64_t v9 = v12;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v9 = [v10 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _successControl:completion:]();
    }
  }
}

uint64_t __52__MAAutoAssetSetControl__successControl_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set-control{_successControl} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
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
    long long v16 = [(MAAutoAssetSetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__MAAutoAssetSetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004268;
    id v24 = v13;
    int64_t v28 = a4;
    id v25 = v12;
    id v26 = v14;
    id v27 = v15;
    dispatch_async(v16, block);

    uint64_t v17 = v24;
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
    uint64_t v17 = (void *)v20;

    uint64_t v21 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v22 = [v21 oslog];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _failedControl:withErrorCode:withResponseError:description:completion:]();
    }
  }
}

void __95__MAAutoAssetSetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
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
    __95__MAAutoAssetSetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
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
    uint64_t v11 = [(MAAutoAssetSetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__MAAutoAssetSetControl__successControlSummary_withJobSummaryEntries_completion___block_invoke;
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
      -[MAAutoAssetSetControl _successControlSummary:withJobSummaryEntries:completion:]();
    }
  }
}

uint64_t __81__MAAutoAssetSetControl__successControlSummary_withJobSummaryEntries_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  uint64_t v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set-control{_successControlSummary} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
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
    id v16 = [(MAAutoAssetSetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__MAAutoAssetSetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke;
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
      -[MAAutoAssetSetControl _failedControlSummary:withErrorCode:withResponseError:description:completion:]();
    }
  }
}

void __102__MAAutoAssetSetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
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
    __102__MAAutoAssetSetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
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
    uint64_t v11 = [(MAAutoAssetSetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__MAAutoAssetSetControl__successControlLockSummary_withLockSummaryEntries_completion___block_invoke;
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
      -[MAAutoAssetSetControl _successControlLockSummary:withLockSummaryEntries:completion:]();
    }
  }
}

uint64_t __86__MAAutoAssetSetControl__successControlLockSummary_withLockSummaryEntries_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  uint64_t v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set-control{_successControlLockSummary} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
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
    id v16 = [(MAAutoAssetSetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__MAAutoAssetSetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke;
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
      -[MAAutoAssetSetControl _failedControlLockSummary:withErrorCode:withResponseError:description:completion:]();
    }
  }
}

void __106__MAAutoAssetSetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
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
    __106__MAAutoAssetSetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_successControlOverview:(id)a3 withOverviewEntries:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = [(MAAutoAssetSetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__MAAutoAssetSetControl__successControlOverview_withOverviewEntries_completion___block_invoke;
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
      -[MAAutoAssetSetControl _successControlOverview:withOverviewEntries:completion:]();
    }
  }
}

uint64_t __80__MAAutoAssetSetControl__successControlOverview_withOverviewEntries_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  uint64_t v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set-control{_successControlOverview} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_failedControlOverview:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    id v16 = [(MAAutoAssetSetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__MAAutoAssetSetControl__failedControlOverview_withErrorCode_withResponseError_description_completion___block_invoke;
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
      -[MAAutoAssetSetControl _failedControlOverview:withErrorCode:withResponseError:description:completion:]();
    }
  }
}

void __103__MAAutoAssetSetControl__failedControlOverview_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
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
    __103__MAAutoAssetSetControl__failedControlOverview_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_successControlInstanceInfo:(id)a3 withInstanceInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = [(MAAutoAssetSetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__MAAutoAssetSetControl__successControlInstanceInfo_withInstanceInfo_completion___block_invoke;
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
      -[MAAutoAssetSetControl _successControlInstanceInfo:withInstanceInfo:completion:]();
    }
  }
}

uint64_t __81__MAAutoAssetSetControl__successControlInstanceInfo_withInstanceInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  uint64_t v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set-control{_successControlInstanceInfo} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_failedControlInstanceInfo:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    id v16 = [(MAAutoAssetSetControl *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __107__MAAutoAssetSetControl__failedControlInstanceInfo_withErrorCode_withResponseError_description_completion___block_invoke;
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
      -[MAAutoAssetSetControl _failedControlInstanceInfo:withErrorCode:withResponseError:description:completion:]();
    }
  }
}

void __107__MAAutoAssetSetControl__failedControlInstanceInfo_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
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
    __107__MAAutoAssetSetControl__failedControlInstanceInfo_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (void)frameworkInstanceSetLogDomain
{
  if (frameworkInstanceSetLogDomain_frameworkLogDomainOnce != -1) {
    dispatch_once(&frameworkInstanceSetLogDomain_frameworkLogDomainOnce, &__block_literal_global_483);
  }
}

void __54__MAAutoAssetSetControl_frameworkInstanceSetLogDomain__block_invoke()
{
  id v1 = (id)[[NSString alloc] initWithFormat:@"%@.%s", @"com.apple.MAAutoSetControlClient", getprogname()];
  v0 = [MEMORY[0x1E4FA56C0] sharedCore];
  [v0 useDomain:v1];
}

+ (id)frameworkDispatchQueue
{
  if (frameworkDispatchQueue_frameworkQueueOnce != -1) {
    dispatch_once(&frameworkDispatchQueue_frameworkQueueOnce, &__block_literal_global_489);
  }
  id v2 = (void *)frameworkDispatchQueue_frameworkQueue;
  return v2;
}

void __47__MAAutoAssetSetControl_frameworkDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.autoassetcontrol.framework" UTF8String];
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  id v2 = (void *)frameworkDispatchQueue_frameworkQueue;
  frameworkDispatchQueue_frameworkQueue = (uint64_t)v1;
}

+ (id)frameworkInstanceUUID
{
  if (frameworkInstanceUUID_frameworkUUIDOnce != -1) {
    dispatch_once(&frameworkInstanceUUID_frameworkUUIDOnce, &__block_literal_global_491);
  }
  id v2 = (void *)frameworkInstanceUUID_frameworkUUID;
  return v2;
}

uint64_t __46__MAAutoAssetSetControl_frameworkInstanceUUID__block_invoke()
{
  frameworkInstanceUUID_frameworkUUID = (uint64_t)objc_alloc_init(MEMORY[0x1E4F29128]);
  return MEMORY[0x1F41817F8]();
}

+ (int64_t)waitOnSemaphore:(id)a3 withTimeout:(int64_t)a4
{
  return dispatch_semaphore_wait((dispatch_semaphore_t)a3, 0xFFFFFFFFFFFFFFFFLL);
}

- (NSString)controlClientDomainName
{
  return self->_controlClientDomainName;
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
  objc_storeStrong((id *)&self->_controlClientDomainName, 0);
}

- (void)_knownAssetSummary:limitedToSetIdentifiers:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"knownAssetSummary"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set-control{knownAssetSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_lockedAssetSetSummary:limitedToSetIdentifiers:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"lockedAssetSetSummary"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set-control{lockedAssetSetSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_stagedAssetSetSummary:limitedToSetIdentifiers:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"stagedAssetSetSummary"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set-control{stagedAssetSetSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_activeSetJobSummary:limitedToSetIdentifiers:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"activeSetJobSummary"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set-control{activeSetJobSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_scheduledSetJobSummary:limitedToSetIdentifiers:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"scheduledSetJobSummary"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set-control{scheduledSetJobSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_autoAssetsOverview:limitedToSetIdentifiers:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"assetSetsOverview"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set-control{assetSetsOverview} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_autoAssetInstanceInfo:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"autoAssetInstanceInfo"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto-set-control{autoAssetInstanceInfo} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_successControl:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto-set-control{_successControl} | %{public}@ | no client completion block", v2);
}

- (void)_failedControl:withErrorCode:withResponseError:description:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-set-control{_failedControl} | %{public}@ | no client completion block | %{public}@");
}

void __95__MAAutoAssetSetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-set-control{_failedControl} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successControlSummary:withJobSummaryEntries:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto-set-control{_successControlSummary} | %{public}@ | no client completion block", v2);
}

- (void)_failedControlSummary:withErrorCode:withResponseError:description:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-set-control{_failedControlSummary} | %{public}@ | no client completion block | %{public}@");
}

void __102__MAAutoAssetSetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-set-control{_failedControlSummary} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successControlLockSummary:withLockSummaryEntries:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto-set-control{_successControlLockSummary} | %{public}@ | no client completion block", v2);
}

- (void)_failedControlLockSummary:withErrorCode:withResponseError:description:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-set-control{_failedControlLockSummary} | %{public}@ | no client completion block | %{public}@");
}

void __106__MAAutoAssetSetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-set-control{_failedControlLockSummary} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successControlOverview:withOverviewEntries:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto-set-control{_successControlOverview} | %{public}@ | no client completion block", v2);
}

- (void)_failedControlOverview:withErrorCode:withResponseError:description:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-set-control{_failedControlOverview} | %{public}@ | no client completion block | %{public}@");
}

void __103__MAAutoAssetSetControl__failedControlOverview_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-set-control{_failedControlOverview} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successControlInstanceInfo:withInstanceInfo:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto-set-control{_successControlInstanceInfo} | %{public}@ | no client completion block", v2);
}

- (void)_failedControlInstanceInfo:withErrorCode:withResponseError:description:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1B275B000, v0, v1, "MA-auto-set-control{_failedControlInstanceInfo} | %{public}@ | no client completion block | %{public}@");
}

void __107__MAAutoAssetSetControl__failedControlInstanceInfo_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto-set-control{_failedControlInstanceInfo} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

@end