@interface COSTinkeriCloudLoginViewController
+ (BOOL)controllerNeedsToRun;
- (AAUISignInViewController)signInController;
- (BOOL)allowSkipping;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (COSAppleIDAuthController)authController;
- (COSBuddyControllerDelegate)delegate;
- (NSString)signInMessage;
- (NSString)signInTitle;
- (double)waitScreenPushGracePeriod;
- (id)authenticationContext;
- (id)localizedWaitScreenDescription;
- (id)performanceMonitorActivityName;
- (id)remoteUIStyle;
- (id)username;
- (id)viewController;
- (void)appleIDAuthController:(id)a3 didSignInWithSuccess:(BOOL)a4 error:(id)a5;
- (void)setAuthController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSignInController:(id)a3;
- (void)setSignInMessage:(id)a3;
- (void)setSignInTitle:(id)a3;
- (void)setupViewController;
- (void)willPresentModalNavigationController:(id)a3;
@end

@implementation COSTinkeriCloudLoginViewController

- (id)viewController
{
  v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[COSTinkeriCloudLoginViewController viewController]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  signInController = self->_signInController;
  if (!signInController)
  {
    [(COSTinkeriCloudLoginViewController *)self setupViewController];
    signInController = self->_signInController;
  }

  return signInController;
}

- (void)setupViewController
{
  v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[COSTinkeriCloudLoginViewController setupViewController]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = [(COSTinkeriCloudLoginViewController *)self view];
  [v4 setUserInteractionEnabled:0];

  v5 = (AAUISignInViewController *)objc_alloc_init((Class)AAUISignInViewController);
  signInController = self->_signInController;
  self->_signInController = v5;

  [(AAUISignInViewController *)self->_signInController setAllowsAccountCreation:0];
  [(AAUISignInViewController *)self->_signInController setShowServiceIcons:0];
  v7 = [UIApp setupController];
  v8 = [v7 tinkerFamilyMember];
  v9 = v8;
  if (!v8) {
    goto LABEL_10;
  }
  if ([v8 isChildAccount])
  {
    v10 = [v9 appleID];

    if (v10)
    {
      v11 = [v9 appleID];
      [(AAUISignInViewController *)self->_signInController setUsername:v11];

      [(AAUISignInViewController *)self->_signInController setCanEditUsername:0];
      v12 = +[NSBundle mainBundle];
      v13 = [v12 localizedStringForKey:@"TINKER_APPLE_ID_SIGNIN_U13_USERNAME_TITLE_%@" value:&stru_100249230 table:@"Localizable-tinker"];
      v14 = [v7 tinkerUserName];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      signInTitle = self->_signInTitle;
      self->_signInTitle = v15;

      v17 = +[NSBundle mainBundle];
      v18 = [v17 localizedStringForKey:@"TINKER_APPLE_ID_SIGNIN_U13_USERNAME_MESSAGE_%@_%@" value:&stru_100249230 table:@"Localizable-tinker"];
      v19 = [v7 tinkerUserName];
      v20 = [v9 appleID];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19, v20);
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      signInMessage = self->_signInMessage;
      self->_signInMessage = v21;

      goto LABEL_12;
    }
  }
  if (([v9 isChildAccount] & 1) == 0
    && ([v9 appleID], v23 = objc_claimAutoreleasedReturnValue(), v23, v23))
  {
    v24 = [v9 appleID];
    [(AAUISignInViewController *)self->_signInController setUsername:v24];

    [(AAUISignInViewController *)self->_signInController setCanEditUsername:0];
    v25 = +[NSBundle mainBundle];
    v26 = [v25 localizedStringForKey:@"TINKER_APPLE_ID_SIGNIN_O13_USERNAME_TITLE_%@" value:&stru_100249230 table:@"Localizable-tinker"];
    v27 = [v7 tinkerUserName];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v27);
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    v29 = self->_signInTitle;
    self->_signInTitle = v28;

    v30 = +[NSBundle mainBundle];
    v17 = v30;
    CFStringRef v31 = @"TINKER_APPLE_ID_SIGNIN_O13_USERNAME_MESSAGE";
  }
  else
  {
LABEL_10:
    v32 = +[NSBundle mainBundle];
    v33 = [v32 localizedStringForKey:@"TINKER_APPLE_ID_SIGNIN_UNKNOWN_USER_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];
    v34 = self->_signInTitle;
    self->_signInTitle = v33;

    v30 = +[NSBundle mainBundle];
    v17 = v30;
    CFStringRef v31 = @"TINKER_APPLE_ID_SIGNIN_UNKNOWN_USER_MESSAGE";
  }
  v35 = [v30 localizedStringForKey:v31 value:&stru_100249230 table:@"Localizable-tinker"];
  v18 = self->_signInMessage;
  self->_signInMessage = v35;
LABEL_12:

  v36 = [UIApp setupController];
  v37 = [v36 tinkerAuthenticationController];
  authController = self->_authController;
  self->_authController = v37;

  [(COSAppleIDAuthController *)self->_authController setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v40 = [WeakRetained navigationController];
  [(COSAppleIDAuthController *)self->_authController setPresentingController:v40];

  [(AAUISignInViewController *)self->_signInController setDelegate:self->_authController];
  v41 = [(COSAppleIDAuthController *)self->_authController proxiedDevice];

  if (!v41)
  {
    v42 = +[UIApplication sharedApplication];
    v43 = [v42 bridgeController];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000F370C;
    v44[3] = &unk_100243EE0;
    v44[4] = self;
    [v43 requestProxiedDeviceForWatchWithCompletion:v44];
  }
}

- (id)authenticationContext
{
  v3 = [(COSAppleIDAuthController *)self->_authController baseAppContext];
  [v3 setAuthenticationType:2];
  v4 = [(COSAppleIDAuthController *)self->_authController proxiedDevice];
  [v3 setProxiedDevice:v4];

  v5 = [(COSTinkeriCloudLoginViewController *)self username];
  [v3 setUsername:v5];

  [v3 setTitle:self->_signInTitle];
  [v3 setReason:self->_signInMessage];
  int v6 = pbb_accountsignin_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Returning custom authentication context", v8, 2u);
  }

  return v3;
}

- (id)username
{
  v2 = [UIApp setupController];
  v3 = [v2 tinkerFamilyMember];
  v4 = [v3 appleID];

  return v4;
}

- (BOOL)allowSkipping
{
  return 0;
}

- (id)performanceMonitorActivityName
{
  return @"COSTinkeriCloudLogin";
}

- (void)appleIDAuthController:(id)a3 didSignInWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  v8 = [UIApp setupController];
  v9 = [v8 pairingReportManager];

  if (v5)
  {
    signInController = self->_signInController;
    self->_signInController = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained buddyControllerDone:self];
  }
  else
  {
    v12 = pbb_setupflow_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Tinker sign in failed with error: %@", (uint8_t *)&v16, 0xCu);
    }

    if ([v7 code])
    {
      v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 code]);
      [v9 addPairingTimeEventToPairingReportPlist:65 withValue:v13 withError:0];
    }
    v14 = [v7 domain];

    if (v14)
    {
      v15 = [v7 domain];
      [v9 addPairingTimeEventStringToPairingReportPlist:66 withValue:v15 withError:0];
    }
  }
}

- (id)remoteUIStyle
{
  v2 = objc_opt_new();

  return v2;
}

- (void)willPresentModalNavigationController:(id)a3
{
  id v3 = [a3 navigationBar];
  BPSApplyStyleToNavBar();
}

+ (BOOL)controllerNeedsToRun
{
  return 1;
}

- (BOOL)holdBeforeDisplaying
{
  id v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "COSTinkeriCloudLoginViewController - holdBeforeDisplaying", buf, 2u);
  }

  [(COSTinkeriCloudLoginViewController *)self setupViewController];
  v4 = [(COSAppleIDAuthController *)self->_authController proxiedDevice];

  BOOL v5 = pbb_accountsignin_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      __int16 v11 = 0;
      id v7 = "COSTinkeriCloudLoginViewController - holdBeforeDisplaying - NO";
      v8 = (uint8_t *)&v11;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else if (v6)
  {
    __int16 v10 = 0;
    id v7 = "COSTinkeriCloudLoginViewController - holdBeforeDisplaying - YES";
    v8 = (uint8_t *)&v10;
    goto LABEL_8;
  }

  return v4 == 0;
}

- (BOOL)holdWithWaitScreen
{
  v2 = pbb_accountsignin_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "holdWithWaitScreen", v4, 2u);
  }

  return 0;
}

- (double)waitScreenPushGracePeriod
{
  return 5.0;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  BOOL v5 = pbb_accountsignin_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setDelegate", v6, 2u);
  }

  objc_storeWeak((id *)&self->_delegate, v4);
}

- (id)localizedWaitScreenDescription
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"TINKER_WAITING_ON_DEVICE" value:&stru_100249230 table:@"Localizable-tinker"];

  return v3;
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

- (NSString)signInTitle
{
  return self->_signInTitle;
}

- (void)setSignInTitle:(id)a3
{
}

- (NSString)signInMessage
{
  return self->_signInMessage;
}

- (void)setSignInMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInMessage, 0);
  objc_storeStrong((id *)&self->_signInTitle, 0);
  objc_storeStrong((id *)&self->_signInController, 0);
  objc_storeStrong((id *)&self->_authController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end