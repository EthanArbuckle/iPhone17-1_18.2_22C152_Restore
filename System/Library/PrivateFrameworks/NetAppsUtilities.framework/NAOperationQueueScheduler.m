@interface NAOperationQueueScheduler
@end

@implementation NAOperationQueueScheduler

uint64_t __53___NAOperationQueueScheduler_performCancelableBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __53___NAOperationQueueScheduler_performCancelableBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

uint64_t __54___NAOperationQueueScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    return [v3 performBlock:v4];
  }
  return result;
}

@end