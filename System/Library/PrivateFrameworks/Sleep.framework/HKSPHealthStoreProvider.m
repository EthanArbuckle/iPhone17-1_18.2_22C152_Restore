@interface HKSPHealthStoreProvider
+ (id)_initializedLocalDeviceHealthStore;
- (HKHealthStore)healthStore;
- (HKSPHealthStoreProvider)initWithLocalDeviceHealthStore;
- (HKSPHealthStoreProvider)initWithSleepHealthStore:(id)a3 healthStore:(id)a4;
- (HKSleepHealthStore)sleepHealthStore;
@end

@implementation HKSPHealthStoreProvider

+ (id)_initializedLocalDeviceHealthStore
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F2B0B8]);
  [v2 setSourceBundleIdentifier:@"com.apple.private.health.localdevice"];
  [v2 resume];
  return v2;
}

- (HKSPHealthStoreProvider)initWithLocalDeviceHealthStore
{
  v3 = [(id)objc_opt_class() _initializedLocalDeviceHealthStore];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FA5590]) initWithHealthStore:v3];
  v5 = [(HKSPHealthStoreProvider *)self initWithSleepHealthStore:v4 healthStore:v3];

  return v5;
}

- (HKSPHealthStoreProvider)initWithSleepHealthStore:(id)a3 healthStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKSPHealthStoreProvider;
  v9 = [(HKSPHealthStoreProvider *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sleepHealthStore, a3);
    objc_storeStrong((id *)&v10->_healthStore, a4);
    v11 = v10;
  }

  return v10;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKSleepHealthStore)sleepHealthStore
{
  return self->_sleepHealthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepHealthStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end