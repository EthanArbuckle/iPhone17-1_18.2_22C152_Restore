@interface UIReusePool
@end

@implementation UIReusePool

uint64_t __26___UIReusePool_addObject___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

void __30___UIReusePool_reusableObject__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) anyObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v5 = *(void **)(*(void *)(a1 + 32) + 8);
    objc_msgSend(v5, "removeObject:");
  }
}

void __26___UIReusePool_initialize__block_invoke()
{
}

void __26___UIReusePool_initialize__block_invoke_2()
{
}

uint64_t __25___UIReusePool_drainPool__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
}

@end