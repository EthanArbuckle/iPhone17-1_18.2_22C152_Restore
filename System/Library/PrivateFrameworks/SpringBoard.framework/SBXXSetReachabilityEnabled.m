@interface SBXXSetReachabilityEnabled
@end

@implementation SBXXSetReachabilityEnabled

void ___SBXXSetReachabilityEnabled_block_invoke(uint64_t a1)
{
  id v2 = +[SBReachabilityManager sharedInstance];
  [v2 setReachabilityEnabled:*(unsigned char *)(a1 + 32) != 0];
}

@end