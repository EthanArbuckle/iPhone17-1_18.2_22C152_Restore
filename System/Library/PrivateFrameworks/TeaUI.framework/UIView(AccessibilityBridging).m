@interface UIView(AccessibilityBridging)
- (id)_accessibilityIsSpeakThisElement;
- (uint64_t)ts_accessibilityInterfaceStyleIntent;
@end

@implementation UIView(AccessibilityBridging)

- (uint64_t)ts_accessibilityInterfaceStyleIntent
{
  return 0;
}

- (id)_accessibilityIsSpeakThisElement
{
  if (objc_opt_respondsToSelector())
  {
    return (id)objc_msgSend(a1, "ts_accessibilityIsSpeakThisElement");
  }
  else
  {
    v3.receiver = a1;
    v3.super_class = (Class)UIView_0;
    return objc_msgSendSuper2(&v3, sel__accessibilityIsSpeakThisElement);
  }
}

@end