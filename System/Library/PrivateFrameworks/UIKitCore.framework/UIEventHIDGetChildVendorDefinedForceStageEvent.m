@interface UIEventHIDGetChildVendorDefinedForceStageEvent
@end

@implementation UIEventHIDGetChildVendorDefinedForceStageEvent

unint64_t ___UIEventHIDGetChildVendorDefinedForceStageEvent_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  unint64_t result = IOHIDEventGetType();
  if (result == 1)
  {
    unint64_t result = IOHIDEventGetIntegerValue();
    if (result == 65280)
    {
      unint64_t result = IOHIDEventGetIntegerValue();
      if (result == 17)
      {
        unint64_t result = IOHIDEventGetIntegerValue();
        if (result >= 0x30)
        {
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
          *a4 = 1;
        }
      }
    }
  }
  return result;
}

@end