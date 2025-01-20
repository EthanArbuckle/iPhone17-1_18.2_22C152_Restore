@interface UIEventHIDButtonMaskFromPointerEventAndChildren
@end

@implementation UIEventHIDButtonMaskFromPointerEventAndChildren

uint64_t ___UIEventHIDButtonMaskFromPointerEventAndChildren_block_invoke(uint64_t a1)
{
  uint64_t result = IOHIDEventGetType();
  if (result == 2)
  {
    uint64_t result = IOHIDEventGetIntegerValue();
    if (result >= 1)
    {
      uint64_t v3 = 1 << (result - 1);
      if ((unint64_t)result >= 0x3F) {
        uint64_t v3 = 0;
      }
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= v3;
    }
  }
  return result;
}

@end