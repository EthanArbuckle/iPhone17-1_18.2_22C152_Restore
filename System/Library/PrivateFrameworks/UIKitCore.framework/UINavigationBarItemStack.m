@interface UINavigationBarItemStack
@end

@implementation UINavigationBarItemStack

void __42___UINavigationBarItemStack_iterateItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [a2 item];
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);
}

uint64_t __51___UINavigationBarItemStack_reverseIterateEntries___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end