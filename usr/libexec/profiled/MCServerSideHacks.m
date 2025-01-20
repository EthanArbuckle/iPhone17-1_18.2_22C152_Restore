@interface MCServerSideHacks
+ (id)mergeArray:(id)a3 withArray:(id)a4;
+ (id)sharedHacks;
+ (void)setAllowHacksToCallExternalComponents:(BOOL)a3;
- (BOOL)_anyBoolRestrictionChangedInSet:(id)a3 oldRestrictions:(id)a4 newRestrictions:(id)a5;
- (BOOL)applyEffectiveSettings:(id)a3 toSettings:(id)a4 withOldRestrictions:(id)a5 newRestrictions:(id)a6;
- (id)recomputeAccountVPNAssociations;
- (void)_applyServerSideChangesWithOldRestrictions:(id)a3 newRestrictions:(id)a4 oldEffectiveUserSettings:(id)a5 newEffectiveUserSettings:(id)a6;
- (void)applyEffectiveSettings:(id)a3 toOtherSubsystemsPasscode:(id)a4 credentialSet:(id)a5;
- (void)applyGracePeriodSettingFromKeybagToUserSettings;
- (void)recomputeAppOptionsEffectiveUserSettings:(id)a3 outEffectiveChangeDetected:(BOOL *)a4;
- (void)recomputeAppRulesForNetworkExtension;
- (void)recomputeHacksAfterProfileChangesEffectiveUserSettings:(id)a3 sendNotifications:(BOOL)a4;
- (void)recomputeWebContentFilterEffectiveUserSettings:(id)a3 outEffectiveChangeDetected:(BOOL *)a4 outMechanismChangedDetected:(BOOL *)a5;
- (void)resetSettingsSender:(id)a3;
- (void)setUserTrackingTCCAccessOverrideForRestrictions:(id)a3;
@end

@implementation MCServerSideHacks

+ (void)setAllowHacksToCallExternalComponents:(BOOL)a3
{
  BOOL v3 = a3;
  byte_1001057E0 = a3;
  id v4 = +[MCActivationUtilities sharedInstance];
  [v4 setIsReady:v3];
}

+ (id)sharedHacks
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MCServerSideHacks;
  v2 = [super sharedHacks];

  return v2;
}

- (BOOL)_anyBoolRestrictionChangedInSet:(id)a3 oldRestrictions:(id)a4 newRestrictions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v10);
        }
        if (+[MCRestrictionManagerWriter restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManagerWriter, "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:", *(void *)(*((void *)&v15 + 1) + 8 * i), v8, v9, (void)v15))
        {
          LOBYTE(v11) = 1;
          goto LABEL_11;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v11;
}

- (void)_applyServerSideChangesWithOldRestrictions:(id)a3 newRestrictions:(id)a4 oldEffectiveUserSettings:(id)a5 newEffectiveUserSettings:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!byte_1001057E0)
  {
    v29 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Not calling out to external components.", buf, 2u);
    }
    goto LABEL_72;
  }
  if (+[MCRestrictionManager BOOLSetting:MCFeatureEncryptedBackupRequired valueChangedBetweenOldSettings:v11 andNewSettings:v12])[(MCServerSideHacks *)self _setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings:v12]; {
  uint64_t v13 = MCFeatureAppInstallationAllowed;
  }
  if (+[MCRestrictionManager BOOLSetting:MCFeatureAppInstallationAllowed valueChangedBetweenOldSettings:v11 andNewSettings:v12])
  {
    BOOL v14 = +[MCRestrictionManager BOOLSettingForFeature:v13 withUserSettingDictionary:v12] != 2;
    long long v15 = MCLockdownOperationQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008F5F4;
    block[3] = &unk_1000EC420;
    BOOL v79 = v14;
    dispatch_async(v15, block);
  }
  uint64_t v16 = MCFeatureAppRemovalAllowed;
  if (+[MCRestrictionManager BOOLSetting:MCFeatureAppRemovalAllowed valueChangedBetweenOldSettings:v11 andNewSettings:v12])
  {
    BOOL v17 = +[MCRestrictionManager BOOLSettingForFeature:v16 withUserSettingDictionary:v12] != 2;
    long long v18 = MCLockdownOperationQueue();
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_10008F67C;
    v76[3] = &unk_1000EC420;
    BOOL v77 = v17;
    dispatch_async(v18, v76);
  }
  uint64_t v19 = MCFeatureHostPairingAllowed;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureHostPairingAllowed, v11, v12)&& +[MCRestrictionManager BOOLSettingForFeature:v19 withUserSettingDictionary:v12] == 2)
  {
    v20 = MCLockdownOperationQueue();
    dispatch_async(v20, &stru_1000EC440);
  }
  if (+[MCRestrictionManager unionValuesSetting:MCFeatureTrustedCodeSigningIdentities valueChangedBetweenOldSettings:v11 andNewSettings:v12])
  {
    v21 = +[MCProvisioningProfileJanitor sharedJanitor];
    [v21 updateMISTrust];
  }
  uint64_t v22 = MCFeatureAllowGlobalBackgroundFetchWhenRoaming;
  if (+[MCRestrictionManager BOOLSetting:MCFeatureAllowGlobalBackgroundFetchWhenRoaming valueChangedBetweenOldSettings:v11 andNewSettings:v12])
  {
    +[MCRestrictionManager BOOLSettingForFeature:v22 withUserSettingDictionary:v12];
    PCSettingsSetGlobalMCCForceManualWhenRoaming();
  }
  uint64_t v23 = MCFeatureAssistantAllowed;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureAssistantAllowed, v11, v12)&& +[MCRestrictionManager BOOLSettingForFeature:v23 withUserSettingDictionary:v12] == 2)
  {
    CFPreferencesSetAppValue(@"Assistant Enabled", kCFBooleanFalse, @"com.apple.assistant.support");
    CFPreferencesAppSynchronize(@"com.apple.assistant.support");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kAFPreferencesDidChangeDarwinNotification", 0, 0, 1u);
  }
  uint64_t v25 = MCFeatureFIPSVerificationForced;
  if (+[MCRestrictionManager BOOLSetting:MCFeatureFIPSVerificationForced valueChangedBetweenOldSettings:v11 andNewSettings:v12])
  {
    if (+[MCRestrictionManager BOOLSettingForFeature:v25 withUserSettingDictionary:v12] == 1)
    {
      v26 = +[NSData data];
      [v26 writeToFile:@"/var/mobile/Library/Preferences/enable_fips_mode" atomically:0];

      v27 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v28 = "Turning on FIPS verification.";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
      }
    }
    else
    {
      v30 = +[NSFileManager defaultManager];
      [v30 removeItemAtPath:@"/var/mobile/Library/Preferences/enable_fips_mode" error:0];

      v27 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v28 = "Turning off FIPS verification.";
        goto LABEL_26;
      }
    }
  }
  uint64_t v31 = MCFeatureDiagnosticsSubmissionAllowed;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureDiagnosticsSubmissionAllowed, v11, v12)&& +[MCRestrictionManager BOOLSettingForFeature:v31 withUserSettingDictionary:v11])
  {
    v32 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v32, @"com.apple.OTACrashCopier.SubmissionPreferenceChanged", 0, 0, 1u);
  }
  uint64_t v33 = MCFeatureCloudKeychainSyncAllowed;
  if (!+[MCRestrictionManager restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:", MCFeatureCloudKeychainSyncAllowed, v9, v10)|| +[MCRestrictionManager restrictedBoolForFeature:v33 withRestrictionsDictionary:v10] != 2)
  {
    goto LABEL_39;
  }
  id v34 = v12;
  v35 = objc_opt_new();
  id v36 = [objc_alloc((Class)OTClique) initWithContextData:v35];
  id v75 = 0;
  unsigned __int8 v37 = [v36 setUserControllableViewsSyncStatus:0 error:&v75];
  id v38 = v75;
  os_log_t v39 = _MCLogObjects[0];
  if (v37)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v40 = "Disabled keychain sync.";
      v41 = v39;
      os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
      uint32_t v43 = 2;
LABEL_37:
      _os_log_impl((void *)&_mh_execute_header, v41, v42, v40, buf, v43);
    }
  }
  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v83 = v38;
    v40 = "Unable to leave clique to disable keychain sync. Error: %{public}@";
    v41 = v39;
    os_log_type_t v42 = OS_LOG_TYPE_ERROR;
    uint32_t v43 = 12;
    goto LABEL_37;
  }

  id v12 = v34;
LABEL_39:
  uint64_t v69 = MCFeaturePhotoStreamAllowed;
  uint64_t v70 = MCFeatureCloudPhotoLibraryAllowed;
  v81[0] = MCFeatureCloudPhotoLibraryAllowed;
  v81[1] = MCFeaturePhotoStreamAllowed;
  uint64_t v67 = MCFeatureCloudBackupAllowed;
  uint64_t v68 = MCFeatureSharedStreamAllowed;
  v81[2] = MCFeatureSharedStreamAllowed;
  v81[3] = MCFeatureCloudBackupAllowed;
  uint64_t v44 = MCFeatureCloudDocumentSyncAllowed;
  v81[4] = MCFeatureCloudDocumentSyncAllowed;
  v45 = +[NSArray arrayWithObjects:v81 count:5];
  v46 = +[NSSet setWithArray:v45];
  unsigned int v47 = [(MCServerSideHacks *)self _anyBoolRestrictionChangedInSet:v46 oldRestrictions:v9 newRestrictions:v10];

  if (!v47) {
    goto LABEL_68;
  }
  id v57 = v12;
  id v58 = v11;
  id v59 = v9;
  +[ACAccountStore defaultStore];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v62 = long long v74 = 0u;
  [v62 aa_appleAccounts];
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v48 = [obj countByEnumeratingWithState:&v71 objects:v80 count:16];
  if (!v48) {
    goto LABEL_67;
  }
  id v49 = v48;
  uint64_t v50 = *(void *)v72;
  uint64_t v51 = kAccountDataclassCloudPhotos;
  uint64_t v66 = kAccountDataclassMediaStream;
  uint64_t v65 = kAccountDataclassSharedStreams;
  uint64_t v64 = kAccountDataclassBackup;
  uint64_t v63 = kAccountDataclassUbiquity;
  uint64_t v52 = kAccountDataclassKeyValue;
  uint64_t v53 = kAccountDataclassCloudPhotos;
  do
  {
    for (i = 0; i != v49; i = (char *)i + 1)
    {
      if (*(void *)v72 != v50) {
        objc_enumerationMutation(obj);
      }
      v55 = *(void **)(*((void *)&v71 + 1) + 8 * i);
      if (+[MCRestrictionManagerWriter restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManagerWriter, "restrictedBoolForFeature:withRestrictionsDictionary:", v70, v10) == 2&& [v55 isEnabledForDataclass:v51])
      {
        [v55 setEnabled:0 forDataclass:v51];
        int v56 = 1;
      }
      else
      {
        int v56 = 0;
      }
      if (+[MCRestrictionManagerWriter restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManagerWriter, "restrictedBoolForFeature:withRestrictionsDictionary:", v69, v10) == 2&& [v55 isEnabledForDataclass:v66])
      {
        [v55 setEnabled:0 forDataclass:v66];
        int v56 = 1;
      }
      if (+[MCRestrictionManagerWriter restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManagerWriter, "restrictedBoolForFeature:withRestrictionsDictionary:", v68, v10) == 2&& [v55 isEnabledForDataclass:v65])
      {
        [v55 setEnabled:0 forDataclass:v65];
        int v56 = 1;
      }
      if (+[MCRestrictionManagerWriter restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManagerWriter, "restrictedBoolForFeature:withRestrictionsDictionary:", v67, v10) == 2&& [v55 isEnabledForDataclass:v64])
      {
        [v55 setEnabled:0 forDataclass:v64];
        int v56 = 1;
      }
      if (+[MCRestrictionManagerWriter restrictedBoolForFeature:v44 withRestrictionsDictionary:v10] != 2)goto LABEL_63; {
      if ([v55 isEnabledForDataclass:v63])
      }
      {
        [v55 setEnabled:0 forDataclass:v63];
        int v56 = 1;
      }
      if ([v55 isEnabledForDataclass:v52])
      {
        [v55 setEnabled:0 forDataclass:v52];
      }
      else
      {
LABEL_63:
        if (!v56) {
          goto LABEL_65;
        }
      }
      [v62 saveAccount:v55 withDataclassActions:0 doVerify:0 completion:&stru_1000EC460];
LABEL_65:
      uint64_t v51 = v53;
    }
    id v49 = [obj countByEnumeratingWithState:&v71 objects:v80 count:16];
  }
  while (v49);
LABEL_67:

  id v11 = v58;
  id v9 = v59;
  id v12 = v57;
LABEL_68:
  if (+[MCRestrictionManagerWriter BOOLSetting:MCFeatureVehicleUIAllowed valueChangedBetweenOldSettings:v11 andNewSettings:v12])CRHandleCarPlayRestrictionChanged(); {
  if (+[MCRestrictionManager restrictedBool:MCFeatureLimitAdTrackingForced changedBetweenOldRestrictions:v9 andNewRestrictions:v10])[(MCServerSideHacks *)self setUserTrackingTCCAccessOverrideForRestrictions:v10];
  }
LABEL_72:
}

- (void)applyEffectiveSettings:(id)a3 toOtherSubsystemsPasscode:(id)a4 credentialSet:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (byte_1001057E0)
  {
    uint64_t v69 = v9;
    if (+[MCRestrictionManager BOOLSettingForFeature:MCFeatureAutomaticDateAndTimeForced withUserSettingDictionary:v7] == 1)
    {
      TMSetAutomaticTimeZoneEnabled();
      TMSetAutomaticTimeEnabled();
    }
    if (MCGestaltHasSEP())
    {
      id v11 = +[MCRestrictionManager sharedManager];
      id v12 = [v11 memberQueueRestrictions];

      uint64_t v13 = +[MCRestrictionManager valueForFeature:MCFeatureMaximumFailedPasscodeAttempts withRestrictionsDictionary:v12];
      id v14 = [v13 unsignedIntegerValue];

      if (v14 != (id)MCKeybagCurrentMaximumFailedPasscodeAttempts())
      {
        long long v15 = MCKeybagSetMaximumFailedPasscodeAttempts();
        if (v15)
        {
          uint64_t v16 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v92 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to set maximum failed passcode attempts. Error: %{public}@", buf, 0xCu);
          }
        }
      }
    }
    uint64_t v17 = MCFeaturePasscodeLockGraceTime;
    long long v18 = +[MCRestrictionManager valueSettingForFeature:MCFeaturePasscodeLockGraceTime withUserSettingDictionary:v7];
    id v19 = [v18 unsignedLongValue];

    uint64_t v20 = MCKeybagCurrentPasscodeGracePeriod();
    if (v19 != (id)v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = MCKeybagSetPasscodeGracePeriod();
      if (v22)
      {
        uint64_t v23 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v92 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to set grace period. Error: %{public}@", buf, 0xCu);
        }
        uint64_t v89 = MCRestrictedValueKey;
        uint64_t v87 = v17;
        uint64_t v85 = MCRestrictedValueValueKey;
        v24 = +[NSNumber numberWithUnsignedInteger:v21];
        v86 = v24;
        uint64_t v25 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
        v88 = v25;
        v26 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
        v90 = v26;
        v27 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];

        [v7 MCDeepCopyEntriesFromDictionary:v27];
      }
    }
    if (_os_feature_enabled_impl()
      && +[MCRestrictionManager BOOLSettingForFeature:MCFeaturePasscodeRecoveryAllowed withUserSettingDictionary:v7] == 2&& MCKeybagMementoBlobExists())
    {
      v28 = +[MCPasscodeManagerWriter sharedManager];
      v29 = [v28 clearRecoveryPasscode];

      if (v29)
      {
        v30 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v92 = v29;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to clear recovery passcode. Error: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:4];
      }
    }
    id v71 = 0;
    id v72 = 0;
    BOOL v32 = sub_10005414C(&v72, &v71);
    id v33 = v72;
    id v34 = v71;
    uint64_t v70 = v8;
    if (v32)
    {
      uint64_t v35 = MCFeatureFingerprintUnlockAllowed;
      unsigned int v36 = +[MCRestrictionManager BOOLSettingForFeature:MCFeatureFingerprintUnlockAllowed withUserSettingDictionary:v7];
      if (!v33 || (unsigned int v37 = v36, (v36 != 2) == [v33 BOOLValue]))
      {
        uint64_t v38 = 0;
      }
      else
      {
        uint64_t v38 = +[NSNumber numberWithBool:v37 != 2];
      }
      uint64_t v40 = MCFeatureFingerprintForContactlessPaymentAllowed;
      unsigned int v41 = +[MCRestrictionManager BOOLSettingForFeature:MCFeatureFingerprintForContactlessPaymentAllowed withUserSettingDictionary:v7];
      if (!v34 || (unsigned int v42 = v41, (v41 != 2) == [v34 BOOLValue]))
      {
        uint64_t v43 = 0;
      }
      else
      {
        uint64_t v43 = +[NSNumber numberWithBool:v42 != 2];
      }
      if (v38 | v43)
      {
        uint64_t v44 = sub_100054230((void *)v38, (void *)v43, v70, v69);
        if (v44)
        {
          if (v38)
          {
            uint64_t v83 = MCRestrictedBoolKey;
            id v80 = v33;
            uint64_t v81 = v35;
            uint64_t v79 = MCRestrictedBoolValueKey;
            uint64_t v68 = v44;
            v45 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
            v82 = v45;
            v46 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
            v84 = v46;
            unsigned int v47 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];

            [v7 MCDeepCopyEntriesFromDictionary:v47];
            uint64_t v44 = v68;
          }
          if (v43)
          {
            uint64_t v77 = MCRestrictedBoolKey;
            id v74 = v34;
            uint64_t v75 = v40;
            uint64_t v73 = MCRestrictedBoolValueKey;
            id v48 = v44;
            id v49 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
            v76 = v49;
            uint64_t v50 = +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
            v78 = v50;
            uint64_t v51 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];

            [v7 MCDeepCopyEntriesFromDictionary:v51];
            uint64_t v44 = v48;
          }
        }
      }
    }
    else
    {
      os_log_t v39 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Fingerprint unlock state is currently not available. Ignoring.", buf, 2u);
      }
    }
    if (+[MCRestrictionManager BOOLSettingForFeature:MCFeatureWifiPowerOnEnforced withUserSettingDictionary:v7] == 1)
    {
      uint64_t v52 = WiFiManagerClientCreate();
      if (v52)
      {
        uint64_t v53 = (const void *)v52;
        CFRunLoopGetCurrent();
        WiFiManagerClientScheduleWithRunLoop();
        if (!WiFiManagerClientGetPower()) {
          WiFiManagerClientSetPower();
        }
        CFRunLoopGetCurrent();
        WiFiManagerClientUnscheduleFromRunLoop();
        CFRelease(v53);
      }
    }
    v54 = +[MCRestrictionManager valueSettingForFeature:MCFeatureSafariAcceptCookies withUserSettingDictionary:v7];
    v55 = v54;
    int v56 = (id *)&kMCSafariCookieAcceptPolicyExclusivelyFromMainDocumentDomain;
    if (v54)
    {
      [v54 floatValue];
      if (v57 >= 2.0)
      {
        int v56 = (id *)&kMCSafariCookieAcceptPolicyAlways;
        uint64_t v58 = 3;
      }
      else if (v57 >= 1.5)
      {
        int v56 = (id *)&kMCSafariCookieAcceptPolicyOnlyFromMainDocumentDomain;
        uint64_t v58 = 2;
      }
      else
      {
        uint64_t v58 = v57 >= 1.0;
        if (v57 < 1.0) {
          int v56 = (id *)&kMCSafariCookieAcceptPolicyNever;
        }
      }
    }
    else
    {
      uint64_t v58 = 1;
    }
    id v59 = *v56;
    v60 = (void *)CFPreferencesCopyAppValue(@"CookieAcceptPolicy", @"com.apple.WebUI");
    if ((MCEqualStrings() & 1) == 0)
    {
      CFPreferencesSetAppValue(@"CookieAcceptPolicy", v59, @"com.apple.WebUI");
      CFPreferencesAppSynchronize(@"com.apple.WebUI");
      v61 = +[NSHTTPCookieStorage sharedHTTPCookieStorage];
      [v61 setCookieAcceptPolicy:v58];

      MCSendSafariCookiePolicyChangedNotification();
    }

    +[MCRestrictionManager BOOLSettingForFeature:MCFeatureEnterpriseBookBackupAllowed withUserSettingDictionary:v7];
    v62 = +[NSFileManager defaultManager];
    uint64_t v63 = MDMManagedNonStoreBooksDirectory();
    unsigned int v64 = [v62 fileExistsAtPath:v63];

    if (v64)
    {
      uint64_t v65 = MDMManagedNonStoreBooksDirectory();
      char v66 = MCSetSkipBackupAttributeToItemAtPath();

      if ((v66 & 1) == 0)
      {
        uint64_t v67 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "Failed to set backup exclusion on managed books directory", buf, 2u);
        }
      }
    }

    id v10 = v69;
    id v8 = v70;
  }
  else
  {
    uint64_t v31 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Not calling out to external components.", buf, 2u);
    }
  }
}

- (BOOL)applyEffectiveSettings:(id)a3 toSettings:(id)a4 withOldRestrictions:(id)a5 newRestrictions:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = MCFeaturePasscodeLockGraceTime;
  if (!+[MCRestrictionManager restrictedValue:MCFeaturePasscodeLockGraceTime changedBetweenOldRestrictions:a5 andNewRestrictions:a6])goto LABEL_3; {
  id v12 = +[MCRestrictionManager valueSettingForFeature:v11 withUserSettingDictionary:v9];
  }
  id v13 = [v12 unsignedLongValue];

  id v14 = +[MCRestrictionManager valueSettingForFeature:v11 withUserSettingDictionary:v10];
  id v15 = [v14 unsignedLongValue];

  if (v13 != v15)
  {
    uint64_t v26 = MCRestrictedValueKey;
    uint64_t v24 = v11;
    uint64_t v22 = MCRestrictedValueValueKey;
    uint64_t v17 = +[NSNumber numberWithUnsignedInteger:v13];
    uint64_t v23 = v17;
    BOOL v16 = 1;
    long long v18 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    uint64_t v25 = v18;
    id v19 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v27 = v19;
    uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];

    [v10 MCDeepCopyEntriesFromDictionary:v20];
  }
  else
  {
LABEL_3:
    BOOL v16 = 0;
  }

  return v16;
}

- (void)recomputeAppOptionsEffectiveUserSettings:(id)a3 outEffectiveChangeDetected:(BOOL *)a4
{
  id v80 = a3;
  objc_super v4 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Recomputing app options.", buf, 2u);
  }
  uint64_t v85 = +[MCManifest sharedManifest];
  v5 = [v85 allInstalledProfileIdentifiers];
  v6 = +[NSMutableDictionary dictionary];
  uint64_t v81 = +[NSMutableDictionary dictionary];
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v131 objects:v143 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v132;
    uint64_t v10 = kMCAppWhitelistIdentifierKey;
    uint64_t v82 = *(void *)v132;
    do
    {
      uint64_t v11 = 0;
      id v83 = v8;
      do
      {
        if (*(void *)v132 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v88 = v11;
        uint64_t v12 = *(void *)(*((void *)&v131 + 1) + 8 * v11);
        id v13 = [v85 installedProfileWithIdentifier:v12];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = +[NSMutableDictionary dictionary];
          long long v127 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          v86 = v13;
          id v101 = [v13 payloads];
          id v15 = [v101 countByEnumeratingWithState:&v127 objects:v142 count:16];
          if (v15)
          {
            id v16 = v15;
            id v17 = *(id *)v128;
            id v89 = *(id *)v128;
            v93 = v14;
            do
            {
              long long v18 = 0;
              id v97 = v16;
              do
              {
                if (*(id *)v128 != v17) {
                  objc_enumerationMutation(v101);
                }
                id v19 = *(void **)(*((void *)&v127 + 1) + 8 * (void)v18);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v20 = [v19 whitelistedAppsAndOptions];
                  if (v20)
                  {
                    uint64_t v21 = [v19 UUID];
                    [v14 setObject:v20 forKey:v21];

                    long long v125 = 0u;
                    long long v126 = 0u;
                    long long v123 = 0u;
                    long long v124 = 0u;
                    id v22 = v20;
                    id v23 = [v22 countByEnumeratingWithState:&v123 objects:v141 count:16];
                    if (v23)
                    {
                      id v24 = v23;
                      uint64_t v25 = *(void *)v124;
                      do
                      {
                        for (i = 0; i != v24; i = (char *)i + 1)
                        {
                          if (*(void *)v124 != v25) {
                            objc_enumerationMutation(v22);
                          }
                          v27 = *(void **)(*((void *)&v123 + 1) + 8 * i);
                          v28 = [v27 objectForKey:v10];
                          if (v28) {
                            [v6 setObject:v27 forKey:v28];
                          }
                        }
                        id v24 = [v22 countByEnumeratingWithState:&v123 objects:v141 count:16];
                      }
                      while (v24);
                    }

                    id v17 = v89;
                    id v14 = v93;
                    id v16 = v97;
                  }
                }
                long long v18 = (char *)v18 + 1;
              }
              while (v18 != v16);
              id v16 = [v101 countByEnumeratingWithState:&v127 objects:v142 count:16];
            }
            while (v16);
          }

          if ([v14 count])
          {
            v29 = [v86 identifier];
            [v81 setObject:v14 forKey:v29];
          }
          uint64_t v9 = v82;
          id v8 = v83;
          id v13 = v86;
        }

        uint64_t v11 = v88 + 1;
      }
      while ((id)(v88 + 1) != v8);
      id v8 = [obj countByEnumeratingWithState:&v131 objects:v143 count:16];
    }
    while (v8);
  }

  +[MCRestrictionManagerWriter sharedManager];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v102 = (id)objc_claimAutoreleasedReturnValue();
  id v90 = [v102 memberQueueUserClientRestrictions];
  id v98 = [v90 countByEnumeratingWithState:&v119 objects:v140 count:16];
  if (v98)
  {
    uint64_t v94 = *(void *)v120;
    uint64_t v30 = kMCAppWhitelistIdentifierKey;
    do
    {
      for (j = 0; j != v98; j = (char *)j + 1)
      {
        if (*(void *)v120 != v94) {
          objc_enumerationMutation(v90);
        }
        BOOL v32 = [v102 memberQueueAppsAndOptionsForClientUUID:*(void *)(*((void *)&v119 + 1) + 8 * (void)j)];
        id v33 = v32;
        if (v32)
        {
          long long v117 = 0u;
          long long v118 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          id v34 = [v32 countByEnumeratingWithState:&v115 objects:v139 count:16];
          if (v34)
          {
            id v35 = v34;
            uint64_t v36 = *(void *)v116;
            do
            {
              for (k = 0; k != v35; k = (char *)k + 1)
              {
                if (*(void *)v116 != v36) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v38 = *(void **)(*((void *)&v115 + 1) + 8 * (void)k);
                os_log_t v39 = [v38 objectForKey:v30];
                if (v39)
                {
                  uint64_t v40 = [v6 objectForKeyedSubscript:v39];

                  if (!v40) {
                    [v6 setObject:v38 forKey:v39];
                  }
                }
              }
              id v35 = [v33 countByEnumeratingWithState:&v115 objects:v139 count:16];
            }
            while (v35);
          }
        }
      }
      id v98 = [v90 countByEnumeratingWithState:&v119 objects:v140 count:16];
    }
    while (v98);
  }

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v91 = [v102 memberQueueSystemClientRestrictions];
  id v99 = [v91 countByEnumeratingWithState:&v111 objects:v138 count:16];
  if (v99)
  {
    uint64_t v95 = *(void *)v112;
    uint64_t v41 = kMCAppWhitelistIdentifierKey;
    do
    {
      for (m = 0; m != v99; m = (char *)m + 1)
      {
        if (*(void *)v112 != v95) {
          objc_enumerationMutation(v91);
        }
        uint64_t v43 = [v102 memberQueueAppsAndOptionsForClientUUID:*(void *)(*((void *)&v111 + 1) + 8 * (void)m)];
        uint64_t v44 = v43;
        if (v43)
        {
          long long v109 = 0u;
          long long v110 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          id v45 = [v43 countByEnumeratingWithState:&v107 objects:v137 count:16];
          if (v45)
          {
            id v46 = v45;
            uint64_t v47 = *(void *)v108;
            do
            {
              for (n = 0; n != v46; n = (char *)n + 1)
              {
                if (*(void *)v108 != v47) {
                  objc_enumerationMutation(v44);
                }
                id v49 = *(void **)(*((void *)&v107 + 1) + 8 * (void)n);
                uint64_t v50 = [v49 objectForKey:v41];
                if (v50)
                {
                  uint64_t v51 = [v6 objectForKeyedSubscript:v50];

                  if (!v51) {
                    [v6 setObject:v49 forKey:v50];
                  }
                }
              }
              id v46 = [v44 countByEnumeratingWithState:&v107 objects:v137 count:16];
            }
            while (v46);
          }
        }
      }
      id v99 = [v91 countByEnumeratingWithState:&v111 objects:v138 count:16];
    }
    while (v99);
  }

  uint64_t v52 = +[NSFileManager defaultManager];
  id v53 = [v6 count];
  v54 = MCSystemAppOptionsByBundleIDFilePath();
  v55 = v81;
  if (v53) {
    [v6 writeToFile:v54 atomically:1];
  }
  else {
    [v52 removeItemAtPath:v54 error:0];
  }

  id v56 = [v81 count];
  float v57 = MCSystemAppWhitelistByProfileFilePath();
  if (v56)
  {
    [v81 writeToFile:v57 atomically:1];
  }
  else
  {
    [v52 removeItemAtPath:v57 error:0];

    float v57 = MCSystemEffectiveAppWhitelistFilePath();
    [v52 removeItemAtPath:v57 error:0];
  }

  uint64_t v58 = MCSystemEffectiveAppWhitelistFilePath();
  id v59 = +[NSData dataWithContentsOfFile:v58];

  if (v59)
  {
    v60 = +[NSPropertyListSerialization MCSafePropertyListWithData:v59 options:0 format:0 error:0];
  }
  else
  {
    v60 = 0;
  }
  if ([v6 count])
  {
    v61 = +[MCRestrictionManager intersectedValuesSettingForFeature:MCFeatureAppLockBundleIDs withUserSettingDectionary:v80];
    if ([v61 count])
    {
      id v92 = v60;
      v96 = v59;
      v100 = v52;
      v62 = +[NSSet setWithArray:v61];
      uint64_t v63 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v61 count]);
      long long v103 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v64 = v6;
      id v65 = [v64 countByEnumeratingWithState:&v103 objects:v136 count:16];
      if (v65)
      {
        id v66 = v65;
        uint64_t v67 = *(void *)v104;
        do
        {
          for (ii = 0; ii != v66; ii = (char *)ii + 1)
          {
            if (*(void *)v104 != v67) {
              objc_enumerationMutation(v64);
            }
            uint64_t v69 = *(void *)(*((void *)&v103 + 1) + 8 * (void)ii);
            uint64_t v70 = [v64 objectForKey:v69];
            if ([v62 containsObject:v69]) {
              [v63 addObject:v70];
            }
          }
          id v66 = [v64 countByEnumeratingWithState:&v103 objects:v136 count:16];
        }
        while (v66);
      }

      if ([v63 count])
      {
        id v71 = MCSystemEffectiveAppWhitelistFilePath();
        char v72 = 1;
        [v63 writeToFile:v71 atomically:1];

        v55 = v81;
        id v59 = v96;
        uint64_t v52 = v100;
        v60 = v92;
        goto LABEL_97;
      }

      v55 = v81;
      id v59 = v96;
      uint64_t v52 = v100;
      v60 = v92;
    }
    else
    {
      uint64_t v63 = 0;
    }
  }
  else
  {
    uint64_t v63 = 0;
  }
  v61 = MCSystemEffectiveAppWhitelistFilePath();
  [v52 removeItemAtPath:v61 error:0];
  char v72 = 0;
LABEL_97:

  if (v79)
  {
    char v73 = v72 ^ 1;
    if (!v60) {
      char v73 = 0;
    }
    if (v73) {
      goto LABEL_102;
    }
    id v74 = v60;
    uint64_t v75 = +[NSSet setWithArray:v60];
    v76 = +[NSSet setWithArray:v63];
    unsigned __int8 v77 = [v75 isEqualToSet:v76];

    v60 = v74;
    if ((v77 & 1) == 0) {
LABEL_102:
    }
      *uint64_t v79 = 1;
  }
}

- (void)recomputeAppRulesForNetworkExtension
{
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Recomputing app rules for NetworkExtension.", buf, 2u);
  }
  BOOL v3 = +[MDMManagedMediaReader attributesByAppID];
  objc_super v4 = [v3 allKeys];
  v5 = MCNEProfileIngestionHandlerClassForPayload();
  if ([v5 lockConfigurations])
  {
    [v5 loadConfigurationsForceReloadFromDisk];
    [v5 updatePerAppMappingRules:v3];
    [v5 updateManagedAppRules:v4];
    [v5 unlockConfigurations];
  }
  else
  {
    v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "recomputeAppRulesForNetworkExtension could not get NetworkExtension store lock.", v7, 2u);
    }
  }
}

- (id)recomputeAccountVPNAssociations
{
  uint64_t v43 = +[NSMutableDictionary dictionary];
  v2 = +[MCManifest sharedManifest];
  [v2 allInstalledProfileIdentifiers];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v51;
    p_data = &@"newPasscodeSimpleType".data;
    uint64_t v34 = *(void *)v51;
    id v35 = v2;
    do
    {
      id v7 = 0;
      id v36 = v4;
      do
      {
        if (*(void *)v51 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v50 + 1) + 8 * (void)v7);
        uint64_t v10 = [v2 installedProfileWithIdentifier:v8];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          os_log_t v39 = v9;
          uint64_t v40 = v7;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v38 = v10;
          id v44 = [v10 payloads];
          id v11 = [v44 countByEnumeratingWithState:&v46 objects:v54 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v47;
            uint64_t v41 = *(void *)v47;
            do
            {
              id v14 = 0;
              id v42 = v12;
              do
              {
                if (*(void *)v47 != v13) {
                  objc_enumerationMutation(v44);
                }
                id v15 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v14);
                if ([v15 conformsToProtocol:p_data[508]])
                {
                  id v16 = v15;
                  id v17 = [v16 VPNUUID];
                  if (v17)
                  {
                    if (objc_opt_respondsToSelector())
                    {
                      long long v18 = [v16 mailAccountIdentifiers];
                    }
                    else
                    {
                      long long v18 = 0;
                    }
                    if (objc_opt_respondsToSelector())
                    {
                      id v19 = [v16 contactsAccountIdentifiers];
                    }
                    else
                    {
                      id v19 = 0;
                    }
                    if (objc_opt_respondsToSelector())
                    {
                      uint64_t v20 = [v16 calendarAccountIdentifiers];
                    }
                    else
                    {
                      uint64_t v20 = 0;
                    }
                    if ([v18 count] || objc_msgSend(v19, "count") || objc_msgSend(v20, "count"))
                    {
                      uint64_t v21 = [v43 objectForKeyedSubscript:v17];
                      if (!v21)
                      {
                        uint64_t v21 = objc_opt_new();
                        [v43 setObject:v21 forKeyedSubscript:v17];
                      }
                      id v22 = [v21 mailAccountIdentifiers];
                      id v23 = +[MCServerSideHacks mergeArray:v22 withArray:v18];
                      [v21 setMailAccountIdentifiers:v23];

                      id v24 = [v21 contactsAccountIdentifiers];
                      uint64_t v25 = +[MCServerSideHacks mergeArray:v24 withArray:v19];
                      [v21 setContactsAccountIdentifiers:v25];

                      uint64_t v26 = [v21 calendarAccountIdentifiers];
                      v27 = +[MCServerSideHacks mergeArray:v26 withArray:v20];
                      [v21 setCalendarAccountIdentifiers:v27];

                      p_data = (char **)(@"newPasscodeSimpleType" + 16);
                      uint64_t v13 = v41;
                      id v12 = v42;
                    }
                  }
                }
                id v14 = (char *)v14 + 1;
              }
              while (v12 != v14);
              id v12 = [v44 countByEnumeratingWithState:&v46 objects:v54 count:16];
            }
            while (v12);
          }

          v2 = v35;
          id v4 = v36;
          uint64_t v5 = v34;
          uint64_t v9 = v39;
          id v7 = v40;
          uint64_t v10 = v38;
        }

        id v7 = (char *)v7 + 1;
      }
      while (v7 != v4);
      id v4 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v4);
  }

  v28 = MCNEProfileIngestionHandlerClassForPayload();
  [v28 loadConfigurationsForceReloadFromDisk];
  if ([v28 updateAccountIdentifiers:v43])
  {
    v29 = 0;
  }
  else
  {
    uint64_t v30 = MCVPNErrorDomain;
    uint64_t v31 = MCErrorArray();
    v29 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v30, 15004, v31, MCErrorTypeFatal, 0);

    BOOL v32 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "recomputeAccountVPNAssociations failed to update associations.", buf, 2u);
    }
  }

  return v29;
}

+ (id)mergeArray:(id)a3 withArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    if (v6)
    {
      uint64_t v8 = +[NSSet setWithArray:v5];
      uint64_t v9 = [v8 setByAddingObjectsFromArray:v7];
      uint64_t v10 = [v9 allObjects];

      goto LABEL_7;
    }
    id v11 = v5;
  }
  else
  {
    id v11 = v6;
  }
  uint64_t v10 = v11;
LABEL_7:

  return v10;
}

- (void)recomputeWebContentFilterEffectiveUserSettings:(id)a3 outEffectiveChangeDetected:(BOOL *)a4 outMechanismChangedDetected:(BOOL *)a5
{
  id v5 = a3;
  id v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Recomputing web content filter.", buf, 2u);
  }
  id v7 = +[NSFileManager defaultManager];
  uint64_t v8 = MCWebContentFilterOutputPath();
  long long v115 = v7;
  LODWORD(v7) = [v7 fileExistsAtPath:v8];

  if (v7)
  {
    uint64_t v9 = MCWebContentFilterOutputPath();
    long long v116 = +[NSDictionary dictionaryWithContentsOfFile:v9];
  }
  else
  {
    long long v116 = 0;
  }
  uint64_t v10 = +[NSMutableDictionary dictionary];
  id v11 = +[MCBookmarkManager sharedManager];
  id v12 = [v11 userBookmarks];

  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  id obj = v12;
  id v13 = [obj countByEnumeratingWithState:&v151 objects:v162 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v152;
    uint64_t v16 = kMCWCFAddressKey;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v152 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v18 = [*(id *)(*((void *)&v151 + 1) + 8 * i) serializableDictionary];
        id v19 = [v18 objectForKeyedSubscript:v16];
        if (v19) {
          [v10 setObject:v18 forKeyedSubscript:v19];
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v151 objects:v162 count:16];
    }
    while (v14);
  }
  id v117 = v5;

  uint64_t v20 = +[MCDependencyManager sharedManager];
  uint64_t v21 = [v20 parentsInDomain:kMCDMProfileWithWebContentFilterToPayloadUUIDDependencyKey];

  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v118 = v21;
  id v122 = [v118 countByEnumeratingWithState:&v147 objects:v161 count:16];
  char v22 = 0;
  if (v122)
  {
    uint64_t v120 = *(void *)v148;
    uint64_t v23 = kMCWCFAddressKey;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v148 != v120) {
          objc_enumerationMutation(v118);
        }
        uint64_t v126 = v24;
        uint64_t v25 = *(void *)(*((void *)&v147 + 1) + 8 * v24);
        uint64_t v26 = +[MCManifest sharedManifest];
        v27 = [v26 installedProfileWithIdentifier:v25];

        long long v145 = 0u;
        long long v146 = 0u;
        long long v143 = 0u;
        long long v144 = 0u;
        long long v124 = v27;
        id v133 = [v27 payloads];
        id v28 = [v133 countByEnumeratingWithState:&v143 objects:v160 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v144;
          uint64_t v128 = *(void *)v144;
          do
          {
            uint64_t v31 = 0;
            id v130 = v29;
            do
            {
              if (*(void *)v144 != v30) {
                objc_enumerationMutation(v133);
              }
              BOOL v32 = *(void **)(*((void *)&v143 + 1) + 8 * (void)v31);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v34 = [v32 allowListBookmarks];
                long long v139 = 0u;
                long long v140 = 0u;
                long long v141 = 0u;
                long long v142 = 0u;
                id v35 = [v34 countByEnumeratingWithState:&v139 objects:v159 count:16];
                if (v35)
                {
                  id v36 = v35;
                  uint64_t v37 = *(void *)v140;
                  do
                  {
                    for (j = 0; j != v36; j = (char *)j + 1)
                    {
                      if (*(void *)v140 != v37) {
                        objc_enumerationMutation(v34);
                      }
                      os_log_t v39 = *(void **)(*((void *)&v139 + 1) + 8 * (void)j);
                      uint64_t v40 = [v39 objectForKeyedSubscript:v23];
                      [v10 setObject:v39 forKeyedSubscript:v40];
                    }
                    id v36 = [v34 countByEnumeratingWithState:&v139 objects:v159 count:16];
                  }
                  while (v36);
                }

                char v22 = 1;
                uint64_t v30 = v128;
                id v29 = v130;
              }
              uint64_t v31 = (char *)v31 + 1;
            }
            while (v31 != v29);
            id v29 = [v133 countByEnumeratingWithState:&v143 objects:v160 count:16];
          }
          while (v29);
        }

        uint64_t v24 = v126 + 1;
      }
      while ((id)(v126 + 1) != v122);
      id v122 = [v118 countByEnumeratingWithState:&v147 objects:v161 count:16];
    }
    while (v122);
  }

  uint64_t v41 = +[MCRestrictionManager intersectedValuesSettingForFeature:MCFeatureWebContentFilterWhitelistedBookmarks withUserSettingDectionary:v117];
  uint64_t v131 = MCFeatureWebContentFilterWhitelistedURLs;
  id v42 = +[MCRestrictionManager intersectedValuesSettingForFeature:withUserSettingDectionary:](MCRestrictionManager, "intersectedValuesSettingForFeature:withUserSettingDectionary:");
  id v43 = [v42 count];
  id v134 = v41;
  if (v43 == [v41 count] && objc_msgSend(v42, "count"))
  {
    unint64_t v44 = 0;
    uint64_t v45 = kMCWCFAddressKey;
    uint64_t v46 = kMCWCFPageTitleKey;
    do
    {
      long long v47 = [v42 objectAtIndexedSubscript:v44];
      v158[0] = v47;
      v157[0] = v45;
      v157[1] = v46;
      long long v48 = [v41 objectAtIndexedSubscript:v44];
      v158[1] = v48;
      long long v49 = +[NSDictionary dictionaryWithObjects:v158 forKeys:v157 count:2];
      [v10 setObject:v49 forKeyedSubscript:v47];

      uint64_t v41 = v134;
      ++v44;
    }
    while (v44 < (unint64_t)[v42 count]);
  }
  long long v50 = +[NSMutableDictionary dictionary];
  [v50 setObject:&__kCFBooleanTrue forKeyedSubscript:@"restrictWeb"];
  if (!_os_feature_enabled_impl())
  {
    if ((v22 & 1) == 0)
    {
      v54 = objc_opt_new();
      v55 = [v54 webContent];
      id v56 = [v55 blockedByFilter];
      id v57 = [v56 policy];

      if (!v57) {
        goto LABEL_48;
      }
    }
    goto LABEL_47;
  }
  long long v51 = +[MOWebContentSettingsGroup blockedByFilterMetadata];
  long long v52 = [v51 responsibleClients];
  unsigned __int8 v53 = [v52 containsObject:@"com.apple.ScreenTime"];

  if ((v53 & 1) == 0) {
LABEL_47:
  }
    [v50 setObject:&__kCFBooleanTrue forKeyedSubscript:@"noOverridingAllowed"];
LABEL_48:
  id v58 = v117;
  unsigned int v59 = +[MCRestrictionManager BOOLSettingForFeature:MCFeatureWebContentFilterAutoForced withUserSettingDictionary:v117];
  v60 = +[NSNumber numberWithBool:v59 == 1];
  [v50 setObject:v60 forKeyedSubscript:@"useContentFilter"];

  uint64_t v61 = +[MCRestrictionManager intersectedValuesSettingForFeature:MCFeatureWebContentFilterAutoPermittedURLs withUserSettingDectionary:v117];
  long long v129 = (void *)v61;
  if (v61) {
    v62 = (void *)v61;
  }
  else {
    v62 = &__NSArray0__struct;
  }
  [v50 setObject:v62 forKeyedSubscript:@"filterWhitelist"];
  if (v42)
  {
    unsigned int v127 = v59;
    uint64_t v63 = +[MCRestrictionManager intersectedValuesSettingForFeature:v131 withUserSettingDectionary:v117];
    id v64 = +[NSSet setWithArray:v63];

    id v65 = [v10 allKeys];
    id v66 = +[NSMutableSet setWithArray:v65];

    [v66 intersectSet:v64];
    uint64_t v67 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v66 count]);
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    id v68 = v66;
    id v69 = [v68 countByEnumeratingWithState:&v135 objects:v156 count:16];
    if (v69)
    {
      id v70 = v69;
      uint64_t v71 = *(void *)v136;
      do
      {
        for (k = 0; k != v70; k = (char *)k + 1)
        {
          if (*(void *)v136 != v71) {
            objc_enumerationMutation(v68);
          }
          char v73 = [v10 objectForKeyedSubscript:*(void *)(*((void *)&v135 + 1) + 8 * (void)k)];
          [v67 addObject:v73];
        }
        id v70 = [v68 countByEnumeratingWithState:&v135 objects:v156 count:16];
      }
      while (v70);
    }

    [v50 setObject:v67 forKeyedSubscript:@"siteWhitelist"];
    id v58 = v117;
    unsigned int v59 = v127;
  }
  id v74 = +[NSNumber numberWithBool:v42 != 0];
  [v50 setObject:v74 forKeyedSubscript:@"whitelistEnabled"];

  uint64_t v75 = +[MCRestrictionManager unionValuesSettingForFeature:MCFeatureWebContentFilterBlacklistedURLs withUserSettingDictionary:v58];
  v76 = (void *)v75;
  if (v75) {
    unsigned __int8 v77 = (void *)v75;
  }
  else {
    unsigned __int8 v77 = &__NSArray0__struct;
  }
  id v78 = v77;

  [v50 setObject:v78 forKeyedSubscript:@"filterBlacklist"];
  long long v125 = v78;
  if (v129) {
    BOOL v79 = 1;
  }
  else {
    BOOL v79 = [v78 count] != 0;
  }
  uint64_t v80 = +[NSNumber numberWithBool:v79];
  [v50 setObject:v80 forKeyedSubscript:@"useContentFilterOverrides"];

  uint64_t v81 = [v116 objectForKeyedSubscript:@"whitelistEnabled"];
  LODWORD(v80) = (v42 != 0) ^ [(id)v81 BOOLValue];

  uint64_t v82 = [v116 objectForKeyedSubscript:@"useContentFilter"];
  LODWORD(v81) = (v59 == 1) ^ [v82 BOOLValue];

  char v112 = v80 | v81;
  if ((v80 | v81) == 1) {
    sub_100098DB8();
  }
  uint64_t v83 = [v50 objectForKeyedSubscript:@"filterWhitelist"];
  v84 = (void *)v83;
  if (v83) {
    uint64_t v85 = (void *)v83;
  }
  else {
    uint64_t v85 = &__NSArray0__struct;
  }
  id v132 = v85;

  uint64_t v86 = [v116 objectForKeyedSubscript:@"filterWhitelist"];
  uint64_t v87 = (void *)v86;
  if (v86) {
    uint64_t v88 = (void *)v86;
  }
  else {
    uint64_t v88 = &__NSArray0__struct;
  }
  id v89 = v88;

  uint64_t v90 = [v50 objectForKeyedSubscript:@"filterBlacklist"];
  id v91 = (void *)v90;
  if (v90) {
    id v92 = (void *)v90;
  }
  else {
    id v92 = &__NSArray0__struct;
  }
  v93 = v50;
  id v94 = v92;

  uint64_t v95 = [v116 objectForKeyedSubscript:@"filterBlacklist"];
  v96 = (void *)v95;
  if (v95) {
    id v97 = (void *)v95;
  }
  else {
    id v97 = &__NSArray0__struct;
  }
  id v98 = v97;

  long long v121 = v93;
  uint64_t v99 = [v93 objectForKeyedSubscript:@"siteWhitelist"];
  v100 = (void *)v99;
  if (v99) {
    id v101 = (void *)v99;
  }
  else {
    id v101 = &__NSArray0__struct;
  }
  id v102 = v101;

  uint64_t v103 = [v116 objectForKeyedSubscript:@"siteWhitelist"];
  long long v104 = (void *)v103;
  if (v103) {
    long long v105 = (void *)v103;
  }
  else {
    long long v105 = &__NSArray0__struct;
  }
  id v106 = v105;

  long long v123 = v89;
  char v107 = [v132 isEqualToArray:v89] ^ 1;
  char v108 = [v94 isEqualToArray:v98] ^ 1;
  unsigned int v109 = [v102 isEqualToArray:v106] ^ 1;
  long long v110 = v117;
  if ((v107 & 1) != 0 || (v108 & 1) != 0 || v109)
  {
    [v132 count];
    [v94 count];
    [v102 count];
    long long v110 = v117;
    sub_100098BA0();
  }
  if (a5) {
    *a5 = v112;
  }
  if (a4) {
    *a4 = [v116 isEqualToDictionary:v121] ^ 1;
  }
  long long v111 = MCWebContentFilterOutputPath();
  [v121 MCWriteToBinaryFile:v111];
}

- (void)recomputeHacksAfterProfileChangesEffectiveUserSettings:(id)a3 sendNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(MCServerSideHacks *)self recomputeAppRulesForNetworkExtension];
  char v10 = 0;
  [(MCServerSideHacks *)self recomputeAppOptionsEffectiveUserSettings:v6 outEffectiveChangeDetected:&v10];
  char v9 = 0;
  char v8 = 0;
  [(MCServerSideHacks *)self recomputeWebContentFilterEffectiveUserSettings:v6 outEffectiveChangeDetected:&v9 outMechanismChangedDetected:&v8];

  if (v4)
  {
    if (v10) {
      MCSendAppWhitelistChangedNotification();
    }
    if (v8) {
      MCSendWebContentFilterTypeChangedNotification();
    }
    if (v9) {
      MCSendWebContentFilterChangedNotification();
    }
  }
  if (v10)
  {
    id v7 = +[MDMClient sharedClient];
    [v7 retryNotNowResponse];
  }
}

- (void)applyGracePeriodSettingFromKeybagToUserSettings
{
  v2 = +[MCRestrictionManagerWriter sharedManager];
  uint64_t v3 = MCFeaturePasscodeLockGraceTime;
  BOOL v4 = [v2 valueSettingForFeature:MCFeaturePasscodeLockGraceTime];
  id v5 = [v4 unsignedIntegerValue];

  uint64_t v6 = MCKeybagCurrentPasscodeGracePeriod();
  if (v5 != (id)v6)
  {
    uint64_t v7 = v6;
    char v8 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting grace period to %u to match keybag value.", (uint8_t *)v10, 8u);
    }
    char v9 = +[NSNumber numberWithUnsignedInteger:v7];
    [v2 setValue:v9 forSetting:v3 sender:@"MCServerSideHacks.ApplyGracePeriodSettingFromKeybag"];
  }
}

- (void)resetSettingsSender:(id)a3
{
  id v3 = a3;
  id v4 = +[MCRestrictionManagerWriter sharedManager];
  [v4 setBoolValue:0 forSetting:MCFeatureDiagnosticsSubmissionAllowed sender:v3];
  [v4 setBoolValue:0 forSetting:MCFeatureAppAnalyticsAllowed sender:v3];
}

- (void)setUserTrackingTCCAccessOverrideForRestrictions:(id)a3
{
  BOOL v3 = +[MCRestrictionManager restrictedBoolForFeature:MCFeatureLimitAdTrackingForced withRestrictionsDictionary:a3] == 1;
  uint64_t v4 = kTCCServiceUserTracking;

  _TCCAccessSetOverride(v4, v3);
}

@end