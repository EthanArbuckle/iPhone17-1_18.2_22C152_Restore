@interface NAFuture
@end

@implementation NAFuture

void __61__NAFuture_HKSPSleep__hksp_BOOLErrorCompletionHandlerAdapter__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  id v8 = v5;
  if (a2)
  {
    v7 = NAEmptyResult();
    [v6 finishWithResult:v7];
  }
  else
  {
    if (v5)
    {
      [v6 finishWithError:v5];
      goto LABEL_7;
    }
    v7 = objc_msgSend(MEMORY[0x1E4F28C58], "na_genericError");
    [v6 finishWithError:v7];
  }

LABEL_7:
}

void __54__NAFuture_HKSPSleep__hksp_expiringFutureWithTimeout___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F28C58], "na_timeoutError");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 finishWithError:v3];
  }
}

id __83__NAFuture_HKSPSleep___hksp_chainFutureHelperWithFutures_index_block_ignoreErrors___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48) + 1;
  if (v2 == [*(id *)(a1 + 32) count]) {
    [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else {
  id v3 = objc_msgSend(*(id *)(a1 + 56), "_hksp_chainFutureHelperWithFutures:index:block:ignoreErrors:", *(void *)(a1 + 32), v2, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  }
  return v3;
}

id __83__NAFuture_HKSPSleep___hksp_chainFutureHelperWithFutures_index_block_ignoreErrors___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    [MEMORY[0x1E4F7A0D8] futureWithResult:v3];
  }
  else {
  v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v4;
}

id __83__NAFuture_HKSPSleep___hksp_chainFutureHelperWithFutures_index_block_ignoreErrors___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
  uint64_t v2 = [MEMORY[0x1E4F7A0D8] futureWithError:a2];
  }
  return v2;
}

@end