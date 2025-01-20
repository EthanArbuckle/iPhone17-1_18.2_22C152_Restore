@interface MRCreatePlaybackQueueForIdentifier
@end

@implementation MRCreatePlaybackQueueForIdentifier

void ___onQueue_MRCreatePlaybackQueueForIdentifier_block_invoke(uint64_t a1)
{
  v2 = (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    id v5 = v2;
    SkeletonFrom = (void *)MRContentItemCreateSkeletonFrom(v2);
    [v3 addObject:SkeletonFrom];

    v2 = v5;
  }
}

@end