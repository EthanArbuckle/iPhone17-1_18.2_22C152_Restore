@interface InstallGlobalPreferencesObserverIfNecessary
@end

@implementation InstallGlobalPreferencesObserverIfNecessary

void ___InstallGlobalPreferencesObserverIfNecessary_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_GlobalPreferencesChangedHandler, @"com.apple.passbook.globalprefschanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_ManagedConfigProfilesChangedHandler, @"com.apple.ManagedConfiguration.profileListChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end