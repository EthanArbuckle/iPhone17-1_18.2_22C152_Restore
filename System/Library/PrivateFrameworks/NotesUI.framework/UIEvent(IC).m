@interface UIEvent(IC)
- (const)ic_isPencilEvent;
@end

@implementation UIEvent(IC)

- (const)ic_isPencilEvent
{
  CFArrayRef result = (const __CFArray *)[a1 _hidEvent];
  if (result)
  {
    CFArrayRef result = (const __CFArray *)IOHIDEventGetChildren();
    if (result)
    {
      CFArrayRef v2 = result;
      if (CFArrayGetCount(result)
        && (CFArrayGetValueAtIndex(v2, 0), IOHIDEventGetType() == 11))
      {
        return (const __CFArray *)(IOHIDEventGetIntegerValue() == 0);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

@end