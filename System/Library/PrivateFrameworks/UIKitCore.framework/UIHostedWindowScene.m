@interface UIHostedWindowScene
@end

@implementation UIHostedWindowScene

void __35___UIHostedWindowScene_sendAction___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _FBSScene];
  v2 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
  [v3 sendActions:v2];
}

@end