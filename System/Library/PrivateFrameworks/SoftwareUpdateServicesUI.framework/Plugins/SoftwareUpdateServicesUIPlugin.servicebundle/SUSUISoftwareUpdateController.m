@interface SUSUISoftwareUpdateController
+ (SUSUISoftwareUpdateController)sharedInstance;
- (BOOL)_badgingQueue_isBadgedForSoftwareUpdate;
- (BOOL)_createAutoInstallKeybagWithPasscode:(id)a3;
- (BOOL)_doesStateContainNonInstallableReasons:(int64_t)a3 reasonsToCheck:(id)a4 outMatchingReasonsString:(id *)a5;
- (BOOL)_homescreenForeground;
- (BOOL)_isAutoUpdateEnabled;
- (BOOL)_isMultiUserAppleId;
- (BOOL)_isShowingInstallAlert;
- (BOOL)_needsToWaitForHomescreenToAppear;
- (BOOL)_setNVRAMVar:(__CFString *)a3 withValue:(void *)a4;
- (BOOL)_shouldHideAlert;
- (BOOL)_shouldShowOrScheduleInstallAlert;
- (BOOL)_showNextInstallAlertWithReasons:(int64_t)a3 orScheduleIfNecessary:(BOOL)a4;
- (BOOL)_showNextInstallAlertWithReasons:(int64_t)a3 orScheduleIfNecessary:(BOOL)a4 withInstallOptions:(id)a5;
- (BOOL)canDeferInstallation;
- (BOOL)installErrorWhenNotReadyForManagedRequest:(id)a3;
- (BOOL)installErrorWillScheduleAutoInstall:(id)a3;
- (BOOL)isInstallationKeybagRequired;
- (BOOL)isUILocked;
- (BOOL)presentAlert:(id)a3;
- (BOOL)settingsForeground;
- (OS_dispatch_queue)clientQueue;
- (SUSFollowUpController)followUpController;
- (SUSUIAlertPresentationManager)alertPresentationManager;
- (SUSUISoftwareUpdateController)init;
- (SUSUISoftwareUpdateController)initWithQueue:(id)a3;
- (id)_alertModel;
- (id)_allNonInstallableReasons;
- (id)_availableRollback;
- (id)_computeDefaultRealertDate;
- (id)_computeNextLastPredictedUnlockDateMinus4HoursFromNow;
- (id)_download;
- (id)_foregroundBundleID;
- (id)_installPolicy;
- (id)_stringForCurrentVersionPreference;
- (id)_stringForInstallNotAllowableReason:(unint64_t)a3;
- (id)_waitableReasonsForShowingInstallAlert;
- (id)computeNextLastPredictedUnlockDateMinus4HoursFromStartDate:(id)a3;
- (id)getDDMUpdateDescriptor;
- (id)getInitIfNeededDDMController;
- (id)getNextLastPredictedUnlockDateFromDuet:(id)a3;
- (int64_t)_delayDaysForSkips:(int64_t)a3 isRequiredInstall:(BOOL)a4;
- (int64_t)_springboardPasscodePolicyTypeFromSUPasscodePolicyType:(unint64_t)a3;
- (unint64_t)_getPasscodePolicy;
- (unint64_t)getPasscodePolicyForAlertModel:(id)a3;
- (void)_autoDownloadUnknownToUserFailedForDescriptor:(id)a3 error:(id)a4;
- (void)_autoInstallOperationDidExpire:(id)a3 withRepopStrategy:(unint64_t)a4 error:(id)a5;
- (void)_autoInstallOperationWasCancelled:(id)a3 withRepopStrategy:(unint64_t)a4;
- (void)_badgingQueue_badgeSettingsWithValue:(int64_t)a3;
- (void)_badgingQueue_savePreferencesBadgeEnabled:(BOOL)a3;
- (void)_bootedAfterRollback:(id)a3;
- (void)_clearLegacyBadgeIfNecessary:(id)a3;
- (void)_createInstallTonightForecastWithResult:(id)a3;
- (void)_createInstallTonightOperationWithResult:(id)a3;
- (void)_discoveredUpdates:(id)a3;
- (void)_dismissAllAlerts;
- (void)_dismissInstallAlertsWithReason:(id)a3 includingInstallTonight:(BOOL)a4 withRealertStrategy:(unint64_t)a5;
- (void)_dismissInstallFailureAlertsWithoutRepop;
- (void)_doInstallNowWithOptions:(id)a3;
- (void)_doInstallTonight:(id)a3 consent:(BOOL)a4;
- (void)_handleInstallError:(id)a3;
- (void)_initializeState;
- (void)_installUpdate:(unint64_t)a3 withInstallOperation:(id)a4 source:(unint64_t)a5 options:(id)a6;
- (void)_installationConstraintsDidChange:(unint64_t)a3 changed:(unint64_t)a4 error:(id)a5;
- (void)_isUpdateInstallable:(id)a3;
- (void)_isUpdateInstallableWithInstallOptions:(id)a3 andResponse:(id)a4;
- (void)_migrateForNewOSVersionIfNecessary;
- (void)_presentAuthenticationUIForInstallation:(id)a3 withInstallType:(unint64_t)a4 withInstallOperationForecast:(id)a5;
- (void)_promptForRollbackConentAndPasscode:(id)a3 withOptions:(id)a4 withCompletion:(id)a5;
- (void)_realertWithStrategy:(unint64_t)a3 andReason:(id)a4;
- (void)_rebootQuiet;
- (void)_registerForInstallationConstraintChangedNotifications;
- (void)_registerForUnlockNotifications;
- (void)_resetStateForReason:(id)a3;
- (void)_rollbackFailed:(id)a3 withError:(id)a4;
- (void)_rollbackSucceeded:(id)a3;
- (void)_rollbackSuggested:(id)a3 info:(id)a4;
- (void)_saveLastKnownVersionPreference:(id)a3;
- (void)_savePreferencesBadgeFlag:(BOOL)a3;
- (void)_scheduleInstallAlertReminderWithDate:(id)a3 repopStrategy:(unint64_t)a4 forReason:(id)a5;
- (void)_sendInstallTonightDidCompleteToObservers;
- (void)_setInstallPolicy:(id)a3;
- (void)_setPasscodePolicyType:(unint64_t)a3;
- (void)_setPendingInstallOptions:(id)a3;
- (void)_setSettingsBadgeToValue:(int64_t)a3;
- (void)_setTryTonightAutoInstallOperation:(id)a3 cancelIfNecessary:(BOOL)a4;
- (void)_setupAutoUpdate:(id)a3 withPasscodePolicy:(unint64_t)a4;
- (void)_showInstallAlertWithInstallOptions:(id)a3;
- (void)_showOrScheduleNextInstallAlert;
- (void)_showOrScheduleNextInstallAlertFromTimer:(id)a3;
- (void)_showSUAvailableAlertForDescriptor:(id)a3;
- (void)_unregisterForInstallationConstraintChangeNotifications;
- (void)_unregisterForUnlockNotifications;
- (void)_unregisterHomescreenAlerts;
- (void)addObserver:(id)a3;
- (void)alertModel:(id)a3 alertFlowDidChangeFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)autoInstallOperationDidConsent:(id)a3;
- (void)autoInstallOperationDidExpire:(id)a3 withError:(id)a4;
- (void)autoInstallOperationIsReadyToInstall:(id)a3 withResponse:(id)a4;
- (void)autoInstallOperationPasscodePolicyDidChange:(id)a3 passcodePolicyType:(unint64_t)a4;
- (void)autoInstallOperationWasCancelled:(id)a3;
- (void)autoInstallTonightWithOperation:(id)a3;
- (void)autoInstallTonightWithOperation:(id)a3 options:(id)a4;
- (void)cancelRollback;
- (void)client:(id)a3 automaticDownloadDidFailToStartForNewUpdateAvailable:(id)a4 withError:(id)a5;
- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5;
- (void)client:(id)a3 downloadDidFinish:(id)a4 withInstallPolicy:(id)a5;
- (void)client:(id)a3 downloadDidStart:(id)a4;
- (void)client:(id)a3 downloadProgressDidChange:(id)a4;
- (void)client:(id)a3 downloadWasInvalidatedForNewUpdateAvailable:(id)a4;
- (void)client:(id)a3 handleUIForDDMDeclaration:(id)a4;
- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5;
- (void)client:(id)a3 installDidFinish:(id)a4;
- (void)client:(id)a3 installDidStart:(id)a4;
- (void)client:(id)a3 installPolicyDidChange:(id)a4;
- (void)client:(id)a3 installTonightScheduled:(BOOL)a4 operationID:(id)a5;
- (void)client:(id)a3 installWantsToStart:(id)a4 completion:(id)a5;
- (void)client:(id)a3 managedInstallationRequested:(id)a4;
- (void)client:(id)a3 presentingRecommendedUpdate:(id)a4 shouldPresent:(BOOL)a5;
- (void)client:(id)a3 rollbackDidFail:(id)a4 withError:(id)a5;
- (void)client:(id)a3 rollbackDidFinish:(id)a4;
- (void)client:(id)a3 rollbackDidStart:(id)a4;
- (void)client:(id)a3 rollbackReadyToStart:(id)a4 options:(id)a5 completion:(id)a6;
- (void)client:(id)a3 rollbackSuggested:(id)a4 info:(id)a5;
- (void)client:(id)a3 scheduledRollbackReadyForReboot:(id)a4;
- (void)ddmAlertWasScheduled:(id)a3;
- (void)dealloc;
- (void)destroyInstallationKeybag;
- (void)deviceBootedAfterSplatOnlyRollback:(id)a3 rollbackDescriptor:(id)a4;
- (void)initPostOTAFollowUpController;
- (void)installNowFromSource:(unint64_t)a3;
- (void)installNowFromSource:(unint64_t)a3 options:(id)a4;
- (void)installTonight;
- (void)installTonightWithOperation:(id)a3;
- (void)installTonightWithOperation:(id)a3 options:(id)a4;
- (void)isDownloading:(id)a3;
- (void)layoutStateMonitorStateDidChange:(id)a3;
- (void)layoutStateMonitorUILockStateDidChange:(id)a3;
- (void)powerMonitorSystemDidWakeFromSleep:(id)a3;
- (void)powerMonitorSystemWillSleep:(id)a3;
- (void)presentAuthenticationAlert:(id)a3 completion:(id)a4;
- (void)presentEmergencyCallAlert:(id)a3 completion:(id)a4;
- (void)presentFullScreenAlert:(id)a3 completion:(id)a4;
- (void)presentRollbackConsentAlert:(id)a3 withOptions:(id)a4 withCompletion:(id)a5;
- (void)reboot:(BOOL)a3;
- (void)recordSUAnalyticsEvent:(id)a3;
- (void)removeObserver:(id)a3;
- (void)repopInstallAlertWithDefaultDurationFromNowForReason:(id)a3;
- (void)repopInstallAlertWithWeekDurationFromNowForReason:(id)a3;
- (void)rollbackCompleted:(id)a3;
- (void)scanForUpdates:(id)a3 withScanResults:(id)a4;
- (void)setClientQueue:(id)a3;
- (void)setFollowUpController:(id)a3;
- (void)setInstallOperation:(id)a3;
- (void)setPasscodePolicy:(unint64_t)a3;
- (void)setUpdateToInstall:(id)a3;
- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4;
- (void)submitSUAnalyticsEvent:(id)a3;
- (void)toggleSettingsBadge:(BOOL)a3 update:(id)a4;
- (void)userAskedToDeferInstall;
@end

@implementation SUSUISoftwareUpdateController

+ (SUSUISoftwareUpdateController)sharedInstance
{
  v5 = (dispatch_once_t *)&unk_70438;
  id location = 0;
  objc_storeStrong(&location, &stru_60058);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_70430;

  return (SUSUISoftwareUpdateController *)v2;
}

- (SUSUISoftwareUpdateController)init
{
  v7 = self;
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.softwareupdateservices.ui.ios.sumanagerQueue", v5);
  v7 = 0;
  v7 = -[SUSUISoftwareUpdateController initWithQueue:](self, "initWithQueue:");
  v6 = v7;

  objc_storeStrong((id *)&v7, 0);
  return v6;
}

- (SUSUISoftwareUpdateController)initWithQueue:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v17;
  v17 = 0;
  v15.receiver = v3;
  v15.super_class = (Class)SUSUISoftwareUpdateController;
  v7 = [(SUSUISoftwareUpdateController *)&v15 init];
  v17 = v7;
  objc_storeStrong((id *)&v17, v7);
  if (v7)
  {
    queue = location[0];
    v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    v11 = sub_230DC;
    v12 = &unk_5CFB0;
    v13 = v17;
    id v14 = location[0];
    dispatch_sync(queue, &v8);
    objc_storeStrong(&v14, 0);
    objc_storeStrong((id *)&v13, 0);
  }
  v5 = v17;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v5;
}

- (void)_initializeState
{
  v18 = self;
  location[1] = (id)a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  location[0] = (id)SUSUILog();
  os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1A68C((uint64_t)v19, (uint64_t)"-[SUSUISoftwareUpdateController _initializeState]");
    _os_log_impl(&def_46F0, (os_log_t)location[0], v16, "%s: [DDM] Checking if we have a declaration to consider", v19, 0xCu);
  }
  objc_storeStrong(location, 0);
  client = v18->_client;
  int v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  v13 = sub_238D8;
  id v14 = &unk_60080;
  objc_super v15 = v18;
  [(SUManagerClient *)client getDDMDeclarationWithHandler:&v10];
  v3 = v18->_client;
  dispatch_queue_t v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_23AD0;
  v8 = &unk_600D0;
  int v9 = v18;
  [(SUManagerClient *)v3 downloadAndInstallState:&v4];
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong((id *)&v15, 0);
}

- (void)dealloc
{
  int v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:v5];

  [(SUSUISoftwareUpdateController *)v5 _unregisterForInstallationConstraintChangeNotifications];
  [(SUAutoInstallOperation *)v5->_scheduledTryTonightAutoInstallOperation cancel];
  [(SUSUISoftwareUpdateAlertModel *)v5->_alertModel setDelegate:0];
  [(PCPersistentTimer *)v5->_installTimer invalidate];
  [(SUManagerClient *)v5->_client invalidate];
  v3.receiver = v5;
  v3.super_class = (Class)SUSUISoftwareUpdateController;
  [(SUSUISoftwareUpdateController *)&v3 dealloc];
}

- (void)recordSUAnalyticsEvent:(id)a3
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_clientQueue;
  SEL v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_24AA0;
  v8 = &unk_5CFB0;
  int v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)submitSUAnalyticsEvent:(id)a3
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_clientQueue;
  SEL v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_24BE4;
  v8 = &unk_5CFB0;
  int v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)isDownloading:(id)a3
{
  int v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v11->_clientQueue);
  client = v11->_client;
  SEL v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_24D14;
  v8 = &unk_600F8;
  id v9 = location[0];
  -[SUManagerClient isDownloading:](client, "isDownloading:");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)canDeferInstallation
{
  v7 = self;
  location[1] = (id)a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (v7->_updateToInstall)
  {
    location[0] = [(SUSUISoftwareUpdateAlertModel *)v7->_alertModel currentInstallationPolicy];
    char v5 = 1;
    if ([(SUSUIDDMController *)v7->_ddmController shouldEnforceUpdate])
    {
      char v8 = 0;
    }
    else
    {
      if ([location[0] type] == (char *)&def_46F0 + 1)
      {
        id v4 = [location[0] skipsAllowed];
        BOOL v3 = 0;
        if ((uint64_t)v4 > 0) {
          BOOL v3 = [(SUSUISoftwareUpdateAlertModel *)v7->_alertModel remindMeLaterCountSinceRequiringInstallation] < (uint64_t)v4;
        }
        char v5 = v3;
      }
      char v8 = v5 & 1;
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    char v8 = 1;
  }
  return v8 & 1;
}

- (BOOL)isUILocked
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  [(SUSUISoftwareUpdateController *)self _registerForUnlockNotifications];
  char v3 = [(SUSUILayoutStateMonitor *)self->_uiLockedLayoutStateMonitor isUILocked];
  [(SUSUISoftwareUpdateController *)self _unregisterForUnlockNotifications];
  return v3 & 1;
}

- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v7->_clientQueue);
  [(SUManagerClient *)v7->_client startDownloadWithOptions:location[0] withResult:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)userAskedToDeferInstall
{
}

- (void)installNowFromSource:(unint64_t)a3
{
}

- (void)installNowFromSource:(unint64_t)a3 options:(id)a4
{
  v7 = (dispatch_queue_t *)self;
  SEL v6 = a2;
  unint64_t v5 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  dispatch_assert_queue_V2(v7[3]);
  [(dispatch_queue_t *)v7 _installUpdate:0 withInstallOperation:0 source:v5 options:location];
  objc_storeStrong(&location, 0);
}

- (void)installTonight
{
  int v12 = self;
  v11[1] = (id)a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v11[0] = v12->_scheduledTryTonightAutoInstallOperation;
  if ([v11[0] _isValidForScheduling])
  {
    [(SUSUISoftwareUpdateController *)v12 installTonightWithOperation:v11[0] options:0];
  }
  else
  {
    id location = (id)SUSUILog();
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      sub_16030((uint64_t)v13, (uint64_t)v11[0]);
      _os_log_impl(&def_46F0, (os_log_t)location, v9, "Auto install operation (%p) was attempted to be scheduled, but it was already expired or cancelled. Trying to fetch a new one.", v13, 0xCu);
    }
    objc_storeStrong(&location, 0);
    v2 = v12;
    char v3 = _NSConcreteStackBlock;
    int v4 = -1073741824;
    int v5 = 0;
    SEL v6 = sub_252F4;
    v7 = &unk_60120;
    char v8 = v12;
    [(SUSUISoftwareUpdateController *)v2 _createInstallTonightOperationWithResult:&v3];
    objc_storeStrong((id *)&v8, 0);
  }
  objc_storeStrong(v11, 0);
}

- (void)installTonightWithOperation:(id)a3
{
  int v4 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2(v4[3]);
  [(dispatch_queue_t *)v4 installTonightWithOperation:location[0] options:0];
  objc_storeStrong(location, 0);
}

- (void)autoInstallTonightWithOperation:(id)a3
{
  int v4 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2(v4[3]);
  [(dispatch_queue_t *)v4 autoInstallTonightWithOperation:location[0] options:0];
  objc_storeStrong(location, 0);
}

- (void)autoInstallTonightWithOperation:(id)a3 options:(id)a4
{
  v7 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  dispatch_assert_queue_V2(v7[3]);
  [(dispatch_queue_t *)v7 _installUpdate:2 withInstallOperation:location[0] source:1 options:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)installTonightWithOperation:(id)a3 options:(id)a4
{
  v7 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  dispatch_assert_queue_V2(v7[3]);
  [(dispatch_queue_t *)v7 _installUpdate:1 withInstallOperation:location[0] source:0 options:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)repopInstallAlertWithDefaultDurationFromNowForReason:(id)a3
{
  int v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v4->_clientQueue);
  [(SUSUISoftwareUpdateAlertModel *)v4->_alertModel userSelectedRemindMeLater];
  [(SUSUISoftwareUpdateController *)v4 _realertWithStrategy:1 andReason:location[0]];
  objc_storeStrong(location, 0);
}

- (void)repopInstallAlertWithWeekDurationFromNowForReason:(id)a3
{
  int v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v4->_clientQueue);
  [(SUSUISoftwareUpdateAlertModel *)v4->_alertModel userSelectedRemindMeLater];
  [(SUSUISoftwareUpdateController *)v4 _realertWithStrategy:2 andReason:location[0]];
  objc_storeStrong(location, 0);
}

- (void)presentAuthenticationAlert:(id)a3 completion:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v7->_clientQueue);
  [(SUSUIFullScreenAlertPresentationManager *)v7->_fullScreenAlertPresentationManager presentAlert:location[0] completion:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)presentEmergencyCallAlert:(id)a3 completion:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v7->_clientQueue);
  [(SUSUIFullScreenAlertPresentationManager *)v7->_fullScreenAlertPresentationManager presentAlert:location[0] completion:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)presentFullScreenAlert:(id)a3 completion:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v7->_clientQueue);
  [(SUSUIFullScreenAlertPresentationManager *)v7->_fullScreenAlertPresentationManager presentAlert:location[0] completion:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)addObserver:(id)a3
{
  int v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v4->_clientQueue);
  if (location[0]) {
    [(NSHashTable *)v4->_observers addObject:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)removeObserver:(id)a3
{
  int v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v4->_clientQueue);
  if (location[0]) {
    [(NSHashTable *)v4->_observers removeObject:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (id)_download
{
  return self->_updateToInstall;
}

- (id)_installPolicy
{
  return self->_installPolicy;
}

- (id)_availableRollback
{
  v22 = self;
  v21[1] = (id)a2;
  uint64_t v15 = 0;
  os_log_type_t v16 = &v15;
  int v17 = 838860800;
  int v18 = 48;
  v19 = sub_25B64;
  v20 = sub_25BBC;
  v21[0] = 0;
  id location = dispatch_semaphore_create(0);
  int64_t v13 = 2000000000;
  client = v22->_client;
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = sub_25BEC;
  int v11 = &unk_60148;
  v12[1] = &v15;
  v12[0] = location;
  [(SUManagerClient *)client eligibleRollbackWithOptions:0 withResult:&v7];
  if (location)
  {
    dsema = location;
    dispatch_time_t v2 = dispatch_time(0, v13);
    dispatch_semaphore_wait(dsema, v2);
  }
  id v4 = (id)v16[5];
  objc_storeStrong(v12, 0);
  objc_storeStrong(&location, 0);
  _Block_object_dispose(&v15, 8);
  objc_storeStrong(v21, 0);

  return v4;
}

- (void)_discoveredUpdates:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUManagerClient *)v4->_client descriptors:location[0]];
  objc_storeStrong(location, 0);
}

- (void)_createInstallTonightForecastWithResult:(id)a3
{
  int v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v11->_clientQueue);
  client = v11->_client;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_25DE8;
  int v8 = &unk_60170;
  id v9 = location[0];
  -[SUManagerClient currentAutoInstallOperationForecast:](client, "currentAutoInstallOperationForecast:");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_createInstallTonightOperationWithResult:(id)a3
{
  int v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v11->_clientQueue);
  client = v11->_client;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_260E0;
  int v8 = &unk_60198;
  id v9 = location[0];
  -[SUManagerClient currentAutoInstallOperation:withResult:](client, "currentAutoInstallOperation:withResult:", 1);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_isMultiUserAppleId
{
  id v10 = self;
  SEL v9 = a2;
  char v8 = 0;
  id location = +[UMUserManager sharedManager];
  char v5 = 0;
  BOOL v4 = 0;
  if ([location isMultiUser])
  {
    id v6 = [location currentUser];
    char v5 = 1;
    BOOL v4 = [v6 userType] == (char *)&def_46F0 + 1;
  }
  if (v5) {

  }
  if (v4) {
    char v8 = 1;
  }
  char v3 = v8;
  objc_storeStrong(&location, 0);
  return v3 & 1;
}

- (id)_alertModel
{
  return self->_alertModel;
}

- (BOOL)presentAlert:(id)a3
{
  char v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v5->_clientQueue);
  if (location[0]) {
    char v6 = [(SUSUIAlertPresentationManager *)v5->_alertPresentationManager presentAlert:location[0] animated:1];
  }
  else {
    char v6 = 0;
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)_dismissAllAlerts
{
}

- (void)ddmAlertWasScheduled:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)destroyInstallationKeybag
{
}

- (void)powerMonitorSystemWillSleep:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)SUSUILog();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    log = v7;
    os_log_type_t type = v6;
    sub_5A1C(v5);
    _os_log_impl(&def_46F0, log, type, "Device will sleep.", v5, 2u);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)powerMonitorSystemDidWakeFromSleep:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)SUSUILog();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    log = v7;
    os_log_type_t type = v6;
    sub_5A1C(v5);
    _os_log_impl(&def_46F0, log, type, "Device woke from sleep.", v5, 2u);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)layoutStateMonitorUILockStateDidChange:(id)a3
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_clientQueue;
  BOOL v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_26804;
  char v8 = &unk_5CFB0;
  id v9 = location[0];
  id v10 = v12;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)layoutStateMonitorStateDidChange:(id)a3
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_clientQueue;
  BOOL v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_269D4;
  char v8 = &unk_5CFB0;
  id v9 = location[0];
  id v10 = v12;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_installationConstraintsDidChange:(unint64_t)a3 changed:(unint64_t)a4 error:(id)a5
{
  uint64_t v15 = self;
  SEL v14 = a2;
  unint64_t v13 = a3;
  location[1] = (id)a4;
  location[0] = 0;
  objc_storeStrong(location, a5);
  if (v13)
  {
    uint64_t v11 = 16;
    if ((int *)[(SUSUISoftwareUpdateAlertModel *)v15->_alertModel alertFlow] == &dword_4
      || (char *)[(SUSUISoftwareUpdateAlertModel *)v15->_alertModel alertFlow] == (char *)&def_46F0 + 1)
    {
      uint64_t v11 = 17;
    }
    if (sub_2746C(v13, v11))
    {
      id v7 = v15;
      id v8 = (id)SUStringFromInstallationConstraints();
      -[SUSUISoftwareUpdateController _dismissInstallAlertsWithReason:includingInstallTonight:withRealertStrategy:](v7, "_dismissInstallAlertsWithReason:includingInstallTonight:withRealertStrategy:");
    }
    else if (v15->_scheduleInstallAlertWhenAble {
           && ![(SUSUISoftwareUpdateController *)v15 _isShowingInstallAlert]
    }
           && ![(SUSUISoftwareUpdateController *)v15 _needsToWaitForHomescreenToAppear])
    {
      int v5 = v15;
      id v6 = (id)SUStringFromInstallationConstraints();
      -[SUSUISoftwareUpdateController _realertWithStrategy:andReason:](v5, "_realertWithStrategy:andReason:", 4);
    }
  }
  else if (v15->_scheduleInstallAlertWhenAble {
         && ![(SUSUISoftwareUpdateController *)v15 _isShowingInstallAlert]
  }
         && ![(SUSUISoftwareUpdateController *)v15 _needsToWaitForHomescreenToAppear])
  {
    id v9 = v15;
    id v10 = (id)SUStringFromInstallationConstraints();
    -[SUSUISoftwareUpdateController _realertWithStrategy:andReason:](v9, "_realertWithStrategy:andReason:", 4);
  }
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadWasInvalidatedForNewUpdateAvailable:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v9->_clientQueue);
  int v5 = v9;
  id v6 = +[NSString stringWithFormat:@"Download invalidated for new update available: %@", v7];
  -[SUSUISoftwareUpdateController _resetStateForReason:](v5, "_resetStateForReason:");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 automaticDownloadDidFailToStartForNewUpdateAvailable:(id)a4 withError:(id)a5
{
  id v10 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v7 = 0;
  objc_storeStrong(&v7, a5);
  dispatch_assert_queue_V2(v10[3]);
  [(dispatch_queue_t *)v10 _autoDownloadUnknownToUserFailedForDescriptor:v8 error:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadDidStart:(id)a4
{
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v11->_clientQueue);
  id v6 = v11;
  id v5 = v9;
  id v8 = [v9 descriptor];
  id v7 = +[NSString stringWithFormat:@"New download started: %p for descriptor: %@", v5, v8];
  -[SUSUISoftwareUpdateController _resetStateForReason:](v6, "_resetStateForReason:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadProgressDidChange:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v10->_clientQueue);
  id v6 = [v8 progress];
  id v5 = [v6 phase];
  unsigned __int8 v7 = [v5 isEqualToString:kSUDownloadPhaseUpdateFetchingQueuedRemote];

  if (v7) {
    [(SUSUISoftwareUpdateAlertModel *)v10->_alertModel setDownloadWasQueuedRemotely:1];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5
{
  v68 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v66 = 0;
  objc_storeStrong(&v66, a4);
  id v65 = 0;
  objc_storeStrong(&v65, a5);
  dispatch_assert_queue_V2((dispatch_queue_t)v68->_clientQueue);
  id v64 = (id)SUSUILog();
  os_log_type_t v63 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_DEFAULT))
  {
    sub_24660((uint64_t)v69, (uint64_t)v66, (uint64_t)v65);
    _os_log_impl(&def_46F0, (os_log_t)v64, v63, "Software update download (%p) failed with error: %@", v69, 0x16u);
  }
  objc_storeStrong(&v64, 0);
  [(SUSUISoftwareUpdateAlertModel *)v68->_alertModel setDownloadWasQueuedRemotely:0];
  id v21 = [v65 userInfo];
  id v20 = [v21 objectForKey:kSUUserRequestedKey];
  unsigned __int8 v22 = [v20 BOOLValue];

  char v62 = v22 & 1;
  char v61 = 1;
  id v23 = [v65 userInfo];
  id v60 = [v23 objectForKey:kSUNotifyUserKey];

  if (v60)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v61 = [v60 BOOLValue] & 1;
    }
  }
  if (v61)
  {
    if (v62)
    {
      os_log_t v28 = (os_log_t)(id)SUSUILog();
      os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = v28;
        os_log_type_t v6 = v27;
        sub_5A1C(v26);
        _os_log_impl(&def_46F0, v5, v6, "User requested cancellation of the SU download; withholding the notification to the user of the failure.",
          v26,
          2u);
      }
      objc_storeStrong((id *)&v28, 0);
    }
    else
    {
      id v16 = [v66 metadata];
      char v55 = 0;
      BOOL v17 = 0;
      if ([v16 isAutoDownload])
      {
        id v56 = [v66 metadata];
        char v55 = 1;
        BOOL v17 = [v56 activeDownloadPolicyType] == 1;
      }
      if (v55) {

      }
      if (v17)
      {
        SEL v14 = v68;
        id v15 = [v66 descriptor];
        -[SUSUISoftwareUpdateController _autoDownloadUnknownToUserFailedForDescriptor:error:](v14, "_autoDownloadUnknownToUserFailedForDescriptor:error:");
      }
      else if (BYSetupAssistantNeedsToRun() & 1)
      {
        os_log_t oslog = (os_log_t)(id)SUSUILog();
        os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v7 = oslog;
          os_log_type_t v8 = v30;
          sub_5A1C(v29);
          _os_log_impl(&def_46F0, v7, v8, "Not showing download failure alert because Buddy is running", v29, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      else
      {
        v45 = _NSConcreteStackBlock;
        int v46 = -1073741824;
        int v47 = 0;
        v48 = sub_28044;
        v49 = &unk_5E880;
        v50 = v68;
        id v51 = v66;
        id v52 = v65;
        id v53 = objc_retainBlock(&v45);
        if ([(SUSUILayoutStateMonitor *)v68->_layoutStateMonitor isHomeScreenForeground]
          || [(SUSUISoftwareUpdateController *)v68 settingsForeground])
        {
          id v44 = (id)SUSUILog();
          os_log_type_t v43 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_DEFAULT))
          {
            int v12 = v44;
            os_log_type_t v13 = v43;
            sub_5A1C(v42);
            _os_log_impl(&def_46F0, v12, v13, "Download failed. Presenting download failure to user", v42, 2u);
          }
          objc_storeStrong(&v44, 0);
          (*((void (**)(void))v53 + 2))();
        }
        else
        {
          id v41 = (id)SUSUILog();
          os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
          {
            id v10 = v41;
            os_log_type_t v11 = v40;
            sub_5A1C(v39);
            _os_log_impl(&def_46F0, v10, v11, "Download failed. Registering download failure alert for presentation on homescreen", v39, 2u);
          }
          objc_storeStrong(&v41, 0);
          [(SUSUILayoutStateMonitor *)v68->_layoutStateMonitor addObserver:v68];
          queue = v68->_homescreenBlockQueue;
          v32 = _NSConcreteStackBlock;
          int v33 = -1073741824;
          int v34 = 0;
          v35 = sub_281E4;
          v36 = &unk_601E8;
          v37 = v68;
          id v38 = v53;
          dispatch_async(queue, &v32);
          objc_storeStrong(&v38, 0);
          objc_storeStrong((id *)&v37, 0);
        }
        objc_storeStrong(&v53, 0);
        objc_storeStrong(&v52, 0);
        objc_storeStrong(&v51, 0);
        objc_storeStrong((id *)&v50, 0);
      }
    }
  }
  else
  {
    id v59 = (id)SUSUILog();
    os_log_type_t v58 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = v59;
      os_log_type_t v19 = v58;
      sub_5A1C(v57);
      _os_log_impl(&def_46F0, v18, v19, "Don't notify user", v57, 2u);
    }
    objc_storeStrong(&v59, 0);
  }
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(&v66, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadDidFinish:(id)a4 withInstallPolicy:(id)a5
{
  v35 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = 0;
  objc_storeStrong(&v33, a4);
  id v32 = 0;
  objc_storeStrong(&v32, a5);
  dispatch_assert_queue_V2(v35[3]);
  id v31 = (id)SUSUILog();
  os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
  {
    log = v31;
    os_log_type_t type = v30;
    id v9 = v33;
    id v12 = [v33 descriptor];
    id v29 = v12;
    sub_24660((uint64_t)v38, (uint64_t)v9, (uint64_t)v29);
    _os_log_impl(&def_46F0, log, type, "Software update download (%p) completed successfully: %@", v38, 0x16u);

    objc_storeStrong(&v29, 0);
  }
  objc_storeStrong(&v31, 0);
  id v28 = (id)SUSUILog();
  os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
  {
    sub_548C((uint64_t)v37, (uint64_t)v32);
    _os_log_impl(&def_46F0, (os_log_t)v28, v27, "Install Policy: %@", v37, 0xCu);
  }
  objc_storeStrong(&v28, 0);
  if (v33)
  {
    id v23 = (id)objc_opt_new();
    unsigned __int8 v5 = [v32 useDarkBoot];
    [v23 setInstallDark:v5 & 1];
    unsigned __int8 v6 = [v32 autoUpdateEnabled];
    [v23 setAutomaticInstallAttempt:v6 & 1];
    os_log_type_t v8 = v35;
    id v7 = v23;
    id v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    int v18 = sub_28664;
    os_log_type_t v19 = &unk_60210;
    id v20 = v35;
    id v21 = v33;
    id v22 = v32;
    [(dispatch_queue_t *)v8 _isUpdateInstallableWithInstallOptions:v7 andResponse:&v15];
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong((id *)&v20, 0);
    objc_storeStrong(&v23, 0);
    int v24 = 0;
  }
  else
  {
    id v26 = (id)SUSUILog();
    os_log_type_t v25 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
      sub_1A68C((uint64_t)v36, (uint64_t)"-[SUSUISoftwareUpdateController client:downloadDidFinish:withInstallPolicy:]");
      _os_log_error_impl(&def_46F0, (os_log_t)v26, v25, "%s: download is nil...", v36, 0xCu);
    }
    objc_storeStrong(&v26, 0);
    int v24 = 1;
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 installWantsToStart:(id)a4 completion:(id)a5
{
  int v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  dispatch_assert_queue_V2((dispatch_queue_t)v17->_clientQueue);
  id v13 = (id)SUSUILog();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    os_log_type_t type = v12;
    id v5 = v15;
    os_log_type_t v8 = [(SUSUISoftwareUpdateAlertModel *)v17->_alertModel currentInstallationPolicy];
    os_log_type_t v11 = v8;
    sub_4BF8((uint64_t)v18, (uint64_t)v5, (uint64_t)v11);
    _os_log_impl(&def_46F0, log, type, "Software update install want to begin for update: %@\nInstall Policy: %@", v18, 0x16u);

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  (*((void (**)(id, uint64_t, void))v14 + 2))(v14, 1, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 installDidStart:(id)a4
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v21->_clientQueue);
  [(SUSUIDDMController *)v21->_ddmController installDidStart:v19];
  id v18 = (id)SUSUILog();
  os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    log = v18;
    os_log_type_t type = v17;
    id v10 = v19;
    id v13 = [(SUSUISoftwareUpdateAlertModel *)v21->_alertModel currentInstallationPolicy];
    int v16 = v13;
    sub_4BF8((uint64_t)v22, (uint64_t)v10, (uint64_t)v16);
    _os_log_impl(&def_46F0, log, type, "Software update install began for update: %@\nInstall Policy: %@", v22, 0x16u);

    objc_storeStrong((id *)&v16, 0);
  }
  objc_storeStrong(&v18, 0);
  os_log_type_t v8 = [(SUSUISoftwareUpdateAlertModel *)v21->_alertModel currentInstallationPolicy];
  unsigned __int8 v9 = [(SUInstallPolicy *)v8 useDarkBoot];

  if (v9)
  {
    if (!v21->_pendingInstallOptions)
    {
      BOOL v4 = objc_alloc_init(SUSUISoftwareUpdateInstallOptions);
      pendingInstallOptions = v21->_pendingInstallOptions;
      v21->_pendingInstallOptions = v4;
    }
    [(SUSUISoftwareUpdateInstallOptions *)v21->_pendingInstallOptions setInstallDark:1];
  }
  [(SUSUISoftwareUpdateController *)v21 _realertWithStrategy:0 andReason:@"Install starting."];
  unsigned __int8 v6 = [SUSUISoftwareUpdateVerifyingUpdateAlertItem alloc];
  id v7 = [(SUDownload *)v21->_updateToInstall descriptor];
  id v15 = -[SUSUIBaseSoftwareUpdateAlertItem initWithDescriptor:softwareUpdateController:](v6, "initWithDescriptor:softwareUpdateController:");

  [(SUSUIAlertPresentationManager *)v21->_alertPresentationManager presentAlert:v15 animated:1];
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5
{
  os_log_type_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  dispatch_assert_queue_V2((dispatch_queue_t)v11->_clientQueue);
  [(SUSUIDDMController *)v11->_ddmController installDidFail:v9];
  id v7 = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    sub_548C((uint64_t)v12, (uint64_t)v8);
    _os_log_impl(&def_46F0, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Software update failed to apply update with error: %@", v12, 0xCu);
  }
  objc_storeStrong(&v7, 0);
  [(SUSUIAlertPresentationManager *)v11->_alertPresentationManager dismissAlertsOfClass:objc_opt_class() animated:1];
  [(SUSUIAlertPresentationManager *)v11->_alertPresentationManager dismissAlertsOfClass:objc_opt_class() animated:1];
  [(SUSUIAlertPresentationManager *)v11->_alertPresentationManager dismissAlertsOfClass:objc_opt_class() animated:1];
  [(SUSUISoftwareUpdateController *)v11 _handleInstallError:v8];
  [(SUSUISoftwareUpdateController *)v11 _setPendingInstallOptions:0];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 installDidFinish:(id)a4
{
  id v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v32->_clientQueue);
  [(SUSUIDDMController *)v32->_ddmController installDidFinish:v30];
  if ([(SUSUISoftwareUpdateInstallOptions *)v32->_pendingInstallOptions automaticInstallAttempt])
  {
    [(SUSUISoftwareUpdateController *)v32 _sendInstallTonightDidCompleteToObservers];
  }
  id v15 = +[SUSUIPreferences sharedInstance];
  [(SUSUIPreferences *)v15 setNeedsAlertPresentationAfterOTAUpdate:1];

  id v29 = (id)SUSUILog();
  os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
  {
    log = v29;
    os_log_type_t type = v28;
    sub_5A1C(v27);
    _os_log_impl(&def_46F0, log, type, "Update applied, set needsAlertPresentationAfterOTAUpdate to YES", v27, 2u);
  }
  objc_storeStrong(&v29, 0);
  char v26 = [v30 isSplatOnly] & 1;
  os_log_type_t v12 = +[SUSUIPreferences sharedInstance];
  [(SUSUIPreferences *)v12 setLastAppliedUpdateWasSplatOnly:v26 & 1];

  id v25 = (id)SUSUILog();
  os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
  {
    if (v26) {
      CFStringRef v4 = @"Splat";
    }
    else {
      CFStringRef v4 = @"Non-Splat";
    }
    if (v26) {
      CFStringRef v5 = @"YES";
    }
    else {
      CFStringRef v5 = @"NO";
    }
    sub_4BF8((uint64_t)v33, (uint64_t)v4, (uint64_t)v5);
    _os_log_impl(&def_46F0, (os_log_t)v25, v24, "%@ update applied, set lastAppliedUpdateWasSplatOnly to %@", v33, 0x16u);
  }
  objc_storeStrong(&v25, 0);
  id v10 = +[SUSUIPreferences sharedInstance];
  unsigned __int8 v11 = [(SUSUIPreferences *)v10 IWillRebootLater];

  if (v11)
  {
    id v23 = (id)SUSUILog();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v23;
      os_log_type_t v9 = v22;
      sub_5A1C(v21);
      _os_log_impl(&def_46F0, v8, v9, "I will reboot later; don't reboot now!", v21, 2u);
    }
    objc_storeStrong(&v23, 0);
    int v20 = 1;
  }
  else
  {
    id v19 = (id)SUSUILog();
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v6 = v19;
      os_log_type_t v7 = v18;
      sub_5A1C(v17);
      _os_log_impl(&def_46F0, v6, v7, "Software update applied.  Rebooting.", v17, 2u);
    }
    objc_storeStrong(&v19, 0);
    [(SUSUISoftwareUpdateController *)v32 reboot:[(SUSUISoftwareUpdateInstallOptions *)v32->_pendingInstallOptions installDark]];
    int v20 = 0;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 installPolicyDidChange:(id)a4
{
  id v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v39 = 0;
  objc_storeStrong(&v39, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v41->_clientQueue);
  id v38 = 0;
  id v13 = [(SUSUISoftwareUpdateAlertModel *)v41->_alertModel currentInstallationPolicy];
  id v14 = (char *)[(SUInstallPolicy *)v13 type];

  id v38 = v14;
  v37 = (char *)[v39 type];
  char v36 = 0;
  id v15 = [(SUSUISoftwareUpdateAlertModel *)v41->_alertModel currentInstallationPolicy];
  unsigned __int8 v16 = [(SUInstallPolicy *)v15 autoUpdateEnabled];

  char v36 = v16 & 1;
  char v35 = 0;
  char v34 = 0;
  os_log_type_t v17 = [(SUSUISoftwareUpdateAlertModel *)v41->_alertModel currentInstallationPolicy];
  unsigned __int8 v18 = [(SUInstallPolicy *)v17 useDarkBoot];

  char v34 = v18 & 1;
  char v33 = [v39 useDarkBoot] & 1;
  id v19 = [(SUSUISoftwareUpdateAlertModel *)v41->_alertModel currentInstallationPolicy];
  unsigned __int8 v20 = [(SUInstallPolicy *)v19 isEqual:v39];

  if ((v20 & 1) == 0)
  {
    id v32 = (id)SUSUILog();
    os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
    {
      log = v32;
      os_log_type_t type = v31;
      unsigned __int8 v11 = [(SUSUISoftwareUpdateAlertModel *)v41->_alertModel currentInstallationPolicy];
      id v30 = v11;
      sub_4BF8((uint64_t)v43, (uint64_t)v30, (uint64_t)v39);
      _os_log_impl(&def_46F0, log, type, "Install Policy changed from:%@ to %@:", v43, 0x16u);

      objc_storeStrong((id *)&v30, 0);
    }
    objc_storeStrong(&v32, 0);
    [(SUSUISoftwareUpdateAlertModel *)v41->_alertModel setCurrentInstallationPolicy:v39 forReason:@"Install policy changed from daemon"];
    [(SUSUISoftwareUpdateController *)v41 _setInstallPolicy:v39];
    if (v38 != v37
      && v37 == (unsigned char *)&def_46F0 + 1
      && (char *)[(SUSUISoftwareUpdateAlertModel *)v41->_alertModel alertFlow] != (char *)&dword_4 + 1)
    {
      char v35 = 1;
      id v8 = SUSUIStringForInstallPolicyType((uint64_t)v38);
      os_log_type_t v7 = SUSUIStringForInstallPolicyType((uint64_t)v37);
      id v29 = +[NSString stringWithFormat:@"Install policy changed from %@ to %@", v8, v7];

      [(SUSUISoftwareUpdateController *)v41 _realertWithStrategy:6 andReason:v29];
      objc_storeStrong((id *)&v29, 0);
    }
    if ((v34 & 1) != (v33 & 1))
    {
      id v28 = (id)SUSUILog();
      os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
      {
        if (v33) {
          CFStringRef v4 = @"Enabled";
        }
        else {
          CFStringRef v4 = @"Disabled";
        }
        sub_548C((uint64_t)v42, (uint64_t)v4);
        _os_log_impl(&def_46F0, (os_log_t)v28, v27, "darkBoot setting changed to: %@", v42, 0xCu);
      }
      objc_storeStrong(&v28, 0);
      [(SUSUISoftwareUpdateInstallOptions *)v41->_pendingInstallOptions setInstallDark:v33 & 1];
    }
    int v6 = v36 & 1;
    if (v6 != ([v39 autoUpdateEnabled] & 1))
    {
      if ([v39 autoUpdateEnabled])
      {
        if (v41->_updateToInstall)
        {
          client = v41->_client;
          id v21 = _NSConcreteStackBlock;
          int v22 = -1073741824;
          int v23 = 0;
          os_log_type_t v24 = sub_29E7C;
          id v25 = &unk_600A8;
          char v26 = v41;
          [(SUManagerClient *)client currentAutoInstallOperation:1 withResult:&v21];
          objc_storeStrong((id *)&v26, 0);
        }
        [(SUSUISoftwareUpdateController *)v41 _realertWithStrategy:0 andReason:@"Auto update enabled"];
      }
      else
      {
        [(SUSUISoftwareUpdateController *)v41 _setTryTonightAutoInstallOperation:0 cancelIfNecessary:1];
        [(SUSUISoftwareUpdateController *)v41 _setPasscodePolicyType:0];
        if ((v35 & 1) == 0 && v41->_updateToInstall) {
          [(SUSUISoftwareUpdateController *)v41 _realertWithStrategy:1 andReason:@"Auto update turned off"];
        }
      }
    }
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 managedInstallationRequested:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  if (v14->_updateToInstall)
  {
    if ([v12 autoUpdateEnabled])
    {
      client = v14->_client;
      int v6 = _NSConcreteStackBlock;
      int v7 = -1073741824;
      int v8 = 0;
      os_log_type_t v9 = sub_2A1E4;
      id v10 = &unk_600A8;
      unsigned __int8 v11 = v14;
      [(SUManagerClient *)client currentAutoInstallOperation:1 withResult:&v6];
      objc_storeStrong((id *)&v11, 0);
    }
    else
    {
      [(SUSUISoftwareUpdateController *)v14 _realertWithStrategy:6 andReason:@"Managed Install request received"];
    }
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 handleUIForDDMDeclaration:(id)a4
{
  os_log_type_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  if (v7) {
    id v4 = [(SUSUISoftwareUpdateController *)v9 getInitIfNeededDDMController];
  }
  -[SUSUIDDMController setDeclaration:](v9->_ddmController, "setDeclaration:", v7, &v7);
  objc_storeStrong(v5, 0);
  objc_storeStrong(location, 0);
}

- (id)getDDMUpdateDescriptor
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = [(SUManagerClient *)self->_client getDDMUpdateDescriptor];
  id v3 = v4[0];
  objc_storeStrong(v4, 0);

  return v3;
}

- (BOOL)isInstallationKeybagRequired
{
  return [(SUManagerClient *)self->_client isInstallationKeybagRequired] & 1;
}

- (void)client:(id)a3 presentingRecommendedUpdate:(id)a4 shouldPresent:(BOOL)a5
{
  os_log_type_t v24 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  BOOL v21 = a5;
  dispatch_assert_queue_V2(v24[3]);
  id v20 = (id)SUSUILog();
  os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
  {
    sub_2A844((uint64_t)v26, (uint64_t)"-[SUSUISoftwareUpdateController client:presentingRecommendedUpdate:shouldPresent:]", (uint64_t)v22, v21);
    _os_log_impl(&def_46F0, (os_log_t)v20, v19, "%s update:%@ shouldPresent:%d", v26, 0x1Cu);
  }
  objc_storeStrong(&v20, 0);
  if ([(dispatch_queue_t *)v24 settingsForeground] & 1)
  {
    id v17 = (id)SUSUILog();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
      sub_1A68C((uint64_t)v25, (uint64_t)"-[SUSUISoftwareUpdateController client:presentingRecommendedUpdate:shouldPresent:]");
      _os_log_impl(&def_46F0, (os_log_t)v17, v16, "%s: Not showing recommended update UI due to preferences being open", v25, 0xCu);
    }
    objc_storeStrong(&v17, 0);
  }
  else
  {
    id v5 = location[0];
    int v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    unsigned __int8 v11 = sub_2A8B4;
    id v12 = &unk_60238;
    BOOL v15 = v21;
    id v13 = v22;
    id v14 = v24;
    [v5 isDownloading:&v8];
    objc_storeStrong((id *)&v14, 0);
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 installTonightScheduled:(BOOL)a4 operationID:(id)a5
{
  BOOL v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v19 = a4;
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  dispatch_assert_queue_V2((dispatch_queue_t)v21->_clientQueue);
  if (v19)
  {
    id v17 = (id)SUSUILog();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v22, (uint64_t)v18);
      _os_log_impl(&def_46F0, (os_log_t)v17, v16, "Install Tonight (%@) is scheduled", v22, 0xCu);
    }
    objc_storeStrong(&v17, 0);
    id v6 = [(SUAutoInstallOperation *)v21->_scheduledTryTonightAutoInstallOperation id];
    unsigned __int8 v7 = [v6 isEqual:v18];

    if ((v7 & 1) == 0)
    {
      client = v21->_client;
      int v10 = _NSConcreteStackBlock;
      int v11 = -1073741824;
      int v12 = 0;
      id v13 = sub_2AD34;
      id v14 = &unk_600A8;
      BOOL v15 = v21;
      [(SUManagerClient *)client currentAutoInstallOperation:1 withResult:&v10];
      objc_storeStrong((id *)&v15, 0);
    }
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 rollbackReadyToStart:(id)a4 options:(id)a5 completion:(id)a6
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  id v14 = 0;
  objc_storeStrong(&v14, a6);
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1ADDC((uint64_t)v20, (uint64_t)"-[SUSUISoftwareUpdateController client:rollbackReadyToStart:options:completion:]", (uint64_t)v16, (uint64_t)v15);
    _os_log_impl(&def_46F0, oslog, type, "%s %@\nOptions: %@", v20, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v6 = +[SUSUIPreferences sharedInstance];
  unsigned __int8 v7 = [(SUSUIPreferences *)v6 preventRollbackPrompt];

  if (v7)
  {
    os_log_t v11 = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      sub_1A68C((uint64_t)v19, (uint64_t)"-[SUSUISoftwareUpdateController client:rollbackReadyToStart:options:completion:]");
      _os_log_impl(&def_46F0, v11, OS_LOG_TYPE_DEFAULT, "%s Preventing Rollback consent prompt due to user settings", v19, 0xCu);
    }
    objc_storeStrong((id *)&v11, 0);
    if (v14) {
      (*((void (**)(id, uint64_t, id, void))v14 + 2))(v14, 1, v16, 0);
    }
  }
  else
  {
    [(SUSUISoftwareUpdateController *)v18 _promptForRollbackConentAndPasscode:v16 withOptions:v15 withCompletion:v14];
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 rollbackDidStart:(id)a4
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v8->_clientQueue);
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1A638((uint64_t)v9, (uint64_t)"-[SUSUISoftwareUpdateController client:rollbackDidStart:]", (uint64_t)v6);
    _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "%s %@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 rollbackDidFinish:(id)a4
{
  int v8 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  dispatch_assert_queue_V2(v8[3]);
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1A638((uint64_t)v9, (uint64_t)"-[SUSUISoftwareUpdateController client:rollbackDidFinish:]", (uint64_t)v6);
    _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "%s %@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(dispatch_queue_t *)v8 _rollbackSucceeded:v6];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 rollbackDidFail:(id)a4 withError:(id)a5
{
  os_log_t v11 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  dispatch_assert_queue_V2(v11[3]);
  id v7 = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    sub_1A638((uint64_t)v12, (uint64_t)"-[SUSUISoftwareUpdateController client:rollbackDidFail:withError:]", (uint64_t)v9);
    _os_log_impl(&def_46F0, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "%s %@", v12, 0x16u);
  }
  objc_storeStrong(&v7, 0);
  [(dispatch_queue_t *)v11 _rollbackFailed:v9 withError:v8];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 scheduledRollbackReadyForReboot:(id)a4
{
  id v8 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  dispatch_assert_queue_V2(v8[3]);
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1A638((uint64_t)v9, (uint64_t)"-[SUSUISoftwareUpdateController client:scheduledRollbackReadyForReboot:]", (uint64_t)v6);
    _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "%s %@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(dispatch_queue_t *)v8 rollbackCompleted:v6];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)deviceBootedAfterSplatOnlyRollback:(id)a3 rollbackDescriptor:(id)a4
{
  id v8 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  dispatch_assert_queue_V2(v8[3]);
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1A68C((uint64_t)v9, (uint64_t)"-[SUSUISoftwareUpdateController deviceBootedAfterSplatOnlyRollback:rollbackDescriptor:]");
    _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "%s", v9, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(dispatch_queue_t *)v8 _bootedAfterRollback:v6];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 rollbackSuggested:(id)a4 info:(id)a5
{
  os_log_t v11 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  dispatch_assert_queue_V2(v11[3]);
  id v7 = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    sub_1A638((uint64_t)v12, (uint64_t)"-[SUSUISoftwareUpdateController client:rollbackSuggested:info:]", (uint64_t)v9);
    _os_log_impl(&def_46F0, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "%s %@", v12, 0x16u);
  }
  objc_storeStrong(&v7, 0);
  [(dispatch_queue_t *)v11 _rollbackSuggested:v9 info:v8];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)autoInstallOperationWasCancelled:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v5->_clientQueue);
  if (v5->_scheduledTryTonightAutoInstallOperation == location[0])
  {
    [(SUSUISoftwareUpdateController *)v5 _autoInstallOperationWasCancelled:location[0] withRepopStrategy:1];
  }
  else
  {
    [location[0] setDelegate:0];
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_2BAB8((uint64_t)v6, (uint64_t)location[0], (uint64_t)v5->_scheduledTryTonightAutoInstallOperation);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "Auto install operation (%p) cancelled, but we weren't tracking it (tracking %p currently).", v6, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)autoInstallOperationDidExpire:(id)a3 withError:(id)a4
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v12->_clientQueue);
  if (v12->_scheduledTryTonightAutoInstallOperation == location[0])
  {
    char v7 = 0;
    unsigned __int8 v5 = 0;
    if ((char *)[(SUSUISoftwareUpdateAlertModel *)v12->_alertModel alertFlow] == (char *)&dword_4 + 1)
    {
      id v8 = [(SUDownload *)v12->_updateToInstall descriptor];
      char v7 = 1;
      unsigned __int8 v5 = [v8 hideInstallAlert];
    }
    if (v7) {

    }
    uint64_t v4 = 0;
    if ((v5 & 1) == 0) {
      uint64_t v4 = 3;
    }
    [(SUSUISoftwareUpdateController *)v12 _autoInstallOperationDidExpire:location[0] withRepopStrategy:v4 error:v10];
  }
  else
  {
    [location[0] setDelegate:0];
    id v9 = (id)SUSUILog();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      sub_2BAB8((uint64_t)v13, (uint64_t)location[0], (uint64_t)v12->_scheduledTryTonightAutoInstallOperation);
      _os_log_impl(&def_46F0, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Auto install operation (%p) expired, but we weren't tracking it (tracking %p currently).", v13, 0x16u);
    }
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)autoInstallOperationDidConsent:(id)a3
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v4->_clientQueue);
  objc_storeStrong(location, 0);
}

- (void)autoInstallOperationIsReadyToInstall:(id)a3 withResponse:(id)a4
{
  os_log_type_t v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v24->_clientQueue);
  id v21 = (id)SUSUILog();
  os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
  {
    sub_2BAB8((uint64_t)v26, (uint64_t)location[0], (uint64_t)v24->_scheduledTryTonightAutoInstallOperation);
    _os_log_impl(&def_46F0, (os_log_t)v21, v20, "Received event that auto install operation is ready to install (operation = %p, currentlyScheduledOperation = %p).", v26, 0x16u);
  }
  objc_storeStrong(&v21, 0);
  if (v24->_scheduledTryTonightAutoInstallOperation && v24->_scheduledTryTonightAutoInstallOperation == location[0])
  {
    id v16 = objc_alloc_init(SUSUISoftwareUpdateInstallOptions);
    [(SUSUISoftwareUpdateInstallOptions *)v16 setAutomaticInstallAttempt:1];
    unsigned __int8 v5 = v24;
    uint64_t v4 = v16;
    char v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    id v10 = sub_2C12C;
    os_log_t v11 = &unk_60260;
    int v12 = v24;
    id v13 = v16;
    id v14 = location[0];
    id v15 = v22;
    [(SUSUISoftwareUpdateController *)v5 _isUpdateInstallableWithInstallOptions:v4 andResponse:&v7];
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong((id *)&v13, 0);
    objc_storeStrong((id *)&v12, 0);
    objc_storeStrong((id *)&v16, 0);
    int v17 = 0;
  }
  else
  {
    id v19 = (id)SUSUILog();
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      sub_2BAB8((uint64_t)v25, (uint64_t)location[0], (uint64_t)v24->_scheduledTryTonightAutoInstallOperation);
      _os_log_impl(&def_46F0, (os_log_t)v19, v18, "Auto install operation (%p) is ready to install, but we weren't tracking it (tracking %p currently).", v25, 0x16u);
    }
    objc_storeStrong(&v19, 0);
    int v17 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)autoInstallOperationPasscodePolicyDidChange:(id)a3 passcodePolicyType:(unint64_t)a4
{
  id v6 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2(v6[3]);
  [(dispatch_queue_t *)v6 _setPasscodePolicyType:a4];
  objc_storeStrong(location, 0);
}

- (void)_sendInstallTonightDidCompleteToObservers
{
  int v12 = self;
  SEL v11 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  memset(__b, 0, sizeof(__b));
  obj = v12->_observers;
  id v8 = [(NSHashTable *)obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v5);
      objc_msgSend(v10, "softwareUpdateControllerDidCompleteAutomaticInstallation:", v12, v6);
      ++v5;
      id v6 = (id)v2;
      if (v3 + 1 >= v2)
      {
        uint64_t v5 = 0;
        id v6 = [(NSHashTable *)obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }
}

- (void)alertModel:(id)a3 alertFlowDidChangeFrom:(unint64_t)a4 to:(unint64_t)a5
{
  id v19 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v17 = a4;
  unint64_t v16 = a5;
  dispatch_assert_queue_V2(v19[3]);
  id v15 = (id)SUSUILog();
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    log = v15;
    os_log_type_t type = v14;
    int v9 = SUSUIStringForInstallAlertFlow(v17);
    uint64_t v5 = v9;
    id v13 = v5;
    id v8 = SUSUIStringForInstallAlertFlow(v16);
    int v12 = v8;
    sub_8A10((uint64_t)v20, (uint64_t)v5, (uint64_t)v12);
    _os_log_impl(&def_46F0, log, type, "InstallAlertFlow changed from %{public}@ to %{public}@", v20, 0x16u);

    objc_storeStrong((id *)&v12, 0);
    objc_storeStrong((id *)&v13, 0);
  }
  objc_storeStrong(&v15, 0);
  if (v16 != 3 && v16 != 5) {
    [(dispatch_queue_t *)v19 _setTryTonightAutoInstallOperation:0 cancelIfNecessary:1];
  }
  objc_storeStrong(location, 0);
}

- (void)initPostOTAFollowUpController
{
  if (!self->_postUpdateController)
  {
    unint64_t v2 = [[_SUSUIPostUpdateAlertController alloc] initWithLayoutStateMonitor:self->_layoutStateMonitor alertPresentationManager:self->_alertPresentationManager];
    postUpdateController = self->_postUpdateController;
    self->_postUpdateController = v2;
  }
}

- (id)_stringForInstallNotAllowableReason:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      goto LABEL_18;
    case 1uLL:
      uint64_t v4 = @"Battery Low";
      break;
    case 2uLL:
      uint64_t v4 = @"Network Required";
      break;
    case 4uLL:
      uint64_t v4 = @"Insufficient Disk Space";
      break;
    case 8uLL:
      goto LABEL_22;
    case 0x10uLL:
      uint64_t v4 = @"Keybag Required";
      break;
    case 0x20uLL:
      uint64_t v4 = @"Passcode Locked";
      break;
    case 0x40uLL:
LABEL_22:
      uint64_t v4 = @"iCloud Restore";
      break;
    case 0x80uLL:
      uint64_t v4 = @"iTunes Sync";
      break;
    case 0x100uLL:
      uint64_t v4 = @"Phone Call";
      break;
    case 0x200uLL:
      uint64_t v4 = @"Carplay Connected";
      break;
    case 0x400uLL:
      uint64_t v4 = @"Media Playing";
      break;
    case 0x800uLL:
      uint64_t v4 = @"Driving";
      break;
    case 0x1000uLL:
      uint64_t v4 = @"Wombat Enabled";
      break;
    case 0x2000000uLL:
      uint64_t v4 = @"Already Installing";
      break;
    case 0x4000000uLL:
      uint64_t v4 = @"Temporary Delay";
      break;
    case 0x8000000uLL:
      uint64_t v4 = @"Not Installable";
      break;
    default:
LABEL_18:
      uint64_t v4 = @"None";
      break;
  }

  return v4;
}

- (id)_allNonInstallableReasons
{
  uint64_t v5 = (dispatch_once_t *)&unk_70448;
  id location = 0;
  objc_storeStrong(&location, &stru_60280);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  unint64_t v2 = (void *)qword_70440;

  return v2;
}

- (id)_waitableReasonsForShowingInstallAlert
{
  uint64_t v5 = (dispatch_once_t *)&unk_70458;
  id location = 0;
  objc_storeStrong(&location, &stru_602A0);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  unint64_t v2 = (void *)qword_70450;

  return v2;
}

- (int64_t)_springboardPasscodePolicyTypeFromSUPasscodePolicyType:(unint64_t)a3
{
  char v7 = self;
  SEL v6 = a2;
  unint64_t v5 = a3;
  switch(a3)
  {
    case 0uLL:
      return 0;
    case 1uLL:
      return 1;
    case 2uLL:
      return 2;
  }
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_16030((uint64_t)v9, v5);
    _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "Unknown SUPasscodePolicyType: %lu. Returning not required", v9, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  return 0;
}

- (void)_setPasscodePolicyType:(unint64_t)a3
{
  v45 = self;
  SEL v44 = a2;
  unint64_t v43 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (![(SUSUIDDMController *)v45->_ddmController shouldEnforceUpdate] || v43 == 2)
  {
    id v39 = objc_alloc_init((Class)SBSSoftwareUpdateService);
    id v19 = +[SUKeybagInterface sharedInstance];
    unsigned __int8 v20 = [(SUKeybagInterface *)v19 hasPasscodeSet];

    if (v20)
    {
      id v13 = +[SUSUIPreferences sharedInstance];
      id v3 = [(SUSUIPreferences *)v13 passcodeRequiredDays];
      BOOL v14 = v3 == 0;

      if (v14)
      {
        id v6 = [(SUDownload *)v45->_updateToInstall descriptor];
        unsigned __int8 v7 = [v6 forcePasscodeRequired];

        if (v7)
        {
          id v26 = (id)SUSUILog();
          os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v4 = v26;
            os_log_type_t v5 = v25;
            sub_5A1C(v24);
            _os_log_impl(&def_46F0, v4, v5, "Setting SBPasscodePolicy to required because ForcePasscodeRequired is set on descriptor", v24, 2u);
          }
          objc_storeStrong(&v26, 0);
          [v39 setPasscodePolicy:2];
        }
        else
        {
          id v23 = (id)SUSUILog();
          if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
          {
            sub_16030((uint64_t)v46, [(SUSUISoftwareUpdateController *)v45 _springboardPasscodePolicyTypeFromSUPasscodePolicyType:v43]);
            _os_log_impl(&def_46F0, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "Setting SBPasscodePolicy to: %ld", v46, 0xCu);
          }
          objc_storeStrong(&v23, 0);
          objc_msgSend(v39, "setPasscodePolicy:", -[SUSUISoftwareUpdateController _springboardPasscodePolicyTypeFromSUPasscodePolicyType:](v45, "_springboardPasscodePolicyTypeFromSUPasscodePolicyType:", v43));
        }
      }
      else
      {
        SEL v11 = +[SUSUIPreferences sharedInstance];
        id v10 = [(SUSUIPreferences *)v11 passcodeRequiredDays];
        id v12 = [v10 integerValue];

        v31[1] = v12;
        if (v12)
        {
          id v28 = (id)SUSUILog();
          os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
          {
            sub_16030((uint64_t)v47, [(SUSUISoftwareUpdateController *)v45 _springboardPasscodePolicyTypeFromSUPasscodePolicyType:v43]);
            _os_log_impl(&def_46F0, (os_log_t)v28, v27, "Setting SBPasscodePolicy to: %ld", v47, 0xCu);
          }
          objc_storeStrong(&v28, 0);
          objc_msgSend(v39, "setPasscodePolicy:", -[SUSUISoftwareUpdateController _springboardPasscodePolicyTypeFromSUPasscodePolicyType:](v45, "_springboardPasscodePolicyTypeFromSUPasscodePolicyType:", v43));
        }
        else
        {
          v31[0] = (id)SUSUILog();
          os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v31[0], OS_LOG_TYPE_DEFAULT))
          {
            id v8 = v31[0];
            os_log_type_t v9 = v30;
            sub_5A1C(v29);
            _os_log_impl(&def_46F0, v8, v9, "Setting SBPasscodePolicy to required regardless of requested policyType because passcodeRequiredDays is set to 0", v29, 2u);
          }
          objc_storeStrong(v31, 0);
          [v39 setPasscodePolicy:2];
        }
      }
      v45->_passcodePolicy = v43;
    }
    else
    {
      id v38 = [(SUSUISoftwareUpdateController *)v45 _springboardPasscodePolicyTypeFromSUPasscodePolicyType:0];
      if ([v39 passcodePolicy] == v38)
      {
        id v34 = (id)SUSUILog();
        os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = v34;
          os_log_type_t v16 = v33;
          sub_5A1C(v32);
          _os_log_impl(&def_46F0, v15, v16, "No passcode set on device. Not setting passcode policy", v32, 2u);
        }
        objc_storeStrong(&v34, 0);
      }
      else
      {
        id v37 = (id)SUSUILog();
        os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v17 = v37;
          os_log_type_t v18 = v36;
          sub_5A1C(v35);
          _os_log_impl(&def_46F0, v17, v18, "No passcode set on device. Setting passcode policy to not required", v35, 2u);
        }
        objc_storeStrong(&v37, 0);
        [v39 setPasscodePolicy:v38];
      }
      v45->_passcodePolicy = 0;
    }
    objc_storeStrong(&v39, 0);
  }
  else
  {
    id location = (id)SUSUILog();
    os_log_type_t v41 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = location;
      os_log_type_t type = v41;
      sub_5A1C(v40);
      _os_log_impl(&def_46F0, log, type, "[DDM] Blocked setting passcode to anything but required past enforced install date", v40, 2u);
    }
    objc_storeStrong(&location, 0);
  }
}

- (unint64_t)_getPasscodePolicy
{
  return self->_passcodePolicy;
}

- (BOOL)_createAutoInstallKeybagWithPasscode:(id)a3
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v19->_clientQueue);
  char v17 = 1;
  if ([(SUSUISoftwareUpdateController *)v19 _isAutoUpdateEnabled]
    || [(SUSUIDDMController *)v19->_ddmController shouldEnforceUpdate])
  {
    id v16 = objc_alloc_init((Class)SUKeybagOptions);
    [v16 setPasscode:location[0]];
    objc_msgSend(v16, "setKeybagType:");
    id v9 = [(SUDownload *)v19->_updateToInstall descriptor];
    objc_msgSend(v16, "setDescriptor:");

    char v17 = [(SUManagerClient *)v19->_client createInstallationKeybagWithOptions:v16] & 1;
    if ((v17 & 1) == 0)
    {
      id v15 = (id)SUSUILog();
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
      {
        log = v15;
        os_log_type_t type = v14;
        sub_5A1C(v13);
        _os_log_impl(&def_46F0, log, type, "Failed to create keybag", v13, 2u);
      }
      objc_storeStrong(&v15, 0);
    }
    objc_storeStrong(&v16, 0);
  }
  else
  {
    id v12 = (id)SUSUILog();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v5 = v12;
      os_log_type_t v6 = v11;
      sub_5A1C(v10);
      _os_log_impl(&def_46F0, v5, v6, "AutoInstall not allowed, so not creating keybag", v10, 2u);
    }
    objc_storeStrong(&v12, 0);
  }
  char v4 = v17;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (void)_autoInstallOperationWasCancelled:(id)a3 withRepopStrategy:(unint64_t)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)v13->_clientQueue);
  id v10 = (id)SUSUILog();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    log = v10;
    os_log_type_t type = v9;
    id v6 = [location[0] id];
    id v8 = v6;
    sub_548C((uint64_t)v14, (uint64_t)v8);
    _os_log_impl(&def_46F0, log, type, "Auto install operation (%@) was cancelled.", v14, 0xCu);

    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(&v10, 0);
  [(SUSUISoftwareUpdateController *)v13 _setTryTonightAutoInstallOperation:0 cancelIfNecessary:1];
  [(SUSUISoftwareUpdateAlertModel *)v13->_alertModel autoInstallOperationEnded:0];
  [(SUSUISoftwareUpdateController *)v13 _dismissInstallAlertsWithReason:@"Auto install operation cancelled" includingInstallTonight:1 withRealertStrategy:v11];
  objc_storeStrong(location, 0);
}

- (unint64_t)getPasscodePolicyForAlertModel:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v15 = 1;
  uint64_t v14 = 1;
  if (+[SUUtility currentReleaseTypeIsInternal])
  {
    id v13 = (id)SUSUILog();
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      sub_141D8((uint64_t)v18, 1);
      _os_log_impl(&def_46F0, (os_log_t)v13, v12, "Apple internal, changing passcode required days to %i", v18, 8u);
    }
    objc_storeStrong(&v13, 0);
    uint64_t v14 = 1;
  }
  os_log_type_t v9 = +[SUSUIPreferences sharedInstance];
  id v3 = [(SUSUIPreferences *)v9 passcodeRequiredDays];
  BOOL v10 = v3 == 0;

  if (!v10)
  {
    id v8 = +[SUSUIPreferences sharedInstance];
    id v7 = [(SUSUIPreferences *)v8 passcodeRequiredDays];
    uint64_t v14 = (uint64_t)[v7 integerValue];
  }
  id v11 = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    sub_16030((uint64_t)v17, v14);
    _os_log_impl(&def_46F0, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "Passcode required days set to %ld", v17, 0xCu);
  }
  objc_storeStrong(&v11, 0);
  if ((uint64_t)[location[0] autoUpdateRetryCount] > 1)
  {
    uint64_t v4 = (uint64_t)[location[0] autoUpdateRetryCount];
    if (!(v4 % v14)) {
      uint64_t v15 = 2;
    }
  }
  unint64_t v6 = v15;
  objc_storeStrong(location, 0);
  return v6;
}

- (void)_autoInstallOperationDidExpire:(id)a3 withRepopStrategy:(unint64_t)a4 error:(id)a5
{
  os_log_type_t v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v22 = a4;
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  dispatch_assert_queue_V2((dispatch_queue_t)v24->_clientQueue);
  id v20 = (id)SUSUILog();
  os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
  {
    sub_24660((uint64_t)v26, (uint64_t)location[0], (uint64_t)v21);
    _os_log_impl(&def_46F0, (os_log_t)v20, v19, "Auto install operation (%p) expired with error: %@", v26, 0x16u);
  }
  objc_storeStrong(&v20, 0);
  [(SUSUISoftwareUpdateAlertModel *)v24->_alertModel autoUpdateExpired];
  uint64_t v18 = 30;
  if (+[SUUtility currentReleaseTypeIsInternal])
  {
    id v17 = (id)SUSUILog();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
      sub_141D8((uint64_t)v25, 30);
      _os_log_impl(&def_46F0, (os_log_t)v17, v16, "Apple internal, changing auto update attempts to %i", v25, 8u);
    }
    objc_storeStrong(&v17, 0);
    uint64_t v18 = 30;
  }
  if ((char *)[(SUSUISoftwareUpdateAlertModel *)v24->_alertModel alertFlow] == (char *)&dword_4 + 1
    && (int64_t v5 = [(SUSUISoftwareUpdateAlertModel *)v24->_alertModel autoUpdateRetryCount], v5 < v18))
  {
    id v15 = 0;
    id v15 = [(SUSUISoftwareUpdateController *)v24 getPasscodePolicyForAlertModel:v24->_alertModel];
    client = v24->_client;
    os_log_type_t v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    os_log_type_t v12 = sub_2DDE4;
    id v13 = &unk_602C8;
    v14[0] = v24;
    v14[1] = v15;
    [(SUManagerClient *)client currentAutoInstallOperation:1 withResult:&v9];
    objc_storeStrong(v14, 0);
  }
  else
  {
    [(SUSUISoftwareUpdateController *)v24 _setTryTonightAutoInstallOperation:0 cancelIfNecessary:1];
    [(SUSUISoftwareUpdateAlertModel *)v24->_alertModel autoInstallOperationEnded:1];
    [(SUSUISoftwareUpdateController *)v24 _dismissInstallAlertsWithReason:@"Auto install operation expired" includingInstallTonight:1 withRealertStrategy:v22];
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (void)_installUpdate:(unint64_t)a3 withInstallOperation:(id)a4 source:(unint64_t)a5 options:(id)a6
{
  v49 = self;
  SEL v48 = a2;
  int v47 = (char *)a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  unint64_t v45 = a5;
  id v44 = 0;
  objc_storeStrong(&v44, a6);
  dispatch_assert_queue_V2((dispatch_queue_t)v49->_clientQueue);
  if (v49->_updateToInstall)
  {
    if (v44)
    {
      BOOL v43 = 0;
      BOOL v16 = 0;
      if ([v44 automaticInstallAttempt]) {
        BOOL v16 = v45 == 1;
      }
      BOOL v43 = v16;
      if (v16) {
        [v44 setInstallDark:1];
      }
    }
    id v42 = (id)SUSUILog();
    os_log_type_t v41 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEFAULT))
    {
      log = v42;
      os_log_type_t type = v41;
      id v15 = SUSUIStringForInstallType((uint64_t)v47);
      os_log_type_t v40 = v15;
      sub_8120((uint64_t)v51, (uint64_t)v40);
      _os_log_impl(&def_46F0, log, type, "Installation asked for of type: %{public}@", v51, 0xCu);

      objc_storeStrong((id *)&v40, 0);
    }
    objc_storeStrong(&v42, 0);
    [(SUSUISoftwareUpdateController *)v49 _realertWithStrategy:0 andReason:@"Install"];
    os_log_type_t v31 = _NSConcreteStackBlock;
    int v32 = -1073741824;
    int v33 = 0;
    id v34 = sub_2E544;
    char v35 = &unk_602F0;
    os_log_type_t v36 = v49;
    v38[1] = v47;
    id v37 = v44;
    v38[0] = location;
    id v39 = objc_retainBlock(&v31);
    char v30 = 0;
    char v30 = [(SUManagerClient *)v49->_client isInstallationKeybagRequired] & 1;
    if (!v30
      || (char *)[(SUSUISoftwareUpdateAlertModel *)v49->_alertModel alertFlow] == (char *)&dword_4 + 1)
    {
      (*((void (**)(void))v39 + 2))();
    }
    else
    {
      id v29 = (id)SUSUILog();
      os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = v29;
        os_log_type_t v11 = v28;
        BOOL v12 = 1;
        if (v47 != (unsigned char *)&def_46F0 + 1) {
          BOOL v12 = v47 == (unsigned char *)&def_46F0 + 2;
        }
        os_log_type_t v9 = SUSUIStringForInstallAlertFlow([(SUSUISoftwareUpdateAlertModel *)v49->_alertModel alertFlow]);
        os_log_type_t v27 = v9;
        sub_2E610((uint64_t)v50, v30 & 1, v12, (uint64_t)v27);
        _os_log_impl(&def_46F0, v10, v11, "Presenting authentication UI because: keybagRequired=%d, installTypeTonight? %d alertflow: %@", v50, 0x18u);

        objc_storeStrong((id *)&v27, 0);
      }
      objc_storeStrong(&v29, 0);
      id v7 = v49;
      os_log_type_t v19 = _NSConcreteStackBlock;
      int v20 = -1073741824;
      int v21 = 0;
      unint64_t v22 = sub_2E67C;
      id v23 = &unk_60318;
      id v26 = v39;
      id v24 = v44;
      os_log_type_t v25 = v49;
      unint64_t v6 = v47;
      id v8 = [location forecast];
      -[SUSUISoftwareUpdateController _presentAuthenticationUIForInstallation:withInstallType:withInstallOperationForecast:](v7, "_presentAuthenticationUIForInstallation:withInstallType:withInstallOperationForecast:", &v19, v6);

      objc_storeStrong((id *)&v25, 0);
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v26, 0);
    }
    objc_storeStrong(&v39, 0);
    objc_storeStrong(v38, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong((id *)&v36, 0);
  }
  else
  {
    [(SUSUISoftwareUpdateController *)v49 _dismissInstallAlertsWithReason:@"No update to install anymore" includingInstallTonight:1 withRealertStrategy:0];
  }
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&location, 0);
}

- (void)_doInstallNowWithOptions:(id)a3
{
  uint64_t v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v18->_clientQueue);
  if (!([location[0] automaticInstallAttempt] & 1)) {
    [(SUSUISoftwareUpdateAlertModel *)v18->_alertModel willInstallWithType:0];
  }
  id v15 = 0;
  if (location[0])
  {
    id v3 = objc_alloc((Class)SUInstallOptions);
    id v4 = [v3 initWithSUSUIInstallOptions:location[0]];
    id v5 = v15;
    id v15 = v4;
  }
  client = v18->_client;
  id v6 = v15;
  id v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  os_log_type_t v11 = sub_2E8CC;
  BOOL v12 = &unk_5D028;
  id v13 = location[0];
  uint64_t v14 = v18;
  [(SUManagerClient *)client installUpdateWithInstallOptions:v6 withResult:&v8];
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)_doInstallTonight:(id)a3 consent:(BOOL)a4
{
  uint64_t v18 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v16 = a4;
  dispatch_assert_queue_V2(v18[3]);
  dispatch_queue_t v6 = v18[6];
  if ([v6 alertFlow] == (char *)&dword_4 + 1) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [v6 willInstallWithType:v4];
  id v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  os_log_type_t v11 = sub_2ECC4;
  BOOL v12 = &unk_60340;
  id v13 = v18;
  BOOL v14 = v16;
  id v15 = objc_retainBlock(&v8);
  if ([location[0] _isValidForScheduling])
  {
    (*((void (**)(id, id))v15 + 2))(v15, location[0]);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_16030((uint64_t)v19, (uint64_t)location[0]);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "A software update 'try tonight' auto install operation (%p) was attempted to be scheduled, but it was already expired or cancelled when we got it.  Trying to fetch a new one.", v19, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(dispatch_queue_t *)v18 _createInstallTonightOperationWithResult:v15];
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_setPendingInstallOptions:(id)a3
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_pendingInstallOptions != location[0]) {
    objc_storeStrong((id *)&v4->_pendingInstallOptions, location[0]);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_isAutoUpdateEnabled
{
  return [(SUInstallPolicy *)self->_installPolicy autoUpdateEnabled] & 1;
}

- (void)_setInstallPolicy:(id)a3
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (([(SUInstallPolicy *)v4->_installPolicy isEqual:location[0]] & 1) == 0) {
    objc_storeStrong((id *)&v4->_installPolicy, location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)_setupAutoUpdate:(id)a3 withPasscodePolicy:(unint64_t)a4
{
  dispatch_queue_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v6->_clientQueue);
  [(SUSUISoftwareUpdateAlertModel *)v6->_alertModel willInstallWithType:2];
  [(SUSUISoftwareUpdateController *)v6 autoInstallTonightWithOperation:location[0]];
  [(SUSUISoftwareUpdateController *)v6 _setPasscodePolicyType:a4];
  objc_storeStrong(location, 0);
}

- (void)_setTryTonightAutoInstallOperation:(id)a3 cancelIfNecessary:(BOOL)a4
{
  os_log_type_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v9 = a4;
  if (v11->_scheduledTryTonightAutoInstallOperation != location[0])
  {
    [(SUAutoInstallOperation *)v11->_scheduledTryTonightAutoInstallOperation setDelegate:0];
    if (v11->_scheduledTryTonightAutoInstallOperation && v9)
    {
      os_log_t oslog = (os_log_t)(id)SUSUILog();
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        if (v9) {
          CFStringRef v4 = @"YES";
        }
        else {
          CFStringRef v4 = @"NO";
        }
        sub_2F41C((uint64_t)v13, (uint64_t)v11->_scheduledTryTonightAutoInstallOperation, (uint64_t)location[0], (uint64_t)v4);
        _os_log_impl(&def_46F0, oslog, type, "Cancelling current auto install operation (%{public}@) for new operation: %{public}@ (cancelIfNecessary: %@)", v13, 0x20u);
      }
      objc_storeStrong((id *)&oslog, 0);
      [(SUAutoInstallOperation *)v11->_scheduledTryTonightAutoInstallOperation cancel];
    }
    objc_storeStrong((id *)&v11->_scheduledTryTonightAutoInstallOperation, location[0]);
    if (v11->_scheduledTryTonightAutoInstallOperation)
    {
      [(SUAutoInstallOperation *)v11->_scheduledTryTonightAutoInstallOperation setDelegate:v11];
      os_log_t v6 = (os_log_t)(id)SUSUILog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        sub_8120((uint64_t)v12, (uint64_t)v11->_scheduledTryTonightAutoInstallOperation);
        _os_log_impl(&def_46F0, v6, OS_LOG_TYPE_DEFAULT, "Now tracking a new install tonight operation: %{public}@", v12, 0xCu);
      }
      objc_storeStrong((id *)&v6, 0);
      [(SUSUISoftwareUpdateController *)v11 _dismissInstallAlertsWithReason:@"install tonight scheduled" includingInstallTonight:1 withRealertStrategy:0];
    }
  }
  objc_storeStrong(location, 0);
}

- (void)_dismissInstallAlertsWithReason:(id)a3 includingInstallTonight:(BOOL)a4 withRealertStrategy:(unint64_t)a5
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUIAlertPresentationManager *)v8->_alertPresentationManager dismissAlertsOfClass:objc_opt_class() animated:1];
  if (a4)
  {
    [(SUSUIAlertPresentationManager *)v8->_alertPresentationManager dismissAlertsOfClass:objc_opt_class() animated:1];
    [(SUSUIFullScreenAlertPresentationManager *)v8->_fullScreenAlertPresentationManager dismissAlertsOfClass:objc_opt_class()];
  }
  [(SUSUISoftwareUpdateController *)v8 _realertWithStrategy:a5 andReason:location[0]];
  objc_storeStrong(location, 0);
}

- (BOOL)_isShowingInstallAlert
{
  id v24 = self;
  SEL v23 = a2;
  char v22 = 0;
  char v21 = 0;
  id v20 = [(SUSUIAlertPresentationManager *)self->_alertPresentationManager presentedAlerts];
  memset(__b, 0, 0x40uLL);
  id obj = v20;
  id v15 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
  if (v15)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0;
    id v13 = v15;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obj);
      }
      void __b[8] = *(void *)(__b[1] + 8 * v12);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      ++v12;
      if (v10 + 1 >= (unint64_t)v13)
      {
        uint64_t v12 = 0;
        id v13 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
        if (!v13) {
          goto LABEL_10;
        }
      }
    }
    char v22 = 1;
    int v18 = 2;
  }
  else
  {
LABEL_10:
    int v18 = 0;
  }

  id location = [(SUSUIFullScreenAlertPresentationManager *)v24->_fullScreenAlertPresentationManager activeFullScreenAlerts];
  memset(v16, 0, 0x40uLL);
  id v8 = location;
  id v9 = [v8 countByEnumeratingWithState:v16 objects:v25 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)v16[2];
    uint64_t v6 = 0;
    id v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)v16[2] != v5) {
        objc_enumerationMutation(v8);
      }
      v16[8] = *(void *)(v16[1] + 8 * v6);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0;
        id v7 = [v8 countByEnumeratingWithState:v16 objects:v25 count:16];
        if (!v7) {
          goto LABEL_19;
        }
      }
    }
    char v21 = 1;
    int v18 = 4;
  }
  else
  {
LABEL_19:
    int v18 = 0;
  }

  char v3 = 1;
  if ((v22 & 1) == 0) {
    char v3 = v21;
  }
  int v18 = 1;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v20, 0);
  return v3 & 1;
}

- (id)getNextLastPredictedUnlockDateFromDuet:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  id v24 = objc_alloc_init((Class)_CDSleepForAutoSu);
  if (location[0])
  {
    id v3 = [v24 predicitLastUnlockForDay:location[0]];
    id v4 = v25;
    id v25 = v3;

    id v23 = (id)SUSUILog();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      log = v23;
      os_log_type_t type = v22;
      id v16 = +[SUUtility prettyPrintDate:location[0]];
      id v12 = v16;
      id v21 = v12;
      id v15 = +[SUUtility prettyPrintDate:v25];
      id v20 = v15;
      sub_8A10((uint64_t)v28, (uint64_t)v12, (uint64_t)v20);
      _os_log_impl(&def_46F0, log, type, "[SUSUISoftwareUpdateController] Duet predicts the next last unlock date from %{public}@ is %{public}@", v28, 0x16u);

      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v21, 0);
    }
    objc_storeStrong(&v23, 0);
  }
  else
  {
    id v5 = [v24 predictNextDateForLastUnlockAttemptOfTheDay];
    id v6 = v25;
    id v25 = v5;

    id v19 = (id)SUSUILog();
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v19;
      os_log_type_t v10 = v18;
      id v11 = +[SUUtility prettyPrintDate:v25];
      id v17 = v11;
      sub_8120((uint64_t)v27, (uint64_t)v17);
      _os_log_impl(&def_46F0, v9, v10, "[SUSUISoftwareUpdateController] Duet predicts the next last unlock date from now is %{public}@", v27, 0xCu);

      objc_storeStrong(&v17, 0);
    }
    objc_storeStrong(&v19, 0);
  }
  id v8 = v25;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);

  return v8;
}

- (id)computeNextLastPredictedUnlockDateMinus4HoursFromStartDate:(id)a3
{
  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v47 = [(SUSUISoftwareUpdateController *)v49 getNextLastPredictedUnlockDateFromDuet:location[0]];
  id v46 = 0;
  char v43 = 0;
  if (location[0])
  {
    id v3 = (NSDate *)location[0];
  }
  else
  {
    id v44 = +[NSDate date];
    char v43 = 1;
    id v3 = v44;
  }
  id v45 = v3;
  if (v43) {

  }
  id v42 = +[NSCalendar autoupdatingCurrentCalendar];
  if (v47)
  {
    id v4 = [v42 dateByAddingUnit:32 value:-4 toDate:v47 options:0];
    id v5 = v46;
    id v46 = v4;
  }
  BOOL v41 = 0;
  char v39 = 0;
  BOOL v25 = 1;
  if (v46)
  {
    id v40 = [v46 earlierDate:v45];
    char v39 = 1;
    BOOL v25 = v40 == v46;
  }
  if (v39) {

  }
  BOOL v41 = v25;
  if (v25)
  {
    id v38 = (id)SUSUILog();
    os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
    {
      log = v38;
      os_log_type_t type = v37;
      id v24 = +[SUUtility prettyPrintDate:v46];
      id v20 = v24;
      id v36 = v20;
      id v23 = +[SUUtility prettyPrintDate:v45];
      id v35 = v23;
      sub_8A10((uint64_t)v52, (uint64_t)v20, (uint64_t)v35);
      _os_log_impl(&def_46F0, log, type, "[SUSUISoftwareUpdateController] Duet prediction -4 hours (%{public}@) is before start date (%{public}@) or nil.  Correcting to use hardcoded 8:00 PM on or after the start date.", v52, 0x16u);

      objc_storeStrong(&v35, 0);
      objc_storeStrong(&v36, 0);
    }
    objc_storeStrong(&v38, 0);
    id v34 = objc_msgSend(v42, "dateBySettingHour:minute:second:ofDate:options:", 20, 0, 0, v45);
    id v6 = [v34 earlierDate:v45];
    BOOL v19 = v6 != v34;

    if (!v19)
    {
      id v7 = [v42 dateByAddingUnit:16 value:1 toDate:v34 options:0];
      id v8 = v34;
      id v34 = v7;
    }
    objc_storeStrong(&v46, v34);
    objc_storeStrong(&v34, 0);
  }
  int v33 = +[SUUtility randomIntWithMinVal:maxVal:](SUUtility, "randomIntWithMinVal:maxVal:");
  int v32 = +[SUUtility randomIntWithMinVal:0 maxVal:59];
  id v31 = (id)SUSUILog();
  os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v31;
    os_log_type_t v17 = v30;
    id v18 = +[SUUtility prettyPrintDate:v46];
    id v29 = v18;
    sub_30364((uint64_t)v51, (uint64_t)v29, v33, v32);
    _os_log_impl(&def_46F0, v16, v17, "[SUSUISoftwareUpdateController] nextLastPredictedUnlockDateMinus4Hours date computed: %{public}@, adding jitter of %d minutes and %d seconds", v51, 0x18u);

    objc_storeStrong(&v29, 0);
  }
  objc_storeStrong(&v31, 0);
  id v9 = [v46 dateByAddingTimeInterval:(double)(60 * v33 + v32)];
  id v10 = v46;
  id v46 = v9;

  os_log_t oslog = (os_log_t)(id)SUSUILog();
  os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = oslog;
    os_log_type_t v14 = v27;
    id v15 = +[SUUtility prettyPrintDate:v46];
    id v26 = v15;
    sub_8120((uint64_t)v50, (uint64_t)v26);
    _os_log_impl(&def_46F0, v13, v14, "[SUSUISoftwareUpdateController] Final date computed: %{public}@", v50, 0xCu);

    objc_storeStrong(&v26, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v12 = v46;
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(location, 0);

  return v12;
}

- (id)_computeNextLastPredictedUnlockDateMinus4HoursFromNow
{
  id v4 = +[NSDate date];
  id v5 = -[SUSUISoftwareUpdateController computeNextLastPredictedUnlockDateMinus4HoursFromStartDate:](self, "computeNextLastPredictedUnlockDateMinus4HoursFromStartDate:");

  return v5;
}

- (int64_t)_delayDaysForSkips:(int64_t)a3 isRequiredInstall:(BOOL)a4
{
  int64_t v5 = 0;
  if (!a4)
  {
    if (a3) {
      return 3;
    }
    else {
      return 0;
    }
  }
  return v5;
}

- (id)_computeDefaultRealertDate
{
  id v44 = self;
  v43[1] = (id)a2;
  v43[0] = [(SUSUISoftwareUpdateController *)self _computeNextLastPredictedUnlockDateMinus4HoursFromNow];
  id v42 = 0;
  id v41 = [(SUSUISoftwareUpdateAlertModel *)v44->_alertModel currentInstallationPolicy];
  BOOL v40 = [v41 type] == (char *)&def_46F0 + 1;
  uint64_t v39 = 0;
  if (v40) {
    int64_t v26 = [(SUSUISoftwareUpdateAlertModel *)v44->_alertModel remindMeLaterCountSinceRequiringInstallation];
  }
  else {
    int64_t v26 = [(SUSUISoftwareUpdateAlertModel *)v44->_alertModel remindMeLaterCountForCurrentUpdate];
  }
  uint64_t v39 = v26;
  id v24 = +[SUSUIPreferences sharedInstance];
  unsigned __int8 v25 = [(SUSUIPreferences *)v24 alertAfterDownload];

  if ((v25 & 1) == 0 || v39)
  {
    if ((char *)[(SUSUISoftwareUpdateAlertModel *)v44->_alertModel alertFlow] != (char *)&dword_4 + 1)
    {
      id v42 = [(SUSUISoftwareUpdateController *)v44 _delayDaysForSkips:v39 isRequiredInstall:v40];
      if ((uint64_t)v42 > 0)
      {
        id v21 = +[NSCalendar currentCalendar];
        unint64_t v2 = [(NSCalendar *)v21 dateByAddingUnit:16 value:v42 toDate:v43[0] options:0];
        id v3 = v43[0];
        v43[0] = v2;
      }
      id v34 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
      BOOL v19 = +[NSDate date];
      unsigned __int8 v20 = objc_msgSend(v34, "isDate:inSameDayAsDate:", v43[0]);

      char v33 = v20 & 1;
      if (v20)
      {
        id v18 = +[NSCalendar currentCalendar];
        id v4 = [(NSCalendar *)v18 dateByAddingUnit:16 value:1 toDate:v43[0] options:0];
        id v5 = v43[0];
        v43[0] = v4;

        ++v42;
        id v32 = (id)SUSUILog();
        os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = v32;
          os_log_type_t v17 = v31;
          sub_5A1C(v30);
          _os_log_impl(&def_46F0, v16, v17, "calculated realert day is on the same day as today. Adding one day to realert date", v30, 2u);
        }
        objc_storeStrong(&v32, 0);
      }
      objc_storeStrong(&v34, 0);
    }
    id v29 = (id)SUSUILog();
    os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v29;
      os_log_type_t v14 = v28;
      uint64_t v9 = v39;
      CFStringRef v6 = @"Required";
      if (!v40) {
        CFStringRef v6 = @"Default";
      }
      uint64_t v10 = (uint64_t)v6;
      id v11 = [v41 skipsAllowed];
      uint64_t v12 = (uint64_t)v42;
      id v15 = +[SUUtility prettyPrintDate:v43[0]];
      id v27 = v15;
      sub_30A54((uint64_t)v46, v9, v10, (uint64_t)v11, v12, (uint64_t)v27);
      _os_log_impl(&def_46F0, v13, v14, "[SUSUISoftwareUpdateController] Compute default re-alert date consulting remind me later count (%ld) from policy [%{public}@] (skips allowed: %lu, delaying realert for %ld days) to determine if we need to adjust to one week later than computed time - adjusted time: %{public}@", v46, 0x34u);

      objc_storeStrong(&v27, 0);
    }
    objc_storeStrong(&v29, 0);
    id v45 = (NSDate *)v43[0];
    int v35 = 1;
  }
  else
  {
    id location = (id)SUSUILog();
    os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = location;
      os_log_type_t type = v37;
      sub_5A1C(v36);
      _os_log_impl(&def_46F0, log, type, "overriding installation alert date to now", v36, 2u);
    }
    objc_storeStrong(&location, 0);
    id v45 = +[NSDate date];
    int v35 = 1;
  }
  objc_storeStrong(&v41, 0);
  objc_storeStrong(v43, 0);
  id v7 = v45;

  return v7;
}

- (void)_realertWithStrategy:(unint64_t)a3 andReason:(id)a4
{
  os_log_type_t v37 = (dispatch_queue_t *)self;
  SEL v36 = a2;
  unint64_t v35 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  dispatch_assert_queue_V2(v37[3]);
  *((unsigned char *)v37 + 56) = 0;
  if (v35 != 6) {
    [(dispatch_queue_t *)v37 _unregisterForInstallationConstraintChangeNotifications];
  }
  *((unsigned char *)v37 + 57) = 0;
  [(dispatch_queue_t *)v37 _unregisterForUnlockNotifications];
  if (v37[4]
    && ([(dispatch_queue_t *)v37 _shouldShowOrScheduleInstallAlert] & 1) != 0)
  {
    if (([(dispatch_queue_t *)v37 canDeferInstallation] & 1) == 0
      && (v35 == 1 || v35 == 2))
    {
      id v33 = (id)SUSUILog();
      os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
      {
        log = v33;
        os_log_type_t type = v32;
        id v15 = SUSUIStringForInstallAlertRepopStrategy(v35);
        id v11 = v15;
        os_log_type_t v31 = v11;
        os_log_type_t v14 = SUSUIStringForInstallAlertRepopStrategy(7);
        os_log_type_t v30 = v14;
        sub_2F41C((uint64_t)v39, (uint64_t)v11, (uint64_t)v30, (uint64_t)location);
        _os_log_impl(&def_46F0, log, type, "[Install Alert] Repop strategy swizzled from %{public}@ to: %{public}@ due to inability to defer updates for install (External reason for change: %@)", v39, 0x20u);

        objc_storeStrong((id *)&v30, 0);
        objc_storeStrong((id *)&v31, 0);
      }
      objc_storeStrong(&v33, 0);
      unint64_t v35 = 7;
    }
    else
    {
      id v29 = (id)SUSUILog();
      os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = v29;
        os_log_type_t v9 = v28;
        uint64_t v10 = SUSUIStringForInstallAlertRepopStrategy(v35);
        id v27 = v10;
        sub_8384((uint64_t)v38, (uint64_t)v27, (uint64_t)location);
        _os_log_impl(&def_46F0, v8, v9, "[Install Alert] Repop strategy changed to: %{public}@ (Reason=%@)", v38, 0x16u);

        objc_storeStrong((id *)&v27, 0);
      }
      objc_storeStrong(&v29, 0);
    }
    id v26 = +[NSCalendar autoupdatingCurrentCalendar];
    id v25 = +[NSDate date];
    if (v35)
    {
      unint64_t v5 = v35;
      char v4 = 1;
    }
    else
    {
      unint64_t v5 = 0;
      char v4 = 0;
    }
    if ((v4 & 1) == 0)
    {
      switch(v5)
      {
        case 0uLL:
          [(dispatch_queue_t *)v37 _scheduleInstallAlertReminderWithDate:0 repopStrategy:v35 forReason:location];
          break;
        case 1uLL:
          id v24 = [(dispatch_queue_t *)v37 _computeDefaultRealertDate];
          [(dispatch_queue_t *)v37 _scheduleInstallAlertReminderWithDate:v24 repopStrategy:v35 forReason:location];
          objc_storeStrong(&v24, 0);
          break;
        case 2uLL:
          id v23 = [(dispatch_queue_t *)v37 _computeNextLastPredictedUnlockDateMinus4HoursFromNow];
          id v22 = [v26 dateByAddingUnit:16 value:7 toDate:v23 options:0];
          [(dispatch_queue_t *)v37 _scheduleInstallAlertReminderWithDate:v22 repopStrategy:v35 forReason:location];
          objc_storeStrong(&v22, 0);
          objc_storeStrong(&v23, 0);
          break;
        case 3uLL:
          [(dispatch_queue_t *)v37 _scheduleInstallAlertReminderWithDate:0 repopStrategy:v35 forReason:location];
          [(dispatch_queue_t *)v37 _showOrScheduleNextInstallAlert];
          break;
        case 4uLL:
          id v21 = [v26 dateByAddingUnit:128 value:5 toDate:v25 options:0];
          [(dispatch_queue_t *)v37 _scheduleInstallAlertReminderWithDate:v21 repopStrategy:v35 forReason:location];
          objc_storeStrong(&v21, 0);
          break;
        case 5uLL:
          id v20 = [v26 dateByAddingUnit:64 value:1 toDate:v25 options:0];
          [(dispatch_queue_t *)v37 _scheduleInstallAlertReminderWithDate:v20 repopStrategy:v35 forReason:location];
          objc_storeStrong(&v20, 0);
          break;
        case 6uLL:
          *((unsigned char *)v37 + 56) = 1;
          [(dispatch_queue_t *)v37 _scheduleInstallAlertReminderWithDate:0 repopStrategy:v35 forReason:location];
          [(dispatch_queue_t *)v37 _registerForInstallationConstraintChangedNotifications];
          break;
        case 7uLL:
          *((unsigned char *)v37 + 57) = 1;
          [(dispatch_queue_t *)v37 _scheduleInstallAlertReminderWithDate:0 repopStrategy:v35 forReason:location];
          [(dispatch_queue_t *)v37 _registerForUnlockNotifications];
          break;
        default:
          JUMPOUT(0);
      }
    }
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  else
  {
    id v19 = +[NSString stringWithFormat:@"No more update to install: %@", location];
    [(dispatch_queue_t *)v37 _scheduleInstallAlertReminderWithDate:0 repopStrategy:v35 forReason:v19];
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = oslog;
      os_log_type_t v7 = v17;
      sub_5A1C(v16);
      _os_log_impl(&def_46F0, v6, v7, "[Install Alert] Installation alert was halted due to not having an update to install anymore.", v16, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_storeStrong(&v19, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)_showSUAvailableAlertForDescriptor:(id)a3
{
  os_log_type_t v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (+[SUManagerClient _shouldDisallowAvailabilityNotifications])
  {
    id v15 = (id)SUSUILog();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      log = v15;
      os_log_type_t type = v14;
      sub_5A1C(v13);
      _os_log_impl(&def_46F0, log, type, "Ignoring SU availability notification because a preference has disabled them.", v13, 2u);
    }
    objc_storeStrong(&v15, 0);
    int v12 = 1;
  }
  else if ([location[0] hideInstallAlert])
  {
    id v11 = (id)SUSUILog();
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      char v4 = v11;
      os_log_type_t v5 = v10;
      sub_5A1C(v9);
      _os_log_impl(&def_46F0, v4, v5, "Ignoring SU availability notification because a descriptor specifies we hide SU alerts", v9, 2u);
    }
    objc_storeStrong(&v11, 0);
    int v12 = 1;
  }
  else
  {
    id v3 = [SUSUISoftwareUpdateAvailableAlertItem alloc];
    id v8 = [(SUSUIBaseSoftwareUpdateAlertItem *)v3 initWithDescriptor:location[0] softwareUpdateController:v17];
    [(SUSUIAlertPresentationManager *)v17->_alertPresentationManager presentAlert:v8 animated:1];
    objc_storeStrong((id *)&v8, 0);
    int v12 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)_unregisterForInstallationConstraintChangeNotifications
{
  os_log_type_t v7 = self;
  location[1] = (id)a2;
  if (self->_registeredForInstallationConstraintChanges)
  {
    location[0] = (id)SUSUILog();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      log = location[0];
      os_log_type_t type = v5;
      sub_5A1C(v4);
      _os_log_impl(&def_46F0, log, type, "Unregister for installation constraint changes.", v4, 2u);
    }
    objc_storeStrong(location, 0);
    v7->_registeredForInstallationConstraintChanges = 0;
    [(SUInvalidatable *)v7->_installationConstraintObserver invalidate];
    objc_storeStrong((id *)&v7->_installationConstraintObserver, 0);
    [(SUSUILayoutStateMonitor *)v7->_layoutStateMonitor removeObserver:v7];
  }
}

- (void)_registerForInstallationConstraintChangedNotifications
{
  id v19 = self;
  location[1] = (id)a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!v19->_registeredForInstallationConstraintChanges)
  {
    location[0] = (id)SUSUILog();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      log = location[0];
      os_log_type_t type = v17;
      sub_5A1C(v16);
      _os_log_impl(&def_46F0, log, type, "Register for installation constraint changes.", v16, 2u);
    }
    objc_storeStrong(location, 0);
    v19->_registeredForInstallationConstraintChanges = 1;
    [(SUSUILayoutStateMonitor *)v19->_layoutStateMonitor addObserver:v19];
    objc_initWeak(&v15, v19);
    client = v19->_client;
    updateToInstall = v19->_updateToInstall;
    id v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    id v11 = sub_31674;
    int v12 = &unk_60390;
    id v13 = v19;
    objc_copyWeak(&v14, &v15);
    unint64_t v2 = (SUInvalidatable *)[(SUManagerClient *)client observeInstallationConstraintChangesForDownload:updateToInstall observer:&v8];
    installationConstraintObserver = v19->_installationConstraintObserver;
    v19->_installationConstraintObserver = v2;

    objc_destroyWeak(&v14);
    objc_storeStrong((id *)&v13, 0);
    objc_destroyWeak(&v15);
  }
}

- (void)_registerForUnlockNotifications
{
  if (!self->_uiLockedLayoutStateMonitor)
  {
    unint64_t v2 = objc_alloc_init(SUSUILayoutStateMonitor);
    uiLockedLayoutStateMonitor = self->_uiLockedLayoutStateMonitor;
    self->_uiLockedLayoutStateMonitor = v2;
  }
  [(SUSUILayoutStateMonitor *)self->_uiLockedLayoutStateMonitor addObserver:self];
}

- (void)_unregisterForUnlockNotifications
{
  if (self->_uiLockedLayoutStateMonitor)
  {
    [(SUSUILayoutStateMonitor *)self->_uiLockedLayoutStateMonitor removeObserver:self];
    objc_storeStrong((id *)&self->_uiLockedLayoutStateMonitor, 0);
  }
}

- (void)setUpdateToInstall:(id)a3
{
  char v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_updateToInstall != location[0]) {
    objc_storeStrong((id *)&v4->_updateToInstall, location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)_showOrScheduleNextInstallAlertFromTimer:(id)a3
{
  int v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)SUSUILog();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    log = v7;
    os_log_type_t type = v6;
    sub_5A1C(v5);
    _os_log_impl(&def_46F0, log, type, "Timer fired for install alert", v5, 2u);
  }
  objc_storeStrong(&v7, 0);
  [(SUSUISoftwareUpdateController *)v9 _showOrScheduleNextInstallAlert];
  objc_storeStrong(location, 0);
}

- (void)_showOrScheduleNextInstallAlert
{
  v8[2] = self;
  v8[1] = (id)a2;
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  os_log_type_t v6 = sub_31C00;
  id v7 = &unk_603B8;
  v8[0] = self;
  -[SUSUISoftwareUpdateController _isUpdateInstallable:](self, "_isUpdateInstallable:");
  objc_storeStrong(v8, 0);
}

- (BOOL)_showNextInstallAlertWithReasons:(int64_t)a3 orScheduleIfNecessary:(BOOL)a4
{
  return [(SUSUISoftwareUpdateController *)self _showNextInstallAlertWithReasons:a3 orScheduleIfNecessary:a4 withInstallOptions:0];
}

- (BOOL)_showNextInstallAlertWithReasons:(int64_t)a3 orScheduleIfNecessary:(BOOL)a4 withInstallOptions:(id)a5
{
  char v43 = self;
  SEL v42 = a2;
  int64_t v41 = a3;
  BOOL v40 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  dispatch_assert_queue_V2((dispatch_queue_t)v43->_clientQueue);
  id v38 = (id)SUSUILog();
  os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
  {
    log = v38;
    os_log_type_t type = v37;
    id v23 = (id)SUStringFromInstallationConstraints();
    id v36 = v23;
    sub_324C4((uint64_t)v46, (uint64_t)"-[SUSUISoftwareUpdateController _showNextInstallAlertWithReasons:orScheduleIfNecessary:withInstallOptions:]", (uint64_t)v36, v40, (uint64_t)location);
    _os_log_impl(&def_46F0, log, type, "%s: reasons: %@, scheduleIfNecessary: %d, options: %@", v46, 0x26u);

    objc_storeStrong(&v36, 0);
  }
  objc_storeStrong(&v38, 0);
  if (v40) {
    [(SUSUISoftwareUpdateController *)v43 _realertWithStrategy:0 andReason:@"_showNextInstallAlertWithReason"];
  }
  int64_t v35 = v41;
  BOOL v34 = (v41 & 0x10) != 0;
  if ((v41 & 0x10) == 0
    || (char *)[(SUSUISoftwareUpdateAlertModel *)v43->_alertModel alertFlow] == (char *)&def_46F0 + 2)
  {
    if (!v34
      && (char *)[(SUSUISoftwareUpdateAlertModel *)v43->_alertModel alertFlow] == (char *)&def_46F0 + 2)
    {
      v35 &= ~0x20uLL;
    }
  }
  else
  {
    v35 &= ~0x10uLL;
  }
  if ((char *)[(SUSUIDDMController *)v43->_ddmController decideAlertConflictWithAlertFlow:[(SUSUISoftwareUpdateAlertModel *)v43->_alertModel alertFlow]] == (char *)&def_46F0 + 1)
  {
    id v33 = (id)SUSUILog();
    os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v33;
      os_log_type_t v19 = v32;
      id v20 = SUSUIStringForInstallAlertFlow([(SUSUISoftwareUpdateAlertModel *)v43->_alertModel alertFlow]);
      os_log_type_t v31 = v20;
      sub_548C((uint64_t)v45, (uint64_t)v31);
      _os_log_impl(&def_46F0, v18, v19, "Can't show classic flow alert due to DDM having higher priority. Classic flow: %@", v45, 0xCu);

      objc_storeStrong((id *)&v31, 0);
    }
    objc_storeStrong(&v33, 0);
    v35 |= 0x4000000uLL;
  }
  if ((char *)[(SUSUISoftwareUpdateAlertModel *)v43->_alertModel alertFlow] == (char *)&dword_4 + 1) {
    int64_t v35 = 0;
  }
  if (![(SUSUISoftwareUpdateController *)v43 _shouldShowOrScheduleInstallAlert]) {
    goto LABEL_46;
  }
  if (!v35)
  {
    if ([(SUSUISoftwareUpdateController *)v43 _needsToWaitForHomescreenToAppear])
    {
      if (v40)
      {
        [(SUSUISoftwareUpdateAlertModel *)v43->_alertModel countdownAlertPresentationPreventedForReasons:@"Waiting for homescreen when showing countdown alert"];
        [(SUSUISoftwareUpdateController *)v43 _realertWithStrategy:6 andReason:@"Wait for homescreen to appear"];
      }
      char v44 = 0;
      int v30 = 1;
    }
    else
    {
      [(SUSUISoftwareUpdateController *)v43 _showInstallAlertWithInstallOptions:location];
      char v44 = 1;
      int v30 = 1;
    }
    goto LABEL_47;
  }
  if ((v35 & 0x2000000) != 0)
  {
    char v44 = 0;
    int v30 = 1;
    goto LABEL_47;
  }
  if ((v35 & 0x4000000) != 0)
  {
    if (v40)
    {
      id v16 = v43;
      id v17 = [(SUSUISoftwareUpdateController *)v43 _stringForInstallNotAllowableReason:0x4000000];
      -[SUSUISoftwareUpdateController _realertWithStrategy:andReason:](v16, "_realertWithStrategy:andReason:", 5);
    }
    char v44 = 0;
    int v30 = 1;
    goto LABEL_47;
  }
  if ((v35 & 0x8000000) != 0)
  {
    if (v40)
    {
      id v14 = v43;
      id v15 = [(SUSUISoftwareUpdateController *)v43 _stringForInstallNotAllowableReason:0x8000000];
      -[SUSUISoftwareUpdateController _resetStateForReason:](v14, "_resetStateForReason:");
    }
    char v44 = 0;
    int v30 = 1;
    goto LABEL_47;
  }
  id v29 = 0;
  id v11 = v43;
  int64_t v10 = v35;
  id v12 = [(SUSUISoftwareUpdateController *)v43 _waitableReasonsForShowingInstallAlert];
  id v27 = v29;
  unsigned __int8 v13 = -[SUSUISoftwareUpdateController _doesStateContainNonInstallableReasons:reasonsToCheck:outMatchingReasonsString:](v11, "_doesStateContainNonInstallableReasons:reasonsToCheck:outMatchingReasonsString:", v10);
  objc_storeStrong(&v29, v27);

  char v28 = v13 & 1;
  if (v13) {
    goto LABEL_50;
  }
  uint64_t v5 = 0;
  uint64_t v26 = 0;
  if ((v35 & 4) != 0) {
    uint64_t v5 = 4;
  }
  v26 |= v5;
  if (v26 && v40)
  {
    int v9 = +[NSNumber numberWithInteger:v26];
    id v25 = +[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:");

    id v24 = +[NSError errorWithDomain:SUErrorDomain code:20 userInfo:v25];
    [(SUSUISoftwareUpdateController *)v43 _handleInstallError:v24];
    char v44 = 0;
    int v30 = 1;
    objc_storeStrong((id *)&v24, 0);
    objc_storeStrong((id *)&v25, 0);
  }
  else
  {
LABEL_50:
    if (v40)
    {
      if ((char *)[(SUSUISoftwareUpdateAlertModel *)v43->_alertModel alertFlow] == (char *)&def_46F0 + 2)
      {
        alertModel = v43->_alertModel;
        id v8 = +[NSString stringWithFormat:@"Unmet constraints when showing countdown alert: %ld", v35];
        -[SUSUISoftwareUpdateAlertModel countdownAlertPresentationPreventedForReasons:](alertModel, "countdownAlertPresentationPreventedForReasons:");
      }
      [(SUSUISoftwareUpdateController *)v43 _realertWithStrategy:6 andReason:v29];
    }
    int v30 = 0;
  }
  objc_storeStrong(&v29, 0);
  if (!v30)
  {
LABEL_46:
    char v44 = 0;
    int v30 = 1;
  }
LABEL_47:
  objc_storeStrong(&location, 0);
  return v44 & 1;
}

- (BOOL)_needsToWaitForHomescreenToAppear
{
  id v36 = self;
  SEL v35 = a2;
  char v34 = 0;
  char v34 = [(SUSUILayoutStateMonitor *)self->_layoutStateMonitor isHomeScreenForeground];
  char v33 = [(SUSUISoftwareUpdateController *)v36 settingsForeground];
  char v32 = 0;
  char v32 = [(SUManagerClient *)v36->_client isInstallationKeybagRequired] & 1;
  char v31 = [(SUSUISoftwareUpdateController *)v36 isUILocked];
  char v30 = 0;
  char v30 = [(SUManagerClient *)v36->_client isAnyClientInUserInteraction] & 1;
  id v29 = (id)SUSUILog();
  os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
  {
    log = v29;
    os_log_type_t type = v28;
    CFStringRef v2 = @"Yes";
    if (v31) {
      CFStringRef v3 = @"Yes";
    }
    else {
      CFStringRef v3 = @"No";
    }
    uint64_t v18 = (uint64_t)v3;
    if (v32) {
      CFStringRef v4 = @"Yes";
    }
    else {
      CFStringRef v4 = @"No";
    }
    uint64_t v19 = (uint64_t)v4;
    if ((v34 & 1) == 0) {
      CFStringRef v2 = @"No";
    }
    uint64_t v20 = (uint64_t)v2;
    id v23 = SUSUIStringForInstallAlertFlow([(SUSUISoftwareUpdateAlertModel *)v36->_alertModel alertFlow]);
    id v27 = v23;
    sub_32900((uint64_t)v39, v18, v19, v20, (uint64_t)v27);
    _os_log_impl(&def_46F0, log, type, "UI Locked: %@, needsHomescreenForInstallAlert: %@, isShowingHomescreen: %@, alert flow: %@", v39, 0x2Au);

    objc_storeStrong((id *)&v27, 0);
  }
  objc_storeStrong(&v29, 0);
  if (v31)
  {
    char v37 = v32 & 1;
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = oslog;
      os_log_type_t v16 = v25;
      CFStringRef v5 = @"Yes";
      if (v33) {
        CFStringRef v6 = @"Yes";
      }
      else {
        CFStringRef v6 = @"No";
      }
      uint64_t v11 = (uint64_t)v6;
      if (v32) {
        CFStringRef v7 = @"Yes";
      }
      else {
        CFStringRef v7 = @"No";
      }
      uint64_t v12 = (uint64_t)v7;
      if (v34) {
        CFStringRef v8 = @"Yes";
      }
      else {
        CFStringRef v8 = @"No";
      }
      uint64_t v13 = (uint64_t)v8;
      if ((v30 & 1) == 0) {
        CFStringRef v5 = @"No";
      }
      uint64_t v14 = (uint64_t)v5;
      id v17 = SUSUIStringForInstallAlertFlow([(SUSUISoftwareUpdateAlertModel *)v36->_alertModel alertFlow]);
      id v24 = v17;
      sub_3297C((uint64_t)v38, v11, v12, v13, v14, (uint64_t)v24);
      _os_log_impl(&def_46F0, v15, v16, "UI not locked. inPreferences: %@, needsHomescreenForInstallAlert: %@, isShowingHomescreen: %@, isClientInUserInteraction:%@, alert flow: %@", v38, 0x34u);

      objc_storeStrong((id *)&v24, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v34 & 1) != 0 || (char v10 = 1, (v33)) {
      char v10 = v30;
    }
    char v37 = v10 & 1;
  }
  return v37 & 1;
}

- (void)_isUpdateInstallableWithInstallOptions:(id)a3 andResponse:(id)a4
{
  id v24 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  dispatch_assert_queue_V2(v24[3]);
  id v21 = 0;
  if (location[0])
  {
    id v4 = objc_alloc((Class)SUInstallOptions);
    id v5 = [v4 initWithSUSUIInstallOptions:location[0]];
    id v6 = v21;
    id v21 = v5;
  }
  v17[0] = 0;
  v17[1] = v17;
  int v18 = 0x20000000;
  int v19 = 32;
  uint64_t v20 = 0;
  dispatch_queue_t v8 = v24[2];
  id v7 = v21;
  char v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  uint64_t v13 = sub_32C04;
  uint64_t v14 = &unk_603E0;
  v16[1] = v17;
  id v15 = v24;
  v16[0] = v22;
  [v8 isUpdateReadyForInstallationWithOptions:v7 withResult:&v10];
  objc_storeStrong(v16, 0);
  objc_storeStrong((id *)&v15, 0);
  _Block_object_dispose(v17, 8);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)_isUpdateInstallable:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateController *)v4 _isUpdateInstallableWithInstallOptions:0 andResponse:location[0]];
  objc_storeStrong(location, 0);
}

- (BOOL)_doesStateContainNonInstallableReasons:(int64_t)a3 reasonsToCheck:(id)a4 outMatchingReasonsString:(id *)a5
{
  id v29 = self;
  SEL v28 = a2;
  int64_t v27 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  os_log_type_t v25 = a5;
  char v24 = 0;
  char v21 = 0;
  if (a5)
  {
    id v22 = objc_alloc_init((Class)NSMutableString);
    char v21 = 1;
    id v5 = v22;
  }
  else
  {
    id v5 = 0;
  }
  id v23 = v5;
  if (v21) {

  }
  memset(__b, 0, sizeof(__b));
  id obj = location;
  id v16 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
  if (v16)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0;
    id v14 = v16;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(id *)(__b[1] + 8 * v13);
      unint64_t v18 = (unint64_t)[v20 integerValue];
      if ((v27 & v18) == v18)
      {
        char v24 = 1;
        id v9 = v23;
        id v10 = [(SUSUISoftwareUpdateController *)v29 _stringForInstallNotAllowableReason:v18];
        [v9 appendFormat:@"%@, ", v10];
      }
      ++v13;
      if (v11 + 1 >= (unint64_t)v14)
      {
        uint64_t v13 = 0;
        id v14 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
        if (!v14) {
          break;
        }
      }
    }
  }

  if (v23 && v25)
  {
    if ((v24 & 1) == 0) {
      [v23 appendString:@"None"];
    }
    id v6 = v23;
    *os_log_type_t v25 = v6;
  }
  char v8 = v24;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&location, 0);
  return v8 & 1;
}

- (void)_dismissInstallFailureAlertsWithoutRepop
{
  uint64_t v11 = self;
  SEL v10 = a2;
  memset(__b, 0, sizeof(__b));
  id obj = [(SUSUIAlertPresentationManager *)v11->_alertPresentationManager presentedAlertsOfClass:objc_opt_class()];
  id v7 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
  if (v7)
  {
    uint64_t v3 = *(void *)__b[2];
    uint64_t v4 = 0;
    id v5 = v7;
    while (1)
    {
      uint64_t v2 = v4;
      if (*(void *)__b[2] != v3) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(id *)(__b[1] + 8 * v4);
      [v9 setActionTaken:1];
      [v9 dismissAlert];
      ++v4;
      if (v2 + 1 >= (unint64_t)v5)
      {
        uint64_t v4 = 0;
        id v5 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }
}

- (void)_showInstallAlertWithInstallOptions:(id)a3
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (+[SUManagerClient _shouldDisallowAvailabilityNotifications])
  {
    id v18 = (id)SUSUILog();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
    {
      log = v18;
      os_log_type_t type = v17;
      sub_5A1C(v16);
      _os_log_impl(&def_46F0, log, type, "[Install Alert] Ignoring SU availability notification because a preference has disabled them.", v16, 2u);
    }
    objc_storeStrong(&v18, 0);
    int v15 = 1;
  }
  else
  {
    [(SUSUISoftwareUpdateController *)v20 _dismissInstallAlertsWithReason:@"Dismissing existing install alerts to show a new one." includingInstallTonight:1 withRealertStrategy:0];
    [(SUSUISoftwareUpdateController *)v20 _dismissInstallFailureAlertsWithoutRepop];
    id v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    SEL v10 = sub_33924;
    uint64_t v11 = &unk_5D000;
    uint64_t v12 = v20;
    id v13 = location[0];
    id v14 = objc_retainBlock(&v7);
    if (v20->_scheduledTryTonightAutoInstallOperation)
    {
      uint64_t v3 = (void (**)(void))v14;
      id v4 = [(SUAutoInstallOperation *)v20->_scheduledTryTonightAutoInstallOperation forecast];
      v3[2]();
    }
    else
    {
      [(SUSUISoftwareUpdateController *)v20 _createInstallTonightForecastWithResult:v14];
    }
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v13, 0);
    objc_storeStrong((id *)&v12, 0);
    int v15 = 0;
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_shouldShowOrScheduleInstallAlert
{
  LOBYTE(v3) = 0;
  if ([(SUSUISoftwareUpdateAlertModel *)self->_alertModel alertFlow]) {
    unsigned int v3 = ![(SUSUISoftwareUpdateController *)self _shouldHideAlert];
  }
  return v3 & 1;
}

- (void)_scheduleInstallAlertReminderWithDate:(id)a3 repopStrategy:(unint64_t)a4 forReason:(id)a5
{
  char v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v32 = a4;
  id v31 = 0;
  objc_storeStrong(&v31, a5);
  [(PCPersistentTimer *)v34->_installTimer invalidate];
  objc_storeStrong((id *)&v34->_installTimer, 0);
  if (location[0])
  {
    id v20 = +[SUSUIPreferences sharedInstance];
    id v5 = [(SUSUIPreferences *)v20 installAlertIntervalMinutes];
    BOOL v21 = v5 == 0;

    if (!v21)
    {
      id v18 = +[SUSUIPreferences sharedInstance];
      id v17 = [(SUSUIPreferences *)v18 installAlertIntervalMinutes];
      id v19 = [v17 integerValue];

      id v30 = v19;
      double v29 = (double)(60 * (uint64_t)v19);
      id v6 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceNow:v29];
      id v7 = location[0];
      location[0] = v6;
    }
  }
  [(SUSUISoftwareUpdateAlertModel *)v34->_alertModel setPersistedInstallAlertRepopStrategy:v32 withFireDate:location[0]];
  if (location[0])
  {
    [(SUManagerClient *)v34->_client registerCSInstallPredicatesOnDate:location[0]];
    id v28 = (id)SUSUILog();
    os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
    {
      log = v28;
      os_log_type_t type = v27;
      id v16 = +[SUUtility prettyPrintDate:location[0]];
      id v11 = v16;
      id v26 = v11;
      id v12 = v31;
      int v15 = SUSUIStringForInstallAlertRepopStrategy(v32);
      os_log_type_t v25 = v15;
      sub_3429C((uint64_t)v36, (uint64_t)v11, (uint64_t)v12, (uint64_t)v25);
      _os_log_impl(&def_46F0, log, type, "[Install Alert] Scheduling new software update install alert reminder at %{public}@ for reason: %@ (repopStrategy: %@)", v36, 0x20u);

      objc_storeStrong((id *)&v25, 0);
      objc_storeStrong(&v26, 0);
    }
    objc_storeStrong(&v28, 0);
    id v8 = objc_alloc((Class)PCPersistentTimer);
    int v9 = (PCPersistentTimer *)[v8 initWithFireDate:location[0] serviceIdentifier:@"SoftwareUpdateInstallAlertReminder" target:v34 selector:"_showOrScheduleNextInstallAlertFromTimer:" userInfo:0];
    installTimer = v34->_installTimer;
    v34->_installTimer = v9;

    [(PCPersistentTimer *)v34->_installTimer setDisableSystemWaking:1];
    [(PCPersistentTimer *)v34->_installTimer setUserVisible:1];
    [(PCPersistentTimer *)v34->_installTimer setMinimumEarlyFireProportion:1.0];
    [(PCPersistentTimer *)v34->_installTimer scheduleInQueue:v34->_clientQueue];
  }
  else
  {
    id v24 = (id)SUSUILog();
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v35, (uint64_t)v31);
      _os_log_impl(&def_46F0, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "[Install Alert] Cleared software update install alert reminder date for reason: %@", v35, 0xCu);
    }
    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

- (void)_handleInstallError:(id)a3
{
  double v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v27 = 0;
  char v27 = ![(SUSUILayoutStateMonitor *)v29->_layoutStateMonitor isScreenOn];
  char v26 = BYSetupAssistantNeedsToRun() & 1;
  char v25 = 0;
  if (![(SUSUISoftwareUpdateInstallOptions *)v29->_pendingInstallOptions automaticInstallAttempt]|| (char v15 = 1, (v27 & 1) == 0))
  {
    char v15 = v26;
  }
  char v25 = v15 & 1;
  if (v15)
  {
    id v24 = (id)SUSUILog();
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      if (v26) {
        CFStringRef v3 = @"Buddy is running";
      }
      else {
        CFStringRef v3 = @"screen was off and we're coming from an automatic installation attempt.";
      }
      sub_548C((uint64_t)v30, (uint64_t)v3);
      _os_log_impl(&def_46F0, (os_log_t)v24, v23, "Not showing install failure alert because %@", v30, 0xCu);
    }
    objc_storeStrong(&v24, 0);
LABEL_26:
    int v18 = 0;
    goto LABEL_27;
  }
  id v13 = [location[0] domain];
  BOOL v14 = 0;
  if ([v13 isEqualToString:SUErrorDomain]) {
    BOOL v14 = [location[0] code] == (char *)&dword_C + 2;
  }

  if (v14)
  {
    id v22 = (id)SUSUILog();
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v22;
      os_log_type_t type = v21;
      sub_5A1C(v20);
      _os_log_impl(&def_46F0, v11, type, "Not showing install failure alert because install is already in progress.", v20, 2u);
    }
    objc_storeStrong(&v22, 0);
    goto LABEL_26;
  }
  id v9 = [location[0] domain];
  BOOL v10 = 0;
  if ([v9 isEqualToString:SUErrorDomain]) {
    BOOL v10 = [location[0] code] == (char *)&dword_10 + 3;
  }

  if (!v10)
  {
    char v17 = 0;
    unsigned __int8 v6 = 1;
    if (![(SUSUISoftwareUpdateController *)v29 _isMultiUserAppleId])
    {
      unsigned __int8 v6 = 1;
      if (![(SUSUISoftwareUpdateController *)v29 installErrorWillScheduleAutoInstall:location[0]])unsigned __int8 v6 = [(SUSUISoftwareUpdateController *)v29 installErrorWhenNotReadyForManagedRequest:location[0]]; {
    }
      }
    char v17 = v6 & 1;
    if ((v6 & 1) == 0)
    {
      id v4 = [SUSUISoftwareUpdateUnableToInstallAlertItem alloc];
      id v5 = [(SUDownload *)v29->_updateToInstall descriptor];
      id v16 = -[SUSUIBaseSoftwareUpdateAlertItem initWithDescriptor:softwareUpdateController:](v4, "initWithDescriptor:softwareUpdateController:");

      [(SUSUISoftwareUpdateUnableToInstallAlertItem *)v16 setError:location[0]];
      [(SUSUIBaseAlertItem *)v16 setIsUILocked:[(SUSUISoftwareUpdateController *)v29 isUILocked]];
      [(SUSUIAlertPresentationManager *)v29->_alertPresentationManager presentAlert:v16 animated:1];
      objc_storeStrong((id *)&v16, 0);
    }
    goto LABEL_26;
  }
  id v7 = [SUSUISoftwareUpdateVerificationFailedAlertItem alloc];
  id v8 = [(SUDownload *)v29->_updateToInstall descriptor];
  id v19 = -[SUSUIBaseSoftwareUpdateAlertItem initWithDescriptor:softwareUpdateController:](v7, "initWithDescriptor:softwareUpdateController:");

  [(SUSUIBaseAlertItem *)v19 setIsUILocked:[(SUSUISoftwareUpdateController *)v29 isUILocked]];
  [(SUSUISoftwareUpdateVerificationFailedAlertItem *)v19 setError:location[0]];
  [(SUSUIAlertPresentationManager *)v29->_alertPresentationManager presentAlert:v19 animated:1];
  int v18 = 1;
  objc_storeStrong((id *)&v19, 0);
LABEL_27:
  objc_storeStrong(location, 0);
}

- (BOOL)installErrorWillScheduleAutoInstall:(id)a3
{
  char v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = [location[0] domain];
  BOOL v9 = 0;
  if ([v8 isEqualToString:SUErrorDomain]) {
    BOOL v9 = [location[0] code] == &dword_14;
  }

  if (!v9) {
    goto LABEL_14;
  }
  id v5 = [location[0] userInfo];
  id v4 = [v5 objectForKey:kSUInstallationConstraintsUnmetKey];
  unsigned __int8 v6 = [v4 integerValue];

  char v12 = 0;
  char v10 = 0;
  unsigned __int8 v7 = 0;
  if ((v6 & 0x10) != 0)
  {
    unsigned __int8 v7 = 0;
    if ((v6 & 0x20) != 0)
    {
      id v13 = [location[0] userInfo];
      char v12 = 1;
      id v11 = [v13 objectForKey:kSUMDMInstallationRequest];
      char v10 = 1;
      unsigned __int8 v7 = 0;
      if ([v11 BOOLValue]) {
        unsigned __int8 v7 = [(SUInstallPolicy *)v15->_installPolicy autoUpdateEnabled];
      }
    }
  }
  if (v10) {

  }
  if (v12) {
  if (v7)
  }
    char v16 = 1;
  else {
LABEL_14:
  }
    char v16 = 0;
  objc_storeStrong(location, 0);
  return v16 & 1;
}

- (BOOL)installErrorWhenNotReadyForManagedRequest:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [location[0] domain];
  char v9 = 0;
  char v7 = 0;
  BOOL v6 = 0;
  if ([v5 isEqualToString:SUErrorDomain])
  {
    id v10 = [location[0] userInfo];
    char v9 = 1;
    id v8 = [v10 objectForKey:kSUMDMInstallationRequest];
    char v7 = 1;
    BOOL v6 = 0;
    if ([v8 BOOLValue])
    {
      BOOL v4 = 1;
      if ([location[0] code] != (char *)&dword_C + 1)
      {
        BOOL v4 = 1;
        if ([location[0] code] != (char *)&dword_8 + 3)
        {
          BOOL v4 = 1;
          if ([location[0] code] != (char *)&dword_C + 2)
          {
            BOOL v4 = 1;
            if ([location[0] code] != &stru_20.segname[2]) {
              BOOL v4 = [location[0] code] == (char *)&def_46F0 + 3;
            }
          }
        }
      }
      BOOL v6 = v4;
    }
  }
  if (v7) {

  }
  if (v9) {
  BOOL v12 = v6;
  }
  objc_storeStrong(location, 0);
  return v12;
}

- (void)_promptForRollbackConentAndPasscode:(id)a3 withOptions:(id)a4 withCompletion:(id)a5
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v7 = 0;
  objc_storeStrong(&v7, a5);
  [(SUSUISoftwareUpdateController *)v10 presentRollbackConsentAlert:location[0] withOptions:v8 withCompletion:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_resetStateForReason:(id)a3
{
  char v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    sub_548C((uint64_t)v11, (uint64_t)location[0]);
    _os_log_impl(&def_46F0, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "State reset for reason: %@", v11, 0xCu);
  }
  objc_storeStrong(&v7, 0);
  [(SUSUISoftwareUpdateController *)v9 _realertWithStrategy:0 andReason:location[0]];
  alertPresentationManager = v9->_alertPresentationManager;
  CFStringRef v3 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v3);
  id v10 = v6;
  id v5 = +[NSArray arrayWithObjects:&v10 count:1];
  -[SUSUIAlertPresentationManager dismissAllAlertsExcludingClasses:animated:](alertPresentationManager, "dismissAllAlertsExcludingClasses:animated:");

  [(SUSUISoftwareUpdateController *)v9 _unregisterHomescreenAlerts];
  [(SUSUISoftwareUpdateAlertModel *)v9->_alertModel resetTransientDownloadState];
  [(SUSUISoftwareUpdateController *)v9 setUpdateToInstall:0];
  objc_storeStrong(location, 0);
}

- (void)_unregisterHomescreenAlerts
{
  v8[2] = self;
  v8[1] = (id)a2;
  queue = self->_homescreenBlockQueue;
  CFStringRef v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  BOOL v6 = sub_35044;
  id v7 = &unk_5CC30;
  v8[0] = self;
  dispatch_async(queue, &v3);
  objc_storeStrong(v8, 0);
}

- (void)_autoDownloadUnknownToUserFailedForDescriptor:(id)a3 error:(id)a4
{
  SEL v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = 0;
  objc_storeStrong(&v33, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v35->_clientQueue);
  if (location[0])
  {
    [(SUSUISoftwareUpdateController *)v35 _resetStateForReason:@"Auto download unknown to user failed to download."];
    if (v33)
    {
      id v9 = [v33 userInfo];
      id v32 = [v9 objectForKey:kSUAutoDownloadWillRetryKey];

      if (v32 && ([v32 BOOLValue] & 1) == 0)
      {
        id v24 = _NSConcreteStackBlock;
        int v25 = -1073741824;
        int v26 = 0;
        char v27 = sub_35494;
        id v28 = &unk_5CFB0;
        double v29 = v35;
        id v30 = location[0];
        id v31 = objc_retainBlock(&v24);
        if ([(SUSUILayoutStateMonitor *)v35->_layoutStateMonitor isHomeScreenForeground])
        {
          id v23 = (id)SUSUILog();
          os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
          {
            log = v23;
            os_log_type_t type = v22;
            sub_5A1C(v21);
            _os_log_impl(&def_46F0, log, type, "Background download failed and not retrying. Alerting user of update availabitity", v21, 2u);
          }
          objc_storeStrong(&v23, 0);
          (*((void (**)(void))v31 + 2))();
        }
        else
        {
          id v20 = (id)SUSUILog();
          os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
          {
            int v5 = v20;
            os_log_type_t v6 = v19;
            sub_5A1C(v18);
            _os_log_impl(&def_46F0, v5, v6, "Registering SU available alert for presentation on homescreen", v18, 2u);
          }
          objc_storeStrong(&v20, 0);
          [(SUSUILayoutStateMonitor *)v35->_layoutStateMonitor addObserver:v35];
          queue = v35->_homescreenBlockQueue;
          id v11 = _NSConcreteStackBlock;
          int v12 = -1073741824;
          int v13 = 0;
          BOOL v14 = sub_355AC;
          char v15 = &unk_601E8;
          char v16 = v35;
          id v17 = v31;
          dispatch_async(queue, &v11);
          objc_storeStrong(&v17, 0);
          objc_storeStrong((id *)&v16, 0);
        }
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v30, 0);
        objc_storeStrong((id *)&v29, 0);
      }
      objc_storeStrong(&v32, 0);
    }
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
}

- (void)_presentAuthenticationUIForInstallation:(id)a3 withInstallType:(unint64_t)a4 withInstallOperationForecast:(id)a5
{
  id v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v28 = a4;
  id v27 = 0;
  objc_storeStrong(&v27, a5);
  id v26 = (id)SUSUILog();
  os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
  {
    log = v26;
    os_log_type_t type = v25;
    sub_5A1C(v24);
    _os_log_impl(&def_46F0, log, type, "[Install Alert] Presenting authentication UI for installation.", v24, 2u);
  }
  objc_storeStrong(&v26, 0);
  BOOL v23 = 0;
  BOOL v10 = 1;
  if (v28 != 1) {
    BOOL v10 = v28 == 2;
  }
  BOOL v23 = v10;
  id v8 = [SUSUIFullScreenAuthenticationAlert alloc];
  id v9 = [(SUDownload *)v30->_updateToInstall descriptor];
  id v5 = v27;
  unsigned __int8 v6 = [(SUSUISoftwareUpdateController *)v30 canDeferInstallation];
  clientQueue = v30->_clientQueue;
  char v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  int v18 = sub_358A8;
  os_log_type_t v19 = &unk_60408;
  BOOL v21 = v10;
  id v20 = location[0];
  os_log_type_t v22 = [(SUSUIFullScreenAuthenticationAlert *)v8 initWithDescriptor:v9 autoInstallForecast:v5 forInstallTonight:v10 canDeferInstallation:v6 & 1 completionQueue:clientQueue completionBlock:&v15];

  -[SUSUIFullScreenAlertPresentationManager presentAlert:completion:](v30->_fullScreenAlertPresentationManager, "presentAlert:completion:", v22);
  objc_storeStrong((id *)&v22, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)presentRollbackConsentAlert:(id)a3 withOptions:(id)a4 withCompletion:(id)a5
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v9 = 0;
  objc_storeStrong(&v9, a5);
  id v5 = [SUSUISoftwareUpdateRollbackDetectedAlertItem alloc];
  id v8 = [(SUSUISoftwareUpdateRollbackDetectedAlertItem *)v5 initWithRollback:location[0] options:v10 controller:v12 suClient:v12->_client completion:v9];
  [(SUSUIAlertPresentationManager *)v12->_alertPresentationManager dismissAllAlertsAnimated:1];
  [(SUSUIAlertPresentationManager *)v12->_alertPresentationManager presentAlert:v8 animated:1];
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)rollbackCompleted:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)SUSUILog();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    log = v7;
    os_log_type_t type = v6;
    sub_5A1C(v5);
    _os_log_impl(&def_46F0, log, type, "[Rollback] Rebooting device after successful rollback", v5, 2u);
  }
  objc_storeStrong(&v7, 0);
  [(SUSUISoftwareUpdateController *)v9 reboot:0];
  objc_storeStrong(location, 0);
}

- (void)_rollbackSucceeded:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = (id)SUSUILog();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    os_log_type_t type = v8;
    sub_5A1C(v7);
    _os_log_impl(&def_46F0, log, type, "[Rollback] Rollback preparation completed. Presenting reboot countdown", v7, 2u);
  }
  objc_storeStrong(&v9, 0);
  [(SUManagerClient *)v11->_client writeKeepAliveFile];
  [(SUManagerClient *)v11->_client setLastRollbackDescriptor:location[0]];
  CFStringRef v3 = [SUSUIRollbackCountdownAlertItem alloc];
  os_log_type_t v6 = [(SUSUIBaseRollbackAlertItem *)v3 initWithRollbackDescriptor:location[0] softwareUpdateController:v11];
  [(SUSUIAlertPresentationManager *)v11->_alertPresentationManager dismissAllAlertsAnimated:1];
  [(SUSUIAlertPresentationManager *)v11->_alertPresentationManager presentAlert:v6 animated:1];
  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_rollbackFailed:(id)a3 withError:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = (id)SUSUILog();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    sub_548C((uint64_t)v12, (uint64_t)v9);
    _os_log_impl(&def_46F0, (os_log_t)v8, v7, "[Rollback] Rollback failed with error: %@", v12, 0xCu);
  }
  objc_storeStrong(&v8, 0);
  int v4 = [SUSUISoftwareUpdateRollbackFailureAlertItem alloc];
  os_log_type_t v6 = [(SUSUISoftwareUpdateRollbackFailureAlertItem *)v4 initWithRollbackDescriptor:location[0] softwareUpdateController:v11 error:v9];
  [(SUSUIAlertPresentationManager *)v11->_alertPresentationManager dismissAllAlertsAnimated:1];
  [(SUSUIAlertPresentationManager *)v11->_alertPresentationManager presentAlert:v6 animated:1];
  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)cancelRollback
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = (id)SUSUILog();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    os_log_type_t type = v6;
    sub_5A1C(v5);
    _os_log_impl(&def_46F0, log, type, "[Rollback] User canceled rollback", v5, 2u);
  }
  objc_storeStrong(location, 0);
  [(SUManagerClient *)v8->_client writeKeepAliveFile];
  id v4 = objc_alloc_init((Class)SUPurgeOptions);
  [v4 setNotifyUser:0];
  [v4 setUserRequested:1];
  [(SUManagerClient *)v8->_client purgeDownloadWithOptions:v4 withResult:&stru_60448];
  objc_storeStrong(&v4, 0);
}

- (void)_bootedAfterRollback:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = (id)SUSUILog();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    os_log_type_t type = v8;
    sub_5A1C(v7);
    _os_log_impl(&def_46F0, log, type, "[Rollback] Device booted after rollback", v7, 2u);
  }
  objc_storeStrong(&v9, 0);
  CFStringRef v3 = [SUSUIPostSplatRollbackAlertItem alloc];
  id v6 = [(SUSUIBaseRollbackAlertItem *)v3 initWithRollbackDescriptor:location[0] softwareUpdateController:v11];
  if ([(SUSUILayoutStateMonitor *)v11->_layoutStateMonitor isUILocked])
  {
    [(SUSUIAlertPresentationManager *)v11->_alertPresentationManager dismissAllAlertsAnimated:1];
    [(SUSUIAlertPresentationManager *)v11->_alertPresentationManager presentAlert:v6 animated:1];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_rollbackSuggested:(id)a3 info:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = (id)SUSUILog();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    sub_548C((uint64_t)v12, (uint64_t)v9);
    _os_log_impl(&def_46F0, (os_log_t)v8, v7, "[Rollback] Rollback suggested with info: %@", v12, 0xCu);
  }
  objc_storeStrong(&v8, 0);
  id v4 = [SUSUIRollbackSuggestedAlertItem alloc];
  id v6 = [(SUSUIRollbackSuggestedAlertItem *)v4 initWithDescriptor:location[0] softwareUpdateController:v11 info:v9];
  [(SUSUIAlertPresentationManager *)v11->_alertPresentationManager dismissAllAlertsAnimated:1];
  [(SUSUIAlertPresentationManager *)v11->_alertPresentationManager presentAlert:v6 animated:1];
  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_setNVRAMVar:(__CFString *)a3 withValue:(void *)a4
{
  kern_return_t v21;
  io_object_t v22;
  int v23;
  CFTypeRef v24;
  __CFString *v25;
  SEL v26;
  SUSUISoftwareUpdateController *v27;
  uint8_t v29[24];

  id v27 = self;
  id v26 = a2;
  os_log_type_t v25 = a3;
  id v24 = a4;
  BOOL v23 = 0;
  os_log_type_t v22 = 0;
  BOOL v21 = 0;
  if (a3)
  {
    if (v24)
    {
      os_log_type_t v22 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
      if (v22)
      {
        BOOL v21 = IORegistryEntrySetCFProperty(v22, v25, v24);
        if (v21)
        {
          os_log_t v11 = (os_log_t)(id)SUSUILog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            sub_367A0((uint64_t)v29, (uint64_t)v25, v21);
            _os_log_impl(&def_46F0, v11, OS_LOG_TYPE_DEFAULT, "Failed to set NVRAM key %@ in IO registry: %d", v29, 0x12u);
          }
          objc_storeStrong((id *)&v11, 0);
        }
        else
        {
          BOOL v23 = 1;
        }
      }
      else
      {
        os_log_t oslog = (os_log_t)(id)SUSUILog();
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          id v5 = oslog;
          os_log_type_t v6 = v13;
          sub_5A1C(v12);
          _os_log_impl(&def_46F0, v5, v6, "Failed to locate IODeviceTree options in IO registry", v12, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      if (v22) {
        IOObjectRelease(v22);
      }
      return v23 != 0;
    }
    else
    {
      id v17 = (id)SUSUILog();
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        os_log_type_t v7 = v17;
        os_log_type_t v8 = v16;
        sub_5A1C(v15);
        _os_log_impl(&def_46F0, v7, v8, "Cannot set NULL NVRAM object", v15, 2u);
      }
      objc_storeStrong(&v17, 0);
      return v23 != 0;
    }
  }
  else
  {
    id location = (id)SUSUILog();
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = location;
      os_log_type_t type = v19;
      sub_5A1C(v18);
      _os_log_impl(&def_46F0, log, type, "Cannot set NULL NVRAM key", v18, 2u);
    }
    objc_storeStrong(&location, 0);
    return v23 != 0;
  }
}

- (void)_rebootQuiet
{
  location[4] = self;
  id location[3] = (id)a2;
  id location[2] = @"SystemAudioVolumeSaved";
  location[1] = @"1";
  if ([(SUSUISoftwareUpdateController *)self _setNVRAMVar:@"SystemAudioVolumeSaved" withValue:@"1"])
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = oslog;
      os_log_type_t v3 = v5;
      sub_5A1C(v4);
      _os_log_impl(&def_46F0, v2, v3, "Successfully set SystemAudioVolumeSaved NVRAM key", v4, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    location[0] = (id)SUSUILog();
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_4BF8((uint64_t)v9, @"SystemAudioVolumeSaved", @"1");
      _os_log_impl(&def_46F0, (os_log_t)location[0], v7, "Error: failed to set NVRAM variable %@=%@ on software update reboot", v9, 0x16u);
    }
    objc_storeStrong(location, 0);
  }
}

- (void)reboot:(BOOL)a3
{
  char v15 = self;
  SEL v14 = a2;
  BOOL v13 = a3;
  id location = (id)SUSUILog();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    sub_141D8((uint64_t)v16, v13);
    _os_log_impl(&def_46F0, (os_log_t)location, v11, "Rebooting now (dark=%d)", v16, 8u);
  }
  objc_storeStrong(&location, 0);
  queue = v15->_backgroundQueue;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  os_log_type_t v7 = sub_36B2C;
  os_log_type_t v8 = &unk_5F378;
  id v9 = v15;
  BOOL v10 = v13;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

- (void)setPasscodePolicy:(unint64_t)a3
{
}

- (id)_stringForCurrentVersionPreference
{
  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = +[UIDevice currentDevice];
  id v4 = [v6[0] systemVersion];
  id v3 = [v6[0] buildVersion];
  int v5 = +[NSString stringWithFormat:@"%@:%@", v4, v3];

  objc_storeStrong(v6, 0);

  return v5;
}

- (void)_saveLastKnownVersionPreference:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateDefaults *)v4->_suDefaults setLastOSVersion:location[0]];
  objc_storeStrong(location, 0);
}

- (void)_migrateForNewOSVersionIfNecessary
{
  SEL v14 = self;
  v13[1] = (id)a2;
  v13[0] = [(SUSUISoftwareUpdateController *)self _stringForCurrentVersionPreference];
  id v12 = [(SUSUISoftwareUpdateDefaults *)v14->_suDefaults lastOSVersion];
  if (!v12
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v12 isEqualToString:v13[0]] & 1) == 0)
  {
    id location = (id)SUSUILog();
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = location;
      os_log_type_t type = v10;
      sub_5A1C(v9);
      _os_log_impl(&def_46F0, log, type, "Migrating software update settings at startup because a new OS version was detected.", v9, 2u);
    }
    objc_storeStrong(&location, 0);
    [(SUSUISoftwareUpdateController *)v14 _saveLastKnownVersionPreference:v13[0]];
    [(SUSUISoftwareUpdateDefaults *)v14->_suDefaults migrateAndClearLegacyPreferences];
    [(SUSUISoftwareUpdateDefaults *)v14->_suDefaults setSoftwareUpdateState:0];
    id v8 = (id)SUSUILog();
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = v8;
      os_log_type_t v3 = v7;
      sub_5A1C(v6);
      _os_log_impl(&def_46F0, v2, v3, "[Settings Badge] newOS version detected..Removing SU directly owned settings badge(if present)", v6, 2u);
    }
    objc_storeStrong(&v8, 0);
    [(SUSUISoftwareUpdateController *)v14 toggleSettingsBadge:0 update:0];
    [(SUSUISoftwareUpdateController *)v14 _clearLegacyBadgeIfNecessary:v12];
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
}

- (void)_clearLegacyBadgeIfNecessary:(id)a3
{
  id v9 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2(v9[3]);
  if ([location[0] hasPrefix:@"5.0"])
  {
    id v7 = (id)SUSUILog();
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      log = v7;
      os_log_type_t type = v6;
      sub_5A1C(v5);
      _os_log_impl(&def_46F0, log, type, "Running software update badge migration from 5.0 (clearing Settings badge)", v5, 2u);
    }
    objc_storeStrong(&v7, 0);
    [(dispatch_queue_t *)v9 _savePreferencesBadgeFlag:0];
    [(dispatch_queue_t *)v9 _setSettingsBadgeToValue:0];
  }
  objc_storeStrong(location, 0);
}

- (void)_savePreferencesBadgeFlag:(BOOL)a3
{
  BOOL v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = self->_badgingQueue;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_37180;
  id v8 = &unk_5F378;
  id v9 = self;
  BOOL v10 = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

- (void)toggleSettingsBadge:(BOOL)a3 update:(id)a4
{
  os_log_type_t v16 = (dispatch_queue_t *)self;
  SEL v15 = a2;
  BOOL v14 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  dispatch_assert_queue_V2(v16[3]);
  queue = v16[19];
  int v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_372E8;
  id v9 = &unk_60470;
  BOOL v12 = v14;
  BOOL v10 = v16;
  id v11 = location;
  dispatch_async(queue, &v5);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&location, 0);
}

- (void)_setSettingsBadgeToValue:(int64_t)a3
{
  BOOL v12 = self;
  SEL v11 = a2;
  BOOL v10 = (void *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  queue = v12->_badgingQueue;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_379D4;
  id v8 = &unk_60498;
  v9[0] = v12;
  v9[1] = v10;
  dispatch_async(queue, &v4);
  objc_storeStrong(v9, 0);
}

- (BOOL)_badgingQueue_isBadgedForSoftwareUpdate
{
  return [(SUSUIExternalSettingsAppDefaults *)self->_settingsAppDefaults isBadgedForSoftwareUpdate] & 1;
}

- (void)_badgingQueue_badgeSettingsWithValue:(int64_t)a3
{
  int v7 = self;
  SEL v6 = a2;
  int64_t v5 = a3;
  BSDispatchQueueAssert();
  id v4 = [objc_alloc((Class)NSNumber) initWithInteger:v5];
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_548C((uint64_t)v8, (uint64_t)v4);
    _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "[Settings Badge] Asking badgingQueue systemService to set badge value to %@", v8, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(FBSSystemService *)v7->_badgingQueue_systemService setBadgeValue:v4 forBundleID:SUSUISettingsBundleIdentifier];
  objc_storeStrong(&v4, 0);
}

- (void)_badgingQueue_savePreferencesBadgeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssert();
  [(SUSUIExternalSettingsAppDefaults *)self->_settingsAppDefaults setBadgedForSoftwareUpdate:v3];
}

- (BOOL)settingsForeground
{
  id v3 = [(SUSUISoftwareUpdateController *)self _foregroundBundleID];
  unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.Preferences"];

  return v4 & 1;
}

- (BOOL)_homescreenForeground
{
  return [(SUSUILayoutStateMonitor *)self->_layoutStateMonitor isHomeScreenForeground];
}

- (id)_foregroundBundleID
{
  return [(SUSUILayoutStateMonitor *)self->_layoutStateMonitor primaryForegroundBundleID];
}

- (BOOL)_shouldHideAlert
{
  id v3 = [(SUDownload *)self->_updateToInstall metadata];
  unsigned __int8 v4 = [v3 isAutoDownload];

  BOOL v8 = (char *)[(SUSUISoftwareUpdateAlertModel *)self->_alertModel alertFlow] == (char *)&def_46F0 + 1;
  id v5 = [(SUDownload *)self->_updateToInstall descriptor];
  unsigned __int8 v6 = [v5 hideInstallAlert];

  char v7 = 0;
  if (v4)
  {
    char v7 = 0;
    if (v8) {
      char v7 = v6 & 1;
    }
  }
  return v7 & 1;
}

- (id)getInitIfNeededDDMController
{
  if (self->_ddmController)
  {
    unsigned __int8 v6 = self->_ddmController;
  }
  else
  {
    unsigned __int8 v4 = (SUSUIDDMController *)+[SUSUIDDMController sharedInstance:self withQueue:self->_clientQueue];
    ddmController = self->_ddmController;
    self->_ddmController = v4;

    unsigned __int8 v6 = v4;
  }

  return v6;
}

- (SUSUIAlertPresentationManager)alertPresentationManager
{
  return self->_alertPresentationManager;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (SUSFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)scanForUpdates:(id)a3 withScanResults:(id)a4
{
  char v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v7->_clientQueue);
  [(SUManagerClient *)v7->_client scanForUpdates:location[0] withScanResults:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)setInstallOperation:(id)a3
{
  unsigned __int8 v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v4->_clientQueue);
  objc_storeStrong((id *)&v4->_scheduledTryTonightAutoInstallOperation, location[0]);
  objc_storeStrong(location, 0);
}

@end