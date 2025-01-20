@interface AXTelephonyNotificationHandler
- (id)_notificationTypeDescription;
- (void)_handleNotification:(id)a3;
- (void)_startObserving;
- (void)_stopObserving;
@end

@implementation AXTelephonyNotificationHandler

- (void)_startObserving
{
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  v3 = [(VISAXNotificationHandler *)self _notificationName];
  [v4 addObserver:self selector:sel__handleNotification_ name:v3 object:0];
}

- (void)_handleNotification:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A00];
  id v4 = a3;
  [v3 defaultCenter];
  [v4 name];
  [v4 object];
  [v4 userInfo];

  AXPerformBlockSynchronouslyOnMainThread();
}

- (void)_stopObserving
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];
}

- (id)_notificationTypeDescription
{
  return @"telephony";
}

@end