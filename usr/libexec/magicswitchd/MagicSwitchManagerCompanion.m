@interface MagicSwitchManagerCompanion
- (AbstractTimer)activeWatchAssertionTimer;
- (ActiveWatchManager)activeWatchManager;
- (BOOL)invalidated;
- (InactiveWatchScanner)inactiveWatchScanner;
- (MagicSwitchManagerCompanion)initWithDelegate:(id)a3;
- (MagicSwitchManagerCompanionDelegate)delegate;
- (NSArray)pairedDevices;
- (NSUUID)activeDevice;
- (NSUUID)advertisingIdentifierSeed;
- (id)inactiveWatches;
- (void)activeWatchAssertionTimerFired;
- (void)activeWatchDidChangeWristStateWithPreviousWristState:(unsigned __int8)a3;
- (void)dealloc;
- (void)didDiscoverInactiveWatch:(id)a3 withWristState:(unsigned __int8)a4;
- (void)invalidate;
- (void)setActiveDevice:(id)a3;
- (void)setActiveWatchAssertionTimer:(id)a3;
- (void)setActiveWatchManager:(id)a3;
- (void)setAdvertisingIdentifierSeed:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInactiveWatchScanner:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setPairedDevices:(id)a3;
- (void)takeActiveWatchAssertion;
- (void)updatePairedDeviceList:(id)a3 activeDevice:(id)a4;
- (void)updateState;
@end

@implementation MagicSwitchManagerCompanion

- (MagicSwitchManagerCompanion)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MagicSwitchManagerCompanion;
  v5 = [(MagicSwitchManagerCompanion *)&v10 init];
  if (v5)
  {
    v6 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CompanionManager --- Initializing (%p)", buf, 0xCu);
    }
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [[InactiveWatchScanner alloc] initWithDelegate:v5];
    inactiveWatchScanner = v5->_inactiveWatchScanner;
    v5->_inactiveWatchScanner = v7;
  }
  return v5;
}

- (void)dealloc
{
  if (!self->_invalidated) {
    [(MagicSwitchManagerCompanion *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)MagicSwitchManagerCompanion;
  [(MagicSwitchManagerCompanion *)&v3 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    objc_super v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CompanionManager --- Invalidating (%p)", (uint8_t *)&v10, 0xCu);
    }
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_delegate, 0);
    inactiveWatchScanner = self->_inactiveWatchScanner;
    if (inactiveWatchScanner)
    {
      [(InactiveWatchScanner *)inactiveWatchScanner invalidate];
      v5 = self->_inactiveWatchScanner;
      self->_inactiveWatchScanner = 0;
    }
    activeWatchManager = self->_activeWatchManager;
    if (activeWatchManager)
    {
      [(ActiveWatchManager *)activeWatchManager invalidate];
      v7 = self->_activeWatchManager;
      self->_activeWatchManager = 0;
    }
    activeWatchAssertionTimer = self->_activeWatchAssertionTimer;
    if (activeWatchAssertionTimer)
    {
      [(AbstractTimer *)activeWatchAssertionTimer invalidate];
      v9 = self->_activeWatchAssertionTimer;
      self->_activeWatchAssertionTimer = 0;
    }
  }
}

- (void)updatePairedDeviceList:(id)a3 activeDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (!v7)
    {
      v9 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Empty paired device list but non-nil active device", (uint8_t *)&v14, 2u);
      }
    }
    if (([v7 containsObject:v8] & 1) == 0)
    {
      int v10 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Paired device list not containing the active device", (uint8_t *)&v14, 2u);
      }
    }
  }
  pairedDevices = self->_pairedDevices;
  if (v7 && !pairedDevices
    || pairedDevices && ![(NSArray *)pairedDevices isEqualToArray:v7]
    || (activeDevice = self->_activeDevice, v8) && !activeDevice
    || activeDevice && ([(NSUUID *)activeDevice isEqual:v8] & 1) == 0)
  {
    v13 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CompanionManager --- Updating device list: (%@); Active device: (%@)",
        (uint8_t *)&v14,
        0x16u);
    }
    objc_storeStrong((id *)&self->_pairedDevices, a3);
    objc_storeStrong((id *)&self->_activeDevice, a4);
    [(MagicSwitchManagerCompanion *)self updateState];
  }
}

- (void)updateState
{
  activeDevice = self->_activeDevice;
  activeWatchManager = self->_activeWatchManager;
  if (activeDevice)
  {
    if (!activeWatchManager) {
      goto LABEL_31;
    }
    v5 = [(ActiveWatchManager *)activeWatchManager deviceID];
    unsigned __int8 v6 = [v5 isEqual:self->_activeDevice];

    if ((v6 & 1) == 0)
    {
      [(ActiveWatchManager *)self->_activeWatchManager invalidate];
      id v7 = self->_activeWatchManager;
      self->_activeWatchManager = 0;

      activeWatchAssertionTimer = self->_activeWatchAssertionTimer;
      if (activeWatchAssertionTimer)
      {
        [(AbstractTimer *)activeWatchAssertionTimer invalidate];
        v9 = self->_activeWatchAssertionTimer;
        self->_activeWatchAssertionTimer = 0;
      }
    }
    if (!self->_activeWatchManager)
    {
LABEL_31:
      if ([(InactiveWatchScanner *)self->_inactiveWatchScanner isRunning]) {
        [(InactiveWatchScanner *)self->_inactiveWatchScanner stopRunning];
      }
      int v10 = [[ActiveWatchManager alloc] initWithDelegate:self activeDevice:self->_activeDevice];
      v11 = self->_activeWatchManager;
      self->_activeWatchManager = v10;

      [(MagicSwitchManagerCompanion *)self takeActiveWatchAssertion];
    }
  }
  else if (activeWatchManager)
  {
    [(ActiveWatchManager *)activeWatchManager invalidate];
    v12 = self->_activeWatchManager;
    self->_activeWatchManager = 0;
  }
  id v16 = [(MagicSwitchManagerCompanion *)self inactiveWatches];
  if (![v16 count]) {
    goto LABEL_22;
  }
  uint64_t v13 = [(ActiveWatchManager *)self->_activeWatchManager wristState];
  if (![(InactiveWatchScanner *)self->_inactiveWatchScanner isRunning]) {
    goto LABEL_19;
  }
  int v14 = [(InactiveWatchScanner *)self->_inactiveWatchScanner inactiveWatches];
  if ([v14 isEqual:v16])
  {
    unsigned int v15 = [(InactiveWatchScanner *)self->_inactiveWatchScanner activeWatchWristState];

    if (v15 == v13) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  [(InactiveWatchScanner *)self->_inactiveWatchScanner stopRunning];
LABEL_19:
  if (self->_activeWatchAssertionTimer
    || [(ActiveWatchManager *)self->_activeWatchManager isConnected] && v13 > 0x3E)
  {
LABEL_22:
    if ([(InactiveWatchScanner *)self->_inactiveWatchScanner isRunning]) {
      [(InactiveWatchScanner *)self->_inactiveWatchScanner stopRunning];
    }
    goto LABEL_24;
  }
  if (![(InactiveWatchScanner *)self->_inactiveWatchScanner isRunning]) {
    [(InactiveWatchScanner *)self->_inactiveWatchScanner startRunningWithInactiveWatches:v16 activeWatchWristState:v13];
  }
LABEL_24:
}

- (id)inactiveWatches
{
  id v3 = [(NSArray *)self->_pairedDevices mutableCopy];
  id v4 = v3;
  if (self->_activeDevice) {
    [v3 removeObject:];
  }

  return v4;
}

- (void)takeActiveWatchAssertion
{
  if (self->_activeWatchAssertionTimer)
  {
    id v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timer already scheduled", (uint8_t *)buf, 2u);
    }
  }
  if ([(InactiveWatchScanner *)self->_inactiveWatchScanner isRunning])
  {
    id v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already scanning for inactive watches", (uint8_t *)buf, 2u);
    }
  }
  v5 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CompanionManager --- Taking an active Watch assertion", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  unsigned __int8 v6 = +[NSString stringWithUTF8String:"com.apple.magicswitchd.activeWatchAssertion"];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007728;
  v9[3] = &unk_1000184D0;
  objc_copyWeak(&v10, buf);
  id v7 = +[TimerFactory timerWithIdentifier:v6 delay:1 gracePeriod:v9 waking:10.0 handlerBlock:0.0];
  activeWatchAssertionTimer = self->_activeWatchAssertionTimer;
  self->_activeWatchAssertionTimer = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (void)activeWatchAssertionTimerFired
{
  if (!self->_activeWatchAssertionTimer)
  {
    id v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timer not scheduled", buf, 2u);
    }
  }
  id v4 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CompanionManager --- Active Watch assertion timer fired!", v6, 2u);
  }
  activeWatchAssertionTimer = self->_activeWatchAssertionTimer;
  self->_activeWatchAssertionTimer = 0;

  [(MagicSwitchManagerCompanion *)self updateState];
}

- (void)activeWatchDidChangeWristStateWithPreviousWristState:(unsigned __int8)a3
{
  activeWatchAssertionTimer = self->_activeWatchAssertionTimer;
  if (activeWatchAssertionTimer)
  {
    [(AbstractTimer *)activeWatchAssertionTimer invalidate];
    v5 = self->_activeWatchAssertionTimer;
    self->_activeWatchAssertionTimer = 0;
  }

  [(MagicSwitchManagerCompanion *)self updateState];
}

- (void)didDiscoverInactiveWatch:(id)a3 withWristState:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  if (![(ActiveWatchManager *)self->_activeWatchManager isConnected]
    || [(ActiveWatchManager *)self->_activeWatchManager wristState] < v4)
  {
    id v7 = (void *)qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      v9 = [v6 UUIDString];
      int v11 = 138412546;
      v12 = v9;
      __int16 v13 = 1024;
      unsigned int v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CompanionManager --- Scanning found device: (%@) with wrist state: (%d)", (uint8_t *)&v11, 0x12u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained magicSwitchManager:self requestActiveDeviceSwitch:v6];
  }
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (MagicSwitchManagerCompanionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MagicSwitchManagerCompanionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ActiveWatchManager)activeWatchManager
{
  return self->_activeWatchManager;
}

- (void)setActiveWatchManager:(id)a3
{
}

- (InactiveWatchScanner)inactiveWatchScanner
{
  return self->_inactiveWatchScanner;
}

- (void)setInactiveWatchScanner:(id)a3
{
}

- (NSUUID)advertisingIdentifierSeed
{
  return self->_advertisingIdentifierSeed;
}

- (void)setAdvertisingIdentifierSeed:(id)a3
{
}

- (NSUUID)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
}

- (NSArray)pairedDevices
{
  return self->_pairedDevices;
}

- (void)setPairedDevices:(id)a3
{
}

- (AbstractTimer)activeWatchAssertionTimer
{
  return self->_activeWatchAssertionTimer;
}

- (void)setActiveWatchAssertionTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeWatchAssertionTimer, 0);
  objc_storeStrong((id *)&self->_pairedDevices, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_advertisingIdentifierSeed, 0);
  objc_storeStrong((id *)&self->_inactiveWatchScanner, 0);
  objc_storeStrong((id *)&self->_activeWatchManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end