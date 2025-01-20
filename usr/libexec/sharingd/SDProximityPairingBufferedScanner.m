@interface SDProximityPairingBufferedScanner
- (BOOL)_btSessionUsable;
- (BOOL)_updateCounterpart:(id)a3;
- (BOOL)isAirPods:(unsigned int)a3;
- (BOOL)pairingUpdatePairedInfo:(id)a3 fields:(id)a4 bleDevice:(id)a5;
- (BOOL)pairingUpdatePairedInfoMB:(id)a3 fields:(id)a4 bleDevice:(id)a5;
- (BOOL)sampleIsTooOld:(id)a3;
- (OS_dispatch_queue)dispatchQueue;
- (SDProximityPairingBufferedScanner)initWithQueue:(id)a3;
- (id)bufferedDeviceFoundHandler;
- (id)invalidationHandler;
- (id)modelWithProductID:(unsigned __int16)a3;
- (id)pairingParsePayload:(id)a3 identifier:(id)a4 bleDevice:(id)a5 peerInfo:(id)a6;
- (int)_btSessionEnsureStarted;
- (unsigned)statusToHeadsetStatus:(unsigned __int8)a3 forProductID:(unsigned __int16)a4;
- (void)_btSessionEnsureStopped;
- (void)_ensureCbDiscoveryStopped;
- (void)_ensureStarted;
- (void)_foundDevice:(id)a3 advertisementData:(id)a4 rssi:(int64_t)a5 fields:(id)a6;
- (void)_invalidate;
- (void)configureCBDiscoveryScreenOffPairing;
- (void)dealloc;
- (void)ensureStarted;
- (void)foundBufferedPairingDevices:(id)a3;
- (void)invalidate;
- (void)pairingParseAccessoryStatusPayloadPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5;
- (void)parseStatus3:(unsigned __int8)a3 productID:(unsigned int)a4 caseLEDColor:(unsigned __int8 *)a5 caseLEDStatus:(char *)a6;
- (void)proxPairingLoggerAndInvalidationHandler:(id)a3 withLogLevel:(unsigned __int8)a4 andError:(id)a5;
- (void)setBufferedDeviceFoundHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)startCBDiscoveryScreenOffPairing;
- (void)turnOffScreenOffScanningIfNoAirPodsOntheAccount;
@end

@implementation SDProximityPairingBufferedScanner

- (BOOL)_btSessionUsable
{
  return 1;
}

- (SDProximityPairingBufferedScanner)initWithQueue:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SDProximityPairingBufferedScanner.m", 181, @"Invalid parameter not satisfying: %@", @"dispatchQueue" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SDProximityPairingBufferedScanner;
  v7 = [(SDProximityPairingBufferedScanner *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_dispatchQueue, a3);
  }

  return v8;
}

- (void)dealloc
{
  if (self->_btSession)
  {
    v8 = (SDProximityPairingBufferedScanner *)FatalErrorF();
    [(SDProximityPairingBufferedScanner *)v8 invalidate];
  }
  else
  {
    [(CBDiscovery *)self->_cbDiscoveryScreenOffPairing invalidate];
    cbDiscoveryScreenOffPairing = self->_cbDiscoveryScreenOffPairing;
    self->_cbDiscoveryScreenOffPairing = 0;

    devices = self->_devices;
    self->_devices = 0;

    id bufferedDeviceFoundHandler = self->_bufferedDeviceFoundHandler;
    self->_id bufferedDeviceFoundHandler = 0;

    dispatchQueue = self->_dispatchQueue;
    if (dispatchQueue)
    {
      self->_dispatchQueue = 0;
    }
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    v10.receiver = self;
    v10.super_class = (Class)SDProximityPairingBufferedScanner;
    [(SDProximityPairingBufferedScanner *)&v10 dealloc];
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BF4C0;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    v3 = sub_1001BF5C4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating\n", buf, 2u);
    }

    self->_invalidateCalled = 1;
    devices = self->_devices;
    self->_devices = 0;

    [(SDProximityPairingBufferedScanner *)self _btSessionEnsureStopped];
    [(SDProximityPairingBufferedScanner *)self _ensureCbDiscoveryStopped];
    v5 = sub_1001BF5C4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidated\n", v8, 2u);
    }

    id bufferedDeviceFoundHandler = self->_bufferedDeviceFoundHandler;
    self->_id bufferedDeviceFoundHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;
  }
}

- (void)ensureStarted
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BF68C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_ensureStarted
{
  if (!self->_cbDiscoveryScreenOffPairing)
  {
    v3 = sub_1001BF5C4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CBDiscoveryScreenOff starting", v4, 2u);
    }

    [(SDProximityPairingBufferedScanner *)self configureCBDiscoveryScreenOffPairing];
    [(SDProximityPairingBufferedScanner *)self startCBDiscoveryScreenOffPairing];
  }
  if ([(SDProximityPairingBufferedScanner *)self _btSessionUsable]) {
    [(SDProximityPairingBufferedScanner *)self _btSessionEnsureStarted];
  }
}

- (void)_ensureCbDiscoveryStopped
{
  cbDiscoveryScreenOffPairing = self->_cbDiscoveryScreenOffPairing;
  if (cbDiscoveryScreenOffPairing)
  {
    [(CBDiscovery *)cbDiscoveryScreenOffPairing invalidate];
    v4 = self->_cbDiscoveryScreenOffPairing;
    self->_cbDiscoveryScreenOffPairing = 0;
  }
}

- (void)turnOffScreenOffScanningIfNoAirPodsOntheAccount
{
  v2 = self;
  [(NSMutableDictionary *)self->_devices removeAllObjects];
  devices = v2->_devices;
  v2->_devices = 0;

  cbDiscoveryScreenOffPairing = v2->_cbDiscoveryScreenOffPairing;
  if (!cbDiscoveryScreenOffPairing) {
    return;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = [(CBDiscovery *)cbDiscoveryScreenOffPairing discoveredDevices];
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    v18 = v2;
    char v19 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        unsigned int v11 = [v10 productID:v18];
        if (v11 - 8194 <= 0x22 && ((1 << (v11 - 2)) & 0x472863101) != 0)
        {
          unsigned int v13 = [v10 productID];
          if (v13 != 8202 && v13 != 8223)
          {
            v15 = sub_1001BF5C4();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CBDiscoveryScreenOff found AirPods on account", buf, 2u);
            }

            char v19 = 1;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);

    v2 = v18;
    if (v19)
    {
      v16 = sub_1001BF5C4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CBDiscoveryScreenOff screen off scan enabled", buf, 2u);
      }

      return;
    }
  }
  else
  {
  }
  v17 = sub_1001BF5C4();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CBDiscoveryScreenOff being invalidated because device has no paired AirPods", buf, 2u);
  }

  [(SDProximityPairingBufferedScanner *)v2 _ensureCbDiscoveryStopped];
}

- (int)_btSessionEnsureStarted
{
  if (self->_btStarted) {
    return 0;
  }
  v3 = sub_1001BF5C4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BTSession attach\n", v10, 2u);
  }

  *(void *)objc_super v10 = sub_1001BFB48;
  v4 = self;
  int v5 = off_100969128((uint64_t)"SDProximityPairingBufferedScanner", (uint64_t)v10, (uint64_t)v4, v4->_dispatchQueue);
  if (v5)
  {
    int v6 = v5;
    CFRelease(v4);
    int v7 = v6 + 310000;
    if (v6 != -310000)
    {
      uint64_t v8 = sub_1001BF5C4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v12 = v6 + 310000;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "### BTSession attach failed: %d\n", buf, 8u);
      }
    }
  }
  else
  {
    int v7 = 0;
    self->_btStarted = 1;
  }
  return v7;
}

- (void)_btSessionEnsureStopped
{
  p_btSession = &self->_btSession;
  if (self->_btSession)
  {
    v4 = sub_1001BF5C4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BTSession detach\n", v5, 2u);
    }

    off_100969130((uint64_t)p_btSession);
    *p_btSession = 0;
  }
  self->_btStarted = 0;
}

- (void)configureCBDiscoveryScreenOffPairing
{
  cbDiscoveryScreenOffPairing = self->_cbDiscoveryScreenOffPairing;
  if (!cbDiscoveryScreenOffPairing)
  {
    v4 = (CBDiscovery *)objc_alloc_init(off_100969120());
    int v5 = self->_cbDiscoveryScreenOffPairing;
    self->_cbDiscoveryScreenOffPairing = v4;

    cbDiscoveryScreenOffPairing = self->_cbDiscoveryScreenOffPairing;
  }
  [(CBDiscovery *)cbDiscoveryScreenOffPairing setDispatchQueue:self->_dispatchQueue];
  id location = 0;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001C0134;
  v12[3] = &unk_1008CF240;
  objc_copyWeak(&v13, &location);
  [(CBDiscovery *)self->_cbDiscoveryScreenOffPairing setDevicesBufferedHandler:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C01AC;
  v10[3] = &unk_1008CA3B0;
  objc_copyWeak(&v11, &location);
  [(CBDiscovery *)self->_cbDiscoveryScreenOffPairing setInvalidationHandler:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C01FC;
  v8[3] = &unk_1008CA3B0;
  objc_copyWeak(&v9, &location);
  [(CBDiscovery *)self->_cbDiscoveryScreenOffPairing setInterruptionHandler:v8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001C024C;
  v6[3] = &unk_1008CE8C0;
  objc_copyWeak(&v7, &location);
  [(CBDiscovery *)self->_cbDiscoveryScreenOffPairing setErrorHandler:v6];
  [(CBDiscovery *)self->_cbDiscoveryScreenOffPairing setDiscoveryFlags:0];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)proxPairingLoggerAndInvalidationHandler:(id)a3 withLogLevel:(unsigned __int8)a4 andError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_super v10 = sub_1001BF5C4();
  if (os_log_type_enabled(v10, (os_log_type_t)a4))
  {
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, (os_log_type_t)a4, "CBDiscoveryScreenOff handler called: %@ with error: %@", (uint8_t *)&v12, 0x16u);
  }

  if (([v8 isEqualToString:@"ActivateWithCompletion Handler"] & 1) == 0)
  {
    id v11 = sub_1001BF5C4();
    if (os_log_type_enabled(v11, (os_log_type_t)a4))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, (os_log_type_t)a4, "CBDiscoveryScreenOff Invalidating failed CBDiscovery object", (uint8_t *)&v12, 2u);
    }

    [(SDProximityPairingBufferedScanner *)self _ensureCbDiscoveryStopped];
  }
}

- (void)startCBDiscoveryScreenOffPairing
{
  if (![(CBDiscovery *)self->_cbDiscoveryScreenOffPairing discoveryFlags])
  {
    [(CBDiscovery *)self->_cbDiscoveryScreenOffPairing setDiscoveryFlags:0x2000000];
    [(CBDiscovery *)self->_cbDiscoveryScreenOffPairing setDiscoveryFlags:(unint64_t)[(CBDiscovery *)self->_cbDiscoveryScreenOffPairing discoveryFlags] | 0x800000];
  }
  [(CBDiscovery *)self->_cbDiscoveryScreenOffPairing removeAllDiscoveryTypes];
  [(CBDiscovery *)self->_cbDiscoveryScreenOffPairing addDiscoveryType:29];
  [(CBDiscovery *)self->_cbDiscoveryScreenOffPairing setBleScanRate:20];
  [(CBDiscovery *)self->_cbDiscoveryScreenOffPairing setBleScanRateScreenOff:20];
  [(CBDiscovery *)self->_cbDiscoveryScreenOffPairing setLabel:@"Prox Pairing Screen Off Buffered Samples"];
  v3 = sub_1001BF5C4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Going to Activate scanner", buf, 2u);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  cbDiscoveryScreenOffPairing = self->_cbDiscoveryScreenOffPairing;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001C0574;
  v5[3] = &unk_1008CE8C0;
  objc_copyWeak(&v6, (id *)buf);
  [(CBDiscovery *)cbDiscoveryScreenOffPairing activateWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (BOOL)isAirPods:(unsigned int)a3
{
  return (a3 - 8194 < 0x23) & (0x452863001uLL >> (a3 - 2));
}

- (BOOL)sampleIsTooOld:(id)a3
{
  id v3 = a3;
  double v4 = (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0;
  id v5 = [v3 bleAdvertisementTimestampMachContinuous];

  return (double)(unint64_t)v5 / 1000000.0 < v4 + -5.0;
}

- (void)foundBufferedPairingDevices:(id)a3
{
  id v4 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v37;
    uint64_t v33 = WPPairingKeyDeviceAddress;
    uint64_t v32 = WPPairingKeyAdvertisingChannel;
    *(void *)&long long v6 = 138412290;
    long long v30 = v6;
    id v9 = &NSCalendarIdentifierGregorian_ptr;
    id v31 = v4;
    uint64_t v34 = *(void *)v37;
    do
    {
      objc_super v10 = 0;
      id v35 = v7;
      do
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v10);
        if (((unint64_t)objc_msgSend(v11, "discoveryFlags", v30) & 0x1C080) != 0
          && -[SDProximityPairingBufferedScanner isAirPods:](self, "isAirPods:", [v11 productID])
          && ![(SDProximityPairingBufferedScanner *)self sampleIsTooOld:v11])
        {
          int v12 = sub_1001BF5C4();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v30;
            v41 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "CBDiscoveryScreenOff handling buffered device: %@", buf, 0xCu);
          }

          id v13 = sub_1001BF5C4();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            __int16 v14 = [v11 identifier];
            id v15 = [v11 bleAppleManufacturerData];
            *(_DWORD *)buf = 138412546;
            v41 = v14;
            __int16 v42 = 2112;
            id v43 = v15;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "CBDiscoveryScreenOff handling buffered device: %@ with Apple payload: <%@>", buf, 0x16u);
          }
          id v16 = objc_alloc((Class)NSUUID);
          v17 = [v11 identifier];
          id v18 = [v16 initWithUUIDString:v17];

          id v19 = objc_alloc_init((Class)NSMutableDictionary);
          v20 = [v11 btAddressData];
          [v19 setObject:v20 forKeyedSubscript:v33];

          long long v21 = -[NSCalendarIdentifier numberWithInt:]((id)v9[214], "numberWithInt:", [v11 bleChannel]);
          [v19 setObject:v21 forKeyedSubscript:v32];

          long long v22 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v18];
          long long v23 = [v11 bleAppleManufacturerData];
          long long v24 = [(SDProximityPairingBufferedScanner *)self pairingParsePayload:v23 identifier:v18 bleDevice:v22 peerInfo:v19];

          if (v24)
          {
            v25 = -[NSCalendarIdentifier numberWithDouble:]((id)v9[214], "numberWithDouble:", (double)(unint64_t)[v11 bleAdvertisementTimestampMachContinuous] / 1000000.0);
            [v24 setObject:v25 forKeyedSubscript:@"sampleTimestamp"];

            v26 = -[NSCalendarIdentifier numberWithInt:]((id)v9[214], "numberWithInt:", [v11 bleChannel]);
            if (v26) {
              [v24 setObject:v26 forKeyedSubscript:@"ch"];
            }
            uint64_t v27 = (int)[v11 bleRSSI];
            v28 = [v11 bleAppleManufacturerData];
            [(SDProximityPairingBufferedScanner *)self _foundDevice:v18 advertisementData:v28 rssi:v27 fields:v24];

            id v4 = v31;
          }
          else
          {
            v26 = sub_1001BF5C4();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              v29 = [v11 bleAppleManufacturerData];
              *(_DWORD *)buf = 138412546;
              v41 = v29;
              __int16 v42 = 2112;
              id v43 = v18;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "pairingParsePayload failed to parse Pairing payload: <%@> for device: %@", buf, 0x16u);
            }
          }

          uint64_t v8 = v34;
          id v7 = v35;
          id v9 = &NSCalendarIdentifierGregorian_ptr;
        }
        objc_super v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [v4 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v7);
  }
}

- (unsigned)statusToHeadsetStatus:(unsigned __int8)a3 forProductID:(unsigned __int16)a4
{
  unsigned int v4 = a3;
  id v5 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:a4];
  id v6 = +[SFHeadphoneProduct airPodsMax];

  if (v5 == v6)
  {
    unsigned int v13 = (v4 >> 5) & 3;
    if (v13 == 3) {
      int v12 = 8;
    }
    else {
      int v12 = dword_10076E478[v13];
    }
  }
  else
  {
    int v7 = v4 & 1;
    int v8 = (v4 >> 1) & 3;
    if (v8 == 1) {
      int v7 = v4 & 1 | 4;
    }
    if (v8 == 2) {
      int v7 = v4 & 1 | 2;
    }
    if (v8 == 3) {
      int v7 = v4 & 1 | 8;
    }
    int v9 = (v4 >> 3) & 3;
    int v10 = v7 | 0x40;
    int v11 = v7 | 0x10;
    if (v9 == 1) {
      v7 |= 0x20u;
    }
    if (v9 == 2) {
      int v7 = v11;
    }
    if (v9 == 3) {
      int v7 = v10;
    }
    int v12 = (4 * v4) & 0x180 ^ 0x100 | v7;
  }
  if ((v4 & 0x80u) == 0) {
    unsigned int v14 = v12;
  }
  else {
    unsigned int v14 = v12 | 0x200;
  }

  return v14;
}

- (id)modelWithProductID:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:a3];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 bluetoothModel];
LABEL_3:
    int v7 = (__CFString *)v6;
    goto LABEL_4;
  }
  if ((int)v3 <= 788)
  {
    switch(v3)
    {
      case 0x266:
        int v7 = @"ATVRemote1,1";
        break;
      case 0x26D:
        int v7 = @"ATVRemote1,2";
        break;
      case 0x314:
        int v7 = @"ATVRemote1,3";
        break;
      default:
LABEL_19:
        uint64_t v6 = +[NSString stringWithFormat:@"Device1,%u", v3];
        goto LABEL_3;
    }
  }
  else
  {
    int v7 = @"AirPods1,1";
    switch((int)v3)
    {
      case 8194:
        break;
      case 8195:
        int v7 = @"PowerBeats3,1";
        break;
      case 8196:
      case 8199:
      case 8200:
      case 8209:
      case 8210:
      case 8211:
      case 8212:
      case 8213:
      case 8214:
      case 8216:
      case 8217:
      case 8219:
      case 8220:
      case 8221:
      case 8222:
      case 8223:
      case 8224:
      case 8225:
      case 8226:
      case 8227:
      case 8228:
        goto LABEL_19;
      case 8197:
        int v7 = @"BeatsX1,1";
        break;
      case 8198:
        int v7 = @"BeatsSolo3,1";
        break;
      case 8201:
        int v7 = @"BeatsStudio3,2";
        break;
      case 8202:
        int v7 = @"Device1,8202";
        break;
      case 8203:
        int v7 = @"PowerbeatsPro1,1";
        break;
      case 8204:
        int v7 = @"BeatsSoloPro1,1";
        break;
      case 8205:
        int v7 = @"Powerbeats4,1";
        break;
      case 8206:
        int v7 = @"AirPodsPro1,1";
        break;
      case 8207:
        int v7 = @"AirPods1,3";
        break;
      case 8208:
        int v7 = @"Device1,8208";
        break;
      case 8215:
        int v7 = @"BeatsStudioPro1,1";
        break;
      case 8218:
        int v7 = @"Device1,8218";
        break;
      case 8229:
        int v7 = @"Device1,8229";
        break;
      default:
        if (v3 == 789)
        {
          int v7 = @"ATVRemote1,4";
        }
        else
        {
          if (v3 != 21760) {
            goto LABEL_19;
          }
          int v7 = @"Device1,21760";
        }
        break;
    }
  }
LABEL_4:

  return v7;
}

- (void)parseStatus3:(unsigned __int8)a3 productID:(unsigned int)a4 caseLEDColor:(unsigned __int8 *)a5 caseLEDStatus:(char *)a6
{
  uint64_t v8 = *(void *)&a4;
  unsigned int v9 = a3;
  if (a4 == 8203) {
    goto LABEL_2;
  }
  int v11 = +[SFHeadphoneProduct b507];
  if ([v11 productID] == v8) {
    goto LABEL_6;
  }
  int v12 = +[SFHeadphoneProduct b494];
  if ([v12 productID] == v8)
  {

LABEL_6:
    BOOL v10 = 1;
    goto LABEL_7;
  }
  id v18 = +[SFHeadphoneProduct b607];
  unsigned int v19 = [v18 productID];

  if (v19 == v8
    || (+[SFHeadphoneProduct b463],
        v20 = objc_claimAutoreleasedReturnValue(),
        unsigned int v21 = [v20 productID],
        v20,
        v21 == v8))
  {
LABEL_2:
    BOOL v10 = 1;
    goto LABEL_8;
  }
  int v11 = +[SFHeadphoneProduct b498];
  BOOL v10 = [v11 productID] == v8;
LABEL_7:

LABEL_8:
  id v13 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:v8];
  if (v10)
  {
    int v14 = (v9 >> 4) & 3;
    if (v14 == 2) {
      char v15 = 1;
    }
    else {
      char v15 = 2 * (v14 != 1);
    }
    if (v9 >= 0x40) {
      unsigned __int8 v16 = 4 * ((v9 & 0xC0) == 64);
    }
    else {
      unsigned __int8 v16 = 3;
    }
  }
  else
  {
    id v22 = v13;
    id v17 = +[SFHeadphoneProduct airPodsMax];

    id v13 = v22;
    unsigned __int8 v16 = (v9 >> 5) & 3;
    if (v22 == v17) {
      char v15 = (v9 & 0x10) != 0;
    }
    else {
      char v15 = v9 >> 7;
    }
  }
  *a5 = v16;
  *a6 = v15;
}

- (BOOL)pairingUpdatePairedInfoMB:(id)a3 fields:(id)a4 bleDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = (unint64_t)[v10 paired];
  if (!v10 || (double Current = CFAbsoluteTimeGetCurrent(), [v10 pairCheckTime], Current - v13 > 1.0))
  {
    if (self->_btSession)
    {
      v52[0] = 0;
      v52[1] = 0;
      uint64_t v36 = 0;
      [v8 getUUIDBytes:v52];
      int v14 = off_100969138((uint64_t)self->_btSession, (uint64_t)v52, (uint64_t)&v36);
      BOOL v15 = v14 == 0;
      if (!v14)
      {
        memset(v51, 0, sizeof(v51));
        long long v50 = 0u;
        long long v49 = 0u;
        long long v48 = 0u;
        long long v47 = 0u;
        long long v46 = 0u;
        long long v45 = 0u;
        long long v44 = 0u;
        long long v43 = 0u;
        long long v42 = 0u;
        long long v41 = 0u;
        long long v40 = 0u;
        long long v39 = 0u;
        memset(v37, 0, sizeof(v37));
        __int16 v34 = 0;
        int v33 = 0;
        memset(buf, 0, sizeof(buf));
        if (!off_100969140(v36, (uint64_t)buf, 248) && buf[0])
        {
          unsigned __int8 v16 = +[NSString stringWithUTF8String:buf];
          [v9 setObject:v16 forKeyedSubscript:@"name"];
        }
        int v35 = 0;
        if (off_100969148(v36, (uint64_t)&v35)) {
          unint64_t v11 = v11;
        }
        else {
          unint64_t v11 = v35 != 0;
        }
        id v17 = +[NSNumber numberWithBool:v11];
        [v9 setObject:v17 forKeyedSubscript:@"paired"];

        int v32 = 0;
        off_100969150(v36, (uint64_t)&v32);
        [v10 setTempPaired:v32 != 0];
        int v31 = 0;
        if (off_100969158(v36, (uint64_t)&v31))
        {
          int v31 = 0;
        }
        else if (v31)
        {
          unsigned int v19 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
          [v9 setObject:v19 forKeyedSubscript:@"CnSv"];
        }
        v20 = [v10 bluetoothAddress];
        if (v20)
        {
          [v9 setObject:v20 forKeyedSubscript:@"publicAddress"];
        }
        else
        {
          LOBYTE(v37[0]) = 0;
          if (!off_100969160(v36, (uint64_t)v37, 32)
            && LOBYTE(v37[0])
            && !off_100969168((uint64_t)v37, (uint64_t)&v33))
          {
            long long v30 = +[NSData dataWithBytes:&v33 length:6];
            [v9 setObject:v30 forKeyedSubscript:@"publicAddress"];
          }
        }
      }
      unsigned int v21 = sub_1001BF5C4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = [v9 objectForKeyedSubscript:@"name"];
        long long v23 = (void *)v22;
        long long v24 = "yes";
        *(void *)&uint8_t buf[4] = v52;
        *(_DWORD *)buf = 136315650;
        if (!v11) {
          long long v24 = "no";
        }
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        *(_WORD *)&buf[22] = 2080;
        *(void *)&buf[24] = v24;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Updated paired info for %s: Name '%@', Paired %s\n", buf, 0x20u);
      }
      unint64_t v11 = v11 != 0;
      if (v10) {
LABEL_29:
      }
        [v10 setPairCheckTime:CFAbsoluteTimeGetCurrent()];
    }
    else
    {
      if (self->_btStarted)
      {
        id v18 = sub_1001BF5C4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v8;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "### No BTSession to look up device %@\n", buf, 0xCu);
        }
      }
      BOOL v15 = 0;
      if (v10) {
        goto LABEL_29;
      }
    }
    if (v15) {
      goto LABEL_38;
    }
  }
  v25 = [v10 bluetoothAddress];
  if (v25) {
    [v9 setObject:v25 forKeyedSubscript:@"publicAddress"];
  }
  if ([v10 connectedServices])
  {
    v26 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v10 connectedServices]);
    [v9 setObject:v26 forKeyedSubscript:@"CnSv"];
  }
  uint64_t v27 = [v10 name];

  if (v27) {
    [v9 setObject:v27 forKeyedSubscript:@"name"];
  }
  v28 = +[NSNumber numberWithBool:v11];
  [v9 setObject:v28 forKeyedSubscript:@"paired"];

LABEL_38:
  return v11;
}

- (BOOL)pairingUpdatePairedInfo:(id)a3 fields:(id)a4 bleDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(SDProximityPairingBufferedScanner *)self _btSessionUsable]) {
    BOOL v11 = [(SDProximityPairingBufferedScanner *)self pairingUpdatePairedInfoMB:v8 fields:v9 bleDevice:v10];
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)pairingParseAccessoryStatusPayloadPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5
{
  id v7 = a5;
  if (a4 - a3 < 1) {
    goto LABEL_10;
  }
  char v9 = *a3;
  id v8 = a3 + 1;
  id v10 = +[NSNumber numberWithInt:v9 & 7];
  [v7 setObject:v10 forKeyedSubscript:@"locP"];

  BOOL v11 = (v9 & 4) != 0 ? &__kCFBooleanTrue : &__kCFBooleanFalse;
  [v7 setObject:v11 forKeyedSubscript:@"lc"];
  if (a4 - v8 < 1)
  {
LABEL_10:
    LOBYTE(v12) = 0;
    goto LABEL_11;
  }
  int v12 = *(unsigned __int8 *)v8;
  if (v12 != 254)
  {
    if (v12 == 255) {
      goto LABEL_20;
    }
    if ((v12 & 0x80) != 0)
    {
      uint64_t v13 = 2;
LABEL_12:
      int v14 = v12 & 0x7F;
      if (v14 >= 0x64) {
        int v14 = 100;
      }
      double v15 = (double)v14 / 100.0;
      goto LABEL_15;
    }
LABEL_11:
    uint64_t v13 = 1;
    goto LABEL_12;
  }
  double v15 = 0.8;
  uint64_t v13 = 2;
LABEL_15:
  id v16 = objc_alloc_init((Class)SFBatteryInfo);
  id v17 = v16;
  double v18 = 1.0;
  if (v15 <= 1.0) {
    double v18 = v15;
  }
  if (v18 < 0.0001) {
    double v18 = 0.0001;
  }
  [v16 setBatteryLevel:v18];
  [v17 setBatteryState:v13];
  [v17 setBatteryType:1];
  v20 = v17;
  unsigned int v19 = +[NSArray arrayWithObjects:&v20 count:1];
  [v7 setObject:v19 forKeyedSubscript:@"batteryInfo"];

LABEL_20:
}

- (id)pairingParsePayload:(id)a3 identifier:(id)a4 bleDevice:(id)a5 peerInfo:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  int v14 = (unsigned __int8 *)[v13 bytes];
  unint64_t v15 = (unint64_t)[v13 length];

  id v16 = objc_alloc_init((Class)NSMutableDictionary);
  id v17 = v16;
  if ((uint64_t)v15 < 7)
  {
    id v287 = 0;
    id v26 = 0;
    goto LABEL_352;
  }
  v288 = v16;
  uint64_t v18 = v14[4];
  uint64_t v19 = *(unsigned __int16 *)(v14 + 5);
  unsigned int v286 = 1;
  BOOL v20 = (v19 - 8194) > 0xD || ((1 << (v19 - 2)) & 0x3001) == 0;
  if (v20)
  {
    id v34 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:v19];
    [v34 isAirPods];

    if (v19 == 8203)
    {
      unsigned int v286 = 1;
    }
    else
    {
      id v35 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:v19];
      unsigned int v286 = [v35 hasSplitBattery];
    }
  }
  id v287 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:v19];
  unsigned int v21 = +[NSNumber numberWithUnsignedChar:v18];
  [v288 setObject:v21 forKeyedSubscript:@"subType"];

  if (!v18 && v15 == 14)
  {
    uint64_t v22 = +[NSNumber numberWithUnsignedInt:[(SDProximityPairingBufferedScanner *)self statusToHeadsetStatus:v14[7] forProductID:v19]];
    [v288 setObject:v22 forKeyedSubscript:@"hsStatus"];

    long long v23 = [(SDProximityPairingBufferedScanner *)self modelWithProductID:v19];
    [v288 setObject:v23 forKeyedSubscript:@"model"];

    long long v24 = +[NSNumber numberWithUnsignedShort:v19];
    [v288 setObject:v24 forKeyedSubscript:@"pid"];

    v25 = +[NSData dataWithBytes:v14 + 8 length:6];
    [v288 setObject:v25 forKeyedSubscript:@"publicAddress"];

    [v288 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ns"];
    id v17 = v288;
LABEL_351:
    id v26 = v17;
    goto LABEL_352;
  }
  id v26 = 0;
  uint64_t v27 = &v14[v15];
  v28 = (char *)(v14 + 7);
  id v17 = v288;
  switch((int)v18)
  {
    case 0:
    case 7:
      id v278 = v10;
      v285 = self;
      if (v18)
      {
        if (v15 < 0xD) {
          goto LABEL_354;
        }
        v257 = 0;
        unsigned int v268 = v14[7];
        int v29 = v14[8];
        int v265 = v14[9];
        int v30 = v14[10];
        int v31 = v14 + 12;
        unsigned int v275 = v14[11];
        if (v18 == 7)
        {
          int v32 = 0;
          uint64_t v33 = 0;
          goto LABEL_41;
        }
        uint64_t v72 = 7;
      }
      else
      {
        v257 = (char *)(v14 + 7);
        if (v15 < 0x13) {
          goto LABEL_354;
        }
        unsigned int v268 = v14[13];
        int v29 = v14[14];
        int v265 = v14[15];
        int v30 = v14[16];
        int v31 = v14 + 18;
        uint64_t v72 = 13;
        unsigned int v275 = v14[17];
      }
      v73 = &v14[v72];
      uint64_t v33 = *v31;
      int v31 = v73 + 6;
      int v32 = 1;
LABEL_41:
      id v281 = v12;
      v283 = v11;
      if (v19 == 8203)
      {
        unsigned int v74 = 1;
      }
      else
      {
        v75 = v27;
        int v76 = v29;
        int v77 = v30;
        v78 = v31;
        id v79 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:v19];
        unsigned int v74 = [v79 hasSplitCaseColors];

        int v31 = v78;
        int v30 = v77;
        int v29 = v76;
        uint64_t v27 = v75;
      }
      v274 = v27;
      if ((v32 & v74) == 1)
      {
        id v10 = v278;
        if (v27 - v31 < 1)
        {
          v260 = v31;
          unsigned int v80 = 0;
        }
        else
        {
          unsigned int v80 = *v31;
          v260 = v31 + 1;
        }
        uint64_t v96 = v33 >> 4;
        uint64_t v97 = v80 >> 5;
        v98 = +[NSNumber numberWithUnsignedChar:v33 & 0xF];
        [v288 setObject:v98 forKeyedSubscript:@"cc"];

        v99 = +[NSNumber numberWithUnsignedChar:v96];
        [v288 setObject:v99 forKeyedSubscript:@"ccR"];

        uint64_t v100 = +[NSNumber numberWithUnsignedChar:v97];
        [v288 setObject:v100 forKeyedSubscript:@"ccC"];
      }
      else
      {
        v260 = v31;
        id v81 = +[SFHeadphoneProduct airPodsMax];

        id v10 = v278;
        if (v287 == v81) {
          +[NSNumber numberWithInt:v33 & 0x1F];
        }
        else {
        uint64_t v100 = +[NSNumber numberWithUnsignedChar:v33];
        }
        [v288 setObject:v100 forKeyedSubscript:@"cc"];
      }

      LODWORD(v100) = [(SDProximityPairingBufferedScanner *)v285 statusToHeadsetStatus:v268 forProductID:v19];
      double v101 = 0.0;
      if (v29 == 255)
      {
        *(void *)&long long v264 = 0;
        double v103 = 0.0;
      }
      else
      {
        unsigned int v102 = v29 & 0x7F;
        if (v102 >= 0x64) {
          unsigned int v102 = 100;
        }
        double v103 = (double)v102 / 100.0;
        uint64_t v104 = 1;
        if ((v29 & 0x80u) != 0) {
          uint64_t v104 = 2;
        }
        *(void *)&long long v264 = v104;
      }
      if (v265 == 255)
      {
        uint64_t v106 = 0;
      }
      else
      {
        unsigned int v105 = v265 & 0x7F;
        if (v105 >= 0x64) {
          unsigned int v105 = 100;
        }
        double v101 = (double)v105 / 100.0;
        if ((v265 & 0x80u) == 0) {
          uint64_t v106 = 1;
        }
        else {
          uint64_t v106 = 2;
        }
      }
      if (v30 == 255)
      {
        uint64_t v259 = 0;
        double v108 = 0.0;
      }
      else
      {
        unsigned int v107 = v30 & 0x7F;
        if (v107 >= 0x64) {
          unsigned int v107 = 100;
        }
        double v108 = (double)v107 / 100.0;
        uint64_t v109 = 1;
        if ((v30 & 0x80u) != 0) {
          uint64_t v109 = 2;
        }
        uint64_t v259 = v109;
      }
      *((void *)&v264 + 1) = v106;
      if (v19 - 8194) < 0xE && ((0x3201u >> (v19 - 2)))
      {
        unsigned int v111 = 1;
      }
      else
      {
        id v110 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:v19];
        unsigned int v111 = [v110 hasLid];
      }
      if ((v275 & 0x80u) == 0) {
        int v112 = 1;
      }
      else {
        int v112 = v111;
      }
      if (v112) {
        uint64_t v100 = v100;
      }
      else {
        uint64_t v100 = v100 | 0x400;
      }
      v113 = +[NSNumber numberWithUnsignedInt:v100];
      [v288 setObject:v113 forKeyedSubscript:@"hsStatus"];

      if ((v111 & ((v275 & 8) >> 3)) != 0) {
        v114 = &__kCFBooleanTrue;
      }
      else {
        v114 = &__kCFBooleanFalse;
      }
      [v288 setObject:v114 forKeyedSubscript:@"lc"];
      v115 = +[NSNumber numberWithInt:v275 & 7];
      if ((v100 & 0x100) != 0)
      {
        [v288 setObject:v115 forKeyedSubscript:@"locP"];

        v119 = [v283 advertisementFields];
        v117 = [v119 objectForKeyedSubscript:@"locS"];

        if (!v117) {
          goto LABEL_113;
        }
        CFStringRef v118 = @"locS";
      }
      else
      {
        [v288 setObject:v115 forKeyedSubscript:@"locS"];

        v116 = [v283 advertisementFields];
        v117 = [v116 objectForKeyedSubscript:@"locP"];

        if (!v117) {
          goto LABEL_113;
        }
        CFStringRef v118 = @"locP";
      }
      [v288 setObject:v117 forKeyedSubscript:v118];
LABEL_113:
      id v11 = v283;

      buf[0] = 0;
      LOBYTE(v290) = 0;
      [(SDProximityPairingBufferedScanner *)v285 parseStatus3:v275 productID:v19 caseLEDColor:buf caseLEDStatus:&v290];
      id v120 = +[SFHeadphoneProduct airPodsMax];

      if (v287 == v120)
      {
        v121 = +[NSNumber numberWithInt:v268 & 0x1F];
        [v288 setObject:v121 forKeyedSubscript:@"hbT"];
        id v12 = v281;
        goto LABEL_118;
      }
      id v12 = v281;
      if (v19 == 8207 || v19 == 8194)
      {
        v121 = +[NSNumber numberWithInt:(v275 >> 4) & 1];
        [v288 setObject:v121 forKeyedSubscript:@"csVs"];
LABEL_118:
      }
      if ([v287 supportsDigitalEngraving] && v274 - v260 >= 17)
      {
        v122 = +[NSData dataWithBytes:v260 length:17];
        [v288 setObject:v122 forKeyedSubscript:@"engravingData"];
      }
      v123 = +[NSNumber numberWithUnsignedChar:buf[0]];
      id v17 = v288;
      [v288 setObject:v123 forKeyedSubscript:@"csLC"];

      v124 = +[NSNumber numberWithUnsignedChar:v290];
      [v288 setObject:v124 forKeyedSubscript:@"csLS"];

      v125 = [(SDProximityPairingBufferedScanner *)v285 modelWithProductID:v19];
      [v288 setObject:v125 forKeyedSubscript:@"model"];

      v126 = +[NSNumber numberWithUnsignedShort:v19];
      [v288 setObject:v126 forKeyedSubscript:@"pid"];

      [v288 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ns"];
      if (v18) {
        [v12 objectForKeyedSubscript:WPPairingKeyDeviceAddress];
      }
      else {
      v127 = +[NSData dataWithBytes:v257 length:6];
      }
      uint64_t v128 = *((void *)&v264 + 1);
      uint64_t v129 = v264;
      [v288 setObject:v127 forKeyedSubscript:@"publicAddress"];

      id v64 = objc_alloc_init((Class)NSMutableArray);
      if (!v286)
      {
        id v133 = objc_alloc_init((Class)SFBatteryInfo);
        v131 = v133;
        double v134 = 1.0;
        if (v103 <= 1.0) {
          double v134 = v103;
        }
        if (v134 < 0.0001) {
          double v134 = 0.0001;
        }
        [v133 setBatteryLevel:v134];
        [v131 setBatteryState:(void)v264];
        [v131 setBatteryType:4];
        goto LABEL_157;
      }
      if (v259)
      {
        id v130 = objc_alloc_init((Class)SFBatteryInfo);
        v131 = v130;
        double v132 = 1.0;
        if (v108 <= 1.0) {
          double v132 = v108;
        }
        if (v132 < 0.0001) {
          double v132 = 0.0001;
        }
        [v130 setBatteryLevel:v132];
        [v131 setBatteryState:v259];
        [v131 setBatteryType:1];
        [v64 addObject:v131];
        if (v264 == 0)
        {
          LOBYTE(v100) = 0x80;
          uint64_t v128 = 2;
          uint64_t v129 = 2;
          double v101 = 1.0;
          double v103 = 1.0;
          goto LABEL_140;
        }
      }
      else
      {
        v131 = 0;
      }
      if (!(void)v264)
      {
LABEL_148:
        if (!v128)
        {
LABEL_158:
          CFStringRef v141 = @"batteryInfo";
          v142 = v288;
          v143 = v64;
          goto LABEL_349;
        }
        id v138 = objc_alloc_init((Class)SFBatteryInfo);

        double v139 = 1.0;
        if (v101 <= 1.0) {
          double v139 = v101;
        }
        if (v139 < 0.0001) {
          double v139 = 0.0001;
        }
        [v138 setBatteryLevel:v139];
        [v138 setBatteryState:v128];
        if ((v100 & 0x80) != 0) {
          uint64_t v140 = 3;
        }
        else {
          uint64_t v140 = 2;
        }
        [v138 setBatteryType:v140];
        v131 = v138;
LABEL_157:
        [v64 addObject:v131];
        goto LABEL_158;
      }
LABEL_140:
      id v135 = objc_alloc_init((Class)SFBatteryInfo);

      double v136 = 1.0;
      if (v103 <= 1.0) {
        double v136 = v103;
      }
      if (v136 < 0.0001) {
        double v136 = 0.0001;
      }
      [v135 setBatteryLevel:v136];
      [v135 setBatteryState:v129];
      if ((v100 & 0x80) != 0) {
        uint64_t v137 = 2;
      }
      else {
        uint64_t v137 = 3;
      }
      [v135 setBatteryType:v137];
      [v64 addObject:v135];
      v131 = v135;
      goto LABEL_148;
    case 1:
      if (v15 < 0xA) {
        goto LABEL_354;
      }
      int v36 = v14[7];
      unsigned int v37 = v14[8];
      unsigned __int8 v269 = v14[9];
      long long v38 = self;
      id v280 = v12;
      if (v15 == 26)
      {
        id v39 = v11;
        unsigned int v271 = 0;
        uint64_t v253 = 0;
        unsigned int v262 = 0;
        unsigned int v266 = 0;
        long long v40 = v14 + 10;
        long long v41 = (char *)(v14 + 11);
        long long v42 = (char *)(v14 + 12);
        long long v43 = (char *)(v14 + 13);
        v255 = (char *)(v14 + 17);
        v256 = (char *)(v14 + 14);
      }
      else
      {
        if (v15 < 0x17)
        {
LABEL_354:
          id v26 = 0;
          goto LABEL_50;
        }
        id v39 = v11;
        unsigned int v271 = v14[10];
        long long v40 = v14 + 13;
        LODWORD(v253) = v14[12];
        HIDWORD(v253) = v14[11];
        long long v41 = (char *)(v14 + 14);
        long long v42 = (char *)(v14 + 15);
        long long v43 = (char *)(v14 + 16);
        v255 = (char *)(v14 + 20);
        v256 = (char *)(v14 + 17);
        unsigned int v262 = v14[23];
        unsigned int v266 = v14[24];
      }
      int v82 = *v43;
      int v83 = *v42;
      int v84 = *v41;
      unsigned int v85 = *v40;
      HIDWORD(v252) = v36;
      unsigned int v277 = -[SDProximityPairingBufferedScanner statusToHeadsetStatus:forProductID:](v38, "statusToHeadsetStatus:forProductID:");
      char v261 = v85;
      if ([(SDProximityPairingBufferedScanner *)v38 pairingUpdatePairedInfo:v10 fields:v288 bleDevice:v39])
      {
        if (v15 == 26 || !sub_1001C3934(v19))
        {
          LODWORD(v252) = 0;
        }
        else
        {
          if ((v85 & 0x20) != 0) {
            int v86 = 2;
          }
          else {
            int v86 = 1;
          }
          LODWORD(v252) = v86;
        }
        double v92 = 0.0;
        if (v84 == -1)
        {
          *((void *)&v258 + 1) = 0;
          double v93 = 0.0;
        }
        else
        {
          unsigned int v144 = v84 & 0x7F;
          if (v144 >= 0x64) {
            unsigned int v144 = 100;
          }
          double v93 = (double)v144 / 100.0;
          uint64_t v145 = 1;
          if (v84 < 0) {
            uint64_t v145 = 2;
          }
          *((void *)&v258 + 1) = v145;
        }
        uint64_t v192 = v85 & 3;
        if (v83 == -1)
        {
          *(void *)&long long v258 = 0;
        }
        else
        {
          unsigned int v193 = v83 & 0x7F;
          if (v193 >= 0x64) {
            unsigned int v193 = 100;
          }
          double v92 = (double)v193 / 100.0;
          uint64_t v194 = 1;
          if (v83 < 0) {
            uint64_t v194 = 2;
          }
          *(void *)&long long v258 = v194;
        }
        id v11 = v39;
        if (v82 == -1)
        {
          uint64_t v254 = 0;
          double v188 = 0.0;
        }
        else
        {
          unsigned int v195 = v82 & 0x7F;
          if (v195 >= 0x64) {
            unsigned int v195 = 100;
          }
          double v188 = (double)v195 / 100.0;
          uint64_t v196 = 1;
          if (v82 < 0) {
            uint64_t v196 = 2;
          }
          uint64_t v254 = v196;
        }
        id v12 = v280;
        v190 = &NSCalendarIdentifierGregorian_ptr;
        v197 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", (v85 >> 2) & 3, v252);
        v191 = v288;
        [v288 setObject:v197 forKeyedSubscript:@"asCount"];

        v198 = +[NSNumber numberWithInteger:v192];
        [v288 setObject:v198 forKeyedSubscript:@"aState"];

        v199 = +[NSData dataWithBytes:v255 length:3];
        [v288 setObject:v199 forKeyedSubscript:@"lbic"];

        v200 = +[NSData dataWithBytes:v256 length:3];
        [v288 setObject:v200 forKeyedSubscript:@"lch"];

        [v288 setObject:&__kCFBooleanTrue forKeyedSubscript:@"paired"];
        v201 = +[NSNumber numberWithUnsignedChar:v252];
        [v288 setObject:v201 forKeyedSubscript:@"obcState"];

        unsigned int v94 = v286;
      }
      else
      {
        int v91 = v37 & 0xF;
        double v92 = 0.0;
        if (v91 == 15)
        {
          *((void *)&v258 + 1) = 0;
          double v93 = 0.0;
          id v11 = v39;
          id v12 = v280;
          unsigned int v94 = v286;
          unsigned __int8 v95 = v269;
        }
        else
        {
          if (v91 >= 0xA) {
            int v91 = 10;
          }
          double v93 = (double)v91 / 10.0;
          unsigned __int8 v95 = v269;
          uint64_t v184 = 1;
          if ((v269 & 0x10) != 0) {
            uint64_t v184 = 2;
          }
          *((void *)&v258 + 1) = v184;
          id v11 = v39;
          id v12 = v280;
          unsigned int v94 = v286;
        }
        int v185 = v37 >> 4;
        if (v37 >> 4 == 15)
        {
          *(void *)&long long v258 = 0;
        }
        else
        {
          if (v185 >= 0xA) {
            int v185 = 10;
          }
          double v92 = (double)v185 / 10.0;
          uint64_t v186 = 1;
          if ((v95 & 0x20) != 0) {
            uint64_t v186 = 2;
          }
          *(void *)&long long v258 = v186;
        }
        int v187 = v95 & 0xF;
        if (v187 == 15)
        {
          uint64_t v254 = 0;
          double v188 = 0.0;
        }
        else
        {
          if (v187 >= 0xA) {
            int v187 = 10;
          }
          double v188 = (double)v187 / 10.0;
          uint64_t v189 = 1;
          if ((v95 & 0x40) != 0) {
            uint64_t v189 = 2;
          }
          uint64_t v254 = v189;
        }
        v190 = &NSCalendarIdentifierGregorian_ptr;
        v191 = v288;
      }
      v202 = [(SDProximityPairingBufferedScanner *)v38 modelWithProductID:v19];
      [v191 setObject:v202 forKeyedSubscript:@"model"];

      v203 = [(NSCalendarIdentifier *)(id)v190[214] numberWithUnsignedShort:v19];
      [v191 setObject:v203 forKeyedSubscript:@"pid"];

      BOOL v20 = v15 == 26;
      v204 = v190;
      if (v20) {
        goto LABEL_304;
      }
      buf[0] = 0;
      LOBYTE(v290) = 0;
      [(SDProximityPairingBufferedScanner *)v38 parseStatus3:v271 productID:v19 caseLEDColor:buf caseLEDStatus:&v290];
      if (v19 == 8203
        || (id v205 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:v19],
            unsigned int v206 = [v205 hasSplitCaseColors],
            v205,
            v206))
      {
        v207 = [(NSCalendarIdentifier *)(id)v204[214] numberWithUnsignedChar:BYTE4(v253) & 0xF];
        v191 = v288;
        [v288 setObject:v207 forKeyedSubscript:@"cc"];

        v204 = &NSCalendarIdentifierGregorian_ptr;
        v208 = +[NSNumber numberWithUnsignedChar:HIDWORD(v253) >> 4];
        [v288 setObject:v208 forKeyedSubscript:@"ccR"];

        v209 = +[NSNumber numberWithUnsignedChar:v253 >> 5];
        CFStringRef v210 = @"ccC";
      }
      else
      {
        id v211 = +[SFHeadphoneProduct airPodsMax];

        v212 = (NSCalendarIdentifier *)v204[214];
        v191 = v288;
        if (v287 == v211) {
          [(NSCalendarIdentifier *)v212 numberWithInt:BYTE4(v253) & 0x1F];
        }
        else {
        v209 = [(NSCalendarIdentifier *)v212 numberWithUnsignedChar:HIDWORD(v253)];
        }
        CFStringRef v210 = @"cc";
      }
      [v191 setObject:v209 forKeyedSubscript:v210];
      int v213 = v277;

      id v214 = +[SFHeadphoneProduct airPodsMax];

      if (v287 == v214)
      {
        v216 = [(NSCalendarIdentifier *)(id)v204[214] numberWithInt:BYTE4(v252) & 0x1F];
        CFStringRef v217 = @"hbT";
      }
      else
      {
        unsigned int v215 = 1;
        if ((int)v19 > 8205)
        {
          if (v19 == 8206) {
            goto LABEL_289;
          }
          if (v19 != 8207) {
            goto LABEL_287;
          }
        }
        else if (v19 != 8194)
        {
          if (v19 == 8203) {
            goto LABEL_289;
          }
          goto LABEL_287;
        }
        v216 = [(NSCalendarIdentifier *)(id)v204[214] numberWithInt:(v271 >> 4) & 1];
        CFStringRef v217 = @"csVs";
      }
      [v191 setObject:v216 forKeyedSubscript:v217];

      if ((v19 - 8194) >= 0xE || ((0x3201u >> (v19 - 2)) & 1) == 0)
      {
LABEL_287:
        id v218 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:v19];
        unsigned int v215 = [v218 hasLid];

        goto LABEL_289;
      }
      unsigned int v215 = 1;
LABEL_289:
      if ((v271 & 0x80u) == 0) {
        int v219 = 1;
      }
      else {
        int v219 = v215;
      }
      if (!v219) {
        int v213 = v277 | 0x400;
      }
      v220 = [(NSCalendarIdentifier *)(id)v204[214] numberWithInt:v271 & 7];
      unsigned int v277 = v213;
      if ((v213 & 0x100) != 0)
      {
        [v191 setObject:v220 forKeyedSubscript:@"locP"];

        v224 = [v11 advertisementFields];
        v222 = [v224 objectForKeyedSubscript:@"locS"];

        if (v222)
        {
          CFStringRef v223 = @"locS";
          goto LABEL_299;
        }
      }
      else
      {
        [v191 setObject:v220 forKeyedSubscript:@"locS"];

        v221 = [v11 advertisementFields];
        v222 = [v221 objectForKeyedSubscript:@"locP"];

        if (v222)
        {
          CFStringRef v223 = @"locP";
LABEL_299:
          [v191 setObject:v222 forKeyedSubscript:v223];
        }
      }

      if ((v215 & ((v271 & 8) >> 3)) != 0) {
        v225 = &__kCFBooleanTrue;
      }
      else {
        v225 = &__kCFBooleanFalse;
      }
      [v191 setObject:v225 forKeyedSubscript:@"lc"];
      v204 = &NSCalendarIdentifierGregorian_ptr;
      v226 = +[NSNumber numberWithUnsignedChar:buf[0]];
      [v191 setObject:v226 forKeyedSubscript:@"csLC"];

      v227 = +[NSNumber numberWithUnsignedChar:v290];
      [v191 setObject:v227 forKeyedSubscript:@"csLS"];

LABEL_304:
      char v228 = v277;
      v229 = [(NSCalendarIdentifier *)(id)v204[214] numberWithUnsignedInt:v277];
      [v191 setObject:v229 forKeyedSubscript:@"hsStatus"];

      if ((v269 & 0x80) != 0)
      {
        v230 = [(NSCalendarIdentifier *)(id)v204[214] numberWithUnsignedInt:2048];
        [v191 setObject:v230 forKeyedSubscript:@"df"];
      }
      id v64 = objc_alloc_init((Class)NSMutableArray);
      uint64_t v231 = v258;
      if (!v94)
      {
        if (!*((void *)&v258 + 1))
        {
          v131 = 0;
          goto LABEL_342;
        }
        id v235 = objc_alloc_init((Class)SFBatteryInfo);
        v131 = v235;
        double v236 = 1.0;
        if (v93 <= 1.0) {
          double v236 = v93;
        }
        if (v236 < 0.0001) {
          double v236 = 0.0001;
        }
        [v235 setBatteryLevel:v236];
        [v131 setBatteryState:*((void *)&v258 + 1)];
        [v131 setBatteryType:4];
LABEL_339:
        [v64 addObject:v131];
LABEL_342:
        [v191 setObject:v64 forKeyedSubscript:@"batteryInfo"];
        if ((v261 & 0x40) != 0) {
          v243 = &__kCFBooleanTrue;
        }
        else {
          v243 = &__kCFBooleanFalse;
        }
        [v191 setObject:v243 forKeyedSubscript:@"srConnected"];
        [(NSCalendarIdentifier *)(id)v204[214] numberWithInt:v262 & 0xF];
        v245 = v244 = v204;
        [v288 setObject:v245 forKeyedSubscript:@"srAudioRoutingScore1"];

        v246 = [(NSCalendarIdentifier *)(id)v244[214] numberWithInt:v262 >> 4];
        [v288 setObject:v246 forKeyedSubscript:@"srAudioRoutingScore2"];

        v247 = [(NSCalendarIdentifier *)(id)v244[214] numberWithInt:v266 & 3];
        [v288 setObject:v247 forKeyedSubscript:@"audioIdleTime"];

        v248 = (NSCalendarIdentifier *)v244[214];
        id v17 = v288;
        v249 = [(NSCalendarIdentifier *)v248 numberWithInt:(v266 >> 2) & 3];
        [v288 setObject:v249 forKeyedSubscript:@"budsOutofCaseTime"];

        if ((v266 & 0x10) != 0) {
          v143 = &__kCFBooleanTrue;
        }
        else {
          v143 = &__kCFBooleanFalse;
        }
        CFStringRef v141 = @"primaryiCloudSignIn";
        v142 = v288;
LABEL_349:
        [v142 setObject:v143 forKeyedSubscript:v141];

LABEL_350:
        goto LABEL_351;
      }
      if (v254)
      {
        id v232 = objc_alloc_init((Class)SFBatteryInfo);
        v131 = v232;
        double v233 = 1.0;
        if (v188 <= 1.0) {
          double v233 = v188;
        }
        if (v233 < 0.0001) {
          double v233 = 0.0001;
        }
        [v232 setBatteryLevel:v233];
        [v131 setBatteryState:v254];
        [v131 setBatteryType:1];
        [v64 addObject:v131];
        uint64_t v234 = *((void *)&v258 + 1);
        if (v258 == 0)
        {
          char v228 = 0x80;
          uint64_t v231 = 2;
          uint64_t v234 = 2;
          double v92 = 1.0;
          double v93 = 1.0;
          goto LABEL_322;
        }
      }
      else
      {
        v131 = 0;
        uint64_t v234 = *((void *)&v258 + 1);
      }
      if (!v234)
      {
LABEL_330:
        if (!v231)
        {
          v204 = &NSCalendarIdentifierGregorian_ptr;
          goto LABEL_342;
        }
        id v240 = objc_alloc_init((Class)SFBatteryInfo);

        double v241 = 1.0;
        if (v92 <= 1.0) {
          double v241 = v92;
        }
        if (v241 < 0.0001) {
          double v241 = 0.0001;
        }
        [v240 setBatteryLevel:v241];
        [v240 setBatteryState:v231];
        if (v228 < 0) {
          uint64_t v242 = 3;
        }
        else {
          uint64_t v242 = 2;
        }
        [v240 setBatteryType:v242];
        v131 = v240;
        v204 = &NSCalendarIdentifierGregorian_ptr;
        goto LABEL_339;
      }
LABEL_322:
      id v237 = objc_alloc_init((Class)SFBatteryInfo);

      double v238 = 1.0;
      if (v93 <= 1.0) {
        double v238 = v93;
      }
      if (v238 < 0.0001) {
        double v238 = 0.0001;
      }
      [v237 setBatteryLevel:v238];
      [v237 setBatteryState:v234];
      if (v228 < 0) {
        uint64_t v239 = 2;
      }
      else {
        uint64_t v239 = 3;
      }
      [v237 setBatteryType:v239];
      [v64 addObject:v237];
      v131 = v237;
      goto LABEL_330;
    case 2:
    case 3:
      goto LABEL_352;
    case 4:
      id v279 = v10;
      if (v15 >= 0x1B)
      {
        unsigned __int8 v44 = v14[7];
        unsigned __int8 v276 = v14[9];
        uint64_t v45 = v14[10];
        uint64_t v46 = v14[11];
        unsigned __int8 v270 = v14[12];
        unsigned int v272 = v14[8];
        *(_DWORD *)buf = *(_DWORD *)(v14 + 13);
        LOWORD(v293) = *(_WORD *)(v14 + 17);
        int v290 = *(_DWORD *)(v14 + 19);
        __int16 v291 = *(_WORD *)(v14 + 23);
        unsigned __int16 v267 = *(_WORD *)(v14 + 25);
        unsigned __int8 v263 = v44;
        uint64_t v47 = -[SDProximityPairingBufferedScanner statusToHeadsetStatus:forProductID:](self, "statusToHeadsetStatus:forProductID:");
        long long v48 = +[NSNumber numberWithUnsignedChar:v46];
        [v288 setObject:v48 forKeyedSubscript:@"cc"];

        long long v49 = +[NSNumber numberWithUnsignedInt:v47];
        [v288 setObject:v49 forKeyedSubscript:@"hsStatus"];

        if ((v45 & 8) != 0) {
          long long v50 = &__kCFBooleanTrue;
        }
        else {
          long long v50 = &__kCFBooleanFalse;
        }
        [v288 setObject:v50 forKeyedSubscript:@"lc"];
        v51 = +[NSNumber numberWithInt:v45 & 7];
        if ((v47 & 0x100) != 0)
        {
          [v288 setObject:v51 forKeyedSubscript:@"locP"];

          v87 = [v11 advertisementFields];
          v53 = [v87 objectForKeyedSubscript:@"locS"];

          if (!v53) {
            goto LABEL_63;
          }
          CFStringRef v54 = @"locS";
        }
        else
        {
          [v288 setObject:v51 forKeyedSubscript:@"locS"];

          v52 = [v11 advertisementFields];
          v53 = [v52 objectForKeyedSubscript:@"locP"];

          if (!v53) {
            goto LABEL_63;
          }
          CFStringRef v54 = @"locP";
        }
        [v288 setObject:v53 forKeyedSubscript:v54];
LABEL_63:

        __int16 v289 = 0;
        [(SDProximityPairingBufferedScanner *)self parseStatus3:v45 productID:v19 caseLEDColor:(char *)&v289 + 1 caseLEDStatus:&v289];
        v88 = +[SFHeadphoneProduct airPodsPro];
        id v284 = v11;
        if ([v88 productID] == v19)
        {
          BOOL v89 = 1;
        }
        else
        {
          v90 = +[SFHeadphoneProduct b698];
          if ([v90 productID] == v19)
          {
            BOOL v89 = 1;
          }
          else
          {
            +[SFHeadphoneProduct b698];
            v147 = id v146 = v12;
            BOOL v89 = [v147 altProductID] == v19;

            id v12 = v146;
          }
        }
        id v282 = v12;

        v148 = +[SFHeadphoneProduct airPods];
        if ([v148 productID] == v19)
        {
          int v149 = 1;
        }
        else
        {
          v150 = +[SFHeadphoneProduct airPodsSecondGeneration];
          int v149 = [v150 productID] == v19 || v89;
        }
        id v151 = +[SFHeadphoneProduct airPodsMax];

        if (v287 == v151)
        {
          v153 = +[NSNumber numberWithInt:v263 & 0x1F];
          CFStringRef v154 = @"hbT";
        }
        else
        {
          if (!v149)
          {
LABEL_182:
            v155 = +[NSNumber numberWithUnsignedChar:HIBYTE(v289)];
            [v288 setObject:v155 forKeyedSubscript:@"csLC"];

            v156 = +[NSNumber numberWithUnsignedChar:v289];
            [v288 setObject:v156 forKeyedSubscript:@"csLS"];

            v157 = [(SDProximityPairingBufferedScanner *)self modelWithProductID:v19];
            [v288 setObject:v157 forKeyedSubscript:@"model"];

            v158 = +[NSNumber numberWithUnsignedShort:v19];
            [v288 setObject:v158 forKeyedSubscript:@"pid"];

            v159 = +[NSNumber numberWithUnsignedShort:v267];
            [v288 setObject:v159 forKeyedSubscript:@"pid2"];

            v160 = +[NSData dataWithBytes:buf length:6];
            [v288 setObject:v160 forKeyedSubscript:@"publicAddress"];

            v161 = +[NSData dataWithBytes:&v290 length:6];
            [v288 setObject:v161 forKeyedSubscript:@"publicAddress2"];

            if (v270) {
              [v288 setObject:&__kCFBooleanTrue forKeyedSubscript:@"notMyCase"];
            }
            id v11 = v284;
            [(SDProximityPairingBufferedScanner *)self pairingUpdatePairedInfo:v279 fields:v288 bleDevice:v284];
            id v162 = objc_alloc_init((Class)NSMutableArray);
            int v163 = v276 & 0xF;
            double v164 = 0.0;
            id v17 = v288;
            if (v163 == 15)
            {
              uint64_t v165 = 0;
              double v166 = 0.0;
            }
            else
            {
              if (v163 >= 0xA) {
                int v163 = 10;
              }
              double v166 = (double)v163 / 10.0;
              if ((v276 & 0x40) != 0) {
                uint64_t v165 = 2;
              }
              else {
                uint64_t v165 = 1;
              }
            }
            char v167 = v47;
            int v168 = v272 & 0xF;
            if (v168 == 15)
            {
              uint64_t v169 = 0;
            }
            else
            {
              if (v168 >= 0xA) {
                int v168 = 10;
              }
              double v164 = (double)v168 / 10.0;
              if ((v276 & 0x10) != 0) {
                uint64_t v169 = 2;
              }
              else {
                uint64_t v169 = 1;
              }
            }
            int v170 = v272 >> 4;
            if (v272 >> 4 == 15)
            {
              uint64_t v171 = 0;
              double v172 = 0.0;
            }
            else
            {
              if (v170 >= 0xA) {
                int v170 = 10;
              }
              double v172 = (double)v170 / 10.0;
              if ((v276 & 0x20) != 0) {
                uint64_t v171 = 2;
              }
              else {
                uint64_t v171 = 1;
              }
            }
            if (v165)
            {
              id v173 = objc_alloc_init((Class)SFBatteryInfo);
              v174 = v173;
              double v175 = 1.0;
              if (v166 <= 1.0) {
                double v175 = v166;
              }
              if (v175 < 0.0001) {
                double v175 = 0.0001;
              }
              [v173 setBatteryLevel:v175];
              [v174 setBatteryState:v165];
              [v174 setBatteryType:1];
              [v162 addObject:v174];
              if (!(v171 | v169))
              {
                char v167 = 0x80;
                uint64_t v169 = 2;
                double v164 = 1.0;
                uint64_t v171 = 2;
                double v172 = 1.0;
              }

              id v17 = v288;
            }
            if (v169)
            {
              id v176 = objc_alloc_init((Class)SFBatteryInfo);
              v177 = v176;
              double v178 = 1.0;
              if (v164 <= 1.0) {
                double v178 = v164;
              }
              if (v178 < 0.0001) {
                double v178 = 0.0001;
              }
              [v176 setBatteryLevel:v178];
              [v177 setBatteryState:v169];
              if (v167 < 0) {
                uint64_t v179 = 2;
              }
              else {
                uint64_t v179 = 3;
              }
              [v177 setBatteryType:v179];
              [v162 addObject:v177];
            }
            if (v171)
            {
              id v180 = objc_alloc_init((Class)SFBatteryInfo);
              v181 = v180;
              double v182 = 1.0;
              if (v172 <= 1.0) {
                double v182 = v172;
              }
              if (v182 < 0.0001) {
                double v182 = 0.0001;
              }
              [v180 setBatteryLevel:v182];
              [v181 setBatteryState:v171];
              if (v167 < 0) {
                uint64_t v183 = 3;
              }
              else {
                uint64_t v183 = 2;
              }
              [v181 setBatteryType:v183];
              [v162 addObject:v181];
            }
            [v17 setObject:v162 forKeyedSubscript:@"batteryInfo"];

            id v10 = v279;
            id v12 = v282;
            goto LABEL_351;
          }
          if (v89) {
            uint64_t v152 = (v45 >> 4) & 1 | 2;
          }
          else {
            uint64_t v152 = (v45 >> 4) & 1;
          }
          v153 = +[NSNumber numberWithUnsignedChar:v152];
          CFStringRef v154 = @"csVs";
        }
        [v288 setObject:v153 forKeyedSubscript:v154];

        goto LABEL_182;
      }
      id v26 = 0;
LABEL_50:
      id v17 = v288;
LABEL_352:
      id v250 = v26;

      return v250;
    case 5:
      v273 = &v14[v15];
      v55 = +[NSNumber numberWithUnsignedShort:v19];
      [v288 setObject:v55 forKeyedSubscript:@"pid"];

      v56 = [(SDProximityPairingBufferedScanner *)self modelWithProductID:v19];
      [v288 setObject:v56 forKeyedSubscript:@"model"];

      if (v15 >= 8)
      {
        v28 = (char *)(v14 + 8);
        v57 = +[NSNumber numberWithUnsignedChar:v14[7]];
        [v288 setObject:v57 forKeyedSubscript:@"osFl"];
      }
      unint64_t v58 = (unint64_t)v28;
      uint64_t v59 = v273 - (unsigned __int8 *)v28;
      if (v59 < 1) {
        goto LABEL_351;
      }
      unsigned int v60 = *(unsigned __int8 *)v58;
      v61 = +[NSNumber numberWithInt:v60 & 3];
      [v288 setObject:v61 forKeyedSubscript:@"osBS"];

      v62 = +[NSNumber numberWithInt:(v60 >> 2) & 3];
      [v288 setObject:v62 forKeyedSubscript:@"osBP"];

      if ((uint64_t)&v273[~v58] < 1) {
        goto LABEL_351;
      }
      v63 = +[NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v58 + 1)];
      [v288 setObject:v63 forKeyedSubscript:@"osCl"];

      if (v59 - 2 < 18) {
        goto LABEL_351;
      }
      id v64 = +[NSData dataWithBytes:v58 + 3 length:18];
      [v288 setObject:v64 forKeyedSubscript:@"engravingData"];
      goto LABEL_350;
    case 6:
      v65 = &v14[v15];
      uint64_t Int64 = CFDictionaryGetInt64();
      [(SDProximityPairingBufferedScanner *)self pairingUpdatePairedInfo:v10 fields:v288 bleDevice:v11];
      if (Int64)
      {
        v67 = [(SDProximityPairingBufferedScanner *)self modelWithProductID:v19];
        [v288 setObject:v67 forKeyedSubscript:@"model"];

        v68 = +[NSNumber numberWithUnsignedShort:v19];
        [v288 setObject:v68 forKeyedSubscript:@"pid"];

        v69 = [v12 objectForKeyedSubscript:WPPairingKeyDeviceAddress];
        [v288 setObject:v69 forKeyedSubscript:@"publicAddress"];

        v70 = +[NSNumber numberWithBool:1];
        [v288 setObject:v70 forKeyedSubscript:@"paired"];

        v71 = sub_1001BF5C4();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v293 = v288;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "AccessoryStatus found: %@\n", buf, 0xCu);
        }

        [(SDProximityPairingBufferedScanner *)self pairingParseAccessoryStatusPayloadPtr:v28 end:v65 fields:v288];
      }
      goto LABEL_351;
    default:
      id v11 = v12;
      id v12 = v288;
      goto LABEL_50;
  }
}

- (void)_foundDevice:(id)a3 advertisementData:(id)a4 rssi:(int64_t)a5 fields:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ((unint64_t)(a5 - 20) >= 0x6B) {
    int64_t v13 = a5;
  }
  else {
    int64_t v13 = a5 - 126;
  }
  if ((unint64_t)(v13 - 1) >= 0xFFFFFFFFFFFFFFA5) {
    int64_t v14 = v13;
  }
  else {
    int64_t v14 = 0;
  }
  unsigned __int8 v60 = 0;
  unint64_t v15 = [gSFNearbyAgent idsDeviceForBluetoothDeviceID:v10 conflictDetected:&v60];
  uint64_t v16 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v10];
  if (v16)
  {
    id v17 = (id)v16;
    if (v15)
    {
      uint64_t v18 = [v15 uniqueIDOverride];
      if (v18) {
        [v12 setObject:v18 forKeyedSubscript:@"idsID"];
      }
      uint64_t v19 = +[NSNumber numberWithBool:v60];
      [v12 setObject:v19 forKeyedSubscript:@"idsIDCD"];
    }
    else
    {
      uint64_t v18 = 0;
    }
    uint64_t v33 = [v17 advertisementFields];
    CFStringGetTypeID();
    id v34 = CFDictionaryGetTypedValue();

    if (v18) {
      [v34 isEqual:v18];
    }
    v57 = v34;
    unint64_t v58 = (void *)v18;
    CFStringGetTypeID();
    uint64_t v35 = CFDictionaryGetTypedValue();
    uint64_t v36 = v35;
    if (v15)
    {
      if (!v35)
      {
        uint64_t v36 = [v15 modelIdentifier];
        if (v36) {
          [v12 setObject:v36 forKeyedSubscript:@"model"];
        }
      }
    }
    id v59 = v10;
    unsigned int v37 = [v17 advertisementFields];
    CFStringGetTypeID();
    long long v38 = CFDictionaryGetTypedValue();

    if (v36) {
      [v38 isEqual:v36];
    }
    [v17 setLastSeen:CFAbsoluteTimeGetCurrent()];
    id v39 = [v17 advertisementData];
    unsigned __int8 v40 = [v39 isEqual:v11];

    if ((v40 & 1) == 0) {
      [v17 setAdvertisementData:v11];
    }
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
    if ([v17 connectedServices] != Int64Ranged) {
      [v17 setConnectedServices:Int64Ranged];
    }
    v56 = (void *)v36;
    if (v14) {
      [v17 updateRSSI:v14];
    }
    long long v42 = v15;
    long long v43 = [v17 bluetoothAddress];
    if (!v43)
    {
      CFDataGetTypeID();
      long long v43 = CFDictionaryGetTypedValue();
      if (v43) {
        [v17 setBluetoothAddress:v43];
      }
    }
    unsigned __int8 v44 = v38;
    uint64_t v45 = self;
    CFStringGetTypeID();
    uint64_t v46 = CFDictionaryGetTypedValue();
    uint64_t v47 = (void *)v46;
    id v48 = v11;
    if (v42 && !v46)
    {
      uint64_t v47 = [v42 name];
    }
    if (v47)
    {
      long long v49 = [v17 name];
      unsigned __int8 v50 = [v49 isEqual:v47];

      if ((v50 & 1) == 0) {
        [v17 setName:v47];
      }
    }
    uint64_t Int64 = CFDictionaryGetInt64();
    if (v42) {
      [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"paired"];
    }
    if (![v17 paired] || Int64)
    {
      id v11 = v48;
      if (([v17 paired] & 1) == 0 && Int64) {
        [v17 setPaired:1];
      }
    }
    else
    {
      [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"paired"];
      id v11 = v48;
    }
    v52 = [v17 counterpartIdentifier];
    if (v52)
    {

      if (!v12)
      {
LABEL_69:
        sub_1001C418C(v53, v17);
        CFStringRef v54 = sub_1001BF5C4();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v62 = v17;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Updated %@\n", buf, 0xCu);
        }

        id bufferedDeviceFoundHandler = (void (**)(id, id))v45->_bufferedDeviceFoundHandler;
        if (bufferedDeviceFoundHandler) {
          bufferedDeviceFoundHandler[2](bufferedDeviceFoundHandler, v17);
        }

        uint64_t v22 = v58;
        id v10 = v59;
        unint64_t v15 = v42;
        goto LABEL_74;
      }
    }
    else
    {
      uint64_t v53 = [(SDProximityPairingBufferedScanner *)v45 _updateCounterpart:v17];
      if (!v12) {
        goto LABEL_69;
      }
    }
    uint64_t v53 = (uint64_t)[v17 setAdvertisementFields:v12];
    goto LABEL_69;
  }
  uint64_t v20 = CFDictionaryGetInt64();
  CFStringGetTypeID();
  uint64_t v21 = CFDictionaryGetTypedValue();
  uint64_t v22 = (void *)v21;
  if (v15)
  {
    if (!v21)
    {
      uint64_t v22 = [v15 name];
    }
    long long v23 = self;
    CFStringGetTypeID();
    long long v24 = CFDictionaryGetTypedValue();
    if (v24 || ([v15 modelIdentifier], (long long v24 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [v12 setObject:v24 forKeyedSubscript:@"model"];
    }
    id v25 = v11;
    id v26 = [v15 uniqueIDOverride];
    if (v26) {
      [v12 setObject:v26 forKeyedSubscript:@"idsID"];
    }
    uint64_t v27 = +[NSNumber numberWithBool:v60];
    [v12 setObject:v27 forKeyedSubscript:@"idsIDCD"];

    [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"paired"];
    id v11 = v25;
    self = v23;
  }
  else
  {
    if (!v20) {
      goto LABEL_22;
    }
    id v26 = sub_1001BF5C4();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v62 = v10;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "### No IDS device found for paired ID %@\n", buf, 0xCu);
    }
  }

  uint64_t v20 = 1;
LABEL_22:
  id v17 = objc_alloc_init((Class)SFBLEDevice);
  [v17 setAdvertisementData:v11];
  if (v12) {
    [v17 setAdvertisementFields:v12];
  }
  CFDataGetTypeID();
  [v17 setBluetoothAddress:CFDictionaryGetTypedValue()];
  [v17 setConnectedServices:CFDictionaryGetInt64Ranged()];
  [v17 setFoundTicks:mach_absolute_time()];
  [v17 setIdentifier:v10];
  [v17 setLastSeen:CFAbsoluteTimeGetCurrent()];
  if (v22) {
    [v17 setName:v22];
  }
  [v17 setPaired:v20];
  if (v14) {
    [v17 updateRSSI:v14];
  }
  sub_1001C418C([(SDProximityPairingBufferedScanner *)self _updateCounterpart:v17], v17);
  devices = self->_devices;
  if (!devices)
  {
    int v29 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    int v30 = self->_devices;
    self->_devices = v29;

    devices = self->_devices;
  }
  [(NSMutableDictionary *)devices setObject:v17 forKeyedSubscript:v10];
  int v31 = sub_1001BF5C4();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v62 = v17;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Found %@\n", buf, 0xCu);
  }

  int v32 = (void (**)(id, id))self->_bufferedDeviceFoundHandler;
  if (v32) {
    v32[2](v32, v17);
  }
LABEL_74:
}

- (BOOL)_updateCounterpart:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bluetoothAddress];
  if (v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = self->_devices;
    id v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          id v12 = v11;
          if (v11 == v4)
          {
            int64_t v13 = 0;
          }
          else
          {
            int64_t v13 = [v11 bluetoothAddress];
            if ([v13 isEqual:v5])
            {
              int64_t v14 = [v12 identifier];
              [v4 setCounterpartIdentifier:v14];

              BOOL v15 = 1;
              goto LABEL_14;
            }
          }
        }
        id v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
    BOOL v15 = 0;
LABEL_14:
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)bufferedDeviceFoundHandler
{
  return self->_bufferedDeviceFoundHandler;
}

- (void)setBufferedDeviceFoundHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_bufferedDeviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_cbDiscoveryScreenOffPairing, 0);
  objc_storeStrong((id *)&self->_wpPairing, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

@end