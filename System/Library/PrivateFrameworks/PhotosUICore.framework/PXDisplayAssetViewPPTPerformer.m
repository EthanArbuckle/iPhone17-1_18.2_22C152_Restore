@interface PXDisplayAssetViewPPTPerformer
- (NSDictionary)testOptions;
- (NSString)testName;
- (PXAnonymousView)containerView;
- (PXDisplayAssetViewPPTPerformer)init;
- (PXDisplayAssetViewPPTPerformer)initWithContainerView:(id)a3 delegate:(id)a4 testOptions:(id)a5;
- (PXPPTDelegate)delegate;
- (int64_t)testIterations;
- (void)_createAssetViewWithConfiguration:(id)a3 resultHandler:(id)a4;
- (void)_runScrubbingSubtestWithAssetView:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
- (void)_runSubtestWithName:(id)a3 metrics:(id)a4 configuration:(id)a5 usingBlock:(id)a6 completionHandler:(id)a7;
- (void)_runTestUsingBlock:(id)a3 completionHandler:(id)a4;
- (void)_tearDownAssetView:(id)a3 completionHandler:(id)a4;
- (void)runLocalizedTitleTestWithConfigurations:(id)a3 completionHandler:(id)a4;
- (void)runScrubbingTestWithConfigurations:(id)a3 completionHandler:(id)a4;
@end

@implementation PXDisplayAssetViewPPTPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_testOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerView, 0);
}

- (int64_t)testIterations
{
  return self->_testIterations;
}

- (NSString)testName
{
  return self->_testName;
}

- (NSDictionary)testOptions
{
  return self->_testOptions;
}

- (PXPPTDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPPTDelegate *)WeakRetained;
}

- (PXAnonymousView)containerView
{
  return self->_containerView;
}

- (void)_tearDownAssetView:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(id, uint64_t, void))a4;
  [a3 removeFromSuperview];
  v5[2](v5, 1, 0);
}

- (void)_createAssetViewWithConfiguration:(id)a3 resultHandler:(id)a4
{
  v6 = (void (**)(id, id, void))a4;
  v7 = [a3 assetViewFactory];
  v7[2]();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = [(PXDisplayAssetViewPPTPerformer *)self containerView];
  [v8 bounds];
  objc_msgSend(v9, "setFrame:");
  [v8 addSubview:v9];
  v6[2](v6, v9, 0);
}

- (void)_runSubtestWithName:(id)a3 metrics:(id)a4 configuration:(id)a5 usingBlock:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  v13 = a6;
  id v14 = a4;
  v15 = [(PXDisplayAssetViewPPTPerformer *)self delegate];
  v16 = [(PXDisplayAssetViewPPTPerformer *)self testName];
  id v17 = v11;
  [v15 startedSubTest:v17 forTest:v16 withMetrics:v14];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __105__PXDisplayAssetViewPPTPerformer__runSubtestWithName_metrics_configuration_usingBlock_completionHandler___block_invoke;
  v23[3] = &unk_1E5DD1B28;
  id v24 = v15;
  id v25 = v17;
  id v26 = v16;
  id v27 = v12;
  v18 = (void (*)(void *, void *))v13[2];
  id v19 = v12;
  id v20 = v16;
  id v21 = v17;
  id v22 = v15;
  v18(v13, v23);
}

void __105__PXDisplayAssetViewPPTPerformer__runSubtestWithName_metrics_configuration_usingBlock_completionHandler___block_invoke(void *a1, int a2, void *a3)
{
  v4 = (void *)a1[4];
  if (a2)
  {
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    id v7 = a3;
    [v4 finishedSubTest:v5 forTest:v6];
  }
  else
  {
    [v4 failedTest:a1[6], @"test %@ subtest %@ failed with error: %@", a1[6], a1[5], a3 withFailureFormat];
  }
  (*(void (**)(void))(a1[7] + 16))();
}

- (void)_runTestUsingBlock:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PXDisplayAssetViewPPTPerformer *)self delegate];
  id v9 = [(PXDisplayAssetViewPPTPerformer *)self testName];
  [v8 startedTest:v9];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__PXDisplayAssetViewPPTPerformer__runTestUsingBlock_completionHandler___block_invoke;
  v14[3] = &unk_1E5DD1B00;
  id v15 = v8;
  id v16 = v9;
  id v17 = v6;
  v10 = (void (*)(void *, void *))v7[2];
  id v11 = v6;
  id v12 = v9;
  id v13 = v8;
  v10(v7, v14);
}

void __71__PXDisplayAssetViewPPTPerformer__runTestUsingBlock_completionHandler___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  id v7 = a3;
  id v8 = v7;
  if (a2) {
    [v5 finishedTest:v6];
  }
  else {
    [v5 failedTest:v6, @"test %@ failed with error: %@", v6, v7 withFailureFormat];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_runScrubbingSubtestWithAssetView:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 assets];
  if ([v11 count] > 4)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    char v15 = 1;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__293057;
    id v19 = __Block_byref_object_dispose__293058;
    uint64_t v20 = 0;
    [(PXDisplayAssetViewPPTPerformer *)self testIterations];
    v11;
    v9;
    v8;
    v10;
    PXIterateAsynchronously();
  }
  id v12 = PLOneUpGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = [v9 label];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "not enough assets for scrubbing subtest %@", (uint8_t *)&buf, 0xCu);
  }
  (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
}

void __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v3, "index") % *(void *)(a1 + 80));
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5DD1A88;
  id v13 = *(id *)(a1 + 56);
  id v14 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke_4;
  v9[3] = &unk_1E5DD1AB0;
  id v10 = v3;
  long long v11 = *(_OWORD *)(a1 + 64);
  id v7 = v3;
  id v8 = v4;
  [v5 _runSubtestWithName:@"Scrub-Latency" metrics:&unk_1F02D5680 configuration:v6 usingBlock:v12 completionHandler:v9];
}

uint64_t __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

void __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setAsset:*(void *)(a1 + 40)];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke_3;
  block[3] = &unk_1E5DD3128;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) next];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    [*(id *)(a1 + 32) stop];
  }
}

uint64_t __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runLocalizedTitleTestWithConfigurations:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXDisplayAssetViewPPTPerformer.m", 98, @"Invalid parameter not satisfying: %@", @"configurations != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXDisplayAssetViewPPTPerformer.m", 99, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__PXDisplayAssetViewPPTPerformer_runLocalizedTitleTestWithConfigurations_completionHandler___block_invoke;
  v13[3] = &unk_1E5DD1A88;
  id v14 = v7;
  char v15 = self;
  id v10 = v7;
  [(PXDisplayAssetViewPPTPerformer *)self _runTestUsingBlock:v13 completionHandler:v9];
}

void __92__PXDisplayAssetViewPPTPerformer_runLocalizedTitleTestWithConfigurations_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 1;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__293057;
  v29 = __Block_byref_object_dispose__293058;
  id v30 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v15 = [obj countByEnumeratingWithState:&v21 objects:v37 count:16];
  if (v15)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v4 = [v3 assets];
        for (uint64_t j = 0; j < [*(id *)(a1 + 40) testIterations]; ++j)
        {
          uint64_t v5 = [v4 count];
          if (v5 >= 5) {
            goto LABEL_12;
          }
          id v6 = PLOneUpGetLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            id v7 = [v3 label];
            *(_DWORD *)long long buf = 138412290;
            v36 = v7;
            _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "not enough assets for localized title subtest %@", buf, 0xCu);
          }
          if (v5 > 0)
          {
LABEL_12:
            for (uint64_t k = 0; k != v5; ++k)
            {
              id v9 = [v4 objectAtIndexedSubscript:k];
              id v10 = *(void **)(a1 + 40);
              v19[0] = MEMORY[0x1E4F143A8];
              v19[1] = 3221225472;
              v19[2] = __92__PXDisplayAssetViewPPTPerformer_runLocalizedTitleTestWithConfigurations_completionHandler___block_invoke_49;
              v19[3] = &unk_1E5DD1A38;
              id v11 = v9;
              id v20 = v11;
              v18[0] = MEMORY[0x1E4F143A8];
              v18[1] = 3221225472;
              v18[2] = __92__PXDisplayAssetViewPPTPerformer_runLocalizedTitleTestWithConfigurations_completionHandler___block_invoke_2;
              v18[3] = &unk_1E5DD1A60;
              v18[4] = &v31;
              v18[5] = &v25;
              [v10 _runSubtestWithName:@"Title-Latency" metrics:&unk_1F02D5668 configuration:v3 usingBlock:v19 completionHandler:v18];
            }
          }
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v21 objects:v37 count:16];
    }
    while (v15);
  }

  v12[2](v12, *((unsigned __int8 *)v32 + 24), v26[5]);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

void __92__PXDisplayAssetViewPPTPerformer_runLocalizedTitleTestWithConfigurations_completionHandler___block_invoke_49(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = +[PXDisplayAssetView localizedTitleForAsset:v2];
  v3[2](v3, 1, 0);
}

void __92__PXDisplayAssetViewPPTPerformer_runLocalizedTitleTestWithConfigurations_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

- (void)runScrubbingTestWithConfigurations:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXDisplayAssetViewPPTPerformer.m", 54, @"Invalid parameter not satisfying: %@", @"configurations != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXDisplayAssetViewPPTPerformer.m", 55, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke;
  v13[3] = &unk_1E5DD1A10;
  id v14 = v7;
  uint64_t v15 = self;
  SEL v16 = a2;
  id v10 = v7;
  [(PXDisplayAssetViewPPTPerformer *)self _runTestUsingBlock:v13 completionHandler:v9];
}

void __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char v6 = 1;
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__293057;
  v4[4] = __Block_byref_object_dispose__293058;
  v4[5] = 0;
  [*(id *)(a1 + 32) count];
  *(id *)(a1 + 32);
  v3;
  PXIterateAsynchronously();
}

void __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "index"));
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__293057;
  v18[4] = __Block_byref_object_dispose__293058;
  id v19 = 0;
  uint64_t v5 = *(void **)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5DD1920;
  v15[4] = v5;
  id v16 = v4;
  uint64_t v17 = v18;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_4;
  v9[3] = &unk_1E5DD1998;
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 40);
  id v12 = v18;
  void v9[4] = v6;
  id v7 = v16;
  id v10 = v7;
  id v8 = v3;
  id v11 = v8;
  long long v13 = *(_OWORD *)(a1 + 48);
  [v5 _runSubtestWithName:@"ViewCreation" metrics:&unk_1F02D5650 configuration:v7 usingBlock:v15 completionHandler:v9];

  _Block_object_dispose(v18, 8);
}

uint64_t __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_7(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

void __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_3;
  v8[3] = &unk_1E5DD18F8;
  uint64_t v6 = a1[6];
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  [v4 _createAssetViewWithConfiguration:v5 resultHandler:v8];
}

void __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(*(void *)(v7 + 8) + 40);
    if (!v8)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"PXDisplayAssetViewPPTPerformer.m", 73, @"Invalid parameter not satisfying: %@", @"assetView != nil" object file lineNumber description];

      uint64_t v7 = *(void *)(a1 + 56);
      uint64_t v8 = *(void *)(*(void *)(v7 + 8) + 40);
    }
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_5;
    v12[3] = &unk_1E5DD1970;
    void v12[4] = v9;
    uint64_t v14 = v7;
    id v13 = *(id *)(a1 + 48);
    long long v15 = *(_OWORD *)(a1 + 64);
    [v9 _runScrubbingSubtestWithAssetView:v8 configuration:v10 completionHandler:v12];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
    [*(id *)(a1 + 48) stop];
  }
}

void __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_6;
  v10[3] = &unk_1E5DD1948;
  char v14 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  long long v13 = *(_OWORD *)(a1 + 56);
  id v11 = v8;
  id v12 = v5;
  id v9 = v5;
  [v7 _tearDownAssetView:v6 completionHandler:v10];
}

void __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_6(uint64_t a1, int a2, void *a3)
{
  if (*(unsigned char *)(a1 + 64)) {
    BOOL v4 = a2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    if (*(void *)(a1 + 40)) {
      id v5 = *(void **)(a1 + 40);
    }
    else {
      id v5 = a3;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v5);
    id v6 = a3;
    [*(id *)(a1 + 32) stop];
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = a3;
    [v7 next];
  }
}

void __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PXDisplayAssetViewPPTPerformer)initWithContainerView:(id)a3 delegate:(id)a4 testOptions:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_11:
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PXDisplayAssetViewPPTPerformer.m", 39, @"Invalid parameter not satisfying: %@", @"delegate != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PXDisplayAssetViewPPTPerformer.m", 38, @"Invalid parameter not satisfying: %@", @"containerView != nil" object file lineNumber description];

  if (!v11) {
    goto LABEL_11;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_12:
  long long v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"PXDisplayAssetViewPPTPerformer.m", 40, @"Invalid parameter not satisfying: %@", @"testOptions != nil" object file lineNumber description];

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)PXDisplayAssetViewPPTPerformer;
  long long v13 = [(PXDisplayAssetViewPPTPerformer *)&v25 init];
  char v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_containerView, a3);
    objc_storeWeak((id *)&v14->_delegate, v11);
    objc_storeStrong((id *)&v14->_testOptions, a5);
    uint64_t v15 = [(NSDictionary *)v14->_testOptions objectForKeyedSubscript:@"testName"];
    testName = v14->_testName;
    v14->_testName = (NSString *)v15;

    uint64_t v17 = [(PXDisplayAssetViewPPTPerformer *)v14 testOptions];
    v18 = [v17 objectForKeyedSubscript:@"iterations"];
    uint64_t v19 = [v18 integerValue];

    if (v19 <= 1) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = v19;
    }
    v14->_testIterations = v20;
  }

  return v14;
}

- (PXDisplayAssetViewPPTPerformer)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDisplayAssetViewPPTPerformer.m", 34, @"%s is not available as initializer", "-[PXDisplayAssetViewPPTPerformer init]");

  abort();
}

@end