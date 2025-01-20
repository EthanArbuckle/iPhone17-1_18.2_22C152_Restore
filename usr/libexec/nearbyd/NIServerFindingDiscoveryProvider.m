@interface NIServerFindingDiscoveryProvider
- (NIServerFindingDiscoveryProvider)initWithIdentifier:(const void *)a3 isFinder:(BOOL)a4 enableBluetooth:(BOOL)a5 launchOnDemand:(BOOL)a6 scanRate:(int)a7 discoveryTimeout:(double)a8 oobRefreshPeriod:(double)a9 consumer:(id)a10 queue:(id)a11;
- (NSDictionary)advertisingPeers;
- (NSDictionary)discoveredPeers;
- (NSSet)peersEligibleForDiscovery;
- (array<unsigned)advertisingAddress;
- (id).cxx_construct;
- (id)_cbAdvertisingAddress;
- (id)_configureNearbyActionNoWakeScannerAndRequestScan:(BOOL)a3;
- (id)_configureSpatialInteractionScannerAndRequestScan:(BOOL)a3;
- (id)_getAdvertisementFromCBDevice:(id)a3 advertisementType:(int)a4;
- (id)_getDiscoveryTokenFromCBDevice:(id)a3 advertisementType:(int)a4;
- (id)_nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers;
- (id)printableState;
- (id)processAdvertisement:(id)a3 receivedOOBFromPeer:(id)a4;
- (id)processLostEventReceivedOOBFromPeer:(id)a3;
- (id)setPeersEligibleForDiscovery:(id)a3 requestScan:(BOOL)a4;
- (id)startAdvertisingToPeer:(id)a3 advertisement:(id)a4 timeout:(double)a5;
- (id)stopAdvertisingToPeer:(id)a3;
- (void)_cbAdvertisingAddressChangedHandler;
- (void)_cbBluetoothStateChangedHandler;
- (void)_cbDeviceFoundHandler:(id)a3;
- (void)_cbErrorHandler:(id)a3;
- (void)_cbInterruptionHandler;
- (void)_configureAdvertisementOOBRefreshTimerForToken:(id)a3;
- (void)_configureAdvertisementTimeout:(double)a3 forToken:(id)a4;
- (void)_configureDiscoveryTimeout:(double)a3 forToken:(id)a4;
- (void)_nearbyActionNoWakeDisableScanDupesIfNecessary;
- (void)_processReceivedAdvertisement:(id)a3 fromPeer:(id)a4 overBluetooth:(BOOL)a5 cbDevice:(id)a6;
- (void)_resetAdvertisingStateForAllPeers;
- (void)_resetDiscoveryStateForAllPeers;
- (void)_resetDiscoveryStateForPeer:(id)a3;
- (void)_updateLaunchOnDemandScannerAndRequestScan:(BOOL)a3;
- (void)activate;
- (void)invalidate;
@end

@implementation NIServerFindingDiscoveryProvider

- (NIServerFindingDiscoveryProvider)initWithIdentifier:(const void *)a3 isFinder:(BOOL)a4 enableBluetooth:(BOOL)a5 launchOnDemand:(BOOL)a6 scanRate:(int)a7 discoveryTimeout:(double)a8 oobRefreshPeriod:(double)a9 consumer:(id)a10 queue:(id)a11
{
  BOOL v14 = a6;
  BOOL v15 = a5;
  BOOL v16 = a4;
  id v19 = a10;
  id v20 = a11;
  if (!v19) {
    __assert_rtn("-[NIServerFindingDiscoveryProvider initWithIdentifier:isFinder:enableBluetooth:launchOnDemand:scanRate:discoveryTimeout:oobRefreshPeriod:consumer:queue:]", "NIServerFindingDiscovery.mm", 802, "consumer");
  }
  v21 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = sub_1002E0FBC(v16);
    if (a7 > 34)
    {
      if (a7 > 49)
      {
        if (a7 == 50)
        {
          v23 = "High";
          goto LABEL_23;
        }
        if (a7 == 60)
        {
          v23 = "Max";
          goto LABEL_23;
        }
      }
      else
      {
        if (a7 == 35)
        {
          v23 = "MediumLow";
          goto LABEL_23;
        }
        if (a7 == 40)
        {
          v23 = "Medium";
          goto LABEL_23;
        }
      }
    }
    else if (a7 > 19)
    {
      if (a7 == 20)
      {
        v23 = "Background";
        goto LABEL_23;
      }
      if (a7 == 30)
      {
        v23 = "Low";
        goto LABEL_23;
      }
    }
    else
    {
      if (!a7)
      {
        v23 = "Default";
        goto LABEL_23;
      }
      if (a7 == 10)
      {
        v23 = "Periodic";
LABEL_23:
        *(_DWORD *)buf = 136316418;
        v49 = v22;
        __int16 v50 = 1024;
        BOOL v51 = v15;
        __int16 v52 = 1024;
        BOOL v53 = v14;
        __int16 v54 = 2080;
        v55 = v23;
        __int16 v56 = 2048;
        double v57 = a8;
        __int16 v58 = 2048;
        double v59 = a9;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] init. Enable BT: %d. Launch on demand: %d. Scan rate: %s. Discovery timeout: %0.1f s. OOB refresh: %0.1f s", buf, 0x36u);
        goto LABEL_24;
      }
    }
    v23 = "?";
    goto LABEL_23;
  }
LABEL_24:

  v47.receiver = self;
  v47.super_class = (Class)NIServerFindingDiscoveryProvider;
  v24 = [(NIServerFindingDiscoveryProvider *)&v47 init];
  v25 = v24;
  if (v24)
  {
    std::string::operator=((std::string *)(v24 + 8), (const std::string *)a3);
    v25[32] = v16;
    objc_storeWeak((id *)v25 + 5, v19);
    objc_storeStrong((id *)v25 + 6, a11);
    v25[56] = v15;
    v25[57] = v14;
    *((_DWORD *)v25 + 15) = a7;
    v26 = (void *)*((void *)v25 + 8);
    *((void *)v25 + 8) = 0;

    v25[72] = 0;
    v27 = (void *)*((void *)v25 + 10);
    *((void *)v25 + 10) = 0;

    v25[88] = 0;
    v28 = (void *)*((void *)v25 + 12);
    *((void *)v25 + 12) = 0;

    v29 = (void *)*((void *)v25 + 13);
    *((void *)v25 + 13) = 0;

    v30 = (void *)*((void *)v25 + 25);
    *((void *)v25 + 25) = 0;

    v25[112] = 0;
    v31 = (void *)*((void *)v25 + 15);
    *((void *)v25 + 15) = 0;

    uint64_t v32 = objc_opt_new();
    v33 = (void *)*((void *)v25 + 16);
    *((void *)v25 + 16) = v32;

    uint64_t v34 = objc_opt_new();
    v35 = (void *)*((void *)v25 + 17);
    *((void *)v25 + 17) = v34;

    uint64_t v36 = objc_opt_new();
    v37 = (void *)*((void *)v25 + 18);
    *((void *)v25 + 18) = v36;

    uint64_t v38 = objc_opt_new();
    v39 = (void *)*((void *)v25 + 19);
    *((void *)v25 + 19) = v38;

    *((double *)v25 + 20) = fmax(a8, 30.0);
    uint64_t v40 = objc_opt_new();
    v41 = (void *)*((void *)v25 + 21);
    *((void *)v25 + 21) = v40;

    uint64_t v42 = objc_opt_new();
    v43 = (void *)*((void *)v25 + 22);
    *((void *)v25 + 22) = v42;

    uint64_t v44 = objc_opt_new();
    v45 = (void *)*((void *)v25 + 23);
    *((void *)v25 + 23) = v44;

    *((double *)v25 + 24) = a9;
  }

  return (NIServerFindingDiscoveryProvider *)v25;
}

- (void)activate
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  objc_initWeak(&location, self);
  if (!self->_consumerQueue)
  {
    v3 = (OS_dispatch_queue *)objc_opt_new();
    consumerQueue = self->_consumerQueue;
    self->_consumerQueue = v3;

    [(OS_dispatch_queue *)self->_consumerQueue setDispatchQueue:*(void *)&self->_isFinder];
    v5 = +[NSString stringWithFormat:@"nearbyd%s", sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0))];
    [(OS_dispatch_queue *)self->_consumerQueue setLabel:v5];

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10030B770;
    v27[3] = &unk_1008460E8;
    objc_copyWeak(&v28, &location);
    [(OS_dispatch_queue *)self->_consumerQueue setInterruptionHandler:v27];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10030B7CC;
    v25[3] = &unk_100846110;
    objc_copyWeak(&v26, &location);
    [(OS_dispatch_queue *)self->_consumerQueue setErrorHandler:v25];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10030B840;
    v23[3] = &unk_1008460E8;
    objc_copyWeak(&v24, &location);
    [(OS_dispatch_queue *)self->_consumerQueue setBluetoothStateChangedHandler:v23];
    self->_enableBluetooth = 0;
    v6 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
      *(_DWORD *)buf = 136315138;
      v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] activate controller", buf, 0xCu);
    }

    double v8 = sub_100006C38();
    v9 = self->_consumerQueue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10030B89C;
    v21[3] = &unk_100855D40;
    v22[1] = *(id *)&v8;
    objc_copyWeak(v22, &location);
    [(OS_dispatch_queue *)v9 activateWithCompletion:v21];
    objc_destroyWeak(v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
  }
  if (!self->_controller)
  {
    v10 = (CBController *)objc_opt_new();
    controller = self->_controller;
    self->_controller = v10;

    [(CBController *)self->_controller setDispatchQueue:*(void *)&self->_isFinder];
    v12 = +[NSString stringWithFormat:@"nearbyd%s", sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0))];
    [(CBController *)self->_controller setLabel:v12];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10030BA14;
    v19[3] = &unk_1008460E8;
    objc_copyWeak(&v20, &location);
    [(CBController *)self->_controller setAdvertisingAddressChangedHandler:v19];
    self->_activatedController = 0;
    v13 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
      *(_DWORD *)buf = 136315138;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] activate address observer", buf, 0xCu);
    }

    double v15 = sub_100006C38();
    BOOL v16 = self->_controller;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10030BA70;
    v17[3] = &unk_100855D40;
    v18[1] = *(id *)&v15;
    objc_copyWeak(v18, &location);
    [(CBController *)v16 activateWithCompletion:v17];
    objc_destroyWeak(v18);
    objc_destroyWeak(&v20);
  }
  objc_destroyWeak(&location);
}

- (void)invalidate
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  consumerQueue = self->_consumerQueue;
  if (consumerQueue)
  {
    [(OS_dispatch_queue *)consumerQueue invalidate];
    v4 = self->_consumerQueue;
    self->_consumerQueue = 0;
  }
  controller = self->_controller;
  if (controller)
  {
    [(CBController *)controller invalidate];
    v6 = self->_controller;
    self->_controller = 0;
  }
  addressObserver = self->_addressObserver;
  if (addressObserver)
  {
    [(CBAdvertiser *)addressObserver invalidate];
    double v8 = self->_addressObserver;
    self->_addressObserver = 0;
  }
  v9 = *(void **)&self->_activatedAddressObserver;
  if (v9)
  {
    [v9 invalidate];
    v10 = *(void **)&self->_activatedAddressObserver;
    *(void *)&self->_activatedAddressObserver = 0;

    advertisingTimeoutTimers = self->_advertisingTimeoutTimers;
    self->_advertisingTimeoutTimers = 0;
  }
  self->_enableBluetooth = 0;
  self->_activatedController = 0;
  LOBYTE(self->_nearbyActionNoWakeScanner) = 0;
  discoveryTimeoutTimers = self->_discoveryTimeoutTimers;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10030BD10;
  v13[3] = &unk_100858E68;
  v13[4] = self;
  [(NSMutableDictionary *)discoveryTimeoutTimers enumerateKeysAndObjectsUsingBlock:v13];
  [(NIServerFindingDiscoveryProvider *)self _resetDiscoveryStateForAllPeers];
  [(NIServerFindingDiscoveryProvider *)self _resetAdvertisingStateForAllPeers];
  [*(id *)&self->_activatedScanner removeAllObjects];
  [(NIServerFindingDiscoveryProvider *)self _updateLaunchOnDemandScannerAndRequestScan:0];
}

- (id)setPeersEligibleForDiscovery:(id)a3 requestScan:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
    unsigned int v9 = [v6 count];
    v10 = [v6 allObjects];
    v11 = sub_1002E15E0(v10, 10, 0);
    *(_DWORD *)buf = 136315907;
    uint64_t v36 = v8;
    __int16 v37 = 1024;
    BOOL v38 = v4;
    __int16 v39 = 1024;
    unsigned int v40 = v9;
    __int16 v41 = 2113;
    uint64_t v42 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] setPeersEligibleForDiscovery. requestScan: %d. Peers (%d): %{private}@", buf, 0x22u);
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v6) {
    id v6 = (id)objc_opt_new();
  }
  v12 = objc_opt_new();
  disableScanDupeConfigTimer = self->_disableScanDupeConfigTimer;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10030C18C;
  v32[3] = &unk_100861078;
  id v14 = v6;
  id v33 = v14;
  id v15 = v12;
  id v34 = v15;
  [(OS_dispatch_source *)disableScanDupeConfigTimer enumerateKeysAndObjectsUsingBlock:v32];
  [(OS_dispatch_source *)self->_disableScanDupeConfigTimer removeObjectsForKeys:v15];
  [(NSMutableSet *)self->_eligibleDiscoveryPeers removeObjectsForKeys:v15];
  [v15 removeAllObjects];
  discoveredPeers = self->_discoveredPeers;
  id v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  id v28 = sub_10030C200;
  v29 = &unk_1008610A0;
  id v17 = v14;
  id v30 = v17;
  id v18 = v15;
  id v31 = v18;
  [(NSMutableDictionary *)discoveredPeers enumerateKeysAndObjectsUsingBlock:&v26];
  -[NSMutableDictionary removeObjectsForKeys:](self->_discoveredPeers, "removeObjectsForKeys:", v18, v26, v27, v28, v29);
  id v19 = [v17 mutableCopy];
  id v20 = *(void **)&self->_activatedScanner;
  *(void *)&self->_activatedScanner = v19;

  if (!LOBYTE(self->_consumer))
  {
    v23 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#find-disc,BT not enabled. Skipping configuring scanner.", buf, 2u);
    }
    goto LABEL_14;
  }
  int v21 = sub_1002E0C44(LOBYTE(self->_identifier.__r_.var0) == 0);
  if (v21 == 19)
  {
    uint64_t v22 = [(NIServerFindingDiscoveryProvider *)self _configureSpatialInteractionScannerAndRequestScan:v4];
LABEL_12:
    id v24 = (void *)v22;
    if (v22) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v21 == 26)
  {
    uint64_t v22 = [(NIServerFindingDiscoveryProvider *)self _configureNearbyActionNoWakeScannerAndRequestScan:v4];
    goto LABEL_12;
  }
LABEL_13:
  [(NIServerFindingDiscoveryProvider *)self _updateLaunchOnDemandScannerAndRequestScan:v4];
LABEL_14:
  id v24 = 0;
LABEL_15:

  return v24;
}

- (id)startAdvertisingToPeer:(id)a3 advertisement:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
    *(_DWORD *)buf = 136315907;
    id v26 = v11;
    __int16 v27 = 2113;
    id v28 = v8;
    __int16 v29 = 2048;
    double v30 = a5;
    __int16 v31 = 2113;
    id v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] startAdvertisingToPeer: %{private}@. Timeout: %0.1f s. Advertisement: %{private}@", buf, 0x2Au);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v8)
  {
    id v20 = "token";
    int v21 = 1067;
    goto LABEL_21;
  }
  if (!v9)
  {
    id v20 = "advertisement";
    int v21 = 1068;
LABEL_21:
    __assert_rtn("-[NIServerFindingDiscoveryProvider startAdvertisingToPeer:advertisement:timeout:]", "NIServerFindingDiscovery.mm", v21, v20);
  }
  if (LOBYTE(self->_consumer))
  {
    v12 = +[_FindingAdvertiser sharedInstance];
    v13 = [v12 startAdvertisingAsFinder:LOBYTE(self->_identifier.__r_.var0) toPeer:v8 withAdvertisement:v9];

    if (v13)
    {
      id v14 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10042F344((uint64_t)v13, v14);
      }
      goto LABEL_16;
    }
  }
  else
  {
    id v15 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-disc,BT not enabled. Skipping configuring advertiser.", buf, 2u);
    }
  }
  if (a5 > 0.0) {
    [(NIServerFindingDiscoveryProvider *)self _configureAdvertisementTimeout:v8 forToken:a5];
  }
  BOOL v16 = [(NSMutableDictionary *)self->_discoveryTimeoutTimers objectForKey:v8];
  unsigned __int8 v17 = [v9 isEqual:v16];

  if ((v17 & 1) == 0)
  {
    id v18 = *(NSObject **)&self->_isFinder;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10030C5A8;
    block[3] = &unk_100855EB0;
    block[4] = self;
    id v23 = v9;
    id v24 = v8;
    dispatch_async(v18, block);
  }
  [(NSMutableDictionary *)self->_discoveryTimeoutTimers setObject:v9 forKey:v8];
  v13 = 0;
LABEL_16:

  return v13;
}

- (id)stopAdvertisingToPeer:(id)a3
{
  id v4 = a3;
  v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
    int v18 = 136315395;
    id v19 = v6;
    __int16 v20 = 2113;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] stopAdvertisingToPeer: %{private}@", (uint8_t *)&v18, 0x16u);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v4) {
    __assert_rtn("-[NIServerFindingDiscoveryProvider stopAdvertisingToPeer:]", "NIServerFindingDiscovery.mm", 1105, "token");
  }
  v7 = +[_FindingAdvertiser sharedInstance];
  id v8 = [v7 stopAdvertisingAsFinder:LOBYTE(self->_identifier.__r_.var0) toPeer:v4];

  if (v8)
  {
    id v9 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042F3BC((uint64_t)v8, v9);
    }
    id v10 = v8;
  }
  else
  {
    v11 = [*(id *)&self->_discoveryTimeoutSeconds objectForKey:v4];
    BOOL v12 = v11 == 0;

    if (!v12)
    {
      v13 = [*(id *)&self->_discoveryTimeoutSeconds objectForKey:v4];
      dispatch_source_cancel(v13);

      [*(id *)&self->_discoveryTimeoutSeconds removeObjectForKey:v4];
    }
    id v14 = [(NSMutableDictionary *)self->_advertisingPeers objectForKey:v4];
    BOOL v15 = v14 == 0;

    if (!v15)
    {
      BOOL v16 = [(NSMutableDictionary *)self->_advertisingPeers objectForKey:v4];
      dispatch_source_cancel(v16);

      [(NSMutableDictionary *)self->_advertisingPeers removeObjectForKey:v4];
    }
    [(NSMutableDictionary *)self->_discoveryTimeoutTimers removeObjectForKey:v4];
  }

  return v8;
}

- (NSSet)peersEligibleForDiscovery
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  v3 = *(void **)&self->_activatedScanner;

  return (NSSet *)v3;
}

- (NSDictionary)discoveredPeers
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  disableScanDupeConfigTimer = self->_disableScanDupeConfigTimer;

  return (NSDictionary *)disableScanDupeConfigTimer;
}

- (NSDictionary)advertisingPeers
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  discoveryTimeoutTimers = self->_discoveryTimeoutTimers;

  return (NSDictionary *)discoveryTimeoutTimers;
}

- (array<unsigned)advertisingAddress
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  v3 = [(NIServerFindingDiscoveryProvider *)self _cbAdvertisingAddress];
  uint64_t v4 = (uint64_t)+[NIServerFindingAdvertisement convertCBAddressToRoseAddress:v3];

  return (array<unsigned char, 6UL>)v4;
}

- (id)processAdvertisement:(id)a3 receivedOOBFromPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (qword_1008A9E30 != -1) {
    dispatch_once(&qword_1008A9E30, &stru_1008611D8);
  }
  int v8 = byte_1008A9E38;
  id v9 = (id)qword_1008ABDE0;
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
      int v14 = 136315651;
      BOOL v15 = v11;
      __int16 v16 = 2113;
      id v17 = v7;
      __int16 v18 = 2113;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] IGNORING processAdvertisementReceivedOOB (disabled in defaults). Peer: %{private}@. Adv: %{private}@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    if (v10)
    {
      BOOL v12 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
      int v14 = 136315651;
      BOOL v15 = v12;
      __int16 v16 = 2113;
      id v17 = v7;
      __int16 v18 = 2113;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] processAdvertisementReceivedOOB. Peer: %{private}@. Adv: %{private}@", (uint8_t *)&v14, 0x20u);
    }

    [(NIServerFindingDiscoveryProvider *)self _processReceivedAdvertisement:v6 fromPeer:v7 overBluetooth:0 cbDevice:0];
  }

  return 0;
}

- (id)processLostEventReceivedOOBFromPeer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (qword_1008A9E30 != -1) {
    dispatch_once(&qword_1008A9E30, &stru_1008611D8);
  }
  int v5 = byte_1008A9E38;
  id v6 = (id)qword_1008ABDE0;
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v8 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
      *(_DWORD *)buf = 136315395;
      __int16 v16 = v8;
      __int16 v17 = 2113;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] IGNORING processLostEventReceivedOOB (disabled in defaults). Peer: %{private}@", buf, 0x16u);
    }
  }
  else
  {
    if (v7)
    {
      id v9 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
      *(_DWORD *)buf = 136315395;
      __int16 v16 = v9;
      __int16 v17 = 2113;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] processLostEventReceivedOOB. Peer: %{private}@", buf, 0x16u);
    }

    BOOL v10 = [(OS_dispatch_source *)self->_disableScanDupeConfigTimer objectForKey:v4];

    [(NIServerFindingDiscoveryProvider *)self _resetDiscoveryStateForPeer:v4];
    if (v10)
    {
      v11 = *(NSObject **)&self->_isFinder;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10030CD80;
      v13[3] = &unk_100846588;
      v13[4] = self;
      id v14 = v4;
      dispatch_async(v11, v13);
    }
  }

  return 0;
}

- (id)printableState
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = sub_100308028;
  v82 = sub_100308038;
  id v83 = (id)objc_opt_new();
  v3 = (void *)v79[5];
  id v4 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
  int consumer_high = HIDWORD(self->_consumer);
  if (consumer_high > 34)
  {
    if (consumer_high > 49)
    {
      if (consumer_high == 50)
      {
        id v6 = "High";
        goto LABEL_21;
      }
      if (consumer_high == 60)
      {
        id v6 = "Max";
        goto LABEL_21;
      }
    }
    else
    {
      if (consumer_high == 35)
      {
        id v6 = "MediumLow";
        goto LABEL_21;
      }
      if (consumer_high == 40)
      {
        id v6 = "Medium";
        goto LABEL_21;
      }
    }
LABEL_20:
    id v6 = "?";
    goto LABEL_21;
  }
  if (consumer_high > 19)
  {
    if (consumer_high == 20)
    {
      id v6 = "Background";
      goto LABEL_21;
    }
    if (consumer_high == 30)
    {
      id v6 = "Low";
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (!consumer_high)
  {
    id v6 = "Default";
    goto LABEL_21;
  }
  if (consumer_high != 10) {
    goto LABEL_20;
  }
  id v6 = "Periodic";
LABEL_21:
  BOOL v7 = +[NSString stringWithFormat:@"Discovery provider (%s). EnableBT: %d. LaunchOnDemand: %d. ScanRate: %s. DiscTimeout: %0.1f s. OOBRefresh: %0.1f s", v4, LOBYTE(self->_consumer), BYTE1(self->_consumer), v6, self->_didDiscoverPeerTimestamps, self->_advertisingOOBRefreshTimers];
  [v3 addObject:v7];

  consumerQueue = self->_consumerQueue;
  if (consumerQueue && self->_enableBluetooth)
  {
    id v9 = (void *)v79[5];
    unint64_t v10 = (unint64_t)[(OS_dispatch_queue *)consumerQueue bluetoothState];
    if (v10 > 0xA) {
      v11 = "?";
    }
    else {
      v11 = off_1008611F8[v10];
    }
    v13 = +[NSString stringWithFormat:@"    BT state: %s", v11];
    [v9 addObject:v13];
  }
  else
  {
    BOOL v12 = (void *)v79[5];
    v13 = +[NSString stringWithFormat:@"    BT state unknown. Controller: %d. Activated: %d", consumerQueue != 0, self->_enableBluetooth];
    [v12 addObject:v13];
  }

  controller = self->_controller;
  if (controller && self->_activatedController)
  {
    BOOL v15 = (void *)v79[5];
    __int16 v16 = [(CBController *)controller advertisingAddressDataNonConnectable];
    __int16 v17 = CUPrintNSDataAddress();
    id v18 = [(CBController *)self->_controller advertisingAddressDataConnectable];
    id v19 = CUPrintNSDataAddress();
    __int16 v20 = +[NSString stringWithFormat:@"    Addresses: NCA %@, CA %@.", v17, v19];
    [v15 addObject:v20];
  }
  else
  {
    id v21 = (void *)v79[5];
    __int16 v16 = +[NSString stringWithFormat:@"    Address unknown. Observer: %d. Activated: %d", controller != 0, self->_activatedController];
    [v21 addObject:v16];
  }

  addressObserver = self->_addressObserver;
  if (addressObserver)
  {
    id v23 = (void *)v79[5];
    if (LOBYTE(self->_nearbyActionNoWakeScanner))
    {
      int v24 = [(CBAdvertiser *)addressObserver bleScanRate];
      if (v24 > 34)
      {
        if (v24 > 49)
        {
          if (v24 == 50)
          {
            v25 = "High";
            goto LABEL_62;
          }
          if (v24 == 60)
          {
            v25 = "Max";
            goto LABEL_62;
          }
        }
        else
        {
          if (v24 == 35)
          {
            v25 = "MediumLow";
            goto LABEL_62;
          }
          if (v24 == 40)
          {
            v25 = "Medium";
            goto LABEL_62;
          }
        }
      }
      else if (v24 > 19)
      {
        if (v24 == 20)
        {
          v25 = "Background";
          goto LABEL_62;
        }
        if (v24 == 30)
        {
          v25 = "Low";
          goto LABEL_62;
        }
      }
      else
      {
        if (!v24)
        {
          v25 = "Default";
          goto LABEL_62;
        }
        if (v24 == 10)
        {
          v25 = "Periodic";
LABEL_62:
          id v28 = [(CBAdvertiser *)self->_addressObserver oobKeys];
          id v30 = [v28 count];
          if (self->_spatialInteractionScanner) {
            __int16 v31 = "Y";
          }
          else {
            __int16 v31 = "N";
          }
          id v32 = +[NSString stringWithFormat:@"    T26 scan rate: %s. OOB keys: %d. Disabling scan dupes pending: %s", v25, v30, v31];
          [v23 addObject:v32];

          goto LABEL_66;
        }
      }
      v25 = "?";
      goto LABEL_62;
    }
    if (self->_spatialInteractionScanner) {
      __int16 v29 = "Y";
    }
    else {
      __int16 v29 = "N";
    }
    id v28 = +[NSString stringWithFormat:@"    T26 scanner still activating. Disabling scan dupes pending: %s", v29];
    [v23 addObject:v28];
  }
  else
  {
    id v26 = (void *)v79[5];
    if (self->_spatialInteractionScanner) {
      __int16 v27 = "Y";
    }
    else {
      __int16 v27 = "N";
    }
    id v28 = +[NSString stringWithFormat:@"    T26 scanner nil. Disabling scan dupes pending: %s", v27];
    [v26 addObject:v28];
  }
LABEL_66:

  if (!*(void *)&self->_activatedAddressObserver)
  {
    id v33 = (void *)v79[5];
    CFStringRef v39 = @"    T19 scanner nil";
LABEL_75:
    [v33 addObject:v39];
    goto LABEL_92;
  }
  id v33 = (void *)v79[5];
  if (!LOBYTE(self->_nearbyActionNoWakeScanner))
  {
    CFStringRef v39 = @"    T19 scanner still activating";
    goto LABEL_75;
  }
  id v34 = sub_1002E10F4(self->_advertisingTimeoutTimers);
  v35 = +[NSString stringWithFormat:@"    T19 scanner activation time: %@", v34];
  [v33 addObject:v35];

  uint64_t v36 = (void *)v79[5];
  int v37 = [*(id *)&self->_activatedAddressObserver scanRate];
  if (v37 > 34)
  {
    if (v37 > 49)
    {
      if (v37 == 50)
      {
        BOOL v38 = "High";
        goto LABEL_91;
      }
      if (v37 == 60)
      {
        BOOL v38 = "Max";
        goto LABEL_91;
      }
    }
    else
    {
      if (v37 == 35)
      {
        BOOL v38 = "MediumLow";
        goto LABEL_91;
      }
      if (v37 == 40)
      {
        BOOL v38 = "Medium";
        goto LABEL_91;
      }
    }
LABEL_90:
    BOOL v38 = "?";
    goto LABEL_91;
  }
  if (v37 > 19)
  {
    if (v37 == 20)
    {
      BOOL v38 = "Background";
      goto LABEL_91;
    }
    if (v37 == 30)
    {
      BOOL v38 = "Low";
      goto LABEL_91;
    }
    goto LABEL_90;
  }
  if (!v37)
  {
    BOOL v38 = "Default";
    goto LABEL_91;
  }
  if (v37 != 10) {
    goto LABEL_90;
  }
  BOOL v38 = "Periodic";
LABEL_91:
  unsigned int v40 = +[NSString stringWithFormat:@"    T19 scan rate: %s", v38];
  [v36 addObject:v40];

LABEL_92:
  __int16 v41 = (void *)v79[5];
  uint64_t v42 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"    Eligible discovery peers (%d)", [*(id *)&self->_activatedScanner count]);
  [v41 addObject:v42];

  v43 = (void *)v79[5];
  uint64_t v44 = [*(id *)&self->_activatedScanner allObjects];
  v45 = sub_1002E15E0(v44, 10, 2);
  [v43 addObjectsFromArray:v45];

  v46 = (void *)v79[5];
  objc_super v47 = +[NSString stringWithFormat:@"    Discovered peers (%d)", [(OS_dispatch_source *)self->_disableScanDupeConfigTimer count]];
  [v46 addObject:v47];

  disableScanDupeConfigTimer = self->_disableScanDupeConfigTimer;
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_10030D9B4;
  v77[3] = &unk_1008610C8;
  v77[4] = &v78;
  [(OS_dispatch_source *)disableScanDupeConfigTimer enumerateKeysAndObjectsUsingBlock:v77];
  v49 = (void *)v79[5];
  __int16 v50 = +[NSString stringWithFormat:@"    Timestamps for didDiscoverPeer (%d)", [(NSMutableSet *)self->_eligibleDiscoveryPeers count]];
  [v49 addObject:v50];

  eligibleDiscoveryPeers = self->_eligibleDiscoveryPeers;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_10030DA88;
  v76[3] = &unk_1008610F0;
  v76[4] = &v78;
  [(NSMutableSet *)eligibleDiscoveryPeers enumerateKeysAndObjectsUsingBlock:v76];
  __int16 v52 = (void *)v79[5];
  BOOL v53 = +[NSString stringWithFormat:@"    Discovery timeout timers (%d)", [(NSMutableDictionary *)self->_discoveredPeers count]];
  [v52 addObject:v53];

  __int16 v54 = (void *)v79[5];
  v55 = [(NSMutableDictionary *)self->_discoveredPeers allKeys];
  __int16 v56 = sub_1002E15E0(v55, 10, 2);
  [v54 addObjectsFromArray:v56];

  double v57 = (void *)v79[5];
  __int16 v58 = +[NSString stringWithFormat:@"    Advertising peers (%d)", [(NSMutableDictionary *)self->_discoveryTimeoutTimers count]];
  [v57 addObject:v58];

  discoveryTimeoutTimers = self->_discoveryTimeoutTimers;
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_10030DB78;
  v75[3] = &unk_1008610C8;
  v75[4] = &v78;
  [(NSMutableDictionary *)discoveryTimeoutTimers enumerateKeysAndObjectsUsingBlock:v75];
  v60 = (void *)v79[5];
  v61 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"    Advertising OOB refresh timers (%d)", [*(id *)&self->_discoveryTimeoutSeconds count]);
  [v60 addObject:v61];

  v62 = (void *)v79[5];
  v63 = [*(id *)&self->_discoveryTimeoutSeconds allKeys];
  v64 = sub_1002E15E0(v63, 10, 2);
  [v62 addObjectsFromArray:v64];

  v65 = (void *)v79[5];
  v66 = +[NSString stringWithFormat:@"    Advertising timeout timers (%d)", [(NSMutableDictionary *)self->_advertisingPeers count]];
  [v65 addObject:v66];

  v67 = (void *)v79[5];
  v68 = [(NSMutableDictionary *)self->_advertisingPeers allKeys];
  v69 = sub_1002E15E0(v68, 10, 2);
  [v67 addObjectsFromArray:v69];

  v70 = (void *)v79[5];
  v71 = +[_FindingAdvertiser sharedInstance];
  v72 = [v71 printableState];
  [v70 addObjectsFromArray:v72];

  id v73 = (id)v79[5];
  _Block_object_dispose(&v78, 8);

  return v73;
}

- (void)_resetDiscoveryStateForPeer:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  [(OS_dispatch_source *)self->_disableScanDupeConfigTimer removeObjectForKey:v6];
  [(NSMutableSet *)self->_eligibleDiscoveryPeers removeObjectForKey:v6];
  id v4 = [(NSMutableDictionary *)self->_discoveredPeers objectForKey:v6];

  if (v4)
  {
    int v5 = [(NSMutableDictionary *)self->_discoveredPeers objectForKey:v6];
    dispatch_source_cancel(v5);
  }
  [(NSMutableDictionary *)self->_discoveredPeers removeObjectForKey:v6];
  if (![(OS_dispatch_source *)self->_disableScanDupeConfigTimer count]
    && sub_1002E0C44(LOBYTE(self->_identifier.__r_.var0) == 0) == 26)
  {
    [(NIServerFindingDiscoveryProvider *)self _nearbyActionNoWakeDisableScanDupesIfNecessary];
  }
}

- (void)_resetDiscoveryStateForAllPeers
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  [(OS_dispatch_source *)self->_disableScanDupeConfigTimer removeAllObjects];
  [(NSMutableSet *)self->_eligibleDiscoveryPeers removeAllObjects];
  [(NSMutableDictionary *)self->_discoveredPeers enumerateKeysAndObjectsUsingBlock:&stru_100861130];
  discoveredPeers = self->_discoveredPeers;

  [(NSMutableDictionary *)discoveredPeers removeAllObjects];
}

- (void)_resetAdvertisingStateForAllPeers
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  [(NSMutableDictionary *)self->_discoveryTimeoutTimers removeAllObjects];
  [*(id *)&self->_discoveryTimeoutSeconds enumerateKeysAndObjectsUsingBlock:&stru_100861150];
  [*(id *)&self->_discoveryTimeoutSeconds removeAllObjects];
  [(NSMutableDictionary *)self->_advertisingPeers enumerateKeysAndObjectsUsingBlock:&stru_100861170];
  advertisingPeers = self->_advertisingPeers;

  [(NSMutableDictionary *)advertisingPeers removeAllObjects];
}

- (void)_processReceivedAdvertisement:(id)a3 fromPeer:(id)a4 overBluetooth:(BOOL)a5 cbDevice:(id)a6
{
  BOOL v7 = a5;
  id v34 = a3;
  id v10 = a4;
  id v33 = a6;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  v11 = [(OS_dispatch_source *)self->_disableScanDupeConfigTimer objectForKey:v10];
  BOOL v12 = [(NSMutableSet *)self->_eligibleDiscoveryPeers objectForKey:v10];
  v13 = +[NSDate now];
  if (v11)
  {
    unsigned int v14 = [v34 isEqual:v11] ^ 1;
    if (v12) {
      goto LABEL_3;
    }
LABEL_13:
    BOOL v16 = 1;
    goto LABEL_14;
  }
  unsigned int v14 = 1;
  if (!v12) {
    goto LABEL_13;
  }
LABEL_3:
  [v13 timeIntervalSinceDate:v12];
  BOOL v16 = v15 >= 2.0;
  if (v15 >= 2.0) {
    int v17 = 1;
  }
  else {
    int v17 = v14;
  }
  if (v17 != 1)
  {
    id v18 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
      __int16 v20 = "OOB";
      *(_DWORD *)buf = 136315907;
      unsigned int v40 = v19;
      __int16 v41 = 2080;
      if (v7) {
        __int16 v20 = "BT";
      }
      uint64_t v42 = v20;
      __int16 v43 = 2113;
      id v44 = v10;
      __int16 v45 = 2113;
      *(void *)v46 = v33;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "#find-disc,[%s] Found device (%s) for token %{private}@, but ignoring. Device: %{private}@", buf, 0x2Au);
    }
LABEL_38:

    goto LABEL_39;
  }
LABEL_14:
  id v21 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
    id v23 = "OOB";
    *(_DWORD *)buf = 136316419;
    unsigned int v40 = v22;
    __int16 v41 = 2080;
    if (v7) {
      id v23 = "BT";
    }
    uint64_t v42 = v23;
    __int16 v43 = 2113;
    id v44 = v10;
    __int16 v45 = 1024;
    *(_DWORD *)v46 = v14;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v16;
    __int16 v47 = 2113;
    id v48 = v33;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] Found device (%s) for token %{private}@. IsNew: %d. BeenTooLong: %d. Device: %{private}@", buf, 0x36u);
  }

  if (v7 && sub_1002E0C44((int)[v34 isFinder]) == 19)
  {
    id v18 = +[NSDate now];
    [v18 timeIntervalSinceDate:self->_advertisingTimeoutTimers];
    double v25 = v24;
    if (v24 < 0.1)
    {
      id v32 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unsigned int v40 = *(const char **)&v25;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#find-disc,DO NOT PROCESS: Stale advertisment thats a cached dupe from previously configured scanner (delivery time from when scanner was configured = %f)", buf, 0xCu);
      }
      goto LABEL_38;
    }
  }
  if ([*(id *)&self->_activatedScanner containsObject:v10])
  {
    [(OS_dispatch_source *)self->_disableScanDupeConfigTimer setObject:v34 forKey:v10];
    [(NSMutableSet *)self->_eligibleDiscoveryPeers setObject:v13 forKey:v10];
    [(NIServerFindingDiscoveryProvider *)self _configureDiscoveryTimeout:v10 forToken:*(double *)&self->_didDiscoverPeerTimestamps];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    __int16 v27 = WeakRetained;
    if (v7)
    {
      [WeakRetained didDiscoverPeer:v10 advertisement:v34 overBluetooth:1];
    }
    else
    {
      id v28 = *(NSObject **)&self->_isFinder;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10030E398;
      block[3] = &unk_100855EB0;
      id v36 = WeakRetained;
      id v37 = v10;
      id v38 = v34;
      dispatch_async(v28, block);
    }
    if (sub_1002E0C44(LOBYTE(self->_identifier.__r_.var0) == 0) == 26)
    {
      if (((unint64_t)[(CBAdvertiser *)self->_addressObserver discoveryFlags] & 0x200100000) == 0)
      {
        __int16 v29 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: enabling scan dupes", buf, 2u);
        }
        [(CBAdvertiser *)self->_addressObserver setDiscoveryFlags:(unint64_t)[(CBAdvertiser *)self->_addressObserver discoveryFlags] | 0x200100000];
      }
      spatialInteractionScanner = self->_spatialInteractionScanner;
      if (spatialInteractionScanner)
      {
        dispatch_source_cancel(spatialInteractionScanner);
        __int16 v31 = self->_spatialInteractionScanner;
        self->_spatialInteractionScanner = 0;
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10042F434();
  }
LABEL_39:
}

- (void)_cbDeviceFoundHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v4) {
    __assert_rtn("-[NIServerFindingDiscoveryProvider _cbDeviceFoundHandler:]", "NIServerFindingDiscovery.mm", 1429, "device");
  }
  if ((self->_addressObserver || *(void *)&self->_activatedAddressObserver)
    && LOBYTE(self->_nearbyActionNoWakeScanner))
  {
    uint64_t v5 = sub_1002E0C44(LOBYTE(self->_identifier.__r_.var0) == 0);
    id v6 = [(NIServerFindingDiscoveryProvider *)self _getDiscoveryTokenFromCBDevice:v4 advertisementType:v5];
    if (v6)
    {
      BOOL v7 = [(NIServerFindingDiscoveryProvider *)self _getAdvertisementFromCBDevice:v4 advertisementType:v5];
      if (v7)
      {
        [(NIServerFindingDiscoveryProvider *)self _processReceivedAdvertisement:v7 fromPeer:v6 overBluetooth:1 cbDevice:v4];
      }
      else
      {
        id v9 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
          sub_10042F49C((uint64_t)v10, (uint64_t)v4, (uint8_t *)&v11, v9);
        }
      }
    }
    else
    {
      BOOL v7 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
        int v11 = 136315395;
        BOOL v12 = v8;
        __int16 v13 = 2113;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#find-disc,[%s] Found device (BT) but cannot resolve discovery token. Device: %{private}@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10042F468();
  }
}

- (void)_cbAdvertisingAddressChangedHandler
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (self->_controller && self->_activatedController)
  {
    v3 = [(NIServerFindingDiscoveryProvider *)self _cbAdvertisingAddress];
    uint64_t v4 = (uint64_t)+[NIServerFindingAdvertisement convertCBAddressToRoseAddress:v3];
    uint64_t v5 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
      BOOL v7 = CUPrintNSDataAddress();
      *(_DWORD *)buf = 136315395;
      uint64_t v22 = v6;
      __int16 v23 = 2113;
      double v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] BT address changed: %{private}@", buf, 0x16u);
    }
    int v8 = [(NSMutableDictionary *)self->_discoveryTimeoutTimers allKeys];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    id v18[2] = sub_10030E90C;
    v18[3] = &unk_100861198;
    v18[4] = self;
    int v19 = v4;
    __int16 v20 = WORD2(v4);
    [v8 enumerateObjectsUsingBlock:v18];
    if (LOBYTE(self->_consumer))
    {
      discoveryTimeoutTimers = self->_discoveryTimeoutTimers;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10030E9D4;
      v17[3] = &unk_100858E68;
      void v17[4] = self;
      [(NSMutableDictionary *)discoveryTimeoutTimers enumerateKeysAndObjectsUsingBlock:v17];
    }
    else
    {
      id v10 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-disc,BT not enabled. Skipping updating advertiser on address change.", buf, 2u);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    BOOL v12 = self->_discoveryTimeoutTimers;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10030EA88;
    v14[3] = &unk_100861078;
    id v15 = WeakRetained;
    BOOL v16 = self;
    id v13 = WeakRetained;
    [(NSMutableDictionary *)v12 enumerateKeysAndObjectsUsingBlock:v14];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10042F4F4();
  }
}

- (id)_cbAdvertisingAddress
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  __int16 v12 = 0;
  int v11 = 0;
  v3 = +[NSData dataWithBytes:&v11 length:6];
  uint64_t v4 = v3;
  if (!self->_controller || !self->_activatedController)
  {
    id v7 = v3;
    goto LABEL_14;
  }
  int v5 = sub_1002E0C44(LOBYTE(self->_identifier.__r_.var0));
  if (v5 == 19)
  {
    id v6 = [(CBController *)self->_controller advertisingAddressDataNonConnectable];
  }
  else
  {
    if (v5 != 26)
    {
      int v8 = 0;
LABEL_12:
      id v9 = v4;
      goto LABEL_13;
    }
    id v6 = [(CBController *)self->_controller advertisingAddressDataConnectable];
  }
  int v8 = v6;
  if (!v6 || (unint64_t)[v6 length] <= 5) {
    goto LABEL_12;
  }
  id v9 = v8;
  int v8 = v9;
LABEL_13:
  id v7 = v9;

LABEL_14:

  return v7;
}

- (void)_cbBluetoothStateChangedHandler
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  consumerQueue = self->_consumerQueue;
  if (consumerQueue && self->_enableBluetooth)
  {
    unint64_t v4 = (unint64_t)[(OS_dispatch_queue *)consumerQueue bluetoothState];
    int v5 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
      if (v4 > 0xA) {
        id v7 = "?";
      }
      else {
        id v7 = off_1008611F8[v4];
      }
      int v11 = 136315394;
      __int16 v12 = v6;
      __int16 v13 = 2080;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] BT state changed: %s", (uint8_t *)&v11, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    id v9 = WeakRetained;
    switch(v4)
    {
      case 1uLL:
      case 4uLL:
        [WeakRetained bluetoothDiscoveryBecameUnavailable];
        break;
      case 2uLL:
      case 3uLL:
        id v10 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
          sub_10042F55C(v4, v10);
        }
        break;
      case 5uLL:
        [WeakRetained bluetoothDiscoveryBecameAvailable];
        break;
      default:
        break;
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10042F528();
  }
}

- (void)_cbInterruptionHandler
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (self->_consumerQueue && self->_enableBluetooth)
  {
    v3 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v4 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
      int v6 = 136315138;
      id v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-disc,[%s] BT interrupted", (uint8_t *)&v6, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    [WeakRetained bluetoothDiscoveryBecameUnavailable];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10042F5E8();
  }
}

- (void)_cbErrorHandler:(id)a3
{
  id v4 = a3;
  int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
    sub_10042F61C((uint64_t)v6, (uint64_t)v4, v7, v5);
  }
}

- (id)_nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers
{
  v3 = objc_opt_new();
  id v4 = *(void **)&self->_activatedScanner;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10030F0B8;
  v7[3] = &unk_100858FC0;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

- (void)_nearbyActionNoWakeDisableScanDupesIfNecessary
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  spatialInteractionScanner = self->_spatialInteractionScanner;
  if (spatialInteractionScanner)
  {
    dispatch_source_cancel(spatialInteractionScanner);
    id v4 = self->_spatialInteractionScanner;
    self->_spatialInteractionScanner = 0;
  }
  id v5 = (CBSpatialInteractionSession *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)&self->_isFinder);
  int v6 = self->_spatialInteractionScanner;
  self->_spatialInteractionScanner = v5;

  id v7 = self->_spatialInteractionScanner;
  dispatch_time_t v8 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  id v9 = self->_spatialInteractionScanner;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10030F2C8;
  v10[3] = &unk_1008460E8;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_event_handler(v9, v10);
  dispatch_resume((dispatch_object_t)self->_spatialInteractionScanner);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)_configureNearbyActionNoWakeScannerAndRequestScan:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  id v5 = [*(id *)&self->_activatedScanner count];
  addressObserver = self->_addressObserver;
  if (v5 && v3)
  {
    if (addressObserver)
    {
      if (LOBYTE(self->_nearbyActionNoWakeScanner))
      {
        id v7 = [(NIServerFindingDiscoveryProvider *)self _nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers];
        [(CBAdvertiser *)self->_addressObserver setOobKeys:v7];

        if (((unint64_t)[(CBAdvertiser *)self->_addressObserver discoveryFlags] & 0x200100000) == 0)
        {
          dispatch_time_t v8 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: enabling scan dupes", (uint8_t *)&buf, 2u);
          }
          [(CBAdvertiser *)self->_addressObserver setDiscoveryFlags:(unint64_t)[(CBAdvertiser *)self->_addressObserver discoveryFlags] | 0x200100000];
        }
        if (![(OS_dispatch_source *)self->_disableScanDupeConfigTimer count]) {
          [(NIServerFindingDiscoveryProvider *)self _nearbyActionNoWakeDisableScanDupesIfNecessary];
        }
      }
      else
      {
        int v19 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: scanner still activating", (uint8_t *)&buf, 2u);
        }
      }
    }
    else
    {
      __int16 v12 = (CBAdvertiser *)objc_opt_new();
      __int16 v13 = self->_addressObserver;
      self->_addressObserver = v12;

      [(CBAdvertiser *)self->_addressObserver setDispatchQueue:*(void *)&self->_isFinder];
      id v14 = +[NSString stringWithFormat:@"nearbyd%s", sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0))];
      [(CBAdvertiser *)self->_addressObserver setLabel:v14];

      [(CBAdvertiser *)self->_addressObserver setUseCase:458753];
      objc_initWeak(&buf, self);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10030F828;
      v24[3] = &unk_1008460C0;
      objc_copyWeak(&v25, &buf);
      [(CBAdvertiser *)self->_addressObserver setDeviceFoundHandler:v24];
      [(CBAdvertiser *)self->_addressObserver setBleScanRate:HIDWORD(self->_consumer)];
      [(CBAdvertiser *)self->_addressObserver setBleRSSIThresholdHint:4294967176];
      [(CBAdvertiser *)self->_addressObserver setDiscoveryFlags:(unint64_t)[(CBAdvertiser *)self->_addressObserver discoveryFlags] | 0x80242100000];
      [(CBAdvertiser *)self->_addressObserver addDiscoveryType:16];
      id v15 = [(NIServerFindingDiscoveryProvider *)self _nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers];
      [(CBAdvertiser *)self->_addressObserver setOobKeys:v15];

      LOBYTE(self->_nearbyActionNoWakeScanner) = 0;
      BOOL v16 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: activating scanner (enabling scan dupes)", v23, 2u);
      }
      double v17 = sub_100006C38();
      id v18 = self->_addressObserver;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10030F89C;
      v21[3] = &unk_100855D40;
      v22[1] = *(id *)&v17;
      objc_copyWeak(v22, &buf);
      [(CBAdvertiser *)v18 activateWithCompletion:v21];
      objc_destroyWeak(v22);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&buf);
    }
  }
  else
  {
    if (addressObserver)
    {
      [(CBAdvertiser *)addressObserver invalidate];
      id v9 = self->_addressObserver;
      self->_addressObserver = 0;

      LOBYTE(self->_nearbyActionNoWakeScanner) = 0;
    }
    id v10 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = [*(id *)&self->_activatedScanner count];
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = v11;
      __int16 v27 = 1024;
      BOOL v28 = v3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: not configuring scanner. Eligible discovery peers: %d. Request scan: %d.", (uint8_t *)&buf, 0xEu);
    }
  }
  return 0;
}

- (id)_configureSpatialInteractionScannerAndRequestScan:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  id v5 = *(void **)&self->_activatedAddressObserver;
  if (v5)
  {
    [v5 invalidate];
    int v6 = *(void **)&self->_activatedAddressObserver;
    *(void *)&self->_activatedAddressObserver = 0;

    advertisingTimeoutTimers = self->_advertisingTimeoutTimers;
    self->_advertisingTimeoutTimers = 0;

    LOBYTE(self->_nearbyActionNoWakeScanner) = 0;
  }
  if ([*(id *)&self->_activatedScanner count] && v3)
  {
    uint64_t v8 = objc_opt_new();
    id v9 = *(void **)&self->_activatedAddressObserver;
    *(void *)&self->_activatedAddressObserver = v8;

    [*(id *)&self->_activatedAddressObserver setDispatchQueue:*(void *)&self->_isFinder];
    id v10 = +[NSString stringWithFormat:@"nearbyd%s", sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0))];
    [*(id *)&self->_activatedAddressObserver setLabel:v10];

    [*(id *)&self->_activatedAddressObserver setControlFlags:12296];
    [*(id *)&self->_activatedAddressObserver setScanRate:HIDWORD(self->_consumer)];
    [*(id *)&self->_activatedAddressObserver setBleRSSIThresholdOrder:132];
    [*(id *)&self->_activatedAddressObserver setBleRSSIThresholdHint:4294967176];
    objc_initWeak(&location, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10030FDDC;
    v20[3] = &unk_1008460C0;
    objc_copyWeak(&v21, &location);
    [*(id *)&self->_activatedAddressObserver setDeviceFoundHandler:v20];
    LOBYTE(self->_nearbyActionNoWakeScanner) = 0;
    unsigned int v11 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#find-disc,SpatialInteraction: activating scanner", buf, 2u);
    }
    double v12 = sub_100006C38();
    __int16 v13 = *(void **)&self->_activatedAddressObserver;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10030FE50;
    v17[3] = &unk_100855D40;
    v18[1] = *(id *)&v12;
    objc_copyWeak(v18, &location);
    [v13 activateWithCompletion:v17];
    objc_destroyWeak(v18);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    id v14 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = [*(id *)&self->_activatedScanner count];
      LODWORD(location) = 67109376;
      HIDWORD(location) = v15;
      __int16 v23 = 1024;
      BOOL v24 = v3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-disc,SpatialInteraction: not configuring scanner. Eligible discovery peers: %d. Request scan: %d.", (uint8_t *)&location, 0xEu);
    }
  }
  return 0;
}

- (void)_updateLaunchOnDemandScannerAndRequestScan:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (BYTE1(self->_consumer) && sub_1002E0C44(LOBYTE(self->_identifier.__r_.var0) == 0) == 26)
  {
    uint64_t v14 = 0;
    unsigned int v15 = &v14;
    uint64_t v16 = 0x3032000000;
    double v17 = sub_100308028;
    id v18 = sub_100308038;
    id v19 = xpc_array_create(0, 0);
    if (v3)
    {
      id v5 = *(void **)&self->_activatedScanner;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1003105E0;
      v13[3] = &unk_1008579C0;
      v13[4] = &v14;
      [v5 enumerateObjectsUsingBlock:v13];
    }
    xpc_object_t v6 = xpc_array_create(0, 0);
    xpc_object_t v7 = xpc_array_create(0, 0);
    if ([*(id *)&self->_activatedScanner count] && v3)
    {
      xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, "ScreenOff");
      xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, "BLEAdvertisementData");
      xpc_array_set_string(v7, 0xFFFFFFFFFFFFFFFFLL, "PrecisionFinding");
    }
    uint64_t v8 = (void *)xpc_copy_event();
    if (+[NIPlatformInfo isInternalBuild])
    {
      id v9 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = CUPrintXPC();
        *(_DWORD *)id buf = 138739971;
        id v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#find-disc,Configuring launch on demand. XPC event before update: %{sensitive}@", buf, 0xCu);
      }
    }
    xpc_dictionary_set_value(v8, "oobKeys", (xpc_object_t)v15[5]);
    xpc_dictionary_set_value(v8, "discoveryFlags", v6);
    xpc_dictionary_set_value(v8, "discoveryTypes", v7);
    if (+[NIPlatformInfo isInternalBuild])
    {
      unsigned int v11 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        double v12 = CUPrintXPC();
        *(_DWORD *)id buf = 138739971;
        id v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#find-disc,XPC event after update: %{sensitive}@", buf, 0xCu);
      }
    }
    xpc_set_event();

    _Block_object_dispose(&v14, 8);
  }
}

- (void)_configureAdvertisementOOBRefreshTimerForToken:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_identifier.__r_.var0))
  {
    id v5 = [*(id *)&self->_discoveryTimeoutSeconds objectForKey:v4];
    xpc_object_t v6 = v5;
    if (v5)
    {
      dispatch_source_cancel(v5);
      [*(id *)&self->_discoveryTimeoutSeconds removeObjectForKey:v4];
    }
    xpc_object_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)&self->_isFinder);

    dispatch_time_t v8 = dispatch_time(0, (unint64_t)(*(double *)&self->_advertisingOOBRefreshTimers * 1000000000.0));
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak(&location, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100310908;
    handler[3] = &unk_1008463A0;
    objc_copyWeak(&v12, &location);
    id v9 = v4;
    id v11 = v9;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume(v7);
    [*(id *)&self->_discoveryTimeoutSeconds setObject:v7 forKey:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_configureAdvertisementTimeout:(double)a3 forToken:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (a3 <= 0.0) {
    __assert_rtn("-[NIServerFindingDiscoveryProvider _configureAdvertisementTimeout:forToken:]", "NIServerFindingDiscovery.mm", 1941, "timeoutSeconds > 0.0");
  }
  xpc_object_t v7 = [(NSMutableDictionary *)self->_advertisingPeers objectForKey:v6];
  dispatch_time_t v8 = v7;
  if (v7)
  {
    dispatch_source_cancel(v7);
    [(NSMutableDictionary *)self->_advertisingPeers removeObjectForKey:v6];
  }
  id v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)&self->_isFinder);

  dispatch_time_t v10 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100310BCC;
  handler[3] = &unk_1008463A0;
  objc_copyWeak(&v14, &location);
  id v11 = v6;
  id v13 = v11;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume(v9);
  [(NSMutableDictionary *)self->_advertisingPeers setObject:v9 forKey:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_configureDiscoveryTimeout:(double)a3 forToken:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  xpc_object_t v7 = [(NSMutableDictionary *)self->_discoveredPeers objectForKey:v6];
  dispatch_time_t v8 = v7;
  if (v7)
  {
    dispatch_source_cancel(v7);
    [(NSMutableDictionary *)self->_discoveredPeers removeObjectForKey:v6];
  }
  id v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)&self->_isFinder);

  dispatch_time_t v10 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100310E58;
  handler[3] = &unk_1008463A0;
  objc_copyWeak(&v14, &location);
  id v11 = v6;
  id v13 = v11;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume(v9);
  [(NSMutableDictionary *)self->_discoveredPeers setObject:v9 forKey:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)_getDiscoveryTokenFromCBDevice:(id)a3 advertisementType:(int)a4
{
  id v6 = a3;
  xpc_object_t v7 = v6;
  if (!v6) {
    __assert_rtn("-[NIServerFindingDiscoveryProvider _getDiscoveryTokenFromCBDevice:advertisementType:]", "NIServerFindingDiscovery.mm", 2023, "device");
  }
  dispatch_time_t v8 = [v6 btAddressData];

  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042F7AC();
    }
    goto LABEL_9;
  }
  if (a4 != 26)
  {
    if (a4 != 19) {
      goto LABEL_10;
    }
    id v9 = [v7 spatialInteractionTokenData];

    if (v9)
    {
      dispatch_time_t v10 = [NIDiscoveryToken alloc];
      id v11 = [v7 spatialInteractionTokenData];
      self = [(NIDiscoveryToken *)v10 initWithBytes:v11];

      goto LABEL_10;
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042F7E0();
    }
    goto LABEL_9;
  }
  id v13 = [v7 nearbyActionNoWakeAuthTagData];

  if (!v13)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042F814();
    }
LABEL_9:
    self = 0;
    goto LABEL_10;
  }
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100308028;
  uint64_t v22 = sub_100308038;
  id v23 = 0;
  id v14 = *(void **)&self->_activatedScanner;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003111AC;
  v15[3] = &unk_100858DA0;
  id v16 = v7;
  double v17 = &v18;
  [v14 enumerateObjectsUsingBlock:v15];
  self = (NIServerFindingDiscoveryProvider *)(id)v19[5];

  _Block_object_dispose(&v18, 8);
LABEL_10:

  return self;
}

- (id)_getAdvertisementFromCBDevice:(id)a3 advertisementType:(int)a4
{
  id v6 = a3;
  xpc_object_t v7 = v6;
  if (!v6) {
    __assert_rtn("-[NIServerFindingDiscoveryProvider _getAdvertisementFromCBDevice:advertisementType:]", "NIServerFindingDiscovery.mm", 2065, "device");
  }
  dispatch_time_t v8 = [v6 btAddressData];
  uint64_t v9 = (uint64_t)+[NIServerFindingAdvertisement convertCBAddressToRoseAddress:v8];
  int v23 = v9;
  __int16 v24 = WORD2(v9);

  if (a4 == 19)
  {
    id v14 = [v7 spatialInteractionUWBConfigData];
    id v15 = [v14 length];

    if ((unint64_t)v15 > 4)
    {
      id v16 = [NIServerSpatialInteractionPayload alloc];
      double v17 = [v7 spatialInteractionUWBConfigData];
      id v12 = [(NIServerSpatialInteractionPayload *)v16 initWithUWBConfigData:v17];

      if ([(NIServerSpatialInteractionPayload *)v12 findingEnabled])
      {
        unsigned __int16 v18 = [(NIServerSpatialInteractionPayload *)v12 findingConfig];
        unsigned __int16 v19 = [(NIServerSpatialInteractionPayload *)v12 findingConfig2];
        uint64_t v20 = operator new(2uLL);
        *uint64_t v20 = v18 | (v19 << 8);
        id v21 = +[NSData dataWithBytes:v20 length:2];
        id v13 = +[NIServerFindingAdvertisement advertisementForFinder:LOBYTE(self->_identifier.__r_.var0) == 0 address:&v23 statusFlags:[(NIServerSpatialInteractionPayload *)v12 findingStatus] payload:v21 uniqueIdentifier:0];

        operator delete(v20);
        goto LABEL_5;
      }
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10042F87C();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_10042F848();
    }
  }
  else if (a4 == 26)
  {
    int var0_low = LOBYTE(self->_identifier.__r_.var0);
    id v11 = [v7 nearbyActionNWPrecisionFindingStatus];
    id v12 = [v7 nearbyActionNoWakeConfigData];
    id v13 = +[NIServerFindingAdvertisement advertisementForFinder:var0_low == 0 address:&v23 statusFlags:v11 payload:v12 uniqueIdentifier:0];
LABEL_5:

    goto LABEL_15;
  }
  id v13 = 0;
LABEL_15:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisingTimeoutTimers, 0);
  objc_storeStrong((id *)&self->_advertisingPeers, 0);
  objc_storeStrong((id *)&self->_discoveryTimeoutSeconds, 0);
  objc_storeStrong((id *)&self->_discoveryTimeoutTimers, 0);
  objc_storeStrong((id *)&self->_discoveredPeers, 0);
  objc_storeStrong((id *)&self->_eligibleDiscoveryPeers, 0);
  objc_storeStrong((id *)&self->_disableScanDupeConfigTimer, 0);
  objc_storeStrong((id *)&self->_activatedScanner, 0);
  objc_storeStrong((id *)&self->_spatialInteractionScanner, 0);
  objc_storeStrong((id *)&self->_activatedAddressObserver, 0);
  objc_storeStrong((id *)&self->_addressObserver, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_consumerQueue, 0);
  objc_storeStrong((id *)&self->_isFinder, 0);
  objc_destroyWeak((id *)&self->_identifier.var0);
  if (*((char *)&self->_identifier.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = self->_identifier.__r_.__value_.var0.var1.__data_;
    operator delete(data);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0uLL;
  *((void *)self + 3) = 0;
  return self;
}

@end