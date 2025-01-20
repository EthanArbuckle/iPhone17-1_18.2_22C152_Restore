@interface TRIDServer
+ (id)_triPath;
+ (id)sharedServer;
- (BOOL)isRunning;
- (TRIDServer)initWithPath:(id)a3;
- (unint64_t)_getDiskUsageInBytes;
- (void)_asyncStartWithMetrics:(id)a3;
- (void)_dispatchWhenUnlocked:(id)a3;
- (void)_excludeUserLevelTrialFromTimeMachineBackups;
- (void)_logMetrics:(id)a3;
- (void)_registerExternalParamChangeHandler;
- (void)_registerSetupAssistantFetchActivityOnce;
- (void)_registerXpcStreamEventHandler;
- (void)start;
@end

@implementation TRIDServer

- (void)start
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E016E7F0]();
  v5 = [MEMORY[0x1E4FB0098] clientWithIdentifier:1];
  if (+[TRIIntegrationTestLogHandler shouldUseOverrideLogHandler])
  {
    +[TRIIntegrationTestLogHandler addTestLoggerInPlaceOnClient:v5];
  }
  if (!v5)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"TRIDServer.m" lineNumber:215 description:@"Failed to initialize TRIClient"];
  }
  +[TRIXPCServices registerAllServicesWithPromise:self->_promise];
  v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [MEMORY[0x1E4F93B10] isClassCLocked];
    v8 = @"class C unlocked";
    if (v7) {
      v8 = @"class C locked";
    }
    *(_DWORD *)buf = 138412290;
    v34 = v8;
    _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "registered xpc service endpoints - device is %@", buf, 0xCu);
  }

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __19__TRIDServer_start__block_invoke;
  v31[3] = &unk_1E6BB82A8;
  v31[4] = self;
  id v32 = v5;
  id v9 = v5;
  [(TRIDServer *)self _dispatchWhenUnlocked:v31];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __19__TRIDServer_start__block_invoke_340;
  v28 = &unk_1E6BB8450;
  v29 = self;
  SEL v30 = a2;
  if (start__pasOnceToken20 != -1) {
    dispatch_once(&start__pasOnceToken20, &v25);
  }

  uint64_t v18 = *MEMORY[0x1E4F1C3A0];
  do
  {
    v19 = (void *)MEMORY[0x1E016E7F0](v10, v11, v12, v13, v14, v15, v16, v17, v25, v26, v27);
    v20 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    v21 = [MEMORY[0x1E4F1C9C8] distantFuture];
    char v22 = [v20 runMode:v18 beforeDate:v21];
  }
  while ((v22 & 1) != 0);
  v23 = TRILogCategory_Server();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v23, OS_LOG_TYPE_DEFAULT, "finished server run loop", buf, 2u);
  }

  self->_isRunning = 0;
}

+ (id)_triPath
{
  v2 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  v3 = [v2 trialRootDir];

  return v3;
}

+ (id)sharedServer
{
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __26__TRIDServer_sharedServer__block_invoke;
  uint64_t v10 = &__block_descriptor_40_e5_v8__0l;
  id v11 = a1;
  if (qword_1EA8D8230 != -1) {
    dispatch_once(&qword_1EA8D8230, &block);
  }
  id v4 = (id)_MergedGlobals_44;
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"TRIDServer.m", 134, @"Invalid parameter not satisfying: %@", @"result", block, v8, v9, v10, v11 object file lineNumber description];
  }
  return v4;
}

void __26__TRIDServer_sharedServer__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E016E7F0]();
  id v3 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = [*(id *)(a1 + 32) _triPath];
  uint64_t v5 = [v3 initWithPath:v4];
  v6 = (void *)_MergedGlobals_44;
  _MergedGlobals_44 = v5;
}

- (TRIDServer)initWithPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIDServer.m", 145, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)TRIDServer;
  v6 = [(TRIDServer *)&v17 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.triald.taskQueue" qosClass:17];
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;

    id v9 = [[TRIXPCActivityManager alloc] initWithDispatchQueue:v6->_dispatchQueue];
    xpcActivityManager = v6->_xpcActivityManager;
    v6->_xpcActivityManager = v9;

    id v11 = objc_alloc_init(TRIXPCServerContextPromise);
    promise = v6->_promise;
    v6->_promise = v11;

    context = v6->_context;
    v6->_context = 0;

    taskQueue = v6->_taskQueue;
    v6->_taskQueue = 0;

    v6->_isRunning = 0;
  }

  return v6;
}

- (void)_asyncStartWithMetrics:(id)a3
{
  id v4 = a3;
  id v5 = TRILogCategory_Server();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Queuing up async start block", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__TRIDServer__asyncStartWithMetrics___block_invoke;
  v7[3] = &unk_1E6BB82A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(TRIDServer *)self _dispatchWhenUnlocked:v7];
}

void __37__TRIDServer__asyncStartWithMetrics___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2[2])
  {
    [v2 _excludeUserLevelTrialFromTimeMachineBackups];
    *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
    id v3 = TRILogCategory_Server();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [MEMORY[0x1E4FB0258] sharedInstance];
      uint64_t v5 = [v4 populationType];
      if (v5 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
        id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v6 = off_1E6BBD930[(int)v5];
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1DA291000, v3, OS_LOG_TYPE_DEFAULT, "Device is in the %{public}@ population", buf, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 24) resumeWithXPCActivityDescriptor:0 executeWhenSuspended:0];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB05A8], "metricWithName:integerValue:", @"triald_task_queue_length", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "count"));
    [*(id *)(a1 + 40) addObject:v7];
    id v8 = *(void **)(*(void *)(a1 + 32) + 24);
    id v9 = +[TRIRotateSubjectIdTask task];
    uint64_t v10 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
    [v8 addTask:v9 options:v10];
  }
  else
  {
    uint64_t v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Server context not initialized. Skipping _asyncStartWithMetrics", buf, 2u);
    }
  }
}

void __19__TRIDServer_start__block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  if (([v2 prepareTrialStorage] & 1) == 0)
  {
    uint64_t v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    __int16 v32 = 0;
    uint64_t v25 = "triald failed to prepare storage";
    uint64_t v26 = (uint8_t *)&v32;
LABEL_16:
    _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, v25, v26, 2u);
    goto LABEL_11;
  }
  id v3 = [TRIServerContext alloc];
  id v4 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  uint64_t v5 = [(TRIServerContext *)v3 initWithPaths:v4 client:*(void *)(a1 + 40) storageManagement:v2 xpcActivityManagement:*(void *)(*(void *)(a1 + 32) + 40)];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 16);
  id v9 = TRILogCategory_Server();
  uint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "Initialized server context", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 16) setUseCKNative:1];
    id v11 = [TRITaskQueue alloc];
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 16);
    uint64_t v13 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.triald.opQueue" qosClass:17];
    dispatch_group_t v14 = dispatch_group_create();
    uint64_t v15 = [(TRITaskQueue *)v11 initWithServerContext:v12 operationQueue:v13 operationGroup:v14 asyncQueue:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v16 = *(void *)(a1 + 32);
    objc_super v17 = *(void **)(v16 + 24);
    *(void *)(v16 + 24) = v15;

    [*(id *)(*(void *)(a1 + 32) + 40) setContext:*(void *)(*(void *)(a1 + 32) + 16)];
    [*(id *)(*(void *)(a1 + 32) + 40) setTaskQueue:*(void *)(*(void *)(a1 + 32) + 24)];
    [*(id *)(*(void *)(a1 + 32) + 16) setTaskQueue:*(void *)(*(void *)(a1 + 32) + 24)];
    uint64_t v18 = [[TRIPushServiceConnectionMultiplexer alloc] initWithServerContext:*(void *)(*(void *)(a1 + 32) + 16) taskQueue:*(void *)(*(void *)(a1 + 32) + 24)];
    [*(id *)(*(void *)(a1 + 32) + 16) setPushServiceMuxer:v18];

    [MEMORY[0x1E4FB0258] updateSystemInfoUsingContext:*(void *)(*(void *)(a1 + 32) + 16)];
    +[TRIMobileAssetUtil configureMobileAssetForTrialEnvironment:](TRIMobileAssetUtil, "configureMobileAssetForTrialEnvironment:", [MEMORY[0x1E4FB0090] currentEnvironment]);
    v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1DA291000, v19, OS_LOG_TYPE_DEFAULT, "fullfilling server context ready promise", v29, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 32) fullfillWithContext:*(void *)(*(void *)(a1 + 32) + 16) taskQueue:*(void *)(*(void *)(a1 + 32) + 24)];
    v20 = [*(id *)(*(void *)(a1 + 32) + 16) paths];
    v21 = [*(id *)(*(void *)(a1 + 32) + 16) experimentDatabase];
    char v22 = [*(id *)(*(void *)(a1 + 32) + 16) rolloutDatabase];
    v23 = [*(id *)(*(void *)(a1 + 32) + 16) taskQueue];
    v24 = [*(id *)(*(void *)(a1 + 32) + 16) client];
    +[TRICacheDeleteCallbacks registerCallbacksWithPaths:v20 experimentDatabase:v21 rolloutDatabase:v22 taskQueue:v23 loggingClient:v24];

    goto LABEL_14;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v31 = 0;
    uint64_t v25 = "triald failed to initialize server context";
    uint64_t v26 = v31;
    goto LABEL_16;
  }
LABEL_11:

  v27 = TRILogCategory_Server();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_1DA291000, v27, OS_LOG_TYPE_DEFAULT, "rejecting server context ready promise", v28, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 32) reject];
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8), &__block_literal_global_27);
LABEL_14:
}

uint64_t __19__TRIDServer_start__block_invoke_339()
{
  v0 = TRILogCategory_Server();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_1DA291000, v0, OS_LOG_TYPE_ERROR, "triald failed to initialize - exiting", v2, 2u);
  }

  return xpc_transaction_exit_clean();
}

void __19__TRIDServer_start__block_invoke_340(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E016E7F0]();
  id v3 = TRILogCategory_Server();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v3, OS_LOG_TYPE_DEFAULT, "triald launched", buf, 2u);
  }

  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14480], 0xFuLL, 0, MEMORY[0x1E4F14428]);
  uint64_t v5 = (void *)sTermSource;
  sTermSource = (uint64_t)v4;

  uint64_t v6 = sTermSource;
  if (!sTermSource)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"TRIDServer.m" lineNumber:300 description:@"triald failed listening for SIGTERM"];

    uint64_t v6 = sTermSource;
  }
  dispatch_source_set_event_handler(v6, &__block_literal_global_346);
  dispatch_resume((dispatch_object_t)sTermSource);
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  [*(id *)(a1 + 32) _asyncStartWithMetrics:v7];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19__TRIDServer_start__block_invoke_348;
  block[3] = &unk_1E6BB82F8;
  block[4] = v8;
  dispatch_async(v9, block);
  [*(id *)(a1 + 32) _registerXpcStreamEventHandler];
  [*(id *)(a1 + 32) _registerExternalParamChangeHandler];
  uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v10)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"TRIDServer.m" lineNumber:342 description:@"XPC Activity Manager not initialized"];

    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  [v10 registerActivities];
  [*(id *)(a1 + 32) _logMetrics:v7];
}

void __19__TRIDServer_start__block_invoke_344()
{
  v0 = TRILogCategory_Server();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DA291000, v0, OS_LOG_TYPE_DEFAULT, "received SIGTERM, exiting", v1, 2u);
  }

  exit(0);
}

uint64_t __19__TRIDServer_start__block_invoke_348(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addBlockToExecuteAfterPromiseFullfillment:&__block_literal_global_351_0];
}

void __19__TRIDServer_start__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[TRILimitedCarryProfileManager alloc] initWithTaskQueue:v5 context:v4];
    [v4 setLimitedCarryManager:v7];

    uint64_t v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Created Limited Carry manager", v9, 2u);
    }
  }
  else
  {
    uint64_t v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "failed to handle limited carry experiment setup - triald failed initialization", buf, 2u);
    }
  }
}

- (void)_logMetrics:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__TRIDServer__logMetrics___block_invoke;
  v6[3] = &unk_1E6BB82A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TRIDServer *)self _dispatchWhenUnlocked:v6];
}

void __26__TRIDServer__logMetrics___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) client];
  int v3 = [v2 shouldLogAtLevel:10];

  if (v3)
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 16) client];
    id v4 = [v7 logger];
    id v5 = [*(id *)(*(void *)(a1 + 32) + 16) client];
    uint64_t v6 = [v5 trackingId];
    [v4 logWithTrackingId:v6 metrics:*(void *)(a1 + 40) dimensions:0 trialSystemTelemetry:0];
  }
}

- (void)_dispatchWhenUnlocked:(id)a3
{
  id v4 = a3;
  if (qword_1EA8D8240 != -1) {
    dispatch_once(&qword_1EA8D8240, &__block_literal_global_485);
  }
  id v5 = qword_1EA8D8238;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__TRIDServer__dispatchWhenUnlocked___block_invoke;
  v7[3] = &unk_1E6BBD870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __36__TRIDServer__dispatchWhenUnlocked___block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__TRIDServer__dispatchWhenUnlocked___block_invoke_2;
  block[3] = &unk_1E6BB8F60;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __36__TRIDServer__dispatchWhenUnlocked___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_registerXpcStreamEventHandler
{
  id v3 = TRILogCategory_Server();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v3, OS_LOG_TYPE_DEFAULT, "set up xpc event stream handler for com.apple.notifyd.matching", buf, 2u);
  }

  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke;
  handler[3] = &unk_1E6BB81D8;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x1E4F14428], handler);
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Set up ACXPCEventSubscriber for AppleAccount changes", buf, 2u);
  }

  id v5 = [MEMORY[0x1E4F17A08] sharedSubscriber];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_416;
  v6[3] = &unk_1E6BBD910;
  v6[4] = self;
  [v5 registerAccountChangeEventHandler:v6];
}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__44;
  v22[4] = __Block_byref_object_dispose__44;
  id v23 = (id)os_transaction_create();
  string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14560]);
  if (string)
  {
    id v5 = [NSString stringWithUTF8String:string];
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v5;
      _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "received xpc event %{public}@", buf, 0xCu);
    }

    if (v5)
    {
      id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 postNotificationName:v5 object:0 userInfo:0];

      if ([&unk_1F347B420 containsObject:v5])
      {
        objc_initWeak((id *)buf, *(id *)(a1 + 32));
        id v8 = *(void **)(a1 + 32);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_366;
        v20[3] = &unk_1E6BBD8C0;
        v20[4] = v8;
        objc_copyWeak(&v21, (id *)buf);
        [v8 _dispatchWhenUnlocked:v20];
        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
      }
      if ([v5 containsString:@"com.apple.ManagedConfiguration.profileListChanged"])
      {
        id v9 = *(void **)(a1 + 32);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_373;
        v19[3] = &unk_1E6BB82F8;
        v19[4] = v9;
        [v9 _dispatchWhenUnlocked:v19];
      }
      if ([&unk_1F347B438 containsObject:v5])
      {
        uint64_t v10 = TRILogCategory_Server();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v5;
          _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "Received LaunchEvent: %@, adjusting opt-out status", buf, 0xCu);
        }

        id v11 = *(void **)(a1 + 32);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_386;
        v18[3] = &unk_1E6BB82F8;
        v18[4] = v11;
        [v11 _dispatchWhenUnlocked:v18];
      }
      if ([&unk_1F347B450 containsObject:v5])
      {
        uint64_t v12 = *(NSObject **)(*(void *)(a1 + 32) + 8);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_3;
        block[3] = &unk_1E6BB9E88;
        id v5 = v5;
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v15 = v5;
        uint64_t v16 = v13;
        objc_super v17 = v22;
        dispatch_async(v12, block);
      }
    }
  }
  else
  {
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Handled event with no name, returning", buf, 2u);
    }
  }

  _Block_object_dispose(v22, 8);
}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_366(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_2;
  v2[3] = &unk_1E6BBD898;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  [v1 addBlockToExecuteAfterPromiseFullfillment:v2];
  objc_destroyWeak(&v3);
}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = [MEMORY[0x1E4F74230] sharedConnection];
    int v9 = [v8 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FB8]];

    uint64_t v10 = [v5 keyValueStore];
    id v11 = +[TRIPersistentUserSettings settingsWithKeyValueStore:v10];

    int v12 = [v11 persistedDiagnosticsUsageEnabled];
    char v13 = v12;
    if (!v12)
    {
      id v14 = objc_alloc(MEMORY[0x1E4FB0258]);
      uint64_t v15 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
      uint64_t v16 = (void *)[v14 initWithPaths:v15];

      if ([v16 isDiagnosticsAndUsageEnabled]) {
        char v13 = 1;
      }
      else {
        char v13 = 2;
      }
    }
    if ((v9 == 1) == (v13 != 1))
    {
      [MEMORY[0x1E4FB0258] updateSystemInfoUsingContext:v5];
      if (v9 == 1) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = 2;
      }
      [v11 persistDiagnosticsUsageEnabled:v17];
      uint64_t v18 = TRILogCategory_Server();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v9 == 1)
      {
        if (v19)
        {
          *(_WORD *)id v21 = 0;
          _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_DEFAULT, "Diagnostics and Usage enabled, will wait for regular retargeting", v21, 2u);
        }
      }
      else
      {
        if (v19)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_DEFAULT, "Diagnostics and Usage disabled, queueing retargeting", buf, 2u);
        }

        uint64_t v18 = +[TRIRetargetAllTask task];
        v20 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
        [v6 addTask:v18 options:v20];
      }
    }
  }
}

uint64_t __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_373(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addBlockToExecuteAfterPromiseFullfillment:&__block_literal_global_376];
}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_2_374(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TRILogCategory_Server();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1DA291000, v3, OS_LOG_TYPE_DEFAULT, "Received LaunchEvent: \"com.apple.ManagedConfiguration.profileListChanged\", creating transaction for Limited Carry manager", v5, 2u);
  }

  id v4 = [v2 limitedCarryManager];

  [v4 processLaunchEvent];
}

uint64_t __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_386(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addBlockToExecuteAfterPromiseFullfillment:&__block_literal_global_389];
}

uint64_t __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_2_387(uint64_t a1, uint64_t a2)
{
  return +[TRIUserAdjustableSettings updateExperimentOptOutStateWithServerContext:a2];
}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_3(uint64_t a1)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_4;
  v10[3] = &unk_1E6BBD8E8;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v11 = v2;
  uint64_t v12 = v3;
  id v4 = (void *)MEMORY[0x1E016EA80](v10);
  int v5 = [MEMORY[0x1E4F93B10] isClassCLocked];
  id v6 = *(id **)(a1 + 40);
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_413;
    v8[3] = &unk_1E6BBD870;
    v8[4] = v6;
    id v9 = v4;
    [v6 _dispatchWhenUnlocked:v8];
  }
  else
  {
    [v6[4] addBlockToExecuteAfterPromiseFullfillment:v4];
  }
  id v7 = self;
}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && v6)
  {
    if (![*(id *)(a1 + 32) containsString:@"kAFPreferencesDidChangeDarwinNotification"])goto LABEL_16; {
    uint64_t v42 = a1;
    }
    id v8 = [v5 keyValueStore];
    id v9 = +[TRIPersistentUserSettings settingsWithKeyValueStore:v8];

    id v10 = objc_alloc(MEMORY[0x1E4FB0258]);
    id v11 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
    uint64_t v12 = (void *)[v10 initWithPaths:v11];

    uint64_t v13 = [v12 userSettingsSiriLocale];
    if (v13) {
      id v14 = (__CFString *)v13;
    }
    else {
      id v14 = &stru_1F3455898;
    }
    if ([v12 userSettingsIsSiriEnabled]) {
      int v15 = 1;
    }
    else {
      int v15 = 2;
    }
    uint64_t v16 = [v9 persistedSiriLocale];
    int v17 = [v16 isEqual:v14] ^ 1;

    int v18 = [v9 persistedIsSiriEnabled];
    BOOL v19 = v18 != v15;
    if (v18 == v15) {
      int v20 = v17;
    }
    else {
      int v20 = 1;
    }
    id v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v45 = v20;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = v17;
      LOWORD(v46) = 1024;
      *(_DWORD *)((char *)&v46 + 2) = v19;
      _os_log_impl(&dword_1DA291000, v21, OS_LOG_TYPE_DEFAULT, "kAFPreferencesDidChange notification relevancy: %d. Siri locale changed: %d, Siri enablement changed: %d", buf, 0x14u);
    }

    [v9 persistSiriLocale:v14];
    [v9 persistIsSiriEnabled:v15];

    a1 = v42;
    if (!v20)
    {
      v24 = TRILogCategory_Server();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = *(void *)(v42 + 32);
        *(_DWORD *)buf = 138543362;
        *(void *)v45 = v40;
        _os_log_impl(&dword_1DA291000, v24, OS_LOG_TYPE_DEFAULT, "Ignoring xpc event: %{public}@, no relevant change found for notification", buf, 0xCu);
      }
    }
    else
    {
LABEL_16:
      char v22 = TRILogCategory_Server();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        *(void *)v45 = v23;
        _os_log_impl(&dword_1DA291000, v22, OS_LOG_TYPE_DEFAULT, "Adding xpc event: %{public}@", buf, 0xCu);
      }

      v24 = +[TRIRetargetAllTask task];
      uint64_t v25 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
      [v7 addTask:v24 options:v25];
    }
    id v26 = objc_alloc(MEMORY[0x1E4FB0258]);
    v27 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
    v28 = [v26 initWithPaths:v27];

    v29 = TRILogCategory_Server();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = *(void *)(a1 + 32);
      if ([v28 userSettingsIsSiriEnabled]) {
        v31 = @"enabled";
      }
      else {
        v31 = @"disabled";
      }
      __int16 v32 = [v28 userSettingsSiriLocale];
      *(_DWORD *)buf = 138543874;
      *(void *)v45 = v30;
      *(_WORD *)&v45[8] = 2114;
      v46 = v31;
      __int16 v47 = 2114;
      v48 = v32;
      _os_log_impl(&dword_1DA291000, v29, OS_LOG_TYPE_DEFAULT, "Xpc event: %{public}@, Siri is %{public}@, Siri Locale is: %{public}@", buf, 0x20u);
    }
    if ([*(id *)(a1 + 32) containsString:@"kAFPreferencesDidChangeDarwinNotification"])
    {
      if ([v28 userSettingsIsSiriEnabled])
      {
        v33 = [v28 userSettingsSiriLocale];
        uint64_t v34 = [v33 length];

        if (v34)
        {
          uint64_t v35 = TRILogCategory_Server();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA291000, v35, OS_LOG_TYPE_DEFAULT, "Inside the OOBE flow with a possibility of triggering setup-assistant-fetch flow.", buf, 2u);
          }

          id v43 = 0;
          BOOL v36 = +[TRISetupAssistantFetchUtils stopSetupAssistantFetchWithServerContext:v5 namespaceNames:0 error:&v43];
          id v37 = v43;
          v38 = v37;
          if (v36)
          {
            v39 = TRILogCategory_Server();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1DA291000, v39, OS_LOG_TYPE_DEFAULT, "Not registering setup-assistant-fetch activity to run", buf, 2u);
            }
          }
          else
          {
            if (!v37)
            {
              [*(id *)(a1 + 40) _registerSetupAssistantFetchActivityOnce];
              goto LABEL_34;
            }
            v39 = TRILogCategory_Server();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)v45 = v38;
              _os_log_error_impl(&dword_1DA291000, v39, OS_LOG_TYPE_ERROR, "Error checking if the setup-assistant-fetch activity is needed to run in OOBE flow: %{public}@", buf, 0xCu);
            }
          }
        }
      }
    }
  }
  else
  {
    v28 = TRILogCategory_Server();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)v45 = v41;
      _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "failed to process %@ - triald failed initialization", buf, 0xCu);
    }
  }
LABEL_34:
}

uint64_t __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_413(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addBlockToExecuteAfterPromiseFullfillment:*(void *)(a1 + 40)];
}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_416(uint64_t a1, void *a2, int a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v5;
    __int16 v12 = 1024;
    int v13 = a3;
    _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "Received account change event for: %@, with change type: %d", buf, 0x12u);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  id v7 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_417;
  v8[3] = &unk_1E6BBD8C0;
  v8[4] = v7;
  objc_copyWeak(&v9, (id *)buf);
  [v7 _dispatchWhenUnlocked:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_417(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_2_418;
  v2[3] = &unk_1E6BBD898;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  [v1 addBlockToExecuteAfterPromiseFullfillment:v2];
  objc_destroyWeak(&v3);
}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_2_418(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [MEMORY[0x1E4FB0258] updateSystemInfoUsingContext:v5];
    id v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Apple Account changed, retargeting", v11, 2u);
    }

    id v9 = +[TRIRetargetAllTask task];
    id v10 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
    [v6 addTask:v9 options:v10];
  }
}

- (void)_registerExternalParamChangeHandler
{
  int out_token = 0;
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__TRIDServer__registerExternalParamChangeHandler__block_invoke;
  v3[3] = &unk_1E6BB8160;
  v3[4] = self;
  notify_register_dispatch("com.apple.trial.external-parameter-change", &out_token, dispatchQueue, v3);
}

void __49__TRIDServer__registerExternalParamChangeHandler__block_invoke(uint64_t a1)
{
  id v2 = TRILogCategory_Server();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DA291000, v2, OS_LOG_TYPE_DEFAULT, "External parameter changed, updating system info and queueing retargeting", v6, 2u);
  }

  id v3 = +[TRIRetargetAllTask task];
  id v4 = *(void **)(*(void *)(a1 + 32) + 24);
  id v5 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
  [v4 addTask:v3 options:v5];
}

- (void)_registerSetupAssistantFetchActivityOnce
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(TRIServerContext *)self->_context keyValueStore];
  id v16 = 0;
  id v4 = +[TRISetupAssistantFetchUtils getValueInKeyValueStore:v3 key:@"setup-assistant-fetch-activity-deadline-date" error:&v16];
  id v5 = v16;

  if (v4)
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = (uint64_t)v4;
      _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "Deadline timestamp  for setup-assistant-fetch activity is: %@", buf, 0xCu);
    }
  }
  else if (v5)
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = @"setup-assistant-fetch-activity-deadline-date";
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Error reading data for %@ key in TRIKVStore: %{public}@. Not proceeding further", buf, 0x16u);
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C9C8] now];
    id v7 = [v6 dateByAddingTimeInterval:21600.0];
    id v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v18 = 21600;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Setting deadline for setup-assistant-fetch activity to be %lld seconds from now, new deadline is at %@", buf, 0x16u);
    }

    [v7 timeIntervalSince1970];
    double v10 = v9;
    id v11 = [(TRIServerContext *)self->_context keyValueStore];
    __int16 v12 = [NSNumber numberWithDouble:v10];
    id v15 = 0;
    BOOL v13 = +[TRISetupAssistantFetchUtils setValueInKeyValueStore:v11 key:@"setup-assistant-fetch-activity-deadline-date" value:v12 error:&v15];
    id v5 = v15;

    if (v13)
    {
      [(TRIXPCActivityManager *)self->_xpcActivityManager registerSetupAssistantFetchActivity];
    }
    else
    {
      uint64_t v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = @"setup-assistant-fetch-activity-deadline-date";
        __int16 v19 = 2114;
        id v20 = v5;
        _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Error writing data for %@ key in TRIKVStore: %{public}@. Not proceeding further", buf, 0x16u);
      }
    }
  }
}

- (unint64_t)_getDiskUsageInBytes
{
  context = (void *)MEMORY[0x1E016E7F0]();
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [(id)objc_opt_class() _triPath];
  id v4 = [v2 enumeratorAtPath:v3];

  id v5 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v6 = [v4 nextObject];
  if (v6)
  {
    id v7 = (void *)v6;
    unint64_t v8 = 0;
    uint64_t v9 = *MEMORY[0x1E4F28390];
    do
    {
      double v10 = NSString;
      id v11 = [(id)objc_opt_class() _triPath];
      __int16 v12 = [v10 stringWithFormat:@"%@/%@", v11, v7];

      BOOL v13 = [v2 attributesOfItemAtPath:v12 error:0];
      uint64_t v14 = [v13 objectForKeyedSubscript:v9];

      v8 += (int)[v14 intValue];
      id v5 = (void *)MEMORY[0x1E016E7F0]();
      id v7 = [v4 nextObject];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)_excludeUserLevelTrialFromTimeMachineBackups
{
  id v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  id v4 = [v3 trialRootDir];
  id v5 = [v2 fileURLWithPath:v4 isDirectory:1];

  [v5 setResourceValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1C630] error:0];
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end