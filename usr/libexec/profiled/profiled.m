uint64_t start()
{
  void *v0;
  int AppBooleanValue;
  int v2;
  BOOL v3;
  char v4;
  int v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  CFStringRef v23;

  MCIsDaemonProcess = 1;
  MCLoggingInitialize();
  +[NSError _setFileNameLocalizationEnabled:0];
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(kMCInternalAbortOnUnreadableFiles, kCFPreferencesAnyApplication, &keyExistsAndHasValidFormat);
  v2 = keyExistsAndHasValidFormat;
  MCFixHostileSymlinks();
  if (v2) {
    v3 = AppBooleanValue == 0;
  }
  else {
    v3 = 1;
  }
  v4 = v3;
  v5 = MCCheckSystemGroupContainerFileReadability();
  v6 = _MCLogObjects[2];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[2], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "System group container check complete!", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[2], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v23 = @"unrecoverable";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "System group container check found %{public}@ errors!", buf, 0xCu);
    }
    if ((v4 & 1) == 0) {
      abort();
    }
  }
  v8 = _MCLogObjects[2];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Service starting...", buf, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1000053D4, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  +[MCProfileStateHandler addProfileSettingsStateHandler];
  +[MCProfileStateHandler addProfileRestrictionsStateHandler];
  v10 = +[MCProfileServiceServer sharedServer];
  [v10 start];
  v11 = objc_alloc((Class)NSXPCListener);
  v12 = [v11 initWithMachServiceName:MCProfileServiceName];
  v13 = (void *)qword_100105850;
  qword_100105850 = (uint64_t)v12;

  v14 = objc_alloc((Class)NSXPCListener);
  v15 = [v14 initWithMachServiceName:MCProfileServicePublicName];
  v16 = (void *)qword_100105858;
  qword_100105858 = (uint64_t)v15;

  v17 = objc_opt_new();
  v18 = (void *)qword_100105860;
  qword_100105860 = v17;

  [(id)qword_100105850 setDelegate:qword_100105860];
  [(id)qword_100105858 setDelegate:qword_100105860];
  [(id)qword_100105850 resume];
  [(id)qword_100105858 resume];

  v19 = +[NSRunLoop currentRunLoop];
  [v19 run];

  return 0;
}

uint64_t sub_1000053D4()
{
  v0 = _MCLogObjects[2];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "System language changed", v2, 2u);
  }
  return xpc_transaction_exit_clean();
}

void sub_100005494(id a1)
{
  qword_100105870 = objc_alloc_init(MCProfileServiceServer);

  _objc_release_x1();
}

void sub_10000579C(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  v2 = [*(id *)(a1 + 32) workerQueueBackgroundActivityManager];
  [v2 start];

  if ((MCHasMigrated() & 1) == 0)
  {
    v3 = objc_opt_new();
    v4 = [*(id *)(a1 + 32) workerQueue];
    [v3 migrateWithPostMigrationTaskQueue:v4];
  }
  v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 12);

  os_unfair_lock_unlock(v5);
}

void sub_10000583C(uint64_t a1)
{
  [*(id *)(a1 + 32) _workerQueuePrepareForService];
  v2 = +[MCRestrictionManagerWriter sharedManager];
  [v2 removeOrphanedClientRestrictions];
  [v2 recomputeUserRestrictionsAndEffectiveUserSettings];
  v3 = +[NSFileManager defaultManager];
  v4 = MCEffectiveUserSettingsFilePath();
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4];

  if ((v5 & 1) == 0)
  {
    v6 = _MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "EffectiveUserSettings.plist is missing. Attempting to recreate it...", buf, 2u);
    }
    [v2 recomputeEffectiveUserSettingsPasscode:0];
  }
  if (!+[DMCMultiUserModeUtilities isSharediPad]
    || ([(id)MCUMUserManagerClass() sharedManager],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 currentUser],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 isLoginUser],
        v8,
        v7,
        v9))
  {
    [*(id *)(a1 + 32) workerQueueNotifyUserLoggedIn];
  }
  v10 = +[MCPasscodeManager sharedManager];
  unsigned __int8 v11 = [v10 isPasscodeSet];

  if ((v11 & 1) == 0)
  {
    [*(id *)(a1 + 32) notifyFirstUnlock];
    [*(id *)(a1 + 32) notifyDeviceUnlockedWithCompletion:0];
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100005C64;
  handler[3] = &unk_1000EACA8;
  handler[4] = *(void *)(a1 + 32);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", 0, handler);
  xpc_set_event_stream_handler("com.apple.fsevents.matching", 0, &stru_1000EACE8);
  v12 = [*(id *)(a1 + 32) appWorkspace];
  [v12 addObserver:*(void *)(a1 + 32)];

  *(_DWORD *)buf = 0;
  notify_register_dispatch("com.apple.message.MailAccountsChanged", (int *)buf, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 88), &stru_1000EAD28);
  [*(id *)(a1 + 32) notifyBatterySaverModeChanged];
  v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:*(void *)(a1 + 32) selector:"localeChanged" name:NSCurrentLocaleDidChangeNotification object:0];

  [*(id *)(a1 + 32) reapplyAppEnforcedRestrictionsWithAssertion:*(void *)(a1 + 40)];
  id v14 = +[MCProfile thisDeviceType];
  if (+[MCTargetDeviceResolver purgatorySupportedForDevice:v14])
  {
    v15 = +[MCInstaller sharedInstaller];
    [v15 purgePurgatoryProfilesForTargetDevice:v14];
  }
  if ((+[DMCMultiUserModeUtilities isSharediPad] & 1) == 0)
  {
    v16 = +[MDMConfiguration sharedConfiguration];
    v17 = [v16 memberQueueManagingProfileIdentifier];

    if (!v17)
    {
      v18 = objc_opt_new();
      v19 = +[DMCEnrollmentFlowController enrollmentFlowControllerWithPresenter:0 managedConfigurationHelper:v18];

      [v19 cleanUpDirtyState];
    }
    v20 = +[MDMConfiguration sharedConfiguration];
    v21 = [v20 personaID];

    if (!v21)
    {
      v22 = +[DMCPersonaHelper fetchDirtyPersonaIDs];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v23 = [v22 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v28;
        do
        {
          v26 = 0;
          do
          {
            if (*(void *)v28 != v25) {
              objc_enumerationMutation(v22);
            }
            +[DMCPersonaHelper removePersonaAndAccountsWithPersonaID:*(void *)(*((void *)&v27 + 1) + 8 * (void)v26)];
            v26 = (char *)v26 + 1;
          }
          while (v24 != v26);
          id v24 = [v22 countByEnumeratingWithState:&v27 objects:v33 count:16];
        }
        while (v24);
      }
    }
  }
  +[DMCPersonaHelper untrackAllDirtyPersonas];
}

void sub_100005C64(uint64_t a1, xpc_object_t xdict)
{
  id v3 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(xdict, _xpc_event_key_name)];
  if ([v3 isEqualToString:@"com.apple.system.lowpowermode"])
  {
    [*(id *)(a1 + 32) notifyBatterySaverModeChanged];
  }
  else if ([v3 isEqualToString:@"GracePeriodChanged"])
  {
    [*(id *)(a1 + 32) notifyGracePeriodChanged];
  }
  else if ([v3 isEqualToString:@"ProvisioningProfileInstalled"] {
         || [v3 isEqualToString:@"ProvisioningProfileRemoved"])
  }
  {
    [*(id *)(a1 + 32) notifyProvisioningProfilesChanged];
  }
  else if ([v3 isEqualToString:@"FirstUnlock"])
  {
    [*(id *)(a1 + 32) notifyFirstUnlock];
  }
  else if ([v3 isEqualToString:@"com.apple.LoginKit.isLoggedIn"])
  {
    [*(id *)(a1 + 32) notifyUserLoggedIn];
  }
  else if ([v3 isEqualToString:@"com.apple.keystore.memento.effaced"])
  {
    [*(id *)(a1 + 32) notifyMementoEffaced];
  }
}

void sub_100005DA4(id a1, int a2)
{
}

void sub_100005DF8(id a1)
{
  v1 = +[MCBatterySaverMode currentBatterySaverRestrictions];
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v3 = @"Setting";
    if (!v1) {
      CFStringRef v3 = @"Removing";
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ battery saver mode restrictions", buf, 0xCu);
  }
  v4 = +[MCRestrictionManagerWriter sharedManager];
  uint64_t v5 = kBatterySaverClientType;
  v6 = MCLocalizedFormat();
  id v9 = 0;
  [v4 setClientRestrictions:v1 clientType:v5 clientUUID:v5 sender:@"ProfileServiceServer.NotifyBatterySaverModeChanged" localizedClientDescription:v6 localizedWarning:0 outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:&v9];
  v7 = (__CFString *)v9;

  if (v7)
  {
    v8 = _MCLogObjects[2];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to set battery saver restrictions with error %{public}@", buf, 0xCu);
    }
  }
}

void sub_1000060B4()
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = +[MCAppEnforcedRestrictions restrictionEnforcingApps];
  id v0 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v0)
  {
    id v1 = v0;
    uint64_t v17 = *(void *)v20;
    uint64_t v2 = kAppEnforcedRestrictionsClientType;
    do
    {
      for (i = 0; i != v1; i = (char *)i + 1)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v5 = +[MCAppEnforcedRestrictions enforcedRestrictionsForBundleID:v4];
        id v6 = v4;
        v7 = +[LSApplicationProxy applicationProxyForIdentifier:v6];
        v8 = v7;
        id v9 = v6;
        if (v7)
        {
          v10 = [v7 localizedName];
          id v11 = [v10 length];

          id v9 = v6;
          if (v11)
          {
            id v9 = [v8 localizedName];
          }
        }
        v12 = +[MCRestrictionManagerWriter sharedManager];
        v13 = +[MCAppEnforcedRestrictionUtilities clientUUIDForBundleID:v6];
        id v18 = 0;
        [v12 setClientRestrictions:v5 clientType:v2 clientUUID:v13 sender:@"ProfileServiceServer.ReapplyAppEnforcedRestrictions" localizedClientDescription:v9 localizedWarning:0 outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:&v18];
        id v14 = v18;

        if (v14)
        {
          v15 = _MCLogObjects[2];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v24 = v6;
            __int16 v25 = 2114;
            id v26 = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to set enforced restrictions for app “%{public}@” with error %{public}@", buf, 0x16u);
          }
        }
      }
      id v1 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v1);
  }
}

id sub_1000068A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMemberQueueHasMigrated:1];
}

void sub_1000068B0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    CFStringRef v3 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      uint64_t v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Recompute Profile Restrictions error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

id sub_100006960(uint64_t a1)
{
  return [*(id *)(a1 + 32) workerQueueRecomputeNagMessage];
}

void sub_1000072F4(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A10C4();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  CFStringRef v3 = +[MCInstaller sharedInstaller];
  int v4 = [v3 verifiedMDMProfileIdentifierWithCleanUp];
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v4);
}

void sub_100007420(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A114C();
  }
  uint64_t v2 = +[MCInstaller sharedInstaller];
  CFStringRef v3 = [v2 popProfileDataAtHeadOfInstallationQueue];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000754C(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A11D4();
  }
  uint64_t v2 = +[MCInstaller sharedInstaller];
  CFStringRef v3 = [v2 peekPurgatoryProfileDataForTargetDevice:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007704(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A125C();
  }
  id v2 = *(id *)(a1 + 32);
  if ([v2 isEqualToString:@"com.apple.WebSheet"])
  {

    id v2 = 0;
  }
  if (!*(unsigned char *)(a1 + 72)) {
    goto LABEL_11;
  }
  if (+[DMCMultiUserModeUtilities isSharediPad])
  {
    uint64_t v3 = MCInstallationErrorDomain;
    int v4 = MCErrorArray();
    uint64_t v5 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 4033, v4, MCErrorTypeFatal, 0);
  }
  else
  {
    __int16 v14 = 0;
    MCSBSSpringBoardServerPort();
    MCSBGetScreenLockStatus();
    uint64_t v5 = 0;
  }
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
LABEL_11:
    id v6 = +[MCInstaller sharedInstaller];
    v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007950;
    v9[3] = &unk_1000EAE28;
    v9[4] = *(void *)(a1 + 56);
    id v10 = v7;
    char v13 = *(unsigned char *)(a1 + 72);
    id v11 = v2;
    id v12 = *(id *)(a1 + 64);
    [v6 queueProfileDataForInstallation:v10 originalFileName:v8 completion:v9];
  }
}

void sub_100007950(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v15 = a2;
  id v7 = a3;
  if ([v15 MCContainsErrorDomain:MCProfileErrorDomain code:1000]
    && [*(id *)(a1 + 32) _isValidProvisioningProfileData:*(void *)(a1 + 40)])
  {
    uint64_t v8 = MCInstallationErrorDomain;
    id v9 = MCErrorArray();
    uint64_t v10 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v8, 4053, v9, MCErrorTypeFatal, 0);

    id v15 = (id)v10;
  }
  if (v7 && !v15 && *(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 32) _handleSettingsJumpWithProfileData:*(void *)(a1 + 40) targetDeviceType:a4 bundleID:*(void *)(a1 + 48)];
  }
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = [v7 UUID];
  char v13 = (void *)v12;
  if (v12) {
    CFStringRef v14 = (const __CFString *)v12;
  }
  else {
    CFStringRef v14 = &stru_1000ECAD0;
  }
  (*(void (**)(uint64_t, const __CFString *, uint64_t, id))(v11 + 16))(v11, v14, a4, v15);
}

void sub_100007D44(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A12E4();
  }
  id v2 = +[MCInstaller sharedInstaller];
  id v3 = [v2 verifiedMDMProfileIdentifierWithCleanUp];

  int v4 = +[MCInstaller sharedInstaller];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v19 = 0;
  id v9 = [v4 installProfileData:v5 options:v6 interactionClient:v7 source:v8 outError:&v19];
  id v10 = v19;

  [*(id *)(a1 + 48) didFinishInstallationWithIdentifier:v9 error:v10];
  uint64_t v11 = [*(id *)(a1 + 64) workerQueueBackgroundActivityManager];
  [v11 rescheduleProfileJanitorJob];

  uint64_t v12 = *(void **)(a1 + 80);
  if (v12)
  {
    char v13 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007EE8;
    block[3] = &unk_1000EAE78;
    id v18 = v12;
    id v15 = v9;
    id v16 = v10;
    id v17 = *(id *)(a1 + 72);
    dispatch_async(v13, block);
  }
}

uint64_t sub_100007EE8(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5]);
}

void sub_100008040(uint64_t *a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A136C();
  }
  id v2 = +[MCInstaller sharedInstaller];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v8 = 0;
  uint64_t v6 = [v2 updateProfileWithIdentifier:v3 interactionClient:v4 source:v5 outError:&v8];
  id v7 = v8;

  [(id)a1[5] didFinishInstallationWithIdentifier:v6 error:v7];
  (*(void (**)(void))(a1[8] + 16))();
}

void sub_10000822C(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A13F4();
  }
  id v2 = +[MCInstaller sharedInstaller];
  [v2 removeProfileWithIdentifier:*(void *)(a1 + 32) installationType:*(void *)(a1 + 72) source:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 48) workerQueueBackgroundActivityManager];
  [v3 rescheduleProfileJanitorJob];

  uint64_t v4 = *(void **)(a1 + 64);
  if (v4)
  {
    uint64_t v5 = dispatch_get_global_queue(0, 0);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100008354;
    v6[3] = &unk_1000EAEF0;
    id v8 = v4;
    id v7 = *(id *)(a1 + 56);
    dispatch_async(v5, v6);
  }
}

uint64_t sub_100008354(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100008470(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A147C();
  }
  id v2 = +[MCInstaller sharedInstaller];
  [v2 removeUninstalledProfileWithIdentifier:*(void *)(a1 + 32) installationType:*(void *)(a1 + 56) targetDeviceType:*(void *)(a1 + 64)];

  uint64_t v3 = *(void **)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = dispatch_get_global_queue(0, 0);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100008580;
    v5[3] = &unk_1000EAEF0;
    id v7 = v3;
    id v6 = *(id *)(a1 + 40);
    dispatch_async(v4, v5);
  }
}

uint64_t sub_100008580(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_1000087F0(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1504();
  }
  id v2 = +[MCRestrictionManagerWriter sharedManager];
  [v2 removeOrphanedClientRestrictions];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100008BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_100008BDC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) memberQueueHasMigrated];
  id result = [*(id *)(a1 + 32) memberQueueHasActivationRecordChangesPending];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

uint64_t sub_100008C24(uint64_t a1)
{
  id v2 = _MCLogObjects[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Now allowing client to proceed.", v4, 2u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

BOOL sub_100009558(id a1, NSString *a2)
{
  return MCIsAppExemptFromOpenInSourceRestrictions();
}

BOOL sub_100009560(id a1, NSString *a2)
{
  return MCIsAppAccountBasedSourceForOpenIn();
}

uint64_t sub_100009568(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

BOOL sub_100009978(id a1, NSString *a2)
{
  return _MCIsAppExemptFromImportFromTargetRestrictions(a2);
}

BOOL sub_100009980(id a1, NSString *a2)
{
  return _MCIsAppAccountBasedTargetForOpenIn(a2);
}

uint64_t sub_100009988(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t sub_100009E6C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

BOOL sub_10000A1C4(id a1, MailAccount *a2, NSDictionary *a3)
{
  uint64_t v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    LOBYTE(v4) = 0;
  }
  else {
    unsigned int v4 = [(MailAccount *)v3 restrictedFromSendingExternally] ^ 1;
  }

  return v4;
}

BOOL sub_10000A220(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 sourceIsManaged] && *(unsigned char *)(a1 + 32)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = ([v3 sourceIsManaged] & 1) == 0 && *(unsigned char *)(a1 + 33) != 0;
  }

  return v4;
}

void sub_10000A288(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

uint64_t sub_10000A2E0(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_10000AB84(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A158C();
  }
  id v2 = MCNagUIMetaFilePath();
  id v3 = +[NSMutableDictionary dictionaryWithContentsOfFile:v2];

  if (v3 && *(void *)(a1 + 32))
  {
    BOOL v4 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Starting password compliance by %{public}@", (uint8_t *)&v7, 0xCu);
    }
    [v3 setObject:*(void *)(a1 + 32) forKey:kMCNagMetaTimerExpiryDateKey];
    id v6 = MCNagUIMetaFilePath();
    [v3 MCWriteToBinaryFile:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_10000AE00(uint64_t a1)
{
  id v2 = +[NSFileManager defaultManager];
  id v3 = MCBackupContainsPasscodeFilePath();
  [v2 removeItemAtPath:v3 error:0];

  BOOL v4 = +[MCRestrictionManagerWriter sharedManager];
  [v4 notifyHaveSeenComplianceMessageWithLastLockDate:*(void *)(a1 + 32)];

  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

uint64_t sub_10000AFA0(uint64_t a1)
{
  [*(id *)(a1 + 32) workerQueueRecomputeNagMessage];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

uint64_t sub_10000B0E4(uint64_t a1)
{
  id v2 = +[MCRestrictionManagerWriter sharedManager];
  [v2 notifyClientsToRecomputeCompliance];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void sub_10000B234(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A17AC();
  }
  id v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is attempting to clear the recovery passcode", (uint8_t *)&v7, 0xCu);
  }
  BOOL v4 = +[MCPasscodeManagerWriter sharedManager];
  uint64_t v5 = [v4 clearRecoveryPasscode];

  if (!v5)
  {
    if ([MCPreferencesBundleIdentifier isEqualToString:*(void *)(a1 + 32)]) {
      uint64_t v6 = 5;
    }
    else {
      uint64_t v6 = 6;
    }
    +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000B4C4(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1834();
  }
  id v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is attempting to change the passcode", buf, 0xCu);
  }
  BOOL v4 = +[MCPasscodeManagerWriter sharedManager];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 32);
  id v16 = 0;
  unsigned int v9 = [v4 changePasscodeFrom:v5 to:v6 skipRecovery:v7 senderBundleID:v8 outError:&v16];
  id v10 = v16;

  unsigned int v11 = [*(id *)(a1 + 32) isEqualToString:MCSetupAssistantBundleIdentifier];
  if (v9 && v11)
  {
    uint64_t v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Buddy is changing the passcode; attempting to create unlock token",
        buf,
        2u);
    }
    char MDMEscrowWithPasscode = MCKeybagCreateMDMEscrowWithPasscode();
    id v14 = v10;

    if ((MDMEscrowWithPasscode & 1) == 0)
    {
      uint64_t v15 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Can't create escrow keybag. Error: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v14 = v10;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_10000B818(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A18BC();
  }
  id v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is attempting to change the passcode with recovery passcode", buf, 0xCu);
  }
  BOOL v4 = +[MCPasscodeManagerWriter sharedManager];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = 0;
  [v4 changePasscodeWithRecoveryPasscode:v5 to:v6 skipRecovery:v7 senderBundleID:v8 outError:&v10];
  id v9 = v10;

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_10000BA38(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1944();
  }
  char MDMEscrowWithPasscode = MCKeybagCreateMDMEscrowWithPasscode();
  id v3 = 0;
  if ((MDMEscrowWithPasscode & 1) == 0)
  {
    BOOL v4 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Can't create escrow keybag. Error: %{public}@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000BC88(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A19CC();
  }
  id v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is attempting to clear the passcode", buf, 0xCu);
  }
  BOOL v4 = +[MCPasscodeManagerWriter sharedManager];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = 0;
  [v4 clearPasscodeWithEscrowKeybagData:v5 secret:v6 senderBundleID:v7 outError:&v9];
  id v8 = v9;

  [*(id *)(a1 + 56) workerQueueRecomputeNagMessage];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void sub_10000BE70(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1A54();
  }
  id v2 = +[MCPasscodeManager sharedManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = 0;
  [v2 isPasscodeCompliantWithNamedPolicy:v3 outError:&v5];
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10000BFEC(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1ADC();
  }
  id v2 = +[MCPasscodeManagerWriter sharedManager];
  [v2 resetPasscodeMetadata];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000C22C(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1B64();
  }
  id v2 = objc_opt_new();
  [v2 migratePostDataMigratorWithContext:*(unsigned int *)(a1 + 48) passcodeWasSetInBackup:*(unsigned __int8 *)(a1 + 52)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000C384(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1BEC();
  }
  id v2 = objc_opt_new();
  [v2 migrateCleanupMigratorWithContext:*(unsigned int *)(a1 + 56)];
  CFStringRef v3 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  CFPreferencesSetAppValue(kMCHasCheckedForAutoInstalledProfiles, kCFBooleanFalse, kMCNotBackedUpPreferencesDomain);
  CFPreferencesAppSynchronize(v3);
  [*(id *)(a1 + 32) workerQueueCheckForAutoInstallProfiles];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id sub_10000C65C(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1C74();
  }
  LODWORD(v3) = *(_DWORD *)(a1 + 96);
  return [*(id *)(a1 + 32) _workerQueue_setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:senderPID:sender:assertion:completion:]*(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 100), *(unsigned __int8 *)(a1 + 101), *(void *)(a1 + 56), *(void *)(a1 + 64), v3, *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88)];
}

uint64_t sub_10000C92C(void *a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1CFC();
  }
  id v2 = +[MCRestrictionManagerWriter sharedManager];
  [v2 removeBoolSetting:a1[4] sender:a1[5]];

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

uint64_t sub_10000CAC4(void *a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1D84();
  }
  id v2 = +[MCRestrictionManagerWriter sharedManager];
  [v2 removeValueSetting:a1[4] sender:a1[5]];

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

uint64_t sub_10000CC08(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1E0C();
  }
  if (*(void *)(a1 + 32))
  {
    id v2 = +[NSURL URLWithString:](NSURL, "URLWithString:");
    uint64_t v3 = +[LSApplicationWorkspace defaultWorkspace];
    uint64_t v13 = MCSBSApplicationLaunchFromURLOptionUnlockDeviceKey();
    id v4 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    id v14 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    unsigned __int8 v6 = [v3 openSensitiveURL:v2 withOptions:v5];

    if ((v6 & 1) == 0)
    {
      os_log_t v7 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        id v8 = v7;
        id v9 = [v2 absoluteString];
        int v11 = 138543362;
        uint64_t v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Open of URL %{public}@ reported failure", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000D57C(id a1, NSDictionary *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  unsigned __int8 v6 = _MCLogObjects[2];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "authenticateWithContext Completion block...", (uint8_t *)&v11, 2u);
  }
  if (v5)
  {
    os_log_t v7 = _MCLogObjects[2];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed toauthenticateWithContext with the following error: %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    id v8 = objc_alloc_init((Class)AIDAMutableServiceContext);
    [v8 setAuthenticationResults:v4];
    [v8 setShouldForceOperation:0];
    [v8 setOperationUIPermissions:0];
    id v9 = +[ACAccountStore defaultStore];
    id v10 = [objc_alloc((Class)AIDAServiceOwnersManager) initWithAccountStore:v9];
    [v10 signInService:AIDAServiceTypeFaceTime withContext:v8 completion:&stru_1000EB2A0];
  }
}

void sub_10000D710(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  id v5 = _MCLogObjects[2];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "signInService Completion block...", (uint8_t *)&v10, 2u);
  }
  unsigned __int8 v6 = _MCLogObjects[2];
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      int v11 = v4;
      os_log_t v7 = "Succesfully signed in to service AIDAServiceTypeFaceTime, error: %{public}@";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138543362;
    int v11 = v4;
    os_log_t v7 = "Failed to sign in to service AIDAServiceTypeFaceTime with error: %{public}@";
    id v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    goto LABEL_8;
  }
}

void sub_10000E2F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000E578;
  v20[3] = &unk_1000EB2F0;
  os_log_t v7 = *(void **)(a1 + 40);
  v20[4] = *(void *)(a1 + 32);
  char v22 = *(unsigned char *)(a1 + 48);
  id v21 = v7;
  id v8 = objc_retainBlock(v20);
  os_log_type_t v9 = (void (**)(void, void, void, void, void, void))v8;
  if (v6)
  {
    os_log_t v10 = _MCLogObjects[2];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = v10;
      uint64_t v12 = [v6 MCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      id v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: Error getting data SIM: %{public}@", buf, 0xCu);
    }
    ((void (**)(void, void, void, void, void, id))v9)[2](v9, 0, 0, 0, 0, v6);
  }
  else if (v5)
  {
    uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 120);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000E72C;
    v17[3] = &unk_1000EB318;
    id v14 = v8;
    uint64_t v15 = *(void *)(a1 + 32);
    id v19 = v14;
    v17[4] = v15;
    id v18 = v5;
    [v13 getSIMStatus:v18 completion:v17];
  }
  else
  {
    id v16 = _MCLogObjects[2];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: No SIM is marked as data SIM.", buf, 2u);
    }
    v9[2](v9, 1, 0, 0, 0, 0);
  }
}

void sub_10000E578(uint64_t a1, char a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [*(id *)(a1 + 32) workerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E6C4;
  block[3] = &unk_1000EB2C8;
  char v27 = a2;
  id v16 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  char v28 = *(unsigned char *)(a1 + 48);
  id v25 = v14;
  id v26 = v16;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  dispatch_async(v15, block);
}

uint64_t sub_10000E6C4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80)) {
    [*(id *)(a1 + 32) _workerQueueCheckCarrierProfileForCarrierIdentifier:*(void *)(a1 + 40) name:*(void *)(a1 + 48) atPath:*(void *)(a1 + 56) forceReinstallation:*(unsigned __int8 *)(a1 + 81)];
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_10000E72C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_log_t v7 = _MCLogObjects[2];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    os_log_type_t v9 = [v6 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    id v20 = v5;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: getSIMStatus status:%{public}@ error:%{public}@)", buf, 0x16u);
  }
  if (v6)
  {
    os_log_t v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (![v5 isEqualToString:kCTSIMSupportSIMStatusNotInserted])
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = *(void **)(*(void *)(a1 + 32) + 120);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000E918;
      v16[3] = &unk_1000EB318;
      id v13 = *(id *)(a1 + 48);
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void **)(a1 + 40);
      id v18 = v13;
      v16[4] = v14;
      id v17 = v15;
      [v12 copyCarrierBundleLocation:v11 completion:v16];

      goto LABEL_8;
    }
    os_log_t v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v10();
LABEL_8:
}

void sub_10000E918(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    os_log_t v7 = _MCLogObjects[2];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = v7;
      os_log_type_t v9 = [v6 MCVerboseDescription];
      int v16 = 138543362;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: Could not find carrier bundle path. Error: %{public}@", (uint8_t *)&v16, 0xCu);
    }
    os_log_t v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_5:
    v10();
    goto LABEL_10;
  }
  if (!v5)
  {
    uint64_t v15 = _MCLogObjects[2];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: Could not find carrier bundle path.", (uint8_t *)&v16, 2u);
    }
    os_log_t v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_5;
  }
  uint64_t v11 = [*(id *)(a1 + 32) _carrierIdentifierFromContext:*(void *)(a1 + 40)];
  id v12 = [*(id *)(a1 + 32) _carrierNameFromContext:*(void *)(a1 + 40)];
  id v13 = [v5 stringByAppendingPathComponent:@"profile.mobileconfig"];
  uint64_t v14 = _MCLogObjects[2];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Evaluating carrier profile at: %{public}@", (uint8_t *)&v16, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_10:
}

void sub_10000F04C(uint64_t a1)
{
  if (mach_timebase_info((mach_timebase_info_t)&dword_100105880))
  {
    id v2 = +[NSAssertionHandler currentHandler];
    [v2 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"MCProfileServiceServer.m" lineNumber:1898 description:@"mach_timebase_info not available"];
  }
  else
  {
    qword_100105888 = (1000000000 * dword_100105884);
  }
  byte_100105890 = 1;
}

void sub_10000F0DC(id a1, NSError *a2)
{
  id v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Device was unlocked, check complete.", v3, 2u);
  }
}

uint64_t sub_10000F338(uint64_t a1)
{
  [*(id *)(a1 + 32) workerQueueNotifyDeviceUnlockedAndPasscodeRequired];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_10000F478(uint64_t a1)
{
  [*(id *)(a1 + 32) workerQueueNotifyDeviceUnlocked];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

id sub_10000F544(uint64_t a1)
{
  return [*(id *)(a1 + 32) workerQueueReadBiometricState];
}

void sub_10000F55C(id a1)
{
  id v1 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Rereading grace period", v3, 2u);
  }
  id v2 = +[MCServerSideHacks sharedHacks];
  [v2 applyGracePeriodSettingFromKeybagToUserSettings];
}

void sub_10000F654(uint64_t a1)
{
  id v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Provisioning profiles changed", v7, 2u);
  }
  BOOL v3 = dispatch_get_global_queue(0, 0);
  dispatch_async(v3, &stru_1000EB3C8);

  id v4 = [*(id *)(a1 + 32) workerQueueBackgroundActivityManager];
  [v4 rescheduleProfileJanitorJob];

  id v5 = [*(id *)(a1 + 32) workerQueueBackgroundActivityManager];
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:30.0];
  [v5 rescheduleManagedAppValidationJob:v6];
}

void sub_10000F738(id a1)
{
  id v1 = +[MCProvisioningProfileJanitor sharedJanitor];
  [v1 updateMISTrust];
}

id sub_10000F95C(uint64_t a1)
{
  return [*(id *)(a1 + 32) workerQueueNotifyUserLoggedIn];
}

id sub_10000FB14(uint64_t a1)
{
  return [*(id *)(a1 + 32) workerQueueNotifyMementoEffaced];
}

void sub_10000FBBC(uint64_t a1)
{
  id v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Applications finished installing", buf, 2u);
  }
  BOOL v3 = +[MDMManagedMediaReader attributesByAppID];
  id v4 = [v3 allKeys];

  if ([v4 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = *(id *)(a1 + 32);
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          os_log_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) bundleIdentifier:v13];
          unsigned __int8 v11 = [v4 containsObject:v10];

          if (v11)
          {

            id v12 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Managed applications finished installing", buf, 2u);
            }
            id v5 = +[MCProvisioningProfileJanitor sharedJanitor];
            [v5 updateMISTrust];
            goto LABEL_16;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
}

void sub_10000FECC(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1E94();
  }
  id v2 = MCHCUSetHostCertificateDataForMappedLabel();
  BOOL v3 = +[MCDependencyManager sharedManager];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [v2 MCHexString];
  [v3 addDependent:v4 ofParent:v5 inDomain:kMCDMCertificateToHostIdentifierDependencyKey reciprocalDomain:kMCDMHostIdentifierToCertificateDependencyKey];

  [v3 commitChanges];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_1000101FC(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1F1C();
  }
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = MISProfileCreateWithData();
    if (v2)
    {
      BOOL v3 = (const void *)v2;
      if (MISProvisioningProfileValidateSignature()) {
        goto LABEL_6;
      }
      if ([*(id *)(a1 + 48) length])
      {
        if (MISProvisioningProfileIsForLocalProvisioning())
        {
          uint64_t v4 = [*(id *)(a1 + 40) _localProvisioningProfileError];
          goto LABEL_7;
        }
        uint64_t UUID = MISProvisioningProfileGetUUID();
        if (!UUID)
        {
LABEL_6:
          uint64_t v4 = [*(id *)(a1 + 40) _badProvisioningProfileError];
LABEL_7:
          id v5 = (void *)v4;
LABEL_8:
          CFRelease(v3);
          goto LABEL_10;
        }
        uint64_t v9 = UUID;
        os_log_t v10 = +[MCDependencyManager sharedManager];
        uint64_t v11 = kMCDMManagingProfileToProvisioningProfileKey;
        id v12 = [v10 dependentsOfParent:*(void *)(a1 + 48) inDomain:kMCDMManagingProfileToProvisioningProfileKey];
        if (([v12 containsObject:v9] & 1) == 0)
        {
          [v10 addDependent:v9 ofParent:*(void *)(a1 + 48) inDomain:v11 reciprocalDomain:kMCDMProvisioningProfileToManagingProfileKey];
          [v10 commitChanges];
        }
      }
      uint64_t v13 = MISInstallProvisioningProfile();
      if (v13)
      {
        uint64_t v14 = MCProvisioningProfileErrorDomain;
        long long v15 = +[NSNumber numberWithInt:v13];
        long long v16 = MCErrorArray();
        id v5 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v14, 25001, v16, MCErrorTypeFatal, v15, 0);
      }
      else
      {
        id v5 = 0;
      }
      goto LABEL_8;
    }
  }
  id v5 = [*(id *)(a1 + 40) _badProvisioningProfileError];
LABEL_10:
  id v6 = *(void **)(a1 + 64);
  if (v6)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001048C;
    block[3] = &unk_1000EB0B8;
    id v20 = v6;
    id v18 = v5;
    id v19 = *(id *)(a1 + 56);
    dispatch_async(v7, block);
  }
}

uint64_t sub_10001048C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

void sub_1000105E4(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1FA4();
  }
  uint64_t v2 = +[MCInstaller sharedInstaller];
  BOOL v3 = [v2 removeProvisioningProfileUUID:*(void *)(a1 + 32) sender:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = MCProvisioningProfileErrorDomain;
    id v5 = MCErrorArray();
    id v6 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v4, 25002, v5, MCErrorTypeFatal, v3, 0);
LABEL_7:

    goto LABEL_8;
  }
  if (*(void *)(a1 + 48))
  {
    id v5 = +[MCDependencyManager sharedManager];
    [v5 removeDependent:*(void *)(a1 + 32) fromParent:*(void *)(a1 + 48) inDomain:kMCDMManagingProfileToProvisioningProfileKey reciprocalDomain:kMCDMProvisioningProfileToManagingProfileKey];
    [v5 commitChanges];
    id v6 = 0;
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_8:
  id v7 = *(void **)(a1 + 64);
  if (v7)
  {
    uint64_t v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000107CC;
    block[3] = &unk_1000EB0B8;
    id v12 = v7;
    id v10 = v6;
    id v11 = *(id *)(a1 + 56);
    dispatch_async(v8, block);
  }
}

uint64_t sub_1000107CC(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32) != 0);
}

void sub_10001090C(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A202C();
  }
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100010DD8;
  v38[3] = &unk_1000EB418;
  id v40 = *(id *)(a1 + 56);
  id v39 = *(id *)(a1 + 32);
  uint64_t v2 = objc_retainBlock(v38);
  BOOL v3 = +[MDMProvisioningProfileTrust signerIdentitiesFromProvisioningProfileUUID:*(void *)(a1 + 40)];
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = +[MCRestrictionManager sharedManager];
    uint64_t v6 = MCFeatureTrustedCodeSigningIdentities;
    uint64_t v7 = [v5 effectiveUnionValuesForSetting:MCFeatureTrustedCodeSigningIdentities];
    uint64_t v8 = (void *)v7;
    uint64_t v9 = &__NSArray0__struct;
    if (v7) {
      uint64_t v9 = (void *)v7;
    }
    id v10 = v9;

    id v11 = +[NSMutableSet setWithArray:v10];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v12 = v4;
    id v13 = [v12 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v29 = v6;
      id v30 = v10;
      int v15 = 0;
      uint64_t v16 = *(void *)v35;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          if (([v11 containsObject:v18] & 1) == 0)
          {
            [v11 addObject:v18];
            ++v15;
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v14);

      id v10 = v30;
      if (v15 > 0)
      {
        id v19 = _MCLogObjects[2];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 67240450;
          *(_DWORD *)v42 = v15;
          *(_WORD *)&v42[4] = 2114;
          *(void *)&v42[6] = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Trusting %{public}d new code signing identities for provisioning profile UUID: %{public}@", buf, 0x12u);
        }
        __int16 v21 = +[MCRestrictionManagerWriter sharedManager];
        id v22 = [v11 allObjects];
        [v21 setUnionValues:v22 forSetting:v29 sender:*(void *)(a1 + 48)];

        id v23 = +[MCProvisioningProfileJanitor sharedJanitor];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100010EE4;
        v31[3] = &unk_1000EB440;
        v33 = v2;
        id v32 = *(id *)(a1 + 32);
        [v23 updateMISTrustAndValidateApps:0 validateManagedApps:0 completion:v31];

        goto LABEL_27;
      }
    }
    else
    {
    }
    char v27 = _MCLogObjects[2];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      *(void *)v42 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No new code signing identities for provisioning profile UUID: %{public}@", buf, 0xCu);
    }
    ((void (*)(void *, uint64_t, void))v2[2])(v2, 1, 0);
  }
  else
  {
    id v24 = _MCLogObjects[2];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      *(void *)v42 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "MCProfileServiceServer missing code signing identities for provisioning profile UUID: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = MCProvisioningProfileErrorDomain;
    MCErrorArray();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v26, 25005, v10, MCErrorTypeFatal, 0);
    ((void (*)(void *, void, void *))v2[2])(v2, 0, v11);
  }
LABEL_27:
}

void sub_100010DD8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100010EC8;
    v8[3] = &unk_1000EB3F0;
    id v11 = v6;
    char v12 = a2;
    id v9 = v5;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v7, v8);
  }
}

uint64_t sub_100010EC8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
}

uint64_t sub_100010EE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_100011110(uint64_t a1)
{
  return [*(id *)(a1 + 32) workerQueueRemoveExpiredProfiles];
}

id sub_1000111F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) workerQueueRevalidateManagedApps];
}

uint64_t sub_1000112B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001184C(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A20B4();
  }
  uint64_t v2 = +[MCRestrictionManagerWriter sharedManager];
  [v2 resetAllSettingsToDefaultsSender:*(void *)(a1 + 32)];

  if (*(unsigned char *)(a1 + 56))
  {
    BOOL v3 = +[MCServerSideHacks sharedHacks];
    [v3 resetSettingsSender:*(void *)(a1 + 32)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_100011988(uint64_t a1)
{
  uint64_t v2 = _MCLogObjects[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Rereading managed app attributes.", v5, 2u);
  }
  BOOL v3 = +[MCServerSideHacks sharedHacks];
  [v3 recomputeAppRulesForNetworkExtension];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100011EF0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

id sub_1000126C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMemberQueueHasActivationRecordChangesPending:1];
}

void sub_1000126D4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) memberQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012764;
  block[3] = &unk_1000EAC80;
  void block[4] = *(void *)(a1 + 32);
  dispatch_barrier_async(v2, block);
}

id sub_100012764(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMemberQueueHasActivationRecordChangesPending:0];
}

uint64_t sub_100012E88(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100012F60(uint64_t a1)
{
  return [*(id *)(a1 + 32) waitForEnrollmentToFinishWithPersonaID:*(void *)(a1 + 40)];
}

uint64_t sub_100013C0C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) workerQueueBackgroundActivityManager];
  [v2 _rescheduleBackgroundActivity:*(void *)(a1 + 80) startDate:*(void *)(a1 + 40) gracePeriod:*(void *)(a1 + 48) priority:0 repeatingInterval:*(void *)(a1 + 56)];

  uint64_t result = *(void *)(a1 + 72);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_100013E94(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_100015CE0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = a2;
  id v9 = [v6 MCShortenedObject:a3];
  uint64_t v8 = [*(id *)(a1 + 40) MCShortenedObject:v7];

  [v5 setObject:v9 forKey:v8];
}

void sub_100018194(uint64_t a1, void *a2)
{
  id v9 = a2;
  BOOL v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  uint64_t v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
  if (v4) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v6 = +[NSSet setWithArray:v4];
    id v7 = +[NSMutableSet setWithArray:v3];
    [v7 intersectSet:v6];
    uint64_t v8 = [v7 allObjects];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
}

uint64_t sub_100018B30(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 count] || objc_msgSend(v4, "count")) {
    uint64_t v5 = (uint64_t)[v3 isEqualToDictionary:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void sub_100018E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100018E64(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    os_log_t v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = v4;
      uint64_t v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Request user input error. Error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100018F48(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = (id *)(a1 + 7);
  id v10 = a5;
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained(v9);
  [WeakRetained _receivedUserInput:v11 preflight:a3 payloadIndex:a4 delegate:a1[4] semaphore:a1[5] error:v10 outResponses:a1[6]];
}

void sub_1000192DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100019318(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100019328(uint64_t a1)
{
}

void sub_100019330(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    os_log_t v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = v4;
      uint64_t v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Request MAID login error. Error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100019414(uint64_t a1, char a2, id obj, char a4)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v7 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100019640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100019670(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    os_log_t v3 = _MCLogObjects[8];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      os_log_t v4 = v3;
      uint64_t v5 = [(NSError *)v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Request managed restore error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_100019748(void *a1, int a2, void *a3, int a4)
{
  id v8 = a3;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a4;
  uint64_t v9 = _MCLogObjects[8];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = a2;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 1024;
    int v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Request managed restore finished with success: %d, error: %{public}@, cancelled: %d", (uint8_t *)v10, 0x18u);
  }
}

void sub_100019AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019AD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    os_log_t v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = v4;
      int v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Finish preflight error. Error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100019BB4(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = (id *)(a1 + 7);
  id v10 = a5;
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained(v9);
  [WeakRetained _receivedUserInput:v11 preflight:a3 payloadIndex:a4 delegate:a1[4] semaphore:a1[5] error:v10 outResponses:a1[6]];
}

void sub_100019E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100019EC0(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    os_log_t v5 = _MCLogObjects[8];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = v5;
      int v7 = [v4 MCVerboseDescription];
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Show user warnings error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100019FC4(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001A1E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    os_log_t v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      os_log_t v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      int v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Did finish installation error. Error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_10001A2CC(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001A390(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    os_log_t v3 = _MCLogObjects[8];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      os_log_t v4 = v3;
      os_log_t v5 = [(NSError *)v2 MCVerboseDescription];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Did update status error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_10001A504(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    os_log_t v3 = _MCLogObjects[8];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      os_log_t v4 = v3;
      os_log_t v5 = [(NSError *)v2 MCVerboseDescription];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Did begin installating next profile error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_10001A81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10001A840(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    os_log_t v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      os_log_t v5 = v4;
      int v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      int v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Request current passcode error. Error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001A924(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001AAD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    os_log_t v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Client has disconnected with error: %@{public}", (uint8_t *)&v7, 0xCu);
    }
  }
  id v5 = objc_opt_new();
  int v6 = +[DMCEnrollmentFlowController enrollmentFlowControllerWithPresenter:0 managedConfigurationHelper:v5];

  [v6 cleanUpDirtyState];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_10001ABD8(uint64_t a1)
{
  uint64_t v2 = _MCLogObjects[8];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Enrollment has completed, stop waiting!", v4, 2u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001BD84(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    os_log_t v4 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Watch enrollment failed to install MDM profile: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001BE54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001BE68(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v5 = *(void **)(a1 + 32);
  id v6 = a4;
  [v5 setEnrollmentController:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10001C6CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001D41C(uint64_t a1)
{
  int v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v2 = dispatch_queue_create("MCBackgroundActivityManager work queue", v5);
  uint64_t v3 = *(void *)(a1 + 32);
  os_log_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

void sub_10001D490(uint64_t a1)
{
  dispatch_queue_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Profile list changed. Rescheduling profile janitor.", buf, 2u);
  }
  uint64_t v3 = *(void **)(a1 + 32);
  os_log_t v4 = objc_opt_new();
  int v5 = [v4 earliestExpiryDate];
  [v3 _workQueueReschedule:0 startDate:v5 gracePeriod:0 priority:XPC_ACTIVITY_PRIORITY_UTILITY repeatingInterval:0];

  id v6 = objc_opt_new();
  int v7 = [v6 earlistProfileEventExpiry];

  if (v7) {
    [*(id *)(a1 + 32) _workQueueReschedule:1 startDate:v7 gracePeriod:0 priority:XPC_ACTIVITY_PRIORITY_UTILITY repeatingInterval:0];
  }
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"MCOutputLevel", kCFPreferencesAnyApplication, &keyExistsAndHasValidFormat);
  Boolean v13 = 0;
  CFIndex v9 = CFPreferencesGetAppIntegerValue(@"MCLogLevel", kCFPreferencesAnyApplication, &v13);
  if (keyExistsAndHasValidFormat && v13 && AppIntegerValue == 7 && v9 == 7)
  {
    id v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Log level is heightened. Checking MDM installation status.", v12, 2u);
    }
    id v11 = +[MDMConfiguration sharedConfiguration];
    [v11 refreshDetailsFromDisk];
  }
}

void sub_10001D658(uint64_t a1)
{
  dispatch_queue_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Managed applications changed. Rescheduling managed app validation & MIS trust update", v6, 2u);
  }
  uint64_t v3 = dispatch_get_global_queue(0, 0);
  dispatch_async(v3, &stru_1000EB718);

  os_log_t v4 = *(void **)(a1 + 32);
  int v5 = +[NSDate dateWithTimeIntervalSinceNow:60.0];
  [v4 _workQueueReschedule:3 startDate:v5 gracePeriod:0 priority:0 repeatingInterval:0];
}

void sub_10001D728(id a1)
{
  id v1 = +[MCProvisioningProfileJanitor sharedJanitor];
  [v1 updateMISTrust];
}

id sub_10001D770(uint64_t a1)
{
  dispatch_queue_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Passcode changed. Rescheduling passcode and recovery passcode expiry checks", v4, 2u);
  }
  [*(id *)(a1 + 32) _workQueueReschedulePasscodeExpiryJob];
  return [*(id *)(a1 + 32) _workQueueRescheduleRecoveryPasscodeExpiryJob];
}

id sub_10001D7EC(uint64_t a1)
{
  dispatch_queue_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Passcode policy changed. Rescheduling passcode expiry check", v4, 2u);
  }
  return [*(id *)(a1 + 32) _workQueueReschedulePasscodeExpiryJob];
}

id sub_10001D860(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[NSDate dateWithTimeIntervalSinceNow:300.0];
  [v2 _workQueueReschedule:3 startDate:v3 gracePeriod:0 priority:0 repeatingInterval:0];

  os_log_t v4 = *(void **)(a1 + 32);
  int v5 = [v4 _nextRegularDate];
  [v4 _workQueueReschedule:4 startDate:v5 gracePeriod:0 priority:0 repeatingInterval:0];

  id v6 = *(void **)(a1 + 32);
  int v7 = [v6 _nextRegularDate];
  [v6 _workQueueReschedule:7 startDate:v7 gracePeriod:0 priority:0 repeatingInterval:0];

  [*(id *)(a1 + 32) _workQueueReschedulePasscodeExpiryJob];
  id v8 = *(void **)(a1 + 32);

  return [v8 _workQueueRescheduleRecoveryPasscodeExpiryJob];
}

void sub_10001E1DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_10001E200(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (xpc_activity_should_defer(v3))
  {
    BOOL v4 = xpc_activity_set_state(v3, 3);

    int v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      id v6 = *(void **)(a1 + 64);
      int v23 = 136315394;
      id v24 = v6;
      __int16 v25 = 1024;
      BOOL v26 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Background activity fired but deferred. name %s result %i", (uint8_t *)&v23, 0x12u);
    }
  }
  else
  {
    xpc_activity_state_t state = xpc_activity_get_state(v3);

    if (state == 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      CFIndex v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        id v10 = *(void **)(a1 + 32);
        int v23 = 138543618;
        id v24 = v10;
        __int16 v25 = 1024;
        BOOL v26 = WeakRetained == 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Performing %{public}@ (Nil self? %d)…", (uint8_t *)&v23, 0x12u);
      }
      switch(*(void *)(a1 + 72))
      {
        case 0:
          id v11 = [WeakRetained server];
          [v11 removeExpiredProfiles];
          goto LABEL_26;
        case 1:
          id v11 = objc_opt_new();
          [v11 removeExpiredProfileEvents];
          goto LABEL_26;
        case 2:
          +[MCCrypto clearStoredActivationLockBypassCode];
          break;
        case 3:
          id v11 = [WeakRetained server];
          [v11 revalidateManagedApps];
          goto LABEL_26;
        case 4:
          sub_100040E28();
          if (*(void *)(a1 + 40)) {
            break;
          }
          id v12 = *(void **)(a1 + 48);
          Boolean v13 = [v12 _nextRegularDate];
          uint64_t v14 = *(void *)(a1 + 80);
          uint64_t v15 = v12;
          uint64_t v16 = 4;
          goto LABEL_23;
        case 5:
          id v11 = +[MCRestrictionManagerWriter sharedManager];
          [v11 clearAllPasscodeComplianceCaches];
          LOBYTE(v23) = 0;
          if (![v11 recomputeNagMetadata:&v23] || (_BYTE)v23) {
            [WeakRetained reschedulePasscodeExpiryJob];
          }
          goto LABEL_26;
        case 6:
          id v17 = +[MCPasscodeManagerWriter sharedManager];
          id v11 = [v17 clearRecoveryPasscode];

          if (v11)
          {
            os_log_t v18 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              id v19 = v18;
              uint64_t v20 = [v11 MCVerboseDescription];
              int v23 = 138543362;
              id v24 = v20;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to clear recovery passcode. Error: %{public}@", (uint8_t *)&v23, 0xCu);
            }
            [WeakRetained rescheduleRecoveryPasscodeExpiryJob];
          }
          else
          {
            +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:3];
          }
          goto LABEL_26;
        case 7:
          __int16 v21 = +[MCRestrictionManagerWriter sharedManager];
          [v21 removeOrphanedClientRestrictions];

          if (*(void *)(a1 + 40)) {
            break;
          }
          id v22 = *(void **)(a1 + 48);
          Boolean v13 = [v22 _nextRegularDate];
          uint64_t v14 = *(void *)(a1 + 80);
          uint64_t v15 = v22;
          uint64_t v16 = 7;
LABEL_23:
          [v15 _rescheduleBackgroundActivity:v16 startDate:v13 gracePeriod:0 priority:v14 repeatingInterval:0];

          break;
        case 8:
          id v11 = +[MCRestrictionManagerWriter sharedManager];
          [v11 recomputeNagMetadata];
LABEL_26:

          break;
        default:
          break;
      }
    }
  }
}

id sub_10001E7D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _workQueueReschedulePasscodeExpiryJob];
}

id sub_10001E8FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _workQueueRescheduleRecoveryPasscodeExpiryJob];
}

void sub_10001EB50(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v3 = +[NSDate date];
  uint64_t v2 = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_MIN];
  [v1 _workQueueReschedule:8 startDate:v3 gracePeriod:v2 priority:XPC_ACTIVITY_PRIORITY_UTILITY repeatingInterval:0];
}

id sub_10001ECE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _workQueueReschedule:*(void *)(a1 + 64) startDate:*(void *)(a1 + 40) gracePeriod:*(void *)(a1 + 48) priority:*(void *)(a1 + 72) repeatingInterval:*(void *)(a1 + 56)];
}

uint64_t sub_1000200E8(uint64_t a1, int a2, void *a3)
{
  int v5 = a3;
  id v6 = v5;
  if (a2 == 2)
  {
    CFIndex v9 = v5;
    int v5 = (uint64_t (**)(id, uint64_t))[*(id *)(a1 + 40) _showPromptForHomePodAndWatchWithCompletionBlock:*(void *)(a1 + 32)];
  }
  else if (a2 == 1)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (!v7) {
      goto LABEL_9;
    }
    CFIndex v9 = v5;
    int v5 = (uint64_t (**)(id, uint64_t))(*(uint64_t (**)(uint64_t, id))(v7 + 16))(v7, +[MCProfile thisDeviceType]);
  }
  else
  {
    int v5 = *(uint64_t (***)(id, uint64_t))(a1 + 32);
    if (!v5) {
      goto LABEL_9;
    }
    CFIndex v9 = v6;
    int v5 = (uint64_t (**)(id, uint64_t))v5[2](v5, 99);
  }
  id v6 = v9;
LABEL_9:

  return _objc_release_x1(v5, v6);
}

uint64_t sub_100020300(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v3 = 99;
    if (a2 == 2) {
      uint64_t v3 = 2;
    }
    if (a2 == 1) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = v3;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  }
  return result;
}

uint64_t sub_10002049C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v10 = v5;
  if (a2 == 2)
  {
    uint64_t v7 = 3;
  }
  else if (a2 == 1)
  {
    id v6 = +[MCProfile thisDeviceType];
    id v5 = v10;
    uint64_t v7 = (uint64_t)v6;
  }
  else
  {
    uint64_t v7 = 99;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, v7, v5);
  }

  return _objc_release_x2();
}

uint64_t sub_100020698(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v10 = v5;
  if (a2 == 2)
  {
    uint64_t v7 = 2;
  }
  else if (a2 == 1)
  {
    id v6 = +[MCProfile thisDeviceType];
    id v5 = v10;
    uint64_t v7 = (uint64_t)v6;
  }
  else
  {
    uint64_t v7 = 99;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, v7, v5);
  }

  return _objc_release_x2();
}

void sub_1000215BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000215E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000215F0(uint64_t a1)
{
}

void sub_1000215F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100021850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100021868(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_1000261F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v26 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * v8);
      id v10 = [v3 identifier];
      id v11 = [v9 identifier];
      unsigned __int8 v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_18;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v13 = (uint64_t)[v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
LABEL_11:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v4);
      }
      uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
      id v17 = [v3 identifier:v21];
      os_log_t v18 = [v16 identifier];
      unsigned __int8 v19 = [v17 isEqual:v18];

      if (v19) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = (uint64_t)[v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v13) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    uint64_t v13 = 1;
  }
LABEL_19:

  return v13;
}

void sub_1000274D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_100027534(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100027544(uint64_t a1)
{
}

intptr_t sub_10002754C(void *a1, uint64_t a2, id obj)
{
  if (obj)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), obj);
  }
  else
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
    CFRetain(*(CFTypeRef *)(*(void *)(a1[5] + 8) + 24));
  }
  id v4 = *(NSObject **)(*(void *)(a1[6] + 8) + 40);

  return dispatch_semaphore_signal(v4);
}

id sub_10002AB88(uint64_t a1)
{
  return +[MailAccount setMailAccounts:*(void *)(a1 + 32)];
}

id sub_10002AB9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) savePersistentAccount];
}

id sub_10002ABA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) savePersistentAccount];
}

void sub_10002FF30(uint64_t a1)
{
  uint64_t v2 = sharedDAAccountStore();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100030008;
  v5[3] = &unk_1000EB8F8;
  id v6 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 56);
  [v2 removeAccount:v3 withDataclassActions:v4 completion:v5];
}

void sub_100030008(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  os_log_t v6 = _MCLogObjects[0];
  if (a2)
  {
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    int v14 = 138543362;
    uint64_t v15 = v7;
    id v8 = "Finished removing account with identifier: %{public}@";
    uint64_t v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    uint32_t v11 = 12;
  }
  else
  {
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    int v14 = 138543618;
    uint64_t v15 = v12;
    __int16 v16 = 2114;
    id v17 = v5;
    id v8 = "Couldn't remove the account with identifier %{public}@: %{public}@";
    uint64_t v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 22;
  }
  _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v14, v11);
LABEL_7:
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10003328C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = _MCLogObjects[12];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Recompute Profile Restrictions error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_10003333C(uint64_t a1)
{
  uint64_t v3 = +[MCRestrictionManager sharedManager];
  int v4 = [v3 currentRestrictions];

  id v5 = +[MCRestrictionManager sharedManager];
  os_log_t v6 = [v5 effectiveUserSettings];

  uint64_t v7 = +[MCServerSideHacks sharedHacks];
  [v7 setUserTrackingTCCAccessOverrideForRestrictions:v4];

  id v8 = +[MCServerSideHacks sharedHacks];
  [v8 _applyServerSideChangesWithOldRestrictions:&__NSDictionary0__struct newRestrictions:v4 oldEffectiveUserSettings:&__NSDictionary0__struct newEffectiveUserSettings:v6];

  uint64_t v9 = +[MCRestrictionManagerWriter sharedManager];
  [v9 recomputeEffectiveUserSettingsPasscode:0];

  MCSendSettingsChangedNotification();
  getpid();
  MCSendEffectiveSettingsChangedNotification();
  MCSendProfileListChangedNotification();
  [*(id *)(a1 + 32) _wakeDaemonsPostMigration];
}

void sub_1000375B8(id a1)
{
  id v1 = MCTagsMappingFilePath();
  uint64_t v2 = +[NSDictionary dictionaryWithContentsOfFile:v1];
  uint64_t v3 = (void *)qword_1001058B8;
  qword_1001058B8 = v2;

  if (qword_1001058B8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return;
    }
    int v4 = (void *)qword_1001058B8;
  }
  else
  {
    int v4 = 0;
  }
  qword_1001058B8 = 0;
}

void sub_10003A490(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = _MCLogObjects[12];
  if (v3)
  {
    if (os_log_type_enabled(_MCLogObjects[12], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      v9[0] = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Recompute Profile Restrictions error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(_MCLogObjects[12], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    os_log_t v6 = v4;
    LODWORD(v5) = [v5 count];
    unsigned int v7 = [*(id *)(a1 + 40) count];
    int v8 = 67109376;
    LODWORD(v9[0]) = v5;
    WORD2(v9[0]) = 1024;
    *(_DWORD *)((char *)v9 + 6) = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Done updating. %d system profile and %d user profile restrictions processed.", (uint8_t *)&v8, 0xEu);
  }
}

void sub_10003B314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003B334(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v15 = kMCMDMLostModeLastLocationRequestDateKey;
  uint64_t v16 = *(void *)(a1 + 32);
  int v4 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  if ([v4 writeToURL:v3 atomically:1])
  {
    v13[0] = NSFileProtectionKey;
    v13[1] = NSURLIsExcludedFromBackupKey;
    v14[0] = NSFileProtectionNone;
    v14[1] = &__kCFBooleanTrue;
    id v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    id v10 = 0;
    unsigned __int8 v6 = [v3 setResourceValues:v5 error:&v10];
    id v7 = v10;

    if ((v6 & 1) == 0)
    {
      int v8 = _MCLogObjects[12];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Could not write device last located time interval URL resource values: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v9 = _MCLogObjects[12];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not write device last located time interval", buf, 2u);
    }
  }
}

uint64_t sub_100040E28()
{
  return AnalyticsSendEventLazy();
}

NSDictionary *__cdecl sub_100040E3C(id a1)
{
  id v1 = objc_alloc_init((Class)NSMutableDictionary);
  +[MCDailyAnalyticsHelper addCloudConfigInfoWithEventPayload:v1];
  +[MCDailyAnalyticsHelper addMDMConfigInfoWithEventPayload:v1];
  +[MCDailyAnalyticsHelper addSharediPadInfoWithEventPayload:v1];
  +[MCDailyAnalyticsHelper addProfileAndPayloadInfoWithEventPayload:v1];
  +[MCDailyAnalyticsHelper addRestrictionInfoWithEventPayload:v1];
  +[MCDailyAnalyticsHelper addSettingsInfoWithEventPayload:v1];
  +[MCDailyAnalyticsHelper addPasscodeInfoWithEventPayload:v1];

  return (NSDictionary *)v1;
}

void sub_100041998(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = a3;
  if (+[MCRestrictionManager restrictedBoolForFeature:a2 withRestrictionsDictionary:v5] == 2)unsigned __int8 v6 = &__kCFBooleanTrue; {
  else
  }
    unsigned __int8 v6 = &__kCFBooleanFalse;
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
}

void sub_100041A2C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = a3;
  if (+[MCRestrictionManager restrictedBoolForFeature:a2 withRestrictionsDictionary:v5] == 1)unsigned __int8 v6 = &__kCFBooleanTrue; {
  else
  }
    unsigned __int8 v6 = &__kCFBooleanFalse;
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
}

void sub_100041AC0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v8 = +[MCRestrictionManager objectForFeature:a2 withRestrictionsDictionary:v5];
  if (v8) {
    id v7 = &__kCFBooleanTrue;
  }
  else {
    id v7 = &__kCFBooleanFalse;
  }
  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
}

void sub_100041B68(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v8 = +[MCRestrictionManager intersectedValuesForFeature:a2 withRestrictionsDictionary:v5];
  if (v8) {
    id v7 = &__kCFBooleanTrue;
  }
  else {
    id v7 = &__kCFBooleanFalse;
  }
  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
}

void sub_100041C10(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = +[MCRestrictionManager valueForFeature:a2 withRestrictionsDictionary:v5];
  id v8 = [v7 unsignedIntValue];

  id v9 = +[NSNumber numberWithUnsignedInt:v8];
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v6];
}

void sub_100042184(id a1)
{
  v4[0] = @"payload_count_airPlayConfiguration";
  v4[1] = @"payload_count_airPrintConfiguration";
  v4[2] = @"payload_count_alwaysOnVPN";
  v4[3] = @"payload_count_apn";
  v4[4] = @"payload_count_appLayerVPN";
  v4[5] = @"payload_count_calDAVAccount";
  v4[6] = @"payload_count_cardDAVAccount";
  v4[7] = @"payload_count_cellular";
  v4[8] = @"payload_count_dnsProxy";
  v4[9] = @"payload_count_dnsSettings";
  v4[10] = @"payload_count_domains";
  v4[11] = @"payload_count_exchangeAccount";
  v4[12] = @"payload_count_educationConfiguration";
  v4[13] = @"payload_count_emailAccount";
  v4[14] = @"payload_count_encryptedProfileService";
  v4[15] = @"payload_count_font";
  uint8_t v4[16] = @"payload_count_globalHTTPProxy";
  v4[17] = @"payload_count_googleAccount";
  v4[18] = @"payload_count_homeScreenLayout";
  v4[19] = @"payload_count_ldapAccount";
  v4[20] = @"payload_count_logging";
  v4[21] = @"payload_count_mdm";
  v4[22] = @"payload_count_networkUsageRules";
  v4[23] = @"payload_count_notificationSettings";
  v4[24] = @"payload_count_passwordPolicy";
  v4[25] = @"payload_count_plainCertificate";
  v4[26] = @"payload_count_restriction";
  v4[27] = @"payload_count_scep";
  v4[28] = @"payload_count_selfsignedcertificate";
  v4[29] = @"payload_count_sharedDeviceConfiguration";
  v4[30] = @"payload_count_singleAppMode";
  v4[31] = @"payload_count_singleSignOnAccount";
  v4[32] = @"payload_count_subCalAccount";
  v4[33] = @"payload_count_supervisionPolicy";
  v4[34] = @"payload_count_vpn";
  v4[35] = @"payload_count_wapiIdentityCertificate";
  v4[36] = @"payload_count_webClip";
  v4[37] = @"payload_count_webContentFilter";
  v4[38] = @"payload_count_wiFiNetwork";
  id v1 = +[NSArray arrayWithObjects:v4 count:39];
  uint64_t v2 = +[NSSet setWithArray:v1];
  id v3 = (void *)qword_1001058C8;
  qword_1001058C8 = v2;
}

void sub_100042400(id a1)
{
  v3[0] = kMCAirPlayPayloadType;
  v3[1] = kMCAirPrintPayloadType;
  v4[0] = @"payload_count_airPlayConfiguration";
  v4[1] = @"payload_count_airPrintConfiguration";
  v3[2] = kMCAlwaysOnVPNPayloadType;
  v3[3] = kMCAPNPayloadType;
  v4[2] = @"payload_count_alwaysOnVPN";
  v4[3] = @"payload_count_apn";
  v3[4] = kMCAppLayerVPNPayloadType;
  v3[5] = kMCCardDAVAccountPayloadType;
  v4[4] = @"payload_count_appLayerVPN";
  v4[5] = @"payload_count_cardDAVAccount";
  v3[6] = kMCCalDAVAccountPayloadType;
  v3[7] = kMCCellularPayloadType;
  v4[6] = @"payload_count_calDAVAccount";
  v4[7] = @"payload_count_cellular";
  v3[8] = kMCChaperonePayloadType;
  v3[9] = kMCCPRootType;
  v4[8] = @"payload_count_supervisionPolicy";
  v4[9] = @"payload_count_plainCertificate";
  v3[10] = kMCCPPKCS12Type;
  v3[11] = kMCCPPKCS1Type;
  v4[10] = @"payload_count_plainCertificate";
  v4[11] = @"payload_count_plainCertificate";
  v3[12] = kMCCPPEMType;
  v3[13] = kMCCWAPIType;
  v4[12] = @"payload_count_plainCertificate";
  v4[13] = @"payload_count_wapiIdentityCertificate";
  v3[14] = kMCDNSProxyPayloadType;
  v3[15] = kMCDNSSettingsPayloadType;
  v4[14] = @"payload_count_dnsProxy";
  v4[15] = @"payload_count_dnsSettings";
  uint8_t v3[16] = kMCDomainsPayloadType;
  v3[17] = kMCEASAccountPayloadType;
  uint8_t v4[16] = @"payload_count_domains";
  v4[17] = @"payload_count_exchangeAccount";
  v3[18] = kMCEncryptedProfileServicePayloadType;
  v3[19] = kMCEmailAccountPayloadType;
  v4[18] = @"payload_count_encryptedProfileService";
  v4[19] = @"payload_count_emailAccount";
  v3[20] = kMCFontPayloadType;
  v3[21] = kMCGlobalHTTPProxyPayloadType;
  v4[20] = @"payload_count_font";
  v4[21] = @"payload_count_globalHTTPProxy";
  v3[22] = kMCGmailAccountLegacyPayloadType;
  v3[23] = kMCGmailAccountPayloadType;
  v4[22] = @"payload_count_googleAccount";
  v4[23] = @"payload_count_googleAccount";
  v3[24] = kMCHomeScreenLayoutPayloadType;
  v3[25] = kMCLDAPAccountPayloadType;
  v4[24] = @"payload_count_homeScreenLayout";
  v4[25] = @"payload_count_ldapAccount";
  v3[26] = kMCLoggingPayloadType;
  v3[27] = kMCMDMPayloadType;
  v4[26] = @"payload_count_logging";
  v4[27] = @"payload_count_mdm";
  v3[28] = kMCNetworkUsageRulesPayloadType;
  v3[29] = kMCNotificationSettingsPayloadType;
  v4[28] = @"payload_count_networkUsageRules";
  v4[29] = @"payload_count_notificationSettings";
  v3[30] = kMCPasswordPolicyPayloadType;
  v3[31] = kMCRestrictionsPayloadType;
  v4[30] = @"payload_count_passwordPolicy";
  v4[31] = @"payload_count_restriction";
  v3[32] = kMCSCEPPayloadType;
  v3[33] = kMCSelfSignedCertificatePayloadType;
  v4[32] = @"payload_count_scep";
  v4[33] = @"payload_count_selfsignedcertificate";
  v3[34] = kMCSharedDeviceConfigurationPayloadType;
  v3[35] = kMCSingleAppPayloadType;
  v4[34] = @"payload_count_sharedDeviceConfiguration";
  v4[35] = @"payload_count_singleAppMode";
  v3[36] = kMCSingleSignOnPayloadType;
  v3[37] = kMCSubCalAccountPayloadType;
  v4[36] = @"payload_count_singleSignOnAccount";
  v4[37] = @"payload_count_subCalAccount";
  v3[38] = kMCVPNPayloadType;
  v3[39] = kMCWebClipPayloadType;
  v4[38] = @"payload_count_vpn";
  void v4[39] = @"payload_count_webClip";
  v3[40] = kMCWebContentFilterPayloadType;
  v3[41] = kMCWiFiPayloadType;
  v4[40] = @"payload_count_webContentFilter";
  v4[41] = @"payload_count_wiFiNetwork";
  v3[42] = kMCEDUClassroomPayloadType;
  v4[42] = @"payload_count_educationConfiguration";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:43];
  uint64_t v2 = (void *)qword_1001058D8;
  qword_1001058D8 = v1;
}

void sub_1000428E8(id a1)
{
  v3[0] = MCFeatureAccountModificationAllowed;
  v3[1] = MCFeatureActivityContinuationAllowed;
  v4[0] = @"restriction_allowAccountModification";
  v4[1] = @"restriction_allowActivityContinuation";
  v3[2] = MCFeatureAppInstallationAllowed;
  v3[3] = MCFeatureAppRemovalAllowed;
  v4[2] = @"restriction_allowAppInstallation";
  v4[3] = @"restriction_allowAppRemoval";
  v3[4] = MCFeatureAutoCorrectionAllowed;
  v3[5] = MCFeatureBluetoothModificationAllowed;
  v4[4] = @"restriction_allowAutoCorrection";
  v4[5] = @"restriction_allowBluetoothModification";
  v3[6] = MCFeatureCameraAllowed;
  v3[7] = MCFeatureCloudBackupAllowed;
  v4[6] = @"restriction_allowCamera";
  v4[7] = @"restriction_allowCloudBackup";
  v3[8] = MCFeatureCloudDocumentSyncAllowed;
  v3[9] = MCFeatureDefinitionLookupAllowed;
  v4[8] = @"restriction_allowCloudDocumentSync";
  v4[9] = @"restriction_allowDefinitionLookup";
  v3[10] = MCFeatureSelectedTextSharingAllowed;
  v3[11] = MCFeatureDeviceNameModificationAllowed;
  v4[10] = @"restriction_allowSelectedTextSharing";
  v4[11] = @"restriction_allowDeviceNameModification";
  v3[12] = MCFeatureEnablingRestrictionsAllowed;
  v3[13] = MCFeatureEnterpriseAppTrustAllowed;
  v4[12] = @"restriction_allowEnablingRestrictions";
  v4[13] = @"restriction_allowEnterpriseAppTrust";
  v3[14] = MCFeatureEnterpriseBookBackupAllowed;
  v3[15] = MCFeatureEnterpriseBookMetadataSyncAllowed;
  v4[14] = @"restriction_allowEnterpriseBookBackup";
  v4[15] = @"restriction_allowEnterpriseBookMetadataSync";
  uint8_t v3[16] = MCFeatureEraseContentAndSettingsAllowed;
  v3[17] = MCFeatureFingerprintUnlockAllowed;
  uint8_t v4[16] = @"restriction_allowEraseContentAndSettings";
  v4[17] = @"restriction_allowFingerprintForUnlock";
  v3[18] = MCFeatureHostPairingAllowed;
  v3[19] = MCFeatureManagedAppsCloudSyncAllowed;
  v4[18] = @"restriction_allowHostPairing";
  v4[19] = @"restriction_allowManagedAppsCloudSync";
  v3[20] = MCFeatureOpenFromManagedToUnmanagedAllowed;
  v3[21] = MCFeatureOpenFromUnmanagedToManagedAllowed;
  v4[20] = @"restriction_allowOpenFromManagedToUnmanaged";
  v4[21] = @"restriction_allowOpenFromUnmanagedToManaged";
  v3[22] = MCFeaturePairedWatchAllowed;
  v3[23] = MCFeaturePasscodeModificationAllowed;
  v4[22] = @"restriction_allowPairedWatch";
  v4[23] = @"restriction_allowPasscodeModification";
  v3[24] = MCFeaturePasscodeRecoveryAllowed;
  v3[25] = MCFeaturePredictiveKeyboardAllowed;
  v4[24] = @"restriction_allowPasscodeRecovery";
  v4[25] = @"restriction_allowPredictiveKeyboard";
  v3[26] = MCFeatureRemoteScreenObservationAllowed;
  v3[27] = MCFeatureSafariAllowed;
  v4[26] = @"restriction_allowRemoteScreenObservation";
  v4[27] = @"restriction_allowSafari";
  v3[28] = MCFeatureScreenShotAllowed;
  v3[29] = MCFeatureSpellCheckAllowed;
  v4[28] = @"restriction_allowScreenShot";
  v4[29] = @"restriction_allowSpellCheck";
  v3[30] = MCFeatureUIAppInstallationAllowed;
  v3[31] = MCFeatureAppClipsAllowed;
  v4[30] = @"restriction_allowUIAppInstallation";
  v4[31] = @"restriction_allowAppClips";
  v3[32] = MCFeatureUIConfigurationProfileInstallationAllowed;
  v3[33] = MCFeatureUntrustedTLSPromptAllowed;
  v4[32] = @"restriction_allowUIConfigurationProfileInstallation";
  v4[33] = @"restriction_allowUntrustedTLSPrompt";
  v3[34] = MCFeatureUSBRestrictedModeAllowed;
  v3[35] = MCFeatureWallpaperModificationAllowed;
  v4[34] = @"restriction_allowUSBRestrictedMode";
  v4[35] = @"restriction_allowWallpaperModification";
  v3[36] = MCFeatureiPhoneWidgetsOnMacAllowed;
  v3[37] = MCFeatureHiddenAppsAllowed;
  v4[36] = @"restriction_allowiPhoneWidgetsOnMac";
  v4[37] = @"restriction_allowHidingApps";
  v3[38] = MCFeatureLockedAppsAllowed;
  v4[38] = @"restriction_allowLockingApps";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:39];
  uint64_t v2 = (void *)qword_1001058E8;
  qword_1001058E8 = v1;
}

void sub_100042D80(id a1)
{
  v3[0] = MCFeatureAirDropUnmanagedForced;
  v3[1] = MCFeatureDelayedSoftwareUpdatesForced;
  v4[0] = @"restriction_forceAirDropUnmanaged";
  v4[1] = @"restriction_forceDelayedSoftwareUpdates";
  v3[2] = MCFeatureEncryptedBackupRequired;
  v3[3] = MCFeatureLimitAdTrackingForced;
  v4[2] = @"restriction_forceEncryptedBackup";
  v4[3] = @"restriction_forceLimitAdTracking";
  v3[4] = MCFeatureUnpairedExternalBootToRecoveryAllowed;
  v3[5] = MCFeatureWatchWristDetectRequired;
  v4[4] = @"restriction_allowUnpairedExternalBootToRecovery";
  v4[5] = @"restriction_forceWatchWristDetection";
  v3[6] = MCFeatureWiFiWhitelistingForced;
  v4[6] = @"restriction_forceWiFiWhitelisting";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:7];
  uint64_t v2 = (void *)qword_1001058F8;
  qword_1001058F8 = v1;
}

void sub_100042EF4(id a1)
{
  v3[0] = MCFeatureBlacklistedAppBundleIDs;
  v3[1] = MCFeatureAppLockBundleIDs;
  v4[0] = @"restriction_blacklistedAppBundleIDs";
  v4[1] = @"restriction_whitelistedAppBundleIDs";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  uint64_t v2 = (void *)qword_100105908;
  qword_100105908 = v1;
}

void sub_100042FEC(id a1)
{
  uint64_t v3 = MCFeatureAutonomousSingleAppModePermittedAppIDs;
  CFStringRef v4 = @"restriction_autonomousSingleAppModePermittedAppIDs";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  uint64_t v2 = (void *)qword_100105918;
  qword_100105918 = v1;
}

void sub_1000430CC(id a1)
{
  v3[0] = MCFeatureAutoLockTime;
  v3[1] = MCFeatureMinimumPasscodeLength;
  v4[0] = @"restriction_autoLockTime";
  v4[1] = @"restriction_minimumPasscodeLength";
  void v3[2] = MCFeaturePasscodeHistoryCount;
  v3[3] = MCFeaturePasscodeLockGraceTime;
  void v4[2] = @"restriction_passcodeHistory";
  v4[3] = @"restriction_passcodeLockGraceTime";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  uint64_t v2 = (void *)qword_100105928;
  qword_100105928 = v1;
}

void sub_1000431F4(id a1)
{
  v4[0] = @"settings_allowPasscodeRecovery";
  v4[1] = @"settings_allowUSBRestrictedMode";
  uint64_t v1 = +[NSArray arrayWithObjects:v4 count:2];
  uint64_t v2 = +[NSSet setWithArray:v1];
  uint64_t v3 = (void *)qword_100105938;
  qword_100105938 = v2;
}

void sub_1000432F4(id a1)
{
  v3[0] = MCFeaturePasscodeRecoveryAllowed;
  v3[1] = MCFeatureUSBRestrictedModeAllowed;
  v4[0] = @"settings_allowPasscodeRecovery";
  v4[1] = @"settings_allowUSBRestrictedMode";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  uint64_t v2 = (void *)qword_100105948;
  qword_100105948 = v1;
}

void sub_1000433EC(id a1)
{
  v4[0] = @"settings_allowLockdownMode";
  v4[1] = @"settings_forceLimitAdTracking";
  uint64_t v1 = +[NSArray arrayWithObjects:v4 count:2];
  uint64_t v2 = +[NSSet setWithArray:v1];
  uint64_t v3 = (void *)qword_100105958;
  qword_100105958 = v2;
}

void sub_1000434EC(id a1)
{
  v3[0] = MCFeatureLockdownModeAllowed;
  v3[1] = MCFeatureLimitAdTrackingForced;
  v4[0] = @"settings_allowLockdownMode";
  v4[1] = @"settings_forceLimitAdTracking";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  uint64_t v2 = (void *)qword_100105968;
  qword_100105968 = v1;
}

void sub_1000450E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100045110(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100045120(uint64_t a1)
{
}

void sub_100045128(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) complete];
}

void sub_100045488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000454B0(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) complete];
}

void sub_100045564(id a1)
{
  uint64_t v1 = objc_alloc_init(MCInstaller);
  uint64_t v2 = qword_100105988;
  qword_100105988 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id sub_10004579C()
{
  id v0 = (void *)qword_100105980;
  if (!qword_100105980)
  {
    uint64_t v1 = MCUserProfileStorageDirectory();
    uint64_t v2 = (void *)qword_100105980;
    qword_100105980 = v1;

    id v0 = (void *)qword_100105980;
  }

  return v0;
}

id sub_1000457EC()
{
  id v0 = (void *)qword_100105978;
  if (!qword_100105978)
  {
    uint64_t v1 = MCSystemProfileStorageDirectory();
    uint64_t v2 = (void *)qword_100105978;
    qword_100105978 = v1;

    id v0 = (void *)qword_100105978;
  }

  return v0;
}

id sub_100046220(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _queueProfileData:*(void *)(a1 + 40) profile:*(void *)(a1 + 48) forDevice:a2 completion:*(void *)(a1 + 56)];
}

void sub_100046234(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _targetDeviceErrorWithUnderlyingError:a2];
  os_log_t v4 = _MCLogObjects[9];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = v4;
    id v7 = +[MCProfile stringForDeviceType:](MCProfile, "stringForDeviceType:", [v5 targetDeviceType]);
    id v8 = [v3 MCVerboseDescription];
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Profile-defined target-device-type %{public}@ error: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void, void *, void, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3, *(void *)(a1 + 40), [*(id *)(a1 + 40) targetDeviceType]);
}

void sub_100046BE0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 56);
    id v9 = [*(id *)(a1 + 32) _uiProfileInstallationDisabledTopLevelErrorWithCause:MCErrorRestrictionCauseStolenDeviceProtection];
    (*(void (**)(uint64_t, id, void, void))(v3 + 16))(v3, v9, *(void *)(a1 + 40), *(void *)(a1 + 64));
  }
  else
  {
    os_log_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 48);
    [v4 _continueQueueingProfile:v5 profileData:v8 forDevice:v6 completion:v7];
  }
}

void sub_100047040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100047068(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100047078(uint64_t a1)
{
}

void sub_100047080(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  os_log_t v4 = [*(id *)(a1 + 48) identifier];
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v6 + 40);
  [v2 sendPurgatoryProfileData:v3 identifier:v4 targetDevice:v5 outError:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
}

void sub_100048154(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  os_log_t v5 = _MCLogObjects[9];
  if (v4)
  {
    if (os_log_type_enabled(_MCLogObjects[9], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 134349314;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      id v15 = v4;
      uint64_t v7 = "MCInstaller failed to update CDP with new passcode of type %{public}lu with error: %{public}@";
      uint64_t v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(_MCLogObjects[9], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 134349056;
    uint64_t v13 = v11;
    uint64_t v7 = "MCInstaller successfully updated CDP with new passcode of type: %{public}lu";
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

void sub_10004BD7C(_Unwind_Exception *a1)
{
}

void sub_10004BE8C(id a1)
{
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  void v3[2] = objc_opt_class();
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:3];
  uint64_t v2 = (void *)qword_100105998;
  qword_100105998 = v1;
}

void sub_10004BF2C(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  uint64_t v7 = *(void *)(a1[10] + 8);
  id obj = *(id *)(v7 + 40);
  unsigned __int8 v8 = [v2 _promptUserForMAIDSignIn:v3 personaID:v4 handler:v5 interactionClient:v6 outError:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = v8;
}

void sub_10004BF9C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v4 = [v3 profile];
  uint64_t v5 = [v4 organization];
  [v7 setAccountDescription:v5];

  [v7 setManagingOwnerIdentifier:kMCAccountManagingOwnerIdentifier];
  uint64_t v6 = [*(id *)(a1 + 40) friendlyName];
  [v7 setManagingSourceName:v6];

  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"MCAccountIsManaged"];
}

void sub_10004C068(uint64_t a1, int a2, int a3, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v6 = obj;
  [*(id *)(a1 + 32) lock];
  [*(id *)(a1 + 32) unlockWithCondition:0];
}

void sub_10004EEF4(id a1)
{
  uint64_t v1 = +[MCPayload remoteQueueableWatchPayloadClasses];
  uint64_t v2 = qword_1001059A8;
  qword_1001059A8 = v1;

  _objc_release_x1(v1, v2);
}

id sub_1000506A0(uint64_t a1)
{
  return +[MCKeychain removeItemWithPersistentID:*(void *)(a1 + 32) useSystemKeychain:1 enforcePersonalPersona:0];
}

void sub_100052848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100052860(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100052AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100052AF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 installOptions];
  uint64_t v5 = [v4 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v6)
  {
    unsigned int v7 = 0;
  }
  else
  {
    unsigned __int8 v8 = [v3 identifier];
    if ([v8 isEqualToString:*(void *)(a1 + 32)]) {
      unsigned int v7 = 0;
    }
    else {
      unsigned int v7 = [v3 containsOnlyPayloadsOfClasses:*(void *)(a1 + 40)];
    }
  }
  uint64_t v9 = v7 & [v3 isInstalledForSystem];

  return v9;
}

uint64_t sub_100052BB8(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 installOptions];
  uint64_t v5 = kMCInstallProfileOptionIsInstalledByMDM;
  unsigned __int8 v6 = [v4 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
  unsigned __int8 v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    id v8 = [v4 mutableCopy];
    [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:v5];
    [v8 setObject:a1[4] forKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier];
    if (v8)
    {
      id v9 = [v8 copy];
      [v3 setInstallOptions:v9];

      uint32_t v10 = MCSystemProfileStorageDirectory();
      [v3 writeStubToDirectory:v10];
    }
    uint64_t v11 = (void *)a1[5];
    int v12 = [v3 identifier];
    [v11 addObject:v12];

    uint64_t v13 = +[MCDependencyManager sharedManager];
    __int16 v14 = [v3 identifier];
    [v13 addDependent:v14 ofParent:a1[4] inDomain:kMCDMManagingProfileToManagedProfileKey reciprocalDomain:kMCDMManagedProfileToManagingProfileKey];

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }

  return 1;
}

void sub_1000534B0(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053558;
  block[3] = &unk_1000EBD80;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  uint64_t v8 = *(void *)(a1 + 48);
  dispatch_sync(v2, block);
}

id sub_100053558(uint64_t a1)
{
  sub_1000807D8(*(void **)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 purgePurgatoryProfilesForTargetDevice:v3];
}

id sub_100053A98(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgatoryWorkerQueue_didPurgePurgatory:1];
}

BOOL sub_10005414C(void *a1, void *a2)
{
  uint64_t v4 = (void *)MCBiometricKitClass();
  if (!v4) {
    return 0;
  }
  uint64_t v5 = [v4 manager];
  id v6 = [v5 getProtectedConfiguration];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"BKUserCfgTouchIDUnlockEnabled"];
    uint64_t v9 = [v7 objectForKeyedSubscript:@"BKUserCfgTouchIDApplePayEnabled"];
    BOOL v10 = (v8 | v9) != 0;
    if (v8 | v9)
    {
      if (a1) {
        *a1 = (id) v8;
      }
      if (a2) {
        *a2 = (id) v9;
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

_DWORD *sub_100054230(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void *)MCBiometricKitClass();
  if (v11)
  {
    int v12 = [v11 manager];
    uint64_t v13 = +[NSMutableDictionary dictionaryWithCapacity:2];
    __int16 v14 = v13;
    if (v7) {
      [v13 setObject:v7 forKeyedSubscript:@"BKUserCfgTouchIDUnlockEnabled"];
    }
    if (v8) {
      [v14 setObject:v8 forKeyedSubscript:@"BKUserCfgTouchIDApplePayEnabled"];
    }
    CFStringRef v38 = @"BKOptionAuthWithCredentialSet";
    if (v10)
    {
      id v15 = 0;
      id v16 = v10;
    }
    else
    {
      id v17 = v9;
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x3032000000;
      long long v35 = sub_1000546B4;
      long long v36 = sub_1000546C4;
      id v37 = (id)objc_opt_new();
      uint64_t v28 = 0;
      uint64_t v29 = &v28;
      uint64_t v30 = 0x2020000000;
      int v31 = 0;
      long long v27 = 0;
      int v18 = ACMContextCreate((uint64_t *)&v27);
      *((_DWORD *)v29 + 6) = v18;
      if (v18)
      {
        unsigned __int8 v19 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Couldn't create auth context: ACM err %d", buf, 8u);
        }
        id v16 = (id)v33[5];
        id v15 = 0;
      }
      else
      {
        uint64_t v20 = v27;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = sub_1000546CC;
        v41 = &unk_1000EBDD0;
        id v42 = v17;
        v43 = &v28;
        v44 = &v32;
        ACMContextGetExternalForm(v20, (uint64_t)buf);
        id v15 = v27;
        id v16 = (id)v33[5];
      }
      _Block_object_dispose(&v28, 8);
      _Block_object_dispose(&v32, 8);
    }
    id v39 = v16;
    long long v21 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    if (!v10) {

    }
    id v22 = [v12 setProtectedConfiguration:v14 withOptions:v21];
    long long v23 = _MCLogObjects[0];
    if (v22)
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Could not set fingerprint options: %{public}@ Status: %d", buf, 0x12u);
      }
      long long v24 = +[NSNumber numberWithInt:v22];
      long long v25 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCPasscodeErrorDomain, 5016, v25, MCErrorTypeFatal, v24, 0);
      id v15 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v14;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Set fingerprint options: %{public}@", buf, 0xCu);
      }
      if (v15)
      {
        ACMContextDelete(v15, 1);
        id v15 = 0;
      }
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void sub_100054688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va1, a5);
  va_start(va, a5);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000546B4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000546C4(uint64_t a1)
{
}

void sub_1000546CC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)a1[4];
  if (v6)
  {
    id v7 = [v6 dataUsingEncoding:4];
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = sub_1000A0F54(0, (const char *)[v7 bytes], (uint64_t)[v7 length], a2, a3);
    if (*(_DWORD *)(*(void *)(a1[5] + 8) + 24))
    {
      uint64_t v8 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        int v9 = *(_DWORD *)(*(void *)(a1[5] + 8) + 24);
        v13[0] = 67109120;
        v13[1] = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Couldn't verify input passcode: MKB err %d", (uint8_t *)v13, 8u);
      }

      return;
    }
  }
  uint64_t v10 = +[NSData dataWithBytes:a2 length:a3];
  uint64_t v11 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void *)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  _objc_release_x1(v10, v12);
}

uint64_t sub_1000595E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100059708(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, BOOL, id))(v4 + 16))(v4, [a2 count] != 0, v5);
}

void sub_100059B40(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v1 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Checking for any MDM NotNow response to retry...", v3, 2u);
    }
    uint64_t v2 = +[MDMClient sharedClient];
    [v2 retryNotNowResponse];
  }
}

uint64_t sub_100059F2C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_100059F40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10005A220(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005A2F4;
    block[3] = &unk_1000EBE48;
    id v10 = v6;
    int v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t sub_10005A2F4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 48), *(void *)(a1 + 32));
}

void sub_10005A30C(uint64_t a1, int a2, void *a3)
{
  id v14 = a3;
  switch(a2)
  {
    case 0:
      id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      goto LABEL_5;
    case 1:
    case 2:
      id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_5:
      v5();
      goto LABEL_8;
    case 3:
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v12 = MCFeaturePromptErrorDomain;
      uint64_t v8 = MCErrorArray();
      uint64_t v9 = MCErrorTypeFatal;
      uint64_t v10 = v12;
      uint64_t v11 = 50000;
      goto LABEL_7;
    default:
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = MCFeaturePromptErrorDomain;
      uint64_t v8 = MCErrorArray();
      uint64_t v9 = MCErrorTypeFatal;
      uint64_t v10 = v7;
      uint64_t v11 = 50001;
LABEL_7:
      uint64_t v13 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v10, v11, v8, v9, 0);
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v13);

LABEL_8:

      return;
  }
}

void sub_10005A658(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005A724;
    v6[3] = &unk_1000EAEF0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t sub_10005A724(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10005A738(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10005E704()
{
  id v0 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "eapolConfigurationAPIEnabled: returning FALSE", v1, 2u);
  }
}

void sub_1000639C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100063A00(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100063A10(uint64_t a1)
{
}

intptr_t sub_100063A18(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

intptr_t sub_100063A34(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = sharedDAAccountStore();
  uint64_t v6 = [*(id *)(a1 + 32) backingAccountInfo];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100063B18;
  v8[3] = &unk_1000EBE98;
  int8x16_t v9 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  [v5 saveVerifiedAccount:v6 withCompletionHandler:v8];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t sub_100063B18(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = MCSubCalErrorDomain;
    id v5 = a3;
    uint64_t v6 = MCErrorArray();
    uint64_t v7 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 16000, v6, v5, MCErrorTypeFatal, 0);

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    int8x16_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  uint64_t v10 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return dispatch_semaphore_signal(v10);
}

void sub_100064150(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    os_log_t v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = v6;
      int8x16_t v9 = [v7 identifier];
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to save set aside account %{public}@ back in place", (uint8_t *)&v10, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100065904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006592C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10006593C(uint64_t a1)
{
}

void sub_100065944(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100065EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100065F00(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

intptr_t sub_100065F1C(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = sharedDAAccountStore();
  os_log_t v6 = [*(id *)(a1 + 32) backingAccountInfo];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100066000;
  v8[3] = &unk_1000EBE98;
  int8x16_t v9 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  [v5 saveVerifiedAccount:v6 withCompletionHandler:v8];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t sub_100066000(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = MCCalDAVErrorDomain;
    id v5 = a3;
    os_log_t v6 = MCErrorArray();
    uint64_t v7 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 17000, v6, v5, MCErrorTypeFatal, 0);

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    int8x16_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  int v10 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return dispatch_semaphore_signal(v10);
}

void sub_100066638(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    os_log_t v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = v6;
      int8x16_t v9 = [v7 identifier];
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to save set aside account %{public}@ back in place", (uint8_t *)&v10, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100066998(id a1)
{
  uint64_t v1 = objc_alloc_init(MCProvisioningProfileJanitor);
  uint64_t v2 = qword_1001059C0;
  qword_1001059C0 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_100066AE8(uint64_t a1)
{
  uint64_t v2 = _MCLogObjects[11];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MCProvisioningProfileJanitor updating MIS trust...", buf, 2u);
  }
  uint64_t v3 = +[MCRestrictionManager sharedManager];
  uint64_t v4 = [v3 effectiveUnionValuesForSetting:MCFeatureTrustedCodeSigningIdentities];

  id v5 = [*(id *)(a1 + 32) profileTrust];
  [v5 updateTrustedCodeSigningIdentities:v4 validateBundleIDs:*(void *)(a1 + 40) validateManagedApps:*(unsigned __int8 *)(a1 + 64)];

  os_log_t v6 = +[MDMProvisioningProfileTrust allTrustedSignerIdentities];
  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v12 = 0;
    [v7 _updateMCTrustedCodeSigningIdentities:v6 outError:&v12];
    id v8 = v12;
  }
  else
  {
    int8x16_t v9 = _MCLogObjects[2];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "MCProvisioningProfileJanitor skipping MCFeatureTrustedCodeSigningIdentities update after MIS enumeration failed", v11, 2u);
    }
    id v8 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);
  }
}

intptr_t sub_100066FE8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000670E8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueSystemDomainsDict];
  uint64_t v3 = +[MCDependencyReader systemStoragePath];
  [v2 MCWriteToBinaryFile:v3];

  uint64_t v4 = [*(id *)(a1 + 32) memberQueueUserDomainsDict];
  id v5 = +[MCDependencyReader userStoragePath];
  [v4 MCWriteToBinaryFile:v5];

  os_log_t v6 = [*(id *)(a1 + 32) memberQueueSystemOrphansDict];
  [v6 removeAllObjects];

  uint64_t v7 = [*(id *)(a1 + 32) memberQueueUserOrphansDict];
  [v7 removeAllObjects];

  MCSendDependencyChangedNotification();
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    int8x16_t v9 = dispatch_get_global_queue(0, 0);
    dispatch_async(v9, v8);
  }
}

void sub_100067758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100067770(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100067780(uint64_t a1)
{
}

void sub_100067788(uint64_t a1)
{
  uint64_t v9 = [*(id *)(a1 + 32) memberQueueOrphanedParentsInSystemDomain:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueOrphanedParentsInUserDomain:*(void *)(a1 + 40)];
  if (v9 | v2)
  {
    uint64_t v3 = +[NSMutableSet set];
    if (v9)
    {
      uint64_t v4 = [(id)v9 allObjects];
      [v3 addObjectsFromArray:v4];
    }
    if (v2)
    {
      id v5 = [(id)v2 allObjects];
      [v3 addObjectsFromArray:v5];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v6 = [v3 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_1000679B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000679C8(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) memberQueueOrphanedParentsInSystemDomain:*(void *)(a1 + 40)];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100067B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100067B74(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) memberQueueOrphanedParentsInUserDomain:*(void *)(a1 + 40)];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_100067E74(uint64_t a1)
{
  return [*(id *)(a1 + 32) memberQueueAddDependent:*(void *)(a1 + 40) toParent:*(void *)(a1 + 48) inDomain:*(void *)(a1 + 56) toSystem:*(unsigned __int8 *)(a1 + 64) user:*(unsigned __int8 *)(a1 + 65)];
}

void sub_100068338(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) memberQueueDependentsOfParent:*(void *)(a1 + 40) inSystemDomain:*(void *)(a1 + 48)];
  id v3 = [v2 count];

  uint64_t v4 = [*(id *)(a1 + 32) memberQueueDependentsOfParent:*(void *)(a1 + 40) inUserDomain:*(void *)(a1 + 48)];
  id v5 = [v4 count];

  [*(id *)(a1 + 32) memberQueueRemoveDependent:*(void *)(a1 + 56) fromParent:*(void *)(a1 + 40) inDomain:*(void *)(a1 + 48) fromSystem:*(unsigned __int8 *)(a1 + 64) user:*(unsigned __int8 *)(a1 + 65)];
  id v6 = [*(id *)(a1 + 32) memberQueueDependentsOfParent:*(void *)(a1 + 40) inSystemDomain:*(void *)(a1 + 48)];
  id v7 = [v6 count];

  id v8 = [*(id *)(a1 + 32) memberQueueDependentsOfParent:*(void *)(a1 + 40) inUserDomain:*(void *)(a1 + 48)];
  id v9 = [v8 count];

  if (v3) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  char v11 = v10;
  if (v5) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  int v13 = v12;
  if ((v11 & 1) != 0 || v13)
  {
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    [v14 memberQueueAddOrphanParent:v15 inDomain:v16 toSystem:0 user:0];
  }
}

id sub_100068894(uint64_t a1)
{
  [*(id *)(a1 + 32) memberQueueAddDependent:*(void *)(a1 + 40) toParent:*(void *)(a1 + 48) inDomain:*(void *)(a1 + 56) toSystem:*(unsigned __int8 *)(a1 + 72) user:*(unsigned __int8 *)(a1 + 73)];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 73);

  return [v4 memberQueueAddDependent:v2 toParent:v3 inDomain:v5 toSystem:v6 user:v7];
}

id sub_100068A38(uint64_t a1)
{
  [*(id *)(a1 + 32) memberQueueRemoveDependent:*(void *)(a1 + 40) fromParent:*(void *)(a1 + 48) inDomain:*(void *)(a1 + 56) fromSystem:*(unsigned __int8 *)(a1 + 72) user:*(unsigned __int8 *)(a1 + 73)];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 73);

  return [v4 memberQueueRemoveDependent:v2 fromParent:v3 inDomain:v5 fromSystem:v6 user:v7];
}

void sub_10006A19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006A1C4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10006A1D4(uint64_t a1)
{
}

void sub_10006A1DC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10006A79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10006A7D8(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

intptr_t sub_10006A7F4(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = sharedDAAccountStore();
  uint64_t v6 = [*(id *)(a1 + 32) backingAccountInfo];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006A8D8;
  v8[3] = &unk_1000EBE98;
  int8x16_t v9 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  [v5 saveVerifiedAccount:v6 withCompletionHandler:v8];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t sub_10006A8D8(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = MCLDAPErrorDomain;
    id v5 = a3;
    uint64_t v6 = MCErrorArray();
    uint64_t v7 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 19000, v6, v5, MCErrorTypeFatal, 0);

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    int8x16_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  BOOL v10 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return dispatch_semaphore_signal(v10);
}

void sub_10006AF10(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    os_log_t v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = v6;
      int8x16_t v9 = [v7 identifier];
      int v10 = 138543362;
      char v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to save set aside account %{public}@ back in place", (uint8_t *)&v10, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10006C8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006C8D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10006C8E4(uint64_t a1)
{
}

void sub_10006C8EC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10006CEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10006CEE8(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

intptr_t sub_10006CF04(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = sharedDAAccountStore();
  os_log_t v6 = [*(id *)(a1 + 32) backingAccountInfo];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006CFE8;
  v8[3] = &unk_1000EBE98;
  int8x16_t v9 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  [v5 saveVerifiedAccount:v6 withCompletionHandler:v8];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t sub_10006CFE8(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = MCCardDAVErrorDomain;
    id v5 = a3;
    os_log_t v6 = MCErrorArray();
    uint64_t v7 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 20000, v6, v5, MCErrorTypeFatal, 0);

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    int8x16_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  int v10 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return dispatch_semaphore_signal(v10);
}

void sub_10006D620(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    os_log_t v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = v6;
      int8x16_t v9 = [v7 identifier];
      int v10 = 138543362;
      char v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to save set aside account %{public}@ back in place", (uint8_t *)&v10, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10006D8A0(id a1)
{
  uint64_t v1 = objc_alloc_init(MCWatchSettingsMirror);
  uint64_t v2 = qword_1001059D0;
  qword_1001059D0 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_10006E2C8(id a1)
{
  v75[0] = @"com.apple.aac";
  v73[0] = @"bundlePath";
  v73[1] = @"loaderClass";
  v74[0] = @"/System/Library/PrivateFrameworks/AACCore.framework/AACCore";
  v74[1] = @"AEAssessmentAgentService";
  v73[2] = @"loaderSelector";
  v73[3] = @"canOverrideRestrictions";
  v74[2] = @"setOfActiveRestrictionUUIDs:";
  v74[3] = &__kCFBooleanTrue;
  long long v26 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:4];
  v76[0] = v26;
  v75[1] = @"com.apple.accessibility.unmanaged.asam";
  v71[0] = @"bundlePath";
  v71[1] = @"loaderClass";
  v72[0] = @"/System/Library/PrivateFrameworks/AccessibilityUtilities.framework/AccessibilityUtilities";
  v72[1] = @"AXMobileConfigurationInterface";
  v71[2] = @"loaderSelector";
  v72[2] = @"activeRestrictionIdentifiers";
  long long v25 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:3];
  v76[1] = v25;
  v75[2] = @"com.apple.batterysaver";
  v69[0] = @"bundlePath";
  v69[1] = @"loaderClass";
  v70[0] = @"/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration";
  v70[1] = @"MCBatterySaverMode";
  v69[2] = @"loaderSelector";
  v70[2] = @"setOfActiveRestrictionUUIDs";
  long long v24 = +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:3];
  v76[2] = v24;
  v75[3] = @"com.apple.carousel.noplaytime";
  CFStringRef v67 = @"neverOrphanCheck";
  v68 = &__kCFBooleanTrue;
  long long v23 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
  v76[3] = v23;
  v75[4] = @"com.apple.dmd";
  v65[0] = @"bundlePath";
  v65[1] = @"loaderClass";
  v66[0] = @"/System/Library/PrivateFrameworks/DeviceManagement.framework/DeviceManagement";
  v66[1] = @"DMFConfigurationSourceClient";
  v65[2] = @"loaderSelector";
  v65[3] = @"orphanCheckMayFail";
  v66[2] = @"setOfActiveRestrictionUUIDs";
  v66[3] = &__kCFBooleanTrue;
  id v22 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:4];
  v76[4] = v22;
  v75[5] = @"com.apple.FaceTime";
  CFStringRef v63 = @"neverOrphanCheck";
  v64 = &__kCFBooleanTrue;
  long long v21 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  v76[5] = v21;
  v75[6] = @"com.apple.eas.account";
  v61[0] = @"bundlePath";
  v61[1] = @"loaderClass";
  v62[0] = @"/System/Library/PrivateFrameworks/DataAccess.framework/DataAccess";
  v62[1] = @"DAAccount";
  v61[2] = @"loaderSelector";
  v61[3] = @"recomputeComplianceSelector";
  v62[2] = @"oneshotListOfAccountIDs";
  v62[3] = @"reacquireClientRestrictions:";
  uint64_t v20 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:4];
  v76[6] = v20;
  v75[7] = @"com.apple.itunesstored";
  v59[0] = @"bundlePath";
  v59[1] = @"loaderClass";
  v60[0] = @"/System/Library/PrivateFrameworks/StoreServices.framework/StoreServices";
  v60[1] = @"SSRestrictions";
  v59[2] = @"loaderSelector";
  v60[2] = @"setOfActiveRestrictionUUIDs";
  unsigned __int8 v19 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:3];
  v76[7] = v19;
  v75[8] = @"com.apple.lsd.appremoval";
  CFStringRef v57 = @"neverOrphanCheck";
  v58 = &__kCFBooleanTrue;
  int v18 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  v76[8] = v18;
  v75[9] = @"com.apple.managedconfiguration.profilectl";
  v55[0] = @"neverOrphanCheck";
  v55[1] = @"canOverrideRestrictions";
  v56[0] = &__kCFBooleanTrue;
  v56[1] = &__kCFBooleanTrue;
  id v17 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
  v76[9] = v17;
  v75[10] = @"com.apple.ManagedSettings";
  v53[0] = @"bundlePath";
  v53[1] = @"loaderClass";
  v54[0] = @"/System/Library/PrivateFrameworks/ManagedSettingsObjC.framework/ManagedSettingsObjC";
  v54[1] = @"MOEffectiveSettingsStore";
  v53[2] = @"loaderSelector";
  v53[3] = @"orphanCheckMayFail";
  v54[2] = @"setOfActiveRestrictionUUIDs";
  v54[3] = &__kCFBooleanTrue;
  uint64_t v16 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:4];
  v76[10] = v16;
  v75[11] = @"com.apple.mobilestoredemod";
  CFStringRef v51 = @"neverOrphanCheck";
  v52 = &__kCFBooleanTrue;
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  v76[11] = v15;
  v75[12] = @"com.apple.NanoBooksRestrictions";
  CFStringRef v49 = @"neverOrphanCheck";
  v50 = &__kCFBooleanTrue;
  id v14 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
  v76[12] = v14;
  v75[13] = @"com.apple.Passbook";
  v47[0] = @"bundlePath";
  v47[1] = @"loaderClass";
  v48[0] = @"/System/Library/PrivateFrameworks/PassKitCore.framework/PassKitCore";
  v48[1] = @"PKWalletVisibility";
  v47[2] = @"loaderSelector";
  v48[2] = @"setOfActiveRestrictionUUIDs";
  int v13 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:3];
  v76[13] = v13;
  v75[14] = @"com.apple.Preferences";
  CFStringRef v45 = @"neverOrphanCheck";
  v46 = &__kCFBooleanTrue;
  BOOL v12 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  v76[14] = v12;
  v75[15] = @"com.apple.profiled.appenforced";
  v43[0] = @"bundlePath";
  v43[1] = @"loaderClass";
  v44[0] = @"/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration";
  v44[1] = @"MCAppEnforcedRestrictions";
  v43[2] = @"loaderSelector";
  v44[2] = @"setOfActiveRestrictionUUIDs";
  char v11 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];
  v76[15] = v11;
  v75[16] = @"com.apple.profiled.trustedcodesigningidentities";
  CFStringRef v41 = @"neverOrphanCheck";
  id v42 = &__kCFBooleanTrue;
  int v10 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  v76[16] = v10;
  v75[17] = @"com.apple.remotemanagementd";
  CFStringRef v39 = @"neverOrphanCheck";
  id v40 = &__kCFBooleanTrue;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  v76[17] = v1;
  v75[18] = @"com.apple.siri.parsec.HashtagImagesApp";
  v37[0] = @"bundlePath";
  v37[1] = @"loaderClass";
  v38[0] = @"/System/Library/PrivateFrameworks/CoreParsec.framework/CoreParsec";
  v38[1] = @"PARHashtagImagesVisibility";
  v37[2] = @"loaderSelector";
  v38[2] = @"setOfActiveRestrictionUUIDs";
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
  v76[18] = v2;
  v75[19] = @"com.apple.siri.parsec.news";
  v35[0] = @"bundlePath";
  v35[1] = @"loaderClass";
  v36[0] = @"/System/Library/PrivateFrameworks/CoreParsec.framework/CoreParsec";
  v36[1] = @"PARNewsVisibility";
  v35[2] = @"loaderSelector";
  v36[2] = @"setOfActiveRestrictionUUIDs";
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
  v76[19] = v3;
  v75[20] = @"com.apple.springboard";
  CFStringRef v33 = @"neverOrphanCheck";
  uint64_t v34 = &__kCFBooleanTrue;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  v76[20] = v4;
  v75[21] = @"com.apple.studentd";
  v31[0] = @"bundlePath";
  v31[1] = @"loaderClass";
  v32[0] = @"/System/Library/PrivateFrameworks/ClassroomKit.framework/ClassroomKit";
  v32[1] = @"CRKClassroomConfiguration";
  v31[2] = @"loaderSelector";
  v32[2] = @"setOfActiveRestrictionUUIDs:";
  id v5 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
  v76[21] = v5;
  v75[22] = @"com.apple.WatchListKit.isTVAllowed";
  CFStringRef v29 = @"neverOrphanCheck";
  uint64_t v30 = &__kCFBooleanTrue;
  os_log_t v6 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  v76[22] = v6;
  v75[23] = @"NanoPreferencesSync";
  CFStringRef v27 = @"neverOrphanCheck";
  uint64_t v28 = &__kCFBooleanTrue;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  v76[23] = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:24];
  int8x16_t v9 = (void *)qword_1001059E0;
  qword_1001059E0 = v8;
}

void sub_100071794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000717B4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000717C4(uint64_t a1)
{
}

void sub_1000717CC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100071B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100071B58(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = (void *)*((void *)WeakRetained + 7);
    int8x16_t v9 = +[DASharedAccountProperties DAAccountDoNotSaveReason];
    [v8 removeAccountPropertyForKey:v9];

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v11, v5);
    }
  }
}

void sub_100071E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100071E8C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100071F30;
  v5[3] = &unk_1000EB880;
  uint64_t v7 = *(void *)(a1 + 64);
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v6 = v4;
  [v1 _preflightWithPreflighter:v2 completionHandler:v5];
}

void sub_100071F30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000731E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 152), 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10007323C(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

intptr_t sub_100073258(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = sharedDAAccountStore();
  id v6 = [*(id *)(a1 + 32) backingAccountInfo];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007333C;
  v8[3] = &unk_1000EBE98;
  int8x16_t v9 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  [v5 saveVerifiedAccount:v6 withCompletionHandler:v8];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t sub_10007333C(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = MCEASErrorDomain;
    id v5 = a3;
    id v6 = MCErrorArray();
    uint64_t v7 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 21004, v6, v5, MCErrorTypeFatal, 0);

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    int8x16_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  uint64_t v10 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return dispatch_semaphore_signal(v10);
}

void sub_1000737EC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    os_log_t v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = v6;
      int8x16_t v9 = [v7 identifier];
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to save set aside account %{public}@ back in place", (uint8_t *)&v10, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100074044(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(a1);
    uint64_t v4 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)(v2 - 160) = 138543362;
      *(void *)(v2 - 156) = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Caught exception %{public}@ while attempting to remove an account restrictions.", (uint8_t *)(v2 - 160), 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x100073FE8);
  }
  _Unwind_Resume(a1);
}

void sub_10007414C(uint64_t a1)
{
  uint64_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 64);
    *(_DWORD *)buf = 136315650;
    uint64_t v14 = "-[MCNewEASAccountPayloadHandler remove]_block_invoke";
    __int16 v15 = 2114;
    uint64_t v16 = v3;
    __int16 v17 = 1024;
    int v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s - Will reset credential for account: %{public}@, use old password? %d", buf, 0x1Cu);
  }
  uint64_t v5 = 48;
  if (!*(unsigned char *)(a1 + 64)) {
    uint64_t v5 = 56;
  }
  uint64_t v6 = *(void *)(a1 + v5);
  uint64_t v7 = [*(id *)(a1 + 40) backingAccountInfo];
  [v7 setCredential:v6];

  uint64_t v8 = [*(id *)(a1 + 40) backingAccountInfo];
  [v8 setAuthenticated:1];

  int8x16_t v9 = sharedDAAccountStore();
  int v10 = [*(id *)(a1 + 40) backingAccountInfo];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000742FC;
  v11[3] = &unk_1000EC0A0;
  id v12 = *(id *)(a1 + 40);
  [v9 saveVerifiedAccount:v10 withCompletionHandler:v11];
}

void sub_1000742FC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    os_log_t v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = v6;
      int8x16_t v9 = [v7 backingAccountInfo];
      int v10 = [v9 identifier];
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error saving account %{public}@. Error: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

void sub_100075C44(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100075C7C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100075C8C(uint64_t a1)
{
}

void sub_100075C94(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000778D8(id a1)
{
  uint64_t v1 = MCGetBaseResourcePath();
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"enforcedAppWhitelistRestrictions.plist"];
  id v5 = +[NSData dataWithContentsOfFile:v2];

  uint64_t v3 = +[NSPropertyListSerialization MCSafePropertyListWithData:v5 options:0 format:0 error:0];
  id v4 = (void *)qword_1001059F0;
  qword_1001059F0 = v3;
}

void sub_100077CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100077CCC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100077CDC(uint64_t a1)
{
}

void sub_100077CE4(uint64_t a1)
{
  char v50 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueRestrictions];
  id v3 = [v2 copy];

  id v4 = [*(id *)(a1 + 32) memberQueueCombinedSystemProfileRestrictions];
  id v5 = [v4 copy];

  os_log_t v6 = [*(id *)(a1 + 32) memberQueueRestrictions];
  uint64_t v7 = [*(id *)(a1 + 32) defaultRestrictions];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  int v10 = [*(id *)(a1 + 32) memberQueueSystemClientRestrictions];
  int v11 = [*(id *)(a1 + 32) memberQueueUserClientRestrictions];
  id v49 = 0;
  id v12 = +[MCRestrictionManagerWriter restrictionsWithCurrentRestrictions:v6 defaultRestrictions:v7 systemProfileRestrictions:v9 userProfileRestrictions:v8 systemClientRestrictions:v10 userClientRestrictions:v11 outRestrictionsChanged:&v50 outError:&v49];
  id v13 = v49;

  if (!v12) {
    goto LABEL_28;
  }
  id v48 = v5;
  unsigned int v47 = [*(id *)(a1 + 32) applyConfiguration:*(void *)(a1 + 40) toDomain:6 inNamespace:0 fromSender:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) applyConfiguration:*(void *)(a1 + 48) toDomain:7 inNamespace:0 fromSender:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) applyConfiguration:v12 toDomain:5 inNamespace:0 fromSender:*(void *)(a1 + 56)];
  uint64_t v14 = *(void **)(a1 + 40);
  __int16 v15 = MCSystemProfileRestrictionsFilePath();
  [v14 MCWriteToBinaryFile:v15];

  uint64_t v16 = *(void **)(a1 + 48);
  __int16 v17 = MCUserProfileRestrictionsFilePath();
  [v16 MCWriteToBinaryFile:v17];

  [*(id *)(a1 + 32) memberQueueCommitRestrictionsToDisk];
  int v18 = [*(id *)(a1 + 32) memberQueueEffectiveUserSettings];
  id v19 = [v18 MCDeepCopy];

  unsigned int v20 = [*(id *)(a1 + 32) memberQueueRecomputeEffectiveUserSettingsPasscode:0 credentialSet:0];
  long long v21 = +[MCHacks sharedHacks];
  id v22 = [*(id *)(a1 + 32) memberQueueEffectiveUserSettings];
  [v21 _applyServerSideChangesWithOldRestrictions:v3 newRestrictions:v12 oldEffectiveUserSettings:v19 newEffectiveUserSettings:v22];

  long long v23 = [*(id *)(a1 + 32) memberQueueSystemUserSettings];
  id v24 = [v23 MCMutableDeepCopy];

  long long v25 = +[MCServerSideHacks sharedHacks];
  long long v26 = [*(id *)(a1 + 32) memberQueueEffectiveUserSettings];
  unsigned int v27 = [v25 applyEffectiveSettings:v26 toSettings:v24 withOldRestrictions:v3 newRestrictions:v12];

  if (v20 && v27)
  {
    [*(id *)(a1 + 32) applyConfiguration:v24 toDomain:0 inNamespace:0 fromSender:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) memberQueueCommitUserSettingsToDisk];
  }
  if (v50)
  {
    MCSendRestrictionChangedNotification();
    if (+[MCPasscodeManagerWriter didPasscodePolicyChangeWithOldRestrictions:v3 newRestrictions:v12])
    {
      [*(id *)(a1 + 32) memberQueueClearPasscodeHistoryIfNecessary];
      [*(id *)(a1 + 32) memberQueueClearRestrictionPasscodeComplianceCache];
      [*(id *)(a1 + 32) memberQueueClearProfileRestrictionPasscodeComplianceCache];
      MCSendPasscodePolicyChangedNotification();
    }
    if (*(void *)(a1 + 80))
    {
      uint64_t v28 = MCFeatureAppLockBundleIDs;
      CFStringRef v29 = [*(id *)(a1 + 32) memberQueueEffectiveUserSettings];
      if (+[MCRestrictionManagerWriter intersectedValuesSetting:v28 valueChangedBetweenOldSettings:v19 andNewSettings:v29])
      {
LABEL_16:

LABEL_17:
        **(unsigned char **)(a1 + 80) = 1;
        goto LABEL_18;
      }
      uint64_t v30 = MCFeatureAppLockMultipleAppsAllowed;
      int v31 = [*(id *)(a1 + 32) memberQueueEffectiveUserSettings];
      if (+[MCRestrictionManagerWriter BOOLSetting:v30 valueChangedBetweenOldSettings:v19 andNewSettings:v31])
      {
LABEL_15:

        goto LABEL_16;
      }
      v46 = v31;
      uint64_t v32 = MCFeatureAppLockAccessWithoutPasscodeAllowed;
      uint64_t v33 = [*(id *)(a1 + 32) memberQueueEffectiveUserSettings];
      if (+[MCRestrictionManagerWriter BOOLSetting:v32 valueChangedBetweenOldSettings:v19 andNewSettings:v33])
      {
LABEL_14:

        int v31 = v46;
        goto LABEL_15;
      }
      CFStringRef v45 = v33;
      uint64_t v34 = MCFeatureAppLockGrantSupervisorAccessForced;
      long long v35 = [*(id *)(a1 + 32) memberQueueEffectiveUserSettings];
      if (+[MCRestrictionManagerWriter BOOLSetting:v34 valueChangedBetweenOldSettings:v19 andNewSettings:v35])
      {

        uint64_t v33 = v45;
        goto LABEL_14;
      }
      uint64_t v42 = MCFeatureAppLockLogoutAllowed;
      [*(id *)(a1 + 32) memberQueueEffectiveUserSettings];
      v43 = v44 = v35;
      LOBYTE(v42) = +[MCRestrictionManagerWriter BOOLSetting:v42 valueChangedBetweenOldSettings:v19 andNewSettings:v43];

      if (v42) {
        goto LABEL_17;
      }
    }
  }
LABEL_18:
  if (v47)
  {
    long long v36 = [*(id *)(a1 + 32) memberQueuePasscodeCompliesWithProfileRestrictions];

    if (v36)
    {
      id v37 = [*(id *)(a1 + 32) memberQueueCombinedSystemProfileRestrictions];
      if (+[MCPasscodeManagerWriter didPasscodePolicyChangeWithOldRestrictions:v48 newRestrictions:v37])
      {
        [*(id *)(a1 + 32) memberQueueClearProfileRestrictionPasscodeComplianceCache];
      }
    }
  }
  CFStringRef v38 = *(unsigned char **)(a1 + 88);
  if (v38) {
    *CFStringRef v38 = v50;
  }
  CFStringRef v39 = *(unsigned char **)(a1 + 96);
  if (v39) {
    *CFStringRef v39 = v20;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;

  id v5 = v48;
LABEL_28:
  uint64_t v40 = *(void *)(*(void *)(a1 + 72) + 8);
  CFStringRef v41 = *(void **)(v40 + 40);
  *(void *)(v40 + 40) = v13;
}

void sub_1000784B8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueUserClientRestrictions];
  id v12 = [v2 MCMutableDeepCopy];

  uint64_t v3 = [v12 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = (void *)v3;
LABEL_4:
    if ([*(id *)(a1 + 48) count]) {
      uint64_t v8 = *(void *)(a1 + 48);
    }
    else {
      uint64_t v8 = 0;
    }
    [v5 setObject:v8 forKeyedSubscript:kMCClientRestrictionsUserInfo];
    if (v4)
    {
      id v9 = [*(id *)(a1 + 32) memberQueueSystemClientRestrictions];
      id v10 = v12;
    }
    else
    {
      id v9 = v12;
      id v10 = [*(id *)(a1 + 32) memberQueueUserClientRestrictions];
    }
    int v11 = v10;
    [*(id *)(a1 + 32) memberQueueSetSystemClientRestrictions:v9 userClientRestrictions:v10 sender:*(void *)(a1 + 56) outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outError:0];

    goto LABEL_11;
  }
  os_log_t v6 = [*(id *)(a1 + 32) memberQueueSystemClientRestrictions];
  id v7 = [v6 MCMutableDeepCopy];

  id v5 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v12 = v7;
  if (v5) {
    goto LABEL_4;
  }
LABEL_11:
}

void sub_100078BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_100078BDC(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = a1[10];
  id obj = 0;
  unsigned __int8 v7 = [v2 memberQueueSetAllClientRestrictions:v3 sender:v4 outRestrictionsChanged:v5 outEffectiveSettingsChanged:v6 outError:&obj];
  id v8 = obj;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v7;
  objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v8);
}

void sub_100078FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_100079004(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 128))
  {
    id v2 = [(id)qword_100105A00 objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v3 = [v2 objectForKeyedSubscript:@"canOverrideRestrictions"];
    if (([v3 BOOLValue] & 1) == 0)
    {
      uint64_t v24 = MCClientRestrictionsErrorDomain;
      uint64_t v37 = *(void *)(a1 + 32);
      long long v25 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v24, 63000, v25, MCErrorTypeFatal, v37, 0);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_32;
    }
    uint64_t v4 = [*(id *)(a1 + 40) memberQueueOverridingRestrictionClientUUID];
    if (v4 && !MCEqualStrings())
    {
      uint64_t v26 = MCClientRestrictionsErrorDomain;
      unsigned int v27 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v26, 63001, v27, MCErrorTypeFatal, 0);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_31:
      goto LABEL_32;
    }
  }
  id v2 = [*(id *)(a1 + 56) MCMutableDeepCopy];
  uint64_t v5 = +[MCHacks sharedHacks];
  [v5 _applyHeuristicsToRestrictions:v2 forProfile:0 ignoresUnrestrictableApps:*(unsigned __int8 *)(a1 + 128)];

  uint64_t v36 = *(void *)(a1 + 64);
  uint64_t v3 = MCLocalizedErrorFormatByDevice();
  uint64_t v6 = +[MCDeviceCapabilities currentDevice];
  id v41 = 0;
  unsigned int v7 = [v6 validateCapabilitiesRequiredByRestrictions:v2 localizedIncompatibilityMessage:v3 outError:&v41];
  id v8 = v41;

  if (v7)
  {
    uint64_t v4 = [*(id *)(a1 + 40) memberQueueClientRestrictionsForClientUUID:*(void *)(a1 + 48)];
    uint64_t v9 = [*(id *)(a1 + 40) memberQueueClientTypeForClientUUID:*(void *)(a1 + 48)];
    id v10 = [*(id *)(a1 + 40) memberQueueOverridingRestrictionClientUUID];
    int v11 = *(unsigned __int8 *)(a1 + 128);
    int v12 = MCEqualStrings();
    if (sub_100018B30((void *)v4, v2) && MCEqualStrings() && v11 == v12
      || !(v4 | v9) && ![*(id *)(a1 + 56) count])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
LABEL_30:

      goto LABEL_31;
    }
    uint64_t v38 = v9;
    id v13 = [*(id *)(a1 + 40) memberQueueSystemClientRestrictions];
    id v14 = [v13 MCMutableDeepCopy];

    __int16 v15 = [*(id *)(a1 + 40) memberQueueUserClientRestrictions];
    id v16 = [v15 MCMutableDeepCopy];

    if (*(unsigned char *)(a1 + 129)) {
      __int16 v17 = v14;
    }
    else {
      __int16 v17 = v16;
    }
    id v18 = v17;
    CFStringRef v39 = v18;
    if (![*(id *)(a1 + 56) count])
    {
      [v18 setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
      if (MCEqualStrings()) {
        [*(id *)(a1 + 40) setMemberQueueOverridingRestrictionClientUUID:0];
      }
      goto LABEL_27;
    }
    v42[0] = kMCClientRestrictionsTruth;
    v42[1] = kMCClientRestrictionsType;
    uint64_t v19 = *(void *)(a1 + 32);
    v43[0] = v2;
    v43[1] = v19;
    unsigned int v20 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    id v21 = [v20 mutableCopy];

    [v21 setObject:*(void *)(a1 + 64) forKeyedSubscript:kMCClientRestrictionsLocalizedClientDescription];
    [v21 setObject:*(void *)(a1 + 72) forKeyedSubscript:kMCClientRestrictionsLocalizedWarning];
    [v21 setObject:*(void *)(a1 + 80) forKeyedSubscript:kMCClientRestrictionsAppsAndOptions];
    if (*(unsigned char *)(a1 + 128))
    {
      [v21 setObject:&__kCFBooleanTrue forKeyedSubscript:kMCClientRestrictionsOverrideRestrictions];
      uint64_t v22 = *(void *)(a1 + 48);
      long long v23 = v39;
    }
    else
    {
      long long v23 = v39;
      if (!MCEqualStrings())
      {
LABEL_26:
        [v23 setObject:v21 forKeyedSubscript:*(void *)(a1 + 48)];

LABEL_27:
        uint64_t v28 = *(void **)(a1 + 40);
        uint64_t v29 = *(void *)(a1 + 88);
        uint64_t v30 = *(void *)(a1 + 112);
        uint64_t v31 = *(void *)(a1 + 120);
        id v40 = v8;
        unsigned __int8 v32 = [v28 memberQueueSetSystemClientRestrictions:v14 userClientRestrictions:v16 sender:v29 outRestrictionsChanged:v30 outEffectiveSettingsChanged:v31 outError:&v40];
        id v33 = v40;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v32;
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
          [*(id *)(a1 + 40) setMemberQueueOverridingRestrictionClientUUID:v10];
        }

        id v8 = v33;
        uint64_t v9 = v38;
        goto LABEL_30;
      }
      uint64_t v22 = 0;
    }
    [*(id *)(a1 + 40) setMemberQueueOverridingRestrictionClientUUID:v22];
    goto LABEL_26;
  }
LABEL_32:

  uint64_t v34 = *(void *)(*(void *)(a1 + 104) + 8);
  long long v35 = *(void **)(v34 + 40);
  *(void *)(v34 + 40) = v8;
}

void sub_100079EB4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) memberQueueSystemClientRestrictions];
  id v3 = [v2 copy];

  uint64_t v4 = [*(id *)(a1 + 32) orphanedClientUUIDsForClientRestrictionDictionary:v3];
  if ([v4 count])
  {
    uint64_t v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      __int16 v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found orphaned system client uuids %{public}@.  Removing them", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v6 = [*(id *)(a1 + 32) memberQueueSystemClientRestrictions];
    id v7 = [v6 MCMutableDeepCopy];

    id v8 = [v4 allObjects];
    [v7 removeObjectsForKeys:v8];

    [*(id *)(a1 + 32) applyConfiguration:v7 toDomain:8 inNamespace:0 fromSender:@"MCRestrictionManagerWriter.RemoveOrphanedClientRestrictions"];
    [*(id *)(a1 + 32) memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions:v3 newSystemClientRestrictions:v7];
  }
  uint64_t v9 = [*(id *)(a1 + 32) memberQueueUserClientRestrictions];
  id v10 = [v9 copy];

  int v11 = [*(id *)(a1 + 32) orphanedClientUUIDsForClientRestrictionDictionary:v10];
  if ([v11 count])
  {
    int v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      __int16 v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found orphaned user client uuids %{public}@.  Removing them", (uint8_t *)&v16, 0xCu);
    }
    id v13 = [*(id *)(a1 + 32) memberQueueUserClientRestrictions];
    id v14 = [v13 MCMutableDeepCopy];

    __int16 v15 = [v11 allObjects];
    [v14 removeObjectsForKeys:v15];

    [*(id *)(a1 + 32) applyConfiguration:v14 toDomain:9 inNamespace:0 fromSender:@"MCRestrictionManagerWriter.RemoveOrphanedClientRestrictions"];
  }
  if ([v4 count] || objc_msgSend(v11, "count")) {
    [*(id *)(a1 + 32) memberQueueCommitClientRestrictionsToDisk];
  }
}

void sub_10007A1F4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueRecomputePasscodeComplianceForClientUUID];
  if (!v2
    || (id v3 = (void *)v2,
        [*(id *)(a1 + 32) memberQueueRecomputePasscodeComplianceForClientUUID],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        id v5 = [v4 count],
        v4,
        v3,
        v5))
  {
    [*(id *)(a1 + 32) memberQueueCacheClientRestrictionPasscodeCompliance];
  }
  unsigned int v6 = [*(id *)(a1 + 32) memberQueueCheckPasscodeCompliesWithCurrentRestrictions];
  id v7 = *(unsigned char **)(a1 + 40);
  if (v7) {
    unsigned char *v7 = v6;
  }
  if (v6)
  {
    id v8 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Current passcode complies with restrictions. Removing nag.", buf, 2u);
    }
    uint64_t v9 = +[NSFileManager defaultManager];
    id v10 = MCNagUIMetaFilePath();
    unsigned int v11 = [v9 fileExistsAtPath:v10];

    int v12 = +[NSFileManager defaultManager];
    if (!v11)
    {
      long long v23 = MCPasscodeNagKeepAliveFilePath();
      [v12 removeItemAtPath:v23 error:0];

      return;
    }
    id v13 = MCNagUIMetaFilePath();
    [v12 removeItemAtPath:v13 error:0];

    id v14 = +[NSFileManager defaultManager];
    __int16 v15 = MCPasscodeNagKeepAliveFilePath();
    [v14 removeItemAtPath:v15 error:0];

    goto LABEL_22;
  }
  int v16 = *(void **)(a1 + 32);
  id v38 = 0;
  id v17 = [v16 memberQueueIsPasscodeComplianceMandatoryWithOutLocalizedWarning:&v38];
  id v18 = v38;
  uint64_t v19 = MCNagUIMetaFilePath();
  unsigned int v20 = +[NSMutableDictionary dictionaryWithContentsOfFile:v19];
  id v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = +[NSMutableDictionary dictionary];
  }
  uint64_t v24 = v22;

  uint64_t v25 = kMCNagMetaMandatoryKey;
  uint64_t v26 = [v24 objectForKeyedSubscript:kMCNagMetaMandatoryKey];
  unsigned int v27 = v26;
  if (v26 && v17 == [v26 BOOLValue])
  {
    int v29 = 0;
  }
  else
  {
    uint64_t v28 = +[NSNumber numberWithBool:v17];
    [v24 setObject:v28 forKeyedSubscript:v25];

    int v29 = 1;
  }
  [v24 setObject:v18 forKeyedSubscript:kMCNagMetaMessageKey];
  [v24 setObject:0 forKeyedSubscript:kMCNagMetaLastLockDateKey];
  uint64_t v30 = +[NSLocale currentLocale];
  uint64_t v31 = [v30 localeIdentifier];
  [v24 setObject:v31 forKeyedSubscript:kMCNagMetaLastLocaleKey];

  unsigned __int8 v32 = MCNagUIMetaFilePath();
  [v24 MCWriteToBinaryFile:v32];

  id v33 = +[NSFileManager defaultManager];
  uint64_t v34 = MCPasscodeNagKeepAliveFilePath();
  unsigned __int8 v35 = [v33 fileExistsAtPath:v34];

  if ((v35 & 1) == 0)
  {
    uint64_t v36 = objc_opt_new();
    uint64_t v37 = MCPasscodeNagKeepAliveFilePath();
    [v36 MCWriteToBinaryFile:v37];
  }
  if (v29) {
LABEL_22:
  }
    MCSendPasscodeComplianceChangedNotification();
}

id sub_10007B874(uint64_t a1)
{
  return [*(id *)(a1 + 32) memberQueueClearAllPasscodeComplianceCaches];
}

void sub_10007B98C(id a1)
{
  uint64_t v1 = MCNagUIMetaFilePath();
  id v3 = +[NSMutableDictionary dictionaryWithContentsOfFile:v1];

  if (v3)
  {
    [v3 removeObjectForKey:kMCNagMetaLastLockDateKey];
    uint64_t v2 = MCNagUIMetaFilePath();
    [v3 MCWriteToBinaryFile:v2];
  }
}

void sub_10007BAD4(uint64_t a1)
{
  uint64_t v2 = MCNagUIMetaFilePath();
  id v6 = +[NSMutableDictionary dictionaryWithContentsOfFile:v2];

  id v3 = v6;
  if (v6)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      [v6 setObject:v4 forKey:kMCNagMetaLastLockDateKey];
      id v5 = MCNagUIMetaFilePath();
      [v6 MCWriteToBinaryFile:v5];

      id v3 = v6;
    }
  }
}

void sub_10007CFC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10007CFE0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) memberQueueSetParametersForSettingsByType:*(void *)(a1 + 40) configurationUUID:*(void *)(a1 + 48) toSystem:*(unsigned __int8 *)(a1 + 88) user:*(unsigned __int8 *)(a1 + 89) passcode:*(void *)(a1 + 56) credentialSet:*(void *)(a1 + 64) sender:*(void *)(a1 + 72)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_10007D750(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueSystemUserSettings];
  id v6 = [v2 mutableCopy];

  uint64_t v3 = MCRestrictedBoolKey;
  uint64_t v4 = [v6 objectForKey:MCRestrictedBoolKey];
  id v5 = [v4 mutableCopy];

  if (v5)
  {
    [v5 removeObjectForKey:*(void *)(a1 + 40)];
    [v6 setObject:v5 forKey:v3];
    [*(id *)(a1 + 32) applyConfiguration:v6 toDomain:0 inNamespace:0 fromSender:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) memberQueueCommitUserSettingsToDisk];
    [*(id *)(a1 + 32) memberQueueRecomputeEffectiveUserSettingsPasscode:0 credentialSet:0];
  }
}

void sub_10007D908(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueSystemUserSettings];
  id v6 = [v2 mutableCopy];

  uint64_t v3 = MCRestrictedValueKey;
  uint64_t v4 = [v6 objectForKey:MCRestrictedValueKey];
  id v5 = [v4 mutableCopy];

  if (v5)
  {
    [v5 removeObjectForKey:*(void *)(a1 + 40)];
    [v6 setObject:v5 forKey:v3];
    [*(id *)(a1 + 32) applyConfiguration:v6 toDomain:0 inNamespace:0 fromSender:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) memberQueueCommitUserSettingsToDisk];
    [*(id *)(a1 + 32) memberQueueRecomputeEffectiveUserSettingsPasscode:0 credentialSet:0];
  }
}

id sub_10007DA9C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 defaultSettings];
  [v2 applyConfiguration:v3 toDomain:0 inNamespace:0 fromSender:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) memberQueueCommitUserSettingsToDisk];
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 memberQueueRecomputeEffectiveUserSettingsPasscode:0 credentialSet:0];
}

id sub_10007DBCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) memberQueueRecomputeEffectiveUserSettingsPasscode:*(void *)(a1 + 40) credentialSet:0];
}

void sub_10007DC64(uint64_t a1)
{
  char v19 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueRestrictions];
  id v3 = [v2 copy];

  uint64_t v4 = [*(id *)(a1 + 32) memberQueueRestrictions];
  id v5 = [*(id *)(a1 + 32) defaultRestrictions];
  id v6 = [*(id *)(a1 + 32) memberQueueSystemProfileRestrictions];
  id v7 = [*(id *)(a1 + 32) memberQueueUserProfileRestrictions];
  id v8 = [*(id *)(a1 + 32) memberQueueSystemClientRestrictions];
  uint64_t v9 = [*(id *)(a1 + 32) memberQueueUserClientRestrictions];
  id v18 = 0;
  id v10 = +[MCRestrictionManagerWriter restrictionsWithCurrentRestrictions:v4 defaultRestrictions:v5 systemProfileRestrictions:v6 userProfileRestrictions:v7 systemClientRestrictions:v8 userClientRestrictions:v9 outRestrictionsChanged:&v19 outError:&v18];
  id v11 = v18;

  if (v10)
  {
    [*(id *)(a1 + 32) applyConfiguration:v10 toDomain:5 inNamespace:0 fromSender:@"MCRestrictionManagerWriter.RecomputeUserRestrictions"];
    [*(id *)(a1 + 32) memberQueueCommitRestrictionsToDisk];
    int v12 = [*(id *)(a1 + 32) memberQueueEffectiveUserSettings];
    id v13 = [v12 MCDeepCopy];

    unsigned int v14 = [*(id *)(a1 + 32) memberQueueRecomputeEffectiveUserSettingsPasscode:0 credentialSet:0];
    __int16 v15 = +[MCHacks sharedHacks];
    int v16 = [*(id *)(a1 + 32) memberQueueEffectiveUserSettings];
    [v15 _applyServerSideChangesWithOldRestrictions:v3 newRestrictions:v10 oldEffectiveUserSettings:v13 newEffectiveUserSettings:v16];

    if (v19)
    {
      MCSendRestrictionChangedNotification();
      if (+[MCPasscodeManagerWriter didPasscodePolicyChangeWithOldRestrictions:v3 newRestrictions:v10])
      {
        [*(id *)(a1 + 32) memberQueueClearPasscodeHistoryIfNecessary];
        [*(id *)(a1 + 32) memberQueueClearAllPasscodeComplianceCaches];
        MCSendPasscodePolicyChangedNotification();
      }
    }
    if (v14)
    {
      [*(id *)(a1 + 32) senderPID];
      MCSendEffectiveSettingsChangedNotification();
    }
  }
  else
  {
    id v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "Failed to recompute user restrictions. Error: %{public}@", buf, 0xCu);
    }
  }
}

void sub_10007E0B4(id a1)
{
  uint64_t v1 = +[MCClientTypeLoaders clientTypeLoaders];
  uint64_t v2 = (void *)qword_100105A00;
  qword_100105A00 = v1;

  qword_100105A10 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, 0);
  qword_100105A18 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, 0);
  qword_100105A20 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, 0);
  unsigned __int8 v35 = +[NSMutableSet set];
  uint64_t v34 = +[NSMutableSet set];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)qword_100105A00;
  id v38 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v41;
    *(void *)&long long v3 = 138543874;
    long long v33 = v3;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(NSString **)(*((void *)&v40 + 1) + 8 * (void)v4);
        id v6 = [[(id)qword_100105A00 objectForKey:v5, v33];
        id v7 = [v6 objectForKey:@"bundlePath"];
        id v8 = [v6 objectForKey:@"loaderClass"];
        uint64_t v9 = [v6 objectForKey:@"loaderSelector"];
        aSelectorName = [v6 objectForKey:@"recomputeComplianceSelector"];
        id v10 = [v6 objectForKey:@"neverOrphanCheck"];
        id v11 = [v6 objectForKey:@"orphanCheckMayFail"];
        if (v10 && [v10 BOOLValue])
        {
          int v12 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            CFStringRef v45 = v5;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Client type %{public}@ is denoted as never orphan check. Skipping client loader.", buf, 0xCu);
          }
          [v35 addObject:v5];
        }
        else
        {
          if (v7) {
            BOOL v13 = v8 == 0;
          }
          else {
            BOOL v13 = 1;
          }
          if (v13 || v9 == 0)
          {
            os_log_t v15 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_29;
            }
            *(_DWORD *)buf = 138543618;
            CFStringRef v45 = v5;
            __int16 v46 = 2114;
            unsigned int v47 = (NSString *)v6;
            int v16 = v15;
            os_log_type_t v17 = OS_LOG_TYPE_ERROR;
            id v18 = "Could not find a client type loader for client type %{public}@. Found a loader dict of %{public}@";
LABEL_21:
            uint32_t v19 = 22;
LABEL_28:
            _os_log_impl((void *)&_mh_execute_header, v16, v17, v18, buf, v19);
            goto LABEL_29;
          }
          unsigned int v20 = v7;
          if (!dlopen([(NSString *)v20 cStringUsingEncoding:1], 2))
          {
            os_log_t v23 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_29;
            }
            *(_DWORD *)buf = 138543362;
            CFStringRef v45 = v20;
            int v16 = v23;
            os_log_type_t v17 = OS_LOG_TYPE_ERROR;
            id v18 = "Could not find a bundle at %{public}@";
            uint32_t v19 = 12;
            goto LABEL_28;
          }
          Class v21 = NSClassFromString(v8);
          if (v21)
          {
            CFDictionarySetValue((CFMutableDictionaryRef)qword_100105A10, v5, v21);
            SEL v22 = NSSelectorFromString(v9);
            if (v22)
            {
              CFDictionarySetValue((CFMutableDictionaryRef)qword_100105A18, v5, v22);
            }
            else
            {
              uint64_t v25 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v33;
                CFStringRef v45 = v20;
                __int16 v46 = 2114;
                unsigned int v47 = v9;
                __int16 v48 = 2114;
                id v49 = v8;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Bundle at path %{public}@ does not have selector %{public}@ for class %{public}@.", buf, 0x20u);
              }
            }
            if (v11 && [v11 BOOLValue]) {
              [v34 addObject:v5];
            }
            if (aSelectorName)
            {
              SEL v26 = NSSelectorFromString(aSelectorName);
              if (v26)
              {
                CFDictionarySetValue((CFMutableDictionaryRef)qword_100105A20, v5, v26);
              }
              else
              {
                os_log_t v27 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v33;
                  CFStringRef v45 = v20;
                  __int16 v46 = 2114;
                  unsigned int v47 = aSelectorName;
                  __int16 v48 = 2114;
                  id v49 = v8;
                  int v16 = v27;
                  os_log_type_t v17 = OS_LOG_TYPE_INFO;
                  id v18 = "Bundle at path %{public}@ does not have selector %{public}@ for class %{public}@.";
                  uint32_t v19 = 32;
                  goto LABEL_28;
                }
              }
            }
          }
          else
          {
            os_log_t v24 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              CFStringRef v45 = v8;
              __int16 v46 = 2114;
              unsigned int v47 = v20;
              int v16 = v24;
              os_log_type_t v17 = OS_LOG_TYPE_ERROR;
              id v18 = "Could not find class %{public}@ in bundle at path %{public}@";
              goto LABEL_21;
            }
          }
        }
LABEL_29:

        uint64_t v4 = (char *)v4 + 1;
      }
      while (v38 != v4);
      id v28 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
      id v38 = v28;
    }
    while (v28);
  }

  id v29 = [v35 copy];
  uint64_t v30 = (void *)qword_100105A08;
  qword_100105A08 = (uint64_t)v29;

  id v31 = [v34 copy];
  unsigned __int8 v32 = (void *)qword_100105A28;
  qword_100105A28 = (uint64_t)v31;
}

void sub_10007E714(id a1)
{
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = qword_100105A38;
  qword_100105A38 = v1;

  _objc_release_x1(v1, v2);
}

void sub_10007E9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007E9E8(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _isCloudConfigurationActuallyAvailable];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "This device must be configured using DEP.", v11, 2u);
      }
    }
  }
  else
  {
    id v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not retrieve DEP configuration.", buf, 2u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10007F35C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10007F378(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10007F388(uint64_t a1)
{
}

uint64_t sub_10007F390(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = +[NSString stringWithFormat:@"%@ value is not a %@", v6, v7];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t sub_10007F454(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (*(uint64_t (**)(uint64_t, id, uint64_t, const __CFString *))(v2 + 16))(v2, v3, v4, @"BOOLean");

  return v5;
}

uint64_t sub_10007F4C0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (*(uint64_t (**)(uint64_t, id, uint64_t, const __CFString *))(v2 + 16))(v2, v3, v4, @"number");

  return v5;
}

uint64_t sub_10007F52C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (*(uint64_t (**)(uint64_t, id, uint64_t, const __CFString *))(v2 + 16))(v2, v3, v4, @"string");

  return v5;
}

uint64_t sub_10007F598(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v18 = +[NSString stringWithFormat:@"%@ value is not an array", v6];
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned int v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    uint64_t v14 = 0;
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v8;
    uint64_t v10 = (char *)[v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      while (2)
      {
        BOOL v13 = 0;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v15 = +[NSString stringWithFormat:@"%@ element is not a %@", v6, v7, v22];
            uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
            os_log_type_t v17 = *(void **)(v16 + 40);
            *(void *)(v16 + 40) = v15;

            uint64_t v14 = 0;
            goto LABEL_13;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = (char *)[v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    uint64_t v14 = 1;
LABEL_13:
  }
  return v14;
}

uint64_t sub_10007F76C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (*(uint64_t (**)(uint64_t, id, uint64_t, const __CFString *))(v2 + 16))(v2, v3, v4, @"data");

  return v5;
}

uint64_t sub_10007F7D8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (*(uint64_t (**)(uint64_t, id, uint64_t, const __CFString *))(v2 + 16))(v2, v3, v4, @"string");

  return v5;
}

void sub_1000806EC(void *a1)
{
  id v2 = a1;
  id v1 = v2;
  AnalyticsSendEventLazy();
}

id sub_100080780(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  +[MCProfileAnalyticsHelper addContainsPayloadInfoWithProfile:*(void *)(a1 + 32) eventPayload:v2];

  return v2;
}

void sub_1000807D8(void *a1)
{
  id v2 = a1;
  id v1 = v2;
  AnalyticsSendEventLazy();
}

id sub_100080874(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  +[MCProfileAnalyticsHelper addContainsPayloadInfoWithProfile:*(void *)(a1 + 32) eventPayload:v2];
  id v3 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  [v2 setObject:v3 forKeyedSubscript:@"exitReason"];

  return v2;
}

void sub_100080B68(id a1)
{
  v3[0] = kMCEASAccountPayloadType;
  v3[1] = kMCEmailAccountPayloadType;
  v4[0] = @"profile_containsPayload_mailAccount";
  v4[1] = @"profile_containsPayload_mailAccount";
  void v3[2] = kMCGmailAccountLegacyPayloadType;
  void v3[3] = kMCGmailAccountPayloadType;
  void v4[2] = @"profile_containsPayload_mailAccount";
  v4[3] = @"profile_containsPayload_mailAccount";
  void v3[4] = kMCMDMPayloadType;
  v3[5] = kMCPasswordPolicyPayloadType;
  void v4[4] = @"profile_containsPayload_mdm";
  v4[5] = @"profile_containsPayload_passwordPolicy";
  v3[6] = kMCRestrictionsPayloadType;
  v4[6] = @"profile_containsPayload_restrictions";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:7];
  id v2 = (void *)qword_100105A48;
  qword_100105A48 = v1;
}

void sub_10008223C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100082254(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100082264(uint64_t a1)
{
}

id sub_10008226C(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    uint64_t v8 = MCOTAProfilesErrorDomain;
    uint64_t v4 = MCErrorArray();
    uint64_t v5 = MCErrorTypeFatal;
    uint64_t v6 = v8;
    uint64_t v7 = 24007;
  }
  else
  {
    if (a2 != 1) {
      goto LABEL_6;
    }
    uint64_t v3 = MCOTAProfilesErrorDomain;
    uint64_t v4 = MCErrorArray();
    uint64_t v5 = MCErrorTypeFatal;
    uint64_t v6 = v3;
    uint64_t v7 = 24005;
  }
  uint64_t v9 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v6, v7, v4, v5, 0);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

LABEL_6:
  uint64_t v12 = *(void **)(a1 + 32);

  return [v12 complete];
}

void sub_100082440(id a1)
{
  uint64_t v1 = +[ACAccountStore defaultStore];
  uint64_t v2 = qword_100105A58;
  qword_100105A58 = v1;

  _objc_release_x1(v1, v2);
}

void sub_1000828A4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accountStore];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_100082950;
  v4[3] = &unk_1000EC0A0;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 removeAccount:v3 withCompletionHandler:v4];
}

void sub_100082950(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Couldn't remove the account: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_100086EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100086F00(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100086F10(uint64_t a1)
{
}

uint64_t sub_100086F18(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _installWithAccountDictionary:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return _objc_release_x1(v2, v4);
}

void sub_1000874B4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  os_log_t v6 = _MCLogObjects[0];
  BOOL v7 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v13 = 138543362;
      uint64_t v14 = v8;
      uint64_t v9 = "Removed Google account %{public}@";
      uint64_t v10 = v6;
      uint32_t v11 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, v11);
    }
  }
  else if (v7)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138543618;
    uint64_t v14 = v12;
    __int16 v15 = 2114;
    id v16 = v5;
    uint64_t v9 = "Failed to remove Google account %{public}@ with error: %{public}@";
    uint64_t v10 = v6;
    uint32_t v11 = 22;
    goto LABEL_6;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_1000880B4(uint64_t a1)
{
  uint64_t v2 = MISProvisioningProfileGetName();
  uint64_t v3 = MISProvisioningProfileGetUUID();
  uint64_t v4 = MISProvisioningProfileGetExpirationDate();
  id v5 = v4;
  if (v4
    && ([v4 earlierDate:*(void *)(a1 + 32)],
        os_log_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == v5))
  {
    uint64_t v8 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      uint32_t v11 = v2;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Provisioning profile “%{public}@” has expired and will be removed.", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) addObject:v3];
  }
  else if (!MISProvisioningProfileIncludesDevice())
  {
    BOOL v7 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      uint32_t v11 = v2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Provisioning profile “%{public}@” is not valid for this device and will be removed.", (uint8_t *)&v10, 0xCu);
    }
  }

  return 1;
}

void sub_100088548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100088584(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100088594(uint64_t a1)
{
}

uint64_t sub_10008859C(uint64_t a1)
{
  uint64_t v2 = MISProvisioningProfileGetExpirationDate();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (!*(void *)(v4 + 40)) {
    goto LABEL_5;
  }
  if (v2)
  {
    id v5 = [v2 earlierDate:];

    if (v5 == v3)
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
LABEL_5:
      objc_storeStrong((id *)(v4 + 40), v3);
    }
  }

  return 1;
}

id sub_10008C5E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendPasscodeChangedNotification];
}

void sub_10008E610(id a1)
{
  uint64_t v4 = MCNewsBundleIdentifier;
  uint64_t v1 = MCNewsServicesFrameworkPath();
  id v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  uint64_t v3 = (void *)qword_100105A68;
  qword_100105A68 = v2;
}

uint64_t sub_10008F5F4()
{
  uint64_t result = lockdown_connect();
  if (result)
  {
    uint64_t v1 = result;
    lockdown_set_value();
    return _lockdown_disconnect(v1);
  }
  return result;
}

uint64_t sub_10008F67C()
{
  uint64_t result = lockdown_connect();
  if (result)
  {
    uint64_t v1 = result;
    lockdown_set_value();
    return _lockdown_disconnect(v1);
  }
  return result;
}

void sub_10008F708(id a1, BOOL a2, NSError *a3)
{
  uint64_t v4 = a3;
  if (!a2)
  {
    id v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      BOOL v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Could not save account. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_1000930E4(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("MCKeybagUnlockAssertion serialization queue", 0);
  uint64_t v2 = qword_100105A78;
  qword_100105A78 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_10009316C(id a1)
{
  if (byte_100105A88 == 1)
  {
    os_log_t v1 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
      return;
    }
    LOWORD(keys[0]) = 0;
    uint64_t v2 = "Attempting to recursively hold keybag unlock assertion. Ignoring.";
    uint64_t v3 = (uint8_t *)keys;
    uint64_t v4 = v1;
    os_log_type_t v5 = OS_LOG_TYPE_ERROR;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v4, v5, v2, v3, 2u);
    return;
  }
  CFTypeRef cf = 0;
  int valuePtr = 600;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *(_OWORD *)keys = *(_OWORD *)&off_1000EC4C0;
  values[0] = @"RemoteProfile";
  values[1] = v6;
  CFDictionaryRef v7 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  qword_100105A90 = MKBDeviceLockAssertion();
  CFRelease(v7);
  CFRelease(v6);
  if (qword_100105A90)
  {
    byte_100105A88 = 1;
    os_log_t v8 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v2 = "Holding keybag unlock assertion.";
    uint64_t v3 = buf;
    uint64_t v4 = v8;
    os_log_type_t v5 = OS_LOG_TYPE_INFO;
    goto LABEL_7;
  }
  uint64_t v9 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    CFTypeRef v13 = cf;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not hold keybag lock assertion. Error: %{public}@", buf, 0xCu);
  }
  if (cf) {
    CFRelease(cf);
  }
}

void sub_100093398(id a1)
{
  if (byte_100105A88 == 1)
  {
    os_log_t v1 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Releasing keybag unlock assertion.", v2, 2u);
    }
    CFRelease((CFTypeRef)qword_100105A90);
    qword_100105A90 = 0;
    byte_100105A88 = 0;
  }
}

uint64_t sub_100093B94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = *(id *)(a1 + 32);
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        uint32_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v11);
          CFTypeRef v13 = [v5 UUID:v18];
          uint64_t v14 = [v12 UUID];
          unsigned __int8 v15 = [v13 isEqualToString:v14];

          if (v15)
          {
            uint64_t v16 = 0;
            goto LABEL_12;
          }
          uint32_t v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    uint64_t v16 = 1;
LABEL_12:
  }
  else
  {
    uint64_t v16 = 1;
  }

  return v16;
}

void sub_100095AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100095B0C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100095B1C(uint64_t a1)
{
}

uint64_t sub_100095B24(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _copyCertificateWithPayloadUUID:*(void *)(a1 + 40) intoKeychainAccessGroup:*(void *)(a1 + 48) personaID:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return _objc_release_x1(v2, v4);
}

id sub_1000967C4(uint64_t a1)
{
  v13[0] = @"isClearingPasscode";
  id v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v14[0] = v2;
  v13[1] = @"newPasscodeUnlockScreenType";
  uint64_t v3 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  v14[1] = v3;
  _DWORD v13[2] = @"newPasscodeSimpleType";
  uint64_t v4 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  void v14[2] = v4;
  v13[3] = @"oldPasscodeExists";
  id v5 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 57)];
  v14[3] = v5;
  v13[4] = @"passcodeChangeType";
  id v6 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v14[4] = v6;
  v13[5] = @"passcodeRecoveryRestricted";
  id v7 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 58)];
  v14[5] = v7;
  v13[6] = @"passcodeRecoverySupported";
  id v8 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 59)];
  v14[6] = v8;
  v13[7] = @"recoverySkipped";
  id v9 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 60)];
  v13[8] = @"senderBundleID";
  uint64_t v10 = *(void *)(a1 + 32);
  v14[7] = v9;
  v14[8] = v10;
  uint32_t v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:9];

  return v11;
}

id sub_100096A34(uint64_t a1)
{
  CFStringRef v4 = @"clearReason";
  os_log_t v1 = +[NSNumber numberWithInteger:*(void *)(a1 + 32)];
  id v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

uint64_t sub_100097D5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v26 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v25 + 1) + 8 * v8);
      uint64_t v10 = [v3 identifier];
      uint32_t v11 = [v9 identifier];
      unsigned __int8 v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_18;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v13 = (uint64_t)[v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
LABEL_11:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v4);
      }
      uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
      os_log_type_t v17 = [v3 identifier:v21];
      long long v18 = [v16 identifier];
      unsigned __int8 v19 = [v17 isEqual:v18];

      if (v19) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = (uint64_t)[v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v13) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    uint64_t v13 = 1;
  }
LABEL_19:

  return v13;
}

void sub_10009817C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000981A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000981B4(uint64_t a1)
{
}

void sub_1000981BC(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_1000989B0(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100098AAC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _MCLogObjects[2];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to remove application with bundle ID: %{public}@, error: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
  }
}

uint64_t sub_100098BA0()
{
  return AnalyticsSendEventLazy();
}

id sub_100098C24(uint64_t a1)
{
  v10[0] = @"autoPermitList_changed";
  id v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v11[0] = v2;
  v10[1] = @"autoPermitList_count";
  id v3 = +[NSNumber numberWithUnsignedLong:*(void *)(a1 + 32)];
  v11[1] = v3;
  _DWORD v10[2] = @"blacklist_changed";
  id v4 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 57)];
  v11[2] = v4;
  v10[3] = @"blacklist_count";
  id v5 = +[NSNumber numberWithUnsignedLong:*(void *)(a1 + 40)];
  v11[3] = v5;
  v10[4] = @"whitelist_changed";
  id v6 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 58)];
  void v11[4] = v6;
  v10[5] = @"whitelist_count";
  uint64_t v7 = +[NSNumber numberWithUnsignedLong:*(void *)(a1 + 48)];
  v11[5] = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:6];

  return v8;
}

uint64_t sub_100098DB8()
{
  return AnalyticsSendEventLazy();
}

id sub_100098E38(unsigned __int8 *a1)
{
  v8[0] = @"autoFilter_changed";
  id v2 = +[NSNumber numberWithBool:a1[32]];
  v9[0] = v2;
  v8[1] = @"autoFilter_enabled";
  id v3 = +[NSNumber numberWithBool:a1[33]];
  v9[1] = v3;
  v8[2] = @"whitelist_changed";
  id v4 = +[NSNumber numberWithBool:a1[34]];
  void v9[2] = v4;
  v8[3] = @"whitelist_enabled";
  id v5 = +[NSNumber numberWithBool:a1[35]];
  v9[3] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

uint64_t sub_100098F74()
{
  uint64_t v0 = MAERecertifyDeviceWithError();
  id v1 = 0;
  os_log_t v2 = _MCLogObjects[0];
  if (v0)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v3 = "Recertification succeeded.";
      id v4 = v2;
      os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
      uint32_t v6 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v4, v5, v3, buf, v6);
    }
  }
  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v1;
    id v3 = "Recertification failed: %{public}@";
    id v4 = v2;
    os_log_type_t v5 = OS_LOG_TYPE_ERROR;
    uint32_t v6 = 12;
    goto LABEL_6;
  }

  return v0;
}

void sub_10009BBF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10009BC58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10009BC68(uint64_t a1)
{
}

void sub_10009BC70(uint64_t a1)
{
  os_log_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009BD40;
  v6[3] = &unk_1000EC680;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 64);
  id v4 = (id)v5;
  long long v9 = v5;
  [v2 insertAccountType:v3 withCompletionHandler:v6];
}

void sub_10009BD40(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2) {
    [*(id *)(a1 + 32) setAccountTypeGUID:*(void *)(a1 + 40)];
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10009BDC0(uint64_t a1)
{
  os_log_t v2 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009BEB8;
  block[3] = &unk_1000EC6D0;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 56);
  id v3 = (id)v4;
  long long v9 = v4;
  dispatch_async(v2, block);

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
}

void sub_10009BEB8(uint64_t a1)
{
  os_log_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009BF88;
  v6[3] = &unk_1000EC680;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v5;
  long long v9 = v5;
  [v2 saveVerifiedAccount:v3 withCompletionHandler:v6];
}

void sub_10009BF88(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 40) identifier];
    [*(id *)(a1 + 32) setAccountGUID:v6];
  }
  else
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = v5;
    id v6 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10009C01C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  void v3[2] = sub_10009C0AC;
  void v3[3] = &unk_1000EC0A0;
  id v4 = *(id *)(a1 + 48);
  [v1 removeAccount:v2 withCompletionHandler:v3];
}

void sub_10009C0AC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  os_log_t v6 = _MCLogObjects[0];
  if (a2)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      uint64_t v7 = "Rolled back Kerberos account.";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    int v11 = 138543362;
    id v12 = v5;
    uint64_t v7 = "Warning: unable to remove Kerberos account while rolling back installation. Error: %{public}@";
    id v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10009C1A8(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  void v3[2] = sub_10009C238;
  void v3[3] = &unk_1000EC0A0;
  id v4 = *(id *)(a1 + 48);
  [v1 removeAccountType:v2 withCompletionHandler:v3];
}

void sub_10009C238(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  os_log_t v6 = _MCLogObjects[0];
  if (a2)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      uint64_t v7 = "Rolled back Kerberos account type.";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    int v11 = 138543362;
    id v12 = v5;
    uint64_t v7 = "Warning: unable to remove Kerberos account type while rolling back installation. Error: %{public}@";
    id v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10009C904(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_10009C9B4;
  v4[3] = &unk_1000EBEC0;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 removeAccount:v3 withCompletionHandler:v4];
}

void sub_10009C9B4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _MCLogObjects[0];
  if (a2)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Remove SSO payload: account removal complete", (uint8_t *)&v10, 2u);
    }
  }
  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = v6;
    os_log_type_t v9 = [v7 humanReadableName];
    int v10 = 138543618;
    int v11 = v9;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Warning: Failed to remove Kerberos account for “%{public}@”. Ignoring. Error: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10009CAE4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_10009CB94;
  v4[3] = &unk_1000EBEC0;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 removeAccountType:v3 withCompletionHandler:v4];
}

void sub_10009CB94(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _MCLogObjects[0];
  if (a2)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Remove SSO payload: account type removal complete", (uint8_t *)&v10, 2u);
    }
  }
  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = v6;
    os_log_type_t v9 = [v7 humanReadableName];
    int v10 = 138543618;
    int v11 = v9;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Warning: Failed to remove Kerberos account type for “%{public}@”. Ignoring. Error: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10009DAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

uint64_t sub_10009DAE8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10009DAF8(uint64_t a1)
{
}

uint64_t sub_10009DB00(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _copyCertificateWithPayloadUUID:*(void *)(a1 + 40) intoKeychainAccessGroup:*(void *)(a1 + 48) personaID:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return _objc_release_x1(v2, v4);
}

void *acm_mem_alloc_data(size_t size)
{
  uint64_t result = malloc_type_calloc(1uLL, size, 0xCB62F0E9uLL);
  if (result) {
    qword_100105AA8 += size;
  }
  return result;
}

void acm_mem_free_data(void *a1, rsize_t __n)
{
  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    uint64_t v4 = qword_100105AA8 - __n;
    if (qword_100105AA8 < __n) {
      uint64_t v4 = 0;
    }
    qword_100105AA8 = v4;
  }
}

void *acm_mem_alloc(size_t size)
{
  uint64_t result = malloc_type_calloc(1uLL, size, 0xDB9956F0uLL);
  if (result) {
    qword_100105AB0 += size;
  }
  return result;
}

void acm_mem_free(void *a1, rsize_t __n)
{
  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    uint64_t v4 = qword_100105AB0 - __n;
    if (qword_100105AB0 < __n) {
      uint64_t v4 = 0;
    }
    qword_100105AB0 = v4;
  }
}

const char *acm_mem_alloc_info(const char *result, const void *a2, uint64_t a3, const char *a4, int a5, const char *a6)
{
  if (a2) {
    qword_100105AA0 += a3;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    id v6 = "NULL";
    if (result) {
      uint64_t v7 = result;
    }
    else {
      uint64_t v7 = "NULL";
    }
    if (a4) {
      id v8 = a4;
    }
    else {
      id v8 = "NULL";
    }
    if (a6) {
      id v6 = a6;
    }
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_alloc_info", v7, a2, a3, qword_100105AA0, 0, qword_100105AA8, qword_100105AB0, v8, a5, v6);
  }
  return result;
}

const char *acm_mem_free_info(const char *result, const void *a2, unint64_t a3, const char *a4, int a5, const char *a6)
{
  if (a2)
  {
    uint64_t v6 = qword_100105AA0 - a3;
    if (qword_100105AA0 < a3) {
      uint64_t v6 = 0;
    }
    qword_100105AA0 = v6;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    uint64_t v7 = "NULL";
    if (result) {
      id v8 = result;
    }
    else {
      id v8 = "NULL";
    }
    if (a4) {
      os_log_type_t v9 = a4;
    }
    else {
      os_log_type_t v9 = "NULL";
    }
    if (a6) {
      uint64_t v7 = a6;
    }
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_free_info", v8, a2, a3, qword_100105AA0, 0, qword_100105AA8, qword_100105AB0, v9, a5, v7);
  }
  return result;
}

uint64_t ACMContextCreate(uint64_t *a1)
{
  if (byte_100105849 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "ACMLib";
    __int16 v9 = 2080;
    int v10 = "ACMContextCreate";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  uint64_t v2 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *))sub_10009F9F4, (uint64_t)&v6, a1, &byte_100105849, 1);
  if (v2)
  {
    sub_1000A052C();
    unsigned int v3 = 70;
  }
  else
  {
    unsigned int v3 = 10;
    if (a1 && byte_100105849 <= 0x28u)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *a1;
        if (*a1) {
          LODWORD(v4) = *(_DWORD *)(v4 + 16);
        }
        *(_DWORD *)buf = 136315650;
        id v8 = "ACMLib";
        __int16 v9 = 2080;
        int v10 = "ACMContextCreate";
        __int16 v11 = 1024;
        LODWORD(v12) = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: CS[%u] created.\n", buf, 0x1Cu);
      }
      unsigned int v3 = 10;
    }
  }
  if (v3 >= byte_100105849 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v8 = "ACMLib";
    __int16 v9 = 2080;
    int v10 = "ACMContextCreate";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v2;
}

uint64_t sub_10009F9F4(uint64_t *a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  if (byte_100105849 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    unsigned __int8 v19 = "ACMLib";
    __int16 v20 = 2080;
    long long v21 = "ioKitTransport";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v18, 0x16u);
  }
  if (a1)
  {
    uint64_t v14 = sub_10009FFC4();
    unsigned int v15 = 70;
    if (v14)
    {
      uint64_t v16 = v14;
    }
    else
    {
      uint64_t v16 = sub_1000A01A8(*a1, a2, a3, a4, a5, a6, a7);
      if (v16) {
        unsigned int v15 = 70;
      }
      else {
        unsigned int v15 = 10;
      }
    }
  }
  else
  {
    unsigned int v15 = 70;
    uint64_t v16 = 4294967293;
  }
  if (v15 >= byte_100105849 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    unsigned __int8 v19 = "ACMLib";
    __int16 v20 = 2080;
    long long v21 = "ioKitTransport";
    __int16 v22 = 2048;
    uint64_t v23 = (int)v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v18, 0x20u);
  }
  return v16;
}

uint64_t ACMContextDelete(_DWORD *a1, int a2)
{
  unsigned int v4 = byte_100105849;
  if (byte_100105849 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextDelete";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
    unsigned int v4 = byte_100105849;
  }
  if (a1 && v4 <= 0x28 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = a1[4];
    uint64_t v6 = "deleted";
    *(_DWORD *)buf = 136315906;
    uint64_t v12 = "ACMLib";
    uint64_t v14 = "ACMContextDelete";
    __int16 v13 = 2080;
    if (a2) {
      uint64_t v6 = "destroyed";
    }
    __int16 v15 = 1024;
    LODWORD(v16[0]) = v5;
    WORD2(v16[0]) = 2080;
    *(void *)((char *)v16 + 6) = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: CS[%u] %s.\n", buf, 0x26u);
  }
  int v10 = a1;
  uint64_t v7 = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))sub_10009F9F4, (uint64_t)&v10, a1, a2);
  if (v7) {
    unsigned int v8 = 70;
  }
  else {
    unsigned int v8 = 10;
  }
  if (v8 >= byte_100105849 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextDelete";
    __int16 v15 = 2048;
    v16[0] = (int)v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMContextGetExternalForm(const void *a1, uint64_t a2)
{
  if (byte_100105849 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "ACMLib";
    __int16 v6 = 2080;
    uint64_t v7 = "ACMContextGetExternalForm";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v4, 0x16u);
  }
  if (!a1
    || !a2
    || sub_10009FFC4()
    || sub_1000A01A8((uint64_t)a1, 19, 0, a1, 0x10uLL, 0, 0))
  {
    (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, 0, 0);
  }
  else
  {
    (*(void (**)(uint64_t, const void *, uint64_t))(a2 + 16))(a2, a1, 16);
  }
  if (byte_100105849 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "ACMLib";
    __int16 v6 = 2080;
    uint64_t v7 = "ACMContextGetExternalForm";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t sub_10009FFC4()
{
  if (byte_100105849 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "ACMLib";
    __int16 v8 = 2080;
    __int16 v9 = "init";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v6, 0x16u);
  }
  if (byte_100105ABC)
  {
    uint64_t v0 = 0;
  }
  else
  {
    CFDictionaryRef v1 = IOServiceMatching("AppleCredentialManager");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v1);
    if (!MatchingService)
    {
      unsigned int v4 = 70;
      uint64_t v0 = 4294967291;
      goto LABEL_10;
    }
    io_object_t v3 = MatchingService;
    uint64_t v0 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_100105AB8);
    if (v0)
    {
      unsigned int v4 = 70;
      goto LABEL_10;
    }
    IOObjectRelease(v3);
    byte_100105ABC = 1;
  }
  unsigned int v4 = 10;
LABEL_10:
  if (v4 >= byte_100105849 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    uint64_t v7 = "ACMLib";
    __int16 v8 = 2080;
    __int16 v9 = "init";
    __int16 v10 = 2048;
    uint64_t v11 = (int)v0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v6, 0x20u);
  }
  return v0;
}

uint64_t sub_1000A01A8(uint64_t a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  if (byte_100105849 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v25 = "ACMLib";
    __int16 v26 = 2080;
    long long v27 = "performCommand";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t inputStructCnt = 0;
  uint64_t v14 = LibCall_BuildCommand(a2, 0, a3, a4, a5, &inputStructCnt);
  if (v14)
  {
    __int16 v15 = v14;
    if (!a6 && a7)
    {
      uint64_t v18 = 4294967293;
    }
    else
    {
      if (a7) {
        size_t v16 = *a7;
      }
      else {
        size_t v16 = 0;
      }
      size_t v22 = v16;
      uint64_t v17 = IOConnectCallStructMethod(dword_100105AB8, 0, v14, inputStructCnt, a6, &v22);
      uint64_t v18 = v17;
      if (a1) {
        LODWORD(a1) = *(_DWORD *)(a1 + 16);
      }
      if (v17)
      {
        if (byte_100105849 <= 0x46u
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          long long v25 = "ACMLib";
          __int16 v26 = 2080;
          long long v27 = "performCommand";
          __int16 v28 = 1024;
          *(_DWORD *)id v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          __int16 v30 = 1024;
          int v31 = v18;
          __int16 v32 = 1024;
          int v33 = v18;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> err 0x%x (%d).\n", buf, 0x2Eu);
        }
      }
      else
      {
        if (byte_100105849 <= 0x28u
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          long long v25 = "ACMLib";
          __int16 v26 = 2080;
          long long v27 = "performCommand";
          __int16 v28 = 1024;
          *(_DWORD *)id v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> ok.\n", buf, 0x22u);
        }
        uint64_t v18 = 0;
        if (a7) {
          *a7 = v22;
        }
      }
    }
    size_t v19 = inputStructCnt;
    acm_mem_free_info("<data>", v15, inputStructCnt, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 134, "performCommand");
    acm_mem_free_data(v15, v19);
    if (v18) {
      unsigned int v20 = 70;
    }
    else {
      unsigned int v20 = 10;
    }
  }
  else
  {
    unsigned int v20 = 70;
    uint64_t v18 = 4294967291;
  }
  if (v20 >= byte_100105849 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    long long v25 = "ACMLib";
    __int16 v26 = 2080;
    long long v27 = "performCommand";
    __int16 v28 = 2048;
    *(void *)id v29 = (int)v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v18;
}

void sub_1000A052C()
{
  if (byte_100105849 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v5 = "ACMLib";
    __int16 v6 = 2080;
    uint64_t v7 = "updateLogLevelFromKext";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  if (IOConnectCallScalarMethod(dword_100105AB8, 2u, 0, 0, &output, &outputCnt)) {
    goto LABEL_8;
  }
  unsigned __int8 v0 = output;
  unsigned int v1 = output;
  byte_100105849 = output;
  if (output <= 0x1EuLL && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v5 = "ACMLib";
    __int16 v6 = 2080;
    uint64_t v7 = "updateLogLevelFromKext";
    __int16 v8 = 1024;
    int v9 = v0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: log level set to %d.\n", buf, 0x1Cu);
LABEL_8:
    unsigned int v1 = byte_100105849;
  }
  if (v1 <= 0xA && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v5 = "ACMLib";
    __int16 v6 = 2080;
    uint64_t v7 = "updateLogLevelFromKext";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

unsigned char *LibCall_BuildCommand(char a1, char a2, char a3, const void *a4, size_t a5, void *a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_BuildCommand");
  }
  uint64_t v12 = 0;
  if (a5) {
    BOOL v13 = a4 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13 && a6)
  {
    if (a5 >= 0xFFFFFFFFFFFFFFF8)
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = acm_mem_alloc_data(a5 + 8);
      acm_mem_alloc_info("<data>", v12, a5 + 8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 22, "LibCall_BuildCommand");
      if (v12)
      {
        *a6 = a5 + 8;
        *(_DWORD *)uint64_t v12 = 1396920900;
        v12[4] = a1;
        v12[5] = a2;
        v12[6] = a3;
        if (a5) {
          memcpy(v12 + 8, a4, a5);
        }
      }
    }
  }
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: returning.\n", "ACM", "LibCall_BuildCommand");
  }
  return v12;
}

uint64_t LibCall_ACMContextCreate(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *), uint64_t a2, void *a3, unsigned char *a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreate");
  }
  unsigned int v10 = 70;
  uint64_t v11 = 4294967293;
  if (!a1 || !a3) {
    goto LABEL_25;
  }
  uint64_t v12 = acm_mem_alloc(0x14uLL);
  acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 50, "LibCall_ACMContextCreate");
  if (!v12)
  {
    unsigned int v10 = 70;
    uint64_t v11 = 4294967292;
    goto LABEL_25;
  }
  memset(v19, 0, sizeof(v19));
  if (a5)
  {
    uint64_t v18 = 21;
    uint64_t v13 = a1(a2, 36, 0, 0, 0, v19, &v18);
    if (!v13)
    {
      if (v18 != 21)
      {
        uint64_t v11 = 4294967291;
        goto LABEL_23;
      }
      uint64_t v11 = 0;
      goto LABEL_20;
    }
    uint64_t v11 = v13;
    if (v13 != -3)
    {
LABEL_23:
      acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 89, "LibCall_ACMContextCreate");
      acm_mem_free(v12, 0x14uLL);
      unsigned int v10 = 70;
      goto LABEL_25;
    }
  }
  uint64_t v18 = 17;
  unsigned int v14 = a1(a2, 1, 0, 0, 0, v19, &v18);
  if (v18 == 17) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = -5;
  }
  if (v14) {
    uint64_t v11 = v14;
  }
  else {
    uint64_t v11 = v15;
  }
  if (!v14 && v18 == 17)
  {
LABEL_20:
    int v16 = *(_DWORD *)&v19[17];
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v19;
    v12[4] = v16;
    *a3 = v12;
    if (a4) {
      *a4 = v19[16];
    }
  }
  if (v11) {
    goto LABEL_23;
  }
  unsigned int v10 = 10;
LABEL_25:
  if (v10 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreate", (int)v11);
  }
  return v11;
}

uint64_t LibCall_ACMContextDelete(void (*a1)(uint64_t, uint64_t, void, void *, uint64_t, void, void), uint64_t a2, void *a3, int a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextDelete");
  }
  if (a1 && a3)
  {
    if (a4) {
      a1(a2, 2, 0, a3, 16, 0, 0);
    }
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    acm_mem_free_info("ACMHandleWithPayload", a3, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 172, "LibCall_ACMContextDelete");
    acm_mem_free(a3, 0x14uLL);
    uint64_t v8 = 0;
    unsigned int v9 = 10;
    goto LABEL_8;
  }
  unsigned int v9 = 70;
  uint64_t v8 = 4294967293;
LABEL_8:
  if (v9 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextDelete", (int)v8);
  }
  return v8;
}

uint64_t sub_1000A0BD8()
{
  if (qword_100105AC8 != -1) {
    dispatch_once(&qword_100105AC8, &stru_1000EC750);
  }
  dispatch_sync((dispatch_queue_t)qword_100105AD0, &stru_1000EC710);
  uint64_t result = dword_100105AC0;
  if (!dword_100105AC0)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return dword_100105AC0;
  }
  return result;
}

void sub_1000A0C64(id a1)
{
  if (!dword_100105AC0) {
    dword_100105AC0 = sub_1000A0CD0("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
}

void sub_1000A0CA4(id a1)
{
  qword_100105AD0 = (uint64_t)dispatch_queue_create("aks-client-queue", 0);
}

uint64_t sub_1000A0CD0(char *path, const char *a2)
{
  kern_return_t v5;
  CFDictionaryRef v6;
  io_service_t MatchingService;
  io_object_t v8;
  uint64_t result;
  kern_return_t v10;
  io_connect_t connect;

  connect = 0;
  io_service_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, path);
  if (!v3 || (v4 = v3, int v5 = IOServiceOpen(v3, mach_task_self_, 0, &connect), IOObjectRelease(v4), v5))
  {
    __int16 v6 = IOServiceMatching(a2);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
    if (MatchingService)
    {
      uint64_t v8 = MatchingService;
      IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      IOObjectRelease(v8);
    }
  }
  uint64_t result = connect;
  if (connect)
  {
    unsigned int v10 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    uint64_t result = connect;
    if (v10)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000A0DC8(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t v9 = 3758097084;
  long long v21 = 0;
  int v20 = 0;
  mach_port_t v10 = sub_1000A0BD8();
  if (v10)
  {
    mach_port_t v16 = v10;
    if (a2) {
      uint64_t v17 = a2;
    }
    else {
      uint64_t v17 = "";
    }
    sub_1000A0FE4((char **)&v21, (unsigned int *)&v20, 2, v11, v12, v13, v14, v15, (uint64_t)v17);
    if (v21)
    {
      input[0] = a1;
      input[1] = a6;
      input[2] = (uint64_t)v21;
      input[3] = v20;
      uint64_t v9 = IOConnectCallMethod(v16, 0x2Au, input, 4u, 0, 0, 0, 0, 0, 0);
      uint64_t v18 = v21;
    }
    else
    {
      uint64_t v18 = 0;
      uint64_t v9 = 3758097085;
    }
  }
  else
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_verify_password", ":", 1807, "", 0, "", "");
    uint64_t v18 = 0;
  }
  free(v18);
  return v9;
}

uint64_t sub_1000A0F54(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1000A0DC8(a1, a2, a3, a4, a5, 0);
}

char *sub_1000A0F5C(_DWORD *a1, const void *a2, int a3)
{
  io_service_t v3 = (char *)(a1 + 1);
  if (a2)
  {
    *a1 = a3;
    memcpy(a1 + 1, a2, a3);
    v3 += a3;
    int v5 = -a3;
    size_t v6 = -a3 & 3;
    if ((v5 & 3) != 0)
    {
      int __s = 0;
      memset_s(&__s, 4uLL, 0, 4uLL);
      memcpy(v3, &__s, v6);
      v3 += v6;
    }
  }
  else
  {
    *a1 = 0;
  }
  return v3;
}

char *sub_1000A0FE4(char **a1, unsigned int *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  long long v21 = &a9;
  unsigned int v12 = 4;
  if (a3)
  {
    int v13 = a3;
    do
    {
      uint64_t v14 = v21;
      v21 += 2;
      v12 += *((_DWORD *)v14 + 2) + (-*((_DWORD *)v14 + 2) & 3) + 4;
      --v13;
    }
    while (v13);
  }
  uint64_t result = (char *)calloc(1uLL, v12);
  mach_port_t v16 = result;
  size_t v22 = (const void **)&a9;
  int v17 = 0;
  if (a3)
  {
    uint64_t v18 = 4;
    do
    {
      size_t v19 = v22;
      int v20 = *v22;
      v22 += 2;
      uint64_t result = sub_1000A0F5C(&v16[v18], v20, *((_DWORD *)v19 + 2));
      uint64_t v18 = result - v16;
      ++v17;
    }
    while (a3 != v17);
  }
  *(_DWORD *)mach_port_t v16 = v17;
  *a1 = v16;
  *a2 = v12;
  return result;
}

void sub_1000A10C4()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A114C()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A11D4()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A125C()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A12E4()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A136C()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A13F4()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A147C()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1504()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A158C()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1614()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A169C()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1724()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A17AC()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1834()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A18BC()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1944()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A19CC()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1A54()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1ADC()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1B64()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1BEC()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1C74()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1CFC()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1D84()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1E0C()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1E94()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1F1C()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A1FA4()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A202C()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A20B4()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A213C()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A21C4()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A224C()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A22D4()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A235C()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A23E4()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A246C()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A24F4()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A257C()
{
  sub_100013E84();
  sub_100013E70();
  sub_100013E94((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_1000A2604(void *a1)
{
  id v1 = objc_begin_catch(a1);
  uint64_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138543362;
    id v4 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Caught exception %{public}@ while attempting to remove an account.", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

void sub_1000A26C0(void *a1)
{
  id v1 = objc_begin_catch(a1);
  uint64_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138543362;
    id v4 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Caught exception %{public}@ while attempting to remove an account.", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

void sub_1000A277C(void *a1)
{
  id v1 = objc_begin_catch(a1);
  uint64_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138543362;
    id v4 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Caught exception %{public}@ while attempting to remove an account.", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

void sub_1000A2838(void *a1)
{
  id v1 = objc_begin_catch(a1);
  uint64_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138543362;
    id v4 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Caught exception %{public}@ while attempting to remove an account.", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

void sub_1000A28F4(void *a1)
{
  id v1 = objc_begin_catch(a1);
  uint64_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138543362;
    id v4 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Caught exception %{public}@ while attempting to remove an account.", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

unsigned int CCCalibratePBKDF(CCPBKDFAlgorithm algorithm, size_t passwordLen, size_t saltLen, CCPseudoRandomAlgorithm prf, size_t derivedKeyLen, uint32_t msec)
{
  return _CCCalibratePBKDF(algorithm, passwordLen, saltLen, prf, derivedKeyLen, msec);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayGetFirstIndexOfValue(theArray, range, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

uint64_t CFURLCredentialCopyPassword()
{
  return _CFURLCredentialCopyPassword();
}

uint64_t CFURLCredentialCreate()
{
  return _CFURLCredentialCreate();
}

uint64_t CFURLCredentialGetUsername()
{
  return _CFURLCredentialGetUsername();
}

uint64_t CRHandleCarPlayRestrictionChanged()
{
  return _CRHandleCarPlayRestrictionChanged();
}

uint64_t CTSubscriptionSlotAsString()
{
  return _CTSubscriptionSlotAsString();
}

uint64_t DMCAnalyticsSendEnrollmentEvent()
{
  return _DMCAnalyticsSendEnrollmentEvent();
}

uint64_t DMCErrorArray()
{
  return _DMCErrorArray();
}

uint64_t DMCSafelyCopyItemAtPathToDestinationPathFM()
{
  return _DMCSafelyCopyItemAtPathToDestinationPathFM();
}

uint64_t EAPOLClientConfigurationCreateWithAuthorization()
{
  return _EAPOLClientConfigurationCreateWithAuthorization();
}

uint64_t EAPOLClientConfigurationGetProfileWithID()
{
  return _EAPOLClientConfigurationGetProfileWithID();
}

uint64_t EAPOLClientConfigurationGetProfileWithWLANDomain()
{
  return _EAPOLClientConfigurationGetProfileWithWLANDomain();
}

uint64_t EAPOLClientConfigurationGetProfileWithWLANSSID()
{
  return _EAPOLClientConfigurationGetProfileWithWLANSSID();
}

uint64_t EAPOLClientConfigurationGetSystemEthernetProfile()
{
  return _EAPOLClientConfigurationGetSystemEthernetProfile();
}

uint64_t EAPOLClientConfigurationRemoveProfile()
{
  return _EAPOLClientConfigurationRemoveProfile();
}

uint64_t EAPOLClientConfigurationSave()
{
  return _EAPOLClientConfigurationSave();
}

uint64_t EAPOLClientConfigurationSetSystemEthernetProfile()
{
  return _EAPOLClientConfigurationSetSystemEthernetProfile();
}

uint64_t EAPOLClientItemIDCreateWithProfile()
{
  return _EAPOLClientItemIDCreateWithProfile();
}

uint64_t EAPOLClientItemIDRemovePasswordItem()
{
  return _EAPOLClientItemIDRemovePasswordItem();
}

uint64_t EAPOLClientItemIDSetIdentity()
{
  return _EAPOLClientItemIDSetIdentity();
}

uint64_t EAPOLClientItemIDSetPasswordItem()
{
  return _EAPOLClientItemIDSetPasswordItem();
}

uint64_t EAPOLClientProfileCreate()
{
  return _EAPOLClientProfileCreate();
}

uint64_t EAPOLClientProfileGetID()
{
  return _EAPOLClientProfileGetID();
}

uint64_t EAPOLClientProfileGetInformation()
{
  return _EAPOLClientProfileGetInformation();
}

uint64_t EAPOLClientProfileSetAuthenticationProperties()
{
  return _EAPOLClientProfileSetAuthenticationProperties();
}

uint64_t EAPOLClientProfileSetInformation()
{
  return _EAPOLClientProfileSetInformation();
}

uint64_t EAPOLClientProfileSetUserDefinedName()
{
  return _EAPOLClientProfileSetUserDefinedName();
}

uint64_t EAPOLClientProfileSetWLANDomain()
{
  return _EAPOLClientProfileSetWLANDomain();
}

uint64_t EAPOLClientProfileSetWLANSSIDAndSecurityType()
{
  return _EAPOLClientProfileSetWLANSSIDAndSecurityType();
}

uint64_t EAPSecIdentityHandleCreate()
{
  return _EAPSecIdentityHandleCreate();
}

uint64_t EAPSecIdentityHandleCreateSecIdentity()
{
  return _EAPSecIdentityHandleCreateSecIdentity();
}

uint64_t GSFontCopyPersistentPostscriptURL()
{
  return _GSFontCopyPersistentPostscriptURL();
}

uint64_t GSFontInitialize()
{
  return _GSFontInitialize();
}

uint64_t GSFontRegisterPersistentURLs()
{
  return _GSFontRegisterPersistentURLs();
}

uint64_t GSFontUnregisterPersistentURLs()
{
  return _GSFontUnregisterPersistentURLs();
}

uint64_t GSFontUnregisterURL()
{
  return _GSFontUnregisterURL();
}

uint64_t GSSendAppPreferencesChanged()
{
  return _GSSendAppPreferencesChanged();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MAERecertifyDeviceWithError()
{
  return _MAERecertifyDeviceWithError();
}

uint64_t MCASPolicyPreflighterClass()
{
  return _MCASPolicyPreflighterClass();
}

uint64_t MCBackupContainsPasscodeFilePath()
{
  return _MCBackupContainsPasscodeFilePath();
}

uint64_t MCBiometricKitClass()
{
  return _MCBiometricKitClass();
}

uint64_t MCBundleIDFromAuditToken()
{
  return _MCBundleIDFromAuditToken();
}

uint64_t MCBundleIDToContainingBundleIDMap()
{
  return _MCBundleIDToContainingBundleIDMap();
}

uint64_t MCCGDataProviderCreateWithURL()
{
  return _MCCGDataProviderCreateWithURL();
}

uint64_t MCCGFontCopyFullName()
{
  return _MCCGFontCopyFullName();
}

uint64_t MCCGFontCopyPostScriptName()
{
  return _MCCGFontCopyPostScriptName();
}

uint64_t MCCGFontCreateWithDataProvider()
{
  return _MCCGFontCreateWithDataProvider();
}

uint64_t MCCTClearManagedCellularProfile()
{
  return _MCCTClearManagedCellularProfile();
}

uint64_t MCCTFontManagerCreateFontDescriptorsFromURL()
{
  return _MCCTFontManagerCreateFontDescriptorsFromURL();
}

uint64_t MCCTGetManagedCellularProfile()
{
  return _MCCTGetManagedCellularProfile();
}

uint64_t MCCTHasCellular()
{
  return _MCCTHasCellular();
}

uint64_t MCCTIMEI()
{
  return _MCCTIMEI();
}

uint64_t MCCTMEID()
{
  return _MCCTMEID();
}

uint64_t MCCTSetManagedCellularProfile()
{
  return _MCCTSetManagedCellularProfile();
}

uint64_t MCCheckSystemGroupContainerFileReadability()
{
  return _MCCheckSystemGroupContainerFileReadability();
}

uint64_t MCCloudConfigurationDetailsFilePath()
{
  return _MCCloudConfigurationDetailsFilePath();
}

uint64_t MCCloudConfigurationSetAsideDetailsFilePath()
{
  return _MCCloudConfigurationSetAsideDetailsFilePath();
}

uint64_t MCConfigurationProfilesSystemGroupContainer()
{
  return _MCConfigurationProfilesSystemGroupContainer();
}

uint64_t MCContainingBundleIDForBundleID()
{
  return _MCContainingBundleIDForBundleID();
}

uint64_t MCCrashDetectionFilePath()
{
  return _MCCrashDetectionFilePath();
}

uint64_t MCDestinationPathIsSafeFromSymlinkAttacks()
{
  return _MCDestinationPathIsSafeFromSymlinkAttacks();
}

uint64_t MCEASOverSimplifiedStatusForError()
{
  return _MCEASOverSimplifiedStatusForError();
}

uint64_t MCEffectiveSingleAppModeBundleID()
{
  return _MCEffectiveSingleAppModeBundleID();
}

uint64_t MCEffectiveUserSettingsFilePath()
{
  return _MCEffectiveUserSettingsFilePath();
}

uint64_t MCEqualStrings()
{
  return _MCEqualStrings();
}

uint64_t MCErrorArray()
{
  return _MCErrorArray();
}

uint64_t MCErrorArrayByDevice()
{
  return _MCErrorArrayByDevice();
}

uint64_t MCErrorArrayFromLocalizedDescription()
{
  return _MCErrorArrayFromLocalizedDescription();
}

uint64_t MCFixHostileSymlinks()
{
  return _MCFixHostileSymlinks();
}

uint64_t MCFixPermissionsOfSystemGroupContainerDirectoryAndContentsFM()
{
  return _MCFixPermissionsOfSystemGroupContainerDirectoryAndContentsFM();
}

uint64_t MCGestaltGetDeviceUUID()
{
  return _MCGestaltGetDeviceUUID();
}

uint64_t MCGestaltGetProductName()
{
  return _MCGestaltGetProductName();
}

uint64_t MCGestaltHasSEP()
{
  return _MCGestaltHasSEP();
}

uint64_t MCGestaltIsAppleTV()
{
  return _MCGestaltIsAppleTV();
}

uint64_t MCGestaltIsHomePod()
{
  return _MCGestaltIsHomePod();
}

uint64_t MCGestaltIsPhone()
{
  return _MCGestaltIsPhone();
}

uint64_t MCGestaltIsVisionDevice()
{
  return _MCGestaltIsVisionDevice();
}

uint64_t MCGestaltIsWatch()
{
  return _MCGestaltIsWatch();
}

uint64_t MCGestaltIsiPad()
{
  return _MCGestaltIsiPad();
}

uint64_t MCGestaltSupportsMultiUser()
{
  return _MCGestaltSupportsMultiUser();
}

uint64_t MCGetBaseResourcePath()
{
  return _MCGetBaseResourcePath();
}

uint64_t MCHCUSetHostCertificateDataForMappedLabel()
{
  return _MCHCUSetHostCertificateDataForMappedLabel();
}

uint64_t MCHasMigrated()
{
  return _MCHasMigrated();
}

uint64_t MCIOSerialString()
{
  return _MCIOSerialString();
}

uint64_t MCIsAppAccountBasedSourceForOpenIn()
{
  return _MCIsAppAccountBasedSourceForOpenIn();
}

uint64_t MCIsAppBasicallySafari()
{
  return _MCIsAppBasicallySafari();
}

uint64_t MCIsAppExemptFromOpenInSourceRestrictions()
{
  return _MCIsAppExemptFromOpenInSourceRestrictions();
}

uint64_t MCKeybagClearMementoBlob()
{
  return _MCKeybagClearMementoBlob();
}

uint64_t MCKeybagClearPasscodeGenerationCaches()
{
  return _MCKeybagClearPasscodeGenerationCaches();
}

uint64_t MCKeybagCreateMDMEscrowWithPasscode()
{
  return _MCKeybagCreateMDMEscrowWithPasscode();
}

uint64_t MCKeybagCurrentMaximumFailedPasscodeAttempts()
{
  return _MCKeybagCurrentMaximumFailedPasscodeAttempts();
}

uint64_t MCKeybagCurrentPasscodeGeneration()
{
  return _MCKeybagCurrentPasscodeGeneration();
}

uint64_t MCKeybagCurrentPasscodeGracePeriod()
{
  return _MCKeybagCurrentPasscodeGracePeriod();
}

uint64_t MCKeybagDeleteMDMEscrowData()
{
  return _MCKeybagDeleteMDMEscrowData();
}

uint64_t MCKeybagDeleteMDMEscrowSecret()
{
  return _MCKeybagDeleteMDMEscrowSecret();
}

uint64_t MCKeybagHasMDMEscrowDataAndSecret()
{
  return _MCKeybagHasMDMEscrowDataAndSecret();
}

uint64_t MCKeybagMementoBlobExists()
{
  return _MCKeybagMementoBlobExists();
}

uint64_t MCKeybagMementoPasscodeGeneration()
{
  return _MCKeybagMementoPasscodeGeneration();
}

uint64_t MCKeybagMementoSupported()
{
  return _MCKeybagMementoSupported();
}

uint64_t MCKeybagSetMaximumFailedPasscodeAttempts()
{
  return _MCKeybagSetMaximumFailedPasscodeAttempts();
}

uint64_t MCKeybagSetPasscodeGracePeriod()
{
  return _MCKeybagSetPasscodeGracePeriod();
}

uint64_t MCKeychainCopyIdentityFromPKCS12()
{
  return _MCKeychainCopyIdentityFromPKCS12();
}

uint64_t MCLDAPSearchSettingsClass()
{
  return _MCLDAPSearchSettingsClass();
}

uint64_t MCLegacyCloudConfigurationDetailsFilePath()
{
  return _MCLegacyCloudConfigurationDetailsFilePath();
}

uint64_t MCLegacyPostSetupAutoInstallProfilePath()
{
  return _MCLegacyPostSetupAutoInstallProfilePath();
}

uint64_t MCLegacyProfileStorageDirectory()
{
  return _MCLegacyProfileStorageDirectory();
}

uint64_t MCLegacyPublicInfoDirectory()
{
  return _MCLegacyPublicInfoDirectory();
}

uint64_t MCLocalizedErrorFormatByDevice()
{
  return _MCLocalizedErrorFormatByDevice();
}

uint64_t MCLocalizedErrorString()
{
  return _MCLocalizedErrorString();
}

uint64_t MCLocalizedFormat()
{
  return _MCLocalizedFormat();
}

uint64_t MCLocalizedFormatByDevice()
{
  return _MCLocalizedFormatByDevice();
}

uint64_t MCLocalizedString()
{
  return _MCLocalizedString();
}

uint64_t MCLocalizedStringByDevice()
{
  return _MCLocalizedStringByDevice();
}

uint64_t MCLockdownCopyBuiltInIdentity()
{
  return _MCLockdownCopyBuiltInIdentity();
}

uint64_t MCLockdownDeletePairingRecords()
{
  return _MCLockdownDeletePairingRecords();
}

uint64_t MCLockdownGetDeviceIntermediateCertificates()
{
  return _MCLockdownGetDeviceIntermediateCertificates();
}

uint64_t MCLockdownOperationQueue()
{
  return _MCLockdownOperationQueue();
}

uint64_t MCLoggingInitialize()
{
  return _MCLoggingInitialize();
}

uint64_t MCNEProfileIngestionClass()
{
  return _MCNEProfileIngestionClass();
}

uint64_t MCNEProfileIngestionHandlerClassForPayload()
{
  return _MCNEProfileIngestionHandlerClassForPayload();
}

uint64_t MCNagUIMetaFilePath()
{
  return _MCNagUIMetaFilePath();
}

uint64_t MCNewsServicesFrameworkPath()
{
  return _MCNewsServicesFrameworkPath();
}

uint64_t MCOSLogInstallProfilePayload()
{
  return _MCOSLogInstallProfilePayload();
}

uint64_t MCOSLogRemoveProfilePayload()
{
  return _MCOSLogRemoveProfilePayload();
}

uint64_t MCOutstandingNagComputationFilePath()
{
  return _MCOutstandingNagComputationFilePath();
}

uint64_t MCPasscodeNagKeepAliveFilePath()
{
  return _MCPasscodeNagKeepAliveFilePath();
}

uint64_t MCPostSetupAutoInstallProfilePath()
{
  return _MCPostSetupAutoInstallProfilePath();
}

uint64_t MCPostSetupAutoInstallSetAsideProfilePath()
{
  return _MCPostSetupAutoInstallSetAsideProfilePath();
}

uint64_t MCPowerlogControlReadMode()
{
  return _MCPowerlogControlReadMode();
}

uint64_t MCPowerlogControlSwitchMode()
{
  return _MCPowerlogControlSwitchMode();
}

uint64_t MCProductBuildVersion()
{
  return _MCProductBuildVersion();
}

uint64_t MCProfileConnectionXPCProtocolInterface()
{
  return _MCProfileConnectionXPCProtocolInterface();
}

uint64_t MCPublicEffectiveUserSettingsFilePath()
{
  return _MCPublicEffectiveUserSettingsFilePath();
}

uint64_t MCRestrictionsFilePath()
{
  return _MCRestrictionsFilePath();
}

uint64_t MCSBAddWebClipToHomeScreen()
{
  return _MCSBAddWebClipToHomeScreen();
}

uint64_t MCSBGetScreenLockStatus()
{
  return _MCSBGetScreenLockStatus();
}

uint64_t MCSBRemoveWebClipFromHomeScreen()
{
  return _MCSBRemoveWebClipFromHomeScreen();
}

uint64_t MCSBSApplicationLaunchFromURLOptionUnlockDeviceKey()
{
  return _MCSBSApplicationLaunchFromURLOptionUnlockDeviceKey();
}

uint64_t MCSBSSpringBoardServerPort()
{
  return _MCSBSSpringBoardServerPort();
}

uint64_t MCSendActivationRecordStoredNotification()
{
  return _MCSendActivationRecordStoredNotification();
}

uint64_t MCSendAirPlayPreferencesChangedNotification()
{
  return _MCSendAirPlayPreferencesChangedNotification();
}

uint64_t MCSendAllowHealthDataSubmissionChangedNotification()
{
  return _MCSendAllowHealthDataSubmissionChangedNotification();
}

uint64_t MCSendAllowPasscodeModificationChangedNotification()
{
  return _MCSendAllowPasscodeModificationChangedNotification();
}

uint64_t MCSendAppWhitelistChangedNotification()
{
  return _MCSendAppWhitelistChangedNotification();
}

uint64_t MCSendClearPasscodeGenerationCachesNotification()
{
  return _MCSendClearPasscodeGenerationCachesNotification();
}

uint64_t MCSendClientTruthChangedNotification()
{
  return _MCSendClientTruthChangedNotification();
}

uint64_t MCSendCloudConfigurationDetailsChangedNotification()
{
  return _MCSendCloudConfigurationDetailsChangedNotification();
}

uint64_t MCSendDependencyChangedNotification()
{
  return _MCSendDependencyChangedNotification();
}

uint64_t MCSendEffectiveSettingsChangedNotification()
{
  return _MCSendEffectiveSettingsChangedNotification();
}

uint64_t MCSendExternalIntelligenceWorkspaceListChangedNotification()
{
  return _MCSendExternalIntelligenceWorkspaceListChangedNotification();
}

uint64_t MCSendHomeScreenLayoutChangedNotification()
{
  return _MCSendHomeScreenLayoutChangedNotification();
}

uint64_t MCSendKeyboardSettingsChangedNotification()
{
  return _MCSendKeyboardSettingsChangedNotification();
}

uint64_t MCSendNewsSettingsChangedNotification()
{
  return _MCSendNewsSettingsChangedNotification();
}

uint64_t MCSendPasscodeComplianceChangedNotification()
{
  return _MCSendPasscodeComplianceChangedNotification();
}

uint64_t MCSendPasscodePolicyChangedNotification()
{
  return _MCSendPasscodePolicyChangedNotification();
}

uint64_t MCSendProfileListChangedNotification()
{
  return _MCSendProfileListChangedNotification();
}

uint64_t MCSendRemovedSystemAppsChangedNotification()
{
  return _MCSendRemovedSystemAppsChangedNotification();
}

uint64_t MCSendRestrictionChangedNotification()
{
  return _MCSendRestrictionChangedNotification();
}

uint64_t MCSendSafariCookiePolicyChangedNotification()
{
  return _MCSendSafariCookiePolicyChangedNotification();
}

uint64_t MCSendSettingsChangedNotification()
{
  return _MCSendSettingsChangedNotification();
}

uint64_t MCSendUnlockScreenTypeDidChangeNotification()
{
  return _MCSendUnlockScreenTypeDidChangeNotification();
}

uint64_t MCSendUserNotificationsSettingsChangedNotification()
{
  return _MCSendUserNotificationsSettingsChangedNotification();
}

uint64_t MCSendWebContentFilterChangedNotification()
{
  return _MCSendWebContentFilterChangedNotification();
}

uint64_t MCSendWebContentFilterTypeChangedNotification()
{
  return _MCSendWebContentFilterTypeChangedNotification();
}

uint64_t MCSendWebContentFilterUIActiveChangedNotification()
{
  return _MCSendWebContentFilterUIActiveChangedNotification();
}

uint64_t MCSetSkipBackupAttributeToItemAtPath()
{
  return _MCSetSkipBackupAttributeToItemAtPath();
}

uint64_t MCSettingsEventsFilePath()
{
  return _MCSettingsEventsFilePath();
}

uint64_t MCSetupAssistantSettingsFilePath()
{
  return _MCSetupAssistantSettingsFilePath();
}

uint64_t MCSharedDeviceConfigurationFilePath()
{
  return _MCSharedDeviceConfigurationFilePath();
}

uint64_t MCStringForBool()
{
  return _MCStringForBool();
}

uint64_t MCSystemAppAccessibilityParametersFilePath()
{
  return _MCSystemAppAccessibilityParametersFilePath();
}

uint64_t MCSystemAppOptionsByBundleIDFilePath()
{
  return _MCSystemAppOptionsByBundleIDFilePath();
}

uint64_t MCSystemAppWhitelistByProfileFilePath()
{
  return _MCSystemAppWhitelistByProfileFilePath();
}

uint64_t MCSystemClientRestrictionsFilePath()
{
  return _MCSystemClientRestrictionsFilePath();
}

uint64_t MCSystemEffectiveAppWhitelistFilePath()
{
  return _MCSystemEffectiveAppWhitelistFilePath();
}

uint64_t MCSystemGroupContainerPathWithGroupIdentifier()
{
  return _MCSystemGroupContainerPathWithGroupIdentifier();
}

uint64_t MCSystemHomeScreenLayoutFilePath()
{
  return _MCSystemHomeScreenLayoutFilePath();
}

uint64_t MCSystemLostModeRequestPath()
{
  return _MCSystemLostModeRequestPath();
}

uint64_t MCSystemManifestPath()
{
  return _MCSystemManifestPath();
}

uint64_t MCSystemMetadataFilePath()
{
  return _MCSystemMetadataFilePath();
}

uint64_t MCSystemNamespacedUserSettingsFilePath()
{
  return _MCSystemNamespacedUserSettingsFilePath();
}

uint64_t MCSystemNotificationSettingsFilePath()
{
  return _MCSystemNotificationSettingsFilePath();
}

uint64_t MCSystemPreferencesDirectory()
{
  return _MCSystemPreferencesDirectory();
}

uint64_t MCSystemProfileLibraryDirectory()
{
  return _MCSystemProfileLibraryDirectory();
}

uint64_t MCSystemProfileRestrictionsFilePath()
{
  return _MCSystemProfileRestrictionsFilePath();
}

uint64_t MCSystemProfileStorageDirectory()
{
  return _MCSystemProfileStorageDirectory();
}

uint64_t MCSystemPublicInfoDirectory()
{
  return _MCSystemPublicInfoDirectory();
}

uint64_t MCSystemRestartLogPath()
{
  return _MCSystemRestartLogPath();
}

uint64_t MCSystemRootDirectory()
{
  return _MCSystemRootDirectory();
}

uint64_t MCSystemShutDownLogPath()
{
  return _MCSystemShutDownLogPath();
}

uint64_t MCSystemUserSettingsFilePath()
{
  return _MCSystemUserSettingsFilePath();
}

uint64_t MCSystemWatchEnrollmentDataFilePath()
{
  return _MCSystemWatchEnrollmentDataFilePath();
}

uint64_t MCTagsMappingFilePath()
{
  return _MCTagsMappingFilePath();
}

uint64_t MCUMUserManagerClass()
{
  return _MCUMUserManagerClass();
}

uint64_t MCUSEnglishErrorString()
{
  return _MCUSEnglishErrorString();
}

uint64_t MCUserClientRestrictionsFilePath()
{
  return _MCUserClientRestrictionsFilePath();
}

uint64_t MCUserHomeScreenLayoutFilePath()
{
  return _MCUserHomeScreenLayoutFilePath();
}

uint64_t MCUserManifestPath()
{
  return _MCUserManifestPath();
}

uint64_t MCUserMetadataFilePath()
{
  return _MCUserMetadataFilePath();
}

uint64_t MCUserNamespacedUserSettingsFilePath()
{
  return _MCUserNamespacedUserSettingsFilePath();
}

uint64_t MCUserNotificationSettingsFilePath()
{
  return _MCUserNotificationSettingsFilePath();
}

uint64_t MCUserProfileRestrictionsFilePath()
{
  return _MCUserProfileRestrictionsFilePath();
}

uint64_t MCUserProfileStorageDirectory()
{
  return _MCUserProfileStorageDirectory();
}

uint64_t MCUserPublicInfoDirectory()
{
  return _MCUserPublicInfoDirectory();
}

uint64_t MCUserUserSettingsFilePath()
{
  return _MCUserUserSettingsFilePath();
}

uint64_t MCWebContentFilterOutputPath()
{
  return _MCWebContentFilterOutputPath();
}

uint64_t MCXPCProtocolInterface()
{
  return _MCXPCProtocolInterface();
}

uint64_t MCiPCUKeychainMapPath()
{
  return _MCiPCUKeychainMapPath();
}

uint64_t MCkASSyncDefaultFoldersOnly()
{
  return _MCkASSyncDefaultFoldersOnly();
}

uint64_t MCkESExchangeAccountWipeOnly()
{
  return _MCkESExchangeAccountWipeOnly();
}

uint64_t MCkESExchangeDeviceID()
{
  return _MCkESExchangeDeviceID();
}

uint64_t MCkESExchangeUserEnrollmentMode()
{
  return _MCkESExchangeUserEnrollmentMode();
}

uint64_t MDMAppManagementFilePath()
{
  return _MDMAppManagementFilePath();
}

uint64_t MDMCloudConfigurationDetailsFilePath()
{
  return _MDMCloudConfigurationDetailsFilePath();
}

uint64_t MDMCloudConfigurationSetAsideDetailsFilePath()
{
  return _MDMCloudConfigurationSetAsideDetailsFilePath();
}

uint64_t MDMFilePath()
{
  return _MDMFilePath();
}

uint64_t MDMManagedNonStoreBooksDirectory()
{
  return _MDMManagedNonStoreBooksDirectory();
}

uint64_t MDMOutstandingActivitiesFilePath()
{
  return _MDMOutstandingActivitiesFilePath();
}

uint64_t MDMPostSetupAutoInstallProfilePath()
{
  return _MDMPostSetupAutoInstallProfilePath();
}

uint64_t MDMPostSetupAutoInstallSetAsideProfilePath()
{
  return _MDMPostSetupAutoInstallSetAsideProfilePath();
}

uint64_t MDMSendDevicePostureChangedNotification()
{
  return _MDMSendDevicePostureChangedNotification();
}

uint64_t MDMSendManagingOrgInfoChangedNotification()
{
  return _MDMSendManagingOrgInfoChangedNotification();
}

uint64_t MDMUserFilePath()
{
  return _MDMUserFilePath();
}

uint64_t MDMUserOutstandingActivitiesFilePath()
{
  return _MDMUserOutstandingActivitiesFilePath();
}

uint64_t MISEnumerateInstalledProvisioningProfiles()
{
  return _MISEnumerateInstalledProvisioningProfiles();
}

uint64_t MISInstallProvisioningProfile()
{
  return _MISInstallProvisioningProfile();
}

uint64_t MISProfileCreateWithData()
{
  return _MISProfileCreateWithData();
}

uint64_t MISProvisioningProfileCheckValidity()
{
  return _MISProvisioningProfileCheckValidity();
}

uint64_t MISProvisioningProfileGetExpirationDate()
{
  return _MISProvisioningProfileGetExpirationDate();
}

uint64_t MISProvisioningProfileGetName()
{
  return _MISProvisioningProfileGetName();
}

uint64_t MISProvisioningProfileGetUUID()
{
  return _MISProvisioningProfileGetUUID();
}

uint64_t MISProvisioningProfileIncludesDevice()
{
  return _MISProvisioningProfileIncludesDevice();
}

uint64_t MISProvisioningProfileIsForLocalProvisioning()
{
  return _MISProvisioningProfileIsForLocalProvisioning();
}

uint64_t MISProvisioningProfileValidateSignature()
{
  return _MISProvisioningProfileValidateSignature();
}

uint64_t MISQueryBlacklistForBundle()
{
  return _MISQueryBlacklistForBundle();
}

uint64_t MISRemoveProvisioningProfile()
{
  return _MISRemoveProvisioningProfile();
}

uint64_t MKBDeviceLockAssertion()
{
  return _MKBDeviceLockAssertion();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t MKBKeyBagChangeSystemSecret()
{
  return _MKBKeyBagChangeSystemSecret();
}

uint64_t MKBKeyBagChangeSystemSecretOpts()
{
  return _MKBKeyBagChangeSystemSecretOpts();
}

uint64_t MKBKeyBagChangeSystemSecretWithEscrow()
{
  return _MKBKeyBagChangeSystemSecretWithEscrow();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return _NRWatchOSVersionForRemoteDevice();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PCSettingsSetGlobalMCCForceManualWhenRoaming()
{
  return _PCSettingsSetGlobalMCCForceManualWhenRoaming();
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateProxies(CFAllocatorRef allocator)
{
  return _SCDynamicStoreKeyCreateProxies(allocator);
}

Boolean SCDynamicStoreNotifyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreNotifyValue(store, key);
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetBSDName(interface);
}

SCNetworkInterfaceRef SCNetworkInterfaceGetInterface(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetInterface(interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetInterfaceType(interface);
}

uint64_t SCNetworkInterfaceSetQoSMarkingPolicy()
{
  return _SCNetworkInterfaceSetQoSMarkingPolicy();
}

CFDictionaryRef SCNetworkProtocolGetConfiguration(SCNetworkProtocolRef protocol)
{
  return _SCNetworkProtocolGetConfiguration(protocol);
}

Boolean SCNetworkProtocolSetConfiguration(SCNetworkProtocolRef protocol, CFDictionaryRef config)
{
  return _SCNetworkProtocolSetConfiguration(protocol, config);
}

SCNetworkProtocolRef SCNetworkServiceCopyProtocol(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return _SCNetworkServiceCopyProtocol(service, protocolType);
}

SCNetworkServiceRef SCNetworkServiceCreate(SCPreferencesRef prefs, SCNetworkInterfaceRef interface)
{
  return _SCNetworkServiceCreate(prefs, interface);
}

Boolean SCNetworkServiceEstablishDefaultConfiguration(SCNetworkServiceRef service)
{
  return _SCNetworkServiceEstablishDefaultConfiguration(service);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return _SCNetworkServiceGetInterface(service);
}

CFStringRef SCNetworkServiceGetServiceID(SCNetworkServiceRef service)
{
  return _SCNetworkServiceGetServiceID(service);
}

Boolean SCNetworkServiceRemove(SCNetworkServiceRef service)
{
  return _SCNetworkServiceRemove(service);
}

Boolean SCNetworkSetAddService(SCNetworkSetRef set, SCNetworkServiceRef service)
{
  return _SCNetworkSetAddService(set, service);
}

CFArrayRef SCNetworkSetCopyAll(SCPreferencesRef prefs)
{
  return _SCNetworkSetCopyAll(prefs);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return _SCNetworkSetCopyCurrent(prefs);
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return _SCNetworkSetCopyServices(set);
}

SCNetworkSetRef SCNetworkSetCreate(SCPreferencesRef prefs)
{
  return _SCNetworkSetCreate(prefs);
}

CFStringRef SCNetworkSetGetName(SCNetworkSetRef set)
{
  return _SCNetworkSetGetName(set);
}

CFArrayRef SCNetworkSetGetServiceOrder(SCNetworkSetRef set)
{
  return _SCNetworkSetGetServiceOrder(set);
}

CFStringRef SCNetworkSetGetSetID(SCNetworkSetRef set)
{
  return _SCNetworkSetGetSetID(set);
}

Boolean SCNetworkSetRemove(SCNetworkSetRef set)
{
  return _SCNetworkSetRemove(set);
}

Boolean SCNetworkSetSetName(SCNetworkSetRef set, CFStringRef name)
{
  return _SCNetworkSetSetName(set, name);
}

Boolean SCNetworkSetSetServiceOrder(SCNetworkSetRef set, CFArrayRef newOrder)
{
  return _SCNetworkSetSetServiceOrder(set, newOrder);
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesApplyChanges(prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesCommitChanges(prefs);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return _SCPreferencesCreateWithAuthorization(allocator, name, prefsID, authorization);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return _SCPreferencesLock(prefs, wait);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return _SCPreferencesUnlock(prefs);
}

uint64_t SecCMSCertificatesOnlyMessageCopyCertificates()
{
  return _SecCMSCertificatesOnlyMessageCopyCertificates();
}

uint64_t SecCMSCreateSignedData()
{
  return _SecCMSCreateSignedData();
}

uint64_t SecCMSSignDataAndAttributes()
{
  return _SecCMSSignDataAndAttributes();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

uint64_t SecCertificateCopyRFC822Names()
{
  return _SecCertificateCopyRFC822Names();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return _SecCertificateCopySubjectSummary(certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
}

uint64_t SecCertificateGetKeyUsage()
{
  return _SecCertificateGetKeyUsage();
}

uint64_t SecCertificateGetSHA1Digest()
{
  return _SecCertificateGetSHA1Digest();
}

uint64_t SecCertificateIsSelfSignedCA()
{
  return _SecCertificateIsSelfSignedCA();
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return _SecGenerateSelfSignedCertificate();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return _SecIdentityCopyCertificate(identityRef, certificateRef);
}

uint64_t SecIdentityCreate()
{
  return _SecIdentityCreate();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return _SecKeyCopyPublicKey(key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return _SecKeyCreateRandomKey(parameters, error);
}

OSStatus SecKeyGeneratePair(CFDictionaryRef parameters, SecKeyRef *publicKey, SecKeyRef *privateKey)
{
  return _SecKeyGeneratePair(parameters, publicKey, privateKey);
}

OSStatus SecPKCS12Import(CFDataRef pkcs12_data, CFDictionaryRef options, CFArrayRef *items)
{
  return _SecPKCS12Import(pkcs12_data, options, items);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return _SecPolicyCreateSSL(server, hostname);
}

uint64_t SecRequestClientIdentity()
{
  return _SecRequestClientIdentity();
}

uint64_t SecSCEPCreateTemporaryIdentity()
{
  return _SecSCEPCreateTemporaryIdentity();
}

uint64_t SecSCEPGenerateCertificateRequest()
{
  return _SecSCEPGenerateCertificateRequest();
}

uint64_t SecSCEPGetCertInitial()
{
  return _SecSCEPGetCertInitial();
}

uint64_t SecSCEPValidateCACertMessage()
{
  return _SecSCEPValidateCACertMessage();
}

uint64_t SecSCEPVerifyReply()
{
  return _SecSCEPVerifyReply();
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return _SecTrustCreateWithCertificates(certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return _SecTrustEvaluateWithError(trust, error);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return _SecTrustGetCertificateAtIndex(trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return _SecTrustGetCertificateCount(trust);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return _SecTrustGetTrustResult(trust, result);
}

BOOL SecTrustSetExceptions(SecTrustRef trust, CFDataRef exceptions)
{
  return _SecTrustSetExceptions(trust, exceptions);
}

uint64_t SecTrustStoreForDomain()
{
  return _SecTrustStoreForDomain();
}

uint64_t SecTrustStoreRemoveAll()
{
  return _SecTrustStoreRemoveAll();
}

uint64_t SecTrustStoreRemoveCertificate()
{
  return _SecTrustStoreRemoveCertificate();
}

uint64_t SecTrustStoreSetCARevocationAdditions()
{
  return _SecTrustStoreSetCARevocationAdditions();
}

uint64_t SecTrustStoreSetCTExceptions()
{
  return _SecTrustStoreSetCTExceptions();
}

uint64_t SecTrustStoreSetTransparentConnectionPins()
{
  return _SecTrustStoreSetTransparentConnectionPins();
}

uint64_t SecTrustStoreSetTrustSettings()
{
  return _SecTrustStoreSetTrustSettings();
}

uint64_t TMSetAutomaticTimeEnabled()
{
  return _TMSetAutomaticTimeEnabled();
}

uint64_t TMSetAutomaticTimeZoneEnabled()
{
  return _TMSetAutomaticTimeZoneEnabled();
}

uint64_t WiFiDeviceClientGetInterfaceName()
{
  return _WiFiDeviceClientGetInterfaceName();
}

uint64_t WiFiManagerClientAddNetwork()
{
  return _WiFiManagerClientAddNetwork();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return _WiFiManagerClientCopyDevices();
}

uint64_t WiFiManagerClientCopyNetworks()
{
  return _WiFiManagerClientCopyNetworks();
}

uint64_t WiFiManagerClientCopyProperty()
{
  return _WiFiManagerClientCopyProperty();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientDisableNetwork()
{
  return _WiFiManagerClientDisableNetwork();
}

uint64_t WiFiManagerClientEnable()
{
  return _WiFiManagerClientEnable();
}

uint64_t WiFiManagerClientGetPower()
{
  return _WiFiManagerClientGetPower();
}

uint64_t WiFiManagerClientRemoveNetwork()
{
  return _WiFiManagerClientRemoveNetwork();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return _WiFiManagerClientScheduleWithRunLoop();
}

uint64_t WiFiManagerClientSetPower()
{
  return _WiFiManagerClientSetPower();
}

uint64_t WiFiManagerClientSetProperty()
{
  return _WiFiManagerClientSetProperty();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return _WiFiManagerClientUnscheduleFromRunLoop();
}

uint64_t WiFiManagerClientUpdateNetwork()
{
  return _WiFiManagerClientUpdateNetwork();
}

uint64_t WiFiNetworkAddSIMIdentifier()
{
  return _WiFiNetworkAddSIMIdentifier();
}

uint64_t WiFiNetworkCreate()
{
  return _WiFiNetworkCreate();
}

uint64_t WiFiNetworkDisableAutoJoinUntilFirstUserJoin()
{
  return _WiFiNetworkDisableAutoJoinUntilFirstUserJoin();
}

uint64_t WiFiNetworkGetProperty()
{
  return _WiFiNetworkGetProperty();
}

uint64_t WiFiNetworkGetSSID()
{
  return _WiFiNetworkGetSSID();
}

uint64_t WiFiNetworkIsEAP()
{
  return _WiFiNetworkIsEAP();
}

uint64_t WiFiNetworkSetDirectedState()
{
  return _WiFiNetworkSetDirectedState();
}

uint64_t WiFiNetworkSetOriginatorName()
{
  return _WiFiNetworkSetOriginatorName();
}

uint64_t WiFiNetworkSetProperty()
{
  return _WiFiNetworkSetProperty();
}

uint64_t WiFiNetworkSetSAE()
{
  return _WiFiNetworkSetSAE();
}

uint64_t WiFiNetworkSetWEP()
{
  return _WiFiNetworkSetWEP();
}

uint64_t WiFiNetworkSetWPA()
{
  return _WiFiNetworkSetWPA();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return __CFPreferencesCopyValueWithContainer();
}

uint64_t _CFPreferencesFlushCachesForIdentifier()
{
  return __CFPreferencesFlushCachesForIdentifier();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return __CFPreferencesSetValueWithContainer();
}

uint64_t _CFPreferencesSynchronizeWithContainer()
{
  return __CFPreferencesSynchronizeWithContainer();
}

uint64_t _CFURLCredentialCreateArchive()
{
  return __CFURLCredentialCreateArchive();
}

uint64_t _CFURLCredentialCreateFromArchive()
{
  return __CFURLCredentialCreateFromArchive();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return _calloc(__count, __size);
}

uint64_t dataaccess_get_global_queue()
{
  return _dataaccess_get_global_queue();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t lockdown_connect()
{
  return _lockdown_connect();
}

uint64_t lockdown_delete_pair_records()
{
  return _lockdown_delete_pair_records();
}

uint64_t lockdown_set_value()
{
  return _lockdown_set_value();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return _memset_s(__s, __smax, __c, __n);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int sem_close(sem_t *a1)
{
  return _sem_close(a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return _sem_open(a1, a2);
}

uint64_t sharedDAAccountStore()
{
  return _sharedDAAccountStore();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

void syslog(int a1, const char *a2, ...)
{
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_APNs(void *a1, const char *a2, ...)
{
  return [a1 APNs];
}

id objc_msgSend_CACaps(void *a1, const char *a2, ...)
{
  return [a1 CACaps];
}

id objc_msgSend_CAFingerprint(void *a1, const char *a2, ...)
{
  return [a1 CAFingerprint];
}

id objc_msgSend_CAInstanceName(void *a1, const char *a2, ...)
{
  return [a1 CAInstanceName];
}

id objc_msgSend_DAAccountDoNotSaveReason(void *a1, const char *a2, ...)
{
  return [a1 DAAccountDoNotSaveReason];
}

id objc_msgSend_DAAccountIdentifiersToIgnoreForUniquenessCheck(void *a1, const char *a2, ...)
{
  return [a1 DAAccountIdentifiersToIgnoreForUniquenessCheck];
}

id objc_msgSend_HESSID(void *a1, const char *a2, ...)
{
  return [a1 HESSID];
}

id objc_msgSend_MAIDUsername(void *a1, const char *a2, ...)
{
  return [a1 MAIDUsername];
}

id objc_msgSend_MCACAccountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 MCACAccountIdentifier];
}

id objc_msgSend_MCAppendGreenteaSuffix(void *a1, const char *a2, ...)
{
  return [a1 MCAppendGreenteaSuffix];
}

id objc_msgSend_MCCAndMNCs(void *a1, const char *a2, ...)
{
  return [a1 MCCAndMNCs];
}

id objc_msgSend_MCCopyAsPrimaryError(void *a1, const char *a2, ...)
{
  return [a1 MCCopyAsPrimaryError];
}

id objc_msgSend_MCDeepCopy(void *a1, const char *a2, ...)
{
  return [a1 MCDeepCopy];
}

id objc_msgSend_MCErrorType(void *a1, const char *a2, ...)
{
  return [a1 MCErrorType];
}

id objc_msgSend_MCHashedIdentifier(void *a1, const char *a2, ...)
{
  return [a1 MCHashedIdentifier];
}

id objc_msgSend_MCHexString(void *a1, const char *a2, ...)
{
  return [a1 MCHexString];
}

id objc_msgSend_MCMakeUUID(void *a1, const char *a2, ...)
{
  return [a1 MCMakeUUID];
}

id objc_msgSend_MCMutableDeepCopy(void *a1, const char *a2, ...)
{
  return [a1 MCMutableDeepCopy];
}

id objc_msgSend_MCOldStyleSafeFilenameHash(void *a1, const char *a2, ...)
{
  return [a1 MCOldStyleSafeFilenameHash];
}

id objc_msgSend_MCVerboseDescription(void *a1, const char *a2, ...)
{
  return [a1 MCVerboseDescription];
}

id objc_msgSend_NAIRealmNames(void *a1, const char *a2, ...)
{
  return [a1 NAIRealmNames];
}

id objc_msgSend_OAuthSignInURL(void *a1, const char *a2, ...)
{
  return [a1 OAuthSignInURL];
}

id objc_msgSend_OAuthTokenRequestURL(void *a1, const char *a2, ...)
{
  return [a1 OAuthTokenRequestURL];
}

id objc_msgSend_OTAProfile(void *a1, const char *a2, ...)
{
  return [a1 OTAProfile];
}

id objc_msgSend_PPTPDeprecatedError(void *a1, const char *a2, ...)
{
  return [a1 PPTPDeprecatedError];
}

id objc_msgSend_SIMRules(void *a1, const char *a2, ...)
{
  return [a1 SIMRules];
}

id objc_msgSend_SMBDomains(void *a1, const char *a2, ...)
{
  return [a1 SMBDomains];
}

id objc_msgSend_SMIMEEnabled(void *a1, const char *a2, ...)
{
  return [a1 SMIMEEnabled];
}

id objc_msgSend_SMIMEEncryptByDefaultUserOverrideable(void *a1, const char *a2, ...)
{
  return [a1 SMIMEEncryptByDefaultUserOverrideable];
}

id objc_msgSend_SMIMEEncryptionEnabled(void *a1, const char *a2, ...)
{
  return [a1 SMIMEEncryptionEnabled];
}

id objc_msgSend_SMIMEEncryptionIdentityPersistentID(void *a1, const char *a2, ...)
{
  return [a1 SMIMEEncryptionIdentityPersistentID];
}

id objc_msgSend_SMIMEEncryptionIdentityUUID(void *a1, const char *a2, ...)
{
  return [a1 SMIMEEncryptionIdentityUUID];
}

id objc_msgSend_SMIMEEncryptionIdentityUserOverrideable(void *a1, const char *a2, ...)
{
  return [a1 SMIMEEncryptionIdentityUserOverrideable];
}

id objc_msgSend_SMIMEPerMessageSwitchEnabled(void *a1, const char *a2, ...)
{
  return [a1 SMIMEPerMessageSwitchEnabled];
}

id objc_msgSend_SMIMESigningEnabled(void *a1, const char *a2, ...)
{
  return [a1 SMIMESigningEnabled];
}

id objc_msgSend_SMIMESigningIdentityPersistentID(void *a1, const char *a2, ...)
{
  return [a1 SMIMESigningIdentityPersistentID];
}

id objc_msgSend_SMIMESigningIdentityUUID(void *a1, const char *a2, ...)
{
  return [a1 SMIMESigningIdentityUUID];
}

id objc_msgSend_SMIMESigningIdentityUserOverrideable(void *a1, const char *a2, ...)
{
  return [a1 SMIMESigningIdentityUserOverrideable];
}

id objc_msgSend_SMIMESigningUserOverrideable(void *a1, const char *a2, ...)
{
  return [a1 SMIMESigningUserOverrideable];
}

id objc_msgSend_SafariDomains(void *a1, const char *a2, ...)
{
  return [a1 SafariDomains];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLPrefixMatches(void *a1, const char *a2, ...)
{
  return [a1 URLPrefixMatches];
}

id objc_msgSend_URLString(void *a1, const char *a2, ...)
{
  return [a1 URLString];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_VPNUUID(void *a1, const char *a2, ...)
{
  return [a1 VPNUUID];
}

id objc_msgSend__accountFromPayload(void *a1, const char *a2, ...)
{
  return [a1 _accountFromPayload];
}

id objc_msgSend__activationRecordIndicatesCloudConfigurationIsAvailable(void *a1, const char *a2, ...)
{
  return [a1 _activationRecordIndicatesCloudConfigurationIsAvailable];
}

id objc_msgSend__addDependency(void *a1, const char *a2, ...)
{
  return [a1 _addDependency];
}

id objc_msgSend__allFalseSettingsKeys(void *a1, const char *a2, ...)
{
  return [a1 _allFalseSettingsKeys];
}

id objc_msgSend__allPayloadCountKeys(void *a1, const char *a2, ...)
{
  return [a1 _allPayloadCountKeys];
}

id objc_msgSend__allTrueSettingsKeys(void *a1, const char *a2, ...)
{
  return [a1 _allTrueSettingsKeys];
}

id objc_msgSend__applyDefaultSettings(void *a1, const char *a2, ...)
{
  return [a1 _applyDefaultSettings];
}

id objc_msgSend__applyImpliedSettings(void *a1, const char *a2, ...)
{
  return [a1 _applyImpliedSettings];
}

id objc_msgSend__atsContext(void *a1, const char *a2, ...)
{
  return [a1 _atsContext];
}

id objc_msgSend__attributesForSystemProfileStorageItems(void *a1, const char *a2, ...)
{
  return [a1 _attributesForSystemProfileStorageItems];
}

id objc_msgSend__attributesForUserProfileStorageItem(void *a1, const char *a2, ...)
{
  return [a1 _attributesForUserProfileStorageItem];
}

id objc_msgSend__badIdentityError(void *a1, const char *a2, ...)
{
  return [a1 _badIdentityError];
}

id objc_msgSend__badProvisioningProfileError(void *a1, const char *a2, ...)
{
  return [a1 _badProvisioningProfileError];
}

id objc_msgSend__cannotStoreCertificateError(void *a1, const char *a2, ...)
{
  return [a1 _cannotStoreCertificateError];
}

id objc_msgSend__cannotStorePEMDataError(void *a1, const char *a2, ...)
{
  return [a1 _cannotStorePEMDataError];
}

id objc_msgSend__cannotStoreRootCertificateError(void *a1, const char *a2, ...)
{
  return [a1 _cannotStoreRootCertificateError];
}

id objc_msgSend__checkValidUserEnrollment(void *a1, const char *a2, ...)
{
  return [a1 _checkValidUserEnrollment];
}

id objc_msgSend__checkinWithMdmd(void *a1, const char *a2, ...)
{
  return [a1 _checkinWithMdmd];
}

id objc_msgSend__cleanUpAppConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _cleanUpAppConfiguration];
}

id objc_msgSend__containsPayloadsDictionary(void *a1, const char *a2, ...)
{
  return [a1 _containsPayloadsDictionary];
}

id objc_msgSend__correctCloudConfigurationIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _correctCloudConfigurationIfNecessary];
}

id objc_msgSend__correctInstallOptionsOnProfileStubs(void *a1, const char *a2, ...)
{
  return [a1 _correctInstallOptionsOnProfileStubs];
}

id objc_msgSend__correctMDMConfigurationFile(void *a1, const char *a2, ...)
{
  return [a1 _correctMDMConfigurationFile];
}

id objc_msgSend__createDirectories(void *a1, const char *a2, ...)
{
  return [a1 _createDirectories];
}

id objc_msgSend__createStubs(void *a1, const char *a2, ...)
{
  return [a1 _createStubs];
}

id objc_msgSend__createSystemGroupContainerAndMoveFiles(void *a1, const char *a2, ...)
{
  return [a1 _createSystemGroupContainerAndMoveFiles];
}

id objc_msgSend__createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary];
}

id objc_msgSend__currentPublicPasscodeDict(void *a1, const char *a2, ...)
{
  return [a1 _currentPublicPasscodeDict];
}

id objc_msgSend__deviceLockedError(void *a1, const char *a2, ...)
{
  return [a1 _deviceLockedError];
}

id objc_msgSend__deviceSpecificDefaultSettings(void *a1, const char *a2, ...)
{
  return [a1 _deviceSpecificDefaultSettings];
}

id objc_msgSend__errorBadProfile(void *a1, const char *a2, ...)
{
  return [a1 _errorBadProfile];
}

id objc_msgSend__errorEnrollmentCannotBeStaged(void *a1, const char *a2, ...)
{
  return [a1 _errorEnrollmentCannotBeStaged];
}

id objc_msgSend__errorEnrollmentMalformed(void *a1, const char *a2, ...)
{
  return [a1 _errorEnrollmentMalformed];
}

id objc_msgSend__errorFontAlreadyInstalled(void *a1, const char *a2, ...)
{
  return [a1 _errorFontAlreadyInstalled];
}

id objc_msgSend__errorFontCollection(void *a1, const char *a2, ...)
{
  return [a1 _errorFontCollection];
}

id objc_msgSend__errorFontInvalid(void *a1, const char *a2, ...)
{
  return [a1 _errorFontInvalid];
}

id objc_msgSend__errorInvalidServiceURL(void *a1, const char *a2, ...)
{
  return [a1 _errorInvalidServiceURL];
}

id objc_msgSend__errorMissingMDMPayload(void *a1, const char *a2, ...)
{
  return [a1 _errorMissingMDMPayload];
}

id objc_msgSend__errorMissingServiceURL(void *a1, const char *a2, ...)
{
  return [a1 _errorMissingServiceURL];
}

id objc_msgSend__errorPhoneUnsupervised(void *a1, const char *a2, ...)
{
  return [a1 _errorPhoneUnsupervised];
}

id objc_msgSend__exchangeSyncUUIDString(void *a1, const char *a2, ...)
{
  return [a1 _exchangeSyncUUIDString];
}

id objc_msgSend__falseRestrictionsDictionary(void *a1, const char *a2, ...)
{
  return [a1 _falseRestrictionsDictionary];
}

id objc_msgSend__falseSettingsDictionary(void *a1, const char *a2, ...)
{
  return [a1 _falseSettingsDictionary];
}

id objc_msgSend__fixManifestFromStubsIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _fixManifestFromStubsIfNecessary];
}

id objc_msgSend__fixPermissionsOnTheSystemProfileLibraryDirectoryAndContents(void *a1, const char *a2, ...)
{
  return [a1 _fixPermissionsOnTheSystemProfileLibraryDirectoryAndContents];
}

id objc_msgSend__fullyInstalledPayloads(void *a1, const char *a2, ...)
{
  return [a1 _fullyInstalledPayloads];
}

id objc_msgSend__hasCompletedPostLoginWork(void *a1, const char *a2, ...)
{
  return [a1 _hasCompletedPostLoginWork];
}

id objc_msgSend__homepodText(void *a1, const char *a2, ...)
{
  return [a1 _homepodText];
}

id objc_msgSend__install(void *a1, const char *a2, ...)
{
  return [a1 _install];
}

id objc_msgSend__installDependency(void *a1, const char *a2, ...)
{
  return [a1 _installDependency];
}

id objc_msgSend__installPrivateNetworkProfile(void *a1, const char *a2, ...)
{
  return [a1 _installPrivateNetworkProfile];
}

id objc_msgSend__installationHaltedTopLevelError(void *a1, const char *a2, ...)
{
  return [a1 _installationHaltedTopLevelError];
}

id objc_msgSend__installedACAccountOtherThanSelf(void *a1, const char *a2, ...)
{
  return [a1 _installedACAccountOtherThanSelf];
}

id objc_msgSend__installedAccount(void *a1, const char *a2, ...)
{
  return [a1 _installedAccount];
}

id objc_msgSend__installedDAAccount(void *a1, const char *a2, ...)
{
  return [a1 _installedDAAccount];
}

id objc_msgSend__installedSetAsideACAccount(void *a1, const char *a2, ...)
{
  return [a1 _installedSetAsideACAccount];
}

id objc_msgSend__installedWebClip(void *a1, const char *a2, ...)
{
  return [a1 _installedWebClip];
}

id objc_msgSend__intersectionRestrictionsDictionary(void *a1, const char *a2, ...)
{
  return [a1 _intersectionRestrictionsDictionary];
}

id objc_msgSend__invalidInputError(void *a1, const char *a2, ...)
{
  return [a1 _invalidInputError];
}

id objc_msgSend__invalidPasscodeError(void *a1, const char *a2, ...)
{
  return [a1 _invalidPasscodeError];
}

id objc_msgSend__invalidRAResponse(void *a1, const char *a2, ...)
{
  return [a1 _invalidRAResponse];
}

id objc_msgSend__isActivated(void *a1, const char *a2, ...)
{
  return [a1 _isActivated];
}

id objc_msgSend__isCloudConfigurationActuallyAvailable(void *a1, const char *a2, ...)
{
  return [a1 _isCloudConfigurationActuallyAvailable];
}

id objc_msgSend__isCloudConfigurationAvailableInDEP(void *a1, const char *a2, ...)
{
  return [a1 _isCloudConfigurationAvailableInDEP];
}

id objc_msgSend__isConfiguredWithSCEP(void *a1, const char *a2, ...)
{
  return [a1 _isConfiguredWithSCEP];
}

id objc_msgSend__isLegacyProfileStoragePresent(void *a1, const char *a2, ...)
{
  return [a1 _isLegacyProfileStoragePresent];
}

id objc_msgSend__isMultiUserMode(void *a1, const char *a2, ...)
{
  return [a1 _isMultiUserMode];
}

id objc_msgSend__isWiFiDaemonAvailable(void *a1, const char *a2, ...)
{
  return [a1 _isWiFiDaemonAvailable];
}

id objc_msgSend__lastSystemMigratedBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 _lastSystemMigratedBuildVersion];
}

id objc_msgSend__lastUserMigratedBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 _lastUserMigratedBuildVersion];
}

id objc_msgSend__localProvisioningProfileError(void *a1, const char *a2, ...)
{
  return [a1 _localProvisioningProfileError];
}

id objc_msgSend__malformedCertificateError(void *a1, const char *a2, ...)
{
  return [a1 _malformedCertificateError];
}

id objc_msgSend__markPostUserLoginWorkCompleted(void *a1, const char *a2, ...)
{
  return [a1 _markPostUserLoginWorkCompleted];
}

id objc_msgSend__migrateClientRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _migrateClientRestrictions];
}

id objc_msgSend__migrateExtensibleSSO(void *a1, const char *a2, ...)
{
  return [a1 _migrateExtensibleSSO];
}

id objc_msgSend__migrateLegacySystemProfileStorage(void *a1, const char *a2, ...)
{
  return [a1 _migrateLegacySystemProfileStorage];
}

id objc_msgSend__migrateLostModeLastLocationRequestDate(void *a1, const char *a2, ...)
{
  return [a1 _migrateLostModeLastLocationRequestDate];
}

id objc_msgSend__migrateManifestLocation(void *a1, const char *a2, ...)
{
  return [a1 _migrateManifestLocation];
}

id objc_msgSend__migrateOTAProfiles(void *a1, const char *a2, ...)
{
  return [a1 _migrateOTAProfiles];
}

id objc_msgSend__migrateProfileStubsForNetworkExtension(void *a1, const char *a2, ...)
{
  return [a1 _migrateProfileStubsForNetworkExtension];
}

id objc_msgSend__migrateSettings(void *a1, const char *a2, ...)
{
  return [a1 _migrateSettings];
}

id objc_msgSend__migrateSharedDeviceConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _migrateSharedDeviceConfiguration];
}

id objc_msgSend__migrateSupervisionSettings(void *a1, const char *a2, ...)
{
  return [a1 _migrateSupervisionSettings];
}

id objc_msgSend__missingWatchMDMEnrollmentEntitlementError(void *a1, const char *a2, ...)
{
  return [a1 _missingWatchMDMEnrollmentEntitlementError];
}

id objc_msgSend__moveFilesToPublicDirectories(void *a1, const char *a2, ...)
{
  return [a1 _moveFilesToPublicDirectories];
}

id objc_msgSend__networkServiceRequired(void *a1, const char *a2, ...)
{
  return [a1 _networkServiceRequired];
}

id objc_msgSend__nextActivationLockCleanupDate(void *a1, const char *a2, ...)
{
  return [a1 _nextActivationLockCleanupDate];
}

id objc_msgSend__nextRegularDate(void *a1, const char *a2, ...)
{
  return [a1 _nextRegularDate];
}

id objc_msgSend__objectRestrictionsDictionary(void *a1, const char *a2, ...)
{
  return [a1 _objectRestrictionsDictionary];
}

id objc_msgSend__overrideProfileValidation(void *a1, const char *a2, ...)
{
  return [a1 _overrideProfileValidation];
}

id objc_msgSend__payloadCountDictionary(void *a1, const char *a2, ...)
{
  return [a1 _payloadCountDictionary];
}

id objc_msgSend__profileDrivenEnrollmentBlocked(void *a1, const char *a2, ...)
{
  return [a1 _profileDrivenEnrollmentBlocked];
}

id objc_msgSend__profileDrivenUserEnrollmentNotSupportedError(void *a1, const char *a2, ...)
{
  return [a1 _profileDrivenUserEnrollmentNotSupportedError];
}

id objc_msgSend__profileEvents(void *a1, const char *a2, ...)
{
  return [a1 _profileEvents];
}

id objc_msgSend__profileEventsOnDisk(void *a1, const char *a2, ...)
{
  return [a1 _profileEventsOnDisk];
}

id objc_msgSend__recoverProxyCredential(void *a1, const char *a2, ...)
{
  return [a1 _recoverProxyCredential];
}

id objc_msgSend__releaseDependency(void *a1, const char *a2, ...)
{
  return [a1 _releaseDependency];
}

id objc_msgSend__remove(void *a1, const char *a2, ...)
{
  return [a1 _remove];
}

id objc_msgSend__removeDependency(void *a1, const char *a2, ...)
{
  return [a1 _removeDependency];
}

id objc_msgSend__removeDuplicatedHiddenIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _removeDuplicatedHiddenIdentifiers];
}

id objc_msgSend__removeExistingSystemProfileStorageDirectoryBlockingMigration(void *a1, const char *a2, ...)
{
  return [a1 _removeExistingSystemProfileStorageDirectoryBlockingMigration];
}

id objc_msgSend__removeExpiredProvisioningProfiles(void *a1, const char *a2, ...)
{
  return [a1 _removeExpiredProvisioningProfiles];
}

id objc_msgSend__removeHardwareBoundPayloads(void *a1, const char *a2, ...)
{
  return [a1 _removeHardwareBoundPayloads];
}

id objc_msgSend__removeInvalidOptionsFromLegacyCloudConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _removeInvalidOptionsFromLegacyCloudConfiguration];
}

id objc_msgSend__removeLegacyAPNConfigurations(void *a1, const char *a2, ...)
{
  return [a1 _removeLegacyAPNConfigurations];
}

id objc_msgSend__removeMDMProfileIfDataSeparated(void *a1, const char *a2, ...)
{
  return [a1 _removeMDMProfileIfDataSeparated];
}

id objc_msgSend__removeOSXServerPayloadAccount(void *a1, const char *a2, ...)
{
  return [a1 _removeOSXServerPayloadAccount];
}

id objc_msgSend__removeOriginalCopies(void *a1, const char *a2, ...)
{
  return [a1 _removeOriginalCopies];
}

id objc_msgSend__removeOrphanedManifestEntries(void *a1, const char *a2, ...)
{
  return [a1 _removeOrphanedManifestEntries];
}

id objc_msgSend__removeProxyCredential(void *a1, const char *a2, ...)
{
  return [a1 _removeProxyCredential];
}

id objc_msgSend__removeSupervisionProfiles(void *a1, const char *a2, ...)
{
  return [a1 _removeSupervisionProfiles];
}

id objc_msgSend__removeUnmanageableApps(void *a1, const char *a2, ...)
{
  return [a1 _removeUnmanageableApps];
}

id objc_msgSend__removeUnusedManifestArrays(void *a1, const char *a2, ...)
{
  return [a1 _removeUnusedManifestArrays];
}

id objc_msgSend__removeiPCUCertificates(void *a1, const char *a2, ...)
{
  return [a1 _removeiPCUCertificates];
}

id objc_msgSend__retainDependency(void *a1, const char *a2, ...)
{
  return [a1 _retainDependency];
}

id objc_msgSend__revertFullSSLTrustIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _revertFullSSLTrustIfNeeded];
}

id objc_msgSend__saveConferenceRoomDisplayConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _saveConferenceRoomDisplayConfiguration];
}

id objc_msgSend__saveSetupAssistantSettings(void *a1, const char *a2, ...)
{
  return [a1 _saveSetupAssistantSettings];
}

id objc_msgSend__saveSharedDeviceConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _saveSharedDeviceConfiguration];
}

id objc_msgSend__sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage(void *a1, const char *a2, ...)
{
  return [a1 _sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage];
}

id objc_msgSend__sendEffectiveSettingsChangedNotification(void *a1, const char *a2, ...)
{
  return [a1 _sendEffectiveSettingsChangedNotification];
}

id objc_msgSend__sendRestrictionChangedNotification(void *a1, const char *a2, ...)
{
  return [a1 _sendRestrictionChangedNotification];
}

id objc_msgSend__sendSystemConfigurationProxyChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 _sendSystemConfigurationProxyChangeNotification];
}

id objc_msgSend__setAirPlaySecurityConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _setAirPlaySecurityConfiguration];
}

id objc_msgSend__setAttributesOnSystemProfileStorageDirectory(void *a1, const char *a2, ...)
{
  return [a1 _setAttributesOnSystemProfileStorageDirectory];
}

id objc_msgSend__shouldAttemptToMigrateLegacyProfileStorage(void *a1, const char *a2, ...)
{
  return [a1 _shouldAttemptToMigrateLegacyProfileStorage];
}

id objc_msgSend__tagIMAPAccountsWithProfileAndPayloadProperties(void *a1, const char *a2, ...)
{
  return [a1 _tagIMAPAccountsWithProfileAndPayloadProperties];
}

id objc_msgSend__tagManagedAccounts(void *a1, const char *a2, ...)
{
  return [a1 _tagManagedAccounts];
}

id objc_msgSend__targetDeviceArchivedError(void *a1, const char *a2, ...)
{
  return [a1 _targetDeviceArchivedError];
}

id objc_msgSend__targetDeviceMismatchError(void *a1, const char *a2, ...)
{
  return [a1 _targetDeviceMismatchError];
}

id objc_msgSend__targetDevicePreflightFailedError(void *a1, const char *a2, ...)
{
  return [a1 _targetDevicePreflightFailedError];
}

id objc_msgSend__targetDeviceUnavailableError(void *a1, const char *a2, ...)
{
  return [a1 _targetDeviceUnavailableError];
}

id objc_msgSend__tellAMFIIfWeAreSupervised(void *a1, const char *a2, ...)
{
  return [a1 _tellAMFIIfWeAreSupervised];
}

id objc_msgSend__tooManyCertificatesError(void *a1, const char *a2, ...)
{
  return [a1 _tooManyCertificatesError];
}

id objc_msgSend__transferInstallationDatesFromOriginalProfiles(void *a1, const char *a2, ...)
{
  return [a1 _transferInstallationDatesFromOriginalProfiles];
}

id objc_msgSend__transferRemovalPasswordsFromOriginalProfiles(void *a1, const char *a2, ...)
{
  return [a1 _transferRemovalPasswordsFromOriginalProfiles];
}

id objc_msgSend__transferSignerCertificates(void *a1, const char *a2, ...)
{
  return [a1 _transferSignerCertificates];
}

id objc_msgSend__transferTagsToProfileStubs(void *a1, const char *a2, ...)
{
  return [a1 _transferTagsToProfileStubs];
}

id objc_msgSend__trueRestrictionsDictionary(void *a1, const char *a2, ...)
{
  return [a1 _trueRestrictionsDictionary];
}

id objc_msgSend__trueSettingsDictionary(void *a1, const char *a2, ...)
{
  return [a1 _trueSettingsDictionary];
}

id objc_msgSend__uninstall(void *a1, const char *a2, ...)
{
  return [a1 _uninstall];
}

id objc_msgSend__updateClientRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _updateClientRestrictions];
}

id objc_msgSend__updateProfileRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _updateProfileRestrictions];
}

id objc_msgSend__validateCloudConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _validateCloudConfiguration];
}

id objc_msgSend__valueRestrictionsDictionary(void *a1, const char *a2, ...)
{
  return [a1 _valueRestrictionsDictionary];
}

id objc_msgSend__wakeDaemonsPostMigration(void *a1, const char *a2, ...)
{
  return [a1 _wakeDaemonsPostMigration];
}

id objc_msgSend__webclipFailedToCreateOnDiskError(void *a1, const char *a2, ...)
{
  return [a1 _webclipFailedToCreateOnDiskError];
}

id objc_msgSend__workQueueReschedulePasscodeExpiryJob(void *a1, const char *a2, ...)
{
  return [a1 _workQueueReschedulePasscodeExpiryJob];
}

id objc_msgSend__workQueueRescheduleRecoveryPasscodeExpiryJob(void *a1, const char *a2, ...)
{
  return [a1 _workQueueRescheduleRecoveryPasscodeExpiryJob];
}

id objc_msgSend__workerQueueForceCheckOfCarrierProfileOnNextUnlock(void *a1, const char *a2, ...)
{
  return [a1 _workerQueueForceCheckOfCarrierProfileOnNextUnlock];
}

id objc_msgSend__workerQueuePrepareForService(void *a1, const char *a2, ...)
{
  return [a1 _workerQueuePrepareForService];
}

id objc_msgSend__workerQueueRemoveAllCarrierProfiles(void *a1, const char *a2, ...)
{
  return [a1 _workerQueueRemoveAllCarrierProfiles];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accessRights(void *a1, const char *a2, ...)
{
  return [a1 accessRights];
}

id objc_msgSend_accessType(void *a1, const char *a2, ...)
{
  return [a1 accessType];
}

id objc_msgSend_accessibility(void *a1, const char *a2, ...)
{
  return [a1 accessibility];
}

id objc_msgSend_accountDescription(void *a1, const char *a2, ...)
{
  return [a1 accountDescription];
}

id objc_msgSend_accountGUID(void *a1, const char *a2, ...)
{
  return [a1 accountGUID];
}

id objc_msgSend_accountIsValid(void *a1, const char *a2, ...)
{
  return [a1 accountIsValid];
}

id objc_msgSend_accountName(void *a1, const char *a2, ...)
{
  return [a1 accountName];
}

id objc_msgSend_accountPayloads(void *a1, const char *a2, ...)
{
  return [a1 accountPayloads];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return [a1 accountStore];
}

id objc_msgSend_accountTypeGUID(void *a1, const char *a2, ...)
{
  return [a1 accountTypeGUID];
}

id objc_msgSend_accountTypeIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 accountTypeIdentifiers];
}

id objc_msgSend_accountValidationCompletionHandler(void *a1, const char *a2, ...)
{
  return [a1 accountValidationCompletionHandler];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_activeAccounts(void *a1, const char *a2, ...)
{
  return [a1 activeAccounts];
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activePairedDeviceSelectorBlock];
}

id objc_msgSend_addProfileRestrictionsStateHandler(void *a1, const char *a2, ...)
{
  return [a1 addProfileRestrictionsStateHandler];
}

id objc_msgSend_addProfileSettingsStateHandler(void *a1, const char *a2, ...)
{
  return [a1 addProfileSettingsStateHandler];
}

id objc_msgSend_additionsDictionary(void *a1, const char *a2, ...)
{
  return [a1 additionsDictionary];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHeaderFields];
}

id objc_msgSend_allInstalledProfileIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 allInstalledProfileIdentifiers];
}

id objc_msgSend_allInstalledUserProfileIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 allInstalledUserProfileIdentifiers];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allTrustedSignerIdentities(void *a1, const char *a2, ...)
{
  return [a1 allTrustedSignerIdentities];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowListBookmarks(void *a1, const char *a2, ...)
{
  return [a1 allowListBookmarks];
}

id objc_msgSend_allowListDestinations(void *a1, const char *a2, ...)
{
  return [a1 allowListDestinations];
}

id objc_msgSend_allowUnsupervisedWatchEnrollment(void *a1, const char *a2, ...)
{
  return [a1 allowUnsupervisedWatchEnrollment];
}

id objc_msgSend_alreadySignedIntoFaceTime(void *a1, const char *a2, ...)
{
  return [a1 alreadySignedIntoFaceTime];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_anyUPPExistsForManagedAppSigners(void *a1, const char *a2, ...)
{
  return [a1 anyUPPExistsForManagedAppSigners];
}

id objc_msgSend_apnDefaults(void *a1, const char *a2, ...)
{
  return [a1 apnDefaults];
}

id objc_msgSend_apnDomainName(void *a1, const char *a2, ...)
{
  return [a1 apnDomainName];
}

id objc_msgSend_appAccessibilityParameters(void *a1, const char *a2, ...)
{
  return [a1 appAccessibilityParameters];
}

id objc_msgSend_appIdentifierMatches(void *a1, const char *a2, ...)
{
  return [a1 appIdentifierMatches];
}

id objc_msgSend_appWorkspace(void *a1, const char *a2, ...)
{
  return [a1 appWorkspace];
}

id objc_msgSend_applicationBundleID(void *a1, const char *a2, ...)
{
  return [a1 applicationBundleID];
}

id objc_msgSend_applicationID(void *a1, const char *a2, ...)
{
  return [a1 applicationID];
}

id objc_msgSend_applicationRules(void *a1, const char *a2, ...)
{
  return [a1 applicationRules];
}

id objc_msgSend_applyGracePeriodSettingFromKeybagToUserSettings(void *a1, const char *a2, ...)
{
  return [a1 applyGracePeriodSettingFromKeybagToUserSettings];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assertionHoldQueue(void *a1, const char *a2, ...)
{
  return [a1 assertionHoldQueue];
}

id objc_msgSend_assignedManagedAppleID(void *a1, const char *a2, ...)
{
  return [a1 assignedManagedAppleID];
}

id objc_msgSend_associatedDomains(void *a1, const char *a2, ...)
{
  return [a1 associatedDomains];
}

id objc_msgSend_attachAPN(void *a1, const char *a2, ...)
{
  return [a1 attachAPN];
}

id objc_msgSend_attest(void *a1, const char *a2, ...)
{
  return [a1 attest];
}

id objc_msgSend_attributesByAppID(void *a1, const char *a2, ...)
{
  return [a1 attributesByAppID];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_autoJoin(void *a1, const char *a2, ...)
{
  return [a1 autoJoin];
}

id objc_msgSend_backingAccountInfo(void *a1, const char *a2, ...)
{
  return [a1 backingAccountInfo];
}

id objc_msgSend_blockedByFilter(void *a1, const char *a2, ...)
{
  return [a1 blockedByFilter];
}

id objc_msgSend_blockedByFilterMetadata(void *a1, const char *a2, ...)
{
  return [a1 blockedByFilterMetadata];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_calendarAccountIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 calendarAccountIdentifiers];
}

id objc_msgSend_calendarDomains(void *a1, const char *a2, ...)
{
  return [a1 calendarDomains];
}

id objc_msgSend_cannotInstallError(void *a1, const char *a2, ...)
{
  return [a1 cannotInstallError];
}

id objc_msgSend_captiveBypass(void *a1, const char *a2, ...)
{
  return [a1 captiveBypass];
}

id objc_msgSend_cellularDataPreferred(void *a1, const char *a2, ...)
{
  return [a1 cellularDataPreferred];
}

id objc_msgSend_cellularRequiredPayloads(void *a1, const char *a2, ...)
{
  return [a1 cellularRequiredPayloads];
}

id objc_msgSend_certificateData(void *a1, const char *a2, ...)
{
  return [a1 certificateData];
}

id objc_msgSend_certificateFileName(void *a1, const char *a2, ...)
{
  return [a1 certificateFileName];
}

id objc_msgSend_certificatePersistentID(void *a1, const char *a2, ...)
{
  return [a1 certificatePersistentID];
}

id objc_msgSend_certificateUUID(void *a1, const char *a2, ...)
{
  return [a1 certificateUUID];
}

id objc_msgSend_challenge(void *a1, const char *a2, ...)
{
  return [a1 challenge];
}

id objc_msgSend_checkAccountConsistencyAndReleaseOrphanedAccounts(void *a1, const char *a2, ...)
{
  return [a1 checkAccountConsistencyAndReleaseOrphanedAccounts];
}

id objc_msgSend_checkCarrierProfile(void *a1, const char *a2, ...)
{
  return [a1 checkCarrierProfile];
}

id objc_msgSend_checkInPinningPersistentRefs(void *a1, const char *a2, ...)
{
  return [a1 checkInPinningPersistentRefs];
}

id objc_msgSend_checkInPinningUUIDs(void *a1, const char *a2, ...)
{
  return [a1 checkInPinningUUIDs];
}

id objc_msgSend_checkInURLString(void *a1, const char *a2, ...)
{
  return [a1 checkInURLString];
}

id objc_msgSend_checkOutWhenRemoved(void *a1, const char *a2, ...)
{
  return [a1 checkOutWhenRemoved];
}

id objc_msgSend_chipID(void *a1, const char *a2, ...)
{
  return [a1 chipID];
}

id objc_msgSend_cleanUpDirtyState(void *a1, const char *a2, ...)
{
  return [a1 cleanUpDirtyState];
}

id objc_msgSend_clearAllPasscodeComplianceCaches(void *a1, const char *a2, ...)
{
  return [a1 clearAllPasscodeComplianceCaches];
}

id objc_msgSend_clearPasscodeHistory(void *a1, const char *a2, ...)
{
  return [a1 clearPasscodeHistory];
}

id objc_msgSend_clearRecoveryPasscode(void *a1, const char *a2, ...)
{
  return [a1 clearRecoveryPasscode];
}

id objc_msgSend_clearStoredActivationLockBypassCode(void *a1, const char *a2, ...)
{
  return [a1 clearStoredActivationLockBypassCode];
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientIdentifier];
}

id objc_msgSend_clientRestrictionQueue(void *a1, const char *a2, ...)
{
  return [a1 clientRestrictionQueue];
}

id objc_msgSend_clientTypeLoaders(void *a1, const char *a2, ...)
{
  return [a1 clientTypeLoaders];
}

id objc_msgSend_cloudConfigurationMachineInfo(void *a1, const char *a2, ...)
{
  return [a1 cloudConfigurationMachineInfo];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_combinedProfileRestrictions(void *a1, const char *a2, ...)
{
  return [a1 combinedProfileRestrictions];
}

id objc_msgSend_commitChanges(void *a1, const char *a2, ...)
{
  return [a1 commitChanges];
}

id objc_msgSend_communicationServiceRules(void *a1, const char *a2, ...)
{
  return [a1 communicationServiceRules];
}

id objc_msgSend_complete(void *a1, const char *a2, ...)
{
  return [a1 complete];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configurationDictionary(void *a1, const char *a2, ...)
{
  return [a1 configurationDictionary];
}

id objc_msgSend_configurationForProfileManagement(void *a1, const char *a2, ...)
{
  return [a1 configurationForProfileManagement];
}

id objc_msgSend_confirmInstallation(void *a1, const char *a2, ...)
{
  return [a1 confirmInstallation];
}

id objc_msgSend_connectionTracker(void *a1, const char *a2, ...)
{
  return [a1 connectionTracker];
}

id objc_msgSend_considerProfilesInstalledDuringBuddyForManagement(void *a1, const char *a2, ...)
{
  return [a1 considerProfilesInstalledDuringBuddyForManagement];
}

id objc_msgSend_contactsAccountIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 contactsAccountIdentifiers];
}

id objc_msgSend_contactsDomains(void *a1, const char *a2, ...)
{
  return [a1 contactsDomains];
}

id objc_msgSend_contentFilterUUID(void *a1, const char *a2, ...)
{
  return [a1 contentFilterUUID];
}

id objc_msgSend_contentMode(void *a1, const char *a2, ...)
{
  return [a1 contentMode];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyCertificate(void *a1, const char *a2, ...)
{
  return [a1 copyCertificate];
}

id objc_msgSend_copyManagedConfigurationIDs(void *a1, const char *a2, ...)
{
  return [a1 copyManagedConfigurationIDs];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createAndStoreNewActivationLockBypassCodeAndHashIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 createAndStoreNewActivationLockBypassCodeAndHashIfNeeded];
}

id objc_msgSend_createHandler(void *a1, const char *a2, ...)
{
  return [a1 createHandler];
}

id objc_msgSend_createOnDisk(void *a1, const char *a2, ...)
{
  return [a1 createOnDisk];
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return [a1 credential];
}

id objc_msgSend_credentialUUID(void *a1, const char *a2, ...)
{
  return [a1 credentialUUID];
}

id objc_msgSend_csgNetworkIdentifier(void *a1, const char *a2, ...)
{
  return [a1 csgNetworkIdentifier];
}

id objc_msgSend_currentBatterySaverRestrictions(void *a1, const char *a2, ...)
{
  return [a1 currentBatterySaverRestrictions];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentProductType(void *a1, const char *a2, ...)
{
  return [a1 currentProductType];
}

id objc_msgSend_currentRestrictions(void *a1, const char *a2, ...)
{
  return [a1 currentRestrictions];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return [a1 currentTime];
}

id objc_msgSend_currentUnlockScreenType(void *a1, const char *a2, ...)
{
  return [a1 currentUnlockScreenType];
}

id objc_msgSend_currentUnlockSimplePasscodeType(void *a1, const char *a2, ...)
{
  return [a1 currentUnlockSimplePasscodeType];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return [a1 currentUser];
}

id objc_msgSend_currentUserConnection(void *a1, const char *a2, ...)
{
  return [a1 currentUserConnection];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataEncoding(void *a1, const char *a2, ...)
{
  return [a1 dataEncoding];
}

id objc_msgSend_dataProvider(void *a1, const char *a2, ...)
{
  return [a1 dataProvider];
}

id objc_msgSend_dataSetName(void *a1, const char *a2, ...)
{
  return [a1 dataSetName];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_declarations(void *a1, const char *a2, ...)
{
  return [a1 declarations];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultMDMOptions(void *a1, const char *a2, ...)
{
  return [a1 defaultMDMOptions];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultRestrictions(void *a1, const char *a2, ...)
{
  return [a1 defaultRestrictions];
}

id objc_msgSend_defaultSettings(void *a1, const char *a2, ...)
{
  return [a1 defaultSettings];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_deliveryAccount(void *a1, const char *a2, ...)
{
  return [a1 deliveryAccount];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destinationsWithPasswords(void *a1, const char *a2, ...)
{
  return [a1 destinationsWithPasswords];
}

id objc_msgSend_details(void *a1, const char *a2, ...)
{
  return [a1 details];
}

id objc_msgSend_deviceAttributes(void *a1, const char *a2, ...)
{
  return [a1 deviceAttributes];
}

id objc_msgSend_deviceHasMultipleUsers(void *a1, const char *a2, ...)
{
  return [a1 deviceHasMultipleUsers];
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return [a1 deviceID];
}

id objc_msgSend_deviceIsSupervisedError(void *a1, const char *a2, ...)
{
  return [a1 deviceIsSupervisedError];
}

id objc_msgSend_deviceLockedError(void *a1, const char *a2, ...)
{
  return [a1 deviceLockedError];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_deviceNotSupervisedError(void *a1, const char *a2, ...)
{
  return [a1 deviceNotSupervisedError];
}

id objc_msgSend_deviceUDID(void *a1, const char *a2, ...)
{
  return [a1 deviceUDID];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didSuperviseThroughConfigurator(void *a1, const char *a2, ...)
{
  return [a1 didSuperviseThroughConfigurator];
}

id objc_msgSend_didUnenrollFromMDM(void *a1, const char *a2, ...)
{
  return [a1 didUnenrollFromMDM];
}

id objc_msgSend_directoryURLString(void *a1, const char *a2, ...)
{
  return [a1 directoryURLString];
}

id objc_msgSend_disableAssociationMACRandomization(void *a1, const char *a2, ...)
{
  return [a1 disableAssociationMACRandomization];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayedOperatorName(void *a1, const char *a2, ...)
{
  return [a1 displayedOperatorName];
}

id objc_msgSend_dnsProxyUUID(void *a1, const char *a2, ...)
{
  return [a1 dnsProxyUUID];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainName(void *a1, const char *a2, ...)
{
  return [a1 domainName];
}

id objc_msgSend_domainRules(void *a1, const char *a2, ...)
{
  return [a1 domainRules];
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return [a1 domains];
}

id objc_msgSend_eapClientConfig(void *a1, const char *a2, ...)
{
  return [a1 eapClientConfig];
}

id objc_msgSend_eapClientConfiguration(void *a1, const char *a2, ...)
{
  return [a1 eapClientConfiguration];
}

id objc_msgSend_earliestExpiryDate(void *a1, const char *a2, ...)
{
  return [a1 earliestExpiryDate];
}

id objc_msgSend_earliestRequiredManagedAppValidationDate(void *a1, const char *a2, ...)
{
  return [a1 earliestRequiredManagedAppValidationDate];
}

id objc_msgSend_earlistProfileEventExpiry(void *a1, const char *a2, ...)
{
  return [a1 earlistProfileEventExpiry];
}

id objc_msgSend_easEnrollmentID(void *a1, const char *a2, ...)
{
  return [a1 easEnrollmentID];
}

id objc_msgSend_effectiveUserSettings(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserSettings];
}

id objc_msgSend_emailAccountDescription(void *a1, const char *a2, ...)
{
  return [a1 emailAccountDescription];
}

id objc_msgSend_emailAccountName(void *a1, const char *a2, ...)
{
  return [a1 emailAccountName];
}

id objc_msgSend_emailAccountType(void *a1, const char *a2, ...)
{
  return [a1 emailAccountType];
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return [a1 emailAddress];
}

id objc_msgSend_embeddedCertificate(void *a1, const char *a2, ...)
{
  return [a1 embeddedCertificate];
}

id objc_msgSend_embeddedCertificateName(void *a1, const char *a2, ...)
{
  return [a1 embeddedCertificateName];
}

id objc_msgSend_embeddedCertificatePassword(void *a1, const char *a2, ...)
{
  return [a1 embeddedCertificatePassword];
}

id objc_msgSend_enableAlwaysOnVpn(void *a1, const char *a2, ...)
{
  return [a1 enableAlwaysOnVpn];
}

id objc_msgSend_enableCalendars(void *a1, const char *a2, ...)
{
  return [a1 enableCalendars];
}

id objc_msgSend_enableCalendarsUserOverridable(void *a1, const char *a2, ...)
{
  return [a1 enableCalendarsUserOverridable];
}

id objc_msgSend_enableContacts(void *a1, const char *a2, ...)
{
  return [a1 enableContacts];
}

id objc_msgSend_enableContactsUserOverridable(void *a1, const char *a2, ...)
{
  return [a1 enableContactsUserOverridable];
}

id objc_msgSend_enableMail(void *a1, const char *a2, ...)
{
  return [a1 enableMail];
}

id objc_msgSend_enableMailUserOverridable(void *a1, const char *a2, ...)
{
  return [a1 enableMailUserOverridable];
}

id objc_msgSend_enableNRStandalone(void *a1, const char *a2, ...)
{
  return [a1 enableNRStandalone];
}

id objc_msgSend_enableNotes(void *a1, const char *a2, ...)
{
  return [a1 enableNotes];
}

id objc_msgSend_enableNotesUserOverridable(void *a1, const char *a2, ...)
{
  return [a1 enableNotesUserOverridable];
}

id objc_msgSend_enableReminders(void *a1, const char *a2, ...)
{
  return [a1 enableReminders];
}

id objc_msgSend_enableRemindersUserOverridable(void *a1, const char *a2, ...)
{
  return [a1 enableRemindersUserOverridable];
}

id objc_msgSend_encryptionType(void *a1, const char *a2, ...)
{
  return [a1 encryptionType];
}

id objc_msgSend_enforcedAppWhitelistRestrictions(void *a1, const char *a2, ...)
{
  return [a1 enforcedAppWhitelistRestrictions];
}

id objc_msgSend_enrollmentController(void *a1, const char *a2, ...)
{
  return [a1 enrollmentController];
}

id objc_msgSend_enrollmentFlowController(void *a1, const char *a2, ...)
{
  return [a1 enrollmentFlowController];
}

id objc_msgSend_enrollmentID(void *a1, const char *a2, ...)
{
  return [a1 enrollmentID];
}

id objc_msgSend_enrollmentIdentityPersistentID(void *a1, const char *a2, ...)
{
  return [a1 enrollmentIdentityPersistentID];
}

id objc_msgSend_enrollmentMode(void *a1, const char *a2, ...)
{
  return [a1 enrollmentMode];
}

id objc_msgSend_enterprisePersonaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 enterprisePersonaIdentifier];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_exceptionsDictionary(void *a1, const char *a2, ...)
{
  return [a1 exceptionsDictionary];
}

id objc_msgSend_excludedDomains(void *a1, const char *a2, ...)
{
  return [a1 excludedDomains];
}

id objc_msgSend_explicitlyRestrictedAppsBySetting(void *a1, const char *a2, ...)
{
  return [a1 explicitlyRestrictedAppsBySetting];
}

id objc_msgSend_extendedKeyUsage(void *a1, const char *a2, ...)
{
  return [a1 extendedKeyUsage];
}

id objc_msgSend_faceTimeSignInAttemptDidFinish(void *a1, const char *a2, ...)
{
  return [a1 faceTimeSignInAttemptDidFinish];
}

id objc_msgSend_featureFlagsConfiguration(void *a1, const char *a2, ...)
{
  return [a1 featureFlagsConfiguration];
}

id objc_msgSend_fetchDirtyPersonaIDs(void *a1, const char *a2, ...)
{
  return [a1 fetchDirtyPersonaIDs];
}

id objc_msgSend_fileManager(void *a1, const char *a2, ...)
{
  return [a1 fileManager];
}

id objc_msgSend_filterType(void *a1, const char *a2, ...)
{
  return [a1 filterType];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_followUpController(void *a1, const char *a2, ...)
{
  return [a1 followUpController];
}

id objc_msgSend_fontData(void *a1, const char *a2, ...)
{
  return [a1 fontData];
}

id objc_msgSend_friendlyName(void *a1, const char *a2, ...)
{
  return [a1 friendlyName];
}

id objc_msgSend_fullScreen(void *a1, const char *a2, ...)
{
  return [a1 fullScreen];
}

id objc_msgSend_generateSalt(void *a1, const char *a2, ...)
{
  return [a1 generateSalt];
}

id objc_msgSend_geofenceId(void *a1, const char *a2, ...)
{
  return [a1 geofenceId];
}

id objc_msgSend_geofenceList(void *a1, const char *a2, ...)
{
  return [a1 geofenceList];
}

id objc_msgSend_getConfigurationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 getConfigurationIdentifier];
}

id objc_msgSend_getPreprocessedPayloadContents(void *a1, const char *a2, ...)
{
  return [a1 getPreprocessedPayloadContents];
}

id objc_msgSend_getProtectedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 getProtectedConfiguration];
}

id objc_msgSend_globalManagedPreferencesDomain(void *a1, const char *a2, ...)
{
  return [a1 globalManagedPreferencesDomain];
}

id objc_msgSend_hasCertificate(void *a1, const char *a2, ...)
{
  return [a1 hasCertificate];
}

id objc_msgSend_hasMAIDCredential(void *a1, const char *a2, ...)
{
  return [a1 hasMAIDCredential];
}

id objc_msgSend_hasSEP(void *a1, const char *a2, ...)
{
  return [a1 hasSEP];
}

id objc_msgSend_hashDictionaries(void *a1, const char *a2, ...)
{
  return [a1 hashDictionaries];
}

id objc_msgSend_holdAssertion(void *a1, const char *a2, ...)
{
  return [a1 holdAssertion];
}

id objc_msgSend_homeScreenLayoutFilePath(void *a1, const char *a2, ...)
{
  return [a1 homeScreenLayoutFilePath];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_hostname(void *a1, const char *a2, ...)
{
  return [a1 hostname];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_hrnRequiredPayloads(void *a1, const char *a2, ...)
{
  return [a1 hrnRequiredPayloads];
}

id objc_msgSend_humanReadableName(void *a1, const char *a2, ...)
{
  return [a1 humanReadableName];
}

id objc_msgSend_iCloudEnrollmentID(void *a1, const char *a2, ...)
{
  return [a1 iCloudEnrollmentID];
}

id objc_msgSend_iconData(void *a1, const char *a2, ...)
{
  return [a1 iconData];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identityPersistentID(void *a1, const char *a2, ...)
{
  return [a1 identityPersistentID];
}

id objc_msgSend_identityUUID(void *a1, const char *a2, ...)
{
  return [a1 identityUUID];
}

id objc_msgSend_ignoreManifestScope(void *a1, const char *a2, ...)
{
  return [a1 ignoreManifestScope];
}

id objc_msgSend_inSharediPadUserSession(void *a1, const char *a2, ...)
{
  return [a1 inSharediPadUserSession];
}

id objc_msgSend_incomingMailServerAuthentication(void *a1, const char *a2, ...)
{
  return [a1 incomingMailServerAuthentication];
}

id objc_msgSend_incomingMailServerHostname(void *a1, const char *a2, ...)
{
  return [a1 incomingMailServerHostname];
}

id objc_msgSend_incomingMailServerIMAPPathPrefix(void *a1, const char *a2, ...)
{
  return [a1 incomingMailServerIMAPPathPrefix];
}

id objc_msgSend_incomingMailServerPortNumber(void *a1, const char *a2, ...)
{
  return [a1 incomingMailServerPortNumber];
}

id objc_msgSend_incomingMailServerUseSSL(void *a1, const char *a2, ...)
{
  return [a1 incomingMailServerUseSSL];
}

id objc_msgSend_incomingMailServerUsername(void *a1, const char *a2, ...)
{
  return [a1 incomingMailServerUsername];
}

id objc_msgSend_incomingPassword(void *a1, const char *a2, ...)
{
  return [a1 incomingPassword];
}

id objc_msgSend_ingestedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ingestedConfiguration];
}

id objc_msgSend_installOptions(void *a1, const char *a2, ...)
{
  return [a1 installOptions];
}

id objc_msgSend_installType(void *a1, const char *a2, ...)
{
  return [a1 installType];
}

id objc_msgSend_installationWarnings(void *a1, const char *a2, ...)
{
  return [a1 installationWarnings];
}

id objc_msgSend_installedACAccounts(void *a1, const char *a2, ...)
{
  return [a1 installedACAccounts];
}

id objc_msgSend_installedMDMProfile(void *a1, const char *a2, ...)
{
  return [a1 installedMDMProfile];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internalError(void *a1, const char *a2, ...)
{
  return [a1 internalError];
}

id objc_msgSend_intersectionFeaturesWithPayloadRestictionKeyAlias(void *a1, const char *a2, ...)
{
  return [a1 intersectionFeaturesWithPayloadRestictionKeyAlias];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateCache(void *a1, const char *a2, ...)
{
  return [a1 invalidateCache];
}

id objc_msgSend_isCloudLocked(void *a1, const char *a2, ...)
{
  return [a1 isCloudLocked];
}

id objc_msgSend_isDestructive(void *a1, const char *a2, ...)
{
  return [a1 isDestructive];
}

id objc_msgSend_isDeviceLocked(void *a1, const char *a2, ...)
{
  return [a1 isDeviceLocked];
}

id objc_msgSend_isDeviceUnlocked(void *a1, const char *a2, ...)
{
  return [a1 isDeviceUnlocked];
}

id objc_msgSend_isEncrypted(void *a1, const char *a2, ...)
{
  return [a1 isEncrypted];
}

id objc_msgSend_isFirstAutoJoinRestricted(void *a1, const char *a2, ...)
{
  return [a1 isFirstAutoJoinRestricted];
}

id objc_msgSend_isFullyTrustedRootCert(void *a1, const char *a2, ...)
{
  return [a1 isFullyTrustedRootCert];
}

id objc_msgSend_isHRNMode(void *a1, const char *a2, ...)
{
  return [a1 isHRNMode];
}

id objc_msgSend_isHardwareBound(void *a1, const char *a2, ...)
{
  return [a1 isHardwareBound];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isHomePodAvailable(void *a1, const char *a2, ...)
{
  return [a1 isHomePodAvailable];
}

id objc_msgSend_isHotspot(void *a1, const char *a2, ...)
{
  return [a1 isHotspot];
}

id objc_msgSend_isIdentity(void *a1, const char *a2, ...)
{
  return [a1 isIdentity];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isInstalledForSystem(void *a1, const char *a2, ...)
{
  return [a1 isInstalledForSystem];
}

id objc_msgSend_isInstalledForUser(void *a1, const char *a2, ...)
{
  return [a1 isInstalledForUser];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isLoginUser(void *a1, const char *a2, ...)
{
  return [a1 isLoginUser];
}

id objc_msgSend_isMDMClientIdentity(void *a1, const char *a2, ...)
{
  return [a1 isMDMClientIdentity];
}

id objc_msgSend_isMDMProfile(void *a1, const char *a2, ...)
{
  return [a1 isMDMProfile];
}

id objc_msgSend_isMailDropEnabled(void *a1, const char *a2, ...)
{
  return [a1 isMailDropEnabled];
}

id objc_msgSend_isManagedByMDM(void *a1, const char *a2, ...)
{
  return [a1 isManagedByMDM];
}

id objc_msgSend_isOpenInRestrictionInEffect(void *a1, const char *a2, ...)
{
  return [a1 isOpenInRestrictionInEffect];
}

id objc_msgSend_isPasscodeRecoveryRestricted(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeRecoveryRestricted];
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeSet];
}

id objc_msgSend_isRecentsSyncingDisabled(void *a1, const char *a2, ...)
{
  return [a1 isRecentsSyncingDisabled];
}

id objc_msgSend_isRemovable(void *a1, const char *a2, ...)
{
  return [a1 isRemovable];
}

id objc_msgSend_isRoot(void *a1, const char *a2, ...)
{
  return [a1 isRoot];
}

id objc_msgSend_isServiceProviderRoamingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isServiceProviderRoamingEnabled];
}

id objc_msgSend_isSetAside(void *a1, const char *a2, ...)
{
  return [a1 isSetAside];
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return [a1 isSharedIPad];
}

id objc_msgSend_isSharediPad(void *a1, const char *a2, ...)
{
  return [a1 isSharediPad];
}

id objc_msgSend_isSigned(void *a1, const char *a2, ...)
{
  return [a1 isSigned];
}

id objc_msgSend_isStub(void *a1, const char *a2, ...)
{
  return [a1 isStub];
}

id objc_msgSend_isSupervised(void *a1, const char *a2, ...)
{
  return [a1 isSupervised];
}

id objc_msgSend_isTeslaEnrolled(void *a1, const char *a2, ...)
{
  return [a1 isTeslaEnrolled];
}

id objc_msgSend_isUserEnrollment(void *a1, const char *a2, ...)
{
  return [a1 isUserEnrollment];
}

id objc_msgSend_isUserEnrollmentProfile(void *a1, const char *a2, ...)
{
  return [a1 isUserEnrollmentProfile];
}

id objc_msgSend_isVisionDevice(void *a1, const char *a2, ...)
{
  return [a1 isVisionDevice];
}

id objc_msgSend_isVisionProfileEnrollEnabled(void *a1, const char *a2, ...)
{
  return [a1 isVisionProfileEnrollEnabled];
}

id objc_msgSend_isWEP(void *a1, const char *a2, ...)
{
  return [a1 isWEP];
}

id objc_msgSend_isWPA(void *a1, const char *a2, ...)
{
  return [a1 isWPA];
}

id objc_msgSend_kerberosInfo(void *a1, const char *a2, ...)
{
  return [a1 kerberosInfo];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_keySize(void *a1, const char *a2, ...)
{
  return [a1 keySize];
}

id objc_msgSend_keyType(void *a1, const char *a2, ...)
{
  return [a1 keyType];
}

id objc_msgSend_keyUsage(void *a1, const char *a2, ...)
{
  return [a1 keyUsage];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_layout(void *a1, const char *a2, ...)
{
  return [a1 layout];
}

id objc_msgSend_leaderPayloadCertificateAnchorPersistentID(void *a1, const char *a2, ...)
{
  return [a1 leaderPayloadCertificateAnchorPersistentID];
}

id objc_msgSend_leaderPayloadCertificateAnchorUUID(void *a1, const char *a2, ...)
{
  return [a1 leaderPayloadCertificateAnchorUUID];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lifetime(void *a1, const char *a2, ...)
{
  return [a1 lifetime];
}

id objc_msgSend_loadConfigurationsForceReloadFromDisk(void *a1, const char *a2, ...)
{
  return [a1 loadConfigurationsForceReloadFromDisk];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lockConfigurations(void *a1, const char *a2, ...)
{
  return [a1 lockConfigurations];
}

id objc_msgSend_loggingID(void *a1, const char *a2, ...)
{
  return [a1 loggingID];
}

id objc_msgSend_loggingPayload(void *a1, const char *a2, ...)
{
  return [a1 loggingPayload];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mailAccountIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 mailAccountIdentifiers];
}

id objc_msgSend_mailAccounts(void *a1, const char *a2, ...)
{
  return [a1 mailAccounts];
}

id objc_msgSend_mailDomains(void *a1, const char *a2, ...)
{
  return [a1 mailDomains];
}

id objc_msgSend_mailNumberOfPastDaysToSync(void *a1, const char *a2, ...)
{
  return [a1 mailNumberOfPastDaysToSync];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_managedAppChangeNotificationToken(void *a1, const char *a2, ...)
{
  return [a1 managedAppChangeNotificationToken];
}

id objc_msgSend_managedAppleID(void *a1, const char *a2, ...)
{
  return [a1 managedAppleID];
}

id objc_msgSend_managedAppleIDName(void *a1, const char *a2, ...)
{
  return [a1 managedAppleIDName];
}

id objc_msgSend_managedServiceIDs(void *a1, const char *a2, ...)
{
  return [a1 managedServiceIDs];
}

id objc_msgSend_managedWiFiNetworkNames(void *a1, const char *a2, ...)
{
  return [a1 managedWiFiNetworkNames];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_markAllPropertiesDirty(void *a1, const char *a2, ...)
{
  return [a1 markAllPropertiesDirty];
}

id objc_msgSend_marketingVersion(void *a1, const char *a2, ...)
{
  return [a1 marketingVersion];
}

id objc_msgSend_mayChangePasscode(void *a1, const char *a2, ...)
{
  return [a1 mayChangePasscode];
}

id objc_msgSend_mayOpenFromManagedToUnmanaged(void *a1, const char *a2, ...)
{
  return [a1 mayOpenFromManagedToUnmanaged];
}

id objc_msgSend_mayOpenFromUnmanagedToManaged(void *a1, const char *a2, ...)
{
  return [a1 mayOpenFromUnmanagedToManaged];
}

id objc_msgSend_mcAccountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 mcAccountIdentifier];
}

id objc_msgSend_mcConfigurationProfileIdentifier(void *a1, const char *a2, ...)
{
  return [a1 mcConfigurationProfileIdentifier];
}

id objc_msgSend_mcPayloadUUID(void *a1, const char *a2, ...)
{
  return [a1 mcPayloadUUID];
}

id objc_msgSend_mcProfileUUID(void *a1, const char *a2, ...)
{
  return [a1 mcProfileUUID];
}

id objc_msgSend_mdmAdoptablePayloads(void *a1, const char *a2, ...)
{
  return [a1 mdmAdoptablePayloads];
}

id objc_msgSend_memberPayloadCertificateAnchorPersistentID(void *a1, const char *a2, ...)
{
  return [a1 memberPayloadCertificateAnchorPersistentID];
}

id objc_msgSend_memberPayloadCertificateAnchorUUID(void *a1, const char *a2, ...)
{
  return [a1 memberPayloadCertificateAnchorUUID];
}

id objc_msgSend_memberQueue(void *a1, const char *a2, ...)
{
  return [a1 memberQueue];
}

id objc_msgSend_memberQueueCacheClientRestrictionPasscodeCompliance(void *a1, const char *a2, ...)
{
  return [a1 memberQueueCacheClientRestrictionPasscodeCompliance];
}

id objc_msgSend_memberQueueCheckPasscodeCompliesWithCurrentRestrictions(void *a1, const char *a2, ...)
{
  return [a1 memberQueueCheckPasscodeCompliesWithCurrentRestrictions];
}

id objc_msgSend_memberQueueCheckPasscodeCompliesWithProfileRestrictions(void *a1, const char *a2, ...)
{
  return [a1 memberQueueCheckPasscodeCompliesWithProfileRestrictions];
}

id objc_msgSend_memberQueueClearAllPasscodeComplianceCaches(void *a1, const char *a2, ...)
{
  return [a1 memberQueueClearAllPasscodeComplianceCaches];
}

id objc_msgSend_memberQueueClearPasscodeHistoryIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 memberQueueClearPasscodeHistoryIfNecessary];
}

id objc_msgSend_memberQueueClearProfileRestrictionPasscodeComplianceCache(void *a1, const char *a2, ...)
{
  return [a1 memberQueueClearProfileRestrictionPasscodeComplianceCache];
}

id objc_msgSend_memberQueueClearRestrictionPasscodeComplianceCache(void *a1, const char *a2, ...)
{
  return [a1 memberQueueClearRestrictionPasscodeComplianceCache];
}

id objc_msgSend_memberQueueCombinedSystemProfileRestrictions(void *a1, const char *a2, ...)
{
  return [a1 memberQueueCombinedSystemProfileRestrictions];
}

id objc_msgSend_memberQueueCommitClientRestrictionsToDisk(void *a1, const char *a2, ...)
{
  return [a1 memberQueueCommitClientRestrictionsToDisk];
}

id objc_msgSend_memberQueueCommitRestrictionsToDisk(void *a1, const char *a2, ...)
{
  return [a1 memberQueueCommitRestrictionsToDisk];
}

id objc_msgSend_memberQueueCommitUserSettingsToDisk(void *a1, const char *a2, ...)
{
  return [a1 memberQueueCommitUserSettingsToDisk];
}

id objc_msgSend_memberQueueEffectiveUserSettings(void *a1, const char *a2, ...)
{
  return [a1 memberQueueEffectiveUserSettings];
}

id objc_msgSend_memberQueueHasActivationRecordChangesPending(void *a1, const char *a2, ...)
{
  return [a1 memberQueueHasActivationRecordChangesPending];
}

id objc_msgSend_memberQueueHasMigrated(void *a1, const char *a2, ...)
{
  return [a1 memberQueueHasMigrated];
}

id objc_msgSend_memberQueueManagingProfileIdentifier(void *a1, const char *a2, ...)
{
  return [a1 memberQueueManagingProfileIdentifier];
}

id objc_msgSend_memberQueueOrganizationInfo(void *a1, const char *a2, ...)
{
  return [a1 memberQueueOrganizationInfo];
}

id objc_msgSend_memberQueueOverridingRestrictionClientUUID(void *a1, const char *a2, ...)
{
  return [a1 memberQueueOverridingRestrictionClientUUID];
}

id objc_msgSend_memberQueuePasscodeCompliesWithProfileRestrictions(void *a1, const char *a2, ...)
{
  return [a1 memberQueuePasscodeCompliesWithProfileRestrictions];
}

id objc_msgSend_memberQueuePasscodeCompliesWithRestrictions(void *a1, const char *a2, ...)
{
  return [a1 memberQueuePasscodeCompliesWithRestrictions];
}

id objc_msgSend_memberQueueRecomputePasscodeComplianceForClientUUID(void *a1, const char *a2, ...)
{
  return [a1 memberQueueRecomputePasscodeComplianceForClientUUID];
}

id objc_msgSend_memberQueueRestrictions(void *a1, const char *a2, ...)
{
  return [a1 memberQueueRestrictions];
}

id objc_msgSend_memberQueueServerURL(void *a1, const char *a2, ...)
{
  return [a1 memberQueueServerURL];
}

id objc_msgSend_memberQueueSettingsEvents(void *a1, const char *a2, ...)
{
  return [a1 memberQueueSettingsEvents];
}

id objc_msgSend_memberQueueSystemClientRestrictions(void *a1, const char *a2, ...)
{
  return [a1 memberQueueSystemClientRestrictions];
}

id objc_msgSend_memberQueueSystemDomainsDict(void *a1, const char *a2, ...)
{
  return [a1 memberQueueSystemDomainsDict];
}

id objc_msgSend_memberQueueSystemNamespacedUserSettings(void *a1, const char *a2, ...)
{
  return [a1 memberQueueSystemNamespacedUserSettings];
}

id objc_msgSend_memberQueueSystemOrphansDict(void *a1, const char *a2, ...)
{
  return [a1 memberQueueSystemOrphansDict];
}

id objc_msgSend_memberQueueSystemProfileRestrictions(void *a1, const char *a2, ...)
{
  return [a1 memberQueueSystemProfileRestrictions];
}

id objc_msgSend_memberQueueSystemUserSettings(void *a1, const char *a2, ...)
{
  return [a1 memberQueueSystemUserSettings];
}

id objc_msgSend_memberQueueUserClientRestrictions(void *a1, const char *a2, ...)
{
  return [a1 memberQueueUserClientRestrictions];
}

id objc_msgSend_memberQueueUserDomainsDict(void *a1, const char *a2, ...)
{
  return [a1 memberQueueUserDomainsDict];
}

id objc_msgSend_memberQueueUserNamespacedUserSettings(void *a1, const char *a2, ...)
{
  return [a1 memberQueueUserNamespacedUserSettings];
}

id objc_msgSend_memberQueueUserOrphansDict(void *a1, const char *a2, ...)
{
  return [a1 memberQueueUserOrphansDict];
}

id objc_msgSend_memberQueueUserProfileRestrictions(void *a1, const char *a2, ...)
{
  return [a1 memberQueueUserProfileRestrictions];
}

id objc_msgSend_memberQueueUserUserSettings(void *a1, const char *a2, ...)
{
  return [a1 memberQueueUserUserSettings];
}

id objc_msgSend_migratePasscodeMetadata(void *a1, const char *a2, ...)
{
  return [a1 migratePasscodeMetadata];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_mustNotUseSynchronizableCredential(void *a1, const char *a2, ...)
{
  return [a1 mustNotUseSynchronizableCredential];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nePayloadBase(void *a1, const char *a2, ...)
{
  return [a1 nePayloadBase];
}

id objc_msgSend_neProfileIngestionHandler(void *a1, const char *a2, ...)
{
  return [a1 neProfileIngestionHandler];
}

id objc_msgSend_networkIdentifier(void *a1, const char *a2, ...)
{
  return [a1 networkIdentifier];
}

id objc_msgSend_newProfileSignatureVersion(void *a1, const char *a2, ...)
{
  return [a1 newProfileSignatureVersion];
}

id objc_msgSend_nonChaperonePairingAllowed(void *a1, const char *a2, ...)
{
  return [a1 nonChaperonePairingAllowed];
}

id objc_msgSend_normalizedURL(void *a1, const char *a2, ...)
{
  return [a1 normalizedURL];
}

id objc_msgSend_notInstalledByMDMError(void *a1, const char *a2, ...)
{
  return [a1 notInstalledByMDMError];
}

id objc_msgSend_notSupportedUnderMultiUserModeError(void *a1, const char *a2, ...)
{
  return [a1 notSupportedUnderMultiUserModeError];
}

id objc_msgSend_notificationSettings(void *a1, const char *a2, ...)
{
  return [a1 notificationSettings];
}

id objc_msgSend_notificationSettingsFilePath(void *a1, const char *a2, ...)
{
  return [a1 notificationSettingsFilePath];
}

id objc_msgSend_notifier(void *a1, const char *a2, ...)
{
  return [a1 notifier];
}

id objc_msgSend_notifyBatterySaverModeChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyBatterySaverModeChanged];
}

id objc_msgSend_notifyClientsToRecomputeCompliance(void *a1, const char *a2, ...)
{
  return [a1 notifyClientsToRecomputeCompliance];
}

id objc_msgSend_notifyFirstUnlock(void *a1, const char *a2, ...)
{
  return [a1 notifyFirstUnlock];
}

id objc_msgSend_notifyGracePeriodChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyGracePeriodChanged];
}

id objc_msgSend_notifyMementoEffaced(void *a1, const char *a2, ...)
{
  return [a1 notifyMementoEffaced];
}

id objc_msgSend_notifyNewConfiguration(void *a1, const char *a2, ...)
{
  return [a1 notifyNewConfiguration];
}

id objc_msgSend_notifyProvisioningProfilesChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyProvisioningProfilesChanged];
}

id objc_msgSend_notifyUserLoggedIn(void *a1, const char *a2, ...)
{
  return [a1 notifyUserLoggedIn];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_organization(void *a1, const char *a2, ...)
{
  return [a1 organization];
}

id objc_msgSend_outgoingMailServerAuthentication(void *a1, const char *a2, ...)
{
  return [a1 outgoingMailServerAuthentication];
}

id objc_msgSend_outgoingMailServerHostname(void *a1, const char *a2, ...)
{
  return [a1 outgoingMailServerHostname];
}

id objc_msgSend_outgoingMailServerPortNumber(void *a1, const char *a2, ...)
{
  return [a1 outgoingMailServerPortNumber];
}

id objc_msgSend_outgoingMailServerUseSSL(void *a1, const char *a2, ...)
{
  return [a1 outgoingMailServerUseSSL];
}

id objc_msgSend_outgoingMailServerUsername(void *a1, const char *a2, ...)
{
  return [a1 outgoingMailServerUsername];
}

id objc_msgSend_outgoingPassword(void *a1, const char *a2, ...)
{
  return [a1 outgoingPassword];
}

id objc_msgSend_outgoingPasswordSameAsIncomingPassword(void *a1, const char *a2, ...)
{
  return [a1 outgoingPasswordSameAsIncomingPassword];
}

id objc_msgSend_overridePreviousPassword(void *a1, const char *a2, ...)
{
  return [a1 overridePreviousPassword];
}

id objc_msgSend_pairedDevicesSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 pairedDevicesSelectorBlock];
}

id objc_msgSend_pairingCertificateData(void *a1, const char *a2, ...)
{
  return [a1 pairingCertificateData];
}

id objc_msgSend_pairingToken(void *a1, const char *a2, ...)
{
  return [a1 pairingToken];
}

id objc_msgSend_passcodeChangedNotificationToken(void *a1, const char *a2, ...)
{
  return [a1 passcodeChangedNotificationToken];
}

id objc_msgSend_passcodeExpiryDate(void *a1, const char *a2, ...)
{
  return [a1 passcodeExpiryDate];
}

id objc_msgSend_passcodePolicyChangedNotificationToken(void *a1, const char *a2, ...)
{
  return [a1 passcodePolicyChangedNotificationToken];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_passwordRequired(void *a1, const char *a2, ...)
{
  return [a1 passwordRequired];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_payloadCertificateAnchorUUID(void *a1, const char *a2, ...)
{
  return [a1 payloadCertificateAnchorUUID];
}

id objc_msgSend_payloadCertificateAnchorUUIDs(void *a1, const char *a2, ...)
{
  return [a1 payloadCertificateAnchorUUIDs];
}

id objc_msgSend_payloadCertificatePersistentID(void *a1, const char *a2, ...)
{
  return [a1 payloadCertificatePersistentID];
}

id objc_msgSend_payloadCertificateUUID(void *a1, const char *a2, ...)
{
  return [a1 payloadCertificateUUID];
}

id objc_msgSend_payloads(void *a1, const char *a2, ...)
{
  return [a1 payloads];
}

id objc_msgSend_payloadsRequiringRatchetWithStolenDeviceProtection(void *a1, const char *a2, ...)
{
  return [a1 payloadsRequiringRatchetWithStolenDeviceProtection];
}

id objc_msgSend_pemData(void *a1, const char *a2, ...)
{
  return [a1 pemData];
}

id objc_msgSend_performSynchronously(void *a1, const char *a2, ...)
{
  return [a1 performSynchronously];
}

id objc_msgSend_permanentlyRedirectedURL(void *a1, const char *a2, ...)
{
  return [a1 permanentlyRedirectedURL];
}

id objc_msgSend_persistentAccount(void *a1, const char *a2, ...)
{
  return [a1 persistentAccount];
}

id objc_msgSend_persistentResourceID(void *a1, const char *a2, ...)
{
  return [a1 persistentResourceID];
}

id objc_msgSend_persistentURL(void *a1, const char *a2, ...)
{
  return [a1 persistentURL];
}

id objc_msgSend_persistentUUID(void *a1, const char *a2, ...)
{
  return [a1 persistentUUID];
}

id objc_msgSend_personaID(void *a1, const char *a2, ...)
{
  return [a1 personaID];
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 personaIdentifier];
}

id objc_msgSend_pinningRevocationCheckRequired(void *a1, const char *a2, ...)
{
  return [a1 pinningRevocationCheckRequired];
}

id objc_msgSend_pluginConfiguration(void *a1, const char *a2, ...)
{
  return [a1 pluginConfiguration];
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return [a1 policy];
}

id objc_msgSend_pollingIntervalMinutes(void *a1, const char *a2, ...)
{
  return [a1 pollingIntervalMinutes];
}

id objc_msgSend_popProfileDataAtHeadOfInstallationQueue(void *a1, const char *a2, ...)
{
  return [a1 popProfileDataAtHeadOfInstallationQueue];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_precomposed(void *a1, const char *a2, ...)
{
  return [a1 precomposed];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_preflightCompletionHandler(void *a1, const char *a2, ...)
{
  return [a1 preflightCompletionHandler];
}

id objc_msgSend_prepareToAddProfilePayloads(void *a1, const char *a2, ...)
{
  return [a1 prepareToAddProfilePayloads];
}

id objc_msgSend_preventAppSheet(void *a1, const char *a2, ...)
{
  return [a1 preventAppSheet];
}

id objc_msgSend_preventMove(void *a1, const char *a2, ...)
{
  return [a1 preventMove];
}

id objc_msgSend_principalName(void *a1, const char *a2, ...)
{
  return [a1 principalName];
}

id objc_msgSend_principalURL(void *a1, const char *a2, ...)
{
  return [a1 principalURL];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_profile(void *a1, const char *a2, ...)
{
  return [a1 profile];
}

id objc_msgSend_profileChangeNotificationToken(void *a1, const char *a2, ...)
{
  return [a1 profileChangeNotificationToken];
}

id objc_msgSend_profileEventsExpirationInterval(void *a1, const char *a2, ...)
{
  return [a1 profileEventsExpirationInterval];
}

id objc_msgSend_profileEventsFilePath(void *a1, const char *a2, ...)
{
  return [a1 profileEventsFilePath];
}

id objc_msgSend_profileEventsMaxLength(void *a1, const char *a2, ...)
{
  return [a1 profileEventsMaxLength];
}

id objc_msgSend_profileHandler(void *a1, const char *a2, ...)
{
  return [a1 profileHandler];
}

id objc_msgSend_profileMetadata(void *a1, const char *a2, ...)
{
  return [a1 profileMetadata];
}

id objc_msgSend_profileTrust(void *a1, const char *a2, ...)
{
  return [a1 profileTrust];
}

id objc_msgSend_provisionedDataclasses(void *a1, const char *a2, ...)
{
  return [a1 provisionedDataclasses];
}

id objc_msgSend_proxyCaptiveLoginAllowed(void *a1, const char *a2, ...)
{
  return [a1 proxyCaptiveLoginAllowed];
}

id objc_msgSend_proxyPACFallbackAllowed(void *a1, const char *a2, ...)
{
  return [a1 proxyPACFallbackAllowed];
}

id objc_msgSend_proxyPACURLString(void *a1, const char *a2, ...)
{
  return [a1 proxyPACURLString];
}

id objc_msgSend_proxyPassword(void *a1, const char *a2, ...)
{
  return [a1 proxyPassword];
}

id objc_msgSend_proxyServer(void *a1, const char *a2, ...)
{
  return [a1 proxyServer];
}

id objc_msgSend_proxyServerPort(void *a1, const char *a2, ...)
{
  return [a1 proxyServerPort];
}

id objc_msgSend_proxyType(void *a1, const char *a2, ...)
{
  return [a1 proxyType];
}

id objc_msgSend_proxyUsername(void *a1, const char *a2, ...)
{
  return [a1 proxyUsername];
}

id objc_msgSend_purgatoryTimer(void *a1, const char *a2, ...)
{
  return [a1 purgatoryTimer];
}

id objc_msgSend_qosMarkingConfig(void *a1, const char *a2, ...)
{
  return [a1 qosMarkingConfig];
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return [a1 radius];
}

id objc_msgSend_realm(void *a1, const char *a2, ...)
{
  return [a1 realm];
}

id objc_msgSend_recomputeAccountVPNAssociations(void *a1, const char *a2, ...)
{
  return [a1 recomputeAccountVPNAssociations];
}

id objc_msgSend_recomputeAirPlaySettings(void *a1, const char *a2, ...)
{
  return [a1 recomputeAirPlaySettings];
}

id objc_msgSend_recomputeAppRulesForNetworkExtension(void *a1, const char *a2, ...)
{
  return [a1 recomputeAppRulesForNetworkExtension];
}

id objc_msgSend_recomputeNagMetadata(void *a1, const char *a2, ...)
{
  return [a1 recomputeNagMetadata];
}

id objc_msgSend_recomputeUserRestrictionsAndEffectiveUserSettings(void *a1, const char *a2, ...)
{
  return [a1 recomputeUserRestrictionsAndEffectiveUserSettings];
}

id objc_msgSend_recoveryPasscodeExpiryDate(void *a1, const char *a2, ...)
{
  return [a1 recoveryPasscodeExpiryDate];
}

id objc_msgSend_refetchUser(void *a1, const char *a2, ...)
{
  return [a1 refetchUser];
}

id objc_msgSend_refreshDetailsFromDisk(void *a1, const char *a2, ...)
{
  return [a1 refreshDetailsFromDisk];
}

id objc_msgSend_relayUUID(void *a1, const char *a2, ...)
{
  return [a1 relayUUID];
}

id objc_msgSend_releaseAssertion(void *a1, const char *a2, ...)
{
  return [a1 releaseAssertion];
}

id objc_msgSend_reloadAccounts(void *a1, const char *a2, ...)
{
  return [a1 reloadAccounts];
}

id objc_msgSend_remoteProcessBundleID(void *a1, const char *a2, ...)
{
  return [a1 remoteProcessBundleID];
}

id objc_msgSend_remoteQueueableHomePodPayloadClasses(void *a1, const char *a2, ...)
{
  return [a1 remoteQueueableHomePodPayloadClasses];
}

id objc_msgSend_remoteQueueableWatchPayloadClasses(void *a1, const char *a2, ...)
{
  return [a1 remoteQueueableWatchPayloadClasses];
}

id objc_msgSend_removalDate(void *a1, const char *a2, ...)
{
  return [a1 removalDate];
}

id objc_msgSend_removalPasscode(void *a1, const char *a2, ...)
{
  return [a1 removalPasscode];
}

id objc_msgSend_remove(void *a1, const char *a2, ...)
{
  return [a1 remove];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeClientCertificateData(void *a1, const char *a2, ...)
{
  return [a1 removeClientCertificateData];
}

id objc_msgSend_removeExpiredProfileEvents(void *a1, const char *a2, ...)
{
  return [a1 removeExpiredProfileEvents];
}

id objc_msgSend_removeExpiredProfiles(void *a1, const char *a2, ...)
{
  return [a1 removeExpiredProfiles];
}

id objc_msgSend_removeFromDisk(void *a1, const char *a2, ...)
{
  return [a1 removeFromDisk];
}

id objc_msgSend_removeManagedProfilesIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 removeManagedProfilesIfNecessary];
}

id objc_msgSend_removeOrphanedClientRestrictions(void *a1, const char *a2, ...)
{
  return [a1 removeOrphanedClientRestrictions];
}

id objc_msgSend_removeOrphanedEnrollmentAccounts(void *a1, const char *a2, ...)
{
  return [a1 removeOrphanedEnrollmentAccounts];
}

id objc_msgSend_removePersistentAccount(void *a1, const char *a2, ...)
{
  return [a1 removePersistentAccount];
}

id objc_msgSend_requiredAppIDForMDM(void *a1, const char *a2, ...)
{
  return [a1 requiredAppIDForMDM];
}

id objc_msgSend_rescheduleManagedAppValidationJob(void *a1, const char *a2, ...)
{
  return [a1 rescheduleManagedAppValidationJob];
}

id objc_msgSend_reschedulePasscodeExpiryJob(void *a1, const char *a2, ...)
{
  return [a1 reschedulePasscodeExpiryJob];
}

id objc_msgSend_rescheduleProfileJanitorJob(void *a1, const char *a2, ...)
{
  return [a1 rescheduleProfileJanitorJob];
}

id objc_msgSend_rescheduleRecoveryPasscodeExpiryJob(void *a1, const char *a2, ...)
{
  return [a1 rescheduleRecoveryPasscodeExpiryJob];
}

id objc_msgSend_resetAPNSettings(void *a1, const char *a2, ...)
{
  return [a1 resetAPNSettings];
}

id objc_msgSend_resetPasscodeMetadata(void *a1, const char *a2, ...)
{
  return [a1 resetPasscodeMetadata];
}

id objc_msgSend_resourcePayloadCertificatePersistentID(void *a1, const char *a2, ...)
{
  return [a1 resourcePayloadCertificatePersistentID];
}

id objc_msgSend_resourcePayloadCertificateUUID(void *a1, const char *a2, ...)
{
  return [a1 resourcePayloadCertificateUUID];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_responseData(void *a1, const char *a2, ...)
{
  return [a1 responseData];
}

id objc_msgSend_responsibleClients(void *a1, const char *a2, ...)
{
  return [a1 responsibleClients];
}

id objc_msgSend_restrictDomains(void *a1, const char *a2, ...)
{
  return [a1 restrictDomains];
}

id objc_msgSend_restrictedFromSendingExternally(void *a1, const char *a2, ...)
{
  return [a1 restrictedFromSendingExternally];
}

id objc_msgSend_restrictionEnforcingApps(void *a1, const char *a2, ...)
{
  return [a1 restrictionEnforcingApps];
}

id objc_msgSend_restrictions(void *a1, const char *a2, ...)
{
  return [a1 restrictions];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retries(void *a1, const char *a2, ...)
{
  return [a1 retries];
}

id objc_msgSend_retryDelay(void *a1, const char *a2, ...)
{
  return [a1 retryDelay];
}

id objc_msgSend_retryNotNowResponse(void *a1, const char *a2, ...)
{
  return [a1 retryNotNowResponse];
}

id objc_msgSend_revalidateManagedApps(void *a1, const char *a2, ...)
{
  return [a1 revalidateManagedApps];
}

id objc_msgSend_rmAccountID(void *a1, const char *a2, ...)
{
  return [a1 rmAccountID];
}

id objc_msgSend_roamingConsortiumOIs(void *a1, const char *a2, ...)
{
  return [a1 roamingConsortiumOIs];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_savePersistentAccount(void *a1, const char *a2, ...)
{
  return [a1 savePersistentAccount];
}

id objc_msgSend_savedIdentifier(void *a1, const char *a2, ...)
{
  return [a1 savedIdentifier];
}

id objc_msgSend_savedWebClipIdentifier(void *a1, const char *a2, ...)
{
  return [a1 savedWebClipIdentifier];
}

id objc_msgSend_scheduleRecomputeNagMetadataJob(void *a1, const char *a2, ...)
{
  return [a1 scheduleRecomputeNagMetadataJob];
}

id objc_msgSend_scheduleTokenUpdate(void *a1, const char *a2, ...)
{
  return [a1 scheduleTokenUpdate];
}

id objc_msgSend_scheduleTokenUpdateIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 scheduleTokenUpdateIfNecessary];
}

id objc_msgSend_searchSettings(void *a1, const char *a2, ...)
{
  return [a1 searchSettings];
}

id objc_msgSend_securityType(void *a1, const char *a2, ...)
{
  return [a1 securityType];
}

id objc_msgSend_sendCleanupMigrationFinishedNotification(void *a1, const char *a2, ...)
{
  return [a1 sendCleanupMigrationFinishedNotification];
}

id objc_msgSend_sendCloudConfigurationDetailsChangedNotification(void *a1, const char *a2, ...)
{
  return [a1 sendCloudConfigurationDetailsChangedNotification];
}

id objc_msgSend_senderPID(void *a1, const char *a2, ...)
{
  return [a1 senderPID];
}

id objc_msgSend_serializableDictionary(void *a1, const char *a2, ...)
{
  return [a1 serializableDictionary];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_serverCapabilities(void *a1, const char *a2, ...)
{
  return [a1 serverCapabilities];
}

id objc_msgSend_serverPinningPersistentRefs(void *a1, const char *a2, ...)
{
  return [a1 serverPinningPersistentRefs];
}

id objc_msgSend_serverPinningUUIDs(void *a1, const char *a2, ...)
{
  return [a1 serverPinningUUIDs];
}

id objc_msgSend_serverURLString(void *a1, const char *a2, ...)
{
  return [a1 serverURLString];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setAsideAccount(void *a1, const char *a2, ...)
{
  return [a1 setAsideAccount];
}

id objc_msgSend_setAsideAccountCredential(void *a1, const char *a2, ...)
{
  return [a1 setAsideAccountCredential];
}

id objc_msgSend_setAsideAccountDictionary(void *a1, const char *a2, ...)
{
  return [a1 setAsideAccountDictionary];
}

id objc_msgSend_setAsideAccountIdentifiersByPayloadClass(void *a1, const char *a2, ...)
{
  return [a1 setAsideAccountIdentifiersByPayloadClass];
}

id objc_msgSend_setAsideDAAccount(void *a1, const char *a2, ...)
{
  return [a1 setAsideDAAccount];
}

id objc_msgSend_setAsideDictionary(void *a1, const char *a2, ...)
{
  return [a1 setAsideDictionary];
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return [a1 sharedClient];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedCredentialStorage(void *a1, const char *a2, ...)
{
  return [a1 sharedCredentialStorage];
}

id objc_msgSend_sharedHTTPCookieStorage(void *a1, const char *a2, ...)
{
  return [a1 sharedHTTPCookieStorage];
}

id objc_msgSend_sharedHacks(void *a1, const char *a2, ...)
{
  return [a1 sharedHacks];
}

id objc_msgSend_sharedInstaller(void *a1, const char *a2, ...)
{
  return [a1 sharedInstaller];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedJanitor(void *a1, const char *a2, ...)
{
  return [a1 sharedJanitor];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedManifest(void *a1, const char *a2, ...)
{
  return [a1 sharedManifest];
}

id objc_msgSend_sharedMirror(void *a1, const char *a2, ...)
{
  return [a1 sharedMirror];
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return [a1 sharedServer];
}

id objc_msgSend_shouldHaveFullSSLTrust(void *a1, const char *a2, ...)
{
  return [a1 shouldHaveFullSSLTrust];
}

id objc_msgSend_signMessage(void *a1, const char *a2, ...)
{
  return [a1 signMessage];
}

id objc_msgSend_signOutAllPrimaryAccounts(void *a1, const char *a2, ...)
{
  return [a1 signOutAllPrimaryAccounts];
}

id objc_msgSend_signerCertificates(void *a1, const char *a2, ...)
{
  return [a1 signerCertificates];
}

id objc_msgSend_simulatePush(void *a1, const char *a2, ...)
{
  return [a1 simulatePush];
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return [a1 slotID];
}

id objc_msgSend_sourceIsManaged(void *a1, const char *a2, ...)
{
  return [a1 sourceIsManaged];
}

id objc_msgSend_ssid(void *a1, const char *a2, ...)
{
  return [a1 ssid];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startPreflight(void *a1, const char *a2, ...)
{
  return [a1 startPreflight];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return [a1 subject];
}

id objc_msgSend_subjectAltName(void *a1, const char *a2, ...)
{
  return [a1 subjectAltName];
}

id objc_msgSend_supervisedRequiredPayloads(void *a1, const char *a2, ...)
{
  return [a1 supervisedRequiredPayloads];
}

id objc_msgSend_supplementalBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 supplementalBuildVersion];
}

id objc_msgSend_supplementalMarketingVersionExtra(void *a1, const char *a2, ...)
{
  return [a1 supplementalMarketingVersionExtra];
}

id objc_msgSend_supportUserChannel(void *a1, const char *a2, ...)
{
  return [a1 supportUserChannel];
}

id objc_msgSend_supportedDataclasses(void *a1, const char *a2, ...)
{
  return [a1 supportedDataclasses];
}

id objc_msgSend_syncDefaultFoldersOnly(void *a1, const char *a2, ...)
{
  return [a1 syncDefaultFoldersOnly];
}

id objc_msgSend_syncableSettings(void *a1, const char *a2, ...)
{
  return [a1 syncableSettings];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemClientRestrictions(void *a1, const char *a2, ...)
{
  return [a1 systemClientRestrictions];
}

id objc_msgSend_systemMetadataDictionary(void *a1, const char *a2, ...)
{
  return [a1 systemMetadataDictionary];
}

id objc_msgSend_systemProfileRestrictions(void *a1, const char *a2, ...)
{
  return [a1 systemProfileRestrictions];
}

id objc_msgSend_systemProfileStorageWasMigratedFromLegacyStorage(void *a1, const char *a2, ...)
{
  return [a1 systemProfileStorageWasMigratedFromLegacyStorage];
}

id objc_msgSend_systemStoragePath(void *a1, const char *a2, ...)
{
  return [a1 systemStoragePath];
}

id objc_msgSend_systemUserSettings(void *a1, const char *a2, ...)
{
  return [a1 systemUserSettings];
}

id objc_msgSend_targetApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 targetApplicationBundleIdentifier];
}

id objc_msgSend_targetDeviceType(void *a1, const char *a2, ...)
{
  return [a1 targetDeviceType];
}

id objc_msgSend_telephonyRepresentation(void *a1, const char *a2, ...)
{
  return [a1 telephonyRepresentation];
}

id objc_msgSend_thisDeviceType(void *a1, const char *a2, ...)
{
  return [a1 thisDeviceType];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return [a1 topic];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typeStrings(void *a1, const char *a2, ...)
{
  return [a1 typeStrings];
}

id objc_msgSend_unavailablePayloadsInEphemeralMultiUser(void *a1, const char *a2, ...)
{
  return [a1 unavailablePayloadsInEphemeralMultiUser];
}

id objc_msgSend_unavailableSystemPayloadsInEphemeralMultiUser(void *a1, const char *a2, ...)
{
  return [a1 unavailableSystemPayloadsInEphemeralMultiUser];
}

id objc_msgSend_unavailableUserPayloadsInEphemeralMultiUser(void *a1, const char *a2, ...)
{
  return [a1 unavailableUserPayloadsInEphemeralMultiUser];
}

id objc_msgSend_unhashedAccountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 unhashedAccountIdentifier];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unlockConfigurations(void *a1, const char *a2, ...)
{
  return [a1 unlockConfigurations];
}

id objc_msgSend_unsetAside(void *a1, const char *a2, ...)
{
  return [a1 unsetAside];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_untrackAllDirtyPersonas(void *a1, const char *a2, ...)
{
  return [a1 untrackAllDirtyPersonas];
}

id objc_msgSend_unverifiedInstalledMDMProfileIdentifier(void *a1, const char *a2, ...)
{
  return [a1 unverifiedInstalledMDMProfileIdentifier];
}

id objc_msgSend_updateDefaultAfterAddingConfiguration(void *a1, const char *a2, ...)
{
  return [a1 updateDefaultAfterAddingConfiguration];
}

id objc_msgSend_updateDefaultAfterDeletingConfiguration(void *a1, const char *a2, ...)
{
  return [a1 updateDefaultAfterDeletingConfiguration];
}

id objc_msgSend_updateMISTrust(void *a1, const char *a2, ...)
{
  return [a1 updateMISTrust];
}

id objc_msgSend_updatedOverInstalledAccount(void *a1, const char *a2, ...)
{
  return [a1 updatedOverInstalledAccount];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_uprootMDM(void *a1, const char *a2, ...)
{
  return [a1 uprootMDM];
}

id objc_msgSend_usageFlags(void *a1, const char *a2, ...)
{
  return [a1 usageFlags];
}

id objc_msgSend_useDevelopmentAPNS(void *a1, const char *a2, ...)
{
  return [a1 useDevelopmentAPNS];
}

id objc_msgSend_useOAuth(void *a1, const char *a2, ...)
{
  return [a1 useOAuth];
}

id objc_msgSend_useSSL(void *a1, const char *a2, ...)
{
  return [a1 useSSL];
}

id objc_msgSend_userBookmarks(void *a1, const char *a2, ...)
{
  return [a1 userBookmarks];
}

id objc_msgSend_userCancelledError(void *a1, const char *a2, ...)
{
  return [a1 userCancelledError];
}

id objc_msgSend_userClientRestrictions(void *a1, const char *a2, ...)
{
  return [a1 userClientRestrictions];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInputFields(void *a1, const char *a2, ...)
{
  return [a1 userInputFields];
}

id objc_msgSend_userInputResponses(void *a1, const char *a2, ...)
{
  return [a1 userInputResponses];
}

id objc_msgSend_userMetadataDictionary(void *a1, const char *a2, ...)
{
  return [a1 userMetadataDictionary];
}

id objc_msgSend_userMode(void *a1, const char *a2, ...)
{
  return [a1 userMode];
}

id objc_msgSend_userProfileRestrictions(void *a1, const char *a2, ...)
{
  return [a1 userProfileRestrictions];
}

id objc_msgSend_userSettings(void *a1, const char *a2, ...)
{
  return [a1 userSettings];
}

id objc_msgSend_userStoragePath(void *a1, const char *a2, ...)
{
  return [a1 userStoragePath];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_usernameRequired(void *a1, const char *a2, ...)
{
  return [a1 usernameRequired];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_verifiedMDMProfileIdentifierWithCleanUp(void *a1, const char *a2, ...)
{
  return [a1 verifiedMDMProfileIdentifierWithCleanUp];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_versionNumber(void *a1, const char *a2, ...)
{
  return [a1 versionNumber];
}

id objc_msgSend_vpnType(void *a1, const char *a2, ...)
{
  return [a1 vpnType];
}

id objc_msgSend_waitForCompletion(void *a1, const char *a2, ...)
{
  return [a1 waitForCompletion];
}

id objc_msgSend_watchAvailability(void *a1, const char *a2, ...)
{
  return [a1 watchAvailability];
}

id objc_msgSend_watchEnrollmentAllowLocalProfile(void *a1, const char *a2, ...)
{
  return [a1 watchEnrollmentAllowLocalProfile];
}

id objc_msgSend_webClips(void *a1, const char *a2, ...)
{
  return [a1 webClips];
}

id objc_msgSend_webContent(void *a1, const char *a2, ...)
{
  return [a1 webContent];
}

id objc_msgSend_whitelistedAppsAndOptions(void *a1, const char *a2, ...)
{
  return [a1 whitelistedAppsAndOptions];
}

id objc_msgSend_willPostEffectiveSettingsChangedNotification(void *a1, const char *a2, ...)
{
  return [a1 willPostEffectiveSettingsChangedNotification];
}

id objc_msgSend_workerQueue(void *a1, const char *a2, ...)
{
  return [a1 workerQueue];
}

id objc_msgSend_workerQueueBackgroundActivityManager(void *a1, const char *a2, ...)
{
  return [a1 workerQueueBackgroundActivityManager];
}

id objc_msgSend_workerQueueCheckForAutoInstallProfiles(void *a1, const char *a2, ...)
{
  return [a1 workerQueueCheckForAutoInstallProfiles];
}

id objc_msgSend_workerQueueLastCarrierProfileCheckTime(void *a1, const char *a2, ...)
{
  return [a1 workerQueueLastCarrierProfileCheckTime];
}

id objc_msgSend_workerQueueNotifyDeviceUnlocked(void *a1, const char *a2, ...)
{
  return [a1 workerQueueNotifyDeviceUnlocked];
}

id objc_msgSend_workerQueueNotifyDeviceUnlockedAndPasscodeRequired(void *a1, const char *a2, ...)
{
  return [a1 workerQueueNotifyDeviceUnlockedAndPasscodeRequired];
}

id objc_msgSend_workerQueueNotifyUserLoggedIn(void *a1, const char *a2, ...)
{
  return [a1 workerQueueNotifyUserLoggedIn];
}

id objc_msgSend_workerQueueRecomputeNagMessage(void *a1, const char *a2, ...)
{
  return [a1 workerQueueRecomputeNagMessage];
}

id objc_msgSend_write(void *a1, const char *a2, ...)
{
  return [a1 write];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}