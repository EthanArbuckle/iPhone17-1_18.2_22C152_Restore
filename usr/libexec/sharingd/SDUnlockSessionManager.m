@interface SDUnlockSessionManager
- (BOOL)activeDevicesMatch;
- (BOOL)deviceIsPaired;
- (BOOL)inConfigureState;
- (BOOL)shouldAbort;
- (BOOL)unlockEnabled;
- (OS_dispatch_source)unlockTimer;
- (SDUnlockIDSController)idsController;
- (SDUnlockSecurityManager)securityManager;
- (SDUnlockSessionManager)init;
- (SFPairedUnlockEvent)metrics;
- (id)activeDevice;
- (id)activeDeviceDescription;
- (id)activeDeviceName;
- (id)generateDebugInfo;
- (id)pairingID;
- (id)pairingStorePath;
- (int64_t)setupAuthSession;
- (int64_t)stashBagSession;
- (int64_t)unlockAuthSession;
- (unsigned)generateSessionID;
- (unsigned)pairingCompatibilityState;
- (void)abortDevicePairingWithReason:(id)a3;
- (void)addObservers;
- (void)dealloc;
- (void)deviceDidEnterConfigState:(id)a3;
- (void)devicesDidFailToPair:(id)a3;
- (void)disableUnlockPairing;
- (void)disableUnlockPairingForSecManager:(id)a3;
- (void)disableUnlockWithDevice:(id)a3 completionHandler:(id)a4;
- (void)enableUnlockPairing;
- (void)handleDevicesDidFailToPair;
- (void)invalidateUnlockTimer;
- (void)logMetrics;
- (void)logProtoBufReceived:(id)a3;
- (void)logProtoBufSend:(id)a3;
- (void)pairingDidBegin:(id)a3;
- (void)pairingStatusChanged:(id)a3;
- (void)preventExitForLocaleIfNeeded;
- (void)removeObservers;
- (void)resetAll;
- (void)resetSetupState;
- (void)resetStashState;
- (void)resetState;
- (void)restartUnlockTimer:(unint64_t)a3;
- (void)sendDisableMessage;
- (void)sendResetMessage:(unsigned int)a3 reason:(unsigned __int16)a4;
- (void)setIdsController:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setSecurityManager:(id)a3;
- (void)setSetupAuthSession:(int64_t)a3;
- (void)setStashBagSession:(int64_t)a3;
- (void)setUnlockAuthSession:(int64_t)a3;
- (void)setUnlockTimer:(id)a3;
- (void)updateSecurityManager;
- (void)updateSecurityManagerIfNeeded;
@end

@implementation SDUnlockSessionManager

- (SDUnlockSessionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SDUnlockSessionManager;
  v2 = [(SDUnlockSessionManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    unlockTimer = v2->_unlockTimer;
    v2->_unlockTimer = 0;

    v3->_unlockAuthSession = -1;
    v3->_stashBagSession = -1;
    v3->_setupAuthSession = -1;
    v5 = +[SDUnlockIDSController sharedController];
    objc_storeWeak((id *)&v3->_idsController, v5);

    id WeakRetained = objc_loadWeakRetained((id *)&v3->_idsController);
    [WeakRetained addDelegate:v3];

    [(SDUnlockSessionManager *)v3 updateSecurityManager];
    [(SDUnlockSessionManager *)v3 preventExitForLocaleIfNeeded];
  }
  return v3;
}

- (void)dealloc
{
  [(SDUnlockSessionManager *)self removeObservers];
  v3.receiver = self;
  v3.super_class = (Class)SDUnlockSessionManager;
  [(SDUnlockSessionManager *)&v3 dealloc];
}

- (void)updateSecurityManagerIfNeeded
{
  objc_super v3 = [(SDUnlockSessionManager *)self securityManager];

  if (!v3)
  {
    [(SDUnlockSessionManager *)self updateSecurityManager];
  }
}

- (void)updateSecurityManager
{
  objc_super v3 = [(SDUnlockSessionManager *)self pairingID];
  uint64_t v4 = [(SDUnlockSessionManager *)self pairingStorePath];
  v5 = (void *)v4;
  if (!v3 || !v4)
  {
    v9 = paired_unlock_log();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    v10 = [(SDUnlockSessionManager *)self activeDeviceDescription];
    int v11 = 138412803;
    v12 = v3;
    __int16 v13 = 2112;
    v14 = v5;
    __int16 v15 = 2113;
    v16 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to create security manager (pairing id %@, pairing store path %@, active device %{private}@)", (uint8_t *)&v11, 0x20u);
    goto LABEL_5;
  }
  v6 = [SDUnlockSecurityManager alloc];
  v7 = [(SDUnlockSessionManager *)self activeDeviceName];
  objc_super v8 = [(SDUnlockSecurityManager *)v6 initWithPairingID:v3 pairingStorePath:v5 deviceName:v7];
  [(SDUnlockSessionManager *)self setSecurityManager:v8];

  v9 = paired_unlock_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(SDUnlockSessionManager *)self activeDeviceName];
    int v11 = 138412802;
    v12 = v3;
    __int16 v13 = 2112;
    v14 = v5;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Created new security manager (pairing id %@, store path %@, device name %@)", (uint8_t *)&v11, 0x20u);
LABEL_5:
  }
LABEL_7:
}

- (void)preventExitForLocaleIfNeeded
{
  unsigned int v2 = [(SDUnlockSessionManager *)self pairingCompatibilityState];
  objc_super v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Pairing state on launch %d", (uint8_t *)v4, 8u);
  }
}

- (void)addObservers
{
  objc_super v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Session manager adding observers", v9, 2u);
  }

  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"debugInfoRequested:" name:@"com.apple.sharingd.DebugInfoRequested" object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"devicesDidFailToPair:" name:NRPairedDeviceRegistryDeviceDidFailToPairNotification object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"pairingStatusChanged:" name:NRPairedDeviceRegistryStatusDidChange object:0];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"pairingDidBegin:" name:NRPairedDeviceRegistryDeviceDidBeginPairingNotification object:0];

  objc_super v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"deviceDidEnterConfigState:" name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (id)generateDebugInfo
{
  id v3 = objc_opt_new();
  if ([(SDUnlockSessionManager *)self unlockEnabled]) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  v5 = +[NSString stringWithFormat:@"Unlock Enabled:%@", v4];
  [v3 addObject:v5];

  v6 = [(SDUnlockSessionManager *)self securityManager];
  v7 = [v6 localLongTermKey];
  if (v7) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  v9 = +[NSString stringWithFormat:@"Local Long Term Key Exists:%@", v8];
  [v3 addObject:v9];

  v10 = [(SDUnlockSessionManager *)self securityManager];
  int v11 = [v10 remoteLongTermKey];
  if (v11) {
    CFStringRef v12 = @"YES";
  }
  else {
    CFStringRef v12 = @"NO";
  }
  __int16 v13 = +[NSString stringWithFormat:@"Remote Long Term Key Exists:%@", v12];
  [v3 addObject:v13];

  v14 = +[SDStatusMonitor sharedMonitor];
  __int16 v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Device Key Bag State:%ld", [v14 deviceKeyBagState]);
  [v3 addObject:v15];

  v16 = [(SDUnlockSessionManager *)self securityManager];
  v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"AKS Key Bag State:%d", [v16 lockState]);
  [v3 addObject:v17];

  v18 = [(SDUnlockSessionManager *)self idsController];
  if ([v18 isDefaultPairedDeviceNearby]) {
    CFStringRef v19 = @"YES";
  }
  else {
    CFStringRef v19 = @"NO";
  }
  v20 = +[NSString stringWithFormat:@"Device Nearby:%@", v19];
  [v3 addObject:v20];

  v21 = +[NSString stringWithFormat:@"Setup AKS Session ID:%ld", [(SDUnlockSessionManager *)self setupAuthSession]];
  [v3 addObject:v21];

  v22 = +[NSString stringWithFormat:@"Unlock AKS Session ID:%ld", [(SDUnlockSessionManager *)self unlockAuthSession]];
  [v3 addObject:v22];

  v23 = +[NSString stringWithFormat:@"Stash AKS Session ID:%ld", [(SDUnlockSessionManager *)self stashBagSession]];
  [v3 addObject:v23];

  v24 = +[NSString stringWithFormat:@"Nano Registry State:%d", [(SDUnlockSessionManager *)self pairingCompatibilityState]];
  [v3 addObject:v24];

  if ([(SDUnlockSessionManager *)self deviceIsPaired]) {
    CFStringRef v25 = @"YES";
  }
  else {
    CFStringRef v25 = @"NO";
  }
  v26 = +[NSString stringWithFormat:@"Device Paired:%@", v25];
  [v3 addObject:v26];

  return v3;
}

- (void)devicesDidFailToPair:(id)a3
{
}

- (void)handleDevicesDidFailToPair
{
  id v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device pairing failed, throwing away anything that was setup", v4, 2u);
  }

  [(SDUnlockSessionManager *)self disableUnlockPairing];
}

- (void)pairingStatusChanged:(id)a3
{
  unsigned int v4 = [(SDUnlockSessionManager *)self pairingCompatibilityState];
  v5 = paired_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pairing status changed %d", (uint8_t *)v6, 8u);
  }

  [(SDUnlockSessionManager *)self updateExitPrevention];
}

- (void)pairingDidBegin:(id)a3
{
  unsigned int v4 = paired_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = [(SDUnlockSessionManager *)self pairingCompatibilityState];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pairing did begin %d", (uint8_t *)v5, 8u);
  }

  [(SDUnlockSessionManager *)self updateExitPrevention];
}

- (void)deviceDidEnterConfigState:(id)a3
{
  unsigned int v4 = paired_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = [(SDUnlockSessionManager *)self pairingCompatibilityState];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device entered config state %d", (uint8_t *)v5, 8u);
  }

  [(SDUnlockSessionManager *)self updateExitPrevention];
}

- (void)enableUnlockPairing
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, SFPairedUnlockStateChangedNotification, 0, 0, 1u);
  id v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Pairing Enabled", v4, 2u);
  }
}

- (void)disableUnlockPairing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100207910;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)disableUnlockPairingForSecManager:(id)a3
{
  id v3 = a3;
  unsigned int v4 = paired_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 pairingID];
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pairing Disabled: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)unlockEnabled
{
  unsigned int v2 = [(SDUnlockSessionManager *)self securityManager];
  unsigned __int8 v3 = [v2 ltksExist];

  return v3;
}

- (void)disableUnlockWithDevice:(id)a3 completionHandler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  _DWORD v5[2] = sub_100207B20;
  v5[3] = &unk_1008CAD20;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)resetAll
{
  [(SDUnlockSessionManager *)self resetSetupState];
  [(SDUnlockSessionManager *)self resetAndClearState];

  [(SDUnlockSessionManager *)self resetStashState];
}

- (void)resetSetupState
{
  unsigned __int8 v3 = [(SDUnlockSessionManager *)self securityManager];
  [v3 clearStateForSession:-[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession")];

  [(SDUnlockSessionManager *)self setSetupAuthSession:-1];
}

- (void)resetState
{
  unsigned __int8 v3 = [(SDUnlockSessionManager *)self securityManager];
  [v3 clearStateForSession:-[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession")];

  [(SDUnlockSessionManager *)self setUnlockAuthSession:-1];

  [(SDUnlockSessionManager *)self invalidateUnlockTimer];
}

- (void)resetStashState
{
  unsigned __int8 v3 = [(SDUnlockSessionManager *)self securityManager];
  [v3 clearStateForSession:-[SDUnlockSessionManager stashBagSession](self, "stashBagSession")];

  [(SDUnlockSessionManager *)self setStashBagSession:-1];
}

- (void)restartUnlockTimer:(unint64_t)a3
{
  v5 = paired_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "restartUnlockTimer", buf, 2u);
  }

  unlockTimer = self->_unlockTimer;
  if (!unlockTimer)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100207DE0;
    v9[3] = &unk_1008CA4B8;
    v9[4] = self;
    sub_1001B1B10(0, &_dispatch_main_q, v9);
    v7 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
    CFStringRef v8 = self->_unlockTimer;
    self->_unlockTimer = v7;

    dispatch_resume((dispatch_object_t)self->_unlockTimer);
    unlockTimer = self->_unlockTimer;
  }
  sub_1001B1BC4(unlockTimer, a3);
}

- (void)invalidateUnlockTimer
{
  unsigned __int8 v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "invalidateUnlockTimer", v6, 2u);
  }

  unlockTimer = self->_unlockTimer;
  if (unlockTimer)
  {
    dispatch_source_cancel(unlockTimer);
    v5 = self->_unlockTimer;
    self->_unlockTimer = 0;
  }
}

- (void)sendResetMessage:(unsigned int)a3 reason:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v9 = objc_alloc_init(SDUnlockReset);
  [(SDUnlockReset *)v9 setVersion:1];
  [(SDUnlockReset *)v9 setSessionID:v5];
  [(SDUnlockReset *)v9 setResetReason:v4];
  [(SDUnlockSessionManager *)self logProtoBufSend:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsController);
  CFStringRef v8 = [(SDUnlockReset *)v9 data];
  [WeakRetained sendProtocolBufferData:v8 withType:1 timeout:0 option:1 errorHandler:&stru_1008D0E78];

  [(SDUnlockSessionManager *)self resetAndClearState];
}

- (void)sendDisableMessage
{
  uint64_t v5 = objc_alloc_init(SDUnlockDisable);
  [(SDUnlockDisable *)v5 setVersion:1];
  [(SDUnlockSessionManager *)self logProtoBufSend:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsController);
  uint64_t v4 = [(SDUnlockDisable *)v5 data];
  [WeakRetained sendProtocolBufferData:v4 withType:2 timeout:0 option:2 errorHandler:&stru_1008D0E98];
}

- (void)abortDevicePairingWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SDStatusMonitor sharedMonitor];
  if (([v5 bypassLTKeyAbort] & 1) != 0
    || ![(SDUnlockSessionManager *)self inConfigureState])
  {
  }
  else
  {
    unsigned int v6 = [(SDUnlockSessionManager *)self shouldAbort];

    if (v6)
    {
      v7 = paired_unlock_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100208BDC();
      }

      CFStringRef v8 = [(SDUnlockSessionManager *)self securityManager];
      [v8 deleteLongTermKeys];

      v9 = +[NRPairedDeviceRegistry sharedInstance];
      [v9 abortPairingWithReason:v4];
    }
  }
}

- (BOOL)shouldAbort
{
  unsigned int v2 = [(SDUnlockSessionManager *)self activeDevice];
  if (v2 && NRWatchOSVersionForRemoteDevice() >= 0x40000)
  {
    id v4 = paired_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Watch supports new LTK model, not aborting.", v6, 2u);
    }

    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (BOOL)inConfigureState
{
  return [(SDUnlockSessionManager *)self pairingCompatibilityState] == 3;
}

- (unsigned)pairingCompatibilityState
{
  unsigned int v2 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned __int16 v3 = (unsigned __int16)[v2 compatibilityState];

  return v3;
}

- (BOOL)deviceIsPaired
{
  unsigned int v2 = [(SDUnlockSessionManager *)self activeDevice];
  unsigned __int16 v3 = [v2 valueForProperty:NRDevicePropertyIsPaired];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)pairingID
{
  unsigned int v2 = [(SDUnlockSessionManager *)self activeDevice];
  unsigned __int16 v3 = [v2 valueForProperty:NRDevicePropertyPairingID];
  unsigned __int8 v4 = [v3 UUIDString];

  return v4;
}

- (id)pairingStorePath
{
  unsigned int v2 = [(SDUnlockSessionManager *)self activeDevice];
  unsigned __int16 v3 = [v2 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];

  return v3;
}

- (id)activeDeviceName
{
  unsigned int v2 = [(SDUnlockSessionManager *)self activeDevice];
  unsigned __int16 v3 = [v2 valueForProperty:NRDevicePropertyDeviceNameString];

  return v3;
}

- (id)activeDeviceDescription
{
  unsigned int v2 = [(SDUnlockSessionManager *)self activeDevice];
  unsigned __int16 v3 = [v2 description];

  return v3;
}

- (id)activeDevice
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unsigned int v2 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned __int16 v3 = [v2 getAllDevicesWithArchivedDevices];

  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    uint64_t v7 = NRDevicePropertyIsActive;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 valueForProperty:v7];
        unsigned int v11 = [v10 BOOLValue];

        if (v11)
        {
          id v12 = v9;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)activeDevicesMatch
{
  unsigned __int16 v3 = [(SDUnlockSessionManager *)self activeDevice];
  if (v3)
  {
    id v4 = [(SDUnlockSessionManager *)self idsController];
    id v5 = [v4 activeIDSDevice];

    if (v5)
    {
      uint64_t v6 = +[NRPairedDeviceRegistry sharedInstance];
      uint64_t v7 = [v6 deviceForIDSDevice:v5];

      if (v7)
      {
        CFStringRef v8 = [v3 pairingID];
        v9 = [v7 pairingID];
        unsigned __int8 v10 = [v8 isEqual:v9];

        if (v10)
        {
          BOOL v11 = 1;
LABEL_17:

          goto LABEL_18;
        }
        id v12 = paired_unlock_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100208CAC();
        }
      }
      else
      {
        id v12 = paired_unlock_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100208C78();
        }
      }
    }
    else
    {
      uint64_t v7 = paired_unlock_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100208C44();
      }
    }
    BOOL v11 = 0;
    goto LABEL_17;
  }
  id v5 = paired_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100208C10();
  }
  BOOL v11 = 0;
LABEL_18:

  return v11;
}

- (unsigned)generateSessionID
{
  return arc4random_uniform(0x7FFFFFFFu);
}

- (void)logProtoBufSend:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = paired_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending %@", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v7 = paired_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Message Contents %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)logProtoBufReceived:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = paired_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received %@", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v7 = paired_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Message Contents %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)logMetrics
{
  id v3 = [(SDUnlockSessionManager *)self metrics];

  if (v3)
  {
    id v4 = paired_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Submitting metrics", v6, 2u);
    }

    id v5 = [(SDUnlockSessionManager *)self metrics];
    [v5 submitEvent];
  }
  [(SDUnlockSessionManager *)self setMetrics:0];
}

- (int64_t)setupAuthSession
{
  return self->_setupAuthSession;
}

- (void)setSetupAuthSession:(int64_t)a3
{
  self->_setupAuthSession = a3;
}

- (int64_t)unlockAuthSession
{
  return self->_unlockAuthSession;
}

- (void)setUnlockAuthSession:(int64_t)a3
{
  self->_unlockAuthSession = a3;
}

- (int64_t)stashBagSession
{
  return self->_stashBagSession;
}

- (void)setStashBagSession:(int64_t)a3
{
  self->_stashBagSession = a3;
}

- (SDUnlockIDSController)idsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsController);

  return (SDUnlockIDSController *)WeakRetained;
}

- (void)setIdsController:(id)a3
{
}

- (SDUnlockSecurityManager)securityManager
{
  return (SDUnlockSecurityManager *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSecurityManager:(id)a3
{
}

- (SFPairedUnlockEvent)metrics
{
  return (SFPairedUnlockEvent *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMetrics:(id)a3
{
}

- (OS_dispatch_source)unlockTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUnlockTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockTimer, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_securityManager, 0);

  objc_destroyWeak((id *)&self->_idsController);
}

@end