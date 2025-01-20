@interface COSMigrationManager
- (BOOL)allowUIUpdate;
- (BOOL)discoveredWatch;
- (BOOL)enableReportFailure;
- (BOOL)isDeviceMigrating:(id)a3;
- (BOOL)isDeviceWaitingToMigrate:(id)a3;
- (COSMigrationManager)init;
- (COSMigrationProgressDelegate)delegate;
- (NRDevice)migratingDevice;
- (NSArray)migratableDevices;
- (PSYSyncSession)currentSession;
- (PSYSyncSessionObserver)progressObserver;
- (id)_deviceWatingToSync;
- (id)_getMigratingDevice;
- (id)_syncingDevice;
- (unint64_t)currentState;
- (void)_configureCurrentState;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)setAllowUIUpdate:(BOOL)a3;
- (void)setCurrentSession:(id)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoveredWatch:(BOOL)a3;
- (void)setEnableReportFailure:(BOOL)a3;
- (void)setMigratableDevices:(id)a3;
- (void)setMigratingDevice:(id)a3;
- (void)setProgressObserver:(id)a3;
- (void)startMigration;
- (void)syncSessionObserver:(id)a3 didReceiveUpdate:(id)a4;
- (void)tinkerMigrationStarted:(id)a3;
- (void)updateMigrationState;
@end

@implementation COSMigrationManager

- (COSMigrationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)COSMigrationManager;
  v2 = [(COSMigrationManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(COSMigrationManager *)v2 _configureCurrentState];
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"applicationDidBecomeActive" name:UIApplicationDidBecomeActiveNotification object:0];

    if ((id)[(COSMigrationManager *)v3 currentState] == (id)1)
    {
      migratingDevice = v3->_migratingDevice;
      uint64_t v9 = _NRDevicePropertyStatusCode;
      v6 = +[NSArray arrayWithObjects:&v9 count:1];
      [(NRDevice *)migratingDevice addPropertyObserver:v3 forPropertyChanges:v6];

      *(_WORD *)&v3->_enableReportFailure = 257;
    }
  }
  return v3;
}

- (NSArray)migratableDevices
{
  v2 = +[NRMigrator sharedMigrator];
  v3 = [v2 migratableDevices];

  v4 = +[NRMigrator sharedMigrator];
  v5 = [v4 migratableDevicesRequiringConsent];

  if (v3)
  {
    id v6 = [v3 arrayByAddingObjectsFromArray:v5];
  }
  else
  {
    id v6 = v5;
  }
  v7 = v6;

  return (NSArray *)v7;
}

- (void)_configureCurrentState
{
  v3 = [(COSMigrationManager *)self _getMigratingDevice];
  migratingDevice = self->_migratingDevice;
  self->_migratingDevice = v3;

  if (self->_migratingDevice)
  {
    self->_currentState = 1;
    goto LABEL_14;
  }
  v5 = [(COSMigrationManager *)self _deviceWatingToSync];
  if (v5)
  {
    id v6 = pbb_setupflow_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v5 pairingID];
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device: %@ waiting to sync", buf, 0xCu);
    }
    if (self->_progressObserver)
    {
      objc_super v8 = [(COSMigrationManager *)self currentSession];
      [v8 sessionProgress];
      BOOL v10 = v9 < 1.0;

      if (v10)
      {
LABEL_12:
        objc_storeStrong((id *)&self->_migratingDevice, v5);
        goto LABEL_13;
      }
      unint64_t v11 = 0;
    }
    else
    {
      unint64_t v11 = 3;
    }
    self->_currentState = v11;
    goto LABEL_12;
  }
  self->_currentState = 0;
  [(COSMigrationManager *)self setDiscoveredWatch:0];
LABEL_13:

LABEL_14:
  if (!self->_progressObserver)
  {
    v12 = (PSYSyncSessionObserver *)objc_alloc_init((Class)PSYSyncSessionObserver);
    progressObserver = self->_progressObserver;
    self->_progressObserver = v12;

    [(PSYSyncSessionObserver *)self->_progressObserver setDelegate:self];
    objc_initWeak((id *)buf, self);
    v14 = self->_progressObserver;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100101848;
    v18[3] = &unk_100246928;
    objc_copyWeak(&v19, (id *)buf);
    [(PSYSyncSessionObserver *)v14 startObservingSyncSessionsWithCompletion:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  v15 = [(COSMigrationManager *)self delegate];
  unint64_t v16 = [(COSMigrationManager *)self currentState];
  v17 = [(COSMigrationManager *)self currentSession];
  [v17 sessionProgress];
  [v15 migrationProgressUpdate:v16 percentageComplete:self->_migratingDevice];
}

- (id)_deviceWatingToSync
{
  id v19 = +[NRPairedDeviceRegistry sharedInstance];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  sub_100005DC4();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v21;
    uint64_t v5 = NRDevicePropertyIsActive;
    uint64_t v6 = _NRDevicePropertyMigrationCount;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        objc_super v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v9 = [v8 valueForProperty:v5];
        unsigned int v10 = [v9 BOOLValue];

        unint64_t v11 = [v8 pairingID];
        unsigned int v12 = [v19 migrationCountForPairingID:v11];

        v13 = [v8 valueForProperty:v6];
        unsigned int v14 = [v13 integerValue];

        if (v12 != v14 && v10 != 0)
        {
          id v16 = v8;
          goto LABEL_14;
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v3);
  }
  id v16 = 0;
LABEL_14:

  return v16;
}

- (id)_syncingDevice
{
  id v2 = [(COSMigrationManager *)self currentSession];
  id v3 = [v2 pairingIdentifier];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = sub_10000CF90();
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_super v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        double v9 = [v8 pairingID];
        unsigned __int8 v10 = [v9 isEqual:v3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_getMigratingDevice
{
  BPSArchivedDevices();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v2)
  {
    id v4 = v2;
    id v5 = 0;
    uint64_t v6 = *(void *)v22;
    uint64_t v7 = _NRDevicePropertyStatusCode;
    uint64_t v8 = NRDevicePropertyIsActive;
    *(void *)&long long v3 = 138412290;
    long long v19 = v3;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        unint64_t v11 = [v10 valueForProperty:v7, v19];
        long long v12 = [v10 valueForProperty:v8];
        unsigned int v13 = [v12 BOOLValue];

        if ([v11 integerValue] == (id)4 && v13 != 0)
        {
          id v15 = v10;

          id v16 = pbb_setupflow_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = [v15 pairingID];
            *(_DWORD *)buf = v19;
            v26 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Found migrating device - %@", buf, 0xCu);
          }
          id v5 = v15;
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)tinkerMigrationStarted:(id)a3
{
  self->_currentState = 1;
  objc_storeStrong((id *)&self->_migratingDevice, a3);
  id v5 = a3;
  self->_discoveredWatch = 1;
  uint64_t v7 = _NRDevicePropertyStatusCode;
  uint64_t v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v5 addPropertyObserver:self forPropertyChanges:v6];
}

- (void)startMigration
{
  long long v3 = +[UIApplication sharedApplication];
  uint64_t v4 = [v3 activeWatchAssertion];

  uint64_t v24 = v4;
  if (v4)
  {
    id v5 = pbb_setupflow_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found active watch assertion, invalidate so migration can proceed", buf, 2u);
    }

    uint64_t v6 = +[UIApplication sharedApplication];
    [v6 cancelTinkerSwitch:0];
  }
  -[COSMigrationManager setEnableReportFailure:](self, "setEnableReportFailure:", 1, v24);
  [(COSMigrationManager *)self setDiscoveredWatch:0];
  [(COSMigrationManager *)self setCurrentState:1];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v7 = [(COSMigrationManager *)self migratableDevices];
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v32;
    uint64_t v11 = _NRDevicePropertyStatusCode;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v37 = v11;
        long long v14 = +[NSArray arrayWithObjects:&v37 count:1];
        [v13 addPropertyObserver:self forPropertyChanges:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v9);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1001022E4, NRMigrationDevicesCannotBeDiscoveredDarwinNotification, 0, (CFNotificationSuspensionBehavior)0);
  id v16 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v16, self, (CFNotificationCallback)sub_1001023DC, NRMigrationDeviceFoundBeginningMigrationDarwinNotification, 0, (CFNotificationSuspensionBehavior)0);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v17 = [(COSMigrationManager *)self migratableDevices];
  id v18 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * (void)j);
        long long v23 = +[NRMigrator sharedMigrator];
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_1001023E8;
        v26[3] = &unk_100243A08;
        v26[4] = v22;
        [v23 setMigrationConsented:0 forDevice:v22 withBlock:v26];
      }
      id v19 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v19);
  }
}

- (void)updateMigrationState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unint64_t currentState = self->_currentState;
  [(PSYSyncSession *)self->_currentSession sessionProgress];
  [WeakRetained migrationProgressUpdate:currentState percentageComplete:self->_migratingDevice];
}

- (void)syncSessionObserver:(id)a3 didReceiveUpdate:(id)a4
{
  id v12 = a4;
  id v5 = [v12 updatedSession];
  if ([v5 syncSessionType] == (id)2)
  {
    uint64_t v6 = [v12 updatedSession];
    id v7 = [v6 syncSessionState];

    id v8 = v12;
    if (v7 != (id)1) {
      goto LABEL_6;
    }
    id v9 = [v12 updatedSession];
    currentSession = self->_currentSession;
    self->_currentSession = v9;

    [(COSMigrationManager *)self setCurrentState:2];
    uint64_t v11 = [(COSMigrationManager *)self _syncingDevice];
    [(COSMigrationManager *)self setMigratingDevice:v11];

    [(COSMigrationManager *)self updateMigrationState];
  }
  else
  {
  }
  id v8 = v12;
LABEL_6:
}

- (BOOL)isDeviceWaitingToMigrate:(id)a3
{
  long long v3 = [a3 valueForProperty:NRDevicePropertyIsArchived];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isDeviceMigrating:(id)a3
{
  id v4 = a3;
  id v5 = [(COSMigrationManager *)self _getMigratingDevice];
  uint64_t v6 = [v5 pairingID];
  id v7 = [v4 pairingID];

  if (self->_currentState == 2)
  {
    uint64_t v8 = [(PSYSyncSession *)self->_currentSession pairingIdentifier];

    uint64_t v6 = (void *)v8;
  }
  unsigned __int8 v9 = [v7 isEqual:v6];

  return v9;
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = pbb_bridge_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 pairingID];
    *(_DWORD *)buf = 134218754;
    long long v29 = self;
    __int16 v30 = 2112;
    long long v31 = v12;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "propertyDidChange: self: (%p); device: (%@); property: (%@); fromValue: (%@)",
      buf,
      0x2Au);
  }
  uint64_t v13 = _NRDevicePropertyStatusCode;
  if ([v9 isEqualToString:_NRDevicePropertyStatusCode] && self->_discoveredWatch)
  {
    objc_initWeak((id *)buf, self);
    long long v14 = [v8 valueForProperty:v13];
    id v15 = [v8 valueForProperty:NRDevicePropertyIsArchived];
    id v16 = [v8 valueForProperty:NRDevicePropertyIsActive];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100102A78;
    v21[3] = &unk_1002459E8;
    objc_copyWeak(&v27, (id *)buf);
    id v22 = v15;
    id v23 = v14;
    id v24 = v10;
    id v25 = v16;
    v26 = self;
    id v17 = v16;
    id v18 = v14;
    id v19 = v15;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v21);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v20 = pbb_bridge_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "status changed, watch undiscovered, ignoring", buf, 2u);
    }
  }
}

- (COSMigrationProgressDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSMigrationProgressDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setMigratableDevices:(id)a3
{
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_unint64_t currentState = a3;
}

- (PSYSyncSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
}

- (NRDevice)migratingDevice
{
  return self->_migratingDevice;
}

- (void)setMigratingDevice:(id)a3
{
}

- (PSYSyncSessionObserver)progressObserver
{
  return self->_progressObserver;
}

- (void)setProgressObserver:(id)a3
{
}

- (BOOL)enableReportFailure
{
  return self->_enableReportFailure;
}

- (void)setEnableReportFailure:(BOOL)a3
{
  self->_enableReportFailure = a3;
}

- (BOOL)discoveredWatch
{
  return self->_discoveredWatch;
}

- (void)setDiscoveredWatch:(BOOL)a3
{
  self->_discoveredWatch = a3;
}

- (BOOL)allowUIUpdate
{
  return self->_allowUIUpdate;
}

- (void)setAllowUIUpdate:(BOOL)a3
{
  self->_allowUIUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressObserver, 0);
  objc_storeStrong((id *)&self->_migratingDevice, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_migratableDevices, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end