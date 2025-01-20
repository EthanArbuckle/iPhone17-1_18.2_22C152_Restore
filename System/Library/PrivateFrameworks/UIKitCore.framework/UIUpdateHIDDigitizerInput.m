@interface UIUpdateHIDDigitizerInput
@end

@implementation UIUpdateHIDDigitizerInput

void __39___UIUpdateHIDDigitizerInput_addEvent___block_invoke_2(uint64_t a1)
{
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  char v3 = IOHIDEventGetIntegerValue();
  int TouchLocus = BKSHIDEventDigitizerGetTouchLocus();
  uint64_t v5 = _UIEventHIDPathIndexForDigitizerEvent();
  if (!IntegerValue || v3 < 0 || TouchLocus == 3)
  {
    v7 = *(void **)(*(void *)(a1 + 32) + 120);
    id v8 = [NSNumber numberWithLong:v5];
    [v7 removeObject:v8];
  }
  else
  {
    v6 = *(void **)(*(void *)(a1 + 32) + 120);
    id v8 = [NSNumber numberWithLong:v5];
    [v6 addObject:v8];
  }
}

uint64_t __39___UIUpdateHIDDigitizerInput_addEvent___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  IOHIDEventGetIntegerValue();
  IOHIDEventGetIntegerValue();
  uint64_t result = IOHIDEventGetIntegerValue();
  if (result == 65308)
  {
    uint64_t result = IOHIDEventGetIntegerValue();
    if (result == 32)
    {
      uint64_t result = IOHIDEventGetDataValue();
      *(void *)(a1[4] + 144) = *(void *)(result + 8) - *(void *)(result + 16);
      *(void *)(a1[4] + 152) = *(void *)(result + 16);
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(result + 1);
      *(void *)(*(void *)(a1[6] + 8) + 24) = result;
      *a4 = 1;
    }
  }
  return result;
}

@end