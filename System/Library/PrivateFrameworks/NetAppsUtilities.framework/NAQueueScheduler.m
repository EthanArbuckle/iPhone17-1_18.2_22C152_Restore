@interface NAQueueScheduler
@end

@implementation NAQueueScheduler

uint64_t __44___NAQueueScheduler_performCancelableBlock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void __45___NAQueueScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);
  dispatch_source_cancel(v2);
}

void __45___NAQueueScheduler_afterDelay_performBlock___block_invoke_2(uint64_t a1)
{
}

@end