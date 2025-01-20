@interface MBFollowupPrebuddyViewController
- (BOOL)_hasDisabledCategories;
- (BOOL)_showExpensiveNetworkPromptBeforeNextViewController:(id)a3;
- (BOOL)expensiveNetwork;
- (BOOL)fromManualSignal;
- (BOOL)initiallyNeededHSA2Upgrade;
- (BOOL)needsAccountSignIn;
- (BOOL)needsBackupEnabled;
- (BOOL)needsTemporaryStorage;
- (BOOL)noInitialAccount;
- (FLFollowUpItem)followupItem;
- (MBPrebuddyDisabledCategoriesManager)disabledCategoriesManager;
- (MBPrebuddyLoadingViewController)loadingViewController;
- (NSError)eligibilityError;
- (NSString)altDSIDForHSA2Upgrade;
- (NSString)deepLinkURL;
- (UINavigationController)navController;
- (id)_dateOfLastBackup;
- (id)_disabledBackupDomains;
- (id)_disabledSyncCategories;
- (id)_doneViewController;
- (id)_extraStorageOfferViewController;
- (id)_gettingStartedViewController;
- (id)_initialViewController;
- (id)_moveAllAppsAndDataViewControllerWithDisabledSyncCategories:(id)a3 disabledBackupDomains:(id)a4;
- (id)_startTransferViewController;
- (id)_telemetryQueue;
- (id)_viewControllerAfterExtraStorageOffer;
- (id)_viewControllerAfterGettingStarted:(id)a3;
- (id)_xpcQueue;
- (int64_t)_entryPoint;
- (int64_t)_prebuddyTelemetryForStep:(int64_t)a3;
- (int64_t)daysUntilExpiration;
- (int64_t)eligibilityStatus;
- (void)_beginBackup:(id)a3;
- (void)_extendExpirationDate:(id)a3;
- (void)_fetchDeepLinkURL;
- (void)_presentError:(id)a3;
- (void)_presentNavigationViewControllerWithRootViewController:(id)a3;
- (void)_presentNextViewController:(id)a3;
- (void)_processEligibilityStatus:(int64_t)a3 needsTemporaryStorage:(BOOL)a4 daysUntilExpiration:(int64_t)a5 needsBackupEnabled:(BOOL)a6 error:(id)a7;
- (void)mb_didTapCancelFromViewController:(id)a3;
- (void)mb_didTapNextFromViewController:(id)a3;
- (void)prebuddyCancel:(id)a3;
- (void)prebuddyDone:(id)a3;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)setAltDSIDForHSA2Upgrade:(id)a3;
- (void)setDaysUntilExpiration:(int64_t)a3;
- (void)setDeepLinkURL:(id)a3;
- (void)setDisabledCategoriesManager:(id)a3;
- (void)setEligibilityError:(id)a3;
- (void)setEligibilityStatus:(int64_t)a3;
- (void)setExpensiveNetwork:(BOOL)a3;
- (void)setFollowupItem:(id)a3;
- (void)setFromManualSignal:(BOOL)a3;
- (void)setInitiallyNeededHSA2Upgrade:(BOOL)a3;
- (void)setLoadingViewController:(id)a3;
- (void)setNavController:(id)a3;
- (void)setNeedsAccountSignIn:(BOOL)a3;
- (void)setNeedsBackupEnabled:(BOOL)a3;
- (void)setNeedsTemporaryStorage:(BOOL)a3;
- (void)setNoInitialAccount:(BOOL)a3;
@end

@implementation MBFollowupPrebuddyViewController

- (id)_xpcQueue
{
  if (qword_100023418 != -1) {
    dispatch_once(&qword_100023418, &stru_10001C998);
  }
  v2 = (void *)qword_100023410;
  return v2;
}

- (id)_telemetryQueue
{
  if (qword_100023428 != -1) {
    dispatch_once(&qword_100023428, &stru_10001C9B8);
  }
  v2 = (void *)qword_100023420;
  return v2;
}

- (id)_dateOfLastBackup
{
  v2 = +[MBPrebuddyManager sharedManager];
  v3 = [v2 dateOfLastBackup];

  v4 = objc_opt_new();
  [v4 setDateStyle:2];
  v5 = [v4 stringFromDate:v3];

  return v5;
}

- (int64_t)_entryPoint
{
  v3 = [(MBFollowupPrebuddyViewController *)self deepLinkURL];

  if (v3) {
    return 2;
  }
  if ([(MBFollowupPrebuddyViewController *)self fromManualSignal]) {
    return 3;
  }
  return 1;
}

- (void)_fetchDeepLinkURL
{
  CFStringRef v3 = (const __CFString *)kMBManagerPrebuddyDeepLinkURLKey;
  v4 = (NSString *)CFPreferencesCopyValue(kMBManagerPrebuddyDeepLinkURLKey, @"com.apple.MBHelperApp", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  deepLinkURL = self->_deepLinkURL;
  self->_deepLinkURL = v4;

  if (self->_deepLinkURL)
  {
    CFPreferencesSetValue(v3, 0, @"com.apple.MBHelperApp", @"mobile", kCFPreferencesAnyHost);
    CFPreferencesSynchronize(@"com.apple.MBHelperApp", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  }
}

- (id)_disabledSyncCategories
{
  disabledCategoriesManager = self->_disabledCategoriesManager;
  if (!disabledCategoriesManager)
  {
    v4 = objc_alloc_init(MBPrebuddyDisabledCategoriesManager);
    v5 = self->_disabledCategoriesManager;
    self->_disabledCategoriesManager = v4;

    disabledCategoriesManager = self->_disabledCategoriesManager;
  }
  id v10 = 0;
  v6 = [(MBPrebuddyDisabledCategoriesManager *)disabledCategoriesManager disabledSyncDataclasses:&v10];
  id v7 = v10;
  if (!v6)
  {
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to fetch disabled sync categories: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }
  return v6;
}

- (id)_disabledBackupDomains
{
  disabledCategoriesManager = self->_disabledCategoriesManager;
  if (!disabledCategoriesManager)
  {
    v4 = objc_alloc_init(MBPrebuddyDisabledCategoriesManager);
    v5 = self->_disabledCategoriesManager;
    self->_disabledCategoriesManager = v4;

    disabledCategoriesManager = self->_disabledCategoriesManager;
  }
  BOOL needsTemporaryStorage = self->_needsTemporaryStorage;
  return [(MBPrebuddyDisabledCategoriesManager *)disabledCategoriesManager disabledBackupDomains:needsTemporaryStorage];
}

- (BOOL)_hasDisabledCategories
{
  CFStringRef v3 = [(MBFollowupPrebuddyViewController *)self _disabledSyncCategories];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(MBFollowupPrebuddyViewController *)self _disabledBackupDomains];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (id)_initialViewController
{
  if (self->_eligibilityStatus == 2)
  {
    if (self->_needsTemporaryStorage)
    {
      CFStringRef v3 = [(MBFollowupPrebuddyViewController *)self _extraStorageOfferViewController];
      goto LABEL_19;
    }
    if ([(MBFollowupPrebuddyViewController *)self needsAccountSignIn]) {
      goto LABEL_18;
    }
    v9 = [(MBFollowupPrebuddyViewController *)self altDSIDForHSA2Upgrade];
    if (!v9 && ![(MBFollowupPrebuddyViewController *)self _hasDisabledCategories])
    {
      if (![(MBFollowupPrebuddyViewController *)self needsBackupEnabled])
      {
        CFStringRef v3 = [(MBFollowupPrebuddyViewController *)self _doneViewController];
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  BOOL v4 = [(NSError *)self->_eligibilityError domain];
  unsigned int v5 = [v4 isEqualToString:@"MBMegaBackupEligibilityErrorDomain"];

  if (v5)
  {
    NSInteger v6 = [(NSError *)self->_eligibilityError code];
    if (v6 == 5)
    {
      [(MBFollowupPrebuddyViewController *)self setInitiallyNeededHSA2Upgrade:1];
      v9 = [(NSError *)self->_eligibilityError userInfo];
      id v10 = [v9 objectForKeyedSubscript:@"MBMegaBackupEligibilityErrorUserInfoAltDSIDKey"];
      [(MBFollowupPrebuddyViewController *)self setAltDSIDForHSA2Upgrade:v10];

LABEL_17:
      goto LABEL_18;
    }
    if (v6 == 1)
    {
      [(MBFollowupPrebuddyViewController *)self setNoInitialAccount:1];
      [(MBFollowupPrebuddyViewController *)self setNeedsAccountSignIn:1];
LABEL_18:
      CFStringRef v3 = [(MBFollowupPrebuddyViewController *)self _gettingStartedViewController];
      goto LABEL_19;
    }
  }
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    eligibilityError = self->_eligibilityError;
    *(_DWORD *)buf = 138543362;
    v13 = eligibilityError;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "_initialViewController should not be here. eligibilityError: %{public}@", buf, 0xCu);
    _MBLog();
  }

  CFStringRef v3 = 0;
LABEL_19:
  return v3;
}

- (id)_gettingStartedViewController
{
  CFStringRef v3 = [MBPrebuddyGettingStartedViewController alloc];
  int64_t v4 = [(MBFollowupPrebuddyViewController *)self _entryPoint];
  unsigned int v5 = [(MBFollowupPrebuddyViewController *)self deepLinkURL];
  BOOL v6 = [(MBFollowupPrebuddyViewController *)self needsAccountSignIn];
  id v7 = [(MBFollowupPrebuddyViewController *)self altDSIDForHSA2Upgrade];
  v8 = [(MBPrebuddyGettingStartedViewController *)v3 initWithFlow:self entryPoint:v4 deepLinkURL:v5 needsAccountSignIn:v6 altDSIDForHSA2Upgrade:v7];

  return v8;
}

- (id)_extraStorageOfferViewController
{
  v2 = [[MBPrebuddyIntroExtraStorageOfferViewController alloc] initWithFlow:self daysUntilExpiration:[(MBFollowupPrebuddyViewController *)self daysUntilExpiration]];
  return v2;
}

- (id)_startTransferViewController
{
  v2 = [[MBPrebuddyStartTransferViewController alloc] initWithFlow:self needsTemporaryStorage:[(MBFollowupPrebuddyViewController *)self needsTemporaryStorage] daysUntilExpiration:[(MBFollowupPrebuddyViewController *)self daysUntilExpiration]];
  return v2;
}

- (id)_moveAllAppsAndDataViewControllerWithDisabledSyncCategories:(id)a3 disabledBackupDomains:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[MBPrebuddyDisabledDataclassesViewController alloc] initWithFlow:self disabledSyncCategories:v7 disabledBackupDomains:v6 needsTemporaryStorage:[(MBFollowupPrebuddyViewController *)self needsTemporaryStorage]];

  return v8;
}

- (id)_doneViewController
{
  v2 = [[MBPrebuddyDoneViewController alloc] initWithFlow:self];
  return v2;
}

- (id)_viewControllerAfterGettingStarted:(id)a3
{
  id v4 = a3;
  self->_eligibilityStatus = (int64_t)[v4 eligibilityStatus];
  unsigned int v5 = [v4 eligibilityError];
  eligibilityError = self->_eligibilityError;
  self->_eligibilityError = v5;

  self->_BOOL needsTemporaryStorage = [v4 needsTemporaryStorage];
  id v7 = [v4 daysUntilExpiration];

  self->_daysUntilExpiration = (int64_t)v7;
  if ([(MBFollowupPrebuddyViewController *)self noInitialAccount]
    || [(MBFollowupPrebuddyViewController *)self needsTemporaryStorage])
  {
    if (self->_eligibilityStatus == 2)
    {
      v8 = [(MBFollowupPrebuddyViewController *)self _startTransferViewController];
    }
    else
    {
      v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = self->_eligibilityError;
        *(_DWORD *)buf = 138543362;
        v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "_viewControllerAfterGettingStarted: should not be here. eligibilityError: %{public}@", buf, 0xCu);
        _MBLog();
      }

      v8 = 0;
    }
  }
  else
  {
    v8 = [(MBFollowupPrebuddyViewController *)self _viewControllerAfterExtraStorageOffer];
  }
  return v8;
}

- (id)_viewControllerAfterExtraStorageOffer
{
  CFStringRef v3 = [(MBFollowupPrebuddyViewController *)self _disabledSyncCategories];
  id v4 = [v3 allObjects];

  unsigned int v5 = [(MBFollowupPrebuddyViewController *)self _disabledBackupDomains];
  if ([v4 count] || objc_msgSend(v5, "count"))
  {
    uint64_t v6 = [(MBFollowupPrebuddyViewController *)self _moveAllAppsAndDataViewControllerWithDisabledSyncCategories:v4 disabledBackupDomains:v5];
  }
  else
  {
    uint64_t v6 = [(MBFollowupPrebuddyViewController *)self _viewControllerAfterMoveAllAppsAndData];
  }
  id v7 = (void *)v6;

  return v7;
}

- (void)prebuddyDone:(id)a3
{
  +[DKFollowUp clearFollowUp];
  id v4 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C7E4;
  block[3] = &unk_10001C9E0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)prebuddyCancel:(id)a3
{
  id v4 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C914;
  block[3] = &unk_10001C9E0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_presentNavigationViewControllerWithRootViewController:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MBFollowupPrebuddyViewController *)self navController];

  if (v5)
  {
    [v4 setModalPresentationStyle:0];
    uint64_t v6 = [(MBFollowupPrebuddyViewController *)self navController];
    id v9 = v4;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];

    [v6 setViewControllers:v7 animated:0];
  }
  else
  {
    id v8 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];

    [(MBFollowupPrebuddyViewController *)self setNavController:v8];
    [v8 setModalPresentationStyle:0];
    [v8 setModalInPresentation:1];
    [(MBFollowupPrebuddyViewController *)self presentViewController:v8 animated:0 completion:0];
  }
}

- (void)_processEligibilityStatus:(int64_t)a3 needsTemporaryStorage:(BOOL)a4 daysUntilExpiration:(int64_t)a5 needsBackupEnabled:(BOOL)a6 error:(id)a7
{
  BOOL v10 = a4;
  id v13 = a7;
  self->_eligibilityStatus = a3;
  objc_storeStrong((id *)&self->_eligibilityError, a7);
  self->_daysUntilExpiration = a5;
  self->_needsBackupEnabled = a6;
  switch(a3)
  {
    case 2:
      v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = +[NSNumber numberWithBool:v10];
        *(_DWORD *)buf = 138543362;
        id v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "MBMegaBackupEligibilityStateEligible: needsTemporaryStorage: %{public}@", buf, 0xCu);

        v21 = +[NSNumber numberWithBool:v10];
        _MBLog();
      }
      self->_BOOL needsTemporaryStorage = v10;
      break;
    case 1:
      v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "MBMegaBackupEligibilityStateIneligible: %{public}@", buf, 0xCu);
        v21 = v13;
        _MBLog();
      }

      v18 = [v13 domain];
      if ([v18 isEqualToString:@"MBMegaBackupEligibilityErrorDomain"])
      {
        id v19 = [v13 code];

        if (v19 == (id)6)
        {
LABEL_14:
          -[MBFollowupPrebuddyViewController _presentError:](self, "_presentError:", v13, v21);
          goto LABEL_20;
        }
      }
      else
      {
      }
      break;
    case 0:
      v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "MBMegaBackupEligibilityStateError: %{public}@", buf, 0xCu);
        v21 = v13;
        _MBLog();
      }

      goto LABEL_14;
  }
  v20 = [(MBFollowupPrebuddyViewController *)self _initialViewController];
  if (objc_msgSend(v20, "mb_step") == (id)5) {
    [(MBFollowupPrebuddyViewController *)self _presentNextViewController:v20];
  }
  else {
    [(MBFollowupPrebuddyViewController *)self _presentNavigationViewControllerWithRootViewController:v20];
  }

LABEL_20:
}

- (void)_presentError:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MBFollowupPrebuddyViewController *)self loadingViewController];
  [v5 stopAnimating];

  uint64_t v6 = MBLocalizedStringFromTable();
  id v7 = MBLocalizedStringFromTable();
  id v8 = MBLocalizedStringFromTable();
  id v9 = [v4 domain];
  uint64_t v10 = _ICQMegaBackupErrorDomain;
  if ([v9 isEqualToString:_ICQMegaBackupErrorDomain])
  {
    id v11 = [v4 code];

    if (v11 == (id)5)
    {
      int v12 = MGGetBoolAnswer();
      id v13 = @"WIFI";
      if (v12) {
        id v13 = @"WLAN";
      }
      v14 = v13;
      v15 = objc_opt_new();
      v16 = +[ACAccountStore defaultStore];
      v17 = objc_msgSend(v16, "aa_primaryAppleAccount");
      unsigned int v18 = [v15 isBackupOnCellularAllowedWithAccount:v17 error:0];

      if (v18) {
        CFStringRef v19 = @"MB_PREBUDDY_NETWORK_%@_CELLULAR_ERROR_TITLE";
      }
      else {
        CFStringRef v19 = @"MB_PREBUDDY_NETWORK_%@_ERROR_TITLE";
      }
      v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v14);

      uint64_t v21 = MBLocalizedStringFromTable();

      char v22 = 0;
      id v7 = 0;
      goto LABEL_29;
    }
  }
  else
  {
  }
  id v23 = [v4 domain];
  if ([v23 isEqualToString:v10])
  {
    id v24 = [v4 code];

    if (v24 == (id)6)
    {
LABEL_27:
      uint64_t v21 = MBLocalizedStringFromTable();

      uint64_t v27 = MBLocalizedStringFromTable();

      uint64_t v28 = MBLocalizedStringFromTable();
      char v22 = 0;
      v15 = v8;
      goto LABEL_28;
    }
  }
  else
  {
  }
  v25 = [v4 domain];
  if ([v25 isEqualToString:@"MBMegaBackupEligibilityErrorDomain"])
  {
    id v26 = [v4 code];

    if (v26 == (id)6)
    {
      uint64_t v21 = MBLocalizedStringFromTable();

      uint64_t v27 = MBLocalizedStringFromTable();

      uint64_t v28 = MBLocalizedStringFromTable();
      v15 = v8;
      char v22 = 1;
LABEL_28:
      id v8 = (void *)v28;
      id v7 = (void *)v27;
LABEL_29:
      uint64_t v6 = (void *)v21;
      goto LABEL_30;
    }
  }
  else
  {
  }
  v29 = [v4 domain];
  if ([v29 isEqualToString:@"MBMegaBackupEligibilityErrorDomain"])
  {
    id v30 = [v4 code];

    if (v30 == (id)2) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  v15 = [v4 domain];
  if ([v15 isEqualToString:@"MBMegaBackupEligibilityErrorDomain"])
  {
    if ([v4 code] == (id)3)
    {
    }
    else
    {
      id v31 = [v4 code];

      if (v31 != (id)4)
      {
        char v22 = 0;
        goto LABEL_31;
      }
    }
    goto LABEL_27;
  }
  char v22 = 0;
LABEL_30:

LABEL_31:
  v32 = +[UIAlertController alertControllerWithTitle:v6 message:v7 preferredStyle:1];
  v33 = MBPrebuddyAlertIcon();
  [v32 setImage:v33];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10000D318;
  v37[3] = &unk_10001CA08;
  char v38 = v22;
  v37[4] = self;
  v34 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v37];
  [v32 addAction:v34];
  v35 = [(MBFollowupPrebuddyViewController *)self navController];
  v36 = [v35 visibleViewController];
  [v36 presentViewController:v32 animated:1 completion:0];
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  id v11 = [v9 identifier];
  unsigned int v12 = [v11 isEqualToString:@"ExtendMegaBackupExpirationFollowUpIdentifier"];

  if (v12)
  {
    v10[2](v10, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000DAE4;
    block[3] = &unk_10001C9E0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10000DB74;
    v53[3] = &unk_10001C6E8;
    v53[4] = self;
    [(MBFollowupPrebuddyViewController *)self _extendExpirationDate:v53];
    goto LABEL_18;
  }
  id v13 = [v9 identifier];
  unsigned int v14 = [v13 isEqualToString:@"TrackOrderFollowUpIdentifier"];

  if (v14)
  {
    v15 = +[NSURL URLWithString:@"https://www.apple.com/shop/orders/list"];
    v16 = +[LSApplicationWorkspace defaultWorkspace];
    id v52 = 0;
    unsigned __int8 v17 = [v16 openURL:v15 withOptions:0 error:&v52];
    unsigned int v18 = (__CFString *)v52;

    if ((v17 & 1) == 0)
    {
      CFStringRef v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v56 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to open track orders URL: %@", buf, 0xCu);
LABEL_15:
        _MBLog();
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v20 = [v9 identifier];
  unsigned int v21 = [v20 isEqualToString:@"TurnOnAppsUsingiCloudFollowUpIdentifier"];

  if (v21)
  {
    v15 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass"];
    char v22 = +[LSApplicationWorkspace defaultWorkspace];
    id v51 = 0;
    unsigned __int8 v23 = [v22 openSensitiveURL:v15 withOptions:0 error:&v51];
    unsigned int v18 = (__CFString *)v51;

    if ((v23 & 1) == 0)
    {
      CFStringRef v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v56 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to open iCloud sync URL: %@", buf, 0xCu);
        goto LABEL_15;
      }
LABEL_16:
    }
LABEL_17:
    v10[2](v10, 1);

    goto LABEL_18;
  }
  id v24 = [v9 identifier];
  unsigned int v25 = [v24 isEqualToString:@"TurnOnAppsBackingUpFollowUpIdentifier"];

  if (v25)
  {
    v15 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/LOCAL_BACKUP"];
    id v26 = +[LSApplicationWorkspace defaultWorkspace];
    id v50 = 0;
    unsigned __int8 v27 = [v26 openSensitiveURL:v15 withOptions:0 error:&v50];
    unsigned int v18 = (__CFString *)v50;

    if ((v27 & 1) == 0)
    {
      CFStringRef v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v56 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to open backup toggles URL: %@", buf, 0xCu);
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  uint64_t v28 = objc_opt_new();
  v29 = +[NSDate now];
  id v49 = 0;
  unsigned __int8 v30 = [v28 setPrebuddyUIDeltaTelemetry:@"EnterPrebuddyUIDateDelta" date:v29 error:&v49];
  id v31 = v49;

  if ((v30 & 1) == 0)
  {
    v32 = MBGetDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v56 = @"EnterPrebuddyUIDateDelta";
      __int16 v57 = 2112;
      id v58 = v31;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to set telemetry %@: %@", buf, 0x16u);
      CFStringRef v42 = @"EnterPrebuddyUIDateDelta";
      id v43 = v31;
      _MBLog();
    }
  }
  v33 = objc_msgSend(v9, "userInfo", v42, v43);
  uint64_t v34 = [v33 objectForKeyedSubscript:MBPrebuddyFollowUpIsManualSignalKey];
  -[MBFollowupPrebuddyViewController setFromManualSignal:](self, "setFromManualSignal:", [(id)v34 BOOLValue]);

  [(MBFollowupPrebuddyViewController *)self _fetchDeepLinkURL];
  int64_t v35 = [(MBFollowupPrebuddyViewController *)self _entryPoint];
  id v48 = 0;
  LOBYTE(v34) = [v28 setEntryPointForMegaBackupTelemetry:v35 error:&v48];
  id v36 = v48;
  if ((v34 & 1) == 0)
  {
    v37 = MBGetDefaultLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      CFStringRef v56 = (const __CFString *)v35;
      __int16 v57 = 2112;
      id v58 = v36;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to set EntryPoint for MegaBackup telemetry to %ld: %@", buf, 0x16u);
      _MBLog();
    }
  }
  char v38 = objc_alloc_init(MBMegaBackupEligibilityManager);
  v39 = v38;
  if (self->_deepLinkURL && [(MBMegaBackupEligibilityManager *)v38 needsAccountSignIn])
  {
    v10[2](v10, 1);
  }
  else
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10000DC10;
    v47[3] = &unk_10001C9E0;
    v47[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v47);
    v40 = [(MBFollowupPrebuddyViewController *)self _xpcQueue];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10000DCA0;
    v44[3] = &unk_10001CA58;
    v44[4] = self;
    v45 = v39;
    int64_t v46 = v35;
    v41 = v39;
    dispatch_async(v40, v44);

    [(MBFollowupPrebuddyViewController *)self setFollowupItem:v8];
    v10[2](v10, 0);
  }

LABEL_18:
}

- (void)_extendExpirationDate:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[ACAccountStore defaultStore];
  uint64_t v6 = objc_msgSend(v5, "aa_primaryAppleAccount");

  if (v6)
  {
    id v7 = objc_opt_new();
    id v8 = [v7 backupDeviceUUID];
    id v9 = +[NSDate now];
    id v18 = 0;
    unsigned __int8 v10 = [v7 setPrebuddyUIDeltaTelemetry:@"MegaBackupRefreshDelta" date:v9 error:&v18];
    id v11 = v18;

    if ((v10 & 1) == 0)
    {
      unsigned int v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v20 = @"MegaBackupRefreshDelta";
        __int16 v21 = 2112;
        id v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to set telemetry %@: %@", buf, 0x16u);
        _MBLog();
      }
    }
    id v13 = objc_alloc_init((Class)_ICQMegaBackupManager);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000E0DC;
    v15[3] = &unk_10001CAD0;
    id v16 = v7;
    id v17 = v4;
    v15[4] = self;
    id v14 = v7;
    [v13 extendExpirationForAccount:v6 deviceBackupUUID:v8 requestedExpirationDate:0 queue:&_dispatch_main_q completion:v15];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)_beginBackup:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MBFollowupPrebuddyViewController *)self _xpcQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E954;
  v7[3] = &unk_10001C8B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)_showExpensiveNetworkPromptBeforeNextViewController:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_opt_new();
  id v6 = [v5 path];
  id v7 = [v6 interface];
  unsigned int v8 = [v7 isExpensive];

  if (v8)
  {
    [(MBFollowupPrebuddyViewController *)self setExpensiveNetwork:1];
    id v9 = MBLocalizedStringFromTable();
    unsigned __int8 v10 = MBLocalizedStringFromTable();
    id v11 = +[UIAlertController alertControllerWithTitle:v9 message:v10 preferredStyle:1];

    unsigned int v12 = MBPrebuddyAlertIcon();
    [v11 setImage:v12];

    id v13 = MBLocalizedStringFromTable();
    id v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:&stru_10001CAF0];
    [v11 addAction:v14];

    v15 = MBLocalizedStringFromTable();
    CFStringRef v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    id v22 = sub_10000EDE8;
    unsigned __int8 v23 = &unk_10001CB68;
    id v24 = self;
    id v25 = v4;
    id v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:&v20];
    objc_msgSend(v11, "addAction:", v16, v20, v21, v22, v23, v24);

    id v17 = [(MBFollowupPrebuddyViewController *)self navController];
    id v18 = [v17 visibleViewController];
    [v18 presentViewController:v11 animated:1 completion:0];
  }
  return v8;
}

- (int64_t)_prebuddyTelemetryForStep:(int64_t)a3
{
  if ((unint64_t)a3 < 6) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (void)mb_didTapNextFromViewController:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "mb_step");
  id v6 = [(MBFollowupPrebuddyViewController *)self _telemetryQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000F1B0;
  v9[3] = &unk_10001CB90;
  v9[4] = self;
  v9[5] = v5;
  dispatch_async(v6, v9);

  switch((unint64_t)v5)
  {
    case 0uLL:
      [(MBFollowupPrebuddyViewController *)self setNeedsAccountSignIn:0];
      [(MBFollowupPrebuddyViewController *)self setAltDSIDForHSA2Upgrade:0];
      uint64_t v7 = [(MBFollowupPrebuddyViewController *)self _viewControllerAfterGettingStarted:v4];
      goto LABEL_7;
    case 1uLL:
      [(MBFollowupPrebuddyViewController *)self prebuddyCancel:self];
      goto LABEL_9;
    case 2uLL:
    case 3uLL:
      uint64_t v7 = [(MBFollowupPrebuddyViewController *)self _viewControllerAfterExtraStorageOffer];
      goto LABEL_7;
    case 4uLL:
      uint64_t v7 = [(MBFollowupPrebuddyViewController *)self _viewControllerAfterMoveAllAppsAndData];
LABEL_7:
      unsigned int v8 = (void *)v7;
      break;
    default:
      unsigned int v8 = 0;
      break;
  }
  [(MBFollowupPrebuddyViewController *)self _presentNextViewController:v8];

LABEL_9:
}

- (void)mb_didTapCancelFromViewController:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "mb_step");
  if ((unint64_t)v5 >= 4)
  {
    if (v5 == (id)4)
    {
      uint64_t v7 = [(MBFollowupPrebuddyViewController *)self _viewControllerAfterMoveAllAppsAndData];
    }
    else
    {
      if (v5 == (id)5)
      {
        id v6 = MBGetDefaultLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)unsigned int v8 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "mb_didTapCancelFromViewController: should not be here.", v8, 2u);
          _MBLog();
        }
      }
      uint64_t v7 = 0;
    }
    [(MBFollowupPrebuddyViewController *)self _presentNextViewController:v7];
  }
  else
  {
    [(MBFollowupPrebuddyViewController *)self prebuddyCancel:v4];
  }
}

- (void)_presentNextViewController:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "mb_step") == (id)5)
  {
    [(MBFollowupPrebuddyViewController *)self setExpensiveNetwork:0];
    if (![(MBFollowupPrebuddyViewController *)self _showExpensiveNetworkPromptBeforeNextViewController:v4])
    {
      dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000F58C;
      v15[3] = &unk_10001CB40;
      v15[4] = self;
      id v16 = v4;
      id v6 = v5;
      id v17 = v6;
      [(MBFollowupPrebuddyViewController *)self _beginBackup:v15];
      dispatch_time_t v7 = dispatch_time(0, 300000000);
      if (dispatch_semaphore_wait(v6, v7))
      {
        unsigned int v8 = [(MBFollowupPrebuddyViewController *)self navController];
        id v9 = [v8 topViewController];
        unsigned __int8 v10 = [(MBFollowupPrebuddyViewController *)self loadingViewController];
        unsigned __int8 v11 = [v9 isEqual:v10];

        if ((v11 & 1) == 0)
        {
          unsigned int v12 = [(MBFollowupPrebuddyViewController *)self navController];
          id v13 = [(MBFollowupPrebuddyViewController *)self loadingViewController];
          [v12 pushViewController:v13 animated:1];
        }
      }
    }
  }
  else if (v4)
  {
    id v14 = [(MBFollowupPrebuddyViewController *)self navController];
    [v14 pushViewController:v4 animated:1];
  }
  else
  {
    [(MBFollowupPrebuddyViewController *)self prebuddyDone:self];
  }
}

- (FLFollowUpItem)followupItem
{
  return self->_followupItem;
}

- (void)setFollowupItem:(id)a3
{
}

- (UINavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
}

- (MBPrebuddyLoadingViewController)loadingViewController
{
  return self->_loadingViewController;
}

- (void)setLoadingViewController:(id)a3
{
}

- (NSString)deepLinkURL
{
  return self->_deepLinkURL;
}

- (void)setDeepLinkURL:(id)a3
{
}

- (BOOL)fromManualSignal
{
  return self->_fromManualSignal;
}

- (void)setFromManualSignal:(BOOL)a3
{
  self->_fromManualSignal = a3;
}

- (BOOL)noInitialAccount
{
  return self->_noInitialAccount;
}

- (void)setNoInitialAccount:(BOOL)a3
{
  self->_noInitialAccount = a3;
}

- (BOOL)needsAccountSignIn
{
  return self->_needsAccountSignIn;
}

- (void)setNeedsAccountSignIn:(BOOL)a3
{
  self->_needsAccountSignIn = a3;
}

- (BOOL)initiallyNeededHSA2Upgrade
{
  return self->_initiallyNeededHSA2Upgrade;
}

- (void)setInitiallyNeededHSA2Upgrade:(BOOL)a3
{
  self->_initiallyNeededHSA2Upgrade = a3;
}

- (NSString)altDSIDForHSA2Upgrade
{
  return self->_altDSIDForHSA2Upgrade;
}

- (void)setAltDSIDForHSA2Upgrade:(id)a3
{
}

- (BOOL)needsBackupEnabled
{
  return self->_needsBackupEnabled;
}

- (void)setNeedsBackupEnabled:(BOOL)a3
{
  self->_needsBackupEnabled = a3;
}

- (int64_t)eligibilityStatus
{
  return self->_eligibilityStatus;
}

- (void)setEligibilityStatus:(int64_t)a3
{
  self->_eligibilityStatus = a3;
}

- (BOOL)needsTemporaryStorage
{
  return self->_needsTemporaryStorage;
}

- (void)setNeedsTemporaryStorage:(BOOL)a3
{
  self->_BOOL needsTemporaryStorage = a3;
}

- (int64_t)daysUntilExpiration
{
  return self->_daysUntilExpiration;
}

- (void)setDaysUntilExpiration:(int64_t)a3
{
  self->_daysUntilExpiration = a3;
}

- (NSError)eligibilityError
{
  return self->_eligibilityError;
}

- (void)setEligibilityError:(id)a3
{
}

- (MBPrebuddyDisabledCategoriesManager)disabledCategoriesManager
{
  return self->_disabledCategoriesManager;
}

- (void)setDisabledCategoriesManager:(id)a3
{
}

- (BOOL)expensiveNetwork
{
  return self->_expensiveNetwork;
}

- (void)setExpensiveNetwork:(BOOL)a3
{
  self->_expensiveNetwork = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledCategoriesManager, 0);
  objc_storeStrong((id *)&self->_eligibilityError, 0);
  objc_storeStrong((id *)&self->_altDSIDForHSA2Upgrade, 0);
  objc_storeStrong((id *)&self->_deepLinkURL, 0);
  objc_storeStrong((id *)&self->_loadingViewController, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_followupItem, 0);
}

@end