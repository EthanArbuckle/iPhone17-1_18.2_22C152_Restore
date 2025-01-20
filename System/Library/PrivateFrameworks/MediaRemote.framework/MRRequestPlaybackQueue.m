@interface MRRequestPlaybackQueue
@end

@implementation MRRequestPlaybackQueue

void ___MRRequestPlaybackQueue_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (!v5)
  {
    v6 = [*(id *)(a1 + 32) subscriptionController];
    [v6 subscribeToPlaybackQueue:v7 forRequest:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end