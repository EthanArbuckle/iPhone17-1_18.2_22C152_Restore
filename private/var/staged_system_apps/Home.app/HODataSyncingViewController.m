@interface HODataSyncingViewController
- (BOOL)iCloudURLIsReachable;
- (HODataSyncingTextView)textView;
- (HUColoredButton)enableButton;
- (NSArray)buttonConstraints;
- (NSArray)resetSectionConstraints;
- (NSArray)textViewConstraints;
- (UIButton)cancelButton;
- (UIButton)internalTestCycleUI;
- (UIButton)resetNukeButton;
- (__SCNetworkReachability)reachability;
- (double)bottomPadding;
- (double)insetSize;
- (id)_bottomPaddingConstraintForLowestView:(id)a3;
- (id)_createButtonWithString:(id)a3;
- (id)_createConstraintForTextView;
- (id)_createConstraintsForButton:(id)a3 includeBottomConstraint:(BOOL)a4;
- (id)_createResetSectionConstraints;
- (id)hu_preloadContent;
- (unint64_t)dataSyncState;
- (void)_createAndAddResetLabelsIfNeeded;
- (void)_enableButtonPressed:(id)a3;
- (void)_enableICloud;
- (void)_internalCyclePressed:(id)a3;
- (void)_quit;
- (void)_removeLowerSectionControlsAndLabels;
- (void)_resetButtonConfirmed;
- (void)_resetButtonPressed:(id)a3;
- (void)setButtonConstraints:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setDataSyncState:(unint64_t)a3;
- (void)setEnableButton:(id)a3;
- (void)setICloudURLIsReachable:(BOOL)a3;
- (void)setInternalTestCycleUI:(id)a3;
- (void)setReachability:(__SCNetworkReachability *)a3;
- (void)setResetNukeButton:(id)a3;
- (void)setResetSectionConstraints:(id)a3;
- (void)setTextView:(id)a3;
- (void)setTextViewConstraints:(id)a3;
- (void)startCDPRepair;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HODataSyncingViewController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)HODataSyncingViewController;
  [(HODataSyncingViewController *)&v12 viewDidLoad];
  [(HODataSyncingViewController *)self setModalInPresentation:1];
  v3 = +[UIColor systemBackgroundColor];
  v4 = [(HODataSyncingViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = objc_alloc_init(HODataSyncingTextView);
  [(HODataSyncingViewController *)self setTextView:v5];

  unint64_t v6 = [(HODataSyncingViewController *)self dataSyncState];
  v7 = [(HODataSyncingViewController *)self textView];
  [v7 setDataSyncState:v6];

  v8 = [(HODataSyncingViewController *)self view];
  v9 = [(HODataSyncingViewController *)self textView];
  [v8 addSubview:v9];

  v10 = [(HODataSyncingViewController *)self _createConstraintForTextView];
  [(HODataSyncingViewController *)self setTextViewConstraints:v10];

  v11 = [(HODataSyncingViewController *)self textViewConstraints];
  +[NSLayoutConstraint activateConstraints:v11];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HODataSyncingViewController;
  [(HODataSyncingViewController *)&v8 viewWillAppear:a3];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    unint64_t v6 = NSStringFromClass(v5);
    LODWORD(buf.version) = 138412290;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: viewWillAppear", (uint8_t *)&buf, 0xCu);
  }
  if (![(HODataSyncingViewController *)self reachability])
  {
    CFAllocatorRef Default = CFAllocatorGetDefault();
    self->_reachability = SCNetworkReachabilityCreateWithName(Default, "www.icloud.com");
    buf.version = 0;
    buf.info = self;
    buf.retain = (const void *(__cdecl *)(const void *))&CFRetain;
    buf.release = (void (__cdecl *)(const void *))&_CFRelease;
    buf.copyDescription = 0;
    SCNetworkReachabilitySetCallback([(HODataSyncingViewController *)self reachability], (SCNetworkReachabilityCallBack)sub_10004CD40, &buf);
    SCNetworkReachabilitySetDispatchQueue([(HODataSyncingViewController *)self reachability], (dispatch_queue_t)&_dispatch_main_q);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HODataSyncingViewController;
  [(HODataSyncingViewController *)&v7 viewWillDisappear:a3];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    unint64_t v6 = NSStringFromClass(v5);
    *(_DWORD *)SCNetworkReachabilityContext buf = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: viewWillDisappear", buf, 0xCu);
  }
  if ([(HODataSyncingViewController *)self reachability]) {
    CFRelease([(HODataSyncingViewController *)self reachability]);
  }
}

- (double)insetSize
{
  v3 = [(HODataSyncingViewController *)self view];
  [v3 frame];
  uint64_t v4 = HUViewSizeSubclassForViewSize();
  v5 = [(HODataSyncingViewController *)self view];
  [v5 bounds];
  +[HOUtilities viewMarginInsetForViewSizeSubclass:v4 withViewWidth:CGRectGetWidth(v9)];
  double v7 = v6;

  return v7;
}

- (double)bottomPadding
{
  v2 = [(HODataSyncingViewController *)self view];
  [v2 frame];
  +[HOUtilities buttonPaddingToViewBottomForViewSizeSubclass:HUViewSizeSubclassForViewSize()];
  double v4 = v3;

  return v4;
}

- (void)setDataSyncState:(unint64_t)a3
{
  if (self->_dataSyncState != a3)
  {
    self->_dataSyncState = a3;
    v5 = [(HODataSyncingViewController *)self textView];
    [v5 setDataSyncState:a3];

    [(HODataSyncingViewController *)self _removeLowerSectionControlsAndLabels];
    switch(a3)
    {
      case 0uLL:
      case 4uLL:
        [(HODataSyncingViewController *)self _createAndAddResetLabelsIfNeeded];
        double v6 = [(HODataSyncingViewController *)self resetSectionConstraints];

        if (!v6)
        {
          double v7 = [(HODataSyncingViewController *)self _createResetSectionConstraints];
          [(HODataSyncingViewController *)self setResetSectionConstraints:v7];
        }
        objc_super v8 = [(HODataSyncingViewController *)self resetSectionConstraints];
        +[NSLayoutConstraint activateConstraints:v8];

        CGRect v9 = [(HODataSyncingViewController *)self resetNukeButton];
        v10 = v9;
        uint64_t v11 = 1;
        goto LABEL_17;
      case 1uLL:
        goto LABEL_19;
      case 2uLL:
      case 6uLL:
        objc_super v12 = sub_10004D5A8(@"HODataSyncingButtonEnableKeychain");
        v13 = [(HODataSyncingViewController *)self _createButtonWithString:v12];
        [(HODataSyncingViewController *)self setEnableButton:v13];

        v14 = [(HODataSyncingViewController *)self view];
        v15 = [(HODataSyncingViewController *)self enableButton];
        [v14 addSubview:v15];

        v16 = [(HODataSyncingViewController *)self enableButton];
        v17 = [(HODataSyncingViewController *)self _createConstraintsForButton:v16 includeBottomConstraint:+[HFUtilities isAMac] ^ 1];
        +[NSLayoutConstraint activateConstraints:v17];

        if (+[HFUtilities isAMac])
        {
          id v18 = objc_alloc_init((Class)UIButton);
          [(HODataSyncingViewController *)self setCancelButton:v18];

          v19 = [(HODataSyncingViewController *)self cancelButton];
          [v19 addTarget:self action:"_quit" forControlEvents:64];

          v20 = [(HODataSyncingViewController *)self cancelButton];
          v21 = sub_10004D5A8(@"HODataSyncingButtonQuit");
          [v20 setTitle:v21 forState:0];

          v22 = [(HODataSyncingViewController *)self cancelButton];
          v23 = +[UIColor labelColor];
          [v22 setTitleColor:v23 forState:0];

          v24 = [(HODataSyncingViewController *)self view];
          v25 = [(HODataSyncingViewController *)self cancelButton];
          [v24 addSubview:v25];

          v26 = [(HODataSyncingViewController *)self cancelButton];
          v27 = [(HODataSyncingViewController *)self _createConstraintsForButton:v26 includeBottomConstraint:1];
          +[NSLayoutConstraint activateConstraints:v27];

          v28 = [(HODataSyncingViewController *)self cancelButton];
          v29 = [v28 topAnchor];
          v30 = [(HODataSyncingViewController *)self enableButton];
          v31 = [v30 bottomAnchor];
          [(HODataSyncingViewController *)self bottomPadding];
          v32 = [v29 constraintEqualToAnchor:v31];
          v45 = v32;
          v33 = +[NSArray arrayWithObjects:&v45 count:1];
          +[NSLayoutConstraint activateConstraints:v33];
        }
        if (a3 == 6) {
          [(HODataSyncingViewController *)self startCDPRepair];
        }
        goto LABEL_19;
      case 3uLL:
        v35 = sub_10004D5A8(@"HODataSyncingButtonEnableiCloud");
        v36 = [(HODataSyncingViewController *)self _createButtonWithString:v35];
        [(HODataSyncingViewController *)self setEnableButton:v36];

        v37 = [(HODataSyncingViewController *)self view];
        v38 = [(HODataSyncingViewController *)self enableButton];
        [v37 addSubview:v38];

        v39 = [(HODataSyncingViewController *)self enableButton];
        v40 = [(HODataSyncingViewController *)self _createConstraintsForButton:v39 includeBottomConstraint:1];
        +[NSLayoutConstraint activateConstraints:v40];

        goto LABEL_19;
      case 5uLL:
        [(HODataSyncingViewController *)self _createAndAddResetLabelsIfNeeded];
        v41 = [(HODataSyncingViewController *)self resetSectionConstraints];

        if (!v41)
        {
          v42 = [(HODataSyncingViewController *)self _createResetSectionConstraints];
          [(HODataSyncingViewController *)self setResetSectionConstraints:v42];
        }
        v43 = [(HODataSyncingViewController *)self resetSectionConstraints];
        +[NSLayoutConstraint activateConstraints:v43];

        CGRect v9 = [(HODataSyncingViewController *)self resetNukeButton];
        v10 = v9;
        uint64_t v11 = 0;
LABEL_17:
        [v9 setHidden:v11];
        goto LABEL_18;
      default:
        v10 = +[NSString stringWithFormat:@"Unhandled dataSyncState %lu", a3];
        v34 = HFLogForCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_100083970((uint64_t)v10, v34);
        }

        NSLog(@"%@", v10);
LABEL_18:

LABEL_19:
        v44 = [(HODataSyncingViewController *)self view];
        [v44 setNeedsLayout];

        break;
    }
  }
}

- (void)_removeLowerSectionControlsAndLabels
{
  double v3 = [(HODataSyncingViewController *)self enableButton];
  [v3 removeFromSuperview];

  id v4 = [(HODataSyncingViewController *)self resetNukeButton];
  [v4 removeFromSuperview];
}

- (id)_createConstraintForTextView
{
  double v3 = [(HODataSyncingViewController *)self textView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = objc_opt_new();
  v5 = [(HODataSyncingViewController *)self textView];
  double v6 = [v5 centerXAnchor];
  double v7 = [(HODataSyncingViewController *)self view];
  objc_super v8 = [v7 centerXAnchor];
  CGRect v9 = [v6 constraintEqualToAnchor:v8];
  [v4 addObject:v9];

  v10 = [(HODataSyncingViewController *)self textView];
  uint64_t v11 = [v10 leadingAnchor];
  objc_super v12 = [(HODataSyncingViewController *)self view];
  v13 = [v12 leadingAnchor];
  [(HODataSyncingViewController *)self insetSize];
  v14 = [v11 constraintGreaterThanOrEqualToAnchor:v13];
  [v4 addObject:v14];

  v15 = [(HODataSyncingViewController *)self textView];
  v16 = [v15 trailingAnchor];
  v17 = [(HODataSyncingViewController *)self view];
  id v18 = [v17 trailingAnchor];
  [(HODataSyncingViewController *)self insetSize];
  v19 = [v16 constraintLessThanOrEqualToAnchor:v18];
  [v4 addObject:v19];

  v20 = [(HODataSyncingViewController *)self textView];
  v21 = [(HODataSyncingViewController *)self view];
  v22 = +[NSLayoutConstraint constraintWithItem:v20 attribute:3 relatedBy:0 toItem:v21 attribute:10 multiplier:0.4 constant:0.0];
  [v4 addObject:v22];

  return v4;
}

- (id)_createButtonWithString:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)HUColoredButton) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v5 setTitle:v4 forState:0];

  double v6 = +[UIColor hf_keyColor];
  [v5 setBackgroundColor:v6];

  [v5 addTarget:self action:"_enableButtonPressed:" forControlEvents:64];

  return v5;
}

- (id)_createConstraintsForButton:(id)a3 includeBottomConstraint:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v7 = objc_opt_new();
  objc_super v8 = [v6 centerXAnchor];
  CGRect v9 = [(HODataSyncingViewController *)self view];
  v10 = [v9 centerXAnchor];
  uint64_t v11 = [v8 constraintEqualToAnchor:v10];
  [v7 addObject:v11];

  objc_super v12 = [v6 widthAnchor];
  v13 = [v12 constraintEqualToConstant:288.0];
  [v7 addObject:v13];

  v14 = [v6 heightAnchor];
  v15 = [v14 constraintEqualToConstant:50.0];
  [v7 addObject:v15];

  if (v4)
  {
    v16 = [(HODataSyncingViewController *)self _bottomPaddingConstraintForLowestView:v6];
    [v7 addObject:v16];
  }

  return v7;
}

- (id)_bottomPaddingConstraintForLowestView:(id)a3
{
  BOOL v4 = [a3 bottomAnchor];
  id v5 = [(HODataSyncingViewController *)self view];
  id v6 = [v5 safeAreaLayoutGuide];
  double v7 = [v6 bottomAnchor];
  [(HODataSyncingViewController *)self bottomPadding];
  CGRect v9 = [v4 constraintEqualToAnchor:v7 constant:-v8];

  return v9;
}

- (id)_createResetSectionConstraints
{
  double v3 = [(HODataSyncingViewController *)self resetNukeButton];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  BOOL v4 = objc_opt_new();
  id v5 = [(HODataSyncingViewController *)self resetNukeButton];
  id v6 = [v5 leadingAnchor];
  double v7 = [(HODataSyncingViewController *)self view];
  double v8 = [v7 leadingAnchor];
  [(HODataSyncingViewController *)self insetSize];
  CGRect v9 = [v6 constraintGreaterThanOrEqualToAnchor:v8 constant:];
  [v4 addObject:v9];

  v10 = [(HODataSyncingViewController *)self resetNukeButton];
  uint64_t v11 = [v10 trailingAnchor];
  objc_super v12 = [(HODataSyncingViewController *)self view];
  v13 = [v12 trailingAnchor];
  [(HODataSyncingViewController *)self insetSize];
  v14 = [v11 constraintLessThanOrEqualToAnchor:v13];
  [v4 addObject:v14];

  v15 = [(HODataSyncingViewController *)self resetNukeButton];
  v16 = [v15 centerXAnchor];
  v17 = [(HODataSyncingViewController *)self view];
  id v18 = [v17 centerXAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  [v4 addObject:v19];

  v20 = [(HODataSyncingViewController *)self resetNukeButton];
  v21 = [(HODataSyncingViewController *)self _bottomPaddingConstraintForLowestView:v20];
  [v4 addObject:v21];

  return v4;
}

- (void)_createAndAddResetLabelsIfNeeded
{
  double v3 = [(HODataSyncingViewController *)self resetNukeButton];

  if (!v3)
  {
    BOOL v4 = +[UIButton buttonWithType:1];
    [(HODataSyncingViewController *)self setResetNukeButton:v4];

    id v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
    id v6 = [(HODataSyncingViewController *)self resetNukeButton];
    double v7 = [v6 titleLabel];
    [v7 setFont:v5];

    double v8 = [(HODataSyncingViewController *)self resetNukeButton];
    CGRect v9 = sub_10004D5A8(@"HODataSyncingButtonReset");
    [v8 setTitle:v9 forState:0];

    v10 = [(HODataSyncingViewController *)self resetNukeButton];
    uint64_t v11 = [v10 titleLabel];
    [v11 setNumberOfLines:1];

    objc_super v12 = [(HODataSyncingViewController *)self resetNukeButton];
    v13 = [v12 titleLabel];
    [v13 setTextAlignment:1];

    v14 = [(HODataSyncingViewController *)self resetNukeButton];
    [v14 addTarget:self action:"_resetButtonPressed:" forControlEvents:64];
  }
  id v16 = [(HODataSyncingViewController *)self view];
  v15 = [(HODataSyncingViewController *)self resetNukeButton];
  [v16 addSubview:v15];
}

- (void)_enableButtonPressed:(id)a3
{
  unint64_t v4 = [(HODataSyncingViewController *)self dataSyncState];
  switch(v4)
  {
    case 2uLL:
      if (+[HFUtilities isAMac]) {
        +[NSURL hf_openiCloudPreferencesURL];
      }
      else {
      id v7 = +[NSURL hf_openiCloudKeychainPreferences];
      }
      id v5 = +[HFOpenURLRouter sharedInstance];
      id v6 = [v5 openURL:v7];

      break;
    case 6uLL:
      [(HODataSyncingViewController *)self startCDPRepair];
      break;
    case 3uLL:
      [(HODataSyncingViewController *)self _enableICloud];
      break;
  }
}

- (void)_enableICloud
{
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  id v3 = [v2 homeManager];

  [v3 updateiCloudSwitchState:1 completionHandler:&stru_1000C4188];
}

- (void)_quit
{
}

- (void)_resetButtonPressed:(id)a3
{
  unsigned __int8 v4 = [(HODataSyncingViewController *)self iCloudURLIsReachable];
  id v5 = sub_10004D5A8(@"HODataSyncingAlertTitle");
  if (v4)
  {
    id v6 = sub_10004D5A8(@"HODataSyncingResetWithiCloud");
    id v7 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];

    double v8 = sub_10004D5A8(@"HODataSyncingButtonResetConfirmation");
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10004E584;
    v16[3] = &unk_1000C23E8;
    v16[4] = self;
    CGRect v9 = +[UIAlertAction actionWithTitle:v8 style:2 handler:v16];
    [v7 addAction:v9];

    v10 = sub_10004D5A8(@"HODataSyncingButtonAlertCancel");
    uint64_t v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];
    [v7 addAction:v11];

    [(HODataSyncingViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    objc_super v12 = sub_10004D5A8(@"HODataSyncingResetBodyNetworkFailure");
    id v15 = +[UIAlertController alertControllerWithTitle:v5 message:v12 preferredStyle:1];

    v13 = sub_10004D5A8(@"HODataSyncingAlertOKButton");
    v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:0];
    [v15 addAction:v14];

    [(HODataSyncingViewController *)self presentViewController:v15 animated:1 completion:0];
  }
}

- (void)_resetButtonConfirmed
{
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  unsigned __int8 v4 = [v3 homeManager];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004E634;
  v5[3] = &unk_1000C1F30;
  v5[4] = self;
  [v4 eraseHomeDataWithCompletionHandler:v5];
}

- (void)startCDPRepair
{
  id v3 = +[CDPAccount sharedInstance];
  unsigned __int8 v4 = [v3 primaryAccountAltDSID];

  id v5 = [objc_alloc((Class)CDPUIDeviceToDeviceEncryptionFlowContext) initWithAltDSID:v4];
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 infoDictionary];
  double v8 = [v7 objectForKeyedSubscript:@"CFBundleDisplayName"];
  [v5 setFeatureName:v8];

  [v5 setDeviceToDeviceEncryptionUpgradeUIStyle:0];
  [v5 setDeviceToDeviceEncryptionUpgradeType:0];
  [v5 setPresentingViewController:self];
  [v5 setSecurityUpgradeContext:AKSecurityUpgradeContextGeneric];
  id v9 = [objc_alloc((Class)CDPUIDeviceToDeviceEncryptionHelper) initWithContext:v5];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004E8EC;
  v11[3] = &unk_1000C41D0;
  id v12 = v4;
  v13 = self;
  id v10 = v4;
  [v9 performDeviceToDeviceEncryptionStateRepairWithCompletion:v11];
}

- (void)_internalCyclePressed:(id)a3
{
  if ([(HODataSyncingViewController *)self dataSyncState] > 4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = (uint64_t)[(HODataSyncingViewController *)self dataSyncState] + 1;
  }

  [(HODataSyncingViewController *)self setDataSyncState:v4];
}

- (id)hu_preloadContent
{
  return +[NAFuture futureWithNoResult];
}

- (unint64_t)dataSyncState
{
  return self->_dataSyncState;
}

- (HODataSyncingTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (BOOL)iCloudURLIsReachable
{
  return self->_iCloudURLIsReachable;
}

- (void)setICloudURLIsReachable:(BOOL)a3
{
  self->_iCloudURLIsReachable = a3;
}

- (__SCNetworkReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(__SCNetworkReachability *)a3
{
  self->_reachability = a3;
}

- (UIButton)resetNukeButton
{
  return self->_resetNukeButton;
}

- (void)setResetNukeButton:(id)a3
{
}

- (HUColoredButton)enableButton
{
  return self->_enableButton;
}

- (void)setEnableButton:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIButton)internalTestCycleUI
{
  return self->_internalTestCycleUI;
}

- (void)setInternalTestCycleUI:(id)a3
{
}

- (NSArray)textViewConstraints
{
  return self->_textViewConstraints;
}

- (void)setTextViewConstraints:(id)a3
{
}

- (NSArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
}

- (NSArray)resetSectionConstraints
{
  return self->_resetSectionConstraints;
}

- (void)setResetSectionConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetSectionConstraints, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_textViewConstraints, 0);
  objc_storeStrong((id *)&self->_internalTestCycleUI, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_enableButton, 0);
  objc_storeStrong((id *)&self->_resetNukeButton, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end