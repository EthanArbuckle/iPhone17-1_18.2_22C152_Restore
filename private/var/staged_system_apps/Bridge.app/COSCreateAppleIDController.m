@interface COSCreateAppleIDController
+ (BOOL)controllerNeedsToRun;
- (AAUISignInViewController)signInController;
- (BOOL)allowSkipping;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (COSAppleIDAuthController)authController;
- (COSBuddyControllerDelegate)delegate;
- (NSArray)stashedNavState;
- (double)waitScreenPushGracePeriod;
- (id)localizedWaitScreenDescription;
- (id)performanceMonitorActivityName;
- (void)appleIDAuthController:(id)a3 didSignInWithSuccess:(BOOL)a4 error:(id)a5;
- (void)setAuthController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSignInController:(id)a3;
- (void)setStashedNavState:(id)a3;
- (void)startCreation;
@end

@implementation COSCreateAppleIDController

- (BOOL)allowSkipping
{
  return 0;
}

- (id)performanceMonitorActivityName
{
  return @"COSTinkeriCloudLogin";
}

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
  return 0;
}

- (double)waitScreenPushGracePeriod
{
  return 0.0;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = pbb_accountsignin_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setDelegate", buf, 2u);
  }

  v6 = [UIApp setupController];
  v7 = [v6 tinkerAuthenticationController];
  authController = self->_authController;
  self->_authController = v7;

  v9 = [v4 navigationController];
  [(COSAppleIDAuthController *)self->_authController setPresentingController:v9];

  [(COSAppleIDAuthController *)self->_authController setDelegate:self];
  v10 = [(COSAppleIDAuthController *)self->_authController proxiedDevice];

  if (v10)
  {
    [(COSCreateAppleIDController *)self startCreation];
  }
  else
  {
    v11 = +[UIApplication sharedApplication];
    v12 = [v11 bridgeController];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002E6F0;
    v13[3] = &unk_100243EE0;
    v13[4] = self;
    [v12 requestProxiedDeviceForWatchWithCompletion:v13];
  }
  objc_storeWeak((id *)&self->_delegate, v4);
}

- (void)startCreation
{
  id v8 = [(COSAppleIDAuthController *)self->_authController baseAppContext];
  v3 = [(COSAppleIDAuthController *)self->_authController proxiedDevice];
  [v8 setProxiedDevice:v3];

  [v8 setNeedsNewAppleID:1];
  [v8 setForceInlinePresentation:1];
  [(COSAppleIDAuthController *)self->_authController startAccountActionWithContext:v8];
  id v4 = [UIApp setupController];
  v5 = [v4 navigationController];
  v6 = [v5 viewControllers];
  stashedNavState = self->_stashedNavState;
  self->_stashedNavState = v6;
}

- (id)localizedWaitScreenDescription
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"TINKER_WAITING_ON_DEVICE" value:&stru_100249230 table:@"Localizable-tinker"];

  return v3;
}

- (void)appleIDAuthController:(id)a3 didSignInWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  if (v5)
  {
    [UIApp setNewTinkerAccountCreated:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained buddyControllerDone:self];
  }
  else
  {
    v9 = [UIApp setupController];
    v10 = [v9 navigationController];

    id v11 = [v7 code];
    v12 = pbb_accountsignin_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11 == (id)-7003)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "User canceled create", buf, 2u);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002ECB0;
      block[3] = &unk_100243908;
      block[4] = self;
      id v27 = v10;
      id v14 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      if (v13)
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed Create: %@", buf, 0xCu);
      }

      id v14 = [v7 localizedDescription];
      if (PBIsInternalInstall())
      {
        v15 = [v7 domain];
        v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 code]);
        uint64_t v17 = [v14 stringByAppendingFormat:@" [Domain: %@ Code: %@]", v15, v16];

        id v14 = (id)v17;
      }
      v18 = +[NSBundle mainBundle];
      v19 = [v18 localizedStringForKey:@"GUARDIAN_ACCOUNT_REPAIR_FAILED" value:&stru_100249230 table:@"Localizable-tinker"];
      v20 = +[UIAlertController alertControllerWithTitle:v19 message:v14 preferredStyle:1];

      v21 = +[NSBundle mainBundle];
      v22 = [v21 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10002EC88;
      v31[3] = &unk_100243AE0;
      v31[4] = self;
      v23 = +[UIAlertAction actionWithTitle:v22 style:0 handler:v31];
      [v20 addAction:v23];

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10002EC9C;
      v28[3] = &unk_100243908;
      id v29 = v10;
      id v30 = v20;
      id v24 = v20;
      id v25 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v28);
    }
  }
}

- (COSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSBuddyControllerDelegate *)WeakRetained;
}

- (COSAppleIDAuthController)authController
{
  return self->_authController;
}

- (void)setAuthController:(id)a3
{
}

- (AAUISignInViewController)signInController
{
  return self->_signInController;
}

- (void)setSignInController:(id)a3
{
}

- (NSArray)stashedNavState
{
  return self->_stashedNavState;
}

- (void)setStashedNavState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stashedNavState, 0);
  objc_storeStrong((id *)&self->_signInController, 0);
  objc_storeStrong((id *)&self->_authController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end