@interface SBXXGetApplicationNetworkFlags
@end

@implementation SBXXGetApplicationNetworkFlags

uint64_t ___SBXXGetApplicationNetworkFlags_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dataUsage];
  **(unsigned char **)(a1 + 40) = result & 1;
  **(unsigned char **)(a1 + 48) = result & 2;
  return result;
}

@end