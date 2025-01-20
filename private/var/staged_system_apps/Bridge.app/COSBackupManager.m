@interface COSBackupManager
+ (id)sharedBackupManager;
- (BOOL)didRestore;
- (BOOL)foundBackup;
- (BOOL)iCloudBackupsLoaded;
- (BOOL)isCompatibleBackupListCurrent;
- (BOOL)isCompatiblePairedDeviceListCurrent;
- (BOOL)loadBackupsStarted;
- (BOOL)localBackupsLoaded;
- (BOOL)recordedPairingTimeBackupsCount;
- (BOOL)tinkerBackupsLoaded;
- (COSBackupManager)init;
- (COSBuddyManagerBackupsChanged)delegate;
- (NBBackup)backupRestoredFrom;
- (NBManager)backupController;
- (NRDevice)deviceRestoredFrom;
- (NRDevice)targetDevice;
- (NSArray)backups;
- (NSArray)compatibleBackups;
- (NSArray)compatiblePairedOrArchivedDevices;
- (NSArray)localBackups;
- (NSArray)pairedDevices;
- (NSDictionary)chipIDToLastSupportedPrefix;
- (NSString)deviceNameToRestore;
- (NSString)minWatchOSVersion;
- (id)compatiblePairedDevices;
- (id)removeIncompatibleBackups:(id)a3;
- (id)sortBackups:(id)a3;
- (id)sortDevices:(id)a3;
- (unint64_t)shouldOfferToRestore;
- (void)loadBackups;
- (void)loadiCloudBackups;
- (void)reloadBackups;
- (void)reloadiCloudBackups;
- (void)reset;
- (void)restoreFromBackup:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
- (void)restoreFromDevice:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
- (void)setBackupController:(id)a3;
- (void)setBackupRestoredFrom:(id)a3;
- (void)setChipIDToLastSupportedPrefix:(id)a3;
- (void)setCompatibleBackups:(id)a3;
- (void)setCompatiblePairedOrArchivedDevices:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceRestoredFrom:(id)a3;
- (void)setFoundBackup:(BOOL)a3;
- (void)setICloudBackupsLoaded:(BOOL)a3;
- (void)setIsCompatibleBackupListCurrent:(BOOL)a3;
- (void)setIsCompatiblePairedDeviceListCurrent:(BOOL)a3;
- (void)setLoadBackupsStarted:(BOOL)a3;
- (void)setLocalBackups:(id)a3;
- (void)setLocalBackupsLoaded:(BOOL)a3;
- (void)setMinWatchOSVersion:(id)a3;
- (void)setRecordedPairingTimeBackupsCount:(BOOL)a3;
- (void)setTargetDevice:(id)a3;
- (void)setTinkerBackupsLoaded:(BOOL)a3;
- (void)updateCompatiblePairedOrArchivedDeviceListIfNeeded;
@end

@implementation COSBackupManager

- (COSBackupManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)COSBackupManager;
  v2 = [(COSBackupManager *)&v12 init];
  if (v2)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v3 = (void *)qword_10029B1B8;
    uint64_t v17 = qword_10029B1B8;
    if (!qword_10029B1B8)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100005E94;
      v13[3] = &unk_1002436A8;
      v13[4] = &v14;
      sub_100005E94((uint64_t)v13);
      v3 = (void *)v15[3];
    }
    v4 = v3;
    _Block_object_dispose(&v14, 8);
    id v5 = [v4 alloc];
    v6 = dispatch_get_global_queue(2, 0);
    v7 = (NBManager *)[v5 initWithQueue:v6];
    backupController = v2->_backupController;
    v2->_backupController = v7;

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100006618;
    v10[3] = &unk_1002438A0;
    v11 = v2;
    if (qword_10029B1A0 != -1) {
      dispatch_once(&qword_10029B1A0, v10);
    }
  }
  return v2;
}

- (void)reloadiCloudBackups
{
  self->_iCloudBackupsLoaded = 0;
  [(COSBackupManager *)self loadiCloudBackups];
}

- (void)loadiCloudBackups
{
  backupController = self->_backupController;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007E74;
  v3[3] = &unk_100246328;
  v3[4] = self;
  [(NBManager *)backupController listBackupsOfType:2 timeout:60 completionHandler:v3];
}

+ (id)sharedBackupManager
{
  if (qword_10029B1B0 != -1) {
    dispatch_once(&qword_10029B1B0, &stru_100246420);
  }
  v2 = (void *)qword_10029B1A8;

  return v2;
}

- (void)loadBackups
{
  v3 = [UIApp bridgeController];
  unsigned int v4 = [v3 isTinkerPairing];

  id v5 = (NSArray *)objc_opt_new();
  localBackups = self->_localBackups;
  self->_localBackups = v5;

  self->_loadBackupsStarted = 1;
  if (v4)
  {
    if (PBLogPerformanceMetrics())
    {
      v7 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      [v7 beginMacroActivity:PBBridgeTinkerBackupActivityName beginTime:CFAbsoluteTimeGetCurrent()];
    }
    backupController = self->_backupController;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000B9834;
    v11[3] = &unk_100246328;
    v11[4] = self;
    [(NBManager *)backupController listBackupsOfType:3 timeout:180 completionHandler:v11];
  }
  else
  {
    v9 = self->_backupController;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B99AC;
    v10[3] = &unk_100246328;
    void v10[4] = self;
    [(NBManager *)v9 listBackupsOfType:1 timeout:20 completionHandler:v10];
    [(COSBackupManager *)self loadiCloudBackups];
  }
}

- (void)setMinWatchOSVersion:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_minWatchOSVersion, a3);
  v6 = pbb_setupflow_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setMinWatchOSVersion to: %@", (uint8_t *)&v7, 0xCu);
  }

  *(_WORD *)&self->_isCompatibleBackupListCurrent = 0;
}

- (void)reset
{
  minWatchOSVersion = self->_minWatchOSVersion;
  self->_minWatchOSVersion = 0;

  localBackups = self->_localBackups;
  self->_localBackups = 0;

  *(_WORD *)&self->_isCompatibleBackupListCurrent = 0;
  backupRestoredFrom = self->_backupRestoredFrom;
  self->_backupRestoredFrom = 0;

  deviceRestoredFrom = self->_deviceRestoredFrom;
  self->_deviceRestoredFrom = 0;

  targetDevice = self->_targetDevice;
  self->_targetDevice = 0;

  *(_WORD *)&self->_foundBackup = 0;
  *(_WORD *)&self->_localBackupsLoaded = 0;
}

- (unint64_t)shouldOfferToRestore
{
  v3 = [UIApp bridgeController];
  unsigned int v4 = [v3 isTinkerPairing];

  BOOL loadBackupsStarted = self->_loadBackupsStarted;
  v6 = pbb_setupflow_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!loadBackupsStarted)
  {
    if (v7)
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Backups not loaded, loading...", (uint8_t *)&v19, 2u);
    }

    [(COSBackupManager *)self loadBackups];
    return 0;
  }
  if (v4)
  {
    if (v7)
    {
      BOOL v8 = self->_loadBackupsStarted;
      BOOL foundBackup = self->_foundBackup;
      BOOL tinkerBackupsLoaded = self->_tinkerBackupsLoaded;
      int v19 = 67109632;
      BOOL v20 = v8;
      __int16 v21 = 1024;
      BOOL v22 = foundBackup;
      __int16 v23 = 1024;
      BOOL v24 = tinkerBackupsLoaded;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "tinker pairing: loadStarted: %d foundBackup: %d tinkerBackupsLoaded: %d", (uint8_t *)&v19, 0x14u);
    }

    if (!self->_foundBackup)
    {
      BOOL v11 = self->_tinkerBackupsLoaded;
      return 2 * v11;
    }
    return 1;
  }
  if (v7)
  {
    BOOL v13 = self->_loadBackupsStarted;
    BOOL v14 = self->_foundBackup;
    BOOL localBackupsLoaded = self->_localBackupsLoaded;
    BOOL iCloudBackupsLoaded = self->_iCloudBackupsLoaded;
    int v19 = 67109888;
    BOOL v20 = v13;
    __int16 v21 = 1024;
    BOOL v22 = v14;
    __int16 v23 = 1024;
    BOOL v24 = localBackupsLoaded;
    __int16 v25 = 1024;
    BOOL v26 = iCloudBackupsLoaded;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "shouldOfferToRestore: loadStarted: %d foundBackup: %d localBackupsLoaded: %d iCloudBackupsLoaded: %d", (uint8_t *)&v19, 0x1Au);
  }

  if (!self->_foundBackup)
  {
    uint64_t v17 = [(COSBackupManager *)self pairedDevices];
    id v18 = [v17 count];

    if (!v18)
    {
      if (self->_localBackupsLoaded)
      {
        BOOL v11 = self->_iCloudBackupsLoaded;
        return 2 * v11;
      }
      return 0;
    }
  }
  return 1;
}

- (NSArray)backups
{
  return self->_localBackups;
}

- (NSArray)pairedDevices
{
  [(COSBackupManager *)self updateCompatiblePairedOrArchivedDeviceListIfNeeded];
  compatiblePairedOrArchivedDevices = self->_compatiblePairedOrArchivedDevices;

  return compatiblePairedOrArchivedDevices;
}

- (BOOL)didRestore
{
  return self->_backupRestoredFrom || self->_deviceRestoredFrom != 0;
}

- (void)restoreFromBackup:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  backupController = self->_backupController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B9FF0;
  v15[3] = &unk_100246448;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(NBManager *)backupController restoreFromBackup:v14 forDevice:v13 completionHandler:v15];
}

- (void)restoreFromDevice:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  backupController = self->_backupController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000BA184;
  v15[3] = &unk_100246448;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(NBManager *)backupController restoreFromDevice:v14 forDevice:v13 completionHandler:v15];
}

- (NSString)deviceNameToRestore
{
  backupRestoredFrom = self->_backupRestoredFrom;
  if (backupRestoredFrom)
  {
    backupRestoredFrom = [backupRestoredFrom name];
  }

  return (NSString *)backupRestoredFrom;
}

- (void)reloadBackups
{
  v3 = self->_minWatchOSVersion;
  [(COSBackupManager *)self reset];
  minWatchOSVersion = self->_minWatchOSVersion;
  self->_minWatchOSVersion = v3;
  id v5 = v3;

  [(COSBackupManager *)self loadBackups];
}

- (id)compatiblePairedDevices
{
  v3 = +[COSBackupManager sharedBackupManager];
  unsigned int v4 = [v3 minWatchOSVersion];
  unsigned int v5 = NRWatchOSVersion();

  v6 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v7 = [(COSBackupManager *)self pairedDevices];
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    uint64_t v11 = NRDevicePropertyPairingID;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unsigned int v14 = NRWatchOSVersionForRemoteDevice();
        v15 = pbb_setupflow_log();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v5 >= v14)
        {
          if (v16)
          {
            id v18 = [v13 valueForProperty:v11];
            *(_DWORD *)buf = 138412290;
            __int16 v25 = v18;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found paired watch: %@ version allowed", buf, 0xCu);
          }
          [v6 addObject:v13];
        }
        else
        {
          if (v16)
          {
            id v17 = [v13 valueForProperty:v11];
            *(_DWORD *)buf = 138412290;
            __int16 v25 = v17;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found paired watch: %@ version not allowed (skipping)", buf, 0xCu);
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)removeIncompatibleBackups:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  v6 = [v5 valueForProperty:NRDevicePropertyChipID];
  BOOL v7 = [(NSDictionary *)self->_chipIDToLastSupportedPrefix objectForKeyedSubscript:v6];
  id v8 = [v7 integerValue];

  id v9 = pbb_setupflow_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Looking at chipid: %@", buf, 0xCu);
  }

  uint64_t v10 = [(NSDictionary *)self->_chipIDToLastSupportedPrefix objectForKeyedSubscript:v6];

  if (v10)
  {
    v27 = v6;
    v28 = v5;
    id v30 = (id)objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v29 = v4;
    id obj = v4;
    id v11 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v33;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          BOOL v16 = [v15 systemVersion];
          id v17 = [v16 componentsSeparatedByString:@"."];
          id v18 = [v17 objectAtIndexedSubscript:0];
          id v19 = [v18 integerValue];

          long long v20 = pbb_setupflow_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            id v37 = v19;
            __int16 v38 = 2048;
            id v39 = v8;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "comparing %ld to %ld", buf, 0x16u);
          }

          long long v21 = pbb_setupflow_log();
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          if ((uint64_t)v19 <= (uint64_t)v8)
          {
            if (v22)
            {
              long long v23 = [v15 uuid];
              BOOL v24 = [v23 UUIDString];
              id v25 = [v15 backupType];
              *(_DWORD *)buf = 138412546;
              id v37 = v24;
              __int16 v38 = 1024;
              LODWORD(v39) = v25 == (id)1;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Adding backup with id: %@ fromCloud: %{BOOL}d", buf, 0x12u);
            }
            [v30 addObject:v15];
          }
          else
          {
            if (v22)
            {
              *(_DWORD *)buf = 138412290;
              id v37 = v15;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Skipping backup that is beyond a version this watch can be updated to: %@", buf, 0xCu);
            }
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v12);
    }

    unsigned int v5 = v28;
    id v4 = v29;
    v6 = v27;
  }
  else
  {
    id v30 = v4;
  }

  return v30;
}

- (id)sortBackups:(id)a3
{
  v3 = +[NSMutableArray arrayWithArray:a3];
  [v3 sortUsingComparator:&stru_100246488];
  id v4 = +[NSArray arrayWithArray:v3];

  return v4;
}

- (id)sortDevices:(id)a3
{
  v3 = +[NSMutableArray arrayWithArray:a3];
  [v3 sortUsingComparator:&stru_1002464A8];

  return v3;
}

- (void)updateCompatiblePairedOrArchivedDeviceListIfNeeded
{
  if (!self->_isCompatiblePairedDeviceListCurrent)
  {
    v2 = self;
    self->_isCompatiblePairedDeviceListCurrent = 1;
    v3 = [UIApp bridgeController];
    unsigned int v4 = [v3 isTinkerPairing];

    if (v4)
    {
      compatiblePairedOrArchivedDevices = v2->_compatiblePairedOrArchivedDevices;
      v2->_compatiblePairedOrArchivedDevices = 0;
    }
    else
    {
      v6 = objc_opt_new();
      long long v32 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
      id v37 = [v32 valueForProperty:NRDevicePropertyChipID];
      BOOL v7 = -[NSDictionary objectForKeyedSubscript:](v2->_chipIDToLastSupportedPrefix, "objectForKeyedSubscript:");
      id v36 = [v7 integerValue];

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v8 = sub_100014784();
      id v9 = [v8 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v43;
        uint64_t v12 = NRDevicePropertyIsAltAccount;
        uint64_t v33 = NRDevicePropertySystemVersion;
        long long v34 = v8;
        long long v35 = v6;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v43 != v11) {
              objc_enumerationMutation(v8);
            }
            unsigned int v14 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            v15 = [v14 valueForProperty:v12];

            if (!v15)
            {
              BOOL v16 = [(NSDictionary *)v2->_chipIDToLastSupportedPrefix objectForKeyedSubscript:v37];

              if (!v16) {
                goto LABEL_16;
              }
              id v17 = v2;
              id v18 = [v14 valueForProperty:v33];
              id v19 = [v18 componentsSeparatedByString:@"."];
              long long v20 = [v19 objectAtIndexedSubscript:0];
              id v21 = [v20 integerValue];

              BOOL v22 = pbb_setupflow_log();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218240;
                id v48 = v21;
                __int16 v49 = 2048;
                id v50 = v36;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "comparing(device) %ld to %ld", buf, 0x16u);
              }

              v2 = v17;
              id v8 = v34;
              v6 = v35;
              if ((uint64_t)v21 <= (uint64_t)v36) {
LABEL_16:
              }
                [v6 addObject:v14];
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v42 objects:v51 count:16];
        }
        while (v10);
      }

      long long v23 = +[NRPairedDeviceRegistry sharedInstance];
      BOOL v24 = [v23 getAllDevicesWithArchivedDevicesMatching:&stru_1002464C8];

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v25 = v24;
      id v26 = [v25 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v39;
        do
        {
          for (j = 0; j != v27; j = (char *)j + 1)
          {
            if (*(void *)v39 != v28) {
              objc_enumerationMutation(v25);
            }
            [v6 addObject:*(void *)(*((void *)&v38 + 1) + 8 * (void)j)];
          }
          id v27 = [v25 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v27);
      }

      uint64_t v30 = [(COSBackupManager *)v2 sortDevices:v6];
      v31 = v2->_compatiblePairedOrArchivedDevices;
      v2->_compatiblePairedOrArchivedDevices = (NSArray *)v30;
    }
  }
}

- (NSString)minWatchOSVersion
{
  return self->_minWatchOSVersion;
}

- (NBBackup)backupRestoredFrom
{
  return self->_backupRestoredFrom;
}

- (void)setBackupRestoredFrom:(id)a3
{
}

- (NRDevice)deviceRestoredFrom
{
  return self->_deviceRestoredFrom;
}

- (void)setDeviceRestoredFrom:(id)a3
{
}

- (NRDevice)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(id)a3
{
}

- (COSBuddyManagerBackupsChanged)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSBuddyManagerBackupsChanged *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)recordedPairingTimeBackupsCount
{
  return self->_recordedPairingTimeBackupsCount;
}

- (void)setRecordedPairingTimeBackupsCount:(BOOL)a3
{
  self->_recordedPairingTimeBackupsCount = a3;
}

- (NBManager)backupController
{
  return self->_backupController;
}

- (void)setBackupController:(id)a3
{
}

- (NSArray)localBackups
{
  return self->_localBackups;
}

- (void)setLocalBackups:(id)a3
{
}

- (NSArray)compatibleBackups
{
  return self->_compatibleBackups;
}

- (void)setCompatibleBackups:(id)a3
{
}

- (NSArray)compatiblePairedOrArchivedDevices
{
  return self->_compatiblePairedOrArchivedDevices;
}

- (void)setCompatiblePairedOrArchivedDevices:(id)a3
{
}

- (BOOL)isCompatibleBackupListCurrent
{
  return self->_isCompatibleBackupListCurrent;
}

- (void)setIsCompatibleBackupListCurrent:(BOOL)a3
{
  self->_isCompatibleBackupListCurrent = a3;
}

- (BOOL)isCompatiblePairedDeviceListCurrent
{
  return self->_isCompatiblePairedDeviceListCurrent;
}

- (void)setIsCompatiblePairedDeviceListCurrent:(BOOL)a3
{
  self->_isCompatiblePairedDeviceListCurrent = a3;
}

- (BOOL)localBackupsLoaded
{
  return self->_localBackupsLoaded;
}

- (void)setLocalBackupsLoaded:(BOOL)a3
{
  self->_BOOL localBackupsLoaded = a3;
}

- (BOOL)iCloudBackupsLoaded
{
  return self->_iCloudBackupsLoaded;
}

- (void)setICloudBackupsLoaded:(BOOL)a3
{
  self->_BOOL iCloudBackupsLoaded = a3;
}

- (BOOL)tinkerBackupsLoaded
{
  return self->_tinkerBackupsLoaded;
}

- (void)setTinkerBackupsLoaded:(BOOL)a3
{
  self->_BOOL tinkerBackupsLoaded = a3;
}

- (BOOL)foundBackup
{
  return self->_foundBackup;
}

- (void)setFoundBackup:(BOOL)a3
{
  self->_BOOL foundBackup = a3;
}

- (BOOL)loadBackupsStarted
{
  return self->_loadBackupsStarted;
}

- (void)setLoadBackupsStarted:(BOOL)a3
{
  self->_BOOL loadBackupsStarted = a3;
}

- (NSDictionary)chipIDToLastSupportedPrefix
{
  return self->_chipIDToLastSupportedPrefix;
}

- (void)setChipIDToLastSupportedPrefix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipIDToLastSupportedPrefix, 0);
  objc_storeStrong((id *)&self->_compatiblePairedOrArchivedDevices, 0);
  objc_storeStrong((id *)&self->_compatibleBackups, 0);
  objc_storeStrong((id *)&self->_localBackups, 0);
  objc_storeStrong((id *)&self->_backupController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_deviceRestoredFrom, 0);
  objc_storeStrong((id *)&self->_backupRestoredFrom, 0);

  objc_storeStrong((id *)&self->_minWatchOSVersion, 0);
}

@end