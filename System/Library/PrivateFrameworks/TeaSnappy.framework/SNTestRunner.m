@interface SNTestRunner
- (BOOL)runExtendedLaunchTest;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (BOOL)runTest:(id)a3 options:(id)a4 fallingBackWith:(id)a5;
- (BOOL)runTestRun:(id)a3 testName:(id)a4 options:(id)a5 fallingBackWith:(id)a6;
- (SNTestCoordinating)testCoordinator;
- (SNTestRunner)initWithApplication:(id)a3 testCoordinator:(id)a4 testStore:(id)a5;
- (SNTestStore)testStore;
- (UIApplication)application;
@end

@implementation SNTestRunner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testStore, 0);
  objc_storeStrong((id *)&self->_testCoordinator, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

- (SNTestRunner)initWithApplication:(id)a3 testCoordinator:(id)a4 testStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SNTestRunner;
  v12 = [(SNTestRunner *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_application, a3);
    objc_storeStrong((id *)&v13->_testCoordinator, a4);
    objc_storeStrong((id *)&v13->_testStore, a5);
  }

  return v13;
}

- (BOOL)runExtendedLaunchTest
{
  v3 = [(SNTestRunner *)self testStore];
  v4 = [v3 extendedLaunchTestRun];

  if (!v4) {
    return 0;
  }
  v5 = [(SNTestRunner *)self testStore];
  v6 = [v5 extendedLaunchTestRun];
  v7 = [(SNTestRunner *)self testCoordinator];
  v8 = [v7 launchTestName];
  BOOL v9 = [(SNTestRunner *)self runTestRun:v6 testName:v8 options:0 fallingBackWith:0];

  return v9;
}

- (SNTestStore)testStore
{
  return self->_testStore;
}

void __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  v4 = [a1[4] testCoordinator];
  int v5 = objc_msgSend(v4, "requiresRotationForOrientation:", objc_msgSend(a1[5], "orientation"));

  if (v5)
  {
    v6 = [a1[4] testCoordinator];
    uint64_t v7 = [a1[5] orientation];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_4;
    v14[3] = &unk_1E6D22678;
    id v15 = a1[5];
    id v16 = a1[6];
    id v8 = a1[7];
    id v9 = a1[4];
    id v17 = v8;
    id v18 = v9;
    id v19 = v3;
    [v6 rotateToOrientation:v7 beforeRotation:0 afterRotation:v14];
  }
  else
  {
    id v10 = a1[6];
    id v11 = a1[7];
    id v12 = a1[5];
    v13 = [a1[4] testCoordinator];
    [v12 runTestWithContext:v10 testName:v11 testCoordinator:v13 completion:v3];
  }
}

- (SNTestCoordinating)testCoordinator
{
  return self->_testCoordinator;
}

- (BOOL)runTestRun:(id)a3 testName:(id)a4 options:(id)a5 fallingBackWith:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = objc_alloc_init(SNTestChain);
  v13 = [SNTestContext alloc];
  v14 = [(SNTestRunner *)self application];
  id v15 = [(SNTestContext *)v13 initWithApplication:v14 testName:v10];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke;
  v30[3] = &unk_1E6D22650;
  id v16 = v9;
  id v31 = v16;
  id v17 = v15;
  v32 = v17;
  id v33 = v11;
  id v18 = v11;
  [(SNTestChain *)v12 addLink:v30];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_3;
  v26[3] = &unk_1E6D22600;
  v26[4] = self;
  id v27 = v16;
  v28 = v17;
  id v19 = v10;
  id v29 = v19;
  v20 = v17;
  id v21 = v16;
  [(SNTestChain *)v12 addLink:v26];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_5;
  v24[3] = &unk_1E6D226A0;
  v24[4] = self;
  id v25 = v19;
  id v22 = v19;
  [(SNTestChain *)v12 runWithCompletion:v24];

  return 1;
}

void __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_5(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v7 = [v3 testCoordinator];
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = [v4 message];

    [v7 failedTestWithTestName:v5 failureMessage:v6];
  }
}

void __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3 && (uint64_t v4 = *(void *)(a1 + 32)) != 0) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_2;
  v7[3] = &unk_1E6D22628;
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v6 = v3;
  [v4 setupWithContext:v5 completion:v7];
}

- (UIApplication)application
{
  return self->_application;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  return [(SNTestRunner *)self runTest:a3 options:a4 fallingBackWith:0];
}

- (BOOL)runTest:(id)a3 options:(id)a4 fallingBackWith:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (uint64_t (**)(void))a5;
  id v11 = [(SNTestRunner *)self testStore];
  id v12 = [v11 testRunForTestName:v8];

  if (v12)
  {
    char v13 = [(SNTestRunner *)self runTestRun:v12 testName:v8 options:v9 fallingBackWith:v10];
  }
  else
  {
    if (!v10)
    {
      BOOL v14 = 0;
      goto LABEL_6;
    }
    char v13 = v10[2](v10);
  }
  BOOL v14 = v13;
LABEL_6:

  return v14;
}

void __60__SNTestRunner_runTestRun_testName_options_fallingBackWith___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 56) testCoordinator];
    objc_msgSend(v2, "runTestWithContext:testName:testCoordinator:completion:", v3, v4);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 64);
    id v6 = [[SNTestFailure alloc] initWithMessage:@"Failed to rotate to expected orientation before running test case"];
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
}

@end