@interface NRDeviceDiscoveryController
+ (id)sharedInstance;
- (NRDeviceDiscoveryController)init;
- (NSArray)devices;
- (void)begin;
- (void)end;
- (void)overrideSignalStrengthLimit:(int64_t)a3;
@end

@implementation NRDeviceDiscoveryController

- (NRDeviceDiscoveryController)init
{
  v3.receiver = self;
  v3.super_class = (Class)NRDeviceDiscoveryController;
  return [(NRDeviceDiscoveryController *)&v3 init];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NRDeviceDiscoveryController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1E95CEA48 != -1) {
    dispatch_once(&qword_1E95CEA48, block);
  }
  v2 = (void *)qword_1E95CEA40;

  return v2;
}

uint64_t __45__NRDeviceDiscoveryController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = qword_1E95CEA40;
  qword_1E95CEA40 = (uint64_t)v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (void)overrideSignalStrengthLimit:(int64_t)a3
{
  id v4 = +[NRPairedDeviceRegistry sharedInstance];
  [v4 overrideSignalStrengthLimit:a3];
}

- (void)begin
{
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  [v2 beginDiscovery];
}

- (void)end
{
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  [v2 endDiscovery];
}

- (NSArray)devices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  objc_super v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = [v3 getAllDevices];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "valueForProperty:", @"isPaired", (void)v14);
        v12 = [v10 valueForProperty:@"isActive"];
        if (([v11 BOOLValue] & 1) == 0 && (objc_msgSend(v12, "BOOLValue") & 1) == 0) {
          objc_msgSend(v2, "insertObject:atIndex:", v10, objc_msgSend(v2, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, objc_msgSend(v2, "count"), 1024, &__block_literal_global_605));
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return (NSArray *)v2;
}

uint64_t __38__NRDeviceDiscoveryController_devices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 valueForProperty:@"_RSSI"];
  uint64_t v6 = [v4 valueForProperty:@"_RSSI"];

  if (v5) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = v6 != 0;
  }
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    uint64_t v7 = [v6 compare:v5];
  }

  return v7;
}

@end