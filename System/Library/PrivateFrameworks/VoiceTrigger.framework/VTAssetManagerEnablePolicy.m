@interface VTAssetManagerEnablePolicy
- (VTAssetManagerEnablePolicy)init;
- (void)_addAssetManagerEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation VTAssetManagerEnablePolicy

- (void)_addAssetManagerEnabledConditions
{
}

uint64_t __63__VTAssetManagerEnablePolicy__addAssetManagerEnabledConditions__block_invoke()
{
  v0 = +[VTFirstUnlockMonitor sharedInstance];
  uint64_t v1 = [v0 isFirstUnlocked];

  return v1;
}

- (void)_subscribeEventMonitors
{
  id v3 = +[VTFirstUnlockMonitor sharedInstance];
  [(VTPolicy *)self subscribeEventMonitor:v3];
}

- (VTAssetManagerEnablePolicy)init
{
  v5.receiver = self;
  v5.super_class = (Class)VTAssetManagerEnablePolicy;
  v2 = [(VTPolicy *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    [(VTAssetManagerEnablePolicy *)v2 _addAssetManagerEnabledConditions];
    [(VTAssetManagerEnablePolicy *)v3 _subscribeEventMonitors];
  }
  return v3;
}

@end