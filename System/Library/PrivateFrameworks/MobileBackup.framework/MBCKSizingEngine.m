@interface MBCKSizingEngine
+ (id)domainsForApp:(id)a3 persona:(id)a4;
- (BOOL)_findChangesForBundleIDs:(id)a3 error:(id *)a4;
- (BOOL)_findChangesForDomains:(id)a3 error:(id *)a4;
- (BOOL)_runWithError:(id *)a3;
- (BOOL)cancel;
- (BOOL)fileScanner:(id)a3 isFileAddedOrModified:(id)a4;
- (BOOL)findChangesWithError:(id *)a3;
- (BOOL)runWithError:(id *)a3;
- (BOOL)setUpWithError:(id *)a3;
- (MBCKSizingEngine)initWithSettingsContext:(id)a3 serviceManager:(id)a4;
- (MBCKSizingEngine)initWithSettingsContext:(id)a3 serviceManager:(id)a4 domainManager:(id)a5;
- (NSDictionary)modifiedBytesByBundleID;
- (NSMutableDictionary)domainNamesByBundleID;
- (NSMutableDictionary)modifiedBytesByDomainName;
- (NSMutableDictionary)pathsByDomainName;
- (NSMutableDictionary)totalBytesOnDiskByDomainName;
- (NSSet)bundleIDsToScan;
- (id)_bundleIDForDomainName:(id)a3;
- (id)_findDomainsLimitedTo:(id)a3 error:(id *)a4;
- (id)fileScanner:(id)a3 didFindFile:(id)a4;
- (int)engineMode;
- (int64_t)formatOfLastCommittedSnapshot;
- (int64_t)modifiedBytes;
- (int64_t)totalBytesOnDisk;
- (unint64_t)engineState;
- (void)setEngineState:(unint64_t)a3;
- (void)setFormatOfLastCommittedSnapshot:(int64_t)a3;
- (void)setModifiedBytes:(int64_t)a3;
- (void)setModifiedBytesByBundleID:(id)a3;
- (void)setTotalBytesOnDisk:(int64_t)a3;
@end

@implementation MBCKSizingEngine

- (MBCKSizingEngine)initWithSettingsContext:(id)a3 serviceManager:(id)a4 domainManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 account];
  if (!v11) {
    __assert_rtn("-[MBCKSizingEngine initWithSettingsContext:serviceManager:domainManager:]", "MBCKSizingEngine.m", 52, "account");
  }
  v12 = (void *)v11;
  v27.receiver = self;
  v27.super_class = (Class)MBCKSizingEngine;
  v13 = [(MBCKEngine *)&v27 initWithSettingsContext:v8 debugContext:0 domainManager:v10];
  v14 = v13;
  if (v13)
  {
    [(MBCKEngine *)v13 setServiceManager:v9];
    v14->_engineState = 1;
    v15 = [[MBFileScanner alloc] initWithDelegate:v14 mode:2 enginePolicy:[(MBEngine *)v14 enginePolicy] debugContext:v14->super.super._debugContext];
    scanner = v14->_scanner;
    v14->_scanner = v15;

    v17 = [MBAppManager alloc];
    v18 = [(MBEngine *)v14 settingsContext];
    v19 = [v18 mobileInstallation];
    v20 = [(MBAppManager *)v17 initWithMobileInstallation:v19];
    appManager = v14->super.super._appManager;
    v14->super.super._appManager = v20;

    uint64_t v22 = [v8 bundleIDs];
    bundleIDsToScan = v14->_bundleIDsToScan;
    v14->_bundleIDsToScan = (NSSet *)v22;

    uint64_t v24 = objc_opt_new();
    pathsByDomainName = v14->_pathsByDomainName;
    v14->_pathsByDomainName = (NSMutableDictionary *)v24;

    v14->_formatOfLastCommittedSnapshot = -1;
  }

  return v14;
}

- (MBCKSizingEngine)initWithSettingsContext:(id)a3 serviceManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 account];
  if (!v8) {
    __assert_rtn("-[MBCKSizingEngine initWithSettingsContext:serviceManager:]", "MBCKSizingEngine.m", 67, "account");
  }
  id v9 = (void *)v8;
  id v10 = objc_alloc((Class)MBDomainManager);
  uint64_t v11 = [v9 persona];
  id v12 = [v10 initWithPersona:v11];

  v13 = [(MBCKSizingEngine *)self initWithSettingsContext:v6 serviceManager:v7 domainManager:v12];
  return v13;
}

- (int)engineMode
{
  return 3;
}

- (BOOL)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)MBCKSizingEngine;
  BOOL v3 = [(MBEngine *)&v5 cancel];
  if (!v3) {
    [(MBFileScanner *)self->_scanner cancel];
  }
  return v3;
}

- (BOOL)runWithError:(id *)a3
{
  objc_super v5 = [(MBCKEngine *)self serviceManager];
  id v6 = [v5 delegate];
  id v52 = 0;
  unsigned __int8 v7 = [(MBCKSizingEngine *)self _runWithError:&v52];
  id v8 = v52;
  id v9 = MBGetDefaultLog();
  id v10 = v9;
  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v55 = (int64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=sizing= Failed to size next backup: %@", buf, 0xCu);
      _MBLog();
    }

    [v6 manager:v5 didFailScanWithError:v8];
    goto LABEL_18;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int64_t modifiedBytes = self->_modifiedBytes;
    int64_t totalBytesOnDisk = self->_totalBytesOnDisk;
    *(_DWORD *)buf = 134218240;
    int64_t v55 = modifiedBytes;
    __int16 v56 = 2048;
    int64_t v57 = totalBytesOnDisk;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "=sizing= modified:%llu total:%llu", buf, 0x16u);
    int64_t v36 = self->_modifiedBytes;
    int64_t v37 = self->_totalBytesOnDisk;
    _MBLog();
  }

  v13 = [(MBCKEngine *)self cache];
  unsigned int v14 = [v13 removeAllScannedDomains:a3];

  if (!v14)
  {
LABEL_18:
    BOOL v34 = 0;
    goto LABEL_19;
  }
  v38 = v6;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v15 = [(MBCKSizingEngine *)self modifiedBytesByDomainName];
  id v16 = [v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v49;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        v21 = [(MBCKSizingEngine *)self modifiedBytesByDomainName];
        uint64_t v22 = [v21 objectForKeyedSubscript:v20];

        v23 = [(MBCKEngine *)self cache];
        id v24 = objc_msgSend(v23, "updateScannedDomain:withSize:", v20, objc_msgSend(v22, "unsignedLongLongValue"));
      }
      id v17 = [v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v17);
  }

  int64_t v25 = [(MBCKSizingEngine *)self modifiedBytes];
  v26 = [(MBCKSizingEngine *)self modifiedBytesByBundleID];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1001424D4;
  v45[3] = &unk_1004145E0;
  id v6 = v38;
  id v27 = v38;
  id v46 = v27;
  id v28 = v5;
  id v47 = v28;
  [v26 enumerateKeysAndObjectsUsingBlock:v45];

  if (self->_bundleIDsToScan)
  {
    v29 = [(MBCKSizingEngine *)self modifiedBytesByDomainName];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100142540;
    v42[3] = &unk_100414608;
    v42[4] = self;
    id v30 = v27;
    id v43 = v30;
    id v31 = v28;
    id v44 = v31;
    [v29 enumerateKeysAndObjectsUsingBlock:v42];

    v32 = [(MBCKSizingEngine *)self pathsByDomainName];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1001425E8;
    v39[3] = &unk_100414630;
    v39[4] = self;
    id v33 = v30;
    id v6 = v38;
    id v40 = v33;
    id v41 = v31;
    [v32 enumerateKeysAndObjectsUsingBlock:v39];
  }
  objc_msgSend(v27, "managerDidFinishScan:bytesUsed:", v28, v25, v36);

  BOOL v34 = 1;
LABEL_19:

  return v34;
}

- (BOOL)_runWithError:(id *)a3
{
  if (!-[MBCKSizingEngine setUpWithError:](self, "setUpWithError:")
    || ![(MBCKSizingEngine *)self findChangesWithError:a3])
  {
    return 0;
  }
  BOOL v5 = 1;
  [(MBCKEngine *)self setIsFinished:1];
  id v6 = [(MBCKEngine *)self progressModel];
  [v6 ended];

  return v5;
}

- (id)_bundleIDForDomainName:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v5 = [(MBCKSizingEngine *)self domainNamesByBundleID];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [(MBCKSizingEngine *)self domainNamesByBundleID];
        id v12 = [v11 objectForKeyedSubscript:v10];
        unsigned __int8 v13 = [v12 containsObject:v4];

        if (v13)
        {
          id v14 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)setUpWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBCKSizingEngine setUpWithError:]", "MBCKSizingEngine.m", 151, "error");
  }
  v36.receiver = self;
  v36.super_class = (Class)MBCKSizingEngine;
  if (!-[MBCKEngine setUpWithError:](&v36, "setUpWithError:")) {
    return 0;
  }
  uint64_t v5 = [(MBCKEngine *)self serviceManager];
  if (!v5) {
    __assert_rtn("-[MBCKSizingEngine setUpWithError:]", "MBCKSizingEngine.m", 155, "manager");
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(MBCKEngine *)self serviceAccount];
  if (!v7) {
    __assert_rtn("-[MBCKSizingEngine setUpWithError:]", "MBCKSizingEngine.m", 157, "account");
  }
  uint64_t v8 = (void *)v7;
  id v9 = [(MBEngine *)self domainManager];

  if (v9)
  {
    id v10 = +[MBCKOperationPolicy expensiveCellularPolicy];
    [v10 setFetchAssets:0];
    uint64_t v11 = [v6 databaseManager];
    id v12 = +[MBCKOperationTracker operationTrackerWithAccount:v8 databaseManager:v11 policy:v10 error:a3];

    if (v12)
    {
      unsigned __int8 v13 = [v10 operationGroupWithName:@"SizingEngine"];
      [v12 setCkOperationGroup:v13];

      id v14 = MBDeviceUUID();
      id v35 = 0;
      v15 = +[MBCKAccount fetchDeviceRecordAndSnapshots:v14 account:v8 manager:v6 tracker:v12 error:&v35];
      id v16 = v35;

      if (v15
        || (+[MBError isError:v16 withCode:204] & 1) != 0)
      {
        [(MBCKEngine *)self setDevice:v15];
        long long v17 = [v15 snapshots];
        id v18 = [v17 count];

        id v33 = v16;
        BOOL v34 = v15;
        if (v18)
        {
          long long v19 = [v15 snapshots];
          uint64_t v20 = [v19 lastObject];
          id v21 = [v20 snapshotFormat];

          self->_formatOfLastCommittedSnapshot = (int64_t)v21;
          uint64_t v22 = MBGetDefaultLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = MBStringForSnapshotFormat();
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "=sizing= Format of last committed snapshot: %@", (uint8_t *)&buf, 0xCu);

            v32 = MBStringForSnapshotFormat();
            _MBLog();
          }
        }
        else
        {
          self->_formatOfLastCommittedSnapshot = 0;
        }
        v26 = [(MBCKEngine *)self context];
        id v27 = [v26 plugins];
        id v28 = [v27 objectEnumerator];
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v38 = sub_10015C540;
        v39 = &unk_100414A08;
        id v40 = self;
        id v41 = "startingBackupWithEngine:";
        v29 = MBNotifyPluginsBlock(self, v28, "startingBackupWithEngine:", (uint64_t)&buf);

        BOOL v24 = v29 == 0;
        id v16 = v33;
        v15 = v34;
        if (v29)
        {
          id v30 = MBGetDefaultLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v29;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "=sizing= Failed to notify plugins of startingBackupWithEngine: %@", (uint8_t *)&buf, 0xCu);
            _MBLog();
          }

          *a3 = v29;
        }
      }
      else
      {
        BOOL v24 = 0;
        *a3 = v16;
      }
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    int64_t v25 = MBGetDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "=sizing= nil domain manager", (uint8_t *)&buf, 2u);
      _MBLog();
    }

    +[MBError errorWithCode:1 format:@"nil domain manager"];
    BOOL v24 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (BOOL)findChangesWithError:(id *)a3
{
  appManager = self->super.super._appManager;
  id v6 = [(MBCKEngine *)self persona];
  LODWORD(appManager) = [(MBAppManager *)appManager loadAppsWithPersona:v6 safeHarbors:0 error:a3];

  BOOL v7 = 0;
  if (appManager)
  {
    if (self->_bundleIDsToScan)
    {
      uint64_t v8 = [(MBCKSizingEngine *)self bundleIDsToScan];
      unsigned __int8 v9 = [(MBCKSizingEngine *)self _findChangesForBundleIDs:v8 error:a3];
    }
    else
    {
      uint64_t v8 = [(MBCKSizingEngine *)self _findDomainsLimitedTo:0 error:a3];
      if (!v8)
      {
        BOOL v7 = 0;
        goto LABEL_7;
      }
      unsigned __int8 v9 = [(MBCKSizingEngine *)self _findChangesForDomains:v8 error:a3];
    }
    BOOL v7 = v9;
LABEL_7:
  }
  return v7;
}

- (BOOL)_findChangesForBundleIDs:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v38 = objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v6 = [(MBEngine *)self appManager];
  BOOL v7 = [v6 allApps];

  id obj = v7;
  id v8 = [v7 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v48;
    uint64_t v37 = *(void *)v48;
    do
    {
      uint64_t v11 = 0;
      id v39 = v9;
      do
      {
        if (*(void *)v48 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v11);
        unsigned __int8 v13 = [v12 bundleID];
        unsigned int v14 = [v5 containsObject:v13];

        if (v14)
        {
          id v15 = v5;
          id v16 = objc_opt_new();
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v17 = objc_opt_class();
          id v18 = self;
          long long v19 = [(MBCKEngine *)self persona];
          uint64_t v20 = [v17 domainsForApp:v12 persona:v19];

          id v21 = [v20 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v44;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v44 != v23) {
                  objc_enumerationMutation(v20);
                }
                int64_t v25 = [*(id *)(*((void *)&v43 + 1) + 8 * i) name];
                [v16 addObject:v25];
              }
              id v22 = [v20 countByEnumeratingWithState:&v43 objects:v51 count:16];
            }
            while (v22);
          }

          [v38 unionSet:v16];
          self = v18;
          domainNamesByBundleID = v18->_domainNamesByBundleID;
          id v27 = [v12 bundleID];
          [(NSMutableDictionary *)domainNamesByBundleID setObject:v16 forKeyedSubscript:v27];

          id v5 = v15;
          uint64_t v10 = v37;
          id v9 = v39;
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v9);
  }

  id v28 = [(MBCKSizingEngine *)self _findDomainsLimitedTo:v38 error:a4];
  if (v28 && [(MBCKSizingEngine *)self _findChangesForDomains:v28 error:a4])
  {
    v29 = objc_opt_new();
    id v30 = self->_domainNamesByBundleID;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1001431CC;
    v41[3] = &unk_100414658;
    v41[4] = self;
    id v42 = v29;
    id v31 = v29;
    [(NSMutableDictionary *)v30 enumerateKeysAndObjectsUsingBlock:v41];
    v32 = (NSDictionary *)[v31 copy];
    modifiedBytesByBundleID = self->_modifiedBytesByBundleID;
    self->_modifiedBytesByBundleID = v32;

    BOOL v34 = 1;
  }
  else
  {
    BOOL v34 = 0;
  }

  return v34;
}

- (id)_findDomainsLimitedTo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(MBCKEngine *)self serviceManager];
  BOOL v7 = [(MBEngine *)self domainManager];
  id v8 = [(MBEngine *)self appManager];
  id v9 = [(MBCKEngine *)self serviceAccount];
  [v7 addDomainsToBackUpToiCloudWithAppManager:v8 manager:v6 account:v9];

  uint64_t v10 = [(MBDomainManager *)self->super.super._domainManager allDomains];
  uint64_t v11 = [v10 sortedArrayUsingComparator:&stru_100414678];

  id v12 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v19 = objc_msgSend(v18, "name", (void)v21);
        if (!v5 || [v5 containsObject:v19]) {
          [v12 addObject:v18];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  return v12;
}

- (BOOL)_findChangesForDomains:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(MBCKEngine *)self handleCancelation:a4])
  {
    self->_int64_t modifiedBytes = 0;
    self->_int64_t totalBytesOnDisk = 0;
    id v8 = (NSMutableDictionary *)objc_opt_new();
    modifiedBytesByDomainName = self->_modifiedBytesByDomainName;
    self->_modifiedBytesByDomainName = v8;

    uint64_t v10 = (NSMutableDictionary *)objc_opt_new();
    totalBytesOnDiskByDomainName = self->_totalBytesOnDiskByDomainName;
    self->_totalBytesOnDiskByDomainName = v10;

    id v12 = (NSMutableDictionary *)objc_opt_new();
    domainNamesByBundleID = self->_domainNamesByBundleID;
    self->_domainNamesByBundleID = v12;

    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      v62 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "=sizing= Scanning domains: %@", buf, 0xCu);
      long long v43 = v6;
      _MBLog();
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v15 = v6;
    id v16 = [v15 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v56;
LABEL_7:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v56 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = -[MBFileScanner scanDomain:snapshotMountPoint:](self->_scanner, "scanDomain:snapshotMountPoint:", *(void *)(*((void *)&v55 + 1) + 8 * v19), 0, v43);
        if (v20) {
          break;
        }
        if (v17 == (id)++v19)
        {
          id v17 = [v15 countByEnumeratingWithState:&v55 objects:v60 count:16];
          if (v17) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      long long v24 = v20;
      v32 = MBGetDefaultLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v62 = v24;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "=sizing= Failed to scan for changes: %@", buf, 0xCu);
        _MBLog();
      }

      if (a4)
      {
        id v33 = v24;
        goto LABEL_31;
      }
LABEL_42:
      BOOL v7 = 0;
LABEL_43:

      goto LABEL_44;
    }
LABEL_13:

    long long v21 = [(MBCKEngine *)self device];
    id v15 = v21;
    if (v21 && self->_formatOfLastCommittedSnapshot == 3)
    {
      long long v22 = [v21 snapshots];
      id v54 = 0;
      uint64_t v23 = MBGetAllDomainQuotasByDomainHMAC(v22, &v54);
      long long v24 = v54;

      if (!v23
        && (+[MBError isError:v24 withCode:4] & 1) == 0)
      {
        if (a4)
        {
          id v33 = v24;
          long long v24 = v33;
LABEL_31:
          BOOL v7 = 0;
          *a4 = v33;
          goto LABEL_43;
        }
        goto LABEL_42;
      }
      long long v45 = (void *)v23;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      int64_t v25 = [v15 snapshots];
      id v26 = [v25 countByEnumeratingWithState:&v50 objects:v59 count:16];
      if (v26)
      {
        id v27 = v26;
        int64_t v28 = 0;
        uint64_t v29 = *(void *)v51;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v51 != v29) {
              objc_enumerationMutation(v25);
            }
            id v31 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            if ([v31 snapshotFormat] == (id)3) {
              v28 += (int64_t)[v31 quotaUsed];
            }
          }
          id v27 = [v25 countByEnumeratingWithState:&v50 objects:v59 count:16];
        }
        while (v27);
      }
      else
      {
        int64_t v28 = 0;
      }

      int64_t totalBytesOnDisk = self->_totalBytesOnDisk;
      BOOL v35 = totalBytesOnDisk <= v28;
      int64_t v36 = totalBytesOnDisk - v28;
      if (v35) {
        int64_t v36 = 0;
      }
      self->_int64_t modifiedBytes = v36;
      uint64_t v37 = [v15 hmacKey];
      v38 = self->_totalBytesOnDiskByDomainName;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100143B50;
      v46[3] = &unk_100414608;
      id v47 = v37;
      id v48 = v45;
      long long v49 = self;
      id v39 = v45;
      id v40 = v37;
      [(NSMutableDictionary *)v38 enumerateKeysAndObjectsUsingBlock:v46];
    }
    long long v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = [(MBFileScanner *)self->_scanner loggableStats];
      *(_DWORD *)long long buf = 138412290;
      v62 = v41;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "=sizing= Finished scanning for changes - %@", buf, 0xCu);

      long long v44 = [(MBFileScanner *)self->_scanner loggableStats];
      _MBLog();
    }
    BOOL v7 = 1;
    goto LABEL_43;
  }
  BOOL v7 = 0;
LABEL_44:

  return v7;
}

+ (id)domainsForApp:(id)a3 persona:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = [v5 containers];
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v15 = [v13 domain];
        [v7 addObject:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v10);
  }

  if (([v5 isSystemApp] & 1) == 0)
  {
    id v16 = [v6 personaIdentifier];
    id v17 = [v6 appPlaceholderArchiveDirectory];
    id v24 = 0;
    uint64_t v18 = [v5 archivePlaceholderDomainWithPersonaIdentifier:v16 intoDirectory:v17 error:&v24];
    id v19 = v24;

    if (v18)
    {
      [v7 addObject:v18];
    }
    else
    {
      uint64_t v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        long long v21 = [v5 bundleID];
        *(_DWORD *)long long buf = 138412546;
        id v30 = v21;
        __int16 v31 = 2112;
        id v32 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "=sizing= Failed to fetch placeholder for %@: %@", buf, 0x16u);

        uint64_t v23 = [v5 bundleID];
        _MBLog();
      }
    }
  }
  return v7;
}

- (BOOL)fileScanner:(id)a3 isFileAddedOrModified:(id)a4
{
  return 1;
}

- (id)fileScanner:(id)a3 didFindFile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v34 = 0;
  unsigned __int8 v8 = [(MBCKEngine *)self handleCancelation:&v34];
  id v9 = v34;
  if ((v8 & 1) == 0)
  {
    id v10 = [v7 domain];
    if (!v10) {
      __assert_rtn("-[MBCKSizingEngine fileScanner:didFindFile:]", "MBCKSizingEngine.m", 362, "file.domain");
    }

    uint64_t v11 = [v7 domain];
    id v12 = [v11 name];

    id v33 = [v7 size];
    if (self->_formatOfLastCommittedSnapshot != 3)
    {
      id v14 = [(MBCKEngine *)self cache];
      id v15 = +[MBCKFile fileWithMBFile:v7 cache:v14];

      if ((char *)[v15 changeType] - 1 <= (char *)1)
      {
        self->_modifiedBytes += (int64_t)v33;
        modifiedBytesByDomainName = self->_modifiedBytesByDomainName;
        [v7 domain];
        id v17 = v32 = v13;
        uint64_t v18 = [v17 name];
        id v19 = [(NSMutableDictionary *)modifiedBytesByDomainName objectForKeyedSubscript:v18];
        id v20 = [v19 unsignedLongLongValue];

        id v13 = v32;
        long long v21 = +[NSNumber numberWithLongLong:(char *)v33 + (void)v20];
        long long v22 = self->_modifiedBytesByDomainName;
        uint64_t v23 = [v15 domainName];
        [(NSMutableDictionary *)v22 setObject:v21 forKeyedSubscript:v23];

        if (self->_bundleIDsToScan)
        {
          id v24 = [(NSMutableDictionary *)self->_pathsByDomainName objectForKeyedSubscript:v12];
          if (!v24) {
            id v24 = objc_opt_new();
          }
          long long v25 = [v15 absolutePath];
          [v24 addObject:v25];

          pathsByDomainName = self->_pathsByDomainName;
          long long v27 = [v15 domainName];
          [(NSMutableDictionary *)pathsByDomainName setObject:v24 forKeyedSubscript:v27];
        }
      }
    }
    long long v28 = [(NSMutableDictionary *)self->_totalBytesOnDiskByDomainName objectForKeyedSubscript:v12];
    id v29 = [v28 unsignedLongLongValue];

    id v30 = +[NSNumber numberWithLongLong:(char *)v33 + (void)v29];
    [(NSMutableDictionary *)self->_totalBytesOnDiskByDomainName setObject:v30 forKeyedSubscript:v12];

    self->_totalBytesOnDisk += (int64_t)[v7 size];
  }
  return v9;
}

- (int64_t)modifiedBytes
{
  return self->_modifiedBytes;
}

- (void)setModifiedBytes:(int64_t)a3
{
  self->_int64_t modifiedBytes = a3;
}

- (int64_t)formatOfLastCommittedSnapshot
{
  return self->_formatOfLastCommittedSnapshot;
}

- (void)setFormatOfLastCommittedSnapshot:(int64_t)a3
{
  self->_formatOfLastCommittedSnapshot = a3;
}

- (unint64_t)engineState
{
  return self->_engineState;
}

- (void)setEngineState:(unint64_t)a3
{
  self->_engineState = a3;
}

- (int64_t)totalBytesOnDisk
{
  return self->_totalBytesOnDisk;
}

- (void)setTotalBytesOnDisk:(int64_t)a3
{
  self->_int64_t totalBytesOnDisk = a3;
}

- (NSMutableDictionary)totalBytesOnDiskByDomainName
{
  return self->_totalBytesOnDiskByDomainName;
}

- (NSMutableDictionary)modifiedBytesByDomainName
{
  return self->_modifiedBytesByDomainName;
}

- (NSDictionary)modifiedBytesByBundleID
{
  return self->_modifiedBytesByBundleID;
}

- (void)setModifiedBytesByBundleID:(id)a3
{
}

- (NSMutableDictionary)domainNamesByBundleID
{
  return self->_domainNamesByBundleID;
}

- (NSSet)bundleIDsToScan
{
  return self->_bundleIDsToScan;
}

- (NSMutableDictionary)pathsByDomainName
{
  return self->_pathsByDomainName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathsByDomainName, 0);
  objc_storeStrong((id *)&self->_bundleIDsToScan, 0);
  objc_storeStrong((id *)&self->_domainNamesByBundleID, 0);
  objc_storeStrong((id *)&self->_modifiedBytesByBundleID, 0);
  objc_storeStrong((id *)&self->_modifiedBytesByDomainName, 0);
  objc_storeStrong((id *)&self->_totalBytesOnDiskByDomainName, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
}

@end