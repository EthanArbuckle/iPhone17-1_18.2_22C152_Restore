@interface COSTinkerFamilyCirclePostcheckViewController
+ (BOOL)controllerNeedsToRun;
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (COSAppleIDAuthController)authController;
- (COSBuddyControllerDelegate)delegate;
- (NSDictionary)familyMemberAccount;
- (NSSManager)nssManager;
- (double)waitScreenPushGracePeriod;
- (id)holdActivityIdentifier;
- (id)localizedWaitScreenDescription;
- (void)didEstablishHold;
- (void)presentAlertAndFallbackToSignInForError:(id)a3;
- (void)setAuthController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFamilyMemberAccount:(id)a3;
- (void)setNssManager:(id)a3;
- (void)startPostCheck;
@end

@implementation COSTinkerFamilyCirclePostcheckViewController

+ (BOOL)controllerNeedsToRun
{
  return 1;
}

- (BOOL)holdBeforeDisplaying
{
  return 1;
}

- (BOOL)holdWithWaitScreen
{
  return 1;
}

- (double)waitScreenPushGracePeriod
{
  return 0.0;
}

- (id)localizedWaitScreenDescription
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"FAMILY_CIRCLE_REPAIR_HOLD_DESCRIPTION" value:&stru_100249230 table:@"SetupFlowLocalizable-tinker"];

  return v3;
}

- (void)didEstablishHold
{
  if (sub_100008380())
  {
    if (_os_feature_enabled_impl())
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000CA314;
      block[3] = &unk_1002438A0;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (!sub_100008380() || (_os_feature_enabled_impl() & 1) == 0)
  {
    v4 = [UIApp setupController];
    v5 = [v4 tinkerAuthenticationController];
    authController = self->_authController;
    self->_authController = v5;

    v7 = self->_authController;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000CA4D8;
    v8[3] = &unk_100243A08;
    v8[4] = self;
    [(COSAppleIDAuthController *)v7 reauthFamilyCircleByExistingAuthenticationResultsWithCompletion:v8];
  }
}

- (void)presentAlertAndFallbackToSignInForError:(id)a3
{
  id v4 = a3;
  v5 = [v4 localizedDescription];
  if (v4 && PBIsInternalInstall())
  {
    id v6 = [v4 code];
    v7 = [v4 localizedDescription];
    uint64_t v8 = +[NSString stringWithFormat:@"Error %li: %@", v6, v7];

    v5 = (void *)v8;
  }
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"FAILED_TO_UPDATE_FAMILY_MEMBERS" value:&stru_100249230 table:@"Localizable-tinker"];
  v11 = +[UIAlertController alertControllerWithTitle:v10 message:v5 preferredStyle:1];

  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000CA7A4;
  v17[3] = &unk_100243AE0;
  v17[4] = self;
  v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v17];
  [v11 addAction:v14];

  v15 = [UIApp setupController];
  v16 = [v15 navigationController];

  [v16 presentViewController:v11 animated:1 completion:0];
}

- (void)startPostCheck
{
  v3 = [UIApp setupController];
  id v4 = [v3 tinkerSignInId];

  id v5 = objc_alloc_init((Class)FAFetchFamilyCircleRequest);
  [v5 setCachePolicy:2];
  id v6 = pbb_accountsignin_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FAFetchFamilyCircleRequest start", buf, 2u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000CA8D8;
  v8[3] = &unk_1002467B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 startRequestWithCompletionHandler:v8];
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

- (id)holdActivityIdentifier
{
  return @"FamilyCircleMemberCheck";
}

- (COSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSBuddyControllerDelegate *)WeakRetained;
}

- (NSDictionary)familyMemberAccount
{
  return self->_familyMemberAccount;
}

- (void)setFamilyMemberAccount:(id)a3
{
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
}

- (COSAppleIDAuthController)authController
{
  return self->_authController;
}

- (void)setAuthController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_nssManager, 0);
  objc_storeStrong((id *)&self->_familyMemberAccount, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end