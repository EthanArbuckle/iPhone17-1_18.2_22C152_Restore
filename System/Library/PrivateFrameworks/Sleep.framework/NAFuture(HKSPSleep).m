@interface NAFuture(HKSPSleep)
+ (id)_hksp_chainFutureHelperWithFutures:()HKSPSleep index:block:ignoreErrors:;
+ (id)hksp_chainFutures:()HKSPSleep returningFirstPassingTest:ignoreErrors:;
+ (id)hksp_expiringFutureWithTimeout:()HKSPSleep;
+ (uint64_t)hksp_chainFutures:()HKSPSleep returningFirstPassingTest:;
- (id)hksp_BOOLErrorCompletionHandlerAdapter;
@end

@implementation NAFuture(HKSPSleep)

- (id)hksp_BOOLErrorCompletionHandlerAdapter
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__NAFuture_HKSPSleep__hksp_BOOLErrorCompletionHandlerAdapter__block_invoke;
  v3[3] = &unk_1E5D338C0;
  v3[4] = a1;
  v1 = (void *)MEMORY[0x1AD0DD220](v3);
  return v1;
}

+ (id)hksp_expiringFutureWithTimeout:()HKSPSleep
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  if (a1 > 0.0)
  {
    dispatch_time_t v3 = dispatch_time(0, (uint64_t)(a1 * 1000000000.0));
    v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__NAFuture_HKSPSleep__hksp_expiringFutureWithTimeout___block_invoke;
    block[3] = &unk_1E5D32170;
    id v7 = v2;
    dispatch_after(v3, v4, block);
  }
  return v2;
}

+ (uint64_t)hksp_chainFutures:()HKSPSleep returningFirstPassingTest:
{
  return objc_msgSend(a1, "hksp_chainFutures:returningFirstPassingTest:ignoreErrors:", a3, a4, 0);
}

+ (id)hksp_chainFutures:()HKSPSleep returningFirstPassingTest:ignoreErrors:
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count]) {
    objc_msgSend(a1, "_hksp_chainFutureHelperWithFutures:index:block:ignoreErrors:", v8, 0, v9, a5);
  }
  else {
  v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v10;
}

+ (id)_hksp_chainFutureHelperWithFutures:()HKSPSleep index:block:ignoreErrors:
{
  id v10 = a3;
  id v11 = a5;
  v12 = [v10 objectAtIndexedSubscript:a4];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __83__NAFuture_HKSPSleep___hksp_chainFutureHelperWithFutures_index_block_ignoreErrors___block_invoke;
  v28[3] = &unk_1E5D338E8;
  uint64_t v31 = a4;
  uint64_t v32 = a1;
  id v29 = v10;
  id v13 = v11;
  id v30 = v13;
  char v33 = a6;
  id v14 = v10;
  v15 = (void *)MEMORY[0x1AD0DD220](v28);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __83__NAFuture_HKSPSleep___hksp_chainFutureHelperWithFutures_index_block_ignoreErrors___block_invoke_2;
  v25[3] = &unk_1E5D33910;
  id v26 = v13;
  id v16 = v15;
  id v27 = v16;
  id v17 = v13;
  v18 = [v12 flatMap:v25];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __83__NAFuture_HKSPSleep___hksp_chainFutureHelperWithFutures_index_block_ignoreErrors___block_invoke_3;
  v22[3] = &unk_1E5D33938;
  char v24 = a6;
  id v23 = v16;
  id v19 = v16;
  v20 = [v18 recover:v22];

  return v20;
}

@end