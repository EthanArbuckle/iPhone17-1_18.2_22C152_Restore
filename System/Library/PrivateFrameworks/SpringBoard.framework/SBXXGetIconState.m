@interface SBXXGetIconState
@end

@implementation SBXXGetIconState

void ___SBXXGetIconState_block_invoke(uint64_t a1)
{
  id v6 = +[SBIconController sharedInstance];
  v2 = [v6 model];
  uint64_t v3 = [v2 exportState:*(unsigned char *)(a1 + 40) != 0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

@end