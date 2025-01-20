@interface CLDurianDeviceManager
- (BOOL)airplaneModeEnabled;
- (BOOL)attemptConnectToDevice:(id)a3 onCondition:(unint64_t)a4;
- (BOOL)checkIfAllDevicesLastRecentlyDisconnected;
- (BOOL)checkIfTwoDevicesHaveSamePeripheral:(id)a3 device:(id)a4;
- (BOOL)deviceBackedWithBeacon:(id)a3;
- (BOOL)isDiscoveryRequiredForDevice:(id)a3 onCondition:(unint64_t)a4 withPeripheral:(id)a5;
- (BOOL)isMaintTimerOn;
- (BOOL)isMaintenanceActive;
- (BOOL)isMaintenancePowerAsserted;
- (BOOL)isNonHeleMaintenanceActive;
- (BOOL)isSameMaintQuarterHourForDevice:(id)a3;
- (BOOL)maintDiscoveryPending;
- (BOOL)maintenanceOnWildObservationEnabled;
- (BOOL)networkAvailable;
- (BOOL)onlyHeleMaintainableDevices;
- (BOOL)ready;
- (BOOL)sendSeparationStateForDevice:(id)a3 state:(id)a4 includeLocation:(BOOL)a5;
- (BOOL)shouldAttemptForcedHeleMaintenanceOnDevice:(id)a3;
- (BOOL)shouldConnectUsingLeashToDevice:(id)a3;
- (BOOL)shouldEvictForDevice:(id)a3;
- (BOOL)shouldHoldLeashForDevice:(id)a3;
- (BOOL)sufficientTimeElapsedSinceDisconnectionOfDevice:(id)a3;
- (BOOL)sufficientTimeElapsedSinceLastProactiveMaintenanceOfDevice:(id)a3;
- (CBCentralManager)centralManager;
- (CLDurianDeviceDelegate)deviceDelegate;
- (CLDurianDeviceManager)init;
- (CLDurianDeviceManager)initWithUniverse:(id)a3;
- (CLDurianMaintenanceMetrics)maintMetrics;
- (CLDurianMaintenanceUtilities)maintUtils;
- (CLDurianMetricManager)metricManager;
- (CLDurianScanCache)scanCache;
- (CLLocation)lastLocation;
- (NSArray)simpleBeacons;
- (NSMutableDictionary)connectionTimeoutBlocks;
- (NSMutableDictionary)devices;
- (NSMutableDictionary)keyFetchTimeoutBlocks;
- (NSMutableDictionary)maintenanceEvictionMap;
- (NSMutableDictionary)scheduledConnectionEvaluationBlocks;
- (NSMutableDictionary)scheduledDisconnectionBlocks;
- (NSMutableSet)devicesBeingMaintained;
- (NSMutableSet)leashableUUIDs;
- (NSMutableSet)maintenanceEvictionCandidates;
- (NSString)loiType;
- (OS_dispatch_queue)queue;
- (char)getQuarterHour;
- (double)getDeltaSecondsFromMachTime:(unint64_t)a3;
- (double)requestCarScanTimeViaDevice:(id)a3;
- (id)_retrievePeripheralForMaterial:(id)a3;
- (id)_retrievePeripheralForMaterial:(id)a3 isFindMyNetwork:(BOOL)a4;
- (id)connectToDeviceWithAddress:(id)a3;
- (id)convertLoiTypeToString:(unint64_t)a3;
- (id)createNonPoshDeviceWithUUID:(id)a3 beaconType:(id)a4;
- (id)createPoshDeviceWithUUID:(id)a3;
- (id)deviceWithActivePeripheral:(id)a3;
- (id)deviceWithPossiblePeripheral:(id)a3;
- (id)deviceWithUUID:(id)a3;
- (id)deviceWithUUID:(id)a3 beaconType:(id)a4 isPosh:(BOOL)a5;
- (id)getAddressForDevice:(id)a3;
- (id)sortDevicesBasedOnConnectionlikelihood:(id)a3;
- (int)coexImpactState;
- (int)maintainableDeviceCount;
- (int64_t)getMaintReasonForDevice:(id)a3;
- (int64_t)getStateForCentral:(id)a3;
- (int64_t)lastCentralManagerState;
- (unint64_t)lastFetchLogTime;
- (unint64_t)leashSlotsInUse;
- (unint64_t)maintDutyCycleUpgrade;
- (unint64_t)totalConnectionCount;
- (unsigned)countHeleMaintainableDevices;
- (unsigned)countLeashableDevices;
- (unsigned)countMaintainableDevices;
- (unsigned)getNearOwnerTimeoutForDevice:(id)a3 checkingForNetwork:(BOOL)a4 checkingHele:(BOOL)a5;
- (void)activatePendingConnectionAttemptForDevice:(id)a3;
- (void)addPossiblePeripheralsForDevice:(id)a3 usingMaterials:(id)a4;
- (void)addScanResultAtDate:(id)a3 address:(id)a4 advertisementData:(id)a5 rssi:(int64_t)a6 maintenanceReason:(int64_t)a7 reserved:(id)a8 reconciledInformation:(id)a9;
- (void)attemptConnectionToDevice:(id)a3;
- (void)attemptMaintenanceOnDevice:(id)a3 onCondition:(unint64_t)a4;
- (void)cancelActiveConnectionAttemptsExcludingHele:(BOOL)a3;
- (void)cancelConnectionAttemptToDevice:(id)a3;
- (void)cancelConnectionEvaluationForDevice:(id)a3;
- (void)cancelConnectionTimeoutForPeripheral:(id)a3;
- (void)cancelDisconnectionOnMissingBeaconWithUUID:(id)a3;
- (void)cancelPeripheralConnection:(id)a3 forUUID:(id)a4;
- (void)cancelTokenFetchTimeoutForDevice:(id)a3;
- (void)centralManager:(id)a3 canSendDataToPeripheral:(id)a4;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didReceiveData:(id)a4 fromPeripheral:(id)a5;
- (void)centralManager:(id)a3 didSendBytes:(id)a4 toPeripheral:(id)a5 withError:(id)a6;
- (void)centralManager:(id)a3 didUpdateConnectionParameters:(id)a4 interval:(id)a5 latency:(id)a6 supervisionTimeout:(id)a7;
- (void)centralManager:(id)a3 didUpdateMTUForPeripheral:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)checkMaintainableDevices:(unint64_t)a3;
- (void)checkMaintenanceDiscoveryForDevice:(id)a3 onCondition:(unint64_t)a4;
- (void)checkforLeashEligibilityChanges;
- (void)cleanupStalledConnectionAttemptWithDuration:(double)a3 forDevice:(id)a4;
- (void)coexImpactState:(int)a3;
- (void)completeTokenFetchForDevice:(id)a3;
- (void)connectFailedToDevice:(id)a3 withError:(int64_t)a4;
- (void)connectToDevice:(id)a3 withPeripheral:(id)a4 forcedTimeout:(int64_t)a5;
- (void)connectToDevices:(id)a3;
- (void)connectToPeripheral:(id)a3 withOptions:(id)a4 andTimeout:(unint64_t)a5;
- (void)dealloc;
- (void)deviceWithUUID:(id)a3 beaconType:(id)a4 isPosh:(BOOL)a5 withCompletion:(id)a6;
- (void)deviceWithUUID:(id)a3 withCompletion:(id)a4;
- (void)didFetchAllDurians:(id)a3;
- (void)didFetchBeaconGroup:(id)a3 connectedDeviceAddress:(id)a4 device:(id)a5 state:(unint64_t)a6;
- (void)didFetchConnectionMaterial:(id)a3 criteria:(id)a4 forDevice:(id)a5 error:(id)a6;
- (void)didFetchUnknownBeacons:(id)a3;
- (void)didReceiveBeaconDifference:(id)a3;
- (void)didUpdatePersistentConnectionList:(id)a3;
- (void)disconnectDevice:(id)a3;
- (void)dispatchCompleteTokenFetchOnUUID:(id)a3;
- (void)dispatchConnectionEvaluationOnDevice:(id)a3 withConnectionEvaluationTimeout:(int64_t)a4;
- (void)dispatchProactiveMaintenanceOnDevice:(id)a3 maintenanceReason:(int64_t)a4;
- (void)dispatchRecheckDevicesAfterDiscovery;
- (void)evaluateConnectionStateForDevice:(id)a3;
- (void)evaluateDisconnectedDevices;
- (void)failedToConnectToPossiblePeripheral:(id)a3 withErrorCode:(int64_t)a4;
- (void)fetchAllBeaconsWithCompletion:(id)a3;
- (void)fetchAllDuriansWithCompletion:(id)a3;
- (void)fetchAllUnknownBeaconsWithCompletion:(id)a3;
- (void)fetchConnectionTokensForDevice:(id)a3 onCondition:(unint64_t)a4;
- (void)fetchConnectionTokensForDevice:(id)a3 usingReconciledUUID:(id)a4 andCriteria:(id)a5;
- (void)finishMaintainingDevice:(id)a3 withReason:(id)a4 andCategory:(unint64_t)a5;
- (void)handleCentralManagerStateUpdate:(int64_t)a3;
- (void)handleConnectedPeripheral:(id)a3 forDevice:(id)a4;
- (void)handleConnectionFailureForPeripheral:(id)a3 withErrorCode:(int64_t)a4;
- (void)handleDisconnectedPeripheral:(id)a3 withError:(id)a4;
- (void)handleKeyFetchFailureForDevice:(id)a3 withError:(id)a4;
- (void)handleKeyFetchTimeoutForDevice:(id)a3;
- (void)handleSystemSleep;
- (void)handleSystemWake:(double)a3;
- (void)handleTokenFetchForDevice:(id)a3 onCondition:(unint64_t)a4;
- (void)hydrateBeacons;
- (void)maintainAllDevices:(unint64_t)a3;
- (void)maintenanceTimerFiredWithInterval:(double)a3;
- (void)metricHeartbeat;
- (void)networkConnectivity:(BOOL)a3;
- (void)onGeoCountryConfigurationChanged:(id)a3;
- (void)onObservationForDeviceWithIdentifier:(id)a3 type:(int64_t)a4 date:(id)a5;
- (void)performProactiveMaintenanceOnDevice:(id)a3;
- (void)pruneScanCacheToQuarterHour;
- (void)recheckDevicesAfterDiscovery;
- (void)reconnectDevice:(id)a3;
- (void)removeTAUnknownBeaconBackedDevice:(id)a3;
- (void)requestDisconnectionForDevice:(id)a3;
- (void)requestDiscoveryViaDevice:(id)a3;
- (void)resetDeviceConnections:(id)a3;
- (void)restartActiveConnectionAttempts;
- (void)restartConnectionAttemptToDevice:(id)a3;
- (void)restartMaintenanceConnections;
- (void)scheduleConnectionEvaluationForDevice:(id)a3;
- (void)scheduleConnectionTimeout:(int64_t)a3 toDevice:(id)a4 forPeripeheral:(id)a5;
- (void)scheduleDisconnectionOnMissingBeaconWithUUID:(id)a3;
- (void)scheduleTokenFetchTimeoutForDevice:(id)a3;
- (void)sendObservationForDevice:(id)a3 type:(int64_t)a4 includeLocation:(BOOL)a5;
- (void)sendObservationForIdentifier:(id)a3 type:(int64_t)a4 date:(id)a5 location:(id)a6;
- (void)sendObservationForIdentifier:(id)a3 type:(int64_t)a4 date:(id)a5 locationDate:(id)a6 includeLocation:(BOOL)a7 locationHandler:(id)a8;
- (void)setAirplaneModeEnabled:(BOOL)a3;
- (void)setAlignmentUncertainty:(double)a3 atIndex:(unint64_t)a4 date:(id)a5 forDevice:(id)a6;
- (void)setCentralManager:(id)a3;
- (void)setCoexImpactState:(int)a3;
- (void)setConnectionTimeoutBlocks:(id)a3;
- (void)setCurrentKeyIndex:(unint64_t)a3 forDevice:(id)a4;
- (void)setCurrentWildKeyIndex:(unint64_t)a3 forDevice:(id)a4 forEvent:(id)a5;
- (void)setDeviceDelegate:(id)a3;
- (void)setDevices:(id)a3;
- (void)setDevicesBeingMaintained:(id)a3;
- (void)setKeyFetchTimeoutBlocks:(id)a3;
- (void)setKeyRollIntervalForDevice:(id)a3;
- (void)setKeyRollTimeout:(unint64_t)a3 forDevice:(id)a4;
- (void)setLastCentralManagerState:(int64_t)a3;
- (void)setLastFetchLogTime:(unint64_t)a3;
- (void)setLeashableUUIDs:(id)a3;
- (void)setLoiType:(id)a3;
- (void)setMaintDiscoveryPending:(BOOL)a3;
- (void)setMaintDutyCycleUpgrade:(unint64_t)a3;
- (void)setMaintMetrics:(id)a3;
- (void)setMaintUtils:(id)a3;
- (void)setMaintainableDeviceCount:(int)a3;
- (void)setMaintenanceEvictionMap:(id)a3;
- (void)setMaintenanceOnWildObservationEnabled:(BOOL)a3;
- (void)setMetricManager:(id)a3;
- (void)setNetworkAvailable:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setScheduledConnectionEvaluationBlocks:(id)a3;
- (void)setScheduledDisconnectionBlocks:(id)a3;
- (void)setSimpleBeacons:(id)a3;
- (void)setWildKeyBase:(unint64_t)a3 interval:(unint64_t)a4 fallback:(unint64_t)a5 forDevice:(id)a6;
- (void)startMaintenanceTimer;
- (void)stopMaintenanceTimer;
- (void)submitCompletedMaintenanceMetrics:(id)a3;
- (void)submitFirmwareVersionsForOwnedTags;
- (void)updateBatteryStatus:(unint64_t)a3 forDevice:(id)a4;
- (void)updateDeviceConnectionState:(id)a3 state:(unint64_t)a4;
- (void)updateLoiType:(unint64_t)a3 isEntry:(BOOL)a4;
@end

@implementation CLDurianDeviceManager

- (CLDurianDeviceManager)init
{
  return 0;
}

- (CLDurianDeviceManager)initWithUniverse:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CLDurianDeviceManager;
  id v4 = [(CLDurianDeviceManager *)&v19 init];
  if (v4)
  {
    *((void *)v4 + 33) = [objc_msgSend(objc_msgSend(a3, "silo"), "queue")
    *((void *)v4 + 2) = objc_alloc_init((Class)SPBeaconManager);
    *((void *)v4 + 3) = objc_opt_new();
    id v5 = objc_alloc_init((Class)SPOwnerInterface);
    SEL v6 = NSSelectorFromString(@"persistentConnectionSession");
    if (objc_opt_respondsToSelector())
    {
      *((void *)v4 + 4) = [v5 performSelector:v6];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10161F268;
      v18[3] = &unk_102332398;
      v18[4] = v4;
      SEL v7 = NSSelectorFromString(@"beaconsToMaintainPersistentConnection:");
      SEL v8 = NSSelectorFromString(@"startRefreshingPersistentConnectionWithBlock:");
      [*((id *)v4 + 4) performSelector:v7 withObject:v18];
      [*((id *)v4 + 4) performSelector:v8 withObject:v18];
    }
    *((void *)v4 + 6) = [v5 tagSeparationSession];
    *((void *)v4 + 8) = 0;
    id v9 = objc_alloc((Class)CBCentralManager);
    uint64_t v10 = *((void *)v4 + 33);
    v20[0] = CBCentralManagerOptionReceiveIncomingObjectDiscoveryData;
    v20[1] = CBCentralManagerOptionReceiveSystemEvents;
    v21[0] = &__kCFBooleanTrue;
    v21[1] = &__kCFBooleanTrue;
    v20[2] = CBManagerNeedsRestrictedStateOperation;
    v21[2] = &__kCFBooleanTrue;
    *((void *)v4 + 26) = [v9 initWithDelegate:v4 queue:v10 options:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 3)];
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 27) = objc_alloc_init((Class)NSMutableDictionary);
    *((void *)v4 + 28) = objc_alloc_init((Class)NSMutableDictionary);
    *((void *)v4 + 32) = objc_alloc_init((Class)NSMutableDictionary);
    *((void *)v4 + 31) = objc_alloc_init((Class)NSMutableDictionary);
    v11 = [[CLDurianLocationMonitor alloc] initWithUniverse:a3];
    *((void *)v4 + 7) = v11;
    *((unsigned char *)v4 + 135) = 0;
    [(CLDurianLocationMonitor *)v11 setDelegate:v4];
    *((void *)v4 + 21) = objc_alloc_init((Class)NSMutableDictionary);
    *((void *)v4 + 35) = objc_alloc_init((Class)NSArray);
    *((void *)v4 + 34) = objc_alloc_init((Class)NSMutableSet);
    *((void *)v4 + 20) = objc_alloc_init((Class)NSMutableSet);
    *((void *)v4 + 22) = objc_alloc_init((Class)NSMutableSet);
    *((void *)v4 + 23) = objc_alloc_init((Class)NSMutableDictionary);
    *((void *)v4 + 9) = objc_alloc_init(CLDurianMaintenanceMetrics);
    *((void *)v4 + 30) = [[CLDurianMetricManager alloc] initWithQueue:*((void *)v4 + 33)];
    *((void *)v4 + 24) = objc_alloc_init(CLDurianScanCache);
    *((void *)v4 + 11) = [[CLDurianZoneMonitorWrapper alloc] initWithTimeZone:@"Asia/Seoul", 32.4738662, 38.7975409, 123.760521, 132.275637 zoneBoundary];
    if (qword_102488FC8 != -1) {
      dispatch_once(&qword_102488FC8, &stru_1023326F0);
    }
    *((unsigned char *)v4 + 96) = byte_102488FC0;
    *((unsigned char *)v4 + 137) = +[CLDurianSettings maintenanceOnWildObservationEnabled];
    [*((id *)v4 + 9) resetWithTime:0.0];
    v12 = *((void *)v4 + 33);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10161F2E8;
    handler[3] = &unk_1022B4250;
    handler[4] = v4;
    notify_register_dispatch(GEOCountryConfigurationCountryCodeChangedDarwinNotification, (int *)v4 + 25, v12, handler);
    v13 = *((void *)v4 + 33);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10161F330;
    v16[3] = &unk_1022B4250;
    v16[4] = v4;
    notify_register_dispatch("com.apple.locationd.durian.restart-connection", (int *)v4 + 28, v13, v16);
    *((_WORD *)v4 + 66) = 0;
    [v4 hydrateBeacons];
    v14 = [[CLDurianMaintenanceUtilities alloc] initWithQueue:*((void *)v4 + 33)];
    *((void *)v4 + 25) = v14;
    [(CLDurianMaintenanceUtilities *)v14 setIntervalOverride:(double)+[CLDurianSettings maintenanceIntervalOverride]];
    [*((id *)v4 + 25) setDelegate:v4];
    [v4 setLoiType:@"Unknown"];
  }
  return (CLDurianDeviceManager *)v4;
}

- (void)dealloc
{
  notify_cancel(self->_countryCodeNotificationToken);
  notify_cancel(self->_beaconsChangedNotificationToken);
  notify_cancel(self->_unknownBeaconsSetChangedNotificationToken);
  [(SPBeaconManager *)self->_beaconManager stopUpdatingSimpleBeaconsWithCompletion:&stru_1023323B8];

  [(CLDurianLocationMonitor *)self->_locationMonitor stopLeechingLocation];
  v3.receiver = self;
  v3.super_class = (Class)CLDurianDeviceManager;
  [(CLDurianDeviceManager *)&v3 dealloc];
}

- (double)getDeltaSecondsFromMachTime:(unint64_t)a3
{
  [(CLDurianDeviceManager *)self getMachContinuousTime];

  TMConvertTicksToSeconds();
  return result;
}

- (BOOL)ready
{
  id v2 = [(CBCentralManager *)self->_centralManager state];
  return v2 == (id)5 || v2 == (id)10;
}

- (CLLocation)lastLocation
{
  id v2 = self->_lastLocation;

  return v2;
}

- (void)resetDeviceConnections:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NSMutableDictionary *)self->_devices count];
    unsigned int v7 = [(NSMutableDictionary *)self->_connectionTimeoutBlocks count];
    BOOL initialBeaconsFetched = self->_initialBeaconsFetched;
    uint64_t buf = 68290051;
    __int16 v38 = 2082;
    v39 = "";
    __int16 v40 = 2114;
    id v41 = a3;
    __int16 v42 = 2049;
    id v43 = v6;
    __int16 v44 = 1026;
    unsigned int v45 = v7;
    __int16 v46 = 1026;
    BOOL v47 = initialBeaconsFetched;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian resetDeviceConnections\", \"reason\":%{public, location:escape_only}@, \"count\":%{private}lld, \"timeoutblocks\":%{public}d, \"fetched\":%{public}hhd}", (uint8_t *)&buf, 0x32u);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = [(NSMutableDictionary *)self->_connectionTimeoutBlocks allValues];
  id v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        dispatch_block_cancel(*(dispatch_block_t *)(*((void *)&v31 + 1) + 8 * i));
      }
      id v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v11);
  }
  [(NSMutableDictionary *)self->_connectionTimeoutBlocks removeAllObjects];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v15)
  {
    id v17 = v15;
    uint64_t v18 = *(void *)v28;
    uint64_t v19 = SPTagSeparationStateNone;
    *(void *)&long long v16 = 68289539;
    long long v26 = v16;
    do
    {
      v20 = 0;
      do
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v14);
        }
        v21 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v20);
        id v22 = [v21 connectionState:v26];
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        v23 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = [[[v21 uuid] description] substringToIndex:8];
          uint64_t buf = v26;
          __int16 v38 = 2082;
          v39 = "";
          __int16 v40 = 2113;
          id v41 = v24;
          __int16 v42 = 2049;
          id v43 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian resetDeviceConnections\", \"item\":%{private, location:escape_only}@, \"connstate\":%{private}lld}", (uint8_t *)&buf, 0x26u);
        }
        BOOL v25 = [v21 isConnected]
           && [v21 isLeashable]
           && +[CLDurianSettings lastKnownLocationEnabled];
        [(CLDurianDeviceManager *)self sendObservationForDevice:v21 type:3 includeLocation:v25];
        [(CLDurianDeviceManager *)self sendSeparationStateForDevice:v21 state:v19 includeLocation:0];
        [(CLDurianDeviceManager *)self cancelConnectionEvaluationForDevice:v21];
        -[CLDurianDeviceDelegate onConnectionStateChangeForDeviceWithUUID:fromState:toState:](self->_deviceDelegate, "onConnectionStateChangeForDeviceWithUUID:fromState:toState:", [v21 uuid], 2, 0);
        v20 = (char *)v20 + 1;
      }
      while (v17 != v20);
      id v17 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v17);
  }
  [(NSMutableSet *)self->_devicesBeingMaintained removeAllObjects];
}

- (void)onGeoCountryConfigurationChanged:(id)a3
{
  self->_isRestrictedCountryCode = [a3 isEqualToString:@"KR"];
}

- (unsigned)countMaintainableDevices
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unsigned int v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v2);
      }
      if ([*(id *)(*((void *)&v9 + 1) + 8 * i) ownership] == (id)1) {
        ++v5;
      }
    }
    id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (unsigned)countLeashableDevices
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unsigned int v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v2);
      }
      v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) isLeashable];
    }
    id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (BOOL)checkIfAllDevicesLastRecentlyDisconnected
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v6) secondsSinceLastDisconnection];
        if (v7 > 21600.0) {
          return 0;
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (unsigned)countHeleMaintainableDevices
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unsigned int v5 = 0;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v2);
      }
      SEL v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
      if ([v8 ownership] == (id)1) {
        v5 += [v8 isHeleAccessory];
      }
    }
    id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v5;
}

- (BOOL)onlyHeleMaintainableDevices
{
  unsigned int v3 = [(CLDurianDeviceManager *)self countMaintainableDevices];
  return v3 == [(CLDurianDeviceManager *)self countHeleMaintainableDevices];
}

- (BOOL)isMaintenanceActive
{
  return [(NSMutableSet *)self->_devicesBeingMaintained count] != 0;
}

- (BOOL)isNonHeleMaintenanceActive
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      double v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        SEL v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        if (-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", [v8 uuid])&& !objc_msgSend(v8, "isHeleAccessory"))
        {
          LOBYTE(v4) = 1;
          return (char)v4;
        }
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return (char)v4;
}

- (BOOL)isMaintenancePowerAsserted
{
  return [(CLDurianMaintenanceUtilities *)self->_maintUtils isPowerAssertionAsserted];
}

- (void)hydrateBeacons
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    BOOL initialBeaconsFetched = self->_initialBeaconsFetched;
    *(_DWORD *)uint64_t buf = 68289282;
    int v11 = 0;
    __int16 v12 = 2082;
    long long v13 = "";
    __int16 v14 = 1026;
    BOOL v15 = initialBeaconsFetched;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian simplebeacon hydrate\", \"fetched\":%{public}hhd}", buf, 0x18u);
  }
  if (!self->_initialBeaconsFetched)
  {
    beaconManager = self->_beaconManager;
    v8[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1016200B0;
    v9[3] = &unk_1023323E0;
    v9[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_101620354;
    v8[3] = &unk_102332408;
    [(SPBeaconManager *)beaconManager startUpdatingSimpleBeaconsWithContext:+[SPSimpleBeaconContext deviceManagerContext] collectionDifference:v9 completion:v8];
  }
  CFStringGetCString(SPUnknownBeaconsSetChangedNotification, (char *)buf, 256, 0x8000100u);
  queue = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_101620694;
  handler[3] = &unk_1022B4250;
  handler[4] = self;
  notify_register_dispatch((const char *)buf, &self->_unknownBeaconsSetChangedNotificationToken, queue, handler);
  if (!self->_initialUnknownBeaconsFetched) {
    [(CLDurianDeviceManager *)self fetchAllUnknownBeaconsWithCompletion:&stru_102332448];
  }
}

- (void)fetchAllDuriansWithCompletion:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v9 = 0;
    __int16 v10 = 2082;
    int v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #simplebeacon skipfetchall\"}", buf, 0x12u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1016207E8;
  block[3] = &unk_1022D7BF0;
  block[4] = a3;
  dispatch_async(queue, block);
}

- (void)fetchAllUnknownBeaconsWithCompletion:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v9 = 0;
    __int16 v10 = 2082;
    int v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetching unknown beacons\"}", buf, 0x12u);
  }
  ownerSession = self->_ownerSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10162093C;
  v7[3] = &unk_1022F2250;
  v7[4] = self;
  v7[5] = a3;
  [(SPOwnerSession *)ownerSession unknownBeaconsForUUIDs:&__NSArray0__struct completion:v7];
}

- (void)fetchAllBeaconsWithCompletion:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v8 = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetching all beacons\"}", buf, 0x12u);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_101620B40;
  v6[3] = &unk_1022CEBF8;
  v6[4] = self;
  v6[5] = a3;
  [(CLDurianDeviceManager *)self fetchAllDuriansWithCompletion:v6];
}

- (void)didReceiveBeaconDifference:(id)a3
{
  [(CLDurianDeviceManager *)self setSimpleBeacons:[(NSArray *)[(CLDurianDeviceManager *)self simpleBeacons] arrayByApplyingDifference:a3]];
  v20 = self;
  id v4 = +[NSSet setWithArray:[(CLDurianDeviceManager *)self simpleBeacons]];
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = v4;
  id v6 = [(NSSet *)v4 countByEnumeratingWithState:&v24 objects:v35 count:16];
  double v7 = &qword_102419000;
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v25;
    uint64_t v10 = SPBeaconTypeDurian;
    uint64_t v22 = SPBeaconTypeAccessory;
    uint64_t v21 = SPBeaconTypeHele;
    do
    {
      int v11 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        __int16 v12 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v11);
        if ((objc_msgSend(objc_msgSend(v12, "type"), "isEqual:", v10) & 1) != 0
          || (objc_msgSend(objc_msgSend(v12, "type"), "isEqual:", v22) & 1) != 0
          || objc_msgSend(objc_msgSend(v12, "type"), "isEqual:", v21))
        {
          [v5 addObject:v12];
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332710);
          }
          long long v13 = v7[115];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v14 = v7;
            id v15 = [[[v12 identifier] description] substringToIndex:8];
            id v16 = [v12 name];
            *(_DWORD *)uint64_t buf = 68289539;
            int v29 = 0;
            __int16 v30 = 2082;
            long long v31 = "";
            __int16 v32 = 2113;
            *(void *)long long v33 = v15;
            double v7 = v14;
            *(_WORD *)&v33[8] = 2114;
            id v34 = v16;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian simplebeacon diff\", \"item\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@}", buf, 0x26u);
          }
        }
        int v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [(NSSet *)obj countByEnumeratingWithState:&v24 objects:v35 count:16];
    }
    while (v8);
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v17 = v7[115];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v18 = [v5 count];
    unsigned int v19 = [(NSSet *)obj count];
    *(_DWORD *)uint64_t buf = 68289538;
    int v29 = 0;
    __int16 v30 = 2082;
    long long v31 = "";
    __int16 v32 = 1026;
    *(_DWORD *)long long v33 = v18;
    *(_WORD *)&v33[4] = 1026;
    *(_DWORD *)&v33[6] = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian simplebeacon counts\", \"durians\":%{public}d, \"beacons\":%{public}d}", buf, 0x1Eu);
  }
  -[CLDurianDeviceManager didFetchAllDurians:](v20, "didFetchAllDurians:", [v5 copy]);
}

- (void)didFetchAllDurians:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v104 = 0;
    __int16 v105 = 2082;
    v106 = "";
    __int16 v107 = 1026;
    *(_DWORD *)v108 = [a3 count];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian fetchall beacons\", \"count\":%{public}d}", buf, 0x18u);
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v81 = [a3 countByEnumeratingWithState:&v98 objects:v113 count:16];
  if (!v81)
  {
    int v83 = 0;
    uint64_t v74 = 0;
    int v76 = 0;
    int v80 = 0;
    int v85 = 0;
    int v86 = 256;
    goto LABEL_72;
  }
  int v85 = 0;
  int v83 = 0;
  uint64_t v74 = 0;
  int v76 = 0;
  int v80 = 0;
  int v86 = 256;
  uint64_t v78 = *(void *)v99;
  uint64_t v77 = SPBeaconTypeDurian;
  uint64_t v75 = SPBeaconTypeAccessory;
  uint64_t v73 = SPBeaconTypeHele;
  *(void *)&long long v4 = 68290563;
  long long v72 = v4;
  do
  {
    id v5 = 0;
    do
    {
      if (*(void *)v99 != v78) {
        objc_enumerationMutation(a3);
      }
      id v6 = *(void **)(*((void *)&v98 + 1) + 8 * (void)v5);
      if (objc_msgSend(objc_msgSend(v6, "type", v72), "isEqual:", v77))
      {
        ++v80;
      }
      else if (objc_msgSend(objc_msgSend(v6, "type"), "isEqual:", v75))
      {
        ++v76;
      }
      else
      {
        if (!objc_msgSend(objc_msgSend(v6, "type"), "isEqual:", v73))
        {
          LODWORD(v74) = v74 + 1;
          goto LABEL_68;
        }
        ++HIDWORD(v74);
      }
      if (-[NSMutableDictionary objectForKey:](self->_devices, "objectForKey:", [v6 identifier])) {
        goto LABEL_21;
      }
      double v7 = (const char *)[v6 systemVersion];
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      id v8 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [[[v6 identifier] description] substringToIndex:8];
        id v10 = [v6 identifier];
        id v11 = [v6 name];
        id v12 = [v6 systemVersion];
        unsigned int v13 = [v6 connectableDeviceCount];
        *(_DWORD *)uint64_t buf = v72;
        int v104 = 0;
        __int16 v105 = 2082;
        v106 = "";
        __int16 v107 = 2113;
        *(void *)v108 = v9;
        *(_WORD *)&v108[8] = 2113;
        *(void *)v109 = v10;
        *(_WORD *)&v109[8] = 2114;
        *(void *)&v109[10] = v11;
        *(_WORD *)&v109[18] = 2114;
        *(void *)&v109[20] = v12;
        *(_WORD *)&v109[28] = 2114;
        v110 = v7;
        __int16 v111 = 1026;
        unsigned int v112 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchall update add\", \"item\":%{private, location:escape_only}@, \"full\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"systemVersion\":%{public, location:escape_only}@, \"aisVersion\":%{public, location:escape_only}@, \"conn\":%{public}d}", buf, 0x4Au);
LABEL_21:
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
      }
      __int16 v14 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [[[v6 identifier] description] substringToIndex:8];
        id v16 = [v6 identifier];
        id v17 = [v6 name];
        id v18 = [v6 type];
        unsigned int v19 = +[CLDurianSettings forceEnablePosh];
        *(_DWORD *)uint64_t buf = 68290307;
        int v104 = 0;
        __int16 v105 = 2082;
        v106 = "";
        __int16 v107 = 2113;
        *(void *)v108 = v15;
        *(_WORD *)&v108[8] = 2113;
        *(void *)v109 = v16;
        *(_WORD *)&v109[8] = 2114;
        *(void *)&v109[10] = v17;
        *(_WORD *)&v109[18] = 2114;
        *(void *)&v109[20] = v18;
        *(_WORD *)&v109[28] = 1025;
        LODWORD(v110) = v19;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchall update creating durian device for\", \"item\":%{private, location:escape_only}@, \"full\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"type\":%{public, location:escape_only}@, \"posh\":%{private}hhd}", buf, 0x40u);
      }
      id v20 = [[self deviceWithUUID:[v6 identifier] beaconType:[v6 type] isPosh:+[CLDurianSettings forceEnablePosh](CLDurianSettings, "forceEnablePosh")];
      if ([v20 pendingDisconnect])
      {
        -[CLDurianDeviceManager cancelDisconnectionOnMissingBeaconWithUUID:](self, "cancelDisconnectionOnMissingBeaconWithUUID:", [v20 uuid]);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        uint64_t v21 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = [[[v20 uuid] description] substringToIndex:8];
          id v23 = [[objc_msgSend(v20, "beacon") name];
          unsigned int v24 = [v20 isConnected];
          *(_DWORD *)uint64_t buf = 68289795;
          long long v25 = "NO";
          if (v24) {
            long long v25 = "YES";
          }
          int v104 = 0;
          __int16 v105 = 2082;
          v106 = "";
          __int16 v107 = 2113;
          *(void *)v108 = v22;
          *(_WORD *)&v108[8] = 2114;
          *(void *)v109 = v23;
          *(_WORD *)&v109[8] = 2082;
          *(void *)&v109[10] = v25;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchall, missing owned beacon has been found, cancelled disconnection backstop\", \"item\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"isConnected\":%{public, location:escape_only}s}", buf, 0x30u);
        }
      }
      uint64_t v26 = (uint64_t)[v20 beacon].connectableDeviceCount;
      if (v26 >= 255) {
        uint64_t v27 = 255;
      }
      else {
        uint64_t v27 = v26;
      }
      uint64_t v28 = (uint64_t)[v6 connectableDeviceCount];
      if (v28 >= 255) {
        uint64_t v29 = 255;
      }
      else {
        uint64_t v29 = v28;
      }
      id v30 = [v6 connectableDeviceCount];
      int v31 = v86;
      if ((uint64_t)v30 < v86) {
        int v31 = (int)v30;
      }
      int v86 = v31;
      id v32 = [v6 connectableDeviceCount];
      if ((uint64_t)v32 <= v85) {
        int v33 = v85;
      }
      else {
        int v33 = (int)v32;
      }
      int v85 = v33;
      if (v27 == v29)
      {
        [v20 isConnected];
      }
      else
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        id v34 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          id v35 = [[[v20 uuid] description] substringToIndex:8];
          unsigned int v36 = [v20 isConnected];
          unsigned int v37 = [v20 isMultiConnectionEnabled];
          *(_DWORD *)uint64_t buf = 68290307;
          int v104 = 0;
          __int16 v105 = 2082;
          v106 = "";
          __int16 v107 = 2113;
          *(void *)v108 = v35;
          *(_WORD *)&v108[8] = 1026;
          *(_DWORD *)v109 = v36;
          *(_WORD *)&v109[4] = 1026;
          *(_DWORD *)&v109[6] = v29;
          *(_WORD *)&v109[10] = 1026;
          *(_DWORD *)&v109[12] = v27;
          *(_WORD *)&v109[16] = 1026;
          *(_DWORD *)&v109[18] = v37;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #multi connectable check\", \"item\":%{private, location:escape_only}@, \"connected\":%{public}d, \"connectable\":%{public}d, \"prior\":%{public}d, \"multion\":%{public}hhd}", buf, 0x34u);
        }
        if (![v20 isConnected]) {
          goto LABEL_56;
        }
        unsigned __int8 v38 = [v20 isMultiConnectionEnabled];
        if (v29 < 2)
        {
          if ((v38 & 1) == 0) {
            goto LABEL_56;
          }
LABEL_55:
          [v20 enqueueTask:[+[CLDurianTask setMaxConnectionsTaskWithCount:](CLDurianTask, "setMaxConnectionsTaskWithCount:", v29)]];
          goto LABEL_56;
        }
        if ((v38 & 1) == 0) {
          goto LABEL_55;
        }
      }
LABEL_56:
      [v20 setBeacon:v6];
      if ([v20 groupUuid])
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        v39 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          id v40 = [[[v6 identifier] description] substringToIndex:8];
          id v41 = [[[v20 groupUuid] description] substringToIndex:8];
          unsigned int v42 = [v20 groupPartNumber];
          id v43 = [v20 prettyBeaconType];
          *(_DWORD *)uint64_t buf = 68290051;
          int v104 = 0;
          __int16 v105 = 2082;
          v106 = "";
          __int16 v107 = 2113;
          *(void *)v108 = v40;
          *(_WORD *)&v108[8] = 2113;
          *(void *)v109 = v41;
          *(_WORD *)&v109[8] = 1026;
          *(_DWORD *)&v109[10] = v42;
          *(_WORD *)&v109[14] = 2114;
          *(void *)&v109[16] = v43;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian grouped beacon\", \"item\":%{private, location:escape_only}@, \"group\":%{private, location:escape_only}@, \"part\":%{public}d, \"type\":%{public, location:escape_only}@}", buf, 0x36u);
        }
        ++v83;
      }
      if ([v20 isHawkeyeAccessory])
      {
        [(CLDurianDeviceDelegate *)self->_deviceDelegate startMonitoringDeviceForFirmwareUpdate:v20];
      }
      else
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        __int16 v44 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
        {
          id v45 = [[[v20 uuid] description] substringToIndex:8];
          unsigned int v46 = [v20 isHawkeyeAccessory];
          *(_DWORD *)uint64_t buf = 68289539;
          int v104 = 0;
          __int16 v105 = 2082;
          v106 = "";
          __int16 v107 = 2113;
          *(void *)v108 = v45;
          *(_WORD *)&v108[8] = 1025;
          *(_DWORD *)v109 = v46;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Not going to monitoring device for firmware updates\", \"item\":%{private, location:escape_only}@, \"isHawkeyeAcessory\":%{private}hhd}", buf, 0x22u);
        }
      }
LABEL_68:
      id v5 = (char *)v5 + 1;
    }
    while (v81 != v5);
    id v81 = [a3 countByEnumeratingWithState:&v98 objects:v113 count:16];
  }
  while (v81);
LABEL_72:
  id v79 = objc_alloc_init((Class)NSMutableArray);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v47 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v48 = [v47 countByEnumeratingWithState:&v94 objects:v102 count:16];
  if (v48)
  {
    uint64_t v49 = *(void *)v95;
    v50 = v89;
    do
    {
      v51 = 0;
      id v82 = v48;
      do
      {
        if (*(void *)v95 != v49) {
          objc_enumerationMutation(v47);
        }
        v52 = *(void **)(*((void *)&v94 + 1) + 8 * (void)v51);
        uint64_t v90 = 0;
        v91 = &v90;
        uint64_t v92 = 0x2020000000;
        char v93 = 0;
        v88[0] = _NSConcreteStackBlock;
        v88[1] = 3221225472;
        v89[0] = sub_101621EAC;
        v89[1] = &unk_102332470;
        v89[2] = v52;
        v89[3] = &v90;
        [a3 enumerateObjectsUsingBlock:v88];
        if (!*((unsigned char *)v91 + 24) && [v52 ownership] == (id)1)
        {
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332710);
          }
          v53 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            v54 = v50;
            uint64_t v55 = v49;
            id v56 = v47;
            id v57 = [[[v52 uuid] description] substringToIndex:8];
            id v58 = [[objc_msgSend(v52, "beacon") name];
            if ([v52 isConnected]) {
              v59 = "YES";
            }
            else {
              v59 = "NO";
            }
            unsigned int v60 = [v52 pendingDisconnect];
            unsigned int v61 = [v52 pendingDisconnect];
            *(_DWORD *)uint64_t buf = 68290307;
            v62 = "NO";
            if (v60) {
              v63 = "YES";
            }
            else {
              v63 = "NO";
            }
            int v104 = 0;
            if (v61) {
              v62 = "YES";
            }
            __int16 v105 = 2082;
            v106 = "";
            __int16 v107 = 2113;
            *(void *)v108 = v57;
            *(_WORD *)&v108[8] = 2114;
            *(void *)v109 = v58;
            *(_WORD *)&v109[8] = 2082;
            *(void *)&v109[10] = v59;
            *(_WORD *)&v109[18] = 2082;
            *(void *)&v109[20] = v63;
            *(_WORD *)&v109[28] = 2082;
            v110 = v62;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchall update remove\", \"item\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"isConnected\":%{public, location:escape_only}s, \"isTaskQueueEmpty\":%{public, location:escape_only}s, \"pendingDisconnect\":%{public, location:escape_only}s}", buf, 0x44u);
            id v47 = v56;
            uint64_t v49 = v55;
            v50 = v54;
            id v48 = v82;
          }
          if ([v52 isConnected])
          {
            [v52 setPendingDisconnect:1];
            if ([v52 isTaskQueueEmpty]) {
              -[CLDurianDeviceManager scheduleDisconnectionOnMissingBeaconWithUUID:](self, "scheduleDisconnectionOnMissingBeaconWithUUID:", [v52 uuid]);
            }
          }
          else
          {
            [v79 addObject:[v52 uuid]];
          }
          if ([v52 isHawkeyeAccessory])
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332710);
            }
            v64 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v65 = [[[v52 uuid] description] substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289283;
              int v104 = 0;
              __int16 v105 = 2082;
              v106 = "";
              __int16 v107 = 2113;
              *(void *)v108 = v65;
              _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Stop monitoring device for firmware updates\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            [(CLDurianDeviceDelegate *)self->_deviceDelegate stopMonitoringDeviceForFirmwareUpdate:v52];
          }
        }
        _Block_object_dispose(&v90, 8);
        v51 = (char *)v51 + 1;
      }
      while (v48 != v51);
      id v48 = [v47 countByEnumeratingWithState:&v94 objects:v102 count:16];
    }
    while (v48);
  }
  [(NSMutableDictionary *)self->_devices removeObjectsForKeys:v79];
  if ([v79 count]) {
    sub_10163FF70((uint64_t)[v79 count]);
  }
  if (![(CLDurianMaintenanceUtilities *)self->_maintUtils isWatch]) {
    [(CLDurianDeviceManager *)self checkMaintainableDevices:2];
  }
  if (!self->_initialBeaconsFetched)
  {
    self->_BOOL initialBeaconsFetched = 1;
    [(CLDurianDeviceManager *)self resetDeviceConnections:@"1stfetch"];
  }
  id v66 = [a3 count];
  locationMonitor = self->_locationMonitor;
  if (v66) {
    [(CLDurianLocationMonitor *)locationMonitor startLeechingLocation];
  }
  else {
    [(CLDurianLocationMonitor *)locationMonitor stopLeechingLocation];
  }
  [(CLDurianDeviceManager *)self checkforLeashEligibilityChanges];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  v68 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v69 = [a3 count];
    unsigned int v70 = [(NSMutableDictionary *)self->_devices count];
    unsigned int v71 = [v79 count];
    __int16 v105 = 2082;
    *(_DWORD *)uint64_t buf = 68290818;
    int v104 = 0;
    v106 = "";
    __int16 v107 = 1026;
    *(_DWORD *)v108 = v69;
    *(_WORD *)&v108[4] = 1026;
    *(_DWORD *)&v108[6] = v70;
    *(_WORD *)v109 = 1026;
    *(_DWORD *)&v109[2] = 1000000 * v74 + 10000 * HIDWORD(v74) + 100 * v76 + v80;
    *(_WORD *)&v109[6] = 1026;
    *(_DWORD *)&v109[8] = v83;
    *(_WORD *)&v109[12] = 1026;
    *(_DWORD *)&v109[14] = v71;
    *(_WORD *)&v109[18] = 1026;
    *(_DWORD *)&v109[20] = v86;
    *(_WORD *)&v109[24] = 1026;
    *(_DWORD *)&v109[26] = v85;
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchall end\", \"beacons\":%{public}d, \"devices\":%{public}d, \"types\":%{public}d, \"grouped\":%{public}d, \"removed\":%{public}d, \"minconn\":%{public}d, \"maxconn\":%{public}d}", buf, 0x3Cu);
  }
}

- (void)didFetchUnknownBeacons:(id)a3
{
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v59 objects:v79 count:16];
  id v6 = &qword_102419000;
  unsigned int v46 = self;
  if (v4)
  {
    id v7 = v4;
    uint64_t v47 = *(void *)v60;
    *(void *)&long long v5 = 68289795;
    long long v42 = v5;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v60 != v47) {
          objc_enumerationMutation(a3);
        }
        id v9 = *(void **)(*((void *)&v59 + 1) + 8 * (void)v8);
        BOOL v10 = +[CLDurianSettings forceEnablePosh];
        SEL v11 = NSSelectorFromString(@"isPosh");
        if (objc_opt_respondsToSelector()) {
          BOOL v10 = [v9 performSelector:v11] != 0;
        }
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        id v12 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [[[v9 identifier] description] substringToIndex:8];
          id v14 = [v9 identifier];
          id v15 = (const char *)[v9 name];
          id v16 = (const char *)[v9 type];
          *(_DWORD *)uint64_t buf = 68290307;
          int v64 = 0;
          __int16 v65 = 2082;
          id v66 = "";
          __int16 v67 = 2113;
          id v68 = v13;
          id v6 = &qword_102419000;
          __int16 v69 = 2113;
          id v70 = v14;
          self = v46;
          __int16 v71 = 2114;
          long long v72 = v15;
          __int16 v73 = 2114;
          uint64_t v74 = v16;
          __int16 v75 = 1025;
          LODWORD(v76) = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchall unknown beacon update creating durian device for\", \"item\":%{private, location:escape_only}@, \"full\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"type\":%{public, location:escape_only}@, \"posh\":%{private}hhd}", buf, 0x40u);
        }
        id v17 = [[self deviceWithUUID:[v9 identifier] beaconType:[v9 type] isPosh:v10];
        if ([v17 pendingDisconnect])
        {
          -[CLDurianDeviceManager cancelDisconnectionOnMissingBeaconWithUUID:](self, "cancelDisconnectionOnMissingBeaconWithUUID:", [v17 uuid]);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332710);
          }
          id v18 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = [[[v17 uuid] description] substringToIndex:8];
            id v20 = [[objc_msgSend(v17, "beacon") name];
            unsigned int v21 = [v17 isConnected];
            *(_DWORD *)uint64_t buf = v42;
            id v22 = "NO";
            if (v21) {
              id v22 = "YES";
            }
            int v64 = 0;
            __int16 v65 = 2082;
            id v66 = "";
            __int16 v67 = 2113;
            id v68 = v19;
            __int16 v69 = 2114;
            id v70 = v20;
            id v6 = &qword_102419000;
            __int16 v71 = 2082;
            long long v72 = v22;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchall, missing non-owned beacon has been found, cancel disconnection backstop\", \"item\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"isConnected\":%{public, location:escape_only}s}", buf, 0x30u);
          }
        }
        [v17 setUnownedBeacon:v9];
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        id v23 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
        {
          id v24 = [[[v17 uuid] description] substringToIndex:8];
          *(_DWORD *)uint64_t buf = 68289283;
          int v64 = 0;
          __int16 v65 = 2082;
          id v66 = "";
          __int16 v67 = 2113;
          id v68 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian got unknown beacon\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        id v8 = (char *)v8 + 1;
      }
      while (v7 != v8);
      id v7 = [a3 countByEnumeratingWithState:&v59 objects:v79 count:16];
    }
    while (v7);
  }
  id v44 = objc_alloc_init((Class)NSMutableSet);
  id v25 = objc_alloc_init((Class)NSMutableSet);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v26 = [a3 countByEnumeratingWithState:&v55 objects:v78 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v56;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v56 != v28) {
          objc_enumerationMutation(a3);
        }
        [v25 addObject:[*(id *)(*((void *)&v55 + 1) + 8 * i) identifier]];
      }
      id v27 = [a3 countByEnumeratingWithState:&v55 objects:v78 count:16];
    }
    while (v27);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v30 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v31 = [v30 countByEnumeratingWithState:&v51 objects:v77 count:16];
  if (v31)
  {
    id v33 = v31;
    uint64_t v34 = *(void *)v52;
    *(void *)&long long v32 = 68290307;
    long long v43 = v32;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v52 != v34) {
          objc_enumerationMutation(v30);
        }
        unsigned int v36 = *(void **)(*((void *)&v51 + 1) + 8 * (void)j);
        if ((objc_msgSend(v36, "isTAAISDevice", v43) & 1) == 0
          && [v36 ownership] == (id)2
          && (objc_msgSend(v25, "containsObject:", objc_msgSend(v36, "uuid")) & 1) == 0)
        {
          if (v6[114] != -1) {
            dispatch_once(&qword_102419390, &stru_102332710);
          }
          unsigned int v37 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id obja = [[[v36 uuid] description] substringToIndex:8];
            id v48 = [objc_msgSend(v36, "beacon") name];
            if ([v36 isConnected]) {
              unsigned __int8 v38 = "YES";
            }
            else {
              unsigned __int8 v38 = "NO";
            }
            id v45 = v38;
            if ([v36 isTaskQueueEmpty]) {
              v39 = "YES";
            }
            else {
              v39 = "NO";
            }
            unsigned int v40 = [v36 pendingDisconnect];
            *(_DWORD *)uint64_t buf = v43;
            if (v40) {
              id v41 = "YES";
            }
            else {
              id v41 = "NO";
            }
            int v64 = 0;
            __int16 v65 = 2082;
            id v66 = "";
            __int16 v67 = 2113;
            id v68 = obja;
            __int16 v69 = 2114;
            id v70 = v48;
            id v6 = &qword_102419000;
            __int16 v71 = 2082;
            long long v72 = v45;
            __int16 v73 = 2082;
            uint64_t v74 = v39;
            __int16 v75 = 2082;
            int v76 = v41;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian removing unowned device\", \"item\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"isConnected\":%{public, location:escape_only}s, \"isTaskQueueEmpty\":%{public, location:escape_only}s, \"pendingDisconnect\":%{public, location:escape_only}s}", buf, 0x44u);
          }
          if ([v36 isConnected])
          {
            [v36 setPendingDisconnect:1];
            if ([v36 isTaskQueueEmpty]) {
              -[CLDurianDeviceManager scheduleDisconnectionOnMissingBeaconWithUUID:](v46, "scheduleDisconnectionOnMissingBeaconWithUUID:", [v36 uuid]);
            }
          }
          else
          {
            [v44 addObject:[v36 uuid]];
          }
        }
      }
      id v33 = [v30 countByEnumeratingWithState:&v51 objects:v77 count:16];
    }
    while (v33);
  }
  -[NSMutableDictionary removeObjectsForKeys:](v46->_devices, "removeObjectsForKeys:", [v44 allObjects]);

  v46->_initialUnknownBeaconsFetched = 1;
}

- (void)checkforLeashEligibilityChanges
{
  BOOL v3 = +[CLDurianSettings forceEnableLeash];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unsigned int v36 = self;
  id obj = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v4 = &qword_102419000;
  id v35 = [obj countByEnumeratingWithState:&v39 objects:v54 count:16];
  int v5 = 0;
  int v6 = 0;
  if (v35)
  {
    uint64_t v34 = *(void *)v40;
    uint64_t v32 = SPTagSeparationStateLeashDropped;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v7;
        id v8 = *(void **)(*((void *)&v39 + 1) + 8 * v7);
        if (+[CLDurianSettings lastKnownLocationEnabled]) {
          unsigned int v9 = [v8 connectionAllowed];
        }
        else {
          unsigned int v9 = 0;
        }
        unsigned int v38 = [v8 isLeashable];
        unsigned int v10 = -[NSMutableSet containsObject:](self->_leashableUUIDs, "containsObject:", [v8 uuid]);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        int v11 = v10 & v9 | v3;
        id v12 = v4[115];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [v8 uuid];
          BOOL v14 = v3;
          id v15 = v4;
          int v16 = v6;
          int v17 = v5;
          unsigned int v18 = [v8 connectionAllowed];
          unsigned int v19 = [v8 isConnected];
          *(_DWORD *)uint64_t buf = 68290307;
          int v44 = 0;
          __int16 v45 = 2082;
          unsigned int v46 = "";
          __int16 v47 = 2113;
          *(void *)id v48 = v13;
          *(_WORD *)&v48[8] = 1026;
          *(_DWORD *)uint64_t v49 = v11;
          *(_WORD *)&v49[4] = 1026;
          *(_DWORD *)v50 = v38;
          *(_WORD *)&v50[4] = 1026;
          unsigned int v51 = v18;
          int v5 = v17;
          int v6 = v16;
          id v4 = v15;
          BOOL v3 = v14;
          __int16 v52 = 1026;
          unsigned int v53 = v19;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash eligibility update check\", \"deviceId\":%{private, location:escape_only}@, \"curr\":%{public}hhd, \"prev\":%{public}hhd, \"allowed\":%{public}hhd, \"connected\":%{public}hhd}", buf, 0x34u);
        }
        unsigned int v20 = v38;
        if (((v38 ^ 1 | v11) & 1) == 0)
        {
          if ([v8 isConnected])
          {
            uint64_t v21 = [(CLDurianDeviceManager *)self getNearOwnerTimeoutForDevice:v8 checkingForNetwork:1 checkingHele:1];
            [v8 setDisconnectionReason:@"NotLeashable"];
            [(CLDurianDeviceManager *)self sendSeparationStateForDevice:v8 state:v32 includeLocation:0];
            uint64_t v22 = v21;
            unsigned int v20 = v38;
            [v8 enqueueTask:[v8 createSetNearOwnerTimeoutTaskInSeconds:v22]];
            [v8 enqueueTask:[v8 createSetPersistentConnectionTaskWithState:0]];
          }
          [v8 setLeashState:0];
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332710);
          }
          id v23 = v4[115];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            id v24 = [[[v8 uuid] description] substringToIndex:8];
            unsigned int v25 = [v8 leashState];
            *(_DWORD *)uint64_t buf = 68289539;
            int v44 = 0;
            __int16 v45 = 2082;
            unsigned int v46 = "";
            __int16 v47 = 2113;
            *(void *)id v48 = v24;
            unsigned int v20 = v38;
            *(_WORD *)&v48[8] = 1026;
            *(_DWORD *)uint64_t v49 = v25;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash eligibility lost\", \"item\":%{private, location:escape_only}@, \"state\":%{public}d}", buf, 0x22u);
          }
        }
        if (((v11 ^ 1 | v20) & 1) == 0)
        {
          [v8 setLeashState:1];
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332710);
          }
          id v26 = v4[115];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = [[[v8 uuid] description] substringToIndex:8];
            unsigned int v28 = [v8 leashState];
            *(_DWORD *)uint64_t buf = 68289539;
            int v44 = 0;
            __int16 v45 = 2082;
            unsigned int v46 = "";
            __int16 v47 = 2113;
            *(void *)id v48 = v27;
            unsigned int v20 = v38;
            *(_WORD *)&v48[8] = 1026;
            *(_DWORD *)uint64_t v49 = v28;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash eligibility added\", \"item\":%{private, location:escape_only}@, \"state\":%{public}d}", buf, 0x22u);
          }
        }
        v5 += v20;
        v6 += v11;
        uint64_t v7 = v37 + 1;
      }
      while (v35 != (id)(v37 + 1));
      id v35 = [obj countByEnumeratingWithState:&v39 objects:v54 count:16];
    }
    while (v35);
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  uint64_t v29 = v4[115];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v30 = [(NSMutableDictionary *)v36->_devices count];
    unsigned int v31 = [(NSMutableSet *)v36->_leashableUUIDs count];
    *(_DWORD *)uint64_t buf = 68290051;
    int v44 = 0;
    __int16 v45 = 2082;
    unsigned int v46 = "";
    __int16 v47 = 1025;
    *(_DWORD *)id v48 = v30;
    *(_WORD *)&v48[4] = 1026;
    *(_DWORD *)&v48[6] = v31;
    *(_WORD *)uint64_t v49 = 1026;
    *(_DWORD *)&v49[2] = v6;
    *(_WORD *)v50 = 1026;
    *(_DWORD *)&v50[2] = v5;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash list update\", \"devices\":%{private}d, \"leashset\":%{public}d, \"curr\":%{public}d, \"prior\":%{public}d}", buf, 0x2Au);
  }
}

- (void)didUpdatePersistentConnectionList:(id)a3
{
  [(NSMutableSet *)self->_leashableUUIDs removeAllObjects];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v15 objects:v27 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v16;
    *(void *)&long long v6 = 68289539;
    long long v14 = v6;
    do
    {
      unsigned int v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(a3);
        }
        unsigned int v10 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v9);
        [self->_leashableUUIDs addObject:[v10 identifier:v14]];
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        int v11 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [[[v10 identifier] description] substringToIndex:8];
          unsigned int v13 = [(NSMutableSet *)self->_leashableUUIDs count];
          *(_DWORD *)uint64_t buf = v14;
          int v20 = 0;
          __int16 v21 = 2082;
          uint64_t v22 = "";
          __int16 v23 = 2113;
          id v24 = v12;
          __int16 v25 = 1026;
          unsigned int v26 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash eligible\", \"item\":%{private, location:escape_only}@, \"n\":%{public}d}", buf, 0x22u);
        }
        unsigned int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v15 objects:v27 count:16];
    }
    while (v7);
  }
  [(CLDurianDeviceManager *)self checkforLeashEligibilityChanges];
  if ([(CLDurianMaintenanceUtilities *)self->_maintUtils isWatch]) {
    [(CLDurianDeviceManager *)self checkMaintainableDevices:3];
  }
}

- (void)removeTAUnknownBeaconBackedDevice:(id)a3
{
  if (a3)
  {
    id v5 = -[CLDurianDeviceManager deviceWithUUID:](self, "deviceWithUUID:");
    long long v6 = v5;
    if (v5 && [v5 ownership] != (id)2)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      id v12 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
      {
        int v16 = 68289539;
        int v17 = 0;
        __int16 v18 = 2082;
        unsigned int v19 = "";
        __int16 v20 = 2113;
        id v21 = [[objc_msgSend(a3, "description") substringToIndex:8];
        __int16 v22 = 2049;
        id v23 = [v6 ownership];
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian remove device for owner device\", \"item\":%{private, location:escape_only}@, \"ownership\":%{private}lu}", (uint8_t *)&v16, 0x26u);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
      }
      unsigned int v13 = qword_102419398;
      if (os_signpost_enabled((os_log_t)qword_102419398))
      {
        id v14 = [[objc_msgSend(a3, "description") substringToIndex:8];
        id v15 = [v6 ownership];
        int v16 = 68289539;
        int v17 = 0;
        __int16 v18 = 2082;
        unsigned int v19 = "";
        __int16 v20 = 2113;
        id v21 = v14;
        __int16 v22 = 2049;
        id v23 = v15;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian remove device for owner device", "{\"msg%{public}.0s\":\"#durian remove device for owner device\", \"item\":%{private, location:escape_only}@, \"ownership\":%{private}lu}", (uint8_t *)&v16, 0x26u);
      }
    }
    else
    {
      BOOL v7 = +[CLDurianSettings forceEnablePosh];
      SEL v8 = NSSelectorFromString(@"isPoshAccessory");
      [v6 taUnknownBeacon];
      if (objc_opt_respondsToSelector()) {
        BOOL v7 = [[[v6 taUnknownBeacon] performSelector:v8] != 0;
      }
      if ([v6 isTAAISDevice] && objc_msgSend(v6, "unownedBeacon"))
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        unsigned int v9 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 68289795;
          int v17 = 0;
          __int16 v18 = 2082;
          unsigned int v19 = "";
          __int16 v20 = 2113;
          id v21 = [objc_msgSend(v6, "unownedBeacon") identifier];
          __int16 v22 = 2114;
          id v23 = [objc_msgSend(objc_msgSend(v6, "unownedBeacon"), "type")];
          __int16 v24 = 1025;
          BOOL v25 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian remove durian device backed by TA unknown beacon\", \"ta-device\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@, \"posh\":%{private}hhd}", (uint8_t *)&v16, 0x2Cu);
        }
        [self deviceWithUUID:[objc_msgSend(objc_msgSend(v6, "unownedBeacon"), "identifier")] beaconType:[objc_msgSend(objc_msgSend(v6, "unownedBeacon"), "type")] isPosh:v7] setTaUnknownBeacon:0;
      }
      [(NSMutableDictionary *)self->_devices removeObjectForKey:a3];
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      unsigned int v10 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [[objc_msgSend(a3, "description") substringToIndex:8];
        int v16 = 68289283;
        int v17 = 0;
        __int16 v18 = 2082;
        unsigned int v19 = "";
        __int16 v20 = 2113;
        id v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian remove device\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v16, 0x1Cu);
      }
    }
  }
}

- (BOOL)deviceBackedWithBeacon:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (id)deviceWithUUID:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v5 = (CLDurianDevice *)-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:");
  if (!v5)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    long long v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
    {
      int v10 = 68289283;
      int v11 = 0;
      __int16 v12 = 2082;
      unsigned int v13 = "";
      __int16 v14 = 2113;
      id v15 = [[objc_msgSend(a3, "description") substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian creating device for unknown beacon type\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
    }
    BOOL v7 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v8 = [[objc_msgSend(a3, "description") substringToIndex:8];
      int v10 = 68289283;
      int v11 = 0;
      __int16 v12 = 2082;
      unsigned int v13 = "";
      __int16 v14 = 2113;
      id v15 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian creating device for unknown beacon type", "{\"msg%{public}.0s\":\"#durian creating device for unknown beacon type\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x1Cu);
    }
    id v5 = [[CLDurianDevice alloc] initWithUUID:a3 queue:self->_queue centralManager:self->_centralManager];
    [(CLDurianDevice *)v5 setDelegate:self->_deviceDelegate];
    [(NSMutableDictionary *)self->_devices setObject:v5 forKey:a3];
  }
  return v5;
}

- (id)createPoshDeviceWithUUID:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289283;
    v7[1] = 0;
    __int16 v8 = 2082;
    unsigned int v9 = "";
    __int16 v10 = 2113;
    id v11 = [[objc_msgSend(a3, "description") substringToIndex:8];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh creating durian device for \", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)v7, 0x1Cu);
  }
  return [(CLDurianDevice *)[CLPoshDevice alloc] initWithUUID:a3 queue:self->_queue centralManager:self->_centralManager];
}

- (id)createNonPoshDeviceWithUUID:(id)a3 beaconType:(id)a4
{
  if ([a4 isEqual:SPBeaconTypeDurian])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    BOOL v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 68289283;
      int v15 = 0;
      __int16 v16 = 2082;
      int v17 = "";
      __int16 v18 = 2113;
      id v19 = [[objc_msgSend(a3, "description") substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating durian device for \", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
    }
    __int16 v8 = &off_10229C038;
  }
  else if ([a4 isEqual:SPBeaconTypeHele])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    unsigned int v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 68289283;
      int v15 = 0;
      __int16 v16 = 2082;
      int v17 = "";
      __int16 v18 = 2113;
      id v19 = [[objc_msgSend(a3, "description") substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating durian device for \", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
    }
    __int16 v8 = &off_10229C1A0;
  }
  else if ([a4 isEqual:SPBeaconTypeAccessory])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    __int16 v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 68289283;
      int v15 = 0;
      __int16 v16 = 2082;
      int v17 = "";
      __int16 v18 = 2113;
      id v19 = [[objc_msgSend(a3, "description") substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating durian device for \", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
    }
    __int16 v8 = &off_10229C190;
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v11 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
    {
      int v14 = 68289282;
      int v15 = 0;
      __int16 v16 = 2082;
      int v17 = "";
      __int16 v18 = 2114;
      id v19 = a4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian creating a device for unknown beacon type \", \"type\":%{public, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
    }
    __int16 v12 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      int v14 = 68289282;
      int v15 = 0;
      __int16 v16 = 2082;
      int v17 = "";
      __int16 v18 = 2114;
      id v19 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian creating a device for unknown beacon type ", "{\"msg%{public}.0s\":\"#durian creating a device for unknown beacon type \", \"type\":%{public, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
    }
    __int16 v8 = &off_10229C0F8;
  }
  return [objc_alloc(*v8) initWithUUID:a3 queue:self->_queue centralManager:self->_centralManager];
}

- (id)deviceWithUUID:(id)a3 beaconType:(id)a4 isPosh:(BOOL)a5
{
  if (!a3) {
    return 0;
  }
  BOOL v5 = a5;
  id v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:");
  unsigned int v10 = [(CLDurianDeviceManager *)self deviceBackedWithBeacon:v9];
  unsigned int v11 = v10;
  if (v9 && (v10 & 1) == 0)
  {
    [(NSMutableDictionary *)self->_devices removeObjectForKey:a3];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    __int16 v12 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 68289283;
      v16[1] = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2113;
      id v20 = [[objc_msgSend(a3, "description") substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian removing device which was not backed with a valid beacon\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v16, 0x1Cu);
    }
  }
  if (v9) {
    BOOL v13 = v11 == 1;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13)
  {
    if (v5 && _os_feature_enabled_impl()) {
      id v14 = [(CLDurianDeviceManager *)self createPoshDeviceWithUUID:a3];
    }
    else {
      id v14 = [(CLDurianDeviceManager *)self createNonPoshDeviceWithUUID:a3 beaconType:a4];
    }
    id v9 = v14;
    [v14 setDelegate:self->_deviceDelegate];
    [(NSMutableDictionary *)self->_devices setObject:v9 forKey:a3];
  }
  return v9;
}

- (void)deviceWithUUID:(id)a3 withCompletion:(id)a4
{
  id v6 = [(CLDurianDeviceManager *)self deviceWithUUID:a3];
  if ([v6 beacon] || objc_msgSend(v6, "unownedBeacon"))
  {
    BOOL v7 = (void (*)(id, id))*((void *)a4 + 2);
    v7(a4, v6);
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_101623CC4;
    v8[3] = &unk_102332498;
    void v8[5] = v6;
    v8[6] = a4;
    v8[4] = self;
    [(CLDurianDeviceManager *)self fetchAllBeaconsWithCompletion:v8];
  }
}

- (void)deviceWithUUID:(id)a3 beaconType:(id)a4 isPosh:(BOOL)a5 withCompletion:(id)a6
{
  id v8 = [(CLDurianDeviceManager *)self deviceWithUUID:a3 beaconType:a4 isPosh:a5];
  if ([v8 beacon] || objc_msgSend(v8, "unownedBeacon"))
  {
    id v9 = (void (*)(id, id))*((void *)a6 + 2);
    v9(a6, v8);
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_101623E30;
    v10[3] = &unk_102332498;
    v10[5] = v8;
    v10[6] = a6;
    v10[4] = self;
    [(CLDurianDeviceManager *)self fetchAllBeaconsWithCompletion:v10];
  }
}

- (id)deviceWithActivePeripheral:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([objc_msgSend(objc_msgSend(objc_msgSend(v9, "activePeripheral"), "identifier"), "isEqual:", objc_msgSend(a3, "identifier"))])return v9; {
    if (v6 == (id)++v8)
    }
    {
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)recheckDevicesAfterDiscovery
{
  id v2 = self;
  self->_maintDiscoveryPending = 0;
  [(CLDurianDeviceManager *)self pruneScanCacheToQuarterHour];
  id v39 = objc_alloc_init((Class)NSMutableArray);
  id obj = [(NSMutableSet *)v2->_devicesBeingMaintained copy];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  BOOL v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [(NSMutableSet *)v2->_devicesBeingMaintained count];
    *(_DWORD *)uint64_t buf = 68289282;
    int v57 = 0;
    __int16 v58 = 2082;
    long long v59 = "";
    __int16 v60 = 1026;
    LODWORD(v61) = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint recheck discovery\", \"devices\":%{public}d}", buf, 0x18u);
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v42 = [obj countByEnumeratingWithState:&v52 objects:v71 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v53;
    *(void *)&long long v5 = 68289283;
    long long v38 = v5;
    long long v43 = v2;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v53 != v41) {
          objc_enumerationMutation(obj);
        }
        __int16 v45 = (char *)v6;
        id v7 = -[NSMutableDictionary objectForKeyedSubscript:](v2->_devices, "objectForKeyedSubscript:", *(void *)(*((void *)&v52 + 1) + 8 * (void)v6), v38);
        unsigned int v46 = [(CLDurianDeviceManager *)v2 getMaintReasonForDevice:v7];
        unint64_t v44 = (unint64_t)[v7 maintenanceOnlyCondition];
        uint64_t v8 = v2;
        id v9 = v7;
        id v10 = [(CLDurianDeviceManager *)v8 getAddressForDevice:v7];
        id v11 = [v7 activeConnectionAttempt];
        long long v12 = v11;
        __int16 v47 = v7;
        if (v10)
        {
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v13 = [v11 possiblePeripherals];
          id v14 = [v13 countByEnumeratingWithState:&v48 objects:v70 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v49;
            do
            {
              __int16 v17 = 0;
              do
              {
                if (*(void *)v49 != v16) {
                  objc_enumerationMutation(v13);
                }
                __int16 v18 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v17);
                if (([v12 doesPeripheral:v18 haveAddress:v10] & 1) == 0)
                {
                  if (qword_102419390 != -1) {
                    dispatch_once(&qword_102419390, &stru_102332710);
                  }
                  __int16 v19 = qword_102419398;
                  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
                  {
                    id v20 = [(char *)[v9 uuid].description substringToIndex:8];
                    id v21 = [[[objc_msgSend(objc_msgSend(objc_msgSend(v47, "activeConnectionAttempt"), "identifier"), "description") substringToIndex:8];
                    id v22 = [[[v18 identifier] description] substringToIndex:8];
                    *(_DWORD *)uint64_t buf = 68289795;
                    int v57 = 0;
                    __int16 v58 = 2082;
                    long long v59 = "";
                    __int16 v60 = 2113;
                    long long v61 = v20;
                    id v9 = v47;
                    __int16 v62 = 2113;
                    id v63 = v21;
                    __int16 v64 = 2113;
                    *(void *)__int16 v65 = v22;
                    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt periph nodiscovery\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", buf, 0x30u);
                  }
                  [v9 removePossiblePeripheral:v18];
                }
                __int16 v17 = (char *)v17 + 1;
              }
              while (v15 != v17);
              id v15 = [v13 countByEnumeratingWithState:&v48 objects:v70 count:16];
            }
            while (v15);
          }
        }
        unint64_t v23 = v44 & 0xFFFFFFFFFFFFFFFELL;
        BOOL v24 = (v44 & 0xFFFFFFFFFFFFFFFELL) == 2;
        BOOL v25 = v9;
        id v2 = v43;
        unsigned int v26 = [(CLDurianDeviceManager *)v43 shouldAttemptForcedHeleMaintenanceOnDevice:v25];
        if (v26) {
          BOOL v27 = v44 == 3;
        }
        else {
          BOOL v27 = 1;
        }
        if (!v27)
        {
          [v47 setMaintenanceOnlyCondition:3];
          if (![(CLDurianDeviceManager *)v43 isNonHeleMaintenanceActive])
          {
            [(CLDurianMaintenanceUtilities *)v43->_maintUtils releaseMaintenancePowerAssertion:@"complete"];
            maintMetrics = v43->_maintMetrics;
            [(CLDurianMaintenanceUtilities *)v43->_maintUtils getMaintenanceAssertionDuration];
            -[CLDurianMaintenanceMetrics setAssertionDuration:](maintMetrics, "setAssertionDuration:");
          }
        }
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        uint64_t v29 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = [[[v47 uuid] description] substringToIndex:8];
          unsigned int v31 = [[objc_msgSend(v12, "possiblePeripherals") count];
          unsigned int v32 = [v47 isAttemptingConnection];
          *(_DWORD *)uint64_t buf = 68290563;
          int v57 = 0;
          __int16 v58 = 2082;
          long long v59 = "";
          __int16 v60 = 2050;
          long long v61 = v46;
          __int16 v62 = 2113;
          id v63 = v30;
          __int16 v64 = 1026;
          *(_DWORD *)__int16 v65 = v31;
          id v2 = v43;
          *(_WORD *)&v65[4] = 1026;
          *(_DWORD *)&v65[6] = v23 == 2;
          __int16 v66 = 1026;
          unsigned int v67 = v26;
          __int16 v68 = 1026;
          unsigned int v69 = v32;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint decision\", \"reason\":%{public}ld, \"item\":%{private, location:escape_only}@, \"possible\":%{public}d, \"forced\":%{public}d, \"heleforced\":%{public}d, \"attempting\":%{public}d}", buf, 0x3Eu);
        }
        if (v46 == (char *)-1)
        {
          id v33 = v45;
          if (((v26 | +[CLDurianSettings forceMaintenanceConnectionsOverride]) & 1) == 0)
          {
            unsigned __int8 v36 = [v47 isAttemptingConnection];
            if (!v10 || (v36 & 1) == 0)
            {
              [(CLDurianDeviceManager *)v2 finishMaintainingDevice:v47 withReason:@"nodiscovery" andCategory:0];
              [(CLDurianDeviceManager *)v2 cancelConnectionAttemptToDevice:v47];
              [v47 removeAllPossiblePeripherals];
            }
            goto LABEL_54;
          }
        }
        else if (v23 == 2)
        {
          id v33 = v45;
        }
        else
        {
          id v33 = v45;
          if (!v46)
          {
            if ([(CLDurianDeviceManager *)v2 shouldConnectUsingLeashToDevice:v47])
            {
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102332710);
              }
              uint64_t v34 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
              {
                id v35 = [(char *)[v47 uuid].description substringToIndex:8];
                *(_DWORD *)uint64_t buf = v38;
                int v57 = 0;
                __int16 v58 = 2082;
                long long v59 = "";
                __int16 v60 = 2113;
                long long v61 = v35;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint capped forcing leash\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
LABEL_53:
              [v39 addObject:v47];
              goto LABEL_54;
            }
            [(CLDurianDeviceManager *)v2 finishMaintainingDevice:v47 withReason:@"maintained:advscan" andCategory:2];
            [(CLDurianDeviceManager *)v2 cancelConnectionAttemptToDevice:v47];
            [v47 removeAllPossiblePeripherals];
            BOOL v24 = 0;
          }
        }
        if ((unint64_t)(v46 - 1) < 2) {
          char v37 = 1;
        }
        else {
          char v37 = v26;
        }
        if ((v37 & 1) != 0 || v24) {
          goto LABEL_53;
        }
LABEL_54:
        id v6 = v33 + 1;
      }
      while (v6 != v42);
      id v42 = [obj countByEnumeratingWithState:&v52 objects:v71 count:16];
    }
    while (v42);
  }

  [(CLDurianDeviceManager *)v2 connectToDevices:[(CLDurianDeviceManager *)v2 sortDevicesBasedOnConnectionlikelihood:v39]];
}

- (id)sortDevicesBasedOnConnectionlikelihood:(id)a3
{
  return a3;
}

- (void)connectToDevices:(id)a3
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(a3);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v8 = [(CLDurianDeviceManager *)self getAddressForDevice:v7];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v9 = [objc_msgSend(v7, "activeConnectionAttempt") possiblePeripherals];
        id v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v18;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v18 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * (void)j);
              if (v8
                && !objc_msgSend(objc_msgSend(v7, "activeConnectionAttempt"), "doesPeripheral:haveAddress:", v14, v8))
              {
                [objc_msgSend(v7, "activeConnectionAttempt") removePossiblePeripheral:v14];
              }
              else
              {
                [(CLDurianDeviceManager *)self connectToDevice:v7 withPeripheral:v14 forcedTimeout:0];
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v11);
        }
      }
      id v5 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }
}

- (void)dispatchRecheckDevicesAfterDiscovery
{
  dispatch_time_t v3 = dispatch_time(0, 6000000000);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_101624A24;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_after(v3, queue, block);
}

- (BOOL)shouldAttemptForcedHeleMaintenanceOnDevice:(id)a3
{
  unsigned int v5 = [a3 isHeleAccessory];
  if (v5)
  {
    if ([(CLDurianDeviceManager *)self onlyHeleMaintainableDevices]) {
      int v6 = 1;
    }
    else {
      int v6 = 4 * (([(CLDurianDeviceManager *)self getQuarterHour] & 3) == 0);
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289539;
      v9[1] = 0;
      __int16 v10 = 2082;
      id v11 = "";
      __int16 v12 = 2113;
      id v13 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      __int16 v14 = 1026;
      BOOL v15 = v6 != 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint hele\", \"item\":%{private, location:escape_only}@, \"force\":%{public}hhd}", (uint8_t *)v9, 0x22u);
    }
    LOBYTE(v5) = v6 != 0;
  }
  return v5;
}

- (int64_t)getMaintReasonForDevice:(id)a3
{
  scanCache = self->_scanCache;
  id v4 = [a3 uuid];

  return [(CLDurianScanCache *)scanCache getMaintenanceReasonForUuid:v4];
}

- (id)getAddressForDevice:(id)a3
{
  scanCache = self->_scanCache;
  id v4 = [a3 uuid];

  return [(CLDurianScanCache *)scanCache getAddressForUuid:v4];
}

- (BOOL)isDiscoveryRequiredForDevice:(id)a3 onCondition:(unint64_t)a4 withPeripheral:(id)a5
{
  id v9 = [[[objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "connectionMaterialsForPeripheral:", a5), "firstObject"), "address");
  if (v9)
  {
    if (-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", [a3 uuid]))
    {
      int64_t v10 = [(CLDurianDeviceManager *)self getMaintReasonForDevice:a3];
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      id v11 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 68290051;
        __int16 v23 = 2082;
        int v22 = 0;
        long long v24 = "";
        __int16 v25 = 2113;
        id v26 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
        __int16 v27 = 2113;
        *(void *)unsigned int v28 = sub_101640700(v9);
        *(_WORD *)&v28[8] = 2113;
        *(void *)uint64_t v29 = [a5 identifier];
        *(_WORD *)&v29[8] = 1026;
        int v30 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint check\", \"item\":%{private, location:escape_only}@, \"address\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"reason\":%{public}d}", (uint8_t *)&v21, 0x36u);
      }
      BOOL v12 = 1;
      if (a4 != 1
        || v10
        || [(CLDurianDeviceManager *)self shouldConnectUsingLeashToDevice:a3])
      {
        goto LABEL_21;
      }
      [(CLDurianDeviceManager *)self finishMaintainingDevice:a3 withReason:@"maintained:cache" andCategory:2];
LABEL_20:
      BOOL v12 = 0;
LABEL_21:
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      goto LABEL_23;
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    uint64_t v17 = qword_102419398;
    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      BOOL v12 = 0;
      goto LABEL_23;
    }
    int v21 = 68289283;
    int v22 = 0;
    __int16 v23 = 2082;
    long long v24 = "";
    __int16 v25 = 2113;
    id v26 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v14 = "{\"msg%{public}.0s\":\"#durian #maint offlist\", \"item\":%{private, location:escape_only}@}";
    BOOL v15 = v17;
    os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v21, 0x1Cu);
    goto LABEL_20;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  uint64_t v13 = qword_102419398;
  BOOL v12 = 0;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 68289283;
    int v22 = 0;
    __int16 v23 = 2082;
    long long v24 = "";
    __int16 v25 = 2113;
    id v26 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v14 = "{\"msg%{public}.0s\":\"#durian no discovery address\", \"item\":%{private, location:escape_only}@}";
    BOOL v15 = v13;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_19;
  }
LABEL_23:
  long long v18 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    int v21 = 68290051;
    __int16 v23 = 2082;
    int v22 = 0;
    long long v24 = "";
    __int16 v25 = 2113;
    id v26 = v19;
    __int16 v27 = 1026;
    *(_DWORD *)unsigned int v28 = v12;
    *(_WORD *)&v28[4] = 1026;
    *(_DWORD *)&v28[6] = a4;
    *(_WORD *)uint64_t v29 = 2113;
    *(void *)&v29[2] = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint needs discovery\", \"item\":%{private, location:escape_only}@, \"required\":%{public}d, \"condition\":%{public}d, \"possibleAddress\":%{private, location:escape_only}@}", (uint8_t *)&v21, 0x32u);
  }
  return v12;
}

- (void)attemptConnectionToDevice:(id)a3
{
}

- (void)attemptMaintenanceOnDevice:(id)a3 onCondition:(unint64_t)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    __int16 v9 = 2082;
    int64_t v10 = "";
    __int16 v11 = 2113;
    id v12 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v13 = 1026;
    int v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint attempt\", \"item\":%{private, location:escape_only}@, \"condition\":%{public}d}", (uint8_t *)v8, 0x22u);
  }
  [(CLDurianDeviceManager *)self attemptConnectToDevice:a3 onCondition:a4];
  if ([self->_devicesBeingMaintained containsObject:[a3 uuid]])[a3 setMaintenanceOnlyCondition:a4];
}
  }

- (void)cleanupStalledConnectionAttemptWithDuration:(double)a3 forDevice:(id)a4
{
  id v7 = &qword_102419000;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v8 = &qword_102419000;
  __int16 v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289795;
    __int16 v29 = 2082;
    int v30 = "";
    __int16 v31 = 2113;
    id v32 = [[[objc_msgSend(objc_msgSend(a4, "uuid"), "description") substringToIndex:8];
    __int16 v33 = 2113;
    id v34 = [[[[a4 activeConnectionAttempt] identifier] description] substringToIndex:8];
    id v8 = &qword_102419000;
    __int16 v35 = 2113;
    id v36 = [objc_msgSend(a4, "activeConnectionAttempt") possiblePeripherals];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt #watchdog connection attempt cleanup\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periphs\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [[[a4 activeConnectionAttempt] possiblePeripherals] copy];
  id v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v24;
    *(void *)&long long v11 = 68289795;
    long long v21 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        -[CLDurianDeviceManager handleConnectionFailureForPeripheral:withErrorCode:](self, "handleConnectionFailureForPeripheral:withErrorCode:", v15, 101, v21);
        [a4 removePossiblePeripheral:v15 withError:101];
        if (v7[114] != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        os_log_type_t v16 = v8[115];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = v7;
          id v18 = [[[objc_msgSend(objc_msgSend(a4, "uuid"), "description") substringToIndex:8];
          id v19 = [[[[a4 activeConnectionAttempt] identifier] description] substringToIndex:8];
          id v20 = [objc_msgSend(a4, "activeConnectionAttempt") possiblePeripherals];
          uint64_t buf = v21;
          __int16 v29 = 2082;
          int v30 = "";
          __int16 v31 = 2113;
          id v32 = v18;
          id v7 = v17;
          __int16 v33 = 2113;
          id v34 = v19;
          id v8 = &qword_102419000;
          __int16 v35 = 2113;
          id v36 = v20;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt #watchdog connection attempt removed peripherals\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periphs\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  -[CLDurianMetricManager submitPendingConnectionAttemptMetrics:attemptDuration:connectionReason:deviceType:](self->_metricManager, "submitPendingConnectionAttemptMetrics:attemptDuration:connectionReason:deviceType:", a4, [a4 getConnectionReason], [a4 prettyBeaconType], a3);
}

- (BOOL)attemptConnectToDevice:(id)a3 onCondition:(unint64_t)a4
{
  if (![(CLDurianDeviceManager *)self ready])
  {
    [(CLDurianDeviceDelegate *)self->_deviceDelegate didFailToConnectDevice:a3 withError:19];
    [a3 failAllTasksWithError:19];
    id v7 = @"nomanager";
    goto LABEL_9;
  }
  if (([a3 connectionAllowed] & 1) == 0)
  {
    [(CLDurianDeviceManager *)self sendObservationForDevice:a3 type:3 includeLocation:0];
    [(CLDurianDeviceDelegate *)self->_deviceDelegate didFailToConnectDevice:a3 withError:17];
    [a3 failAllTasksWithError:17];
    id v7 = @"notallowed";
    goto LABEL_9;
  }
  if ([a3 isConnected])
  {
    [(CLDurianDeviceManager *)self sendObservationForDevice:a3 type:2 includeLocation:1];
    id v7 = @"connected";
LABEL_9:
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289795;
      int v28 = 0;
      __int16 v29 = 2082;
      int v30 = "";
      __int16 v31 = 2113;
      id v32 = v9;
      __int16 v33 = 2114;
      *(void *)id v34 = v7;
      *(_WORD *)&v34[8] = 1026;
      *(_DWORD *)&v34[10] = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt skipped\", \"item\":%{private, location:escape_only}@, \"reason\":%{public, location:escape_only}@, \"condition\":%{public}d}", buf, 0x2Cu);
    }
    if (a4)
    {
      if ([(__CFString *)v7 isEqualToString:@"connected"])
      {
        if ([a3 isLeashSlotInUse]) {
          CFStringRef v10 = @"maintained:leashed";
        }
        else {
          CFStringRef v10 = @"maintained:connected";
        }
        long long v11 = self;
        id v12 = a3;
        uint64_t v13 = 2;
      }
      else
      {
        CFStringRef v10 = +[NSString stringWithFormat:@"skip:%@", v7];
        long long v11 = self;
        id v12 = a3;
        uint64_t v13 = 0;
      }
      [(CLDurianDeviceManager *)v11 finishMaintainingDevice:v12 withReason:v10 andCategory:v13];
    }
    return 0;
  }
  if (-[NSMutableDictionary objectForKey:](self->_keyFetchTimeoutBlocks, "objectForKey:", [a3 uuid]))
  {
    id v7 = @"fetchingkeys";
    goto LABEL_9;
  }
  if ([a3 isAttemptingConnection])
  {
    [objc_msgSend(a3, "activeConnectionAttempt") attemptDuration];
    double v16 = v15;
    if (v15 >= 720.0)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      uint64_t v17 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289795;
        int v28 = 0;
        __int16 v29 = 2082;
        int v30 = "";
        __int16 v31 = 2113;
        id v32 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
        __int16 v33 = 2113;
        *(void *)id v34 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "identifier"), "description") substringToIndex:8];
        *(_WORD *)&v34[8] = 2113;
        *(void *)&v34[10] = [objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "possiblePeripherals")
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt #watchdog connection attempt longer than 12 mins\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periphs\":%{private, location:escape_only}@}", buf, 0x30u);
      }
      [(CLDurianDeviceManager *)self cleanupStalledConnectionAttemptWithDuration:a3 forDevice:v16];
      return 0;
    }
    if (!a4
      && -[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", [a3 uuid]))
    {
      id v7 = @"wasmaint";
      [(CLDurianDeviceManager *)self finishMaintainingDevice:a3 withReason:+[NSString stringWithFormat:@"skip:%@", @"wasmaint"] andCategory:0];
      [a3 setMaintenanceOnlyCondition:0];
      [(CLDurianDeviceManager *)self restartConnectionAttemptToDevice:a3];
      goto LABEL_9;
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v18 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v28 = 0;
      __int16 v29 = 2082;
      int v30 = "";
      __int16 v31 = 2113;
      id v32 = [a3 uuid];
      __int16 v33 = 1025;
      *(_DWORD *)id v34 = [objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "possiblePeripherals"), "count");
      *(_WORD *)&v34[4] = 2113;
      *(void *)&v34[6] = [objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "possiblePeripherals"), "firstObject"), "identifier");
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt prior peripherals\", \"deviceId\":%{private, location:escape_only}@, \"periphs\":%{private}d, \"head\":%{private, location:escape_only}@}", buf, 0x2Cu);
    }
    if (!+[CLDurianSettings forceMaintenanceConnectionsOverride])
    {
      id v7 = @"inprogress";
      goto LABEL_9;
    }
  }
  else if ([a3 reconnecting])
  {
    id v7 = @"reconnecting";
    goto LABEL_9;
  }
  id v19 = [[objc_msgSend(a3, "activeConnectionAttempt") identifier];
  id v20 = objc_alloc_init(CLDurianConnectionAttempt);
  [a3 setActiveConnectionAttempt:v20];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  long long v21 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    id v23 = [[-[NSUUID description](-[CLDurianConnectionAttempt identifier](v20, "identifier")) substringToIndex:8];
    id v24 = [objc_msgSend(a3, "beacon") name];
    id v25 = [a3 getConnectionReason];
    id v26 = [[objc_msgSend(v19, "description") substringToIndex:8];
    *(_DWORD *)uint64_t buf = 68290563;
    int v28 = 0;
    __int16 v29 = 2082;
    int v30 = "";
    __int16 v31 = 2113;
    id v32 = v22;
    __int16 v33 = 2113;
    *(void *)id v34 = v23;
    *(_WORD *)&v34[8] = 2113;
    *(void *)&v34[10] = v24;
    __int16 v35 = 1026;
    int v36 = a4;
    __int16 v37 = 2114;
    id v38 = v25;
    __int16 v39 = 2113;
    id v40 = v26;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt new\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"name\":%{private, location:escape_only}@, \"condition\":%{public}d, \"reason\":%{public, location:escape_only}@, \"oldId\":%{private, location:escape_only}@}", buf, 0x4Au);
  }
  [(CLDurianDeviceManager *)self fetchConnectionTokensForDevice:a3 onCondition:a4];
  return 1;
}

- (BOOL)isMaintTimerOn
{
  return [(CLDurianMaintenanceUtilities *)self->_maintUtils isTimerOn];
}

- (void)startMaintenanceTimer
{
  maintUtils = self->_maintUtils;
  BOOL v3 = [(CLDurianDeviceManager *)self onlyHeleMaintainableDevices];

  [(CLDurianMaintenanceUtilities *)maintUtils startTimer:v3];
}

- (void)stopMaintenanceTimer
{
}

- (void)checkMaintainableDevices:(unint64_t)a3
{
  if ([(CLDurianMaintenanceUtilities *)self->_maintUtils isWatch]) {
    unsigned int v5 = [(CLDurianDeviceManager *)self countLeashableDevices];
  }
  else {
    unsigned int v5 = [(CLDurianDeviceManager *)self countMaintainableDevices];
  }
  int v6 = v5;
  BOOL v7 = [(CLDurianDeviceManager *)self onlyHeleMaintainableDevices];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int maintainableDeviceCount = self->_maintainableDeviceCount;
    BOOL isMaintainableHeleOnly = self->_isMaintainableHeleOnly;
    unsigned int v11 = [(CLDurianDeviceManager *)self ready];
    unsigned int v12 = [(CLDurianMaintenanceUtilities *)self->_maintUtils isTinkerWatch];
    unsigned int v13 = [(NSMutableDictionary *)self->_devices count];
    v15[0] = 68291074;
    v15[1] = 0;
    __int16 v16 = 2082;
    uint64_t v17 = "";
    __int16 v18 = 1026;
    int v19 = a3;
    __int16 v20 = 1026;
    int v21 = v6;
    __int16 v22 = 1026;
    int v23 = maintainableDeviceCount;
    __int16 v24 = 1026;
    BOOL v25 = v7;
    __int16 v26 = 1026;
    BOOL v27 = isMaintainableHeleOnly;
    __int16 v28 = 1026;
    unsigned int v29 = v11;
    __int16 v30 = 1026;
    unsigned int v31 = v12;
    __int16 v32 = 1026;
    unsigned int v33 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint countcheck\", \"event\":%{public}d, \"current\":%{public}d, \"prior\":%{public}d, \"heleonly\":%{public}d, \"prior\":%{public}d, \"bt\":%{public}hhd, \"tinker\":%{public}hhd, \"devices\":%{public}d}", (uint8_t *)v15, 0x42u);
  }
  if (![(CLDurianMaintenanceUtilities *)self->_maintUtils isTinkerWatch])
  {
    if (a3)
    {
      if (a3 == 1 && v6 >= 1) {
        goto LABEL_22;
      }
      int v14 = self->_maintainableDeviceCount;
      if (!v14 && v6 >= 1)
      {
        if ([(CLDurianDeviceManager *)self ready])
        {
LABEL_22:
          [(CLDurianDeviceManager *)self startMaintenanceTimer];
          goto LABEL_23;
        }
        if (self->_maintainableDeviceCount <= 0) {
          goto LABEL_23;
        }
LABEL_21:
        if (self->_isMaintainableHeleOnly != v7) {
          goto LABEL_22;
        }
LABEL_23:
        self->_int maintainableDeviceCount = v6;
        self->_BOOL isMaintainableHeleOnly = v7;
        return;
      }
      if (v14 < 1 || v6)
      {
        if (v14 < 1) {
          goto LABEL_23;
        }
        goto LABEL_21;
      }
    }
    [(CLDurianDeviceManager *)self stopMaintenanceTimer];
    goto LABEL_23;
  }
}

- (void)maintainAllDevices:(unint64_t)a3
{
  BOOL v3 = self;
  if (![(CLDurianDeviceManager *)self isMaintenanceActive]) {
    goto LABEL_16;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    devicesBeingMaintained = v3->_devicesBeingMaintained;
    *(_DWORD *)uint64_t buf = 68289283;
    int v98 = 0;
    __int16 v99 = 2082;
    long long v100 = "";
    __int16 v101 = 2113;
    *(void *)v102 = devicesBeingMaintained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint active\", \"list\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v6 = [(NSMutableDictionary *)v3->_devices objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v91 objects:v109 count:16];
  if (v7)
  {
    id v8 = v7;
    int v75 = 0;
    uint64_t v9 = *(void *)v92;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v92 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](v3->_devicesBeingMaintained, "containsObject:", [v11 uuid]))
        {
          [(CLDurianDeviceManager *)v3 finishMaintainingDevice:v11 withReason:@"nextmaint" andCategory:1];
          [(CLDurianDeviceManager *)v3 cancelConnectionAttemptToDevice:v11];
          [v11 removeAllPossiblePeripherals];
          ++v75;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v91 objects:v109 count:16];
    }
    while (v8);
  }
  else
  {
LABEL_16:
    int v75 = 0;
  }
  id v12 = [(NSMutableDictionary *)v3->_devices count];
  id v13 = [objc_alloc((Class)NSMutableString) initWithString:&stru_10234F018];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = [(NSMutableDictionary *)v3->_devices objectEnumerator];
  id v14 = [obj countByEnumeratingWithState:&v87 objects:v108 count:16];
  CFStringRef v15 = @"na";
  p_isa = (id *)&v3->super.isa;
  if (!v14)
  {
    uint64_t v17 = 0;
    goto LABEL_42;
  }
  id v16 = v14;
  unsigned int v69 = v13;
  LODWORD(v17) = 0;
  int v73 = 0;
  char v74 = 0;
  char v71 = 0;
  id v18 = *(id *)v88;
  do
  {
    int v19 = 0;
    do
    {
      if (*(id *)v88 != v18) {
        objc_enumerationMutation(obj);
      }
      __int16 v20 = *(void **)(*((void *)&v87 + 1) + 8 * (void)v19);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      int v21 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v78 = [[[v20 uuid] description] substringToIndex:8];
        id v22 = [v20 uuid];
        id v77 = [[objc_msgSend(v20, "beacon") name];
        int v23 = (int)v12;
        id v12 = v18;
        id v24 = [[[v20 groupUuid] description] substringToIndex:8];
        unsigned int v25 = [v20 isHeleAccessory];
        unsigned int v26 = [v20 ownership];
        *(_DWORD *)uint64_t buf = 68290563;
        int v98 = 0;
        __int16 v99 = 2082;
        long long v100 = "";
        __int16 v101 = 2113;
        *(void *)v102 = v78;
        *(_WORD *)&v102[8] = 2113;
        *(void *)v103 = v22;
        *(_WORD *)&v103[8] = 2114;
        *(void *)&v103[10] = v77;
        *(_WORD *)&v103[18] = 2113;
        *(void *)&v103[20] = v24;
        id v18 = v12;
        LODWORD(v12) = v23;
        __int16 v104 = 1026;
        unsigned int v105 = v25;
        __int16 v106 = 1026;
        unsigned int v107 = v26;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian maint list\", \"item\":%{private, location:escape_only}@, \"full\":%{private, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"group\":%{private, location:escape_only}@, \"hele\":%{public}hhd, \"ownership\":%{public}d}", buf, 0x46u);
      }
      if (objc_msgSend(v20, "isAirTag", v69))
      {
        char v74 = 1;
      }
      else if ([v20 isHeleAccessory])
      {
        char v71 = 1;
      }
      else
      {
        v73 |= [v20 isHawkeyeAccessory];
      }
      uint64_t v17 = v17 + [v20 isLeashable];
      id v12 = (id)(v12 - ([v20 ownership] != (id)1));
      int v19 = (char *)v19 + 1;
    }
    while (v16 != v19);
    id v16 = [obj countByEnumeratingWithState:&v87 objects:v108 count:16];
  }
  while (v16);
  id v13 = v69;
  if (v74) {
    [v69 appendString:@"D"];
  }
  if (v73)
  {
    [v69 appendString:@"H"];
    BOOL v3 = (CLDurianDeviceManager *)p_isa;
    if ((v71 & 1) == 0) {
      goto LABEL_43;
    }
    CFStringRef v15 = @"L";
    goto LABEL_42;
  }
  CFStringRef v15 = @"na";
  if (v71) {
    CFStringRef v15 = @"L";
  }
  BOOL v3 = (CLDurianDeviceManager *)p_isa;
  if (v71 & 1 | ((v74 & 1) == 0)) {
LABEL_42:
  }
    [v13 appendString:v15];
LABEL_43:
  -[CLDurianMaintenanceMetrics startNewMaintEventWithCount:leashable:deviceTypes:coex:loiType:](v3->_maintMetrics, "startNewMaintEventWithCount:leashable:deviceTypes:coex:loiType:", v12, v17, [v13 copy], v3->_coexImpactState, -[CLDurianDeviceManager loiType](v3, "loiType"));
  v3->_maintDutyCycleUpgrade = 0;
  v3->_maintDiscoveryPending = 0;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  BOOL v27 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    [(CLDurianMaintenanceMetrics *)v3->_maintMetrics timeBetweenTriggers];
    int v29 = (int)v28;
    int coexImpactState = v3->_coexImpactState;
    loiType = v3->_loiType;
    unsigned int v32 = [(NSMutableDictionary *)v3->_devices count];
    *(_DWORD *)uint64_t buf = 68290818;
    int v98 = 0;
    __int16 v99 = 2082;
    long long v100 = "";
    __int16 v101 = 1026;
    *(_DWORD *)v102 = a3;
    *(_WORD *)&v102[4] = 1026;
    *(_DWORD *)&v102[6] = v12;
    *(_WORD *)v103 = 1026;
    *(_DWORD *)&v103[2] = v29;
    *(_WORD *)&v103[6] = 1026;
    *(_DWORD *)&v103[8] = coexImpactState;
    *(_WORD *)&v103[12] = 2114;
    *(void *)&v103[14] = loiType;
    *(_WORD *)&v103[22] = 1026;
    *(_DWORD *)&v103[24] = v75;
    __int16 v104 = 1026;
    unsigned int v105 = v32;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint all\", \"trigger\":%{public}d, \"count\":%{public}d, \"tbm\":%{public}d, \"coex\":%{public}d, \"loiType\":%{public, location:escape_only}@, \"leftover\":%{public}d, \"totalDevices\":%{public}d}", buf, 0x40u);
  }
  if (v12)
  {
    CFStringRef v33 = 0;
  }
  else
  {
    [(CLDurianDeviceManager *)v3 stopMaintenanceTimer];
    CFStringRef v33 = @"devices";
  }
  if ([(NSString *)+[CLDurianSettings testMode] isEqualToString:@"NoMaintenance"])
  {
    CFStringRef v33 = @"defaultsdisable";
  }
  if (v33)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v34 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v98 = 0;
      __int16 v99 = 2082;
      long long v100 = "";
      __int16 v101 = 2114;
      *(void *)v102 = v33;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint done\", \"skip all\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    [(CLDurianMaintenanceMetrics *)v3->_maintMetrics setAssertionDuration:0.0];
    [(CLDurianDeviceManager *)v3 submitCompletedMaintenanceMetrics:v3->_maintMetrics];
    [(CLDurianMaintenanceMetrics *)v3->_maintMetrics resetWithTime:CFAbsoluteTimeGetCurrent()];
  }
  else
  {
    [(CLDurianMaintenanceUtilities *)v3->_maintUtils takeMaintenancePowerAssertion];
    [(CLDurianDeviceManager *)v3 pruneScanCacheToQuarterHour];
    [(NSMutableSet *)v3->_maintenanceEvictionCandidates removeAllObjects];
    [(NSMutableDictionary *)v3->_maintenanceEvictionMap removeAllObjects];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v35 = [(NSMutableDictionary *)v3->_devices objectEnumerator];
    id v36 = [v35 countByEnumeratingWithState:&v83 objects:v96 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v84;
      do
      {
        __int16 v39 = 0;
        do
        {
          if (*(void *)v84 != v38) {
            objc_enumerationMutation(v35);
          }
          id v40 = *(void **)(*((void *)&v83 + 1) + 8 * (void)v39);
          if ([v40 ownership] == (id)1)
          {
            if ([v40 groupUuid] && objc_msgSend(v40, "lastGroupMaintenance"))
            {
              int v41 = [[-[NSDictionary objectForKeyedSubscript:](-[CLDurianMaintenanceMetrics groupMaintDeltas](v3->_maintMetrics, "groupMaintDeltas")) objectForKeyedSubscript:objc_msgSend(v40, "groupUuid")] intValue];
              -[CLDurianDeviceManager getDeltaSecondsFromMachTime:](v3, "getDeltaSecondsFromMachTime:", [v40 lastGroupMaintenance]);
              double v43 = v42;
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102332710);
              }
              unint64_t v44 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
              {
                id v45 = [[[v40 uuid] description] substringToIndex:8];
                *(_DWORD *)uint64_t buf = 68289795;
                int v98 = 0;
                __int16 v99 = 2082;
                long long v100 = "";
                __int16 v101 = 2113;
                *(void *)v102 = v45;
                *(_WORD *)&v102[8] = 1026;
                *(_DWORD *)v103 = (int)v43;
                *(_WORD *)&v103[4] = 1026;
                *(_DWORD *)&v103[6] = v41;
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint groupdeltas\", \"item\":%{private, location:escape_only}@, \"delta\":%{public}d, \"dict\":%{public}d}", buf, 0x28u);
              }
              BOOL v3 = (CLDurianDeviceManager *)p_isa;
              if (!v41 || v41 > (int)v43) {
                [p_isa[9] setGroupMaintDelta:(int)v43 forUUID:objc_msgSend(v40, "groupUuid")];
              }
            }
            if ([v40 lastReconciliationTime])
            {
              mach_continuous_time();
              [v40 lastReconciliationTime];
              TMConvertTicksToSeconds();
            }
            else
            {
              double v46 = -1.0;
            }
            [v40 setLastAdvertisementDelta:(unint64_t)v46];
            unsigned __int8 v47 = [v40 isClassicallyConnected];
            double v48 = 0.0;
            if ((v47 & 1) == 0)
            {
              if (objc_msgSend(v40, "lastGroupClassicDisconnectionTime", 0.0))
              {
                mach_continuous_time();
                [v40 lastGroupClassicDisconnectionTime];
                TMConvertTicksToSeconds();
                double v48 = v49 / 60.0;
              }
              else
              {
                double v48 = -1.0;
              }
            }
            [v40 setLastGroupClassicDisconnectionDelta:v48];
            -[NSMutableSet addObject:](v3->_devicesBeingMaintained, "addObject:", [v40 uuid]);
            if ([v40 isLeashSlotInUse]) {
              -[NSMutableSet addObject:](v3->_maintenanceEvictionCandidates, "addObject:", [v40 uuid]);
            }
          }
          __int16 v39 = (char *)v39 + 1;
        }
        while (v37 != v39);
        id v37 = [v35 countByEnumeratingWithState:&v83 objects:v96 count:16];
      }
      while (v37);
    }
    long long v50 = &qword_102419000;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    unint64_t v51 = a3;
    long long v52 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v53 = [(NSMutableSet *)v3->_maintenanceEvictionCandidates count];
      *(_DWORD *)uint64_t buf = 68289282;
      int v98 = 0;
      __int16 v99 = 2082;
      long long v100 = "";
      __int16 v101 = 1026;
      *(_DWORD *)v102 = v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint capped\", \"candidates\":%{public}d}", buf, 0x18u);
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v54 = [(NSMutableDictionary *)v3->_devices objectEnumerator];
    id v55 = [v54 countByEnumeratingWithState:&v79 objects:v95 count:16];
    if (v55)
    {
      id v56 = v55;
      uint64_t v57 = *(void *)v80;
      do
      {
        for (j = 0; j != v56; j = (char *)j + 1)
        {
          if (*(void *)v80 != v57) {
            objc_enumerationMutation(v54);
          }
          long long v59 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
          if (-[NSMutableSet containsObject:](v3->_devicesBeingMaintained, "containsObject:", [v59 uuid]))
          {
            [v59 setConnectionReason:@"Maintenance:Timer"];
            unsigned __int8 v60 = [(CLDurianDeviceManager *)v3 isSameMaintQuarterHourForDevice:v59];
            unsigned int v61 = 1;
            if (v51 && (v60 & 1) == 0) {
              unsigned int v61 = +[CLDurianSettings forceMaintenanceConnectionsOverride];
            }
            if (v50[114] != -1) {
              dispatch_once(&qword_102419390, &stru_102332710);
            }
            __int16 v62 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v63 = [[[v59 uuid] description] substringToIndex:8];
              unsigned int v64 = [v59 quarterHourDisconnect];
              unsigned int v65 = +[CLDurianSettings forceMaintenanceConnectionsOverride];
              *(_DWORD *)uint64_t buf = 68290051;
              int v98 = 0;
              __int16 v99 = 2082;
              long long v100 = "";
              __int16 v101 = 2113;
              *(void *)v102 = v63;
              *(_WORD *)&v102[8] = 1026;
              *(_DWORD *)v103 = v61;
              *(_WORD *)&v103[4] = 1026;
              *(_DWORD *)&v103[6] = v64;
              unint64_t v51 = a3;
              *(_WORD *)&v103[10] = 1026;
              *(_DWORD *)&v103[12] = v65;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint force check\", \"item\":%{private, location:escape_only}@, \"force\":%{public}d, \"quarterdis\":%{public}d, \"override\":%{public}d}", buf, 0x2Eu);
            }
            [v59 setQuarterHourDisconnect:0xFFFFFFFFLL];
            if (v61)
            {
              id v66 = p_isa[9];
              if (v51)
              {
                if ([v59 quarterHourDisconnect]) {
                  CFStringRef v67 = @"quarterhour";
                }
                else {
                  CFStringRef v67 = @"override";
                }
              }
              else
              {
                CFStringRef v67 = @"setup";
              }
              long long v50 = &qword_102419000;
              [v66 setForceReason:v67];
              uint64_t v68 = 2;
            }
            else
            {
              uint64_t v68 = 1;
              long long v50 = &qword_102419000;
            }
            BOOL v3 = (CLDurianDeviceManager *)p_isa;
            [p_isa attemptMaintenanceOnDevice:v59 onCondition:v68];
          }
        }
        id v56 = [v54 countByEnumeratingWithState:&v79 objects:v95 count:16];
      }
      while (v56);
    }
    if (![(CLDurianDeviceManager *)v3 isMaintenanceActive]) {
      [(CLDurianMaintenanceUtilities *)v3->_maintUtils releaseMaintenancePowerAssertion:@"none"];
    }
  }
}

- (void)finishMaintainingDevice:(id)a3 withReason:(id)a4 andCategory:(unint64_t)a5
{
  if ([(CLDurianDeviceManager *)self isMaintenanceActive])
  {
    if (-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", [a3 uuid]))
    {
      -[NSMutableSet removeObject:](self->_devicesBeingMaintained, "removeObject:", [a3 uuid]);
      double Current = CFAbsoluteTimeGetCurrent();
      [(CLDurianMaintenanceMetrics *)self->_maintMetrics referenceTime];
      if (qword_102419390 != -1)
      {
        double v18 = v10;
        dispatch_once(&qword_102419390, &stru_102332710);
        double v10 = v18;
      }
      double v11 = Current - v10;
      id v12 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
        unsigned int v14 = [(NSMutableSet *)self->_devicesBeingMaintained count];
        *(_DWORD *)uint64_t buf = 68290307;
        int v20 = 0;
        __int16 v21 = 2082;
        id v22 = "";
        __int16 v23 = 2113;
        id v24 = v13;
        __int16 v25 = 2114;
        id v26 = a4;
        __int16 v27 = 1026;
        int v28 = a5;
        __int16 v29 = 1026;
        unsigned int v30 = v14;
        __int16 v31 = 1026;
        int v32 = (int)v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint done\", \"item\":%{private, location:escape_only}@, \"reason\":%{public, location:escape_only}@, \"category\":%{public}d, \"left\":%{public}d, \"duration\":%{public}d}", buf, 0x38u);
      }
      id v15 = [a4 componentsSeparatedByString:@":"];
      -[CLDurianMetricManager submitMaintenanceMetrics:forDevice:withReason:andCategory:andDuration:leashable:](self->_metricManager, "submitMaintenanceMetrics:forDevice:withReason:andCategory:andDuration:leashable:", self->_maintMetrics, a3, a4, a5, [a3 leashState] != 0, v11);
      -[CLDurianMaintenanceMetrics accumulateMaintainedReasonCountWithReason:andCategory:](self->_maintMetrics, "accumulateMaintainedReasonCountWithReason:andCategory:", [v15 firstObject], a5);
      if (![a3 activePeripheral] && objc_msgSend(a3, "activeConnectionAttempt")) {
        [a3 setMaintenanceOnlyCondition:0];
      }
      [a3 resetHeleMaintMetrics];
    }
    if (![(CLDurianDeviceManager *)self isNonHeleMaintenanceActive])
    {
      [(CLDurianMaintenanceUtilities *)self->_maintUtils releaseMaintenancePowerAssertion:@"complete"];
      maintMetrics = self->_maintMetrics;
      [(CLDurianMaintenanceUtilities *)self->_maintUtils getMaintenanceAssertionDuration];
      -[CLDurianMaintenanceMetrics setAssertionDuration:](maintMetrics, "setAssertionDuration:");
    }
    if (![(CLDurianDeviceManager *)self isMaintenanceActive])
    {
      [(CLDurianScanCache *)self->_scanCache clearData];
      [(CLDurianDeviceManager *)self submitCompletedMaintenanceMetrics:self->_maintMetrics];
      uint64_t v17 = self->_maintMetrics;
      [(CLDurianMaintenanceMetrics *)v17 referenceTime];
      -[CLDurianMaintenanceMetrics resetWithTime:](v17, "resetWithTime:");
      self->_maintDutyCycleUpgrade = 0;
    }
  }
}

- (void)pruneScanCacheToQuarterHour
{
}

- (BOOL)isSameMaintQuarterHourForDevice:(id)a3
{
  unsigned int v4 = [(CLDurianDeviceManager *)self getQuarterHour];
  return v4 == [a3 quarterHourDisconnect];
}

- (void)submitCompletedMaintenanceMetrics:(id)a3
{
}

- (void)scheduleConnectionEvaluationForDevice:(id)a3
{
  -[CLDurianDeviceManager cancelConnectionEvaluationForDevice:](self, "cancelConnectionEvaluationForDevice:");
  if ([a3 maintenanceOnlyCondition]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 30;
  }
  if ([a3 isTAAISDevice]) {
    uint64_t v5 = 0;
  }
  if ([a3 firmwareUpdateMode]) {
    uint64_t v5 = 60;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289795;
    v7[1] = 0;
    __int16 v8 = 2082;
    uint64_t v9 = "";
    __int16 v10 = 2113;
    id v11 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v12 = 2113;
    id v13 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "activePeripheral"), "identifier"), "description") substringToIndex:8];
    __int16 v14 = 1026;
    int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection scheduling connection evaluation\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"timeout\":%{public}d}", (uint8_t *)v7, 0x2Cu);
  }
  [(CLDurianDeviceManager *)self dispatchConnectionEvaluationOnDevice:a3 withConnectionEvaluationTimeout:v5];
}

- (void)dispatchConnectionEvaluationOnDevice:(id)a3 withConnectionEvaluationTimeout:(int64_t)a4
{
  dispatch_time_t v6 = dispatch_time(0, 1000000000 * a4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_101627010;
  v8[3] = &unk_10229FEB0;
  v8[4] = self;
  void v8[5] = a3;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0, v8);
  dispatch_after(v6, (dispatch_queue_t)self->_queue, v7);
  -[NSMutableDictionary setObject:forKey:](self->_scheduledConnectionEvaluationBlocks, "setObject:forKey:", v7, [a3 uuid]);
  _Block_release(v7);
}

- (void)cancelConnectionEvaluationForDevice:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_scheduledConnectionEvaluationBlocks, "objectForKey:", [a3 uuid]);
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  dispatch_time_t v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289795;
    v7[1] = 0;
    __int16 v8 = 2082;
    uint64_t v9 = "";
    __int16 v10 = 2113;
    id v11 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v12 = 2113;
    id v13 = [[[[a3 activePeripheral] identifier] description] substringToIndex:8];
    __int16 v14 = 1026;
    BOOL v15 = v5 != 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection cancelling connection evaluation\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"exists\":%{public}hhd}", (uint8_t *)v7, 0x2Cu);
  }
  if (v5)
  {
    dispatch_block_cancel(v5);
    -[NSMutableDictionary removeObjectForKey:](self->_scheduledConnectionEvaluationBlocks, "removeObjectForKey:", [a3 uuid]);
  }
}

- (void)disconnectDevice:(id)a3
{
  if ([a3 activePeripheral])
  {
    [a3 setDisconnectionReason:@"ManagerDisconnect"];
    id v5 = [a3 activePeripheral];
    id v6 = [a3 uuid];
    [(CLDurianDeviceManager *)self cancelPeripheralConnection:v5 forUUID:v6];
  }
}

- (void)handleSystemSleep
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        __int16 v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (([v8 isLeashSlotInUse] & 1) == 0 && objc_msgSend(v8, "activePeripheral"))
        {
          [(CLDurianDeviceManager *)self disconnectDevice:v8];
          [v8 removeAllPossiblePeripherals];
          [(CLDurianDeviceManager *)self finishMaintainingDevice:v8 withReason:@"maintained:sleep" andCategory:2];
        }
        if ([v8 isAttemptingConnection]
          && [v8 maintenanceOnlyCondition] != (id)3)
        {
          [(CLDurianDeviceManager *)self finishMaintainingDevice:v8 withReason:@"error:sleep" andCategory:1];
          [(CLDurianDeviceManager *)self cancelConnectionAttemptToDevice:v8];
        }
        if ([v8 isConnected])
        {
          [(CLDurianDeviceManager *)self cancelConnectionEvaluationForDevice:v8];
          [(CLDurianDeviceManager *)self evaluateConnectionStateForDevice:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)handleSystemWake:(double)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian setting AP wake time\"}", (uint8_t *)v6, 0x12u);
  }
  [(CLDurianMetricManager *)self->_metricManager setSystemWakeTime:a3];
  [(CLDurianMetricManager *)self->_metricManager submitSystemWakeLeashBreakMetricsPerAccessoryAtLoi:[(CLDurianDeviceManager *)self loiType] forLeashBreak:0];
}

- (void)networkConnectivity:(BOOL)a3
{
  BOOL v3 = a3;
  self->_networkAvailable = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    __int16 v6 = 2082;
    __int16 v7 = "";
    __int16 v8 = 1025;
    BOOL v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian networkConnectivity\", \"connected\":%{private}d}", (uint8_t *)v5, 0x18u);
  }
}

- (void)coexImpactState:(int)a3
{
  if ([(CLDurianDeviceManager *)self isMaintenanceActive]) {
    BOOL v5 = (self->_coexImpactState & 3) != 0 && (a3 & 3) == 0;
  }
  else {
    BOOL v5 = 0;
  }
  self->_int coexImpactState = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  __int16 v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t maintDutyCycleUpgrade = self->_maintDutyCycleUpgrade;
    v8[0] = 68289795;
    v8[1] = 0;
    __int16 v9 = 2082;
    long long v10 = "";
    __int16 v11 = 1025;
    int v12 = a3;
    __int16 v13 = 1025;
    BOOL v14 = v5;
    __int16 v15 = 1025;
    int v16 = maintDutyCycleUpgrade;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint coex\", \"state\":%{private}d, \"updateDutyCycle\":%{private}d, \"upgrade\":%{private}d}", (uint8_t *)v8, 0x24u);
  }
  if (v5 && !self->_maintDutyCycleUpgrade) {
    [(CLDurianDeviceManager *)self restartMaintenanceConnections];
  }
}

- (void)metricHeartbeat
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  BOOL v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289026;
    __int16 v16 = 2082;
    uint64_t v17 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric heartbeat\"}", (uint8_t *)&buf, 0x12u);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        -[CLDurianMetricManager submitNonTimerMaintenanceMetricsForDevice:proactive:](self->_metricManager, "submitNonTimerMaintenanceMetricsForDevice:proactive:", v9, [v9 proactiveMaintenanceCount]);
        [v9 setProactiveMaintenanceCount:0];
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)updateLoiType:(unint64_t)a3 isEntry:(BOOL)a4
{
  id v6 = [(CLDurianDeviceManager *)self convertLoiTypeToString:a3];
  if (!a4) {
    id v6 = [@"departedFrom" stringByAppendingString:v6];
  }
  [(CLDurianDeviceManager *)self setLoiType:v6];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  uint64_t v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289283;
    v8[1] = 0;
    __int16 v9 = 2082;
    long long v10 = "";
    __int16 v11 = 2113;
    long long v12 = [(CLDurianDeviceManager *)self loiType];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system update loiType\", \"loiType\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
}

- (id)convertLoiTypeToString:(unint64_t)a3
{
  int v3 = a3;
  if (a3 < 5) {
    return off_102332748[a3];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
  {
    int v7 = 68289282;
    int v8 = 0;
    __int16 v9 = 2082;
    long long v10 = "";
    __int16 v11 = 1026;
    int v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian received unknown place type, please update convertLoiTypeToString\", \"label\":%{public}d}", (uint8_t *)&v7, 0x18u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
  }
  id v6 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    int v7 = 68289282;
    int v8 = 0;
    __int16 v9 = 2082;
    long long v10 = "";
    __int16 v11 = 1026;
    int v12 = v3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian received unknown place type, please update convertLoiTypeToString", "{\"msg%{public}.0s\":\"#durian received unknown place type, please update convertLoiTypeToString\", \"label\":%{public}d}", (uint8_t *)&v7, 0x18u);
  }
  return @"Unknown";
}

- (void)updateDeviceConnectionState:(id)a3 state:(unint64_t)a4
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 isHeleAccessory])
        {
          if ([v12 groupUuid])
          {
            ownerSession = self->_ownerSession;
            id v14 = [v12 groupUuid];
            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472;
            _DWORD v15[2] = sub_101627D00;
            v15[3] = &unk_102332500;
            v15[4] = self;
            v15[5] = a3;
            v15[6] = v12;
            v15[7] = a4;
            [(SPOwnerSession *)ownerSession beaconGroupForIdentifier:v14 completion:v15];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)didFetchBeaconGroup:(id)a3 connectedDeviceAddress:(id)a4 device:(id)a5 state:(unint64_t)a6
{
  if (objc_msgSend(a4, "isEqualToString:", objc_msgSend(objc_msgSend(a3, "macAddress"), "fm_hexString")))
  {
    if (a6 == 2)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      __int16 v11 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 68289539;
        int v15 = 0;
        __int16 v16 = 2082;
        long long v17 = "";
        __int16 v18 = 2113;
        id v19 = [a5 uuid];
        __int16 v20 = 2113;
        id v21 = a4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system update last classic connection with disconnect event\", \"device\":%{private, location:escape_only}@, \"macAddress\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x26u);
      }
      [a5 setLastGroupClassicDisconnectionTime:mach_continuous_time()];
    }
    else
    {
      if (a6 == 1)
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        id v9 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 68289539;
          int v15 = 0;
          __int16 v16 = 2082;
          long long v17 = "";
          __int16 v18 = 2113;
          id v19 = [a5 uuid];
          __int16 v20 = 2113;
          id v21 = a4;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system update last classic connection with connect event\", \"device\":%{private, location:escape_only}@, \"macAddress\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x26u);
        }
        uint64_t v10 = 1;
        goto LABEL_22;
      }
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      int v12 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
      {
        int v14 = 68289283;
        int v15 = 0;
        __int16 v16 = 2082;
        long long v17 = "";
        __int16 v18 = 2049;
        id v19 = (id)a6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #system update last classic connection received unhandled bluetooth service notification\", \"state\":%{private}ld}", (uint8_t *)&v14, 0x1Cu);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
      }
      long long v13 = qword_102419398;
      if (os_signpost_enabled((os_log_t)qword_102419398))
      {
        int v14 = 68289283;
        int v15 = 0;
        __int16 v16 = 2082;
        long long v17 = "";
        __int16 v18 = 2049;
        id v19 = (id)a6;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #system update last classic connection received unhandled bluetooth service notification", "{\"msg%{public}.0s\":\"#durian #system update last classic connection received unhandled bluetooth service notification\", \"state\":%{private}ld}", (uint8_t *)&v14, 0x1Cu);
      }
    }
    uint64_t v10 = 0;
LABEL_22:
    [a5 setIsClassicallyConnected:v10];
  }
}

- (unint64_t)totalConnectionCount
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unint64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v2);
      }
      v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) isConnected];
    }
    id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (unint64_t)leashSlotsInUse
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unint64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v2);
      }
      v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) isLeashSlotInUse];
    }
    id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (BOOL)shouldConnectUsingLeashToDevice:(id)a3
{
  unsigned int v5 = [a3 isLeashable];
  unsigned int v6 = [a3 reconnecting];
  unint64_t v7 = sub_100E871C8() - v6;
  unint64_t v8 = [(CLDurianDeviceManager *)self leashSlotsInUse];
  unsigned int v9 = [a3 isLeashSlotInUse];
  unsigned int v10 = v9;
  if (v8 < v7) {
    int v11 = 1;
  }
  else {
    int v11 = v9;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  int v12 = v5 & v11;
  long long v13 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 68290563;
    v15[1] = 0;
    __int16 v16 = 2082;
    long long v17 = "";
    __int16 v18 = 2113;
    id v19 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v20 = 1026;
    int v21 = v12;
    __int16 v22 = 1026;
    unsigned int v23 = v5;
    __int16 v24 = 1026;
    BOOL v25 = v8 < v7;
    __int16 v26 = 1026;
    int v27 = v7;
    __int16 v28 = 1026;
    unsigned int v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash connect\", \"item\":%{private, location:escape_only}@, \"decision\":%{public}hhd, \"eligible\":%{public}hhd, \"slotAvail\":%{public}hhd, \"leashesAllowed\":%{public}d, \"slotInUse\":%{public}hhd}", (uint8_t *)v15, 0x3Au);
  }
  return v12;
}

- (BOOL)shouldHoldLeashForDevice:(id)a3
{
  id v4 = -[NSMutableDictionary objectForKey:](self->_maintenanceEvictionMap, "objectForKey:", [a3 uuid]);
  unsigned int v5 = [a3 isLeashSlotInUse];
  if (v4) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v5;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  unint64_t v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68290051;
    __int16 v10 = 2082;
    v9[1] = 0;
    int v11 = "";
    __int16 v12 = 2113;
    id v13 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    __int16 v14 = 1026;
    BOOL v15 = v6;
    __int16 v16 = 1026;
    unsigned int v17 = [a3 isLeashSlotInUse];
    __int16 v18 = 1026;
    BOOL v19 = v4 == 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash hold\", \"item\":%{private, location:escape_only}@, \"decision\":%{public}hhd, \"leashslot\":%{public}hhd, \"notevicting\":%{public}hhd}", (uint8_t *)v9, 0x2Eu);
  }
  return v6;
}

- (unsigned)getNearOwnerTimeoutForDevice:(id)a3 checkingForNetwork:(BOOL)a4 checkingHele:(BOOL)a5
{
  BOOL v5 = a4;
  unsigned __int16 v8 = 960;
  if (a5)
  {
    unsigned int v9 = [a3 isHeleAccessory];
    if (v9) {
      unsigned __int16 v8 = 3660;
    }
    else {
      unsigned __int16 v8 = 960;
    }
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    unsigned int v9 = 0;
    if (!a4) {
      goto LABEL_10;
    }
  }
  if (!self->_networkAvailable)
  {
    unsigned int v9 = 2;
    unsigned __int16 v8 = 15;
  }
LABEL_10:
  if ([a3 nearOwnerTimeoutOverride])
  {
    unsigned __int16 v8 = (unsigned __int16)[a3 nearOwnerTimeoutOverride];
    unsigned int v9 = 3;
  }
  else if (+[CLDurianSettings nearOwnerTimeoutOverride])
  {
    unsigned __int16 v8 = (unsigned __int16)[(NSNumber *)+[CLDurianSettings nearOwnerTimeoutOverride] unsignedIntValue];
    [a3 setNearOwnerTimeoutOverride:v8];
    unsigned int v9 = 4;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  __int16 v10 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68289795;
    v12[1] = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2113;
    id v16 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    __int16 v17 = 1026;
    int v18 = v8;
    __int16 v19 = 1026;
    unsigned int v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian nearowner timeout\", \"item\":%{private, location:escape_only}@, \"timeout\":%{public}d, \"path\":%{public}d}", (uint8_t *)v12, 0x28u);
  }
  return v8;
}

- (void)setKeyRollIntervalForDevice:(id)a3
{
  if ([a3 keyRollInterval] != 900)
  {
    unsigned int v4 = [a3 keyRollInterval];
    int v5 = 1;
LABEL_5:
    if (v4 >= 0x3C) {
      int v6 = v5;
    }
    else {
      int v6 = 3;
    }
    goto LABEL_8;
  }
  if (+[CLDurianSettings alignmentIntervalOverride])
  {
    unsigned int v4 = [(NSNumber *)+[CLDurianSettings alignmentIntervalOverride] unsignedIntValue];
    int v5 = 2;
    goto LABEL_5;
  }
  int v6 = 0;
  unsigned int v4 = 900;
LABEL_8:
  if (v4 <= 0x3C) {
    uint64_t v7 = 60;
  }
  else {
    uint64_t v7 = v4;
  }
  if (v7 != 900) {
    [a3 setKeyRollInterval:v7];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  unsigned __int16 v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289795;
    v9[1] = 0;
    __int16 v10 = 2082;
    int v11 = "";
    __int16 v12 = 2113;
    id v13 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v14 = 1026;
    int v15 = v7;
    __int16 v16 = 1026;
    int v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian keyroll interval\", \"item\":%{private, location:escape_only}@, \"interval\":%{public}d, \"path\":%{public}d}", (uint8_t *)v9, 0x28u);
  }
}

- (void)evaluateConnectionStateForDevice:(id)a3
{
  unsigned int v5 = -[CLDurianDeviceManager shouldHoldLeashForDevice:](self, "shouldHoldLeashForDevice:");
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  int v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 68290307;
    int v13 = 0;
    __int16 v14 = 2082;
    int v15 = "";
    __int16 v16 = 2113;
    id v17 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v18 = 1026;
    unsigned int v19 = [a3 numPendingTasks];
    __int16 v20 = 1026;
    unsigned int v21 = v5;
    __int16 v22 = 1026;
    unsigned int v23 = [a3 firmwareUpdateMode];
    __int16 v24 = 1026;
    unsigned int v25 = [a3 btFindingState];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection evaluation\", \"item\":%{private, location:escape_only}@, \"tasks\":%{public}d, \"shouldHoldLeash\":%{public}hhd, \"fwdl\":%{public}hhd, \"btfind\":%{public}d}", (uint8_t *)&v12, 0x34u);
  }
  if ([a3 btFindingState] == (id)2)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    uint64_t v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      int v12 = 68289283;
      int v13 = 0;
      __int16 v14 = 2082;
      int v15 = "";
      __int16 v16 = 2113;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection aggadv\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
    }
  }
  else
  {
    if ([a3 numPendingTasks]) {
      char v9 = 1;
    }
    else {
      char v9 = v5;
    }
    if ((v9 & 1) != 0 || [a3 firmwareUpdateMode])
    {
      [a3 setDesiredConnectionLatency];
    }
    else
    {
      [a3 setDisconnectionReason:@"Debounce"];
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      __int16 v10 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
        int v12 = 68289283;
        int v13 = 0;
        __int16 v14 = 2082;
        int v15 = "";
        __int16 v16 = 2113;
        id v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian disconnecting peripheral\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
      }
      [(CLDurianDeviceManager *)self disconnectDevice:a3];
    }
  }
}

- (char)getQuarterHour
{
  NSInteger v2 = [(NSDateComponents *)[+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") components:64 fromDate:+[NSDate date]] minute];
  uint64_t v3 = ((unsigned __int128)(v2 * (__int128)(uint64_t)0x8888888888888889) >> 64) + v2;
  return 15 * ((v3 < 0) + (v3 >> 3));
}

- (void)maintenanceTimerFiredWithInterval:(double)a3
{
  [(CLDurianDeviceManager *)self maintainAllDevices:a3 != -1.0];
  metricManager = self->_metricManager;
  [(CLDurianMaintenanceUtilities *)self->_maintUtils interval];

  -[CLDurianMetricManager submitMaintenanceTimerFiredMetrics:actualInterval:](metricManager, "submitMaintenanceTimerFiredMetrics:actualInterval:");
}

- (BOOL)shouldEvictForDevice:(id)a3
{
  unsigned int v4 = [[-[NSMutableDictionary allValues](self->_maintenanceEvictionMap) allValues] containsObject:[a3 uuid]];
  unsigned int v5 = &qword_102419000;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  int v6 = &qword_102419000;
  uint64_t v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    unsigned int v9 = [(NSMutableSet *)self->_maintenanceEvictionCandidates count];
    maintenanceEvictionMap = self->_maintenanceEvictionMap;
    uint64_t buf = 68290051;
    __int16 v58 = 2082;
    long long v59 = "";
    __int16 v60 = 2113;
    id v61 = v8;
    __int16 v62 = 1026;
    *(_DWORD *)id v63 = v4;
    *(_WORD *)&v63[4] = 1026;
    *(_DWORD *)&v63[6] = v9;
    LOWORD(v64[0]) = 2114;
    *(void *)((char *)v64 + 2) = maintenanceEvictionMap;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint capped shouldEvict\", \"item\":%{private, location:escape_only}@, \"inprogress\":%{public}hhd, \"candidates\":%{public}d, \"evictMap\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x32u);
  }
  if (v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    id v12 = objc_alloc_init((Class)NSMutableArray);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = self->_maintenanceEvictionCandidates;
    id v13 = [(NSMutableSet *)obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v13)
    {
      id v15 = v13;
      uint64_t v46 = *(void *)v52;
      *(void *)&long long v14 = 68289795;
      long long v42 = v14;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v52 != v46) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          id v18 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v17, v42);
          if (![v18 connectionPriority])
          {
            uint64_t v26 = [(CLDurianDeviceManager *)self getNearOwnerTimeoutForDevice:a3 checkingForNetwork:1 checkingHele:1];
            int v27 = v17;
            if (v5[114] != -1) {
              dispatch_once(&qword_102419390, &stru_102332710);
            }
            __int16 v28 = v6[115];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              id v29 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
              uint64_t buf = 68289539;
              __int16 v58 = 2082;
              long long v59 = "";
              __int16 v60 = 2113;
              id v61 = v29;
              __int16 v62 = 1026;
              *(_DWORD *)id v63 = v26;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian disable leash\", \"item\":%{private, location:escape_only}@, \"nearowner\":%{public}d}", (uint8_t *)&buf, 0x22u);
            }
            [v18 enqueueTask:[v18 createSetNearOwnerTimeoutTaskInSeconds:v26]];
            [v18 enqueueTask:[v18 createSetPersistentConnectionTaskWithState:0]];
            [v18 setMaintenanceOnlyCondition:1];
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_maintenanceEvictionMap, "setObject:forKeyedSubscript:", [a3 uuid], v27);
            [v12 addObject:v27];
            if (v5[114] != -1) {
              dispatch_once(&qword_102419390, &stru_102332710);
            }
            unsigned int v30 = v6[115];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              id v31 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
              unsigned int v32 = [(NSMutableDictionary *)self->_maintenanceEvictionMap count];
              uint64_t buf = v42;
              __int16 v58 = 2082;
              long long v59 = "";
              __int16 v60 = 2113;
              id v61 = v31;
              __int16 v62 = 2113;
              *(void *)id v63 = v27;
              *(_WORD *)&v63[8] = 1026;
              v64[0] = v32;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint capped\", \"item\":%{private, location:escape_only}@, \"evict\":%{private, location:escape_only}@, \"evictcount\":%{public}d}", (uint8_t *)&buf, 0x2Cu);
            }
            BOOL v11 = 1;
            goto LABEL_29;
          }
          if (v5[114] != -1) {
            dispatch_once(&qword_102419390, &stru_102332710);
          }
          unsigned int v19 = v6[115];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v45 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
            id v20 = [[objc_msgSend(v17, "description") substringToIndex:8];
            unsigned int v21 = v17;
            __int16 v22 = v6;
            unsigned int v23 = v5;
            id v24 = v20;
            unsigned int v25 = [v18 connectionPriority];
            uint64_t buf = v42;
            __int16 v58 = 2082;
            long long v59 = "";
            __int16 v60 = 2113;
            id v61 = v45;
            __int16 v62 = 2113;
            *(void *)id v63 = v24;
            unsigned int v5 = v23;
            int v6 = v22;
            id v17 = v21;
            *(_WORD *)&v63[8] = 1025;
            v64[0] = v25;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint capped notidle\", \"item\":%{private, location:escape_only}@, \"evict\":%{private, location:escape_only}@, \"connectionPriority\":%{private}d}", (uint8_t *)&buf, 0x2Cu);
          }
          [v12 addObject:v17];
        }
        id v15 = [(NSMutableSet *)obj countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 0;
LABEL_29:
    if ([v12 count])
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v33 = [v12 countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v48;
        do
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            if (*(void *)v48 != v35) {
              objc_enumerationMutation(v12);
            }
            [(NSMutableSet *)self->_maintenanceEvictionCandidates removeObject:*(void *)(*((void *)&v47 + 1) + 8 * (void)j)];
          }
          id v34 = [v12 countByEnumeratingWithState:&v47 objects:v55 count:16];
        }
        while (v34);
      }
    }
    if (v5[114] != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v37 = v6[115];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      id v38 = [a3 uuid];
      unsigned int v39 = [(NSMutableSet *)self->_maintenanceEvictionCandidates count];
      unsigned int v40 = [v12 count];
      uint64_t buf = 68290051;
      __int16 v58 = 2082;
      long long v59 = "";
      __int16 v60 = 2113;
      id v61 = v38;
      __int16 v62 = 1026;
      *(_DWORD *)id v63 = v11;
      *(_WORD *)&v63[4] = 1025;
      *(_DWORD *)&v63[6] = v39;
      LOWORD(v64[0]) = 1026;
      *(_DWORD *)((char *)v64 + 2) = v40;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint eviction\", \"device\":%{private, location:escape_only}@, \"evicting\":%{public}hhd, \"candidates\":%{private}d, \"removed\":%{public}d}", (uint8_t *)&buf, 0x2Eu);
    }
  }
  return v11;
}

- (void)evaluateDisconnectedDevices
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (([v8 isConnected] & 1) == 0)
        {
          if ([v8 isLeashSlotInUse])
          {
            [v8 setConnectionReason:@"Leash:Releash"];
            [(CLDurianDeviceManager *)self attemptConnectionToDevice:v8];
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)addScanResultAtDate:(id)a3 address:(id)a4 advertisementData:(id)a5 rssi:(int64_t)a6 maintenanceReason:(int64_t)a7 reserved:(id)a8 reconciledInformation:(id)a9
{
  id v15 = [a9 uuid:a3, a4, a5, a6];
  if (v15)
  {
    __int16 v16 = v15;
    id v17 = [(CLDurianDeviceManager *)self deviceWithUUID:v15];
    if ([v17 ownership] == (id)1)
    {
      unsigned int v18 = [(CLDurianDeviceManager *)self isMaintenanceActive];
      if (a7
        && v18
        && (id)[(CLDurianDeviceManager *)self getMaintReasonForDevice:v17] == (id)3)
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        unsigned int v19 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289539;
          int v39 = 0;
          __int16 v40 = 2082;
          int v41 = "";
          __int16 v42 = 2113;
          double v43 = sub_101640700(a4);
          __int16 v44 = 2113;
          id v45 = [[objc_msgSend(v16, "description") substringToIndex:8];
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint reconciling\", \"address\":%{private, location:escape_only}@, \"item\":%{private, location:escape_only}@}", buf, 0x26u);
        }
      }
      else
      {
        [(CLDurianScanCache *)self->_scanCache addScanResultAtDate:a3 address:a4 maintenanceReason:a7 reconciledUUID:v16];
        [objc_msgSend(a4, "mutableCopy") appendData:a5];
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        id v20 = qword_102419398;
        id v37 = a3;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v21 = [(NSString *)[v16 description] substringToIndex:8];
          unint64_t v22 = [a9 matchedIndex];
          unsigned int v23 = [a9 sequence];
          CFStringRef v24 = @"<Invalid>";
          if (v23 == 2) {
            CFStringRef v24 = @"Secondary";
          }
          if (v23 == 1) {
            unsigned int v25 = @"Primary";
          }
          else {
            unsigned int v25 = (__CFString *)v24;
          }
          *(_DWORD *)uint64_t buf = 68289795;
          int v39 = 0;
          __int16 v40 = 2082;
          int v41 = "";
          __int16 v42 = 2113;
          double v43 = v21;
          __int16 v44 = 2049;
          id v45 = (id)v22;
          __int16 v46 = 2081;
          id v47 = [(__CFString *)v25 UTF8String];
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian reconciled advertisement\", \"item\":%{private, location:escape_only}@, \"index\":%{private}lu, \"sequence\":%{private, location:escape_only}s}", buf, 0x30u);
        }
        if ((unint64_t)[a8 length] < 2)
        {
          long long v52 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [a9 matchedIndex]);
          id v28 = +[SPCommandKeysCriteria matchPrimaryIndices:](SPCommandKeysCriteria, "matchPrimaryIndices:", +[NSArray arrayWithObjects:&v52 count:1]);
        }
        else
        {
          buf[0] = 0;
          [a8 getBytes:buf range:1];
          id v26 = [a9 sequence];
          id v27 = [a9 matchedIndex];
          id v28 = +[SPCommandKeysCriteria matchSequence:v26 index:v27 hint:buf[0]];
        }
        id v29 = v28;
        id v36 = [v17 lastReconciledCriteria];
        unsigned int v30 = [v29 _cl_isEqual:];
        [v17 setLastReconciledCriteria:v29];
        [v17 setLastReconciledAddress:a4];
        [v17 setLastReconciliationTime:mach_continuous_time()];
        if ([v17 isAttemptingConnection]) {
          unsigned int v31 = [v17 isConnected] ^ 1;
        }
        else {
          unsigned int v31 = 0;
        }
        if (-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", [v17 uuid])&& a7 <= 0)
        {
          unsigned int v31 = 0;
        }
        if (((v31 ^ 1 | v30) & 1) == 0)
        {
          if (a7) {
            [(CLDurianScanCache *)self->_scanCache addScanResultAtDate:v37 address:a4 maintenanceReason:3 reconciledUUID:v16];
          }
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332710);
          }
          unsigned int v32 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v33 = [(NSString *)[v16 description] substringToIndex:8];
            unsigned int v34 = [(CLDurianDeviceManager *)self isMaintenanceActive];
            *(_DWORD *)uint64_t buf = 68290307;
            if (v34) {
              int v35 = 6;
            }
            else {
              int v35 = 0;
            }
            int v39 = 0;
            __int16 v40 = 2082;
            int v41 = "";
            __int16 v42 = 2113;
            double v43 = v33;
            __int16 v44 = 2114;
            id v45 = v36;
            __int16 v46 = 2114;
            id v47 = v29;
            __int16 v48 = 1026;
            int v49 = v35;
            __int16 v50 = 1026;
            int v51 = a7;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection new reconciled criteria\", \"item\":%{private, location:escape_only}@, \"oldCriteria\":%{public, location:escape_only}@, \"newMaterial\":%{public, location:escape_only}@, \"maintdelay\":%{public}d, \"needsmaint\":%{public}d}", buf, 0x3Cu);
          }
          -[CLDurianDeviceManager fetchConnectionTokensForDevice:usingReconciledUUID:andCriteria:](self, "fetchConnectionTokensForDevice:usingReconciledUUID:andCriteria:", v17, [a9 uuid], v29);
        }
        [(CLDurianDeviceManager *)self dispatchProactiveMaintenanceOnDevice:v17 maintenanceReason:a7];
      }
    }
  }
}

- (void)dispatchProactiveMaintenanceOnDevice:(id)a3 maintenanceReason:(int64_t)a4
{
  id v7 = [a3 activePeripheral];
  if (a4 == 2
    && !v7
    && self->_maintenanceOnWildObservationEnabled
    && ![(CLDurianDeviceManager *)self isMaintenanceActive]
    && ![(CLDurianMaintenanceUtilities *)self->_maintUtils isTinkerWatch]
    && ([a3 isAttemptingConnection] & 1) == 0
    && [(CLDurianDeviceManager *)self sufficientTimeElapsedSinceDisconnectionOfDevice:a3])
  {
    if ([(CLDurianDeviceManager *)self sufficientTimeElapsedSinceLastProactiveMaintenanceOfDevice:a3])
    {
      dispatch_time_t v8 = dispatch_time(0, 1000000000);
      queue = self->_queue;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_101629B00;
      v10[3] = &unk_10229FEB0;
      v10[4] = self;
      v10[5] = a3;
      dispatch_after(v8, queue, v10);
    }
  }
}

- (void)performProactiveMaintenanceOnDevice:(id)a3
{
  unsigned int v5 = -[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", [a3 uuid]);
  unsigned int v6 = [a3 isAttemptingConnection];
  unsigned int v7 = v6;
  if (v5 & 1) != 0 || (v6)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    long long v14 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 68289795;
      int v16 = 0;
      __int16 v17 = 2082;
      unsigned int v18 = "";
      __int16 v19 = 2113;
      id v20 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      __int16 v21 = 1026;
      unsigned int v22 = v5;
      __int16 v23 = 1026;
      unsigned int v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint proactive skipped\", \"item\":%{private, location:escape_only}@, \"maint\":%{public}hhd, \"connect\":%{public}hhd}", (uint8_t *)&v15, 0x28u);
    }
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(CLDurianDeviceManager *)self requestCarScanTimeViaDevice:a3];
    double v10 = vabdd_f64(Current, v9);
    if (v10 > 18.0) {
      CFStringRef v11 = @"Maintenance:Proactive";
    }
    else {
      CFStringRef v11 = @"Maintenance:ProactiveVehicular";
    }
    [a3 setConnectionReason:v11];
    sub_10164083C();
    [a3 setLastProactiveMaintenanceTime:(unint64_t)v12];
    [a3 setProactiveMaintenanceCount:[a3 proactiveMaintenanceCount] + 1];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v13 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      unsigned int v18 = "";
      __int16 v19 = 2113;
      id v20 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint proactive\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
    [a3 setMaintenanceOnlyCondition:1];
    [a3 setNumProactiveAttempts:([a3 numProactiveAttempts] + 1)];
    if ([(CLDurianDeviceManager *)self attemptConnectToDevice:a3 onCondition:1])
    {
      [a3 setIsProactiveAttempt:1];
      if (v10 <= 18.0) {
        [(CLDurianMetricManager *)self->_metricManager submitCarMaintConnectionMetrics:1];
      }
    }
  }
}

- (BOOL)sufficientTimeElapsedSinceDisconnectionOfDevice:(id)a3
{
  [a3 secondsSinceLastDisconnection];
  double v6 = v5;
  unsigned int v7 = [(CLDurianDeviceManager *)self getNearOwnerTimeoutForDevice:a3 checkingForNetwork:0 checkingHele:0];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  dispatch_time_t v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68289795;
    v10[1] = 0;
    __int16 v11 = 2082;
    double v12 = "";
    __int16 v13 = 2113;
    id v14 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    __int16 v15 = 1026;
    int v16 = (int)v6;
    __int16 v17 = 1026;
    unsigned int v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #sufficientTimeElapsedSinceDisconnectionOf\", \"item\":%{private, location:escape_only}@, \"sinceDisconnect\":%{public}d, \"nearOwnerTimeout\":%{public}d}", (uint8_t *)v10, 0x28u);
  }
  return v6 > (double)v7;
}

- (BOOL)sufficientTimeElapsedSinceLastProactiveMaintenanceOfDevice:(id)a3
{
  [a3 secondsSinceLastProactiveMaintenanceAttempt];
  double v5 = v4;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  double v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    __int16 v9 = 2082;
    double v10 = "";
    __int16 v11 = 2113;
    id v12 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v13 = 1026;
    int v14 = (int)v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #sufficientTimeElapsedSinceLastProactiveMaintenanceOf\", \"item\":%{private, location:escape_only}@, \"secondsSinceLastProactiveMaintenanceAttempt\":%{public}d}", (uint8_t *)v8, 0x22u);
  }
  return v5 > 60.0;
}

- (void)connectToDevice:(id)a3 withPeripheral:(id)a4 forcedTimeout:(int64_t)a5
{
  id v6 = a4;
  if ([(NSMutableDictionary *)self->_connectionTimeoutBlocks objectForKey:a4])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    __int16 v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v64 = 0;
      __int16 v65 = 2082;
      id v66 = "";
      __int16 v67 = 2113;
      id v68 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      __int16 v69 = 2113;
      *(void *)id v70 = [[[v6 identifier] description] substringToIndex:8];
      double v10 = "{\"msg%{public}.0s\":\"#durian #connection defering, peripheral pending\", \"item\":%{private, location:esca"
            "pe_only}@, \"periph\":%{private, location:escape_only}@}";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0x26u);
      return;
    }
    return;
  }
  id v11 = [objc_msgSend(a3, "activeConnectionAttempt") nextConnectionMaterialForPeripheral:v6];
  if (v11)
  {
    id v12 = v11;
    id v13 = +[NSMutableDictionary dictionary];
    [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:CBConnectPeripheralOptionHideFromBTSettings];
    uint64_t v14 = CBConnectPeripheralOptionConnectionUseCase;
    [v13 setObject:&off_102395438 forKeyedSubscript:CBConnectPeripheralOptionConnectionUseCase];
    if ((unint64_t)objc_msgSend(objc_msgSend(v12, "ltk"), "length") >= 0x10)
    {
      id v15 = [[objc_msgSend(v12, "ltk") subdataWithRange:0, 16];
      [v13 setObject:v15 forKeyedSubscript:CBConnectPeripheralOptionUseTempLTK];
    }
    id v61 = v12;
    unsigned int v16 = -[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", [a3 uuid]);
    unsigned int v17 = [(CLDurianDeviceManager *)self shouldConnectUsingLeashToDevice:a3];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    unsigned int v18 = qword_102419398;
    unsigned int v62 = v17;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68290307;
      int v64 = 0;
      __int16 v65 = 2082;
      id v66 = "";
      __int16 v67 = 2113;
      id v68 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      __int16 v69 = 2113;
      *(void *)id v70 = [[[objc_msgSend(objc_msgSend(v6, "identifier"), "description") substringToIndex:8];
      *(_WORD *)&v70[8] = 1026;
      *(_DWORD *)char v71 = v16;
      *(_WORD *)&v71[4] = 1026;
      *(_DWORD *)&v71[6] = v17;
      LOWORD(v72) = 1026;
      *(_DWORD *)((char *)&v72 + 2) = [(CLDurianDeviceManager *)self leashSlotsInUse];
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection usecase\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"maint\":%{public}hhd, \"shouldLeash\":%{public}hhd, \"slotsInUse\":%{public}d}", buf, 0x38u);
    }
    if (v17)
    {
      [v13 setObject:&off_102395450 forKeyedSubscript:v14];
      [a3 setLeashState:2];
    }
    __int16 v19 = +[CLDurianSettings testMode];
    int coexImpactState = self->_coexImpactState;
    if ([(NSString *)v19 isEqualToString:@"User3060"])
    {
      CFStringRef v21 = @"testUser3060";
      int64_t v22 = 10;
      uint64_t v23 = 3;
      goto LABEL_77;
    }
    if ([a3 maintenanceOnlyCondition]
      && [(NSString *)v19 isEqualToString:@"Maintenance30300"])
    {
      CFStringRef v21 = @"testMaint30300";
LABEL_49:
      int64_t v22 = 600;
      uint64_t v23 = 6;
      goto LABEL_77;
    }
    int v24 = coexImpactState & 5;
    unsigned int v25 = [a3 isTAAISDevice];
    unsigned int v26 = [a3 isHeleAccessory];
    unsigned int v27 = v26;
    if (v25)
    {
      if (v24) {
        char v28 = v26;
      }
      else {
        char v28 = 1;
      }
      if (v26) {
        uint64_t v23 = 6;
      }
      else {
        uint64_t v23 = 1;
      }
      if (v26) {
        CFStringRef v21 = @"AIShele";
      }
      else {
        CFStringRef v21 = @"AIS5g";
      }
      if (v26) {
        int64_t v22 = 600;
      }
      else {
        int64_t v22 = 10;
      }
      if ((v28 & 1) == 0)
      {
        BOOL v29 = (self->_coexImpactState & 3) == 0;
        if ((self->_coexImpactState & 3) != 0) {
          uint64_t v23 = 6;
        }
        else {
          uint64_t v23 = 4;
        }
        if ((self->_coexImpactState & 3) != 0) {
          CFStringRef v21 = @"AIScoex";
        }
        else {
          CFStringRef v21 = @"AIS2g";
        }
        uint64_t v30 = 600;
        uint64_t v31 = 20;
LABEL_59:
        if (v29) {
          int64_t v22 = v31;
        }
        else {
          int64_t v22 = v30;
        }
      }
    }
    else
    {
      id v32 = [a3 maintenanceOnlyCondition];
      if (v27)
      {
        if (v32)
        {
          CFStringRef v21 = @"mainthele";
          goto LABEL_49;
        }
        if ((self->_coexImpactState & 2) != 0) {
          uint64_t v23 = 3;
        }
        else {
          uint64_t v23 = 1;
        }
        if ((self->_coexImpactState & 2) != 0) {
          CFStringRef v21 = @"userhelewc";
        }
        else {
          CFStringRef v21 = @"userhele";
        }
        int64_t v22 = 60;
      }
      else
      {
        int v33 = self->_coexImpactState;
        if (v32 && v24)
        {
          CFStringRef v21 = @"maint2g";
          if ((v33 & 3) == 0)
          {
            int64_t v22 = 20;
            uint64_t v23 = 4;
            goto LABEL_77;
          }
          BOOL v29 = self->_maintDutyCycleUpgrade == 0;
          if (self->_maintDutyCycleUpgrade) {
            uint64_t v23 = 4;
          }
          else {
            uint64_t v23 = 6;
          }
          if (!self->_maintDutyCycleUpgrade) {
            CFStringRef v21 = @"maintcoex";
          }
          uint64_t v30 = 20;
          uint64_t v31 = 600;
          goto LABEL_59;
        }
        if ((v33 & 2) != 0) {
          uint64_t v23 = 3;
        }
        else {
          uint64_t v23 = 1;
        }
        if ((v33 & 2) != 0) {
          CFStringRef v21 = @"usercoex";
        }
        else {
          CFStringRef v21 = @"userOr5g";
        }
        int64_t v22 = 10;
      }
    }
LABEL_77:
    CFStringRef v60 = v21;
    if (a5)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      unsigned int v34 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v35 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
        *(_DWORD *)uint64_t buf = 68289795;
        int v64 = 0;
        __int16 v65 = 2082;
        id v66 = "";
        __int16 v67 = 2113;
        id v68 = v35;
        __int16 v69 = 1026;
        *(_DWORD *)id v70 = v22;
        *(_WORD *)&v70[4] = 1026;
        *(_DWORD *)&v70[6] = a5;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection forcedTimeout\", \"item\":%{private, location:escape_only}@, \"timeout\":%{public}d, \"forced\":%{public}d}", buf, 0x28u);
      }
    }
    else
    {
      a5 = v22;
    }
    id v36 = +[NSNumber numberWithInteger:v23];
    [v13 setObject:v36 forKeyedSubscript:CBConnectPeripheralOptionSetConnectScanDutyCycle];
    id v37 = off_102332770[v23 - 1];
    int v59 = sub_101640950();
    if (!v59) {
      goto LABEL_103;
    }
    unsigned __int8 v38 = [a3 isHeleAccessory];
    unsigned int v39 = [a3 isLeashSlotInUse];
    if (v38)
    {
      if (v39)
      {
        if ([a3 maintenanceOnlyCondition]) {
          uint64_t v40 = 65539;
        }
        else {
          uint64_t v40 = 65538;
        }
        goto LABEL_102;
      }
      if ([a3 isTAAISDevice])
      {
        uint64_t v40 = 65561;
LABEL_102:
        [v13 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v40) forKeyedSubscript:v14];
        a5 *= 2;
LABEL_103:
        int v44 = [[v13 objectForKeyedSubscript:v14] intValue];
        if (v44 >= 0x20000)
        {
          if (v44 >= 327680)
          {
            if (v44 > 589824)
            {
              if (v44 <= 2147418111)
              {
                switch(v44)
                {
                  case 589825:
                    id v45 = "FindNearbyPencil";
                    break;
                  case 655360:
                    id v45 = "AccessDigitalHomeKey";
                    break;
                  case 786432:
                    id v45 = "ProxControlDeviceClose";
                    break;
                  default:
LABEL_244:
                    id v45 = "?";
                    break;
                }
              }
              else
              {
                switch(v44)
                {
                  case 2147418112:
                    id v45 = "InternalTestNoLockScan";
                    break;
                  case 2147418113:
                    id v45 = "InternalTestNoScreenOffScan";
                    break;
                  case 2147418114:
                    id v45 = "InternalTestScanWithNoDups";
                    break;
                  case 2147418115:
                    id v45 = "InternalTestScanWithDups";
                    break;
                  case 2147418116:
                    id v45 = "InternalTestScanFor20Seconds";
                    break;
                  case 2147418117:
                    id v45 = "InternalTestActiveScan";
                    break;
                  case 2147418118:
                    id v45 = "InternalTestUUIDScan";
                    break;
                  case 2147418119:
                    id v45 = "InternalTestScanFor10ClockSeconds";
                    break;
                  case 2147418120:
                    id v45 = "InternalTestScanBoost";
                    break;
                  default:
                    goto LABEL_244;
                }
              }
            }
            else if (v44 > 458752)
            {
              switch(v44)
              {
                case 524288:
                  id v45 = "ADPD";
                  break;
                case 524289:
                  id v45 = "ADPDBuffer";
                  break;
                case 524290:
                  id v45 = "MicroLocation";
                  break;
                case 524291:
                  id v45 = "MicroLocationLeech";
                  break;
                default:
                  if (v44 == 458753)
                  {
                    id v45 = "PrecisionFindingFindee";
                  }
                  else
                  {
                    if (v44 != 589824) {
                      goto LABEL_244;
                    }
                    id v45 = "FindNearbyRemote";
                  }
                  break;
              }
            }
            else
            {
              switch(v44)
              {
                case 393216:
                  id v45 = "CaptiveNetworkJoin";
                  break;
                case 393217:
                  id v45 = "UseCaseSIMTransfer";
                  break;
                case 393218:
                  id v45 = "MacSetup";
                  break;
                case 393219:
                  id v45 = "AppleIDSignIn";
                  break;
                case 393220:
                  id v45 = "AppleIDSignInSettings";
                  break;
                default:
                  if (v44 == 327680)
                  {
                    id v45 = "RapportThirdParty";
                  }
                  else
                  {
                    if (v44 != 458752) {
                      goto LABEL_244;
                    }
                    id v45 = "PrecisionFindingFinder";
                  }
                  break;
              }
            }
          }
          else
          {
            switch(v44)
            {
              case 131072:
                id v45 = "SharingDefault";
                break;
              case 131073:
                id v45 = "SharingPhoneAutoUnlock";
                break;
              case 131074:
                id v45 = "SharingSiriWatchAuth";
                break;
              case 131075:
                id v45 = "SharingMacAutoUnlock";
                break;
              case 131076:
                id v45 = "SharingEDTScreenOn";
                break;
              case 131077:
                id v45 = "SharingEDTWiFiDisabled";
                break;
              case 131078:
                id v45 = "SharingEDTWombatEligibleAsDefaultCamera";
                break;
              case 131079:
                id v45 = "SharingEDTWombatCameraPicker";
                break;
              case 131080:
                id v45 = "SharingWombatBackground";
                break;
              case 131081:
                id v45 = "SharingUniversalControl";
                break;
              case 131082:
                id v45 = "SharingPeopleProximity";
                break;
              case 131083:
                id v45 = "SharingEDTEnsembleOpenDisplayPrefs";
                break;
              case 131084:
                id v45 = "SharingEDTNearbydMotionStopped";
                break;
              case 131085:
                id v45 = "SharingDoubleBoostGenericScan";
                break;
              case 131086:
                id v45 = "SharingEDTIncomingAdvertisement ";
                break;
              case 131087:
                id v45 = "SharingEDTWombatStreamStart";
                break;
              case 131088:
                id v45 = "SharingOYAutoUnlock";
                break;
              case 131089:
                goto LABEL_244;
              case 131090:
                id v45 = "SharingAirDrop";
                break;
              case 131091:
                id v45 = "SharingNearbyInvitationHost";
                break;
              case 131092:
                id v45 = "SharingNearbyInvitationParticipant";
                break;
              case 131093:
                id v45 = "SharingAirDropAskToAirDrop";
                break;
              case 131094:
                id v45 = "SharingAirDropTempIdentity";
                break;
              case 131095:
                id v45 = "SharingAirDropNeedsCLink";
                break;
              case 131096:
                id v45 = "SharingRemoteWidgetUpdate";
                break;
              case 131097:
                id v45 = "SharingCountryCodeUpdate";
                break;
              case 131098:
                id v45 = "SharingMacPhoneAutoUnlock";
                break;
              case 131099:
                id v45 = "SharingVisionProDiscovery";
                break;
              case 131100:
                id v45 = "SharingVisionProStateChange";
                break;
              case 131101:
                id v45 = "SharingContinuityScreen";
                break;
              case 131102:
                id v45 = "SharingEDTRemoteDisplay";
                break;
              default:
                if (v44 == 196608)
                {
                  id v45 = "DigitalIDTSA";
                }
                else
                {
                  if (v44 != 0x40000) {
                    goto LABEL_244;
                  }
                  id v45 = "DigitalCarKeyThirdParty";
                }
                break;
            }
          }
        }
        else if (v44 <= 0x20000)
        {
          switch(v44)
          {
            case 65536:
              id v45 = "FindMyAction";
              break;
            case 65537:
              id v45 = "FindMyBackground";
              break;
            case 65538:
              id v45 = "FindMyActionHELE";
              break;
            case 65539:
              id v45 = "FindMyBackgroundHELE";
              break;
            case 65540:
              id v45 = "FindMyActionTransient";
              break;
            case 65541:
              id v45 = "FindMyBackgroundTransient";
              break;
            case 65542:
              id v45 = "FindMyActionHELETransient";
              break;
            case 65543:
              id v45 = "FindMyBackgroundHELETransient";
              break;
            case 65544:
              id v45 = "FindMyNotOptedIn";
              break;
            case 65545:
              id v45 = "FindMyOptedIn";
              break;
            case 65546:
              id v45 = "FindMySepAlertsEnabled";
              break;
            case 65547:
              id v45 = "FindMyTemporaryAggressiveLegacy";
              break;
            case 65548:
              id v45 = "FindMyTemporaryLongAggressive";
              break;
            case 65549:
              id v45 = "FindMyBTFindingUserInitiated";
              break;
            case 65550:
              id v45 = "FindMyHELE";
              break;
            case 65551:
              id v45 = "FindMyBeaconOnDemand";
              break;
            case 65552:
              id v45 = "FindMyWildTimedScan";
              break;
            case 65553:
              id v45 = "FindMyBackgroundLeechScan";
              break;
            case 65554:
              id v45 = "FindMySnifferMode";
              break;
            case 65555:
              id v45 = "FindMyUnpair";
              break;
            case 65556:
              id v45 = "FindMyUnpairHELE";
              break;
            case 65557:
              id v45 = "FindMyPlaySound";
              break;
            case 65558:
              id v45 = "FindMyPlaySoundHELE";
              break;
            case 65559:
              id v45 = "FindMyNotOptedInBeepOnMoveWaking";
              break;
            case 65560:
              id v45 = "FindMyUTTransient";
              break;
            case 65561:
              id v45 = "FindMyUTHELETransient";
              break;
            default:
              JUMPOUT(0);
          }
        }
        else
        {
          id v45 = "Unspecified";
          switch(v44)
          {
            case 0:
              break;
            case 1:
              id v45 = "HealthKit";
              break;
            case 2:
              id v45 = "HomeKit";
              break;
            case 3:
              id v45 = "FindMyObjectConnection";
              break;
            case 4:
              id v45 = "FindMyObjectConnectionTransient";
              break;
            case 5:
              id v45 = "MIDI";
              break;
            case 6:
              id v45 = "Continuity";
              break;
            case 7:
              id v45 = "InstantHotSpot";
              break;
            case 8:
              id v45 = "NearBy";
              break;
            case 9:
              id v45 = "Sharing";
              break;
            case 10:
              id v45 = "HearingSupport";
              break;
            case 11:
              id v45 = "Magnet";
              break;
            case 12:
              id v45 = "HID";
              break;
            case 13:
              id v45 = "LEA";
              break;
            case 14:
              id v45 = "External";
              break;
            case 15:
              id v45 = "ExternalMedical";
              break;
            case 16:
              id v45 = "ExternalLock";
              break;
            case 17:
              id v45 = "ExternalWatch";
              break;
            case 18:
              id v45 = "SmartRouting";
              break;
            case 19:
              id v45 = "DigitalID";
              break;
            case 20:
              id v45 = "DigitalKey";
              break;
            case 21:
              id v45 = "DigitalCarKey";
              break;
            case 22:
              id v45 = "HeySiri";
              break;
            case 23:
              id v45 = "ThirdPartyApp";
              break;
            case 24:
              id v45 = "CNJ";
              break;
            default:
              switch(v44)
              {
                case 256:
                  id v45 = "DevicePresenceDetection";
                  break;
                case 257:
                  id v45 = "AudioBox";
                  break;
                case 258:
                  id v45 = "SIMTransfer";
                  break;
                case 259:
                  id v45 = "ProximityScreenOnLeechScan";
                  break;
                case 260:
                  id v45 = "MacMigrate";
                  break;
                case 263:
                  id v45 = "HIDUARTService";
                  break;
                case 264:
                  id v45 = "AccessibilitySwitchControlPairing";
                  break;
                case 265:
                  id v45 = "BaseBandFastConnect";
                  break;
                case 266:
                  id v45 = "SafetyAlerts";
                  break;
                case 267:
                  id v45 = "LECarPlay";
                  break;
                case 268:
                  id v45 = "TCCBluetooth";
                  break;
                case 269:
                  id v45 = "AOPBufferLeech";
                  break;
                default:
                  goto LABEL_244;
              }
              break;
          }
        }
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        __int16 v46 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          id v58 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
          id v47 = [[[v6 identifier] description] substringToIndex:8];
          uint64_t v57 = v45;
          id v56 = v37;
          __int16 v48 = sub_101640700([v61 address]);
          int v49 = sub_101640780([v61 ltk]);
          id v50 = v6;
          id v51 = v13;
          int v52 = self->_coexImpactState;
          unsigned int v53 = [a3 maintenanceOnlyCondition];
          unint64_t maintDutyCycleUpgrade = self->_maintDutyCycleUpgrade;
          *(_DWORD *)uint64_t buf = 68292355;
          int v64 = 0;
          __int16 v65 = 2082;
          id v66 = "";
          __int16 v67 = 2113;
          id v68 = v58;
          __int16 v69 = 2113;
          *(void *)id v70 = v47;
          *(_WORD *)&v70[8] = 2113;
          *(void *)char v71 = v48;
          *(_WORD *)&v71[8] = 2113;
          long long v72 = v49;
          __int16 v73 = 1026;
          int v74 = v59;
          __int16 v75 = 2114;
          int v76 = v56;
          __int16 v77 = 1026;
          int v78 = a5;
          __int16 v79 = 2082;
          long long v80 = v57;
          __int16 v81 = 1026;
          int v82 = v52;
          id v13 = v51;
          id v6 = v50;
          __int16 v83 = 1026;
          unsigned int v84 = v62;
          __int16 v85 = 1026;
          unsigned int v86 = v53;
          __int16 v87 = 1026;
          int v88 = maintDutyCycleUpgrade;
          __int16 v89 = 2113;
          CFStringRef v90 = v60;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection create\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"address\":%{private, location:escape_only}@, \"LTK\":%{private, location:escape_only}@, \"sentinel\":%{public}d, \"dutyCycle\":%{public, location:escape_only}@, \"timeout\":%{public}d, \"useCase\":%{public, location:escape_only}s, \"coex\":%{public}d, \"shouldLeash\":%{public}hhd, \"maintOnly\":%{public}d, \"maintUpgrade\":%{public}d, \"path\":%{private, location:escape_only}@}", buf, 0x7Cu);
        }
        [(CLDurianDeviceManager *)self scheduleConnectionTimeout:a5 toDevice:a3 forPeripeheral:v6];
        id v55 = [a3 activeConnectionAttempt];
        [v55 setConnectionAttemptCount:((char *)[v55 connectionAttemptCount]) + 1];
        [(CLDurianDeviceManager *)self connectToPeripheral:v6 withOptions:v13 andTimeout:a5];
        return;
      }
      id v41 = [a3 maintenanceOnlyCondition];
      unsigned int v42 = 65542;
      unsigned int v43 = 65543;
    }
    else
    {
      if (v39)
      {
        if ([a3 maintenanceOnlyCondition]) {
          uint64_t v40 = 65537;
        }
        else {
          uint64_t v40 = 0x10000;
        }
        goto LABEL_102;
      }
      if ([a3 isTAAISDevice])
      {
        uint64_t v40 = 65560;
        goto LABEL_102;
      }
      id v41 = [a3 maintenanceOnlyCondition];
      unsigned int v42 = 65540;
      unsigned int v43 = 65541;
    }
    if (v41) {
      uint64_t v40 = v43;
    }
    else {
      uint64_t v40 = v42;
    }
    goto LABEL_102;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  __int16 v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289539;
    int v64 = 0;
    __int16 v65 = 2082;
    id v66 = "";
    __int16 v67 = 2113;
    id v68 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v69 = 2113;
    *(void *)id v70 = [[[v6 identifier] description] substringToIndex:8];
    double v10 = "{\"msg%{public}.0s\":\"#durian #connection failed to retrieve token\", \"item\":%{private, location:escape_onl"
          "y}@, \"periph\":%{private, location:escape_only}@}";
    goto LABEL_6;
  }
}

- (void)connectToPeripheral:(id)a3 withOptions:(id)a4 andTimeout:(unint64_t)a5
{
}

- (void)cancelPeripheralConnection:(id)a3 forUUID:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  unsigned int v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    __int16 v9 = 2082;
    double v10 = "";
    __int16 v11 = 2113;
    id v12 = [[objc_msgSend(a4, "description") substringToIndex:8];
    __int16 v13 = 2113;
    id v14 = [[[objc_msgSend(objc_msgSend(a3, "identifier"), "description") substringToIndex:8];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection cancelling peripheral\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x26u);
  }
  [(CBCentralManager *)self->_centralManager cancelPeripheralConnection:a3];
}

- (void)cancelConnectionAttemptToDevice:(id)a3
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [objc_msgSend(a3, "activeConnectionAttempt") possiblePeripherals];
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v38 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v25;
    __int16 v9 = &qword_102419000;
    double v10 = &qword_102419000;
    *(void *)&long long v6 = 68289795;
    long long v21 = v6;
    int64_t v22 = self;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (v9[114] != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        __int16 v13 = v10[115];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = v7;
          uint64_t v15 = v8;
          unsigned int v16 = v10;
          unsigned int v17 = v9;
          id v18 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
          id v19 = [[[objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "identifier"), "description"), "substringToIndex:", 8);
          id v20 = [[[v12 identifier] description] substringToIndex:8];
          *(_DWORD *)uint64_t buf = v21;
          int v29 = 0;
          __int16 v30 = 2082;
          uint64_t v31 = "";
          __int16 v32 = 2113;
          id v33 = v18;
          __int16 v9 = v17;
          double v10 = v16;
          uint64_t v8 = v15;
          id v7 = v14;
          self = v22;
          __int16 v34 = 2113;
          id v35 = v19;
          __int16 v36 = 2113;
          id v37 = v20;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt periph cancelall\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", buf, 0x30u);
        }
        -[CLDurianDeviceManager cancelPeripheralConnection:forUUID:](self, "cancelPeripheralConnection:forUUID:", v12, [a3 uuid:v21, v22]);
        [(CLDurianDeviceManager *)self cancelConnectionTimeoutForPeripheral:v12];
      }
      id v7 = [obj countByEnumeratingWithState:&v24 objects:v38 count:16];
    }
    while (v7);
  }
}

- (void)cancelActiveConnectionAttemptsExcludingHele:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v23 = 0;
    __int16 v24 = 2082;
    long long v25 = "";
    __int16 v26 = 1026;
    LODWORD(v27) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection cancelling active attempts\", \"excludeHele\":%{public}hhd}", buf, 0x18u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v19;
    *(void *)&long long v8 = 68289283;
    long long v17 = v8;
    do
    {
      __int16 v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v11);
        if (!v3
          || ([*(id *)(*((void *)&v18 + 1) + 8 * (void)v11) isHeleAccessory] & 1) == 0)
        {
          if (objc_msgSend(objc_msgSend(v12, "activeConnectionAttempt", v17), "state") == (id)1)
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332710);
            }
            __int16 v13 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v14 = [[[v12 uuid] description] substringToIndex:8];
              *(_DWORD *)uint64_t buf = v17;
              int v23 = 0;
              __int16 v24 = 2082;
              long long v25 = "";
              __int16 v26 = 2113;
              id v27 = v14;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection cancelling ongoing connection attempt\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            [(CLDurianDeviceManager *)self cancelConnectionAttemptToDevice:v12];
          }
          else
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332710);
            }
            uint64_t v15 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v16 = [[[v12 uuid] description] substringToIndex:8];
              *(_DWORD *)uint64_t buf = v17;
              int v23 = 0;
              __int16 v24 = 2082;
              long long v25 = "";
              __int16 v26 = 2113;
              id v27 = v16;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection not cancelling attempt, none pending\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
          }
        }
        __int16 v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v9);
  }
}

- (void)reconnectDevice:(id)a3
{
  if (a3)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 68289283;
      int v10 = 0;
      __int16 v11 = 2082;
      id v12 = "";
      __int16 v13 = 2113;
      id v14 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection reconnect device\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
    }
    if ([a3 isConnected])
    {
      [a3 setReconnecting:1];
      [(CLDurianDeviceManager *)self disconnectDevice:a3];
    }
    else
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      id v6 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
        unsigned int v8 = [a3 reconnecting];
        int v9 = 68289539;
        int v10 = 0;
        __int16 v11 = 2082;
        id v12 = "";
        __int16 v13 = 2113;
        id v14 = v7;
        __int16 v15 = 1025;
        unsigned int v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection device to be reconnected has already disconnected\", \"item\":%{private, location:escape_only}@, \"reconnect\":%{private}hhd}", (uint8_t *)&v9, 0x22u);
      }
    }
  }
}

- (void)restartMaintenanceConnections
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  BOOL v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    devicesBeingMaintained = self->_devicesBeingMaintained;
    BOOL maintDiscoveryPending = self->_maintDiscoveryPending;
    uint64_t buf = 68289539;
    __int16 v17 = 2082;
    long long v18 = "";
    __int16 v19 = 2113;
    long long v20 = devicesBeingMaintained;
    __int16 v21 = 1025;
    BOOL v22 = maintDiscoveryPending;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint restart\", \"devices\":%{private, location:escape_only}@, \"discovery\":%{private}hhd}", (uint8_t *)&buf, 0x22u);
  }
  if (!self->_maintDiscoveryPending)
  {
    self->_unint64_t maintDutyCycleUpgrade = 1;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = self->_devicesBeingMaintained;
    id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [(CLDurianDeviceManager *)self restartConnectionAttemptToDevice:[(NSMutableDictionary *)self->_devices objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i)]];
        }
        id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
    [(CLDurianMaintenanceUtilities *)self->_maintUtils takeMaintenancePowerAssertion];
  }
}

- (void)restartConnectionAttemptToDevice:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 68289539;
    int v11 = 0;
    __int16 v12 = 2082;
    long long v13 = "";
    __int16 v14 = 2113;
    id v15 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v16 = 1026;
    unsigned int v17 = [[[a3 activeConnectionAttempt] possiblePeripherals] count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection restart, cancelling peripherals\", \"item\":%{private, location:escape_only}@, \"periphs\":%{public}d}", (uint8_t *)&v10, 0x22u);
  }
  if ([a3 activeConnectionAttempt])
  {
    [a3 setPendingConnectionAttempt:[objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "inertCopy")]];
    if ([(NSMutableDictionary *)self->_connectionTimeoutBlocks count]) {
      [(CLDurianDeviceManager *)self cancelConnectionAttemptToDevice:a3];
    }
    else {
      [(CLDurianDeviceManager *)self activatePendingConnectionAttemptForDevice:a3];
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v7 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      int v10 = 68289283;
      int v11 = 0;
      __int16 v12 = 2082;
      long long v13 = "";
      __int16 v14 = 2113;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #connection tried to restart nil active attempt\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
    }
    id v8 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v9 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      int v10 = 68289283;
      int v11 = 0;
      __int16 v12 = 2082;
      long long v13 = "";
      __int16 v14 = 2113;
      id v15 = v9;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #connection tried to restart nil active attempt", "{\"msg%{public}.0s\":\"#durian #connection tried to restart nil active attempt\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)scheduleConnectionTimeout:(int64_t)a3 toDevice:(id)a4 forPeripeheral:(id)a5
{
  dispatch_time_t v8 = dispatch_walltime(0, 1000000000 * a3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10162C0C0;
  block[3] = &unk_10229FF28;
  block[4] = a4;
  void block[5] = a5;
  block[6] = self;
  dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0, block);
  dispatch_after(v8, (dispatch_queue_t)self->_queue, v9);
  [(NSMutableDictionary *)self->_connectionTimeoutBlocks setObject:v9 forKey:a5];
  _Block_release(v9);
}

- (void)cancelConnectionTimeoutForPeripheral:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_connectionTimeoutBlocks, "objectForKey:");
  if (v5)
  {
    dispatch_block_cancel(v5);
    connectionTimeoutBlocks = self->_connectionTimeoutBlocks;
    [(NSMutableDictionary *)connectionTimeoutBlocks removeObjectForKey:a3];
  }
}

- (id)deviceWithPossiblePeripheral:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    dispatch_block_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([objc_msgSend(objc_msgSend(objc_msgSend(v9, "activeConnectionAttempt"), "possiblePeripherals"), "containsObject:", a3])return v9; {
    if (v6 == (id)++v8)
    }
    {
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)activatePendingConnectionAttemptForDevice:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289283;
    int v10 = 0;
    __int16 v11 = 2082;
    long long v12 = "";
    __int16 v13 = 2113;
    id v14 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection activate pending\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  [a3 setActiveConnectionAttempt:[a3 pendingConnectionAttempt]];
  [a3 setPendingConnectionAttempt:0];
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_10162C4F0;
  v8[3] = &unk_10229FEB0;
  v8[4] = self;
  void v8[5] = a3;
  dispatch_after(v6, queue, v8);
}

- (void)failedToConnectToPossiblePeripheral:(id)a3 withErrorCode:(int64_t)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithPossiblePeripheral:](self, "deviceWithPossiblePeripheral:");
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = [v7 activeConnectionAttempt];
    if ([v8 pendingConnectionAttempt]) {
      id v10 = [v8 pendingConnectionAttempt];
    }
    else {
      id v10 = [v8 activeConnectionAttempt];
    }
    id v12 = [[objc_msgSend(v10, "possiblePeripherals") count];
    if (-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", [v8 uuid]))BOOL v13 = self->_maintDutyCycleUpgrade != 1; {
    else
    }
      BOOL v13 = 0;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v14 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68291587;
      __int16 v28 = 2082;
      int v27 = 0;
      int v29 = "";
      __int16 v30 = 2113;
      id v31 = [[[v8 uuid] description] substringToIndex:8];
      __int16 v32 = 2113;
      id v33 = [[[objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v8, "activeConnectionAttempt"), "identifier"), "description") substringToIndex:8];
      __int16 v34 = 2113;
      id v35 = [[[a3 identifier] description] substringToIndex:8];
      __int16 v36 = 1026;
      unsigned int v37 = [v8 isConnected];
      __int16 v38 = 1026;
      unsigned int v39 = [v9 state];
      __int16 v40 = 1026;
      int v41 = (int)v12;
      __int16 v42 = 1026;
      BOOL v43 = [v8 pendingConnectionAttempt] != 0;
      __int16 v44 = 1026;
      BOOL v45 = a4 == 14;
      __int16 v46 = 1026;
      BOOL v47 = v13;
      __int16 v48 = 1026;
      int v49 = a4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt periph failure\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"connected\":%{public}hhd, \"state\":%{public}d, \"periphs\":%{public}d, \"pending\":%{public}hhd, \"capped\":%{public}hhd, \"maint\":%{public}hhd, \"error\":%{public}d}", buf, 0x5Au);
    }
    id v15 = [v8 pendingConnectionAttempt];
    BOOL v17 = a4 == 14 && v15 == 0 && v13;
    if (!v17 || v12 != (id)1 || ![(CLDurianDeviceManager *)self shouldEvictForDevice:v8])
    {
      if ([v8 pendingConnectionAttempt]) {
        [v8 removePossiblePeripheral:a3];
      }
      else {
        [v9 popConnectionMaterialForPeripheral:a3];
      }
      if (([v8 isConnected] & 1) != 0 || objc_msgSend(v9, "state") == (id)3)
      {
        [v8 setReconnecting:0];
        if (([v8 isConnected] & 1) == 0 && objc_msgSend(v9, "state") == (id)3)
        {
          if ([v8 pendingConnectionAttempt])
          {
            [(CLDurianDeviceManager *)self activatePendingConnectionAttemptForDevice:v8];
            return;
          }
          [(CLDurianDeviceManager *)self sendObservationForDevice:v8 type:3 includeLocation:0];
          if (v13)
          {
            switch(a4)
            {
              case 14:
                [(CLDurianDeviceManager *)self finishMaintainingDevice:v8 withReason:@"capped" andCategory:0];
                __int16 v21 = self;
                BOOL v22 = v8;
                uint64_t v23 = 18;
LABEL_52:
                [(CLDurianDeviceManager *)v21 connectFailedToDevice:v22 withError:v23];
                return;
              case 101:
                CFStringRef v24 = @"error:watchdog";
                break;
              case 47:
                [(CLDurianDeviceManager *)self finishMaintainingDevice:v8 withReason:@"limitExceeded" andCategory:1];
                goto LABEL_47;
              default:
                CFStringRef v24 = @"cantconnect";
                break;
            }
            [(CLDurianDeviceManager *)self finishMaintainingDevice:v8 withReason:v24 andCategory:1];
          }
          else if (a4 == 47)
          {
LABEL_47:
            __int16 v21 = self;
            BOOL v22 = v8;
            uint64_t v23 = 47;
            goto LABEL_52;
          }
          __int16 v21 = self;
          BOOL v22 = v8;
          uint64_t v23 = 3;
          goto LABEL_52;
        }
      }
      else
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        long long v18 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289026;
          int v27 = 0;
          __int16 v28 = 2082;
          int v29 = "";
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection continuing attempt to connect to a peripheral having same address but multiple LTKs serially\"}", buf, 0x12u);
        }
        dispatch_time_t v19 = dispatch_time(0, 1250000000);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10162CAD0;
        block[3] = &unk_10229FF28;
        block[4] = self;
        void block[5] = v8;
        block[6] = a3;
        dispatch_after(v19, queue, block);
      }
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    __int16 v11 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v27 = 0;
      __int16 v28 = 2082;
      int v29 = "";
      __int16 v30 = 2113;
      id v31 = [[[0 uuid] description] substringToIndex:8];
      __int16 v32 = 2113;
      id v33 = [[[a3 identifier] description] substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection failed to connect unrecognized peripheral\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }
}

- (void)restartActiveConnectionAttempts
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  BOOL v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289026;
    __int16 v16 = 2082;
    BOOL v17 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection restarting all active attempts\"}", (uint8_t *)&buf, 0x12u);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v9 isAttemptingConnection]) {
          [(CLDurianDeviceManager *)self restartConnectionAttemptToDevice:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)connectFailedToDevice:(id)a3 withError:(int64_t)a4
{
}

- (int64_t)getStateForCentral:(id)a3
{
  return (int64_t)[a3 state];
}

- (void)centralManagerDidUpdateState:(id)a3
{
  int64_t v4 = [(CLDurianDeviceManager *)self getStateForCentral:a3];

  [(CLDurianDeviceManager *)self handleCentralManagerStateUpdate:v4];
}

- (void)handleCentralManagerStateUpdate:(int64_t)a3
{
  int64_t lastCentralManagerState = self->_lastCentralManagerState;
  self->_int64_t lastCentralManagerState = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68290051;
    int v26 = 0;
    __int16 v27 = 2082;
    __int16 v28 = "";
    __int16 v29 = 2049;
    int64_t v30 = a3;
    __int16 v31 = 2049;
    int64_t v32 = lastCentralManagerState;
    __int16 v33 = 2049;
    uint64_t v34 = [(CLDurianDeviceManager *)self countMaintainableDevices];
    __int16 v35 = 2049;
    uint64_t v36 = [(CLDurianDeviceManager *)self onlyHeleMaintainableDevices];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian CBCentralManager updated state\", \"state\":%{private}ld, \"prev\":%{private}ld, \"devices\":%{private}ld, \"heleonly\":%{private}ld}", buf, 0x3Au);
  }
  int v8 = lastCentralManagerState == 5 || lastCentralManagerState == 10;
  int v10 = a3 == 5 || a3 == 10;
  if (v10 != v8) {
    -[CLDurianDeviceManager checkMaintainableDevices:](self, "checkMaintainableDevices:");
  }
  BOOL v12 = a3 == 5 && lastCentralManagerState == 10;
  if ((lastCentralManagerState != 5 || a3 != 10) && !v12)
  {
    [(CLDurianDeviceManager *)self resetDeviceConnections:@"cbstate"];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = [(NSMutableDictionary *)self->_devices objectEnumerator];
    id v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          dispatch_time_t v19 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (lastCentralManagerState == 10 || lastCentralManagerState == 5)
          {
            [*(id *)(*((void *)&v20 + 1) + 8 * i) setActivePeripheral:0];
            [v19 setDisconnectionReason:@"Reset"];
            [v19 failAllTasksWithError:5];
            [v19 removeAllPossiblePeripherals];
            [v19 setLastDisconnectionTime:-[CLDurianDeviceManager getMachContinuousTime](self, "getMachContinuousTime")];
          }
          if (a3 != 5)
          {
            if ([v19 firmwareUpdateMode]) {
              [v19 handleDisconnectionDuringFirmwareUpdate];
            }
            if ([v19 isHeleAccessory])
            {
              if ([v19 isClassicallyConnected])
              {
                [v19 setLastGroupClassicDisconnectionTime:mach_continuous_time()];
                [v19 setIsClassicallyConnected:0];
              }
            }
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(objc_msgSend(v11, "activeConnectionAttempt"), "possiblePeripherals"), "containsObject:", a4))
        {
          [(CLDurianDeviceManager *)self handleConnectedPeripheral:a4 forDevice:v11];
          return;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  BOOL v12 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [[[a4 identifier] description] substringToIndex:8];
    *(_DWORD *)uint64_t buf = 68289283;
    int v19 = 0;
    __int16 v20 = 2082;
    long long v21 = "";
    __int16 v22 = 2113;
    id v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian unable to find device for connected peripheral!\", \"periph\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
}

- (void)handleConnectedPeripheral:(id)a3 forDevice:(id)a4
{
  id v7 = [a4 activeConnectionAttempt];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = [v7 possiblePeripherals];
  id v9 = [v8 countByEnumeratingWithState:&v34 objects:v55 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ((objc_msgSend(objc_msgSend(a3, "identifier"), "isEqual:", objc_msgSend(v13, "identifier")) & 1) == 0)
        {
          -[CLDurianDeviceManager cancelPeripheralConnection:forUUID:](self, "cancelPeripheralConnection:forUUID:", v13, [a4 uuid]);
          [(CLDurianDeviceManager *)self cancelConnectionTimeoutForPeripheral:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v34 objects:v55 count:16];
    }
    while (v10);
  }
  id v14 = [v7 nextConnectionMaterialForPeripheral:a3];
  [a4 setActivePeripheralMaterial:v14];
  long long v15 = sub_101640700([v14 address]);
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  long long v16 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = [[[objc_msgSend(objc_msgSend(a4, "uuid"), "description") substringToIndex:8];
    id v32 = [[[v7 identifier] description] substringToIndex:8];
    id v17 = [[[a3 identifier] description] substringToIndex:8];
    long long v18 = [(NSString *)v15 UTF8String];
    uint64_t v19 = [[v14 primaryIndex] unsignedIntValue];
    uint64_t v20 = [[v14 secondaryIndex] unsignedIntValue];
    [v7 attemptDuration];
    *(_DWORD *)uint64_t buf = 68290819;
    int v39 = 0;
    __int16 v40 = 2082;
    int v41 = "";
    __int16 v42 = 2113;
    id v43 = v33;
    __int16 v44 = 2113;
    unint64_t v45 = (unint64_t)v32;
    __int16 v46 = 2113;
    *(void *)BOOL v47 = v17;
    *(_WORD *)&v47[8] = 2082;
    __int16 v48 = v18;
    __int16 v49 = 2050;
    uint64_t v50 = v19;
    __int16 v51 = 2050;
    uint64_t v52 = v20;
    __int16 v53 = 2050;
    uint64_t v54 = v21;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt success\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"address\":%{public, location:escape_only}s, \"primaryIndex\":%{public}lu, \"secondaryIndex\":%{public}lu, \"ttc\":\"%{public}.1f\"}", buf, 0x58u);
  }
  [a4 intervalSinceLastSearchPartyKeyObservation];
  [CLDurianMetricManager submitConnectionAttemptSuccessEvent:objc_msgSend(objc_msgSend(objc_msgSend(a4, "activeConnectionAttempt"), "krMaterials"), "containsObject:", v14) krMaterial:objc_msgSend(a4, "getConnectionReason") connectionReason:objc_msgSend(a4, "prettyBeaconType") deviceType:v22];
  [a4 transitionToState:3 event:6 task:0];
  [a4 setActivePeripheral:a3];
  [a4 setReconnecting:0];
  [(CLDurianDeviceManager *)self scheduleConnectionEvaluationForDevice:a4];
  [(CLDurianDeviceManager *)self sendObservationForDevice:a4 type:1 includeLocation:1];
  unsigned int v23 = [a4 isLeashSlotInUse];
  uint64_t v24 = [(CLDurianDeviceManager *)self getNearOwnerTimeoutForDevice:a4 checkingForNetwork:1 checkingHele:1];
  [a4 setNearOwnerTimeout:v24];
  [(CLDurianDeviceManager *)self setKeyRollIntervalForDevice:a4];
  if (v23)
  {
    [(CLDurianDeviceManager *)self finishMaintainingDevice:a4 withReason:@"leashed" andCategory:3];
    [(CLDurianDeviceManager *)self sendSeparationStateForDevice:a4 state:SPTagSeparationStateLeashConnected includeLocation:0];
    -[CLDurianDeviceDelegate onConnectionStateChangeForDeviceWithUUID:fromState:toState:](self->_deviceDelegate, "onConnectionStateChangeForDeviceWithUUID:fromState:toState:", [a4 uuid], 0, 4);
    unsigned int v25 = [(CLDurianDeviceManager *)self shouldHoldLeashForDevice:a4];
    unint64_t v26 = [(CLDurianDeviceManager *)self totalConnectionCount];
    if ([a4 leashNeedsConfiguring])
    {
      if ([a4 nearOwnerTimeoutOverride]) {
        uint64_t v24 = v24;
      }
      else {
        uint64_t v24 = 15;
      }
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    __int16 v27 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [[[objc_msgSend(objc_msgSend(a4, "uuid"), "description") substringToIndex:8];
      unsigned int v29 = [a4 leashState];
      *(_DWORD *)uint64_t buf = 68290307;
      int v39 = 0;
      __int16 v40 = 2082;
      int v41 = "";
      __int16 v42 = 2113;
      id v43 = v28;
      __int16 v44 = 2050;
      unint64_t v45 = v26;
      __int16 v46 = 1026;
      *(_DWORD *)BOOL v47 = v25;
      *(_WORD *)&v47[4] = 1026;
      *(_DWORD *)&v47[6] = v29 != 0;
      LOWORD(v48) = 1026;
      *(_DWORD *)((char *)&v48 + 2) = v24;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash configuring\", \"item\":%{private, location:escape_only}@, \"totalConnectionCount\":%{public}lu, \"shouldHoldLeash\":%{public}hhd, \"leashstate\":%{public}hhd, \"nearowner\":%{public}d}", buf, 0x38u);
    }
    if ([a4 leashNeedsConfiguring])
    {
      [a4 enqueueTask:[a4 createSetNearOwnerTimeoutTaskInSeconds:v24]];
      [a4 enqueueTask:[a4 createSetPersistentConnectionTaskWithState:1]];
      [a4 setLeashState:3];
    }
  }
  else
  {
    [(CLDurianDeviceManager *)self finishMaintainingDevice:a4 withReason:@"performed" andCategory:3];
    [(CLDurianDeviceManager *)self sendSeparationStateForDevice:a4 state:SPTagSeparationStateConnected includeLocation:0];
    -[CLDurianDeviceDelegate onConnectionStateChangeForDeviceWithUUID:fromState:toState:](self->_deviceDelegate, "onConnectionStateChangeForDeviceWithUUID:fromState:toState:", [a4 uuid], 0, 2);
  }
  if ([a4 shouldDiscoverHawkeyeServices])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    int64_t v30 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v39 = 0;
      __int16 v40 = 2082;
      int v41 = "";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian cancelling connection timeout and discovering #hawkeye services\"}", buf, 0x12u);
    }
    [a4 discoverHawkeyeService];
  }
  if ([a4 shouldDiscoverPoshServices])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    __int16 v31 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v39 = 0;
      __int16 v40 = 2082;
      int v41 = "";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian cancelling connection timeout and discovering #posh services\"}", buf, 0x12u);
    }
    [a4 discoverPoshService];
  }
}

- (void)centralManager:(id)a3 canSendDataToPeripheral:(id)a4
{
  if (objc_msgSend(-[CLDurianDeviceManager deviceWithActivePeripheral:](self, "deviceWithActivePeripheral:", a4), "isHawkeyeAccessory"))
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      BOOL v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye canSendDataToPeripheral, unexpected\"}", (uint8_t *)&v9, 0x12u);
    }
  }
  else
  {
    id v7 = [(CLDurianDeviceManager *)self deviceWithActivePeripheral:a4];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      BOOL v12 = "";
      __int16 v13 = 2113;
      id v14 = [[[v7 uuid] description] substringToIndex:8];
      __int16 v15 = 2113;
      id v16 = [[[objc_msgSend(objc_msgSend(a4, "identifier"), "description") substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian canSendDataToPeripheral\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x26u);
    }
    if ([v7 shouldActivateDevicePostConnection]) {
      [v7 activate];
    }
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = [(CLDurianDeviceManager *)self deviceWithActivePeripheral:a4];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  int v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68289795;
    v10[1] = 0;
    __int16 v11 = 2082;
    BOOL v12 = "";
    __int16 v13 = 2113;
    id v14 = [[[v8 uuid] description] substringToIndex:8];
    __int16 v15 = 2113;
    id v16 = [[[a4 identifier] description] substringToIndex:8];
    __int16 v17 = 2113;
    id v18 = [a5 localizedDescription];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection failed\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)v10, 0x30u);
  }
  -[CLDurianDeviceManager handleConnectionFailureForPeripheral:withErrorCode:](self, "handleConnectionFailureForPeripheral:withErrorCode:", a4, [a5 code]);
}

- (void)handleConnectionFailureForPeripheral:(id)a3 withErrorCode:(int64_t)a4
{
  [(CLDurianDeviceManager *)self cancelConnectionTimeoutForPeripheral:"cancelConnectionTimeoutForPeripheral:"];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289283;
    v8[1] = 0;
    __int16 v9 = 2082;
    int v10 = "";
    __int16 v11 = 2113;
    id v12 = [a3 identifier];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt #watchdog cancelled connection timeout for peripherals associated with a stalled connection attempt\", \"periphs\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  [(CLDurianDeviceManager *)self failedToConnectToPossiblePeripheral:a3 withErrorCode:a4];
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
}

- (void)handleDisconnectedPeripheral:(id)a3 withError:(id)a4
{
  [(CLDurianDeviceManager *)self cancelConnectionTimeoutForPeripheral:"cancelConnectionTimeoutForPeripheral:"];
  id v7 = [(CLDurianDeviceManager *)self deviceWithActivePeripheral:a3];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289795;
    int v39 = 0;
    __int16 v40 = 2082;
    int v41 = "";
    __int16 v42 = 2113;
    id v43 = [[[v7 uuid] description] substringToIndex:8];
    __int16 v44 = 2113;
    id v45 = [[[a3 identifier] description] substringToIndex:8];
    __int16 v46 = 2113;
    id v47 = [a4 localizedDescription];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection disconnected peripheral\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x30u);
  }
  if (!v7)
  {
    [(CLDurianDeviceManager *)self failedToConnectToPossiblePeripheral:a3 withErrorCode:5];
    return;
  }
  if ([v7 isLeashSlotInUse])
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    int v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v39 = 0;
      __int16 v40 = 2082;
      int v41 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian setting leash break time & accessory type\"}", buf, 0x12u);
    }
    [(CLDurianMetricManager *)self->_metricManager setLastLeashBreak:Current];
    -[CLDurianMetricManager setLastLeashBreakAccessoryType:](self->_metricManager, "setLastLeashBreakAccessoryType:", [v7 deviceTypeName]);
    [(CLDurianMetricManager *)self->_metricManager submitSystemWakeLeashBreakMetricsPerAccessoryAtLoi:[(CLDurianDeviceManager *)self loiType] forLeashBreak:1];
  }
  deviceDelegate = self->_deviceDelegate;
  id v12 = [v7 uuid];
  if ([v7 isLeashSlotInUse]) {
    uint64_t v13 = 4;
  }
  else {
    uint64_t v13 = 2;
  }
  [(CLDurianDeviceDelegate *)deviceDelegate onConnectionStateChangeForDeviceWithUUID:v12 fromState:v13 toState:0];
  unsigned __int8 v14 = [v7 activePeripheralReady];
  if (a4 || (v14 & 1) != 0)
  {
    if (a4) {
      goto LABEL_22;
    }
    uint64_t v19 = kCLErrorDomainPrivate;
    NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
    CFStringRef v35 = sub_101640864(5uLL);
    id v16 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    uint64_t v17 = v19;
    uint64_t v18 = 5;
  }
  else
  {
    uint64_t v15 = kCLErrorDomainPrivate;
    NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
    CFStringRef v37 = sub_101640864(0x14uLL);
    id v16 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    uint64_t v17 = v15;
    uint64_t v18 = 20;
  }
  a4 = +[NSError errorWithDomain:v17 code:v18 userInfo:v16];
LABEL_22:
  [(CLDurianDeviceManager *)self cancelConnectionEvaluationForDevice:v7];
  [(CLDurianDeviceManager *)self sendObservationForDevice:v7 type:3 includeLocation:1];
  [v7 transitionToState:0 event:10 task:0];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  uint64_t v20 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [[[v7 uuid] description] substringToIndex:8];
    id v22 = [[[objc_msgSend(objc_msgSend(a3, "identifier"), "description") substringToIndex:8];
    *(_DWORD *)uint64_t buf = 68289539;
    int v39 = 0;
    __int16 v40 = 2082;
    int v41 = "";
    __int16 v42 = 2113;
    id v43 = v21;
    __int16 v44 = 2113;
    id v45 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian ensuring event counter off for peripheral upon stop\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", buf, 0x26u);
  }
  [v7 stopEventCounter];
  [v7 setActivePeripheral:0 withError:a4];
  [v7 removeAllPossiblePeripherals];
  if ([v7 reconnecting])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    unsigned int v23 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [[[v7 uuid] description] substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289283;
      int v39 = 0;
      __int16 v40 = 2082;
      int v41 = "";
      __int16 v42 = 2113;
      id v43 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection disconnected reconnecting peripheral, kicking off reconnect\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    [v7 setReconnecting:0];
    [(CLDurianDeviceManager *)self attemptConnectionToDevice:v7];
  }
  if (![v7 firmwareUpdateMode]) {
    goto LABEL_36;
  }
  if (![v7 firmwareUpdateReboot])
  {
    [v7 setDisconnectionReason:@"FWDL:Failure"];
    [v7 handleDisconnectionDuringFirmwareUpdate];
LABEL_36:
    [v7 sendDisconnectionMetric];
    [v7 setQuarterHourDisconnect:-[CLDurianDeviceManager getQuarterHour](self, "getQuarterHour")];
    goto LABEL_37;
  }
  [v7 setDisconnectionReason:@"FWDL:Success"];
  [(CLDurianDeviceManager *)self attemptConnectionToDevice:v7];
  [v7 sendDisconnectionMetric];
  [v7 setQuarterHourDisconnect:-[CLDurianDeviceManager getQuarterHour](self, "getQuarterHour")];
  [v7 setConnectionReason:@"FWDL:Reboot"];
LABEL_37:
  [v7 failAllTasksWithError:5];
  if ([v7 isLeashSlotInUse])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    unsigned int v25 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [[[v7 uuid] description] substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289283;
      int v39 = 0;
      __int16 v40 = 2082;
      int v41 = "";
      __int16 v42 = 2113;
      id v43 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian leashing enabled, so enqueuing leash task after disconnect\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    [(CLDurianDeviceManager *)self sendSeparationStateForDevice:v7 state:SPTagSeparationStateLeashInterrupted includeLocation:0];
    +[NSDate date];
    -[CLDurianLocationMonitor fetchEstimatedLocationAtDate:handler:](self->_locationMonitor, "fetchEstimatedLocationAtDate:handler:");
    char v27 = 0;
    if (+[CLDurianSettings reconnectAfterLeashFailure])
    {
      [v7 setConnectionReason:@"Leash:Defaults"];
      [(CLDurianDeviceManager *)self attemptConnectionToDevice:v7];
      char v27 = 1;
      [v7 enqueueTask:[v7 createSetPersistentConnectionTaskWithState:1]];
    }
  }
  else
  {
    [(CLDurianDeviceManager *)self sendSeparationStateForDevice:v7 state:SPTagSeparationStateNone includeLocation:0];
    char v27 = 0;
  }
  [v7 setLastProactiveMaintenanceTime:mach_continuous_time()];
  id v28 = -[NSMutableDictionary objectForKeyedSubscript:](self->_maintenanceEvictionMap, "objectForKeyedSubscript:", [v7 uuid]);
  if ((v27 & 1) == 0)
  {
    unsigned int v29 = v28;
    if (v28)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_maintenanceEvictionMap, "removeObjectForKey:", [v7 uuid]);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      int64_t v30 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = [[[v7 uuid] description] substringToIndex:8];
        id v32 = [[objc_msgSend(v29, "description") substringToIndex:8];
        unsigned int v33 = [(NSMutableDictionary *)self->_maintenanceEvictionMap count];
        *(_DWORD *)uint64_t buf = 68289795;
        int v39 = 0;
        __int16 v40 = 2082;
        int v41 = "";
        __int16 v42 = 2113;
        id v43 = v31;
        __int16 v44 = 2113;
        id v45 = v32;
        __int16 v46 = 1026;
        LODWORD(v47) = v33;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint capped evicting\", \"item\":%{private, location:escape_only}@, \"retry\":%{private, location:escape_only}@, \"evictcount\":%{public}d}", buf, 0x2Cu);
      }
      [(CLDurianDeviceManager *)self dispatchCompleteTokenFetchOnUUID:v29];
    }
  }
}

- (void)dispatchCompleteTokenFetchOnUUID:(id)a3
{
  dispatch_time_t v5 = dispatch_time(0, 1250000000);
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_10162E874;
  v7[3] = &unk_10229FEB0;
  v7[4] = self;
  v7[5] = a3;
  dispatch_after(v5, queue, v7);
}

- (void)scheduleDisconnectionOnMissingBeaconWithUUID:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:");
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = [[[v5 uuid] description] substringToIndex:8];
    id v29 = [[[v5 uuid] description] substringToIndex:8];
    id v7 = [[[[[v5 activePeripheral] identifier] description] substringToIndex:8];
    id v8 = "NO";
    if ([v5 isConnected]) {
      __int16 v9 = "YES";
    }
    else {
      __int16 v9 = "NO";
    }
    if ([v5 isTaskQueueEmpty]) {
      int v10 = "YES";
    }
    else {
      int v10 = "NO";
    }
    if ([v5 pendingDisconnect]) {
      id v8 = "YES";
    }
    unsigned int v11 = [(NSMutableDictionary *)self->_scheduledDisconnectionBlocks count];
    *(_DWORD *)uint64_t buf = 68290819;
    int v33 = 0;
    __int16 v34 = 2082;
    CFStringRef v35 = "";
    __int16 v36 = 2113;
    id v37 = v30;
    __int16 v38 = 2113;
    id v39 = v29;
    __int16 v40 = 2113;
    id v41 = v7;
    __int16 v42 = 2082;
    id v43 = v9;
    __int16 v44 = 2082;
    id v45 = v10;
    __int16 v46 = 2082;
    id v47 = v8;
    __int16 v48 = 1026;
    unsigned int v49 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop schedule missing beacon disconnection backstop\", \"item\":%{private, location:escape_only}@, \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"isConnected\":%{public, location:escape_only}s, \"isTaskQueueEmpty\":%{public, location:escape_only}s, \"pendingDisconnect\":%{public, location:escape_only}s, \"devicesScheduledDisconnection\":%{public}d}", buf, 0x54u);
  }
  if ([(NSMutableDictionary *)self->_scheduledDisconnectionBlocks objectForKey:a3])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v12 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v13 = [[[v5 uuid] description] substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289283;
      int v33 = 0;
      __int16 v34 = 2082;
      CFStringRef v35 = "";
      __int16 v36 = 2113;
      id v37 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop already scheduled for disconnection\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
    }
    uint64_t v14 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v15 = [[[v5 uuid] description] substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289283;
      int v33 = 0;
      __int16 v34 = 2082;
      CFStringRef v35 = "";
      __int16 v36 = 2113;
      id v37 = v15;
      id v16 = "#durian #disconnectbackstop already scheduled for disconnection";
      uint64_t v17 = "{\"msg%{public}.0s\":\"#durian #disconnectbackstop already scheduled for disconnection\", \"item\":%{private"
            ", location:escape_only}@}";
      uint64_t v18 = v14;
LABEL_21:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v16, v17, buf, 0x1Cu);
    }
  }
  else if (v5)
  {
    if ([v5 pendingDisconnect])
    {
      if ([v5 isConnected])
      {
        dispatch_time_t v19 = dispatch_time(0, 10000000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10162EF5C;
        block[3] = &unk_10229FF28;
        block[4] = v5;
        void block[5] = self;
        block[6] = a3;
        dispatch_block_t v20 = dispatch_block_create((dispatch_block_flags_t)0, block);
        dispatch_after(v19, (dispatch_queue_t)self->_queue, v20);
        [(NSMutableDictionary *)self->_scheduledDisconnectionBlocks setObject:v20 forKey:a3];
        _Block_release(v20);
      }
      else
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        char v27 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
        {
          id v28 = [[[v5 uuid] description] substringToIndex:8];
          *(_DWORD *)uint64_t buf = 68289283;
          int v33 = 0;
          __int16 v34 = 2082;
          CFStringRef v35 = "";
          __int16 v36 = 2113;
          id v37 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop device already disconnected device\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        [(NSMutableDictionary *)self->_devices removeObjectForKey:a3];
      }
    }
    else
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      unsigned int v25 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
      {
        id v26 = [[[v5 uuid] description] substringToIndex:8];
        *(_DWORD *)uint64_t buf = 68289283;
        int v33 = 0;
        __int16 v34 = 2082;
        CFStringRef v35 = "";
        __int16 v36 = 2113;
        id v37 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop disconnection cancelled\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v21 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v22 = [[[objc_msgSend(objc_msgSend(0, "uuid"), "description") substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289283;
      int v33 = 0;
      __int16 v34 = 2082;
      CFStringRef v35 = "";
      __int16 v36 = 2113;
      id v37 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop scheduling disconnection for a non-existent device\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
    }
    uint64_t v23 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v24 = [[[0 uuid] description] substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289283;
      int v33 = 0;
      __int16 v34 = 2082;
      CFStringRef v35 = "";
      __int16 v36 = 2113;
      id v37 = v24;
      id v16 = "#durian #disconnectbackstop scheduling disconnection for a non-existent device";
      uint64_t v17 = "{\"msg%{public}.0s\":\"#durian #disconnectbackstop scheduling disconnection for a non-existent device\", \"i"
            "tem\":%{private, location:escape_only}@}";
      uint64_t v18 = v23;
      goto LABEL_21;
    }
  }
}

- (void)cancelDisconnectionOnMissingBeaconWithUUID:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:");
  id v6 = [(NSMutableDictionary *)self->_scheduledDisconnectionBlocks objectForKey:a3];
  [v5 setPendingDisconnect:0];
  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    dispatch_block_cancel(v6);
    -[NSMutableDictionary removeObjectForKey:](self->_scheduledDisconnectionBlocks, "removeObjectForKey:", [v5 uuid]);
  }
  [(CLDurianMetricManager *)self->_metricManager submitUnexpectedMissingBeaconMetrics:v5 disconnected:0];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = v6 != 0;
    id v10 = [[[v5 uuid] description] substringToIndex:8];
    id v11 = [[[v5 activePeripheral] identifier] description].substringToIndex:8];
    if ([v5 isConnected]) {
      id v12 = "YES";
    }
    else {
      id v12 = "NO";
    }
    if ([v5 isTaskQueueEmpty]) {
      id v13 = "YES";
    }
    else {
      id v13 = "NO";
    }
    if ([v5 pendingDisconnect]) {
      uint64_t v14 = "YES";
    }
    else {
      uint64_t v14 = "NO";
    }
    unsigned int v15 = [(NSMutableDictionary *)self->_scheduledDisconnectionBlocks count];
    v16[0] = 68290819;
    v16[1] = 0;
    __int16 v17 = 2082;
    uint64_t v18 = "";
    __int16 v19 = 2113;
    id v20 = v10;
    __int16 v21 = 2113;
    id v22 = v11;
    __int16 v23 = 1026;
    BOOL v24 = v9;
    __int16 v25 = 2082;
    id v26 = v12;
    __int16 v27 = 2082;
    id v28 = v13;
    __int16 v29 = 2082;
    id v30 = v14;
    __int16 v31 = 1026;
    unsigned int v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop cancelled missing beacon disconnection backstop timer\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"exists\":%{public}hhd, \"isConnected\":%{public, location:escape_only}s, \"isTaskQueueEmpty\":%{public, location:escape_only}s, \"pendingDisconnect\":%{public, location:escape_only}s, \"devicesScheduledDisconnection\":%{public}d}", (uint8_t *)v16, 0x50u);
  }
}

- (void)centralManager:(id)a3 didSendBytes:(id)a4 toPeripheral:(id)a5 withError:(id)a6
{
  id v8 = [(CLDurianDeviceManager *)self deviceWithActivePeripheral:a5];
  if (a6)
  {
    _[v8 failedToSendBytes:a4];
  }
}

- (void)centralManager:(id)a3 didReceiveData:(id)a4 fromPeripheral:(id)a5
{
  id v6 = [(CLDurianDeviceManager *)self deviceWithActivePeripheral:a5];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  BOOL v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    __int16 v9 = 2082;
    id v10 = "";
    __int16 v11 = 2113;
    id v12 = [[[v6 uuid] description] substringToIndex:8];
    __int16 v13 = 2113;
    id v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received bytes\", \"item\":%{private, location:escape_only}@, \"data\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x26u);
  }
  [v6 didReceiveData:a4];
}

- (void)centralManager:(id)a3 didUpdateConnectionParameters:(id)a4 interval:(id)a5 latency:(id)a6 supervisionTimeout:(id)a7
{
  id v12 = [(CLDurianDeviceManager *)self deviceWithActivePeripheral:a4];
  if (!v12) {
    id v12 = [(CLDurianDeviceManager *)self deviceWithPossiblePeripheral:a4];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  __int16 v13 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 68289795;
    v14[1] = 0;
    __int16 v15 = 2082;
    id v16 = "";
    __int16 v17 = 2113;
    id v18 = [[[v12 uuid] description] substringToIndex:8];
    __int16 v19 = 2113;
    id v20 = [[[objc_msgSend(objc_msgSend(a4, "identifier"), "description") substringToIndex:8];
    __int16 v21 = 2114;
    id v22 = a5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian didUpdateConnectionParameters\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"latency\":%{public, location:escape_only}@}", (uint8_t *)v14, 0x30u);
  }
  [v12 didUpdateConnectionInterval:a5 latency:a6 supervisionTimeout:a7];
}

- (void)handleKeyFetchTimeoutForDevice:(id)a3
{
  if (a3)
  {
    BOOL v5 = ([a3 isConnected] & 1) != 0 || (int)[a3 numPossiblePeripherals] > 0;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      id v16 = "";
      __int16 v17 = 2113;
      id v18 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      __int16 v19 = 1026;
      BOOL v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection token fetch timeout fired\", \"item\":%{private, location:escape_only}@, \"skipError\":%{public}hhd}", buf, 0x22u);
    }
    if (!v5)
    {
      id v7 = objc_alloc((Class)NSError);
      uint64_t v8 = kCLErrorDomainPrivate;
      NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
      CFStringRef v12 = sub_101640864(0x29uLL);
      __int16 v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      id v10 = [v7 initWithDomain:v8 code:41 userInfo:v9];
      [(CLDurianDeviceManager *)self didFetchConnectionMaterial:0 criteria:0 forDevice:a3 error:v10];
      -[NSMutableDictionary removeObjectForKey:](self->_keyFetchTimeoutBlocks, "removeObjectForKey:", [a3 uuid]);
    }
  }
}

- (void)centralManager:(id)a3 didUpdateMTUForPeripheral:(id)a4
{
  id v5 = [(CLDurianDeviceManager *)self deviceWithActivePeripheral:a4];
  if (v5)
  {
    id v6 = v5;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 68289795;
      v8[1] = 0;
      __int16 v9 = 2082;
      id v10 = "";
      __int16 v11 = 2113;
      id v12 = [[[v6 uuid] description] substringToIndex:8];
      __int16 v13 = 2113;
      id v14 = [[[a4 identifier] description] substringToIndex:8];
      __int16 v15 = 2049;
      id v16 = [a4 maximumWriteValueLengthForType:1];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian didUpdateMTUForPeripheral\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"MTUSize\":%{private}lu}", (uint8_t *)v8, 0x30u);
    }
    [v6 didUpdateMTUForDevice];
  }
}

- (void)scheduleTokenFetchTimeoutForDevice:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289283;
    int v10 = 0;
    __int16 v11 = 2082;
    id v12 = "";
    __int16 v13 = 2113;
    id v14 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection scheduling token fetch timeout\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  [(CLDurianDeviceManager *)self cancelTokenFetchTimeoutForDevice:a3];
  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_10162FEA0;
  v8[3] = &unk_10229FEB0;
  v8[4] = self;
  void v8[5] = a3;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
  -[NSMutableDictionary setObject:forKey:](self->_keyFetchTimeoutBlocks, "setObject:forKey:", v7, [a3 uuid]);
  dispatch_after(v6, (dispatch_queue_t)self->_queue, v7);
  _Block_release(v7);
}

- (void)cancelTokenFetchTimeoutForDevice:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_keyFetchTimeoutBlocks, "objectForKey:", [a3 uuid]);
  if (v5)
  {
    dispatch_time_t v6 = v5;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    dispatch_block_t v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 68289539;
      v8[1] = 0;
      __int16 v9 = 2082;
      int v10 = "";
      __int16 v11 = 2113;
      id v12 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      __int16 v13 = 1026;
      int v14 = 1;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection cancelling token fetch timeout\", \"item\":%{private, location:escape_only}@, \"scheduledBlock\":%{public}hhd}", (uint8_t *)v8, 0x22u);
    }
    dispatch_block_cancel(v6);
    -[NSMutableDictionary removeObjectForKey:](self->_keyFetchTimeoutBlocks, "removeObjectForKey:", [a3 uuid]);
  }
}

- (BOOL)checkIfTwoDevicesHaveSamePeripheral:(id)a3 device:(id)a4
{
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v8 = [(NSMutableDictionary *)self->_devices objectEnumerator];
  id v9 = [v8 countByEnumeratingWithState:&v50 objects:v65 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v51;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if ((objc_msgSend(objc_msgSend(objc_msgSend(v13, "activeConnectionAttempt"), "possiblePeripherals"), "containsObject:", a3) & 1) == 0)
        {
          id v14 = [objc_msgSend(v13, "activePeripheral") identifier];
          if (v14 != [a3 identifier]) {
            continue;
          }
        }
        [v7 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v50 objects:v65 count:16];
    }
    while (v10);
  }
  if ([v7 count] != (id)2)
  {
    if ((unint64_t)[v7 count] >= 3)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      __int16 v17 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
      {
        id v18 = [[[objc_msgSend(objc_msgSend(a3, "identifier"), "description") substringToIndex:8];
        *(_DWORD *)uint64_t buf = 68289283;
        int v56 = 0;
        __int16 v57 = 2082;
        id v58 = "";
        __int16 v59 = 2113;
        id v60 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian found more than two devices for connected peripheral\", \"periph\":%{private, location:escape_only}@}", buf, 0x1Cu);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
      }
      __int16 v19 = qword_102419398;
      if (os_signpost_enabled((os_log_t)qword_102419398))
      {
        id v20 = [[[a3 identifier] description] substringToIndex:8];
        *(_DWORD *)uint64_t buf = 68289283;
        int v56 = 0;
        __int16 v57 = 2082;
        id v58 = "";
        __int16 v59 = 2113;
        id v60 = v20;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian found more than two devices for connected peripheral", "{\"msg%{public}.0s\":\"#durian found more than two devices for connected peripheral\", \"periph\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
      goto LABEL_22;
    }
LABEL_61:
    LOBYTE(v21) = 0;
    return v21;
  }
  if (objc_msgSend(objc_msgSend(v7, "objectAtIndexedSubscript:", 0), "isTAAISDevice"))
  {
    uint64_t v15 = 0;
    uint64_t v16 = 1;
  }
  else
  {
    uint64_t v15 = 1;
    if (!objc_msgSend(objc_msgSend(v7, "objectAtIndexedSubscript:", 1), "isTAAISDevice")) {
      goto LABEL_46;
    }
    uint64_t v16 = 0;
  }
  id v22 = [v7 objectAtIndexedSubscript:v15];
  id v23 = [v7 objectAtIndexedSubscript:v16];
  if (v22)
  {
    BOOL v24 = v23;
    if (v23)
    {
      if ([v22 taUnknownBeacon] && objc_msgSend(v24, "unownedBeacon"))
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        __int16 v25 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = [[[objc_msgSend(objc_msgSend(a3, "identifier"), "description") substringToIndex:8];
          id v27 = [v22 uuid];
          id v28 = [v24 uuid];
          *(_DWORD *)uint64_t buf = 68289795;
          int v56 = 0;
          __int16 v57 = 2082;
          id v58 = "";
          __int16 v59 = 2113;
          id v60 = v26;
          __int16 v61 = 2113;
          id v62 = v27;
          __int16 v63 = 2113;
          id v64 = v28;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian found two devices for same peripheral\", \"periph\":%{private, location:escape_only}@, \"AISFetch\":%{private, location:escape_only}@, \"userAction\":%{private, location:escape_only}@}", buf, 0x30u);
        }
        if ([v22 isAttemptingConnection]) {
          [v22 setActiveConnectionAttempt:0];
        }
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v29 = [v22 getPendingTasks];
        id v30 = [v29 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v47;
          do
          {
            for (j = 0; j != v31; j = (char *)j + 1)
            {
              if (*(void *)v47 != v32) {
                objc_enumerationMutation(v29);
              }
              uint64_t v34 = *(void *)(*((void *)&v46 + 1) + 8 * (void)j);
              if ((objc_msgSend(objc_msgSend(v24, "getPendingTasks"), "containsObject:", v34) & 1) == 0) {
                [v24 enqueueTask:v34];
              }
            }
            id v31 = [v29 countByEnumeratingWithState:&v46 objects:v54 count:16];
          }
          while (v31);
        }
        [v24 setTaUnknownBeacon:[v22 taUnknownBeacon]];
        [v22 setUnownedBeacon:[v24 unownedBeacon]];
        id v35 = [v22 uuid];
        if (v35 == [a4 uuid])
        {
LABEL_22:
          LOBYTE(v21) = 1;
          return v21;
        }
        goto LABEL_61;
      }
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      __int16 v42 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
      {
        id v43 = [[[a3 identifier] description] substringToIndex:8];
        *(_DWORD *)uint64_t buf = 68289283;
        int v56 = 0;
        __int16 v57 = 2082;
        id v58 = "";
        __int16 v59 = 2113;
        id v60 = v43;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian unexpected scenario when attempt to connect - missing backed unknownBeacon\", \"periph\":%{private, location:escape_only}@}", buf, 0x1Cu);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
      }
      __int16 v38 = qword_102419398;
      BOOL v21 = os_signpost_enabled((os_log_t)qword_102419398);
      if (v21)
      {
        id v44 = [[[a3 identifier] description] substringToIndex:8];
        *(_DWORD *)uint64_t buf = 68289283;
        int v56 = 0;
        __int16 v57 = 2082;
        id v58 = "";
        __int16 v59 = 2113;
        id v60 = v44;
        __int16 v40 = "#durian unexpected scenario when attempt to connect - missing backed unknownBeacon";
        id v41 = "{\"msg%{public}.0s\":\"#durian unexpected scenario when attempt to connect - missing backed unknownBeacon\""
              ", \"periph\":%{private, location:escape_only}@}";
        goto LABEL_60;
      }
      return v21;
    }
  }
LABEL_46:
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  __int16 v36 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
  {
    id v37 = [[[a3 identifier] description] substringToIndex:8];
    *(_DWORD *)uint64_t buf = 68289283;
    int v56 = 0;
    __int16 v57 = 2082;
    id v58 = "";
    __int16 v59 = 2113;
    id v60 = v37;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian unexpected scenario when attempt to connect - invalid devices\", \"periph\":%{private, location:escape_only}@}", buf, 0x1Cu);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
  }
  __int16 v38 = qword_102419398;
  BOOL v21 = os_signpost_enabled((os_log_t)qword_102419398);
  if (v21)
  {
    id v39 = [[[a3 identifier] description] substringToIndex:8];
    *(_DWORD *)uint64_t buf = 68289283;
    int v56 = 0;
    __int16 v57 = 2082;
    id v58 = "";
    __int16 v59 = 2113;
    id v60 = v39;
    __int16 v40 = "#durian unexpected scenario when attempt to connect - invalid devices";
    id v41 = "{\"msg%{public}.0s\":\"#durian unexpected scenario when attempt to connect - invalid devices\", \"periph\":%{p"
          "rivate, location:escape_only}@}";
LABEL_60:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v40, v41, buf, 0x1Cu);
    goto LABEL_61;
  }
  return v21;
}

- (void)fetchConnectionTokensForDevice:(id)a3 onCondition:(unint64_t)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68290051;
    __int16 v28 = 2082;
    id v29 = "";
    __int16 v30 = 2113;
    id v31 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v32 = 2113;
    id v33 = [[[[a3 activeConnectionAttempt] identifier] description] substringToIndex:8];
    __int16 v34 = 1026;
    unsigned int v35 = [[[a3 activeConnectionAttempt] possiblePeripherals] count];
    __int16 v36 = 1026;
    BOOL v37 = [a3 lastReconciledCriteria] != 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt fetching tokens\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periphs\":%{public}d, \"lastReconciled\":%{public}hhd}", (uint8_t *)&buf, 0x32u);
  }
  [a3 transitionToState:1 event:0 task:0];
  if ([a3 isTAAISDevice])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      uint64_t buf = 68289283;
      __int16 v28 = 2082;
      id v29 = "";
      __int16 v30 = 2113;
      id v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt fetch unknown beacon before UT alert\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
    id v26 = [objc_alloc((Class)CLFindMyAccessoryConnectionMaterial) initWithAddress:[objc_msgSend(objc_msgSend(a3, "taUnknownBeacon"), "address")] ltk:0 primaryIndex:0 secondaryIndex:0];
    [(CLDurianDeviceManager *)self addPossiblePeripheralsForDevice:a3 usingMaterials:+[NSArray arrayWithObjects:&v26 count:1]];
    [(CLDurianDeviceManager *)self handleTokenFetchForDevice:a3 onCondition:a4];
  }
  else
  {
    [(CLDurianDeviceManager *)self scheduleTokenFetchTimeoutForDevice:a3];
    id v10 = dispatch_group_create();
    if (+[CLDurianSettings driftModelConnectionEnabled])
    {
      dispatch_group_enter(v10);
      id v11 = +[SPCommandKeysCriteria driftModeledCriteria];
      beaconManager = self->_beaconManager;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_101630DB8;
      v25[3] = &unk_102332578;
      v25[4] = self;
      v25[5] = v10;
      v25[6] = a3;
      v25[7] = v11;
      -[SPBeaconManager connectionTokensForBeaconUUID:criteria:completion:](beaconManager, "connectionTokensForBeaconUUID:criteria:completion:", [a3 uuid], v11, v25);
    }
    else
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      __int16 v13 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
        id v15 = [[[[[a3 activeConnectionAttempt] identifier] description] substringToIndex:8];
        uint64_t buf = 68289539;
        __int16 v28 = 2082;
        id v29 = "";
        __int16 v30 = 2113;
        id v31 = v14;
        __int16 v32 = 2113;
        id v33 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt skip driftmodel fetch\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
      }
    }
    if (+[CLDurianSettings reconciledConnectionEnabled]
      && [a3 lastReconciledCriteria])
    {
      dispatch_group_enter(v10);
      id v16 = [a3 lastReconciledCriteria];
      __int16 v17 = self->_beaconManager;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_101630ED4;
      v24[3] = &unk_102332578;
      v24[4] = self;
      v24[5] = v10;
      v24[6] = a3;
      v24[7] = v16;
      -[SPBeaconManager connectionTokensForBeaconUUID:criteria:completion:](v17, "connectionTokensForBeaconUUID:criteria:completion:", [a3 uuid], v16, v24);
      unint64_t v18 = a4;
    }
    else
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      unint64_t v18 = a4;
      __int16 v19 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
        id v21 = [[[[a3 activeConnectionAttempt] identifier] description] substringToIndex:8];
        uint64_t buf = 68289539;
        __int16 v28 = 2082;
        id v29 = "";
        __int16 v30 = 2113;
        id v31 = v20;
        __int16 v32 = 2113;
        id v33 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt skip reconciliation fetch\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
      }
    }
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_101630FF0;
    block[3] = &unk_1022B6D48;
    block[4] = v10;
    void block[5] = self;
    block[6] = a3;
    void block[7] = v18;
    dispatch_group_notify(v10, queue, block);
  }
}

- (void)handleTokenFetchForDevice:(id)a3 onCondition:(unint64_t)a4
{
  [(CLDurianDeviceManager *)self cancelTokenFetchTimeoutForDevice:"cancelTokenFetchTimeoutForDevice:"];
  if (-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", [a3 uuid]))
  {
    [(CLDurianDeviceManager *)self checkMaintenanceDiscoveryForDevice:a3 onCondition:a4];
  }
  else
  {
    [(CLDurianDeviceManager *)self completeTokenFetchForDevice:a3];
  }
}

- (void)fetchConnectionTokensForDevice:(id)a3 usingReconciledUUID:(id)a4 andCriteria:(id)a5
{
  [(CLDurianDeviceManager *)self scheduleTokenFetchTimeoutForDevice:"scheduleTokenFetchTimeoutForDevice:"];
  beaconManager = self->_beaconManager;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1016311E8;
  v13[3] = &unk_1023325A0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a5;
  [(SPBeaconManager *)beaconManager connectionTokensForBeaconUUID:a4 criteria:a5 completion:v13];
  if (-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", [a3 uuid]))
  {
    dispatch_time_t v10 = dispatch_time(0, 6000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10163133C;
    block[3] = &unk_10229FEB0;
    block[4] = self;
    void block[5] = a3;
    dispatch_after(v10, queue, block);
  }
}

- (void)didFetchConnectionMaterial:(id)a3 criteria:(id)a4 forDevice:(id)a5 error:(id)a6
{
  dispatch_time_t v6 = (NSError *)a6;
  if (a6) {
    goto LABEL_2;
  }
  if ([a3 count])
  {
    if ((unint64_t)[a3 count] < 0x121
      || !objc_msgSend(a4, "_cl_isEqual:", +[SPCommandKeysCriteria driftModeledCriteria](SPCommandKeysCriteria, "driftModeledCriteria")))
    {
      goto LABEL_30;
    }
    NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
    CFStringRef v60 = @"Token count return exceeds the max allowed";
    dispatch_time_t v6 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 2, +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1]);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    __int16 v19 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      uint64_t buf = 68289795;
      __int16 v49 = 2082;
      long long v50 = "";
      __int16 v51 = 2113;
      id v52 = [a5 uuid];
      __int16 v53 = 2050;
      uint64_t v54 = (NSString *)[a3 count];
      __int16 v55 = 2113;
      int v56 = [(NSError *)v6 localizedDescription];
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #connection material count exceeded \", \"deviceId\":%{private, location:escape_only}@, \"count\":%{public}lu, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
    }
    id v20 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v21 = [a5 uuid];
      id v22 = (NSString *)[a3 count];
      id v23 = [(NSError *)v6 localizedDescription];
      uint64_t buf = 68289795;
      __int16 v49 = 2082;
      long long v50 = "";
      __int16 v51 = 2113;
      id v52 = v21;
      __int16 v53 = 2050;
      uint64_t v54 = v22;
      __int16 v55 = 2113;
      int v56 = v23;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #connection material count exceeded ", "{\"msg%{public}.0s\":\"#durian #connection material count exceeded \", \"deviceId\":%{private, location:escape_only}@, \"count\":%{public}lu, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
      if (!v6) {
        goto LABEL_30;
      }
LABEL_2:
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      id v8 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
      {
        id v9 = [[[objc_msgSend(objc_msgSend(a5, "uuid"), "description") substringToIndex:8];
        dispatch_time_t v10 = [[[[a5 activeConnectionAttempt] identifier] description] substringToIndex:8];
        id v11 = [(NSError *)v6 localizedDescription];
        uint64_t buf = 68289795;
        __int16 v49 = 2082;
        long long v50 = "";
        __int16 v51 = 2113;
        id v52 = v9;
        __int16 v53 = 2113;
        uint64_t v54 = v10;
        __int16 v55 = 2113;
        int v56 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #connectattempt material fetch error\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
      }
      id v12 = qword_102419398;
      if (os_signpost_enabled((os_log_t)qword_102419398))
      {
        id v13 = [[[objc_msgSend(objc_msgSend(a5, "uuid"), "description") substringToIndex:8];
        id v14 = [(NSString *)[objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a5, "activeConnectionAttempt"), "identifier"), "description"), "substringToIndex:", 8);
        id v15 = [(NSError *)v6 localizedDescription];
        uint64_t buf = 68289795;
        __int16 v49 = 2082;
        long long v50 = "";
        __int16 v51 = 2113;
        id v52 = v13;
        __int16 v53 = 2113;
        uint64_t v54 = v14;
        __int16 v55 = 2113;
        int v56 = v15;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #connectattempt material fetch error", "{\"msg%{public}.0s\":\"#durian #connectattempt material fetch error\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
      }
      return;
    }
LABEL_27:
    if (!v6) {
      goto LABEL_30;
    }
    goto LABEL_2;
  }
  NSErrorUserInfoKey v61 = NSLocalizedDescriptionKey;
  CFStringRef v62 = @"Failed to Retrieve tokens for tag";
  dispatch_time_t v6 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 2, +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1]);
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  BOOL v24 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
  {
    uint64_t buf = 68289539;
    __int16 v49 = 2082;
    long long v50 = "";
    __int16 v51 = 2113;
    id v52 = [a5 uuid];
    __int16 v53 = 2113;
    uint64_t v54 = [(NSError *)v6 localizedDescription];
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #connection no errors returned with no materials\", \"deviceId\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
  }
  __int16 v25 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    id v26 = [a5 uuid];
    id v27 = [(NSError *)v6 localizedDescription];
    uint64_t buf = 68289539;
    __int16 v49 = 2082;
    long long v50 = "";
    __int16 v51 = 2113;
    id v52 = v26;
    __int16 v53 = 2113;
    uint64_t v54 = v27;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #connection no errors returned with no materials", "{\"msg%{public}.0s\":\"#durian #connection no errors returned with no materials\", \"deviceId\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
    goto LABEL_27;
  }
  if (v6) {
    goto LABEL_2;
  }
LABEL_30:
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  __int16 v40 = self;
  __int16 v28 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = [[[objc_msgSend(objc_msgSend(a5, "uuid"), "description") substringToIndex:8];
    __int16 v30 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a5, "activeConnectionAttempt"), "identifier"), "description") substringToIndex:8];
    id v31 = (NSString *)[a3 count];
    uint64_t buf = 68290051;
    __int16 v49 = 2082;
    long long v50 = "";
    __int16 v51 = 2113;
    id v52 = v29;
    __int16 v53 = 2113;
    uint64_t v54 = v30;
    __int16 v55 = 2049;
    int v56 = v31;
    __int16 v57 = 2113;
    id v58 = a4;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt material fetched\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"count\":%{private}lu, \"criteria\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x3Au);
  }
  __int16 v32 = [[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a3 count:a4]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = a3;
  id v33 = [a3 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v44;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(obj);
        }
        -[v32 addObject:](objc_alloc((Class)CLFindMyAccessoryConnectionMaterial), "initWithAddress:ltk:primaryIndex:secondaryIndex:", [*(id *)(*((void *)&v43 + 1) + 8 * i) address], [*(id *)(*((void *)&v43 + 1) + 8 * i) connectionToken], [*(id *)(*((void *)&v43 + 1) + 8 * i) primaryIndex], [*(id *)(*((void *)&v43 + 1) + 8 * i) secondaryIndex]);
      }
      id v34 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v34);
  }
  if ((objc_msgSend(v39, "_cl_isEqual:", +[SPCommandKeysCriteria driftModeledCriteria](SPCommandKeysCriteria, "driftModeledCriteria")) & 1) == 0)
  {
    id v37 = [[objc_msgSend(objc_msgSend(objc_msgSend(a5, "activeConnectionAttempt"), "krMaterials"), "count");
    id v38 = [a5 activeConnectionAttempt];
    if (v37) {
      [objc_msgSend(v38, "krMaterials") addObjectsFromArray:v32];
    }
    else {
      [v38 setKrMaterials:v32];
    }
  }
  [(CLDurianDeviceManager *)v40 addPossiblePeripheralsForDevice:a5 usingMaterials:v32];
}

- (void)addPossiblePeripheralsForDevice:(id)a3 usingMaterials:(id)a4
{
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = [a4 countByEnumeratingWithState:&v38 objects:v60 count:16];
  if (v5)
  {
    id v7 = v5;
    id v8 = &qword_102419000;
    id v9 = &qword_102419000;
    uint64_t v10 = *(void *)v39;
    *(void *)&long long v6 = 68289283;
    long long v29 = v6;
    do
    {
      id v11 = 0;
      id v30 = v7;
      do
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(a4);
        }
        id v12 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v11);
        id v37 = [v12 ltk:v29];
        id v13 = sub_101640700([v12 address]);
        id v14 = -[CLDurianDeviceManager _retrievePeripheralForMaterial:isFindMyNetwork:](self, "_retrievePeripheralForMaterial:isFindMyNetwork:", v12, [a3 isFindMyNetwork]);
        if ([v12 secondaryIndex]) {
          id v36 = 0;
        }
        else {
          id v36 = [v12 primaryIndex];
        }
        if (v8[114] != -1) {
          dispatch_once(&qword_102419390, &stru_102332710);
        }
        id v15 = v9[115];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
          id v32 = [[[objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "identifier"), "description"), "substringToIndex:", 8);
          id v16 = [[[v14 identifier] description] substringToIndex:8];
          id v34 = v14;
          __int16 v17 = v8;
          id v18 = v16;
          uint64_t v19 = v10;
          id v20 = v9;
          id v21 = a3;
          id v22 = [v12 secondaryIndex];
          id v23 = [(NSString *)v13 UTF8String];
          BOOL v24 = [(NSString *)v37 UTF8String];
          *(_DWORD *)uint64_t buf = 68290819;
          int v43 = 0;
          __int16 v44 = 2082;
          long long v45 = "";
          __int16 v46 = 2113;
          id v47 = v33;
          __int16 v48 = 2113;
          id v49 = v32;
          __int16 v50 = 2113;
          id v51 = v18;
          id v8 = v17;
          id v14 = v34;
          __int16 v52 = 2114;
          id v53 = v36;
          __int16 v54 = 2114;
          id v55 = v22;
          a3 = v21;
          id v9 = v20;
          uint64_t v10 = v19;
          id v7 = v30;
          __int16 v56 = 2082;
          __int16 v57 = v23;
          __int16 v58 = 2082;
          NSErrorUserInfoKey v59 = v24;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt add peripheral\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"primaryIndex\":%{public, location:escape_only}@, \"secondaryIndex\":%{public, location:escape_only}@, \"address\":%{public, location:escape_only}s, \"LTK\":%{public, location:escape_only}s}", buf, 0x58u);
        }
        if (v14)
        {
          [objc_msgSend(a3, "activeConnectionAttempt") addPossiblePeripheral:v14 withConnectionMaterial:v12];
        }
        else
        {
          if (v8[114] != -1) {
            dispatch_once(&qword_102419390, &stru_102332710);
          }
          __int16 v25 = v9[115];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            id v26 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = v29;
            int v43 = 0;
            __int16 v44 = 2082;
            long long v45 = "";
            __int16 v46 = 2113;
            id v47 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian failed to create CBPeripheral\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            if (v8[114] != -1) {
              dispatch_once(&qword_102419390, &stru_102332710);
            }
          }
          id v27 = v9[115];
          if (os_signpost_enabled(v27))
          {
            id v28 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = v29;
            int v43 = 0;
            __int16 v44 = 2082;
            long long v45 = "";
            __int16 v46 = 2113;
            id v47 = v28;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian failed to create CBPeripheral", "{\"msg%{public}.0s\":\"#durian failed to create CBPeripheral\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
          }
        }
        id v11 = (char *)v11 + 1;
      }
      while (v7 != v11);
      id v7 = [a4 countByEnumeratingWithState:&v38 objects:v60 count:16];
    }
    while (v7);
  }
}

- (void)handleKeyFetchFailureForDevice:(id)a3 withError:(id)a4
{
  int64_t v4 = (NSError *)a4;
  if (a4)
  {
LABEL_9:
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    goto LABEL_11;
  }
  NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
  CFStringRef v26 = @"Failed to Retrieve tokens for tag";
  int64_t v4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 2, +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1]);
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
  {
    int v17 = 68289539;
    int v18 = 0;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 2113;
    id v22 = [a3 uuid];
    __int16 v23 = 2113;
    BOOL v24 = [(NSError *)v4 localizedDescription];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #connection no error in handleKeyFetchFailureForDevice:withError:\", \"deviceId\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x26u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
  }
  id v8 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    id v9 = [a3 uuid];
    uint64_t v10 = [(NSError *)v4 localizedDescription];
    int v17 = 68289539;
    int v18 = 0;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 2113;
    id v22 = v9;
    __int16 v23 = 2113;
    BOOL v24 = v10;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #connection no error in handleKeyFetchFailureForDevice:withError:", "{\"msg%{public}.0s\":\"#durian #connection no error in handleKeyFetchFailureForDevice:withError:\", \"deviceId\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x26u);
    goto LABEL_9;
  }
LABEL_11:
  id v11 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
  {
    id v12 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    id v13 = [(NSError *)v4 localizedDescription];
    int v17 = 68289539;
    int v18 = 0;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 2113;
    id v22 = v12;
    __int16 v23 = 2113;
    BOOL v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #connectattempt token fetch error\", \"item\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x26u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
  }
  id v14 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    id v15 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    id v16 = [(NSError *)v4 localizedDescription];
    int v17 = 68289539;
    int v18 = 0;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 2113;
    id v22 = v15;
    __int16 v23 = 2113;
    BOOL v24 = v16;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #connectattempt token fetch error", "{\"msg%{public}.0s\":\"#durian #connectattempt token fetch error\", \"item\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x26u);
  }
  [(CLDurianDeviceManager *)self sendObservationForDevice:a3 type:3 includeLocation:0];
  [a3 transitionToState:0 event:1 task:0];
  [(CLDurianDeviceManager *)self connectFailedToDevice:a3 withError:[(NSError *)v4 code]];
}

- (void)completeTokenFetchForDevice:(id)a3
{
  if (a3)
  {
    unsigned int v5 = [[objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt")), "possiblePeripherals") count];
    unsigned int v6 = [a3 isConnected];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68290051;
      __int16 v28 = 2082;
      long long v29 = "";
      __int16 v30 = 2113;
      id v31 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      __int16 v32 = 2113;
      id v33 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "activeConnectionAttempt"), "identifier"), "description") substringToIndex:8];
      __int16 v34 = 1026;
      unsigned int v35 = v5;
      __int16 v36 = 1026;
      unsigned int v37 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt fetch complete\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periphs\":%{public}d, \"connected\":%{public}hhd}", (uint8_t *)&buf, 0x32u);
    }
    if ((v6 & 1) == 0)
    {
      if (v5)
      {
        [a3 transitionToState:2 event:3 task:0];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v8 = [objc_msgSend(a3, "activeConnectionAttempt") possiblePeripherals];
        id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9)
        {
          id v11 = v9;
          uint64_t v12 = *(void *)v21;
          *(void *)&long long v10 = 68289283;
          long long v19 = v10;
          do
          {
            id v13 = 0;
            do
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v8);
              }
              uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v13);
              unsigned int v15 = [a3 firmwareUpdateReboot:v19];
              if ([(CLDurianDeviceManager *)self checkIfTwoDevicesHaveSamePeripheral:v14 device:a3])
              {
                if (qword_102419390 != -1) {
                  dispatch_once(&qword_102419390, &stru_102332710);
                }
                id v16 = qword_102419398;
                if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
                {
                  id v17 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                  uint64_t buf = v19;
                  __int16 v28 = 2082;
                  long long v29 = "";
                  __int16 v30 = 2113;
                  id v31 = v17;
                  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian skip connect to device\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
                }
              }
              else
              {
                if (v15) {
                  uint64_t v18 = 60;
                }
                else {
                  uint64_t v18 = 0;
                }
                [(CLDurianDeviceManager *)self connectToDevice:a3 withPeripheral:v14 forcedTimeout:v18];
              }
              id v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            id v11 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v11);
        }
      }
      else
      {
        NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
        CFStringRef v26 = @"Failed to Retrieve tokens for tag";
        [(CLDurianDeviceManager *)self handleKeyFetchFailureForDevice:a3 withError:+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 2, +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1])];
      }
    }
  }
}

- (void)checkMaintenanceDiscoveryForDevice:(id)a3 onCondition:(unint64_t)a4
{
  unsigned int v7 = [a3 numPossiblePeripherals];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289795;
    __int16 v25 = 2082;
    CFStringRef v26 = "";
    __int16 v27 = 2113;
    id v28 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v29 = 1026;
    unsigned int v30 = v7;
    __int16 v31 = 1026;
    int v32 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint check discovery\", \"item\":%{private, location:escape_only}@, \"periphs\":%{public}d, \"condition\":%{public}d}", (uint8_t *)&buf, 0x28u);
  }
  if (v7)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = [[objc_msgSend(a3, "activeConnectionAttempt", 0) possiblePeripherals];
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      int v12 = 0;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v9);
          }
          v12 += [(CLDurianDeviceManager *)self isDiscoveryRequiredForDevice:a3 onCondition:a4 withPeripheral:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }
    else
    {
      LOBYTE(v12) = 0;
    }
    if ((_BYTE)v12) {
      BOOL v15 = v7 == (char)v12;
    }
    else {
      BOOL v15 = 0;
    }
    int v16 = v15;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v17 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      uint64_t buf = 68289795;
      __int16 v25 = 2082;
      CFStringRef v26 = "";
      __int16 v27 = 2113;
      id v28 = v18;
      __int16 v29 = 1026;
      unsigned int v30 = v16;
      __int16 v31 = 1026;
      int v32 = (char)v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint discovery\", \"item\":%{private, location:escape_only}@, \"request\":%{public}d, \"count\":%{public}d}", (uint8_t *)&buf, 0x28u);
    }
    if (v16)
    {
      [(CLDurianMaintenanceMetrics *)self->_maintMetrics setNeededDiscovery:1];
      if (!self->_maintDiscoveryPending)
      {
        self->_BOOL maintDiscoveryPending = 1;
        [(CLDurianDeviceManager *)self requestDiscoveryViaDevice:a3];
        [(CLDurianDeviceManager *)self dispatchRecheckDevicesAfterDiscovery];
      }
    }
    else if ((-[NSMutableSet containsObject:](self->_devicesBeingMaintained, "containsObject:", [a3 uuid]) & 1) == 0)
    {
      [a3 removeAllPossiblePeripherals];
    }
  }
  else
  {
    [(CLDurianDeviceManager *)self connectFailedToDevice:a3 withError:19];
    [(CLDurianDeviceManager *)self finishMaintainingDevice:a3 withReason:@"error:fetch" andCategory:0];
  }
}

- (double)requestCarScanTimeViaDevice:(id)a3
{
  _[a3 getLastCarScanTime];
  return result;
}

- (void)requestDiscoveryViaDevice:(id)a3
{
}

- (void)setCurrentKeyIndex:(unint64_t)a3 forDevice:(id)a4
{
  beaconManager = self->_beaconManager;
  id v6 = [a4 uuid];

  [(SPBeaconManager *)beaconManager connectedToBeacon:v6 withIndex:a3];
}

- (void)setCurrentWildKeyIndex:(unint64_t)a3 forDevice:(id)a4 forEvent:(id)a5
{
  if (objc_opt_respondsToSelector())
  {
    beaconManager = self->_beaconManager;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    _DWORD v10[2] = sub_101632D40;
    v10[3] = &unk_10232B4D0;
    v10[4] = a4;
    v10[5] = a5;
    void v10[6] = a3;
    -[SPBeaconManager setCurrentWildKeyIndex:forBeacon:completion:](beaconManager, "setCurrentWildKeyIndex:forBeacon:completion:", a3, [a4 uuid], v10);
  }
}

- (void)setKeyRollTimeout:(unint64_t)a3 forDevice:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    beaconManager = self->_beaconManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_101632F24;
    v8[3] = &unk_10232B4F8;
    v8[4] = a4;
    void v8[5] = a3;
    -[SPBeaconManager setKeyRollInterval:forBeacon:completion:](beaconManager, "setKeyRollInterval:forBeacon:completion:", a3, [a4 uuid], v8);
  }
}

- (void)setWildKeyBase:(unint64_t)a3 interval:(unint64_t)a4 fallback:(unint64_t)a5 forDevice:(id)a6
{
  if (objc_opt_respondsToSelector())
  {
    beaconManager = self->_beaconManager;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    _DWORD v12[2] = sub_101633118;
    v12[3] = &unk_1023325C8;
    v12[4] = a6;
    v12[5] = a3;
    v12[6] = a4;
    v12[7] = a5;
    -[SPBeaconManager setWildKeyBase:interval:fallback:forBeacon:completion:](beaconManager, "setWildKeyBase:interval:fallback:forBeacon:completion:", a3, a4, a5, [a6 uuid], v12);
  }
}

- (void)setAlignmentUncertainty:(double)a3 atIndex:(unint64_t)a4 date:(id)a5 forDevice:(id)a6
{
  if (objc_opt_respondsToSelector())
  {
    beaconManager = self->_beaconManager;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    _DWORD v12[2] = sub_101633340;
    v12[3] = &unk_10232B4D0;
    *(double *)&v12[6] = a3;
    v12[4] = a6;
    v12[5] = a5;
    -[SPBeaconManager setAlignmentUncertainty:atIndex:date:forBeacon:completion:](beaconManager, "setAlignmentUncertainty:atIndex:date:forBeacon:completion:", a4, a5, [a6 uuid], v12, a3);
  }
}

- (void)updateBatteryStatus:(unint64_t)a3 forDevice:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    ownerSession = self->_ownerSession;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_101633520;
    v8[3] = &unk_1023325F0;
    v8[4] = a4;
    void v8[5] = a3;
    -[SPOwnerSession updateBatteryStatus:beaconUUID:completion:](ownerSession, "updateBatteryStatus:beaconUUID:completion:", a3, [a4 uuid], v8);
  }
}

- (void)setAirplaneModeEnabled:(BOOL)a3
{
  if (self->_airplaneModeEnabled != a3)
  {
    self->_airplaneModeEnabled = a3;
    if (a3)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      int64_t v4 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        v5[0] = 68289026;
        v5[1] = 0;
        __int16 v6 = 2082;
        unsigned int v7 = "";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian airplane mode enabled\"}", (uint8_t *)v5, 0x12u);
      }
      [(CLDurianDeviceManager *)self evaluateDisconnectedDevices];
    }
  }
}

- (void)requestDisconnectionForDevice:(id)a3
{
  -[CLDurianDeviceManager disconnectDevice:](self, "disconnectDevice:");

  [(CLDurianDeviceManager *)self cancelConnectionEvaluationForDevice:a3];
}

- (BOOL)sendSeparationStateForDevice:(id)a3 state:(id)a4 includeLocation:(BOOL)a5
{
  if (objc_opt_respondsToSelector())
  {
    separationSession = self->_separationSession;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    _DWORD v10[2] = sub_101633834;
    v10[3] = &unk_102332618;
    v10[4] = a3;
    v10[5] = a4;
    -[SPTagSeparationProtocol tagSeparationStateChanged:beaconUUID:completion:](separationSession, "tagSeparationStateChanged:beaconUUID:completion:", a4, [a3 uuid], v10);
  }
  return 0;
}

- (void)sendObservationForDevice:(id)a3 type:(int64_t)a4 includeLocation:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = +[NSDate date];
  id v10 = v9;
  BOOL v11 = a4 == 3 && v5;
  int v12 = v9;
  if (v11)
  {
    [(NSDate *)v9 timeIntervalSinceReferenceDate];
    double v14 = v13;
    [a3 lastObservationTime];
    double v16 = v14 - v15;
    if (v16 <= 6.0) {
      double v17 = v16;
    }
    else {
      double v17 = 6.0;
    }
    int v12 = [(NSDate *)v10 dateByAddingTimeInterval:-v17];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v18 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      id v19 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      [(NSDate *)v10 timeIntervalSinceReferenceDate];
      uint64_t v21 = v20;
      [a3 lastObservationTime];
      *(_DWORD *)uint64_t buf = 68290051;
      __int16 v27 = 2082;
      int v26 = 0;
      id v28 = "";
      __int16 v29 = 2113;
      id v30 = v19;
      __int16 v31 = 2050;
      uint64_t v32 = v21;
      __int16 v33 = 2050;
      double v34 = v17;
      __int16 v35 = 2050;
      uint64_t v36 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #lastObservationTime disconnection\", \"item\":%{private, location:escape_only}@, \"disconnectionTime\":\"%{public}f\", \"interval\":\"%{public}f\", \"lastObservationTime\":\"%{public}f\"}", buf, 0x3Au);
    }
  }
  [a3 setLastObservationTime:CFAbsoluteTimeGetCurrent()];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_101633BC0;
  v23[3] = &unk_102332640;
  v23[5] = a3;
  v23[6] = a4;
  BOOL v24 = v11;
  v23[4] = self;
  -[CLDurianDeviceManager sendObservationForIdentifier:type:date:locationDate:includeLocation:locationHandler:](self, "sendObservationForIdentifier:type:date:locationDate:includeLocation:locationHandler:", [a3 uuid], a4, v10, v12, v5, v23);
  if (objc_opt_respondsToSelector()) {
    -[CLDurianDeviceDelegate onObservationForDeviceWithUUID:type:](self->_deviceDelegate, "onObservationForDeviceWithUUID:type:", [a3 uuid], a4);
  }
}

- (void)sendObservationForIdentifier:(id)a3 type:(int64_t)a4 date:(id)a5 locationDate:(id)a6 includeLocation:(BOOL)a7 locationHandler:(id)a8
{
  BOOL v8 = a7;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
  double v13 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [[objc_msgSend(a3, "description") substringToIndex:8];
    [a6 timeIntervalSinceReferenceDate];
    uint64_t v16 = v15;
    [a5 timeIntervalSinceReferenceDate];
    *(_DWORD *)uint64_t buf = 68290307;
    int v25 = 0;
    __int16 v26 = 2082;
    __int16 v27 = "";
    __int16 v28 = 2113;
    id v29 = v14;
    __int16 v30 = 2049;
    int64_t v31 = a4;
    __int16 v32 = 1025;
    *(_DWORD *)__int16 v33 = v8;
    *(_WORD *)&v33[4] = 2049;
    *(void *)&v33[6] = v16;
    __int16 v34 = 2049;
    uint64_t v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian updating beacon observation\", \"item\":%{private, location:escape_only}@, \"type\":%{private}ld, \"includeLocation\":%{private}hhd, \"locationDate\":\"%{private}f\", \"now\":\"%{private}f\"}", buf, 0x40u);
  }
  if (self->_isRestrictedSKU)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v18 = qword_102419398;
    BOOL v8 = 0;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v25 = 0;
      __int16 v26 = 2082;
      __int16 v27 = "";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian - device SKU is restricted; sending nil location\"}",
        buf,
        0x12u);
      BOOL v8 = 0;
    }
  }
  if (self->_isRestrictedCountryCode)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v19 = qword_102419398;
    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)uint64_t buf = 68289026;
    int v25 = 0;
    __int16 v26 = 2082;
    __int16 v27 = "";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian - device country code is restricted; sending nil location\"}",
      buf,
      0x12u);
  }
  else if (v8)
  {
    -[CLDurianLocationMonitor fetchEstimatedLocationAtDate:handler:](self->_locationMonitor, "fetchEstimatedLocationAtDate:handler:");
    return;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332710);
  }
LABEL_19:
  uint64_t v20 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
  {
    id v21 = [[objc_msgSend(a3, "description") substringToIndex:8];
    uint64_t v22 = [(NSString *)+[NSDateFormatter localizedStringFromDate:a5 dateStyle:1 timeStyle:4] UTF8String];
    *(_DWORD *)uint64_t buf = 68289795;
    int v25 = 0;
    __int16 v26 = 2082;
    __int16 v27 = "";
    __int16 v28 = 2113;
    id v29 = v21;
    __int16 v30 = 2050;
    int64_t v31 = a4;
    __int16 v32 = 2082;
    *(void *)__int16 v33 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian sendObservationForDevice includeLocation, NO\", \"item\":%{private, location:escape_only}@, \"type\":%{public}ld, \"date\":%{public, location:escape_only}s}", buf, 0x30u);
  }
  [(CLDurianDeviceManager *)self sendObservationForIdentifier:a3 type:a4 date:a5 location:0];
}

- (void)sendObservationForIdentifier:(id)a3 type:(int64_t)a4 date:(id)a5 location:(id)a6
{
  id v6 = a6;
  if (a6)
  {
    if ([(CLDurianZoneMonitorWrapper *)self->_zoneMonitor isInZone:a6])
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      BOOL v11 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [[[a3 description] substringToIndex:8];
        [v6 coordinate];
        uint64_t v14 = v13;
        [v6 coordinate];
        *(_DWORD *)uint64_t buf = 68289795;
        int v38 = 0;
        __int16 v39 = 2082;
        long long v40 = "";
        __int16 v41 = 2113;
        id v42 = v12;
        __int16 v43 = 2049;
        uint64_t v44 = v14;
        __int16 v45 = 2049;
        uint64_t v46 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location is inside Korea time zone; sending nil location\", \"item\":%{private"
          ", location:escape_only}@, \"latitude\":\"%{private}f\", \"longitude\":\"%{private}f\"}",
          buf,
          0x30u);
      }
      id v6 = 0;
    }
    else
    {
      id v16 = objc_alloc((Class)SPObservationLocation);
      id v17 = [v6 timestamp];
      [v6 coordinate];
      double v19 = v18;
      [v6 coordinate];
      double v21 = v20;
      [v6 horizontalAccuracy];
      double v23 = v22;
      [v6 altitude];
      double v25 = v24;
      [v6 verticalAccuracy];
      double v27 = v26;
      [v6 speed];
      double v29 = v28;
      [v6 speedAccuracy];
      double v31 = v30;
      [v6 course];
      id v6 = [v16 initWithTimestamp:v17 latitude:v19 longitude:v21 horizontalAccuracy:v23 altitude:v25 verticalAccuracy:v27 speed:v29 speedAccuracy:v31 course:v32 courseAccuracy:0 floorLevel:[objc_msgSend(objc_msgSend(v6, "floor"), "level")]];
    }
  }
  id v33 = [objc_alloc((Class)SPBeaconObservation) initWithBeaconIdentifier:a3 type:a4 date:a5 location:v6];
  ownerSession = self->_ownerSession;
  id v36 = v33;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1016345E8;
  v35[3] = &unk_102332618;
  v35[4] = a3;
  v35[5] = v33;
  [(SPOwnerSession *)ownerSession updateBeaconObservations:+[NSArray arrayWithObjects:&v36 count:1] completion:v35];
}

- (void)submitFirmwareVersionsForOwnedTags
{
  uint64_t v2 = SPBeaconTypeDurian;
  [(SPBeaconManager *)self->_beaconManager allBeaconsOfTypes:+[NSSet setWithArray:](NSSet, "setWithArray:", +[NSArray arrayWithObjects:&v2 count:1]) completion:&stru_1023326A8];
}

- (id)_retrievePeripheralForMaterial:(id)a3
{
  return [(CLDurianDeviceManager *)self _retrievePeripheralForMaterial:a3 isFindMyNetwork:1];
}

- (id)_retrievePeripheralForMaterial:(id)a3 isFindMyNetwork:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [[objc_msgSend(a3, "address") mutableCopy];
  unsigned int v7 = (unsigned __int8 *)[v6 mutableBytes];
  BOOL v8 = v7;
  if (v4)
  {
    *v7 |= 0xC0u;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v21 = 0;
      __int16 v22 = 2082;
      double v23 = "";
      __int16 v24 = 2113;
      double v25 = sub_101640700(v6);
      id v10 = "{\"msg%{public}.0s\":\"#durian exercising connection to Apple accessories, using: \", \"address\":%{private,"
            " location:escape_only}@}";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, buf, 0x1Cu);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    id v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v21 = 0;
      __int16 v22 = 2082;
      double v23 = "";
      __int16 v24 = 2113;
      double v25 = sub_101640700(v6);
      id v10 = "{\"msg%{public}.0s\":\"#durian exercising connection to non-Apple accessories, using: \", \"address\":%{priv"
            "ate, location:escape_only}@}";
      goto LABEL_10;
    }
  }
  id v11 = [(CBCentralManager *)self->_centralManager createPeripheralWithAddress:v6 andIdentifier:0];
  if (v11)
  {
    id v12 = v11;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332710);
    }
    uint64_t v13 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = sub_101640700(v6);
      id v15 = [v12 identifier];
      *(_DWORD *)uint64_t buf = 68289539;
      int v21 = 0;
      __int16 v22 = 2082;
      double v23 = "";
      __int16 v24 = 2113;
      double v25 = v14;
      __int16 v26 = 2114;
      id v27 = v15;
      id v16 = "{\"msg%{public}.0s\":\"#durian createPeripheral succeeeded\", \"address\":%{private, location:escape_only}@,"
            " \"peripheralUUID\":%{public, location:escape_only}@}";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, v16, buf, 0x26u);
    }
  }
  else
  {
    id v12 = [(CBCentralManager *)self->_centralManager retrievePeripheralWithAddress:+[NSString stringWithFormat:@"Random %hhX:%hhX:%hhX:%hhX:%hhX:%hhX", *v8, v8[1], v8[2], v8[3], v8[4], v8[5]]];
    if (v12)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332710);
      }
      uint64_t v13 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
      {
        id v17 = sub_101640700(v6);
        id v18 = [v12 identifier];
        *(_DWORD *)uint64_t buf = 68289539;
        int v21 = 0;
        __int16 v22 = 2082;
        double v23 = "";
        __int16 v24 = 2113;
        double v25 = v17;
        __int16 v26 = 2114;
        id v27 = v18;
        id v16 = "{\"msg%{public}.0s\":\"#durian retrievePeripheral succeeded\", \"address\":%{private, location:escape_only"
              "}@, \"peripheralUUID\":%{public, location:escape_only}@}";
        goto LABEL_21;
      }
    }
  }
  return v12;
}

- (void)onObservationForDeviceWithIdentifier:(id)a3 type:(int64_t)a4 date:(id)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_101634CC0;
  v6[3] = &unk_1022B6D48;
  v6[4] = self;
  v6[5] = a3;
  void v6[6] = a5;
  v6[7] = a4;
  dispatch_async(queue, v6);
}

- (CLDurianDeviceDelegate)deviceDelegate
{
  return self->_deviceDelegate;
}

- (void)setDeviceDelegate:(id)a3
{
  self->_deviceDelegate = (CLDurianDeviceDelegate *)a3;
}

- (NSMutableSet)devicesBeingMaintained
{
  return (NSMutableSet *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDevicesBeingMaintained:(id)a3
{
}

- (NSMutableDictionary)devices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setDevices:(id)a3
{
}

- (NSMutableSet)maintenanceEvictionCandidates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 176, 1);
}

- (NSMutableDictionary)maintenanceEvictionMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setMaintenanceEvictionMap:(id)a3
{
}

- (CLDurianScanCache)scanCache
{
  return self->_scanCache;
}

- (CLDurianMaintenanceUtilities)maintUtils
{
  return (CLDurianMaintenanceUtilities *)objc_getProperty(self, a2, 200, 1);
}

- (void)setMaintUtils:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return (CBCentralManager *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCentralManager:(id)a3
{
}

- (NSMutableDictionary)keyFetchTimeoutBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setKeyFetchTimeoutBlocks:(id)a3
{
}

- (NSMutableDictionary)connectionTimeoutBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setConnectionTimeoutBlocks:(id)a3
{
}

- (unint64_t)maintDutyCycleUpgrade
{
  return self->_maintDutyCycleUpgrade;
}

- (void)setMaintDutyCycleUpgrade:(unint64_t)a3
{
  self->_unint64_t maintDutyCycleUpgrade = a3;
}

- (int)coexImpactState
{
  return self->_coexImpactState;
}

- (void)setCoexImpactState:(int)a3
{
  self->_int coexImpactState = a3;
}

- (CLDurianMetricManager)metricManager
{
  return (CLDurianMetricManager *)objc_getProperty(self, a2, 240, 1);
}

- (void)setMetricManager:(id)a3
{
}

- (NSMutableDictionary)scheduledDisconnectionBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (void)setScheduledDisconnectionBlocks:(id)a3
{
}

- (NSMutableDictionary)scheduledConnectionEvaluationBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)setScheduledConnectionEvaluationBlocks:(id)a3
{
}

- (BOOL)maintDiscoveryPending
{
  return self->_maintDiscoveryPending;
}

- (void)setMaintDiscoveryPending:(BOOL)a3
{
  self->_BOOL maintDiscoveryPending = a3;
}

- (CLDurianMaintenanceMetrics)maintMetrics
{
  return (CLDurianMaintenanceMetrics *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMaintMetrics:(id)a3
{
}

- (BOOL)airplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (int64_t)lastCentralManagerState
{
  return self->_lastCentralManagerState;
}

- (void)setLastCentralManagerState:(int64_t)a3
{
  self->_int64_t lastCentralManagerState = a3;
}

- (BOOL)networkAvailable
{
  return self->_networkAvailable;
}

- (void)setNetworkAvailable:(BOOL)a3
{
  self->_networkAvailable = a3;
}

- (BOOL)maintenanceOnWildObservationEnabled
{
  return self->_maintenanceOnWildObservationEnabled;
}

- (void)setMaintenanceOnWildObservationEnabled:(BOOL)a3
{
  self->_maintenanceOnWildObservationEnabled = a3;
}

- (int)maintainableDeviceCount
{
  return self->_maintainableDeviceCount;
}

- (void)setMaintainableDeviceCount:(int)a3
{
  self->_int maintainableDeviceCount = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 264, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)leashableUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 272, 1);
}

- (void)setLeashableUUIDs:(id)a3
{
}

- (NSArray)simpleBeacons
{
  return (NSArray *)objc_getProperty(self, a2, 280, 1);
}

- (void)setSimpleBeacons:(id)a3
{
}

- (NSString)loiType
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setLoiType:(id)a3
{
}

- (unint64_t)lastFetchLogTime
{
  return self->_lastFetchLogTime;
}

- (void)setLastFetchLogTime:(unint64_t)a3
{
  self->_lastFetchLogTime = a3;
}

- (id)connectToDeviceWithAddress:(id)a3
{
  id v5 = [(CLDurianDeviceManager *)self deviceWithUUID:+[NSUUID UUID]];
  id v6 = [[CLDurianMockConnectionMaterial alloc] initWithAddress:a3 connectionToken:+[NSData data]];
  BOOL v8 = v6;
  [(CLDurianDeviceManager *)self didFetchConnectionMaterial:+[NSArray arrayWithObjects:&v8 count:1] criteria:0 forDevice:v5 error:0];
  [(CLDurianDeviceManager *)self completeTokenFetchForDevice:v5];

  return v5;
}

@end