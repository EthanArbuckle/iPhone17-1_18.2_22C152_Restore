@interface UIEvent(PNP)
- (BOOL)pnp_isPencilEvent;
@end

@implementation UIEvent(PNP)

- (BOOL)pnp_isPencilEvent
{
  if (![a1 _hidEvent]) {
    return 0;
  }
  v1 = IOHIDEventGetChildren();
  BOOL v2 = 0;
  if ([v1 count])
  {
    [v1 objectAtIndex:0];
    if (!IOHIDEventGetIntegerValue()) {
      BOOL v2 = 1;
    }
  }

  return v2;
}

@end