@interface WiProxScanner
- (BOOL)highDutyCycle;
- (BOOL)invalidated;
- (BOOL)isPoweredOn;
- (BOOL)isScanning;
- (NSArray)filteredPeers;
- (NSData)filteringBlob;
- (NSData)filteringMask;
- (WPMagicSwitch)wirelessProximityManager;
- (WiProxScanner)initWithDelegate:(id)a3;
- (WiProxScannerDelegate)delegate;
- (void)dealloc;
- (void)invalidate;
- (void)magicSwitch:(id)a3 failedToStartScanningWithError:(id)a4;
- (void)magicSwitch:(id)a3 foundDevice:(id)a4 withData:(id)a5;
- (void)magicSwitchDidUpdateState:(id)a3;
- (void)magicSwitchStartedScanning:(id)a3;
- (void)magicSwitchStoppedScanning:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilteredPeers:(id)a3;
- (void)setFilteringBlob:(id)a3;
- (void)setFilteringMask:(id)a3;
- (void)setHighDutyCycle:(BOOL)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setWirelessProximityManager:(id)a3;
- (void)startScanningWithHighDutyCycle:(BOOL)a3 filteredPeers:(id)a4 filteringBlob:(id)a5 filteringMask:(id)a6;
- (void)stopScanning;
@end

@implementation WiProxScanner

- (WiProxScanner)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WiProxScanner;
  v5 = [(WiProxScanner *)&v13 init];
  if (v5)
  {
    v6 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- Initializing (%p)", buf, 0xCu);
    }
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v7 = objc_alloc((Class)WPMagicSwitch);
    v8 = +[MagicSwitchEnabler sharedInstance];
    v9 = [v8 workQueue];
    v10 = (WPMagicSwitch *)[v7 initWithDelegate:v5 queue:v9];
    wirelessProximityManager = v5->_wirelessProximityManager;
    v5->_wirelessProximityManager = v10;
  }
  return v5;
}

- (void)dealloc
{
  if (!self->_invalidated) {
    [(WiProxScanner *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)WiProxScanner;
  [(WiProxScanner *)&v3 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    objc_super v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- Invalidating (%p)", (uint8_t *)&v5, 0xCu);
    }
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_delegate, 0);
    if (self->_isScanning) {
      [(WiProxScanner *)self stopScanning];
    }
    [(WPMagicSwitch *)self->_wirelessProximityManager setDelegate:0];
    [(WPMagicSwitch *)self->_wirelessProximityManager invalidate];
    wirelessProximityManager = self->_wirelessProximityManager;
    self->_wirelessProximityManager = 0;
  }
}

- (void)startScanningWithHighDutyCycle:(BOOL)a3 filteredPeers:(id)a4 filteringBlob:(id)a5 filteringMask:(id)a6
{
  BOOL v9 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_isScanning)
  {
    v14 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Already scanning", (uint8_t *)&v22, 2u);
    }
  }
  if (![v11 count])
  {
    v15 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No filtered peers", (uint8_t *)&v22, 2u);
    }
  }
  if ((unint64_t)[v12 length] >= 0x17)
  {
    v16 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Blob too large", (uint8_t *)&v22, 2u);
    }
  }
  if ((unint64_t)[v13 length] >= 0x17)
  {
    v17 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Mask too large", (uint8_t *)&v22, 2u);
    }
  }
  if (!self->_isScanning)
  {
    self->_isScanning = 1;
    self->_highDutyCycle = v9;
    objc_storeStrong((id *)&self->_filteredPeers, a4);
    objc_storeStrong((id *)&self->_filteringBlob, a5);
    objc_storeStrong((id *)&self->_filteringMask, a6);
    if (v9) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 0;
    }
    v24[0] = WPMagicSwitchScanBlobData;
    v24[1] = WPMagicSwitchScanMaskData;
    v25[0] = v12;
    v25[1] = v13;
    v24[2] = WPMagicSwitchScanDutyCycle;
    v19 = +[NSNumber numberWithInteger:v18];
    v24[3] = WPMagicSwitchScanPeers;
    v25[2] = v19;
    v25[3] = v11;
    v20 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];

    v21 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      v23 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- Telling WirelessProximity to start scanning with options: (%@)", (uint8_t *)&v22, 0xCu);
    }
    [(WPMagicSwitch *)self->_wirelessProximityManager startScanningWithData:v20];
  }
}

- (void)stopScanning
{
  if (self->_isScanning) {
    goto LABEL_5;
  }
  objc_super v3 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not scanning", buf, 2u);
  }
  if (self->_isScanning)
  {
LABEL_5:
    self->_isScanning = 0;
    id v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- Telling WirelessProximity to stop scanning", v5, 2u);
    }
    [(WPMagicSwitch *)self->_wirelessProximityManager stopScanning];
  }
}

- (BOOL)isPoweredOn
{
  return [(WPMagicSwitch *)self->_wirelessProximityManager state] == (id)3;
}

- (BOOL)highDutyCycle
{
  if (!self->_isScanning)
  {
    objc_super v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not scanning", v5, 2u);
    }
  }
  return self->_highDutyCycle;
}

- (NSArray)filteredPeers
{
  if (!self->_isScanning)
  {
    objc_super v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not scanning", v6, 2u);
    }
  }
  filteredPeers = self->_filteredPeers;

  return filteredPeers;
}

- (NSData)filteringBlob
{
  if (!self->_isScanning)
  {
    objc_super v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not scanning", v6, 2u);
    }
  }
  filteringBlob = self->_filteringBlob;

  return filteringBlob;
}

- (void)magicSwitchDidUpdateState:(id)a3
{
  wirelessProximityManager = (WPMagicSwitch *)a3;
  int v5 = wirelessProximityManager;
  if (self->_wirelessProximityManager != wirelessProximityManager)
  {
    v6 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unknown WPMagicSwitch", (uint8_t *)&v12, 2u);
    }
    wirelessProximityManager = self->_wirelessProximityManager;
  }
  uint64_t v7 = (uint64_t)[(WPMagicSwitch *)wirelessProximityManager state];
  v8 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = v8;
    v10 = +[WPClient stateAsString:v7];
    int v12 = 138412290;
    id v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- WPMagicSwitch did update state (%@)", (uint8_t *)&v12, 0xCu);
  }
  if (v7 <= 2)
  {
    if (v7 == 2)
    {
      if (self->_isScanning) {
        [(WiProxScanner *)self stopScanning];
      }
    }
    else
    {
      self->_isScanning = 0;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained wiProxScannerChangedState];
}

- (void)magicSwitchStartedScanning:(id)a3
{
  id v4 = (WPMagicSwitch *)a3;
  if (self->_wirelessProximityManager != v4)
  {
    int v5 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unknown WPMagicSwitch", buf, 2u);
    }
  }
  v6 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- WPMagicSwitch started scanning", v7, 2u);
  }
}

- (void)magicSwitchStoppedScanning:(id)a3
{
  id v4 = (WPMagicSwitch *)a3;
  if (self->_wirelessProximityManager != v4)
  {
    int v5 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unknown WPMagicSwitch", buf, 2u);
    }
  }
  v6 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- WPMagicSwitch stopped scanning", v7, 2u);
  }
}

- (void)magicSwitch:(id)a3 failedToStartScanningWithError:(id)a4
{
  v6 = (WPMagicSwitch *)a3;
  id v7 = a4;
  if (self->_wirelessProximityManager != v6)
  {
    v8 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unknown WPMagicSwitch", (uint8_t *)&v10, 2u);
    }
  }
  BOOL v9 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- WPMagicSwitch failed to start scanning with error: (%@)", (uint8_t *)&v10, 0xCu);
  }
}

- (void)magicSwitch:(id)a3 foundDevice:(id)a4 withData:(id)a5
{
  v8 = (WPMagicSwitch *)a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_wirelessProximityManager != v8)
  {
    id v11 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unknown WPMagicSwitch", (uint8_t *)&v18, 2u);
    }
  }
  int v12 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    v14 = [v9 UUIDString];
    int v18 = 138412546;
    v19 = v14;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- WPMagicSwitch discovered peripheral (%@); data: (%@)",
      (uint8_t *)&v18,
      0x16u);
  }
  if (self->_isScanning)
  {
    v15 = [v10 objectForKey:WPMagicSwitchAdvertisingData];
    if (v15)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained wiProxScannerFoundDevice:v9 withData:v15];
    }
  }
  else
  {
    v17 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- WPMagicSwitch early return because NOT scanning", (uint8_t *)&v18, 2u);
    }
  }
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setHighDutyCycle:(BOOL)a3
{
  self->_highDutyCycle = a3;
}

- (void)setFilteredPeers:(id)a3
{
}

- (void)setFilteringBlob:(id)a3
{
}

- (NSData)filteringMask
{
  return self->_filteringMask;
}

- (void)setFilteringMask:(id)a3
{
}

- (WiProxScannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WiProxScannerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (WPMagicSwitch)wirelessProximityManager
{
  return self->_wirelessProximityManager;
}

- (void)setWirelessProximityManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wirelessProximityManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_filteringMask, 0);
  objc_storeStrong((id *)&self->_filteringBlob, 0);

  objc_storeStrong((id *)&self->_filteredPeers, 0);
}

@end