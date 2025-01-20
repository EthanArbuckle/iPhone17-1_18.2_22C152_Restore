@interface UIEventHIDEventRemoteTimestamp
@end

@implementation UIEventHIDEventRemoteTimestamp

uint64_t ___UIEventHIDEventRemoteTimestamp_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t result = IOHIDEventGetIntegerValue();
  BOOL v8 = IntegerValue == 65308 || IntegerValue == 65280;
  if (v8 && result == 258)
  {
    DataValue = (void *)IOHIDEventGetDataValue();
    uint64_t result = IOHIDEventGetIntegerValue();
    if (DataValue)
    {
      if (result >= 1) {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *DataValue;
      }
    }
    *a4 = 1;
  }
  return result;
}

@end