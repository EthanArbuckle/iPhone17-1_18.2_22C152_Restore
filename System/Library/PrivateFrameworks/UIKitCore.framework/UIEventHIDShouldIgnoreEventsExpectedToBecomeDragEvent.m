@interface UIEventHIDShouldIgnoreEventsExpectedToBecomeDragEvent
@end

@implementation UIEventHIDShouldIgnoreEventsExpectedToBecomeDragEvent

uint64_t ___UIEventHIDShouldIgnoreEventsExpectedToBecomeDragEvent_block_invoke()
{
  uint64_t result = [(id)objc_opt_class() _isUIKitSystemProcess];
  if (result)
  {
    uint64_t result = _UIApplicationProcessIsDruid();
    char v1 = result ^ 1;
  }
  else
  {
    char v1 = 1;
  }
  byte_1EB262D29 = v1;
  return result;
}

@end