@interface COSPairingTypeSelectionViewController
+ (BOOL)controllerNeedsToRun;
- (BOOL)handledButtonAction;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (BOOL)offerYorktown;
- (BOOL)requiresActivationCheck;
- (COSBuddyWatchDiscoveryMonitor)buddyWatchDiscoveryMonitor;
- (COSPairingTypeSelectionViewController)init;
- (COSSatellitePairingHelper)satellitePairingHelper;
- (NSString)desiredImageName;
- (NSString)fallbackImageName;
- (UIActivityIndicatorView)spinner;
- (UIImageView)marketingBannerImage;
- (id)alternateButtonTitle;
- (id)captionText;
- (id)detailString;
- (id)learnMoreButtonTitle;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)applyConfirmedOptin:(BOOL)a3;
- (void)applyConfirmedOptinAndCheckMaxDeviceCount:(BOOL)a3;
- (void)didEstablishHold;
- (void)discoveryOperationComplete;
- (void)dismissSetupFlow:(id)a3;
- (void)preflightPairingFlowAgainstDeviceTakeoverProtection:(BOOL)a3;
- (void)setBuddyWatchDiscoveryMonitor:(id)a3;
- (void)setDesiredImageName:(id)a3;
- (void)setFallbackImageName:(id)a3;
- (void)setHandledButtonAction:(BOOL)a3;
- (void)setMarketingBannerImage:(id)a3;
- (void)setSatellitePairingHelper:(id)a3;
- (void)setSpinner:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)updateHeroImageWithAnimation;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSPairingTypeSelectionViewController

- (BOOL)requiresActivationCheck
{
  return 0;
}

+ (BOOL)controllerNeedsToRun
{
  v2 = [UIApp setupController];
  v3 = [v2 resumePairingController];
  unsigned __int8 v4 = [v3 isResumingPairing];

  return v4 ^ 1;
}

- (COSPairingTypeSelectionViewController)init
{
  v14.receiver = self;
  v14.super_class = (Class)COSPairingTypeSelectionViewController;
  v2 = [(COSOptinViewController *)&v14 init];
  v3 = v2;
  if (v2)
  {
    [(COSPairingTypeSelectionViewController *)v2 setStyle:22];
    unsigned __int8 v4 = objc_alloc_init(COSSatellitePairingHelper);
    satellitePairingHelper = v3->_satellitePairingHelper;
    v3->_satellitePairingHelper = v4;

    [(COSSatellitePairingHelper *)v3->_satellitePairingHelper setAlertPresentationViewController:v3];
    uint64_t v6 = BPSDeviceRemoteAssetString();
    desiredImageName = v3->_desiredImageName;
    v3->_desiredImageName = (NSString *)v6;

    objc_storeStrong((id *)&v3->_fallbackImageName, PBAssetsSetupAppleWatchSplashFallbackAssetName);
    v8 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    spinner = v3->_spinner;
    v3->_spinner = v8;

    v10 = [[COSBuddyWatchDiscoveryMonitor alloc] initWithPresentingViewController:v3];
    buddyWatchDiscoveryMonitor = v3->_buddyWatchDiscoveryMonitor;
    v3->_buddyWatchDiscoveryMonitor = v10;

    [(COSBuddyWatchDiscoveryMonitor *)v3->_buddyWatchDiscoveryMonitor setDelegate:v3];
    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v3 selector:"updateHeroImageWithAnimation" name:PBBridgeMobileAssetsChangedNotification object:0];
  }
  return v3;
}

- (BOOL)holdBeforeDisplaying
{
  return 1;
}

- (BOOL)holdWithWaitScreen
{
  return 0;
}

- (void)didEstablishHold
{
  v3 = [UIApp setupController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C7970;
  v4[3] = &unk_1002438A0;
  v4[4] = self;
  [v3 updateStagedMDMEnrollmentDataForPairingWatchWithCompletion:v4];
}

- (BOOL)offerYorktown
{
  v2 = [UIApp setupController];
  unsigned __int8 v3 = [v2 offerYorktownForCurrentPairing];

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)COSPairingTypeSelectionViewController;
  [(COSPairingTypeSelectionViewController *)&v9 viewWillAppear:a3];
  [(COSBuddyWatchDiscoveryMonitor *)self->_buddyWatchDiscoveryMonitor startDiscoveryCoordinator];
  unsigned __int8 v4 = [(COSPairingTypeSelectionViewController *)self navigationItem];
  id v5 = objc_alloc((Class)UIBarButtonItem);
  uint64_t v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"CANCEL_SETUP_FLOW" value:&stru_100249230 table:@"Localizable"];
  id v8 = [v5 initWithTitle:v7 style:0 target:self action:"dismissSetupFlow:"];

  [v4 setRightBarButtonItem:v8 animated:0];
}

- (void)viewDidLoad
{
  v45.receiver = self;
  v45.super_class = (Class)COSPairingTypeSelectionViewController;
  [(COSPairingTypeSelectionViewController *)&v45 viewDidLoad];
  unsigned __int8 v3 = [(COSPairingTypeSelectionViewController *)self desiredImageName];
  unsigned __int8 v4 = +[UIImage imageNamed:v3];

  if (!v4)
  {
    id v5 = [(COSPairingTypeSelectionViewController *)self fallbackImageName];
    unsigned __int8 v4 = +[UIImage imageNamed:v5];
  }
  id v6 = [objc_alloc((Class)UIImageView) initWithImage:v4];
  [(COSPairingTypeSelectionViewController *)self setMarketingBannerImage:v6];

  v7 = [(COSPairingTypeSelectionViewController *)self marketingBannerImage];
  id v8 = [v7 layer];
  [v8 setMinificationFilter:kCAFilterTrilinear];

  objc_super v9 = [(COSPairingTypeSelectionViewController *)self marketingBannerImage];
  [v9 setContentMode:1];

  v10 = [(COSPairingTypeSelectionViewController *)self contentView];
  v11 = [(COSPairingTypeSelectionViewController *)self marketingBannerImage];
  [v10 addSubview:v11];

  v12 = [(COSPairingTypeSelectionViewController *)self marketingBannerImage];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(COSPairingTypeSelectionViewController *)self marketingBannerImage];
  objc_super v14 = [v13 topAnchor];
  v15 = [(COSPairingTypeSelectionViewController *)self contentView];
  v16 = [v15 topAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  v18 = [(COSPairingTypeSelectionViewController *)self marketingBannerImage];
  v19 = [v18 bottomAnchor];
  v20 = [(COSPairingTypeSelectionViewController *)self contentView];
  v21 = [v20 bottomAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  v23 = [(COSPairingTypeSelectionViewController *)self marketingBannerImage];
  v24 = [v23 leftAnchor];
  v25 = [(COSPairingTypeSelectionViewController *)self contentView];
  v26 = [v25 leftAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  [v27 setActive:1];

  v28 = [(COSPairingTypeSelectionViewController *)self marketingBannerImage];
  v29 = [v28 rightAnchor];
  v30 = [(COSPairingTypeSelectionViewController *)self contentView];
  v31 = [v30 rightAnchor];
  v32 = [v29 constraintEqualToAnchor:v31];
  [v32 setActive:1];

  if (self->_spinner)
  {
    v33 = [(COSPairingTypeSelectionViewController *)self buttonTray];
    [v33 addSubview:self->_spinner];

    [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    v34 = [(UIActivityIndicatorView *)self->_spinner bottomAnchor];
    v35 = [(COSPairingTypeSelectionViewController *)self buttonTray];
    v36 = [v35 topAnchor];
    v37 = [v34 constraintEqualToAnchor:v36 constant:-16.0];
    [v37 setActive:1];

    v38 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
    v39 = [(COSPairingTypeSelectionViewController *)self buttonTray];
    v40 = [v39 centerXAnchor];
    v41 = [v38 constraintEqualToAnchor:v40];
    [v41 setActive:1];
  }
  v42 = [(COSPairingTypeSelectionViewController *)self navigationItem];
  v43 = [(COSPairingTypeSelectionViewController *)self titleString];
  [v42 setBackButtonTitle:v43];

  v44 = [(COSPairingTypeSelectionViewController *)self navigationItem];
  [v44 setBackButtonDisplayMode:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)COSPairingTypeSelectionViewController;
  [(COSPairingTypeSelectionViewController *)&v5 viewDidDisappear:a3];
  unsigned __int8 v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[COSPairingTypeSelectionViewController viewDidDisappear:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  self->_handledButtonAction = 0;
}

- (void)updateHeroImageWithAnimation
{
  unsigned __int8 v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "updating hero image in pairing type selection ViewController", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C8164;
  v7[3] = &unk_1002438A0;
  v7[4] = self;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C832C;
  block[3] = &unk_1002441B0;
  block[4] = self;
  id v6 = objc_retainBlock(v7);
  unsigned __int8 v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dismissSetupFlow:(id)a3
{
  +[PBBridgeCAReporter incrementSuccessType:17];
  unsigned __int8 v3 = (void *)UIApp;

  [v3 dismissSetupFlowComplete:0 animated:1];
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"SETUP_CHOICE_TITLE" value:&stru_100249230 table:@"Localizable"];
  unsigned __int8 v4 = +[NSString stringWithFormat:v3];

  return v4;
}

- (id)detailString
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"SETUP_CHOICE_SUBTITLE" value:&stru_100249230 table:@"Localizable"];
  unsigned __int8 v4 = +[NSString stringWithFormat:v3];

  return v4;
}

- (id)captionText
{
  if ([(COSPairingTypeSelectionViewController *)self offerYorktown])
  {
    v2 = 0;
  }
  else
  {
    int v3 = sub_100033338();
    unsigned __int8 v4 = +[NSBundle mainBundle];
    objc_super v5 = v4;
    if (v3) {
      CFStringRef v6 = @"SETUP_CHOICE_CAPTION_TEXT_GT";
    }
    else {
      CFStringRef v6 = @"SETUP_CHOICE_CAPTION_TEXT";
    }
    v2 = [v4 localizedStringForKey:v6 value:&stru_100249230 table:@"Localizable-tinker"];
  }

  return v2;
}

- (id)learnMoreButtonTitle
{
  return 0;
}

- (void)suggestedButtonPressed:(id)a3
{
  if (self->_handledButtonAction)
  {
    int v3 = pbb_setupflow_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      objc_super v5 = "-[COSPairingTypeSelectionViewController suggestedButtonPressed:]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: already handled button action. Skipping", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    self->_handledButtonAction = 1;
    [(COSPairingTypeSelectionViewController *)self preflightPairingFlowAgainstDeviceTakeoverProtection:1];
  }
}

- (void)alternateButtonPressed:(id)a3
{
  if (self->_handledButtonAction)
  {
    int v3 = pbb_setupflow_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      objc_super v5 = "-[COSPairingTypeSelectionViewController alternateButtonPressed:]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: already handled button action. Skipping", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    self->_handledButtonAction = 1;
    [(COSPairingTypeSelectionViewController *)self preflightPairingFlowAgainstDeviceTakeoverProtection:0];
  }
}

- (void)applyConfirmedOptin:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [UIApp automationFlowPressed];
  if (v3)
  {
    unsigned int v6 = v5;
    v7 = [UIApp bridgeController];
    [v7 setTinkerPairing:0];

    if ([(COSPairingTypeSelectionViewController *)self offerYorktown]
      || !_os_feature_enabled_impl())
    {
      v11 = [(COSPairingTypeSelectionViewController *)self delegate];
      [v11 buddyControllerDone:self];
    }
    else
    {
      [(COSBuddyWatchDiscoveryMonitor *)self->_buddyWatchDiscoveryMonitor discoverWatchesOrShowSpinner];
    }
    if ((sub_100032420() & v6) == 1)
    {
      id v12 = +[NSNotificationCenter defaultCenter];
      [v12 postNotificationName:@"COSDevicePresentInternalManualPairing" object:0];
    }
  }
  else
  {
    [(UIActivityIndicatorView *)self->_spinner startAnimating];
    id v8 = [(COSPairingTypeSelectionViewController *)self suggestedChoiceButton];
    [v8 setEnabled:0];

    objc_super v9 = [(COSPairingTypeSelectionViewController *)self alternateChoiceButton];
    [v9 setEnabled:0];

    objc_initWeak(&location, self);
    v10 = [(COSPairingTypeSelectionViewController *)self satellitePairingHelper];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000C8A28;
    v13[3] = &unk_100243810;
    objc_copyWeak(&v14, &location);
    [v10 checkPairingPreconditionsWithCompletion:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"SETUP_TYPE_CLASSIC" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  if ([(COSPairingTypeSelectionViewController *)self offerYorktown])
  {
    v2 = 0;
  }
  else
  {
    BOOL v3 = +[NSBundle mainBundle];
    v2 = [v3 localizedStringForKey:@"SETUP_TYPE_SATELLITE" value:&stru_100249230 table:@"Localizable-tinker"];
  }

  return v2;
}

- (void)preflightPairingFlowAgainstDeviceTakeoverProtection:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = objc_alloc_init((Class)LAContext);
    unsigned int v6 = pbb_setupflow_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[COSPairingTypeSelectionViewController preflightPairingFlowAgainstDeviceTakeoverProtection:]";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s ~ Context: %@", buf, 0x16u);
    }

    v12[0] = &off_10025C1F0;
    v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"SETUP_DTO_PROTECTION_REASON" value:&stru_100249230 table:@"Localizable"];
    v12[1] = &off_10025C208;
    v13[0] = v8;
    v13[1] = &__kCFBooleanTrue;
    objc_super v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C8EA0;
    v10[3] = &unk_100246748;
    v10[4] = self;
    BOOL v11 = v3;
    [v5 evaluatePolicy:1025 options:v9 reply:v10];
  }
  else
  {
    [(COSPairingTypeSelectionViewController *)self applyConfirmedOptinAndCheckMaxDeviceCount:v3];
  }
}

- (void)applyConfirmedOptinAndCheckMaxDeviceCount:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSNumber numberWithInt:!a3];
  v33 = 0;
  int v6 = sub_10000A2A4(v5, (const __CFString **)&v33);
  v7 = v33;

  if (v6)
  {
    [(COSPairingTypeSelectionViewController *)self applyConfirmedOptin:v3];
  }
  else
  {
    id v8 = [(__CFString *)v7 code];
    if ((unint64_t)v8 <= 3)
    {
      id v9 = v8;
      v10 = [(__CFString *)v7 domain];
      unsigned int v11 = [v10 isEqualToString:@"com.apple.Bridge-QuickSwitchPairing"];

      if (v11)
      {
        switch((unint64_t)v9)
        {
          case 0uLL:
            id v12 = +[NSBundle mainBundle];
            v13 = v12;
            CFStringRef v14 = @"INCOMPATIBLE_WATCH_TITLE";
            goto LABEL_11;
          case 1uLL:
            id v12 = +[NSBundle mainBundle];
            v13 = v12;
            CFStringRef v14 = @"MAX_WATCH_TITLE";
            goto LABEL_11;
          case 2uLL:
            id v12 = +[NSBundle mainBundle];
            v13 = v12;
            CFStringRef v14 = @"FROZEN_FOR_RETAIL_DEMO_TITLE";
            goto LABEL_11;
          case 3uLL:
            id v12 = +[NSBundle mainBundle];
            v13 = v12;
            CFStringRef v14 = @"MAX_PAIRING_FOR_RETAIL_DEMO_TITLE";
LABEL_11:
            v15 = [v12 localizedStringForKey:v14 value:&stru_100249230 table:@"Pairing"];

            break;
          default:
            v15 = 0;
            break;
        }
        switch((unint64_t)v9)
        {
          case 0uLL:
            __int16 v16 = +[NSBundle mainBundle];
            id v17 = v16;
            CFStringRef v18 = @"INCOMPATIBLE_WATCH_MESSAGE";
            goto LABEL_18;
          case 1uLL:
            id v17 = +[NSBundle mainBundle];
            v30 = [v17 localizedStringForKey:@"MAX_WATCH_MESSAGE_TINKER" value:&stru_100249230 table:@"Localizable-tinker"];
            v31 = +[NRPairedDeviceRegistry sharedInstance];
            v29 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v31 maxPairedDeviceCount]);
            v20 = +[NSNumberFormatter localizedStringFromNumber:v29 numberStyle:0];
            v21 = +[NRPairedDeviceRegistry sharedInstance];
            v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v21 maxTinkerPairedDeviceCount]);
            v23 = +[NSNumberFormatter localizedStringFromNumber:v22 numberStyle:0];
            v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v30, v20, v23);

            goto LABEL_19;
          case 2uLL:
            __int16 v16 = +[NSBundle mainBundle];
            id v17 = v16;
            CFStringRef v18 = @"FROZEN_FOR_RETAIL_DEMO";
            goto LABEL_18;
          case 3uLL:
            __int16 v16 = +[NSBundle mainBundle];
            id v17 = v16;
            CFStringRef v18 = @"MAX_PAIRING_FOR_RETAIL_DEMO";
LABEL_18:
            v19 = [v16 localizedStringForKey:v18 value:&stru_100249230 table:@"Pairing"];
LABEL_19:

            if (v15 && v19)
            {
              v24 = +[UIAlertController alertControllerWithTitle:v15 message:v19 preferredStyle:1];
              v25 = +[NSBundle mainBundle];
              v26 = [v25 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];
              v27 = +[UIAlertAction actionWithTitle:v26 style:1 handler:&stru_100246768];
              [v24 addAction:v27];

              v28 = pbb_setupflow_log();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Presenting new pairing flow alert", buf, 2u);
              }

              [(COSPairingTypeSelectionViewController *)self presentViewController:v24 animated:0 completion:0];
            }
            break;
          default:
            v19 = 0;
            break;
        }
      }
    }
  }
}

- (void)discoveryOperationComplete
{
  id v3 = [(COSPairingTypeSelectionViewController *)self delegate];
  [v3 buddyControllerDone:self];
}

- (COSSatellitePairingHelper)satellitePairingHelper
{
  return self->_satellitePairingHelper;
}

- (void)setSatellitePairingHelper:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (COSBuddyWatchDiscoveryMonitor)buddyWatchDiscoveryMonitor
{
  return self->_buddyWatchDiscoveryMonitor;
}

- (void)setBuddyWatchDiscoveryMonitor:(id)a3
{
}

- (UIImageView)marketingBannerImage
{
  return self->_marketingBannerImage;
}

- (void)setMarketingBannerImage:(id)a3
{
}

- (NSString)desiredImageName
{
  return self->_desiredImageName;
}

- (void)setDesiredImageName:(id)a3
{
}

- (NSString)fallbackImageName
{
  return self->_fallbackImageName;
}

- (void)setFallbackImageName:(id)a3
{
}

- (BOOL)handledButtonAction
{
  return self->_handledButtonAction;
}

- (void)setHandledButtonAction:(BOOL)a3
{
  self->_handledButtonAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackImageName, 0);
  objc_storeStrong((id *)&self->_desiredImageName, 0);
  objc_storeStrong((id *)&self->_marketingBannerImage, 0);
  objc_storeStrong((id *)&self->_buddyWatchDiscoveryMonitor, 0);
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_storeStrong((id *)&self->_satellitePairingHelper, 0);
}

@end