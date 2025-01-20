@interface NRIsAutomated
@end

@implementation NRIsAutomated

uint64_t ___NRIsAutomated_block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"_ShowInternalAutomationUI", @"com.apple.nanobuddy.automationhelper", 0);
  if (result) {
    byte_1E95CE9EA = 1;
  }
  return result;
}

@end