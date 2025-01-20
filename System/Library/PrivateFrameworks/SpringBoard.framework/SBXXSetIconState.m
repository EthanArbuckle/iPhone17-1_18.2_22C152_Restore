@interface SBXXSetIconState
@end

@implementation SBXXSetIconState

void ___SBXXSetIconState_block_invoke(uint64_t a1)
{
  id v3 = +[SBIconController sharedInstance];
  if ([v3 importIconState:*(void *)(a1 + 32)]) {
    int v2 = 0;
  }
  else {
    int v2 = 5;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

@end