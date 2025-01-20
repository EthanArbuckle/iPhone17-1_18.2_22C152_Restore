@interface PRBLEDiscoverySession
- (BOOL)marconiBypassEnabled;
- (PRBLEDiscoverySession)init;
- (id).cxx_construct;
- (id)addPeerDiscoveryToken:(id)a3;
- (id)currentPeers;
- (id)deviceCache;
- (id)payloadChangeObserverQueue;
- (id)removePeerDiscoveryToken:(id)a3;
- (int64_t)currentPeerCount;
- (optional<unsigned)nonConnectableAdvertisingAddress;
- (void)_cancelScanRateAdjustmentTimer;
- (void)_configureCBSpatialSession;
- (void)_executeActivationPendingOperations;
- (void)activateWithDelegate:(id)a3 delegateQueue:(id)a4 sessionIRK:(id)a5 sessionIdentifier:(id)a6 controlFlags:(NIBluetoothDiscoveryControlFlags)a7 tokenFlags:(unsigned int)a8;
- (void)allowScreenOffOperation:(BOOL)a3;
- (void)bluetoothAdvertisingAddressChanged;
- (void)bluetoothServiceInterrupted;
- (void)bluetoothStateChanged;
- (void)clearWifiRangingActiveAdvertisement;
- (void)didDiscoverDevice:(id)a3;
- (void)didFailWithError:(id)a3;
- (void)didLoseDevice:(id)a3;
- (void)invalidate;
- (void)payloadDidChange;
- (void)setBleRSSIThresholdHint:(char)a3;
- (void)setDeviceRelationshipFlags:(unint64_t)a3;
- (void)setWifiRangingActiveAdvertisement;
- (void)startAdvertising;
- (void)startAdvertisingBurstForDeviceDiscovery;
- (void)startScanning;
- (void)startScanningWithBurstPeriod:(double)a3;
- (void)stopAdvertising;
- (void)stopAndClearState;
- (void)stopScanningAndRemovePeers:(BOOL)a3;
- (void)systemOverrideNotification;
@end

@implementation PRBLEDiscoverySession

- (PRBLEDiscoverySession)init
{
  v11.receiver = self;
  v11.super_class = (Class)PRBLEDiscoverySession;
  v2 = [(PRBLEDiscoverySession *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    activationPendingPeers = v2->_activationPendingPeers;
    v2->_activationPendingPeers = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    peers = v2->_peers;
    v2->_peers = (NSMutableSet *)v5;

    cbSession = v2->_cbSession;
    v2->_cbSession = 0;

    v2->_cbSessionState = 0;
    uint64_t v8 = objc_opt_new();
    deviceCache = v2->_deviceCache;
    v2->_deviceCache = (PRBluetoothDeviceCache *)v8;

    v2->_wifiAdvertisingAllowed = 0;
  }
  return v2;
}

- (void)_configureCBSpatialSession
{
  uint64_t v3 = (CBSpatialInteractionSession *)objc_alloc_init((Class)CBSpatialInteractionSession);
  cbSession = self->_cbSession;
  self->_cbSession = v3;

  [(CBSpatialInteractionSession *)self->_cbSession setDispatchQueue:self->_clientQueue];
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000C56C;
  v20[3] = &unk_1008460C0;
  objc_copyWeak(&v21, &location);
  [(CBSpatialInteractionSession *)self->_cbSession setDeviceLostHandler:v20];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000C5E0;
  v18[3] = &unk_1008460C0;
  objc_copyWeak(&v19, &location);
  [(CBSpatialInteractionSession *)self->_cbSession setDeviceFoundHandler:v18];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000C654;
  v16[3] = &unk_1008460E8;
  objc_copyWeak(&v17, &location);
  [(CBSpatialInteractionSession *)self->_cbSession setInterruptionHandler:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000C6C0;
  v14[3] = &unk_100846110;
  objc_copyWeak(&v15, &location);
  [(CBSpatialInteractionSession *)self->_cbSession setErrorHandler:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000C734;
  v12[3] = &unk_1008460E8;
  objc_copyWeak(&v13, &location);
  [(CBSpatialInteractionSession *)self->_cbSession setBluetoothStateChangedHandler:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C790;
  v10[3] = &unk_1008460E8;
  objc_copyWeak(&v11, &location);
  [(CBSpatialInteractionSession *)self->_cbSession setAdvertisingAddressChangedHandler:v10];
  uint64_t v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  v7 = sub_10000C7EC;
  uint64_t v8 = &unk_1008460E8;
  objc_copyWeak(&v9, &location);
  [(CBSpatialInteractionSession *)self->_cbSession setSystemOverrideHandler:&v5];
  -[CBSpatialInteractionSession setUwbTokenFlags:](self->_cbSession, "setUwbTokenFlags:", 0, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (BOOL)marconiBypassEnabled
{
  if (qword_10089F930 != -1) {
    dispatch_once(&qword_10089F930, &stru_100846150);
  }
  return 0;
}

- (void)setDeviceRelationshipFlags:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040B860();
      }
      return;
    case 1:
      uint64_t v5 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040B8E4(a3, v5);
      }
      self->_activationPendingRelationshipSpecifier.var0.__val_ = a3;
      self->_activationPendingRelationshipSpecifier.__engaged_ = 1;
      return;
    case 2:
      uint64_t v6 = qword_1008ABDE0;
      if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
      {
        if ((a3 & 2) == 0) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
      sub_10040B95C(a3, v6);
      if ((a3 & 2) != 0) {
LABEL_9:
      }
        [(CBSpatialInteractionSession *)self->_cbSession setControlFlags:[(CBSpatialInteractionSession *)self->_cbSession controlFlags] | 0xE0];
LABEL_10:
      if ((a3 & 5) == 0) {
        [(CBSpatialInteractionSession *)self->_cbSession setControlFlags:[(CBSpatialInteractionSession *)self->_cbSession controlFlags] | 0x400];
      }
      return;
    default:
      return;
  }
}

- (void)activateWithDelegate:(id)a3 delegateQueue:(id)a4 sessionIRK:(id)a5 sessionIdentifier:(id)a6 controlFlags:(NIBluetoothDiscoveryControlFlags)a7 tokenFlags:(unsigned int)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if ((self->_cbSessionState - 1) >= 2)
  {
    objc_storeWeak((id *)&self->_delegate, a3);
    objc_storeStrong((id *)&self->_clientQueue, a4);
    cbSession = self->_cbSession;
    self->_cbSession = 0;

    [(PRBLEDiscoverySession *)self _configureCBSpatialSession];
    [(CBSpatialInteractionSession *)self->_cbSession setUwbTokenFlags:[(CBSpatialInteractionSession *)self->_cbSession uwbTokenFlags] | a8];
    [(CBSpatialInteractionSession *)self->_cbSession setClientIrkData:v16];
    [(CBSpatialInteractionSession *)self->_cbSession setClientIdentifierData:v17];
    [(CBSpatialInteractionSession *)self->_cbSession setBleRSSIThresholdHint:4294967206];
    [(CBSpatialInteractionSession *)self->_cbSession setControlFlags:25];
    if (a7.var0) {
      [(CBSpatialInteractionSession *)self->_cbSession setControlFlags:[(CBSpatialInteractionSession *)self->_cbSession controlFlags] | 2];
    }
    if ((*(_WORD *)&a7 & 0x100) != 0)
    {
      [(CBSpatialInteractionSession *)self->_cbSession setControlFlags:[(CBSpatialInteractionSession *)self->_cbSession controlFlags] | 0x800];
      self->_wifiAdvertisingAllowed = 1;
    }
    id v19 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = [(CBSpatialInteractionSession *)self->_cbSession controlFlags];
      LODWORD(buf) = 67109888;
      HIDWORD(buf) = a7.var0;
      __int16 v26 = 1024;
      int v27 = (unint64_t)(*(_WORD *)&a7 & 0x100) >> 8;
      __int16 v28 = 1024;
      unsigned int v29 = a8;
      __int16 v30 = 1024;
      unsigned int v31 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#ble,Activate. Supports UWB: [%d], Supports WiFi ToF: [%d], TokenFlags: [0x%08x]. ControlFlags: [0x%08x]", (uint8_t *)&buf, 0x1Au);
    }

    [(NSMutableSet *)self->_activationPendingPeers removeAllObjects];
    self->_activationPendingControlFlags = [(CBSpatialInteractionSession *)self->_cbSession controlFlags];
    self->_activationPendingRssiThresholdHint = [(CBSpatialInteractionSession *)self->_cbSession bleRSSIThresholdHint];
    self->_activationPendingScanBurstPeriod = 0.0;
    if (self->_activationPendingRelationshipSpecifier.__engaged_) {
      self->_activationPendingRelationshipSpecifier.__engaged_ = 0;
    }
    objc_initWeak(&buf, self);
    self->_cbSessionState = 1;
    double v21 = sub_100006C38();
    v22 = self->_cbSession;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000CDE0;
    v23[3] = &unk_100846178;
    v24[1] = *(id *)&v21;
    objc_copyWeak(v24, &buf);
    v23[4] = self;
    [(CBSpatialInteractionSession *)v22 activateWithCompletion:v23];
    objc_destroyWeak(v24);
    objc_destroyWeak(&buf);
  }
}

- (void)_executeActivationPendingOperations
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  uint64_t v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    activationPendingPeers = self->_activationPendingPeers;
    *(_DWORD *)id buf = 138477827;
    v22[0] = activationPendingPeers;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,Activation pending operation: add peers %{private}@", buf, 0xCu);
  }
  uint64_t v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int activationPendingControlFlags = self->_activationPendingControlFlags;
    unsigned int v7 = [(CBSpatialInteractionSession *)self->_cbSession controlFlags];
    *(_DWORD *)id buf = 67109376;
    LODWORD(v22[0]) = activationPendingControlFlags;
    WORD2(v22[0]) = 1024;
    *(_DWORD *)((char *)v22 + 6) = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,Activation pending operation: act on control flags 0x%08x (current 0x%08x)", buf, 0xEu);
  }

  uint64_t v8 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    double activationPendingScanBurstPeriod = self->_activationPendingScanBurstPeriod;
    *(_DWORD *)id buf = 134217984;
    *(double *)v22 = activationPendingScanBurstPeriod;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ble,Activation pending operation: scan burst period %0.1f s", buf, 0xCu);
  }
  v10 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int activationPendingRssiThresholdHint = self->_activationPendingRssiThresholdHint;
    unsigned int v12 = [(CBSpatialInteractionSession *)self->_cbSession bleRSSIThresholdHint];
    *(_DWORD *)id buf = 67109376;
    LODWORD(v22[0]) = activationPendingRssiThresholdHint;
    WORD2(v22[0]) = 1024;
    *(_DWORD *)((char *)v22 + 6) = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ble,Activation pending operation: RSSI hint %d dBm (current %d dBm)", buf, 0xEu);
  }

  id v13 = qword_1008ABDE0;
  if (self->_activationPendingRelationshipSpecifier.__engaged_)
  {
    v14 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (!self->_activationPendingRelationshipSpecifier.__engaged_) {
        sub_10000AE44();
      }
      unint64_t val = self->_activationPendingRelationshipSpecifier.var0.__val_;
      *(_DWORD *)id buf = 67109120;
      LODWORD(v22[0]) = val;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ble,Activation pending operation: relationship specifier 0x%08x", buf, 8u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ble,Activation pending operation: no relationship specifier pending", buf, 2u);
  }
  id v16 = self->_activationPendingPeers;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000D4B4;
  v20[3] = &unk_1008461A0;
  void v20[4] = self;
  [(NSMutableSet *)v16 enumerateObjectsUsingBlock:v20];
  [(NSMutableSet *)self->_activationPendingPeers removeAllObjects];
  if (self->_activationPendingRelationshipSpecifier.__engaged_)
  {
    [(PRBLEDiscoverySession *)self setDeviceRelationshipFlags:self->_activationPendingRelationshipSpecifier.var0.__val_];
    if (self->_activationPendingRelationshipSpecifier.__engaged_) {
      self->_activationPendingRelationshipSpecifier.__engaged_ = 0;
    }
  }
  if (((unsigned __int16)[(CBSpatialInteractionSession *)self->_cbSession controlFlags] & 0x800) != (self->_activationPendingControlFlags & 0x800))
  {
    if ((self->_activationPendingControlFlags & 0x800) != 0) {
      [(PRBLEDiscoverySession *)self setWifiRangingActiveAdvertisement];
    }
    else {
      [(PRBLEDiscoverySession *)self clearWifiRangingActiveAdvertisement];
    }
  }
  if ((self->_activationPendingControlFlags & 0x1000) != 0) {
    [(PRBLEDiscoverySession *)self allowScreenOffOperation:1];
  }
  unsigned __int8 v17 = [(CBSpatialInteractionSession *)self->_cbSession bleRSSIThresholdHint];
  int v18 = self->_activationPendingRssiThresholdHint;
  if (v18 != v17) {
    [(PRBLEDiscoverySession *)self setBleRSSIThresholdHint:(char)v18];
  }
  unsigned int v19 = self->_activationPendingControlFlags;
  if ((v19 & 8) == 0)
  {
    [(PRBLEDiscoverySession *)self startAdvertising];
    unsigned int v19 = self->_activationPendingControlFlags;
  }
  if ((v19 & 0x10) == 0)
  {
    if (self->_activationPendingScanBurstPeriod <= 0.0) {
      [(PRBLEDiscoverySession *)self startScanning];
    }
    else {
      -[PRBLEDiscoverySession startScanningWithBurstPeriod:](self, "startScanningWithBurstPeriod:");
    }
  }
}

- (void)stopAndClearState
{
  uint64_t v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,stopAndClearState", v4, 2u);
  }
  [(PRBLEDiscoverySession *)self stopScanningAndRemovePeers:1];
  [(PRBLEDiscoverySession *)self stopAdvertising];
  [(PRBluetoothDeviceCache *)self->_deviceCache reset];
}

- (void)invalidate
{
  uint64_t v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,Invalidate", v6, 2u);
  }
  self->_cbSessionState = 4;
  [(PRBLEDiscoverySession *)self _cancelScanRateAdjustmentTimer];
  [(CBSpatialInteractionSession *)self->_cbSession invalidate];
  cbSession = self->_cbSession;
  self->_cbSession = 0;

  [(NSMutableSet *)self->_peers removeAllObjects];
  uint64_t v5 = +[NIServerSpatialInteractionPayloadAggregator sharedInstance];
  [v5 removePayloadChangeObserver:self];
}

- (id)addPeerDiscoveryToken:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      uint64_t v5 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        CUPrintNSObjectMasked();
        objc_claimAutoreleasedReturnValue();
        sub_10040BB58();
      }

      break;
    case 1:
      v10 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = CUPrintNSObjectMasked();
        *(_DWORD *)id buf = 138477827;
        unsigned __int8 v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ble,addPeerToken %{private}@ waiting for activation complete", buf, 0xCu);
      }
      [(NSMutableSet *)self->_activationPendingPeers addObject:v4];
      break;
    case 2:
      uint64_t v6 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v7 = CUPrintNSObjectMasked();
        *(_DWORD *)id buf = 138477827;
        unsigned __int8 v17 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ble,addPeerToken %{private}@ started", buf, 0xCu);
      }
      [(NSMutableSet *)self->_peers addObject:v4];
      objc_initWeak((id *)buf, self);
      double v8 = sub_100006C38();
      cbSession = self->_cbSession;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000D90C;
      v13[3] = &unk_100846178;
      v15[1] = *(id *)&v8;
      objc_copyWeak(v15, (id *)buf);
      id v14 = v4;
      [(CBSpatialInteractionSession *)cbSession addPeerToken:v14 completion:v13];

      objc_destroyWeak(v15);
      objc_destroyWeak((id *)buf);
      break;
    default:
      break;
  }

  return 0;
}

- (id)removePeerDiscoveryToken:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      uint64_t v5 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        CUPrintNSObjectMasked();
        objc_claimAutoreleasedReturnValue();
        sub_10040BBBC();
      }
      goto LABEL_15;
    case 1:
      id v11 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = CUPrintNSObjectMasked();
        *(_DWORD *)id buf = 138477827;
        unsigned int v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ble,removePeerToken %{private}@ removing from tokens that are waiting for activation complete", buf, 0xCu);
      }
      [(NSMutableSet *)self->_activationPendingPeers removeObject:v4];
      break;
    case 2:
      uint64_t v6 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v7 = CUPrintNSObjectMasked();
        *(_DWORD *)id buf = 138477827;
        unsigned int v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ble,removePeerToken %{private}@ started", buf, 0xCu);
      }
      double v8 = [(PRBluetoothDeviceCache *)self->_deviceCache deviceForTokenData:v4];
      uint64_t v5 = v8;
      if (v8 && [v8 systemKeyRelationship])
      {
        id v9 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = CUPrintNSObjectMasked();
          *(_DWORD *)id buf = 138477827;
          unsigned int v20 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ble,removePeerToken %{private}@ of device with system key relationship. Exit early", buf, 0xCu);
        }
      }
      else
      {
        [(NSMutableSet *)self->_peers removeObject:v4];
        objc_initWeak((id *)buf, self);
        double v13 = sub_100006C38();
        cbSession = self->_cbSession;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10000DE70;
        v16[3] = &unk_100846178;
        v18[1] = *(id *)&v13;
        objc_copyWeak(v18, (id *)buf);
        id v17 = v4;
        [(CBSpatialInteractionSession *)cbSession removePeerToken:v17 completion:v16];

        objc_destroyWeak(v18);
        objc_destroyWeak((id *)buf);
      }
LABEL_15:

      break;
    default:
      break;
  }

  return 0;
}

- (void)startAdvertising
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040BC20();
      }
      break;
    case 1:
      uint64_t v6 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ble,startAdvertising waiting for activation complete", (uint8_t *)&v7, 2u);
      }
      self->_activationPendingControlFlags &= ~8u;
      break;
    case 2:
      uint64_t v3 = +[NIServerSpatialInteractionPayloadAggregator sharedInstance];
      id v4 = [v3 aggregatedUWBData];

      uint64_t v5 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138412290;
        double v8 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,startAdvertising with UWB config: %@", (uint8_t *)&v7, 0xCu);
      }
      [(CBSpatialInteractionSession *)self->_cbSession setAdvertiseRate:40];
      [(CBSpatialInteractionSession *)self->_cbSession setUwbConfigData:v4];
      [(CBSpatialInteractionSession *)self->_cbSession setAdvertiseRate:50 timeout:2.0];
      [(CBSpatialInteractionSession *)self->_cbSession setControlFlags:(unint64_t)[(CBSpatialInteractionSession *)self->_cbSession controlFlags] & 0xFFFFFFF7];

      break;
    default:
      return;
  }
}

- (void)stopAdvertising
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040BCA4();
      }
      break;
    case 1:
      uint64_t v3 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,stopAdvertising waiting for activation complete", buf, 2u);
      }
      self->_activationPendingControlFlags |= 8u;
      break;
    case 2:
      id v4 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ble,stopAdvertising", v5, 2u);
      }
      [(CBSpatialInteractionSession *)self->_cbSession setControlFlags:[(CBSpatialInteractionSession *)self->_cbSession controlFlags] | 8];
      break;
    default:
      return;
  }
}

- (void)startScanning
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040BD28();
      }
      break;
    case 1:
      uint64_t v3 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,startScanning waiting for activation complete", buf, 2u);
      }
      self->_activationPendingControlFlags &= ~0x10u;
      self->_double activationPendingScanBurstPeriod = 0.0;
      break;
    case 2:
      id v4 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ble,startScanning", v5, 2u);
      }
      [(CBSpatialInteractionSession *)self->_cbSession setScanRate:40];
      [(CBSpatialInteractionSession *)self->_cbSession setControlFlags:(unint64_t)[(CBSpatialInteractionSession *)self->_cbSession controlFlags] & 0xFFFFFFEF];
      break;
    default:
      return;
  }
}

- (void)startAdvertisingBurstForDeviceDiscovery
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  unsigned int cbSessionState = self->_cbSessionState;
  if (cbSessionState <= 4)
  {
    if (cbSessionState == 2)
    {
      if (([(CBSpatialInteractionSession *)self->_cbSession controlFlags] & 8) != 0)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040BEA8();
        }
      }
      else
      {
        id v4 = +[NSUserDefaults standardUserDefaults];
        uint64_t v5 = [v4 objectForKey:@"DeviceDiscoveryBurstAdvertiseRate"];

        if (v5)
        {
          uint64_t v6 = [v4 stringForKey:@"DeviceDiscoveryBurstAdvertiseRate"];
          if ([v6 isEqualToString:@"High"])
          {
            uint64_t v7 = 50;
          }
          else if ([v6 isEqualToString:@"Max"])
          {
            uint64_t v7 = 60;
          }
          else if ([v6 isEqualToString:@"MediumHigh"])
          {
            uint64_t v7 = 45;
          }
          else if ([v6 isEqualToString:@"MediumMid"])
          {
            uint64_t v7 = 42;
          }
          else if ([v6 isEqualToString:@"Medium"])
          {
            uint64_t v7 = 40;
          }
          else if ([v6 isEqualToString:@"Low"])
          {
            uint64_t v7 = 30;
          }
          else if ([v6 isEqualToString:@"Background"])
          {
            uint64_t v7 = 20;
          }
          else
          {
            uint64_t v7 = 50;
          }
          double v8 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
            sub_10040BE30((uint64_t)v6, v8);
          }
        }
        else
        {
          uint64_t v7 = 50;
        }
        [v4 doubleForKey:@"DeviceDiscoveryBurstLength"];
        double v10 = v9;
        double v11 = 2.0;
        if (v9 > 0.0)
        {
          unsigned int v12 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            int v14 = 134217984;
            *(double *)id v15 = v10;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ble,Overriding advertising burst length with %f seconds", (uint8_t *)&v14, 0xCu);
          }
          double v11 = v10;
        }
        double v13 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 67109376;
          LODWORD(v15[0]) = v7;
          WORD2(v15[0]) = 2048;
          *(double *)((char *)v15 + 6) = v11;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ble,startAdvertisingBurstForDeviceDiscovery. Rate: %d. Timeout: %0.1f s.", (uint8_t *)&v14, 0x12u);
        }
        [(CBSpatialInteractionSession *)self->_cbSession setAdvertiseRate:v7 timeout:v11];
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_10040BDAC();
    }
  }
}

- (void)clearWifiRangingActiveAdvertisement
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040BEDC();
      }
      break;
    case 1:
      uint64_t v3 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,clearWifiRangingActiveAdvertisement waiting for activation complete", buf, 2u);
      }
      self->_activationPendingControlFlags &= ~0x800u;
      break;
    case 2:
      id v4 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ble,clearWifiRangingActiveAdvertisement", v5, 2u);
      }
      [(CBSpatialInteractionSession *)self->_cbSession setControlFlags:(unint64_t)[(CBSpatialInteractionSession *)self->_cbSession controlFlags] & 0xFFFFF7FF];
      break;
    default:
      return;
  }
}

- (void)setWifiRangingActiveAdvertisement
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_wifiAdvertisingAllowed)
  {
    switch(self->_cbSessionState)
    {
      case 0:
      case 3:
      case 4:
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040BF94();
        }
        break;
      case 1:
        uint64_t v3 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,setWifiRangingActiveAdvertisement waiting for activation complete", buf, 2u);
        }
        self->_activationPendingControlFlags |= 0x800u;
        break;
      case 2:
        id v4 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v5 = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ble,setWifiRangingActiveAdvertisement", v5, 2u);
        }
        [(CBSpatialInteractionSession *)self->_cbSession setControlFlags:[(CBSpatialInteractionSession *)self->_cbSession controlFlags] | 0x800];
        break;
      default:
        return;
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10040BF60();
  }
}

- (void)startScanningWithBurstPeriod:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040C018();
      }
      break;
    case 1:
      uint64_t v5 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 134217984;
        double v16 = a3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,startScanningWithBurstPeriod [%0.1f s] waiting for activation complete", buf, 0xCu);
      }
      self->_activationPendingControlFlags &= ~0x10u;
      self->_double activationPendingScanBurstPeriod = a3;
      break;
    case 2:
      uint64_t v6 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 134217984;
        double v16 = a3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ble,startScanningWithBurstPeriod [%0.1f s]", buf, 0xCu);
      }
      [(CBSpatialInteractionSession *)self->_cbSession setScanRate:40];
      [(CBSpatialInteractionSession *)self->_cbSession setControlFlags:(unint64_t)[(CBSpatialInteractionSession *)self->_cbSession controlFlags] & 0xFFFFFFEF];
      [(PRBLEDiscoverySession *)self _cancelScanRateAdjustmentTimer];
      uint64_t v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_clientQueue);
      p_scanRateAdjustmentTimer = &self->_scanRateAdjustmentTimer;
      scanRateAdjustmentTimer = self->_scanRateAdjustmentTimer;
      self->_scanRateAdjustmentTimer = v7;

      double v10 = self->_scanRateAdjustmentTimer;
      dispatch_time_t v11 = dispatch_time(0, llround(a3 * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
      objc_initWeak((id *)buf, self);
      unsigned int v12 = self->_scanRateAdjustmentTimer;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000ED8C;
      v13[3] = &unk_1008461C8;
      objc_copyWeak(v14, (id *)buf);
      v14[1] = *(id *)&a3;
      dispatch_source_set_event_handler((dispatch_source_t)v12, v13);
      dispatch_resume((dispatch_object_t)*p_scanRateAdjustmentTimer);
      objc_destroyWeak(v14);
      objc_destroyWeak((id *)buf);
      break;
    default:
      return;
  }
}

- (void)_cancelScanRateAdjustmentTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  scanRateAdjustmentTimer = self->_scanRateAdjustmentTimer;
  if (scanRateAdjustmentTimer)
  {
    dispatch_source_cancel((dispatch_source_t)scanRateAdjustmentTimer);
    id v4 = self->_scanRateAdjustmentTimer;
    self->_scanRateAdjustmentTimer = 0;
  }
}

- (void)stopScanningAndRemovePeers:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040C09C();
      }
      break;
    case 1:
      double v8 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        double v9 = "NO";
        if (v3) {
          double v9 = "YES";
        }
        *(_DWORD *)id buf = 136315138;
        unsigned int v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ble,stopScanningAndRemovePeers[%s] waiting for activation complete", buf, 0xCu);
      }
      self->_activationPendingControlFlags |= 0x10u;
      if (v3) {
        [(NSMutableSet *)self->_activationPendingPeers removeAllObjects];
      }
      break;
    case 2:
      uint64_t v5 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = "NO";
        if (v3) {
          uint64_t v6 = "YES";
        }
        *(_DWORD *)id buf = 136315138;
        unsigned int v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,stopScanningAndRemovePeers[%s]", buf, 0xCu);
      }
      [(PRBLEDiscoverySession *)self _cancelScanRateAdjustmentTimer];
      [(CBSpatialInteractionSession *)self->_cbSession setControlFlags:[(CBSpatialInteractionSession *)self->_cbSession controlFlags] | 0x10];
      if (v3)
      {
        uint64_t v7 = [(PRBLEDiscoverySession *)self currentPeers];
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_10000F164;
        v10[3] = &unk_1008461F0;
        void v10[4] = self;
        [v7 enumerateObjectsUsingBlock:v10];
      }
      break;
    default:
      return;
  }
}

- (id)currentPeers
{
  return [(NSMutableSet *)self->_peers allObjects];
}

- (int64_t)currentPeerCount
{
  return (int64_t)[(NSMutableSet *)self->_peers count];
}

- (optional<unsigned)nonConnectableAdvertisingAddress
{
  if (self->_cbSessionState == 2)
  {
    v2 = [(CBSpatialInteractionSession *)self->_cbSession advertisingAddressData];
    BOOL v3 = v2;
    if (v2)
    {
      if ([v2 length] == (id)6)
      {
        [v3 getBytes:v10 length:6];
        unint64_t v4 = ((unint64_t)v10[4] << 8) | ((unint64_t)v10[3] << 16) | ((unint64_t)v10[2] << 24) | ((unint64_t)v10[1] << 32) | ((unint64_t)v10[0] << 40);
        uint8_t v5 = v10[5];
        uint64_t v6 = 1;
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v7 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10040C170(v10, (uint64_t)[v3 length], v7);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_10040C13C();
    }
    uint8_t v5 = 0;
    uint64_t v6 = 0;
    unint64_t v4 = 0;
    goto LABEL_12;
  }
  uint8_t v5 = 0;
  uint64_t v6 = 0;
  unint64_t v4 = 0;
LABEL_13:
  uint64_t v8 = v4 & 0xFFFFFFFFFF00 | v5;
  BOOL v9 = v6;
  result.__engaged_ = v9;
  result.var0 = ($BEC950A715106DE229A2E4BA1089E24D)v8;
  return result;
}

- (id)deviceCache
{
  return self->_deviceCache;
}

- (void)allowScreenOffOperation:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040C1C8();
      }
      break;
    case 1:
      uint8_t v5 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = "NO";
        if (v3) {
          uint64_t v6 = "YES";
        }
        int v13 = 136315138;
        int v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,allowScreenOffOperation[%s] waiting for activation complete", (uint8_t *)&v13, 0xCu);
      }
      unsigned int activationPendingControlFlags = self->_activationPendingControlFlags;
      if (v3) {
        unsigned int v8 = activationPendingControlFlags | 0x1000;
      }
      else {
        unsigned int v8 = activationPendingControlFlags & 0xFFFFEFFF;
      }
      self->_unsigned int activationPendingControlFlags = v8;
      break;
    case 2:
      BOOL v9 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        double v10 = "NO";
        if (v3) {
          double v10 = "YES";
        }
        int v13 = 136315138;
        int v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ble,allowScreenOffOperation[%s]", (uint8_t *)&v13, 0xCu);
      }
      cbSession = self->_cbSession;
      unsigned int v12 = [(CBSpatialInteractionSession *)cbSession controlFlags];
      if (v3) {
        [(CBSpatialInteractionSession *)cbSession setControlFlags:v12 | 0x1000];
      }
      else {
        [(CBSpatialInteractionSession *)cbSession setControlFlags:v12 & 0xFFFFEFFF];
      }
      break;
    default:
      return;
  }
}

- (void)setBleRSSIThresholdHint:(char)a3
{
  uint64_t v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  switch(self->_cbSessionState)
  {
    case 0:
    case 3:
    case 4:
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040C268();
      }
      break;
    case 1:
      uint8_t v5 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 67109120;
        int v8 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,setBleRSSIThresholdHint[%d dBm] waiting for activation complete", (uint8_t *)&v7, 8u);
      }
      self->_int activationPendingRssiThresholdHint = v3;
      break;
    case 2:
      uint64_t v6 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 67109120;
        int v8 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ble,setBleRSSIThresholdHint[%d dBm]", (uint8_t *)&v7, 8u);
      }
      [(CBSpatialInteractionSession *)self->_cbSession setBleRSSIThresholdHint:v3];
      break;
    default:
      return;
  }
}

- (void)didDiscoverDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  uint8_t v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,Discovered device: %@", (uint8_t *)&v15, 0xCu);
  }
  if (v4)
  {
    uint64_t v6 = [v4 btAddressData];
    if (v6
      && ([v4 btAddressData],
          int v7 = objc_claimAutoreleasedReturnValue(),
          BOOL v8 = [v7 length] == (id)6,
          v7,
          v6,
          v8))
    {
      BOOL v9 = [[PRBluetoothDevice alloc] initWithCBDevice:v4];
      deviceCache = self->_deviceCache;
      dispatch_time_t v11 = [(PRBluetoothDevice *)v9 discoveryTokenData];
      unsigned int v12 = [(PRBluetoothDeviceCache *)deviceCache deviceForTokenData:v11];

      [(PRBluetoothDeviceCache *)self->_deviceCache cacheDevice:v9];
      if (self->_cbSessionState == 2)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        int v14 = WeakRetained;
        if (v12) {
          [WeakRetained discoveredDevice:v12 didUpdate:v9];
        }
        else {
          [WeakRetained didDiscoverDevice:v9];
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_10040C2EC();
    }
  }
}

- (void)didLoseDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  uint8_t v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ble,Lost device: %@", (uint8_t *)&v14, 0xCu);
  }
  if (v4)
  {
    uint64_t v6 = [v4 btAddressData];
    if (v6
      && ([v4 btAddressData],
          int v7 = objc_claimAutoreleasedReturnValue(),
          BOOL v8 = [v7 length] == (id)6,
          v7,
          v6,
          v8))
    {
      BOOL v9 = [v4 btAddressData];
      uint64_t v10 = sub_10000FACC(v9);

      uint64_t v11 = [(PRBluetoothDeviceCache *)self->_deviceCache deviceForIdentifier:v10];
      unsigned int v12 = (PRBluetoothDevice *)v11;
      if (self->_cbSessionState == 2)
      {
        if (!v11) {
          unsigned int v12 = [[PRBluetoothDevice alloc] initWithCBDevice:v4];
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained didLoseDevice:v12];
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_10040C320();
    }
  }
}

- (void)didFailWithError:(id)a3
{
  id v3 = a3;
  id v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10040C354((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)bluetoothStateChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  unint64_t v3 = (unint64_t)[(CBSpatialInteractionSession *)self->_cbSession bluetoothState];
  id v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    if (v3 > 0xA) {
      uint64_t v5 = "?";
    }
    else {
      uint64_t v5 = off_100846238[v3];
    }
    int v7 = 136315138;
    uint64_t v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ble,Bluetooth state changed: %s", (uint8_t *)&v7, 0xCu);
  }
  if (self->_cbSessionState == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained bluetoothDidChangeState:-[CBSpatialInteractionSession bluetoothState](self->_cbSession, "bluetoothState")];
  }
}

- (void)bluetoothServiceInterrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_cbSessionState == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained bluetoothServiceInterrupted];
  }
}

- (void)systemOverrideNotification
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_cbSessionState == 2)
  {
    unint64_t v3 = (id)qword_1008ABDE0;
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
LABEL_48:

      return;
    }
    unsigned int v4 = [(CBSpatialInteractionSession *)self->_cbSession systemOverrideFlags];
    unsigned __int8 v5 = [(CBSpatialInteractionSession *)self->_cbSession systemOverrideFlags];
    int v6 = [(CBSpatialInteractionSession *)self->_cbSession scanRate];
    if (v6 > 34)
    {
      if (v6 > 49)
      {
        if (v6 == 50)
        {
          int v7 = "High";
          goto LABEL_23;
        }
        if (v6 == 60)
        {
          int v7 = "Max";
          goto LABEL_23;
        }
      }
      else
      {
        if (v6 == 35)
        {
          int v7 = "MediumLow";
          goto LABEL_23;
        }
        if (v6 == 40)
        {
          int v7 = "Medium";
          goto LABEL_23;
        }
      }
    }
    else if (v6 > 19)
    {
      if (v6 == 20)
      {
        int v7 = "Background";
        goto LABEL_23;
      }
      if (v6 == 30)
      {
        int v7 = "Low";
        goto LABEL_23;
      }
    }
    else
    {
      if (!v6)
      {
        int v7 = "Default";
        goto LABEL_23;
      }
      if (v6 == 10)
      {
        int v7 = "Periodic";
        goto LABEL_23;
      }
    }
    int v7 = "?";
LABEL_23:
    int v8 = [(CBSpatialInteractionSession *)self->_cbSession advertiseRate];
    if (v8 > 39)
    {
      if (v8 <= 44)
      {
        if (v8 == 40)
        {
          uint64_t v9 = "Medium";
          goto LABEL_47;
        }
        if (v8 == 42)
        {
          uint64_t v9 = "MediumMid";
          goto LABEL_47;
        }
      }
      else
      {
        switch(v8)
        {
          case '-':
            uint64_t v9 = "MediumHigh";
            goto LABEL_47;
          case '2':
            uint64_t v9 = "High";
            goto LABEL_47;
          case '<':
            uint64_t v9 = "Max";
            goto LABEL_47;
        }
      }
    }
    else if (v8 <= 14)
    {
      if (!v8)
      {
        uint64_t v9 = "Default";
        goto LABEL_47;
      }
      if (v8 == 10)
      {
        uint64_t v9 = "Periodic";
        goto LABEL_47;
      }
    }
    else
    {
      switch(v8)
      {
        case 15:
          uint64_t v9 = "PeriodicHigh";
          goto LABEL_47;
        case 20:
          uint64_t v9 = "Background";
          goto LABEL_47;
        case 30:
          uint64_t v9 = "Low";
LABEL_47:
          v10[0] = 67109890;
          v10[1] = v4;
          __int16 v11 = 1024;
          int v12 = v5 & 1;
          __int16 v13 = 2080;
          int v14 = v7;
          __int16 v15 = 2080;
          id v16 = v9;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ble,[BLE Discovery] #nicoex System override flags: %x. WiFi critical: %d. Scan rate (%s), advertise rate (%s)", (uint8_t *)v10, 0x22u);
          goto LABEL_48;
      }
    }
    uint64_t v9 = "?";
    goto LABEL_47;
  }
}

- (void)bluetoothAdvertisingAddressChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_cbSessionState == 2)
  {
    id v3 = [(PRBLEDiscoverySession *)self nonConnectableAdvertisingAddress];
    if (v4)
    {
      id v5 = v3;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained bluetoothAdvertisingAddressChanged:v5];
    }
  }
}

- (id)payloadChangeObserverQueue
{
  return self->_clientQueue;
}

- (void)payloadDidChange
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_cbSessionState == 2)
  {
    id v3 = +[NIServerSpatialInteractionPayloadAggregator sharedInstance];
    uint64_t v4 = [v3 aggregatedUWBData];

    uint64_t v5 = [(CBSpatialInteractionSession *)self->_cbSession uwbConfigData];
    if (v5 | v4
      && ([(CBSpatialInteractionSession *)self->_cbSession uwbConfigData],
          int v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v6 isEqualToData:v4],
          v6,
          (id)v5,
          !v7))
    {
      if (([(CBSpatialInteractionSession *)self->_cbSession controlFlags] & 8) == 0)
      {
        [(CBSpatialInteractionSession *)self->_cbSession setControlFlags:[(CBSpatialInteractionSession *)self->_cbSession controlFlags] | 8];
        [(CBSpatialInteractionSession *)self->_cbSession setUwbConfigData:v4];
        int v12 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138412290;
          uint64_t v15 = v4;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ble,Payload did change: %@. Session updated, and control flags toggled for it to take effect", (uint8_t *)&v14, 0xCu);
        }
        [(CBSpatialInteractionSession *)self->_cbSession setControlFlags:(unint64_t)[(CBSpatialInteractionSession *)self->_cbSession controlFlags] & 0xFFFFFFF7];
        goto LABEL_13;
      }
      [(CBSpatialInteractionSession *)self->_cbSession setUwbConfigData:v4];
      uint64_t v13 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        uint64_t v15 = v4;
        uint64_t v9 = "#ble,Payload did change: %@. Session updated, but not currently advertising";
        uint64_t v10 = v13;
        uint32_t v11 = 12;
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v8 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        uint64_t v9 = "#ble,Payload did change called, but no change to apply";
        uint64_t v10 = v8;
        uint32_t v11 = 2;
LABEL_6:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
      }
    }
LABEL_13:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanRateAdjustmentTimer, 0);
  objc_storeStrong((id *)&self->_activationPendingPeers, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_deviceCache, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_cbSession, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 80) = 0;
  *((unsigned char *)self + 88) = 0;
  return self;
}

@end