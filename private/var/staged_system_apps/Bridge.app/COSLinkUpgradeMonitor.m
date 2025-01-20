@interface COSLinkUpgradeMonitor
- (BOOL)backupRestoreStepComplete;
- (BOOL)everConnectedOnAWDL;
- (BOOL)holdingAnyCompanionLinkPreference;
- (BOOL)initialPropertyExchangeComplete;
- (BOOL)observingLinkChange;
- (BOOL)pendingLinkUpgradeRequest;
- (BOOL)softwareUpdateStateResolved;
- (BOOL)updatedNRToEnterNormalState;
- (BOOL)waitingForAWDLupgradeTimeout;
- (BOOL)wirelessCredentialsExchangeComplete;
- (NRDeviceMonitor)networkRelayDeviceMonitor;
- (NRDevicePreferences)networkRelayDevicePreferences;
- (NSTimer)awdlUpgradeTimeoutTimer;
- (unsigned)currentLinkSubType;
- (void)_awdlUpgradeTimedout;
- (void)_enteredCompatibilityState:(id)a3;
- (void)_onInitialPropertyExchangeComplete;
- (void)_performLinkUpgradeToInfraWiFi;
- (void)_sendWirelessCredentialsToWatch;
- (void)_updateCompanionLinkPreferenceToAWDLforBTUUID:(id)a3;
- (void)_updateNanoRegistryToNormalStateIfNeeded;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4;
- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5;
- (void)indicateBackupRestoreStepCompleted;
- (void)indicateSoftwareUpdateStateResolved;
- (void)requestLinkUpgrade;
- (void)resetCompanionLinkPreference;
- (void)resetMonitor;
- (void)setAwdlUpgradeTimeoutTimer:(id)a3;
- (void)setBackupRestoreStepComplete:(BOOL)a3;
- (void)setCurrentLinkSubType:(unsigned __int8)a3;
- (void)setEverConnectedOnAWDL:(BOOL)a3;
- (void)setInitialPropertyExchangeComplete:(BOOL)a3;
- (void)setNetworkRelayDeviceMonitor:(id)a3;
- (void)setNetworkRelayDevicePreferences:(id)a3;
- (void)setObservingLinkChange:(BOOL)a3;
- (void)setPendingLinkUpgradeRequest:(BOOL)a3;
- (void)setSoftwareUpdateStateResolved:(BOOL)a3;
- (void)setUpdatedNRToEnterNormalState:(BOOL)a3;
- (void)setWaitingForAWDLupgradeTimeout:(BOOL)a3;
- (void)setWirelessCredentialsExchangeComplete:(BOOL)a3;
- (void)wirelessCredentialUpdateCompletedWithResult:(BOOL)a3;
@end

@implementation COSLinkUpgradeMonitor

- (void)requestLinkUpgrade
{
  if (_os_feature_enabled_impl())
  {
    if (self->_currentLinkSubType != 102 && !self->_waitingForAWDLupgradeTimeout)
    {
      v9 = +[UIApplication sharedApplication];
      v3 = [v9 activeWatch];

      if (v3)
      {
        v10 = +[NSNotificationCenter defaultCenter];
        uint64_t v11 = NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification;
        [v10 addObserver:self selector:"_enteredCompatibilityState:" name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

        v12 = [v3 valueForProperty:_NRDevicePropertyCompatibilityState];
        unsigned __int16 v13 = (unsigned __int16)[v12 unsignedIntValue];

        if (v13 >= 3u)
        {
          v14 = pbb_setupflow_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v24 = "-[COSLinkUpgradeMonitor requestLinkUpgrade]";
            __int16 v25 = 1024;
            LODWORD(v26) = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: already initial properties exchanged: %d", buf, 0x12u);
          }

          v15 = +[NSNotificationCenter defaultCenter];
          [v15 removeObserver:self name:v11 object:0];

          [(COSLinkUpgradeMonitor *)self _onInitialPropertyExchangeComplete];
        }
        uint64_t v16 = _NRDevicePropertyBluetoothIdentifier;
        uint64_t v22 = _NRDevicePropertyBluetoothIdentifier;
        v17 = +[NSArray arrayWithObjects:&v22 count:1];
        [v3 addPropertyObserver:self forPropertyChanges:v17];

        StringFromNRLinkSubtype = [v3 valueForProperty:v16];
        v18 = pbb_setupflow_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v24 = "-[COSLinkUpgradeMonitor requestLinkUpgrade]";
          __int16 v25 = 2114;
          v26 = StringFromNRLinkSubtype;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: BT identifier: %{public}@", buf, 0x16u);
        }

        if (StringFromNRLinkSubtype)
        {
          self->_observingLinkChange = 0;
          uint64_t v21 = v16;
          v19 = +[NSArray arrayWithObjects:&v21 count:1];
          [v3 removePropertyObserver:self forPropertyChanges:v19];

          [(COSLinkUpgradeMonitor *)self _updateCompanionLinkPreferenceToAWDLforBTUUID:StringFromNRLinkSubtype];
        }
        else
        {
          v20 = pbb_setupflow_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v24 = "-[COSLinkUpgradeMonitor requestLinkUpgrade]";
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Couldn't get BTUUID. Started Observing", buf, 0xCu);
          }

          self->_observingLinkChange = 1;
        }
        goto LABEL_7;
      }
      StringFromNRLinkSubtype = pbb_setupflow_log();
      if (!os_log_type_enabled(StringFromNRLinkSubtype, OS_LOG_TYPE_DEFAULT))
      {
LABEL_7:

        goto LABEL_10;
      }
      *(_DWORD *)buf = 136315138;
      v24 = "-[COSLinkUpgradeMonitor requestLinkUpgrade]";
      v6 = "%s: No valid device to request link upgrade";
      v7 = StringFromNRLinkSubtype;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      goto LABEL_7;
    }
    v3 = pbb_setupflow_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      StringFromNRLinkSubtype = createStringFromNRLinkSubtype();
      BOOL waitingForAWDLupgradeTimeout = self->_waitingForAWDLupgradeTimeout;
      *(_DWORD *)buf = 136315650;
      v24 = "-[COSLinkUpgradeMonitor requestLinkUpgrade]";
      __int16 v25 = 2112;
      v26 = StringFromNRLinkSubtype;
      __int16 v27 = 1024;
      BOOL v28 = waitingForAWDLupgradeTimeout;
      v6 = "%s: Ignoring upgrade request. current link: %@ request in progress: %d";
      v7 = v3;
      uint32_t v8 = 28;
      goto LABEL_6;
    }
  }
  else
  {
    v3 = pbb_setupflow_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[COSLinkUpgradeMonitor requestLinkUpgrade]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: feature disabled. Ignoring linkupgrade request", buf, 0xCu);
    }
  }
LABEL_10:
}

- (void)_enteredCompatibilityState:(id)a3
{
  v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:NRPairedDeviceRegistryCompatibilityStateKey];
  unsigned __int16 v6 = (unsigned __int16)[v5 unsignedIntValue];

  v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    v10 = "-[COSLinkUpgradeMonitor _enteredCompatibilityState:]";
    __int16 v11 = 1024;
    int v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Entered Compatibility State: %d", (uint8_t *)&v9, 0x12u);
  }

  if (v6 >= 3u)
  {
    uint32_t v8 = +[NSNotificationCenter defaultCenter];
    [v8 removeObserver:self name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

    [(COSLinkUpgradeMonitor *)self _onInitialPropertyExchangeComplete];
  }
}

- (void)_onInitialPropertyExchangeComplete
{
  v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[COSLinkUpgradeMonitor _onInitialPropertyExchangeComplete]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Initial property exchange complete.", (uint8_t *)&v4, 0xCu);
  }

  self->_initialPropertyExchangeComplete = 1;
  [(COSLinkUpgradeMonitor *)self _sendWirelessCredentialsToWatch];
  [(COSLinkUpgradeMonitor *)self _updateNanoRegistryToNormalStateIfNeeded];
}

- (void)resetCompanionLinkPreference
{
  if (self->_networkRelayDevicePreferences)
  {
    v3 = pbb_setupflow_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v11 = "-[COSLinkUpgradeMonitor resetCompanionLinkPreference]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: reset companion link preference", buf, 0xCu);
    }

    [(NRDevicePreferences *)self->_networkRelayDevicePreferences setCompanionLinkPreferences:0];
    networkRelayDevicePreferences = self->_networkRelayDevicePreferences;
    self->_networkRelayDevicePreferences = 0;
  }
  networkRelayDeviceMonitor = self->_networkRelayDeviceMonitor;
  self->_networkRelayDeviceMonitor = 0;

  self->_observingLinkChange = 0;
  unsigned __int16 v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

  v7 = [UIApp activeWatch];
  if (v7)
  {
    uint64_t v9 = _NRDevicePropertyBluetoothIdentifier;
    uint32_t v8 = +[NSArray arrayWithObjects:&v9 count:1];
    [v7 removePropertyObserver:self forPropertyChanges:v8];
  }
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v7 = a3;
  uint32_t v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v9 = _NRDevicePropertyBluetoothIdentifier;
  if ([v8 isEqualToString:_NRDevicePropertyBluetoothIdentifier])
  {
    v10 = [v7 valueForProperty:v9];
    __int16 v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[COSLinkUpgradeMonitor device:propertyDidChange:fromValue:]";
      __int16 v18 = 2114;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: BT identifier: %{public}@", buf, 0x16u);
    }

    if (self->_observingLinkChange && v10)
    {
      self->_BOOL observingLinkChange = 0;
      uint64_t v15 = v9;
      int v12 = +[NSArray arrayWithObjects:&v15 count:1];
      [v7 removePropertyObserver:self forPropertyChanges:v12];

      [(COSLinkUpgradeMonitor *)self _updateCompanionLinkPreferenceToAWDLforBTUUID:v10];
    }
    else
    {
      unsigned __int16 v13 = pbb_setupflow_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        BOOL observingLinkChange = self->_observingLinkChange;
        *(_DWORD *)buf = 136315394;
        v17 = "-[COSLinkUpgradeMonitor device:propertyDidChange:fromValue:]";
        __int16 v18 = 1024;
        LODWORD(v19) = observingLinkChange;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Skipping property change: observing: %{BOOL}d", buf, 0x12u);
      }
    }
  }
  else
  {
    v10 = pbb_setupflow_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[COSLinkUpgradeMonitor device:propertyDidChange:fromValue:]";
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: received unexpected property change: %@", buf, 0x16u);
    }
  }
}

- (void)_sendWirelessCredentialsToWatch
{
  if (self->_wirelessCredentialsExchangeComplete)
  {
    v3 = pbb_setupflow_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      int v12 = "-[COSLinkUpgradeMonitor _sendWirelessCredentialsToWatch]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Wireless Credentials already exchanged.", (uint8_t *)&v11, 0xCu);
    }

    [(COSLinkUpgradeMonitor *)self wirelessCredentialUpdateCompletedWithResult:1];
  }
  else
  {
    int v4 = +[UIApplication sharedApplication];
    v5 = [v4 activeWatch];

    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"15874345-3594-4D3F-9A28-BA2AEA650A0D"];
    unsigned int v7 = [v5 supportsCapability:v6];

    uint32_t v8 = pbb_setupflow_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        int v11 = 136315138;
        int v12 = "-[COSLinkUpgradeMonitor _sendWirelessCredentialsToWatch]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Sending Wireless Credentials", (uint8_t *)&v11, 0xCu);
      }

      uint32_t v8 = +[UIApplication sharedApplication];
      v10 = [v8 bridgeController];
      [v10 sendAllWirelessCredentials:0];
    }
    else if (v9)
    {
      int v11 = 136315138;
      int v12 = "-[COSLinkUpgradeMonitor _sendWirelessCredentialsToWatch]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Paired watch doesn't support link ugprade. Ignoring sending Wireless Credentials", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_updateCompanionLinkPreferenceToAWDLforBTUUID:(id)a3
{
  id v4 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:a3];
  v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 nrDeviceIdentifier];
    int v21 = 136315394;
    uint64_t v22 = "-[COSLinkUpgradeMonitor _updateCompanionLinkPreferenceToAWDLforBTUUID:]";
    __int16 v23 = 2114;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: NetworkRelayDeviceIdentifier: %{public}@", (uint8_t *)&v21, 0x16u);
  }
  unsigned int v7 = [(NRDeviceMonitor *)self->_networkRelayDeviceMonitor deviceIdentifier];
  uint32_t v8 = [v7 nrDeviceIdentifier];
  BOOL v9 = [v4 nrDeviceIdentifier];
  unsigned __int8 v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    int v11 = (NRDeviceMonitor *)[objc_alloc((Class)NRDeviceMonitor) initWithDeviceIdentifier:v4 delegate:self queue:&_dispatch_main_q];
    networkRelayDeviceMonitor = self->_networkRelayDeviceMonitor;
    self->_networkRelayDeviceMonitor = v11;
  }
  if ([(NRDeviceMonitor *)self->_networkRelayDeviceMonitor isConnected])
  {
    self->_pendingLinkUpgradeRequest = 0;
    self->_currentLinkSubType = [(NRDeviceMonitor *)self->_networkRelayDeviceMonitor linkSubtype];
    unsigned __int16 v13 = (NRDevicePreferences *)[objc_alloc((Class)NRDevicePreferences) initWithDeviceIdentifier:v4];
    networkRelayDevicePreferences = self->_networkRelayDevicePreferences;
    self->_networkRelayDevicePreferences = v13;

    id v15 = [objc_alloc((Class)NRCompanionLinkPreferences) initForHighThroughputWithServiceClass:5 includeP2P:1];
    [(NRDevicePreferences *)self->_networkRelayDevicePreferences setCompanionLinkPreferences:v15];
    self->_BOOL waitingForAWDLupgradeTimeout = 1;
    uint64_t v16 = +[NSTimer timerWithTimeInterval:self target:"_awdlUpgradeTimedout" selector:0 userInfo:0 repeats:15.0];
    awdlUpgradeTimeoutTimer = self->_awdlUpgradeTimeoutTimer;
    self->_awdlUpgradeTimeoutTimer = v16;

    __int16 v18 = +[NSRunLoop currentRunLoop];
    [v18 addTimer:self->_awdlUpgradeTimeoutTimer forMode:NSRunLoopCommonModes];

    [(COSLinkUpgradeMonitor *)self _updateNanoRegistryToNormalStateIfNeeded];
    v19 = pbb_setupflow_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      uint64_t v22 = "-[COSLinkUpgradeMonitor _updateCompanionLinkPreferenceToAWDLforBTUUID:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: Marked for using AWDL", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    v20 = pbb_setupflow_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      uint64_t v22 = "-[COSLinkUpgradeMonitor _updateCompanionLinkPreferenceToAWDLforBTUUID:]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Peer not connected yet. Waiting for connectivity", (uint8_t *)&v21, 0xCu);
    }

    self->_pendingLinkUpgradeRequest = 1;
  }
}

- (void)_awdlUpgradeTimedout
{
  v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[COSLinkUpgradeMonitor _awdlUpgradeTimedout]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: AWDL upgrade request timedout", (uint8_t *)&v4, 0xCu);
  }

  self->_BOOL waitingForAWDLupgradeTimeout = 0;
  if (self->_wirelessCredentialsExchangeComplete && !self->_currentLinkSubType && !self->_everConnectedOnAWDL) {
    [(COSLinkUpgradeMonitor *)self _performLinkUpgradeToInfraWiFi];
  }
}

- (void)_performLinkUpgradeToInfraWiFi
{
  v3 = [UIApp activeWatch];
  int v4 = v3;
  if (v3)
  {
    v5 = [v3 valueForProperty:_NRDevicePropertyBluetoothIdentifier];
    id v6 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:v5];
    unsigned int v7 = pbb_setupflow_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v8 = [v6 nrDeviceIdentifier];
      int v16 = 136315650;
      v17 = "-[COSLinkUpgradeMonitor _performLinkUpgradeToInfraWiFi]";
      __int16 v18 = 2114;
      v19 = v5;
      __int16 v20 = 2114;
      int v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: BT identifier: %{public}@ networkRelayDeviceIdentifier: %{public}@", (uint8_t *)&v16, 0x20u);
    }
    networkRelayDeviceMonitor = self->_networkRelayDeviceMonitor;
    if (!networkRelayDeviceMonitor)
    {
      unsigned __int8 v10 = (NRDeviceMonitor *)[objc_alloc((Class)NRDeviceMonitor) initWithDeviceIdentifier:v6 delegate:self queue:&_dispatch_main_q];
      int v11 = self->_networkRelayDeviceMonitor;
      self->_networkRelayDeviceMonitor = v10;

      networkRelayDeviceMonitor = self->_networkRelayDeviceMonitor;
    }
    self->_currentLinkSubType = [(NRDeviceMonitor *)networkRelayDeviceMonitor linkSubtype];
    int v12 = (NRDevicePreferences *)[objc_alloc((Class)NRDevicePreferences) initWithDeviceIdentifier:v6];
    networkRelayDevicePreferences = self->_networkRelayDevicePreferences;
    self->_networkRelayDevicePreferences = v12;

    id v14 = [objc_alloc((Class)NRCompanionLinkPreferences) initForHighThroughputWithServiceClass:5 includeP2P:0];
    [(NRDevicePreferences *)self->_networkRelayDevicePreferences setCompanionLinkPreferences:v14];
    [(COSLinkUpgradeMonitor *)self _updateNanoRegistryToNormalStateIfNeeded];
    id v15 = pbb_setupflow_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      v17 = "-[COSLinkUpgradeMonitor _performLinkUpgradeToInfraWiFi]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Marked for using Infra Wi-Fi", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    v5 = pbb_setupflow_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      v17 = "-[COSLinkUpgradeMonitor _performLinkUpgradeToInfraWiFi]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: no active device to upgrade link to Infra Wi-Fi", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)wirelessCredentialUpdateCompletedWithResult:(BOOL)a3
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10013156C;
  v5[3] = &unk_100243930;
  objc_copyWeak(&v6, &location);
  BOOL v7 = a3;
  v5[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)resetMonitor
{
  v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[COSLinkUpgradeMonitor resetMonitor]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(COSLinkUpgradeMonitor *)self resetCompanionLinkPreference];
  self->_pendingLinkUpgradeRequest = 0;
  *(void *)&self->_BOOL observingLinkChange = 0;
  [(NSTimer *)self->_awdlUpgradeTimeoutTimer invalidate];
  awdlUpgradeTimeoutTimer = self->_awdlUpgradeTimeoutTimer;
  self->_awdlUpgradeTimeoutTimer = 0;

  self->_everConnectedOnAWDL = 0;
}

- (void)_updateNanoRegistryToNormalStateIfNeeded
{
  v3 = +[UIApplication sharedApplication];
  int v4 = [v3 activeWatch];

  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"15874345-3594-4D3F-9A28-BA2AEA650A0D"];
  unsigned int v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    if (self->_updatedNRToEnterNormalState) {
      goto LABEL_14;
    }
    if (self->_backupRestoreStepComplete
      && self->_initialPropertyExchangeComplete
      && self->_softwareUpdateStateResolved
      && self->_currentLinkSubType)
    {
      BOOL v7 = pbb_setupflow_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int currentLinkSubType = self->_currentLinkSubType;
        int v14 = 136315394;
        id v15 = "-[COSLinkUpgradeMonitor _updateNanoRegistryToNormalStateIfNeeded]";
        __int16 v16 = 1024;
        unsigned int v17 = currentLinkSubType;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Asking NR to end pairing. Link sub type: %d", (uint8_t *)&v14, 0x12u);
      }

      BOOL v9 = [UIApp setupController];
      [v9 updateNanoRegistryToNormalState];

      self->_updatedNRToEnterNormalState = 1;
      goto LABEL_14;
    }
  }
  else if (self->_updatedNRToEnterNormalState)
  {
    goto LABEL_14;
  }
  unsigned __int8 v10 = pbb_setupflow_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL backupRestoreStepComplete = self->_backupRestoreStepComplete;
    BOOL initialPropertyExchangeComplete = self->_initialPropertyExchangeComplete;
    BOOL softwareUpdateStateResolved = self->_softwareUpdateStateResolved;
    int v14 = 136316162;
    id v15 = "-[COSLinkUpgradeMonitor _updateNanoRegistryToNormalStateIfNeeded]";
    __int16 v16 = 1024;
    unsigned int v17 = v6;
    __int16 v18 = 1024;
    BOOL v19 = backupRestoreStepComplete;
    __int16 v20 = 1024;
    BOOL v21 = initialPropertyExchangeComplete;
    __int16 v22 = 1024;
    BOOL v23 = softwareUpdateStateResolved;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Skipping NR to end pairing. supportsKaikyoV2: %{BOOL}d backupRestoreStepComplete: %{BOOL}d initialPropertyExchangeComplete: %{BOOL}d softwareUpdateStateResolved: %{BOOL}d", (uint8_t *)&v14, 0x24u);
  }

LABEL_14:
}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v6 = pbb_setupflow_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unsigned __int8 v10 = "-[COSLinkUpgradeMonitor deviceIsConnectedDidChange:isConnected:]";
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: connected %{BOOL}d", buf, 0x12u);
  }

  if (v4 && self->_pendingLinkUpgradeRequest)
  {
    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100131ACC;
    block[3] = &unk_1002439E0;
    objc_copyWeak(&v8, (id *)buf);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5
{
  int v5 = a5;
  BOOL v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
    StringFromNRLinkType = (void *)createStringFromNRLinkType();
    unsigned __int8 v10 = (void *)createStringFromNRLinkSubtype();
    int v12 = 136315906;
    unsigned __int16 v13 = "-[COSLinkUpgradeMonitor deviceLinkTypeDidChange:linkType:linkSubtype:]";
    __int16 v14 = 2112;
    id v15 = StringFromNRLinkSubtype;
    __int16 v16 = 2112;
    unsigned int v17 = StringFromNRLinkType;
    __int16 v18 = 2112;
    BOOL v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: link changed. current linkSubType: %@ new linkType: %@, new linkSubType: %@", (uint8_t *)&v12, 0x2Au);
  }
  self->_unsigned int currentLinkSubType = v5;
  if (v5 == 102)
  {
    self->_everConnectedOnAWDL = 1;
    self->_BOOL waitingForAWDLupgradeTimeout = 0;
    [(NSTimer *)self->_awdlUpgradeTimeoutTimer invalidate];
    awdlUpgradeTimeoutTimer = self->_awdlUpgradeTimeoutTimer;
    self->_awdlUpgradeTimeoutTimer = 0;
  }
  [(COSLinkUpgradeMonitor *)self _updateNanoRegistryToNormalStateIfNeeded];
}

- (void)indicateBackupRestoreStepCompleted
{
  self->_BOOL backupRestoreStepComplete = 1;
  [(COSLinkUpgradeMonitor *)self _updateNanoRegistryToNormalStateIfNeeded];
}

- (void)indicateSoftwareUpdateStateResolved
{
  self->_BOOL softwareUpdateStateResolved = 1;
  [(COSLinkUpgradeMonitor *)self _updateNanoRegistryToNormalStateIfNeeded];
}

- (BOOL)holdingAnyCompanionLinkPreference
{
  v2 = [(NRDevicePreferences *)self->_networkRelayDevicePreferences companionLinkPreferences];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)observingLinkChange
{
  return self->_observingLinkChange;
}

- (void)setObservingLinkChange:(BOOL)a3
{
  self->_BOOL observingLinkChange = a3;
}

- (BOOL)wirelessCredentialsExchangeComplete
{
  return self->_wirelessCredentialsExchangeComplete;
}

- (void)setWirelessCredentialsExchangeComplete:(BOOL)a3
{
  self->_wirelessCredentialsExchangeComplete = a3;
}

- (BOOL)initialPropertyExchangeComplete
{
  return self->_initialPropertyExchangeComplete;
}

- (void)setInitialPropertyExchangeComplete:(BOOL)a3
{
  self->_BOOL initialPropertyExchangeComplete = a3;
}

- (NRDevicePreferences)networkRelayDevicePreferences
{
  return self->_networkRelayDevicePreferences;
}

- (void)setNetworkRelayDevicePreferences:(id)a3
{
}

- (NRDeviceMonitor)networkRelayDeviceMonitor
{
  return self->_networkRelayDeviceMonitor;
}

- (void)setNetworkRelayDeviceMonitor:(id)a3
{
}

- (unsigned)currentLinkSubType
{
  return self->_currentLinkSubType;
}

- (void)setCurrentLinkSubType:(unsigned __int8)a3
{
  self->_unsigned int currentLinkSubType = a3;
}

- (BOOL)updatedNRToEnterNormalState
{
  return self->_updatedNRToEnterNormalState;
}

- (void)setUpdatedNRToEnterNormalState:(BOOL)a3
{
  self->_updatedNRToEnterNormalState = a3;
}

- (BOOL)backupRestoreStepComplete
{
  return self->_backupRestoreStepComplete;
}

- (void)setBackupRestoreStepComplete:(BOOL)a3
{
  self->_BOOL backupRestoreStepComplete = a3;
}

- (BOOL)softwareUpdateStateResolved
{
  return self->_softwareUpdateStateResolved;
}

- (void)setSoftwareUpdateStateResolved:(BOOL)a3
{
  self->_BOOL softwareUpdateStateResolved = a3;
}

- (NSTimer)awdlUpgradeTimeoutTimer
{
  return self->_awdlUpgradeTimeoutTimer;
}

- (void)setAwdlUpgradeTimeoutTimer:(id)a3
{
}

- (BOOL)waitingForAWDLupgradeTimeout
{
  return self->_waitingForAWDLupgradeTimeout;
}

- (void)setWaitingForAWDLupgradeTimeout:(BOOL)a3
{
  self->_BOOL waitingForAWDLupgradeTimeout = a3;
}

- (BOOL)pendingLinkUpgradeRequest
{
  return self->_pendingLinkUpgradeRequest;
}

- (void)setPendingLinkUpgradeRequest:(BOOL)a3
{
  self->_pendingLinkUpgradeRequest = a3;
}

- (BOOL)everConnectedOnAWDL
{
  return self->_everConnectedOnAWDL;
}

- (void)setEverConnectedOnAWDL:(BOOL)a3
{
  self->_everConnectedOnAWDL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awdlUpgradeTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_networkRelayDeviceMonitor, 0);

  objc_storeStrong((id *)&self->_networkRelayDevicePreferences, 0);
}

@end