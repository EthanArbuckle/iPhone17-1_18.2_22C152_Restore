@interface UIViewServiceReplyAwaitingTrampoline
@end

@implementation UIViewServiceReplyAwaitingTrampoline

void __59___UIViewServiceReplyAwaitingTrampoline_forwardInvocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 retainArguments];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end