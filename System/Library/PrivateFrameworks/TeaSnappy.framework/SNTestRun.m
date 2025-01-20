@interface SNTestRun
- (BOOL)waitForCommitToFinish;
- (SNTestCase)testCase;
- (SNTestRun)initWithTestCase:(id)a3 testSuite:(id)a4;
- (SNTestSuite)testSuite;
- (int64_t)orientation;
- (void)runTestWithContext:(id)a3 testCoordinator:(id)a4 completion:(id)a5;
- (void)runTestWithContext:(id)a3 testName:(id)a4 testCoordinator:(id)a5 completion:(id)a6;
- (void)setupWithContext:(id)a3 completion:(id)a4;
@end

@implementation SNTestRun

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testSuite, 0);
  objc_storeStrong((id *)&self->_testCase, 0);
}

uint64_t __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    objc_msgSend(*(id *)(a1 + 32), "finishedTestWithTestName:waitForCommit:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "waitForCommitToFinish"));
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v3();
}

- (BOOL)waitForCommitToFinish
{
  v3 = [(SNTestRun *)self testCase];
  int v4 = [v3 conformsToProtocol:&unk_1F39F8AC8];

  if (!v4) {
    return 0;
  }
  v5 = [(SNTestRun *)self testCase];
  char v6 = [v5 waitForCommitToFinish];

  return v6;
}

- (void)runTestWithContext:(id)a3 testName:(id)a4 testCoordinator:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = objc_alloc_init(SNTestChain);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke;
  v21 = &unk_1E6D22600;
  v22 = self;
  id v23 = v10;
  id v24 = v12;
  id v25 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v10;
  [(SNTestChain *)v14 addLink:&v18];
  -[SNTestChain runWithCompletion:](v14, "runWithCompletion:", v13, v18, v19, v20, v21, v22);
}

- (void)setupWithContext:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(SNTestChain);
  v9 = [(SNTestRun *)self testSuite];

  if (v9)
  {
    id v19 = v7;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = [(SNTestRun *)self testSuite];
    id v11 = [v10 testSetupList];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * v15);
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __41__SNTestRun_setupWithContext_completion___block_invoke;
          v22[3] = &unk_1E6D22560;
          v22[4] = v16;
          id v23 = v6;
          [(SNTestChain *)v8 addLink:v22];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    id v7 = v19;
  }
  id v17 = [(SNTestRun *)self testCase];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __41__SNTestRun_setupWithContext_completion___block_invoke_2;
    v20[3] = &unk_1E6D22560;
    v20[4] = self;
    id v21 = v6;
    [(SNTestChain *)v8 addLink:v20];
  }
  [(SNTestChain *)v8 runWithCompletion:v7];
}

- (SNTestSuite)testSuite
{
  return self->_testSuite;
}

- (int64_t)orientation
{
  v3 = [(SNTestRun *)self testCase];
  int v4 = [v3 conformsToProtocol:&unk_1F39F8AC8];

  if (!v4) {
    return 1;
  }
  v5 = [(SNTestRun *)self testCase];
  int64_t v6 = [v5 orientation];

  return v6;
}

void __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  int v4 = [*(id *)(a1 + 32) testCase];
  int v5 = [v4 conformsToProtocol:&unk_1F39F9708];

  int64_t v6 = [*(id *)(a1 + 32) testCase];
  id v7 = v6;
  if (v5)
  {
    v8 = [v6 scrollViewWithContext:*(void *)(a1 + 40)];
    if (v8)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v9 = [v7 scrollDirection];
      }
      else {
        uint64_t v9 = 0;
      }
      if ([MEMORY[0x1E4F94850] isRecapAvailable])
      {
        [*(id *)(a1 + 48) recapScrollTestWithTestName:*(void *)(a1 + 56) scrollView:v8];
      }
      else
      {
        char v22 = objc_opt_respondsToSelector();
        long long v24 = *(void **)(a1 + 48);
        uint64_t v23 = *(void *)(a1 + 56);
        uint64_t v25 = [v7 iterations];
        uint64_t v26 = [v7 offset];
        if (v22) {
          objc_msgSend(v24, "scrollTestWithTestName:scrollView:iterations:offset:numberOfScreens:direction:", v23, v8, v25, v26, objc_msgSend(v7, "numberOfScreens"), v9);
        }
        else {
          [v24 scrollTestWithTestName:v23 scrollView:v8 iterations:v25 offset:v26 direction:v9];
        }
      }
      v3[2](v3, 0);
    }
    else
    {
      id v21 = [[SNTestFailure alloc] initWithMessage:@"Failed to retrieve UIScrollView for test"];
      ((void (**)(id, SNTestFailure *))v3)[2](v3, v21);
    }
    goto LABEL_20;
  }
  int v10 = [v6 conformsToProtocol:&unk_1F39F9768];

  id v11 = [*(id *)(a1 + 32) testCase];
  id v7 = v11;
  if (v10)
  {
    uint64_t v12 = *(void **)(a1 + 48);
    uint64_t v13 = [v11 rotateOrientation];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke_2;
    v38[3] = &unk_1E6D22588;
    id v39 = *(id *)(a1 + 48);
    id v40 = *(id *)(a1 + 56);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke_3;
    v33[3] = &unk_1E6D225B0;
    id v34 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 32);
    id v35 = v14;
    uint64_t v36 = v15;
    v37 = v3;
    [v12 rotateToOrientation:v13 beforeRotation:v38 afterRotation:v33];

    uint64_t v16 = v39;
LABEL_9:

LABEL_20:
    goto LABEL_21;
  }
  int v17 = [v11 conformsToProtocol:&unk_1F39F97C8];

  if (v17)
  {
    id v7 = [*(id *)(a1 + 32) testCase];
    [*(id *)(a1 + 48) startedTestWithTestName:*(void *)(a1 + 56)];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke_4;
    v28[3] = &unk_1E6D225D8;
    uint64_t v18 = *(void *)(a1 + 40);
    id v29 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 56);
    uint64_t v20 = *(void *)(a1 + 32);
    id v30 = v19;
    uint64_t v31 = v20;
    v32 = v3;
    [v7 runTestWithContext:v18 completion:v28];

    uint64_t v16 = v29;
    goto LABEL_9;
  }
  long long v27 = [[SNTestFailure alloc] initWithMessage:@"Unsupported test case; Requires specific SNTestCase type"];
  ((void (**)(id, SNTestFailure *))v3)[2](v3, v27);

LABEL_21:
}

- (SNTestCase)testCase
{
  return self->_testCase;
}

- (SNTestRun)initWithTestCase:(id)a3 testSuite:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SNTestRun;
  uint64_t v9 = [(SNTestRun *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_testCase, a3);
    objc_storeStrong((id *)&v10->_testSuite, a4);
  }

  return v10;
}

uint64_t __41__SNTestRun_setupWithContext_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setupTestWithContext:*(void *)(a1 + 40) completion:a2];
}

void __41__SNTestRun_setupWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 testCase];
  [v5 setupTestWithContext:*(void *)(a1 + 40) completion:v4];
}

- (void)runTestWithContext:(id)a3 testCoordinator:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(SNTestRun *)self testCase];
  id v11 = [v12 testName];
  [(SNTestRun *)self runTestWithContext:v10 testName:v11 testCoordinator:v9 completion:v8];
}

uint64_t __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) startedTestWithTestName:*(void *)(a1 + 40)];
}

void __68__SNTestRun_runTestWithContext_testName_testCoordinator_completion___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedTestWithTestName:waitForCommit:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "waitForCommitToFinish"));
    v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = [[SNTestFailure alloc] initWithMessage:@"Failed to rotate to expected orientation"];
    (*(void (**)(uint64_t, SNTestFailure *))(v4 + 16))(v4, v5);
  }
}

@end