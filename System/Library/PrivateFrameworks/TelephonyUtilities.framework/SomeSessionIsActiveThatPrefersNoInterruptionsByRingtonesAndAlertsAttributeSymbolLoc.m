@interface SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttributeSymbolLoc
@end

@implementation SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttributeSymbolLoc

void *__getAVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttributeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MediaExperienceLibrary();
  result = dlsym(v2, "AVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttributeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end