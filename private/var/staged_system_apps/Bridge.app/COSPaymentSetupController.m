@interface COSPaymentSetupController
+ (BOOL)controllerBlocksRunningBeforeSignInStep;
+ (BOOL)controllerNeedsToRunForBuddyControllerDelegate:(id)a3;
+ (void)_markApplePayOfferingComplete;
+ (void)_updateGizmoForSuccess:(BOOL)a3;
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (COSBuddyControllerDelegate)delegate;
- (COSPasscodeChangeComplexViewController)passcodeViewController;
- (COSPaymentSetupController)init;
- (COSSetupController)setupController;
- (PKPasscodeUpgradeFlowController)passcodeUpgradeFlowController;
- (PKPaymentSetupAssistantController)pkSetupAssistant;
- (PKPaymentSetupViewControllerDelegate)vcDelegate;
- (UIViewController)pkViewController;
- (double)waitScreenPushGracePeriod;
- (id)holdActivityIdentifier;
- (id)localizedWaitScreenDescription;
- (id)passcodeUpgradeCompletion;
- (id)viewController;
- (void)_endPasscodeUpgradeWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_invokePasscodeUpgradeCompletionWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_passcodeChangeComplete;
- (void)dealloc;
- (void)didEstablishHold;
- (void)passcodeChangeComplexViewController:(id)a3 didChangeVisibilityWithIsVisible:(BOOL)a4;
- (void)paymentExpressSetupManager:(id)a3 peerPaymentAddAssociatedAccountViewController:(id)a4 didFinishWithSuccess:(BOOL)a5 updatedPeerPaymentAccount:(id)a6;
- (void)paymentExpressSetupManager:(id)a3 peerPaymentAddAssociatedAccountViewControllerDidSkipSetup:(id)a4;
- (void)paymentExpressSetupManager:(id)a3 viewControllerDidTerminateSetupFlow:(id)a4;
- (void)peerPaymentAddAssociatedAccountViewController:(id)a3 didFinishWithSuccess:(BOOL)a4 updatedPeerPaymentAccount:(id)a5;
- (void)peerPaymentAddAssociatedAccountViewControllerDidSkipSetup:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPasscodeUpgradeCompletion:(id)a3;
- (void)setPasscodeUpgradeFlowController:(id)a3;
- (void)setPasscodeViewController:(id)a3;
- (void)setPkSetupAssistant:(id)a3;
- (void)setPkViewController:(id)a3;
- (void)setVcDelegate:(id)a3;
- (void)viewController:(id)a3 didExitPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 withShouldContinue:(BOOL)a5 error:(id)a6;
- (void)viewController:(id)a3 requestPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 completion:(id)a5;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
@end

@implementation COSPaymentSetupController

- (COSPaymentSetupController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSPaymentSetupController;
  v2 = [(COSPaymentSetupController *)&v5 init];
  if (v2)
  {
    v3 = [UIApp setupController];
    objc_storeWeak((id *)&v2->_setupController, v3);
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(COSPaymentSetupController *)self passcodeUpgradeCompletion];

  if (v3)
  {
    v3 = [(COSPaymentSetupController *)self passcodeUpgradeCompletion];
    [(COSPaymentSetupController *)self setPasscodeUpgradeCompletion:0];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008B30C;
  block[3] = &unk_1002455A0;
  id v7 = v3;
  char v8 = 0;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  v5.receiver = self;
  v5.super_class = (Class)COSPaymentSetupController;
  [(COSPaymentSetupController *)&v5 dealloc];
}

+ (BOOL)controllerNeedsToRunForBuddyControllerDelegate:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)ACAccountStore);
  objc_super v5 = objc_msgSend(v4, "aa_primaryAppleAccount");
  v6 = [UIApp setupController];
  id v7 = [v6 appleIDSignInModel];
  uint64_t v8 = (uint64_t)[v7 hasSignedInToiCloud];

  id v9 = [v3 hasAddedPasscode];
  v10 = [UIApp bridgeController];
  unsigned int v11 = [v10 isTinkerPairing];

  if (v11 && (v8 & 1) == 0)
  {
    v12 = pbb_bridge_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(child-apple-pay) assuming addedAccountToWatch", buf, 2u);
    }

    uint64_t v8 = 1;
  }
  if (v5) {
    int v13 = v8;
  }
  else {
    int v13 = 0;
  }
  if ((v13 & v9 & 1) == 0)
  {
    v24 = pbb_bridge_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = +[NSNumber numberWithBool:v5 != 0];
      v26 = +[NSNumber numberWithBool:v8];
      v27 = +[NSNumber numberWithBool:v9];
      *(_DWORD *)buf = 138412802;
      v33 = v25;
      __int16 v34 = 2112;
      v35 = v26;
      __int16 v36 = 2112;
      v37 = v27;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Skipping Apple Pay (iPhone iCloud enabled %@, Watch iCloud enabled %@, Passcode Set: %@)", buf, 0x20u);
    }
    goto LABEL_20;
  }
  uint64_t v31 = 0;
  BOOL v14 = +[COSPaymentSetupAssistantController passkitFlowNeedsToRun:&v31];
  BOOL v15 = v14;
  if (v31) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v14;
  }
  v17 = pbb_bridge_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v29 = +[NSNumber numberWithBool:v15];
    +[NSNumber numberWithUnsignedInteger:v31];
    v18 = id v30 = v4;
    v19 = +[NSNumber numberWithBool:v16];
    v20 = +[NSNumber numberWithBool:1];
    v21 = +[NSNumber numberWithBool:1];
    v22 = +[NSNumber numberWithBool:1];
    *(_DWORD *)buf = 138413570;
    v33 = v29;
    __int16 v34 = 2112;
    v35 = v18;
    __int16 v36 = 2112;
    v37 = v19;
    __int16 v38 = 2112;
    v39 = v20;
    __int16 v40 = 2112;
    v41 = v21;
    __int16 v42 = 2112;
    v43 = v22;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Apple Pay elligibility: (NeedsToRun: %@) (requirements: %@) (willShowController: %@) -- (iPhone iCloud enabled %@, Watch iCloud enabled %@, Passcode Set: %@)", buf, 0x3Eu);

    id v4 = v30;
  }

  if (!v16)
  {
LABEL_20:
    [(id)objc_opt_class() _markApplePayOfferingComplete];
    BOOL v23 = 0;
    goto LABEL_21;
  }
  BOOL v23 = 1;
LABEL_21:

  return v23;
}

- (id)viewController
{
  return self->_pkViewController;
}

- (id)holdActivityIdentifier
{
  return @"ApplePayHoldActivity";
}

- (BOOL)holdBeforeDisplaying
{
  return 1;
}

- (void)didEstablishHold
{
  objc_initWeak(&location, self);
  if (PBLogPerformanceMetrics())
  {
    id v3 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    id v4 = [(COSPaymentSetupController *)self holdActivityIdentifier];
    [v3 beginMacroActivity:v4 beginTime:CFAbsoluteTimeGetCurrent()];
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10008BA38;
  v19[3] = &unk_1002455F0;
  v19[4] = self;
  objc_copyWeak(&v20, &location);
  objc_super v5 = objc_retainBlock(v19);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);
  id v7 = [WeakRetained paymentExpressSetupManager];

  if (v7
    && (id v8 = objc_loadWeakRetained((id *)&self->_setupController),
        unsigned int v9 = [v8 expressMode],
        v8,
        v9))
  {
    v10 = pbb_setupflow_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Configuring provisioning context for express setup", buf, 2u);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10008BCC4;
    v14[3] = &unk_100243FC0;
    id v15 = v7;
    BOOL v16 = self;
    v17 = v5;
    [v15 configureExpressSetupProvisioningContextWithCompletion:v14];
  }
  else
  {
    unsigned int v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Configuring payment setup controller for standard setup", buf, 2u);
    }

    v12 = [[COSPaymentSetupAssistantController alloc] initWithDelegate:self];
    pkSetupAssistant = self->_pkSetupAssistant;
    self->_pkSetupAssistant = (PKPaymentSetupAssistantController *)v12;

    [(PKPaymentSetupAssistantController *)self->_pkSetupAssistant setupAssistantViewControllerWithCompletion:v5];
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

+ (BOOL)controllerBlocksRunningBeforeSignInStep
{
  return 1;
}

- (void)paymentExpressSetupManager:(id)a3 viewControllerDidTerminateSetupFlow:(id)a4
{
}

- (void)paymentExpressSetupManager:(id)a3 peerPaymentAddAssociatedAccountViewController:(id)a4 didFinishWithSuccess:(BOOL)a5 updatedPeerPaymentAccount:(id)a6
{
}

- (void)paymentExpressSetupManager:(id)a3 peerPaymentAddAssociatedAccountViewControllerDidSkipSetup:(id)a4
{
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  [(id)objc_opt_class() _markApplePayOfferingComplete];
  id v4 = [(COSPaymentSetupController *)self delegate];
  [v4 buddyControllerDone:self];
}

- (void)viewController:(id)a3 requestPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008BEE4;
  block[3] = &unk_100245640;
  objc_copyWeak(&v18, &location);
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)viewController:(id)a3 didExitPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 withShouldContinue:(BOOL)a5 error:(id)a6
{
}

- (void)peerPaymentAddAssociatedAccountViewController:(id)a3 didFinishWithSuccess:(BOOL)a4 updatedPeerPaymentAccount:(id)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  id v8 = pbb_bridge_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    id v10 = "-[COSPaymentSetupController peerPaymentAddAssociatedAccountViewController:didFinishWithSuccess:updatedPeerPaymentAccount:]";
    __int16 v11 = 1024;
    BOOL v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "COSPaymentSetupController: %{public}s with success %d", (uint8_t *)&v9, 0x12u);
  }

  [(COSPaymentSetupController *)self viewControllerDidTerminateSetupFlow:v7];
}

- (void)peerPaymentAddAssociatedAccountViewControllerDidSkipSetup:(id)a3
{
  id v4 = a3;
  BOOL v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446210;
    id v7 = "-[COSPaymentSetupController peerPaymentAddAssociatedAccountViewControllerDidSkipSetup:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "COSPaymentSetupController: %{public}s", (uint8_t *)&v6, 0xCu);
  }

  [(COSPaymentSetupController *)self viewControllerDidTerminateSetupFlow:v4];
}

- (void)passcodeChangeComplexViewController:(id)a3 didChangeVisibilityWithIsVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    CFStringRef v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "passcodeChangeComplexViewController: %@ did change visibility with isVisible: %@", (uint8_t *)&v12, 0x16u);
  }

  int v9 = [(COSPaymentSetupController *)self passcodeUpgradeFlowController];
  id v10 = v9;
  if (v9)
  {
    if (v4) {
      [v9 beginShowingViewController];
    }
    else {
      [v9 endedShowingViewController];
    }
  }
  else
  {
    __int16 v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Expected to have a passcode upgrade flow controller, but instead found nil.", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)_passcodeChangeComplete
{
}

- (void)_endPasscodeUpgradeWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008C538;
  v8[3] = &unk_100243930;
  objc_copyWeak(&v10, &location);
  BOOL v11 = a3;
  id v9 = v6;
  id v7 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_invokePasscodeUpgradeCompletionWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v6 = [(COSPaymentSetupController *)self passcodeUpgradeCompletion];

  if (v6)
  {
    id v7 = [(COSPaymentSetupController *)self passcodeUpgradeCompletion];
    ((void (**)(void, BOOL, id))v7)[2](v7, v4, v8);

    [(COSPaymentSetupController *)self setPasscodeUpgradeCompletion:0];
  }
}

+ (void)_updateGizmoForSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [UIApp bridgeController];
  id v5 = v4;
  if (v3) {
    [v4 tellGizmoToPushControllerType:20];
  }
  else {
    [v4 tellGizmoToPopToControllerType:20];
  }
}

- (double)waitScreenPushGracePeriod
{
  return 0.0;
}

- (BOOL)holdWithWaitScreen
{
  return 1;
}

- (id)localizedWaitScreenDescription
{
  if (sub_100008380())
  {
    v2 = +[NSBundle mainBundle];
    BOOL v3 = [v2 localizedStringForKey:@"APPLE_PAY_WAITING_DESCRIPTION" value:&stru_100249230 table:@"Localizable"];
  }
  else
  {
    BOOL v4 = [UIApp setupController];
    id v5 = [v4 tinkerUserName];
    v2 = [v5 localizedCapitalizedString];

    id v6 = +[NSBundle mainBundle];
    if (v2)
    {
      id v7 = [v6 localizedStringForKey:@"APPLEID_ACCOUNT_HOLD_DESCRIPTION_TINKER_USER_%@" value:&stru_100249230 table:@"Localizable-tinker"];
      BOOL v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v2);
    }
    else
    {
      BOOL v3 = [v6 localizedStringForKey:@"APPLEID_ACCOUNT_HOLD_DESCRIPTION" value:&stru_100249230 table:@"Localizable"];
    }
  }

  return v3;
}

+ (void)_markApplePayOfferingComplete
{
  id v2 = [UIApp setupController];
  [v2 updateActivelyPairingWatchBuddyStage:8];
}

- (COSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSBuddyControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (COSSetupController)setupController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);

  return (COSSetupController *)WeakRetained;
}

- (PKPaymentSetupAssistantController)pkSetupAssistant
{
  return self->_pkSetupAssistant;
}

- (void)setPkSetupAssistant:(id)a3
{
}

- (PKPaymentSetupViewControllerDelegate)vcDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vcDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setVcDelegate:(id)a3
{
}

- (UIViewController)pkViewController
{
  return self->_pkViewController;
}

- (void)setPkViewController:(id)a3
{
}

- (PKPasscodeUpgradeFlowController)passcodeUpgradeFlowController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeUpgradeFlowController);

  return (PKPasscodeUpgradeFlowController *)WeakRetained;
}

- (void)setPasscodeUpgradeFlowController:(id)a3
{
}

- (COSPasscodeChangeComplexViewController)passcodeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeViewController);

  return (COSPasscodeChangeComplexViewController *)WeakRetained;
}

- (void)setPasscodeViewController:(id)a3
{
}

- (id)passcodeUpgradeCompletion
{
  return self->_passcodeUpgradeCompletion;
}

- (void)setPasscodeUpgradeCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_passcodeUpgradeCompletion, 0);
  objc_destroyWeak((id *)&self->_passcodeViewController);
  objc_destroyWeak((id *)&self->_passcodeUpgradeFlowController);
  objc_storeStrong((id *)&self->_pkViewController, 0);
  objc_destroyWeak((id *)&self->_vcDelegate);
  objc_storeStrong((id *)&self->_pkSetupAssistant, 0);
  objc_destroyWeak((id *)&self->_setupController);

  objc_destroyWeak((id *)&self->_delegate);
}

@end