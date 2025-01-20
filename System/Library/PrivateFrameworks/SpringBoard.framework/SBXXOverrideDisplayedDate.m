@interface SBXXOverrideDisplayedDate
@end

@implementation SBXXOverrideDisplayedDate

void ___SBXXOverrideDisplayedDate_block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FA5EE8] sharedInstance];
  [v2 setOverrideDate:*(void *)(a1 + 32)];
}

@end