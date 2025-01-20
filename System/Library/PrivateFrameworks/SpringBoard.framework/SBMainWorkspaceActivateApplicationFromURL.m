@interface SBMainWorkspaceActivateApplicationFromURL
@end

@implementation SBMainWorkspaceActivateApplicationFromURL

uint64_t ___SBMainWorkspaceActivateApplicationFromURL_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forActivationSetting:5];
}

void ___SBMainWorkspaceActivateApplicationFromURL_block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 _LSFailedToOpenURL:*(void *)(a1 + 32) withBundle:0];
}

@end