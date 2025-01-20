@interface SharedCacheDictionary
@end

@implementation SharedCacheDictionary

void ___SharedCacheDictionary_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_SharedCacheValuesChangedHandler, @"com.apple.passkit.sharedcachechanged", 0, (CFNotificationSuspensionBehavior)0);
}

@end