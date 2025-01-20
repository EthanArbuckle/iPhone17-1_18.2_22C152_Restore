@interface MRCreatePlaybackQueueForOffset
@end

@implementation MRCreatePlaybackQueueForOffset

void ___onQueue_MRCreatePlaybackQueueForOffset_block_invoke(uint64_t a1)
{
  v6 = [*(id *)(a1 + 32) block];
  v2 = (void *)v6[2](v6, *(void *)(a1 + 48));
  if (v2)
  {
    uint64_t v3 = _onClientQueue_MRCreatePlaybackQueueForOffset(*(void *)(a1 + 56), *(void *)(a1 + 64), v6);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

@end