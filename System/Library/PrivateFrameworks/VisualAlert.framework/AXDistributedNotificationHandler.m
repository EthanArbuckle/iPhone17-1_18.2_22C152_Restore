@interface AXDistributedNotificationHandler
+ (void)postDistributedNotificationWithName:(id)a3;
- (id)_notificationTypeDescription;
- (void)_startObserving;
- (void)_stopObserving;
@end

@implementation AXDistributedNotificationHandler

- (void)_startObserving
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  observerIdentifier = (const void *)self->super._observerIdentifier;
  v5 = [(VISAXNotificationHandler *)self _notificationName];
  CFNotificationCenterAddObserver(DarwinNotifyCenter, observerIdentifier, (CFNotificationCallback)_HandleDistributedNotification, v5, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopObserving
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  observerIdentifier = (const void *)self->super._observerIdentifier;
  v5 = [(VISAXNotificationHandler *)self _notificationName];
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, observerIdentifier, v5, 0);
}

+ (void)postDistributedNotificationWithName:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = (__CFString *)a3;
  v4 = [MEMORY[0x263F22988] sharedInstance];
  char v5 = [v4 ignoreLogging];

  if ((v5 & 1) == 0)
  {
    v6 = [MEMORY[0x263F22988] identifier];
    v7 = AXLoggerForFacility();

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = AXColorizeFormatLog();
      v10 = _AXStringForArgs();
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v10;
        _os_log_impl(&dword_22D39A000, v7, v8, "%{public}@", buf, 0xCu);
      }
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);
}

- (id)_notificationTypeDescription
{
  return @"distributed";
}

@end