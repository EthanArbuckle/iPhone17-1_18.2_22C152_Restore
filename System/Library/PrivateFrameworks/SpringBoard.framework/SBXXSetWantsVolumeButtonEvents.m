@interface SBXXSetWantsVolumeButtonEvents
@end

@implementation SBXXSetWantsVolumeButtonEvents

uint64_t ___SBXXSetWantsVolumeButtonEvents_block_invoke(uint64_t a1)
{
  return [(id)SBApp setAppRegisteredForVolumeEvents:*(void *)(a1 + 32) isActive:*(_DWORD *)(a1 + 40) != 0];
}

@end