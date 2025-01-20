@interface SBHIDDispatchPredicateFromDeviceUsagePair
@end

@implementation SBHIDDispatchPredicateFromDeviceUsagePair

uint64_t ___SBHIDDispatchPredicateFromDeviceUsagePair_block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPrimaryPage:*(unsigned int *)(a1 + 32) primaryUsage:*(unsigned int *)(a1 + 36)];
}

@end