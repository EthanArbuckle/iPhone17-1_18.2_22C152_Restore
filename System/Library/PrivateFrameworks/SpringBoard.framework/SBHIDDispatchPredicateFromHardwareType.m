@interface SBHIDDispatchPredicateFromHardwareType
@end

@implementation SBHIDDispatchPredicateFromHardwareType

uint64_t ___SBHIDDispatchPredicateFromHardwareType_block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHardwareType:*(void *)(a1 + 32)];
}

@end