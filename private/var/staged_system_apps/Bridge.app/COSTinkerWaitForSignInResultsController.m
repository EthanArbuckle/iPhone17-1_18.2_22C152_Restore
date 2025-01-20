@interface COSTinkerWaitForSignInResultsController
+ (BOOL)controllerNeedsToRun;
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (COSBuddyControllerDelegate)waitDelegate;
- (double)waitScreenPushGracePeriod;
- (id)holdActivityIdentifier;
- (id)localizedWaitScreenDescription;
- (int64_t)currentStatus;
- (void)didPushWaitScreen;
- (void)popToWaitForCDPCompletionController;
- (void)setCurrentStatus:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setWaitDelegate:(id)a3;
@end

@implementation COSTinkerWaitForSignInResultsController

+ (BOOL)controllerNeedsToRun
{
  return 1;
}

- (BOOL)holdBeforeDisplaying
{
  return 1;
}

- (void)didPushWaitScreen
{
  v3 = [UIApp setupController];
  v4 = [v3 tinkerAuthenticationController];

  self->_currentStatus = 0;
  v5 = [UIApp setupController];
  v6 = [v5 pairingReportManager];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009D510;
  v8[3] = &unk_100245C08;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [v4 waitForSatelliteSigninWithProgressCompletion:v8];
}

- (void)popToWaitForCDPCompletionController
{
  v2 = [UIApp setupController];
  v3 = [v2 navigationController];

  v26 = v3;
  v4 = [v3 viewControllers];
  id v5 = [v4 mutableCopy];

  v6 = [UIApp setupController];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = [v6 buddyControllers];
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v8)
  {
    id v9 = v8;
    v10 = 0;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v14 = objc_opt_class();
        if ([v14 isEqual:objc_opt_class()])
        {
          id v15 = v13;

          v10 = v15;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v16 = [v5 reverseObjectEnumerator];
  id v17 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v28;
    while (2)
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * (void)j);
        v22 = objc_opt_class();
        if ([v22 isEqual:objc_opt_class()])
        {
          [v10 setDelegate:v6];
          [v10 setAppearingFromBackNavigation:1];
          goto LABEL_22;
        }
        [v5 removeObject:v21];
      }
      id v18 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  v23 = pbb_accountsignin_log();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    v25 = v26;
    if (v24)
    {
      *(_DWORD *)buf = 138412290;
      v36 = v10;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "cdp ui view controller %@", buf, 0xCu);
    }

    [v26 setViewControllers:v5 animated:1];
  }
  else
  {
    v25 = v26;
    if (v24)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "COSTinkerWaitForWatchCDPEnrollment not in navstack.  Skipping", buf, 2u);
    }
  }
}

- (BOOL)holdWithWaitScreen
{
  return 1;
}

- (double)waitScreenPushGracePeriod
{
  return 0.0;
}

- (void)setDelegate:(id)a3
{
}

- (id)localizedWaitScreenDescription
{
  v2 = [UIApp setupController];
  v3 = [v2 tinkerUserName];
  v4 = [v3 localizedCapitalizedString];

  id v5 = +[NSBundle mainBundle];
  if (v4)
  {
    v6 = [v5 localizedStringForKey:@"APPLEID_ACCOUNT_HOLD_DESCRIPTION_TINKER_USER_%@" value:&stru_100249230 table:@"Localizable-tinker"];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v4);
  }
  else
  {
    id v7 = [v5 localizedStringForKey:@"APPLEID_ACCOUNT_HOLD_DESCRIPTION" value:&stru_100249230 table:@"Localizable"];
  }

  return v7;
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

- (id)holdActivityIdentifier
{
  return @"TinkerWaitForSignin";
}

- (COSBuddyControllerDelegate)waitDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_waitDelegate);

  return (COSBuddyControllerDelegate *)WeakRetained;
}

- (void)setWaitDelegate:(id)a3
{
}

- (int64_t)currentStatus
{
  return self->_currentStatus;
}

- (void)setCurrentStatus:(int64_t)a3
{
  self->_currentStatus = a3;
}

- (void).cxx_destruct
{
}

@end