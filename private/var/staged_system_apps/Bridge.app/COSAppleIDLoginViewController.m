@interface COSAppleIDLoginViewController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)controllerNeedsToRunForCurrentService;
+ (BOOL)showAlertIfLackingConnectivityAndPresentAlertWithPresentingViewController:(id)a3;
+ (id)accountTypeString;
+ (id)appleIDServiceState;
+ (int64_t)appleIDServiceType;
+ (void)showAlertForLoginFailureWithError:(id)a3 presentingViewController:(id)a4;
- (ACAccount)idmsAccount;
- (ACAccountStore)accountStore;
- (BOOL)allowSkipping;
- (BOOL)completedCustomHoldActivities;
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (BOOL)holdingForAppleAccountPropertyUpdateToComplete;
- (BOOL)registerActivationObserver;
- (COSAppleIDLoginViewController)init;
- (NRDevice)device;
- (NSMutableDictionary)automation;
- (NSString)username;
- (UIActivityIndicatorView)activityIndicator;
- (UILabel)verifyingLabel;
- (double)waitScreenPushGracePeriod;
- (id)account;
- (id)activationHoldActivityIdentifier;
- (id)alternateButtonTitle;
- (id)appendUsernameToDetailText:(id)a3;
- (id)detailString;
- (id)holdActivityIdentifier;
- (id)localizedWaitScreenDescription;
- (id)okayButtonTitle;
- (id)performanceMonitorActivityName;
- (id)suggestedButtonTitle;
- (id)titleString;
- (unint64_t)authenticationMode;
- (unint64_t)performanceMonitorCATiming;
- (void)_finishedActivating;
- (void)allowUserInteractions:(BOOL)a3;
- (void)alternateButtonPressed:(id)a3;
- (void)appleIDAuthController:(id)a3 didSignInWithSuccess:(BOOL)a4 error:(id)a5;
- (void)attachAuthStateAfterReleasingHoldToPresentController;
- (void)checkAndReleaseHold;
- (void)dealloc;
- (void)didEstablishHold;
- (void)didSendSignInRequestToWatchFromAppleIDAuthContoller:(id)a3;
- (void)loggedInSuccessfullyWithBuddyControllerDoneBlock:(id)a3;
- (void)markEndOfHoldActivity;
- (void)recoverCredentials;
- (void)saveiTunesStoreAccountToPairedDeviceIfForSameAppleID;
- (void)setAccountStore:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setAuthenticationMode:(unint64_t)a3;
- (void)setAutomation:(id)a3;
- (void)setAwaitingActivationIfNotActivated;
- (void)setHoldingForAppleAccountPropertyUpdateToComplete:(BOOL)a3;
- (void)setIdmsAccount:(id)a3;
- (void)setUsername:(id)a3;
- (void)setVerifyingLabel:(id)a3;
- (void)setWaitingForSignInResponseFromWatch:(BOOL)a3;
- (void)signInFailedWithError:(id)a3;
- (void)signInToAccountWithPassword:(id)a3;
- (void)silentSignInStateChanged:(id)a3;
- (void)startNetworkRequest;
- (void)stopNetworkRequest;
- (void)suggestedButtonPressed:(id)a3;
- (void)tappedSkipButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation COSAppleIDLoginViewController

+ (BOOL)controllerNeedsToRunForCurrentService
{
  return 1;
}

+ (BOOL)controllerNeedsToRun
{
  v2 = [(id)objc_opt_class() appleIDServiceState];
  v3 = [(id)objc_opt_class() accountTypeString];
  if (([v2 signedIn] & 1) == 0 && !objc_msgSend(v2, "signInSkipped"))
  {
    if ([v2 silentSignInSuccessful])
    {
      v7 = pbb_accountsignin_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        v12 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Skipping %@ sign in: silent sign in was successfull", (uint8_t *)&v11, 0xCu);
      }

      +[PBBridgeCAReporter recordSigninEventPair:0];
      goto LABEL_6;
    }
    v8 = +[COSAppleIDSignInModel accountForServiceType:](COSAppleIDSignInModel, "accountForServiceType:", [(id)objc_opt_class() appleIDServiceType]);
    BOOL v5 = v8 != 0;
    if (v8)
    {
      if (![(id)objc_opt_class() controllerNeedsToRunForCurrentService])
      {
        BOOL v5 = 0;
        goto LABEL_21;
      }
      v9 = pbb_accountsignin_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        v12 = v3;
        v10 = "Presenting %@ sign in";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      v9 = pbb_accountsignin_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        v12 = v3;
        v10 = "Skipping %@ sign in: no account";
        goto LABEL_18;
      }
    }

LABEL_21:
    goto LABEL_7;
  }
  v4 = pbb_accountsignin_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    v12 = "+[COSAppleIDLoginViewController controllerNeedsToRun]";
    __int16 v13 = 2112;
    v14 = v3;
    __int16 v15 = 2112;
    v16 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: User already skipped/signed in. %@ ServiceState: %@", (uint8_t *)&v11, 0x20u);
  }

LABEL_6:
  BOOL v5 = 0;
LABEL_7:

  return v5;
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  v2 = [(id)objc_opt_class() appleIDServiceState];
  char v3 = [v2 signedIn] ^ 1;

  return v3;
}

- (COSAppleIDLoginViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)COSAppleIDLoginViewController;
  v2 = [(COSOptinViewController *)&v9 init];
  char v3 = v2;
  if (v2)
  {
    [(COSAppleIDLoginViewController *)v2 setStyle:42];
    v4 = (ACAccountStore *)objc_alloc_init((Class)ACAccountStore);
    accountStore = v3->_accountStore;
    v3->_accountStore = v4;

    uint64_t v6 = [UIApp activeWatch];
    device = v3->_device;
    v3->_device = (NRDevice *)v6;
  }
  return v3;
}

- (void)dealloc
{
  char v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)COSAppleIDLoginViewController;
  [(COSAppleIDLoginViewController *)&v4 dealloc];
}

- (id)titleString
{
}

- (id)detailString
{
}

- (id)suggestedButtonTitle
{
  unint64_t v2 = [(COSAppleIDLoginViewController *)self authenticationMode];
  char v3 = +[NSBundle mainBundle];
  objc_super v4 = v3;
  if (v2 == 2) {
    CFStringRef v5 = @"APPLEID_SIGN_IN";
  }
  else {
    CFStringRef v5 = @"APPLEID_PWD_PLACEHOLDER";
  }
  uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_100249230 table:@"Localizable"];

  return v6;
}

- (id)alternateButtonTitle
{
  if ((id)[(COSAppleIDLoginViewController *)self authenticationMode] == (id)2)
  {
    unint64_t v2 = 0;
  }
  else
  {
    char v3 = +[NSBundle mainBundle];
    unint64_t v2 = [v3 localizedStringForKey:@"APPLEID_FORGOT" value:&stru_100249230 table:@"Localizable"];
  }

  return v2;
}

- (id)okayButtonTitle
{
  if ([(COSAppleIDLoginViewController *)self allowSkipping])
  {
    unint64_t v2 = +[NSBundle mainBundle];
    char v3 = [v2 localizedStringForKey:@"APPLEID_SKIP" value:&stru_100249230 table:@"Localizable"];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (id)account
{
}

- (NSString)username
{
}

- (BOOL)allowSkipping
{
}

- (id)performanceMonitorActivityName
{
}

- (unint64_t)performanceMonitorCATiming
{
}

- (id)holdActivityIdentifier
{
}

- (id)activationHoldActivityIdentifier
{
}

+ (int64_t)appleIDServiceType
{
}

- (void)suggestedButtonPressed:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(id)objc_opt_class() appleIDServiceState];
  [v5 setSignInSkipped:0];

  if (!+[COSAppleIDLoginViewController showAlertIfLackingConnectivityAndPresentAlertWithPresentingViewController:self])
  {
    if ((id)[(COSAppleIDLoginViewController *)self authenticationMode] == (id)2)
    {
      uint64_t v6 = pbb_accountsignin_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting federated authentication for Apple ID", buf, 2u);
      }

      [(COSAppleIDLoginViewController *)self signInToAccountWithPassword:0];
    }
    else
    {
      v7 = [(COSAppleIDLoginViewController *)self titleString];
      v8 = +[NSBundle mainBundle];
      objc_super v9 = [v8 localizedStringForKey:@"APPLEID_PASSWORD_PROMPT_%@" value:&stru_100249230 table:@"Localizable"];
      v10 = [(COSAppleIDLoginViewController *)self username];
      int v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);

      v12 = +[UIAlertController alertControllerWithTitle:v7 message:v11 preferredStyle:1];
      *(void *)buf = 0;
      v22 = buf;
      uint64_t v23 = 0x3032000000;
      v24 = sub_100015DFC;
      v25 = sub_100015D7C;
      id v26 = 0;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000F4CEC;
      v20[3] = &unk_100246FD0;
      v20[4] = buf;
      [v12 addTextFieldWithConfigurationHandler:v20];
      __int16 v13 = +[NSBundle mainBundle];
      v14 = [v13 localizedStringForKey:@"APPLEID_CANCEL" value:&stru_100249230 table:@"Localizable"];
      __int16 v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:0];

      [v12 addAction:v15];
      v16 = +[NSBundle mainBundle];
      v17 = [v16 localizedStringForKey:@"APPLEID_SIGN_IN" value:&stru_100249230 table:@"Localizable"];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000F4D84;
      v19[3] = &unk_100246FF8;
      v19[4] = self;
      v19[5] = buf;
      v18 = +[UIAlertAction actionWithTitle:v17 style:0 handler:v19];

      [v12 addAction:v18];
      [(COSAppleIDLoginViewController *)self presentViewController:v12 animated:1 completion:0];

      _Block_object_dispose(buf, 8);
    }
  }
}

- (void)alternateButtonPressed:(id)a3
{
  id v4 = [(id)objc_opt_class() appleIDServiceState];
  [v4 setSignInSkipped:0];

  if (!+[COSAppleIDLoginViewController showAlertIfLackingConnectivityAndPresentAlertWithPresentingViewController:self])
  {
    CFStringRef v5 = [(id)objc_opt_class() appleIDServiceState];
    [v5 setRecoveringCredentials:1];

    [(COSAppleIDLoginViewController *)self startNetworkRequest];
    [(COSAppleIDLoginViewController *)self recoverCredentials];
  }
}

- (void)tappedSkipButton:(id)a3
{
  id v4 = pbb_accountsignin_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[COSAppleIDLoginViewController tappedSkipButton:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Tapped Skip Button", (uint8_t *)&v7, 0xCu);
  }

  CFStringRef v5 = [(id)objc_opt_class() appleIDServiceState];
  [v5 setSignInSkipped:1];

  uint64_t v6 = [(COSAppleIDLoginViewController *)self delegate];
  [v6 buddyControllerDone:self];
}

- (void)loggedInSuccessfullyWithBuddyControllerDoneBlock:(id)a3
{
  id v3 = a3;
  abort();
}

- (void)signInFailedWithError:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() showAlertForLoginFailureWithError:v4 presentingViewController:self];
}

- (id)appendUsernameToDetailText:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(COSAppleIDLoginViewController *)self username];
  uint64_t v6 = [v4 stringByAppendingFormat:@"\n\n%@", v5];

  return v6;
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)COSAppleIDLoginViewController;
  [(COSAppleIDLoginViewController *)&v21 viewDidLoad];
  id v3 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v3;

  [(UIActivityIndicatorView *)self->_activityIndicator setAlpha:0.0];
  CFStringRef v5 = [(COSAppleIDLoginViewController *)self contentView];
  [v5 addSubview:self->_activityIndicator];

  [(UIActivityIndicatorView *)self->_activityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v6 = [(UIActivityIndicatorView *)self->_activityIndicator topAnchor];
  int v7 = [(COSAppleIDLoginViewController *)self contentView];
  v8 = [v7 topAnchor];
  objc_super v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  v10 = [(UIActivityIndicatorView *)self->_activityIndicator bottomAnchor];
  int v11 = [(COSAppleIDLoginViewController *)self contentView];
  v12 = [v11 bottomAnchor];
  __int16 v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [(UIActivityIndicatorView *)self->_activityIndicator centerXAnchor];
  uint64_t v15 = [(COSAppleIDLoginViewController *)self contentView];
  v16 = [(id)v15 centerXAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  LOBYTE(v15) = [(COSAppleIDLoginViewController *)self allowSkipping];
  v18 = [(COSAppleIDLoginViewController *)self okayButton];
  v19 = v18;
  if (v15)
  {
    [v18 removeTarget:self action:0 forControlEvents:64];

    v20 = [(COSAppleIDLoginViewController *)self okayButton];
    [v20 addTarget:self action:"tappedSkipButton:" forControlEvents:64];
  }
  else
  {
    [v18 setHidden:1];

    v20 = [(COSAppleIDLoginViewController *)self okayButton];
    [v20 setUserInteractionEnabled:0];
  }
}

- (void)startNetworkRequest
{
  [(COSAppleIDLoginViewController *)self allowUserInteractions:0];
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000F5360;
  v3[3] = &unk_1002439E0;
  objc_copyWeak(&v4, &location);
  +[UIView animateWithDuration:v3 animations:0 completion:0.25];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)stopNetworkRequest
{
  [(COSAppleIDLoginViewController *)self allowUserInteractions:1];
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000F556C;
  v3[3] = &unk_1002439E0;
  objc_copyWeak(&v4, &location);
  +[UIView animateWithDuration:v3 animations:0 completion:0.25];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)allowUserInteractions:(BOOL)a3
{
  BOOL v3 = a3;
  CFStringRef v5 = [(COSAppleIDLoginViewController *)self navigationController];
  id v11 = [v5 navigationBar];

  uint64_t v6 = [v11 topItem];
  [v6 setHidesBackButton:v3 ^ 1 animated:1];
  int v7 = [v6 leftBarButtonItem];
  [v7 setEnabled:v3];

  v8 = [(COSAppleIDLoginViewController *)self suggestedChoiceButton];
  [v8 setEnabled:v3];

  objc_super v9 = [(COSAppleIDLoginViewController *)self alternateChoiceButton];
  [v9 setEnabled:v3];

  v10 = [(COSAppleIDLoginViewController *)self okayButton];
  [v10 setEnabled:v3];
}

- (void)recoverCredentials
{
  BOOL v3 = [(COSAppleIDLoginViewController *)self performanceMonitorActivityName];
  id v4 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
  [v4 beginMacroActivity:v3 beginTime:CFAbsoluteTimeGetCurrent()];

  CFStringRef v5 = pbb_accountsignin_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Recovering credentials of Apple ID account", v11, 2u);
  }

  kdebug_trace();
  uint64_t v6 = [COSAppleIDAuthController alloc];
  accountStore = self->_accountStore;
  v8 = [(COSAppleIDLoginViewController *)self account];
  objc_super v9 = [(COSAppleIDAuthController *)v6 initWithAccountStore:accountStore account:v8 timeout:self->_device device:0.0];

  [(COSAppleIDAuthController *)v9 setDelegate:self];
  v10 = [(id)objc_opt_class() appleIDServiceState];
  [v10 setAuthController:v9];

  [(COSAppleIDAuthController *)v9 startRecoveringCredentials];
}

+ (BOOL)showAlertIfLackingConnectivityAndPresentAlertWithPresentingViewController:(id)a3
{
  id v3 = a3;
  if (+[PSAirplaneModeSettingsDetail isEnabled]
    && (+[PSWiFiSettingsDetail isEnabled] & 1) == 0)
  {
    CFStringRef v5 = pbb_accountsignin_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001748E8((uint64_t)v3, v5);
    }

    uint64_t v6 = +[NSBundle mainBundle];
    int v7 = SFLocalizableWAPIStringKeyForKey();
    v8 = [v6 localizedStringForKey:v7 value:&stru_100249230 table:@"Localizable"];
    BOOL v4 = 1;
    objc_super v9 = +[UIAlertController alertControllerWithTitle:v8 message:0 preferredStyle:1];

    v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"APPLEID_AIRPLANE_OK" value:&stru_100249230 table:@"Localizable"];
    v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:&stru_100247018];
    [v9 addAction:v12];

    __int16 v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"APPLEID_AIRPLANE_TURN_OFF" value:&stru_100249230 table:@"Localizable"];
    uint64_t v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:&stru_100247038];
    [v9 addAction:v15];

    [v3 presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (void)showAlertForLoginFailureWithError:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 domain];
  unsigned int v8 = [v7 isEqualToString:AKAppleIDAuthenticationErrorDomain];

  if (!v8 || [v5 code] != (id)-7003)
  {
    objc_super v9 = [v5 domain];
    if ([v9 isEqualToString:ACErrorDomain])
    {
      id v10 = [v5 code];

      if (v10 == (id)10)
      {
        id v11 = +[NSBundle mainBundle];
        v12 = [v11 localizedStringForKey:@"CANT_LOGIN_GENERIC_TITLE" value:&stru_100249230 table:@"Localizable"];
        id v13 = +[UIAlertController alertControllerWithTitle:v12 message:0 preferredStyle:1];

        v14 = +[NSBundle mainBundle];
        uint64_t v15 = [v14 localizedStringForKey:@"APPLEID_ERROR_UNLOCK_MESSAGE" value:&stru_100249230 table:@"Localizable"];
        v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:0];
        [v13 addAction:v16];

        v17 = pbb_accountsignin_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100174960(v17, v18, v19, v20, v21, v22, v23, v24);
        }

        [v6 presentViewController:v13 animated:1 completion:0];
        goto LABEL_41;
      }
    }
    else
    {
    }
    v25 = [v5 domain];
    if ([v25 isEqualToString:@"com.apple.appleaccount"])
    {
      id v26 = [v5 code];

      if (v26 == (id)-6)
      {
        id v13 = [v5 userInfo];
        v27 = [v13 objectForKeyedSubscript:kAAErrorDetailsTitleKey];
        v28 = [v13 objectForKeyedSubscript:kAAErrorDetailsMessageKey];
        id v29 = +[UIAlertController alertControllerWithTitle:v27 message:v28 preferredStyle:1];

        uint64_t v30 = kAAErrorDetailsDismissButtonTitleKey;
        v31 = [v13 objectForKeyedSubscript:kAAErrorDetailsDismissButtonTitleKey];

        if (v31)
        {
          v32 = [v13 objectForKeyedSubscript:v30];
          v33 = +[UIAlertAction actionWithTitle:v32 style:1 handler:0];
          [v29 addAction:v33];
        }
        uint64_t v34 = kAAErrorDetailsActionButtonTitleKey;
        v35 = [v13 objectForKeyedSubscript:kAAErrorDetailsActionButtonTitleKey];

        if (v35)
        {
          v36 = [v13 objectForKeyedSubscript:v34];
          v83[0] = _NSConcreteStackBlock;
          v83[1] = 3221225472;
          v83[2] = sub_1000F655C;
          v83[3] = &unk_100243AE0;
          id v84 = v13;
          v37 = +[UIAlertAction actionWithTitle:v36 style:0 handler:v83];
          [v29 addAction:v37];
        }
        v38 = pbb_accountsignin_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_100174998(v38, v39, v40, v41, v42, v43, v44, v45);
        }

        [v6 presentViewController:v29 animated:1 completion:0];
        goto LABEL_40;
      }
    }
    else
    {
    }
    v46 = [v5 userInfo];
    uint64_t v47 = AMSAuthenticateErrorDialogKey;
    v48 = [v46 objectForKeyedSubscript:AMSAuthenticateErrorDialogKey];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v48;
    }
    else {
      id v13 = 0;
    }

    if (v13)
    {
      id v82 = 0;
      id v49 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:&v82];
      id v29 = v82;
    }
    else
    {
      v50 = pbb_accountsignin_log();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "error.userInfo[AMSAuthenticateErrorDialogKey] is null", buf, 2u);
      }

      id v49 = 0;
      id v29 = 0;
    }
    v51 = pbb_accountsignin_log();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v86 = v49;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "AMSDialogRequest returned %@ from error.userInfo[AMSAuthenticateErrorDialogKey]", buf, 0xCu);
    }

    if (v49) {
      goto LABEL_36;
    }
    v52 = [v5 userInfo];
    v53 = [v52 objectForKeyedSubscript:NSUnderlyingErrorKey];

    v54 = [v53 userInfo];
    v55 = [v54 objectForKeyedSubscript:v47];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v49 = v55;
    }
    else {
      id v49 = 0;
    }

    v56 = pbb_accountsignin_log();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v86 = v49;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "AMSDialogRequest returned %@ from error.userInfo[NSUnderlyingErrorKey].[AMSAuthenticateErrorDialogKey]", buf, 0xCu);
    }

    if (v49)
    {
LABEL_36:
      v57 = pbb_accountsignin_log();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Presenting AMS dialog! 🍾", buf, 2u);
      }

      id v58 = [objc_alloc((Class)AMSUIAlertDialogTask) initWithRequest:v49 presentingViewController:v6];
      v59 = [v58 present];
      [v59 addFinishBlock:&stru_100247078];
LABEL_39:

LABEL_40:
LABEL_41:

      goto LABEL_42;
    }
    v60 = pbb_accountsignin_log();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "NOT presenting AMS dialog... just doing the same old thing we've always done", buf, 2u);
    }

    v61 = [v5 userInfo];
    v62 = [v61 objectForKey:kAAProtocolErrorResponseDictionaryKey];

    v81 = v62;
    if (v62)
    {
      v63 = [v62 objectForKey:kAAProtocolErrorMessageKey];
      id v58 = [v62 objectForKey:kAAProtocolErrorTitleKey];
      v59 = [v62 objectForKey:kAAProtocolErrorCancelButtonTitleKey];
      if (v63)
      {
        id v49 = v63;
        if ([v63 length])
        {
LABEL_55:
          if (!v58 || ![v58 length])
          {
            v67 = +[NSBundle mainBundle];
            uint64_t v68 = [v67 localizedStringForKey:@"CANT_LOGIN_GENERIC_TITLE" value:&stru_100249230 table:@"Localizable"];

            id v58 = (id)v68;
          }
          if (!v59 || ![v59 length])
          {
            v69 = +[NSBundle mainBundle];
            uint64_t v70 = [v69 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];

            v59 = (void *)v70;
          }
          v71 = +[UIAlertController alertControllerWithTitle:v58 message:v49 preferredStyle:1];
          v72 = +[UIAlertAction actionWithTitle:v59 style:1 handler:0];
          [v71 addAction:v72];

          v73 = pbb_accountsignin_log();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
            sub_1001749D0(v73, v74, v75, v76, v77, v78, v79, v80);
          }

          [v6 presentViewController:v71 animated:1 completion:0];
          goto LABEL_39;
        }
      }
    }
    else
    {
      v59 = 0;
      id v58 = 0;
      v63 = 0;
    }
    if (sub_100008380())
    {
      v64 = [v5 userInfo];
      v65 = [v64 objectForKeyedSubscript:NSLocalizedDescriptionKey];
      id v49 = +[NSString stringWithFormat:@"[Internal] error: %@", v65, v81];
    }
    else
    {
      v66 = +[NSBundle mainBundle];
      id v49 = [v66 localizedStringForKey:@"CANT_LOGIN_UNKNOWN_ERROR" value:&stru_100249230 table:@"Localizable"];

      v64 = pbb_accountsignin_log();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v86 = v5;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Using generic login error message for error %@", buf, 0xCu);
      }
    }

    goto LABEL_55;
  }
LABEL_42:
}

- (BOOL)registerActivationObserver
{
  id v3 = +[UIApplication sharedApplication];
  unsigned __int8 v4 = [v3 isActivated];

  if ((v4 & 1) == 0)
  {
    if (PBLogPerformanceMetrics())
    {
      id v5 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      id v6 = [(COSAppleIDLoginViewController *)self activationHoldActivityIdentifier];
      [v5 beginMacroActivity:v6 beginTime:CFAbsoluteTimeGetCurrent()];
    }
    int v7 = pbb_accountsignin_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = (objc_class *)objc_opt_class();
      objc_super v9 = NSStringFromClass(v8);
      int v12 = 138412290;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Holding (%@) because gizmo is not activated", (uint8_t *)&v12, 0xCu);
    }
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"_finishedActivating" name:PBBridgeGizmoDidFinishActivatingNotification object:0];
  }
  return v4 ^ 1;
}

- (void)setAwaitingActivationIfNotActivated
{
  unint64_t v2 = +[UIApplication sharedApplication];
  unsigned __int8 v3 = [v2 isActivated];

  if ((v3 & 1) == 0)
  {
    id v5 = [UIApp setupController];
    unsigned __int8 v4 = [v5 activationManager];
    [v4 setAwaitingActivation:1];
  }
}

- (void)_finishedActivating
{
  if (PBLogPerformanceMetrics())
  {
    unsigned __int8 v3 = [(COSAppleIDLoginViewController *)self activationHoldActivityIdentifier];
    unsigned __int8 v4 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    [v4 endMacroActivity:v3 beginTime:CFAbsoluteTimeGetCurrent()];
    double v6 = v5;

    +[PBBridgeCAReporter pushTimingForTypeNamed:v3 withValue:v6];
  }
  int v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:PBBridgeGizmoDidFinishActivatingNotification object:0];

  [(COSAppleIDLoginViewController *)self finishedActivating];
}

+ (id)appleIDServiceState
{
  unint64_t v2 = [UIApp setupController];
  unsigned __int8 v3 = [v2 appleIDSignInModel];
  unsigned __int8 v4 = [v3 stateForServiceType:[objc_opt_class() appleIDServiceType]];

  return v4;
}

- (void)signInToAccountWithPassword:(id)a3
{
  id v4 = a3;
  double v5 = pbb_accountsignin_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [(COSAppleIDLoginViewController *)self account];
    int v19 = 138412546;
    uint64_t v20 = v6;
    __int16 v21 = 2112;
    id v22 = (id)objc_opt_class();
    id v7 = v22;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Signing in to account: %@ (%@)", (uint8_t *)&v19, 0x16u);
  }
  [(COSAppleIDLoginViewController *)self startNetworkRequest];
  unsigned int v8 = [(COSAppleIDLoginViewController *)self performanceMonitorActivityName];
  objc_super v9 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
  [v9 beginMacroActivity:v8 beginTime:CFAbsoluteTimeGetCurrent()];

  id v10 = pbb_accountsignin_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(id)objc_opt_class() appleIDServiceType];
    int v12 = sub_1000E7E58((unint64_t)v11);
    int v19 = 138412290;
    uint64_t v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Signing in %@ account", (uint8_t *)&v19, 0xCu);
  }
  kdebug_trace();
  id v13 = [COSAppleIDAuthController alloc];
  accountStore = self->_accountStore;
  uint64_t v15 = [(COSAppleIDLoginViewController *)self account];
  v16 = [(COSAppleIDAuthController *)v13 initWithAccountStore:accountStore account:v15 timeout:self->_device device:0.0];

  [(COSAppleIDAuthController *)v16 setDelegate:self];
  v17 = [(id)objc_opt_class() appleIDServiceState];
  [v17 setAuthController:v16];

  uint64_t v18 = [(id)objc_opt_class() accountTypeString];
  [(COSAppleIDAuthController *)v16 setSignInAccountType:v18];

  [(COSAppleIDAuthController *)v16 startSigningInWithPassword:v4];
  if (v4) {
    [(COSAppleIDLoginViewController *)self _signInToAccountWithPassword:v4];
  }
}

+ (id)accountTypeString
{
  id v2 = [(id)objc_opt_class() appleIDServiceType];

  return sub_1000E7E58((unint64_t)v2);
}

- (void)saveiTunesStoreAccountToPairedDeviceIfForSameAppleID
{
  unsigned __int8 v3 = [(COSAppleIDLoginViewController *)self device];
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"1F1097A5-5A0B-4795-9FBE-B206DB49FA1D"];
  unsigned int v5 = [v3 supportsCapability:v4];

  if (v5)
  {
    id v10 = +[COSiTunesStoreAuthController iTunesStoreAccountInAccountStore];
    double v6 = [(COSAppleIDLoginViewController *)self account];
    unsigned int v7 = +[COSAppleIDUtilities checkIfAccount:v10 isForSameAppleIDAsAccount:v6];

    if (v7)
    {
      unsigned int v8 = [(COSAppleIDLoginViewController *)self delegate];
      objc_super v9 = [(COSAppleIDLoginViewController *)self accountStore];
      [v8 saveCombinedPasswordBasediTunesStoreAccount:v10 fromAccountStore:v9];
    }
  }
}

- (void)appleIDAuthController:(id)a3 didSignInWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v24 = a3;
  id v25 = a5;
  unsigned int v8 = [(id)objc_opt_class() appleIDServiceState];
  objc_super v9 = [v8 authController];
  [v9 setDelegate:0];

  [v8 setAuthController:0];
  [v8 setRecoveringCredentials:0];
  kdebug_trace();
  id v10 = [(COSAppleIDLoginViewController *)self performanceMonitorActivityName];
  unint64_t v11 = [(COSAppleIDLoginViewController *)self performanceMonitorCATiming];
  int v12 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
  [v12 endMacroActivity:v10 beginTime:CFAbsoluteTimeGetCurrent()];
  double v14 = v13;

  +[PBBridgeCAReporter pushTimingType:v11 withValue:v14];
  uint64_t v15 = [(id)objc_opt_class() accountTypeString];
  v16 = [UIApp setupController];
  v17 = [v16 pairingReportManager];

  uint64_t v18 = BRSignInPairingTimeEventForAccountType();
  uint64_t v19 = BRSignInPairingTimeEventForAccountType();
  uint64_t v20 = +[NSNumber numberWithBool:v6];
  [v17 addPairingTimeEventToPairingReportPlist:v18 withValue:v20 withError:0];

  [v17 checkInWithClosingPairingTimeEvent:v19];
  if (v6)
  {
    __int16 v21 = v25;
    objc_initWeak(&location, self);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000F72B4;
    v26[3] = &unk_100243D28;
    objc_copyWeak(&v27, &location);
    v26[4] = self;
    [(COSAppleIDLoginViewController *)self loggedInSuccessfullyWithBuddyControllerDoneBlock:v26];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v22 = BRSignInFailureErrorForAccountType();
    __int16 v21 = v25;
    uint64_t v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v25 code]);
    [v17 addPairingTimeEventToPairingReportPlist:v22 withValue:v23 withError:0];

    [(COSAppleIDLoginViewController *)self stopNetworkRequest];
    [(COSAppleIDLoginViewController *)self signInFailedWithError:v25];
  }
}

- (void)didSendSignInRequestToWatchFromAppleIDAuthContoller:(id)a3
{
  [UIApp setupController:a3];
  if (([v4 nextControllerToPresentAfterBlockedOnSignInStep] & 1) == 0)
  {
    unsigned int v5 = [(id)objc_opt_class() appleIDServiceState];
    BOOL v6 = [v5 authController];
    [v6 setDelegate:0];

    unsigned int v7 = pbb_accountsignin_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Waiting for sign-in response from watch and segueing to present non-Apple ID buddy screens", v9, 2u);
    }

    unsigned int v8 = [(COSAppleIDLoginViewController *)self delegate];
    [v8 buddyControllerDoneForSignIn:self];
  }
}

- (ACAccount)idmsAccount
{
  idmsAccount = self->_idmsAccount;
  if (!idmsAccount)
  {
    id v4 = [(COSAppleIDLoginViewController *)self accountStore];
    unsigned int v5 = [(COSAppleIDLoginViewController *)self account];
    BOOL v6 = +[COSAppleIDAuthController lookupIDMSAccountWithAccountStore:v4 matchingAccount:v5];
    unsigned int v7 = self->_idmsAccount;
    self->_idmsAccount = v6;

    idmsAccount = self->_idmsAccount;
  }

  return idmsAccount;
}

- (unint64_t)authenticationMode
{
  id v2 = [(COSAppleIDLoginViewController *)self idmsAccount];
  unsigned __int8 v3 = [v2 accountPropertyForKey:AKAuthMode];
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (void)setWaitingForSignInResponseFromWatch:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = pbb_accountsignin_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    objc_super v9 = "-[COSAppleIDLoginViewController setWaitingForSignInResponseFromWatch:]";
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: waiting: %d", (uint8_t *)&v8, 0x12u);
  }

  if (v3)
  {
    [(COSAppleIDLoginViewController *)self loadViewIfNeeded];
    [(COSAppleIDLoginViewController *)self startNetworkRequest];
  }
  else
  {
    [(COSAppleIDLoginViewController *)self stopNetworkRequest];
    BOOL v6 = [(id)objc_opt_class() appleIDServiceState];
    unsigned int v7 = [v6 authController];
    [v7 resetWatchSignInResponse];
  }
}

- (void)attachAuthStateAfterReleasingHoldToPresentController
{
  BOOL v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[COSAppleIDLoginViewController attachAuthStateAfterReleasingHoldToPresentController]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v4 = [(id)objc_opt_class() appleIDServiceState];
  unsigned int v5 = [v4 authController];

  if (!v5) {
    goto LABEL_11;
  }
  [v5 setDelegate:self];
  if (([v5 waitingForWatchSignInAfterInteractiveAuth] & 1) == 0)
  {
    if ([v5 watchSignInResult])
    {
      if ([v5 watchSignInResult] == (id)2)
      {
        objc_initWeak((id *)buf, self);
        int v8 = _NSConcreteStackBlock;
        uint64_t v9 = 3221225472;
        __int16 v10 = sub_1000F7834;
        BOOL v11 = &unk_100243D28;
        objc_copyWeak(&v13, (id *)buf);
        int v12 = self;
        [(COSAppleIDLoginViewController *)self loggedInSuccessfullyWithBuddyControllerDoneBlock:&v8];
        objc_destroyWeak(&v13);
        objc_destroyWeak((id *)buf);
      }
      else if ([v5 watchSignInResult] == (id)1)
      {
        unsigned int v7 = [v5 watchSignInErrorResult];
        [(COSAppleIDLoginViewController *)self signInFailedWithError:v7];
      }
    }
LABEL_11:
    uint64_t v6 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = 1;
LABEL_12:
  -[COSAppleIDLoginViewController setWaitingForSignInResponseFromWatch:](self, "setWaitingForSignInResponseFromWatch:", v6, v8, v9, v10, v11);
}

- (BOOL)holdBeforeDisplaying
{
  if (PBLogPerformanceMetrics())
  {
    BOOL v3 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    id v4 = [(COSAppleIDLoginViewController *)self holdActivityIdentifier];
    [v3 beginMacroActivity:v4 beginTime:CFAbsoluteTimeGetCurrent()];
  }
  unsigned int v5 = [(id)objc_opt_class() appleIDServiceState];
  unsigned __int8 v6 = [v5 silentSignInSuccessful];

  if ((v6 & 1) == 0)
  {
    [(COSAppleIDLoginViewController *)self registerActivationObserver];
    unsigned int v7 = [(id)objc_opt_class() appleIDServiceState];
    unsigned int v8 = [v7 waitingForSilentSigninToComplete];

    if (v8)
    {
      uint64_t v9 = pbb_accountsignin_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = (objc_class *)objc_opt_class();
        BOOL v11 = NSStringFromClass(v10);
        int v14 = 138412290;
        uint64_t v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Holding (%@) because silent sign-in is ongoing", (uint8_t *)&v14, 0xCu);
      }
      int v12 = +[NSNotificationCenter defaultCenter];
      [v12 addObserver:self selector:"silentSignInStateChanged:" name:@"COSBuddyAppleIDSilentSignInChangeNotification" object:0];
    }
  }
  return 1;
}

- (void)didEstablishHold
{
  [(COSAppleIDLoginViewController *)self setAwaitingActivationIfNotActivated];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F7AD8;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)silentSignInStateChanged:(id)a3
{
  id v4 = [(id)objc_opt_class() appleIDServiceState];
  unsigned __int8 v5 = [v4 waitingForSilentSigninToComplete];

  if ((v5 & 1) == 0)
  {
    unsigned __int8 v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:@"COSBuddyAppleIDSilentSignInChangeNotification" object:0];

    [(COSAppleIDLoginViewController *)self checkAndReleaseHold];
  }
}

- (BOOL)completedCustomHoldActivities
{
  return 1;
}

- (void)checkAndReleaseHold
{
  BOOL v3 = [(COSAppleIDLoginViewController *)self delegate];
  unsigned int v4 = [v3 buddyControllerIsBeingHeldOff:self];

  if (!v4) {
    return;
  }
  unsigned __int8 v5 = [(id)objc_opt_class() appleIDServiceState];
  unsigned int v6 = [v5 waitingForSilentSigninToComplete];

  unsigned int v7 = [(id)objc_opt_class() appleIDServiceState];
  unsigned int v8 = [v7 silentSignInSuccessful];

  uint64_t v9 = [(id)objc_opt_class() appleIDServiceState];
  unsigned int v10 = [v9 signedIn];

  BOOL v11 = [(id)objc_opt_class() appleIDServiceState];
  unsigned int v12 = [v11 signInSkipped];

  unsigned int v13 = [(COSAppleIDLoginViewController *)self completedCustomHoldActivities];
  int v14 = +[UIApplication sharedApplication];
  unsigned int v15 = [v14 isActivated];

  v16 = pbb_accountsignin_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = NSStringFromClass(v17);
    int v26 = 138413826;
    id v27 = v18;
    __int16 v28 = 1024;
    unsigned int v29 = v6;
    __int16 v30 = 1024;
    unsigned int v31 = v8;
    __int16 v32 = 1024;
    unsigned int v33 = v15;
    __int16 v34 = 1024;
    unsigned int v35 = v13;
    __int16 v36 = 1024;
    unsigned int v37 = v10;
    __int16 v38 = 1024;
    unsigned int v39 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Checking if can release hold (%@); waitingForSilentSignInToComplete: (%{BOOL}d); silentSignInWasSuccessful: (%{BOO"
      "L}d); activated: (%{BOOL}d); completedHoldActivitiesForAccount: (%{BOOL}d) signedIn: (%{BOOL}d) signInSkipped: (%{BOOL}d)",
      (uint8_t *)&v26,
      0x30u);
  }
  if ((v8 | v6 ^ 1)) {
    goto LABEL_7;
  }
  uint64_t v19 = [UIApp setupController];
  if ([v19 nextControllerToPresentAfterBlockedOnSignInStep])
  {

LABEL_7:
    if (((v15 ^ 1 | v6) & 1) == 0)
    {
      if ((v8 | v10 | v12) == 1)
      {
        [(COSAppleIDLoginViewController *)self markEndOfHoldActivity];
        uint64_t v20 = [(COSAppleIDLoginViewController *)self delegate];
        [v20 buddyControllerReleaseHoldAndSkip:self];
      }
      else if (v13)
      {
        [(COSAppleIDLoginViewController *)self markEndOfHoldActivity];
        id v25 = [(COSAppleIDLoginViewController *)self delegate];
        [v25 buddyControllerReleaseHold:self];

        [(COSAppleIDLoginViewController *)self attachAuthStateAfterReleasingHoldToPresentController];
      }
    }
    return;
  }
  __int16 v21 = [(id)objc_opt_class() appleIDServiceState];
  uint64_t v22 = [v21 authController];
  [v22 setDelegate:0];

  uint64_t v23 = pbb_accountsignin_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Waiting for silent sign-in and segueing to present non-Apple ID buddy screens", (uint8_t *)&v26, 2u);
  }

  [(COSAppleIDLoginViewController *)self markEndOfHoldActivity];
  id v24 = [(COSAppleIDLoginViewController *)self delegate];
  [v24 buddyControllerDoneForSignIn:self];
}

- (void)markEndOfHoldActivity
{
  if (PBLogPerformanceMetrics())
  {
    id v6 = [(COSAppleIDLoginViewController *)self holdActivityIdentifier];
    BOOL v3 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    [v3 endMacroActivity:v6 beginTime:CFAbsoluteTimeGetCurrent()];
    double v5 = v4;

    +[PBBridgeCAReporter pushTimingForTypeNamed:v6 withValue:v5];
  }
}

- (BOOL)holdWithWaitScreen
{
  id v2 = [UIApp setupController];
  BOOL v3 = [v2 activationManager];

  if ([v3 awaitingActivation]) {
    unsigned int v4 = [v3 didPresentFlow] ^ 1;
  }
  else {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (double)waitScreenPushGracePeriod
{
  return 0.0;
}

- (id)localizedWaitScreenDescription
{
  id v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"APPLEID_ACCOUNT_HOLD_DESCRIPTION" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (NRDevice)device
{
  return self->_device;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void)setUsername:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UILabel)verifyingLabel
{
  return self->_verifyingLabel;
}

- (void)setVerifyingLabel:(id)a3
{
}

- (void)setIdmsAccount:(id)a3
{
}

- (BOOL)holdingForAppleAccountPropertyUpdateToComplete
{
  return self->_holdingForAppleAccountPropertyUpdateToComplete;
}

- (void)setHoldingForAppleAccountPropertyUpdateToComplete:(BOOL)a3
{
  self->_holdingForAppleAccountPropertyUpdateToComplete = a3;
}

- (NSMutableDictionary)automation
{
  return self->_automation;
}

- (void)setAutomation:(id)a3
{
}

- (void)setAuthenticationMode:(unint64_t)a3
{
  self->_authenticationMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automation, 0);
  objc_storeStrong((id *)&self->_idmsAccount, 0);
  objc_storeStrong((id *)&self->_verifyingLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end