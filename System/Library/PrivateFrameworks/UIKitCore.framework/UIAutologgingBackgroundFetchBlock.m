@interface UIAutologgingBackgroundFetchBlock
@end

@implementation UIAutologgingBackgroundFetchBlock

uint64_t ___UIAutologgingBackgroundFetchBlock_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCalled:1];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

@end