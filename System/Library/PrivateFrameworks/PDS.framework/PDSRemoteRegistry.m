@interface PDSRemoteRegistry
+ (id)remoteVendorForClientID:(id)a3;
+ (void)registerGlobalVendor:(id)a3;
@end

@implementation PDSRemoteRegistry

+ (id)remoteVendorForClientID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PDSRemoteConnector.m", 20, @"Invalid parameter not satisfying: %@", @"clientID" object file lineNumber description];
  }
  os_unfair_lock_lock((os_unfair_lock_t)&kVendorsLock);
  if (kGlobalVendor)
  {
    v6 = (PDSXPCConnector *)(id)kGlobalVendor;
  }
  else
  {
    v7 = (void *)kVendors;
    if (!kVendors)
    {
      uint64_t v8 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
      v9 = (void *)kVendors;
      kVendors = v8;

      v7 = (void *)kVendors;
    }
    v6 = [v7 objectForKey:v5];
    if (!v6)
    {
      v6 = [[PDSXPCConnector alloc] initWithClientID:v5];
      [(id)kVendors setObject:v6 forKey:v5];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&kVendorsLock);

  return v6;
}

+ (void)registerGlobalVendor:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&kVendorsLock);
  v4 = (void *)kGlobalVendor;
  kGlobalVendor = (uint64_t)v3;
  id v5 = v3;

  v6 = (void *)kVendors;
  kVendors = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&kVendorsLock);
}

@end