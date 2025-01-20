@interface SBFKeyWindowStack
@end

@implementation SBFKeyWindowStack

uint64_t __36___SBFKeyWindowStack_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_SBFKeyWindowStack);
  uint64_t v1 = sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __60___SBFKeyWindowStack_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(*(void *)(a1 + 40) + 16) array];
  [v1 appendArraySection:v2 withName:@"stack" skipIfEmpty:0];
}

@end