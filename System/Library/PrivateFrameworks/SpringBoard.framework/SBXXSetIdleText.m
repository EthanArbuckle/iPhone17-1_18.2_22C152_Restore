@interface SBXXSetIdleText
@end

@implementation SBXXSetIdleText

void ___SBXXSetIdleText_block_invoke(uint64_t a1)
{
  id v3 = +[SBIconController sharedInstance];
  v2 = [v3 iconManager];
  [v2 setIdleModeText:*(void *)(a1 + 32)];
}

@end