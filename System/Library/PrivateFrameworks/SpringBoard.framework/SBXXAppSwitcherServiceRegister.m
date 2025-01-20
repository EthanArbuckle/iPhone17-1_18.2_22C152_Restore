@interface SBXXAppSwitcherServiceRegister
@end

@implementation SBXXAppSwitcherServiceRegister

void ___SBXXAppSwitcherServiceRegister_block_invoke(uint64_t a1)
{
  id v2 = +[SBAppSwitcherServiceManager sharedInstance];
  [v2 registerService:*(void *)(a1 + 32)];
}

void ___SBXXAppSwitcherServiceRegister_block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___SBXXAppSwitcherServiceRegister_block_invoke_3;
  block[3] = &unk_1E6AF4AC0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void ___SBXXAppSwitcherServiceRegister_block_invoke_3(uint64_t a1)
{
  id v2 = +[SBAppSwitcherServiceManager sharedInstance];
  [v2 unregisterService:*(void *)(a1 + 32)];
}

@end