@interface SS
@end

@implementation SS

uint64_t __SS_SendStatusBarTapToScreenSharingServer_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInvalidationHandler:0];
}

void __SS_SendStatusBarTapToScreenSharingServer_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 domain];
  uint64_t v3 = [v2 code];

  NSLog(&cfstr_ConnectFailedD.isa, v4, v3);
}

@end