@interface SBMigGetCurrentBacklightFactor
@end

@implementation SBMigGetCurrentBacklightFactor

uint64_t ___SBMigGetCurrentBacklightFactor_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void, void))(a1 + 40))(*(unsigned int *)(a1 + 56), *(void *)(a1 + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end