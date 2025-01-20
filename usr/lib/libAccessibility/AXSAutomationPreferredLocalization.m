@interface AXSAutomationPreferredLocalization
@end

@implementation AXSAutomationPreferredLocalization

void ___AXSAutomationPreferredLocalization_block_invoke()
{
  _AXSAutomationPreferredLocalization_loc = (uint64_t)_copyValuePreferenceApp((const __CFString *)kAXSAutomationPreferredLanguagePreference, 0, 0);
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v0 = [v3 arrayForKey:@"AppleLanguages"];
  v1 = [v0 firstObject];
  int v2 = [v1 isEqualToString:_AXSAutomationPreferredLocalization_loc];

  if (v2)
  {
    CFRelease((CFTypeRef)_AXSAutomationPreferredLocalization_loc);
    _AXSAutomationPreferredLocalization_loc = 0;
  }
}

@end