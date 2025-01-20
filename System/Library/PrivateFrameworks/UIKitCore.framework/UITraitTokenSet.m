@interface UITraitTokenSet
@end

@implementation UITraitTokenSet

_UITraitTokenSet *__28___UITraitTokenSet_emptySet__block_invoke()
{
  result = objc_alloc_init(_UITraitTokenSet);
  qword_1EB2647F8 = (uint64_t)result;
  return result;
}

uint64_t __34___UITraitTokenSet_allTraitTokens__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a2];
  return [v2 addObject:v3];
}

@end