@interface MRCreatePlaybackQueueForRequest
@end

@implementation MRCreatePlaybackQueueForRequest

void ___onQueue_MRCreatePlaybackQueueForRequest_block_invoke(uint64_t a1)
{
  v6 = [*(id *)(a1 + 32) block];
  v2 = (void *)v6[2](v6, *(void *)(a1 + 40));
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

@end