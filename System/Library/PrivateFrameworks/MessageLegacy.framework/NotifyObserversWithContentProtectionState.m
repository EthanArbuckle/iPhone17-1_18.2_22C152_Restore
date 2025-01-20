@interface NotifyObserversWithContentProtectionState
@end

@implementation NotifyObserversWithContentProtectionState

uint64_t ___NotifyObserversWithContentProtectionState_block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) observer];
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  uint64_t v4 = *(unsigned int *)(a1 + 44);
  return [v2 contentProtectionStateChanged:v3 previousState:v4];
}

@end