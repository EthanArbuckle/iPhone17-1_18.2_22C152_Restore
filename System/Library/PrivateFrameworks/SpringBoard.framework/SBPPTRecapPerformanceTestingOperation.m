@interface SBPPTRecapPerformanceTestingOperation
+ (id)scrollViewRecapPerformanceTestOperationWithBlock:(id)a3;
@end

@implementation SBPPTRecapPerformanceTestingOperation

+ (id)scrollViewRecapPerformanceTestOperationWithBlock:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__SBPPTRecapPerformanceTestingOperation_scrollViewRecapPerformanceTestOperationWithBlock___block_invoke;
  v7[3] = &unk_1E6AFE608;
  id v8 = v3;
  id v4 = v3;
  v5 = +[SBPPTBlockOperation operationWithBlock:v7];
  [v5 setTimeoutInterval:60.0];

  return v5;
}

void __90__SBPPTRecapPerformanceTestingOperation_scrollViewRecapPerformanceTestOperationWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v5 = [v4 completionHandler];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __90__SBPPTRecapPerformanceTestingOperation_scrollViewRecapPerformanceTestOperationWithBlock___block_invoke_2;
  v11 = &unk_1E6AF6828;
  id v12 = v3;
  id v13 = v5;
  id v6 = v5;
  id v7 = v3;
  [v4 setCompletionHandler:&v8];
  objc_msgSend(MEMORY[0x1E4F94850], "runTestWithParameters:", v4, v8, v9, v10, v11);
}

uint64_t __90__SBPPTRecapPerformanceTestingOperation_scrollViewRecapPerformanceTestOperationWithBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) finish];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

@end