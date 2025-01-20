@interface BSUIWelcomeGDPRViewController
- (BSUIWelcomeGDPRViewController)initWithCompletion:(id)a3;
- (id)completion;
- (void)_analyticsSubmitGetStartedActionEventForGDPRLink:(BOOL)a3;
- (void)_getStartedPressed:(id)a3;
- (void)_privacyLinkPressed:(id)a3;
- (void)setCompletion:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BSUIWelcomeGDPRViewController

- (BSUIWelcomeGDPRViewController)initWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = BSUIBundle();
  v6 = [v5 localizedStringForKey:@"Welcome to Apple Books" value:&stru_39B8B0 table:@"BookStoreUILocalizable"];

  v7 = BSUIBundle();
  v8 = [v7 localizedStringForKey:@"Find great books and audiobooks you can read or listen to anywhere, on all your Apple devices.", &stru_39B8B0, @"BookStoreUILocalizable" value table];

  v9 = BSUIBundle();
  v10 = +[UIImage imageNamed:@"welcome-app-icon-ios" inBundle:v9];

  v15.receiver = self;
  v15.super_class = (Class)BSUIWelcomeGDPRViewController;
  v11 = [(BSUIWelcomeGDPRViewController *)&v15 initWithTitle:v6 detailText:v8 icon:v10 contentLayout:2];
  if (v11)
  {
    id v12 = [v4 copy];
    id completion = v11->_completion;
    v11->_id completion = v12;
  }
  return v11;
}

- (void)viewDidLoad
{
  v39.receiver = self;
  v39.super_class = (Class)BSUIWelcomeGDPRViewController;
  [(BSUIWelcomeGDPRViewController *)&v39 viewDidLoad];
  id v3 = objc_alloc_init((Class)UILabel);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = +[UIColor secondaryLabelColor];
  [v3 setTextColor:v4];

  v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  [v3 setFont:v5];

  [v3 setTextAlignment:1];
  [v3 setNumberOfLines:0];
  v6 = BSUIBundle();
  v7 = [v6 localizedStringForKey:@"Features vary by region." value:&stru_39B8B0 table:@"BookStoreUILocalizable"];
  [v3 setText:v7];

  v8 = [(BSUIWelcomeGDPRViewController *)self contentView];
  [v8 addSubview:v3];

  v36 = [v3 topAnchor];
  v37 = [(BSUIWelcomeGDPRViewController *)self contentView];
  v35 = [v37 topAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v42[0] = v34;
  v33 = [(BSUIWelcomeGDPRViewController *)self contentView];
  v32 = [v33 heightAnchor];
  v31 = [v3 heightAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v42[1] = v30;
  v9 = [v3 centerXAnchor];
  v10 = [(BSUIWelcomeGDPRViewController *)self contentView];
  v11 = [v10 centerXAnchor];
  id v12 = [v9 constraintEqualToAnchor:v11];
  v42[2] = v12;
  v13 = [v3 widthAnchor];
  v38 = self;
  v14 = [(BSUIWelcomeGDPRViewController *)self contentView];
  objc_super v15 = [v14 widthAnchor];
  v16 = [v13 constraintLessThanOrEqualToAnchor:v15];
  v42[3] = v16;
  v17 = +[NSArray arrayWithObjects:v42 count:4];
  +[NSLayoutConstraint activateConstraints:v17];

  v18 = BUOnboardingAllBundleIDs();
  v19 = BSUIWelcomeScreenLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v41 = v18;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "BSUIWelcomeGDPRViewController: viewDidLoad: bundleIdentifiers: %{public}@", buf, 0xCu);
  }

  v20 = +[OBPrivacyLinkController linkWithBundleIdentifiers:v18];
  [v20 setUnderlineLinks:1];
  v21 = +[UIColor colorNamed:@"BrandColor"];
  [v20 setCustomTintColor:v21];
  v22 = [(BSUIWelcomeGDPRViewController *)v38 buttonTray];
  [v22 setPrivacyLinkController:v20];

  objc_opt_class();
  v23 = [v20 view];
  v24 = BUDynamicCast();

  [v24 addTarget:v38 action:"_privacyLinkPressed:" forControlEvents:0x2000];
  v25 = +[OBBoldTrayButton boldButton];
  v26 = BSUIBundle();
  v27 = [v26 localizedStringForKey:@"Get Started" value:&stru_39B8B0 table:@"BookStoreUILocalizable"];

  [v25 setTitle:v27 forState:0];
  [v25 addTarget:v38 action:"_getStartedPressed:" forControlEvents:64];
  v28 = +[UIColor bc_welcomeButtonColor];
  [v25 setTintColor:v28];

  v29 = [(BSUIWelcomeGDPRViewController *)v38 buttonTray];
  [v29 addButton:v25];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = BSUIWelcomeScreenLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "BSUIWelcomeGDPRViewController: viewWillAppear", buf, 2u);
  }

  v10.receiver = self;
  v10.super_class = (Class)BSUIWelcomeGDPRViewController;
  [(BSUIWelcomeGDPRViewController *)&v10 viewWillAppear:v3];
  v6 = [(BSUIWelcomeGDPRViewController *)self ba_analyticsTracker];

  if (!v6) {
    id v7 = [(BSUIWelcomeGDPRViewController *)self ba_setupNewAnalyticsTrackerWithName:@"GetStarted"];
  }
  v8 = +[NSDate date];
  appearDate = self->_appearDate;
  self->_appearDate = v8;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = BSUIWelcomeScreenLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "BSUIWelcomeGDPRViewController: viewWillDisappear", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)BSUIWelcomeGDPRViewController;
  [(BSUIWelcomeGDPRViewController *)&v8 viewWillDisappear:v3];
  if (self->_appearDate)
  {
    v6 = [(BSUIWelcomeGDPRViewController *)self ba_effectiveAnalyticsTracker];
    id v7 = +[BAEventReporter sharedReporter];
    [v7 emitGetStartedViewEventWithTracker:v6 startDate:self->_appearDate];
  }
}

- (void)_getStartedPressed:(id)a3
{
  id v4 = BSUIWelcomeScreenLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "BSUIWelcomeGDPRViewController: _getStartedPressed", v7, 2u);
  }

  [(BSUIWelcomeGDPRViewController *)self _analyticsSubmitGetStartedActionEventForGDPRLink:0];
  uint64_t v5 = [(BSUIWelcomeGDPRViewController *)self completion];
  v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
}

- (void)_privacyLinkPressed:(id)a3
{
  id v4 = BSUIWelcomeScreenLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "BSUIWelcomeGDPRViewController: _privacyLinkPressed", v5, 2u);
  }

  [(BSUIWelcomeGDPRViewController *)self _analyticsSubmitGetStartedActionEventForGDPRLink:1];
}

- (void)_analyticsSubmitGetStartedActionEventForGDPRLink:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(BSUIWelcomeGDPRViewController *)self ba_effectiveAnalyticsTracker];
  id v4 = +[BAEventReporter sharedReporter];
  uint64_t v5 = v4;
  if (v3) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [v4 emitGetStartedActionEventWithTracker:v7 type:v6];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_appearDate, 0);
}

@end