@interface LNActionMetadata
@end

@implementation LNActionMetadata

uint64_t __80__LNActionMetadata_ShouldPrewarmAppLaunch__wf_shouldPrewarmAppLaunchWithAction___block_invoke_47(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  v4 = [*(id *)(a1 + 32) name];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

BOOL __80__LNActionMetadata_ShouldPrewarmAppLaunch__wf_shouldPrewarmAppLaunchWithAction___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isOptional])
  {
    BOOL v3 = 0;
  }
  else
  {
    v4 = [v2 typeSpecificMetadata];
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F729F8]];
    BOOL v3 = v5 == 0;
  }
  return v3;
}

@end