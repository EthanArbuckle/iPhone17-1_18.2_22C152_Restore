@interface MagicSwitchEnablerCompanion
- (BOOL)isSwitchingActivePairedDevice;
- (InitialSyncCompletionMonitor)initialSyncMonitor;
- (MagicSwitchEnablerCompanion)init;
- (MagicSwitchManagerCompanion)magicSwitchManager;
- (OS_dispatch_source)sigtermSource;
- (void)activeDeviceAssertionStateDidChange;
- (void)activePairedDeviceSwitchForDevice:(id)a3 completedWithError:(id)a4;
- (void)handleNanoRegistryNotification:(id)a3;
- (void)initialSyncDidCompleteForDevice:(id)a3;
- (void)magicSwitchManager:(id)a3 requestActiveDeviceSwitch:(id)a4;
- (void)registerNanoRegistryObservers;
- (void)setInitialSyncMonitor:(id)a3;
- (void)setIsSwitchingActivePairedDevice:(BOOL)a3;
- (void)setMagicSwitchManager:(id)a3;
- (void)setSigtermSource:(id)a3;
- (void)updateState;
@end

@implementation MagicSwitchEnablerCompanion

- (MagicSwitchEnablerCompanion)init
{
  v8.receiver = self;
  v8.super_class = (Class)MagicSwitchEnablerCompanion;
  v2 = [(MagicSwitchEnabler *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(MagicSwitchEnabler *)v2 workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005A8C;
    block[3] = &unk_100018538;
    v7 = v3;
    dispatch_async(v4, block);
  }
  return v3;
}

- (void)registerNanoRegistryObservers
{
  v19[0] = NRPairedDeviceRegistryDeviceIsSetupNotification;
  v19[1] = NRPairedDeviceRegistryDeviceDidUnpairNotification;
  v19[2] = NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification;
  v19[3] = NRPairedDeviceRegistryRemoteUnpairingDidBeginNotification;
  +[NSArray arrayWithObjects:v19 count:4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v6);
        objc_super v8 = +[NSNotificationCenter defaultCenter];
        v9 = +[NRPairedDeviceRegistry sharedInstance];
        [v8 addObserver:self selector:"handleNanoRegistryNotification:" name:v7 object:v9];

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  v10 = +[NRActiveDeviceAssertionMonitor sharedInstance];
  [v10 addObserver:self];

  v11 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Registered NanoRegistry observers", buf, 2u);
  }
}

- (void)handleNanoRegistryNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:NRPairedDeviceRegistryDevice];
  uint64_t v7 = +[MagicSwitchEnabler sharedInstance];
  objc_super v8 = [v7 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005F0C;
  block[3] = &unk_100018560;
  id v12 = v4;
  id v13 = v6;
  long long v14 = self;
  id v9 = v6;
  id v10 = v4;
  dispatch_async(v8, block);
}

- (void)updateState
{
  v43 = objc_opt_new();
  if (self->_isSwitchingActivePairedDevice)
  {
    id v3 = 0;
    unsigned int v4 = 0;
    uint64_t v5 = "Switching device";
LABEL_39:
    magicSwitchManager = self->_magicSwitchManager;
    v30 = qword_100021A50;
    BOOL v31 = os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT);
    if (magicSwitchManager)
    {
      if (v31)
      {
        *(_DWORD *)buf = 136315138;
        v52 = v5;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Disabling MagicSwitch for reason: %s", buf, 0xCu);
      }
      [(MagicSwitchManagerCompanion *)self->_magicSwitchManager invalidate];
      v32 = self->_magicSwitchManager;
      self->_magicSwitchManager = 0;
    }
    else if (v31)
    {
      *(_DWORD *)buf = 136315138;
      v52 = v5;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Not enabling MagicSwitch for reason: %s", buf, 0xCu);
    }
    v33 = objc_opt_class();
    if (v4) {
      [v33 createMagicSwitchPathFile];
    }
    else {
      [v33 deleteMagicSwitchPathFile];
    }
    goto LABEL_48;
  }
  if (![(MagicSwitchEnabler *)self isSettingEnabled])
  {
    id v3 = 0;
    unsigned int v4 = 0;
    uint64_t v5 = "Setting disabled";
    goto LABEL_39;
  }
  v6 = +[NRPairedDeviceRegistry sharedInstance];
  uint64_t v7 = [v6 getActivePairedDevice];

  objc_super v8 = [v7 valueForProperty:NRDevicePropertyIsSetup];
  if (([v8 BOOLValue] & 1) == 0)
  {
    v28 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Active device isn't setup yet, ignoring", buf, 2u);
    }

    goto LABEL_32;
  }
  if (!v7)
  {
LABEL_32:

    id v3 = 0;
    unsigned int v4 = 0;
    uint64_t v5 = "No active + setup completed paired device";
    goto LABEL_39;
  }
  id v9 = +[NRPairedDeviceRegistry sharedInstance];
  id v10 = [v9 getSetupCompletedDevices];

  v42 = v10;
  if ((unint64_t)[v10 count] < 2)
  {
    unsigned int v4 = 0;
    id v3 = 0;
    uint64_t v5 = "Less than two paired devices";
  }
  else
  {
    v11 = +[NRPairedDeviceRegistry sharedInstance];
    unsigned int v12 = [v11 compatibilityState];

    if (v12 == 4 || v12 == 2)
    {
      v41 = v8;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v13 = v10;
      id v14 = [v13 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v14)
      {
        id v15 = v14;
        v39 = v7;
        v40 = self;
        v46 = 0;
        uint64_t v16 = *(void *)v48;
        uint64_t v44 = _NRDevicePropertyBluetoothIdentifier;
        uint64_t v17 = NRDevicePropertyIsActive;
        char v45 = 1;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v48 != v16) {
              objc_enumerationMutation(v13);
            }
            v19 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            id v20 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B8365B0F-C979-491B-86E3-EBAE195F1755"];
            unsigned int v21 = [v19 supportsCapability:v20];

            if (v21)
            {
              v22 = [v19 valueForProperty:v44];
              if (v22) {
                [v43 addObject:v22];
              }
              v23 = [v19 valueForProperty:v17, v39];
              unsigned int v24 = [v23 BOOLValue];

              if (v24)
              {
                id v25 = v22;

                v46 = v25;
              }
            }
            else
            {
              char v45 = 0;
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v47 objects:v53 count:16];
        }
        while (v15);

        uint64_t v7 = v39;
        if (v45)
        {
          self = v40;
          objc_super v8 = v41;
          id v3 = v46;
          if (v46 && (unint64_t)[v43 count] >= 2)
          {
            v26 = [v39 valueForProperty:_NRDevicePropertyRemoteUnpairingStarted];
            unsigned __int8 v27 = [v26 BOOLValue];

            if (v27)
            {
              unsigned int v4 = 0;
              uint64_t v5 = "Remote unpairing has started";
            }
            else
            {
              buf[0] = 0;
              if ([(InitialSyncCompletionMonitor *)v40->_initialSyncMonitor hasCachedInitialSyncCompletionStateForDevice:v39 state:buf])
              {
                if (buf[0])
                {
                  v38 = +[NRActiveDeviceAssertionMonitor sharedInstance];
                  unsigned int v4 = [v38 hasActiveAssertion];

                  if (v4) {
                    uint64_t v5 = "An Active Device Assertion is active";
                  }
                  else {
                    uint64_t v5 = 0;
                  }
                }
                else
                {
                  [(InitialSyncCompletionMonitor *)v40->_initialSyncMonitor registerObserver:v40 device:v39];
                  unsigned int v4 = 0;
                  uint64_t v5 = "Initial Sync not complete yet";
                }
              }
              else
              {
                [(InitialSyncCompletionMonitor *)v40->_initialSyncMonitor registerObserver:v40 device:v39];
                unsigned int v4 = 1;
                uint64_t v5 = "Initial Sync state for active device unknown";
              }
            }
          }
          else
          {
            unsigned int v4 = 0;
            uint64_t v5 = "A paired device has a missing Bluetooth ID";
          }
        }
        else
        {
          unsigned int v4 = 0;
          uint64_t v5 = "Not all paired watches have capability";
          self = v40;
          objc_super v8 = v41;
          id v3 = v46;
        }
      }
      else
      {

        unsigned int v4 = 0;
        id v3 = 0;
        uint64_t v5 = "A paired device has a missing Bluetooth ID";
      }
    }
    else
    {
      unsigned int v4 = 0;
      id v3 = 0;
      uint64_t v5 = "Not in Normal Compatibility state";
    }
  }

  if (v5) {
    goto LABEL_39;
  }
  v34 = self->_magicSwitchManager;
  if (!v34)
  {
    v35 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Enabling MagicSwitch", buf, 2u);
    }
    [(id)objc_opt_class() createMagicSwitchPathFile];
    v36 = [[MagicSwitchManagerCompanion alloc] initWithDelegate:self];
    v37 = self->_magicSwitchManager;
    self->_magicSwitchManager = v36;

    v34 = self->_magicSwitchManager;
  }
  -[MagicSwitchManagerCompanion updatePairedDeviceList:activeDevice:](v34, "updatePairedDeviceList:activeDevice:", v43, v3, v39);
LABEL_48:
}

- (void)activePairedDeviceSwitchForDevice:(id)a3 completedWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    objc_super v8 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No device", v17, 2u);
    }
  }
  self->_isSwitchingActivePairedDevice = 0;
  id v9 = [v6 valueForProperty:NRDevicePropertyPairingID];
  id v10 = (void *)qword_100021A50;
  BOOL v11 = os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v11)
    {
      unsigned int v12 = v10;
      id v13 = [v9 UUIDString];
      *(_DWORD *)uint64_t v17 = 138412546;
      *(void *)&v17[4] = v13;
      *(_WORD *)&v17[12] = 2112;
      *(void *)&v17[14] = v7;
      id v14 = "MagicSwitchEnabler --- MagicSwitch failed for device (%@); error: (%@)";
      id v15 = v12;
      uint32_t v16 = 22;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, v17, v16);
    }
  }
  else if (v11)
  {
    unsigned int v12 = v10;
    id v13 = [v9 UUIDString];
    *(_DWORD *)uint64_t v17 = 138412290;
    *(void *)&v17[4] = v13;
    id v14 = "MagicSwitchEnabler --- MagicSwitch completed with success for device (%@)";
    id v15 = v12;
    uint32_t v16 = 12;
    goto LABEL_9;
  }
  [(MagicSwitchEnablerCompanion *)self updateState];
}

- (void)magicSwitchManager:(id)a3 requestActiveDeviceSwitch:(id)a4
{
  id v6 = (MagicSwitchManagerCompanion *)a3;
  id v7 = a4;
  if (!v7)
  {
    objc_super v8 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No deviceID", buf, 2u);
    }
  }
  if (self->_magicSwitchManager != v6)
  {
    id v9 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unknown manager", buf, 2u);
    }
  }
  id v10 = +[NRPairedDeviceRegistry sharedInstance];
  BOOL v11 = [v10 deviceForBluetoothID:v7];

  if (!self->_isSwitchingActivePairedDevice)
  {
    if (v11)
    {
      objc_initWeak((id *)buf, self);
      self->_isSwitchingActivePairedDevice = 1;
      unsigned int v12 = +[NRPairedDeviceRegistry sharedInstance];
      uint32_t v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      v18 = sub_100006AA8;
      v19 = &unk_100018588;
      objc_copyWeak(&v21, (id *)buf);
      id v20 = v11;
      [v12 setActivePairedDevice:v20 isMagicSwitch:1 operationHasCompleted:&v16];

      [(MagicSwitchEnablerCompanion *)self updateState];
      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v13 = (void *)qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v13;
        id v15 = [v7 UUIDString];
        *(_DWORD *)buf = 138412290;
        v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Failed to resolve the NRDevice associated with Bluetooth ID: (%@)", buf, 0xCu);
      }
    }
  }
}

- (void)initialSyncDidCompleteForDevice:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No device", (uint8_t *)&v10, 2u);
    }
  }
  id v6 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NRDevicePropertyPairingID;
    objc_super v8 = v6;
    id v9 = [v4 valueForProperty:v7];
    int v10 = 138412290;
    BOOL v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Received initial sync did complete callback for device: (%@)", (uint8_t *)&v10, 0xCu);
  }
  [(MagicSwitchEnablerCompanion *)self updateState];
}

- (void)activeDeviceAssertionStateDidChange
{
  id v3 = +[MagicSwitchEnabler sharedInstance];
  id v4 = [v3 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006D88;
  block[3] = &unk_100018538;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (InitialSyncCompletionMonitor)initialSyncMonitor
{
  return self->_initialSyncMonitor;
}

- (void)setInitialSyncMonitor:(id)a3
{
}

- (MagicSwitchManagerCompanion)magicSwitchManager
{
  return self->_magicSwitchManager;
}

- (void)setMagicSwitchManager:(id)a3
{
}

- (BOOL)isSwitchingActivePairedDevice
{
  return self->_isSwitchingActivePairedDevice;
}

- (void)setIsSwitchingActivePairedDevice:(BOOL)a3
{
  self->_isSwitchingActivePairedDevice = a3;
}

- (OS_dispatch_source)sigtermSource
{
  return self->_sigtermSource;
}

- (void)setSigtermSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigtermSource, 0);
  objc_storeStrong((id *)&self->_magicSwitchManager, 0);

  objc_storeStrong((id *)&self->_initialSyncMonitor, 0);
}

@end