@interface SBMigFrontmostApplicationDisplayIdentifier
@end

@implementation SBMigFrontmostApplicationDisplayIdentifier

uint64_t ___SBMigFrontmostApplicationDisplayIdentifier_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 48);
  v3 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 68);
  v6[0] = *(_OWORD *)(a1 + 52);
  v6[1] = v4;
  return v3(v1, v2, v6);
}

@end