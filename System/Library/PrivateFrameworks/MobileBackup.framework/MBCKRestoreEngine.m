@interface MBCKRestoreEngine
+ (int64_t)_fetchBackupPolicyWithDevice:(id)a3 snapshotUUID:(id)a4 error:(id *)a5;
- ($1C6001547D93A6C6CE4901F2C331F3E5)networkConnectivityAtFinish;
- ($1C6001547D93A6C6CE4901F2C331F3E5)networkConnectivityAtStart;
- (BOOL)_configureAndInstallPlaceholdersWithError:(id *)a3;
- (BOOL)_downloadRestorablesForBackgroundAppWithError:(id *)a3;
- (BOOL)_downloadRestorablesForBackgroundFilesWithError:(id *)a3;
- (BOOL)_downloadRestorablesForForegroundWithError:(id *)a3;
- (BOOL)_markForegroundRestorablesForBackgroundRestoreInPlan:(id)a3 domainName:(id)a4 error:(id *)a5;
- (BOOL)_restoreATCFiles:(id)a3 usingCKCache:(id *)a4;
- (BOOL)_restoreATCFiles:(id)a3 usingPlan:(id *)a4;
- (BOOL)_restoreBackgroundContainersUsingCKCacheForApp:(id)a3 error:(id *)a4;
- (BOOL)_restoreBackgroundContainersUsingPlanForApp:(id)a3 error:(id *)a4;
- (BOOL)_restoreDomains:(id)a3 plan:(id)a4 withQueue:(id)a5 concurrencyLimit:(unint64_t)a6 error:(id *)a7;
- (BOOL)_restoreEntitlements:(id)a3 withError:(id *)a4;
- (BOOL)_restoreForegroundFilesUsingCKCacheForDomainNames:(id)a3 error:(id *)a4;
- (BOOL)_restoreForegroundFilesUsingPlanForDomainNames:(id)a3 error:(id *)a4;
- (BOOL)_shouldSimulateCancelationForState:(id)a3;
- (BOOL)_uninstallExistingAppWithBundleID:(id)a3 error:(id *)a4;
- (BOOL)annotateRestoreWithError:(id *)a3;
- (BOOL)cancelWithError:(id)a3;
- (BOOL)downloadRestorablesWithError:(id *)a3;
- (BOOL)finalizeRestoreWithError:(id *)a3;
- (BOOL)findRestorablesWithError:(id *)a3;
- (BOOL)foregroundRestoreVerificationEnabled;
- (BOOL)isRestoringToSameDevice;
- (BOOL)refreshCacheWithError:(id *)a3;
- (BOOL)restoreEntitlementsWithError:(id *)a3;
- (BOOL)runWithError:(id *)a3;
- (BOOL)setUpWithError:(id *)a3;
- (BOOL)shouldCancelVerification;
- (BOOL)synchronizeFileListsWithError:(id *)a3;
- (BOOL)useFileLists;
- (BOOL)verifyRestoreWithError:(id *)a3;
- (MBCKEncryptionManager)encryptionManager;
- (MBCKRestoreEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4;
- (MBCKRestoreEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4 domainManager:(id)a5 serviceManager:(id)a6 excludedAppBundleIDs:(id)a7;
- (MBCKSnapshot)targetSnapshot;
- (MBDurationEstimation)estimator;
- (MBRestoreOperationLogger)restoreLogger;
- (MBRestorePolicy)restorePolicy;
- (NSArray)cacheDeleteRequests;
- (NSDate)startDate;
- (NSDictionary)cloudFormatInfo;
- (NSDictionary)storedKeybagsByUUIDString;
- (NSNumber)backgroundRestorableFileCount;
- (NSNumber)backgroundRestorableSize;
- (NSNumber)foregroundRestorableDomainCount;
- (NSNumber)foregroundRestorableFileCount;
- (NSNumber)foregroundRestorableSize;
- (NSNumber)freeDiskSpace;
- (NSNumber)minutesRemaining;
- (NSSet)excludedAppBundleIDs;
- (NSString)foregroundRestoreVerificationStatus;
- (NSString)restoreStateDescription;
- (id)_fetchDomainNamesToForegroundRestoreWithError:(id *)a3;
- (id)_populatedRestorePlan;
- (id)_restoreATCEngineForPlan:(id)a3 error:(id *)a4;
- (id)_restoreDomainEngineForDomain:(id)a3 plan:(id)a4 error:(id *)a5;
- (id)domainForName:(id)a3 containerID:(id)a4 domainManager:(id)a5;
- (id)engineModeString;
- (id)getEntitlementsForDomainsWithError:(id *)a3;
- (id)keyBagForUUID:(id)a3;
- (id)powerAssertionName;
- (id)restoreMode;
- (id)restoringBundleID;
- (id)secretForUUID:(id)a3;
- (int)allowedCellularCost;
- (int)engineMode;
- (int)restoreType;
- (unint64_t)chargingType;
- (unint64_t)restoreState;
- (void)_finishCollectingTelemetry;
- (void)_handleStateTransition;
- (void)_purgeBeforeRestoring:(unint64_t)a3;
- (void)cleanUpAfterError:(id)a3;
- (void)makeStateTransition;
- (void)reportRestoreStatusForState:(unint64_t)a3 start:(id)a4 end:(id)a5;
- (void)resetRestorePolicy;
- (void)sendEngineCompletionTelemetry:(id)a3 duration:(double)a4 peakMemoryUsage:(unint64_t)a5;
- (void)setAllowedCellularCost:(int)a3;
- (void)setBackgroundRestorableFileCount:(id)a3;
- (void)setBackgroundRestorableSize:(id)a3;
- (void)setCacheDeleteRequests:(id)a3;
- (void)setChargingType:(unint64_t)a3;
- (void)setCloudFormatInfo:(id)a3;
- (void)setEncryptionManager:(id)a3;
- (void)setEstimator:(id)a3;
- (void)setExcludedAppBundleIDs:(id)a3;
- (void)setForegroundRestorableDomainCount:(id)a3;
- (void)setForegroundRestorableFileCount:(id)a3;
- (void)setForegroundRestorableSize:(id)a3;
- (void)setForegroundRestoreVerificationEnabled:(BOOL)a3;
- (void)setForegroundRestoreVerificationStatus:(id)a3;
- (void)setFreeDiskSpace:(id)a3;
- (void)setMinutesRemaining:(id)a3;
- (void)setNetworkConnectivityAtFinish:(id)a3;
- (void)setNetworkConnectivityAtStart:(id)a3;
- (void)setRestoreLogger:(id)a3;
- (void)setRestoreState:(unint64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setStoredKeybagsByUUIDString:(id)a3;
- (void)setTargetSnapshot:(id)a3;
- (void)setUseFileLists:(BOOL)a3;
@end

@implementation MBCKRestoreEngine

- (id)restoringBundleID
{
  v2 = [(MBCKRestoreEngine *)self restorePolicy];
  v3 = [v2 serviceRestoreMode];

  if ([v3 isBackgroundApp])
  {
    v4 = [v3 bundleID];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (MBCKRestoreEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4 domainManager:(id)a5 serviceManager:(id)a6 excludedAppBundleIDs:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v12 account];
  if (!v17) {
    __assert_rtn("-[MBCKRestoreEngine initWithSettingsContext:debugContext:domainManager:serviceManager:excludedAppBundleIDs:]", "MBCKRestoreEngine.m", 99, "account");
  }
  v18 = (void *)v17;
  if (!v14)
  {
    id v19 = objc_alloc((Class)MBDomainManager);
    v20 = [v18 persona];
    id v14 = [v19 initWithPersona:v20];
  }
  v28.receiver = self;
  v28.super_class = (Class)MBCKRestoreEngine;
  v21 = [(MBCKEngine *)&v28 initWithSettingsContext:v12 debugContext:v13 domainManager:v14];
  v22 = v21;
  if (v21)
  {
    [(MBCKRestoreEngine *)v21 setRestoreState:1];
    [(MBCKEngine *)v22 setServiceManager:v15];
    v23 = [v12 restoreMode];
    v22->_restoreType = [v23 type];

    uint64_t v24 = +[NSDate date];
    startDate = v22->_startDate;
    v22->_startDate = (NSDate *)v24;

    [(MBEngine *)v22 setEncrypted:1];
    v26 = objc_opt_new();
    [(MBCKRestoreEngine *)v22 setEstimator:v26];

    [(MBCKRestoreEngine *)v22 setExcludedAppBundleIDs:v16];
    v22->_allowedCellularCost = 0;
    [v14 setDelegate:v22];
  }

  return v22;
}

- (MBCKRestoreEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4
{
  return [(MBCKRestoreEngine *)self initWithSettingsContext:a3 debugContext:a4 domainManager:0 serviceManager:0 excludedAppBundleIDs:0];
}

- (NSString)restoreStateDescription
{
  uint64_t v2 = [(MBCKRestoreEngine *)self restoreState];
  return (NSString *)MBCKStringForRestoreState(v2);
}

- (int)engineMode
{
  return 2;
}

- (id)powerAssertionName
{
  return @"restore";
}

- (int)restoreType
{
  if (self->_restorePolicy)
  {
    restorePolicy = self->_restorePolicy;
    return [(MBRestorePolicy *)restorePolicy restoreType];
  }
  else
  {
    v4 = [(MBCKEngine *)self context];
    v5 = [v4 restoreMode];
    if ([v5 isForeground]) {
      int v6 = 1;
    }
    else {
      int v6 = 2;
    }

    return v6;
  }
}

- (id)restoreMode
{
  if (self->_restorePolicy)
  {
    uint64_t v2 = [(MBRestorePolicy *)self->_restorePolicy serviceRestoreMode];
  }
  else
  {
    v3 = [(MBCKEngine *)self context];
    uint64_t v2 = [v3 restoreMode];
  }
  return v2;
}

- (MBRestorePolicy)restorePolicy
{
  restorePolicy = self->_restorePolicy;
  if (!restorePolicy) {
    __assert_rtn("-[MBCKRestoreEngine restorePolicy]", "MBCKRestoreEngine.m", 160, "_restorePolicy");
  }
  return restorePolicy;
}

- (void)resetRestorePolicy
{
  id v16 = [MBRestorePolicy alloc];
  id v17 = [(MBCKEngine *)self persona];
  id v15 = [(MBEngine *)self appManager];
  v3 = [(MBCKEngine *)self context];
  v4 = [v3 plugins];
  v5 = [(MBCKEngine *)self context];
  int v6 = [v5 restoreMode];
  v7 = [(MBCKEngine *)self properties];
  v8 = [v7 buildVersion];
  v9 = [(MBEngine *)self settingsContext];
  unsigned __int8 v10 = [v9 shouldRestoreSystemFiles];
  unsigned __int8 v11 = [(MBCKEngine *)self restoresPrimaryAccount];
  BYTE2(v14) = [(MBEngine *)self isForegroundRestore];
  BYTE1(v14) = v11;
  LOBYTE(v14) = v10;
  id v12 = -[MBRestorePolicy initWithPersona:enginePolicyProvider:appManager:plugins:serviceRestoreMode:osBuildVersionOfBackup:shouldRestoreSystemFiles:isRestoringPrimaryAccount:shouldCreateMissingIntermediateDirectories:](v16, "initWithPersona:enginePolicyProvider:appManager:plugins:serviceRestoreMode:osBuildVersionOfBackup:shouldRestoreSystemFiles:isRestoringPrimaryAccount:shouldCreateMissingIntermediateDirectories:", v17, self, v15, v4, v6, v8, v14);
  restorePolicy = self->_restorePolicy;
  self->_restorePolicy = v12;
}

- (id)keyBagForUUID:(id)a3
{
  v4 = [a3 base64EncodedStringWithOptions:0];
  v5 = [(MBCKEngine *)self device];
  int v6 = [v5 keybagManager];
  v7 = [v6 keybagWithUUID:v4];

  v8 = [v7 keybag];

  return v8;
}

- (id)secretForUUID:(id)a3
{
  v4 = [a3 base64EncodedStringWithOptions:0];
  v5 = [(MBCKEngine *)self device];
  int v6 = [v5 keybagManager];
  v7 = [v6 keybagWithUUID:v4];

  v8 = [v7 secret];

  return v8;
}

- (BOOL)isRestoringToSameDevice
{
  uint64_t v2 = [(MBCKEngine *)self context];
  v3 = [v2 backupUDID];
  v4 = MBDeviceUUID();
  unsigned __int8 v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)cleanUpAfterError:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MBCKEngine *)self ckOperationTracker];
  int v6 = [v5 databaseManager];
  v7 = [(MBCKEngine *)self ckOperationTracker];
  v8 = [v7 account];
  [v6 setShouldSupportBudgeting:0 account:v8];

  v9.receiver = self;
  v9.super_class = (Class)MBCKRestoreEngine;
  [(MBCKEngine *)&v9 cleanUpAfterError:v4];
}

- (BOOL)runWithError:(id *)a3
{
  [(MBCKRestoreEngine *)self setChargingType:MBGetChargingType()];
  id v61 = 0;
  unsigned __int8 v5 = [(MBCKRestoreEngine *)self setUpWithError:&v61];
  id v6 = v61;
  if (v5)
  {
LABEL_4:

    if ([(MBCKRestoreEngine *)self useFileLists])
    {
      if ([(MBEngine *)self isForegroundRestore])
      {
        unsigned __int8 v10 = self;
        uint64_t v11 = 1;
      }
      else
      {
        unsigned __int8 v10 = self;
        uint64_t v11 = 3;
      }
      [(MBCKRestoreEngine *)v10 setRestoreState:v11];
    }
    else
    {
      id v12 = [(MBCKEngine *)self cache];
      id v13 = [(MBCKEngine *)self context];
      uint64_t v14 = [v13 backupUDID];
      id v15 = [(MBCKEngine *)self context];
      id v16 = [v15 snapshotUUID];
      id v60 = 0;
      id v17 = [v12 fetchRestoreStateForDeviceUUID:v14 snapshotUUID:v16 error:&v60];
      id v18 = v60;
      [(MBCKRestoreEngine *)self setRestoreState:v17];

      if (v18)
      {
        id v19 = MBGetDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = [(MBCKEngine *)self context];
          v21 = [v20 backupUDID];
          v22 = [(MBCKEngine *)self context];
          v23 = [v22 snapshotUUID];
          *(_DWORD *)buf = 138412802;
          *(void *)v63 = v21;
          *(_WORD *)&v63[8] = 2112;
          *(void *)&v63[10] = v23;
          *(_WORD *)&v63[18] = 2112;
          *(void *)&v63[20] = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Error getting restore state for deviceUUID %@ and snapshotUUID %@: %@", buf, 0x20u);

          uint64_t v24 = [(MBCKEngine *)self context];
          v25 = [v24 backupUDID];
          v26 = [(MBCKEngine *)self context];
          v56 = [v26 snapshotUUID];
          id v59 = v18;
          v54 = v25;
          _MBLog();
        }
        [(MBCKRestoreEngine *)self setRestoreState:1];
      }
      if ([(MBCKRestoreEngine *)self restoreState] >= 4) {
        [(MBCKRestoreEngine *)self setRestoreState:3];
      }
    }
    id v6 = [(MBCKRestoreEngine *)self restoreMode];
    v29 = [(MBCKEngine *)self ckOperationPolicy];
    v30 = [v29 cellularAccess];

    v31 = [(MBCKEngine *)self serviceAccount];
    if ([v6 isBackgroundApp])
    {
      v32 = [v6 bundleID];
      v33 = MBGetDefaultLog();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
LABEL_27:

        if ([(MBEngine *)self isForegroundRestore])
        {
          v39 = [(MBCKRestoreEngine *)self restoreLogger];
          [v39 logForegroundRestoreStart];
        }
        [(MBCKRestoreEngine *)self makeStateTransition];
        if ([(MBEngine *)self isForegroundRestore])
        {
          v40 = [(MBCKRestoreEngine *)self restoreLogger];
          [v40 logForegroundRestoreFinished];

          v41 = [(MBCKRestoreEngine *)self restoreLogger];
          [v41 flush];
        }
        unsigned int v42 = [(MBCKEngine *)self hasError];
        if (v42)
        {
          v43 = [(MBCKEngine *)self engineError];
          v44 = v43;
          if (a3) {
            *a3 = v43;
          }
          if ([(MBEngine *)self isForegroundRestore])
          {
            if (!+[MBError isRetryableRestoreError:v44])
            {
              v45 = [(MBCKRestoreEngine *)self _populatedRestorePlan];

              if (v45)
              {
                v46 = MBGetDefaultLog();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)v63 = v31;
                  *(_WORD *)&v63[8] = 2112;
                  *(void *)&v63[10] = v44;
                  _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Lightrail restore failed for account %@: %@", buf, 0x16u);
                  v55 = v31;
                  v57 = v44;
                  _MBLog();
                }

                v47 = [(MBCKEngine *)self persona];
                +[MBRestoreCloudFormatPolicy recordLightrailForegroundRestoreFailed:v47];
              }
            }
          }
          unsigned int v48 = objc_msgSend(v6, "isBackgroundApp", v55, v57);
          v49 = MBGetDefaultLog();
          BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
          if (v48)
          {
            if (v50)
            {
              v51 = [v31 accountIdentifier];
              *(_DWORD *)buf = 138543874;
              *(void *)v63 = v32;
              *(_WORD *)&v63[8] = 2112;
              *(void *)&v63[10] = v51;
              *(_WORD *)&v63[18] = 2112;
              *(void *)&v63[20] = v44;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Restore failed for %{public}@ account %@: %@", buf, 0x20u);

              v58 = [v31 accountIdentifier];
              _MBLog();
            }
          }
          else if (v50)
          {
            *(_DWORD *)buf = 138412546;
            *(void *)v63 = v31;
            *(_WORD *)&v63[8] = 2112;
            *(void *)&v63[10] = v44;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Restore failed for account %@: %@", buf, 0x16u);
            _MBLog();
          }

          if (+[MBError shouldReportLowDiskSpaceForError:v44])
          {
            v52 = +[NSNumber numberWithUnsignedLongLong:MBFreeDiskSpace()];
            [(MBCKRestoreEngine *)self setFreeDiskSpace:v52];
          }
        }
        char v28 = v42 ^ 1;

        goto LABEL_49;
      }
      v34 = [v31 accountIdentifier];
      *(_DWORD *)buf = 138543874;
      *(void *)v63 = v32;
      *(_WORD *)&v63[8] = 2112;
      *(void *)&v63[10] = v34;
      *(_WORD *)&v63[18] = 2112;
      *(void *)&v63[20] = v30;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Starting restore for %{public}@ account %@ cellularAccess:%@", buf, 0x20u);

      v35 = [v31 accountIdentifier];
      v56 = v35;
      id v59 = v30;
      v54 = v32;
      _MBLog();
    }
    else
    {
      v33 = MBGetDefaultLog();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v32 = 0;
        goto LABEL_27;
      }
      int restoreType = self->_restoreType;
      v37 = [v31 accountIdentifier];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v63 = restoreType;
      *(_WORD *)&v63[4] = 2112;
      *(void *)&v63[6] = v37;
      *(_WORD *)&v63[14] = 2112;
      *(void *)&v63[16] = v30;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Starting restore (%d) account %@ cellularAccess:%@", buf, 0x1Cu);

      unint64_t v38 = self->_restoreType;
      v35 = [v31 accountIdentifier];
      v56 = v35;
      id v59 = v30;
      v54 = (void *)v38;
      _MBLog();
      v32 = 0;
    }

    goto LABEL_27;
  }
  while (1)
  {
    v7 = [(MBCKEngine *)self retryStrategy];
    unsigned __int8 v8 = [v7 shouldRetryAfterError:v6];

    if ((v8 & 1) == 0) {
      break;
    }

    id v61 = 0;
    unsigned int v9 = [(MBCKRestoreEngine *)self setUpWithError:&v61];
    id v6 = v61;
    if (v9) {
      goto LABEL_4;
    }
  }
  v27 = MBGetDefaultLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v63 = v6;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Restore failed to setup: %@", buf, 0xCu);
    _MBLog();
  }

  if (a3)
  {
    id v6 = v6;
    char v28 = 0;
    *a3 = v6;
  }
  else
  {
    char v28 = 0;
  }
LABEL_49:

  return v28;
}

- (void)_handleStateTransition
{
  v3 = +[NSDate date];
  switch([(MBCKRestoreEngine *)self restoreState])
  {
    case 1uLL:
      [(MBCKRestoreEngine *)self setRestoreState:2];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10006EBE4;
      v35[3] = &unk_100411478;
      v35[4] = self;
      id v4 = v35;
      goto LABEL_11;
    case 2uLL:
      [(MBCKRestoreEngine *)self setRestoreState:9];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10006EC50;
      v34[3] = &unk_100411478;
      v34[4] = self;
      id v4 = v34;
      goto LABEL_11;
    case 3uLL:
      [(MBCKRestoreEngine *)self setRestoreState:4];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10006ECC8;
      v32[3] = &unk_100411478;
      v32[4] = self;
      id v4 = v32;
      goto LABEL_11;
    case 4uLL:
      [(MBCKRestoreEngine *)self setRestoreState:5];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10006ED34;
      v31[3] = &unk_100411478;
      v31[4] = self;
      id v4 = v31;
      goto LABEL_11;
    case 5uLL:
      [(MBCKRestoreEngine *)self setRestoreState:6];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10006ED40;
      v30[3] = &unk_100411478;
      v30[4] = self;
      id v4 = v30;
      goto LABEL_11;
    case 6uLL:
      [(MBCKRestoreEngine *)self setRestoreState:7];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10006ED4C;
      v29[3] = &unk_100411478;
      v29[4] = self;
      id v4 = v29;
      goto LABEL_11;
    case 7uLL:
      [(MBCKRestoreEngine *)self setRestoreState:10];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10006ED58;
      v28[3] = &unk_100411478;
      v28[4] = self;
      id v4 = v28;
      goto LABEL_11;
    case 8uLL:
      [(MBCKEngine *)self setIsFinished:1];
      [(MBCKEngine *)self setEngineError:0];
      goto LABEL_12;
    case 9uLL:
      [(MBCKRestoreEngine *)self setRestoreState:3];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10006ECBC;
      v33[3] = &unk_100411478;
      v33[4] = self;
      id v4 = v33;
LABEL_11:
      [(MBCKEngine *)self performRetryablePhase:v4];
LABEL_12:
      LOBYTE(v5) = 0;
      goto LABEL_13;
    case 0xAuLL:
      [(MBCKRestoreEngine *)self setRestoreState:8];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10006ED64;
      v27[3] = &unk_100411478;
      v27[4] = self;
      [(MBCKEngine *)self performRetryablePhase:v27];
      unsigned int v5 = [(MBCKEngine *)self isFinished];
      if (v5)
      {
        v23 = [(MBCKEngine *)self engineError];
        if (!v23) {
          __assert_rtn("-[MBCKRestoreEngine _handleStateTransition]", "MBCKRestoreEngine.m", 373, "self.engineError != nil");
        }
      }
      else
      {
        [(MBCKEngine *)self setIsFinished:1];
        [(MBCKEngine *)self setEngineError:0];
        [(MBCKRestoreEngine *)self setEstimator:0];
        if (![(MBEngine *)self isForegroundRestore]) {
          goto LABEL_13;
        }
        v23 = MBGetDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Foreground restore finished successfully", buf, 2u);
          _MBLog();
        }
      }

LABEL_13:
      id v6 = MBCKStringForRestoreState([(MBCKRestoreEngine *)self restoreState]);
      if ([(MBCKRestoreEngine *)self _shouldSimulateCancelationForState:v6])
      {
        v7 = +[MBError errorWithCode:202, @"Restore canceled (simulated for %@)", v6 format];
        [(MBCKEngine *)self setEngineError:v7];

        [(MBCKEngine *)self setIsFinished:1];
      }
      unsigned __int8 v8 = +[NSDate date];
      if ([(MBEngine *)self isForegroundRestore])
      {
        unsigned int v9 = MBGetDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          [v8 timeIntervalSinceDate:v3];
          *(_DWORD *)buf = 138543618;
          v37 = v6;
          __int16 v38 = 2048;
          uint64_t v39 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= \"%{public}@\" done in %.3fs", buf, 0x16u);
          [v8 timeIntervalSinceDate:v3];
          uint64_t v26 = v11;
          uint64_t v24 = v6;
          _MBLog();
        }
      }
      [(MBCKRestoreEngine *)self reportRestoreStatusForState:[(MBCKRestoreEngine *)self restoreState] start:v3 end:v8];
      if ([(MBCKEngine *)self isFinished])
      {
        [(MBCKRestoreEngine *)self _finishCollectingTelemetry];
        id v12 = [(MBCKEngine *)self progressModel];
        [v12 ended];
      }
      if (![(MBCKRestoreEngine *)self useFileLists])
      {
        if (![(MBCKEngine *)self isFinished]
          || ((id)[(MBCKRestoreEngine *)self restoreState] != (id)8 ? (char v13 = 1) : (char v13 = v5),
              (v13 & 1) == 0))
        {
          uint64_t v14 = [(MBCKEngine *)self cache];
          unint64_t v15 = [(MBCKRestoreEngine *)self restoreState];
          id v16 = [(MBCKEngine *)self context];
          id v17 = [v16 backupUDID];
          id v18 = [(MBCKEngine *)self context];
          id v19 = [v18 snapshotUUID];
          v20 = [v14 setRestoreState:v15 forDeviceUUID:v17 snapshotUUID:v19];

          if (v20)
          {
            v21 = MBGetDefaultLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v20;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to set restore state in cache transaction: %@", buf, 0xCu);
              v25 = v20;
              _MBLog();
            }
          }
        }
        if ([(MBCKRestoreEngine *)self restoreState] <= 3)
        {
          v22 = [(MBCKEngine *)self cache];
          [v22 flush];
        }
      }

      return;
    default:
      __assert_rtn("-[MBCKRestoreEngine _handleStateTransition]", "MBCKRestoreEngine.m", 289, "0");
  }
}

- (BOOL)_shouldSimulateCancelationForState:(id)a3
{
  id v4 = a3;
  if (MBIsInternalInstall()
    && ![(MBCKEngine *)self isFinished]
    && [(MBEngine *)self isForegroundRestore])
  {
    unsigned int v5 = +[MBBehaviorOptions sharedOptions];
    id v6 = [v5 engineStateToCancelRestoreAfter];
    unsigned __int8 v7 = [v6 isEqualToString:v4];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)makeStateTransition
{
  [(MBCKRestoreEngine *)self _handleStateTransition];
  v4.receiver = self;
  v4.super_class = (Class)MBCKRestoreEngine;
  [(MBCKEngine *)&v4 makeStateTransition];
}

- (void)_finishCollectingTelemetry
{
  if (![(MBEngine *)self isBackgroundRestore])
  {
    v3 = [(MBCKRestoreEngine *)self estimator];
    [v3 progressAtLastUpdate];
    if (v4 > 0.0)
    {
      id v5 = [v3 minutesRemaining];
      if (v5 != (id)-1)
      {
        id v6 = +[NSNumber numberWithUnsignedInteger:v5];
        [(MBCKRestoreEngine *)self setMinutesRemaining:v6];
      }
    }
  }
  id v9 = [(MBCKEngine *)self serviceManager];
  id v7 = [v9 networkConnectivity];
  -[MBCKRestoreEngine setNetworkConnectivityAtFinish:](self, "setNetworkConnectivityAtFinish:", v7, v8);
}

- (void)reportRestoreStatusForState:(unint64_t)a3 start:(id)a4 end:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  +[MBCKStatusReporter reportRestoreStateChangeForEngine:self state:a3 start:v15 end:v8];
  +[MBCKTelemetry sendRestoreEngineStateChangeStatus:self state:[(MBCKRestoreEngine *)self restoreState] start:v15 end:v8];
  id v9 = [(MBCKEngine *)self performanceStatistics];

  if (v9)
  {
    id v10 = objc_alloc((Class)NSString);
    uint64_t v11 = MBCKStringForRestoreState(a3);
    id v12 = [v10 initWithFormat:@"state-%@", v11];

    [v8 timeIntervalSinceDate:v15];
    char v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    uint64_t v14 = [(MBCKEngine *)self performanceStatistics];
    [v14 setObject:v13 forKeyedSubscript:v12];
  }
}

- (void)sendEngineCompletionTelemetry:(id)a3 duration:(double)a4 peakMemoryUsage:(unint64_t)a5
{
  id v8 = a3;
  id v9 = v8;
  if (v8 || !self->_restoreType)
  {
    +[MBCKStatusRequest sendStatusRequestWithEngine:self duration:v8 error:a4];
    id v8 = v9;
  }
  +[MBCKTelemetry sendRestoreEngineCompletionStatus:self duration:a5 peakMemoryUsage:v8 error:a4];
}

- (BOOL)refreshCacheWithError:(id *)a3
{
  uint64_t v5 = [(MBCKRestoreEngine *)self targetSnapshot];
  if (!v5) {
    __assert_rtn("-[MBCKRestoreEngine refreshCacheWithError:]", "MBCKRestoreEngine.m", 478, "targetSnapshot");
  }
  id v6 = (void *)v5;
  if ([(MBCKRestoreEngine *)self useFileLists])
  {
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      [v6 snapshotFormat];
      id v8 = MBStringForSnapshotFormat();
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Skipping refreshCacheWithError when restoring from snapshot format %@", buf, 0xCu);

      [v6 snapshotFormat];
      uint64_t v11 = MBStringForSnapshotFormat();
      _MBLog();
    }
    BOOL v9 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MBCKRestoreEngine;
    BOOL v9 = [(MBCKEngine *)&v12 refreshCacheWithError:a3];
  }

  return v9;
}

+ (int64_t)_fetchBackupPolicyWithDevice:(id)a3 snapshotUUID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __assert_rtn("+[MBCKRestoreEngine _fetchBackupPolicyWithDevice:snapshotUUID:error:]", "MBCKRestoreEngine.m", 488, "device");
  }
  BOOL v9 = v8;
  if (!v8) {
    __assert_rtn("+[MBCKRestoreEngine _fetchBackupPolicyWithDevice:snapshotUUID:error:]", "MBCKRestoreEngine.m", 489, "snapshotUUID");
  }
  if (!a5) {
    __assert_rtn("+[MBCKRestoreEngine _fetchBackupPolicyWithDevice:snapshotUUID:error:]", "MBCKRestoreEngine.m", 490, "error");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = [v7 snapshots];
  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v24;
LABEL_6:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v24 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(void **)(*((void *)&v23 + 1) + 8 * v14);
      id v16 = [v15 snapshotID];
      unsigned __int8 v17 = [v16 isEqualToString:v9];

      if (v17) {
        break;
      }
      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v12) {
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }
    id v18 = v15;

    if (!v18) {
      goto LABEL_17;
    }
    id v19 = [v18 backupPolicy];
    v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      char v28 = v9;
      __int16 v29 = 2048;
      id v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "=ckrestore-engine= Found target snapshot %{public}@, backupPolicy:%ld", buf, 0x16u);
      _MBLog();
    }
  }
  else
  {
LABEL_12:

LABEL_17:
    v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      char v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to find target snapshot %{public}@", buf, 0xCu);
      _MBLog();
    }

    +[MBError errorWithCode:205, @"Failed to fetch the backup policy for target snapshot %@", v9 format];
    id v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (int64_t)v19;
}

- (BOOL)setUpWithError:(id *)a3
{
  v169 = [(MBCKEngine *)self serviceAccount];
  if (!v169) {
    __assert_rtn("-[MBCKRestoreEngine setUpWithError:]", "MBCKRestoreEngine.m", 511, "serviceAccount");
  }
  uint64_t v5 = [(MBCKEngine *)self serviceManager];
  if (!v5) {
    __assert_rtn("-[MBCKRestoreEngine setUpWithError:]", "MBCKRestoreEngine.m", 513, "serviceManager");
  }
  v189.receiver = self;
  v189.super_class = (Class)MBCKRestoreEngine;
  if (![(MBCKEngine *)&v189 setUpWithError:a3]) {
    goto LABEL_19;
  }
  id v6 = [(MBEngine *)self domainManager];
  BOOL v7 = v6 == 0;

  if (!v7)
  {
    id v8 = [(MBCKEngine *)self context];
    BOOL v9 = [v8 restoreMode];
    unsigned __int8 v10 = [v9 isForeground];

    if ((v10 & 1) != 0
      || ([(MBCKEngine *)self persona],
          id v11 = objc_claimAutoreleasedReturnValue(),
          unsigned int v12 = [v11 isDataSeparatedPersona],
          v11,
          !v12))
    {
      v166 = 0;
      v168 = 0;
    }
    else
    {
      uint64_t v13 = [(MBCKEngine *)self persona];
      uint64_t v14 = [v13 personaIdentifier];
      id v15 = +[MigratorCache migratorCacheURLFor:v14];

      id v188 = 0;
      id v16 = [[_TtC7backupd13MigratorCache alloc] initWithUrl:v15 error:&v188];
      v166 = (NSArray *)v188;
      if (!v16)
      {
        id v61 = MBGetDefaultLog();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v166;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to load the migrator cache at %{public}@: %@", buf, 0x16u);
          _MBLog();
        }

        if (a3)
        {
          v166 = v166;
          v168 = 0;
          BOOL v25 = 0;
          *a3 = v166;
          goto LABEL_96;
        }
        v168 = 0;
LABEL_57:
        BOOL v25 = 0;
LABEL_96:

        goto LABEL_97;
      }
      v168 = [(MigratorCache *)v16 bundleIDs];
      unsigned __int8 v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v168;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Fetched all data-separated bundleIDs from %{public}@: %@", buf, 0x16u);
        v152 = v15;
        v155 = v168;
        _MBLog();
      }
    }
    id v18 = [MBAppManager alloc];
    id v19 = [(MBEngine *)self settingsContext];
    v20 = [v19 mobileInstallation];
    v21 = [(MBAppManager *)v18 initWithMobileInstallation:v20];
    appManager = self->super.super._appManager;
    self->super.super._appManager = v21;

    if (![(MBEngine *)self isForegroundRestore])
    {
      long long v23 = [(MBCKRestoreEngine *)self restoreMode];
      if ([v23 isBackgroundFile])
      {
      }
      else
      {
        long long v26 = [(MBCKRestoreEngine *)self restoreMode];
        unsigned int v27 = [v26 isBackgroundFiles];

        if (!v27)
        {
LABEL_22:
          id v30 = -[MBCKEngine setUpOperationTrackerWithError:](self, "setUpOperationTrackerWithError:", a3, v152);
          v165 = v30;
          if (v30)
          {
            v31 = [v30 ckOperationPolicy];
            v164 = [v31 cellularAccess];

            if (v164)
            {
              if ([v164 allowsExpensiveNetworkAccess]) {
                uint64_t v32 = 2;
              }
              else {
                uint64_t v32 = 1;
              }
              [(MBCKRestoreEngine *)self setAllowedCellularCost:v32];
            }
            id v33 = [v5 networkConnectivity];
            -[MBCKRestoreEngine setNetworkConnectivityAtStart:](self, "setNetworkConnectivityAtStart:", v33, v34);
            v163 = [(MBCKEngine *)self persona];
            if ([v163 cleanupRestoreDirectoriesWithError:a3])
            {
              BOOL v35 = [(MBEngine *)self isForegroundRestore];
              if (!v35) {
                goto LABEL_39;
              }
              if ([v5 resetCacheWithAccount:v169 error:a3])
              {
                v162 = [v5 openCacheWithAccount:v169 accessType:1 error:a3];
                if (!v162)
                {
                  BOOL v25 = 0;
LABEL_94:

                  goto LABEL_95;
                }
                -[MBCKEngine setCache:](self, "setCache:");
                +[MBRestoreDepot disposeAllDepotsForPersona:v163 error:0];
                [v163 removeRestorePrefetchCachesOlderThanDate:0];
                if (([v163 createRestoreDirectoriesWithError:a3] & 1) == 0)
                {
                  v85 = MBGetDefaultLog();
                  __int16 v38 = v85;
                  if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                  {
                    if (a3)
                    {
                      id v86 = *a3;
                      *(_DWORD *)buf = 138412290;
                      *(void *)&uint8_t buf[4] = v86;
                    }
                    else
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)&uint8_t buf[4] = @"(no error available)";
                    }
                    _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Error creating restore directory: %@", buf, 0xCu);
                    _MBLog();
                    BOOL v25 = 0;
                    __int16 v38 = v85;
                    goto LABEL_93;
                  }
                  goto LABEL_87;
                }
                v36 = [v163 userIncompleteRestoreDirectory];
                v37 = [v163 placeholderRestoreDirectory];
                __int16 v38 = [v36 stringByAppendingPathComponent:v37];

                uint64_t v39 = [(MBCKRestoreEngine *)self restoreMode];
                BOOL v40 = [v39 type] == 6;

                if (v40)
                {
                  v41 = MBGetDefaultLog();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "=ckrestore-engine= FIXME: Removing existing placeholder directories to get data-separated restores working.", buf, 2u);
                    _MBLog();
                  }

                  unsigned int v42 = +[NSFileManager defaultManager];
                  [v42 removeItemAtPath:v38 error:0];
                }
                v43 = +[NSFileManager defaultManager];
                v44 = MBMobileFileAttributes();
                unsigned int v45 = [v43 createDirectoryAtPath:v38 withIntermediateDirectories:1 attributes:v44 error:a3];

                if (!v45)
                {
                  v87 = MBGetDefaultLog();
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Error creating placeholder directory", buf, 2u);
                    _MBLog();
                  }

                  goto LABEL_87;
                }

LABEL_39:
                v46 = [(MBCKEngine *)self context];
                v162 = [v46 backupUDID];

                if (!v162) {
                  __assert_rtn("-[MBCKRestoreEngine setUpWithError:]", "MBCKRestoreEngine.m", 613, "backupUDID");
                }
                v47 = [(MBCKEngine *)self cache];
                v161 = [v5 fetchDeviceForRestoreWithUUID:v162 tracker:v165 isForegroundRestore:v35 cache:v47 error:a3];

                __int16 v38 = v161;
                if (v161)
                {
                  [(MBCKEngine *)self setDevice:v161];
                  if (![(MBCKEngine *)self handleCancelation:a3])
                  {
                    unsigned int v48 = [(MBCKRestoreEngine *)self storedKeybagsByUUIDString];
                    if (v48)
                    {
                      v49 = [(MBCKRestoreEngine *)self storedKeybagsByUUIDString];
                      BOOL v50 = [v49 count] == 0;

                      if (!v50)
                      {
                        v51 = MBGetDefaultLog();
                        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "=ckrestore-engine= Using keybags serialized to disk for this restore session", buf, 2u);
                          _MBLog();
                        }

                        long long v186 = 0u;
                        long long v187 = 0u;
                        long long v184 = 0u;
                        long long v185 = 0u;
                        v52 = [(MBCKRestoreEngine *)self storedKeybagsByUUIDString];
                        id v53 = [v52 countByEnumeratingWithState:&v184 objects:v198 count:16];
                        if (v53)
                        {
                          uint64_t v54 = *(void *)v185;
                          do
                          {
                            for (i = 0; i != v53; i = (char *)i + 1)
                            {
                              if (*(void *)v185 != v54) {
                                objc_enumerationMutation(v52);
                              }
                              uint64_t v56 = *(void *)(*((void *)&v184 + 1) + 8 * i);
                              v57 = [(MBCKRestoreEngine *)self storedKeybagsByUUIDString];
                              v58 = [v57 objectForKeyedSubscript:v56];

                              id v59 = [(MBCKEngine *)self device];
                              id v60 = [v59 keybagManager];
                              [v60 addKeybag:v58];
                            }
                            id v53 = [v52 countByEnumeratingWithState:&v184 objects:v198 count:16];
                          }
                          while (v53);
                        }

LABEL_67:
                        if (![(MBCKEngine *)self handleCancelation:a3])
                        {
                          v70 = [(MBCKEngine *)self context];
                          v71 = [v70 lockManager];
                          unsigned __int8 v72 = [v71 reacquireLockWithError:a3];

                          if (v72)
                          {
                            if (![(MBCKEngine *)self handleCancelation:a3]
                              && [v161 fetchSnapshotsWithOperationTracker:v165 retry:1 error:a3])
                            {
                              v73 = [(MBCKEngine *)self context];
                              v160 = [v73 snapshotUUID];

                              id v74 = objc_alloc((Class)NSMutableArray);
                              v75 = [(MBCKEngine *)self device];
                              v76 = [v75 snapshots];
                              id obj = objc_msgSend(v74, "initWithCapacity:", objc_msgSend(v76, "count"));

                              long long v182 = 0u;
                              long long v183 = 0u;
                              long long v180 = 0u;
                              long long v181 = 0u;
                              v77 = [(MBCKEngine *)self device];
                              v78 = [v77 snapshots];

                              id v79 = [v78 countByEnumeratingWithState:&v180 objects:v197 count:16];
                              if (v79)
                              {
                                uint64_t v80 = *(void *)v181;
                                while (2)
                                {
                                  for (j = 0; j != v79; j = (char *)j + 1)
                                  {
                                    if (*(void *)v181 != v80) {
                                      objc_enumerationMutation(v78);
                                    }
                                    v82 = *(void **)(*((void *)&v180 + 1) + 8 * (void)j);
                                    [obj addObject:v82];
                                    v83 = [v82 snapshotID];
                                    unsigned int v84 = [v83 isEqualToString:v160];

                                    if (v84)
                                    {
                                      objc_storeStrong((id *)&self->_targetSnapshot, v82);

                                      goto LABEL_108;
                                    }
                                  }
                                  id v79 = [v78 countByEnumeratingWithState:&v180 objects:v197 count:16];
                                  if (v79) {
                                    continue;
                                  }
                                  break;
                                }
                              }

LABEL_108:
                              if (self->_targetSnapshot)
                              {
                                v157 = [(MBCKEngine *)self serviceAccount];
                                if (!v157) {
                                  __assert_rtn("-[MBCKRestoreEngine setUpWithError:]", "MBCKRestoreEngine.m", 670, "account");
                                }
                                unsigned __int8 v179 = 0;
                                if ([(MBEngine *)self isForegroundRestore])
                                {
                                  if (+[MBRestoreCloudFormatPolicy shouldRestoreSnapshot:self->_targetSnapshot account:v157 persona:v163 useFileLists:&v179 error:a3])
                                  {
                                    id v91 = [v163 copyPreferencesValueForKey:@"RestoreCloudFormatInfo" class:objc_opt_class()];
                                    if (!v91) {
                                      __assert_rtn("-[MBCKRestoreEngine setUpWithError:]", "MBCKRestoreEngine.m", 680, "savedCloudFormatInfo");
                                    }
                                    [(MBCKRestoreEngine *)self setCloudFormatInfo:v91];

LABEL_117:
                                    [(MBCKRestoreEngine *)self setUseFileLists:v179];
                                    *(void *)buf = 0;
                                    *(void *)&buf[8] = buf;
                                    *(void *)&buf[16] = 0x2020000000;
                                    char v196 = 0;
                                    if ([(MBCKRestoreEngine *)self useFileLists])
                                    {
                                      if (![(MBEngine *)self isForegroundRestore])
                                      {
                                        v95 = [(MBCKSnapshot *)self->_targetSnapshot snapshotID];
                                        v178 = v166;
                                        v96 = [v5 restorePlanForAccount:v157 snapshotUUID:v95 error:&v178];
                                        v97 = v178;

                                        if (!v96)
                                        {
                                          v120 = MBGetDefaultLog();
                                          if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                                          {
                                            *(_DWORD *)v191 = 138412290;
                                            v192 = v97;
                                            _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to load restore plan for background restore: %@", v191, 0xCu);
                                            _MBLog();
                                          }

                                          if (a3) {
                                            *a3 = v97;
                                          }

                                          goto LABEL_155;
                                        }
                                        unsigned __int8 v98 = [v96 isPopulated];
                                        *(unsigned char *)(*(void *)&buf[8] + 24) = v98;

LABEL_130:
                                        if (*(unsigned char *)(*(void *)&buf[8] + 24)
                                          && ![(MBEngine *)self isForegroundRestore])
                                        {
                                          goto LABEL_140;
                                        }
                                        v102 = MBGetDefaultLog();
                                        if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
                                        {
                                          v103 = v102;
                                          if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
                                          {
                                            v104 = [(MBCKEngine *)self device];
                                            v105 = [v104 snapshots];
                                            *(_DWORD *)v191 = 138412290;
                                            v192 = v105;
                                            _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_INFO, "=ckrestore-engine= Device has snapshots: %@", v191, 0xCu);
                                          }
                                          v106 = [(MBCKEngine *)self device];
                                          v153 = [v106 snapshots];
                                          _MBLog();
                                        }
                                        v107 = [MBCKProperties alloc];
                                        v108 = [(MBCKSnapshot *)self->_targetSnapshot backupProperties];
                                        v109 = [(MBProperties *)v107 initWithData:v108 error:a3];
                                        [(MBCKEngine *)self setProperties:v109];

                                        v110 = [(MBCKEngine *)self properties];
                                        BOOL v111 = v110 == 0;

                                        if (!v111)
                                        {
                                          p_validSnapshots = &self->_validSnapshots;
                                          objc_storeStrong((id *)&self->_validSnapshots, obj);
                                          v113 = MBGetDefaultLog();
                                          if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
                                          {
                                            v114 = *p_validSnapshots;
                                            *(_DWORD *)v191 = 138412290;
                                            v192 = v114;
                                            _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_INFO, "=ckrestore-engine= Restoring from snapshots: %@", v191, 0xCu);
                                            v153 = *p_validSnapshots;
                                            _MBLog();
                                          }

LABEL_140:
                                          v176 = v97;
                                          id v115 = [(id)objc_opt_class() _fetchBackupPolicyWithDevice:v161 snapshotUUID:v160 error:&v176];
                                          v156 = v176;

                                          if (!v115 && v156)
                                          {
                                            if (a3)
                                            {
                                              +[MBError errorWithCode:205, @"Failed to fetch the backup policy for snapshot %@", v160 format];
                                              BOOL v25 = 0;
                                              *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_190:
                                              v97 = v156;
                                              goto LABEL_191;
                                            }
LABEL_189:
                                            BOOL v25 = 0;
                                            goto LABEL_190;
                                          }
                                          v116 = [(MBCKEngine *)self context];
                                          [v116 setBackupPolicy:v115];

                                          if ([(MBCKEngine *)self handleCancelation:a3]) {
                                            goto LABEL_189;
                                          }
                                          v117 = [(MBCKEngine *)self device];
                                          unsigned int v118 = [v117 canRestoreSystemFiles];
                                          if (v118)
                                          {
                                            id v115 = [(MBCKEngine *)self persona];
                                            id v119 = [v115 shouldRestoreToSharedVolume];
                                          }
                                          else
                                          {
                                            id v119 = 0;
                                          }
                                          v121 = [(MBCKEngine *)self context];
                                          [v121 setShouldRestoreSystemFiles:v119];

                                          if (v118) {
                                          v122 = [(MBCKEngine *)self context];
                                          }
                                          unsigned __int8 v123 = [v122 shouldRestoreSystemFiles];

                                          if ((v123 & 1) == 0)
                                          {
                                            v124 = MBGetDefaultLog();
                                            if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
                                            {
                                              v125 = v124;
                                              if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
                                              {
                                                v126 = [(MBCKEngine *)self device];
                                                v127 = [v126 deviceClass];
                                                v128 = MBDeviceClass();
                                                *(_DWORD *)v191 = 138412546;
                                                v192 = v127;
                                                __int16 v193 = 2112;
                                                v194 = v128;
                                                _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Not restoring system files from %@ backup to %@", v191, 0x16u);
                                              }
                                              v129 = [(MBCKEngine *)self device];
                                              v130 = [v129 deviceClass];
                                              MBDeviceClass();
                                              v155 = v154 = v130;
                                              _MBLog();
                                            }
                                          }
                                          if (![(MBCKRestoreEngine *)self useFileLists])
                                          {
                                            v131 = +[NSMutableSet set];
                                            v132 = [(MBCKEngine *)self cache];
                                            v174[0] = _NSConcreteStackBlock;
                                            v174[1] = 3221225472;
                                            v174[2] = sub_100070F28;
                                            v174[3] = &unk_1004114C8;
                                            id v133 = v131;
                                            id v175 = v133;
                                            id v134 = [v132 enumeratePendingRestorableDomainsWithCallback:v174];

                                            long long v172 = 0u;
                                            long long v173 = 0u;
                                            long long v170 = 0u;
                                            long long v171 = 0u;
                                            id v158 = [(MBAppManager *)self->super.super._appManager allContainers];
                                            id v135 = [v158 countByEnumeratingWithState:&v170 objects:v190 count:16];
                                            if (v135)
                                            {
                                              id v167 = *(id *)v171;
                                              do
                                              {
                                                for (k = 0; k != v135; k = (char *)k + 1)
                                                {
                                                  if (*(id *)v171 != v167) {
                                                    objc_enumerationMutation(v158);
                                                  }
                                                  v137 = *(void **)(*((void *)&v170 + 1) + 8 * (void)k);
                                                  v138 = [v137 domain];
                                                  v139 = [v138 name];
                                                  unsigned int v140 = [v133 containsObject:v139];

                                                  if (v140)
                                                  {
                                                    v141 = [(MBEngine *)self domainManager];
                                                    v142 = [v137 domain];
                                                    [v141 addDomain:v142];
                                                  }
                                                }
                                                id v135 = [v158 countByEnumeratingWithState:&v170 objects:v190 count:16];
                                              }
                                              while (v135);
                                            }
                                          }
                                          [(MBCKRestoreEngine *)self resetRestorePolicy];
                                          if ([(MBEngine *)self isForegroundRestore])
                                          {
                                            v143 = [(MBCKRestoreEngine *)self restorePolicy];
                                            v144 = [v143 notifyPluginsStartingRestoreWithEngine:self];

                                            if (v144)
                                            {
                                              v145 = MBGetDefaultLog();
                                              if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
                                              {
                                                *(_DWORD *)v191 = 138412290;
                                                v192 = v144;
                                                _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to notify plugins of startingRestoreWithEngine: %@", v191, 0xCu);
                                                _MBLog();
                                              }
LABEL_186:

                                              if (a3)
                                              {
                                                v144 = v144;
                                                *a3 = v144;
                                              }

                                              goto LABEL_189;
                                            }
                                            v151 = [(MBCKRestoreEngine *)self restorePolicy];
                                            v144 = [v151 notifyPluginsPreparingRestoreWithEngine:self];

                                            if (v144)
                                            {
                                              v145 = MBGetDefaultLog();
                                              if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
                                              {
                                                *(_DWORD *)v191 = 138412290;
                                                v192 = v144;
                                                _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to notify plugins of preparingRestoreWithEngine: %@", v191, 0xCu);
                                                _MBLog();
                                              }
                                              goto LABEL_186;
                                            }
                                          }
                                          else
                                          {
                                            v146 = [(MBCKEngine *)self context];
                                            v147 = [v146 qos];
                                            uint64_t v148 = (uint64_t)[v147 integerValue];

                                            v149 = [v165 databaseManager];
                                            v150 = [v165 account];
                                            [v149 setShouldSupportBudgeting:v148 > 24 account:v150];
                                          }
                                          BOOL v25 = 1;
                                          goto LABEL_190;
                                        }
                                        if (a3)
                                        {
                                          +[MBError errorWithCode:205, @"Invalid snapshot %@: missing properties", self->_targetSnapshot format];
                                          BOOL v25 = 0;
                                          *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_191:
                                          _Block_object_dispose(buf, 8);
                                          v166 = v97;
                                          goto LABEL_192;
                                        }
LABEL_155:
                                        BOOL v25 = 0;
                                        goto LABEL_191;
                                      }
                                    }
                                    else
                                    {
                                      v99 = [(MBCKEngine *)self cache];
                                      v177[0] = _NSConcreteStackBlock;
                                      v177[1] = 3221225472;
                                      v177[2] = sub_100070F18;
                                      v177[3] = &unk_1004114A0;
                                      v177[4] = buf;
                                      v100 = [v99 hasRestoreFilesWithCallback:v177];

                                      if (v100)
                                      {
                                        v101 = MBGetDefaultLog();
                                        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
                                        {
                                          *(_DWORD *)v191 = 138412290;
                                          v192 = v100;
                                          _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Cache error checking for restorable files: %@", v191, 0xCu);
                                          _MBLog();
                                        }

                                        if (a3) {
                                          *a3 = v100;
                                        }

                                        BOOL v25 = 0;
                                        v97 = v166;
                                        goto LABEL_191;
                                      }
                                    }
                                    v97 = v166;
                                    goto LABEL_130;
                                  }
                                }
                                else if (+[MBRestoreCloudFormatPolicy isRestoringFromFileLists:&v179 persona:v163 error:a3])
                                {
                                  goto LABEL_117;
                                }
                              }
                              else
                              {
                                if (!a3)
                                {
                                  BOOL v25 = 0;
LABEL_193:

                                  goto LABEL_92;
                                }
                                v157 = [(MBCKEngine *)self context];
                                id v92 = [v157 snapshotID];
                                v93 = [(MBCKEngine *)self device];
                                v94 = [v93 snapshots];
                                +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, @"Invalid snapshot offset (%ld of %lu snapshots)", v92, [v94 count]);
                                *a3 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              BOOL v25 = 0;
LABEL_192:

                              goto LABEL_193;
                            }
                          }
                          else
                          {
                            v88 = MBGetDefaultLog();
                            if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                            {
                              *(_WORD *)buf = 0;
                              _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to acquire lock", buf, 2u);
                              _MBLog();
                            }
                          }
                        }
                        goto LABEL_91;
                      }
                    }
                    v62 = [(MBCKEngine *)self device];
                    v63 = [v62 keybagManager];
                    unsigned __int8 v64 = [v63 hasFetchedKeybags];

                    if (v64) {
                      goto LABEL_67;
                    }
                    if ([(MBEngine *)self isForegroundRestore]
                      || ([(MBCKEngine *)self persona],
                          v65 = objc_claimAutoreleasedReturnValue(),
                          unsigned int v66 = [v65 isDataSeparatedPersona],
                          v65,
                          v66))
                    {
                      v67 = [(MBCKEngine *)self device];
                      v68 = [v67 keybagManager];
                      unsigned __int8 v69 = [v68 fetchKeybagsWithOperationTracker:v165 error:a3];

                      if (v69) {
                        goto LABEL_67;
                      }
                    }
                    else
                    {
                      v90 = MBGetDefaultLog();
                      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Restore keybag not loaded yet", buf, 2u);
                        _MBLog();
                      }

                      if (a3)
                      {
                        +[MBError errorWithCode:208 format:@"Restore keybag not loaded yet"];
                        BOOL v25 = 0;
                        *a3 = (id)objc_claimAutoreleasedReturnValue();
                        goto LABEL_92;
                      }
                    }
                  }
LABEL_91:
                  BOOL v25 = 0;
LABEL_92:
                  __int16 v38 = v161;
                  goto LABEL_93;
                }
LABEL_87:
                BOOL v25 = 0;
LABEL_93:

                goto LABEL_94;
              }
            }
            BOOL v25 = 0;
LABEL_95:

            id v15 = v165;
            goto LABEL_96;
          }
          id v15 = 0;
          goto LABEL_57;
        }
      }
    }
    char v28 = self->super.super._appManager;
    __int16 v29 = [(MBCKEngine *)self persona];
    LODWORD(v28) = [(MBAppManager *)v28 loadAppsWithPersona:v29 safeHarbors:0 dataSeparatedBundleIDs:v168 error:a3];

    if (!v28)
    {
      BOOL v25 = 0;
LABEL_97:

      goto LABEL_98;
    }
    goto LABEL_22;
  }
  long long v24 = MBGetDefaultLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "=ckrestore-engine= nil domain manager", buf, 2u);
    _MBLog();
  }

  if (a3)
  {
    +[MBError errorWithCode:1 format:@"nil domain manager"];
    BOOL v25 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_19:
    BOOL v25 = 0;
  }
LABEL_98:

  return v25;
}

- (BOOL)cancelWithError:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MBCKRestoreEngine;
  BOOL v4 = [(MBCKEngine *)&v15 cancelWithError:a3];
  if (!v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [(MBCKRestoreEngine *)self cacheDeleteRequests];
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        BOOL v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) cancel];
          BOOL v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (BOOL)synchronizeFileListsWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBCKRestoreEngine synchronizeFileListsWithError:]", "MBCKRestoreEngine.m", 790, "error");
  }
  if (![(MBEngine *)self isForegroundRestore])
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= =sync= Skipping file list synchronization for background restore", buf, 2u);
LABEL_15:
      _MBLog();
    }
LABEL_16:
    BOOL v12 = 1;
    goto LABEL_73;
  }
  if (![(MBCKRestoreEngine *)self useFileLists])
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= =sync= Skipping file list synchronization, restoring legacy snapshot data", buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  uint64_t v5 = [(MBCKEngine *)self serviceManager];
  if (!v5) {
    __assert_rtn("-[MBCKRestoreEngine synchronizeFileListsWithError:]", "MBCKRestoreEngine.m", 803, "serviceManager");
  }
  id v6 = v5;
  uint64_t v7 = [(MBCKEngine *)self serviceAccount];
  if (!v7) {
    __assert_rtn("-[MBCKRestoreEngine synchronizeFileListsWithError:]", "MBCKRestoreEngine.m", 806, "account");
  }
  uint64_t v8 = (void *)v7;
  BOOL v9 = [(MBCKSnapshot *)self->_targetSnapshot snapshotID];
  v62 = a3;
  unsigned __int8 v10 = [v6 restorePlanForAccount:v8 snapshotUUID:v9 error:a3];
  v63 = v10;
  if (v10)
  {
    if ([v10 isPopulated])
    {
      long long v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v80 = v63;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= =sync= Restore plan already synchronized %@", buf, 0xCu);
        _MBLog();
      }
      BOOL v12 = 1;
    }
    else
    {
      uint64_t v14 = [(MBCKEngine *)self device];
      if (!v14) {
        __assert_rtn("-[MBCKRestoreEngine synchronizeFileListsWithError:]", "MBCKRestoreEngine.m", 822, "device");
      }
      long long v11 = v14;
      uint64_t v15 = [(MBCKEngine *)self ckOperationTracker];
      if (!v15) {
        __assert_rtn("-[MBCKRestoreEngine synchronizeFileListsWithError:]", "MBCKRestoreEngine.m", 824, "tracker");
      }
      id v16 = (void *)v15;
      uint64_t v17 = +[NSMutableArray array];
      id v18 = [v63 restoreSnapshotsDirectoryRoot];
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_100071A64;
      v76[3] = &unk_1004114F0;
      id v19 = (id)v17;
      id v77 = v19;
      LOBYTE(v17) = [v11 synchronizeFileListsWithOperationTracker:v16 snapshotDirectory:v18 snapshotUUID:v9 error:a3 fetchedFileListBlock:v76];

      id v60 = v19;
      if (v17)
      {
        v58 = v6;
        id v59 = v16;
        v55 = v11;
        uint64_t v56 = v9;
        v57 = v8;

        uint64_t v54 = [(MBEngine *)self domainManager];
        if (!v54) {
          __assert_rtn("-[MBCKRestoreEngine synchronizeFileListsWithError:]", "MBCKRestoreEngine.m", 837, "domainManager");
        }
        [v19 sortUsingSelector:"compare:"];
        v20 = +[NSMutableArray array];
        v21 = +[NSMutableArray array];
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v22 = v19;
        id v23 = [v22 countByEnumeratingWithState:&v72 objects:v86 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v73;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v73 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v72 + 1) + 8 * i);
              char v28 = [(MBCKRestoreEngine *)self restorePolicy];
              unsigned int v29 = [v28 shouldForegroundRestoreDomain:v27];

              if (v29) {
                id v30 = v20;
              }
              else {
                id v30 = v21;
              }
              [v30 addObject:v27];
            }
            id v24 = [v22 countByEnumeratingWithState:&v72 objects:v86 count:16];
          }
          while (v24);
        }

        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        v31 = v20;
        id v32 = [v31 countByEnumeratingWithState:&v68 objects:v85 count:16];
        id obj = v31;
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v69;
LABEL_36:
          uint64_t v35 = 0;
          while (1)
          {
            if (*(void *)v69 != v34) {
              objc_enumerationMutation(obj);
            }
            v36 = *(void **)(*((void *)&v68 + 1) + 8 * v35);
            v37 = MBGetDefaultLog();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v80 = v36;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= =sync= Ingesting foreground domain (%@) into restore plan", buf, 0xCu);
              _MBLog();
            }

            if (([v63 ingestFileListForDomainNamed:v36 error:v62] & 1) == 0) {
              break;
            }
            if (![(MBCKRestoreEngine *)self _markForegroundRestorablesForBackgroundRestoreInPlan:v63 domainName:v36 error:v62])
            {
              BOOL v12 = 0;
              BOOL v50 = obj;
              __int16 v38 = obj;
              uint64_t v8 = v57;
              id v6 = v58;
              long long v11 = v55;
              BOOL v9 = v56;
LABEL_65:
              id v47 = (id)v54;
              goto LABEL_70;
            }
            if (v33 == (id)++v35)
            {
              v31 = obj;
              id v33 = [obj countByEnumeratingWithState:&v68 objects:v85 count:16];
              if (v33) {
                goto LABEL_36;
              }
              goto LABEL_45;
            }
          }
          unsigned int v48 = MBGetDefaultLog();
          uint64_t v8 = v57;
          id v6 = v58;
          long long v11 = v55;
          BOOL v9 = v56;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            id v49 = *v62;
            *(_DWORD *)buf = 138412802;
            id v80 = v36;
            __int16 v81 = 2112;
            v82 = v63;
            __int16 v83 = 2112;
            id v84 = v49;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "=ckrestore-engine= =sync= Error ingesting foreground domain (%@) into restore plan %@: %@", buf, 0x20u);
            _MBLog();
          }

          BOOL v12 = 0;
          BOOL v50 = obj;
          __int16 v38 = obj;
          goto LABEL_65;
        }
LABEL_45:

        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        __int16 v38 = v21;
        id v39 = [v38 countByEnumeratingWithState:&v64 objects:v78 count:16];
        if (v39)
        {
          id v40 = v39;
          uint64_t v41 = *(void *)v65;
          while (2)
          {
            for (j = 0; j != v40; j = (char *)j + 1)
            {
              if (*(void *)v65 != v41) {
                objc_enumerationMutation(v38);
              }
              v43 = *(void **)(*((void *)&v64 + 1) + 8 * (void)j);
              v44 = MBGetDefaultLog();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v80 = v43;
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= =sync= Ingesting background domain (%@) into restore plan", buf, 0xCu);
                _MBLog();
              }

              if (([v63 ingestFileListForDomainNamed:v43 error:v62] & 1) == 0)
              {
                v51 = MBGetDefaultLog();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  id v52 = *v62;
                  *(_DWORD *)buf = 138412802;
                  id v80 = v43;
                  __int16 v81 = 2112;
                  v82 = v63;
                  __int16 v83 = 2112;
                  id v84 = v52;
                  _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "=ckrestore-engine= =sync= Error ingesting background domain (%@) into restore plan %@: %@", buf, 0x20u);
                  _MBLog();
                }

                BOOL v12 = 0;
                goto LABEL_69;
              }
            }
            id v40 = [v38 countByEnumeratingWithState:&v64 objects:v78 count:16];
            if (v40) {
              continue;
            }
            break;
          }
        }

        __int16 v38 = MBGetDefaultLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          id v45 = [v22 count];
          *(_DWORD *)buf = 134218242;
          id v80 = v45;
          __int16 v81 = 2112;
          v82 = v63;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= =sync= Restore plan initialized, ingested %ld file lists: %@", buf, 0x16u);
          [v22 count];
          _MBLog();
        }
        BOOL v12 = 1;
LABEL_69:
        uint64_t v8 = v57;
        id v6 = v58;
        long long v11 = v55;
        BOOL v9 = v56;
        id v47 = (id)v54;
        BOOL v50 = obj;
LABEL_70:

        id v16 = v59;
      }
      else
      {
        v46 = MBGetDefaultLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "=ckrestore-engine= =sync= Error synchronizing file lists", buf, 2u);
          _MBLog();
        }

        BOOL v12 = 0;
        id v47 = v77;
      }
    }
  }
  else
  {
    long long v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = *a3;
      *(_DWORD *)buf = 138412290;
      id v80 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "=ckrestore-engine= =sync= Failed to open a restore plan to synchronize into: %@", buf, 0xCu);
      _MBLog();
    }
    BOOL v12 = 0;
  }

LABEL_73:
  return v12;
}

- (BOOL)_markForegroundRestorablesForBackgroundRestoreInPlan:(id)a3 domainName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5) {
    __assert_rtn("-[MBCKRestoreEngine _markForegroundRestorablesForBackgroundRestoreInPlan:domainName:error:]", "MBCKRestoreEngine.m", 880, "error");
  }
  unsigned __int8 v10 = v9;
  long long v11 = [(MBEngine *)self domainManager];
  BOOL v12 = [v11 domainForName:v10];

  if (!v12) {
    __assert_rtn("-[MBCKRestoreEngine _markForegroundRestorablesForBackgroundRestoreInPlan:domainName:error:]", "MBCKRestoreEngine.m", 883, "domain");
  }
  uint64_t v27 = 0;
  char v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  id v13 = [v8 planForDomain:v12 restoreType:1 error:a5];
  uint64_t v14 = v13;
  if (!v13) {
    goto LABEL_11;
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100071EB4;
  v22[3] = &unk_100411518;
  v22[4] = self;
  v22[5] = &v27;
  v22[6] = &v23;
  if (([v13 enumerateAndMarkATCRestorables:a5 enumerator:v22] & 1) == 0)
  {
    id v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = *a5;
      *(_DWORD *)buf = 138412546;
      id v32 = v10;
      __int16 v33 = 2112;
      id v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=ckrestore-engine= =sync= Error marking ATC files for (%@) in restore plan: %@", buf, 0x16u);
      _MBLog();
    }

LABEL_11:
    BOOL v18 = 0;
    goto LABEL_12;
  }
  uint64_t v15 = MBGetDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (void *)v24[3];
    uint64_t v17 = (void *)v28[3];
    *(_DWORD *)buf = 134218498;
    id v32 = v16;
    __int16 v33 = 2048;
    id v34 = v17;
    __int16 v35 = 2112;
    v36 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= =sync= Deferred %ld/%ld restorables from foreground to background in %@", buf, 0x20u);
    _MBLog();
  }

  BOOL v18 = 1;
LABEL_12:

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v18;
}

- (BOOL)findRestorablesWithError:(id *)a3
{
  if (![(MBCKRestoreEngine *)self useFileLists])
  {
    v46 = [(MBCKEngine *)self cache];
    id v40 = self->_validSnapshots;
    id v45 = [(MBEngine *)self domainManager];
    uint64_t v41 = [(MBCKEngine *)self serviceAccount];
    double Current = CFAbsoluteTimeGetCurrent();
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Finding restorable files", (uint8_t *)&buf, 2u);
      _MBLog();
    }

    id v9 = [(MBCKEngine *)self serviceManager];
    id v47 = [v9 openCacheWithAccount:v41 accessType:2 cached:0 error:a3];

    if (!v47)
    {
      uint64_t v25 = MBGetDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = *a3;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to open readonly cache %@", (uint8_t *)&buf, 0xCu);
        _MBLog();
      }

      BOOL v6 = 0;
      goto LABEL_55;
    }
    uint64_t v72 = 0;
    long long v73 = &v72;
    uint64_t v74 = 0x2020000000;
    uint64_t v75 = 0;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = v40;
    id v10 = 0;
    id v11 = [(NSArray *)obj countByEnumeratingWithState:&v68 objects:v85 count:16];
    if (v11)
    {
      uint64_t v44 = *(void *)v69;
      do
      {
        BOOL v12 = 0;
        do
        {
          if (*(void *)v69 != v44) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v68 + 1) + 8 * (void)v12);
          id v67 = v10;
          unsigned __int8 v14 = -[MBCKEngine handleCancelation:](self, "handleCancelation:", &v67, v38, v39);
          id v15 = v67;

          if (v14)
          {
            id v10 = v15;
            goto LABEL_31;
          }
          id v16 = MBGetDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v13;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Adding restorables for snapshot %@", (uint8_t *)&buf, 0xCu);
            __int16 v38 = v13;
            _MBLog();
          }

          uint64_t v63 = 0;
          long long v64 = &v63;
          uint64_t v65 = 0x2020000000;
          uint64_t v66 = 0;
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v81 = 0x3032000000;
          v82 = sub_1000728F8;
          __int16 v83 = sub_100072908;
          id v84 = 0;
          uint64_t v57 = 0;
          v58 = &v57;
          uint64_t v59 = 0x3032000000;
          id v60 = sub_1000728F8;
          id v61 = sub_100072908;
          id v62 = 0;
          uint64_t v17 = [v13 snapshotID];
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_100072910;
          v49[3] = &unk_100411540;
          id v50 = v45;
          v51 = self;
          id v53 = &v57;
          id v52 = v46;
          p_long long buf = &buf;
          v55 = &v63;
          uint64_t v56 = &v72;
          BOOL v18 = [v47 enumerateFilesForSnapshotOrderedByDomain:v17 block:v49];

          id v19 = MBGetDefaultLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = v64[3];
            uint64_t v21 = *(void *)(*((void *)&buf + 1) + 40);
            *(_DWORD *)v76 = 134218242;
            uint64_t v77 = v20;
            __int16 v78 = 2114;
            uint64_t v79 = v21;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Found %llu restorables for \"%{public}@\"", v76, 0x16u);
            __int16 v38 = (void *)v64[3];
            uint64_t v39 = *(void *)(*((void *)&buf + 1) + 40);
            _MBLog();
          }

          id v22 = v18;
          if (v18 || (id v22 = (void *)v58[5]) != 0)
          {
            id v10 = v22;

            int v23 = 0;
          }
          else
          {
            int v23 = 1;
            id v10 = v15;
          }

          _Block_object_dispose(&v57, 8);
          _Block_object_dispose(&buf, 8);

          _Block_object_dispose(&v63, 8);
          if (!v23) {
            goto LABEL_31;
          }
          BOOL v12 = (char *)v12 + 1;
        }
        while (v11 != v12);
        id v24 = [(NSArray *)obj countByEnumeratingWithState:&v68 objects:v85 count:16];
        id v11 = v24;
      }
      while (v24);
    }
LABEL_31:

    [v47 close];
    if (v10)
    {
      BOOL v6 = 0;
      if (a3) {
        *a3 = v10;
      }
      goto LABEL_54;
    }
    uint64_t v27 = MBGetDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = v73[3];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Found %llu total restorables", (uint8_t *)&buf, 0xCu);
      _MBLog();
    }

    id v48 = 0;
    unsigned __int8 v29 = [v46 computeSignatureRetainCountsWithError:&v48];
    id v30 = v48;
    if (v29)
    {
      v31 = [v46 removeDeletedRestoreFiles];

      if (!v31)
      {
        double v35 = CFAbsoluteTimeGetCurrent();
        v36 = MBGetDefaultLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 134217984;
          *(double *)((char *)&buf + 4) = v35 - Current;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Finished finding restorables in %.3fs", (uint8_t *)&buf, 0xCu);
          _MBLog();
        }

        id v30 = 0;
        BOOL v6 = 1;
        goto LABEL_53;
      }
      id v32 = MBGetDefaultLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v31;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to remove deleted restore files prior to restore: %@", (uint8_t *)&buf, 0xCu);
        _MBLog();
      }

      if (!a3)
      {
        BOOL v6 = 0;
        id v30 = v31;
        goto LABEL_53;
      }
      id v33 = v31;
    }
    else
    {
      id v34 = MBGetDefaultLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v30;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to compute signature retain counts: %@", (uint8_t *)&buf, 0xCu);
        _MBLog();
      }

      if (!a3)
      {
        BOOL v6 = 0;
        goto LABEL_53;
      }
      id v33 = v30;
    }
    id v30 = v33;
    BOOL v6 = 0;
    *a3 = v33;
LABEL_53:

LABEL_54:
    _Block_object_dispose(&v72, 8);
LABEL_55:

    uint64_t v5 = v46;
    goto LABEL_56;
  }
  BOOL v4 = MBGetDefaultLog();
  uint64_t v5 = v4;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Skipping findRestorables when restoring assets from file lists", (uint8_t *)&buf, 2u);
    _MBLog();
    BOOL v6 = 1;
    uint64_t v5 = v4;
  }
  else
  {
    BOOL v6 = 1;
  }
LABEL_56:

  return v6;
}

- (BOOL)_uninstallExistingAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MBCKEngine *)self serviceAccount];
  if (!v7) {
    __assert_rtn("-[MBCKRestoreEngine _uninstallExistingAppWithBundleID:error:]", "MBCKRestoreEngine.m", 1039, "serviceAccount");
  }
  id v8 = (void *)v7;
  id v9 = [(MBEngine *)self settingsContext];
  id v10 = [v9 mobileInstallation];

  if (!v10) {
    __assert_rtn("-[MBCKRestoreEngine _uninstallExistingAppWithBundleID:error:]", "MBCKRestoreEngine.m", 1041, "mobileInstallation");
  }
  unsigned int v11 = [(MBCKRestoreEngine *)self useFileLists];
  BOOL v12 = [v8 persona];
  if (v11)
  {
    BOOL v13 = 1;
    unsigned __int8 v14 = [v10 userAppWithBundleID:v6 placeholder:1 persona:v12 error:a4];

    if (!v14) {
      goto LABEL_20;
    }
LABEL_8:
    uint64_t v17 = [MBApp alloc];
    BOOL v18 = [(MBCKEngine *)self persona];
    id v19 = [v18 userDataVolume];
    uint64_t v20 = [(MBContainer *)v17 initWithPropertyList:v14 volumeMountPoint:v19];

    LODWORD(v18) = [(MBApp *)v20 isSystemApp];
    uint64_t v21 = MBGetDefaultLog();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v22)
      {
        *(_DWORD *)long long buf = 138412290;
        id v27 = v6;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Not uninstalling system app with bundleID %@", buf, 0xCu);
        _MBLog();
      }
    }
    else
    {
      if (v22)
      {
        *(_DWORD *)long long buf = 138412290;
        id v27 = v6;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Uninstalling 2nd party factory-installed app %@", buf, 0xCu);
        _MBLog();
      }

      id v25 = 0;
      [v10 uninstallAppWithBundleID:v6 error:&v25];
      uint64_t v21 = v25;
      if (v21)
      {
        int v23 = MBGetDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          id v27 = v6;
          __int16 v28 = 2112;
          unsigned __int8 v29 = v21;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to uninstall %{public}@: %@", buf, 0x16u);
          _MBLog();
        }

        BOOL v13 = 0;
        goto LABEL_19;
      }
    }
    BOOL v13 = 1;
LABEL_19:

    goto LABEL_20;
  }
  unsigned __int8 v14 = [v10 userAppWithBundleID:v6 placeholder:0 persona:v12 error:a4];

  if (v14)
  {
    id v15 = [v14 objectForKeyedSubscript:@"IsInstalled"];
    unsigned int v16 = [v15 BOOLValue];

    if (v16) {
      goto LABEL_8;
    }
  }
  BOOL v13 = 1;
LABEL_20:

  return v13;
}

- (id)_fetchDomainNamesToForegroundRestoreWithError:(id *)a3
{
  uint64_t v5 = [(MBCKEngine *)self ckOperationTracker];
  if (!v5) {
    __assert_rtn("-[MBCKRestoreEngine _fetchDomainNamesToForegroundRestoreWithError:]", "MBCKRestoreEngine.m", 1075, "tracker");
  }
  id v6 = v5;
  uint64_t v7 = [v5 account];
  if (!v7) {
    __assert_rtn("-[MBCKRestoreEngine _fetchDomainNamesToForegroundRestoreWithError:]", "MBCKRestoreEngine.m", 1077, "serviceAccount");
  }
  id v8 = (void *)v7;
  uint64_t v9 = [(MBEngine *)self domainManager];
  if (!v9) {
    __assert_rtn("-[MBCKRestoreEngine _fetchDomainNamesToForegroundRestoreWithError:]", "MBCKRestoreEngine.m", 1079, "domainManager");
  }
  id v10 = (void *)v9;
  unsigned int v11 = self->_targetSnapshot;
  if (!v11) {
    __assert_rtn("-[MBCKRestoreEngine _fetchDomainNamesToForegroundRestoreWithError:]", "MBCKRestoreEngine.m", 1081, "targetSnapshot");
  }
  BOOL v12 = v11;
  BOOL v13 = objc_opt_new();
  unsigned __int8 v14 = objc_opt_new();
  v135[0] = _NSConcreteStackBlock;
  v135[1] = 3221225472;
  v135[2] = sub_100073D94;
  v135[3] = &unk_100411568;
  v135[4] = self;
  id v93 = v13;
  id v136 = v93;
  id v92 = v10;
  id v137 = v92;
  id v15 = v14;
  id v138 = v15;
  unsigned int v16 = objc_retainBlock(v135);
  id v107 = v15;
  if ([(MBCKRestoreEngine *)self useFileLists])
  {
    uint64_t v17 = self;
    BOOL v18 = [(MBCKRestoreEngine *)self _populatedRestorePlan];
    if (!v18) {
      __assert_rtn("-[MBCKRestoreEngine _fetchDomainNamesToForegroundRestoreWithError:]", "MBCKRestoreEngine.m", 1122, "plan");
    }
    id v19 = v18;
    id v134 = 0;
    unsigned __int8 v20 = [v18 enumerateDomainNamesPendingRestoreWithError:&v134 enumerator:v16];
    id v21 = v134;
    BOOL v22 = v21;
    if ((v20 & 1) == 0)
    {
      if (a3) {
        *a3 = v21;
      }
      __int16 v28 = MBGetDefaultLog();
      id v15 = v107;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v143 = (uint64_t)v22;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to enumerate restorable domains from plan: %@", buf, 0xCu);
        _MBLog();
      }

      goto LABEL_23;
    }
    id v133 = v21;
    v132[0] = _NSConcreteStackBlock;
    v132[1] = 3221225472;
    v132[2] = sub_100073FC0;
    v132[3] = &unk_100411590;
    v132[4] = self;
    unsigned __int8 v23 = [v19 enumerateBundleIDsWithPlaceholderIPAsWithError:&v133 enumerator:v132];
    id v24 = v133;

    if ((v23 & 1) == 0)
    {
      if (a3) {
        *a3 = v24;
      }
      uint64_t v75 = MBGetDefaultLog();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v143 = (uint64_t)v24;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to enumerate app bundleIDs from plan: %@", buf, 0xCu);
        _MBLog();
      }

      id v29 = 0;
      id v15 = v107;
      goto LABEL_24;
    }

    id v15 = v107;
  }
  else
  {
    id v25 = [(MBCKEngine *)self cache];
    v130[0] = _NSConcreteStackBlock;
    v130[1] = 3221225472;
    v130[2] = sub_1000740A4;
    v130[3] = &unk_1004115B8;
    v131 = v16;
    id v26 = [v25 enumeratePendingRestorableDomainsWithCallback:v130];

    if (v26)
    {
      if (a3) {
        *a3 = v26;
      }
      id v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v143 = (uint64_t)v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to enumerate restorable domains from cache: %@", buf, 0xCu);
        _MBLog();
      }

      goto LABEL_23;
    }
    uint64_t v17 = self;
    id v19 = v131;
  }

  if ([(MBCKEngine *)v17 handleCancelation:a3])
  {
LABEL_23:
    id v29 = 0;
    goto LABEL_24;
  }
  v89 = v12;
  v90 = v8;
  id v91 = v6;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  p_isa = (id *)&v17->super.super.super.isa;
  id obj = [(MBAppManager *)v17->super.super._appManager allPlugins];
  v97 = (char *)[obj countByEnumeratingWithState:&v126 objects:v151 count:16];
  unsigned __int8 v98 = v16;
  if (v97)
  {
    uint64_t v96 = *(void *)v127;
    do
    {
      v31 = 0;
      do
      {
        if (*(void *)v127 != v96) {
          objc_enumerationMutation(obj);
        }
        v103 = v31;
        id v32 = *(void **)(*((void *)&v126 + 1) + 8 * (void)v31);
        id v33 = [v32 identifier];
        id v34 = [v32 domain];
        uint64_t v35 = [v34 name];

        v36 = MBGetDefaultLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = [v32 containerTypeString];
          *(_DWORD *)long long buf = 138412802;
          uint64_t v143 = v35;
          __int16 v144 = 2112;
          v145 = v33;
          __int16 v146 = 2112;
          v147 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Adding plugin %@/%@ (%@)", buf, 0x20u);

          [v32 containerTypeString];
          v87 = id v86 = v33;
          v85 = (void *)v35;
          _MBLog();
        }
        v99 = (void *)v35;
        [v15 addObject:v35];
        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        v106 = [v32 allAppGroupContainers];
        id v38 = [v106 countByEnumeratingWithState:&v122 objects:v150 count:16];
        if (v38)
        {
          id v39 = v38;
          uint64_t v40 = *(void *)v123;
          do
          {
            for (i = 0; i != v39; i = (char *)i + 1)
            {
              if (*(void *)v123 != v40) {
                objc_enumerationMutation(v106);
              }
              unsigned int v42 = *(void **)(*((void *)&v122 + 1) + 8 * i);
              v43 = MBGetDefaultLog();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v44 = [v42 domain];
                id v45 = [v44 name];
                v46 = [v42 identifier];
                id v47 = [v42 containerTypeString];
                *(_DWORD *)long long buf = 138413058;
                uint64_t v143 = (uint64_t)v45;
                __int16 v144 = 2112;
                v145 = v46;
                __int16 v146 = 2112;
                v147 = v47;
                __int16 v148 = 2112;
                v149 = v33;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Adding app group container %@/%@ (%@) for %@", buf, 0x2Au);

                id v48 = [v42 domain];
                id v49 = [v48 name];
                id v50 = [v42 identifier];
                v87 = [v42 containerTypeString];
                v88 = v33;
                v85 = v49;
                id v86 = v50;
                _MBLog();

                id v15 = v107;
              }

              v51 = [v42 domain];
              id v52 = [v51 name];
              [v15 addObject:v52];
            }
            id v39 = [v106 countByEnumeratingWithState:&v122 objects:v150 count:16];
          }
          while (v39);
        }

        v31 = v103 + 1;
        unsigned int v16 = v98;
      }
      while (v103 + 1 != v97);
      v97 = (char *)[obj countByEnumeratingWithState:&v126 objects:v151 count:16];
    }
    while (v97);
  }

  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v104 = [p_isa[6] allApps];
  id v53 = [v104 countByEnumeratingWithState:&v118 objects:v141 count:16];
  if (v53)
  {
    id v54 = v53;
    uint64_t v55 = *(void *)v119;
    uint64_t v100 = *(void *)v119;
    do
    {
      uint64_t v56 = 0;
      contexta = v54;
      do
      {
        if (*(void *)v119 != v55) {
          objc_enumerationMutation(v104);
        }
        uint64_t v57 = *(void **)(*((void *)&v118 + 1) + 8 * (void)v56);
        if (objc_msgSend(v57, "isSystemApp", v85, v86, v87, v88))
        {
          v58 = [v57 containerDir];

          if (v58)
          {
            v105 = v56;
            long long v116 = 0u;
            long long v117 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            uint64_t v59 = [v57 uniqueContainers];
            id v60 = [v59 countByEnumeratingWithState:&v114 objects:v140 count:16];
            if (v60)
            {
              id v61 = v60;
              uint64_t v62 = *(void *)v115;
              do
              {
                for (j = 0; j != v61; j = (char *)j + 1)
                {
                  if (*(void *)v115 != v62) {
                    objc_enumerationMutation(v59);
                  }
                  long long v64 = *(void **)(*((void *)&v114 + 1) + 8 * (void)j);
                  if (objc_msgSend(v64, "containerType", v85) - 1 <= 2)
                  {
                    uint64_t v65 = MBGetDefaultLog();
                    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v66 = [v64 domain];
                      id v67 = [v66 name];
                      long long v68 = [v64 identifier];
                      long long v69 = [v64 containerTypeString];
                      *(_DWORD *)long long buf = 138412802;
                      uint64_t v143 = (uint64_t)v67;
                      __int16 v144 = 2112;
                      v145 = v68;
                      __int16 v146 = 2112;
                      v147 = v69;
                      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Adding container %@/%@ (%@)", buf, 0x20u);

                      long long v70 = [v64 domain];
                      long long v71 = [v70 name];
                      uint64_t v72 = [v64 identifier];
                      [v64 containerTypeString];
                      v87 = id v86 = v72;
                      v85 = v71;
                      _MBLog();

                      id v15 = v107;
                    }

                    long long v73 = [v64 domain];
                    uint64_t v74 = [v73 name];
                    [v15 addObject:v74];
                  }
                }
                id v61 = [v59 countByEnumeratingWithState:&v114 objects:v140 count:16];
              }
              while (v61);
            }

            unsigned int v16 = v98;
            uint64_t v55 = v100;
            id v54 = contexta;
            uint64_t v56 = v105;
          }
        }
        uint64_t v56 = (char *)v56 + 1;
      }
      while (v56 != v54);
      id v54 = [v104 countByEnumeratingWithState:&v118 objects:v141 count:16];
    }
    while (v54);
  }

  if ([p_isa useFileLists])
  {
    [v15 intersectSet:v93];
  }
  else
  {
    v76 = +[NSMutableSet set];
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v77 = v15;
    id v78 = [v77 countByEnumeratingWithState:&v110 objects:v139 count:16];
    if (v78)
    {
      id v79 = v78;
      uint64_t v80 = *(void *)v111;
      do
      {
        for (k = 0; k != v79; k = (char *)k + 1)
        {
          if (*(void *)v111 != v80) {
            objc_enumerationMutation(v77);
          }
          uint64_t v82 = *(void *)(*((void *)&v110 + 1) + 8 * (void)k);
          __int16 v83 = objc_msgSend(p_isa, "cache", v85);
          v108[0] = _NSConcreteStackBlock;
          v108[1] = 3221225472;
          v108[2] = sub_1000740B8;
          v108[3] = &unk_1004115E0;
          v108[4] = v82;
          id v109 = v76;
          id v84 = [v83 fetchPendingRestoreSizeForDomain:v82 callback:v108];
        }
        id v79 = [v77 countByEnumeratingWithState:&v110 objects:v139 count:16];
      }
      while (v79);
    }

    [v77 minusSet:v76];
    id v15 = v107;
    unsigned int v16 = v98;
  }
  id v29 = v15;
  id v8 = v90;
  id v6 = v91;
  BOOL v12 = v89;
LABEL_24:

  return v29;
}

- (BOOL)_downloadRestorablesForForegroundWithError:(id *)a3
{
  uint64_t v5 = -[MBCKRestoreEngine _fetchDomainNamesToForegroundRestoreWithError:](self, "_fetchDomainNamesToForegroundRestoreWithError:");
  if (v5)
  {
    [(MBRestorePolicy *)self->_restorePolicy setDomainNamesToForegroundRestore:v5];
    id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
    [(MBCKRestoreEngine *)self setForegroundRestorableDomainCount:v6];

    uint64_t v7 = self->_targetSnapshot;
    if (!v7) {
      __assert_rtn("-[MBCKRestoreEngine _downloadRestorablesForForegroundWithError:]", "MBCKRestoreEngine.m", 1213, "targetSnapshot");
    }
    id v8 = v7;
    if ([(MBCKRestoreEngine *)self useFileLists]) {
      unsigned __int8 v9 = [(MBCKRestoreEngine *)self _restoreForegroundFilesUsingPlanForDomainNames:v5 error:a3];
    }
    else {
      unsigned __int8 v9 = [(MBCKRestoreEngine *)self _restoreForegroundFilesUsingCKCacheForDomainNames:v5 error:a3];
    }
    BOOL v10 = v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_restoreDomainEngineForDomain:(id)a3 plan:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MBCKEngine *)self device];
  if (!v10) {
    __assert_rtn("-[MBCKRestoreEngine _restoreDomainEngineForDomain:plan:error:]", "MBCKRestoreEngine.m", 1224, "device");
  }
  unsigned int v11 = (void *)v10;
  uint64_t v12 = [(MBCKEngine *)self ckOperationTracker];
  if (!v12) {
    __assert_rtn("-[MBCKRestoreEngine _restoreDomainEngineForDomain:plan:error:]", "MBCKRestoreEngine.m", 1226, "tracker");
  }
  BOOL v13 = (void *)v12;
  uint64_t v14 = [(MBCKEngine *)self persona];
  if (!v14) {
    __assert_rtn("-[MBCKRestoreEngine _restoreDomainEngineForDomain:plan:error:]", "MBCKRestoreEngine.m", 1228, "persona");
  }
  id v15 = (void *)v14;
  unsigned int v16 = [(MBCKRestoreEngine *)self restorePolicy];
  uint64_t v17 = [v16 restoreRootForDomain:v8];

  if ([(MBEngine *)self isForegroundRestore]
    && !+[MBFileOperation createDirectories:4294967294 destinationBasePath:@"/" destinationRpath:v17 permissions:493 error:a5])
  {
    id v26 = 0;
  }
  else
  {
    BOOL v18 = +[MBRestoreDepot restoreDepotWithPersona:v15 destination:v17 restoreDepotOverridePath:0 error:a5];
    if (v18)
    {
      id v19 = objc_msgSend(v9, "planForDomain:restoreType:error:", v8, -[MBCKRestoreEngine restoreType](self, "restoreType"), a5);
      if (v19)
      {
        unsigned __int8 v20 = +[MBAssetRecordFetcher assetFetcherWithOperationTracker:v13 device:v11 error:a5];
        if (v20)
        {
          id v39 = v20;
          uint64_t v40 = v11;
          v37 = v19;
          uint64_t v41 = v9;
          id v21 = [(MBCKRestoreEngine *)self targetSnapshot];
          id v38 = v21;
          if ([(MBEngine *)self isBackgroundRestore]
            && (id v32 = [v21 snapshotFormat],
                [(MBCKEngine *)self serviceAccount],
                BOOL v22 = objc_claimAutoreleasedReturnValue(),
                unsigned int v35 = +[MBRestoreSnapshotIntegrityVerifier shouldRunVerifierForRestoreWithSnapshotFormat:v32 account:v22], v22, v35))
          {
            id v33 = [MBRestoreSnapshotIntegrityVerifier alloc];
            v36 = [(MBCKRestoreEngine *)self restorePolicy];
            id v30 = [v21 snapshotFormat];
            unsigned __int8 v23 = [v41 restoreSnapshotsDirectoryRoot];
            id v24 = [v21 snapshotID];
            id v25 = [(MBRestoreSnapshotIntegrityVerifier *)v33 initWithPolicy:v36 snapshotFormat:v30 snapshotDir:v23 snapshotUUID:v24 delegate:self];
          }
          else
          {
            id v25 = 0;
          }
          id v34 = [MBRestoreDomainEngine alloc];
          v31 = [(MBCKRestoreEngine *)self restorePolicy];
          id v27 = [(MBCKEngine *)self progressModel];
          __int16 v28 = [(MBCKRestoreEngine *)self restoreLogger];
          id v19 = v37;
          id v26 = [(MBRestoreDomainEngine *)v34 initWithRootPath:v17 policy:v31 depot:v18 fetcher:v39 plan:v37 progress:v27 verifier:v25 logger:v28 error:a5];

          unsigned __int8 v20 = v39;
          unsigned int v11 = v40;
          id v9 = v41;
        }
        else
        {
          id v26 = 0;
        }
      }
      else
      {
        id v26 = 0;
      }
    }
    else
    {
      id v26 = 0;
    }
  }
  return v26;
}

- (BOOL)_restoreForegroundFilesUsingPlanForDomainNames:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MBCKRestoreEngine *)self _populatedRestorePlan];
  if (!v7) {
    __assert_rtn("-[MBCKRestoreEngine _restoreForegroundFilesUsingPlanForDomainNames:error:]", "MBCKRestoreEngine.m", 1279, "plan");
  }
  id v8 = (void *)v7;
  id v9 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v11 = dispatch_queue_create("com.apple.MobileBackup.ForegroundRestore", v10);
  uint64_t v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109120;
    unsigned int v16 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "=ckrestore-engine= Performing restore for %u foreground domains using plan", buf, 8u);
    [v6 count];
    _MBLog();
  }

  BOOL v13 = [(MBCKRestoreEngine *)self _restoreDomains:v6 plan:v8 withQueue:v11 concurrencyLimit:6 error:a4];
  return v13;
}

- (BOOL)_restoreDomains:(id)a3 plan:(id)a4 withQueue:(id)a5 concurrencyLimit:(unint64_t)a6 error:(id *)a7
{
  id v29 = a3;
  id v34 = a4;
  id v33 = a5;
  dispatch_queue_t v11 = [(MBCKEngine *)self progressModel];
  unsigned int v12 = [v34 addRemainingProgress:v11 forDomainNames:v29 error:a7];

  if (v12)
  {
    BOOL v13 = dispatch_semaphore_create(a6);
    group = dispatch_group_create();
    uint64_t v14 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v29;
    id v15 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v15)
    {
      uint64_t v31 = *(void *)v41;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * v16);
        if ([v14 count]) {
          break;
        }
        BOOL v18 = [(MBEngine *)self domainManager];
        id v19 = [v18 domainForName:v17];

        if (!v19) {
          __assert_rtn("-[MBCKRestoreEngine _restoreDomains:plan:withQueue:concurrencyLimit:error:]", "MBCKRestoreEngine.m", 1306, "domain");
        }
        id v39 = 0;
        unsigned __int8 v20 = [(MBCKRestoreEngine *)self _restoreDomainEngineForDomain:v19 plan:v34 error:&v39];
        id v21 = v39;
        if (!v20)
        {
          id v24 = MBGetDefaultLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v45 = v21;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to create restore domain engine: %@", buf, 0xCu);
            _MBLog();
          }

          id v25 = v14;
          objc_sync_enter(v25);
          [v25 addObject:v21];
          objc_sync_exit(v25);

          break;
        }
        dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100074BC8;
        block[3] = &unk_100411608;
        block[4] = v17;
        id v36 = v20;
        id v37 = v14;
        id v38 = v13;
        id v22 = v20;
        dispatch_group_async(group, v33, block);

        if (v15 == (id)++v16)
        {
          id v15 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
          if (v15) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    id v26 = [v14 count];
    BOOL v23 = v26 == 0;
    if (a7 && v26)
    {
      *a7 = +[MBError errorWithErrors:v14];
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)_restoreForegroundFilesUsingCKCacheForDomainNames:(id)a3 error:(id *)a4
{
  id v79 = a3;
  uint64_t v5 = [(MBCKEngine *)self cache];
  uint64_t v81 = [v5 tracker];

  if (!v81) {
    __assert_rtn("-[MBCKRestoreEngine _restoreForegroundFilesUsingCKCacheForDomainNames:error:]", "MBCKRestoreEngine.m", 1341, "cacheTracker");
  }
  id v141 = 0;
  v85 = [v81 openCacheWithAccessType:2 cached:0 error:&v141];
  double v6 = COERCE_DOUBLE(v141);
  if (!v85)
  {
    id v67 = MBGetDefaultLog();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      double v144 = v6;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to re-open cache for restore enumeration: %@", buf, 0xCu);
      _MBLog();
    }

    if (a4)
    {
      double v6 = COERCE_DOUBLE(*(id *)&v6);
      char v82 = 0;
      *(double *)a4 = v6;
    }
    else
    {
      char v82 = 0;
    }
    goto LABEL_49;
  }
  uint64_t v7 = +[NSDate date];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;

  uint64_t v137 = 0;
  id v138 = &v137;
  uint64_t v139 = 0x2020000000;
  uint64_t v140 = 0;
  uint64_t v133 = 0;
  id v134 = &v133;
  uint64_t v135 = 0x2020000000;
  int v136 = 0;
  uint64_t v129 = 0;
  v130 = &v129;
  uint64_t v131 = 0x2020000000;
  uint64_t v132 = 0;
  v124[0] = _NSConcreteStackBlock;
  v124[1] = 3221225472;
  v124[2] = sub_100075C20;
  v124[3] = &unk_100411630;
  long long v126 = &v129;
  v124[4] = self;
  id v10 = v79;
  id v125 = v10;
  long long v127 = &v137;
  long long v128 = &v133;
  dispatch_queue_t v11 = [v85 enumeratePendingRestoreFilesForAnyDomainOrderAscendingWithBlock:v124];

  unsigned int v12 = [(MBCKEngine *)self progressModel];
  [v12 willTransferItemsWithSize:v138[3] count:*((unsigned int *)v134 + 6)];

  +[NSDate timeIntervalSinceReferenceDate];
  double v14 = v13;
  id v15 = MBGetDefaultLog();
  double v16 = v14 - v9;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = (void *)v138[3];
    uint64_t v18 = *((unsigned int *)v134 + 6);
    *(_DWORD *)long long buf = 134218496;
    double v144 = v16;
    __int16 v145 = 2048;
    id v146 = v17;
    __int16 v147 = 2048;
    uint64_t v148 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Preflight: duration:%.3fs, fgTotalRestorableSize:%llu, fgTotalRestorableCount:%lu", buf, 0x20u);
    id v73 = (id)v138[3];
    uint64_t v74 = *((unsigned int *)v134 + 6);
    double v72 = v16;
    _MBLog();
  }

  [(MBCKRestoreEngine *)self _purgeBeforeRestoring:v130[3]];
  id v19 = +[NSDate date];
  [v19 timeIntervalSinceReferenceDate];
  double v21 = v20;

  id v78 = [[MBCKRestoreFilePrefetchEngine alloc] initWithRestoreEngine:self];
  if (![(MBCKRestoreFilePrefetchEngine *)v78 setUpWithError:a4])
  {
    [v85 close];
    char v82 = 0;
    goto LABEL_48;
  }
  uint64_t v120 = 0;
  long long v121 = &v120;
  uint64_t v122 = 0x2020000000;
  uint64_t v123 = 0;
  uint64_t v116 = 0;
  long long v117 = &v116;
  uint64_t v118 = 0x2020000000;
  uint64_t v119 = 0;
  uint64_t v112 = 0;
  long long v113 = &v112;
  uint64_t v114 = 0x2020000000;
  uint64_t v115 = 0;
  uint64_t v108 = 0;
  id v109 = (double *)&v108;
  uint64_t v110 = 0x2020000000;
  uint64_t v111 = 0;
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x2020000000;
  uint64_t v107 = 0;
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x2020000000;
  uint64_t v103 = 0;
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_100075D34;
  v91[3] = &unk_100411658;
  v91[4] = self;
  id v22 = v10;
  id v92 = v22;
  v94 = &v104;
  v95 = &v116;
  uint64_t v96 = &v112;
  v97 = &v100;
  BOOL v23 = v78;
  id v93 = v23;
  unsigned __int8 v98 = &v120;
  v99 = &v108;
  uint64_t v77 = [v85 enumeratePendingRestoreRegularFilesForAnyDomainOrderAscendingWithBlock:v91];

  id v24 = MBGetDefaultLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    double v25 = v109[3];
    id v26 = (void *)v121[3];
    uint64_t v27 = v101[3];
    uint64_t v28 = v113[3];
    uint64_t v29 = v105[3];
    *(_DWORD *)long long buf = 134219008;
    double v144 = v25;
    __int16 v145 = 2048;
    id v146 = v26;
    __int16 v147 = 2048;
    uint64_t v148 = v27;
    __int16 v149 = 2048;
    uint64_t v150 = v28;
    __int16 v151 = 2048;
    uint64_t v152 = v29;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Preflight: fgRestoreSize:%llu, fgRestoreCount:%llu, fgPrefetchRestoreSize:%llu, fgPrefetchRestoreCount:%llu, bgRestoreSize:%llu", buf, 0x34u);
    uint64_t v75 = v113[3];
    uint64_t v76 = v105[3];
    id v73 = (id)v121[3];
    uint64_t v74 = v101[3];
    double v72 = v109[3];
    _MBLog();
  }

  id v30 = +[NSNumber numberWithDouble:v16];
  uint64_t v31 = [(MBCKEngine *)self performanceStatistics];
  [v31 setObject:v30 forKeyedSubscript:@"PreflightTime"];

  id v32 = +[NSNumber numberWithUnsignedLongLong:v121[3]];
  id v33 = [(MBCKEngine *)self performanceStatistics];
  [v33 setObject:v32 forKeyedSubscript:@"ForegroundRestoreItems"];

  id v34 = +[NSNumber numberWithUnsignedLongLong:v113[3]];
  unsigned int v35 = [(MBCKEngine *)self performanceStatistics];
  [v35 setObject:v34 forKeyedSubscript:@"ForegroundPrefetchItems"];

  id v36 = +[NSNumber numberWithUnsignedLongLong:v101[3]];
  id v37 = [(MBCKEngine *)self performanceStatistics];
  [v37 setObject:v36 forKeyedSubscript:@"ForegroundPrefetchSize"];

  id v38 = +[NSNumber numberWithUnsignedLongLong:v105[3]];
  id v39 = [(MBCKEngine *)self performanceStatistics];
  [v39 setObject:v38 forKeyedSubscript:@"BackgroundRestoreSize"];

  long long v40 = +[NSNumber numberWithUnsignedLongLong:v117[3]];
  long long v41 = [(MBCKEngine *)self performanceStatistics];
  [v41 setObject:v40 forKeyedSubscript:@"BackgroundRestoreItems"];

  long long v42 = +[NSNumber numberWithUnsignedLongLong:*((void *)v109 + 3)];
  [(MBCKRestoreEngine *)self setForegroundRestorableSize:v42];

  long long v43 = +[NSNumber numberWithUnsignedLongLong:v105[3]];
  [(MBCKRestoreEngine *)self setBackgroundRestorableSize:v43];

  uint64_t v44 = +[NSNumber numberWithUnsignedLongLong:v121[3]];
  [(MBCKRestoreEngine *)self setForegroundRestorableFileCount:v44];

  id v45 = +[NSNumber numberWithUnsignedLongLong:v117[3]];
  [(MBCKRestoreEngine *)self setBackgroundRestorableFileCount:v45];

  [(MBCKRestoreFilePrefetchEngine *)v23 waitForPrefetchCompletion];
  +[NSDate timeIntervalSinceReferenceDate];
  double v47 = v46 - v21;
  id v48 = +[NSNumber numberWithDouble:v47];
  id v49 = [(MBCKEngine *)self performanceStatistics];
  [v49 setObject:v48 forKeyedSubscript:@"PrefetchTime"];

  id v50 = MBGetDefaultLog();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    double v144 = v47;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Prefetch: duration:%.3fs", buf, 0xCu);
    double v72 = v47;
    _MBLog();
  }

  v51 = +[NSDate date];
  [v51 timeIntervalSinceReferenceDate];
  double v53 = v52;

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = v22;
  id v54 = 0;
  id v55 = [obj countByEnumeratingWithState:&v87 objects:v142 count:16];
  if (!v55)
  {
    char v82 = 1;
LABEL_43:

    goto LABEL_45;
  }
  char v82 = 1;
  uint64_t v83 = *(void *)v88;
LABEL_12:
  uint64_t v56 = 0;
  while (1)
  {
    if (*(void *)v88 != v83) {
      objc_enumerationMutation(obj);
    }
    double v57 = *(double *)(*((void *)&v87 + 1) + 8 * v56);
    if (-[MBCKEngine handleCancelation:](self, "handleCancelation:", a4, *(void *)&v72, v73, v74, v75, v76))
    {
      [v85 close];

LABEL_41:
      char v82 = 0;
      goto LABEL_47;
    }
    uint64_t v59 = MBGetDefaultLog();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      double v144 = v57;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Restoring domain %{public}@", buf, 0xCu);
      double v72 = v57;
      _MBLog();
    }

    uint64_t v60 = [(MBEngine *)self domainManager];
    id v61 = [(id)v60 domainForName:*(void *)&v57];

    uint64_t v62 = [[MBCKRestoreDomainEngine alloc] initWithRestoreEngine:self enumeratorCache:v85 domain:v61];
    id v86 = v54;
    LOBYTE(v60) = [(MBCKRestoreDomainEngine *)v62 runWithError:&v86];
    id v63 = v86;

    id v54 = v63;
    if (v60)
    {
      int v64 = 0;
      int v65 = 0;
    }
    else
    {
      if ([v61 isPlaceholderAppDomain]
        && !+[MBError isRetryableRestoreError:v63])
      {
        uint64_t v66 = MBGetDefaultLog();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          double v144 = v57;
          __int16 v145 = 2112;
          id v146 = v63;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Ignoring placeholder failure: to restore domain %@: %@", buf, 0x16u);
          double v72 = v57;
          id v73 = v63;
          _MBLog();
        }
        int v64 = 0;
        int v65 = 19;
      }
      else
      {
        uint64_t v66 = MBGetDefaultLog();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          double v144 = v57;
          __int16 v145 = 2112;
          id v146 = v63;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to restore domain %@: %@", buf, 0x16u);
          double v72 = v57;
          id v73 = v63;
          _MBLog();
        }
        char v82 = 0;
        int v65 = 18;
        int v64 = 1;
      }
    }
    if (v65 != 19)
    {
      if (v65) {
        break;
      }
    }
    if (v55 == (id)++v56)
    {
      id v55 = [obj countByEnumeratingWithState:&v87 objects:v142 count:16];
      if (v55) {
        goto LABEL_12;
      }
      goto LABEL_43;
    }
  }

  if (!v64) {
    goto LABEL_41;
  }
LABEL_45:
  +[NSDate timeIntervalSinceReferenceDate];
  long long v69 = +[NSNumber numberWithDouble:v68 - v53];
  long long v70 = [(MBCKEngine *)self performanceStatistics];
  [v70 setObject:v69 forKeyedSubscript:@"RestoreTime"];

  [v85 close];
  if (!((a4 == 0) | v82 & 1))
  {
    id v54 = v54;
    char v82 = 0;
    *a4 = v54;
  }
LABEL_47:

  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(&v104, 8);
  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(&v116, 8);
  _Block_object_dispose(&v120, 8);
  dispatch_queue_t v11 = (void *)v77;
LABEL_48:

  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(&v133, 8);
  _Block_object_dispose(&v137, 8);
  double v6 = *(double *)&v11;
LABEL_49:

  return v82 & 1;
}

- (void)_purgeBeforeRestoring:(unint64_t)a3
{
  unint64_t v5 = MBFreeDiskSpace();
  unint64_t v6 = a3 + 0x140000000 - v5;
  if (a3 + 0x140000000 > v5)
  {
    uint64_t v7 = (void *)v5;
    if (v6 <= 0x140000000) {
      unint64_t v6 = 0x140000000;
    }
    unint64_t v32 = v6;
    double v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      uint64_t v44 = 0x140000000;
      __int16 v45 = 2048;
      double v46 = v7;
      __int16 v47 = 2048;
      unint64_t v48 = v32;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Disk space is too low to restore (%llu, %llu) - purging %llu bytes", buf, 0x20u);
      id v30 = v7;
      unint64_t v31 = v32;
      uint64_t v29 = 0x140000000;
      _MBLog();
    }

    double v9 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v10 = +[MBServiceAccount allServiceAccounts];
    id v11 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v38;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v38 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          double v16 = [MBCacheDeleteRequest alloc];
          uint64_t v17 = [v15 persona];
          uint64_t v18 = [v17 volumeMountPoint];
          id v19 = [(MBCacheDeleteRequest *)v16 initWithVolumePath:v18];

          [v9 addObject:v19];
        }
        id v12 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v12);
    }

    [(MBCKRestoreEngine *)self setCacheDeleteRequests:v9];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v20 = v9;
    id v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v34;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v20);
          }
          double v25 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
          if ([(MBEngine *)self isCanceled])
          {
            [v25 cancel];
          }
          else
          {
            id v26 = [v25 purge:v32];
            uint64_t v27 = MBGetDefaultLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v28 = [v25 volumePath];
              *(_DWORD *)long long buf = 134218242;
              uint64_t v44 = (uint64_t)v26;
              __int16 v45 = 2112;
              double v46 = v28;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= CacheDelete purged %llu bytes for %@", buf, 0x16u);

              [v25 volumePath];
              v30 = uint64_t v29 = (uint64_t)v26;
              _MBLog();
            }
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v22);
    }
  }
}

- (BOOL)_downloadRestorablesForBackgroundAppWithError:(id *)a3
{
  unint64_t v5 = [(MBCKEngine *)self context];
  unint64_t v6 = [v5 restoreMode];
  uint64_t v7 = [v6 bundleID];

  double v8 = [(MBEngine *)self appManager];
  double v9 = [(MBCKEngine *)self persona];
  id v30 = 0;
  id v10 = [v8 fetchAppWithIdentifier:v7 persona:v9 error:&v30];
  id v11 = v30;

  if (v10)
  {
    id v24 = a3;
    double v25 = v7;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = [v10 uniqueContainers];
    id v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v26 + 1) + 8 * i) domain];
          uint64_t v18 = [(MBEngine *)self domainManager];
          id v19 = [v17 name];
          [v18 addDomain:v17 forName:v19];
        }
        id v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v14);
    }

    if ([(MBCKRestoreEngine *)self useFileLists]) {
      unsigned __int8 v20 = [(MBCKRestoreEngine *)self _restoreBackgroundContainersUsingPlanForApp:v10 error:v24];
    }
    else {
      unsigned __int8 v20 = [(MBCKRestoreEngine *)self _restoreBackgroundContainersUsingCKCacheForApp:v10 error:v24];
    }
    BOOL v22 = v20;
    uint64_t v7 = v25;
  }
  else
  {
    id v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to load app: %@", buf, 0xCu);
      _MBLog();
    }

    BOOL v22 = 0;
    if (a3) {
      *a3 = v11;
    }
  }

  return v22;
}

- (BOOL)_restoreBackgroundContainersUsingPlanForApp:(id)a3 error:(id *)a4
{
  id v49 = a3;
  double v53 = [v49 bundleID];
  if (!v53) {
    __assert_rtn("-[MBCKRestoreEngine _restoreBackgroundContainersUsingPlanForApp:error:]", "MBCKRestoreEngine.m", 1544, "bundleID");
  }
  id v55 = [(MBCKRestoreEngine *)self _populatedRestorePlan];
  if (!v55) {
    __assert_rtn("-[MBCKRestoreEngine _restoreBackgroundContainersUsingPlanForApp:error:]", "MBCKRestoreEngine.m", 1546, "plan");
  }
  BOOL v4 = [(MBCKEngine *)self persona];
  uint64_t v56 = [v4 personaIdentifier];

  if (!v56) {
    __assert_rtn("-[MBCKRestoreEngine _restoreBackgroundContainersUsingPlanForApp:error:]", "MBCKRestoreEngine.m", 1548, "currentPersonaIdentifier");
  }
  if (qword_100482350 != -1) {
    dispatch_once(&qword_100482350, &stru_100411678);
  }
  unint64_t v5 = objc_opt_class();
  objc_sync_enter(v5);
  unint64_t v6 = [(id)qword_100482348 objectForKeyedSubscript:v56];
  if (!v6)
  {
    unint64_t v6 = objc_opt_new();
    uint64_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v73 = v56;
      __int16 v74 = 2048;
      uint64_t v75 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Creating empty active set for personaID %@ (%p)", buf, 0x16u);
      long long v42 = v56;
      uint64_t v44 = v6;
      _MBLog();
    }

    [(id)qword_100482348 setObject:v6 forKeyedSubscript:v56];
  }
  objc_sync_exit(v5);

  if (!v6) {
    __assert_rtn("-[MBCKRestoreEngine _restoreBackgroundContainersUsingPlanForApp:error:]", "MBCKRestoreEngine.m", 1565, "activeDomainRestoresForCurrentPersona");
  }
  id v54 = objc_opt_new();
  id v8 = v6;
  objc_sync_enter(v8);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  double v9 = [v49 uniqueContainers];
  id v10 = [v9 countByEnumeratingWithState:&v66 objects:v80 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v67;
LABEL_13:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v67 != v11) {
        objc_enumerationMutation(v9);
      }
      id v13 = objc_msgSend(*(id *)(*((void *)&v66 + 1) + 8 * v12), "domain", v42, v44);
      id v14 = [v13 name];
      id v65 = 0;
      uint64_t v15 = [v55 planForDomain:v13 restoreType:2 error:&v65];
      id v16 = v65;
      if (!v15) {
        break;
      }
      if ([v15 isPopulated])
      {
        if ([v8 containsObject:v14])
        {
          long long v38 = MBGetDefaultLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            long long v39 = v38;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              id v40 = [v8 count];
              *(_DWORD *)long long buf = 138413058;
              id v73 = v14;
              __int16 v74 = 2112;
              uint64_t v75 = v53;
              __int16 v76 = 2048;
              id v77 = v8;
              __int16 v78 = 2048;
              id v79 = v40;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Dependent domain %@ for %@ is actively being restored (%p: count %lu)", buf, 0x2Au);
            }

            [v8 count];
            _MBLog();
          }

          if (a4)
          {
            id v37 = +[MBError errorWithCode:17, @"Dependent domain %@ is actively being restored", v14 format];
LABEL_60:
            *a4 = v37;
          }
          goto LABEL_62;
        }
        [v54 addObject:v14];
      }
      else
      {
        uint64_t v17 = MBGetDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          id v73 = v14;
          __int16 v74 = 2112;
          uint64_t v75 = v53;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "=ckrestore-engine= Not restoring dependent domain %@ for bundleID %@", buf, 0x16u);
          long long v42 = v14;
          uint64_t v44 = v53;
          _MBLog();
        }
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v9 countByEnumeratingWithState:&v66 objects:v80 count:16];
        if (v10) {
          goto LABEL_13;
        }
        goto LABEL_25;
      }
    }
    long long v36 = MBGetDefaultLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v73 = v14;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed look up domain plan for domain %@", buf, 0xCu);
      _MBLog();
    }

    if (a4)
    {
      id v37 = v16;
      goto LABEL_60;
    }
    uint64_t v15 = 0;
LABEL_62:

    objc_sync_exit(v8);
    BOOL v52 = 0;
    long long v35 = v8;
    goto LABEL_63;
  }
LABEL_25:

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v18 = v54;
  id v19 = [v18 countByEnumeratingWithState:&v61 objects:v71 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v62;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v62 != v20) {
          objc_enumerationMutation(v18);
        }
        BOOL v22 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        uint64_t v23 = MBGetDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = v23;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            id v25 = [v8 count];
            *(_DWORD *)long long buf = 138413058;
            id v73 = v22;
            __int16 v74 = 2112;
            uint64_t v75 = v56;
            __int16 v76 = 2048;
            id v77 = v8;
            __int16 v78 = 2048;
            id v79 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Adding domain %@ to active set for personaID %@ (%p: count %lu)", buf, 0x2Au);
          }

          id v45 = v8;
          id v46 = [v8 count];
          uint64_t v44 = v56;
          _MBLog();
        }

        [v8 addObject:v22];
      }
      id v19 = [v18 countByEnumeratingWithState:&v61 objects:v71 count:16];
    }
    while (v19);
  }

  objc_sync_exit(v8);
  id v50 = +[NSString stringWithFormat:@"com.apple.MobileBackup.Background.%@", v53];
  dispatch_queue_t v47 = dispatch_queue_create((const char *)[v50 UTF8String], (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  BOOL v52 = -[MBCKRestoreEngine _restoreDomains:plan:withQueue:concurrencyLimit:error:](self, "_restoreDomains:plan:withQueue:concurrencyLimit:error:", v18, v55);
  id v26 = v8;
  objc_sync_enter(v26);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v27 = v18;
  id v28 = [v27 countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v58;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(void *)v58 != v29) {
          objc_enumerationMutation(v27);
        }
        unint64_t v31 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
        if (objc_msgSend(v26, "containsObject:", v31, v43, v44, v45, v46))
        {
          unint64_t v32 = MBGetDefaultLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            id v33 = v32;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              id v34 = [v26 count];
              *(_DWORD *)long long buf = 138413058;
              id v73 = v31;
              __int16 v74 = 2112;
              uint64_t v75 = v56;
              __int16 v76 = 2048;
              id v77 = v26;
              __int16 v78 = 2048;
              id v79 = v34;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Removing domain %@ from active set for personaID %@ (%p: count %lu)", buf, 0x2Au);
            }

            id v45 = v26;
            id v46 = [v26 count];
            long long v43 = v31;
            uint64_t v44 = v56;
            _MBLog();
          }

          [v26 removeObject:v31];
        }
      }
      id v28 = [v27 countByEnumeratingWithState:&v57 objects:v70 count:16];
    }
    while (v28);
  }

  objc_sync_exit(v26);
  long long v35 = v50;
LABEL_63:

  return v52;
}

- (BOOL)_restoreBackgroundContainersUsingCKCacheForApp:(id)a3 error:(id *)a4
{
  id v83 = a3;
  long long v89 = [v83 bundleID];
  if (qword_100482360 != -1) {
    dispatch_once(&qword_100482360, &stru_100411698);
  }
  id v86 = objc_opt_new();
  id obj = objc_opt_class();
  objc_sync_enter(obj);
  [v83 containers];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v101 objects:v120 count:16];
  if (v6)
  {
    uint64_t v87 = *(void *)v102;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v102 != v87) {
          objc_enumerationMutation(v5);
        }
        id v8 = *(void **)(*((void *)&v101 + 1) + 8 * i);
        if (-[MBCKEngine handleCancelation:](self, "handleCancelation:", a4, v77)) {
          goto LABEL_72;
        }
        double v9 = MBGetDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = v9;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            uint64_t v11 = [v8 identifier];
            uint64_t v12 = [v8 containerTypeString];
            *(_DWORD *)long long buf = 138412802;
            *(void *)&uint8_t buf[4] = v11;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v12;
            *(_WORD *)&buf[22] = 2112;
            long long v117 = v89;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "=ckrestore-engine= Restoring container %@ (%@) as a dependent of %@", buf, 0x20u);
          }
          id v13 = [v8 identifier];
          uint64_t v80 = [v8 containerTypeString];
          char v82 = v89;
          id v77 = v13;
          _MBLog();
        }
        uint64_t v97 = 0;
        unsigned __int8 v98 = &v97;
        uint64_t v99 = 0x2020000000;
        uint64_t v100 = 0;
        *(void *)long long buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        long long v117 = sub_1000728F8;
        uint64_t v118 = sub_100072908;
        id v119 = 0;
        id v14 = [(MBCKEngine *)self cache];
        uint64_t v15 = [v8 domain];
        id v16 = [v15 name];
        v96[0] = _NSConcreteStackBlock;
        v96[1] = 3221225472;
        v96[2] = sub_100078034;
        v96[3] = &unk_1004116C0;
        v96[4] = &v97;
        v96[5] = buf;
        uint64_t v17 = [v14 fetchDomainRestoreStateForDomain:v16 callback:v96];

        if (v17)
        {
          id v54 = MBGetDefaultLog();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            id v55 = v54;
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              uint64_t v56 = [v8 domain];
              long long v57 = [v56 name];
              *(_DWORD *)uint64_t v108 = 138412546;
              id v109 = v57;
              __int16 v110 = 2112;
              uint64_t v111 = v17;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to fetch domain state for dependent container %@: %@", v108, 0x16u);
            }
            long long v58 = [v8 domain];
            id v79 = [v58 name];
            _MBLog();
          }
          if (a4)
          {
LABEL_70:
            uint64_t v17 = v17;
            *a4 = v17;
          }
LABEL_71:
          _Block_object_dispose(buf, 8);

          _Block_object_dispose(&v97, 8);
LABEL_72:

          id v49 = obj;
          objc_sync_exit(obj);
          BOOL v53 = 0;
          goto LABEL_73;
        }
        if ((unint64_t)v98[3] <= 3)
        {
          uint64_t v18 = *(void *)&buf[8];
          id v19 = *(void **)(*(void *)&buf[8] + 40);
          if (v19)
          {
            unsigned __int8 v20 = [v19 isEqualToString:v89];
            uint64_t v18 = *(void *)&buf[8];
            if ((v20 & 1) == 0)
            {
              if ([(id)qword_100482358 containsObject:*(void *)(*(void *)&buf[8] + 40)])
              {
                id v65 = MBGetDefaultLog();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                {
                  long long v66 = v65;
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                  {
                    long long v67 = [v8 domain];
                    long long v68 = [v67 name];
                    long long v69 = (uint64_t (*)(uint64_t, uint64_t))v98[3];
                    uint64_t v70 = *(void *)(*(void *)&buf[8] + 40);
                    *(_DWORD *)uint64_t v108 = 138413058;
                    id v109 = v68;
                    __int16 v110 = 2048;
                    uint64_t v111 = v69;
                    __int16 v112 = 2112;
                    long long v113 = v89;
                    __int16 v114 = 2112;
                    uint64_t v115 = v70;
                    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Dependent domain %@ (state:%ld) for %@ is being restored by agent %@", v108, 0x2Au);
                  }
                  long long v71 = [v8 domain];
                  double v72 = [v71 name];
                  _MBLog();
                }
                if (a4)
                {
                  id v73 = [v8 domain];
                  __int16 v74 = [v73 name];
                  uint64_t v75 = +[NSString stringWithFormat:@"Dependent domain %@ is being restored by agent %@", v74, *(void *)(*(void *)&buf[8] + 40)];

                  v106[0] = NSLocalizedDescriptionKey;
                  v106[1] = @"RetryAfter";
                  v107[0] = v75;
                  v107[1] = @"5";
                  __int16 v76 = +[NSDictionary dictionaryWithObjects:v107 forKeys:v106 count:2];
                  *a4 = +[NSError errorWithDomain:@"MBErrorDomain" code:17 userInfo:v76];
                }
                uint64_t v17 = 0;
                goto LABEL_71;
              }
              uint64_t v18 = *(void *)&buf[8];
            }
          }
          id v21 = *(void **)(v18 + 40);
          if (v21 && ([v21 isEqualToString:v89] & 1) == 0)
          {
            BOOL v22 = MBGetDefaultLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v23 = v22;
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                id v24 = v5;
                id v25 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&buf[8] + 40);
                id v26 = [v8 domain];
                id v27 = [v26 name];
                *(_DWORD *)uint64_t v108 = 138412802;
                id v109 = v25;
                __int16 v110 = 2112;
                uint64_t v111 = v89;
                __int16 v112 = 2112;
                long long v113 = v27;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Changing the dependent domain from %@ to %@ for dependent %@", v108, 0x20u);

                id v5 = v24;
              }

              id v28 = *(void **)(*(void *)&buf[8] + 40);
              uint64_t v29 = [v8 domain];
              [v29 name];
              v82 = uint64_t v80 = v89;
              id v77 = v28;
              _MBLog();
            }
          }
          id v30 = [(MBCKEngine *)self cache];
          unint64_t v31 = [v8 domain];
          unint64_t v32 = [v31 name];
          uint64_t v17 = [v30 setDomainRestoreAgent:v89 forDomain:v32];

          if (v17)
          {
            long long v59 = MBGetDefaultLog();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              long long v60 = v59;
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              {
                long long v61 = [v8 domain];
                long long v62 = [v61 name];
                *(_DWORD *)uint64_t v108 = 138412802;
                id v109 = v89;
                __int16 v110 = 2112;
                uint64_t v111 = v62;
                __int16 v112 = 2112;
                long long v113 = v17;
                _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to set agent domain %@ for dependent %@: %@", v108, 0x20u);
              }
              long long v63 = [v8 domain];
              uint64_t v81 = [v63 name];
              _MBLog();
            }
            if (a4) {
              goto LABEL_70;
            }
            goto LABEL_71;
          }
          [v86 addObject:v8];
        }
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v97, 8);
      }
      id v6 = [v5 countByEnumeratingWithState:&v101 objects:v120 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if ((unint64_t)[v5 count] >= 2)
  {
    [(id)qword_100482358 addObject:v89];
    if ([v86 count])
    {
      id v33 = [(MBCKEngine *)self cache];
      [v33 flush];
    }
  }

  objc_sync_exit(obj);
  [v86 sortUsingComparator:&stru_100411700];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  obja = v86;
  id v34 = [obja countByEnumeratingWithState:&v92 objects:v105 count:16];
  if (v34)
  {
    uint64_t v88 = *(void *)v93;
    while (2)
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v93 != v88) {
          objc_enumerationMutation(obja);
        }
        long long v36 = objc_msgSend(*(id *)(*((void *)&v92 + 1) + 8 * (void)j), "domain", v77, v80);
        if ([(MBCKEngine *)self handleCancelation:a4])
        {

LABEL_64:
          BOOL v53 = 0;
          id v49 = obja;
          goto LABEL_73;
        }
        long long v38 = MBGetDefaultLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          long long v39 = v38;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            id v40 = [v36 name];
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v40;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Beginning restore for %@", buf, 0xCu);
          }
          id v77 = [v36 name];
          _MBLog();
        }
        long long v41 = [[MBCKRestoreDomainEngine alloc] initWithRestoreEngine:self enumeratorCache:0 domain:v36];
        id v91 = 0;
        unsigned __int8 v42 = [(MBCKRestoreDomainEngine *)v41 runWithError:&v91];
        id v43 = v91;
        if (v42)
        {
          int v44 = 0;
        }
        else
        {
          id v45 = MBGetDefaultLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            id v46 = v45;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              dispatch_queue_t v47 = [v36 name];
              *(_DWORD *)long long buf = 138412546;
              *(void *)&uint8_t buf[4] = v47;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v43;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to restore domain %@: %@", buf, 0x16u);
            }
            id v77 = [v36 name];
            uint64_t v80 = v43;
            _MBLog();
          }
          int v44 = 1;
        }

        if (a4) {
          *a4 = v43;
        }

        if (v44) {
          goto LABEL_64;
        }
      }
      id v34 = [obja countByEnumeratingWithState:&v92 objects:v105 count:16];
      if (v34) {
        continue;
      }
      break;
    }
  }

  unint64_t v48 = MBGetDefaultLog();
  id v49 = v48;
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    id v50 = [v83 domain];
    v51 = [v50 name];
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v51;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Restored domain %@ successfully", buf, 0xCu);

    BOOL v52 = [v83 domain];
    __int16 v78 = [v52 name];
    _MBLog();

    BOOL v53 = 1;
    id v49 = v48;
  }
  else
  {
    BOOL v53 = 1;
  }
LABEL_73:

  return v53;
}

- (id)_populatedRestorePlan
{
  v3 = [(MBCKSnapshot *)self->_targetSnapshot snapshotID];
  BOOL v4 = [(MBCKEngine *)self serviceManager];
  id v5 = [(MBCKEngine *)self serviceAccount];
  id v13 = 0;
  id v6 = [v4 restorePlanForAccount:v5 snapshotUUID:v3 error:&v13];
  id v7 = v13;

  if (!v6)
  {
    double v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to load restore plan: %@", buf, 0xCu);
LABEL_10:
      _MBLog();
    }
LABEL_11:

    id v11 = 0;
    goto LABEL_12;
  }
  unsigned int v8 = [v6 isPopulated];
  double v9 = MBGetDefaultLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (!v8)
  {
    if (v10)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "=ckrestore-engine= No plan", buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v10)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "=ckrestore-engine= Plan populated", buf, 2u);
    _MBLog();
  }

  id v11 = v6;
LABEL_12:

  return v11;
}

- (id)_restoreATCEngineForPlan:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MBCKEngine *)self persona];
  if (!v7) {
    __assert_rtn("-[MBCKRestoreEngine _restoreATCEngineForPlan:error:]", "MBCKRestoreEngine.m", 1760, "persona");
  }
  unsigned int v8 = (void *)v7;
  double v9 = [v6 domain];
  BOOL v10 = [v9 rootPath];

  if (!v10) {
    __assert_rtn("-[MBCKRestoreEngine _restoreATCEngineForPlan:error:]", "MBCKRestoreEngine.m", 1762, "rootPath");
  }
  id v11 = +[MBRestoreDepot restoreDepotWithPersona:v8 destination:v10 restoreDepotOverridePath:0 error:a4];
  if (v11)
  {
    uint64_t v12 = [(MBCKEngine *)self ckOperationTracker];
    if (!v12) {
      __assert_rtn("-[MBCKRestoreEngine _restoreATCEngineForPlan:error:]", "MBCKRestoreEngine.m", 1770, "tracker");
    }
    id v13 = (void *)v12;
    uint64_t v14 = [(MBCKEngine *)self device];
    if (!v14) {
      __assert_rtn("-[MBCKRestoreEngine _restoreATCEngineForPlan:error:]", "MBCKRestoreEngine.m", 1772, "device");
    }
    id v15 = (void *)v14;
    id v16 = +[MBAssetRecordFetcher assetFetcherWithOperationTracker:v13 device:v14 error:a4];
    if (v16)
    {
      [(MBCKRestoreEngine *)self restorePolicy];
      uint64_t v17 = v26 = v6;
      uint64_t v18 = [v17 deriveATCPolicy];

      id v19 = [_TtC7backupd18MBRestoreATCEngine alloc];
      [(MBCKEngine *)self progressModel];
      v20 = id v25 = v13;
      id v21 = [(MBCKRestoreEngine *)self restoreLogger];
      BOOL v22 = v19;
      id v6 = v26;
      uint64_t v23 = [(MBRestoreATCEngine *)v22 initWithRootPath:v10 policy:v18 depot:v11 fetcher:v16 plan:v26 progress:v20 verifier:0 logger:v21 error:a4];

      id v13 = v25;
    }
    else
    {
      uint64_t v23 = 0;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (BOOL)_downloadRestorablesForBackgroundFilesWithError:(id *)a3
{
  id v5 = [(MBCKEngine *)self context];
  id v6 = [v5 restoreMode];
  unsigned int v7 = [v6 type];

  unsigned int v8 = [(MBCKEngine *)self context];
  double v9 = [v8 restoreMode];
  BOOL v10 = v9;
  if (v7 == 5)
  {
    id v11 = [v9 paths];
  }
  else
  {
    uint64_t v12 = [v9 path];
    id v16 = v12;
    id v11 = +[NSArray arrayWithObjects:&v16 count:1];
  }
  if ([(MBCKRestoreEngine *)self useFileLists]) {
    unsigned __int8 v13 = [(MBCKRestoreEngine *)self _restoreATCFiles:v11 usingPlan:a3];
  }
  else {
    unsigned __int8 v13 = [(MBCKRestoreEngine *)self _restoreATCFiles:v11 usingCKCache:a3];
  }
  BOOL v14 = v13;

  return v14;
}

- (BOOL)_restoreATCFiles:(id)a3 usingPlan:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [(MBCKRestoreEngine *)self _populatedRestorePlan];
  if (!v7) {
    __assert_rtn("-[MBCKRestoreEngine _restoreATCFiles:usingPlan:]", "MBCKRestoreEngine.m", 1810, "restorePlan");
  }
  unsigned int v8 = v7;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100078824;
  v25[3] = &unk_100411728;
  v25[4] = self;
  double v9 = [v7 atcRestorePlansForAbsolutePaths:v6 domainProvider:v25 error:a4];
  BOOL v10 = v9;
  if (v9)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      id v20 = v6;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [(MBCKRestoreEngine *)self _restoreATCEngineForPlan:*(void *)(*((void *)&v21 + 1) + 8 * i) error:a4];
          uint64_t v17 = v16;
          if (!v16) {
            goto LABEL_16;
          }
          unsigned int v18 = [v16 runWithError:a4];

          if (!v18)
          {
            LOBYTE(v17) = 0;
LABEL_16:
            id v6 = v20;
            goto LABEL_17;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
        LOBYTE(v17) = 1;
        id v6 = v20;
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
      LOBYTE(v17) = 1;
    }
LABEL_17:
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return (char)v17;
}

- (BOOL)_restoreATCFiles:(id)a3 usingCKCache:(id *)a4
{
  id v6 = a3;
  v51 = [[MBCKRestoreFilePrefetchEngine alloc] initWithRestoreEngine:self];
  if ([(MBCKRestoreFilePrefetchEngine *)v51 setUpWithError:a4])
  {
    int v44 = a4;
    id v50 = [(MBEngine *)self domainManager];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v45 = v6;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v57 objects:v68 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v58;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v58 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(NSObject **)(*((void *)&v57 + 1) + 8 * i);
          id v13 = [(MBCKEngine *)self cache];
          uint64_t v14 = [v13 fetchRestorableFileForPath:v12 error:0];

          if (v14)
          {
            id v15 = [v14 domainName];
            id v16 = [v50 domainForName:v15];

            if (v16) {
              [v14 setupWithDomain:v16];
            }
            [(MBCKRestoreFilePrefetchEngine *)v51 prefetchRecord:v14];
            uint64_t v17 = MBGetDefaultLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              long long v62 = v12;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Found Legacy file by absolute path: %@", buf, 0xCu);
              unsigned __int8 v42 = v12;
              _MBLog();
            }
          }
          else
          {
            id v16 = MBGetDefaultLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              long long v62 = v12;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to find file by absolute path: %@", buf, 0xCu);
              unsigned __int8 v42 = v12;
              _MBLog();
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v57 objects:v68 count:16];
      }
      while (v9);
    }

    [(MBCKRestoreFilePrefetchEngine *)v51 waitForPrefetchCompletion];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = v7;
    id v48 = [obj countByEnumeratingWithState:&v53 objects:v67 count:16];
    if (v48)
    {
      uint64_t v47 = *(void *)v54;
      while (2)
      {
        for (j = 0; j != v48; j = (char *)j + 1)
        {
          if (*(void *)v54 != v47) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(NSObject **)(*((void *)&v53 + 1) + 8 * (void)j);
          if (-[MBCKEngine handleCancelation:](self, "handleCancelation:", v44, v42, v43)) {
            goto LABEL_47;
          }
          id v20 = MBGetDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            long long v62 = v19;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "=ckrestore-engine= Starting restore for %@", buf, 0xCu);
            unsigned __int8 v42 = v19;
            _MBLog();
          }

          long long v21 = [(MBCKEngine *)self cache];
          id v52 = 0;
          long long v22 = [v21 fetchRestorableFileForPath:v19 error:&v52];
          long long v23 = v52;

          if (v22)
          {
            long long v24 = [(MBEngine *)self domainManager];
            id v25 = [v22 domainName];
            uint64_t v26 = [v24 domainForName:v25];

            if (!v26) {
              __assert_rtn("-[MBCKRestoreEngine _restoreATCFiles:usingCKCache:]", "MBCKRestoreEngine.m", 1880, "domain");
            }
            id v49 = v23;
            id v27 = (void *)v26;
            [v22 setupWithDomain:v26];
            id v28 = [(MBCKRestoreEngine *)self restorePolicy];
            uint64_t v29 = [v28 destinationPathForRestorable:v22 safeHarborDir:0];

            id v30 = [[MBCKRestoreFileEngine alloc] initWithRestoreEngine:self file:v22 destinationPath:v29 shouldSetProtectionClass:1];
            unsigned __int8 v31 = [(MBCKRestoreFileEngine *)v30 runWithError:v44];
            unint64_t v32 = MBGetDefaultLog();
            id v33 = v32;
            if ((v31 & 1) == 0)
            {
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                long long v38 = [v22 fileID];
                id v39 = *v44;
                *(_DWORD *)long long buf = 138412802;
                long long v62 = v38;
                __int16 v63 = 2112;
                long long v64 = v19;
                __int16 v65 = 2112;
                id v66 = v39;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to restore file(%@) at %@: %@", buf, 0x20u);

                id v40 = [v22 fileID];
                _MBLog();
              }
              long long v23 = v49;
LABEL_46:

LABEL_47:
              BOOL v37 = 0;
              goto LABEL_48;
            }
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              id v34 = [v22 fileID];
              *(_DWORD *)long long buf = 138412546;
              long long v62 = v34;
              __int16 v63 = 2112;
              long long v64 = v19;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Restored file(%@) at %@", buf, 0x16u);

              unsigned __int8 v42 = [v22 fileID];
              id v43 = v19;
              _MBLog();
            }
            long long v35 = v49;
          }
          else
          {
            long long v35 = MBGetDefaultLog();
            BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
            if (v23)
            {
              if (v36)
              {
                *(_DWORD *)long long buf = 138412546;
                long long v62 = v19;
                __int16 v63 = 2112;
                long long v64 = v23;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to fetch file %@ from RestoreFiles table: %@", buf, 0x16u);
                _MBLog();
              }

              if (v44) {
                id *v44 = v23;
              }
              goto LABEL_46;
            }
            if (v36)
            {
              *(_DWORD *)long long buf = 138412290;
              long long v62 = v19;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to find file %@ in the RestoreFiles table", buf, 0xCu);
              unsigned __int8 v42 = v19;
              _MBLog();
            }
          }
        }
        BOOL v37 = 1;
        id v48 = [obj countByEnumeratingWithState:&v53 objects:v67 count:16];
        if (v48) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v37 = 1;
    }
LABEL_48:

    id v6 = v45;
  }
  else
  {
    BOOL v37 = 0;
  }

  return v37;
}

- (BOOL)downloadRestorablesWithError:(id *)a3
{
  id v5 = [(MBCKEngine *)self context];
  id v6 = [v5 restoreMode];
  unsigned int v7 = [v6 type];

  if (v7 > 7) {
    return 1;
  }
  if (((1 << v7) & 0x8E) != 0)
  {
    return [(MBCKRestoreEngine *)self _downloadRestorablesForBackgroundAppWithError:a3];
  }
  else if (((1 << v7) & 0x30) != 0)
  {
    return [(MBCKRestoreEngine *)self _downloadRestorablesForBackgroundFilesWithError:a3];
  }
  else
  {
    return [(MBCKRestoreEngine *)self _downloadRestorablesForForegroundWithError:a3];
  }
}

- (BOOL)_restoreEntitlements:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [(MBCKRestoreEngine *)self restoreMode];
  unsigned int v8 = [v7 type];

  id v9 = [(MBCKEngine *)self persona];
  uint64_t v10 = v9;
  if (v8 == 6)
  {
    id v11 = [v9 placeholderRestoreDirectory];
    v48[0] = v11;
    id v12 = [v6 bundleID];
    v48[1] = v12;
    id v13 = [v6 relativePath];
    v48[2] = v13;
    uint64_t v14 = +[NSArray arrayWithObjects:v48 count:3];
    id v15 = +[NSString pathWithComponents:v14];
  }
  else
  {
    id v11 = [v9 userIncompleteRestoreDirectory];
    v47[0] = v11;
    id v12 = [(MBCKEngine *)self persona];
    id v13 = [v12 placeholderRestoreDirectory];
    v47[1] = v13;
    uint64_t v14 = [v6 bundleID];
    v47[2] = v14;
    id v16 = [v6 relativePath];
    v47[3] = v16;
    uint64_t v17 = +[NSArray arrayWithObjects:v47 count:4];
    id v15 = +[NSString pathWithComponents:v17];
  }
  unsigned int v18 = [v15 stringByDeletingLastPathComponent];
  char v42 = 0;
  id v19 = +[NSFileManager defaultManager];
  unsigned __int8 v20 = [v19 fileExistsAtPath:v18 isDirectory:&v42];

  if (v20)
  {
    if (v42)
    {
      id v41 = 0;
      unsigned __int8 v21 = [v6 writeToFile:v15 error:&v41];
      id v22 = v41;
      if (v21)
      {
        long long v23 = +[NSFileManager defaultManager];
        long long v24 = MBMobileFileAttributes();
        id v40 = v22;
        unsigned __int8 v25 = [v23 setAttributes:v24 ofItemAtPath:v15 error:&v40];
        id v26 = v40;

        if (v25)
        {
          BOOL v27 = 1;
        }
        else
        {
          id v34 = MBGetDefaultLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            long long v35 = [v6 bundleID];
            *(_DWORD *)long long buf = 138412546;
            int v44 = v35;
            __int16 v45 = 2112;
            id v46 = v26;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to set placeholder entitlements file attributes for %@: %@", buf, 0x16u);

            id v39 = [v6 bundleID];
            _MBLog();
          }
          if (a4)
          {
            +[MBError errorWithCode:100 error:v26 path:v15 format:@"Error setting placeholder entitlements plist file attributes"];
            BOOL v27 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v27 = 0;
          }
        }
        id v22 = v26;
        goto LABEL_28;
      }
      unint64_t v32 = MBGetDefaultLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v33 = [v6 bundleID];
        *(_DWORD *)long long buf = 138412546;
        int v44 = v33;
        __int16 v45 = 2112;
        id v46 = v22;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to restore placeholder entitlement for %@: %@", buf, 0x16u);

        long long v38 = [v6 bundleID];
        _MBLog();
      }
      if (a4)
      {
        id v22 = v22;
        BOOL v27 = 0;
        *a4 = v22;
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v29 = MBGetDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        id v30 = [v6 bundleID];
        *(_DWORD *)long long buf = 138412290;
        int v44 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to restore placeholder entitlements for %@: parent directory is a file", buf, 0xCu);

        BOOL v37 = [v6 bundleID];
        _MBLog();
      }
      if (a4)
      {
        unsigned __int8 v31 = [v6 bundleID];
        *a4 = +[MBError errorWithCode:100, v18, @"Placeholder entitlement's parent directory for %@ is a file", v31 path format];
      }
      id v22 = 0;
    }
    BOOL v27 = 0;
    goto LABEL_28;
  }
  id v28 = MBGetDefaultLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543362;
    int v44 = v18;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Application placeholder does not exist at %{public}@ - not setting entitlements", buf, 0xCu);
    _MBLog();
  }

  id v22 = 0;
  BOOL v27 = 1;
LABEL_28:

  return v27;
}

- (BOOL)restoreEntitlementsWithError:(id *)a3
{
  id v5 = self->_targetSnapshot;
  if (!v5) {
    __assert_rtn("-[MBCKRestoreEngine restoreEntitlementsWithError:]", "MBCKRestoreEngine.m", 1959, "targetSnapshot");
  }
  id v6 = v5;
  if ([(MBCKRestoreEngine *)self useFileLists])
  {
    unsigned int v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      [(MBCKSnapshot *)v6 snapshotFormat];
      unsigned int v8 = MBStringForSnapshotFormat();
      *(_DWORD *)long long buf = 138412290;
      id v39 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Skipping restoreEntitlements for snapshot format %@", buf, 0xCu);

      [(MBCKSnapshot *)v6 snapshotFormat];
      MBStringForSnapshotFormat();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      _MBLog();
      LOBYTE(v10) = 1;
      goto LABEL_40;
    }
    LOBYTE(v10) = 1;
    goto LABEL_41;
  }
  if (![(MBEngine *)self isForegroundRestore])
  {
    LOBYTE(v10) = 1;
    goto LABEL_42;
  }
  id v37 = 0;
  id v9 = [(MBCKRestoreEngine *)self getEntitlementsForDomainsWithError:&v37];
  id v11 = v37;
  if (v11)
  {
    unsigned int v7 = v11;
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v39 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to get entitlements for domains: %@", buf, 0xCu);
      _MBLog();
    }

    if (a3)
    {
      unsigned int v7 = v7;
      LOBYTE(v10) = 0;
      *a3 = v7;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
    goto LABEL_40;
  }
  id v28 = v6;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = v9;
  id v31 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
  unsigned int v7 = 0;
  int v10 = 1;
  if (!v31) {
    goto LABEL_39;
  }
  uint64_t v30 = *(void *)v34;
  while (2)
  {
    int v29 = v10;
    for (i = 0; i != v31; i = (char *)i + 1)
    {
      if (*(void *)v34 != v30) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(NSObject **)(*((void *)&v33 + 1) + 8 * i);
      if (-[MBCKEngine handleCancelation:](self, "handleCancelation:", a3, v26, v27))
      {
        LOBYTE(v10) = 0;
        goto LABEL_39;
      }
      id v15 = [v9 objectForKeyedSubscript:v14];
      id v16 = [(MBEngine *)self appManager];
      uint64_t v17 = [v15 bundleID];
      unsigned int v18 = [v16 appWithIdentifier:v17];

      if ([v18 isSystemApp])
      {
        id v19 = MBGetDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          unsigned __int8 v20 = [v15 bundleID];
          *(_DWORD *)long long buf = 138412290;
          id v39 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "=ckrestore-engine= Skipping restore of entitlements for system app %@", buf, 0xCu);

          id v26 = [v15 bundleID];
          _MBLog();
        }
LABEL_33:

        goto LABEL_34;
      }
      unsigned __int8 v21 = [v15 relativePath];

      id v19 = MBGetDefaultLog();
      BOOL v22 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
      if (!v21)
      {
        if (v22)
        {
          *(_DWORD *)long long buf = 138412290;
          id v39 = v14;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "=ckrestore-engine= Not creating placeholder entitlement for %@", buf, 0xCu);
          id v26 = v14;
          _MBLog();
        }
        goto LABEL_33;
      }
      if (v22)
      {
        *(_DWORD *)long long buf = 138412290;
        id v39 = v14;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "=ckrestore-engine= Creating placeholder entitlement for %@", buf, 0xCu);
        id v26 = v14;
        _MBLog();
      }

      id v32 = 0;
      unsigned __int8 v23 = [(MBCKRestoreEngine *)self _restoreEntitlements:v15 withError:&v32];
      long long v24 = v32;
      unsigned int v7 = v24;
      if ((v23 & 1) == 0)
      {
        if (a3) {
          *a3 = v24;
        }
        id v19 = MBGetDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          id v39 = v14;
          __int16 v40 = 2112;
          id v41 = v7;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Error writing placeholder entitlement for %@: %@", buf, 0x16u);
          id v26 = v14;
          BOOL v27 = v7;
          _MBLog();
        }
        int v29 = 0;
        goto LABEL_33;
      }
LABEL_34:
    }
    int v10 = v29;
    id v31 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v31) {
      continue;
    }
    break;
  }
LABEL_39:

  id v6 = v28;
LABEL_40:

LABEL_41:
LABEL_42:

  return v10 & 1;
}

- (id)getEntitlementsForDomainsWithError:(id *)a3
{
  BOOL v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Getting entitlements for domains", buf, 2u);
    _MBLog();
  }

  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = self->_validSnapshots;
  id v6 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v11 = [(MBCKEngine *)self cache];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100079E9C;
        v21[3] = &unk_100411750;
        id v12 = v5;
        id v22 = v5;
        id v13 = [v11 enumerateManifestsForSnapshot:v10 foundManifest:v21];

        if (v13)
        {
          if (a3) {
            *a3 = v13;
          }
          id v15 = MBGetDefaultLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            id v16 = [v10 snapshotID];
            *(_DWORD *)long long buf = 138412546;
            id v28 = v16;
            __int16 v29 = 2112;
            uint64_t v30 = v13;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Error fetching manifests for snapshot %@: %@", buf, 0x16u);

            unsigned int v18 = [v10 snapshotID];
            _MBLog();
          }
          id v14 = 0;
          id v5 = v12;
          goto LABEL_17;
        }

        id v5 = v12;
      }
      id v7 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v14 = v5;
LABEL_17:

  return v14;
}

- (BOOL)annotateRestoreWithError:(id *)a3
{
  id v5 = [(MBCKRestoreEngine *)self restoreMode];
  unsigned int v6 = [v5 type];

  if (v6 == 6)
  {
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Not annotating the restored data", buf, 2u);
      _MBLog();
    }
    BOOL v8 = 1;
LABEL_18:

    return v8;
  }
  if ([(MBEngine *)self isForegroundRestore])
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Annotating restored data", buf, 2u);
      _MBLog();
    }

    +[NSDate timeIntervalSinceReferenceDate];
    double v11 = v10;
    id v12 = [(MBCKEngine *)self persona];
    int64_t v13 = [(MBEngine *)self backupPolicy];
    id v14 = [(MBEngine *)self settingsContext];
    id v7 = +[MBRestoreDirectoryAnnotator restoreDirectoryAnnotatorWithPersona:engineType:backupPolicy:shouldRestoreSystemFiles:encrypted:](MBRestoreDirectoryAnnotator, "restoreDirectoryAnnotatorWithPersona:engineType:backupPolicy:shouldRestoreSystemFiles:encrypted:", v12, 2, v13, [v14 shouldRestoreSystemFiles], -[MBCKEngine encrypted](self, "encrypted"));

    id v15 = [(MBEngine *)self domainManager];
    id v16 = [v15 allDomains];
    double v17 = [v7 annotateDomains:v16];

    BOOL v8 = *(void *)&v17 == 0;
    unsigned int v18 = MBGetDefaultLog();
    id v19 = v18;
    if (v17 == 0.0)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        +[NSDate timeIntervalSinceReferenceDate];
        *(_DWORD *)long long buf = 134217984;
        double v23 = v20 - v11;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "=ckrestore-engine= Finished annotating all restored domains in %0.3f s", buf, 0xCu);
        +[NSDate timeIntervalSinceReferenceDate];
        _MBLog();
      }
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        double v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to annotate all restored domains: %@", buf, 0xCu);
        _MBLog();
      }

      if (a3) {
        *a3 = *(id *)&v17;
      }
    }

    goto LABEL_18;
  }
  return 1;
}

- (BOOL)verifyRestoreWithError:(id *)a3
{
  if ([(MBCKRestoreEngine *)self restoreType] != 1
    || ![(MBCKRestoreEngine *)self useFileLists])
  {
    return 1;
  }
  id v5 = [(MBCKEngine *)self serviceAccount];
  if (+[MBRestoreSnapshotIntegrityVerifier shouldRunVerifierForRestoreWithSnapshotFormat:[(MBCKSnapshot *)self->_targetSnapshot snapshotFormat] account:v5])
  {
    unsigned int v6 = [(MBCKRestoreEngine *)self _populatedRestorePlan];
    [(MBCKRestoreEngine *)self setForegroundRestoreVerificationEnabled:1];
    id v7 = [MBRestoreSnapshotIntegrityVerifier alloc];
    restorePolicy = self->_restorePolicy;
    int64_t v9 = [(MBCKSnapshot *)self->_targetSnapshot snapshotFormat];
    double v10 = [(MBCKEngine *)self persona];
    double v11 = [v10 restoreSnapshotsDatabaseDirectory];
    id v12 = [(MBCKSnapshot *)self->_targetSnapshot snapshotID];
    int64_t v13 = [(MBRestoreSnapshotIntegrityVerifier *)v7 initWithPolicy:restorePolicy snapshotFormat:v9 snapshotDir:v11 snapshotUUID:v12 delegate:self];

    id v14 = [(MBEngine *)self domainManager];
    LODWORD(v9) = [(MBRestoreSnapshotIntegrityVerifier *)v13 verifyIntermediateDirectoryAfterForegroundRestoreWithDomainManager:v14 plan:v6 overridePath:0 error:a3];

    if (v9)
    {
      id v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Successfully verified intermediate directories for foreground restore", buf, 2u);
        _MBLog();
      }
      BOOL v16 = 1;
      CFStringRef v17 = @"PASS";
    }
    else
    {
      unsigned int v18 = +[MBError isError:*a3 withCode:202];
      id v19 = MBGetDefaultLog();
      id v15 = v19;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Cancelled verifying intermediate directories for foreground restore", buf, 2u);
          _MBLog();
        }
        BOOL v16 = 1;
        CFStringRef v17 = @"CANCELLED";
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v20 = *a3;
          *(_DWORD *)long long buf = 138412290;
          id v23 = v20;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to verify intermediate directory for foreground restore %@", buf, 0xCu);
          _MBLog();
        }
        BOOL v16 = 0;
        CFStringRef v17 = @"FAIL";
      }
    }

    [(MBCKRestoreEngine *)self setForegroundRestoreVerificationStatus:v17];
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)finalizeRestoreWithError:(id *)a3
{
  uint64_t v5 = [(MBCKEngine *)self ckOperationTracker];
  if (!v5) {
    __assert_rtn("-[MBCKRestoreEngine finalizeRestoreWithError:]", "MBCKRestoreEngine.m", 2115, "tracker");
  }
  unsigned int v6 = (void *)v5;
  uint64_t v7 = [(MBCKEngine *)self serviceAccount];
  if (!v7) {
    __assert_rtn("-[MBCKRestoreEngine finalizeRestoreWithError:]", "MBCKRestoreEngine.m", 2117, "serviceAccount");
  }
  BOOL v8 = (void *)v7;
  if ([(MBCKRestoreEngine *)self restoreType] == 1)
  {
    int64_t v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Finalizing foreground restore", buf, 2u);
      _MBLog();
    }

    double v10 = [(MBCKRestoreEngine *)self restorePolicy];
    id v11 = [v10 notifyPluginsEndingRestoreWithEngine:self];

    id v12 = MBGetDefaultLog();
    int64_t v13 = v12;
    if (v11)
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      *(_DWORD *)long long buf = 138412290;
      id v53 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to notify plugins of endingRestoreWithEngine: %@", buf, 0xCu);
      goto LABEL_15;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "=ckrestore-engine= Notifying plugins of endedRestoreWithEngine:", buf, 2u);
      _MBLog();
    }

    CFStringRef v17 = [(MBCKRestoreEngine *)self restorePolicy];
    unsigned int v18 = [(MBCKEngine *)self engineError];
    id v11 = [v17 notifyPluginsEndedRestoreWithEngine:self error:v18];

    if (v11)
    {
      int64_t v13 = MBGetDefaultLog();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      *(_DWORD *)long long buf = 138412290;
      id v53 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to notify plugins of endedRestoreWithEngine:error: %@", buf, 0xCu);
LABEL_15:
      _MBLog();
LABEL_16:

      if (a3)
      {
        id v11 = v11;
        BOOL v16 = 0;
        *a3 = v11;
      }
      else
      {
        BOOL v16 = 0;
      }
      goto LABEL_45;
    }
    id v19 = [(MBCKEngine *)self device];
    id v51 = 0;
    uint64_t v20 = +[MBCKEncryptionManager saveRestoreKeyBagsWithAccount:v8 device:v19 error:&v51];
    id v21 = v51;

    if ((v20 & 1) == 0)
    {
      id v43 = MBGetDefaultLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v53 = v21;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Unable to save restore keybags for device: %@", buf, 0xCu);
        _MBLog();
      }

      if (a3)
      {
        id v21 = v21;
        BOOL v16 = 0;
        *a3 = v21;
      }
      else
      {
        BOOL v16 = 0;
      }
      goto LABEL_44;
    }
    id v22 = [(MBCKEngine *)self persona];
    id v23 = [(MBCKEngine *)self serviceManager];
    long long v24 = [MBServiceRestoreSession alloc];
    uint64_t v47 = v22;
    long long v25 = [v22 personaIdentifier];
    long long v26 = [(MBServiceRestoreSession *)v24 initWithPersonaIdentifier:v25];

    BOOL v27 = [(MBCKEngine *)self context];
    -[MBServiceRestoreSession setSnapshotID:](v26, "setSnapshotID:", [v27 snapshotID]);

    id v28 = [(MBCKEngine *)self context];
    __int16 v29 = [v28 snapshotUUID];
    [(MBServiceRestoreSession *)v26 setSnapshotUUID:v29];

    uint64_t v30 = [(MBCKEngine *)self context];
    id v31 = [v30 backupUDID];
    [(MBServiceRestoreSession *)v26 setBackupUDID:v31];

    id v32 = [(MBCKRestoreEngine *)self startDate];
    [(MBServiceRestoreSession *)v26 setStartDate:v32];

    [(MBServiceRestoreSession *)v26 setFinishing:0];
    [(MBServiceRestoreSession *)v26 setCancelled:0];
    long long v33 = [(MBCKEngine *)self context];
    -[MBServiceRestoreSession setSnapshotBackupPolicy:](v26, "setSnapshotBackupPolicy:", [v33 backupPolicy]);

    -[MBServiceRestoreSession setTelemetryID:](v26, "setTelemetryID:", [v23 restoreTelemetryID]);
    uint64_t v34 = [(MBCKRestoreEngine *)self cloudFormatInfo];
    if (!v34) {
      __assert_rtn("-[MBCKRestoreEngine finalizeRestoreWithError:]", "MBCKRestoreEngine.m", 2165, "cloudFormatInfo");
    }
    long long v35 = (void *)v34;
    long long v36 = [(MBCKEngine *)self performanceStatistics];
    id v50 = v21;
    unsigned __int8 v37 = +[MBDataMigratorPlugin setUpMobileBackupPreferencesForBackgroundRestoreWithAccount:v8 restoreSession:v26 cloudFormatInfo:v35 performanceStatistics:v36 backupPolicy:[(MBEngine *)self backupPolicy] error:&v50];
    id v38 = v50;

    if (v37)
    {
      id v39 = [(MBServiceRestoreSession *)v26 snapshotUUID];
      id v49 = v38;
      unsigned __int8 v40 = [v23 closeRestorePlanForAccount:v8 snapshotUUID:v39 error:&v49];
      id v41 = v49;

      if ((v40 & 1) == 0)
      {
        __int16 v45 = MBGetDefaultLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v53 = v41;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed closing restore plan: %@", buf, 0xCu);
          _MBLog();
        }

        if (!a3)
        {
          BOOL v16 = 0;
          id v38 = v41;
          goto LABEL_43;
        }
        id v38 = v41;
LABEL_40:
        id v38 = v38;
        BOOL v16 = 0;
        *a3 = v38;
        goto LABEL_43;
      }
      id v48 = v41;
      unsigned __int8 v42 = [v47 finalizeRestoreDirectoriesWithError:&v48];
      id v38 = v48;

      if (v42)
      {
        BOOL v16 = 1;
LABEL_43:

        id v21 = v38;
LABEL_44:

        id v11 = 0;
LABEL_45:

        goto LABEL_46;
      }
      int v44 = MBGetDefaultLog();
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
LABEL_39:

        if (!a3)
        {
          BOOL v16 = 0;
          goto LABEL_43;
        }
        goto LABEL_40;
      }
      *(_DWORD *)long long buf = 138412290;
      id v53 = v38;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to move restore sandboxes into place: %@", buf, 0xCu);
    }
    else
    {
      int v44 = MBGetDefaultLog();
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      *(_DWORD *)long long buf = 138412290;
      id v53 = v38;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to set up MobileBackup preferences for background restore: %@", buf, 0xCu);
    }
    _MBLog();
    goto LABEL_39;
  }
  id v14 = [v6 databaseManager];
  id v15 = [v6 account];
  [v14 setShouldSupportBudgeting:0 account:v15];

  BOOL v16 = 1;
LABEL_46:

  return v16;
}

- (MBCKEncryptionManager)encryptionManager
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_encryptionManager;
  if (!v3)
  {
    BOOL v4 = objc_alloc_init(MBCKEncryptionManager);
    encryptionManager = v2->_encryptionManager;
    v2->_encryptionManager = v4;

    v3 = v4;
  }
  unsigned int v6 = v3;

  objc_sync_exit(v2);
  return v6;
}

- (BOOL)shouldCancelVerification
{
  return [(MBCKEngine *)self handleCancelation:0];
}

- (BOOL)_configureAndInstallPlaceholdersWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBCKRestoreEngine _configureAndInstallPlaceholdersWithError:]", "MBCKRestoreEngine.m", 2211, "error");
  }
  uint64_t v5 = [(MBCKEngine *)self serviceAccount];
  if (!v5) {
    __assert_rtn("-[MBCKRestoreEngine _configureAndInstallPlaceholdersWithError:]", "MBCKRestoreEngine.m", 2213, "serviceAccount");
  }
  unsigned int v6 = (void *)v5;
  if ([(MBEngine *)self isForegroundRestore])
  {
    uint64_t v7 = [v6 persona];
    if ([(MBCKRestoreEngine *)self useFileLists]
      && ([(MBCKRestoreEngine *)self excludedAppBundleIDs],
          BOOL v8 = objc_claimAutoreleasedReturnValue(),
          unsigned int v9 = [v7 copyPlaceholderIPAsForAppInstallationExcluding:v8 error:a3],
          v8,
          !v9))
    {
      LOBYTE(v13) = 0;
    }
    else
    {
      if ([v7 isDataSeparatedPersona])
      {
        double v10 = MBGetDefaultLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Installing the app placeholders for the data-separated foreground restore", buf, 2u);
          _MBLog();
        }

        id v11 = objc_opt_new();
        id v12 = [[_TtC7backupd14MigratorConfig alloc] initWithDataSeparatedAccount:v6];
        unsigned int v13 = [v11 performMigrationWithConfig:v12 error:a3];
        id v14 = MBGetDefaultLog();
        id v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=ckrestore-engine= Finished installing the app placeholders for the data-separated foreground restore", buf, 2u);
LABEL_17:
            _MBLog();
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v16 = *a3;
          *(_DWORD *)long long buf = 138543362;
          id v19 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "=ckrestore-engine= Failed to install the app placeholders for the data-separated foreground restore: %{public}@", buf, 0xCu);
          goto LABEL_17;
        }

        goto LABEL_19;
      }
      LOBYTE(v13) = 1;
    }
LABEL_19:

    goto LABEL_20;
  }
  LOBYTE(v13) = 1;
LABEL_20:

  return v13;
}

- (id)engineModeString
{
  if ([(MBEngine *)self isForegroundRestore])
  {
    v3 = @"Foreground Restore";
  }
  else if ([(MBEngine *)self isBackgroundRestore])
  {
    BOOL v4 = [(MBCKRestoreEngine *)self restoreMode];
    if ([v4 isBackgroundApp])
    {
      if (MBIsInternalInstall())
      {
        uint64_t v5 = [v4 bundleID];
        v3 = +[NSString stringWithFormat:@"Background Restore for %@", v5];
      }
      else
      {
        v3 = +[NSString stringWithFormat:@"Background Restore for App"];
      }
    }
    else if ([v4 isBackgroundFile])
    {
      v3 = @"Background Restore for ATC File";
    }
    else if ([v4 isBackgroundFiles])
    {
      v3 = @"Background Restore for ATC Files";
    }
    else
    {
      v3 = @"Background Restore [UNKNOWN TYPE]";
    }
  }
  else
  {
    v3 = @"UNKNOWN RESTORE TYPE";
  }
  return v3;
}

- (void)setEncryptionManager:(id)a3
{
}

- (MBRestoreOperationLogger)restoreLogger
{
  return self->_restoreLogger;
}

- (void)setRestoreLogger:(id)a3
{
}

- (NSDictionary)storedKeybagsByUUIDString
{
  return self->_storedKeybagsByUUIDString;
}

- (void)setStoredKeybagsByUUIDString:(id)a3
{
}

- (NSNumber)foregroundRestorableSize
{
  return self->_foregroundRestorableSize;
}

- (void)setForegroundRestorableSize:(id)a3
{
}

- (NSNumber)backgroundRestorableSize
{
  return self->_backgroundRestorableSize;
}

- (void)setBackgroundRestorableSize:(id)a3
{
}

- (NSNumber)foregroundRestorableFileCount
{
  return self->_foregroundRestorableFileCount;
}

- (void)setForegroundRestorableFileCount:(id)a3
{
}

- (NSNumber)backgroundRestorableFileCount
{
  return self->_backgroundRestorableFileCount;
}

- (void)setBackgroundRestorableFileCount:(id)a3
{
}

- (NSNumber)foregroundRestorableDomainCount
{
  return self->_foregroundRestorableDomainCount;
}

- (void)setForegroundRestorableDomainCount:(id)a3
{
}

- (unint64_t)chargingType
{
  return self->_chargingType;
}

- (void)setChargingType:(unint64_t)a3
{
  self->_chargingType = a3;
}

- (MBDurationEstimation)estimator
{
  return (MBDurationEstimation *)objc_getProperty(self, a2, 376, 1);
}

- (void)setEstimator:(id)a3
{
}

- (NSNumber)minutesRemaining
{
  return (NSNumber *)objc_getProperty(self, a2, 384, 1);
}

- (void)setMinutesRemaining:(id)a3
{
}

- (NSNumber)freeDiskSpace
{
  return self->_freeDiskSpace;
}

- (void)setFreeDiskSpace:(id)a3
{
}

- (int)allowedCellularCost
{
  return self->_allowedCellularCost;
}

- (void)setAllowedCellularCost:(int)a3
{
  self->_allowedCellularCost = a3;
}

- ($1C6001547D93A6C6CE4901F2C331F3E5)networkConnectivityAtStart
{
  p_networkConnectivityAtStart = &self->_networkConnectivityAtStart;
  uint64_t v3 = *(void *)&self->_networkConnectivityAtStart.isOnWiFi;
  unint64_t backupOnCellularSupport = p_networkConnectivityAtStart->backupOnCellularSupport;
  result.var4 = backupOnCellularSupport;
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = HIDWORD(v3);
  return result;
}

- (void)setNetworkConnectivityAtStart:(id)a3
{
  self->_networkConnectivityAtStart = ($74774DBE0C4D9345BF9CF39D18F4694C)a3;
}

- ($1C6001547D93A6C6CE4901F2C331F3E5)networkConnectivityAtFinish
{
  p_networkConnectivityAtFinish = &self->_networkConnectivityAtFinish;
  uint64_t v3 = *(void *)&self->_networkConnectivityAtFinish.isOnWiFi;
  unint64_t backupOnCellularSupport = p_networkConnectivityAtFinish->backupOnCellularSupport;
  result.var4 = backupOnCellularSupport;
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = HIDWORD(v3);
  return result;
}

- (void)setNetworkConnectivityAtFinish:(id)a3
{
  self->_networkConnectivityAtFinish = ($74774DBE0C4D9345BF9CF39D18F4694C)a3;
}

- (NSString)foregroundRestoreVerificationStatus
{
  return self->_foregroundRestoreVerificationStatus;
}

- (void)setForegroundRestoreVerificationStatus:(id)a3
{
}

- (BOOL)foregroundRestoreVerificationEnabled
{
  return self->_foregroundRestoreVerificationEnabled;
}

- (void)setForegroundRestoreVerificationEnabled:(BOOL)a3
{
  self->_foregroundRestoreVerificationEnabled = a3;
}

- (MBCKSnapshot)targetSnapshot
{
  return self->_targetSnapshot;
}

- (void)setTargetSnapshot:(id)a3
{
}

- (BOOL)useFileLists
{
  return self->_useFileLists;
}

- (void)setUseFileLists:(BOOL)a3
{
  self->_useFileLists = a3;
}

- (unint64_t)restoreState
{
  return self->_restoreState;
}

- (void)setRestoreState:(unint64_t)a3
{
  self->_restoreState = a3;
}

- (NSSet)excludedAppBundleIDs
{
  return self->_excludedAppBundleIDs;
}

- (void)setExcludedAppBundleIDs:(id)a3
{
}

- (NSArray)cacheDeleteRequests
{
  return (NSArray *)objc_getProperty(self, a2, 432, 1);
}

- (void)setCacheDeleteRequests:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDictionary)cloudFormatInfo
{
  return self->_cloudFormatInfo;
}

- (void)setCloudFormatInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudFormatInfo, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_cacheDeleteRequests, 0);
  objc_storeStrong((id *)&self->_excludedAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_targetSnapshot, 0);
  objc_storeStrong((id *)&self->_foregroundRestoreVerificationStatus, 0);
  objc_storeStrong((id *)&self->_freeDiskSpace, 0);
  objc_storeStrong((id *)&self->_minutesRemaining, 0);
  objc_storeStrong((id *)&self->_estimator, 0);
  objc_storeStrong((id *)&self->_foregroundRestorableDomainCount, 0);
  objc_storeStrong((id *)&self->_backgroundRestorableFileCount, 0);
  objc_storeStrong((id *)&self->_foregroundRestorableFileCount, 0);
  objc_storeStrong((id *)&self->_backgroundRestorableSize, 0);
  objc_storeStrong((id *)&self->_foregroundRestorableSize, 0);
  objc_storeStrong((id *)&self->_storedKeybagsByUUIDString, 0);
  objc_storeStrong((id *)&self->_restoreLogger, 0);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_restorePolicy, 0);
  objc_storeStrong((id *)&self->_localDevice, 0);
  objc_storeStrong((id *)&self->_validSnapshots, 0);
}

- (id)domainForName:(id)a3 containerID:(id)a4 domainManager:(id)a5
{
  return +[MBServiceRestoreDomainManagerDelegate domainForName:a3 containerID:a4 engine:self];
}

@end