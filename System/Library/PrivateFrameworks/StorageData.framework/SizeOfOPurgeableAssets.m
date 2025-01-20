@interface SizeOfOPurgeableAssets
@end

@implementation SizeOfOPurgeableAssets

uint64_t ___SizeOfOPurgeableAssets_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 size];
  if (v4 >= 1)
  {
    uint64_t v5 = v4;
    if ([v3 purgeabilityScoreAtUrgency:3]) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v5;
    }
  }

  return 1;
}

@end