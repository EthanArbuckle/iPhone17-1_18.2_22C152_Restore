@interface SBWorkspaceTerminateApps
@end

@implementation SBWorkspaceTerminateApps

uint64_t ___SBWorkspaceTerminateApps_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void ___SBWorkspaceTerminateApps_block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___SBWorkspaceTerminateApps_block_invoke_3;
  block[3] = &unk_1E6AF4AC0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t ___SBWorkspaceTerminateApps_block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

@end