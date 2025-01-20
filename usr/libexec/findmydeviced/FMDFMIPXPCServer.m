@interface FMDFMIPXPCServer
- (BOOL)_hasAuthAccessEntitlement;
- (BOOL)_hasClientAccessEntitlement;
- (BOOL)_hasRepairDeviceAccessEntitlement;
- (BOOL)_hasUCRTHealingAccessEntitlement;
- (FMNanoIDSManager)protectedIDSManager;
- (id)_deviceIdentifiersForSignature;
- (id)_errorForCode:(int)a3 message:(id)a4;
- (id)locateStats;
- (void)_forceFMWUpgradeAlertUsingCallback:(id)a3;
- (void)_forceUpgradeAlertForKey:(id)a3 UsingCallback:(id)a4;
- (void)activationLockAuthInfoWithCompletion:(id)a3;
- (void)activationLockInfoFromDeviceWithCompletion:(id)a3;
- (void)activationLockVersionWithCompletion:(id)a3;
- (void)attemptUCRTHealing:(id)a3 completion:(id)a4;
- (void)clearData:(unint64_t)a3 completion:(id)a4;
- (void)clearMaskedAppleIDWithCompletion:(id)a3;
- (void)clearOfflineFindingInfoWithCompletion:(id)a3;
- (void)deviceActivationDidSucceedUsingCallback:(id)a3;
- (void)deviceEligibleForRepairWithContext:(id)a3 completion:(id)a4;
- (void)didAddLocalFindableAccessory:(id)a3 completion:(id)a4;
- (void)didChangeFMIPAccountInfo:(id)a3 usingCallback:(id)a4;
- (void)didReceiveLostModeExitAuthToken:(id)a3 usingCallback:(id)a4;
- (void)didRemoveLocalFindableAccessory:(id)a3 completion:(id)a4;
- (void)disableFMIPForAccount:(id)a3 pairedDeviceWithUDID:(id)a4 usingCallback:(id)a5;
- (void)disableFMIPUsingToken:(id)a3 forPairedDeviceWithUDID:(id)a4 usingCallback:(id)a5;
- (void)disableFMIPUsingToken:(id)a3 inContext:(unint64_t)a4 usingCallback:(id)a5;
- (void)disableLocationDisplayWithCompletion:(id)a3;
- (void)disableLostModeUsingCallback:(id)a3;
- (void)enableActivationLockUsingCallback:(id)a3;
- (void)enableFMIPInContext:(unint64_t)a3 usingCallback:(id)a4;
- (void)enableLostModeWithInfo:(id)a3 usingCallback:(id)a4;
- (void)enableRepairWithContext:(id)a3 completion:(id)a4;
- (void)fetchAPNSTokenWithCompletion:(id)a3;
- (void)fetchAccessoryConfigurations:(id)a3;
- (void)fetchOfflineFindingInfoWithCompletion:(id)a3;
- (void)getAccessoriesWithCompletion:(id)a3;
- (void)getConnectedAccessoriesDiscoveryIds:(id)a3;
- (void)getFMIPStateUsingCallback:(id)a3;
- (void)getFmipAccountUsingCallback:(id)a3;
- (void)getLockdownShouldDisableDevicePairingUsingCallback:(id)a3;
- (void)getLockdownShouldDisableDeviceRestoreUsingCallback:(id)a3;
- (void)initiateLostModeExitAuthForApp:(id)a3 idsDeviceID:(id)a4 usingCallback:(id)a5;
- (void)isActivationLockAllowedUsingCallback:(id)a3;
- (void)isActivationLockEnabledUsingCallback:(id)a3;
- (void)isActivationLockedUsingCallback:(id)a3;
- (void)lowBatteryLocateEnabledUsingCallback:(id)a3;
- (void)markAsMissingSupportedForPairedDeviceWithUDID:(id)a3 usingCallback:(id)a4;
- (void)markPairedDeviceWithUDID:(id)a3 asMissingUsingToken:(id)a4 callback:(id)a5;
- (void)pairingCheckWith:(id)a3 completion:(id)a4;
- (void)playSoundWithOptions:(id)a3 completion:(id)a4;
- (void)registerDeviceForPairingLock:(id)a3 completion:(id)a4;
- (void)removeAccessoryWithDiscoveryId:(id)a3 completion:(id)a4;
- (void)requireDisableLocationWithCompletion:(id)a3;
- (void)scheduleDailyLocateReportXPCActivity;
- (void)sendPairedDeviceLostModeExitAuthToken:(id)a3 deviceID:(id)a4;
- (void)setDailyLocateReportEnabled:(BOOL)a3;
- (void)setLowBatteryLocateEnabled:(BOOL)a3 usingCallback:(id)a4;
- (void)setPhoneNumber:(id)a3 toAccessoryWithDiscoveryId:(id)a4 completion:(id)a5;
- (void)setProtectedIDSManager:(id)a3;
- (void)showDailyLocateReport;
- (void)signatureHeadersWithData:(id)a3 completion:(id)a4;
- (void)soundStoppedForAccessoryIdentifier:(id)a3;
- (void)startLocationMonitoring:(id)a3;
- (void)startLocationMonitoringWithContext:(id)a3 completion:(id)a4;
- (void)startLocationMonitoringWithContext:(id)a3 forcePublish:(BOOL)a4 completion:(id)a5;
- (void)stopLocationMonitoring:(id)a3;
- (void)stopLocationMonitoringWithContext:(id)a3 completion:(id)a4;
- (void)storeOfflineFindingInfo:(id)a3 completion:(id)a4;
- (void)updateMaskedAppleIDWith:(id)a3 completion:(id)a4;
- (void)updatePairingLockInfo:(id)a3 completion:(id)a4;
- (void)updatedConfigReceived:(id)a3 completion:(id)a4;
@end

@implementation FMDFMIPXPCServer

- (void)getConnectedAccessoriesDiscoveryIds:(id)a3
{
  v5 = (void (**)(id, id, void))a3;
  v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[FMDFMIPXPCServer getConnectedAccessoriesDiscoveryIds:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    v7 = +[FMDServiceProvider activeServiceProvider];
    v8 = [v7 accessoryRegistry];
    v9 = [v8 allAccessories];
    id v10 = objc_alloc_init((Class)NSMutableArray);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([v16 connectionState] == (id)1)
          {
            v17 = [v16 address];
            [v10 addObject:v17];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    v5[2](v5, v10, 0);
    goto LABEL_18;
  }
  v18 = NSStringFromSelector(a2);
  v7 = +[NSString stringWithFormat:@"Entitlement not found for %@", v18];

  v19 = sub_100004238();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10023ECE0();
  }

  if (v5)
  {
    v8 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v7];
    ((void (**)(id, id, void *))v5)[2](v5, 0, v8);
LABEL_18:
  }
}

- (BOOL)_hasClientAccessEntitlement
{
  v2 = +[NSXPCConnection currentConnection];
  v3 = [v2 valueForEntitlement:@"com.apple.aosnotification.aosnotifyd-access"];

  v4 = +[NSXPCConnection currentConnection];
  v5 = [v4 valueForEntitlement:@"com.apple.icloud.findmydeviced.access"];

  if (v3 && ([&__kCFBooleanTrue isEqual:v3] & 1) != 0)
  {
    unsigned __int8 v6 = 1;
  }
  else if (v5)
  {
    unsigned __int8 v6 = [&__kCFBooleanTrue isEqual:v5];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)getFMIPStateUsingCallback:(id)a3
{
  v5 = (void (**)(id, id, void))a3;
  unsigned __int8 v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[FMDFMIPXPCServer getFMIPStateUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    v7 = +[FMDServiceProvider activeServiceProvider];
    v8 = (char *)[v7 fmipState];

    v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Returning FMIP state : %ld", buf, 0xCu);
    }

    if (v5) {
      v5[2](v5, v8, 0);
    }
  }
  else
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = +[NSString stringWithFormat:@"Entitlement not found for %@", v10];

    id v12 = sub_100004238();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v5)
    {
      id v13 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v11];
      ((void (**)(id, id, void *))v5)[2](v5, (id)4, v13);
    }
  }
}

- (void)setProtectedIDSManager:(id)a3
{
}

- (void)enableLostModeWithInfo:(id)a3 usingCallback:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, void *))a4;
  v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v57 = "-[FMDFMIPXPCServer enableLostModeWithInfo:usingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (![(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    v25 = NSStringFromSelector(a2);
    v26 = +[NSString stringWithFormat:@"Entitlement not found for %@", v25];

    v27 = sub_100004238();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v8)
    {
      v28 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v26];
      v8[2](v8, v28);
    }
    goto LABEL_24;
  }
  if ([v7 lostModeEnabled])
  {
    id v10 = +[FMDSystemConfig sharedInstance];
    unsigned __int8 v11 = [v10 isPasscodeSet];

    if (v11)
    {
      id v12 = +[FMDLostModeManager sharedInstance];
      unsigned int v13 = [v12 lostModeEnabled];

      if (!v13)
      {
        v55[0] = &__kCFBooleanTrue;
        v54[0] = @"lostModeEnabled";
        v54[1] = @"lostModeMessage";
        uint64_t v45 = [v7 message];
        v46 = (void *)v45;
        if (v45) {
          CFStringRef v47 = (const __CFString *)v45;
        }
        else {
          CFStringRef v47 = &stru_1002E7428;
        }
        v55[1] = v47;
        v54[2] = @"lostModeOwnerNumber";
        uint64_t v48 = [v7 phoneNumber];
        v49 = (void *)v48;
        if (v48) {
          CFStringRef v50 = (const __CFString *)v48;
        }
        else {
          CFStringRef v50 = &stru_1002E7428;
        }
        v55[2] = v50;
        v54[3] = @"lostModeFacetimeCapable";
        v51 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 facetimeCapable]);
        v55[3] = v51;
        v26 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:4];

        +[FMDPreferencesMgr setClientLostModeInfo:v26];
        v52 = +[FMDFMIPSharedStateManager sharedInstance];
        [v52 recalculateLostMode];

        SBSSpringBoardServerPort();
        SBLockDevice();
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, kLostModeChangedNotification, 0, 0, 1u);
        if (v8) {
          v8[2](v8, 0);
        }
        goto LABEL_24;
      }
      uint64_t v14 = sub_100004238();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1002408CC(v14, v15, v16, v17, v18, v19, v20, v21);
      }

      if (v8)
      {
        CFStringRef v22 = @"Device is already in FMIP lost mode.";
        long long v23 = self;
        uint64_t v24 = 8;
LABEL_23:
        v26 = [(FMDFMIPXPCServer *)v23 _errorForCode:v24 message:v22];
        v8[2](v8, v26);
LABEL_24:
      }
    }
    else
    {
      v37 = sub_100004238();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_100240944(v37, v38, v39, v40, v41, v42, v43, v44);
      }

      if (v8)
      {
        CFStringRef v22 = @"Passcode is not set. Cannot enable lost mode.";
        long long v23 = self;
        uint64_t v24 = 7;
        goto LABEL_23;
      }
    }
  }
  else
  {
    v29 = sub_100004238();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1002409BC(v29, v30, v31, v32, v33, v34, v35, v36);
    }

    if (v8)
    {
      CFStringRef v22 = @"You have passed in lostModeEnabled as NO. This is invalid";
      long long v23 = self;
      uint64_t v24 = 1;
      goto LABEL_23;
    }
  }
}

- (void)disableLostModeUsingCallback:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  unsigned __int8 v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v23 = "-[FMDFMIPXPCServer disableLostModeUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (![(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    unsigned __int8 v11 = NSStringFromSelector(a2);
    id v12 = +[NSString stringWithFormat:@"Entitlement not found for %@", v11];

    unsigned int v13 = sub_100004238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v5)
    {
      uint64_t v14 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v12];
      v5[2](v5, v14);
    }
    goto LABEL_20;
  }
  id v7 = +[FMDSystemConfig sharedInstance];
  unsigned int v8 = [v7 isLocked];

  if (v8)
  {
    v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100240A34();
    }

    if (v5)
    {
      CFStringRef v10 = @"Keybag is still locked. Cannot disable lost mode";
LABEL_19:
      id v12 = [(FMDFMIPXPCServer *)self _errorForCode:9 message:v10];
      v5[2](v5, v12);
LABEL_20:
    }
  }
  else
  {
    uint64_t v15 = +[FMDFMIPManager sharedInstance];
    uint64_t v16 = [v15 lostModeInfo];
    id v17 = [v16 lostModeType];

    if (v17 != (id)5 && v17 != (id)3)
    {
      +[FMDPreferencesMgr setClientLostModeInfo:0];
      uint64_t v19 = +[FMDFMIPSharedStateManager sharedInstance];
      [v19 recalculateLostMode];

      uint64_t v20 = +[FMDServiceProvider activeServiceProvider];
      id v12 = [v20 locationTracker];

      [v12 deleteLocationTrackingInfoAndStopTracking];
      uint64_t v21 = +[FMDLostModeManager sharedInstance];
      [v21 disableLostMode];

      if (v5) {
        v5[2](v5, 0);
      }
      goto LABEL_20;
    }
    uint64_t v18 = sub_100004238();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100240A68();
    }

    if (v5)
    {
      CFStringRef v10 = @"Device is in managed lost mode. Cannot disable lost mode";
      goto LABEL_19;
    }
  }
}

- (void)deviceActivationDidSucceedUsingCallback:(id)a3
{
  v5 = (void (**)(id, void))a3;
  unsigned __int8 v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[FMDFMIPXPCServer deviceActivationDidSucceedUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    +[FMDPreferencesMgr setFMIPWipeLostModeInfo:0];
    if (v5) {
      v5[2](v5, 0);
    }
  }
  else
  {
    id v7 = NSStringFromSelector(a2);
    unsigned int v8 = +[NSString stringWithFormat:@"Entitlement not found for %@", v7];

    v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v5)
    {
      CFStringRef v10 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v8];
      ((void (**)(id, void *))v5)[2](v5, v10);
    }
  }
}

- (void)getLockdownShouldDisableDeviceRestoreUsingCallback:(id)a3
{
  v5 = (void (**)(id, BOOL, void))a3;
  unsigned __int8 v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v13 = "-[FMDFMIPXPCServer getLockdownShouldDisableDeviceRestoreUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v7 = +[FMDAppleAccountManager sharedInstance];
    unsigned int v8 = [v7 fmipACAccount];

    if (v5) {
      v5[2](v5, v8 != 0, 0);
    }
  }
  else
  {
    v9 = NSStringFromSelector(a2);
    unsigned int v8 = +[NSString stringWithFormat:@"Entitlement not found for %@", v9];

    CFStringRef v10 = sub_100004238();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v5)
    {
      unsigned __int8 v11 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v8];
      ((void (**)(id, BOOL, void *))v5)[2](v5, 0, v11);
    }
  }
}

- (void)getLockdownShouldDisableDevicePairingUsingCallback:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "-[FMDFMIPXPCServer getLockdownShouldDisableDevicePairingUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    +[FMPreferencesUtil synchronizeDomain:kFMDPostWipePrefDomain];
    id v7 = +[FMPreferencesUtil dictionaryForKey:@"FMIPWipeLostModeInfo" inDomain:kFMDPostWipePrefDomain];
    if (v7)
    {
      if (v5) {
        (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
      }
      goto LABEL_21;
    }
    +[FMPreferencesUtil synchronizeDomain:kFMDPublicNotBackedUpPrefDomain];
    unsigned __int8 v11 = +[FMPreferencesUtil dictionaryForKey:@"FMIPLostModeInfo" inDomain:kFMDPublicNotBackedUpPrefDomain];
    CFStringRef v10 = v11;
    if (v11
      && ([v11 objectForKeyedSubscript:@"lostModeEnabled"],
          id v12 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v13 = [v12 BOOLValue],
          v12,
          (v13 & 1) != 0))
    {
      uint64_t v14 = 1;
      if (!v5) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v15 = +[FMPreferencesUtil dictionaryForKey:@"ClientLostModeInfo" inDomain:kFMDPublicNotBackedUpPrefDomain];
      uint64_t v16 = v15;
      if (v15)
      {
        id v17 = [v15 objectForKeyedSubscript:@"lostModeEnabled"];
        uint64_t v14 = (uint64_t)[v17 BOOLValue];
      }
      else
      {
        uint64_t v14 = 0;
      }

      if (!v5) {
        goto LABEL_20;
      }
    }
    (*((void (**)(id, uint64_t, void))v5 + 2))(v5, v14, 0);
LABEL_20:

    goto LABEL_21;
  }
  unsigned int v8 = NSStringFromSelector(a2);
  id v7 = +[NSString stringWithFormat:@"Entitlement not found for %@", v8];

  v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10023ECE0();
  }

  if (v5)
  {
    CFStringRef v10 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v7];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v10);
    goto LABEL_20;
  }
LABEL_21:
}

- (void)getFmipAccountUsingCallback:(id)a3
{
  id v5 = (void (**)(id, void *, void *, void))a3;
  unsigned __int8 v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v14 = "-[FMDFMIPXPCServer getFmipAccountUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v7 = +[FMDAppleAccountManager sharedInstance];
    unsigned int v8 = [v7 fmipACAccount];

    if (v5)
    {
      v9 = [v8 username];
      CFStringRef v10 = [v8 aa_personID];
      v5[2](v5, v9, v10, 0);

LABEL_10:
    }
  }
  else
  {
    unsigned __int8 v11 = NSStringFromSelector(a2);
    unsigned int v8 = +[NSString stringWithFormat:@"Entitlement not found for %@", v11];

    id v12 = sub_100004238();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v5)
    {
      v9 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v8];
      ((void (**)(id, void *, void *, void *))v5)[2](v5, 0, 0, v9);
      goto LABEL_10;
    }
  }
}

- (void)didChangeFMIPAccountInfo:(id)a3 usingCallback:(id)a4
{
  id v7 = a3;
  unsigned int v8 = (void (**)(id, void))a4;
  v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[FMDFMIPXPCServer didChangeFMIPAccountInfo:usingCallback:]";
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s with changeDesc %@", buf, 0x16u);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    CFStringRef v10 = +[FMDAppleAccountManager sharedInstance];
    [v10 syncFMIPAccountInfo];

    if (v8) {
      v8[2](v8, 0);
    }
  }
  else
  {
    unsigned __int8 v11 = NSStringFromSelector(a2);
    id v12 = +[NSString stringWithFormat:@"Entitlement not found for %@", v11];

    unsigned __int8 v13 = sub_100004238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v8)
    {
      uint64_t v14 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v12];
      ((void (**)(id, void *))v8)[2](v8, v14);
    }
  }
}

- (void)enableFMIPInContext:(unint64_t)a3 usingCallback:(id)a4
{
  id v7 = (void (**)(id, void))a4;
  unsigned int v8 = sub_100004238();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v31 = "-[FMDFMIPXPCServer enableFMIPInContext:usingCallback:]";
    __int16 v32 = 2048;
    unint64_t v33 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s in context %lu", buf, 0x16u);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    v9 = +[FMDAppleAccountManager sharedInstance];
    CFStringRef v10 = [v9 iCloudACAccount];

    if (v10)
    {
      uint64_t v11 = kAccountDataclassDeviceLocator;
      if ([v10 isProvisionedForDataclass:kAccountDataclassDeviceLocator])
      {
        id v12 = +[FMDServiceProvider activeServiceProvider];
        unsigned __int8 v13 = [v12 account];

        if (v13
          && (objc_msgSend(v10, "aa_personID"),
              uint64_t v14 = objc_claimAutoreleasedReturnValue(),
              [v13 dsid],
              uint64_t v15 = objc_claimAutoreleasedReturnValue(),
              unsigned int v16 = [v14 isEqualToString:v15],
              v15,
              v14,
              v16))
        {
          [v13 applyPropertiesFromACAccount:v10];
          __int16 v17 = +[FMDServiceProvider activeServiceProvider];
          [(FMDFMIPAccount *)v17 updateAccount:v13];
        }
        else
        {
          __int16 v17 = objc_alloc_init(FMDFMIPAccount);
          [(FMDFMIPAccount *)v17 applyPropertiesFromACAccount:v10];
          [(FMDFMIPAccount *)v17 setFmipEnableContext:a3];
          v26 = +[NSDate date];
          [(FMDAccount *)v17 setAccountAddTime:v26];

          v27 = [v13 dsid];
          [(FMDFMIPAccount *)v17 setLastLoggedInDsid:v27];

          v28 = +[FMDServiceProvider activeServiceProvider];
          [v28 addAccount:v17];
        }
        v29 = +[FMIPConfig sharedInstance];
        [v29 enableFMIPLocationServices];

        if (v7) {
          v7[2](v7, 0);
        }
        goto LABEL_25;
      }
      long long v23 = [v10 aa_personID];
      unsigned __int8 v13 = +[NSString stringWithFormat:@"The account %@ is not provisioned for %@", v23, v11];

      uint64_t v24 = sub_100004238();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10023ECE0();
      }

      if (!v7) {
        goto LABEL_25;
      }
      uint64_t v21 = self;
      uint64_t v22 = 9;
    }
    else
    {
      unsigned __int8 v13 = +[NSString stringWithFormat:@"No iCloud account found to enableFMIP"];
      uint64_t v20 = sub_100004238();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10023ECE0();
      }

      if (!v7) {
        goto LABEL_25;
      }
      uint64_t v21 = self;
      uint64_t v22 = 5;
    }
    v25 = [(FMDFMIPXPCServer *)v21 _errorForCode:v22 message:v13];
    ((void (**)(id, void *))v7)[2](v7, v25);

LABEL_25:
    goto LABEL_26;
  }
  id v18 = NSStringFromSelector(a2);
  CFStringRef v10 = +[NSString stringWithFormat:@"Entitlement not found for %@", v18];

  uint64_t v19 = sub_100004238();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10023ECE0();
  }

  if (v7)
  {
    unsigned __int8 v13 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v10];
    ((void (**)(id, void *))v7)[2](v7, v13);
    goto LABEL_25;
  }
LABEL_26:
}

- (void)disableFMIPUsingToken:(id)a3 inContext:(unint64_t)a4 usingCallback:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = sub_100004238();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = "non-nil";
    v51 = "-[FMDFMIPXPCServer disableFMIPUsingToken:inContext:usingCallback:]";
    *(_DWORD *)buf = 136315650;
    if (!v9) {
      id v12 = "nil";
    }
    __int16 v52 = 2048;
    unint64_t v53 = a4;
    __int16 v54 = 2080;
    v55 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s in context %lu with %s token", buf, 0x20u);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    unsigned __int8 v13 = +[FMDSystemConfig sharedInstance];
    unsigned __int8 v14 = [v13 isBuddyDone];

    if (v14)
    {
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10007C5F4;
      v46[3] = &unk_1002DC028;
      id v47 = v9;
      unint64_t v49 = a4;
      id v15 = v10;
      id v48 = v15;
      unsigned int v16 = objc_retainBlock(v46);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10007C770;
      v44[3] = &unk_1002D97B0;
      v44[4] = self;
      id v45 = v15;
      __int16 v17 = objc_retainBlock(v44);
      if (!+[FMDRatchetManager isFeatureEnabled])
      {
        v27 = sub_100059CA0();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Ratchet not enabled. Allowing disable FMIP.", buf, 2u);
        }

        ((void (*)(void *))v16[2])(v16);
        goto LABEL_28;
      }
      if (a4 == 4)
      {
        id v18 = +[FMDOwnerAuthenticationManager ownerAuthenticationManagerEraseAllContentsAndSettings];
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_10007C87C;
        v38[3] = &unk_1002DA130;
        uint64_t v39 = v16;
        [v18 setPermittedOperationBlock:v38];
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_10007C88C;
        v36[3] = &unk_1002DA130;
        v37 = v17;
        [v18 setDeniedOperationBlock:v36];
        [v18 evaluateOperation];

        uint64_t v19 = v39;
      }
      else
      {
        if (a4 != 2)
        {
          v28 = sub_100059CA0();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v51 = (const char *)a4;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Checking ratchet for the context: %lu.", buf, 0xCu);
          }

          v29 = +[FMDRatchetManager ratchetManagerTurnOffFMIP];
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_10007C89C;
          v33[3] = &unk_1002DC050;
          unint64_t v35 = a4;
          uint64_t v34 = v16;
          [v29 setPermittedOperationBlock:v33];
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_10007C954;
          v30[3] = &unk_1002DC050;
          unint64_t v32 = a4;
          uint64_t v31 = v17;
          [v29 setDeniedOperationBlock:v30];
          [v29 evaluateOperation];

          goto LABEL_28;
        }
        id v18 = +[FMDRatchetManager ratchetManageriCloudSignOut];
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_10007C85C;
        v42[3] = &unk_1002DA130;
        uint64_t v43 = v16;
        [v18 setPermittedOperationBlock:v42];
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_10007C86C;
        v40[3] = &unk_1002DA130;
        uint64_t v41 = v17;
        [v18 setDeniedOperationBlock:v40];
        [v18 evaluateOperation];

        uint64_t v19 = v43;
      }

LABEL_28:
      uint64_t v21 = v47;
      goto LABEL_29;
    }
    uint64_t v21 = +[NSString stringWithFormat:@"FMIP account cannot be removed till buddy is complete"];
    v25 = sub_100004238();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v10)
    {
      long long v23 = self;
      uint64_t v24 = 9;
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v20 = NSStringFromSelector(a2);
    uint64_t v21 = +[NSString stringWithFormat:@"Entitlement not found for %@", v20];

    uint64_t v22 = sub_100004238();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v10)
    {
      long long v23 = self;
      uint64_t v24 = 6;
LABEL_19:
      v26 = [(FMDFMIPXPCServer *)v23 _errorForCode:v24 message:v21];
      (*((void (**)(id, void *))v10 + 2))(v10, v26);
    }
  }
LABEL_29:
}

- (void)disableFMIPUsingToken:(id)a3 forPairedDeviceWithUDID:(id)a4 usingCallback:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = sub_100004238();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v13 = "non-nil";
    v28 = "-[FMDFMIPXPCServer disableFMIPUsingToken:forPairedDeviceWithUDID:usingCallback:]";
    *(_DWORD *)buf = 136315650;
    if (!v9) {
      unsigned __int8 v13 = "nil";
    }
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2080;
    unint64_t v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s for udid %@ with %s token", buf, 0x20u);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    unsigned __int8 v14 = +[FMDSystemConfig sharedInstance];
    unsigned __int8 v15 = [v14 isBuddyDone];

    if (v15)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007CCD8;
      block[3] = &unk_1002DA158;
      id v24 = v9;
      id v25 = v10;
      id v26 = v11;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      unsigned int v16 = v24;
      goto LABEL_17;
    }
    unsigned int v16 = +[NSString stringWithFormat:@"FMIP account cannot be removed till buddy is complete"];
    uint64_t v21 = sub_100004238();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v11)
    {
      uint64_t v19 = self;
      uint64_t v20 = 9;
      goto LABEL_16;
    }
  }
  else
  {
    __int16 v17 = NSStringFromSelector(a2);
    unsigned int v16 = +[NSString stringWithFormat:@"Entitlement not found for %@", v17];

    id v18 = sub_100004238();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v11)
    {
      uint64_t v19 = self;
      uint64_t v20 = 6;
LABEL_16:
      uint64_t v22 = [(FMDFMIPXPCServer *)v19 _errorForCode:v20 message:v16];
      (*((void (**)(id, void *))v11 + 2))(v11, v22);
    }
  }
LABEL_17:
}

- (void)disableFMIPForAccount:(id)a3 pairedDeviceWithUDID:(id)a4 usingCallback:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = sub_100004238();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v13 = "non-nil";
    v28 = "-[FMDFMIPXPCServer disableFMIPForAccount:pairedDeviceWithUDID:usingCallback:]";
    *(_DWORD *)buf = 136315650;
    if (!v9) {
      unsigned __int8 v13 = "nil";
    }
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2080;
    unint64_t v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s for udid %@ with %s account", buf, 0x20u);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    unsigned __int8 v14 = +[FMDSystemConfig sharedInstance];
    unsigned __int8 v15 = [v14 isBuddyDone];

    if (v15)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007D01C;
      block[3] = &unk_1002DA158;
      id v24 = v9;
      id v25 = v10;
      id v26 = v11;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      unsigned int v16 = v24;
      goto LABEL_17;
    }
    unsigned int v16 = +[NSString stringWithFormat:@"FMIP account cannot be removed till buddy is complete"];
    uint64_t v21 = sub_100004238();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v11)
    {
      uint64_t v19 = self;
      uint64_t v20 = 9;
      goto LABEL_16;
    }
  }
  else
  {
    __int16 v17 = NSStringFromSelector(a2);
    unsigned int v16 = +[NSString stringWithFormat:@"Entitlement not found for %@", v17];

    id v18 = sub_100004238();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v11)
    {
      uint64_t v19 = self;
      uint64_t v20 = 6;
LABEL_16:
      uint64_t v22 = [(FMDFMIPXPCServer *)v19 _errorForCode:v20 message:v16];
      (*((void (**)(id, void *))v11 + 2))(v11, v22);
    }
  }
LABEL_17:
}

- (void)markAsMissingSupportedForPairedDeviceWithUDID:(id)a3 usingCallback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v43 = "-[FMDFMIPXPCServer markAsMissingSupportedForPairedDeviceWithUDID:usingCallback:]";
    __int16 v44 = 2112;
    id v45 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s for udid %@", buf, 0x16u);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    __int16 v31 = (void (**)(void, void, void))v8;
    id v10 = +[NRPairedDeviceRegistry sharedInstance];
    id v11 = [v10 getPairedDevices];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v36;
      uint64_t v16 = NRDevicePropertyIsPaired;
      uint64_t v17 = NRDevicePropertyUDID;
LABEL_6:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void **)(*((void *)&v35 + 1) + 8 * v18);
        uint64_t v20 = [v19 valueForProperty:v16];
        unsigned int v21 = [v20 BOOLValue];

        if (v7)
        {
          if (v21)
          {
            uint64_t v22 = [v19 valueForProperty:v17];
            unsigned __int8 v23 = [v7 isEqualToString:v22];

            if (v23) {
              break;
            }
          }
        }
        if (v14 == (id)++v18)
        {
          id v14 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
          if (v14) {
            goto LABEL_6;
          }
          goto LABEL_14;
        }
      }
      id v27 = v19;

      if (!v27) {
        goto LABEL_21;
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007D61C;
      block[3] = &unk_1002DA108;
      id v33 = v27;
      id v8 = v31;
      uint64_t v34 = v31;
      id v26 = v27;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      v28 = v33;
      goto LABEL_25;
    }
LABEL_14:

LABEL_21:
    __int16 v29 = sub_100004238();
    id v8 = v31;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10023EDB0();
    }

    if (v31)
    {
      uint64_t v30 = kFMDErrorDomain;
      NSErrorUserInfoKey v39 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v40 = @"No paired device with this UDID";
      id v26 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      v28 = +[NSError errorWithDomain:v30 code:1 userInfo:v26];
      ((void (**)(void, void, void *))v31)[2](v31, 0, v28);
LABEL_25:

      goto LABEL_26;
    }
  }
  else
  {
    id v24 = NSStringFromSelector(a2);
    id v12 = +[NSString stringWithFormat:@"Entitlement not found for %@", v24];

    id v25 = sub_100004238();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v8)
    {
      id v26 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v12];
      (*((void (**)(id, void, id))v8 + 2))(v8, 0, v26);
LABEL_26:
    }
  }
}

- (void)markPairedDeviceWithUDID:(id)a3 asMissingUsingToken:(id)a4 callback:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = sub_100004238();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = "non-nil";
    unsigned __int8 v23 = "-[FMDFMIPXPCServer markPairedDeviceWithUDID:asMissingUsingToken:callback:]";
    *(_DWORD *)buf = 136315650;
    if (!v10) {
      id v13 = "nil";
    }
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2080;
    id v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s for udid %@ with %s token", buf, 0x20u);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007DAB0;
    block[3] = &unk_1002DA158;
    id v19 = v9;
    id v20 = v10;
    id v21 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    id v14 = v19;
  }
  else
  {
    uint64_t v15 = NSStringFromSelector(a2);
    id v14 = +[NSString stringWithFormat:@"Entitlement not found for %@", v15];

    uint64_t v16 = sub_100004238();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v11)
    {
      uint64_t v17 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v14];
      (*((void (**)(id, void *))v11 + 2))(v11, v17);
    }
  }
}

- (void)isActivationLockAllowedUsingCallback:(id)a3
{
  id v5 = (void (**)(id, id, void))a3;
  unsigned __int8 v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[FMDFMIPXPCServer isActivationLockAllowedUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v7 = +[FMDSystemConfig sharedInstance];
    id v8 = [v7 allowsActivationLock];

    if (v5) {
      v5[2](v5, v8, 0);
    }
  }
  else
  {
    id v9 = NSStringFromSelector(a2);
    id v10 = +[NSString stringWithFormat:@"Entitlement not found for %@", v9];

    id v11 = sub_100004238();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v5)
    {
      id v12 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v10];
      ((void (**)(id, id, void *))v5)[2](v5, 0, v12);
    }
  }
}

- (void)isActivationLockEnabledUsingCallback:(id)a3
{
  id v5 = (void (**)(id, id, void))a3;
  unsigned __int8 v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "-[FMDFMIPXPCServer isActivationLockEnabledUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v7 = +[FMDServiceProvider activeServiceProvider];
    id v8 = [v7 fmipState];

    if ((unint64_t)v8 <= 2)
    {
      id v9 = +[FMDSystemConfig sharedInstance];
      id v10 = [v9 allowsActivationLock];

      if (!v5) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    id v10 = 0;
    if (v5) {
LABEL_13:
    }
      v5[2](v5, v10, 0);
  }
  else
  {
    id v11 = NSStringFromSelector(a2);
    id v12 = +[NSString stringWithFormat:@"Entitlement not found for %@", v11];

    id v13 = sub_100004238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v5)
    {
      id v14 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v12];
      ((void (**)(id, id, void *))v5)[2](v5, 0, v14);
    }
  }
LABEL_14:
}

- (void)isActivationLockedUsingCallback:(id)a3
{
  id v5 = (void (**)(id, id, void))a3;
  unsigned __int8 v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[FMDFMIPXPCServer isActivationLockedUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v7 = +[FMDServiceProvider activeServiceProvider];
    id v8 = [v7 isActivationLocked];
    if (v5) {
      v5[2](v5, v8, 0);
    }
  }
  else
  {
    id v9 = NSStringFromSelector(a2);
    id v7 = +[NSString stringWithFormat:@"Entitlement not found for %@", v9];

    id v10 = sub_100004238();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v5)
    {
      id v11 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v7];
      ((void (**)(id, id, void *))v5)[2](v5, 0, v11);
    }
  }
}

- (void)enableActivationLockUsingCallback:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  unsigned __int8 v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v24 = "-[FMDFMIPXPCServer enableActivationLockUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if (![(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v10 = NSStringFromSelector(a2);
    id v9 = +[NSString stringWithFormat:@"Entitlement not found for %@", v10];

    id v11 = sub_100004238();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v5)
    {
      id v12 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v9];
      v5[2](v5, v12);
    }
    goto LABEL_14;
  }
  id v7 = +[FMDSystemConfig sharedInstance];
  unsigned __int8 v8 = [v7 allowsActivationLock];

  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007E2BC;
    block[3] = &unk_1002DA130;
    uint64_t v22 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v9 = v22;
LABEL_14:

    goto LABEL_15;
  }
  id v13 = sub_100004238();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100240A9C(v13, v14, v15, v16, v17, v18, v19, v20);
  }

  if (v5)
  {
    id v9 = [(FMDFMIPXPCServer *)self _errorForCode:9 message:@"Activation lock is not allowed for this device"];
    v5[2](v5, v9);
    goto LABEL_14;
  }
LABEL_15:
}

- (void)activationLockVersionWithCompletion:(id)a3
{
  if (a3)
  {
    uint64_t v3 = kFMDNotBackedUpPrefDomain;
    v4 = (void (**)(id, id, void))a3;
    v4[2](v4, +[FMPreferencesUtil integerForKey:@"identityVersion" inDomain:v3], 0);
  }
}

- (void)didReceiveLostModeExitAuthToken:(id)a3 usingCallback:(id)a4
{
  id v7 = a3;
  unsigned __int8 v8 = (void (**)(id, uint64_t))a4;
  id v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v21 = "-[FMDFMIPXPCServer didReceiveLostModeExitAuthToken:usingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v10 = +[FMDAppleAccountManager sharedInstance];
    id v11 = [v10 fmipACAccount];

    if (v11)
    {
      id v12 = +[FMDPreferencesMgr lostModeExitAuthForPairedDeviceID];
      if (v12)
      {
        +[FMDPreferencesMgr setLostModeExitAuthForPairedDeviceID:0];
        [(FMDFMIPXPCServer *)self sendPairedDeviceLostModeExitAuthToken:v7 deviceID:v12];
        if (!v8) {
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v19 = +[FMDServiceProvider activeServiceProvider];
        [v19 sendLostModeExitAuthWithToken:v7];

        if (!v8)
        {
LABEL_18:

          goto LABEL_19;
        }
      }
      uint64_t v18 = 0;
LABEL_17:
      v8[2](v8, v18);
      goto LABEL_18;
    }
    if (v8)
    {
      CFStringRef v17 = @"FMIP account not found";
      uint64_t v15 = self;
      uint64_t v16 = 5;
      goto LABEL_14;
    }
  }
  else
  {
    id v13 = NSStringFromSelector(a2);
    id v11 = +[NSString stringWithFormat:@"Entitlement not found for %@", v13];

    uint64_t v14 = sub_100004238();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v8)
    {
      uint64_t v15 = self;
      uint64_t v16 = 6;
      CFStringRef v17 = v11;
LABEL_14:
      uint64_t v18 = [(FMDFMIPXPCServer *)v15 _errorForCode:v16 message:v17];
      id v12 = (void *)v18;
      goto LABEL_17;
    }
  }
LABEL_19:
}

- (void)initiateLostModeExitAuthForApp:(id)a3 idsDeviceID:(id)a4 usingCallback:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = sub_100004238();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "-[FMDFMIPXPCServer initiateLostModeExitAuthForApp:idsDeviceID:usingCallback:]";
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s for bundleID %@, idsDeviceID %@", buf, 0x20u);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v13 = +[FMDAppleAccountManager sharedInstance];
    uint64_t v14 = [v13 fmipACAccount];

    if (!v11 || v14)
    {
      if (v10)
      {
        +[FMDPreferencesMgr setLostModeExitAuthForPairedDeviceID:v10];
        uint64_t v18 = @"FMW_RENEW_CREDENTIALS_APPLE_PAY";
      }
      else
      {
        uint64_t v18 = @"FMIP_RENEW_CREDENTIALS_APPLE_PAY";
      }
      uint64_t v19 = +[FMDServiceProvider activeServiceProvider];
      uint64_t v15 = [v19 account];

      uint64_t v20 = [(__CFString *)v18 fmd_localizedString];
      id v21 = [v15 username];
      uint64_t v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v21);

      +[FMDPreferencesMgr setNeedsLostModeExitAuth:1];
      objc_initWeak((id *)buf, self);
      unsigned __int8 v23 = +[FMDAppleAccountManager sharedInstance];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10007EA14;
      v24[3] = &unk_1002DC078;
      objc_copyWeak(&v26, (id *)buf);
      id v25 = v11;
      [v23 forceUserAuthForiCloudAccountForApp:v9 message:v22 really:1 withCompletion:v24];

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v15 = [(FMDFMIPXPCServer *)self _errorForCode:5 message:@"FMIP account not found"];
      (*((void (**)(id, void *))v11 + 2))(v11, v15);
    }
    goto LABEL_15;
  }
  uint64_t v16 = NSStringFromSelector(a2);
  uint64_t v14 = +[NSString stringWithFormat:@"Entitlement not found for %@", v16];

  CFStringRef v17 = sub_100004238();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_10023ECE0();
  }

  if (v11)
  {
    uint64_t v15 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v14];
    (*((void (**)(id, void *))v11 + 2))(v11, v15);
LABEL_15:
  }
}

- (void)lowBatteryLocateEnabledUsingCallback:(id)a3
{
  id v5 = (void (**)(id, id, void))a3;
  unsigned __int8 v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v14 = "-[FMDFMIPXPCServer lowBatteryLocateEnabledUsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v7 = +[FMDServiceProvider activeServiceProvider];
    unsigned __int8 v8 = [v7 account];

    id v9 = [v8 lowBatteryLocateEnabled];
    if (v5) {
      v5[2](v5, v9, 0);
    }
  }
  else
  {
    id v10 = NSStringFromSelector(a2);
    unsigned __int8 v8 = +[NSString stringWithFormat:@"Entitlement not found for %@", v10];

    id v11 = sub_100004238();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v5)
    {
      id v12 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v8];
      ((void (**)(id, id, void *))v5)[2](v5, 0, v12);
    }
  }
}

- (void)setLowBatteryLocateEnabled:(BOOL)a3 usingCallback:(id)a4
{
  BOOL v4 = a3;
  id v7 = (void (**)(id, void))a4;
  unsigned __int8 v8 = sub_100004238();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = "NO";
    if (v4) {
      id v9 = "YES";
    }
    *(_DWORD *)buf = 136315394;
    __int16 v29 = "-[FMDFMIPXPCServer setLowBatteryLocateEnabled:usingCallback:]";
    __int16 v30 = 2080;
    __int16 v31 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s with enabled: %s", buf, 0x16u);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v10 = +[FMDServiceProvider activeServiceProvider];
    id v11 = [v10 account];

    if (v11)
    {
      [(__CFString *)v11 setLowBatteryLocateEnabled:v4];
      id v12 = +[FMDServiceProvider activeServiceProvider];
      id v13 = [v12 accountStore];
      [v13 saveAccount:v11];

      if (v7) {
        v7[2](v7, 0);
      }
      uint64_t v14 = +[FMDServiceProvider activeServiceProvider];
      [v14 registerDeviceWithCause:@"LowBatteryLocateChange" force:0];
      goto LABEL_19;
    }
    uint64_t v20 = sub_100004238();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100240B14(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    if (v7)
    {
      CFStringRef v19 = @"FMIP account not found";
      CFStringRef v17 = self;
      uint64_t v18 = 5;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v15 = NSStringFromSelector(a2);
    id v11 = +[NSString stringWithFormat:@"Entitlement not found for %@", v15];

    uint64_t v16 = sub_100004238();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v7)
    {
      CFStringRef v17 = self;
      uint64_t v18 = 6;
      CFStringRef v19 = v11;
LABEL_18:
      uint64_t v14 = [(FMDFMIPXPCServer *)v17 _errorForCode:v18 message:v19];
      ((void (**)(id, void *))v7)[2](v7, v14);
LABEL_19:
    }
  }
}

- (void)signatureHeadersWithData:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[FMDFMIPXPCServer signatureHeadersWithData:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", (uint8_t *)&buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v10 = v7;
    uint64_t v23 = +[NSUUID UUID];
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x2020000000;
    char v63 = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x2020000000;
    char v61 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v65 = 0x3032000000;
    v66 = sub_10007F57C;
    v67 = sub_10007F58C;
    id v68 = 0;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x3032000000;
    v58[3] = sub_10007F57C;
    v58[4] = sub_10007F58C;
    id v59 = 0;
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x3032000000;
    v56[3] = sub_10007F57C;
    v56[4] = sub_10007F58C;
    id v57 = 0;
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x3032000000;
    v54[3] = sub_10007F57C;
    void v54[4] = sub_10007F58C;
    id v55 = 0;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x3032000000;
    v52[3] = sub_10007F57C;
    v52[4] = sub_10007F58C;
    id v53 = 0;
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = sub_10007F57C;
    v50[4] = sub_10007F58C;
    id v51 = 0;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10007F594;
    v37[3] = &unk_1002DC0C8;
    uint64_t v22 = dispatch_queue_create("FMDFMIPXPCServer.populateHeaders", 0);
    long long v38 = v22;
    uint64_t v42 = v62;
    uint64_t v43 = v60;
    __int16 v44 = v56;
    id v11 = v10;
    id v45 = v50;
    p_long long buf = &buf;
    id v47 = v58;
    id v48 = v52;
    unint64_t v49 = v54;
    id v12 = v23;
    id v39 = v12;
    CFStringRef v40 = self;
    id v41 = v8;
    id v13 = objc_retainBlock(v37);
    uint64_t v14 = sub_100004238();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "signatureHeadersWithData : Will attempt Absinth signing", v36, 2u);
    }

    uint64_t v15 = +[FMDAbsintheV3SigningInterface sharedInterface];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10007F920;
    v30[3] = &unk_1002DC0F0;
    id v32 = v56;
    id v33 = &buf;
    uint64_t v34 = v58;
    long long v35 = v62;
    uint64_t v16 = v13;
    id v31 = v16;
    [v15 signatureForData:v11 requestUUID:v12 mode:1 cause:@"app" completion:v30];

    id v17 = [objc_alloc((Class)FMDIdentitySigningRequest) initWithData:v11];
    id v18 = objc_alloc_init((Class)FMDDeviceIdentityFactory);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10007FBE0;
    v24[3] = &unk_1002DC118;
    uint64_t v26 = v50;
    uint64_t v27 = v52;
    v28 = v54;
    __int16 v29 = v60;
    CFStringRef v19 = v16;
    id v25 = v19;
    [v18 baaIdentityAttestationForSigningRequest:v17 completion:v24];

    _Block_object_dispose(v50, 8);
    _Block_object_dispose(v52, 8);

    _Block_object_dispose(v54, 8);
    _Block_object_dispose(v56, 8);

    _Block_object_dispose(v58, 8);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(v60, 8);
    _Block_object_dispose(v62, 8);
    goto LABEL_11;
  }
  uint64_t v20 = NSStringFromSelector(a2);
  id v11 = +[NSString stringWithFormat:@"Entitlement not found for %@", v20];

  uint64_t v21 = sub_100004238();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_10023ECE0();
  }

  if (v8)
  {
    id v12 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v11];
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v12);
LABEL_11:
  }
}

- (void)getAccessoriesWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void, id))a3;
  unsigned __int8 v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v17 = "-[FMDFMIPXPCServer getAccessoriesWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v7 = +[FMDServiceProvider activeServiceProvider];
    id v8 = [v7 accessoryRegistry];
    id v9 = [v8 allAccessories];

    +[NSMutableArray array];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10007FF90;
    v14[3] = &unk_1002DC140;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = v10;
    [v9 enumerateObjectsUsingBlock:v14];
    id v11 = sub_100004238();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = (const char *)v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Returning Accessories : %@", buf, 0xCu);
    }

    if (v5) {
      v5[2](v5, 0, v10);
    }

    goto LABEL_13;
  }
  id v12 = NSStringFromSelector(a2);
  id v7 = +[NSString stringWithFormat:@"Entitlement not found for %@", v12];

  id v13 = sub_100004238();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10023ECE0();
  }

  if (v5)
  {
    id v9 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v7];
    ((void (**)(id, void *, id))v5)[2](v5, v9, 0);
LABEL_13:
  }
}

- (void)attemptUCRTHealing:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  if ([(FMDFMIPXPCServer *)self _hasUCRTHealingAccessEntitlement])
  {
    id v9 = +[FMDServiceProvider activeServiceProvider];
    [v9 attemptUCRTHealing:v7 completion:v8];
  }
  else
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = +[NSString stringWithFormat:@"Entitlement not found for %@", v10];

    id v12 = sub_100059A40();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v8)
    {
      id v13 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v11];
      v8[2](v8, 0, v13);
    }
  }
}

- (void)fetchAccessoryConfigurations:(id)a3
{
  id v5 = (void (**)(id, uint64_t))a3;
  unsigned __int8 v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v14 = "-[FMDFMIPXPCServer fetchAccessoryConfigurations:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v7 = +[FMDExtConfigurationRegistry sharedInstance];
    id v8 = [v7 configurations];
    id v9 = [v8 allKeys];

    [v7 fetchSupportedAccessoryTypes];
    [v7 fetchConfigForAccessoryTypes:v9];
    if (!v5)
    {
LABEL_11:

      goto LABEL_12;
    }
    uint64_t v10 = 0;
LABEL_10:
    v5[2](v5, v10);
    goto LABEL_11;
  }
  id v11 = NSStringFromSelector(a2);
  id v7 = +[NSString stringWithFormat:@"Entitlement not found for %@", v11];

  id v12 = sub_100004238();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10023ECE0();
  }

  if (v5)
  {
    uint64_t v10 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v7];
    id v9 = (void *)v10;
    goto LABEL_10;
  }
LABEL_12:
}

- (void)removeAccessoryWithDiscoveryId:(id)a3 completion:(id)a4
{
  id v7 = (char *)a3;
  id v8 = a4;
  id v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v18 = "-[FMDFMIPXPCServer removeAccessoryWithDiscoveryId:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    uint64_t v10 = sub_100059878();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "removeAccessoryWithDiscoveryId called for accessory with serialNumber %@", buf, 0xCu);
    }

    id v11 = +[FMDExtExtensionHelper getAccessoryProxyForId:@"com.apple.icloud.FindMyDevice.FindMyExtensionContainer.FMDMagSafeExtension" withDelegate:0];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100080534;
    v15[3] = &unk_1002D9670;
    id v16 = v8;
    [v11 removeAccesoryWithSerialNumber:v7 completion:v15];
    id v12 = v16;
    goto LABEL_11;
  }
  id v13 = NSStringFromSelector(a2);
  id v11 = +[NSString stringWithFormat:@"Entitlement not found for %@", v13];

  uint64_t v14 = sub_100004238();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_10023ECE0();
  }

  if (v8)
  {
    id v12 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v11];
    (*((void (**)(id, void *))v8 + 2))(v8, v12);
LABEL_11:
  }
}

- (void)setPhoneNumber:(id)a3 toAccessoryWithDiscoveryId:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = sub_100004238();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    unint64_t v49 = "-[FMDFMIPXPCServer setPhoneNumber:toAccessoryWithDiscoveryId:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v39 = v9;
    CFStringRef v40 = +[FMDServiceProvider activeServiceProvider];
    long long v38 = [v40 accessoryRegistry];
    [v38 allAccessories];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = [v13 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v44;
LABEL_6:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v43 + 1) + 8 * v17);
        CFStringRef v19 = [v18 address];
        unsigned __int8 v20 = [v19 isEqualToString:v10];

        if (v20) {
          break;
        }
        if (v15 == (id)++v17)
        {
          id v15 = [v13 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v15) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      id v25 = v18;

      if (!v25) {
        goto LABEL_23;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v26 = v25;
        uint64_t v27 = +[FMDExtConfigurationRegistry sharedInstance];
        v28 = [v26 accessoryType];
        __int16 v29 = [v27 configForAccessoryType:v28];

        __int16 v30 = [v29 flavorForFeature:@"scd"];
        id v31 = sub_100059878();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          sub_100240CAC();
        }

        if (v30)
        {
          id v32 = +[FMDExtExtensionHelper getAccessoryControllerForFeature:@"scd" flavor:v30];
          id v33 = [v26 accessoryIdentifier];
          uint64_t v34 = [v33 stringValue];
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_100080AEC;
          v41[3] = &unk_1002D9670;
          id v42 = v11;
          id v9 = v39;
          [v32 setPhoneNumberForAccessoryId:v34 phoneNumber:v39 info:0 completion:v41];

          id v25 = v26;
          goto LABEL_32;
        }
      }
      long long v37 = sub_100004238();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_100240C28(v25);
      }

      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
    else
    {
LABEL_12:

LABEL_23:
      id v25 = +[NSString stringWithFormat:@"Accesory not found with discovery id %@", v10];
      long long v35 = sub_100004238();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_10023ECE0();
      }

      if (v11)
      {
        long long v36 = [(FMDFMIPXPCServer *)self _errorForCode:14 message:v25];
        (*((void (**)(id, void *))v11 + 2))(v11, v36);
      }
    }
    id v9 = v39;
LABEL_32:
    uint64_t v24 = v38;

    uint64_t v22 = v40;
    goto LABEL_33;
  }
  uint64_t v21 = NSStringFromSelector(a2);
  uint64_t v22 = +[NSString stringWithFormat:@"Entitlement not found for %@", v21];

  uint64_t v23 = sub_100004238();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_10023ECE0();
  }

  if (v11)
  {
    uint64_t v24 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v22];
    (*((void (**)(id, void *))v11 + 2))(v11, v24);
LABEL_33:
  }
}

- (void)registerDeviceForPairingLock:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, FMDPairingLockRegisterAction *, void))a4;
  id v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v17 = "-[FMDFMIPXPCServer registerDeviceForPairingLock:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v10 = +[FMDServiceProvider activeServiceProvider];
    id v11 = [[FMDPairingLockRegisterAction alloc] initWithProvider:v10 registerRequestInfo:v7];
    [(FMDPairingLockRegisterAction *)v11 performOnActionCompletion:v8];
    id v12 = +[ActionManager sharedManager];
    id v13 = [v12 enqueueAction:v11];

LABEL_9:
    goto LABEL_10;
  }
  id v14 = NSStringFromSelector(a2);
  id v10 = +[NSString stringWithFormat:@"Entitlement not found for %@", v14];

  id v15 = sub_100004238();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10023ECE0();
  }

  if (v8)
  {
    id v11 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v10];
    v8[2](v8, v11, 0);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)updatePairingLockInfo:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  id v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    CFStringRef v19 = "-[FMDFMIPXPCServer updatePairingLockInfo:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v10 = +[FMDServiceProvider activeServiceProvider];
    id v11 = [[FMDPairingLockUpdateInfoAction alloc] initWithProvider:v10 updateRequestInfo:v7];
    v8[2](v8, 0);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100080F44;
    v16[3] = &unk_1002D9768;
    id v17 = v7;
    [(FMDPairingLockUpdateInfoAction *)v11 performOnActionCompletion:v16];
    id v12 = +[ActionManager sharedManager];
    id v13 = [v12 enqueueAction:v11];

LABEL_9:
    goto LABEL_10;
  }
  id v14 = NSStringFromSelector(a2);
  id v10 = +[NSString stringWithFormat:@"Entitlement not found for %@", v14];

  id v15 = sub_100004238();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10023ECE0();
  }

  if (v8)
  {
    id v11 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v10];
    ((void (**)(id, FMDPairingLockUpdateInfoAction *))v8)[2](v8, v11);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)pairingCheckWith:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, FMDPairingCheckCommandAction *, void))a4;
  id v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v17 = "-[FMDFMIPXPCServer pairingCheckWith:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v10 = +[FMDServiceProvider activeServiceProvider];
    id v11 = [[FMDPairingCheckCommandAction alloc] initWithProvider:v10 pairingCheckRequestInfo:v7];
    [(FMDPairingCheckCommandAction *)v11 performOnActionCompletion:v8];
    id v12 = +[ActionManager sharedManager];
    id v13 = [v12 enqueueAction:v11];

LABEL_9:
    goto LABEL_10;
  }
  id v14 = NSStringFromSelector(a2);
  id v10 = +[NSString stringWithFormat:@"Entitlement not found for %@", v14];

  id v15 = sub_100004238();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10023ECE0();
  }

  if (v8)
  {
    id v11 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v10];
    v8[2](v8, v11, 0);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)soundStoppedForAccessoryIdentifier:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v13 = "-[FMDFMIPXPCServer soundStoppedForAccessoryIdentifier:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v7 = +[FMDServiceProvider activeServiceProvider];
    id v8 = [v7 accessoryRegistry];
    id v9 = [objc_alloc((Class)FMDAccessoryIdentifier) initWithString:v5];
    id v10 = [v8 accessoryForIdentifier:v9];
    [v8 updateAccessory:v10 playbackChannels:&__NSArray0__struct];
  }
  else
  {
    id v11 = NSStringFromSelector(a2);
    id v7 = +[NSString stringWithFormat:@"Entitlement not found for %@", v11];

    id v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }
  }
}

- (void)playSoundWithOptions:(id)a3 completion:(id)a4
{
  unsigned __int8 v6 = (void (**)(id, void))a4;
  id v7 = sub_100004238();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v16 = "-[FMDFMIPXPCServer playSoundWithOptions:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v8 = +[FMDFMIPManager sharedInstance];
    unsigned int v9 = [v8 lostModeIsActive];

    if (v9)
    {
      id v10 = sub_100004238();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting a play sound message", buf, 2u);
      }

      id v11 = objc_alloc_init(FMDMessage);
      [(FMDMessage *)v11 setPlaySound:1];
      [(FMDMessage *)v11 setSoundName:@"fmd_sound"];
      [(FMDMessage *)v11 setSoundDuration:120];
      [(FMDMessage *)v11 setIsHighPrioritySound:1];
      [(FMDMessage *)v11 setIsFmipSound:1];
      [(FMDMessage *)v11 setVibrate:1];
      [(FMDMessage *)v11 activate];
      v6[2](v6, 0);
    }
    else
    {
      id v11 = [(FMDFMIPXPCServer *)self _errorForCode:9 message:@"Cannot play sound while not in lost mode."];
      ((void (**)(id, FMDMessage *))v6)[2](v6, v11);
    }
  }
  else
  {
    id v12 = NSStringFromSelector(a2);
    id v11 = +[NSString stringWithFormat:@"Entitlement not found for %@", v12];

    id v13 = sub_100004238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v6)
    {
      id v14 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v11];
      ((void (**)(id, void *))v6)[2](v6, v14);
    }
  }
}

- (void)clearData:(unint64_t)a3 completion:(id)a4
{
  id v7 = (void (**)(id, void))a4;
  id v8 = sub_100004238();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v17 = "-[FMDFMIPXPCServer clearData:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    if (a3 == 1)
    {
      unsigned int v9 = objc_alloc_init(FMDAccessoryLocationStore);
      [(FMDAccessoryLocationStore *)v9 clearAccessoryLocationStore];
      id v10 = +[FMDServiceProvider activeServiceProvider];
      id v11 = [v10 accessoryLocationStore];
      [v11 clearAccessoryLocationStore];
    }
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    id v12 = NSStringFromSelector(a2);
    id v13 = +[NSString stringWithFormat:@"Entitlement not found for %@", v12];

    id v14 = sub_100004238();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v7)
    {
      id v15 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v13];
      ((void (**)(id, void *))v7)[2](v7, v15);
    }
  }
}

- (void)deviceEligibleForRepairWithContext:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(FMDFMIPXPCServer *)self _hasRepairDeviceAccessEntitlement])
  {
    unsigned int v9 = +[FMDServiceProvider activeServiceProvider];
    [v9 deviceEligibleForRepairWithContext:v7 completion:v8];
  }
  else
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = +[NSString stringWithFormat:@"Entitlement not found for %@", v10];

    id v12 = sub_100004238();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    id v13 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v11];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v13);
  }
}

- (void)enableRepairWithContext:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(FMDFMIPXPCServer *)self _hasRepairDeviceAccessEntitlement])
  {
    unsigned int v9 = +[NSXPCConnection currentConnection];
    id v10 = v9;
    if (v9)
    {
      [v9 auditToken];
      id v11 = (void *)xpc_copy_code_signing_identity_for_token();
      id v12 = +[NSString stringWithUTF8String:v11];
      free(v11);
    }
    else
    {
      id v12 = @"unknown";
    }
    id v15 = +[FMDServiceProvider activeServiceProvider];
    [v15 enableRepairWithContext:v7 callingClient:v12 completion:v8];

    id v8 = v15;
  }
  else
  {
    id v13 = NSStringFromSelector(a2);
    id v10 = +[NSString stringWithFormat:@"Entitlement not found for %@", v13];

    id v14 = sub_100004238();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    id v12 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v10];
    (*((void (**)(id, void, __CFString *))v8 + 2))(v8, 0, v12);
  }
}

- (void)requireDisableLocationWithCompletion:(id)a3
{
  id v5 = (void (**)(id, uint64_t, void *))a3;
  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    unsigned __int8 v6 = +[FMSystemInfo sharedInstance];
    if ([v6 isInternalBuild])
    {
      unsigned int v7 = +[FMPreferencesUtil BOOLForKey:@"SimulateRequireDisableLocationFailure" inDomain:kFMDNotBackedUpPrefDomain];

      if (v7)
      {
        id v8 = sub_100059C08();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "requireDisableLocationWithCompletion simulating failure.", buf, 2u);
        }

        unsigned int v9 = +[NSError errorWithDomain:kFMDErrorDomain code:12 userInfo:0];
        v5[2](v5, -1, v9);
        goto LABEL_23;
      }
    }
    else
    {
    }
    id v13 = +[FMDServiceProvider activeServiceProvider];
    unsigned int v9 = v13;
    if (v13)
    {
      BOOL v14 = [v13 fmipState] == (id)1 || [v9 fmipState] == 0;
      id v17 = +[FMDSystemConfig sharedInstance];
      unsigned int v18 = [v17 isFMIPLocationServicesEnabled];

      CFStringRef v19 = sub_100059C08();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        uint64_t v21 = v14 & v18;
        __int16 v22 = 1024;
        BOOL v23 = v14;
        __int16 v24 = 1024;
        unsigned int v25 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "requireDisableLocationWithCompletion result %li, fmip: %i, locationService: %i.", buf, 0x18u);
      }

      v5[2](v5, v14 & v18, 0);
      goto LABEL_23;
    }
    id v15 = sub_100059C08();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100240D20();
    }

    uint64_t v12 = +[NSError errorWithDomain:kFMDErrorDomain code:2 userInfo:0];
LABEL_18:
    uint64_t v16 = (void *)v12;
    v5[2](v5, -1, (void *)v12);

    goto LABEL_23;
  }
  id v10 = NSStringFromSelector(a2);
  unsigned int v9 = +[NSString stringWithFormat:@"Entitlement not found for %@", v10];

  id v11 = sub_100059C08();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10023ECE0();
  }

  if (v5)
  {
    uint64_t v12 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v9];
    goto LABEL_18;
  }
LABEL_23:
}

- (void)disableLocationDisplayWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    unsigned __int8 v6 = +[FMSystemInfo sharedInstance];
    if ([v6 isInternalBuild])
    {
      unsigned int v7 = +[FMPreferencesUtil BOOLForKey:@"SimulateDisableLocationDisplayFailure" inDomain:kFMDNotBackedUpPrefDomain];

      if (v7)
      {
        id v8 = sub_100059C08();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "disableLocationDisplayWithCompletion simulating failure.", buf, 2u);
        }

        unsigned int v9 = +[NSError errorWithDomain:kFMDErrorDomain code:12 userInfo:0];
        v5[2](v5, v9);
        goto LABEL_19;
      }
    }
    else
    {
    }
    unsigned int v9 = +[FMDServiceProvider activeServiceProvider];
    if (v9)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000822C0;
      v15[3] = &unk_1002D9670;
      uint64_t v16 = v5;
      [v9 disableLocationDisplayWithCompletion:v15];
      id v13 = v16;
LABEL_18:

      goto LABEL_19;
    }
    BOOL v14 = sub_100059C08();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100240D20();
    }

    uint64_t v12 = +[NSError errorWithDomain:kFMDErrorDomain code:2 userInfo:0];
LABEL_17:
    id v13 = (void *)v12;
    v5[2](v5, (void *)v12);
    goto LABEL_18;
  }
  id v10 = NSStringFromSelector(a2);
  unsigned int v9 = +[NSString stringWithFormat:@"Entitlement not found for %@", v10];

  id v11 = sub_100059C08();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10023ECE0();
  }

  if (v5)
  {
    uint64_t v12 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v9];
    goto LABEL_17;
  }
LABEL_19:
}

- (void)_forceFMWUpgradeAlertUsingCallback:(id)a3
{
}

- (void)_forceUpgradeAlertForKey:(id)a3 UsingCallback:(id)a4
{
  id v42 = a3;
  unsigned int v7 = (void (**)(id, void))a4;
  id v8 = sub_100004238();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v52 = "-[FMDFMIPXPCServer _forceUpgradeAlertForKey:UsingCallback:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    unsigned int v9 = +[FMSystemInfo sharedInstance];
    unsigned int v10 = [v9 isInternalBuild];

    if (v10)
    {
      long long v38 = v7;
      id v11 = +[NRPairedDeviceRegistry sharedInstance];
      uint64_t v12 = [v11 getPairedDevices];

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = v12;
      id v13 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v46;
        uint64_t v16 = NRDevicePropertyIsPaired;
        uint64_t v41 = NRDevicePropertyPairingID;
        uint64_t v40 = NRDevicePropertyLocalPairingDataStorePath;
        uint64_t v39 = NRDevicePropertyUDID;
        do
        {
          id v17 = 0;
          id v43 = v14;
          do
          {
            if (*(void *)v46 != v15) {
              objc_enumerationMutation(obj);
            }
            unsigned int v18 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v17);
            CFStringRef v19 = [v18 valueForProperty:v16];
            unsigned int v20 = [v19 BOOLValue];

            if (v20)
            {
              uint64_t v21 = v16;
              __int16 v22 = [v18 valueForProperty:v41];
              BOOL v23 = [v18 valueForProperty:v40];
              id v24 = objc_alloc((Class)NPSDomainAccessor);
              id v25 = [v24 initWithDomain:kFMDWatchNotBackedUpPrefDomain pairingID:v22 pairingDataStore:v23];
              id v26 = [v25 synchronize];
              uint64_t v27 = sub_100004238();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                v28 = [v18 valueForProperty:v39];
                *(_DWORD *)long long buf = 138412290;
                __int16 v52 = v28;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Forcing AL upgrade alert for device with udid %@", buf, 0xCu);
              }
              [v25 setBool:1 forKey:v42];
              id v29 = [v25 synchronize];
              __int16 v30 = objc_opt_new();
              uint64_t v31 = kFMDWatchNotBackedUpPrefDomain;
              id v49 = v42;
              id v32 = +[NSArray arrayWithObjects:&v49 count:1];
              id v33 = +[NSSet setWithArray:v32];
              [v30 synchronizeNanoDomain:v31 keys:v33];

              uint64_t v16 = v21;
              id v14 = v43;
            }
            id v17 = (char *)v17 + 1;
          }
          while (v14 != v17);
          id v14 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v14);
      }

      unsigned int v7 = v38;
    }
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    uint64_t v34 = NSStringFromSelector(a2);
    long long v35 = +[NSString stringWithFormat:@"Entitlement not found for %@", v34];

    long long v36 = sub_100004238();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (v7)
    {
      long long v37 = [(FMDFMIPXPCServer *)self _errorForCode:6 message:v35];
      ((void (**)(id, void *))v7)[2](v7, v37);
    }
  }
}

- (void)setDailyLocateReportEnabled:(BOOL)a3
{
  BOOL v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[FMDFMIPXPCServer setDailyLocateReportEnabled:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", (uint8_t *)&v7, 0xCu);
  }

  id v5 = +[FMSystemInfo sharedInstance];
  unsigned int v6 = [v5 isInternalBuild];

  if (v6) {
    [(FMDFMIPXPCServer *)self scheduleDailyLocateReportXPCActivity];
  }
}

- (void)showDailyLocateReport
{
  id v5 = objc_alloc_init((Class)FMAlert);
  [v5 setCategory:3];
  uint64_t v3 = [(FMDFMIPXPCServer *)self locateStats];
  [v5 setMsgText:v3];

  [v5 setMsgTitle:@"FMIP Daily Locate Report"];
  [v5 setShowMsgInLockScreen:1];
  [v5 setDismissMsgOnUnlock:0];
  [v5 setDismissMsgOnLock:0];
  [v5 setDefaultButtonTitle:@"OK"];
  BOOL v4 = +[FMAlertManager sharedInstance];
  [v4 activateAlert:v5];
}

- (void)scheduleDailyLocateReportXPCActivity
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100082B14;
  handler[3] = &unk_1002DC188;
  handler[4] = self;
  xpc_activity_register((const char *)[@"com.apple.icloud.findmydeviced.dailyReportSchedule" cStringUsingEncoding:4], v3, handler);
}

- (id)locateStats
{
  v2 = objc_alloc_init(FMDEventLoggerFacilityOnDiskStats);
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  unsigned int v18 = sub_10007F57C;
  CFStringRef v19 = sub_10007F58C;
  unsigned int v20 = &stru_1002E7428;
  uint64_t v3 = [&stru_1002E7428 stringByAppendingString:@"Locates during the past 3 days\n"];
  BOOL v4 = (void *)v16[5];
  v16[5] = v3;

  id v5 = [(FMDEventLoggerFacilityOnDiskStats *)v2 loggedEventsForEventName:@"FMDLocatorLocateEvent"];
  unsigned int v6 = +[NSDate date];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  uint64_t v9 = 0;
  for (uint64_t i = 3; i; --i)
  {
    uint64_t v11 = v9 + 1;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100082E78;
    v14[3] = &unk_1002DC1B0;
    *(double *)&v14[5] = v8 - (double)(v9 + 1) * 86400.0;
    *(double *)&v14[6] = v8 - (double)v9 * 86400.0;
    void v14[4] = &v15;
    v14[7] = v9;
    [v5 enumerateObjectsUsingBlock:v14];
    uint64_t v9 = v11;
  }
  id v12 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v12;
}

- (id)_deviceIdentifiersForSignature
{
  v2 = +[NSMutableDictionary dictionary];
  uint64_t v3 = +[FMDSystemConfig sharedInstance];
  BOOL v4 = [v3 internationalMobileEquipmentIdentity];
  [v2 fm_safelyMapKey:@"imei" toObject:v4];

  id v5 = +[FMDSystemConfig sharedInstance];
  unsigned int v6 = [v5 mobileEquipmentIdentifier];
  [v2 fm_safelyMapKey:@"meid" toObject:v6];

  double v7 = +[FMDSystemConfig sharedInstance];
  double v8 = [v7 serialNumber];
  [v2 fm_safelyMapKey:@"serialNumber" toObject:v8];

  uint64_t v9 = +[FMDSystemConfig sharedInstance];
  unsigned int v10 = [v9 escrowHash];
  uint64_t v11 = [v10 hexString];
  [v2 fm_safelyMapKey:@"escrowHash" toObject:v11];

  id v12 = +[FMDSystemConfig sharedInstance];
  id v13 = [v12 ecid];
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0x%llx", [v13 longLongValue]);
  [v2 fm_safelyMapKey:@"ecid" toObject:v14];

  uint64_t v15 = +[FMDSystemConfig sharedInstance];
  uint64_t v16 = [v15 chipId];
  uint64_t v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0x%llx", [v16 longLongValue]);
  [v2 fm_safelyMapKey:@"chipId" toObject:v17];

  unsigned int v18 = +[FMDSystemConfig sharedInstance];
  CFStringRef v19 = [v18 wifiMacAddress];
  [v2 fm_safelyMapKey:@"wifiMac" toObject:v19];

  unsigned int v20 = +[FMDSystemConfig sharedInstance];
  uint64_t v21 = [v20 btMacAddress];
  [v2 fm_safelyMapKey:@"btMac" toObject:v21];

  __int16 v22 = +[FMDAbsintheV3SigningInterface sharedInterface];
  id v30 = 0;
  BOOL v23 = [v22 inFieldCollectionReceipt:&v30];
  id v24 = v30;
  [v2 fm_safelyMapKey:@"ifcReceipt" toObject:v23];

  id v25 = [v24 fm_commaSeparatedString];
  [v2 fm_safelyMapKey:@"collectionError" toObject:v25];

  id v26 = +[FMSystemInfo sharedInstance];
  LODWORD(v23) = [v26 isInternalBuild];

  if (v23)
  {
    uint64_t v27 = [v24 description];
    [v2 fm_safelyMapKey:@"collectionErrorDetail" toObject:v27];
  }
  v28 = sub_100004238();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v32 = v2;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Generated device identifiers %@", buf, 0xCu);
  }

  return v2;
}

- (BOOL)_hasRepairDeviceAccessEntitlement
{
  v2 = +[NSXPCConnection currentConnection];
  uint64_t v3 = [v2 valueForEntitlement:@"com.apple.icloud.FindMyDevice.RepairDevice.access"];

  if (v3) {
    unsigned __int8 v4 = [&__kCFBooleanTrue isEqual:v3];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_hasUCRTHealingAccessEntitlement
{
  v2 = +[NSXPCConnection currentConnection];
  uint64_t v3 = [v2 valueForEntitlement:@"com.apple.icloud.FindMyDevice.ucrt.healing.access"];

  if (v3) {
    unsigned __int8 v4 = [&__kCFBooleanTrue isEqual:v3];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_hasAuthAccessEntitlement
{
  v2 = +[NSXPCConnection currentConnection];
  uint64_t v3 = [v2 valueForEntitlement:@"com.apple.icloud.findmydeviced.access.auth"];

  if (v3) {
    unsigned __int8 v4 = [&__kCFBooleanTrue isEqual:v3];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)_errorForCode:(int)a3 message:(id)a4
{
  id v5 = (__CFString *)a4;
  id v6 = objc_alloc((Class)NSError);
  uint64_t v7 = kFMDErrorDomain;
  if (v5) {
    CFStringRef v8 = v5;
  }
  else {
    CFStringRef v8 = &stru_1002E7428;
  }
  NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v13 = v8;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v10 = [v6 initWithDomain:v7 code:a3 userInfo:v9];

  return v10;
}

- (void)sendPairedDeviceLostModeExitAuthToken:(id)a3 deviceID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFStringRef v8 = sub_100004238();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preparing to send exit lost mode token to ids device.", buf, 2u);
  }

  uint64_t v9 = objc_alloc_init(FMDNanoSupportProtoLostModeExitAuth);
  [(FMDNanoSupportProtoLostModeExitAuth *)v9 setLostModeExitAuthToken:v7];

  id v10 = objc_alloc((Class)IDSProtobuf);
  uint64_t v11 = [(FMDNanoSupportProtoLostModeExitAuth *)v9 data];
  id v12 = [v10 initWithProtobufData:v11 type:6 isResponse:0];

  CFStringRef v13 = [(FMDFMIPXPCServer *)self protectedIDSManager];
  [v13 sendMessageWithProtobuf:v12 inResponseToRequest:0 withPriority:0 timeout:1 bypassingDuet:v6 deviceID:&stru_1002DC1F0 requestAcceptedHandler:60.0 responseHandler:0];
}

- (void)activationLockInfoFromDeviceWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DAEMON API - activationLockInfoWithCompletion", buf, 2u);
  }

  if (![(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    CFStringRef v8 = NSStringFromSelector(a2);
    id v7 = +[NSString stringWithFormat:@"Entitlement not found for %@", v8];

    uint64_t v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    goto LABEL_9;
  }
  if (v5)
  {
    id v7 = +[FMDLocalActivationLockInfoManager sharedInstance];
    [v7 activationLockInfoWithCompletion:v5];
LABEL_9:
  }
}

- (void)activationLockAuthInfoWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  id v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DAEMON API - activationLockAuthInfo", buf, 2u);
  }

  if (![(FMDFMIPXPCServer *)self _hasAuthAccessEntitlement])
  {
    uint64_t v9 = NSStringFromSelector(a2);
    CFStringRef v8 = +[NSString stringWithFormat:@"Entitlement not found for %@", v9];

    id v10 = sub_100004238();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }

    if (!v5) {
      goto LABEL_15;
    }
    uint64_t v11 = self;
    uint64_t v12 = 6;
    CFStringRef v13 = v8;
    goto LABEL_14;
  }
  if (v5)
  {
    id v7 = +[FMDServiceProvider activeServiceProvider];
    CFStringRef v8 = v7;
    if (v7)
    {
      [(__CFString *)v7 activationLockAuthInfo:v5];
LABEL_15:

      goto LABEL_16;
    }
    id v14 = sub_100004238();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No Active Service Provider - cannot provide auth info", v16, 2u);
    }

    CFStringRef v13 = @"No Active FMDServiceProvider";
    uint64_t v11 = self;
    uint64_t v12 = 12;
LABEL_14:
    uint64_t v15 = [(FMDFMIPXPCServer *)v11 _errorForCode:v12 message:v13];
    v5[2](v5, 0, v15);

    goto LABEL_15;
  }
LABEL_16:
}

- (void)updateMaskedAppleIDWith:(id)a3 completion:(id)a4
{
  id v7 = a3;
  CFStringRef v8 = (void (**)(id, void))a4;
  uint64_t v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DAEMON API - updateMaskedAppleID %@", buf, 0xCu);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    if (v7 && [v7 length])
    {
      id v10 = +[FMDLocalActivationLockInfoManager sharedInstance];
      [v10 updateMaskedAppleID:v7];

      if (v8) {
        v8[2](v8, 0);
      }
    }
    else if (v8)
    {
      id v14 = NSStringFromSelector(a2);
      uint64_t v15 = +[NSString stringWithFormat:@"No maskedAppleID specified %@", v14];

      uint64_t v16 = [(FMDFMIPXPCServer *)self _errorForCode:1 message:v15];
      ((void (**)(id, void *))v8)[2](v8, v16);
    }
  }
  else
  {
    uint64_t v11 = NSStringFromSelector(a2);
    uint64_t v12 = +[NSString stringWithFormat:@"Entitlement not found for %@", v11];

    CFStringRef v13 = sub_100004238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }
  }
}

- (void)clearMaskedAppleIDWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  id v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DAEMON API - clearMaskedAppleID", buf, 2u);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v7 = +[FMDLocalActivationLockInfoManager sharedInstance];
    [v7 clearMaskedAppleIDValue];

    v5[2](v5, 0);
  }
  else
  {
    CFStringRef v8 = NSStringFromSelector(a2);
    uint64_t v9 = +[NSString stringWithFormat:@"Entitlement not found for %@", v8];

    id v10 = sub_100004238();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }
  }
}

- (void)storeOfflineFindingInfo:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DAEMON API - storeOfflineFindingInfo", buf, 2u);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v10 = +[FMDLocalActivationLockInfoManager sharedInstance];
    [v10 storeOfflineFindingInfo:v7 completion:v8];
  }
  else
  {
    uint64_t v11 = NSStringFromSelector(a2);
    id v10 = +[NSString stringWithFormat:@"Entitlement not found for %@", v11];

    uint64_t v12 = sub_100004238();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }
  }
}

- (void)fetchOfflineFindingInfoWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DAEMON API - fetchOfflineFindingInfo", buf, 2u);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v7 = +[FMDLocalActivationLockInfoManager sharedInstance];
    [v7 fetchOfflineFindingInfoWithCompletion:v5];
  }
  else
  {
    id v8 = NSStringFromSelector(a2);
    id v7 = +[NSString stringWithFormat:@"Entitlement not found for %@", v8];

    uint64_t v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }
  }
}

- (void)clearOfflineFindingInfoWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DAEMON API - clearOfflineFindingInfo", buf, 2u);
  }

  if ([(FMDFMIPXPCServer *)self _hasClientAccessEntitlement])
  {
    id v7 = +[FMDLocalActivationLockInfoManager sharedInstance];
    [v7 clearOfflineFindingInfoWithCompletion:v5];
  }
  else
  {
    id v8 = NSStringFromSelector(a2);
    id v7 = +[NSString stringWithFormat:@"Entitlement not found for %@", v8];

    uint64_t v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10023ECE0();
    }
  }
}

- (void)fetchAPNSTokenWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, void *, void))a3;
  unsigned __int8 v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DAEMON API - fetchAPNSToken", v7, 2u);
  }

  if (v3)
  {
    id v5 = +[FMDServiceProvider activeServiceProvider];
    id v6 = [v5 apsToken];
    v3[2](v3, v6, 0);
  }
}

- (void)startLocationMonitoring:(id)a3
{
  uint64_t v3 = (void (**)(id, void))a3;
  unsigned __int8 v4 = sub_1000599A8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DAEMON API - startLocationMonitoring", buf, 2u);
  }

  id v5 = +[FMDServiceProvider activeServiceProvider];
  id v6 = [v5 locationMonitor];

  if (v6)
  {
    id v7 = [v5 locationMonitor];
    [v7 startLocationMonitor:v3];
  }
  else
  {
    id v8 = sub_1000599A8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No LocationMonitor while starting. Calling completion immediately", v9, 2u);
    }

    v3[2](v3, 0);
  }
}

- (void)stopLocationMonitoring:(id)a3
{
  uint64_t v3 = (void (**)(id, void))a3;
  unsigned __int8 v4 = sub_1000599A8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DAEMON API - stopLocationMonitoring", buf, 2u);
  }

  id v5 = +[FMDServiceProvider activeServiceProvider];
  id v6 = [v5 locationMonitor];

  if (v6)
  {
    id v7 = [v5 locationMonitor];
    [v7 stopLocationMonitor:v3];
  }
  else
  {
    id v8 = sub_1000599A8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No LocationMonitor while stopping. Calling completion immediately", v9, 2u);
    }

    v3[2](v3, 0);
  }
}

- (void)updatedConfigReceived:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  id v6 = a3;
  id v7 = sub_100004238();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DAEMON API - updatedConfigReceived", v10, 2u);
  }

  id v8 = +[FMDServiceProvider activeServiceProvider];
  uint64_t v9 = [v8 locationMonitor];
  [v9 updateMonitorConfig:v6];

  v5[2](v5, 0);
}

- (void)startLocationMonitoringWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = sub_1000599A8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DAEMON API - startLocationMonitoringWithContext %@", (uint8_t *)&v12, 0xCu);
  }

  id v8 = +[FMDServiceProvider activeServiceProvider];
  uint64_t v9 = [v8 locationMonitor];

  if (v9)
  {
    id v10 = [v8 locationMonitor];
    [v10 startLocationMonitorWithContext:v5 completion:v6];
  }
  else
  {
    uint64_t v11 = sub_1000599A8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No LocationMonitor while starting with policy. Calling completion immediately", (uint8_t *)&v12, 2u);
    }

    v6[2](v6, 0);
  }
}

- (void)startLocationMonitoringWithContext:(id)a3 forcePublish:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = (void (**)(id, void))a5;
  uint64_t v9 = sub_1000599A8();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DAEMON API - startLocationMonitoringWithContext %@", (uint8_t *)&v14, 0xCu);
  }

  id v10 = +[FMDServiceProvider activeServiceProvider];
  uint64_t v11 = [v10 locationMonitor];

  if (v11)
  {
    int v12 = [v10 locationMonitor];
    [v12 startLocationMonitorWithContext:v7 forcePublish:v6 completion:v8];
  }
  else
  {
    id v13 = sub_1000599A8();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No LocationMonitor while starting with policy. Calling completion immediately", (uint8_t *)&v14, 2u);
    }

    v8[2](v8, 0);
  }
}

- (void)stopLocationMonitoringWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  BOOL v6 = (void (**)(id, void))a4;
  id v7 = sub_1000599A8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DAEMON API - stopLocationMonitorWithContext %@", (uint8_t *)&v12, 0xCu);
  }

  id v8 = +[FMDServiceProvider activeServiceProvider];
  uint64_t v9 = [v8 locationMonitor];

  if (v9)
  {
    id v10 = [v8 locationMonitor];
    [v10 stopLocationMonitorWithContext:v5 completion:v6];
  }
  else
  {
    uint64_t v11 = sub_1000599A8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No LocationMonitor while stopping with context. Calling completion immediately", (uint8_t *)&v12, 2u);
    }

    v6[2](v6, 0);
  }
}

- (void)didAddLocalFindableAccessory:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000599A8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DAEMON API - didAddLocalFindableAccessory", v9, 2u);
  }

  id v8 = +[FMDServiceProvider activeServiceProvider];
  [v8 registerAccessory:v6 completion:v5];
}

- (void)didRemoveLocalFindableAccessory:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000599A8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DAEMON API - didRemoveLocalFindableAccessory", v9, 2u);
  }

  id v8 = +[FMDServiceProvider activeServiceProvider];
  [v8 unregisterAccessory:v6 completion:v5];
}

- (FMNanoIDSManager)protectedIDSManager
{
  return self->_protectedIDSManager;
}

- (void).cxx_destruct
{
}

@end