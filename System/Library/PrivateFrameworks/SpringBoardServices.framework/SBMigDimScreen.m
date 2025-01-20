@interface SBMigDimScreen
@end

@implementation SBMigDimScreen

uint64_t ___SBMigDimScreen_block_invoke(uint64_t a1)
{
  v2 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *))(a1 + 40);
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 84);
  long long v5 = *(_OWORD *)(a1 + 68);
  v7[0] = *(_OWORD *)(a1 + 52);
  v7[1] = v5;
  uint64_t result = v2(v3, v4, v7);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end