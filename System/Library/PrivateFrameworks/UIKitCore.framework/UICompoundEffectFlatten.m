@interface UICompoundEffectFlatten
@end

@implementation UICompoundEffectFlatten

uint64_t ___UICompoundEffectFlatten_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end