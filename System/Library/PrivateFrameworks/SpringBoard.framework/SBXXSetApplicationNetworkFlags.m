@interface SBXXSetApplicationNetworkFlags
@end

@implementation SBXXSetApplicationNetworkFlags

uint64_t ___SBXXSetApplicationNetworkFlags_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUsesEdgeNetwork:*(unsigned char *)(a1 + 40) != 0];
  v2 = *(void **)(a1 + 32);
  BOOL v3 = *(unsigned char *)(a1 + 41) != 0;
  return [v2 setUsesWiFiNetwork:v3];
}

@end