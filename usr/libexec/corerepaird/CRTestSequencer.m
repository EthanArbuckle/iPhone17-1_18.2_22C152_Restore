@interface CRTestSequencer
- (ASTRepairSessionProvider)delegate;
- (ASTSuiteResult)suiteResult;
- (BOOL)started;
- (CRTestContext)testContext;
- (CRTestSequencer)initWithDelegate:(id)a3;
- (NSMutableArray)testSequence;
- (void)handleResult:(id)a3;
- (void)initTestSequence;
- (void)setDelegate:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setSuiteResult:(id)a3;
- (void)setTestContext:(id)a3;
- (void)setTestSequence:(id)a3;
- (void)start;
@end

@implementation CRTestSequencer

- (CRTestSequencer)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRTestSequencer;
  v5 = [(CRTestSequencer *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(CRTestSequencer *)v5 setDelegate:v4];
    [(CRTestSequencer *)v6 setStarted:0];
    [(CRTestSequencer *)v6 initTestSequence];
  }

  return v6;
}

- (void)start
{
  v3 = (void *)os_transaction_create();
  if ([(CRTestSequencer *)self started])
  {
    id v4 = handleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003ED80();
    }
  }
  else
  {
    v41 = v3;
    [(CRTestSequencer *)self setStarted:1];
    v5 = objc_alloc_init(CRTestContext);
    [(CRTestSequencer *)self setTestContext:v5];

    uint64_t v6 = 0;
    v7 = (mach_header_64 *)&_mh_execute_header;
    objc_super v8 = &AMFDRRegisterModuleChallengeCallback_ptr;
    do
    {
      v9 = [(CRTestSequencer *)self testSequence];
      v10 = [v9 objectAtIndexedSubscript:v6];

      v11 = handleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [v10 name];
        *(_DWORD *)buf = 138412290;
        id v43 = v12;
        _os_log_impl(v7, v11, OS_LOG_TYPE_DEFAULT, "Checking test: %@", buf, 0xCu);
      }
      uint64_t v13 = v6 + 1;
      v14 = [(CRTestSequencer *)self delegate];
      v15 = [v8[284] numberWithInteger:(uint64_t)((double)(v6 + 1) * 0.0625 * 100.0)];
      [v14 updateTestSuiteProgress:v15];

      v16 = [(CRTestSequencer *)self testContext];
      LODWORD(v14) = [v10 shouldRun:v16];

      if (v14)
      {
        v17 = v8;
        v18 = v7;
        v19 = [(CRTestSequencer *)self delegate];
        v20 = [(CRTestSequencer *)self testContext];
        unsigned __int8 v21 = [v10 promptContinue:v19 withContext:v20];

        v22 = handleForCategory();
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v21)
        {
          v7 = v18;
          if (v23)
          {
            v24 = [v10 name];
            *(_DWORD *)buf = 138412290;
            id v43 = v24;
            _os_log_impl(v18, v22, OS_LOG_TYPE_DEFAULT, "Running test: %@", buf, 0xCu);
          }
          v25 = dispatch_semaphore_create(0);
          [v10 setRunningSemaphore:v25];
          v26 = [(CRTestSequencer *)self delegate];
          v27 = [(CRTestSequencer *)self testContext];
          [v10 run:v26 withContext:v27];

          dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
        }
        else
        {
          v7 = v18;
          if (v23)
          {
            v28 = [v10 name];
            *(_DWORD *)buf = 138412290;
            id v43 = v28;
            _os_log_impl(v18, v22, OS_LOG_TYPE_DEFAULT, "Cancelling test: %@", buf, 0xCu);
          }
          v25 = objc_alloc_init((Class)ASTTestResult);
          [v25 setStatusCode:&off_100060840];
          v29 = [(CRTestSequencer *)self testContext];
          [v10 update:v29 testIndex:v6 testResult:v25];
        }
        objc_super v8 = v17;
      }
      v30 = [(CRTestSequencer *)self testContext];
      unsigned int v31 = [v30 doRetry];

      if (v31)
      {
        v32 = handleForCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = [(CRTestSequencer *)self testContext];
          id v34 = [v33 lastRunTestIndex];
          *(_DWORD *)buf = 134217984;
          id v43 = v34;
          _os_log_impl(v7, v32, OS_LOG_TYPE_DEFAULT, "Retrying test index: %ld", buf, 0xCu);
        }
        v35 = [(CRTestSequencer *)self testContext];
        uint64_t v13 = (uint64_t)[v35 lastRunTestIndex];

        v36 = [(CRTestSequencer *)self testContext];
        [v36 setDoRetry:0];

        v37 = [(CRTestSequencer *)self testContext];
        [v37 setLastTestStatusCode:&off_100060858];
      }
      uint64_t v6 = v13;
    }
    while (v13 < 16);
    v38 = handleForCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Test sequencer completed", buf, 2u);
    }

    v39 = objc_opt_new();
    [(CRTestSequencer *)self setSuiteResult:v39];

    v40 = [(CRTestSequencer *)self delegate];
    [v40 completeTestSuite:@"Repair Assistant" description:@"SSR suite"];

    [(CRTestSequencer *)self setStarted:0];
    [(CRTestSequencer *)self setTestContext:0];
    v3 = v41;
  }
}

- (void)handleResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = [(CRTestSequencer *)self testSequence];
    v7 = [v6 objectAtIndexedSubscript:v5];
    objc_super v8 = [v7 runningSemaphore];

    if (v8) {
      break;
    }
    if (++v5 == 16)
    {
      v9 = 0;
      goto LABEL_12;
    }
  }
  v10 = [(CRTestSequencer *)self testSequence];
  v9 = [v10 objectAtIndexedSubscript:v5];

  if (!v9
    || ([v9 runningSemaphore], v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
  {
LABEL_12:
    v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10003EDB4();
    }
    goto LABEL_14;
  }
  if (v4)
  {
    uint64_t v12 = [v4 testId];
    if (v12
      && (uint64_t v13 = (void *)v12,
          [v9 statusCode],
          v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          v14))
    {
      v15 = [v4 testId];
      v16 = [v9 testId];
      unsigned __int8 v17 = [v15 isEqualToNumber:v16];

      if (v17)
      {
        v18 = [(CRTestSequencer *)self testContext];
        [v9 update:v18 testIndex:v5 testResult:v4];

        v19 = [v9 runningSemaphore];
        dispatch_semaphore_signal(v19);

        [v9 setRunningSemaphore:0];
        goto LABEL_15;
      }
      v20 = handleForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10003EE50();
      }
    }
    else
    {
      v20 = handleForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10003EE1C();
      }
    }
  }
  else
  {
    v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10003EDE8();
    }
  }
LABEL_14:

LABEL_15:
}

- (void)initTestSequence
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:16];
  [(CRTestSequencer *)self setTestSequence:v3];

  id v4 = objc_alloc_init(CRTest_8262);
  uint64_t v5 = [(CRTestSequencer *)self testSequence];
  [v5 setObject:v4 atIndexedSubscript:0];

  uint64_t v6 = objc_alloc_init(CRTest_8259);
  v7 = [(CRTestSequencer *)self testSequence];
  [v7 setObject:v6 atIndexedSubscript:1];

  objc_super v8 = objc_alloc_init(CRTest_9006);
  v9 = [(CRTestSequencer *)self testSequence];
  [v9 setObject:v8 atIndexedSubscript:2];

  v10 = objc_alloc_init(CRTest_9008);
  v11 = [(CRTestSequencer *)self testSequence];
  [v11 setObject:v10 atIndexedSubscript:3];

  uint64_t v12 = objc_alloc_init(CRTest_8268);
  uint64_t v13 = [(CRTestSequencer *)self testSequence];
  [v13 setObject:v12 atIndexedSubscript:4];

  v14 = objc_alloc_init(CRTest_8340);
  v15 = [(CRTestSequencer *)self testSequence];
  [v15 setObject:v14 atIndexedSubscript:5];

  v16 = objc_alloc_init(CRTest_8185_Staged);
  unsigned __int8 v17 = [(CRTestSequencer *)self testSequence];
  [v17 setObject:v16 atIndexedSubscript:6];

  v18 = objc_alloc_init(CRTest_8343);
  v19 = [(CRTestSequencer *)self testSequence];
  [v19 setObject:v18 atIndexedSubscript:7];

  v20 = objc_alloc_init(CRTest_7004);
  unsigned __int8 v21 = [(CRTestSequencer *)self testSequence];
  [v21 setObject:v20 atIndexedSubscript:8];

  v22 = objc_alloc_init(CRTest_6002);
  BOOL v23 = [(CRTestSequencer *)self testSequence];
  [v23 setObject:v22 atIndexedSubscript:9];

  v24 = objc_alloc_init(CRTest_8185_Patch);
  v25 = [(CRTestSequencer *)self testSequence];
  [v25 setObject:v24 atIndexedSubscript:10];

  v26 = objc_alloc_init(CRTest_8276);
  v27 = [(CRTestSequencer *)self testSequence];
  [v27 setObject:v26 atIndexedSubscript:11];

  v28 = objc_alloc_init(CRTest_8185_Update);
  v29 = [(CRTestSequencer *)self testSequence];
  [v29 setObject:v28 atIndexedSubscript:12];

  v30 = objc_alloc_init(CRTest_8264);
  unsigned int v31 = [(CRTestSequencer *)self testSequence];
  [v31 setObject:v30 atIndexedSubscript:13];

  v32 = objc_alloc_init(CRTest_8185);
  v33 = [(CRTestSequencer *)self testSequence];
  [v33 setObject:v32 atIndexedSubscript:14];

  v35 = objc_alloc_init(CRTest_9010);
  id v34 = [(CRTestSequencer *)self testSequence];
  [v34 setObject:v35 atIndexedSubscript:15];
}

- (ASTSuiteResult)suiteResult
{
  return self->_suiteResult;
}

- (void)setSuiteResult:(id)a3
{
}

- (ASTRepairSessionProvider)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)testSequence
{
  return self->_testSequence;
}

- (void)setTestSequence:(id)a3
{
}

- (CRTestContext)testContext
{
  return self->_testContext;
}

- (void)setTestContext:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testContext, 0);
  objc_storeStrong((id *)&self->_testSequence, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_suiteResult, 0);
}

@end