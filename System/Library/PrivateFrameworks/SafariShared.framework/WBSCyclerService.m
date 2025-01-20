@interface WBSCyclerService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)identifier;
- (WBSCyclerService)init;
- (id)_descriptionForErrorCode:(int64_t)a3;
- (id)_errorWithCode:(int64_t)a3;
- (id)_startCyclingFromBeginning:(BOOL)a3;
- (void)_finishedWithResult:(int64_t)a3 error:(id)a4;
- (void)_postFinishNotificationWithError:(id)a3;
- (void)_setMaximumIterationCount:(unint64_t)a3 reply:(id)a4;
- (void)_setSeed:(unint64_t)a3 reply:(id)a4;
- (void)_setTestSuiteName:(id)a3 reply:(id)a4;
- (void)fetchLastErrorWithReply:(id)a3;
- (void)fetchLogsWithReply:(id)a3;
- (void)fetchStatusWithReply:(id)a3;
- (void)sendRequestToTestSuite:(id)a3 reply:(id)a4;
- (void)setIdentifier:(id)a3;
- (void)setTestTargetEndpoint:(id)a3 reply:(id)a4;
- (void)setValue:(id)a3 forConfigurationKey:(id)a4 reply:(id)a5;
- (void)startCyclingFromBeginning:(BOOL)a3 reply:(id)a4;
- (void)stopCyclingWithReply:(id)a3;
@end

@implementation WBSCyclerService

- (WBSCyclerService)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSCyclerService;
  v2 = [(WBSCyclerService *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.internal.safaricyclerd"];
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_xpcListener setDelegate:v2];
    [(NSXPCListener *)v2->_xpcListener resume];
    v2->_maximumIterationCount = 0;
    v5 = v2;
  }

  return v2;
}

- (void)setTestTargetEndpoint:(id)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = (void (**)(id, void *))a4;
  if ([(WBSCyclerTestRunner *)self->_testRunner isRunning])
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSCyclerService setTestTargetEndpoint:reply:]();
    }
    v9 = [(WBSCyclerService *)self _errorWithCode:0];
    v7[2](v7, v9);
  }
  else
  {
    objc_initWeak(&location, self);
    v10 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v6;
      _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_INFO, "Received endpoint %{public}@ for test target", buf, 0xCu);
    }
    v11 = [[WBSCyclerTestTargetProxyController alloc] initWithEndpoint:v6];
    testTargetProxyController = self->_testTargetProxyController;
    p_testTargetProxyController = (id *)&self->_testTargetProxyController;
    id *p_testTargetProxyController = v11;

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48__WBSCyclerService_setTestTargetEndpoint_reply___block_invoke;
    v14[3] = &unk_1E5C8E0B0;
    objc_copyWeak(&v15, &location);
    [*p_testTargetProxyController setDisconnectionHandler:v14];
    v7[2](v7, 0);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __48__WBSCyclerService_setTestTargetEndpoint_reply___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WBSCyclerService_setTestTargetEndpoint_reply___block_invoke_2;
  block[3] = &unk_1E5C8E0B0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __48__WBSCyclerService_setTestTargetEndpoint_reply___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __48__WBSCyclerService_setTestTargetEndpoint_reply___block_invoke_2_cold_1();
    }
    [WeakRetained[5] requestStop];
    id v3 = WeakRetained[5];
    WeakRetained[5] = 0;

    id v4 = WeakRetained[2];
    WeakRetained[2] = 0;

    v5 = [WeakRetained _errorWithCode:3];
    [WeakRetained _finishedWithResult:1 error:v5];
  }
}

- (void)setValue:(id)a3 forConfigurationKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  if ([(WBSCyclerTestRunner *)self->_testRunner isRunning])
  {
    v11 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WBSCyclerService setValue:forConfigurationKey:reply:]();
    }
    v12 = self;
    uint64_t v13 = 0;
  }
  else
  {
    if ([v9 isEqualToString:@"test-suite"])
    {
      [(WBSCyclerService *)self _setTestSuiteName:v8 reply:v10];
      goto LABEL_15;
    }
    if ([v9 isEqualToString:@"seed"])
    {
      -[WBSCyclerService _setSeed:reply:](self, "_setSeed:reply:", [v8 integerValue], v10);
      goto LABEL_15;
    }
    if ([v9 isEqualToString:@"maximum-iterations"])
    {
      -[WBSCyclerService _setMaximumIterationCount:reply:](self, "_setMaximumIterationCount:reply:", [v8 integerValue], v10);
      goto LABEL_15;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [(objc_class *)self->_testSuiteClass setValue:v8 forConfigurationKey:v9])
    {
      v10[2](v10, 0);
      goto LABEL_15;
    }
    v12 = self;
    uint64_t v13 = 7;
  }
  v14 = [(WBSCyclerService *)v12 _errorWithCode:v13];
  ((void (**)(id, void *))v10)[2](v10, v14);

LABEL_15:
}

- (void)startCyclingFromBeginning:(BOOL)a3 reply:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  id v8 = [(WBSCyclerService *)self _startCyclingFromBeginning:v5];
  (*((void (**)(id, id))a4 + 2))(v7, v8);
}

- (void)stopCyclingWithReply:(id)a3
{
  testRunner = self->_testRunner;
  BOOL v5 = (void (**)(id, void))a3;
  if ([(WBSCyclerTestRunner *)testRunner isRunning])
  {
    [(WBSCyclerTestRunner *)self->_testRunner requestStop];
    id v6 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Submitted request to stop cycling", v9, 2u);
    }
    v5[2](v5, 0);
  }
  else
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WBSCyclerService stopCyclingWithReply:]();
    }
    uint64_t v8 = [(WBSCyclerService *)self _errorWithCode:1];
    v5[2](v5, v8);

    BOOL v5 = (void (**)(id, void))v8;
  }
}

- (void)sendRequestToTestSuite:(id)a3 reply:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (![(WBSCyclerTestRunner *)self->_testRunner isRunning])
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[WBSCyclerService sendRequestToTestSuite:reply:]();
    }
    v11 = [(WBSCyclerService *)self _errorWithCode:1];
    v7[2](v7, v11);
    goto LABEL_7;
  }
  [(WBSCyclerTestRunner *)self->_testRunner handleRequest:v6 completionHandler:v7];
  uint64_t v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    testRunner = self->_testRunner;
    v10 = v8;
    v11 = [(WBSCyclerTestRunner *)testRunner testSuite];
    int v13 = 138543618;
    id v14 = v6;
    __int16 v15 = 2114;
    v16 = v11;
    _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_INFO, "Submitted request %{public}@ to test suite %{public}@", (uint8_t *)&v13, 0x16u);

LABEL_7:
  }
}

- (void)fetchStatusWithReply:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [(WBSCyclerTestSuite *)self->_testSuite iterationCounter];
    uint64_t v6 = [v5 iterationCount];
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (self->_lastTestStart)
  {
    lastTestEnd = self->_lastTestEnd;
    uint64_t v8 = lastTestEnd;
    if (!lastTestEnd)
    {
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
    }
    [v8 timeIntervalSince1970];
    double v10 = v9;
    [(NSDate *)self->_lastTestStart timeIntervalSince1970];
    double v12 = v10 - v11;
    if (!lastTestEnd) {
  }
    }
  else
  {
    double v12 = 0.0;
  }
  int v13 = [WBSCyclerStatus alloc];
  id v14 = NSStringFromClass(self->_testSuiteClass);
  __int16 v15 = [(WBSCyclerStatus *)v13 initWithActiveTestSuiteName:v14 seed:+[WBSCyclerRandomnessUtilities seed] isConnectedToTestTarget:self->_testTargetProxyController != 0 isRunning:[(WBSCyclerTestRunner *)self->_testRunner isRunning] iterationCount:v6 executionTime:v12];

  v4[2](v4, v15, 0);
}

- (void)fetchLogsWithReply:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  BOOL v5 = (void *)getOSLogStoreClass_softClass;
  uint64_t v26 = getOSLogStoreClass_softClass;
  if (!getOSLogStoreClass_softClass)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __getOSLogStoreClass_block_invoke;
    v22[3] = &unk_1E5C8C9B8;
    v22[4] = &v23;
    __getOSLogStoreClass_block_invoke((uint64_t)v22);
    BOOL v5 = (void *)v24[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v23, 8);
  id v21 = 0;
  id v7 = [v6 storeWithScope:1 error:&v21];
  id v8 = v21;
  if (v8)
  {
    id v9 = v8;
    double v10 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WBSCyclerService fetchLogsWithReply:](v10, v9);
    }
    v4[2](v4, 0, v9);
  }
  else
  {
    double v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"category = 'Cycler' AND timestamp >= %@", self->_lastTestStart];
    id v20 = 0;
    double v12 = [v7 entriesEnumeratorWithOptions:0 position:0 predicate:v11 error:&v20];
    id v9 = v20;
    int v13 = [v12 allObjects];
    id v14 = objc_opt_new();
    __int16 v15 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    [v14 setTimeZone:v15];

    [v14 setDateFormat:@"yyyy-MM-dd hh:mm:ss.SSSZ"];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __39__WBSCyclerService_fetchLogsWithReply___block_invoke;
    v18[3] = &unk_1E5C9A878;
    id v19 = v14;
    id v16 = v14;
    uint64_t v17 = objc_msgSend(v13, "safari_mapObjectsUsingBlock:", v18);
    ((void (**)(id, void *, id))v4)[2](v4, v17, 0);
  }
}

id __39__WBSCyclerService_fetchLogsWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSString;
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  BOOL v5 = [v4 date];
  id v6 = [v3 stringFromDate:v5];
  id v7 = [v4 composedMessage];

  id v8 = [v2 stringWithFormat:@"[%@] %@", v6, v7];

  return v8;
}

- (void)fetchLastErrorWithReply:(id)a3
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  BOOL v5 = (void *)MEMORY[0x1E4F29280];
  id v6 = a4;
  id v7 = [v5 interfaceWithProtocol:&unk_1EFC31F80];
  [v6 setExportedInterface:v7];

  [v6 setExportedObject:self];
  [v6 resume];

  return 1;
}

- (id)_startCyclingFromBeginning:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(WBSCyclerTestRunner *)self->_testRunner isRunning])
  {
    BOOL v5 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WBSCyclerService _startCyclingFromBeginning:]();
    }
    id v6 = self;
    uint64_t v7 = 0;
LABEL_18:
    id v21 = [(WBSCyclerService *)v6 _errorWithCode:v7];
    goto LABEL_19;
  }
  if (!self->_testTargetProxyController)
  {
    id v19 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[WBSCyclerService _startCyclingFromBeginning:]();
    }
    id v6 = self;
    uint64_t v7 = 2;
    goto LABEL_18;
  }
  testSuiteClass = self->_testSuiteClass;
  if (!testSuiteClass)
  {
    id v20 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[WBSCyclerService _startCyclingFromBeginning:]();
    }
    id v6 = self;
    uint64_t v7 = 4;
    goto LABEL_18;
  }
  if (v3)
  {
    id v9 = (WBSCyclerTestSuite *)objc_alloc_init(testSuiteClass);
    testSuite = self->_testSuite;
    self->_testSuite = v9;

    double v11 = [MEMORY[0x1E4F1C9C8] now];
    lastTestStart = self->_lastTestStart;
    self->_lastTestStart = v11;

    lastTestEnd = self->_lastTestEnd;
    self->_lastTestEnd = 0;

    lastError = self->_lastError;
    self->_lastError = 0;

    if (objc_opt_respondsToSelector())
    {
      __int16 v15 = [[WBSCyclerIterationCounter alloc] initWithMaximumIterationCount:self->_maximumIterationCount];
      [(WBSCyclerTestSuite *)self->_testSuite setIterationCounter:v15];
    }
    +[WBSCyclerRandomnessUtilities reseed];
    id v16 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = self->_testSuite;
      id v18 = v16;
      *(_DWORD *)buf = 138543618;
      v33 = v17;
      __int16 v34 = 2048;
      unint64_t v35 = +[WBSCyclerRandomnessUtilities seed];
      _os_log_impl(&dword_1A6B5F000, v18, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ with seed %lu", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v23 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_testSuite;
      *(_DWORD *)buf = 138543362;
      v33 = v24;
      _os_log_impl(&dword_1A6B5F000, v23, OS_LOG_TYPE_DEFAULT, "Resuming %{public}@", buf, 0xCu);
    }
  }
  uint64_t v25 = [WBSCyclerTestRunner alloc];
  uint64_t v26 = self->_testSuite;
  v27 = [(WBSCyclerTestTargetProxyController *)self->_testTargetProxyController testTargetProxy];
  v28 = [(WBSCyclerTestRunner *)v25 initWithTestSuite:v26 target:v27];
  testRunner = self->_testRunner;
  self->_testRunner = v28;

  v30 = self->_testRunner;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __47__WBSCyclerService__startCyclingFromBeginning___block_invoke;
  v31[3] = &unk_1E5C9A8A0;
  v31[4] = self;
  [(WBSCyclerTestRunner *)v30 runWithCompletionHandler:v31];
  id v21 = 0;
LABEL_19:
  return v21;
}

uint64_t __47__WBSCyclerService__startCyclingFromBeginning___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishedWithResult:a2 error:a3];
}

- (void)_setTestSuiteName:(id)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = (NSString *)a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  Class v8 = NSClassFromString(v6);
  if (!v8)
  {
    double v12 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[WBSCyclerService _setTestSuiteName:reply:]();
    }
    int v13 = self;
    uint64_t v14 = 5;
    goto LABEL_12;
  }
  id v9 = v8;
  if (([(objc_class *)v8 conformsToProtocol:&unk_1EFC30A68] & 1) == 0)
  {
    __int16 v15 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[WBSCyclerService _setTestSuiteName:reply:]();
    }
    int v13 = self;
    uint64_t v14 = 6;
LABEL_12:
    id v16 = [(WBSCyclerService *)v13 _errorWithCode:v14];
    v7[2](v7, v16);

    goto LABEL_13;
  }
  self->_Class testSuiteClass = v9;
  double v10 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    Class testSuiteClass = self->_testSuiteClass;
    int v17 = 138543362;
    Class v18 = testSuiteClass;
    _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_INFO, "Set test suite to %{public}@", (uint8_t *)&v17, 0xCu);
  }
  v7[2](v7, 0);
LABEL_13:
}

- (void)_setSeed:(unint64_t)a3 reply:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void (**)(id, void))a4;
  id v6 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    unint64_t v8 = a3;
    _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Seed set to %lu", (uint8_t *)&v7, 0xCu);
  }
  +[WBSCyclerRandomnessUtilities setSeed:a3];
  v5[2](v5, 0);
}

- (void)_setMaximumIterationCount:(unint64_t)a3 reply:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void))a4;
  int v7 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    unint64_t v9 = a3;
    _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_INFO, "Set maximum iterations to %lu", (uint8_t *)&v8, 0xCu);
  }
  self->_maximumIterationCount = a3;
  v6[2](v6, 0);
}

- (void)_finishedWithResult:(int64_t)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F1C9C8] now];
  lastTestEnd = self->_lastTestEnd;
  self->_lastTestEnd = v8;

  objc_storeStrong((id *)&self->_lastError, a4);
  switch(a3)
  {
    case 2:
      double v12 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[WBSCyclerService _finishedWithResult:error:]((uint64_t)self, v12, v13, v14, v15, v16, v17, v18);
      }
      break;
    case 1:
      uint64_t v19 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[WBSCyclerService _finishedWithResult:error:]((uint64_t)self, (uint64_t)v7, v19);
      }
      break;
    case 0:
      uint64_t v10 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        testSuite = self->_testSuite;
        int v20 = 138543362;
        id v21 = testSuite;
        _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_INFO, "%{public}@ passed", (uint8_t *)&v20, 0xCu);
      }
      break;
  }
  [(WBSCyclerService *)self _postFinishNotificationWithError:v7];
}

- (void)_postFinishNotificationWithError:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v10[0] = @"errorDomain";
    id v4 = a3;
    BOOL v5 = [v4 domain];
    v11[0] = v5;
    v10[1] = @"errorCode";
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code"));
    v11[1] = v6;
    v10[2] = @"errorLocalizedDescription";
    id v7 = [v4 localizedDescription];

    v11[2] = v7;
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  }
  else
  {
    int v8 = 0;
  }
  unint64_t v9 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v9 postNotificationName:@"com.apple.SafariShared.Cycler.DidFinishRunningTest" object:self->_identifier userInfo:v8];
}

- (id)_errorWithCode:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  BOOL v5 = -[WBSCyclerService _descriptionForErrorCode:](self, "_descriptionForErrorCode:");
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v4 errorWithDomain:@"WBSCyclerServiceErrorDomain" code:a3 userInfo:v6];

  return v7;
}

- (id)_descriptionForErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return @"A test is already running";
  }
  else {
    return off_1E5C9A8D8[a3 - 1];
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_lastTestEnd, 0);
  objc_storeStrong((id *)&self->_lastTestStart, 0);
  objc_storeStrong((id *)&self->_testRunner, 0);
  objc_storeStrong((id *)&self->_testSuite, 0);
  objc_storeStrong((id *)&self->_testTargetProxyController, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

- (void)setTestTargetEndpoint:reply:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_1A6B5F000, v0, v1, "Received new test target endpoint %{public}@, but test is already running", v2, v3, v4, v5, v6);
}

void __48__WBSCyclerService_setTestTargetEndpoint_reply___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Disconnected from test target; it may have crashed or exited",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)setValue:forConfigurationKey:reply:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Cannot modify test suite options while test is running", v2, v3, v4, v5, v6);
}

- (void)stopCyclingWithReply:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Asked to stop cycling, but no test is running", v2, v3, v4, v5, v6);
}

- (void)sendRequestToTestSuite:reply:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_1A6B5F000, v0, v1, "Asked to perform request %{public}@, but no test is running", v2, v3, v4, v5, v6);
}

- (void)fetchLogsWithReply:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_1_5();
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "Error reading log store: %{public}@", v5, 0xCu);
}

- (void)_startCyclingFromBeginning:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Asked to start cycling, but test is already running. Ignoring.", v2, v3, v4, v5, v6);
}

- (void)_startCyclingFromBeginning:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Asked to start cycling, but there is no available test target", v2, v3, v4, v5, v6);
}

- (void)_startCyclingFromBeginning:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Asked to start cycling, but no test suite has been specified", v2, v3, v4, v5, v6);
}

- (void)_setTestSuiteName:reply:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_1A6B5F000, v0, v1, "Received test suite name \"%{public}@\" but no class found with that name", v2, v3, v4, v5, v6);
}

- (void)_setTestSuiteName:reply:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_1A6B5F000, v0, v1, "Received test suite name \"%{public}@\" but that class does not conform to the test suite protocol", v2, v3, v4, v5, v6);
}

- (void)_finishedWithResult:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_finishedWithResult:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end