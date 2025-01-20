@interface UIAccessibility.AccessibilityNavigationServicesEnabledObserver
- (void)update;
@end

@implementation UIAccessibility.AccessibilityNavigationServicesEnabledObserver

- (void)update
{
  if (!UIAccessibilityIsVoiceOverRunning()
    && !UIAccessibilityIsSwitchControlRunning()
    && !_AXSCommandAndControlEnabled())
  {
    IMAccessibilityIsFKAEnabledWithKeyboardAttached();
  }
  sub_1F1FB0();
  swift_release();
}

@end