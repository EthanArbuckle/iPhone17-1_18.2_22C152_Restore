@interface SBXXDimScreen
@end

@implementation SBXXDimScreen

void ___SBXXDimScreen_block_invoke(uint64_t a1)
{
  id v2 = +[SBLockScreenManager sharedInstance];
  [v2 requestUserAttentionScreenWakeFromSource:19 reason:*(void *)(a1 + 32)];
}

@end