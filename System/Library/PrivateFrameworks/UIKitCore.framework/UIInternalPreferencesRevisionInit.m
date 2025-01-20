@interface UIInternalPreferencesRevisionInit
@end

@implementation UIInternalPreferencesRevisionInit

void _UIInternalPreferencesRevisionInit_block_invoke()
{
  if (allowInternalPreferences())
  {
    _UIKitPreferencesOnce();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    v0 = [obj objectForKey:@"InternalPreferencesEnabled"];
    v1 = v0;
    if (v0 && ![v0 BOOLValue])
    {
      _UIInternalPreferencesRevisionVar = -1;
    }
    else
    {
      objc_storeStrong((id *)&_revisionDefaults, obj);
      _UIInternalPreferencesRevisionVar = 1;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)notificationHandler, @"com.apple.UIKit.InternalPreferences", 0, CFNotificationSuspensionBehaviorCoalesce);
    }
  }
}

@end