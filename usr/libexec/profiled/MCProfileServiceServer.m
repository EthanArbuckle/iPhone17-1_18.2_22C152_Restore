@interface MCProfileServiceServer
+ (id)_descriptionForServiceSubscriptionContext:(id)a3;
+ (id)_optionsForCarrierProfileInstallationForCarrierIdentifier:(id)a3 name:(id)a4;
+ (id)sharedServer;
- (BOOL)_hasCompletedPostLoginWork;
- (BOOL)_isValidProvisioningProfileData:(id)a3;
- (BOOL)isBundleBlocked:(id)a3 outHash:(id *)a4 outHashType:(id *)a5;
- (BOOL)isOpenInRestrictionInEffect;
- (BOOL)mayOpenFromManagedToUnmanaged;
- (BOOL)mayOpenFromUnmanagedToManaged;
- (BOOL)memberQueueHasActivationRecordChangesPending;
- (BOOL)memberQueueHasMigrated;
- (BOOL)shouldApplyFilterForBundleID:(id)a3 sourceAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6;
- (BOOL)storeCloudConfigurationDetails:(id)a3 outError:(id *)a4;
- (CoreTelephonyClient)coreTelephonyClient;
- (DMCDaemonConnectionTracker)connectionTracker;
- (LSApplicationWorkspace)appWorkspace;
- (MCBackgroundActivityManager)workerQueueBackgroundActivityManager;
- (MCProfileServiceServer)init;
- (OS_dispatch_queue)clientRestrictionQueue;
- (OS_dispatch_queue)mailAccountsQueue;
- (OS_dispatch_queue)memberQueue;
- (OS_dispatch_queue)monitorQueue;
- (OS_dispatch_queue)workerQueue;
- (double)memberQueueIdleTimeInterval;
- (id)URLForInstallingProfileInSettingsApp:(id)a3 returningToBundleID:(id)a4;
- (id)_badProvisioningProfileError;
- (id)_carrierIdentifierFromContext:(id)a3;
- (id)_carrierNameFromContext:(id)a3;
- (id)_localProvisioningProfileError;
- (id)bookmarkDictsFromBookmarks:(id)a3;
- (id)bookmarksFromBookmarkDicts:(id)a3;
- (id)cloudConfigurationMachineInfo;
- (id)cloudConfigurationMachineInfoDataWithAdditionalInfo:(id)a3;
- (id)powerAssertionAssertedNotificationToken;
- (id)powerAssertionDeassertedNotificationToken;
- (int)mobileKeybagLockStateChangeNotificationToken;
- (os_unfair_lock_s)checkInLock;
- (unint64_t)workerQueueLastCarrierProfileCheckTime;
- (void)_handleSettingsJumpWithProfileData:(id)a3 targetDeviceType:(unint64_t)a4 bundleID:(id)a5;
- (void)_markPostUserLoginWorkCompleted;
- (void)_sendEffectiveSettingsChangedNotification;
- (void)_sendRestrictionChangedNotification;
- (void)_workerQueueCheckCarrierProfileForCarrierIdentifier:(id)a3 name:(id)a4 atPath:(id)a5 forceReinstallation:(BOOL)a6;
- (void)_workerQueueCheckCarrierProfileOnUnlockSometimes;
- (void)_workerQueueForceCheckOfCarrierProfileOnNextUnlock;
- (void)_workerQueuePrepareForService;
- (void)_workerQueueRemoveAllCarrierProfiles;
- (void)_workerQueueSignIntoFaceTimeWithUsername:(id)a3;
- (void)_workerQueue_setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 senderPID:(int)a9 sender:(id)a10 assertion:(id)a11 completion:(id)a12;
- (void)addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:(id)a3 sender:(id)a4 completion:(id)a5;
- (void)allowedImportFromAppBundleIDs:(id)a3 importingAppBundleID:(id)a4 importingIsManaged:(BOOL)a5 completion:(id)a6;
- (void)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 messageSendingAppBundleID:(id)a4 hostAppBundleID:(id)a5 accountIsManaged:(BOOL)a6 completion:(id)a7;
- (void)allowedOpenInAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingIsManaged:(BOOL)a5 completion:(id)a6;
- (void)applicationsDidInstall:(id)a3;
- (void)applyPairingWatchMDMEnrollmentData:(id)a3 source:(id)a4 completion:(id)a5;
- (void)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 clientType:(id)a6 clientUUID:(id)a7 sender:(id)a8 localizedClientDescription:(id)a9 localizedWarningMessage:(id)a10 completion:(id)a11;
- (void)changePasscode:(id)a3 oldPasscode:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 completion:(id)a7;
- (void)changePasscode:(id)a3 recoveryPasscode:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 completion:(id)a7;
- (void)checkCarrierProfileAndForceReinstallation:(BOOL)a3 completion:(id)a4;
- (void)checkInWithCompletion:(id)a3;
- (void)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 senderBundleID:(id)a5 completion:(id)a6;
- (void)clearRecoveryPasscodeWithSenderBundleID:(id)a3 completion:(id)a4;
- (void)cloudConfigurationMachineInfoDataWithAdditionalInfo:(id)a3 completion:(id)a4;
- (void)cloudConfigurationStoreDetails:(id)a3 completion:(id)a4;
- (void)createActivationLockBypassCodeWithCompletion:(id)a3;
- (void)createMDMUnlockTokenIfNeededWithPasscode:(id)a3 completion:(id)a4;
- (void)debugRescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 repeatingInterval:(id)a6 completion:(id)a7;
- (void)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)effectiveBoolValueForWatchSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6;
- (void)effectiveValueForWatchSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6;
- (void)effectiveValuesForWatchIntersectionSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6;
- (void)effectiveValuesForWatchUnionSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6;
- (void)fetchConfigurationWithCompletionBlock:(id)a3;
- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3;
- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4;
- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3;
- (void)installProfileData:(id)a3 interactionClient:(id)a4 options:(id)a5 source:(id)a6 completion:(id)a7;
- (void)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 completion:(id)a5;
- (void)isPasscodeCompliantWithNamedPolicy:(id)a3 completion:(id)a4;
- (void)loadMailAccountsWithAuditToken:(id *)a3 filteringEnabled:(BOOL)a4 sourceAccountManagement:(int)a5 completion:(id)a6;
- (void)localeChanged;
- (void)managedSystemConfigurationServiceIDsWithCompletion:(id)a3;
- (void)managedWiFiNetworkNamesWithCompletion:(id)a3;
- (void)managingOrganizationInformationWithCompletion:(id)a3;
- (void)markStoredProfileAsInstalledWithCompletion:(id)a3;
- (void)mayShareToAirDropForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5;
- (void)mayShareToMessagesForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5;
- (void)mayShareToWhitelistedSourceUnmanagedTargetAppWithServiceName:(id)a3 originatingAppBundleID:(id)a4 originatingAccountIsManaged:(BOOL)a5 completion:(id)a6;
- (void)migrateCleanupMigratorWithContext:(int)a3 completion:(id)a4;
- (void)migrateWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4 completion:(id)a5;
- (void)monitorEnrollmentStateForClient:(id)a3 personaID:(id)a4;
- (void)notifyBatterySaverModeChanged;
- (void)notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:(id)a3;
- (void)notifyDeviceUnlockedWithCompletion:(id)a3;
- (void)notifyFirstUnlock;
- (void)notifyGracePeriodChanged;
- (void)notifyHaveSeenComplianceMessageWithLastLockDate:(id)a3 completion:(id)a4;
- (void)notifyMementoEffaced;
- (void)notifyProvisioningProfilesChanged;
- (void)notifyStartComplianceTimer:(id)a3 completion:(id)a4;
- (void)notifyUserLoggedIn;
- (void)openSensitiveURL:(id)a3 unlock:(BOOL)a4 completion:(id)a5;
- (void)openSettingsAppForProfileInstallation:(id)a3 bundleID:(id)a4;
- (void)peekProfileDataFromPurgatoryForDeviceType:(unint64_t)a3 withCompletion:(id)a4;
- (void)popProfileDataFromHeadOfInstallationQueueWithCompletion:(id)a3;
- (void)provisiongProfileUUIDsForSignerIdentity:(id)a3 completion:(id)a4;
- (void)queueProfileDataForInstallation:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 completion:(id)a7;
- (void)reapplyAppEnforcedRestrictionsWithAssertion:(id)a3;
- (void)recomputePerClientUserComplianceWithCompletion:(id)a3;
- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3;
- (void)recomputeUserComplianceWarningWithCompletion:(id)a3;
- (void)reducedMachineInfoDataWithCompletion:(id)a3;
- (void)removeBoolSetting:(id)a3 sender:(id)a4 completion:(id)a5;
- (void)removeExpiredProfiles;
- (void)removeExpiredProfilesWithCompletion:(id)a3;
- (void)removeOrphanedClientRestrictionsWithCompletion:(id)a3;
- (void)removePostSetupAutoInstallSetAsideProfileWithCompletion:(id)a3;
- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 source:(id)a5 completion:(id)a6;
- (void)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 sender:(id)a5 completion:(id)a6;
- (void)removeSetAsideCloudConfigurationProfileWithCompletion:(id)a3;
- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5 completion:(id)a6;
- (void)removeValueSetting:(id)a3 sender:(id)a4 completion:(id)a5;
- (void)rereadManagedAppAttributesWithCompletion:(id)a3;
- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 sender:(id)a4 completion:(id)a5;
- (void)resetPasscodeMetadataWithCompletion:(id)a3;
- (void)restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:(id)a3;
- (void)revalidateManagedApps;
- (void)setAllowedURLStrings:(id)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setAppWorkspace:(id)a3;
- (void)setAutoCorrectionAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setCheckInLock:(os_unfair_lock_s)a3;
- (void)setClientRestrictionQueue:(id)a3;
- (void)setConnectionTracker:(id)a3;
- (void)setContinuousPathKeyboardAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setKeyboardShortcutsAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setMailAccountsQueue:(id)a3;
- (void)setMemberQueue:(id)a3;
- (void)setMemberQueueHasActivationRecordChangesPending:(BOOL)a3;
- (void)setMemberQueueHasMigrated:(BOOL)a3;
- (void)setMemberQueueIdleTimeInterval:(double)a3;
- (void)setMobileKeybagLockStateChangeNotificationToken:(int)a3;
- (void)setMonitorQueue:(id)a3;
- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 senderPID:(int)a9 sender:(id)a10 completion:(id)a11;
- (void)setPowerAssertionAssertedNotificationToken:(id)a3;
- (void)setPowerAssertionDeassertedNotificationToken:(id)a3;
- (void)setPredictiveKeyboardAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setSmartPunctuationAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setSpellCheckAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setURLsFromUserBookmarkDictsAsSettings:(id)a3 sender:(id)a4;
- (void)setUserBookmarks:(id)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setUserInfo:(id)a3 forClientUUID:(id)a4 sender:(id)a5 completion:(id)a6;
- (void)setWorkerQueue:(id)a3;
- (void)setWorkerQueueBackgroundActivityManager:(id)a3;
- (void)setWorkerQueueLastCarrierProfileCheckTime:(unint64_t)a3;
- (void)signIntoFaceTimeWithUsername:(id)a3;
- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9;
- (void)start;
- (void)storeActivationRecord:(id)a3 completion:(id)a4;
- (void)storeCertificateData:(id)a3 forIPCUIdentifier:(id)a4 completion:(id)a5;
- (void)storeProfileData:(id)a3 completion:(id)a4;
- (void)storedProfileDataWithCompletion:(id)a3;
- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3;
- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4;
- (void)updateProfileIdentifier:(id)a3 interactionClient:(id)a4 source:(id)a5 completion:(id)a6;
- (void)validateAppBundleIDs:(id)a3 completion:(id)a4;
- (void)verifiedMDMProfileIdentifierWithCompletion:(id)a3;
- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 completion:(id)a4;
- (void)workerQueueCheckForAutoInstallProfiles;
- (void)workerQueueDidRecomputeNagMessageWithResult:(BOOL)a3;
- (void)workerQueueNotifyDeviceUnlocked;
- (void)workerQueueNotifyDeviceUnlockedAndPasscodeRequired;
- (void)workerQueueNotifyMementoEffaced;
- (void)workerQueueNotifyUserLoggedIn;
- (void)workerQueueReadBiometricState;
- (void)workerQueueRecomputeNagMessage;
- (void)workerQueueRemoveExpiredProfiles;
- (void)workerQueueRevalidateManagedApps;
@end

@implementation MCProfileServiceServer

+ (id)sharedServer
{
  if (qword_100105878 != -1) {
    dispatch_once(&qword_100105878, &stru_1000EAC58);
  }
  v2 = (void *)qword_100105870;

  return v2;
}

- (MCProfileServiceServer)init
{
  v23.receiver = self;
  v23.super_class = (Class)MCProfileServiceServer;
  v2 = [(MCProfileServiceServer *)&v23 init];
  v3 = v2;
  if (v2)
  {
    v2->_checkInLock._os_unfair_lock_opaque = 0;
    v2->_memberQueueIdleTimeInterval = 60.0;
    dispatch_queue_t v4 = dispatch_queue_create("MCProfileServiceServer worker queue", 0);
    workerQueue = v3->_workerQueue;
    v3->_workerQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("MCProfileServiceServer monitor queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    monitorQueue = v3->_monitorQueue;
    v3->_monitorQueue = (OS_dispatch_queue *)v6;

    v8 = objc_alloc_init(MCBackgroundActivityManager);
    workerQueueBackgroundActivityManager = v3->_workerQueueBackgroundActivityManager;
    v3->_workerQueueBackgroundActivityManager = v8;

    [(MCBackgroundActivityManager *)v3->_workerQueueBackgroundActivityManager setServer:v3];
    v3->_workerQueueLastCarrierProfileCheckTime = 0;
    dispatch_queue_t v10 = dispatch_queue_create("MCProfileServiceServer member queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    memberQueue = v3->_memberQueue;
    v3->_memberQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("MCProfileServiceServer client restriction queue", 0);
    clientRestrictionQueue = v3->_clientRestrictionQueue;
    v3->_clientRestrictionQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("MCProfileServiceServer mail accounts queue", 0);
    mailAccountsQueue = v3->_mailAccountsQueue;
    v3->_mailAccountsQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = +[LSApplicationWorkspace defaultWorkspace];
    appWorkspace = v3->_appWorkspace;
    v3->_appWorkspace = (LSApplicationWorkspace *)v16;

    v18 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:v3->_workerQueue];
    coreTelephonyClient = v3->_coreTelephonyClient;
    v3->_coreTelephonyClient = v18;

    v20 = (DMCDaemonConnectionTracker *)[objc_alloc((Class)DMCDaemonConnectionTracker) initWithProcessName:@"profiled" connectionThreshold:2 requestThreshold:5];
    connectionTracker = v3->_connectionTracker;
    v3->_connectionTracker = v20;
  }
  return v3;
}

- (void)start
{
  v3 = _MCLogObjects[2];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Profile Service Server starting...", buf, 2u);
  }
  id v4 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-StartServer"];
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000579C;
  block[3] = &unk_1000EAC80;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)workerQueue, block);
  dispatch_queue_t v6 = self->_workerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000583C;
  v8[3] = &unk_1000EAD50;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)v6, v8);
}

- (void)notifyBatterySaverModeChanged
{
  v2 = [(MCProfileServiceServer *)self clientRestrictionQueue];
  dispatch_async(v2, &stru_1000EAD70);
}

- (void)localeChanged
{
  id v3 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-LocaleChanged"];
  [(MCProfileServiceServer *)self reapplyAppEnforcedRestrictionsWithAssertion:v3];
}

- (void)reapplyAppEnforcedRestrictionsWithAssertion:(id)a3
{
  id v4 = a3;
  v5 = [(MCProfileServiceServer *)self clientRestrictionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000060B4;
  block[3] = &unk_1000EAC80;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)_workerQueuePrepareForService
{
  id v3 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-WorkerQueue"];
  id v4 = _MCLogObjects[2];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Performing startup checks.", buf, 2u);
  }
  v5 = [(MCProfileServiceServer *)self memberQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000068A4;
  block[3] = &unk_1000EAC80;
  void block[4] = self;
  dispatch_barrier_async(v5, block);

  id v6 = +[NSFileManager defaultManager];
  id v7 = MCCrashDetectionFilePath();
  unsigned int v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    id v9 = _MCLogObjects[2];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cleaning up after previous crash", buf, 2u);
    }
    dispatch_queue_t v10 = +[MCInstaller sharedInstaller];
    [v10 recomputeProfileRestrictionsWithCompletionBlock:&stru_1000EADB0];

    v11 = +[MCRestrictionManagerWriter sharedManager];
    [v11 removeOrphanedClientRestrictions];

    dispatch_queue_t v12 = +[NSFileManager defaultManager];
    v13 = MCCrashDetectionFilePath();
    [v12 removeItemAtPath:v13 error:0];
  }
  dispatch_queue_t v14 = +[MCPasscodeManager sharedManager];
  unsigned __int8 v15 = [v14 isPasscodeSet];

  if ((v15 & 1) == 0) {
    [(MCProfileServiceServer *)self workerQueueNotifyDeviceUnlocked];
  }
  uint64_t v16 = +[NSFileManager defaultManager];
  v17 = MCOutstandingNagComputationFilePath();
  unsigned int v18 = [v16 fileExistsAtPath:v17];

  if (v18)
  {
    id v19 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-OutstandingNag"];
    workerQueue = self->_workerQueue;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100006960;
    v47[3] = &unk_1000EAD50;
    v47[4] = self;
    id v48 = v19;
    id v21 = v19;
    dispatch_async((dispatch_queue_t)workerQueue, v47);
  }
  v22 = +[NSFileManager defaultManager];
  objc_super v23 = MCSystemRestartLogPath();
  unsigned int v24 = [v22 fileExistsAtPath:v23];

  if (v24)
  {
    v25 = MCSystemRestartLogPath();
    v26 = +[NSString stringWithContentsOfFile:v25 encoding:4 error:0];

    v27 = _MCLogObjects[2];
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_DWORD *)buf = 138543362;
        v51 = v26;
        v29 = "Device restarted due to MDM command at %{public}@";
        v30 = v27;
        uint32_t v31 = 12;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
      }
    }
    else if (v28)
    {
      *(_WORD *)buf = 0;
      v29 = "Device restarted due to MDM command at unknown time.";
      v30 = v27;
      uint32_t v31 = 2;
      goto LABEL_17;
    }
    v32 = +[NSFileManager defaultManager];
    v33 = MCSystemRestartLogPath();
    [v32 removeItemAtPath:v33 error:0];
  }
  v34 = +[NSFileManager defaultManager];
  v35 = MCSystemShutDownLogPath();
  unsigned int v36 = [v34 fileExistsAtPath:v35];

  if (!v36) {
    goto LABEL_27;
  }
  v37 = MCSystemShutDownLogPath();
  v38 = +[NSString stringWithContentsOfFile:v37 encoding:4 error:0];

  v39 = _MCLogObjects[2];
  BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
  if (v38)
  {
    if (v40)
    {
      *(_DWORD *)buf = 138543362;
      v51 = v38;
      v41 = "Device shut down due to MDM command at %{public}@";
      v42 = v39;
      uint32_t v43 = 12;
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
    }
  }
  else if (v40)
  {
    *(_WORD *)buf = 0;
    v41 = "Device shut down due to MDM command at unknown time.";
    v42 = v39;
    uint32_t v43 = 2;
    goto LABEL_25;
  }
  v44 = +[NSFileManager defaultManager];
  v45 = MCSystemShutDownLogPath();
  [v44 removeItemAtPath:v45 error:0];

LABEL_27:
  v46 = _MCLogObjects[2];
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Completed startup checks.", buf, 2u);
  }
}

- (void)workerQueueDidRecomputeNagMessageWithResult:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Finished recomputing nag message. Success: %d", (uint8_t *)v10, 8u);
  }
  if (v3)
  {
    id v6 = +[NSFileManager defaultManager];
    id v7 = MCOutstandingNagComputationFilePath();
    [v6 removeItemAtPath:v7 error:0];
  }
  else
  {
    unsigned int v8 = +[NSData data];
    id v9 = MCOutstandingNagComputationFilePath();
    [v8 writeToFile:v9 atomically:1];

    [(MCBackgroundActivityManager *)self->_workerQueueBackgroundActivityManager scheduleRecomputeNagMetadataJob];
  }
}

- (void)workerQueueRecomputeNagMessage
{
  BOOL v3 = _MCLogObjects[2];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Recomputing passcode requirement message", v6, 2u);
  }
  id v4 = +[MCRestrictionManagerWriter sharedManager];
  id v5 = [v4 recomputeNagMetadata];

  [(MCProfileServiceServer *)self workerQueueDidRecomputeNagMessageWithResult:v5];
}

- (void)workerQueueCheckForAutoInstallProfiles
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFStringRef v3 = (const __CFString *)kMCHasCheckedForAutoInstalledProfiles;
  CFStringRef v4 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(kMCHasCheckedForAutoInstalledProfiles, kMCNotBackedUpPreferencesDomain, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v6 = AppBooleanValue == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = +[MCPasscodeManager sharedManager];
    unsigned int v8 = [v7 isDeviceLocked];

    if (v8)
    {
      id v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Cannot check for auto-install profiles: device is locked. Checking next time the device is unlocked.", buf, 2u);
      }
    }
    else
    {
      CFStringRef v40 = v3;
      CFStringRef v41 = v4;
      v42 = self;
      dispatch_queue_t v10 = +[NSMutableArray array];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v11 = +[NSFileManager defaultManager];
      dispatch_queue_t v12 = [v11 enumeratorAtPath:@"/Library/AutoInstall/Profiles/"];

      id v13 = [v12 countByEnumeratingWithState:&v50 objects:v60 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v51;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v51 != v15) {
              objc_enumerationMutation(v12);
            }
            [v10 addObject:*(void *)(*((void *)&v50 + 1) + 8 * i)];
          }
          id v14 = [v12 countByEnumeratingWithState:&v50 objects:v60 count:16];
        }
        while (v14);
      }

      id v17 = [v10 sortedArrayUsingSelector:"compare:"];
      if ([v10 count])
      {
        os_log_t v18 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          id v19 = v18;
          unsigned int v20 = [v10 count];
          *(_DWORD *)buf = 67109120;
          LODWORD(v58) = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Auto-installing %d profiles.", buf, 8u);
        }
      }
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id obj = v10;
      id v21 = [obj countByEnumeratingWithState:&v46 objects:v59 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v47;
        uint64_t v43 = kMCInstallProfileOptionIsAutoInstalled;
        do
        {
          for (j = 0; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v47 != v23) {
              objc_enumerationMutation(obj);
            }
            v25 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
            v27 = [v25 pathExtension];
            unsigned int v28 = [v27 isEqualToString:@"mobileconfig"];

            if (v28)
            {
              v29 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v58 = v25;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Automatically installing %{public}@", buf, 0xCu);
              }
              v30 = [@"/Library/AutoInstall/Profiles/" stringByAppendingPathComponent:v25];
              uint32_t v31 = +[NSData dataWithContentsOfFile:v30];
              if (v31)
              {
                v32 = +[MCInstaller sharedInstaller];
                uint64_t v55 = v43;
                v56 = &__kCFBooleanTrue;
                v33 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
                id v45 = 0;
                id v34 = [v32 installProfileData:v31 options:v33 interactionClient:0 source:@"MCProfileServiceServer.workerQueueCheckForAutoInstalledProfiles" outError:&v45];
                id v35 = v45;

                if (v35)
                {
                  os_log_t v36 = _MCLogObjects[0];
                  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                  {
                    v37 = v36;
                    v38 = [v35 MCVerboseDescription];
                    *(_DWORD *)buf = 138543362;
                    v58 = v38;
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Installation failed. Error: %{public}@", buf, 0xCu);
                  }
                }
              }
            }
          }
          id v22 = [obj countByEnumeratingWithState:&v46 objects:v59 count:16];
        }
        while (v22);
      }

      CFPreferencesSetAppValue(v40, kCFBooleanTrue, v41);
      CFPreferencesAppSynchronize(v41);

      self = v42;
    }
    v39 = [(MCProfileServiceServer *)self workerQueueBackgroundActivityManager];
    [v39 rescheduleProfileJanitorJob];
  }
}

- (void)_sendRestrictionChangedNotification
{
  v2 = _MCLogObjects[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)CFStringRef v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Sending restriction changed notification.", v4, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, MCRestrictionChangedNotification, 0, 0, 1u);
}

- (void)_sendEffectiveSettingsChangedNotification
{
  v2 = _MCLogObjects[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)CFStringRef v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Sending effective settings changed notification.", v4, 2u);
  }
  +[MCSignpostManager willPostEffectiveSettingsChangedNotification];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, MCEffectiveSettingsChangedNotification, 0, 0, 1u);
}

- (void)checkInWithCompletion:(id)a3
{
  CFStringRef v4 = (void (**)(id, void))a3;
  id v5 = _MCLogObjects[2];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Client waiting to check in...", buf, 2u);
  }
  p_checkInLock = &self->_checkInLock;
  os_unfair_lock_lock(p_checkInLock);
  if (v4) {
    v4[2](v4, 0);
  }
  id v7 = _MCLogObjects[2];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)unsigned int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Client checked in with profiled", v8, 2u);
  }
  os_unfair_lock_unlock(p_checkInLock);
}

- (void)verifiedMDMProfileIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000072F4;
  block[3] = &unk_1000EADD8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)popProfileDataFromHeadOfInstallationQueueWithCompletion:(id)a3
{
  id v4 = a3;
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007420;
  block[3] = &unk_1000EADD8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)peekProfileDataFromPurgatoryForDeviceType:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  workerQueue = self->_workerQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000754C;
  v9[3] = &unk_1000EAE00;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, v9);
}

- (void)queueProfileDataForInstallation:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  workerQueue = self->_workerQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100007704;
  v21[3] = &unk_1000EAE50;
  BOOL v27 = a6;
  v25 = self;
  id v26 = v15;
  id v22 = v14;
  id v23 = v12;
  id v24 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v15;
  id v20 = v14;
  dispatch_async((dispatch_queue_t)workerQueue, v21);
}

- (BOOL)_isValidProvisioningProfileData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (const void *)MISProfileCreateWithData();
    if (v4)
    {
      id v5 = MCGestaltGetDeviceUUID();
      id v6 = +[NSDate date];
      int v7 = MISProvisioningProfileCheckValidity();
      CFRelease(v4);
      LOBYTE(v4) = v7 == 0;
      if (v7)
      {
        id v8 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          v10[0] = 67109120;
          v10[1] = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Profile UI installation path encountered invalid provisioning profile with MIS error: %d", (uint8_t *)v10, 8u);
        }
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

- (void)installProfileData:(id)a3 interactionClient:(id)a4 options:(id)a5 source:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-InstallProfile"];
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007D44;
  block[3] = &unk_1000EAEA0;
  id v26 = v12;
  id v27 = v14;
  id v28 = v13;
  id v29 = v15;
  id v31 = v17;
  id v32 = v16;
  v30 = self;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v13;
  id v23 = v14;
  id v24 = v12;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)updateProfileIdentifier:(id)a3 interactionClient:(id)a4 source:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-UpdateProfileID"];
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008040;
  block[3] = &unk_1000EAEC8;
  id v22 = v10;
  id v23 = v11;
  id v25 = v14;
  id v26 = v13;
  id v24 = v12;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 source:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-RemoveProfile"];
  workerQueue = self->_workerQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000822C;
  v19[3] = &unk_1000EAF18;
  id v20 = v10;
  id v21 = v11;
  id v24 = v12;
  int64_t v25 = a4;
  id v22 = self;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async((dispatch_queue_t)workerQueue, v19);
}

- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-RemoveUninstalledProfile"];
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008470;
  block[3] = &unk_1000EAF40;
  int64_t v21 = a4;
  unint64_t v22 = a5;
  id v19 = v12;
  id v20 = v11;
  id v18 = v10;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 clientType:(id)a6 clientUUID:(id)a7 sender:(id)a8 localizedClientDescription:(id)a9 localizedWarningMessage:(id)a10 completion:(id)a11
{
  BOOL v29 = a4;
  v30 = (void (**)(id, void, BOOL, id))a11;
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  id v23 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-ApplyRestrictions"];
  __int16 v33 = 0;
  unsigned __int8 v32 = 0;
  id v24 = +[MCRestrictionManagerWriter sharedManager];
  id v31 = 0;
  LOBYTE(v27) = 1;
  [v24 setClientRestrictions:v22 overrideRestrictions:v29 appsAndOptions:v21 system:1 clientType:v20 clientUUID:v19 sender:v18 localizedClientDescription:v17 localizedWarning:v16 shouldRecomputeNag:v27 outRestrictionsChanged:(char *)&v33 + 1 outEffectiveSettingsChanged:&v33 outRecomputedNag:&v32 outError:&v31];

  id v25 = v31;
  [(MCProfileServiceServer *)self workerQueueDidRecomputeNagMessageWithResult:v32];
  if (HIBYTE(v33)) {
    [(MCProfileServiceServer *)self _sendRestrictionChangedNotification];
  }
  if ((_BYTE)v33)
  {
    [(MCProfileServiceServer *)self _sendEffectiveSettingsChangedNotification];
    BOOL v26 = (_BYTE)v33 != 0;
  }
  else
  {
    BOOL v26 = 0;
  }
  v30[2](v30, HIBYTE(v33), v26, v25);
}

- (void)removeOrphanedClientRestrictionsWithCompletion:(id)a3
{
  id v4 = a3;
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000087F0;
  block[3] = &unk_1000EADD8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)setUserInfo:(id)a3 forClientUUID:(id)a4 sender:(id)a5 completion:(id)a6
{
  id v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-SetUserInfo"];
  id v13 = +[MCRestrictionManagerWriter sharedManager];
  [v13 setUserInfo:v12 forClientUUID:v11 sender:v10];

  v9[2](v9, 0);
}

- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  int v7 = [(MCProfileServiceServer *)self memberQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008BDC;
  block[3] = &unk_1000EAF68;
  void block[4] = self;
  void block[5] = &v20;
  block[6] = &v16;
  dispatch_sync(v7, block);

  if (a3)
  {
LABEL_13:
    workerQueue = self->_workerQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100008C24;
    v12[3] = &unk_1000EADD8;
    id v13 = v6;
    dispatch_async_and_wait((dispatch_queue_t)workerQueue, v12);

    goto LABEL_14;
  }
  if (!*((unsigned char *)v21 + 24))
  {
    id v9 = _MCLogObjects[2];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Waiting for migration.", buf, 2u);
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (*((unsigned char *)v17 + 24))
  {
LABEL_11:
    id v10 = _MCLogObjects[2];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Waiting for activation record change to be committed.", buf, 2u);
    }
    goto LABEL_13;
  }
  id v8 = _MCLogObjects[2];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Allowing client to proceed.", buf, 2u);
  }
  if (v6) {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
LABEL_14:
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
}

- (BOOL)isOpenInRestrictionInEffect
{
  if ([(MCProfileServiceServer *)self mayOpenFromManagedToUnmanaged]) {
    return ![(MCProfileServiceServer *)self mayOpenFromUnmanagedToManaged];
  }
  else {
    return 1;
  }
}

- (BOOL)mayOpenFromUnmanagedToManaged
{
  v2 = +[MCRestrictionManager sharedManager];
  BOOL v3 = [v2 effectiveRestrictedBoolForSetting:MCFeatureOpenFromUnmanagedToManagedAllowed] != 2;

  return v3;
}

- (BOOL)mayOpenFromManagedToUnmanaged
{
  v2 = +[MCRestrictionManager sharedManager];
  BOOL v3 = [v2 effectiveRestrictedBoolForSetting:MCFeatureOpenFromManagedToUnmanagedAllowed] != 2;

  return v3;
}

- (void)mayShareToWhitelistedSourceUnmanagedTargetAppWithServiceName:(id)a3 originatingAppBundleID:(id)a4 originatingAccountIsManaged:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, BOOL, void))a6;
  id v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138543874;
    id v20 = v10;
    __int16 v21 = 2114;
    id v22 = v11;
    __int16 v23 = 1024;
    BOOL v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Checking if app is allowed to share to %{public}@. App bundle ID: %{public}@, account is managed: %d.", (uint8_t *)&v19, 0x1Cu);
  }
  id v14 = +[MDMManagedMediaReader attributesByAppID];
  id v15 = [v14 allKeys];
  uint64_t v16 = +[NSSet setWithArray:v15];

  if (![(MCProfileServiceServer *)self isOpenInRestrictionInEffect]
    || (MCIsAppExemptFromOpenInSourceRestrictions() & 1) != 0)
  {
    goto LABEL_7;
  }
  if (MCIsAppAccountBasedSourceForOpenIn())
  {
    if (!v7)
    {
LABEL_7:
      BOOL v17 = 1;
      goto LABEL_8;
    }
  }
  else if (([v16 containsObject:v11] & 1) == 0)
  {
    goto LABEL_7;
  }
  BOOL v17 = [(MCProfileServiceServer *)self mayOpenFromManagedToUnmanaged];
LABEL_8:
  uint64_t v18 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    int v19 = 67109120;
    LODWORD(v20) = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Result: %d", (uint8_t *)&v19, 8u);
  }
  v12[2](v12, v17, 0);
}

- (BOOL)shouldApplyFilterForBundleID:(id)a3 sourceAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6
{
  id v10 = a3;
  if (![(MCProfileServiceServer *)self isOpenInRestrictionInEffect]
    || (MCIsAppExemptFromOpenInSourceRestrictions() & 1) != 0)
  {
    goto LABEL_3;
  }
  if (!MCIsAppAccountBasedSourceForOpenIn())
  {
    id v15 = +[MDMManagedMediaReader attributesByAppID];
    uint64_t v16 = [v15 allKeys];
    BOOL v17 = +[NSSet setWithArray:v16];

    LODWORD(v15) = [v17 containsObject:v10];
    if (v15) {
      goto LABEL_11;
    }
LABEL_12:
    BOOL v13 = [(MCProfileServiceServer *)self mayOpenFromUnmanagedToManaged];
    BOOL v11 = 1;
    BOOL v12 = 1;
    goto LABEL_5;
  }
  if (a4 == 1) {
    goto LABEL_12;
  }
  if (a4 == 2)
  {
LABEL_11:
    BOOL v12 = [(MCProfileServiceServer *)self mayOpenFromManagedToUnmanaged];
    BOOL v11 = 1;
    goto LABEL_4;
  }
LABEL_3:
  BOOL v11 = 0;
  BOOL v12 = 1;
LABEL_4:
  BOOL v13 = 1;
LABEL_5:
  *a5 = v13;
  *a6 = v12;

  return v11;
}

- (void)mayShareToMessagesForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5
{
}

- (void)mayShareToAirDropForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5
{
}

- (void)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, void *, void))a5;
  BOOL v7 = +[MCCommunicationServiceRulesUtilities defaultAppBundleIDForCommunicationServiceType:a3 forAccountWithIdentifier:a4];
  if (v8) {
    v8[2](v8, v7, 0);
  }
}

- (void)allowedOpenInAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingIsManaged:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a6;
  v30 = MCContainingBundleIDForBundleID();
  BOOL v11 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    CFStringRef v40 = v30;
    __int16 v41 = 1024;
    BOOL v42 = v7;
    __int16 v43 = 2114;
    id v44 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Checking for app bundle IDs allowed for Open In. Originating Bundle: %{public}@, account is managed: %d. Original list: %{public}@", buf, 0x1Cu);
  }
  BOOL v29 = v10;
  BOOL v12 = MCBundleIDToContainingBundleIDMap();
  BOOL v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v40 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Resolved app extension containers to: %{public}@", buf, 0xCu);
  }
  id v14 = [v12 allValues];
  id v15 = +[MDMManagedMediaReader attributesByAppID];
  uint64_t v16 = [v15 allKeys];
  BOOL v17 = +[MCRestrictionManager allowedOpenInAppBundleIDsWithOriginalAppBundleIDs:v14 managedAppBundleIDs:v16 localAppBundleID:v30 localAccountIsManaged:v7 mayOpenFromUnmanagedToManaged:[(MCProfileServiceServer *)self mayOpenFromUnmanagedToManaged] mayOpenFromManagedToUnmanaged:[(MCProfileServiceServer *)self mayOpenFromManagedToUnmanaged] isAppBundleIDExemptBlock:&stru_1000EAFA8 isAppBundleIDAccountBasedBlock:&stru_1000EAFC8];

  uint64_t v18 = +[NSSet setWithArray:v17];
  int v19 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v20 = v9;
  id v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        BOOL v26 = [v12 objectForKeyedSubscript:v25];
        if ([v18 containsObject:v26]) {
          [v19 addObject:v25];
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v22);
  }

  uint64_t v27 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v40 = v19;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Result: %{public}@", buf, 0xCu);
  }
  if (v29)
  {
    id v28 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009568;
    block[3] = &unk_1000EAEF0;
    id v33 = v29;
    id v32 = v19;
    dispatch_async(v28, block);
  }
}

- (void)allowedImportFromAppBundleIDs:(id)a3 importingAppBundleID:(id)a4 importingIsManaged:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a6;
  v30 = MCContainingBundleIDForBundleID();
  BOOL v11 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    CFStringRef v40 = v30;
    __int16 v41 = 1024;
    BOOL v42 = v7;
    __int16 v43 = 2114;
    id v44 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Checking for app bundle IDs allowed for Import From. Originating Bundle: %{public}@, account is managed: %d. Original list: %{public}@", buf, 0x1Cu);
  }
  BOOL v29 = v10;
  BOOL v12 = MCBundleIDToContainingBundleIDMap();
  BOOL v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v40 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Resolved app extension containers to: %{public}@", buf, 0xCu);
  }
  id v14 = [v12 allValues];
  id v15 = +[MDMManagedMediaReader attributesByAppID];
  uint64_t v16 = [v15 allKeys];
  BOOL v17 = +[MCRestrictionManager allowedImportFromAppBundleIDsWithOriginalAppBundleIDs:v14 managedAppBundleIDs:v16 localAppBundleID:v30 localAccountIsManaged:v7 mayOpenFromUnmanagedToManaged:[(MCProfileServiceServer *)self mayOpenFromUnmanagedToManaged] mayOpenFromManagedToUnmanaged:[(MCProfileServiceServer *)self mayOpenFromManagedToUnmanaged] isAppBundleIDExemptBlock:&stru_1000EAFE8 isAppBundleIDAccountBasedBlock:&stru_1000EB008];

  uint64_t v18 = +[NSSet setWithArray:v17];
  int v19 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v20 = v9;
  id v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        BOOL v26 = [v12 objectForKeyedSubscript:v25];
        if ([v18 containsObject:v26]) {
          [v19 addObject:v25];
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v22);
  }

  uint64_t v27 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v40 = v19;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Result: %{public}@", buf, 0xCu);
  }
  if (v29)
  {
    id v28 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009988;
    block[3] = &unk_1000EAEF0;
    id v33 = v29;
    id v32 = v19;
    dispatch_async(v28, block);
  }
}

- (void)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 messageSendingAppBundleID:(id)a4 hostAppBundleID:(id)a5 accountIsManaged:(BOOL)a6 completion:(id)a7
{
  unint64_t v8 = a6;
  id v11 = a3;
  id v40 = a7;
  id v12 = a4;
  uint64_t v13 = MCContainingBundleIDForBundleID();
  id v14 = MCContainingBundleIDForBundleID();

  id v15 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v50 = v13;
    __int16 v51 = 1024;
    int v52 = v8;
    __int16 v53 = 2114;
    id v54 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Checking for 3rd party keyboards allowed for Bundle ID %{public}@, account is managed: %d. Original list: %{public}@", buf, 0x1Cu);
  }
  id v16 = v14;
  if (MCIsAppBasicallySafari())
  {
    BOOL v17 = +[MCRestrictionManager sharedManager];
    uint64_t v18 = [v17 effectiveUnionValuesForSetting:MCFeatureManagedWebDomains];
    unint64_t v8 = v18 != 0;
  }
  else
  {
    BOOL v17 = +[MCAccountUtilities accountDataclassesForBundleID:v13];
    if (v17)
    {
      unint64_t v8 = (unint64_t)+[MCAccountUtilities hasManagedAccountOfDataclasses:v17];
    }
    else if ((MCIsAppAccountBasedSourceForOpenIn() & 1) == 0)
    {
      int v19 = +[MDMManagedMediaReader attributesByAppID];
      id v20 = [v19 allKeys];
      unint64_t v8 = (unint64_t)[v20 containsObject:v16];
    }
  }
  v38 = v16;
  v39 = (void *)v13;

  id v21 = MCBundleIDToContainingBundleIDMap();
  id v22 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v50 = (uint64_t)v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Resolved keyboard extension containers to: %{public}@", buf, 0xCu);
  }
  uint64_t v23 = [v21 allValues];
  BOOL v24 = +[MDMManagedMediaReader attributesByAppID];
  uint64_t v25 = [v24 allKeys];
  BOOL v26 = +[MCRestrictionManager allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:v23 managedAppBundleIDs:v25 hostAppIsManaged:v8 mayOpenFromUnmanagedToManaged:[(MCProfileServiceServer *)self mayOpenFromUnmanagedToManaged] mayOpenFromManagedToUnmanaged:[(MCProfileServiceServer *)self mayOpenFromManagedToUnmanaged]];

  uint64_t v27 = +[NSSet setWithArray:v26];
  id v28 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v11 count]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v29 = v11;
  id v30 = [v29 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v45;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        long long v35 = [v21 objectForKeyedSubscript:v34];
        if ([v27 containsObject:v35]) {
          [v28 addObject:v34];
        }
      }
      id v31 = [v29 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v31);
  }

  long long v36 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v50 = (uint64_t)v28;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Result: %{public}@", buf, 0xCu);
  }
  if (v40)
  {
    long long v37 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009E6C;
    block[3] = &unk_1000EAEF0;
    id v43 = v40;
    id v42 = v28;
    dispatch_async(v37, block);
  }
}

- (void)loadMailAccountsWithAuditToken:(id *)a3 filteringEnabled:(BOOL)a4 sourceAccountManagement:(int)a5 completion:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = MCBundleIDFromAuditToken();
  if (v10)
  {
    id v11 = +[MailAccount activeAccounts];
    id v12 = +[NSPredicate predicateWithBlock:&stru_1000EB048];
    uint64_t v13 = [v11 filteredArrayUsingPredicate:v12];

    buf[0] = 0;
    v33[0] = 0;
    if (v7
      && [(MCProfileServiceServer *)self shouldApplyFilterForBundleID:v10 sourceAccountManagement:v6 outAllowManagedAccounts:buf outAllowUnmanagedAccounts:v33])
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10000A220;
      v30[3] = &unk_1000EB068;
      uint8_t v31 = buf[0];
      char v32 = v33[0];
      id v14 = +[NSPredicate predicateWithBlock:v30];
      id v15 = [v13 filteredArrayUsingPredicate:v14];
    }
    else
    {
      id v15 = v13;
    }
    id v16 = +[NSMutableArray array];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000A288;
    v28[3] = &unk_1000EB090;
    id v29 = v16;
    id v17 = v16;
    [v15 enumerateObjectsUsingBlock:v28];
    id v18 = [v17 copy];

    int v19 = 0;
  }
  else
  {
    id v20 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Could not retrieve the bundle ID of the calling process for filtered mail sheets.", buf, 2u);
    }
    uint64_t v21 = MCXPCErrorDomain;
    MCErrorArray();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    int v19 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v21, 39001, v15, MCErrorTypeFatal, 0);
    id v18 = 0;
  }

  if (v9)
  {
    id v22 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A2E0;
    block[3] = &unk_1000EB0B8;
    id v26 = v9;
    id v24 = v18;
    id v25 = v19;
    dispatch_async(v22, block);
  }
}

- (void)setAutoCorrectionAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  id v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v14 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-SetAutoCorrectionAllowed"];
  id v11 = +[MCRestrictionManagerWriter sharedManager];
  [v11 setSenderPID:v7];

  id v12 = +[MCRestrictionManagerWriter sharedManager];
  [v12 setBoolValue:v8 forSetting:MCFeatureAutoCorrectionAllowed sender:v10];

  uint64_t v13 = +[MCRestrictionManagerWriter sharedManager];
  [v13 setSenderPID:getpid()];

  v9[2](v9, 0);
}

- (void)setSmartPunctuationAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  id v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v14 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-SetSmartPunctuationAllowed"];
  id v11 = +[MCRestrictionManagerWriter sharedManager];
  [v11 setSenderPID:v7];

  id v12 = +[MCRestrictionManagerWriter sharedManager];
  [v12 setBoolValue:v8 forSetting:MCFeatureSmartPunctuationAllowed sender:v10];

  uint64_t v13 = +[MCRestrictionManagerWriter sharedManager];
  [v13 setSenderPID:getpid()];

  v9[2](v9, 0);
}

- (void)setPredictiveKeyboardAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  id v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v14 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-SetPredictiveKeyboardAllowed"];
  id v11 = +[MCRestrictionManagerWriter sharedManager];
  [v11 setSenderPID:v7];

  id v12 = +[MCRestrictionManagerWriter sharedManager];
  [v12 setBoolValue:v8 forSetting:MCFeaturePredictiveKeyboardAllowed sender:v10];

  uint64_t v13 = +[MCRestrictionManagerWriter sharedManager];
  [v13 setSenderPID:getpid()];

  v9[2](v9, 0);
}

- (void)setContinuousPathKeyboardAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  id v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v14 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-SetContinuousPathKeyboardAllowed"];
  id v11 = +[MCRestrictionManagerWriter sharedManager];
  [v11 setSenderPID:v7];

  id v12 = +[MCRestrictionManagerWriter sharedManager];
  [v12 setBoolValue:v8 forSetting:MCFeatureContinuousPathKeyboardAllowed sender:v10];

  uint64_t v13 = +[MCRestrictionManagerWriter sharedManager];
  [v13 setSenderPID:getpid()];

  v9[2](v9, 0);
}

- (void)setKeyboardShortcutsAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  id v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v14 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-SetKeyboardShortcutsAllowed"];
  id v11 = +[MCRestrictionManagerWriter sharedManager];
  [v11 setSenderPID:v7];

  id v12 = +[MCRestrictionManagerWriter sharedManager];
  [v12 setBoolValue:v8 forSetting:MCFeatureKeyboardShortcutsAllowed sender:v10];

  uint64_t v13 = +[MCRestrictionManagerWriter sharedManager];
  [v13 setSenderPID:getpid()];

  v9[2](v9, 0);
}

- (void)setSpellCheckAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  id v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v14 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-SetSpellCheckAllowed"];
  id v11 = +[MCRestrictionManagerWriter sharedManager];
  [v11 setSenderPID:v7];

  id v12 = +[MCRestrictionManagerWriter sharedManager];
  [v12 setBoolValue:v8 forSetting:MCFeatureSpellCheckAllowed sender:v10];

  uint64_t v13 = +[MCRestrictionManagerWriter sharedManager];
  [v13 setSenderPID:getpid()];

  v9[2](v9, 0);
}

- (void)setAllowedURLStrings:(id)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v11 = a3;
  id v15 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-SetAllowedURLStrings"];
  id v12 = +[MCRestrictionManagerWriter sharedManager];
  [v12 setSenderPID:v7];

  uint64_t v13 = +[MCRestrictionManagerWriter sharedManager];
  [v13 setIntersectionValues:v11 forSetting:MCFeatureWebContentFilterAutoPermittedURLs sender:v10];

  id v14 = +[MCRestrictionManagerWriter sharedManager];
  [v14 setSenderPID:getpid()];

  v9[2](v9, 0);
}

- (void)notifyStartComplianceTimer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-StartComplianceTimer"];
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AB84;
  block[3] = &unk_1000EB0E0;
  id v15 = v8;
  id v16 = v7;
  id v14 = v6;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)notifyHaveSeenComplianceMessageWithLastLockDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-HaveSeenComplianceMessage"];
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1614();
  }
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AE00;
  block[3] = &unk_1000EB0E0;
  id v15 = v8;
  id v16 = v7;
  id v14 = v6;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)recomputeUserComplianceWarningWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-RecomputeUserComplianceWarning"];
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A169C();
  }
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AFA0;
  block[3] = &unk_1000EB0E0;
  id v10 = v5;
  id v11 = v4;
  void block[4] = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)recomputePerClientUserComplianceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-RecomputePerClientUserCompliance"];
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000A1724();
  }
  workerQueue = self->_workerQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B0E4;
  v9[3] = &unk_1000EAEF0;
  id v10 = v5;
  id v11 = v4;
  id v7 = v5;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, v9);
}

- (void)clearRecoveryPasscodeWithSenderBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-clearRecoveryPasscode"];
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B234;
  block[3] = &unk_1000EB0E0;
  id v15 = v8;
  id v16 = v7;
  id v14 = v6;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)changePasscode:(id)a3 oldPasscode:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-ChangePasscode"];
  workerQueue = self->_workerQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000B4C4;
  v23[3] = &unk_1000EB108;
  id v24 = v14;
  id v25 = v13;
  BOOL v29 = a5;
  id v27 = v16;
  id v28 = v15;
  id v26 = v12;
  id v18 = v16;
  id v19 = v15;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  dispatch_async((dispatch_queue_t)workerQueue, v23);
}

- (void)changePasscode:(id)a3 recoveryPasscode:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-ChangePasscodeWithRecovery"];
  workerQueue = self->_workerQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000B818;
  v23[3] = &unk_1000EB108;
  id v24 = v14;
  id v25 = v13;
  BOOL v29 = a5;
  id v27 = v16;
  id v28 = v15;
  id v26 = v12;
  id v18 = v16;
  id v19 = v15;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  dispatch_async((dispatch_queue_t)workerQueue, v23);
}

- (void)createMDMUnlockTokenIfNeededWithPasscode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-CreateMDMUnlockToken"];
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BA38;
  block[3] = &unk_1000EB0E0;
  id v15 = v8;
  id v16 = v7;
  id v14 = v6;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 senderBundleID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-ClearPasscode"];
  workerQueue = self->_workerQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000BC88;
  v21[3] = &unk_1000EB130;
  id v22 = v12;
  id v23 = v10;
  id v24 = v11;
  id v25 = self;
  id v26 = v14;
  id v27 = v13;
  id v16 = v14;
  id v17 = v13;
  id v18 = v11;
  id v19 = v10;
  id v20 = v12;
  dispatch_async((dispatch_queue_t)workerQueue, v21);
}

- (void)isPasscodeCompliantWithNamedPolicy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000BE70;
  v11[3] = &unk_1000EB158;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, v11);
}

- (void)resetPasscodeMetadataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-ResetPasscodeMetadata"];
  workerQueue = self->_workerQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000BFEC;
  v9[3] = &unk_1000EAEF0;
  id v10 = v5;
  id v11 = v4;
  id v7 = v5;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, v9);
}

- (void)managedSystemConfigurationServiceIDsWithCompletion:(id)a3
{
  BOOL v3 = (void (**)(id, id, void))a3;
  id v4 = +[MCVPNPayloadHandlerBase managedServiceIDs];
  v3[2](v3, v4, 0);
}

- (void)managedWiFiNetworkNamesWithCompletion:(id)a3
{
  BOOL v3 = (void (**)(id, id, void))a3;
  id v4 = +[MCNewWiFiPayloadHandler managedWiFiNetworkNames];
  v3[2](v3, v4, 0);
}

- (void)migrateWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-MigrateWithContext"];
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C22C;
  block[3] = &unk_1000EB180;
  int v16 = a3;
  BOOL v17 = a4;
  id v14 = v9;
  id v15 = v8;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)migrateCleanupMigratorWithContext:(int)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-MigrationCleanupWithContext"];
  workerQueue = self->_workerQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000C384;
  v11[3] = &unk_1000EB1A8;
  int v14 = a3;
  id v12 = v7;
  id v13 = v6;
  void v11[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workerQueue, v11);
}

- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3
{
  id v3 = a3;
  id v4 = +[MCInstaller sharedInstaller];
  [v4 recomputeProfileRestrictionsWithCompletionBlock:v3];
}

- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 senderPID:(int)a9 sender:(id)a10 completion:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  id v20 = a10;
  id v21 = a11;
  id v22 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-SetParameterForSettings"];
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C65C;
  block[3] = &unk_1000EB1D0;
  void block[4] = self;
  id v33 = v16;
  BOOL v41 = a5;
  BOOL v42 = a6;
  id v34 = v17;
  id v35 = v18;
  int v40 = a9;
  id v36 = v19;
  id v37 = v20;
  id v38 = v22;
  id v39 = v21;
  id v24 = v21;
  id v25 = v22;
  id v26 = v20;
  id v27 = v19;
  id v28 = v18;
  id v29 = v17;
  id v30 = v16;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)_workerQueue_setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 senderPID:(int)a9 sender:(id)a10 assertion:(id)a11 completion:(id)a12
{
  BOOL v14 = a6;
  BOOL v15 = a5;
  id v24 = (void (**)(id, void))a12;
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  id v21 = a4;
  id v22 = a3;
  id v23 = +[MCRestrictionManagerWriter sharedManager];
  [v23 setSenderPID:a9];
  [v23 setParametersForSettingsByType:v22 configurationUUID:v21 toSystem:v15 user:v14 passcode:v20 credentialSet:v19 sender:v18];

  [v23 setSenderPID:getpid()];
  if (v24) {
    v24[2](v24, 0);
  }
}

- (void)removeBoolSetting:(id)a3 sender:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-RemoveBoolSetting"];
  workerQueue = self->_workerQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000C92C;
  v17[3] = &unk_1000EB1F8;
  id v18 = v8;
  id v19 = v9;
  id v20 = v11;
  id v21 = v10;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async((dispatch_queue_t)workerQueue, v17);
}

- (void)removeValueSetting:(id)a3 sender:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-RemoveValueForSetting"];
  workerQueue = self->_workerQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000CAC4;
  v17[3] = &unk_1000EB1F8;
  id v18 = v8;
  id v19 = v9;
  id v20 = v11;
  id v21 = v10;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async((dispatch_queue_t)workerQueue, v17);
}

- (void)openSensitiveURL:(id)a3 unlock:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CC08;
  block[3] = &unk_1000EB220;
  BOOL v16 = a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)removePostSetupAutoInstallSetAsideProfileWithCompletion:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = +[NSFileManager defaultManager];
  id v5 = MCPostSetupAutoInstallSetAsideProfilePath();
  if ([v4 fileExistsAtPath:v5])
  {
    id v6 = +[NSFileManager defaultManager];
    id v7 = MCPostSetupAutoInstallSetAsideProfilePath();
    id v11 = 0;
    unsigned __int8 v8 = [v6 removeItemAtPath:v7 error:&v11];
    id v9 = v11;

    if ((v8 & 1) == 0)
    {
      id v10 = _MCLogObjects[8];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to remove set aside mdm profile. Error: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {

    id v9 = 0;
  }
  if (v3) {
    v3[2](v3, v9);
  }
}

- (void)removeSetAsideCloudConfigurationProfileWithCompletion:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = +[NSFileManager defaultManager];
  id v5 = MCCloudConfigurationSetAsideDetailsFilePath();
  if ([v4 fileExistsAtPath:v5])
  {
    id v6 = +[NSFileManager defaultManager];
    id v7 = MCCloudConfigurationSetAsideDetailsFilePath();
    id v11 = 0;
    unsigned __int8 v8 = [v6 removeItemAtPath:v7 error:&v11];
    id v9 = v11;

    if ((v8 & 1) == 0)
    {
      id v10 = _MCLogObjects[8];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to remove set aside cloud configuration. Error: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {

    id v9 = 0;
  }
  if (v3) {
    v3[2](v3, v9);
  }
}

- (void)_handleSettingsJumpWithProfileData:(id)a3 targetDeviceType:(unint64_t)a4 bundleID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 1uLL:
    case 4uLL:
      id v10 = &kMCSettingsURLProfilesInstallation;
      goto LABEL_7;
    case 2uLL:
      id v10 = &kMCBridgeURLProfilesInstallation;
      goto LABEL_7;
    case 3uLL:
      id v10 = &kMCHomeURLProfilesInstallation;
LABEL_7:
      [(MCProfileServiceServer *)self openSettingsAppForProfileInstallation:*v10 bundleID:v9];
      break;
    default:
      id v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        int v12 = 134217984;
        unint64_t v13 = a4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Profile Settings Jump is not supported for target device type: %lu", (uint8_t *)&v12, 0xCu);
      }
      break;
  }
}

- (id)URLForInstallingProfileInSettingsApp:(id)a3 returningToBundleID:(id)a4
{
  CFStringRef v4 = @"com.apple.springboard";
  if (a4) {
    CFStringRef v4 = (const __CFString *)a4;
  }
  id v5 = +[NSString stringWithFormat:@"%@&sender=%@", a3, v4];
  id v6 = +[NSURL URLWithString:v5];

  return v6;
}

- (void)openSettingsAppForProfileInstallation:(id)a3 bundleID:(id)a4
{
  CFStringRef v4 = @"com.apple.springboard";
  if (a4) {
    CFStringRef v4 = (const __CFString *)a4;
  }
  id v5 = +[NSMutableString stringWithFormat:@"%@&sender=%@", a3, v4];
  id v6 = [objc_alloc((Class)NSURL) initWithString:v5];
  id v7 = +[LSApplicationWorkspace defaultWorkspace];
  uint64_t v9 = MCSBSApplicationLaunchFromURLOptionUnlockDeviceKey();
  id v10 = &__kCFBooleanTrue;
  id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v7 openSensitiveURL:v6 withOptions:v8];

  notify_post((const char *)[MCProfileWasQueuedNotification UTF8String]);
}

- (void)signIntoFaceTimeWithUsername:(id)a3
{
}

- (void)_workerQueueSignIntoFaceTimeWithUsername:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = _MCLogObjects[2];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning call into AK + AIDA to sign into Facetime on profiled's _workerQueue...", buf, 2u);
  }
  id v13 = 0;
  id v5 = +[MCKeychain stringFromService:kMCCCDEPFastTimeService account:kMCCCDEPFastTimeAccount label:0 description:0 useSystemKeychain:0 outError:&v13];
  id v6 = v13;
  if (v6)
  {
    os_log_t v7 = _MCLogObjects[2];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = v7;
      uint64_t v9 = [v6 description];
      *(_DWORD *)buf = 138543362;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error trying to retrieve credential from Keychain! \n Error:  %{public}@", buf, 0xCu);
    }
  }
  id v10 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  [v10 setUsername:v3];
  [v10 _setPassword:v5];
  [v10 setIsUsernameEditable:0];
  [v10 setServiceType:5];
  [v10 setAppProvidedContext:@"axmft"];
  id v11 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  [v11 authenticateWithContext:v10 completion:&stru_1000EB260];
  int v12 = +[MCCloudConfigurationWriter sharedInstance];
  [v12 faceTimeSignInAttemptDidFinish];
}

- (void)_workerQueueRemoveAllCarrierProfiles
{
  id v3 = _MCLogObjects[2];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Removing all carrier profiles.", buf, 2u);
  }
  CFStringRef v4 = [(MCProfileServiceServer *)self workerQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = +[MCManifest sharedManifest];
  id v6 = [v5 identifiersOfProfilesWithFilterFlags:2];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v13 = +[MCInstaller sharedInstaller];
        [v13 removeProfileWithIdentifier:v12 installationType:1 source:@"Carrier Profile Removal"];
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }
}

+ (id)_descriptionForServiceSubscriptionContext:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    CFStringRef v4 = [v3 uuid];
    [v3 slotID];

    id v5 = +[NSString stringWithFormat:@"[%@, %s]", v4, CTSubscriptionSlotAsString()];
  }
  else
  {
    id v5 = @"<nil>";
  }

  return v5;
}

- (void)_workerQueueCheckCarrierProfileForCarrierIdentifier:(id)a3 name:(id)a4 atPath:(id)a5 forceReinstallation:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (__CFString *)a5;
  id v13 = [(MCProfileServiceServer *)self workerQueue];
  dispatch_assert_queue_V2(v13);

  long long v14 = _MCLogObjects[2];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v15 = @"<nil>";
    if (v12) {
      CFStringRef v15 = v12;
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v58 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: (wq) Evaluating carrier profile at path: %{public}@", buf, 0xCu);
  }
  if (v12)
  {
    id v54 = v11;
    long long v16 = +[MCManifest sharedManifest];
    long long v17 = [v16 identifiersOfProfilesWithFilterFlags:2];
    id v18 = v17;
    if (v17)
    {
      id v19 = [v17 lastObject];
      id v20 = +[MCManifest installedProfileWithIdentifier:v19];
    }
    else
    {
      id v20 = 0;
    }
    id v22 = +[NSFileManager defaultManager];
    unsigned int v23 = [v22 fileExistsAtPath:v12];

    if (!v23)
    {
      id v33 = _MCLogObjects[2];
      id v26 = v20;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: No configuration profile found in carrier bundle.", buf, 2u);
      }
      id v11 = v54;
      if ([v18 count])
      {
        id v34 = _MCLogObjects[2];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Removing carrier configuration profile.", buf, 2u);
        }
        [(MCProfileServiceServer *)self _workerQueueRemoveAllCarrierProfiles];
      }
      goto LABEL_53;
    }
    uint64_t v24 = +[NSData dataWithContentsOfFile:v12];
    id v25 = _MCLogObjects[2];
    id v26 = v20;
    __int16 v53 = (void *)v24;
    if (!v24)
    {
      id v11 = v54;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: Could not load configuration profile from carrier bundle.", buf, 2u);
      }
      goto LABEL_52;
    }
    id v52 = v10;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Installing carrier configuration profile if needed...", buf, 2u);
    }
    id v56 = 0;
    id v27 = +[MCProfile profileWithData:v53 outError:&v56];
    id v28 = v56;
    if (!v28)
    {
      if (!a6 && v20)
      {
        id v29 = [v27 identifier];
        id v30 = [v20 identifier];
        if ([v29 isEqualToString:v30])
        {
          uint64_t v50 = [v27 UUID];
          [v20 UUID];
          uint8_t v31 = v49 = v29;
          unsigned __int8 v48 = [v50 isEqualToString:v31];

          if (v48)
          {
            char v32 = _MCLogObjects[2];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Carrier profile was already installed.", buf, 2u);
            }
            id v28 = 0;
            goto LABEL_49;
          }
        }
        else
        {
        }
      }
      __int16 v51 = v20;
      [(MCProfileServiceServer *)self _workerQueueRemoveAllCarrierProfiles];
      id v35 = [(id)objc_opt_class() _optionsForCarrierProfileInstallationForCarrierIdentifier:v52 name:v54];
      id v36 = +[MCInstaller sharedInstaller];
      id v55 = 0;
      id v37 = [v36 installProfileData:v53 options:v35 interactionClient:0 source:@"MCProfileServiceServer._workerQueueCheckCarrierProfileAtPath" outError:&v55];
      id v28 = v55;

      if (!v28)
      {
        long long v46 = _MCLogObjects[2];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Successfully installed carrier configuration profile.", buf, 2u);
        }

        id v28 = 0;
        id v11 = v54;
        id v26 = v51;
        goto LABEL_50;
      }

      id v26 = v20;
    }

    os_log_t v38 = _MCLogObjects[2];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v39 = v38;
      int v40 = [v28 MCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      CFStringRef v58 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: Error installing carrier profile: %{public}@", buf, 0xCu);
    }
    [(MCProfileServiceServer *)self _workerQueueRemoveAllCarrierProfiles];
    id v27 = [v28 domain];
    uint64_t v41 = MCInstallationErrorDomain;
    if ([v27 isEqual:MCInstallationErrorDomain])
    {
      id v42 = [v28 code];

      if (v42 != (id)4001)
      {
        id v26 = v20;
        id v11 = v54;
LABEL_51:

        id v10 = v52;
LABEL_52:

LABEL_53:
        long long v47 = [(MCProfileServiceServer *)self workerQueueBackgroundActivityManager];
        [v47 rescheduleProfileJanitorJob];

        goto LABEL_54;
      }
      id v43 = [v28 userInfo];
      id v27 = [v43 objectForKeyedSubscript:NSUnderlyingErrorKey];

      if (v27)
      {
        objc_opt_class();
        id v26 = v20;
        if (objc_opt_isKindOfClass())
        {
          long long v44 = [v27 domain];
          id v11 = v54;
          if ([v44 isEqual:v41])
          {
            id v45 = [v27 code];

            if (v45 == (id)4009) {
              [(MCProfileServiceServer *)self _workerQueueForceCheckOfCarrierProfileOnNextUnlock];
            }
          }
          else
          {
          }
          goto LABEL_50;
        }
      }
      else
      {
        id v26 = v20;
      }
    }
LABEL_49:
    id v11 = v54;
LABEL_50:

    goto LABEL_51;
  }
  id v21 = _MCLogObjects[2];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Removing all installed carrier profiles as requested.", buf, 2u);
  }
  [(MCProfileServiceServer *)self _workerQueueRemoveAllCarrierProfiles];
  long long v16 = [(MCProfileServiceServer *)self workerQueueBackgroundActivityManager];
  [v16 rescheduleProfileJanitorJob];
LABEL_54:
}

+ (id)_optionsForCarrierProfileInstallationForCarrierIdentifier:(id)a3 name:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setValue:&off_1000F5128 forKey:kMCInstallProfileOptionFilterFlag];
  if (v5) {
    [v7 setValue:v5 forKey:kMCInstallProfileOptionCarrierIdentifier];
  }
  if (v6) {
    [v7 setValue:v6 forKey:kMCInstallProfileOptionCarrierName];
  }
  id v8 = [v7 copy];

  return v8;
}

- (void)checkCarrierProfileAndForceReinstallation:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = _MCLogObjects[2];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: checkCarrierProfileAndForceReinstallation:completion:", buf, 2u);
  }
  coreTelephonyClient = self->_coreTelephonyClient;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  _DWORD v10[2] = sub_10000E2F8;
  v10[3] = &unk_1000EB340;
  BOOL v12 = a3;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(CoreTelephonyClient *)coreTelephonyClient getPreferredDataSubscriptionContext:v10];
}

- (id)_carrierIdentifierFromContext:(id)a3
{
  return [a3 labelID];
}

- (id)_carrierNameFromContext:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)CTBundle) initWithBundleType:1];
  coreTelephonyClient = self->_coreTelephonyClient;
  id v15 = 0;
  id v7 = [(CoreTelephonyClient *)coreTelephonyClient copyCarrierBundleValue:v4 key:@"CarrierName" bundleType:v5 error:&v15];

  id v8 = v15;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
      goto LABEL_9;
    }
    id v13 = _MCLogObjects[2];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: Returned carrier name is not a string.", buf, 2u);
    }
  }
  else
  {
    os_log_t v10 = _MCLogObjects[2];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = v10;
      BOOL v12 = [v8 MCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      long long v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "CheckCarrierProfile: Could not get carrier name: %{public}@", buf, 0xCu);
    }
  }
  id v9 = 0;
LABEL_9:

  return v9;
}

- (void)_workerQueueForceCheckOfCarrierProfileOnNextUnlock
{
  id v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Forcing check of carrier profile on next unlock.", v5, 2u);
  }
  id v4 = [(MCProfileServiceServer *)self workerQueue];
  dispatch_assert_queue_V2(v4);

  [(MCProfileServiceServer *)self setWorkerQueueLastCarrierProfileCheckTime:0];
}

- (void)_workerQueueCheckCarrierProfileOnUnlockSometimes
{
  id v4 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Device was unlocked, determining if we should check.", buf, 2u);
  }
  id v5 = [(MCProfileServiceServer *)self workerQueue];
  dispatch_assert_queue_V2(v5);

  long long v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  long long v16 = sub_10000F04C;
  long long v17 = &unk_1000EB368;
  id v18 = self;
  SEL v19 = a2;
  if (qword_100105898 != -1) {
    dispatch_once(&qword_100105898, &v14);
  }
  uint64_t v6 = mach_continuous_time();
  if (![(MCProfileServiceServer *)self workerQueueLastCarrierProfileCheckTime])
  {
    BOOL v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Device was unlocked, never checked before, will check.", buf, 2u);
    }
    goto LABEL_17;
  }
  unint64_t v7 = [(MCProfileServiceServer *)self workerQueueLastCarrierProfileCheckTime];
  if (byte_100105890) {
    unint64_t v8 = 86400;
  }
  else {
    unint64_t v8 = 0;
  }
  id v9 = _MCLogObjects[0];
  unint64_t v10 = (v6 - v7) * dword_100105880 / qword_100105888;
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"will not";
    if (v10 > v8) {
      CFStringRef v11 = @"will";
    }
    *(_DWORD *)buf = 134218242;
    unint64_t v21 = v10;
    __int16 v22 = 2112;
    CFStringRef v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Device was unlocked, %qu seconds since last check, %@ check", buf, 0x16u);
  }
  if (v10 > v8)
  {
LABEL_17:
    id v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CheckCarrierProfile: Device was unlocked, checking carrier profile.", buf, 2u);
    }
    [(MCProfileServiceServer *)self setWorkerQueueLastCarrierProfileCheckTime:v6];
    [(MCProfileServiceServer *)self checkCarrierProfileAndForceReinstallation:0 completion:&stru_1000EB388];
  }
}

- (void)workerQueueReadBiometricState
{
  id v7 = 0;
  sub_10005414C(&v7, 0);
  id v2 = v7;
  if (v2)
  {
    id v3 = +[MCRestrictionManagerWriter sharedManager];
    id v4 = [v2 BOOLValue];
    [v3 setBoolValue:v4 forSetting:MCFeatureFingerprintUnlockAllowed sender:@"MCProfileServiceServer.workerQueueReadBiometricState"];
  }
  else
  {
    id v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Fingerprint unlock state is not available yet. Ignoring.", v6, 2u);
    }
  }
}

- (void)workerQueueNotifyDeviceUnlocked
{
}

- (void)workerQueueNotifyDeviceUnlockedAndPasscodeRequired
{
  [(MCProfileServiceServer *)self workerQueueRecomputeNagMessage];

  [(MCProfileServiceServer *)self workerQueueCheckForAutoInstallProfiles];
}

- (void)notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:", buf, 2u);
  }
  workerQueue = self->_workerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F338;
  v8[3] = &unk_1000EB158;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, v8);
}

- (void)notifyDeviceUnlockedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "notifyDeviceUnlockedWithCompletion:", buf, 2u);
  }
  workerQueue = self->_workerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F478;
  v8[3] = &unk_1000EB158;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, v8);
}

- (void)notifyFirstUnlock
{
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F544;
  block[3] = &unk_1000EAC80;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)notifyGracePeriodChanged
{
}

- (void)notifyProvisioningProfilesChanged
{
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F654;
  block[3] = &unk_1000EAC80;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (BOOL)_hasCompletedPostLoginWork
{
  id v2 = sem_open("profiled.firstboot_check", 0);
  id v3 = v2;
  if (v2 != (sem_t *)-1) {
    sem_close(v2);
  }
  return v3 != (sem_t *)-1;
}

- (void)_markPostUserLoginWorkCompleted
{
  id v2 = sem_open("profiled.firstboot_check", 512, 256, 0);
  if (v2 == (sem_t *)-1)
  {
    os_log_t v3 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = __error();
      uint64_t v6 = strerror(*v5);
      *(_DWORD *)buf = 136446466;
      unint64_t v8 = "profiled.firstboot_check";
      __int16 v9 = 2082;
      unint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to create semaphore %{public}s: %{public}s", buf, 0x16u);
    }
  }
  else
  {
    sem_close(v2);
  }
}

- (void)notifyUserLoggedIn
{
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F95C;
  block[3] = &unk_1000EAC80;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)workerQueueNotifyUserLoggedIn
{
  if (+[DMCMultiUserModeUtilities isSharediPad]
    && ![(MCProfileServiceServer *)self _hasCompletedPostLoginWork])
  {
    os_log_t v3 = +[MCInstaller sharedInstaller];
    id v4 = [v3 verifiedMDMProfileIdentifierWithCleanUp];

    id v5 = +[MDMClient sharedClient];
    [v5 scheduleTokenUpdateIfNecessary];

    uint64_t v6 = +[MDMUserClient sharedClient];
    [v6 scheduleTokenUpdate];

    id v7 = +[MDMUserClient sharedClient];
    [v7 simulatePush];

    [(MCProfileServiceServer *)self _markPostUserLoginWorkCompleted];
  }
  id v8 = [(MCProfileServiceServer *)self workerQueueBackgroundActivityManager];
  [v8 rescheduleProfileJanitorJob];
}

- (void)notifyMementoEffaced
{
  os_log_t v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received memento effaced notification. Clearing related opaque data.", buf, 2u);
  }
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FB14;
  block[3] = &unk_1000EAC80;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)workerQueueNotifyMementoEffaced
{
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FBBC;
  block[3] = &unk_1000EAC80;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)storeCertificateData:(id)a3 forIPCUIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-StoreCertificate"];
  workerQueue = self->_workerQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000FECC;
  v17[3] = &unk_1000EB1F8;
  id v18 = v8;
  id v19 = v9;
  id v20 = v11;
  id v21 = v10;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async((dispatch_queue_t)workerQueue, v17);
}

- (id)_badProvisioningProfileError
{
  uint64_t v2 = MCProvisioningProfileErrorDomain;
  os_log_t v3 = MCErrorArray();
  id v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 25000, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (id)_localProvisioningProfileError
{
  uint64_t v2 = MCProvisioningProfileErrorDomain;
  os_log_t v3 = MCErrorArray();
  id v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 25004, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (void)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-InstallProvisioningProfile"];
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000101FC;
  block[3] = &unk_1000EAEC8;
  id v18 = v8;
  id v19 = self;
  id v21 = v11;
  id v22 = v10;
  id v20 = v9;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 sender:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-RemoveProvisioningProfile"];
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000105E4;
  block[3] = &unk_1000EAEC8;
  id v22 = v10;
  id v23 = v12;
  id v25 = v14;
  id v26 = v13;
  id v24 = v11;
  id v16 = v14;
  id v17 = v13;
  id v18 = v11;
  id v19 = v12;
  id v20 = v10;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:(id)a3 sender:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-AddTrustedProvisioningProfile"];
  workerQueue = self->_workerQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001090C;
  v17[3] = &unk_1000EAE78;
  id v18 = v11;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  id v16 = v10;
  dispatch_async((dispatch_queue_t)workerQueue, v17);
}

- (void)provisiongProfileUUIDsForSignerIdentity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = +[MDMProvisioningProfileTrust provisioningProfileUUIDsForSignerIdentity:a3];
  (*((void (**)(id, id, void))a4 + 2))(v6, v7, 0);
}

- (BOOL)isBundleBlocked:(id)a3 outHash:(id *)a4 outHashType:(id *)a5
{
  if (!a3) {
    return 0;
  }
  char v6 = MISQueryBlacklistForBundle();
  if (a5)
  {
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)workerQueueRemoveExpiredProfiles
{
  id v4 = objc_alloc_init(MCProfileJanitor);
  [(MCProfileJanitor *)v4 removeExpiredProfiles];
  os_log_t v3 = [(MCProfileServiceServer *)self workerQueueBackgroundActivityManager];
  [v3 rescheduleProfileJanitorJob];
}

- (void)removeExpiredProfiles
{
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011110;
  block[3] = &unk_1000EAC80;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)workerQueueRevalidateManagedApps
{
  os_log_t v3 = +[MCProvisioningProfileJanitor sharedJanitor];
  [v3 updateMISTrust];

  id v4 = [(MCProfileServiceServer *)self workerQueueBackgroundActivityManager];
  [v4 rescheduleManagedAppValidationJob];
}

- (void)revalidateManagedApps
{
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000111F8;
  block[3] = &unk_1000EAC80;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)removeExpiredProfilesWithCompletion:(id)a3
{
  id v4 = a3;
  [(MCProfileServiceServer *)self removeExpiredProfiles];
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000112B8;
    block[3] = &unk_1000EADD8;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

- (void)storeProfileData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = _MCLogObjects[2];
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Forgetting post-setup profile.", buf, 2u);
    }
    id v14 = +[NSFileManager defaultManager];
    id v15 = MCPostSetupAutoInstallProfilePath();
    [v14 removeItemAtPath:v15 error:0];

    id v16 = +[NSFileManager defaultManager];
    id v17 = MCPostSetupAutoInstallSetAsideProfilePath();
    [v16 removeItemAtPath:v17 error:0];

    id v11 = 0;
    if (v7) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Remembering post-setup profile.", buf, 2u);
  }
  id v10 = MCPostSetupAutoInstallProfilePath();
  id v25 = 0;
  [v6 writeToFile:v10 options:0 error:&v25];
  id v11 = v25;

  if (v11)
  {
    id v12 = _MCLogObjects[2];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138543362;
    id v27 = v11;
    id v13 = "Failed to store profile data with error: %{public}@";
    goto LABEL_14;
  }
  id v18 = MCPostSetupAutoInstallSetAsideProfilePath();
  id v24 = 0;
  [v6 writeToFile:v18 options:0 error:&v24];
  id v11 = v24;

  if (!v11)
  {
    id v19 = MCPostSetupAutoInstallSetAsideProfilePath();
    MCSetSkipBackupAttributeToItemAtPath();

    id v20 = +[MDMCloudConfiguration sharedConfiguration];
    id v21 = [v20 details];
    id v22 = [v21 mutableCopy];

    id v23 = 0;
    [(MCProfileServiceServer *)self storeCloudConfigurationDetails:v22 outError:&v23];
    id v11 = v23;

    if (!v7) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  id v12 = _MCLogObjects[2];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v27 = v11;
    id v13 = "Failed to store set aside profile data with error: %{public}@";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
  }
LABEL_15:
  if (v7) {
LABEL_16:
  }
    v7[2](v7, v11);
LABEL_17:
}

- (void)storedProfileDataWithCompletion:(id)a3
{
  id v8 = (void (**)(id, void *, void))a3;
  os_log_t v3 = +[NSFileManager defaultManager];
  id v4 = MCPostSetupAutoInstallProfilePath();
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = MCPostSetupAutoInstallProfilePath();
    id v7 = +[NSData dataWithContentsOfFile:v6];
  }
  else
  {
    id v7 = 0;
  }
  v8[2](v8, v7, 0);
}

- (void)markStoredProfileAsInstalledWithCompletion:(id)a3
{
  id v6 = (void (**)(id, void))a3;
  os_log_t v3 = MCCloudConfigurationDetailsFilePath();
  id v4 = +[NSMutableDictionary dictionaryWithContentsOfFile:v3];

  if (v4)
  {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCPostSetupProfileWasInstalledKey];
    unsigned int v5 = MCCloudConfigurationDetailsFilePath();
    [v4 MCWriteToBinaryFile:v5];

    MCSendCloudConfigurationDetailsChangedNotification();
  }
  v6[2](v6, 0);
}

- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 sender:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-ResetSettingsToDefault"];
  workerQueue = self->_workerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001184C;
  v15[3] = &unk_1000EB468;
  BOOL v19 = a3;
  id v17 = v10;
  id v18 = v9;
  id v16 = v8;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)workerQueue, v15);
}

- (void)rereadManagedAppAttributesWithCompletion:(id)a3
{
  id v4 = a3;
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011988;
  block[3] = &unk_1000EADD8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)fetchConfigurationWithCompletionBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t, void, void))a3 + 2))(a3, 1, 0, 0);
  }
}

- (void)reducedMachineInfoDataWithCompletion:(id)a3
{
  CFStringRef v6 = @"PRODUCT";
  CFStringRef v7 = @"VERSION";
  CFStringRef v8 = @"LANGUAGE";
  CFStringRef v9 = @"OS_VERSION";
  CFStringRef v10 = @"SUPPLEMENTAL_BUILD_VERSION";
  CFStringRef v11 = @"SUPPLEMENTAL_OS_VERSION_EXTRA";
  CFStringRef v12 = @"SOFTWARE_UPDATE_DEVICE_ID";
  os_log_t v3 = (void (**)(id, void *, void))a3;
  id v4 = +[NSArray arrayWithObjects:&v6 count:7];
  unsigned int v5 = +[MCMachineInfo machineInfoWithKeys:outError:](MCMachineInfo, "machineInfoWithKeys:outError:", v4, 0, v6, v7, v8, v9, v10, v11, v12);
  v3[2](v3, v5, 0);
}

- (id)cloudConfigurationMachineInfo
{
  return [(MCProfileServiceServer *)self cloudConfigurationMachineInfoDataWithAdditionalInfo:&__NSDictionary0__struct];
}

- (id)cloudConfigurationMachineInfoDataWithAdditionalInfo:(id)a3
{
  CFStringRef v7 = @"UDID";
  CFStringRef v8 = @"SERIAL";
  CFStringRef v9 = @"PRODUCT";
  CFStringRef v10 = @"VERSION";
  CFStringRef v11 = @"IMEI";
  CFStringRef v12 = @"MEID";
  CFStringRef v13 = @"LANGUAGE";
  CFStringRef v14 = @"OS_VERSION";
  CFStringRef v15 = @"SUPPLEMENTAL_BUILD_VERSION";
  CFStringRef v16 = @"SUPPLEMENTAL_OS_VERSION_EXTRA";
  CFStringRef v17 = @"SOFTWARE_UPDATE_DEVICE_ID";
  id v3 = a3;
  id v4 = +[NSArray arrayWithObjects:&v7 count:11];
  unsigned int v5 = +[MCMachineInfo machineInfoWithKeys:challenge:identity:additionalInfo:outError:](MCMachineInfo, "machineInfoWithKeys:challenge:identity:additionalInfo:outError:", v4, 0, 0, v3, 0, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17);

  return v5;
}

- (void)cloudConfigurationMachineInfoDataWithAdditionalInfo:(id)a3 completion:(id)a4
{
  CFStringRef v6 = (void (**)(id, id, void))a4;
  id v7 = [(MCProfileServiceServer *)self cloudConfigurationMachineInfoDataWithAdditionalInfo:a3];
  v6[2](v6, v7, 0);
}

- (BOOL)storeCloudConfigurationDetails:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  CFStringRef v6 = +[MCCloudConfigurationWriter sharedInstance];
  LOBYTE(a4) = [v6 saveCloudConfigurationDetails:v5 outError:a4];

  return (char)a4;
}

- (void)cloudConfigurationStoreDetails:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-CloudConfigStoreDetails"];
  id v18 = 0;
  [(MCProfileServiceServer *)self storeCloudConfigurationDetails:v7 outError:&v18];

  id v9 = v18;
  CFStringRef v10 = dispatch_get_global_queue(0, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100011EF0;
  v14[3] = &unk_1000EB0B8;
  id v16 = v8;
  id v17 = v6;
  id v15 = v9;
  id v11 = v8;
  id v12 = v9;
  id v13 = v6;
  dispatch_async(v10, v14);
}

- (void)restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = _MCLogObjects[2];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Restoring cloud config & mdm profile from set aside data...", buf, 2u);
  }
  id v5 = +[NSFileManager defaultManager];
  id v6 = MDMCloudConfigurationSetAsideDetailsFilePath();
  if (([v5 fileExistsAtPath:v6] & 1) == 0)
  {

    goto LABEL_11;
  }
  id v7 = MDMCloudConfigurationDetailsFilePath();
  unsigned __int8 v8 = [v5 fileExistsAtPath:v7];

  if (v8)
  {
LABEL_11:
    int v14 = 0;
    goto LABEL_12;
  }
  id v9 = _MCLogObjects[2];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Restoring set aside cloud config...", buf, 2u);
  }
  CFStringRef v10 = MDMCloudConfigurationSetAsideDetailsFilePath();
  id v11 = MDMCloudConfigurationDetailsFilePath();
  DMCSafelyCopyItemAtPathToDestinationPathFM();
  id v12 = 0;

  if (!v12)
  {
    int v14 = 1;
LABEL_12:
    id v15 = MDMPostSetupAutoInstallSetAsideProfilePath();
    if ([v5 fileExistsAtPath:v15])
    {
      id v16 = MDMPostSetupAutoInstallProfilePath();
      unsigned __int8 v17 = [v5 fileExistsAtPath:v16];

      if (v17)
      {
        id v12 = 0;
        if (!v14) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
      id v18 = _MCLogObjects[2];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Restoring set aside mdm profile...", buf, 2u);
      }
      BOOL v19 = MDMPostSetupAutoInstallSetAsideProfilePath();
      id v20 = MDMPostSetupAutoInstallProfilePath();
      DMCSafelyCopyItemAtPathToDestinationPathFM();
      id v12 = 0;

      if (!v12) {
        goto LABEL_24;
      }
      id v21 = _MCLogObjects[2];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to restore set aside mdm profile", buf, 2u);
      }
    }
    else
    {

      id v12 = 0;
    }
    if ((v14 & 1) == 0) {
      goto LABEL_25;
    }
LABEL_24:
    MCSendCloudConfigurationDetailsChangedNotification();
    goto LABEL_25;
  }
  id v13 = _MCLogObjects[2];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to restore set aside cloud config", buf, 2u);
  }
LABEL_25:
  if (v3) {
    v3[2](v3, v12);
  }
}

- (void)createActivationLockBypassCodeWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *, id))a3;
  id v4 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-CreateActivationLockBypass"];
  id v5 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned int v6 = [v5 isSupervised];

  if (v6) {
    id v7 = +[MCCrypto createAndStoreNewActivationLockBypassCodeAndHashIfNeeded];
  }
  id v10 = 0;
  unsigned __int8 v8 = +[MCCrypto storedActivationLockBypassCodeWithOutError:&v10];
  id v9 = v10;
  if (v3) {
    v3[2](v3, v8, v9);
  }
}

- (void)storeActivationRecord:(id)a3 completion:(id)a4
{
  unsigned int v6 = (void (**)(id, void))a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-StoreActivationRecord"];
  id v9 = [v7 objectForKeyedSubscript:kDMCActivationRecordDeviceFlagsKey];

  id v10 = +[DMCFeatureOverrides activationRecordFlagsWithFlags:v9];

  if (v10)
  {
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v11 = [v10 intValue];
      id v12 = (CFPropertyListRef *)&kCFBooleanTrue;
      if ((v11 & 1) == 0) {
        id v12 = (CFPropertyListRef *)&kCFBooleanFalse;
      }
      CFStringRef v13 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
      CFPreferencesSetAppValue(kMCPreferencesLockdownActivationIndicatesCloudConfigurationAvailableKey, *v12, kMCNotBackedUpPreferencesDomain);
      CFPreferencesSetAppValue(kMCPreferencesLockdownCloudConfigurationAvailableKey, 0, v13);
      int v14 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Wait for preferences to flush its caches", buf, 2u);
      }
      _CFPreferencesFlushCachesForIdentifier();
      id v15 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Saved activation configuration.", buf, 2u);
      }
      id v16 = [(MCProfileServiceServer *)self memberQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000126C8;
      block[3] = &unk_1000EAC80;
      void block[4] = self;
      dispatch_barrier_async(v16, block);

      workerQueue = self->_workerQueue;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000126D4;
      v23[3] = &unk_1000EAD50;
      void v23[4] = self;
      id v24 = v8;
      dispatch_async((dispatch_queue_t)workerQueue, v23);

      goto LABEL_16;
    }
    id v18 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "The activation record configuration flags entry is invalid.", buf, 2u);
    }
  }
  CFStringRef v19 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  CFStringRef v20 = (const __CFString *)kMCPreferencesMobileUserName;
  CFPreferencesSetValue(kMCPreferencesLockdownActivationIndicatesCloudConfigurationAvailableKey, kCFBooleanFalse, kMCNotBackedUpPreferencesDomain, kMCPreferencesMobileUserName, kCFPreferencesCurrentHost);
  CFPreferencesSetValue(kMCPreferencesLockdownCloudConfigurationAvailableKey, kCFBooleanFalse, v19, v20, kCFPreferencesCurrentHost);
  id v21 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Wait for preferences to flush its caches", buf, 2u);
  }
  _CFPreferencesFlushCachesForIdentifier();
  id v22 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No activation configuration was received.", buf, 2u);
  }
LABEL_16:
  MCSendActivationRecordStoredNotification();
  v6[2](v6, 0);
}

- (void)setURLsFromUserBookmarkDictsAsSettings:(id)a3 sender:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableDictionary dictionary];
  id v8 = +[NSMutableDictionary dictionary];
  [v7 setObject:v8 forKeyedSubscript:MCIntersectionKey];
  id v9 = +[NSMutableDictionary dictionary];
  [v8 setObject:v9 forKeyedSubscript:MCFeatureWebContentFilterWhitelistedURLs];
  if (v5)
  {
    id v20 = v6;
    id v10 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v5 count]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v5;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      uint64_t v15 = kMCWCFAddressKey;
      do
      {
        id v16 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          unsigned __int8 v17 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v16) objectForKeyedSubscript:v15];
          if (v17) {
            [v10 addObject:v17];
          }

          id v16 = (char *)v16 + 1;
        }
        while (v13 != v16);
        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    id v18 = [v10 allObjects];
    [v9 setObject:v18 forKeyedSubscript:MCSettingParameterValuesKey];

    id v6 = v20;
    id v5 = v21;
  }
  CFStringRef v19 = +[MCRestrictionManagerWriter sharedManager];
  [v19 setParametersForSettingsByType:v7 sender:v6];
}

- (id)bookmarksFromBookmarkDicts:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v12 = objc_alloc((Class)MCBookmark);
          id v13 = [v12 initWithSerializableDictionary:v11, v15];
          if (v13) {
            [v5 addObject:v13];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)bookmarkDictsFromBookmarks:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) serializableDictionary:v13];
          if (v11) {
            [v5 addObject:v11];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)setUserBookmarks:(id)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = (void (**)(id, void))a6;
  id v11 = a5;
  id v12 = a3;
  id v17 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-SetUserBookmarks"];
  long long v13 = [(MCProfileServiceServer *)self bookmarksFromBookmarkDicts:v12];
  long long v14 = +[MCBookmarkManager sharedManager];
  [v14 setUserBookmarks:v13];

  long long v15 = +[MCRestrictionManagerWriter sharedManager];
  [v15 setSenderPID:v7];

  [(MCProfileServiceServer *)self setURLsFromUserBookmarkDictsAsSettings:v12 sender:v11];
  long long v16 = +[MCRestrictionManagerWriter sharedManager];
  [v16 setSenderPID:getpid()];

  v10[2](v10, 0);
}

- (void)validateAppBundleIDs:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[MCProvisioningProfileJanitor sharedJanitor];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100012E88;
  v9[3] = &unk_1000EB490;
  id v10 = v5;
  id v8 = v5;
  [v7 updateMISTrustAndValidateApps:v6 validateManagedApps:1 completion:v9];
}

- (void)monitorEnrollmentStateForClient:(id)a3 personaID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  monitorQueue = self->_monitorQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012F60;
  v11[3] = &unk_1000EAD50;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)monitorQueue, v11);
}

- (void)managingOrganizationInformationWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v4 = +[MDMConfiguration sharedConfiguration];
  [v4 refreshDetailsFromDisk];
  id v5 = [v4 memberQueueOrganizationInfo];
  if (v5) {
    goto LABEL_2;
  }
  id v6 = +[MDMCloudConfiguration sharedConfiguration];
  id v7 = [v6 details];

  uint64_t v8 = kCCOrganizationNameKey;
  id v9 = [v7 objectForKeyedSubscript:kCCOrganizationNameKey];

  if (v9)
  {
    id v5 = +[NSMutableDictionary dictionary];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v27 = v8;
    v36[0] = v8;
    v36[1] = kCCOrganizationShortNameKey;
    v36[2] = kCCOrganizationDepartmentKey;
    v36[3] = kCCOrganizationAddressKey;
    v36[4] = kCCOrganizationAddressLine1Key;
    v36[5] = kCCOrganizationAddressLine2Key;
    v36[6] = kCCOrganizationAddressLine3Key;
    v36[7] = kCCOrganizationCityKey;
    v36[8] = kCCOrganizationRegionKey;
    v36[9] = kCCOrganizationZipCodeKey;
    v36[10] = kCCOrganizationCountryKey;
    v36[11] = kCCOrganizationPhoneKey;
    v36[12] = kCCOrganizationEmailKey;
    v36[13] = kCCOrganizationSupportPhoneKey;
    v36[14] = kCCOrganizationSupportEmailKey;
    id v10 = +[NSArray arrayWithObjects:v36 count:15];
    id v11 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          long long v16 = [v7 objectForKeyedSubscript:v15];

          if (v16)
          {
            id v17 = [v7 objectForKeyedSubscript:v15];
            [v5 setObject:v17 forKeyedSubscript:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v12);
    }

    uint64_t v8 = v27;
    if (v5) {
      goto LABEL_2;
    }
  }
  else
  {
  }
  long long v18 = +[MCManifest sharedManifest];
  CFStringRef v19 = [v4 memberQueueManagingProfileIdentifier];
  id v20 = [v18 installedProfileWithIdentifier:v19];

  id v21 = [v20 organization];

  if (v21)
  {
    uint64_t v34 = v8;
    long long v22 = [v20 organization];
    id v35 = v22;
    id v5 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];

    if (v5) {
      goto LABEL_2;
    }
  }
  else
  {
  }
  long long v23 = [v4 memberQueueServerURL];
  long long v24 = [v23 host];

  if (v24)
  {
    uint64_t v32 = v8;
    long long v25 = [v4 memberQueueServerURL];
    id v26 = [v25 host];
    id v33 = v26;
    id v5 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  }
  else
  {
    id v5 = 0;
  }
LABEL_2:
  v3[2](v3, v5, 0);
}

- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9
{
  BOOL v11 = a6;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = (id)objc_opt_new();
  [v21 stageMDMEnrollmentInfoForPairingWatchWithProfileData:v20 orServiceURL:v19 anchorCertificates:v18 supervised:v11 declarationKeys:v17 declarationConfiguration:v16 completion:v15];
}

- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_opt_new();
  [v4 unstageMDMEnrollmentInfoForPairingWatchWithCompletion:v3];
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_opt_new();
  [v4 fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:v3];
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_opt_new();
  [v7 fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:v6 completion:v5];
}

- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_opt_new();
  [v4 fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:v3];
}

- (void)applyPairingWatchMDMEnrollmentData:(id)a3 source:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v13 = (id)objc_opt_new();
  BOOL v11 = +[MDMCloudConfiguration sharedConfiguration];
  id v12 = +[MCCloudConfigurationWriter sharedInstance];
  [v13 applyPairingWatchMDMEnrollmentData:v10 source:v9 usingProfileInstaller:self cloudConfigReader:v11 cloudConfigWriter:v12 completion:v8];
}

- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_opt_new();
  [v7 updateMDMEnrollmentInfoForPairingWatch:v6 completion:v5];
}

- (void)effectiveBoolValueForWatchSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  id v16 = (void (**)(id, void *, void))a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[MCWatchSettingsMirror sharedMirror];
  unsigned int v13 = [v12 effectiveBoolValueForSetting:v11 pairingID:v10 pairingDataStore:v9];

  if (v16)
  {
    long long v14 = &__kCFBooleanTrue;
    if (v13 != 1) {
      long long v14 = 0;
    }
    if (v13 == 2) {
      id v15 = &__kCFBooleanFalse;
    }
    else {
      id v15 = v14;
    }
    v16[2](v16, v15, 0);
  }
}

- (void)effectiveValueForWatchSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  long long v14 = (void (**)(id, void *, void))a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[MCWatchSettingsMirror sharedMirror];
  unsigned int v13 = [v12 effectiveValueForSetting:v11 pairingID:v10 pairingDataStore:v9];

  if (v14) {
    v14[2](v14, v13, 0);
  }
}

- (void)effectiveValuesForWatchIntersectionSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  long long v14 = (void (**)(id, void *, void))a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[MCWatchSettingsMirror sharedMirror];
  unsigned int v13 = [v12 effectiveIntersectionValuesForSetting:v11 pairingID:v10 pairingDataStore:v9];

  if (v14) {
    v14[2](v14, v13, 0);
  }
}

- (void)effectiveValuesForWatchUnionSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  long long v14 = (void (**)(id, void *, void))a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[MCWatchSettingsMirror sharedMirror];
  unsigned int v13 = [v12 effectiveUnionValuesForSetting:v11 pairingID:v10 pairingDataStore:v9];

  if (v14) {
    v14[2](v14, v13, 0);
  }
}

- (void)debugRescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 repeatingInterval:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-DebugRescheduleBackgroundActivity"];
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013C0C;
  block[3] = &unk_1000EB4B8;
  id v28 = v15;
  int64_t v29 = a3;
  void block[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (DMCDaemonConnectionTracker)connectionTracker
{
  return self->_connectionTracker;
}

- (void)setConnectionTracker:(id)a3
{
}

- (os_unfair_lock_s)checkInLock
{
  return self->_checkInLock;
}

- (void)setCheckInLock:(os_unfair_lock_s)a3
{
  self->_checkInLock = a3;
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (MCBackgroundActivityManager)workerQueueBackgroundActivityManager
{
  return self->_workerQueueBackgroundActivityManager;
}

- (void)setWorkerQueueBackgroundActivityManager:(id)a3
{
}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (void)setMonitorQueue:(id)a3
{
}

- (unint64_t)workerQueueLastCarrierProfileCheckTime
{
  return self->_workerQueueLastCarrierProfileCheckTime;
}

- (void)setWorkerQueueLastCarrierProfileCheckTime:(unint64_t)a3
{
  self->_workerQueueLastCarrierProfileCheckTime = a3;
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
}

- (double)memberQueueIdleTimeInterval
{
  return self->_memberQueueIdleTimeInterval;
}

- (void)setMemberQueueIdleTimeInterval:(double)a3
{
  self->_memberQueueIdleTimeInterval = a3;
}

- (BOOL)memberQueueHasMigrated
{
  return self->_memberQueueHasMigrated;
}

- (void)setMemberQueueHasMigrated:(BOOL)a3
{
  self->_memberQueueHasMigrated = a3;
}

- (BOOL)memberQueueHasActivationRecordChangesPending
{
  return self->_memberQueueHasActivationRecordChangesPending;
}

- (void)setMemberQueueHasActivationRecordChangesPending:(BOOL)a3
{
  self->_memberQueueHasActivationRecordChangesPending = a3;
}

- (OS_dispatch_queue)clientRestrictionQueue
{
  return self->_clientRestrictionQueue;
}

- (void)setClientRestrictionQueue:(id)a3
{
}

- (OS_dispatch_queue)mailAccountsQueue
{
  return self->_mailAccountsQueue;
}

- (void)setMailAccountsQueue:(id)a3
{
}

- (id)powerAssertionAssertedNotificationToken
{
  return self->_powerAssertionAssertedNotificationToken;
}

- (void)setPowerAssertionAssertedNotificationToken:(id)a3
{
}

- (id)powerAssertionDeassertedNotificationToken
{
  return self->_powerAssertionDeassertedNotificationToken;
}

- (void)setPowerAssertionDeassertedNotificationToken:(id)a3
{
}

- (int)mobileKeybagLockStateChangeNotificationToken
{
  return self->_mobileKeybagLockStateChangeNotificationToken;
}

- (void)setMobileKeybagLockStateChangeNotificationToken:(int)a3
{
  self->_mobileKeybagLockStateChangeNotificationToken = a3;
}

- (LSApplicationWorkspace)appWorkspace
{
  return self->_appWorkspace;
}

- (void)setAppWorkspace:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_appWorkspace, 0);
  objc_storeStrong(&self->_powerAssertionDeassertedNotificationToken, 0);
  objc_storeStrong(&self->_powerAssertionAssertedNotificationToken, 0);
  objc_storeStrong((id *)&self->_mailAccountsQueue, 0);
  objc_storeStrong((id *)&self->_clientRestrictionQueue, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
  objc_storeStrong((id *)&self->_workerQueueBackgroundActivityManager, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);

  objc_storeStrong((id *)&self->_connectionTracker, 0);
}

@end