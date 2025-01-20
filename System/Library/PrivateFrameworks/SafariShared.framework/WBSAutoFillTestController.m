@interface WBSAutoFillTestController
- (id)bundleType;
- (id)expectedResultsPathExtension;
- (unint64_t)pageTestType;
- (void)cleanSuiteWithCompletionHandler:(id)a3;
- (void)prepareSuiteWithCompletionHandler:(id)a3;
- (void)runTest:(id)a3 bundle:(id)a4 storeResultsIn:(id)a5 completionHandler:(id)a6;
- (void)runTest:(id)a3 bundle:(id)a4 storeResultsIn:(id)a5 tryCount:(unint64_t)a6 completionHandler:(id)a7;
@end

@implementation WBSAutoFillTestController

- (id)expectedResultsPathExtension
{
  return @"txt";
}

- (id)bundleType
{
  return @"autofilltest";
}

- (unint64_t)pageTestType
{
  return 1;
}

- (void)runTest:(id)a3 bundle:(id)a4 storeResultsIn:(id)a5 completionHandler:(id)a6
{
}

- (void)runTest:(id)a3 bundle:(id)a4 storeResultsIn:(id)a5 tryCount:(unint64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = v12;
  v17 = [(WBSPageTestController *)self delegate];
  if (v17)
  {
    [v16 viewportSize];
    double v19 = v18;
    double v21 = v20;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke;
    v22[3] = &unk_1E5C8C570;
    id v29 = v15;
    id v23 = v17;
    v24 = self;
    id v25 = v16;
    id v26 = v13;
    id v27 = v25;
    unint64_t v30 = a6;
    id v28 = v14;
    objc_msgSend(v23, "pageTestController:resizeViewport:completionHandler:", self, v22, v19, v21);
  }
  else
  {
    (*((void (**)(id, void))v15 + 2))(v15, 0);
  }
}

void __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
    v3();
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = [*(id *)(a1 + 48) pageURL];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_2;
    v9[3] = &unk_1E5C8C548;
    id v10 = *(id *)(a1 + 56);
    id v7 = *(id *)(a1 + 64);
    uint64_t v16 = *(void *)(a1 + 88);
    uint64_t v8 = *(void *)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    id v13 = *(id *)(a1 + 72);
    id v15 = *(id *)(a1 + 80);
    id v14 = *(id *)(a1 + 48);
    [v4 pageTestController:v5 navigateAndCaptureFormsMetadataForURL:v6 completionHandler:v9];
  }
}

void __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6) {
    goto LABEL_9;
  }
  id v7 = WBS_LOG_CHANNEL_PREFIXTest();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_2_cold_2(a1, v7, (uint64_t)v6);
  }
  unint64_t v8 = *(void *)(a1 + 80);
  v9 = WBS_LOG_CHANNEL_PREFIXTest();
  id v10 = v9;
  if (v8 <= 2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = v10;
      id v13 = [v11 identifier];
      id v14 = [*(id *)(a1 + 40) identifier];
      *(_DWORD *)buf = 138543618;
      v69 = v13;
      __int16 v70 = 2114;
      v71 = v14;
      _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_DEFAULT, "Error has been detected for test %{public}@/%{public}@. Retrying.", buf, 0x16u);
    }
    dispatch_time_t v15 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_7;
    block[3] = &unk_1E5C8C520;
    int8x16_t v49 = *(int8x16_t *)(a1 + 40);
    id v16 = (id)v49.i64[0];
    int8x16_t v61 = vextq_s8(v49, v49, 8uLL);
    id v62 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 56);
    double v19 = *(void **)(a1 + 72);
    uint64_t v18 = *(void *)(a1 + 80);
    id v63 = v17;
    uint64_t v65 = v18;
    id v64 = v19;
    dispatch_after(v15, MEMORY[0x1E4F14428], block);

    goto LABEL_21;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_2_cold_1(a1, v10);
    if (!v5) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_9:
    if (!v5) {
      goto LABEL_18;
    }
  }
  id v20 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  double v21 = [*(id *)(a1 + 64) expectedResultsURL];
  id v59 = 0;
  v22 = (void *)[v20 initWithContentsOfURL:v21 options:1 error:&v59];
  id v23 = v59;

  if (v23) {
    [*(id *)(a1 + 56) reportError:v23 forStage:@"AutoFill" forTest:*(void *)(a1 + 64) inBundle:*(void *)(a1 + 32)];
  }
  v24 = +[WBSFormAutoFillTestSupport stringRepresentationFromMetadataProvider:v5];
  id v25 = (void *)[[NSString alloc] initWithData:v22 encoding:4];
  uint64_t v26 = [v25 isEqualToString:v24];
  if ((v26 & 1) == 0 && *(void *)(a1 + 80) <= 2uLL)
  {
    id v27 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v50 = v25;
      id v28 = *(void **)(a1 + 32);
      id v29 = v27;
      unint64_t v30 = [v28 identifier];
      v31 = [*(id *)(a1 + 40) identifier];
      *(_DWORD *)buf = 138543618;
      v69 = v30;
      __int16 v70 = 2114;
      v71 = v31;
      _os_log_impl(&dword_1A6B5F000, v29, OS_LOG_TYPE_DEFAULT, "Test %{public}@/%{public}@ expected and actual results differed. Retrying.", buf, 0x16u);

      id v25 = v50;
    }
    dispatch_time_t v32 = dispatch_time(0, 2000000000);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_11;
    v53[3] = &unk_1E5C8C520;
    int8x16_t v51 = *(int8x16_t *)(a1 + 40);
    id v33 = (id)v51.i64[0];
    int8x16_t v54 = vextq_s8(v51, v51, 8uLL);
    id v55 = *(id *)(a1 + 32);
    id v34 = *(id *)(a1 + 56);
    v36 = *(void **)(a1 + 72);
    uint64_t v35 = *(void *)(a1 + 80);
    id v56 = v34;
    uint64_t v58 = v35;
    id v57 = v36;
    dispatch_after(v32, MEMORY[0x1E4F14428], v53);

    goto LABEL_21;
  }
  v52 = v25;
  v37 = *(void **)(a1 + 56);
  v38 = [v24 dataUsingEncoding:4];
  [*(id *)(a1 + 64) expectedResultsURL];
  v39 = v48 = v23;
  [v39 lastPathComponent];
  v47 = v24;
  v41 = id v40 = v5;
  [(id)*MEMORY[0x1E4F44470] identifier];
  v43 = v42 = v22;
  objc_msgSend(v37, "reportActualResults:expectedResults:expectedResultsName:uniformTypeIdentifier:forStage:forTest:inBundle:", v38, v42, v41, v43, *(void *)(a1 + 32));

  v44 = *(void **)(a1 + 56);
  v66 = @"overall";
  v45 = [NSNumber numberWithInt:v26];
  v67 = v45;
  v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
  [v44 reportPerformance:v46 forStage:@"AutoFill" forTest:*(void *)(a1 + 64) inBundle:*(void *)(a1 + 32)];

  id v5 = v40;
LABEL_18:
  if (v6) {
    [*(id *)(a1 + 56) reportError:v6 forStage:@"AutoFill" forTest:*(void *)(a1 + 64) inBundle:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_21:
}

uint64_t __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) runTest:*(void *)(a1 + 40) bundle:*(void *)(a1 + 48) storeResultsIn:*(void *)(a1 + 56) tryCount:*(void *)(a1 + 72) + 1 completionHandler:*(void *)(a1 + 64)];
}

uint64_t __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) runTest:*(void *)(a1 + 40) bundle:*(void *)(a1 + 48) storeResultsIn:*(void *)(a1 + 56) tryCount:*(void *)(a1 + 72) + 1 completionHandler:*(void *)(a1 + 64)];
}

- (void)prepareSuiteWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  id v5 = [(WBSPageTestController *)self delegate];
  id v6 = v5;
  if (v5) {
    [v5 pageTestControllerInitializeApp:self completionHandler:v4];
  }
  else {
    v4[2](v4, 0);
  }
}

- (void)cleanSuiteWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  v4 = [(WBSPageTestController *)self delegate];
  [v4 pageTestControllerTerminateApp:self];

  v5[2](v5, 0);
}

void __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  id v5 = [v3 identifier];
  id v6 = [*(id *)(a1 + 40) identifier];
  int v7 = 138543618;
  unint64_t v8 = v5;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_ERROR, "Too many consecutive errors for test %{public}@/%{public}@. Failing.", (uint8_t *)&v7, 0x16u);
}

void __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_2_cold_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  int v7 = [v5 identifier];
  unint64_t v8 = [*(id *)(a1 + 40) identifier];
  int v9 = 138543874;
  id v10 = v7;
  __int16 v11 = 2114;
  uint64_t v12 = v8;
  __int16 v13 = 2114;
  uint64_t v14 = a3;
  _os_log_error_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_ERROR, "Test %{public}@/%{public}@ reported error: %{public}@", (uint8_t *)&v9, 0x20u);
}

@end