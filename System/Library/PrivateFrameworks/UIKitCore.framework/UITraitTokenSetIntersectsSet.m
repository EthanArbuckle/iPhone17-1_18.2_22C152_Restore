@interface UITraitTokenSetIntersectsSet
@end

@implementation UITraitTokenSetIntersectsSet

unint64_t ___UITraitTokenSetIntersectsSet_block_invoke(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  unint64_t result = _UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 40), a2);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end