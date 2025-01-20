@interface UIDeviceSupportsGlobalEdgeSwipeTouches
@end

@implementation UIDeviceSupportsGlobalEdgeSwipeTouches

uint64_t ___UIDeviceSupportsGlobalEdgeSwipeTouches_block_invoke()
{
  char v0 = MGGetBoolAnswer();
  uint64_t result = MGGetBoolAnswer();
  byte_1EB260ED8 = v0 | result;
  return result;
}

@end