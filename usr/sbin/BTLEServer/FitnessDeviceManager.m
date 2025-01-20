@interface FitnessDeviceManager
+ (BOOL)shouldRestartCollecting;
+ (id)connectStateStr:(int64_t)a3;
+ (id)instance;
- (AAAudioRoutingControl)audioRoutingControl;
- (BOOL)heartRateScanDidTimeOut;
- (BOOL)isHKHeartRateEnabled;
- (BOOL)isHKQuantityRequested:(id)a3;
- (BOOL)isPeripheralConnected:(id)a3;
- (BOOL)shouldCollectFromDevice:(id)a3;
- (BOOL)shouldConnectDevice:(id)a3;
- (BOOL)shouldForwardFitnessService:(id)a3 quantityType:(id)a4;
- (BOOL)workoutInSession;
- (CBCentralManager)centralManager;
- (FitnessDeviceManager)init;
- (HKActiveDataCollectionObserver)dataCollectionObserver;
- (HKHealthStore)hkHealthStore;
- (NSArray)knownQuantityTypes;
- (NSArray)pairedFitnessDeviceUUIDS;
- (NSArray)registeredServices;
- (NSArray)requestedQuantityTypes;
- (NSMutableDictionary)serviceUUIDForSupportedHKQuantityType;
- (NSMutableDictionary)unitForSupportedHKQuantityType;
- (NSTimer)heartRateScanTimer;
- (OS_os_transaction)persistanceAssertion;
- (id)createHKDataCollectorForHKQuantityType:(id)a3;
- (id)findMatchingDistributedFitnessService:(id)a3;
- (id)getConnectedPeripheralUUIDsCollecting:(BOOL)a3 andIdle:(BOOL)a4;
- (id)getRequestedTags;
- (id)hkQuantityTypesForService:(id)a3;
- (id)hkUnitForHKQuantityType:(id)a3;
- (id)requestedServices;
- (id)servicesForHKQuantityType:(id)a3;
- (id)supportedQuantityTypesForServiceUUID:(id)a3;
- (void)activeDataCollectionObserver:(id)a3 updatedCollectedTypes:(id)a4;
- (void)cancelStaleConnectionRequests;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)collectDataForQuantityTypeIdentifiers:(id)a3 isWorkout:(BOOL)a4;
- (void)collectDataForQuantityTypes:(id)a3 isWorkout:(BOOL)a4;
- (void)connectPeripheral:(id)a3;
- (void)connectTaggedDevices;
- (void)disconnectDevice:(id)a3;
- (void)disconnectDevicesWithoutRunningService;
- (void)handleDevicePairingChangeCallback;
- (void)handlePeripheralStatusChangeCallback;
- (void)loadCollectionState;
- (void)markFitnessTaskEnabled:(BOOL)a3;
- (void)migrateHKPairedHealthDevices;
- (void)notifyHRMSessionStateChanged;
- (void)registerFitnessService:(id)a3;
- (void)registerWithHealthKit:(BOOL)a3;
- (void)removeFitnessServicesForPeripheral:(id)a3;
- (void)setAudioRoutingControl:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setDataCollectionObserver:(id)a3;
- (void)setHeartRateScanDidTimeOut:(BOOL)a3;
- (void)setHeartRateScanTimer:(id)a3;
- (void)setHkHealthStore:(id)a3;
- (void)setKnownQuantityTypes:(id)a3;
- (void)setPairedFitnessDeviceUUIDS:(id)a3;
- (void)setPersistanceAssertion:(id)a3;
- (void)setRegisteredServices:(id)a3;
- (void)setRequestedQuantityTypes:(id)a3;
- (void)setServiceUUID:(id)a3 forQuantityType:(id)a4;
- (void)setServiceUUIDForSupportedHKQuantityType:(id)a3;
- (void)setUnit:(id)a3 forQuantityType:(id)a4;
- (void)setUnitForSupportedHKQuantityType:(id)a3;
- (void)setWorkoutInSession:(BOOL)a3;
- (void)setupAudioRoutingControl;
- (void)startHeartRateScanTimer;
- (void)stopHeartRateScanTimer;
- (void)storeCollectionState;
- (void)updatePairedDevices:(id)a3;
- (void)updateScan;
@end

@implementation FitnessDeviceManager

+ (id)instance
{
  if (qword_1000CD108 != -1) {
    dispatch_once(&qword_1000CD108, &stru_1000B2098);
  }
  v2 = (void *)qword_1000CD100;

  return v2;
}

+ (BOOL)shouldRestartCollecting
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"Fitness"];

  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      v5 = [v4 objectForKey:@"Collecting"];
      id v6 = [(__CFString *)v5 count];
      BOOL v7 = v6 != 0;
      uint64_t v8 = qword_1000CD178;
      BOOL v9 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v9)
        {
          int v15 = 138412290;
          CFStringRef v16 = v5;
          v10 = "shouldRestartCollecting:YES %@";
          v11 = v8;
          uint32_t v12 = 12;
LABEL_10:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
        }
      }
      else if (v9)
      {
        LOWORD(v15) = 0;
        v10 = "shouldRestartCollecting:NO";
        v11 = v8;
        uint32_t v12 = 2;
        goto LABEL_10;
      }

      goto LABEL_12;
    }
  }
  v13 = qword_1000CD178;
  BOOL v7 = 0;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    CFStringRef v16 = @"Fitness";
    __int16 v17 = 2112;
    v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "shouldRestartCollecting:NO - setting for key:%@ = %@", (uint8_t *)&v15, 0x16u);
    BOOL v7 = 0;
  }
LABEL_12:

  return v7;
}

- (void)storeCollectionState
{
  v3 = +[NSDate now];
  id v4 = (void *)qword_1000CD178;
  v5 = &AFSiriActivationBluetoothDeviceButtonPress_ptr;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = v3;
    v17[0] = @"Timestamp";
    v17[1] = @"Collecting";
    id v6 = v4;
    BOOL v7 = [(FitnessDeviceManager *)self getRequestedTags];
    v18[1] = v7;
    v17[2] = @"WorkoutInSession";
    uint64_t v8 = +[NSNumber numberWithBool:[(FitnessDeviceManager *)self workoutInSession]];
    v18[2] = v8;
    BOOL v9 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
    *(_DWORD *)buf = 138412546;
    CFStringRef v20 = @"Fitness";
    __int16 v21 = 2112;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Storing setting for key:%@ = %@", buf, 0x16u);

    v5 = &AFSiriActivationBluetoothDeviceButtonPress_ptr;
  }
  v10 = objc_opt_new();
  v16[0] = v3;
  v11 = [(FitnessDeviceManager *)self getRequestedTags];
  v16[1] = v11;
  v15[2] = @"WorkoutInSession";
  uint32_t v12 = [v5[448] numberWithBool:-[FitnessDeviceManager workoutInSession](self, "workoutInSession")];
  v16[2] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  [v10 addEntriesFromDictionary:v13];

  v14 = +[NSUserDefaults standardUserDefaults];
  [v14 setObject:v10 forKey:@"Fitness"];
}

- (void)loadCollectionState
{
  v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 objectForKey:@"Fitness"];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    id v6 = [v5 objectForKey:@"Timestamp"];
    BOOL v7 = [v5 objectForKey:@"Collecting"];
    uint64_t v8 = [v5 objectForKey:@"WorkoutInSession"];

    if (v7)
    {
      BOOL v9 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412546;
        CFStringRef v12 = v6;
        __int16 v13 = 2112;
        v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Restoring collecting state started at %@: %@", (uint8_t *)&v11, 0x16u);
      }
      [(FitnessDeviceManager *)self collectDataForQuantityTypeIdentifiers:v7 isWorkout:v8 != 0];
    }
  }
  else
  {
    v10 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      CFStringRef v12 = @"Fitness";
      __int16 v13 = 2112;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "loading collection state, not actionable - setting for key:%@ = %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (FitnessDeviceManager)init
{
  v31.receiver = self;
  v31.super_class = (Class)FitnessDeviceManager;
  v2 = [(FitnessDeviceManager *)&v31 init];
  registeredServices = v2->_registeredServices;
  v2->_registeredServices = (NSArray *)&__NSArray0__struct;

  requestedQuantityTypes = v2->_requestedQuantityTypes;
  v2->_requestedQuantityTypes = (NSArray *)&__NSArray0__struct;

  knownQuantityTypes = v2->_knownQuantityTypes;
  v2->_knownQuantityTypes = (NSArray *)&__NSArray0__struct;

  id v6 = objc_alloc((Class)CBCentralManager);
  v36[0] = CBCentralManagerOptionReceiveSystemEvents;
  v36[1] = CBManagerNeedsRestrictedStateOperation;
  v37[0] = &__kCFBooleanTrue;
  v37[1] = &__kCFBooleanTrue;
  BOOL v7 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
  uint64_t v8 = (CBCentralManager *)[v6 initWithDelegate:v2 queue:&_dispatch_main_q options:v7];
  centralManager = v2->_centralManager;
  v2->_centralManager = v8;

  [(FitnessDeviceManager *)v2 setupAudioRoutingControl];
  v10 = objc_opt_new();
  [(FitnessDeviceManager *)v2 setServiceUUIDForSupportedHKQuantityType:v10];

  [(FitnessDeviceManager *)v2 setServiceUUID:CBUUIDHeartRateServiceString forQuantityType:HKQuantityTypeIdentifierHeartRate];
  uint64_t v11 = CBUUIDCyclingSpeedAndCadenceServiceString;
  [(FitnessDeviceManager *)v2 setServiceUUID:CBUUIDCyclingSpeedAndCadenceServiceString forQuantityType:HKQuantityTypeIdentifierCyclingCadence];
  [(FitnessDeviceManager *)v2 setServiceUUID:v11 forQuantityType:HKQuantityTypeIdentifierCyclingSpeed];
  [(FitnessDeviceManager *)v2 setServiceUUID:v11 forQuantityType:HKQuantityTypeIdentifierDistanceCycling];
  [(FitnessDeviceManager *)v2 setServiceUUID:CBUUIDCyclingPowerServiceString forQuantityType:HKQuantityTypeIdentifierCyclingPower];
  CFStringRef v12 = objc_opt_new();
  [(FitnessDeviceManager *)v2 setUnitForSupportedHKQuantityType:v12];

  [(FitnessDeviceManager *)v2 setUnit:@"count/min" forQuantityType:HKQuantityTypeIdentifierHeartRate];
  [(FitnessDeviceManager *)v2 setUnit:@"count/min" forQuantityType:HKQuantityTypeIdentifierCyclingCadence];
  [(FitnessDeviceManager *)v2 setUnit:@"mi/hr" forQuantityType:HKQuantityTypeIdentifierCyclingSpeed];
  [(FitnessDeviceManager *)v2 setUnit:@"W" forQuantityType:HKQuantityTypeIdentifierCyclingPower];
  v26 = v2;
  [(FitnessDeviceManager *)v2 setUnit:@"m" forQuantityType:HKQuantityTypeIdentifierDistanceCycling];
  __int16 v13 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v34[0] = HKQuantityTypeIdentifierCyclingCadence;
  v34[1] = HKQuantityTypeIdentifierCyclingSpeed;
  v34[2] = HKQuantityTypeIdentifierCyclingPower;
  v34[3] = HKQuantityTypeIdentifierDistanceCycling;
  v34[4] = HKQuantityTypeIdentifierHeartRate;
  v14 = +[NSArray arrayWithObjects:v34 count:5];
  id v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v18);
        __int16 v21 = +[FitnessService hkQuantityTypeForIdentifier:v19];
        if (v21)
        {
          [v13 addObject:v21];
        }
        else
        {
          v22 = qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "FitnessDeviceManager init - Could not get HKQuantityType for %@", buf, 0xCu);
          }
        }

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v16);
  }

  id v23 = [v13 copy];
  [(FitnessDeviceManager *)v26 setKnownQuantityTypes:v23];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v26, (CFNotificationCallback)sub_10004E7A0, @"com.apple.bluetooth.settings.fitness-device-pairing-state-changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v26, (CFNotificationCallback)sub_10004E7A8, @"HKHealthPeripheralStatusDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  return v26;
}

- (void)registerWithHealthKit:(BOOL)a3
{
  if (!_os_feature_enabled_impl() || a3)
  {
    if (self->_dataCollectionObserver)
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
        sub_100073E80();
      }
      BOOL v7 = [(FitnessDeviceManager *)self requestedQuantityTypes];
      BOOL v8 = [v7 count] == 0;

      if (!v8) {
        [(FitnessDeviceManager *)self connectTaggedDevices];
      }
    }
    else
    {
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2050000000;
      BOOL v9 = (void *)qword_1000CD110;
      uint64_t v24 = qword_1000CD110;
      if (!qword_1000CD110)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        long long v27 = sub_100053BD8;
        long long v28 = &unk_1000B11E0;
        long long v29 = &v21;
        sub_100053C28();
        Class Class = objc_getClass("HKActiveDataCollectionObserver");
        *(void *)(v29[1] + 24) = Class;
        qword_1000CD110 = *(void *)(v29[1] + 24);
        BOOL v9 = (void *)v22[3];
      }
      uint64_t v11 = v9;
      _Block_object_dispose(&v21, 8);
      if (v11)
      {
        [(FitnessDeviceManager *)self markFitnessTaskEnabled:1];
        id v12 = [v11 alloc];
        __int16 v13 = [(FitnessDeviceManager *)self hkHealthStore];
        v14 = (HKActiveDataCollectionObserver *)[v12 initWithHealthStore:v13];
        dataCollectionObserver = self->_dataCollectionObserver;
        self->_dataCollectionObserver = v14;

        [(HKActiveDataCollectionObserver *)self->_dataCollectionObserver setDelegate:self];
        id v16 = self->_dataCollectionObserver;
        uint64_t v17 = [(FitnessDeviceManager *)self knownQuantityTypes];
        [(HKActiveDataCollectionObserver *)v16 subscribeForQuantityTypes:v17];

        v18 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = v18;
          CFStringRef v20 = [(FitnessDeviceManager *)self knownQuantityTypes];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "registerWithHealthKit - Registered Fitness callback with HealthKit for %@", (uint8_t *)&buf, 0xCu);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        sub_100073E4C();
      }
    }
  }
  else
  {
    id v5 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting HRM collection", (uint8_t *)&buf, 2u);
    }
    HKQuantityTypeIdentifier v25 = HKQuantityTypeIdentifierHeartRate;
    id v6 = +[NSArray arrayWithObjects:&v25 count:1];
    [(FitnessDeviceManager *)self collectDataForQuantityTypeIdentifiers:v6 isWorkout:0];
  }
}

- (HKHealthStore)hkHealthStore
{
  if (!self->fHKHealthStore)
  {
    uint64_t v12 = 0;
    __int16 v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v5 = (void *)qword_1000CD120;
    uint64_t v15 = qword_1000CD120;
    if (!qword_1000CD120)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100053D6C;
      v10[3] = &unk_1000B11E0;
      uint64_t v11 = &v12;
      sub_100053C28();
      v13[3] = (uint64_t)objc_getClass("HKHealthStore");
      qword_1000CD120 = *(void *)(v11[1] + 24);
      id v5 = (void *)v13[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v12, 8);
    if (v6)
    {
      BOOL v7 = (HKHealthStore *)objc_alloc_init(v6);
      fHKHealthStore = self->fHKHealthStore;
      self->fHKHealthStore = v7;

      BOOL v9 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Created HKHealthStore", (uint8_t *)v10, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      sub_100073EC0();
    }
  }
  v3 = self->fHKHealthStore;

  return v3;
}

- (id)hkUnitForHKQuantityType:(id)a3
{
  return [(NSMutableDictionary *)self->_unitForSupportedHKQuantityType objectForKey:a3];
}

- (id)createHKDataCollectorForHKQuantityType:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v5 = (void *)qword_1000CD128;
  uint64_t v16 = qword_1000CD128;
  if (!qword_1000CD128)
  {
    sub_100053C28();
    v14[3] = (uint64_t)objc_getClass("HKDataCollector");
    qword_1000CD128 = v14[3];
    id v5 = (void *)v14[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v13, 8);
  if (v6)
  {
    id v7 = [v6 alloc];
    BOOL v8 = [(FitnessDeviceManager *)self hkHealthStore];
    BOOL v9 = +[NSBundle mainBundle];
    v10 = [v9 bundleIdentifier];
    id v11 = [v7 initWithHealthStore:v8 bundleIdentifier:v10 quantityType:v4];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)isHKQuantityRequested:(id)a3
{
  id v4 = a3;
  id v5 = [(FitnessDeviceManager *)self requestedQuantityTypes];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)collectDataForQuantityTypeIdentifiers:(id)a3 isWorkout:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  if (!v4)
  {
    BOOL v8 = [(FitnessDeviceManager *)self requestedQuantityTypes];
    [v7 addObjectsFromArray:v8];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v13);
        uint64_t v16 = +[FitnessService hkQuantityTypeForIdentifier:](FitnessService, "hkQuantityTypeForIdentifier:", v14, (void)v17);
        if (v16 && ![(FitnessDeviceManager *)self isHKQuantityRequested:v16]) {
          [v7 addObject:v16];
        }

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  [(FitnessDeviceManager *)self collectDataForQuantityTypes:v7 isWorkout:v4];
}

- (void)collectDataForQuantityTypes:(id)a3 isWorkout:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 count];
  if (!v4)
  {
    if (v7)
    {
      uint64_t v13 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v34 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "STARTING NON-WORKOUT COLLECTION FOR: %@", buf, 0xCu);
      }
      goto LABEL_20;
    }
    if (![(FitnessDeviceManager *)self workoutInSession])
    {
LABEL_22:
      id v18 = [v6 copy];
      [(FitnessDeviceManager *)self setRequestedQuantityTypes:v18];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v19 = [(FitnessDeviceManager *)self registeredServices];
      id v20 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v29;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v29 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if ([v24 isFitnessClassicDevice])
            {
              if (![(FitnessDeviceManager *)self workoutInSession])
              {
                HKQuantityTypeIdentifier v25 = [(FitnessDeviceManager *)self requestedQuantityTypes];
                id v26 = [v25 count];

                if (v26) {
                  continue;
                }
              }
            }
            long long v27 = [(FitnessDeviceManager *)self requestedQuantityTypes];
            [v24 updateRequestedQuantityTypes:v27];
          }
          id v21 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v21);
      }

      [(FitnessDeviceManager *)self updateScan];
      [(FitnessDeviceManager *)self disconnectDevicesWithoutRunningService];
      [(FitnessDeviceManager *)self cancelStaleConnectionRequests];
      [(FitnessDeviceManager *)self storeCollectionState];
      goto LABEL_34;
    }
    goto LABEL_13;
  }
  if (v7)
  {
    BOOL v8 = [(FitnessDeviceManager *)self requestedQuantityTypes];
    id v9 = [v8 count];

    if (v9)
    {
      [(FitnessDeviceManager *)self setWorkoutInSession:1];
      id v10 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = v10;
        uint64_t v12 = [(FitnessDeviceManager *)self requestedQuantityTypes];
        *(_DWORD *)long long buf = 138412546;
        id v34 = v12;
        __int16 v35 = 2112;
        id v36 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CHANGING WORKOUT FROM:%@ TO %@", buf, 0x16u);
      }
      goto LABEL_22;
    }
    if ([v6 count]) {
      goto LABEL_17;
    }
    if (![(FitnessDeviceManager *)self workoutInSession]) {
      goto LABEL_36;
    }
LABEL_13:
    [(FitnessDeviceManager *)self setWorkoutInSession:0];
    [(FitnessDeviceManager *)self setHeartRateScanDidTimeOut:0];
    uint64_t v14 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ENDING WORKOUT", buf, 2u);
    }
    uint64_t v15 = self;
    uint64_t v16 = 0;
    goto LABEL_21;
  }
  if ([v6 count])
  {
LABEL_17:
    long long v17 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "STARTING WORKOUT FOR:%@", buf, 0xCu);
    }
    [(FitnessDeviceManager *)self setWorkoutInSession:1];
LABEL_20:
    uint64_t v15 = self;
    uint64_t v16 = 1;
LABEL_21:
    [(FitnessDeviceManager *)v15 markFitnessTaskEnabled:v16];
    goto LABEL_22;
  }
  if ([(FitnessDeviceManager *)self workoutInSession]) {
    goto LABEL_13;
  }
LABEL_36:
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_100073EF4();
  }
LABEL_34:
}

- (id)findMatchingDistributedFitnessService:(id)a3
{
  id v4 = a3;
  if ([v4 isDistributed])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [(FitnessDeviceManager *)self registeredServices];
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v9 matchesDistributedService:v4])
          {
            id v6 = v9;
            goto LABEL_13;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)registerFitnessService:(id)a3
{
  id v4 = a3;
  id v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = [v4 service];
    BOOL v8 = [v7 UUID];
    id v9 = [v4 peripheral];
    id v10 = [v9 name];
    int v17 = 138412546;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registering service %@ for:“%@”", (uint8_t *)&v17, 0x16u);
  }
  if ([v4 isFitnessClassicDevice]
    && ![(FitnessDeviceManager *)self workoutInSession]
    && ([(FitnessDeviceManager *)self requestedQuantityTypes],
        long long v11 = objc_claimAutoreleasedReturnValue(),
        id v12 = [v11 count],
        v11,
        v12))
  {
    [v4 updateRequestedQuantityTypes:&__NSArray0__struct];
  }
  else
  {
    long long v13 = [(FitnessDeviceManager *)self requestedQuantityTypes];
    [v4 updateRequestedQuantityTypes:v13];
  }
  long long v14 = [(FitnessDeviceManager *)self registeredServices];
  id v15 = [v14 mutableCopy];

  [v15 addObject:v4];
  id v16 = [v15 copy];
  [(FitnessDeviceManager *)self setRegisteredServices:v16];
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = [(FitnessDeviceManager *)self centralManager];
  id v5 = [v4 state];

  if (v5 == (id)5)
  {
    id v6 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FitnessDeviceManager's CentralManager state is now POWERED ON", v7, 2u);
    }
    [(FitnessDeviceManager *)self updateScan];
    [(FitnessDeviceManager *)self migrateHKPairedHealthDevices];
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v7 = a4;
  unsigned int v8 = [(FitnessDeviceManager *)self shouldConnectDevice:v7];
  id v9 = (void *)qword_1000CD178;
  BOOL v10 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      long long v11 = v9;
      id v12 = [v7 identifier];
      long long v13 = [v7 name];
      long long v14 = +[FitnessDeviceManager connectStateStr:](FitnessDeviceManager, "connectStateStr:", [v7 state]);
      int v19 = 138412802;
      id v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didDiscoverPeripheral %@ “%@” (%@), connecting", (uint8_t *)&v19, 0x20u);
    }
    id v15 = [v7 identifier];
    [(FitnessDeviceManager *)self connectPeripheral:v15];
  }
  else if (v10)
  {
    id v16 = v9;
    int v17 = [v7 identifier];
    id v18 = [v7 name];
    int v19 = 138412546;
    id v20 = v17;
    __int16 v21 = 2112;
    uint64_t v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "didDiscoverPeripheral %@ “%@” -> UNTAGGED, NOT CONNECTING", (uint8_t *)&v19, 0x16u);
  }
}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  id v5 = a4;
  if ([v5 state]) {
    goto LABEL_19;
  }
  id v6 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    unsigned int v8 = [v5 name];
    int v16 = 138412290;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "“%@” disconnected", (uint8_t *)&v16, 0xCu);
  }
  id v9 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removing fitness services for peripheral %@", (uint8_t *)&v16, 0xCu);
  }
  [(FitnessDeviceManager *)self removeFitnessServicesForPeripheral:v5];
  BOOL v10 = [(FitnessDeviceManager *)self requestedQuantityTypes];
  if (![v10 count])
  {
    id v12 = [(FitnessDeviceManager *)self getConnectedPeripheralUUIDsCollecting:1 andIdle:0];
    if ([v12 count])
    {
      unsigned __int8 v13 = [(FitnessDeviceManager *)self workoutInSession];

      if (v13) {
        goto LABEL_11;
      }
    }
    else
    {
    }
LABEL_16:
    if (![(FitnessDeviceManager *)self workoutInSession])
    {
      [(FitnessDeviceManager *)self setRequestedQuantityTypes:&__NSArray0__struct];
      [(FitnessDeviceManager *)self storeCollectionState];
    }
    [(FitnessDeviceManager *)self markFitnessTaskEnabled:0];
    goto LABEL_19;
  }
  unsigned __int8 v11 = [(FitnessDeviceManager *)self workoutInSession];

  if ((v11 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  long long v14 = [(FitnessDeviceManager *)self requestedQuantityTypes];
  if ([v14 count])
  {
    unsigned int v15 = [(FitnessDeviceManager *)self workoutInSession];

    if (v15) {
      [(FitnessDeviceManager *)self updateScan];
    }
  }
  else
  {
  }
LABEL_19:
}

- (void)activeDataCollectionObserver:(id)a3 updatedCollectedTypes:(id)a4
{
  id v5 = a4;
  id v6 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FitnessDeviceManager callback from HK - collect %@", (uint8_t *)&v7, 0xCu);
  }
  [(FitnessDeviceManager *)self collectDataForQuantityTypes:v5 isWorkout:1];
}

+ (id)connectStateStr:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return *(&off_1000B21F0 + a3);
  }
}

- (void)removeFitnessServicesForPeripheral:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ![v4 state])
  {
    uint64_t v24 = self;
    HKQuantityTypeIdentifier v25 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v6 = [(FitnessDeviceManager *)self registeredServices];
    id v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v31;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned __int8 v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v12 = [v11 peripheral];
          unsigned __int8 v13 = [v12 identifier];
          long long v14 = [v5 identifier];
          unsigned int v15 = [v13 isEqual:v14];

          if (v15) {
            [v25 addObject:v11];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v8);
    }

    int v16 = [(FitnessDeviceManager *)v24 registeredServices];
    id v17 = [v16 mutableCopy];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v18 = v25;
    id v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          [v17 removeObject:*(void *)(*((void *)&v26 + 1) + 8 * (void)j)];
        }
        id v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v20);
    }

    id v23 = [v17 copy];
    [(FitnessDeviceManager *)v24 setRegisteredServices:v23];
  }
}

- (void)markFitnessTaskEnabled:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(FitnessDeviceManager *)self persistanceAssertion];

    id v5 = qword_1000CD178;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fitness task already marked started", buf, 2u);
      }
    }
    else
    {
      if (v6)
      {
        *(_WORD *)unsigned __int8 v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Mark fitness task started", v11, 2u);
      }
      id v8 = (void *)os_transaction_create();
      [(FitnessDeviceManager *)self setPersistanceAssertion:v8];
    }
  }
  else
  {
    id v7 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Mark fitness task completed", v9, 2u);
    }
    [(FitnessDeviceManager *)self setPersistanceAssertion:0];
  }
}

- (id)getRequestedTags
{
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(FitnessDeviceManager *)self requestedQuantityTypes];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) identifier];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];

  return v10;
}

- (void)connectTaggedDevices
{
  v3 = [(FitnessDeviceManager *)self centralManager];
  id v4 = [(FitnessDeviceManager *)self getRequestedTags];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100050240;
  v5[3] = &unk_1000B20C0;
  v5[4] = self;
  [v3 retrievePeripheralsWithTags:v4 completion:v5];
}

- (void)updateScan
{
  if ([(CBCentralManager *)self->_centralManager state] == (id)5)
  {
    v3 = [(FitnessDeviceManager *)self centralManager];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100050790;
    v26[3] = &unk_1000B20C0;
    v26[4] = self;
    [v3 retrievePeripheralsWithCustomProperties:&off_1000B7C10 completion:v26];

    if (![(FitnessDeviceManager *)self workoutInSession])
    {
      [(FitnessDeviceManager *)self setHeartRateScanDidTimeOut:0];
      id v4 = [(FitnessDeviceManager *)self requestedQuantityTypes];
      id v5 = [v4 count];

      if (v5)
      {
        id v6 = [(FitnessDeviceManager *)self centralManager];
        uint64_t v7 = [(FitnessDeviceManager *)self requestedServices];
        id v8 = [v6 retrieveConnectedPeripheralsWithServices:v7];

        uint64_t v9 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = v9;
          unsigned int v11 = [v8 count];
          long long v12 = [(FitnessDeviceManager *)self requestedServices];
          *(_DWORD *)long long buf = 67109378;
          unsigned int v29 = v11;
          __int16 v30 = 2112;
          long long v31 = v12;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found %d connected peripherals with services: %@", buf, 0x12u);
        }
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v13 = v8;
        id v14 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v23;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v23 != v16) {
                objc_enumerationMutation(v13);
              }
              id v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              id v19 = [v18 customProperty:@"Fitness" :v22];

              if (v19)
              {
                if ([(FitnessDeviceManager *)self shouldConnectDevice:v18])
                {
                  id v20 = +[ConnectionManager instance];
                  uint64_t v21 = [v18 identifier];
                  [v20 connectOnce:v21];
                }
              }
            }
            id v15 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
          }
          while (v15);
        }
      }
    }
  }
}

- (void)updatePairedDevices:(id)a3
{
  id v4 = a3;
  id v5 = [(FitnessDeviceManager *)self pairedFitnessDeviceUUIDS];
  if ([v5 count])
  {
    id v6 = [(FitnessDeviceManager *)self pairedFitnessDeviceUUIDS];
    id v7 = [v6 count];
    id v8 = [v4 count];

    if (v7 > v8)
    {
      uint64_t v9 = [(FitnessDeviceManager *)self pairedFitnessDeviceUUIDS];
      id v10 = +[NSMutableSet setWithArray:v9];

      unsigned int v11 = +[NSSet setWithArray:v4];
      [v10 minusSet:v11];

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            id v18 = (void *)qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
            {
              id v19 = v18;
              id v20 = [v17 UUIDString];
              *(_DWORD *)long long buf = 138412290;
              long long v26 = v20;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Disconnecting unpaired device: %@", buf, 0xCu);
            }
            [(FitnessDeviceManager *)self disconnectDevice:v17];
          }
          id v14 = [v12 countByEnumeratingWithState:&v21 objects:v27 count:16];
        }
        while (v14);
      }
    }
  }
  else
  {
  }
  [(FitnessDeviceManager *)self setPairedFitnessDeviceUUIDS:v4];
}

- (void)disconnectDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[ConnectionManager instance];
  id v6 = [v5 peripheralForIdentifier:v4];

  if (v6)
  {
    id v26 = v4;
    id v7 = [(FitnessDeviceManager *)self registeredServices];
    id v8 = [v7 copy];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v15 = [v14 peripheral];
          uint64_t v16 = [v15 identifier];
          id v17 = [v6 identifier];

          if (v16 == v17)
          {
            id v18 = (void *)qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
            {
              id v19 = v18;
              id v20 = [v14 debugDescription];
              long long v21 = [v6 name];
              *(_DWORD *)long long buf = 138412546;
              long long v32 = v20;
              __int16 v33 = 2112;
              id v34 = v21;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Unregistering service %@ for peripheral: %@", buf, 0x16u);
            }
            [v14 updateRequestedQuantityTypes:&__NSArray0__struct];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v11);
    }

    id v4 = v26;
    if (([v6 hasTag:@"FitnessClassic"] & 1) == 0)
    {
      long long v22 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = v22;
        long long v24 = [v6 name];
        *(_DWORD *)long long buf = 138412290;
        long long v32 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Disconnecting device: %@", buf, 0xCu);
      }
      long long v25 = +[ConnectionManager instance];
      [v25 cancelPeripheralConnectionForConnectOnceIdentifier:v26];
    }
  }
}

- (void)disconnectDevicesWithoutRunningService
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v2 = [(FitnessDeviceManager *)self getConnectedPeripheralUUIDsCollecting:0 andIdle:1];
  id v3 = [v2 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v26;
    p_vtable = &OBJC_METACLASS___HIDAppleSiriRemoteDevice.vtable;
    CFStringRef v8 = @"FitnessClassic";
    id v9 = (os_log_t *)&qword_1000CD178;
    *(void *)&long long v4 = 138412546;
    long long v23 = v4;
    do
    {
      id v10 = 0;
      id v24 = v5;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v10);
        uint64_t v12 = [p_vtable + 242 instance:v23];
        id v13 = [v12 peripheralForIdentifier:v11];

        if (v13 && ([v13 hasTag:v8] & 1) == 0)
        {
          os_log_t v14 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = v14;
            [v13 name];
            uint64_t v16 = v6;
            id v17 = p_vtable;
            id v18 = v2;
            CFStringRef v19 = v8;
            v21 = id v20 = v9;
            *(_DWORD *)long long buf = v23;
            uint64_t v30 = v11;
            __int16 v31 = 2112;
            long long v32 = v21;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No running service for %@ (%@), disconnecting", buf, 0x16u);

            id v9 = v20;
            CFStringRef v8 = v19;
            v2 = v18;
            p_vtable = v17;
            uint64_t v6 = v16;
            id v5 = v24;
          }
          long long v22 = [p_vtable + 242 instance];
          [v22 cancelPeripheralConnectionForConnectOnceIdentifier:v11];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v5 != v10);
      id v5 = [v2 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v5);
  }
}

- (void)cancelStaleConnectionRequests
{
  id v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up stale connection requests", buf, 2u);
  }
  long long v4 = [(FitnessDeviceManager *)self centralManager];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005124C;
  v5[3] = &unk_1000B20C0;
  v5[4] = self;
  [v4 retrievePeripheralsWithCustomProperties:&off_1000B7C28 completion:v5];
}

- (void)connectPeripheral:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    long long v4 = +[ConnectionManager instance];
    id v5 = [v4 peripheralForIdentifier:v3];

    if (v5 && [v5 state] && objc_msgSend(v5, "state") != (id)3)
    {
      uint64_t v12 = (void *)qword_1000CD178;
      if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      uint64_t v11 = v12;
      id v13 = [v5 name];
      int v14 = 138412546;
      id v15 = v3;
      __int16 v16 = 2112;
      CFStringRef v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ALREADY MARKED CONNECTED %@ “%@”", (uint8_t *)&v14, 0x16u);
    }
    else
    {
      uint64_t v6 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = v6;
        uint64_t v8 = [v5 name];
        id v9 = (void *)v8;
        CFStringRef v10 = @"(loading)";
        if (v8) {
          CFStringRef v10 = (const __CFString *)v8;
        }
        int v14 = 138412546;
        id v15 = v3;
        __int16 v16 = 2112;
        CFStringRef v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CONNECTING %@ “%@”", (uint8_t *)&v14, 0x16u);
      }
      uint64_t v11 = +[ConnectionManager instance];
      [v11 connectOnce:v3 connectionTimeoutEnabled:0];
    }

LABEL_11:
    goto LABEL_14;
  }
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_1000740D8();
  }
LABEL_14:
}

- (BOOL)isPeripheralConnected:(id)a3
{
  id v3 = a3;
  long long v4 = +[ConnectionManager instance];
  id v5 = [v4 peripheralForIdentifier:v3];

  if (v5) {
    BOOL v6 = [v5 state] == (id)2;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)shouldConnectDevice:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  BOOL v6 = [v4 identifier];

  if (!v6
    || ([v5 hasTag:@"FitnessClassic"] & 1) != 0
    || ![(FitnessDeviceManager *)self shouldCollectFromDevice:v5])
  {
    goto LABEL_9;
  }
  if (!_os_feature_enabled_impl()) {
    goto LABEL_12;
  }
  id v7 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
  if (![(FitnessDeviceManager *)self isHKQuantityRequested:v7]
    || ![v5 hasTag:HKQuantityTypeIdentifierHeartRate])
  {

    goto LABEL_12;
  }
  unsigned __int8 v8 = [(FitnessDeviceManager *)self heartRateScanDidTimeOut];

  if ((v8 & 1) == 0)
  {
LABEL_12:
    BOOL v9 = 1;
    goto LABEL_10;
  }
LABEL_9:
  BOOL v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)shouldCollectFromDevice:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(FitnessDeviceManager *)self requestedQuantityTypes];
  BOOL v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (!v6) {
    goto LABEL_17;
  }
  uint64_t v7 = *(void *)v20;
  while (2)
  {
    for (i = 0; i != v6; i = ((char *)i + 1))
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(v5);
      }
      BOOL v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      CFStringRef v10 = [v9 identifier];
      unsigned int v11 = [v4 hasTag:v10];

      if (v11)
      {
        if (_os_feature_enabled_impl())
        {
          uint64_t v12 = [v9 identifier];
          if ([v12 isEqualToString:HKQuantityTypeIdentifierHeartRate])
          {
            id v13 = [v4 customProperty:@"UpdateHealth"];
            unsigned __int8 v14 = [v13 isEqualToString:@"1"];

            if ((v14 & 1) == 0)
            {
              id v15 = (void *)qword_1000CD178;
              LOBYTE(v6) = 0;
              if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
              {
                BOOL v6 = v15;
                __int16 v16 = [v4 identifier];
                CFStringRef v17 = [v16 UUIDString];
                *(_DWORD *)long long buf = 138412290;
                id v24 = v17;
                _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Skipping connection to peripheral %@. Peripheral disabled in Health Settings", buf, 0xCu);

                LOBYTE(v6) = 0;
              }
              goto LABEL_17;
            }
          }
          else
          {
          }
        }
        LOBYTE(v6) = 1;
        goto LABEL_17;
      }
    }
    BOOL v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_17:

  return (char)v6;
}

- (BOOL)shouldForwardFitnessService:(id)a3 quantityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(FitnessDeviceManager *)self servicesForHKQuantityType:v7];
  id v9 = [v8 mutableCopy];

  [v9 removeObject:v6];
  if ([v9 count])
  {
    objc_opt_class();
    isKindOfClass Class = objc_opt_isKindOfClass();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v9;
    id v11 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v11)
    {
      id v12 = v11;
      id v34 = v9;
      uint64_t v13 = *(void *)v37;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          __int16 v16 = [v7 identifier:v34];
          unsigned int v17 = [HKQuantityTypeIdentifierCyclingPower isEqualToString:v16];

          if (v17)
          {
            if ([v15 wasPairedAfter:v6]
              && [v15 latestSampleTimestampWithinSeconds:5.0]
              && ([v6 matchesDistributedService:v15] & 1) == 0)
            {
              long long v20 = (void *)qword_1000CD178;
              if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_34;
              }
              goto LABEL_36;
            }
          }
          else
          {
            objc_opt_class();
            char v18 = objc_opt_isKindOfClass();
            if (isKindOfClass)
            {
              if (v18)
              {
                if ([v15 wasPairedAfter:v6]
                  && [v15 latestSampleTimestampWithinSeconds:5.0])
                {
                  uint64_t v30 = (void *)qword_1000CD178;
                  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
                  {
                    long long v23 = v30;
                    id v24 = [v7 identifier];
                    long long v25 = [v6 peripheral];
                    long long v26 = [v25 name];
                    long long v27 = [v15 peripheral];
                    long long v28 = [v27 name];
                    *(_DWORD *)long long buf = 138412802;
                    v41 = v24;
                    __int16 v42 = 2112;
                    v43 = v26;
                    __int16 v44 = 2112;
                    v45 = v28;
                    long long v29 = "Ignoring %@ from power meter “%@” because power meter “%@” started earlier";
                    goto LABEL_35;
                  }
                  goto LABEL_36;
                }
              }
              else if ([v15 latestSampleTimestampWithinSeconds:5.0])
              {
                long long v22 = (void *)qword_1000CD178;
                if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
                {
                  long long v23 = v22;
                  id v24 = [v7 identifier];
                  long long v25 = [v6 peripheral];
                  long long v26 = [v25 name];
                  long long v27 = [v15 peripheral];
                  long long v28 = [v27 name];
                  *(_DWORD *)long long buf = 138412802;
                  v41 = v24;
                  __int16 v42 = 2112;
                  v43 = v26;
                  __int16 v44 = 2112;
                  v45 = v28;
                  long long v29 = "Ignoring %@ from power meter “%@” because “%@” is a dedicated sensor";
                  goto LABEL_35;
                }
                goto LABEL_36;
              }
            }
            else if ((v18 & 1) == 0 {
                   && [v15 wasPairedAfter:v6]
            }
                   && [v15 latestSampleTimestampWithinSeconds:5.0])
            {
              long long v20 = (void *)qword_1000CD178;
              if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
              {
LABEL_34:
                long long v23 = v20;
                id v24 = [v7 identifier];
                long long v25 = [v6 peripheral];
                long long v26 = [v25 name];
                long long v27 = [v15 peripheral];
                long long v28 = [v27 name];
                *(_DWORD *)long long buf = 138412802;
                v41 = v24;
                __int16 v42 = 2112;
                v43 = v26;
                __int16 v44 = 2112;
                v45 = v28;
                long long v29 = "Ignoring %@ from “%@” because “%@” started earlier";
LABEL_35:
                _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, v29, buf, 0x20u);
              }
LABEL_36:
              BOOL v19 = 0;
              goto LABEL_37;
            }
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      BOOL v19 = 1;
LABEL_37:
      id v9 = v34;
    }
    else
    {
      BOOL v19 = 1;
    }
  }
  else
  {
    BOOL v19 = 1;
  }

  return v19;
}

- (id)getConnectedPeripheralUUIDsCollecting:(BOOL)a3 andIdle:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v20 = (id)objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [(FitnessDeviceManager *)self registeredServices];
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    int v11 = !v4;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        unsigned __int8 v14 = [v13 hkQuantityTypesCollecting];
        if ([v14 count])
        {
          BOOL v15 = 1;
        }
        else
        {
          __int16 v16 = [v13 alwaysCollectQuantityTypes];
          BOOL v15 = [v16 count] != 0;
        }
        if (v5 && v15 || ((v11 | v15) & 1) == 0)
        {
          unsigned int v17 = [v13 peripheral];
          char v18 = [v17 identifier];

          if (v18 && ([v20 containsObject:v18] & 1) == 0) {
            [v20 addObject:v18];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  return v20;
}

- (id)supportedQuantityTypesForServiceUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(NSMutableDictionary *)self->_serviceUUIDForSupportedHKQuantityType allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [(NSMutableDictionary *)self->_serviceUUIDForSupportedHKQuantityType objectForKey:v11];
        unsigned int v13 = [v4 isEqual:v12];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)requestedServices
{
  id v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(FitnessDeviceManager *)self requestedQuantityTypes];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(NSMutableDictionary *)self->_serviceUUIDForSupportedHKQuantityType objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (([v3 containsObject:v9] & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)servicesForHKQuantityType:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(FitnessDeviceManager *)self registeredServices];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 supportsHKQuantityType:v4]) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)hkQuantityTypesForService:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [v4 service];
  id v7 = [v6 UUID];
  id v8 = [(FitnessDeviceManager *)self supportedQuantityTypesForServiceUUID:v7];

  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = [v4 peripheral];
        long long v15 = [v13 identifier];
        unsigned int v16 = [v14 hasTag:v15];

        if (v16) {
          [v5 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v5;
}

- (void)setServiceUUID:(id)a3 forQuantityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_serviceUUIDForSupportedHKQuantityType)
  {
    id v8 = +[FitnessService hkQuantityTypeForIdentifier:v7];
    uint64_t v9 = +[CBUUID UUIDWithString:v6];
    id v10 = (void *)v9;
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      [(NSMutableDictionary *)self->_serviceUUIDForSupportedHKQuantityType setObject:v9 forKey:v8];
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
        sub_10007410C();
      }
    }
  }
}

- (void)setUnit:(id)a3 forQuantityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v8 = (void *)qword_1000CD130;
  uint64_t v18 = qword_1000CD130;
  if (!qword_1000CD130)
  {
    *(void *)long long buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = sub_100053E0C;
    long long v20 = &unk_1000B11E0;
    v21[0] = &v15;
    sub_100053C28();
    Class Class = objc_getClass("HKUnit");
    *(void *)(*(void *)(v21[0] + 8) + 24) = Class;
    qword_1000CD130 = *(void *)(*(void *)(v21[0] + 8) + 24);
    id v8 = (void *)v16[3];
  }
  id v10 = v8;
  _Block_object_dispose(&v15, 8);
  if (self->_unitForSupportedHKQuantityType && v10)
  {
    BOOL v11 = +[FitnessService hkQuantityTypeForIdentifier:](FitnessService, "hkQuantityTypeForIdentifier:", v7, v15);
    uint64_t v12 = [v10 unitFromString:v6];
    long long v13 = (void *)v12;
    if (v11 && v12)
    {
      [(NSMutableDictionary *)self->_unitForSupportedHKQuantityType setObject:v12 forKey:v11];
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
        sub_100074174();
      }
    }
    else
    {
      long long v14 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138413058;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2112;
        long long v20 = v7;
        LOWORD(v21[0]) = 2112;
        *(void *)((char *)v21 + 2) = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not register unit %@(%@) for qty %@(%@)", buf, 0x2Au);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
  {
    sub_1000741DC();
  }
}

- (void)startHeartRateScanTimer
{
  id v3 = [(FitnessDeviceManager *)self heartRateScanTimer];

  if (v3)
  {
    id v4 = [(FitnessDeviceManager *)self heartRateScanTimer];
    [v4 invalidate];
  }
  [(FitnessDeviceManager *)self setHeartRateScanDidTimeOut:0];
  id location = 0;
  objc_initWeak(&location, self);
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_100052BD4;
  uint64_t v9 = &unk_1000B20E8;
  objc_copyWeak(&v10, &location);
  id v5 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v6 block:30.0];
  -[FitnessDeviceManager setHeartRateScanTimer:](self, "setHeartRateScanTimer:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)stopHeartRateScanTimer
{
  id v3 = [(FitnessDeviceManager *)self heartRateScanTimer];

  if (v3)
  {
    id v4 = [(FitnessDeviceManager *)self heartRateScanTimer];
    [v4 invalidate];

    [(FitnessDeviceManager *)self setHeartRateScanTimer:0];
  }
  [(FitnessDeviceManager *)self setHeartRateScanDidTimeOut:1];

  [(FitnessDeviceManager *)self cancelStaleConnectionRequests];
}

- (void)setupAudioRoutingControl
{
  id v3 = [(FitnessDeviceManager *)self audioRoutingControl];

  if (!v3)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2050000000;
    id v4 = (void *)qword_1000CD138;
    uint64_t v12 = qword_1000CD138;
    if (!qword_1000CD138)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100053E5C;
      v8[3] = &unk_1000B11E0;
      v8[4] = &v9;
      sub_100053E5C((uint64_t)v8);
      id v4 = (void *)v10[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v9, 8);
    if (v5)
    {
      id v6 = objc_alloc_init(v5);
      [(FitnessDeviceManager *)self setAudioRoutingControl:v6];

      uint64_t v7 = [(FitnessDeviceManager *)self audioRoutingControl];
      [v7 activateWithCompletion:&stru_1000B2108];
    }
    else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      sub_100074254();
    }
  }
}

- (void)notifyHRMSessionStateChanged
{
  if ([(FitnessDeviceManager *)self workoutInSession])
  {
    id v3 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
    BOOL v4 = [(FitnessDeviceManager *)self isHKQuantityRequested:v3];
  }
  else
  {
    BOOL v4 = 0;
  }
  id v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100074318(v4, v5);
  }
  id v6 = [(FitnessDeviceManager *)self audioRoutingControl];
  [v6 hrmSessionStateChanged:v4 completion:&stru_1000B2128];
}

- (BOOL)isHKHeartRateEnabled
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 persistentDomainForName:kHKPrivacyPreferencesDomain];

  BOOL v4 = [v3 objectForKey:kHKPrivacyPreferencesKeyEnableHeartRate];
  id v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (void)handleDevicePairingChangeCallback
{
  id v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "A fitness device's pairing state changed", v6, 2u);
  }
  BOOL v4 = [(FitnessDeviceManager *)self knownQuantityTypes];
  id v5 = [v4 count];

  if (v5) {
    [(FitnessDeviceManager *)self updateScan];
  }
}

- (void)handlePeripheralStatusChangeCallback
{
  id v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "A fitness device's UpdateHealth state changed", buf, 2u);
  }
  BOOL v4 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
  id v5 = [(FitnessDeviceManager *)self servicesForHKQuantityType:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) refreshUpdateHealthEnabledStatus:v13];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [(FitnessDeviceManager *)self knownQuantityTypes];
  id v12 = [v11 count];

  if (v12) {
    [(FitnessDeviceManager *)self updateScan];
  }
}

- (void)migrateHKPairedHealthDevices
{
  if (_os_feature_enabled_impl())
  {
    id v3 = +[NSUserDefaults standardUserDefaults];
    BOOL v4 = [v3 persistentDomainForName:@"com.apple.BTLEServer"];
    id v5 = [v4 objectForKey:@"HRM_MIGRATION_COMPLETE"];
    if (([v5 isEqualToString:@"1"] & 1) == 0)
    {
      if (+[HKHealthStore isHealthDataAvailable])
      {
        id location = 0;
        objc_initWeak(&location, self);
        id v6 = [(FitnessDeviceManager *)self hkHealthStore];
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = sub_1000533A4;
        v7[3] = &unk_1000B21A0;
        objc_copyWeak(&v10, &location);
        id v8 = v4;
        id v9 = v3;
        [v6 healthPeripheralsWithFilter:1 handler:v7];

        objc_destroyWeak(&v10);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (BOOL)workoutInSession
{
  return self->_workoutInSession;
}

- (void)setWorkoutInSession:(BOOL)a3
{
  self->_workoutInSession = a3;
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (void)setHkHealthStore:(id)a3
{
}

- (OS_os_transaction)persistanceAssertion
{
  return self->_persistanceAssertion;
}

- (void)setPersistanceAssertion:(id)a3
{
}

- (HKActiveDataCollectionObserver)dataCollectionObserver
{
  return self->_dataCollectionObserver;
}

- (void)setDataCollectionObserver:(id)a3
{
}

- (NSArray)registeredServices
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRegisteredServices:(id)a3
{
}

- (NSArray)requestedQuantityTypes
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRequestedQuantityTypes:(id)a3
{
}

- (NSArray)knownQuantityTypes
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setKnownQuantityTypes:(id)a3
{
}

- (NSMutableDictionary)serviceUUIDForSupportedHKQuantityType
{
  return self->_serviceUUIDForSupportedHKQuantityType;
}

- (void)setServiceUUIDForSupportedHKQuantityType:(id)a3
{
}

- (NSMutableDictionary)unitForSupportedHKQuantityType
{
  return self->_unitForSupportedHKQuantityType;
}

- (void)setUnitForSupportedHKQuantityType:(id)a3
{
}

- (NSArray)pairedFitnessDeviceUUIDS
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPairedFitnessDeviceUUIDS:(id)a3
{
}

- (NSTimer)heartRateScanTimer
{
  return self->_heartRateScanTimer;
}

- (void)setHeartRateScanTimer:(id)a3
{
}

- (BOOL)heartRateScanDidTimeOut
{
  return self->_heartRateScanDidTimeOut;
}

- (void)setHeartRateScanDidTimeOut:(BOOL)a3
{
  self->_heartRateScanDidTimeOut = a3;
}

- (AAAudioRoutingControl)audioRoutingControl
{
  return self->_audioRoutingControl;
}

- (void)setAudioRoutingControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioRoutingControl, 0);
  objc_storeStrong((id *)&self->_heartRateScanTimer, 0);
  objc_storeStrong((id *)&self->_pairedFitnessDeviceUUIDS, 0);
  objc_storeStrong((id *)&self->_unitForSupportedHKQuantityType, 0);
  objc_storeStrong((id *)&self->_serviceUUIDForSupportedHKQuantityType, 0);
  objc_storeStrong((id *)&self->_knownQuantityTypes, 0);
  objc_storeStrong((id *)&self->_requestedQuantityTypes, 0);
  objc_storeStrong((id *)&self->_registeredServices, 0);
  objc_storeStrong((id *)&self->_dataCollectionObserver, 0);
  objc_storeStrong((id *)&self->_persistanceAssertion, 0);
  objc_storeStrong((id *)&self->_hkHealthStore, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);

  objc_storeStrong((id *)&self->fHKHealthStore, 0);
}

@end