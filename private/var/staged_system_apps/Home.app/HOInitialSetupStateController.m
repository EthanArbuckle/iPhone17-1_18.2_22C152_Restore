@interface HOInitialSetupStateController
- (HFHomeKitDispatcher)dispatcher;
- (HODataSyncingViewController)presentedDataSyncingController;
- (HOInitialSetupStateController)initWithDelegate:(id)a3;
- (HOInitialSetupStateControllerDelegate)delegate;
- (HOOnboardingRootNavigationController)presentedOnboardingController;
- (HOiCloudDisabledViewController)presentediCloudWarningController;
- (NAFuture)onboardingCompleteFuture;
- (NSMutableSet)pendingHomeIDsFromInvitations;
- (id)_dismissPresentedViewControllerIfNeeded;
- (id)_presentDataSyncingControllerWithState:(unint64_t)a3;
- (id)_presentOnboardingWithStates:(id)a3;
- (id)_presentedViewControllerForState:(unint64_t)a3;
- (id)_presentiCloudDisabledControllerWithState:(unint64_t)a3 andStatus:(unint64_t)a4;
- (unint64_t)presentationState;
- (void)_checkForAppOnboardingWillFinish;
- (void)_reloadStateWithInvitation:(id)a3 home:(id)a4;
- (void)_setPresentedViewController:(id)a3 forState:(unint64_t)a4;
- (void)_updateOnboardingCompleteFutureForNewPresentationState:(unint64_t)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didUpdateStateForIncomingInvitations:(id)a4;
- (void)onboardingNavigationController:(id)a3 acceptedInvitationAndWaitingForHomeToLand:(id)a4;
- (void)onboardingNavigationController:(id)a3 didAcceptInvitation:(id)a4;
- (void)onboardingNavigationController:(id)a3 didDecideLaterInvitation:(id)a4 error:(id)a5;
- (void)onboardingNavigationController:(id)a3 didDeclineInvitation:(id)a4;
- (void)onboardingNavigationController:(id)a3 didIgnoreInvitation:(id)a4;
- (void)onboardingNavigationController:(id)a3 didReportJunkInvitation:(id)a4;
- (void)onboardingNavigationControllerDidFinish:(id)a3;
- (void)reloadState;
- (void)setOnboardingCompleteFuture:(id)a3;
- (void)setPresentationState:(unint64_t)a3;
- (void)setPresentedDataSyncingController:(id)a3;
- (void)setPresentedOnboardingController:(id)a3;
- (void)setPresentediCloudWarningController:(id)a3;
- (void)showOnboardingIfNeededForHomeInvitation:(id)a3;
@end

@implementation HOInitialSetupStateController

- (void)_checkForAppOnboardingWillFinish
{
  objc_initWeak(&location, self);
  v3 = [(HOInitialSetupStateController *)self onboardingCompleteFuture];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000052FC;
  v5[3] = &unk_1000C2328;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  id v4 = [v3 flatMap:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)reloadState
{
  objc_initWeak(&location, self);
  v3 = [(HOInitialSetupStateController *)self dispatcher];
  id v4 = [v3 homeFuture];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000039AC;
  v6[3] = &unk_1000C22B0;
  objc_copyWeak(&v7, &location);
  id v5 = [v4 addCompletionBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_updateOnboardingCompleteFutureForNewPresentationState:(unint64_t)a3
{
  if (a3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(HOInitialSetupStateController *)self dispatcher];
      id v6 = [v5 home];
      int v13 = 138412290;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting onboardingCompleteFuture for home: %@", (uint8_t *)&v13, 0xCu);
    }
    id v7 = objc_alloc_init((Class)NAFuture);
    [(HOInitialSetupStateController *)self setOnboardingCompleteFuture:v7];
  }
  else
  {
    v8 = [(HOInitialSetupStateController *)self onboardingCompleteFuture];
    unsigned __int8 v9 = [v8 isFinished];

    if (v9) {
      return;
    }
    v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(HOInitialSetupStateController *)self dispatcher];
      v12 = [v11 home];
      int v13 = 138412290;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "After evaluating the dataSync status and onboarding states for home %@, we decided we don't need to show any onboarding or dataSyncInProgress screens. Finishing onboardingCompleteFuture.", (uint8_t *)&v13, 0xCu);
    }
    [(HOInitialSetupStateController *)self _checkForAppOnboardingWillFinish];
    id v7 = [(HOInitialSetupStateController *)self onboardingCompleteFuture];
    [v7 finishWithNoResult];
  }
}

- (NAFuture)onboardingCompleteFuture
{
  return self->_onboardingCompleteFuture;
}

- (HOInitialSetupStateController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HOInitialSetupStateController;
  id v5 = [(HOInitialSetupStateController *)&v22 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v7 = (NAFuture *)objc_alloc_init((Class)NAFuture);
    onboardingCompleteFuture = v6->_onboardingCompleteFuture;
    v6->_onboardingCompleteFuture = v7;

    uint64_t v9 = +[HFHomeKitDispatcher sharedDispatcher];
    dispatcher = v6->_dispatcher;
    v6->_dispatcher = (HFHomeKitDispatcher *)v9;

    [(HFHomeKitDispatcher *)v6->_dispatcher addHomeManagerObserver:v6];
    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pendingHomeIDsFromInvitations = v6->_pendingHomeIDsFromInvitations;
    v6->_pendingHomeIDsFromInvitations = v11;

    id v13 = +[HFMediaAccessoryUtility sharedInstance];
    objc_initWeak(&location, v6);
    v14 = +[NSNotificationCenter defaultCenter];
    v15 = +[NSOperationQueue mainQueue];
    uint64_t v16 = HFHomePreferencesChangedNotification;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000189AC;
    v19[3] = &unk_1000C2288;
    objc_copyWeak(&v20, &location);
    id v17 = [v14 addObserverForName:v16 object:0 queue:v15 usingBlock:v19];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)_reloadStateWithInvitation:(id)a3 home:(id)a4
{
  id v75 = a3;
  id v6 = a4;
  if (+[HFUtilities isInternalTest])
  {
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Skipping reloading initial setup state as this is an internal unit test", buf, 2u);
    }
    goto LABEL_70;
  }
  +[HUHomeEnergyWrapper setupGridForecastSnapshotsFor:v6];
  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v75 hf_prettyDescription];
    *(_DWORD *)buf = 138412546;
    *(void *)v83 = v9;
    *(_WORD *)&v83[8] = 2112;
    *(void *)&v83[10] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Recomputing initial setup state. invitation = %@ | home = %@", buf, 0x16u);
  }
  v10 = [(HOInitialSetupStateController *)self dispatcher];
  v11 = [v10 homeManager];
  id v76 = [v11 dataSyncState];

  v12 = [(HOInitialSetupStateController *)self dispatcher];
  id v13 = [v12 homeManager];
  id v73 = [v13 status];

  id v7 = CFPreferencesCopyAppValue(HFForcedDataSyncStateKey, HFHomeDomain);
  if (v7)
  {
    v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v83 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Using override data sync state %@", buf, 0xCu);
    }

    id v76 = [v7 unsignedIntegerValue];
  }
  v15 = +[HOOnboardingRootNavigationController onboardingStatesForHome:v6];
  uint64_t v16 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
  v74 = +[HOOnboardingRootNavigationController onboardingStatesForHome:v6 pendingHomeIDsFromInvitations:v16];

  id v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = NSStringFromHMHomeManagerDataSyncState();
    v19 = HMHomeManagerStatusToString();
    id v20 = +[HOOnboardingRootNavigationController stringForOnboardingStates:v74];
    v21 = [(HOInitialSetupStateController *)self dispatcher];
    objc_super v22 = [v21 home];
    v23 = [v22 hf_prettyDescription];
    *(_DWORD *)buf = 138413314;
    *(void *)v83 = v18;
    *(_WORD *)&v83[8] = 2112;
    *(void *)&v83[10] = v19;
    *(_WORD *)&v83[18] = 2048;
    id v84 = v73;
    __int16 v85 = 2112;
    v86 = v20;
    __int16 v87 = 2112;
    v88 = v23;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "dataSyncState: %@, status: %@ (%lu), desired onboardingStates: %@ for home: %@", buf, 0x34u);
  }
  if (+[HFUtilities isAMac]) {
    BOOL v24 = v76 == (id)3 || (v73 & 0x20) != 0;
  }
  else {
    BOOL v24 = 0;
  }
  v25 = [(HOInitialSetupStateController *)self dispatcher];
  v26 = [v25 homeManager];

  v27 = [v26 hh2MigrationFailedError];
  if (v27) {
    unsigned int v28 = (v76 == (id)4) & ~[v26 hasOptedToHH2];
  }
  else {
    unsigned int v28 = 0;
  }

  v29 = HFLogForCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = [v26 hh2MigrationFailedError];
    unsigned int v31 = [v26 hasOptedToHH2];
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v83 = v28;
    *(_WORD *)&v83[4] = 2112;
    *(void *)&v83[6] = v30;
    *(_WORD *)&v83[14] = 1024;
    *(_DWORD *)&v83[16] = v31;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "isHH2MigrationFailedError: %d, hh2MigrationFailedError: %@, hasOptedToHH2: %d", buf, 0x18u);
  }
  if (!v24)
  {
    if (v28)
    {
      v34 = HFLogForCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = NSStringFromHMHomeManagerDataSyncState();
        *(_DWORD *)buf = 138412290;
        *(void *)v83 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Setting desiredState from syncState: %@ to HOInitialSetupPresentationStateNone since isHH2MigrationFailedError is YES", buf, 0xCu);
      }
      v72 = 0;
      char v32 = 0;
      uint64_t v33 = 0;
      goto LABEL_50;
    }
    if (v76 != (id)1)
    {
      v72 = 0;
      char v32 = 0;
      uint64_t v33 = 2;
      goto LABEL_51;
    }
    if (![v74 count])
    {
      if (v75)
      {
        v34 = [&off_1000CB448 mutableCopy];
        objc_opt_class();
        id v41 = v75;
        if (objc_opt_isKindOfClass()) {
          v42 = v41;
        }
        else {
          v42 = 0;
        }
        id v43 = v42;

        if ([v43 isInviteeRestrictedGuest])
        {
          v44 = +[HOUtilities onboardingStatesForRestrictedGuestInvitation:v43];
          [v34 na_safeAddObjectsFromArray:v44];
        }
        id v71 = [v34 copy];

        v45 = HFLogForCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v46 = +[HOOnboardingRootNavigationController stringForOnboardingStates:v71];
          v47 = [v41 hf_prettyDescription];
          *(_DWORD *)buf = 136315650;
          *(void *)v83 = "-[HOInitialSetupStateController _reloadStateWithInvitation:home:]";
          *(_WORD *)&v83[8] = 2112;
          *(void *)&v83[10] = v46;
          *(_WORD *)&v83[18] = 2112;
          id v84 = v47;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "(%s) Including onboardingStates %@ for %@", buf, 0x20u);
        }
        v72 = 0;
        char v32 = 0;
        uint64_t v33 = 3;
        v74 = v71;
        goto LABEL_50;
      }
      v67 = [(HOInitialSetupStateController *)self presentedOnboardingController];
      unsigned int v68 = [v67 isDisplayingRestrictedGuestIncomingInvitationFlow];

      if (!v68)
      {
        v72 = 0;
        char v32 = 0;
        uint64_t v33 = 0;
        goto LABEL_51;
      }
      v34 = HFLogForCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v69 = +[HOOnboardingRootNavigationController stringForOnboardingStates:v74];
        v70 = [0 hf_prettyDescription];
        *(_DWORD *)buf = 136315650;
        *(void *)v83 = "-[HOInitialSetupStateController _reloadStateWithInvitation:home:]";
        *(_WORD *)&v83[8] = 2112;
        *(void *)&v83[10] = v69;
        *(_WORD *)&v83[18] = 2112;
        id v84 = v70;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "(%s) Including onboardingStates %@ for %@", buf, 0x20u);
      }
      v72 = 0;
      char v32 = 0;
      goto LABEL_49;
    }
    unsigned int v36 = [v74 containsObject:&off_1000CB6E8];
    v37 = [(HOInitialSetupStateController *)self presentedOnboardingController];
    v38 = [v37 onboardingStates];
    unsigned int v39 = [v38 containsObject:&off_1000CB6E8];

    if ((v36 ^ 1 | v39) == 1)
    {
      if ((v36 | v39 ^ 1) == 1)
      {
        if (v75)
        {
          v40 = [v75 hf_prettyDescription];
          v72 = +[NSString stringWithFormat:@"Show Invitation %@", v40];

          char v32 = 1;
        }
        else
        {
          v72 = 0;
          char v32 = 0;
        }
LABEL_47:
        v34 = HFLogForCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v83 = v72;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "preemptionReason: %@", buf, 0xCu);
        }
LABEL_49:
        uint64_t v33 = 3;
LABEL_50:

        goto LABEL_51;
      }
      char v32 = 1;
      CFStringRef v48 = @"Dismiss Invitation Onboarding";
    }
    else
    {
      char v32 = 1;
      CFStringRef v48 = @"Show Invitation Onboarding";
    }
    v72 = (void *)v48;
    goto LABEL_47;
  }
  v72 = 0;
  char v32 = 0;
  uint64_t v33 = 1;
LABEL_51:
  v49 = [(HOInitialSetupStateController *)self dispatcher];
  v50 = [v49 home];
  unsigned int v51 = +[HFServiceMigrationController homeNeedsMigration:v50];

  if (v76 == (id)1) {
    unsigned int v52 = v51;
  }
  else {
    unsigned int v52 = 0;
  }
  if (v52 == 1)
  {
    id v53 = objc_alloc((Class)HFServiceMigrationController);
    v54 = [(HOInitialSetupStateController *)self dispatcher];
    v55 = [v54 home];
    id v56 = [v53 initWithHome:v55];

    id v57 = [v56 migrateServicesToAccessory];
  }
  id v58 = 0;
  if (v6 && v76 == (id)1)
  {
    if (+[HFUtilities isInternalTest])
    {
      id v58 = 0;
    }
    else
    {
      id v59 = objc_alloc((Class)HFRedesignMigrationController);
      v60 = [(HOInitialSetupStateController *)self dispatcher];
      v61 = [v60 home];
      id v58 = [v59 initWithHome:v61];

      [v58 performMigrationIfNeeded];
    }
  }
  if (v33 == [(HOInitialSetupStateController *)self presentationState]) {
    char v62 = v32;
  }
  else {
    char v62 = 1;
  }
  if (v62)
  {
    v63 = [(HOInitialSetupStateController *)self _dismissPresentedViewControllerIfNeeded];
    [(HOInitialSetupStateController *)self setPresentationState:v33];
    objc_initWeak((id *)buf, self);
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_100018BB8;
    v79[3] = &unk_1000C2300;
    objc_copyWeak(v81, (id *)buf);
    v81[1] = (id)v33;
    v81[2] = v76;
    v81[3] = v73;
    id v80 = v74;
    v64 = [v63 flatMap:v79];
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_100018D04;
    v77[3] = &unk_1000C1CA8;
    id v78 = v58;
    id v65 = [v64 addCompletionBlock:v77];

    objc_destroyWeak(v81);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if ((id)[(HOInitialSetupStateController *)self presentationState] == (id)2)
    {
      v66 = [(HOInitialSetupStateController *)self presentedDataSyncingController];
      [v66 setDataSyncState:v76];
    }
    [(HOInitialSetupStateController *)self _updateOnboardingCompleteFutureForNewPresentationState:v33];
    [v58 performMigrationSuccessTasks];
  }

LABEL_70:
}

- (HFHomeKitDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (unint64_t)presentationState
{
  return self->_presentationState;
}

- (HOOnboardingRootNavigationController)presentedOnboardingController
{
  return self->_presentedOnboardingController;
}

- (NSMutableSet)pendingHomeIDsFromInvitations
{
  return self->_pendingHomeIDsFromInvitations;
}

- (HOInitialSetupStateControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HOInitialSetupStateControllerDelegate *)WeakRetained;
}

- (void)showOnboardingIfNeededForHomeInvitation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HOInitialSetupStateController *)self dispatcher];
  id v6 = [v5 homeFuture];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100018B4C;
  v9[3] = &unk_1000C22D8;
  objc_copyWeak(&v11, &location);
  id v7 = v4;
  id v10 = v7;
  id v8 = [v6 addCompletionBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)_presentiCloudDisabledControllerWithState:(unint64_t)a3 andStatus:(unint64_t)a4
{
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromHMHomeManagerDataSyncState();
    int v13 = 138412290;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Presenting data syncing controller for state %@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v9 = objc_alloc_init(HOiCloudDisabledViewController);
  [(HOiCloudDisabledViewController *)v9 setDataSyncState:a3];
  [(HOiCloudDisabledViewController *)v9 setStatus:a4];
  [(HOiCloudDisabledViewController *)v9 setModalPresentationStyle:0];
  [(HOInitialSetupStateController *)self setPresentediCloudWarningController:v9];
  id v10 = [(HOInitialSetupStateController *)self delegate];
  id v11 = [v10 stateController:self presentViewController:v9 forState:1];

  return v11;
}

- (id)_presentDataSyncingControllerWithState:(unint64_t)a3
{
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromHMHomeManagerDataSyncState();
    int v11 = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Presenting data syncing controller for state %@", (uint8_t *)&v11, 0xCu);
  }
  id v7 = objc_alloc_init(HODataSyncingViewController);
  [(HODataSyncingViewController *)v7 setDataSyncState:a3];
  [(HODataSyncingViewController *)v7 setModalPresentationStyle:1];
  [(HOInitialSetupStateController *)self setPresentedDataSyncingController:v7];
  id v8 = [(HOInitialSetupStateController *)self delegate];
  uint64_t v9 = [v8 stateController:self presentViewController:v7 forState:2];

  return v9;
}

- (id)_presentOnboardingWithStates:(id)a3
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[HOOnboardingRootNavigationController stringForOnboardingStates:v4];
    int v11 = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Displaying onboarding for states %@", (uint8_t *)&v11, 0xCu);
  }
  id v7 = [[HOOnboardingRootNavigationController alloc] initWithOnboardingStates:v4];
  [(HOOnboardingRootNavigationController *)v7 setOnboardingDelegate:self];
  [(HOOnboardingRootNavigationController *)v7 setModalPresentationStyle:2];
  [(HOInitialSetupStateController *)self setPresentedOnboardingController:v7];
  id v8 = [(HOInitialSetupStateController *)self delegate];
  uint64_t v9 = [v8 stateController:self presentViewController:v7 forState:3];

  return v9;
}

- (id)_dismissPresentedViewControllerIfNeeded
{
  v3 = +[NAFuture futureWithNoResult];
  id v4 = [(HOInitialSetupStateController *)self _presentedViewControllerForState:[(HOInitialSetupStateController *)self presentationState]];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = [(HOInitialSetupStateController *)self presentationState];
      if (v9 > 3) {
        CFStringRef v10 = @"(unknown)";
      }
      else {
        CFStringRef v10 = off_1000C2370[v9];
      }
      int v40 = 136315650;
      id v41 = "-[HOInitialSetupStateController _dismissPresentedViewControllerIfNeeded]";
      __int16 v42 = 2112;
      CFStringRef v43 = v5;
      __int16 v44 = 2112;
      CFStringRef v45 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) onboardingRootNav is nil because presentedVC = %@ | presentationState = %@", (uint8_t *)&v40, 0x20u);
    }
  }
  unsigned int v11 = [(__CFString *)v7 hasNextStepInRestrictedGuestIncomingInvitationFlow];
  v12 = [(__CFString *)v7 visibleViewController];
  if ([v12 conformsToProtocol:&OBJC_PROTOCOL___HOOnboardingChildViewController]) {
    int v13 = v12;
  }
  else {
    int v13 = 0;
  }
  id v14 = v13;

  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v15 = [v14 didUserTriggerOnboardingDismissal];
    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
    unsigned __int8 v15 = 0;
    if (!v11) {
      goto LABEL_22;
    }
  }
  if ((id)[(HOInitialSetupStateController *)self presentationState] == (id)3) {
    char v16 = v15;
  }
  else {
    char v16 = 1;
  }
  if (v16)
  {
LABEL_22:
    if (!v5)
    {
      id v20 = [(HOInitialSetupStateController *)self delegate];
      v21 = [v20 currentlyPresentedViewController];

      objc_super v22 = HFLogForCategory();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (!v23)
        {
LABEL_44:

          [(HOInitialSetupStateController *)self _setPresentedViewController:0 forState:[(HOInitialSetupStateController *)self presentationState]];
          [(HOInitialSetupStateController *)self setPresentationState:0];
          v37 = v3;
          v3 = v37;
          goto LABEL_48;
        }
        BOOL v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (char *)objc_claimAutoreleasedReturnValue();
        int v40 = 138412546;
        id v41 = v25;
        __int16 v42 = 2112;
        CFStringRef v43 = v21;
        v26 = "%@: No presentedVC to dismiss, but delegate has presented view controller: %@";
        v27 = v22;
        uint32_t v28 = 22;
      }
      else
      {
        if (!v23) {
          goto LABEL_44;
        }
        unsigned int v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v25 = (char *)objc_claimAutoreleasedReturnValue();
        int v40 = 138412290;
        id v41 = v25;
        v26 = "%@: No presentedVC to dismiss, and delegate doesn't have a view controller presented";
        v27 = v22;
        uint32_t v28 = 12;
      }
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v40, v28);

      goto LABEL_44;
    }
    id v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v18 = [(HOInitialSetupStateController *)self presentationState];
      if (v18 > 3) {
        CFStringRef v19 = @"(unknown)";
      }
      else {
        CFStringRef v19 = off_1000C2370[v18];
      }
      int v40 = 138412546;
      id v41 = (const char *)v19;
      __int16 v42 = 2112;
      CFStringRef v43 = v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Dismissing presented initial setup state %@ VC: %@", (uint8_t *)&v40, 0x16u);
    }

    uint64_t v33 = [(__CFString *)v5 presentingViewController];
    if (!v33)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_36;
      }
      uint64_t v33 = HFLogForCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v34 = [(HOInitialSetupStateController *)self presentationState];
        if (v34 > 3) {
          CFStringRef v35 = @"(unknown)";
        }
        else {
          CFStringRef v35 = off_1000C2370[v34];
        }
        int v40 = 138412546;
        id v41 = (const char *)v5;
        __int16 v42 = 2112;
        CFStringRef v43 = v35;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "No presenting VC for presented VC %@ even though we think it's presented! Presentation state: %@", (uint8_t *)&v40, 0x16u);
      }
    }

LABEL_36:
    v21 = [(HOInitialSetupStateController *)self delegate];
    [(__CFString *)v21 stateController:self dismissViewController:v5 forState:[(HOInitialSetupStateController *)self presentationState]];
    v3 = objc_super v22 = v3;
    goto LABEL_44;
  }
  v29 = HFLogForCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = [(__CFString *)v7 visibleViewController];
    unint64_t v31 = [(HOInitialSetupStateController *)self presentationState];
    if (v31 > 3) {
      CFStringRef v32 = @"(unknown)";
    }
    else {
      CFStringRef v32 = off_1000C2370[v31];
    }
    int v40 = 136315650;
    id v41 = "-[HOInitialSetupStateController _dismissPresentedViewControllerIfNeeded]";
    __int16 v42 = 2112;
    CFStringRef v43 = v30;
    __int16 v44 = 2112;
    CFStringRef v45 = v32;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "(%s) Not dismissing the currently presented restricted guest incoming invitation onboarding flow, because it should move onto the next view controller instead of dismissing | visibleVC = %@ | state = %@", (uint8_t *)&v40, 0x20u);
  }
  v37 = +[NAFuture futureWithNoResult];
LABEL_48:
  v38 = v37;

  return v38;
}

- (void)setPresentationState:(unint64_t)a3
{
  if (self->_presentationState != a3)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      id v8 = (void *)v7;
      unint64_t presentationState = self->_presentationState;
      if (presentationState > 3) {
        CFStringRef v10 = @"(unknown)";
      }
      else {
        CFStringRef v10 = off_1000C2370[presentationState];
      }
      if (a3 > 3) {
        CFStringRef v11 = @"(unknown)";
      }
      else {
        CFStringRef v11 = off_1000C2370[a3];
      }
      int v12 = 138412802;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      CFStringRef v15 = v10;
      __int16 v16 = 2112;
      CFStringRef v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Changing presentation state from %@ to %@", (uint8_t *)&v12, 0x20u);
    }
  }
  self->_unint64_t presentationState = a3;
}

- (void)setPresentedOnboardingController:(id)a3
{
  id v4 = a3;
  id v5 = self->_presentedOnboardingController;
  id v6 = (HOOnboardingRootNavigationController *)v4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
  }
  else
  {
    if (v5)
    {
      unsigned __int8 v8 = [(HOOnboardingRootNavigationController *)v5 isEqual:v6];

      if (v8) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    unint64_t v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = (objc_class *)objc_opt_class();
      CFStringRef v11 = NSStringFromClass(v10);
      presentedOnboardingController = self->_presentedOnboardingController;
      int v14 = 138412802;
      CFStringRef v15 = v11;
      __int16 v16 = 2112;
      CFStringRef v17 = presentedOnboardingController;
      __int16 v18 = 2112;
      CFStringRef v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Changing presented onboarding controller from %@ to %@", (uint8_t *)&v14, 0x20u);
    }
  }
LABEL_10:
  uint64_t v13 = self->_presentedOnboardingController;
  self->_presentedOnboardingController = v7;
}

- (id)_presentedViewControllerForState:(unint64_t)a3
{
  uint64_t v15 = v6;
  uint64_t v16 = v5;
  uint64_t v17 = v4;
  uint64_t v18 = v3;
  switch(a3)
  {
    case 0uLL:
      CFStringRef v10 = [(HOInitialSetupStateController *)self delegate];
      CFStringRef v11 = [v10 currentlyPresentedViewController];
      int v12 = [(HOInitialSetupStateController *)self presentedOnboardingController];

      if (v11 == v12) {
        goto LABEL_4;
      }
      uint64_t v13 = 0;
      goto LABEL_10;
    case 1uLL:
      uint64_t v13 = [(HOInitialSetupStateController *)self presentediCloudWarningController];
      goto LABEL_10;
    case 2uLL:
      uint64_t v13 = [(HOInitialSetupStateController *)self presentedDataSyncingController];
      goto LABEL_10;
    case 3uLL:
LABEL_4:
      uint64_t v13 = [(HOInitialSetupStateController *)self presentedOnboardingController];
LABEL_10:
      break;
    default:
      uint64_t v13 = 0;
      break;
  }
  return v13;
}

- (void)_setPresentedViewController:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    CFStringRef v10 = (void *)v9;
    if (a4 > 3) {
      CFStringRef v11 = @"(unknown)";
    }
    else {
      CFStringRef v11 = off_1000C2370[a4];
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v30 = v9;
    __int16 v31 = 2112;
    CFStringRef v32 = v11;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Setting presented view controller for state %@ VC: %@", buf, 0x20u);
  }
  unint64_t v12 = [(HOInitialSetupStateController *)self presentationState];
  switch(v12)
  {
    case 1uLL:
      uint64_t v19 = objc_opt_class();
      id v20 = v6;
      if (v20)
      {
        if (objc_opt_isKindOfClass()) {
          v21 = v20;
        }
        else {
          v21 = 0;
        }
        id v16 = v21;
        if (!v16)
        {
          objc_super v22 = +[NSAssertionHandler currentHandler];
          BOOL v23 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
          [v22 handleFailureInFunction:v23, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v19, objc_opt_class() file lineNumber description];
        }
      }
      else
      {
        id v16 = 0;
      }

      [(HOInitialSetupStateController *)self setPresentediCloudWarningController:v16];
      goto LABEL_33;
    case 2uLL:
      uint64_t v24 = objc_opt_class();
      id v25 = v6;
      if (v25)
      {
        if (objc_opt_isKindOfClass()) {
          v26 = v25;
        }
        else {
          v26 = 0;
        }
        id v16 = v26;
        if (!v16)
        {
          v27 = +[NSAssertionHandler currentHandler];
          uint32_t v28 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
          [v27 handleFailureInFunction:v28, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v24, objc_opt_class() file lineNumber description];
        }
      }
      else
      {
        id v16 = 0;
      }

      [(HOInitialSetupStateController *)self setPresentedDataSyncingController:v16];
      goto LABEL_33;
    case 3uLL:
      uint64_t v13 = objc_opt_class();
      id v14 = v6;
      if (v14)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 0;
        }
        id v16 = v15;
        if (!v16)
        {
          uint64_t v17 = +[NSAssertionHandler currentHandler];
          uint64_t v18 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
          [v17 handleFailureInFunction:v18, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v13, objc_opt_class() file lineNumber description];
        }
      }
      else
      {
        id v16 = 0;
      }

      [(HOInitialSetupStateController *)self setPresentedOnboardingController:v16];
LABEL_33:

      break;
  }
}

- (void)homeManager:(id)a3 didUpdateStateForIncomingInvitations:(id)a4
{
  id v8 = a4;
  if ([v8 count] != (id)1) {
    goto LABEL_5;
  }
  uint64_t v5 = [v8 firstObject];
  if ([v5 invitationState] == (id)5)
  {

    goto LABEL_6;
  }
  id v6 = [v8 firstObject];
  id v7 = [v6 invitationState];

  if (v7 != (id)3) {
LABEL_5:
  }
    [(HOInitialSetupStateController *)self reloadState];
LABEL_6:
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5 = a4;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
    int v13 = 136315650;
    id v14 = "-[HOInitialSetupStateController homeManager:didAddHome:]";
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%s) added new home = %@ | Removing new home from pendingHomeIDs if possible. Remaining pending homes = %@", (uint8_t *)&v13, 0x20u);
  }
  id v8 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
  uint64_t v9 = [v5 uuid];
  unsigned int v10 = [v8 containsObject:v9];

  if (v10)
  {
    CFStringRef v11 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
    unint64_t v12 = [v5 uuid];
    [v11 removeObject:v12];
  }
}

- (void)onboardingNavigationControllerDidFinish:(id)a3
{
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dismissing onboarding if needed and finishing onboardingCompleteFuture", buf, 2u);
  }

  id v5 = [(HOInitialSetupStateController *)self _dismissPresentedViewControllerIfNeeded];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001A040;
  v7[3] = &unk_1000C2350;
  v7[4] = self;
  id v6 = [v5 addSuccessBlock:v7];
}

- (void)onboardingNavigationController:(id)a3 acceptedInvitationAndWaitingForHomeToLand:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 hf_prettyDescription];
    *(_DWORD *)buf = 136315650;
    id v20 = "-[HOInitialSetupStateController onboardingNavigationController:acceptedInvitationAndWaitingForHomeToLand:]";
    __int16 v21 = 2112;
    objc_super v22 = v9;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) Incoming invitation was accepted and is pending for new home to land. invitation = %@ | navigationController = %@", buf, 0x20u);
  }
  unsigned int v10 = +[HFHomeKitDispatcher sharedDispatcher];
  CFStringRef v11 = [v10 homeManager];
  unint64_t v12 = [v11 homes];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001A27C;
  v17[3] = &unk_1000C20C0;
  id v13 = v7;
  id v18 = v13;
  unsigned __int8 v14 = [v12 na_any:v17];

  if ((v14 & 1) == 0)
  {
    __int16 v15 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
    id v16 = [v13 homeUUID];
    [v15 na_safeAddObject:v16];
  }
}

- (void)onboardingNavigationController:(id)a3 didAcceptInvitation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 hf_prettyDescription];
    unsigned int v10 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
    int v16 = 136315906;
    __int16 v17 = "-[HOInitialSetupStateController onboardingNavigationController:didAcceptInvitation:]";
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    __int16 v21 = v10;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) Incoming invitation acceptance completed. invitation = %@ | pending homes = %@ | navigationController = %@", (uint8_t *)&v16, 0x2Au);
  }
  CFStringRef v11 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
  unint64_t v12 = [v7 homeUUID];
  unsigned int v13 = [v11 containsObject:v12];

  if (v13)
  {
    unsigned __int8 v14 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
    __int16 v15 = [v7 homeUUID];
    [v14 removeObject:v15];
  }
}

- (void)onboardingNavigationController:(id)a3 didDeclineInvitation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 hf_prettyDescription];
    unsigned int v10 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
    int v16 = 136315906;
    __int16 v17 = "-[HOInitialSetupStateController onboardingNavigationController:didDeclineInvitation:]";
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    __int16 v21 = v10;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) Incoming invitation was declined. Invitation's home is no longer pending. invitation = %@ | pending homes = %@ | navigationController = %@", (uint8_t *)&v16, 0x2Au);
  }
  CFStringRef v11 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
  unint64_t v12 = [v7 homeUUID];
  unsigned int v13 = [v11 containsObject:v12];

  if (v13)
  {
    unsigned __int8 v14 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
    __int16 v15 = [v7 homeUUID];
    [v14 removeObject:v15];
  }
}

- (void)onboardingNavigationController:(id)a3 didIgnoreInvitation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 hf_prettyDescription];
    unsigned int v10 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
    int v16 = 136315906;
    __int16 v17 = "-[HOInitialSetupStateController onboardingNavigationController:didIgnoreInvitation:]";
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    __int16 v21 = v10;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) Incoming invitation was ignored. Invitation's home is no longer pending. invitation = %@ | pending homes = %@ | navigationController = %@", (uint8_t *)&v16, 0x2Au);
  }
  CFStringRef v11 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
  unint64_t v12 = [v7 homeUUID];
  unsigned int v13 = [v11 containsObject:v12];

  if (v13)
  {
    unsigned __int8 v14 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
    __int16 v15 = [v7 homeUUID];
    [v14 removeObject:v15];
  }
}

- (void)onboardingNavigationController:(id)a3 didReportJunkInvitation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 hf_prettyDescription];
    unsigned int v10 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
    int v16 = 136315906;
    __int16 v17 = "-[HOInitialSetupStateController onboardingNavigationController:didReportJunkInvitation:]";
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    __int16 v21 = v10;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) Incoming invitation was reported as junk. Invitation's home is no longer pending. invitation = %@ | pending homes = %@ | navigationController = %@", (uint8_t *)&v16, 0x2Au);
  }
  CFStringRef v11 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
  unint64_t v12 = [v7 homeUUID];
  unsigned int v13 = [v11 containsObject:v12];

  if (v13)
  {
    unsigned __int8 v14 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
    __int16 v15 = [v7 homeUUID];
    [v14 removeObject:v15];
  }
}

- (void)onboardingNavigationController:(id)a3 didDecideLaterInvitation:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFStringRef v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = [v9 hf_prettyDescription];
    unsigned int v13 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
    int v19 = 136316162;
    __int16 v20 = "-[HOInitialSetupStateController onboardingNavigationController:didDecideLaterInvitation:error:]";
    __int16 v21 = 2112;
    __int16 v22 = v12;
    __int16 v23 = 2112;
    id v24 = v13;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(%s) Incoming invitation was marked as decided later. Invitation's home is no longer pending. invitation = %@ | pending homes = %@ | error = %@ | navigationController = %@", (uint8_t *)&v19, 0x34u);
  }
  unsigned __int8 v14 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
  __int16 v15 = [v9 homeUUID];
  unsigned int v16 = [v14 containsObject:v15];

  if (v16)
  {
    __int16 v17 = [(HOInitialSetupStateController *)self pendingHomeIDsFromInvitations];
    __int16 v18 = [v9 homeUUID];
    [v17 removeObject:v18];
  }
}

- (HODataSyncingViewController)presentedDataSyncingController
{
  return self->_presentedDataSyncingController;
}

- (void)setPresentedDataSyncingController:(id)a3
{
}

- (void)setOnboardingCompleteFuture:(id)a3
{
}

- (HOiCloudDisabledViewController)presentediCloudWarningController
{
  return self->_presentediCloudWarningController;
}

- (void)setPresentediCloudWarningController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingHomeIDsFromInvitations, 0);
  objc_storeStrong((id *)&self->_presentediCloudWarningController, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_onboardingCompleteFuture, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentedDataSyncingController, 0);

  objc_storeStrong((id *)&self->_presentedOnboardingController, 0);
}

@end