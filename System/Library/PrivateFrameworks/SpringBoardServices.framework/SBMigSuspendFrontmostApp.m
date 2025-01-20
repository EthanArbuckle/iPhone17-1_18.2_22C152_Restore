@interface SBMigSuspendFrontmostApp
@end

@implementation SBMigSuspendFrontmostApp

uint64_t ___SBMigSuspendFrontmostApp_block_invoke(uint64_t a1)
{
  v1 = *(uint64_t (**)(uint64_t, _OWORD *))(a1 + 32);
  uint64_t v2 = *(unsigned int *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 60);
  v5[0] = *(_OWORD *)(a1 + 44);
  v5[1] = v3;
  return v1(v2, v5);
}

@end