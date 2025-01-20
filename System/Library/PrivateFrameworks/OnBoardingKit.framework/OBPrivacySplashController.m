@interface OBPrivacySplashController
+ (id)splashPageWithBundleIdentifier:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsOpeningSafari;
- (BOOL)forceLargeMargins;
- (BOOL)isCombined;
- (BOOL)showLinkToPrivacyGateway;
- (BOOL)showsLinkToUnifiedAbout;
- (BOOL)suppressPerPageAnalyticsLogging;
- (BOOL)underlineLinks;
- (BOOL)useModalStyle;
- (NSString)displayLanguage;
- (OBAdditionalDisplayLanguageManager)additionalDisplayLanguageManager;
- (OBPrivacyFlow)flow;
- (OBPrivacySplashController)initWithFlow:(id)a3;
- (OBPrivacySplashController)initWithPrivacyIdentifier:(id)a3;
- (UIButton)linkToPrivacyGatewayButton;
- (UIButton)unifiedAboutButton;
- (UIColor)customTintColor;
- (UILabel)linkToPrivacyGateway;
- (UILabel)privacyGatewayDescription;
- (id)_defaultButtonTitle;
- (id)defaultButtonHandler;
- (unint64_t)displayDeviceType;
- (void)_initializeFromBundle;
- (void)_languageToggleTapped;
- (void)defaultButtonPressed:(id)a3;
- (void)loadView;
- (void)setAdditionalDisplayLanguageManager:(id)a3;
- (void)setAllowsOpeningSafari:(BOOL)a3;
- (void)setCustomTintColor:(id)a3;
- (void)setDefaultButtonHandler:(id)a3;
- (void)setDismissHandlerForDefaultButton:(id)a3;
- (void)setDisplayDeviceType:(unint64_t)a3;
- (void)setDisplayLanguage:(id)a3;
- (void)setFlow:(id)a3;
- (void)setForceLargeMargins:(BOOL)a3;
- (void)setIsCombined:(BOOL)a3;
- (void)setLinkToPrivacyGateway:(id)a3;
- (void)setLinkToPrivacyGatewayButton:(id)a3;
- (void)setPrivacyGatewayDescription:(id)a3;
- (void)setShowLinkToPrivacyGateway:(BOOL)a3;
- (void)setShowsLinkToUnifiedAbout:(BOOL)a3;
- (void)setSuppressPerPageAnalyticsLogging:(BOOL)a3;
- (void)setUnderlineLinks:(BOOL)a3;
- (void)setUnifiedAboutButton:(id)a3;
- (void)setUseModalStyle:(BOOL)a3;
- (void)showPrivacyGateway:(id)a3;
- (void)showUnifiedAbout:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFontForPrivacyGateway;
- (void)updateFontForUnifiedAboutButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation OBPrivacySplashController

+ (id)splashPageWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[OBPrivacySplashController alloc] initWithPrivacyIdentifier:v3];

  return v4;
}

- (OBPrivacySplashController)initWithPrivacyIdentifier:(id)a3
{
  if (a3)
  {
    v4 = +[OBBundle bundleWithIdentifier:](OBBundle, "bundleWithIdentifier:");
    v5 = [v4 privacyFlow];
    v6 = [(OBPrivacySplashController *)self initWithFlow:v5];
  }
  else
  {
    v6 = -[OBPrivacySplashController initWithFlow:](self, "initWithFlow:");
  }

  return v6;
}

- (id)_defaultButtonTitle
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [(OBPrivacySplashController *)self displayLanguage];
  v5 = +[OBUtilities localizedString:@"SPLASH_CONTINUE" forTable:@"Localizable" inBundle:v3 forLanguage:v4];

  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OBPrivacySplashController;
  [(OBWelcomeController *)&v6 viewDidAppear:a3];
  if (![(OBPrivacySplashController *)self suppressPerPageAnalyticsLogging])
  {
    if ([(OBPrivacySplashController *)self isMovingToParentViewController])
    {
      v4 = +[OBAnalyticsManager sharedManager];
      v5 = [(OBPrivacyFlow *)self->_flow identifier];
      [v4 logPresentationOfPrivacySplashWithIdentifier:v5];
    }
  }
}

- (OBPrivacySplashController)initWithFlow:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OBPrivacySplashController;
  objc_super v6 = [(OBWelcomeController *)&v11 initWithTitle:&stru_1EEC28768 detailText:0 icon:0 contentLayout:2];
  if (v6)
  {
    if (![v5 platformSupported])
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_flow, a3);
    v7 = +[OBCapabilities sharedCapabilities];
    -[OBPrivacySplashController setAllowsOpeningSafari:](v6, "setAllowsOpeningSafari:", [v7 preventOpeningSafari] ^ 1);

    [(OBPrivacySplashController *)v6 setDisplayDeviceType:0];
    v8 = [(OBWelcomeController *)v6 buttonTray];
    [v8 setHidden:1];
  }
  v9 = v6;
LABEL_6:

  return v9;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)OBPrivacySplashController;
  [(OBWelcomeController *)&v6 loadView];
  id v3 = [(OBPrivacySplashController *)self customTintColor];

  if (v3)
  {
    v4 = [(OBPrivacySplashController *)self customTintColor];
    id v5 = [(OBPrivacySplashController *)self view];
    [v5 setTintColor:v4];
  }
}

- (void)showUnifiedAbout:(id)a3
{
  id v13 = +[OBPrivacyPresenter presenterForPrivacyUnifiedAbout];
  v4 = [(OBPrivacySplashController *)self displayLanguage];
  id v5 = [v13 combinedController];
  [v5 setDisplayLanguage:v4];

  objc_super v6 = [(OBPrivacySplashController *)self additionalDisplayLanguageManager];
  v7 = [v13 combinedController];
  [v7 setAdditionalDisplayLanguageManager:v6];

  BOOL v8 = [(OBPrivacySplashController *)self underlineLinks];
  v9 = [v13 combinedController];
  [v9 setUnderlineLinks:v8];

  v10 = [(OBPrivacySplashController *)self customTintColor];
  objc_super v11 = [v13 combinedController];
  [v11 setCustomTintColor:v10];

  objc_msgSend(v13, "setDarkMode:", -[OBWelcomeController darkMode](self, "darkMode"));
  [v13 setPresentingViewController:self];
  v12 = [(OBPrivacySplashController *)self navigationController];
  [v13 presentInNavigationStack:v12 animated:1];
}

- (void)showPrivacyGateway:(id)a3
{
  objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v6 = [(OBPrivacySplashController *)self displayLanguage];
  v7 = +[OBUtilities localizedString:@"PRIVACY_HTTP_WEB_LINK" forTable:@"Localizable" inBundle:v5 forLanguage:v6];
  BOOL v8 = [v4 URLWithString:v7];
  [v9 openURL:v8 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)OBPrivacySplashController;
  [(OBBaseWelcomeController *)&v10 viewDidLoad];
  [(OBPrivacySplashController *)self _initializeFromBundle];
  id v3 = [(OBPrivacySplashController *)self additionalDisplayLanguageManager];

  if (!v3)
  {
    v4 = [OBAdditionalDisplayLanguageManager alloc];
    id v5 = [(OBPrivacySplashController *)self displayLanguage];
    objc_super v6 = [(OBAdditionalDisplayLanguageManager *)v4 initWithDisplayLanguage:v5];
    [(OBPrivacySplashController *)self setAdditionalDisplayLanguageManager:v6];
  }
  v7 = [(OBPrivacyFlow *)self->_flow identifier];
  int v8 = [v7 isEqualToString:@"com.apple.onboarding.privacypane"];

  if (v8) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  [(OBWelcomeController *)self setTemplateType:v9];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OBPrivacySplashController;
  [(OBWelcomeController *)&v7 viewWillAppear:a3];
  v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setTitle:0];

  id v5 = [(OBPrivacySplashController *)self additionalDisplayLanguageManager];
  objc_super v6 = [(OBPrivacySplashController *)self displayLanguage];
  [v5 configureNavigationItemRightBarButtonItemForWelcomeController:self currentDisplayLanguage:v6 action:sel__languageToggleTapped];
}

- (void)setCustomTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_customTintColor, a3);
  id v5 = a3;
  id v6 = [(OBPrivacySplashController *)self view];
  [v6 setTintColor:v5];
}

- (void)_initializeFromBundle
{
  v121[3] = *MEMORY[0x1E4F143B8];
  id v3 = +[OBCapabilities sharedCapabilities];
  if ([v3 preventURLDataDetection]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 2;
  }

  id v5 = [(OBPrivacyFlow *)self->_flow identifier];
  uint64_t v6 = [v5 isEqualToString:@"com.apple.onboarding.privacypane"];

  flow = self->_flow;
  int v8 = [(OBPrivacySplashController *)self displayLanguage];
  uint64_t v9 = [(OBPrivacyFlow *)flow localizedContentListForLanguage:v8 preferredDeviceType:[(OBPrivacySplashController *)self displayDeviceType]];

  v117 = (void *)v9;
  objc_super v10 = [[OBPrivacySplashListView alloc] initWithContentList:v9 dataDetectorTypes:v4 displayingPrivacyPane:v6];
  [(OBPrivacySplashListView *)v10 setUnderlineLinks:[(OBPrivacySplashController *)self underlineLinks]];
  [(OBPrivacySplashListView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  v118 = v10;
  if ([(OBPrivacySplashController *)self showLinkToPrivacyGateway])
  {
    if ([(OBPrivacySplashController *)self allowsOpeningSafari])
    {
      objc_super v11 = +[OBPrivacyButton buttonWithType:1];
      [(OBPrivacySplashController *)self setLinkToPrivacyGatewayButton:v11];

      BOOL v12 = [(OBPrivacySplashController *)self underlineLinks];
      id v13 = [(OBPrivacySplashController *)self linkToPrivacyGatewayButton];
      [v13 setUnderlineLinks:v12];

      v14 = [(OBPrivacySplashController *)self linkToPrivacyGatewayButton];
      v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v16 = [(OBPrivacySplashController *)self displayLanguage];
      v17 = +[OBUtilities localizedString:@"MANAGE_YOUR_DATA" forTable:@"Localizable" inBundle:v15 forLanguage:v16];
      [v14 setTitle:v17 forState:0];

      v18 = [(OBPrivacySplashController *)self linkToPrivacyGatewayButton];
      [v18 addTarget:self action:sel_showPrivacyGateway_ forControlEvents:0x2000];

      v19 = [(OBPrivacySplashController *)self linkToPrivacyGatewayButton];
      v20 = [v19 titleLabel];
      [v20 setAdjustsFontSizeToFitWidth:1];

      [(OBPrivacySplashController *)self linkToPrivacyGatewayButton];
    }
    else
    {
      id v21 = objc_alloc(MEMORY[0x1E4FB1930]);
      double v22 = *MEMORY[0x1E4F1DB28];
      double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      v26 = objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E4F1DB28], v23, v24, v25);
      [(OBPrivacySplashController *)self setPrivacyGatewayDescription:v26];

      v27 = [(OBPrivacySplashController *)self privacyGatewayDescription];
      v28 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v29 = [(OBPrivacySplashController *)self displayLanguage];
      v30 = +[OBUtilities localizedString:@"PRIVACY_WEB_DESCRIPTION" forTable:@"Localizable" inBundle:v28 forLanguage:v29];
      [v27 setText:v30];

      v31 = [(OBPrivacySplashController *)self privacyGatewayDescription];
      [v31 setNumberOfLines:0];

      v32 = [(OBPrivacySplashController *)self privacyGatewayDescription];
      [v32 setAdjustsFontSizeToFitWidth:1];

      v33 = [(OBPrivacySplashController *)self privacyGatewayDescription];
      [v33 setTextAlignment:1];

      v34 = [(OBPrivacySplashController *)self privacyGatewayDescription];
      [(OBPrivacySplashListView *)v10 addArrangedSubview:v34];

      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v22, v23, v24, v25);
      [(OBPrivacySplashController *)self setLinkToPrivacyGateway:v35];

      v36 = [(OBPrivacySplashController *)self linkToPrivacyGateway];
      v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v38 = [(OBPrivacySplashController *)self displayLanguage];
      v39 = +[OBUtilities localizedString:@"PRIVACY_WEB_LINK" forTable:@"Localizable" inBundle:v37 forLanguage:v38];
      [v36 setText:v39];

      v40 = [(OBPrivacySplashController *)self linkToPrivacyGateway];
      [v40 setAdjustsFontSizeToFitWidth:1];

      v41 = [(OBPrivacySplashController *)self linkToPrivacyGateway];
      [v41 setTextAlignment:1];

      [(OBPrivacySplashController *)self linkToPrivacyGateway];
    v42 = };
    [(OBPrivacySplashListView *)v10 addArrangedSubview:v42];
  }
  if ([(OBPrivacySplashController *)self showsLinkToUnifiedAbout])
  {
    v43 = +[OBPrivacyButton buttonWithType:1];
    [(OBPrivacySplashController *)self setUnifiedAboutButton:v43];

    BOOL v44 = [(OBPrivacySplashController *)self underlineLinks];
    v45 = [(OBPrivacySplashController *)self unifiedAboutButton];
    [v45 setUnderlineLinks:v44];

    v46 = [(OBPrivacySplashController *)self unifiedAboutButton];
    v47 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v48 = [(OBPrivacySplashController *)self displayLanguage];
    v49 = +[OBUtilities localizedString:@"LEARN_MORE_FOOTER" forTable:@"Localizable" inBundle:v47 forLanguage:v48];
    [v46 setTitle:v49 forState:0];

    v50 = [(OBPrivacySplashController *)self unifiedAboutButton];
    [v50 addTarget:self action:sel_showUnifiedAbout_ forControlEvents:0x2000];

    v51 = [(OBPrivacySplashController *)self unifiedAboutButton];
    v52 = [v51 titleLabel];
    [v52 setAdjustsFontSizeToFitWidth:1];

    id v53 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v54 = objc_msgSend(v53, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v55 = [(OBPrivacySplashController *)self unifiedAboutButton];
    [v54 addSubview:v55];

    v56 = [(OBPrivacySplashController *)self unifiedAboutButton];
    [v56 setTranslatesAutoresizingMaskIntoConstraints:0];

    v110 = (void *)MEMORY[0x1E4F28DC8];
    v115 = [(OBPrivacySplashController *)self unifiedAboutButton];
    v114 = [v115 centerXAnchor];
    v113 = [v54 centerXAnchor];
    v112 = [v114 constraintEqualToAnchor:v113];
    v121[0] = v112;
    v111 = [(OBPrivacySplashController *)self unifiedAboutButton];
    v57 = [v111 topAnchor];
    v58 = [v54 topAnchor];
    v59 = [v57 constraintEqualToAnchor:v58];
    v121[1] = v59;
    v60 = [(OBPrivacySplashController *)self unifiedAboutButton];
    v61 = [v60 bottomAnchor];
    v62 = [v54 bottomAnchor];
    v63 = [v61 constraintEqualToAnchor:v62];
    v121[2] = v63;
    v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:3];
    [v110 activateConstraints:v64];

    v65 = [(OBPrivacySplashController *)self customTintColor];

    if (v65)
    {
      v66 = [(OBPrivacySplashController *)self customTintColor];
      v67 = [(OBWelcomeController *)self headerView];
      [v67 setTintColor:v66];
    }
    objc_super v10 = v118;
    [(OBPrivacySplashListView *)v118 addArrangedSubview:v54];
  }
  v68 = [(OBWelcomeController *)self contentView];
  [v68 addSubview:v10];

  v69 = [MEMORY[0x1E4F1CA48] array];
  v70 = [(OBWelcomeController *)self contentView];
  v71 = [v70 topAnchor];
  v72 = [(OBPrivacySplashListView *)v10 topAnchor];
  v73 = [v71 constraintEqualToAnchor:v72];
  v120 = v73;
  v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
  [v69 addObjectsFromArray:v74];

  v75 = [(OBWelcomeController *)self contentView];
  v76 = [v75 bottomAnchor];
  v77 = [(OBPrivacySplashListView *)v10 bottomAnchor];
  v78 = [v76 constraintEqualToAnchor:v77];
  [v69 addObject:v78];

  v116 = [(OBWelcomeController *)self contentView];
  v79 = [v116 leadingAnchor];
  v80 = [(OBPrivacySplashListView *)v10 leadingAnchor];
  v81 = [v79 constraintEqualToAnchor:v80];
  v119[0] = v81;
  v82 = [(OBWelcomeController *)self contentView];
  v83 = [v82 trailingAnchor];
  v84 = [(OBPrivacySplashListView *)v10 trailingAnchor];
  v85 = [v83 constraintEqualToAnchor:v84];
  v119[1] = v85;
  v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:2];
  [v69 addObjectsFromArray:v86];

  [MEMORY[0x1E4F28DC8] activateConstraints:v69];
  [(OBPrivacySplashController *)self updateFontForPrivacyGateway];
  [(OBPrivacySplashController *)self updateFontForUnifiedAboutButton];
  v87 = self->_flow;
  v88 = [(OBPrivacySplashController *)self displayLanguage];
  v89 = [(OBPrivacyFlow *)v87 localizedTitleForLanguage:v88 preferredDeviceType:[(OBPrivacySplashController *)self displayDeviceType]];
  [(OBPrivacySplashController *)self setTitle:v89];

  v90 = [(OBWelcomeController *)self headerView];
  v91 = [(OBPrivacySplashController *)self title];
  [v90 setTitle:v91];

  v92 = [(OBPrivacyFlow *)self->_flow identifier];
  if ([v92 isEqualToString:@"com.apple.onboarding.privacypane"])
  {
    unint64_t v93 = [(OBWelcomeController *)self templateType];

    v94 = v118;
    if (v93 == 2)
    {
      v95 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v96 = [(OBPrivacySplashController *)self displayLanguage];
      v97 = +[OBUtilities localizedString:@"PRIVACY_ICON_DESCRIPTION" forTable:@"Localizable" inBundle:v95 forLanguage:v96];
      v98 = [(OBWelcomeController *)self headerView];
      v99 = [v98 animationView];
      [v99 setAccessibilityLabel:v97];

      v100 = [(OBWelcomeController *)self headerView];
      v101 = [v100 animationView];
      [v101 setIsAccessibilityElement:1];
LABEL_20:

      goto LABEL_21;
    }
  }
  else
  {

    v94 = v118;
  }
  v102 = [(OBPrivacyFlow *)self->_flow buttonIcon];

  if (v102)
  {
    v103 = [(OBWelcomeController *)self headerView];
    v104 = [(OBPrivacyFlow *)self->_flow buttonIcon];
    v105 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v106 = [(OBPrivacySplashController *)self displayLanguage];
    v107 = +[OBUtilities localizedString:@"PRIVACY_ICON_DESCRIPTION" forTable:@"Localizable" inBundle:v105 forLanguage:v106];
    [v103 setIcon:v104 accessibilityLabel:v107];

    v108 = [(OBWelcomeController *)self headerView];
    [v108 setIconInheritsTint:1];

    v109 = [(OBPrivacySplashController *)self customTintColor];

    if (v109)
    {
      v100 = [(OBPrivacySplashController *)self customTintColor];
      v101 = [(OBWelcomeController *)self headerView];
      [v101 setTintColor:v100];
      goto LABEL_20;
    }
  }
LABEL_21:
}

- (void)setDismissHandlerForDefaultButton:(id)a3
{
  [(OBPrivacySplashController *)self setDefaultButtonHandler:a3];
  id v7 = +[OBBoldTrayButton boldButton];
  uint64_t v4 = [(OBPrivacySplashController *)self _defaultButtonTitle];
  [v7 setTitle:v4 forState:0];

  [v7 addTarget:self action:sel_defaultButtonPressed_ forControlEvents:0x2000];
  id v5 = [(OBWelcomeController *)self buttonTray];
  [v5 addButton:v7];

  uint64_t v6 = [(OBWelcomeController *)self buttonTray];
  [v6 setHidden:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OBPrivacySplashController;
  [(OBWelcomeController *)&v4 traitCollectionDidChange:a3];
  [(OBPrivacySplashController *)self updateFontForPrivacyGateway];
  [(OBPrivacySplashController *)self updateFontForUnifiedAboutButton];
}

- (void)updateFontForPrivacyGateway
{
  id v3 = [(OBPrivacySplashController *)self linkToPrivacyGatewayButton];
  objc_super v4 = [v3 titleLabel];
  id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v4 setFont:v5];

  uint64_t v6 = [(OBPrivacySplashController *)self privacyGatewayDescription];
  uint64_t v7 = *MEMORY[0x1E4FB2950];
  int v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v6 setFont:v8];

  id v10 = [(OBPrivacySplashController *)self linkToPrivacyGateway];
  uint64_t v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v7];
  [v10 setFont:v9];
}

- (void)updateFontForUnifiedAboutButton
{
  id v4 = [(OBPrivacySplashController *)self unifiedAboutButton];
  v2 = [v4 titleLabel];
  id v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v2 setFont:v3];
}

- (void)defaultButtonPressed:(id)a3
{
  id v4 = [(OBPrivacySplashController *)self defaultButtonHandler];

  if (v4)
  {
    id v5 = [(OBPrivacySplashController *)self defaultButtonHandler];
    v5[2]();
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_languageToggleTapped
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(OBPrivacySplashController *)self additionalDisplayLanguageManager];
  id v4 = [(OBPrivacySplashController *)self displayLanguage];
  id v5 = [v3 didTapRightBarButtonItemForWelcomeController:self currentDisplayLanguage:v4];
  [(OBPrivacySplashController *)self setDisplayLanguage:v5];

  uint64_t v6 = [(OBPrivacySplashController *)self additionalDisplayLanguageManager];
  uint64_t v7 = [(OBPrivacySplashController *)self displayLanguage];
  [v6 configureNavigationItemRightBarButtonItemForWelcomeController:self currentDisplayLanguage:v7 action:sel__languageToggleTapped];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v8 = [(OBWelcomeController *)self contentView];
  uint64_t v9 = [v8 _allSubviews];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v13++) removeFromSuperview];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  [(OBPrivacySplashController *)self _initializeFromBundle];
  v14 = [(OBBaseWelcomeController *)self navigationItem];
  [v14 setTitle:0];
}

- (UIColor)customTintColor
{
  return self->_customTintColor;
}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  self->_underlineLinks = a3;
}

- (BOOL)suppressPerPageAnalyticsLogging
{
  return self->_suppressPerPageAnalyticsLogging;
}

- (void)setSuppressPerPageAnalyticsLogging:(BOOL)a3
{
  self->_suppressPerPageAnalyticsLogging = a3;
}

- (BOOL)allowsOpeningSafari
{
  return self->_allowsOpeningSafari;
}

- (void)setAllowsOpeningSafari:(BOOL)a3
{
  self->_allowsOpeningSafari = a3;
}

- (BOOL)showLinkToPrivacyGateway
{
  return self->_showLinkToPrivacyGateway;
}

- (void)setShowLinkToPrivacyGateway:(BOOL)a3
{
  self->_showLinkToPrivacyGateway = a3;
}

- (BOOL)showsLinkToUnifiedAbout
{
  return self->_showsLinkToUnifiedAbout;
}

- (void)setShowsLinkToUnifiedAbout:(BOOL)a3
{
  self->_showsLinkToUnifiedAbout = a3;
}

- (BOOL)forceLargeMargins
{
  return self->_forceLargeMargins;
}

- (void)setForceLargeMargins:(BOOL)a3
{
  self->_forceLargeMargins = a3;
}

- (NSString)displayLanguage
{
  return (NSString *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setDisplayLanguage:(id)a3
{
}

- (unint64_t)displayDeviceType
{
  return self->_displayDeviceType;
}

- (void)setDisplayDeviceType:(unint64_t)a3
{
  self->_displayDeviceType = a3;
}

- (BOOL)useModalStyle
{
  return self->_useModalStyle;
}

- (void)setUseModalStyle:(BOOL)a3
{
  self->_useModalStyle = a3;
}

- (BOOL)isCombined
{
  return self->_isCombined;
}

- (void)setIsCombined:(BOOL)a3
{
  self->_isCombined = a3;
}

- (OBPrivacyFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
}

- (UIButton)linkToPrivacyGatewayButton
{
  return (UIButton *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setLinkToPrivacyGatewayButton:(id)a3
{
}

- (UILabel)privacyGatewayDescription
{
  return (UILabel *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setPrivacyGatewayDescription:(id)a3
{
}

- (UILabel)linkToPrivacyGateway
{
  return (UILabel *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setLinkToPrivacyGateway:(id)a3
{
}

- (UIButton)unifiedAboutButton
{
  return (UIButton *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setUnifiedAboutButton:(id)a3
{
}

- (id)defaultButtonHandler
{
  return objc_getProperty(self, a2, 1256, 1);
}

- (void)setDefaultButtonHandler:(id)a3
{
}

- (OBAdditionalDisplayLanguageManager)additionalDisplayLanguageManager
{
  return self->_additionalDisplayLanguageManager;
}

- (void)setAdditionalDisplayLanguageManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalDisplayLanguageManager, 0);
  objc_storeStrong(&self->_defaultButtonHandler, 0);
  objc_storeStrong((id *)&self->_unifiedAboutButton, 0);
  objc_storeStrong((id *)&self->_linkToPrivacyGateway, 0);
  objc_storeStrong((id *)&self->_privacyGatewayDescription, 0);
  objc_storeStrong((id *)&self->_linkToPrivacyGatewayButton, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_displayLanguage, 0);
  objc_storeStrong((id *)&self->_customTintColor, 0);
}

@end