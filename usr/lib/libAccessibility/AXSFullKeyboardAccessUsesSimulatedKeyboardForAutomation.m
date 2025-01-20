@interface AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation
@end

@implementation AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation

uint64_t ___AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation_block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"FullKeyboardAccessUsesSimulatedKeyboardForAutomation", (CFStringRef)kAXSAccessibilityPreferenceDomain, 0);
  _AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation_UsesSimulatedKeyboard = result;
  return result;
}

@end