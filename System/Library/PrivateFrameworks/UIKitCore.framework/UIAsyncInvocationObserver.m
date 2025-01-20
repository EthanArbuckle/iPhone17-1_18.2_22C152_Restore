@interface UIAsyncInvocationObserver
@end

@implementation UIAsyncInvocationObserver

void __52___UIAsyncInvocationObserver__didCompleteInvocation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 25))
  {
    *(unsigned char *)(v1 + 25) = 1;
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v2 + 24))
    {
      v3 = *(NSObject **)(v2 + 8);
      if (v3) {
        dispatch_resume(v3);
      }
    }
  }
}

void __45___UIAsyncInvocationObserver_whenCompleteDo___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 8))
  {
    dispatch_queue_t v3 = dispatch_queue_create("Async Observer", 0);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(unsigned char *)(v2 + 24) && !*(unsigned char *)(v2 + 25))
  {
    *(unsigned char *)(v2 + 24) = 1;
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  v6 = *(NSObject **)(v2 + 8);
  v7 = *(void **)(a1 + 40);
  dispatch_async(v6, v7);
}

intptr_t __69___UIAsyncInvocationObserver_whenInvocationsCompleteForObservers_do___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __69___UIAsyncInvocationObserver_whenInvocationsCompleteForObservers_do___block_invoke_2(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  if ([v3 count])
  {
    unint64_t v2 = 0;
    do
    {
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
      ++v2;
    }
    while ([v3 count] > v2);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end