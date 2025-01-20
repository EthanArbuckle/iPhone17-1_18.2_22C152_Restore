@interface DataPlanActivateFailed
@end

@implementation DataPlanActivateFailed

uint64_t ___DataPlanActivateFailed_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 application];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dataUsage];
  if (result) {
    return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) hasShownDataPlanAlertSinceLock] ^ 1;
  }
  return result;
}

@end