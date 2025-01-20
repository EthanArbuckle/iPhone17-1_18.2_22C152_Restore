@interface SBXXSetWantsLockButtonEvents
@end

@implementation SBXXSetWantsLockButtonEvents

uint64_t ___SBXXSetWantsLockButtonEvents_block_invoke(uint64_t a1)
{
  return [(id)SBApp setAppRegisteredForLockButtonEvents:*(void *)(a1 + 32) isActive:*(_DWORD *)(a1 + 40) != 0];
}

@end