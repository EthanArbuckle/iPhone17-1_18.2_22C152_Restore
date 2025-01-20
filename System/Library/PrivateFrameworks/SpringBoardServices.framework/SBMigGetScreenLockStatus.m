@interface SBMigGetScreenLockStatus
@end

@implementation SBMigGetScreenLockStatus

uint64_t ___SBMigGetScreenLockStatus_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void, void, void))(a1 + 40))(*(unsigned int *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 56));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end