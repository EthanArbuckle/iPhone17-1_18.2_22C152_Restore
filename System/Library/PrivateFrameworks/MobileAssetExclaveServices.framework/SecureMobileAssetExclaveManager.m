@interface SecureMobileAssetExclaveManager
+ (id)sharedInstance;
@end

@implementation SecureMobileAssetExclaveManager

+ (id)sharedInstance
{
  id v2 = (id)sharedInstance_manager;
  objc_sync_enter(v2);
  if (!sharedInstance_manager)
  {
    v3 = [[_TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager alloc] initWithConclave:1];
    v4 = (void *)sharedInstance_manager;
    sharedInstance_manager = (uint64_t)v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)sharedInstance_manager;
  return v5;
}

@end