@interface MSDTargetDevice
+ (MSDTargetDevice)sharedInstance;
- (BOOL)aboutToReboot;
- (BOOL)allowAccountSetup;
- (BOOL)allowSnapshotMode;
- (BOOL)allowSnapshotRevertTimer;
- (BOOL)backgroundDownloadActive;
- (BOOL)cachedBundleInstallAttempted;
- (BOOL)canLockSnapshot;
- (BOOL)canRevertSnapshot;
- (BOOL)canRunCleanUpForBetterTogetherDevice;
- (BOOL)canStartBackgroundDownload;
- (BOOL)canStartContentUpdate;
- (BOOL)canStartOSUpdate;
- (BOOL)canUnenrollWithObliteration:(BOOL)a3 consultDeviceOptions:(BOOL)a4;
- (BOOL)canUnlockSnapshot;
- (BOOL)cleanUpPreferencesFile;
- (BOOL)clearCurrentiOSBuild;
- (BOOL)createMobileStoreDemoCache;
- (BOOL)createTemporaryPasscodeIfNeeded;
- (BOOL)criticalUpdatePrioritized;
- (BOOL)dcotaOfflineModeDevice;
- (BOOL)deactivateDevice;
- (BOOL)deleteConfigurationApp;
- (BOOL)deleteNVRam:(id)a3;
- (BOOL)deleteOperationRequest;
- (BOOL)deleteOperationRequestAndQuitHelper;
- (BOOL)demoModeValueForKey:(id)a3;
- (BOOL)demoSetup;
- (BOOL)holdPowerAssertion;
- (BOOL)iCloudAccountSyncNeeded;
- (BOOL)isBetterTogetherDemo;
- (BOOL)isContentFrozen;
- (BOOL)isDDLDevice;
- (BOOL)isDemoEligible;
- (BOOL)isDemoModeOn;
- (BOOL)isOfflineMode;
- (BOOL)isPasscodeModificationAllowed;
- (BOOL)isPressDemoDevice;
- (BOOL)isVerifiedDemoDevice;
- (BOOL)isVerifiedPOSDevice;
- (BOOL)liftPowerAssertion;
- (BOOL)lockSnapshot;
- (BOOL)managedStoreDemoMode;
- (BOOL)migrateCellularSupportFlag;
- (BOOL)migrateDemoDeviceToDemoVolume;
- (BOOL)migratePreferenceAndWifiSettingsToDemoVolume;
- (BOOL)moveFilesToFinalDst:(id)a3 finalPath:(id)a4;
- (BOOL)overrideComputerNameAndHostnameIfNeeded;
- (BOOL)powerAssertionActive;
- (BOOL)pressDemoMode;
- (BOOL)proceeded;
- (BOOL)removeKeyFromPreferenceFile:(id)a3;
- (BOOL)removePerHubInfoFromPreferencesForMigration;
- (BOOL)removeTemporaryPasscodeIfNeeded;
- (BOOL)revertSnapshot;
- (BOOL)revertSnapshotAndShutdown;
- (BOOL)runCleanUpForBetterTogetherDevice;
- (BOOL)saveCurrentiOSBuild;
- (BOOL)saveHubCertificateIdentifer:(id)a3;
- (BOOL)saveHubHostNameList:(id)a3;
- (BOOL)saveHubSuppliedSettings:(id)a3;
- (BOOL)saveOperationError:(id)a3;
- (BOOL)saveOperationRequest:(id)a3 requestFlag:(int)a4 completeBy:(int)a5;
- (BOOL)sendIconStateToSB:(id)a3;
- (BOOL)setDemoDeviceFlag;
- (BOOL)setDemoEnrollmentFlag:(id)a3;
- (BOOL)setLowPowerMode:(int64_t)a3;
- (BOOL)setPOSDeviceFlag;
- (BOOL)setPasscodeModificationAllowed:(BOOL)a3;
- (BOOL)setSEPDemoMode:(BOOL)a3;
- (BOOL)setupDemoDeviceMetadataFolder;
- (BOOL)setupDummyPreferenceFile;
- (BOOL)setupFactoryDemoDeviceMetadataFolder;
- (BOOL)shouldForgetKnownNetworkUponUnlock;
- (BOOL)snapshotRevertFlagged;
- (BOOL)storeDemoMode;
- (BOOL)switchModeImmediately:(int)a3;
- (BOOL)toggleSEPDemoModeOnManagedPreferencesChange;
- (BOOL)turnOnDemoMode;
- (BOOL)turnOnPressDemoMode;
- (BOOL)turnOnStoreDemoMode;
- (BOOL)unenrollWithObliteration:(BOOL)a3 preserveESim:(BOOL)a4 callUnregister:(BOOL)a5 preserveDDLFlag:(BOOL)a6;
- (BOOL)unlockSnapshot;
- (BOOL)updateDeviceOptions:(id)a3 skipImutableKeys:(BOOL)a4;
- (BOOL)waitingForCommand;
- (MSDHelperAgent)helperAgent;
- (MSDTargetDevice)init;
- (NSData)certificateHash;
- (NSDate)lastRebootTime;
- (NSDictionary)wifiSettings;
- (NSNumber)buddyCompletionHandlerLock;
- (NSNumber)modeLock;
- (NSNumber)nandSize;
- (NSString)OSBuild;
- (NSString)OSVersion;
- (NSString)cachedBundleInstallState;
- (NSString)demodVersion;
- (NSString)hubHostName;
- (NSString)hubPort;
- (NSString)hubProtocolVersion;
- (NSString)installedFactoryBundleID;
- (NSString)localHubFailureReason;
- (NSString)manifestAndFileDownloadInfoPath;
- (NSString)manifestPath;
- (NSString)name;
- (NSString)packageVersion;
- (NSString)preferredStoreID;
- (NSString)productType;
- (NSString)request;
- (NSString)response;
- (NSString)s3ServerFailureReason;
- (NSString)serialNumber;
- (NSString)udid;
- (NSTimer)caLogsUploadTimer;
- (NSTimer)snapshotRevertTimer;
- (NSTimer)waitForCommandTimer;
- (__MKBAssertion)deviceLockAssertion;
- (id)buddyCompletionHandler;
- (id)decodeComponentIdx:(int)a3 forSavedString:(id)a4;
- (id)demoUserHomePath;
- (id)deviceInformation:(id)a3;
- (id)deviceInformation:(id)a3 appendPingInfo:(BOOL)a4;
- (id)deviceInformationForPing:(id)a3;
- (id)getCachingHubFailureEventForPing;
- (id)getDemoEnrollmentFlag;
- (id)getDesiredIconStateFromSB;
- (id)getDeviceOptions;
- (id)getOSUpdateRequest;
- (id)getS3ServerFailureEventForPing;
- (id)getSavedError;
- (id)getSavedRequest;
- (id)hubCertificateIdentifier;
- (id)hubHostNameList;
- (id)hubSuppliedSettings;
- (id)iCloudAccountRecoveryKey;
- (id)installedDeletableSystemApps;
- (id)lastSettingsUpdatedTime;
- (id)lastShallowRefreshTime;
- (id)lastSnapshotRevertTime;
- (id)minOSVersionAvailable;
- (id)pathForDummyPreferenceFile;
- (id)previousiOSBuild;
- (id)readNVRam:(id)a3;
- (id)requiredDeletableSystemApps;
- (id)retrieveSignedManifest;
- (int)activationConfigurationFlags;
- (int)getSavedCompleteByInterval;
- (int)getSavedFlag;
- (int)mode;
- (int64_t)batteryCapacity;
- (int64_t)findMyHubRetryAtTime;
- (int64_t)getFreeSpace;
- (int64_t)hubLastOnlineTime;
- (unint64_t)backgroundDownloadState;
- (unint64_t)fetchActiveNetworkInterface;
- (unint64_t)typeOfDemoDevice;
- (unsigned)powerAssertion;
- (void)acquireDeviceKeybagAssertionIfNeeded;
- (void)backToVirgin:(int)a3;
- (void)caLogsUploadTimerHandler:(id)a3;
- (void)cleanUpBackgroundState:(BOOL)a3;
- (void)cleanupDummyPreferenceFile;
- (void)clearMinOSVersionAvailable;
- (void)clearOSUpdateRequest;
- (void)clearSafariHistory;
- (void)clearUpF200FootprintIfNeeded;
- (void)clearUpNvramIfNeeded;
- (void)configApplePencilToEnterSleepModeIfPaired;
- (void)configureGreyMatterAutoUpdate;
- (void)configureLowPowerMode;
- (void)configureNetworkInterface;
- (void)delayRebootForTesting;
- (void)destroyWorkFolderForBootTask;
- (void)disableLaunchdServicesIfNeededForWatch;
- (void)disableSUAutoDownloadForWatch;
- (void)enableSnapshotMode:(BOOL)a3;
- (void)forceSwitchToDemoModeIfNeeded;
- (void)forceSwitchToDemoUpdateModeIfNeeded;
- (void)installAndWaitForSystemApps;
- (void)invokeHandler:(BOOL)a3;
- (void)kickOffCachedBundleInstall;
- (void)manageDataVolume:(id)a3;
- (void)manageDemoVolume:(id)a3;
- (void)manageDeviceSnapshot:(id)a3;
- (void)manageUserVolume:(id)a3;
- (void)manualUpdateMode:(BOOL *)a3 allowChange:(BOOL *)a4;
- (void)markContentInstallingInstalled;
- (void)migrateNvramToDemoVolume;
- (void)obliterateDeviceWithAdminCredential:(id)a3;
- (void)patchBackupFolderInStaging:(id)a3;
- (void)processNewFeatureFlags:(id)a3 oldFeatureFlags:(id)a4;
- (void)reboot;
- (void)rebootForStage:(int)a3;
- (void)rebootWithSnapshotRevertForStage:(int)a3;
- (void)refreshStoreHoursManagerUsingSettings;
- (void)registerCAHearbeatActivity;
- (void)resetSystemTimeCache;
- (void)saveDeviceOptions:(id)a3;
- (void)saveFindMyHubRetryAtTime:(int64_t)a3;
- (void)saveHubLastOnlineTime:(int64_t)a3;
- (void)saveLastSettingsUpdatedTime:(id)a3;
- (void)saveLastShallowRefreshTime:(id)a3;
- (void)saveLastSnapshotRevertTime:(id)a3;
- (void)saveMinOSVersionAvailable:(id)a3;
- (void)saveOSUpdateRequest:(id)a3;
- (void)saveRequiredDeletableSystemApps;
- (void)saveSnapshotRevertFlagged:(BOOL)a3;
- (void)saveiCloudAccountRecoveryKey:(id)a3;
- (void)saveiCloudAccountSyncNeeded:(BOOL)a3;
- (void)setAboutToReboot:(BOOL)a3;
- (void)setBackgroundDownloadActive:(BOOL)a3;
- (void)setBackgroundDownloadState:(unint64_t)a3;
- (void)setBuddyCompletionHandler:(id)a3;
- (void)setBuddyCompletionHandlerLock:(id)a3;
- (void)setCaLogsUploadTimer:(id)a3;
- (void)setCachedBundleInstallState:(id)a3;
- (void)setCriticalUpdatePrioritized:(BOOL)a3;
- (void)setDeviceLockAssertion:(__MKBAssertion *)a3;
- (void)setHelperAgent:(id)a3;
- (void)setHubHostName:(id)a3;
- (void)setHubPort:(id)a3;
- (void)setHubProtocolVersion:(id)a3;
- (void)setInstalledFactoryBundleID:(id)a3;
- (void)setLocalHubFailureReason:(id)a3;
- (void)setMode:(int)a3;
- (void)setModeLock:(id)a3;
- (void)setPowerAssertion:(unsigned int)a3;
- (void)setPreferredStoreID:(id)a3;
- (void)setProceeded:(BOOL)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setS3ServerFailureReason:(id)a3;
- (void)setShouldForgetKnownNetworkUponUnlock:(BOOL)a3;
- (void)setSnapshotRevertTimer:(id)a3;
- (void)setWaitForCommandTimer:(id)a3;
- (void)setWaitingForCommand:(BOOL)a3;
- (void)setWifiSettings:(id)a3;
- (void)setupCoreAnalyticsLogsUploadTimer;
- (void)setupSnapshotRevertTimer;
- (void)setupStoreHoursManager;
- (void)setupWorkFolderForBootTask;
- (void)shutdown;
- (void)snapshotRevertTimerHandler:(id)a3;
- (void)startWaitingForCommandTimer;
- (void)terminateConfigurationApp;
- (void)unlockDeviceKeybagIfNeeded;
- (void)unregisterCAHeartbeatActivity;
- (void)waitForBuddy:(id)a3;
- (void)waitForBuddy:(id)a3 updateStatus:(BOOL)a4;
- (void)waitForBuddyWithTimeout;
- (void)waitForBuddyWithoutStatusUpdate:(id)a3;
- (void)waitForNetworkReachability;
- (void)waitForNetworkReachabilityWithTimeout:(unint64_t)a3;
- (void)waitForPricing:(int)a3 forReboot:(BOOL)a4;
@end

@implementation MSDTargetDevice

+ (MSDTargetDevice)sharedInstance
{
  if (qword_100189A30 != -1) {
    dispatch_once(&qword_100189A30, &stru_100152BA8);
  }
  v2 = (void *)qword_100189A28;

  return (MSDTargetDevice *)v2;
}

- (MSDTargetDevice)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDTargetDevice;
  v2 = [(MSDTargetDevice *)&v5 init];
  if (v2)
  {
    v3 = +[MSDHelperAgent sharedInstance];
    [(MSDTargetDevice *)v2 setHelperAgent:v3];

    [(MSDTargetDevice *)v2 setPowerAssertion:0];
  }
  return v2;
}

- (NSString)name
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

- (NSString)udid
{
  v2 = +[MSDPlatform sharedInstance];
  unsigned int v3 = [v2 macOS];

  if (v3)
  {
    v4 = (void *)MGCopyAnswer();
    objc_super v5 = [v4 stringByPaddingToLength:25 withString:@"0" startingAtIndex:0];
    v6 = [v5 uppercaseString];
  }
  else
  {
    v6 = (void *)MGCopyAnswer();
  }

  return (NSString *)v6;
}

- (NSString)serialNumber
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

- (int)mode
{
  v2 = +[MSDPreferencesFile sharedInstance];
  unsigned int v3 = [v2 objectForKey:@"demo-install-state"];

  if (v3) {
    int v4 = [v3 integerValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)typeOfDemoDevice
{
  unsigned int v3 = +[MSDKeychainManager sharedInstance];
  int v4 = [v3 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"];

  if (v4) {
    return 6;
  }
  if ([(MSDTargetDevice *)self isVerifiedDemoDevice])
  {
    v6 = +[MSDHelperAgent sharedInstance];
    unsigned int v7 = [v6 fileExistsAtPath:@"/private/var/demo_backup/Metadata/Content.plist"];

    BOOL v8 = v7 == 0;
    unint64_t v9 = 4;
  }
  else
  {
    if ([(MSDTargetDevice *)self storeDemoMode]) {
      return 3;
    }
    BOOL v8 = ![(MSDTargetDevice *)self isVerifiedPOSDevice];
    unint64_t v9 = 1;
  }
  if (v8) {
    return v9;
  }
  else {
    return v9 + 1;
  }
}

- (void)setMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = +[MSDPreferencesFile sharedInstance];
  int v4 = +[NSNumber numberWithInt:v3];
  [v5 setObject:v4 forKey:@"demo-install-state"];
}

- (BOOL)removeKeyFromPreferenceFile:(id)a3
{
  id v3 = a3;
  int v4 = +[MSDPreferencesFile sharedInstance];
  unsigned __int8 v5 = [v4 removeObjectForKey:v3];

  if ((v5 & 1) == 0)
  {
    unsigned int v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000CE7A4();
    }
  }
  return v5;
}

- (NSString)request
{
  v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"msd-request"];

  return (NSString *)v3;
}

- (void)setRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDPreferencesFile sharedInstance];
  [v4 setObject:v3 forKey:@"msd-request"];
}

- (NSString)response
{
  v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"msd-response"];

  return (NSString *)v3;
}

- (void)setResponse:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDPreferencesFile sharedInstance];
  [v4 setObject:v3 forKey:@"msd-response"];
}

- (BOOL)switchModeImmediately:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int8 v5 = [(MSDTargetDevice *)self modeLock];
  objc_sync_enter(v5);
  uint64_t v6 = [(MSDTargetDevice *)self mode];
  if (os_variant_has_internal_content())
  {
    unsigned int v7 = +[NSString stringWithFormat:@"%d-%d", v6, v3];
    BOOL v8 = +[MSDTestInterface sharedInstance];
    [v8 pushTestEvent:v7 ofType:@"deviceModeChange"];
  }
  BOOL v9 = v3 == 4 && v6 == 2;
  char v10 = v9;
  if (v9)
  {
    v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v46 = 2;
      __int16 v47 = 1024;
      int v48 = 4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Changing mode from %d to %d, waiting for 30s...", buf, 0xEu);
    }

    sleep(0x1Eu);
  }
  else
  {
    switch((int)v3)
    {
      case 0:
      case 9:
        [(MSDTargetDevice *)self backToVirgin:v3];
        if (v3 == 8 || v3 == 6) {
          goto LABEL_17;
        }
        break;
      case 6:
      case 8:
LABEL_17:
        v12 = sub_100068600();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Move device to clearing mode to change the device to virgin/obliterate...", buf, 2u);
        }

        [(MSDTargetDevice *)self setMode:v3];
        [(MSDTargetDevice *)self enableSnapshotMode:0];
        break;
      default:
        break;
    }
  }
  if (v6 == v3) {
    goto LABEL_97;
  }
  v13 = +[MSDKeychainManager sharedInstance];
  v14 = [v13 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"];

  if ((v3 & 0xFFFFFFFE) != 4 || !v14)
  {
LABEL_28:
    v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v46 = v6;
      __int16 v47 = 1024;
      int v48 = v3;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Changing mode from %d to %d", buf, 0xEu);
    }

    if (v3 == 5)
    {
      if (![(MSDTargetDevice *)self allowEnteringDemoMode])
      {
        v40 = sub_100068600();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          sub_1000CE844();
        }

        uint64_t v41 = +[NSError errorDomainMSDWithCode:3727740953 message:@"Snapshot mode not allowed."];
        goto LABEL_103;
      }
      if (!v6)
      {
        char v23 = 1;
        goto LABEL_58;
      }
      if (v6 != 1)
      {
        BOOL v20 = 0;
        BOOL v21 = 0;
        BOOL v22 = 0;
        goto LABEL_39;
      }
    }
    else
    {
      BOOL v21 = v3 == 1;
      if (v3 != 1 || v6)
      {
        BOOL v22 = v6 == 1;
        BOOL v20 = v3 == 2;
        if (v3 != 2 || v6 != 1)
        {
LABEL_39:
          char v23 = 0;
          if (v3 != 7) {
            BOOL v22 = 0;
          }
          BOOL v24 = v6 == 2 && v3 == 5;
          char v25 = v10 | v24 | v22;
          BOOL v26 = v6 == 7 && v3 == 5;
          BOOL v27 = v6 == 4 && v3 == 5;
          if ((v25 & 1) == 0 && !v26 && !v27)
          {
            char v28 = v20 || v21;
            if (v3 == 7) {
              char v28 = 1;
            }
            if v6 == 5 && (v28) {
              goto LABEL_57;
            }
            v43 = sub_100068600();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              int v46 = v6;
              __int16 v47 = 1024;
              int v48 = v3;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Cannot change mode from %d to %d", buf, 0xEu);
            }

            uint64_t v41 = +[NSError errorDomainMSDWithCode:3727740956 message:@"The operation is not allowed."];
LABEL_103:
            id v17 = (id)v41;
LABEL_104:
            v42 = +[MSDDemoUpdateStatusHub sharedInstance];
            [v42 demoUpdateFailed:v17];

            goto LABEL_26;
          }
LABEL_58:
          unsigned __int8 v29 = [(MSDTargetDevice *)self getSavedFlag];
          v30 = +[MSDPlatform sharedInstance];
          if ([v30 macOS])
          {
            BOOL v31 = (v29 & 2) == 0;
          }
          else
          {
            v32 = +[MSDPlatform sharedInstance];
            if (([v32 iOS] & 1) == 0)
            {

              goto LABEL_66;
            }
            BOOL v31 = (v29 & 2) == 0;
          }
          if (!v31)
          {
            if (v3 == 4)
            {
              [(MSDTargetDevice *)self waitForPricing:60 forReboot:1];
              goto LABEL_67;
            }
            if (v3 == 5 && v6 == 4) {
              [(MSDTargetDevice *)self waitForPricing:0 forReboot:1];
            }
            goto LABEL_72;
          }
LABEL_66:
          if (v3 == 4)
          {
LABEL_67:
            sleep(2u);
            [(MSDTargetDevice *)self setProceeded:1];
            if (os_variant_has_internal_content()) {
              [(MSDTargetDevice *)self delayRebootForTesting];
            }
            goto LABEL_73;
          }
LABEL_72:
          [(MSDTargetDevice *)self setProceeded:0];
LABEL_73:
          if ((v23 & 1) != 0
            || (v3 == 5 ? (BOOL v34 = v6 == 1) : (BOOL v34 = 0),
                !v34 ? (int v35 = 0) : (int v35 = 1),
                v3 == 2 || v35))
          {
            if (![(MSDTargetDevice *)self setDemoDeviceFlag])
            {
              v33 = sub_100068600();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                sub_1000CE810();
              }

              id v17 = 0;
              goto LABEL_104;
            }
          }
          if (v3 == 5)
          {
            [(MSDTargetDevice *)self deleteConfigurationApp];
            v36 = +[MSDProgressUpdater sharedInstance];
            [v36 updateStage:7];

            if ([(MSDTargetDevice *)self allowSnapshotMode])
            {
              v37 = +[MSDWiFiHelper sharedInstance];
              [v37 saveCurrentWiFiSettings];
            }
            if (v6 == 4)
            {
              BOOL v38 = 1;
              [(MSDTargetDevice *)self cleanUpBackgroundState:1];
            }
            else
            {
              BOOL v38 = 1;
            }
          }
          else
          {
            BOOL v38 = v6 == 5;
          }
          [(MSDTargetDevice *)self setMode:v3];
          if (v38) {
            [(MSDTargetDevice *)self enableSnapshotMode:v3 == 5];
          }
          if (v3 == 4) {
            [(MSDTargetDevice *)self rebootForStage:6];
          }
LABEL_97:
          BOOL v18 = 1;
          goto LABEL_98;
        }
      }
    }
LABEL_57:
    char v23 = 0;
    goto LABEL_58;
  }
  v15 = +[MSDDemoUpdateTimeKeeper sharedInstance];
  id v44 = 0;
  unsigned int v16 = [v15 shouldCleanUp:&v44];
  id v17 = v44;

  if (!v16 || [v17 code] != (id)3727741185)
  {

    goto LABEL_28;
  }
  [(MSDTargetDevice *)self forceSwitchToDemoUpdateModeIfNeeded];
LABEL_26:

  BOOL v18 = 0;
LABEL_98:
  objc_sync_exit(v5);

  return v18;
}

- (void)waitForPricing:(int)a3 forReboot:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  unsigned int v7 = +[MSDPricingUpdateController sharedInstance];
  if (v4)
  {
    BOOL v8 = self;
    objc_sync_enter(v8);
    [(MSDTargetDevice *)v8 setAboutToReboot:1];
    objc_sync_exit(v8);
  }
  if (([v7 completed] & 1) == 0)
  {
    if (v5)
    {
      if (v4)
      {
        [v7 stopMonitor];
        BOOL v9 = +[MSDLocalMessageResponder sharedInstance];
        [v9 sendRebootTimeoutMessageToPricing:v5];
      }
      char v10 = sub_100068600();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      LODWORD(v18) = 67109120;
      HIDWORD(v18) = v5;
      v11 = "Defering the operation (up to %d seconds) as Pricing update is not done yet...";
      v12 = v10;
      uint32_t v13 = 8;
    }
    else
    {
      char v10 = sub_100068600();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        v14 = +[MSDProgressUpdater sharedInstance];
        [v14 updateStage:17];

        goto LABEL_13;
      }
      LOWORD(v18) = 0;
      v11 = "Defering the operation until the Pricing update is done...";
      v12 = v10;
      uint32_t v13 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, v13);
    goto LABEL_12;
  }
LABEL_13:
  unint64_t v15 = 0;
  do
  {
    if (objc_msgSend(v7, "completed", v18)) {
      break;
    }
    +[NSThread sleepForTimeInterval:1.0];
    BOOL v16 = v15++ >= v5;
  }
  while (!v16 || (int)v5 < 1);
}

- (void)forceSwitchToDemoModeIfNeeded
{
  uint64_t v3 = [(MSDTargetDevice *)self modeLock];
  objc_sync_enter(v3);
  BOOL v4 = +[MSDKeychainManager sharedInstance];
  uint64_t v5 = [v4 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"];

  if (v5)
  {
    uint64_t v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "The device is enrolled, will force to demo mode now.", buf, 2u);
    }

    if ([(MSDTargetDevice *)self mode] == 4)
    {
      unsigned int v7 = +[MSDDemoUpdateController sharedInstance];
      [v7 migrateDataWithBlockingUI:-[MSDTargetDevice mode](self, "mode") startMigration:1];
    }
    [(MSDTargetDevice *)self deleteConfigurationApp];
    if ([(MSDTargetDevice *)self allowSnapshotMode])
    {
      BOOL v8 = +[MSDWiFiHelper sharedInstance];
      [v8 saveCurrentWiFiSettings];
    }
    if ([(MSDTargetDevice *)self mode] == 2 || [(MSDTargetDevice *)self mode] == 4)
    {
      [(MSDTargetDevice *)self markContentInstallingInstalled];
      BOOL v9 = +[MSDHelperAgent sharedInstance];
      [v9 switchToBackupFolder];

      char v10 = +[MSDProgressUpdater sharedInstance];
      v11 = [v10 bundleInProgress];
      [v11 stopBundleUpdateTimer];
    }
    if ([(MSDTargetDevice *)self mode] == 7) {
      [(MSDTargetDevice *)self clearOSUpdateRequest];
    }
    v12 = +[MSDProgressUpdater sharedInstance];
    [v12 updateStage:7];

    unsigned __int8 v13 = [(MSDTargetDevice *)self getSavedFlag];
    v14 = +[MSDPlatform sharedInstance];
    if (([v14 macOS] & 1) == 0)
    {
      unint64_t v15 = +[MSDPlatform sharedInstance];
      if (([v15 iOS] & 1) == 0)
      {

LABEL_22:
        id v17 = [(MSDTargetDevice *)self helperAgent];
        [v17 clearStagedDeviceAfterUpdateProcess];

        [(MSDTargetDevice *)self setMode:5];
        [(MSDTargetDevice *)self enableSnapshotMode:1];
        goto LABEL_23;
      }
    }
    if ((v13 & 2) != 0) {
      [(MSDTargetDevice *)self waitForPricing:60 forReboot:1];
    }
    goto LABEL_22;
  }
  BOOL v16 = sub_100068600();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "The device has not been enrolled, will not force to demo mode.", v18, 2u);
  }

LABEL_23:
  objc_sync_exit(v3);
}

- (void)forceSwitchToDemoUpdateModeIfNeeded
{
  uint64_t v3 = [(MSDTargetDevice *)self modeLock];
  objc_sync_enter(v3);
  BOOL v4 = +[MSDKeychainManager sharedInstance];
  uint64_t v5 = [v4 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"];

  if (v5)
  {
    uint64_t v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "The device is enrolled and was updating demo content, will force to demo update mode.", buf, 2u);
    }

    if ([(MSDTargetDevice *)self mode] == 4)
    {
      unsigned int v7 = +[MSDProgressUpdater sharedInstance];
      [v7 updateStage:100];

      [(MSDTargetDevice *)self setMode:2];
    }
  }
  else
  {
    BOOL v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "The device has not been enrolled, will not force to demo update mode.", v9, 2u);
    }
  }
  objc_sync_exit(v3);
}

- (BOOL)setDemoDeviceFlag
{
  v2 = +[MSDPreferencesFile sharedInstance];
  uint64_t v3 = +[NSNumber numberWithBool:1];
  unsigned __int8 v4 = [v2 setObject:v3 forKey:@"DemoDevice"];

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000CE810();
    }
  }
  return v4;
}

- (BOOL)setPOSDeviceFlag
{
  v2 = +[MSDPreferencesFile sharedInstance];
  uint64_t v3 = +[NSNumber numberWithBool:1];
  unsigned __int8 v4 = [v2 setObject:v3 forKey:@"POSDevice"];

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000CE878();
    }
  }
  return v4;
}

- (void)setPreferredStoreID:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDPreferencesFile sharedInstance];
  [v4 setObject:v3 forKey:@"PreferredStoreID"];
}

- (NSString)preferredStoreID
{
  v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"PreferredStoreID"];

  return (NSString *)v3;
}

- (void)obliterateDeviceWithAdminCredential:(id)a3
{
  id v3 = objc_alloc_init((Class)DDRResetOptions);
  id v4 = +[MSDPreferencesFile sharedInstance];
  uint64_t v5 = [v4 objectForKey:@"PreserveESimRequested"];

  uint64_t v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    char v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Should we preserve eSim across device obliteration: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  if (!v5 || ([v5 BOOLValue] & 1) == 0) {
    [v3 setEraseDataPlan:1];
  }
  id v7 = [objc_alloc((Class)DDRResetRequest) initWithMode:4 options:v3 reason:@"Demod obliterate Device"];
  BOOL v8 = +[DDRResetService sharedInstance];
  [v8 resetWithRequest:v7 completion:&stru_100152BC8];
}

- (void)backToVirgin:(int)a3
{
  uint64_t v5 = dispatch_semaphore_create(0);
  unsigned int v6 = [(MSDTargetDevice *)self mode];
  id v7 = +[MSDDemoUpdateTimeKeeper sharedInstance];
  id v26 = 0;
  unsigned int v8 = [v7 shouldCleanUp:&v26];
  id v9 = v26;
  char v10 = v9;
  if (v8) {
    unsigned int v8 = [v9 code] == (id)3727741185;
  }

  v11 = sub_100068600();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v6 == 5 || v8)
  {
    if (v12)
    {
      *(_DWORD *)buf = 67109376;
      LODWORD(v28[0]) = v6;
      WORD2(v28[0]) = 1024;
      *(_DWORD *)((char *)v28 + 6) = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "mode = %d, canceling is %d, need an extra reboot to complete the operation.", buf, 0xEu);
    }

    if (a3 == 9)
    {
      v19 = self;
      uint64_t v20 = 8;
    }
    else
    {
      if (a3) {
        goto LABEL_23;
      }
      v19 = self;
      uint64_t v20 = 6;
    }
    [(MSDTargetDevice *)v19 switchModeImmediately:v20];
    goto LABEL_23;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Clearing all nvrams/demo volume/keychain items/preference-file used by demod.", buf, 2u);
  }

  [(MSDTargetDevice *)self deleteNVRam:@"demo-install-state"];
  [(MSDTargetDevice *)self deleteNVRam:@"enable-remap-mode"];
  [(MSDTargetDevice *)self deleteNVRam:@"msd-request"];
  [(MSDTargetDevice *)self deleteNVRam:@"msd-reboot-at"];
  [(MSDTargetDevice *)self deleteNVRam:@"msd-last-auto-reboot"];
  unsigned __int8 v13 = +[MSDPreferencesFile sharedInstance];
  v14 = [v13 objectForKey:@"preserveDDLFlag"];

  if (!v14
    || (unsigned __int8 v15 = [v14 BOOLValue],
        +[MSDPreferencesFile sharedInstance],
        BOOL v16 = objc_claimAutoreleasedReturnValue(),
        [v16 removeObjectForKey:@"preserveDDLFlag"],
        v16,
        (v15 & 1) == 0))
  {
    id v17 = sub_100068600();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28[0] = "-[MSDTargetDevice backToVirgin:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s - Deleting DDL flag in nvram.", buf, 0xCu);
    }

    [(MSDTargetDevice *)self deleteNVRam:@"ownership-warning"];
  }
  uint64_t v18 = +[MSDAccountManager sharedInstance];
  [v18 removeAccounts:0];

  [(MSDTargetDevice *)self manageDemoVolume:@"Delete"];
  [(MSDTargetDevice *)self unregisterCAHeartbeatActivity];
  if (a3 == 9)
  {
    [(MSDTargetDevice *)self obliterateDeviceWithAdminCredential:0];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    [(MSDTargetDevice *)self deactivateDevice];
    BOOL v21 = +[MSDCryptoHandler sharedInstance];
    [v21 deleteSecretKey];

    BOOL v22 = +[MSDAppPrivacyPermissionsHelper sharedInstance];
    [v22 revokePrivacyPermissionsForAllApps];

    char v23 = [(MSDTargetDevice *)self pathForDummyPreferenceFile];
    BOOL v24 = +[NSFileManager defaultManager];
    [v24 removeItemAtPath:v23 error:0];

    char v25 = +[MSDKeychainManager sharedInstance];
    [v25 deleteItemForKey:@"com.apple.mobilestoredemo.keychainItemID"];

    [(MSDTargetDevice *)self enableSnapshotMode:0];
  }

LABEL_23:
}

- (BOOL)removePerHubInfoFromPreferencesForMigration
{
  v2 = +[MSDPreferencesFile sharedInstance];
  unsigned __int8 v3 = [v2 removeObjectsForKeys:&off_100162D40];

  return v3;
}

- (BOOL)cleanUpPreferencesFile
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = [&off_100162D58 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = *(void *)v17;
    *(void *)&long long v3 = 138543362;
    long long v15 = v3;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(&off_100162D58);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        unsigned int v8 = +[MSDPreferencesFile sharedInstance];
        id v9 = [v8 objectForKey:v7];

        if (v9)
        {
          char v10 = sub_100068600();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            uint64_t v21 = v7;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removing legacy key %{public}@ from preference file", buf, 0xCu);
          }

          v11 = +[MSDPreferencesFile sharedInstance];
          unsigned __int8 v12 = [v11 removeObjectForKey:v7];

          if ((v12 & 1) == 0)
          {
            v14 = sub_100068600();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              sub_1000CE8AC();
            }

            return 0;
          }
        }
      }
      id v4 = [&off_100162D58 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (BOOL)migrateDemoDeviceToDemoVolume
{
  id v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = [(MSDTargetDevice *)v2 migratePreferenceAndWifiSettingsToDemoVolume];
  if (v3) {
    [(MSDTargetDevice *)v2 migrateNvramToDemoVolume];
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)migratePreferenceAndWifiSettingsToDemoVolume
{
  unsigned int v3 = +[NSFileManager defaultManager];
  [(MSDTargetDevice *)self manageDemoVolume:@"Setup"];
  if (+[MSDPreferencesFile preferencesFileExists])
  {
    id v4 = [(MSDTargetDevice *)self pathForDummyPreferenceFile];
    unsigned int v5 = [v3 fileExistsAtPath:v4];

    if (v5)
    {
      unsigned int v6 = sub_100068600();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Migration already done.", buf, 2u);
      }
      id v7 = 0;
      unsigned int v8 = 0;
      BOOL v9 = 1;
      goto LABEL_19;
    }
  }
  if (+[MSDPreferencesFile preferencesFileExists]
    || ([(MSDTargetDevice *)self pathForDummyPreferenceFile],
        char v10 = objc_claimAutoreleasedReturnValue(),
        unsigned int v11 = [v3 fileExistsAtPath:v10],
        v10,
        !v11))
  {
    unsigned int v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Migration encountered unexpected error.", v19, 2u);
    }
    id v7 = 0;
    unsigned int v8 = 0;
    goto LABEL_18;
  }
  unsigned __int8 v12 = sub_100068600();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Need to migrate old preferences file and other data.", v21, 2u);
  }

  unsigned int v8 = +[NSDictionary dictionaryWithContentsOfFile:@"/private/var/mnt/com.apple.mobilestoredemo.storage/Preferences/com.apple.MobileStoreDemo.WiFiSetting.plist"];
  [(MSDTargetDevice *)self manageDemoVolume:@"Delete"];
  unsigned __int8 v13 = [(MSDTargetDevice *)self pathForDummyPreferenceFile];
  v14 = +[MSDPreferencesFile preferencesFilePath];
  id v20 = 0;
  unsigned __int8 v15 = [v3 moveItemAtPath:v13 toPath:v14 error:&v20];
  id v7 = v20;

  if ((v15 & 1) == 0)
  {
    unsigned int v6 = sub_100068730();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000CE94C();
    }
    goto LABEL_18;
  }
  if (v8) {
    [(MSDTargetDevice *)self setWifiSettings:v8];
  }
  long long v16 = [(MSDTargetDevice *)self pathForDummyPreferenceFile];
  unsigned __int8 v17 = [v3 createFileAtPath:v16 contents:0 attributes:0];

  if ((v17 & 1) == 0)
  {
    unsigned int v6 = sub_100068730();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000CE918();
    }
LABEL_18:
    BOOL v9 = 0;
LABEL_19:

    goto LABEL_20;
  }
  BOOL v9 = 1;
LABEL_20:

  return v9;
}

- (void)migrateNvramToDemoVolume
{
  unsigned int v3 = [(MSDTargetDevice *)self readNVRam:@"demo-install-state"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", [v3 bytes], 4);
      -[MSDTargetDevice setMode:](self, "setMode:", [v4 intValue]);
      [(MSDTargetDevice *)self deleteNVRam:@"demo-install-state"];
    }
  }
  unsigned int v5 = [(MSDTargetDevice *)self readNVRam:@"msd-reboot-at"];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MSDTargetDevice *)self deleteNVRam:@"msd-reboot-at"];
    }
  }
  [(MSDTargetDevice *)self removeKeyFromPreferenceFile:@"msd-reboot-at"];
  unsigned int v6 = [(MSDTargetDevice *)self readNVRam:@"enable-remap-mode"];

  if (v6) {
    [(MSDTargetDevice *)self deleteNVRam:@"enable-remap-mode"];
  }
  id v7 = [(MSDTargetDevice *)self readNVRam:@"msd-last-auto-reboot"];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MSDTargetDevice *)self deleteNVRam:@"msd-last-auto-reboot"];
    }
  }
  [(MSDTargetDevice *)self removeKeyFromPreferenceFile:@"msd-last-auto-reboot"];
  id v9 = [(MSDTargetDevice *)self readNVRam:@"msd-request"];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [objc_alloc((Class)NSString) initWithData:v9 encoding:4];
      [(MSDTargetDevice *)self setRequest:v8];

      [(MSDTargetDevice *)self deleteNVRam:@"msd-request"];
    }
  }
}

- (BOOL)setupDemoDeviceMetadataFolder
{
  id v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = +[NSFileManager defaultManager];
  [(MSDTargetDevice *)v2 manageDemoVolume:@"Setup"];
  if (![(MSDTargetDevice *)v2 createMobileStoreDemoCache])
  {
    id v8 = sub_100068730();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CEA08();
    }
    goto LABEL_9;
  }
  id v4 = [(MSDTargetDevice *)v2 pathForDummyPreferenceFile];
  unsigned __int8 v5 = [v3 createFileAtPath:v4 contents:0 attributes:0];

  if ((v5 & 1) == 0)
  {
    id v8 = sub_100068730();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(MSDTargetDevice *)v2 pathForDummyPreferenceFile];
      sub_1000CE9B8(v9, (uint64_t)&v10, v8);
    }
LABEL_9:

    BOOL v6 = 0;
    goto LABEL_4;
  }
  BOOL v6 = 1;
LABEL_4:

  objc_sync_exit(v2);
  return v6;
}

- (BOOL)setupFactoryDemoDeviceMetadataFolder
{
  id v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up metadata folder for factory demo device...", v7, 2u);
  }

  id v4 = +[MSDHelperAgent sharedInstance];
  unsigned __int8 v5 = [v4 prepareWorkDirectory:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" writableByNonRoot:1];

  objc_sync_exit(v2);
  return v5;
}

- (id)pathForDummyPreferenceFile
{
  id v2 = [@"/var/mobile/Library/Preferences" stringByAppendingPathComponent:@"com.apple.MobileStoreDemo"];
  unsigned int v3 = [v2 stringByAppendingPathExtension:@"plist"];

  return v3;
}

- (BOOL)setupDummyPreferenceFile
{
  id v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up dummy preference (keep alive) file for factory demo device...", v10, 2u);
  }

  id v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [(MSDTargetDevice *)v2 pathForDummyPreferenceFile];
  unsigned __int8 v6 = [v4 createFileAtPath:v5 contents:0 attributes:0];

  if ((v6 & 1) == 0)
  {
    id v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(MSDTargetDevice *)v2 pathForDummyPreferenceFile];
      sub_1000CE9B8(v9, (uint64_t)v10, v8);
    }
  }
  objc_sync_exit(v2);

  return v6;
}

- (void)cleanupDummyPreferenceFile
{
  unsigned int v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing dummy preference (keep alive) file for factory demo device...", v6, 2u);
  }

  id v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [(MSDTargetDevice *)self pathForDummyPreferenceFile];
  [v4 removeItemAtPath:v5 error:0];
}

- (BOOL)moveFilesToFinalDst:(id)a3 finalPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSDTargetDevice *)self helperAgent];
  unsigned __int8 v9 = [v8 moveStagingToFinal:v6 finalPath:v7];

  if ((v9 & 1) == 0)
  {
    unsigned int v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000CEA3C();
    }
  }
  return v9;
}

- (void)patchBackupFolderInStaging:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSFileManager defaultManager];
  id v6 = [(MSDTargetDevice *)self pathForDummyPreferenceFile];
  id v7 = [v4 stringByAppendingPathComponent:v6];

  if ([v5 fileExistsAtPath:v7])
  {
    id v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preference file already in backup path, removing it.", buf, 2u);
    }

    id v20 = 0;
    unsigned __int8 v9 = [v5 removeItemAtPath:v7 error:&v20];
    id v10 = v20;
    id v11 = v10;
    if ((v9 & 1) == 0)
    {
      long long v16 = sub_100068600();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000CEB34();
      }
      unsigned __int8 v13 = 0;
      goto LABEL_19;
    }
    unsigned __int8 v12 = v10;
  }
  else
  {
    unsigned __int8 v12 = 0;
  }
  unsigned __int8 v13 = [v7 stringByDeletingLastPathComponent];
  if (([v5 fileExistsAtPath:v13] & 1) == 0)
  {
    id v19 = v12;
    unsigned __int8 v14 = [v5 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v19];
    id v11 = v19;

    if ((v14 & 1) == 0)
    {
      long long v16 = sub_100068600();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000CEAB0(v11);
      }
      goto LABEL_19;
    }
    unsigned __int8 v12 = v11;
  }
  id v18 = v12;
  unsigned __int8 v15 = [v5 copyItemAtPath:v6 toPath:v7 error:&v18];
  id v11 = v18;

  if ((v15 & 1) == 0)
  {
    long long v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v17 = [v11 localizedDescription];
      *(_DWORD *)buf = 138543874;
      BOOL v22 = v6;
      __int16 v23 = 2114;
      BOOL v24 = v7;
      __int16 v25 = 2114;
      id v26 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Cannot copy preference file to backup path (from %{public}@ to %{public}@ - %{public}@)", buf, 0x20u);
    }
LABEL_19:
  }
}

- (void)rebootForStage:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int8 v5 = dispatch_semaphore_create(0);
  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reporting progress - reboot", buf, 2u);
  }

  id v7 = +[MSDProgressUpdater sharedInstance];
  [v7 updateStage:v3];

  [(MSDTargetDevice *)self configApplePencilToEnterSleepModeIfPaired];
  id v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Rebooting...", v12, 2u);
  }

  unsigned __int8 v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, " ", v11, 2u);
  }

  id v10 = [(MSDTargetDevice *)self helperAgent];
  [v10 reboot];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)rebootWithSnapshotRevertForStage:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int8 v5 = +[MSDUIHelper sharedInstance];
  [v5 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:0];

  id v6 = +[MSDAnalytics sharedInstance];
  [v6 rollOverCoreAnalyticsLogs];

  id v7 = +[MSDDemoPeerPairingManager sharedInstance];
  [v7 preservePairedPeersData];

  +[MSDGreyMatterHelper preservePrivateAccessTokens];
  [(MSDTargetDevice *)self manageDeviceSnapshot:@"RevertSnapshot"];
  [(MSDTargetDevice *)self saveSnapshotRevertFlagged:1];
  id v8 = +[NSDate now];
  [(MSDTargetDevice *)self saveLastSnapshotRevertTime:v8];

  if (v3 == 33)
  {
    [(MSDTargetDevice *)self shutdown];
  }
  else
  {
    [(MSDTargetDevice *)self rebootForStage:v3];
  }
}

- (void)reboot
{
}

- (void)shutdown
{
  id v2 = dispatch_semaphore_create(0);
  uint64_t v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device shutting down...", v6, 2u);
  }

  id v4 = [objc_alloc((Class)FBSShutdownOptions) initWithReason:@"demod shutdown device"];
  [v4 setRebootType:0];
  unsigned __int8 v5 = +[FBSSystemService sharedService];
  [v5 shutdownWithOptions:v4];

  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)configApplePencilToEnterSleepModeIfPaired
{
  id v2 = objc_alloc_init((Class)HIDManager);
  uint64_t v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Configuring Apple Pencil (if any) before device reboot...", buf, 2u);
  }

  [v2 setDeviceMatching:&off_100162FF8];
  [v2 setDispatchQueue:&_dispatch_main_q];
  [v2 open];
  [v2 activate];
  id v4 = [v2 devices];
  if ([v4 count] == (id)1)
  {
    buf[2] = 1;
    *(_WORD *)buf = 676;
    unsigned __int8 v5 = [v4 firstObject];
    [v5 open];
    [v5 activate];
    id v12 = 0;
    unsigned int v6 = [v5 setReport:buf reportLength:3 withIdentifier:164 forType:2 error:&v12];
    id v7 = v12;
    id v8 = sub_100068600();
    unsigned __int8 v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "HID Report successfully sent to Apple Pencil!", v11, 2u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_1000CEB68(v7);
    }

    [v5 close];
  }
  else
  {
    unsigned __int8 v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v4 count];
      *(_DWORD *)buf = 134217984;
      id v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No or multiple matching Apple Pencil device(s) found: %lu", buf, 0xCu);
    }
  }

  [v2 close];
}

- (void)manualUpdateMode:(BOOL *)a3 allowChange:(BOOL *)a4
{
  if (a3 && a4)
  {
    unsigned int v7 = [(MSDTargetDevice *)self mode];
    if (v7 >= 2)
    {
      *a3 = 0;
      *a4 = v7 == 5;
    }
    else
    {
      *a3 = 1;
      *a4 = [(MSDTargetDevice *)self allowEnteringDemoMode];
    }
  }
  else
  {
    id v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000CEBEC();
    }
  }
}

- (id)deviceInformation:(id)a3
{
  return [(MSDTargetDevice *)self deviceInformation:a3 appendPingInfo:0];
}

- (id)deviceInformationForPing:(id)a3
{
  return [(MSDTargetDevice *)self deviceInformation:a3 appendPingInfo:1];
}

- (id)deviceInformation:(id)a3 appendPingInfo:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  +[NSMutableDictionary dictionaryWithCapacity:0];
  unsigned __int8 v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  unsigned __int8 v15 = sub_10004DE50;
  long long v16 = &unk_100152BF0;
  unsigned __int8 v17 = self;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v7;
  [v6 enumerateObjectsUsingBlock:&v13];

  if (v4)
  {
    id v8 = +[MSDAccountManager sharedInstance];
    unsigned __int8 v9 = [v8 existingAccounts];
    id v10 = [v9 mutableCopy];

    if (v10) {
      [v7 setObject:v10 forKey:@"MSDExistingAccounts"];
    }
  }
  if (objc_msgSend(v7, "count", v13, v14, v15, v16, v17)) {
    id v11 = v7;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (id)getCachingHubFailureEventForPing
{
  id v3 = +[NSMutableDictionary dictionaryWithCapacity:0];
  if (byte_100189A38)
  {
    BOOL v4 = 0;
  }
  else
  {
    unsigned __int8 v5 = [(MSDTargetDevice *)self localHubFailureReason];

    if (v5)
    {
      id v6 = [(MSDTargetDevice *)self localHubFailureReason];
    }
    else
    {
      id v6 = @"Default:Local Hub Not Reachable";
    }
    id v7 = +[NSDictionary dictionaryWithObjectsAndKeys:@"CACHING_HUB_FAILURE", @"error", v6, @"reason", 0];
    id v8 = [(MSDTargetDevice *)self udid];
    unsigned __int8 v9 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v8, @"UniqueDeviceID", v7, @"MSDCachingHubEvent", 0];

    byte_100189A38 = 1;
    id v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unsigned __int8 v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Reporting event:%{public}@", buf, 0xCu);
    }

    id v3 = v9;
    BOOL v4 = v3;
  }

  return v4;
}

- (id)getS3ServerFailureEventForPing
{
  id v3 = +[NSMutableDictionary dictionaryWithCapacity:0];
  BOOL v4 = [(MSDTargetDevice *)self s3ServerFailureReason];

  if (v4)
  {
    unsigned __int8 v5 = [(MSDTargetDevice *)self s3ServerFailureReason];
  }
  else
  {
    unsigned __int8 v5 = @"Default:S3 Server Not Reachable";
  }
  id v6 = +[NSDictionary dictionaryWithObjectsAndKeys:@"S3_SERVER_FAILURE", @"error", v5, @"reason", 0];
  id v7 = [(MSDTargetDevice *)self udid];
  id v8 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v7, @"UniqueDeviceID", v6, @"MSDS3ServerEvent", 0];

  unsigned __int8 v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Reporting event:%{public}@", buf, 0xCu);
  }

  return v8;
}

- (NSString)manifestPath
{
  return (NSString *)@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/Manifest.signed.plist";
}

- (NSString)manifestAndFileDownloadInfoPath
{
  return (NSString *)@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/ManifestAndFileDownloadInfo.plist";
}

- (BOOL)criticalUpdatePrioritized
{
  id v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"criticalContentUpdateOnly"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setCriticalUpdatePrioritized:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting criticalupdate:%d", (uint8_t *)v7, 8u);
  }

  unsigned __int8 v5 = +[MSDPreferencesFile sharedInstance];
  id v6 = +[NSNumber numberWithBool:v3];
  [v5 setObject:v6 forKey:@"criticalContentUpdateOnly"];
}

- (BOOL)saveOperationRequest:(id)a3 requestFlag:(int)a4 completeBy:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (([v8 isEqualToString:@"UpdateContent"] & 1) == 0
    && ([v8 isEqualToString:@"RevertSnapshot"] & 1) == 0)
  {
    uint64_t v6 = [(MSDTargetDevice *)self getSavedFlag];
  }
  if (([v8 isEqualToString:@"UpdateContent"] & 1) == 0
    && ([v8 isEqualToString:@"UpdateOS"] & 1) == 0)
  {
    uint64_t v5 = [(MSDTargetDevice *)self getSavedCompleteByInterval];
  }
  unsigned __int8 v9 = +[NSString stringWithFormat:@"%@:%@:%@:%d:%d", v8, &stru_100155450, &stru_100155450, v6, v5];
  [(MSDTargetDevice *)self setRequest:v9];

  return 1;
}

- (BOOL)saveOperationError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSDTargetDevice *)self getSavedRequest];
  if (v5)
  {
    uint64_t v6 = [v4 localizedFailureReason];

    id v7 = [v4 domain];
    id v8 = [v4 code];
    uint64_t v9 = [v4 localizedDescription];
    id v10 = (void *)v9;
    if (v6)
    {
      id v11 = [v4 localizedFailureReason];
      id v12 = +[NSString stringWithFormat:@"demoUpdateFailed: %@:0x%lx: %@ - %@", v7, v8, v10, v11];
    }
    else
    {
      id v12 = +[NSString stringWithFormat:@"demoUpdateFailed: %@:0x%lx: %@", v7, v8, v9];
    }

    unsigned __int8 v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Saving error message: %{public}@", buf, 0xCu);
    }

    uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0x%08lX", [v4 code]);
    unsigned __int8 v15 = [v4 domain];
    long long v16 = [v4 localizedDescription];
    unsigned __int8 v17 = +[NSString stringWithFormat:@"%@:%@:%@", v14, v15, v16];
    [(MSDTargetDevice *)self setResponse:v17];
  }
  else
  {
    id v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000CEC88();
    }
  }

  return v5 != 0;
}

- (BOOL)deleteOperationRequest
{
  BOOL v3 = [(MSDTargetDevice *)self request];

  if (!v3
    || (+[MSDPreferencesFile sharedInstance],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 removeObjectForKey:@"criticalContentUpdateOnly"],
        v4,
        BOOL v5 = [(MSDTargetDevice *)self removeKeyFromPreferenceFile:@"msd-request"]))
  {
    uint64_t v6 = [(MSDTargetDevice *)self response];

    if (v6)
    {
      LOBYTE(v5) = [(MSDTargetDevice *)self removeKeyFromPreferenceFile:@"msd-response"];
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)deleteOperationRequestAndQuitHelper
{
  BOOL v3 = [(MSDTargetDevice *)self deleteOperationRequest];
  if (v3)
  {
    id v4 = [(MSDTargetDevice *)self helperAgent];
    unsigned __int8 v5 = [v4 quitHelper];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)decodeComponentIdx:(int)a3 forSavedString:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 componentsSeparatedByString:@":"];
    id v8 = sub_100068600();
    uint64_t v9 = a3;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v7 objectAtIndexedSubscript:a3];
      v15[0] = 67109378;
      v15[1] = a3;
      __int16 v16 = 2114;
      unsigned __int8 v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "components[%d] = %{public}@", (uint8_t *)v15, 0x12u);
    }
    if ((unint64_t)[v7 count] > a3
      && ([v7 objectAtIndexedSubscript:a3],
          id v12 = objc_claimAutoreleasedReturnValue(),
          id v13 = [v12 length],
          v12,
          v13))
    {
      id v11 = [v7 objectAtIndexedSubscript:v9];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)getSavedRequest
{
  BOOL v3 = [(MSDTargetDevice *)self request];
  id v4 = [(MSDTargetDevice *)self decodeComponentIdx:0 forSavedString:v3];

  return v4;
}

- (int)getSavedFlag
{
  BOOL v3 = [(MSDTargetDevice *)self request];
  id v4 = [(MSDTargetDevice *)self decodeComponentIdx:3 forSavedString:v3];

  if (v4) {
    int v5 = [v4 intValue];
  }
  else {
    int v5 = 1;
  }

  return v5;
}

- (int)getSavedCompleteByInterval
{
  BOOL v3 = [(MSDTargetDevice *)self request];
  id v4 = [(MSDTargetDevice *)self decodeComponentIdx:4 forSavedString:v3];

  if (v4) {
    int v5 = [v4 intValue];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (id)getSavedError
{
  BOOL v3 = [(MSDTargetDevice *)self response];
  id v4 = [(MSDTargetDevice *)self decodeComponentIdx:0 forSavedString:v3];

  int v5 = [(MSDTargetDevice *)self response];
  uint64_t v6 = [(MSDTargetDevice *)self decodeComponentIdx:1 forSavedString:v5];

  id v7 = [(MSDTargetDevice *)self response];
  id v8 = [(MSDTargetDevice *)self decodeComponentIdx:2 forSavedString:v7];

  unsigned int v15 = 0;
  uint64_t v9 = +[NSScanner scannerWithString:v4];
  id v10 = v9;
  if (v4)
  {
    if ([v9 scanHexInt:&v15])
    {
      uint64_t v11 = v15;
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      id v19 = v8;
      id v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v13 = +[NSError errorWithDomain:v6 code:v11 userInfo:v12];
    }
    else
    {
      id v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        unsigned __int8 v17 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to decode saved error code: %{public}@; ignoring",
          buf,
          0xCu);
      }
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (NSDate)lastRebootTime
{
  v7[0] = 0;
  v7[1] = 0;
  size_t v6 = 16;
  *(void *)id v8 = 0x1500000001;
  if (sysctl(v8, 2u, v7, &v6, 0, 0) == -1 || v7[0] == 0)
  {
    int v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000CECBC();
    }

    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = +[NSDate dateWithTimeIntervalSince1970:(double)v7[0]];
  }

  return (NSDate *)v3;
}

- (NSNumber)nandSize
{
  *(void *)mainPort = 0;
  if (IOMasterPort(0, &mainPort[1]))
  {
    size_t v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000CEDF4();
    }
  }
  else
  {
    CFDictionaryRef v2 = IOBSDNameMatching(mainPort[1], 0, "disk0");
    if (v2)
    {
      if (IOServiceGetMatchingServices(mainPort[1], v2, mainPort))
      {
        size_t v6 = sub_100068600();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_1000CEDC0();
        }
      }
      else if (mainPort[0])
      {
        io_registry_entry_t v3 = IOIteratorNext(mainPort[0]);
        if (v3)
        {
          CFProperty = (void *)IORegistryEntryCreateCFProperty(v3, @"Size", kCFAllocatorDefault, 0);
          if (CFProperty) {
            goto LABEL_7;
          }
          size_t v6 = sub_100068600();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            sub_1000CED8C();
          }
        }
        else
        {
          size_t v6 = sub_100068600();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            sub_1000CED58();
          }
        }
      }
      else
      {
        size_t v6 = sub_100068600();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_1000CED24();
        }
      }
    }
    else
    {
      size_t v6 = sub_100068600();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000CECF0();
      }
    }
  }

  CFProperty = 0;
LABEL_7:
  if (mainPort[0]) {
    IOObjectRelease(mainPort[0]);
  }

  return (NSNumber *)CFProperty;
}

- (NSString)OSVersion
{
  CFDictionaryRef v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

- (NSString)OSBuild
{
  CFDictionaryRef v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

- (NSString)demodVersion
{
  CFDictionaryRef v2 = +[NSBundle mainBundle];
  io_registry_entry_t v3 = [v2 objectForInfoDictionaryKey:@"CFBundleVersion"];

  return (NSString *)v3;
}

- (NSString)packageVersion
{
  return 0;
}

- (NSString)productType
{
  CFDictionaryRef v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

- (int64_t)batteryCapacity
{
  CFDictionaryRef v2 = (void *)MGCopyAnswer();
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (BOOL)demoSetup
{
  if ([(MSDTargetDevice *)self mode]) {
    return 1;
  }
  id v4 = [(MSDTargetDevice *)self request];

  return v4 != 0;
}

- (int)activationConfigurationFlags
{
  CFDictionaryRef v2 = MAECopyActivationRecordWithError();
  id v3 = 0;
  if (v3)
  {
    id v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000CEE5C(v3);
    }
    goto LABEL_9;
  }
  if (!v2)
  {
    id v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000CEE28();
    }
LABEL_9:
    int v5 = 0;
    goto LABEL_4;
  }
  id v4 = [v2 objectForKeyedSubscript:@"DeviceConfigurationFlags"];
  int v5 = [v4 intValue];
LABEL_4:

  return v5;
}

- (BOOL)isVerifiedDemoDevice
{
  if (os_variant_has_internal_content()
    && (+[MSDTestPreferences sharedInstance],
        id v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 fakeActivationDemoBit],
        v3,
        v4))
  {
    int v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device is running internal build and wants to fake demo bit; Pass as demo device!",
        v8,
        2u);
    }

    LOBYTE(v6) = 1;
  }
  else
  {
    return ([(MSDTargetDevice *)self activationConfigurationFlags] >> 1) & 1;
  }
  return v6;
}

- (BOOL)isVerifiedPOSDevice
{
  return ([(MSDTargetDevice *)self activationConfigurationFlags] >> 2) & 1;
}

- (BOOL)isPressDemoDevice
{
  if (!+[MSDOSFeatureFlags isPressDemoModeEnabled])
  {
    unsigned int v4 = [(MSDTargetDevice *)self hubSuppliedSettings];
    int v5 = v4;
    if (v4)
    {
      BOOL v6 = [v4 objectForKey:@"DemoMode"];
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned __int8 v3 = [v6 isEqualToString:@"press"];
LABEL_15:

          return v3;
        }
      }
    }
    id v7 = [(MSDTargetDevice *)self getDeviceOptions];
    BOOL v6 = v7;
    if (v7)
    {
      id v8 = [v7 objectForKey:@"demo_mode"];
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        unsigned __int8 v3 = [v8 isEqualToString:@"press"];
      }
      else {
        unsigned __int8 v3 = 0;
      }
    }
    else
    {
      unsigned __int8 v3 = 0;
    }
    goto LABEL_15;
  }
  return 1;
}

- (BOOL)isContentFrozen
{
  if ([(MSDTargetDevice *)self mode] != 5) {
    return 0;
  }

  return [(MSDTargetDevice *)self allowSnapshotMode];
}

- (BOOL)isBetterTogetherDemo
{
  CFDictionaryRef v2 = [(MSDTargetDevice *)self getDeviceOptions];
  unsigned __int8 v3 = v2;
  if (v2)
  {
    unsigned int v4 = [v2 objectForKey:@"enable_better_together"];
    int v5 = v4;
    if (v4) {
      unsigned __int8 v6 = [v4 BOOLValue];
    }
    else {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)deactivateDevice
{
  char v2 = MAEDeactivateDeviceWithError();
  id v3 = 0;
  if ((v2 & 1) == 0)
  {
    unsigned int v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deactivation failed with error - %{public}@", buf, 0xCu);
    }
  }
  return v2;
}

- (NSData)certificateHash
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"CertificateHash"];

  return (NSData *)v3;
}

- (BOOL)isDemoEligible
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"DemoEligible"];

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (BOOL)isOfflineMode
{
  unint64_t v3 = [(MSDTargetDevice *)self typeOfDemoDevice];
  unsigned __int8 v4 = [(MSDTargetDevice *)self getDemoEnrollmentFlag];
  unsigned __int8 v5 = [v4 isEqualToString:@"enrollmentSuccess"];

  if (![(MSDTargetDevice *)self mode] && (v3 == 5 || v3 == 3)) {
    return v5 ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)dcotaOfflineModeDevice
{
  unsigned __int8 v3 = [(MSDTargetDevice *)self isDemoEligible];
  unint64_t v4 = [(MSDTargetDevice *)self typeOfDemoDevice];
  unsigned __int8 v5 = [(MSDTargetDevice *)self isOfflineMode];
  if (v4 == 5) {
    unsigned __int8 v6 = v5;
  }
  else {
    unsigned __int8 v6 = 0;
  }
  return v6 & v3;
}

- (BOOL)cachedBundleInstallAttempted
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  unsigned __int8 v3 = [v2 objectForKey:@"CachedBundleInstallState"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSString)cachedBundleInstallState
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  unsigned __int8 v3 = [v2 objectForKey:@"CachedBundleInstallState"];

  return (NSString *)v3;
}

- (void)setCachedBundleInstallState:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDPreferencesFile sharedInstance];
  [v4 setObject:v3 forKey:@"CachedBundleInstallState"];
}

- (NSString)installedFactoryBundleID
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"InstalledFactoryBundleID"];

  if (v3) {
    goto LABEL_5;
  }
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.demo-settings"];
  id v3 = [v4 objectForKey:@"InstalledFactoryBundleID"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

LABEL_5:
      id v3 = v3;
      unsigned __int8 v5 = v3;
      goto LABEL_6;
    }
    id v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000CEEE0((uint64_t)v3, v7);
    }
  }
  unsigned __int8 v5 = 0;
LABEL_6:

  return (NSString *)v5;
}

- (void)setInstalledFactoryBundleID:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDPreferencesFile sharedInstance];
  [v4 setObject:v3 forKey:@"InstalledFactoryBundleID"];
}

- (void)kickOffCachedBundleInstall
{
  char v22 = 0;
  unsigned int v3 = [(MSDTargetDevice *)self isOfflineMode];
  unsigned int v4 = [(MSDTargetDevice *)self isVerifiedDemoDevice];
  unsigned int v5 = [(MSDTargetDevice *)self dcotaOfflineModeDevice];
  unsigned __int8 v6 = [(MSDTargetDevice *)self getDemoEnrollmentFlag];

  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Kicking off cached bundle install for current device locale", buf, 2u);
  }

  id v8 = (void *)os_transaction_create();
  if (!v6)
  {
    if (v4)
    {
      uint64_t v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting up demo device metadata folder for DCOTA managed device", v20, 2u);
      }

      [(MSDTargetDevice *)self setupDemoDeviceMetadataFolder];
    }
    else if (v3)
    {
      id v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting up metadata folder for non-DCOTA managed device", v19, 2u);
      }

      [(MSDTargetDevice *)self setupFactoryDemoDeviceMetadataFolder];
    }
  }
  uint64_t v11 = sub_100068600();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)NSErrorUserInfoKey v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Waiting for buddy to quit...", v18, 2u);
  }

  [(MSDTargetDevice *)self waitForBuddyWithTimeout];
  id v12 = +[MSDDemoUpdateController sharedInstance];
  [v12 installCachedContentForCurrentLocale:&v22];

  if (v5)
  {
    if (!v6)
    {
      id v13 = sub_100068600();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned __int8 v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Setting up device to perform enrollment retries", v17, 2u);
      }

      [(MSDTargetDevice *)self setDemoEnrollmentFlag:@"enrollmentStarted"];
    }
    uint64_t v14 = +[MSDFindMyHub sharedInstance];
    [v14 setupOfflineModeEnrollmentRetry];
  }
  if (v22)
  {
    if (os_variant_has_internal_content()) {
      [(MSDTargetDevice *)self delayRebootForTesting];
    }
    unsigned int v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rebooting device after cached bundle install", v16, 2u);
    }

    [(MSDTargetDevice *)self reboot];
  }
}

- (id)hubCertificateIdentifier
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  unsigned int v3 = [v2 objectForKey:@"HubCertificateIdentifier"];

  return v3;
}

- (BOOL)saveHubCertificateIdentifer:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[MSDPreferencesFile sharedInstance];
  [v4 setObject:v3 forKey:@"HubCertificateIdentifier"];

  unsigned int v5 = +[MSDPreferencesFile sharedInstance];
  LOBYTE(v3) = [v5 removeObjectsForKeys:&off_100162D70];

  return (char)v3;
}

- (NSString)hubHostName
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"HubHostName"];

  return (NSString *)v3;
}

- (void)setHubHostName:(id)a3
{
  id v3 = a3;
  if (+[MSDPreferencesFile preferencesFileExists])
  {
    unsigned int v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Saving hub host name: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    unsigned int v5 = +[MSDPreferencesFile sharedInstance];
    [v5 setObject:v3 forKey:@"HubHostName"];
  }
}

- (id)hubHostNameList
{
  id v3 = +[MSDPreferencesFile sharedInstance];
  unsigned int v4 = [v3 objectForKey:@"HubHostNameList"];

  if (!v4)
  {
    unsigned int v5 = [(MSDTargetDevice *)self hubHostName];
    if (v5) {
      +[NSArray arrayWithObject:v5];
    }
    else {
    unsigned int v4 = +[NSArray array];
    }
    [(MSDTargetDevice *)self saveHubHostNameList:v4];
  }

  return v4;
}

- (BOOL)saveHubHostNameList:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v3 = +[NSArray array];
  }
  unsigned int v4 = +[MSDPreferencesFile sharedInstance];
  unsigned __int8 v5 = [v4 setObject:v3 forKey:@"HubHostNameList"];

  return v5;
}

- (NSString)hubPort
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"HubPort"];

  return (NSString *)v3;
}

- (void)setHubPort:(id)a3
{
  id v3 = a3;
  if (+[MSDPreferencesFile preferencesFileExists])
  {
    unsigned int v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Saving hub port: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    unsigned __int8 v5 = +[MSDPreferencesFile sharedInstance];
    [v5 setObject:v3 forKey:@"HubPort"];
  }
}

- (int64_t)findMyHubRetryAtTime
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"FMHRetryAtTime"];

  if (v3) {
    id v4 = [v3 integerValue];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (void)saveFindMyHubRetryAtTime:(int64_t)a3
{
  id v5 = +[MSDPreferencesFile sharedInstance];
  if (a3 <= 0)
  {
    [v5 removeObjectForKey:@"FMHRetryAtTime"];
  }
  else
  {
    id v4 = +[NSNumber numberWithInteger:a3];
    [v5 setObject:v4 forKey:@"FMHRetryAtTime"];
  }
}

- (int64_t)hubLastOnlineTime
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"HubLastOnlineTime"];

  if (v3) {
    id v4 = [v3 integerValue];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (void)saveHubLastOnlineTime:(int64_t)a3
{
  id v5 = +[MSDPreferencesFile sharedInstance];
  if (a3 <= 0)
  {
    [v5 removeObjectForKey:@"HubLastOnlineTime"];
  }
  else
  {
    id v4 = +[NSString stringWithFormat:@"%ld", a3];
    [v5 setObject:v4 forKey:@"HubLastOnlineTime"];
  }
}

- (id)lastSnapshotRevertTime
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"LastSnapshotRevertTime"];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[NSDate distantPast];
  }
  id v5 = v4;

  return v5;
}

- (void)saveLastSnapshotRevertTime:(id)a3
{
  id v5 = a3;
  id v3 = +[MSDPreferencesFile sharedInstance];
  id v4 = v3;
  if (v5) {
    [v3 setObject:v5 forKey:@"LastSnapshotRevertTime"];
  }
  else {
    [v3 removeObjectForKey:@"LastSnapshotRevertTime"];
  }
}

- (BOOL)snapshotRevertFlagged
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"SnapshotRevertFlagged"];

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)saveSnapshotRevertFlagged:(BOOL)a3
{
  unsigned __int8 v4 = +[MSDPreferencesFile sharedInstance];
  id v5 = v4;
  if (a3) {
    [v4 setObject:&__kCFBooleanTrue forKey:@"SnapshotRevertFlagged"];
  }
  else {
    [v4 removeObjectForKey:@"SnapshotRevertFlagged"];
  }
}

- (id)lastShallowRefreshTime
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  [v2 reload];

  id v3 = +[MSDPreferencesFile sharedInstance];
  unsigned __int8 v4 = [v3 objectForKey:@"LastShallowRefreshTime"];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = +[NSDate distantPast];
  }
  int v6 = v5;

  return v6;
}

- (void)saveLastShallowRefreshTime:(id)a3
{
  id v5 = a3;
  id v3 = +[MSDPreferencesFile sharedInstance];
  unsigned __int8 v4 = v3;
  if (v5) {
    [v3 setObject:v5 forKey:@"LastShallowRefreshTime"];
  }
  else {
    [v3 removeObjectForKey:@"LastShallowRefreshTime"];
  }
}

- (id)lastSettingsUpdatedTime
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"LastSettingsUpdatedTime"];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[NSDate distantPast];
  }
  id v5 = v4;

  return v5;
}

- (void)saveLastSettingsUpdatedTime:(id)a3
{
  id v5 = a3;
  id v3 = +[MSDPreferencesFile sharedInstance];
  id v4 = v3;
  if (v5) {
    [v3 setObject:v5 forKey:@"LastSettingsUpdatedTime"];
  }
  else {
    [v3 removeObjectForKey:@"LastSettingsUpdatedTime"];
  }
}

- (id)hubSuppliedSettings
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"HubSuppliedSettings"];

  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 objectForKey:@"SettingsID"];

      if (v4)
      {
        id v5 = v3;
        goto LABEL_5;
      }
      id v7 = sub_100068600();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000CEF7C(v7, v8, v9);
      }
    }
  }
  id v5 = 0;
LABEL_5:

  return v5;
}

- (BOOL)saveHubSuppliedSettings:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  id v5 = [v4 objectForKey:@"SettingsID"];

  if (!v5)
  {
    id v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000CEFF8(v12, v13, v14);
    }

    goto LABEL_10;
  }
  int v6 = +[MSDPreferencesFile sharedInstance];
  unsigned int v7 = [v6 setObject:v4 forKey:@"HubSuppliedSettings"];

  if (!v7)
  {
LABEL_10:
    BOOL v10 = 0;
    goto LABEL_6;
  }
  uint64_t v8 = +[NSDate date];
  [(MSDTargetDevice *)self saveLastSettingsUpdatedTime:v8];

  uint64_t v9 = +[NSDistributedNotificationCenter defaultCenter];
  BOOL v10 = 1;
  [v9 postNotificationName:@"com.apple.MobileStoreDemo.SettingsUpdated" object:0 userInfo:0 deliverImmediately:1];

LABEL_6:
  return v10;
}

- (id)iCloudAccountRecoveryKey
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"iCloudAccountRecoveryKey"];

  return v3;
}

- (void)saveiCloudAccountRecoveryKey:(id)a3
{
  id v5 = a3;
  id v3 = +[MSDPreferencesFile sharedInstance];
  id v4 = v3;
  if (v5) {
    [v3 setObject:v5 forKey:@"iCloudAccountRecoveryKey"];
  }
  else {
    [v3 removeObjectForKey:@"iCloudAccountRecoveryKey"];
  }
}

- (BOOL)iCloudAccountSyncNeeded
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"iCloudAccountSyncNeeded"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)saveiCloudAccountSyncNeeded:(BOOL)a3
{
  unsigned __int8 v4 = +[MSDPreferencesFile sharedInstance];
  id v5 = v4;
  if (a3) {
    [v4 setObject:&__kCFBooleanTrue forKey:@"iCloudAccountSyncNeeded"];
  }
  else {
    [v4 removeObjectForKey:@"iCloudAccountSyncNeeded"];
  }
}

- (id)demoUserHomePath
{
  return NSHomeDirectoryForUser(@"mobile");
}

- (void)saveRequiredDeletableSystemApps
{
  char v2 = +[LSApplicationWorkspace defaultWorkspace];
  +[NSMutableArray arrayWithCapacity:0];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100051848;
  v5[3] = &unk_100152C18;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v6;
  [v2 enumerateBundlesOfType:7 block:v5];

  unsigned __int8 v4 = +[MSDPreferencesFile sharedInstance];
  [v4 setObject:v3 forKey:@"RequiredDeletableSystemApps"];
}

- (id)requiredDeletableSystemApps
{
  char v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"RequiredDeletableSystemApps"];

  return v3;
}

- (id)installedDeletableSystemApps
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned __int8 v4 = [(MSDTargetDevice *)self requiredDeletableSystemApps];
  id v5 = [v4 mutableCopy];

  +[NSMutableArray arrayWithCapacity:0];
  BOOL v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_100051A74;
  uint64_t v13 = &unk_100152C40;
  id v14 = v5;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v15;
  id v7 = v5;
  [v3 enumerateBundlesOfType:1 block:&v10];
  uint64_t v8 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v6, v10, v11, v12, v13);

  return v8;
}

- (void)installAndWaitForSystemApps
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned __int8 v4 = [(MSDTargetDevice *)self requiredDeletableSystemApps];
  id v5 = [v4 mutableCopy];

  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  if (os_variant_has_internal_content())
  {
    id v7 = +[MSDTestPreferences sharedInstance];
    unsigned int v8 = [v7 systemAppTimeoutInterval];

    if (v8)
    {
      uint64_t v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v29 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Override system app timeout interval: %lu", buf, 0xCu);
      }
    }
    else
    {
      unsigned int v8 = 1800;
    }
    BOOL v10 = +[MSDTestPreferences sharedInstance];
    unsigned int v11 = [v10 systemAppPollingInterval];

    if (v11)
    {
      id v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v29 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Override system app polling interval: %lu", buf, 0xCu);
      }

      goto LABEL_13;
    }
  }
  else
  {
    unsigned int v8 = 1800;
  }
  unsigned int v11 = 30;
LABEL_13:
  unint64_t v13 = v8;
  *(void *)&long long v6 = 138543362;
  long long v20 = v6;
  while (objc_msgSend(v5, "count", v20))
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100051F38;
    v21[3] = &unk_100152C68;
    id v14 = v5;
    id v22 = v14;
    __int16 v23 = &v24;
    [v3 enumerateBundlesOfType:1 block:v21];
    if (![v14 count])
    {
      __int16 v16 = sub_100068600();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        unsigned __int8 v17 = "All system apps have been installed. Move forward.";
        NSErrorUserInfoKey v18 = v16;
        uint32_t v19 = 2;
        goto LABEL_24;
      }
LABEL_25:

      break;
    }
    if (v25[3] >= (unint64_t)v8)
    {
      __int16 v16 = sub_100068600();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        unint64_t v29 = v13;
        __int16 v30 = 2114;
        id v31 = v5;
        unsigned __int8 v17 = "Waited %lu seconds for system apps to install. Now moving forward. Still missing the following apps - %{public}@";
        NSErrorUserInfoKey v18 = v16;
        uint32_t v19 = 22;
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
      goto LABEL_25;
    }
    sleep(v11);
    v25[3] += v11;
    id v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v20;
      unint64_t v29 = (unint64_t)v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Still waiting for system apps %{public}@", buf, 0xCu);
    }
  }
  _Block_object_dispose(&v24, 8);
}

- (BOOL)isPasscodeModificationAllowed
{
  char v2 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v3 = [v2 isPasscodeModificationAllowed];

  return v3;
}

- (BOOL)setPasscodeModificationAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v4 = +[MCProfileConnection sharedConnection];
  id v5 = [v4 errorCheckedSetBoolValue:v3 forSetting:MCFeaturePasscodeModificationAllowed];
  if (v5)
  {
    long long v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000CF074(v3, v5);
    }
  }
  return v5 == 0;
}

- (BOOL)createTemporaryPasscodeIfNeeded
{
  BOOL v3 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating temporary device passcode...", buf, 2u);
  }

  if ([v3 isPasscodeSet])
  {
    id v5 = 0;
    unsigned __int8 v6 = 1;
    goto LABEL_12;
  }
  unsigned __int8 v7 = [(MSDTargetDevice *)self isPasscodeModificationAllowed];
  if ((v7 & 1) == 0)
  {
    unsigned int v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Passcode modification is NOT allowed. Temporarily lifting the restriction!", v12, 2u);
    }

    if (![(MSDTargetDevice *)self setPasscodeModificationAllowed:1])
    {
      id v5 = 0;
      unsigned __int8 v6 = 0;
      goto LABEL_11;
    }
  }
  id v11 = 0;
  unsigned __int8 v6 = [v3 changePasscodeFrom:0 to:@"123456" outError:&v11];
  id v5 = v11;
  if (v6)
  {
    if (v7) {
      goto LABEL_12;
    }
LABEL_11:
    [(MSDTargetDevice *)self setPasscodeModificationAllowed:0];
    goto LABEL_12;
  }
  BOOL v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1000CF120(v5);
  }

  if ((v7 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:

  return v6;
}

- (BOOL)removeTemporaryPasscodeIfNeeded
{
  BOOL v3 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing temporary device passcode...", buf, 2u);
  }

  if (![v3 isPasscodeSet])
  {
    id v8 = 0;
    BOOL v9 = 1;
    goto LABEL_15;
  }
  unsigned __int8 v5 = [(MSDTargetDevice *)self isPasscodeModificationAllowed];
  if ((v5 & 1) == 0)
  {
    unsigned __int8 v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Passcode modification is NOT allowed. Temporarily lifting the restriction!", v13, 2u);
    }

    if (![(MSDTargetDevice *)self setPasscodeModificationAllowed:1])
    {
      id v8 = 0;
      BOOL v9 = 0;
      goto LABEL_10;
    }
  }
  id v12 = 0;
  unsigned __int8 v7 = [v3 changePasscodeFrom:@"123456" to:0 outError:&v12];
  id v8 = v12;
  if (v7)
  {
    BOOL v9 = 1;
    if ((v5 & 1) == 0) {
LABEL_10:
    }
      [(MSDTargetDevice *)self setPasscodeModificationAllowed:0];
  }
  else
  {
    BOOL v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000CF1A4(v8);
    }

    BOOL v9 = 0;
  }
LABEL_15:

  return v9;
}

- (BOOL)isDDLDevice
{
  char v2 = [(MSDTargetDevice *)self readNVRam:@"ownership-warning"];
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CF228(v8, v9, v10);
    }

    goto LABEL_16;
  }
  BOOL v3 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", [v2 bytes], 4);
  unsigned __int8 v4 = sub_100068600();
  unsigned __int8 v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000CF2A4();
    }

LABEL_16:
    BOOL v3 = 0;
    unsigned __int8 v6 = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000CF2D8();
  }

  if ([v3 isEqualToString:@"1"]) {
    unsigned __int8 v6 = 1;
  }
  else {
    unsigned __int8 v6 = [v3 isEqualToString:@"2"];
  }
LABEL_9:

  return v6;
}

- (id)readNVRam:(id)a3
{
  BOOL v3 = (__CFString *)a3;
  mach_port_t mainPort = 0;
  if (IOMasterPort(bootstrap_port, &mainPort))
  {
    id v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CF380();
    }
  }
  else
  {
    io_registry_entry_t v4 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
    if (v4)
    {
      io_object_t v5 = v4;
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, v3, kCFAllocatorDefault, 0);
      IOObjectRelease(v5);
      goto LABEL_4;
    }
    id v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CF34C();
    }
  }

  CFProperty = 0;
LABEL_4:

  return CFProperty;
}

- (BOOL)deleteNVRam:(id)a3
{
  id v4 = a3;
  io_object_t v5 = [(MSDTargetDevice *)self helperAgent];
  unsigned __int8 v6 = [v5 deleteNvram:v4];

  return v6;
}

- (BOOL)setSEPDemoMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting SEP demo mode to: %{BOOL}d", (uint8_t *)v8, 8u);
  }

  int v5 = AMFIDemoModeSetState();
  if (v5)
  {
    unsigned __int8 v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000CF3B4();
    }
  }
  return v5 == 0;
}

- (BOOL)toggleSEPDemoModeOnManagedPreferencesChange
{
  BOOL v3 = [(MSDTargetDevice *)self managedStoreDemoMode];

  return [(MSDTargetDevice *)self setSEPDemoMode:v3];
}

- (BOOL)turnOnDemoMode
{
  if ([(MSDTargetDevice *)self isPressDemoDevice])
  {
    return [(MSDTargetDevice *)self turnOnPressDemoMode];
  }
  else
  {
    return [(MSDTargetDevice *)self turnOnStoreDemoMode];
  }
}

- (BOOL)turnOnStoreDemoMode
{
  BOOL v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Turning on Store Demo Mode.", v6, 2u);
  }

  if (![(MSDTargetDevice *)self storeDemoMode])
  {
    id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.demo-settings"];
    [v4 setObject:&__kCFBooleanTrue forKey:@"StoreDemoMode"];
    [v4 setObject:&__kCFBooleanTrue forKey:@"LockIcons"];
    [v4 synchronize];
  }
  return 1;
}

- (BOOL)turnOnPressDemoMode
{
  BOOL v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Turning on Press Demo Mode.", v6, 2u);
  }

  if (![(MSDTargetDevice *)self pressDemoMode])
  {
    id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.demo-settings"];
    [v4 setObject:&__kCFBooleanTrue forKey:@"PressDemoMode"];
    [v4 synchronize];
  }
  return 1;
}

- (BOOL)isDemoModeOn
{
  if ([(MSDTargetDevice *)self isPressDemoDevice])
  {
    return [(MSDTargetDevice *)self pressDemoMode];
  }
  else
  {
    return [(MSDTargetDevice *)self storeDemoMode];
  }
}

- (BOOL)managedStoreDemoMode
{
  int IsForced = CFPreferencesAppValueIsForced(@"StoreDemoMode", @"com.apple.demo-settings");
  if (IsForced) {
    LOBYTE(IsForced) = CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0) != 0;
  }
  return IsForced;
}

- (BOOL)storeDemoMode
{
  return [(MSDTargetDevice *)self demoModeValueForKey:@"StoreDemoMode"];
}

- (BOOL)pressDemoMode
{
  return [(MSDTargetDevice *)self demoModeValueForKey:@"PressDemoMode"];
}

- (BOOL)demoModeValueForKey:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.demo-settings"];
  int v5 = [v4 objectForKey:v3];
  if (!v5)
  {
LABEL_7:
    unsigned __int8 v6 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unsigned __int8 v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000CF41C();
    }

    goto LABEL_7;
  }
  unsigned __int8 v6 = [v5 BOOLValue];
LABEL_8:

  return v6;
}

- (void)enableSnapshotMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(MSDTargetDevice *)self allowSnapshotMode])
  {
    int v5 = self;
    uint64_t v6 = 27;
    goto LABEL_5;
  }
  if (v3)
  {
    [(MSDTargetDevice *)self removeTemporaryPasscodeIfNeeded];
    [(MSDTargetDevice *)self manageDeviceSnapshot:@"CreateSnapshot"];
    int v5 = self;
    uint64_t v6 = 8;
LABEL_5:
    [(MSDTargetDevice *)v5 rebootForStage:v6];
    return;
  }

  [(MSDTargetDevice *)self rebootWithSnapshotRevertForStage:0];
}

- (void)manageDeviceSnapshot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"UnmountSnapshot"])
  {
    [(MSDTargetDevice *)self manageUserVolume:v4];
    [(MSDTargetDevice *)self manageDataVolume:v4];
  }
  else
  {
    [(MSDTargetDevice *)self manageDataVolume:v4];
    [(MSDTargetDevice *)self manageUserVolume:v4];
  }
}

- (void)manageDataVolume:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDTargetDevice *)self helperAgent];
  [v5 manageDataVolume:v4];
}

- (void)manageDemoVolume:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDTargetDevice *)self helperAgent];
  [v5 manageDemoVolume:v4];
}

- (void)manageUserVolume:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDTargetDevice *)self helperAgent];
  [v5 manageUserVolume:v4 forUser:@"mobile"];
}

- (void)disableLaunchdServicesIfNeededForWatch
{
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.demo-settings"];
  if ([v4 integerForKey:@"FProgramNumber"] != (id)300)
  {
    BOOL v3 = [(MSDTargetDevice *)self helperAgent];
    [v3 disableLaunchdServicesForWatch];
  }
}

- (void)disableSUAutoDownloadForWatch
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.subridge"];
  [v2 setObject:&__kCFBooleanTrue forKey:@"SUDisableAutoScan"];
  [v2 setObject:&__kCFBooleanTrue forKey:@"SkipAutoDownload"];
  [v2 synchronize];
}

- (void)setupWorkFolderForBootTask
{
  BOOL v3 = [(MSDTargetDevice *)self helperAgent];
  [v3 prepareWorkDirectory:@"/private/var/demo_backup" writableByNonRoot:0];

  id v4 = +[MSDPlatform sharedInstance];
  unsigned int v5 = [v4 macOS];

  if (v5)
  {
    id v6 = [(MSDTargetDevice *)self helperAgent];
    [v6 prepareWorkDirectory:@"/private/var/dekota" writableByNonRoot:0];
  }
}

- (void)destroyWorkFolderForBootTask
{
  BOOL v3 = [(MSDTargetDevice *)self helperAgent];
  [v3 removeWorkDirectory:@"/private/var/demo_backup"];

  id v4 = +[MSDPlatform sharedInstance];
  unsigned int v5 = [v4 macOS];

  if (v5)
  {
    id v6 = [(MSDTargetDevice *)self helperAgent];
    [v6 removeWorkDirectory:@"/private/var/dekota"];
  }
}

- (BOOL)deleteConfigurationApp
{
  unsigned __int8 v2 = +[IXAppInstallCoordinator uninstallAppWithBundleID:@"com.apple.DemoUpdate" error:0];
  BOOL v3 = sub_100068600();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Configuration app deleted.", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_1000CF490(v4, v6, v7);
  }

  return v2;
}

- (void)markContentInstallingInstalled
{
  id v2 = +[MSDProgressUpdater sharedInstance];
  [v2 markBundleInProgressAsBundleCompleted];
}

- (BOOL)powerAssertionActive
{
  return self->_powerAssertion != 0;
}

- (BOOL)holdPowerAssertion
{
  p_powerAssertion = &self->_powerAssertion;
  if (self->_powerAssertion) {
    return 1;
  }
  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Taking power assertion to prevent device sleep.", v6, 2u);
  }

  if (!IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, @"com.apple.demod.noSleep", p_powerAssertion))return 1; {
  unsigned int v5 = sub_100068600();
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000CF50C();
  }

  return 0;
}

- (BOOL)liftPowerAssertion
{
  if (!self->_powerAssertion) {
    return 1;
  }
  BOOL v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Lifting power assertion to enable device sleep.", v6, 2u);
  }

  if (!IOPMAssertionRelease(self->_powerAssertion))
  {
    self->_powerAssertion = 0;
    return 1;
  }
  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000CF540();
  }

  return 0;
}

- (BOOL)createMobileStoreDemoCache
{
  id v2 = +[NSFileManager defaultManager];
  BOOL v3 = +[MSDCache sharedInstance];
  if (([v2 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob"] & 1) == 0&& (objc_msgSend(v3, "createContainer:", @"com.apple.mobilestoredemo.blob") & 1) == 0)
  {
    id v8 = sub_100068730();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CF5A8();
    }
    id v4 = 0;
    goto LABEL_12;
  }
  if (([v2 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata"] & 1) == 0)
  {
    id v9 = 0;
    BOOL v5 = 1;
    unsigned __int8 v6 = [v2 createDirectoryAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" withIntermediateDirectories:1 attributes:0 error:&v9];
    id v4 = v9;
    if (v6) {
      goto LABEL_6;
    }
    id v8 = sub_100068730();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CF574();
    }
LABEL_12:

    BOOL v5 = 0;
    goto LABEL_6;
  }
  id v4 = 0;
  BOOL v5 = 1;
LABEL_6:

  return v5;
}

- (void)clearUpNvramIfNeeded
{
  id v5 = +[NSFileManager defaultManager];
  if (![(MSDTargetDevice *)self storeDemoMode]
    || ([(MSDTargetDevice *)self pathForDummyPreferenceFile],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v5 fileExistsAtPath:v3],
        v3,
        (v4 & 1) == 0))
  {
    [(MSDTargetDevice *)self deleteNVRam:@"demo-install-state"];
    [(MSDTargetDevice *)self deleteNVRam:@"enable-remap-mode"];
    [(MSDTargetDevice *)self deleteNVRam:@"msd-request"];
    [(MSDTargetDevice *)self deleteNVRam:@"msd-reboot-at"];
    [(MSDTargetDevice *)self deleteNVRam:@"msd-last-auto-reboot"];
  }
}

- (void)clearUpF200FootprintIfNeeded
{
  id v2 = +[MSDPreferencesFile sharedInstance];
  BOOL v3 = +[NSFileManager defaultManager];
  if ([v3 fileExistsAtPath:@"/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/F200EventsData"])
  {
    id v8 = 0;
    unsigned __int8 v4 = [v3 removeItemAtPath:@"/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/F200EventsData" error:&v8];
    id v5 = v8;
    if ((v4 & 1) == 0)
    {
      unsigned __int8 v6 = sub_100068600();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000CF5DC(v5);
      }
    }
  }
  uint64_t v7 = [v2 objectForKey:@"F200EventDbCleanupTime"];

  if (v7) {
    [v2 removeObjectForKey:@"F200EventDbCleanupTime"];
  }
}

- (void)refreshStoreHoursManagerUsingSettings
{
  id v6 = +[MSDStoreHoursManager sharedInstance];
  BOOL v3 = [(MSDTargetDevice *)self hubSuppliedSettings];
  unsigned __int8 v4 = [v3 objectForKey:@"StoreHours"];

  id v5 = [(MSDTargetDevice *)self lastSettingsUpdatedTime];
  [v6 updateStoreHours:v4 lastSettingsUpdatedDate:v5];
  [v6 evaluateStoreStatusAgainstCurrentTime];
  [v6 setupStoreOpenCloseTimers];
  [(MSDTargetDevice *)self configureLowPowerMode];
}

- (void)setupStoreHoursManager
{
  BOOL v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up store hours manager!", buf, 2u);
  }

  unsigned __int8 v4 = +[NSNotificationCenter defaultCenter];
  id v5 = +[NSOperationQueue mainQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  _DWORD v15[2] = sub_100053934;
  v15[3] = &unk_100151B60;
  v15[4] = self;
  id v6 = [v4 addObserverForName:@"com.apple.MobileStoreDemo.StoreHours.Expired" object:0 queue:v5 usingBlock:v15];

  uint64_t v7 = +[NSNotificationCenter defaultCenter];
  id v8 = +[NSOperationQueue mainQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000539C0;
  v14[3] = &unk_100151B60;
  v14[4] = self;
  id v9 = [v7 addObserverForName:@"com.apple.MobileStoreDemo.StoreHours.StoreOpen" object:0 queue:v8 usingBlock:v14];

  uint64_t v10 = +[NSNotificationCenter defaultCenter];
  id v11 = +[NSOperationQueue mainQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000539C8;
  v13[3] = &unk_100151B60;
  v13[4] = self;
  id v12 = [v10 addObserverForName:@"com.apple.MobileStoreDemo.StoreHours.StoreClosed" object:0 queue:v11 usingBlock:v13];

  [(MSDTargetDevice *)self refreshStoreHoursManagerUsingSettings];
}

- (void)caLogsUploadTimerHandler:(id)a3
{
  BOOL v3 = dispatch_get_global_queue(9, 0);
  dispatch_async(v3, &stru_100152C88);
}

- (void)setupCoreAnalyticsLogsUploadTimer
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100053B60;
  v2[3] = &unk_100151AC8;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)snapshotRevertTimerHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[MSDWorkQueueSet sharedInstance];
  id v6 = [v5 messageQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_100053E8C;
  v7[3] = &unk_100151AC8;
  objc_copyWeak(&v8, &location);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)setupSnapshotRevertTimer
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100054084;
  v2[3] = &unk_100151AC8;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)unlockDeviceKeybagIfNeeded
{
  int v2 = MKBGetDeviceLockState();
  id v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device keybag lock state: %d", (uint8_t *)v7, 8u);
  }

  if (v2)
  {
    id v4 = [@"123456" dataUsingEncoding:4];
    id v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unlocking device keybag using default passcode.", (uint8_t *)v7, 2u);
    }

    if (MKBUnlockDevice())
    {
      id v6 = sub_100068600();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000CF6A8();
      }
    }
  }
}

- (void)acquireDeviceKeybagAssertionIfNeeded
{
  if (![(MSDTargetDevice *)self deviceLockAssertion])
  {
    CFStringRef v9 = @"MKBAssertionKey";
    CFStringRef v10 = @"Other";
    id v3 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    id v8 = 0;
    id v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Acquiring device keybag lock assertion.", v7, 2u);
    }

    [(MSDTargetDevice *)self setDeviceLockAssertion:MKBDeviceLockAssertion()];
    if (![(MSDTargetDevice *)self deviceLockAssertion])
    {
      id v5 = v8;
      id v6 = sub_100068600();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000CF710(v5);
      }
    }
  }
}

- (void)configureGreyMatterAutoUpdate
{
  BOOL v3 = +[MSDHubFeatureFlags enableAIModelAutoUpdate]
    || [(MSDTargetDevice *)self mode] == 7;
  if (os_variant_has_internal_content())
  {
    id v4 = +[MSDTestPreferences sharedInstance];
    unsigned int v5 = [v4 enableAIModelAutoUpdate];

    if (v5)
    {
      id v6 = sub_100068600();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found test preference for enabling AI model auto update!", v7, 2u);
      }

      BOOL v3 = 1;
    }
  }
  +[MSDGreyMatterHelper configureAutoUpdate:v3];
}

- (void)registerCAHearbeatActivity
{
  int v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000CF794();
  }

  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, 7200);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, 300);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, 0);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_activity_register("com.apple.MobileStoreDemo.heartbeat", v3, &stru_100152CC8);
}

- (void)unregisterCAHeartbeatActivity
{
}

- (id)previousiOSBuild
{
  int v2 = +[MSDPreferencesFile sharedInstance];
  xpc_object_t v3 = [v2 objectForKey:@"PreviousOSBuild"];

  return v3;
}

- (BOOL)saveCurrentiOSBuild
{
  xpc_object_t v3 = +[MSDPreferencesFile sharedInstance];
  id v4 = [(MSDTargetDevice *)self OSBuild];
  unsigned __int8 v5 = [v3 setObject:v4 forKey:@"PreviousOSBuild"];

  return v5;
}

- (BOOL)clearCurrentiOSBuild
{
  int v2 = +[MSDPreferencesFile sharedInstance];
  unsigned __int8 v3 = [v2 removeObjectForKey:@"PreviousOSBuild"];

  return v3;
}

- (id)minOSVersionAvailable
{
  int v2 = +[MSDPreferencesFile sharedInstance];
  unsigned __int8 v3 = [v2 objectForKey:@"MinOSVersionAvailable"];

  return v3;
}

- (void)saveMinOSVersionAvailable:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDPreferencesFile sharedInstance];
  [v4 setObject:v3 forKey:@"MinOSVersionAvailable"];
}

- (void)clearMinOSVersionAvailable
{
  id v2 = +[MSDPreferencesFile sharedInstance];
  [v2 removeObjectForKey:@"MinOSVersionAvailable"];
}

- (void)saveOSUpdateRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDPreferencesFile sharedInstance];
  [v4 setObject:v3 forKey:@"OSUpdateRequest"];
}

- (id)getOSUpdateRequest
{
  if (!os_variant_has_internal_content()) {
    goto LABEL_13;
  }
  id v2 = +[MSDTestPreferences sharedInstance];
  id v3 = [v2 mockOSUpdateRequestFile];

  if (!v3)
  {
LABEL_12:

LABEL_13:
    id v3 = +[MSDPreferencesFile sharedInstance];
    id v5 = [v3 objectForKey:@"OSUpdateRequest"];
    goto LABEL_14;
  }
  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Loading mock OS update request from file: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  id v5 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v3];
  id v6 = sub_100068600();
  uint64_t v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000CF7FC();
    }

    goto LABEL_12;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Mock OS update request successfully loaded: %{public}@", (uint8_t *)&v9, 0xCu);
  }

LABEL_14:

  return v5;
}

- (void)clearOSUpdateRequest
{
  id v2 = +[MSDPreferencesFile sharedInstance];
  [v2 removeObjectForKey:@"OSUpdateRequest"];
}

- (BOOL)waitingForCommand
{
  id v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"WaitingForCommand"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)setWaitingForCommand:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MSDTargetDevice *)self waitingForCommand] != a3)
  {
    id v5 = +[MSDPreferencesFile sharedInstance];
    id v6 = v5;
    if (v3)
    {
      [v5 setObject:&__kCFBooleanTrue forKey:@"WaitingForCommand"];

      [(MSDTargetDevice *)self startWaitingForCommandTimer];
    }
    else
    {
      [v5 removeObjectForKey:@"WaitingForCommand"];

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100054E54;
      block[3] = &unk_100151AF0;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)startWaitingForCommandTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100054F18;
  block[3] = &unk_100151AF0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)waitForBuddy:(id)a3 updateStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CFNotificationCenterRef DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (!DarwinNotifyCenter)
  {
    id v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000CF830();
    }
    goto LABEL_7;
  }
  id v8 = DarwinNotifyCenter;
  [(MSDTargetDevice *)self setBuddyCompletionHandler:v6];
  CFNotificationCenterAddObserver(v8, 0, (CFNotificationCallback)sub_10004AB38, @"com.apple.purplebuddy.setupdone", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  int v9 = BYSetupAssistantNeedsToRun();
  id v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Assistant needs to run: %{BOOL}d", (uint8_t *)v13, 8u);
  }

  if ((v9 & 1) == 0)
  {
    id v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v12, 0, @"com.apple.purplebuddy.setupdone", 0);
    [(MSDTargetDevice *)self invokeHandler:1];
    goto LABEL_9;
  }
  if (v4)
  {
    id v11 = +[MSDProgressUpdater sharedInstance];
    [v11 updateStage:16];
LABEL_7:
  }
LABEL_9:
}

- (void)waitForBuddy:(id)a3
{
}

- (void)waitForBuddyWithoutStatusUpdate:(id)a3
{
}

- (void)waitForBuddyWithTimeout
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  dispatch_time_t v4 = dispatch_time(0, 60000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_100055364;
  v7[3] = &unk_1001525A8;
  id v5 = v3;
  id v8 = v5;
  [(MSDTargetDevice *)self waitForBuddy:v7];
  if (dispatch_semaphore_wait(v5, v4))
  {
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = 60;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Buddy setup timed out after %d seconds.", buf, 8u);
    }
  }
}

- (void)invokeHandler:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = [(MSDTargetDevice *)self buddyCompletionHandlerLock];
  objc_sync_enter(obj);
  id v5 = [(MSDTargetDevice *)self buddyCompletionHandler];

  if (v5)
  {
    id v6 = [(MSDTargetDevice *)self buddyCompletionHandler];
    v6[2](v6, v3);
  }
  objc_sync_exit(obj);
}

- (void)terminateConfigurationApp
{
  id v2 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:@"com.apple.DemoUpdate"];
  id v17 = 0;
  BOOL v3 = +[RBSProcessHandle handleForPredicate:v2 error:&v17];
  id v4 = v17;

  if (v3)
  {
    id v5 = [v3 currentState];
    unsigned int v6 = [v5 taskState];

    if (!v4) {
      goto LABEL_9;
    }
  }
  else
  {
    unsigned int v6 = 1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  if ([v4 code] != (id)3)
  {
    uint64_t v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000CF864();
    }
  }
LABEL_9:
  if (v6 >= 2)
  {
    id v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Trying to terminate configuration app...", buf, 2u);
    }

    int v9 = +[FBSSystemService sharedService];
    [v9 terminateApplication:@"com.apple.DemoUpdate" forReason:1 andReport:0 withDescription:0];

    int v10 = 11;
    while (1)
    {
      id v11 = [v3 currentState];
      unsigned int v12 = [v11 taskState];

      if (v12 < 2) {
        break;
      }
      sleep(1u);
      if (--v10 <= 1)
      {
        unint64_t v13 = sub_100068600();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        *(_WORD *)buf = 0;
        id v14 = "Terminating configuration app timeout.";
        id v15 = v13;
        uint32_t v16 = 2;
        goto LABEL_19;
      }
    }
    unint64_t v13 = sub_100068600();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 67109120;
    unsigned int v19 = v12;
    id v14 = "Configuration app terminated with state == %d";
    id v15 = v13;
    uint32_t v16 = 8;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
LABEL_20:
  }
}

- (BOOL)allowSnapshotMode
{
  id v2 = [(MSDTargetDevice *)self getDeviceOptions];
  BOOL v3 = [v2 objectForKey:@"disable_snapshot_mode"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v3 BOOLValue])
  {
    id v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device snapshot mode is disabled as requested by DeviceOptions.", v7, 2u);
    }

    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)allowSnapshotRevertTimer
{
  if (+[MSDHubFeatureFlags disableNightlySnapshotRevert])
  {
    BOOL v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Snapshot revert timer is disabled by feature flag!", v8, 2u);
    }

    return 0;
  }
  if ([(MSDTargetDevice *)self isPressDemoDevice]
    || ![(MSDTargetDevice *)self allowSnapshotMode])
  {
    return 0;
  }
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.demo-settings"];
  BOOL v5 = [v4 objectForKey:@"DisableNightlyRefresh"];
  BOOL v6 = 1;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v5 BOOLValue]) {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BOOL)allowAccountSetup
{
  BOOL v3 = (void *)MGCopyAnswer();
  if ([v3 BOOLValue]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(MSDTargetDevice *)self isDemoModeOn];
  }

  return v4;
}

- (void)configureNetworkInterface
{
  BOOL v3 = +[MSDWiFiHelper sharedInstance];
  [v3 enableWiFi:1];
  BOOL v4 = [v3 getPersistentWiFiSsid];

  if (v4)
  {
    [v3 configureWiFiWithPersistentSettings];
  }
  else if ([(MSDTargetDevice *)self isContentFrozen])
  {
    [v3 disassociateAndForgetWiFi];
  }
  else if ([(MSDTargetDevice *)self shouldForgetKnownNetworkUponUnlock])
  {
    BOOL v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Forgetting known wifi network after device unlock...", v6, 2u);
    }

    [v3 disassociateAndForgetWiFi];
    [(MSDTargetDevice *)self setShouldForgetKnownNetworkUponUnlock:0];
  }
}

- (void)waitForNetworkReachability
{
}

- (void)waitForNetworkReachabilityWithTimeout:(unint64_t)a3
{
  BOOL v5 = +[NSDate dateWithTimeIntervalSinceNow:(double)a3];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  __int16 v23 = sub_100055D6C;
  uint64_t v24 = sub_100055D7C;
  id v25 = objc_alloc_init((Class)NSCondition);
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_100055D6C;
  v14[4] = sub_100055D7C;
  id v15 = self;
  BOOL v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Waiting for network to become reachable...", buf, 2u);
  }

  uint64_t v7 = nw_path_monitor_create();
  if (v7)
  {
    id v8 = &_dispatch_main_q;
    nw_path_monitor_set_queue(v7, (dispatch_queue_t)&_dispatch_main_q);

    update_handler[0] = _NSConcreteStackBlock;
    update_handler[1] = 3221225472;
    update_handler[2] = sub_100055D84;
    update_handler[3] = &unk_100152D18;
    update_handler[4] = &v20;
    update_handler[5] = &v16;
    update_handler[6] = v14;
    nw_path_monitor_set_update_handler(v7, update_handler);
    nw_path_monitor_start(v7);
    [(id)v21[5] lock];
    while (!v17[3])
    {
      if (([(id)v21[5] waitUntilDate:v5] & 1) == 0)
      {
        int v9 = sub_100068600();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v27 = a3;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Timeout waiting %lus for desired network interface to come up.", buf, 0xCu);
        }

        break;
      }
    }
    [(id)v21[5] unlock];
    nw_path_monitor_cancel(v7);
  }
  else
  {
    unsigned int v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000CF8E4();
    }
  }
  int v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = v17[3] != 0;
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Network reachability after wait: %{BOOL}d", buf, 8u);
  }

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
}

- (unint64_t)fetchActiveNetworkInterface
{
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v2 = nw_parameters_create();
  nw_parameters_set_multipath_service(v2, nw_multipath_service_handover);
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_100055F90;
  v7[3] = &unk_100152D40;
  BOOL v4 = (id)nw_path_evaluator_copy_path();
  id v8 = v4;
  int v9 = &v10;
  nw_path_enumerate_interfaces(v4, v7);
  unint64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (BOOL)migrateCellularSupportFlag
{
  BOOL v3 = [(MSDTargetDevice *)self getDeviceOptions];
  BOOL v4 = [v3 objectForKey:@"enable_cellular_support"];
  if ([v4 BOOLValue])
  {
    unint64_t v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543618;
      CFStringRef v10 = @"enable_cellular_support";
      __int16 v11 = 1024;
      unsigned int v12 = [v4 BOOLValue];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@=%{BOOL}d; disconnecting & forgetting all wifi SSID...",
        (uint8_t *)&v9,
        0x12u);
    }

    BOOL v6 = +[MSDWiFiHelper sharedInstance];
    [v6 disassociateAndForgetWiFi];

    BOOL v7 = [(MSDTargetDevice *)self updateDeviceOptions:v3 skipImutableKeys:1];
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)resetSystemTimeCache
{
  id v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Resetting system time cache...", v4, 2u);
  }

  if (!TMResetToFirstLaunch())
  {
    BOOL v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000CF918();
    }
  }
}

- (int64_t)getFreeSpace
{
  int64_t v6 = 0;
  CFDictionaryRef v2 = (const __CFDictionary *)MGCopyAnswer();
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    sub_10004EB48(v2, kMGQDiskUsageTotalDataAvailable, &v6);
    CFRelease(v3);
    return v6;
  }
  else
  {
    unint64_t v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000CF94C();
    }

    return 0;
  }
}

- (BOOL)updateDeviceOptions:(id)a3 skipImutableKeys:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  int64_t v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating device options dictionary on device", buf, 2u);
  }

  BOOL v7 = +[MSDPreferencesFile sharedInstance];
  id v8 = [v7 objectForKey:@"device_options"];

  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v10 = v5;
  id v11 = [v10 countByEnumeratingWithState:&v48 objects:v56 count:16];
  int v46 = v8;
  if (v11)
  {
    id v12 = v11;
    v45 = 0;
    uint64_t v13 = *(void *)v49;
    id v47 = v9;
    while (1)
    {
      id v14 = 0;
      do
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v14);
        if (([v15 isEqualToString:@"disable_snapshot_mode"] & 1) != 0
          || [v15 isEqualToString:@"enable_better_together"])
        {
          if (v4)
          {
            uint64_t v16 = [v8 objectForKey:v15];

            if (!v16) {
              goto LABEL_20;
            }
            id v17 = v8;
          }
          else
          {
            id v17 = v10;
          }
          uint64_t v18 = [v17 objectForKey:v15];
        }
        else
        {
          if ([v15 isEqualToString:@"enable_cellular_support"])
          {
            uint64_t v18 = &__kCFBooleanFalse;
LABEL_19:
            [v9 setObject:v18 forKey:v15];

            goto LABEL_20;
          }
          if (![v15 isEqualToString:@"enable_do_not_buy"])
          {
            unsigned int v24 = [v15 isEqualToString:@"device_info"];
            uint64_t v18 = [v10 objectForKey:v15];
            if (v24)
            {
              id v25 = +[MSDNPIMaskValues sharedInstance];
              [v25 saveDeviceInfo:v18];
            }
            goto LABEL_32;
          }
          uint64_t v19 = [v10 objectForKey:v15];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

LABEL_31:
            uint64_t v18 = [v8 objectForKey:v15];
            goto LABEL_32;
          }
          uint64_t v20 = [v10 objectForKey:v15];
          unsigned int v21 = [v20 BOOLValue];

          id v8 = v46;
          if (!v21) {
            goto LABEL_31;
          }
          uint64_t v18 = [v10 objectForKey:v15];
          uint64_t v22 = [v10 objectForKey:@"store_type"];

          if (v22)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              BOOL v38 = sub_100068600();
              id v9 = v47;
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                sub_1000CFA78(v38, v36, v37);
              }
              goto LABEL_59;
            }
            __int16 v23 = v22;
          }
          else
          {
            uint64_t v26 = sub_100068600();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v53 = "-[MSDTargetDevice updateDeviceOptions:skipImutableKeys:]";
              __int16 v54 = 2114;
              CFStringRef v55 = @"retail";
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s - Device has \"do not buy\" enabled but store type is not set.  Default to %{public}@", buf, 0x16u);
            }

            __int16 v23 = @"retail";
          }
          unint64_t v27 = sub_100068600();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v53 = "-[MSDTargetDevice updateDeviceOptions:skipImutableKeys:]";
            __int16 v54 = 2114;
            CFStringRef v55 = v23;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s - device_options has \"do not buy\" enabled with store type:  %{public}@", buf, 0x16u);
          }

          v45 = v23;
          if ([(__CFString *)v23 isEqualToString:@"retail"])
          {
            char v28 = +[MSDHelperAgent sharedInstance];
            unsigned __int8 v29 = [v28 writeNvram:@"ownership-warning" withValue:@"1"];

            if ((v29 & 1) == 0)
            {
              BOOL v38 = sub_100068600();
              BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
              id v9 = v47;
              if (v39) {
                sub_1000CF980(v38, v40, v41);
              }
              goto LABEL_58;
            }
            goto LABEL_43;
          }
          if ([(__CFString *)v23 isEqualToString:@"channel"])
          {
            __int16 v30 = +[MSDHelperAgent sharedInstance];
            unsigned __int8 v31 = [v30 writeNvram:@"ownership-warning" withValue:@"2"];

            if ((v31 & 1) == 0)
            {
              BOOL v38 = sub_100068600();
              id v9 = v47;
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                sub_1000CF9FC(v38, v42, v43);
              }
LABEL_58:
              uint64_t v22 = v45;
LABEL_59:

              BOOL v34 = 0;
              goto LABEL_51;
            }
LABEL_43:
            id v8 = v46;
LABEL_32:
            id v9 = v47;
            goto LABEL_15;
          }
          v32 = sub_100068600();
          id v9 = v47;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v53 = "-[MSDTargetDevice updateDeviceOptions:skipImutableKeys:]";
            __int16 v54 = 2114;
            CFStringRef v55 = v45;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s - Ignore do-not-buy for unrecognized store type:  %{public}@", buf, 0x16u);
          }

          id v8 = v46;
        }
LABEL_15:
        if (v18) {
          goto LABEL_19;
        }
LABEL_20:
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v33 = [v10 countByEnumeratingWithState:&v48 objects:v56 count:16];
      id v12 = v33;
      if (!v33) {
        goto LABEL_50;
      }
    }
  }
  v45 = 0;
LABEL_50:

  [(MSDTargetDevice *)self saveDeviceOptions:v9];
  BOOL v34 = 1;
  uint64_t v22 = v45;
LABEL_51:

  return v34;
}

- (void)saveDeviceOptions:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDPreferencesFile sharedInstance];
  [v4 setObject:v3 forKey:@"device_options"];
}

- (id)getDeviceOptions
{
  CFDictionaryRef v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"device_options"];
  id v4 = [v3 mutableCopy];

  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);

    id v4 = v5;
  }
  int64_t v6 = +[MSDNPIMaskValues sharedInstance];
  unsigned int v7 = [v6 isNPIDevice];

  if (v7)
  {
    id v8 = +[MSDNPIMaskValues sharedInstance];
    id v9 = [v8 getMaskValueForKey:@"ProductType"];

    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v4 setObject:v9 forKey:@"product_type"];
      }
    }
    id v10 = +[MSDNPIMaskValues sharedInstance];
    id v11 = [v10 getMaskValueForKey:@"part_description"];

    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v4 setObject:v9 forKey:@"part_description"];
      }
    }
    id v12 = +[MSDNPIMaskValues sharedInstance];
    uint64_t v13 = [v12 getMaskValueForKey:@"device_family"];

    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v4 setObject:v9 forKey:@"device_family"];
      }
    }
  }
  else
  {
    id v9 = (void *)MGCopyAnswer();
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v4 setObject:v9 forKey:@"product_type"];
      }
    }
  }

  if (os_variant_has_internal_content())
  {
    id v14 = +[MSDTestPreferences sharedInstance];
    unsigned int v15 = [v14 mockForBetterTogetherDemo];

    if (v15) {
      [v4 setObject:&__kCFBooleanTrue forKey:@"enable_better_together"];
    }
  }

  return v4;
}

- (void)processNewFeatureFlags:(id)a3 oldFeatureFlags:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = +[MSDHubFeatureFlags supportedFeatureFlags];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v22;
    *(void *)&long long v9 = 138543874;
    long long v19 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = [v6 objectForKey:v13, v19];
        unsigned int v15 = [v14 BOOLValue];

        uint64_t v16 = [v5 objectForKey:v13];
        unsigned int v17 = [v16 BOOLValue];

        if (v15 != v17)
        {
          uint64_t v18 = sub_100068600();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            uint64_t v26 = v13;
            __int16 v27 = 1024;
            unsigned int v28 = v15;
            __int16 v29 = 1024;
            unsigned int v30 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Feature flag '%{public}@' has new value set: %{BOOL}d -> %{BOOL}d", buf, 0x18u);
          }

          if ([v13 isEqualToString:@"DisableNightlySnapshotRevert"])
          {
            if ([(MSDTargetDevice *)self isContentFrozen]) {
              [(MSDTargetDevice *)self setupSnapshotRevertTimer];
            }
          }
          else if ([v13 isEqualToString:@"DisableNightlyLowPowerMode"])
          {
            if ([(MSDTargetDevice *)self mode] == 5) {
              [(MSDTargetDevice *)self configureLowPowerMode];
            }
          }
          else
          {
            [v13 isEqualToString:@"DisableScreenDarkHours"];
          }
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v10);
  }
}

- (BOOL)setDemoEnrollmentFlag:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDPreferencesFile sharedInstance];
  unsigned __int8 v5 = [v4 setObject:v3 forKey:@"enrollmentFlag"];

  return v5;
}

- (id)getDemoEnrollmentFlag
{
  CFDictionaryRef v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"enrollmentFlag"];

  return v3;
}

- (BOOL)lockSnapshot
{
  return [(MSDTargetDevice *)self switchModeImmediately:5];
}

- (BOOL)unlockSnapshot
{
  return [(MSDTargetDevice *)self switchModeImmediately:1];
}

- (BOOL)revertSnapshot
{
  [(MSDTargetDevice *)self saveOperationRequest:@"RevertSnapshot" requestFlag:8 completeBy:0];

  return [(MSDTargetDevice *)self switchModeImmediately:2];
}

- (BOOL)revertSnapshotAndShutdown
{
  return 1;
}

- (BOOL)unenrollWithObliteration:(BOOL)a3 preserveESim:(BOOL)a4 callUnregister:(BOOL)a5 preserveDDLFlag:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  BOOL v8 = a3;
  if (a5)
  {
    uint64_t v10 = [(MSDTargetDevice *)self hubHostName];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      id v12 = [(MSDTargetDevice *)self hubPort];

      if (v12)
      {
        uint64_t v13 = objc_alloc_init(MSDUnEnrollRequest);
        [(MSDUnEnrollRequest *)v13 setObliterate:v8];
        id v14 = +[MSDServerRequestHandler sharedInstance];
        id v15 = [v14 handleRequestSync:v13];
      }
    }
  }
  if (v6)
  {
    uint64_t v16 = +[MSDPreferencesFile sharedInstance];
    [v16 setObject:&__kCFBooleanTrue forKey:@"preserveDDLFlag"];
  }
  if (v8)
  {
    if (v7)
    {
      unsigned int v17 = sub_100068600();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received request to preserve installed eSim across device obliteration.", v20, 2u);
      }

      uint64_t v18 = +[MSDPreferencesFile sharedInstance];
      [v18 setObject:&__kCFBooleanTrue forKey:@"PreserveESimRequested"];
    }
    return [(MSDTargetDevice *)self switchModeImmediately:9];
  }
  else
  {
    return [(MSDTargetDevice *)self switchModeImmediately:0];
  }
}

- (BOOL)runCleanUpForBetterTogetherDevice
{
  uint64_t v3 = [(MSDTargetDevice *)self hubHostName];
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned __int8 v5 = [(MSDTargetDevice *)self hubPort];

    if (v5)
    {
      BOOL v6 = objc_alloc_init(MSDUnEnrollRequest);
      [(MSDUnEnrollRequest *)v6 setObliterate:1];
      BOOL v7 = +[MSDServerRequestHandler sharedInstance];
      id v8 = [v7 handleRequestSync:v6];
    }
  }
  [(MSDTargetDevice *)self manageDemoVolume:@"Delete"];
  return 1;
}

- (BOOL)canLockSnapshot
{
  return [(MSDTargetDevice *)self mode] == 1 && [(MSDTargetDevice *)self allowSnapshotMode];
}

- (BOOL)canUnlockSnapshot
{
  return [(MSDTargetDevice *)self mode] == 5 && [(MSDTargetDevice *)self allowSnapshotMode];
}

- (BOOL)canRevertSnapshot
{
  return [(MSDTargetDevice *)self mode] == 5 && [(MSDTargetDevice *)self allowSnapshotMode];
}

- (BOOL)canStartContentUpdate
{
  unsigned int v3 = [(MSDTargetDevice *)self mode];
  if (v3 != 1) {
    LOBYTE(v3) = [(MSDTargetDevice *)self mode] == 5;
  }
  return v3;
}

- (BOOL)canStartBackgroundDownload
{
  return [(MSDTargetDevice *)self mode] == 5;
}

- (BOOL)canStartOSUpdate
{
  unsigned int v3 = [(MSDTargetDevice *)self mode];
  if (v3 != 1) {
    LOBYTE(v3) = [(MSDTargetDevice *)self mode] == 5;
  }
  return v3;
}

- (BOOL)canUnenrollWithObliteration:(BOOL)a3 consultDeviceOptions:(BOOL)a4
{
  if (a4)
  {
    unsigned __int8 v5 = [(MSDTargetDevice *)self getDeviceOptions];
    BOOL v6 = [v5 objectForKey:@"enable_on_device_unenroll"];

    BOOL v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Consulting device options before unenroll: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    BOOL v8 = v6 == 0;
    if (!v6 || ([v6 BOOLValue] & 1) == 0)
    {

      return v8;
    }
  }
  return [(MSDTargetDevice *)self mode] == 5
      || ![(MSDTargetDevice *)self mode]
      || [(MSDTargetDevice *)self mode] == 1;
}

- (BOOL)canRunCleanUpForBetterTogetherDevice
{
  unsigned int v3 = +[MSDPlatform sharedInstance];
  if ([v3 watchOS]) {
    BOOL v4 = [(MSDTargetDevice *)self isBetterTogetherDemo];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)shouldForgetKnownNetworkUponUnlock
{
  CFDictionaryRef v2 = +[MSDPreferencesFile sharedInstance];
  unsigned int v3 = [v2 objectForKey:@"ForgetKnownNetworkUponUnlock"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setShouldForgetKnownNetworkUponUnlock:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    CFStringRef v8 = @"ForgetKnownNetworkUponUnlock";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Set %{public}@ to %{BOOL}d", (uint8_t *)&v7, 0x12u);
  }

  unsigned __int8 v5 = +[MSDPreferencesFile sharedInstance];
  BOOL v6 = +[NSNumber numberWithBool:v3];
  [v5 setObject:v6 forKey:@"ForgetKnownNetworkUponUnlock"];
}

- (BOOL)backgroundDownloadActive
{
  CFDictionaryRef v2 = +[MSDPreferencesFile sharedInstance];
  BOOL v3 = [v2 objectForKey:@"BackgroundDownloadActive"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setBackgroundDownloadActive:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting bg:%d", (uint8_t *)v11, 8u);
  }

  unsigned __int8 v5 = +[MSDPreferencesFile sharedInstance];
  BOOL v6 = v5;
  if (v3)
  {
    int v7 = +[NSNumber numberWithBool:1];
    unsigned __int8 v8 = [v6 setObject:v7 forKey:@"BackgroundDownloadActive"];

    if ((v8 & 1) == 0)
    {
      __int16 v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000CFAF4();
      }
LABEL_11:
    }
  }
  else
  {
    int v10 = [v5 removeObjectForKey:@"BackgroundDownloadActive"];

    if ((v10 & 1) == 0)
    {
      __int16 v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000CFB28();
      }
      goto LABEL_11;
    }
  }
}

- (unint64_t)backgroundDownloadState
{
  CFDictionaryRef v2 = +[MSDProgressUpdater sharedInstance];
  BOOL v3 = [v2 backgroundBundle];

  if (v3) {
    unint64_t v4 = [v3 bundleState];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setBackgroundDownloadState:(unint64_t)a3
{
  unsigned __int8 v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    unint64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setting background download state:%lu", (uint8_t *)&v8, 0xCu);
  }

  BOOL v6 = +[MSDProgressUpdater sharedInstance];
  int v7 = [v6 backgroundBundle];
  [v7 setBundleStateAs:a3];

  if (a3 - 3 <= 1) {
    [(MSDTargetDevice *)self setBackgroundDownloadActive:0];
  }
}

- (void)setHubProtocolVersion:(id)a3
{
  id v3 = a3;
  unint64_t v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting hub proto version:%{public}@", (uint8_t *)&v6, 0xCu);
  }

  unsigned __int8 v5 = +[MSDPreferencesFile sharedInstance];
  [v5 setObject:v3 forKey:@"HubProtocolVersion"];
}

- (NSString)hubProtocolVersion
{
  CFDictionaryRef v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"HubProtocolVersion"];

  if (v3)
  {
    unint64_t v4 = +[MSDPreferencesFile sharedInstance];
    unsigned __int8 v5 = [v4 objectForKey:@"HubProtocolVersion"];
  }
  else
  {
    unsigned __int8 v5 = @"2";
  }

  return (NSString *)v5;
}

- (BOOL)proceeded
{
  CFDictionaryRef v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"Proceeded"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)setProceeded:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v4 = +[MSDPreferencesFile sharedInstance];
  unsigned __int8 v5 = v4;
  if (v3)
  {
    int v6 = +[NSNumber numberWithBool:1];
    unsigned __int8 v7 = [v5 setObject:v6 forKey:@"Proceeded"];

    if (v7) {
      return;
    }
  }
  else
  {
    int v8 = [v4 removeObjectForKey:@"Proceeded"];

    if (v8) {
      return;
    }
  }
  unint64_t v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000CFB5C();
  }
}

- (void)cleanUpBackgroundState:(BOOL)a3
{
  if (a3)
  {
    unsigned __int8 v4 = +[MSDPreferencesFile sharedInstance];
    [v4 removeObjectsForKeys:&off_100162D88];
  }
  +[MSDBundleProgressTracker removeBundleFromPreferences:@"Content.Downloading"];
  unsigned __int8 v5 = +[MSDProgressUpdater sharedInstance];
  [v5 resetTrackerForBundleType:1];

  [(MSDTargetDevice *)self setBackgroundDownloadActive:0];
}

- (NSDictionary)wifiSettings
{
  CFDictionaryRef v2 = +[MSDPreferencesFile sharedInstance];
  BOOL v3 = [v2 objectForKey:@"WiFiSettings"];

  return (NSDictionary *)v3;
}

- (void)setWifiSettings:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[MSDPreferencesFile sharedInstance];
  unsigned __int8 v5 = v4;
  if (v3) {
    unsigned __int8 v6 = [v4 setObject:v3 forKey:@"WiFiSettings"];
  }
  else {
    unsigned __int8 v6 = [v4 removeObjectForKey:@"WiFiSettings"];
  }
  unsigned __int8 v7 = v6;

  if ((v7 & 1) == 0)
  {
    int v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CFB5C();
    }
  }
}

- (id)getDesiredIconStateFromSB
{
  SBSSpringBoardBlockableServerPort();
  if (SBGetPendingIconState())
  {
    id v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000CFBE8();
    }
  }

  return 0;
}

- (BOOL)sendIconStateToSB:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = v3;
  if (v3 && [v3 length])
  {
    SBSSpringBoardBlockableServerPort();
    id v5 = v4;
    [v5 bytes];
    [v5 length];
    int v6 = SBSetIconState();
    BOOL v7 = v6 == 0;
    int v8 = sub_100068600();
    unint64_t v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000CFC50();
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Desired icon state is restored.", v11, 2u);
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)delayRebootForTesting
{
  CFDictionaryRef v2 = +[NSFileManager defaultManager];
  id v3 = +[MSDTestPreferences sharedInstance];
  unsigned int v4 = [v3 rebootDelayForStaging];

  if (v4)
  {
    if (([v2 fileExistsAtPath:@"/tmp/rebootDelayEntered"] & 1) == 0) {
      [v2 createFileAtPath:@"/tmp/rebootDelayEntered" contents:0 attributes:0];
    }
    id v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Waiting for %u seconds to run test.", (uint8_t *)v6, 8u);
    }

    sleep(v4);
  }
}

- (void)configureLowPowerMode
{
  id v3 = +[MSDStoreHoursManager sharedInstance];
  unsigned int v4 = +[MSDPreferencesFile sharedInstance];
  id v5 = [v4 objectForKey:@"LowPowerModeConfigured"];
  unsigned int v6 = [v5 BOOLValue];

  BOOL v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Configuring low power mode...", buf, 2u);
  }

  if (+[MSDHubFeatureFlags disableNightlyLowPowerMode])
  {
    int v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Nightly low power mode is disabled by feature flag!", v9, 2u);
    }

    if (v6)
    {
      [(MSDTargetDevice *)self setLowPowerMode:0];
      [v4 removeObjectForKey:@"LowPowerModeConfigured"];
    }
  }
  else
  {
    [v3 evaluateStoreStatusAgainstCurrentTime];
    -[MSDTargetDevice setLowPowerMode:](self, "setLowPowerMode:", [v3 isStoreOpenNow] ^ 1);
    [v4 setObject:&__kCFBooleanTrue forKey:@"LowPowerModeConfigured"];
  }
}

- (BOOL)setLowPowerMode:(int64_t)a3
{
  unsigned int v4 = +[_PMLowPowerMode sharedInstance];
  id v5 = [v4 getPowerMode];

  BOOL v6 = v5 == (id)a3;
  if (v5 == (id)a3)
  {
    BOOL v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      int64_t v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Low power mode already set to: %ld", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_9;
  }
  int v8 = +[_PMLowPowerMode sharedInstance];
  unsigned __int8 v9 = [v8 setPowerMode:a3 fromSource:@"MobileStoreDemo"];

  if ((v9 & 1) == 0)
  {
    BOOL v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000CFCB8();
    }
LABEL_9:

    return v6;
  }
  return 1;
}

- (id)retrieveSignedManifest
{
  id v3 = +[MSDFileDownloadCredentials sharedInstance];
  unsigned int v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:@"/var/MSDWorkContainer/.MSD_cache_manifest"];

  BOOL v6 = +[NSFileManager defaultManager];
  BOOL v7 = [(MSDTargetDevice *)self manifestPath];
  unsigned int v8 = [v6 fileExistsAtPath:v7];

  if (!v8
    || ([(MSDTargetDevice *)self manifestPath],
        unsigned __int8 v9 = objc_claimAutoreleasedReturnValue(),
        +[MSDSignedManifestFactory createSignedManifestFromManifestFile:v9], id v10 = (id)objc_claimAutoreleasedReturnValue(), v9, !v10))
  {
    int v11 = objc_alloc_init(MSDDownloadManifestRequest);
    int64_t v12 = [v3 manifestInfo];
    [(MSDDownloadManifestRequest *)v11 setManifestInfo:v12];

    uint64_t v13 = [(MSDTargetDevice *)self manifestPath];
    [(MSDServerRequest *)v11 setSavePath:v13];

    id v14 = +[MSDServerRequestHandler sharedInstance];
    id v15 = [v14 handleRequestSync:v11];

    uint64_t v16 = [v15 error];

    if (v16)
    {
      id v40 = 0;
    }
    else
    {
      unsigned int v17 = [(MSDTargetDevice *)self manifestPath];
      id v10 = +[MSDSignedManifestFactory createSignedManifestFromManifestFile:v17];

      if (v10)
      {

        goto LABEL_6;
      }
      id v44 = 0;
      sub_1000C3140(&v44, 3727740938, @"Manifest is corrupted.");
      id v40 = v44;
    }

    id v10 = 0;
LABEL_26:

    id v43 = v40;
    sub_1000C31D4(&v43, 3727740940, @"Could not download manifest.");
    id v29 = v43;

    unsigned int v28 = +[MSDDemoUpdateStatusHub sharedInstance];
    [v28 demoUpdateFailed:v29];
    BOOL v38 = 0;
    goto LABEL_17;
  }
LABEL_6:
  uint64_t v18 = [(MSDTargetDevice *)self helperAgent];
  unsigned __int8 v19 = [v18 updateSignedManifest];

  if ((v19 & 1) == 0)
  {
    sub_100068600();
    int v11 = (MSDDownloadManifestRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super.super.super.super, OS_LOG_TYPE_ERROR)) {
      sub_1000CFD24();
    }
    id v40 = 0;
    goto LABEL_26;
  }
  unsigned int v41 = v5;
  uint64_t v20 = +[MSDPreferencesFile sharedInstance];
  long long v21 = [v20 objectForKey:@"MSDCacheManifestVersion"];

  long long v22 = [v10 getInfo];
  long long v23 = [v22 objectForKey:@"PartNumber"];
  long long v24 = [v10 getInfo];
  id v25 = [v24 objectForKey:@"Revision"];
  uint64_t v42 = v3;
  uint64_t v26 = [v3 manifestInfo];
  __int16 v27 = [v26 objectForKey:@"SigningKey"];
  unsigned int v28 = +[NSString stringWithFormat:@"%@_%@_%@", v23, v25, v27];

  id v29 = v21;
  if (v21 && ([v21 isEqualToString:v28] & 1) == 0)
  {
    BOOL v34 = sub_100068600();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v46 = v28;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "This is a new manifest (%{public}@). Discard this cache and reset timer.", buf, 0xCu);
    }

    int v35 = +[MSDContentCacheManager sharedInstance];
    uint64_t v36 = [v10 getAllFileHash];
    [v35 clearCacheExceptFileHashes:v36];

    [(MSDTargetDevice *)self cleanUpBackgroundState:1];
    id v3 = v42;
    unsigned int v30 = &OBJC_IVAR___MSDGetAccountSettingsResponse__accountSettings;
  }
  else
  {
    id v3 = v42;
    unsigned int v30 = &OBJC_IVAR___MSDGetAccountSettingsResponse__accountSettings;
    if (v41)
    {
      unsigned __int8 v31 = sub_100068600();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Factory cache exists. Discard this cache.", buf, 2u);
      }

      v32 = +[MSDContentCacheManager sharedInstance];
      id v33 = [v10 getAllFileHash];
      [v32 clearCacheExceptFileHashes:v33];
    }
  }
  uint64_t v37 = [v30 + 626 sharedInstance];
  [v37 setObject:v28 forKey:@"MSDCacheManifestVersion"];

  id v10 = v10;
  BOOL v38 = v10;
LABEL_17:

  return v38;
}

- (void)clearSafariHistory
{
  pid_t v2 = SFProcessIDForProcessNamed();
  if (v2 < 0)
  {
    BOOL v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000CFDF0();
    }
  }
  else
  {
    pid_t v3 = v2;
    int v4 = kill(v2, 1);
    unsigned int v5 = sub_100068600();
    BOOL v6 = v5;
    if (v4 == -1)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000CFD58();
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v50) = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Killed com.apple.Safari.History (%i)", buf, 8u);
    }
  }

  BOOL v7 = +[LSApplicationProxy applicationProxyForIdentifier:@"com.apple.mobilesafari"];
  unsigned int v8 = [v7 dataContainerURL];
  unsigned __int8 v9 = [v8 path];

  uint64_t v37 = [v9 stringByAppendingPathComponent:@"Library/Caches"];
  id v43 = [v9 stringByAppendingPathComponent:@"Library/Cookies"];
  int v35 = [v9 stringByAppendingPathComponent:@"Library/WebKit/WebsiteData"];
  unsigned int v41 = v9;
  uint64_t v42 = [v9 stringByAppendingPathComponent:@"Library/Caches/WebKit"];
  id v40 = NSHomeDirectory();
  id v33 = [v40 stringByAppendingPathComponent:@"Library/Safari/History.db"];
  BOOL v39 = NSHomeDirectory();
  unsigned __int8 v31 = [v39 stringByAppendingPathComponent:@"Library/Safari/History.db-shm"];
  uint64_t v36 = NSHomeDirectory();
  unsigned int v30 = [v36 stringByAppendingPathComponent:@"Library/Safari/History.db-wal"];
  BOOL v34 = NSHomeDirectory();
  id v29 = [v34 stringByAppendingPathComponent:@"Library/Safari/SafariTabs.db"];
  v32 = NSHomeDirectory();
  id v10 = [v32 stringByAppendingPathComponent:@"Library/Safari/SafariTabs.db-shm"];
  int v11 = NSHomeDirectory();
  int64_t v12 = [v11 stringByAppendingPathComponent:@"Library/Safari/SafariTabs.db-wal"];
  uint64_t v13 = NSHomeDirectory();
  id v14 = [v13 stringByAppendingPathComponent:@"Library/Safari/LastSession.plist"];
  id v15 = NSHomeDirectory();
  uint64_t v16 = [v15 stringByAppendingPathComponent:@"Library/Safari/RecentlyClosedTabs.plist"];
  BOOL v38 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v37, v43, v35, v42, v33, v31, v30, v29, v10, v12, v14, v16, 0);

  unsigned int v17 = +[NSFileManager defaultManager];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v18 = v38;
  id v19 = [v18 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v46;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v46 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        unsigned int v24 = [v17 fileExistsAtPath:v23];
        id v25 = sub_100068600();
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if (!v24)
        {
          if (v26)
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v50 = v23;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "File not found for Safari: %{public}@", buf, 0xCu);
          }
          id v28 = 0;
          goto LABEL_23;
        }
        if (v26)
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v50 = v23;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Removing item for Safari: %{public}@", buf, 0xCu);
        }

        id v44 = 0;
        unsigned __int8 v27 = [v17 removeItemAtPath:v23 error:&v44];
        id v28 = v44;
        if ((v27 & 1) == 0)
        {
          id v25 = sub_100068600();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v50 = v23;
            __int16 v51 = 2114;
            id v52 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to remove item for Safari: %{public}@, Error: %{public}@", buf, 0x16u);
          }
LABEL_23:
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v20);
  }
}

- (BOOL)overrideComputerNameAndHostnameIfNeeded
{
  return 0;
}

- (BOOL)aboutToReboot
{
  return self->_aboutToReboot;
}

- (void)setAboutToReboot:(BOOL)a3
{
  self->_aboutToReboot = a3;
}

- (NSString)localHubFailureReason
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocalHubFailureReason:(id)a3
{
}

- (NSString)s3ServerFailureReason
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setS3ServerFailureReason:(id)a3
{
}

- (unsigned)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(unsigned int)a3
{
  self->_powerAssertion = a3;
}

- (NSTimer)snapshotRevertTimer
{
  return self->_snapshotRevertTimer;
}

- (void)setSnapshotRevertTimer:(id)a3
{
}

- (NSTimer)caLogsUploadTimer
{
  return self->_caLogsUploadTimer;
}

- (void)setCaLogsUploadTimer:(id)a3
{
}

- (NSTimer)waitForCommandTimer
{
  return self->_waitForCommandTimer;
}

- (void)setWaitForCommandTimer:(id)a3
{
}

- (id)buddyCompletionHandler
{
  return self->_buddyCompletionHandler;
}

- (void)setBuddyCompletionHandler:(id)a3
{
}

- (NSNumber)modeLock
{
  return self->_modeLock;
}

- (void)setModeLock:(id)a3
{
}

- (NSNumber)buddyCompletionHandlerLock
{
  return self->_buddyCompletionHandlerLock;
}

- (void)setBuddyCompletionHandlerLock:(id)a3
{
}

- (MSDHelperAgent)helperAgent
{
  return self->_helperAgent;
}

- (void)setHelperAgent:(id)a3
{
}

- (__MKBAssertion)deviceLockAssertion
{
  return self->_deviceLockAssertion;
}

- (void)setDeviceLockAssertion:(__MKBAssertion *)a3
{
  self->_deviceLockAssertion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helperAgent, 0);
  objc_storeStrong((id *)&self->_buddyCompletionHandlerLock, 0);
  objc_storeStrong((id *)&self->_modeLock, 0);
  objc_storeStrong(&self->_buddyCompletionHandler, 0);
  objc_storeStrong((id *)&self->_waitForCommandTimer, 0);
  objc_storeStrong((id *)&self->_caLogsUploadTimer, 0);
  objc_storeStrong((id *)&self->_snapshotRevertTimer, 0);
  objc_storeStrong((id *)&self->_s3ServerFailureReason, 0);

  objc_storeStrong((id *)&self->_localHubFailureReason, 0);
}

@end