@interface COSSatellitePairingHelper
+ (void)popToLoginControllerFromController:(id)a3;
- (UIViewController)alertPresentationViewController;
- (id)_accountManager;
- (id)_familyEligibilityRequester;
- (id)accountsForAccountManager:(id)a3;
- (void)_checkFamilyEligibilityWithCompletion:(id)a3;
- (void)_finishedWithResult:(unint64_t)a3 completion:(id)a4;
- (void)checkPairingPreconditionsWithCompletion:(id)a3;
- (void)setAlertPresentationViewController:(id)a3;
@end

@implementation COSSatellitePairingHelper

- (void)checkPairingPreconditionsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(COSSatellitePairingHelper *)self alertPresentationViewController];

  if (!v5)
  {
    v6 = pbb_setupflow_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100174098(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v14 = pbb_setupflow_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = +[CDPAccount sharedInstance];
    v16 = [v15 primaryAccountUsername];
    v17 = +[CDPAccount sharedInstance];
    v18 = [v17 primaryAccountDSID];
    v19 = +[CDPAccount sharedInstance];
    v20 = [v19 primaryAccountAltDSID];
    *(_DWORD *)buf = 138412802;
    v34 = v16;
    __int16 v35 = 2112;
    v36 = v18;
    __int16 v37 = 2112;
    v38 = v20;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "########## %@ -- %@ -- %@", buf, 0x20u);
  }
  v21 = +[CDPAccount sharedInstance];
  v22 = [v21 primaryAccountAltDSID];
  BOOL v23 = v22 == 0;

  if (v23)
  {
    [(COSSatellitePairingHelper *)self _finishedWithResult:1 completion:v4];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    id v24 = objc_alloc_init((Class)FAFetchFamilyCircleRequest);
    [v24 setCachePolicy:2];
    v25 = [UIApp setupController];
    v26 = pbb_accountsignin_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Satellite pairing helper FAFetchFamilyCircleRequest start", v32, 2u);
    }

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000CB7B4;
    v28[3] = &unk_100246808;
    id v27 = v25;
    id v29 = v27;
    objc_copyWeak(&v31, (id *)buf);
    id v30 = v4;
    [v24 startRequestWithCompletionHandler:v28];

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_checkFamilyEligibilityWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(COSSatellitePairingHelper *)self _familyEligibilityRequester];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CBF78;
  v7[3] = &unk_100246830;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 requestFamilyEligibilityWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_finishedWithResult:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v29 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Finished checking pairing preconditions with result: %lu", buf, 0xCu);
  }

  switch(a3)
  {
    case 0uLL:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000CC56C;
      block[3] = &unk_100244668;
      id v27 = v6;
      id v8 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      id v9 = v27;
      goto LABEL_17;
    case 1uLL:
      uint64_t v13 = +[NSBundle mainBundle];
      v14 = v13;
      CFStringRef v15 = @"GUARDIAN_DEVICE_HAS_NO_APPLE_ID_ACCOUNT";
      goto LABEL_13;
    case 2uLL:
      uint64_t v13 = +[NSBundle mainBundle];
      v14 = v13;
      CFStringRef v15 = @"GUARDIAN_DEVICE_IS_FAMILY_INELIGIBLE";
      goto LABEL_13;
    case 3uLL:
      uint64_t v13 = +[NSBundle mainBundle];
      v14 = v13;
      CFStringRef v15 = @"GUARDIAN_DEVICE_IS_UNDERAGE";
      goto LABEL_13;
    case 4uLL:
      v16 = +[NSBundle mainBundle];
      uint64_t v10 = [v16 localizedStringForKey:@"DEVICE_IS_NOT_PARENT_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];

      v14 = +[NSBundle mainBundle];
      uint64_t v11 = [v14 localizedStringForKey:@"DEVICE_IS_NOT_PARENT" value:&stru_100249230 table:@"Localizable-tinker"];
      CFStringRef v12 = @"https://support.apple.com/HT201060";
      goto LABEL_15;
    case 5uLL:
      v17 = +[NSBundle mainBundle];
      uint64_t v10 = [v17 localizedStringForKey:@"TINKER_OVER_LIMIT_ERROR_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];

      v14 = +[NSBundle mainBundle];
      uint64_t v11 = [v14 localizedStringForKey:@"TINKER_OVER_LIMIT_ERROR_MESSAGE" value:&stru_100249230 table:@"Localizable-tinker"];
      goto LABEL_14;
    case 6uLL:
      uint64_t v13 = +[NSBundle mainBundle];
      v14 = v13;
      CFStringRef v15 = @"NO_SERVER_CONNECTIVITY";
      goto LABEL_13;
    case 7uLL:
      uint64_t v13 = +[NSBundle mainBundle];
      v14 = v13;
      CFStringRef v15 = @"FAILED_PRECONDITION_REQUEST";
LABEL_13:
      uint64_t v10 = [v13 localizedStringForKey:v15 value:&stru_100249230 table:@"Localizable-tinker"];
      uint64_t v11 = 0;
LABEL_14:
      CFStringRef v12 = 0;
LABEL_15:

      break;
    default:
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      CFStringRef v12 = 0;
      break;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000CC588;
  v19[3] = &unk_100246880;
  id v20 = v10;
  id v21 = v11;
  id v24 = v6;
  unint64_t v25 = a3;
  v22 = (__CFString *)v12;
  BOOL v23 = self;
  id v18 = v6;
  id v9 = v11;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);

LABEL_17:
}

- (id)_familyEligibilityRequester
{
  id v3 = objc_alloc((Class)FAFamilyEligibilityRequester);
  id v4 = [(COSSatellitePairingHelper *)self _accountManager];
  id v5 = [v3 initWithAccountManager:v4];

  return v5;
}

- (id)_accountManager
{
  accountManager = self->_accountManager;
  if (!accountManager)
  {
    id v4 = (ACAccountStore *)objc_alloc_init((Class)ACAccountStore);
    store = self->_store;
    self->_store = v4;

    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v6 = (void *)qword_10029B1E8;
    uint64_t v15 = qword_10029B1E8;
    if (!qword_10029B1E8)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000CD17C;
      v11[3] = &unk_1002436A8;
      v11[4] = &v12;
      sub_1000CD17C((uint64_t)v11);
      id v6 = (void *)v13[3];
    }
    uint64_t v7 = v6;
    _Block_object_dispose(&v12, 8);
    id v8 = (AIDAAccountManager *)[[v7 alloc] initWithAccountStore:self->_store];
    id v9 = self->_accountManager;
    self->_accountManager = v8;

    [(AIDAAccountManager *)self->_accountManager setDelegate:self];
    accountManager = self->_accountManager;
  }

  return accountManager;
}

- (id)accountsForAccountManager:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 accountStore];
  id v6 = [v5 aa_primaryAppleAccount];

  if (v6)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v7 = (void *)qword_10029B1F8;
    uint64_t v15 = qword_10029B1F8;
    if (!qword_10029B1F8)
    {
      id v8 = (void *)sub_1000CD1D4();
      v13[3] = (uint64_t)dlsym(v8, "AIDAServiceTypeCloud");
      qword_10029B1F8 = v13[3];
      uint64_t v7 = (void *)v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (!v7)
    {
      uint64_t v11 = (_Unwind_Exception *)sub_100171A7C();
      _Block_object_dispose(&v12, 8);
      _Unwind_Resume(v11);
    }
    [v4 setObject:v6 forKeyedSubscript:*v7];
  }
  id v9 = [v4 copy];

  return v9;
}

+ (void)popToLoginControllerFromController:(id)a3
{
  id v30 = a3;
  id v3 = [UIApp setupController];
  id v4 = [v3 navigationController];

  unint64_t v29 = v4;
  id v5 = [v4 viewControllers];
  id v6 = [v5 mutableCopy];

  uint64_t v7 = [UIApp setupController];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = [v7 buddyControllers];
  id v9 = [v8 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v15 = objc_opt_class();
        if ([v15 isEqual:objc_opt_class()])
        {
          id v16 = v14;

          uint64_t v11 = v16;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v17 = [v6 reverseObjectEnumerator];
  id v18 = [v17 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v32;
    v28 = v7;
    while (2)
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
        BOOL v23 = objc_opt_class();
        if ([v23 isEqual:objc_opt_class()])
        {
          uint64_t v7 = v28;
          [v11 setDelegate:v28];
          [v6 removeObject:v22];
          goto LABEL_22;
        }
        [v6 removeObject:v22];
      }
      id v19 = [v17 countByEnumeratingWithState:&v31 objects:v41 count:16];
      uint64_t v7 = v28;
      if (v19) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  if (v11)
  {
    id v24 = [v11 viewController];
    unint64_t v25 = pbb_accountsignin_log();
    v26 = v30;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "sign in vc: %@", buf, 0xCu);
    }

    [v6 addObject:v24];
    [v29 setViewControllers:v6 animated:1];
  }
  else
  {
    id v27 = pbb_accountsignin_log();
    v26 = v30;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "COSTinkeriCloudLoginViewController not in navstack.  Pushing to it", buf, 2u);
    }

    id v24 = [v30 delegate];
    [v24 buddyControllerDone:v30 nextControllerClass:objc_opt_class()];
  }
}

- (UIViewController)alertPresentationViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertPresentationViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setAlertPresentationViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertPresentationViewController);
  objc_storeStrong((id *)&self->_accountManager, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

@end