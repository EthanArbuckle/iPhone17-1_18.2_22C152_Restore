@interface PSGHomeButtonCustomizeController
- (BOOL)usesDoneButton;
- (PSGHomeButtonCustomizeController)init;
- (PSGHomeButtonCustomizeControllerDelegate)delegate;
- (unint64_t)getForceFeel;
- (void)_makeConstraints;
- (void)_updateDetailText;
- (void)barButtonTapped;
- (void)consumeAnyPressEventForButtonKind:(int64_t)a3;
- (void)dealloc;
- (void)loadView;
- (void)segmentedControl:(id)a3 didSelectSegmentAtIndex:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setForceFeel:(unint64_t)a3;
- (void)setListeningForHomeButtonPresses:(BOOL)a3;
- (void)setUsesDoneButton:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBecomeActive;
- (void)willResignActive;
@end

@implementation PSGHomeButtonCustomizeController

- (PSGHomeButtonCustomizeController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PSGHomeButtonCustomizeController;
  v2 = [(PSGHomeButtonCustomizeController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(PSGHomeButtonCustomizeController *)v2 setUsesDoneButton:0];
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel_willResignActive name:@"com.apple.PreferencesApp.willResignActive" object:0];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v3 selector:sel_willBecomeActive name:@"com.apple.PreferencesApp.willBecomeActive" object:0];

    v3->_reachabilityEnabled = SBSIsReachabilityEnabled() != 0;
  }
  return v3;
}

- (void)dealloc
{
  [(PSGHomeButtonCustomizeController *)self setListeningForHomeButtonPresses:0];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSGHomeButtonCustomizeController;
  [(PSGHomeButtonCustomizeController *)&v4 dealloc];
}

- (unint64_t)getForceFeel
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = [MEMORY[0x263F79398] sharedInstance];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__PSGHomeButtonCustomizeController_getForceFeel__block_invoke;
  v8[3] = &unk_264E8D0C0;
  v10 = &v11;
  objc_super v4 = v2;
  v9 = v4;
  [v3 fetchHapticTypeForButtonKind:1 completion:v8];

  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v4, v5);
  if ((unint64_t)(v12[3] - 1) >= 3) {
    unint64_t v6 = 2;
  }
  else {
    unint64_t v6 = v12[3];
  }

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __48__PSGHomeButtonCustomizeController_getForceFeel__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)setForceFeel:(unint64_t)a3
{
  if (a3 - 1 >= 3) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = a3;
  }
  id v4 = [MEMORY[0x263F79398] sharedInstance];
  [v4 setHapticType:v3 forButtonKind:1];
}

- (void)_updateDetailText
{
  id v3 = [(BFFPaneHeaderView *)self->_headerView detailTextLabel];
  v2 = PSG_LocalizedStringForHomeButton(@"CUSTOMIZE_DESCRIPTION");
  [v3 setText:v2];
}

- (void)setUsesDoneButton:(BOOL)a3
{
  BOOL v3 = a3;
  self->_usesDoneButton = a3;
  id v5 = objc_alloc(MEMORY[0x263F824A8]);
  unint64_t v6 = v5;
  if (v3)
  {
    id v9 = (id)[v5 initWithBarButtonSystemItem:0 target:self action:sel_barButtonTapped];
  }
  else
  {
    objc_super v7 = PSG_LocalizedStringForHomeButton(@"NEXT");
    id v9 = (id)[v6 initWithTitle:v7 style:2 target:self action:sel_barButtonTapped];
  }
  v8 = [(PSGHomeButtonCustomizeController *)self navigationItem];
  [v8 setRightBarButtonItem:v9];

  [(PSGHomeButtonCustomizeController *)self _updateDetailText];
}

- (void)loadView
{
  v28.receiver = self;
  v28.super_class = (Class)PSGHomeButtonCustomizeController;
  [(PSGHomeButtonCustomizeController *)&v28 loadView];
  BOOL v3 = [(PSGHomeButtonCustomizeController *)self view];
  id v4 = [getBFFStyleClass() sharedStyle];
  id v5 = [v4 backgroundColor];
  [v3 setBackgroundColor:v5];

  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2050000000;
  unint64_t v6 = (void *)getBFFPaneHeaderViewClass_softClass;
  uint64_t v33 = getBFFPaneHeaderViewClass_softClass;
  if (!getBFFPaneHeaderViewClass_softClass)
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __getBFFPaneHeaderViewClass_block_invoke;
    v29[3] = &unk_264E8CD70;
    v29[4] = &v30;
    __getBFFPaneHeaderViewClass_block_invoke((uint64_t)v29);
    unint64_t v6 = (void *)v31[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v30, 8);
  v8 = (BFFPaneHeaderView *)objc_opt_new();
  headerView = self->_headerView;
  self->_headerView = v8;

  v10 = self->_headerView;
  uint64_t v11 = PSG_LocalizedStringForHomeButton(@"CHOOSE_YOUR_CLICK_FEEL");
  [(BFFPaneHeaderView *)v10 setTitleText:v11];

  [(BFFPaneHeaderView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [(BFFPaneHeaderView *)self->_headerView detailTextLabel];
  [v12 setAdjustsFontSizeToFitWidth:1];

  [(PSGHomeButtonCustomizeController *)self _updateDetailText];
  uint64_t v13 = [(PSGHomeButtonCustomizeController *)self view];
  [v13 addSubview:self->_headerView];

  uint64_t v14 = (PSGCircleSegmentedControl *)objc_opt_new();
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v14;

  v16 = self->_segmentedControl;
  v17 = [MEMORY[0x263F08A30] localizedStringFromNumber:&unk_26F103BC8 numberStyle:1];
  [(PSGCircleSegmentedControl *)v16 addSegmentWithTitle:v17];

  v18 = self->_segmentedControl;
  v19 = [MEMORY[0x263F08A30] localizedStringFromNumber:&unk_26F103BE0 numberStyle:1];
  [(PSGCircleSegmentedControl *)v18 addSegmentWithTitle:v19];

  v20 = self->_segmentedControl;
  v21 = [MEMORY[0x263F08A30] localizedStringFromNumber:&unk_26F103BF8 numberStyle:1];
  [(PSGCircleSegmentedControl *)v20 addSegmentWithTitle:v21];

  [(PSGCircleSegmentedControl *)self->_segmentedControl setDelegate:self];
  v22 = [(PSGCircleSegmentedControl *)self->_segmentedControl label];
  if (self->_usesDoneButton) {
    v23 = @"CUSTOMIZE_INSTRUCTIONS_DONE";
  }
  else {
    v23 = @"CUSTOMIZE_INSTRUCTIONS_NEXT";
  }
  v24 = PSG_LocalizedStringForHomeButton(v23);
  [v22 setText:v24];

  v25 = [getBFFStyleClass() sharedStyle];
  v26 = [(PSGCircleSegmentedControl *)self->_segmentedControl label];
  [v25 applyThemeToLabel:v26];

  [(PSGCircleSegmentedControl *)self->_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
  v27 = [(PSGHomeButtonCustomizeController *)self view];
  [v27 addSubview:self->_segmentedControl];

  [(PSGHomeButtonCustomizeController *)self _makeConstraints];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v16[2] = *MEMORY[0x263EF8340];
  self->_visible = 1;
  [(PSGHomeButtonCustomizeController *)self setListeningForHomeButtonPresses:1];
  [(PSGCircleSegmentedControl *)self->_segmentedControl selectSegmentAtIndex:[(PSGHomeButtonCustomizeController *)self getForceFeel] - 1];
  v15.receiver = self;
  v15.super_class = (Class)PSGHomeButtonCustomizeController;
  [(PSGHomeButtonCustomizeController *)&v15 viewDidAppear:v3];
  id v5 = [MEMORY[0x263F086E0] mainBundle];
  unint64_t v6 = [v5 bundleIdentifier];

  if ([v6 isEqualToString:@"com.apple.Preferences"])
  {
    id v7 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/HOME_BUTTON"];
    id v8 = objc_alloc(MEMORY[0x263F08DB0]);
    id v9 = [MEMORY[0x263EFF960] currentLocale];
    v10 = PSG_BundleForGeneralSettingsUIFramework();
    uint64_t v11 = [v10 bundleURL];
    v12 = (void *)[v8 initWithKey:@"HOME_BUTTON" table:@"General" locale:v9 bundleURL:v11];

    uint64_t v13 = objc_msgSend(MEMORY[0x263F08DB0], "general_rootPaneComponent");
    v16[0] = v13;
    v16[1] = v12;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    +[EmitNavigationEventWrapper generalEmitNavigationEventForSystemSettingWithGraphicIconIdentifier:@"com.apple.graphic-icon.iphone-home-button" title:v12 localizedNavigationComponents:v14 deepLink:v7];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_visible = 0;
  [(PSGHomeButtonCustomizeController *)self setListeningForHomeButtonPresses:0];
  v5.receiver = self;
  v5.super_class = (Class)PSGHomeButtonCustomizeController;
  [(PSGHomeButtonCustomizeController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(PSGHomeButtonCustomizeController *)self getForceFeel];
  unint64_t v6 = [MEMORY[0x263F086E0] mainBundle];
  id v7 = [v6 bundleIdentifier];

  if (self->_forceFeelValueChanged || ([v7 isEqualToString:@"com.apple.Preferences"] & 1) == 0)
  {
    id v8 = objc_msgSend(v7, "stringByAppendingFormat:", @".sshb-selection-%i", v5);
    id v9 = _PSGLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_23D28D000, v9, OS_LOG_TYPE_DEFAULT, "Recording sshb selection %@", buf, 0xCu);
    }

    v10 = [MEMORY[0x263F255A0] sharedAggregateDictionary];
    [v10 incrementKey:v8];
  }
  v11.receiver = self;
  v11.super_class = (Class)PSGHomeButtonCustomizeController;
  [(PSGHomeButtonCustomizeController *)&v11 viewDidDisappear:v3];
}

- (void)willResignActive
{
}

- (void)willBecomeActive
{
  if (self->_visible) {
    [(PSGHomeButtonCustomizeController *)self setListeningForHomeButtonPresses:1];
  }
}

- (void)setListeningForHomeButtonPresses:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v5 = _PSGLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = v3;
    _os_log_impl(&dword_23D28D000, v5, OS_LOG_TYPE_DEFAULT, "Now intercepting home button presses: %d", (uint8_t *)v16, 8u);
  }

  if (self->_reachabilityEnabled) {
    [(id)*MEMORY[0x263F83300] _setReachabilitySupported:!v3];
  }
  if (v3)
  {
    if (self->_menuButtonRecognizer) {
      -[PSGHomeButtonCustomizeController setListeningForHomeButtonPresses:]();
    }
    unint64_t v6 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self->_segmentedControl action:sel_menuButtonPressed];
    menuButtonRecognizer = self->_menuButtonRecognizer;
    self->_menuButtonRecognizer = v6;

    [(UITapGestureRecognizer *)self->_menuButtonRecognizer setAllowedPressTypes:&unk_26F103D60];
    id v8 = [(PSGHomeButtonCustomizeController *)self view];
    id v9 = [v8 window];
    [v9 addGestureRecognizer:self->_menuButtonRecognizer];

    v10 = [MEMORY[0x263F79398] sharedInstance];
    objc_super v11 = [v10 beginConsumingPressesForButtonKind:1 eventConsumer:self priority:0];
    eventConsumerToken = self->_eventConsumerToken;
    self->_eventConsumerToken = v11;
  }
  else
  {
    uint64_t v13 = [(PSGHomeButtonCustomizeController *)self view];
    uint64_t v14 = [v13 window];
    [v14 removeGestureRecognizer:self->_menuButtonRecognizer];

    objc_super v15 = self->_menuButtonRecognizer;
    self->_menuButtonRecognizer = 0;

    [(BSInvalidatable *)self->_eventConsumerToken invalidate];
    v10 = self->_eventConsumerToken;
    self->_eventConsumerToken = 0;
  }
}

- (void)barButtonTapped
{
  id v3 = [(PSGHomeButtonCustomizeController *)self delegate];
  [v3 homeButtonCustomizeControllerDidFinish:self];
}

- (void)_makeConstraints
{
  LODWORD(v2) = 1148846080;
  [(BFFPaneHeaderView *)self->_headerView setContentHuggingPriority:1 forAxis:v2];
  id v4 = [(BFFPaneHeaderView *)self->_headerView topAnchor];
  unint64_t v5 = [(PSGHomeButtonCustomizeController *)self view];
  unint64_t v6 = [v5 safeAreaLayoutGuide];
  id v7 = [v6 topAnchor];
  id v8 = [v4 constraintEqualToSystemSpacingBelowAnchor:v7 multiplier:1.0];
  [v8 setActive:1];

  id v9 = [(BFFPaneHeaderView *)self->_headerView leadingAnchor];
  v10 = [(PSGHomeButtonCustomizeController *)self view];
  objc_super v11 = [v10 layoutMarginsGuide];
  v12 = [v11 leadingAnchor];
  uint64_t v13 = [v9 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  uint64_t v14 = [(BFFPaneHeaderView *)self->_headerView trailingAnchor];
  objc_super v15 = [(PSGHomeButtonCustomizeController *)self view];
  v16 = [v15 layoutMarginsGuide];
  uint64_t v17 = [v16 trailingAnchor];
  v18 = [v14 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  id v73 = [(BFFPaneHeaderView *)self->_headerView textLabel];
  [v73 setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = [(BFFPaneHeaderView *)self->_headerView detailTextLabel];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v20) = 1144750080;
  [v73 setContentHuggingPriority:1 forAxis:v20];
  LODWORD(v21) = 1144750080;
  [v73 setContentCompressionResistancePriority:1 forAxis:v21];
  v22 = [getBFFStyleClass() sharedStyle];
  v23 = [(PSGHomeButtonCustomizeController *)self view];
  v24 = [(PSGHomeButtonCustomizeController *)self view];
  [v24 bounds];
  [v22 horizontalInsetsForContainingInView:v23 width:v25];
  double v27 = v26;

  objc_super v28 = [(PSGHomeButtonCustomizeController *)self traitCollection];
  v29 = [v28 preferredContentSizeCategory];
  LODWORD(v24) = UIContentSizeCategoryIsAccessibilityCategory(v29);

  uint64_t v30 = [v73 topAnchor];
  v31 = [(BFFPaneHeaderView *)self->_headerView topAnchor];
  double v32 = 10.0;
  if (v24) {
    double v32 = 0.0;
  }
  uint64_t v33 = [v30 constraintEqualToAnchor:v31 constant:v32];
  [v33 setActive:1];

  v34 = [v73 leadingAnchor];
  v35 = [(BFFPaneHeaderView *)self->_headerView leadingAnchor];
  v36 = [v34 constraintEqualToAnchor:v35 constant:v27];
  [v36 setActive:1];

  v37 = [v73 trailingAnchor];
  v38 = [(BFFPaneHeaderView *)self->_headerView trailingAnchor];
  v39 = [v37 constraintEqualToAnchor:v38 constant:-v27];
  [v39 setActive:1];

  v40 = [v19 topAnchor];
  v41 = [v73 bottomAnchor];
  v42 = [v40 constraintEqualToSystemSpacingBelowAnchor:v41 multiplier:1.0];
  [v42 setActive:1];

  v43 = [v19 leadingAnchor];
  v44 = [(BFFPaneHeaderView *)self->_headerView leadingAnchor];
  v45 = [v43 constraintEqualToAnchor:v44 constant:v27];
  [v45 setActive:1];

  v46 = [v19 trailingAnchor];
  v47 = [(BFFPaneHeaderView *)self->_headerView trailingAnchor];
  v48 = [v46 constraintEqualToAnchor:v47 constant:-v27];
  [v48 setActive:1];

  v49 = [(BFFPaneHeaderView *)self->_headerView bottomAnchor];
  v50 = [v19 bottomAnchor];
  v51 = [v49 constraintEqualToSystemSpacingBelowAnchor:v50 multiplier:1.0];
  [v51 setActive:1];

  v52 = [(PSGCircleSegmentedControl *)self->_segmentedControl topAnchor];
  v53 = [(BFFPaneHeaderView *)self->_headerView bottomAnchor];
  v54 = [v52 constraintEqualToSystemSpacingBelowAnchor:v53 multiplier:1.0];
  [v54 setActive:1];

  v55 = [(PSGCircleSegmentedControl *)self->_segmentedControl centerXAnchor];
  v56 = [(PSGHomeButtonCustomizeController *)self view];
  v57 = [v56 centerXAnchor];
  v58 = [v55 constraintEqualToAnchor:v57];
  [v58 setActive:1];

  v59 = [(PSGCircleSegmentedControl *)self->_segmentedControl leadingAnchor];
  v60 = [(PSGHomeButtonCustomizeController *)self view];
  v61 = [v60 layoutMarginsGuide];
  v62 = [v61 leadingAnchor];
  v63 = [v59 constraintEqualToAnchor:v62];
  [v63 setActive:1];

  v64 = [(PSGCircleSegmentedControl *)self->_segmentedControl trailingAnchor];
  v65 = [(PSGHomeButtonCustomizeController *)self view];
  v66 = [v65 layoutMarginsGuide];
  v67 = [v66 trailingAnchor];
  v68 = [v64 constraintEqualToAnchor:v67];
  [v68 setActive:1];

  v69 = [(PSGCircleSegmentedControl *)self->_segmentedControl bottomAnchor];
  v70 = [(PSGHomeButtonCustomizeController *)self view];
  v71 = [v70 bottomAnchor];
  v72 = [v69 constraintEqualToAnchor:v71 constant:-3.0];
  [v72 setActive:1];
}

- (void)segmentedControl:(id)a3 didSelectSegmentAtIndex:(unint64_t)a4
{
  if (a4 < 3) {
    unint64_t v5 = a4 + 1;
  }
  else {
    unint64_t v5 = 0;
  }
  [(PSGHomeButtonCustomizeController *)self setForceFeel:v5];
  self->_forceFeelValueChanged = 1;
}

- (void)consumeAnyPressEventForButtonKind:(int64_t)a3
{
  id v3 = _PSGLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23D28D000, v3, OS_LOG_TYPE_DEFAULT, "Consuming home button press", v4, 2u);
  }
}

- (PSGHomeButtonCustomizeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSGHomeButtonCustomizeControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)usesDoneButton
{
  return self->_usesDoneButton;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_eventConsumerToken, 0);
  objc_storeStrong((id *)&self->_menuButtonRecognizer, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

- (void)setListeningForHomeButtonPresses:.cold.1()
{
}

@end