@interface DPCWatchPresenceDetector
- (BOOL)checkIfBluetoothPowerOff;
- (BOOL)checkIfBluetoothReady;
- (DPCStateMachine)stateMachine;
- (DPCWatchPresenceDetector)init;
- (id)detectedNewErrorBlock;
- (id)detectedNewEventBlock;
- (id)detectedNewWatchStatusEventBlock;
- (id)getCurrentWatchMACAddress;
- (unint64_t)prestartCheck;
- (void)_registerSwitchWatchNotification;
- (void)_setupOnWristMonitoring;
- (void)_stopWristMonitoring;
- (void)_updateActiveNRDevice;
- (void)centralManager:(id)a3 didUpdateRSSIStatisticsDetectionForPeripheral:(id)a4 results:(id)a5 error:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)changeRSSIStatisticsDetection:(id)a3 manager:(id)a4 closer:(id)a5 further:(id)a6 maskDecision:(int64_t)a7;
- (void)checkAndStartRSSIDetection;
- (void)checkPolicyWithRSSI:(id)a3;
- (void)connectToWatch;
- (void)dealloc;
- (void)detectWatchWristStateEvent:(int64_t)a3;
- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4;
- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4;
- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5;
- (void)disableRSSIStatisticsDetection;
- (void)disableRSSIStatisticsDetection:(id)a3 manager:(id)a4;
- (void)loadPolicy;
- (void)monitorRSSIAbsence;
- (void)monitorRSSIPresence;
- (void)resetAll;
- (void)resetBT;
- (void)resetWatchMonitors;
- (void)runDiscoveryMode;
- (void)sendWatchWristStateEvent:(int64_t)a3;
- (void)setDetectedNewErrorBlock:(id)a3;
- (void)setDetectedNewEventBlock:(id)a3;
- (void)setDetectedNewWatchStatusEventBlock:(id)a3;
- (void)setEnabledStreamingMode:(BOOL)a3;
- (void)setStateMachine:(id)a3;
- (void)start;
- (void)stop;
- (void)watchConnectivityChanges;
@end

@implementation DPCWatchPresenceDetector

- (DPCWatchPresenceDetector)init
{
  v25.receiver = self;
  v25.super_class = (Class)DPCWatchPresenceDetector;
  v2 = [(DPCWatchPresenceDetector *)&v25 init];
  if (v2)
  {
    uint64_t v3 = +[DPCTelemetry sharedInstance];
    telemetry = v2->_telemetry;
    v2->_telemetry = (DPCTelemetry *)v3;

    v5 = objc_opt_new();
    [(DPCWatchPresenceDetector *)v2 setStateMachine:v5];

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.watchpresenced.executionQueue", v7);
    executionQueue = v2->_executionQueue;
    v2->_executionQueue = (OS_dispatch_queue *)v8;

    id v10 = objc_alloc((Class)CBCentralManager);
    v11 = v2->_executionQueue;
    uint64_t v26 = CBCentralManagerOptionReceiveSystemEvents;
    v27 = &__kCFBooleanTrue;
    v12 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v13 = (CBCentralManager *)[v10 initWithDelegate:v2 queue:v11 options:v12];
    manager = v2->_manager;
    v2->_manager = v13;

    uint64_t v15 = +[NRPairedDeviceRegistry sharedInstance];
    nrClient = v2->_nrClient;
    v2->_nrClient = (NRPairedDeviceRegistry *)v15;

    [(DPCWatchPresenceDetector *)v2 setDetectedNewErrorBlock:&stru_100010638];
    [(DPCWatchPresenceDetector *)v2 setDetectedNewEventBlock:&stru_100010658];
    [(DPCWatchPresenceDetector *)v2 setDetectedNewWatchStatusEventBlock:&stru_100010678];
    v17 = v2->_executionQueue;
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_1000084C0;
    v23 = &unk_1000106A0;
    v18 = v2;
    v24 = v18;
    dispatch_async(v17, &v20);
    [(DPCWatchPresenceDetector *)v18 _registerSwitchWatchNotification];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deallocing DPCBTCCLient", buf, 2u);
  }

  [(DPCWatchPresenceDetector *)self resetAll];
  v4.receiver = self;
  v4.super_class = (Class)DPCWatchPresenceDetector;
  [(DPCWatchPresenceDetector *)&v4 dealloc];
}

- (void)_updateActiveNRDevice
{
  uint64_t v3 = [(NRPairedDeviceRegistry *)self->_nrClient getActivePairedDevice];
  objc_super v4 = v3;
  if (!v3)
  {
    v13 = sub_100006A24((uint64_t)off_100016CB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v14 = "No active watch found...";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 2u);
    }
LABEL_19:

    goto LABEL_20;
  }
  p_currentActiveDevice = (id *)&self->_currentActiveDevice;
  if (v3 == self->_currentActiveDevice)
  {
    uint64_t v15 = sub_100006A24((uint64_t)off_100016CB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Still the same watch, no further action needed", (uint8_t *)&v16, 2u);
    }

    [(DPCWatchPresenceDetector *)self connectToWatch];
  }
  else
  {
    objc_storeStrong((id *)&self->_currentActiveDevice, v3);
    id v6 = *p_currentActiveDevice;
    v7 = sub_100006A24((uint64_t)off_100016CB8);
    dispatch_queue_t v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [*p_currentActiveDevice valueForProperty:NRDevicePropertyName];
        id v10 = [*p_currentActiveDevice valueForProperty:NRDevicePropertyAdvertisedName];
        v11 = [*p_currentActiveDevice valueForProperty:NRDevicePropertyPairingID];
        v12 = [*p_currentActiveDevice valueForProperty:NRDevicePropertyBluetoothMACAddress];
        int v16 = 138413058;
        v17 = v9;
        __int16 v18 = 2112;
        v19 = v10;
        __int16 v20 = 2112;
        uint64_t v21 = v11;
        __int16 v22 = 2112;
        v23 = v12;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ActiveDevice changed to: %@, AD name %@, uuid: %@, address %@", (uint8_t *)&v16, 0x2Au);
      }
      if ([(CBCentralManager *)self->_manager state] == (id)5)
      {
        [(DPCWatchPresenceDetector *)self connectToWatch];
        [(DPCWatchPresenceDetector *)self checkAndStartRSSIDetection];
        goto LABEL_20;
      }
      v13 = sub_100006A24((uint64_t)off_100016CB8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        v14 = "BT not ready yet";
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000B048(v8);
    }
  }
LABEL_20:
}

- (id)getCurrentWatchMACAddress
{
  currentActiveDevice = self->_currentActiveDevice;
  if (currentActiveDevice
    || ([(DPCWatchPresenceDetector *)self _updateActiveNRDevice],
        (currentActiveDevice = self->_currentActiveDevice) != 0))
  {
    currentActiveDevice = [currentActiveDevice valueForProperty:NRDevicePropertyBluetoothMACAddress];
  }

  return currentActiveDevice;
}

- (void)connectToWatch
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(NRDevice *)v2->_currentActiveDevice valueForProperty:NRDevicePropertyBluetoothMACAddress];
  if (!v3)
  {
    p_super = sub_100006A24((uint64_t)off_100016CB8);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      sub_10000B08C(p_super);
    }
    goto LABEL_16;
  }
  if (![(NSString *)v2->_macAddress isEqualToString:v3])
  {
    objc_super v4 = [(DPCWatchPresenceDetector *)v2 stateMachine];
    [v4 setIsSwitchingWatch:1];

    v5 = sub_100006A24((uint64_t)off_100016CB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      macAddress = v2->_macAddress;
      int v22 = 138412546;
      v23 = (CBPeripheral *)macAddress;
      __int16 v24 = 2112;
      objc_super v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Switching from %@ to %@", (uint8_t *)&v22, 0x16u);
    }

    v7 = [(DPCWatchPresenceDetector *)v2 detectedNewWatchStatusEventBlock];
    v7[2](v7, 0);

    [(DPCTelemetry *)v2->_telemetry registerWatchSwitch];
  }
  objc_storeStrong((id *)&v2->_macAddress, v3);
  uint64_t v8 = [(CBCentralManager *)v2->_manager retrievePeripheralWithAddress:v2->_macAddress];
  watch = v2->_watch;
  v2->_watch = (CBPeripheral *)v8;

  id v10 = v2->_watch;
  if (!v10
    || ([(CBPeripheral *)v10 identifier],
        v11 = objc_claimAutoreleasedReturnValue(),
        BOOL v12 = v11 == 0,
        v11,
        v12))
  {
    __int16 v20 = sub_100006A24((uint64_t)off_100016CB8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10000B108((uint64_t)v3, v20);
    }

    p_super = &v2->_watch->super.super;
    v2->_watch = 0;
LABEL_16:

    goto LABEL_17;
  }
  v13 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v2->_watch;
    int v22 = 138412290;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Successfully retrieved CBPeripheral %@", (uint8_t *)&v22, 0xCu);
  }

  id v15 = objc_alloc((Class)NRDeviceMonitor);
  int v16 = [(CBPeripheral *)v2->_watch identifier];
  id v17 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:v16];
  __int16 v18 = (NRDeviceMonitor *)[v15 initWithDeviceIdentifier:v17 delegate:v2 queue:v2->_executionQueue];
  nrMonitor = v2->_nrMonitor;
  v2->_nrMonitor = v18;

  [(SFClient *)v2->_sfClient getPairedWatchWristStateWithCompletionHandler:v2->_wristDetectionHandler];
LABEL_17:

  objc_sync_exit(v2);
}

- (void)loadPolicy
{
  uint64_t v3 = [(DPCWatchPresenceDetector *)self stateMachine];
  unsigned int v4 = [v3 isInRSSIMode];

  if (v4) {
    v5 = DPCRSSIPolicy;
  }
  else {
    v5 = DPCConnectivityPolicy;
  }
  id v6 = [v5 alloc];
  v7 = [(DPCWatchPresenceDetector *)self stateMachine];
  uint64_t v8 = (DPCBasePolicy *)[v6 initWithStateMachine:v7];
  policy = self->_policy;
  self->_policy = v8;

  id v10 = [(DPCWatchPresenceDetector *)self detectedNewEventBlock];
  [(DPCBasePolicy *)self->_policy setDetectedNewEventBlock:v10];

  v11 = [(DPCWatchPresenceDetector *)self detectedNewErrorBlock];
  [(DPCBasePolicy *)self->_policy setDetectedNewErrorBlock:v11];

  id v12 = [(DPCWatchPresenceDetector *)self detectedNewWatchStatusEventBlock];
  [(DPCBasePolicy *)self->_policy setDetectedNewWatchStatusEventBlock:v12];
}

- (void)resetWatchMonitors
{
  self->_nrMonitor = 0;
  _objc_release_x1();
}

- (void)resetBT
{
  [(DPCWatchPresenceDetector *)self disableRSSIStatisticsDetection];
  nrMonitor = self->_nrMonitor;
  self->_nrMonitor = 0;

  watch = self->_watch;
  self->_watch = 0;
}

- (void)resetAll
{
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008D58;
  block[3] = &unk_1000106A0;
  block[4] = self;
  dispatch_sync(executionQueue, block);
}

- (void)checkAndStartRSSIDetection
{
  id v6 = [(DPCWatchPresenceDetector *)self stateMachine];
  if ([v6 isRunning] && -[DPCBasePolicy requireRSSI](self->_policy, "requireRSSI"))
  {
    watch = self->_watch;

    if (watch)
    {
      unsigned int v4 = [(DPCWatchPresenceDetector *)self stateMachine];
      id v5 = [v4 currentWatchWristState];

      if (v5 == (id)3)
      {
        [(DPCWatchPresenceDetector *)self runDiscoveryMode];
      }
      else
      {
        [(DPCWatchPresenceDetector *)self disableRSSIStatisticsDetection];
      }
    }
  }
  else
  {
  }
}

- (BOOL)checkIfBluetoothPowerOff
{
  return [(CBCentralManager *)self->_manager state] == (id)4;
}

- (BOOL)checkIfBluetoothReady
{
  return [(CBCentralManager *)self->_manager state] == (id)5;
}

- (void)_stopWristMonitoring
{
  if (self->_sfClient)
  {
    uint64_t v3 = sub_100006A24((uint64_t)off_100016CB8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping on wrist detection...", v5, 2u);
    }

    [(SFClient *)self->_sfClient monitorPairedWatchWristStateWithCompletionHandler:&stru_1000106E0];
    sfClient = self->_sfClient;
    self->_sfClient = 0;
  }
}

- (void)_setupOnWristMonitoring
{
  uint64_t v3 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up on wrist detection...", (uint8_t *)buf, 2u);
  }

  unsigned int v4 = (SFClient *)objc_opt_new();
  sfClient = self->_sfClient;
  self->_sfClient = v4;

  [(SFClient *)self->_sfClient setDispatchQueue:self->_executionQueue];
  objc_initWeak(buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000090E4;
  v8[3] = &unk_100010708;
  objc_copyWeak(&v9, buf);
  id v6 = objc_retainBlock(v8);
  id wristDetectionHandler = self->_wristDetectionHandler;
  self->_id wristDetectionHandler = v6;

  [(SFClient *)self->_sfClient monitorPairedWatchWristStateWithCompletionHandler:self->_wristDetectionHandler];
  [(SFClient *)self->_sfClient getPairedWatchWristStateWithCompletionHandler:self->_wristDetectionHandler];
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (void)_registerSwitchWatchNotification
{
  objc_initWeak(&location, self);
  uint64_t v3 = (const char *)[NRPairedDeviceRegistryWatchDidBecomeActiveDarwinNotification UTF8String];
  executionQueue = self->_executionQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100009228;
  v5[3] = &unk_100010730;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch(v3, &self->_notifyToken, executionQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)detectWatchWristStateEvent:(int64_t)a3
{
  unsigned int v4 = self;
  objc_sync_enter(v4);
  id v5 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 >= 4)
    {
      id v6 = +[NSString stringWithFormat:@"Undefined state (%ld)", a3];
    }
    else
    {
      id v6 = *(&off_100010778 + a3);
    }
    *(_DWORD *)buf = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[WristEvent]: \"%@\"", buf, 0xCu);
  }
  v7 = [(DPCWatchPresenceDetector *)v4 stateMachine];
  [v7 setCurrentWatchWristState:a3];

  objc_sync_exit(v4);
  [(DPCWatchPresenceDetector *)v4 sendWatchWristStateEvent:a3];
  [(DPCBasePolicy *)v4->_policy onWristStateChange:a3];
  [(DPCWatchPresenceDetector *)v4 checkAndStartRSSIDetection];
}

- (void)sendWatchWristStateEvent:(int64_t)a3
{
  -[DPCTelemetry registerWatchWristEvent:](self->_telemetry, "registerWatchWristEvent:");
  if (a3 == 2 || a3 == 3)
  {
    id v5 = [(DPCWatchPresenceDetector *)self detectedNewWatchStatusEventBlock];
    v5[2]();
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = [(CBCentralManager *)self->_manager state];
  id v5 = sub_100006A24((uint64_t)off_100016CB8);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 == (id)5)
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CBManager is ready!", (uint8_t *)&v8, 2u);
    }

    [(DPCWatchPresenceDetector *)self connectToWatch];
    [(DPCWatchPresenceDetector *)self checkAndStartRSSIDetection];
  }
  else
  {
    if (v6)
    {
      id v7 = [(CBCentralManager *)self->_manager state];
      int v8 = 134217984;
      id v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth is unavailable %ld", (uint8_t *)&v8, 0xCu);
    }

    [(DPCWatchPresenceDetector *)self resetBT];
  }
}

- (void)centralManager:(id)a3 didUpdateRSSIStatisticsDetectionForPeripheral:(id)a4 results:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (v13)
  {
    id v15 = [v13 domain];
    unsigned int v16 = [v15 isEqualToString:CBInternalErrorDomain];

    if (v16 && [v14 code] != (id)19)
    {
      id v17 = sub_100006A24((uint64_t)off_100016CB8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412290;
        __int16 v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "RSSI callback error %@", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  else
  {
    __int16 v18 = [v12 objectForKeyedSubscript:@"kCBGetRssiStatisticsDetectionMaximum"];
    [(DPCWatchPresenceDetector *)self checkPolicyWithRSSI:v18];
  }
}

- (void)changeRSSIStatisticsDetection:(id)a3 manager:(id)a4 closer:(id)a5 further:(id)a6 maskDecision:(int64_t)a7
{
  char v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  unsigned int v16 = +[NSMutableDictionary dictionary];
  if (v12 && v13)
  {
    id v57 = v12;
    v58 = self;
    unsigned int v56 = 1 << v7;
    unsigned int v17 = [v14 intValue];
    __int16 v18 = +[DPCDefaults sharedInstance];
    int v19 = [v18 NSNumberForDefault:@"DPCDefaultsThresholdDMIN"];
    unsigned int v20 = [v19 intValue];

    uint64_t v21 = +[DPCDefaults sharedInstance];
    int v22 = v21;
    v23 = &off_100010460;
    if (v17 != v20) {
      v23 = &off_100010458;
    }
    __int16 v24 = [v21 NSNumberForDefault:*v23];
    signed int v25 = [v24 intValue];

    unsigned int v26 = v25 / 4 - 1;
    if (v26 >= 3) {
      uint64_t v27 = 1;
    }
    else {
      uint64_t v27 = v26;
    }
    signed int v28 = [v14 intValue];
    v29 = +[DPCDefaults sharedInstance];
    v30 = [v29 NSNumberForDefault:@"DPCDefaultsThresholdDMIN"];
    signed int v31 = [v30 intValue];

    if (v28 > v31)
    {
      v32 = +[DPCDefaults sharedInstance];
      uint64_t v33 = [v32 NSNumberForDefault:@"DPCDefaultsThresholdDMIN"];

      id v14 = (id)v33;
    }
    signed int v34 = [v15 intValue];
    v35 = +[DPCDefaults sharedInstance];
    v36 = [v35 NSNumberForDefault:@"DPCDefaultsThresholdDMAX"];
    signed int v37 = [v36 intValue];

    if (v34 < v37)
    {
      v38 = +[DPCDefaults sharedInstance];
      uint64_t v39 = [v38 NSNumberForDefault:@"DPCDefaultsThresholdDMAX"];

      id v15 = (id)v39;
    }
    v40 = +[NSNumber numberWithInt:1];
    [v16 setObject:v40 forKeyedSubscript:CBRSSIStatisticAndDetectionEnable];

    [v16 setObject:v15 forKeyedSubscript:CBRSSIStatisticAndDetectionAverageThresholdFurther];
    uint64_t v41 = CBRSSIStatisticAndDetectionMaximumThresholdFurther;
    [v16 setObject:v15 forKeyedSubscript:CBRSSIStatisticAndDetectionMaximumThresholdFurther];
    [v16 setObject:v15 forKeyedSubscript:CBRSSIStatisticAndDetectionMedianThresholdFurther];
    [v16 setObject:v14 forKeyedSubscript:CBRSSIStatisticAndDetectionAverageThresholdCloser];
    uint64_t v42 = CBRSSIStatisticAndDetectionMaximumThresholdCloser;
    [v16 setObject:v14 forKeyedSubscript:CBRSSIStatisticAndDetectionMaximumThresholdCloser];
    [v16 setObject:v14 forKeyedSubscript:CBRSSIStatisticAndDetectionMedianThresholdCloser];
    v43 = +[NSNumber numberWithInt:0];
    [v16 setObject:v43 forKeyedSubscript:CBRSSIStatisticAndDetectionVarThreshold1];

    v44 = +[NSNumber numberWithInt:0];
    [v16 setObject:v44 forKeyedSubscript:CBRSSIStatisticAndDetectionVarThreshold2];

    v45 = +[NSNumber numberWithInt:v56];
    [v16 setObject:v45 forKeyedSubscript:CBRSSIStatisticAndDetectionMaskDecisionLogic];

    v46 = +[NSNumber numberWithInt:0];
    [v16 setObject:v46 forKeyedSubscript:CBRSSIStatisticAndDetectionCMCheckLogic];

    v47 = +[NSNumber numberWithInt:0];
    [v16 setObject:v47 forKeyedSubscript:CBRSSIStatisticAndDetectionCM_AND_Mask];

    v48 = +[NSNumber numberWithInt:0];
    [v16 setObject:v48 forKeyedSubscript:CBRSSIStatisticAndDetectionCM_XOR_Mask];

    v49 = +[NSNumber numberWithInt:0];
    [v16 setObject:v49 forKeyedSubscript:CBRSSIStatisticAndDetectionCM_AND_Mask2];

    v50 = +[NSNumber numberWithInt:0];
    [v16 setObject:v50 forKeyedSubscript:CBRSSIStatisticAndDetectionEnableDebugging];

    v51 = +[NSNumber numberWithInt:v27];
    [v16 setObject:v51 forKeyedSubscript:CBRSSIStatisticAndDetectionWindowConfiguration];

    v52 = sub_100006A24((uint64_t)off_100016CB8);
    id v12 = v57;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = [v16 objectForKeyedSubscript:v42];
      v54 = [v16 objectForKeyedSubscript:v41];
      *(_DWORD *)buf = 138412546;
      v60 = v53;
      __int16 v61 = 2112;
      v62 = v54;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Enabled BT RSSI Stat with closer: %@ db, further: %@ db", buf, 0x16u);
    }
    [v13 setRSSIStatisticsDetection:v57 options:v16];
    v55 = [(DPCWatchPresenceDetector *)v58 stateMachine];
    [v55 setIsRunningRSSIStatDetecion:1];
  }
}

- (void)disableRSSIStatisticsDetection:(id)a3 manager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v6)
  {
    if (v7)
    {
      id v9 = [(DPCWatchPresenceDetector *)self stateMachine];
      unsigned int v10 = [v9 isRunningRSSIStatDetecion];

      if (v10)
      {
        id v11 = +[NSMutableDictionary dictionary];
        id v12 = +[NSNumber numberWithInt:0];
        [v11 setObject:v12 forKeyedSubscript:CBRSSIStatisticAndDetectionEnable];

        id v13 = sub_100006A24((uint64_t)off_100016CB8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412290;
          id v16 = v6;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Disabling BT RSSI Stat against %@", (uint8_t *)&v15, 0xCu);
        }

        [v8 setRSSIStatisticsDetection:v6 options:v11];
        id v14 = [(DPCWatchPresenceDetector *)self stateMachine];
        [v14 setIsRunningRSSIStatDetecion:0];
      }
    }
  }
}

- (void)start
{
  BOOL v3 = +[DPCDefaults isRSSIModeEnabled];
  uint64_t v4 = [(DPCWatchPresenceDetector *)self stateMachine];
  [(id)v4 setIsInRSSIMode:v3];

  [(DPCWatchPresenceDetector *)self loadPolicy];
  id v5 = [(DPCWatchPresenceDetector *)self stateMachine];
  LOBYTE(v4) = [v5 isRunning];

  if ((v4 & 1) == 0)
  {
    id v6 = [(DPCWatchPresenceDetector *)self stateMachine];
    [v6 setIsRunning:1];

    id v7 = [(DPCWatchPresenceDetector *)self stateMachine];
    [v7 setIsMonitoringAbsence:1];

    if (!self->_watch) {
      [(DPCWatchPresenceDetector *)self _updateActiveNRDevice];
    }
    [(DPCWatchPresenceDetector *)self _setupOnWristMonitoring];
    [(DPCWatchPresenceDetector *)self checkAndStartRSSIDetection];
  }
}

- (void)stop
{
  BOOL v3 = [(DPCWatchPresenceDetector *)self stateMachine];
  unsigned int v4 = [v3 isRunning];

  if (v4)
  {
    id v5 = [(DPCWatchPresenceDetector *)self stateMachine];
    [v5 setIsRunning:0];

    [(DPCWatchPresenceDetector *)self disableRSSIStatisticsDetection];
  }
}

- (unint64_t)prestartCheck
{
  if ([(DPCWatchPresenceDetector *)self checkIfBluetoothPowerOff])
  {
    unint64_t v3 = 3;
LABEL_6:
    [(DPCTelemetry *)self->_telemetry registerError:v3];
    return v3;
  }
  unsigned int v4 = [(DPCWatchPresenceDetector *)self getCurrentWatchMACAddress];

  if (!v4)
  {
    unint64_t v3 = 2;
    goto LABEL_6;
  }
  return 0;
}

- (void)disableRSSIStatisticsDetection
{
}

- (void)monitorRSSIPresence
{
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A0EC;
  block[3] = &unk_1000106A0;
  block[4] = self;
  dispatch_async(executionQueue, block);
}

- (void)monitorRSSIAbsence
{
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A290;
  block[3] = &unk_1000106A0;
  block[4] = self;
  dispatch_async(executionQueue, block);
}

- (void)runDiscoveryMode
{
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A4C0;
  block[3] = &unk_1000106A0;
  block[4] = self;
  dispatch_async(executionQueue, block);
}

- (void)checkPolicyWithRSSI:(id)a3
{
  id v4 = a3;
  id v5 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [v4 floatValue];
    int v8 = 134217984;
    double v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RSSI Updates: %.2f", (uint8_t *)&v8, 0xCu);
  }

  unint64_t v7 = [(DPCBasePolicy *)self->_policy onRSSIChange:v4];
  if (v7 == 2)
  {
    [(DPCWatchPresenceDetector *)self monitorRSSIAbsence];
  }
  else if (v7 == 1)
  {
    [(DPCWatchPresenceDetector *)self monitorRSSIPresence];
  }
}

- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4
{
  objc_initWeak(&location, self);
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A7F0;
  block[3] = &unk_100010758;
  objc_copyWeak(&v8, &location);
  BOOL v9 = a4;
  dispatch_async(executionQueue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deviceIsConnectedDidChange isConnected: %d", (uint8_t *)v6, 8u);
  }
}

- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5
{
  int v5 = a4;
  float v6 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "deviceLinkTypeDidChange to :%d", (uint8_t *)v7, 8u);
  }
}

- (void)watchConnectivityChanges
{
  if (self->_nrMonitor)
  {
    unint64_t v3 = sub_100006A24((uint64_t)off_100016CB8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v4 = [(NRDeviceMonitor *)self->_nrMonitor deviceIdentifier];
      unsigned int v5 = [(NRDeviceMonitor *)self->_nrMonitor isConnected];
      unsigned int v6 = [(NRDeviceMonitor *)self->_nrMonitor isCloudConnected];
      unsigned int v7 = [(NRDeviceMonitor *)self->_nrMonitor isNearby];
      [(NRDeviceMonitor *)self->_nrMonitor linkType];
      StringFromNRLinkType = (void *)createStringFromNRLinkType();
      int v25 = 138413314;
      unsigned int v26 = v4;
      __int16 v27 = 1024;
      unsigned int v28 = v5;
      __int16 v29 = 1024;
      unsigned int v30 = v6;
      __int16 v31 = 1024;
      unsigned int v32 = v7;
      __int16 v33 = 2112;
      signed int v34 = StringFromNRLinkType;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Current connection to %@, isConnected %d, isCloudConnected %d, isBluetoothConnected %d, linkType %@", (uint8_t *)&v25, 0x28u);
    }
    [(DPCTelemetry *)self->_telemetry registerWatchConnectivity:[(NRDeviceMonitor *)self->_nrMonitor isNearby]];
    BOOL v9 = [(DPCWatchPresenceDetector *)self detectedNewWatchStatusEventBlock];

    if (v9)
    {
      unsigned int v10 = [(DPCWatchPresenceDetector *)self detectedNewWatchStatusEventBlock];
      if ([(NRDeviceMonitor *)self->_nrMonitor isNearby]) {
        uint64_t v11 = 4;
      }
      else {
        uint64_t v11 = 3;
      }
      v10[2](v10, v11);
    }
    id v12 = [(NRDeviceMonitor *)self->_nrMonitor isConnected];
    id v13 = [(DPCWatchPresenceDetector *)self stateMachine];
    [v13 setIsWatchConnected:v12];

    id v14 = [(NRDeviceMonitor *)self->_nrMonitor isNearby];
    int v15 = [(DPCWatchPresenceDetector *)self stateMachine];
    [v15 setIsBluetoothConnected:v14];

    if ([(NRDeviceMonitor *)self->_nrMonitor isNearby])
    {
      id v16 = [(DPCWatchPresenceDetector *)self stateMachine];
      unsigned int v17 = [v16 isSwitchingWatch];

      __int16 v18 = sub_100006A24((uint64_t)off_100016CB8);
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v17)
      {
        if (v19)
        {
          unsigned int v20 = [(NRDeviceMonitor *)self->_nrMonitor deviceIdentifier];
          int v25 = 138412290;
          unsigned int v26 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Switched to watch: %@", (uint8_t *)&v25, 0xCu);
        }
        __int16 v18 = [(DPCWatchPresenceDetector *)self stateMachine];
        [v18 setIsSwitchingWatch:0];
      }
      else if (v19)
      {
        int v22 = [(NRDeviceMonitor *)self->_nrMonitor deviceIdentifier];
        int v25 = 138412290;
        unsigned int v26 = v22;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Watch %@ connected.", (uint8_t *)&v25, 0xCu);
      }
      v23 = [(DPCWatchPresenceDetector *)self stateMachine];
      unsigned int v24 = [v23 isInRSSIMode];

      if (v24) {
        [(DPCWatchPresenceDetector *)self checkAndStartRSSIDetection];
      }
    }
    else
    {
      uint64_t v21 = sub_100006A24((uint64_t)off_100016CB8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Watch disconnected from BT", (uint8_t *)&v25, 2u);
      }
    }
    [(DPCBasePolicy *)self->_policy onWatchConnectivityChange:[(NRDeviceMonitor *)self->_nrMonitor isNearby]];
  }
}

- (void)setEnabledStreamingMode:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(DPCWatchPresenceDetector *)self stateMachine];
  [v5 setIsInRSSIStreamingMode:v3];

  [(DPCWatchPresenceDetector *)self disableRSSIStatisticsDetection];
  unsigned int v6 = [(DPCWatchPresenceDetector *)self stateMachine];
  LODWORD(v5) = [v6 isInRSSIStreamingMode];

  if (v5)
  {
    manager = self->_manager;
    watch = self->_watch;
    id v12 = +[DPCDefaults sharedInstance];
    BOOL v9 = [v12 NSNumberForDefault:@"DPCDefaultsThresholdDMIN"];
    unsigned int v10 = +[DPCDefaults sharedInstance];
    uint64_t v11 = [v10 NSNumberForDefault:@"DPCDefaultsThresholdDDiscovery"];
    [(DPCWatchPresenceDetector *)self changeRSSIStatisticsDetection:watch manager:manager closer:v9 further:v11 maskDecision:1];
  }
}

- (id)detectedNewEventBlock
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setDetectedNewEventBlock:(id)a3
{
}

- (id)detectedNewErrorBlock
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setDetectedNewErrorBlock:(id)a3
{
}

- (id)detectedNewWatchStatusEventBlock
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setDetectedNewWatchStatusEventBlock:(id)a3
{
}

- (DPCStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong(&self->_detectedNewWatchStatusEventBlock, 0);
  objc_storeStrong(&self->_detectedNewErrorBlock, 0);
  objc_storeStrong(&self->_detectedNewEventBlock, 0);
  objc_storeStrong((id *)&self->_telemetry, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_currentActiveDevice, 0);
  objc_storeStrong((id *)&self->_nrClient, 0);
  objc_storeStrong(&self->_wristDetectionHandler, 0);
  objc_storeStrong((id *)&self->_sfClient, 0);
  objc_storeStrong((id *)&self->_nrMonitor, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_watch, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

@end