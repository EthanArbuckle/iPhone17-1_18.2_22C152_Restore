@interface EPDiscovererManager
- (BOOL)scanForProximity;
- (EPDeviceCollection)deviceCollection;
- (EPDiscovererManager)init;
- (NSArray)discoverDeviceUUIDs;
- (id)devicesDictionary;
- (id)newDiscovererWithDelegate:(id)a3;
- (void)_setTimerDuration:(double)a3 withBlock:(id)a4;
- (void)cancelDiscoveryCounter;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)clear;
- (void)clearAndStartDiscoveryCounter;
- (void)collection:(id)a3 deviceDidAppear:(id)a4;
- (void)collection:(id)a3 deviceDidBecomeDisplayable:(id)a4;
- (void)collection:(id)a3 deviceDidBecomeProximate:(id)a4;
- (void)collection:(id)a3 deviceDidBecomeUndisplayable:(id)a4;
- (void)collection:(id)a3 deviceDidBecomeUnproximate:(id)a4;
- (void)collection:(id)a3 deviceDidDisappear:(id)a4;
- (void)collection:(id)a3 deviceDidUpdate:(id)a4;
- (void)collection:(id)a3 deviceInfoDidDealloc:(id)a4;
- (void)collectionPairingFailure:(id)a3;
- (void)collectionPairingSuccess:(id)a3;
- (void)notifyDelegateOfBluetoothSuccess;
- (void)notifyDelegateOfPossibleBluetoothFailure;
- (void)setDiscoverDeviceUUIDs:(id)a3;
- (void)setScanForProximity:(BOOL)a3;
- (void)update;
@end

@implementation EPDiscovererManager

- (void)clearAndStartDiscoveryCounter
{
  self->_discoveryCounter = 0;
  v3 = +[NSDate date];
  ttrDate = self->_ttrDate;
  self->_ttrDate = v3;

  v5 = +[NSDate date];
  [v5 timeIntervalSinceReferenceDate];
  self->_discoveryStartTime = v6;

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100054C6C;
  v7[3] = &unk_100165E68;
  objc_copyWeak(&v8, &location);
  [(EPDiscovererManager *)self _setTimerDuration:v7 withBlock:10.0];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)cancelDiscoveryCounter
{
  v3 = +[NSDate date];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  double discoveryStartTime = self->_discoveryStartTime;
  if (discoveryStartTime <= 0.0 || discoveryStartTime >= v5) {
    goto LABEL_19;
  }
  double v8 = v5 - discoveryStartTime;
  self->_double discoveryStartTime = 0.0;
  v9 = sub_1000A3BC0();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v8 <= 3.0 || v8 >= 300.0)
  {
    if (!v10) {
      goto LABEL_19;
    }
    v13 = sub_1000A3BC0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218240;
      v15 = self;
      __int16 v16 = 2048;
      double v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "EPDiscovererManager[%p]: Not enough time discovering. %1.2f", (uint8_t *)&v14, 0x16u);
    }
LABEL_18:

    goto LABEL_19;
  }
  if (v10)
  {
    v11 = sub_1000A3BC0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int64_t discoveryCounter = self->_discoveryCounter;
      int v14 = 134218496;
      v15 = self;
      __int16 v16 = 2048;
      double v17 = *(double *)&discoveryCounter;
      __int16 v18 = 2048;
      double v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "EPDiscovererManager[%p]: Discovery timer canceled. %ld discovery delegate calls received after %1.2f seconds", (uint8_t *)&v14, 0x20u);
    }
  }
  if (!self->_discoveryCounter && ![(NSArray *)self->_discoverDeviceUUIDs count])
  {
    v13 = [(EPCentralManager *)self->_central manager];
    [v13 triggerBTErrorReport:1];
    goto LABEL_18;
  }
LABEL_19:
  [(EPDiscovererManager *)self _setTimerDuration:0 withBlock:0.0];
}

- (void)_setTimerDuration:(double)a3 withBlock:(id)a4
{
  id v6 = a4;
  currentTimer = self->_currentTimer;
  if (currentTimer)
  {
    dispatch_source_cancel(currentTimer);
    double v8 = self->_currentTimer;
    self->_currentTimer = 0;
  }
  if (v6)
  {
    v9 = +[EPFactory queue];
    BOOL v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v9);

    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100054FE4;
    v14[3] = &unk_100166210;
    v14[4] = self;
    id v15 = v6;
    dispatch_source_set_event_handler(v10, v14);
    dispatch_resume(v10);
    v12 = self->_currentTimer;
    self->_currentTimer = (OS_dispatch_source *)v10;
    v13 = v10;
  }
}

- (id)devicesDictionary
{
  return [(EPDeviceCollection *)self->_deviceCollection devicesDictionary];
}

- (EPDiscovererManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)EPDiscovererManager;
  v2 = [(EPDiscovererManager *)&v12 init];
  if (v2)
  {
    v3 = +[NSSet setWithObject:@"EPDiscoverer"];
    +[NRPowerAssertionActivity addActivityGroup:v3];

    uint64_t v4 = +[NSPointerArray weakObjectsPointerArray];
    discoverers = v2->_discoverers;
    v2->_discoverers = (NSPointerArray *)v4;

    id v6 = [[EPDeviceCollection alloc] initWithDelegate:v2];
    deviceCollection = v2->_deviceCollection;
    v2->_deviceCollection = v6;

    double v8 = +[EPFactory queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100055174;
    block[3] = &unk_1001655F8;
    dispatch_time_t v11 = v2;
    dispatch_async(v8, block);
  }
  return v2;
}

- (id)newDiscovererWithDelegate:(id)a3
{
  id v4 = a3;
  double v5 = [[EPDiscoverer alloc] initWithManager:self withDelegate:v4];

  [(NSPointerArray *)self->_discoverers addPointer:v5];
  id v6 = +[EPFactory queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055250;
  block[3] = &unk_1001655F8;
  void block[4] = self;
  dispatch_async(v6, block);

  return v5;
}

- (void)clear
{
}

- (void)update
{
  v3 = [(NSPointerArray *)self->_discoverers allObjects];
  id v4 = [v3 count];

  if (v4)
  {
    if (!self->_wasNeedingDiscovering)
    {
      self->_wasNeedingDiscovering = 1;
      self->_pairingFailures = 0;
    }
    central = self->_central;
    if (!central)
    {
      id v6 = +[EPFactory sharedFactory];
      v7 = [v6 agentManager];
      double v8 = (EPCentralManager *)[v7 newCentralManagerWithDelegate:self];
      v9 = self->_central;
      self->_central = v8;

      central = self->_central;
    }
    if ((id)[(EPResource *)central availability] == (id)1)
    {
      if (!self->_isScanning)
      {
        self->_isScanning = 1;
        v38[0] = CBCentralManagerScanOptionAllowDuplicatesKey;
        v38[1] = CBManagerIsPrivilegedDaemonKey;
        v39[0] = &__kCFBooleanTrue;
        v39[1] = &__kCFBooleanTrue;
        BOOL v10 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
        id v11 = [v10 mutableCopy];

        objc_super v12 = [(EPDiscovererManager *)self discoverDeviceUUIDs];
        id v13 = [v12 count];

        if (v13)
        {
          int v14 = [(EPDiscovererManager *)self discoverDeviceUUIDs];
          [v11 setObject:v14 forKeyedSubscript:CBCentralManagerScanOptionPeersKey];

          [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:CBCentralManagerScanOptionReloadMigratableItems];
        }
        [(EPDiscovererManager *)self scanForProximity];
        id v15 = sub_1000A3BC0();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

        if (v16)
        {
          double v17 = sub_1000A3BC0();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v37 = v11;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Calling CoreBluetooth CBCentralManager scanForPeripheralsWithServices with options %@", buf, 0xCu);
          }
        }
        __int16 v18 = +[NRPowerAssertionActivity activityWithName:@"EPDiscoverer"];
        powerAssertion = self->_powerAssertion;
        self->_powerAssertion = v18;

        v20 = [(EPCentralManager *)self->_central manager];
        v21 = [(EPDiscovererManager *)self discoverDeviceUUIDs];
        if ([v21 count])
        {
          [v20 scanForPeripheralsWithServices:0 options:v11];
        }
        else
        {
          v30 = +[CBUUID UUIDWithString:@"9AA4730F-B25C-4CC3-B821-C931559FC196"];
          v35 = v30;
          v31 = +[NSArray arrayWithObjects:&v35 count:1];
          [v20 scanForPeripheralsWithServices:v31 options:v11];
        }
        v32 = [(EPDiscovererManager *)self discoverDeviceUUIDs];
        id v33 = [v32 count];

        if (v33) {
          [(EPDiscovererManager *)self cancelDiscoveryCounter];
        }
        else {
          [(EPDiscovererManager *)self clearAndStartDiscoveryCounter];
        }
      }
    }
    else
    {
      [(EPDiscovererManager *)self cancelDiscoveryCounter];
      self->_isScanning = 0;
      [(EPDeviceCollection *)self->_deviceCollection clear];
    }
  }
  else
  {
    [(EPDiscovererManager *)self cancelDiscoveryCounter];
    self->_unint64_t newBluetoothState = 0;
    self->_wasNeedingDiscovering = 0;
    if (self->_isScanning)
    {
      self->_isScanning = 0;
      if ((id)[(EPResource *)self->_central availability] == (id)1)
      {
        v22 = sub_1000A3BC0();
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

        if (v23)
        {
          v24 = sub_1000A3BC0();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Calling CoreBluetooth CBCentralManager stopScan", buf, 2u);
          }
        }
        v25 = [(EPCentralManager *)self->_central manager];
        [v25 stopScan];

        v26 = self->_powerAssertion;
        self->_powerAssertion = 0;
      }
    }
    v27 = [(EPDeviceCollection *)self->_deviceCollection devicesDictionary];
    id v28 = [v27 count];

    if (!v28)
    {
      v29 = self->_central;
      self->_central = 0;
    }
  }
  unint64_t newBluetoothState = self->_newBluetoothState;
  if (newBluetoothState != self->_bluetoothState)
  {
    self->_bluetoothState = newBluetoothState;
    if (newBluetoothState == 1)
    {
      [(EPDiscovererManager *)self notifyDelegateOfBluetoothSuccess];
    }
    else if (newBluetoothState == 2)
    {
      [(EPDiscovererManager *)self notifyDelegateOfPossibleBluetoothFailure];
    }
  }
}

- (void)setDiscoverDeviceUUIDs:(id)a3
{
  id v5 = a3;
  discoverDeviceUUIDs = self->_discoverDeviceUUIDs;
  if (v5 && !discoverDeviceUUIDs
    || discoverDeviceUUIDs && ([(NSArray *)discoverDeviceUUIDs isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_discoverDeviceUUIDs, a3);
    if (self->_isScanning)
    {
      self->_isScanning = 0;
      if ((id)[(EPResource *)self->_central availability] == (id)1)
      {
        v7 = sub_1000A3BC0();
        BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

        if (v8)
        {
          v9 = sub_1000A3BC0();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling CoreBluetooth CBCentralManager stopScan because of change in the discoverDeviceUUIDs array", buf, 2u);
          }
        }
        BOOL v10 = [(EPCentralManager *)self->_central manager];
        [v10 stopScan];
      }
      id v11 = +[EPFactory queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100055820;
      block[3] = &unk_1001655F8;
      void block[4] = self;
      dispatch_async(v11, block);
    }
  }
}

- (void)setScanForProximity:(BOOL)a3
{
  if (self->_scanForProximity != a3 && self->_isScanning)
  {
    self->_isScanning = 0;
    if ((id)[(EPResource *)self->_central availability] == (id)1)
    {
      id v4 = sub_1000A3BC0();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

      if (v5)
      {
        id v6 = sub_1000A3BC0();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Calling CoreBluetooth CBCentralManager stopScan because of change in the scanForProximity property", buf, 2u);
        }
      }
      v7 = [(EPCentralManager *)self->_central manager];
      [v7 stopScan];
    }
    BOOL v8 = +[EPFactory queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100055964;
    block[3] = &unk_1001655F8;
    void block[4] = self;
    dispatch_async(v8, block);
  }
}

- (void)notifyDelegateOfPossibleBluetoothFailure
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(NSPointerArray *)self->_discoverers allObjects];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector()) {
          [v7 discovererBluetoothMayHaveFailed:v7];
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)notifyDelegateOfBluetoothSuccess
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(NSPointerArray *)self->_discoverers allObjects];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector()) {
          [v7 discovererBluetoothIsWorking:v7];
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  ++self->_discoveryCounter;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  [(EPDiscovererManager *)self _setTimerDuration:0 withBlock:0.0];
  id v15 = [v11 identifier];
  objc_super v12 = [(EPDeviceCollection *)self->_deviceCollection devicesDictionary];
  id v13 = [v12 objectForKeyedSubscript:v15];

  if (v13)
  {
    [v13 updateWithPeripheral:v11 withAdvertisementData:v10 withRSSI:v9];
  }
  else
  {
    id v14 = [(EPDeviceCollection *)self->_deviceCollection newDeviceWithPeripheral:v11 withAdvertisementData:v10 withRSSI:v9];

    id v9 = v10;
    id v10 = v11;
    id v11 = v14;
  }
}

- (void)collection:(id)a3 deviceDidAppear:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v8 = [(NSPointerArray *)self->_discoverers allObjects];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      objc_super v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) collection:v6 deviceDidAppear:v7];
        objc_super v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)collection:(id)a3 deviceDidBecomeDisplayable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v8 = [(NSPointerArray *)self->_discoverers allObjects];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      objc_super v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) collection:v6 deviceDidBecomeDisplayable:v7];
        objc_super v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)collection:(id)a3 deviceDidBecomeProximate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v8 = [(NSPointerArray *)self->_discoverers allObjects];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      objc_super v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) collection:v6 deviceDidBecomeProximate:v7];
        objc_super v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)collection:(id)a3 deviceDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v8 = [(NSPointerArray *)self->_discoverers allObjects];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      objc_super v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) collection:v6 deviceDidUpdate:v7];
        objc_super v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)collection:(id)a3 deviceDidDisappear:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v8 = [(NSPointerArray *)self->_discoverers allObjects];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      objc_super v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) collection:v6 deviceDidDisappear:v7];
        objc_super v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  [(EPDiscovererManager *)self update];
}

- (void)collection:(id)a3 deviceDidBecomeUndisplayable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v8 = [(NSPointerArray *)self->_discoverers allObjects];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      objc_super v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) collection:v6 deviceDidBecomeUndisplayable:v7];
        objc_super v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)collection:(id)a3 deviceDidBecomeUnproximate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v8 = [(NSPointerArray *)self->_discoverers allObjects];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      objc_super v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) collection:v6 deviceDidBecomeUnproximate:v7];
        objc_super v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)collection:(id)a3 deviceInfoDidDealloc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v8 = [(NSPointerArray *)self->_discoverers allObjects];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      objc_super v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) collection:v6 deviceInfoDidDealloc:v7];
        objc_super v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)collectionPairingFailure:(id)a3
{
  int64_t pairingFailures = self->_pairingFailures;
  self->_int64_t pairingFailures = pairingFailures + 1;
  if (pairingFailures >= 3)
  {
    self->_unint64_t newBluetoothState = 2;
    [(EPDiscovererManager *)self update];
  }
}

- (void)collectionPairingSuccess:(id)a3
{
  *(_OWORD *)&self->_int64_t pairingFailures = xmmword_10011A6A0;
  [(EPDiscovererManager *)self update];
}

- (NSArray)discoverDeviceUUIDs
{
  return self->_discoverDeviceUUIDs;
}

- (BOOL)scanForProximity
{
  return self->_scanForProximity;
}

- (EPDeviceCollection)deviceCollection
{
  return self->_deviceCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCollection, 0);
  objc_storeStrong((id *)&self->_discoverDeviceUUIDs, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_ttrDate, 0);
  objc_storeStrong((id *)&self->_currentTimer, 0);
  objc_storeStrong((id *)&self->_discoverers, 0);

  objc_storeStrong((id *)&self->_central, 0);
}

@end