@interface InitializeDemoModeValuesIfNecessary
@end

@implementation InitializeDemoModeValuesIfNecessary

void ___InitializeDemoModeValuesIfNecessary_block_invoke()
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_PreferencesChanged, (CFStringRef)*MEMORY[0x263F5C7E8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  _UpdateDemoModeValues();
}

@end