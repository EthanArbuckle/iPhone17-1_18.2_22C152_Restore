@interface SBXXGetRecentSleepsWakes
@end

@implementation SBXXGetRecentSleepsWakes

void ___SBXXGetRecentSleepsWakes_block_invoke(uint64_t a1)
{
  uint64_t v2 = _SBWorkspaceCopyRecentSleepsAndWakes();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end