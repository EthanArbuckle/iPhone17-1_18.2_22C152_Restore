@interface WBSCyclerTestRunner
- (BOOL)isRunning;
- (WBSCyclerTestRunner)init;
- (WBSCyclerTestRunner)initWithTestSuite:(id)a3 target:(id)a4;
- (WBSCyclerTestSuite)testSuite;
- (WBSCyclerTestTarget)target;
- (id)_descriptionForErrorCode:(int64_t)a3;
- (id)_errorWithCode:(int64_t)a3;
- (void)_handleNextPendingRequestWithCompletionHandler:(id)a3;
- (void)_performNextIterationWithCompletionHandler:(id)a3;
- (void)_stop;
- (void)dealloc;
- (void)handleRequest:(id)a3 completionHandler:(id)a4;
- (void)requestStop;
- (void)runWithCompletionHandler:(id)a3;
@end

@implementation WBSCyclerTestRunner

- (WBSCyclerTestRunner)init
{
  return 0;
}

- (WBSCyclerTestRunner)initWithTestSuite:(id)a3 target:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBSCyclerTestRunner;
  v9 = [(WBSCyclerTestRunner *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_testSuite, a3);
    objc_storeStrong((id *)&v10->_target, a4);
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    pendingRequestQueue = v10->_pendingRequestQueue;
    v10->_pendingRequestQueue = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    pendingRequestCompletionHandlerQueue = v10->_pendingRequestCompletionHandlerQueue;
    v10->_pendingRequestCompletionHandlerQueue = (NSMutableArray *)v13;

    v15 = v10;
  }

  return v10;
}

- (void)dealloc
{
  if (self->_running) {
    [(WBSCyclerTestRunner *)self _stop];
  }
  v3.receiver = self;
  v3.super_class = (Class)WBSCyclerTestRunner;
  [(WBSCyclerTestRunner *)&v3 dealloc];
}

- (void)runWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__WBSCyclerTestRunner_runWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5C8CDF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __48__WBSCyclerTestRunner_runWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 32) + 40) setUp];
  }
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _performNextIterationWithCompletionHandler:v3];
}

- (void)requestStop
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__WBSCyclerTestRunner_requestStop__block_invoke;
  block[3] = &unk_1E5C8C880;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __34__WBSCyclerTestRunner_requestStop__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 32)) {
    *(unsigned char *)(v1 + 8) = 1;
  }
  return result;
}

- (void)handleRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__WBSCyclerTestRunner_handleRequest_completionHandler___block_invoke;
  block[3] = &unk_1E5C8C8F8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __55__WBSCyclerTestRunner_handleRequest_completionHandler___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 16) addObject:a1[5]];
  v2 = *(void **)(a1[4] + 24);
  id v3 = (id)MEMORY[0x1AD0C4F80](a1[6]);
  [v2 addObject:v3];
}

- (void)_stop
{
  self->_running = 0;
  if (objc_opt_respondsToSelector())
  {
    testSuite = self->_testSuite;
    [(WBSCyclerTestSuite *)testSuite tearDown];
  }
}

- (void)_performNextIterationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(WBSCyclerTestSuite *)self->_testSuite isFinished] & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    && ([(WBSCyclerTestSuite *)self->_testSuite iterationCounter],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 hasReachedMaximumIterationCount],
        v5,
        v6))
  {
    [(WBSCyclerTestRunner *)self _stop];
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
  else if (self->_stopRequested)
  {
    [(WBSCyclerTestRunner *)self _stop];
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 2, 0);
  }
  else
  {
    if ([(NSMutableArray *)self->_pendingRequestQueue count])
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __66__WBSCyclerTestRunner__performNextIterationWithCompletionHandler___block_invoke;
      v12[3] = &unk_1E5C8DC00;
      v12[4] = self;
      id v13 = v4;
      [(WBSCyclerTestRunner *)self _handleNextPendingRequestWithCompletionHandler:v12];
      id v7 = v13;
    }
    else
    {
      testSuite = self->_testSuite;
      target = self->_target;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __66__WBSCyclerTestRunner__performNextIterationWithCompletionHandler___block_invoke_2;
      v10[3] = &unk_1E5C8DC00;
      v10[4] = self;
      id v11 = v4;
      [(WBSCyclerTestSuite *)testSuite runWithTarget:target completionHandler:v10];
      id v7 = v11;
    }
  }
}

void __66__WBSCyclerTestRunner__performNextIterationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  if (v3)
  {
    [v4 _stop];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [v4 _performNextIterationWithCompletionHandler:*(void *)(a1 + 40)];
  }
}

void __66__WBSCyclerTestRunner__performNextIterationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__WBSCyclerTestRunner__performNextIterationWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E5C8C8F8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __66__WBSCyclerTestRunner__performNextIterationWithCompletionHandler___block_invoke_3(void *a1)
{
  uint64_t v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
  {
    [v2 _stop];
    uint64_t v4 = *(uint64_t (**)(void))(a1[6] + 16);
    return v4();
  }
  else
  {
    uint64_t v6 = a1[6];
    return [v2 _performNextIterationWithCompletionHandler:v6];
  }
}

- (void)_handleNextPendingRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_pendingRequestQueue firstObject];
  uint64_t v6 = [(NSMutableArray *)self->_pendingRequestCompletionHandlerQueue firstObject];
  [(NSMutableArray *)self->_pendingRequestQueue removeObjectAtIndex:0];
  [(NSMutableArray *)self->_pendingRequestCompletionHandlerQueue removeObjectAtIndex:0];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(WBSCyclerTestSuite *)self->_testSuite canHandleRequest:v5] & 1) != 0)
  {
    testSuite = self->_testSuite;
    target = self->_target;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__WBSCyclerTestRunner__handleNextPendingRequestWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E5C9A948;
    id v11 = v6;
    id v12 = v4;
    [(WBSCyclerTestSuite *)testSuite handleRequest:v5 withTarget:target completionHandler:v10];
  }
  else
  {
    uint64_t v9 = [(WBSCyclerTestRunner *)self _errorWithCode:0];
    ((void (**)(void, void *))v6)[2](v6, v9);

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __70__WBSCyclerTestRunner__handleNextPendingRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_errorWithCode:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  id v5 = -[WBSCyclerTestRunner _descriptionForErrorCode:](self, "_descriptionForErrorCode:");
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v4 errorWithDomain:@"WBSCyclerTestRunnerErrorDomain" code:a3 userInfo:v6];

  return v7;
}

- (id)_descriptionForErrorCode:(int64_t)a3
{
  return @"Unrecognized request for test suite";
}

- (WBSCyclerTestSuite)testSuite
{
  return self->_testSuite;
}

- (WBSCyclerTestTarget)target
{
  return self->_target;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_testSuite, 0);
  objc_storeStrong((id *)&self->_pendingRequestCompletionHandlerQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequestQueue, 0);
}

@end