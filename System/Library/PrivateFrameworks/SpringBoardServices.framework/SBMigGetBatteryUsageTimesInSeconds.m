@interface SBMigGetBatteryUsageTimesInSeconds
@end

@implementation SBMigGetBatteryUsageTimesInSeconds

uint64_t ___SBMigGetBatteryUsageTimesInSeconds_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 80);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  long long v8 = *(_OWORD *)(a1 + 100);
  v10[0] = *(_OWORD *)(a1 + 84);
  v10[1] = v8;
  uint64_t result = v4(v2, v3, v5, v6, v7, v10);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end