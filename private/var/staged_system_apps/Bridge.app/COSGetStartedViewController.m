@interface COSGetStartedViewController
- (BOOL)didRegisterNRObserver;
- (BOOL)isAutomationUIEnabled;
- (BOOL)pairingInfrastructureIsBusy;
- (COSGetStartedViewController)init;
- (COSGetStartedViewControllerDelegate)getStartedDelegate;
- (COSWatchUnpairInstructionsController)unpairInstructions;
- (MCProfileConnection)mcConnection;
- (NSString)desiredImageName;
- (NSString)fallbackImageName;
- (NSTimer)welcomeTextUpdater;
- (UIButton)automationButton;
- (UIImageView)marketingBannerImage;
- (id)_getUnpairInstructions;
- (id)detailString;
- (id)learnMoreButtonTitle;
- (id)suggestedButtonTitle;
- (id)titleString;
- (unint64_t)radioState;
- (void)_logConnectionDescription;
- (void)_tappedInternalManualMode:(id)a3;
- (void)_unregisterNRObserver;
- (void)dealloc;
- (void)learnMoreButtonPressed:(id)a3;
- (void)nanoRegistryStatusChanged:(id)a3;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)registerNRObserver;
- (void)setAutomationButton:(id)a3;
- (void)setDesiredImageName:(id)a3;
- (void)setDidRegisterNRObserver:(BOOL)a3;
- (void)setFallbackImageName:(id)a3;
- (void)setGetStartedDelegate:(id)a3;
- (void)setIsAutomationUIEnabled:(BOOL)a3;
- (void)setMarketingBannerImage:(id)a3;
- (void)setMcConnection:(id)a3;
- (void)setPairingInfrastructureIsBusy:(BOOL)a3;
- (void)setRadioState:(unint64_t)a3;
- (void)setUnpairInstructions:(id)a3;
- (void)setWelcomeTextUpdater:(id)a3;
- (void)showConnectivityAlert;
- (void)startUpdatingWelcomeText;
- (void)stopUpdatingWelcomeText;
- (void)suggestedButtonPressed:(id)a3;
- (void)updateImagesWithAnimation;
- (void)updateRadioState;
- (void)updateUIState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSGetStartedViewController

- (COSGetStartedViewController)init
{
  v12.receiver = self;
  v12.super_class = (Class)COSGetStartedViewController;
  v2 = [(COSGetStartedViewController *)&v12 init];
  v3 = v2;
  if (v2)
  {
    [(COSGetStartedViewController *)v2 setStyle:18];
    v3->_isAutomationUIEnabled = sub_100032420();
    uint64_t v4 = BPSDeviceRemoteAssetString();
    desiredImageName = v3->_desiredImageName;
    v3->_desiredImageName = (NSString *)v4;

    objc_storeStrong((id *)&v3->_fallbackImageName, PBAssetsSetupAppleWatchSplashFallbackAssetName);
    v6 = +[NRPairedDeviceRegistry sharedInstance];
    id v7 = [v6 status];

    if (v7 != (id)2)
    {
      [(COSGetStartedViewController *)v3 setPairingInfrastructureIsBusy:1];
      v8 = pbb_setupflow_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(Get Started Controller) Waiting for NR to be ready (Was Not Ready At Init)...", v11, 2u);
      }

      [(COSGetStartedViewController *)v3 registerNRObserver];
    }
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v3 selector:"updateImagesWithAnimation" name:PBBridgeMobileAssetsChangedNotification object:0];
  }
  return v3;
}

- (void)dealloc
{
  [(MCProfileConnection *)self->_mcConnection unregisterObserver:self];
  [(COSGetStartedViewController *)self stopUpdatingWelcomeText];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(COSGetStartedViewController *)self _unregisterNRObserver];
  v4.receiver = self;
  v4.super_class = (Class)COSGetStartedViewController;
  [(COSGetStartedViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v52.receiver = self;
  v52.super_class = (Class)COSGetStartedViewController;
  [(COSGetStartedViewController *)&v52 viewDidLoad];
  v3 = [(COSGetStartedViewController *)self desiredImageName];
  objc_super v4 = +[UIImage imageNamed:v3];

  if (!v4)
  {
    v5 = [(COSGetStartedViewController *)self fallbackImageName];
    objc_super v4 = +[UIImage imageNamed:v5];
  }
  v6 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v4];
  marketingBannerImage = self->_marketingBannerImage;
  self->_marketingBannerImage = v6;

  v8 = [(UIImageView *)self->_marketingBannerImage layer];
  [v8 setMinificationFilter:kCAFilterTrilinear];

  [(UIImageView *)self->_marketingBannerImage setContentMode:1];
  v9 = [(COSGetStartedViewController *)self contentView];
  [v9 addSubview:self->_marketingBannerImage];

  [(UIImageView *)self->_marketingBannerImage setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [(UIImageView *)self->_marketingBannerImage topAnchor];
  v11 = [(COSGetStartedViewController *)self contentView];
  objc_super v12 = [v11 topAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [(UIImageView *)self->_marketingBannerImage bottomAnchor];
  v15 = [(COSGetStartedViewController *)self contentView];
  v16 = [v15 bottomAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  v18 = [(UIImageView *)self->_marketingBannerImage leftAnchor];
  v19 = [(COSGetStartedViewController *)self contentView];
  v20 = [v19 leftAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  v22 = [(UIImageView *)self->_marketingBannerImage rightAnchor];
  v23 = [(COSGetStartedViewController *)self contentView];
  v24 = [v23 rightAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  if (self->_isAutomationUIEnabled)
  {
    v26 = +[UIButton buttonWithType:1];
    automationButton = self->_automationButton;
    self->_automationButton = v26;

    [(UIButton *)self->_automationButton setAccessibilityIdentifier:@"AutomationButton"];
    v28 = self->_automationButton;
    v29 = BPSPillButtonImage();
    [(UIButton *)v28 setImage:v29 forState:0];

    v30 = self->_automationButton;
    v31 = BPSPillButtonImage();
    [(UIButton *)v30 setImage:v31 forState:4];

    v32 = self->_automationButton;
    v33 = +[UIColor whiteColor];
    [(UIButton *)v32 setTintColor:v33];

    [(UIButton *)self->_automationButton addTarget:self action:"_tappedInternalManualMode:" forControlEvents:64];
    v34 = [(COSGetStartedViewController *)self view];
    [v34 addSubview:self->_automationButton];

    [(UIButton *)self->_automationButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_automationButton sizeToFit];
    v51 = [(UIButton *)self->_automationButton centerXAnchor];
    v35 = [(COSGetStartedViewController *)self view];
    v36 = [v35 centerXAnchor];
    v37 = [v51 constraintEqualToAnchor:v36];
    v53[0] = v37;
    v38 = [(UIButton *)self->_automationButton bottomAnchor];
    v39 = [(COSGetStartedViewController *)self view];
    v40 = [v39 bottomAnchor];
    v41 = [v38 constraintEqualToAnchor:v40 constant:-100.0];
    v53[1] = v41;
    +[NSArray arrayWithObjects:v53 count:2];
    v43 = v42 = v4;
    +[NSLayoutConstraint activateConstraints:v43];

    objc_super v4 = v42;
  }
  v44 = +[MCProfileConnection sharedConnection];
  mcConnection = self->_mcConnection;
  self->_mcConnection = v44;

  [(MCProfileConnection *)self->_mcConnection registerObserver:self];
  if ((sub_10000F71C() & 1) != 0
    || [(MCProfileConnection *)self->_mcConnection effectiveBoolValueForSetting:MCFeaturePairedWatchAllowed] == 2)
  {
    v46 = [(COSGetStartedViewController *)self suggestedChoiceButton];
    [v46 setEnabled:0];
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100046594, @"com.apple.bluetooth.power-changed", 0, (CFNotificationSuspensionBehavior)0);
  v48 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v49 = [v48 BOOLForKey:@"__SkipReachabilityChecks"];

  if ((v49 & 1) == 0)
  {
    v50 = +[NSNotificationCenter defaultCenter];
    [v50 addObserver:self selector:"updateRadioStateForNotification:" name:@"COSReachabilityMonitorChangedNotification" object:0];
  }
  [(COSGetStartedViewController *)self startUpdatingWelcomeText];
  [(COSGetStartedViewController *)self updateRadioState];
  [(COSGetStartedViewController *)self refreshViews];
}

- (void)updateImagesWithAnimation
{
  v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "updating hero image in get started ViewController", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100046EE4;
  v7[3] = &unk_1002438A0;
  v7[4] = self;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047098;
  block[3] = &unk_1002441B0;
  block[4] = self;
  v6 = objc_retainBlock(v7);
  objc_super v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_getUnpairInstructions
{
  unpairInstructions = self->_unpairInstructions;
  if (!unpairInstructions)
  {
    objc_super v4 = objc_alloc_init(COSWatchUnpairInstructionsController);
    v5 = self->_unpairInstructions;
    self->_unpairInstructions = v4;

    unpairInstructions = self->_unpairInstructions;
  }

  return unpairInstructions;
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)COSGetStartedViewController;
  [(COSGetStartedViewController *)&v12 viewDidAppear:a3];
  objc_super v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"DisplayGraduationUnpairInstructions"];

  v6 = pbb_setupflow_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Has Alt account: %d", buf, 8u);
  }

  if (v5)
  {
    id v7 = +[NRPairedDeviceRegistry sharedInstance];
    unsigned int v8 = [v7 watchNeedsGraduation];

    if (v8)
    {
      v9 = pbb_setupflow_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [(COSGetStartedViewController *)self _getUnpairInstructions];
        *(_DWORD *)buf = 138412290;
        v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Present unpair instructions : %@", buf, 0xCu);
      }
      v11 = [(COSGetStartedViewController *)self _getUnpairInstructions];
      [v11 presentWithController:self];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)COSGetStartedViewController;
  [(COSGetStartedViewController *)&v10 viewWillAppear:a3];
  [(COSGetStartedViewController *)self updateWelcomeText];
  [(COSGetStartedViewController *)self is_addGestureRecognizer];
  objc_super v4 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned int v5 = [v4 compatibilityState];

  v6 = +[NRPairedDeviceRegistry sharedInstance];
  [v6 status];

  id v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = NRPairedDeviceRegistryStatusCodeString();
    *(_DWORD *)buf = 67109890;
    int v12 = 238;
    __int16 v13 = 2080;
    v14 = "-[COSGetStartedViewController viewWillAppear:]";
    __int16 v15 = 2048;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%d %s - NR State: %lu; Status: %@", buf, 0x26u);
  }
  if (v5 - 4 <= 0xFFFFFFFD)
  {
    v9 = pbb_setupflow_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(Get Started Controller) Waiting for NR to be ready (View Will Appear)...", buf, 2u);
    }

    [(COSGetStartedViewController *)self registerNRObserver];
  }
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)COSGetStartedViewController;
  [(COSGetStartedViewController *)&v4 viewDidLayoutSubviews];
  if (self->_isAutomationUIEnabled)
  {
    v3 = [(COSGetStartedViewController *)self view];
    [v3 bringSubviewToFront:self->_automationButton];
  }
}

- (id)titleString
{
  v2 = +[NSCalendar currentCalendar];
  v3 = +[NSDate date];
  objc_super v4 = [v2 components:32 fromDate:v3];

  unsigned int v5 = (char *)[v4 hour];
  if ((unint64_t)(v5 - 12) >= 5) {
    CFStringRef v6 = @"WELCOME_NIGHT";
  }
  else {
    CFStringRef v6 = @"WELCOME_DAY";
  }
  if ((unint64_t)(v5 - 2) >= 0xA) {
    CFStringRef v7 = v6;
  }
  else {
    CFStringRef v7 = @"WELCOME_MORNING";
  }
  unsigned int v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:v7 value:&stru_100249230 table:@"Localizable"];

  return v9;
}

- (id)detailString
{
  BOOL pairingInfrastructureIsBusy = self->_pairingInfrastructureIsBusy;
  v3 = +[NSBundle mainBundle];
  objc_super v4 = v3;
  if (pairingInfrastructureIsBusy) {
    CFStringRef v5 = @"WAITING_FOR_NR";
  }
  else {
    CFStringRef v5 = @"READY_TO_START";
  }
  CFStringRef v6 = [v3 localizedStringForKey:v5 value:&stru_100249230 table:@"Localizable"];

  return v6;
}

- (id)suggestedButtonTitle
{
  int v2 = sub_100033338();
  v3 = +[NSBundle mainBundle];
  objc_super v4 = v3;
  if (v2) {
    CFStringRef v5 = @"YES_START_GT";
  }
  else {
    CFStringRef v5 = @"YES_START";
  }
  CFStringRef v6 = [v3 localizedStringForKey:v5 value:&stru_100249230 table:@"Localizable"];

  return v6;
}

- (id)learnMoreButtonTitle
{
  int v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"LEARN_MORE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
  [(COSGetStartedViewController *)self _logConnectionDescription];
  if (self->_radioState)
  {
    [(COSGetStartedViewController *)self showConnectivityAlert];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_getStartedDelegate);
    [WeakRetained tappedStart];

    kdebug_trace();
  }
}

- (void)learnMoreButtonPressed:(id)a3
{
  v3 = (void *)UIApp;
  sub_100032678();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 openURL:v4 withCompletionHandler:0];
}

- (void)_tappedInternalManualMode:(id)a3
{
  [(COSGetStartedViewController *)self _logConnectionDescription];
  if (self->_radioState)
  {
    [(COSGetStartedViewController *)self showConnectivityAlert];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_getStartedDelegate);
    [WeakRetained tappedStartInternal];
  }
}

- (void)startUpdatingWelcomeText
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"updateWelcomeText" name:UIApplicationWillEnterForegroundNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"updateWelcomeText" name:UIApplicationDidBecomeActiveNotification object:0];

  CFStringRef v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"updateWelcomeText" name:UIApplicationSignificantTimeChangeNotification object:0];

  CFStringRef v6 = +[NSTimer scheduledTimerWithTimeInterval:self target:"updateWelcomeText" selector:0 userInfo:1 repeats:60.0];
  welcomeTextUpdater = self->_welcomeTextUpdater;
  self->_welcomeTextUpdater = v6;
}

- (void)stopUpdatingWelcomeText
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIApplicationDidBecomeActiveNotification object:0];

  CFStringRef v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIApplicationSignificantTimeChangeNotification object:0];

  [(NSTimer *)self->_welcomeTextUpdater invalidate];
  welcomeTextUpdater = self->_welcomeTextUpdater;
  self->_welcomeTextUpdater = 0;
}

- (void)setPairingInfrastructureIsBusy:(BOOL)a3
{
  self->_BOOL pairingInfrastructureIsBusy = a3;
  id v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL pairingInfrastructureIsBusy = self->_pairingInfrastructureIsBusy;
    v6[0] = 67109120;
    v6[1] = pairingInfrastructureIsBusy;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "setPairingInfrastructureIsBusy: %d ", (uint8_t *)v6, 8u);
  }

  [(COSGetStartedViewController *)self updateUIState];
}

- (void)updateUIState
{
  if (!self->_pairingInfrastructureIsBusy) {
    [(COSGetStartedViewController *)self updateRadioState];
  }

  [(COSGetStartedViewController *)self refreshViews];
}

- (void)updateRadioState
{
  int v3 = MGGetBoolAnswer();
  if (v3) {
    unsigned __int8 v4 = +[PSBluetoothSettingsDetail isEnabled];
  }
  else {
    unsigned __int8 v4 = 0;
  }
  CFStringRef v5 = +[COSReachabilityMonitor sharedMonitor];
  unsigned __int8 v6 = [v5 isNetworkReachable];

  self->_radioState = 0;
  if (v3)
  {
    if ((v4 & 1) == 0)
    {
      CFStringRef v7 = pbb_setupflow_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100171CB8(v7);
      }

      self->_radioState |= 2uLL;
    }
  }
  else
  {
    unsigned int v8 = pbb_setupflow_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No Bluetooth capability, Bluetooth state ignored", v10, 2u);
    }
  }
  if ((v6 & 1) == 0)
  {
    v9 = pbb_setupflow_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100171C74(v9);
    }

    self->_radioState |= 8uLL;
  }
  [(COSGetStartedViewController *)self _logConnectionDescription];
}

- (void)_logConnectionDescription
{
  int v2 = MGGetBoolAnswer();
  unsigned int v3 = +[PSBluetoothSettingsDetail isEnabled];
  unsigned __int8 v4 = +[COSReachabilityMonitor sharedMonitor];
  unsigned int v5 = [v4 isNetworkReachable];

  if ((v2 & (v3 ^ 1) & 1) != 0 || !v5)
  {
    unsigned __int8 v6 = pbb_setupflow_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100171CFC(v5, v6);
    }
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5 = [(COSGetStartedViewController *)self suggestedChoiceButton];
  [v5 setEnabled:[self->_mcConnection effectiveBoolValueForSetting:MCFeaturePairedWatchAllowed] != 2];
}

- (void)registerNRObserver
{
  if (!self->_didRegisterNRObserver)
  {
    unsigned int v3 = pbb_setupflow_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(Get Started Controller) registerNRObserver", v5, 2u);
    }

    unsigned __int8 v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"nanoRegistryStatusChanged:" name:NRPairedDeviceRegistryStatusDidChange object:0];

    self->_didRegisterNRObserver = 1;
  }
}

- (void)_unregisterNRObserver
{
  unsigned int v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  self->_didRegisterNRObserver = 0;
}

- (void)showConnectivityAlert
{
  unsigned int v3 = +[NSBundle mainBundle];
  unsigned __int8 v4 = [v3 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];
  id v5 = +[UIAlertAction actionWithTitle:v4 style:1 handler:0];

  unsigned __int8 v6 = +[NSBundle mainBundle];
  CFStringRef v7 = [v6 localizedStringForKey:@"PAIRING_GET_CONNECTED_ALERT_TITLE" value:&stru_100249230 table:@"Localizable"];
  unsigned int v8 = +[NSBundle mainBundle];
  v9 = SFLocalizableWAPIStringKeyForKey();
  objc_super v10 = [v8 localizedStringForKey:v9 value:&stru_100249230 table:@"Localizable"];
  v11 = +[UIAlertController alertControllerWithTitle:v7 message:v10 preferredStyle:1];

  [v11 addAction:v5];
  int v12 = pbb_setupflow_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Presenting 'pairing get connected' alert", v13, 2u);
  }

  [(COSGetStartedViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)nanoRegistryStatusChanged:(id)a3
{
  unsigned __int8 v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:NRPairedDeviceRegistryStatusKey];

  unsigned __int8 v6 = pbb_setupflow_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(Get Started Controller) NR Status Changed to %@", (uint8_t *)&v8, 0xCu);
  }

  if (v5)
  {
    CFStringRef v7 = (char *)[v5 integerValue];
    if ((unint64_t)(v7 - 5) >= 0xFFFFFFFFFFFFFFFDLL) {
      [(COSGetStartedViewController *)self setPairingInfrastructureIsBusy:v7 != (char *)2];
    }
  }
}

- (COSGetStartedViewControllerDelegate)getStartedDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_getStartedDelegate);

  return (COSGetStartedViewControllerDelegate *)WeakRetained;
}

- (void)setGetStartedDelegate:(id)a3
{
}

- (BOOL)didRegisterNRObserver
{
  return self->_didRegisterNRObserver;
}

- (void)setDidRegisterNRObserver:(BOOL)a3
{
  self->_didRegisterNRObserver = a3;
}

- (BOOL)isAutomationUIEnabled
{
  return self->_isAutomationUIEnabled;
}

- (void)setIsAutomationUIEnabled:(BOOL)a3
{
  self->_isAutomationUIEnabled = a3;
}

- (BOOL)pairingInfrastructureIsBusy
{
  return self->_pairingInfrastructureIsBusy;
}

- (unint64_t)radioState
{
  return self->_radioState;
}

- (void)setRadioState:(unint64_t)a3
{
  self->_radioState = a3;
}

- (NSTimer)welcomeTextUpdater
{
  return self->_welcomeTextUpdater;
}

- (void)setWelcomeTextUpdater:(id)a3
{
}

- (MCProfileConnection)mcConnection
{
  return self->_mcConnection;
}

- (void)setMcConnection:(id)a3
{
}

- (UIImageView)marketingBannerImage
{
  return self->_marketingBannerImage;
}

- (void)setMarketingBannerImage:(id)a3
{
}

- (UIButton)automationButton
{
  return self->_automationButton;
}

- (void)setAutomationButton:(id)a3
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

- (COSWatchUnpairInstructionsController)unpairInstructions
{
  return self->_unpairInstructions;
}

- (void)setUnpairInstructions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unpairInstructions, 0);
  objc_storeStrong((id *)&self->_fallbackImageName, 0);
  objc_storeStrong((id *)&self->_desiredImageName, 0);
  objc_storeStrong((id *)&self->_automationButton, 0);
  objc_storeStrong((id *)&self->_marketingBannerImage, 0);
  objc_storeStrong((id *)&self->_mcConnection, 0);
  objc_storeStrong((id *)&self->_welcomeTextUpdater, 0);

  objc_destroyWeak((id *)&self->_getStartedDelegate);
}

@end