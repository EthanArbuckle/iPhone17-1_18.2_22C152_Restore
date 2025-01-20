@interface UIGetSystemTraitTokensAffectingColorAppearance
@end

@implementation UIGetSystemTraitTokensAffectingColorAppearance

uint64_t ___UIGetSystemTraitTokensAffectingColorAppearance_block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a2];
  return [v2 addObject:v3];
}

@end