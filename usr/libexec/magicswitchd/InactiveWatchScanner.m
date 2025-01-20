@interface InactiveWatchScanner
- (AbstractTimer)highDutyCycleScanningTimer;
- (AdvertisingIdentifierManager)advertisingIdentifierManager;
- (BOOL)invalidated;
- (BOOL)isRunning;
- (InactiveWatchScanner)initWithDelegate:(id)a3;
- (InactiveWatchScannerDelegate)delegate;
- (NSArray)inactiveWatches;
- (WiProxScanner)wiProxScanner;
- (unsigned)activeWatchWristState;
- (void)dealloc;
- (void)highDutyCycleTimerFired;
- (void)invalidate;
- (void)scheduleHighDutyCycleScanningTimer;
- (void)setActiveWatchWristState:(unsigned __int8)a3;
- (void)setAdvertisingIdentifierManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighDutyCycleScanningTimer:(id)a3;
- (void)setInactiveWatches:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setWiProxScanner:(id)a3;
- (void)shouldRollAdvertisingIdentifier;
- (void)startRunningWithInactiveWatches:(id)a3 activeWatchWristState:(unsigned __int8)a4;
- (void)startScanning;
- (void)stopRunning;
- (void)updateScanningState;
- (void)wiProxScannerFoundDevice:(id)a3 withData:(id)a4;
@end

@implementation InactiveWatchScanner

- (InactiveWatchScanner)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)InactiveWatchScanner;
  v5 = [(InactiveWatchScanner *)&v10 init];
  if (v5)
  {
    v6 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- Initializing (%p)", buf, 0xCu);
    }
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [[WiProxScanner alloc] initWithDelegate:v5];
    wiProxScanner = v5->_wiProxScanner;
    v5->_wiProxScanner = v7;
  }
  return v5;
}

- (void)dealloc
{
  if (!self->_invalidated) {
    [(InactiveWatchScanner *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)InactiveWatchScanner;
  [(InactiveWatchScanner *)&v3 dealloc];
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
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- Invalidating (%p)", (uint8_t *)&v5, 0xCu);
    }
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_delegate, 0);
    if (self->_isRunning) {
      [(InactiveWatchScanner *)self stopRunning];
    }
    [(WiProxScanner *)self->_wiProxScanner invalidate];
    wiProxScanner = self->_wiProxScanner;
    self->_wiProxScanner = 0;
  }
}

- (void)startRunningWithInactiveWatches:(id)a3 activeWatchWristState:(unsigned __int8)a4
{
  v6 = (NSArray *)a3;
  if (self->_isRunning)
  {
    v7 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Already running", (uint8_t *)&v10, 2u);
    }
    if (self->_isRunning) {
      [(InactiveWatchScanner *)self stopRunning];
    }
  }
  v8 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- Starting scanning for inactive watches: %@", (uint8_t *)&v10, 0xCu);
  }
  self->_isRunning = 1;
  inactiveWatches = self->_inactiveWatches;
  self->_inactiveWatches = v6;

  self->_activeWatchWristState = a4;
  [(InactiveWatchScanner *)self scheduleHighDutyCycleScanningTimer];
  [(InactiveWatchScanner *)self updateScanningState];
}

- (void)stopRunning
{
  if (self->_isRunning)
  {
    objc_super v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- Stopping scanning for inactive watches", v4, 2u);
    }
    self->_isRunning = 0;
    [(InactiveWatchScanner *)self updateScanningState];
  }
}

- (NSArray)inactiveWatches
{
  if (!self->_isRunning)
  {
    objc_super v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not running", v6, 2u);
    }
  }
  inactiveWatches = self->_inactiveWatches;

  return inactiveWatches;
}

- (unsigned)activeWatchWristState
{
  if (!self->_isRunning)
  {
    objc_super v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not running", v5, 2u);
    }
  }
  return self->_activeWatchWristState;
}

- (void)updateScanningState
{
  unsigned int v3 = [(WiProxScanner *)self->_wiProxScanner isScanning];
  unsigned __int8 v4 = [(WiProxScanner *)self->_wiProxScanner isPoweredOn];
  if (self->_isRunning && (v4 & 1) != 0)
  {
    if ((v3 & 1) == 0)
    {
      [(InactiveWatchScanner *)self startScanning];
    }
  }
  else
  {
    if (v3) {
      [(WiProxScanner *)self->_wiProxScanner stopScanning];
    }
    advertisingIdentifierManager = self->_advertisingIdentifierManager;
    if (advertisingIdentifierManager)
    {
      [(AdvertisingIdentifierManager *)advertisingIdentifierManager invalidate];
      v6 = self->_advertisingIdentifierManager;
      self->_advertisingIdentifierManager = 0;
    }
    highDutyCycleScanningTimer = self->_highDutyCycleScanningTimer;
    if (highDutyCycleScanningTimer)
    {
      [(AbstractTimer *)highDutyCycleScanningTimer invalidate];
      v8 = self->_highDutyCycleScanningTimer;
      self->_highDutyCycleScanningTimer = 0;
    }
  }
}

- (void)scheduleHighDutyCycleScanningTimer
{
  if (self->_highDutyCycleScanningTimer)
  {
    unsigned int v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timer already scheduled", (uint8_t *)buf, 2u);
    }
  }
  if ([(WiProxScanner *)self->_wiProxScanner isScanning])
  {
    unsigned __int8 v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already scanning", (uint8_t *)buf, 2u);
    }
  }
  int v5 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- Scheduling high duty cycle scanning timer", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  v6 = +[NSString stringWithUTF8String:"com.apple.magicswitchd.highDutyScanning"];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000512C;
  v9[3] = &unk_1000184D0;
  objc_copyWeak(&v10, buf);
  v7 = +[TimerFactory timerWithIdentifier:v6 delay:1 gracePeriod:v9 waking:30.0 handlerBlock:0.0];
  highDutyCycleScanningTimer = self->_highDutyCycleScanningTimer;
  self->_highDutyCycleScanningTimer = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (void)highDutyCycleTimerFired
{
  if (!self->_highDutyCycleScanningTimer)
  {
    unsigned int v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timer not scheduled", buf, 2u);
    }
  }
  unsigned __int8 v4 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- High duty cycle scanning timer fired!", v6, 2u);
  }
  highDutyCycleScanningTimer = self->_highDutyCycleScanningTimer;
  self->_highDutyCycleScanningTimer = 0;

  [(WiProxScanner *)self->_wiProxScanner stopScanning];
  [(InactiveWatchScanner *)self updateScanningState];
}

- (void)startScanning
{
  if ([(WiProxScanner *)self->_wiProxScanner isScanning])
  {
    unsigned int v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Already scanning", buf, 2u);
    }
  }
  unsigned __int8 v4 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- Starting scanning", v19, 2u);
  }
  char v18 = 0;
  __int16 v17 = 0;
  advertisingIdentifierManager = self->_advertisingIdentifierManager;
  if (!advertisingIdentifierManager)
  {
    v6 = [AdvertisingIdentifierManager alloc];
    v7 = +[NRMagicSwitchHelper companionSeed];
    v8 = [(AdvertisingIdentifierManager *)v6 initWithDelegate:self seed:v7];
    v9 = self->_advertisingIdentifierManager;
    self->_advertisingIdentifierManager = v8;

    advertisingIdentifierManager = self->_advertisingIdentifierManager;
  }
  char v10 = self->_activeWatchWristState + 1;
  BOOL v11 = self->_highDutyCycleScanningTimer != 0;
  v12 = [(AdvertisingIdentifierManager *)advertisingIdentifierManager advertisingIdentifier];
  [v12 getBytes:&v17 length:2];
  LOBYTE(v17) = v17 & 0xFE;
  char v18 = v10;
  v13 = +[NSData dataWithBytes:&v17 length:3];
  __int16 v15 = -1;
  char v16 = v10;
  v14 = +[NSData dataWithBytes:&v15 length:3];
  [(WiProxScanner *)self->_wiProxScanner startScanningWithHighDutyCycle:v11 filteredPeers:self->_inactiveWatches filteringBlob:v13 filteringMask:v14];
}

- (void)wiProxScannerFoundDevice:(id)a3 withData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 length] >= 3)
  {
    unsigned __int8 v9 = 0;
    [v7 getBytes:&v9 range:2];
    if (v9 > self->_activeWatchWristState)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained didDiscoverInactiveWatch:v6 withWristState:v9];
    }
  }
}

- (void)shouldRollAdvertisingIdentifier
{
  if (![(WiProxScanner *)self->_wiProxScanner isScanning])
  {
    unsigned int v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not scanning", buf, 2u);
    }
  }
  unsigned __int8 v4 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- Rolling the advertising identifier", v5, 2u);
  }
  [(WiProxScanner *)self->_wiProxScanner stopScanning];
  [(InactiveWatchScanner *)self updateScanningState];
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void)setActiveWatchWristState:(unsigned __int8)a3
{
  self->_activeWatchWristState = a3;
}

- (void)setInactiveWatches:(id)a3
{
}

- (InactiveWatchScannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (InactiveWatchScannerDelegate *)WeakRetained;
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

- (WiProxScanner)wiProxScanner
{
  return self->_wiProxScanner;
}

- (void)setWiProxScanner:(id)a3
{
}

- (AbstractTimer)highDutyCycleScanningTimer
{
  return self->_highDutyCycleScanningTimer;
}

- (void)setHighDutyCycleScanningTimer:(id)a3
{
}

- (AdvertisingIdentifierManager)advertisingIdentifierManager
{
  return self->_advertisingIdentifierManager;
}

- (void)setAdvertisingIdentifierManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisingIdentifierManager, 0);
  objc_storeStrong((id *)&self->_highDutyCycleScanningTimer, 0);
  objc_storeStrong((id *)&self->_wiProxScanner, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_inactiveWatches, 0);
}

@end