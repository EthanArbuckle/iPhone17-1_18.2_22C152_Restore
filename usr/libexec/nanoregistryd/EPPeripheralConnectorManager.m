@interface EPPeripheralConnectorManager
+ (Class)resourceClass;
+ (id)stringForEPPeripheralConnectorState:(unint64_t)a3;
- (BOOL)isConnected;
- (BOOL)needsResourceWithExpiry;
- (EPDiscoverer)discoverer;
- (EPPeripheralConnectorManager)initWithUuid:(id)a3;
- (NSUUID)uuid;
- (void)cancelPeripheralConnection:(id)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4;
- (void)clearConnectPersistenceTimer;
- (void)createResource;
- (void)destroyResource;
- (void)peripheralWasInvalidated;
- (void)setConnectPersistenceTimer;
- (void)setPeripheralConnectorShouldForceDisconnect;
- (void)update;
@end

@implementation EPPeripheralConnectorManager

- (EPPeripheralConnectorManager)initWithUuid:(id)a3
{
  id v5 = a3;
  v6 = +[EPFactory queue];
  v7 = [(EPResourceManager *)self initWithQueue:v6];

  if (v7)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    objc_storeStrong((id *)&v7->_uuid, a3);
    double v8 = (double)CFPreferencesGetAppIntegerValue(@"connectPersistenceTimerDurationMilliseconds", @"com.apple.NanoRegistry", &keyExistsAndHasValidFormat)/ 1000.0;
    if (!keyExistsAndHasValidFormat) {
      double v8 = 1.0;
    }
    v7->_double connectPersistenceTimerDuration = v8;
    v9 = sub_1000A3BC0();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v11 = sub_1000A3BC0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(NSUUID *)v7->_uuid UUIDString];
        double connectPersistenceTimerDuration = v7->_connectPersistenceTimerDuration;
        *(_DWORD *)buf = 134218498;
        v17 = v7;
        __int16 v18 = 2112;
        v19 = v12;
        __int16 v20 = 2048;
        double v21 = connectPersistenceTimerDuration;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "EPPeripheralConnectorManager[%p]: Managing BT peripheral %@ connect persistence timer %1.2f", buf, 0x20u);
      }
    }
  }

  return v7;
}

+ (Class)resourceClass
{
  return (Class)objc_opt_class();
}

- (void)setPeripheralConnectorShouldForceDisconnect
{
  self->_forceDisconnect = 1;
}

- (void)peripheralWasInvalidated
{
  self->_state = 0;
  v3 = +[EPFactory queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009357C;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)createResource
{
  [(EPPeripheralConnectorManager *)self clearConnectPersistenceTimer];
  v3.receiver = self;
  v3.super_class = (Class)EPPeripheralConnectorManager;
  [(EPResourceManager *)&v3 createResource];
  [(EPPeripheralConnectorManager *)self update];
}

- (void)destroyResource
{
  [(EPPeripheralConnectorManager *)self setConnectPersistenceTimer];
  v3.receiver = self;
  v3.super_class = (Class)EPPeripheralConnectorManager;
  [(EPResourceManager *)&v3 destroyResource];
  [(EPPeripheralConnectorManager *)self update];
}

- (BOOL)needsResourceWithExpiry
{
  return [(EPResourceManager *)self needsResource] || self->_connectPersistenceTimer != 0;
}

- (void)setConnectPersistenceTimer
{
  BOOL forceDisconnect = self->_forceDisconnect;
  v4 = sub_1000A3BC0();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (forceDisconnect)
  {
    if (v5)
    {
      v6 = sub_1000A3BC0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        __int16 v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "EPPeripheralConnectorManager[%p]: No more demand for connection. _forceDisconnect set. Skipping setting timer.", buf, 0xCu);
      }
    }
    [(EPPeripheralConnectorManager *)self clearConnectPersistenceTimer];
    v7 = +[EPFactory queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100093910;
    block[3] = &unk_1001655F8;
    block[4] = self;
    dispatch_async(v7, block);
  }
  else
  {
    if (v5)
    {
      double v8 = sub_1000A3BC0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        double connectPersistenceTimerDuration = self->_connectPersistenceTimerDuration;
        *(_DWORD *)buf = 134218240;
        __int16 v18 = self;
        __int16 v19 = 2048;
        double v20 = connectPersistenceTimerDuration;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "EPPeripheralConnectorManager[%p]: No more demand for connection. Starting connection persistence timer %1.0f seconds.", buf, 0x16u);
      }
    }
    [(EPPeripheralConnectorManager *)self clearConnectPersistenceTimer];
    BOOL v10 = +[EPFactory queue];
    v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v10);

    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(self->_connectPersistenceTimerDuration * 1000000000.0));
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100093918;
    v15[3] = &unk_1001655F8;
    v15[4] = self;
    dispatch_source_set_event_handler(v11, v15);
    dispatch_resume(v11);
    connectPersistenceTimer = self->_connectPersistenceTimer;
    self->_connectPersistenceTimer = (OS_dispatch_source *)v11;
    v14 = v11;
  }
}

- (void)clearConnectPersistenceTimer
{
  if (self->_connectPersistenceTimer)
  {
    objc_super v3 = sub_1000A3BC0();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      BOOL v5 = sub_1000A3BC0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        double v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPPeripheralConnectorManager[%p]: Clearing persistence timer!", (uint8_t *)&v7, 0xCu);
      }
    }
    dispatch_source_cancel((dispatch_source_t)self->_connectPersistenceTimer);
    connectPersistenceTimer = self->_connectPersistenceTimer;
    self->_connectPersistenceTimer = 0;
  }
}

+ (id)stringForEPPeripheralConnectorState:(unint64_t)a3
{
  if (a3 > 3) {
    return @"EPPeripheralConnectorState unknown";
  }
  else {
    return *(&off_100168580 + a3);
  }
}

- (void)update
{
  objc_super v3 = [(id)objc_opt_class() stringForEPPeripheralConnectorState:self->_state];
  BOOL v4 = sub_1000A3BC0();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    v6 = sub_1000A3BC0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      captivePeripheral = self->_captivePeripheral;
      double v8 = +[EPCentralManagerManager stringForCBPeripheralState:[(CBPeripheral *)captivePeripheral state]];
      unsigned int v9 = [(EPResourceManager *)self needsResource];
      connectPersistenceTimer = self->_connectPersistenceTimer;
      v11 = "NO";
      *(_DWORD *)buf = 134219266;
      v62 = self;
      if (v9) {
        v11 = "YES";
      }
      __int16 v63 = 2112;
      v64 = v3;
      BOOL v12 = connectPersistenceTimer == 0;
      __int16 v65 = 2048;
      v13 = "NOT SET";
      v66 = captivePeripheral;
      if (!v12) {
        v13 = "RUNNING";
      }
      __int16 v67 = 2112;
      v68 = v8;
      __int16 v69 = 2080;
      v70 = v11;
      __int16 v71 = 2080;
      v72 = v13;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "EPPeripheralConnectorManager[%p]: state machine state: %@ peripheral[%p] CBPeripheralState: %@ connectionNeeded: %s connectionTimer: %s", buf, 0x3Eu);
    }
  }
  unint64_t state = self->_state;
  switch(state)
  {
    case 0uLL:
      unsigned int v15 = [(EPPeripheralConnectorManager *)self needsResourceWithExpiry];
      v16 = self->_captivePeripheral;
      if (v15)
      {
        self->_captivePeripheral = 0;

        objc_storeStrong((id *)&self->me, self);
        if (!self->_discoverer)
        {
          v17 = +[EPFactory sharedFactory];
          [v17 setDiscovererShouldScanForProximity:0];

          __int16 v18 = +[EPFactory sharedFactory];
          __int16 v19 = (EPDiscoverer *)[v18 newDiscovererWithDelegate:self];
          discoverer = self->_discoverer;
          self->_discoverer = v19;
        }
        central = self->_central;
        if (!central)
        {
          v22 = +[EPFactory sharedFactory];
          v23 = [v22 agentManager];
          v24 = (EPCentralManager *)[v23 newCentralManagerWithDelegate:self];
          v25 = self->_central;
          self->_central = v24;

          central = self->_central;
        }
        if ((id)[(EPResource *)central availability] == (id)1)
        {
          self->_unint64_t state = 1;
          v26 = +[EPFactory queue];
          v27 = v26;
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472;
          v60[2] = sub_1000944F4;
          v60[3] = &unk_1001655F8;
          v60[4] = self;
          v28 = v60;
          goto LABEL_37;
        }
      }
      else
      {
        if ((id)[(CBPeripheral *)v16 state] == (id)2
          || (id)[(CBPeripheral *)self->_captivePeripheral state] == (id)1)
        {
          [(EPPeripheralConnectorManager *)self cancelPeripheralConnection:self->_captivePeripheral];
        }
        [(EPResourceManager *)self setAvailability:0 withError:0];
        v38 = self->_central;
        self->_central = 0;

        v39 = self->_discoverer;
        self->_discoverer = 0;

        v40 = self->_captivePeripheral;
        self->_captivePeripheral = 0;

        me = self->me;
        self->me = 0;
      }
      goto LABEL_39;
    case 1uLL:
      [(EPResourceManager *)self setAvailability:0 withError:0];
      if ((id)[(EPResource *)self->_central availability] != (id)1
        || ![(EPPeripheralConnectorManager *)self needsResourceWithExpiry])
      {
        self->_unint64_t state = 0;
        v26 = +[EPFactory queue];
        v27 = v26;
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_1000944FC;
        v59[3] = &unk_1001655F8;
        v59[4] = self;
        v28 = v59;
        goto LABEL_37;
      }
      v29 = [(EPDiscoverer *)self->_discoverer devices];
      v27 = [v29 objectForKeyedSubscript:self->_uuid];

      if (v27)
      {
        v30 = [v27 peer];
        v31 = self->_captivePeripheral;
        self->_captivePeripheral = v30;

        v32 = self->_discoverer;
        self->_discoverer = 0;
      }
      if (self->_captivePeripheral && (id)[(EPResource *)self->_central availability] == (id)1)
      {
        v47 = sub_1000A3BC0();
        BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

        if (v48)
        {
          v49 = sub_1000A3BC0();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            v53 = [(CBPeripheral *)self->_captivePeripheral identifier];
            v50 = [v53 UUIDString];
            *(_DWORD *)buf = 134218242;
            v62 = self;
            __int16 v63 = 2112;
            v64 = v50;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "EPPeripheralConnectorManager[%p]: Calling CoreBluetooth CBCentralManager connectPeripheral:options: %@", buf, 0x16u);
          }
        }
        v51 = [(EPCentralManager *)self->_central manager];
        [v51 connectPeripheral:self->_captivePeripheral options:0];

        self->_unint64_t state = 2;
        v52 = +[EPFactory queue];
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_100094504;
        v58[3] = &unk_1001655F8;
        v58[4] = self;
        dispatch_async(v52, v58);
      }
      goto LABEL_38;
    case 2uLL:
      [(EPResourceManager *)self setAvailability:0 withError:0];
      if ([(EPPeripheralConnectorManager *)self needsResourceWithExpiry]
        && (id)[(EPResource *)self->_central availability] == (id)1
        && [(CBPeripheral *)self->_captivePeripheral state])
      {
        if ((id)[(CBPeripheral *)self->_captivePeripheral state] != (id)2) {
          goto LABEL_39;
        }
        v33 = sub_1000A3BC0();
        BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

        if (v34)
        {
          v35 = sub_1000A3BC0();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = [(CBPeripheral *)self->_captivePeripheral identifier];
            v37 = [v36 UUIDString];
            *(_DWORD *)buf = 134218242;
            v62 = self;
            __int16 v63 = 2112;
            v64 = v37;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "EPPeripheralConnectorManager[%p]: peripheral %@ has become connected", buf, 0x16u);
          }
        }
        self->_unint64_t state = 3;
        v26 = +[EPFactory queue];
        v27 = v26;
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_100094514;
        v56[3] = &unk_1001655F8;
        v56[4] = self;
        v28 = v56;
      }
      else
      {
        self->_unint64_t state = 0;
        v26 = +[EPFactory queue];
        v27 = v26;
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_10009450C;
        v57[3] = &unk_1001655F8;
        v57[4] = self;
        v28 = v57;
      }
      goto LABEL_37;
    case 3uLL:
      if ([(EPPeripheralConnectorManager *)self needsResourceWithExpiry]
        && (id)[(EPResource *)self->_central availability] == (id)1)
      {
        if ((id)[(CBPeripheral *)self->_captivePeripheral state] == (id)2)
        {
          [(EPResourceManager *)self setAvailability:1 withError:0];
          goto LABEL_39;
        }
        v42 = sub_1000A3BC0();
        BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);

        if (v43)
        {
          v44 = sub_1000A3BC0();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            v45 = [(CBPeripheral *)self->_captivePeripheral identifier];
            v46 = [v45 UUIDString];
            *(_DWORD *)buf = 134218242;
            v62 = self;
            __int16 v63 = 2112;
            v64 = v46;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "EPPeripheralConnectorManager[%p]: peripheral %@ has become disconnected", buf, 0x16u);
          }
        }
        [(EPResourceManager *)self setAvailability:0 withError:0];
        self->_unint64_t state = 0;
        v26 = +[EPFactory queue];
        v27 = v26;
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472;
        v54[2] = sub_100094524;
        v54[3] = &unk_1001655F8;
        v54[4] = self;
        v28 = v54;
      }
      else
      {
        self->_unint64_t state = 0;
        v26 = +[EPFactory queue];
        v27 = v26;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10009451C;
        block[3] = &unk_1001655F8;
        block[4] = self;
        v28 = block;
      }
LABEL_37:
      dispatch_async(v26, v28);
LABEL_38:

LABEL_39:
      self->_lastState = state;

      return;
    default:
      goto LABEL_39;
  }
}

- (BOOL)isConnected
{
  return self->_lastState == 3;
}

- (void)cancelPeripheralConnection:(id)a3
{
  id v4 = a3;
  if ((id)[(EPResource *)self->_central availability] == (id)1)
  {
    BOOL v5 = sub_1000A3BC0();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      int v7 = sub_1000A3BC0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_forceDisconnect) {
          CFStringRef v8 = @"YES";
        }
        else {
          CFStringRef v8 = @"NO";
        }
        *(_DWORD *)buf = 134218242;
        unsigned int v15 = self;
        __int16 v16 = 2112;
        CFStringRef v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPPeripheralConnectorManager[%p]: Calling CoreBluetooth CBCentralManager cancelPeripheralConnection:force:%@", buf, 0x16u);
      }
    }
    unsigned int v9 = [(EPCentralManager *)self->_central manager];
    BOOL v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_forceDisconnect, CBCancelPeripheralConnectionOptionForce);
    v13 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v9 cancelPeripheralConnection:v4 options:v11];
  }
  self->_BOOL forceDisconnect = 0;
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  BOOL v5 = [a4 identifier:a3];
  unsigned int v6 = [v5 isEqual:self->_uuid];

  if (v6)
  {
    int v7 = sub_1000A3BC0();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      unsigned int v9 = sub_1000A3BC0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = [(NSUUID *)self->_uuid UUIDString];
        int v11 = 134218242;
        uint64_t v12 = self;
        __int16 v13 = 2112;
        v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "EPPeripheralConnectorManager[%p]: received centralManager:didConnectPeripheral: for peripheral %@", (uint8_t *)&v11, 0x16u);
      }
    }
    [(EPPeripheralConnectorManager *)self update];
  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  unsigned int v6 = [a4 identifier:a3];
  unsigned int v7 = [v6 isEqual:self->_uuid];

  if (v7)
  {
    BOOL v8 = sub_1000A3BC0();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      BOOL v10 = sub_1000A3BC0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = [(NSUUID *)self->_uuid UUIDString];
        int v12 = 134218242;
        __int16 v13 = self;
        __int16 v14 = 2112;
        unsigned int v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "EPPeripheralConnectorManager[%p]: received centralManager:didDisconnectPeripheral: for peripheral %@", (uint8_t *)&v12, 0x16u);
      }
    }
    [(EPPeripheralConnectorManager *)self update];
  }
}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  BOOL v5 = [a4 identifier:a3];
  unsigned int v6 = [v5 isEqual:self->_uuid];

  if (v6)
  {
    unsigned int v7 = sub_1000A3BC0();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      BOOL v9 = sub_1000A3BC0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = [(NSUUID *)self->_uuid UUIDString];
        int v11 = 134218242;
        int v12 = self;
        __int16 v13 = 2112;
        __int16 v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "EPPeripheralConnectorManager[%p]: received centralManager:didUpdatePeripheralConnectionState: for peripheral %@", (uint8_t *)&v11, 0x16u);
      }
    }
    [(EPPeripheralConnectorManager *)self update];
  }
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (EPDiscoverer)discoverer
{
  return self->_discoverer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoverer, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_captivePeripheral, 0);
  objc_storeStrong((id *)&self->_connectPersistenceTimer, 0);
  objc_storeStrong((id *)&self->me, 0);

  objc_storeStrong((id *)&self->_central, 0);
}

@end