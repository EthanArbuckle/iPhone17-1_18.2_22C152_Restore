@interface MSDDemoUpdateController
+ (id)sharedInstance;
- (BOOL)PLHasCompletedMomentAnalysis;
- (BOOL)PLHasCompletedRestorePostProcessing;
- (BOOL)_kickOffContentUpdateForManifest:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)_signedManifestMinimumOSVersionCheck:(id)a3 error:(id *)a4;
- (BOOL)busy;
- (BOOL)continueToUpdateAccountContent;
- (BOOL)continueToUpdateDemoContent;
- (BOOL)enrollForDeviceName:(id)a3 pairingCredential:(id)a4 hubHostName:(id)a5 hubPort:(id)a6 error:(id *)a7;
- (BOOL)enrolled;
- (BOOL)installCachedContentForCurrentLocale:(BOOL *)a3;
- (BOOL)migrateDataWithBlockingUI:(int)a3 startMigration:(BOOL)a4;
- (BOOL)migrationDone;
- (BOOL)setupAccounts:(id *)a3;
- (BOOL)updateDemoContent;
- (MSDComponentManager)componentManager;
- (MSDDemoUpdateController)init;
- (MSDHelperAgent)helperAgent;
- (MSDTargetDevice)device;
- (id)_contentPlistPathForManifest:(id)a3;
- (id)_selectCachedManifestWithError:(id *)a3;
- (void)_configureMailAppForDemo;
- (void)_stageContentPlistForManifest:(id)a3;
- (void)cancelDemoContentUpdate;
- (void)checkWithTimeKeeper:(id)a3;
- (void)concludeDemoContenUpdateWithResult:(BOOL)a3 andError:(id)a4;
- (void)getDemoUpdateInProgress:(BOOL *)a3 operationAllowed:(BOOL *)a4;
- (void)setAutomatedDeviceGroupStoreID;
- (void)setBusy:(BOOL)a3;
- (void)setComponentManager:(id)a3;
- (void)setDevice:(id)a3;
- (void)setHelperAgent:(id)a3;
- (void)setIOSSpecificSettings;
- (void)setMigrationDone:(BOOL)a3;
@end

@implementation MSDDemoUpdateController

+ (id)sharedInstance
{
  if (qword_100189C08 != -1) {
    dispatch_once(&qword_100189C08, &stru_100153768);
  }
  v2 = (void *)qword_100189C00;

  return v2;
}

- (MSDDemoUpdateController)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSDDemoUpdateController;
  v2 = [(MSDDemoUpdateController *)&v6 init];
  if (v2)
  {
    v3 = +[MSDTargetDevice sharedInstance];
    [(MSDDemoUpdateController *)v2 setDevice:v3];

    v4 = +[MSDHelperAgent sharedInstance];
    [(MSDDemoUpdateController *)v2 setHelperAgent:v4];
  }
  return v2;
}

- (void)getDemoUpdateInProgress:(BOOL *)a3 operationAllowed:(BOOL *)a4
{
  *a3 = 1;
  *a4 = 0;
  v7 = [(MSDDemoUpdateController *)self device];
  unsigned int v8 = [v7 mode];

  if (v8 <= 5 && ((1 << v8) & 0x27) != 0)
  {
    *a4 = 1;
    if (![(MSDDemoUpdateController *)self busy]) {
      *a3 = 0;
    }
  }
}

- (BOOL)enrolled
{
  v2 = +[MSDKeychainManager sharedInstance];
  v3 = [v2 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"];

  if (v3)
  {
    v4 = objc_alloc_init(MSDIsEnrolledRequest);
    v5 = +[MSDServerRequestHandler sharedInstance];
    objc_super v6 = [v5 handleRequestSync:v4];

    v7 = [v6 error];
    if (v7) {
      unsigned __int8 v8 = 0;
    }
    else {
      unsigned __int8 v8 = [v6 isEnrolled];
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)enrollForDeviceName:(id)a3 pairingCredential:(id)a4 hubHostName:(id)a5 hubPort:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = self;
  objc_sync_enter(v15);
  v59 = +[MSDProgressUpdater sharedInstance];
  v55 = v12;
  v56 = v11;
  v58 = +[MSDServerRequestHandler sharedInstance];
  if (![(MSDDemoUpdateController *)v15 busy])
  {
    [(MSDDemoUpdateController *)v15 setBusy:1];
    [v59 updateStage:1];
    v16 = objc_alloc_init(MSDEnrollRequest);
    v17 = [(MSDDemoUpdateController *)v15 device];
    v18 = [(MSDEnrollRequest *)v16 getRegistrationInfoKeys];
    v19 = [v17 deviceInformation:v18];
    id v20 = [v19 mutableCopy];

    v21 = +[MSDNPIMaskValues sharedInstance];
    LODWORD(v18) = [v21 isNPIDevice];

    if (v18) {
      v22 = &off_1001622B8;
    }
    else {
      v22 = &off_1001622D0;
    }
    [v20 setObject:v22 forKeyedSubscript:@"MSDDemoPingType"];
    v23 = +[NSDictionary dictionaryWithDictionary:v20];
    [(MSDEnrollRequest *)v16 setRegistrationInfo:v23];

    if (v13 && v14)
    {
      [(MSDCommandServerRequest *)v16 setServer:v13];
      [(MSDCommandServerRequest *)v16 setPort:v14];
    }
    v57 = [v58 handleRequestSync:v16];
    v24 = [v57 error];

    if (v24)
    {
      v32 = 0;
    }
    else
    {
      v25 = [(MSDDemoUpdateController *)v15 device];
      [v25 setHubHostName:v13];

      v26 = [(MSDDemoUpdateController *)v15 device];
      [v26 setHubPort:v14];

      v27 = [(MSDDemoUpdateController *)v15 device];
      v28 = +[NSDate date];
      [v28 timeIntervalSinceReferenceDate];
      [v27 saveHubLastOnlineTime:(uint64_t)v29];

      v30 = [(MSDDemoUpdateController *)v15 device];
      [v30 holdPowerAssertion];

      +[MSDBundleProgressTracker migratePreferencesFromFactoryDevicesIfNeeded];
      [v59 loadBundles];
      v31 = [(MSDDemoUpdateController *)v15 device];
      LODWORD(v28) = [v31 isBetterTogetherDemo];

      if (v28)
      {
        v32 = +[MSDPairedWatchProxy sharedInstance];
        [v32 bootstrap];
      }
      else
      {
        v32 = 0;
      }
      v33 = [(MSDDemoUpdateController *)v15 device];
      unsigned __int8 v34 = [v33 setDemoDeviceFlag];

      if ((v34 & 1) == 0)
      {
        v52 = sub_100068600();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
          sub_1000CE810();
        }
        goto LABEL_23;
      }
      v35 = [(MSDDemoUpdateController *)v15 device];
      [v35 setupWorkFolderForBootTask];

      v36 = +[MSDCryptoHandler sharedInstance];
      [v36 createSecretKeyIfNeeded];

      v37 = [(MSDDemoUpdateController *)v15 device];
      unsigned int v38 = [v37 turnOnDemoMode];

      if (v38)
      {
        v39 = [(MSDDemoUpdateController *)v15 device];
        [v39 configureGreyMatterAutoUpdate];

        v40 = +[MSDAnalytics sharedInstance];
        [v40 disableCoreAnalticsTransformSampling];

        v41 = +[MSDConfigurationProfileManager sharedInstance];
        [v41 installDefaultConfigurationProfile];

        v42 = [(MSDDemoUpdateController *)v15 device];
        [v42 setWaitingForCommand:1];

        v43 = +[MSDMailProcessor sharedInstance];
        [v43 setWaitingForCommand:1];

        v44 = [(MSDDemoUpdateController *)v15 device];
        unsigned int v45 = [v44 switchModeImmediately:1];

        if (v45)
        {
          v46 = sub_100068600();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Starting mail processor after enrolling.", buf, 2u);
          }

          v47 = +[MSDMailProcessor sharedInstance];
          [v47 start];

          v48 = sub_100068600();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v62 = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Starting mail processor ended", v62, 2u);
          }

          v49 = [(MSDDemoUpdateController *)v15 device];
          [v49 terminateConfigurationApp];

          v50 = sub_100068600();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v61 = 0;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "terminateConfigurationApp ended", v61, 2u);
          }

          v51 = [(MSDDemoUpdateController *)v15 device];
          [v51 deleteConfigurationApp];

          v52 = sub_100068600();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v60 = 0;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "deleteConfigurationApp ended", v60, 2u);
          }
LABEL_23:

LABEL_24:
          [(MSDDemoUpdateController *)v15 setBusy:0];
          goto LABEL_25;
        }
      }
    }
    unsigned __int8 v34 = 0;
    goto LABEL_24;
  }
  v54 = sub_100068600();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
    sub_1000D6524();
  }

  v57 = 0;
  v32 = 0;
  v16 = 0;
  id v20 = 0;
  unsigned __int8 v34 = 0;
LABEL_25:

  objc_sync_exit(v15);
  return v34;
}

- (BOOL)installCachedContentForCurrentLocale:(BOOL *)a3
{
  v3 = self;
  objc_sync_enter(v3);
  v4 = +[MSDUIHelper sharedInstance];
  v5 = +[MSDProgressUpdater sharedInstance];
  objc_super v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Installing cached demo content...", buf, 2u);
  }

  if (os_variant_has_internal_content()
    && (+[MSDTestPreferences sharedInstance],
        v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 skipVerifyHashBeforeStaging],
        v7,
        v8))
  {
    v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Skipping file hash verification before staging", buf, 2u);
    }

    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 1;
  }
  v76[0] = @"IsCriticalUpdate";
  v76[1] = @"ForBackgroundDownload";
  v77[0] = &__kCFBooleanFalse;
  v77[1] = &__kCFBooleanFalse;
  v76[2] = @"VerifyHashBeforeStaging";
  id v11 = +[NSNumber numberWithBool:v10];
  v77[2] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:3];

  if (![(MSDDemoUpdateController *)v3 busy])
  {
    [(MSDDemoUpdateController *)v3 setBusy:1];
    id v13 = [(MSDDemoUpdateController *)v3 device];
    [v13 setCachedBundleInstallState:@"cachedBundleInstallInProgress"];

    id v71 = 0;
    id v14 = [(MSDDemoUpdateController *)v3 _selectCachedManifestWithError:&v71];
    id v15 = v71;
    id v16 = v15;
    if (v14)
    {
      id v70 = v15;
      unsigned int v17 = [(MSDDemoUpdateController *)v3 _signedManifestMinimumOSVersionCheck:v14 error:&v70];
      id v18 = v70;

      if (v17)
      {
        v19 = [(MSDDemoUpdateController *)v3 device];
        id v20 = [v19 installedFactoryBundleID];

        if (v20)
        {
          v21 = [(MSDDemoUpdateController *)v3 device];
          v22 = [v21 installedFactoryBundleID];
          v23 = [v14 bundleID];
          unsigned int v24 = [v22 isEqualToString:v23];

          if (v24)
          {
            v62 = [(MSDDemoUpdateController *)v3 device];
            [v62 setCachedBundleInstallState:@"cachedBundleInstallDone"];

            v49 = sub_100068600();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              v63 = [v14 getLocaleCode];
              v64 = [(MSDDemoUpdateController *)v3 device];
              v65 = [v64 installedFactoryBundleID];
              *(_DWORD *)buf = 138543618;
              v73 = v63;
              __int16 v74 = 2114;
              v75 = v65;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Bundle with locale %{public}@ & bundle ID %{public}@ already installed", buf, 0x16u);
            }
            BOOL v50 = 0;
            BOOL v51 = 1;
            goto LABEL_26;
          }
        }
        v25 = [(MSDDemoUpdateController *)v3 helperAgent];
        unsigned __int8 v26 = [v25 stageDeviceForUpdateProcess:0];

        if (v26)
        {
          v27 = +[MSDUIHelper sharedInstance];
          [v27 startFullScreenUIWith:@"CACHED_BUNDLE_INSTALL" allowCancel:0];

          v28 = [(MSDDemoUpdateController *)v3 device];
          unsigned __int8 v29 = [v28 dcotaOfflineModeDevice];

          if ((v29 & 1) == 0)
          {
            v30 = [(MSDDemoUpdateController *)v3 device];
            [v30 setupDummyPreferenceFile];
          }
          [v5 startBundleUpdateMonitor:v14 inMode:0];
          v31 = [v5 bundleInProgress];
          [v31 startBundleUpdateTimer];

          v32 = [(MSDDemoUpdateController *)v3 device];
          [v32 setBackgroundDownloadActive:0];

          v33 = sub_100068600();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Stopping all apps running in the foreground...", buf, 2u);
          }

          unsigned __int8 v34 = +[MSDAppHelper sharedInstance];
          v35 = [v4 fullScreenUIAppId];
          v36 = +[NSArray arrayWithObjects:v35, @"com.apple.ist.windward", @"com.apple.ist.DemoDiscoveryApp", @"com.apple.PineBoard", 0];
          [v34 stopAllAppsExcept:v36];

          id v69 = v18;
          LODWORD(v34) = [(MSDDemoUpdateController *)v3 _kickOffContentUpdateForManifest:v14 withOptions:v12 error:&v69];
          id v16 = v69;

          if (v34)
          {
            v37 = [v5 bundleInProgress];
            [v37 getBundleUpdateTime];
            v39 = v38;

            v40 = sub_100068600();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v73 = v39;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Total time taken for this update: %f.", buf, 0xCu);
            }

            v41 = [v5 bundleInProgress];
            [v41 stopBundleUpdateTimer];

            v42 = sub_100068600();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Done with content update, switching to real backup folder.", buf, 2u);
            }

            v43 = [(MSDDemoUpdateController *)v3 helperAgent];
            unsigned int v44 = [v43 switchToBackupFolder];

            if (v44)
            {
              [(MSDDemoUpdateController *)v3 _stageContentPlistForManifest:v14];
              unsigned int v45 = +[MSDLanguageAndRegionManager sharedInstance];
              [v45 saveCurrentDeviceLanguageIdentifier];

              v46 = +[MSDLanguageAndRegionManager sharedInstance];
              [v46 saveCuurentDeviceRegionCode];

              v47 = [v14 bundleID];
              v48 = [(MSDDemoUpdateController *)v3 device];
              [v48 setInstalledFactoryBundleID:v47];

              v49 = [(MSDDemoUpdateController *)v3 device];
              [v49 setCachedBundleInstallState:@"cachedBundleInstallWaitMigration"];
              BOOL v50 = 1;
              BOOL v51 = 1;
              id v18 = v16;
LABEL_26:

              if (a3) {
                *a3 = v50;
              }
              v52 = +[MSDUIHelper sharedInstance];
              [v52 stopFullScreenUI:0];

              [(MSDDemoUpdateController *)v3 setBusy:0];
              goto LABEL_29;
            }
          }
          BOOL v50 = 1;
LABEL_39:
          id v68 = v16;
          sub_1000C31D4(&v68, 3727744768, @"An error has occurred.");
          id v18 = v68;

          v56 = +[MSDDemoUpdateStatusHub sharedInstance];
          [v56 demoUpdateFailed:v18];

          v57 = [(MSDDemoUpdateController *)v3 device];
          unsigned __int8 v58 = [v57 dcotaOfflineModeDevice];

          if ((v58 & 1) == 0)
          {
            v59 = sub_100068600();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Cleaning up keep alive file and BootTask Work folder...", buf, 2u);
            }

            v60 = [(MSDDemoUpdateController *)v3 device];
            [v60 cleanupDummyPreferenceFile];

            v61 = [(MSDDemoUpdateController *)v3 device];
            [v61 destroyWorkFolderForBootTask];
          }
          v49 = [(MSDDemoUpdateController *)v3 device];
          [v49 setCachedBundleInstallState:@"cachedBundleInstallDone"];
          BOOL v51 = 0;
          goto LABEL_26;
        }
        v55 = sub_100068600();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          sub_1000D6558();
        }
      }
      BOOL v50 = 0;
      id v16 = v18;
      goto LABEL_39;
    }
    BOOL v50 = 0;
    goto LABEL_39;
  }
  v54 = sub_100068600();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "demo updater is busy; ignoring install call",
      buf,
      2u);
  }

  id v14 = 0;
  id v18 = 0;
  BOOL v51 = 0;
LABEL_29:

  objc_sync_exit(v3);

  return v51;
}

- (BOOL)updateDemoContent
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = +[MSDProgressUpdater sharedInstance];
  v64 = +[MSDUIHelper sharedInstance];
  v4 = [(MSDDemoUpdateController *)v2 device];
  unsigned int v62 = [v4 criticalUpdatePrioritized];

  if (os_variant_has_internal_content()
    && (+[MSDTestPreferences sharedInstance],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 skipVerifyHashBeforeStaging],
        v5,
        v6))
  {
    v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Skipping file hash verification before staging", buf, 2u);
    }

    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }
  v72[0] = @"IsCriticalUpdate";
  v9 = +[NSNumber numberWithBool:v62];
  v73[0] = v9;
  v73[1] = &__kCFBooleanFalse;
  v72[1] = @"ForBackgroundDownload";
  v72[2] = @"VerifyHashBeforeStaging";
  uint64_t v10 = +[NSNumber numberWithBool:v8];
  v73[2] = v10;
  v63 = +[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:3];

  v60 = +[MSDPairedWatchProxy sharedInstance];
  unsigned int v65 = [(MSDDemoUpdateController *)v2 busy];
  if (!v65)
  {
    [(MSDDemoUpdateController *)v2 setBusy:1];
    id v11 = [(MSDDemoUpdateController *)v2 device];
    unsigned int v12 = [v11 switchModeImmediately:2];

    if (v12)
    {
      id v13 = [(MSDDemoUpdateController *)v2 device];
      if ([v13 isBetterTogetherDemo]) {
        unsigned int v57 = [v60 paired];
      }
      else {
        unsigned int v57 = 0;
      }

      id v14 = [(MSDDemoUpdateController *)v2 helperAgent];
      unsigned __int8 v15 = [v14 stageDeviceForUpdateProcess:0];

      if (v15)
      {
        id v16 = sub_100068600();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Device downloading manifest...", buf, 2u);
        }

        [v3 updateStage:2];
        unsigned int v17 = [(MSDDemoUpdateController *)v2 device];
        id v18 = [v17 retrieveSignedManifest];

        if (v18)
        {
          id v68 = 0;
          unsigned int v19 = [(MSDDemoUpdateController *)v2 _signedManifestMinimumOSVersionCheck:v18 error:&v68];
          id v20 = v68;
          if (v19)
          {
            [v3 startBundleUpdateMonitor:v18 inMode:0];
            v21 = [v3 bundleInProgress];
            [v21 startBundleUpdateTimer];

            v22 = +[MSDAppPrivacyPermissionsHelper sharedInstance];
            [v22 savePrivacyPermissionsForAllApps:v18];

            v23 = [(MSDDemoUpdateController *)v2 device];
            [v23 setBackgroundDownloadActive:0];

            [v3 updateStage:21];
            unsigned int v24 = sub_100068600();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Stopping all apps running in the foreground...", buf, 2u);
            }

            v25 = +[MSDAppHelper sharedInstance];
            unsigned __int8 v26 = [v64 fullScreenUIAppId];
            v27 = +[NSArray arrayWithObjects:v26, @"com.apple.ist.windward", @"com.apple.ist.DemoDiscoveryApp", @"com.apple.PineBoard", @"com.apple.ist.DigitalSignage.iOS", 0];
            [v25 stopAllAppsExcept:v27];

            [v3 updateStage:22];
            id v67 = v20;
            LODWORD(v25) = [(MSDDemoUpdateController *)v2 _kickOffContentUpdateForManifest:v18 withOptions:v63 error:&v67];
            id v59 = v67;

            if (v25)
            {
              v61 = [v3 getContentUpdateType];
              v28 = [v3 bundleInProgress];
              unsigned __int8 v29 = [v28 downloadedContentSource];

              v30 = [v29 objectForKey:@"remote"];
              v31 = (char *)[v30 longLongValue];
              v32 = [v29 objectForKey:@"local"];
              id v33 = [v32 longLongValue];

              unsigned __int8 v34 = [v3 bundleInProgress];
              id v35 = [v34 getComponentsSuccessful];
              v36 = [v3 bundleInProgress];
              uint64_t v37 = (uint64_t)[v36 getAllComponentsForUpdate];

              unsigned int v38 = [v29 objectForKey:@"local"];
              id v39 = [v38 longLongValue];

              v40 = [v3 bundleInProgress];
              [v40 getBundleUpdateTime];
              double v42 = v41;

              v43 = sub_100068600();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                double v71 = v42;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Total time taken for this update: %f.", buf, 0xCu);
              }

              unsigned int v44 = +[MSDAnalyticsEventHandler sharedInstance];
              [v44 sendContentUpdateCompletedEvent:&v31[(void)v33] withTimeTaken:v39 != 0 cachingHubAvailable:v62 isCriticalUpdate:v61 contentUpdateType:100 * (uint64_t)v35 / v37 andComponentSuccess:v42];

              unsigned int v45 = [v3 bundleInProgress];
              [v45 stopBundleUpdateTimer];

              v46 = sub_100068600();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Done with content update, switching to real backup folder.", buf, 2u);
              }

              v47 = [(MSDDemoUpdateController *)v2 helperAgent];
              unsigned int v48 = [v47 switchToBackupFolder];

              if (v48)
              {
                v49 = [(MSDDemoUpdateController *)v2 device];
                unsigned int v50 = [v49 switchModeImmediately:4];

                if (v50)
                {
                  [(MSDDemoUpdateController *)v2 setBusy:0];
                  LOBYTE(v10) = 1;
                  goto LABEL_27;
                }
              }
            }
            else
            {
              v61 = 0;
              unsigned __int8 v29 = 0;
            }
            id v20 = v59;
          }
          else
          {
            v61 = 0;
            unsigned __int8 v29 = 0;
          }
          goto LABEL_41;
        }
        id v69 = 0;
        sub_1000C31D4(&v69, 3727740940, @"Could not download manifest.");
        id v20 = v69;
        v61 = 0;
        unsigned __int8 v29 = 0;
LABEL_37:
        id v18 = 0;
LABEL_41:
        id v66 = v20;
        sub_1000C31D4(&v66, 3727744768, @"An error has occurred.");
        id v59 = v66;

        v54 = +[MSDDemoUpdateStatusHub sharedInstance];
        [v54 demoUpdateFailed:v59];

        v55 = +[MSDAnalyticsEventHandler sharedInstance];
        [v55 sendContentUpdateFailureEvent:v59 isFatal:1];

        if (v57)
        {
          v56 = +[MSDPairedWatchProxy sharedInstance];
          [v56 signalContentUpdateCompletion:0 andError:v59];
        }
        [(MSDDemoUpdateController *)v2 checkWithTimeKeeper:v59];
        [(MSDDemoUpdateController *)v2 setBusy:0];
        LOBYTE(v10) = 0;
        goto LABEL_27;
      }
      v53 = sub_100068600();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        sub_1000D6558();
      }

      v61 = 0;
      unsigned __int8 v29 = 0;
    }
    else
    {
      v61 = 0;
      unsigned __int8 v29 = 0;
      unsigned int v57 = 0;
    }
    id v20 = 0;
    goto LABEL_37;
  }
  v52 = sub_100068600();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "demo updater is busy.", buf, 2u);
  }

  v61 = 0;
  unsigned __int8 v29 = 0;
  id v59 = 0;
  id v18 = 0;
LABEL_27:

  objc_sync_exit(v2);

  return v10 & (v65 ^ 1);
}

- (void)cancelDemoContentUpdate
{
  id v16 = +[MSDPairedWatchProxy sharedInstance];
  v3 = [(MSDDemoUpdateController *)self device];
  if ([v3 isBetterTogetherDemo])
  {
    unsigned int v4 = [v16 paired];

    if (v4) {
      [v16 cancelOperation];
    }
  }
  else
  {
  }
  v5 = +[MSDDemoUpdateTimeKeeper sharedInstance];
  [v5 canceledByUser];

  unsigned int v6 = +[MSDTargetDevice sharedInstance];
  [v6 forceSwitchToDemoUpdateModeIfNeeded];

  v7 = +[MSDPlatform sharedInstance];
  if ([v7 macOS])
  {
  }
  else
  {
    uint64_t v8 = +[MSDPlatform sharedInstance];
    unsigned int v9 = [v8 iOS];

    if (!v9) {
      goto LABEL_9;
    }
  }
  uint64_t v10 = +[MSDPricingUpdateController sharedInstance];
  [v10 operationCanceled];

LABEL_9:
  id v11 = [(MSDDemoUpdateController *)self componentManager];

  if (v11)
  {
    unsigned int v12 = [(MSDDemoUpdateController *)self componentManager];
    [v12 abortProcessing];
  }
  id v13 = +[MSDUIHelper sharedInstance];
  [v13 fullScreenUICanceledByUser];

  id v14 = +[MSDProgressUpdater sharedInstance];
  [v14 updateStage:101];

  unsigned __int8 v15 = +[MSDMailProcessor sharedInstance];
  [v15 sendImmediateDeviceInfoPing];
}

- (void)concludeDemoContenUpdateWithResult:(BOOL)a3 andError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (![(MSDDemoUpdateController *)v7 busy])
  {
    uint64_t v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "demo updater is NOT busy.", buf, 2u);
    }

    goto LABEL_8;
  }
  [(MSDDemoUpdateController *)v7 setBusy:0];
  if (!v4)
  {
LABEL_8:
    id v12 = v6;
    sub_1000C31D4(&v12, 3727744768, @"An error has occurred.");
    id v9 = v12;

    id v11 = +[MSDDemoUpdateStatusHub sharedInstance];
    [v11 demoUpdateFailed:v9];

    [(MSDDemoUpdateController *)v7 checkWithTimeKeeper:v9];
    goto LABEL_4;
  }
  uint64_t v8 = [(MSDDemoUpdateController *)v7 device];
  [v8 switchModeImmediately:5];

  id v9 = v6;
LABEL_4:
  objc_sync_exit(v7);
}

- (BOOL)setupAccounts:(id *)a3
{
  BOOL v4 = +[MSDAccountManager sharedInstance];
  id v12 = 0;
  unsigned __int8 v5 = [v4 setupAccounts:&v12];
  id v6 = v12;

  if ((v5 & 1) == 0)
  {
    id v11 = v6;
    sub_1000C31D4(&v11, 3727744743, @"An error has occurred.");
    id v7 = v11;

    uint64_t v8 = +[MSDDemoUpdateStatusHub sharedInstance];
    [v8 demoUpdateFailed:v7];

    id v9 = +[MSDAnalyticsEventHandler sharedInstance];
    [v9 sendiCloudSigninFailureEvent:v7];

    if (a3)
    {
      id v6 = v7;
      *a3 = v6;
    }
    else
    {
      id v6 = v7;
    }
  }

  return v5;
}

- (BOOL)continueToUpdateAccountContent
{
  v3 = self;
  objc_sync_enter(v3);
  unsigned int v4 = [(MSDDemoUpdateController *)v3 busy];
  if (v4)
  {
    unsigned __int8 v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000D6524();
    }
  }
  else
  {
    [(MSDDemoUpdateController *)v3 setBusy:1];
    id v7 = 0;
    unsigned __int8 v2 = [(MSDDemoUpdateController *)v3 setupAccounts:&v7];
    unsigned __int8 v5 = v7;
    if (v5) {
      [(MSDDemoUpdateController *)v3 checkWithTimeKeeper:v5];
    }
    [(MSDDemoUpdateController *)v3 setBusy:0];
  }

  objc_sync_exit(v3);
  return (v4 ^ 1) & v2;
}

- (BOOL)continueToUpdateDemoContent
{
  v3 = self;
  objc_sync_enter(v3);
  unsigned int v4 = +[MSDPairedWatchProxy sharedInstance];
  unsigned int v5 = [(MSDDemoUpdateController *)v3 busy];
  if (!v5)
  {
    [(MSDDemoUpdateController *)v3 setBusy:1];
    id v6 = +[MSDAppPrivacyPermissionsHelper sharedInstance];
    [v6 grantPrivacyPermissionsForAllApps];

    id v7 = +[MSDConfigurationProfileManager sharedInstance];
    [v7 installDefaultConfigurationProfile];

    id v34 = 0;
    [(MSDDemoUpdateController *)v3 setupAccounts:&v34];
    id v8 = v34;
    id v9 = [(MSDDemoUpdateController *)v3 device];
    if ([v9 isBetterTogetherDemo])
    {
      unsigned int v10 = [v4 paired];

      if (v10)
      {
        if (os_variant_has_internal_content())
        {
          id v11 = +[MSDTestPreferences sharedInstance];
          id v12 = [v11 contentSyncTimeoutInterval];

          if (v12)
          {
            id v13 = sub_100068600();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v36 = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Override default content sync timeout interval with value: %{public}@", buf, 0xCu);
            }

            unsigned int v14 = [v12 unsignedIntValue];
          }
          else
          {
            unsigned int v14 = 1800;
          }
        }
        else
        {
          unsigned int v14 = 1800;
        }
        unsigned __int8 v26 = +[MSDProgressUpdater sharedInstance];
        [v26 updateStage:32];

        v27 = sub_100068600();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v36) = v14;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Wait extra %u seconds for content sync between phone and watch...", buf, 8u);
        }

        sleep(v14);
        v28 = sub_100068600();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Sending content update completion signal to paired watch...", buf, 2u);
        }

        int v15 = 1;
        if (([v4 signalContentUpdateCompletion:1 andError:0] & 1) == 0)
        {
          unsigned int v17 = 0;
LABEL_27:
          id v33 = v8;
          sub_1000C31D4(&v33, 3727744768, @"An error has occurred.");
          id v24 = v33;

          unsigned __int8 v29 = +[MSDDemoUpdateStatusHub sharedInstance];
          [v29 demoUpdateFailed:v24];

          if (v15) {
            [v4 signalContentUpdateCompletion:0 andError:v24];
          }
          [(MSDDemoUpdateController *)v3 checkWithTimeKeeper:v24];
          [(MSDDemoUpdateController *)v3 setBusy:0];
          char v2 = 0;
          goto LABEL_17;
        }
LABEL_11:
        id v16 = +[MSDPreferencesFile sharedInstance];
        unsigned int v17 = [v16 objectForKey:@"locale"];

        if (v17)
        {
          id v18 = [v17 objectForKey:@"language"];
          unsigned int v19 = [v17 objectForKey:@"region"];
          id v20 = +[MSDLanguageAndRegionManager sharedInstance];
          [v20 setDeviceLanguage:v18 andRegion:v19 sbRestartNeeded:0 sbRestartHandler:0];

          v21 = +[MSDPreferencesFile sharedInstance];
          [v21 removeObjectForKey:@"locale"];
        }
        v22 = +[MSDAnalytics sharedInstance];
        [v22 disableCoreAnalticsTransformSampling];

        v23 = sub_100068600();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Calling waitForGMAvailability", buf, 2u);
        }

        if (+[MSDGreyMatterHelper waitForGMAvailability])
        {
          [(MSDDemoUpdateController *)v3 setBusy:0];
          char v2 = 1;
          id v24 = v8;
          goto LABEL_17;
        }
        v31 = sub_100068600();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_1000D658C();
        }

        goto LABEL_27;
      }
    }
    else
    {
    }
    int v15 = 0;
    goto LABEL_11;
  }
  v30 = sub_100068600();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    sub_1000D6524();
  }

  unsigned int v17 = 0;
  id v24 = 0;
LABEL_17:

  objc_sync_exit(v3);

  return v2 & (v5 ^ 1);
}

- (void)checkWithTimeKeeper:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[MSDDemoUpdateTimeKeeper sharedInstance];
  id v14 = 0;
  unsigned int v5 = [v4 shouldCleanUp:&v14];
  id v6 = v14;
  id v7 = v6;
  if (v5)
  {
    if ([v6 code] != (id)3727741184)
    {
      if ([v7 code] == (id)3727741185)
      {
        id v8 = +[MSDTargetDevice sharedInstance];
        [v8 forceSwitchToDemoUpdateModeIfNeeded];
LABEL_15:

        goto LABEL_18;
      }
      id v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unknown clean up reason!", buf, 2u);
      }
    }
    id v8 = +[MSDTargetDevice sharedInstance];
    [v8 forceSwitchToDemoModeIfNeeded];
    goto LABEL_15;
  }
  if ([v3 code] == (id)3727740939)
  {
    id v8 = +[MSDProgressUpdater sharedInstance];
    [v8 updateStage:24];
    goto LABEL_15;
  }
  id v9 = +[MSDTestPreferences sharedInstance];
  uint64_t v10 = (uint64_t)[v9 timeShowingFatalError];

  if (v10)
  {
    id v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Override MSDTimeShowingFatalError timeout: %u", buf, 8u);
    }
  }
  else
  {
    uint64_t v10 = 900;
  }
  id v13 = [v4 setCompletionTimeForFatalError:v10];
LABEL_18:
}

- (BOOL)PLHasCompletedRestorePostProcessing
{
  char v12 = 0;
  id v2 = objc_alloc((Class)PLAssetsdClient);
  id v3 = +[PLPhotoLibraryPathManager systemLibraryURL];
  id v4 = [v2 initWithPhotoLibraryURL:v3];

  unsigned int v5 = [v4 demoClient];
  id v11 = 0;
  unsigned __int8 v6 = [v5 hasCompletedRestorePostProcessing:&v12 error:&v11];
  id v7 = v11;

  if (v6)
  {
    BOOL v8 = v12 != 0;
  }
  else
  {
    id v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000D65C0();
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)PLHasCompletedMomentAnalysis
{
  char v12 = 0;
  id v2 = objc_alloc((Class)PLAssetsdClient);
  id v3 = +[PLPhotoLibraryPathManager systemLibraryURL];
  id v4 = [v2 initWithPhotoLibraryURL:v3];

  unsigned int v5 = [v4 demoClient];
  id v11 = 0;
  unsigned __int8 v6 = [v5 hasCompletedMomentAnalysis:&v12 error:&v11];
  id v7 = v11;

  if (v6)
  {
    BOOL v8 = v12 != 0;
  }
  else
  {
    id v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000D6628();
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)migrateDataWithBlockingUI:(int)a3 startMigration:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(MSDDemoUpdateController *)self migrationDone])
  {
    unsigned __int8 v6 = +[MSDProgressUpdater sharedInstance];
    [v6 updateStage:14];

    id v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v35) = 67109120;
      HIDWORD(v35) = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Waiting for data migration to finish; startMigration=%{BOOL}d",
        (uint8_t *)&v35,
        8u);
    }

    if (v4) {
      DMPerformMigration();
    }
    else {
      DMPerformMigrationIfNeeded();
    }
    BOOL v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Data migration finished.", (uint8_t *)&v35, 2u);
    }

    id v9 = [(MSDDemoUpdateController *)self device];
    unsigned int v10 = [v9 isOfflineMode];

    id v11 = +[MSDUIHelper sharedInstance];
    char v12 = v11;
    if (v10) {
      CFStringRef v13 = @"CACHED_BUNDLE_INSTALL";
    }
    else {
      CFStringRef v13 = @"IN_PROGRESS";
    }
    [v11 startFullScreenUIWith:v13 allowCancel:1 disableIdleTimer:1];

    id v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Checking photo library migration.", (uint8_t *)&v35, 2u);
    }

    int v15 = 0;
    int v16 = 0;
    unsigned int v17 = 0;
    do
    {
      id v18 = v17;
      unsigned int v19 = v16;
      unsigned int v17 = +[NSDate date];

      unsigned int v20 = [(MSDDemoUpdateController *)self PLHasCompletedRestorePostProcessing];
      sleep(2u);
      int v16 = +[NSDate date];

      [v16 timeIntervalSinceDate:v17];
      v15 += (int)v21;
    }
    while ((v20 & 1) == 0 && v15 < 900);
    v22 = sub_100068600();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (!v23) {
        goto LABEL_23;
      }
      LODWORD(v35) = 67109120;
      HIDWORD(v35) = v15;
      id v24 = "Photo library migration finished after %d seconds.";
    }
    else
    {
      if (!v23) {
        goto LABEL_23;
      }
      LODWORD(v35) = 67109120;
      HIDWORD(v35) = v15;
      id v24 = "Photo library migration timeout after %d seconds.";
    }
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v35, 8u);
LABEL_23:

    v25 = sub_100068600();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Checking photo moment analysis.", (uint8_t *)&v35, 2u);
    }

    int v26 = 0;
    do
    {
      v27 = v17;
      v28 = v16;
      unsigned int v17 = +[NSDate date];

      unsigned int v29 = [(MSDDemoUpdateController *)self PLHasCompletedMomentAnalysis];
      sleep(5u);
      int v16 = +[NSDate date];

      [v16 timeIntervalSinceDate:v17];
      v26 += (int)v30;
    }
    while ((v29 & 1) == 0 && v26 < 300);
    v31 = sub_100068600();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v32)
      {
        LODWORD(v35) = 67109120;
        HIDWORD(v35) = v26;
        id v33 = "Photo moment analysis finished after %d seconds.";
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)&v35, 8u);
      }
    }
    else if (v32)
    {
      LODWORD(v35) = 67109120;
      HIDWORD(v35) = v26;
      id v33 = "Photo moment analysis timeout after %d seconds.";
      goto LABEL_33;
    }

    [(MSDDemoUpdateController *)self setMigrationDone:1];
  }
  return 1;
}

- (void)setIOSSpecificSettings
{
}

- (void)setAutomatedDeviceGroupStoreID
{
  id v3 = +[MSDTargetDevice sharedInstance];
  BOOL v4 = [v3 getDeviceOptions];

  if (v4)
  {
    unsigned int v5 = [v4 objectForKey:@"store_id"];
  }
  else
  {
    unsigned int v5 = 0;
  }
  unsigned __int8 v6 = [(MSDDemoUpdateController *)self device];
  id v7 = [v6 serialNumber];

  BOOL v8 = +[OSASystemConfiguration automatedDeviceGroup];
  if (!v8)
  {
    unsigned int v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000D6690(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    id v18 = 0;
    id v9 = 0;
    goto LABEL_26;
  }
  id v9 = v8;
  if (!v5)
  {
    unsigned int v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000D671C(v10, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_25;
  }
  if (!v7)
  {
    unsigned int v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000D67A8(v10, v29, v30, v31, v32, v33, v34, v35);
    }
    goto LABEL_25;
  }
  if ([(__CFString *)v8 containsString:v5]
    && [(__CFString *)v9 containsString:v7])
  {
    unsigned int v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      CFStringRef v37 = @"AutomatedDeviceGroup";
      __int16 v38 = 2114;
      id v39 = v9;
      __int16 v40 = 2114;
      double v41 = v5;
      __int16 v42 = 2114;
      v43 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ key with value %{public}@ already contains store ID %{public}@ and serial number %{public}@, skip appending store ID and serial number again", buf, 0x2Au);
    }
LABEL_25:
    id v18 = 0;
LABEL_26:

    int v26 = v9;
    goto LABEL_27;
  }
  int v26 = +[NSString stringWithFormat:@"%@_%@_%@", v9, v5, v7];

  +[OSASystemConfiguration setAutomatedDeviceGroup:v26];
  v27 = sub_100068600();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v37 = v26;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Set new AutomatedDeviceGroup %@", buf, 0xCu);
  }

  v28 = +[OSASystemConfiguration automatedDeviceGroup];
  id v18 = v28;
  if (!v28 || ([v28 isEqualToString:v26] & 1) == 0)
  {
    unsigned int v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000D6820();
    }
    id v9 = v26;
    goto LABEL_26;
  }
LABEL_27:
}

- (void)_configureMailAppForDemo
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = objc_alloc_init((Class)EMDaemonInterface);
  [v3 launchDaemon];
  BOOL v4 = [v3 clientState];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008DB50;
  v8[3] = &unk_100153790;
  unsigned int v5 = v2;
  id v9 = v5;
  [v4 setStateForDemoMode:v8];

  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    id v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000D68B4();
    }
  }
}

- (BOOL)_signedManifestMinimumOSVersionCheck:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 getInfo];
  BOOL v8 = [v7 objectForKey:@"MinimumOSVersion"];

  id v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [v6 getInfo];
    uint64_t v11 = [v10 objectForKey:@"PartNumber"];
    uint64_t v12 = [v6 getInfo];
    uint64_t v13 = [v12 objectForKey:@"Revision"];
    int v20 = 138543874;
    uint64_t v21 = v11;
    __int16 v22 = 2114;
    uint64_t v23 = v13;
    __int16 v24 = 2114;
    uint64_t v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Manifest partnumber/revision: %{public}@_%{public}@, minimum OS version is %{public}@", (uint8_t *)&v20, 0x20u);
  }
  if (v8
    && ([(MSDDemoUpdateController *)self device],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        [v14 OSVersion],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        unsigned int v16 = [v8 higherVersionThan:v15],
        v15,
        v14,
        v16))
  {
    uint64_t v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000D697C((uint64_t)v8, self, v19);
    }

    sub_1000C31D4(a4, 3727740976, @"iOS version mismatch.");
    BOOL v17 = 0;
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)_kickOffContentUpdateForManifest:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 mutableCopy];
  unsigned int v10 = +[MSDPlatform sharedInstance];
  if ([v10 macOS])
  {
  }
  else
  {
    uint64_t v11 = +[MSDPlatform sharedInstance];
    unsigned int v12 = [v11 iOS];

    if (!v12) {
      goto LABEL_13;
    }
  }
  uint64_t v13 = [v7 getAppList];
  uint64_t v14 = [v13 objectForKey:@"com.retailtech.arkenstone"];
  if (v14
    || ([v13 objectForKey:@"com.apple.ist.windward"],
        (uint64_t v14 = (char *)objc_claimAutoreleasedReturnValue()) != 0)
    || ([v13 objectForKey:@"com.apple.ist.DemoDiscoveryApp"],
        (uint64_t v14 = (char *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v15 = [(MSDDemoUpdateController *)self device];
    unsigned __int8 v16 = [v15 getSavedFlag];

    if ((v16 & 2) != 0)
    {
      BOOL v17 = +[MSDPricingUpdateController sharedInstance];
      unsigned __int8 v18 = [v17 completed];

      if ((v18 & 1) == 0)
      {
        uint64_t v19 = sub_100068600();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v64 = v14;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Request builder to defer the update of app: %{public}@", buf, 0xCu);
        }

        [v9 setObject:v14 forKey:@"AppItemToDefer"];
      }
    }
  }

LABEL_13:
  int v20 = [[MSDComponentBuilder alloc] initWithSignedManifest:v7 andOptions:v9];
  uint64_t v21 = +[MSDConfigurationProfileManager sharedInstance];
  [v21 uninstallAllDemoBundleConfigurationProfiles];

  __int16 v22 = [(MSDComponentBuilder *)v20 buildComponentsNotInManifest];
  if (v22)
  {
    uint64_t v23 = [(MSDComponentBuilder *)v20 buildComponentsFromManifest];
    if (v23)
    {
      uint64_t v24 = v23;
      unsigned int v45 = a5;
      id v48 = v9;
      id v49 = v8;

      uint64_t v25 = +[MSDDemoUpdateTimeKeeper sharedInstance];
      v52 = [v25 date];

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v46 = (void *)v24;
      v47 = v22;
      v61[0] = v22;
      v61[1] = v24;
      id obj = +[NSArray arrayWithObjects:v61 count:2];
      id v26 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
      if (!v26)
      {
        id v28 = 0;
LABEL_31:

        int v20 = 0;
        id v7 = 0;
        BOOL v41 = 1;
        id v9 = v48;
        id v8 = v49;
        __int16 v42 = v46;
        __int16 v22 = v47;
        goto LABEL_32;
      }
      id v27 = v26;
      id v28 = 0;
      uint64_t v29 = *(void *)v56;
LABEL_17:
      uint64_t v30 = 0;
      while (1)
      {
        if (*(void *)v56 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = *(void **)(*((void *)&v55 + 1) + 8 * v30);
        if ([v31 count])
        {
          uint64_t v33 = +[MSDDemoUpdateTimeKeeper sharedInstance];
          id v54 = v28;
          unsigned int v34 = [v33 shouldCleanUp:&v54];
          id v35 = v54;

          if (v34)
          {
            sub_100068600();
            v36 = (MSDComponentProcessor *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v36->super, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v64 = "-[MSDDemoUpdateController _kickOffContentUpdateForManifest:withOptions:error:]";
              _os_log_impl((void *)&_mh_execute_header, &v36->super, OS_LOG_TYPE_DEFAULT, "%s - Content update has been cancelled by users request", buf, 0xCu);
            }
            id v28 = v35;
LABEL_37:
            id v9 = v48;
            id v8 = v49;
            a5 = v45;
            __int16 v42 = v46;
            __int16 v22 = v47;

            int v20 = 0;
            id v7 = 0;
            if (!v45) {
              goto LABEL_42;
            }
LABEL_38:
            id v28 = v28;
            BOOL v41 = 0;
            *a5 = v28;
            goto LABEL_32;
          }
          v36 = [[MSDComponentProcessor alloc] initWithQoS:33];
          CFStringRef v37 = [[MSDComponentManager alloc] initWithComponents:v31 andProcessor:v36];
          [(MSDDemoUpdateController *)self setComponentManager:v37];
          __int16 v38 = [(MSDDemoUpdateController *)self componentManager];
          [v38 startProcessingAllComponents];

          id v39 = [(MSDDemoUpdateController *)self componentManager];
          id v53 = v35;
          unsigned __int8 v40 = [v39 waitForProcessingCompletionTillDate:v52 outError:&v53];
          id v28 = v53;

          if ((v40 & 1) == 0
            && ([v28 code] == (id)3727741184 || objc_msgSend(v28, "code") == (id)3727741185))
          {

            goto LABEL_37;
          }
        }
        else
        {
          v36 = 0;
          CFStringRef v37 = 0;
        }

        if (v27 == (id)++v30)
        {
          id v27 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
          if (v27) {
            goto LABEL_17;
          }
          goto LABEL_31;
        }
      }
    }
    id v59 = 0;
    sub_1000C3140(&v59, 3727740938, @"Manifest is corrupted.");
    unsigned int v44 = v59;
  }
  else
  {
    v60 = 0;
    sub_1000C3140(&v60, 3727740938, @"Manifest is corrupted.");
    unsigned int v44 = v60;
  }
  id v28 = v44;
  __int16 v42 = 0;
  v52 = 0;
  if (a5) {
    goto LABEL_38;
  }
LABEL_42:
  BOOL v41 = 0;
LABEL_32:

  return v41;
}

- (void)_stageContentPlistForManifest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[NSFileManager defaultManager];
  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Staging Content.plist...", buf, 2u);
  }

  id v7 = [(MSDDemoUpdateController *)self _contentPlistPathForManifest:v4];

  if (!v7)
  {
    unsigned int v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000D6A38();
    }
    goto LABEL_25;
  }
  unsigned __int8 v8 = [v5 fileExistsAtPath:v7];
  id v9 = sub_100068600();
  unsigned int v10 = v9;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000D6C40();
    }
LABEL_25:
    uint64_t v11 = 0;
    unsigned __int8 v16 = 0;
    id v12 = 0;
LABEL_35:

    goto LABEL_20;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    CFStringRef v34 = v7;
    __int16 v35 = 2114;
    CFStringRef v36 = @"/private/var/mobile/backup/var/mobile/Media/Content.plist";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Copying %{public}@ to %{public}@...", buf, 0x16u);
  }

  uint64_t v11 = [@"/private/var/mobile/backup/var/mobile/Media/Content.plist" stringByDeletingLastPathComponent];
  if ([v5 fileExistsAtPath:v11])
  {
    id v12 = 0;
  }
  else
  {
    uint64_t v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v34 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Creating %{public}@...", buf, 0xCu);
    }

    id v32 = 0;
    unsigned __int8 v14 = [v5 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v32];
    id v12 = v32;
    if ((v14 & 1) == 0)
    {
      unsigned int v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000D6BCC();
      }
      unsigned __int8 v16 = 0;
      goto LABEL_35;
    }
  }
  uint64_t v15 = +[NSURL fileURLWithString:v7];
  unsigned __int8 v16 = [v15 fileHash];

  BOOL v17 = [(MSDDemoUpdateController *)self helperAgent];
  unsigned __int8 v18 = [v17 cloneFile:v7 to:@"/private/var/mobile/backup/var/mobile/Media/Content.plist" expectingHash:v16];

  uint64_t v19 = sub_100068600();
  unsigned int v10 = v19;
  if ((v18 & 1) == 0)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000D6B58();
    }
    goto LABEL_35;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    CFStringRef v34 = v7;
    __int16 v35 = 2114;
    CFStringRef v36 = @"/private/var/demo_backup/Metadata/.Content.plist";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Copying %{public}@ to %{public}@...", buf, 0x16u);
  }

  if (([v5 fileExistsAtPath:@"/private/var/demo_backup/Metadata"] & 1) == 0)
  {
    int v20 = sub_100068600();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v34 = @"/private/var/demo_backup/Metadata";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Creating %{public}@...", buf, 0xCu);
    }

    uint64_t v21 = [(MSDDemoUpdateController *)self helperAgent];
    unsigned __int8 v22 = [v21 prepareWorkDirectory:@"/private/var/demo_backup/Metadata" writableByNonRoot:0];

    if ((v22 & 1) == 0)
    {
      unsigned int v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000D6AE0(v10, v25, v26, v27, v28, v29, v30, v31);
      }
      goto LABEL_35;
    }
  }
  uint64_t v23 = [(MSDDemoUpdateController *)self helperAgent];
  unsigned __int8 v24 = [v23 cloneFile:v7 to:@"/private/var/demo_backup/Metadata/.Content.plist" expectingHash:v16];

  if ((v24 & 1) == 0)
  {
    unsigned int v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000D6A6C();
    }
    goto LABEL_35;
  }
LABEL_20:
}

- (id)_selectCachedManifestWithError:(id *)a3
{
  uint64_t v5 = +[NSFileManager defaultManager];
  id v6 = +[MSDTargetDevice sharedInstance];
  id v7 = [v6 manifestPath];

  unsigned int v62 = [v7 stringByDeletingLastPathComponent];
  v64 = objc_opt_new();
  unsigned __int8 v8 = +[MSDLanguageAndRegionManager sharedInstance];
  v61 = [v8 getCurrentDevicePreferredLanguage];

  id v9 = +[MSDLanguageAndRegionManager sharedInstance];
  unsigned int v10 = [v9 getCurrentDeviceRegion];

  uint64_t v11 = sub_100068600();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v77 = v61;
    __int16 v78 = 2114;
    v79 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Selecting cached bundle with preferred language code %{public}@; region %{public}@",
      buf,
      0x16u);
  }

  id v12 = +[MSDSignedManifestFactoryMetadata loadManifestMetadata:@"/var/MSDWorkContainer/.MSD_cache_content_plist"];
  id v59 = v12;
  v60 = (void *)v5;
  if (!v12 && [0 count])
  {
    long long v56 = sub_100068600();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      sub_1000D6F14();
    }

    id v73 = 0;
    sub_1000C3140(&v73, 3727740942, @"Failed to load cached manifest file");
    id v47 = v73;
    unsigned __int8 v16 = 0;
    id v32 = 0;
    id v41 = 0;
    id v39 = 0;
    if (a3) {
      goto LABEL_69;
    }
    goto LABEL_73;
  }
  long long v57 = a3;
  long long v58 = self;
  v63 = v7;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v69 objects:v82 count:16];
  if (v14)
  {
    id v15 = v14;
    unsigned __int8 v16 = 0;
    uint64_t v17 = *(void *)v70;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v70 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        int v20 = [v19 supportedRegions];
        unsigned int v21 = [v20 containsObject:v10];

        if (v21) {
          [v64 addObject:v19];
        }
        if ([v19 isPrimaryBundle])
        {
          id v22 = v19;

          uint64_t v23 = sub_100068600();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v77 = v22;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Found default primary bundle: %{public}@", buf, 0xCu);
          }

          unsigned __int8 v16 = v22;
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v69 objects:v82 count:16];
    }
    while (v15);
  }
  else
  {
    unsigned __int8 v16 = 0;
  }

  id v7 = v63;
  if ([v64 count])
  {
    unsigned __int8 v24 = sub_100068600();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [v64 count];
      *(_DWORD *)buf = 134218498;
      id v77 = v25;
      __int16 v78 = 2114;
      v79 = v10;
      __int16 v80 = 2114;
      v81 = v64;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Found %lu bundles for region %{public}@: %{public}@", buf, 0x20u);
    }

    uint64_t v26 = +[MSDSignedManifestFactoryMetadata languageIdentifiersForMetadataList:v64];
    v75 = v61;
    uint64_t v27 = +[NSArray arrayWithObjects:&v75 count:1];
    uint64_t v28 = +[NSLocale matchedLanguagesFromAvailableLanguages:v26 forPreferredLanguages:v27];

    if ([v28 count])
    {
      uint64_t v29 = [v28 firstObject];
      uint64_t v30 = sub_100068600();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v77 = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Found matched language code: %{public}@", buf, 0xCu);
      }

      uint64_t v31 = +[MSDSignedManifestFactoryMetadata metadataWithLanugageIdentifier:v29 fromList:v64];
      if (v31)
      {
        id v32 = (id)v31;

        goto LABEL_35;
      }
      uint64_t v33 = sub_100068600();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_1000D6EAC();
      }
    }
  }
  CFStringRef v34 = sub_100068600();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Did not find matching bundle; selecting default primary bundle",
      buf,
      2u);
  }

  id v32 = v16;
LABEL_35:
  __int16 v35 = sub_100068600();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v77 = v32;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Selected bundle metadata: %{public}@", buf, 0xCu);
  }

  CFStringRef v36 = [v32 fileName];

  if (v36)
  {
    v74[0] = @"/var/MSDWorkContainer/.MSD_cache_manifest";
    CFStringRef v37 = [v32 fileName];
    v74[1] = v37;
    __int16 v38 = +[NSArray arrayWithObjects:v74 count:2];
    id v39 = +[NSString pathWithComponents:v38];

    unsigned __int8 v40 = sub_100068600();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v77 = v39;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Loading manifest file from path %{public}@", buf, 0xCu);
    }

    id v41 = +[MSDSignedManifestFactory createSignedManifestFromManifestFile:v39];
    __int16 v42 = sub_100068600();
    v43 = v42;
    if (v41)
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v77 = v39;
        __int16 v78 = 2114;
        v79 = v63;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Copying manifest file from %{public}@ to %{public}@", buf, 0x16u);
      }

      if (([v60 fileExistsAtPath:v62] & 1) != 0
        || ([(MSDDemoUpdateController *)v58 helperAgent],
            unsigned int v44 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v45 = [v44 prepareWorkDirectory:v62 writableByNonRoot:1],
            v44,
            (v45 & 1) != 0))
      {
        if ([v60 fileExistsAtPath:v63])
        {
          id v66 = 0;
          unsigned __int8 v46 = [v60 removeItemAtPath:v63 error:&v66];
          id v47 = v66;
          if ((v46 & 1) == 0)
          {
            id v48 = sub_100068600();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
              sub_1000D6DAC();
            }

            goto LABEL_68;
          }
        }
        else
        {
          id v47 = 0;
        }
        id v49 = v47;
        id v65 = v47;
        unsigned __int8 v50 = [v60 copyItemAtPath:v39 toPath:v63 error:&v65];
        id v47 = v65;

        if (v50)
        {
          id v41 = v41;
          BOOL v51 = v41;
          id v7 = v63;
          goto LABEL_53;
        }
        id v54 = sub_100068600();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          sub_1000D6D44();
        }

        id v7 = v63;
      }
      else
      {
        long long v55 = sub_100068600();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          sub_1000D6E34();
        }

        id v47 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_1000D6CDC();
      }

      id v67 = 0;
      sub_1000C3140(&v67, 3727740942, @"Failed to load cached manifest file");
      id v47 = v67;
      id v41 = 0;
    }
  }
  else
  {
    id v53 = sub_100068600();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_1000D6CA8();
    }

    id v68 = 0;
    sub_1000C3140(&v68, 3727740942, @"Selected bundle metadata do not contain file name");
    id v47 = v68;
    id v41 = 0;
    id v39 = 0;
  }
LABEL_68:
  a3 = v57;
  if (v57)
  {
LABEL_69:
    id v47 = v47;
    BOOL v51 = 0;
    *a3 = v47;
    goto LABEL_53;
  }
LABEL_73:
  BOOL v51 = 0;
LABEL_53:

  return v51;
}

- (id)_contentPlistPathForManifest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 getInfo];
  uint64_t v5 = [v4 objectForKey:@"PartNumber"];

  id v6 = [v3 getInfo];

  id v7 = [v6 objectForKey:@"Revision"];

  if (v5)
  {
    if (v7)
    {
      unsigned __int8 v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/%@_%d.plist", @"/var/MSDWorkContainer/.MSD_cache_content_plist", v5, [v7 intValue]);
      goto LABEL_4;
    }
    unsigned int v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000D6FC0(v10, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  else
  {
    unsigned int v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000D6F48(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  unsigned __int8 v8 = 0;
LABEL_4:

  return v8;
}

- (BOOL)busy
{
  return self->_busy;
}

- (void)setBusy:(BOOL)a3
{
  self->_busy = a3;
}

- (BOOL)migrationDone
{
  return self->_migrationDone;
}

- (void)setMigrationDone:(BOOL)a3
{
  self->_migrationDone = a3;
}

- (MSDTargetDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (MSDHelperAgent)helperAgent
{
  return self->_helperAgent;
}

- (void)setHelperAgent:(id)a3
{
}

- (MSDComponentManager)componentManager
{
  return self->_componentManager;
}

- (void)setComponentManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentManager, 0);
  objc_storeStrong((id *)&self->_helperAgent, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end