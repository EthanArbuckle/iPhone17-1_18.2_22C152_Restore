@interface CHASActivitySetupMetricsCollectionViewController
- (BOOL)holdBeforeDisplaying;
- (BOOL)showPregnancy;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BPSBuddyControllerDelegate)delegate;
- (CHASActivitySetupMetricsCollectionViewController)init;
- (CHASActivitySetupMetricsCollectionViewController)initWithPresentationContext:(int64_t)a3;
- (CHASActivitySetupMetricsCollectionViewController)initWithPresentationContext:(int64_t)a3 pregnancyStateProvider:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_footerString;
- (id)_makeFooterView;
- (id)_titleForConfirmButton;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tapToRadarMetadata;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)presentationContext;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancel;
- (void)_contentSizeDidChange;
- (void)_determinePresentationContextIfNeededWithHealthStore:(id)a3;
- (void)_done;
- (void)_endEditingAndDiscardChanges:(BOOL)a3;
- (void)_requestWheelchairDiagnosticsSubmissionIfNecessary;
- (void)_startEdit;
- (void)didTapEditPregnancy;
- (void)setDelegate:(id)a3;
- (void)shouldReloadPregnancySection;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tappedConfirm:(id)a3;
- (void)viewDidLoad;
- (void)wheelchairUseSwitchDidChangeTo:(BOOL)a3;
@end

@implementation CHASActivitySetupMetricsCollectionViewController

- (CHASActivitySetupMetricsCollectionViewController)init
{
  return [(CHASActivitySetupMetricsCollectionViewController *)self initWithPresentationContext:0];
}

- (CHASActivitySetupMetricsCollectionViewController)initWithPresentationContext:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHASActivitySetupMetricsCollectionViewController;
  result = [(CHASActivitySetupMetricsCollectionViewController *)&v5 initWithTitle:&stru_1008D8AB8 detailText:0 icon:0 adoptTableViewScrollView:1];
  if (result) {
    result->_presentationContext = a3;
  }
  return result;
}

- (CHASActivitySetupMetricsCollectionViewController)initWithPresentationContext:(int64_t)a3 pregnancyStateProvider:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CHASActivitySetupMetricsCollectionViewController;
  v8 = [(CHASActivitySetupMetricsCollectionViewController *)&v11 initWithTitle:&stru_1008D8AB8 detailText:0 icon:0 adoptTableViewScrollView:1];
  v9 = v8;
  if (v8)
  {
    v8->_presentationContext = a3;
    objc_storeStrong((id *)&v8->_pregnancyStateProvider, a4);
  }

  return v9;
}

- (BOOL)showPregnancy
{
  v3 = +[_HKBehavior sharedBehavior];
  v4 = [v3 features];
  unsigned int v5 = [v4 seahorse];

  return v5 && self->_presentationContext != 0;
}

- (void)viewDidLoad
{
  v34.receiver = self;
  v34.super_class = (Class)CHASActivitySetupMetricsCollectionViewController;
  [(CHASActivitySetupMetricsCollectionViewController *)&v34 viewDidLoad];
  v3 = [(CHASActivitySetupMetricsCollectionViewController *)self delegate];
  if (v3)
  {
    v4 = [(CHASActivitySetupMetricsCollectionViewController *)self delegate];
    unsigned int v5 = [v4 activePairingDevice];
  }
  else
  {
    unsigned int v5 = FIGetActivePairedDevice();
  }

  v6 = FIUIHealthStoreForDevice();
  id v7 = [objc_alloc((Class)FIActivitySettingsController) initWithHealthStore:v6];
  [v7 populateExistingCharacteristics];
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E5E86144-6C47-4545-8F52-A5D468C1DA85"];
  unsigned __int8 v9 = [v5 supportsCapability:v8];
  if ((v9 & 1) != 0 || [v7 wheelchairUse] != (id)2)
  {
    p_showWheelchair = &self->_showWheelchair;
    self->_showWheelchair = v9;
  }
  else
  {
    v10 = +[_HKBehavior sharedBehavior];
    p_showWheelchair = &self->_showWheelchair;
    self->_showWheelchair = [v10 isStandalonePhoneFitnessMode];
  }
  if (!self->_pregnancyStateProvider)
  {
    v12 = (FIUIPregnancyStateProvider *)[objc_alloc((Class)FIUIPregnancyStateProvider) initWithHealthStore:v6];
    pregnancyStateProvider = self->_pregnancyStateProvider;
    self->_pregnancyStateProvider = v12;
  }
  v14 = [objc_alloc((Class)FIUIHealthSettingsDataSource) initWithActivitySettingsController:v7 showWheelchair:*p_showWheelchair pregnancyStateProvider:self->_pregnancyStateProvider showPregnancy:-[CHASActivitySetupMetricsCollectionViewController showPregnancy](self, "showPregnancy")];
  healthSettingsDataSource = self->_healthSettingsDataSource;
  self->_healthSettingsDataSource = v14;

  [(FIUIHealthSettingsDataSource *)self->_healthSettingsDataSource setDelegate:self];
  [(CHASActivitySetupMetricsCollectionViewController *)self _determinePresentationContextIfNeededWithHealthStore:v6];
  v16 = [(CHASActivitySetupMetricsCollectionViewController *)self navigationController];
  self->_isNavigationBarHidden = [v16 isNavigationBarHidden];

  v17 = [(CHASActivitySetupMetricsCollectionViewController *)self headerView];
  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"SET_UP_ACTIVITY" value:&stru_1008D8AB8 table:@"ActivitySetup"];
  [v17 setTitle:v19];

  v20 = [(CHASActivitySetupMetricsCollectionViewController *)self headerView];
  v21 = +[NSBundle bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"SET_UP_ACTIVITY_DETAIL" value:&stru_1008D8AB8 table:@"ActivitySetup"];
  [v20 setDetailText:v22];

  v23 = +[OBBoldTrayButton boldButton];
  v24 = [(CHASActivitySetupMetricsCollectionViewController *)self _titleForConfirmButton];
  [v23 addTarget:self action:"tappedConfirm:" forControlEvents:64];
  [v23 setTitle:v24 forState:0];
  v25 = BPSPillSelectedColor();
  [v23 setTintColor:v25];

  [v23 setAccessibilityIdentifier:@"Fitness.ActivitySetupMetrics.ConfirmButton"];
  v26 = [(CHASActivitySetupMetricsCollectionViewController *)self buttonTray];
  [v26 addButton:v23];

  v27 = -[CHASActivitySetupContentSizedTableView initWithFrame:style:]([CHASActivitySetupContentSizedTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(CHASActivitySetupContentSizedTableView *)v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CHASActivitySetupContentSizedTableView *)v27 setDelegate:self];
  [(CHASActivitySetupContentSizedTableView *)v27 setDataSource:self];
  v28 = BPSSeparatorColor();
  [(CHASActivitySetupContentSizedTableView *)v27 setSeparatorColor:v28];

  v29 = +[ARUIMetricColors keyColors];
  v30 = [v29 nonGradientTextColor];
  [(CHASActivitySetupContentSizedTableView *)v27 _setAccessoryBaseColor:v30];

  [(CHASActivitySetupMetricsCollectionViewController *)self setShouldAdjustButtonTrayForKeyboard:1];
  v31 = [(CHASActivitySetupMetricsCollectionViewController *)self _makeFooterView];
  footerView = self->_footerView;
  self->_footerView = v31;

  [(CHASActivitySetupMetricsCollectionViewController *)self setTableView:v27];
  v33 = +[NSNotificationCenter defaultCenter];
  [v33 addObserver:self selector:"_contentSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (id)_titleForConfirmButton
{
  unint64_t presentationContext = self->_presentationContext;
  if (presentationContext < 6)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v5 = v4;
    CFStringRef v6 = @"SET_UP_CONTINUE";
LABEL_3:
    v2 = [v4 localizedStringForKey:v6 value:&stru_1008D8AB8 table:@"ActivitySetup"];

    goto LABEL_4;
  }
  if (presentationContext == 6)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v5 = v4;
    CFStringRef v6 = @"SET_UP_DONE";
    goto LABEL_3;
  }
LABEL_4:

  return v2;
}

- (void)tappedConfirm:(id)a3
{
  id v4 = a3;
  if (self->_isNavigationBarHidden)
  {
    unsigned int v5 = [(CHASActivitySetupMetricsCollectionViewController *)self navigationController];
    [v5 setNavigationBarHidden:1 animated:0];
  }
  CFStringRef v6 = [(FIUIHealthSettingsDataSource *)self->_healthSettingsDataSource editedSettingsController];
  [v6 commmitWithError:0];

  switch(self->_presentationContext)
  {
    case 0:
      _HKInitializeLogging();
      id v7 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_FAULT)) {
        sub_10071C7E0(&self->_presentationContext, v7);
      }
      goto LABEL_6;
    case 1:
      goto LABEL_9;
    case 2:
      _HKInitializeLogging();
      unsigned __int8 v9 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_FAULT)) {
        sub_10071C7E0(&self->_presentationContext, v9);
      }
LABEL_9:
      id v8 = CHASActivitySetupViewController;
      goto LABEL_11;
    case 3:
LABEL_6:
      id v8 = CHASActivitySetupOnboardingViewController;
      goto LABEL_11;
    case 4:
      id v8 = CHASActivitySetupThreeRingsOnboardingViewController;
LABEL_11:
      id v10 = [[v8 alloc] initWithPresentationContext:self->_presentationContext];
      objc_super v11 = [(CHASActivitySetupMetricsCollectionViewController *)self delegate];
      [v10 setDelegate:v11];

      v12 = [(CHASActivitySetupMetricsCollectionViewController *)self navigationController];
      [v12 pushViewController:v10 animated:1];

      goto LABEL_12;
    case 5:
      id v10 = [(CHASActivitySetupMetricsCollectionViewController *)self delegate];
      [v10 buddyControllerDone:self];
LABEL_12:

      break;
    case 6:
      [(CHASActivitySetupMetricsCollectionViewController *)self dismissViewControllerAnimated:1 completion:0];
      break;
    default:
      break;
  }
}

- (id)_makeFooterView
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  id v8 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  unsigned __int8 v9 = [(CHASActivitySetupMetricsCollectionViewController *)self _footerString];
  [v8 setText:v9];

  id v10 = +[UIColor secondaryLabelColor];
  [v8 setTextColor:v10];

  objc_super v11 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  [v8 setFont:v11];

  [v8 setLineBreakMode:0];
  [v8 setNumberOfLines:0];
  [v7 addSubview:v8];
  v25 = [v8 topAnchor];
  v24 = [v7 topAnchor];
  v23 = [v25 constraintEqualToAnchor:v24 constant:10.0];
  v26[0] = v23;
  v22 = [v8 leadingAnchor];
  v21 = [v7 leadingAnchor];
  v12 = [v22 constraintEqualToAnchor:v21];
  v26[1] = v12;
  v13 = [v8 trailingAnchor];
  v14 = [v7 trailingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v26[2] = v15;
  v16 = [v8 bottomAnchor];
  v17 = [v7 bottomAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:-10.0];
  v26[3] = v18;
  v19 = +[NSArray arrayWithObjects:v26 count:4];
  +[NSLayoutConstraint activateConstraints:v19];

  return v7;
}

- (id)_footerString
{
  v2 = [(CHASActivitySetupMetricsCollectionViewController *)self delegate];
  id v3 = [v2 activePairingDevice];

  id v4 = +[_HKBehavior sharedBehavior];
  id v5 = [v4 fitnessMode];
  CFStringRef v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = v6;
  if (v3) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v5 == (id)2;
  }
  if (v8) {
    CFStringRef v9 = @"ABOUT_WHEELCHAIR_USE_FOOTER_STANDALONE";
  }
  else {
    CFStringRef v9 = @"ABOUT_WHEELCHAIR_USE_FOOTER";
  }
  id v10 = [v6 localizedStringForKey:v9 value:&stru_1008D8AB8 table:@"ActivitySetup"];

  return v10;
}

- (void)_contentSizeDidChange
{
  self->_footerView = [(CHASActivitySetupMetricsCollectionViewController *)self _makeFooterView];

  _objc_release_x1();
}

- (void)_determinePresentationContextIfNeededWithHealthStore:(id)a3
{
  id v4 = a3;
  if (!self->_presentationContext)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v6, &location);
    id v5 = v4;
    FIUIUserHasExistingMoveGoal();

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (BOOL)holdBeforeDisplaying
{
  id v3 = [(CHASActivitySetupMetricsCollectionViewController *)self delegate];
  id v4 = [v3 setupFlowUserInfo];

  id v5 = [v4 objectForKeyedSubscript:BPSPairingFlowIsTinkerPairing];
  unsigned int v6 = [v5 BOOLValue];

  id v7 = [v4 objectForKeyedSubscript:BPSPairingFlowIsTinkerHealthSharingEnabled];
  unsigned int v8 = [v7 BOOLValue];

  _HKInitializeLogging();
  CFStringRef v9 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    unsigned int v14 = v6;
    __int16 v15 = 1024;
    unsigned int v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CHASActivitySetupMetricsCollectionViewController - controllerNeedsToRun: isTinkerPairing %d isTinkerHealthSharingEnabled %d", buf, 0xEu);
  }
  char v10 = v6 ^ 1 | v8;
  if ((v10 & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001210B0;
    block[3] = &unk_1008ABA78;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

  return v10 ^ 1;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_showWheelchair && (char *)[v6 numberOfSections] - 1 == (unsigned char *)a4)
  {
    unsigned int v8 = [(CHASActivitySetupMetricsCollectionViewController *)self tableView];
    [v8 frame];
    double v10 = v9;
    objc_super v11 = [(CHASActivitySetupMetricsCollectionViewController *)self tableView];
    [v11 directionalLayoutMargins];
    double v13 = v10 - v12;
    unsigned int v14 = [(CHASActivitySetupMetricsCollectionViewController *)self tableView];
    [v14 directionalLayoutMargins];
    double v16 = v13 - v15;

    LODWORD(v17) = 1148846080;
    LODWORD(v18) = 1112014848;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_footerView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v16, 1.79769313e308, v17, v18);
    double v20 = v19;
  }
  else
  {
    double v20 = UITableViewAutomaticDimension;
  }

  return v20;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if (self->_showWheelchair
    && [(FIUIHealthSettingsDataSource *)self->_healthSettingsDataSource wheelchairSectionIndex] == (id)a4)
  {
    id v7 = self->_footerView;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return [(FIUIHealthSettingsDataSource *)self->_healthSettingsDataSource shouldHighlightRowAtIndexPath:a4];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  [v11 deselectRowAtIndexPath:v6 animated:1];
  if ([(FIUIHealthSettingsDataSource *)self->_healthSettingsDataSource shouldBypassFirstResponderAction:v6])
  {
    [(CHASActivitySetupMetricsCollectionViewController *)self didTapEditPregnancy];
  }
  else
  {
    id v7 = [v11 cellForRowAtIndexPath:v6];
    unsigned int v8 = [(CHASActivitySetupMetricsCollectionViewController *)self view];
    [v8 endEditing:1];

    p_selectedCell = &self->_selectedCell;
    selectedCell = self->_selectedCell;
    if (v7 == selectedCell)
    {
      *p_selectedCell = 0;

      [(CHASActivitySetupMetricsCollectionViewController *)self _endEditingAndDiscardChanges:0];
    }
    else
    {
      if (selectedCell)
      {
        [(UITableViewCell *)selectedCell resignFirstResponder];
        [(FIUIHealthSettingsDataSource *)self->_healthSettingsDataSource cellDidResignFirstResponder:*p_selectedCell];
      }
      else
      {
        [(CHASActivitySetupMetricsCollectionViewController *)self _startEdit];
      }
      [(UITableViewCell *)v7 becomeFirstResponder];
      [(FIUIHealthSettingsDataSource *)self->_healthSettingsDataSource cellDidBecomeFirstResponder:v7];
      objc_storeStrong((id *)&self->_selectedCell, v7);
    }
  }
}

- (void)_cancel
{
}

- (void)_done
{
}

- (void)_startEdit
{
  if (self->_isNavigationBarHidden)
  {
    id v3 = [(CHASActivitySetupMetricsCollectionViewController *)self navigationController];
    [v3 setNavigationBarHidden:0 animated:0];
  }
  id v4 = objc_alloc((Class)UIBarButtonItem);
  id v5 = FIUIBundle();
  id v6 = [v5 localizedStringForKey:@"DONE_BUTTON" value:&stru_1008D8AB8 table:@"Localizable"];
  id v13 = [v4 initWithTitle:v6 style:2 target:self action:"_done"];

  id v7 = [(CHASActivitySetupMetricsCollectionViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v13];

  id v8 = objc_alloc((Class)UIBarButtonItem);
  double v9 = FIUIBundle();
  double v10 = [v9 localizedStringForKey:@"CANCEL_BUTTON" value:&stru_1008D8AB8 table:@"Localizable"];
  id v11 = [v8 initWithTitle:v10 style:0 target:self action:"_cancel"];

  double v12 = [(CHASActivitySetupMetricsCollectionViewController *)self navigationItem];
  [v12 setLeftBarButtonItem:v11];

  [(FIUIHealthSettingsDataSource *)self->_healthSettingsDataSource startEditing];
}

- (void)_endEditingAndDiscardChanges:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_isNavigationBarHidden)
  {
    id v5 = [(CHASActivitySetupMetricsCollectionViewController *)self navigationController];
    [v5 setNavigationBarHidden:1 animated:0];
  }
  selectedCell = self->_selectedCell;
  self->_selectedCell = 0;

  id v7 = [(CHASActivitySetupMetricsCollectionViewController *)self view];
  [v7 endEditing:1];

  id v8 = [(CHASActivitySetupMetricsCollectionViewController *)self navigationItem];
  [v8 setRightBarButtonItem:0];

  double v9 = [(CHASActivitySetupMetricsCollectionViewController *)self navigationItem];
  [v9 setLeftBarButtonItem:0];

  healthSettingsDataSource = self->_healthSettingsDataSource;

  [(FIUIHealthSettingsDataSource *)healthSettingsDataSource endEditingAndDiscardChanges:v3];
}

- (void)_requestWheelchairDiagnosticsSubmissionIfNecessary
{
  BOOL v3 = +[MCProfileConnection sharedConnection];
  unsigned int v4 = [v3 isDiagnosticSubmissionAllowed];

  if (v4)
  {
    id v5 = +[MCProfileConnection sharedConnection];
    unsigned __int8 v6 = [v5 hasWheelchairDataSubmissionAllowedBeenSet];

    if ((v6 & 1) == 0)
    {
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      id v8 = [v7 localizedStringForKey:@"FEEDBACK_WHEELCHAIR_TITLE" value:&stru_1008D8AB8 table:@"ActivitySetup"];
      double v9 = +[NSBundle bundleForClass:objc_opt_class()];
      double v10 = [v9 localizedStringForKey:@"FEEDBACK_WHEELCHAIR_DESCRIPTION" value:&stru_1008D8AB8 table:@"ActivitySetup"];
      id v11 = +[UIAlertController alertControllerWithTitle:v8 message:v10 preferredStyle:1];

      double v12 = +[NSBundle bundleForClass:objc_opt_class()];
      id v13 = [v12 localizedStringForKey:@"FEEDBACK_WHEELCHAIR_ALLOW" value:&stru_1008D8AB8 table:@"ActivitySetup"];
      unsigned int v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:&stru_1008ACB08];
      [v11 addAction:v14];

      double v15 = +[NSBundle bundleForClass:objc_opt_class()];
      double v16 = [v15 localizedStringForKey:@"FEEDBACK_WHEELCHAIR_MORE_INFO" value:&stru_1008D8AB8 table:@"ActivitySetup"];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1001219E8;
      v21[3] = &unk_1008ACB30;
      v21[4] = self;
      double v17 = +[UIAlertAction actionWithTitle:v16 style:0 handler:v21];
      [v11 addAction:v17];

      double v18 = +[NSBundle bundleForClass:objc_opt_class()];
      double v19 = [v18 localizedStringForKey:@"FEEDBACK_WHEELCHAIR_DENY" value:&stru_1008D8AB8 table:@"ActivitySetup"];
      double v20 = +[UIAlertAction actionWithTitle:v19 style:0 handler:&stru_1008ACB50];
      [v11 addAction:v20];

      [(CHASActivitySetupMetricsCollectionViewController *)self presentViewController:v11 animated:1 completion:0];
    }
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)[(FIUIHealthSettingsDataSource *)self->_healthSettingsDataSource numberOfSectionsInTableView:a3];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)[(FIUIHealthSettingsDataSource *)self->_healthSettingsDataSource tableView:a3 numberOfRowsInSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  unsigned int v4 = [(FIUIHealthSettingsDataSource *)self->_healthSettingsDataSource tableView:a3 cellForRowAtIndexPath:a4];
  id v5 = [v4 textLabel];
  unsigned __int8 v6 = BPSTextColor();
  [v5 setTextColor:v6];

  id v7 = BPSForegroundColor();
  [v4 setBackgroundColor:v7];

  id v8 = [v4 accessoryView];
  double v9 = BPSAccessoryColor();
  [v8 setTintColor:v9];

  id v10 = objc_alloc_init((Class)UIView);
  id v11 = BPSCellHightlightColor();
  [v10 setBackgroundColor:v11];

  [v4 setSelectedBackgroundView:v10];

  return v4;
}

- (void)wheelchairUseSwitchDidChangeTo:(BOOL)a3
{
  if (a3) {
    [(CHASActivitySetupMetricsCollectionViewController *)self _requestWheelchairDiagnosticsSubmissionIfNecessary];
  }
}

- (void)didTapEditPregnancy
{
  id v3 = +[UIApplication sharedApplication];
  v2 = +[NSURL URLWithString:@"x-apple-health://MenstrualCyclesAppPlugin.healthplugin/openPregnancyOnboarding"];
  [v3 openURL:v2 options:&__NSDictionary0__struct completionHandler:&stru_1008ACB70];
}

- (void)shouldReloadPregnancySection
{
  [(FIUIHealthSettingsDataSource *)self->_healthSettingsDataSource pregnancySectionIndexPath];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100121EF4;
  v4[3] = &unk_1008ABB38;
  v4[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (id)tapToRadarMetadata
{
  id v2 = [objc_alloc((Class)BPSTTRMetadata) initWithComponent:2];

  return v2;
}

- (BPSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BPSBuddyControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)presentationContext
{
  return self->_presentationContext;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pregnancyStateProvider, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_selectedCell, 0);

  objc_storeStrong((id *)&self->_healthSettingsDataSource, 0);
}

@end