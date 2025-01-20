@interface UIAXAutomationIgnoreLogging
@end

@implementation UIAXAutomationIgnoreLogging

uint64_t ___UIAXAutomationIgnoreLogging_block_invoke()
{
  CFStringRef v0 = (const __CFString *)_AXSAccessibilityPreferenceDomain();
  uint64_t result = CFPreferencesGetAppBooleanValue(@"AXAutomationIgnoreLogging", v0, 0);
  _UIAXAutomationIgnoreLogging_IgnoreLogging = result != 0;
  return result;
}

@end