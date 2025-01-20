@interface UIApplicationSupportsHomeAffordanceObservation
@end

@implementation UIApplicationSupportsHomeAffordanceObservation

uint64_t ___UIApplicationSupportsHomeAffordanceObservation_block_invoke()
{
  uint64_t result = [(id)UIApp _supportsHomeAffordanceObservation];
  byte_1EB25B504 = result;
  return result;
}

@end