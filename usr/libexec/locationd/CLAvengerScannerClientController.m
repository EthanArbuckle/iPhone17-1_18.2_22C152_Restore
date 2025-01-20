@interface CLAvengerScannerClientController
+ (BOOL)isDefaultScanType:(unsigned int)a3;
+ (BOOL)shouldHoldPowerAssertionForScan:(unsigned int)a3;
- (BOOL)aggressiveToAggressiveLongUpgradeRequested;
- (BOOL)bomScanEnabled;
- (BOOL)centralManagerPoweredOn;
- (BOOL)getOptedIn;
- (BOOL)isAggressiveLongScanning;
- (BOOL)isAggressiveScanning;
- (BOOL)isDefaultScanning;
- (BOOL)isLegacyAggressiveOrDefaultScanning;
- (BOOL)isLegacyAggressiveScanning;
- (BOOL)isScanning;
- (BOOL)optedIn;
- (BOOL)performNotOptedInBOMScan;
- (BOOL)performTemporaryAggressiveScan;
- (BOOL)performTemporaryHawkeyeLowEnergyScan;
- (BOOL)performTemporaryLongAggressiveScan;
- (BOOL)poweredOn;
- (BOOL)startBTFindingScan;
- (BOOL)stopBTFindingScan;
- (BOOL)stopTemporaryLongAggressiveScan;
- (CBCentralManager)centralManager;
- (CLAvengerReconciler)reconciler;
- (CLAvengerScannerClientController)initWithDelegate:(id)a3 centralManager:(id)a4 optedIn:(BOOL)a5 reconciler:(id)a6 queue:(id)a7 powerAssertionDelegate:(id)a8;
- (CLAvengerScannerClientControllerPowerAssertionDelegateProtocol)powerAssertionDelegate;
- (CLAvengerScannerClientDelegateProtocol)delegate;
- (NSDate)lastScanBufferEmptyDate;
- (NSString)clientIdentifier;
- (OS_dispatch_queue)queue;
- (id)parseAndNotifyDelegateOnDiscoveredPeripheral:(id)a3 RSSI:(id)a4;
- (unsigned)currentUseCase;
- (unsigned)defaultUseCase;
- (void)centralManager:(id)a3 didDiscoverMultiplePeripherals:(id)a4;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)initializeClientRequestsViewsWithZeroValues:(id)a3;
- (void)scanCompletedWithError:(id)a3 totalRXTime:(id)a4;
- (void)setAggressiveToAggressiveLongUpgradeRequested:(BOOL)a3;
- (void)setBomScanEnabled:(BOOL)a3;
- (void)setCentralManager:(id)a3;
- (void)setCentralManagerPoweredOn:(BOOL)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setCurrentUseCase:(unsigned int)a3;
- (void)setDelegate:(id)a3;
- (void)setLastScanBufferEmptyDate:(id)a3;
- (void)setOptedIn:(BOOL)a3;
- (void)setPowerAssertionDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReconciler:(id)a3;
- (void)startScanningWithUseCase:(unsigned int)a3;
- (void)startScanningWithUseCase:(unsigned int)a3 isScanUpgrade:(BOOL)a4;
- (void)stopScan;
- (void)submitBufferEmptyAnalyticsCounts:(unsigned int)a3 numNOApplePosh:(unsigned int)a4 numNONonApplePosh:(unsigned int)a5 numWildAppleType18:(unsigned int)a6 numWildApplePosh:(unsigned int)a7 numWildNonApplePosh:(unsigned int)a8 totalNearOwnerAdv:(unsigned int)a9 totalWildAdv:(unsigned int)a10 timeSinceLastBufferEmpty:(int)a11;
- (void)submitClientRequestsEvent:(id)a3 client:(id)a4 scanType:(id)a5;
@end

@implementation CLAvengerScannerClientController

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  if (qword_102419570 != -1) {
    dispatch_once(&qword_102419570, &stru_1023327F0);
  }
  v10 = qword_102419578;
  if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEBUG))
  {
    v11 = [(NSString *)self->_clientIdentifier UTF8String];
    *(_DWORD *)buf = 68289795;
    int v18 = 0;
    __int16 v19 = 2082;
    v20 = "";
    __int16 v21 = 2082;
    v22 = v11;
    __int16 v23 = 2113;
    id v24 = a4;
    __int16 v25 = 2113;
    id v26 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"didDiscoverPeripheral\", \"ClientId\":%{public, location:escape_only}s, \"peripheral\":%{private, location:escape_only}@, \"advertisementData\":%{private, location:escape_only}@}", buf, 0x30u);
  }
  id v12 = [(CLAvengerScannerClientController *)self parseAndNotifyDelegateOnDiscoveredPeripheral:a5 RSSI:a6];
  if (v12)
  {
    v13 = v12;
    if ([v12 beepOnMoveHigh])
    {
      if ([v13 didCauseWake]
        && [(CLAvengerScannerClientController *)self bomScanEnabled])
      {
        if (qword_102419570 != -1) {
          dispatch_once(&qword_102419570, &stru_1023327F0);
        }
        v14 = qword_102419578;
        if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
        {
          v15 = [(NSString *)self->_clientIdentifier UTF8String];
          *(_DWORD *)buf = 68289795;
          int v18 = 0;
          __int16 v19 = 2082;
          v20 = "";
          __int16 v21 = 2082;
          v22 = v15;
          __int16 v23 = 2113;
          id v24 = a4;
          __int16 v25 = 2113;
          id v26 = a5;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"discovered BOM waking advertisement\", \"ClientId\":%{public, location:escape_only}s, \"peripheral\":%{private, location:escape_only}@, \"advertisementData\":%{private, location:escape_only}@}", buf, 0x30u);
        }
        [(CLAvengerScannerClientController *)self setBomScanEnabled:0];
        [(CLAvengerScannerClientController *)self startScanningWithUseCase:[(CLAvengerScannerClientController *)self defaultUseCase]];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_101636F8C;
        block[3] = &unk_10229FED8;
        block[4] = self;
        dispatch_async((dispatch_queue_t)[(CLAvengerScannerClientController *)self queue], block);
      }
    }
  }
}

- (id)parseAndNotifyDelegateOnDiscoveredPeripheral:(id)a3 RSSI:(id)a4
{
  id v5 = +[CLAvengerScannerParser convertToObjectDiscoveryDataWithAdvertisementData:a3 rssi:a4];
  if (v5)
  {
    if ([(CLAvengerScannerClientController *)self reconciler]) {
      id v6 = [[-[CLAvengerScannerClientController reconciler](self, "reconciler") attemptReconciliationWithAddress:[v5 address] advertisementData:objc_msgSend(v5, "advertisementData")];
    }
    else {
      id v6 = 0;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AFA8;
    block[3] = &unk_10229FF28;
    block[4] = self;
    void block[5] = v5;
    block[6] = v6;
    dispatch_async((dispatch_queue_t)[(CLAvengerScannerClientController *)self queue], block);
  }
  return v5;
}

- (CLAvengerReconciler)reconciler
{
  return self->_reconciler;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (BOOL)isDefaultScanType:(unsigned int)a3
{
  return a3 == 65559 || a3 >> 1 == 32772;
}

- (CLAvengerScannerClientController)initWithDelegate:(id)a3 centralManager:(id)a4 optedIn:(BOOL)a5 reconciler:(id)a6 queue:(id)a7 powerAssertionDelegate:(id)a8
{
  v23.receiver = self;
  v23.super_class = (Class)CLAvengerScannerClientController;
  result = [(CLAvengerScannerClientController *)&v23 init];
  if (result)
  {
    v15 = result;
    result = 0;
    if (a3)
    {
      if (a4 && a8)
      {
        objc_storeWeak((id *)&v15->_delegate, a3);
        v15->_centralManager = (CBCentralManager *)a4;
        v15->_currentUseCase = 0;
        v15->_centralManagerPoweredOn = 0;
        if (a6)
        {
          v15->_reconciler = (CLAvengerReconciler *)a6;
        }
        else
        {
          if (qword_102419570 != -1) {
            dispatch_once(&qword_102419570, &stru_1023327F0);
          }
          v16 = qword_102419578;
          if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_ERROR))
          {
            v17 = [(NSString *)v15->_clientIdentifier UTF8String];
            *(_DWORD *)buf = 68289282;
            int v25 = 0;
            __int16 v26 = 2082;
            v27 = "";
            __int16 v28 = 2082;
            v29 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"No reconciler provided\", \"ClientId\":%{public, location:escape_only}s}", buf, 0x1Cu);
            if (qword_102419570 != -1) {
              dispatch_once(&qword_102419570, &stru_1023327F0);
            }
          }
          int v18 = qword_102419578;
          if (os_signpost_enabled((os_log_t)qword_102419578))
          {
            __int16 v19 = [(NSString *)v15->_clientIdentifier UTF8String];
            *(_DWORD *)buf = 68289282;
            int v25 = 0;
            __int16 v26 = 2082;
            v27 = "";
            __int16 v28 = 2082;
            v29 = v19;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "No reconciler provided", "{\"msg%{public}.0s\":\"No reconciler provided\", \"ClientId\":%{public, location:escape_only}s}", buf, 0x1Cu);
          }
        }
        v15->_queue = (OS_dispatch_queue *)a7;
        v15->_optedIn = a5;
        objc_storeWeak((id *)&v15->_powerAssertionDelegate, a8);
        v15->_aggressiveToAggressiveLongUpgradeRequested = 0;
        if ([objc_loadWeak((id *)&v15->_delegate) clientIdentifier]) {
          v20 = (NSString *)[objc_loadWeak((id *)&v15->_delegate) clientIdentifier];
        }
        else {
          v20 = (NSString *)[objc_alloc((Class)NSString) initWithUTF8String:"UNKNOWN"];
        }
        v15->_clientIdentifier = v20;
        v15->_bomScanEnabled = 0;
        v15->_lastScanBufferEmptyDate = +[NSDate distantPast];
        queue = v15->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_101635564;
        block[3] = &unk_10229FED8;
        block[4] = v15;
        dispatch_async(queue, block);
        return v15;
      }
    }
  }
  return result;
}

- (void)dealloc
{
  if (qword_102419570 != -1) {
    dispatch_once(&qword_102419570, &stru_1023327F0);
  }
  v3 = qword_102419578;
  if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(NSString *)self->_clientIdentifier UTF8String];
    *(_DWORD *)buf = 68289282;
    int v7 = 0;
    __int16 v8 = 2082;
    v9 = "";
    __int16 v10 = 2082;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Ending scan\", \"ClientId\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  [(CLAvengerScannerClientController *)self submitClientRequestsEvent:&off_102395468 client:self->_clientIdentifier scanType:+[NSString stringWithUTF8String:"StopMonitor"]];
  objc_storeWeak((id *)&self->_delegate, 0);

  self->_centralManager = 0;
  self->_reconciler = 0;
  objc_storeWeak((id *)&self->_powerAssertionDelegate, 0);

  self->_clientIdentifier = 0;
  v5.receiver = self;
  v5.super_class = (Class)CLAvengerScannerClientController;
  [(CLAvengerScannerClientController *)&v5 dealloc];
}

- (BOOL)isAggressiveScanning
{
  return self->_currentUseCase - 65547 < 2;
}

- (BOOL)isLegacyAggressiveScanning
{
  return self->_currentUseCase == 65547;
}

- (BOOL)isAggressiveLongScanning
{
  return self->_currentUseCase == 65548;
}

- (BOOL)isDefaultScanning
{
  return +[CLAvengerScannerClientController isDefaultScanType:self->_currentUseCase];
}

- (BOOL)isLegacyAggressiveOrDefaultScanning
{
  if ([(CLAvengerScannerClientController *)self isLegacyAggressiveScanning]) {
    return 1;
  }

  return [(CLAvengerScannerClientController *)self isDefaultScanning];
}

+ (BOOL)shouldHoldPowerAssertionForScan:(unsigned int)a3
{
  return (a3 - 65547 < 4) & (0xBu >> ((a3 - 11) & 0xF));
}

- (void)stopScan
{
  if ([(CBCentralManager *)self->_centralManager isScanning])
  {
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_1023327F0);
    }
    v3 = qword_102419578;
    if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(NSString *)self->_clientIdentifier UTF8String];
      objc_super v5 = sub_101635924(self->_currentUseCase);
      v6[0] = 68289538;
      v6[1] = 0;
      __int16 v7 = 2082;
      __int16 v8 = "";
      __int16 v9 = 2082;
      __int16 v10 = v4;
      __int16 v11 = 2082;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"stopping scan\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s}", (uint8_t *)v6, 0x26u);
    }
    [(CBCentralManager *)self->_centralManager stopScan];
  }
}

- (void)scanCompletedWithError:(id)a3 totalRXTime:(id)a4
{
  if (qword_102419570 != -1) {
    dispatch_once(&qword_102419570, &stru_1023327F0);
  }
  __int16 v7 = qword_102419578;
  if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = [(NSString *)self->_clientIdentifier UTF8String];
    __int16 v9 = sub_101635924(self->_currentUseCase);
    *(_DWORD *)buf = 68290051;
    int v29 = 0;
    __int16 v30 = 2082;
    v31 = "";
    __int16 v32 = 2082;
    v33 = v8;
    __int16 v34 = 2113;
    id v35 = a3;
    __int16 v36 = 2113;
    id v37 = a4;
    __int16 v38 = 2082;
    v39 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"scan completion called\", \"ClientId\":%{public, location:escape_only}s, \"error\":%{private, location:escape_only}@, \"totalRXTime\":%{private, location:escape_only}@, \"CurrentUseCase\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  if ([a3 code] != (id)36 && objc_msgSend(a3, "code") != (id)35)
  {
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_1023327F0);
    }
    v22 = qword_102419578;
    if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_FAULT))
    {
      objc_super v23 = [(NSString *)self->_clientIdentifier UTF8String];
      id v24 = sub_101635924(self->_currentUseCase);
      *(_DWORD *)buf = 68289795;
      int v29 = 0;
      __int16 v30 = 2082;
      v31 = "";
      __int16 v32 = 2082;
      v33 = v23;
      __int16 v34 = 2113;
      id v35 = a3;
      __int16 v36 = 2082;
      id v37 = (id)v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unexpected error\", \"ClientId\":%{public, location:escape_only}s, \"error\":%{private, location:escape_only}@, \"CurrentUseCase\":%{public, location:escape_only}s}", buf, 0x30u);
      if (qword_102419570 != -1) {
        dispatch_once(&qword_102419570, &stru_1023327F0);
      }
    }
    v13 = qword_102419578;
    if (!os_signpost_enabled((os_log_t)qword_102419578)) {
      goto LABEL_39;
    }
    int v25 = [(NSString *)self->_clientIdentifier UTF8String];
    __int16 v26 = sub_101635924(self->_currentUseCase);
    *(_DWORD *)buf = 68289795;
    int v29 = 0;
    __int16 v30 = 2082;
    v31 = "";
    __int16 v32 = 2082;
    v33 = v25;
    __int16 v34 = 2113;
    id v35 = a3;
    __int16 v36 = 2082;
    id v37 = (id)v26;
    v16 = "Unexpected error";
    v17 = "{\"msg%{public}.0s\":\"Unexpected error\", \"ClientId\":%{public, location:escape_only}s, \"error\":%{private,"
          " location:escape_only}@, \"CurrentUseCase\":%{public, location:escape_only}s}";
    goto LABEL_38;
  }
  if (+[CLAvengerScannerClientController isDefaultScanType:self->_currentUseCase])
  {
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_1023327F0);
    }
    __int16 v10 = qword_102419578;
    if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_FAULT))
    {
      __int16 v11 = [(NSString *)self->_clientIdentifier UTF8String];
      id v12 = sub_101635924(self->_currentUseCase);
      *(_DWORD *)buf = 68289795;
      int v29 = 0;
      __int16 v30 = 2082;
      v31 = "";
      __int16 v32 = 2082;
      v33 = v11;
      __int16 v34 = 2113;
      id v35 = a3;
      __int16 v36 = 2082;
      id v37 = (id)v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Error with default scan type\", \"ClientId\":%{public, location:escape_only}s, \"error\":%{private, location:escape_only}@, \"CurrentUseCase\":%{public, location:escape_only}s}", buf, 0x30u);
      if (qword_102419570 != -1) {
        dispatch_once(&qword_102419570, &stru_1023327F0);
      }
    }
    v13 = qword_102419578;
    if (!os_signpost_enabled((os_log_t)qword_102419578)) {
      goto LABEL_39;
    }
    v14 = [(NSString *)self->_clientIdentifier UTF8String];
    v15 = sub_101635924(self->_currentUseCase);
    *(_DWORD *)buf = 68289795;
    int v29 = 0;
    __int16 v30 = 2082;
    v31 = "";
    __int16 v32 = 2082;
    v33 = v14;
    __int16 v34 = 2113;
    id v35 = a3;
    __int16 v36 = 2082;
    id v37 = (id)v15;
    v16 = "Error with default scan type";
    v17 = "{\"msg%{public}.0s\":\"Error with default scan type\", \"ClientId\":%{public, location:escape_only}s, \"error\""
          ":%{private, location:escape_only}@, \"CurrentUseCase\":%{public, location:escape_only}s}";
LABEL_38:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v16, v17, buf, 0x30u);
LABEL_39:
    self->_currentUseCase = 0;
    return;
  }
  if ([objc_loadWeak((id *)&self->_powerAssertionDelegate) hasPowerAssertion])
  {
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_1023327F0);
    }
    int v18 = qword_102419578;
    if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = [(NSString *)self->_clientIdentifier UTF8String];
      *(_DWORD *)buf = 68289282;
      int v29 = 0;
      __int16 v30 = 2082;
      v31 = "";
      __int16 v32 = 2082;
      v33 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Releasing PowerAssertion\", \"ClientId\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    [objc_loadWeak((id *)&self->_powerAssertionDelegate) releasePowerAssertion];
  }
  if ([(CLAvengerScannerClientController *)self isLegacyAggressiveScanning]
    && self->_aggressiveToAggressiveLongUpgradeRequested)
  {
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_1023327F0);
    }
    v20 = qword_102419578;
    if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = [(NSString *)self->_clientIdentifier UTF8String];
      *(_DWORD *)buf = 68289282;
      int v29 = 0;
      __int16 v30 = 2082;
      v31 = "";
      __int16 v32 = 2082;
      v33 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Performing scan upgrade from Aggressive to AggressiveLong\", \"ClientId\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    [(CLAvengerScannerClientController *)self startScanningWithUseCase:65548 isScanUpgrade:1];
    self->_aggressiveToAggressiveLongUpgradeRequested = 0;
  }
  else
  {
    if ([(CLAvengerScannerClientController *)self isAggressiveScanning])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_101636860;
      block[3] = &unk_10229FED8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)[(CLAvengerScannerClientController *)self queue], block);
    }
    [(CLAvengerScannerClientController *)self startScanningWithUseCase:[(CLAvengerScannerClientController *)self defaultUseCase]];
  }
}

- (void)startScanningWithUseCase:(unsigned int)a3
{
}

- (void)startScanningWithUseCase:(unsigned int)a3 isScanUpgrade:(BOOL)a4
{
  if (self->_centralManagerPoweredOn)
  {
    if (self->_currentUseCase == a3)
    {
      if (qword_102419570 != -1) {
        dispatch_once(&qword_102419570, &stru_1023327F0);
      }
      objc_super v5 = qword_102419578;
      if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_FAULT))
      {
        id v6 = [(NSString *)self->_clientIdentifier UTF8String];
        __int16 v7 = sub_101635924(self->_currentUseCase);
        id buf = (id)68289538;
        __int16 v32 = 2082;
        v33 = "";
        __int16 v34 = 2082;
        id v35 = v6;
        __int16 v36 = 2082;
        id v37 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Starting the same scan\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
        if (qword_102419570 != -1) {
          dispatch_once(&qword_102419570, &stru_1023327F0);
        }
      }
      __int16 v8 = qword_102419578;
      if (os_signpost_enabled((os_log_t)qword_102419578))
      {
        __int16 v9 = [(NSString *)self->_clientIdentifier UTF8String];
        __int16 v10 = sub_101635924(self->_currentUseCase);
        id buf = (id)68289538;
        __int16 v32 = 2082;
        v33 = "";
        __int16 v34 = 2082;
        id v35 = v9;
        __int16 v36 = 2082;
        id v37 = v10;
        __int16 v11 = "Starting the same scan";
        id v12 = "{\"msg%{public}.0s\":\"Starting the same scan\", \"ClientId\":%{public, location:escape_only}s, \"CurrentU"
              "seCase\":%{public, location:escape_only}s}";
LABEL_17:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v11, v12, (uint8_t *)&buf, 0x26u);
      }
    }
    else
    {
      self->_currentUseCase = a3;
      if (qword_102419570 != -1) {
        dispatch_once(&qword_102419570, &stru_1023327F0);
      }
      __int16 v19 = qword_102419578;
      if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [(NSString *)self->_clientIdentifier UTF8String];
        __int16 v21 = sub_101635924(self->_currentUseCase);
        id buf = (id)68289538;
        __int16 v32 = 2082;
        v33 = "";
        __int16 v34 = 2082;
        id v35 = v20;
        __int16 v36 = 2082;
        id v37 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"starting scan\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
      }
      if (+[CLAvengerScannerClientController shouldHoldPowerAssertionForScan:self->_currentUseCase])
      {
        if (qword_102419570 != -1) {
          dispatch_once(&qword_102419570, &stru_1023327F0);
        }
        v22 = qword_102419578;
        if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v23 = [(NSString *)self->_clientIdentifier UTF8String];
          id buf = (id)68289282;
          __int16 v32 = 2082;
          v33 = "";
          __int16 v34 = 2082;
          id v35 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Taking PowerAssertion\", \"ClientId\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
        }
        [objc_loadWeak((id *)&self->_powerAssertionDelegate) takePowerAssertion];
      }
      uint64_t v29 = CBCentralManagerScanOptionUsecase;
      __int16 v30 = +[NSNumber numberWithUnsignedInt:self->_currentUseCase];
      id v24 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      objc_initWeak(&buf, self);
      centralManager = self->_centralManager;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_101636E64;
      v27[3] = &unk_1023327D0;
      objc_copyWeak(&v28, &buf);
      [(CBCentralManager *)centralManager scanForPeripheralsWithServices:0 options:v24 completion:v27];
      if ([(CLAvengerScannerClientController *)self isAggressiveScanning] && !a4)
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_101636F5C;
        v26[3] = &unk_10229FED8;
        v26[4] = self;
        dispatch_async((dispatch_queue_t)[(CLAvengerScannerClientController *)self queue], v26);
      }
      objc_destroyWeak(&v28);
      objc_destroyWeak(&buf);
    }
  }
  else
  {
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_1023327F0);
    }
    v13 = qword_102419578;
    if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_FAULT))
    {
      v14 = [(NSString *)self->_clientIdentifier UTF8String];
      v15 = sub_101635924(self->_currentUseCase);
      id buf = (id)68289538;
      __int16 v32 = 2082;
      v33 = "";
      __int16 v34 = 2082;
      id v35 = v14;
      __int16 v36 = 2082;
      id v37 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Trying to startScanning with central manager powered off\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
      if (qword_102419570 != -1) {
        dispatch_once(&qword_102419570, &stru_1023327F0);
      }
    }
    __int16 v8 = qword_102419578;
    if (os_signpost_enabled((os_log_t)qword_102419578))
    {
      v16 = [(NSString *)self->_clientIdentifier UTF8String];
      v17 = sub_101635924(self->_currentUseCase);
      id buf = (id)68289538;
      __int16 v32 = 2082;
      v33 = "";
      __int16 v34 = 2082;
      id v35 = v16;
      __int16 v36 = 2082;
      id v37 = v17;
      __int16 v11 = "Trying to startScanning with central manager powered off";
      id v12 = "{\"msg%{public}.0s\":\"Trying to startScanning with central manager powered off\", \"ClientId\":%{public, lo"
            "cation:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s}";
      goto LABEL_17;
    }
  }
}

- (void)centralManager:(id)a3 didDiscoverMultiplePeripherals:(id)a4
{
  if (qword_102419570 != -1) {
    dispatch_once(&qword_102419570, &stru_1023327F0);
  }
  objc_super v5 = qword_102419578;
  if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(NSString *)self->_clientIdentifier UTF8String];
    uint64_t buf = 68289539;
    __int16 v32 = 2082;
    v33 = "";
    __int16 v34 = 2082;
    id v35 = v6;
    __int16 v36 = 2049;
    id v37 = [a4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"didDiscoverMultiplePeripherals\", \"ClientId\":%{public, location:escape_only}s, \"peripheralsCount\":%{private}lu}", (uint8_t *)&buf, 0x26u);
  }
  if ([(NSDate *)[(CLAvengerScannerClientController *)self lastScanBufferEmptyDate] isEqualToDate:+[NSDate distantPast]])
  {
    int v7 = -1;
  }
  else
  {
    [+[NSDate now] timeIntervalSinceDate:[(CLAvengerScannerClientController *)self lastScanBufferEmptyDate]];
    int v7 = (int)v8;
  }
  HIDWORD(v19) = v7;
  [(CLAvengerScannerClientController *)self setLastScanBufferEmptyDate:+[NSDate now]];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = [a4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v21 = 0;
    unsigned int v11 = 0;
    unsigned int v12 = 0;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(a4);
        }
        id v15 = [[self parseAndNotifyDelegateOnDiscoveredPeripheral:RSSI:][*(id *)(*((void *)&v26 + 1) + 8 * i) objectForKeyedSubscript:@"kCBMsgArgAdvertisementData"], objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "objectForKeyedSubscript:", @"kCBMsgArgRssi")];
        if (v15)
        {
          v16 = v15;
          unsigned int v17 = [v15 isNearOwner];
          unsigned int v18 = [v16 isPosh];
          if (v17)
          {
            ++v11;
            if (v18 && [v16 isApple])
            {
              ++HIDWORD(v22);
            }
            else if (([v16 isPosh] & 1) != 0 {
                   || ![v16 isApple])
            }
            {
              if ([v16 isPosh]) {
                HIDWORD(v23) += [v16 isApple] ^ 1;
              }
            }
            else
            {
              LODWORD(v21) = v21 + 1;
            }
          }
          else
          {
            ++v12;
            if (v18 && [v16 isApple])
            {
              LODWORD(v22) = v22 + 1;
            }
            else if (([v16 isPosh] & 1) != 0 {
                   || ![v16 isApple])
            }
            {
              if ([v16 isPosh]) {
                LODWORD(v23) = v23 + ([v16 isApple] ^ 1);
              }
            }
            else
            {
              ++HIDWORD(v21);
            }
          }
        }
      }
      id v10 = [a4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v21 = 0;
    unsigned int v11 = 0;
    unsigned int v12 = 0;
  }
  LODWORD(v19) = HIDWORD(v19);
  -[CLAvengerScannerClientController submitBufferEmptyAnalyticsCounts:numNOApplePosh:numNONonApplePosh:numWildAppleType18:numWildApplePosh:numWildNonApplePosh:totalNearOwnerAdv:totalWildAdv:timeSinceLastBufferEmpty:](self, "submitBufferEmptyAnalyticsCounts:numNOApplePosh:numNONonApplePosh:numWildAppleType18:numWildApplePosh:numWildNonApplePosh:totalNearOwnerAdv:totalWildAdv:timeSinceLastBufferEmpty:", v21, HIDWORD(v22), HIDWORD(v23), HIDWORD(v21), v22, v23, __PAIR64__(v12, v11), v19);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1016373B8;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(CLAvengerScannerClientController *)self queue], block);
}

- (void)submitBufferEmptyAnalyticsCounts:(unsigned int)a3 numNOApplePosh:(unsigned int)a4 numNONonApplePosh:(unsigned int)a5 numWildAppleType18:(unsigned int)a6 numWildApplePosh:(unsigned int)a7 numWildNonApplePosh:(unsigned int)a8 totalNearOwnerAdv:(unsigned int)a9 totalWildAdv:(unsigned int)a10 timeSinceLastBufferEmpty:(int)a11
{
  uint64_t v11 = *(void *)&a8;
  uint64_t v12 = *(void *)&a7;
  uint64_t v13 = *(void *)&a6;
  uint64_t v14 = *(void *)&a5;
  uint64_t v15 = *(void *)&a4;
  uint64_t v16 = *(void *)&a3;
  v29[0] = +[NSString stringWithUTF8String:"numNOAppleType18"];
  v30[0] = +[NSNumber numberWithUnsignedInt:v16];
  v29[1] = +[NSString stringWithUTF8String:"numNOApplePosh"];
  v30[1] = +[NSNumber numberWithUnsignedInt:v15];
  v29[2] = +[NSString stringWithUTF8String:"numNONonApplePosh"];
  v30[2] = +[NSNumber numberWithUnsignedInt:v14];
  v29[3] = +[NSString stringWithUTF8String:"numWildAppleType18"];
  v30[3] = +[NSNumber numberWithUnsignedInt:v13];
  v29[4] = +[NSString stringWithUTF8String:"numWildApplePosh"];
  v30[4] = +[NSNumber numberWithUnsignedInt:v12];
  v29[5] = +[NSString stringWithUTF8String:"numWildNonApplePosh"];
  v30[5] = +[NSNumber numberWithUnsignedInt:v11];
  v29[6] = +[NSString stringWithUTF8String:"totalNearOwnerAdv"];
  v30[6] = +[NSNumber numberWithUnsignedInt:a9];
  v29[7] = +[NSString stringWithUTF8String:"totalWildAdv"];
  v30[7] = +[NSNumber numberWithUnsignedInt:a10];
  v29[8] = +[NSString stringWithUTF8String:"timeSinceLastBufferEmpty"];
  v30[8] = +[NSNumber numberWithInt:a11];
  v29[9] = +[NSString stringWithUTF8String:"client"];
  v30[9] = [(CLAvengerScannerClientController *)self clientIdentifier];
  unsigned int v17 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:10]);
  if (qword_102419570 != -1) {
    dispatch_once(&qword_102419570, &stru_1023327F0);
  }
  unsigned int v18 = qword_102419578;
  if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [(NSString *)self->_clientIdentifier UTF8String];
    *(_DWORD *)uint64_t buf = 68289538;
    int v22 = 0;
    __int16 v23 = 2082;
    id v24 = "";
    __int16 v25 = 2082;
    long long v26 = v19;
    __int16 v27 = 2114;
    long long v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: submitBufferEmptyEvent\", \"ClientId\":%{public, location:escape_only}s, \"analyticsEvent\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  +[NSString stringWithUTF8String:"com.apple.locationd.onAdvBufferFlush"];
  AnalyticsSendEventLazy();
}

- (void)centralManagerDidUpdateState:(id)a3
{
  int centralManagerPoweredOn = self->_centralManagerPoweredOn;
  id v5 = [a3 state];
  int v7 = v5 == (id)5 || v5 == (id)10;
  self->_int centralManagerPoweredOn = v7;
  if (centralManagerPoweredOn != v7)
  {
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_1023327F0);
    }
    double v8 = qword_102419578;
    if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(NSString *)self->_clientIdentifier UTF8String];
      BOOL v10 = self->_centralManagerPoweredOn;
      *(_DWORD *)uint64_t buf = 68289794;
      int v16 = 0;
      __int16 v17 = 2082;
      unsigned int v18 = "";
      __int16 v19 = 2082;
      v20 = v9;
      __int16 v21 = 1026;
      int v22 = centralManagerPoweredOn;
      __int16 v23 = 1026;
      BOOL v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"didUpdateState\", \"ClientId\":%{public, location:escape_only}s, \"wasPoweredOn\":%{public}hhd, \"isPoweredOn\":%{public}hhd}", buf, 0x28u);
    }
    if (centralManagerPoweredOn)
    {
      if (!self->_centralManagerPoweredOn)
      {
        if ([objc_loadWeak((id *)&self->_powerAssertionDelegate) hasPowerAssertion])
        {
          if (qword_102419570 != -1) {
            dispatch_once(&qword_102419570, &stru_1023327F0);
          }
          uint64_t v11 = qword_102419578;
          if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = [(NSString *)self->_clientIdentifier UTF8String];
            *(_DWORD *)uint64_t buf = 68289282;
            int v16 = 0;
            __int16 v17 = 2082;
            unsigned int v18 = "";
            __int16 v19 = 2082;
            v20 = v12;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Releasing PowerAssertion\", \"ClientId\":%{public, location:escape_only}s}", buf, 0x1Cu);
          }
          [objc_loadWeak((id *)&self->_powerAssertionDelegate) releasePowerAssertion];
        }
        if ([(CLAvengerScannerClientController *)self isAggressiveScanning])
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1016379FC;
          block[3] = &unk_10229FED8;
          block[4] = self;
          dispatch_async((dispatch_queue_t)[(CLAvengerScannerClientController *)self queue], block);
        }
        self->_currentUseCase = 0;
      }
    }
    else if (self->_centralManagerPoweredOn)
    {
      [(CLAvengerScannerClientController *)self startScanningWithUseCase:[(CLAvengerScannerClientController *)self defaultUseCase]];
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_101637A2C;
    v13[3] = &unk_10229FED8;
    v13[4] = self;
    dispatch_async((dispatch_queue_t)[(CLAvengerScannerClientController *)self queue], v13);
  }
}

- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4
{
  if (qword_102419570 != -1) {
    dispatch_once(&qword_102419570, &stru_1023327F0);
  }
  id v6 = qword_102419578;
  if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_ERROR))
  {
    int v7 = [(NSString *)self->_clientIdentifier UTF8String];
    int v10 = 68289538;
    int v11 = 0;
    __int16 v12 = 2082;
    uint64_t v13 = "";
    __int16 v14 = 2082;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    id v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"didFailToScan\", \"ClientId\":%{public, location:escape_only}s, \"error\":%{public, location:escape_only}@}", (uint8_t *)&v10, 0x26u);
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_1023327F0);
    }
  }
  double v8 = qword_102419578;
  if (os_signpost_enabled((os_log_t)qword_102419578))
  {
    id v9 = [(NSString *)self->_clientIdentifier UTF8String];
    int v10 = 68289538;
    int v11 = 0;
    __int16 v12 = 2082;
    uint64_t v13 = "";
    __int16 v14 = 2082;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    id v17 = a4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "didFailToScan", "{\"msg%{public}.0s\":\"didFailToScan\", \"ClientId\":%{public, location:escape_only}s, \"error\":%{public, location:escape_only}@}", (uint8_t *)&v10, 0x26u);
  }
}

- (BOOL)performTemporaryAggressiveScan
{
  if (+[CLAvengerScannerClientController isDefaultScanType:self->_currentUseCase]&& self->_centralManagerPoweredOn)
  {
    [(CLAvengerScannerClientController *)self startScanningWithUseCase:65547];
    [(CLAvengerScannerClientController *)self submitClientRequestsEvent:&off_102395468 client:self->_clientIdentifier scanType:+[NSString stringWithUTF8String:"Aggressive"]];
    return 1;
  }
  else
  {
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_1023327F0);
    }
    v4 = qword_102419578;
    BOOL v5 = os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v5)
    {
      id v6 = [(NSString *)self->_clientIdentifier UTF8String];
      int v7 = sub_101635924(self->_currentUseCase);
      BOOL centralManagerPoweredOn = self->_centralManagerPoweredOn;
      v9[0] = 68289794;
      v9[1] = 0;
      __int16 v10 = 2082;
      int v11 = "";
      __int16 v12 = 2082;
      uint64_t v13 = v6;
      __int16 v14 = 2082;
      uint64_t v15 = v7;
      __int16 v16 = 1026;
      BOOL v17 = centralManagerPoweredOn;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Not starting aggressives scan due to invalid state\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"PoweredOn\":%{public}hhd}", (uint8_t *)v9, 0x2Cu);
      return 0;
    }
  }
  return result;
}

- (BOOL)performTemporaryLongAggressiveScan
{
  if ([(CLAvengerScannerClientController *)self isLegacyAggressiveOrDefaultScanning]&& self->_centralManagerPoweredOn)
  {
    if ([(CLAvengerScannerClientController *)self isLegacyAggressiveScanning]) {
      self->_aggressiveToAggressiveLongUpgradeRequested = 1;
    }
    else {
      [(CLAvengerScannerClientController *)self startScanningWithUseCase:65548];
    }
    [(CLAvengerScannerClientController *)self submitClientRequestsEvent:&off_102395468 client:self->_clientIdentifier scanType:+[NSString stringWithUTF8String:"AggressiveLong"]];
    return 1;
  }
  else
  {
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_1023327F0);
    }
    v3 = qword_102419578;
    BOOL v4 = os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v4)
    {
      id v6 = [(NSString *)self->_clientIdentifier UTF8String];
      int v7 = sub_101635924(self->_currentUseCase);
      BOOL centralManagerPoweredOn = self->_centralManagerPoweredOn;
      v9[0] = 68289794;
      v9[1] = 0;
      __int16 v10 = 2082;
      int v11 = "";
      __int16 v12 = 2082;
      uint64_t v13 = v6;
      __int16 v14 = 2082;
      uint64_t v15 = v7;
      __int16 v16 = 1026;
      BOOL v17 = centralManagerPoweredOn;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Not starting long aggressives scan due to invalid state\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"PoweredOn\":%{public}hhd}", (uint8_t *)v9, 0x2Cu);
      return 0;
    }
  }
  return result;
}

- (BOOL)stopTemporaryLongAggressiveScan
{
  if ([(CLAvengerScannerClientController *)self isAggressiveScanning]
    && self->_centralManagerPoweredOn)
  {
    if ([(CLAvengerScannerClientController *)self isAggressiveLongScanning])
    {
      [(CLAvengerScannerClientController *)self stopScan];
LABEL_5:
      [(CLAvengerScannerClientController *)self submitClientRequestsEvent:&off_102395468 client:self->_clientIdentifier scanType:+[NSString stringWithUTF8String:"StopAggressiveLong"]];
      LOBYTE(v3) = 1;
      return v3;
    }
    if ([(CLAvengerScannerClientController *)self isLegacyAggressiveScanning]
      && self->_aggressiveToAggressiveLongUpgradeRequested)
    {
      self->_BOOL aggressiveToAggressiveLongUpgradeRequested = 0;
      if (qword_102419570 != -1) {
        dispatch_once(&qword_102419570, &stru_1023327F0);
      }
      id v9 = qword_102419578;
      if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = [(NSString *)self->_clientIdentifier UTF8String];
        int v20 = 68289282;
        int v21 = 0;
        __int16 v22 = 2082;
        __int16 v23 = "";
        __int16 v24 = 2082;
        __int16 v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Canceled scan upgrade\", \"ClientId\":%{public, location:escape_only}s}", (uint8_t *)&v20, 0x1Cu);
      }
      goto LABEL_5;
    }
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_1023327F0);
    }
    int v11 = qword_102419578;
    if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = [(NSString *)self->_clientIdentifier UTF8String];
      uint64_t v13 = sub_101635924(self->_currentUseCase);
      BOOL aggressiveToAggressiveLongUpgradeRequested = self->_aggressiveToAggressiveLongUpgradeRequested;
      int v20 = 68289794;
      int v21 = 0;
      __int16 v22 = 2082;
      __int16 v23 = "";
      __int16 v24 = 2082;
      __int16 v25 = v12;
      __int16 v26 = 2082;
      __int16 v27 = v13;
      __int16 v28 = 1026;
      BOOL v29 = aggressiveToAggressiveLongUpgradeRequested;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"No long aggressive scan to stop\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"scanUpgradeRequested\":%{public}hhd}", (uint8_t *)&v20, 0x2Cu);
      if (qword_102419570 != -1) {
        dispatch_once(&qword_102419570, &stru_1023327F0);
      }
    }
    uint64_t v15 = qword_102419578;
    BOOL v3 = os_signpost_enabled((os_log_t)qword_102419578);
    if (v3)
    {
      __int16 v16 = [(NSString *)self->_clientIdentifier UTF8String];
      BOOL v17 = sub_101635924(self->_currentUseCase);
      BOOL v18 = self->_aggressiveToAggressiveLongUpgradeRequested;
      int v20 = 68289794;
      int v21 = 0;
      __int16 v22 = 2082;
      __int16 v23 = "";
      __int16 v24 = 2082;
      __int16 v25 = v16;
      __int16 v26 = 2082;
      __int16 v27 = v17;
      __int16 v28 = 1026;
      BOOL v29 = v18;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "No long aggressive scan to stop", "{\"msg%{public}.0s\":\"No long aggressive scan to stop\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"scanUpgradeRequested\":%{public}hhd}", (uint8_t *)&v20, 0x2Cu);
      goto LABEL_10;
    }
  }
  else
  {
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_1023327F0);
    }
    BOOL v4 = qword_102419578;
    BOOL v5 = os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v3) = 0;
    if (v5)
    {
      id v6 = [(NSString *)self->_clientIdentifier UTF8String];
      int v7 = sub_101635924(self->_currentUseCase);
      BOOL centralManagerPoweredOn = self->_centralManagerPoweredOn;
      int v20 = 68289794;
      int v21 = 0;
      __int16 v22 = 2082;
      __int16 v23 = "";
      __int16 v24 = 2082;
      __int16 v25 = v6;
      __int16 v26 = 2082;
      __int16 v27 = v7;
      __int16 v28 = 1026;
      BOOL v29 = centralManagerPoweredOn;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Not stopping long aggressives scan due to invalid state\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"PoweredOn\":%{public}hhd}", (uint8_t *)&v20, 0x2Cu);
LABEL_10:
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)performTemporaryHawkeyeLowEnergyScan
{
  if (+[CLAvengerScannerClientController isDefaultScanType:self->_currentUseCase]&& self->_centralManagerPoweredOn)
  {
    [(CLAvengerScannerClientController *)self startScanningWithUseCase:65550];
    [(CLAvengerScannerClientController *)self submitClientRequestsEvent:&off_102395468 client:self->_clientIdentifier scanType:+[NSString stringWithUTF8String:"HELE"]];
    return 1;
  }
  else
  {
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_1023327F0);
    }
    BOOL v4 = qword_102419578;
    BOOL v5 = os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v5)
    {
      id v6 = [(NSString *)self->_clientIdentifier UTF8String];
      int v7 = sub_101635924(self->_currentUseCase);
      BOOL centralManagerPoweredOn = self->_centralManagerPoweredOn;
      v9[0] = 68289794;
      v9[1] = 0;
      __int16 v10 = 2082;
      int v11 = "";
      __int16 v12 = 2082;
      uint64_t v13 = v6;
      __int16 v14 = 2082;
      uint64_t v15 = v7;
      __int16 v16 = 1026;
      BOOL v17 = centralManagerPoweredOn;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Not starting HELE scan due to invalid state\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"PoweredOn\":%{public}hhd}", (uint8_t *)v9, 0x2Cu);
      return 0;
    }
  }
  return result;
}

- (BOOL)startBTFindingScan
{
  if (+[CLAvengerScannerClientController isDefaultScanType:self->_currentUseCase]&& self->_centralManagerPoweredOn)
  {
    [(CLAvengerScannerClientController *)self startScanningWithUseCase:65549];
    [(CLAvengerScannerClientController *)self submitClientRequestsEvent:&off_102395468 client:self->_clientIdentifier scanType:+[NSString stringWithUTF8String:"StartBTFinding"]];
    return 1;
  }
  else
  {
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_1023327F0);
    }
    BOOL v4 = qword_102419578;
    BOOL v5 = os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v5)
    {
      id v6 = [(NSString *)self->_clientIdentifier UTF8String];
      int v7 = sub_101635924(self->_currentUseCase);
      BOOL centralManagerPoweredOn = self->_centralManagerPoweredOn;
      v9[0] = 68289794;
      v9[1] = 0;
      __int16 v10 = 2082;
      int v11 = "";
      __int16 v12 = 2082;
      uint64_t v13 = v6;
      __int16 v14 = 2082;
      uint64_t v15 = v7;
      __int16 v16 = 1026;
      BOOL v17 = centralManagerPoweredOn;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Not starting BT Finding scan due to invalid state\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"PoweredOn\":%{public}hhd}", (uint8_t *)v9, 0x2Cu);
      return 0;
    }
  }
  return result;
}

- (BOOL)stopBTFindingScan
{
  if (self->_currentUseCase == 65549 && self->_centralManagerPoweredOn)
  {
    [(CLAvengerScannerClientController *)self stopScan];
    [(CLAvengerScannerClientController *)self submitClientRequestsEvent:&off_102395468 client:self->_clientIdentifier scanType:+[NSString stringWithUTF8String:"StopBTFinding"]];
    return 1;
  }
  else
  {
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_1023327F0);
    }
    BOOL v4 = qword_102419578;
    BOOL v5 = os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v5)
    {
      id v6 = [(NSString *)self->_clientIdentifier UTF8String];
      int v7 = sub_101635924(self->_currentUseCase);
      BOOL centralManagerPoweredOn = self->_centralManagerPoweredOn;
      v9[0] = 68289794;
      v9[1] = 0;
      __int16 v10 = 2082;
      int v11 = "";
      __int16 v12 = 2082;
      uint64_t v13 = v6;
      __int16 v14 = 2082;
      uint64_t v15 = v7;
      __int16 v16 = 1026;
      BOOL v17 = centralManagerPoweredOn;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Not stopping BT Finding scan due to invalid state\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"PoweredOn\":%{public}hhd}", (uint8_t *)v9, 0x2Cu);
      return 0;
    }
  }
  return result;
}

- (BOOL)isScanning
{
  return self->_centralManagerPoweredOn && self->_currentUseCase != 0;
}

- (unsigned)defaultUseCase
{
  if ([(CLAvengerScannerClientController *)self bomScanEnabled]
    && ![(CLAvengerScannerClientController *)self optedIn])
  {
    return 65559;
  }
  if (self->_optedIn) {
    return 65545;
  }
  return 65544;
}

- (BOOL)getOptedIn
{
  return self->_optedIn;
}

- (void)setOptedIn:(BOOL)a3
{
  if (self->_optedIn != a3)
  {
    self->_optedIn = a3;
    if (self->_centralManagerPoweredOn)
    {
      uint64_t v4 = [(CLAvengerScannerClientController *)self defaultUseCase];
      [(CLAvengerScannerClientController *)self startScanningWithUseCase:v4];
    }
  }
}

- (BOOL)poweredOn
{
  return [(CLAvengerScannerClientController *)self centralManagerPoweredOn];
}

- (BOOL)performNotOptedInBOMScan
{
  if (!_os_feature_enabled_impl() || [(CLAvengerScannerClientController *)self optedIn]) {
    return 0;
  }
  BOOL v3 = 1;
  if (![(CLAvengerScannerClientController *)self bomScanEnabled])
  {
    [(CLAvengerScannerClientController *)self setBomScanEnabled:1];
    if (self->_centralManagerPoweredOn) {
      [(CLAvengerScannerClientController *)self startScanningWithUseCase:[(CLAvengerScannerClientController *)self defaultUseCase]];
    }
  }
  return v3;
}

- (void)submitClientRequestsEvent:(id)a3 client:(id)a4 scanType:(id)a5
{
  v20[0] = +[NSString stringWithUTF8String:"requestCount"];
  v21[0] = a3;
  v20[1] = +[NSString stringWithUTF8String:"client"];
  v21[1] = a4;
  v20[2] = +[NSString stringWithUTF8String:"scanType"];
  v21[2] = a5;
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3]);
  if (qword_102419570 != -1) {
    dispatch_once(&qword_102419570, &stru_1023327F0);
  }
  __int16 v10 = qword_102419578;
  if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = [(NSString *)self->_clientIdentifier UTF8String];
    *(_DWORD *)uint64_t buf = 68289538;
    int v13 = 0;
    __int16 v14 = 2082;
    uint64_t v15 = "";
    __int16 v16 = 2082;
    BOOL v17 = v11;
    __int16 v18 = 2114;
    __int16 v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: submitClientRequestsEvent\", \"ClientId\":%{public, location:escape_only}s, \"analyticsEvent\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  +[NSString stringWithUTF8String:"com.apple.locationd.avengerscanner.clientrequests"];
  AnalyticsSendEventLazy();
}

- (void)initializeClientRequestsViewsWithZeroValues:(id)a3
{
  v15[0] = +[NSString stringWithUTF8String:"Aggressive"];
  v15[1] = +[NSString stringWithUTF8String:"StartBTFinding"];
  v15[2] = +[NSString stringWithUTF8String:"StopBTFinding"];
  v15[3] = +[NSString stringWithUTF8String:"AggressiveLong"];
  v15[4] = +[NSString stringWithUTF8String:"HELE"];
  v15[5] = +[NSString stringWithUTF8String:"StartMonitor"];
  v15[6] = +[NSString stringWithUTF8String:"StopMonitor"];
  BOOL v5 = +[NSArray arrayWithObjects:v15 count:7];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CLAvengerScannerClientController *)self submitClientRequestsEvent:&off_102395480 client:a3 scanType:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (CLAvengerScannerClientDelegateProtocol)delegate
{
  return (CLAvengerScannerClientDelegateProtocol *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  self->_centralManager = (CBCentralManager *)a3;
}

- (unsigned)currentUseCase
{
  return self->_currentUseCase;
}

- (void)setCurrentUseCase:(unsigned int)a3
{
  self->_currentUseCase = a3;
}

- (BOOL)centralManagerPoweredOn
{
  return self->_centralManagerPoweredOn;
}

- (void)setCentralManagerPoweredOn:(BOOL)a3
{
  self->_BOOL centralManagerPoweredOn = a3;
}

- (void)setReconciler:(id)a3
{
  self->_reconciler = (CLAvengerReconciler *)a3;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (BOOL)optedIn
{
  return self->_optedIn;
}

- (CLAvengerScannerClientControllerPowerAssertionDelegateProtocol)powerAssertionDelegate
{
  return (CLAvengerScannerClientControllerPowerAssertionDelegateProtocol *)objc_loadWeak((id *)&self->_powerAssertionDelegate);
}

- (void)setPowerAssertionDelegate:(id)a3
{
}

- (BOOL)aggressiveToAggressiveLongUpgradeRequested
{
  return self->_aggressiveToAggressiveLongUpgradeRequested;
}

- (void)setAggressiveToAggressiveLongUpgradeRequested:(BOOL)a3
{
  self->_BOOL aggressiveToAggressiveLongUpgradeRequested = a3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  self->_clientIdentifier = (NSString *)a3;
}

- (BOOL)bomScanEnabled
{
  return self->_bomScanEnabled;
}

- (void)setBomScanEnabled:(BOOL)a3
{
  self->_bomScanEnabled = a3;
}

- (NSDate)lastScanBufferEmptyDate
{
  return self->_lastScanBufferEmptyDate;
}

- (void)setLastScanBufferEmptyDate:(id)a3
{
  self->_lastScanBufferEmptyDate = (NSDate *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_powerAssertionDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

@end