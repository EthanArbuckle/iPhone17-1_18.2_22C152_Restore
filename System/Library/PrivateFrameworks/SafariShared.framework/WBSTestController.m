@interface WBSTestController
- (BOOL)isRunning;
- (NSArray)bundles;
- (NSString)bundleType;
- (NSURL)suiteURL;
- (WBSTestController)initWithSuiteURL:(id)a3 bundleNames:(id)a4;
- (id)bundleFromNSBundle:(id)a3;
- (void)_runTestsAndStoreResultsIn:(id)a3 completionBlock:(id)a4;
- (void)cleanBundle:(id)a3 completionHandler:(id)a4;
- (void)cleanSuiteWithCompletionHandler:(id)a3;
- (void)cleanTest:(id)a3 bundle:(id)a4 completionHandler:(id)a5;
- (void)prepareBundle:(id)a3 completionHandler:(id)a4;
- (void)prepareSuiteWithCompletionHandler:(id)a3;
- (void)prepareTest:(id)a3 bundle:(id)a4 completionHandler:(id)a5;
- (void)runTest:(id)a3 bundle:(id)a4 storeResultsIn:(id)a5 completionHandler:(id)a6;
- (void)runTestsAndStoreResultsIn:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSTestController

- (WBSTestController)initWithSuiteURL:(id)a3 bundleNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  result = (WBSTestController *)[MEMORY[0x1E4F97EA0] isInternalInstall];
  if (result)
  {
    v22.receiver = self;
    v22.super_class = (Class)WBSTestController;
    v9 = [(WBSTestController *)&v22 init];
    if (v9)
    {
      id v10 = [NSString stringWithFormat:@"com.apple.SafariShared.WBSTestController.%@.%p.internalQueue", objc_opt_class(), v9];
      dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
      internalQueue = v9->_internalQueue;
      v9->_internalQueue = (OS_dispatch_queue *)v11;

      if (v6)
      {
        v13 = (void *)[v7 copy];

        v14 = v9->_internalQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__WBSTestController_initWithSuiteURL_bundleNames___block_invoke;
        block[3] = &unk_1E5C8CD20;
        id v7 = v13;
        id v19 = v7;
        id v20 = v6;
        v15 = v9;
        v21 = v15;
        dispatch_async(v14, block);
        v16 = v15;
      }
      else
      {
        v17 = v9;
      }
    }

    return v9;
  }
  else
  {
    __break(0xC471u);
  }
  return result;
}

void __50__WBSTestController_initWithSuiteURL_bundleNames___block_invoke(id *a1)
{
  if ([a1[4] count])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__WBSTestController_initWithSuiteURL_bundleNames___block_invoke_2;
    v13[3] = &unk_1E5CA04E8;
    id v2 = a1[4];
    id v14 = a1[5];
    v3 = objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", v13);
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F28B50];
    id v5 = a1[5];
    id v6 = [a1[6] bundleType];
    id v7 = objc_msgSend(v4, "safari_bundlesFromDirectory:bundleType:", v5, v6);

    v3 = [v7 sortedArrayUsingComparator:&__block_literal_global_109];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__WBSTestController_initWithSuiteURL_bundleNames___block_invoke_4;
  v11[3] = &unk_1E5CA0530;
  id v12 = a1[6];
  uint64_t v8 = objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", v11);
  v9 = a1[6];
  id v10 = (void *)v9[2];
  v9[2] = v8;
}

id __50__WBSTestController_initWithSuiteURL_bundleNames___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F28B50];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [*(id *)(a1 + 32) URLByAppendingPathComponent:v4 isDirectory:1];

  id v7 = (void *)[v5 initWithURL:v6];
  return v7;
}

uint64_t __50__WBSTestController_initWithSuiteURL_bundleNames___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 bundleURL];
  id v6 = [v5 lastPathComponent];
  id v7 = [v4 bundleURL];

  uint64_t v8 = [v7 lastPathComponent];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __50__WBSTestController_initWithSuiteURL_bundleNames___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) bundleFromNSBundle:a2];
}

- (void)_runTestsAndStoreResultsIn:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke;
  v10[3] = &unk_1E5CA0648;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  [(WBSTestController *)self prepareSuiteWithCompletionHandler:v10];
}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) reportError:a2 forStage:0 forTest:0 inBundle:0];
    v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(v4 + 8);
    id v5 = *(void **)(v4 + 16);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_2;
    v14[3] = &unk_1E5CA0620;
    v14[4] = v4;
    id v15 = *(id *)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_10;
    v10[3] = &unk_1E5C8C8F8;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(a1 + 48);
    id v11 = v7;
    uint64_t v12 = v8;
    id v13 = v9;
    objc_msgSend(v5, "safari_enumerateAsynchronouslyOnQueue:enumerationBlock:completionBlock:", v6, v14, v10);
  }
}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_3;
  v11[3] = &unk_1E5C9FF10;
  uint64_t v8 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 prepareBundle:v10 completionHandler:v11];
}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) reportError:v3 forStage:0 forTest:0 inBundle:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    char v19 = 0;
    uint64_t v4 = [*(id *)(a1 + 40) allTests];
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(v5 + 8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_4;
    v14[3] = &unk_1E5CA05A8;
    v14[4] = v5;
    id v15 = *(id *)(a1 + 40);
    v17 = v18;
    id v16 = *(id *)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_8;
    v9[3] = &unk_1E5CA05F8;
    int8x16_t v8 = *(int8x16_t *)(a1 + 40);
    id v7 = (id)v8.i64[0];
    int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
    id v11 = *(id *)(a1 + 32);
    id v13 = v18;
    id v12 = *(id *)(a1 + 56);
    objc_msgSend(v4, "safari_enumerateAsynchronouslyOnQueue:enumerationBlock:completionBlock:", v6, v14, v9);

    _Block_object_dispose(v18, 8);
  }
}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_4(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  int8x16_t v8 = (void *)a1[4];
  uint64_t v9 = a1[5];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_5;
  v15[3] = &unk_1E5CA0580;
  int8x16_t v10 = (void *)a1[6];
  uint64_t v21 = a1[7];
  id v16 = v10;
  id v17 = v6;
  id v11 = (id)a1[5];
  uint64_t v12 = a1[4];
  id v18 = v11;
  uint64_t v19 = v12;
  id v20 = v7;
  id v13 = v7;
  id v14 = v6;
  [v8 prepareTest:v14 bundle:v9 completionHandler:v15];
}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    [*(id *)(a1 + 32) reportError:a2 forStage:0 forTest:*(void *)(a1 + 40) inBundle:*(void *)(a1 + 48)];
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    [*(id *)(a1 + 32) beginTest:*(void *)(a1 + 40) inBundle:*(void *)(a1 + 48)];
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v4 = *(void **)(a1 + 56);
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_6;
    v9[3] = &unk_1E5CA0580;
    uint64_t v15 = *(void *)(a1 + 72);
    id v10 = v6;
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 56);
    id v14 = v8;
    [v4 runTest:v7 bundle:v5 storeResultsIn:v10 completionHandler:v9];
  }
}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    [*(id *)(a1 + 32) reportError:a2 forStage:0 forTest:*(void *)(a1 + 40) inBundle:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) endTest:*(void *)(a1 + 40) inBundle:*(void *)(a1 + 48)];
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v4 = *(void **)(a1 + 56);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_7;
    v7[3] = &unk_1E5CA0558;
    uint64_t v12 = *(void *)(a1 + 72);
    uint64_t v6 = *(void *)(a1 + 40);
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 64);
    [v4 cleanTest:v6 bundle:v5 completionHandler:v7];
  }
}

uint64_t __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_7(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    [*(id *)(a1 + 32) reportError:a2 forStage:0 forTest:*(void *)(a1 + 40) inBundle:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 32) endTest:*(void *)(a1 + 40) inBundle:*(void *)(a1 + 48)];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v3();
}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_9;
  v6[3] = &unk_1E5CA05D0;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v5;
  long long v9 = v5;
  [v2 cleanBundle:v3 completionHandler:v6];
}

uint64_t __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_9(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) reportError:a2 forStage:0 forTest:0 inBundle:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_10(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_11;
  v4[3] = &unk_1E5C8C8F8;
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  id v2 = (id)v3.i64[0];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  id v6 = *(id *)(a1 + 48);
  [v2 flushWithCompletionHandler:v4];
}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_11(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_12;
  v3[3] = &unk_1E5C8DC00;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 cleanSuiteWithCompletionHandler:v3];
}

uint64_t __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_12(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) reportError:a2 forStage:0 forTest:0 inBundle:0];
  }
  int8x16_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)runTestsAndStoreResultsIn:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke;
  block[3] = &unk_1E5C9C2B8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(internalQueue, block);
}

void __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 24))
  {
    int8x16_t v3 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke_cold_1(v3);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    *(unsigned char *)(v2 + 24) = 1;
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke_10;
    v6[3] = &unk_1E5C8CDF0;
    void v6[4] = v4;
    id v7 = *(id *)(a1 + 48);
    [v4 _runTestsAndStoreResultsIn:v5 completionBlock:v6];
  }
}

void __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke_10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke_2;
  v3[3] = &unk_1E5C8CDF0;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSArray)bundles
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__35;
  id v10 = __Block_byref_object_dispose__35;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__WBSTestController_bundles__block_invoke;
  v5[3] = &unk_1E5C8CF00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __28__WBSTestController_bundles__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)bundleType
{
  return 0;
}

- (id)bundleFromNSBundle:(id)a3
{
  return 0;
}

- (void)prepareSuiteWithCompletionHandler:(id)a3
{
}

- (void)cleanSuiteWithCompletionHandler:(id)a3
{
}

- (void)prepareBundle:(id)a3 completionHandler:(id)a4
{
}

- (void)cleanBundle:(id)a3 completionHandler:(id)a4
{
}

- (void)prepareTest:(id)a3 bundle:(id)a4 completionHandler:(id)a5
{
}

- (void)runTest:(id)a3 bundle:(id)a4 storeResultsIn:(id)a5 completionHandler:(id)a6
{
}

- (void)cleanTest:(id)a3 bundle:(id)a4 completionHandler:(id)a5
{
}

- (NSURL)suiteURL
{
  return self->_suiteURL;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suiteURL, 0);
  objc_storeStrong((id *)&self->_testBundles, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_FAULT, "Test suite is already running", v1, 2u);
}

@end