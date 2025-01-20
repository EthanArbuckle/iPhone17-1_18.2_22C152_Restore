@interface COSWristSelectionViewController
+ (BOOL)controllerNeedsToRun;
+ (void)_madeWristSelectionForLeftWrist:(BOOL)a3;
+ (void)resumePairingWithSavedValue:(id)a3;
- (BOOL)requiresActivationCheck;
- (BOOL)wantsDefaultImageResource;
- (COSHorizontalCheckmarkChoiceView)choiceView;
- (COSWristSelectionViewController)init;
- (id)detailString;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)_madeWristSelectionForLeftWrist:(BOOL)a3;
- (void)setChoiceView:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation COSWristSelectionViewController

- (COSWristSelectionViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSWristSelectionViewController;
  v2 = [(COSOptinViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSWristSelectionViewController *)v2 setStyle:66];
  }
  return v3;
}

+ (BOOL)controllerNeedsToRun
{
  v3 = [UIApp setupController];
  v4 = [v3 resumePairingController];
  LOBYTE(a1) = [v4 didRestoreValueForPaneClass:a1];

  return a1 ^ 1;
}

+ (void)resumePairingWithSavedValue:(id)a3
{
  id v4 = [a3 BOOLValue];

  [a1 _madeWristSelectionForLeftWrist:v4];
}

- (BOOL)requiresActivationCheck
{
  return 0;
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)COSWristSelectionViewController;
  [(COSWristSelectionViewController *)&v31 viewDidLoad];
  v3 = [COSHorizontalCheckmarkChoiceView alloc];
  id v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 localizedStringForKey:@"LEFT_WRIST" value:&stru_100249230 table:@"Localizable"];
  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"RIGHT_WRIST" value:&stru_100249230 table:@"Localizable"];
  v8 = [(COSHorizontalCheckmarkChoiceView *)v3 initWithLeftTitle:v5 rightTitle:v7];
  choiceView = self->_choiceView;
  self->_choiceView = v8;

  [(COSHorizontalCheckmarkChoiceView *)self->_choiceView setDelegate:self];
  v10 = [(COSWristSelectionViewController *)self contentView];
  [v10 addSubview:self->_choiceView];

  [(COSHorizontalCheckmarkChoiceView *)self->_choiceView setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = [(COSWristSelectionViewController *)self watchViewBottomConstraint];
  [v11 setActive:0];

  v12 = [(COSWristSelectionViewController *)self watchView];

  if (v12)
  {
    v13 = [(COSHorizontalCheckmarkChoiceView *)self->_choiceView topAnchor];
    v14 = [(COSWristSelectionViewController *)self watchView];
LABEL_5:
    v16 = v14;
    v17 = [v14 bottomAnchor];
    v18 = [v13 constraintEqualToAnchor:v17 constant:8.0];
    [v18 setActive:1];

    goto LABEL_6;
  }
  v15 = [(COSWristSelectionViewController *)self illustratedWatchView];

  if (v15)
  {
    v13 = [(COSHorizontalCheckmarkChoiceView *)self->_choiceView topAnchor];
    v14 = [(COSWristSelectionViewController *)self illustratedWatchView];
    goto LABEL_5;
  }
LABEL_6:
  v19 = [(COSHorizontalCheckmarkChoiceView *)self->_choiceView leadingAnchor];
  v20 = [(COSWristSelectionViewController *)self contentView];
  v21 = [v20 leadingAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  v23 = [(COSHorizontalCheckmarkChoiceView *)self->_choiceView trailingAnchor];
  v24 = [(COSWristSelectionViewController *)self contentView];
  v25 = [v24 trailingAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  v27 = [(COSHorizontalCheckmarkChoiceView *)self->_choiceView bottomAnchor];
  v28 = [(COSWristSelectionViewController *)self contentView];
  v29 = [v28 bottomAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  [(COSHorizontalCheckmarkChoiceView *)self->_choiceView setSelectedChoice:1];
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"WRIST_CHOICE_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  v2 = [UIApp bridgeController];
  unsigned int v3 = [v2 isTinkerPairing];

  id v4 = +[NSBundle mainBundle];
  objc_super v5 = v4;
  if (v3)
  {
    CFStringRef v6 = @"WRIST_CHOICE_TINKER";
    CFStringRef v7 = @"Localizable-tinker";
  }
  else
  {
    CFStringRef v6 = @"WRIST_CHOICE";
    CFStringRef v7 = @"Localizable";
  }
  v8 = [v4 localizedStringForKey:v6 value:&stru_100249230 table:v7];

  return v8;
}

- (BOOL)wantsDefaultImageResource
{
  return 0;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"CONTINUE_BUTTON_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
  id v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[COSWristSelectionViewController suggestedButtonPressed:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  unint64_t v5 = [(COSHorizontalCheckmarkChoiceView *)self->_choiceView selectedChoice];
  if (v5 == 2)
  {
    [(COSWristSelectionViewController *)self _madeWristSelectionForLeftWrist:0];
    CFStringRef v7 = [(COSWristSelectionViewController *)self delegate];
    [v7 buddyControllerDone:self nextControllerClass:objc_opt_class()];
  }
  else if (v5 == 1)
  {
    [(COSWristSelectionViewController *)self _madeWristSelectionForLeftWrist:1];
    +[COSCrownOrientationChoiceViewController sendCrownOnRightChoiceToWatch:1];
    if (PBLogPerformanceMetrics())
    {
      CFStringRef v6 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      [v6 beginMacroActivity:@"COSPostWristChoiceUserWaitPhase" beginTime:CFAbsoluteTimeGetCurrent()];
    }
    CFStringRef v7 = [(COSWristSelectionViewController *)self delegate];
    [v7 buddyControllerDone:self];
  }
  else
  {
    CFStringRef v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Attempted to continue past wrist selection but no choice was found!", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)_madeWristSelectionForLeftWrist:(BOOL)a3
{
  BOOL v3 = a3;
  [(id)objc_opt_class() _madeWristSelectionForLeftWrist:a3];
  id v6 = [(COSWristSelectionViewController *)self delegate];
  unint64_t v5 = [v6 resumePairingController];
  [v5 saveBoolValue:v3 forPaneClass:objc_opt_class()];
}

+ (void)_madeWristSelectionForLeftWrist:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v5 = +[NSNumber numberWithBool:v3];
    int v17 = 138412290;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Set Wrist Choice: Left: %@", (uint8_t *)&v17, 0xCu);
  }
  id v6 = [UIApp setupController];
  [v6 setWristChoicesDetected:1];

  CFStringRef v7 = [UIApp setupController];
  int v8 = [v7 pairingReportManager];

  v9 = +[NSNumber numberWithBool:v3];
  [v8 addPairingTimeEventToPairingReportPlist:10 withValue:v9 withError:0];

  [v8 addPairingTimeEventToPairingReportPlist:11 withValue:&__kCFBooleanFalse withError:0];
  if (sub_100032540())
  {
    v10 = +[COSInternalUserStudyDataManager sharedManager];
    [v10 setWristChoice:v3 ^ 1];
  }
  else
  {
    v11 = +[UIApplication sharedApplication];
    v10 = [v11 activeWatch];

    v12 = [v10 valueForProperty:NRDevicePropertyPairingID];
    v13 = [v10 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
    id v14 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nano" pairingID:v12 pairingDataStore:v13];
    [v14 setBool:v3 ^ 1 forKey:@"wornOnRightArm"];
    id v15 = [v14 synchronize];
    if (v3) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 2;
    }
    +[PBBridgeCAReporter recordPairingInitiatedDeviceWristChoice:v16 pairingSelectionType:1];
  }
}

- (COSHorizontalCheckmarkChoiceView)choiceView
{
  return self->_choiceView;
}

- (void)setChoiceView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end