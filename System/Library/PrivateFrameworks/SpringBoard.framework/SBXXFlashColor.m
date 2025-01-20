@interface SBXXFlashColor
@end

@implementation SBXXFlashColor

void ___SBXXFlashColor_block_invoke(uint64_t a1)
{
  id v2 = +[SBScreenFlash mainScreenFlasher];
  [v2 flashColor:*(void *)(a1 + 32) withCompletion:0];
}

@end